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
(declare-fun |wand_10#ft| (Bool T@U Real Bool T@U Real T@U Real) T@U)
(declare-fun |wand_10#sm| (Bool T@U Real Bool T@U Real T@U Real) T@U)
(declare-fun MapType0Type (T@T T@T) T@T)
(declare-fun MapType0TypeInv0 (T@T) T@T)
(declare-fun MapType0TypeInv1 (T@T) T@T)
(declare-fun MapType0Select (T@U T@U T@U) T@U)
(declare-fun MapType0Store (T@U T@U T@U T@U) T@U)
(declare-fun WandType_wand_10Type () T@T)
(declare-fun FrameTypeType () T@T)
(declare-fun succHeap (T@U T@U) Bool)
(declare-fun MapType1Type (T@T) T@T)
(declare-fun succHeapTrans (T@U T@U) Bool)
(declare-fun MapType1TypeInv0 (T@T) T@T)
(declare-fun MapType1Select (T@U T@U T@U) T@U)
(declare-fun MapType1Store (T@U T@U T@U T@U) T@U)
(declare-fun wand_5 (Bool Bool T@U Real) T@U)
(declare-fun getPredWandId (T@U) Int)
(declare-fun WandType_wand_5Type () T@T)
(declare-fun wand_9 (Bool T@U Real T@U Real Bool T@U Real T@U Real) T@U)
(declare-fun IsWandField (T@U) Bool)
(declare-fun WandType_wand_9Type () T@T)
(declare-fun |wand_9#ft| (Bool T@U Real T@U Real Bool T@U Real T@U Real) T@U)
(declare-fun |wand_9#sm| (Bool T@U Real T@U Real Bool T@U Real T@U Real) T@U)
(declare-fun IsPredicateField (T@U) Bool)
(declare-fun state (T@U T@U) Bool)
(declare-fun GoodMask (T@U) Bool)
(declare-fun wand_7 (Bool T@U Real) T@U)
(declare-fun WandType_wand_7Type () T@T)
(declare-fun |wand_7#ft| (Bool T@U Real) T@U)
(declare-fun wand_8 (T@U Real Bool) T@U)
(declare-fun WandType_wand_8Type () T@T)
(declare-fun |wand_8#ft| (T@U Real Bool) T@U)
(declare-fun wand_6 (Bool Bool) T@U)
(declare-fun WandType_wand_6Type () T@T)
(declare-fun |wand_6#ft| (Bool Bool) T@U)
(declare-fun P (T@U Bool) T@U)
(declare-fun PredicateType_PType () T@T)
(declare-fun |P#trigger| (T@U T@U) Bool)
(declare-fun |P#everUsed| (T@U) Bool)
(declare-fun IdenticalOnKnownLocations (T@U T@U T@U) Bool)
(declare-fun null () T@U)
(declare-fun PredicateMaskField (T@U) T@U)
(declare-fun HasDirectPerm (T@U T@U T@U) Bool)
(declare-fun |wand#ft| (Bool T@U Real T@U Real Bool) T@U)
(declare-fun |wand#sm| (Bool T@U Real T@U Real Bool) T@U)
(declare-fun WandType_wandType () T@T)
(declare-fun |wand_1#ft| (Bool Bool T@U Real T@U Real) T@U)
(declare-fun |wand_1#sm| (Bool Bool T@U Real T@U Real) T@U)
(declare-fun WandType_wand_1Type () T@T)
(declare-fun |wand_7#sm| (Bool T@U Real) T@U)
(declare-fun |wand_8#sm| (T@U Real Bool) T@U)
(declare-fun |P#sm| (T@U Bool) T@U)
(declare-fun wand_4 (Bool T@U Real T@U Real T@U Real T@U Real Bool T@U Real T@U Real) T@U)
(declare-fun WandType_wand_4Type () T@T)
(declare-fun |wand_4#ft| (Bool T@U Real T@U Real T@U Real T@U Real Bool T@U Real T@U Real) T@U)
(declare-fun |wand_3#ft| (Bool T@U Real T@U Real Bool T@U Real T@U Real T@U Real T@U Real Bool T@U Real T@U Real) T@U)
(declare-fun |wand_3#sm| (Bool T@U Real T@U Real Bool T@U Real T@U Real T@U Real T@U Real Bool T@U Real T@U Real) T@U)
(declare-fun WandType_wand_3Type () T@T)
(declare-fun wand_10 (Bool T@U Real Bool T@U Real T@U Real) T@U)
(declare-fun dummyHeap () T@U)
(declare-fun ZeroMask () T@U)
(declare-fun wand_2 (Bool T@U Real T@U Real T@U Real Bool T@U Real T@U Real) T@U)
(declare-fun WandType_wand_2Type () T@T)
(declare-fun InsidePredicate (T@U T@U T@U T@U) Bool)
(declare-fun wand_1 (Bool Bool T@U Real T@U Real) T@U)
(declare-fun sumMask (T@U T@U T@U) Bool)
(declare-fun |wand_5#ft| (Bool Bool T@U Real) T@U)
(declare-fun |wand_2#ft| (Bool T@U Real T@U Real T@U Real Bool T@U Real T@U Real) T@U)
(declare-fun ConditionalFrame (Real T@U) T@U)
(declare-fun EmptyFrame () T@U)
(declare-fun NoPerm () Real)
(declare-fun |wand_5#sm| (Bool Bool T@U Real) T@U)
(declare-fun wand (Bool T@U Real T@U Real Bool) T@U)
(declare-fun wand_3 (Bool T@U Real T@U Real Bool T@U Real T@U Real T@U Real T@U Real Bool T@U Real T@U Real) T@U)
(declare-fun FullPerm () Real)
(declare-fun |wand_4#sm| (Bool T@U Real T@U Real T@U Real T@U Real Bool T@U Real T@U Real) T@U)
(declare-fun |wand_6#sm| (Bool Bool) T@U)
(declare-fun |wand_2#sm| (Bool T@U Real T@U Real T@U Real Bool T@U Real T@U Real) T@U)
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
))) (= (Ctor NormalFieldType) 7)) (= (type $allocated) (FieldType NormalFieldType boolType))) (= (type f_7) (FieldType NormalFieldType boolType))) (= (type g) (FieldType NormalFieldType intType))) (= (Ctor RefType) 8)) (= (type h) (FieldType NormalFieldType RefType))))
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
))) (= (Ctor WandType_wand_10Type) 10)) (= (Ctor FrameTypeType) 11)) (forall ((arg0@@20 Bool) (arg1@@7 T@U) (arg2@@1 Real) (arg3@@0 Bool) (arg4 T@U) (arg5 Real) (arg6 T@U) (arg7 Real) ) (! (= (type (|wand_10#ft| arg0@@20 arg1@@7 arg2@@1 arg3@@0 arg4 arg5 arg6 arg7)) (FieldType WandType_wand_10Type FrameTypeType))
 :qid |funType:wand_10#ft|
 :pattern ( (|wand_10#ft| arg0@@20 arg1@@7 arg2@@1 arg3@@0 arg4 arg5 arg6 arg7))
))) (forall ((arg0@@21 Bool) (arg1@@8 T@U) (arg2@@2 Real) (arg3@@1 Bool) (arg4@@0 T@U) (arg5@@0 Real) (arg6@@0 T@U) (arg7@@0 Real) ) (! (= (type (|wand_10#sm| arg0@@21 arg1@@8 arg2@@2 arg3@@1 arg4@@0 arg5@@0 arg6@@0 arg7@@0)) (FieldType WandType_wand_10Type (MapType0Type RefType boolType)))
 :qid |funType:wand_10#sm|
 :pattern ( (|wand_10#sm| arg0@@21 arg1@@8 arg2@@2 arg3@@1 arg4@@0 arg5@@0 arg6@@0 arg7@@0))
))))
(assert (forall ((arg1@@9 Bool) (arg2@@3 T@U) (arg3@@2 Real) (arg4@@1 Bool) (arg5@@1 T@U) (arg6@@1 Real) (arg7@@1 T@U) (arg8 Real) ) (!  (=> (and (and (= (type arg2@@3) RefType) (= (type arg5@@1) RefType)) (= (type arg7@@1) RefType)) (= (|wand_10#sm| arg1@@9 arg2@@3 arg3@@2 arg4@@1 arg5@@1 arg6@@1 arg7@@1 arg8) (WandMaskField (|wand_10#ft| arg1@@9 arg2@@3 arg3@@2 arg4@@1 arg5@@1 arg6@@1 arg7@@1 arg8))))
 :qid |stdinbpl.199:15|
 :skolemid |26|
 :pattern ( (WandMaskField (|wand_10#ft| arg1@@9 arg2@@3 arg3@@2 arg4@@1 arg5@@1 arg6@@1 arg7@@1 arg8)))
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
(assert  (and (= (Ctor WandType_wand_5Type) 13) (forall ((arg0@@26 Bool) (arg1@@12 Bool) (arg2@@6 T@U) (arg3@@4 Real) ) (! (= (type (wand_5 arg0@@26 arg1@@12 arg2@@6 arg3@@4)) (FieldType WandType_wand_5Type intType))
 :qid |funType:wand_5|
 :pattern ( (wand_5 arg0@@26 arg1@@12 arg2@@6 arg3@@4))
))))
(assert (forall ((arg1@@13 Bool) (arg2@@7 Bool) (arg3@@5 T@U) (arg4@@2 Real) ) (!  (=> (= (type arg3@@5) RefType) (= (getPredWandId (wand_5 arg1@@13 arg2@@7 arg3@@5 arg4@@2)) 6))
 :qid |stdinbpl.363:15|
 :skolemid |62|
 :pattern ( (wand_5 arg1@@13 arg2@@7 arg3@@5 arg4@@2))
)))
(assert  (and (= (Ctor WandType_wand_9Type) 14) (forall ((arg0@@27 Bool) (arg1@@14 T@U) (arg2@@8 Real) (arg3@@6 T@U) (arg4@@3 Real) (arg5@@2 Bool) (arg6@@2 T@U) (arg7@@2 Real) (arg8@@0 T@U) (arg9 Real) ) (! (= (type (wand_9 arg0@@27 arg1@@14 arg2@@8 arg3@@6 arg4@@3 arg5@@2 arg6@@2 arg7@@2 arg8@@0 arg9)) (FieldType WandType_wand_9Type intType))
 :qid |funType:wand_9|
 :pattern ( (wand_9 arg0@@27 arg1@@14 arg2@@8 arg3@@6 arg4@@3 arg5@@2 arg6@@2 arg7@@2 arg8@@0 arg9))
))))
(assert (forall ((arg1@@15 Bool) (arg2@@9 T@U) (arg3@@7 Real) (arg4@@4 T@U) (arg5@@3 Real) (arg6@@3 Bool) (arg7@@3 T@U) (arg8@@1 Real) (arg9@@0 T@U) (arg10 Real) ) (!  (=> (and (and (and (= (type arg2@@9) RefType) (= (type arg4@@4) RefType)) (= (type arg7@@3) RefType)) (= (type arg9@@0) RefType)) (IsWandField (wand_9 arg1@@15 arg2@@9 arg3@@7 arg4@@4 arg5@@3 arg6@@3 arg7@@3 arg8@@1 arg9@@0 arg10)))
 :qid |stdinbpl.471:15|
 :skolemid |85|
 :pattern ( (wand_9 arg1@@15 arg2@@9 arg3@@7 arg4@@4 arg5@@3 arg6@@3 arg7@@3 arg8@@1 arg9@@0 arg10))
)))
(assert (forall ((arg0@@28 Bool) (arg1@@16 T@U) (arg2@@10 Real) (arg3@@8 T@U) (arg4@@5 Real) (arg5@@4 Bool) (arg6@@4 T@U) (arg7@@4 Real) (arg8@@2 T@U) (arg9@@1 Real) ) (! (= (type (|wand_9#ft| arg0@@28 arg1@@16 arg2@@10 arg3@@8 arg4@@5 arg5@@4 arg6@@4 arg7@@4 arg8@@2 arg9@@1)) (FieldType WandType_wand_9Type FrameTypeType))
 :qid |funType:wand_9#ft|
 :pattern ( (|wand_9#ft| arg0@@28 arg1@@16 arg2@@10 arg3@@8 arg4@@5 arg5@@4 arg6@@4 arg7@@4 arg8@@2 arg9@@1))
)))
(assert (forall ((arg1@@17 Bool) (arg2@@11 T@U) (arg3@@9 Real) (arg4@@6 T@U) (arg5@@5 Real) (arg6@@5 Bool) (arg7@@5 T@U) (arg8@@3 Real) (arg9@@2 T@U) (arg10@@0 Real) ) (!  (=> (and (and (and (= (type arg2@@11) RefType) (= (type arg4@@6) RefType)) (= (type arg7@@5) RefType)) (= (type arg9@@2) RefType)) (IsWandField (|wand_9#ft| arg1@@17 arg2@@11 arg3@@9 arg4@@6 arg5@@5 arg6@@5 arg7@@5 arg8@@3 arg9@@2 arg10@@0)))
 :qid |stdinbpl.475:15|
 :skolemid |86|
 :pattern ( (|wand_9#ft| arg1@@17 arg2@@11 arg3@@9 arg4@@6 arg5@@5 arg6@@5 arg7@@5 arg8@@3 arg9@@2 arg10@@0))
)))
(assert (forall ((arg0@@29 Bool) (arg1@@18 T@U) (arg2@@12 Real) (arg3@@10 T@U) (arg4@@7 Real) (arg5@@6 Bool) (arg6@@6 T@U) (arg7@@6 Real) (arg8@@4 T@U) (arg9@@3 Real) ) (! (= (type (|wand_9#sm| arg0@@29 arg1@@18 arg2@@12 arg3@@10 arg4@@7 arg5@@6 arg6@@6 arg7@@6 arg8@@4 arg9@@3)) (FieldType WandType_wand_9Type (MapType0Type RefType boolType)))
 :qid |funType:wand_9#sm|
 :pattern ( (|wand_9#sm| arg0@@29 arg1@@18 arg2@@12 arg3@@10 arg4@@7 arg5@@6 arg6@@6 arg7@@6 arg8@@4 arg9@@3))
)))
(assert (forall ((arg1@@19 Bool) (arg2@@13 T@U) (arg3@@11 Real) (arg4@@8 T@U) (arg5@@7 Real) (arg6@@7 Bool) (arg7@@7 T@U) (arg8@@5 Real) (arg9@@4 T@U) (arg10@@1 Real) ) (!  (=> (and (and (and (= (type arg2@@13) RefType) (= (type arg4@@8) RefType)) (= (type arg7@@7) RefType)) (= (type arg9@@4) RefType)) (= (|wand_9#sm| arg1@@19 arg2@@13 arg3@@11 arg4@@8 arg5@@7 arg6@@7 arg7@@7 arg8@@5 arg9@@4 arg10@@1) (WandMaskField (|wand_9#ft| arg1@@19 arg2@@13 arg3@@11 arg4@@8 arg5@@7 arg6@@7 arg7@@7 arg8@@5 arg9@@4 arg10@@1))))
 :qid |stdinbpl.487:15|
 :skolemid |89|
 :pattern ( (WandMaskField (|wand_9#ft| arg1@@19 arg2@@13 arg3@@11 arg4@@8 arg5@@7 arg6@@7 arg7@@7 arg8@@5 arg9@@4 arg10@@1)))
)))
(assert (forall ((arg1@@20 Bool) (arg2@@14 T@U) (arg3@@12 Real) (arg4@@9 T@U) (arg5@@8 Real) (arg6@@8 Bool) (arg7@@8 T@U) (arg8@@6 Real) (arg9@@5 T@U) (arg10@@2 Real) ) (!  (=> (and (and (and (= (type arg2@@14) RefType) (= (type arg4@@9) RefType)) (= (type arg7@@8) RefType)) (= (type arg9@@5) RefType)) (not (IsPredicateField (wand_9 arg1@@20 arg2@@14 arg3@@12 arg4@@9 arg5@@8 arg6@@8 arg7@@8 arg8@@6 arg9@@5 arg10@@2))))
 :qid |stdinbpl.479:15|
 :skolemid |87|
 :pattern ( (wand_9 arg1@@20 arg2@@14 arg3@@12 arg4@@9 arg5@@8 arg6@@8 arg7@@8 arg8@@6 arg9@@5 arg10@@2))
)))
(assert (forall ((arg1@@21 Bool) (arg2@@15 T@U) (arg3@@13 Real) (arg4@@10 T@U) (arg5@@9 Real) (arg6@@9 Bool) (arg7@@9 T@U) (arg8@@7 Real) (arg9@@6 T@U) (arg10@@3 Real) ) (!  (=> (and (and (and (= (type arg2@@15) RefType) (= (type arg4@@10) RefType)) (= (type arg7@@9) RefType)) (= (type arg9@@6) RefType)) (not (IsPredicateField (|wand_9#ft| arg1@@21 arg2@@15 arg3@@13 arg4@@10 arg5@@9 arg6@@9 arg7@@9 arg8@@7 arg9@@6 arg10@@3))))
 :qid |stdinbpl.483:15|
 :skolemid |88|
 :pattern ( (|wand_9#ft| arg1@@21 arg2@@15 arg3@@13 arg4@@10 arg5@@9 arg6@@9 arg7@@9 arg8@@7 arg9@@6 arg10@@3))
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
(assert  (and (= (Ctor WandType_wand_7Type) 15) (forall ((arg0@@30 Bool) (arg1@@22 T@U) (arg2@@16 Real) ) (! (= (type (wand_7 arg0@@30 arg1@@22 arg2@@16)) (FieldType WandType_wand_7Type intType))
 :qid |funType:wand_7|
 :pattern ( (wand_7 arg0@@30 arg1@@22 arg2@@16))
))))
(assert (forall ((arg1@@23 Bool) (arg2@@17 T@U) (arg3@@14 Real) ) (!  (=> (= (type arg2@@17) RefType) (IsWandField (wand_7 arg1@@23 arg2@@17 arg3@@14)))
 :qid |stdinbpl.247:15|
 :skolemid |36|
 :pattern ( (wand_7 arg1@@23 arg2@@17 arg3@@14))
)))
(assert (forall ((arg0@@31 Bool) (arg1@@24 T@U) (arg2@@18 Real) ) (! (= (type (|wand_7#ft| arg0@@31 arg1@@24 arg2@@18)) (FieldType WandType_wand_7Type FrameTypeType))
 :qid |funType:wand_7#ft|
 :pattern ( (|wand_7#ft| arg0@@31 arg1@@24 arg2@@18))
)))
(assert (forall ((arg1@@25 Bool) (arg2@@19 T@U) (arg3@@15 Real) ) (!  (=> (= (type arg2@@19) RefType) (IsWandField (|wand_7#ft| arg1@@25 arg2@@19 arg3@@15)))
 :qid |stdinbpl.251:15|
 :skolemid |37|
 :pattern ( (|wand_7#ft| arg1@@25 arg2@@19 arg3@@15))
)))
(assert  (and (= (Ctor WandType_wand_8Type) 16) (forall ((arg0@@32 T@U) (arg1@@26 Real) (arg2@@20 Bool) ) (! (= (type (wand_8 arg0@@32 arg1@@26 arg2@@20)) (FieldType WandType_wand_8Type intType))
 :qid |funType:wand_8|
 :pattern ( (wand_8 arg0@@32 arg1@@26 arg2@@20))
))))
(assert (forall ((arg1@@27 T@U) (arg2@@21 Real) (arg3@@16 Bool) ) (!  (=> (= (type arg1@@27) RefType) (IsWandField (wand_8 arg1@@27 arg2@@21 arg3@@16)))
 :qid |stdinbpl.503:15|
 :skolemid |92|
 :pattern ( (wand_8 arg1@@27 arg2@@21 arg3@@16))
)))
(assert (forall ((arg0@@33 T@U) (arg1@@28 Real) (arg2@@22 Bool) ) (! (= (type (|wand_8#ft| arg0@@33 arg1@@28 arg2@@22)) (FieldType WandType_wand_8Type FrameTypeType))
 :qid |funType:wand_8#ft|
 :pattern ( (|wand_8#ft| arg0@@33 arg1@@28 arg2@@22))
)))
(assert (forall ((arg1@@29 T@U) (arg2@@23 Real) (arg3@@17 Bool) ) (!  (=> (= (type arg1@@29) RefType) (IsWandField (|wand_8#ft| arg1@@29 arg2@@23 arg3@@17)))
 :qid |stdinbpl.507:15|
 :skolemid |93|
 :pattern ( (|wand_8#ft| arg1@@29 arg2@@23 arg3@@17))
)))
(assert (forall ((arg1@@30 Bool) (arg2@@24 T@U) (arg3@@18 Real) ) (!  (=> (= (type arg2@@24) RefType) (= (getPredWandId (wand_7 arg1@@30 arg2@@24 arg3@@18)) 3))
 :qid |stdinbpl.267:15|
 :skolemid |41|
 :pattern ( (wand_7 arg1@@30 arg2@@24 arg3@@18))
)))
(assert (forall ((arg1@@31 T@U) (arg2@@25 Real) (arg3@@19 Bool) ) (!  (=> (= (type arg1@@31) RefType) (= (getPredWandId (wand_8 arg1@@31 arg2@@25 arg3@@19)) 11))
 :qid |stdinbpl.523:15|
 :skolemid |97|
 :pattern ( (wand_8 arg1@@31 arg2@@25 arg3@@19))
)))
(assert (forall ((arg1@@32 Bool) (arg2@@26 T@U) (arg3@@20 Real) ) (!  (=> (= (type arg2@@26) RefType) (not (IsPredicateField (wand_7 arg1@@32 arg2@@26 arg3@@20))))
 :qid |stdinbpl.255:15|
 :skolemid |38|
 :pattern ( (wand_7 arg1@@32 arg2@@26 arg3@@20))
)))
(assert (forall ((arg1@@33 Bool) (arg2@@27 T@U) (arg3@@21 Real) ) (!  (=> (= (type arg2@@27) RefType) (not (IsPredicateField (|wand_7#ft| arg1@@33 arg2@@27 arg3@@21))))
 :qid |stdinbpl.259:15|
 :skolemid |39|
 :pattern ( (|wand_7#ft| arg1@@33 arg2@@27 arg3@@21))
)))
(assert (forall ((arg1@@34 T@U) (arg2@@28 Real) (arg3@@22 Bool) ) (!  (=> (= (type arg1@@34) RefType) (not (IsPredicateField (wand_8 arg1@@34 arg2@@28 arg3@@22))))
 :qid |stdinbpl.511:15|
 :skolemid |94|
 :pattern ( (wand_8 arg1@@34 arg2@@28 arg3@@22))
)))
(assert (forall ((arg1@@35 T@U) (arg2@@29 Real) (arg3@@23 Bool) ) (!  (=> (= (type arg1@@35) RefType) (not (IsPredicateField (|wand_8#ft| arg1@@35 arg2@@29 arg3@@23))))
 :qid |stdinbpl.515:15|
 :skolemid |95|
 :pattern ( (|wand_8#ft| arg1@@35 arg2@@29 arg3@@23))
)))
(assert  (and (= (Ctor WandType_wand_6Type) 17) (forall ((arg0@@34 Bool) (arg1@@36 Bool) ) (! (= (type (wand_6 arg0@@34 arg1@@36)) (FieldType WandType_wand_6Type intType))
 :qid |funType:wand_6|
 :pattern ( (wand_6 arg0@@34 arg1@@36))
))))
(assert (forall ((arg1@@37 Bool) (arg2@@30 Bool) ) (! (IsWandField (wand_6 arg1@@37 arg2@@30))
 :qid |stdinbpl.439:15|
 :skolemid |78|
 :pattern ( (wand_6 arg1@@37 arg2@@30))
)))
(assert (forall ((arg0@@35 Bool) (arg1@@38 Bool) ) (! (= (type (|wand_6#ft| arg0@@35 arg1@@38)) (FieldType WandType_wand_6Type FrameTypeType))
 :qid |funType:wand_6#ft|
 :pattern ( (|wand_6#ft| arg0@@35 arg1@@38))
)))
(assert (forall ((arg1@@39 Bool) (arg2@@31 Bool) ) (! (IsWandField (|wand_6#ft| arg1@@39 arg2@@31))
 :qid |stdinbpl.443:15|
 :skolemid |79|
 :pattern ( (|wand_6#ft| arg1@@39 arg2@@31))
)))
(assert  (and (= (Ctor PredicateType_PType) 18) (forall ((arg0@@36 T@U) (arg1@@40 Bool) ) (! (= (type (P arg0@@36 arg1@@40)) (FieldType PredicateType_PType FrameTypeType))
 :qid |funType:P|
 :pattern ( (P arg0@@36 arg1@@40))
))))
(assert (forall ((x@@8 T@U) (b_2 Bool) ) (!  (=> (= (type x@@8) RefType) (IsPredicateField (P x@@8 b_2)))
 :qid |stdinbpl.557:15|
 :skolemid |100|
 :pattern ( (P x@@8 b_2))
)))
(assert (forall ((Heap@@0 T@U) (x@@9 T@U) (b_2@@0 Bool) ) (!  (=> (and (= (type Heap@@0) (MapType1Type RefType)) (= (type x@@9) RefType)) (|P#everUsed| (P x@@9 b_2@@0)))
 :qid |stdinbpl.576:15|
 :skolemid |104|
 :pattern ( (|P#trigger| Heap@@0 (P x@@9 b_2@@0)))
)))
(assert  (and (= (type null) RefType) (forall ((arg0@@37 T@U) ) (! (let ((A@@0 (FieldTypeInv0 (type arg0@@37))))
(= (type (PredicateMaskField arg0@@37)) (FieldType A@@0 (MapType0Type RefType boolType))))
 :qid |funType:PredicateMaskField|
 :pattern ( (PredicateMaskField arg0@@37))
))))
(assert (forall ((Heap@@1 T@U) (ExhaleHeap T@U) (Mask@@0 T@U) (pm_f T@U) ) (! (let ((C (FieldTypeInv0 (type pm_f))))
 (=> (and (and (and (and (and (= (type Heap@@1) (MapType1Type RefType)) (= (type ExhaleHeap) (MapType1Type RefType))) (= (type Mask@@0) (MapType0Type RefType realType))) (= (type pm_f) (FieldType C FrameTypeType))) (IdenticalOnKnownLocations Heap@@1 ExhaleHeap Mask@@0)) (and (HasDirectPerm Mask@@0 null pm_f) (IsPredicateField pm_f))) (= (MapType1Select Heap@@1 null (PredicateMaskField pm_f)) (MapType1Select ExhaleHeap null (PredicateMaskField pm_f)))))
 :qid |stdinbpl.47:19|
 :skolemid |2|
 :pattern ( (IdenticalOnKnownLocations Heap@@1 ExhaleHeap Mask@@0) (IsPredicateField pm_f) (MapType1Select ExhaleHeap null (PredicateMaskField pm_f)))
)))
(assert (forall ((Heap@@2 T@U) (ExhaleHeap@@0 T@U) (Mask@@1 T@U) (pm_f@@0 T@U) ) (! (let ((C@@0 (FieldTypeInv0 (type pm_f@@0))))
 (=> (and (and (and (and (and (= (type Heap@@2) (MapType1Type RefType)) (= (type ExhaleHeap@@0) (MapType1Type RefType))) (= (type Mask@@1) (MapType0Type RefType realType))) (= (type pm_f@@0) (FieldType C@@0 FrameTypeType))) (IdenticalOnKnownLocations Heap@@2 ExhaleHeap@@0 Mask@@1)) (and (HasDirectPerm Mask@@1 null pm_f@@0) (IsWandField pm_f@@0))) (= (MapType1Select Heap@@2 null (WandMaskField pm_f@@0)) (MapType1Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))))
 :qid |stdinbpl.60:19|
 :skolemid |5|
 :pattern ( (IdenticalOnKnownLocations Heap@@2 ExhaleHeap@@0 Mask@@1) (IsWandField pm_f@@0) (MapType1Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))
)))
(assert (forall ((arg1@@41 Bool) (arg2@@32 Bool) ) (!  (not (IsPredicateField (wand_6 arg1@@41 arg2@@32)))
 :qid |stdinbpl.447:15|
 :skolemid |80|
 :pattern ( (wand_6 arg1@@41 arg2@@32))
)))
(assert (forall ((arg1@@42 Bool) (arg2@@33 Bool) ) (!  (not (IsPredicateField (|wand_6#ft| arg1@@42 arg2@@33)))
 :qid |stdinbpl.451:15|
 :skolemid |81|
 :pattern ( (|wand_6#ft| arg1@@42 arg2@@33))
)))
(assert (forall ((arg1@@43 T@U) (arg2@@34 Real) (arg3@@24 Bool) (arg1_2 T@U) (arg2_2 Real) (arg3_2 Bool) ) (!  (=> (and (and (= (type arg1@@43) RefType) (= (type arg1_2) RefType)) (= (wand_8 arg1@@43 arg2@@34 arg3@@24) (wand_8 arg1_2 arg2_2 arg3_2))) (and (= arg1@@43 arg1_2) (and (= arg2@@34 arg2_2) (= arg3@@24 arg3_2))))
 :qid |stdinbpl.527:15|
 :skolemid |98|
 :pattern ( (wand_8 arg1@@43 arg2@@34 arg3@@24) (wand_8 arg1_2 arg2_2 arg3_2))
)))
(assert  (and (and (= (Ctor WandType_wandType) 19) (forall ((arg0@@38 Bool) (arg1@@44 T@U) (arg2@@35 Real) (arg3@@25 T@U) (arg4@@11 Real) (arg5@@10 Bool) ) (! (= (type (|wand#ft| arg0@@38 arg1@@44 arg2@@35 arg3@@25 arg4@@11 arg5@@10)) (FieldType WandType_wandType FrameTypeType))
 :qid |funType:wand#ft|
 :pattern ( (|wand#ft| arg0@@38 arg1@@44 arg2@@35 arg3@@25 arg4@@11 arg5@@10))
))) (forall ((arg0@@39 Bool) (arg1@@45 T@U) (arg2@@36 Real) (arg3@@26 T@U) (arg4@@12 Real) (arg5@@11 Bool) ) (! (= (type (|wand#sm| arg0@@39 arg1@@45 arg2@@36 arg3@@26 arg4@@12 arg5@@11)) (FieldType WandType_wandType (MapType0Type RefType boolType)))
 :qid |funType:wand#sm|
 :pattern ( (|wand#sm| arg0@@39 arg1@@45 arg2@@36 arg3@@26 arg4@@12 arg5@@11))
))))
(assert (forall ((arg1@@46 Bool) (arg2@@37 T@U) (arg3@@27 Real) (arg4@@13 T@U) (arg5@@12 Real) (arg6@@10 Bool) ) (!  (=> (and (= (type arg2@@37) RefType) (= (type arg4@@13) RefType)) (= (|wand#sm| arg1@@46 arg2@@37 arg3@@27 arg4@@13 arg5@@12 arg6@@10) (WandMaskField (|wand#ft| arg1@@46 arg2@@37 arg3@@27 arg4@@13 arg5@@12 arg6@@10))))
 :qid |stdinbpl.295:15|
 :skolemid |47|
 :pattern ( (WandMaskField (|wand#ft| arg1@@46 arg2@@37 arg3@@27 arg4@@13 arg5@@12 arg6@@10)))
)))
(assert  (and (and (= (Ctor WandType_wand_1Type) 20) (forall ((arg0@@40 Bool) (arg1@@47 Bool) (arg2@@38 T@U) (arg3@@28 Real) (arg4@@14 T@U) (arg5@@13 Real) ) (! (= (type (|wand_1#ft| arg0@@40 arg1@@47 arg2@@38 arg3@@28 arg4@@14 arg5@@13)) (FieldType WandType_wand_1Type FrameTypeType))
 :qid |funType:wand_1#ft|
 :pattern ( (|wand_1#ft| arg0@@40 arg1@@47 arg2@@38 arg3@@28 arg4@@14 arg5@@13))
))) (forall ((arg0@@41 Bool) (arg1@@48 Bool) (arg2@@39 T@U) (arg3@@29 Real) (arg4@@15 T@U) (arg5@@14 Real) ) (! (= (type (|wand_1#sm| arg0@@41 arg1@@48 arg2@@39 arg3@@29 arg4@@15 arg5@@14)) (FieldType WandType_wand_1Type (MapType0Type RefType boolType)))
 :qid |funType:wand_1#sm|
 :pattern ( (|wand_1#sm| arg0@@41 arg1@@48 arg2@@39 arg3@@29 arg4@@15 arg5@@14))
))))
(assert (forall ((arg1@@49 Bool) (arg2@@40 Bool) (arg3@@30 T@U) (arg4@@16 Real) (arg5@@15 T@U) (arg6@@11 Real) ) (!  (=> (and (= (type arg3@@30) RefType) (= (type arg5@@15) RefType)) (= (|wand_1#sm| arg1@@49 arg2@@40 arg3@@30 arg4@@16 arg5@@15 arg6@@11) (WandMaskField (|wand_1#ft| arg1@@49 arg2@@40 arg3@@30 arg4@@16 arg5@@15 arg6@@11))))
 :qid |stdinbpl.423:15|
 :skolemid |75|
 :pattern ( (WandMaskField (|wand_1#ft| arg1@@49 arg2@@40 arg3@@30 arg4@@16 arg5@@15 arg6@@11)))
)))
(assert (forall ((arg0@@42 Bool) (arg1@@50 T@U) (arg2@@41 Real) ) (! (= (type (|wand_7#sm| arg0@@42 arg1@@50 arg2@@41)) (FieldType WandType_wand_7Type (MapType0Type RefType boolType)))
 :qid |funType:wand_7#sm|
 :pattern ( (|wand_7#sm| arg0@@42 arg1@@50 arg2@@41))
)))
(assert (forall ((arg1@@51 Bool) (arg2@@42 T@U) (arg3@@31 Real) ) (!  (=> (= (type arg2@@42) RefType) (= (|wand_7#sm| arg1@@51 arg2@@42 arg3@@31) (WandMaskField (|wand_7#ft| arg1@@51 arg2@@42 arg3@@31))))
 :qid |stdinbpl.263:15|
 :skolemid |40|
 :pattern ( (WandMaskField (|wand_7#ft| arg1@@51 arg2@@42 arg3@@31)))
)))
(assert (forall ((arg0@@43 T@U) (arg1@@52 Real) (arg2@@43 Bool) ) (! (= (type (|wand_8#sm| arg0@@43 arg1@@52 arg2@@43)) (FieldType WandType_wand_8Type (MapType0Type RefType boolType)))
 :qid |funType:wand_8#sm|
 :pattern ( (|wand_8#sm| arg0@@43 arg1@@52 arg2@@43))
)))
(assert (forall ((arg1@@53 T@U) (arg2@@44 Real) (arg3@@32 Bool) ) (!  (=> (= (type arg1@@53) RefType) (= (|wand_8#sm| arg1@@53 arg2@@44 arg3@@32) (WandMaskField (|wand_8#ft| arg1@@53 arg2@@44 arg3@@32))))
 :qid |stdinbpl.519:15|
 :skolemid |96|
 :pattern ( (WandMaskField (|wand_8#ft| arg1@@53 arg2@@44 arg3@@32)))
)))
(assert (forall ((x@@10 T@U) (b_2@@1 Bool) (x2 T@U) (b2 Bool) ) (!  (=> (and (and (= (type x@@10) RefType) (= (type x2) RefType)) (= (P x@@10 b_2@@1) (P x2 b2))) (and (= x@@10 x2) (= b_2@@1 b2)))
 :qid |stdinbpl.567:15|
 :skolemid |102|
 :pattern ( (P x@@10 b_2@@1) (P x2 b2))
)))
(assert (forall ((arg0@@44 T@U) (arg1@@54 Bool) ) (! (= (type (|P#sm| arg0@@44 arg1@@54)) (FieldType PredicateType_PType (MapType0Type RefType boolType)))
 :qid |funType:P#sm|
 :pattern ( (|P#sm| arg0@@44 arg1@@54))
)))
(assert (forall ((x@@11 T@U) (b_2@@2 Bool) (x2@@0 T@U) (b2@@0 Bool) ) (!  (=> (and (and (= (type x@@11) RefType) (= (type x2@@0) RefType)) (= (|P#sm| x@@11 b_2@@2) (|P#sm| x2@@0 b2@@0))) (and (= x@@11 x2@@0) (= b_2@@2 b2@@0)))
 :qid |stdinbpl.571:15|
 :skolemid |103|
 :pattern ( (|P#sm| x@@11 b_2@@2) (|P#sm| x2@@0 b2@@0))
)))
(assert  (and (= (Ctor WandType_wand_4Type) 21) (forall ((arg0@@45 Bool) (arg1@@55 T@U) (arg2@@45 Real) (arg3@@33 T@U) (arg4@@17 Real) (arg5@@16 T@U) (arg6@@12 Real) (arg7@@10 T@U) (arg8@@8 Real) (arg9@@7 Bool) (arg10@@4 T@U) (arg11 Real) (arg12 T@U) (arg13 Real) ) (! (= (type (wand_4 arg0@@45 arg1@@55 arg2@@45 arg3@@33 arg4@@17 arg5@@16 arg6@@12 arg7@@10 arg8@@8 arg9@@7 arg10@@4 arg11 arg12 arg13)) (FieldType WandType_wand_4Type intType))
 :qid |funType:wand_4|
 :pattern ( (wand_4 arg0@@45 arg1@@55 arg2@@45 arg3@@33 arg4@@17 arg5@@16 arg6@@12 arg7@@10 arg8@@8 arg9@@7 arg10@@4 arg11 arg12 arg13))
))))
(assert (forall ((arg1@@56 Bool) (arg2@@46 T@U) (arg3@@34 Real) (arg4@@18 T@U) (arg5@@17 Real) (arg6@@13 T@U) (arg7@@11 Real) (arg8@@9 T@U) (arg9@@8 Real) (arg10@@5 Bool) (arg11@@0 T@U) (arg12@@0 Real) (arg13@@0 T@U) (arg14 Real) ) (!  (=> (and (and (and (and (and (= (type arg2@@46) RefType) (= (type arg4@@18) RefType)) (= (type arg6@@13) RefType)) (= (type arg8@@9) RefType)) (= (type arg11@@0) RefType)) (= (type arg13@@0) RefType)) (IsWandField (wand_4 arg1@@56 arg2@@46 arg3@@34 arg4@@18 arg5@@17 arg6@@13 arg7@@11 arg8@@9 arg9@@8 arg10@@5 arg11@@0 arg12@@0 arg13@@0 arg14)))
 :qid |stdinbpl.311:15|
 :skolemid |50|
 :pattern ( (wand_4 arg1@@56 arg2@@46 arg3@@34 arg4@@18 arg5@@17 arg6@@13 arg7@@11 arg8@@9 arg9@@8 arg10@@5 arg11@@0 arg12@@0 arg13@@0 arg14))
)))
(assert (forall ((arg0@@46 Bool) (arg1@@57 T@U) (arg2@@47 Real) (arg3@@35 T@U) (arg4@@19 Real) (arg5@@18 T@U) (arg6@@14 Real) (arg7@@12 T@U) (arg8@@10 Real) (arg9@@9 Bool) (arg10@@6 T@U) (arg11@@1 Real) (arg12@@1 T@U) (arg13@@1 Real) ) (! (= (type (|wand_4#ft| arg0@@46 arg1@@57 arg2@@47 arg3@@35 arg4@@19 arg5@@18 arg6@@14 arg7@@12 arg8@@10 arg9@@9 arg10@@6 arg11@@1 arg12@@1 arg13@@1)) (FieldType WandType_wand_4Type FrameTypeType))
 :qid |funType:wand_4#ft|
 :pattern ( (|wand_4#ft| arg0@@46 arg1@@57 arg2@@47 arg3@@35 arg4@@19 arg5@@18 arg6@@14 arg7@@12 arg8@@10 arg9@@9 arg10@@6 arg11@@1 arg12@@1 arg13@@1))
)))
(assert (forall ((arg1@@58 Bool) (arg2@@48 T@U) (arg3@@36 Real) (arg4@@20 T@U) (arg5@@19 Real) (arg6@@15 T@U) (arg7@@13 Real) (arg8@@11 T@U) (arg9@@10 Real) (arg10@@7 Bool) (arg11@@2 T@U) (arg12@@2 Real) (arg13@@2 T@U) (arg14@@0 Real) ) (!  (=> (and (and (and (and (and (= (type arg2@@48) RefType) (= (type arg4@@20) RefType)) (= (type arg6@@15) RefType)) (= (type arg8@@11) RefType)) (= (type arg11@@2) RefType)) (= (type arg13@@2) RefType)) (IsWandField (|wand_4#ft| arg1@@58 arg2@@48 arg3@@36 arg4@@20 arg5@@19 arg6@@15 arg7@@13 arg8@@11 arg9@@10 arg10@@7 arg11@@2 arg12@@2 arg13@@2 arg14@@0)))
 :qid |stdinbpl.315:15|
 :skolemid |51|
 :pattern ( (|wand_4#ft| arg1@@58 arg2@@48 arg3@@36 arg4@@20 arg5@@19 arg6@@15 arg7@@13 arg8@@11 arg9@@10 arg10@@7 arg11@@2 arg12@@2 arg13@@2 arg14@@0))
)))
(assert (forall ((Heap@@3 T@U) (ExhaleHeap@@1 T@U) (Mask@@2 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@3) (MapType1Type RefType)) (= (type ExhaleHeap@@1) (MapType1Type RefType))) (= (type Mask@@2) (MapType0Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@3 ExhaleHeap@@1 Mask@@2)) (U_2_bool (MapType1Select Heap@@3 o_1 $allocated))) (U_2_bool (MapType1Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.73:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@3 ExhaleHeap@@1 Mask@@2) (MapType1Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert (forall ((arg1@@59 Bool) (arg2@@49 T@U) (arg3@@37 Real) (arg4@@21 T@U) (arg5@@20 Real) (arg6@@16 T@U) (arg7@@14 Real) (arg8@@12 T@U) (arg9@@11 Real) (arg10@@8 Bool) (arg11@@3 T@U) (arg12@@3 Real) (arg13@@3 T@U) (arg14@@1 Real) ) (!  (=> (and (and (and (and (and (= (type arg2@@49) RefType) (= (type arg4@@21) RefType)) (= (type arg6@@16) RefType)) (= (type arg8@@12) RefType)) (= (type arg11@@3) RefType)) (= (type arg13@@3) RefType)) (not (IsPredicateField (wand_4 arg1@@59 arg2@@49 arg3@@37 arg4@@21 arg5@@20 arg6@@16 arg7@@14 arg8@@12 arg9@@11 arg10@@8 arg11@@3 arg12@@3 arg13@@3 arg14@@1))))
 :qid |stdinbpl.319:15|
 :skolemid |52|
 :pattern ( (wand_4 arg1@@59 arg2@@49 arg3@@37 arg4@@21 arg5@@20 arg6@@16 arg7@@14 arg8@@12 arg9@@11 arg10@@8 arg11@@3 arg12@@3 arg13@@3 arg14@@1))
)))
(assert (forall ((arg1@@60 Bool) (arg2@@50 T@U) (arg3@@38 Real) (arg4@@22 T@U) (arg5@@21 Real) (arg6@@17 T@U) (arg7@@15 Real) (arg8@@13 T@U) (arg9@@12 Real) (arg10@@9 Bool) (arg11@@4 T@U) (arg12@@4 Real) (arg13@@4 T@U) (arg14@@2 Real) ) (!  (=> (and (and (and (and (and (= (type arg2@@50) RefType) (= (type arg4@@22) RefType)) (= (type arg6@@17) RefType)) (= (type arg8@@13) RefType)) (= (type arg11@@4) RefType)) (= (type arg13@@4) RefType)) (not (IsPredicateField (|wand_4#ft| arg1@@60 arg2@@50 arg3@@38 arg4@@22 arg5@@21 arg6@@17 arg7@@15 arg8@@13 arg9@@12 arg10@@9 arg11@@4 arg12@@4 arg13@@4 arg14@@2))))
 :qid |stdinbpl.323:15|
 :skolemid |53|
 :pattern ( (|wand_4#ft| arg1@@60 arg2@@50 arg3@@38 arg4@@22 arg5@@21 arg6@@17 arg7@@15 arg8@@13 arg9@@12 arg10@@9 arg11@@4 arg12@@4 arg13@@4 arg14@@2))
)))
(assert  (and (and (= (Ctor WandType_wand_3Type) 22) (forall ((arg0@@47 Bool) (arg1@@61 T@U) (arg2@@51 Real) (arg3@@39 T@U) (arg4@@23 Real) (arg5@@22 Bool) (arg6@@18 T@U) (arg7@@16 Real) (arg8@@14 T@U) (arg9@@13 Real) (arg10@@10 T@U) (arg11@@5 Real) (arg12@@5 T@U) (arg13@@5 Real) (arg14@@3 Bool) (arg15 T@U) (arg16 Real) (arg17 T@U) (arg18 Real) ) (! (= (type (|wand_3#ft| arg0@@47 arg1@@61 arg2@@51 arg3@@39 arg4@@23 arg5@@22 arg6@@18 arg7@@16 arg8@@14 arg9@@13 arg10@@10 arg11@@5 arg12@@5 arg13@@5 arg14@@3 arg15 arg16 arg17 arg18)) (FieldType WandType_wand_3Type FrameTypeType))
 :qid |funType:wand_3#ft|
 :pattern ( (|wand_3#ft| arg0@@47 arg1@@61 arg2@@51 arg3@@39 arg4@@23 arg5@@22 arg6@@18 arg7@@16 arg8@@14 arg9@@13 arg10@@10 arg11@@5 arg12@@5 arg13@@5 arg14@@3 arg15 arg16 arg17 arg18))
))) (forall ((arg0@@48 Bool) (arg1@@62 T@U) (arg2@@52 Real) (arg3@@40 T@U) (arg4@@24 Real) (arg5@@23 Bool) (arg6@@19 T@U) (arg7@@17 Real) (arg8@@15 T@U) (arg9@@14 Real) (arg10@@11 T@U) (arg11@@6 Real) (arg12@@6 T@U) (arg13@@6 Real) (arg14@@4 Bool) (arg15@@0 T@U) (arg16@@0 Real) (arg17@@0 T@U) (arg18@@0 Real) ) (! (= (type (|wand_3#sm| arg0@@48 arg1@@62 arg2@@52 arg3@@40 arg4@@24 arg5@@23 arg6@@19 arg7@@17 arg8@@15 arg9@@14 arg10@@11 arg11@@6 arg12@@6 arg13@@6 arg14@@4 arg15@@0 arg16@@0 arg17@@0 arg18@@0)) (FieldType WandType_wand_3Type (MapType0Type RefType boolType)))
 :qid |funType:wand_3#sm|
 :pattern ( (|wand_3#sm| arg0@@48 arg1@@62 arg2@@52 arg3@@40 arg4@@24 arg5@@23 arg6@@19 arg7@@17 arg8@@15 arg9@@14 arg10@@11 arg11@@6 arg12@@6 arg13@@6 arg14@@4 arg15@@0 arg16@@0 arg17@@0 arg18@@0))
))))
(assert (forall ((arg1@@63 Bool) (arg2@@53 T@U) (arg3@@41 Real) (arg4@@25 T@U) (arg5@@24 Real) (arg6@@20 Bool) (arg7@@18 T@U) (arg8@@16 Real) (arg9@@15 T@U) (arg10@@12 Real) (arg11@@7 T@U) (arg12@@7 Real) (arg13@@7 T@U) (arg14@@5 Real) (arg15@@1 Bool) (arg16@@1 T@U) (arg17@@1 Real) (arg18@@1 T@U) (arg19 Real) ) (!  (=> (and (and (and (and (and (and (and (= (type arg2@@53) RefType) (= (type arg4@@25) RefType)) (= (type arg7@@18) RefType)) (= (type arg9@@15) RefType)) (= (type arg11@@7) RefType)) (= (type arg13@@7) RefType)) (= (type arg16@@1) RefType)) (= (type arg18@@1) RefType)) (= (|wand_3#sm| arg1@@63 arg2@@53 arg3@@41 arg4@@25 arg5@@24 arg6@@20 arg7@@18 arg8@@16 arg9@@15 arg10@@12 arg11@@7 arg12@@7 arg13@@7 arg14@@5 arg15@@1 arg16@@1 arg17@@1 arg18@@1 arg19) (WandMaskField (|wand_3#ft| arg1@@63 arg2@@53 arg3@@41 arg4@@25 arg5@@24 arg6@@20 arg7@@18 arg8@@16 arg9@@15 arg10@@12 arg11@@7 arg12@@7 arg13@@7 arg14@@5 arg15@@1 arg16@@1 arg17@@1 arg18@@1 arg19))))
 :qid |stdinbpl.391:15|
 :skolemid |68|
 :pattern ( (WandMaskField (|wand_3#ft| arg1@@63 arg2@@53 arg3@@41 arg4@@25 arg5@@24 arg6@@20 arg7@@18 arg8@@16 arg9@@15 arg10@@12 arg11@@7 arg12@@7 arg13@@7 arg14@@5 arg15@@1 arg16@@1 arg17@@1 arg18@@1 arg19)))
)))
(assert (forall ((arg0@@49 Bool) (arg1@@64 T@U) (arg2@@54 Real) (arg3@@42 Bool) (arg4@@26 T@U) (arg5@@25 Real) (arg6@@21 T@U) (arg7@@19 Real) ) (! (= (type (wand_10 arg0@@49 arg1@@64 arg2@@54 arg3@@42 arg4@@26 arg5@@25 arg6@@21 arg7@@19)) (FieldType WandType_wand_10Type intType))
 :qid |funType:wand_10|
 :pattern ( (wand_10 arg0@@49 arg1@@64 arg2@@54 arg3@@42 arg4@@26 arg5@@25 arg6@@21 arg7@@19))
)))
(assert (forall ((arg1@@65 Bool) (arg2@@55 T@U) (arg3@@43 Real) (arg4@@27 Bool) (arg5@@26 T@U) (arg6@@22 Real) (arg7@@20 T@U) (arg8@@17 Real) ) (!  (=> (and (and (= (type arg2@@55) RefType) (= (type arg5@@26) RefType)) (= (type arg7@@20) RefType)) (IsWandField (wand_10 arg1@@65 arg2@@55 arg3@@43 arg4@@27 arg5@@26 arg6@@22 arg7@@20 arg8@@17)))
 :qid |stdinbpl.183:15|
 :skolemid |22|
 :pattern ( (wand_10 arg1@@65 arg2@@55 arg3@@43 arg4@@27 arg5@@26 arg6@@22 arg7@@20 arg8@@17))
)))
(assert (forall ((arg1@@66 Bool) (arg2@@56 T@U) (arg3@@44 Real) (arg4@@28 Bool) (arg5@@27 T@U) (arg6@@23 Real) (arg7@@21 T@U) (arg8@@18 Real) ) (!  (=> (and (and (= (type arg2@@56) RefType) (= (type arg5@@27) RefType)) (= (type arg7@@21) RefType)) (IsWandField (|wand_10#ft| arg1@@66 arg2@@56 arg3@@44 arg4@@28 arg5@@27 arg6@@23 arg7@@21 arg8@@18)))
 :qid |stdinbpl.187:15|
 :skolemid |23|
 :pattern ( (|wand_10#ft| arg1@@66 arg2@@56 arg3@@44 arg4@@28 arg5@@27 arg6@@23 arg7@@21 arg8@@18))
)))
(assert (forall ((Heap@@4 T@U) (ExhaleHeap@@2 T@U) (Mask@@3 T@U) (o_1@@0 T@U) (f_2 T@U) ) (! (let ((B@@1 (FieldTypeInv1 (type f_2))))
(let ((A@@1 (FieldTypeInv0 (type f_2))))
 (=> (and (and (and (and (and (and (= (type Heap@@4) (MapType1Type RefType)) (= (type ExhaleHeap@@2) (MapType1Type RefType))) (= (type Mask@@3) (MapType0Type RefType realType))) (= (type o_1@@0) RefType)) (= (type f_2) (FieldType A@@1 B@@1))) (IdenticalOnKnownLocations Heap@@4 ExhaleHeap@@2 Mask@@3)) (HasDirectPerm Mask@@3 o_1@@0 f_2)) (= (MapType1Select Heap@@4 o_1@@0 f_2) (MapType1Select ExhaleHeap@@2 o_1@@0 f_2)))))
 :qid |stdinbpl.42:22|
 :skolemid |1|
 :pattern ( (IdenticalOnKnownLocations Heap@@4 ExhaleHeap@@2 Mask@@3) (MapType1Select ExhaleHeap@@2 o_1@@0 f_2))
)))
(assert (forall ((arg1@@67 Bool) (arg2@@57 T@U) (arg3@@45 Real) (arg4@@29 Bool) (arg5@@28 T@U) (arg6@@24 Real) (arg7@@22 T@U) (arg8@@19 Real) ) (!  (=> (and (and (= (type arg2@@57) RefType) (= (type arg5@@28) RefType)) (= (type arg7@@22) RefType)) (not (IsPredicateField (wand_10 arg1@@67 arg2@@57 arg3@@45 arg4@@29 arg5@@28 arg6@@24 arg7@@22 arg8@@19))))
 :qid |stdinbpl.191:15|
 :skolemid |24|
 :pattern ( (wand_10 arg1@@67 arg2@@57 arg3@@45 arg4@@29 arg5@@28 arg6@@24 arg7@@22 arg8@@19))
)))
(assert (forall ((arg1@@68 Bool) (arg2@@58 T@U) (arg3@@46 Real) (arg4@@30 Bool) (arg5@@29 T@U) (arg6@@25 Real) (arg7@@23 T@U) (arg8@@20 Real) ) (!  (=> (and (and (= (type arg2@@58) RefType) (= (type arg5@@29) RefType)) (= (type arg7@@23) RefType)) (not (IsPredicateField (|wand_10#ft| arg1@@68 arg2@@58 arg3@@46 arg4@@30 arg5@@29 arg6@@25 arg7@@23 arg8@@20))))
 :qid |stdinbpl.195:15|
 :skolemid |25|
 :pattern ( (|wand_10#ft| arg1@@68 arg2@@58 arg3@@46 arg4@@30 arg5@@29 arg6@@25 arg7@@23 arg8@@20))
)))
(assert  (and (= (type dummyHeap) (MapType1Type RefType)) (= (type ZeroMask) (MapType0Type RefType realType))))
(assert (state dummyHeap ZeroMask))
(assert  (and (= (Ctor WandType_wand_2Type) 23) (forall ((arg0@@50 Bool) (arg1@@69 T@U) (arg2@@59 Real) (arg3@@47 T@U) (arg4@@31 Real) (arg5@@30 T@U) (arg6@@26 Real) (arg7@@24 Bool) (arg8@@21 T@U) (arg9@@16 Real) (arg10@@13 T@U) (arg11@@8 Real) ) (! (= (type (wand_2 arg0@@50 arg1@@69 arg2@@59 arg3@@47 arg4@@31 arg5@@30 arg6@@26 arg7@@24 arg8@@21 arg9@@16 arg10@@13 arg11@@8)) (FieldType WandType_wand_2Type intType))
 :qid |funType:wand_2|
 :pattern ( (wand_2 arg0@@50 arg1@@69 arg2@@59 arg3@@47 arg4@@31 arg5@@30 arg6@@26 arg7@@24 arg8@@21 arg9@@16 arg10@@13 arg11@@8))
))))
(assert (forall ((arg1@@70 Bool) (arg2@@60 T@U) (arg3@@48 Real) (arg4@@32 T@U) (arg5@@31 Real) (arg6@@27 T@U) (arg7@@25 Real) (arg8@@22 Bool) (arg9@@17 T@U) (arg10@@14 Real) (arg11@@9 T@U) (arg12@@8 Real) ) (!  (=> (and (and (and (and (= (type arg2@@60) RefType) (= (type arg4@@32) RefType)) (= (type arg6@@27) RefType)) (= (type arg9@@17) RefType)) (= (type arg11@@9) RefType)) (= (getPredWandId (wand_2 arg1@@70 arg2@@60 arg3@@48 arg4@@32 arg5@@31 arg6@@27 arg7@@25 arg8@@22 arg9@@17 arg10@@14 arg11@@9 arg12@@8)) 2))
 :qid |stdinbpl.235:15|
 :skolemid |34|
 :pattern ( (wand_2 arg1@@70 arg2@@60 arg3@@48 arg4@@32 arg5@@31 arg6@@27 arg7@@25 arg8@@22 arg9@@17 arg10@@14 arg11@@9 arg12@@8))
)))
(assert (forall ((p T@U) (v_1 T@U) (w T@U) ) (! (let ((A@@2 (FieldTypeInv0 (type p))))
 (=> (and (and (= (type p) (FieldType A@@2 FrameTypeType)) (= (type v_1) FrameTypeType)) (= (type w) FrameTypeType)) (not (InsidePredicate p v_1 p w))))
 :qid |stdinbpl.170:19|
 :skolemid |21|
 :pattern ( (InsidePredicate p v_1 p w))
)))
(assert (forall ((arg0@@51 Bool) (arg1@@71 Bool) (arg2@@61 T@U) (arg3@@49 Real) (arg4@@33 T@U) (arg5@@32 Real) ) (! (= (type (wand_1 arg0@@51 arg1@@71 arg2@@61 arg3@@49 arg4@@33 arg5@@32)) (FieldType WandType_wand_1Type intType))
 :qid |funType:wand_1|
 :pattern ( (wand_1 arg0@@51 arg1@@71 arg2@@61 arg3@@49 arg4@@33 arg5@@32))
)))
(assert (forall ((arg1@@72 Bool) (arg2@@62 Bool) (arg3@@50 T@U) (arg4@@34 Real) (arg5@@33 T@U) (arg6@@28 Real) (arg1_2@@0 Bool) (arg2_2@@0 Bool) (arg3_2@@0 T@U) (arg4_2 Real) (arg5_2 T@U) (arg6_2 Real) ) (!  (=> (and (and (and (and (= (type arg3@@50) RefType) (= (type arg5@@33) RefType)) (= (type arg3_2@@0) RefType)) (= (type arg5_2) RefType)) (= (wand_1 arg1@@72 arg2@@62 arg3@@50 arg4@@34 arg5@@33 arg6@@28) (wand_1 arg1_2@@0 arg2_2@@0 arg3_2@@0 arg4_2 arg5_2 arg6_2))) (and (= arg1@@72 arg1_2@@0) (and (= arg2@@62 arg2_2@@0) (and (= arg3@@50 arg3_2@@0) (and (= arg4@@34 arg4_2) (and (= arg5@@33 arg5_2) (= arg6@@28 arg6_2)))))))
 :qid |stdinbpl.431:15|
 :skolemid |77|
 :pattern ( (wand_1 arg1@@72 arg2@@62 arg3@@50 arg4@@34 arg5@@33 arg6@@28) (wand_1 arg1_2@@0 arg2_2@@0 arg3_2@@0 arg4_2 arg5_2 arg6_2))
)))
(assert  (not (IsPredicateField f_7)))
(assert  (not (IsWandField f_7)))
(assert  (not (IsPredicateField g)))
(assert  (not (IsWandField g)))
(assert  (not (IsPredicateField h)))
(assert  (not (IsWandField h)))
(assert (forall ((Heap@@5 T@U) (ExhaleHeap@@3 T@U) (Mask@@4 T@U) ) (!  (=> (and (and (and (= (type Heap@@5) (MapType1Type RefType)) (= (type ExhaleHeap@@3) (MapType1Type RefType))) (= (type Mask@@4) (MapType0Type RefType realType))) (IdenticalOnKnownLocations Heap@@5 ExhaleHeap@@3 Mask@@4)) (succHeap Heap@@5 ExhaleHeap@@3))
 :qid |stdinbpl.83:15|
 :skolemid |10|
 :pattern ( (IdenticalOnKnownLocations Heap@@5 ExhaleHeap@@3 Mask@@4))
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
(assert (forall ((arg1@@73 Bool) (arg2@@63 Bool) (arg3@@51 T@U) (arg4@@35 Real) ) (!  (=> (= (type arg3@@51) RefType) (IsWandField (wand_5 arg1@@73 arg2@@63 arg3@@51 arg4@@35)))
 :qid |stdinbpl.343:15|
 :skolemid |57|
 :pattern ( (wand_5 arg1@@73 arg2@@63 arg3@@51 arg4@@35))
)))
(assert (forall ((arg0@@52 Bool) (arg1@@74 Bool) (arg2@@64 T@U) (arg3@@52 Real) ) (! (= (type (|wand_5#ft| arg0@@52 arg1@@74 arg2@@64 arg3@@52)) (FieldType WandType_wand_5Type FrameTypeType))
 :qid |funType:wand_5#ft|
 :pattern ( (|wand_5#ft| arg0@@52 arg1@@74 arg2@@64 arg3@@52))
)))
(assert (forall ((arg1@@75 Bool) (arg2@@65 Bool) (arg3@@53 T@U) (arg4@@36 Real) ) (!  (=> (= (type arg3@@53) RefType) (IsWandField (|wand_5#ft| arg1@@75 arg2@@65 arg3@@53 arg4@@36)))
 :qid |stdinbpl.347:15|
 :skolemid |58|
 :pattern ( (|wand_5#ft| arg1@@75 arg2@@65 arg3@@53 arg4@@36))
)))
(assert (forall ((arg1@@76 Bool) (arg2@@66 T@U) (arg3@@54 Real) (arg4@@37 T@U) (arg5@@34 Real) (arg6@@29 T@U) (arg7@@26 Real) (arg8@@23 Bool) (arg9@@18 T@U) (arg10@@15 Real) (arg11@@10 T@U) (arg12@@9 Real) ) (!  (=> (and (and (and (and (= (type arg2@@66) RefType) (= (type arg4@@37) RefType)) (= (type arg6@@29) RefType)) (= (type arg9@@18) RefType)) (= (type arg11@@10) RefType)) (IsWandField (wand_2 arg1@@76 arg2@@66 arg3@@54 arg4@@37 arg5@@34 arg6@@29 arg7@@26 arg8@@23 arg9@@18 arg10@@15 arg11@@10 arg12@@9)))
 :qid |stdinbpl.215:15|
 :skolemid |29|
 :pattern ( (wand_2 arg1@@76 arg2@@66 arg3@@54 arg4@@37 arg5@@34 arg6@@29 arg7@@26 arg8@@23 arg9@@18 arg10@@15 arg11@@10 arg12@@9))
)))
(assert (forall ((arg0@@53 Bool) (arg1@@77 T@U) (arg2@@67 Real) (arg3@@55 T@U) (arg4@@38 Real) (arg5@@35 T@U) (arg6@@30 Real) (arg7@@27 Bool) (arg8@@24 T@U) (arg9@@19 Real) (arg10@@16 T@U) (arg11@@11 Real) ) (! (= (type (|wand_2#ft| arg0@@53 arg1@@77 arg2@@67 arg3@@55 arg4@@38 arg5@@35 arg6@@30 arg7@@27 arg8@@24 arg9@@19 arg10@@16 arg11@@11)) (FieldType WandType_wand_2Type FrameTypeType))
 :qid |funType:wand_2#ft|
 :pattern ( (|wand_2#ft| arg0@@53 arg1@@77 arg2@@67 arg3@@55 arg4@@38 arg5@@35 arg6@@30 arg7@@27 arg8@@24 arg9@@19 arg10@@16 arg11@@11))
)))
(assert (forall ((arg1@@78 Bool) (arg2@@68 T@U) (arg3@@56 Real) (arg4@@39 T@U) (arg5@@36 Real) (arg6@@31 T@U) (arg7@@28 Real) (arg8@@25 Bool) (arg9@@20 T@U) (arg10@@17 Real) (arg11@@12 T@U) (arg12@@10 Real) ) (!  (=> (and (and (and (and (= (type arg2@@68) RefType) (= (type arg4@@39) RefType)) (= (type arg6@@31) RefType)) (= (type arg9@@20) RefType)) (= (type arg11@@12) RefType)) (IsWandField (|wand_2#ft| arg1@@78 arg2@@68 arg3@@56 arg4@@39 arg5@@36 arg6@@31 arg7@@28 arg8@@25 arg9@@20 arg10@@17 arg11@@12 arg12@@10)))
 :qid |stdinbpl.219:15|
 :skolemid |30|
 :pattern ( (|wand_2#ft| arg1@@78 arg2@@68 arg3@@56 arg4@@39 arg5@@36 arg6@@31 arg7@@28 arg8@@25 arg9@@20 arg10@@17 arg11@@12 arg12@@10))
)))
(assert  (and (forall ((arg0@@54 Real) (arg1@@79 T@U) ) (! (= (type (ConditionalFrame arg0@@54 arg1@@79)) FrameTypeType)
 :qid |funType:ConditionalFrame|
 :pattern ( (ConditionalFrame arg0@@54 arg1@@79))
)) (= (type EmptyFrame) FrameTypeType)))
(assert (forall ((p@@0 Real) (f_6 T@U) ) (!  (=> (= (type f_6) FrameTypeType) (= (ConditionalFrame p@@0 f_6) (ite (> p@@0 0.0) f_6 EmptyFrame)))
 :qid |stdinbpl.158:15|
 :skolemid |19|
 :pattern ( (ConditionalFrame p@@0 f_6))
)))
(assert (forall ((arg1@@80 Bool) (arg2@@69 T@U) (arg3@@57 Real) (arg4@@40 T@U) (arg5@@37 Real) (arg6@@32 T@U) (arg7@@29 Real) (arg8@@26 T@U) (arg9@@21 Real) (arg10@@18 Bool) (arg11@@13 T@U) (arg12@@11 Real) (arg13@@8 T@U) (arg14@@6 Real) (arg1_2@@1 Bool) (arg2_2@@1 T@U) (arg3_2@@1 Real) (arg4_2@@0 T@U) (arg5_2@@0 Real) (arg6_2@@0 T@U) (arg7_2 Real) (arg8_2 T@U) (arg9_2 Real) (arg10_2 Bool) (arg11_2 T@U) (arg12_2 Real) (arg13_2 T@U) (arg14_2 Real) ) (!  (=> (and (and (and (and (and (and (and (and (and (and (and (and (= (type arg2@@69) RefType) (= (type arg4@@40) RefType)) (= (type arg6@@32) RefType)) (= (type arg8@@26) RefType)) (= (type arg11@@13) RefType)) (= (type arg13@@8) RefType)) (= (type arg2_2@@1) RefType)) (= (type arg4_2@@0) RefType)) (= (type arg6_2@@0) RefType)) (= (type arg8_2) RefType)) (= (type arg11_2) RefType)) (= (type arg13_2) RefType)) (= (wand_4 arg1@@80 arg2@@69 arg3@@57 arg4@@40 arg5@@37 arg6@@32 arg7@@29 arg8@@26 arg9@@21 arg10@@18 arg11@@13 arg12@@11 arg13@@8 arg14@@6) (wand_4 arg1_2@@1 arg2_2@@1 arg3_2@@1 arg4_2@@0 arg5_2@@0 arg6_2@@0 arg7_2 arg8_2 arg9_2 arg10_2 arg11_2 arg12_2 arg13_2 arg14_2))) (and (= arg1@@80 arg1_2@@1) (and (= arg2@@69 arg2_2@@1) (and (= arg3@@57 arg3_2@@1) (and (= arg4@@40 arg4_2@@0) (and (= arg5@@37 arg5_2@@0) (and (= arg6@@32 arg6_2@@0) (and (= arg7@@29 arg7_2) (and (= arg8@@26 arg8_2) (and (= arg9@@21 arg9_2) (and (= arg10@@18 arg10_2) (and (= arg11@@13 arg11_2) (and (= arg12@@11 arg12_2) (and (= arg13@@8 arg13_2) (= arg14@@6 arg14_2)))))))))))))))
 :qid |stdinbpl.335:15|
 :skolemid |56|
 :pattern ( (wand_4 arg1@@80 arg2@@69 arg3@@57 arg4@@40 arg5@@37 arg6@@32 arg7@@29 arg8@@26 arg9@@21 arg10@@18 arg11@@13 arg12@@11 arg13@@8 arg14@@6) (wand_4 arg1_2@@1 arg2_2@@1 arg3_2@@1 arg4_2@@0 arg5_2@@0 arg6_2@@0 arg7_2 arg8_2 arg9_2 arg10_2 arg11_2 arg12_2 arg13_2 arg14_2))
)))
(assert (forall ((arg1@@81 Bool) (arg2@@70 Bool) (arg3@@58 T@U) (arg4@@41 Real) ) (!  (=> (= (type arg3@@58) RefType) (not (IsPredicateField (wand_5 arg1@@81 arg2@@70 arg3@@58 arg4@@41))))
 :qid |stdinbpl.351:15|
 :skolemid |59|
 :pattern ( (wand_5 arg1@@81 arg2@@70 arg3@@58 arg4@@41))
)))
(assert (forall ((arg1@@82 Bool) (arg2@@71 Bool) (arg3@@59 T@U) (arg4@@42 Real) ) (!  (=> (= (type arg3@@59) RefType) (not (IsPredicateField (|wand_5#ft| arg1@@82 arg2@@71 arg3@@59 arg4@@42))))
 :qid |stdinbpl.355:15|
 :skolemid |60|
 :pattern ( (|wand_5#ft| arg1@@82 arg2@@71 arg3@@59 arg4@@42))
)))
(assert (forall ((arg1@@83 Bool) (arg2@@72 T@U) (arg3@@60 Real) (arg4@@43 T@U) (arg5@@38 Real) (arg6@@33 T@U) (arg7@@30 Real) (arg8@@27 Bool) (arg9@@22 T@U) (arg10@@19 Real) (arg11@@14 T@U) (arg12@@12 Real) ) (!  (=> (and (and (and (and (= (type arg2@@72) RefType) (= (type arg4@@43) RefType)) (= (type arg6@@33) RefType)) (= (type arg9@@22) RefType)) (= (type arg11@@14) RefType)) (not (IsPredicateField (wand_2 arg1@@83 arg2@@72 arg3@@60 arg4@@43 arg5@@38 arg6@@33 arg7@@30 arg8@@27 arg9@@22 arg10@@19 arg11@@14 arg12@@12))))
 :qid |stdinbpl.223:15|
 :skolemid |31|
 :pattern ( (wand_2 arg1@@83 arg2@@72 arg3@@60 arg4@@43 arg5@@38 arg6@@33 arg7@@30 arg8@@27 arg9@@22 arg10@@19 arg11@@14 arg12@@12))
)))
(assert (forall ((arg1@@84 Bool) (arg2@@73 T@U) (arg3@@61 Real) (arg4@@44 T@U) (arg5@@39 Real) (arg6@@34 T@U) (arg7@@31 Real) (arg8@@28 Bool) (arg9@@23 T@U) (arg10@@20 Real) (arg11@@15 T@U) (arg12@@13 Real) ) (!  (=> (and (and (and (and (= (type arg2@@73) RefType) (= (type arg4@@44) RefType)) (= (type arg6@@34) RefType)) (= (type arg9@@23) RefType)) (= (type arg11@@15) RefType)) (not (IsPredicateField (|wand_2#ft| arg1@@84 arg2@@73 arg3@@61 arg4@@44 arg5@@39 arg6@@34 arg7@@31 arg8@@28 arg9@@23 arg10@@20 arg11@@15 arg12@@13))))
 :qid |stdinbpl.227:15|
 :skolemid |32|
 :pattern ( (|wand_2#ft| arg1@@84 arg2@@73 arg3@@61 arg4@@44 arg5@@39 arg6@@34 arg7@@31 arg8@@28 arg9@@23 arg10@@20 arg11@@15 arg12@@13))
)))
(assert (forall ((Mask@@5 T@U) (o_2@@0 T@U) (f_4@@0 T@U) ) (! (let ((B@@3 (FieldTypeInv1 (type f_4@@0))))
(let ((A@@4 (FieldTypeInv0 (type f_4@@0))))
 (=> (and (and (= (type Mask@@5) (MapType0Type RefType realType)) (= (type o_2@@0) RefType)) (= (type f_4@@0) (FieldType A@@4 B@@3))) (= (HasDirectPerm Mask@@5 o_2@@0 f_4@@0) (> (U_2_real (MapType0Select Mask@@5 o_2@@0 f_4@@0)) NoPerm)))))
 :qid |stdinbpl.133:22|
 :skolemid |17|
 :pattern ( (HasDirectPerm Mask@@5 o_2@@0 f_4@@0))
)))
(assert (forall ((arg0@@55 Bool) (arg1@@85 Bool) (arg2@@74 T@U) (arg3@@62 Real) ) (! (= (type (|wand_5#sm| arg0@@55 arg1@@85 arg2@@74 arg3@@62)) (FieldType WandType_wand_5Type (MapType0Type RefType boolType)))
 :qid |funType:wand_5#sm|
 :pattern ( (|wand_5#sm| arg0@@55 arg1@@85 arg2@@74 arg3@@62))
)))
(assert (forall ((arg1@@86 Bool) (arg2@@75 Bool) (arg3@@63 T@U) (arg4@@45 Real) ) (!  (=> (= (type arg3@@63) RefType) (= (|wand_5#sm| arg1@@86 arg2@@75 arg3@@63 arg4@@45) (WandMaskField (|wand_5#ft| arg1@@86 arg2@@75 arg3@@63 arg4@@45))))
 :qid |stdinbpl.359:15|
 :skolemid |61|
 :pattern ( (WandMaskField (|wand_5#ft| arg1@@86 arg2@@75 arg3@@63 arg4@@45)))
)))
(assert (forall ((arg1@@87 Bool) (arg2@@76 T@U) (arg3@@64 Real) (arg4@@46 T@U) (arg5@@40 Real) (arg6@@35 Bool) (arg7@@32 T@U) (arg8@@29 Real) (arg9@@24 T@U) (arg10@@21 Real) (arg1_2@@2 Bool) (arg2_2@@2 T@U) (arg3_2@@2 Real) (arg4_2@@1 T@U) (arg5_2@@1 Real) (arg6_2@@1 Bool) (arg7_2@@0 T@U) (arg8_2@@0 Real) (arg9_2@@0 T@U) (arg10_2@@0 Real) ) (!  (=> (and (and (and (and (and (and (and (and (= (type arg2@@76) RefType) (= (type arg4@@46) RefType)) (= (type arg7@@32) RefType)) (= (type arg9@@24) RefType)) (= (type arg2_2@@2) RefType)) (= (type arg4_2@@1) RefType)) (= (type arg7_2@@0) RefType)) (= (type arg9_2@@0) RefType)) (= (wand_9 arg1@@87 arg2@@76 arg3@@64 arg4@@46 arg5@@40 arg6@@35 arg7@@32 arg8@@29 arg9@@24 arg10@@21) (wand_9 arg1_2@@2 arg2_2@@2 arg3_2@@2 arg4_2@@1 arg5_2@@1 arg6_2@@1 arg7_2@@0 arg8_2@@0 arg9_2@@0 arg10_2@@0))) (and (= arg1@@87 arg1_2@@2) (and (= arg2@@76 arg2_2@@2) (and (= arg3@@64 arg3_2@@2) (and (= arg4@@46 arg4_2@@1) (and (= arg5@@40 arg5_2@@1) (and (= arg6@@35 arg6_2@@1) (and (= arg7@@32 arg7_2@@0) (and (= arg8@@29 arg8_2@@0) (and (= arg9@@24 arg9_2@@0) (= arg10@@21 arg10_2@@0)))))))))))
 :qid |stdinbpl.495:15|
 :skolemid |91|
 :pattern ( (wand_9 arg1@@87 arg2@@76 arg3@@64 arg4@@46 arg5@@40 arg6@@35 arg7@@32 arg8@@29 arg9@@24 arg10@@21) (wand_9 arg1_2@@2 arg2_2@@2 arg3_2@@2 arg4_2@@1 arg5_2@@1 arg6_2@@1 arg7_2@@0 arg8_2@@0 arg9_2@@0 arg10_2@@0))
)))
(assert (forall ((arg1@@88 Bool) (arg2@@77 T@U) (arg3@@65 Real) (arg4@@47 Bool) (arg5@@41 T@U) (arg6@@36 Real) (arg7@@33 T@U) (arg8@@30 Real) (arg1_2@@3 Bool) (arg2_2@@3 T@U) (arg3_2@@3 Real) (arg4_2@@2 Bool) (arg5_2@@2 T@U) (arg6_2@@2 Real) (arg7_2@@1 T@U) (arg8_2@@1 Real) ) (!  (=> (and (and (and (and (and (and (= (type arg2@@77) RefType) (= (type arg5@@41) RefType)) (= (type arg7@@33) RefType)) (= (type arg2_2@@3) RefType)) (= (type arg5_2@@2) RefType)) (= (type arg7_2@@1) RefType)) (= (wand_10 arg1@@88 arg2@@77 arg3@@65 arg4@@47 arg5@@41 arg6@@36 arg7@@33 arg8@@30) (wand_10 arg1_2@@3 arg2_2@@3 arg3_2@@3 arg4_2@@2 arg5_2@@2 arg6_2@@2 arg7_2@@1 arg8_2@@1))) (and (= arg1@@88 arg1_2@@3) (and (= arg2@@77 arg2_2@@3) (and (= arg3@@65 arg3_2@@3) (and (= arg4@@47 arg4_2@@2) (and (= arg5@@41 arg5_2@@2) (and (= arg6@@36 arg6_2@@2) (and (= arg7@@33 arg7_2@@1) (= arg8@@30 arg8_2@@1)))))))))
 :qid |stdinbpl.207:15|
 :skolemid |28|
 :pattern ( (wand_10 arg1@@88 arg2@@77 arg3@@65 arg4@@47 arg5@@41 arg6@@36 arg7@@33 arg8@@30) (wand_10 arg1_2@@3 arg2_2@@3 arg3_2@@3 arg4_2@@2 arg5_2@@2 arg6_2@@2 arg7_2@@1 arg8_2@@1))
)))
(assert (forall ((arg0@@56 Bool) (arg1@@89 T@U) (arg2@@78 Real) (arg3@@66 T@U) (arg4@@48 Real) (arg5@@42 Bool) ) (! (= (type (wand arg0@@56 arg1@@89 arg2@@78 arg3@@66 arg4@@48 arg5@@42)) (FieldType WandType_wandType intType))
 :qid |funType:wand|
 :pattern ( (wand arg0@@56 arg1@@89 arg2@@78 arg3@@66 arg4@@48 arg5@@42))
)))
(assert (forall ((arg1@@90 Bool) (arg2@@79 T@U) (arg3@@67 Real) (arg4@@49 T@U) (arg5@@43 Real) (arg6@@37 Bool) ) (!  (=> (and (= (type arg2@@79) RefType) (= (type arg4@@49) RefType)) (= (getPredWandId (wand arg1@@90 arg2@@79 arg3@@67 arg4@@49 arg5@@43 arg6@@37)) 4))
 :qid |stdinbpl.299:15|
 :skolemid |48|
 :pattern ( (wand arg1@@90 arg2@@79 arg3@@67 arg4@@49 arg5@@43 arg6@@37))
)))
(assert (forall ((arg1@@91 Bool) (arg2@@80 Bool) (arg3@@68 T@U) (arg4@@50 Real) (arg5@@44 T@U) (arg6@@38 Real) ) (!  (=> (and (= (type arg3@@68) RefType) (= (type arg5@@44) RefType)) (= (getPredWandId (wand_1 arg1@@91 arg2@@80 arg3@@68 arg4@@50 arg5@@44 arg6@@38)) 8))
 :qid |stdinbpl.427:15|
 :skolemid |76|
 :pattern ( (wand_1 arg1@@91 arg2@@80 arg3@@68 arg4@@50 arg5@@44 arg6@@38))
)))
(assert (forall ((arg1@@92 Bool) (arg2@@81 T@U) (arg3@@69 Real) (arg4@@51 T@U) (arg5@@45 Real) (arg6@@39 T@U) (arg7@@34 Real) (arg8@@31 T@U) (arg9@@25 Real) (arg10@@22 Bool) (arg11@@16 T@U) (arg12@@14 Real) (arg13@@9 T@U) (arg14@@7 Real) ) (!  (=> (and (and (and (and (and (= (type arg2@@81) RefType) (= (type arg4@@51) RefType)) (= (type arg6@@39) RefType)) (= (type arg8@@31) RefType)) (= (type arg11@@16) RefType)) (= (type arg13@@9) RefType)) (= (getPredWandId (wand_4 arg1@@92 arg2@@81 arg3@@69 arg4@@51 arg5@@45 arg6@@39 arg7@@34 arg8@@31 arg9@@25 arg10@@22 arg11@@16 arg12@@14 arg13@@9 arg14@@7)) 5))
 :qid |stdinbpl.331:15|
 :skolemid |55|
 :pattern ( (wand_4 arg1@@92 arg2@@81 arg3@@69 arg4@@51 arg5@@45 arg6@@39 arg7@@34 arg8@@31 arg9@@25 arg10@@22 arg11@@16 arg12@@14 arg13@@9 arg14@@7))
)))
(assert (forall ((o_2@@1 T@U) (f_4@@1 T@U) ) (! (let ((B@@4 (FieldTypeInv1 (type f_4@@1))))
(let ((A@@5 (FieldTypeInv0 (type f_4@@1))))
 (=> (and (= (type o_2@@1) RefType) (= (type f_4@@1) (FieldType A@@5 B@@4))) (= (U_2_real (MapType0Select ZeroMask o_2@@1 f_4@@1)) NoPerm))))
 :qid |stdinbpl.106:22|
 :skolemid |13|
 :pattern ( (MapType0Select ZeroMask o_2@@1 f_4@@1))
)))
(assert (forall ((arg0@@57 Bool) (arg1@@93 T@U) (arg2@@82 Real) (arg3@@70 T@U) (arg4@@52 Real) (arg5@@46 Bool) (arg6@@40 T@U) (arg7@@35 Real) (arg8@@32 T@U) (arg9@@26 Real) (arg10@@23 T@U) (arg11@@17 Real) (arg12@@15 T@U) (arg13@@10 Real) (arg14@@8 Bool) (arg15@@2 T@U) (arg16@@2 Real) (arg17@@2 T@U) (arg18@@2 Real) ) (! (= (type (wand_3 arg0@@57 arg1@@93 arg2@@82 arg3@@70 arg4@@52 arg5@@46 arg6@@40 arg7@@35 arg8@@32 arg9@@26 arg10@@23 arg11@@17 arg12@@15 arg13@@10 arg14@@8 arg15@@2 arg16@@2 arg17@@2 arg18@@2)) (FieldType WandType_wand_3Type intType))
 :qid |funType:wand_3|
 :pattern ( (wand_3 arg0@@57 arg1@@93 arg2@@82 arg3@@70 arg4@@52 arg5@@46 arg6@@40 arg7@@35 arg8@@32 arg9@@26 arg10@@23 arg11@@17 arg12@@15 arg13@@10 arg14@@8 arg15@@2 arg16@@2 arg17@@2 arg18@@2))
)))
(assert (forall ((arg1@@94 Bool) (arg2@@83 T@U) (arg3@@71 Real) (arg4@@53 T@U) (arg5@@47 Real) (arg6@@41 Bool) (arg7@@36 T@U) (arg8@@33 Real) (arg9@@27 T@U) (arg10@@24 Real) (arg11@@18 T@U) (arg12@@16 Real) (arg13@@11 T@U) (arg14@@9 Real) (arg15@@3 Bool) (arg16@@3 T@U) (arg17@@3 Real) (arg18@@3 T@U) (arg19@@0 Real) ) (!  (=> (and (and (and (and (and (and (and (= (type arg2@@83) RefType) (= (type arg4@@53) RefType)) (= (type arg7@@36) RefType)) (= (type arg9@@27) RefType)) (= (type arg11@@18) RefType)) (= (type arg13@@11) RefType)) (= (type arg16@@3) RefType)) (= (type arg18@@3) RefType)) (= (getPredWandId (wand_3 arg1@@94 arg2@@83 arg3@@71 arg4@@53 arg5@@47 arg6@@41 arg7@@36 arg8@@33 arg9@@27 arg10@@24 arg11@@18 arg12@@16 arg13@@11 arg14@@9 arg15@@3 arg16@@3 arg17@@3 arg18@@3 arg19@@0)) 7))
 :qid |stdinbpl.395:15|
 :skolemid |69|
 :pattern ( (wand_3 arg1@@94 arg2@@83 arg3@@71 arg4@@53 arg5@@47 arg6@@41 arg7@@36 arg8@@33 arg9@@27 arg10@@24 arg11@@18 arg12@@16 arg13@@11 arg14@@9 arg15@@3 arg16@@3 arg17@@3 arg18@@3 arg19@@0))
)))
(assert (forall ((arg1@@95 Bool) (arg2@@84 T@U) (arg3@@72 Real) (arg4@@54 T@U) (arg5@@48 Real) (arg6@@42 Bool) ) (!  (=> (and (= (type arg2@@84) RefType) (= (type arg4@@54) RefType)) (IsWandField (wand arg1@@95 arg2@@84 arg3@@72 arg4@@54 arg5@@48 arg6@@42)))
 :qid |stdinbpl.279:15|
 :skolemid |43|
 :pattern ( (wand arg1@@95 arg2@@84 arg3@@72 arg4@@54 arg5@@48 arg6@@42))
)))
(assert (forall ((arg1@@96 Bool) (arg2@@85 T@U) (arg3@@73 Real) (arg4@@55 T@U) (arg5@@49 Real) (arg6@@43 Bool) ) (!  (=> (and (= (type arg2@@85) RefType) (= (type arg4@@55) RefType)) (IsWandField (|wand#ft| arg1@@96 arg2@@85 arg3@@73 arg4@@55 arg5@@49 arg6@@43)))
 :qid |stdinbpl.283:15|
 :skolemid |44|
 :pattern ( (|wand#ft| arg1@@96 arg2@@85 arg3@@73 arg4@@55 arg5@@49 arg6@@43))
)))
(assert (forall ((arg1@@97 Bool) (arg2@@86 Bool) (arg3@@74 T@U) (arg4@@56 Real) (arg5@@50 T@U) (arg6@@44 Real) ) (!  (=> (and (= (type arg3@@74) RefType) (= (type arg5@@50) RefType)) (IsWandField (wand_1 arg1@@97 arg2@@86 arg3@@74 arg4@@56 arg5@@50 arg6@@44)))
 :qid |stdinbpl.407:15|
 :skolemid |71|
 :pattern ( (wand_1 arg1@@97 arg2@@86 arg3@@74 arg4@@56 arg5@@50 arg6@@44))
)))
(assert (forall ((arg1@@98 Bool) (arg2@@87 Bool) (arg3@@75 T@U) (arg4@@57 Real) (arg5@@51 T@U) (arg6@@45 Real) ) (!  (=> (and (= (type arg3@@75) RefType) (= (type arg5@@51) RefType)) (IsWandField (|wand_1#ft| arg1@@98 arg2@@87 arg3@@75 arg4@@57 arg5@@51 arg6@@45)))
 :qid |stdinbpl.411:15|
 :skolemid |72|
 :pattern ( (|wand_1#ft| arg1@@98 arg2@@87 arg3@@75 arg4@@57 arg5@@51 arg6@@45))
)))
(assert (forall ((arg1@@99 Bool) (arg2@@88 T@U) (arg3@@76 Real) (arg4@@58 T@U) (arg5@@52 Real) (arg6@@46 Bool) ) (!  (=> (and (= (type arg2@@88) RefType) (= (type arg4@@58) RefType)) (not (IsPredicateField (wand arg1@@99 arg2@@88 arg3@@76 arg4@@58 arg5@@52 arg6@@46))))
 :qid |stdinbpl.287:15|
 :skolemid |45|
 :pattern ( (wand arg1@@99 arg2@@88 arg3@@76 arg4@@58 arg5@@52 arg6@@46))
)))
(assert (forall ((arg1@@100 Bool) (arg2@@89 T@U) (arg3@@77 Real) (arg4@@59 T@U) (arg5@@53 Real) (arg6@@47 Bool) ) (!  (=> (and (= (type arg2@@89) RefType) (= (type arg4@@59) RefType)) (not (IsPredicateField (|wand#ft| arg1@@100 arg2@@89 arg3@@77 arg4@@59 arg5@@53 arg6@@47))))
 :qid |stdinbpl.291:15|
 :skolemid |46|
 :pattern ( (|wand#ft| arg1@@100 arg2@@89 arg3@@77 arg4@@59 arg5@@53 arg6@@47))
)))
(assert (forall ((arg1@@101 Bool) (arg2@@90 Bool) (arg3@@78 T@U) (arg4@@60 Real) (arg5@@54 T@U) (arg6@@48 Real) ) (!  (=> (and (= (type arg3@@78) RefType) (= (type arg5@@54) RefType)) (not (IsPredicateField (wand_1 arg1@@101 arg2@@90 arg3@@78 arg4@@60 arg5@@54 arg6@@48))))
 :qid |stdinbpl.415:15|
 :skolemid |73|
 :pattern ( (wand_1 arg1@@101 arg2@@90 arg3@@78 arg4@@60 arg5@@54 arg6@@48))
)))
(assert (forall ((arg1@@102 Bool) (arg2@@91 Bool) (arg3@@79 T@U) (arg4@@61 Real) (arg5@@55 T@U) (arg6@@49 Real) ) (!  (=> (and (= (type arg3@@79) RefType) (= (type arg5@@55) RefType)) (not (IsPredicateField (|wand_1#ft| arg1@@102 arg2@@91 arg3@@79 arg4@@61 arg5@@55 arg6@@49))))
 :qid |stdinbpl.419:15|
 :skolemid |74|
 :pattern ( (|wand_1#ft| arg1@@102 arg2@@91 arg3@@79 arg4@@61 arg5@@55 arg6@@49))
)))
(assert (forall ((arg1@@103 Bool) (arg2@@92 Bool) (arg1_2@@4 Bool) (arg2_2@@4 Bool) ) (!  (=> (= (wand_6 arg1@@103 arg2@@92) (wand_6 arg1_2@@4 arg2_2@@4)) (and (= arg1@@103 arg1_2@@4) (= arg2@@92 arg2_2@@4)))
 :qid |stdinbpl.463:15|
 :skolemid |84|
 :pattern ( (wand_6 arg1@@103 arg2@@92) (wand_6 arg1_2@@4 arg2_2@@4))
)))
(assert (forall ((arg1@@104 Bool) (arg2@@93 T@U) (arg3@@80 Real) (arg4@@62 T@U) (arg5@@56 Real) (arg6@@50 Bool) (arg7@@37 T@U) (arg8@@34 Real) (arg9@@28 T@U) (arg10@@25 Real) (arg11@@19 T@U) (arg12@@17 Real) (arg13@@12 T@U) (arg14@@10 Real) (arg15@@4 Bool) (arg16@@4 T@U) (arg17@@4 Real) (arg18@@4 T@U) (arg19@@1 Real) ) (!  (=> (and (and (and (and (and (and (and (= (type arg2@@93) RefType) (= (type arg4@@62) RefType)) (= (type arg7@@37) RefType)) (= (type arg9@@28) RefType)) (= (type arg11@@19) RefType)) (= (type arg13@@12) RefType)) (= (type arg16@@4) RefType)) (= (type arg18@@4) RefType)) (IsWandField (wand_3 arg1@@104 arg2@@93 arg3@@80 arg4@@62 arg5@@56 arg6@@50 arg7@@37 arg8@@34 arg9@@28 arg10@@25 arg11@@19 arg12@@17 arg13@@12 arg14@@10 arg15@@4 arg16@@4 arg17@@4 arg18@@4 arg19@@1)))
 :qid |stdinbpl.375:15|
 :skolemid |64|
 :pattern ( (wand_3 arg1@@104 arg2@@93 arg3@@80 arg4@@62 arg5@@56 arg6@@50 arg7@@37 arg8@@34 arg9@@28 arg10@@25 arg11@@19 arg12@@17 arg13@@12 arg14@@10 arg15@@4 arg16@@4 arg17@@4 arg18@@4 arg19@@1))
)))
(assert (forall ((arg1@@105 Bool) (arg2@@94 T@U) (arg3@@81 Real) (arg4@@63 T@U) (arg5@@57 Real) (arg6@@51 Bool) (arg7@@38 T@U) (arg8@@35 Real) (arg9@@29 T@U) (arg10@@26 Real) (arg11@@20 T@U) (arg12@@18 Real) (arg13@@13 T@U) (arg14@@11 Real) (arg15@@5 Bool) (arg16@@5 T@U) (arg17@@5 Real) (arg18@@5 T@U) (arg19@@2 Real) ) (!  (=> (and (and (and (and (and (and (and (= (type arg2@@94) RefType) (= (type arg4@@63) RefType)) (= (type arg7@@38) RefType)) (= (type arg9@@29) RefType)) (= (type arg11@@20) RefType)) (= (type arg13@@13) RefType)) (= (type arg16@@5) RefType)) (= (type arg18@@5) RefType)) (IsWandField (|wand_3#ft| arg1@@105 arg2@@94 arg3@@81 arg4@@63 arg5@@57 arg6@@51 arg7@@38 arg8@@35 arg9@@29 arg10@@26 arg11@@20 arg12@@18 arg13@@13 arg14@@11 arg15@@5 arg16@@5 arg17@@5 arg18@@5 arg19@@2)))
 :qid |stdinbpl.379:15|
 :skolemid |65|
 :pattern ( (|wand_3#ft| arg1@@105 arg2@@94 arg3@@81 arg4@@63 arg5@@57 arg6@@51 arg7@@38 arg8@@35 arg9@@29 arg10@@26 arg11@@20 arg12@@18 arg13@@13 arg14@@11 arg15@@5 arg16@@5 arg17@@5 arg18@@5 arg19@@2))
)))
(assert (forall ((arg1@@106 Bool) (arg2@@95 T@U) (arg3@@82 Real) (arg4@@64 T@U) (arg5@@58 Real) (arg6@@52 Bool) (arg7@@39 T@U) (arg8@@36 Real) (arg9@@30 T@U) (arg10@@27 Real) (arg11@@21 T@U) (arg12@@19 Real) (arg13@@14 T@U) (arg14@@12 Real) (arg15@@6 Bool) (arg16@@6 T@U) (arg17@@6 Real) (arg18@@6 T@U) (arg19@@3 Real) ) (!  (=> (and (and (and (and (and (and (and (= (type arg2@@95) RefType) (= (type arg4@@64) RefType)) (= (type arg7@@39) RefType)) (= (type arg9@@30) RefType)) (= (type arg11@@21) RefType)) (= (type arg13@@14) RefType)) (= (type arg16@@6) RefType)) (= (type arg18@@6) RefType)) (not (IsPredicateField (wand_3 arg1@@106 arg2@@95 arg3@@82 arg4@@64 arg5@@58 arg6@@52 arg7@@39 arg8@@36 arg9@@30 arg10@@27 arg11@@21 arg12@@19 arg13@@14 arg14@@12 arg15@@6 arg16@@6 arg17@@6 arg18@@6 arg19@@3))))
 :qid |stdinbpl.383:15|
 :skolemid |66|
 :pattern ( (wand_3 arg1@@106 arg2@@95 arg3@@82 arg4@@64 arg5@@58 arg6@@52 arg7@@39 arg8@@36 arg9@@30 arg10@@27 arg11@@21 arg12@@19 arg13@@14 arg14@@12 arg15@@6 arg16@@6 arg17@@6 arg18@@6 arg19@@3))
)))
(assert (forall ((arg1@@107 Bool) (arg2@@96 T@U) (arg3@@83 Real) (arg4@@65 T@U) (arg5@@59 Real) (arg6@@53 Bool) (arg7@@40 T@U) (arg8@@37 Real) (arg9@@31 T@U) (arg10@@28 Real) (arg11@@22 T@U) (arg12@@20 Real) (arg13@@15 T@U) (arg14@@13 Real) (arg15@@7 Bool) (arg16@@7 T@U) (arg17@@7 Real) (arg18@@7 T@U) (arg19@@4 Real) ) (!  (=> (and (and (and (and (and (and (and (= (type arg2@@96) RefType) (= (type arg4@@65) RefType)) (= (type arg7@@40) RefType)) (= (type arg9@@31) RefType)) (= (type arg11@@22) RefType)) (= (type arg13@@15) RefType)) (= (type arg16@@7) RefType)) (= (type arg18@@7) RefType)) (not (IsPredicateField (|wand_3#ft| arg1@@107 arg2@@96 arg3@@83 arg4@@65 arg5@@59 arg6@@53 arg7@@40 arg8@@37 arg9@@31 arg10@@28 arg11@@22 arg12@@20 arg13@@15 arg14@@13 arg15@@7 arg16@@7 arg17@@7 arg18@@7 arg19@@4))))
 :qid |stdinbpl.387:15|
 :skolemid |67|
 :pattern ( (|wand_3#ft| arg1@@107 arg2@@96 arg3@@83 arg4@@65 arg5@@59 arg6@@53 arg7@@40 arg8@@37 arg9@@31 arg10@@28 arg11@@22 arg12@@20 arg13@@15 arg14@@13 arg15@@7 arg16@@7 arg17@@7 arg18@@7 arg19@@4))
)))
(assert (forall ((arg1@@108 Bool) (arg2@@97 T@U) (arg3@@84 Real) (arg4@@66 Bool) (arg5@@60 T@U) (arg6@@54 Real) (arg7@@41 T@U) (arg8@@38 Real) ) (!  (=> (and (and (= (type arg2@@97) RefType) (= (type arg5@@60) RefType)) (= (type arg7@@41) RefType)) (= (getPredWandId (wand_10 arg1@@108 arg2@@97 arg3@@84 arg4@@66 arg5@@60 arg6@@54 arg7@@41 arg8@@38)) 1))
 :qid |stdinbpl.203:15|
 :skolemid |27|
 :pattern ( (wand_10 arg1@@108 arg2@@97 arg3@@84 arg4@@66 arg5@@60 arg6@@54 arg7@@41 arg8@@38))
)))
(assert (forall ((arg1@@109 Bool) (arg2@@98 T@U) (arg3@@85 Real) (arg1_2@@5 Bool) (arg2_2@@5 T@U) (arg3_2@@4 Real) ) (!  (=> (and (and (= (type arg2@@98) RefType) (= (type arg2_2@@5) RefType)) (= (wand_7 arg1@@109 arg2@@98 arg3@@85) (wand_7 arg1_2@@5 arg2_2@@5 arg3_2@@4))) (and (= arg1@@109 arg1_2@@5) (and (= arg2@@98 arg2_2@@5) (= arg3@@85 arg3_2@@4))))
 :qid |stdinbpl.271:15|
 :skolemid |42|
 :pattern ( (wand_7 arg1@@109 arg2@@98 arg3@@85) (wand_7 arg1_2@@5 arg2_2@@5 arg3_2@@4))
)))
(assert (forall ((x@@12 T@U) (b_2@@3 Bool) ) (!  (=> (= (type x@@12) RefType) (= (getPredWandId (P x@@12 b_2@@3)) 0))
 :qid |stdinbpl.561:15|
 :skolemid |101|
 :pattern ( (P x@@12 b_2@@3))
)))
(assert (forall ((arg1@@110 Bool) (arg2@@99 Bool) ) (! (= (getPredWandId (wand_6 arg1@@110 arg2@@99)) 9)
 :qid |stdinbpl.459:15|
 :skolemid |83|
 :pattern ( (wand_6 arg1@@110 arg2@@99))
)))
(assert (forall ((arg1@@111 Bool) (arg2@@100 T@U) (arg3@@86 Real) (arg4@@67 T@U) (arg5@@61 Real) (arg6@@55 Bool) (arg7@@42 T@U) (arg8@@39 Real) (arg9@@32 T@U) (arg10@@29 Real) (arg11@@23 T@U) (arg12@@21 Real) (arg13@@16 T@U) (arg14@@14 Real) (arg15@@8 Bool) (arg16@@8 T@U) (arg17@@8 Real) (arg18@@8 T@U) (arg19@@5 Real) (arg1_2@@6 Bool) (arg2_2@@6 T@U) (arg3_2@@5 Real) (arg4_2@@3 T@U) (arg5_2@@3 Real) (arg6_2@@3 Bool) (arg7_2@@2 T@U) (arg8_2@@2 Real) (arg9_2@@1 T@U) (arg10_2@@1 Real) (arg11_2@@0 T@U) (arg12_2@@0 Real) (arg13_2@@0 T@U) (arg14_2@@0 Real) (arg15_2 Bool) (arg16_2 T@U) (arg17_2 Real) (arg18_2 T@U) (arg19_2 Real) ) (!  (=> (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (= (type arg2@@100) RefType) (= (type arg4@@67) RefType)) (= (type arg7@@42) RefType)) (= (type arg9@@32) RefType)) (= (type arg11@@23) RefType)) (= (type arg13@@16) RefType)) (= (type arg16@@8) RefType)) (= (type arg18@@8) RefType)) (= (type arg2_2@@6) RefType)) (= (type arg4_2@@3) RefType)) (= (type arg7_2@@2) RefType)) (= (type arg9_2@@1) RefType)) (= (type arg11_2@@0) RefType)) (= (type arg13_2@@0) RefType)) (= (type arg16_2) RefType)) (= (type arg18_2) RefType)) (= (wand_3 arg1@@111 arg2@@100 arg3@@86 arg4@@67 arg5@@61 arg6@@55 arg7@@42 arg8@@39 arg9@@32 arg10@@29 arg11@@23 arg12@@21 arg13@@16 arg14@@14 arg15@@8 arg16@@8 arg17@@8 arg18@@8 arg19@@5) (wand_3 arg1_2@@6 arg2_2@@6 arg3_2@@5 arg4_2@@3 arg5_2@@3 arg6_2@@3 arg7_2@@2 arg8_2@@2 arg9_2@@1 arg10_2@@1 arg11_2@@0 arg12_2@@0 arg13_2@@0 arg14_2@@0 arg15_2 arg16_2 arg17_2 arg18_2 arg19_2))) (and (= arg1@@111 arg1_2@@6) (and (= arg2@@100 arg2_2@@6) (and (= arg3@@86 arg3_2@@5) (and (= arg4@@67 arg4_2@@3) (and (= arg5@@61 arg5_2@@3) (and (= arg6@@55 arg6_2@@3) (and (= arg7@@42 arg7_2@@2) (and (= arg8@@39 arg8_2@@2) (and (= arg9@@32 arg9_2@@1) (and (= arg10@@29 arg10_2@@1) (and (= arg11@@23 arg11_2@@0) (and (= arg12@@21 arg12_2@@0) (and (= arg13@@16 arg13_2@@0) (and (= arg14@@14 arg14_2@@0) (and (= arg15@@8 arg15_2) (and (= arg16@@8 arg16_2) (and (= arg17@@8 arg17_2) (and (= arg18@@8 arg18_2) (= arg19@@5 arg19_2))))))))))))))))))))
 :qid |stdinbpl.399:15|
 :skolemid |70|
 :pattern ( (wand_3 arg1@@111 arg2@@100 arg3@@86 arg4@@67 arg5@@61 arg6@@55 arg7@@42 arg8@@39 arg9@@32 arg10@@29 arg11@@23 arg12@@21 arg13@@16 arg14@@14 arg15@@8 arg16@@8 arg17@@8 arg18@@8 arg19@@5) (wand_3 arg1_2@@6 arg2_2@@6 arg3_2@@5 arg4_2@@3 arg5_2@@3 arg6_2@@3 arg7_2@@2 arg8_2@@2 arg9_2@@1 arg10_2@@1 arg11_2@@0 arg12_2@@0 arg13_2@@0 arg14_2@@0 arg15_2 arg16_2 arg17_2 arg18_2 arg19_2))
)))
(assert (forall ((Heap@@6 T@U) (ExhaleHeap@@4 T@U) (Mask@@6 T@U) (pm_f@@1 T@U) ) (! (let ((C@@1 (FieldTypeInv0 (type pm_f@@1))))
 (=> (and (and (and (and (and (= (type Heap@@6) (MapType1Type RefType)) (= (type ExhaleHeap@@4) (MapType1Type RefType))) (= (type Mask@@6) (MapType0Type RefType realType))) (= (type pm_f@@1) (FieldType C@@1 FrameTypeType))) (IdenticalOnKnownLocations Heap@@6 ExhaleHeap@@4 Mask@@6)) (and (HasDirectPerm Mask@@6 null pm_f@@1) (IsPredicateField pm_f@@1))) (forall ((o2 T@U) (f_2@@0 T@U) ) (! (let ((B@@5 (FieldTypeInv1 (type f_2@@0))))
(let ((A@@6 (FieldTypeInv0 (type f_2@@0))))
 (=> (and (and (= (type o2) RefType) (= (type f_2@@0) (FieldType A@@6 B@@5))) (U_2_bool (MapType0Select (MapType1Select Heap@@6 null (PredicateMaskField pm_f@@1)) o2 f_2@@0))) (= (MapType1Select Heap@@6 o2 f_2@@0) (MapType1Select ExhaleHeap@@4 o2 f_2@@0)))))
 :qid |stdinbpl.54:134|
 :skolemid |3|
 :pattern ( (MapType1Select ExhaleHeap@@4 o2 f_2@@0))
))))
 :qid |stdinbpl.52:19|
 :skolemid |4|
 :pattern ( (IdenticalOnKnownLocations Heap@@6 ExhaleHeap@@4 Mask@@6) (IsPredicateField pm_f@@1))
)))
(assert (forall ((Heap@@7 T@U) (ExhaleHeap@@5 T@U) (Mask@@7 T@U) (pm_f@@2 T@U) ) (! (let ((C@@2 (FieldTypeInv0 (type pm_f@@2))))
 (=> (and (and (and (and (and (= (type Heap@@7) (MapType1Type RefType)) (= (type ExhaleHeap@@5) (MapType1Type RefType))) (= (type Mask@@7) (MapType0Type RefType realType))) (= (type pm_f@@2) (FieldType C@@2 FrameTypeType))) (IdenticalOnKnownLocations Heap@@7 ExhaleHeap@@5 Mask@@7)) (and (HasDirectPerm Mask@@7 null pm_f@@2) (IsWandField pm_f@@2))) (forall ((o2@@0 T@U) (f_2@@1 T@U) ) (! (let ((B@@6 (FieldTypeInv1 (type f_2@@1))))
(let ((A@@7 (FieldTypeInv0 (type f_2@@1))))
 (=> (and (and (= (type o2@@0) RefType) (= (type f_2@@1) (FieldType A@@7 B@@6))) (U_2_bool (MapType0Select (MapType1Select Heap@@7 null (WandMaskField pm_f@@2)) o2@@0 f_2@@1))) (= (MapType1Select Heap@@7 o2@@0 f_2@@1) (MapType1Select ExhaleHeap@@5 o2@@0 f_2@@1)))))
 :qid |stdinbpl.67:129|
 :skolemid |6|
 :pattern ( (MapType1Select ExhaleHeap@@5 o2@@0 f_2@@1))
))))
 :qid |stdinbpl.65:19|
 :skolemid |7|
 :pattern ( (IdenticalOnKnownLocations Heap@@7 ExhaleHeap@@5 Mask@@7) (IsWandField pm_f@@2))
)))
(assert (forall ((Mask@@8 T@U) (o_2@@2 T@U) (f_4@@2 T@U) ) (! (let ((B@@7 (FieldTypeInv1 (type f_4@@2))))
(let ((A@@8 (FieldTypeInv0 (type f_4@@2))))
 (=> (and (and (and (= (type Mask@@8) (MapType0Type RefType realType)) (= (type o_2@@2) RefType)) (= (type f_4@@2) (FieldType A@@8 B@@7))) (GoodMask Mask@@8)) (and (>= (U_2_real (MapType0Select Mask@@8 o_2@@2 f_4@@2)) NoPerm) (=> (and (and (GoodMask Mask@@8) (not (IsPredicateField f_4@@2))) (not (IsWandField f_4@@2))) (<= (U_2_real (MapType0Select Mask@@8 o_2@@2 f_4@@2)) FullPerm))))))
 :qid |stdinbpl.128:22|
 :skolemid |16|
 :pattern ( (GoodMask Mask@@8) (MapType0Select Mask@@8 o_2@@2 f_4@@2))
)))
(assert (forall ((arg0@@58 Bool) (arg1@@112 T@U) (arg2@@101 Real) (arg3@@87 T@U) (arg4@@68 Real) (arg5@@62 T@U) (arg6@@56 Real) (arg7@@43 T@U) (arg8@@40 Real) (arg9@@33 Bool) (arg10@@30 T@U) (arg11@@24 Real) (arg12@@22 T@U) (arg13@@17 Real) ) (! (= (type (|wand_4#sm| arg0@@58 arg1@@112 arg2@@101 arg3@@87 arg4@@68 arg5@@62 arg6@@56 arg7@@43 arg8@@40 arg9@@33 arg10@@30 arg11@@24 arg12@@22 arg13@@17)) (FieldType WandType_wand_4Type (MapType0Type RefType boolType)))
 :qid |funType:wand_4#sm|
 :pattern ( (|wand_4#sm| arg0@@58 arg1@@112 arg2@@101 arg3@@87 arg4@@68 arg5@@62 arg6@@56 arg7@@43 arg8@@40 arg9@@33 arg10@@30 arg11@@24 arg12@@22 arg13@@17))
)))
(assert (forall ((arg1@@113 Bool) (arg2@@102 T@U) (arg3@@88 Real) (arg4@@69 T@U) (arg5@@63 Real) (arg6@@57 T@U) (arg7@@44 Real) (arg8@@41 T@U) (arg9@@34 Real) (arg10@@31 Bool) (arg11@@25 T@U) (arg12@@23 Real) (arg13@@18 T@U) (arg14@@15 Real) ) (!  (=> (and (and (and (and (and (= (type arg2@@102) RefType) (= (type arg4@@69) RefType)) (= (type arg6@@57) RefType)) (= (type arg8@@41) RefType)) (= (type arg11@@25) RefType)) (= (type arg13@@18) RefType)) (= (|wand_4#sm| arg1@@113 arg2@@102 arg3@@88 arg4@@69 arg5@@63 arg6@@57 arg7@@44 arg8@@41 arg9@@34 arg10@@31 arg11@@25 arg12@@23 arg13@@18 arg14@@15) (WandMaskField (|wand_4#ft| arg1@@113 arg2@@102 arg3@@88 arg4@@69 arg5@@63 arg6@@57 arg7@@44 arg8@@41 arg9@@34 arg10@@31 arg11@@25 arg12@@23 arg13@@18 arg14@@15))))
 :qid |stdinbpl.327:15|
 :skolemid |54|
 :pattern ( (WandMaskField (|wand_4#ft| arg1@@113 arg2@@102 arg3@@88 arg4@@69 arg5@@63 arg6@@57 arg7@@44 arg8@@41 arg9@@34 arg10@@31 arg11@@25 arg12@@23 arg13@@18 arg14@@15)))
)))
(assert (forall ((o T@U) (f T@U) (Heap@@8 T@U) ) (!  (=> (and (and (and (= (type o) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap@@8) (MapType1Type RefType))) (U_2_bool (MapType1Select Heap@@8 o $allocated))) (U_2_bool (MapType1Select Heap@@8 (MapType1Select Heap@@8 o f) $allocated)))
 :qid |stdinbpl.31:15|
 :skolemid |0|
 :pattern ( (MapType1Select Heap@@8 o f))
)))
(assert (forall ((x@@13 T@U) (b_2@@4 Bool) ) (!  (=> (= (type x@@13) RefType) (= (PredicateMaskField (P x@@13 b_2@@4)) (|P#sm| x@@13 b_2@@4)))
 :qid |stdinbpl.553:15|
 :skolemid |99|
 :pattern ( (PredicateMaskField (P x@@13 b_2@@4)))
)))
(assert (forall ((arg0@@59 Bool) (arg1@@114 Bool) ) (! (= (type (|wand_6#sm| arg0@@59 arg1@@114)) (FieldType WandType_wand_6Type (MapType0Type RefType boolType)))
 :qid |funType:wand_6#sm|
 :pattern ( (|wand_6#sm| arg0@@59 arg1@@114))
)))
(assert (forall ((arg1@@115 Bool) (arg2@@103 Bool) ) (! (= (|wand_6#sm| arg1@@115 arg2@@103) (WandMaskField (|wand_6#ft| arg1@@115 arg2@@103)))
 :qid |stdinbpl.455:15|
 :skolemid |82|
 :pattern ( (WandMaskField (|wand_6#ft| arg1@@115 arg2@@103)))
)))
(assert (forall ((arg0@@60 Bool) (arg1@@116 T@U) (arg2@@104 Real) (arg3@@89 T@U) (arg4@@70 Real) (arg5@@64 T@U) (arg6@@58 Real) (arg7@@45 Bool) (arg8@@42 T@U) (arg9@@35 Real) (arg10@@32 T@U) (arg11@@26 Real) ) (! (= (type (|wand_2#sm| arg0@@60 arg1@@116 arg2@@104 arg3@@89 arg4@@70 arg5@@64 arg6@@58 arg7@@45 arg8@@42 arg9@@35 arg10@@32 arg11@@26)) (FieldType WandType_wand_2Type (MapType0Type RefType boolType)))
 :qid |funType:wand_2#sm|
 :pattern ( (|wand_2#sm| arg0@@60 arg1@@116 arg2@@104 arg3@@89 arg4@@70 arg5@@64 arg6@@58 arg7@@45 arg8@@42 arg9@@35 arg10@@32 arg11@@26))
)))
(assert (forall ((arg1@@117 Bool) (arg2@@105 T@U) (arg3@@90 Real) (arg4@@71 T@U) (arg5@@65 Real) (arg6@@59 T@U) (arg7@@46 Real) (arg8@@43 Bool) (arg9@@36 T@U) (arg10@@33 Real) (arg11@@27 T@U) (arg12@@24 Real) ) (!  (=> (and (and (and (and (= (type arg2@@105) RefType) (= (type arg4@@71) RefType)) (= (type arg6@@59) RefType)) (= (type arg9@@36) RefType)) (= (type arg11@@27) RefType)) (= (|wand_2#sm| arg1@@117 arg2@@105 arg3@@90 arg4@@71 arg5@@65 arg6@@59 arg7@@46 arg8@@43 arg9@@36 arg10@@33 arg11@@27 arg12@@24) (WandMaskField (|wand_2#ft| arg1@@117 arg2@@105 arg3@@90 arg4@@71 arg5@@65 arg6@@59 arg7@@46 arg8@@43 arg9@@36 arg10@@33 arg11@@27 arg12@@24))))
 :qid |stdinbpl.231:15|
 :skolemid |33|
 :pattern ( (WandMaskField (|wand_2#ft| arg1@@117 arg2@@105 arg3@@90 arg4@@71 arg5@@65 arg6@@59 arg7@@46 arg8@@43 arg9@@36 arg10@@33 arg11@@27 arg12@@24)))
)))
(assert (forall ((Heap@@9 T@U) (o@@0 T@U) (f_3 T@U) (v T@U) ) (! (let ((B@@8 (type v)))
(let ((A@@9 (FieldTypeInv0 (type f_3))))
 (=> (and (and (= (type Heap@@9) (MapType1Type RefType)) (= (type o@@0) RefType)) (= (type f_3) (FieldType A@@9 B@@8))) (succHeap Heap@@9 (MapType1Store Heap@@9 o@@0 f_3 v)))))
 :qid |stdinbpl.78:22|
 :skolemid |9|
 :pattern ( (MapType1Store Heap@@9 o@@0 f_3 v))
)))
(assert (forall ((arg1@@118 Bool) (arg2@@106 T@U) (arg3@@91 Real) (arg4@@72 T@U) (arg5@@66 Real) (arg6@@60 Bool) (arg1_2@@7 Bool) (arg2_2@@7 T@U) (arg3_2@@6 Real) (arg4_2@@4 T@U) (arg5_2@@4 Real) (arg6_2@@4 Bool) ) (!  (=> (and (and (and (and (= (type arg2@@106) RefType) (= (type arg4@@72) RefType)) (= (type arg2_2@@7) RefType)) (= (type arg4_2@@4) RefType)) (= (wand arg1@@118 arg2@@106 arg3@@91 arg4@@72 arg5@@66 arg6@@60) (wand arg1_2@@7 arg2_2@@7 arg3_2@@6 arg4_2@@4 arg5_2@@4 arg6_2@@4))) (and (= arg1@@118 arg1_2@@7) (and (= arg2@@106 arg2_2@@7) (and (= arg3@@91 arg3_2@@6) (and (= arg4@@72 arg4_2@@4) (and (= arg5@@66 arg5_2@@4) (= arg6@@60 arg6_2@@4)))))))
 :qid |stdinbpl.303:15|
 :skolemid |49|
 :pattern ( (wand arg1@@118 arg2@@106 arg3@@91 arg4@@72 arg5@@66 arg6@@60) (wand arg1_2@@7 arg2_2@@7 arg3_2@@6 arg4_2@@4 arg5_2@@4 arg6_2@@4))
)))
(assert (forall ((arg1@@119 Bool) (arg2@@107 T@U) (arg3@@92 Real) (arg4@@73 T@U) (arg5@@67 Real) (arg6@@61 T@U) (arg7@@47 Real) (arg8@@44 Bool) (arg9@@37 T@U) (arg10@@34 Real) (arg11@@28 T@U) (arg12@@25 Real) (arg1_2@@8 Bool) (arg2_2@@8 T@U) (arg3_2@@7 Real) (arg4_2@@5 T@U) (arg5_2@@5 Real) (arg6_2@@5 T@U) (arg7_2@@3 Real) (arg8_2@@3 Bool) (arg9_2@@2 T@U) (arg10_2@@2 Real) (arg11_2@@1 T@U) (arg12_2@@1 Real) ) (!  (=> (and (and (and (and (and (and (and (and (and (and (= (type arg2@@107) RefType) (= (type arg4@@73) RefType)) (= (type arg6@@61) RefType)) (= (type arg9@@37) RefType)) (= (type arg11@@28) RefType)) (= (type arg2_2@@8) RefType)) (= (type arg4_2@@5) RefType)) (= (type arg6_2@@5) RefType)) (= (type arg9_2@@2) RefType)) (= (type arg11_2@@1) RefType)) (= (wand_2 arg1@@119 arg2@@107 arg3@@92 arg4@@73 arg5@@67 arg6@@61 arg7@@47 arg8@@44 arg9@@37 arg10@@34 arg11@@28 arg12@@25) (wand_2 arg1_2@@8 arg2_2@@8 arg3_2@@7 arg4_2@@5 arg5_2@@5 arg6_2@@5 arg7_2@@3 arg8_2@@3 arg9_2@@2 arg10_2@@2 arg11_2@@1 arg12_2@@1))) (and (= arg1@@119 arg1_2@@8) (and (= arg2@@107 arg2_2@@8) (and (= arg3@@92 arg3_2@@7) (and (= arg4@@73 arg4_2@@5) (and (= arg5@@67 arg5_2@@5) (and (= arg6@@61 arg6_2@@5) (and (= arg7@@47 arg7_2@@3) (and (= arg8@@44 arg8_2@@3) (and (= arg9@@37 arg9_2@@2) (and (= arg10@@34 arg10_2@@2) (and (= arg11@@28 arg11_2@@1) (= arg12@@25 arg12_2@@1)))))))))))))
 :qid |stdinbpl.239:15|
 :skolemid |35|
 :pattern ( (wand_2 arg1@@119 arg2@@107 arg3@@92 arg4@@73 arg5@@67 arg6@@61 arg7@@47 arg8@@44 arg9@@37 arg10@@34 arg11@@28 arg12@@25) (wand_2 arg1_2@@8 arg2_2@@8 arg3_2@@7 arg4_2@@5 arg5_2@@5 arg6_2@@5 arg7_2@@3 arg8_2@@3 arg9_2@@2 arg10_2@@2 arg11_2@@1 arg12_2@@1))
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
(assert (forall ((arg1@@120 Bool) (arg2@@108 Bool) (arg3@@93 T@U) (arg4@@74 Real) (arg1_2@@9 Bool) (arg2_2@@9 Bool) (arg3_2@@8 T@U) (arg4_2@@6 Real) ) (!  (=> (and (and (= (type arg3@@93) RefType) (= (type arg3_2@@8) RefType)) (= (wand_5 arg1@@120 arg2@@108 arg3@@93 arg4@@74) (wand_5 arg1_2@@9 arg2_2@@9 arg3_2@@8 arg4_2@@6))) (and (= arg1@@120 arg1_2@@9) (and (= arg2@@108 arg2_2@@9) (and (= arg3@@93 arg3_2@@8) (= arg4@@74 arg4_2@@6)))))
 :qid |stdinbpl.367:15|
 :skolemid |63|
 :pattern ( (wand_5 arg1@@120 arg2@@108 arg3@@93 arg4@@74) (wand_5 arg1_2@@9 arg2_2@@9 arg3_2@@8 arg4_2@@6))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
(assert (forall ((arg1@@121 Bool) (arg2@@109 T@U) (arg3@@94 Real) (arg4@@75 T@U) (arg5@@68 Real) (arg6@@62 Bool) (arg7@@48 T@U) (arg8@@45 Real) (arg9@@38 T@U) (arg10@@35 Real) ) (!  (=> (and (and (and (= (type arg2@@109) RefType) (= (type arg4@@75) RefType)) (= (type arg7@@48) RefType)) (= (type arg9@@38) RefType)) (= (getPredWandId (wand_9 arg1@@121 arg2@@109 arg3@@94 arg4@@75 arg5@@68 arg6@@62 arg7@@48 arg8@@45 arg9@@38 arg10@@35)) 10))
 :qid |stdinbpl.491:15|
 :skolemid |90|
 :pattern ( (wand_9 arg1@@121 arg2@@109 arg3@@94 arg4@@75 arg5@@68 arg6@@62 arg7@@48 arg8@@45 arg9@@38 arg10@@35))
)))
(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun Heap@13 () T@U)
(declare-fun Mask@16 () T@U)
(declare-fun b1 () Bool)
(declare-fun b2@@1 () Bool)
(declare-fun x@@14 () T@U)
(declare-fun Mask@15 () T@U)
(declare-fun b_17@12 () Bool)
(declare-fun b_18@37 () Bool)
(declare-fun neededTransfer@29 () Real)
(declare-fun Used_7Mask@24 () T@U)
(declare-fun initNeededTransfer@4 () Real)
(declare-fun b_23@0 () Bool)
(declare-fun b_23@1 () Bool)
(declare-fun Result_11Heap () T@U)
(declare-fun Result_11Mask () T@U)
(declare-fun b_23@2 () Bool)
(declare-fun Ops_7Mask () T@U)
(declare-fun b_23@3 () Bool)
(declare-fun Ops_7Heap@0 () T@U)
(declare-fun Used_7Heap@0 () T@U)
(declare-fun b_23@4 () Bool)
(declare-fun b_17@14 () Bool)
(declare-fun Heap@12 () T@U)
(declare-fun Mask@14 () T@U)
(declare-fun takeTransfer@11 () Real)
(declare-fun Mask@10 () T@U)
(declare-fun Heap@8 () T@U)
(declare-fun neededTransfer@27 () Real)
(declare-fun b_18@34 () Bool)
(declare-fun Used_7Mask@22 () T@U)
(declare-fun neededTransfer@28 () Real)
(declare-fun Used_7Mask@23 () T@U)
(declare-fun b_18@35 () Bool)
(declare-fun b_18@36 () Bool)
(declare-fun Mask@13 () T@U)
(declare-fun Heap@11 () T@U)
(declare-fun maskTransfer@11 () Real)
(declare-fun takeTransfer@10 () Real)
(declare-fun Used_7Mask@16 () T@U)
(declare-fun b_18@25 () Bool)
(declare-fun neededTransfer@20 () Real)
(declare-fun neededTransfer@26 () Real)
(declare-fun Used_7Mask@21 () T@U)
(declare-fun b_18@32 () Bool)
(declare-fun b_18@33 () Bool)
(declare-fun Ops_7Mask@13 () T@U)
(declare-fun Ops_7Mask@11 () T@U)
(declare-fun maskTransfer@10 () Real)
(declare-fun b_18@31 () Bool)
(declare-fun neededTransfer@25 () Real)
(declare-fun Used_7Mask@20 () T@U)
(declare-fun initNeededTransfer@5 () Real)
(declare-fun b_24@0 () Bool)
(declare-fun b_24@1 () Bool)
(declare-fun Result_12Heap () T@U)
(declare-fun Result_12Mask () T@U)
(declare-fun b_24@2 () Bool)
(declare-fun b_24@3 () Bool)
(declare-fun b_24@4 () Bool)
(declare-fun b_17@13 () Bool)
(declare-fun Heap@10 () T@U)
(declare-fun Mask@12 () T@U)
(declare-fun takeTransfer@9 () Real)
(declare-fun neededTransfer@23 () Real)
(declare-fun b_18@28 () Bool)
(declare-fun Used_7Mask@18 () T@U)
(declare-fun neededTransfer@24 () Real)
(declare-fun Used_7Mask@19 () T@U)
(declare-fun b_18@29 () Bool)
(declare-fun b_18@30 () Bool)
(declare-fun Mask@11 () T@U)
(declare-fun Heap@9 () T@U)
(declare-fun maskTransfer@9 () Real)
(declare-fun takeTransfer@8 () Real)
(declare-fun neededTransfer@21 () Real)
(declare-fun neededTransfer@22 () Real)
(declare-fun Used_7Mask@17 () T@U)
(declare-fun b_18@26 () Bool)
(declare-fun b_18@27 () Bool)
(declare-fun Ops_7Mask@12 () T@U)
(declare-fun maskTransfer@8 () Real)
(declare-fun b_17@10 () Bool)
(declare-fun b_18@24 () Bool)
(declare-fun neededTransfer@19 () Real)
(declare-fun Used_7Mask@15 () T@U)
(declare-fun initNeededTransfer@3 () Real)
(declare-fun b_20@0 () Bool)
(declare-fun b_20@1 () Bool)
(declare-fun Result_8Heap () T@U)
(declare-fun Result_8Mask () T@U)
(declare-fun b_20@2 () Bool)
(declare-fun Ops_7Mask@10 () T@U)
(declare-fun b_20@3 () Bool)
(declare-fun b_20@4 () Bool)
(declare-fun b_17@11 () Bool)
(declare-fun Heap@7 () T@U)
(declare-fun Mask@9 () T@U)
(declare-fun takeTransfer@7 () Real)
(declare-fun neededTransfer@17 () Real)
(declare-fun b_18@21 () Bool)
(declare-fun Mask@7 () T@U)
(declare-fun Used_7Mask@13 () T@U)
(declare-fun Heap@5 () T@U)
(declare-fun neededTransfer@18 () Real)
(declare-fun Used_7Mask@14 () T@U)
(declare-fun b_18@22 () Bool)
(declare-fun b_18@23 () Bool)
(declare-fun Mask@8 () T@U)
(declare-fun Heap@6 () T@U)
(declare-fun maskTransfer@7 () Real)
(declare-fun takeTransfer@6 () Real)
(declare-fun Used_7Mask@11 () T@U)
(declare-fun b_18@18 () Bool)
(declare-fun neededTransfer@15 () Real)
(declare-fun Ops_7Mask@8 () T@U)
(declare-fun neededTransfer@16 () Real)
(declare-fun Used_7Mask@12 () T@U)
(declare-fun b_18@19 () Bool)
(declare-fun b_18@20 () Bool)
(declare-fun Ops_7Mask@9 () T@U)
(declare-fun maskTransfer@6 () Real)
(declare-fun b_17@7 () Bool)
(declare-fun neededTransfer@14 () Real)
(declare-fun initNeededTransfer@0 () Real)
(declare-fun b_19@0 () Bool)
(declare-fun b_19@1 () Bool)
(declare-fun Result_7Heap () T@U)
(declare-fun Result_7Mask () T@U)
(declare-fun b_19@2 () Bool)
(declare-fun b_19@3 () Bool)
(declare-fun b_19@4 () Bool)
(declare-fun takeTransfer@5 () Real)
(declare-fun Mask@1 () T@U)
(declare-fun neededTransfer@12 () Real)
(declare-fun b_18@15 () Bool)
(declare-fun Used_7Mask@9 () T@U)
(declare-fun Heap@@10 () T@U)
(declare-fun neededTransfer@13 () Real)
(declare-fun Used_7Mask@10 () T@U)
(declare-fun b_18@16 () Bool)
(declare-fun b_18@17 () Bool)
(declare-fun Mask@6 () T@U)
(declare-fun Heap@4 () T@U)
(declare-fun maskTransfer@5 () Real)
(declare-fun takeTransfer@4 () Real)
(declare-fun Ops_7Mask@2 () T@U)
(declare-fun b_18@0 () Bool)
(declare-fun neededTransfer@0 () Real)
(declare-fun neededTransfer@11 () Real)
(declare-fun Used_7Mask@8 () T@U)
(declare-fun b_18@13 () Bool)
(declare-fun b_18@14 () Bool)
(declare-fun Ops_7Mask@7 () T@U)
(declare-fun maskTransfer@4 () Real)
(declare-fun b_17@8 () Bool)
(declare-fun b_18@12 () Bool)
(declare-fun neededTransfer@10 () Real)
(declare-fun Used_7Mask@7 () T@U)
(declare-fun initNeededTransfer@2 () Real)
(declare-fun b_22@0 () Bool)
(declare-fun b_22@1 () Bool)
(declare-fun Result_10Heap () T@U)
(declare-fun Result_10Mask () T@U)
(declare-fun b_22@2 () Bool)
(declare-fun Ops_7Mask@6 () T@U)
(declare-fun b_22@3 () Bool)
(declare-fun b_22@4 () Bool)
(declare-fun b_17@9 () Bool)
(declare-fun Heap@3 () T@U)
(declare-fun Mask@5 () T@U)
(declare-fun takeTransfer@3 () Real)
(declare-fun neededTransfer@8 () Real)
(declare-fun b_18@9 () Bool)
(declare-fun Mask@3 () T@U)
(declare-fun Used_7Mask@5 () T@U)
(declare-fun Heap@1 () T@U)
(declare-fun neededTransfer@9 () Real)
(declare-fun Used_7Mask@6 () T@U)
(declare-fun b_18@10 () Bool)
(declare-fun b_18@11 () Bool)
(declare-fun Mask@4 () T@U)
(declare-fun Heap@2 () T@U)
(declare-fun maskTransfer@3 () Real)
(declare-fun takeTransfer@2 () Real)
(declare-fun Used_7Mask@3 () T@U)
(declare-fun b_18@6 () Bool)
(declare-fun neededTransfer@6 () Real)
(declare-fun Ops_7Mask@4 () T@U)
(declare-fun neededTransfer@7 () Real)
(declare-fun Used_7Mask@4 () T@U)
(declare-fun b_18@7 () Bool)
(declare-fun b_18@8 () Bool)
(declare-fun Ops_7Mask@5 () T@U)
(declare-fun maskTransfer@2 () Real)
(declare-fun neededTransfer@5 () Real)
(declare-fun initNeededTransfer@1 () Real)
(declare-fun b_21@0 () Bool)
(declare-fun b_21@1 () Bool)
(declare-fun Result_9Heap () T@U)
(declare-fun Result_9Mask () T@U)
(declare-fun b_21@2 () Bool)
(declare-fun b_21@3 () Bool)
(declare-fun b_21@4 () Bool)
(declare-fun takeTransfer@1 () Real)
(declare-fun neededTransfer@3 () Real)
(declare-fun b_18@3 () Bool)
(declare-fun Used_7Mask@1 () T@U)
(declare-fun neededTransfer@4 () Real)
(declare-fun Used_7Mask@2 () T@U)
(declare-fun b_18@4 () Bool)
(declare-fun b_18@5 () Bool)
(declare-fun Mask@2 () T@U)
(declare-fun Heap@0 () T@U)
(declare-fun maskTransfer@1 () Real)
(declare-fun takeTransfer@0 () Real)
(declare-fun neededTransfer@1 () Real)
(declare-fun neededTransfer@2 () Real)
(declare-fun Used_7Mask@0 () T@U)
(declare-fun b_18@1 () Bool)
(declare-fun b_18@2 () Bool)
(declare-fun Ops_7Mask@3 () T@U)
(declare-fun maskTransfer@0 () Real)
(declare-fun b_17@6 () Bool)
(declare-fun b_17@5 () Bool)
(declare-fun b_18 () Bool)
(declare-fun b_17@0 () Bool)
(declare-fun perm@1 () Real)
(declare-fun b_17@3 () Bool)
(declare-fun Ops_7Mask@1 () T@U)
(declare-fun b_17@4 () Bool)
(declare-fun perm@0 () Real)
(declare-fun b_17@1 () Bool)
(declare-fun Ops_7Mask@0 () T@U)
(declare-fun b_17@2 () Bool)
(declare-fun Mask@0 () T@U)
(declare-fun b_17 () Bool)
(declare-fun b_16@0 () Bool)
(declare-fun b_16 () Bool)
(declare-fun Used_6Heap@0 () T@U)
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (= (type Heap@13) (MapType1Type RefType)) (= (type Mask@16) (MapType0Type RefType realType))) (= (type x@@14) RefType)) (= (type Mask@15) (MapType0Type RefType realType))) (= (type Heap@8) (MapType1Type RefType))) (= (type Mask@10) (MapType0Type RefType realType))) (= (type Used_7Mask@20) (MapType0Type RefType realType))) (= (type Result_12Heap) (MapType1Type RefType))) (= (type Result_12Mask) (MapType0Type RefType realType))) (= (type Ops_7Mask) (MapType0Type RefType realType))) (= (type Ops_7Heap@0) (MapType1Type RefType))) (= (type Used_7Heap@0) (MapType1Type RefType))) (= (type Heap@10) (MapType1Type RefType))) (= (type Mask@12) (MapType0Type RefType realType))) (= (type Used_7Mask@18) (MapType0Type RefType realType))) (= (type Used_7Mask@19) (MapType0Type RefType realType))) (= (type Mask@11) (MapType0Type RefType realType))) (= (type Heap@9) (MapType1Type RefType))) (= (type Used_7Mask@16) (MapType0Type RefType realType))) (= (type Used_7Mask@17) (MapType0Type RefType realType))) (= (type Ops_7Mask@12) (MapType0Type RefType realType))) (= (type Ops_7Mask@11) (MapType0Type RefType realType))) (= (type Used_7Mask@24) (MapType0Type RefType realType))) (= (type Result_11Heap) (MapType1Type RefType))) (= (type Result_11Mask) (MapType0Type RefType realType))) (= (type Heap@12) (MapType1Type RefType))) (= (type Mask@14) (MapType0Type RefType realType))) (= (type Used_7Mask@22) (MapType0Type RefType realType))) (= (type Used_7Mask@23) (MapType0Type RefType realType))) (= (type Mask@13) (MapType0Type RefType realType))) (= (type Heap@11) (MapType1Type RefType))) (= (type Used_7Mask@21) (MapType0Type RefType realType))) (= (type Ops_7Mask@13) (MapType0Type RefType realType))) (= (type Ops_7Mask@2) (MapType0Type RefType realType))) (= (type Heap@@10) (MapType1Type RefType))) (= (type Mask@1) (MapType0Type RefType realType))) (= (type Used_7Mask@7) (MapType0Type RefType realType))) (= (type Result_10Heap) (MapType1Type RefType))) (= (type Result_10Mask) (MapType0Type RefType realType))) (= (type Ops_7Mask@6) (MapType0Type RefType realType))) (= (type Heap@3) (MapType1Type RefType))) (= (type Mask@5) (MapType0Type RefType realType))) (= (type Mask@3) (MapType0Type RefType realType))) (= (type Used_7Mask@5) (MapType0Type RefType realType))) (= (type Heap@1) (MapType1Type RefType))) (= (type Used_7Mask@6) (MapType0Type RefType realType))) (= (type Mask@4) (MapType0Type RefType realType))) (= (type Heap@2) (MapType1Type RefType))) (= (type Used_7Mask@3) (MapType0Type RefType realType))) (= (type Ops_7Mask@4) (MapType0Type RefType realType))) (= (type Used_7Mask@4) (MapType0Type RefType realType))) (= (type Ops_7Mask@5) (MapType0Type RefType realType))) (= (type Result_9Heap) (MapType1Type RefType))) (= (type Result_9Mask) (MapType0Type RefType realType))) (= (type Used_7Mask@1) (MapType0Type RefType realType))) (= (type Used_7Mask@2) (MapType0Type RefType realType))) (= (type Mask@2) (MapType0Type RefType realType))) (= (type Heap@0) (MapType1Type RefType))) (= (type Used_7Mask@0) (MapType0Type RefType realType))) (= (type Ops_7Mask@3) (MapType0Type RefType realType))) (= (type Used_7Mask@15) (MapType0Type RefType realType))) (= (type Result_8Heap) (MapType1Type RefType))) (= (type Result_8Mask) (MapType0Type RefType realType))) (= (type Ops_7Mask@10) (MapType0Type RefType realType))) (= (type Heap@7) (MapType1Type RefType))) (= (type Mask@9) (MapType0Type RefType realType))) (= (type Mask@7) (MapType0Type RefType realType))) (= (type Used_7Mask@13) (MapType0Type RefType realType))) (= (type Heap@5) (MapType1Type RefType))) (= (type Used_7Mask@14) (MapType0Type RefType realType))) (= (type Mask@8) (MapType0Type RefType realType))) (= (type Heap@6) (MapType1Type RefType))) (= (type Used_7Mask@11) (MapType0Type RefType realType))) (= (type Ops_7Mask@8) (MapType0Type RefType realType))) (= (type Used_7Mask@12) (MapType0Type RefType realType))) (= (type Ops_7Mask@9) (MapType0Type RefType realType))) (= (type Result_7Heap) (MapType1Type RefType))) (= (type Result_7Mask) (MapType0Type RefType realType))) (= (type Used_7Mask@9) (MapType0Type RefType realType))) (= (type Used_7Mask@10) (MapType0Type RefType realType))) (= (type Mask@6) (MapType0Type RefType realType))) (= (type Heap@4) (MapType1Type RefType))) (= (type Used_7Mask@8) (MapType0Type RefType realType))) (= (type Ops_7Mask@7) (MapType0Type RefType realType))) (= (type Ops_7Mask@0) (MapType0Type RefType realType))) (= (type Ops_7Mask@1) (MapType0Type RefType realType))) (= (type Mask@0) (MapType0Type RefType realType))) (= (type Used_6Heap@0) (MapType1Type RefType))))
(set-info :boogie-vc-id test02)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 153) (let ((anon102_correct  (=> (and (state Heap@13 Mask@16) (= (ControlFlow 0 2) (- 0 1))) false)))
(let ((anon154_Else_correct  (=> (and (not (and (not b1) (not b2@@1))) (= (ControlFlow 0 6) 2)) anon102_correct)))
(let ((anon154_Then_correct  (=> (and (not b1) (not b2@@1)) (and (=> (= (ControlFlow 0 3) (- 0 5)) (= (U_2_real (MapType0Select Mask@16 x@@14 f_7)) (/ (to_real 8) (to_real 10)))) (=> (= (U_2_real (MapType0Select Mask@16 x@@14 f_7)) (/ (to_real 8) (to_real 10))) (and (=> (= (ControlFlow 0 3) (- 0 4)) (= (U_2_real (MapType0Select Mask@16 x@@14 g)) (/ (to_real 9) (to_real 10)))) (=> (= (U_2_real (MapType0Select Mask@16 x@@14 g)) (/ (to_real 9) (to_real 10))) (=> (= (ControlFlow 0 3) 2) anon102_correct))))))))
(let ((anon100_correct  (=> (state Heap@13 Mask@16) (and (=> (= (ControlFlow 0 7) 3) anon154_Then_correct) (=> (= (ControlFlow 0 7) 6) anon154_Else_correct)))))
(let ((anon153_Else_correct  (=> (and (not (and (not b1) b2@@1)) (= (ControlFlow 0 11) 7)) anon100_correct)))
(let ((anon153_Then_correct  (=> (and (not b1) b2@@1) (and (=> (= (ControlFlow 0 8) (- 0 10)) (= (U_2_real (MapType0Select Mask@16 x@@14 f_7)) (/ (to_real 6) (to_real 10)))) (=> (= (U_2_real (MapType0Select Mask@16 x@@14 f_7)) (/ (to_real 6) (to_real 10))) (and (=> (= (ControlFlow 0 8) (- 0 9)) (= (U_2_real (MapType0Select Mask@16 x@@14 g)) (/ (to_real 10) (to_real 10)))) (=> (= (U_2_real (MapType0Select Mask@16 x@@14 g)) (/ (to_real 10) (to_real 10))) (=> (= (ControlFlow 0 8) 7) anon100_correct))))))))
(let ((anon98_correct  (=> (state Heap@13 Mask@16) (and (=> (= (ControlFlow 0 12) 8) anon153_Then_correct) (=> (= (ControlFlow 0 12) 11) anon153_Else_correct)))))
(let ((anon152_Else_correct  (=> (and (not (and b1 (not b2@@1))) (= (ControlFlow 0 16) 12)) anon98_correct)))
(let ((anon152_Then_correct  (=> (and b1 (not b2@@1)) (and (=> (= (ControlFlow 0 13) (- 0 15)) (= (U_2_real (MapType0Select Mask@16 x@@14 f_7)) (/ (to_real 10) (to_real 10)))) (=> (= (U_2_real (MapType0Select Mask@16 x@@14 f_7)) (/ (to_real 10) (to_real 10))) (and (=> (= (ControlFlow 0 13) (- 0 14)) (= (U_2_real (MapType0Select Mask@16 x@@14 g)) (/ (to_real 6) (to_real 10)))) (=> (= (U_2_real (MapType0Select Mask@16 x@@14 g)) (/ (to_real 6) (to_real 10))) (=> (= (ControlFlow 0 13) 12) anon98_correct))))))))
(let ((anon96_correct  (=> (state Heap@13 Mask@16) (and (=> (= (ControlFlow 0 17) 13) anon152_Then_correct) (=> (= (ControlFlow 0 17) 16) anon152_Else_correct)))))
(let ((anon151_Else_correct  (=> (and (not (and b1 b2@@1)) (= (ControlFlow 0 21) 17)) anon96_correct)))
(let ((anon151_Then_correct  (=> (and b1 b2@@1) (and (=> (= (ControlFlow 0 18) (- 0 20)) (= (U_2_real (MapType0Select Mask@16 x@@14 f_7)) (/ (to_real 9) (to_real 10)))) (=> (= (U_2_real (MapType0Select Mask@16 x@@14 f_7)) (/ (to_real 9) (to_real 10))) (and (=> (= (ControlFlow 0 18) (- 0 19)) (= (U_2_real (MapType0Select Mask@16 x@@14 g)) (/ (to_real 8) (to_real 10)))) (=> (= (U_2_real (MapType0Select Mask@16 x@@14 g)) (/ (to_real 8) (to_real 10))) (=> (= (ControlFlow 0 18) 17) anon96_correct))))))))
(let ((anon94_correct  (=> (state Heap@13 Mask@16) (and (=> (= (ControlFlow 0 22) 18) anon151_Then_correct) (=> (= (ControlFlow 0 22) 21) anon151_Else_correct)))))
(let ((anon150_Else_correct  (=> (and (not (and (not b1) (not b2@@1))) (= (ControlFlow 0 26) 22)) anon94_correct)))
(let ((anon150_Then_correct  (=> (and (not b1) (not b2@@1)) (and (=> (= (ControlFlow 0 23) (- 0 25)) (<= (/ (to_real 8) (to_real 10)) (U_2_real (MapType0Select Mask@16 x@@14 f_7)))) (=> (<= (/ (to_real 8) (to_real 10)) (U_2_real (MapType0Select Mask@16 x@@14 f_7))) (and (=> (= (ControlFlow 0 23) (- 0 24)) (<= (/ (to_real 9) (to_real 10)) (U_2_real (MapType0Select Mask@16 x@@14 g)))) (=> (<= (/ (to_real 9) (to_real 10)) (U_2_real (MapType0Select Mask@16 x@@14 g))) (=> (= (ControlFlow 0 23) 22) anon94_correct))))))))
(let ((anon92_correct  (=> (state Heap@13 Mask@16) (and (=> (= (ControlFlow 0 27) 23) anon150_Then_correct) (=> (= (ControlFlow 0 27) 26) anon150_Else_correct)))))
(let ((anon149_Else_correct  (=> (and (not (and (not b1) b2@@1)) (= (ControlFlow 0 31) 27)) anon92_correct)))
(let ((anon149_Then_correct  (=> (and (not b1) b2@@1) (and (=> (= (ControlFlow 0 28) (- 0 30)) (<= (/ (to_real 6) (to_real 10)) (U_2_real (MapType0Select Mask@16 x@@14 f_7)))) (=> (<= (/ (to_real 6) (to_real 10)) (U_2_real (MapType0Select Mask@16 x@@14 f_7))) (and (=> (= (ControlFlow 0 28) (- 0 29)) (<= (/ (to_real 10) (to_real 10)) (U_2_real (MapType0Select Mask@16 x@@14 g)))) (=> (<= (/ (to_real 10) (to_real 10)) (U_2_real (MapType0Select Mask@16 x@@14 g))) (=> (= (ControlFlow 0 28) 27) anon92_correct))))))))
(let ((anon90_correct  (=> (state Heap@13 Mask@16) (and (=> (= (ControlFlow 0 32) 28) anon149_Then_correct) (=> (= (ControlFlow 0 32) 31) anon149_Else_correct)))))
(let ((anon148_Else_correct  (=> (and (not (and b1 (not b2@@1))) (= (ControlFlow 0 36) 32)) anon90_correct)))
(let ((anon148_Then_correct  (=> (and b1 (not b2@@1)) (and (=> (= (ControlFlow 0 33) (- 0 35)) (<= (/ (to_real 10) (to_real 10)) (U_2_real (MapType0Select Mask@16 x@@14 f_7)))) (=> (<= (/ (to_real 10) (to_real 10)) (U_2_real (MapType0Select Mask@16 x@@14 f_7))) (and (=> (= (ControlFlow 0 33) (- 0 34)) (<= (/ (to_real 6) (to_real 10)) (U_2_real (MapType0Select Mask@16 x@@14 g)))) (=> (<= (/ (to_real 6) (to_real 10)) (U_2_real (MapType0Select Mask@16 x@@14 g))) (=> (= (ControlFlow 0 33) 32) anon90_correct))))))))
(let ((anon88_correct  (=> (state Heap@13 Mask@16) (and (=> (= (ControlFlow 0 37) 33) anon148_Then_correct) (=> (= (ControlFlow 0 37) 36) anon148_Else_correct)))))
(let ((anon147_Else_correct  (=> (and (not (and b1 b2@@1)) (= (ControlFlow 0 41) 37)) anon88_correct)))
(let ((anon147_Then_correct  (=> (and b1 b2@@1) (and (=> (= (ControlFlow 0 38) (- 0 40)) (<= (/ (to_real 9) (to_real 10)) (U_2_real (MapType0Select Mask@16 x@@14 f_7)))) (=> (<= (/ (to_real 9) (to_real 10)) (U_2_real (MapType0Select Mask@16 x@@14 f_7))) (and (=> (= (ControlFlow 0 38) (- 0 39)) (<= (/ (to_real 8) (to_real 10)) (U_2_real (MapType0Select Mask@16 x@@14 g)))) (=> (<= (/ (to_real 8) (to_real 10)) (U_2_real (MapType0Select Mask@16 x@@14 g))) (=> (= (ControlFlow 0 38) 37) anon88_correct))))))))
(let ((anon86_correct  (=> (and (and (= Mask@16 (MapType0Store Mask@15 null (wand_3 b1 x@@14 (/ (to_real 1) (to_real 10)) x@@14 (/ (to_real 1) (to_real 10))  (not b1) x@@14 (/ (to_real 1) (to_real 10)) x@@14 (/ (to_real 1) (to_real 10)) x@@14 (/ (to_real 1) (to_real 10)) x@@14 (/ (to_real 1) (to_real 10)) b2@@1 x@@14 (/ (to_real 2) (to_real 10)) x@@14 (/ (to_real 2) (to_real 10))) (real_2_U (+ (U_2_real (MapType0Select Mask@15 null (wand_3 b1 x@@14 (/ (to_real 1) (to_real 10)) x@@14 (/ (to_real 1) (to_real 10))  (not b1) x@@14 (/ (to_real 1) (to_real 10)) x@@14 (/ (to_real 1) (to_real 10)) x@@14 (/ (to_real 1) (to_real 10)) x@@14 (/ (to_real 1) (to_real 10)) b2@@1 x@@14 (/ (to_real 2) (to_real 10)) x@@14 (/ (to_real 2) (to_real 10))))) FullPerm)))) (state Heap@13 Mask@16)) (and (state Heap@13 Mask@16) (state Heap@13 Mask@16))) (and (=> (= (ControlFlow 0 42) 38) anon147_Then_correct) (=> (= (ControlFlow 0 42) 41) anon147_Else_correct)))))
(let ((anon72_correct  (and (=> (= (ControlFlow 0 60) (- 0 61)) (=> (and (and b_17@12 b_17@12) b_18@37) (and (= neededTransfer@29 0.0) (= (U_2_real (MapType0Select Used_7Mask@24 x@@14 f_7)) initNeededTransfer@4)))) (=> (=> (and (and b_17@12 b_17@12) b_18@37) (and (= neededTransfer@29 0.0) (= (U_2_real (MapType0Select Used_7Mask@24 x@@14 f_7)) initNeededTransfer@4))) (=> (= b_23@0  (and b_17@12 b_18@37)) (=> (and (and (and (= b_23@1  (and b_23@0 (state Result_11Heap Result_11Mask))) (= b_23@2  (and b_23@1 (sumMask Result_11Mask Ops_7Mask Used_7Mask@24)))) (and (= b_23@3  (and (and b_23@2 (IdenticalOnKnownLocations Ops_7Heap@0 Result_11Heap Ops_7Mask)) (IdenticalOnKnownLocations Used_7Heap@0 Result_11Heap Used_7Mask@24))) (= b_23@4  (and b_23@3 (state Result_11Heap Result_11Mask))))) (and (and (= b_17@14  (and b_17@12 b_23@4)) (= Heap@13 Heap@12)) (and (= Mask@15 Mask@14) (= (ControlFlow 0 60) 42)))) anon86_correct))))))
(let ((anon140_Else_correct  (=> (>= 0.0 takeTransfer@11) (=> (and (= Mask@14 Mask@10) (= Heap@12 Heap@8)) (=> (and (and (= neededTransfer@29 neededTransfer@27) (= b_18@37 b_18@34)) (and (= Used_7Mask@24 Used_7Mask@22) (= (ControlFlow 0 64) 60))) anon72_correct)))))
(let ((anon140_Then_correct  (=> (> takeTransfer@11 0.0) (=> (and (and (= neededTransfer@28 (- neededTransfer@27 takeTransfer@11)) (= Used_7Mask@23 (MapType0Store Used_7Mask@22 x@@14 f_7 (real_2_U (+ (U_2_real (MapType0Select Used_7Mask@22 x@@14 f_7)) takeTransfer@11))))) (and (= b_18@35  (and b_18@34 (state Used_7Heap@0 Used_7Mask@23))) (= b_18@36  (and b_18@35 (= (U_2_bool (MapType1Select Heap@8 x@@14 f_7)) (U_2_bool (MapType1Select Used_7Heap@0 x@@14 f_7))))))) (=> (and (and (and (= Mask@13 (MapType0Store Mask@10 x@@14 f_7 (real_2_U (- (U_2_real (MapType0Select Mask@10 x@@14 f_7)) takeTransfer@11)))) (= Heap@11 (MapType1Store Heap@8 null (|wand_3#sm| b1 x@@14 (/ (to_real 1) (to_real 10)) x@@14 (/ (to_real 1) (to_real 10))  (not b1) x@@14 (/ (to_real 1) (to_real 10)) x@@14 (/ (to_real 1) (to_real 10)) x@@14 (/ (to_real 1) (to_real 10)) x@@14 (/ (to_real 1) (to_real 10)) b2@@1 x@@14 (/ (to_real 2) (to_real 10)) x@@14 (/ (to_real 2) (to_real 10))) (MapType0Store (MapType1Select Heap@8 null (|wand_3#sm| b1 x@@14 (/ (to_real 1) (to_real 10)) x@@14 (/ (to_real 1) (to_real 10))  (not b1) x@@14 (/ (to_real 1) (to_real 10)) x@@14 (/ (to_real 1) (to_real 10)) x@@14 (/ (to_real 1) (to_real 10)) x@@14 (/ (to_real 1) (to_real 10)) b2@@1 x@@14 (/ (to_real 2) (to_real 10)) x@@14 (/ (to_real 2) (to_real 10)))) x@@14 f_7 (bool_2_U true))))) (and (= Mask@14 Mask@13) (= Heap@12 Heap@11))) (and (and (= neededTransfer@29 neededTransfer@28) (= b_18@37 b_18@36)) (and (= Used_7Mask@24 Used_7Mask@23) (= (ControlFlow 0 63) 60)))) anon72_correct)))))
(let ((anon139_Else_correct  (=> (and (< maskTransfer@11 neededTransfer@27) (= takeTransfer@11 maskTransfer@11)) (and (=> (= (ControlFlow 0 66) 63) anon140_Then_correct) (=> (= (ControlFlow 0 66) 64) anon140_Else_correct)))))
(let ((anon139_Then_correct  (=> (and (<= neededTransfer@27 maskTransfer@11) (= takeTransfer@11 neededTransfer@27)) (and (=> (= (ControlFlow 0 65) 63) anon140_Then_correct) (=> (= (ControlFlow 0 65) 64) anon140_Else_correct)))))
(let ((anon138_Then_correct  (=> (and (and (and (and (and b_17@12 b_17@12) b_18@34) true) (> neededTransfer@27 0.0)) (= maskTransfer@11 (U_2_real (MapType0Select Mask@10 x@@14 f_7)))) (and (=> (= (ControlFlow 0 67) 65) anon139_Then_correct) (=> (= (ControlFlow 0 67) 66) anon139_Else_correct)))))
(let ((anon138_Else_correct  (=> (not (and (and (and (and b_17@12 b_17@12) b_18@34) true) (> neededTransfer@27 0.0))) (=> (and (= Mask@14 Mask@10) (= Heap@12 Heap@8)) (=> (and (and (= neededTransfer@29 neededTransfer@27) (= b_18@37 b_18@34)) (and (= Used_7Mask@24 Used_7Mask@22) (= (ControlFlow 0 62) 60))) anon72_correct)))))
(let ((anon137_Else_correct  (=> (and (and (>= 0.0 takeTransfer@10) (= Used_7Mask@22 Used_7Mask@16)) (and (= b_18@34 b_18@25) (= neededTransfer@27 neededTransfer@20))) (and (=> (= (ControlFlow 0 70) 67) anon138_Then_correct) (=> (= (ControlFlow 0 70) 62) anon138_Else_correct)))))
(let ((anon137_Then_correct  (=> (> takeTransfer@10 0.0) (=> (and (and (and (= neededTransfer@26 (- neededTransfer@20 takeTransfer@10)) (= Used_7Mask@21 (MapType0Store Used_7Mask@16 x@@14 f_7 (real_2_U (+ (U_2_real (MapType0Select Used_7Mask@16 x@@14 f_7)) takeTransfer@10))))) (and (= b_18@32  (and b_18@25 (state Used_7Heap@0 Used_7Mask@21))) (= b_18@33  (and b_18@32 (= (U_2_bool (MapType1Select Ops_7Heap@0 x@@14 f_7)) (U_2_bool (MapType1Select Used_7Heap@0 x@@14 f_7))))))) (and (and (= Ops_7Mask@13 (MapType0Store Ops_7Mask@11 x@@14 f_7 (real_2_U (- (U_2_real (MapType0Select Ops_7Mask@11 x@@14 f_7)) takeTransfer@10)))) (= Used_7Mask@22 Used_7Mask@21)) (and (= b_18@34 b_18@33) (= neededTransfer@27 neededTransfer@26)))) (and (=> (= (ControlFlow 0 69) 67) anon138_Then_correct) (=> (= (ControlFlow 0 69) 62) anon138_Else_correct))))))
(let ((anon136_Else_correct  (=> (and (< maskTransfer@10 neededTransfer@20) (= takeTransfer@10 maskTransfer@10)) (and (=> (= (ControlFlow 0 72) 69) anon137_Then_correct) (=> (= (ControlFlow 0 72) 70) anon137_Else_correct)))))
(let ((anon136_Then_correct  (=> (and (<= neededTransfer@20 maskTransfer@10) (= takeTransfer@10 neededTransfer@20)) (and (=> (= (ControlFlow 0 71) 69) anon137_Then_correct) (=> (= (ControlFlow 0 71) 70) anon137_Else_correct)))))
(let ((anon135_Then_correct  (=> (and (and (and (and (and b_17@12 b_17@12) b_18@25) true) (> neededTransfer@20 0.0)) (= maskTransfer@10 (U_2_real (MapType0Select Ops_7Mask@11 x@@14 f_7)))) (and (=> (= (ControlFlow 0 73) 71) anon136_Then_correct) (=> (= (ControlFlow 0 73) 72) anon136_Else_correct)))))
(let ((anon135_Else_correct  (=> (and (and (not (and (and (and (and b_17@12 b_17@12) b_18@25) true) (> neededTransfer@20 0.0))) (= Used_7Mask@22 Used_7Mask@16)) (and (= b_18@34 b_18@25) (= neededTransfer@27 neededTransfer@20))) (and (=> (= (ControlFlow 0 68) 67) anon138_Then_correct) (=> (= (ControlFlow 0 68) 62) anon138_Else_correct)))))
(let ((anon134_Then_correct  (=> b2@@1 (=> (and (= neededTransfer@20 (/ (to_real 2) (to_real 10))) (= initNeededTransfer@4 (+ (U_2_real (MapType0Select Used_7Mask@16 x@@14 f_7)) neededTransfer@20))) (and (=> (= (ControlFlow 0 74) (- 0 75)) (>= neededTransfer@20 0.0)) (=> (>= neededTransfer@20 0.0) (and (=> (= (ControlFlow 0 74) 73) anon135_Then_correct) (=> (= (ControlFlow 0 74) 68) anon135_Else_correct))))))))
(let ((anon85_correct  (and (=> (= (ControlFlow 0 44) (- 0 45)) (=> (and (and b_17@12 b_17@12) b_18@31) (and (= neededTransfer@25 0.0) (= (U_2_real (MapType0Select Used_7Mask@20 x@@14 g)) initNeededTransfer@5)))) (=> (=> (and (and b_17@12 b_17@12) b_18@31) (and (= neededTransfer@25 0.0) (= (U_2_real (MapType0Select Used_7Mask@20 x@@14 g)) initNeededTransfer@5))) (=> (= b_24@0  (and b_17@12 b_18@31)) (=> (and (and (and (= b_24@1  (and b_24@0 (state Result_12Heap Result_12Mask))) (= b_24@2  (and b_24@1 (sumMask Result_12Mask Ops_7Mask Used_7Mask@20)))) (and (= b_24@3  (and (and b_24@2 (IdenticalOnKnownLocations Ops_7Heap@0 Result_12Heap Ops_7Mask)) (IdenticalOnKnownLocations Used_7Heap@0 Result_12Heap Used_7Mask@20))) (= b_24@4  (and b_24@3 (state Result_12Heap Result_12Mask))))) (and (and (= b_17@13  (and b_17@12 b_24@4)) (= Heap@13 Heap@10)) (and (= Mask@15 Mask@12) (= (ControlFlow 0 44) 42)))) anon86_correct))))))
(let ((anon146_Else_correct  (=> (>= 0.0 takeTransfer@9) (=> (and (= Mask@12 Mask@10) (= Heap@10 Heap@8)) (=> (and (and (= neededTransfer@25 neededTransfer@23) (= b_18@31 b_18@28)) (and (= Used_7Mask@20 Used_7Mask@18) (= (ControlFlow 0 48) 44))) anon85_correct)))))
(let ((anon146_Then_correct  (=> (> takeTransfer@9 0.0) (=> (and (and (= neededTransfer@24 (- neededTransfer@23 takeTransfer@9)) (= Used_7Mask@19 (MapType0Store Used_7Mask@18 x@@14 g (real_2_U (+ (U_2_real (MapType0Select Used_7Mask@18 x@@14 g)) takeTransfer@9))))) (and (= b_18@29  (and b_18@28 (state Used_7Heap@0 Used_7Mask@19))) (= b_18@30  (and b_18@29 (= (U_2_int (MapType1Select Heap@8 x@@14 g)) (U_2_int (MapType1Select Used_7Heap@0 x@@14 g))))))) (=> (and (and (and (= Mask@11 (MapType0Store Mask@10 x@@14 g (real_2_U (- (U_2_real (MapType0Select Mask@10 x@@14 g)) takeTransfer@9)))) (= Heap@9 (MapType1Store Heap@8 null (|wand_3#sm| b1 x@@14 (/ (to_real 1) (to_real 10)) x@@14 (/ (to_real 1) (to_real 10))  (not b1) x@@14 (/ (to_real 1) (to_real 10)) x@@14 (/ (to_real 1) (to_real 10)) x@@14 (/ (to_real 1) (to_real 10)) x@@14 (/ (to_real 1) (to_real 10)) b2@@1 x@@14 (/ (to_real 2) (to_real 10)) x@@14 (/ (to_real 2) (to_real 10))) (MapType0Store (MapType1Select Heap@8 null (|wand_3#sm| b1 x@@14 (/ (to_real 1) (to_real 10)) x@@14 (/ (to_real 1) (to_real 10))  (not b1) x@@14 (/ (to_real 1) (to_real 10)) x@@14 (/ (to_real 1) (to_real 10)) x@@14 (/ (to_real 1) (to_real 10)) x@@14 (/ (to_real 1) (to_real 10)) b2@@1 x@@14 (/ (to_real 2) (to_real 10)) x@@14 (/ (to_real 2) (to_real 10)))) x@@14 g (bool_2_U true))))) (and (= Mask@12 Mask@11) (= Heap@10 Heap@9))) (and (and (= neededTransfer@25 neededTransfer@24) (= b_18@31 b_18@30)) (and (= Used_7Mask@20 Used_7Mask@19) (= (ControlFlow 0 47) 44)))) anon85_correct)))))
(let ((anon145_Else_correct  (=> (and (< maskTransfer@9 neededTransfer@23) (= takeTransfer@9 maskTransfer@9)) (and (=> (= (ControlFlow 0 50) 47) anon146_Then_correct) (=> (= (ControlFlow 0 50) 48) anon146_Else_correct)))))
(let ((anon145_Then_correct  (=> (and (<= neededTransfer@23 maskTransfer@9) (= takeTransfer@9 neededTransfer@23)) (and (=> (= (ControlFlow 0 49) 47) anon146_Then_correct) (=> (= (ControlFlow 0 49) 48) anon146_Else_correct)))))
(let ((anon144_Then_correct  (=> (and (and (and (and (and b_17@12 b_17@12) b_18@28) true) (> neededTransfer@23 0.0)) (= maskTransfer@9 (U_2_real (MapType0Select Mask@10 x@@14 g)))) (and (=> (= (ControlFlow 0 51) 49) anon145_Then_correct) (=> (= (ControlFlow 0 51) 50) anon145_Else_correct)))))
(let ((anon144_Else_correct  (=> (not (and (and (and (and b_17@12 b_17@12) b_18@28) true) (> neededTransfer@23 0.0))) (=> (and (= Mask@12 Mask@10) (= Heap@10 Heap@8)) (=> (and (and (= neededTransfer@25 neededTransfer@23) (= b_18@31 b_18@28)) (and (= Used_7Mask@20 Used_7Mask@18) (= (ControlFlow 0 46) 44))) anon85_correct)))))
(let ((anon143_Else_correct  (=> (and (and (>= 0.0 takeTransfer@8) (= Used_7Mask@18 Used_7Mask@16)) (and (= b_18@28 b_18@25) (= neededTransfer@23 neededTransfer@21))) (and (=> (= (ControlFlow 0 54) 51) anon144_Then_correct) (=> (= (ControlFlow 0 54) 46) anon144_Else_correct)))))
(let ((anon143_Then_correct  (=> (> takeTransfer@8 0.0) (=> (and (and (and (= neededTransfer@22 (- neededTransfer@21 takeTransfer@8)) (= Used_7Mask@17 (MapType0Store Used_7Mask@16 x@@14 g (real_2_U (+ (U_2_real (MapType0Select Used_7Mask@16 x@@14 g)) takeTransfer@8))))) (and (= b_18@26  (and b_18@25 (state Used_7Heap@0 Used_7Mask@17))) (= b_18@27  (and b_18@26 (= (U_2_int (MapType1Select Ops_7Heap@0 x@@14 g)) (U_2_int (MapType1Select Used_7Heap@0 x@@14 g))))))) (and (and (= Ops_7Mask@12 (MapType0Store Ops_7Mask@11 x@@14 g (real_2_U (- (U_2_real (MapType0Select Ops_7Mask@11 x@@14 g)) takeTransfer@8)))) (= Used_7Mask@18 Used_7Mask@17)) (and (= b_18@28 b_18@27) (= neededTransfer@23 neededTransfer@22)))) (and (=> (= (ControlFlow 0 53) 51) anon144_Then_correct) (=> (= (ControlFlow 0 53) 46) anon144_Else_correct))))))
(let ((anon142_Else_correct  (=> (and (< maskTransfer@8 neededTransfer@21) (= takeTransfer@8 maskTransfer@8)) (and (=> (= (ControlFlow 0 56) 53) anon143_Then_correct) (=> (= (ControlFlow 0 56) 54) anon143_Else_correct)))))
(let ((anon142_Then_correct  (=> (and (<= neededTransfer@21 maskTransfer@8) (= takeTransfer@8 neededTransfer@21)) (and (=> (= (ControlFlow 0 55) 53) anon143_Then_correct) (=> (= (ControlFlow 0 55) 54) anon143_Else_correct)))))
(let ((anon141_Then_correct  (=> (and (and (and (and (and b_17@12 b_17@12) b_18@25) true) (> neededTransfer@21 0.0)) (= maskTransfer@8 (U_2_real (MapType0Select Ops_7Mask@11 x@@14 g)))) (and (=> (= (ControlFlow 0 57) 55) anon142_Then_correct) (=> (= (ControlFlow 0 57) 56) anon142_Else_correct)))))
(let ((anon141_Else_correct  (=> (and (and (not (and (and (and (and b_17@12 b_17@12) b_18@25) true) (> neededTransfer@21 0.0))) (= Used_7Mask@18 Used_7Mask@16)) (and (= b_18@28 b_18@25) (= neededTransfer@23 neededTransfer@21))) (and (=> (= (ControlFlow 0 52) 51) anon144_Then_correct) (=> (= (ControlFlow 0 52) 46) anon144_Else_correct)))))
(let ((anon134_Else_correct  (=> (not b2@@1) (=> (and (= neededTransfer@21 (/ (to_real 2) (to_real 10))) (= initNeededTransfer@5 (+ (U_2_real (MapType0Select Used_7Mask@16 x@@14 g)) neededTransfer@21))) (and (=> (= (ControlFlow 0 58) (- 0 59)) (>= neededTransfer@21 0.0)) (=> (>= neededTransfer@21 0.0) (and (=> (= (ControlFlow 0 58) 57) anon141_Then_correct) (=> (= (ControlFlow 0 58) 52) anon141_Else_correct))))))))
(let ((anon133_Then_correct  (=> (and b_17@12 b_17@12) (and (=> (= (ControlFlow 0 76) 74) anon134_Then_correct) (=> (= (ControlFlow 0 76) 58) anon134_Else_correct)))))
(let ((anon133_Else_correct  (=> (and (and (not (and b_17@12 b_17@12)) (= Heap@13 Heap@8)) (and (= Mask@15 Mask@10) (= (ControlFlow 0 43) 42))) anon86_correct)))
(let ((anon32_correct  (and (=> (= (ControlFlow 0 109) (- 0 110)) (=> (and (and b_17@10 b_17@10) b_18@24) (and (= neededTransfer@19 0.0) (= (U_2_real (MapType0Select Used_7Mask@15 x@@14 f_7)) initNeededTransfer@3)))) (=> (=> (and (and b_17@10 b_17@10) b_18@24) (and (= neededTransfer@19 0.0) (= (U_2_real (MapType0Select Used_7Mask@15 x@@14 f_7)) initNeededTransfer@3))) (=> (and (and (= b_20@0  (and b_17@10 b_18@24)) (= b_20@1  (and b_20@0 (state Result_8Heap Result_8Mask)))) (and (= b_20@2  (and b_20@1 (sumMask Result_8Mask Ops_7Mask@10 Used_7Mask@15))) (= b_20@3  (and (and b_20@2 (IdenticalOnKnownLocations Ops_7Heap@0 Result_8Heap Ops_7Mask@10)) (IdenticalOnKnownLocations Used_7Heap@0 Result_8Heap Used_7Mask@15))))) (=> (and (and (and (= b_20@4  (and b_20@3 (state Result_8Heap Result_8Mask))) (= b_17@11  (and b_17@10 b_20@4))) (and (= Ops_7Mask@11 Ops_7Mask@10) (= b_17@12 b_17@11))) (and (and (= Heap@8 Heap@7) (= Used_7Mask@16 Used_7Mask@15)) (and (= Mask@10 Mask@9) (= b_18@25 b_18@24)))) (and (=> (= (ControlFlow 0 109) 76) anon133_Then_correct) (=> (= (ControlFlow 0 109) 43) anon133_Else_correct))))))))
(let ((anon120_Else_correct  (=> (>= 0.0 takeTransfer@7) (=> (and (= neededTransfer@19 neededTransfer@17) (= b_18@24 b_18@21)) (=> (and (and (= Mask@9 Mask@7) (= Used_7Mask@15 Used_7Mask@13)) (and (= Heap@7 Heap@5) (= (ControlFlow 0 113) 109))) anon32_correct)))))
(let ((anon120_Then_correct  (=> (> takeTransfer@7 0.0) (=> (and (and (= neededTransfer@18 (- neededTransfer@17 takeTransfer@7)) (= Used_7Mask@14 (MapType0Store Used_7Mask@13 x@@14 f_7 (real_2_U (+ (U_2_real (MapType0Select Used_7Mask@13 x@@14 f_7)) takeTransfer@7))))) (and (= b_18@22  (and b_18@21 (state Used_7Heap@0 Used_7Mask@14))) (= b_18@23  (and b_18@22 (= (U_2_bool (MapType1Select Heap@5 x@@14 f_7)) (U_2_bool (MapType1Select Used_7Heap@0 x@@14 f_7))))))) (=> (and (and (and (= Mask@8 (MapType0Store Mask@7 x@@14 f_7 (real_2_U (- (U_2_real (MapType0Select Mask@7 x@@14 f_7)) takeTransfer@7)))) (= Heap@6 (MapType1Store Heap@5 null (|wand_3#sm| b1 x@@14 (/ (to_real 1) (to_real 10)) x@@14 (/ (to_real 1) (to_real 10))  (not b1) x@@14 (/ (to_real 1) (to_real 10)) x@@14 (/ (to_real 1) (to_real 10)) x@@14 (/ (to_real 1) (to_real 10)) x@@14 (/ (to_real 1) (to_real 10)) b2@@1 x@@14 (/ (to_real 2) (to_real 10)) x@@14 (/ (to_real 2) (to_real 10))) (MapType0Store (MapType1Select Heap@5 null (|wand_3#sm| b1 x@@14 (/ (to_real 1) (to_real 10)) x@@14 (/ (to_real 1) (to_real 10))  (not b1) x@@14 (/ (to_real 1) (to_real 10)) x@@14 (/ (to_real 1) (to_real 10)) x@@14 (/ (to_real 1) (to_real 10)) x@@14 (/ (to_real 1) (to_real 10)) b2@@1 x@@14 (/ (to_real 2) (to_real 10)) x@@14 (/ (to_real 2) (to_real 10)))) x@@14 f_7 (bool_2_U true))))) (and (= neededTransfer@19 neededTransfer@18) (= b_18@24 b_18@23))) (and (and (= Mask@9 Mask@8) (= Used_7Mask@15 Used_7Mask@14)) (and (= Heap@7 Heap@6) (= (ControlFlow 0 112) 109)))) anon32_correct)))))
(let ((anon119_Else_correct  (=> (and (< maskTransfer@7 neededTransfer@17) (= takeTransfer@7 maskTransfer@7)) (and (=> (= (ControlFlow 0 115) 112) anon120_Then_correct) (=> (= (ControlFlow 0 115) 113) anon120_Else_correct)))))
(let ((anon119_Then_correct  (=> (and (<= neededTransfer@17 maskTransfer@7) (= takeTransfer@7 neededTransfer@17)) (and (=> (= (ControlFlow 0 114) 112) anon120_Then_correct) (=> (= (ControlFlow 0 114) 113) anon120_Else_correct)))))
(let ((anon118_Then_correct  (=> (and (and (and (and (and b_17@10 b_17@10) b_18@21) true) (> neededTransfer@17 0.0)) (= maskTransfer@7 (U_2_real (MapType0Select Mask@7 x@@14 f_7)))) (and (=> (= (ControlFlow 0 116) 114) anon119_Then_correct) (=> (= (ControlFlow 0 116) 115) anon119_Else_correct)))))
(let ((anon118_Else_correct  (=> (not (and (and (and (and b_17@10 b_17@10) b_18@21) true) (> neededTransfer@17 0.0))) (=> (and (= neededTransfer@19 neededTransfer@17) (= b_18@24 b_18@21)) (=> (and (and (= Mask@9 Mask@7) (= Used_7Mask@15 Used_7Mask@13)) (and (= Heap@7 Heap@5) (= (ControlFlow 0 111) 109))) anon32_correct)))))
(let ((anon117_Else_correct  (=> (>= 0.0 takeTransfer@6) (=> (and (and (= Used_7Mask@13 Used_7Mask@11) (= b_18@21 b_18@18)) (and (= neededTransfer@17 neededTransfer@15) (= Ops_7Mask@10 Ops_7Mask@8))) (and (=> (= (ControlFlow 0 119) 116) anon118_Then_correct) (=> (= (ControlFlow 0 119) 111) anon118_Else_correct))))))
(let ((anon117_Then_correct  (=> (and (> takeTransfer@6 0.0) (= neededTransfer@16 (- neededTransfer@15 takeTransfer@6))) (=> (and (and (and (= Used_7Mask@12 (MapType0Store Used_7Mask@11 x@@14 f_7 (real_2_U (+ (U_2_real (MapType0Select Used_7Mask@11 x@@14 f_7)) takeTransfer@6)))) (= b_18@19  (and b_18@18 (state Used_7Heap@0 Used_7Mask@12)))) (and (= b_18@20  (and b_18@19 (= (U_2_bool (MapType1Select Ops_7Heap@0 x@@14 f_7)) (U_2_bool (MapType1Select Used_7Heap@0 x@@14 f_7))))) (= Ops_7Mask@9 (MapType0Store Ops_7Mask@8 x@@14 f_7 (real_2_U (- (U_2_real (MapType0Select Ops_7Mask@8 x@@14 f_7)) takeTransfer@6)))))) (and (and (= Used_7Mask@13 Used_7Mask@12) (= b_18@21 b_18@20)) (and (= neededTransfer@17 neededTransfer@16) (= Ops_7Mask@10 Ops_7Mask@9)))) (and (=> (= (ControlFlow 0 118) 116) anon118_Then_correct) (=> (= (ControlFlow 0 118) 111) anon118_Else_correct))))))
(let ((anon116_Else_correct  (=> (and (< maskTransfer@6 neededTransfer@15) (= takeTransfer@6 maskTransfer@6)) (and (=> (= (ControlFlow 0 121) 118) anon117_Then_correct) (=> (= (ControlFlow 0 121) 119) anon117_Else_correct)))))
(let ((anon116_Then_correct  (=> (and (<= neededTransfer@15 maskTransfer@6) (= takeTransfer@6 neededTransfer@15)) (and (=> (= (ControlFlow 0 120) 118) anon117_Then_correct) (=> (= (ControlFlow 0 120) 119) anon117_Else_correct)))))
(let ((anon115_Then_correct  (=> (and (and (and (and (and b_17@10 b_17@10) b_18@18) true) (> neededTransfer@15 0.0)) (= maskTransfer@6 (U_2_real (MapType0Select Ops_7Mask@8 x@@14 f_7)))) (and (=> (= (ControlFlow 0 122) 120) anon116_Then_correct) (=> (= (ControlFlow 0 122) 121) anon116_Else_correct)))))
(let ((anon115_Else_correct  (=> (not (and (and (and (and b_17@10 b_17@10) b_18@18) true) (> neededTransfer@15 0.0))) (=> (and (and (= Used_7Mask@13 Used_7Mask@11) (= b_18@21 b_18@18)) (and (= neededTransfer@17 neededTransfer@15) (= Ops_7Mask@10 Ops_7Mask@8))) (and (=> (= (ControlFlow 0 117) 116) anon118_Then_correct) (=> (= (ControlFlow 0 117) 111) anon118_Else_correct))))))
(let ((anon20_correct  (and (=> (= (ControlFlow 0 123) (- 0 125)) (=> (and (and b_17@7 b_17@7) b_18@18) (and (= neededTransfer@14 0.0) (= (U_2_real (MapType0Select Used_7Mask@11 x@@14 f_7)) initNeededTransfer@0)))) (=> (=> (and (and b_17@7 b_17@7) b_18@18) (and (= neededTransfer@14 0.0) (= (U_2_real (MapType0Select Used_7Mask@11 x@@14 f_7)) initNeededTransfer@0))) (=> (and (and (and (= b_19@0  (and b_17@7 b_18@18)) (= b_19@1  (and b_19@0 (state Result_7Heap Result_7Mask)))) (and (= b_19@2  (and b_19@1 (sumMask Result_7Mask Ops_7Mask@8 Used_7Mask@11))) (= b_19@3  (and (and b_19@2 (IdenticalOnKnownLocations Ops_7Heap@0 Result_7Heap Ops_7Mask@8)) (IdenticalOnKnownLocations Used_7Heap@0 Result_7Heap Used_7Mask@11))))) (and (and (= b_19@4  (and b_19@3 (state Result_7Heap Result_7Mask))) (= b_17@10  (and b_17@7 b_19@4))) (and (= neededTransfer@15 (/ (to_real 1) (to_real 10))) (= initNeededTransfer@3 (+ (U_2_real (MapType0Select Used_7Mask@11 x@@14 f_7)) neededTransfer@15))))) (and (=> (= (ControlFlow 0 123) (- 0 124)) (>= neededTransfer@15 0.0)) (=> (>= neededTransfer@15 0.0) (and (=> (= (ControlFlow 0 123) 122) anon115_Then_correct) (=> (= (ControlFlow 0 123) 117) anon115_Else_correct)))))))))
(let ((anon114_Else_correct  (=> (>= 0.0 takeTransfer@5) (=> (and (= Mask@7 Mask@1) (= neededTransfer@14 neededTransfer@12)) (=> (and (and (= b_18@18 b_18@15) (= Used_7Mask@11 Used_7Mask@9)) (and (= Heap@5 Heap@@10) (= (ControlFlow 0 128) 123))) anon20_correct)))))
(let ((anon114_Then_correct  (=> (> takeTransfer@5 0.0) (=> (and (and (= neededTransfer@13 (- neededTransfer@12 takeTransfer@5)) (= Used_7Mask@10 (MapType0Store Used_7Mask@9 x@@14 f_7 (real_2_U (+ (U_2_real (MapType0Select Used_7Mask@9 x@@14 f_7)) takeTransfer@5))))) (and (= b_18@16  (and b_18@15 (state Used_7Heap@0 Used_7Mask@10))) (= b_18@17  (and b_18@16 (= (U_2_bool (MapType1Select Heap@@10 x@@14 f_7)) (U_2_bool (MapType1Select Used_7Heap@0 x@@14 f_7))))))) (=> (and (and (and (= Mask@6 (MapType0Store Mask@1 x@@14 f_7 (real_2_U (- (U_2_real (MapType0Select Mask@1 x@@14 f_7)) takeTransfer@5)))) (= Heap@4 (MapType1Store Heap@@10 null (|wand_3#sm| b1 x@@14 (/ (to_real 1) (to_real 10)) x@@14 (/ (to_real 1) (to_real 10))  (not b1) x@@14 (/ (to_real 1) (to_real 10)) x@@14 (/ (to_real 1) (to_real 10)) x@@14 (/ (to_real 1) (to_real 10)) x@@14 (/ (to_real 1) (to_real 10)) b2@@1 x@@14 (/ (to_real 2) (to_real 10)) x@@14 (/ (to_real 2) (to_real 10))) (MapType0Store (MapType1Select Heap@@10 null (|wand_3#sm| b1 x@@14 (/ (to_real 1) (to_real 10)) x@@14 (/ (to_real 1) (to_real 10))  (not b1) x@@14 (/ (to_real 1) (to_real 10)) x@@14 (/ (to_real 1) (to_real 10)) x@@14 (/ (to_real 1) (to_real 10)) x@@14 (/ (to_real 1) (to_real 10)) b2@@1 x@@14 (/ (to_real 2) (to_real 10)) x@@14 (/ (to_real 2) (to_real 10)))) x@@14 f_7 (bool_2_U true))))) (and (= Mask@7 Mask@6) (= neededTransfer@14 neededTransfer@13))) (and (and (= b_18@18 b_18@17) (= Used_7Mask@11 Used_7Mask@10)) (and (= Heap@5 Heap@4) (= (ControlFlow 0 127) 123)))) anon20_correct)))))
(let ((anon113_Else_correct  (=> (and (< maskTransfer@5 neededTransfer@12) (= takeTransfer@5 maskTransfer@5)) (and (=> (= (ControlFlow 0 130) 127) anon114_Then_correct) (=> (= (ControlFlow 0 130) 128) anon114_Else_correct)))))
(let ((anon113_Then_correct  (=> (and (<= neededTransfer@12 maskTransfer@5) (= takeTransfer@5 neededTransfer@12)) (and (=> (= (ControlFlow 0 129) 127) anon114_Then_correct) (=> (= (ControlFlow 0 129) 128) anon114_Else_correct)))))
(let ((anon112_Then_correct  (=> (and (and (and (and (and b_17@7 b_17@7) b_18@15) true) (> neededTransfer@12 0.0)) (= maskTransfer@5 (U_2_real (MapType0Select Mask@1 x@@14 f_7)))) (and (=> (= (ControlFlow 0 131) 129) anon113_Then_correct) (=> (= (ControlFlow 0 131) 130) anon113_Else_correct)))))
(let ((anon112_Else_correct  (=> (not (and (and (and (and b_17@7 b_17@7) b_18@15) true) (> neededTransfer@12 0.0))) (=> (and (= Mask@7 Mask@1) (= neededTransfer@14 neededTransfer@12)) (=> (and (and (= b_18@18 b_18@15) (= Used_7Mask@11 Used_7Mask@9)) (and (= Heap@5 Heap@@10) (= (ControlFlow 0 126) 123))) anon20_correct)))))
(let ((anon111_Else_correct  (=> (>= 0.0 takeTransfer@4) (=> (and (and (= Ops_7Mask@8 Ops_7Mask@2) (= Used_7Mask@9 ZeroMask)) (and (= b_18@15 b_18@0) (= neededTransfer@12 neededTransfer@0))) (and (=> (= (ControlFlow 0 134) 131) anon112_Then_correct) (=> (= (ControlFlow 0 134) 126) anon112_Else_correct))))))
(let ((anon111_Then_correct  (=> (and (> takeTransfer@4 0.0) (= neededTransfer@11 (- neededTransfer@0 takeTransfer@4))) (=> (and (and (and (= Used_7Mask@8 (MapType0Store ZeroMask x@@14 f_7 (real_2_U (+ (U_2_real (MapType0Select ZeroMask x@@14 f_7)) takeTransfer@4)))) (= b_18@13  (and b_18@0 (state Used_7Heap@0 Used_7Mask@8)))) (and (= b_18@14  (and b_18@13 (= (U_2_bool (MapType1Select Ops_7Heap@0 x@@14 f_7)) (U_2_bool (MapType1Select Used_7Heap@0 x@@14 f_7))))) (= Ops_7Mask@7 (MapType0Store Ops_7Mask@2 x@@14 f_7 (real_2_U (- (U_2_real (MapType0Select Ops_7Mask@2 x@@14 f_7)) takeTransfer@4)))))) (and (and (= Ops_7Mask@8 Ops_7Mask@7) (= Used_7Mask@9 Used_7Mask@8)) (and (= b_18@15 b_18@14) (= neededTransfer@12 neededTransfer@11)))) (and (=> (= (ControlFlow 0 133) 131) anon112_Then_correct) (=> (= (ControlFlow 0 133) 126) anon112_Else_correct))))))
(let ((anon110_Else_correct  (=> (and (< maskTransfer@4 neededTransfer@0) (= takeTransfer@4 maskTransfer@4)) (and (=> (= (ControlFlow 0 136) 133) anon111_Then_correct) (=> (= (ControlFlow 0 136) 134) anon111_Else_correct)))))
(let ((anon110_Then_correct  (=> (and (<= neededTransfer@0 maskTransfer@4) (= takeTransfer@4 neededTransfer@0)) (and (=> (= (ControlFlow 0 135) 133) anon111_Then_correct) (=> (= (ControlFlow 0 135) 134) anon111_Else_correct)))))
(let ((anon109_Then_correct  (=> (and (and (and (and (and b_17@7 b_17@7) b_18@0) true) (> neededTransfer@0 0.0)) (= maskTransfer@4 (U_2_real (MapType0Select Ops_7Mask@2 x@@14 f_7)))) (and (=> (= (ControlFlow 0 137) 135) anon110_Then_correct) (=> (= (ControlFlow 0 137) 136) anon110_Else_correct)))))
(let ((anon109_Else_correct  (=> (not (and (and (and (and b_17@7 b_17@7) b_18@0) true) (> neededTransfer@0 0.0))) (=> (and (and (= Ops_7Mask@8 Ops_7Mask@2) (= Used_7Mask@9 ZeroMask)) (and (= b_18@15 b_18@0) (= neededTransfer@12 neededTransfer@0))) (and (=> (= (ControlFlow 0 132) 131) anon112_Then_correct) (=> (= (ControlFlow 0 132) 126) anon112_Else_correct))))))
(let ((anon108_Then_correct  (=> (not b1) (=> (and (= neededTransfer@0 (/ (to_real 1) (to_real 10))) (= initNeededTransfer@0 (+ (U_2_real (MapType0Select ZeroMask x@@14 f_7)) neededTransfer@0))) (and (=> (= (ControlFlow 0 138) (- 0 139)) (>= neededTransfer@0 0.0)) (=> (>= neededTransfer@0 0.0) (and (=> (= (ControlFlow 0 138) 137) anon109_Then_correct) (=> (= (ControlFlow 0 138) 132) anon109_Else_correct))))))))
(let ((anon57_correct  (and (=> (= (ControlFlow 0 78) (- 0 79)) (=> (and (and b_17@8 b_17@8) b_18@12) (and (= neededTransfer@10 0.0) (= (U_2_real (MapType0Select Used_7Mask@7 x@@14 g)) initNeededTransfer@2)))) (=> (=> (and (and b_17@8 b_17@8) b_18@12) (and (= neededTransfer@10 0.0) (= (U_2_real (MapType0Select Used_7Mask@7 x@@14 g)) initNeededTransfer@2))) (=> (and (and (= b_22@0  (and b_17@8 b_18@12)) (= b_22@1  (and b_22@0 (state Result_10Heap Result_10Mask)))) (and (= b_22@2  (and b_22@1 (sumMask Result_10Mask Ops_7Mask@6 Used_7Mask@7))) (= b_22@3  (and (and b_22@2 (IdenticalOnKnownLocations Ops_7Heap@0 Result_10Heap Ops_7Mask@6)) (IdenticalOnKnownLocations Used_7Heap@0 Result_10Heap Used_7Mask@7))))) (=> (and (and (and (= b_22@4  (and b_22@3 (state Result_10Heap Result_10Mask))) (= b_17@9  (and b_17@8 b_22@4))) (and (= Ops_7Mask@11 Ops_7Mask@6) (= b_17@12 b_17@9))) (and (and (= Heap@8 Heap@3) (= Used_7Mask@16 Used_7Mask@7)) (and (= Mask@10 Mask@5) (= b_18@25 b_18@12)))) (and (=> (= (ControlFlow 0 78) 76) anon133_Then_correct) (=> (= (ControlFlow 0 78) 43) anon133_Else_correct))))))))
(let ((anon132_Else_correct  (=> (>= 0.0 takeTransfer@3) (=> (and (= neededTransfer@10 neededTransfer@8) (= b_18@12 b_18@9)) (=> (and (and (= Mask@5 Mask@3) (= Used_7Mask@7 Used_7Mask@5)) (and (= Heap@3 Heap@1) (= (ControlFlow 0 82) 78))) anon57_correct)))))
(let ((anon132_Then_correct  (=> (> takeTransfer@3 0.0) (=> (and (and (= neededTransfer@9 (- neededTransfer@8 takeTransfer@3)) (= Used_7Mask@6 (MapType0Store Used_7Mask@5 x@@14 g (real_2_U (+ (U_2_real (MapType0Select Used_7Mask@5 x@@14 g)) takeTransfer@3))))) (and (= b_18@10  (and b_18@9 (state Used_7Heap@0 Used_7Mask@6))) (= b_18@11  (and b_18@10 (= (U_2_int (MapType1Select Heap@1 x@@14 g)) (U_2_int (MapType1Select Used_7Heap@0 x@@14 g))))))) (=> (and (and (and (= Mask@4 (MapType0Store Mask@3 x@@14 g (real_2_U (- (U_2_real (MapType0Select Mask@3 x@@14 g)) takeTransfer@3)))) (= Heap@2 (MapType1Store Heap@1 null (|wand_3#sm| b1 x@@14 (/ (to_real 1) (to_real 10)) x@@14 (/ (to_real 1) (to_real 10))  (not b1) x@@14 (/ (to_real 1) (to_real 10)) x@@14 (/ (to_real 1) (to_real 10)) x@@14 (/ (to_real 1) (to_real 10)) x@@14 (/ (to_real 1) (to_real 10)) b2@@1 x@@14 (/ (to_real 2) (to_real 10)) x@@14 (/ (to_real 2) (to_real 10))) (MapType0Store (MapType1Select Heap@1 null (|wand_3#sm| b1 x@@14 (/ (to_real 1) (to_real 10)) x@@14 (/ (to_real 1) (to_real 10))  (not b1) x@@14 (/ (to_real 1) (to_real 10)) x@@14 (/ (to_real 1) (to_real 10)) x@@14 (/ (to_real 1) (to_real 10)) x@@14 (/ (to_real 1) (to_real 10)) b2@@1 x@@14 (/ (to_real 2) (to_real 10)) x@@14 (/ (to_real 2) (to_real 10)))) x@@14 g (bool_2_U true))))) (and (= neededTransfer@10 neededTransfer@9) (= b_18@12 b_18@11))) (and (and (= Mask@5 Mask@4) (= Used_7Mask@7 Used_7Mask@6)) (and (= Heap@3 Heap@2) (= (ControlFlow 0 81) 78)))) anon57_correct)))))
(let ((anon131_Else_correct  (=> (and (< maskTransfer@3 neededTransfer@8) (= takeTransfer@3 maskTransfer@3)) (and (=> (= (ControlFlow 0 84) 81) anon132_Then_correct) (=> (= (ControlFlow 0 84) 82) anon132_Else_correct)))))
(let ((anon131_Then_correct  (=> (and (<= neededTransfer@8 maskTransfer@3) (= takeTransfer@3 neededTransfer@8)) (and (=> (= (ControlFlow 0 83) 81) anon132_Then_correct) (=> (= (ControlFlow 0 83) 82) anon132_Else_correct)))))
(let ((anon130_Then_correct  (=> (and (and (and (and (and b_17@8 b_17@8) b_18@9) true) (> neededTransfer@8 0.0)) (= maskTransfer@3 (U_2_real (MapType0Select Mask@3 x@@14 g)))) (and (=> (= (ControlFlow 0 85) 83) anon131_Then_correct) (=> (= (ControlFlow 0 85) 84) anon131_Else_correct)))))
(let ((anon130_Else_correct  (=> (not (and (and (and (and b_17@8 b_17@8) b_18@9) true) (> neededTransfer@8 0.0))) (=> (and (= neededTransfer@10 neededTransfer@8) (= b_18@12 b_18@9)) (=> (and (and (= Mask@5 Mask@3) (= Used_7Mask@7 Used_7Mask@5)) (and (= Heap@3 Heap@1) (= (ControlFlow 0 80) 78))) anon57_correct)))))
(let ((anon129_Else_correct  (=> (>= 0.0 takeTransfer@2) (=> (and (and (= Used_7Mask@5 Used_7Mask@3) (= b_18@9 b_18@6)) (and (= neededTransfer@8 neededTransfer@6) (= Ops_7Mask@6 Ops_7Mask@4))) (and (=> (= (ControlFlow 0 88) 85) anon130_Then_correct) (=> (= (ControlFlow 0 88) 80) anon130_Else_correct))))))
(let ((anon129_Then_correct  (=> (and (> takeTransfer@2 0.0) (= neededTransfer@7 (- neededTransfer@6 takeTransfer@2))) (=> (and (and (and (= Used_7Mask@4 (MapType0Store Used_7Mask@3 x@@14 g (real_2_U (+ (U_2_real (MapType0Select Used_7Mask@3 x@@14 g)) takeTransfer@2)))) (= b_18@7  (and b_18@6 (state Used_7Heap@0 Used_7Mask@4)))) (and (= b_18@8  (and b_18@7 (= (U_2_int (MapType1Select Ops_7Heap@0 x@@14 g)) (U_2_int (MapType1Select Used_7Heap@0 x@@14 g))))) (= Ops_7Mask@5 (MapType0Store Ops_7Mask@4 x@@14 g (real_2_U (- (U_2_real (MapType0Select Ops_7Mask@4 x@@14 g)) takeTransfer@2)))))) (and (and (= Used_7Mask@5 Used_7Mask@4) (= b_18@9 b_18@8)) (and (= neededTransfer@8 neededTransfer@7) (= Ops_7Mask@6 Ops_7Mask@5)))) (and (=> (= (ControlFlow 0 87) 85) anon130_Then_correct) (=> (= (ControlFlow 0 87) 80) anon130_Else_correct))))))
(let ((anon128_Else_correct  (=> (and (< maskTransfer@2 neededTransfer@6) (= takeTransfer@2 maskTransfer@2)) (and (=> (= (ControlFlow 0 90) 87) anon129_Then_correct) (=> (= (ControlFlow 0 90) 88) anon129_Else_correct)))))
(let ((anon128_Then_correct  (=> (and (<= neededTransfer@6 maskTransfer@2) (= takeTransfer@2 neededTransfer@6)) (and (=> (= (ControlFlow 0 89) 87) anon129_Then_correct) (=> (= (ControlFlow 0 89) 88) anon129_Else_correct)))))
(let ((anon127_Then_correct  (=> (and (and (and (and (and b_17@8 b_17@8) b_18@6) true) (> neededTransfer@6 0.0)) (= maskTransfer@2 (U_2_real (MapType0Select Ops_7Mask@4 x@@14 g)))) (and (=> (= (ControlFlow 0 91) 89) anon128_Then_correct) (=> (= (ControlFlow 0 91) 90) anon128_Else_correct)))))
(let ((anon127_Else_correct  (=> (not (and (and (and (and b_17@8 b_17@8) b_18@6) true) (> neededTransfer@6 0.0))) (=> (and (and (= Used_7Mask@5 Used_7Mask@3) (= b_18@9 b_18@6)) (and (= neededTransfer@8 neededTransfer@6) (= Ops_7Mask@6 Ops_7Mask@4))) (and (=> (= (ControlFlow 0 86) 85) anon130_Then_correct) (=> (= (ControlFlow 0 86) 80) anon130_Else_correct))))))
(let ((anon45_correct  (and (=> (= (ControlFlow 0 92) (- 0 94)) (=> (and (and b_17@7 b_17@7) b_18@6) (and (= neededTransfer@5 0.0) (= (U_2_real (MapType0Select Used_7Mask@3 x@@14 g)) initNeededTransfer@1)))) (=> (=> (and (and b_17@7 b_17@7) b_18@6) (and (= neededTransfer@5 0.0) (= (U_2_real (MapType0Select Used_7Mask@3 x@@14 g)) initNeededTransfer@1))) (=> (and (and (and (= b_21@0  (and b_17@7 b_18@6)) (= b_21@1  (and b_21@0 (state Result_9Heap Result_9Mask)))) (and (= b_21@2  (and b_21@1 (sumMask Result_9Mask Ops_7Mask@4 Used_7Mask@3))) (= b_21@3  (and (and b_21@2 (IdenticalOnKnownLocations Ops_7Heap@0 Result_9Heap Ops_7Mask@4)) (IdenticalOnKnownLocations Used_7Heap@0 Result_9Heap Used_7Mask@3))))) (and (and (= b_21@4  (and b_21@3 (state Result_9Heap Result_9Mask))) (= b_17@8  (and b_17@7 b_21@4))) (and (= neededTransfer@6 (/ (to_real 1) (to_real 10))) (= initNeededTransfer@2 (+ (U_2_real (MapType0Select Used_7Mask@3 x@@14 g)) neededTransfer@6))))) (and (=> (= (ControlFlow 0 92) (- 0 93)) (>= neededTransfer@6 0.0)) (=> (>= neededTransfer@6 0.0) (and (=> (= (ControlFlow 0 92) 91) anon127_Then_correct) (=> (= (ControlFlow 0 92) 86) anon127_Else_correct)))))))))
(let ((anon126_Else_correct  (=> (>= 0.0 takeTransfer@1) (=> (and (= Mask@3 Mask@1) (= neededTransfer@5 neededTransfer@3)) (=> (and (and (= b_18@6 b_18@3) (= Used_7Mask@3 Used_7Mask@1)) (and (= Heap@1 Heap@@10) (= (ControlFlow 0 97) 92))) anon45_correct)))))
(let ((anon126_Then_correct  (=> (> takeTransfer@1 0.0) (=> (and (and (= neededTransfer@4 (- neededTransfer@3 takeTransfer@1)) (= Used_7Mask@2 (MapType0Store Used_7Mask@1 x@@14 g (real_2_U (+ (U_2_real (MapType0Select Used_7Mask@1 x@@14 g)) takeTransfer@1))))) (and (= b_18@4  (and b_18@3 (state Used_7Heap@0 Used_7Mask@2))) (= b_18@5  (and b_18@4 (= (U_2_int (MapType1Select Heap@@10 x@@14 g)) (U_2_int (MapType1Select Used_7Heap@0 x@@14 g))))))) (=> (and (and (and (= Mask@2 (MapType0Store Mask@1 x@@14 g (real_2_U (- (U_2_real (MapType0Select Mask@1 x@@14 g)) takeTransfer@1)))) (= Heap@0 (MapType1Store Heap@@10 null (|wand_3#sm| b1 x@@14 (/ (to_real 1) (to_real 10)) x@@14 (/ (to_real 1) (to_real 10))  (not b1) x@@14 (/ (to_real 1) (to_real 10)) x@@14 (/ (to_real 1) (to_real 10)) x@@14 (/ (to_real 1) (to_real 10)) x@@14 (/ (to_real 1) (to_real 10)) b2@@1 x@@14 (/ (to_real 2) (to_real 10)) x@@14 (/ (to_real 2) (to_real 10))) (MapType0Store (MapType1Select Heap@@10 null (|wand_3#sm| b1 x@@14 (/ (to_real 1) (to_real 10)) x@@14 (/ (to_real 1) (to_real 10))  (not b1) x@@14 (/ (to_real 1) (to_real 10)) x@@14 (/ (to_real 1) (to_real 10)) x@@14 (/ (to_real 1) (to_real 10)) x@@14 (/ (to_real 1) (to_real 10)) b2@@1 x@@14 (/ (to_real 2) (to_real 10)) x@@14 (/ (to_real 2) (to_real 10)))) x@@14 g (bool_2_U true))))) (and (= Mask@3 Mask@2) (= neededTransfer@5 neededTransfer@4))) (and (and (= b_18@6 b_18@5) (= Used_7Mask@3 Used_7Mask@2)) (and (= Heap@1 Heap@0) (= (ControlFlow 0 96) 92)))) anon45_correct)))))
(let ((anon125_Else_correct  (=> (and (< maskTransfer@1 neededTransfer@3) (= takeTransfer@1 maskTransfer@1)) (and (=> (= (ControlFlow 0 99) 96) anon126_Then_correct) (=> (= (ControlFlow 0 99) 97) anon126_Else_correct)))))
(let ((anon125_Then_correct  (=> (and (<= neededTransfer@3 maskTransfer@1) (= takeTransfer@1 neededTransfer@3)) (and (=> (= (ControlFlow 0 98) 96) anon126_Then_correct) (=> (= (ControlFlow 0 98) 97) anon126_Else_correct)))))
(let ((anon124_Then_correct  (=> (and (and (and (and (and b_17@7 b_17@7) b_18@3) true) (> neededTransfer@3 0.0)) (= maskTransfer@1 (U_2_real (MapType0Select Mask@1 x@@14 g)))) (and (=> (= (ControlFlow 0 100) 98) anon125_Then_correct) (=> (= (ControlFlow 0 100) 99) anon125_Else_correct)))))
(let ((anon124_Else_correct  (=> (not (and (and (and (and b_17@7 b_17@7) b_18@3) true) (> neededTransfer@3 0.0))) (=> (and (= Mask@3 Mask@1) (= neededTransfer@5 neededTransfer@3)) (=> (and (and (= b_18@6 b_18@3) (= Used_7Mask@3 Used_7Mask@1)) (and (= Heap@1 Heap@@10) (= (ControlFlow 0 95) 92))) anon45_correct)))))
(let ((anon123_Else_correct  (=> (>= 0.0 takeTransfer@0) (=> (and (and (= Ops_7Mask@4 Ops_7Mask@2) (= Used_7Mask@1 ZeroMask)) (and (= b_18@3 b_18@0) (= neededTransfer@3 neededTransfer@1))) (and (=> (= (ControlFlow 0 103) 100) anon124_Then_correct) (=> (= (ControlFlow 0 103) 95) anon124_Else_correct))))))
(let ((anon123_Then_correct  (=> (and (> takeTransfer@0 0.0) (= neededTransfer@2 (- neededTransfer@1 takeTransfer@0))) (=> (and (and (and (= Used_7Mask@0 (MapType0Store ZeroMask x@@14 g (real_2_U (+ (U_2_real (MapType0Select ZeroMask x@@14 g)) takeTransfer@0)))) (= b_18@1  (and b_18@0 (state Used_7Heap@0 Used_7Mask@0)))) (and (= b_18@2  (and b_18@1 (= (U_2_int (MapType1Select Ops_7Heap@0 x@@14 g)) (U_2_int (MapType1Select Used_7Heap@0 x@@14 g))))) (= Ops_7Mask@3 (MapType0Store Ops_7Mask@2 x@@14 g (real_2_U (- (U_2_real (MapType0Select Ops_7Mask@2 x@@14 g)) takeTransfer@0)))))) (and (and (= Ops_7Mask@4 Ops_7Mask@3) (= Used_7Mask@1 Used_7Mask@0)) (and (= b_18@3 b_18@2) (= neededTransfer@3 neededTransfer@2)))) (and (=> (= (ControlFlow 0 102) 100) anon124_Then_correct) (=> (= (ControlFlow 0 102) 95) anon124_Else_correct))))))
(let ((anon122_Else_correct  (=> (and (< maskTransfer@0 neededTransfer@1) (= takeTransfer@0 maskTransfer@0)) (and (=> (= (ControlFlow 0 105) 102) anon123_Then_correct) (=> (= (ControlFlow 0 105) 103) anon123_Else_correct)))))
(let ((anon122_Then_correct  (=> (and (<= neededTransfer@1 maskTransfer@0) (= takeTransfer@0 neededTransfer@1)) (and (=> (= (ControlFlow 0 104) 102) anon123_Then_correct) (=> (= (ControlFlow 0 104) 103) anon123_Else_correct)))))
(let ((anon121_Then_correct  (=> (and (and (and (and (and b_17@7 b_17@7) b_18@0) true) (> neededTransfer@1 0.0)) (= maskTransfer@0 (U_2_real (MapType0Select Ops_7Mask@2 x@@14 g)))) (and (=> (= (ControlFlow 0 106) 104) anon122_Then_correct) (=> (= (ControlFlow 0 106) 105) anon122_Else_correct)))))
(let ((anon121_Else_correct  (=> (not (and (and (and (and b_17@7 b_17@7) b_18@0) true) (> neededTransfer@1 0.0))) (=> (and (and (= Ops_7Mask@4 Ops_7Mask@2) (= Used_7Mask@1 ZeroMask)) (and (= b_18@3 b_18@0) (= neededTransfer@3 neededTransfer@1))) (and (=> (= (ControlFlow 0 101) 100) anon124_Then_correct) (=> (= (ControlFlow 0 101) 95) anon124_Else_correct))))))
(let ((anon108_Else_correct  (=> b1 (=> (and (= neededTransfer@1 (/ (to_real 1) (to_real 10))) (= initNeededTransfer@1 (+ (U_2_real (MapType0Select ZeroMask x@@14 g)) neededTransfer@1))) (and (=> (= (ControlFlow 0 107) (- 0 108)) (>= neededTransfer@1 0.0)) (=> (>= neededTransfer@1 0.0) (and (=> (= (ControlFlow 0 107) 106) anon121_Then_correct) (=> (= (ControlFlow 0 107) 101) anon121_Else_correct))))))))
(let ((anon107_Then_correct  (=> (and b_17@7 b_17@7) (and (=> (= (ControlFlow 0 140) 138) anon108_Then_correct) (=> (= (ControlFlow 0 140) 107) anon108_Else_correct)))))
(let ((anon107_Else_correct  (=> (not (and b_17@7 b_17@7)) (=> (and (= Ops_7Mask@11 Ops_7Mask@2) (= b_17@12 b_17@7)) (=> (and (and (= Heap@8 Heap@@10) (= Used_7Mask@16 ZeroMask)) (and (= Mask@10 Mask@1) (= b_18@25 b_18@0))) (and (=> (= (ControlFlow 0 77) 76) anon133_Then_correct) (=> (= (ControlFlow 0 77) 43) anon133_Else_correct)))))))
(let ((anon6_correct  (=> (= b_17@6  (and b_17@5 (state Ops_7Heap@0 Ops_7Mask@2))) (=> (and (= b_17@7  (and b_17@6 (state Ops_7Heap@0 Ops_7Mask@2))) (= b_18@0  (and b_18 (state Used_7Heap@0 ZeroMask)))) (and (=> (= (ControlFlow 0 141) 140) anon107_Then_correct) (=> (= (ControlFlow 0 141) 77) anon107_Else_correct))))))
(let ((anon105_Else_correct  (=> (and (and (not b_17@0) (= Ops_7Mask@2 ZeroMask)) (and (= b_17@5 b_17@0) (= (ControlFlow 0 149) 141))) anon6_correct)))
(let ((anon105_Then_correct  (=> (and b_17@0 (= perm@1 (/ (to_real 1) (to_real 10)))) (and (=> (= (ControlFlow 0 147) (- 0 148)) (>= perm@1 NoPerm)) (=> (>= perm@1 NoPerm) (=> (and (= b_17@3  (and b_17@0 (=> (> perm@1 NoPerm) (not (= x@@14 null))))) (= Ops_7Mask@1 (MapType0Store ZeroMask x@@14 f_7 (real_2_U (+ (U_2_real (MapType0Select ZeroMask x@@14 f_7)) perm@1))))) (=> (and (and (= b_17@4  (and b_17@3 (state Ops_7Heap@0 Ops_7Mask@1))) (= Ops_7Mask@2 Ops_7Mask@1)) (and (= b_17@5 b_17@4) (= (ControlFlow 0 147) 141))) anon6_correct)))))))
(let ((anon104_Then_correct  (=> (=> b_17@0 b1) (and (=> (= (ControlFlow 0 150) 147) anon105_Then_correct) (=> (= (ControlFlow 0 150) 149) anon105_Else_correct)))))
(let ((anon106_Else_correct  (=> (and (and (not b_17@0) (= Ops_7Mask@2 ZeroMask)) (and (= b_17@5 b_17@0) (= (ControlFlow 0 145) 141))) anon6_correct)))
(let ((anon106_Then_correct  (=> (and b_17@0 (= perm@0 (/ (to_real 1) (to_real 10)))) (and (=> (= (ControlFlow 0 143) (- 0 144)) (>= perm@0 NoPerm)) (=> (>= perm@0 NoPerm) (=> (and (= b_17@1  (and b_17@0 (=> (> perm@0 NoPerm) (not (= x@@14 null))))) (= Ops_7Mask@0 (MapType0Store ZeroMask x@@14 g (real_2_U (+ (U_2_real (MapType0Select ZeroMask x@@14 g)) perm@0))))) (=> (and (and (= b_17@2  (and b_17@1 (state Ops_7Heap@0 Ops_7Mask@0))) (= Ops_7Mask@2 Ops_7Mask@0)) (and (= b_17@5 b_17@2) (= (ControlFlow 0 143) 141))) anon6_correct)))))))
(let ((anon104_Else_correct  (=> (not (=> b_17@0 b1)) (and (=> (= (ControlFlow 0 146) 143) anon106_Then_correct) (=> (= (ControlFlow 0 146) 145) anon106_Else_correct)))))
(let ((anon103_Then_correct  (=> b_17@0 (and (=> (= (ControlFlow 0 151) 150) anon104_Then_correct) (=> (= (ControlFlow 0 151) 146) anon104_Else_correct)))))
(let ((anon103_Else_correct  (=> (and (and (not b_17@0) (= Ops_7Mask@2 ZeroMask)) (and (= b_17@5 b_17@0) (= (ControlFlow 0 142) 141))) anon6_correct)))
(let ((anon0_correct  (=> (and (and (state Heap@@10 ZeroMask) (U_2_bool (MapType1Select Heap@@10 x@@14 $allocated))) (and (not (= x@@14 null)) (= Mask@0 (MapType0Store ZeroMask x@@14 f_7 (real_2_U (+ (U_2_real (MapType0Select ZeroMask x@@14 f_7)) FullPerm)))))) (=> (and (and (and (state Heap@@10 Mask@0) (not (= x@@14 null))) (and (= Mask@1 (MapType0Store Mask@0 x@@14 g (real_2_U (+ (U_2_real (MapType0Select Mask@0 x@@14 g)) FullPerm)))) (state Heap@@10 Mask@1))) (and (and (state Heap@@10 Mask@1) (state Heap@@10 Mask@1)) (and (= b_17@0  (and b_17 (state Ops_7Heap@0 ZeroMask))) (= b_16@0  (and b_16 (state Used_6Heap@0 ZeroMask)))))) (and (=> (= (ControlFlow 0 152) 151) anon103_Then_correct) (=> (= (ControlFlow 0 152) 142) anon103_Else_correct))))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 153) 152) anon0_correct)))
PreconditionGeneratedEntry_correct)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
))
(check-sat)
(get-info :reason-unknown)
(assert (not (= (ControlFlow 0 18) (- 20))))
(check-sat)
(get-info :reason-unknown)
(assert (not (= (ControlFlow 0 13) (- 14))))
(check-sat)
(get-info :reason-unknown)
(assert (not (= (ControlFlow 0 3) (- 5))))
(check-sat)
(get-info :reason-unknown)
(assert (not (= (ControlFlow 0 8) (- 10))))
(check-sat)
(get-info :reason-unknown)
(assert (not (= (ControlFlow 0 2) (- 1))))
(check-sat)
(get-info :reason-unknown)
(assert (not (= (ControlFlow 0 3) (- 4))))
(check-sat)
(pop 1)
; Invalid
(get-info :rlimit)
