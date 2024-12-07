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
(declare-fun ref () T@U)
(declare-fun f_7 () T@U)
(declare-fun n () T@U)
(declare-fun FieldType (T@T T@T) T@T)
(declare-fun FieldTypeInv0 (T@T) T@T)
(declare-fun FieldTypeInv1 (T@T) T@T)
(declare-fun NormalFieldType () T@T)
(declare-fun RefType () T@T)
(declare-fun MapType0Select (T@U T@U) T@U)
(declare-fun |Map#Values| (T@U) T@U)
(declare-fun MapTypeInv0 (T@T) T@T)
(declare-fun MapType (T@T T@T) T@T)
(declare-fun |Map#Domain| (T@U) T@U)
(declare-fun |Map#Elements| (T@U) T@U)
(declare-fun MapTypeInv1 (T@T) T@T)
(declare-fun MapType0Type (T@T T@T) T@T)
(declare-fun MapType0TypeInv0 (T@T) T@T)
(declare-fun MapType0TypeInv1 (T@T) T@T)
(declare-fun MapType0Store (T@U T@U T@U) T@U)
(declare-fun succHeap (T@U T@U) Bool)
(declare-fun MapType1Type (T@T) T@T)
(declare-fun succHeapTrans (T@U T@U) Bool)
(declare-fun MapType1TypeInv0 (T@T) T@T)
(declare-fun MapType1Select (T@U T@U T@U) T@U)
(declare-fun MapType1Store (T@U T@U T@U T@U) T@U)
(declare-fun |MultiSet#Card| (T@U) Int)
(declare-fun |MultiSet#Difference| (T@U T@U) T@U)
(declare-fun MultiSetTypeInv0 (T@T) T@T)
(declare-fun MultiSetType (T@T) T@T)
(declare-fun |MultiSet#Intersection| (T@U T@U) T@U)
(declare-fun |MultiSet#Union| (T@U T@U) T@U)
(declare-fun state (T@U T@U) Bool)
(declare-fun MapType2Type (T@T T@T) T@T)
(declare-fun GoodMask (T@U) Bool)
(declare-fun MapType2TypeInv0 (T@T) T@T)
(declare-fun MapType2TypeInv1 (T@T) T@T)
(declare-fun MapType2Select (T@U T@U T@U) T@U)
(declare-fun MapType2Store (T@U T@U T@U T@U) T@U)
(declare-fun ListRef (T@U T@U Bool) T@U)
(declare-fun IsPredicateField (T@U) Bool)
(declare-fun PredicateType_ListRefType () T@T)
(declare-fun FrameTypeType () T@T)
(declare-fun NodeRef (T@U T@U Bool) T@U)
(declare-fun PredicateType_NodeRefType () T@T)
(declare-fun |ListRef#trigger| (T@U T@U) Bool)
(declare-fun |ListRef#everUsed| (T@U) Bool)
(declare-fun |NodeRef#trigger| (T@U T@U) Bool)
(declare-fun |NodeRef#everUsed| (T@U) Bool)
(declare-fun getPredWandId (T@U) Int)
(declare-fun |get_disc'| (T@U T@U T@U) T@U)
(declare-fun dummyFunction (T@U) Bool)
(declare-fun |get_disc#triggerStateless| (T@U T@U) T@U)
(declare-fun |Math#min| (Int Int) Int)
(declare-fun IdenticalOnKnownLocations (T@U T@U T@U) Bool)
(declare-fun null () T@U)
(declare-fun PredicateMaskField (T@U) T@U)
(declare-fun HasDirectPerm (T@U T@U T@U) Bool)
(declare-fun IsWandField (T@U) Bool)
(declare-fun WandMaskField (T@U) T@U)
(declare-fun List (T@U) T@U)
(declare-fun PredicateType_ListType () T@T)
(declare-fun Node (T@U) T@U)
(declare-fun PredicateType_NodeType () T@T)
(declare-fun lft_T (T@U) T@U)
(declare-fun PredicateType_lft_TType () T@T)
(declare-fun lft_List (T@U) T@U)
(declare-fun PredicateType_lft_ListType () T@T)
(declare-fun LifetimeP (T@U) T@U)
(declare-fun PredicateType_LifetimePType () T@T)
(declare-fun P (T@U) T@U)
(declare-fun PredicateType_PType () T@T)
(declare-fun |valid_lft'| (T@U T@U) Bool)
(declare-fun |valid_lft#triggerStateless| (T@U) Bool)
(declare-fun |List#trigger| (T@U T@U) Bool)
(declare-fun |List#everUsed| (T@U) Bool)
(declare-fun |Node#trigger| (T@U T@U) Bool)
(declare-fun |Node#everUsed| (T@U) Bool)
(declare-fun |lft_T#trigger| (T@U T@U) Bool)
(declare-fun |lft_T#everUsed| (T@U) Bool)
(declare-fun |lft_List#trigger| (T@U T@U) Bool)
(declare-fun |lft_List#everUsed| (T@U) Bool)
(declare-fun |LifetimeP#trigger| (T@U T@U) Bool)
(declare-fun |LifetimeP#everUsed| (T@U) Bool)
(declare-fun |P#trigger| (T@U T@U) Bool)
(declare-fun |P#everUsed| (T@U) Bool)
(declare-fun |MultiSet#Select| (T@U T@U) Int)
(declare-fun |Set#Union| (T@U T@U) T@U)
(declare-fun |Set#Intersection| (T@U T@U) T@U)
(declare-fun |ListRef#sm| (T@U T@U Bool) T@U)
(declare-fun |NodeRef#sm| (T@U T@U Bool) T@U)
(declare-fun |wand#ft| (Bool T@U Real Bool T@U Real) T@U)
(declare-fun |wand#sm| (Bool T@U Real Bool T@U Real) T@U)
(declare-fun WandType_wandType () T@T)
(declare-fun |wand_1#ft| (T@U Real T@U Real T@U T@U) T@U)
(declare-fun |wand_1#sm| (T@U Real T@U Real T@U T@U) T@U)
(declare-fun WandType_wand_1Type () T@T)
(declare-fun |Map#Card| (T@U) Int)
(declare-fun |Map#Build| (T@U T@U T@U) T@U)
(declare-fun |Set#Singleton| (T@U) T@U)
(declare-fun |Set#Card| (T@U) Int)
(declare-fun |Math#clip| (Int) Int)
(declare-fun |List#sm| (T@U) T@U)
(declare-fun |Node#sm| (T@U) T@U)
(declare-fun |lft_T#sm| (T@U) T@U)
(declare-fun |lft_List#sm| (T@U) T@U)
(declare-fun |LifetimeP#sm| (T@U) T@U)
(declare-fun |P#sm| (T@U) T@U)
(declare-fun dummyHeap () T@U)
(declare-fun ZeroMask () T@U)
(declare-fun |MultiSet#UnionOne| (T@U T@U) T@U)
(declare-fun |MultiSet#Disjoint| (T@U T@U) Bool)
(declare-fun InsidePredicate (T@U T@U T@U T@U) Bool)
(declare-fun |MultiSet#Singleton| (T@U) T@U)
(declare-fun wand (Bool T@U Real Bool T@U Real) T@U)
(declare-fun |Map#Disjoint| (T@U T@U) Bool)
(declare-fun |Map#Empty| (T@T T@T) T@U)
(declare-fun |Set#Equal| (T@U T@U) Bool)
(declare-fun sumMask (T@U T@U T@U) Bool)
(declare-fun wand_1 (T@U Real T@U Real T@U T@U) T@U)
(declare-fun ConditionalFrame (Real T@U) T@U)
(declare-fun EmptyFrame () T@U)
(declare-fun NoPerm () Real)
(declare-fun |LifetimeP#condqp1| (T@U T@U) Int)
(declare-fun |sk_LifetimeP#condqp1| (Int Int) T@U)
(declare-fun get_disc (T@U T@U T@U) T@U)
(declare-fun |LifetimeP#condqp2| (T@U T@U) Int)
(declare-fun |sk_LifetimeP#condqp2| (Int Int) T@U)
(declare-fun |Set#Difference| (T@U T@U) T@U)
(declare-fun |MultiSet#Equal| (T@U T@U) Bool)
(declare-fun |Map#Equal| (T@U T@U) Bool)
(declare-fun |Set#UnionOne| (T@U T@U) T@U)
(declare-fun valid_lft (T@U T@U) Bool)
(declare-fun AssumeFunctionsAbove () Int)
(declare-fun |valid_lft#frame| (T@U T@U) Bool)
(declare-fun |MultiSet#Empty| (T@T) T@U)
(declare-fun FullPerm () Real)
(declare-fun |Set#Empty| (T@T) T@U)
(declare-fun |get_disc#frame| (T@U T@U T@U) T@U)
(declare-fun CombineFrames (T@U T@U) T@U)
(declare-fun FrameFragment (T@U) T@U)
(declare-fun |Set#Subset| (T@U T@U) Bool)
(declare-fun ZeroPMask () T@U)
(declare-fun |MultiSet#Subset| (T@U T@U) Bool)
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
))) (= (Ctor NormalFieldType) 7)) (= (type $allocated) (FieldType NormalFieldType boolType))) (= (Ctor RefType) 8)) (= (type ref) (FieldType NormalFieldType RefType))) (= (type f_7) (FieldType NormalFieldType RefType))) (= (type n) (FieldType NormalFieldType RefType))))
(assert (distinct $allocated ref f_7 n)
)
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (forall ((arg0@@14 T@T) (arg1@@2 T@T) ) (! (= (Ctor (MapType arg0@@14 arg1@@2)) 9)
 :qid |ctor:MapType|
)) (forall ((arg0@@15 T@T) (arg1@@3 T@T) ) (! (= (MapTypeInv0 (MapType arg0@@15 arg1@@3)) arg0@@15)
 :qid |typeInv:MapTypeInv0|
 :pattern ( (MapType arg0@@15 arg1@@3))
))) (forall ((arg0@@16 T@T) (arg1@@4 T@T) ) (! (= (MapTypeInv1 (MapType arg0@@16 arg1@@4)) arg1@@4)
 :qid |typeInv:MapTypeInv1|
 :pattern ( (MapType arg0@@16 arg1@@4))
))) (forall ((arg0@@17 T@T) (arg1@@5 T@T) ) (! (= (Ctor (MapType0Type arg0@@17 arg1@@5)) 10)
 :qid |ctor:MapType0Type|
))) (forall ((arg0@@18 T@T) (arg1@@6 T@T) ) (! (= (MapType0TypeInv0 (MapType0Type arg0@@18 arg1@@6)) arg0@@18)
 :qid |typeInv:MapType0TypeInv0|
 :pattern ( (MapType0Type arg0@@18 arg1@@6))
))) (forall ((arg0@@19 T@T) (arg1@@7 T@T) ) (! (= (MapType0TypeInv1 (MapType0Type arg0@@19 arg1@@7)) arg1@@7)
 :qid |typeInv:MapType0TypeInv1|
 :pattern ( (MapType0Type arg0@@19 arg1@@7))
))) (forall ((arg0@@20 T@U) (arg1@@8 T@U) ) (! (let ((aVar1 (MapType0TypeInv1 (type arg0@@20))))
(= (type (MapType0Select arg0@@20 arg1@@8)) aVar1))
 :qid |funType:MapType0Select|
 :pattern ( (MapType0Select arg0@@20 arg1@@8))
))) (forall ((arg0@@21 T@U) (arg1@@9 T@U) (arg2 T@U) ) (! (let ((aVar1@@0 (type arg2)))
(let ((aVar0 (type arg1@@9)))
(= (type (MapType0Store arg0@@21 arg1@@9 arg2)) (MapType0Type aVar0 aVar1@@0))))
 :qid |funType:MapType0Store|
 :pattern ( (MapType0Store arg0@@21 arg1@@9 arg2))
))) (forall ((m T@U) (x0 T@U) (val T@U) ) (! (let ((aVar1@@1 (MapType0TypeInv1 (type m))))
 (=> (= (type val) aVar1@@1) (= (MapType0Select (MapType0Store m x0 val) x0) val)))
 :qid |mapAx0:MapType0Select|
 :weight 0
))) (and (forall ((val@@0 T@U) (m@@0 T@U) (x0@@0 T@U) (y0 T@U) ) (!  (or (= x0@@0 y0) (= (MapType0Select (MapType0Store m@@0 x0@@0 val@@0) y0) (MapType0Select m@@0 y0)))
 :qid |mapAx1:MapType0Select:0|
 :weight 0
)) (forall ((val@@1 T@U) (m@@1 T@U) (x0@@1 T@U) (y0@@0 T@U) ) (!  (or true (= (MapType0Select (MapType0Store m@@1 x0@@1 val@@1) y0@@0) (MapType0Select m@@1 y0@@0)))
 :qid |mapAx2:MapType0Select|
 :weight 0
)))) (forall ((arg0@@22 T@U) ) (! (let ((V (MapTypeInv1 (type arg0@@22))))
(= (type (|Map#Values| arg0@@22)) (MapType0Type V boolType)))
 :qid |funType:Map#Values|
 :pattern ( (|Map#Values| arg0@@22))
))) (forall ((arg0@@23 T@U) ) (! (let ((U (MapTypeInv0 (type arg0@@23))))
(= (type (|Map#Domain| arg0@@23)) (MapType0Type U boolType)))
 :qid |funType:Map#Domain|
 :pattern ( (|Map#Domain| arg0@@23))
))) (forall ((arg0@@24 T@U) ) (! (let ((V@@0 (MapTypeInv1 (type arg0@@24))))
(let ((U@@0 (MapTypeInv0 (type arg0@@24))))
(= (type (|Map#Elements| arg0@@24)) (MapType0Type U@@0 V@@0))))
 :qid |funType:Map#Elements|
 :pattern ( (|Map#Elements| arg0@@24))
))))
(assert (forall ((m@@2 T@U) (v T@U) ) (! (let ((V@@1 (type v)))
(let ((U@@1 (MapTypeInv0 (type m@@2))))
 (=> (and (= (type m@@2) (MapType U@@1 V@@1)) (U_2_bool (MapType0Select (|Map#Values| m@@2) v))) (exists ((u T@U) ) (!  (and (= (type u) U@@1) (and (U_2_bool (MapType0Select (|Map#Domain| m@@2) u)) (= v (MapType0Select (|Map#Elements| m@@2) u))))
 :qid |stdinbpl.445:10|
 :skolemid |84|
 :pattern ( (MapType0Select (|Map#Domain| m@@2) u))
 :pattern ( (MapType0Select (|Map#Elements| m@@2) u))
)))))
 :qid |stdinbpl.443:20|
 :skolemid |85|
 :pattern ( (MapType0Select (|Map#Values| m@@2) v))
)))
(assert  (and (and (and (and (and (forall ((arg0@@25 T@T) ) (! (= (Ctor (MapType1Type arg0@@25)) 11)
 :qid |ctor:MapType1Type|
)) (forall ((arg0@@26 T@T) ) (! (= (MapType1TypeInv0 (MapType1Type arg0@@26)) arg0@@26)
 :qid |typeInv:MapType1TypeInv0|
 :pattern ( (MapType1Type arg0@@26))
))) (forall ((arg0@@27 T@U) (arg1@@10 T@U) (arg2@@0 T@U) ) (! (let ((B (FieldTypeInv1 (type arg2@@0))))
(= (type (MapType1Select arg0@@27 arg1@@10 arg2@@0)) B))
 :qid |funType:MapType1Select|
 :pattern ( (MapType1Select arg0@@27 arg1@@10 arg2@@0))
))) (forall ((arg0@@28 T@U) (arg1@@11 T@U) (arg2@@1 T@U) (arg3 T@U) ) (! (let ((aVar0@@0 (type arg1@@11)))
(= (type (MapType1Store arg0@@28 arg1@@11 arg2@@1 arg3)) (MapType1Type aVar0@@0)))
 :qid |funType:MapType1Store|
 :pattern ( (MapType1Store arg0@@28 arg1@@11 arg2@@1 arg3))
))) (forall ((m@@3 T@U) (x0@@2 T@U) (x1 T@U) (val@@2 T@U) ) (! (let ((B@@0 (FieldTypeInv1 (type x1))))
 (=> (= (type val@@2) B@@0) (= (MapType1Select (MapType1Store m@@3 x0@@2 x1 val@@2) x0@@2 x1) val@@2)))
 :qid |mapAx0:MapType1Select|
 :weight 0
))) (and (and (forall ((val@@3 T@U) (m@@4 T@U) (x0@@3 T@U) (x1@@0 T@U) (y0@@1 T@U) (y1 T@U) ) (!  (or (= x0@@3 y0@@1) (= (MapType1Select (MapType1Store m@@4 x0@@3 x1@@0 val@@3) y0@@1 y1) (MapType1Select m@@4 y0@@1 y1)))
 :qid |mapAx1:MapType1Select:0|
 :weight 0
)) (forall ((val@@4 T@U) (m@@5 T@U) (x0@@4 T@U) (x1@@1 T@U) (y0@@2 T@U) (y1@@0 T@U) ) (!  (or (= x1@@1 y1@@0) (= (MapType1Select (MapType1Store m@@5 x0@@4 x1@@1 val@@4) y0@@2 y1@@0) (MapType1Select m@@5 y0@@2 y1@@0)))
 :qid |mapAx1:MapType1Select:1|
 :weight 0
))) (forall ((val@@5 T@U) (m@@6 T@U) (x0@@5 T@U) (x1@@2 T@U) (y0@@3 T@U) (y1@@1 T@U) ) (!  (or true (= (MapType1Select (MapType1Store m@@6 x0@@5 x1@@2 val@@5) y0@@3 y1@@1) (MapType1Select m@@6 y0@@3 y1@@1)))
 :qid |mapAx2:MapType1Select|
 :weight 0
)))))
(assert (forall ((Heap0 T@U) (Heap1 T@U) ) (!  (=> (and (and (= (type Heap0) (MapType1Type RefType)) (= (type Heap1) (MapType1Type RefType))) (succHeap Heap0 Heap1)) (succHeapTrans Heap0 Heap1))
 :qid |stdinbpl.88:15|
 :skolemid |11|
 :pattern ( (succHeap Heap0 Heap1))
)))
(assert  (and (and (and (and (forall ((arg0@@29 T@T) ) (! (= (Ctor (MultiSetType arg0@@29)) 12)
 :qid |ctor:MultiSetType|
)) (forall ((arg0@@30 T@T) ) (! (= (MultiSetTypeInv0 (MultiSetType arg0@@30)) arg0@@30)
 :qid |typeInv:MultiSetTypeInv0|
 :pattern ( (MultiSetType arg0@@30))
))) (forall ((arg0@@31 T@U) (arg1@@12 T@U) ) (! (let ((T (MultiSetTypeInv0 (type arg0@@31))))
(= (type (|MultiSet#Difference| arg0@@31 arg1@@12)) (MultiSetType T)))
 :qid |funType:MultiSet#Difference|
 :pattern ( (|MultiSet#Difference| arg0@@31 arg1@@12))
))) (forall ((arg0@@32 T@U) (arg1@@13 T@U) ) (! (let ((T@@0 (MultiSetTypeInv0 (type arg0@@32))))
(= (type (|MultiSet#Intersection| arg0@@32 arg1@@13)) (MultiSetType T@@0)))
 :qid |funType:MultiSet#Intersection|
 :pattern ( (|MultiSet#Intersection| arg0@@32 arg1@@13))
))) (forall ((arg0@@33 T@U) (arg1@@14 T@U) ) (! (let ((T@@1 (MultiSetTypeInv0 (type arg0@@33))))
(= (type (|MultiSet#Union| arg0@@33 arg1@@14)) (MultiSetType T@@1)))
 :qid |funType:MultiSet#Union|
 :pattern ( (|MultiSet#Union| arg0@@33 arg1@@14))
))))
(assert (forall ((a T@U) (b T@U) ) (! (let ((T@@2 (MultiSetTypeInv0 (type a))))
 (=> (and (= (type a) (MultiSetType T@@2)) (= (type b) (MultiSetType T@@2))) (and (= (+ (+ (|MultiSet#Card| (|MultiSet#Difference| a b)) (|MultiSet#Card| (|MultiSet#Difference| b a))) (* 2 (|MultiSet#Card| (|MultiSet#Intersection| a b)))) (|MultiSet#Card| (|MultiSet#Union| a b))) (= (|MultiSet#Card| (|MultiSet#Difference| a b)) (- (|MultiSet#Card| a) (|MultiSet#Card| (|MultiSet#Intersection| a b)))))))
 :qid |stdinbpl.384:18|
 :skolemid |74|
 :pattern ( (|MultiSet#Card| (|MultiSet#Difference| a b)))
)))
(assert  (and (and (and (and (and (and (forall ((arg0@@34 T@T) (arg1@@15 T@T) ) (! (= (Ctor (MapType2Type arg0@@34 arg1@@15)) 13)
 :qid |ctor:MapType2Type|
)) (forall ((arg0@@35 T@T) (arg1@@16 T@T) ) (! (= (MapType2TypeInv0 (MapType2Type arg0@@35 arg1@@16)) arg0@@35)
 :qid |typeInv:MapType2TypeInv0|
 :pattern ( (MapType2Type arg0@@35 arg1@@16))
))) (forall ((arg0@@36 T@T) (arg1@@17 T@T) ) (! (= (MapType2TypeInv1 (MapType2Type arg0@@36 arg1@@17)) arg1@@17)
 :qid |typeInv:MapType2TypeInv1|
 :pattern ( (MapType2Type arg0@@36 arg1@@17))
))) (forall ((arg0@@37 T@U) (arg1@@18 T@U) (arg2@@2 T@U) ) (! (let ((aVar1@@2 (MapType2TypeInv1 (type arg0@@37))))
(= (type (MapType2Select arg0@@37 arg1@@18 arg2@@2)) aVar1@@2))
 :qid |funType:MapType2Select|
 :pattern ( (MapType2Select arg0@@37 arg1@@18 arg2@@2))
))) (forall ((arg0@@38 T@U) (arg1@@19 T@U) (arg2@@3 T@U) (arg3@@0 T@U) ) (! (let ((aVar1@@3 (type arg3@@0)))
(let ((aVar0@@1 (type arg1@@19)))
(= (type (MapType2Store arg0@@38 arg1@@19 arg2@@3 arg3@@0)) (MapType2Type aVar0@@1 aVar1@@3))))
 :qid |funType:MapType2Store|
 :pattern ( (MapType2Store arg0@@38 arg1@@19 arg2@@3 arg3@@0))
))) (forall ((m@@7 T@U) (x0@@6 T@U) (x1@@3 T@U) (val@@6 T@U) ) (! (let ((aVar1@@4 (MapType2TypeInv1 (type m@@7))))
 (=> (= (type val@@6) aVar1@@4) (= (MapType2Select (MapType2Store m@@7 x0@@6 x1@@3 val@@6) x0@@6 x1@@3) val@@6)))
 :qid |mapAx0:MapType2Select|
 :weight 0
))) (and (and (forall ((val@@7 T@U) (m@@8 T@U) (x0@@7 T@U) (x1@@4 T@U) (y0@@4 T@U) (y1@@2 T@U) ) (!  (or (= x0@@7 y0@@4) (= (MapType2Select (MapType2Store m@@8 x0@@7 x1@@4 val@@7) y0@@4 y1@@2) (MapType2Select m@@8 y0@@4 y1@@2)))
 :qid |mapAx1:MapType2Select:0|
 :weight 0
)) (forall ((val@@8 T@U) (m@@9 T@U) (x0@@8 T@U) (x1@@5 T@U) (y0@@5 T@U) (y1@@3 T@U) ) (!  (or (= x1@@5 y1@@3) (= (MapType2Select (MapType2Store m@@9 x0@@8 x1@@5 val@@8) y0@@5 y1@@3) (MapType2Select m@@9 y0@@5 y1@@3)))
 :qid |mapAx1:MapType2Select:1|
 :weight 0
))) (forall ((val@@9 T@U) (m@@10 T@U) (x0@@9 T@U) (x1@@6 T@U) (y0@@6 T@U) (y1@@4 T@U) ) (!  (or true (= (MapType2Select (MapType2Store m@@10 x0@@9 x1@@6 val@@9) y0@@6 y1@@4) (MapType2Select m@@10 y0@@6 y1@@4)))
 :qid |mapAx2:MapType2Select|
 :weight 0
)))))
(assert (forall ((Heap T@U) (Mask T@U) ) (!  (=> (and (and (= (type Heap) (MapType1Type RefType)) (= (type Mask) (MapType2Type RefType realType))) (state Heap Mask)) (GoodMask Mask))
 :qid |stdinbpl.124:15|
 :skolemid |15|
 :pattern ( (state Heap Mask))
)))
(assert (forall ((Heap0@@0 T@U) (Heap1@@0 T@U) (Heap2 T@U) ) (!  (=> (and (and (and (= (type Heap0@@0) (MapType1Type RefType)) (= (type Heap1@@0) (MapType1Type RefType))) (= (type Heap2) (MapType1Type RefType))) (and (succHeapTrans Heap0@@0 Heap1@@0) (succHeap Heap1@@0 Heap2))) (succHeapTrans Heap0@@0 Heap2))
 :qid |stdinbpl.93:15|
 :skolemid |12|
 :pattern ( (succHeapTrans Heap0@@0 Heap1@@0) (succHeap Heap1@@0 Heap2))
)))
(assert  (and (and (= (Ctor PredicateType_ListRefType) 14) (= (Ctor FrameTypeType) 15)) (forall ((arg0@@39 T@U) (arg1@@20 T@U) (arg2@@4 Bool) ) (! (= (type (ListRef arg0@@39 arg1@@20 arg2@@4)) (FieldType PredicateType_ListRefType FrameTypeType))
 :qid |funType:ListRef|
 :pattern ( (ListRef arg0@@39 arg1@@20 arg2@@4))
))))
(assert (forall ((x@@8 T@U) (lft T@U) (mut Bool) ) (!  (=> (and (= (type x@@8) RefType) (= (type lft) (MapType intType (MapType RefType realType)))) (IsPredicateField (ListRef x@@8 lft mut)))
 :qid |stdinbpl.1007:15|
 :skolemid |158|
 :pattern ( (ListRef x@@8 lft mut))
)))
(assert  (and (= (Ctor PredicateType_NodeRefType) 16) (forall ((arg0@@40 T@U) (arg1@@21 T@U) (arg2@@5 Bool) ) (! (= (type (NodeRef arg0@@40 arg1@@21 arg2@@5)) (FieldType PredicateType_NodeRefType FrameTypeType))
 :qid |funType:NodeRef|
 :pattern ( (NodeRef arg0@@40 arg1@@21 arg2@@5))
))))
(assert (forall ((x@@9 T@U) (lft@@0 T@U) (mut@@0 Bool) ) (!  (=> (and (= (type x@@9) RefType) (= (type lft@@0) (MapType intType (MapType RefType realType)))) (IsPredicateField (NodeRef x@@9 lft@@0 mut@@0)))
 :qid |stdinbpl.1070:15|
 :skolemid |164|
 :pattern ( (NodeRef x@@9 lft@@0 mut@@0))
)))
(assert (forall ((Heap@@0 T@U) (x@@10 T@U) (lft@@1 T@U) (mut@@1 Bool) ) (!  (=> (and (and (= (type Heap@@0) (MapType1Type RefType)) (= (type x@@10) RefType)) (= (type lft@@1) (MapType intType (MapType RefType realType)))) (|ListRef#everUsed| (ListRef x@@10 lft@@1 mut@@1)))
 :qid |stdinbpl.1026:15|
 :skolemid |162|
 :pattern ( (|ListRef#trigger| Heap@@0 (ListRef x@@10 lft@@1 mut@@1)))
)))
(assert (forall ((Heap@@1 T@U) (x@@11 T@U) (lft@@2 T@U) (mut@@2 Bool) ) (!  (=> (and (and (= (type Heap@@1) (MapType1Type RefType)) (= (type x@@11) RefType)) (= (type lft@@2) (MapType intType (MapType RefType realType)))) (|NodeRef#everUsed| (NodeRef x@@11 lft@@2 mut@@2)))
 :qid |stdinbpl.1089:15|
 :skolemid |168|
 :pattern ( (|NodeRef#trigger| Heap@@1 (NodeRef x@@11 lft@@2 mut@@2)))
)))
(assert (forall ((x@@12 T@U) (lft@@3 T@U) (mut@@3 Bool) ) (!  (=> (and (= (type x@@12) RefType) (= (type lft@@3) (MapType intType (MapType RefType realType)))) (= (getPredWandId (ListRef x@@12 lft@@3 mut@@3)) 4))
 :qid |stdinbpl.1011:15|
 :skolemid |159|
 :pattern ( (ListRef x@@12 lft@@3 mut@@3))
)))
(assert (forall ((x@@13 T@U) (lft@@4 T@U) (mut@@4 Bool) ) (!  (=> (and (= (type x@@13) RefType) (= (type lft@@4) (MapType intType (MapType RefType realType)))) (= (getPredWandId (NodeRef x@@13 lft@@4 mut@@4)) 5))
 :qid |stdinbpl.1074:15|
 :skolemid |165|
 :pattern ( (NodeRef x@@13 lft@@4 mut@@4))
)))
(assert  (and (forall ((arg0@@41 T@U) (arg1@@22 T@U) (arg2@@6 T@U) ) (! (= (type (|get_disc'| arg0@@41 arg1@@22 arg2@@6)) RefType)
 :qid |funType:get_disc'|
 :pattern ( (|get_disc'| arg0@@41 arg1@@22 arg2@@6))
)) (forall ((arg0@@42 T@U) (arg1@@23 T@U) ) (! (= (type (|get_disc#triggerStateless| arg0@@42 arg1@@23)) RefType)
 :qid |funType:get_disc#triggerStateless|
 :pattern ( (|get_disc#triggerStateless| arg0@@42 arg1@@23))
))))
(assert (forall ((Heap@@2 T@U) (x@@14 T@U) (lft@@5 T@U) ) (!  (=> (and (and (= (type Heap@@2) (MapType1Type RefType)) (= (type x@@14) RefType)) (= (type lft@@5) (MapType intType (MapType RefType realType)))) (dummyFunction (|get_disc#triggerStateless| x@@14 lft@@5)))
 :qid |stdinbpl.655:15|
 :skolemid |122|
 :pattern ( (|get_disc'| Heap@@2 x@@14 lft@@5))
)))
(assert (forall ((a@@0 Int) (b@@0 Int) ) (!  (or (= (|Math#min| a@@0 b@@0) a@@0) (= (|Math#min| a@@0 b@@0) b@@0))
 :qid |stdinbpl.315:15|
 :skolemid |53|
 :pattern ( (|Math#min| a@@0 b@@0))
)))
(assert  (and (= (type null) RefType) (forall ((arg0@@43 T@U) ) (! (let ((A (FieldTypeInv0 (type arg0@@43))))
(= (type (PredicateMaskField arg0@@43)) (FieldType A (MapType2Type RefType boolType))))
 :qid |funType:PredicateMaskField|
 :pattern ( (PredicateMaskField arg0@@43))
))))
(assert (forall ((Heap@@3 T@U) (ExhaleHeap T@U) (Mask@@0 T@U) (pm_f T@U) ) (! (let ((C (FieldTypeInv0 (type pm_f))))
 (=> (and (and (and (and (and (= (type Heap@@3) (MapType1Type RefType)) (= (type ExhaleHeap) (MapType1Type RefType))) (= (type Mask@@0) (MapType2Type RefType realType))) (= (type pm_f) (FieldType C FrameTypeType))) (IdenticalOnKnownLocations Heap@@3 ExhaleHeap Mask@@0)) (and (HasDirectPerm Mask@@0 null pm_f) (IsPredicateField pm_f))) (= (MapType1Select Heap@@3 null (PredicateMaskField pm_f)) (MapType1Select ExhaleHeap null (PredicateMaskField pm_f)))))
 :qid |stdinbpl.47:19|
 :skolemid |2|
 :pattern ( (IdenticalOnKnownLocations Heap@@3 ExhaleHeap Mask@@0) (IsPredicateField pm_f) (MapType1Select ExhaleHeap null (PredicateMaskField pm_f)))
)))
(assert (forall ((arg0@@44 T@U) ) (! (let ((A@@0 (FieldTypeInv0 (type arg0@@44))))
(= (type (WandMaskField arg0@@44)) (FieldType A@@0 (MapType2Type RefType boolType))))
 :qid |funType:WandMaskField|
 :pattern ( (WandMaskField arg0@@44))
)))
(assert (forall ((Heap@@4 T@U) (ExhaleHeap@@0 T@U) (Mask@@1 T@U) (pm_f@@0 T@U) ) (! (let ((C@@0 (FieldTypeInv0 (type pm_f@@0))))
 (=> (and (and (and (and (and (= (type Heap@@4) (MapType1Type RefType)) (= (type ExhaleHeap@@0) (MapType1Type RefType))) (= (type Mask@@1) (MapType2Type RefType realType))) (= (type pm_f@@0) (FieldType C@@0 FrameTypeType))) (IdenticalOnKnownLocations Heap@@4 ExhaleHeap@@0 Mask@@1)) (and (HasDirectPerm Mask@@1 null pm_f@@0) (IsWandField pm_f@@0))) (= (MapType1Select Heap@@4 null (WandMaskField pm_f@@0)) (MapType1Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))))
 :qid |stdinbpl.60:19|
 :skolemid |5|
 :pattern ( (IdenticalOnKnownLocations Heap@@4 ExhaleHeap@@0 Mask@@1) (IsWandField pm_f@@0) (MapType1Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))
)))
(assert  (and (= (Ctor PredicateType_ListType) 17) (forall ((arg0@@45 T@U) ) (! (= (type (List arg0@@45)) (FieldType PredicateType_ListType FrameTypeType))
 :qid |funType:List|
 :pattern ( (List arg0@@45))
))))
(assert (forall ((x@@15 T@U) ) (!  (=> (= (type x@@15) RefType) (IsPredicateField (List x@@15)))
 :qid |stdinbpl.909:15|
 :skolemid |146|
 :pattern ( (List x@@15))
)))
(assert  (and (= (Ctor PredicateType_NodeType) 18) (forall ((arg0@@46 T@U) ) (! (= (type (Node arg0@@46)) (FieldType PredicateType_NodeType FrameTypeType))
 :qid |funType:Node|
 :pattern ( (Node arg0@@46))
))))
(assert (forall ((x@@16 T@U) ) (!  (=> (= (type x@@16) RefType) (IsPredicateField (Node x@@16)))
 :qid |stdinbpl.972:15|
 :skolemid |152|
 :pattern ( (Node x@@16))
)))
(assert  (and (= (Ctor PredicateType_lft_TType) 19) (forall ((arg0@@47 T@U) ) (! (= (type (lft_T arg0@@47)) (FieldType PredicateType_lft_TType FrameTypeType))
 :qid |funType:lft_T|
 :pattern ( (lft_T arg0@@47))
))))
(assert (forall ((x@@17 T@U) ) (!  (=> (= (type x@@17) RefType) (IsPredicateField (lft_T x@@17)))
 :qid |stdinbpl.1105:15|
 :skolemid |170|
 :pattern ( (lft_T x@@17))
)))
(assert  (and (= (Ctor PredicateType_lft_ListType) 20) (forall ((arg0@@48 T@U) ) (! (= (type (lft_List arg0@@48)) (FieldType PredicateType_lft_ListType FrameTypeType))
 :qid |funType:lft_List|
 :pattern ( (lft_List arg0@@48))
))))
(assert (forall ((x@@18 T@U) ) (!  (=> (= (type x@@18) RefType) (IsPredicateField (lft_List x@@18)))
 :qid |stdinbpl.1140:15|
 :skolemid |176|
 :pattern ( (lft_List x@@18))
)))
(assert  (and (= (Ctor PredicateType_LifetimePType) 21) (forall ((arg0@@49 T@U) ) (! (= (type (LifetimeP arg0@@49)) (FieldType PredicateType_LifetimePType FrameTypeType))
 :qid |funType:LifetimeP|
 :pattern ( (LifetimeP arg0@@49))
))))
(assert (forall ((lft@@6 T@U) ) (!  (=> (= (type lft@@6) (MapType intType (MapType RefType realType))) (IsPredicateField (LifetimeP lft@@6)))
 :qid |stdinbpl.1201:15|
 :skolemid |182|
 :pattern ( (LifetimeP lft@@6))
)))
(assert  (and (= (Ctor PredicateType_PType) 22) (forall ((arg0@@50 T@U) ) (! (= (type (P arg0@@50)) (FieldType PredicateType_PType FrameTypeType))
 :qid |funType:P|
 :pattern ( (P arg0@@50))
))))
(assert (forall ((x@@19 T@U) ) (!  (=> (= (type x@@19) RefType) (IsPredicateField (P x@@19)))
 :qid |stdinbpl.1464:15|
 :skolemid |208|
 :pattern ( (P x@@19))
)))
(assert (forall ((Heap@@5 T@U) (lft@@7 T@U) ) (!  (=> (and (= (type Heap@@5) (MapType1Type RefType)) (= (type lft@@7) (MapType intType (MapType RefType realType)))) (dummyFunction (bool_2_U (|valid_lft#triggerStateless| lft@@7))))
 :qid |stdinbpl.606:15|
 :skolemid |118|
 :pattern ( (|valid_lft'| Heap@@5 lft@@7))
)))
(assert (forall ((Heap@@6 T@U) (x@@20 T@U) ) (!  (=> (and (= (type Heap@@6) (MapType1Type RefType)) (= (type x@@20) RefType)) (|List#everUsed| (List x@@20)))
 :qid |stdinbpl.928:15|
 :skolemid |150|
 :pattern ( (|List#trigger| Heap@@6 (List x@@20)))
)))
(assert (forall ((Heap@@7 T@U) (x@@21 T@U) ) (!  (=> (and (= (type Heap@@7) (MapType1Type RefType)) (= (type x@@21) RefType)) (|Node#everUsed| (Node x@@21)))
 :qid |stdinbpl.991:15|
 :skolemid |156|
 :pattern ( (|Node#trigger| Heap@@7 (Node x@@21)))
)))
(assert (forall ((Heap@@8 T@U) (x@@22 T@U) ) (!  (=> (and (= (type Heap@@8) (MapType1Type RefType)) (= (type x@@22) RefType)) (|lft_T#everUsed| (lft_T x@@22)))
 :qid |stdinbpl.1124:15|
 :skolemid |174|
 :pattern ( (|lft_T#trigger| Heap@@8 (lft_T x@@22)))
)))
(assert (forall ((Heap@@9 T@U) (x@@23 T@U) ) (!  (=> (and (= (type Heap@@9) (MapType1Type RefType)) (= (type x@@23) RefType)) (|lft_List#everUsed| (lft_List x@@23)))
 :qid |stdinbpl.1159:15|
 :skolemid |180|
 :pattern ( (|lft_List#trigger| Heap@@9 (lft_List x@@23)))
)))
(assert (forall ((Heap@@10 T@U) (lft@@8 T@U) ) (!  (=> (and (= (type Heap@@10) (MapType1Type RefType)) (= (type lft@@8) (MapType intType (MapType RefType realType)))) (|LifetimeP#everUsed| (LifetimeP lft@@8)))
 :qid |stdinbpl.1220:15|
 :skolemid |186|
 :pattern ( (|LifetimeP#trigger| Heap@@10 (LifetimeP lft@@8)))
)))
(assert (forall ((Heap@@11 T@U) (x@@24 T@U) ) (!  (=> (and (= (type Heap@@11) (MapType1Type RefType)) (= (type x@@24) RefType)) (|P#everUsed| (P x@@24)))
 :qid |stdinbpl.1483:15|
 :skolemid |212|
 :pattern ( (|P#trigger| Heap@@11 (P x@@24)))
)))
(assert (forall ((a@@1 T@U) (b@@1 T@U) (y@@1 T@U) ) (! (let ((T@@3 (type y@@1)))
 (=> (and (and (= (type a@@1) (MultiSetType T@@3)) (= (type b@@1) (MultiSetType T@@3))) (<= (|MultiSet#Select| a@@1 y@@1) (|MultiSet#Select| b@@1 y@@1))) (= (|MultiSet#Select| (|MultiSet#Difference| a@@1 b@@1) y@@1) 0)))
 :qid |stdinbpl.382:18|
 :skolemid |73|
 :pattern ( (|MultiSet#Difference| a@@1 b@@1) (|MultiSet#Select| b@@1 y@@1) (|MultiSet#Select| a@@1 y@@1))
)))
(assert (forall ((arg0@@51 T@U) (arg1@@24 T@U) ) (! (let ((T@@4 (MapType0TypeInv0 (type arg0@@51))))
(= (type (|Set#Union| arg0@@51 arg1@@24)) (MapType0Type T@@4 boolType)))
 :qid |funType:Set#Union|
 :pattern ( (|Set#Union| arg0@@51 arg1@@24))
)))
(assert (forall ((a@@2 T@U) (b@@2 T@U) ) (! (let ((T@@5 (MapType0TypeInv0 (type a@@2))))
 (=> (and (= (type a@@2) (MapType0Type T@@5 boolType)) (= (type b@@2) (MapType0Type T@@5 boolType))) (= (|Set#Union| (|Set#Union| a@@2 b@@2) b@@2) (|Set#Union| a@@2 b@@2))))
 :qid |stdinbpl.267:18|
 :skolemid |38|
 :pattern ( (|Set#Union| (|Set#Union| a@@2 b@@2) b@@2))
)))
(assert (forall ((arg0@@52 T@U) (arg1@@25 T@U) ) (! (let ((T@@6 (MapType0TypeInv0 (type arg0@@52))))
(= (type (|Set#Intersection| arg0@@52 arg1@@25)) (MapType0Type T@@6 boolType)))
 :qid |funType:Set#Intersection|
 :pattern ( (|Set#Intersection| arg0@@52 arg1@@25))
)))
(assert (forall ((a@@3 T@U) (b@@3 T@U) ) (! (let ((T@@7 (MapType0TypeInv0 (type a@@3))))
 (=> (and (= (type a@@3) (MapType0Type T@@7 boolType)) (= (type b@@3) (MapType0Type T@@7 boolType))) (= (|Set#Intersection| (|Set#Intersection| a@@3 b@@3) b@@3) (|Set#Intersection| a@@3 b@@3))))
 :qid |stdinbpl.271:18|
 :skolemid |40|
 :pattern ( (|Set#Intersection| (|Set#Intersection| a@@3 b@@3) b@@3))
)))
(assert (forall ((a@@4 T@U) (b@@4 T@U) ) (! (let ((T@@8 (MultiSetTypeInv0 (type a@@4))))
 (=> (and (= (type a@@4) (MultiSetType T@@8)) (= (type b@@4) (MultiSetType T@@8))) (= (|MultiSet#Intersection| (|MultiSet#Intersection| a@@4 b@@4) b@@4) (|MultiSet#Intersection| a@@4 b@@4))))
 :qid |stdinbpl.373:18|
 :skolemid |70|
 :pattern ( (|MultiSet#Intersection| (|MultiSet#Intersection| a@@4 b@@4) b@@4))
)))
(assert (forall ((arg0@@53 T@U) (arg1@@26 T@U) (arg2@@7 Bool) ) (! (= (type (|ListRef#sm| arg0@@53 arg1@@26 arg2@@7)) (FieldType PredicateType_ListRefType (MapType2Type RefType boolType)))
 :qid |funType:ListRef#sm|
 :pattern ( (|ListRef#sm| arg0@@53 arg1@@26 arg2@@7))
)))
(assert (forall ((x@@25 T@U) (lft@@9 T@U) (mut@@5 Bool) ) (!  (=> (and (= (type x@@25) RefType) (= (type lft@@9) (MapType intType (MapType RefType realType)))) (= (PredicateMaskField (ListRef x@@25 lft@@9 mut@@5)) (|ListRef#sm| x@@25 lft@@9 mut@@5)))
 :qid |stdinbpl.1003:15|
 :skolemid |157|
 :pattern ( (PredicateMaskField (ListRef x@@25 lft@@9 mut@@5)))
)))
(assert (forall ((arg0@@54 T@U) (arg1@@27 T@U) (arg2@@8 Bool) ) (! (= (type (|NodeRef#sm| arg0@@54 arg1@@27 arg2@@8)) (FieldType PredicateType_NodeRefType (MapType2Type RefType boolType)))
 :qid |funType:NodeRef#sm|
 :pattern ( (|NodeRef#sm| arg0@@54 arg1@@27 arg2@@8))
)))
(assert (forall ((x@@26 T@U) (lft@@10 T@U) (mut@@6 Bool) ) (!  (=> (and (= (type x@@26) RefType) (= (type lft@@10) (MapType intType (MapType RefType realType)))) (= (PredicateMaskField (NodeRef x@@26 lft@@10 mut@@6)) (|NodeRef#sm| x@@26 lft@@10 mut@@6)))
 :qid |stdinbpl.1066:15|
 :skolemid |163|
 :pattern ( (PredicateMaskField (NodeRef x@@26 lft@@10 mut@@6)))
)))
(assert (forall ((x@@27 T@U) (lft@@11 T@U) (mut@@7 Bool) (x2 T@U) (lft2 T@U) (mut2 Bool) ) (!  (=> (and (and (and (and (= (type x@@27) RefType) (= (type lft@@11) (MapType intType (MapType RefType realType)))) (= (type x2) RefType)) (= (type lft2) (MapType intType (MapType RefType realType)))) (= (ListRef x@@27 lft@@11 mut@@7) (ListRef x2 lft2 mut2))) (and (= x@@27 x2) (and (= lft@@11 lft2) (= mut@@7 mut2))))
 :qid |stdinbpl.1017:15|
 :skolemid |160|
 :pattern ( (ListRef x@@27 lft@@11 mut@@7) (ListRef x2 lft2 mut2))
)))
(assert (forall ((x@@28 T@U) (lft@@12 T@U) (mut@@8 Bool) (x2@@0 T@U) (lft2@@0 T@U) (mut2@@0 Bool) ) (!  (=> (and (and (and (and (= (type x@@28) RefType) (= (type lft@@12) (MapType intType (MapType RefType realType)))) (= (type x2@@0) RefType)) (= (type lft2@@0) (MapType intType (MapType RefType realType)))) (= (|ListRef#sm| x@@28 lft@@12 mut@@8) (|ListRef#sm| x2@@0 lft2@@0 mut2@@0))) (and (= x@@28 x2@@0) (and (= lft@@12 lft2@@0) (= mut@@8 mut2@@0))))
 :qid |stdinbpl.1021:15|
 :skolemid |161|
 :pattern ( (|ListRef#sm| x@@28 lft@@12 mut@@8) (|ListRef#sm| x2@@0 lft2@@0 mut2@@0))
)))
(assert (forall ((x@@29 T@U) (lft@@13 T@U) (mut@@9 Bool) (x2@@1 T@U) (lft2@@1 T@U) (mut2@@1 Bool) ) (!  (=> (and (and (and (and (= (type x@@29) RefType) (= (type lft@@13) (MapType intType (MapType RefType realType)))) (= (type x2@@1) RefType)) (= (type lft2@@1) (MapType intType (MapType RefType realType)))) (= (NodeRef x@@29 lft@@13 mut@@9) (NodeRef x2@@1 lft2@@1 mut2@@1))) (and (= x@@29 x2@@1) (and (= lft@@13 lft2@@1) (= mut@@9 mut2@@1))))
 :qid |stdinbpl.1080:15|
 :skolemid |166|
 :pattern ( (NodeRef x@@29 lft@@13 mut@@9) (NodeRef x2@@1 lft2@@1 mut2@@1))
)))
(assert (forall ((x@@30 T@U) (lft@@14 T@U) (mut@@10 Bool) (x2@@2 T@U) (lft2@@2 T@U) (mut2@@2 Bool) ) (!  (=> (and (and (and (and (= (type x@@30) RefType) (= (type lft@@14) (MapType intType (MapType RefType realType)))) (= (type x2@@2) RefType)) (= (type lft2@@2) (MapType intType (MapType RefType realType)))) (= (|NodeRef#sm| x@@30 lft@@14 mut@@10) (|NodeRef#sm| x2@@2 lft2@@2 mut2@@2))) (and (= x@@30 x2@@2) (and (= lft@@14 lft2@@2) (= mut@@10 mut2@@2))))
 :qid |stdinbpl.1084:15|
 :skolemid |167|
 :pattern ( (|NodeRef#sm| x@@30 lft@@14 mut@@10) (|NodeRef#sm| x2@@2 lft2@@2 mut2@@2))
)))
(assert  (and (and (= (Ctor WandType_wandType) 23) (forall ((arg0@@55 Bool) (arg1@@28 T@U) (arg2@@9 Real) (arg3@@1 Bool) (arg4 T@U) (arg5 Real) ) (! (= (type (|wand#ft| arg0@@55 arg1@@28 arg2@@9 arg3@@1 arg4 arg5)) (FieldType WandType_wandType FrameTypeType))
 :qid |funType:wand#ft|
 :pattern ( (|wand#ft| arg0@@55 arg1@@28 arg2@@9 arg3@@1 arg4 arg5))
))) (forall ((arg0@@56 Bool) (arg1@@29 T@U) (arg2@@10 Real) (arg3@@2 Bool) (arg4@@0 T@U) (arg5@@0 Real) ) (! (= (type (|wand#sm| arg0@@56 arg1@@29 arg2@@10 arg3@@2 arg4@@0 arg5@@0)) (FieldType WandType_wandType (MapType2Type RefType boolType)))
 :qid |funType:wand#sm|
 :pattern ( (|wand#sm| arg0@@56 arg1@@29 arg2@@10 arg3@@2 arg4@@0 arg5@@0))
))))
(assert (forall ((arg1@@30 Bool) (arg2@@11 T@U) (arg3@@3 Real) (arg4@@1 Bool) (arg5@@1 T@U) (arg6 Real) ) (!  (=> (and (= (type arg2@@11) (MapType intType (MapType RefType realType))) (= (type arg5@@1) (MapType intType (MapType RefType realType)))) (= (|wand#sm| arg1@@30 arg2@@11 arg3@@3 arg4@@1 arg5@@1 arg6) (WandMaskField (|wand#ft| arg1@@30 arg2@@11 arg3@@3 arg4@@1 arg5@@1 arg6))))
 :qid |stdinbpl.536:15|
 :skolemid |107|
 :pattern ( (WandMaskField (|wand#ft| arg1@@30 arg2@@11 arg3@@3 arg4@@1 arg5@@1 arg6)))
)))
(assert  (and (and (= (Ctor WandType_wand_1Type) 24) (forall ((arg0@@57 T@U) (arg1@@31 Real) (arg2@@12 T@U) (arg3@@4 Real) (arg4@@2 T@U) (arg5@@2 T@U) ) (! (= (type (|wand_1#ft| arg0@@57 arg1@@31 arg2@@12 arg3@@4 arg4@@2 arg5@@2)) (FieldType WandType_wand_1Type FrameTypeType))
 :qid |funType:wand_1#ft|
 :pattern ( (|wand_1#ft| arg0@@57 arg1@@31 arg2@@12 arg3@@4 arg4@@2 arg5@@2))
))) (forall ((arg0@@58 T@U) (arg1@@32 Real) (arg2@@13 T@U) (arg3@@5 Real) (arg4@@3 T@U) (arg5@@3 T@U) ) (! (= (type (|wand_1#sm| arg0@@58 arg1@@32 arg2@@13 arg3@@5 arg4@@3 arg5@@3)) (FieldType WandType_wand_1Type (MapType2Type RefType boolType)))
 :qid |funType:wand_1#sm|
 :pattern ( (|wand_1#sm| arg0@@58 arg1@@32 arg2@@13 arg3@@5 arg4@@3 arg5@@3))
))))
(assert (forall ((arg1@@33 T@U) (arg2@@14 Real) (arg3@@6 T@U) (arg4@@4 Real) (arg5@@4 T@U) (arg6@@0 T@U) ) (!  (=> (and (and (and (= (type arg1@@33) RefType) (= (type arg3@@6) RefType)) (= (type arg5@@4) RefType)) (= (type arg6@@0) RefType)) (= (|wand_1#sm| arg1@@33 arg2@@14 arg3@@6 arg4@@4 arg5@@4 arg6@@0) (WandMaskField (|wand_1#ft| arg1@@33 arg2@@14 arg3@@6 arg4@@4 arg5@@4 arg6@@0))))
 :qid |stdinbpl.568:15|
 :skolemid |114|
 :pattern ( (WandMaskField (|wand_1#ft| arg1@@33 arg2@@14 arg3@@6 arg4@@4 arg5@@4 arg6@@0)))
)))
(assert (forall ((arg0@@59 T@U) (arg1@@34 T@U) (arg2@@15 T@U) ) (! (let ((V@@2 (type arg2@@15)))
(let ((U@@2 (type arg1@@34)))
(= (type (|Map#Build| arg0@@59 arg1@@34 arg2@@15)) (MapType U@@2 V@@2))))
 :qid |funType:Map#Build|
 :pattern ( (|Map#Build| arg0@@59 arg1@@34 arg2@@15))
)))
(assert (forall ((m@@11 T@U) (u@@0 T@U) (v@@0 T@U) ) (! (let ((V@@3 (type v@@0)))
(let ((U@@3 (type u@@0)))
 (=> (and (= (type m@@11) (MapType U@@3 V@@3)) (U_2_bool (MapType0Select (|Map#Domain| m@@11) u@@0))) (= (|Map#Card| (|Map#Build| m@@11 u@@0 v@@0)) (|Map#Card| m@@11)))))
 :qid |stdinbpl.482:21|
 :skolemid |93|
 :pattern ( (|Map#Card| (|Map#Build| m@@11 u@@0 v@@0)))
 :pattern ( (|Map#Card| m@@11) (|Map#Build| m@@11 u@@0 v@@0))
)))
(assert (forall ((arg0@@60 T@U) ) (! (let ((T@@9 (type arg0@@60)))
(= (type (|Set#Singleton| arg0@@60)) (MapType0Type T@@9 boolType)))
 :qid |funType:Set#Singleton|
 :pattern ( (|Set#Singleton| arg0@@60))
)))
(assert (forall ((r T@U) (o T@U) ) (! (let ((T@@10 (type r)))
 (=> (= (type o) T@@10) (= (U_2_bool (MapType0Select (|Set#Singleton| r) o)) (= r o))))
 :qid |stdinbpl.236:18|
 :skolemid |27|
 :pattern ( (MapType0Select (|Set#Singleton| r) o))
)))
(assert (forall ((a@@5 T@U) (b@@5 T@U) ) (! (let ((T@@11 (MapType0TypeInv0 (type a@@5))))
 (=> (and (= (type a@@5) (MapType0Type T@@11 boolType)) (= (type b@@5) (MapType0Type T@@11 boolType))) (= (+ (|Set#Card| (|Set#Union| a@@5 b@@5)) (|Set#Card| (|Set#Intersection| a@@5 b@@5))) (+ (|Set#Card| a@@5) (|Set#Card| b@@5)))))
 :qid |stdinbpl.275:18|
 :skolemid |42|
 :pattern ( (|Set#Card| (|Set#Union| a@@5 b@@5)))
 :pattern ( (|Set#Card| (|Set#Intersection| a@@5 b@@5)))
)))
(assert (forall ((Heap@@12 T@U) (ExhaleHeap@@1 T@U) (Mask@@2 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@12) (MapType1Type RefType)) (= (type ExhaleHeap@@1) (MapType1Type RefType))) (= (type Mask@@2) (MapType2Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@12 ExhaleHeap@@1 Mask@@2)) (U_2_bool (MapType1Select Heap@@12 o_1 $allocated))) (U_2_bool (MapType1Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.73:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@12 ExhaleHeap@@1 Mask@@2) (MapType1Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert (forall ((a@@6 Int) ) (!  (=> (<= 0 a@@6) (= (|Math#clip| a@@6) a@@6))
 :qid |stdinbpl.318:15|
 :skolemid |54|
 :pattern ( (|Math#clip| a@@6))
)))
(assert (forall ((a@@7 T@U) (b@@6 T@U) (o@@0 T@U) ) (! (let ((T@@12 (type o@@0)))
 (=> (and (= (type a@@7) (MultiSetType T@@12)) (= (type b@@6) (MultiSetType T@@12))) (= (|MultiSet#Select| (|MultiSet#Intersection| a@@7 b@@6) o@@0) (|Math#min| (|MultiSet#Select| a@@7 o@@0) (|MultiSet#Select| b@@6 o@@0)))))
 :qid |stdinbpl.369:18|
 :skolemid |69|
 :pattern ( (|MultiSet#Select| (|MultiSet#Intersection| a@@7 b@@6) o@@0))
)))
(assert (forall ((x@@31 T@U) (x2@@3 T@U) ) (!  (=> (and (and (= (type x@@31) RefType) (= (type x2@@3) RefType)) (= (List x@@31) (List x2@@3))) (= x@@31 x2@@3))
 :qid |stdinbpl.919:15|
 :skolemid |148|
 :pattern ( (List x@@31) (List x2@@3))
)))
(assert (forall ((arg0@@61 T@U) ) (! (= (type (|List#sm| arg0@@61)) (FieldType PredicateType_ListType (MapType2Type RefType boolType)))
 :qid |funType:List#sm|
 :pattern ( (|List#sm| arg0@@61))
)))
(assert (forall ((x@@32 T@U) (x2@@4 T@U) ) (!  (=> (and (and (= (type x@@32) RefType) (= (type x2@@4) RefType)) (= (|List#sm| x@@32) (|List#sm| x2@@4))) (= x@@32 x2@@4))
 :qid |stdinbpl.923:15|
 :skolemid |149|
 :pattern ( (|List#sm| x@@32) (|List#sm| x2@@4))
)))
(assert (forall ((x@@33 T@U) (x2@@5 T@U) ) (!  (=> (and (and (= (type x@@33) RefType) (= (type x2@@5) RefType)) (= (Node x@@33) (Node x2@@5))) (= x@@33 x2@@5))
 :qid |stdinbpl.982:15|
 :skolemid |154|
 :pattern ( (Node x@@33) (Node x2@@5))
)))
(assert (forall ((arg0@@62 T@U) ) (! (= (type (|Node#sm| arg0@@62)) (FieldType PredicateType_NodeType (MapType2Type RefType boolType)))
 :qid |funType:Node#sm|
 :pattern ( (|Node#sm| arg0@@62))
)))
(assert (forall ((x@@34 T@U) (x2@@6 T@U) ) (!  (=> (and (and (= (type x@@34) RefType) (= (type x2@@6) RefType)) (= (|Node#sm| x@@34) (|Node#sm| x2@@6))) (= x@@34 x2@@6))
 :qid |stdinbpl.986:15|
 :skolemid |155|
 :pattern ( (|Node#sm| x@@34) (|Node#sm| x2@@6))
)))
(assert (forall ((x@@35 T@U) (x2@@7 T@U) ) (!  (=> (and (and (= (type x@@35) RefType) (= (type x2@@7) RefType)) (= (lft_T x@@35) (lft_T x2@@7))) (= x@@35 x2@@7))
 :qid |stdinbpl.1115:15|
 :skolemid |172|
 :pattern ( (lft_T x@@35) (lft_T x2@@7))
)))
(assert (forall ((arg0@@63 T@U) ) (! (= (type (|lft_T#sm| arg0@@63)) (FieldType PredicateType_lft_TType (MapType2Type RefType boolType)))
 :qid |funType:lft_T#sm|
 :pattern ( (|lft_T#sm| arg0@@63))
)))
(assert (forall ((x@@36 T@U) (x2@@8 T@U) ) (!  (=> (and (and (= (type x@@36) RefType) (= (type x2@@8) RefType)) (= (|lft_T#sm| x@@36) (|lft_T#sm| x2@@8))) (= x@@36 x2@@8))
 :qid |stdinbpl.1119:15|
 :skolemid |173|
 :pattern ( (|lft_T#sm| x@@36) (|lft_T#sm| x2@@8))
)))
(assert (forall ((x@@37 T@U) (x2@@9 T@U) ) (!  (=> (and (and (= (type x@@37) RefType) (= (type x2@@9) RefType)) (= (lft_List x@@37) (lft_List x2@@9))) (= x@@37 x2@@9))
 :qid |stdinbpl.1150:15|
 :skolemid |178|
 :pattern ( (lft_List x@@37) (lft_List x2@@9))
)))
(assert (forall ((arg0@@64 T@U) ) (! (= (type (|lft_List#sm| arg0@@64)) (FieldType PredicateType_lft_ListType (MapType2Type RefType boolType)))
 :qid |funType:lft_List#sm|
 :pattern ( (|lft_List#sm| arg0@@64))
)))
(assert (forall ((x@@38 T@U) (x2@@10 T@U) ) (!  (=> (and (and (= (type x@@38) RefType) (= (type x2@@10) RefType)) (= (|lft_List#sm| x@@38) (|lft_List#sm| x2@@10))) (= x@@38 x2@@10))
 :qid |stdinbpl.1154:15|
 :skolemid |179|
 :pattern ( (|lft_List#sm| x@@38) (|lft_List#sm| x2@@10))
)))
(assert (forall ((lft@@15 T@U) (lft2@@3 T@U) ) (!  (=> (and (and (= (type lft@@15) (MapType intType (MapType RefType realType))) (= (type lft2@@3) (MapType intType (MapType RefType realType)))) (= (LifetimeP lft@@15) (LifetimeP lft2@@3))) (= lft@@15 lft2@@3))
 :qid |stdinbpl.1211:15|
 :skolemid |184|
 :pattern ( (LifetimeP lft@@15) (LifetimeP lft2@@3))
)))
(assert (forall ((arg0@@65 T@U) ) (! (= (type (|LifetimeP#sm| arg0@@65)) (FieldType PredicateType_LifetimePType (MapType2Type RefType boolType)))
 :qid |funType:LifetimeP#sm|
 :pattern ( (|LifetimeP#sm| arg0@@65))
)))
(assert (forall ((lft@@16 T@U) (lft2@@4 T@U) ) (!  (=> (and (and (= (type lft@@16) (MapType intType (MapType RefType realType))) (= (type lft2@@4) (MapType intType (MapType RefType realType)))) (= (|LifetimeP#sm| lft@@16) (|LifetimeP#sm| lft2@@4))) (= lft@@16 lft2@@4))
 :qid |stdinbpl.1215:15|
 :skolemid |185|
 :pattern ( (|LifetimeP#sm| lft@@16) (|LifetimeP#sm| lft2@@4))
)))
(assert (forall ((x@@39 T@U) (x2@@11 T@U) ) (!  (=> (and (and (= (type x@@39) RefType) (= (type x2@@11) RefType)) (= (P x@@39) (P x2@@11))) (= x@@39 x2@@11))
 :qid |stdinbpl.1474:15|
 :skolemid |210|
 :pattern ( (P x@@39) (P x2@@11))
)))
(assert (forall ((arg0@@66 T@U) ) (! (= (type (|P#sm| arg0@@66)) (FieldType PredicateType_PType (MapType2Type RefType boolType)))
 :qid |funType:P#sm|
 :pattern ( (|P#sm| arg0@@66))
)))
(assert (forall ((x@@40 T@U) (x2@@12 T@U) ) (!  (=> (and (and (= (type x@@40) RefType) (= (type x2@@12) RefType)) (= (|P#sm| x@@40) (|P#sm| x2@@12))) (= x@@40 x2@@12))
 :qid |stdinbpl.1478:15|
 :skolemid |211|
 :pattern ( (|P#sm| x@@40) (|P#sm| x2@@12))
)))
(assert (forall ((m@@12 T@U) (u@@1 T@U) (v@@1 T@U) ) (! (let ((V@@4 (type v@@1)))
(let ((U@@4 (type u@@1)))
 (=> (and (= (type m@@12) (MapType U@@4 V@@4)) (not (U_2_bool (MapType0Select (|Map#Domain| m@@12) u@@1)))) (= (|Map#Card| (|Map#Build| m@@12 u@@1 v@@1)) (+ (|Map#Card| m@@12) 1)))))
 :qid |stdinbpl.485:21|
 :skolemid |94|
 :pattern ( (|Map#Card| (|Map#Build| m@@12 u@@1 v@@1)))
 :pattern ( (|Map#Card| m@@12) (|Map#Build| m@@12 u@@1 v@@1))
)))
(assert (forall ((Heap@@13 T@U) (ExhaleHeap@@2 T@U) (Mask@@3 T@U) (o_1@@0 T@U) (f_2 T@U) ) (! (let ((B@@1 (FieldTypeInv1 (type f_2))))
(let ((A@@1 (FieldTypeInv0 (type f_2))))
 (=> (and (and (and (and (and (and (= (type Heap@@13) (MapType1Type RefType)) (= (type ExhaleHeap@@2) (MapType1Type RefType))) (= (type Mask@@3) (MapType2Type RefType realType))) (= (type o_1@@0) RefType)) (= (type f_2) (FieldType A@@1 B@@1))) (IdenticalOnKnownLocations Heap@@13 ExhaleHeap@@2 Mask@@3)) (HasDirectPerm Mask@@3 o_1@@0 f_2)) (= (MapType1Select Heap@@13 o_1@@0 f_2) (MapType1Select ExhaleHeap@@2 o_1@@0 f_2)))))
 :qid |stdinbpl.42:22|
 :skolemid |1|
 :pattern ( (IdenticalOnKnownLocations Heap@@13 ExhaleHeap@@2 Mask@@3) (MapType1Select ExhaleHeap@@2 o_1@@0 f_2))
)))
(assert  (and (= (type dummyHeap) (MapType1Type RefType)) (= (type ZeroMask) (MapType2Type RefType realType))))
(assert (state dummyHeap ZeroMask))
(assert (forall ((arg0@@67 T@U) (arg1@@35 T@U) ) (! (let ((T@@13 (type arg1@@35)))
(= (type (|MultiSet#UnionOne| arg0@@67 arg1@@35)) (MultiSetType T@@13)))
 :qid |funType:MultiSet#UnionOne|
 :pattern ( (|MultiSet#UnionOne| arg0@@67 arg1@@35))
)))
(assert (forall ((a@@8 T@U) (x@@41 T@U) ) (! (let ((T@@14 (type x@@41)))
 (=> (= (type a@@8) (MultiSetType T@@14)) (= (|MultiSet#Card| (|MultiSet#UnionOne| a@@8 x@@41)) (+ (|MultiSet#Card| a@@8) 1))))
 :qid |stdinbpl.355:18|
 :skolemid |65|
 :pattern ( (|MultiSet#Card| (|MultiSet#UnionOne| a@@8 x@@41)))
 :pattern ( (|MultiSet#UnionOne| a@@8 x@@41) (|MultiSet#Card| a@@8))
)))
(assert (forall ((a@@9 T@U) (b@@7 T@U) ) (! (let ((T@@15 (MultiSetTypeInv0 (type a@@9))))
 (=> (and (= (type a@@9) (MultiSetType T@@15)) (= (type b@@7) (MultiSetType T@@15))) (= (|MultiSet#Disjoint| a@@9 b@@7) (forall ((o@@1 T@U) ) (!  (=> (= (type o@@1) T@@15) (or (= (|MultiSet#Select| a@@9 o@@1) 0) (= (|MultiSet#Select| b@@7 o@@1) 0)))
 :qid |stdinbpl.405:39|
 :skolemid |80|
 :pattern ( (|MultiSet#Select| a@@9 o@@1))
 :pattern ( (|MultiSet#Select| b@@7 o@@1))
)))))
 :qid |stdinbpl.404:18|
 :skolemid |81|
 :pattern ( (|MultiSet#Disjoint| a@@9 b@@7))
)))
(assert (forall ((p T@U) (v_1 T@U) (w T@U) ) (! (let ((A@@2 (FieldTypeInv0 (type p))))
 (=> (and (and (= (type p) (FieldType A@@2 FrameTypeType)) (= (type v_1) FrameTypeType)) (= (type w) FrameTypeType)) (not (InsidePredicate p v_1 p w))))
 :qid |stdinbpl.213:19|
 :skolemid |21|
 :pattern ( (InsidePredicate p v_1 p w))
)))
(assert (forall ((arg0@@68 T@U) ) (! (let ((T@@16 (type arg0@@68)))
(= (type (|MultiSet#Singleton| arg0@@68)) (MultiSetType T@@16)))
 :qid |funType:MultiSet#Singleton|
 :pattern ( (|MultiSet#Singleton| arg0@@68))
)))
(assert (forall ((r@@0 T@U) ) (!  (and (= (|MultiSet#Card| (|MultiSet#Singleton| r@@0)) 1) (= (|MultiSet#Select| (|MultiSet#Singleton| r@@0) r@@0) 1))
 :qid |stdinbpl.347:18|
 :skolemid |62|
 :pattern ( (|MultiSet#Singleton| r@@0))
)))
(assert (forall ((arg0@@69 Bool) (arg1@@36 T@U) (arg2@@16 Real) (arg3@@7 Bool) (arg4@@5 T@U) (arg5@@5 Real) ) (! (= (type (wand arg0@@69 arg1@@36 arg2@@16 arg3@@7 arg4@@5 arg5@@5)) (FieldType WandType_wandType intType))
 :qid |funType:wand|
 :pattern ( (wand arg0@@69 arg1@@36 arg2@@16 arg3@@7 arg4@@5 arg5@@5))
)))
(assert (forall ((arg1@@37 Bool) (arg2@@17 T@U) (arg3@@8 Real) (arg4@@6 Bool) (arg5@@6 T@U) (arg6@@1 Real) (arg1_2 Bool) (arg2_2 T@U) (arg3_2 Real) (arg4_2 Bool) (arg5_2 T@U) (arg6_2 Real) ) (!  (=> (and (and (and (and (= (type arg2@@17) (MapType intType (MapType RefType realType))) (= (type arg5@@6) (MapType intType (MapType RefType realType)))) (= (type arg2_2) (MapType intType (MapType RefType realType)))) (= (type arg5_2) (MapType intType (MapType RefType realType)))) (= (wand arg1@@37 arg2@@17 arg3@@8 arg4@@6 arg5@@6 arg6@@1) (wand arg1_2 arg2_2 arg3_2 arg4_2 arg5_2 arg6_2))) (and (= arg1@@37 arg1_2) (and (= arg2@@17 arg2_2) (and (= arg3@@8 arg3_2) (and (= arg4@@6 arg4_2) (and (= arg5@@6 arg5_2) (= arg6@@1 arg6_2)))))))
 :qid |stdinbpl.544:15|
 :skolemid |109|
 :pattern ( (wand arg1@@37 arg2@@17 arg3@@8 arg4@@6 arg5@@6 arg6@@1) (wand arg1_2 arg2_2 arg3_2 arg4_2 arg5_2 arg6_2))
)))
(assert  (not (IsPredicateField ref)))
(assert  (not (IsWandField ref)))
(assert  (not (IsPredicateField f_7)))
(assert  (not (IsWandField f_7)))
(assert  (not (IsPredicateField n)))
(assert  (not (IsWandField n)))
(assert (forall ((Heap@@14 T@U) (ExhaleHeap@@3 T@U) (Mask@@4 T@U) ) (!  (=> (and (and (and (= (type Heap@@14) (MapType1Type RefType)) (= (type ExhaleHeap@@3) (MapType1Type RefType))) (= (type Mask@@4) (MapType2Type RefType realType))) (IdenticalOnKnownLocations Heap@@14 ExhaleHeap@@3 Mask@@4)) (succHeap Heap@@14 ExhaleHeap@@3))
 :qid |stdinbpl.83:15|
 :skolemid |10|
 :pattern ( (IdenticalOnKnownLocations Heap@@14 ExhaleHeap@@3 Mask@@4))
)))
(assert (forall ((m@@13 T@U) (|m'| T@U) ) (! (let ((V@@5 (MapTypeInv1 (type m@@13))))
(let ((U@@5 (MapTypeInv0 (type m@@13))))
 (=> (and (and (= (type m@@13) (MapType U@@5 V@@5)) (= (type |m'|) (MapType U@@5 V@@5))) (|Map#Disjoint| m@@13 |m'|)) (forall ((o@@2 T@U) ) (!  (=> (= (type o@@2) U@@5) (or (not (U_2_bool (MapType0Select (|Map#Domain| m@@13) o@@2))) (not (U_2_bool (MapType0Select (|Map#Domain| |m'|) o@@2)))))
 :qid |stdinbpl.505:37|
 :skolemid |99|
 :pattern ( (MapType0Select (|Map#Domain| m@@13) o@@2))
 :pattern ( (MapType0Select (|Map#Domain| |m'|) o@@2))
)))))
 :qid |stdinbpl.503:21|
 :skolemid |100|
 :pattern ( (|Map#Disjoint| m@@13 |m'|))
)))
(assert (forall ((U@@6 T@T) (V@@6 T@T) ) (! (= (type (|Map#Empty| U@@6 V@@6)) (MapType U@@6 V@@6))
 :qid |funType:Map#Empty|
 :pattern ( (|Map#Empty| U@@6 V@@6))
)))
(assert (forall ((u@@2 T@U) (V@@7 T@T) ) (! (let ((U@@7 (type u@@2)))
 (not (U_2_bool (MapType0Select (|Map#Domain| (|Map#Empty| U@@7 V@@7)) u@@2))))
 :qid |stdinbpl.462:21|
 :skolemid |88|
 :pattern ( (let ((U@@7 (type u@@2)))
(MapType0Select (|Map#Domain| (|Map#Empty| U@@7 V@@7)) u@@2)))
)))
(assert (forall ((a@@10 T@U) (b@@8 T@U) ) (! (let ((T@@17 (MapType0TypeInv0 (type a@@10))))
 (=> (and (= (type a@@10) (MapType0Type T@@17 boolType)) (= (type b@@8) (MapType0Type T@@17 boolType))) (= (|Set#Equal| a@@10 b@@8) (forall ((o@@3 T@U) ) (!  (=> (= (type o@@3) T@@17) (= (U_2_bool (MapType0Select a@@10 o@@3)) (U_2_bool (MapType0Select b@@8 o@@3))))
 :qid |stdinbpl.300:31|
 :skolemid |48|
 :pattern ( (MapType0Select a@@10 o@@3))
 :pattern ( (MapType0Select b@@8 o@@3))
)))))
 :qid |stdinbpl.299:17|
 :skolemid |49|
 :pattern ( (|Set#Equal| a@@10 b@@8))
)))
(assert (forall ((ResultMask T@U) (SummandMask1 T@U) (SummandMask2 T@U) (o_2 T@U) (f_4 T@U) ) (! (let ((B@@2 (FieldTypeInv1 (type f_4))))
(let ((A@@3 (FieldTypeInv0 (type f_4))))
 (=> (and (and (and (and (and (= (type ResultMask) (MapType2Type RefType realType)) (= (type SummandMask1) (MapType2Type RefType realType))) (= (type SummandMask2) (MapType2Type RefType realType))) (= (type o_2) RefType)) (= (type f_4) (FieldType A@@3 B@@2))) (sumMask ResultMask SummandMask1 SummandMask2)) (= (U_2_real (MapType2Select ResultMask o_2 f_4)) (+ (U_2_real (MapType2Select SummandMask1 o_2 f_4)) (U_2_real (MapType2Select SummandMask2 o_2 f_4)))))))
 :qid |stdinbpl.138:22|
 :skolemid |18|
 :pattern ( (sumMask ResultMask SummandMask1 SummandMask2) (MapType2Select ResultMask o_2 f_4))
 :pattern ( (sumMask ResultMask SummandMask1 SummandMask2) (MapType2Select SummandMask1 o_2 f_4))
 :pattern ( (sumMask ResultMask SummandMask1 SummandMask2) (MapType2Select SummandMask2 o_2 f_4))
)))
(assert (forall ((a@@11 T@U) (b@@9 T@U) ) (! (let ((T@@18 (MultiSetTypeInv0 (type a@@11))))
 (=> (and (= (type a@@11) (MultiSetType T@@18)) (= (type b@@9) (MultiSetType T@@18))) (= (|MultiSet#Card| (|MultiSet#Union| a@@11 b@@9)) (+ (|MultiSet#Card| a@@11) (|MultiSet#Card| b@@9)))))
 :qid |stdinbpl.365:18|
 :skolemid |68|
 :pattern ( (|MultiSet#Card| (|MultiSet#Union| a@@11 b@@9)))
 :pattern ( (|MultiSet#Card| a@@11) (|MultiSet#Union| a@@11 b@@9))
 :pattern ( (|MultiSet#Card| b@@9) (|MultiSet#Union| a@@11 b@@9))
)))
(assert (forall ((arg0@@70 T@U) (arg1@@38 Real) (arg2@@18 T@U) (arg3@@9 Real) (arg4@@7 T@U) (arg5@@7 T@U) ) (! (= (type (wand_1 arg0@@70 arg1@@38 arg2@@18 arg3@@9 arg4@@7 arg5@@7)) (FieldType WandType_wand_1Type intType))
 :qid |funType:wand_1|
 :pattern ( (wand_1 arg0@@70 arg1@@38 arg2@@18 arg3@@9 arg4@@7 arg5@@7))
)))
(assert (forall ((arg1@@39 T@U) (arg2@@19 Real) (arg3@@10 T@U) (arg4@@8 Real) (arg5@@8 T@U) (arg6@@2 T@U) (arg1_2@@0 T@U) (arg2_2@@0 Real) (arg3_2@@0 T@U) (arg4_2@@0 Real) (arg5_2@@0 T@U) (arg6_2@@0 T@U) ) (!  (=> (and (and (and (and (and (and (and (and (= (type arg1@@39) RefType) (= (type arg3@@10) RefType)) (= (type arg5@@8) RefType)) (= (type arg6@@2) RefType)) (= (type arg1_2@@0) RefType)) (= (type arg3_2@@0) RefType)) (= (type arg5_2@@0) RefType)) (= (type arg6_2@@0) RefType)) (= (wand_1 arg1@@39 arg2@@19 arg3@@10 arg4@@8 arg5@@8 arg6@@2) (wand_1 arg1_2@@0 arg2_2@@0 arg3_2@@0 arg4_2@@0 arg5_2@@0 arg6_2@@0))) (and (= arg1@@39 arg1_2@@0) (and (= arg2@@19 arg2_2@@0) (and (= arg3@@10 arg3_2@@0) (and (= arg4@@8 arg4_2@@0) (and (= arg5@@8 arg5_2@@0) (= arg6@@2 arg6_2@@0)))))))
 :qid |stdinbpl.576:15|
 :skolemid |116|
 :pattern ( (wand_1 arg1@@39 arg2@@19 arg3@@10 arg4@@8 arg5@@8 arg6@@2) (wand_1 arg1_2@@0 arg2_2@@0 arg3_2@@0 arg4_2@@0 arg5_2@@0 arg6_2@@0))
)))
(assert  (and (forall ((arg0@@71 Real) (arg1@@40 T@U) ) (! (= (type (ConditionalFrame arg0@@71 arg1@@40)) FrameTypeType)
 :qid |funType:ConditionalFrame|
 :pattern ( (ConditionalFrame arg0@@71 arg1@@40))
)) (= (type EmptyFrame) FrameTypeType)))
(assert (forall ((p@@0 Real) (f_6 T@U) ) (!  (=> (= (type f_6) FrameTypeType) (= (ConditionalFrame p@@0 f_6) (ite (> p@@0 0.0) f_6 EmptyFrame)))
 :qid |stdinbpl.201:15|
 :skolemid |19|
 :pattern ( (ConditionalFrame p@@0 f_6))
)))
(assert (forall ((Mask@@5 T@U) (o_2@@0 T@U) (f_4@@0 T@U) ) (! (let ((B@@3 (FieldTypeInv1 (type f_4@@0))))
(let ((A@@4 (FieldTypeInv0 (type f_4@@0))))
 (=> (and (and (= (type Mask@@5) (MapType2Type RefType realType)) (= (type o_2@@0) RefType)) (= (type f_4@@0) (FieldType A@@4 B@@3))) (= (HasDirectPerm Mask@@5 o_2@@0 f_4@@0) (> (U_2_real (MapType2Select Mask@@5 o_2@@0 f_4@@0)) NoPerm)))))
 :qid |stdinbpl.133:22|
 :skolemid |17|
 :pattern ( (HasDirectPerm Mask@@5 o_2@@0 f_4@@0))
)))
(assert (forall ((m@@14 T@U) (u@@3 T@U) ) (! (let ((V@@8 (MapTypeInv1 (type m@@14))))
(let ((U@@8 (type u@@3)))
 (=> (and (= (type m@@14) (MapType U@@8 V@@8)) (U_2_bool (MapType0Select (|Map#Domain| m@@14) u@@3))) (U_2_bool (MapType0Select (|Map#Values| m@@14) (MapType0Select (|Map#Elements| m@@14) u@@3))))))
 :qid |stdinbpl.449:20|
 :skolemid |86|
 :pattern ( (MapType0Select (|Map#Elements| m@@14) u@@3))
)))
(assert (forall ((arg0@@72 Int) (arg1@@41 Int) ) (! (= (type (|sk_LifetimeP#condqp1| arg0@@72 arg1@@41)) RefType)
 :qid |funType:sk_LifetimeP#condqp1|
 :pattern ( (|sk_LifetimeP#condqp1| arg0@@72 arg1@@41))
)))
(assert (forall ((Heap2Heap T@U) (Heap1Heap T@U) (lft@@17 T@U) ) (!  (=> (and (and (and (= (type Heap2Heap) (MapType1Type RefType)) (= (type Heap1Heap) (MapType1Type RefType))) (= (type lft@@17) (MapType intType (MapType RefType realType)))) (and (=  (and (U_2_bool (MapType0Select (|Map#Domain| (MapType0Select (|Map#Elements| lft@@17) (int_2_U 0))) (|sk_LifetimeP#condqp1| (|LifetimeP#condqp1| Heap2Heap lft@@17) (|LifetimeP#condqp1| Heap1Heap lft@@17)))) (< NoPerm (U_2_real (MapType0Select (|Map#Elements| (MapType0Select (|Map#Elements| lft@@17) (int_2_U 0))) (|sk_LifetimeP#condqp1| (|LifetimeP#condqp1| Heap2Heap lft@@17) (|LifetimeP#condqp1| Heap1Heap lft@@17))))))  (and (U_2_bool (MapType0Select (|Map#Domain| (MapType0Select (|Map#Elements| lft@@17) (int_2_U 0))) (|sk_LifetimeP#condqp1| (|LifetimeP#condqp1| Heap2Heap lft@@17) (|LifetimeP#condqp1| Heap1Heap lft@@17)))) (< NoPerm (U_2_real (MapType0Select (|Map#Elements| (MapType0Select (|Map#Elements| lft@@17) (int_2_U 0))) (|sk_LifetimeP#condqp1| (|LifetimeP#condqp1| Heap2Heap lft@@17) (|LifetimeP#condqp1| Heap1Heap lft@@17))))))) (=> (and (U_2_bool (MapType0Select (|Map#Domain| (MapType0Select (|Map#Elements| lft@@17) (int_2_U 0))) (|sk_LifetimeP#condqp1| (|LifetimeP#condqp1| Heap2Heap lft@@17) (|LifetimeP#condqp1| Heap1Heap lft@@17)))) (< NoPerm (U_2_real (MapType0Select (|Map#Elements| (MapType0Select (|Map#Elements| lft@@17) (int_2_U 0))) (|sk_LifetimeP#condqp1| (|LifetimeP#condqp1| Heap2Heap lft@@17) (|LifetimeP#condqp1| Heap1Heap lft@@17)))))) (= (MapType1Select Heap2Heap null (lft_T (|sk_LifetimeP#condqp1| (|LifetimeP#condqp1| Heap2Heap lft@@17) (|LifetimeP#condqp1| Heap1Heap lft@@17)))) (MapType1Select Heap1Heap null (lft_T (|sk_LifetimeP#condqp1| (|LifetimeP#condqp1| Heap2Heap lft@@17) (|LifetimeP#condqp1| Heap1Heap lft@@17)))))))) (= (|LifetimeP#condqp1| Heap2Heap lft@@17) (|LifetimeP#condqp1| Heap1Heap lft@@17)))
 :qid |stdinbpl.1231:15|
 :skolemid |187|
 :pattern ( (|LifetimeP#condqp1| Heap2Heap lft@@17) (|LifetimeP#condqp1| Heap1Heap lft@@17) (succHeapTrans Heap2Heap Heap1Heap))
)))
(assert (forall ((arg0@@73 T@U) (arg1@@42 T@U) (arg2@@20 T@U) ) (! (= (type (get_disc arg0@@73 arg1@@42 arg2@@20)) RefType)
 :qid |funType:get_disc|
 :pattern ( (get_disc arg0@@73 arg1@@42 arg2@@20))
)))
(assert (forall ((Heap@@15 T@U) (x@@42 T@U) (lft@@18 T@U) ) (!  (=> (and (and (= (type Heap@@15) (MapType1Type RefType)) (= (type x@@42) RefType)) (= (type lft@@18) (MapType intType (MapType RefType realType)))) (and (= (get_disc Heap@@15 x@@42 lft@@18) (|get_disc'| Heap@@15 x@@42 lft@@18)) (dummyFunction (|get_disc#triggerStateless| x@@42 lft@@18))))
 :qid |stdinbpl.651:15|
 :skolemid |121|
 :pattern ( (get_disc Heap@@15 x@@42 lft@@18))
)))
(assert (forall ((arg0@@74 Int) (arg1@@43 Int) ) (! (= (type (|sk_LifetimeP#condqp2| arg0@@74 arg1@@43)) RefType)
 :qid |funType:sk_LifetimeP#condqp2|
 :pattern ( (|sk_LifetimeP#condqp2| arg0@@74 arg1@@43))
)))
(assert (forall ((Heap2Heap@@0 T@U) (Heap1Heap@@0 T@U) (lft@@19 T@U) ) (!  (=> (and (and (and (= (type Heap2Heap@@0) (MapType1Type RefType)) (= (type Heap1Heap@@0) (MapType1Type RefType))) (= (type lft@@19) (MapType intType (MapType RefType realType)))) (and (=  (and (U_2_bool (MapType0Select (|Map#Domain| (MapType0Select (|Map#Elements| lft@@19) (int_2_U 1))) (|sk_LifetimeP#condqp2| (|LifetimeP#condqp2| Heap2Heap@@0 lft@@19) (|LifetimeP#condqp2| Heap1Heap@@0 lft@@19)))) (< NoPerm (U_2_real (MapType0Select (|Map#Elements| (MapType0Select (|Map#Elements| lft@@19) (int_2_U 1))) (|sk_LifetimeP#condqp2| (|LifetimeP#condqp2| Heap2Heap@@0 lft@@19) (|LifetimeP#condqp2| Heap1Heap@@0 lft@@19))))))  (and (U_2_bool (MapType0Select (|Map#Domain| (MapType0Select (|Map#Elements| lft@@19) (int_2_U 1))) (|sk_LifetimeP#condqp2| (|LifetimeP#condqp2| Heap2Heap@@0 lft@@19) (|LifetimeP#condqp2| Heap1Heap@@0 lft@@19)))) (< NoPerm (U_2_real (MapType0Select (|Map#Elements| (MapType0Select (|Map#Elements| lft@@19) (int_2_U 1))) (|sk_LifetimeP#condqp2| (|LifetimeP#condqp2| Heap2Heap@@0 lft@@19) (|LifetimeP#condqp2| Heap1Heap@@0 lft@@19))))))) (=> (and (U_2_bool (MapType0Select (|Map#Domain| (MapType0Select (|Map#Elements| lft@@19) (int_2_U 1))) (|sk_LifetimeP#condqp2| (|LifetimeP#condqp2| Heap2Heap@@0 lft@@19) (|LifetimeP#condqp2| Heap1Heap@@0 lft@@19)))) (< NoPerm (U_2_real (MapType0Select (|Map#Elements| (MapType0Select (|Map#Elements| lft@@19) (int_2_U 1))) (|sk_LifetimeP#condqp2| (|LifetimeP#condqp2| Heap2Heap@@0 lft@@19) (|LifetimeP#condqp2| Heap1Heap@@0 lft@@19)))))) (= (MapType1Select Heap2Heap@@0 null (lft_List (|sk_LifetimeP#condqp2| (|LifetimeP#condqp2| Heap2Heap@@0 lft@@19) (|LifetimeP#condqp2| Heap1Heap@@0 lft@@19)))) (MapType1Select Heap1Heap@@0 null (lft_List (|sk_LifetimeP#condqp2| (|LifetimeP#condqp2| Heap2Heap@@0 lft@@19) (|LifetimeP#condqp2| Heap1Heap@@0 lft@@19)))))))) (= (|LifetimeP#condqp2| Heap2Heap@@0 lft@@19) (|LifetimeP#condqp2| Heap1Heap@@0 lft@@19)))
 :qid |stdinbpl.1242:15|
 :skolemid |188|
 :pattern ( (|LifetimeP#condqp2| Heap2Heap@@0 lft@@19) (|LifetimeP#condqp2| Heap1Heap@@0 lft@@19) (succHeapTrans Heap2Heap@@0 Heap1Heap@@0))
)))
(assert (forall ((arg1@@44 Bool) (arg2@@21 T@U) (arg3@@11 Real) (arg4@@9 Bool) (arg5@@9 T@U) (arg6@@3 Real) ) (!  (=> (and (= (type arg2@@21) (MapType intType (MapType RefType realType))) (= (type arg5@@9) (MapType intType (MapType RefType realType)))) (= (getPredWandId (wand arg1@@44 arg2@@21 arg3@@11 arg4@@9 arg5@@9 arg6@@3)) 8))
 :qid |stdinbpl.540:15|
 :skolemid |108|
 :pattern ( (wand arg1@@44 arg2@@21 arg3@@11 arg4@@9 arg5@@9 arg6@@3))
)))
(assert (forall ((arg1@@45 T@U) (arg2@@22 Real) (arg3@@12 T@U) (arg4@@10 Real) (arg5@@10 T@U) (arg6@@4 T@U) ) (!  (=> (and (and (and (= (type arg1@@45) RefType) (= (type arg3@@12) RefType)) (= (type arg5@@10) RefType)) (= (type arg6@@4) RefType)) (= (getPredWandId (wand_1 arg1@@45 arg2@@22 arg3@@12 arg4@@10 arg5@@10 arg6@@4)) 9))
 :qid |stdinbpl.572:15|
 :skolemid |115|
 :pattern ( (wand_1 arg1@@45 arg2@@22 arg3@@12 arg4@@10 arg5@@10 arg6@@4))
)))
(assert (forall ((o_2@@1 T@U) (f_4@@1 T@U) ) (! (let ((B@@4 (FieldTypeInv1 (type f_4@@1))))
(let ((A@@5 (FieldTypeInv0 (type f_4@@1))))
 (=> (and (= (type o_2@@1) RefType) (= (type f_4@@1) (FieldType A@@5 B@@4))) (= (U_2_real (MapType2Select ZeroMask o_2@@1 f_4@@1)) NoPerm))))
 :qid |stdinbpl.106:22|
 :skolemid |13|
 :pattern ( (MapType2Select ZeroMask o_2@@1 f_4@@1))
)))
(assert (forall ((a@@12 T@U) (b@@10 T@U) (o@@4 T@U) ) (! (let ((T@@19 (type o@@4)))
 (=> (and (= (type a@@12) (MapType0Type T@@19 boolType)) (= (type b@@10) (MapType0Type T@@19 boolType))) (= (U_2_bool (MapType0Select (|Set#Intersection| a@@12 b@@10) o@@4))  (and (U_2_bool (MapType0Select a@@12 o@@4)) (U_2_bool (MapType0Select b@@10 o@@4))))))
 :qid |stdinbpl.264:18|
 :skolemid |37|
 :pattern ( (MapType0Select (|Set#Intersection| a@@12 b@@10) o@@4))
 :pattern ( (|Set#Intersection| a@@12 b@@10) (MapType0Select a@@12 o@@4))
 :pattern ( (|Set#Intersection| a@@12 b@@10) (MapType0Select b@@10 o@@4))
)))
(assert (forall ((arg0@@75 T@U) (arg1@@46 T@U) ) (! (let ((T@@20 (MapType0TypeInv0 (type arg0@@75))))
(= (type (|Set#Difference| arg0@@75 arg1@@46)) (MapType0Type T@@20 boolType)))
 :qid |funType:Set#Difference|
 :pattern ( (|Set#Difference| arg0@@75 arg1@@46))
)))
(assert (forall ((a@@13 T@U) (b@@11 T@U) (o@@5 T@U) ) (! (let ((T@@21 (type o@@5)))
 (=> (and (= (type a@@13) (MapType0Type T@@21 boolType)) (= (type b@@11) (MapType0Type T@@21 boolType))) (= (U_2_bool (MapType0Select (|Set#Difference| a@@13 b@@11) o@@5))  (and (U_2_bool (MapType0Select a@@13 o@@5)) (not (U_2_bool (MapType0Select b@@11 o@@5)))))))
 :qid |stdinbpl.279:18|
 :skolemid |43|
 :pattern ( (MapType0Select (|Set#Difference| a@@13 b@@11) o@@5))
 :pattern ( (|Set#Difference| a@@13 b@@11) (MapType0Select a@@13 o@@5))
)))
(assert (forall ((arg1@@47 Bool) (arg2@@23 T@U) (arg3@@13 Real) (arg4@@11 Bool) (arg5@@11 T@U) (arg6@@5 Real) ) (!  (=> (and (= (type arg2@@23) (MapType intType (MapType RefType realType))) (= (type arg5@@11) (MapType intType (MapType RefType realType)))) (IsWandField (wand arg1@@47 arg2@@23 arg3@@13 arg4@@11 arg5@@11 arg6@@5)))
 :qid |stdinbpl.520:15|
 :skolemid |103|
 :pattern ( (wand arg1@@47 arg2@@23 arg3@@13 arg4@@11 arg5@@11 arg6@@5))
)))
(assert (forall ((arg1@@48 Bool) (arg2@@24 T@U) (arg3@@14 Real) (arg4@@12 Bool) (arg5@@12 T@U) (arg6@@6 Real) ) (!  (=> (and (= (type arg2@@24) (MapType intType (MapType RefType realType))) (= (type arg5@@12) (MapType intType (MapType RefType realType)))) (IsWandField (|wand#ft| arg1@@48 arg2@@24 arg3@@14 arg4@@12 arg5@@12 arg6@@6)))
 :qid |stdinbpl.524:15|
 :skolemid |104|
 :pattern ( (|wand#ft| arg1@@48 arg2@@24 arg3@@14 arg4@@12 arg5@@12 arg6@@6))
)))
(assert (forall ((arg1@@49 T@U) (arg2@@25 Real) (arg3@@15 T@U) (arg4@@13 Real) (arg5@@13 T@U) (arg6@@7 T@U) ) (!  (=> (and (and (and (= (type arg1@@49) RefType) (= (type arg3@@15) RefType)) (= (type arg5@@13) RefType)) (= (type arg6@@7) RefType)) (IsWandField (wand_1 arg1@@49 arg2@@25 arg3@@15 arg4@@13 arg5@@13 arg6@@7)))
 :qid |stdinbpl.552:15|
 :skolemid |110|
 :pattern ( (wand_1 arg1@@49 arg2@@25 arg3@@15 arg4@@13 arg5@@13 arg6@@7))
)))
(assert (forall ((arg1@@50 T@U) (arg2@@26 Real) (arg3@@16 T@U) (arg4@@14 Real) (arg5@@14 T@U) (arg6@@8 T@U) ) (!  (=> (and (and (and (= (type arg1@@50) RefType) (= (type arg3@@16) RefType)) (= (type arg5@@14) RefType)) (= (type arg6@@8) RefType)) (IsWandField (|wand_1#ft| arg1@@50 arg2@@26 arg3@@16 arg4@@14 arg5@@14 arg6@@8)))
 :qid |stdinbpl.556:15|
 :skolemid |111|
 :pattern ( (|wand_1#ft| arg1@@50 arg2@@26 arg3@@16 arg4@@14 arg5@@14 arg6@@8))
)))
(assert (forall ((m@@15 T@U) (u@@4 T@U) ) (! (let ((V@@9 (MapTypeInv1 (type m@@15))))
(let ((U@@9 (type u@@4)))
 (=> (and (= (type m@@15) (MapType U@@9 V@@9)) (U_2_bool (MapType0Select (|Map#Domain| m@@15) u@@4))) (> (|Set#Card| (|Map#Values| m@@15)) 0))))
 :qid |stdinbpl.455:20|
 :skolemid |87|
 :pattern ( (MapType0Select (|Map#Domain| m@@15) u@@4))
 :pattern ( (MapType0Select (|Map#Elements| m@@15) u@@4))
)))
(assert (forall ((arg1@@51 Bool) (arg2@@27 T@U) (arg3@@17 Real) (arg4@@15 Bool) (arg5@@15 T@U) (arg6@@9 Real) ) (!  (=> (and (= (type arg2@@27) (MapType intType (MapType RefType realType))) (= (type arg5@@15) (MapType intType (MapType RefType realType)))) (not (IsPredicateField (wand arg1@@51 arg2@@27 arg3@@17 arg4@@15 arg5@@15 arg6@@9))))
 :qid |stdinbpl.528:15|
 :skolemid |105|
 :pattern ( (wand arg1@@51 arg2@@27 arg3@@17 arg4@@15 arg5@@15 arg6@@9))
)))
(assert (forall ((arg1@@52 Bool) (arg2@@28 T@U) (arg3@@18 Real) (arg4@@16 Bool) (arg5@@16 T@U) (arg6@@10 Real) ) (!  (=> (and (= (type arg2@@28) (MapType intType (MapType RefType realType))) (= (type arg5@@16) (MapType intType (MapType RefType realType)))) (not (IsPredicateField (|wand#ft| arg1@@52 arg2@@28 arg3@@18 arg4@@16 arg5@@16 arg6@@10))))
 :qid |stdinbpl.532:15|
 :skolemid |106|
 :pattern ( (|wand#ft| arg1@@52 arg2@@28 arg3@@18 arg4@@16 arg5@@16 arg6@@10))
)))
(assert (forall ((arg1@@53 T@U) (arg2@@29 Real) (arg3@@19 T@U) (arg4@@17 Real) (arg5@@17 T@U) (arg6@@11 T@U) ) (!  (=> (and (and (and (= (type arg1@@53) RefType) (= (type arg3@@19) RefType)) (= (type arg5@@17) RefType)) (= (type arg6@@11) RefType)) (not (IsPredicateField (wand_1 arg1@@53 arg2@@29 arg3@@19 arg4@@17 arg5@@17 arg6@@11))))
 :qid |stdinbpl.560:15|
 :skolemid |112|
 :pattern ( (wand_1 arg1@@53 arg2@@29 arg3@@19 arg4@@17 arg5@@17 arg6@@11))
)))
(assert (forall ((arg1@@54 T@U) (arg2@@30 Real) (arg3@@20 T@U) (arg4@@18 Real) (arg5@@18 T@U) (arg6@@12 T@U) ) (!  (=> (and (and (and (= (type arg1@@54) RefType) (= (type arg3@@20) RefType)) (= (type arg5@@18) RefType)) (= (type arg6@@12) RefType)) (not (IsPredicateField (|wand_1#ft| arg1@@54 arg2@@30 arg3@@20 arg4@@18 arg5@@18 arg6@@12))))
 :qid |stdinbpl.564:15|
 :skolemid |113|
 :pattern ( (|wand_1#ft| arg1@@54 arg2@@30 arg3@@20 arg4@@18 arg5@@18 arg6@@12))
)))
(assert (forall ((a@@14 T@U) (b@@12 T@U) ) (! (let ((T@@22 (MapType0TypeInv0 (type a@@14))))
 (=> (and (and (= (type a@@14) (MapType0Type T@@22 boolType)) (= (type b@@12) (MapType0Type T@@22 boolType))) (|Set#Equal| a@@14 b@@12)) (= a@@14 b@@12)))
 :qid |stdinbpl.301:17|
 :skolemid |50|
 :pattern ( (|Set#Equal| a@@14 b@@12))
)))
(assert (forall ((a@@15 T@U) (b@@13 T@U) ) (! (let ((T@@23 (MultiSetTypeInv0 (type a@@15))))
 (=> (and (and (= (type a@@15) (MultiSetType T@@23)) (= (type b@@13) (MultiSetType T@@23))) (|MultiSet#Equal| a@@15 b@@13)) (= a@@15 b@@13)))
 :qid |stdinbpl.400:17|
 :skolemid |79|
 :pattern ( (|MultiSet#Equal| a@@15 b@@13))
)))
(assert (forall ((m@@16 T@U) (|m'@@0| T@U) ) (! (let ((V@@10 (MapTypeInv1 (type m@@16))))
(let ((U@@10 (MapTypeInv0 (type m@@16))))
 (=> (and (and (= (type m@@16) (MapType U@@10 V@@10)) (= (type |m'@@0|) (MapType U@@10 V@@10))) (|Map#Equal| m@@16 |m'@@0|)) (= m@@16 |m'@@0|))))
 :qid |stdinbpl.497:21|
 :skolemid |98|
 :pattern ( (|Map#Equal| m@@16 |m'@@0|))
)))
(assert (forall ((arg0@@76 T@U) (arg1@@55 T@U) ) (! (let ((T@@24 (type arg1@@55)))
(= (type (|Set#UnionOne| arg0@@76 arg1@@55)) (MapType0Type T@@24 boolType)))
 :qid |funType:Set#UnionOne|
 :pattern ( (|Set#UnionOne| arg0@@76 arg1@@55))
)))
(assert (forall ((a@@16 T@U) (x@@43 T@U) (y@@2 T@U) ) (! (let ((T@@25 (type x@@43)))
 (=> (and (and (= (type a@@16) (MapType0Type T@@25 boolType)) (= (type y@@2) T@@25)) (U_2_bool (MapType0Select a@@16 y@@2))) (U_2_bool (MapType0Select (|Set#UnionOne| a@@16 x@@43) y@@2))))
 :qid |stdinbpl.244:18|
 :skolemid |31|
 :pattern ( (|Set#UnionOne| a@@16 x@@43) (MapType0Select a@@16 y@@2))
)))
(assert (forall ((a@@17 T@U) (b@@14 T@U) (y@@3 T@U) ) (! (let ((T@@26 (type y@@3)))
 (=> (and (and (= (type a@@17) (MapType0Type T@@26 boolType)) (= (type b@@14) (MapType0Type T@@26 boolType))) (U_2_bool (MapType0Select a@@17 y@@3))) (U_2_bool (MapType0Select (|Set#Union| a@@17 b@@14) y@@3))))
 :qid |stdinbpl.254:18|
 :skolemid |35|
 :pattern ( (|Set#Union| a@@17 b@@14) (MapType0Select a@@17 y@@3))
)))
(assert (forall ((a@@18 T@U) (b@@15 T@U) (y@@4 T@U) ) (! (let ((T@@27 (type y@@4)))
 (=> (and (and (= (type a@@18) (MapType0Type T@@27 boolType)) (= (type b@@15) (MapType0Type T@@27 boolType))) (U_2_bool (MapType0Select b@@15 y@@4))) (U_2_bool (MapType0Select (|Set#Union| a@@18 b@@15) y@@4))))
 :qid |stdinbpl.256:18|
 :skolemid |36|
 :pattern ( (|Set#Union| a@@18 b@@15) (MapType0Select b@@15 y@@4))
)))
(assert (forall ((ms T@U) (x@@44 T@U) ) (! (let ((T@@28 (type x@@44)))
 (=> (= (type ms) (MultiSetType T@@28)) (>= (|MultiSet#Select| ms x@@44) 0)))
 :qid |stdinbpl.331:18|
 :skolemid |56|
 :pattern ( (|MultiSet#Select| ms x@@44))
)))
(assert (forall ((a@@19 T@U) (x@@45 T@U) (o@@6 T@U) ) (! (let ((T@@29 (type x@@45)))
 (=> (and (= (type a@@19) (MapType0Type T@@29 boolType)) (= (type o@@6) T@@29)) (= (U_2_bool (MapType0Select (|Set#UnionOne| a@@19 x@@45) o@@6))  (or (= o@@6 x@@45) (U_2_bool (MapType0Select a@@19 o@@6))))))
 :qid |stdinbpl.240:18|
 :skolemid |29|
 :pattern ( (MapType0Select (|Set#UnionOne| a@@19 x@@45) o@@6))
)))
(assert (forall ((a@@20 T@U) (b@@16 T@U) (y@@5 T@U) ) (! (let ((T@@30 (type y@@5)))
 (=> (and (and (= (type a@@20) (MapType0Type T@@30 boolType)) (= (type b@@16) (MapType0Type T@@30 boolType))) (U_2_bool (MapType0Select b@@16 y@@5))) (not (U_2_bool (MapType0Select (|Set#Difference| a@@20 b@@16) y@@5)))))
 :qid |stdinbpl.281:18|
 :skolemid |44|
 :pattern ( (|Set#Difference| a@@20 b@@16) (MapType0Select b@@16 y@@5))
)))
(assert (forall ((Heap@@16 T@U) (Mask@@6 T@U) (lft@@20 T@U) ) (!  (=> (and (and (and (= (type Heap@@16) (MapType1Type RefType)) (= (type Mask@@6) (MapType2Type RefType realType))) (= (type lft@@20) (MapType intType (MapType RefType realType)))) (and (state Heap@@16 Mask@@6) (< AssumeFunctionsAbove 1))) (= (valid_lft Heap@@16 lft@@20)  (and (U_2_bool (MapType0Select (|Map#Domain| lft@@20) (int_2_U 0))) (U_2_bool (MapType0Select (|Map#Domain| lft@@20) (int_2_U 1))))))
 :qid |stdinbpl.612:15|
 :skolemid |119|
 :pattern ( (state Heap@@16 Mask@@6) (valid_lft Heap@@16 lft@@20))
)))
(assert (forall ((Heap@@17 T@U) (Mask@@7 T@U) (lft@@21 T@U) ) (!  (=> (and (and (and (= (type Heap@@17) (MapType1Type RefType)) (= (type Mask@@7) (MapType2Type RefType realType))) (= (type lft@@21) (MapType intType (MapType RefType realType)))) (state Heap@@17 Mask@@7)) (= (|valid_lft'| Heap@@17 lft@@21) (|valid_lft#frame| EmptyFrame lft@@21)))
 :qid |stdinbpl.619:15|
 :skolemid |120|
 :pattern ( (state Heap@@17 Mask@@7) (|valid_lft'| Heap@@17 lft@@21))
)))
(assert (forall ((m@@17 T@U) (|m'@@1| T@U) ) (! (let ((V@@11 (MapTypeInv1 (type m@@17))))
(let ((U@@11 (MapTypeInv0 (type m@@17))))
 (=> (and (and (= (type m@@17) (MapType U@@11 V@@11)) (= (type |m'@@1|) (MapType U@@11 V@@11))) (and (forall ((u@@5 T@U) ) (!  (=> (= (type u@@5) U@@11) (= (U_2_bool (MapType0Select (|Map#Domain| m@@17) u@@5)) (U_2_bool (MapType0Select (|Map#Domain| |m'@@1|) u@@5))))
 :qid |stdinbpl.494:12|
 :skolemid |95|
 :no-pattern (type u@@5)
 :no-pattern (U_2_int u@@5)
 :no-pattern (U_2_bool u@@5)
)) (forall ((u@@6 T@U) ) (!  (=> (and (= (type u@@6) U@@11) (U_2_bool (MapType0Select (|Map#Domain| m@@17) u@@6))) (= (MapType0Select (|Map#Elements| m@@17) u@@6) (MapType0Select (|Map#Elements| |m'@@1|) u@@6)))
 :qid |stdinbpl.495:14|
 :skolemid |96|
 :no-pattern (type u@@6)
 :no-pattern (U_2_int u@@6)
 :no-pattern (U_2_bool u@@6)
)))) (|Map#Equal| m@@17 |m'@@1|))))
 :qid |stdinbpl.492:21|
 :skolemid |97|
 :pattern ( (|Map#Equal| m@@17 |m'@@1|))
)))
(assert (forall ((a@@21 T@U) (b@@17 T@U) ) (! (let ((T@@31 (MapType0TypeInv0 (type a@@21))))
 (=> (and (= (type a@@21) (MapType0Type T@@31 boolType)) (= (type b@@17) (MapType0Type T@@31 boolType))) (and (= (+ (+ (|Set#Card| (|Set#Difference| a@@21 b@@17)) (|Set#Card| (|Set#Difference| b@@17 a@@21))) (|Set#Card| (|Set#Intersection| a@@21 b@@17))) (|Set#Card| (|Set#Union| a@@21 b@@17))) (= (|Set#Card| (|Set#Difference| a@@21 b@@17)) (- (|Set#Card| a@@21) (|Set#Card| (|Set#Intersection| a@@21 b@@17)))))))
 :qid |stdinbpl.283:18|
 :skolemid |45|
 :pattern ( (|Set#Card| (|Set#Difference| a@@21 b@@17)))
)))
(assert (forall ((Heap@@18 T@U) (Mask@@8 T@U) (x@@46 T@U) (lft@@22 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@18) (MapType1Type RefType)) (= (type Mask@@8) (MapType2Type RefType realType))) (= (type x@@46) RefType)) (= (type lft@@22) (MapType intType (MapType RefType realType)))) (and (state Heap@@18 Mask@@8) (< AssumeFunctionsAbove 0))) (and (valid_lft Heap@@18 lft@@22) (and (valid_lft Heap@@18 lft@@22) (U_2_bool (MapType0Select (|Map#Domain| (MapType0Select (|Map#Elements| lft@@22) (int_2_U 1))) x@@46))))) (= (get_disc Heap@@18 x@@46 lft@@22) (MapType1Select Heap@@18 x@@46 ref)))
 :qid |stdinbpl.661:15|
 :skolemid |123|
 :pattern ( (state Heap@@18 Mask@@8) (get_disc Heap@@18 x@@46 lft@@22))
 :pattern ( (state Heap@@18 Mask@@8) (|get_disc#triggerStateless| x@@46 lft@@22) (|LifetimeP#trigger| Heap@@18 (LifetimeP lft@@22)))
)))
(assert (forall ((s T@U) ) (! (let ((T@@32 (MapType0TypeInv0 (type s))))
 (=> (= (type s) (MapType0Type T@@32 boolType)) (<= 0 (|Set#Card| s))))
 :qid |stdinbpl.226:18|
 :skolemid |22|
 :pattern ( (|Set#Card| s))
)))
(assert (forall ((s@@0 T@U) ) (! (let ((T@@33 (MultiSetTypeInv0 (type s@@0))))
 (=> (= (type s@@0) (MultiSetType T@@33)) (<= 0 (|MultiSet#Card| s@@0))))
 :qid |stdinbpl.334:18|
 :skolemid |57|
 :pattern ( (|MultiSet#Card| s@@0))
)))
(assert (forall ((m@@18 T@U) ) (! (let ((V@@12 (MapTypeInv1 (type m@@18))))
(let ((U@@12 (MapTypeInv0 (type m@@18))))
 (=> (= (type m@@18) (MapType U@@12 V@@12)) (<= 0 (|Map#Card| m@@18)))))
 :qid |stdinbpl.424:20|
 :skolemid |82|
 :pattern ( (|Map#Card| m@@18))
)))
(assert (forall ((Heap@@19 T@U) (lft@@23 T@U) ) (!  (=> (and (= (type Heap@@19) (MapType1Type RefType)) (= (type lft@@23) (MapType intType (MapType RefType realType)))) (and (= (valid_lft Heap@@19 lft@@23) (|valid_lft'| Heap@@19 lft@@23)) (dummyFunction (bool_2_U (|valid_lft#triggerStateless| lft@@23)))))
 :qid |stdinbpl.602:15|
 :skolemid |117|
 :pattern ( (valid_lft Heap@@19 lft@@23))
)))
(assert (forall ((T@@34 T@T) ) (! (= (type (|MultiSet#Empty| T@@34)) (MultiSetType T@@34))
 :qid |funType:MultiSet#Empty|
 :pattern ( (|MultiSet#Empty| T@@34))
)))
(assert (forall ((o@@7 T@U) ) (! (let ((T@@35 (type o@@7)))
(= (|MultiSet#Select| (|MultiSet#Empty| T@@35) o@@7) 0))
 :qid |stdinbpl.339:18|
 :skolemid |58|
 :pattern ( (let ((T@@35 (type o@@7)))
(|MultiSet#Select| (|MultiSet#Empty| T@@35) o@@7)))
)))
(assert (forall ((a@@22 T@U) (x@@47 T@U) ) (! (let ((T@@36 (type x@@47)))
 (=> (= (type a@@22) (MapType0Type T@@36 boolType)) (U_2_bool (MapType0Select (|Set#UnionOne| a@@22 x@@47) x@@47))))
 :qid |stdinbpl.242:18|
 :skolemid |30|
 :pattern ( (|Set#UnionOne| a@@22 x@@47))
)))
(assert (forall ((Heap@@20 T@U) (ExhaleHeap@@4 T@U) (Mask@@9 T@U) (pm_f@@1 T@U) ) (! (let ((C@@1 (FieldTypeInv0 (type pm_f@@1))))
 (=> (and (and (and (and (and (= (type Heap@@20) (MapType1Type RefType)) (= (type ExhaleHeap@@4) (MapType1Type RefType))) (= (type Mask@@9) (MapType2Type RefType realType))) (= (type pm_f@@1) (FieldType C@@1 FrameTypeType))) (IdenticalOnKnownLocations Heap@@20 ExhaleHeap@@4 Mask@@9)) (and (HasDirectPerm Mask@@9 null pm_f@@1) (IsPredicateField pm_f@@1))) (forall ((o2 T@U) (f_2@@0 T@U) ) (! (let ((B@@5 (FieldTypeInv1 (type f_2@@0))))
(let ((A@@6 (FieldTypeInv0 (type f_2@@0))))
 (=> (and (and (= (type o2) RefType) (= (type f_2@@0) (FieldType A@@6 B@@5))) (U_2_bool (MapType2Select (MapType1Select Heap@@20 null (PredicateMaskField pm_f@@1)) o2 f_2@@0))) (= (MapType1Select Heap@@20 o2 f_2@@0) (MapType1Select ExhaleHeap@@4 o2 f_2@@0)))))
 :qid |stdinbpl.54:134|
 :skolemid |3|
 :pattern ( (MapType1Select ExhaleHeap@@4 o2 f_2@@0))
))))
 :qid |stdinbpl.52:19|
 :skolemid |4|
 :pattern ( (IdenticalOnKnownLocations Heap@@20 ExhaleHeap@@4 Mask@@9) (IsPredicateField pm_f@@1))
)))
(assert (forall ((Heap@@21 T@U) (ExhaleHeap@@5 T@U) (Mask@@10 T@U) (pm_f@@2 T@U) ) (! (let ((C@@2 (FieldTypeInv0 (type pm_f@@2))))
 (=> (and (and (and (and (and (= (type Heap@@21) (MapType1Type RefType)) (= (type ExhaleHeap@@5) (MapType1Type RefType))) (= (type Mask@@10) (MapType2Type RefType realType))) (= (type pm_f@@2) (FieldType C@@2 FrameTypeType))) (IdenticalOnKnownLocations Heap@@21 ExhaleHeap@@5 Mask@@10)) (and (HasDirectPerm Mask@@10 null pm_f@@2) (IsWandField pm_f@@2))) (forall ((o2@@0 T@U) (f_2@@1 T@U) ) (! (let ((B@@6 (FieldTypeInv1 (type f_2@@1))))
(let ((A@@7 (FieldTypeInv0 (type f_2@@1))))
 (=> (and (and (= (type o2@@0) RefType) (= (type f_2@@1) (FieldType A@@7 B@@6))) (U_2_bool (MapType2Select (MapType1Select Heap@@21 null (WandMaskField pm_f@@2)) o2@@0 f_2@@1))) (= (MapType1Select Heap@@21 o2@@0 f_2@@1) (MapType1Select ExhaleHeap@@5 o2@@0 f_2@@1)))))
 :qid |stdinbpl.67:129|
 :skolemid |6|
 :pattern ( (MapType1Select ExhaleHeap@@5 o2@@0 f_2@@1))
))))
 :qid |stdinbpl.65:19|
 :skolemid |7|
 :pattern ( (IdenticalOnKnownLocations Heap@@21 ExhaleHeap@@5 Mask@@10) (IsWandField pm_f@@2))
)))
(assert (forall ((a@@23 T@U) (x@@48 T@U) ) (! (let ((T@@37 (type x@@48)))
 (=> (and (= (type a@@23) (MapType0Type T@@37 boolType)) (U_2_bool (MapType0Select a@@23 x@@48))) (= (|Set#Card| (|Set#UnionOne| a@@23 x@@48)) (|Set#Card| a@@23))))
 :qid |stdinbpl.246:18|
 :skolemid |32|
 :pattern ( (|Set#Card| (|Set#UnionOne| a@@23 x@@48)))
)))
(assert (forall ((a@@24 T@U) (x@@49 T@U) ) (! (let ((T@@38 (type x@@49)))
 (=> (= (type a@@24) (MultiSetType T@@38)) (and (> (|MultiSet#Select| (|MultiSet#UnionOne| a@@24 x@@49) x@@49) 0) (> (|MultiSet#Card| (|MultiSet#UnionOne| a@@24 x@@49)) 0))))
 :qid |stdinbpl.358:18|
 :skolemid |66|
 :pattern ( (|MultiSet#UnionOne| a@@24 x@@49))
)))
(assert (forall ((x@@50 T@U) ) (!  (=> (= (type x@@50) RefType) (= (getPredWandId (lft_T x@@50)) 0))
 :qid |stdinbpl.1109:15|
 :skolemid |171|
 :pattern ( (lft_T x@@50))
)))
(assert (forall ((x@@51 T@U) ) (!  (=> (= (type x@@51) RefType) (= (getPredWandId (lft_List x@@51)) 1))
 :qid |stdinbpl.1144:15|
 :skolemid |177|
 :pattern ( (lft_List x@@51))
)))
(assert (forall ((x@@52 T@U) ) (!  (=> (= (type x@@52) RefType) (= (getPredWandId (List x@@52)) 2))
 :qid |stdinbpl.913:15|
 :skolemid |147|
 :pattern ( (List x@@52))
)))
(assert (forall ((x@@53 T@U) ) (!  (=> (= (type x@@53) RefType) (= (getPredWandId (Node x@@53)) 3))
 :qid |stdinbpl.976:15|
 :skolemid |153|
 :pattern ( (Node x@@53))
)))
(assert (forall ((lft@@24 T@U) ) (!  (=> (= (type lft@@24) (MapType intType (MapType RefType realType))) (= (getPredWandId (LifetimeP lft@@24)) 6))
 :qid |stdinbpl.1205:15|
 :skolemid |183|
 :pattern ( (LifetimeP lft@@24))
)))
(assert (forall ((x@@54 T@U) ) (!  (=> (= (type x@@54) RefType) (= (getPredWandId (P x@@54)) 7))
 :qid |stdinbpl.1468:15|
 :skolemid |209|
 :pattern ( (P x@@54))
)))
(assert (forall ((r@@1 T@U) ) (! (= (|Set#Card| (|Set#Singleton| r@@1)) 1)
 :qid |stdinbpl.237:18|
 :skolemid |28|
 :pattern ( (|Set#Card| (|Set#Singleton| r@@1)))
)))
(assert (forall ((Mask@@11 T@U) (o_2@@2 T@U) (f_4@@2 T@U) ) (! (let ((B@@7 (FieldTypeInv1 (type f_4@@2))))
(let ((A@@8 (FieldTypeInv0 (type f_4@@2))))
 (=> (and (and (and (= (type Mask@@11) (MapType2Type RefType realType)) (= (type o_2@@2) RefType)) (= (type f_4@@2) (FieldType A@@8 B@@7))) (GoodMask Mask@@11)) (and (>= (U_2_real (MapType2Select Mask@@11 o_2@@2 f_4@@2)) NoPerm) (=> (and (and (GoodMask Mask@@11) (not (IsPredicateField f_4@@2))) (not (IsWandField f_4@@2))) (<= (U_2_real (MapType2Select Mask@@11 o_2@@2 f_4@@2)) FullPerm))))))
 :qid |stdinbpl.128:22|
 :skolemid |16|
 :pattern ( (GoodMask Mask@@11) (MapType2Select Mask@@11 o_2@@2 f_4@@2))
)))
(assert (forall ((r@@2 T@U) ) (! (U_2_bool (MapType0Select (|Set#Singleton| r@@2) r@@2))
 :qid |stdinbpl.235:18|
 :skolemid |26|
 :pattern ( (|Set#Singleton| r@@2))
)))
(assert (forall ((m@@19 T@U) ) (! (let ((V@@13 (MapTypeInv1 (type m@@19))))
(let ((U@@13 (MapTypeInv0 (type m@@19))))
 (=> (= (type m@@19) (MapType U@@13 V@@13)) (and (and (= (= (|Map#Card| m@@19) 0) (= m@@19 (|Map#Empty| U@@13 V@@13))) (=> (not (= (|Map#Card| m@@19) 0)) (exists ((x@@55 T@U) ) (!  (and (= (type x@@55) U@@13) (U_2_bool (MapType0Select (|Map#Domain| m@@19) x@@55)))
 :qid |stdinbpl.468:32|
 :skolemid |89|
 :no-pattern (type x@@55)
 :no-pattern (U_2_int x@@55)
 :no-pattern (U_2_bool x@@55)
)))) (forall ((x@@56 T@U) ) (!  (=> (and (= (type x@@56) U@@13) (U_2_bool (MapType0Select (|Map#Domain| m@@19) x@@56))) (not (= (|Map#Card| m@@19) 0)))
 :qid |stdinbpl.469:11|
 :skolemid |90|
 :pattern ( (MapType0Select (|Map#Domain| m@@19) x@@56))
))))))
 :qid |stdinbpl.466:21|
 :skolemid |91|
 :pattern ( (|Map#Card| m@@19))
)))
(assert (forall ((a@@25 T@U) (b@@18 T@U) ) (! (let ((T@@39 (MapType0TypeInv0 (type a@@25))))
 (=> (and (= (type a@@25) (MapType0Type T@@39 boolType)) (= (type b@@18) (MapType0Type T@@39 boolType))) (= (|Set#Union| a@@25 (|Set#Union| a@@25 b@@18)) (|Set#Union| a@@25 b@@18))))
 :qid |stdinbpl.269:18|
 :skolemid |39|
 :pattern ( (|Set#Union| a@@25 (|Set#Union| a@@25 b@@18)))
)))
(assert (forall ((a@@26 T@U) (b@@19 T@U) ) (! (let ((T@@40 (MapType0TypeInv0 (type a@@26))))
 (=> (and (= (type a@@26) (MapType0Type T@@40 boolType)) (= (type b@@19) (MapType0Type T@@40 boolType))) (= (|Set#Intersection| a@@26 (|Set#Intersection| a@@26 b@@19)) (|Set#Intersection| a@@26 b@@19))))
 :qid |stdinbpl.273:18|
 :skolemid |41|
 :pattern ( (|Set#Intersection| a@@26 (|Set#Intersection| a@@26 b@@19)))
)))
(assert (forall ((a@@27 T@U) (b@@20 T@U) ) (! (let ((T@@41 (MultiSetTypeInv0 (type a@@27))))
 (=> (and (= (type a@@27) (MultiSetType T@@41)) (= (type b@@20) (MultiSetType T@@41))) (= (|MultiSet#Intersection| a@@27 (|MultiSet#Intersection| a@@27 b@@20)) (|MultiSet#Intersection| a@@27 b@@20))))
 :qid |stdinbpl.375:18|
 :skolemid |71|
 :pattern ( (|MultiSet#Intersection| a@@27 (|MultiSet#Intersection| a@@27 b@@20)))
)))
(assert (forall ((s@@1 T@U) ) (! (let ((T@@42 (MultiSetTypeInv0 (type s@@1))))
 (=> (= (type s@@1) (MultiSetType T@@42)) (and (= (= (|MultiSet#Card| s@@1) 0) (= s@@1 (|MultiSet#Empty| T@@42))) (=> (not (= (|MultiSet#Card| s@@1) 0)) (exists ((x@@57 T@U) ) (!  (and (= (type x@@57) T@@42) (< 0 (|MultiSet#Select| s@@1 x@@57)))
 :qid |stdinbpl.342:38|
 :skolemid |59|
 :no-pattern (type x@@57)
 :no-pattern (U_2_int x@@57)
 :no-pattern (U_2_bool x@@57)
))))))
 :qid |stdinbpl.340:18|
 :skolemid |60|
 :pattern ( (|MultiSet#Card| s@@1))
)))
(assert (forall ((r@@3 T@U) (o@@8 T@U) ) (! (let ((T@@43 (type r@@3)))
 (=> (= (type o@@8) T@@43) (and (= (= (|MultiSet#Select| (|MultiSet#Singleton| r@@3) o@@8) 1) (= r@@3 o@@8)) (= (= (|MultiSet#Select| (|MultiSet#Singleton| r@@3) o@@8) 0) (not (= r@@3 o@@8))))))
 :qid |stdinbpl.345:18|
 :skolemid |61|
 :pattern ( (|MultiSet#Select| (|MultiSet#Singleton| r@@3) o@@8))
)))
(assert (forall ((o@@9 T@U) (f T@U) (Heap@@22 T@U) ) (!  (=> (and (and (and (= (type o@@9) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap@@22) (MapType1Type RefType))) (U_2_bool (MapType1Select Heap@@22 o@@9 $allocated))) (U_2_bool (MapType1Select Heap@@22 (MapType1Select Heap@@22 o@@9 f) $allocated)))
 :qid |stdinbpl.31:15|
 :skolemid |0|
 :pattern ( (MapType1Select Heap@@22 o@@9 f))
)))
(assert (forall ((m@@20 T@U) (u@@7 T@U) (|u'| T@U) (v@@2 T@U) ) (! (let ((V@@14 (type v@@2)))
(let ((U@@14 (type u@@7)))
 (=> (and (= (type m@@20) (MapType U@@14 V@@14)) (= (type |u'|) U@@14)) (and (=> (= |u'| u@@7) (and (U_2_bool (MapType0Select (|Map#Domain| (|Map#Build| m@@20 u@@7 v@@2)) |u'|)) (= (MapType0Select (|Map#Elements| (|Map#Build| m@@20 u@@7 v@@2)) |u'|) v@@2))) (=> (not (= |u'| u@@7)) (and (= (U_2_bool (MapType0Select (|Map#Domain| (|Map#Build| m@@20 u@@7 v@@2)) |u'|)) (U_2_bool (MapType0Select (|Map#Domain| m@@20) |u'|))) (= (MapType0Select (|Map#Elements| (|Map#Build| m@@20 u@@7 v@@2)) |u'|) (MapType0Select (|Map#Elements| m@@20) |u'|))))))))
 :qid |stdinbpl.475:21|
 :skolemid |92|
 :pattern ( (MapType0Select (|Map#Domain| (|Map#Build| m@@20 u@@7 v@@2)) |u'|))
 :pattern ( (MapType0Select (|Map#Domain| m@@20) |u'|) (|Map#Build| m@@20 u@@7 v@@2))
 :pattern ( (MapType0Select (|Map#Elements| (|Map#Build| m@@20 u@@7 v@@2)) |u'|))
)))
(assert (forall ((a@@28 T@U) (b@@21 T@U) (o@@10 T@U) ) (! (let ((T@@44 (type o@@10)))
 (=> (and (= (type a@@28) (MultiSetType T@@44)) (= (type b@@21) (MultiSetType T@@44))) (= (|MultiSet#Select| (|MultiSet#Union| a@@28 b@@21) o@@10) (+ (|MultiSet#Select| a@@28 o@@10) (|MultiSet#Select| b@@21 o@@10)))))
 :qid |stdinbpl.363:18|
 :skolemid |67|
 :pattern ( (|MultiSet#Select| (|MultiSet#Union| a@@28 b@@21) o@@10))
 :pattern ( (|MultiSet#Union| a@@28 b@@21) (|MultiSet#Select| a@@28 o@@10) (|MultiSet#Select| b@@21 o@@10))
)))
(assert (forall ((T@@45 T@T) ) (! (= (type (|Set#Empty| T@@45)) (MapType0Type T@@45 boolType))
 :qid |funType:Set#Empty|
 :pattern ( (|Set#Empty| T@@45))
)))
(assert (forall ((o@@11 T@U) ) (! (let ((T@@46 (type o@@11)))
 (not (U_2_bool (MapType0Select (|Set#Empty| T@@46) o@@11))))
 :qid |stdinbpl.229:18|
 :skolemid |23|
 :pattern ( (let ((T@@46 (type o@@11)))
(MapType0Select (|Set#Empty| T@@46) o@@11)))
)))
(assert  (and (and (forall ((arg0@@77 T@U) (arg1@@56 T@U) (arg2@@31 T@U) ) (! (= (type (|get_disc#frame| arg0@@77 arg1@@56 arg2@@31)) RefType)
 :qid |funType:get_disc#frame|
 :pattern ( (|get_disc#frame| arg0@@77 arg1@@56 arg2@@31))
)) (forall ((arg0@@78 T@U) (arg1@@57 T@U) ) (! (= (type (CombineFrames arg0@@78 arg1@@57)) FrameTypeType)
 :qid |funType:CombineFrames|
 :pattern ( (CombineFrames arg0@@78 arg1@@57))
))) (forall ((arg0@@79 T@U) ) (! (= (type (FrameFragment arg0@@79)) FrameTypeType)
 :qid |funType:FrameFragment|
 :pattern ( (FrameFragment arg0@@79))
))))
(assert (forall ((Heap@@23 T@U) (Mask@@12 T@U) (x@@58 T@U) (lft@@25 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@23) (MapType1Type RefType)) (= (type Mask@@12) (MapType2Type RefType realType))) (= (type x@@58) RefType)) (= (type lft@@25) (MapType intType (MapType RefType realType)))) (state Heap@@23 Mask@@12)) (= (|get_disc'| Heap@@23 x@@58 lft@@25) (|get_disc#frame| (CombineFrames (MapType1Select Heap@@23 null (LifetimeP lft@@25)) (FrameFragment EmptyFrame)) x@@58 lft@@25)))
 :qid |stdinbpl.668:15|
 :skolemid |124|
 :pattern ( (state Heap@@23 Mask@@12) (|get_disc'| Heap@@23 x@@58 lft@@25))
)))
(assert (forall ((x@@59 T@U) ) (!  (=> (= (type x@@59) RefType) (= (PredicateMaskField (List x@@59)) (|List#sm| x@@59)))
 :qid |stdinbpl.905:15|
 :skolemid |145|
 :pattern ( (PredicateMaskField (List x@@59)))
)))
(assert (forall ((x@@60 T@U) ) (!  (=> (= (type x@@60) RefType) (= (PredicateMaskField (Node x@@60)) (|Node#sm| x@@60)))
 :qid |stdinbpl.968:15|
 :skolemid |151|
 :pattern ( (PredicateMaskField (Node x@@60)))
)))
(assert (forall ((x@@61 T@U) ) (!  (=> (= (type x@@61) RefType) (= (PredicateMaskField (lft_T x@@61)) (|lft_T#sm| x@@61)))
 :qid |stdinbpl.1101:15|
 :skolemid |169|
 :pattern ( (PredicateMaskField (lft_T x@@61)))
)))
(assert (forall ((x@@62 T@U) ) (!  (=> (= (type x@@62) RefType) (= (PredicateMaskField (lft_List x@@62)) (|lft_List#sm| x@@62)))
 :qid |stdinbpl.1136:15|
 :skolemid |175|
 :pattern ( (PredicateMaskField (lft_List x@@62)))
)))
(assert (forall ((lft@@26 T@U) ) (!  (=> (= (type lft@@26) (MapType intType (MapType RefType realType))) (= (PredicateMaskField (LifetimeP lft@@26)) (|LifetimeP#sm| lft@@26)))
 :qid |stdinbpl.1197:15|
 :skolemid |181|
 :pattern ( (PredicateMaskField (LifetimeP lft@@26)))
)))
(assert (forall ((x@@63 T@U) ) (!  (=> (= (type x@@63) RefType) (= (PredicateMaskField (P x@@63)) (|P#sm| x@@63)))
 :qid |stdinbpl.1460:15|
 :skolemid |207|
 :pattern ( (PredicateMaskField (P x@@63)))
)))
(assert (forall ((r@@4 T@U) ) (! (let ((T@@47 (type r@@4)))
(= (|MultiSet#Singleton| r@@4) (|MultiSet#UnionOne| (|MultiSet#Empty| T@@47) r@@4)))
 :qid |stdinbpl.348:18|
 :skolemid |63|
 :pattern ( (|MultiSet#Singleton| r@@4))
)))
(assert (forall ((m@@21 T@U) ) (! (let ((V@@15 (MapTypeInv1 (type m@@21))))
(let ((U@@15 (MapTypeInv0 (type m@@21))))
 (=> (= (type m@@21) (MapType U@@15 V@@15)) (= (|Set#Card| (|Map#Domain| m@@21)) (|Map#Card| m@@21)))))
 :qid |stdinbpl.431:20|
 :skolemid |83|
 :pattern ( (|Set#Card| (|Map#Domain| m@@21)))
 :pattern ( (|Map#Card| m@@21))
)))
(assert (forall ((a@@29 Int) (b@@22 Int) ) (! (= (<= a@@29 b@@22) (= (|Math#min| a@@29 b@@22) a@@29))
 :qid |stdinbpl.313:15|
 :skolemid |51|
 :pattern ( (|Math#min| a@@29 b@@22))
)))
(assert (forall ((a@@30 Int) (b@@23 Int) ) (! (= (<= b@@23 a@@30) (= (|Math#min| a@@30 b@@23) b@@23))
 :qid |stdinbpl.314:15|
 :skolemid |52|
 :pattern ( (|Math#min| a@@30 b@@23))
)))
(assert (forall ((s@@2 T@U) ) (! (let ((T@@48 (MapType0TypeInv0 (type s@@2))))
 (=> (= (type s@@2) (MapType0Type T@@48 boolType)) (and (= (= (|Set#Card| s@@2) 0) (= s@@2 (|Set#Empty| T@@48))) (=> (not (= (|Set#Card| s@@2) 0)) (exists ((x@@64 T@U) ) (!  (and (= (type x@@64) T@@48) (U_2_bool (MapType0Select s@@2 x@@64)))
 :qid |stdinbpl.232:33|
 :skolemid |24|
 :no-pattern (type x@@64)
 :no-pattern (U_2_int x@@64)
 :no-pattern (U_2_bool x@@64)
))))))
 :qid |stdinbpl.230:18|
 :skolemid |25|
 :pattern ( (|Set#Card| s@@2))
)))
(assert (forall ((Heap@@24 T@U) (o@@12 T@U) (f_3 T@U) (v@@3 T@U) ) (! (let ((B@@8 (type v@@3)))
(let ((A@@9 (FieldTypeInv0 (type f_3))))
 (=> (and (and (= (type Heap@@24) (MapType1Type RefType)) (= (type o@@12) RefType)) (= (type f_3) (FieldType A@@9 B@@8))) (succHeap Heap@@24 (MapType1Store Heap@@24 o@@12 f_3 v@@3)))))
 :qid |stdinbpl.78:22|
 :skolemid |9|
 :pattern ( (MapType1Store Heap@@24 o@@12 f_3 v@@3))
)))
(assert (forall ((a@@31 T@U) (b@@24 T@U) ) (! (let ((T@@49 (MapType0TypeInv0 (type a@@31))))
 (=> (and (= (type a@@31) (MapType0Type T@@49 boolType)) (= (type b@@24) (MapType0Type T@@49 boolType))) (= (|Set#Subset| a@@31 b@@24) (forall ((o@@13 T@U) ) (!  (=> (and (= (type o@@13) T@@49) (U_2_bool (MapType0Select a@@31 o@@13))) (U_2_bool (MapType0Select b@@24 o@@13)))
 :qid |stdinbpl.292:32|
 :skolemid |46|
 :pattern ( (MapType0Select a@@31 o@@13))
 :pattern ( (MapType0Select b@@24 o@@13))
)))))
 :qid |stdinbpl.291:17|
 :skolemid |47|
 :pattern ( (|Set#Subset| a@@31 b@@24))
)))
(assert (forall ((a@@32 T@U) (x@@65 T@U) ) (! (let ((T@@50 (type x@@65)))
 (=> (and (= (type a@@32) (MapType0Type T@@50 boolType)) (not (U_2_bool (MapType0Select a@@32 x@@65)))) (= (|Set#Card| (|Set#UnionOne| a@@32 x@@65)) (+ (|Set#Card| a@@32) 1))))
 :qid |stdinbpl.248:18|
 :skolemid |33|
 :pattern ( (|Set#Card| (|Set#UnionOne| a@@32 x@@65)))
)))
(assert (forall ((a@@33 T@U) (b@@25 T@U) (o@@14 T@U) ) (! (let ((T@@51 (type o@@14)))
 (=> (and (= (type a@@33) (MultiSetType T@@51)) (= (type b@@25) (MultiSetType T@@51))) (= (|MultiSet#Select| (|MultiSet#Difference| a@@33 b@@25) o@@14) (|Math#clip| (- (|MultiSet#Select| a@@33 o@@14) (|MultiSet#Select| b@@25 o@@14))))))
 :qid |stdinbpl.380:18|
 :skolemid |72|
 :pattern ( (|MultiSet#Select| (|MultiSet#Difference| a@@33 b@@25) o@@14))
)))
(assert (= (type ZeroPMask) (MapType2Type RefType boolType)))
(assert (forall ((o_2@@3 T@U) (f_4@@3 T@U) ) (! (let ((B@@9 (FieldTypeInv1 (type f_4@@3))))
(let ((A@@10 (FieldTypeInv0 (type f_4@@3))))
 (=> (and (= (type o_2@@3) RefType) (= (type f_4@@3) (FieldType A@@10 B@@9))) (not (U_2_bool (MapType2Select ZeroPMask o_2@@3 f_4@@3))))))
 :qid |stdinbpl.112:22|
 :skolemid |14|
 :pattern ( (MapType2Select ZeroPMask o_2@@3 f_4@@3))
)))
(assert (forall ((p@@1 T@U) (v_1@@0 T@U) (q T@U) (w@@0 T@U) (r@@5 T@U) (u@@8 T@U) ) (! (let ((C@@3 (FieldTypeInv0 (type r@@5))))
(let ((B@@10 (FieldTypeInv0 (type q))))
(let ((A@@11 (FieldTypeInv0 (type p@@1))))
 (=> (and (and (and (and (and (and (= (type p@@1) (FieldType A@@11 FrameTypeType)) (= (type v_1@@0) FrameTypeType)) (= (type q) (FieldType B@@10 FrameTypeType))) (= (type w@@0) FrameTypeType)) (= (type r@@5) (FieldType C@@3 FrameTypeType))) (= (type u@@8) FrameTypeType)) (and (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r@@5 u@@8))) (InsidePredicate p@@1 v_1@@0 r@@5 u@@8)))))
 :qid |stdinbpl.208:25|
 :skolemid |20|
 :pattern ( (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r@@5 u@@8))
)))
(assert (forall ((a@@34 Int) ) (!  (=> (< a@@34 0) (= (|Math#clip| a@@34) 0))
 :qid |stdinbpl.319:15|
 :skolemid |55|
 :pattern ( (|Math#clip| a@@34))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
(assert (forall ((a@@35 T@U) (x@@66 T@U) (o@@15 T@U) ) (! (let ((T@@52 (type x@@66)))
 (=> (and (= (type a@@35) (MultiSetType T@@52)) (= (type o@@15) T@@52)) (= (|MultiSet#Select| (|MultiSet#UnionOne| a@@35 x@@66) o@@15) (ite (= x@@66 o@@15) (+ (|MultiSet#Select| a@@35 o@@15) 1) (|MultiSet#Select| a@@35 o@@15)))))
 :qid |stdinbpl.352:18|
 :skolemid |64|
 :pattern ( (|MultiSet#Select| (|MultiSet#UnionOne| a@@35 x@@66) o@@15))
 :pattern ( (|MultiSet#UnionOne| a@@35 x@@66) (|MultiSet#Select| a@@35 o@@15))
)))
(assert (forall ((a@@36 T@U) (b@@26 T@U) ) (! (let ((T@@53 (MultiSetTypeInv0 (type a@@36))))
 (=> (and (= (type a@@36) (MultiSetType T@@53)) (= (type b@@26) (MultiSetType T@@53))) (= (|MultiSet#Equal| a@@36 b@@26) (forall ((o@@16 T@U) ) (!  (=> (= (type o@@16) T@@53) (= (|MultiSet#Select| a@@36 o@@16) (|MultiSet#Select| b@@26 o@@16)))
 :qid |stdinbpl.398:36|
 :skolemid |77|
 :pattern ( (|MultiSet#Select| a@@36 o@@16))
 :pattern ( (|MultiSet#Select| b@@26 o@@16))
)))))
 :qid |stdinbpl.397:17|
 :skolemid |78|
 :pattern ( (|MultiSet#Equal| a@@36 b@@26))
)))
(assert (forall ((a@@37 T@U) (b@@27 T@U) ) (! (let ((T@@54 (MultiSetTypeInv0 (type a@@37))))
 (=> (and (= (type a@@37) (MultiSetType T@@54)) (= (type b@@27) (MultiSetType T@@54))) (= (|MultiSet#Subset| a@@37 b@@27) (forall ((o@@17 T@U) ) (!  (=> (= (type o@@17) T@@54) (<= (|MultiSet#Select| a@@37 o@@17) (|MultiSet#Select| b@@27 o@@17)))
 :qid |stdinbpl.394:37|
 :skolemid |75|
 :pattern ( (|MultiSet#Select| a@@37 o@@17))
 :pattern ( (|MultiSet#Select| b@@27 o@@17))
)))))
 :qid |stdinbpl.393:17|
 :skolemid |76|
 :pattern ( (|MultiSet#Subset| a@@37 b@@27))
)))
(assert (forall ((a@@38 T@U) (b@@28 T@U) (o@@18 T@U) ) (! (let ((T@@55 (type o@@18)))
 (=> (and (= (type a@@38) (MapType0Type T@@55 boolType)) (= (type b@@28) (MapType0Type T@@55 boolType))) (= (U_2_bool (MapType0Select (|Set#Union| a@@38 b@@28) o@@18))  (or (U_2_bool (MapType0Select a@@38 o@@18)) (U_2_bool (MapType0Select b@@28 o@@18))))))
 :qid |stdinbpl.252:18|
 :skolemid |34|
 :pattern ( (MapType0Select (|Set#Union| a@@38 b@@28) o@@18))
)))
(assert (forall ((m@@22 T@U) (|m'@@2| T@U) ) (! (let ((V@@16 (MapTypeInv1 (type m@@22))))
(let ((U@@16 (MapTypeInv0 (type m@@22))))
 (=> (and (and (= (type m@@22) (MapType U@@16 V@@16)) (= (type |m'@@2|) (MapType U@@16 V@@16))) (not (|Map#Disjoint| m@@22 |m'@@2|))) (exists ((o@@19 T@U) ) (!  (and (= (type o@@19) U@@16) (and (U_2_bool (MapType0Select (|Map#Domain| m@@22) o@@19)) (U_2_bool (MapType0Select (|Map#Domain| |m'@@2|) o@@19))))
 :qid |stdinbpl.508:38|
 :skolemid |101|
 :pattern ( (MapType0Select (|Map#Domain| m@@22) o@@19))
 :pattern ( (MapType0Select (|Map#Domain| |m'@@2|) o@@19))
)))))
 :qid |stdinbpl.506:21|
 :skolemid |102|
 :pattern ( (|Map#Disjoint| m@@22 |m'@@2|))
)))
(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun x@@67 () T@U)
(declare-fun Mask@2 () T@U)
(declare-fun Mask@0 () T@U)
(declare-fun Heap@@25 () T@U)
(declare-fun Mask@1 () T@U)
(declare-fun lft@@27 () T@U)
(declare-fun mut@@11 () Bool)
(assert  (and (and (and (and (and (= (type x@@67) RefType) (= (type Mask@0) (MapType2Type RefType realType))) (= (type Heap@@25) (MapType1Type RefType))) (= (type Mask@1) (MapType2Type RefType realType))) (= (type lft@@27) (MapType intType (MapType RefType realType)))) (= (type Mask@2) (MapType2Type RefType realType))))
(set-info :boogie-vc-id |ListRef#definedness|)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 6) (let ((anon2_correct true))
(let ((anon3_Else_correct  (=> (= x@@67 null) (=> (and (= Mask@2 ZeroMask) (= (ControlFlow 0 4) 1)) anon2_correct))))
(let ((anon3_Then_correct  (=> (and (and (not (= x@@67 null)) (not (= x@@67 null))) (and (= Mask@0 (MapType2Store ZeroMask x@@67 ref (real_2_U (+ (U_2_real (MapType2Select ZeroMask x@@67 ref)) FullPerm)))) (state Heap@@25 Mask@0))) (and (=> (= (ControlFlow 0 2) (- 0 3)) (HasDirectPerm Mask@0 x@@67 ref)) (=> (HasDirectPerm Mask@0 x@@67 ref) (=> (and (and (= Mask@1 (MapType2Store Mask@0 null (NodeRef (MapType1Select Heap@@25 x@@67 ref) lft@@27 mut@@11) (real_2_U (+ (U_2_real (MapType2Select Mask@0 null (NodeRef (MapType1Select Heap@@25 x@@67 ref) lft@@27 mut@@11))) FullPerm)))) (state Heap@@25 Mask@1)) (and (= Mask@2 Mask@1) (= (ControlFlow 0 2) 1))) anon2_correct))))))
(let ((anon0_correct  (=> (state Heap@@25 ZeroMask) (=> (and (= AssumeFunctionsAbove (- 0 1)) (U_2_bool (MapType1Select Heap@@25 x@@67 $allocated))) (and (=> (= (ControlFlow 0 5) 2) anon3_Then_correct) (=> (= (ControlFlow 0 5) 4) anon3_Else_correct))))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 6) 5) anon0_correct)))
PreconditionGeneratedEntry_correct))))))
))
(check-sat)
(pop 1)
; Valid
(get-info :rlimit)
