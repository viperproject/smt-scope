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
(declare-fun WandMaskField (T@U) T@U)
(declare-fun |wand_3#ft| (T@U Real T@U Int T@U Real T@U Int) T@U)
(declare-fun RefType () T@T)
(declare-fun |wand_3#sm| (T@U Real T@U Int T@U Real T@U Int) T@U)
(declare-fun MapType0Type (T@T T@T) T@T)
(declare-fun MapType0TypeInv0 (T@T) T@T)
(declare-fun MapType0TypeInv1 (T@T) T@T)
(declare-fun MapType0Select (T@U T@U T@U) T@U)
(declare-fun MapType0Store (T@U T@U T@U T@U) T@U)
(declare-fun WandType_wand_3Type () T@T)
(declare-fun FrameTypeType () T@T)
(declare-fun |wand_5#ft| (T@U Real T@U Int T@U Real T@U Int) T@U)
(declare-fun |wand_5#sm| (T@U Real T@U Int T@U Real T@U Int) T@U)
(declare-fun WandType_wand_5Type () T@T)
(declare-fun succHeap (T@U T@U) Bool)
(declare-fun MapType1Type (T@T) T@T)
(declare-fun succHeapTrans (T@U T@U) Bool)
(declare-fun MapType1TypeInv0 (T@T) T@T)
(declare-fun MapType1Select (T@U T@U T@U) T@U)
(declare-fun MapType1Store (T@U T@U T@U T@U) T@U)
(declare-fun wand (T@U Real T@U Real) T@U)
(declare-fun getPredWandId (T@U) Int)
(declare-fun WandType_wandType () T@T)
(declare-fun wand_10 (T@U Real T@U Real Bool) T@U)
(declare-fun WandType_wand_10Type () T@T)
(declare-fun wand_4 (T@U Real T@U Int Bool) T@U)
(declare-fun WandType_wand_4Type () T@T)
(declare-fun state (T@U T@U) Bool)
(declare-fun GoodMask (T@U) Bool)
(declare-fun wand_8 (T@U Real Bool) T@U)
(declare-fun IsWandField (T@U) Bool)
(declare-fun WandType_wand_8Type () T@T)
(declare-fun |wand_8#ft| (T@U Real Bool) T@U)
(declare-fun IsPredicateField (T@U) Bool)
(declare-fun wand_7 (Bool Bool) T@U)
(declare-fun WandType_wand_7Type () T@T)
(declare-fun |wand_7#ft| (Bool Bool) T@U)
(declare-fun IdenticalOnKnownLocations (T@U T@U T@U) Bool)
(declare-fun null () T@U)
(declare-fun PredicateMaskField (T@U) T@U)
(declare-fun HasDirectPerm (T@U T@U T@U) Bool)
(declare-fun |wand_1#ft| (T@U Real T@U Real T@U Int) T@U)
(declare-fun |wand_1#sm| (T@U Real T@U Real T@U Int) T@U)
(declare-fun WandType_wand_1Type () T@T)
(declare-fun wand_9 (T@U Real T@U Real T@U Real Bool) T@U)
(declare-fun WandType_wand_9Type () T@T)
(declare-fun |wand_8#sm| (T@U Real Bool) T@U)
(declare-fun wand_2 (Bool T@U Real T@U Int) T@U)
(declare-fun WandType_wand_2Type () T@T)
(declare-fun wand_3 (T@U Real T@U Int T@U Real T@U Int) T@U)
(declare-fun wand_5 (T@U Real T@U Int T@U Real T@U Int) T@U)
(declare-fun dummyHeap () T@U)
(declare-fun ZeroMask () T@U)
(declare-fun wand_6 (T@U Real T@U Int T@U Real T@U Int T@U Real T@U Int) T@U)
(declare-fun WandType_wand_6Type () T@T)
(declare-fun InsidePredicate (T@U T@U T@U T@U) Bool)
(declare-fun |wand_2#ft| (Bool T@U Real T@U Int) T@U)
(declare-fun |wand_10#ft| (T@U Real T@U Real Bool) T@U)
(declare-fun |wand_4#ft| (T@U Real T@U Int Bool) T@U)
(declare-fun sumMask (T@U T@U T@U) Bool)
(declare-fun |wand#ft| (T@U Real T@U Real) T@U)
(declare-fun wand_1 (T@U Real T@U Real T@U Int) T@U)
(declare-fun |wand_6#ft| (T@U Real T@U Int T@U Real T@U Int T@U Real T@U Int) T@U)
(declare-fun ConditionalFrame (Real T@U) T@U)
(declare-fun EmptyFrame () T@U)
(declare-fun NoPerm () Real)
(declare-fun |wand#sm| (T@U Real T@U Real) T@U)
(declare-fun |wand_2#sm| (Bool T@U Real T@U Int) T@U)
(declare-fun |wand_10#sm| (T@U Real T@U Real Bool) T@U)
(declare-fun |wand_4#sm| (T@U Real T@U Int Bool) T@U)
(declare-fun FullPerm () Real)
(declare-fun |wand_7#sm| (Bool Bool) T@U)
(declare-fun |wand_6#sm| (T@U Real T@U Int T@U Real T@U Int T@U Real T@U Int) T@U)
(declare-fun |wand_9#ft| (T@U Real T@U Real T@U Real Bool) T@U)
(declare-fun |wand_9#sm| (T@U Real T@U Real T@U Real Bool) T@U)
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
))) (= (Ctor NormalFieldType) 7)) (= (type $allocated) (FieldType NormalFieldType boolType))) (= (type f_7) (FieldType NormalFieldType intType))) (= (type g) (FieldType NormalFieldType intType))) (= (type h) (FieldType NormalFieldType intType))))
(assert (distinct $allocated f_7 g h)
)
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (= (Ctor RefType) 8) (forall ((arg0@@14 T@T) (arg1@@2 T@T) ) (! (= (Ctor (MapType0Type arg0@@14 arg1@@2)) 9)
 :qid |ctor:MapType0Type|
))) (forall ((arg0@@15 T@T) (arg1@@3 T@T) ) (! (= (MapType0TypeInv0 (MapType0Type arg0@@15 arg1@@3)) arg0@@15)
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
))) (= (Ctor WandType_wand_3Type) 10)) (= (Ctor FrameTypeType) 11)) (forall ((arg0@@20 T@U) (arg1@@7 Real) (arg2@@1 T@U) (arg3@@0 Int) (arg4 T@U) (arg5 Real) (arg6 T@U) (arg7 Int) ) (! (= (type (|wand_3#ft| arg0@@20 arg1@@7 arg2@@1 arg3@@0 arg4 arg5 arg6 arg7)) (FieldType WandType_wand_3Type FrameTypeType))
 :qid |funType:wand_3#ft|
 :pattern ( (|wand_3#ft| arg0@@20 arg1@@7 arg2@@1 arg3@@0 arg4 arg5 arg6 arg7))
))) (forall ((arg0@@21 T@U) (arg1@@8 Real) (arg2@@2 T@U) (arg3@@1 Int) (arg4@@0 T@U) (arg5@@0 Real) (arg6@@0 T@U) (arg7@@0 Int) ) (! (= (type (|wand_3#sm| arg0@@21 arg1@@8 arg2@@2 arg3@@1 arg4@@0 arg5@@0 arg6@@0 arg7@@0)) (FieldType WandType_wand_3Type (MapType0Type RefType boolType)))
 :qid |funType:wand_3#sm|
 :pattern ( (|wand_3#sm| arg0@@21 arg1@@8 arg2@@2 arg3@@1 arg4@@0 arg5@@0 arg6@@0 arg7@@0))
))))
(assert (forall ((arg1@@9 T@U) (arg2@@3 Real) (arg3@@2 T@U) (arg4@@1 Int) (arg5@@1 T@U) (arg6@@1 Real) (arg7@@1 T@U) (arg8 Int) ) (!  (=> (and (and (and (= (type arg1@@9) RefType) (= (type arg3@@2) RefType)) (= (type arg5@@1) RefType)) (= (type arg7@@1) RefType)) (= (|wand_3#sm| arg1@@9 arg2@@3 arg3@@2 arg4@@1 arg5@@1 arg6@@1 arg7@@1 arg8) (WandMaskField (|wand_3#ft| arg1@@9 arg2@@3 arg3@@2 arg4@@1 arg5@@1 arg6@@1 arg7@@1 arg8))))
 :qid |stdinbpl.199:15|
 :skolemid |26|
 :pattern ( (WandMaskField (|wand_3#ft| arg1@@9 arg2@@3 arg3@@2 arg4@@1 arg5@@1 arg6@@1 arg7@@1 arg8)))
)))
(assert  (and (and (= (Ctor WandType_wand_5Type) 12) (forall ((arg0@@22 T@U) (arg1@@10 Real) (arg2@@4 T@U) (arg3@@3 Int) (arg4@@2 T@U) (arg5@@2 Real) (arg6@@2 T@U) (arg7@@2 Int) ) (! (= (type (|wand_5#ft| arg0@@22 arg1@@10 arg2@@4 arg3@@3 arg4@@2 arg5@@2 arg6@@2 arg7@@2)) (FieldType WandType_wand_5Type FrameTypeType))
 :qid |funType:wand_5#ft|
 :pattern ( (|wand_5#ft| arg0@@22 arg1@@10 arg2@@4 arg3@@3 arg4@@2 arg5@@2 arg6@@2 arg7@@2))
))) (forall ((arg0@@23 T@U) (arg1@@11 Real) (arg2@@5 T@U) (arg3@@4 Int) (arg4@@3 T@U) (arg5@@3 Real) (arg6@@3 T@U) (arg7@@3 Int) ) (! (= (type (|wand_5#sm| arg0@@23 arg1@@11 arg2@@5 arg3@@4 arg4@@3 arg5@@3 arg6@@3 arg7@@3)) (FieldType WandType_wand_5Type (MapType0Type RefType boolType)))
 :qid |funType:wand_5#sm|
 :pattern ( (|wand_5#sm| arg0@@23 arg1@@11 arg2@@5 arg3@@4 arg4@@3 arg5@@3 arg6@@3 arg7@@3))
))))
(assert (forall ((arg1@@12 T@U) (arg2@@6 Real) (arg3@@5 T@U) (arg4@@4 Int) (arg5@@4 T@U) (arg6@@4 Real) (arg7@@4 T@U) (arg8@@0 Int) ) (!  (=> (and (and (and (= (type arg1@@12) RefType) (= (type arg3@@5) RefType)) (= (type arg5@@4) RefType)) (= (type arg7@@4) RefType)) (= (|wand_5#sm| arg1@@12 arg2@@6 arg3@@5 arg4@@4 arg5@@4 arg6@@4 arg7@@4 arg8@@0) (WandMaskField (|wand_5#ft| arg1@@12 arg2@@6 arg3@@5 arg4@@4 arg5@@4 arg6@@4 arg7@@4 arg8@@0))))
 :qid |stdinbpl.231:15|
 :skolemid |33|
 :pattern ( (WandMaskField (|wand_5#ft| arg1@@12 arg2@@6 arg3@@5 arg4@@4 arg5@@4 arg6@@4 arg7@@4 arg8@@0)))
)))
(assert  (and (and (and (and (and (forall ((arg0@@24 T@T) ) (! (= (Ctor (MapType1Type arg0@@24)) 13)
 :qid |ctor:MapType1Type|
)) (forall ((arg0@@25 T@T) ) (! (= (MapType1TypeInv0 (MapType1Type arg0@@25)) arg0@@25)
 :qid |typeInv:MapType1TypeInv0|
 :pattern ( (MapType1Type arg0@@25))
))) (forall ((arg0@@26 T@U) (arg1@@13 T@U) (arg2@@7 T@U) ) (! (let ((B (FieldTypeInv1 (type arg2@@7))))
(= (type (MapType1Select arg0@@26 arg1@@13 arg2@@7)) B))
 :qid |funType:MapType1Select|
 :pattern ( (MapType1Select arg0@@26 arg1@@13 arg2@@7))
))) (forall ((arg0@@27 T@U) (arg1@@14 T@U) (arg2@@8 T@U) (arg3@@6 T@U) ) (! (let ((aVar0@@0 (type arg1@@14)))
(= (type (MapType1Store arg0@@27 arg1@@14 arg2@@8 arg3@@6)) (MapType1Type aVar0@@0)))
 :qid |funType:MapType1Store|
 :pattern ( (MapType1Store arg0@@27 arg1@@14 arg2@@8 arg3@@6))
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
(assert  (and (= (Ctor WandType_wandType) 14) (forall ((arg0@@28 T@U) (arg1@@15 Real) (arg2@@9 T@U) (arg3@@7 Real) ) (! (= (type (wand arg0@@28 arg1@@15 arg2@@9 arg3@@7)) (FieldType WandType_wandType intType))
 :qid |funType:wand|
 :pattern ( (wand arg0@@28 arg1@@15 arg2@@9 arg3@@7))
))))
(assert (forall ((arg1@@16 T@U) (arg2@@10 Real) (arg3@@8 T@U) (arg4@@5 Real) ) (!  (=> (and (= (type arg1@@16) RefType) (= (type arg3@@8) RefType)) (= (getPredWandId (wand arg1@@16 arg2@@10 arg3@@8 arg4@@5)) 9))
 :qid |stdinbpl.491:15|
 :skolemid |90|
 :pattern ( (wand arg1@@16 arg2@@10 arg3@@8 arg4@@5))
)))
(assert  (and (= (Ctor WandType_wand_10Type) 15) (forall ((arg0@@29 T@U) (arg1@@17 Real) (arg2@@11 T@U) (arg3@@9 Real) (arg4@@6 Bool) ) (! (= (type (wand_10 arg0@@29 arg1@@17 arg2@@11 arg3@@9 arg4@@6)) (FieldType WandType_wand_10Type intType))
 :qid |funType:wand_10|
 :pattern ( (wand_10 arg0@@29 arg1@@17 arg2@@11 arg3@@9 arg4@@6))
))))
(assert (forall ((arg1@@18 T@U) (arg2@@12 Real) (arg3@@10 T@U) (arg4@@7 Real) (arg5@@5 Bool) (arg1_2 T@U) (arg2_2 Real) (arg3_2 T@U) (arg4_2 Real) (arg5_2 Bool) ) (!  (=> (and (and (and (and (= (type arg1@@18) RefType) (= (type arg3@@10) RefType)) (= (type arg1_2) RefType)) (= (type arg3_2) RefType)) (= (wand_10 arg1@@18 arg2@@12 arg3@@10 arg4@@7 arg5@@5) (wand_10 arg1_2 arg2_2 arg3_2 arg4_2 arg5_2))) (and (= arg1@@18 arg1_2) (and (= arg2@@12 arg2_2) (and (= arg3@@10 arg3_2) (and (= arg4@@7 arg4_2) (= arg5@@5 arg5_2))))))
 :qid |stdinbpl.367:15|
 :skolemid |63|
 :pattern ( (wand_10 arg1@@18 arg2@@12 arg3@@10 arg4@@7 arg5@@5) (wand_10 arg1_2 arg2_2 arg3_2 arg4_2 arg5_2))
)))
(assert  (and (= (Ctor WandType_wand_4Type) 16) (forall ((arg0@@30 T@U) (arg1@@19 Real) (arg2@@13 T@U) (arg3@@11 Int) (arg4@@8 Bool) ) (! (= (type (wand_4 arg0@@30 arg1@@19 arg2@@13 arg3@@11 arg4@@8)) (FieldType WandType_wand_4Type intType))
 :qid |funType:wand_4|
 :pattern ( (wand_4 arg0@@30 arg1@@19 arg2@@13 arg3@@11 arg4@@8))
))))
(assert (forall ((arg1@@20 T@U) (arg2@@14 Real) (arg3@@12 T@U) (arg4@@9 Int) (arg5@@6 Bool) (arg1_2@@0 T@U) (arg2_2@@0 Real) (arg3_2@@0 T@U) (arg4_2@@0 Int) (arg5_2@@0 Bool) ) (!  (=> (and (and (and (and (= (type arg1@@20) RefType) (= (type arg3@@12) RefType)) (= (type arg1_2@@0) RefType)) (= (type arg3_2@@0) RefType)) (= (wand_4 arg1@@20 arg2@@14 arg3@@12 arg4@@9 arg5@@6) (wand_4 arg1_2@@0 arg2_2@@0 arg3_2@@0 arg4_2@@0 arg5_2@@0))) (and (= arg1@@20 arg1_2@@0) (and (= arg2@@14 arg2_2@@0) (and (= arg3@@12 arg3_2@@0) (and (= arg4@@9 arg4_2@@0) (= arg5@@6 arg5_2@@0))))))
 :qid |stdinbpl.463:15|
 :skolemid |84|
 :pattern ( (wand_4 arg1@@20 arg2@@14 arg3@@12 arg4@@9 arg5@@6) (wand_4 arg1_2@@0 arg2_2@@0 arg3_2@@0 arg4_2@@0 arg5_2@@0))
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
(assert  (and (= (Ctor WandType_wand_8Type) 17) (forall ((arg0@@31 T@U) (arg1@@21 Real) (arg2@@15 Bool) ) (! (= (type (wand_8 arg0@@31 arg1@@21 arg2@@15)) (FieldType WandType_wand_8Type intType))
 :qid |funType:wand_8|
 :pattern ( (wand_8 arg0@@31 arg1@@21 arg2@@15))
))))
(assert (forall ((arg1@@22 T@U) (arg2@@16 Real) (arg3@@13 Bool) ) (!  (=> (= (type arg1@@22) RefType) (IsWandField (wand_8 arg1@@22 arg2@@16 arg3@@13)))
 :qid |stdinbpl.375:15|
 :skolemid |64|
 :pattern ( (wand_8 arg1@@22 arg2@@16 arg3@@13))
)))
(assert (forall ((arg0@@32 T@U) (arg1@@23 Real) (arg2@@17 Bool) ) (! (= (type (|wand_8#ft| arg0@@32 arg1@@23 arg2@@17)) (FieldType WandType_wand_8Type FrameTypeType))
 :qid |funType:wand_8#ft|
 :pattern ( (|wand_8#ft| arg0@@32 arg1@@23 arg2@@17))
)))
(assert (forall ((arg1@@24 T@U) (arg2@@18 Real) (arg3@@14 Bool) ) (!  (=> (= (type arg1@@24) RefType) (IsWandField (|wand_8#ft| arg1@@24 arg2@@18 arg3@@14)))
 :qid |stdinbpl.379:15|
 :skolemid |65|
 :pattern ( (|wand_8#ft| arg1@@24 arg2@@18 arg3@@14))
)))
(assert (forall ((arg1@@25 T@U) (arg2@@19 Real) (arg3@@15 Bool) ) (!  (=> (= (type arg1@@25) RefType) (= (getPredWandId (wand_8 arg1@@25 arg2@@19 arg3@@15)) 6))
 :qid |stdinbpl.395:15|
 :skolemid |69|
 :pattern ( (wand_8 arg1@@25 arg2@@19 arg3@@15))
)))
(assert (forall ((arg1@@26 T@U) (arg2@@20 Real) (arg3@@16 Bool) ) (!  (=> (= (type arg1@@26) RefType) (not (IsPredicateField (wand_8 arg1@@26 arg2@@20 arg3@@16))))
 :qid |stdinbpl.383:15|
 :skolemid |66|
 :pattern ( (wand_8 arg1@@26 arg2@@20 arg3@@16))
)))
(assert (forall ((arg1@@27 T@U) (arg2@@21 Real) (arg3@@17 Bool) ) (!  (=> (= (type arg1@@27) RefType) (not (IsPredicateField (|wand_8#ft| arg1@@27 arg2@@21 arg3@@17))))
 :qid |stdinbpl.387:15|
 :skolemid |67|
 :pattern ( (|wand_8#ft| arg1@@27 arg2@@21 arg3@@17))
)))
(assert  (and (= (Ctor WandType_wand_7Type) 18) (forall ((arg0@@33 Bool) (arg1@@28 Bool) ) (! (= (type (wand_7 arg0@@33 arg1@@28)) (FieldType WandType_wand_7Type intType))
 :qid |funType:wand_7|
 :pattern ( (wand_7 arg0@@33 arg1@@28))
))))
(assert (forall ((arg1@@29 Bool) (arg2@@22 Bool) ) (! (IsWandField (wand_7 arg1@@29 arg2@@22))
 :qid |stdinbpl.407:15|
 :skolemid |71|
 :pattern ( (wand_7 arg1@@29 arg2@@22))
)))
(assert (forall ((arg0@@34 Bool) (arg1@@30 Bool) ) (! (= (type (|wand_7#ft| arg0@@34 arg1@@30)) (FieldType WandType_wand_7Type FrameTypeType))
 :qid |funType:wand_7#ft|
 :pattern ( (|wand_7#ft| arg0@@34 arg1@@30))
)))
(assert (forall ((arg1@@31 Bool) (arg2@@23 Bool) ) (! (IsWandField (|wand_7#ft| arg1@@31 arg2@@23))
 :qid |stdinbpl.411:15|
 :skolemid |72|
 :pattern ( (|wand_7#ft| arg1@@31 arg2@@23))
)))
(assert  (and (= (type null) RefType) (forall ((arg0@@35 T@U) ) (! (let ((A@@0 (FieldTypeInv0 (type arg0@@35))))
(= (type (PredicateMaskField arg0@@35)) (FieldType A@@0 (MapType0Type RefType boolType))))
 :qid |funType:PredicateMaskField|
 :pattern ( (PredicateMaskField arg0@@35))
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
(assert (forall ((arg1@@32 Bool) (arg2@@24 Bool) ) (!  (not (IsPredicateField (wand_7 arg1@@32 arg2@@24)))
 :qid |stdinbpl.415:15|
 :skolemid |73|
 :pattern ( (wand_7 arg1@@32 arg2@@24))
)))
(assert (forall ((arg1@@33 Bool) (arg2@@25 Bool) ) (!  (not (IsPredicateField (|wand_7#ft| arg1@@33 arg2@@25)))
 :qid |stdinbpl.419:15|
 :skolemid |74|
 :pattern ( (|wand_7#ft| arg1@@33 arg2@@25))
)))
(assert (forall ((arg1@@34 T@U) (arg2@@26 Real) (arg3@@18 Bool) (arg1_2@@1 T@U) (arg2_2@@1 Real) (arg3_2@@1 Bool) ) (!  (=> (and (and (= (type arg1@@34) RefType) (= (type arg1_2@@1) RefType)) (= (wand_8 arg1@@34 arg2@@26 arg3@@18) (wand_8 arg1_2@@1 arg2_2@@1 arg3_2@@1))) (and (= arg1@@34 arg1_2@@1) (and (= arg2@@26 arg2_2@@1) (= arg3@@18 arg3_2@@1))))
 :qid |stdinbpl.399:15|
 :skolemid |70|
 :pattern ( (wand_8 arg1@@34 arg2@@26 arg3@@18) (wand_8 arg1_2@@1 arg2_2@@1 arg3_2@@1))
)))
(assert  (and (and (= (Ctor WandType_wand_1Type) 19) (forall ((arg0@@36 T@U) (arg1@@35 Real) (arg2@@27 T@U) (arg3@@19 Real) (arg4@@10 T@U) (arg5@@7 Int) ) (! (= (type (|wand_1#ft| arg0@@36 arg1@@35 arg2@@27 arg3@@19 arg4@@10 arg5@@7)) (FieldType WandType_wand_1Type FrameTypeType))
 :qid |funType:wand_1#ft|
 :pattern ( (|wand_1#ft| arg0@@36 arg1@@35 arg2@@27 arg3@@19 arg4@@10 arg5@@7))
))) (forall ((arg0@@37 T@U) (arg1@@36 Real) (arg2@@28 T@U) (arg3@@20 Real) (arg4@@11 T@U) (arg5@@8 Int) ) (! (= (type (|wand_1#sm| arg0@@37 arg1@@36 arg2@@28 arg3@@20 arg4@@11 arg5@@8)) (FieldType WandType_wand_1Type (MapType0Type RefType boolType)))
 :qid |funType:wand_1#sm|
 :pattern ( (|wand_1#sm| arg0@@37 arg1@@36 arg2@@28 arg3@@20 arg4@@11 arg5@@8))
))))
(assert (forall ((arg1@@37 T@U) (arg2@@29 Real) (arg3@@21 T@U) (arg4@@12 Real) (arg5@@9 T@U) (arg6@@5 Int) ) (!  (=> (and (and (= (type arg1@@37) RefType) (= (type arg3@@21) RefType)) (= (type arg5@@9) RefType)) (= (|wand_1#sm| arg1@@37 arg2@@29 arg3@@21 arg4@@12 arg5@@9 arg6@@5) (WandMaskField (|wand_1#ft| arg1@@37 arg2@@29 arg3@@21 arg4@@12 arg5@@9 arg6@@5))))
 :qid |stdinbpl.327:15|
 :skolemid |54|
 :pattern ( (WandMaskField (|wand_1#ft| arg1@@37 arg2@@29 arg3@@21 arg4@@12 arg5@@9 arg6@@5)))
)))
(assert  (and (= (Ctor WandType_wand_9Type) 20) (forall ((arg0@@38 T@U) (arg1@@38 Real) (arg2@@30 T@U) (arg3@@22 Real) (arg4@@13 T@U) (arg5@@10 Real) (arg6@@6 Bool) ) (! (= (type (wand_9 arg0@@38 arg1@@38 arg2@@30 arg3@@22 arg4@@13 arg5@@10 arg6@@6)) (FieldType WandType_wand_9Type intType))
 :qid |funType:wand_9|
 :pattern ( (wand_9 arg0@@38 arg1@@38 arg2@@30 arg3@@22 arg4@@13 arg5@@10 arg6@@6))
))))
(assert (forall ((arg1@@39 T@U) (arg2@@31 Real) (arg3@@23 T@U) (arg4@@14 Real) (arg5@@11 T@U) (arg6@@7 Real) (arg7@@5 Bool) (arg1_2@@2 T@U) (arg2_2@@2 Real) (arg3_2@@2 T@U) (arg4_2@@1 Real) (arg5_2@@1 T@U) (arg6_2 Real) (arg7_2 Bool) ) (!  (=> (and (and (and (and (and (and (= (type arg1@@39) RefType) (= (type arg3@@23) RefType)) (= (type arg5@@11) RefType)) (= (type arg1_2@@2) RefType)) (= (type arg3_2@@2) RefType)) (= (type arg5_2@@1) RefType)) (= (wand_9 arg1@@39 arg2@@31 arg3@@23 arg4@@14 arg5@@11 arg6@@7 arg7@@5) (wand_9 arg1_2@@2 arg2_2@@2 arg3_2@@2 arg4_2@@1 arg5_2@@1 arg6_2 arg7_2))) (and (= arg1@@39 arg1_2@@2) (and (= arg2@@31 arg2_2@@2) (and (= arg3@@23 arg3_2@@2) (and (= arg4@@14 arg4_2@@1) (and (= arg5@@11 arg5_2@@1) (and (= arg6@@7 arg6_2) (= arg7@@5 arg7_2))))))))
 :qid |stdinbpl.271:15|
 :skolemid |42|
 :pattern ( (wand_9 arg1@@39 arg2@@31 arg3@@23 arg4@@14 arg5@@11 arg6@@7 arg7@@5) (wand_9 arg1_2@@2 arg2_2@@2 arg3_2@@2 arg4_2@@1 arg5_2@@1 arg6_2 arg7_2))
)))
(assert (forall ((arg0@@39 T@U) (arg1@@40 Real) (arg2@@32 Bool) ) (! (= (type (|wand_8#sm| arg0@@39 arg1@@40 arg2@@32)) (FieldType WandType_wand_8Type (MapType0Type RefType boolType)))
 :qid |funType:wand_8#sm|
 :pattern ( (|wand_8#sm| arg0@@39 arg1@@40 arg2@@32))
)))
(assert (forall ((arg1@@41 T@U) (arg2@@33 Real) (arg3@@24 Bool) ) (!  (=> (= (type arg1@@41) RefType) (= (|wand_8#sm| arg1@@41 arg2@@33 arg3@@24) (WandMaskField (|wand_8#ft| arg1@@41 arg2@@33 arg3@@24))))
 :qid |stdinbpl.391:15|
 :skolemid |68|
 :pattern ( (WandMaskField (|wand_8#ft| arg1@@41 arg2@@33 arg3@@24)))
)))
(assert (forall ((Heap@@2 T@U) (ExhaleHeap@@1 T@U) (Mask@@2 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@2) (MapType1Type RefType)) (= (type ExhaleHeap@@1) (MapType1Type RefType))) (= (type Mask@@2) (MapType0Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@2 ExhaleHeap@@1 Mask@@2)) (U_2_bool (MapType1Select Heap@@2 o_1 $allocated))) (U_2_bool (MapType1Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.73:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@2 ExhaleHeap@@1 Mask@@2) (MapType1Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert  (and (= (Ctor WandType_wand_2Type) 21) (forall ((arg0@@40 Bool) (arg1@@42 T@U) (arg2@@34 Real) (arg3@@25 T@U) (arg4@@15 Int) ) (! (= (type (wand_2 arg0@@40 arg1@@42 arg2@@34 arg3@@25 arg4@@15)) (FieldType WandType_wand_2Type intType))
 :qid |funType:wand_2|
 :pattern ( (wand_2 arg0@@40 arg1@@42 arg2@@34 arg3@@25 arg4@@15))
))))
(assert (forall ((arg1@@43 Bool) (arg2@@35 T@U) (arg3@@26 Real) (arg4@@16 T@U) (arg5@@12 Int) ) (!  (=> (and (= (type arg2@@35) RefType) (= (type arg4@@16) RefType)) (= (getPredWandId (wand_2 arg1@@43 arg2@@35 arg3@@26 arg4@@16 arg5@@12)) 3))
 :qid |stdinbpl.299:15|
 :skolemid |48|
 :pattern ( (wand_2 arg1@@43 arg2@@35 arg3@@26 arg4@@16 arg5@@12))
)))
(assert (forall ((arg1@@44 T@U) (arg2@@36 Real) (arg3@@27 T@U) (arg4@@17 Real) (arg5@@13 Bool) ) (!  (=> (and (= (type arg1@@44) RefType) (= (type arg3@@27) RefType)) (= (getPredWandId (wand_10 arg1@@44 arg2@@36 arg3@@27 arg4@@17 arg5@@13)) 5))
 :qid |stdinbpl.363:15|
 :skolemid |62|
 :pattern ( (wand_10 arg1@@44 arg2@@36 arg3@@27 arg4@@17 arg5@@13))
)))
(assert (forall ((arg1@@45 T@U) (arg2@@37 Real) (arg3@@28 T@U) (arg4@@18 Int) (arg5@@14 Bool) ) (!  (=> (and (= (type arg1@@45) RefType) (= (type arg3@@28) RefType)) (= (getPredWandId (wand_4 arg1@@45 arg2@@37 arg3@@28 arg4@@18 arg5@@14)) 8))
 :qid |stdinbpl.459:15|
 :skolemid |83|
 :pattern ( (wand_4 arg1@@45 arg2@@37 arg3@@28 arg4@@18 arg5@@14))
)))
(assert (forall ((arg0@@41 T@U) (arg1@@46 Real) (arg2@@38 T@U) (arg3@@29 Int) (arg4@@19 T@U) (arg5@@15 Real) (arg6@@8 T@U) (arg7@@6 Int) ) (! (= (type (wand_3 arg0@@41 arg1@@46 arg2@@38 arg3@@29 arg4@@19 arg5@@15 arg6@@8 arg7@@6)) (FieldType WandType_wand_3Type intType))
 :qid |funType:wand_3|
 :pattern ( (wand_3 arg0@@41 arg1@@46 arg2@@38 arg3@@29 arg4@@19 arg5@@15 arg6@@8 arg7@@6))
)))
(assert (forall ((arg1@@47 T@U) (arg2@@39 Real) (arg3@@30 T@U) (arg4@@20 Int) (arg5@@16 T@U) (arg6@@9 Real) (arg7@@7 T@U) (arg8@@1 Int) ) (!  (=> (and (and (and (= (type arg1@@47) RefType) (= (type arg3@@30) RefType)) (= (type arg5@@16) RefType)) (= (type arg7@@7) RefType)) (IsWandField (wand_3 arg1@@47 arg2@@39 arg3@@30 arg4@@20 arg5@@16 arg6@@9 arg7@@7 arg8@@1)))
 :qid |stdinbpl.183:15|
 :skolemid |22|
 :pattern ( (wand_3 arg1@@47 arg2@@39 arg3@@30 arg4@@20 arg5@@16 arg6@@9 arg7@@7 arg8@@1))
)))
(assert (forall ((arg1@@48 T@U) (arg2@@40 Real) (arg3@@31 T@U) (arg4@@21 Int) (arg5@@17 T@U) (arg6@@10 Real) (arg7@@8 T@U) (arg8@@2 Int) ) (!  (=> (and (and (and (= (type arg1@@48) RefType) (= (type arg3@@31) RefType)) (= (type arg5@@17) RefType)) (= (type arg7@@8) RefType)) (IsWandField (|wand_3#ft| arg1@@48 arg2@@40 arg3@@31 arg4@@21 arg5@@17 arg6@@10 arg7@@8 arg8@@2)))
 :qid |stdinbpl.187:15|
 :skolemid |23|
 :pattern ( (|wand_3#ft| arg1@@48 arg2@@40 arg3@@31 arg4@@21 arg5@@17 arg6@@10 arg7@@8 arg8@@2))
)))
(assert (forall ((arg0@@42 T@U) (arg1@@49 Real) (arg2@@41 T@U) (arg3@@32 Int) (arg4@@22 T@U) (arg5@@18 Real) (arg6@@11 T@U) (arg7@@9 Int) ) (! (= (type (wand_5 arg0@@42 arg1@@49 arg2@@41 arg3@@32 arg4@@22 arg5@@18 arg6@@11 arg7@@9)) (FieldType WandType_wand_5Type intType))
 :qid |funType:wand_5|
 :pattern ( (wand_5 arg0@@42 arg1@@49 arg2@@41 arg3@@32 arg4@@22 arg5@@18 arg6@@11 arg7@@9))
)))
(assert (forall ((arg1@@50 T@U) (arg2@@42 Real) (arg3@@33 T@U) (arg4@@23 Int) (arg5@@19 T@U) (arg6@@12 Real) (arg7@@10 T@U) (arg8@@3 Int) ) (!  (=> (and (and (and (= (type arg1@@50) RefType) (= (type arg3@@33) RefType)) (= (type arg5@@19) RefType)) (= (type arg7@@10) RefType)) (IsWandField (wand_5 arg1@@50 arg2@@42 arg3@@33 arg4@@23 arg5@@19 arg6@@12 arg7@@10 arg8@@3)))
 :qid |stdinbpl.215:15|
 :skolemid |29|
 :pattern ( (wand_5 arg1@@50 arg2@@42 arg3@@33 arg4@@23 arg5@@19 arg6@@12 arg7@@10 arg8@@3))
)))
(assert (forall ((arg1@@51 T@U) (arg2@@43 Real) (arg3@@34 T@U) (arg4@@24 Int) (arg5@@20 T@U) (arg6@@13 Real) (arg7@@11 T@U) (arg8@@4 Int) ) (!  (=> (and (and (and (= (type arg1@@51) RefType) (= (type arg3@@34) RefType)) (= (type arg5@@20) RefType)) (= (type arg7@@11) RefType)) (IsWandField (|wand_5#ft| arg1@@51 arg2@@43 arg3@@34 arg4@@24 arg5@@20 arg6@@13 arg7@@11 arg8@@4)))
 :qid |stdinbpl.219:15|
 :skolemid |30|
 :pattern ( (|wand_5#ft| arg1@@51 arg2@@43 arg3@@34 arg4@@24 arg5@@20 arg6@@13 arg7@@11 arg8@@4))
)))
(assert (forall ((Heap@@3 T@U) (ExhaleHeap@@2 T@U) (Mask@@3 T@U) (o_1@@0 T@U) (f_2 T@U) ) (! (let ((B@@1 (FieldTypeInv1 (type f_2))))
(let ((A@@1 (FieldTypeInv0 (type f_2))))
 (=> (and (and (and (and (and (and (= (type Heap@@3) (MapType1Type RefType)) (= (type ExhaleHeap@@2) (MapType1Type RefType))) (= (type Mask@@3) (MapType0Type RefType realType))) (= (type o_1@@0) RefType)) (= (type f_2) (FieldType A@@1 B@@1))) (IdenticalOnKnownLocations Heap@@3 ExhaleHeap@@2 Mask@@3)) (HasDirectPerm Mask@@3 o_1@@0 f_2)) (= (MapType1Select Heap@@3 o_1@@0 f_2) (MapType1Select ExhaleHeap@@2 o_1@@0 f_2)))))
 :qid |stdinbpl.42:22|
 :skolemid |1|
 :pattern ( (IdenticalOnKnownLocations Heap@@3 ExhaleHeap@@2 Mask@@3) (MapType1Select ExhaleHeap@@2 o_1@@0 f_2))
)))
(assert (forall ((arg1@@52 T@U) (arg2@@44 Real) (arg3@@35 T@U) (arg4@@25 Int) (arg5@@21 T@U) (arg6@@14 Real) (arg7@@12 T@U) (arg8@@5 Int) ) (!  (=> (and (and (and (= (type arg1@@52) RefType) (= (type arg3@@35) RefType)) (= (type arg5@@21) RefType)) (= (type arg7@@12) RefType)) (not (IsPredicateField (wand_3 arg1@@52 arg2@@44 arg3@@35 arg4@@25 arg5@@21 arg6@@14 arg7@@12 arg8@@5))))
 :qid |stdinbpl.191:15|
 :skolemid |24|
 :pattern ( (wand_3 arg1@@52 arg2@@44 arg3@@35 arg4@@25 arg5@@21 arg6@@14 arg7@@12 arg8@@5))
)))
(assert (forall ((arg1@@53 T@U) (arg2@@45 Real) (arg3@@36 T@U) (arg4@@26 Int) (arg5@@22 T@U) (arg6@@15 Real) (arg7@@13 T@U) (arg8@@6 Int) ) (!  (=> (and (and (and (= (type arg1@@53) RefType) (= (type arg3@@36) RefType)) (= (type arg5@@22) RefType)) (= (type arg7@@13) RefType)) (not (IsPredicateField (|wand_3#ft| arg1@@53 arg2@@45 arg3@@36 arg4@@26 arg5@@22 arg6@@15 arg7@@13 arg8@@6))))
 :qid |stdinbpl.195:15|
 :skolemid |25|
 :pattern ( (|wand_3#ft| arg1@@53 arg2@@45 arg3@@36 arg4@@26 arg5@@22 arg6@@15 arg7@@13 arg8@@6))
)))
(assert (forall ((arg1@@54 T@U) (arg2@@46 Real) (arg3@@37 T@U) (arg4@@27 Int) (arg5@@23 T@U) (arg6@@16 Real) (arg7@@14 T@U) (arg8@@7 Int) ) (!  (=> (and (and (and (= (type arg1@@54) RefType) (= (type arg3@@37) RefType)) (= (type arg5@@23) RefType)) (= (type arg7@@14) RefType)) (not (IsPredicateField (wand_5 arg1@@54 arg2@@46 arg3@@37 arg4@@27 arg5@@23 arg6@@16 arg7@@14 arg8@@7))))
 :qid |stdinbpl.223:15|
 :skolemid |31|
 :pattern ( (wand_5 arg1@@54 arg2@@46 arg3@@37 arg4@@27 arg5@@23 arg6@@16 arg7@@14 arg8@@7))
)))
(assert (forall ((arg1@@55 T@U) (arg2@@47 Real) (arg3@@38 T@U) (arg4@@28 Int) (arg5@@24 T@U) (arg6@@17 Real) (arg7@@15 T@U) (arg8@@8 Int) ) (!  (=> (and (and (and (= (type arg1@@55) RefType) (= (type arg3@@38) RefType)) (= (type arg5@@24) RefType)) (= (type arg7@@15) RefType)) (not (IsPredicateField (|wand_5#ft| arg1@@55 arg2@@47 arg3@@38 arg4@@28 arg5@@24 arg6@@17 arg7@@15 arg8@@8))))
 :qid |stdinbpl.227:15|
 :skolemid |32|
 :pattern ( (|wand_5#ft| arg1@@55 arg2@@47 arg3@@38 arg4@@28 arg5@@24 arg6@@17 arg7@@15 arg8@@8))
)))
(assert  (and (= (type dummyHeap) (MapType1Type RefType)) (= (type ZeroMask) (MapType0Type RefType realType))))
(assert (state dummyHeap ZeroMask))
(assert  (and (= (Ctor WandType_wand_6Type) 22) (forall ((arg0@@43 T@U) (arg1@@56 Real) (arg2@@48 T@U) (arg3@@39 Int) (arg4@@29 T@U) (arg5@@25 Real) (arg6@@18 T@U) (arg7@@16 Int) (arg8@@9 T@U) (arg9 Real) (arg10 T@U) (arg11 Int) ) (! (= (type (wand_6 arg0@@43 arg1@@56 arg2@@48 arg3@@39 arg4@@29 arg5@@25 arg6@@18 arg7@@16 arg8@@9 arg9 arg10 arg11)) (FieldType WandType_wand_6Type intType))
 :qid |funType:wand_6|
 :pattern ( (wand_6 arg0@@43 arg1@@56 arg2@@48 arg3@@39 arg4@@29 arg5@@25 arg6@@18 arg7@@16 arg8@@9 arg9 arg10 arg11))
))))
(assert (forall ((arg1@@57 T@U) (arg2@@49 Real) (arg3@@40 T@U) (arg4@@30 Int) (arg5@@26 T@U) (arg6@@19 Real) (arg7@@17 T@U) (arg8@@10 Int) (arg9@@0 T@U) (arg10@@0 Real) (arg11@@0 T@U) (arg12 Int) ) (!  (=> (and (and (and (and (and (= (type arg1@@57) RefType) (= (type arg3@@40) RefType)) (= (type arg5@@26) RefType)) (= (type arg7@@17) RefType)) (= (type arg9@@0) RefType)) (= (type arg11@@0) RefType)) (= (getPredWandId (wand_6 arg1@@57 arg2@@49 arg3@@40 arg4@@30 arg5@@26 arg6@@19 arg7@@17 arg8@@10 arg9@@0 arg10@@0 arg11@@0 arg12)) 10))
 :qid |stdinbpl.523:15|
 :skolemid |97|
 :pattern ( (wand_6 arg1@@57 arg2@@49 arg3@@40 arg4@@30 arg5@@26 arg6@@19 arg7@@17 arg8@@10 arg9@@0 arg10@@0 arg11@@0 arg12))
)))
(assert (forall ((p T@U) (v_1 T@U) (w T@U) ) (! (let ((A@@2 (FieldTypeInv0 (type p))))
 (=> (and (and (= (type p) (FieldType A@@2 FrameTypeType)) (= (type v_1) FrameTypeType)) (= (type w) FrameTypeType)) (not (InsidePredicate p v_1 p w))))
 :qid |stdinbpl.170:19|
 :skolemid |21|
 :pattern ( (InsidePredicate p v_1 p w))
)))
(assert (forall ((arg1@@58 Bool) (arg2@@50 T@U) (arg3@@41 Real) (arg4@@31 T@U) (arg5@@27 Int) ) (!  (=> (and (= (type arg2@@50) RefType) (= (type arg4@@31) RefType)) (IsWandField (wand_2 arg1@@58 arg2@@50 arg3@@41 arg4@@31 arg5@@27)))
 :qid |stdinbpl.279:15|
 :skolemid |43|
 :pattern ( (wand_2 arg1@@58 arg2@@50 arg3@@41 arg4@@31 arg5@@27))
)))
(assert (forall ((arg0@@44 Bool) (arg1@@59 T@U) (arg2@@51 Real) (arg3@@42 T@U) (arg4@@32 Int) ) (! (= (type (|wand_2#ft| arg0@@44 arg1@@59 arg2@@51 arg3@@42 arg4@@32)) (FieldType WandType_wand_2Type FrameTypeType))
 :qid |funType:wand_2#ft|
 :pattern ( (|wand_2#ft| arg0@@44 arg1@@59 arg2@@51 arg3@@42 arg4@@32))
)))
(assert (forall ((arg1@@60 Bool) (arg2@@52 T@U) (arg3@@43 Real) (arg4@@33 T@U) (arg5@@28 Int) ) (!  (=> (and (= (type arg2@@52) RefType) (= (type arg4@@33) RefType)) (IsWandField (|wand_2#ft| arg1@@60 arg2@@52 arg3@@43 arg4@@33 arg5@@28)))
 :qid |stdinbpl.283:15|
 :skolemid |44|
 :pattern ( (|wand_2#ft| arg1@@60 arg2@@52 arg3@@43 arg4@@33 arg5@@28))
)))
(assert (forall ((arg1@@61 T@U) (arg2@@53 Real) (arg3@@44 T@U) (arg4@@34 Real) (arg5@@29 Bool) ) (!  (=> (and (= (type arg1@@61) RefType) (= (type arg3@@44) RefType)) (IsWandField (wand_10 arg1@@61 arg2@@53 arg3@@44 arg4@@34 arg5@@29)))
 :qid |stdinbpl.343:15|
 :skolemid |57|
 :pattern ( (wand_10 arg1@@61 arg2@@53 arg3@@44 arg4@@34 arg5@@29))
)))
(assert (forall ((arg0@@45 T@U) (arg1@@62 Real) (arg2@@54 T@U) (arg3@@45 Real) (arg4@@35 Bool) ) (! (= (type (|wand_10#ft| arg0@@45 arg1@@62 arg2@@54 arg3@@45 arg4@@35)) (FieldType WandType_wand_10Type FrameTypeType))
 :qid |funType:wand_10#ft|
 :pattern ( (|wand_10#ft| arg0@@45 arg1@@62 arg2@@54 arg3@@45 arg4@@35))
)))
(assert (forall ((arg1@@63 T@U) (arg2@@55 Real) (arg3@@46 T@U) (arg4@@36 Real) (arg5@@30 Bool) ) (!  (=> (and (= (type arg1@@63) RefType) (= (type arg3@@46) RefType)) (IsWandField (|wand_10#ft| arg1@@63 arg2@@55 arg3@@46 arg4@@36 arg5@@30)))
 :qid |stdinbpl.347:15|
 :skolemid |58|
 :pattern ( (|wand_10#ft| arg1@@63 arg2@@55 arg3@@46 arg4@@36 arg5@@30))
)))
(assert (forall ((arg1@@64 T@U) (arg2@@56 Real) (arg3@@47 T@U) (arg4@@37 Int) (arg5@@31 Bool) ) (!  (=> (and (= (type arg1@@64) RefType) (= (type arg3@@47) RefType)) (IsWandField (wand_4 arg1@@64 arg2@@56 arg3@@47 arg4@@37 arg5@@31)))
 :qid |stdinbpl.439:15|
 :skolemid |78|
 :pattern ( (wand_4 arg1@@64 arg2@@56 arg3@@47 arg4@@37 arg5@@31))
)))
(assert (forall ((arg0@@46 T@U) (arg1@@65 Real) (arg2@@57 T@U) (arg3@@48 Int) (arg4@@38 Bool) ) (! (= (type (|wand_4#ft| arg0@@46 arg1@@65 arg2@@57 arg3@@48 arg4@@38)) (FieldType WandType_wand_4Type FrameTypeType))
 :qid |funType:wand_4#ft|
 :pattern ( (|wand_4#ft| arg0@@46 arg1@@65 arg2@@57 arg3@@48 arg4@@38))
)))
(assert (forall ((arg1@@66 T@U) (arg2@@58 Real) (arg3@@49 T@U) (arg4@@39 Int) (arg5@@32 Bool) ) (!  (=> (and (= (type arg1@@66) RefType) (= (type arg3@@49) RefType)) (IsWandField (|wand_4#ft| arg1@@66 arg2@@58 arg3@@49 arg4@@39 arg5@@32)))
 :qid |stdinbpl.443:15|
 :skolemid |79|
 :pattern ( (|wand_4#ft| arg1@@66 arg2@@58 arg3@@49 arg4@@39 arg5@@32))
)))
(assert  (not (IsPredicateField f_7)))
(assert  (not (IsWandField f_7)))
(assert  (not (IsPredicateField g)))
(assert  (not (IsWandField g)))
(assert  (not (IsPredicateField h)))
(assert  (not (IsWandField h)))
(assert (forall ((Heap@@4 T@U) (ExhaleHeap@@3 T@U) (Mask@@4 T@U) ) (!  (=> (and (and (and (= (type Heap@@4) (MapType1Type RefType)) (= (type ExhaleHeap@@3) (MapType1Type RefType))) (= (type Mask@@4) (MapType0Type RefType realType))) (IdenticalOnKnownLocations Heap@@4 ExhaleHeap@@3 Mask@@4)) (succHeap Heap@@4 ExhaleHeap@@3))
 :qid |stdinbpl.83:15|
 :skolemid |10|
 :pattern ( (IdenticalOnKnownLocations Heap@@4 ExhaleHeap@@3 Mask@@4))
)))
(assert (forall ((arg1@@67 Bool) (arg2@@59 T@U) (arg3@@50 Real) (arg4@@40 T@U) (arg5@@33 Int) ) (!  (=> (and (= (type arg2@@59) RefType) (= (type arg4@@40) RefType)) (not (IsPredicateField (wand_2 arg1@@67 arg2@@59 arg3@@50 arg4@@40 arg5@@33))))
 :qid |stdinbpl.287:15|
 :skolemid |45|
 :pattern ( (wand_2 arg1@@67 arg2@@59 arg3@@50 arg4@@40 arg5@@33))
)))
(assert (forall ((arg1@@68 Bool) (arg2@@60 T@U) (arg3@@51 Real) (arg4@@41 T@U) (arg5@@34 Int) ) (!  (=> (and (= (type arg2@@60) RefType) (= (type arg4@@41) RefType)) (not (IsPredicateField (|wand_2#ft| arg1@@68 arg2@@60 arg3@@51 arg4@@41 arg5@@34))))
 :qid |stdinbpl.291:15|
 :skolemid |46|
 :pattern ( (|wand_2#ft| arg1@@68 arg2@@60 arg3@@51 arg4@@41 arg5@@34))
)))
(assert (forall ((arg1@@69 T@U) (arg2@@61 Real) (arg3@@52 T@U) (arg4@@42 Real) (arg5@@35 Bool) ) (!  (=> (and (= (type arg1@@69) RefType) (= (type arg3@@52) RefType)) (not (IsPredicateField (wand_10 arg1@@69 arg2@@61 arg3@@52 arg4@@42 arg5@@35))))
 :qid |stdinbpl.351:15|
 :skolemid |59|
 :pattern ( (wand_10 arg1@@69 arg2@@61 arg3@@52 arg4@@42 arg5@@35))
)))
(assert (forall ((arg1@@70 T@U) (arg2@@62 Real) (arg3@@53 T@U) (arg4@@43 Real) (arg5@@36 Bool) ) (!  (=> (and (= (type arg1@@70) RefType) (= (type arg3@@53) RefType)) (not (IsPredicateField (|wand_10#ft| arg1@@70 arg2@@62 arg3@@53 arg4@@43 arg5@@36))))
 :qid |stdinbpl.355:15|
 :skolemid |60|
 :pattern ( (|wand_10#ft| arg1@@70 arg2@@62 arg3@@53 arg4@@43 arg5@@36))
)))
(assert (forall ((arg1@@71 T@U) (arg2@@63 Real) (arg3@@54 T@U) (arg4@@44 Int) (arg5@@37 Bool) ) (!  (=> (and (= (type arg1@@71) RefType) (= (type arg3@@54) RefType)) (not (IsPredicateField (wand_4 arg1@@71 arg2@@63 arg3@@54 arg4@@44 arg5@@37))))
 :qid |stdinbpl.447:15|
 :skolemid |80|
 :pattern ( (wand_4 arg1@@71 arg2@@63 arg3@@54 arg4@@44 arg5@@37))
)))
(assert (forall ((arg1@@72 T@U) (arg2@@64 Real) (arg3@@55 T@U) (arg4@@45 Int) (arg5@@38 Bool) ) (!  (=> (and (= (type arg1@@72) RefType) (= (type arg3@@55) RefType)) (not (IsPredicateField (|wand_4#ft| arg1@@72 arg2@@64 arg3@@55 arg4@@45 arg5@@38))))
 :qid |stdinbpl.451:15|
 :skolemid |81|
 :pattern ( (|wand_4#ft| arg1@@72 arg2@@64 arg3@@55 arg4@@45 arg5@@38))
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
(assert (forall ((arg1@@73 T@U) (arg2@@65 Real) (arg3@@56 T@U) (arg4@@46 Real) ) (!  (=> (and (= (type arg1@@73) RefType) (= (type arg3@@56) RefType)) (IsWandField (wand arg1@@73 arg2@@65 arg3@@56 arg4@@46)))
 :qid |stdinbpl.471:15|
 :skolemid |85|
 :pattern ( (wand arg1@@73 arg2@@65 arg3@@56 arg4@@46))
)))
(assert (forall ((arg0@@47 T@U) (arg1@@74 Real) (arg2@@66 T@U) (arg3@@57 Real) ) (! (= (type (|wand#ft| arg0@@47 arg1@@74 arg2@@66 arg3@@57)) (FieldType WandType_wandType FrameTypeType))
 :qid |funType:wand#ft|
 :pattern ( (|wand#ft| arg0@@47 arg1@@74 arg2@@66 arg3@@57))
)))
(assert (forall ((arg1@@75 T@U) (arg2@@67 Real) (arg3@@58 T@U) (arg4@@47 Real) ) (!  (=> (and (= (type arg1@@75) RefType) (= (type arg3@@58) RefType)) (IsWandField (|wand#ft| arg1@@75 arg2@@67 arg3@@58 arg4@@47)))
 :qid |stdinbpl.475:15|
 :skolemid |86|
 :pattern ( (|wand#ft| arg1@@75 arg2@@67 arg3@@58 arg4@@47))
)))
(assert (forall ((arg0@@48 T@U) (arg1@@76 Real) (arg2@@68 T@U) (arg3@@59 Real) (arg4@@48 T@U) (arg5@@39 Int) ) (! (= (type (wand_1 arg0@@48 arg1@@76 arg2@@68 arg3@@59 arg4@@48 arg5@@39)) (FieldType WandType_wand_1Type intType))
 :qid |funType:wand_1|
 :pattern ( (wand_1 arg0@@48 arg1@@76 arg2@@68 arg3@@59 arg4@@48 arg5@@39))
)))
(assert (forall ((arg1@@77 T@U) (arg2@@69 Real) (arg3@@60 T@U) (arg4@@49 Real) (arg5@@40 T@U) (arg6@@20 Int) (arg1_2@@3 T@U) (arg2_2@@3 Real) (arg3_2@@3 T@U) (arg4_2@@2 Real) (arg5_2@@2 T@U) (arg6_2@@0 Int) ) (!  (=> (and (and (and (and (and (and (= (type arg1@@77) RefType) (= (type arg3@@60) RefType)) (= (type arg5@@40) RefType)) (= (type arg1_2@@3) RefType)) (= (type arg3_2@@3) RefType)) (= (type arg5_2@@2) RefType)) (= (wand_1 arg1@@77 arg2@@69 arg3@@60 arg4@@49 arg5@@40 arg6@@20) (wand_1 arg1_2@@3 arg2_2@@3 arg3_2@@3 arg4_2@@2 arg5_2@@2 arg6_2@@0))) (and (= arg1@@77 arg1_2@@3) (and (= arg2@@69 arg2_2@@3) (and (= arg3@@60 arg3_2@@3) (and (= arg4@@49 arg4_2@@2) (and (= arg5@@40 arg5_2@@2) (= arg6@@20 arg6_2@@0)))))))
 :qid |stdinbpl.335:15|
 :skolemid |56|
 :pattern ( (wand_1 arg1@@77 arg2@@69 arg3@@60 arg4@@49 arg5@@40 arg6@@20) (wand_1 arg1_2@@3 arg2_2@@3 arg3_2@@3 arg4_2@@2 arg5_2@@2 arg6_2@@0))
)))
(assert (forall ((arg1@@78 T@U) (arg2@@70 Real) (arg3@@61 T@U) (arg4@@50 Int) (arg5@@41 T@U) (arg6@@21 Real) (arg7@@18 T@U) (arg8@@11 Int) (arg9@@1 T@U) (arg10@@1 Real) (arg11@@1 T@U) (arg12@@0 Int) ) (!  (=> (and (and (and (and (and (= (type arg1@@78) RefType) (= (type arg3@@61) RefType)) (= (type arg5@@41) RefType)) (= (type arg7@@18) RefType)) (= (type arg9@@1) RefType)) (= (type arg11@@1) RefType)) (IsWandField (wand_6 arg1@@78 arg2@@70 arg3@@61 arg4@@50 arg5@@41 arg6@@21 arg7@@18 arg8@@11 arg9@@1 arg10@@1 arg11@@1 arg12@@0)))
 :qid |stdinbpl.503:15|
 :skolemid |92|
 :pattern ( (wand_6 arg1@@78 arg2@@70 arg3@@61 arg4@@50 arg5@@41 arg6@@21 arg7@@18 arg8@@11 arg9@@1 arg10@@1 arg11@@1 arg12@@0))
)))
(assert (forall ((arg0@@49 T@U) (arg1@@79 Real) (arg2@@71 T@U) (arg3@@62 Int) (arg4@@51 T@U) (arg5@@42 Real) (arg6@@22 T@U) (arg7@@19 Int) (arg8@@12 T@U) (arg9@@2 Real) (arg10@@2 T@U) (arg11@@2 Int) ) (! (= (type (|wand_6#ft| arg0@@49 arg1@@79 arg2@@71 arg3@@62 arg4@@51 arg5@@42 arg6@@22 arg7@@19 arg8@@12 arg9@@2 arg10@@2 arg11@@2)) (FieldType WandType_wand_6Type FrameTypeType))
 :qid |funType:wand_6#ft|
 :pattern ( (|wand_6#ft| arg0@@49 arg1@@79 arg2@@71 arg3@@62 arg4@@51 arg5@@42 arg6@@22 arg7@@19 arg8@@12 arg9@@2 arg10@@2 arg11@@2))
)))
(assert (forall ((arg1@@80 T@U) (arg2@@72 Real) (arg3@@63 T@U) (arg4@@52 Int) (arg5@@43 T@U) (arg6@@23 Real) (arg7@@20 T@U) (arg8@@13 Int) (arg9@@3 T@U) (arg10@@3 Real) (arg11@@3 T@U) (arg12@@1 Int) ) (!  (=> (and (and (and (and (and (= (type arg1@@80) RefType) (= (type arg3@@63) RefType)) (= (type arg5@@43) RefType)) (= (type arg7@@20) RefType)) (= (type arg9@@3) RefType)) (= (type arg11@@3) RefType)) (IsWandField (|wand_6#ft| arg1@@80 arg2@@72 arg3@@63 arg4@@52 arg5@@43 arg6@@23 arg7@@20 arg8@@13 arg9@@3 arg10@@3 arg11@@3 arg12@@1)))
 :qid |stdinbpl.507:15|
 :skolemid |93|
 :pattern ( (|wand_6#ft| arg1@@80 arg2@@72 arg3@@63 arg4@@52 arg5@@43 arg6@@23 arg7@@20 arg8@@13 arg9@@3 arg10@@3 arg11@@3 arg12@@1))
)))
(assert  (and (forall ((arg0@@50 Real) (arg1@@81 T@U) ) (! (= (type (ConditionalFrame arg0@@50 arg1@@81)) FrameTypeType)
 :qid |funType:ConditionalFrame|
 :pattern ( (ConditionalFrame arg0@@50 arg1@@81))
)) (= (type EmptyFrame) FrameTypeType)))
(assert (forall ((p@@0 Real) (f_6 T@U) ) (!  (=> (= (type f_6) FrameTypeType) (= (ConditionalFrame p@@0 f_6) (ite (> p@@0 0.0) f_6 EmptyFrame)))
 :qid |stdinbpl.158:15|
 :skolemid |19|
 :pattern ( (ConditionalFrame p@@0 f_6))
)))
(assert (forall ((arg1@@82 T@U) (arg2@@73 Real) (arg3@@64 T@U) (arg4@@53 Real) ) (!  (=> (and (= (type arg1@@82) RefType) (= (type arg3@@64) RefType)) (not (IsPredicateField (wand arg1@@82 arg2@@73 arg3@@64 arg4@@53))))
 :qid |stdinbpl.479:15|
 :skolemid |87|
 :pattern ( (wand arg1@@82 arg2@@73 arg3@@64 arg4@@53))
)))
(assert (forall ((arg1@@83 T@U) (arg2@@74 Real) (arg3@@65 T@U) (arg4@@54 Real) ) (!  (=> (and (= (type arg1@@83) RefType) (= (type arg3@@65) RefType)) (not (IsPredicateField (|wand#ft| arg1@@83 arg2@@74 arg3@@65 arg4@@54))))
 :qid |stdinbpl.483:15|
 :skolemid |88|
 :pattern ( (|wand#ft| arg1@@83 arg2@@74 arg3@@65 arg4@@54))
)))
(assert (forall ((arg1@@84 T@U) (arg2@@75 Real) (arg3@@66 T@U) (arg4@@55 Int) (arg5@@44 T@U) (arg6@@24 Real) (arg7@@21 T@U) (arg8@@14 Int) (arg9@@4 T@U) (arg10@@4 Real) (arg11@@4 T@U) (arg12@@2 Int) ) (!  (=> (and (and (and (and (and (= (type arg1@@84) RefType) (= (type arg3@@66) RefType)) (= (type arg5@@44) RefType)) (= (type arg7@@21) RefType)) (= (type arg9@@4) RefType)) (= (type arg11@@4) RefType)) (not (IsPredicateField (wand_6 arg1@@84 arg2@@75 arg3@@66 arg4@@55 arg5@@44 arg6@@24 arg7@@21 arg8@@14 arg9@@4 arg10@@4 arg11@@4 arg12@@2))))
 :qid |stdinbpl.511:15|
 :skolemid |94|
 :pattern ( (wand_6 arg1@@84 arg2@@75 arg3@@66 arg4@@55 arg5@@44 arg6@@24 arg7@@21 arg8@@14 arg9@@4 arg10@@4 arg11@@4 arg12@@2))
)))
(assert (forall ((arg1@@85 T@U) (arg2@@76 Real) (arg3@@67 T@U) (arg4@@56 Int) (arg5@@45 T@U) (arg6@@25 Real) (arg7@@22 T@U) (arg8@@15 Int) (arg9@@5 T@U) (arg10@@5 Real) (arg11@@5 T@U) (arg12@@3 Int) ) (!  (=> (and (and (and (and (and (= (type arg1@@85) RefType) (= (type arg3@@67) RefType)) (= (type arg5@@45) RefType)) (= (type arg7@@22) RefType)) (= (type arg9@@5) RefType)) (= (type arg11@@5) RefType)) (not (IsPredicateField (|wand_6#ft| arg1@@85 arg2@@76 arg3@@67 arg4@@56 arg5@@45 arg6@@25 arg7@@22 arg8@@15 arg9@@5 arg10@@5 arg11@@5 arg12@@3))))
 :qid |stdinbpl.515:15|
 :skolemid |95|
 :pattern ( (|wand_6#ft| arg1@@85 arg2@@76 arg3@@67 arg4@@56 arg5@@45 arg6@@25 arg7@@22 arg8@@15 arg9@@5 arg10@@5 arg11@@5 arg12@@3))
)))
(assert (forall ((Mask@@5 T@U) (o_2@@0 T@U) (f_4@@0 T@U) ) (! (let ((B@@3 (FieldTypeInv1 (type f_4@@0))))
(let ((A@@4 (FieldTypeInv0 (type f_4@@0))))
 (=> (and (and (= (type Mask@@5) (MapType0Type RefType realType)) (= (type o_2@@0) RefType)) (= (type f_4@@0) (FieldType A@@4 B@@3))) (= (HasDirectPerm Mask@@5 o_2@@0 f_4@@0) (> (U_2_real (MapType0Select Mask@@5 o_2@@0 f_4@@0)) NoPerm)))))
 :qid |stdinbpl.133:22|
 :skolemid |17|
 :pattern ( (HasDirectPerm Mask@@5 o_2@@0 f_4@@0))
)))
(assert (forall ((arg0@@51 T@U) (arg1@@86 Real) (arg2@@77 T@U) (arg3@@68 Real) ) (! (= (type (|wand#sm| arg0@@51 arg1@@86 arg2@@77 arg3@@68)) (FieldType WandType_wandType (MapType0Type RefType boolType)))
 :qid |funType:wand#sm|
 :pattern ( (|wand#sm| arg0@@51 arg1@@86 arg2@@77 arg3@@68))
)))
(assert (forall ((arg1@@87 T@U) (arg2@@78 Real) (arg3@@69 T@U) (arg4@@57 Real) ) (!  (=> (and (= (type arg1@@87) RefType) (= (type arg3@@69) RefType)) (= (|wand#sm| arg1@@87 arg2@@78 arg3@@69 arg4@@57) (WandMaskField (|wand#ft| arg1@@87 arg2@@78 arg3@@69 arg4@@57))))
 :qid |stdinbpl.487:15|
 :skolemid |89|
 :pattern ( (WandMaskField (|wand#ft| arg1@@87 arg2@@78 arg3@@69 arg4@@57)))
)))
(assert (forall ((arg1@@88 T@U) (arg2@@79 Real) (arg3@@70 T@U) (arg4@@58 Real) (arg5@@46 T@U) (arg6@@26 Int) ) (!  (=> (and (and (= (type arg1@@88) RefType) (= (type arg3@@70) RefType)) (= (type arg5@@46) RefType)) (= (getPredWandId (wand_1 arg1@@88 arg2@@79 arg3@@70 arg4@@58 arg5@@46 arg6@@26)) 4))
 :qid |stdinbpl.331:15|
 :skolemid |55|
 :pattern ( (wand_1 arg1@@88 arg2@@79 arg3@@70 arg4@@58 arg5@@46 arg6@@26))
)))
(assert (forall ((o_2@@1 T@U) (f_4@@1 T@U) ) (! (let ((B@@4 (FieldTypeInv1 (type f_4@@1))))
(let ((A@@5 (FieldTypeInv0 (type f_4@@1))))
 (=> (and (= (type o_2@@1) RefType) (= (type f_4@@1) (FieldType A@@5 B@@4))) (= (U_2_real (MapType0Select ZeroMask o_2@@1 f_4@@1)) NoPerm))))
 :qid |stdinbpl.106:22|
 :skolemid |13|
 :pattern ( (MapType0Select ZeroMask o_2@@1 f_4@@1))
)))
(assert (forall ((arg1@@89 T@U) (arg2@@80 Real) (arg3@@71 T@U) (arg4@@59 Int) (arg5@@47 T@U) (arg6@@27 Real) (arg7@@23 T@U) (arg8@@16 Int) (arg1_2@@4 T@U) (arg2_2@@4 Real) (arg3_2@@4 T@U) (arg4_2@@3 Int) (arg5_2@@3 T@U) (arg6_2@@1 Real) (arg7_2@@0 T@U) (arg8_2 Int) ) (!  (=> (and (and (and (and (and (and (and (and (= (type arg1@@89) RefType) (= (type arg3@@71) RefType)) (= (type arg5@@47) RefType)) (= (type arg7@@23) RefType)) (= (type arg1_2@@4) RefType)) (= (type arg3_2@@4) RefType)) (= (type arg5_2@@3) RefType)) (= (type arg7_2@@0) RefType)) (= (wand_3 arg1@@89 arg2@@80 arg3@@71 arg4@@59 arg5@@47 arg6@@27 arg7@@23 arg8@@16) (wand_3 arg1_2@@4 arg2_2@@4 arg3_2@@4 arg4_2@@3 arg5_2@@3 arg6_2@@1 arg7_2@@0 arg8_2))) (and (= arg1@@89 arg1_2@@4) (and (= arg2@@80 arg2_2@@4) (and (= arg3@@71 arg3_2@@4) (and (= arg4@@59 arg4_2@@3) (and (= arg5@@47 arg5_2@@3) (and (= arg6@@27 arg6_2@@1) (and (= arg7@@23 arg7_2@@0) (= arg8@@16 arg8_2)))))))))
 :qid |stdinbpl.207:15|
 :skolemid |28|
 :pattern ( (wand_3 arg1@@89 arg2@@80 arg3@@71 arg4@@59 arg5@@47 arg6@@27 arg7@@23 arg8@@16) (wand_3 arg1_2@@4 arg2_2@@4 arg3_2@@4 arg4_2@@3 arg5_2@@3 arg6_2@@1 arg7_2@@0 arg8_2))
)))
(assert (forall ((arg1@@90 T@U) (arg2@@81 Real) (arg3@@72 T@U) (arg4@@60 Int) (arg5@@48 T@U) (arg6@@28 Real) (arg7@@24 T@U) (arg8@@17 Int) (arg1_2@@5 T@U) (arg2_2@@5 Real) (arg3_2@@5 T@U) (arg4_2@@4 Int) (arg5_2@@4 T@U) (arg6_2@@2 Real) (arg7_2@@1 T@U) (arg8_2@@0 Int) ) (!  (=> (and (and (and (and (and (and (and (and (= (type arg1@@90) RefType) (= (type arg3@@72) RefType)) (= (type arg5@@48) RefType)) (= (type arg7@@24) RefType)) (= (type arg1_2@@5) RefType)) (= (type arg3_2@@5) RefType)) (= (type arg5_2@@4) RefType)) (= (type arg7_2@@1) RefType)) (= (wand_5 arg1@@90 arg2@@81 arg3@@72 arg4@@60 arg5@@48 arg6@@28 arg7@@24 arg8@@17) (wand_5 arg1_2@@5 arg2_2@@5 arg3_2@@5 arg4_2@@4 arg5_2@@4 arg6_2@@2 arg7_2@@1 arg8_2@@0))) (and (= arg1@@90 arg1_2@@5) (and (= arg2@@81 arg2_2@@5) (and (= arg3@@72 arg3_2@@5) (and (= arg4@@60 arg4_2@@4) (and (= arg5@@48 arg5_2@@4) (and (= arg6@@28 arg6_2@@2) (and (= arg7@@24 arg7_2@@1) (= arg8@@17 arg8_2@@0)))))))))
 :qid |stdinbpl.239:15|
 :skolemid |35|
 :pattern ( (wand_5 arg1@@90 arg2@@81 arg3@@72 arg4@@60 arg5@@48 arg6@@28 arg7@@24 arg8@@17) (wand_5 arg1_2@@5 arg2_2@@5 arg3_2@@5 arg4_2@@4 arg5_2@@4 arg6_2@@2 arg7_2@@1 arg8_2@@0))
)))
(assert (forall ((arg1@@91 Bool) (arg2@@82 T@U) (arg3@@73 Real) (arg4@@61 T@U) (arg5@@49 Int) (arg1_2@@6 Bool) (arg2_2@@6 T@U) (arg3_2@@6 Real) (arg4_2@@5 T@U) (arg5_2@@5 Int) ) (!  (=> (and (and (and (and (= (type arg2@@82) RefType) (= (type arg4@@61) RefType)) (= (type arg2_2@@6) RefType)) (= (type arg4_2@@5) RefType)) (= (wand_2 arg1@@91 arg2@@82 arg3@@73 arg4@@61 arg5@@49) (wand_2 arg1_2@@6 arg2_2@@6 arg3_2@@6 arg4_2@@5 arg5_2@@5))) (and (= arg1@@91 arg1_2@@6) (and (= arg2@@82 arg2_2@@6) (and (= arg3@@73 arg3_2@@6) (and (= arg4@@61 arg4_2@@5) (= arg5@@49 arg5_2@@5))))))
 :qid |stdinbpl.303:15|
 :skolemid |49|
 :pattern ( (wand_2 arg1@@91 arg2@@82 arg3@@73 arg4@@61 arg5@@49) (wand_2 arg1_2@@6 arg2_2@@6 arg3_2@@6 arg4_2@@5 arg5_2@@5))
)))
(assert (forall ((arg1@@92 T@U) (arg2@@83 Real) (arg3@@74 T@U) (arg4@@62 Real) (arg5@@50 T@U) (arg6@@29 Int) ) (!  (=> (and (and (= (type arg1@@92) RefType) (= (type arg3@@74) RefType)) (= (type arg5@@50) RefType)) (IsWandField (wand_1 arg1@@92 arg2@@83 arg3@@74 arg4@@62 arg5@@50 arg6@@29)))
 :qid |stdinbpl.311:15|
 :skolemid |50|
 :pattern ( (wand_1 arg1@@92 arg2@@83 arg3@@74 arg4@@62 arg5@@50 arg6@@29))
)))
(assert (forall ((arg1@@93 T@U) (arg2@@84 Real) (arg3@@75 T@U) (arg4@@63 Real) (arg5@@51 T@U) (arg6@@30 Int) ) (!  (=> (and (and (= (type arg1@@93) RefType) (= (type arg3@@75) RefType)) (= (type arg5@@51) RefType)) (IsWandField (|wand_1#ft| arg1@@93 arg2@@84 arg3@@75 arg4@@63 arg5@@51 arg6@@30)))
 :qid |stdinbpl.315:15|
 :skolemid |51|
 :pattern ( (|wand_1#ft| arg1@@93 arg2@@84 arg3@@75 arg4@@63 arg5@@51 arg6@@30))
)))
(assert (forall ((arg1@@94 T@U) (arg2@@85 Real) (arg3@@76 T@U) (arg4@@64 Real) (arg5@@52 T@U) (arg6@@31 Int) ) (!  (=> (and (and (= (type arg1@@94) RefType) (= (type arg3@@76) RefType)) (= (type arg5@@52) RefType)) (not (IsPredicateField (wand_1 arg1@@94 arg2@@85 arg3@@76 arg4@@64 arg5@@52 arg6@@31))))
 :qid |stdinbpl.319:15|
 :skolemid |52|
 :pattern ( (wand_1 arg1@@94 arg2@@85 arg3@@76 arg4@@64 arg5@@52 arg6@@31))
)))
(assert (forall ((arg1@@95 T@U) (arg2@@86 Real) (arg3@@77 T@U) (arg4@@65 Real) (arg5@@53 T@U) (arg6@@32 Int) ) (!  (=> (and (and (= (type arg1@@95) RefType) (= (type arg3@@77) RefType)) (= (type arg5@@53) RefType)) (not (IsPredicateField (|wand_1#ft| arg1@@95 arg2@@86 arg3@@77 arg4@@65 arg5@@53 arg6@@32))))
 :qid |stdinbpl.323:15|
 :skolemid |53|
 :pattern ( (|wand_1#ft| arg1@@95 arg2@@86 arg3@@77 arg4@@65 arg5@@53 arg6@@32))
)))
(assert (forall ((arg0@@52 Bool) (arg1@@96 T@U) (arg2@@87 Real) (arg3@@78 T@U) (arg4@@66 Int) ) (! (= (type (|wand_2#sm| arg0@@52 arg1@@96 arg2@@87 arg3@@78 arg4@@66)) (FieldType WandType_wand_2Type (MapType0Type RefType boolType)))
 :qid |funType:wand_2#sm|
 :pattern ( (|wand_2#sm| arg0@@52 arg1@@96 arg2@@87 arg3@@78 arg4@@66))
)))
(assert (forall ((arg1@@97 Bool) (arg2@@88 T@U) (arg3@@79 Real) (arg4@@67 T@U) (arg5@@54 Int) ) (!  (=> (and (= (type arg2@@88) RefType) (= (type arg4@@67) RefType)) (= (|wand_2#sm| arg1@@97 arg2@@88 arg3@@79 arg4@@67 arg5@@54) (WandMaskField (|wand_2#ft| arg1@@97 arg2@@88 arg3@@79 arg4@@67 arg5@@54))))
 :qid |stdinbpl.295:15|
 :skolemid |47|
 :pattern ( (WandMaskField (|wand_2#ft| arg1@@97 arg2@@88 arg3@@79 arg4@@67 arg5@@54)))
)))
(assert (forall ((arg0@@53 T@U) (arg1@@98 Real) (arg2@@89 T@U) (arg3@@80 Real) (arg4@@68 Bool) ) (! (= (type (|wand_10#sm| arg0@@53 arg1@@98 arg2@@89 arg3@@80 arg4@@68)) (FieldType WandType_wand_10Type (MapType0Type RefType boolType)))
 :qid |funType:wand_10#sm|
 :pattern ( (|wand_10#sm| arg0@@53 arg1@@98 arg2@@89 arg3@@80 arg4@@68))
)))
(assert (forall ((arg1@@99 T@U) (arg2@@90 Real) (arg3@@81 T@U) (arg4@@69 Real) (arg5@@55 Bool) ) (!  (=> (and (= (type arg1@@99) RefType) (= (type arg3@@81) RefType)) (= (|wand_10#sm| arg1@@99 arg2@@90 arg3@@81 arg4@@69 arg5@@55) (WandMaskField (|wand_10#ft| arg1@@99 arg2@@90 arg3@@81 arg4@@69 arg5@@55))))
 :qid |stdinbpl.359:15|
 :skolemid |61|
 :pattern ( (WandMaskField (|wand_10#ft| arg1@@99 arg2@@90 arg3@@81 arg4@@69 arg5@@55)))
)))
(assert (forall ((arg0@@54 T@U) (arg1@@100 Real) (arg2@@91 T@U) (arg3@@82 Int) (arg4@@70 Bool) ) (! (= (type (|wand_4#sm| arg0@@54 arg1@@100 arg2@@91 arg3@@82 arg4@@70)) (FieldType WandType_wand_4Type (MapType0Type RefType boolType)))
 :qid |funType:wand_4#sm|
 :pattern ( (|wand_4#sm| arg0@@54 arg1@@100 arg2@@91 arg3@@82 arg4@@70))
)))
(assert (forall ((arg1@@101 T@U) (arg2@@92 Real) (arg3@@83 T@U) (arg4@@71 Int) (arg5@@56 Bool) ) (!  (=> (and (= (type arg1@@101) RefType) (= (type arg3@@83) RefType)) (= (|wand_4#sm| arg1@@101 arg2@@92 arg3@@83 arg4@@71 arg5@@56) (WandMaskField (|wand_4#ft| arg1@@101 arg2@@92 arg3@@83 arg4@@71 arg5@@56))))
 :qid |stdinbpl.455:15|
 :skolemid |82|
 :pattern ( (WandMaskField (|wand_4#ft| arg1@@101 arg2@@92 arg3@@83 arg4@@71 arg5@@56)))
)))
(assert (forall ((arg1@@102 Bool) (arg2@@93 Bool) (arg1_2@@7 Bool) (arg2_2@@7 Bool) ) (!  (=> (= (wand_7 arg1@@102 arg2@@93) (wand_7 arg1_2@@7 arg2_2@@7)) (and (= arg1@@102 arg1_2@@7) (= arg2@@93 arg2_2@@7)))
 :qid |stdinbpl.431:15|
 :skolemid |77|
 :pattern ( (wand_7 arg1@@102 arg2@@93) (wand_7 arg1_2@@7 arg2_2@@7))
)))
(assert (forall ((arg1@@103 T@U) (arg2@@94 Real) (arg3@@84 T@U) (arg4@@72 Int) (arg5@@57 T@U) (arg6@@33 Real) (arg7@@25 T@U) (arg8@@18 Int) ) (!  (=> (and (and (and (= (type arg1@@103) RefType) (= (type arg3@@84) RefType)) (= (type arg5@@57) RefType)) (= (type arg7@@25) RefType)) (= (getPredWandId (wand_3 arg1@@103 arg2@@94 arg3@@84 arg4@@72 arg5@@57 arg6@@33 arg7@@25 arg8@@18)) 0))
 :qid |stdinbpl.203:15|
 :skolemid |27|
 :pattern ( (wand_3 arg1@@103 arg2@@94 arg3@@84 arg4@@72 arg5@@57 arg6@@33 arg7@@25 arg8@@18))
)))
(assert (forall ((arg1@@104 T@U) (arg2@@95 Real) (arg3@@85 T@U) (arg4@@73 Int) (arg5@@58 T@U) (arg6@@34 Real) (arg7@@26 T@U) (arg8@@19 Int) ) (!  (=> (and (and (and (= (type arg1@@104) RefType) (= (type arg3@@85) RefType)) (= (type arg5@@58) RefType)) (= (type arg7@@26) RefType)) (= (getPredWandId (wand_5 arg1@@104 arg2@@95 arg3@@85 arg4@@73 arg5@@58 arg6@@34 arg7@@26 arg8@@19)) 1))
 :qid |stdinbpl.235:15|
 :skolemid |34|
 :pattern ( (wand_5 arg1@@104 arg2@@95 arg3@@85 arg4@@73 arg5@@58 arg6@@34 arg7@@26 arg8@@19))
)))
(assert (forall ((arg1@@105 Bool) (arg2@@96 Bool) ) (! (= (getPredWandId (wand_7 arg1@@105 arg2@@96)) 7)
 :qid |stdinbpl.427:15|
 :skolemid |76|
 :pattern ( (wand_7 arg1@@105 arg2@@96))
)))
(assert (forall ((Heap@@5 T@U) (ExhaleHeap@@4 T@U) (Mask@@6 T@U) (pm_f@@1 T@U) ) (! (let ((C@@1 (FieldTypeInv0 (type pm_f@@1))))
 (=> (and (and (and (and (and (= (type Heap@@5) (MapType1Type RefType)) (= (type ExhaleHeap@@4) (MapType1Type RefType))) (= (type Mask@@6) (MapType0Type RefType realType))) (= (type pm_f@@1) (FieldType C@@1 FrameTypeType))) (IdenticalOnKnownLocations Heap@@5 ExhaleHeap@@4 Mask@@6)) (and (HasDirectPerm Mask@@6 null pm_f@@1) (IsPredicateField pm_f@@1))) (forall ((o2 T@U) (f_2@@0 T@U) ) (! (let ((B@@5 (FieldTypeInv1 (type f_2@@0))))
(let ((A@@6 (FieldTypeInv0 (type f_2@@0))))
 (=> (and (and (= (type o2) RefType) (= (type f_2@@0) (FieldType A@@6 B@@5))) (U_2_bool (MapType0Select (MapType1Select Heap@@5 null (PredicateMaskField pm_f@@1)) o2 f_2@@0))) (= (MapType1Select Heap@@5 o2 f_2@@0) (MapType1Select ExhaleHeap@@4 o2 f_2@@0)))))
 :qid |stdinbpl.54:134|
 :skolemid |3|
 :pattern ( (MapType1Select ExhaleHeap@@4 o2 f_2@@0))
))))
 :qid |stdinbpl.52:19|
 :skolemid |4|
 :pattern ( (IdenticalOnKnownLocations Heap@@5 ExhaleHeap@@4 Mask@@6) (IsPredicateField pm_f@@1))
)))
(assert (forall ((Heap@@6 T@U) (ExhaleHeap@@5 T@U) (Mask@@7 T@U) (pm_f@@2 T@U) ) (! (let ((C@@2 (FieldTypeInv0 (type pm_f@@2))))
 (=> (and (and (and (and (and (= (type Heap@@6) (MapType1Type RefType)) (= (type ExhaleHeap@@5) (MapType1Type RefType))) (= (type Mask@@7) (MapType0Type RefType realType))) (= (type pm_f@@2) (FieldType C@@2 FrameTypeType))) (IdenticalOnKnownLocations Heap@@6 ExhaleHeap@@5 Mask@@7)) (and (HasDirectPerm Mask@@7 null pm_f@@2) (IsWandField pm_f@@2))) (forall ((o2@@0 T@U) (f_2@@1 T@U) ) (! (let ((B@@6 (FieldTypeInv1 (type f_2@@1))))
(let ((A@@7 (FieldTypeInv0 (type f_2@@1))))
 (=> (and (and (= (type o2@@0) RefType) (= (type f_2@@1) (FieldType A@@7 B@@6))) (U_2_bool (MapType0Select (MapType1Select Heap@@6 null (WandMaskField pm_f@@2)) o2@@0 f_2@@1))) (= (MapType1Select Heap@@6 o2@@0 f_2@@1) (MapType1Select ExhaleHeap@@5 o2@@0 f_2@@1)))))
 :qid |stdinbpl.67:129|
 :skolemid |6|
 :pattern ( (MapType1Select ExhaleHeap@@5 o2@@0 f_2@@1))
))))
 :qid |stdinbpl.65:19|
 :skolemid |7|
 :pattern ( (IdenticalOnKnownLocations Heap@@6 ExhaleHeap@@5 Mask@@7) (IsWandField pm_f@@2))
)))
(assert (forall ((Mask@@8 T@U) (o_2@@2 T@U) (f_4@@2 T@U) ) (! (let ((B@@7 (FieldTypeInv1 (type f_4@@2))))
(let ((A@@8 (FieldTypeInv0 (type f_4@@2))))
 (=> (and (and (and (= (type Mask@@8) (MapType0Type RefType realType)) (= (type o_2@@2) RefType)) (= (type f_4@@2) (FieldType A@@8 B@@7))) (GoodMask Mask@@8)) (and (>= (U_2_real (MapType0Select Mask@@8 o_2@@2 f_4@@2)) NoPerm) (=> (and (and (GoodMask Mask@@8) (not (IsPredicateField f_4@@2))) (not (IsWandField f_4@@2))) (<= (U_2_real (MapType0Select Mask@@8 o_2@@2 f_4@@2)) FullPerm))))))
 :qid |stdinbpl.128:22|
 :skolemid |16|
 :pattern ( (GoodMask Mask@@8) (MapType0Select Mask@@8 o_2@@2 f_4@@2))
)))
(assert (forall ((o T@U) (f T@U) (Heap@@7 T@U) ) (!  (=> (and (and (and (= (type o) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap@@7) (MapType1Type RefType))) (U_2_bool (MapType1Select Heap@@7 o $allocated))) (U_2_bool (MapType1Select Heap@@7 (MapType1Select Heap@@7 o f) $allocated)))
 :qid |stdinbpl.31:15|
 :skolemid |0|
 :pattern ( (MapType1Select Heap@@7 o f))
)))
(assert (forall ((arg0@@55 Bool) (arg1@@106 Bool) ) (! (= (type (|wand_7#sm| arg0@@55 arg1@@106)) (FieldType WandType_wand_7Type (MapType0Type RefType boolType)))
 :qid |funType:wand_7#sm|
 :pattern ( (|wand_7#sm| arg0@@55 arg1@@106))
)))
(assert (forall ((arg1@@107 Bool) (arg2@@97 Bool) ) (! (= (|wand_7#sm| arg1@@107 arg2@@97) (WandMaskField (|wand_7#ft| arg1@@107 arg2@@97)))
 :qid |stdinbpl.423:15|
 :skolemid |75|
 :pattern ( (WandMaskField (|wand_7#ft| arg1@@107 arg2@@97)))
)))
(assert (forall ((arg0@@56 T@U) (arg1@@108 Real) (arg2@@98 T@U) (arg3@@86 Int) (arg4@@74 T@U) (arg5@@59 Real) (arg6@@35 T@U) (arg7@@27 Int) (arg8@@20 T@U) (arg9@@6 Real) (arg10@@6 T@U) (arg11@@6 Int) ) (! (= (type (|wand_6#sm| arg0@@56 arg1@@108 arg2@@98 arg3@@86 arg4@@74 arg5@@59 arg6@@35 arg7@@27 arg8@@20 arg9@@6 arg10@@6 arg11@@6)) (FieldType WandType_wand_6Type (MapType0Type RefType boolType)))
 :qid |funType:wand_6#sm|
 :pattern ( (|wand_6#sm| arg0@@56 arg1@@108 arg2@@98 arg3@@86 arg4@@74 arg5@@59 arg6@@35 arg7@@27 arg8@@20 arg9@@6 arg10@@6 arg11@@6))
)))
(assert (forall ((arg1@@109 T@U) (arg2@@99 Real) (arg3@@87 T@U) (arg4@@75 Int) (arg5@@60 T@U) (arg6@@36 Real) (arg7@@28 T@U) (arg8@@21 Int) (arg9@@7 T@U) (arg10@@7 Real) (arg11@@7 T@U) (arg12@@4 Int) ) (!  (=> (and (and (and (and (and (= (type arg1@@109) RefType) (= (type arg3@@87) RefType)) (= (type arg5@@60) RefType)) (= (type arg7@@28) RefType)) (= (type arg9@@7) RefType)) (= (type arg11@@7) RefType)) (= (|wand_6#sm| arg1@@109 arg2@@99 arg3@@87 arg4@@75 arg5@@60 arg6@@36 arg7@@28 arg8@@21 arg9@@7 arg10@@7 arg11@@7 arg12@@4) (WandMaskField (|wand_6#ft| arg1@@109 arg2@@99 arg3@@87 arg4@@75 arg5@@60 arg6@@36 arg7@@28 arg8@@21 arg9@@7 arg10@@7 arg11@@7 arg12@@4))))
 :qid |stdinbpl.519:15|
 :skolemid |96|
 :pattern ( (WandMaskField (|wand_6#ft| arg1@@109 arg2@@99 arg3@@87 arg4@@75 arg5@@60 arg6@@36 arg7@@28 arg8@@21 arg9@@7 arg10@@7 arg11@@7 arg12@@4)))
)))
(assert (forall ((Heap@@8 T@U) (o@@0 T@U) (f_3 T@U) (v T@U) ) (! (let ((B@@8 (type v)))
(let ((A@@9 (FieldTypeInv0 (type f_3))))
 (=> (and (and (= (type Heap@@8) (MapType1Type RefType)) (= (type o@@0) RefType)) (= (type f_3) (FieldType A@@9 B@@8))) (succHeap Heap@@8 (MapType1Store Heap@@8 o@@0 f_3 v)))))
 :qid |stdinbpl.78:22|
 :skolemid |9|
 :pattern ( (MapType1Store Heap@@8 o@@0 f_3 v))
)))
(assert  (and (forall ((arg0@@57 T@U) (arg1@@110 Real) (arg2@@100 T@U) (arg3@@88 Real) (arg4@@76 T@U) (arg5@@61 Real) (arg6@@37 Bool) ) (! (= (type (|wand_9#ft| arg0@@57 arg1@@110 arg2@@100 arg3@@88 arg4@@76 arg5@@61 arg6@@37)) (FieldType WandType_wand_9Type FrameTypeType))
 :qid |funType:wand_9#ft|
 :pattern ( (|wand_9#ft| arg0@@57 arg1@@110 arg2@@100 arg3@@88 arg4@@76 arg5@@61 arg6@@37))
)) (forall ((arg0@@58 T@U) (arg1@@111 Real) (arg2@@101 T@U) (arg3@@89 Real) (arg4@@77 T@U) (arg5@@62 Real) (arg6@@38 Bool) ) (! (= (type (|wand_9#sm| arg0@@58 arg1@@111 arg2@@101 arg3@@89 arg4@@77 arg5@@62 arg6@@38)) (FieldType WandType_wand_9Type (MapType0Type RefType boolType)))
 :qid |funType:wand_9#sm|
 :pattern ( (|wand_9#sm| arg0@@58 arg1@@111 arg2@@101 arg3@@89 arg4@@77 arg5@@62 arg6@@38))
))))
(assert (forall ((arg1@@112 T@U) (arg2@@102 Real) (arg3@@90 T@U) (arg4@@78 Real) (arg5@@63 T@U) (arg6@@39 Real) (arg7@@29 Bool) ) (!  (=> (and (and (= (type arg1@@112) RefType) (= (type arg3@@90) RefType)) (= (type arg5@@63) RefType)) (= (|wand_9#sm| arg1@@112 arg2@@102 arg3@@90 arg4@@78 arg5@@63 arg6@@39 arg7@@29) (WandMaskField (|wand_9#ft| arg1@@112 arg2@@102 arg3@@90 arg4@@78 arg5@@63 arg6@@39 arg7@@29))))
 :qid |stdinbpl.263:15|
 :skolemid |40|
 :pattern ( (WandMaskField (|wand_9#ft| arg1@@112 arg2@@102 arg3@@90 arg4@@78 arg5@@63 arg6@@39 arg7@@29)))
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
(assert (forall ((arg1@@113 T@U) (arg2@@103 Real) (arg3@@91 T@U) (arg4@@79 Real) (arg5@@64 T@U) (arg6@@40 Real) (arg7@@30 Bool) ) (!  (=> (and (and (= (type arg1@@113) RefType) (= (type arg3@@91) RefType)) (= (type arg5@@64) RefType)) (IsWandField (wand_9 arg1@@113 arg2@@103 arg3@@91 arg4@@79 arg5@@64 arg6@@40 arg7@@30)))
 :qid |stdinbpl.247:15|
 :skolemid |36|
 :pattern ( (wand_9 arg1@@113 arg2@@103 arg3@@91 arg4@@79 arg5@@64 arg6@@40 arg7@@30))
)))
(assert (forall ((arg1@@114 T@U) (arg2@@104 Real) (arg3@@92 T@U) (arg4@@80 Real) (arg5@@65 T@U) (arg6@@41 Real) (arg7@@31 Bool) ) (!  (=> (and (and (= (type arg1@@114) RefType) (= (type arg3@@92) RefType)) (= (type arg5@@65) RefType)) (IsWandField (|wand_9#ft| arg1@@114 arg2@@104 arg3@@92 arg4@@80 arg5@@65 arg6@@41 arg7@@31)))
 :qid |stdinbpl.251:15|
 :skolemid |37|
 :pattern ( (|wand_9#ft| arg1@@114 arg2@@104 arg3@@92 arg4@@80 arg5@@65 arg6@@41 arg7@@31))
)))
(assert (forall ((arg1@@115 T@U) (arg2@@105 Real) (arg3@@93 T@U) (arg4@@81 Real) (arg5@@66 T@U) (arg6@@42 Real) (arg7@@32 Bool) ) (!  (=> (and (and (= (type arg1@@115) RefType) (= (type arg3@@93) RefType)) (= (type arg5@@66) RefType)) (not (IsPredicateField (wand_9 arg1@@115 arg2@@105 arg3@@93 arg4@@81 arg5@@66 arg6@@42 arg7@@32))))
 :qid |stdinbpl.255:15|
 :skolemid |38|
 :pattern ( (wand_9 arg1@@115 arg2@@105 arg3@@93 arg4@@81 arg5@@66 arg6@@42 arg7@@32))
)))
(assert (forall ((arg1@@116 T@U) (arg2@@106 Real) (arg3@@94 T@U) (arg4@@82 Real) (arg5@@67 T@U) (arg6@@43 Real) (arg7@@33 Bool) ) (!  (=> (and (and (= (type arg1@@116) RefType) (= (type arg3@@94) RefType)) (= (type arg5@@67) RefType)) (not (IsPredicateField (|wand_9#ft| arg1@@116 arg2@@106 arg3@@94 arg4@@82 arg5@@67 arg6@@43 arg7@@33))))
 :qid |stdinbpl.259:15|
 :skolemid |39|
 :pattern ( (|wand_9#ft| arg1@@116 arg2@@106 arg3@@94 arg4@@82 arg5@@67 arg6@@43 arg7@@33))
)))
(assert (forall ((arg1@@117 T@U) (arg2@@107 Real) (arg3@@95 T@U) (arg4@@83 Int) (arg5@@68 T@U) (arg6@@44 Real) (arg7@@34 T@U) (arg8@@22 Int) (arg9@@8 T@U) (arg10@@8 Real) (arg11@@8 T@U) (arg12@@5 Int) (arg1_2@@8 T@U) (arg2_2@@8 Real) (arg3_2@@7 T@U) (arg4_2@@6 Int) (arg5_2@@6 T@U) (arg6_2@@3 Real) (arg7_2@@2 T@U) (arg8_2@@1 Int) (arg9_2 T@U) (arg10_2 Real) (arg11_2 T@U) (arg12_2 Int) ) (!  (=> (and (and (and (and (and (and (and (and (and (and (and (and (= (type arg1@@117) RefType) (= (type arg3@@95) RefType)) (= (type arg5@@68) RefType)) (= (type arg7@@34) RefType)) (= (type arg9@@8) RefType)) (= (type arg11@@8) RefType)) (= (type arg1_2@@8) RefType)) (= (type arg3_2@@7) RefType)) (= (type arg5_2@@6) RefType)) (= (type arg7_2@@2) RefType)) (= (type arg9_2) RefType)) (= (type arg11_2) RefType)) (= (wand_6 arg1@@117 arg2@@107 arg3@@95 arg4@@83 arg5@@68 arg6@@44 arg7@@34 arg8@@22 arg9@@8 arg10@@8 arg11@@8 arg12@@5) (wand_6 arg1_2@@8 arg2_2@@8 arg3_2@@7 arg4_2@@6 arg5_2@@6 arg6_2@@3 arg7_2@@2 arg8_2@@1 arg9_2 arg10_2 arg11_2 arg12_2))) (and (= arg1@@117 arg1_2@@8) (and (= arg2@@107 arg2_2@@8) (and (= arg3@@95 arg3_2@@7) (and (= arg4@@83 arg4_2@@6) (and (= arg5@@68 arg5_2@@6) (and (= arg6@@44 arg6_2@@3) (and (= arg7@@34 arg7_2@@2) (and (= arg8@@22 arg8_2@@1) (and (= arg9@@8 arg9_2) (and (= arg10@@8 arg10_2) (and (= arg11@@8 arg11_2) (= arg12@@5 arg12_2)))))))))))))
 :qid |stdinbpl.527:15|
 :skolemid |98|
 :pattern ( (wand_6 arg1@@117 arg2@@107 arg3@@95 arg4@@83 arg5@@68 arg6@@44 arg7@@34 arg8@@22 arg9@@8 arg10@@8 arg11@@8 arg12@@5) (wand_6 arg1_2@@8 arg2_2@@8 arg3_2@@7 arg4_2@@6 arg5_2@@6 arg6_2@@3 arg7_2@@2 arg8_2@@1 arg9_2 arg10_2 arg11_2 arg12_2))
)))
(assert (forall ((arg1@@118 T@U) (arg2@@108 Real) (arg3@@96 T@U) (arg4@@84 Real) (arg5@@69 T@U) (arg6@@45 Real) (arg7@@35 Bool) ) (!  (=> (and (and (= (type arg1@@118) RefType) (= (type arg3@@96) RefType)) (= (type arg5@@69) RefType)) (= (getPredWandId (wand_9 arg1@@118 arg2@@108 arg3@@96 arg4@@84 arg5@@69 arg6@@45 arg7@@35)) 2))
 :qid |stdinbpl.267:15|
 :skolemid |41|
 :pattern ( (wand_9 arg1@@118 arg2@@108 arg3@@96 arg4@@84 arg5@@69 arg6@@45 arg7@@35))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
(assert (forall ((arg1@@119 T@U) (arg2@@109 Real) (arg3@@97 T@U) (arg4@@85 Real) (arg1_2@@9 T@U) (arg2_2@@9 Real) (arg3_2@@8 T@U) (arg4_2@@7 Real) ) (!  (=> (and (and (and (and (= (type arg1@@119) RefType) (= (type arg3@@97) RefType)) (= (type arg1_2@@9) RefType)) (= (type arg3_2@@8) RefType)) (= (wand arg1@@119 arg2@@109 arg3@@97 arg4@@85) (wand arg1_2@@9 arg2_2@@9 arg3_2@@8 arg4_2@@7))) (and (= arg1@@119 arg1_2@@9) (and (= arg2@@109 arg2_2@@9) (and (= arg3@@97 arg3_2@@8) (= arg4@@85 arg4_2@@7)))))
 :qid |stdinbpl.495:15|
 :skolemid |91|
 :pattern ( (wand arg1@@119 arg2@@109 arg3@@97 arg4@@85) (wand arg1_2@@9 arg2_2@@9 arg3_2@@8 arg4_2@@7))
)))
(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun b_49@2 () Bool)
(declare-fun b_49@1 () Bool)
(declare-fun Ops_25Heap@0 () T@U)
(declare-fun b_49@3 () Bool)
(declare-fun b_50@0 () Bool)
(declare-fun b_50 () Bool)
(declare-fun Used_25Heap@0 () T@U)
(declare-fun Mask@1 () T@U)
(declare-fun Mask@0 () T@U)
(declare-fun Heap@@9 () T@U)
(declare-fun b_49@0 () Bool)
(declare-fun x@@8 () T@U)
(declare-fun b_49 () Bool)
(declare-fun b_48@0 () Bool)
(declare-fun b_48 () Bool)
(declare-fun Used_24Heap@0 () T@U)
(assert  (and (and (and (and (and (and (= (type Ops_25Heap@0) (MapType1Type RefType)) (= (type Used_25Heap@0) (MapType1Type RefType))) (= (type Mask@1) (MapType0Type RefType realType))) (= (type Mask@0) (MapType0Type RefType realType))) (= (type Heap@@9) (MapType1Type RefType))) (= (type x@@8) RefType)) (= (type Used_24Heap@0) (MapType1Type RefType))))
(set-info :boogie-vc-id test12)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 7) (let ((anon2_correct  (=> (= b_49@2  (and b_49@1 (state Ops_25Heap@0 ZeroMask))) (=> (and (= b_49@3  (and b_49@2 (state Ops_25Heap@0 ZeroMask))) (= b_50@0  (and b_50 (state Used_25Heap@0 ZeroMask)))) (and (=> (= (ControlFlow 0 2) (- 0 3)) (=> (and (and b_49@3 b_49@3) b_50@0) false)) (=> (=> (and (and b_49@3 b_49@3) b_50@0) false) (=> (= Mask@1 (MapType0Store Mask@0 null (wand_7 false false) (real_2_U (+ (U_2_real (MapType0Select Mask@0 null (wand_7 false false))) FullPerm)))) (=> (and (and (state Heap@@9 Mask@1) (state Heap@@9 Mask@1)) (and (state Heap@@9 Mask@1) (= (ControlFlow 0 2) (- 0 1)))) false))))))))
(let ((anon3_Else_correct  (=> (not b_49@0) (=> (and (= b_49@1 b_49@0) (= (ControlFlow 0 5) 2)) anon2_correct))))
(let ((anon3_Then_correct  (=> b_49@0 (=> (and (= b_49@1 false) (= (ControlFlow 0 4) 2)) anon2_correct))))
(let ((anon0_correct  (=> (and (and (and (state Heap@@9 ZeroMask) (U_2_bool (MapType1Select Heap@@9 x@@8 $allocated))) (and (not (= x@@8 null)) (= Mask@0 (MapType0Store ZeroMask x@@8 f_7 (real_2_U (+ (U_2_real (MapType0Select ZeroMask x@@8 f_7)) FullPerm)))))) (and (and (state Heap@@9 Mask@0) (state Heap@@9 Mask@0)) (and (= b_49@0  (and b_49 (state Ops_25Heap@0 ZeroMask))) (= b_48@0  (and b_48 (state Used_24Heap@0 ZeroMask)))))) (and (=> (= (ControlFlow 0 6) 4) anon3_Then_correct) (=> (= (ControlFlow 0 6) 5) anon3_Else_correct)))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 7) 6) anon0_correct)))
PreconditionGeneratedEntry_correct))))))
))
(check-sat)
(get-info :reason-unknown)
(assert (not (= (ControlFlow 0 2) (- 1))))
(check-sat)
(pop 1)
; Invalid
(get-info :rlimit)
