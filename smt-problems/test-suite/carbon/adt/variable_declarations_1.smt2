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
(declare-fun |Seq#Length| (T@U) Int)
(declare-fun |Seq#Drop| (T@U Int) T@U)
(declare-fun SeqTypeInv0 (T@T) T@T)
(declare-fun SeqType (T@T) T@T)
(declare-fun succHeap (T@U T@U) Bool)
(declare-fun MapType1Type (T@T) T@T)
(declare-fun RefType () T@T)
(declare-fun succHeapTrans (T@U T@U) Bool)
(declare-fun MapType1TypeInv0 (T@T) T@T)
(declare-fun FieldType (T@T T@T) T@T)
(declare-fun FieldTypeInv0 (T@T) T@T)
(declare-fun FieldTypeInv1 (T@T) T@T)
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
(declare-fun |Math#min| (Int Int) Int)
(declare-fun |Seq#Index| (T@U Int) T@U)
(declare-fun |Seq#Sub| (Int Int) Int)
(declare-fun |Seq#Add| (Int Int) Int)
(declare-fun IdenticalOnKnownLocations (T@U T@U T@U) Bool)
(declare-fun IsPredicateField (T@U) Bool)
(declare-fun null () T@U)
(declare-fun PredicateMaskField (T@U) T@U)
(declare-fun FrameTypeType () T@T)
(declare-fun HasDirectPerm (T@U T@U T@U) Bool)
(declare-fun IsWandField (T@U) Bool)
(declare-fun WandMaskField (T@U) T@U)
(declare-fun |Seq#Update| (T@U Int T@U) T@U)
(declare-fun |MultiSet#Select| (T@U T@U) Int)
(declare-fun |Set#Union| (T@U T@U) T@U)
(declare-fun |Set#Intersection| (T@U T@U) T@U)
(declare-fun |Map#Card| (T@U) Int)
(declare-fun |Map#Build| (T@U T@U T@U) T@U)
(declare-fun |Set#Singleton| (T@U) T@U)
(declare-fun |Seq#Take| (T@U Int) T@U)
(declare-fun List_tag (T@U) Int)
(declare-fun get_List_value (T@U) T@U)
(declare-fun get_List_tail (T@U) T@U)
(declare-fun ListDomainTypeTypeInv0 (T@T) T@T)
(declare-fun ListDomainTypeType (T@T) T@T)
(declare-fun Nil (T@T) T@U)
(declare-fun Cons (T@U T@U) T@U)
(declare-fun |Seq#Contains| (T@U T@U) Bool)
(declare-fun |Seq#Range| (Int Int) T@U)
(declare-fun |Set#Card| (T@U) Int)
(declare-fun |Seq#Skolem| (T@U T@U) Int)
(declare-fun SpecialList_tag (T@U) Int)
(declare-fun get_SpecialList_elemS (T@U) T@U)
(declare-fun get_SpecialList_tailS (T@U) T@U)
(declare-fun SpecialListDomainTypeTypeInv1 (T@T) T@T)
(declare-fun SpecialListDomainTypeTypeInv0 (T@T) T@T)
(declare-fun SpecialListDomainTypeType (T@T T@T) T@T)
(declare-fun SpecialNil (T@T T@T) T@U)
(declare-fun TCons (T@U T@U) T@U)
(declare-fun get_SpecialList_elemT (T@U) T@U)
(declare-fun get_SpecialList_tailT (T@U) T@U)
(declare-fun SCons (T@U T@U) T@U)
(declare-fun $allocated () T@U)
(declare-fun NormalFieldType () T@T)
(declare-fun |Math#clip| (Int) Int)
(declare-fun |Seq#Singleton| (T@U) T@U)
(declare-fun |Seq#Empty| (T@T) T@U)
(declare-fun dummyHeap () T@U)
(declare-fun ZeroMask () T@U)
(declare-fun |MultiSet#UnionOne| (T@U T@U) T@U)
(declare-fun |MultiSet#Disjoint| (T@U T@U) Bool)
(declare-fun InsidePredicate (T@U T@U T@U T@U) Bool)
(declare-fun |Seq#Append| (T@U T@U) T@U)
(declare-fun |MultiSet#Singleton| (T@U) T@U)
(declare-fun |Map#Disjoint| (T@U T@U) Bool)
(declare-fun |Map#Empty| (T@T T@T) T@U)
(declare-fun |Set#Equal| (T@U T@U) Bool)
(declare-fun sumMask (T@U T@U T@U) Bool)
(declare-fun ConditionalFrame (Real T@U) T@U)
(declare-fun EmptyFrame () T@U)
(declare-fun NoPerm () Real)
(declare-fun |Set#Difference| (T@U T@U) T@U)
(declare-fun |Seq#Equal| (T@U T@U) Bool)
(declare-fun |MultiSet#Equal| (T@U T@U) Bool)
(declare-fun |Map#Equal| (T@U T@U) Bool)
(declare-fun |Set#UnionOne| (T@U T@U) T@U)
(declare-fun |Seq#ContainsTrigger| (T@U T@U) Bool)
(declare-fun |MultiSet#Empty| (T@T) T@U)
(declare-fun FullPerm () Real)
(declare-fun |Set#Empty| (T@T) T@U)
(declare-fun |Set#Subset| (T@U T@U) Bool)
(declare-fun ZeroPMask () T@U)
(declare-fun |Seq#SkolemDiff| (T@U T@U) Int)
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
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (forall ((arg0@@11 T@T) (arg1 T@T) ) (! (= (Ctor (MapType arg0@@11 arg1)) 6)
 :qid |ctor:MapType|
)) (forall ((arg0@@12 T@T) (arg1@@0 T@T) ) (! (= (MapTypeInv0 (MapType arg0@@12 arg1@@0)) arg0@@12)
 :qid |typeInv:MapTypeInv0|
 :pattern ( (MapType arg0@@12 arg1@@0))
))) (forall ((arg0@@13 T@T) (arg1@@1 T@T) ) (! (= (MapTypeInv1 (MapType arg0@@13 arg1@@1)) arg1@@1)
 :qid |typeInv:MapTypeInv1|
 :pattern ( (MapType arg0@@13 arg1@@1))
))) (forall ((arg0@@14 T@T) (arg1@@2 T@T) ) (! (= (Ctor (MapType0Type arg0@@14 arg1@@2)) 7)
 :qid |ctor:MapType0Type|
))) (forall ((arg0@@15 T@T) (arg1@@3 T@T) ) (! (= (MapType0TypeInv0 (MapType0Type arg0@@15 arg1@@3)) arg0@@15)
 :qid |typeInv:MapType0TypeInv0|
 :pattern ( (MapType0Type arg0@@15 arg1@@3))
))) (forall ((arg0@@16 T@T) (arg1@@4 T@T) ) (! (= (MapType0TypeInv1 (MapType0Type arg0@@16 arg1@@4)) arg1@@4)
 :qid |typeInv:MapType0TypeInv1|
 :pattern ( (MapType0Type arg0@@16 arg1@@4))
))) (forall ((arg0@@17 T@U) (arg1@@5 T@U) ) (! (let ((aVar1 (MapType0TypeInv1 (type arg0@@17))))
(= (type (MapType0Select arg0@@17 arg1@@5)) aVar1))
 :qid |funType:MapType0Select|
 :pattern ( (MapType0Select arg0@@17 arg1@@5))
))) (forall ((arg0@@18 T@U) (arg1@@6 T@U) (arg2 T@U) ) (! (let ((aVar1@@0 (type arg2)))
(let ((aVar0 (type arg1@@6)))
(= (type (MapType0Store arg0@@18 arg1@@6 arg2)) (MapType0Type aVar0 aVar1@@0))))
 :qid |funType:MapType0Store|
 :pattern ( (MapType0Store arg0@@18 arg1@@6 arg2))
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
)))) (forall ((arg0@@19 T@U) ) (! (let ((V (MapTypeInv1 (type arg0@@19))))
(= (type (|Map#Values| arg0@@19)) (MapType0Type V boolType)))
 :qid |funType:Map#Values|
 :pattern ( (|Map#Values| arg0@@19))
))) (forall ((arg0@@20 T@U) ) (! (let ((U (MapTypeInv0 (type arg0@@20))))
(= (type (|Map#Domain| arg0@@20)) (MapType0Type U boolType)))
 :qid |funType:Map#Domain|
 :pattern ( (|Map#Domain| arg0@@20))
))) (forall ((arg0@@21 T@U) ) (! (let ((V@@0 (MapTypeInv1 (type arg0@@21))))
(let ((U@@0 (MapTypeInv0 (type arg0@@21))))
(= (type (|Map#Elements| arg0@@21)) (MapType0Type U@@0 V@@0))))
 :qid |funType:Map#Elements|
 :pattern ( (|Map#Elements| arg0@@21))
))))
(assert (forall ((m@@2 T@U) (v T@U) ) (! (let ((V@@1 (type v)))
(let ((U@@1 (MapTypeInv0 (type m@@2))))
 (=> (and (= (type m@@2) (MapType U@@1 V@@1)) (U_2_bool (MapType0Select (|Map#Values| m@@2) v))) (exists ((u T@U) ) (!  (and (= (type u) U@@1) (and (U_2_bool (MapType0Select (|Map#Domain| m@@2) u)) (= v (MapType0Select (|Map#Elements| m@@2) u))))
 :qid |stdinbpl.764:10|
 :skolemid |120|
 :pattern ( (MapType0Select (|Map#Domain| m@@2) u))
 :pattern ( (MapType0Select (|Map#Elements| m@@2) u))
)))))
 :qid |stdinbpl.762:20|
 :skolemid |121|
 :pattern ( (MapType0Select (|Map#Values| m@@2) v))
)))
(assert  (and (and (forall ((arg0@@22 T@T) ) (! (= (Ctor (SeqType arg0@@22)) 8)
 :qid |ctor:SeqType|
)) (forall ((arg0@@23 T@T) ) (! (= (SeqTypeInv0 (SeqType arg0@@23)) arg0@@23)
 :qid |typeInv:SeqTypeInv0|
 :pattern ( (SeqType arg0@@23))
))) (forall ((arg0@@24 T@U) (arg1@@7 Int) ) (! (let ((T (SeqTypeInv0 (type arg0@@24))))
(= (type (|Seq#Drop| arg0@@24 arg1@@7)) (SeqType T)))
 :qid |funType:Seq#Drop|
 :pattern ( (|Seq#Drop| arg0@@24 arg1@@7))
))))
(assert (forall ((s T@U) (n Int) ) (! (let ((T@@0 (SeqTypeInv0 (type s))))
 (=> (= (type s) (SeqType T@@0)) (and (=> (<= 0 n) (and (=> (<= n (|Seq#Length| s)) (= (|Seq#Length| (|Seq#Drop| s n)) (- (|Seq#Length| s) n))) (=> (< (|Seq#Length| s) n) (= (|Seq#Length| (|Seq#Drop| s n)) 0)))) (=> (< n 0) (= (|Seq#Length| (|Seq#Drop| s n)) (|Seq#Length| s))))))
 :qid |stdinbpl.271:18|
 :skolemid |38|
 :pattern ( (|Seq#Length| (|Seq#Drop| s n)))
 :pattern ( (|Seq#Length| s) (|Seq#Drop| s n))
)))
(assert  (and (and (and (and (and (and (and (and (and (forall ((arg0@@25 T@T) ) (! (= (Ctor (MapType1Type arg0@@25)) 9)
 :qid |ctor:MapType1Type|
)) (forall ((arg0@@26 T@T) ) (! (= (MapType1TypeInv0 (MapType1Type arg0@@26)) arg0@@26)
 :qid |typeInv:MapType1TypeInv0|
 :pattern ( (MapType1Type arg0@@26))
))) (forall ((arg0@@27 T@T) (arg1@@8 T@T) ) (! (= (Ctor (FieldType arg0@@27 arg1@@8)) 10)
 :qid |ctor:FieldType|
))) (forall ((arg0@@28 T@T) (arg1@@9 T@T) ) (! (= (FieldTypeInv0 (FieldType arg0@@28 arg1@@9)) arg0@@28)
 :qid |typeInv:FieldTypeInv0|
 :pattern ( (FieldType arg0@@28 arg1@@9))
))) (forall ((arg0@@29 T@T) (arg1@@10 T@T) ) (! (= (FieldTypeInv1 (FieldType arg0@@29 arg1@@10)) arg1@@10)
 :qid |typeInv:FieldTypeInv1|
 :pattern ( (FieldType arg0@@29 arg1@@10))
))) (forall ((arg0@@30 T@U) (arg1@@11 T@U) (arg2@@0 T@U) ) (! (let ((B (FieldTypeInv1 (type arg2@@0))))
(= (type (MapType1Select arg0@@30 arg1@@11 arg2@@0)) B))
 :qid |funType:MapType1Select|
 :pattern ( (MapType1Select arg0@@30 arg1@@11 arg2@@0))
))) (forall ((arg0@@31 T@U) (arg1@@12 T@U) (arg2@@1 T@U) (arg3 T@U) ) (! (let ((aVar0@@0 (type arg1@@12)))
(= (type (MapType1Store arg0@@31 arg1@@12 arg2@@1 arg3)) (MapType1Type aVar0@@0)))
 :qid |funType:MapType1Store|
 :pattern ( (MapType1Store arg0@@31 arg1@@12 arg2@@1 arg3))
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
)))) (= (Ctor RefType) 11)))
(assert (forall ((Heap0 T@U) (Heap1 T@U) ) (!  (=> (and (and (= (type Heap0) (MapType1Type RefType)) (= (type Heap1) (MapType1Type RefType))) (succHeap Heap0 Heap1)) (succHeapTrans Heap0 Heap1))
 :qid |stdinbpl.88:15|
 :skolemid |11|
 :pattern ( (succHeap Heap0 Heap1))
)))
(assert  (and (and (and (and (forall ((arg0@@32 T@T) ) (! (= (Ctor (MultiSetType arg0@@32)) 12)
 :qid |ctor:MultiSetType|
)) (forall ((arg0@@33 T@T) ) (! (= (MultiSetTypeInv0 (MultiSetType arg0@@33)) arg0@@33)
 :qid |typeInv:MultiSetTypeInv0|
 :pattern ( (MultiSetType arg0@@33))
))) (forall ((arg0@@34 T@U) (arg1@@13 T@U) ) (! (let ((T@@1 (MultiSetTypeInv0 (type arg0@@34))))
(= (type (|MultiSet#Difference| arg0@@34 arg1@@13)) (MultiSetType T@@1)))
 :qid |funType:MultiSet#Difference|
 :pattern ( (|MultiSet#Difference| arg0@@34 arg1@@13))
))) (forall ((arg0@@35 T@U) (arg1@@14 T@U) ) (! (let ((T@@2 (MultiSetTypeInv0 (type arg0@@35))))
(= (type (|MultiSet#Intersection| arg0@@35 arg1@@14)) (MultiSetType T@@2)))
 :qid |funType:MultiSet#Intersection|
 :pattern ( (|MultiSet#Intersection| arg0@@35 arg1@@14))
))) (forall ((arg0@@36 T@U) (arg1@@15 T@U) ) (! (let ((T@@3 (MultiSetTypeInv0 (type arg0@@36))))
(= (type (|MultiSet#Union| arg0@@36 arg1@@15)) (MultiSetType T@@3)))
 :qid |funType:MultiSet#Union|
 :pattern ( (|MultiSet#Union| arg0@@36 arg1@@15))
))))
(assert (forall ((a T@U) (b T@U) ) (! (let ((T@@4 (MultiSetTypeInv0 (type a))))
 (=> (and (= (type a) (MultiSetType T@@4)) (= (type b) (MultiSetType T@@4))) (and (= (+ (+ (|MultiSet#Card| (|MultiSet#Difference| a b)) (|MultiSet#Card| (|MultiSet#Difference| b a))) (* 2 (|MultiSet#Card| (|MultiSet#Intersection| a b)))) (|MultiSet#Card| (|MultiSet#Union| a b))) (= (|MultiSet#Card| (|MultiSet#Difference| a b)) (- (|MultiSet#Card| a) (|MultiSet#Card| (|MultiSet#Intersection| a b)))))))
 :qid |stdinbpl.703:18|
 :skolemid |110|
 :pattern ( (|MultiSet#Card| (|MultiSet#Difference| a b)))
)))
(assert  (and (and (and (and (and (and (forall ((arg0@@37 T@T) (arg1@@16 T@T) ) (! (= (Ctor (MapType2Type arg0@@37 arg1@@16)) 13)
 :qid |ctor:MapType2Type|
)) (forall ((arg0@@38 T@T) (arg1@@17 T@T) ) (! (= (MapType2TypeInv0 (MapType2Type arg0@@38 arg1@@17)) arg0@@38)
 :qid |typeInv:MapType2TypeInv0|
 :pattern ( (MapType2Type arg0@@38 arg1@@17))
))) (forall ((arg0@@39 T@T) (arg1@@18 T@T) ) (! (= (MapType2TypeInv1 (MapType2Type arg0@@39 arg1@@18)) arg1@@18)
 :qid |typeInv:MapType2TypeInv1|
 :pattern ( (MapType2Type arg0@@39 arg1@@18))
))) (forall ((arg0@@40 T@U) (arg1@@19 T@U) (arg2@@2 T@U) ) (! (let ((aVar1@@2 (MapType2TypeInv1 (type arg0@@40))))
(= (type (MapType2Select arg0@@40 arg1@@19 arg2@@2)) aVar1@@2))
 :qid |funType:MapType2Select|
 :pattern ( (MapType2Select arg0@@40 arg1@@19 arg2@@2))
))) (forall ((arg0@@41 T@U) (arg1@@20 T@U) (arg2@@3 T@U) (arg3@@0 T@U) ) (! (let ((aVar1@@3 (type arg3@@0)))
(let ((aVar0@@1 (type arg1@@20)))
(= (type (MapType2Store arg0@@41 arg1@@20 arg2@@3 arg3@@0)) (MapType2Type aVar0@@1 aVar1@@3))))
 :qid |funType:MapType2Store|
 :pattern ( (MapType2Store arg0@@41 arg1@@20 arg2@@3 arg3@@0))
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
(assert (forall ((a@@0 Int) (b@@0 Int) ) (!  (or (= (|Math#min| a@@0 b@@0) a@@0) (= (|Math#min| a@@0 b@@0) b@@0))
 :qid |stdinbpl.634:15|
 :skolemid |89|
 :pattern ( (|Math#min| a@@0 b@@0))
)))
(assert (forall ((arg0@@42 T@U) (arg1@@21 Int) ) (! (let ((T@@5 (SeqTypeInv0 (type arg0@@42))))
(= (type (|Seq#Index| arg0@@42 arg1@@21)) T@@5))
 :qid |funType:Seq#Index|
 :pattern ( (|Seq#Index| arg0@@42 arg1@@21))
)))
(assert (forall ((s@@0 T@U) (n@@0 Int) (j Int) ) (! (let ((T@@6 (SeqTypeInv0 (type s@@0))))
 (=> (= (type s@@0) (SeqType T@@6)) (=> (and (and (< 0 n@@0) (<= 0 j)) (< j (- (|Seq#Length| s@@0) n@@0))) (and (= (|Seq#Sub| (|Seq#Add| j n@@0) n@@0) j) (= (|Seq#Index| (|Seq#Drop| s@@0 n@@0) j) (|Seq#Index| s@@0 (|Seq#Add| j n@@0)))))))
 :qid |stdinbpl.292:18|
 :skolemid |39|
 :pattern ( (|Seq#Index| (|Seq#Drop| s@@0 n@@0) j))
)))
(assert  (and (and (= (Ctor FrameTypeType) 14) (= (type null) RefType)) (forall ((arg0@@43 T@U) ) (! (let ((A (FieldTypeInv0 (type arg0@@43))))
(= (type (PredicateMaskField arg0@@43)) (FieldType A (MapType2Type RefType boolType))))
 :qid |funType:PredicateMaskField|
 :pattern ( (PredicateMaskField arg0@@43))
))))
(assert (forall ((Heap@@0 T@U) (ExhaleHeap T@U) (Mask@@0 T@U) (pm_f T@U) ) (! (let ((C (FieldTypeInv0 (type pm_f))))
 (=> (and (and (and (and (and (= (type Heap@@0) (MapType1Type RefType)) (= (type ExhaleHeap) (MapType1Type RefType))) (= (type Mask@@0) (MapType2Type RefType realType))) (= (type pm_f) (FieldType C FrameTypeType))) (IdenticalOnKnownLocations Heap@@0 ExhaleHeap Mask@@0)) (and (HasDirectPerm Mask@@0 null pm_f) (IsPredicateField pm_f))) (= (MapType1Select Heap@@0 null (PredicateMaskField pm_f)) (MapType1Select ExhaleHeap null (PredicateMaskField pm_f)))))
 :qid |stdinbpl.47:19|
 :skolemid |2|
 :pattern ( (IdenticalOnKnownLocations Heap@@0 ExhaleHeap Mask@@0) (IsPredicateField pm_f) (MapType1Select ExhaleHeap null (PredicateMaskField pm_f)))
)))
(assert (forall ((arg0@@44 T@U) ) (! (let ((A@@0 (FieldTypeInv0 (type arg0@@44))))
(= (type (WandMaskField arg0@@44)) (FieldType A@@0 (MapType2Type RefType boolType))))
 :qid |funType:WandMaskField|
 :pattern ( (WandMaskField arg0@@44))
)))
(assert (forall ((Heap@@1 T@U) (ExhaleHeap@@0 T@U) (Mask@@1 T@U) (pm_f@@0 T@U) ) (! (let ((C@@0 (FieldTypeInv0 (type pm_f@@0))))
 (=> (and (and (and (and (and (= (type Heap@@1) (MapType1Type RefType)) (= (type ExhaleHeap@@0) (MapType1Type RefType))) (= (type Mask@@1) (MapType2Type RefType realType))) (= (type pm_f@@0) (FieldType C@@0 FrameTypeType))) (IdenticalOnKnownLocations Heap@@1 ExhaleHeap@@0 Mask@@1)) (and (HasDirectPerm Mask@@1 null pm_f@@0) (IsWandField pm_f@@0))) (= (MapType1Select Heap@@1 null (WandMaskField pm_f@@0)) (MapType1Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))))
 :qid |stdinbpl.60:19|
 :skolemid |5|
 :pattern ( (IdenticalOnKnownLocations Heap@@1 ExhaleHeap@@0 Mask@@1) (IsWandField pm_f@@0) (MapType1Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))
)))
(assert (forall ((arg0@@45 T@U) (arg1@@22 Int) (arg2@@4 T@U) ) (! (let ((T@@7 (type arg2@@4)))
(= (type (|Seq#Update| arg0@@45 arg1@@22 arg2@@4)) (SeqType T@@7)))
 :qid |funType:Seq#Update|
 :pattern ( (|Seq#Update| arg0@@45 arg1@@22 arg2@@4))
)))
(assert (forall ((s@@1 T@U) (i Int) (v@@0 T@U) (n@@1 Int) ) (! (let ((T@@8 (type v@@0)))
 (=> (= (type s@@1) (SeqType T@@8)) (=> (and (<= 0 n@@1) (< n@@1 (|Seq#Length| s@@1))) (and (=> (= i n@@1) (= (|Seq#Index| (|Seq#Update| s@@1 i v@@0) n@@1) v@@0)) (=> (not (= i n@@1)) (= (|Seq#Index| (|Seq#Update| s@@1 i v@@0) n@@1) (|Seq#Index| s@@1 n@@1)))))))
 :qid |stdinbpl.247:18|
 :skolemid |35|
 :pattern ( (|Seq#Index| (|Seq#Update| s@@1 i v@@0) n@@1))
 :pattern ( (|Seq#Index| s@@1 n@@1) (|Seq#Update| s@@1 i v@@0))
)))
(assert (forall ((a@@1 T@U) (b@@1 T@U) (y@@1 T@U) ) (! (let ((T@@9 (type y@@1)))
 (=> (and (and (= (type a@@1) (MultiSetType T@@9)) (= (type b@@1) (MultiSetType T@@9))) (<= (|MultiSet#Select| a@@1 y@@1) (|MultiSet#Select| b@@1 y@@1))) (= (|MultiSet#Select| (|MultiSet#Difference| a@@1 b@@1) y@@1) 0)))
 :qid |stdinbpl.701:18|
 :skolemid |109|
 :pattern ( (|MultiSet#Difference| a@@1 b@@1) (|MultiSet#Select| b@@1 y@@1) (|MultiSet#Select| a@@1 y@@1))
)))
(assert (forall ((arg0@@46 T@U) (arg1@@23 T@U) ) (! (let ((T@@10 (MapType0TypeInv0 (type arg0@@46))))
(= (type (|Set#Union| arg0@@46 arg1@@23)) (MapType0Type T@@10 boolType)))
 :qid |funType:Set#Union|
 :pattern ( (|Set#Union| arg0@@46 arg1@@23))
)))
(assert (forall ((a@@2 T@U) (b@@2 T@U) ) (! (let ((T@@11 (MapType0TypeInv0 (type a@@2))))
 (=> (and (= (type a@@2) (MapType0Type T@@11 boolType)) (= (type b@@2) (MapType0Type T@@11 boolType))) (= (|Set#Union| (|Set#Union| a@@2 b@@2) b@@2) (|Set#Union| a@@2 b@@2))))
 :qid |stdinbpl.586:18|
 :skolemid |74|
 :pattern ( (|Set#Union| (|Set#Union| a@@2 b@@2) b@@2))
)))
(assert (forall ((arg0@@47 T@U) (arg1@@24 T@U) ) (! (let ((T@@12 (MapType0TypeInv0 (type arg0@@47))))
(= (type (|Set#Intersection| arg0@@47 arg1@@24)) (MapType0Type T@@12 boolType)))
 :qid |funType:Set#Intersection|
 :pattern ( (|Set#Intersection| arg0@@47 arg1@@24))
)))
(assert (forall ((a@@3 T@U) (b@@3 T@U) ) (! (let ((T@@13 (MapType0TypeInv0 (type a@@3))))
 (=> (and (= (type a@@3) (MapType0Type T@@13 boolType)) (= (type b@@3) (MapType0Type T@@13 boolType))) (= (|Set#Intersection| (|Set#Intersection| a@@3 b@@3) b@@3) (|Set#Intersection| a@@3 b@@3))))
 :qid |stdinbpl.590:18|
 :skolemid |76|
 :pattern ( (|Set#Intersection| (|Set#Intersection| a@@3 b@@3) b@@3))
)))
(assert (forall ((a@@4 T@U) (b@@4 T@U) ) (! (let ((T@@14 (MultiSetTypeInv0 (type a@@4))))
 (=> (and (= (type a@@4) (MultiSetType T@@14)) (= (type b@@4) (MultiSetType T@@14))) (= (|MultiSet#Intersection| (|MultiSet#Intersection| a@@4 b@@4) b@@4) (|MultiSet#Intersection| a@@4 b@@4))))
 :qid |stdinbpl.692:18|
 :skolemid |106|
 :pattern ( (|MultiSet#Intersection| (|MultiSet#Intersection| a@@4 b@@4) b@@4))
)))
(assert (forall ((arg0@@48 T@U) (arg1@@25 T@U) (arg2@@5 T@U) ) (! (let ((V@@2 (type arg2@@5)))
(let ((U@@2 (type arg1@@25)))
(= (type (|Map#Build| arg0@@48 arg1@@25 arg2@@5)) (MapType U@@2 V@@2))))
 :qid |funType:Map#Build|
 :pattern ( (|Map#Build| arg0@@48 arg1@@25 arg2@@5))
)))
(assert (forall ((m@@11 T@U) (u@@0 T@U) (v@@1 T@U) ) (! (let ((V@@3 (type v@@1)))
(let ((U@@3 (type u@@0)))
 (=> (and (= (type m@@11) (MapType U@@3 V@@3)) (U_2_bool (MapType0Select (|Map#Domain| m@@11) u@@0))) (= (|Map#Card| (|Map#Build| m@@11 u@@0 v@@1)) (|Map#Card| m@@11)))))
 :qid |stdinbpl.801:21|
 :skolemid |129|
 :pattern ( (|Map#Card| (|Map#Build| m@@11 u@@0 v@@1)))
 :pattern ( (|Map#Card| m@@11) (|Map#Build| m@@11 u@@0 v@@1))
)))
(assert (forall ((arg0@@49 T@U) ) (! (let ((T@@15 (type arg0@@49)))
(= (type (|Set#Singleton| arg0@@49)) (MapType0Type T@@15 boolType)))
 :qid |funType:Set#Singleton|
 :pattern ( (|Set#Singleton| arg0@@49))
)))
(assert (forall ((r T@U) (o T@U) ) (! (let ((T@@16 (type r)))
 (=> (= (type o) T@@16) (= (U_2_bool (MapType0Select (|Set#Singleton| r) o)) (= r o))))
 :qid |stdinbpl.555:18|
 :skolemid |63|
 :pattern ( (MapType0Select (|Set#Singleton| r) o))
)))
(assert (forall ((arg0@@50 T@U) (arg1@@26 Int) ) (! (let ((T@@17 (SeqTypeInv0 (type arg0@@50))))
(= (type (|Seq#Take| arg0@@50 arg1@@26)) (SeqType T@@17)))
 :qid |funType:Seq#Take|
 :pattern ( (|Seq#Take| arg0@@50 arg1@@26))
)))
(assert (forall ((s@@2 T@U) (n@@2 Int) ) (! (let ((T@@18 (SeqTypeInv0 (type s@@2))))
 (=> (= (type s@@2) (SeqType T@@18)) (and (=> (<= 0 n@@2) (and (=> (<= n@@2 (|Seq#Length| s@@2)) (= (|Seq#Length| (|Seq#Take| s@@2 n@@2)) n@@2)) (=> (< (|Seq#Length| s@@2) n@@2) (= (|Seq#Length| (|Seq#Take| s@@2 n@@2)) (|Seq#Length| s@@2))))) (=> (< n@@2 0) (= (|Seq#Length| (|Seq#Take| s@@2 n@@2)) 0)))))
 :qid |stdinbpl.258:18|
 :skolemid |36|
 :pattern ( (|Seq#Length| (|Seq#Take| s@@2 n@@2)))
 :pattern ( (|Seq#Take| s@@2 n@@2) (|Seq#Length| s@@2))
)))
(assert  (and (and (and (and (and (forall ((arg0@@51 T@T) ) (! (= (Ctor (ListDomainTypeType arg0@@51)) 15)
 :qid |ctor:ListDomainTypeType|
)) (forall ((arg0@@52 T@T) ) (! (= (ListDomainTypeTypeInv0 (ListDomainTypeType arg0@@52)) arg0@@52)
 :qid |typeInv:ListDomainTypeTypeInv0|
 :pattern ( (ListDomainTypeType arg0@@52))
))) (forall ((arg0@@53 T@U) ) (! (let ((T@@19 (ListDomainTypeTypeInv0 (type arg0@@53))))
(= (type (get_List_value arg0@@53)) T@@19))
 :qid |funType:get_List_value|
 :pattern ( (get_List_value arg0@@53))
))) (forall ((arg0@@54 T@U) ) (! (let ((T@@20 (ListDomainTypeTypeInv0 (type arg0@@54))))
(= (type (get_List_tail arg0@@54)) (ListDomainTypeType T@@20)))
 :qid |funType:get_List_tail|
 :pattern ( (get_List_tail arg0@@54))
))) (forall ((T@@21 T@T) ) (! (= (type (Nil T@@21)) (ListDomainTypeType T@@21))
 :qid |funType:Nil|
 :pattern ( (Nil T@@21))
))) (forall ((arg0@@55 T@U) (arg1@@27 T@U) ) (! (let ((T@@22 (type arg0@@55)))
(= (type (Cons arg0@@55 arg1@@27)) (ListDomainTypeType T@@22)))
 :qid |funType:Cons|
 :pattern ( (Cons arg0@@55 arg1@@27))
))))
(assert (forall ((t_2 T@U) ) (! (let ((T@@23 (ListDomainTypeTypeInv0 (type t_2))))
 (=> (= (type t_2) (ListDomainTypeType T@@23)) (or (= t_2 (Nil T@@23)) (= t_2 (Cons (get_List_value t_2) (get_List_tail t_2))))))
 :qid |stdinbpl.878:19|
 :skolemid |143|
 :pattern ( (List_tag t_2))
 :pattern ( (get_List_value t_2))
 :pattern ( (get_List_tail t_2))
)))
(assert (forall ((arg0@@56 Int) (arg1@@28 Int) ) (! (= (type (|Seq#Range| arg0@@56 arg1@@28)) (SeqType intType))
 :qid |funType:Seq#Range|
 :pattern ( (|Seq#Range| arg0@@56 arg1@@28))
)))
(assert (forall ((q@min Int) (q@max Int) (v@@2 T@U) ) (!  (=> (= (type v@@2) intType) (= (|Seq#Contains| (|Seq#Range| q@min q@max) v@@2)  (and (<= q@min (U_2_int v@@2)) (< (U_2_int v@@2) q@max))))
 :qid |stdinbpl.531:15|
 :skolemid |57|
 :pattern ( (|Seq#Contains| (|Seq#Range| q@min q@max) v@@2))
)))
(assert (forall ((a@@5 T@U) (b@@5 T@U) ) (! (let ((T@@24 (MapType0TypeInv0 (type a@@5))))
 (=> (and (= (type a@@5) (MapType0Type T@@24 boolType)) (= (type b@@5) (MapType0Type T@@24 boolType))) (= (+ (|Set#Card| (|Set#Union| a@@5 b@@5)) (|Set#Card| (|Set#Intersection| a@@5 b@@5))) (+ (|Set#Card| a@@5) (|Set#Card| b@@5)))))
 :qid |stdinbpl.594:18|
 :skolemid |78|
 :pattern ( (|Set#Card| (|Set#Union| a@@5 b@@5)))
 :pattern ( (|Set#Card| (|Set#Intersection| a@@5 b@@5)))
)))
(assert (forall ((s@@3 T@U) (x@@8 T@U) ) (! (let ((T@@25 (type x@@8)))
 (=> (and (= (type s@@3) (SeqType T@@25)) (|Seq#Contains| s@@3 x@@8)) (and (and (<= 0 (|Seq#Skolem| s@@3 x@@8)) (< (|Seq#Skolem| s@@3 x@@8) (|Seq#Length| s@@3))) (= (|Seq#Index| s@@3 (|Seq#Skolem| s@@3 x@@8)) x@@8))))
 :qid |stdinbpl.389:18|
 :skolemid |47|
 :pattern ( (|Seq#Contains| s@@3 x@@8))
)))
(assert  (and (and (and (and (and (and (and (and (and (forall ((arg0@@57 T@T) (arg1@@29 T@T) ) (! (= (Ctor (SpecialListDomainTypeType arg0@@57 arg1@@29)) 16)
 :qid |ctor:SpecialListDomainTypeType|
)) (forall ((arg0@@58 T@T) (arg1@@30 T@T) ) (! (= (SpecialListDomainTypeTypeInv0 (SpecialListDomainTypeType arg0@@58 arg1@@30)) arg0@@58)
 :qid |typeInv:SpecialListDomainTypeTypeInv0|
 :pattern ( (SpecialListDomainTypeType arg0@@58 arg1@@30))
))) (forall ((arg0@@59 T@T) (arg1@@31 T@T) ) (! (= (SpecialListDomainTypeTypeInv1 (SpecialListDomainTypeType arg0@@59 arg1@@31)) arg1@@31)
 :qid |typeInv:SpecialListDomainTypeTypeInv1|
 :pattern ( (SpecialListDomainTypeType arg0@@59 arg1@@31))
))) (forall ((arg0@@60 T@U) ) (! (let ((S (SpecialListDomainTypeTypeInv1 (type arg0@@60))))
(= (type (get_SpecialList_elemS arg0@@60)) S))
 :qid |funType:get_SpecialList_elemS|
 :pattern ( (get_SpecialList_elemS arg0@@60))
))) (forall ((arg0@@61 T@U) ) (! (let ((S@@0 (SpecialListDomainTypeTypeInv1 (type arg0@@61))))
(let ((T@@26 (SpecialListDomainTypeTypeInv0 (type arg0@@61))))
(= (type (get_SpecialList_tailS arg0@@61)) (SpecialListDomainTypeType T@@26 S@@0))))
 :qid |funType:get_SpecialList_tailS|
 :pattern ( (get_SpecialList_tailS arg0@@61))
))) (forall ((T@@27 T@T) (S@@1 T@T) ) (! (= (type (SpecialNil T@@27 S@@1)) (SpecialListDomainTypeType T@@27 S@@1))
 :qid |funType:SpecialNil|
 :pattern ( (SpecialNil T@@27 S@@1))
))) (forall ((arg0@@62 T@U) (arg1@@32 T@U) ) (! (let ((S@@2 (SpecialListDomainTypeTypeInv1 (type arg1@@32))))
(let ((T@@28 (type arg0@@62)))
(= (type (TCons arg0@@62 arg1@@32)) (SpecialListDomainTypeType T@@28 S@@2))))
 :qid |funType:TCons|
 :pattern ( (TCons arg0@@62 arg1@@32))
))) (forall ((arg0@@63 T@U) ) (! (let ((T@@29 (SpecialListDomainTypeTypeInv0 (type arg0@@63))))
(= (type (get_SpecialList_elemT arg0@@63)) T@@29))
 :qid |funType:get_SpecialList_elemT|
 :pattern ( (get_SpecialList_elemT arg0@@63))
))) (forall ((arg0@@64 T@U) ) (! (let ((S@@3 (SpecialListDomainTypeTypeInv1 (type arg0@@64))))
(let ((T@@30 (SpecialListDomainTypeTypeInv0 (type arg0@@64))))
(= (type (get_SpecialList_tailT arg0@@64)) (SpecialListDomainTypeType T@@30 S@@3))))
 :qid |funType:get_SpecialList_tailT|
 :pattern ( (get_SpecialList_tailT arg0@@64))
))) (forall ((arg0@@65 T@U) (arg1@@33 T@U) ) (! (let ((T@@31 (SpecialListDomainTypeTypeInv0 (type arg1@@33))))
(let ((S@@4 (type arg0@@65)))
(= (type (SCons arg0@@65 arg1@@33)) (SpecialListDomainTypeType T@@31 S@@4))))
 :qid |funType:SCons|
 :pattern ( (SCons arg0@@65 arg1@@33))
))))
(assert (forall ((t_2@@0 T@U) ) (! (let ((S@@5 (SpecialListDomainTypeTypeInv1 (type t_2@@0))))
(let ((T@@32 (SpecialListDomainTypeTypeInv0 (type t_2@@0))))
 (=> (= (type t_2@@0) (SpecialListDomainTypeType T@@32 S@@5)) (or (or (= t_2@@0 (SpecialNil T@@32 S@@5)) (= t_2@@0 (TCons (get_SpecialList_elemT t_2@@0) (get_SpecialList_tailT t_2@@0)))) (= t_2@@0 (SCons (get_SpecialList_elemS t_2@@0) (get_SpecialList_tailS t_2@@0)))))))
 :qid |stdinbpl.957:22|
 :skolemid |151|
 :pattern ( (SpecialList_tag t_2@@0))
 :pattern ( (get_SpecialList_elemS t_2@@0))
 :pattern ( (get_SpecialList_tailS t_2@@0))
)))
(assert  (and (= (Ctor NormalFieldType) 17) (= (type $allocated) (FieldType NormalFieldType boolType))))
(assert (forall ((Heap@@2 T@U) (ExhaleHeap@@1 T@U) (Mask@@2 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@2) (MapType1Type RefType)) (= (type ExhaleHeap@@1) (MapType1Type RefType))) (= (type Mask@@2) (MapType2Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@2 ExhaleHeap@@1 Mask@@2)) (U_2_bool (MapType1Select Heap@@2 o_1 $allocated))) (U_2_bool (MapType1Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.73:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@2 ExhaleHeap@@1 Mask@@2) (MapType1Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert (forall ((s@@4 T@U) (n@@3 Int) ) (! (let ((T@@33 (SeqTypeInv0 (type s@@4))))
 (=> (and (= (type s@@4) (SeqType T@@33)) (<= n@@3 0)) (= (|Seq#Drop| s@@4 n@@3) s@@4)))
 :qid |stdinbpl.373:18|
 :skolemid |45|
 :pattern ( (|Seq#Drop| s@@4 n@@3))
)))
(assert (forall ((i@@0 Int) (j@@0 Int) ) (! (= (|Seq#Sub| i@@0 j@@0) (- i@@0 j@@0))
 :qid |stdinbpl.227:15|
 :skolemid |30|
 :pattern ( (|Seq#Sub| i@@0 j@@0))
)))
(assert (forall ((i@@1 Int) (j@@1 Int) ) (! (= (|Seq#Add| i@@1 j@@1) (+ i@@1 j@@1))
 :qid |stdinbpl.225:15|
 :skolemid |29|
 :pattern ( (|Seq#Add| i@@1 j@@1))
)))
(assert (forall ((a@@6 Int) ) (!  (=> (<= 0 a@@6) (= (|Math#clip| a@@6) a@@6))
 :qid |stdinbpl.637:15|
 :skolemid |90|
 :pattern ( (|Math#clip| a@@6))
)))
(assert (forall ((a@@7 T@U) (b@@6 T@U) (o@@0 T@U) ) (! (let ((T@@34 (type o@@0)))
 (=> (and (= (type a@@7) (MultiSetType T@@34)) (= (type b@@6) (MultiSetType T@@34))) (= (|MultiSet#Select| (|MultiSet#Intersection| a@@7 b@@6) o@@0) (|Math#min| (|MultiSet#Select| a@@7 o@@0) (|MultiSet#Select| b@@6 o@@0)))))
 :qid |stdinbpl.688:18|
 :skolemid |105|
 :pattern ( (|MultiSet#Select| (|MultiSet#Intersection| a@@7 b@@6) o@@0))
)))
(assert (forall ((arg0@@66 T@U) ) (! (let ((T@@35 (type arg0@@66)))
(= (type (|Seq#Singleton| arg0@@66)) (SeqType T@@35)))
 :qid |funType:Seq#Singleton|
 :pattern ( (|Seq#Singleton| arg0@@66))
)))
(assert (forall ((x@@9 T@U) (y@@2 T@U) ) (! (let ((T@@36 (type x@@9)))
 (=> (= (type y@@2) T@@36) (= (|Seq#Contains| (|Seq#Singleton| x@@9) y@@2) (= x@@9 y@@2))))
 :qid |stdinbpl.514:18|
 :skolemid |54|
 :pattern ( (|Seq#Contains| (|Seq#Singleton| x@@9) y@@2))
)))
(assert (forall ((s@@5 T@U) (n@@4 Int) (j@@2 Int) ) (! (let ((T@@37 (SeqTypeInv0 (type s@@5))))
 (=> (= (type s@@5) (SeqType T@@37)) (=> (and (and (<= 0 j@@2) (< j@@2 n@@4)) (< j@@2 (|Seq#Length| s@@5))) (= (|Seq#Index| (|Seq#Take| s@@5 n@@4) j@@2) (|Seq#Index| s@@5 j@@2)))))
 :qid |stdinbpl.266:18|
 :skolemid |37|
 :pattern ( (|Seq#Index| (|Seq#Take| s@@5 n@@4) j@@2))
 :pattern ( (|Seq#Index| s@@5 j@@2) (|Seq#Take| s@@5 n@@4))
)))
(assert (forall ((m@@12 T@U) (u@@1 T@U) (v@@3 T@U) ) (! (let ((V@@4 (type v@@3)))
(let ((U@@4 (type u@@1)))
 (=> (and (= (type m@@12) (MapType U@@4 V@@4)) (not (U_2_bool (MapType0Select (|Map#Domain| m@@12) u@@1)))) (= (|Map#Card| (|Map#Build| m@@12 u@@1 v@@3)) (+ (|Map#Card| m@@12) 1)))))
 :qid |stdinbpl.804:21|
 :skolemid |130|
 :pattern ( (|Map#Card| (|Map#Build| m@@12 u@@1 v@@3)))
 :pattern ( (|Map#Card| m@@12) (|Map#Build| m@@12 u@@1 v@@3))
)))
(assert (forall ((Heap@@3 T@U) (ExhaleHeap@@2 T@U) (Mask@@3 T@U) (o_1@@0 T@U) (f_2 T@U) ) (! (let ((B@@1 (FieldTypeInv1 (type f_2))))
(let ((A@@1 (FieldTypeInv0 (type f_2))))
 (=> (and (and (and (and (and (and (= (type Heap@@3) (MapType1Type RefType)) (= (type ExhaleHeap@@2) (MapType1Type RefType))) (= (type Mask@@3) (MapType2Type RefType realType))) (= (type o_1@@0) RefType)) (= (type f_2) (FieldType A@@1 B@@1))) (IdenticalOnKnownLocations Heap@@3 ExhaleHeap@@2 Mask@@3)) (HasDirectPerm Mask@@3 o_1@@0 f_2)) (= (MapType1Select Heap@@3 o_1@@0 f_2) (MapType1Select ExhaleHeap@@2 o_1@@0 f_2)))))
 :qid |stdinbpl.42:22|
 :skolemid |1|
 :pattern ( (IdenticalOnKnownLocations Heap@@3 ExhaleHeap@@2 Mask@@3) (MapType1Select ExhaleHeap@@2 o_1@@0 f_2))
)))
(assert (forall ((T@@38 T@T) ) (! (= (type (|Seq#Empty| T@@38)) (SeqType T@@38))
 :qid |funType:Seq#Empty|
 :pattern ( (|Seq#Empty| T@@38))
)))
(assert (forall ((T@@39 T@T) ) (! (= (|Seq#Length| (|Seq#Empty| T@@39)) 0)
 :skolemid |23|
)))
(assert  (and (= (type dummyHeap) (MapType1Type RefType)) (= (type ZeroMask) (MapType2Type RefType realType))))
(assert (state dummyHeap ZeroMask))
(assert (forall ((arg0@@67 T@U) (arg1@@34 T@U) ) (! (let ((T@@40 (type arg1@@34)))
(= (type (|MultiSet#UnionOne| arg0@@67 arg1@@34)) (MultiSetType T@@40)))
 :qid |funType:MultiSet#UnionOne|
 :pattern ( (|MultiSet#UnionOne| arg0@@67 arg1@@34))
)))
(assert (forall ((a@@8 T@U) (x@@10 T@U) ) (! (let ((T@@41 (type x@@10)))
 (=> (= (type a@@8) (MultiSetType T@@41)) (= (|MultiSet#Card| (|MultiSet#UnionOne| a@@8 x@@10)) (+ (|MultiSet#Card| a@@8) 1))))
 :qid |stdinbpl.674:18|
 :skolemid |101|
 :pattern ( (|MultiSet#Card| (|MultiSet#UnionOne| a@@8 x@@10)))
 :pattern ( (|MultiSet#UnionOne| a@@8 x@@10) (|MultiSet#Card| a@@8))
)))
(assert (forall ((a@@9 T@U) (b@@7 T@U) ) (! (let ((T@@42 (MultiSetTypeInv0 (type a@@9))))
 (=> (and (= (type a@@9) (MultiSetType T@@42)) (= (type b@@7) (MultiSetType T@@42))) (= (|MultiSet#Disjoint| a@@9 b@@7) (forall ((o@@1 T@U) ) (!  (=> (= (type o@@1) T@@42) (or (= (|MultiSet#Select| a@@9 o@@1) 0) (= (|MultiSet#Select| b@@7 o@@1) 0)))
 :qid |stdinbpl.724:39|
 :skolemid |116|
 :pattern ( (|MultiSet#Select| a@@9 o@@1))
 :pattern ( (|MultiSet#Select| b@@7 o@@1))
)))))
 :qid |stdinbpl.723:18|
 :skolemid |117|
 :pattern ( (|MultiSet#Disjoint| a@@9 b@@7))
)))
(assert (forall ((p T@U) (v_1 T@U) (w T@U) ) (! (let ((A@@2 (FieldTypeInv0 (type p))))
 (=> (and (and (= (type p) (FieldType A@@2 FrameTypeType)) (= (type v_1) FrameTypeType)) (= (type w) FrameTypeType)) (not (InsidePredicate p v_1 p w))))
 :qid |stdinbpl.170:19|
 :skolemid |21|
 :pattern ( (InsidePredicate p v_1 p w))
)))
(assert (forall ((arg0@@68 T@U) (arg1@@35 T@U) ) (! (let ((T@@43 (SeqTypeInv0 (type arg0@@68))))
(= (type (|Seq#Append| arg0@@68 arg1@@35)) (SeqType T@@43)))
 :qid |funType:Seq#Append|
 :pattern ( (|Seq#Append| arg0@@68 arg1@@35))
)))
(assert (forall ((s0 T@U) (s1 T@U) (n@@5 Int) ) (! (let ((T@@44 (SeqTypeInv0 (type s0))))
 (=> (and (= (type s0) (SeqType T@@44)) (= (type s1) (SeqType T@@44))) (=> (and (and (and (not (= s0 (|Seq#Empty| T@@44))) (not (= s1 (|Seq#Empty| T@@44)))) (<= (|Seq#Length| s0) n@@5)) (< n@@5 (|Seq#Length| (|Seq#Append| s0 s1)))) (and (= (|Seq#Add| (|Seq#Sub| n@@5 (|Seq#Length| s0)) (|Seq#Length| s0)) n@@5) (= (|Seq#Index| (|Seq#Append| s0 s1) n@@5) (|Seq#Index| s1 (|Seq#Sub| n@@5 (|Seq#Length| s0))))))))
 :qid |stdinbpl.238:18|
 :skolemid |32|
 :pattern ( (|Seq#Index| (|Seq#Append| s0 s1) n@@5))
)))
(assert (forall ((arg0@@69 T@U) ) (! (let ((T@@45 (type arg0@@69)))
(= (type (|MultiSet#Singleton| arg0@@69)) (MultiSetType T@@45)))
 :qid |funType:MultiSet#Singleton|
 :pattern ( (|MultiSet#Singleton| arg0@@69))
)))
(assert (forall ((r@@0 T@U) ) (!  (and (= (|MultiSet#Card| (|MultiSet#Singleton| r@@0)) 1) (= (|MultiSet#Select| (|MultiSet#Singleton| r@@0) r@@0) 1))
 :qid |stdinbpl.666:18|
 :skolemid |98|
 :pattern ( (|MultiSet#Singleton| r@@0))
)))
(assert (forall ((Heap@@4 T@U) (ExhaleHeap@@3 T@U) (Mask@@4 T@U) ) (!  (=> (and (and (and (= (type Heap@@4) (MapType1Type RefType)) (= (type ExhaleHeap@@3) (MapType1Type RefType))) (= (type Mask@@4) (MapType2Type RefType realType))) (IdenticalOnKnownLocations Heap@@4 ExhaleHeap@@3 Mask@@4)) (succHeap Heap@@4 ExhaleHeap@@3))
 :qid |stdinbpl.83:15|
 :skolemid |10|
 :pattern ( (IdenticalOnKnownLocations Heap@@4 ExhaleHeap@@3 Mask@@4))
)))
(assert (forall ((m@@13 T@U) (|m'| T@U) ) (! (let ((V@@5 (MapTypeInv1 (type m@@13))))
(let ((U@@5 (MapTypeInv0 (type m@@13))))
 (=> (and (and (= (type m@@13) (MapType U@@5 V@@5)) (= (type |m'|) (MapType U@@5 V@@5))) (|Map#Disjoint| m@@13 |m'|)) (forall ((o@@2 T@U) ) (!  (=> (= (type o@@2) U@@5) (or (not (U_2_bool (MapType0Select (|Map#Domain| m@@13) o@@2))) (not (U_2_bool (MapType0Select (|Map#Domain| |m'|) o@@2)))))
 :qid |stdinbpl.824:37|
 :skolemid |135|
 :pattern ( (MapType0Select (|Map#Domain| m@@13) o@@2))
 :pattern ( (MapType0Select (|Map#Domain| |m'|) o@@2))
)))))
 :qid |stdinbpl.822:21|
 :skolemid |136|
 :pattern ( (|Map#Disjoint| m@@13 |m'|))
)))
(assert (forall ((U@@6 T@T) (V@@6 T@T) ) (! (= (type (|Map#Empty| U@@6 V@@6)) (MapType U@@6 V@@6))
 :qid |funType:Map#Empty|
 :pattern ( (|Map#Empty| U@@6 V@@6))
)))
(assert (forall ((u@@2 T@U) (V@@7 T@T) ) (! (let ((U@@7 (type u@@2)))
 (not (U_2_bool (MapType0Select (|Map#Domain| (|Map#Empty| U@@7 V@@7)) u@@2))))
 :qid |stdinbpl.781:21|
 :skolemid |124|
 :pattern ( (let ((U@@7 (type u@@2)))
(MapType0Select (|Map#Domain| (|Map#Empty| U@@7 V@@7)) u@@2)))
)))
(assert (forall ((a@@10 T@U) (b@@8 T@U) ) (! (let ((T@@46 (MapType0TypeInv0 (type a@@10))))
 (=> (and (= (type a@@10) (MapType0Type T@@46 boolType)) (= (type b@@8) (MapType0Type T@@46 boolType))) (= (|Set#Equal| a@@10 b@@8) (forall ((o@@3 T@U) ) (!  (=> (= (type o@@3) T@@46) (= (U_2_bool (MapType0Select a@@10 o@@3)) (U_2_bool (MapType0Select b@@8 o@@3))))
 :qid |stdinbpl.619:31|
 :skolemid |84|
 :pattern ( (MapType0Select a@@10 o@@3))
 :pattern ( (MapType0Select b@@8 o@@3))
)))))
 :qid |stdinbpl.618:17|
 :skolemid |85|
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
(assert (forall ((a@@11 T@U) (b@@9 T@U) ) (! (let ((T@@47 (MultiSetTypeInv0 (type a@@11))))
 (=> (and (= (type a@@11) (MultiSetType T@@47)) (= (type b@@9) (MultiSetType T@@47))) (= (|MultiSet#Card| (|MultiSet#Union| a@@11 b@@9)) (+ (|MultiSet#Card| a@@11) (|MultiSet#Card| b@@9)))))
 :qid |stdinbpl.684:18|
 :skolemid |104|
 :pattern ( (|MultiSet#Card| (|MultiSet#Union| a@@11 b@@9)))
 :pattern ( (|MultiSet#Card| a@@11) (|MultiSet#Union| a@@11 b@@9))
 :pattern ( (|MultiSet#Card| b@@9) (|MultiSet#Union| a@@11 b@@9))
)))
(assert  (and (forall ((arg0@@70 Real) (arg1@@36 T@U) ) (! (= (type (ConditionalFrame arg0@@70 arg1@@36)) FrameTypeType)
 :qid |funType:ConditionalFrame|
 :pattern ( (ConditionalFrame arg0@@70 arg1@@36))
)) (= (type EmptyFrame) FrameTypeType)))
(assert (forall ((p@@0 Real) (f_6 T@U) ) (!  (=> (= (type f_6) FrameTypeType) (= (ConditionalFrame p@@0 f_6) (ite (> p@@0 0.0) f_6 EmptyFrame)))
 :qid |stdinbpl.158:15|
 :skolemid |19|
 :pattern ( (ConditionalFrame p@@0 f_6))
)))
(assert (forall ((q@min@@0 Int) (q@max@@0 Int) (j@@3 Int) ) (!  (=> (and (<= 0 j@@3) (< j@@3 (- q@max@@0 q@min@@0))) (= (U_2_int (|Seq#Index| (|Seq#Range| q@min@@0 q@max@@0) j@@3)) (+ q@min@@0 j@@3)))
 :qid |stdinbpl.529:15|
 :skolemid |56|
 :pattern ( (|Seq#Index| (|Seq#Range| q@min@@0 q@max@@0) j@@3))
)))
(assert (forall ((Mask@@5 T@U) (o_2@@0 T@U) (f_4@@0 T@U) ) (! (let ((B@@3 (FieldTypeInv1 (type f_4@@0))))
(let ((A@@4 (FieldTypeInv0 (type f_4@@0))))
 (=> (and (and (= (type Mask@@5) (MapType2Type RefType realType)) (= (type o_2@@0) RefType)) (= (type f_4@@0) (FieldType A@@4 B@@3))) (= (HasDirectPerm Mask@@5 o_2@@0 f_4@@0) (> (U_2_real (MapType2Select Mask@@5 o_2@@0 f_4@@0)) NoPerm)))))
 :qid |stdinbpl.133:22|
 :skolemid |17|
 :pattern ( (HasDirectPerm Mask@@5 o_2@@0 f_4@@0))
)))
(assert (forall ((s0@@0 T@U) (s1@@0 T@U) ) (! (let ((T@@48 (SeqTypeInv0 (type s0@@0))))
 (=> (and (and (= (type s0@@0) (SeqType T@@48)) (= (type s1@@0) (SeqType T@@48))) (and (not (= s0@@0 (|Seq#Empty| T@@48))) (not (= s1@@0 (|Seq#Empty| T@@48))))) (= (|Seq#Length| (|Seq#Append| s0@@0 s1@@0)) (+ (|Seq#Length| s0@@0) (|Seq#Length| s1@@0)))))
 :qid |stdinbpl.207:18|
 :skolemid |26|
 :pattern ( (|Seq#Length| (|Seq#Append| s0@@0 s1@@0)))
)))
(assert (forall ((m@@14 T@U) (u@@3 T@U) ) (! (let ((V@@8 (MapTypeInv1 (type m@@14))))
(let ((U@@8 (type u@@3)))
 (=> (and (= (type m@@14) (MapType U@@8 V@@8)) (U_2_bool (MapType0Select (|Map#Domain| m@@14) u@@3))) (U_2_bool (MapType0Select (|Map#Values| m@@14) (MapType0Select (|Map#Elements| m@@14) u@@3))))))
 :qid |stdinbpl.768:20|
 :skolemid |122|
 :pattern ( (MapType0Select (|Map#Elements| m@@14) u@@3))
)))
(assert (forall ((s@@6 T@U) (t T@U) (n@@6 Int) ) (! (let ((T@@49 (SeqTypeInv0 (type s@@6))))
 (=> (and (and (= (type s@@6) (SeqType T@@49)) (= (type t) (SeqType T@@49))) (and (> n@@6 0) (> n@@6 (|Seq#Length| s@@6)))) (and (= (|Seq#Add| (|Seq#Sub| n@@6 (|Seq#Length| s@@6)) (|Seq#Length| s@@6)) n@@6) (= (|Seq#Drop| (|Seq#Append| s@@6 t) n@@6) (|Seq#Drop| t (|Seq#Sub| n@@6 (|Seq#Length| s@@6)))))))
 :qid |stdinbpl.363:18|
 :skolemid |44|
 :pattern ( (|Seq#Drop| (|Seq#Append| s@@6 t) n@@6))
)))
(assert (forall ((o_2@@1 T@U) (f_4@@1 T@U) ) (! (let ((B@@4 (FieldTypeInv1 (type f_4@@1))))
(let ((A@@5 (FieldTypeInv0 (type f_4@@1))))
 (=> (and (= (type o_2@@1) RefType) (= (type f_4@@1) (FieldType A@@5 B@@4))) (= (U_2_real (MapType2Select ZeroMask o_2@@1 f_4@@1)) NoPerm))))
 :qid |stdinbpl.106:22|
 :skolemid |13|
 :pattern ( (MapType2Select ZeroMask o_2@@1 f_4@@1))
)))
(assert (forall ((a@@12 T@U) (b@@10 T@U) (o@@4 T@U) ) (! (let ((T@@50 (type o@@4)))
 (=> (and (= (type a@@12) (MapType0Type T@@50 boolType)) (= (type b@@10) (MapType0Type T@@50 boolType))) (= (U_2_bool (MapType0Select (|Set#Intersection| a@@12 b@@10) o@@4))  (and (U_2_bool (MapType0Select a@@12 o@@4)) (U_2_bool (MapType0Select b@@10 o@@4))))))
 :qid |stdinbpl.583:18|
 :skolemid |73|
 :pattern ( (MapType0Select (|Set#Intersection| a@@12 b@@10) o@@4))
 :pattern ( (|Set#Intersection| a@@12 b@@10) (MapType0Select a@@12 o@@4))
 :pattern ( (|Set#Intersection| a@@12 b@@10) (MapType0Select b@@10 o@@4))
)))
(assert (forall ((s@@7 T@U) (t@@0 T@U) (n@@7 Int) ) (! (let ((T@@51 (SeqTypeInv0 (type s@@7))))
 (=> (and (and (= (type s@@7) (SeqType T@@51)) (= (type t@@0) (SeqType T@@51))) (and (> n@@7 0) (> n@@7 (|Seq#Length| s@@7)))) (and (= (|Seq#Add| (|Seq#Sub| n@@7 (|Seq#Length| s@@7)) (|Seq#Length| s@@7)) n@@7) (= (|Seq#Take| (|Seq#Append| s@@7 t@@0) n@@7) (|Seq#Append| s@@7 (|Seq#Take| t@@0 (|Seq#Sub| n@@7 (|Seq#Length| s@@7))))))))
 :qid |stdinbpl.350:18|
 :skolemid |42|
 :pattern ( (|Seq#Take| (|Seq#Append| s@@7 t@@0) n@@7))
)))
(assert (forall ((q@min@@1 Int) (q@max@@1 Int) ) (!  (and (=> (< q@min@@1 q@max@@1) (= (|Seq#Length| (|Seq#Range| q@min@@1 q@max@@1)) (- q@max@@1 q@min@@1))) (=> (<= q@max@@1 q@min@@1) (= (|Seq#Length| (|Seq#Range| q@min@@1 q@max@@1)) 0)))
 :qid |stdinbpl.528:15|
 :skolemid |55|
 :pattern ( (|Seq#Length| (|Seq#Range| q@min@@1 q@max@@1)))
)))
(assert (forall ((arg0@@71 T@U) (arg1@@37 T@U) ) (! (let ((T@@52 (MapType0TypeInv0 (type arg0@@71))))
(= (type (|Set#Difference| arg0@@71 arg1@@37)) (MapType0Type T@@52 boolType)))
 :qid |funType:Set#Difference|
 :pattern ( (|Set#Difference| arg0@@71 arg1@@37))
)))
(assert (forall ((a@@13 T@U) (b@@11 T@U) (o@@5 T@U) ) (! (let ((T@@53 (type o@@5)))
 (=> (and (= (type a@@13) (MapType0Type T@@53 boolType)) (= (type b@@11) (MapType0Type T@@53 boolType))) (= (U_2_bool (MapType0Select (|Set#Difference| a@@13 b@@11) o@@5))  (and (U_2_bool (MapType0Select a@@13 o@@5)) (not (U_2_bool (MapType0Select b@@11 o@@5)))))))
 :qid |stdinbpl.598:18|
 :skolemid |79|
 :pattern ( (MapType0Select (|Set#Difference| a@@13 b@@11) o@@5))
 :pattern ( (|Set#Difference| a@@13 b@@11) (MapType0Select a@@13 o@@5))
)))
(assert (forall ((m@@15 T@U) (u@@4 T@U) ) (! (let ((V@@9 (MapTypeInv1 (type m@@15))))
(let ((U@@9 (type u@@4)))
 (=> (and (= (type m@@15) (MapType U@@9 V@@9)) (U_2_bool (MapType0Select (|Map#Domain| m@@15) u@@4))) (> (|Set#Card| (|Map#Values| m@@15)) 0))))
 :qid |stdinbpl.774:20|
 :skolemid |123|
 :pattern ( (MapType0Select (|Map#Domain| m@@15) u@@4))
 :pattern ( (MapType0Select (|Map#Elements| m@@15) u@@4))
)))
(assert (forall ((a@@14 T@U) (b@@12 T@U) ) (! (let ((T@@54 (SeqTypeInv0 (type a@@14))))
 (=> (and (and (= (type a@@14) (SeqType T@@54)) (= (type b@@12) (SeqType T@@54))) (|Seq#Equal| a@@14 b@@12)) (= a@@14 b@@12)))
 :qid |stdinbpl.501:18|
 :skolemid |53|
 :pattern ( (|Seq#Equal| a@@14 b@@12))
)))
(assert (forall ((a@@15 T@U) (b@@13 T@U) ) (! (let ((T@@55 (MapType0TypeInv0 (type a@@15))))
 (=> (and (and (= (type a@@15) (MapType0Type T@@55 boolType)) (= (type b@@13) (MapType0Type T@@55 boolType))) (|Set#Equal| a@@15 b@@13)) (= a@@15 b@@13)))
 :qid |stdinbpl.620:17|
 :skolemid |86|
 :pattern ( (|Set#Equal| a@@15 b@@13))
)))
(assert (forall ((a@@16 T@U) (b@@14 T@U) ) (! (let ((T@@56 (MultiSetTypeInv0 (type a@@16))))
 (=> (and (and (= (type a@@16) (MultiSetType T@@56)) (= (type b@@14) (MultiSetType T@@56))) (|MultiSet#Equal| a@@16 b@@14)) (= a@@16 b@@14)))
 :qid |stdinbpl.719:17|
 :skolemid |115|
 :pattern ( (|MultiSet#Equal| a@@16 b@@14))
)))
(assert (forall ((m@@16 T@U) (|m'@@0| T@U) ) (! (let ((V@@10 (MapTypeInv1 (type m@@16))))
(let ((U@@10 (MapTypeInv0 (type m@@16))))
 (=> (and (and (= (type m@@16) (MapType U@@10 V@@10)) (= (type |m'@@0|) (MapType U@@10 V@@10))) (|Map#Equal| m@@16 |m'@@0|)) (= m@@16 |m'@@0|))))
 :qid |stdinbpl.816:21|
 :skolemid |134|
 :pattern ( (|Map#Equal| m@@16 |m'@@0|))
)))
(assert (forall ((arg0@@72 T@U) (arg1@@38 T@U) ) (! (let ((T@@57 (type arg1@@38)))
(= (type (|Set#UnionOne| arg0@@72 arg1@@38)) (MapType0Type T@@57 boolType)))
 :qid |funType:Set#UnionOne|
 :pattern ( (|Set#UnionOne| arg0@@72 arg1@@38))
)))
(assert (forall ((a@@17 T@U) (x@@11 T@U) (y@@3 T@U) ) (! (let ((T@@58 (type x@@11)))
 (=> (and (and (= (type a@@17) (MapType0Type T@@58 boolType)) (= (type y@@3) T@@58)) (U_2_bool (MapType0Select a@@17 y@@3))) (U_2_bool (MapType0Select (|Set#UnionOne| a@@17 x@@11) y@@3))))
 :qid |stdinbpl.563:18|
 :skolemid |67|
 :pattern ( (|Set#UnionOne| a@@17 x@@11) (MapType0Select a@@17 y@@3))
)))
(assert (forall ((a@@18 T@U) (b@@15 T@U) (y@@4 T@U) ) (! (let ((T@@59 (type y@@4)))
 (=> (and (and (= (type a@@18) (MapType0Type T@@59 boolType)) (= (type b@@15) (MapType0Type T@@59 boolType))) (U_2_bool (MapType0Select a@@18 y@@4))) (U_2_bool (MapType0Select (|Set#Union| a@@18 b@@15) y@@4))))
 :qid |stdinbpl.573:18|
 :skolemid |71|
 :pattern ( (|Set#Union| a@@18 b@@15) (MapType0Select a@@18 y@@4))
)))
(assert (forall ((a@@19 T@U) (b@@16 T@U) (y@@5 T@U) ) (! (let ((T@@60 (type y@@5)))
 (=> (and (and (= (type a@@19) (MapType0Type T@@60 boolType)) (= (type b@@16) (MapType0Type T@@60 boolType))) (U_2_bool (MapType0Select b@@16 y@@5))) (U_2_bool (MapType0Select (|Set#Union| a@@19 b@@16) y@@5))))
 :qid |stdinbpl.575:18|
 :skolemid |72|
 :pattern ( (|Set#Union| a@@19 b@@16) (MapType0Select b@@16 y@@5))
)))
(assert (forall ((ms T@U) (x@@12 T@U) ) (! (let ((T@@61 (type x@@12)))
 (=> (= (type ms) (MultiSetType T@@61)) (>= (|MultiSet#Select| ms x@@12) 0)))
 :qid |stdinbpl.650:18|
 :skolemid |92|
 :pattern ( (|MultiSet#Select| ms x@@12))
)))
(assert (forall ((a@@20 T@U) (x@@13 T@U) (o@@6 T@U) ) (! (let ((T@@62 (type x@@13)))
 (=> (and (= (type a@@20) (MapType0Type T@@62 boolType)) (= (type o@@6) T@@62)) (= (U_2_bool (MapType0Select (|Set#UnionOne| a@@20 x@@13) o@@6))  (or (= o@@6 x@@13) (U_2_bool (MapType0Select a@@20 o@@6))))))
 :qid |stdinbpl.559:18|
 :skolemid |65|
 :pattern ( (MapType0Select (|Set#UnionOne| a@@20 x@@13) o@@6))
)))
(assert (forall ((a@@21 T@U) (b@@17 T@U) (y@@6 T@U) ) (! (let ((T@@63 (type y@@6)))
 (=> (and (and (= (type a@@21) (MapType0Type T@@63 boolType)) (= (type b@@17) (MapType0Type T@@63 boolType))) (U_2_bool (MapType0Select b@@17 y@@6))) (not (U_2_bool (MapType0Select (|Set#Difference| a@@21 b@@17) y@@6)))))
 :qid |stdinbpl.600:18|
 :skolemid |80|
 :pattern ( (|Set#Difference| a@@21 b@@17) (MapType0Select b@@17 y@@6))
)))
(assert (forall ((m@@17 T@U) (|m'@@1| T@U) ) (! (let ((V@@11 (MapTypeInv1 (type m@@17))))
(let ((U@@11 (MapTypeInv0 (type m@@17))))
 (=> (and (and (= (type m@@17) (MapType U@@11 V@@11)) (= (type |m'@@1|) (MapType U@@11 V@@11))) (and (forall ((u@@5 T@U) ) (!  (=> (= (type u@@5) U@@11) (= (U_2_bool (MapType0Select (|Map#Domain| m@@17) u@@5)) (U_2_bool (MapType0Select (|Map#Domain| |m'@@1|) u@@5))))
 :qid |stdinbpl.813:12|
 :skolemid |131|
 :no-pattern (type u@@5)
 :no-pattern (U_2_int u@@5)
 :no-pattern (U_2_bool u@@5)
)) (forall ((u@@6 T@U) ) (!  (=> (and (= (type u@@6) U@@11) (U_2_bool (MapType0Select (|Map#Domain| m@@17) u@@6))) (= (MapType0Select (|Map#Elements| m@@17) u@@6) (MapType0Select (|Map#Elements| |m'@@1|) u@@6)))
 :qid |stdinbpl.814:14|
 :skolemid |132|
 :no-pattern (type u@@6)
 :no-pattern (U_2_int u@@6)
 :no-pattern (U_2_bool u@@6)
)))) (|Map#Equal| m@@17 |m'@@1|))))
 :qid |stdinbpl.811:21|
 :skolemid |133|
 :pattern ( (|Map#Equal| m@@17 |m'@@1|))
)))
(assert (forall ((s@@8 T@U) (i@@2 Int) ) (! (let ((T@@64 (SeqTypeInv0 (type s@@8))))
 (=> (= (type s@@8) (SeqType T@@64)) (=> (and (<= 0 i@@2) (< i@@2 (|Seq#Length| s@@8))) (|Seq#ContainsTrigger| s@@8 (|Seq#Index| s@@8 i@@2)))))
 :qid |stdinbpl.394:18|
 :skolemid |49|
 :pattern ( (|Seq#Index| s@@8 i@@2))
)))
(assert (forall ((a@@22 T@U) (b@@18 T@U) ) (! (let ((T@@65 (MapType0TypeInv0 (type a@@22))))
 (=> (and (= (type a@@22) (MapType0Type T@@65 boolType)) (= (type b@@18) (MapType0Type T@@65 boolType))) (and (= (+ (+ (|Set#Card| (|Set#Difference| a@@22 b@@18)) (|Set#Card| (|Set#Difference| b@@18 a@@22))) (|Set#Card| (|Set#Intersection| a@@22 b@@18))) (|Set#Card| (|Set#Union| a@@22 b@@18))) (= (|Set#Card| (|Set#Difference| a@@22 b@@18)) (- (|Set#Card| a@@22) (|Set#Card| (|Set#Intersection| a@@22 b@@18)))))))
 :qid |stdinbpl.602:18|
 :skolemid |81|
 :pattern ( (|Set#Card| (|Set#Difference| a@@22 b@@18)))
)))
(assert (forall ((s0@@1 T@U) (s1@@1 T@U) ) (! (let ((T@@66 (SeqTypeInv0 (type s0@@1))))
 (=> (and (= (type s0@@1) (SeqType T@@66)) (= (type s1@@1) (SeqType T@@66))) (and (=> (= s0@@1 (|Seq#Empty| T@@66)) (= (|Seq#Append| s0@@1 s1@@1) s1@@1)) (=> (= s1@@1 (|Seq#Empty| T@@66)) (= (|Seq#Append| s0@@1 s1@@1) s0@@1)))))
 :qid |stdinbpl.213:18|
 :skolemid |27|
 :pattern ( (|Seq#Append| s0@@1 s1@@1))
)))
(assert (forall ((t@@1 T@U) ) (! (= (|Seq#Index| (|Seq#Singleton| t@@1) 0) t@@1)
 :qid |stdinbpl.217:18|
 :skolemid |28|
 :pattern ( (|Seq#Singleton| t@@1))
)))
(assert (forall ((s@@9 T@U) ) (! (let ((T@@67 (SeqTypeInv0 (type s@@9))))
 (=> (= (type s@@9) (SeqType T@@67)) (<= 0 (|Seq#Length| s@@9))))
 :qid |stdinbpl.196:18|
 :skolemid |22|
 :pattern ( (|Seq#Length| s@@9))
)))
(assert (forall ((s@@10 T@U) ) (! (let ((T@@68 (MapType0TypeInv0 (type s@@10))))
 (=> (= (type s@@10) (MapType0Type T@@68 boolType)) (<= 0 (|Set#Card| s@@10))))
 :qid |stdinbpl.545:18|
 :skolemid |58|
 :pattern ( (|Set#Card| s@@10))
)))
(assert (forall ((s@@11 T@U) ) (! (let ((T@@69 (MultiSetTypeInv0 (type s@@11))))
 (=> (= (type s@@11) (MultiSetType T@@69)) (<= 0 (|MultiSet#Card| s@@11))))
 :qid |stdinbpl.653:18|
 :skolemid |93|
 :pattern ( (|MultiSet#Card| s@@11))
)))
(assert (forall ((m@@18 T@U) ) (! (let ((V@@12 (MapTypeInv1 (type m@@18))))
(let ((U@@12 (MapTypeInv0 (type m@@18))))
 (=> (= (type m@@18) (MapType U@@12 V@@12)) (<= 0 (|Map#Card| m@@18)))))
 :qid |stdinbpl.743:20|
 :skolemid |118|
 :pattern ( (|Map#Card| m@@18))
)))
(assert (forall ((T@@70 T@T) ) (! (= (type (|MultiSet#Empty| T@@70)) (MultiSetType T@@70))
 :qid |funType:MultiSet#Empty|
 :pattern ( (|MultiSet#Empty| T@@70))
)))
(assert (forall ((o@@7 T@U) ) (! (let ((T@@71 (type o@@7)))
(= (|MultiSet#Select| (|MultiSet#Empty| T@@71) o@@7) 0))
 :qid |stdinbpl.658:18|
 :skolemid |94|
 :pattern ( (let ((T@@71 (type o@@7)))
(|MultiSet#Select| (|MultiSet#Empty| T@@71) o@@7)))
)))
(assert (forall ((a@@23 T@U) (x@@14 T@U) ) (! (let ((T@@72 (type x@@14)))
 (=> (= (type a@@23) (MapType0Type T@@72 boolType)) (U_2_bool (MapType0Select (|Set#UnionOne| a@@23 x@@14) x@@14))))
 :qid |stdinbpl.561:18|
 :skolemid |66|
 :pattern ( (|Set#UnionOne| a@@23 x@@14))
)))
(assert (forall ((s0@@2 T@U) (s1@@2 T@U) ) (! (let ((T@@73 (SeqTypeInv0 (type s0@@2))))
 (=> (and (and (= (type s0@@2) (SeqType T@@73)) (= (type s1@@2) (SeqType T@@73))) (|Seq#Equal| s0@@2 s1@@2)) (and (= (|Seq#Length| s0@@2) (|Seq#Length| s1@@2)) (forall ((j@@4 Int) ) (!  (=> (and (<= 0 j@@4) (< j@@4 (|Seq#Length| s0@@2))) (= (|Seq#Index| s0@@2 j@@4) (|Seq#Index| s1@@2 j@@4)))
 :qid |stdinbpl.491:13|
 :skolemid |50|
 :pattern ( (|Seq#Index| s0@@2 j@@4))
 :pattern ( (|Seq#Index| s1@@2 j@@4))
)))))
 :qid |stdinbpl.488:18|
 :skolemid |51|
 :pattern ( (|Seq#Equal| s0@@2 s1@@2))
)))
(assert (forall ((Heap@@5 T@U) (ExhaleHeap@@4 T@U) (Mask@@6 T@U) (pm_f@@1 T@U) ) (! (let ((C@@1 (FieldTypeInv0 (type pm_f@@1))))
 (=> (and (and (and (and (and (= (type Heap@@5) (MapType1Type RefType)) (= (type ExhaleHeap@@4) (MapType1Type RefType))) (= (type Mask@@6) (MapType2Type RefType realType))) (= (type pm_f@@1) (FieldType C@@1 FrameTypeType))) (IdenticalOnKnownLocations Heap@@5 ExhaleHeap@@4 Mask@@6)) (and (HasDirectPerm Mask@@6 null pm_f@@1) (IsPredicateField pm_f@@1))) (forall ((o2 T@U) (f_2@@0 T@U) ) (! (let ((B@@5 (FieldTypeInv1 (type f_2@@0))))
(let ((A@@6 (FieldTypeInv0 (type f_2@@0))))
 (=> (and (and (= (type o2) RefType) (= (type f_2@@0) (FieldType A@@6 B@@5))) (U_2_bool (MapType2Select (MapType1Select Heap@@5 null (PredicateMaskField pm_f@@1)) o2 f_2@@0))) (= (MapType1Select Heap@@5 o2 f_2@@0) (MapType1Select ExhaleHeap@@4 o2 f_2@@0)))))
 :qid |stdinbpl.54:134|
 :skolemid |3|
 :pattern ( (MapType1Select ExhaleHeap@@4 o2 f_2@@0))
))))
 :qid |stdinbpl.52:19|
 :skolemid |4|
 :pattern ( (IdenticalOnKnownLocations Heap@@5 ExhaleHeap@@4 Mask@@6) (IsPredicateField pm_f@@1))
)))
(assert (forall ((Heap@@6 T@U) (ExhaleHeap@@5 T@U) (Mask@@7 T@U) (pm_f@@2 T@U) ) (! (let ((C@@2 (FieldTypeInv0 (type pm_f@@2))))
 (=> (and (and (and (and (and (= (type Heap@@6) (MapType1Type RefType)) (= (type ExhaleHeap@@5) (MapType1Type RefType))) (= (type Mask@@7) (MapType2Type RefType realType))) (= (type pm_f@@2) (FieldType C@@2 FrameTypeType))) (IdenticalOnKnownLocations Heap@@6 ExhaleHeap@@5 Mask@@7)) (and (HasDirectPerm Mask@@7 null pm_f@@2) (IsWandField pm_f@@2))) (forall ((o2@@0 T@U) (f_2@@1 T@U) ) (! (let ((B@@6 (FieldTypeInv1 (type f_2@@1))))
(let ((A@@7 (FieldTypeInv0 (type f_2@@1))))
 (=> (and (and (= (type o2@@0) RefType) (= (type f_2@@1) (FieldType A@@7 B@@6))) (U_2_bool (MapType2Select (MapType1Select Heap@@6 null (WandMaskField pm_f@@2)) o2@@0 f_2@@1))) (= (MapType1Select Heap@@6 o2@@0 f_2@@1) (MapType1Select ExhaleHeap@@5 o2@@0 f_2@@1)))))
 :qid |stdinbpl.67:129|
 :skolemid |6|
 :pattern ( (MapType1Select ExhaleHeap@@5 o2@@0 f_2@@1))
))))
 :qid |stdinbpl.65:19|
 :skolemid |7|
 :pattern ( (IdenticalOnKnownLocations Heap@@6 ExhaleHeap@@5 Mask@@7) (IsWandField pm_f@@2))
)))
(assert (forall ((a@@24 T@U) (x@@15 T@U) ) (! (let ((T@@74 (type x@@15)))
 (=> (and (= (type a@@24) (MapType0Type T@@74 boolType)) (U_2_bool (MapType0Select a@@24 x@@15))) (= (|Set#Card| (|Set#UnionOne| a@@24 x@@15)) (|Set#Card| a@@24))))
 :qid |stdinbpl.565:18|
 :skolemid |68|
 :pattern ( (|Set#Card| (|Set#UnionOne| a@@24 x@@15)))
)))
(assert (forall ((a@@25 T@U) (x@@16 T@U) ) (! (let ((T@@75 (type x@@16)))
 (=> (= (type a@@25) (MultiSetType T@@75)) (and (> (|MultiSet#Select| (|MultiSet#UnionOne| a@@25 x@@16) x@@16) 0) (> (|MultiSet#Card| (|MultiSet#UnionOne| a@@25 x@@16)) 0))))
 :qid |stdinbpl.677:18|
 :skolemid |102|
 :pattern ( (|MultiSet#UnionOne| a@@25 x@@16))
)))
(assert (forall ((t@@2 T@U) ) (! (= (|Seq#Length| (|Seq#Singleton| t@@2)) 1)
 :qid |stdinbpl.204:18|
 :skolemid |25|
 :pattern ( (|Seq#Singleton| t@@2))
)))
(assert (forall ((r@@1 T@U) ) (! (= (|Set#Card| (|Set#Singleton| r@@1)) 1)
 :qid |stdinbpl.556:18|
 :skolemid |64|
 :pattern ( (|Set#Card| (|Set#Singleton| r@@1)))
)))
(assert (forall ((Mask@@8 T@U) (o_2@@2 T@U) (f_4@@2 T@U) ) (! (let ((B@@7 (FieldTypeInv1 (type f_4@@2))))
(let ((A@@8 (FieldTypeInv0 (type f_4@@2))))
 (=> (and (and (and (= (type Mask@@8) (MapType2Type RefType realType)) (= (type o_2@@2) RefType)) (= (type f_4@@2) (FieldType A@@8 B@@7))) (GoodMask Mask@@8)) (and (>= (U_2_real (MapType2Select Mask@@8 o_2@@2 f_4@@2)) NoPerm) (=> (and (and (GoodMask Mask@@8) (not (IsPredicateField f_4@@2))) (not (IsWandField f_4@@2))) (<= (U_2_real (MapType2Select Mask@@8 o_2@@2 f_4@@2)) FullPerm))))))
 :qid |stdinbpl.128:22|
 :skolemid |16|
 :pattern ( (GoodMask Mask@@8) (MapType2Select Mask@@8 o_2@@2 f_4@@2))
)))
(assert (forall ((r@@2 T@U) ) (! (U_2_bool (MapType0Select (|Set#Singleton| r@@2) r@@2))
 :qid |stdinbpl.554:18|
 :skolemid |62|
 :pattern ( (|Set#Singleton| r@@2))
)))
(assert (forall ((m@@19 T@U) ) (! (let ((V@@13 (MapTypeInv1 (type m@@19))))
(let ((U@@13 (MapTypeInv0 (type m@@19))))
 (=> (= (type m@@19) (MapType U@@13 V@@13)) (and (and (= (= (|Map#Card| m@@19) 0) (= m@@19 (|Map#Empty| U@@13 V@@13))) (=> (not (= (|Map#Card| m@@19) 0)) (exists ((x@@17 T@U) ) (!  (and (= (type x@@17) U@@13) (U_2_bool (MapType0Select (|Map#Domain| m@@19) x@@17)))
 :qid |stdinbpl.787:32|
 :skolemid |125|
 :no-pattern (type x@@17)
 :no-pattern (U_2_int x@@17)
 :no-pattern (U_2_bool x@@17)
)))) (forall ((x@@18 T@U) ) (!  (=> (and (= (type x@@18) U@@13) (U_2_bool (MapType0Select (|Map#Domain| m@@19) x@@18))) (not (= (|Map#Card| m@@19) 0)))
 :qid |stdinbpl.788:11|
 :skolemid |126|
 :pattern ( (MapType0Select (|Map#Domain| m@@19) x@@18))
))))))
 :qid |stdinbpl.785:21|
 :skolemid |127|
 :pattern ( (|Map#Card| m@@19))
)))
(assert (forall ((a@@26 T@U) (b@@19 T@U) ) (! (let ((T@@76 (MapType0TypeInv0 (type a@@26))))
 (=> (and (= (type a@@26) (MapType0Type T@@76 boolType)) (= (type b@@19) (MapType0Type T@@76 boolType))) (= (|Set#Union| a@@26 (|Set#Union| a@@26 b@@19)) (|Set#Union| a@@26 b@@19))))
 :qid |stdinbpl.588:18|
 :skolemid |75|
 :pattern ( (|Set#Union| a@@26 (|Set#Union| a@@26 b@@19)))
)))
(assert (forall ((a@@27 T@U) (b@@20 T@U) ) (! (let ((T@@77 (MapType0TypeInv0 (type a@@27))))
 (=> (and (= (type a@@27) (MapType0Type T@@77 boolType)) (= (type b@@20) (MapType0Type T@@77 boolType))) (= (|Set#Intersection| a@@27 (|Set#Intersection| a@@27 b@@20)) (|Set#Intersection| a@@27 b@@20))))
 :qid |stdinbpl.592:18|
 :skolemid |77|
 :pattern ( (|Set#Intersection| a@@27 (|Set#Intersection| a@@27 b@@20)))
)))
(assert (forall ((a@@28 T@U) (b@@21 T@U) ) (! (let ((T@@78 (MultiSetTypeInv0 (type a@@28))))
 (=> (and (= (type a@@28) (MultiSetType T@@78)) (= (type b@@21) (MultiSetType T@@78))) (= (|MultiSet#Intersection| a@@28 (|MultiSet#Intersection| a@@28 b@@21)) (|MultiSet#Intersection| a@@28 b@@21))))
 :qid |stdinbpl.694:18|
 :skolemid |107|
 :pattern ( (|MultiSet#Intersection| a@@28 (|MultiSet#Intersection| a@@28 b@@21)))
)))
(assert (forall ((s@@12 T@U) ) (! (let ((T@@79 (MultiSetTypeInv0 (type s@@12))))
 (=> (= (type s@@12) (MultiSetType T@@79)) (and (= (= (|MultiSet#Card| s@@12) 0) (= s@@12 (|MultiSet#Empty| T@@79))) (=> (not (= (|MultiSet#Card| s@@12) 0)) (exists ((x@@19 T@U) ) (!  (and (= (type x@@19) T@@79) (< 0 (|MultiSet#Select| s@@12 x@@19)))
 :qid |stdinbpl.661:38|
 :skolemid |95|
 :no-pattern (type x@@19)
 :no-pattern (U_2_int x@@19)
 :no-pattern (U_2_bool x@@19)
))))))
 :qid |stdinbpl.659:18|
 :skolemid |96|
 :pattern ( (|MultiSet#Card| s@@12))
)))
(assert (forall ((r@@3 T@U) (o@@8 T@U) ) (! (let ((T@@80 (type r@@3)))
 (=> (= (type o@@8) T@@80) (and (= (= (|MultiSet#Select| (|MultiSet#Singleton| r@@3) o@@8) 1) (= r@@3 o@@8)) (= (= (|MultiSet#Select| (|MultiSet#Singleton| r@@3) o@@8) 0) (not (= r@@3 o@@8))))))
 :qid |stdinbpl.664:18|
 :skolemid |97|
 :pattern ( (|MultiSet#Select| (|MultiSet#Singleton| r@@3) o@@8))
)))
(assert (forall ((o@@9 T@U) (f T@U) (Heap@@7 T@U) ) (!  (=> (and (and (and (= (type o@@9) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap@@7) (MapType1Type RefType))) (U_2_bool (MapType1Select Heap@@7 o@@9 $allocated))) (U_2_bool (MapType1Select Heap@@7 (MapType1Select Heap@@7 o@@9 f) $allocated)))
 :qid |stdinbpl.31:15|
 :skolemid |0|
 :pattern ( (MapType1Select Heap@@7 o@@9 f))
)))
(assert (forall ((m@@20 T@U) (u@@7 T@U) (|u'| T@U) (v@@4 T@U) ) (! (let ((V@@14 (type v@@4)))
(let ((U@@14 (type u@@7)))
 (=> (and (= (type m@@20) (MapType U@@14 V@@14)) (= (type |u'|) U@@14)) (and (=> (= |u'| u@@7) (and (U_2_bool (MapType0Select (|Map#Domain| (|Map#Build| m@@20 u@@7 v@@4)) |u'|)) (= (MapType0Select (|Map#Elements| (|Map#Build| m@@20 u@@7 v@@4)) |u'|) v@@4))) (=> (not (= |u'| u@@7)) (and (= (U_2_bool (MapType0Select (|Map#Domain| (|Map#Build| m@@20 u@@7 v@@4)) |u'|)) (U_2_bool (MapType0Select (|Map#Domain| m@@20) |u'|))) (= (MapType0Select (|Map#Elements| (|Map#Build| m@@20 u@@7 v@@4)) |u'|) (MapType0Select (|Map#Elements| m@@20) |u'|))))))))
 :qid |stdinbpl.794:21|
 :skolemid |128|
 :pattern ( (MapType0Select (|Map#Domain| (|Map#Build| m@@20 u@@7 v@@4)) |u'|))
 :pattern ( (MapType0Select (|Map#Domain| m@@20) |u'|) (|Map#Build| m@@20 u@@7 v@@4))
 :pattern ( (MapType0Select (|Map#Elements| (|Map#Build| m@@20 u@@7 v@@4)) |u'|))
)))
(assert (forall ((a@@29 T@U) (b@@22 T@U) (o@@10 T@U) ) (! (let ((T@@81 (type o@@10)))
 (=> (and (= (type a@@29) (MultiSetType T@@81)) (= (type b@@22) (MultiSetType T@@81))) (= (|MultiSet#Select| (|MultiSet#Union| a@@29 b@@22) o@@10) (+ (|MultiSet#Select| a@@29 o@@10) (|MultiSet#Select| b@@22 o@@10)))))
 :qid |stdinbpl.682:18|
 :skolemid |103|
 :pattern ( (|MultiSet#Select| (|MultiSet#Union| a@@29 b@@22) o@@10))
 :pattern ( (|MultiSet#Union| a@@29 b@@22) (|MultiSet#Select| a@@29 o@@10) (|MultiSet#Select| b@@22 o@@10))
)))
(assert (forall ((s@@13 T@U) (t@@3 T@U) (n@@8 Int) ) (! (let ((T@@82 (SeqTypeInv0 (type s@@13))))
 (=> (and (and (= (type s@@13) (SeqType T@@82)) (= (type t@@3) (SeqType T@@82))) (and (< 0 n@@8) (<= n@@8 (|Seq#Length| s@@13)))) (= (|Seq#Take| (|Seq#Append| s@@13 t@@3) n@@8) (|Seq#Take| s@@13 n@@8))))
 :qid |stdinbpl.346:18|
 :skolemid |41|
 :pattern ( (|Seq#Take| (|Seq#Append| s@@13 t@@3) n@@8))
)))
(assert (forall ((T@@83 T@T) ) (! (= (type (|Set#Empty| T@@83)) (MapType0Type T@@83 boolType))
 :qid |funType:Set#Empty|
 :pattern ( (|Set#Empty| T@@83))
)))
(assert (forall ((o@@11 T@U) ) (! (let ((T@@84 (type o@@11)))
 (not (U_2_bool (MapType0Select (|Set#Empty| T@@84) o@@11))))
 :qid |stdinbpl.548:18|
 :skolemid |59|
 :pattern ( (let ((T@@84 (type o@@11)))
(MapType0Select (|Set#Empty| T@@84) o@@11)))
)))
(assert (forall ((value_1 T@U) (tail_1 T@U) ) (! (let ((T@@85 (type value_1)))
 (=> (= (type tail_1) (ListDomainTypeType T@@85)) (= value_1 (get_List_value (Cons value_1 tail_1)))))
 :qid |stdinbpl.854:19|
 :skolemid |139|
 :pattern ( (Cons value_1 tail_1))
)))
(assert (forall ((value_1@@0 T@U) (tail_1@@0 T@U) ) (! (let ((T@@86 (type value_1@@0)))
 (=> (= (type tail_1@@0) (ListDomainTypeType T@@86)) (= tail_1@@0 (get_List_tail (Cons value_1@@0 tail_1@@0)))))
 :qid |stdinbpl.860:19|
 :skolemid |140|
 :pattern ( (Cons value_1@@0 tail_1@@0))
)))
(assert (forall ((elemT_1 T@U) (tailT_1 T@U) ) (! (let ((S@@6 (SpecialListDomainTypeTypeInv1 (type tailT_1))))
(let ((T@@87 (type elemT_1)))
 (=> (= (type tailT_1) (SpecialListDomainTypeType T@@87 S@@6)) (= elemT_1 (get_SpecialList_elemT (TCons elemT_1 tailT_1))))))
 :qid |stdinbpl.915:22|
 :skolemid |144|
 :pattern ( (TCons elemT_1 tailT_1))
)))
(assert (forall ((elemT_1@@0 T@U) (tailT_1@@0 T@U) ) (! (let ((S@@7 (SpecialListDomainTypeTypeInv1 (type tailT_1@@0))))
(let ((T@@88 (type elemT_1@@0)))
 (=> (= (type tailT_1@@0) (SpecialListDomainTypeType T@@88 S@@7)) (= tailT_1@@0 (get_SpecialList_tailT (TCons elemT_1@@0 tailT_1@@0))))))
 :qid |stdinbpl.921:22|
 :skolemid |145|
 :pattern ( (TCons elemT_1@@0 tailT_1@@0))
)))
(assert (forall ((elemS_1 T@U) (tailS_1 T@U) ) (! (let ((T@@89 (SpecialListDomainTypeTypeInv0 (type tailS_1))))
(let ((S@@8 (type elemS_1)))
 (=> (= (type tailS_1) (SpecialListDomainTypeType T@@89 S@@8)) (= elemS_1 (get_SpecialList_elemS (SCons elemS_1 tailS_1))))))
 :qid |stdinbpl.927:22|
 :skolemid |146|
 :pattern ( (SCons elemS_1 tailS_1))
)))
(assert (forall ((elemS_1@@0 T@U) (tailS_1@@0 T@U) ) (! (let ((T@@90 (SpecialListDomainTypeTypeInv0 (type tailS_1@@0))))
(let ((S@@9 (type elemS_1@@0)))
 (=> (= (type tailS_1@@0) (SpecialListDomainTypeType T@@90 S@@9)) (= tailS_1@@0 (get_SpecialList_tailS (SCons elemS_1@@0 tailS_1@@0))))))
 :qid |stdinbpl.933:22|
 :skolemid |147|
 :pattern ( (SCons elemS_1@@0 tailS_1@@0))
)))
(assert (forall ((s@@14 T@U) (i@@3 Int) (v@@5 T@U) ) (! (let ((T@@91 (type v@@5)))
 (=> (= (type s@@14) (SeqType T@@91)) (=> (and (<= 0 i@@3) (< i@@3 (|Seq#Length| s@@14))) (= (|Seq#Length| (|Seq#Update| s@@14 i@@3 v@@5)) (|Seq#Length| s@@14)))))
 :qid |stdinbpl.245:18|
 :skolemid |34|
 :pattern ( (|Seq#Length| (|Seq#Update| s@@14 i@@3 v@@5)))
 :pattern ( (|Seq#Length| s@@14) (|Seq#Update| s@@14 i@@3 v@@5))
)))
(assert (forall ((r@@4 T@U) ) (! (let ((T@@92 (type r@@4)))
(= (|MultiSet#Singleton| r@@4) (|MultiSet#UnionOne| (|MultiSet#Empty| T@@92) r@@4)))
 :qid |stdinbpl.667:18|
 :skolemid |99|
 :pattern ( (|MultiSet#Singleton| r@@4))
)))
(assert (forall ((m@@21 T@U) ) (! (let ((V@@15 (MapTypeInv1 (type m@@21))))
(let ((U@@15 (MapTypeInv0 (type m@@21))))
 (=> (= (type m@@21) (MapType U@@15 V@@15)) (= (|Set#Card| (|Map#Domain| m@@21)) (|Map#Card| m@@21)))))
 :qid |stdinbpl.750:20|
 :skolemid |119|
 :pattern ( (|Set#Card| (|Map#Domain| m@@21)))
 :pattern ( (|Map#Card| m@@21))
)))
(assert (forall ((s@@15 T@U) (t@@4 T@U) (n@@9 Int) ) (! (let ((T@@93 (SeqTypeInv0 (type s@@15))))
 (=> (and (and (= (type s@@15) (SeqType T@@93)) (= (type t@@4) (SeqType T@@93))) (and (< 0 n@@9) (<= n@@9 (|Seq#Length| s@@15)))) (= (|Seq#Drop| (|Seq#Append| s@@15 t@@4) n@@9) (|Seq#Append| (|Seq#Drop| s@@15 n@@9) t@@4))))
 :qid |stdinbpl.359:18|
 :skolemid |43|
 :pattern ( (|Seq#Drop| (|Seq#Append| s@@15 t@@4) n@@9))
)))
(assert (forall ((a@@30 Int) (b@@23 Int) ) (! (= (<= a@@30 b@@23) (= (|Math#min| a@@30 b@@23) a@@30))
 :qid |stdinbpl.632:15|
 :skolemid |87|
 :pattern ( (|Math#min| a@@30 b@@23))
)))
(assert (forall ((a@@31 Int) (b@@24 Int) ) (! (= (<= b@@24 a@@31) (= (|Math#min| a@@31 b@@24) b@@24))
 :qid |stdinbpl.633:15|
 :skolemid |88|
 :pattern ( (|Math#min| a@@31 b@@24))
)))
(assert (forall ((s@@16 T@U) (n@@10 Int) (i@@4 Int) ) (! (let ((T@@94 (SeqTypeInv0 (type s@@16))))
 (=> (= (type s@@16) (SeqType T@@94)) (=> (and (and (< 0 n@@10) (<= n@@10 i@@4)) (< i@@4 (|Seq#Length| s@@16))) (and (= (|Seq#Add| (|Seq#Sub| i@@4 n@@10) n@@10) i@@4) (= (|Seq#Index| (|Seq#Drop| s@@16 n@@10) (|Seq#Sub| i@@4 n@@10)) (|Seq#Index| s@@16 i@@4))))))
 :qid |stdinbpl.296:18|
 :skolemid |40|
 :pattern ( (|Seq#Drop| s@@16 n@@10) (|Seq#Index| s@@16 i@@4))
)))
(assert (forall ((s@@17 T@U) ) (! (let ((T@@95 (MapType0TypeInv0 (type s@@17))))
 (=> (= (type s@@17) (MapType0Type T@@95 boolType)) (and (= (= (|Set#Card| s@@17) 0) (= s@@17 (|Set#Empty| T@@95))) (=> (not (= (|Set#Card| s@@17) 0)) (exists ((x@@20 T@U) ) (!  (and (= (type x@@20) T@@95) (U_2_bool (MapType0Select s@@17 x@@20)))
 :qid |stdinbpl.551:33|
 :skolemid |60|
 :no-pattern (type x@@20)
 :no-pattern (U_2_int x@@20)
 :no-pattern (U_2_bool x@@20)
))))))
 :qid |stdinbpl.549:18|
 :skolemid |61|
 :pattern ( (|Set#Card| s@@17))
)))
(assert (forall ((s0@@3 T@U) (s1@@3 T@U) (n@@11 Int) ) (! (let ((T@@96 (SeqTypeInv0 (type s0@@3))))
 (=> (and (= (type s0@@3) (SeqType T@@96)) (= (type s1@@3) (SeqType T@@96))) (=> (and (and (and (not (= s0@@3 (|Seq#Empty| T@@96))) (not (= s1@@3 (|Seq#Empty| T@@96)))) (<= 0 n@@11)) (< n@@11 (|Seq#Length| s0@@3))) (= (|Seq#Index| (|Seq#Append| s0@@3 s1@@3) n@@11) (|Seq#Index| s0@@3 n@@11)))))
 :qid |stdinbpl.236:18|
 :skolemid |31|
 :pattern ( (|Seq#Index| (|Seq#Append| s0@@3 s1@@3) n@@11))
 :pattern ( (|Seq#Index| s0@@3 n@@11) (|Seq#Append| s0@@3 s1@@3))
)))
(assert (forall ((Heap@@8 T@U) (o@@12 T@U) (f_3 T@U) (v@@6 T@U) ) (! (let ((B@@8 (type v@@6)))
(let ((A@@9 (FieldTypeInv0 (type f_3))))
 (=> (and (and (= (type Heap@@8) (MapType1Type RefType)) (= (type o@@12) RefType)) (= (type f_3) (FieldType A@@9 B@@8))) (succHeap Heap@@8 (MapType1Store Heap@@8 o@@12 f_3 v@@6)))))
 :qid |stdinbpl.78:22|
 :skolemid |9|
 :pattern ( (MapType1Store Heap@@8 o@@12 f_3 v@@6))
)))
(assert (forall ((a@@32 T@U) (b@@25 T@U) ) (! (let ((T@@97 (MapType0TypeInv0 (type a@@32))))
 (=> (and (= (type a@@32) (MapType0Type T@@97 boolType)) (= (type b@@25) (MapType0Type T@@97 boolType))) (= (|Set#Subset| a@@32 b@@25) (forall ((o@@13 T@U) ) (!  (=> (and (= (type o@@13) T@@97) (U_2_bool (MapType0Select a@@32 o@@13))) (U_2_bool (MapType0Select b@@25 o@@13)))
 :qid |stdinbpl.611:32|
 :skolemid |82|
 :pattern ( (MapType0Select a@@32 o@@13))
 :pattern ( (MapType0Select b@@25 o@@13))
)))))
 :qid |stdinbpl.610:17|
 :skolemid |83|
 :pattern ( (|Set#Subset| a@@32 b@@25))
)))
(assert (forall ((s0@@4 T@U) (s1@@4 T@U) (m@@22 Int) ) (! (let ((T@@98 (SeqTypeInv0 (type s0@@4))))
 (=> (and (= (type s0@@4) (SeqType T@@98)) (= (type s1@@4) (SeqType T@@98))) (=> (and (and (and (not (= s0@@4 (|Seq#Empty| T@@98))) (not (= s1@@4 (|Seq#Empty| T@@98)))) (<= 0 m@@22)) (< m@@22 (|Seq#Length| s1@@4))) (and (= (|Seq#Sub| (|Seq#Add| m@@22 (|Seq#Length| s0@@4)) (|Seq#Length| s0@@4)) m@@22) (= (|Seq#Index| (|Seq#Append| s0@@4 s1@@4) (|Seq#Add| m@@22 (|Seq#Length| s0@@4))) (|Seq#Index| s1@@4 m@@22))))))
 :qid |stdinbpl.241:18|
 :skolemid |33|
 :pattern ( (|Seq#Index| s1@@4 m@@22) (|Seq#Append| s0@@4 s1@@4))
)))
(assert (forall ((a@@33 T@U) (x@@21 T@U) ) (! (let ((T@@99 (type x@@21)))
 (=> (and (= (type a@@33) (MapType0Type T@@99 boolType)) (not (U_2_bool (MapType0Select a@@33 x@@21)))) (= (|Set#Card| (|Set#UnionOne| a@@33 x@@21)) (+ (|Set#Card| a@@33) 1))))
 :qid |stdinbpl.567:18|
 :skolemid |69|
 :pattern ( (|Set#Card| (|Set#UnionOne| a@@33 x@@21)))
)))
(assert (forall ((a@@34 T@U) (b@@26 T@U) (o@@14 T@U) ) (! (let ((T@@100 (type o@@14)))
 (=> (and (= (type a@@34) (MultiSetType T@@100)) (= (type b@@26) (MultiSetType T@@100))) (= (|MultiSet#Select| (|MultiSet#Difference| a@@34 b@@26) o@@14) (|Math#clip| (- (|MultiSet#Select| a@@34 o@@14) (|MultiSet#Select| b@@26 o@@14))))))
 :qid |stdinbpl.699:18|
 :skolemid |108|
 :pattern ( (|MultiSet#Select| (|MultiSet#Difference| a@@34 b@@26) o@@14))
)))
(assert (= (type ZeroPMask) (MapType2Type RefType boolType)))
(assert (forall ((o_2@@3 T@U) (f_4@@3 T@U) ) (! (let ((B@@9 (FieldTypeInv1 (type f_4@@3))))
(let ((A@@10 (FieldTypeInv0 (type f_4@@3))))
 (=> (and (= (type o_2@@3) RefType) (= (type f_4@@3) (FieldType A@@10 B@@9))) (not (U_2_bool (MapType2Select ZeroPMask o_2@@3 f_4@@3))))))
 :qid |stdinbpl.112:22|
 :skolemid |14|
 :pattern ( (MapType2Select ZeroPMask o_2@@3 f_4@@3))
)))
(assert (forall ((value_1@@1 T@U) (tail_1@@1 T@U) ) (! (let ((T@@101 (type value_1@@1)))
 (=> (= (type tail_1@@1) (ListDomainTypeType T@@101)) (= (List_tag (Cons value_1@@1 tail_1@@1)) 0)))
 :qid |stdinbpl.872:19|
 :skolemid |142|
 :pattern ( (Cons value_1@@1 tail_1@@1))
)))
(assert (forall ((elemS_1@@1 T@U) (tailS_1@@1 T@U) ) (! (let ((T@@102 (SpecialListDomainTypeTypeInv0 (type tailS_1@@1))))
(let ((S@@10 (type elemS_1@@1)))
 (=> (= (type tailS_1@@1) (SpecialListDomainTypeType T@@102 S@@10)) (= (SpecialList_tag (SCons elemS_1@@1 tailS_1@@1)) 0))))
 :qid |stdinbpl.951:22|
 :skolemid |150|
 :pattern ( (SCons elemS_1@@1 tailS_1@@1))
)))
(assert (forall ((elemT_1@@1 T@U) (tailT_1@@1 T@U) ) (! (let ((S@@11 (SpecialListDomainTypeTypeInv1 (type tailT_1@@1))))
(let ((T@@103 (type elemT_1@@1)))
 (=> (= (type tailT_1@@1) (SpecialListDomainTypeType T@@103 S@@11)) (= (SpecialList_tag (TCons elemT_1@@1 tailT_1@@1)) 2))))
 :qid |stdinbpl.945:22|
 :skolemid |149|
 :pattern ( (TCons elemT_1@@1 tailT_1@@1))
)))
(assert (forall ((s@@18 T@U) (x@@22 T@U) (i@@5 Int) ) (! (let ((T@@104 (type x@@22)))
 (=> (= (type s@@18) (SeqType T@@104)) (=> (and (and (<= 0 i@@5) (< i@@5 (|Seq#Length| s@@18))) (= (|Seq#Index| s@@18 i@@5) x@@22)) (|Seq#Contains| s@@18 x@@22))))
 :qid |stdinbpl.392:18|
 :skolemid |48|
 :pattern ( (|Seq#Contains| s@@18 x@@22) (|Seq#Index| s@@18 i@@5))
)))
(assert (forall ((s0@@5 T@U) (s1@@5 T@U) ) (! (let ((T@@105 (SeqTypeInv0 (type s0@@5))))
 (=> (and (= (type s0@@5) (SeqType T@@105)) (= (type s1@@5) (SeqType T@@105))) (or (or (and (= s0@@5 s1@@5) (|Seq#Equal| s0@@5 s1@@5)) (and (and (not (= s0@@5 s1@@5)) (not (|Seq#Equal| s0@@5 s1@@5))) (not (= (|Seq#Length| s0@@5) (|Seq#Length| s1@@5))))) (and (and (and (and (and (and (not (= s0@@5 s1@@5)) (not (|Seq#Equal| s0@@5 s1@@5))) (= (|Seq#Length| s0@@5) (|Seq#Length| s1@@5))) (= (|Seq#SkolemDiff| s0@@5 s1@@5) (|Seq#SkolemDiff| s1@@5 s0@@5))) (<= 0 (|Seq#SkolemDiff| s0@@5 s1@@5))) (< (|Seq#SkolemDiff| s0@@5 s1@@5) (|Seq#Length| s0@@5))) (not (= (|Seq#Index| s0@@5 (|Seq#SkolemDiff| s0@@5 s1@@5)) (|Seq#Index| s1@@5 (|Seq#SkolemDiff| s0@@5 s1@@5))))))))
 :qid |stdinbpl.496:18|
 :skolemid |52|
 :pattern ( (|Seq#Equal| s0@@5 s1@@5))
)))
(assert (forall ((p@@1 T@U) (v_1@@0 T@U) (q T@U) (w@@0 T@U) (r@@5 T@U) (u@@8 T@U) ) (! (let ((C@@3 (FieldTypeInv0 (type r@@5))))
(let ((B@@10 (FieldTypeInv0 (type q))))
(let ((A@@11 (FieldTypeInv0 (type p@@1))))
 (=> (and (and (and (and (and (and (= (type p@@1) (FieldType A@@11 FrameTypeType)) (= (type v_1@@0) FrameTypeType)) (= (type q) (FieldType B@@10 FrameTypeType))) (= (type w@@0) FrameTypeType)) (= (type r@@5) (FieldType C@@3 FrameTypeType))) (= (type u@@8) FrameTypeType)) (and (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r@@5 u@@8))) (InsidePredicate p@@1 v_1@@0 r@@5 u@@8)))))
 :qid |stdinbpl.165:25|
 :skolemid |20|
 :pattern ( (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r@@5 u@@8))
)))
(assert (forall ((a@@35 Int) ) (!  (=> (< a@@35 0) (= (|Math#clip| a@@35) 0))
 :qid |stdinbpl.638:15|
 :skolemid |91|
 :pattern ( (|Math#clip| a@@35))
)))
(assert (forall ((T@@106 T@T) ) (! (= (List_tag (Nil T@@106)) 1)
 :skolemid |141|
)))
(assert (forall ((T@@107 T@T) (S@@12 T@T) ) (! (= (SpecialList_tag (SpecialNil T@@107 S@@12)) 1)
 :skolemid |148|
)))
(assert (forall ((s@@19 T@U) ) (! (let ((T@@108 (SeqTypeInv0 (type s@@19))))
 (=> (and (= (type s@@19) (SeqType T@@108)) (= (|Seq#Length| s@@19) 0)) (= s@@19 (|Seq#Empty| T@@108))))
 :qid |stdinbpl.200:18|
 :skolemid |24|
 :pattern ( (|Seq#Length| s@@19))
)))
(assert (forall ((s@@20 T@U) (n@@12 Int) ) (! (let ((T@@109 (SeqTypeInv0 (type s@@20))))
 (=> (and (= (type s@@20) (SeqType T@@109)) (<= n@@12 0)) (= (|Seq#Take| s@@20 n@@12) (|Seq#Empty| T@@109))))
 :qid |stdinbpl.375:18|
 :skolemid |46|
 :pattern ( (|Seq#Take| s@@20 n@@12))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
(assert (forall ((a@@36 T@U) (x@@23 T@U) (o@@15 T@U) ) (! (let ((T@@110 (type x@@23)))
 (=> (and (= (type a@@36) (MultiSetType T@@110)) (= (type o@@15) T@@110)) (= (|MultiSet#Select| (|MultiSet#UnionOne| a@@36 x@@23) o@@15) (ite (= x@@23 o@@15) (+ (|MultiSet#Select| a@@36 o@@15) 1) (|MultiSet#Select| a@@36 o@@15)))))
 :qid |stdinbpl.671:18|
 :skolemid |100|
 :pattern ( (|MultiSet#Select| (|MultiSet#UnionOne| a@@36 x@@23) o@@15))
 :pattern ( (|MultiSet#UnionOne| a@@36 x@@23) (|MultiSet#Select| a@@36 o@@15))
)))
(assert (forall ((a@@37 T@U) (b@@27 T@U) ) (! (let ((T@@111 (MultiSetTypeInv0 (type a@@37))))
 (=> (and (= (type a@@37) (MultiSetType T@@111)) (= (type b@@27) (MultiSetType T@@111))) (= (|MultiSet#Equal| a@@37 b@@27) (forall ((o@@16 T@U) ) (!  (=> (= (type o@@16) T@@111) (= (|MultiSet#Select| a@@37 o@@16) (|MultiSet#Select| b@@27 o@@16)))
 :qid |stdinbpl.717:36|
 :skolemid |113|
 :pattern ( (|MultiSet#Select| a@@37 o@@16))
 :pattern ( (|MultiSet#Select| b@@27 o@@16))
)))))
 :qid |stdinbpl.716:17|
 :skolemid |114|
 :pattern ( (|MultiSet#Equal| a@@37 b@@27))
)))
(assert (forall ((a@@38 T@U) (b@@28 T@U) ) (! (let ((T@@112 (MultiSetTypeInv0 (type a@@38))))
 (=> (and (= (type a@@38) (MultiSetType T@@112)) (= (type b@@28) (MultiSetType T@@112))) (= (|MultiSet#Subset| a@@38 b@@28) (forall ((o@@17 T@U) ) (!  (=> (= (type o@@17) T@@112) (<= (|MultiSet#Select| a@@38 o@@17) (|MultiSet#Select| b@@28 o@@17)))
 :qid |stdinbpl.713:37|
 :skolemid |111|
 :pattern ( (|MultiSet#Select| a@@38 o@@17))
 :pattern ( (|MultiSet#Select| b@@28 o@@17))
)))))
 :qid |stdinbpl.712:17|
 :skolemid |112|
 :pattern ( (|MultiSet#Subset| a@@38 b@@28))
)))
(assert (forall ((a@@39 T@U) (b@@29 T@U) (o@@18 T@U) ) (! (let ((T@@113 (type o@@18)))
 (=> (and (= (type a@@39) (MapType0Type T@@113 boolType)) (= (type b@@29) (MapType0Type T@@113 boolType))) (= (U_2_bool (MapType0Select (|Set#Union| a@@39 b@@29) o@@18))  (or (U_2_bool (MapType0Select a@@39 o@@18)) (U_2_bool (MapType0Select b@@29 o@@18))))))
 :qid |stdinbpl.571:18|
 :skolemid |70|
 :pattern ( (MapType0Select (|Set#Union| a@@39 b@@29) o@@18))
)))
(assert (forall ((m@@23 T@U) (|m'@@2| T@U) ) (! (let ((V@@16 (MapTypeInv1 (type m@@23))))
(let ((U@@16 (MapTypeInv0 (type m@@23))))
 (=> (and (and (= (type m@@23) (MapType U@@16 V@@16)) (= (type |m'@@2|) (MapType U@@16 V@@16))) (not (|Map#Disjoint| m@@23 |m'@@2|))) (exists ((o@@19 T@U) ) (!  (and (= (type o@@19) U@@16) (and (U_2_bool (MapType0Select (|Map#Domain| m@@23) o@@19)) (U_2_bool (MapType0Select (|Map#Domain| |m'@@2|) o@@19))))
 :qid |stdinbpl.827:38|
 :skolemid |137|
 :pattern ( (MapType0Select (|Map#Domain| m@@23) o@@19))
 :pattern ( (MapType0Select (|Map#Domain| |m'@@2|) o@@19))
)))))
 :qid |stdinbpl.825:21|
 :skolemid |138|
 :pattern ( (|Map#Disjoint| m@@23 |m'@@2|))
)))
(push 1)
(declare-fun ControlFlow (Int Int) Int)
(set-info :boogie-vc-id var_decls_1b)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 2) true)
))
(check-sat)
(pop 1)
; Valid
(get-info :rlimit)
