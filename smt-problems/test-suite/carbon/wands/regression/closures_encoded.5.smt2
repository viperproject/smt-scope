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
(declare-fun |wand_4#ft| (T@U Real T@U Real T@U Real T@U Real) T@U)
(declare-fun |wand_4#sm| (T@U Real T@U Real T@U Real T@U Real) T@U)
(declare-fun WandType_wand_4Type () T@T)
(declare-fun succHeap (T@U T@U) Bool)
(declare-fun MapType1Type (T@T) T@T)
(declare-fun succHeapTrans (T@U T@U) Bool)
(declare-fun MapType1TypeInv0 (T@T) T@T)
(declare-fun MapType1Select (T@U T@U T@U) T@U)
(declare-fun MapType1Store (T@U T@U T@U T@U) T@U)
(declare-fun wand_1 (T@U Real T@U Real) T@U)
(declare-fun getPredWandId (T@U) Int)
(declare-fun WandType_wand_1Type () T@T)
(declare-fun wand (T@U Real T@U Real) T@U)
(declare-fun WandType_wandType () T@T)
(declare-fun state (T@U T@U) Bool)
(declare-fun GoodMask (T@U) Bool)
(declare-fun wand_6 (Bool Bool Bool) T@U)
(declare-fun IsWandField (T@U) Bool)
(declare-fun WandType_wand_6Type () T@T)
(declare-fun |wand_6#ft| (Bool Bool Bool) T@U)
(declare-fun IsPredicateField (T@U) Bool)
(declare-fun wand_5 (Bool Bool) T@U)
(declare-fun WandType_wand_5Type () T@T)
(declare-fun |wand_5#ft| (Bool Bool) T@U)
(declare-fun IdenticalOnKnownLocations (T@U T@U T@U) Bool)
(declare-fun null () T@U)
(declare-fun PredicateMaskField (T@U) T@U)
(declare-fun HasDirectPerm (T@U T@U T@U) Bool)
(declare-fun c1_pre (T@U) T@U)
(declare-fun PredicateType_c1_preType () T@T)
(declare-fun c1_post (T@U) T@U)
(declare-fun PredicateType_c1_postType () T@T)
(declare-fun c2_pre (T@U) T@U)
(declare-fun PredicateType_c2_preType () T@T)
(declare-fun c2_post (T@U) T@U)
(declare-fun PredicateType_c2_postType () T@T)
(declare-fun c3_pre (T@U) T@U)
(declare-fun PredicateType_c3_preType () T@T)
(declare-fun c3_post (T@U) T@U)
(declare-fun PredicateType_c3_postType () T@T)
(declare-fun |c1_pre#trigger| (T@U T@U) Bool)
(declare-fun |c1_pre#everUsed| (T@U) Bool)
(declare-fun |c1_post#trigger| (T@U T@U) Bool)
(declare-fun |c1_post#everUsed| (T@U) Bool)
(declare-fun |c2_pre#trigger| (T@U T@U) Bool)
(declare-fun |c2_pre#everUsed| (T@U) Bool)
(declare-fun |c2_post#trigger| (T@U T@U) Bool)
(declare-fun |c2_post#everUsed| (T@U) Bool)
(declare-fun |c3_pre#trigger| (T@U T@U) Bool)
(declare-fun |c3_pre#everUsed| (T@U) Bool)
(declare-fun |c3_post#trigger| (T@U T@U) Bool)
(declare-fun |c3_post#everUsed| (T@U) Bool)
(declare-fun |wand_2#ft| (T@U Real T@U Int T@U Real) T@U)
(declare-fun |wand_2#sm| (T@U Real T@U Int T@U Real) T@U)
(declare-fun WandType_wand_2Type () T@T)
(declare-fun |wand_6#sm| (Bool Bool Bool) T@U)
(declare-fun |c1_pre#sm| (T@U) T@U)
(declare-fun |c1_post#sm| (T@U) T@U)
(declare-fun |c2_pre#sm| (T@U) T@U)
(declare-fun |c2_post#sm| (T@U) T@U)
(declare-fun |c3_pre#sm| (T@U) T@U)
(declare-fun |c3_post#sm| (T@U) T@U)
(declare-fun wand_3 (T@U Real T@U Int T@U Real T@U Int) T@U)
(declare-fun wand_4 (T@U Real T@U Real T@U Real T@U Real) T@U)
(declare-fun dummyHeap () T@U)
(declare-fun ZeroMask () T@U)
(declare-fun InsidePredicate (T@U T@U T@U T@U) Bool)
(declare-fun sumMask (T@U T@U T@U) Bool)
(declare-fun |wand_1#ft| (T@U Real T@U Real) T@U)
(declare-fun |wand#ft| (T@U Real T@U Real) T@U)
(declare-fun wand_2 (T@U Real T@U Int T@U Real) T@U)
(declare-fun ConditionalFrame (Real T@U) T@U)
(declare-fun EmptyFrame () T@U)
(declare-fun NoPerm () Real)
(declare-fun |wand_1#sm| (T@U Real T@U Real) T@U)
(declare-fun |wand#sm| (T@U Real T@U Real) T@U)
(declare-fun FullPerm () Real)
(declare-fun |wand_5#sm| (Bool Bool) T@U)
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
(assert  (and (and (= (Ctor WandType_wand_4Type) 12) (forall ((arg0@@22 T@U) (arg1@@10 Real) (arg2@@4 T@U) (arg3@@3 Real) (arg4@@2 T@U) (arg5@@2 Real) (arg6@@2 T@U) (arg7@@2 Real) ) (! (= (type (|wand_4#ft| arg0@@22 arg1@@10 arg2@@4 arg3@@3 arg4@@2 arg5@@2 arg6@@2 arg7@@2)) (FieldType WandType_wand_4Type FrameTypeType))
 :qid |funType:wand_4#ft|
 :pattern ( (|wand_4#ft| arg0@@22 arg1@@10 arg2@@4 arg3@@3 arg4@@2 arg5@@2 arg6@@2 arg7@@2))
))) (forall ((arg0@@23 T@U) (arg1@@11 Real) (arg2@@5 T@U) (arg3@@4 Real) (arg4@@3 T@U) (arg5@@3 Real) (arg6@@3 T@U) (arg7@@3 Real) ) (! (= (type (|wand_4#sm| arg0@@23 arg1@@11 arg2@@5 arg3@@4 arg4@@3 arg5@@3 arg6@@3 arg7@@3)) (FieldType WandType_wand_4Type (MapType0Type RefType boolType)))
 :qid |funType:wand_4#sm|
 :pattern ( (|wand_4#sm| arg0@@23 arg1@@11 arg2@@5 arg3@@4 arg4@@3 arg5@@3 arg6@@3 arg7@@3))
))))
(assert (forall ((arg1@@12 T@U) (arg2@@6 Real) (arg3@@5 T@U) (arg4@@4 Real) (arg5@@4 T@U) (arg6@@4 Real) (arg7@@4 T@U) (arg8@@0 Real) ) (!  (=> (and (and (and (= (type arg1@@12) RefType) (= (type arg3@@5) RefType)) (= (type arg5@@4) RefType)) (= (type arg7@@4) RefType)) (= (|wand_4#sm| arg1@@12 arg2@@6 arg3@@5 arg4@@4 arg5@@4 arg6@@4 arg7@@4 arg8@@0) (WandMaskField (|wand_4#ft| arg1@@12 arg2@@6 arg3@@5 arg4@@4 arg5@@4 arg6@@4 arg7@@4 arg8@@0))))
 :qid |stdinbpl.263:15|
 :skolemid |40|
 :pattern ( (WandMaskField (|wand_4#ft| arg1@@12 arg2@@6 arg3@@5 arg4@@4 arg5@@4 arg6@@4 arg7@@4 arg8@@0)))
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
(assert  (and (= (Ctor WandType_wand_1Type) 14) (forall ((arg0@@28 T@U) (arg1@@15 Real) (arg2@@9 T@U) (arg3@@7 Real) ) (! (= (type (wand_1 arg0@@28 arg1@@15 arg2@@9 arg3@@7)) (FieldType WandType_wand_1Type intType))
 :qid |funType:wand_1|
 :pattern ( (wand_1 arg0@@28 arg1@@15 arg2@@9 arg3@@7))
))))
(assert (forall ((arg1@@16 T@U) (arg2@@10 Real) (arg3@@8 T@U) (arg4@@5 Real) ) (!  (=> (and (= (type arg1@@16) RefType) (= (type arg3@@8) RefType)) (= (getPredWandId (wand_1 arg1@@16 arg2@@10 arg3@@8 arg4@@5)) 7))
 :qid |stdinbpl.235:15|
 :skolemid |34|
 :pattern ( (wand_1 arg1@@16 arg2@@10 arg3@@8 arg4@@5))
)))
(assert  (and (= (Ctor WandType_wandType) 15) (forall ((arg0@@29 T@U) (arg1@@17 Real) (arg2@@11 T@U) (arg3@@9 Real) ) (! (= (type (wand arg0@@29 arg1@@17 arg2@@11 arg3@@9)) (FieldType WandType_wandType intType))
 :qid |funType:wand|
 :pattern ( (wand arg0@@29 arg1@@17 arg2@@11 arg3@@9))
))))
(assert (forall ((arg1@@18 T@U) (arg2@@12 Real) (arg3@@10 T@U) (arg4@@6 Real) ) (!  (=> (and (= (type arg1@@18) RefType) (= (type arg3@@10) RefType)) (= (getPredWandId (wand arg1@@18 arg2@@12 arg3@@10 arg4@@6)) 12))
 :qid |stdinbpl.395:15|
 :skolemid |69|
 :pattern ( (wand arg1@@18 arg2@@12 arg3@@10 arg4@@6))
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
(assert  (and (= (Ctor WandType_wand_6Type) 16) (forall ((arg0@@30 Bool) (arg1@@19 Bool) (arg2@@13 Bool) ) (! (= (type (wand_6 arg0@@30 arg1@@19 arg2@@13)) (FieldType WandType_wand_6Type intType))
 :qid |funType:wand_6|
 :pattern ( (wand_6 arg0@@30 arg1@@19 arg2@@13))
))))
(assert (forall ((arg1@@20 Bool) (arg2@@14 Bool) (arg3@@11 Bool) ) (! (IsWandField (wand_6 arg1@@20 arg2@@14 arg3@@11))
 :qid |stdinbpl.279:15|
 :skolemid |43|
 :pattern ( (wand_6 arg1@@20 arg2@@14 arg3@@11))
)))
(assert (forall ((arg0@@31 Bool) (arg1@@21 Bool) (arg2@@15 Bool) ) (! (= (type (|wand_6#ft| arg0@@31 arg1@@21 arg2@@15)) (FieldType WandType_wand_6Type FrameTypeType))
 :qid |funType:wand_6#ft|
 :pattern ( (|wand_6#ft| arg0@@31 arg1@@21 arg2@@15))
)))
(assert (forall ((arg1@@22 Bool) (arg2@@16 Bool) (arg3@@12 Bool) ) (! (IsWandField (|wand_6#ft| arg1@@22 arg2@@16 arg3@@12))
 :qid |stdinbpl.283:15|
 :skolemid |44|
 :pattern ( (|wand_6#ft| arg1@@22 arg2@@16 arg3@@12))
)))
(assert (forall ((arg1@@23 Bool) (arg2@@17 Bool) (arg3@@13 Bool) (arg1_2 Bool) (arg2_2 Bool) (arg3_2 Bool) ) (!  (=> (= (wand_6 arg1@@23 arg2@@17 arg3@@13) (wand_6 arg1_2 arg2_2 arg3_2)) (and (= arg1@@23 arg1_2) (and (= arg2@@17 arg2_2) (= arg3@@13 arg3_2))))
 :qid |stdinbpl.303:15|
 :skolemid |49|
 :pattern ( (wand_6 arg1@@23 arg2@@17 arg3@@13) (wand_6 arg1_2 arg2_2 arg3_2))
)))
(assert (forall ((arg1@@24 Bool) (arg2@@18 Bool) (arg3@@14 Bool) ) (! (= (getPredWandId (wand_6 arg1@@24 arg2@@18 arg3@@14)) 9)
 :qid |stdinbpl.299:15|
 :skolemid |48|
 :pattern ( (wand_6 arg1@@24 arg2@@18 arg3@@14))
)))
(assert (forall ((arg1@@25 Bool) (arg2@@19 Bool) (arg3@@15 Bool) ) (!  (not (IsPredicateField (wand_6 arg1@@25 arg2@@19 arg3@@15)))
 :qid |stdinbpl.287:15|
 :skolemid |45|
 :pattern ( (wand_6 arg1@@25 arg2@@19 arg3@@15))
)))
(assert (forall ((arg1@@26 Bool) (arg2@@20 Bool) (arg3@@16 Bool) ) (!  (not (IsPredicateField (|wand_6#ft| arg1@@26 arg2@@20 arg3@@16)))
 :qid |stdinbpl.291:15|
 :skolemid |46|
 :pattern ( (|wand_6#ft| arg1@@26 arg2@@20 arg3@@16))
)))
(assert  (and (= (Ctor WandType_wand_5Type) 17) (forall ((arg0@@32 Bool) (arg1@@27 Bool) ) (! (= (type (wand_5 arg0@@32 arg1@@27)) (FieldType WandType_wand_5Type intType))
 :qid |funType:wand_5|
 :pattern ( (wand_5 arg0@@32 arg1@@27))
))))
(assert (forall ((arg1@@28 Bool) (arg2@@21 Bool) ) (! (IsWandField (wand_5 arg1@@28 arg2@@21))
 :qid |stdinbpl.343:15|
 :skolemid |57|
 :pattern ( (wand_5 arg1@@28 arg2@@21))
)))
(assert (forall ((arg0@@33 Bool) (arg1@@29 Bool) ) (! (= (type (|wand_5#ft| arg0@@33 arg1@@29)) (FieldType WandType_wand_5Type FrameTypeType))
 :qid |funType:wand_5#ft|
 :pattern ( (|wand_5#ft| arg0@@33 arg1@@29))
)))
(assert (forall ((arg1@@30 Bool) (arg2@@22 Bool) ) (! (IsWandField (|wand_5#ft| arg1@@30 arg2@@22))
 :qid |stdinbpl.347:15|
 :skolemid |58|
 :pattern ( (|wand_5#ft| arg1@@30 arg2@@22))
)))
(assert  (and (= (type null) RefType) (forall ((arg0@@34 T@U) ) (! (let ((A@@0 (FieldTypeInv0 (type arg0@@34))))
(= (type (PredicateMaskField arg0@@34)) (FieldType A@@0 (MapType0Type RefType boolType))))
 :qid |funType:PredicateMaskField|
 :pattern ( (PredicateMaskField arg0@@34))
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
(assert (forall ((arg1@@31 Bool) (arg2@@23 Bool) ) (!  (not (IsPredicateField (wand_5 arg1@@31 arg2@@23)))
 :qid |stdinbpl.351:15|
 :skolemid |59|
 :pattern ( (wand_5 arg1@@31 arg2@@23))
)))
(assert (forall ((arg1@@32 Bool) (arg2@@24 Bool) ) (!  (not (IsPredicateField (|wand_5#ft| arg1@@32 arg2@@24)))
 :qid |stdinbpl.355:15|
 :skolemid |60|
 :pattern ( (|wand_5#ft| arg1@@32 arg2@@24))
)))
(assert  (and (= (Ctor PredicateType_c1_preType) 18) (forall ((arg0@@35 T@U) ) (! (= (type (c1_pre arg0@@35)) (FieldType PredicateType_c1_preType FrameTypeType))
 :qid |funType:c1_pre|
 :pattern ( (c1_pre arg0@@35))
))))
(assert (forall ((x@@8 T@U) ) (!  (=> (= (type x@@8) RefType) (IsPredicateField (c1_pre x@@8)))
 :qid |stdinbpl.423:15|
 :skolemid |72|
 :pattern ( (c1_pre x@@8))
)))
(assert  (and (= (Ctor PredicateType_c1_postType) 19) (forall ((arg0@@36 T@U) ) (! (= (type (c1_post arg0@@36)) (FieldType PredicateType_c1_postType FrameTypeType))
 :qid |funType:c1_post|
 :pattern ( (c1_post arg0@@36))
))))
(assert (forall ((x@@9 T@U) ) (!  (=> (= (type x@@9) RefType) (IsPredicateField (c1_post x@@9)))
 :qid |stdinbpl.471:15|
 :skolemid |78|
 :pattern ( (c1_post x@@9))
)))
(assert  (and (= (Ctor PredicateType_c2_preType) 20) (forall ((arg0@@37 T@U) ) (! (= (type (c2_pre arg0@@37)) (FieldType PredicateType_c2_preType FrameTypeType))
 :qid |funType:c2_pre|
 :pattern ( (c2_pre arg0@@37))
))))
(assert (forall ((x@@10 T@U) ) (!  (=> (= (type x@@10) RefType) (IsPredicateField (c2_pre x@@10)))
 :qid |stdinbpl.519:15|
 :skolemid |84|
 :pattern ( (c2_pre x@@10))
)))
(assert  (and (= (Ctor PredicateType_c2_postType) 21) (forall ((arg0@@38 T@U) ) (! (= (type (c2_post arg0@@38)) (FieldType PredicateType_c2_postType FrameTypeType))
 :qid |funType:c2_post|
 :pattern ( (c2_post arg0@@38))
))))
(assert (forall ((x@@11 T@U) ) (!  (=> (= (type x@@11) RefType) (IsPredicateField (c2_post x@@11)))
 :qid |stdinbpl.567:15|
 :skolemid |90|
 :pattern ( (c2_post x@@11))
)))
(assert  (and (= (Ctor PredicateType_c3_preType) 22) (forall ((arg0@@39 T@U) ) (! (= (type (c3_pre arg0@@39)) (FieldType PredicateType_c3_preType FrameTypeType))
 :qid |funType:c3_pre|
 :pattern ( (c3_pre arg0@@39))
))))
(assert (forall ((x@@12 T@U) ) (!  (=> (= (type x@@12) RefType) (IsPredicateField (c3_pre x@@12)))
 :qid |stdinbpl.615:15|
 :skolemid |96|
 :pattern ( (c3_pre x@@12))
)))
(assert  (and (= (Ctor PredicateType_c3_postType) 23) (forall ((arg0@@40 T@U) ) (! (= (type (c3_post arg0@@40)) (FieldType PredicateType_c3_postType FrameTypeType))
 :qid |funType:c3_post|
 :pattern ( (c3_post arg0@@40))
))))
(assert (forall ((x@@13 T@U) ) (!  (=> (= (type x@@13) RefType) (IsPredicateField (c3_post x@@13)))
 :qid |stdinbpl.663:15|
 :skolemid |102|
 :pattern ( (c3_post x@@13))
)))
(assert (forall ((Heap@@2 T@U) (x@@14 T@U) ) (!  (=> (and (= (type Heap@@2) (MapType1Type RefType)) (= (type x@@14) RefType)) (|c1_pre#everUsed| (c1_pre x@@14)))
 :qid |stdinbpl.442:15|
 :skolemid |76|
 :pattern ( (|c1_pre#trigger| Heap@@2 (c1_pre x@@14)))
)))
(assert (forall ((Heap@@3 T@U) (x@@15 T@U) ) (!  (=> (and (= (type Heap@@3) (MapType1Type RefType)) (= (type x@@15) RefType)) (|c1_post#everUsed| (c1_post x@@15)))
 :qid |stdinbpl.490:15|
 :skolemid |82|
 :pattern ( (|c1_post#trigger| Heap@@3 (c1_post x@@15)))
)))
(assert (forall ((Heap@@4 T@U) (x@@16 T@U) ) (!  (=> (and (= (type Heap@@4) (MapType1Type RefType)) (= (type x@@16) RefType)) (|c2_pre#everUsed| (c2_pre x@@16)))
 :qid |stdinbpl.538:15|
 :skolemid |88|
 :pattern ( (|c2_pre#trigger| Heap@@4 (c2_pre x@@16)))
)))
(assert (forall ((Heap@@5 T@U) (x@@17 T@U) ) (!  (=> (and (= (type Heap@@5) (MapType1Type RefType)) (= (type x@@17) RefType)) (|c2_post#everUsed| (c2_post x@@17)))
 :qid |stdinbpl.586:15|
 :skolemid |94|
 :pattern ( (|c2_post#trigger| Heap@@5 (c2_post x@@17)))
)))
(assert (forall ((Heap@@6 T@U) (x@@18 T@U) ) (!  (=> (and (= (type Heap@@6) (MapType1Type RefType)) (= (type x@@18) RefType)) (|c3_pre#everUsed| (c3_pre x@@18)))
 :qid |stdinbpl.634:15|
 :skolemid |100|
 :pattern ( (|c3_pre#trigger| Heap@@6 (c3_pre x@@18)))
)))
(assert (forall ((Heap@@7 T@U) (x@@19 T@U) ) (!  (=> (and (= (type Heap@@7) (MapType1Type RefType)) (= (type x@@19) RefType)) (|c3_post#everUsed| (c3_post x@@19)))
 :qid |stdinbpl.682:15|
 :skolemid |106|
 :pattern ( (|c3_post#trigger| Heap@@7 (c3_post x@@19)))
)))
(assert  (and (and (= (Ctor WandType_wand_2Type) 24) (forall ((arg0@@41 T@U) (arg1@@33 Real) (arg2@@25 T@U) (arg3@@17 Int) (arg4@@7 T@U) (arg5@@5 Real) ) (! (= (type (|wand_2#ft| arg0@@41 arg1@@33 arg2@@25 arg3@@17 arg4@@7 arg5@@5)) (FieldType WandType_wand_2Type FrameTypeType))
 :qid |funType:wand_2#ft|
 :pattern ( (|wand_2#ft| arg0@@41 arg1@@33 arg2@@25 arg3@@17 arg4@@7 arg5@@5))
))) (forall ((arg0@@42 T@U) (arg1@@34 Real) (arg2@@26 T@U) (arg3@@18 Int) (arg4@@8 T@U) (arg5@@6 Real) ) (! (= (type (|wand_2#sm| arg0@@42 arg1@@34 arg2@@26 arg3@@18 arg4@@8 arg5@@6)) (FieldType WandType_wand_2Type (MapType0Type RefType boolType)))
 :qid |funType:wand_2#sm|
 :pattern ( (|wand_2#sm| arg0@@42 arg1@@34 arg2@@26 arg3@@18 arg4@@8 arg5@@6))
))))
(assert (forall ((arg1@@35 T@U) (arg2@@27 Real) (arg3@@19 T@U) (arg4@@9 Int) (arg5@@7 T@U) (arg6@@5 Real) ) (!  (=> (and (and (= (type arg1@@35) RefType) (= (type arg3@@19) RefType)) (= (type arg5@@7) RefType)) (= (|wand_2#sm| arg1@@35 arg2@@27 arg3@@19 arg4@@9 arg5@@7 arg6@@5) (WandMaskField (|wand_2#ft| arg1@@35 arg2@@27 arg3@@19 arg4@@9 arg5@@7 arg6@@5))))
 :qid |stdinbpl.327:15|
 :skolemid |54|
 :pattern ( (WandMaskField (|wand_2#ft| arg1@@35 arg2@@27 arg3@@19 arg4@@9 arg5@@7 arg6@@5)))
)))
(assert (forall ((arg0@@43 Bool) (arg1@@36 Bool) (arg2@@28 Bool) ) (! (= (type (|wand_6#sm| arg0@@43 arg1@@36 arg2@@28)) (FieldType WandType_wand_6Type (MapType0Type RefType boolType)))
 :qid |funType:wand_6#sm|
 :pattern ( (|wand_6#sm| arg0@@43 arg1@@36 arg2@@28))
)))
(assert (forall ((arg1@@37 Bool) (arg2@@29 Bool) (arg3@@20 Bool) ) (! (= (|wand_6#sm| arg1@@37 arg2@@29 arg3@@20) (WandMaskField (|wand_6#ft| arg1@@37 arg2@@29 arg3@@20)))
 :qid |stdinbpl.295:15|
 :skolemid |47|
 :pattern ( (WandMaskField (|wand_6#ft| arg1@@37 arg2@@29 arg3@@20)))
)))
(assert (forall ((Heap@@8 T@U) (ExhaleHeap@@1 T@U) (Mask@@2 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@8) (MapType1Type RefType)) (= (type ExhaleHeap@@1) (MapType1Type RefType))) (= (type Mask@@2) (MapType0Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@8 ExhaleHeap@@1 Mask@@2)) (U_2_bool (MapType1Select Heap@@8 o_1 $allocated))) (U_2_bool (MapType1Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.73:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@8 ExhaleHeap@@1 Mask@@2) (MapType1Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert (forall ((x@@20 T@U) (x2 T@U) ) (!  (=> (and (and (= (type x@@20) RefType) (= (type x2) RefType)) (= (c1_pre x@@20) (c1_pre x2))) (= x@@20 x2))
 :qid |stdinbpl.433:15|
 :skolemid |74|
 :pattern ( (c1_pre x@@20) (c1_pre x2))
)))
(assert (forall ((arg0@@44 T@U) ) (! (= (type (|c1_pre#sm| arg0@@44)) (FieldType PredicateType_c1_preType (MapType0Type RefType boolType)))
 :qid |funType:c1_pre#sm|
 :pattern ( (|c1_pre#sm| arg0@@44))
)))
(assert (forall ((x@@21 T@U) (x2@@0 T@U) ) (!  (=> (and (and (= (type x@@21) RefType) (= (type x2@@0) RefType)) (= (|c1_pre#sm| x@@21) (|c1_pre#sm| x2@@0))) (= x@@21 x2@@0))
 :qid |stdinbpl.437:15|
 :skolemid |75|
 :pattern ( (|c1_pre#sm| x@@21) (|c1_pre#sm| x2@@0))
)))
(assert (forall ((x@@22 T@U) (x2@@1 T@U) ) (!  (=> (and (and (= (type x@@22) RefType) (= (type x2@@1) RefType)) (= (c1_post x@@22) (c1_post x2@@1))) (= x@@22 x2@@1))
 :qid |stdinbpl.481:15|
 :skolemid |80|
 :pattern ( (c1_post x@@22) (c1_post x2@@1))
)))
(assert (forall ((arg0@@45 T@U) ) (! (= (type (|c1_post#sm| arg0@@45)) (FieldType PredicateType_c1_postType (MapType0Type RefType boolType)))
 :qid |funType:c1_post#sm|
 :pattern ( (|c1_post#sm| arg0@@45))
)))
(assert (forall ((x@@23 T@U) (x2@@2 T@U) ) (!  (=> (and (and (= (type x@@23) RefType) (= (type x2@@2) RefType)) (= (|c1_post#sm| x@@23) (|c1_post#sm| x2@@2))) (= x@@23 x2@@2))
 :qid |stdinbpl.485:15|
 :skolemid |81|
 :pattern ( (|c1_post#sm| x@@23) (|c1_post#sm| x2@@2))
)))
(assert (forall ((x@@24 T@U) (x2@@3 T@U) ) (!  (=> (and (and (= (type x@@24) RefType) (= (type x2@@3) RefType)) (= (c2_pre x@@24) (c2_pre x2@@3))) (= x@@24 x2@@3))
 :qid |stdinbpl.529:15|
 :skolemid |86|
 :pattern ( (c2_pre x@@24) (c2_pre x2@@3))
)))
(assert (forall ((arg0@@46 T@U) ) (! (= (type (|c2_pre#sm| arg0@@46)) (FieldType PredicateType_c2_preType (MapType0Type RefType boolType)))
 :qid |funType:c2_pre#sm|
 :pattern ( (|c2_pre#sm| arg0@@46))
)))
(assert (forall ((x@@25 T@U) (x2@@4 T@U) ) (!  (=> (and (and (= (type x@@25) RefType) (= (type x2@@4) RefType)) (= (|c2_pre#sm| x@@25) (|c2_pre#sm| x2@@4))) (= x@@25 x2@@4))
 :qid |stdinbpl.533:15|
 :skolemid |87|
 :pattern ( (|c2_pre#sm| x@@25) (|c2_pre#sm| x2@@4))
)))
(assert (forall ((x@@26 T@U) (x2@@5 T@U) ) (!  (=> (and (and (= (type x@@26) RefType) (= (type x2@@5) RefType)) (= (c2_post x@@26) (c2_post x2@@5))) (= x@@26 x2@@5))
 :qid |stdinbpl.577:15|
 :skolemid |92|
 :pattern ( (c2_post x@@26) (c2_post x2@@5))
)))
(assert (forall ((arg0@@47 T@U) ) (! (= (type (|c2_post#sm| arg0@@47)) (FieldType PredicateType_c2_postType (MapType0Type RefType boolType)))
 :qid |funType:c2_post#sm|
 :pattern ( (|c2_post#sm| arg0@@47))
)))
(assert (forall ((x@@27 T@U) (x2@@6 T@U) ) (!  (=> (and (and (= (type x@@27) RefType) (= (type x2@@6) RefType)) (= (|c2_post#sm| x@@27) (|c2_post#sm| x2@@6))) (= x@@27 x2@@6))
 :qid |stdinbpl.581:15|
 :skolemid |93|
 :pattern ( (|c2_post#sm| x@@27) (|c2_post#sm| x2@@6))
)))
(assert (forall ((x@@28 T@U) (x2@@7 T@U) ) (!  (=> (and (and (= (type x@@28) RefType) (= (type x2@@7) RefType)) (= (c3_pre x@@28) (c3_pre x2@@7))) (= x@@28 x2@@7))
 :qid |stdinbpl.625:15|
 :skolemid |98|
 :pattern ( (c3_pre x@@28) (c3_pre x2@@7))
)))
(assert (forall ((arg0@@48 T@U) ) (! (= (type (|c3_pre#sm| arg0@@48)) (FieldType PredicateType_c3_preType (MapType0Type RefType boolType)))
 :qid |funType:c3_pre#sm|
 :pattern ( (|c3_pre#sm| arg0@@48))
)))
(assert (forall ((x@@29 T@U) (x2@@8 T@U) ) (!  (=> (and (and (= (type x@@29) RefType) (= (type x2@@8) RefType)) (= (|c3_pre#sm| x@@29) (|c3_pre#sm| x2@@8))) (= x@@29 x2@@8))
 :qid |stdinbpl.629:15|
 :skolemid |99|
 :pattern ( (|c3_pre#sm| x@@29) (|c3_pre#sm| x2@@8))
)))
(assert (forall ((x@@30 T@U) (x2@@9 T@U) ) (!  (=> (and (and (= (type x@@30) RefType) (= (type x2@@9) RefType)) (= (c3_post x@@30) (c3_post x2@@9))) (= x@@30 x2@@9))
 :qid |stdinbpl.673:15|
 :skolemid |104|
 :pattern ( (c3_post x@@30) (c3_post x2@@9))
)))
(assert (forall ((arg0@@49 T@U) ) (! (= (type (|c3_post#sm| arg0@@49)) (FieldType PredicateType_c3_postType (MapType0Type RefType boolType)))
 :qid |funType:c3_post#sm|
 :pattern ( (|c3_post#sm| arg0@@49))
)))
(assert (forall ((x@@31 T@U) (x2@@10 T@U) ) (!  (=> (and (and (= (type x@@31) RefType) (= (type x2@@10) RefType)) (= (|c3_post#sm| x@@31) (|c3_post#sm| x2@@10))) (= x@@31 x2@@10))
 :qid |stdinbpl.677:15|
 :skolemid |105|
 :pattern ( (|c3_post#sm| x@@31) (|c3_post#sm| x2@@10))
)))
(assert (forall ((arg0@@50 T@U) (arg1@@38 Real) (arg2@@30 T@U) (arg3@@21 Int) (arg4@@10 T@U) (arg5@@8 Real) (arg6@@6 T@U) (arg7@@5 Int) ) (! (= (type (wand_3 arg0@@50 arg1@@38 arg2@@30 arg3@@21 arg4@@10 arg5@@8 arg6@@6 arg7@@5)) (FieldType WandType_wand_3Type intType))
 :qid |funType:wand_3|
 :pattern ( (wand_3 arg0@@50 arg1@@38 arg2@@30 arg3@@21 arg4@@10 arg5@@8 arg6@@6 arg7@@5))
)))
(assert (forall ((arg1@@39 T@U) (arg2@@31 Real) (arg3@@22 T@U) (arg4@@11 Int) (arg5@@9 T@U) (arg6@@7 Real) (arg7@@6 T@U) (arg8@@1 Int) ) (!  (=> (and (and (and (= (type arg1@@39) RefType) (= (type arg3@@22) RefType)) (= (type arg5@@9) RefType)) (= (type arg7@@6) RefType)) (IsWandField (wand_3 arg1@@39 arg2@@31 arg3@@22 arg4@@11 arg5@@9 arg6@@7 arg7@@6 arg8@@1)))
 :qid |stdinbpl.183:15|
 :skolemid |22|
 :pattern ( (wand_3 arg1@@39 arg2@@31 arg3@@22 arg4@@11 arg5@@9 arg6@@7 arg7@@6 arg8@@1))
)))
(assert (forall ((arg1@@40 T@U) (arg2@@32 Real) (arg3@@23 T@U) (arg4@@12 Int) (arg5@@10 T@U) (arg6@@8 Real) (arg7@@7 T@U) (arg8@@2 Int) ) (!  (=> (and (and (and (= (type arg1@@40) RefType) (= (type arg3@@23) RefType)) (= (type arg5@@10) RefType)) (= (type arg7@@7) RefType)) (IsWandField (|wand_3#ft| arg1@@40 arg2@@32 arg3@@23 arg4@@12 arg5@@10 arg6@@8 arg7@@7 arg8@@2)))
 :qid |stdinbpl.187:15|
 :skolemid |23|
 :pattern ( (|wand_3#ft| arg1@@40 arg2@@32 arg3@@23 arg4@@12 arg5@@10 arg6@@8 arg7@@7 arg8@@2))
)))
(assert (forall ((arg0@@51 T@U) (arg1@@41 Real) (arg2@@33 T@U) (arg3@@24 Real) (arg4@@13 T@U) (arg5@@11 Real) (arg6@@9 T@U) (arg7@@8 Real) ) (! (= (type (wand_4 arg0@@51 arg1@@41 arg2@@33 arg3@@24 arg4@@13 arg5@@11 arg6@@9 arg7@@8)) (FieldType WandType_wand_4Type intType))
 :qid |funType:wand_4|
 :pattern ( (wand_4 arg0@@51 arg1@@41 arg2@@33 arg3@@24 arg4@@13 arg5@@11 arg6@@9 arg7@@8))
)))
(assert (forall ((arg1@@42 T@U) (arg2@@34 Real) (arg3@@25 T@U) (arg4@@14 Real) (arg5@@12 T@U) (arg6@@10 Real) (arg7@@9 T@U) (arg8@@3 Real) ) (!  (=> (and (and (and (= (type arg1@@42) RefType) (= (type arg3@@25) RefType)) (= (type arg5@@12) RefType)) (= (type arg7@@9) RefType)) (IsWandField (wand_4 arg1@@42 arg2@@34 arg3@@25 arg4@@14 arg5@@12 arg6@@10 arg7@@9 arg8@@3)))
 :qid |stdinbpl.247:15|
 :skolemid |36|
 :pattern ( (wand_4 arg1@@42 arg2@@34 arg3@@25 arg4@@14 arg5@@12 arg6@@10 arg7@@9 arg8@@3))
)))
(assert (forall ((arg1@@43 T@U) (arg2@@35 Real) (arg3@@26 T@U) (arg4@@15 Real) (arg5@@13 T@U) (arg6@@11 Real) (arg7@@10 T@U) (arg8@@4 Real) ) (!  (=> (and (and (and (= (type arg1@@43) RefType) (= (type arg3@@26) RefType)) (= (type arg5@@13) RefType)) (= (type arg7@@10) RefType)) (IsWandField (|wand_4#ft| arg1@@43 arg2@@35 arg3@@26 arg4@@15 arg5@@13 arg6@@11 arg7@@10 arg8@@4)))
 :qid |stdinbpl.251:15|
 :skolemid |37|
 :pattern ( (|wand_4#ft| arg1@@43 arg2@@35 arg3@@26 arg4@@15 arg5@@13 arg6@@11 arg7@@10 arg8@@4))
)))
(assert (forall ((Heap@@9 T@U) (ExhaleHeap@@2 T@U) (Mask@@3 T@U) (o_1@@0 T@U) (f_2 T@U) ) (! (let ((B@@1 (FieldTypeInv1 (type f_2))))
(let ((A@@1 (FieldTypeInv0 (type f_2))))
 (=> (and (and (and (and (and (and (= (type Heap@@9) (MapType1Type RefType)) (= (type ExhaleHeap@@2) (MapType1Type RefType))) (= (type Mask@@3) (MapType0Type RefType realType))) (= (type o_1@@0) RefType)) (= (type f_2) (FieldType A@@1 B@@1))) (IdenticalOnKnownLocations Heap@@9 ExhaleHeap@@2 Mask@@3)) (HasDirectPerm Mask@@3 o_1@@0 f_2)) (= (MapType1Select Heap@@9 o_1@@0 f_2) (MapType1Select ExhaleHeap@@2 o_1@@0 f_2)))))
 :qid |stdinbpl.42:22|
 :skolemid |1|
 :pattern ( (IdenticalOnKnownLocations Heap@@9 ExhaleHeap@@2 Mask@@3) (MapType1Select ExhaleHeap@@2 o_1@@0 f_2))
)))
(assert (forall ((arg1@@44 T@U) (arg2@@36 Real) (arg3@@27 T@U) (arg4@@16 Int) (arg5@@14 T@U) (arg6@@12 Real) (arg7@@11 T@U) (arg8@@5 Int) ) (!  (=> (and (and (and (= (type arg1@@44) RefType) (= (type arg3@@27) RefType)) (= (type arg5@@14) RefType)) (= (type arg7@@11) RefType)) (not (IsPredicateField (wand_3 arg1@@44 arg2@@36 arg3@@27 arg4@@16 arg5@@14 arg6@@12 arg7@@11 arg8@@5))))
 :qid |stdinbpl.191:15|
 :skolemid |24|
 :pattern ( (wand_3 arg1@@44 arg2@@36 arg3@@27 arg4@@16 arg5@@14 arg6@@12 arg7@@11 arg8@@5))
)))
(assert (forall ((arg1@@45 T@U) (arg2@@37 Real) (arg3@@28 T@U) (arg4@@17 Int) (arg5@@15 T@U) (arg6@@13 Real) (arg7@@12 T@U) (arg8@@6 Int) ) (!  (=> (and (and (and (= (type arg1@@45) RefType) (= (type arg3@@28) RefType)) (= (type arg5@@15) RefType)) (= (type arg7@@12) RefType)) (not (IsPredicateField (|wand_3#ft| arg1@@45 arg2@@37 arg3@@28 arg4@@17 arg5@@15 arg6@@13 arg7@@12 arg8@@6))))
 :qid |stdinbpl.195:15|
 :skolemid |25|
 :pattern ( (|wand_3#ft| arg1@@45 arg2@@37 arg3@@28 arg4@@17 arg5@@15 arg6@@13 arg7@@12 arg8@@6))
)))
(assert (forall ((arg1@@46 T@U) (arg2@@38 Real) (arg3@@29 T@U) (arg4@@18 Real) (arg5@@16 T@U) (arg6@@14 Real) (arg7@@13 T@U) (arg8@@7 Real) ) (!  (=> (and (and (and (= (type arg1@@46) RefType) (= (type arg3@@29) RefType)) (= (type arg5@@16) RefType)) (= (type arg7@@13) RefType)) (not (IsPredicateField (wand_4 arg1@@46 arg2@@38 arg3@@29 arg4@@18 arg5@@16 arg6@@14 arg7@@13 arg8@@7))))
 :qid |stdinbpl.255:15|
 :skolemid |38|
 :pattern ( (wand_4 arg1@@46 arg2@@38 arg3@@29 arg4@@18 arg5@@16 arg6@@14 arg7@@13 arg8@@7))
)))
(assert (forall ((arg1@@47 T@U) (arg2@@39 Real) (arg3@@30 T@U) (arg4@@19 Real) (arg5@@17 T@U) (arg6@@15 Real) (arg7@@14 T@U) (arg8@@8 Real) ) (!  (=> (and (and (and (= (type arg1@@47) RefType) (= (type arg3@@30) RefType)) (= (type arg5@@17) RefType)) (= (type arg7@@14) RefType)) (not (IsPredicateField (|wand_4#ft| arg1@@47 arg2@@39 arg3@@30 arg4@@19 arg5@@17 arg6@@15 arg7@@14 arg8@@8))))
 :qid |stdinbpl.259:15|
 :skolemid |39|
 :pattern ( (|wand_4#ft| arg1@@47 arg2@@39 arg3@@30 arg4@@19 arg5@@17 arg6@@15 arg7@@14 arg8@@8))
)))
(assert  (and (= (type dummyHeap) (MapType1Type RefType)) (= (type ZeroMask) (MapType0Type RefType realType))))
(assert (state dummyHeap ZeroMask))
(assert (forall ((p T@U) (v_1 T@U) (w T@U) ) (! (let ((A@@2 (FieldTypeInv0 (type p))))
 (=> (and (and (= (type p) (FieldType A@@2 FrameTypeType)) (= (type v_1) FrameTypeType)) (= (type w) FrameTypeType)) (not (InsidePredicate p v_1 p w))))
 :qid |stdinbpl.170:19|
 :skolemid |21|
 :pattern ( (InsidePredicate p v_1 p w))
)))
(assert  (not (IsPredicateField f_7)))
(assert  (not (IsWandField f_7)))
(assert (forall ((Heap@@10 T@U) (ExhaleHeap@@3 T@U) (Mask@@4 T@U) ) (!  (=> (and (and (and (= (type Heap@@10) (MapType1Type RefType)) (= (type ExhaleHeap@@3) (MapType1Type RefType))) (= (type Mask@@4) (MapType0Type RefType realType))) (IdenticalOnKnownLocations Heap@@10 ExhaleHeap@@3 Mask@@4)) (succHeap Heap@@10 ExhaleHeap@@3))
 :qid |stdinbpl.83:15|
 :skolemid |10|
 :pattern ( (IdenticalOnKnownLocations Heap@@10 ExhaleHeap@@3 Mask@@4))
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
(assert (forall ((arg1@@48 T@U) (arg2@@40 Real) (arg3@@31 T@U) (arg4@@20 Real) ) (!  (=> (and (= (type arg1@@48) RefType) (= (type arg3@@31) RefType)) (IsWandField (wand_1 arg1@@48 arg2@@40 arg3@@31 arg4@@20)))
 :qid |stdinbpl.215:15|
 :skolemid |29|
 :pattern ( (wand_1 arg1@@48 arg2@@40 arg3@@31 arg4@@20))
)))
(assert (forall ((arg0@@52 T@U) (arg1@@49 Real) (arg2@@41 T@U) (arg3@@32 Real) ) (! (= (type (|wand_1#ft| arg0@@52 arg1@@49 arg2@@41 arg3@@32)) (FieldType WandType_wand_1Type FrameTypeType))
 :qid |funType:wand_1#ft|
 :pattern ( (|wand_1#ft| arg0@@52 arg1@@49 arg2@@41 arg3@@32))
)))
(assert (forall ((arg1@@50 T@U) (arg2@@42 Real) (arg3@@33 T@U) (arg4@@21 Real) ) (!  (=> (and (= (type arg1@@50) RefType) (= (type arg3@@33) RefType)) (IsWandField (|wand_1#ft| arg1@@50 arg2@@42 arg3@@33 arg4@@21)))
 :qid |stdinbpl.219:15|
 :skolemid |30|
 :pattern ( (|wand_1#ft| arg1@@50 arg2@@42 arg3@@33 arg4@@21))
)))
(assert (forall ((arg1@@51 T@U) (arg2@@43 Real) (arg3@@34 T@U) (arg4@@22 Real) ) (!  (=> (and (= (type arg1@@51) RefType) (= (type arg3@@34) RefType)) (IsWandField (wand arg1@@51 arg2@@43 arg3@@34 arg4@@22)))
 :qid |stdinbpl.375:15|
 :skolemid |64|
 :pattern ( (wand arg1@@51 arg2@@43 arg3@@34 arg4@@22))
)))
(assert (forall ((arg0@@53 T@U) (arg1@@52 Real) (arg2@@44 T@U) (arg3@@35 Real) ) (! (= (type (|wand#ft| arg0@@53 arg1@@52 arg2@@44 arg3@@35)) (FieldType WandType_wandType FrameTypeType))
 :qid |funType:wand#ft|
 :pattern ( (|wand#ft| arg0@@53 arg1@@52 arg2@@44 arg3@@35))
)))
(assert (forall ((arg1@@53 T@U) (arg2@@45 Real) (arg3@@36 T@U) (arg4@@23 Real) ) (!  (=> (and (= (type arg1@@53) RefType) (= (type arg3@@36) RefType)) (IsWandField (|wand#ft| arg1@@53 arg2@@45 arg3@@36 arg4@@23)))
 :qid |stdinbpl.379:15|
 :skolemid |65|
 :pattern ( (|wand#ft| arg1@@53 arg2@@45 arg3@@36 arg4@@23))
)))
(assert (forall ((arg0@@54 T@U) (arg1@@54 Real) (arg2@@46 T@U) (arg3@@37 Int) (arg4@@24 T@U) (arg5@@18 Real) ) (! (= (type (wand_2 arg0@@54 arg1@@54 arg2@@46 arg3@@37 arg4@@24 arg5@@18)) (FieldType WandType_wand_2Type intType))
 :qid |funType:wand_2|
 :pattern ( (wand_2 arg0@@54 arg1@@54 arg2@@46 arg3@@37 arg4@@24 arg5@@18))
)))
(assert (forall ((arg1@@55 T@U) (arg2@@47 Real) (arg3@@38 T@U) (arg4@@25 Int) (arg5@@19 T@U) (arg6@@16 Real) (arg1_2@@0 T@U) (arg2_2@@0 Real) (arg3_2@@0 T@U) (arg4_2 Int) (arg5_2 T@U) (arg6_2 Real) ) (!  (=> (and (and (and (and (and (and (= (type arg1@@55) RefType) (= (type arg3@@38) RefType)) (= (type arg5@@19) RefType)) (= (type arg1_2@@0) RefType)) (= (type arg3_2@@0) RefType)) (= (type arg5_2) RefType)) (= (wand_2 arg1@@55 arg2@@47 arg3@@38 arg4@@25 arg5@@19 arg6@@16) (wand_2 arg1_2@@0 arg2_2@@0 arg3_2@@0 arg4_2 arg5_2 arg6_2))) (and (= arg1@@55 arg1_2@@0) (and (= arg2@@47 arg2_2@@0) (and (= arg3@@38 arg3_2@@0) (and (= arg4@@25 arg4_2) (and (= arg5@@19 arg5_2) (= arg6@@16 arg6_2)))))))
 :qid |stdinbpl.335:15|
 :skolemid |56|
 :pattern ( (wand_2 arg1@@55 arg2@@47 arg3@@38 arg4@@25 arg5@@19 arg6@@16) (wand_2 arg1_2@@0 arg2_2@@0 arg3_2@@0 arg4_2 arg5_2 arg6_2))
)))
(assert  (and (forall ((arg0@@55 Real) (arg1@@56 T@U) ) (! (= (type (ConditionalFrame arg0@@55 arg1@@56)) FrameTypeType)
 :qid |funType:ConditionalFrame|
 :pattern ( (ConditionalFrame arg0@@55 arg1@@56))
)) (= (type EmptyFrame) FrameTypeType)))
(assert (forall ((p@@0 Real) (f_6 T@U) ) (!  (=> (= (type f_6) FrameTypeType) (= (ConditionalFrame p@@0 f_6) (ite (> p@@0 0.0) f_6 EmptyFrame)))
 :qid |stdinbpl.158:15|
 :skolemid |19|
 :pattern ( (ConditionalFrame p@@0 f_6))
)))
(assert (forall ((arg1@@57 T@U) (arg2@@48 Real) (arg3@@39 T@U) (arg4@@26 Real) ) (!  (=> (and (= (type arg1@@57) RefType) (= (type arg3@@39) RefType)) (not (IsPredicateField (wand_1 arg1@@57 arg2@@48 arg3@@39 arg4@@26))))
 :qid |stdinbpl.223:15|
 :skolemid |31|
 :pattern ( (wand_1 arg1@@57 arg2@@48 arg3@@39 arg4@@26))
)))
(assert (forall ((arg1@@58 T@U) (arg2@@49 Real) (arg3@@40 T@U) (arg4@@27 Real) ) (!  (=> (and (= (type arg1@@58) RefType) (= (type arg3@@40) RefType)) (not (IsPredicateField (|wand_1#ft| arg1@@58 arg2@@49 arg3@@40 arg4@@27))))
 :qid |stdinbpl.227:15|
 :skolemid |32|
 :pattern ( (|wand_1#ft| arg1@@58 arg2@@49 arg3@@40 arg4@@27))
)))
(assert (forall ((arg1@@59 T@U) (arg2@@50 Real) (arg3@@41 T@U) (arg4@@28 Real) ) (!  (=> (and (= (type arg1@@59) RefType) (= (type arg3@@41) RefType)) (not (IsPredicateField (wand arg1@@59 arg2@@50 arg3@@41 arg4@@28))))
 :qid |stdinbpl.383:15|
 :skolemid |66|
 :pattern ( (wand arg1@@59 arg2@@50 arg3@@41 arg4@@28))
)))
(assert (forall ((arg1@@60 T@U) (arg2@@51 Real) (arg3@@42 T@U) (arg4@@29 Real) ) (!  (=> (and (= (type arg1@@60) RefType) (= (type arg3@@42) RefType)) (not (IsPredicateField (|wand#ft| arg1@@60 arg2@@51 arg3@@42 arg4@@29))))
 :qid |stdinbpl.387:15|
 :skolemid |67|
 :pattern ( (|wand#ft| arg1@@60 arg2@@51 arg3@@42 arg4@@29))
)))
(assert (forall ((Mask@@5 T@U) (o_2@@0 T@U) (f_4@@0 T@U) ) (! (let ((B@@3 (FieldTypeInv1 (type f_4@@0))))
(let ((A@@4 (FieldTypeInv0 (type f_4@@0))))
 (=> (and (and (= (type Mask@@5) (MapType0Type RefType realType)) (= (type o_2@@0) RefType)) (= (type f_4@@0) (FieldType A@@4 B@@3))) (= (HasDirectPerm Mask@@5 o_2@@0 f_4@@0) (> (U_2_real (MapType0Select Mask@@5 o_2@@0 f_4@@0)) NoPerm)))))
 :qid |stdinbpl.133:22|
 :skolemid |17|
 :pattern ( (HasDirectPerm Mask@@5 o_2@@0 f_4@@0))
)))
(assert (forall ((arg0@@56 T@U) (arg1@@61 Real) (arg2@@52 T@U) (arg3@@43 Real) ) (! (= (type (|wand_1#sm| arg0@@56 arg1@@61 arg2@@52 arg3@@43)) (FieldType WandType_wand_1Type (MapType0Type RefType boolType)))
 :qid |funType:wand_1#sm|
 :pattern ( (|wand_1#sm| arg0@@56 arg1@@61 arg2@@52 arg3@@43))
)))
(assert (forall ((arg1@@62 T@U) (arg2@@53 Real) (arg3@@44 T@U) (arg4@@30 Real) ) (!  (=> (and (= (type arg1@@62) RefType) (= (type arg3@@44) RefType)) (= (|wand_1#sm| arg1@@62 arg2@@53 arg3@@44 arg4@@30) (WandMaskField (|wand_1#ft| arg1@@62 arg2@@53 arg3@@44 arg4@@30))))
 :qid |stdinbpl.231:15|
 :skolemid |33|
 :pattern ( (WandMaskField (|wand_1#ft| arg1@@62 arg2@@53 arg3@@44 arg4@@30)))
)))
(assert (forall ((arg0@@57 T@U) (arg1@@63 Real) (arg2@@54 T@U) (arg3@@45 Real) ) (! (= (type (|wand#sm| arg0@@57 arg1@@63 arg2@@54 arg3@@45)) (FieldType WandType_wandType (MapType0Type RefType boolType)))
 :qid |funType:wand#sm|
 :pattern ( (|wand#sm| arg0@@57 arg1@@63 arg2@@54 arg3@@45))
)))
(assert (forall ((arg1@@64 T@U) (arg2@@55 Real) (arg3@@46 T@U) (arg4@@31 Real) ) (!  (=> (and (= (type arg1@@64) RefType) (= (type arg3@@46) RefType)) (= (|wand#sm| arg1@@64 arg2@@55 arg3@@46 arg4@@31) (WandMaskField (|wand#ft| arg1@@64 arg2@@55 arg3@@46 arg4@@31))))
 :qid |stdinbpl.391:15|
 :skolemid |68|
 :pattern ( (WandMaskField (|wand#ft| arg1@@64 arg2@@55 arg3@@46 arg4@@31)))
)))
(assert (forall ((arg1@@65 T@U) (arg2@@56 Real) (arg3@@47 T@U) (arg4@@32 Int) (arg5@@20 T@U) (arg6@@17 Real) ) (!  (=> (and (and (= (type arg1@@65) RefType) (= (type arg3@@47) RefType)) (= (type arg5@@20) RefType)) (= (getPredWandId (wand_2 arg1@@65 arg2@@56 arg3@@47 arg4@@32 arg5@@20 arg6@@17)) 10))
 :qid |stdinbpl.331:15|
 :skolemid |55|
 :pattern ( (wand_2 arg1@@65 arg2@@56 arg3@@47 arg4@@32 arg5@@20 arg6@@17))
)))
(assert (forall ((o_2@@1 T@U) (f_4@@1 T@U) ) (! (let ((B@@4 (FieldTypeInv1 (type f_4@@1))))
(let ((A@@5 (FieldTypeInv0 (type f_4@@1))))
 (=> (and (= (type o_2@@1) RefType) (= (type f_4@@1) (FieldType A@@5 B@@4))) (= (U_2_real (MapType0Select ZeroMask o_2@@1 f_4@@1)) NoPerm))))
 :qid |stdinbpl.106:22|
 :skolemid |13|
 :pattern ( (MapType0Select ZeroMask o_2@@1 f_4@@1))
)))
(assert (forall ((arg1@@66 T@U) (arg2@@57 Real) (arg3@@48 T@U) (arg4@@33 Int) (arg5@@21 T@U) (arg6@@18 Real) (arg7@@15 T@U) (arg8@@9 Int) (arg1_2@@1 T@U) (arg2_2@@1 Real) (arg3_2@@1 T@U) (arg4_2@@0 Int) (arg5_2@@0 T@U) (arg6_2@@0 Real) (arg7_2 T@U) (arg8_2 Int) ) (!  (=> (and (and (and (and (and (and (and (and (= (type arg1@@66) RefType) (= (type arg3@@48) RefType)) (= (type arg5@@21) RefType)) (= (type arg7@@15) RefType)) (= (type arg1_2@@1) RefType)) (= (type arg3_2@@1) RefType)) (= (type arg5_2@@0) RefType)) (= (type arg7_2) RefType)) (= (wand_3 arg1@@66 arg2@@57 arg3@@48 arg4@@33 arg5@@21 arg6@@18 arg7@@15 arg8@@9) (wand_3 arg1_2@@1 arg2_2@@1 arg3_2@@1 arg4_2@@0 arg5_2@@0 arg6_2@@0 arg7_2 arg8_2))) (and (= arg1@@66 arg1_2@@1) (and (= arg2@@57 arg2_2@@1) (and (= arg3@@48 arg3_2@@1) (and (= arg4@@33 arg4_2@@0) (and (= arg5@@21 arg5_2@@0) (and (= arg6@@18 arg6_2@@0) (and (= arg7@@15 arg7_2) (= arg8@@9 arg8_2)))))))))
 :qid |stdinbpl.207:15|
 :skolemid |28|
 :pattern ( (wand_3 arg1@@66 arg2@@57 arg3@@48 arg4@@33 arg5@@21 arg6@@18 arg7@@15 arg8@@9) (wand_3 arg1_2@@1 arg2_2@@1 arg3_2@@1 arg4_2@@0 arg5_2@@0 arg6_2@@0 arg7_2 arg8_2))
)))
(assert (forall ((arg1@@67 T@U) (arg2@@58 Real) (arg3@@49 T@U) (arg4@@34 Real) (arg5@@22 T@U) (arg6@@19 Real) (arg7@@16 T@U) (arg8@@10 Real) (arg1_2@@2 T@U) (arg2_2@@2 Real) (arg3_2@@2 T@U) (arg4_2@@1 Real) (arg5_2@@1 T@U) (arg6_2@@1 Real) (arg7_2@@0 T@U) (arg8_2@@0 Real) ) (!  (=> (and (and (and (and (and (and (and (and (= (type arg1@@67) RefType) (= (type arg3@@49) RefType)) (= (type arg5@@22) RefType)) (= (type arg7@@16) RefType)) (= (type arg1_2@@2) RefType)) (= (type arg3_2@@2) RefType)) (= (type arg5_2@@1) RefType)) (= (type arg7_2@@0) RefType)) (= (wand_4 arg1@@67 arg2@@58 arg3@@49 arg4@@34 arg5@@22 arg6@@19 arg7@@16 arg8@@10) (wand_4 arg1_2@@2 arg2_2@@2 arg3_2@@2 arg4_2@@1 arg5_2@@1 arg6_2@@1 arg7_2@@0 arg8_2@@0))) (and (= arg1@@67 arg1_2@@2) (and (= arg2@@58 arg2_2@@2) (and (= arg3@@49 arg3_2@@2) (and (= arg4@@34 arg4_2@@1) (and (= arg5@@22 arg5_2@@1) (and (= arg6@@19 arg6_2@@1) (and (= arg7@@16 arg7_2@@0) (= arg8@@10 arg8_2@@0)))))))))
 :qid |stdinbpl.271:15|
 :skolemid |42|
 :pattern ( (wand_4 arg1@@67 arg2@@58 arg3@@49 arg4@@34 arg5@@22 arg6@@19 arg7@@16 arg8@@10) (wand_4 arg1_2@@2 arg2_2@@2 arg3_2@@2 arg4_2@@1 arg5_2@@1 arg6_2@@1 arg7_2@@0 arg8_2@@0))
)))
(assert (forall ((arg1@@68 T@U) (arg2@@59 Real) (arg3@@50 T@U) (arg4@@35 Int) (arg5@@23 T@U) (arg6@@20 Real) ) (!  (=> (and (and (= (type arg1@@68) RefType) (= (type arg3@@50) RefType)) (= (type arg5@@23) RefType)) (IsWandField (wand_2 arg1@@68 arg2@@59 arg3@@50 arg4@@35 arg5@@23 arg6@@20)))
 :qid |stdinbpl.311:15|
 :skolemid |50|
 :pattern ( (wand_2 arg1@@68 arg2@@59 arg3@@50 arg4@@35 arg5@@23 arg6@@20))
)))
(assert (forall ((arg1@@69 T@U) (arg2@@60 Real) (arg3@@51 T@U) (arg4@@36 Int) (arg5@@24 T@U) (arg6@@21 Real) ) (!  (=> (and (and (= (type arg1@@69) RefType) (= (type arg3@@51) RefType)) (= (type arg5@@24) RefType)) (IsWandField (|wand_2#ft| arg1@@69 arg2@@60 arg3@@51 arg4@@36 arg5@@24 arg6@@21)))
 :qid |stdinbpl.315:15|
 :skolemid |51|
 :pattern ( (|wand_2#ft| arg1@@69 arg2@@60 arg3@@51 arg4@@36 arg5@@24 arg6@@21))
)))
(assert (forall ((arg1@@70 T@U) (arg2@@61 Real) (arg3@@52 T@U) (arg4@@37 Int) (arg5@@25 T@U) (arg6@@22 Real) ) (!  (=> (and (and (= (type arg1@@70) RefType) (= (type arg3@@52) RefType)) (= (type arg5@@25) RefType)) (not (IsPredicateField (wand_2 arg1@@70 arg2@@61 arg3@@52 arg4@@37 arg5@@25 arg6@@22))))
 :qid |stdinbpl.319:15|
 :skolemid |52|
 :pattern ( (wand_2 arg1@@70 arg2@@61 arg3@@52 arg4@@37 arg5@@25 arg6@@22))
)))
(assert (forall ((arg1@@71 T@U) (arg2@@62 Real) (arg3@@53 T@U) (arg4@@38 Int) (arg5@@26 T@U) (arg6@@23 Real) ) (!  (=> (and (and (= (type arg1@@71) RefType) (= (type arg3@@53) RefType)) (= (type arg5@@26) RefType)) (not (IsPredicateField (|wand_2#ft| arg1@@71 arg2@@62 arg3@@53 arg4@@38 arg5@@26 arg6@@23))))
 :qid |stdinbpl.323:15|
 :skolemid |53|
 :pattern ( (|wand_2#ft| arg1@@71 arg2@@62 arg3@@53 arg4@@38 arg5@@26 arg6@@23))
)))
(assert (forall ((arg1@@72 Bool) (arg2@@63 Bool) (arg1_2@@3 Bool) (arg2_2@@3 Bool) ) (!  (=> (= (wand_5 arg1@@72 arg2@@63) (wand_5 arg1_2@@3 arg2_2@@3)) (and (= arg1@@72 arg1_2@@3) (= arg2@@63 arg2_2@@3)))
 :qid |stdinbpl.367:15|
 :skolemid |63|
 :pattern ( (wand_5 arg1@@72 arg2@@63) (wand_5 arg1_2@@3 arg2_2@@3))
)))
(assert (forall ((arg1@@73 T@U) (arg2@@64 Real) (arg3@@54 T@U) (arg4@@39 Int) (arg5@@27 T@U) (arg6@@24 Real) (arg7@@17 T@U) (arg8@@11 Int) ) (!  (=> (and (and (and (= (type arg1@@73) RefType) (= (type arg3@@54) RefType)) (= (type arg5@@27) RefType)) (= (type arg7@@17) RefType)) (= (getPredWandId (wand_3 arg1@@73 arg2@@64 arg3@@54 arg4@@39 arg5@@27 arg6@@24 arg7@@17 arg8@@11)) 6))
 :qid |stdinbpl.203:15|
 :skolemid |27|
 :pattern ( (wand_3 arg1@@73 arg2@@64 arg3@@54 arg4@@39 arg5@@27 arg6@@24 arg7@@17 arg8@@11))
)))
(assert (forall ((arg1@@74 T@U) (arg2@@65 Real) (arg3@@55 T@U) (arg4@@40 Real) (arg5@@28 T@U) (arg6@@25 Real) (arg7@@18 T@U) (arg8@@12 Real) ) (!  (=> (and (and (and (= (type arg1@@74) RefType) (= (type arg3@@55) RefType)) (= (type arg5@@28) RefType)) (= (type arg7@@18) RefType)) (= (getPredWandId (wand_4 arg1@@74 arg2@@65 arg3@@55 arg4@@40 arg5@@28 arg6@@25 arg7@@18 arg8@@12)) 8))
 :qid |stdinbpl.267:15|
 :skolemid |41|
 :pattern ( (wand_4 arg1@@74 arg2@@65 arg3@@55 arg4@@40 arg5@@28 arg6@@25 arg7@@18 arg8@@12))
)))
(assert (forall ((arg1@@75 Bool) (arg2@@66 Bool) ) (! (= (getPredWandId (wand_5 arg1@@75 arg2@@66)) 11)
 :qid |stdinbpl.363:15|
 :skolemid |62|
 :pattern ( (wand_5 arg1@@75 arg2@@66))
)))
(assert (forall ((Heap@@11 T@U) (ExhaleHeap@@4 T@U) (Mask@@6 T@U) (pm_f@@1 T@U) ) (! (let ((C@@1 (FieldTypeInv0 (type pm_f@@1))))
 (=> (and (and (and (and (and (= (type Heap@@11) (MapType1Type RefType)) (= (type ExhaleHeap@@4) (MapType1Type RefType))) (= (type Mask@@6) (MapType0Type RefType realType))) (= (type pm_f@@1) (FieldType C@@1 FrameTypeType))) (IdenticalOnKnownLocations Heap@@11 ExhaleHeap@@4 Mask@@6)) (and (HasDirectPerm Mask@@6 null pm_f@@1) (IsPredicateField pm_f@@1))) (forall ((o2 T@U) (f_2@@0 T@U) ) (! (let ((B@@5 (FieldTypeInv1 (type f_2@@0))))
(let ((A@@6 (FieldTypeInv0 (type f_2@@0))))
 (=> (and (and (= (type o2) RefType) (= (type f_2@@0) (FieldType A@@6 B@@5))) (U_2_bool (MapType0Select (MapType1Select Heap@@11 null (PredicateMaskField pm_f@@1)) o2 f_2@@0))) (= (MapType1Select Heap@@11 o2 f_2@@0) (MapType1Select ExhaleHeap@@4 o2 f_2@@0)))))
 :qid |stdinbpl.54:134|
 :skolemid |3|
 :pattern ( (MapType1Select ExhaleHeap@@4 o2 f_2@@0))
))))
 :qid |stdinbpl.52:19|
 :skolemid |4|
 :pattern ( (IdenticalOnKnownLocations Heap@@11 ExhaleHeap@@4 Mask@@6) (IsPredicateField pm_f@@1))
)))
(assert (forall ((Heap@@12 T@U) (ExhaleHeap@@5 T@U) (Mask@@7 T@U) (pm_f@@2 T@U) ) (! (let ((C@@2 (FieldTypeInv0 (type pm_f@@2))))
 (=> (and (and (and (and (and (= (type Heap@@12) (MapType1Type RefType)) (= (type ExhaleHeap@@5) (MapType1Type RefType))) (= (type Mask@@7) (MapType0Type RefType realType))) (= (type pm_f@@2) (FieldType C@@2 FrameTypeType))) (IdenticalOnKnownLocations Heap@@12 ExhaleHeap@@5 Mask@@7)) (and (HasDirectPerm Mask@@7 null pm_f@@2) (IsWandField pm_f@@2))) (forall ((o2@@0 T@U) (f_2@@1 T@U) ) (! (let ((B@@6 (FieldTypeInv1 (type f_2@@1))))
(let ((A@@7 (FieldTypeInv0 (type f_2@@1))))
 (=> (and (and (= (type o2@@0) RefType) (= (type f_2@@1) (FieldType A@@7 B@@6))) (U_2_bool (MapType0Select (MapType1Select Heap@@12 null (WandMaskField pm_f@@2)) o2@@0 f_2@@1))) (= (MapType1Select Heap@@12 o2@@0 f_2@@1) (MapType1Select ExhaleHeap@@5 o2@@0 f_2@@1)))))
 :qid |stdinbpl.67:129|
 :skolemid |6|
 :pattern ( (MapType1Select ExhaleHeap@@5 o2@@0 f_2@@1))
))))
 :qid |stdinbpl.65:19|
 :skolemid |7|
 :pattern ( (IdenticalOnKnownLocations Heap@@12 ExhaleHeap@@5 Mask@@7) (IsWandField pm_f@@2))
)))
(assert (forall ((x@@32 T@U) ) (!  (=> (= (type x@@32) RefType) (= (getPredWandId (c1_pre x@@32)) 0))
 :qid |stdinbpl.427:15|
 :skolemid |73|
 :pattern ( (c1_pre x@@32))
)))
(assert (forall ((x@@33 T@U) ) (!  (=> (= (type x@@33) RefType) (= (getPredWandId (c1_post x@@33)) 1))
 :qid |stdinbpl.475:15|
 :skolemid |79|
 :pattern ( (c1_post x@@33))
)))
(assert (forall ((x@@34 T@U) ) (!  (=> (= (type x@@34) RefType) (= (getPredWandId (c2_pre x@@34)) 2))
 :qid |stdinbpl.523:15|
 :skolemid |85|
 :pattern ( (c2_pre x@@34))
)))
(assert (forall ((x@@35 T@U) ) (!  (=> (= (type x@@35) RefType) (= (getPredWandId (c2_post x@@35)) 3))
 :qid |stdinbpl.571:15|
 :skolemid |91|
 :pattern ( (c2_post x@@35))
)))
(assert (forall ((x@@36 T@U) ) (!  (=> (= (type x@@36) RefType) (= (getPredWandId (c3_pre x@@36)) 4))
 :qid |stdinbpl.619:15|
 :skolemid |97|
 :pattern ( (c3_pre x@@36))
)))
(assert (forall ((x@@37 T@U) ) (!  (=> (= (type x@@37) RefType) (= (getPredWandId (c3_post x@@37)) 5))
 :qid |stdinbpl.667:15|
 :skolemid |103|
 :pattern ( (c3_post x@@37))
)))
(assert (forall ((Mask@@8 T@U) (o_2@@2 T@U) (f_4@@2 T@U) ) (! (let ((B@@7 (FieldTypeInv1 (type f_4@@2))))
(let ((A@@8 (FieldTypeInv0 (type f_4@@2))))
 (=> (and (and (and (= (type Mask@@8) (MapType0Type RefType realType)) (= (type o_2@@2) RefType)) (= (type f_4@@2) (FieldType A@@8 B@@7))) (GoodMask Mask@@8)) (and (>= (U_2_real (MapType0Select Mask@@8 o_2@@2 f_4@@2)) NoPerm) (=> (and (and (GoodMask Mask@@8) (not (IsPredicateField f_4@@2))) (not (IsWandField f_4@@2))) (<= (U_2_real (MapType0Select Mask@@8 o_2@@2 f_4@@2)) FullPerm))))))
 :qid |stdinbpl.128:22|
 :skolemid |16|
 :pattern ( (GoodMask Mask@@8) (MapType0Select Mask@@8 o_2@@2 f_4@@2))
)))
(assert (forall ((o T@U) (f T@U) (Heap@@13 T@U) ) (!  (=> (and (and (and (= (type o) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap@@13) (MapType1Type RefType))) (U_2_bool (MapType1Select Heap@@13 o $allocated))) (U_2_bool (MapType1Select Heap@@13 (MapType1Select Heap@@13 o f) $allocated)))
 :qid |stdinbpl.31:15|
 :skolemid |0|
 :pattern ( (MapType1Select Heap@@13 o f))
)))
(assert (forall ((arg0@@58 Bool) (arg1@@76 Bool) ) (! (= (type (|wand_5#sm| arg0@@58 arg1@@76)) (FieldType WandType_wand_5Type (MapType0Type RefType boolType)))
 :qid |funType:wand_5#sm|
 :pattern ( (|wand_5#sm| arg0@@58 arg1@@76))
)))
(assert (forall ((arg1@@77 Bool) (arg2@@67 Bool) ) (! (= (|wand_5#sm| arg1@@77 arg2@@67) (WandMaskField (|wand_5#ft| arg1@@77 arg2@@67)))
 :qid |stdinbpl.359:15|
 :skolemid |61|
 :pattern ( (WandMaskField (|wand_5#ft| arg1@@77 arg2@@67)))
)))
(assert (forall ((x@@38 T@U) ) (!  (=> (= (type x@@38) RefType) (= (PredicateMaskField (c1_pre x@@38)) (|c1_pre#sm| x@@38)))
 :qid |stdinbpl.419:15|
 :skolemid |71|
 :pattern ( (PredicateMaskField (c1_pre x@@38)))
)))
(assert (forall ((x@@39 T@U) ) (!  (=> (= (type x@@39) RefType) (= (PredicateMaskField (c1_post x@@39)) (|c1_post#sm| x@@39)))
 :qid |stdinbpl.467:15|
 :skolemid |77|
 :pattern ( (PredicateMaskField (c1_post x@@39)))
)))
(assert (forall ((x@@40 T@U) ) (!  (=> (= (type x@@40) RefType) (= (PredicateMaskField (c2_pre x@@40)) (|c2_pre#sm| x@@40)))
 :qid |stdinbpl.515:15|
 :skolemid |83|
 :pattern ( (PredicateMaskField (c2_pre x@@40)))
)))
(assert (forall ((x@@41 T@U) ) (!  (=> (= (type x@@41) RefType) (= (PredicateMaskField (c2_post x@@41)) (|c2_post#sm| x@@41)))
 :qid |stdinbpl.563:15|
 :skolemid |89|
 :pattern ( (PredicateMaskField (c2_post x@@41)))
)))
(assert (forall ((x@@42 T@U) ) (!  (=> (= (type x@@42) RefType) (= (PredicateMaskField (c3_pre x@@42)) (|c3_pre#sm| x@@42)))
 :qid |stdinbpl.611:15|
 :skolemid |95|
 :pattern ( (PredicateMaskField (c3_pre x@@42)))
)))
(assert (forall ((x@@43 T@U) ) (!  (=> (= (type x@@43) RefType) (= (PredicateMaskField (c3_post x@@43)) (|c3_post#sm| x@@43)))
 :qid |stdinbpl.659:15|
 :skolemid |101|
 :pattern ( (PredicateMaskField (c3_post x@@43)))
)))
(assert (forall ((Heap@@14 T@U) (o@@0 T@U) (f_3 T@U) (v T@U) ) (! (let ((B@@8 (type v)))
(let ((A@@9 (FieldTypeInv0 (type f_3))))
 (=> (and (and (= (type Heap@@14) (MapType1Type RefType)) (= (type o@@0) RefType)) (= (type f_3) (FieldType A@@9 B@@8))) (succHeap Heap@@14 (MapType1Store Heap@@14 o@@0 f_3 v)))))
 :qid |stdinbpl.78:22|
 :skolemid |9|
 :pattern ( (MapType1Store Heap@@14 o@@0 f_3 v))
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
(assert (forall ((arg1@@78 T@U) (arg2@@68 Real) (arg3@@56 T@U) (arg4@@41 Real) (arg1_2@@4 T@U) (arg2_2@@4 Real) (arg3_2@@3 T@U) (arg4_2@@2 Real) ) (!  (=> (and (and (and (and (= (type arg1@@78) RefType) (= (type arg3@@56) RefType)) (= (type arg1_2@@4) RefType)) (= (type arg3_2@@3) RefType)) (= (wand_1 arg1@@78 arg2@@68 arg3@@56 arg4@@41) (wand_1 arg1_2@@4 arg2_2@@4 arg3_2@@3 arg4_2@@2))) (and (= arg1@@78 arg1_2@@4) (and (= arg2@@68 arg2_2@@4) (and (= arg3@@56 arg3_2@@3) (= arg4@@41 arg4_2@@2)))))
 :qid |stdinbpl.239:15|
 :skolemid |35|
 :pattern ( (wand_1 arg1@@78 arg2@@68 arg3@@56 arg4@@41) (wand_1 arg1_2@@4 arg2_2@@4 arg3_2@@3 arg4_2@@2))
)))
(assert (forall ((arg1@@79 T@U) (arg2@@69 Real) (arg3@@57 T@U) (arg4@@42 Real) (arg1_2@@5 T@U) (arg2_2@@5 Real) (arg3_2@@4 T@U) (arg4_2@@3 Real) ) (!  (=> (and (and (and (and (= (type arg1@@79) RefType) (= (type arg3@@57) RefType)) (= (type arg1_2@@5) RefType)) (= (type arg3_2@@4) RefType)) (= (wand arg1@@79 arg2@@69 arg3@@57 arg4@@42) (wand arg1_2@@5 arg2_2@@5 arg3_2@@4 arg4_2@@3))) (and (= arg1@@79 arg1_2@@5) (and (= arg2@@69 arg2_2@@5) (and (= arg3@@57 arg3_2@@4) (= arg4@@42 arg4_2@@3)))))
 :qid |stdinbpl.399:15|
 :skolemid |70|
 :pattern ( (wand arg1@@79 arg2@@69 arg3@@57 arg4@@42) (wand arg1_2@@5 arg2_2@@5 arg3_2@@4 arg4_2@@3))
)))
(push 1)
(declare-fun ControlFlow (Int Int) Int)
(set-info :boogie-vc-id |c2_post#definedness|)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 2) true)
))
(check-sat)
(pop 1)
; Valid
(get-info :rlimit)
