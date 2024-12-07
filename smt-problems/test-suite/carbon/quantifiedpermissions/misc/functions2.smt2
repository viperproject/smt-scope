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
(declare-fun |Seq#Length| (T@U) Int)
(declare-fun |Seq#Drop| (T@U Int) T@U)
(declare-fun SeqTypeInv0 (T@T) T@T)
(declare-fun SeqType (T@T) T@T)
(declare-fun succHeap (T@U T@U) Bool)
(declare-fun MapType0Type (T@T) T@T)
(declare-fun RefType () T@T)
(declare-fun succHeapTrans (T@U T@U) Bool)
(declare-fun MapType0TypeInv0 (T@T) T@T)
(declare-fun MapType0Select (T@U T@U T@U) T@U)
(declare-fun MapType0Store (T@U T@U T@U T@U) T@U)
(declare-fun |MultiSet#Card| (T@U) Int)
(declare-fun |MultiSet#Difference| (T@U T@U) T@U)
(declare-fun MultiSetTypeInv0 (T@T) T@T)
(declare-fun MultiSetType (T@T) T@T)
(declare-fun |MultiSet#Intersection| (T@U T@U) T@U)
(declare-fun |MultiSet#Union| (T@U T@U) T@U)
(declare-fun state (T@U T@U) Bool)
(declare-fun MapType1Type (T@T T@T) T@T)
(declare-fun GoodMask (T@U) Bool)
(declare-fun MapType1TypeInv0 (T@T) T@T)
(declare-fun MapType1TypeInv1 (T@T) T@T)
(declare-fun MapType1Select (T@U T@U T@U) T@U)
(declare-fun MapType1Store (T@U T@U T@U T@U) T@U)
(declare-fun |fun01'| (T@U T@U T@U) Int)
(declare-fun MapType2Type (T@T T@T) T@T)
(declare-fun dummyFunction (T@U) Bool)
(declare-fun |fun01#triggerStateless| (T@U T@U) Int)
(declare-fun MapType2TypeInv0 (T@T) T@T)
(declare-fun MapType2TypeInv1 (T@T) T@T)
(declare-fun MapType2Select (T@U T@U) T@U)
(declare-fun MapType2Store (T@U T@U T@U) T@U)
(declare-fun |fun02'| (T@U T@U T@U) Bool)
(declare-fun |fun02#triggerStateless| (T@U T@U) Bool)
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
(declare-fun fun01 (T@U T@U T@U) Int)
(declare-fun AssumeFunctionsAbove () Int)
(declare-fun |Set#Singleton| (T@U) T@U)
(declare-fun |Seq#Take| (T@U Int) T@U)
(declare-fun |fun02#condqp2| (T@U T@U T@U) Int)
(declare-fun |sk_fun02#condqp2| (Int Int) Int)
(declare-fun NoPerm () Real)
(declare-fun FullPerm () Real)
(declare-fun |fun02#condqp3| (T@U T@U T@U) Int)
(declare-fun |sk_fun02#condqp3| (Int Int) Int)
(declare-fun |Seq#Contains| (T@U T@U) Bool)
(declare-fun |Seq#Range| (Int Int) T@U)
(declare-fun |Set#Card| (T@U) Int)
(declare-fun |Seq#Skolem| (T@U T@U) Int)
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
(declare-fun |Set#Equal| (T@U T@U) Bool)
(declare-fun sumMask (T@U T@U T@U) Bool)
(declare-fun ConditionalFrame (Real T@U) T@U)
(declare-fun EmptyFrame () T@U)
(declare-fun fun02 (T@U T@U T@U) Bool)
(declare-fun |fun01#frame| (T@U T@U T@U) Int)
(declare-fun FrameFragment (T@U) T@U)
(declare-fun |fun01#condqp1| (T@U T@U T@U) Int)
(declare-fun |Set#Difference| (T@U T@U) T@U)
(declare-fun |Seq#Equal| (T@U T@U) Bool)
(declare-fun |MultiSet#Equal| (T@U T@U) Bool)
(declare-fun |Set#UnionOne| (T@U T@U) T@U)
(declare-fun |Seq#ContainsTrigger| (T@U T@U) Bool)
(declare-fun |MultiSet#Empty| (T@T) T@U)
(declare-fun |Set#Empty| (T@T) T@U)
(declare-fun |Set#Subset| (T@U T@U) Bool)
(declare-fun |sk_fun01#condqp1| (Int Int) T@U)
(declare-fun |fun02#frame| (T@U T@U T@U) Bool)
(declare-fun CombineFrames (T@U T@U) T@U)
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
(assert  (and (and (forall ((arg0@@14 T@T) ) (! (= (Ctor (SeqType arg0@@14)) 8)
 :qid |ctor:SeqType|
)) (forall ((arg0@@15 T@T) ) (! (= (SeqTypeInv0 (SeqType arg0@@15)) arg0@@15)
 :qid |typeInv:SeqTypeInv0|
 :pattern ( (SeqType arg0@@15))
))) (forall ((arg0@@16 T@U) (arg1@@2 Int) ) (! (let ((T (SeqTypeInv0 (type arg0@@16))))
(= (type (|Seq#Drop| arg0@@16 arg1@@2)) (SeqType T)))
 :qid |funType:Seq#Drop|
 :pattern ( (|Seq#Drop| arg0@@16 arg1@@2))
))))
(assert (forall ((s T@U) (n Int) ) (! (let ((T@@0 (SeqTypeInv0 (type s))))
 (=> (= (type s) (SeqType T@@0)) (and (=> (<= 0 n) (and (=> (<= n (|Seq#Length| s)) (= (|Seq#Length| (|Seq#Drop| s n)) (- (|Seq#Length| s) n))) (=> (< (|Seq#Length| s) n) (= (|Seq#Length| (|Seq#Drop| s n)) 0)))) (=> (< n 0) (= (|Seq#Length| (|Seq#Drop| s n)) (|Seq#Length| s))))))
 :qid |stdinbpl.320:18|
 :skolemid |38|
 :pattern ( (|Seq#Length| (|Seq#Drop| s n)))
 :pattern ( (|Seq#Length| s) (|Seq#Drop| s n))
)))
(assert  (and (and (and (and (and (and (forall ((arg0@@17 T@T) ) (! (= (Ctor (MapType0Type arg0@@17)) 9)
 :qid |ctor:MapType0Type|
)) (forall ((arg0@@18 T@T) ) (! (= (MapType0TypeInv0 (MapType0Type arg0@@18)) arg0@@18)
 :qid |typeInv:MapType0TypeInv0|
 :pattern ( (MapType0Type arg0@@18))
))) (forall ((arg0@@19 T@U) (arg1@@3 T@U) (arg2 T@U) ) (! (let ((B (FieldTypeInv1 (type arg2))))
(= (type (MapType0Select arg0@@19 arg1@@3 arg2)) B))
 :qid |funType:MapType0Select|
 :pattern ( (MapType0Select arg0@@19 arg1@@3 arg2))
))) (forall ((arg0@@20 T@U) (arg1@@4 T@U) (arg2@@0 T@U) (arg3 T@U) ) (! (let ((aVar0 (type arg1@@4)))
(= (type (MapType0Store arg0@@20 arg1@@4 arg2@@0 arg3)) (MapType0Type aVar0)))
 :qid |funType:MapType0Store|
 :pattern ( (MapType0Store arg0@@20 arg1@@4 arg2@@0 arg3))
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
)))) (= (Ctor RefType) 10)))
(assert (forall ((Heap0 T@U) (Heap1 T@U) ) (!  (=> (and (and (= (type Heap0) (MapType0Type RefType)) (= (type Heap1) (MapType0Type RefType))) (succHeap Heap0 Heap1)) (succHeapTrans Heap0 Heap1))
 :qid |stdinbpl.88:15|
 :skolemid |11|
 :pattern ( (succHeap Heap0 Heap1))
)))
(assert  (and (and (and (and (forall ((arg0@@21 T@T) ) (! (= (Ctor (MultiSetType arg0@@21)) 11)
 :qid |ctor:MultiSetType|
)) (forall ((arg0@@22 T@T) ) (! (= (MultiSetTypeInv0 (MultiSetType arg0@@22)) arg0@@22)
 :qid |typeInv:MultiSetTypeInv0|
 :pattern ( (MultiSetType arg0@@22))
))) (forall ((arg0@@23 T@U) (arg1@@5 T@U) ) (! (let ((T@@1 (MultiSetTypeInv0 (type arg0@@23))))
(= (type (|MultiSet#Difference| arg0@@23 arg1@@5)) (MultiSetType T@@1)))
 :qid |funType:MultiSet#Difference|
 :pattern ( (|MultiSet#Difference| arg0@@23 arg1@@5))
))) (forall ((arg0@@24 T@U) (arg1@@6 T@U) ) (! (let ((T@@2 (MultiSetTypeInv0 (type arg0@@24))))
(= (type (|MultiSet#Intersection| arg0@@24 arg1@@6)) (MultiSetType T@@2)))
 :qid |funType:MultiSet#Intersection|
 :pattern ( (|MultiSet#Intersection| arg0@@24 arg1@@6))
))) (forall ((arg0@@25 T@U) (arg1@@7 T@U) ) (! (let ((T@@3 (MultiSetTypeInv0 (type arg0@@25))))
(= (type (|MultiSet#Union| arg0@@25 arg1@@7)) (MultiSetType T@@3)))
 :qid |funType:MultiSet#Union|
 :pattern ( (|MultiSet#Union| arg0@@25 arg1@@7))
))))
(assert (forall ((a T@U) (b T@U) ) (! (let ((T@@4 (MultiSetTypeInv0 (type a))))
 (=> (and (= (type a) (MultiSetType T@@4)) (= (type b) (MultiSetType T@@4))) (and (= (+ (+ (|MultiSet#Card| (|MultiSet#Difference| a b)) (|MultiSet#Card| (|MultiSet#Difference| b a))) (* 2 (|MultiSet#Card| (|MultiSet#Intersection| a b)))) (|MultiSet#Card| (|MultiSet#Union| a b))) (= (|MultiSet#Card| (|MultiSet#Difference| a b)) (- (|MultiSet#Card| a) (|MultiSet#Card| (|MultiSet#Intersection| a b)))))))
 :qid |stdinbpl.752:18|
 :skolemid |110|
 :pattern ( (|MultiSet#Card| (|MultiSet#Difference| a b)))
)))
(assert  (and (and (and (and (and (and (forall ((arg0@@26 T@T) (arg1@@8 T@T) ) (! (= (Ctor (MapType1Type arg0@@26 arg1@@8)) 12)
 :qid |ctor:MapType1Type|
)) (forall ((arg0@@27 T@T) (arg1@@9 T@T) ) (! (= (MapType1TypeInv0 (MapType1Type arg0@@27 arg1@@9)) arg0@@27)
 :qid |typeInv:MapType1TypeInv0|
 :pattern ( (MapType1Type arg0@@27 arg1@@9))
))) (forall ((arg0@@28 T@T) (arg1@@10 T@T) ) (! (= (MapType1TypeInv1 (MapType1Type arg0@@28 arg1@@10)) arg1@@10)
 :qid |typeInv:MapType1TypeInv1|
 :pattern ( (MapType1Type arg0@@28 arg1@@10))
))) (forall ((arg0@@29 T@U) (arg1@@11 T@U) (arg2@@1 T@U) ) (! (let ((aVar1 (MapType1TypeInv1 (type arg0@@29))))
(= (type (MapType1Select arg0@@29 arg1@@11 arg2@@1)) aVar1))
 :qid |funType:MapType1Select|
 :pattern ( (MapType1Select arg0@@29 arg1@@11 arg2@@1))
))) (forall ((arg0@@30 T@U) (arg1@@12 T@U) (arg2@@2 T@U) (arg3@@0 T@U) ) (! (let ((aVar1@@0 (type arg3@@0)))
(let ((aVar0@@0 (type arg1@@12)))
(= (type (MapType1Store arg0@@30 arg1@@12 arg2@@2 arg3@@0)) (MapType1Type aVar0@@0 aVar1@@0))))
 :qid |funType:MapType1Store|
 :pattern ( (MapType1Store arg0@@30 arg1@@12 arg2@@2 arg3@@0))
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
(assert  (and (and (and (and (and (and (forall ((arg0@@31 T@T) (arg1@@13 T@T) ) (! (= (Ctor (MapType2Type arg0@@31 arg1@@13)) 13)
 :qid |ctor:MapType2Type|
)) (forall ((arg0@@32 T@T) (arg1@@14 T@T) ) (! (= (MapType2TypeInv0 (MapType2Type arg0@@32 arg1@@14)) arg0@@32)
 :qid |typeInv:MapType2TypeInv0|
 :pattern ( (MapType2Type arg0@@32 arg1@@14))
))) (forall ((arg0@@33 T@T) (arg1@@15 T@T) ) (! (= (MapType2TypeInv1 (MapType2Type arg0@@33 arg1@@15)) arg1@@15)
 :qid |typeInv:MapType2TypeInv1|
 :pattern ( (MapType2Type arg0@@33 arg1@@15))
))) (forall ((arg0@@34 T@U) (arg1@@16 T@U) ) (! (let ((aVar1@@2 (MapType2TypeInv1 (type arg0@@34))))
(= (type (MapType2Select arg0@@34 arg1@@16)) aVar1@@2))
 :qid |funType:MapType2Select|
 :pattern ( (MapType2Select arg0@@34 arg1@@16))
))) (forall ((arg0@@35 T@U) (arg1@@17 T@U) (arg2@@3 T@U) ) (! (let ((aVar1@@3 (type arg2@@3)))
(let ((aVar0@@1 (type arg1@@17)))
(= (type (MapType2Store arg0@@35 arg1@@17 arg2@@3)) (MapType2Type aVar0@@1 aVar1@@3))))
 :qid |funType:MapType2Store|
 :pattern ( (MapType2Store arg0@@35 arg1@@17 arg2@@3))
))) (forall ((m@@7 T@U) (x0@@7 T@U) (val@@7 T@U) ) (! (let ((aVar1@@4 (MapType2TypeInv1 (type m@@7))))
 (=> (= (type val@@7) aVar1@@4) (= (MapType2Select (MapType2Store m@@7 x0@@7 val@@7) x0@@7) val@@7)))
 :qid |mapAx0:MapType2Select|
 :weight 0
))) (and (forall ((val@@8 T@U) (m@@8 T@U) (x0@@8 T@U) (y0@@5 T@U) ) (!  (or (= x0@@8 y0@@5) (= (MapType2Select (MapType2Store m@@8 x0@@8 val@@8) y0@@5) (MapType2Select m@@8 y0@@5)))
 :qid |mapAx1:MapType2Select:0|
 :weight 0
)) (forall ((val@@9 T@U) (m@@9 T@U) (x0@@9 T@U) (y0@@6 T@U) ) (!  (or true (= (MapType2Select (MapType2Store m@@9 x0@@9 val@@9) y0@@6) (MapType2Select m@@9 y0@@6)))
 :qid |mapAx2:MapType2Select|
 :weight 0
)))))
(assert (forall ((Heap@@0 T@U) (xs T@U) (y@@1 T@U) ) (!  (=> (and (and (= (type Heap@@0) (MapType0Type RefType)) (= (type xs) (MapType2Type RefType boolType))) (= (type y@@1) RefType)) (dummyFunction (int_2_U (|fun01#triggerStateless| xs y@@1))))
 :qid |stdinbpl.796:15|
 :skolemid |119|
 :pattern ( (|fun01'| Heap@@0 xs y@@1))
)))
(assert (forall ((Heap@@1 T@U) (xs@@0 T@U) (ys T@U) ) (!  (=> (and (and (= (type Heap@@1) (MapType0Type RefType)) (= (type xs@@0) (SeqType RefType))) (= (type ys) (SeqType RefType))) (dummyFunction (bool_2_U (|fun02#triggerStateless| xs@@0 ys))))
 :qid |stdinbpl.925:15|
 :skolemid |132|
 :pattern ( (|fun02'| Heap@@1 xs@@0 ys))
)))
(assert (forall ((a@@0 Int) (b@@0 Int) ) (!  (or (= (|Math#min| a@@0 b@@0) a@@0) (= (|Math#min| a@@0 b@@0) b@@0))
 :qid |stdinbpl.683:15|
 :skolemid |89|
 :pattern ( (|Math#min| a@@0 b@@0))
)))
(assert (forall ((arg0@@36 T@U) (arg1@@18 Int) ) (! (let ((T@@5 (SeqTypeInv0 (type arg0@@36))))
(= (type (|Seq#Index| arg0@@36 arg1@@18)) T@@5))
 :qid |funType:Seq#Index|
 :pattern ( (|Seq#Index| arg0@@36 arg1@@18))
)))
(assert (forall ((s@@0 T@U) (n@@0 Int) (j Int) ) (! (let ((T@@6 (SeqTypeInv0 (type s@@0))))
 (=> (= (type s@@0) (SeqType T@@6)) (=> (and (and (< 0 n@@0) (<= 0 j)) (< j (- (|Seq#Length| s@@0) n@@0))) (and (= (|Seq#Sub| (|Seq#Add| j n@@0) n@@0) j) (= (|Seq#Index| (|Seq#Drop| s@@0 n@@0) j) (|Seq#Index| s@@0 (|Seq#Add| j n@@0)))))))
 :qid |stdinbpl.341:18|
 :skolemid |39|
 :pattern ( (|Seq#Index| (|Seq#Drop| s@@0 n@@0) j))
)))
(assert  (and (and (= (Ctor FrameTypeType) 14) (= (type null) RefType)) (forall ((arg0@@37 T@U) ) (! (let ((A (FieldTypeInv0 (type arg0@@37))))
(= (type (PredicateMaskField arg0@@37)) (FieldType A (MapType1Type RefType boolType))))
 :qid |funType:PredicateMaskField|
 :pattern ( (PredicateMaskField arg0@@37))
))))
(assert (forall ((Heap@@2 T@U) (ExhaleHeap T@U) (Mask@@0 T@U) (pm_f T@U) ) (! (let ((C (FieldTypeInv0 (type pm_f))))
 (=> (and (and (and (and (and (= (type Heap@@2) (MapType0Type RefType)) (= (type ExhaleHeap) (MapType0Type RefType))) (= (type Mask@@0) (MapType1Type RefType realType))) (= (type pm_f) (FieldType C FrameTypeType))) (IdenticalOnKnownLocations Heap@@2 ExhaleHeap Mask@@0)) (and (HasDirectPerm Mask@@0 null pm_f) (IsPredicateField pm_f))) (= (MapType0Select Heap@@2 null (PredicateMaskField pm_f)) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))))
 :qid |stdinbpl.47:19|
 :skolemid |2|
 :pattern ( (IdenticalOnKnownLocations Heap@@2 ExhaleHeap Mask@@0) (IsPredicateField pm_f) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))
)))
(assert (forall ((arg0@@38 T@U) ) (! (let ((A@@0 (FieldTypeInv0 (type arg0@@38))))
(= (type (WandMaskField arg0@@38)) (FieldType A@@0 (MapType1Type RefType boolType))))
 :qid |funType:WandMaskField|
 :pattern ( (WandMaskField arg0@@38))
)))
(assert (forall ((Heap@@3 T@U) (ExhaleHeap@@0 T@U) (Mask@@1 T@U) (pm_f@@0 T@U) ) (! (let ((C@@0 (FieldTypeInv0 (type pm_f@@0))))
 (=> (and (and (and (and (and (= (type Heap@@3) (MapType0Type RefType)) (= (type ExhaleHeap@@0) (MapType0Type RefType))) (= (type Mask@@1) (MapType1Type RefType realType))) (= (type pm_f@@0) (FieldType C@@0 FrameTypeType))) (IdenticalOnKnownLocations Heap@@3 ExhaleHeap@@0 Mask@@1)) (and (HasDirectPerm Mask@@1 null pm_f@@0) (IsWandField pm_f@@0))) (= (MapType0Select Heap@@3 null (WandMaskField pm_f@@0)) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))))
 :qid |stdinbpl.60:19|
 :skolemid |5|
 :pattern ( (IdenticalOnKnownLocations Heap@@3 ExhaleHeap@@0 Mask@@1) (IsWandField pm_f@@0) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))
)))
(assert (forall ((arg0@@39 T@U) (arg1@@19 Int) (arg2@@4 T@U) ) (! (let ((T@@7 (type arg2@@4)))
(= (type (|Seq#Update| arg0@@39 arg1@@19 arg2@@4)) (SeqType T@@7)))
 :qid |funType:Seq#Update|
 :pattern ( (|Seq#Update| arg0@@39 arg1@@19 arg2@@4))
)))
(assert (forall ((s@@1 T@U) (i Int) (v T@U) (n@@1 Int) ) (! (let ((T@@8 (type v)))
 (=> (= (type s@@1) (SeqType T@@8)) (=> (and (<= 0 n@@1) (< n@@1 (|Seq#Length| s@@1))) (and (=> (= i n@@1) (= (|Seq#Index| (|Seq#Update| s@@1 i v) n@@1) v)) (=> (not (= i n@@1)) (= (|Seq#Index| (|Seq#Update| s@@1 i v) n@@1) (|Seq#Index| s@@1 n@@1)))))))
 :qid |stdinbpl.296:18|
 :skolemid |35|
 :pattern ( (|Seq#Index| (|Seq#Update| s@@1 i v) n@@1))
 :pattern ( (|Seq#Index| s@@1 n@@1) (|Seq#Update| s@@1 i v))
)))
(assert (forall ((a@@1 T@U) (b@@1 T@U) (y@@2 T@U) ) (! (let ((T@@9 (type y@@2)))
 (=> (and (and (= (type a@@1) (MultiSetType T@@9)) (= (type b@@1) (MultiSetType T@@9))) (<= (|MultiSet#Select| a@@1 y@@2) (|MultiSet#Select| b@@1 y@@2))) (= (|MultiSet#Select| (|MultiSet#Difference| a@@1 b@@1) y@@2) 0)))
 :qid |stdinbpl.750:18|
 :skolemid |109|
 :pattern ( (|MultiSet#Difference| a@@1 b@@1) (|MultiSet#Select| b@@1 y@@2) (|MultiSet#Select| a@@1 y@@2))
)))
(assert (forall ((arg0@@40 T@U) (arg1@@20 T@U) ) (! (let ((T@@10 (MapType2TypeInv0 (type arg0@@40))))
(= (type (|Set#Union| arg0@@40 arg1@@20)) (MapType2Type T@@10 boolType)))
 :qid |funType:Set#Union|
 :pattern ( (|Set#Union| arg0@@40 arg1@@20))
)))
(assert (forall ((a@@2 T@U) (b@@2 T@U) ) (! (let ((T@@11 (MapType2TypeInv0 (type a@@2))))
 (=> (and (= (type a@@2) (MapType2Type T@@11 boolType)) (= (type b@@2) (MapType2Type T@@11 boolType))) (= (|Set#Union| (|Set#Union| a@@2 b@@2) b@@2) (|Set#Union| a@@2 b@@2))))
 :qid |stdinbpl.635:18|
 :skolemid |74|
 :pattern ( (|Set#Union| (|Set#Union| a@@2 b@@2) b@@2))
)))
(assert (forall ((arg0@@41 T@U) (arg1@@21 T@U) ) (! (let ((T@@12 (MapType2TypeInv0 (type arg0@@41))))
(= (type (|Set#Intersection| arg0@@41 arg1@@21)) (MapType2Type T@@12 boolType)))
 :qid |funType:Set#Intersection|
 :pattern ( (|Set#Intersection| arg0@@41 arg1@@21))
)))
(assert (forall ((a@@3 T@U) (b@@3 T@U) ) (! (let ((T@@13 (MapType2TypeInv0 (type a@@3))))
 (=> (and (= (type a@@3) (MapType2Type T@@13 boolType)) (= (type b@@3) (MapType2Type T@@13 boolType))) (= (|Set#Intersection| (|Set#Intersection| a@@3 b@@3) b@@3) (|Set#Intersection| a@@3 b@@3))))
 :qid |stdinbpl.639:18|
 :skolemid |76|
 :pattern ( (|Set#Intersection| (|Set#Intersection| a@@3 b@@3) b@@3))
)))
(assert (forall ((a@@4 T@U) (b@@4 T@U) ) (! (let ((T@@14 (MultiSetTypeInv0 (type a@@4))))
 (=> (and (= (type a@@4) (MultiSetType T@@14)) (= (type b@@4) (MultiSetType T@@14))) (= (|MultiSet#Intersection| (|MultiSet#Intersection| a@@4 b@@4) b@@4) (|MultiSet#Intersection| a@@4 b@@4))))
 :qid |stdinbpl.741:18|
 :skolemid |106|
 :pattern ( (|MultiSet#Intersection| (|MultiSet#Intersection| a@@4 b@@4) b@@4))
)))
(assert (forall ((Heap@@4 T@U) (Mask@@2 T@U) (xs@@1 T@U) (y@@3 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@4) (MapType0Type RefType)) (= (type Mask@@2) (MapType1Type RefType realType))) (= (type xs@@1) (MapType2Type RefType boolType))) (= (type y@@3) RefType)) (and (state Heap@@4 Mask@@2) (< AssumeFunctionsAbove 0))) (and (forall ((x_1 T@U) ) (!  (=> (and (= (type x_1) RefType) (U_2_bool (MapType2Select xs@@1 x_1))) (> (U_2_int (MapType0Select Heap@@4 x_1 f_7)) 0))
 :qid |stdinbpl.804:61|
 :skolemid |120|
 :pattern ( (MapType2Select xs@@1 x_1))
)) (U_2_bool (MapType2Select xs@@1 y@@3)))) (= (fun01 Heap@@4 xs@@1 y@@3) (U_2_int (MapType0Select Heap@@4 y@@3 f_7))))
 :qid |stdinbpl.802:15|
 :skolemid |121|
 :pattern ( (state Heap@@4 Mask@@2) (fun01 Heap@@4 xs@@1 y@@3))
)))
(assert (forall ((arg0@@42 T@U) ) (! (let ((T@@15 (type arg0@@42)))
(= (type (|Set#Singleton| arg0@@42)) (MapType2Type T@@15 boolType)))
 :qid |funType:Set#Singleton|
 :pattern ( (|Set#Singleton| arg0@@42))
)))
(assert (forall ((r T@U) (o T@U) ) (! (let ((T@@16 (type r)))
 (=> (= (type o) T@@16) (= (U_2_bool (MapType2Select (|Set#Singleton| r) o)) (= r o))))
 :qid |stdinbpl.604:18|
 :skolemid |63|
 :pattern ( (MapType2Select (|Set#Singleton| r) o))
)))
(assert (forall ((arg0@@43 T@U) (arg1@@22 Int) ) (! (let ((T@@17 (SeqTypeInv0 (type arg0@@43))))
(= (type (|Seq#Take| arg0@@43 arg1@@22)) (SeqType T@@17)))
 :qid |funType:Seq#Take|
 :pattern ( (|Seq#Take| arg0@@43 arg1@@22))
)))
(assert (forall ((s@@2 T@U) (n@@2 Int) ) (! (let ((T@@18 (SeqTypeInv0 (type s@@2))))
 (=> (= (type s@@2) (SeqType T@@18)) (and (=> (<= 0 n@@2) (and (=> (<= n@@2 (|Seq#Length| s@@2)) (= (|Seq#Length| (|Seq#Take| s@@2 n@@2)) n@@2)) (=> (< (|Seq#Length| s@@2) n@@2) (= (|Seq#Length| (|Seq#Take| s@@2 n@@2)) (|Seq#Length| s@@2))))) (=> (< n@@2 0) (= (|Seq#Length| (|Seq#Take| s@@2 n@@2)) 0)))))
 :qid |stdinbpl.307:18|
 :skolemid |36|
 :pattern ( (|Seq#Length| (|Seq#Take| s@@2 n@@2)))
 :pattern ( (|Seq#Take| s@@2 n@@2) (|Seq#Length| s@@2))
)))
(assert (forall ((Heap2Heap T@U) (Heap1Heap T@U) (xs@@2 T@U) (ys@@0 T@U) ) (!  (=> (and (and (and (and (= (type Heap2Heap) (MapType0Type RefType)) (= (type Heap1Heap) (MapType0Type RefType))) (= (type xs@@2) (SeqType RefType))) (= (type ys@@0) (SeqType RefType))) (and (=  (and (and (<= 0 (|sk_fun02#condqp2| (|fun02#condqp2| Heap2Heap xs@@2 ys@@0) (|fun02#condqp2| Heap1Heap xs@@2 ys@@0))) (< (|sk_fun02#condqp2| (|fun02#condqp2| Heap2Heap xs@@2 ys@@0) (|fun02#condqp2| Heap1Heap xs@@2 ys@@0)) (|Seq#Length| xs@@2))) (< NoPerm FullPerm))  (and (and (<= 0 (|sk_fun02#condqp2| (|fun02#condqp2| Heap2Heap xs@@2 ys@@0) (|fun02#condqp2| Heap1Heap xs@@2 ys@@0))) (< (|sk_fun02#condqp2| (|fun02#condqp2| Heap2Heap xs@@2 ys@@0) (|fun02#condqp2| Heap1Heap xs@@2 ys@@0)) (|Seq#Length| xs@@2))) (< NoPerm FullPerm))) (=> (and (and (<= 0 (|sk_fun02#condqp2| (|fun02#condqp2| Heap2Heap xs@@2 ys@@0) (|fun02#condqp2| Heap1Heap xs@@2 ys@@0))) (< (|sk_fun02#condqp2| (|fun02#condqp2| Heap2Heap xs@@2 ys@@0) (|fun02#condqp2| Heap1Heap xs@@2 ys@@0)) (|Seq#Length| xs@@2))) (< NoPerm FullPerm)) (= (U_2_int (MapType0Select Heap2Heap (|Seq#Index| xs@@2 (|sk_fun02#condqp2| (|fun02#condqp2| Heap2Heap xs@@2 ys@@0) (|fun02#condqp2| Heap1Heap xs@@2 ys@@0))) f_7)) (U_2_int (MapType0Select Heap1Heap (|Seq#Index| xs@@2 (|sk_fun02#condqp2| (|fun02#condqp2| Heap2Heap xs@@2 ys@@0) (|fun02#condqp2| Heap1Heap xs@@2 ys@@0))) f_7)))))) (= (|fun02#condqp2| Heap2Heap xs@@2 ys@@0) (|fun02#condqp2| Heap1Heap xs@@2 ys@@0)))
 :qid |stdinbpl.954:15|
 :skolemid |137|
 :pattern ( (|fun02#condqp2| Heap2Heap xs@@2 ys@@0) (|fun02#condqp2| Heap1Heap xs@@2 ys@@0) (succHeapTrans Heap2Heap Heap1Heap))
)))
(assert (forall ((Heap2Heap@@0 T@U) (Heap1Heap@@0 T@U) (xs@@3 T@U) (ys@@1 T@U) ) (!  (=> (and (and (and (and (= (type Heap2Heap@@0) (MapType0Type RefType)) (= (type Heap1Heap@@0) (MapType0Type RefType))) (= (type xs@@3) (SeqType RefType))) (= (type ys@@1) (SeqType RefType))) (and (=  (and (and (<= 0 (|sk_fun02#condqp3| (|fun02#condqp3| Heap2Heap@@0 xs@@3 ys@@1) (|fun02#condqp3| Heap1Heap@@0 xs@@3 ys@@1))) (< (|sk_fun02#condqp3| (|fun02#condqp3| Heap2Heap@@0 xs@@3 ys@@1) (|fun02#condqp3| Heap1Heap@@0 xs@@3 ys@@1)) (|Seq#Length| ys@@1))) (< NoPerm FullPerm))  (and (and (<= 0 (|sk_fun02#condqp3| (|fun02#condqp3| Heap2Heap@@0 xs@@3 ys@@1) (|fun02#condqp3| Heap1Heap@@0 xs@@3 ys@@1))) (< (|sk_fun02#condqp3| (|fun02#condqp3| Heap2Heap@@0 xs@@3 ys@@1) (|fun02#condqp3| Heap1Heap@@0 xs@@3 ys@@1)) (|Seq#Length| ys@@1))) (< NoPerm FullPerm))) (=> (and (and (<= 0 (|sk_fun02#condqp3| (|fun02#condqp3| Heap2Heap@@0 xs@@3 ys@@1) (|fun02#condqp3| Heap1Heap@@0 xs@@3 ys@@1))) (< (|sk_fun02#condqp3| (|fun02#condqp3| Heap2Heap@@0 xs@@3 ys@@1) (|fun02#condqp3| Heap1Heap@@0 xs@@3 ys@@1)) (|Seq#Length| ys@@1))) (< NoPerm FullPerm)) (= (U_2_int (MapType0Select Heap2Heap@@0 (|Seq#Index| ys@@1 (|sk_fun02#condqp3| (|fun02#condqp3| Heap2Heap@@0 xs@@3 ys@@1) (|fun02#condqp3| Heap1Heap@@0 xs@@3 ys@@1))) f_7)) (U_2_int (MapType0Select Heap1Heap@@0 (|Seq#Index| ys@@1 (|sk_fun02#condqp3| (|fun02#condqp3| Heap2Heap@@0 xs@@3 ys@@1) (|fun02#condqp3| Heap1Heap@@0 xs@@3 ys@@1))) f_7)))))) (= (|fun02#condqp3| Heap2Heap@@0 xs@@3 ys@@1) (|fun02#condqp3| Heap1Heap@@0 xs@@3 ys@@1)))
 :qid |stdinbpl.964:15|
 :skolemid |138|
 :pattern ( (|fun02#condqp3| Heap2Heap@@0 xs@@3 ys@@1) (|fun02#condqp3| Heap1Heap@@0 xs@@3 ys@@1) (succHeapTrans Heap2Heap@@0 Heap1Heap@@0))
)))
(assert (forall ((arg0@@44 Int) (arg1@@23 Int) ) (! (= (type (|Seq#Range| arg0@@44 arg1@@23)) (SeqType intType))
 :qid |funType:Seq#Range|
 :pattern ( (|Seq#Range| arg0@@44 arg1@@23))
)))
(assert (forall ((q@min Int) (q@max Int) (v@@0 T@U) ) (!  (=> (= (type v@@0) intType) (= (|Seq#Contains| (|Seq#Range| q@min q@max) v@@0)  (and (<= q@min (U_2_int v@@0)) (< (U_2_int v@@0) q@max))))
 :qid |stdinbpl.580:15|
 :skolemid |57|
 :pattern ( (|Seq#Contains| (|Seq#Range| q@min q@max) v@@0))
)))
(assert (forall ((a@@5 T@U) (b@@5 T@U) ) (! (let ((T@@19 (MapType2TypeInv0 (type a@@5))))
 (=> (and (= (type a@@5) (MapType2Type T@@19 boolType)) (= (type b@@5) (MapType2Type T@@19 boolType))) (= (+ (|Set#Card| (|Set#Union| a@@5 b@@5)) (|Set#Card| (|Set#Intersection| a@@5 b@@5))) (+ (|Set#Card| a@@5) (|Set#Card| b@@5)))))
 :qid |stdinbpl.643:18|
 :skolemid |78|
 :pattern ( (|Set#Card| (|Set#Union| a@@5 b@@5)))
 :pattern ( (|Set#Card| (|Set#Intersection| a@@5 b@@5)))
)))
(assert (forall ((s@@3 T@U) (x@@8 T@U) ) (! (let ((T@@20 (type x@@8)))
 (=> (and (= (type s@@3) (SeqType T@@20)) (|Seq#Contains| s@@3 x@@8)) (and (and (<= 0 (|Seq#Skolem| s@@3 x@@8)) (< (|Seq#Skolem| s@@3 x@@8) (|Seq#Length| s@@3))) (= (|Seq#Index| s@@3 (|Seq#Skolem| s@@3 x@@8)) x@@8))))
 :qid |stdinbpl.438:18|
 :skolemid |47|
 :pattern ( (|Seq#Contains| s@@3 x@@8))
)))
(assert (forall ((Heap@@5 T@U) (ExhaleHeap@@1 T@U) (Mask@@3 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@5) (MapType0Type RefType)) (= (type ExhaleHeap@@1) (MapType0Type RefType))) (= (type Mask@@3) (MapType1Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@5 ExhaleHeap@@1 Mask@@3)) (U_2_bool (MapType0Select Heap@@5 o_1 $allocated))) (U_2_bool (MapType0Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.73:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@5 ExhaleHeap@@1 Mask@@3) (MapType0Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert (forall ((s@@4 T@U) (n@@3 Int) ) (! (let ((T@@21 (SeqTypeInv0 (type s@@4))))
 (=> (and (= (type s@@4) (SeqType T@@21)) (<= n@@3 0)) (= (|Seq#Drop| s@@4 n@@3) s@@4)))
 :qid |stdinbpl.422:18|
 :skolemid |45|
 :pattern ( (|Seq#Drop| s@@4 n@@3))
)))
(assert (forall ((i@@0 Int) (j@@0 Int) ) (! (= (|Seq#Sub| i@@0 j@@0) (- i@@0 j@@0))
 :qid |stdinbpl.276:15|
 :skolemid |30|
 :pattern ( (|Seq#Sub| i@@0 j@@0))
)))
(assert (forall ((i@@1 Int) (j@@1 Int) ) (! (= (|Seq#Add| i@@1 j@@1) (+ i@@1 j@@1))
 :qid |stdinbpl.274:15|
 :skolemid |29|
 :pattern ( (|Seq#Add| i@@1 j@@1))
)))
(assert (forall ((a@@6 Int) ) (!  (=> (<= 0 a@@6) (= (|Math#clip| a@@6) a@@6))
 :qid |stdinbpl.686:15|
 :skolemid |90|
 :pattern ( (|Math#clip| a@@6))
)))
(assert (forall ((a@@7 T@U) (b@@6 T@U) (o@@0 T@U) ) (! (let ((T@@22 (type o@@0)))
 (=> (and (= (type a@@7) (MultiSetType T@@22)) (= (type b@@6) (MultiSetType T@@22))) (= (|MultiSet#Select| (|MultiSet#Intersection| a@@7 b@@6) o@@0) (|Math#min| (|MultiSet#Select| a@@7 o@@0) (|MultiSet#Select| b@@6 o@@0)))))
 :qid |stdinbpl.737:18|
 :skolemid |105|
 :pattern ( (|MultiSet#Select| (|MultiSet#Intersection| a@@7 b@@6) o@@0))
)))
(assert (forall ((arg0@@45 T@U) ) (! (let ((T@@23 (type arg0@@45)))
(= (type (|Seq#Singleton| arg0@@45)) (SeqType T@@23)))
 :qid |funType:Seq#Singleton|
 :pattern ( (|Seq#Singleton| arg0@@45))
)))
(assert (forall ((x@@9 T@U) (y@@4 T@U) ) (! (let ((T@@24 (type x@@9)))
 (=> (= (type y@@4) T@@24) (= (|Seq#Contains| (|Seq#Singleton| x@@9) y@@4) (= x@@9 y@@4))))
 :qid |stdinbpl.563:18|
 :skolemid |54|
 :pattern ( (|Seq#Contains| (|Seq#Singleton| x@@9) y@@4))
)))
(assert (forall ((s@@5 T@U) (n@@4 Int) (j@@2 Int) ) (! (let ((T@@25 (SeqTypeInv0 (type s@@5))))
 (=> (= (type s@@5) (SeqType T@@25)) (=> (and (and (<= 0 j@@2) (< j@@2 n@@4)) (< j@@2 (|Seq#Length| s@@5))) (= (|Seq#Index| (|Seq#Take| s@@5 n@@4) j@@2) (|Seq#Index| s@@5 j@@2)))))
 :qid |stdinbpl.315:18|
 :skolemid |37|
 :pattern ( (|Seq#Index| (|Seq#Take| s@@5 n@@4) j@@2))
 :pattern ( (|Seq#Index| s@@5 j@@2) (|Seq#Take| s@@5 n@@4))
)))
(assert (forall ((Heap@@6 T@U) (ExhaleHeap@@2 T@U) (Mask@@4 T@U) (o_1@@0 T@U) (f_2 T@U) ) (! (let ((B@@1 (FieldTypeInv1 (type f_2))))
(let ((A@@1 (FieldTypeInv0 (type f_2))))
 (=> (and (and (and (and (and (and (= (type Heap@@6) (MapType0Type RefType)) (= (type ExhaleHeap@@2) (MapType0Type RefType))) (= (type Mask@@4) (MapType1Type RefType realType))) (= (type o_1@@0) RefType)) (= (type f_2) (FieldType A@@1 B@@1))) (IdenticalOnKnownLocations Heap@@6 ExhaleHeap@@2 Mask@@4)) (HasDirectPerm Mask@@4 o_1@@0 f_2)) (= (MapType0Select Heap@@6 o_1@@0 f_2) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2)))))
 :qid |stdinbpl.42:22|
 :skolemid |1|
 :pattern ( (IdenticalOnKnownLocations Heap@@6 ExhaleHeap@@2 Mask@@4) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2))
)))
(assert (forall ((T@@26 T@T) ) (! (= (type (|Seq#Empty| T@@26)) (SeqType T@@26))
 :qid |funType:Seq#Empty|
 :pattern ( (|Seq#Empty| T@@26))
)))
(assert (forall ((T@@27 T@T) ) (! (= (|Seq#Length| (|Seq#Empty| T@@27)) 0)
 :skolemid |23|
)))
(assert  (and (= (type dummyHeap) (MapType0Type RefType)) (= (type ZeroMask) (MapType1Type RefType realType))))
(assert (state dummyHeap ZeroMask))
(assert (forall ((arg0@@46 T@U) (arg1@@24 T@U) ) (! (let ((T@@28 (type arg1@@24)))
(= (type (|MultiSet#UnionOne| arg0@@46 arg1@@24)) (MultiSetType T@@28)))
 :qid |funType:MultiSet#UnionOne|
 :pattern ( (|MultiSet#UnionOne| arg0@@46 arg1@@24))
)))
(assert (forall ((a@@8 T@U) (x@@10 T@U) ) (! (let ((T@@29 (type x@@10)))
 (=> (= (type a@@8) (MultiSetType T@@29)) (= (|MultiSet#Card| (|MultiSet#UnionOne| a@@8 x@@10)) (+ (|MultiSet#Card| a@@8) 1))))
 :qid |stdinbpl.723:18|
 :skolemid |101|
 :pattern ( (|MultiSet#Card| (|MultiSet#UnionOne| a@@8 x@@10)))
 :pattern ( (|MultiSet#UnionOne| a@@8 x@@10) (|MultiSet#Card| a@@8))
)))
(assert (forall ((a@@9 T@U) (b@@7 T@U) ) (! (let ((T@@30 (MultiSetTypeInv0 (type a@@9))))
 (=> (and (= (type a@@9) (MultiSetType T@@30)) (= (type b@@7) (MultiSetType T@@30))) (= (|MultiSet#Disjoint| a@@9 b@@7) (forall ((o@@1 T@U) ) (!  (=> (= (type o@@1) T@@30) (or (= (|MultiSet#Select| a@@9 o@@1) 0) (= (|MultiSet#Select| b@@7 o@@1) 0)))
 :qid |stdinbpl.773:39|
 :skolemid |116|
 :pattern ( (|MultiSet#Select| a@@9 o@@1))
 :pattern ( (|MultiSet#Select| b@@7 o@@1))
)))))
 :qid |stdinbpl.772:18|
 :skolemid |117|
 :pattern ( (|MultiSet#Disjoint| a@@9 b@@7))
)))
(assert (forall ((p T@U) (v_1 T@U) (w T@U) ) (! (let ((A@@2 (FieldTypeInv0 (type p))))
 (=> (and (and (= (type p) (FieldType A@@2 FrameTypeType)) (= (type v_1) FrameTypeType)) (= (type w) FrameTypeType)) (not (InsidePredicate p v_1 p w))))
 :qid |stdinbpl.219:19|
 :skolemid |21|
 :pattern ( (InsidePredicate p v_1 p w))
)))
(assert (forall ((arg0@@47 T@U) (arg1@@25 T@U) ) (! (let ((T@@31 (SeqTypeInv0 (type arg0@@47))))
(= (type (|Seq#Append| arg0@@47 arg1@@25)) (SeqType T@@31)))
 :qid |funType:Seq#Append|
 :pattern ( (|Seq#Append| arg0@@47 arg1@@25))
)))
(assert (forall ((s0 T@U) (s1 T@U) (n@@5 Int) ) (! (let ((T@@32 (SeqTypeInv0 (type s0))))
 (=> (and (= (type s0) (SeqType T@@32)) (= (type s1) (SeqType T@@32))) (=> (and (and (and (not (= s0 (|Seq#Empty| T@@32))) (not (= s1 (|Seq#Empty| T@@32)))) (<= (|Seq#Length| s0) n@@5)) (< n@@5 (|Seq#Length| (|Seq#Append| s0 s1)))) (and (= (|Seq#Add| (|Seq#Sub| n@@5 (|Seq#Length| s0)) (|Seq#Length| s0)) n@@5) (= (|Seq#Index| (|Seq#Append| s0 s1) n@@5) (|Seq#Index| s1 (|Seq#Sub| n@@5 (|Seq#Length| s0))))))))
 :qid |stdinbpl.287:18|
 :skolemid |32|
 :pattern ( (|Seq#Index| (|Seq#Append| s0 s1) n@@5))
)))
(assert (forall ((arg0@@48 T@U) ) (! (let ((T@@33 (type arg0@@48)))
(= (type (|MultiSet#Singleton| arg0@@48)) (MultiSetType T@@33)))
 :qid |funType:MultiSet#Singleton|
 :pattern ( (|MultiSet#Singleton| arg0@@48))
)))
(assert (forall ((r@@0 T@U) ) (!  (and (= (|MultiSet#Card| (|MultiSet#Singleton| r@@0)) 1) (= (|MultiSet#Select| (|MultiSet#Singleton| r@@0) r@@0) 1))
 :qid |stdinbpl.715:18|
 :skolemid |98|
 :pattern ( (|MultiSet#Singleton| r@@0))
)))
(assert  (not (IsPredicateField f_7)))
(assert  (not (IsWandField f_7)))
(assert (forall ((Heap@@7 T@U) (ExhaleHeap@@3 T@U) (Mask@@5 T@U) ) (!  (=> (and (and (and (= (type Heap@@7) (MapType0Type RefType)) (= (type ExhaleHeap@@3) (MapType0Type RefType))) (= (type Mask@@5) (MapType1Type RefType realType))) (IdenticalOnKnownLocations Heap@@7 ExhaleHeap@@3 Mask@@5)) (succHeap Heap@@7 ExhaleHeap@@3))
 :qid |stdinbpl.83:15|
 :skolemid |10|
 :pattern ( (IdenticalOnKnownLocations Heap@@7 ExhaleHeap@@3 Mask@@5))
)))
(assert (forall ((a@@10 T@U) (b@@8 T@U) ) (! (let ((T@@34 (MapType2TypeInv0 (type a@@10))))
 (=> (and (= (type a@@10) (MapType2Type T@@34 boolType)) (= (type b@@8) (MapType2Type T@@34 boolType))) (= (|Set#Equal| a@@10 b@@8) (forall ((o@@2 T@U) ) (!  (=> (= (type o@@2) T@@34) (= (U_2_bool (MapType2Select a@@10 o@@2)) (U_2_bool (MapType2Select b@@8 o@@2))))
 :qid |stdinbpl.668:31|
 :skolemid |84|
 :pattern ( (MapType2Select a@@10 o@@2))
 :pattern ( (MapType2Select b@@8 o@@2))
)))))
 :qid |stdinbpl.667:17|
 :skolemid |85|
 :pattern ( (|Set#Equal| a@@10 b@@8))
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
(assert (forall ((a@@11 T@U) (b@@9 T@U) ) (! (let ((T@@35 (MultiSetTypeInv0 (type a@@11))))
 (=> (and (= (type a@@11) (MultiSetType T@@35)) (= (type b@@9) (MultiSetType T@@35))) (= (|MultiSet#Card| (|MultiSet#Union| a@@11 b@@9)) (+ (|MultiSet#Card| a@@11) (|MultiSet#Card| b@@9)))))
 :qid |stdinbpl.733:18|
 :skolemid |104|
 :pattern ( (|MultiSet#Card| (|MultiSet#Union| a@@11 b@@9)))
 :pattern ( (|MultiSet#Card| a@@11) (|MultiSet#Union| a@@11 b@@9))
 :pattern ( (|MultiSet#Card| b@@9) (|MultiSet#Union| a@@11 b@@9))
)))
(assert  (and (forall ((arg0@@49 Real) (arg1@@26 T@U) ) (! (= (type (ConditionalFrame arg0@@49 arg1@@26)) FrameTypeType)
 :qid |funType:ConditionalFrame|
 :pattern ( (ConditionalFrame arg0@@49 arg1@@26))
)) (= (type EmptyFrame) FrameTypeType)))
(assert (forall ((p@@0 Real) (f_6 T@U) ) (!  (=> (= (type f_6) FrameTypeType) (= (ConditionalFrame p@@0 f_6) (ite (> p@@0 0.0) f_6 EmptyFrame)))
 :qid |stdinbpl.207:15|
 :skolemid |19|
 :pattern ( (ConditionalFrame p@@0 f_6))
)))
(assert (forall ((q@min@@0 Int) (q@max@@0 Int) (j@@3 Int) ) (!  (=> (and (<= 0 j@@3) (< j@@3 (- q@max@@0 q@min@@0))) (= (U_2_int (|Seq#Index| (|Seq#Range| q@min@@0 q@max@@0) j@@3)) (+ q@min@@0 j@@3)))
 :qid |stdinbpl.578:15|
 :skolemid |56|
 :pattern ( (|Seq#Index| (|Seq#Range| q@min@@0 q@max@@0) j@@3))
)))
(assert (forall ((Mask@@6 T@U) (o_2@@0 T@U) (f_4@@0 T@U) ) (! (let ((B@@3 (FieldTypeInv1 (type f_4@@0))))
(let ((A@@4 (FieldTypeInv0 (type f_4@@0))))
 (=> (and (and (= (type Mask@@6) (MapType1Type RefType realType)) (= (type o_2@@0) RefType)) (= (type f_4@@0) (FieldType A@@4 B@@3))) (= (HasDirectPerm Mask@@6 o_2@@0 f_4@@0) (> (U_2_real (MapType1Select Mask@@6 o_2@@0 f_4@@0)) NoPerm)))))
 :qid |stdinbpl.133:22|
 :skolemid |17|
 :pattern ( (HasDirectPerm Mask@@6 o_2@@0 f_4@@0))
)))
(assert (forall ((s0@@0 T@U) (s1@@0 T@U) ) (! (let ((T@@36 (SeqTypeInv0 (type s0@@0))))
 (=> (and (and (= (type s0@@0) (SeqType T@@36)) (= (type s1@@0) (SeqType T@@36))) (and (not (= s0@@0 (|Seq#Empty| T@@36))) (not (= s1@@0 (|Seq#Empty| T@@36))))) (= (|Seq#Length| (|Seq#Append| s0@@0 s1@@0)) (+ (|Seq#Length| s0@@0) (|Seq#Length| s1@@0)))))
 :qid |stdinbpl.256:18|
 :skolemid |26|
 :pattern ( (|Seq#Length| (|Seq#Append| s0@@0 s1@@0)))
)))
(assert (forall ((s@@6 T@U) (t T@U) (n@@6 Int) ) (! (let ((T@@37 (SeqTypeInv0 (type s@@6))))
 (=> (and (and (= (type s@@6) (SeqType T@@37)) (= (type t) (SeqType T@@37))) (and (> n@@6 0) (> n@@6 (|Seq#Length| s@@6)))) (and (= (|Seq#Add| (|Seq#Sub| n@@6 (|Seq#Length| s@@6)) (|Seq#Length| s@@6)) n@@6) (= (|Seq#Drop| (|Seq#Append| s@@6 t) n@@6) (|Seq#Drop| t (|Seq#Sub| n@@6 (|Seq#Length| s@@6)))))))
 :qid |stdinbpl.412:18|
 :skolemid |44|
 :pattern ( (|Seq#Drop| (|Seq#Append| s@@6 t) n@@6))
)))
(assert (forall ((Heap@@8 T@U) (xs@@4 T@U) (y@@5 T@U) ) (!  (=> (and (and (= (type Heap@@8) (MapType0Type RefType)) (= (type xs@@4) (MapType2Type RefType boolType))) (= (type y@@5) RefType)) (and (= (fun01 Heap@@8 xs@@4 y@@5) (|fun01'| Heap@@8 xs@@4 y@@5)) (dummyFunction (int_2_U (|fun01#triggerStateless| xs@@4 y@@5)))))
 :qid |stdinbpl.792:15|
 :skolemid |118|
 :pattern ( (fun01 Heap@@8 xs@@4 y@@5))
)))
(assert (forall ((Heap@@9 T@U) (Mask@@7 T@U) (xs@@5 T@U) (ys@@2 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@9) (MapType0Type RefType)) (= (type Mask@@7) (MapType1Type RefType realType))) (= (type xs@@5) (SeqType RefType))) (= (type ys@@2) (SeqType RefType))) (and (state Heap@@9 Mask@@7) (< AssumeFunctionsAbove 1))) (and (and (forall ((i@@2 Int) (j@@4 Int) ) (!  (=> (and (>= i@@2 0) (and (< i@@2 (|Seq#Length| xs@@5)) (and (>= j@@4 0) (and (< j@@4 (|Seq#Length| xs@@5)) (not (= i@@2 j@@4)))))) (not (= (|Seq#Index| xs@@5 i@@2) (|Seq#Index| xs@@5 j@@4))))
 :qid |stdinbpl.933:62|
 :skolemid |133|
 :pattern ( (|Seq#Index| xs@@5 i@@2) (|Seq#Index| xs@@5 j@@4))
)) (forall ((i_2 Int) (j_1 Int) ) (!  (=> (and (>= i_2 0) (and (< i_2 (|Seq#Length| ys@@2)) (and (>= j_1 0) (and (< j_1 (|Seq#Length| ys@@2)) (not (= i_2 j_1)))))) (not (= (|Seq#Index| ys@@2 i_2) (|Seq#Index| ys@@2 j_1))))
 :qid |stdinbpl.936:16|
 :skolemid |134|
 :pattern ( (|Seq#Index| ys@@2 i_2) (|Seq#Index| ys@@2 j_1))
))) (and (< 10 (|Seq#Length| xs@@5)) (= (|Seq#Length| xs@@5) (|Seq#Length| ys@@2))))) (= (fun02 Heap@@9 xs@@5 ys@@2) (= (U_2_int (MapType0Select Heap@@9 (|Seq#Index| xs@@5 0) f_7)) (U_2_int (MapType0Select Heap@@9 (|Seq#Index| ys@@2 0) f_7)))))
 :qid |stdinbpl.931:15|
 :skolemid |135|
 :pattern ( (state Heap@@9 Mask@@7) (fun02 Heap@@9 xs@@5 ys@@2))
)))
(assert (forall ((arg0@@50 T@U) ) (! (= (type (FrameFragment arg0@@50)) FrameTypeType)
 :qid |funType:FrameFragment|
 :pattern ( (FrameFragment arg0@@50))
)))
(assert (forall ((Heap@@10 T@U) (Mask@@8 T@U) (xs@@6 T@U) (y@@6 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@10) (MapType0Type RefType)) (= (type Mask@@8) (MapType1Type RefType realType))) (= (type xs@@6) (MapType2Type RefType boolType))) (= (type y@@6) RefType)) (state Heap@@10 Mask@@8)) (= (|fun01'| Heap@@10 xs@@6 y@@6) (|fun01#frame| (FrameFragment (int_2_U (|fun01#condqp1| Heap@@10 xs@@6 y@@6))) xs@@6 y@@6)))
 :qid |stdinbpl.812:15|
 :skolemid |122|
 :pattern ( (state Heap@@10 Mask@@8) (|fun01'| Heap@@10 xs@@6 y@@6))
)))
(assert (forall ((o_2@@1 T@U) (f_4@@1 T@U) ) (! (let ((B@@4 (FieldTypeInv1 (type f_4@@1))))
(let ((A@@5 (FieldTypeInv0 (type f_4@@1))))
 (=> (and (= (type o_2@@1) RefType) (= (type f_4@@1) (FieldType A@@5 B@@4))) (= (U_2_real (MapType1Select ZeroMask o_2@@1 f_4@@1)) NoPerm))))
 :qid |stdinbpl.106:22|
 :skolemid |13|
 :pattern ( (MapType1Select ZeroMask o_2@@1 f_4@@1))
)))
(assert (forall ((a@@12 T@U) (b@@10 T@U) (o@@3 T@U) ) (! (let ((T@@38 (type o@@3)))
 (=> (and (= (type a@@12) (MapType2Type T@@38 boolType)) (= (type b@@10) (MapType2Type T@@38 boolType))) (= (U_2_bool (MapType2Select (|Set#Intersection| a@@12 b@@10) o@@3))  (and (U_2_bool (MapType2Select a@@12 o@@3)) (U_2_bool (MapType2Select b@@10 o@@3))))))
 :qid |stdinbpl.632:18|
 :skolemid |73|
 :pattern ( (MapType2Select (|Set#Intersection| a@@12 b@@10) o@@3))
 :pattern ( (|Set#Intersection| a@@12 b@@10) (MapType2Select a@@12 o@@3))
 :pattern ( (|Set#Intersection| a@@12 b@@10) (MapType2Select b@@10 o@@3))
)))
(assert (forall ((s@@7 T@U) (t@@0 T@U) (n@@7 Int) ) (! (let ((T@@39 (SeqTypeInv0 (type s@@7))))
 (=> (and (and (= (type s@@7) (SeqType T@@39)) (= (type t@@0) (SeqType T@@39))) (and (> n@@7 0) (> n@@7 (|Seq#Length| s@@7)))) (and (= (|Seq#Add| (|Seq#Sub| n@@7 (|Seq#Length| s@@7)) (|Seq#Length| s@@7)) n@@7) (= (|Seq#Take| (|Seq#Append| s@@7 t@@0) n@@7) (|Seq#Append| s@@7 (|Seq#Take| t@@0 (|Seq#Sub| n@@7 (|Seq#Length| s@@7))))))))
 :qid |stdinbpl.399:18|
 :skolemid |42|
 :pattern ( (|Seq#Take| (|Seq#Append| s@@7 t@@0) n@@7))
)))
(assert (forall ((q@min@@1 Int) (q@max@@1 Int) ) (!  (and (=> (< q@min@@1 q@max@@1) (= (|Seq#Length| (|Seq#Range| q@min@@1 q@max@@1)) (- q@max@@1 q@min@@1))) (=> (<= q@max@@1 q@min@@1) (= (|Seq#Length| (|Seq#Range| q@min@@1 q@max@@1)) 0)))
 :qid |stdinbpl.577:15|
 :skolemid |55|
 :pattern ( (|Seq#Length| (|Seq#Range| q@min@@1 q@max@@1)))
)))
(assert (forall ((arg0@@51 T@U) (arg1@@27 T@U) ) (! (let ((T@@40 (MapType2TypeInv0 (type arg0@@51))))
(= (type (|Set#Difference| arg0@@51 arg1@@27)) (MapType2Type T@@40 boolType)))
 :qid |funType:Set#Difference|
 :pattern ( (|Set#Difference| arg0@@51 arg1@@27))
)))
(assert (forall ((a@@13 T@U) (b@@11 T@U) (o@@4 T@U) ) (! (let ((T@@41 (type o@@4)))
 (=> (and (= (type a@@13) (MapType2Type T@@41 boolType)) (= (type b@@11) (MapType2Type T@@41 boolType))) (= (U_2_bool (MapType2Select (|Set#Difference| a@@13 b@@11) o@@4))  (and (U_2_bool (MapType2Select a@@13 o@@4)) (not (U_2_bool (MapType2Select b@@11 o@@4)))))))
 :qid |stdinbpl.647:18|
 :skolemid |79|
 :pattern ( (MapType2Select (|Set#Difference| a@@13 b@@11) o@@4))
 :pattern ( (|Set#Difference| a@@13 b@@11) (MapType2Select a@@13 o@@4))
)))
(assert (forall ((a@@14 T@U) (b@@12 T@U) ) (! (let ((T@@42 (SeqTypeInv0 (type a@@14))))
 (=> (and (and (= (type a@@14) (SeqType T@@42)) (= (type b@@12) (SeqType T@@42))) (|Seq#Equal| a@@14 b@@12)) (= a@@14 b@@12)))
 :qid |stdinbpl.550:18|
 :skolemid |53|
 :pattern ( (|Seq#Equal| a@@14 b@@12))
)))
(assert (forall ((a@@15 T@U) (b@@13 T@U) ) (! (let ((T@@43 (MapType2TypeInv0 (type a@@15))))
 (=> (and (and (= (type a@@15) (MapType2Type T@@43 boolType)) (= (type b@@13) (MapType2Type T@@43 boolType))) (|Set#Equal| a@@15 b@@13)) (= a@@15 b@@13)))
 :qid |stdinbpl.669:17|
 :skolemid |86|
 :pattern ( (|Set#Equal| a@@15 b@@13))
)))
(assert (forall ((a@@16 T@U) (b@@14 T@U) ) (! (let ((T@@44 (MultiSetTypeInv0 (type a@@16))))
 (=> (and (and (= (type a@@16) (MultiSetType T@@44)) (= (type b@@14) (MultiSetType T@@44))) (|MultiSet#Equal| a@@16 b@@14)) (= a@@16 b@@14)))
 :qid |stdinbpl.768:17|
 :skolemid |115|
 :pattern ( (|MultiSet#Equal| a@@16 b@@14))
)))
(assert (forall ((arg0@@52 T@U) (arg1@@28 T@U) ) (! (let ((T@@45 (type arg1@@28)))
(= (type (|Set#UnionOne| arg0@@52 arg1@@28)) (MapType2Type T@@45 boolType)))
 :qid |funType:Set#UnionOne|
 :pattern ( (|Set#UnionOne| arg0@@52 arg1@@28))
)))
(assert (forall ((a@@17 T@U) (x@@11 T@U) (y@@7 T@U) ) (! (let ((T@@46 (type x@@11)))
 (=> (and (and (= (type a@@17) (MapType2Type T@@46 boolType)) (= (type y@@7) T@@46)) (U_2_bool (MapType2Select a@@17 y@@7))) (U_2_bool (MapType2Select (|Set#UnionOne| a@@17 x@@11) y@@7))))
 :qid |stdinbpl.612:18|
 :skolemid |67|
 :pattern ( (|Set#UnionOne| a@@17 x@@11) (MapType2Select a@@17 y@@7))
)))
(assert (forall ((a@@18 T@U) (b@@15 T@U) (y@@8 T@U) ) (! (let ((T@@47 (type y@@8)))
 (=> (and (and (= (type a@@18) (MapType2Type T@@47 boolType)) (= (type b@@15) (MapType2Type T@@47 boolType))) (U_2_bool (MapType2Select a@@18 y@@8))) (U_2_bool (MapType2Select (|Set#Union| a@@18 b@@15) y@@8))))
 :qid |stdinbpl.622:18|
 :skolemid |71|
 :pattern ( (|Set#Union| a@@18 b@@15) (MapType2Select a@@18 y@@8))
)))
(assert (forall ((a@@19 T@U) (b@@16 T@U) (y@@9 T@U) ) (! (let ((T@@48 (type y@@9)))
 (=> (and (and (= (type a@@19) (MapType2Type T@@48 boolType)) (= (type b@@16) (MapType2Type T@@48 boolType))) (U_2_bool (MapType2Select b@@16 y@@9))) (U_2_bool (MapType2Select (|Set#Union| a@@19 b@@16) y@@9))))
 :qid |stdinbpl.624:18|
 :skolemid |72|
 :pattern ( (|Set#Union| a@@19 b@@16) (MapType2Select b@@16 y@@9))
)))
(assert (forall ((ms T@U) (x@@12 T@U) ) (! (let ((T@@49 (type x@@12)))
 (=> (= (type ms) (MultiSetType T@@49)) (>= (|MultiSet#Select| ms x@@12) 0)))
 :qid |stdinbpl.699:18|
 :skolemid |92|
 :pattern ( (|MultiSet#Select| ms x@@12))
)))
(assert (forall ((a@@20 T@U) (x@@13 T@U) (o@@5 T@U) ) (! (let ((T@@50 (type x@@13)))
 (=> (and (= (type a@@20) (MapType2Type T@@50 boolType)) (= (type o@@5) T@@50)) (= (U_2_bool (MapType2Select (|Set#UnionOne| a@@20 x@@13) o@@5))  (or (= o@@5 x@@13) (U_2_bool (MapType2Select a@@20 o@@5))))))
 :qid |stdinbpl.608:18|
 :skolemid |65|
 :pattern ( (MapType2Select (|Set#UnionOne| a@@20 x@@13) o@@5))
)))
(assert (forall ((a@@21 T@U) (b@@17 T@U) (y@@10 T@U) ) (! (let ((T@@51 (type y@@10)))
 (=> (and (and (= (type a@@21) (MapType2Type T@@51 boolType)) (= (type b@@17) (MapType2Type T@@51 boolType))) (U_2_bool (MapType2Select b@@17 y@@10))) (not (U_2_bool (MapType2Select (|Set#Difference| a@@21 b@@17) y@@10)))))
 :qid |stdinbpl.649:18|
 :skolemid |80|
 :pattern ( (|Set#Difference| a@@21 b@@17) (MapType2Select b@@17 y@@10))
)))
(assert (forall ((s@@8 T@U) (i@@3 Int) ) (! (let ((T@@52 (SeqTypeInv0 (type s@@8))))
 (=> (= (type s@@8) (SeqType T@@52)) (=> (and (<= 0 i@@3) (< i@@3 (|Seq#Length| s@@8))) (|Seq#ContainsTrigger| s@@8 (|Seq#Index| s@@8 i@@3)))))
 :qid |stdinbpl.443:18|
 :skolemid |49|
 :pattern ( (|Seq#Index| s@@8 i@@3))
)))
(assert (forall ((a@@22 T@U) (b@@18 T@U) ) (! (let ((T@@53 (MapType2TypeInv0 (type a@@22))))
 (=> (and (= (type a@@22) (MapType2Type T@@53 boolType)) (= (type b@@18) (MapType2Type T@@53 boolType))) (and (= (+ (+ (|Set#Card| (|Set#Difference| a@@22 b@@18)) (|Set#Card| (|Set#Difference| b@@18 a@@22))) (|Set#Card| (|Set#Intersection| a@@22 b@@18))) (|Set#Card| (|Set#Union| a@@22 b@@18))) (= (|Set#Card| (|Set#Difference| a@@22 b@@18)) (- (|Set#Card| a@@22) (|Set#Card| (|Set#Intersection| a@@22 b@@18)))))))
 :qid |stdinbpl.651:18|
 :skolemid |81|
 :pattern ( (|Set#Card| (|Set#Difference| a@@22 b@@18)))
)))
(assert (forall ((s0@@1 T@U) (s1@@1 T@U) ) (! (let ((T@@54 (SeqTypeInv0 (type s0@@1))))
 (=> (and (= (type s0@@1) (SeqType T@@54)) (= (type s1@@1) (SeqType T@@54))) (and (=> (= s0@@1 (|Seq#Empty| T@@54)) (= (|Seq#Append| s0@@1 s1@@1) s1@@1)) (=> (= s1@@1 (|Seq#Empty| T@@54)) (= (|Seq#Append| s0@@1 s1@@1) s0@@1)))))
 :qid |stdinbpl.262:18|
 :skolemid |27|
 :pattern ( (|Seq#Append| s0@@1 s1@@1))
)))
(assert (forall ((t@@1 T@U) ) (! (= (|Seq#Index| (|Seq#Singleton| t@@1) 0) t@@1)
 :qid |stdinbpl.266:18|
 :skolemid |28|
 :pattern ( (|Seq#Singleton| t@@1))
)))
(assert (forall ((s@@9 T@U) ) (! (let ((T@@55 (SeqTypeInv0 (type s@@9))))
 (=> (= (type s@@9) (SeqType T@@55)) (<= 0 (|Seq#Length| s@@9))))
 :qid |stdinbpl.245:18|
 :skolemid |22|
 :pattern ( (|Seq#Length| s@@9))
)))
(assert (forall ((s@@10 T@U) ) (! (let ((T@@56 (MapType2TypeInv0 (type s@@10))))
 (=> (= (type s@@10) (MapType2Type T@@56 boolType)) (<= 0 (|Set#Card| s@@10))))
 :qid |stdinbpl.594:18|
 :skolemid |58|
 :pattern ( (|Set#Card| s@@10))
)))
(assert (forall ((s@@11 T@U) ) (! (let ((T@@57 (MultiSetTypeInv0 (type s@@11))))
 (=> (= (type s@@11) (MultiSetType T@@57)) (<= 0 (|MultiSet#Card| s@@11))))
 :qid |stdinbpl.702:18|
 :skolemid |93|
 :pattern ( (|MultiSet#Card| s@@11))
)))
(assert (forall ((T@@58 T@T) ) (! (= (type (|MultiSet#Empty| T@@58)) (MultiSetType T@@58))
 :qid |funType:MultiSet#Empty|
 :pattern ( (|MultiSet#Empty| T@@58))
)))
(assert (forall ((o@@6 T@U) ) (! (let ((T@@59 (type o@@6)))
(= (|MultiSet#Select| (|MultiSet#Empty| T@@59) o@@6) 0))
 :qid |stdinbpl.707:18|
 :skolemid |94|
 :pattern ( (let ((T@@59 (type o@@6)))
(|MultiSet#Select| (|MultiSet#Empty| T@@59) o@@6)))
)))
(assert (forall ((a@@23 T@U) (x@@14 T@U) ) (! (let ((T@@60 (type x@@14)))
 (=> (= (type a@@23) (MapType2Type T@@60 boolType)) (U_2_bool (MapType2Select (|Set#UnionOne| a@@23 x@@14) x@@14))))
 :qid |stdinbpl.610:18|
 :skolemid |66|
 :pattern ( (|Set#UnionOne| a@@23 x@@14))
)))
(assert (forall ((s0@@2 T@U) (s1@@2 T@U) ) (! (let ((T@@61 (SeqTypeInv0 (type s0@@2))))
 (=> (and (and (= (type s0@@2) (SeqType T@@61)) (= (type s1@@2) (SeqType T@@61))) (|Seq#Equal| s0@@2 s1@@2)) (and (= (|Seq#Length| s0@@2) (|Seq#Length| s1@@2)) (forall ((j@@5 Int) ) (!  (=> (and (<= 0 j@@5) (< j@@5 (|Seq#Length| s0@@2))) (= (|Seq#Index| s0@@2 j@@5) (|Seq#Index| s1@@2 j@@5)))
 :qid |stdinbpl.540:13|
 :skolemid |50|
 :pattern ( (|Seq#Index| s0@@2 j@@5))
 :pattern ( (|Seq#Index| s1@@2 j@@5))
)))))
 :qid |stdinbpl.537:18|
 :skolemid |51|
 :pattern ( (|Seq#Equal| s0@@2 s1@@2))
)))
(assert (forall ((Heap@@11 T@U) (ExhaleHeap@@4 T@U) (Mask@@9 T@U) (pm_f@@1 T@U) ) (! (let ((C@@1 (FieldTypeInv0 (type pm_f@@1))))
 (=> (and (and (and (and (and (= (type Heap@@11) (MapType0Type RefType)) (= (type ExhaleHeap@@4) (MapType0Type RefType))) (= (type Mask@@9) (MapType1Type RefType realType))) (= (type pm_f@@1) (FieldType C@@1 FrameTypeType))) (IdenticalOnKnownLocations Heap@@11 ExhaleHeap@@4 Mask@@9)) (and (HasDirectPerm Mask@@9 null pm_f@@1) (IsPredicateField pm_f@@1))) (forall ((o2 T@U) (f_2@@0 T@U) ) (! (let ((B@@5 (FieldTypeInv1 (type f_2@@0))))
(let ((A@@6 (FieldTypeInv0 (type f_2@@0))))
 (=> (and (and (= (type o2) RefType) (= (type f_2@@0) (FieldType A@@6 B@@5))) (U_2_bool (MapType1Select (MapType0Select Heap@@11 null (PredicateMaskField pm_f@@1)) o2 f_2@@0))) (= (MapType0Select Heap@@11 o2 f_2@@0) (MapType0Select ExhaleHeap@@4 o2 f_2@@0)))))
 :qid |stdinbpl.54:134|
 :skolemid |3|
 :pattern ( (MapType0Select ExhaleHeap@@4 o2 f_2@@0))
))))
 :qid |stdinbpl.52:19|
 :skolemid |4|
 :pattern ( (IdenticalOnKnownLocations Heap@@11 ExhaleHeap@@4 Mask@@9) (IsPredicateField pm_f@@1))
)))
(assert (forall ((Heap@@12 T@U) (ExhaleHeap@@5 T@U) (Mask@@10 T@U) (pm_f@@2 T@U) ) (! (let ((C@@2 (FieldTypeInv0 (type pm_f@@2))))
 (=> (and (and (and (and (and (= (type Heap@@12) (MapType0Type RefType)) (= (type ExhaleHeap@@5) (MapType0Type RefType))) (= (type Mask@@10) (MapType1Type RefType realType))) (= (type pm_f@@2) (FieldType C@@2 FrameTypeType))) (IdenticalOnKnownLocations Heap@@12 ExhaleHeap@@5 Mask@@10)) (and (HasDirectPerm Mask@@10 null pm_f@@2) (IsWandField pm_f@@2))) (forall ((o2@@0 T@U) (f_2@@1 T@U) ) (! (let ((B@@6 (FieldTypeInv1 (type f_2@@1))))
(let ((A@@7 (FieldTypeInv0 (type f_2@@1))))
 (=> (and (and (= (type o2@@0) RefType) (= (type f_2@@1) (FieldType A@@7 B@@6))) (U_2_bool (MapType1Select (MapType0Select Heap@@12 null (WandMaskField pm_f@@2)) o2@@0 f_2@@1))) (= (MapType0Select Heap@@12 o2@@0 f_2@@1) (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1)))))
 :qid |stdinbpl.67:129|
 :skolemid |6|
 :pattern ( (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1))
))))
 :qid |stdinbpl.65:19|
 :skolemid |7|
 :pattern ( (IdenticalOnKnownLocations Heap@@12 ExhaleHeap@@5 Mask@@10) (IsWandField pm_f@@2))
)))
(assert (forall ((a@@24 T@U) (x@@15 T@U) ) (! (let ((T@@62 (type x@@15)))
 (=> (and (= (type a@@24) (MapType2Type T@@62 boolType)) (U_2_bool (MapType2Select a@@24 x@@15))) (= (|Set#Card| (|Set#UnionOne| a@@24 x@@15)) (|Set#Card| a@@24))))
 :qid |stdinbpl.614:18|
 :skolemid |68|
 :pattern ( (|Set#Card| (|Set#UnionOne| a@@24 x@@15)))
)))
(assert (forall ((a@@25 T@U) (x@@16 T@U) ) (! (let ((T@@63 (type x@@16)))
 (=> (= (type a@@25) (MultiSetType T@@63)) (and (> (|MultiSet#Select| (|MultiSet#UnionOne| a@@25 x@@16) x@@16) 0) (> (|MultiSet#Card| (|MultiSet#UnionOne| a@@25 x@@16)) 0))))
 :qid |stdinbpl.726:18|
 :skolemid |102|
 :pattern ( (|MultiSet#UnionOne| a@@25 x@@16))
)))
(assert (forall ((t@@2 T@U) ) (! (= (|Seq#Length| (|Seq#Singleton| t@@2)) 1)
 :qid |stdinbpl.253:18|
 :skolemid |25|
 :pattern ( (|Seq#Singleton| t@@2))
)))
(assert (forall ((r@@1 T@U) ) (! (= (|Set#Card| (|Set#Singleton| r@@1)) 1)
 :qid |stdinbpl.605:18|
 :skolemid |64|
 :pattern ( (|Set#Card| (|Set#Singleton| r@@1)))
)))
(assert (forall ((Mask@@11 T@U) (o_2@@2 T@U) (f_4@@2 T@U) ) (! (let ((B@@7 (FieldTypeInv1 (type f_4@@2))))
(let ((A@@8 (FieldTypeInv0 (type f_4@@2))))
 (=> (and (and (and (= (type Mask@@11) (MapType1Type RefType realType)) (= (type o_2@@2) RefType)) (= (type f_4@@2) (FieldType A@@8 B@@7))) (GoodMask Mask@@11)) (and (>= (U_2_real (MapType1Select Mask@@11 o_2@@2 f_4@@2)) NoPerm) (=> (and (and (GoodMask Mask@@11) (not (IsPredicateField f_4@@2))) (not (IsWandField f_4@@2))) (<= (U_2_real (MapType1Select Mask@@11 o_2@@2 f_4@@2)) FullPerm))))))
 :qid |stdinbpl.128:22|
 :skolemid |16|
 :pattern ( (GoodMask Mask@@11) (MapType1Select Mask@@11 o_2@@2 f_4@@2))
)))
(assert (forall ((r@@2 T@U) ) (! (U_2_bool (MapType2Select (|Set#Singleton| r@@2) r@@2))
 :qid |stdinbpl.603:18|
 :skolemid |62|
 :pattern ( (|Set#Singleton| r@@2))
)))
(assert (forall ((a@@26 T@U) (b@@19 T@U) ) (! (let ((T@@64 (MapType2TypeInv0 (type a@@26))))
 (=> (and (= (type a@@26) (MapType2Type T@@64 boolType)) (= (type b@@19) (MapType2Type T@@64 boolType))) (= (|Set#Union| a@@26 (|Set#Union| a@@26 b@@19)) (|Set#Union| a@@26 b@@19))))
 :qid |stdinbpl.637:18|
 :skolemid |75|
 :pattern ( (|Set#Union| a@@26 (|Set#Union| a@@26 b@@19)))
)))
(assert (forall ((a@@27 T@U) (b@@20 T@U) ) (! (let ((T@@65 (MapType2TypeInv0 (type a@@27))))
 (=> (and (= (type a@@27) (MapType2Type T@@65 boolType)) (= (type b@@20) (MapType2Type T@@65 boolType))) (= (|Set#Intersection| a@@27 (|Set#Intersection| a@@27 b@@20)) (|Set#Intersection| a@@27 b@@20))))
 :qid |stdinbpl.641:18|
 :skolemid |77|
 :pattern ( (|Set#Intersection| a@@27 (|Set#Intersection| a@@27 b@@20)))
)))
(assert (forall ((a@@28 T@U) (b@@21 T@U) ) (! (let ((T@@66 (MultiSetTypeInv0 (type a@@28))))
 (=> (and (= (type a@@28) (MultiSetType T@@66)) (= (type b@@21) (MultiSetType T@@66))) (= (|MultiSet#Intersection| a@@28 (|MultiSet#Intersection| a@@28 b@@21)) (|MultiSet#Intersection| a@@28 b@@21))))
 :qid |stdinbpl.743:18|
 :skolemid |107|
 :pattern ( (|MultiSet#Intersection| a@@28 (|MultiSet#Intersection| a@@28 b@@21)))
)))
(assert (forall ((s@@12 T@U) ) (! (let ((T@@67 (MultiSetTypeInv0 (type s@@12))))
 (=> (= (type s@@12) (MultiSetType T@@67)) (and (= (= (|MultiSet#Card| s@@12) 0) (= s@@12 (|MultiSet#Empty| T@@67))) (=> (not (= (|MultiSet#Card| s@@12) 0)) (exists ((x@@17 T@U) ) (!  (and (= (type x@@17) T@@67) (< 0 (|MultiSet#Select| s@@12 x@@17)))
 :qid |stdinbpl.710:38|
 :skolemid |95|
 :no-pattern (type x@@17)
 :no-pattern (U_2_int x@@17)
 :no-pattern (U_2_bool x@@17)
))))))
 :qid |stdinbpl.708:18|
 :skolemid |96|
 :pattern ( (|MultiSet#Card| s@@12))
)))
(assert (forall ((r@@3 T@U) (o@@7 T@U) ) (! (let ((T@@68 (type r@@3)))
 (=> (= (type o@@7) T@@68) (and (= (= (|MultiSet#Select| (|MultiSet#Singleton| r@@3) o@@7) 1) (= r@@3 o@@7)) (= (= (|MultiSet#Select| (|MultiSet#Singleton| r@@3) o@@7) 0) (not (= r@@3 o@@7))))))
 :qid |stdinbpl.713:18|
 :skolemid |97|
 :pattern ( (|MultiSet#Select| (|MultiSet#Singleton| r@@3) o@@7))
)))
(assert (forall ((o@@8 T@U) (f T@U) (Heap@@13 T@U) ) (!  (=> (and (and (and (= (type o@@8) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap@@13) (MapType0Type RefType))) (U_2_bool (MapType0Select Heap@@13 o@@8 $allocated))) (U_2_bool (MapType0Select Heap@@13 (MapType0Select Heap@@13 o@@8 f) $allocated)))
 :qid |stdinbpl.31:15|
 :skolemid |0|
 :pattern ( (MapType0Select Heap@@13 o@@8 f))
)))
(assert (forall ((a@@29 T@U) (b@@22 T@U) (o@@9 T@U) ) (! (let ((T@@69 (type o@@9)))
 (=> (and (= (type a@@29) (MultiSetType T@@69)) (= (type b@@22) (MultiSetType T@@69))) (= (|MultiSet#Select| (|MultiSet#Union| a@@29 b@@22) o@@9) (+ (|MultiSet#Select| a@@29 o@@9) (|MultiSet#Select| b@@22 o@@9)))))
 :qid |stdinbpl.731:18|
 :skolemid |103|
 :pattern ( (|MultiSet#Select| (|MultiSet#Union| a@@29 b@@22) o@@9))
 :pattern ( (|MultiSet#Union| a@@29 b@@22) (|MultiSet#Select| a@@29 o@@9) (|MultiSet#Select| b@@22 o@@9))
)))
(assert (forall ((s@@13 T@U) (t@@3 T@U) (n@@8 Int) ) (! (let ((T@@70 (SeqTypeInv0 (type s@@13))))
 (=> (and (and (= (type s@@13) (SeqType T@@70)) (= (type t@@3) (SeqType T@@70))) (and (< 0 n@@8) (<= n@@8 (|Seq#Length| s@@13)))) (= (|Seq#Take| (|Seq#Append| s@@13 t@@3) n@@8) (|Seq#Take| s@@13 n@@8))))
 :qid |stdinbpl.395:18|
 :skolemid |41|
 :pattern ( (|Seq#Take| (|Seq#Append| s@@13 t@@3) n@@8))
)))
(assert (forall ((T@@71 T@T) ) (! (= (type (|Set#Empty| T@@71)) (MapType2Type T@@71 boolType))
 :qid |funType:Set#Empty|
 :pattern ( (|Set#Empty| T@@71))
)))
(assert (forall ((o@@10 T@U) ) (! (let ((T@@72 (type o@@10)))
 (not (U_2_bool (MapType2Select (|Set#Empty| T@@72) o@@10))))
 :qid |stdinbpl.597:18|
 :skolemid |59|
 :pattern ( (let ((T@@72 (type o@@10)))
(MapType2Select (|Set#Empty| T@@72) o@@10)))
)))
(assert (forall ((s@@14 T@U) (i@@4 Int) (v@@1 T@U) ) (! (let ((T@@73 (type v@@1)))
 (=> (= (type s@@14) (SeqType T@@73)) (=> (and (<= 0 i@@4) (< i@@4 (|Seq#Length| s@@14))) (= (|Seq#Length| (|Seq#Update| s@@14 i@@4 v@@1)) (|Seq#Length| s@@14)))))
 :qid |stdinbpl.294:18|
 :skolemid |34|
 :pattern ( (|Seq#Length| (|Seq#Update| s@@14 i@@4 v@@1)))
 :pattern ( (|Seq#Length| s@@14) (|Seq#Update| s@@14 i@@4 v@@1))
)))
(assert (forall ((r@@4 T@U) ) (! (let ((T@@74 (type r@@4)))
(= (|MultiSet#Singleton| r@@4) (|MultiSet#UnionOne| (|MultiSet#Empty| T@@74) r@@4)))
 :qid |stdinbpl.716:18|
 :skolemid |99|
 :pattern ( (|MultiSet#Singleton| r@@4))
)))
(assert (forall ((s@@15 T@U) (t@@4 T@U) (n@@9 Int) ) (! (let ((T@@75 (SeqTypeInv0 (type s@@15))))
 (=> (and (and (= (type s@@15) (SeqType T@@75)) (= (type t@@4) (SeqType T@@75))) (and (< 0 n@@9) (<= n@@9 (|Seq#Length| s@@15)))) (= (|Seq#Drop| (|Seq#Append| s@@15 t@@4) n@@9) (|Seq#Append| (|Seq#Drop| s@@15 n@@9) t@@4))))
 :qid |stdinbpl.408:18|
 :skolemid |43|
 :pattern ( (|Seq#Drop| (|Seq#Append| s@@15 t@@4) n@@9))
)))
(assert (forall ((a@@30 Int) (b@@23 Int) ) (! (= (<= a@@30 b@@23) (= (|Math#min| a@@30 b@@23) a@@30))
 :qid |stdinbpl.681:15|
 :skolemid |87|
 :pattern ( (|Math#min| a@@30 b@@23))
)))
(assert (forall ((a@@31 Int) (b@@24 Int) ) (! (= (<= b@@24 a@@31) (= (|Math#min| a@@31 b@@24) b@@24))
 :qid |stdinbpl.682:15|
 :skolemid |88|
 :pattern ( (|Math#min| a@@31 b@@24))
)))
(assert (forall ((s@@16 T@U) (n@@10 Int) (i@@5 Int) ) (! (let ((T@@76 (SeqTypeInv0 (type s@@16))))
 (=> (= (type s@@16) (SeqType T@@76)) (=> (and (and (< 0 n@@10) (<= n@@10 i@@5)) (< i@@5 (|Seq#Length| s@@16))) (and (= (|Seq#Add| (|Seq#Sub| i@@5 n@@10) n@@10) i@@5) (= (|Seq#Index| (|Seq#Drop| s@@16 n@@10) (|Seq#Sub| i@@5 n@@10)) (|Seq#Index| s@@16 i@@5))))))
 :qid |stdinbpl.345:18|
 :skolemid |40|
 :pattern ( (|Seq#Drop| s@@16 n@@10) (|Seq#Index| s@@16 i@@5))
)))
(assert (forall ((s@@17 T@U) ) (! (let ((T@@77 (MapType2TypeInv0 (type s@@17))))
 (=> (= (type s@@17) (MapType2Type T@@77 boolType)) (and (= (= (|Set#Card| s@@17) 0) (= s@@17 (|Set#Empty| T@@77))) (=> (not (= (|Set#Card| s@@17) 0)) (exists ((x@@18 T@U) ) (!  (and (= (type x@@18) T@@77) (U_2_bool (MapType2Select s@@17 x@@18)))
 :qid |stdinbpl.600:33|
 :skolemid |60|
 :no-pattern (type x@@18)
 :no-pattern (U_2_int x@@18)
 :no-pattern (U_2_bool x@@18)
))))))
 :qid |stdinbpl.598:18|
 :skolemid |61|
 :pattern ( (|Set#Card| s@@17))
)))
(assert (forall ((s0@@3 T@U) (s1@@3 T@U) (n@@11 Int) ) (! (let ((T@@78 (SeqTypeInv0 (type s0@@3))))
 (=> (and (= (type s0@@3) (SeqType T@@78)) (= (type s1@@3) (SeqType T@@78))) (=> (and (and (and (not (= s0@@3 (|Seq#Empty| T@@78))) (not (= s1@@3 (|Seq#Empty| T@@78)))) (<= 0 n@@11)) (< n@@11 (|Seq#Length| s0@@3))) (= (|Seq#Index| (|Seq#Append| s0@@3 s1@@3) n@@11) (|Seq#Index| s0@@3 n@@11)))))
 :qid |stdinbpl.285:18|
 :skolemid |31|
 :pattern ( (|Seq#Index| (|Seq#Append| s0@@3 s1@@3) n@@11))
 :pattern ( (|Seq#Index| s0@@3 n@@11) (|Seq#Append| s0@@3 s1@@3))
)))
(assert (forall ((Heap@@14 T@U) (o@@11 T@U) (f_3 T@U) (v@@2 T@U) ) (! (let ((B@@8 (type v@@2)))
(let ((A@@9 (FieldTypeInv0 (type f_3))))
 (=> (and (and (= (type Heap@@14) (MapType0Type RefType)) (= (type o@@11) RefType)) (= (type f_3) (FieldType A@@9 B@@8))) (succHeap Heap@@14 (MapType0Store Heap@@14 o@@11 f_3 v@@2)))))
 :qid |stdinbpl.78:22|
 :skolemid |9|
 :pattern ( (MapType0Store Heap@@14 o@@11 f_3 v@@2))
)))
(assert (forall ((a@@32 T@U) (b@@25 T@U) ) (! (let ((T@@79 (MapType2TypeInv0 (type a@@32))))
 (=> (and (= (type a@@32) (MapType2Type T@@79 boolType)) (= (type b@@25) (MapType2Type T@@79 boolType))) (= (|Set#Subset| a@@32 b@@25) (forall ((o@@12 T@U) ) (!  (=> (and (= (type o@@12) T@@79) (U_2_bool (MapType2Select a@@32 o@@12))) (U_2_bool (MapType2Select b@@25 o@@12)))
 :qid |stdinbpl.660:32|
 :skolemid |82|
 :pattern ( (MapType2Select a@@32 o@@12))
 :pattern ( (MapType2Select b@@25 o@@12))
)))))
 :qid |stdinbpl.659:17|
 :skolemid |83|
 :pattern ( (|Set#Subset| a@@32 b@@25))
)))
(assert (forall ((s0@@4 T@U) (s1@@4 T@U) (m@@10 Int) ) (! (let ((T@@80 (SeqTypeInv0 (type s0@@4))))
 (=> (and (= (type s0@@4) (SeqType T@@80)) (= (type s1@@4) (SeqType T@@80))) (=> (and (and (and (not (= s0@@4 (|Seq#Empty| T@@80))) (not (= s1@@4 (|Seq#Empty| T@@80)))) (<= 0 m@@10)) (< m@@10 (|Seq#Length| s1@@4))) (and (= (|Seq#Sub| (|Seq#Add| m@@10 (|Seq#Length| s0@@4)) (|Seq#Length| s0@@4)) m@@10) (= (|Seq#Index| (|Seq#Append| s0@@4 s1@@4) (|Seq#Add| m@@10 (|Seq#Length| s0@@4))) (|Seq#Index| s1@@4 m@@10))))))
 :qid |stdinbpl.290:18|
 :skolemid |33|
 :pattern ( (|Seq#Index| s1@@4 m@@10) (|Seq#Append| s0@@4 s1@@4))
)))
(assert (forall ((a@@33 T@U) (x@@19 T@U) ) (! (let ((T@@81 (type x@@19)))
 (=> (and (= (type a@@33) (MapType2Type T@@81 boolType)) (not (U_2_bool (MapType2Select a@@33 x@@19)))) (= (|Set#Card| (|Set#UnionOne| a@@33 x@@19)) (+ (|Set#Card| a@@33) 1))))
 :qid |stdinbpl.616:18|
 :skolemid |69|
 :pattern ( (|Set#Card| (|Set#UnionOne| a@@33 x@@19)))
)))
(assert (forall ((a@@34 T@U) (b@@26 T@U) (o@@13 T@U) ) (! (let ((T@@82 (type o@@13)))
 (=> (and (= (type a@@34) (MultiSetType T@@82)) (= (type b@@26) (MultiSetType T@@82))) (= (|MultiSet#Select| (|MultiSet#Difference| a@@34 b@@26) o@@13) (|Math#clip| (- (|MultiSet#Select| a@@34 o@@13) (|MultiSet#Select| b@@26 o@@13))))))
 :qid |stdinbpl.748:18|
 :skolemid |108|
 :pattern ( (|MultiSet#Select| (|MultiSet#Difference| a@@34 b@@26) o@@13))
)))
(assert (forall ((arg0@@53 Int) (arg1@@29 Int) ) (! (= (type (|sk_fun01#condqp1| arg0@@53 arg1@@29)) RefType)
 :qid |funType:sk_fun01#condqp1|
 :pattern ( (|sk_fun01#condqp1| arg0@@53 arg1@@29))
)))
(assert (forall ((Heap2Heap@@1 T@U) (Heap1Heap@@1 T@U) (xs@@7 T@U) (y@@11 T@U) ) (!  (=> (and (and (and (and (= (type Heap2Heap@@1) (MapType0Type RefType)) (= (type Heap1Heap@@1) (MapType0Type RefType))) (= (type xs@@7) (MapType2Type RefType boolType))) (= (type y@@11) RefType)) (and (=  (and (U_2_bool (MapType2Select xs@@7 (|sk_fun01#condqp1| (|fun01#condqp1| Heap2Heap@@1 xs@@7 y@@11) (|fun01#condqp1| Heap1Heap@@1 xs@@7 y@@11)))) (< NoPerm FullPerm))  (and (U_2_bool (MapType2Select xs@@7 (|sk_fun01#condqp1| (|fun01#condqp1| Heap2Heap@@1 xs@@7 y@@11) (|fun01#condqp1| Heap1Heap@@1 xs@@7 y@@11)))) (< NoPerm FullPerm))) (=> (and (U_2_bool (MapType2Select xs@@7 (|sk_fun01#condqp1| (|fun01#condqp1| Heap2Heap@@1 xs@@7 y@@11) (|fun01#condqp1| Heap1Heap@@1 xs@@7 y@@11)))) (< NoPerm FullPerm)) (= (U_2_int (MapType0Select Heap2Heap@@1 (|sk_fun01#condqp1| (|fun01#condqp1| Heap2Heap@@1 xs@@7 y@@11) (|fun01#condqp1| Heap1Heap@@1 xs@@7 y@@11)) f_7)) (U_2_int (MapType0Select Heap1Heap@@1 (|sk_fun01#condqp1| (|fun01#condqp1| Heap2Heap@@1 xs@@7 y@@11) (|fun01#condqp1| Heap1Heap@@1 xs@@7 y@@11)) f_7)))))) (= (|fun01#condqp1| Heap2Heap@@1 xs@@7 y@@11) (|fun01#condqp1| Heap1Heap@@1 xs@@7 y@@11)))
 :qid |stdinbpl.822:15|
 :skolemid |123|
 :pattern ( (|fun01#condqp1| Heap2Heap@@1 xs@@7 y@@11) (|fun01#condqp1| Heap1Heap@@1 xs@@7 y@@11) (succHeapTrans Heap2Heap@@1 Heap1Heap@@1))
)))
(assert (forall ((arg0@@54 T@U) (arg1@@30 T@U) ) (! (= (type (CombineFrames arg0@@54 arg1@@30)) FrameTypeType)
 :qid |funType:CombineFrames|
 :pattern ( (CombineFrames arg0@@54 arg1@@30))
)))
(assert (forall ((Heap@@15 T@U) (Mask@@12 T@U) (xs@@8 T@U) (ys@@3 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@15) (MapType0Type RefType)) (= (type Mask@@12) (MapType1Type RefType realType))) (= (type xs@@8) (SeqType RefType))) (= (type ys@@3) (SeqType RefType))) (state Heap@@15 Mask@@12)) (= (|fun02'| Heap@@15 xs@@8 ys@@3) (|fun02#frame| (CombineFrames (FrameFragment (int_2_U (|fun02#condqp2| Heap@@15 xs@@8 ys@@3))) (FrameFragment (int_2_U (|fun02#condqp3| Heap@@15 xs@@8 ys@@3)))) xs@@8 ys@@3)))
 :qid |stdinbpl.944:15|
 :skolemid |136|
 :pattern ( (state Heap@@15 Mask@@12) (|fun02'| Heap@@15 xs@@8 ys@@3))
)))
(assert (= (type ZeroPMask) (MapType1Type RefType boolType)))
(assert (forall ((o_2@@3 T@U) (f_4@@3 T@U) ) (! (let ((B@@9 (FieldTypeInv1 (type f_4@@3))))
(let ((A@@10 (FieldTypeInv0 (type f_4@@3))))
 (=> (and (= (type o_2@@3) RefType) (= (type f_4@@3) (FieldType A@@10 B@@9))) (not (U_2_bool (MapType1Select ZeroPMask o_2@@3 f_4@@3))))))
 :qid |stdinbpl.112:22|
 :skolemid |14|
 :pattern ( (MapType1Select ZeroPMask o_2@@3 f_4@@3))
)))
(assert (forall ((s@@18 T@U) (x@@20 T@U) (i@@6 Int) ) (! (let ((T@@83 (type x@@20)))
 (=> (= (type s@@18) (SeqType T@@83)) (=> (and (and (<= 0 i@@6) (< i@@6 (|Seq#Length| s@@18))) (= (|Seq#Index| s@@18 i@@6) x@@20)) (|Seq#Contains| s@@18 x@@20))))
 :qid |stdinbpl.441:18|
 :skolemid |48|
 :pattern ( (|Seq#Contains| s@@18 x@@20) (|Seq#Index| s@@18 i@@6))
)))
(assert (forall ((s0@@5 T@U) (s1@@5 T@U) ) (! (let ((T@@84 (SeqTypeInv0 (type s0@@5))))
 (=> (and (= (type s0@@5) (SeqType T@@84)) (= (type s1@@5) (SeqType T@@84))) (or (or (and (= s0@@5 s1@@5) (|Seq#Equal| s0@@5 s1@@5)) (and (and (not (= s0@@5 s1@@5)) (not (|Seq#Equal| s0@@5 s1@@5))) (not (= (|Seq#Length| s0@@5) (|Seq#Length| s1@@5))))) (and (and (and (and (and (and (not (= s0@@5 s1@@5)) (not (|Seq#Equal| s0@@5 s1@@5))) (= (|Seq#Length| s0@@5) (|Seq#Length| s1@@5))) (= (|Seq#SkolemDiff| s0@@5 s1@@5) (|Seq#SkolemDiff| s1@@5 s0@@5))) (<= 0 (|Seq#SkolemDiff| s0@@5 s1@@5))) (< (|Seq#SkolemDiff| s0@@5 s1@@5) (|Seq#Length| s0@@5))) (not (= (|Seq#Index| s0@@5 (|Seq#SkolemDiff| s0@@5 s1@@5)) (|Seq#Index| s1@@5 (|Seq#SkolemDiff| s0@@5 s1@@5))))))))
 :qid |stdinbpl.545:18|
 :skolemid |52|
 :pattern ( (|Seq#Equal| s0@@5 s1@@5))
)))
(assert (forall ((p@@1 T@U) (v_1@@0 T@U) (q T@U) (w@@0 T@U) (r@@5 T@U) (u T@U) ) (! (let ((C@@3 (FieldTypeInv0 (type r@@5))))
(let ((B@@10 (FieldTypeInv0 (type q))))
(let ((A@@11 (FieldTypeInv0 (type p@@1))))
 (=> (and (and (and (and (and (and (= (type p@@1) (FieldType A@@11 FrameTypeType)) (= (type v_1@@0) FrameTypeType)) (= (type q) (FieldType B@@10 FrameTypeType))) (= (type w@@0) FrameTypeType)) (= (type r@@5) (FieldType C@@3 FrameTypeType))) (= (type u) FrameTypeType)) (and (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r@@5 u))) (InsidePredicate p@@1 v_1@@0 r@@5 u)))))
 :qid |stdinbpl.214:25|
 :skolemid |20|
 :pattern ( (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r@@5 u))
)))
(assert (forall ((a@@35 Int) ) (!  (=> (< a@@35 0) (= (|Math#clip| a@@35) 0))
 :qid |stdinbpl.687:15|
 :skolemid |91|
 :pattern ( (|Math#clip| a@@35))
)))
(assert (forall ((s@@19 T@U) ) (! (let ((T@@85 (SeqTypeInv0 (type s@@19))))
 (=> (and (= (type s@@19) (SeqType T@@85)) (= (|Seq#Length| s@@19) 0)) (= s@@19 (|Seq#Empty| T@@85))))
 :qid |stdinbpl.249:18|
 :skolemid |24|
 :pattern ( (|Seq#Length| s@@19))
)))
(assert (forall ((s@@20 T@U) (n@@12 Int) ) (! (let ((T@@86 (SeqTypeInv0 (type s@@20))))
 (=> (and (= (type s@@20) (SeqType T@@86)) (<= n@@12 0)) (= (|Seq#Take| s@@20 n@@12) (|Seq#Empty| T@@86))))
 :qid |stdinbpl.424:18|
 :skolemid |46|
 :pattern ( (|Seq#Take| s@@20 n@@12))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
(assert (forall ((a@@36 T@U) (x@@21 T@U) (o@@14 T@U) ) (! (let ((T@@87 (type x@@21)))
 (=> (and (= (type a@@36) (MultiSetType T@@87)) (= (type o@@14) T@@87)) (= (|MultiSet#Select| (|MultiSet#UnionOne| a@@36 x@@21) o@@14) (ite (= x@@21 o@@14) (+ (|MultiSet#Select| a@@36 o@@14) 1) (|MultiSet#Select| a@@36 o@@14)))))
 :qid |stdinbpl.720:18|
 :skolemid |100|
 :pattern ( (|MultiSet#Select| (|MultiSet#UnionOne| a@@36 x@@21) o@@14))
 :pattern ( (|MultiSet#UnionOne| a@@36 x@@21) (|MultiSet#Select| a@@36 o@@14))
)))
(assert (forall ((a@@37 T@U) (b@@27 T@U) ) (! (let ((T@@88 (MultiSetTypeInv0 (type a@@37))))
 (=> (and (= (type a@@37) (MultiSetType T@@88)) (= (type b@@27) (MultiSetType T@@88))) (= (|MultiSet#Equal| a@@37 b@@27) (forall ((o@@15 T@U) ) (!  (=> (= (type o@@15) T@@88) (= (|MultiSet#Select| a@@37 o@@15) (|MultiSet#Select| b@@27 o@@15)))
 :qid |stdinbpl.766:36|
 :skolemid |113|
 :pattern ( (|MultiSet#Select| a@@37 o@@15))
 :pattern ( (|MultiSet#Select| b@@27 o@@15))
)))))
 :qid |stdinbpl.765:17|
 :skolemid |114|
 :pattern ( (|MultiSet#Equal| a@@37 b@@27))
)))
(assert (forall ((a@@38 T@U) (b@@28 T@U) ) (! (let ((T@@89 (MultiSetTypeInv0 (type a@@38))))
 (=> (and (= (type a@@38) (MultiSetType T@@89)) (= (type b@@28) (MultiSetType T@@89))) (= (|MultiSet#Subset| a@@38 b@@28) (forall ((o@@16 T@U) ) (!  (=> (= (type o@@16) T@@89) (<= (|MultiSet#Select| a@@38 o@@16) (|MultiSet#Select| b@@28 o@@16)))
 :qid |stdinbpl.762:37|
 :skolemid |111|
 :pattern ( (|MultiSet#Select| a@@38 o@@16))
 :pattern ( (|MultiSet#Select| b@@28 o@@16))
)))))
 :qid |stdinbpl.761:17|
 :skolemid |112|
 :pattern ( (|MultiSet#Subset| a@@38 b@@28))
)))
(assert (forall ((a@@39 T@U) (b@@29 T@U) (o@@17 T@U) ) (! (let ((T@@90 (type o@@17)))
 (=> (and (= (type a@@39) (MapType2Type T@@90 boolType)) (= (type b@@29) (MapType2Type T@@90 boolType))) (= (U_2_bool (MapType2Select (|Set#Union| a@@39 b@@29) o@@17))  (or (U_2_bool (MapType2Select a@@39 o@@17)) (U_2_bool (MapType2Select b@@29 o@@17))))))
 :qid |stdinbpl.620:18|
 :skolemid |70|
 :pattern ( (MapType2Select (|Set#Union| a@@39 b@@29) o@@17))
)))
(assert (forall ((Heap@@16 T@U) (xs@@9 T@U) (ys@@4 T@U) ) (!  (=> (and (and (= (type Heap@@16) (MapType0Type RefType)) (= (type xs@@9) (SeqType RefType))) (= (type ys@@4) (SeqType RefType))) (and (= (fun02 Heap@@16 xs@@9 ys@@4) (|fun02'| Heap@@16 xs@@9 ys@@4)) (dummyFunction (bool_2_U (|fun02#triggerStateless| xs@@9 ys@@4)))))
 :qid |stdinbpl.921:15|
 :skolemid |131|
 :pattern ( (fun02 Heap@@16 xs@@9 ys@@4))
)))
(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun xs@@10 () T@U)
(declare-fun x_5 () T@U)
(declare-fun Heap@@17 () T@U)
(declare-fun y@@12 () T@U)
(declare-fun neverTriggered5 (T@U) Bool)
(declare-fun QPMask@1 () T@U)
(declare-fun QPMask@0 () T@U)
(declare-fun qpRange5 (T@U) Bool)
(declare-fun invRecv5 (T@U) T@U)
(declare-fun x_8 () T@U)
(declare-fun neverTriggered6 (T@U) Bool)
(declare-fun QPMask@2 () T@U)
(declare-fun qpRange6 (T@U) Bool)
(declare-fun invRecv6 (T@U) T@U)
(declare-fun x_11 () T@U)
(declare-fun neverTriggered7 (T@U) Bool)
(declare-fun QPMask@3 () T@U)
(declare-fun qpRange7 (T@U) Bool)
(declare-fun invRecv7 (T@U) T@U)
(declare-fun x_2 () T@U)
(declare-fun qpRange4 (T@U) Bool)
(declare-fun invRecv4 (T@U) T@U)
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (and (and (= (type xs@@10) (MapType2Type RefType boolType)) (= (type x_2) RefType)) (= (type QPMask@0) (MapType1Type RefType realType))) (= (type Heap@@17) (MapType0Type RefType))) (= (type y@@12) RefType)) (= (type x_11) RefType)) (= (type QPMask@3) (MapType1Type RefType realType))) (forall ((arg0@@55 T@U) ) (! (= (type (invRecv7 arg0@@55)) RefType)
 :qid |funType:invRecv7|
 :pattern ( (invRecv7 arg0@@55))
))) (= (type x_8) RefType)) (= (type QPMask@2) (MapType1Type RefType realType))) (forall ((arg0@@56 T@U) ) (! (= (type (invRecv6 arg0@@56)) RefType)
 :qid |funType:invRecv6|
 :pattern ( (invRecv6 arg0@@56))
))) (= (type x_5) RefType)) (= (type QPMask@1) (MapType1Type RefType realType))) (forall ((arg0@@57 T@U) ) (! (= (type (invRecv5 arg0@@57)) RefType)
 :qid |funType:invRecv5|
 :pattern ( (invRecv5 arg0@@57))
))) (forall ((arg0@@58 T@U) ) (! (= (type (invRecv4 arg0@@58)) RefType)
 :qid |funType:invRecv4|
 :pattern ( (invRecv4 arg0@@58))
))))
(set-info :boogie-vc-id test01)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 45) (let ((anon10_correct true))
(let ((anon30_Else_correct  (=> (and (not (U_2_bool (MapType2Select xs@@10 x_5))) (= (ControlFlow 0 37) 34)) anon10_correct)))
(let ((anon30_Then_correct  (=> (U_2_bool (MapType2Select xs@@10 x_5)) (and (=> (= (ControlFlow 0 35) (- 0 36)) (> (U_2_int (MapType0Select Heap@@17 x_5 f_7)) 0)) (=> (> (U_2_int (MapType0Select Heap@@17 x_5 f_7)) 0) (=> (= (ControlFlow 0 35) 34) anon10_correct))))))
(let ((anon29_Else_correct  (=> (and (forall ((x_6_1_1 T@U) ) (!  (=> (and (= (type x_6_1_1) RefType) (U_2_bool (MapType2Select xs@@10 x_6_1_1))) (> (U_2_int (MapType0Select Heap@@17 x_6_1_1 f_7)) 0))
 :qid |stdinbpl.1312:24|
 :skolemid |166|
 :pattern ( (MapType2Select xs@@10 x_6_1_1))
)) (= (ControlFlow 0 33) (- 0 32))) (U_2_bool (MapType2Select xs@@10 y@@12)))))
(let ((anon28_Then_correct  (and (=> (= (ControlFlow 0 38) (- 0 40)) (forall ((x_4 T@U) (x_4_1 T@U) ) (!  (=> (and (= (type x_4) RefType) (= (type x_4_1) RefType)) (=> (and (and (and (and (not (= x_4 x_4_1)) (U_2_bool (MapType2Select xs@@10 x_4))) (U_2_bool (MapType2Select xs@@10 x_4_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= x_4 x_4_1))))
 :qid |stdinbpl.1271:21|
 :skolemid |160|
 :pattern ( (neverTriggered5 x_4) (neverTriggered5 x_4_1))
))) (=> (forall ((x_4@@0 T@U) (x_4_1@@0 T@U) ) (!  (=> (and (= (type x_4@@0) RefType) (= (type x_4_1@@0) RefType)) (=> (and (and (and (and (not (= x_4@@0 x_4_1@@0)) (U_2_bool (MapType2Select xs@@10 x_4@@0))) (U_2_bool (MapType2Select xs@@10 x_4_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= x_4@@0 x_4_1@@0))))
 :qid |stdinbpl.1271:21|
 :skolemid |160|
 :pattern ( (neverTriggered5 x_4@@0) (neverTriggered5 x_4_1@@0))
)) (and (=> (= (ControlFlow 0 38) (- 0 39)) (forall ((x_4@@1 T@U) ) (!  (=> (and (= (type x_4@@1) RefType) (U_2_bool (MapType2Select xs@@10 x_4@@1))) (>= (U_2_real (MapType1Select QPMask@0 x_4@@1 f_7)) FullPerm))
 :qid |stdinbpl.1278:21|
 :skolemid |161|
 :pattern ( (MapType0Select Heap@@17 x_4@@1 f_7))
 :pattern ( (MapType1Select QPMask@1 x_4@@1 f_7))
 :pattern ( (MapType2Select xs@@10 x_4@@1))
))) (=> (forall ((x_4@@2 T@U) ) (!  (=> (and (= (type x_4@@2) RefType) (U_2_bool (MapType2Select xs@@10 x_4@@2))) (>= (U_2_real (MapType1Select QPMask@0 x_4@@2 f_7)) FullPerm))
 :qid |stdinbpl.1278:21|
 :skolemid |161|
 :pattern ( (MapType0Select Heap@@17 x_4@@2 f_7))
 :pattern ( (MapType1Select QPMask@1 x_4@@2 f_7))
 :pattern ( (MapType2Select xs@@10 x_4@@2))
)) (=> (and (and (forall ((x_4@@3 T@U) ) (!  (=> (= (type x_4@@3) RefType) (=> (and (U_2_bool (MapType2Select xs@@10 x_4@@3)) (< NoPerm FullPerm)) (and (qpRange5 x_4@@3) (= (invRecv5 x_4@@3) x_4@@3))))
 :qid |stdinbpl.1284:26|
 :skolemid |162|
 :pattern ( (MapType0Select Heap@@17 x_4@@3 f_7))
 :pattern ( (MapType1Select QPMask@1 x_4@@3 f_7))
 :pattern ( (MapType2Select xs@@10 x_4@@3))
)) (forall ((o_3 T@U) ) (!  (=> (= (type o_3) RefType) (=> (and (U_2_bool (MapType2Select xs@@10 (invRecv5 o_3))) (and (< NoPerm FullPerm) (qpRange5 o_3))) (= (invRecv5 o_3) o_3)))
 :qid |stdinbpl.1288:26|
 :skolemid |163|
 :pattern ( (invRecv5 o_3))
))) (and (forall ((o_3@@0 T@U) ) (!  (=> (= (type o_3@@0) RefType) (and (=> (and (U_2_bool (MapType2Select xs@@10 (invRecv5 o_3@@0))) (and (< NoPerm FullPerm) (qpRange5 o_3@@0))) (and (= (invRecv5 o_3@@0) o_3@@0) (= (U_2_real (MapType1Select QPMask@1 o_3@@0 f_7)) (- (U_2_real (MapType1Select QPMask@0 o_3@@0 f_7)) FullPerm)))) (=> (not (and (U_2_bool (MapType2Select xs@@10 (invRecv5 o_3@@0))) (and (< NoPerm FullPerm) (qpRange5 o_3@@0)))) (= (U_2_real (MapType1Select QPMask@1 o_3@@0 f_7)) (U_2_real (MapType1Select QPMask@0 o_3@@0 f_7))))))
 :qid |stdinbpl.1294:26|
 :skolemid |164|
 :pattern ( (MapType1Select QPMask@1 o_3@@0 f_7))
)) (forall ((o_3@@1 T@U) (f_5 T@U) ) (! (let ((B@@11 (FieldTypeInv1 (type f_5))))
(let ((A@@12 (FieldTypeInv0 (type f_5))))
 (=> (and (and (= (type o_3@@1) RefType) (= (type f_5) (FieldType A@@12 B@@11))) (not (= f_5 f_7))) (= (U_2_real (MapType1Select QPMask@0 o_3@@1 f_5)) (U_2_real (MapType1Select QPMask@1 o_3@@1 f_5))))))
 :qid |stdinbpl.1300:33|
 :skolemid |165|
 :pattern ( (MapType1Select QPMask@1 o_3@@1 f_5))
)))) (and (and (=> (= (ControlFlow 0 38) 33) anon29_Else_correct) (=> (= (ControlFlow 0 38) 35) anon30_Then_correct)) (=> (= (ControlFlow 0 38) 37) anon30_Else_correct)))))))))
(let ((anon16_correct true))
(let ((anon33_Else_correct  (=> (and (not (U_2_bool (MapType2Select xs@@10 x_8))) (= (ControlFlow 0 25) 22)) anon16_correct)))
(let ((anon33_Then_correct  (=> (U_2_bool (MapType2Select xs@@10 x_8)) (and (=> (= (ControlFlow 0 23) (- 0 24)) (> (U_2_int (MapType0Select Heap@@17 x_8 f_7)) 0)) (=> (> (U_2_int (MapType0Select Heap@@17 x_8 f_7)) 0) (=> (= (ControlFlow 0 23) 22) anon16_correct))))))
(let ((anon32_Else_correct  (=> (and (forall ((x_9_1 T@U) ) (!  (=> (and (= (type x_9_1) RefType) (U_2_bool (MapType2Select xs@@10 x_9_1))) (> (U_2_int (MapType0Select Heap@@17 x_9_1 f_7)) 0))
 :qid |stdinbpl.1388:24|
 :skolemid |173|
 :pattern ( (MapType2Select xs@@10 x_9_1))
)) (= (ControlFlow 0 21) (- 0 20))) (U_2_bool (MapType2Select xs@@10 y@@12)))))
(let ((anon31_Then_correct  (and (=> (= (ControlFlow 0 26) (- 0 28)) (forall ((x_7 T@U) (x_7_1 T@U) ) (!  (=> (and (= (type x_7) RefType) (= (type x_7_1) RefType)) (=> (and (and (and (and (not (= x_7 x_7_1)) (U_2_bool (MapType2Select xs@@10 x_7))) (U_2_bool (MapType2Select xs@@10 x_7_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= x_7 x_7_1))))
 :qid |stdinbpl.1347:21|
 :skolemid |167|
 :pattern ( (neverTriggered6 x_7) (neverTriggered6 x_7_1))
))) (=> (forall ((x_7@@0 T@U) (x_7_1@@0 T@U) ) (!  (=> (and (= (type x_7@@0) RefType) (= (type x_7_1@@0) RefType)) (=> (and (and (and (and (not (= x_7@@0 x_7_1@@0)) (U_2_bool (MapType2Select xs@@10 x_7@@0))) (U_2_bool (MapType2Select xs@@10 x_7_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= x_7@@0 x_7_1@@0))))
 :qid |stdinbpl.1347:21|
 :skolemid |167|
 :pattern ( (neverTriggered6 x_7@@0) (neverTriggered6 x_7_1@@0))
)) (and (=> (= (ControlFlow 0 26) (- 0 27)) (forall ((x_7@@1 T@U) ) (!  (=> (and (= (type x_7@@1) RefType) (U_2_bool (MapType2Select xs@@10 x_7@@1))) (>= (U_2_real (MapType1Select QPMask@0 x_7@@1 f_7)) FullPerm))
 :qid |stdinbpl.1354:21|
 :skolemid |168|
 :pattern ( (MapType0Select Heap@@17 x_7@@1 f_7))
 :pattern ( (MapType1Select QPMask@2 x_7@@1 f_7))
 :pattern ( (MapType2Select xs@@10 x_7@@1))
))) (=> (forall ((x_7@@2 T@U) ) (!  (=> (and (= (type x_7@@2) RefType) (U_2_bool (MapType2Select xs@@10 x_7@@2))) (>= (U_2_real (MapType1Select QPMask@0 x_7@@2 f_7)) FullPerm))
 :qid |stdinbpl.1354:21|
 :skolemid |168|
 :pattern ( (MapType0Select Heap@@17 x_7@@2 f_7))
 :pattern ( (MapType1Select QPMask@2 x_7@@2 f_7))
 :pattern ( (MapType2Select xs@@10 x_7@@2))
)) (=> (and (and (forall ((x_7@@3 T@U) ) (!  (=> (= (type x_7@@3) RefType) (=> (and (U_2_bool (MapType2Select xs@@10 x_7@@3)) (< NoPerm FullPerm)) (and (qpRange6 x_7@@3) (= (invRecv6 x_7@@3) x_7@@3))))
 :qid |stdinbpl.1360:26|
 :skolemid |169|
 :pattern ( (MapType0Select Heap@@17 x_7@@3 f_7))
 :pattern ( (MapType1Select QPMask@2 x_7@@3 f_7))
 :pattern ( (MapType2Select xs@@10 x_7@@3))
)) (forall ((o_3@@2 T@U) ) (!  (=> (= (type o_3@@2) RefType) (=> (and (U_2_bool (MapType2Select xs@@10 (invRecv6 o_3@@2))) (and (< NoPerm FullPerm) (qpRange6 o_3@@2))) (= (invRecv6 o_3@@2) o_3@@2)))
 :qid |stdinbpl.1364:26|
 :skolemid |170|
 :pattern ( (invRecv6 o_3@@2))
))) (and (forall ((o_3@@3 T@U) ) (!  (=> (= (type o_3@@3) RefType) (and (=> (and (U_2_bool (MapType2Select xs@@10 (invRecv6 o_3@@3))) (and (< NoPerm FullPerm) (qpRange6 o_3@@3))) (and (= (invRecv6 o_3@@3) o_3@@3) (= (U_2_real (MapType1Select QPMask@2 o_3@@3 f_7)) (- (U_2_real (MapType1Select QPMask@0 o_3@@3 f_7)) FullPerm)))) (=> (not (and (U_2_bool (MapType2Select xs@@10 (invRecv6 o_3@@3))) (and (< NoPerm FullPerm) (qpRange6 o_3@@3)))) (= (U_2_real (MapType1Select QPMask@2 o_3@@3 f_7)) (U_2_real (MapType1Select QPMask@0 o_3@@3 f_7))))))
 :qid |stdinbpl.1370:26|
 :skolemid |171|
 :pattern ( (MapType1Select QPMask@2 o_3@@3 f_7))
)) (forall ((o_3@@4 T@U) (f_5@@0 T@U) ) (! (let ((B@@12 (FieldTypeInv1 (type f_5@@0))))
(let ((A@@13 (FieldTypeInv0 (type f_5@@0))))
 (=> (and (and (= (type o_3@@4) RefType) (= (type f_5@@0) (FieldType A@@13 B@@12))) (not (= f_5@@0 f_7))) (= (U_2_real (MapType1Select QPMask@0 o_3@@4 f_5@@0)) (U_2_real (MapType1Select QPMask@2 o_3@@4 f_5@@0))))))
 :qid |stdinbpl.1376:33|
 :skolemid |172|
 :pattern ( (MapType1Select QPMask@2 o_3@@4 f_5@@0))
)))) (and (and (=> (= (ControlFlow 0 26) 21) anon32_Else_correct) (=> (= (ControlFlow 0 26) 23) anon33_Then_correct)) (=> (= (ControlFlow 0 26) 25) anon33_Else_correct)))))))))
(let ((anon22_correct true))
(let ((anon36_Else_correct  (=> (and (not (U_2_bool (MapType2Select xs@@10 x_11))) (= (ControlFlow 0 14) 11)) anon22_correct)))
(let ((anon36_Then_correct  (=> (U_2_bool (MapType2Select xs@@10 x_11)) (and (=> (= (ControlFlow 0 12) (- 0 13)) (> (U_2_int (MapType0Select Heap@@17 x_11 f_7)) 0)) (=> (> (U_2_int (MapType0Select Heap@@17 x_11 f_7)) 0) (=> (= (ControlFlow 0 12) 11) anon22_correct))))))
(let ((anon35_Else_correct  (=> (and (forall ((x_12_1 T@U) ) (!  (=> (and (= (type x_12_1) RefType) (U_2_bool (MapType2Select xs@@10 x_12_1))) (> (U_2_int (MapType0Select Heap@@17 x_12_1 f_7)) 0))
 :qid |stdinbpl.1455:24|
 :skolemid |180|
 :pattern ( (MapType2Select xs@@10 x_12_1))
)) (= (ControlFlow 0 10) (- 0 9))) (U_2_bool (MapType2Select xs@@10 y@@12)))))
(let ((anon34_Then_correct  (and (=> (= (ControlFlow 0 15) (- 0 17)) (forall ((x_10 T@U) (x_10_1 T@U) ) (!  (=> (and (= (type x_10) RefType) (= (type x_10_1) RefType)) (=> (and (and (and (and (not (= x_10 x_10_1)) (U_2_bool (MapType2Select xs@@10 x_10))) (U_2_bool (MapType2Select xs@@10 x_10_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= x_10 x_10_1))))
 :qid |stdinbpl.1414:21|
 :skolemid |174|
 :pattern ( (neverTriggered7 x_10) (neverTriggered7 x_10_1))
))) (=> (forall ((x_10@@0 T@U) (x_10_1@@0 T@U) ) (!  (=> (and (= (type x_10@@0) RefType) (= (type x_10_1@@0) RefType)) (=> (and (and (and (and (not (= x_10@@0 x_10_1@@0)) (U_2_bool (MapType2Select xs@@10 x_10@@0))) (U_2_bool (MapType2Select xs@@10 x_10_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= x_10@@0 x_10_1@@0))))
 :qid |stdinbpl.1414:21|
 :skolemid |174|
 :pattern ( (neverTriggered7 x_10@@0) (neverTriggered7 x_10_1@@0))
)) (and (=> (= (ControlFlow 0 15) (- 0 16)) (forall ((x_10@@1 T@U) ) (!  (=> (and (= (type x_10@@1) RefType) (U_2_bool (MapType2Select xs@@10 x_10@@1))) (>= (U_2_real (MapType1Select QPMask@0 x_10@@1 f_7)) FullPerm))
 :qid |stdinbpl.1421:21|
 :skolemid |175|
 :pattern ( (MapType0Select Heap@@17 x_10@@1 f_7))
 :pattern ( (MapType1Select QPMask@3 x_10@@1 f_7))
 :pattern ( (MapType2Select xs@@10 x_10@@1))
))) (=> (forall ((x_10@@2 T@U) ) (!  (=> (and (= (type x_10@@2) RefType) (U_2_bool (MapType2Select xs@@10 x_10@@2))) (>= (U_2_real (MapType1Select QPMask@0 x_10@@2 f_7)) FullPerm))
 :qid |stdinbpl.1421:21|
 :skolemid |175|
 :pattern ( (MapType0Select Heap@@17 x_10@@2 f_7))
 :pattern ( (MapType1Select QPMask@3 x_10@@2 f_7))
 :pattern ( (MapType2Select xs@@10 x_10@@2))
)) (=> (and (and (forall ((x_10@@3 T@U) ) (!  (=> (= (type x_10@@3) RefType) (=> (and (U_2_bool (MapType2Select xs@@10 x_10@@3)) (< NoPerm FullPerm)) (and (qpRange7 x_10@@3) (= (invRecv7 x_10@@3) x_10@@3))))
 :qid |stdinbpl.1427:26|
 :skolemid |176|
 :pattern ( (MapType0Select Heap@@17 x_10@@3 f_7))
 :pattern ( (MapType1Select QPMask@3 x_10@@3 f_7))
 :pattern ( (MapType2Select xs@@10 x_10@@3))
)) (forall ((o_3@@5 T@U) ) (!  (=> (= (type o_3@@5) RefType) (=> (and (U_2_bool (MapType2Select xs@@10 (invRecv7 o_3@@5))) (and (< NoPerm FullPerm) (qpRange7 o_3@@5))) (= (invRecv7 o_3@@5) o_3@@5)))
 :qid |stdinbpl.1431:26|
 :skolemid |177|
 :pattern ( (invRecv7 o_3@@5))
))) (and (forall ((o_3@@6 T@U) ) (!  (=> (= (type o_3@@6) RefType) (and (=> (and (U_2_bool (MapType2Select xs@@10 (invRecv7 o_3@@6))) (and (< NoPerm FullPerm) (qpRange7 o_3@@6))) (and (= (invRecv7 o_3@@6) o_3@@6) (= (U_2_real (MapType1Select QPMask@3 o_3@@6 f_7)) (- (U_2_real (MapType1Select QPMask@0 o_3@@6 f_7)) FullPerm)))) (=> (not (and (U_2_bool (MapType2Select xs@@10 (invRecv7 o_3@@6))) (and (< NoPerm FullPerm) (qpRange7 o_3@@6)))) (= (U_2_real (MapType1Select QPMask@3 o_3@@6 f_7)) (U_2_real (MapType1Select QPMask@0 o_3@@6 f_7))))))
 :qid |stdinbpl.1437:26|
 :skolemid |178|
 :pattern ( (MapType1Select QPMask@3 o_3@@6 f_7))
)) (forall ((o_3@@7 T@U) (f_5@@1 T@U) ) (! (let ((B@@13 (FieldTypeInv1 (type f_5@@1))))
(let ((A@@14 (FieldTypeInv0 (type f_5@@1))))
 (=> (and (and (= (type o_3@@7) RefType) (= (type f_5@@1) (FieldType A@@14 B@@13))) (not (= f_5@@1 f_7))) (= (U_2_real (MapType1Select QPMask@0 o_3@@7 f_5@@1)) (U_2_real (MapType1Select QPMask@3 o_3@@7 f_5@@1))))))
 :qid |stdinbpl.1443:33|
 :skolemid |179|
 :pattern ( (MapType1Select QPMask@3 o_3@@7 f_5@@1))
)))) (and (and (=> (= (ControlFlow 0 15) 10) anon35_Else_correct) (=> (= (ControlFlow 0 15) 12) anon36_Then_correct)) (=> (= (ControlFlow 0 15) 14) anon36_Else_correct)))))))))
(let ((anon34_Else_correct  (and (=> (= (ControlFlow 0 7) (- 0 8)) (= (fun01 Heap@@17 xs@@10 y@@12) (fun01 Heap@@17 xs@@10 y@@12))) (=> (= (fun01 Heap@@17 xs@@10 y@@12) (fun01 Heap@@17 xs@@10 y@@12)) (=> (and (state Heap@@17 QPMask@0) (= (ControlFlow 0 7) (- 0 6))) false)))))
(let ((anon31_Else_correct  (and (=> (= (ControlFlow 0 18) (- 0 19)) true) (and (=> (= (ControlFlow 0 18) 15) anon34_Then_correct) (=> (= (ControlFlow 0 18) 7) anon34_Else_correct)))))
(let ((anon28_Else_correct  (and (=> (= (ControlFlow 0 29) (- 0 31)) (HasDirectPerm QPMask@0 y@@12 f_7)) (=> (HasDirectPerm QPMask@0 y@@12 f_7) (and (=> (= (ControlFlow 0 29) (- 0 30)) (= (fun01 Heap@@17 xs@@10 y@@12) (U_2_int (MapType0Select Heap@@17 y@@12 f_7)))) (=> (= (fun01 Heap@@17 xs@@10 y@@12) (U_2_int (MapType0Select Heap@@17 y@@12 f_7))) (=> (state Heap@@17 QPMask@0) (and (=> (= (ControlFlow 0 29) 26) anon31_Then_correct) (=> (= (ControlFlow 0 29) 18) anon31_Else_correct)))))))))
(let ((anon26_Else_correct  (=> (forall ((x_3 T@U) ) (!  (=> (and (= (type x_3) RefType) (U_2_bool (MapType2Select xs@@10 x_3))) (> (U_2_int (MapType0Select Heap@@17 x_3 f_7)) 0))
 :qid |stdinbpl.1236:20|
 :skolemid |159|
 :pattern ( (MapType2Select xs@@10 x_3))
)) (=> (and (state Heap@@17 QPMask@0) (state Heap@@17 QPMask@0)) (=> (and (and (U_2_bool (MapType2Select xs@@10 y@@12)) (state Heap@@17 QPMask@0)) (and (state Heap@@17 QPMask@0) (state Heap@@17 QPMask@0))) (and (=> (= (ControlFlow 0 41) 38) anon28_Then_correct) (=> (= (ControlFlow 0 41) 29) anon28_Else_correct)))))))
(let ((anon5_correct true))
(let ((anon27_Else_correct  (=> (and (not (U_2_bool (MapType2Select xs@@10 x_2))) (= (ControlFlow 0 5) 2)) anon5_correct)))
(let ((anon27_Then_correct  (=> (U_2_bool (MapType2Select xs@@10 x_2)) (and (=> (= (ControlFlow 0 3) (- 0 4)) (HasDirectPerm QPMask@0 x_2 f_7)) (=> (HasDirectPerm QPMask@0 x_2 f_7) (=> (= (ControlFlow 0 3) 2) anon5_correct))))))
(let ((anon25_Else_correct  (and (=> (= (ControlFlow 0 42) (- 0 43)) (forall ((x_1@@0 T@U) (x_1_1 T@U) ) (!  (=> (and (= (type x_1@@0) RefType) (= (type x_1_1) RefType)) (=> (and (and (and (and (not (= x_1@@0 x_1_1)) (U_2_bool (MapType2Select xs@@10 x_1@@0))) (U_2_bool (MapType2Select xs@@10 x_1_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= x_1@@0 x_1_1))))
 :qid |stdinbpl.1191:15|
 :skolemid |153|
 :no-pattern (type x_1@@0)
 :no-pattern (type x_1_1)
 :no-pattern (U_2_int x_1@@0)
 :no-pattern (U_2_bool x_1@@0)
 :no-pattern (U_2_int x_1_1)
 :no-pattern (U_2_bool x_1_1)
))) (=> (forall ((x_1@@1 T@U) (x_1_1@@0 T@U) ) (!  (=> (and (= (type x_1@@1) RefType) (= (type x_1_1@@0) RefType)) (=> (and (and (and (and (not (= x_1@@1 x_1_1@@0)) (U_2_bool (MapType2Select xs@@10 x_1@@1))) (U_2_bool (MapType2Select xs@@10 x_1_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= x_1@@1 x_1_1@@0))))
 :qid |stdinbpl.1191:15|
 :skolemid |153|
 :no-pattern (type x_1@@1)
 :no-pattern (type x_1_1@@0)
 :no-pattern (U_2_int x_1@@1)
 :no-pattern (U_2_bool x_1@@1)
 :no-pattern (U_2_int x_1_1@@0)
 :no-pattern (U_2_bool x_1_1@@0)
)) (=> (and (and (and (forall ((x_1@@2 T@U) ) (!  (=> (= (type x_1@@2) RefType) (=> (and (U_2_bool (MapType2Select xs@@10 x_1@@2)) (< NoPerm FullPerm)) (and (qpRange4 x_1@@2) (= (invRecv4 x_1@@2) x_1@@2))))
 :qid |stdinbpl.1197:22|
 :skolemid |154|
 :pattern ( (MapType0Select Heap@@17 x_1@@2 f_7))
 :pattern ( (MapType1Select QPMask@0 x_1@@2 f_7))
 :pattern ( (MapType2Select xs@@10 x_1@@2))
)) (forall ((o_3@@8 T@U) ) (!  (=> (= (type o_3@@8) RefType) (=> (and (and (U_2_bool (MapType2Select xs@@10 (invRecv4 o_3@@8))) (< NoPerm FullPerm)) (qpRange4 o_3@@8)) (= (invRecv4 o_3@@8) o_3@@8)))
 :qid |stdinbpl.1201:22|
 :skolemid |155|
 :pattern ( (invRecv4 o_3@@8))
))) (and (forall ((x_1@@3 T@U) ) (!  (=> (and (= (type x_1@@3) RefType) (U_2_bool (MapType2Select xs@@10 x_1@@3))) (not (= x_1@@3 null)))
 :qid |stdinbpl.1207:22|
 :skolemid |156|
 :pattern ( (MapType0Select Heap@@17 x_1@@3 f_7))
 :pattern ( (MapType1Select QPMask@0 x_1@@3 f_7))
 :pattern ( (MapType2Select xs@@10 x_1@@3))
)) (forall ((o_3@@9 T@U) ) (!  (=> (= (type o_3@@9) RefType) (and (=> (and (and (U_2_bool (MapType2Select xs@@10 (invRecv4 o_3@@9))) (< NoPerm FullPerm)) (qpRange4 o_3@@9)) (and (=> (< NoPerm FullPerm) (= (invRecv4 o_3@@9) o_3@@9)) (= (U_2_real (MapType1Select QPMask@0 o_3@@9 f_7)) (+ (U_2_real (MapType1Select ZeroMask o_3@@9 f_7)) FullPerm)))) (=> (not (and (and (U_2_bool (MapType2Select xs@@10 (invRecv4 o_3@@9))) (< NoPerm FullPerm)) (qpRange4 o_3@@9))) (= (U_2_real (MapType1Select QPMask@0 o_3@@9 f_7)) (U_2_real (MapType1Select ZeroMask o_3@@9 f_7))))))
 :qid |stdinbpl.1213:22|
 :skolemid |157|
 :pattern ( (MapType1Select QPMask@0 o_3@@9 f_7))
)))) (and (and (forall ((o_3@@10 T@U) (f_5@@2 T@U) ) (! (let ((B@@14 (FieldTypeInv1 (type f_5@@2))))
(let ((A@@15 (FieldTypeInv0 (type f_5@@2))))
 (=> (and (and (= (type o_3@@10) RefType) (= (type f_5@@2) (FieldType A@@15 B@@14))) (not (= f_5@@2 f_7))) (= (U_2_real (MapType1Select ZeroMask o_3@@10 f_5@@2)) (U_2_real (MapType1Select QPMask@0 o_3@@10 f_5@@2))))))
 :qid |stdinbpl.1217:29|
 :skolemid |158|
 :pattern ( (MapType1Select ZeroMask o_3@@10 f_5@@2))
 :pattern ( (MapType1Select QPMask@0 o_3@@10 f_5@@2))
)) (state Heap@@17 QPMask@0)) (and (state Heap@@17 QPMask@0) (state Heap@@17 QPMask@0)))) (and (and (=> (= (ControlFlow 0 42) 41) anon26_Else_correct) (=> (= (ControlFlow 0 42) 3) anon27_Then_correct)) (=> (= (ControlFlow 0 42) 5) anon27_Else_correct)))))))
(let ((anon25_Then_correct true))
(let ((anon0_correct  (=> (state Heap@@17 ZeroMask) (=> (and (= AssumeFunctionsAbove (- 0 1)) (U_2_bool (MapType0Select Heap@@17 y@@12 $allocated))) (and (=> (= (ControlFlow 0 44) 1) anon25_Then_correct) (=> (= (ControlFlow 0 44) 42) anon25_Else_correct))))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 45) 44) anon0_correct)))
PreconditionGeneratedEntry_correct)))))))))))))))))))))))))))
))
(check-sat)
(get-info :reason-unknown)
(assert (not (= (ControlFlow 0 7) (- 6))))
(check-sat)
(pop 1)
; Invalid
(get-info :rlimit)
