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
(declare-fun toSeq (T@T T@U) T@U)
(declare-fun DAGDomainTypeTypeInv0 (T@T) T@T)
(declare-fun SeqTypeInv0 (T@T) T@T)
(declare-fun SeqType (T@T) T@T)
(declare-fun DAGDomainTypeType (T@T) T@T)
(declare-fun |Seq#Equal| (T@U T@U) Bool)
(declare-fun |Seq#Length| (T@U) Int)
(declare-fun |Seq#Append| (T@U T@U) T@U)
(declare-fun |Seq#Index| (T@U Int) T@U)
(declare-fun |Seq#Drop| (T@U Int) T@U)
(declare-fun |Seq#Empty| (T@T) T@U)
(declare-fun succHeap (T@U T@U) Bool)
(declare-fun MapType0Type (T@T) T@T)
(declare-fun RefType () T@T)
(declare-fun succHeapTrans (T@U T@U) Bool)
(declare-fun MapType0TypeInv0 (T@T) T@T)
(declare-fun FieldType (T@T T@T) T@T)
(declare-fun FieldTypeInv0 (T@T) T@T)
(declare-fun FieldTypeInv1 (T@T) T@T)
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
(declare-fun |Math#min| (Int Int) Int)
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
(declare-fun MapType2TypeInv0 (T@T) T@T)
(declare-fun MapType2Type (T@T T@T) T@T)
(declare-fun MapType2TypeInv1 (T@T) T@T)
(declare-fun MapType2Select (T@U T@U) T@U)
(declare-fun MapType2Store (T@U T@U T@U) T@U)
(declare-fun |Set#Intersection| (T@U T@U) T@U)
(declare-fun |Set#Singleton| (T@U) T@U)
(declare-fun |Seq#Take| (T@U Int) T@U)
(declare-fun Node (T@U T@U) T@U)
(declare-fun get_DAG_successor (T@U) T@U)
(declare-fun |Seq#Contains| (T@U T@U) Bool)
(declare-fun |Seq#Range| (Int Int) T@U)
(declare-fun |Set#Card| (T@U) Int)
(declare-fun |Seq#Skolem| (T@U T@U) Int)
(declare-fun $allocated () T@U)
(declare-fun NormalFieldType () T@T)
(declare-fun |Math#clip| (Int) Int)
(declare-fun |Seq#Singleton| (T@U) T@U)
(declare-fun size (T@U) Int)
(declare-fun dummyHeap () T@U)
(declare-fun ZeroMask () T@U)
(declare-fun |MultiSet#UnionOne| (T@U T@U) T@U)
(declare-fun |MultiSet#Disjoint| (T@U T@U) Bool)
(declare-fun InsidePredicate (T@U T@U T@U T@U) Bool)
(declare-fun |MultiSet#Singleton| (T@U) T@U)
(declare-fun |Set#Equal| (T@U T@U) Bool)
(declare-fun DAG_tag (T@U) Int)
(declare-fun get_DAG_value (T@U) T@U)
(declare-fun sumMask (T@U T@U T@U) Bool)
(declare-fun ConditionalFrame (Real T@U) T@U)
(declare-fun EmptyFrame () T@U)
(declare-fun NoPerm () Real)
(declare-fun |Set#Difference| (T@U T@U) T@U)
(declare-fun |MultiSet#Equal| (T@U T@U) Bool)
(declare-fun |Set#UnionOne| (T@U T@U) T@U)
(declare-fun |Seq#ContainsTrigger| (T@U T@U) Bool)
(declare-fun |MultiSet#Empty| (T@T) T@U)
(declare-fun add (T@U T@U) T@U)
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
(assert  (and (and (and (and (and (and (and (and (forall ((arg0@@11 T@T) ) (! (= (Ctor (SeqType arg0@@11)) 6)
 :qid |ctor:SeqType|
)) (forall ((arg0@@12 T@T) ) (! (= (SeqTypeInv0 (SeqType arg0@@12)) arg0@@12)
 :qid |typeInv:SeqTypeInv0|
 :pattern ( (SeqType arg0@@12))
))) (forall ((arg0@@13 T@T) ) (! (= (Ctor (DAGDomainTypeType arg0@@13)) 7)
 :qid |ctor:DAGDomainTypeType|
))) (forall ((arg0@@14 T@T) ) (! (= (DAGDomainTypeTypeInv0 (DAGDomainTypeType arg0@@14)) arg0@@14)
 :qid |typeInv:DAGDomainTypeTypeInv0|
 :pattern ( (DAGDomainTypeType arg0@@14))
))) (forall ((B T@T) (arg0@@15 T@U) ) (! (= (type (toSeq B arg0@@15)) (SeqType B))
 :qid |funType:toSeq|
 :pattern ( (toSeq B arg0@@15))
))) (forall ((arg0@@16 T@U) (arg1 T@U) ) (! (let ((T (SeqTypeInv0 (type arg0@@16))))
(= (type (|Seq#Append| arg0@@16 arg1)) (SeqType T)))
 :qid |funType:Seq#Append|
 :pattern ( (|Seq#Append| arg0@@16 arg1))
))) (forall ((arg0@@17 T@U) (arg1@@0 Int) ) (! (let ((T@@0 (SeqTypeInv0 (type arg0@@17))))
(= (type (|Seq#Index| arg0@@17 arg1@@0)) T@@0))
 :qid |funType:Seq#Index|
 :pattern ( (|Seq#Index| arg0@@17 arg1@@0))
))) (forall ((arg0@@18 T@U) (arg1@@1 Int) ) (! (let ((T@@1 (SeqTypeInv0 (type arg0@@18))))
(= (type (|Seq#Drop| arg0@@18 arg1@@1)) (SeqType T@@1)))
 :qid |funType:Seq#Drop|
 :pattern ( (|Seq#Drop| arg0@@18 arg1@@1))
))) (forall ((T@@2 T@T) ) (! (= (type (|Seq#Empty| T@@2)) (SeqType T@@2))
 :qid |funType:Seq#Empty|
 :pattern ( (|Seq#Empty| T@@2))
))))
(assert (forall ((dags T@U) ) (! (let ((T@@3 (DAGDomainTypeTypeInv0 (SeqTypeInv0 (type dags)))))
 (=> (= (type dags) (SeqType (DAGDomainTypeType T@@3))) (|Seq#Equal| (toSeq intType dags) (ite (> (|Seq#Length| dags) 0) (|Seq#Append| (toSeq intType (|Seq#Index| dags 0)) (toSeq intType (|Seq#Drop| dags 1))) (|Seq#Empty| intType)))))
 :qid |stdinbpl.817:19|
 :skolemid |123|
 :pattern ( (toSeq intType dags))
)))
(assert (forall ((s T@U) (n Int) ) (! (let ((T@@4 (SeqTypeInv0 (type s))))
 (=> (= (type s) (SeqType T@@4)) (and (=> (<= 0 n) (and (=> (<= n (|Seq#Length| s)) (= (|Seq#Length| (|Seq#Drop| s n)) (- (|Seq#Length| s) n))) (=> (< (|Seq#Length| s) n) (= (|Seq#Length| (|Seq#Drop| s n)) 0)))) (=> (< n 0) (= (|Seq#Length| (|Seq#Drop| s n)) (|Seq#Length| s))))))
 :qid |stdinbpl.271:18|
 :skolemid |38|
 :pattern ( (|Seq#Length| (|Seq#Drop| s n)))
 :pattern ( (|Seq#Length| s) (|Seq#Drop| s n))
)))
(assert  (and (and (and (and (and (and (and (and (and (forall ((arg0@@19 T@T) ) (! (= (Ctor (MapType0Type arg0@@19)) 8)
 :qid |ctor:MapType0Type|
)) (forall ((arg0@@20 T@T) ) (! (= (MapType0TypeInv0 (MapType0Type arg0@@20)) arg0@@20)
 :qid |typeInv:MapType0TypeInv0|
 :pattern ( (MapType0Type arg0@@20))
))) (forall ((arg0@@21 T@T) (arg1@@2 T@T) ) (! (= (Ctor (FieldType arg0@@21 arg1@@2)) 9)
 :qid |ctor:FieldType|
))) (forall ((arg0@@22 T@T) (arg1@@3 T@T) ) (! (= (FieldTypeInv0 (FieldType arg0@@22 arg1@@3)) arg0@@22)
 :qid |typeInv:FieldTypeInv0|
 :pattern ( (FieldType arg0@@22 arg1@@3))
))) (forall ((arg0@@23 T@T) (arg1@@4 T@T) ) (! (= (FieldTypeInv1 (FieldType arg0@@23 arg1@@4)) arg1@@4)
 :qid |typeInv:FieldTypeInv1|
 :pattern ( (FieldType arg0@@23 arg1@@4))
))) (forall ((arg0@@24 T@U) (arg1@@5 T@U) (arg2 T@U) ) (! (let ((B@@0 (FieldTypeInv1 (type arg2))))
(= (type (MapType0Select arg0@@24 arg1@@5 arg2)) B@@0))
 :qid |funType:MapType0Select|
 :pattern ( (MapType0Select arg0@@24 arg1@@5 arg2))
))) (forall ((arg0@@25 T@U) (arg1@@6 T@U) (arg2@@0 T@U) (arg3 T@U) ) (! (let ((aVar0 (type arg1@@6)))
(= (type (MapType0Store arg0@@25 arg1@@6 arg2@@0 arg3)) (MapType0Type aVar0)))
 :qid |funType:MapType0Store|
 :pattern ( (MapType0Store arg0@@25 arg1@@6 arg2@@0 arg3))
))) (forall ((m T@U) (x0 T@U) (x1 T@U) (val T@U) ) (! (let ((B@@1 (FieldTypeInv1 (type x1))))
 (=> (= (type val) B@@1) (= (MapType0Select (MapType0Store m x0 x1 val) x0 x1) val)))
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
(assert  (and (and (and (and (forall ((arg0@@26 T@T) ) (! (= (Ctor (MultiSetType arg0@@26)) 11)
 :qid |ctor:MultiSetType|
)) (forall ((arg0@@27 T@T) ) (! (= (MultiSetTypeInv0 (MultiSetType arg0@@27)) arg0@@27)
 :qid |typeInv:MultiSetTypeInv0|
 :pattern ( (MultiSetType arg0@@27))
))) (forall ((arg0@@28 T@U) (arg1@@7 T@U) ) (! (let ((T@@5 (MultiSetTypeInv0 (type arg0@@28))))
(= (type (|MultiSet#Difference| arg0@@28 arg1@@7)) (MultiSetType T@@5)))
 :qid |funType:MultiSet#Difference|
 :pattern ( (|MultiSet#Difference| arg0@@28 arg1@@7))
))) (forall ((arg0@@29 T@U) (arg1@@8 T@U) ) (! (let ((T@@6 (MultiSetTypeInv0 (type arg0@@29))))
(= (type (|MultiSet#Intersection| arg0@@29 arg1@@8)) (MultiSetType T@@6)))
 :qid |funType:MultiSet#Intersection|
 :pattern ( (|MultiSet#Intersection| arg0@@29 arg1@@8))
))) (forall ((arg0@@30 T@U) (arg1@@9 T@U) ) (! (let ((T@@7 (MultiSetTypeInv0 (type arg0@@30))))
(= (type (|MultiSet#Union| arg0@@30 arg1@@9)) (MultiSetType T@@7)))
 :qid |funType:MultiSet#Union|
 :pattern ( (|MultiSet#Union| arg0@@30 arg1@@9))
))))
(assert (forall ((a T@U) (b T@U) ) (! (let ((T@@8 (MultiSetTypeInv0 (type a))))
 (=> (and (= (type a) (MultiSetType T@@8)) (= (type b) (MultiSetType T@@8))) (and (= (+ (+ (|MultiSet#Card| (|MultiSet#Difference| a b)) (|MultiSet#Card| (|MultiSet#Difference| b a))) (* 2 (|MultiSet#Card| (|MultiSet#Intersection| a b)))) (|MultiSet#Card| (|MultiSet#Union| a b))) (= (|MultiSet#Card| (|MultiSet#Difference| a b)) (- (|MultiSet#Card| a) (|MultiSet#Card| (|MultiSet#Intersection| a b)))))))
 :qid |stdinbpl.703:18|
 :skolemid |110|
 :pattern ( (|MultiSet#Card| (|MultiSet#Difference| a b)))
)))
(assert  (and (and (and (and (and (and (forall ((arg0@@31 T@T) (arg1@@10 T@T) ) (! (= (Ctor (MapType1Type arg0@@31 arg1@@10)) 12)
 :qid |ctor:MapType1Type|
)) (forall ((arg0@@32 T@T) (arg1@@11 T@T) ) (! (= (MapType1TypeInv0 (MapType1Type arg0@@32 arg1@@11)) arg0@@32)
 :qid |typeInv:MapType1TypeInv0|
 :pattern ( (MapType1Type arg0@@32 arg1@@11))
))) (forall ((arg0@@33 T@T) (arg1@@12 T@T) ) (! (= (MapType1TypeInv1 (MapType1Type arg0@@33 arg1@@12)) arg1@@12)
 :qid |typeInv:MapType1TypeInv1|
 :pattern ( (MapType1Type arg0@@33 arg1@@12))
))) (forall ((arg0@@34 T@U) (arg1@@13 T@U) (arg2@@1 T@U) ) (! (let ((aVar1 (MapType1TypeInv1 (type arg0@@34))))
(= (type (MapType1Select arg0@@34 arg1@@13 arg2@@1)) aVar1))
 :qid |funType:MapType1Select|
 :pattern ( (MapType1Select arg0@@34 arg1@@13 arg2@@1))
))) (forall ((arg0@@35 T@U) (arg1@@14 T@U) (arg2@@2 T@U) (arg3@@0 T@U) ) (! (let ((aVar1@@0 (type arg3@@0)))
(let ((aVar0@@0 (type arg1@@14)))
(= (type (MapType1Store arg0@@35 arg1@@14 arg2@@2 arg3@@0)) (MapType1Type aVar0@@0 aVar1@@0))))
 :qid |funType:MapType1Store|
 :pattern ( (MapType1Store arg0@@35 arg1@@14 arg2@@2 arg3@@0))
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
(assert (forall ((a@@0 Int) (b@@0 Int) ) (!  (or (= (|Math#min| a@@0 b@@0) a@@0) (= (|Math#min| a@@0 b@@0) b@@0))
 :qid |stdinbpl.634:15|
 :skolemid |89|
 :pattern ( (|Math#min| a@@0 b@@0))
)))
(assert (forall ((s@@0 T@U) (n@@0 Int) (j Int) ) (! (let ((T@@9 (SeqTypeInv0 (type s@@0))))
 (=> (= (type s@@0) (SeqType T@@9)) (=> (and (and (< 0 n@@0) (<= 0 j)) (< j (- (|Seq#Length| s@@0) n@@0))) (and (= (|Seq#Sub| (|Seq#Add| j n@@0) n@@0) j) (= (|Seq#Index| (|Seq#Drop| s@@0 n@@0) j) (|Seq#Index| s@@0 (|Seq#Add| j n@@0)))))))
 :qid |stdinbpl.292:18|
 :skolemid |39|
 :pattern ( (|Seq#Index| (|Seq#Drop| s@@0 n@@0) j))
)))
(assert  (and (and (= (Ctor FrameTypeType) 13) (= (type null) RefType)) (forall ((arg0@@36 T@U) ) (! (let ((A (FieldTypeInv0 (type arg0@@36))))
(= (type (PredicateMaskField arg0@@36)) (FieldType A (MapType1Type RefType boolType))))
 :qid |funType:PredicateMaskField|
 :pattern ( (PredicateMaskField arg0@@36))
))))
(assert (forall ((Heap@@0 T@U) (ExhaleHeap T@U) (Mask@@0 T@U) (pm_f T@U) ) (! (let ((C (FieldTypeInv0 (type pm_f))))
 (=> (and (and (and (and (and (= (type Heap@@0) (MapType0Type RefType)) (= (type ExhaleHeap) (MapType0Type RefType))) (= (type Mask@@0) (MapType1Type RefType realType))) (= (type pm_f) (FieldType C FrameTypeType))) (IdenticalOnKnownLocations Heap@@0 ExhaleHeap Mask@@0)) (and (HasDirectPerm Mask@@0 null pm_f) (IsPredicateField pm_f))) (= (MapType0Select Heap@@0 null (PredicateMaskField pm_f)) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))))
 :qid |stdinbpl.47:19|
 :skolemid |2|
 :pattern ( (IdenticalOnKnownLocations Heap@@0 ExhaleHeap Mask@@0) (IsPredicateField pm_f) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))
)))
(assert (forall ((arg0@@37 T@U) ) (! (let ((A@@0 (FieldTypeInv0 (type arg0@@37))))
(= (type (WandMaskField arg0@@37)) (FieldType A@@0 (MapType1Type RefType boolType))))
 :qid |funType:WandMaskField|
 :pattern ( (WandMaskField arg0@@37))
)))
(assert (forall ((Heap@@1 T@U) (ExhaleHeap@@0 T@U) (Mask@@1 T@U) (pm_f@@0 T@U) ) (! (let ((C@@0 (FieldTypeInv0 (type pm_f@@0))))
 (=> (and (and (and (and (and (= (type Heap@@1) (MapType0Type RefType)) (= (type ExhaleHeap@@0) (MapType0Type RefType))) (= (type Mask@@1) (MapType1Type RefType realType))) (= (type pm_f@@0) (FieldType C@@0 FrameTypeType))) (IdenticalOnKnownLocations Heap@@1 ExhaleHeap@@0 Mask@@1)) (and (HasDirectPerm Mask@@1 null pm_f@@0) (IsWandField pm_f@@0))) (= (MapType0Select Heap@@1 null (WandMaskField pm_f@@0)) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))))
 :qid |stdinbpl.60:19|
 :skolemid |5|
 :pattern ( (IdenticalOnKnownLocations Heap@@1 ExhaleHeap@@0 Mask@@1) (IsWandField pm_f@@0) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))
)))
(assert (forall ((arg0@@38 T@U) (arg1@@15 Int) (arg2@@3 T@U) ) (! (let ((T@@10 (type arg2@@3)))
(= (type (|Seq#Update| arg0@@38 arg1@@15 arg2@@3)) (SeqType T@@10)))
 :qid |funType:Seq#Update|
 :pattern ( (|Seq#Update| arg0@@38 arg1@@15 arg2@@3))
)))
(assert (forall ((s@@1 T@U) (i Int) (v T@U) (n@@1 Int) ) (! (let ((T@@11 (type v)))
 (=> (= (type s@@1) (SeqType T@@11)) (=> (and (<= 0 n@@1) (< n@@1 (|Seq#Length| s@@1))) (and (=> (= i n@@1) (= (|Seq#Index| (|Seq#Update| s@@1 i v) n@@1) v)) (=> (not (= i n@@1)) (= (|Seq#Index| (|Seq#Update| s@@1 i v) n@@1) (|Seq#Index| s@@1 n@@1)))))))
 :qid |stdinbpl.247:18|
 :skolemid |35|
 :pattern ( (|Seq#Index| (|Seq#Update| s@@1 i v) n@@1))
 :pattern ( (|Seq#Index| s@@1 n@@1) (|Seq#Update| s@@1 i v))
)))
(assert (forall ((a@@1 T@U) (b@@1 T@U) (y@@1 T@U) ) (! (let ((T@@12 (type y@@1)))
 (=> (and (and (= (type a@@1) (MultiSetType T@@12)) (= (type b@@1) (MultiSetType T@@12))) (<= (|MultiSet#Select| a@@1 y@@1) (|MultiSet#Select| b@@1 y@@1))) (= (|MultiSet#Select| (|MultiSet#Difference| a@@1 b@@1) y@@1) 0)))
 :qid |stdinbpl.701:18|
 :skolemid |109|
 :pattern ( (|MultiSet#Difference| a@@1 b@@1) (|MultiSet#Select| b@@1 y@@1) (|MultiSet#Select| a@@1 y@@1))
)))
(assert  (and (and (and (and (and (and (and (forall ((arg0@@39 T@T) (arg1@@16 T@T) ) (! (= (Ctor (MapType2Type arg0@@39 arg1@@16)) 14)
 :qid |ctor:MapType2Type|
)) (forall ((arg0@@40 T@T) (arg1@@17 T@T) ) (! (= (MapType2TypeInv0 (MapType2Type arg0@@40 arg1@@17)) arg0@@40)
 :qid |typeInv:MapType2TypeInv0|
 :pattern ( (MapType2Type arg0@@40 arg1@@17))
))) (forall ((arg0@@41 T@T) (arg1@@18 T@T) ) (! (= (MapType2TypeInv1 (MapType2Type arg0@@41 arg1@@18)) arg1@@18)
 :qid |typeInv:MapType2TypeInv1|
 :pattern ( (MapType2Type arg0@@41 arg1@@18))
))) (forall ((arg0@@42 T@U) (arg1@@19 T@U) ) (! (let ((aVar1@@2 (MapType2TypeInv1 (type arg0@@42))))
(= (type (MapType2Select arg0@@42 arg1@@19)) aVar1@@2))
 :qid |funType:MapType2Select|
 :pattern ( (MapType2Select arg0@@42 arg1@@19))
))) (forall ((arg0@@43 T@U) (arg1@@20 T@U) (arg2@@4 T@U) ) (! (let ((aVar1@@3 (type arg2@@4)))
(let ((aVar0@@1 (type arg1@@20)))
(= (type (MapType2Store arg0@@43 arg1@@20 arg2@@4)) (MapType2Type aVar0@@1 aVar1@@3))))
 :qid |funType:MapType2Store|
 :pattern ( (MapType2Store arg0@@43 arg1@@20 arg2@@4))
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
)))) (forall ((arg0@@44 T@U) (arg1@@21 T@U) ) (! (let ((T@@13 (MapType2TypeInv0 (type arg0@@44))))
(= (type (|Set#Union| arg0@@44 arg1@@21)) (MapType2Type T@@13 boolType)))
 :qid |funType:Set#Union|
 :pattern ( (|Set#Union| arg0@@44 arg1@@21))
))))
(assert (forall ((a@@2 T@U) (b@@2 T@U) ) (! (let ((T@@14 (MapType2TypeInv0 (type a@@2))))
 (=> (and (= (type a@@2) (MapType2Type T@@14 boolType)) (= (type b@@2) (MapType2Type T@@14 boolType))) (= (|Set#Union| (|Set#Union| a@@2 b@@2) b@@2) (|Set#Union| a@@2 b@@2))))
 :qid |stdinbpl.586:18|
 :skolemid |74|
 :pattern ( (|Set#Union| (|Set#Union| a@@2 b@@2) b@@2))
)))
(assert (forall ((arg0@@45 T@U) (arg1@@22 T@U) ) (! (let ((T@@15 (MapType2TypeInv0 (type arg0@@45))))
(= (type (|Set#Intersection| arg0@@45 arg1@@22)) (MapType2Type T@@15 boolType)))
 :qid |funType:Set#Intersection|
 :pattern ( (|Set#Intersection| arg0@@45 arg1@@22))
)))
(assert (forall ((a@@3 T@U) (b@@3 T@U) ) (! (let ((T@@16 (MapType2TypeInv0 (type a@@3))))
 (=> (and (= (type a@@3) (MapType2Type T@@16 boolType)) (= (type b@@3) (MapType2Type T@@16 boolType))) (= (|Set#Intersection| (|Set#Intersection| a@@3 b@@3) b@@3) (|Set#Intersection| a@@3 b@@3))))
 :qid |stdinbpl.590:18|
 :skolemid |76|
 :pattern ( (|Set#Intersection| (|Set#Intersection| a@@3 b@@3) b@@3))
)))
(assert (forall ((a@@4 T@U) (b@@4 T@U) ) (! (let ((T@@17 (MultiSetTypeInv0 (type a@@4))))
 (=> (and (= (type a@@4) (MultiSetType T@@17)) (= (type b@@4) (MultiSetType T@@17))) (= (|MultiSet#Intersection| (|MultiSet#Intersection| a@@4 b@@4) b@@4) (|MultiSet#Intersection| a@@4 b@@4))))
 :qid |stdinbpl.692:18|
 :skolemid |106|
 :pattern ( (|MultiSet#Intersection| (|MultiSet#Intersection| a@@4 b@@4) b@@4))
)))
(assert (forall ((arg0@@46 T@U) ) (! (let ((T@@18 (type arg0@@46)))
(= (type (|Set#Singleton| arg0@@46)) (MapType2Type T@@18 boolType)))
 :qid |funType:Set#Singleton|
 :pattern ( (|Set#Singleton| arg0@@46))
)))
(assert (forall ((r T@U) (o T@U) ) (! (let ((T@@19 (type r)))
 (=> (= (type o) T@@19) (= (U_2_bool (MapType2Select (|Set#Singleton| r) o)) (= r o))))
 :qid |stdinbpl.555:18|
 :skolemid |63|
 :pattern ( (MapType2Select (|Set#Singleton| r) o))
)))
(assert (forall ((arg0@@47 T@U) (arg1@@23 Int) ) (! (let ((T@@20 (SeqTypeInv0 (type arg0@@47))))
(= (type (|Seq#Take| arg0@@47 arg1@@23)) (SeqType T@@20)))
 :qid |funType:Seq#Take|
 :pattern ( (|Seq#Take| arg0@@47 arg1@@23))
)))
(assert (forall ((s@@2 T@U) (n@@2 Int) ) (! (let ((T@@21 (SeqTypeInv0 (type s@@2))))
 (=> (= (type s@@2) (SeqType T@@21)) (and (=> (<= 0 n@@2) (and (=> (<= n@@2 (|Seq#Length| s@@2)) (= (|Seq#Length| (|Seq#Take| s@@2 n@@2)) n@@2)) (=> (< (|Seq#Length| s@@2) n@@2) (= (|Seq#Length| (|Seq#Take| s@@2 n@@2)) (|Seq#Length| s@@2))))) (=> (< n@@2 0) (= (|Seq#Length| (|Seq#Take| s@@2 n@@2)) 0)))))
 :qid |stdinbpl.258:18|
 :skolemid |36|
 :pattern ( (|Seq#Length| (|Seq#Take| s@@2 n@@2)))
 :pattern ( (|Seq#Take| s@@2 n@@2) (|Seq#Length| s@@2))
)))
(assert  (and (forall ((arg0@@48 T@U) (arg1@@24 T@U) ) (! (let ((T@@22 (type arg0@@48)))
(= (type (Node arg0@@48 arg1@@24)) (DAGDomainTypeType T@@22)))
 :qid |funType:Node|
 :pattern ( (Node arg0@@48 arg1@@24))
)) (forall ((arg0@@49 T@U) ) (! (let ((T@@23 (DAGDomainTypeTypeInv0 (type arg0@@49))))
(= (type (get_DAG_successor arg0@@49)) (SeqType (DAGDomainTypeType T@@23))))
 :qid |funType:get_DAG_successor|
 :pattern ( (get_DAG_successor arg0@@49))
))))
(assert (forall ((value_1 T@U) (successor_1 T@U) ) (! (let ((T@@24 (type value_1)))
 (=> (= (type successor_1) (SeqType (DAGDomainTypeType T@@24))) (|Seq#Equal| successor_1 (get_DAG_successor (Node value_1 successor_1)))))
 :qid |stdinbpl.854:19|
 :skolemid |126|
 :pattern ( (Node value_1 successor_1))
)))
(assert (forall ((arg0@@50 Int) (arg1@@25 Int) ) (! (= (type (|Seq#Range| arg0@@50 arg1@@25)) (SeqType intType))
 :qid |funType:Seq#Range|
 :pattern ( (|Seq#Range| arg0@@50 arg1@@25))
)))
(assert (forall ((q@min Int) (q@max Int) (v@@0 T@U) ) (!  (=> (= (type v@@0) intType) (= (|Seq#Contains| (|Seq#Range| q@min q@max) v@@0)  (and (<= q@min (U_2_int v@@0)) (< (U_2_int v@@0) q@max))))
 :qid |stdinbpl.531:15|
 :skolemid |57|
 :pattern ( (|Seq#Contains| (|Seq#Range| q@min q@max) v@@0))
)))
(assert (forall ((a@@5 T@U) (b@@5 T@U) ) (! (let ((T@@25 (MapType2TypeInv0 (type a@@5))))
 (=> (and (= (type a@@5) (MapType2Type T@@25 boolType)) (= (type b@@5) (MapType2Type T@@25 boolType))) (= (+ (|Set#Card| (|Set#Union| a@@5 b@@5)) (|Set#Card| (|Set#Intersection| a@@5 b@@5))) (+ (|Set#Card| a@@5) (|Set#Card| b@@5)))))
 :qid |stdinbpl.594:18|
 :skolemid |78|
 :pattern ( (|Set#Card| (|Set#Union| a@@5 b@@5)))
 :pattern ( (|Set#Card| (|Set#Intersection| a@@5 b@@5)))
)))
(assert (forall ((s@@3 T@U) (x@@8 T@U) ) (! (let ((T@@26 (type x@@8)))
 (=> (and (= (type s@@3) (SeqType T@@26)) (|Seq#Contains| s@@3 x@@8)) (and (and (<= 0 (|Seq#Skolem| s@@3 x@@8)) (< (|Seq#Skolem| s@@3 x@@8) (|Seq#Length| s@@3))) (= (|Seq#Index| s@@3 (|Seq#Skolem| s@@3 x@@8)) x@@8))))
 :qid |stdinbpl.389:18|
 :skolemid |47|
 :pattern ( (|Seq#Contains| s@@3 x@@8))
)))
(assert  (and (= (Ctor NormalFieldType) 15) (= (type $allocated) (FieldType NormalFieldType boolType))))
(assert (forall ((Heap@@2 T@U) (ExhaleHeap@@1 T@U) (Mask@@2 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@2) (MapType0Type RefType)) (= (type ExhaleHeap@@1) (MapType0Type RefType))) (= (type Mask@@2) (MapType1Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@2 ExhaleHeap@@1 Mask@@2)) (U_2_bool (MapType0Select Heap@@2 o_1 $allocated))) (U_2_bool (MapType0Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.73:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@2 ExhaleHeap@@1 Mask@@2) (MapType0Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert (forall ((s@@4 T@U) (n@@3 Int) ) (! (let ((T@@27 (SeqTypeInv0 (type s@@4))))
 (=> (and (= (type s@@4) (SeqType T@@27)) (<= n@@3 0)) (= (|Seq#Drop| s@@4 n@@3) s@@4)))
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
(assert (forall ((a@@7 T@U) (b@@6 T@U) (o@@0 T@U) ) (! (let ((T@@28 (type o@@0)))
 (=> (and (= (type a@@7) (MultiSetType T@@28)) (= (type b@@6) (MultiSetType T@@28))) (= (|MultiSet#Select| (|MultiSet#Intersection| a@@7 b@@6) o@@0) (|Math#min| (|MultiSet#Select| a@@7 o@@0) (|MultiSet#Select| b@@6 o@@0)))))
 :qid |stdinbpl.688:18|
 :skolemid |105|
 :pattern ( (|MultiSet#Select| (|MultiSet#Intersection| a@@7 b@@6) o@@0))
)))
(assert (forall ((arg0@@51 T@U) ) (! (let ((T@@29 (type arg0@@51)))
(= (type (|Seq#Singleton| arg0@@51)) (SeqType T@@29)))
 :qid |funType:Seq#Singleton|
 :pattern ( (|Seq#Singleton| arg0@@51))
)))
(assert (forall ((x@@9 T@U) (y@@2 T@U) ) (! (let ((T@@30 (type x@@9)))
 (=> (= (type y@@2) T@@30) (= (|Seq#Contains| (|Seq#Singleton| x@@9) y@@2) (= x@@9 y@@2))))
 :qid |stdinbpl.514:18|
 :skolemid |54|
 :pattern ( (|Seq#Contains| (|Seq#Singleton| x@@9) y@@2))
)))
(assert (forall ((s@@5 T@U) (n@@4 Int) (j@@2 Int) ) (! (let ((T@@31 (SeqTypeInv0 (type s@@5))))
 (=> (= (type s@@5) (SeqType T@@31)) (=> (and (and (<= 0 j@@2) (< j@@2 n@@4)) (< j@@2 (|Seq#Length| s@@5))) (= (|Seq#Index| (|Seq#Take| s@@5 n@@4) j@@2) (|Seq#Index| s@@5 j@@2)))))
 :qid |stdinbpl.266:18|
 :skolemid |37|
 :pattern ( (|Seq#Index| (|Seq#Take| s@@5 n@@4) j@@2))
 :pattern ( (|Seq#Index| s@@5 j@@2) (|Seq#Take| s@@5 n@@4))
)))
(assert (forall ((Heap@@3 T@U) (ExhaleHeap@@2 T@U) (Mask@@3 T@U) (o_1@@0 T@U) (f_2 T@U) ) (! (let ((B@@2 (FieldTypeInv1 (type f_2))))
(let ((A@@1 (FieldTypeInv0 (type f_2))))
 (=> (and (and (and (and (and (and (= (type Heap@@3) (MapType0Type RefType)) (= (type ExhaleHeap@@2) (MapType0Type RefType))) (= (type Mask@@3) (MapType1Type RefType realType))) (= (type o_1@@0) RefType)) (= (type f_2) (FieldType A@@1 B@@2))) (IdenticalOnKnownLocations Heap@@3 ExhaleHeap@@2 Mask@@3)) (HasDirectPerm Mask@@3 o_1@@0 f_2)) (= (MapType0Select Heap@@3 o_1@@0 f_2) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2)))))
 :qid |stdinbpl.42:22|
 :skolemid |1|
 :pattern ( (IdenticalOnKnownLocations Heap@@3 ExhaleHeap@@2 Mask@@3) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2))
)))
(assert (forall ((T@@32 T@T) ) (! (= (|Seq#Length| (|Seq#Empty| T@@32)) 0)
 :skolemid |23|
)))
(assert (forall ((set T@U) ) (! (let ((T@@33 (MapType2TypeInv0 (type set))))
 (=> (= (type set) (MapType2Type T@@33 boolType)) (= (size set) (|Set#Card| set))))
 :qid |stdinbpl.779:19|
 :skolemid |119|
 :pattern ( (size set))
)))
(assert (forall ((seq T@U) ) (! (let ((T@@34 (SeqTypeInv0 (type seq))))
 (=> (= (type seq) (SeqType T@@34)) (= (size seq) (|Seq#Length| seq))))
 :qid |stdinbpl.804:19|
 :skolemid |122|
 :pattern ( (size seq))
)))
(assert  (and (= (type dummyHeap) (MapType0Type RefType)) (= (type ZeroMask) (MapType1Type RefType realType))))
(assert (state dummyHeap ZeroMask))
(assert (forall ((arg0@@52 T@U) (arg1@@26 T@U) ) (! (let ((T@@35 (type arg1@@26)))
(= (type (|MultiSet#UnionOne| arg0@@52 arg1@@26)) (MultiSetType T@@35)))
 :qid |funType:MultiSet#UnionOne|
 :pattern ( (|MultiSet#UnionOne| arg0@@52 arg1@@26))
)))
(assert (forall ((a@@8 T@U) (x@@10 T@U) ) (! (let ((T@@36 (type x@@10)))
 (=> (= (type a@@8) (MultiSetType T@@36)) (= (|MultiSet#Card| (|MultiSet#UnionOne| a@@8 x@@10)) (+ (|MultiSet#Card| a@@8) 1))))
 :qid |stdinbpl.674:18|
 :skolemid |101|
 :pattern ( (|MultiSet#Card| (|MultiSet#UnionOne| a@@8 x@@10)))
 :pattern ( (|MultiSet#UnionOne| a@@8 x@@10) (|MultiSet#Card| a@@8))
)))
(assert (forall ((a@@9 T@U) (b@@7 T@U) ) (! (let ((T@@37 (MultiSetTypeInv0 (type a@@9))))
 (=> (and (= (type a@@9) (MultiSetType T@@37)) (= (type b@@7) (MultiSetType T@@37))) (= (|MultiSet#Disjoint| a@@9 b@@7) (forall ((o@@1 T@U) ) (!  (=> (= (type o@@1) T@@37) (or (= (|MultiSet#Select| a@@9 o@@1) 0) (= (|MultiSet#Select| b@@7 o@@1) 0)))
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
(assert (forall ((s0 T@U) (s1 T@U) (n@@5 Int) ) (! (let ((T@@38 (SeqTypeInv0 (type s0))))
 (=> (and (= (type s0) (SeqType T@@38)) (= (type s1) (SeqType T@@38))) (=> (and (and (and (not (= s0 (|Seq#Empty| T@@38))) (not (= s1 (|Seq#Empty| T@@38)))) (<= (|Seq#Length| s0) n@@5)) (< n@@5 (|Seq#Length| (|Seq#Append| s0 s1)))) (and (= (|Seq#Add| (|Seq#Sub| n@@5 (|Seq#Length| s0)) (|Seq#Length| s0)) n@@5) (= (|Seq#Index| (|Seq#Append| s0 s1) n@@5) (|Seq#Index| s1 (|Seq#Sub| n@@5 (|Seq#Length| s0))))))))
 :qid |stdinbpl.238:18|
 :skolemid |32|
 :pattern ( (|Seq#Index| (|Seq#Append| s0 s1) n@@5))
)))
(assert (forall ((arg0@@53 T@U) ) (! (let ((T@@39 (type arg0@@53)))
(= (type (|MultiSet#Singleton| arg0@@53)) (MultiSetType T@@39)))
 :qid |funType:MultiSet#Singleton|
 :pattern ( (|MultiSet#Singleton| arg0@@53))
)))
(assert (forall ((r@@0 T@U) ) (!  (and (= (|MultiSet#Card| (|MultiSet#Singleton| r@@0)) 1) (= (|MultiSet#Select| (|MultiSet#Singleton| r@@0) r@@0) 1))
 :qid |stdinbpl.666:18|
 :skolemid |98|
 :pattern ( (|MultiSet#Singleton| r@@0))
)))
(assert (forall ((Heap@@4 T@U) (ExhaleHeap@@3 T@U) (Mask@@4 T@U) ) (!  (=> (and (and (and (= (type Heap@@4) (MapType0Type RefType)) (= (type ExhaleHeap@@3) (MapType0Type RefType))) (= (type Mask@@4) (MapType1Type RefType realType))) (IdenticalOnKnownLocations Heap@@4 ExhaleHeap@@3 Mask@@4)) (succHeap Heap@@4 ExhaleHeap@@3))
 :qid |stdinbpl.83:15|
 :skolemid |10|
 :pattern ( (IdenticalOnKnownLocations Heap@@4 ExhaleHeap@@3 Mask@@4))
)))
(assert (forall ((a@@10 T@U) (b@@8 T@U) ) (! (let ((T@@40 (MapType2TypeInv0 (type a@@10))))
 (=> (and (= (type a@@10) (MapType2Type T@@40 boolType)) (= (type b@@8) (MapType2Type T@@40 boolType))) (= (|Set#Equal| a@@10 b@@8) (forall ((o@@2 T@U) ) (!  (=> (= (type o@@2) T@@40) (= (U_2_bool (MapType2Select a@@10 o@@2)) (U_2_bool (MapType2Select b@@8 o@@2))))
 :qid |stdinbpl.619:31|
 :skolemid |84|
 :pattern ( (MapType2Select a@@10 o@@2))
 :pattern ( (MapType2Select b@@8 o@@2))
)))))
 :qid |stdinbpl.618:17|
 :skolemid |85|
 :pattern ( (|Set#Equal| a@@10 b@@8))
)))
(assert (forall ((arg0@@54 T@U) ) (! (let ((T@@41 (DAGDomainTypeTypeInv0 (type arg0@@54))))
(= (type (get_DAG_value arg0@@54)) T@@41))
 :qid |funType:get_DAG_value|
 :pattern ( (get_DAG_value arg0@@54))
)))
(assert (forall ((t_2 T@U) ) (! (let ((T@@42 (DAGDomainTypeTypeInv0 (type t_2))))
 (=> (= (type t_2) (DAGDomainTypeType T@@42)) (= t_2 (Node (get_DAG_value t_2) (get_DAG_successor t_2)))))
 :qid |stdinbpl.866:19|
 :skolemid |128|
 :pattern ( (DAG_tag t_2))
 :pattern ( (get_DAG_value t_2))
 :pattern ( (get_DAG_successor t_2))
)))
(assert (forall ((ResultMask T@U) (SummandMask1 T@U) (SummandMask2 T@U) (o_2 T@U) (f_4 T@U) ) (! (let ((B@@3 (FieldTypeInv1 (type f_4))))
(let ((A@@3 (FieldTypeInv0 (type f_4))))
 (=> (and (and (and (and (and (= (type ResultMask) (MapType1Type RefType realType)) (= (type SummandMask1) (MapType1Type RefType realType))) (= (type SummandMask2) (MapType1Type RefType realType))) (= (type o_2) RefType)) (= (type f_4) (FieldType A@@3 B@@3))) (sumMask ResultMask SummandMask1 SummandMask2)) (= (U_2_real (MapType1Select ResultMask o_2 f_4)) (+ (U_2_real (MapType1Select SummandMask1 o_2 f_4)) (U_2_real (MapType1Select SummandMask2 o_2 f_4)))))))
 :qid |stdinbpl.138:22|
 :skolemid |18|
 :pattern ( (sumMask ResultMask SummandMask1 SummandMask2) (MapType1Select ResultMask o_2 f_4))
 :pattern ( (sumMask ResultMask SummandMask1 SummandMask2) (MapType1Select SummandMask1 o_2 f_4))
 :pattern ( (sumMask ResultMask SummandMask1 SummandMask2) (MapType1Select SummandMask2 o_2 f_4))
)))
(assert (forall ((a@@11 T@U) (b@@9 T@U) ) (! (let ((T@@43 (MultiSetTypeInv0 (type a@@11))))
 (=> (and (= (type a@@11) (MultiSetType T@@43)) (= (type b@@9) (MultiSetType T@@43))) (= (|MultiSet#Card| (|MultiSet#Union| a@@11 b@@9)) (+ (|MultiSet#Card| a@@11) (|MultiSet#Card| b@@9)))))
 :qid |stdinbpl.684:18|
 :skolemid |104|
 :pattern ( (|MultiSet#Card| (|MultiSet#Union| a@@11 b@@9)))
 :pattern ( (|MultiSet#Card| a@@11) (|MultiSet#Union| a@@11 b@@9))
 :pattern ( (|MultiSet#Card| b@@9) (|MultiSet#Union| a@@11 b@@9))
)))
(assert  (and (forall ((arg0@@55 Real) (arg1@@27 T@U) ) (! (= (type (ConditionalFrame arg0@@55 arg1@@27)) FrameTypeType)
 :qid |funType:ConditionalFrame|
 :pattern ( (ConditionalFrame arg0@@55 arg1@@27))
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
(assert (forall ((Mask@@5 T@U) (o_2@@0 T@U) (f_4@@0 T@U) ) (! (let ((B@@4 (FieldTypeInv1 (type f_4@@0))))
(let ((A@@4 (FieldTypeInv0 (type f_4@@0))))
 (=> (and (and (= (type Mask@@5) (MapType1Type RefType realType)) (= (type o_2@@0) RefType)) (= (type f_4@@0) (FieldType A@@4 B@@4))) (= (HasDirectPerm Mask@@5 o_2@@0 f_4@@0) (> (U_2_real (MapType1Select Mask@@5 o_2@@0 f_4@@0)) NoPerm)))))
 :qid |stdinbpl.133:22|
 :skolemid |17|
 :pattern ( (HasDirectPerm Mask@@5 o_2@@0 f_4@@0))
)))
(assert (forall ((s0@@0 T@U) (s1@@0 T@U) ) (! (let ((T@@44 (SeqTypeInv0 (type s0@@0))))
 (=> (and (and (= (type s0@@0) (SeqType T@@44)) (= (type s1@@0) (SeqType T@@44))) (and (not (= s0@@0 (|Seq#Empty| T@@44))) (not (= s1@@0 (|Seq#Empty| T@@44))))) (= (|Seq#Length| (|Seq#Append| s0@@0 s1@@0)) (+ (|Seq#Length| s0@@0) (|Seq#Length| s1@@0)))))
 :qid |stdinbpl.207:18|
 :skolemid |26|
 :pattern ( (|Seq#Length| (|Seq#Append| s0@@0 s1@@0)))
)))
(assert (forall ((s@@6 T@U) (t T@U) (n@@6 Int) ) (! (let ((T@@45 (SeqTypeInv0 (type s@@6))))
 (=> (and (and (= (type s@@6) (SeqType T@@45)) (= (type t) (SeqType T@@45))) (and (> n@@6 0) (> n@@6 (|Seq#Length| s@@6)))) (and (= (|Seq#Add| (|Seq#Sub| n@@6 (|Seq#Length| s@@6)) (|Seq#Length| s@@6)) n@@6) (= (|Seq#Drop| (|Seq#Append| s@@6 t) n@@6) (|Seq#Drop| t (|Seq#Sub| n@@6 (|Seq#Length| s@@6)))))))
 :qid |stdinbpl.363:18|
 :skolemid |44|
 :pattern ( (|Seq#Drop| (|Seq#Append| s@@6 t) n@@6))
)))
(assert (forall ((dag T@U) ) (! (let ((T@@46 (DAGDomainTypeTypeInv0 (type dag))))
 (=> (= (type dag) (DAGDomainTypeType T@@46)) (|Seq#Equal| (toSeq T@@46 dag) (ite (> (|Seq#Length| (get_DAG_successor dag)) 0) (|Seq#Append| (|Seq#Singleton| (get_DAG_value dag)) (toSeq T@@46 (get_DAG_successor dag))) (|Seq#Singleton| (get_DAG_value dag))))))
 :qid |stdinbpl.823:19|
 :skolemid |124|
 :pattern ( (toSeq intType dag))
)))
(assert (forall ((o_2@@1 T@U) (f_4@@1 T@U) ) (! (let ((B@@5 (FieldTypeInv1 (type f_4@@1))))
(let ((A@@5 (FieldTypeInv0 (type f_4@@1))))
 (=> (and (= (type o_2@@1) RefType) (= (type f_4@@1) (FieldType A@@5 B@@5))) (= (U_2_real (MapType1Select ZeroMask o_2@@1 f_4@@1)) NoPerm))))
 :qid |stdinbpl.106:22|
 :skolemid |13|
 :pattern ( (MapType1Select ZeroMask o_2@@1 f_4@@1))
)))
(assert (forall ((a@@12 T@U) (b@@10 T@U) (o@@3 T@U) ) (! (let ((T@@47 (type o@@3)))
 (=> (and (= (type a@@12) (MapType2Type T@@47 boolType)) (= (type b@@10) (MapType2Type T@@47 boolType))) (= (U_2_bool (MapType2Select (|Set#Intersection| a@@12 b@@10) o@@3))  (and (U_2_bool (MapType2Select a@@12 o@@3)) (U_2_bool (MapType2Select b@@10 o@@3))))))
 :qid |stdinbpl.583:18|
 :skolemid |73|
 :pattern ( (MapType2Select (|Set#Intersection| a@@12 b@@10) o@@3))
 :pattern ( (|Set#Intersection| a@@12 b@@10) (MapType2Select a@@12 o@@3))
 :pattern ( (|Set#Intersection| a@@12 b@@10) (MapType2Select b@@10 o@@3))
)))
(assert (forall ((s@@7 T@U) (t@@0 T@U) (n@@7 Int) ) (! (let ((T@@48 (SeqTypeInv0 (type s@@7))))
 (=> (and (and (= (type s@@7) (SeqType T@@48)) (= (type t@@0) (SeqType T@@48))) (and (> n@@7 0) (> n@@7 (|Seq#Length| s@@7)))) (and (= (|Seq#Add| (|Seq#Sub| n@@7 (|Seq#Length| s@@7)) (|Seq#Length| s@@7)) n@@7) (= (|Seq#Take| (|Seq#Append| s@@7 t@@0) n@@7) (|Seq#Append| s@@7 (|Seq#Take| t@@0 (|Seq#Sub| n@@7 (|Seq#Length| s@@7))))))))
 :qid |stdinbpl.350:18|
 :skolemid |42|
 :pattern ( (|Seq#Take| (|Seq#Append| s@@7 t@@0) n@@7))
)))
(assert (forall ((q@min@@1 Int) (q@max@@1 Int) ) (!  (and (=> (< q@min@@1 q@max@@1) (= (|Seq#Length| (|Seq#Range| q@min@@1 q@max@@1)) (- q@max@@1 q@min@@1))) (=> (<= q@max@@1 q@min@@1) (= (|Seq#Length| (|Seq#Range| q@min@@1 q@max@@1)) 0)))
 :qid |stdinbpl.528:15|
 :skolemid |55|
 :pattern ( (|Seq#Length| (|Seq#Range| q@min@@1 q@max@@1)))
)))
(assert (forall ((arg0@@56 T@U) (arg1@@28 T@U) ) (! (let ((T@@49 (MapType2TypeInv0 (type arg0@@56))))
(= (type (|Set#Difference| arg0@@56 arg1@@28)) (MapType2Type T@@49 boolType)))
 :qid |funType:Set#Difference|
 :pattern ( (|Set#Difference| arg0@@56 arg1@@28))
)))
(assert (forall ((a@@13 T@U) (b@@11 T@U) (o@@4 T@U) ) (! (let ((T@@50 (type o@@4)))
 (=> (and (= (type a@@13) (MapType2Type T@@50 boolType)) (= (type b@@11) (MapType2Type T@@50 boolType))) (= (U_2_bool (MapType2Select (|Set#Difference| a@@13 b@@11) o@@4))  (and (U_2_bool (MapType2Select a@@13 o@@4)) (not (U_2_bool (MapType2Select b@@11 o@@4)))))))
 :qid |stdinbpl.598:18|
 :skolemid |79|
 :pattern ( (MapType2Select (|Set#Difference| a@@13 b@@11) o@@4))
 :pattern ( (|Set#Difference| a@@13 b@@11) (MapType2Select a@@13 o@@4))
)))
(assert (forall ((a@@14 T@U) (b@@12 T@U) ) (! (let ((T@@51 (SeqTypeInv0 (type a@@14))))
 (=> (and (and (= (type a@@14) (SeqType T@@51)) (= (type b@@12) (SeqType T@@51))) (|Seq#Equal| a@@14 b@@12)) (= a@@14 b@@12)))
 :qid |stdinbpl.501:18|
 :skolemid |53|
 :pattern ( (|Seq#Equal| a@@14 b@@12))
)))
(assert (forall ((a@@15 T@U) (b@@13 T@U) ) (! (let ((T@@52 (MapType2TypeInv0 (type a@@15))))
 (=> (and (and (= (type a@@15) (MapType2Type T@@52 boolType)) (= (type b@@13) (MapType2Type T@@52 boolType))) (|Set#Equal| a@@15 b@@13)) (= a@@15 b@@13)))
 :qid |stdinbpl.620:17|
 :skolemid |86|
 :pattern ( (|Set#Equal| a@@15 b@@13))
)))
(assert (forall ((a@@16 T@U) (b@@14 T@U) ) (! (let ((T@@53 (MultiSetTypeInv0 (type a@@16))))
 (=> (and (and (= (type a@@16) (MultiSetType T@@53)) (= (type b@@14) (MultiSetType T@@53))) (|MultiSet#Equal| a@@16 b@@14)) (= a@@16 b@@14)))
 :qid |stdinbpl.719:17|
 :skolemid |115|
 :pattern ( (|MultiSet#Equal| a@@16 b@@14))
)))
(assert (forall ((arg0@@57 T@U) (arg1@@29 T@U) ) (! (let ((T@@54 (type arg1@@29)))
(= (type (|Set#UnionOne| arg0@@57 arg1@@29)) (MapType2Type T@@54 boolType)))
 :qid |funType:Set#UnionOne|
 :pattern ( (|Set#UnionOne| arg0@@57 arg1@@29))
)))
(assert (forall ((a@@17 T@U) (x@@11 T@U) (y@@3 T@U) ) (! (let ((T@@55 (type x@@11)))
 (=> (and (and (= (type a@@17) (MapType2Type T@@55 boolType)) (= (type y@@3) T@@55)) (U_2_bool (MapType2Select a@@17 y@@3))) (U_2_bool (MapType2Select (|Set#UnionOne| a@@17 x@@11) y@@3))))
 :qid |stdinbpl.563:18|
 :skolemid |67|
 :pattern ( (|Set#UnionOne| a@@17 x@@11) (MapType2Select a@@17 y@@3))
)))
(assert (forall ((a@@18 T@U) (b@@15 T@U) (y@@4 T@U) ) (! (let ((T@@56 (type y@@4)))
 (=> (and (and (= (type a@@18) (MapType2Type T@@56 boolType)) (= (type b@@15) (MapType2Type T@@56 boolType))) (U_2_bool (MapType2Select a@@18 y@@4))) (U_2_bool (MapType2Select (|Set#Union| a@@18 b@@15) y@@4))))
 :qid |stdinbpl.573:18|
 :skolemid |71|
 :pattern ( (|Set#Union| a@@18 b@@15) (MapType2Select a@@18 y@@4))
)))
(assert (forall ((a@@19 T@U) (b@@16 T@U) (y@@5 T@U) ) (! (let ((T@@57 (type y@@5)))
 (=> (and (and (= (type a@@19) (MapType2Type T@@57 boolType)) (= (type b@@16) (MapType2Type T@@57 boolType))) (U_2_bool (MapType2Select b@@16 y@@5))) (U_2_bool (MapType2Select (|Set#Union| a@@19 b@@16) y@@5))))
 :qid |stdinbpl.575:18|
 :skolemid |72|
 :pattern ( (|Set#Union| a@@19 b@@16) (MapType2Select b@@16 y@@5))
)))
(assert (forall ((ms T@U) (x@@12 T@U) ) (! (let ((T@@58 (type x@@12)))
 (=> (= (type ms) (MultiSetType T@@58)) (>= (|MultiSet#Select| ms x@@12) 0)))
 :qid |stdinbpl.650:18|
 :skolemid |92|
 :pattern ( (|MultiSet#Select| ms x@@12))
)))
(assert (forall ((a@@20 T@U) (x@@13 T@U) (o@@5 T@U) ) (! (let ((T@@59 (type x@@13)))
 (=> (and (= (type a@@20) (MapType2Type T@@59 boolType)) (= (type o@@5) T@@59)) (= (U_2_bool (MapType2Select (|Set#UnionOne| a@@20 x@@13) o@@5))  (or (= o@@5 x@@13) (U_2_bool (MapType2Select a@@20 o@@5))))))
 :qid |stdinbpl.559:18|
 :skolemid |65|
 :pattern ( (MapType2Select (|Set#UnionOne| a@@20 x@@13) o@@5))
)))
(assert (forall ((a@@21 T@U) (b@@17 T@U) (y@@6 T@U) ) (! (let ((T@@60 (type y@@6)))
 (=> (and (and (= (type a@@21) (MapType2Type T@@60 boolType)) (= (type b@@17) (MapType2Type T@@60 boolType))) (U_2_bool (MapType2Select b@@17 y@@6))) (not (U_2_bool (MapType2Select (|Set#Difference| a@@21 b@@17) y@@6)))))
 :qid |stdinbpl.600:18|
 :skolemid |80|
 :pattern ( (|Set#Difference| a@@21 b@@17) (MapType2Select b@@17 y@@6))
)))
(assert (forall ((s@@8 T@U) (i@@2 Int) ) (! (let ((T@@61 (SeqTypeInv0 (type s@@8))))
 (=> (= (type s@@8) (SeqType T@@61)) (=> (and (<= 0 i@@2) (< i@@2 (|Seq#Length| s@@8))) (|Seq#ContainsTrigger| s@@8 (|Seq#Index| s@@8 i@@2)))))
 :qid |stdinbpl.394:18|
 :skolemid |49|
 :pattern ( (|Seq#Index| s@@8 i@@2))
)))
(assert (forall ((a@@22 T@U) (b@@18 T@U) ) (! (let ((T@@62 (MapType2TypeInv0 (type a@@22))))
 (=> (and (= (type a@@22) (MapType2Type T@@62 boolType)) (= (type b@@18) (MapType2Type T@@62 boolType))) (and (= (+ (+ (|Set#Card| (|Set#Difference| a@@22 b@@18)) (|Set#Card| (|Set#Difference| b@@18 a@@22))) (|Set#Card| (|Set#Intersection| a@@22 b@@18))) (|Set#Card| (|Set#Union| a@@22 b@@18))) (= (|Set#Card| (|Set#Difference| a@@22 b@@18)) (- (|Set#Card| a@@22) (|Set#Card| (|Set#Intersection| a@@22 b@@18)))))))
 :qid |stdinbpl.602:18|
 :skolemid |81|
 :pattern ( (|Set#Card| (|Set#Difference| a@@22 b@@18)))
)))
(assert (forall ((s0@@1 T@U) (s1@@1 T@U) ) (! (let ((T@@63 (SeqTypeInv0 (type s0@@1))))
 (=> (and (= (type s0@@1) (SeqType T@@63)) (= (type s1@@1) (SeqType T@@63))) (and (=> (= s0@@1 (|Seq#Empty| T@@63)) (= (|Seq#Append| s0@@1 s1@@1) s1@@1)) (=> (= s1@@1 (|Seq#Empty| T@@63)) (= (|Seq#Append| s0@@1 s1@@1) s0@@1)))))
 :qid |stdinbpl.213:18|
 :skolemid |27|
 :pattern ( (|Seq#Append| s0@@1 s1@@1))
)))
(assert (forall ((t@@1 T@U) ) (! (= (|Seq#Index| (|Seq#Singleton| t@@1) 0) t@@1)
 :qid |stdinbpl.217:18|
 :skolemid |28|
 :pattern ( (|Seq#Singleton| t@@1))
)))
(assert (forall ((s@@9 T@U) ) (! (let ((T@@64 (SeqTypeInv0 (type s@@9))))
 (=> (= (type s@@9) (SeqType T@@64)) (<= 0 (|Seq#Length| s@@9))))
 :qid |stdinbpl.196:18|
 :skolemid |22|
 :pattern ( (|Seq#Length| s@@9))
)))
(assert (forall ((s@@10 T@U) ) (! (let ((T@@65 (MapType2TypeInv0 (type s@@10))))
 (=> (= (type s@@10) (MapType2Type T@@65 boolType)) (<= 0 (|Set#Card| s@@10))))
 :qid |stdinbpl.545:18|
 :skolemid |58|
 :pattern ( (|Set#Card| s@@10))
)))
(assert (forall ((s@@11 T@U) ) (! (let ((T@@66 (MultiSetTypeInv0 (type s@@11))))
 (=> (= (type s@@11) (MultiSetType T@@66)) (<= 0 (|MultiSet#Card| s@@11))))
 :qid |stdinbpl.653:18|
 :skolemid |93|
 :pattern ( (|MultiSet#Card| s@@11))
)))
(assert (forall ((T@@67 T@T) ) (! (= (type (|MultiSet#Empty| T@@67)) (MultiSetType T@@67))
 :qid |funType:MultiSet#Empty|
 :pattern ( (|MultiSet#Empty| T@@67))
)))
(assert (forall ((o@@6 T@U) ) (! (let ((T@@68 (type o@@6)))
(= (|MultiSet#Select| (|MultiSet#Empty| T@@68) o@@6) 0))
 :qid |stdinbpl.658:18|
 :skolemid |94|
 :pattern ( (let ((T@@68 (type o@@6)))
(|MultiSet#Select| (|MultiSet#Empty| T@@68) o@@6)))
)))
(assert (forall ((a@@23 T@U) (x@@14 T@U) ) (! (let ((T@@69 (type x@@14)))
 (=> (= (type a@@23) (MapType2Type T@@69 boolType)) (U_2_bool (MapType2Select (|Set#UnionOne| a@@23 x@@14) x@@14))))
 :qid |stdinbpl.561:18|
 :skolemid |66|
 :pattern ( (|Set#UnionOne| a@@23 x@@14))
)))
(assert (forall ((s0@@2 T@U) (s1@@2 T@U) ) (! (let ((T@@70 (SeqTypeInv0 (type s0@@2))))
 (=> (and (and (= (type s0@@2) (SeqType T@@70)) (= (type s1@@2) (SeqType T@@70))) (|Seq#Equal| s0@@2 s1@@2)) (and (= (|Seq#Length| s0@@2) (|Seq#Length| s1@@2)) (forall ((j@@4 Int) ) (!  (=> (and (<= 0 j@@4) (< j@@4 (|Seq#Length| s0@@2))) (= (|Seq#Index| s0@@2 j@@4) (|Seq#Index| s1@@2 j@@4)))
 :qid |stdinbpl.491:13|
 :skolemid |50|
 :pattern ( (|Seq#Index| s0@@2 j@@4))
 :pattern ( (|Seq#Index| s1@@2 j@@4))
)))))
 :qid |stdinbpl.488:18|
 :skolemid |51|
 :pattern ( (|Seq#Equal| s0@@2 s1@@2))
)))
(assert (forall ((arg0@@58 T@U) (arg1@@30 T@U) ) (! (let ((T@@71 (type arg0@@58)))
(= (type (add arg0@@58 arg1@@30)) T@@71))
 :qid |funType:add|
 :pattern ( (add arg0@@58 arg1@@30))
)))
(assert (forall ((o1 T@U) (o2_1 T@U) ) (! (let ((T@@72 (MapType2TypeInv0 (type o1))))
 (=> (and (= (type o1) (MapType2Type T@@72 boolType)) (= (type o2_1) (MapType2Type T@@72 boolType))) (|Set#Equal| (add o1 o2_1) (|Set#Union| o1 o2_1))))
 :qid |stdinbpl.785:19|
 :skolemid |120|
 :pattern ( (add o1 o2_1))
)))
(assert (forall ((o1@@0 T@U) (o2_1@@0 T@U) ) (! (let ((T@@73 (SeqTypeInv0 (type o1@@0))))
 (=> (and (= (type o1@@0) (SeqType T@@73)) (= (type o2_1@@0) (SeqType T@@73))) (|Seq#Equal| (add o1@@0 o2_1@@0) (|Seq#Append| o1@@0 o2_1@@0))))
 :qid |stdinbpl.798:19|
 :skolemid |121|
 :pattern ( (add o1@@0 o2_1@@0))
)))
(assert (forall ((Heap@@5 T@U) (ExhaleHeap@@4 T@U) (Mask@@6 T@U) (pm_f@@1 T@U) ) (! (let ((C@@1 (FieldTypeInv0 (type pm_f@@1))))
 (=> (and (and (and (and (and (= (type Heap@@5) (MapType0Type RefType)) (= (type ExhaleHeap@@4) (MapType0Type RefType))) (= (type Mask@@6) (MapType1Type RefType realType))) (= (type pm_f@@1) (FieldType C@@1 FrameTypeType))) (IdenticalOnKnownLocations Heap@@5 ExhaleHeap@@4 Mask@@6)) (and (HasDirectPerm Mask@@6 null pm_f@@1) (IsPredicateField pm_f@@1))) (forall ((o2 T@U) (f_2@@0 T@U) ) (! (let ((B@@6 (FieldTypeInv1 (type f_2@@0))))
(let ((A@@6 (FieldTypeInv0 (type f_2@@0))))
 (=> (and (and (= (type o2) RefType) (= (type f_2@@0) (FieldType A@@6 B@@6))) (U_2_bool (MapType1Select (MapType0Select Heap@@5 null (PredicateMaskField pm_f@@1)) o2 f_2@@0))) (= (MapType0Select Heap@@5 o2 f_2@@0) (MapType0Select ExhaleHeap@@4 o2 f_2@@0)))))
 :qid |stdinbpl.54:134|
 :skolemid |3|
 :pattern ( (MapType0Select ExhaleHeap@@4 o2 f_2@@0))
))))
 :qid |stdinbpl.52:19|
 :skolemid |4|
 :pattern ( (IdenticalOnKnownLocations Heap@@5 ExhaleHeap@@4 Mask@@6) (IsPredicateField pm_f@@1))
)))
(assert (forall ((Heap@@6 T@U) (ExhaleHeap@@5 T@U) (Mask@@7 T@U) (pm_f@@2 T@U) ) (! (let ((C@@2 (FieldTypeInv0 (type pm_f@@2))))
 (=> (and (and (and (and (and (= (type Heap@@6) (MapType0Type RefType)) (= (type ExhaleHeap@@5) (MapType0Type RefType))) (= (type Mask@@7) (MapType1Type RefType realType))) (= (type pm_f@@2) (FieldType C@@2 FrameTypeType))) (IdenticalOnKnownLocations Heap@@6 ExhaleHeap@@5 Mask@@7)) (and (HasDirectPerm Mask@@7 null pm_f@@2) (IsWandField pm_f@@2))) (forall ((o2@@0 T@U) (f_2@@1 T@U) ) (! (let ((B@@7 (FieldTypeInv1 (type f_2@@1))))
(let ((A@@7 (FieldTypeInv0 (type f_2@@1))))
 (=> (and (and (= (type o2@@0) RefType) (= (type f_2@@1) (FieldType A@@7 B@@7))) (U_2_bool (MapType1Select (MapType0Select Heap@@6 null (WandMaskField pm_f@@2)) o2@@0 f_2@@1))) (= (MapType0Select Heap@@6 o2@@0 f_2@@1) (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1)))))
 :qid |stdinbpl.67:129|
 :skolemid |6|
 :pattern ( (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1))
))))
 :qid |stdinbpl.65:19|
 :skolemid |7|
 :pattern ( (IdenticalOnKnownLocations Heap@@6 ExhaleHeap@@5 Mask@@7) (IsWandField pm_f@@2))
)))
(assert (forall ((a@@24 T@U) (x@@15 T@U) ) (! (let ((T@@74 (type x@@15)))
 (=> (and (= (type a@@24) (MapType2Type T@@74 boolType)) (U_2_bool (MapType2Select a@@24 x@@15))) (= (|Set#Card| (|Set#UnionOne| a@@24 x@@15)) (|Set#Card| a@@24))))
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
(assert (forall ((Mask@@8 T@U) (o_2@@2 T@U) (f_4@@2 T@U) ) (! (let ((B@@8 (FieldTypeInv1 (type f_4@@2))))
(let ((A@@8 (FieldTypeInv0 (type f_4@@2))))
 (=> (and (and (and (= (type Mask@@8) (MapType1Type RefType realType)) (= (type o_2@@2) RefType)) (= (type f_4@@2) (FieldType A@@8 B@@8))) (GoodMask Mask@@8)) (and (>= (U_2_real (MapType1Select Mask@@8 o_2@@2 f_4@@2)) NoPerm) (=> (and (and (GoodMask Mask@@8) (not (IsPredicateField f_4@@2))) (not (IsWandField f_4@@2))) (<= (U_2_real (MapType1Select Mask@@8 o_2@@2 f_4@@2)) FullPerm))))))
 :qid |stdinbpl.128:22|
 :skolemid |16|
 :pattern ( (GoodMask Mask@@8) (MapType1Select Mask@@8 o_2@@2 f_4@@2))
)))
(assert (forall ((r@@2 T@U) ) (! (U_2_bool (MapType2Select (|Set#Singleton| r@@2) r@@2))
 :qid |stdinbpl.554:18|
 :skolemid |62|
 :pattern ( (|Set#Singleton| r@@2))
)))
(assert (forall ((a@@26 T@U) (b@@19 T@U) ) (! (let ((T@@76 (MapType2TypeInv0 (type a@@26))))
 (=> (and (= (type a@@26) (MapType2Type T@@76 boolType)) (= (type b@@19) (MapType2Type T@@76 boolType))) (= (|Set#Union| a@@26 (|Set#Union| a@@26 b@@19)) (|Set#Union| a@@26 b@@19))))
 :qid |stdinbpl.588:18|
 :skolemid |75|
 :pattern ( (|Set#Union| a@@26 (|Set#Union| a@@26 b@@19)))
)))
(assert (forall ((a@@27 T@U) (b@@20 T@U) ) (! (let ((T@@77 (MapType2TypeInv0 (type a@@27))))
 (=> (and (= (type a@@27) (MapType2Type T@@77 boolType)) (= (type b@@20) (MapType2Type T@@77 boolType))) (= (|Set#Intersection| a@@27 (|Set#Intersection| a@@27 b@@20)) (|Set#Intersection| a@@27 b@@20))))
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
 (=> (= (type s@@12) (MultiSetType T@@79)) (and (= (= (|MultiSet#Card| s@@12) 0) (= s@@12 (|MultiSet#Empty| T@@79))) (=> (not (= (|MultiSet#Card| s@@12) 0)) (exists ((x@@17 T@U) ) (!  (and (= (type x@@17) T@@79) (< 0 (|MultiSet#Select| s@@12 x@@17)))
 :qid |stdinbpl.661:38|
 :skolemid |95|
 :no-pattern (type x@@17)
 :no-pattern (U_2_int x@@17)
 :no-pattern (U_2_bool x@@17)
))))))
 :qid |stdinbpl.659:18|
 :skolemid |96|
 :pattern ( (|MultiSet#Card| s@@12))
)))
(assert (forall ((r@@3 T@U) (o@@7 T@U) ) (! (let ((T@@80 (type r@@3)))
 (=> (= (type o@@7) T@@80) (and (= (= (|MultiSet#Select| (|MultiSet#Singleton| r@@3) o@@7) 1) (= r@@3 o@@7)) (= (= (|MultiSet#Select| (|MultiSet#Singleton| r@@3) o@@7) 0) (not (= r@@3 o@@7))))))
 :qid |stdinbpl.664:18|
 :skolemid |97|
 :pattern ( (|MultiSet#Select| (|MultiSet#Singleton| r@@3) o@@7))
)))
(assert (forall ((o@@8 T@U) (f T@U) (Heap@@7 T@U) ) (!  (=> (and (and (and (= (type o@@8) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap@@7) (MapType0Type RefType))) (U_2_bool (MapType0Select Heap@@7 o@@8 $allocated))) (U_2_bool (MapType0Select Heap@@7 (MapType0Select Heap@@7 o@@8 f) $allocated)))
 :qid |stdinbpl.31:15|
 :skolemid |0|
 :pattern ( (MapType0Select Heap@@7 o@@8 f))
)))
(assert (forall ((a@@29 T@U) (b@@22 T@U) (o@@9 T@U) ) (! (let ((T@@81 (type o@@9)))
 (=> (and (= (type a@@29) (MultiSetType T@@81)) (= (type b@@22) (MultiSetType T@@81))) (= (|MultiSet#Select| (|MultiSet#Union| a@@29 b@@22) o@@9) (+ (|MultiSet#Select| a@@29 o@@9) (|MultiSet#Select| b@@22 o@@9)))))
 :qid |stdinbpl.682:18|
 :skolemid |103|
 :pattern ( (|MultiSet#Select| (|MultiSet#Union| a@@29 b@@22) o@@9))
 :pattern ( (|MultiSet#Union| a@@29 b@@22) (|MultiSet#Select| a@@29 o@@9) (|MultiSet#Select| b@@22 o@@9))
)))
(assert (forall ((s@@13 T@U) (t@@3 T@U) (n@@8 Int) ) (! (let ((T@@82 (SeqTypeInv0 (type s@@13))))
 (=> (and (and (= (type s@@13) (SeqType T@@82)) (= (type t@@3) (SeqType T@@82))) (and (< 0 n@@8) (<= n@@8 (|Seq#Length| s@@13)))) (= (|Seq#Take| (|Seq#Append| s@@13 t@@3) n@@8) (|Seq#Take| s@@13 n@@8))))
 :qid |stdinbpl.346:18|
 :skolemid |41|
 :pattern ( (|Seq#Take| (|Seq#Append| s@@13 t@@3) n@@8))
)))
(assert (forall ((T@@83 T@T) ) (! (= (type (|Set#Empty| T@@83)) (MapType2Type T@@83 boolType))
 :qid |funType:Set#Empty|
 :pattern ( (|Set#Empty| T@@83))
)))
(assert (forall ((o@@10 T@U) ) (! (let ((T@@84 (type o@@10)))
 (not (U_2_bool (MapType2Select (|Set#Empty| T@@84) o@@10))))
 :qid |stdinbpl.548:18|
 :skolemid |59|
 :pattern ( (let ((T@@84 (type o@@10)))
(MapType2Select (|Set#Empty| T@@84) o@@10)))
)))
(assert (forall ((value_1@@0 T@U) (successor_1@@0 T@U) ) (! (let ((T@@85 (type value_1@@0)))
 (=> (= (type successor_1@@0) (SeqType (DAGDomainTypeType T@@85))) (= value_1@@0 (get_DAG_value (Node value_1@@0 successor_1@@0)))))
 :qid |stdinbpl.848:19|
 :skolemid |125|
 :pattern ( (Node value_1@@0 successor_1@@0))
)))
(assert (forall ((s@@14 T@U) (i@@3 Int) (v@@1 T@U) ) (! (let ((T@@86 (type v@@1)))
 (=> (= (type s@@14) (SeqType T@@86)) (=> (and (<= 0 i@@3) (< i@@3 (|Seq#Length| s@@14))) (= (|Seq#Length| (|Seq#Update| s@@14 i@@3 v@@1)) (|Seq#Length| s@@14)))))
 :qid |stdinbpl.245:18|
 :skolemid |34|
 :pattern ( (|Seq#Length| (|Seq#Update| s@@14 i@@3 v@@1)))
 :pattern ( (|Seq#Length| s@@14) (|Seq#Update| s@@14 i@@3 v@@1))
)))
(assert (forall ((o1@@1 T@U) (o2_1@@1 T@U) ) (!  (=> (and (= (type o1@@1) intType) (= (type o2_1@@1) intType)) (= (U_2_int (add o1@@1 o2_1@@1)) (+ (U_2_int o1@@1) (U_2_int o2_1@@1))))
 :qid |stdinbpl.766:15|
 :skolemid |118|
 :pattern ( (add o1@@1 o2_1@@1))
)))
(assert (forall ((r@@4 T@U) ) (! (let ((T@@87 (type r@@4)))
(= (|MultiSet#Singleton| r@@4) (|MultiSet#UnionOne| (|MultiSet#Empty| T@@87) r@@4)))
 :qid |stdinbpl.667:18|
 :skolemid |99|
 :pattern ( (|MultiSet#Singleton| r@@4))
)))
(assert (forall ((s@@15 T@U) (t@@4 T@U) (n@@9 Int) ) (! (let ((T@@88 (SeqTypeInv0 (type s@@15))))
 (=> (and (and (= (type s@@15) (SeqType T@@88)) (= (type t@@4) (SeqType T@@88))) (and (< 0 n@@9) (<= n@@9 (|Seq#Length| s@@15)))) (= (|Seq#Drop| (|Seq#Append| s@@15 t@@4) n@@9) (|Seq#Append| (|Seq#Drop| s@@15 n@@9) t@@4))))
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
(assert (forall ((s@@16 T@U) (n@@10 Int) (i@@4 Int) ) (! (let ((T@@89 (SeqTypeInv0 (type s@@16))))
 (=> (= (type s@@16) (SeqType T@@89)) (=> (and (and (< 0 n@@10) (<= n@@10 i@@4)) (< i@@4 (|Seq#Length| s@@16))) (and (= (|Seq#Add| (|Seq#Sub| i@@4 n@@10) n@@10) i@@4) (= (|Seq#Index| (|Seq#Drop| s@@16 n@@10) (|Seq#Sub| i@@4 n@@10)) (|Seq#Index| s@@16 i@@4))))))
 :qid |stdinbpl.296:18|
 :skolemid |40|
 :pattern ( (|Seq#Drop| s@@16 n@@10) (|Seq#Index| s@@16 i@@4))
)))
(assert (forall ((s@@17 T@U) ) (! (let ((T@@90 (MapType2TypeInv0 (type s@@17))))
 (=> (= (type s@@17) (MapType2Type T@@90 boolType)) (and (= (= (|Set#Card| s@@17) 0) (= s@@17 (|Set#Empty| T@@90))) (=> (not (= (|Set#Card| s@@17) 0)) (exists ((x@@18 T@U) ) (!  (and (= (type x@@18) T@@90) (U_2_bool (MapType2Select s@@17 x@@18)))
 :qid |stdinbpl.551:33|
 :skolemid |60|
 :no-pattern (type x@@18)
 :no-pattern (U_2_int x@@18)
 :no-pattern (U_2_bool x@@18)
))))))
 :qid |stdinbpl.549:18|
 :skolemid |61|
 :pattern ( (|Set#Card| s@@17))
)))
(assert (forall ((s0@@3 T@U) (s1@@3 T@U) (n@@11 Int) ) (! (let ((T@@91 (SeqTypeInv0 (type s0@@3))))
 (=> (and (= (type s0@@3) (SeqType T@@91)) (= (type s1@@3) (SeqType T@@91))) (=> (and (and (and (not (= s0@@3 (|Seq#Empty| T@@91))) (not (= s1@@3 (|Seq#Empty| T@@91)))) (<= 0 n@@11)) (< n@@11 (|Seq#Length| s0@@3))) (= (|Seq#Index| (|Seq#Append| s0@@3 s1@@3) n@@11) (|Seq#Index| s0@@3 n@@11)))))
 :qid |stdinbpl.236:18|
 :skolemid |31|
 :pattern ( (|Seq#Index| (|Seq#Append| s0@@3 s1@@3) n@@11))
 :pattern ( (|Seq#Index| s0@@3 n@@11) (|Seq#Append| s0@@3 s1@@3))
)))
(assert (forall ((Heap@@8 T@U) (o@@11 T@U) (f_3 T@U) (v@@2 T@U) ) (! (let ((B@@9 (type v@@2)))
(let ((A@@9 (FieldTypeInv0 (type f_3))))
 (=> (and (and (= (type Heap@@8) (MapType0Type RefType)) (= (type o@@11) RefType)) (= (type f_3) (FieldType A@@9 B@@9))) (succHeap Heap@@8 (MapType0Store Heap@@8 o@@11 f_3 v@@2)))))
 :qid |stdinbpl.78:22|
 :skolemid |9|
 :pattern ( (MapType0Store Heap@@8 o@@11 f_3 v@@2))
)))
(assert (forall ((a@@32 T@U) (b@@25 T@U) ) (! (let ((T@@92 (MapType2TypeInv0 (type a@@32))))
 (=> (and (= (type a@@32) (MapType2Type T@@92 boolType)) (= (type b@@25) (MapType2Type T@@92 boolType))) (= (|Set#Subset| a@@32 b@@25) (forall ((o@@12 T@U) ) (!  (=> (and (= (type o@@12) T@@92) (U_2_bool (MapType2Select a@@32 o@@12))) (U_2_bool (MapType2Select b@@25 o@@12)))
 :qid |stdinbpl.611:32|
 :skolemid |82|
 :pattern ( (MapType2Select a@@32 o@@12))
 :pattern ( (MapType2Select b@@25 o@@12))
)))))
 :qid |stdinbpl.610:17|
 :skolemid |83|
 :pattern ( (|Set#Subset| a@@32 b@@25))
)))
(assert (forall ((s0@@4 T@U) (s1@@4 T@U) (m@@10 Int) ) (! (let ((T@@93 (SeqTypeInv0 (type s0@@4))))
 (=> (and (= (type s0@@4) (SeqType T@@93)) (= (type s1@@4) (SeqType T@@93))) (=> (and (and (and (not (= s0@@4 (|Seq#Empty| T@@93))) (not (= s1@@4 (|Seq#Empty| T@@93)))) (<= 0 m@@10)) (< m@@10 (|Seq#Length| s1@@4))) (and (= (|Seq#Sub| (|Seq#Add| m@@10 (|Seq#Length| s0@@4)) (|Seq#Length| s0@@4)) m@@10) (= (|Seq#Index| (|Seq#Append| s0@@4 s1@@4) (|Seq#Add| m@@10 (|Seq#Length| s0@@4))) (|Seq#Index| s1@@4 m@@10))))))
 :qid |stdinbpl.241:18|
 :skolemid |33|
 :pattern ( (|Seq#Index| s1@@4 m@@10) (|Seq#Append| s0@@4 s1@@4))
)))
(assert (forall ((a@@33 T@U) (x@@19 T@U) ) (! (let ((T@@94 (type x@@19)))
 (=> (and (= (type a@@33) (MapType2Type T@@94 boolType)) (not (U_2_bool (MapType2Select a@@33 x@@19)))) (= (|Set#Card| (|Set#UnionOne| a@@33 x@@19)) (+ (|Set#Card| a@@33) 1))))
 :qid |stdinbpl.567:18|
 :skolemid |69|
 :pattern ( (|Set#Card| (|Set#UnionOne| a@@33 x@@19)))
)))
(assert (forall ((a@@34 T@U) (b@@26 T@U) (o@@13 T@U) ) (! (let ((T@@95 (type o@@13)))
 (=> (and (= (type a@@34) (MultiSetType T@@95)) (= (type b@@26) (MultiSetType T@@95))) (= (|MultiSet#Select| (|MultiSet#Difference| a@@34 b@@26) o@@13) (|Math#clip| (- (|MultiSet#Select| a@@34 o@@13) (|MultiSet#Select| b@@26 o@@13))))))
 :qid |stdinbpl.699:18|
 :skolemid |108|
 :pattern ( (|MultiSet#Select| (|MultiSet#Difference| a@@34 b@@26) o@@13))
)))
(assert (= (type ZeroPMask) (MapType1Type RefType boolType)))
(assert (forall ((o_2@@3 T@U) (f_4@@3 T@U) ) (! (let ((B@@10 (FieldTypeInv1 (type f_4@@3))))
(let ((A@@10 (FieldTypeInv0 (type f_4@@3))))
 (=> (and (= (type o_2@@3) RefType) (= (type f_4@@3) (FieldType A@@10 B@@10))) (not (U_2_bool (MapType1Select ZeroPMask o_2@@3 f_4@@3))))))
 :qid |stdinbpl.112:22|
 :skolemid |14|
 :pattern ( (MapType1Select ZeroPMask o_2@@3 f_4@@3))
)))
(assert (forall ((value_1@@1 T@U) (successor_1@@1 T@U) ) (! (let ((T@@96 (type value_1@@1)))
 (=> (= (type successor_1@@1) (SeqType (DAGDomainTypeType T@@96))) (= (DAG_tag (Node value_1@@1 successor_1@@1)) 0)))
 :qid |stdinbpl.860:19|
 :skolemid |127|
 :pattern ( (Node value_1@@1 successor_1@@1))
)))
(assert (forall ((s@@18 T@U) (x@@20 T@U) (i@@5 Int) ) (! (let ((T@@97 (type x@@20)))
 (=> (= (type s@@18) (SeqType T@@97)) (=> (and (and (<= 0 i@@5) (< i@@5 (|Seq#Length| s@@18))) (= (|Seq#Index| s@@18 i@@5) x@@20)) (|Seq#Contains| s@@18 x@@20))))
 :qid |stdinbpl.392:18|
 :skolemid |48|
 :pattern ( (|Seq#Contains| s@@18 x@@20) (|Seq#Index| s@@18 i@@5))
)))
(assert (forall ((s0@@5 T@U) (s1@@5 T@U) ) (! (let ((T@@98 (SeqTypeInv0 (type s0@@5))))
 (=> (and (= (type s0@@5) (SeqType T@@98)) (= (type s1@@5) (SeqType T@@98))) (or (or (and (= s0@@5 s1@@5) (|Seq#Equal| s0@@5 s1@@5)) (and (and (not (= s0@@5 s1@@5)) (not (|Seq#Equal| s0@@5 s1@@5))) (not (= (|Seq#Length| s0@@5) (|Seq#Length| s1@@5))))) (and (and (and (and (and (and (not (= s0@@5 s1@@5)) (not (|Seq#Equal| s0@@5 s1@@5))) (= (|Seq#Length| s0@@5) (|Seq#Length| s1@@5))) (= (|Seq#SkolemDiff| s0@@5 s1@@5) (|Seq#SkolemDiff| s1@@5 s0@@5))) (<= 0 (|Seq#SkolemDiff| s0@@5 s1@@5))) (< (|Seq#SkolemDiff| s0@@5 s1@@5) (|Seq#Length| s0@@5))) (not (= (|Seq#Index| s0@@5 (|Seq#SkolemDiff| s0@@5 s1@@5)) (|Seq#Index| s1@@5 (|Seq#SkolemDiff| s0@@5 s1@@5))))))))
 :qid |stdinbpl.496:18|
 :skolemid |52|
 :pattern ( (|Seq#Equal| s0@@5 s1@@5))
)))
(assert (forall ((p@@1 T@U) (v_1@@0 T@U) (q T@U) (w@@0 T@U) (r@@5 T@U) (u T@U) ) (! (let ((C@@3 (FieldTypeInv0 (type r@@5))))
(let ((B@@11 (FieldTypeInv0 (type q))))
(let ((A@@11 (FieldTypeInv0 (type p@@1))))
 (=> (and (and (and (and (and (and (= (type p@@1) (FieldType A@@11 FrameTypeType)) (= (type v_1@@0) FrameTypeType)) (= (type q) (FieldType B@@11 FrameTypeType))) (= (type w@@0) FrameTypeType)) (= (type r@@5) (FieldType C@@3 FrameTypeType))) (= (type u) FrameTypeType)) (and (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r@@5 u))) (InsidePredicate p@@1 v_1@@0 r@@5 u)))))
 :qid |stdinbpl.165:25|
 :skolemid |20|
 :pattern ( (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r@@5 u))
)))
(assert (forall ((a@@35 Int) ) (!  (=> (< a@@35 0) (= (|Math#clip| a@@35) 0))
 :qid |stdinbpl.638:15|
 :skolemid |91|
 :pattern ( (|Math#clip| a@@35))
)))
(assert (forall ((s@@19 T@U) ) (! (let ((T@@99 (SeqTypeInv0 (type s@@19))))
 (=> (and (= (type s@@19) (SeqType T@@99)) (= (|Seq#Length| s@@19) 0)) (= s@@19 (|Seq#Empty| T@@99))))
 :qid |stdinbpl.200:18|
 :skolemid |24|
 :pattern ( (|Seq#Length| s@@19))
)))
(assert (forall ((s@@20 T@U) (n@@12 Int) ) (! (let ((T@@100 (SeqTypeInv0 (type s@@20))))
 (=> (and (= (type s@@20) (SeqType T@@100)) (<= n@@12 0)) (= (|Seq#Take| s@@20 n@@12) (|Seq#Empty| T@@100))))
 :qid |stdinbpl.375:18|
 :skolemid |46|
 :pattern ( (|Seq#Take| s@@20 n@@12))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
(assert (forall ((a@@36 T@U) (x@@21 T@U) (o@@14 T@U) ) (! (let ((T@@101 (type x@@21)))
 (=> (and (= (type a@@36) (MultiSetType T@@101)) (= (type o@@14) T@@101)) (= (|MultiSet#Select| (|MultiSet#UnionOne| a@@36 x@@21) o@@14) (ite (= x@@21 o@@14) (+ (|MultiSet#Select| a@@36 o@@14) 1) (|MultiSet#Select| a@@36 o@@14)))))
 :qid |stdinbpl.671:18|
 :skolemid |100|
 :pattern ( (|MultiSet#Select| (|MultiSet#UnionOne| a@@36 x@@21) o@@14))
 :pattern ( (|MultiSet#UnionOne| a@@36 x@@21) (|MultiSet#Select| a@@36 o@@14))
)))
(assert (forall ((a@@37 T@U) (b@@27 T@U) ) (! (let ((T@@102 (MultiSetTypeInv0 (type a@@37))))
 (=> (and (= (type a@@37) (MultiSetType T@@102)) (= (type b@@27) (MultiSetType T@@102))) (= (|MultiSet#Equal| a@@37 b@@27) (forall ((o@@15 T@U) ) (!  (=> (= (type o@@15) T@@102) (= (|MultiSet#Select| a@@37 o@@15) (|MultiSet#Select| b@@27 o@@15)))
 :qid |stdinbpl.717:36|
 :skolemid |113|
 :pattern ( (|MultiSet#Select| a@@37 o@@15))
 :pattern ( (|MultiSet#Select| b@@27 o@@15))
)))))
 :qid |stdinbpl.716:17|
 :skolemid |114|
 :pattern ( (|MultiSet#Equal| a@@37 b@@27))
)))
(assert (forall ((a@@38 T@U) (b@@28 T@U) ) (! (let ((T@@103 (MultiSetTypeInv0 (type a@@38))))
 (=> (and (= (type a@@38) (MultiSetType T@@103)) (= (type b@@28) (MultiSetType T@@103))) (= (|MultiSet#Subset| a@@38 b@@28) (forall ((o@@16 T@U) ) (!  (=> (= (type o@@16) T@@103) (<= (|MultiSet#Select| a@@38 o@@16) (|MultiSet#Select| b@@28 o@@16)))
 :qid |stdinbpl.713:37|
 :skolemid |111|
 :pattern ( (|MultiSet#Select| a@@38 o@@16))
 :pattern ( (|MultiSet#Select| b@@28 o@@16))
)))))
 :qid |stdinbpl.712:17|
 :skolemid |112|
 :pattern ( (|MultiSet#Subset| a@@38 b@@28))
)))
(assert (forall ((a@@39 T@U) (b@@29 T@U) (o@@17 T@U) ) (! (let ((T@@104 (type o@@17)))
 (=> (and (= (type a@@39) (MapType2Type T@@104 boolType)) (= (type b@@29) (MapType2Type T@@104 boolType))) (= (U_2_bool (MapType2Select (|Set#Union| a@@39 b@@29) o@@17))  (or (U_2_bool (MapType2Select a@@39 o@@17)) (U_2_bool (MapType2Select b@@29 o@@17))))))
 :qid |stdinbpl.571:18|
 :skolemid |70|
 :pattern ( (MapType2Select (|Set#Union| a@@39 b@@29) o@@17))
)))
(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun Heap@@9 () T@U)
(declare-fun dag@0 () T@U)
(assert  (and (= (type Heap@@9) (MapType0Type RefType)) (= (type dag@0) (DAGDomainTypeType intType))))
(set-info :boogie-vc-id client)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 4) (let ((anon0_correct  (=> (state Heap@@9 ZeroMask) (=> (and (= dag@0 (Node (int_2_U 1) (|Seq#Append| (|Seq#Append| (|Seq#Append| (|Seq#Append| (|Seq#Singleton| (Node (int_2_U 2) (|Seq#Singleton| (Node (int_2_U 3) (|Seq#Empty| (DAGDomainTypeType intType)))))) (|Seq#Singleton| (Node (int_2_U 2) (|Seq#Singleton| (Node (int_2_U 3) (|Seq#Empty| (DAGDomainTypeType intType))))))) (|Seq#Singleton| (Node (int_2_U 2) (|Seq#Empty| (DAGDomainTypeType intType))))) (|Seq#Singleton| (Node (int_2_U 2) (|Seq#Empty| (DAGDomainTypeType intType))))) (|Seq#Singleton| (Node (int_2_U 2) (|Seq#Empty| (DAGDomainTypeType intType))))))) (state Heap@@9 ZeroMask)) (and (=> (= (ControlFlow 0 2) (- 0 3)) (|Seq#Equal| (toSeq intType dag@0) (|Seq#Append| (|Seq#Singleton| (int_2_U 1)) (toSeq intType (get_DAG_successor dag@0))))) (=> (|Seq#Equal| (toSeq intType dag@0) (|Seq#Append| (|Seq#Singleton| (int_2_U 1)) (toSeq intType (get_DAG_successor dag@0)))) (=> (and (state Heap@@9 ZeroMask) (= (ControlFlow 0 2) (- 0 1))) (|Seq#Equal| (toSeq intType dag@0) (|Seq#Append| (|Seq#Append| (|Seq#Append| (|Seq#Append| (|Seq#Append| (|Seq#Append| (|Seq#Append| (|Seq#Singleton| (int_2_U 1)) (|Seq#Singleton| (int_2_U 2))) (|Seq#Singleton| (int_2_U 3))) (|Seq#Singleton| (int_2_U 2))) (|Seq#Singleton| (int_2_U 3))) (|Seq#Singleton| (int_2_U 2))) (|Seq#Singleton| (int_2_U 2))) (|Seq#Singleton| (int_2_U 2)))))))))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 4) 2) anon0_correct)))
PreconditionGeneratedEntry_correct)))
))
(check-sat)
(pop 1)
; Valid
(get-info :rlimit)
