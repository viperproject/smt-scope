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
(declare-fun val () T@U)
(declare-fun edges () T@U)
(declare-fun FieldType (T@T T@T) T@T)
(declare-fun FieldTypeInv0 (T@T) T@T)
(declare-fun FieldTypeInv1 (T@T) T@T)
(declare-fun NormalFieldType () T@T)
(declare-fun IEdgesDomainTypeType () T@T)
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
(declare-fun has_edge (T@U Int) Bool)
(declare-fun insert_edge (T@U Int T@U) T@U)
(declare-fun has_node (T@U T@U) Bool)
(declare-fun insert (T@U T@U T@U) T@U)
(declare-fun INodeMapDomainTypeType () T@T)
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
(declare-fun MapType2TypeInv0 (T@T) T@T)
(declare-fun MapType2Type (T@T T@T) T@T)
(declare-fun MapType2TypeInv1 (T@T) T@T)
(declare-fun MapType2Select (T@U T@U) T@U)
(declare-fun MapType2Store (T@U T@U T@U) T@U)
(declare-fun |Set#Intersection| (T@U T@U) T@U)
(declare-fun |Set#Singleton| (T@U) T@U)
(declare-fun |Seq#Take| (T@U Int) T@U)
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
(declare-fun edge_lookup (T@U Int) T@U)
(declare-fun lookup (T@U T@U) T@U)
(declare-fun |Set#Equal| (T@U T@U) Bool)
(declare-fun sumMask (T@U T@U T@U) Bool)
(declare-fun ConditionalFrame (Real T@U) T@U)
(declare-fun EmptyFrame () T@U)
(declare-fun NoPerm () Real)
(declare-fun |Set#Difference| (T@U T@U) T@U)
(declare-fun |Seq#Equal| (T@U T@U) Bool)
(declare-fun |MultiSet#Equal| (T@U T@U) Bool)
(declare-fun |Set#UnionOne| (T@U T@U) T@U)
(declare-fun |Seq#ContainsTrigger| (T@U T@U) Bool)
(declare-fun |MultiSet#Empty| (T@T) T@U)
(declare-fun empty_edges () T@U)
(declare-fun empty_map () T@U)
(declare-fun FullPerm () Real)
(declare-fun |Set#Empty| (T@T) T@U)
(declare-fun edges_domain (T@U) T@U)
(declare-fun |Set#Subset| (T@U T@U) Bool)
(declare-fun ZeroPMask () T@U)
(declare-fun |Seq#SkolemDiff| (T@U T@U) Int)
(declare-fun map_domain (T@U) T@U)
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
(assert  (and (and (and (and (and (and (and (forall ((arg0@@11 T@T) (arg1 T@T) ) (! (= (Ctor (FieldType arg0@@11 arg1)) 6)
 :qid |ctor:FieldType|
)) (forall ((arg0@@12 T@T) (arg1@@0 T@T) ) (! (= (FieldTypeInv0 (FieldType arg0@@12 arg1@@0)) arg0@@12)
 :qid |typeInv:FieldTypeInv0|
 :pattern ( (FieldType arg0@@12 arg1@@0))
))) (forall ((arg0@@13 T@T) (arg1@@1 T@T) ) (! (= (FieldTypeInv1 (FieldType arg0@@13 arg1@@1)) arg1@@1)
 :qid |typeInv:FieldTypeInv1|
 :pattern ( (FieldType arg0@@13 arg1@@1))
))) (= (Ctor NormalFieldType) 7)) (= (type $allocated) (FieldType NormalFieldType boolType))) (= (type val) (FieldType NormalFieldType intType))) (= (Ctor IEdgesDomainTypeType) 8)) (= (type edges) (FieldType NormalFieldType IEdgesDomainTypeType))))
(assert (distinct $allocated val edges)
)
(assert  (and (and (forall ((arg0@@14 T@T) ) (! (= (Ctor (SeqType arg0@@14)) 9)
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
 :qid |stdinbpl.403:18|
 :skolemid |38|
 :pattern ( (|Seq#Length| (|Seq#Drop| s n)))
 :pattern ( (|Seq#Length| s) (|Seq#Drop| s n))
)))
(assert  (and (and (and (and (and (and (forall ((arg0@@17 T@T) ) (! (= (Ctor (MapType0Type arg0@@17)) 10)
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
))) (forall ((m T@U) (x0 T@U) (x1 T@U) (val@@0 T@U) ) (! (let ((B@@0 (FieldTypeInv1 (type x1))))
 (=> (= (type val@@0) B@@0) (= (MapType0Select (MapType0Store m x0 x1 val@@0) x0 x1) val@@0)))
 :qid |mapAx0:MapType0Select|
 :weight 0
))) (and (and (forall ((val@@1 T@U) (m@@0 T@U) (x0@@0 T@U) (x1@@0 T@U) (y0 T@U) (y1 T@U) ) (!  (or (= x0@@0 y0) (= (MapType0Select (MapType0Store m@@0 x0@@0 x1@@0 val@@1) y0 y1) (MapType0Select m@@0 y0 y1)))
 :qid |mapAx1:MapType0Select:0|
 :weight 0
)) (forall ((val@@2 T@U) (m@@1 T@U) (x0@@1 T@U) (x1@@1 T@U) (y0@@0 T@U) (y1@@0 T@U) ) (!  (or (= x1@@1 y1@@0) (= (MapType0Select (MapType0Store m@@1 x0@@1 x1@@1 val@@2) y0@@0 y1@@0) (MapType0Select m@@1 y0@@0 y1@@0)))
 :qid |mapAx1:MapType0Select:1|
 :weight 0
))) (forall ((val@@3 T@U) (m@@2 T@U) (x0@@2 T@U) (x1@@2 T@U) (y0@@1 T@U) (y1@@1 T@U) ) (!  (or true (= (MapType0Select (MapType0Store m@@2 x0@@2 x1@@2 val@@3) y0@@1 y1@@1) (MapType0Select m@@2 y0@@1 y1@@1)))
 :qid |mapAx2:MapType0Select|
 :weight 0
)))) (= (Ctor RefType) 11)))
(assert (forall ((Heap0 T@U) (Heap1 T@U) ) (!  (=> (and (and (= (type Heap0) (MapType0Type RefType)) (= (type Heap1) (MapType0Type RefType))) (succHeap Heap0 Heap1)) (succHeapTrans Heap0 Heap1))
 :qid |stdinbpl.88:15|
 :skolemid |11|
 :pattern ( (succHeap Heap0 Heap1))
)))
(assert (forall ((arg0@@21 T@U) (arg1@@5 Int) (arg2@@1 T@U) ) (! (= (type (insert_edge arg0@@21 arg1@@5 arg2@@1)) IEdgesDomainTypeType)
 :qid |funType:insert_edge|
 :pattern ( (insert_edge arg0@@21 arg1@@5 arg2@@1))
)))
(assert (forall ((e_1 T@U) (i_1 Int) (node_1 T@U) ) (!  (=> (and (= (type e_1) IEdgesDomainTypeType) (= (type node_1) RefType)) (has_edge (insert_edge e_1 i_1 node_1) i_1))
 :qid |stdinbpl.895:15|
 :skolemid |120|
 :pattern ( (has_edge (insert_edge e_1 i_1 node_1) i_1))
)))
(assert  (and (= (Ctor INodeMapDomainTypeType) 12) (forall ((arg0@@22 T@U) (arg1@@6 T@U) (arg2@@2 T@U) ) (! (= (type (insert arg0@@22 arg1@@6 arg2@@2)) INodeMapDomainTypeType)
 :qid |funType:insert|
 :pattern ( (insert arg0@@22 arg1@@6 arg2@@2))
))))
(assert (forall ((node_map_1 T@U) (key_node_1 T@U) (val_node_1 T@U) ) (!  (=> (and (and (= (type node_map_1) INodeMapDomainTypeType) (= (type key_node_1) RefType)) (= (type val_node_1) RefType)) (has_node (insert node_map_1 key_node_1 val_node_1) key_node_1))
 :qid |stdinbpl.953:15|
 :skolemid |126|
 :pattern ( (has_node (insert node_map_1 key_node_1 val_node_1) key_node_1))
)))
(assert  (and (and (and (and (forall ((arg0@@23 T@T) ) (! (= (Ctor (MultiSetType arg0@@23)) 13)
 :qid |ctor:MultiSetType|
)) (forall ((arg0@@24 T@T) ) (! (= (MultiSetTypeInv0 (MultiSetType arg0@@24)) arg0@@24)
 :qid |typeInv:MultiSetTypeInv0|
 :pattern ( (MultiSetType arg0@@24))
))) (forall ((arg0@@25 T@U) (arg1@@7 T@U) ) (! (let ((T@@1 (MultiSetTypeInv0 (type arg0@@25))))
(= (type (|MultiSet#Difference| arg0@@25 arg1@@7)) (MultiSetType T@@1)))
 :qid |funType:MultiSet#Difference|
 :pattern ( (|MultiSet#Difference| arg0@@25 arg1@@7))
))) (forall ((arg0@@26 T@U) (arg1@@8 T@U) ) (! (let ((T@@2 (MultiSetTypeInv0 (type arg0@@26))))
(= (type (|MultiSet#Intersection| arg0@@26 arg1@@8)) (MultiSetType T@@2)))
 :qid |funType:MultiSet#Intersection|
 :pattern ( (|MultiSet#Intersection| arg0@@26 arg1@@8))
))) (forall ((arg0@@27 T@U) (arg1@@9 T@U) ) (! (let ((T@@3 (MultiSetTypeInv0 (type arg0@@27))))
(= (type (|MultiSet#Union| arg0@@27 arg1@@9)) (MultiSetType T@@3)))
 :qid |funType:MultiSet#Union|
 :pattern ( (|MultiSet#Union| arg0@@27 arg1@@9))
))))
(assert (forall ((a T@U) (b T@U) ) (! (let ((T@@4 (MultiSetTypeInv0 (type a))))
 (=> (and (= (type a) (MultiSetType T@@4)) (= (type b) (MultiSetType T@@4))) (and (= (+ (+ (|MultiSet#Card| (|MultiSet#Difference| a b)) (|MultiSet#Card| (|MultiSet#Difference| b a))) (* 2 (|MultiSet#Card| (|MultiSet#Intersection| a b)))) (|MultiSet#Card| (|MultiSet#Union| a b))) (= (|MultiSet#Card| (|MultiSet#Difference| a b)) (- (|MultiSet#Card| a) (|MultiSet#Card| (|MultiSet#Intersection| a b)))))))
 :qid |stdinbpl.835:18|
 :skolemid |110|
 :pattern ( (|MultiSet#Card| (|MultiSet#Difference| a b)))
)))
(assert  (and (and (and (and (and (and (forall ((arg0@@28 T@T) (arg1@@10 T@T) ) (! (= (Ctor (MapType1Type arg0@@28 arg1@@10)) 14)
 :qid |ctor:MapType1Type|
)) (forall ((arg0@@29 T@T) (arg1@@11 T@T) ) (! (= (MapType1TypeInv0 (MapType1Type arg0@@29 arg1@@11)) arg0@@29)
 :qid |typeInv:MapType1TypeInv0|
 :pattern ( (MapType1Type arg0@@29 arg1@@11))
))) (forall ((arg0@@30 T@T) (arg1@@12 T@T) ) (! (= (MapType1TypeInv1 (MapType1Type arg0@@30 arg1@@12)) arg1@@12)
 :qid |typeInv:MapType1TypeInv1|
 :pattern ( (MapType1Type arg0@@30 arg1@@12))
))) (forall ((arg0@@31 T@U) (arg1@@13 T@U) (arg2@@3 T@U) ) (! (let ((aVar1 (MapType1TypeInv1 (type arg0@@31))))
(= (type (MapType1Select arg0@@31 arg1@@13 arg2@@3)) aVar1))
 :qid |funType:MapType1Select|
 :pattern ( (MapType1Select arg0@@31 arg1@@13 arg2@@3))
))) (forall ((arg0@@32 T@U) (arg1@@14 T@U) (arg2@@4 T@U) (arg3@@0 T@U) ) (! (let ((aVar1@@0 (type arg3@@0)))
(let ((aVar0@@0 (type arg1@@14)))
(= (type (MapType1Store arg0@@32 arg1@@14 arg2@@4 arg3@@0)) (MapType1Type aVar0@@0 aVar1@@0))))
 :qid |funType:MapType1Store|
 :pattern ( (MapType1Store arg0@@32 arg1@@14 arg2@@4 arg3@@0))
))) (forall ((m@@3 T@U) (x0@@3 T@U) (x1@@3 T@U) (val@@4 T@U) ) (! (let ((aVar1@@1 (MapType1TypeInv1 (type m@@3))))
 (=> (= (type val@@4) aVar1@@1) (= (MapType1Select (MapType1Store m@@3 x0@@3 x1@@3 val@@4) x0@@3 x1@@3) val@@4)))
 :qid |mapAx0:MapType1Select|
 :weight 0
))) (and (and (forall ((val@@5 T@U) (m@@4 T@U) (x0@@4 T@U) (x1@@4 T@U) (y0@@2 T@U) (y1@@2 T@U) ) (!  (or (= x0@@4 y0@@2) (= (MapType1Select (MapType1Store m@@4 x0@@4 x1@@4 val@@5) y0@@2 y1@@2) (MapType1Select m@@4 y0@@2 y1@@2)))
 :qid |mapAx1:MapType1Select:0|
 :weight 0
)) (forall ((val@@6 T@U) (m@@5 T@U) (x0@@5 T@U) (x1@@5 T@U) (y0@@3 T@U) (y1@@3 T@U) ) (!  (or (= x1@@5 y1@@3) (= (MapType1Select (MapType1Store m@@5 x0@@5 x1@@5 val@@6) y0@@3 y1@@3) (MapType1Select m@@5 y0@@3 y1@@3)))
 :qid |mapAx1:MapType1Select:1|
 :weight 0
))) (forall ((val@@7 T@U) (m@@6 T@U) (x0@@6 T@U) (x1@@6 T@U) (y0@@4 T@U) (y1@@4 T@U) ) (!  (or true (= (MapType1Select (MapType1Store m@@6 x0@@6 x1@@6 val@@7) y0@@4 y1@@4) (MapType1Select m@@6 y0@@4 y1@@4)))
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
 :qid |stdinbpl.766:15|
 :skolemid |89|
 :pattern ( (|Math#min| a@@0 b@@0))
)))
(assert (forall ((arg0@@33 T@U) (arg1@@15 Int) ) (! (let ((T@@5 (SeqTypeInv0 (type arg0@@33))))
(= (type (|Seq#Index| arg0@@33 arg1@@15)) T@@5))
 :qid |funType:Seq#Index|
 :pattern ( (|Seq#Index| arg0@@33 arg1@@15))
)))
(assert (forall ((s@@0 T@U) (n@@0 Int) (j Int) ) (! (let ((T@@6 (SeqTypeInv0 (type s@@0))))
 (=> (= (type s@@0) (SeqType T@@6)) (=> (and (and (< 0 n@@0) (<= 0 j)) (< j (- (|Seq#Length| s@@0) n@@0))) (and (= (|Seq#Sub| (|Seq#Add| j n@@0) n@@0) j) (= (|Seq#Index| (|Seq#Drop| s@@0 n@@0) j) (|Seq#Index| s@@0 (|Seq#Add| j n@@0)))))))
 :qid |stdinbpl.424:18|
 :skolemid |39|
 :pattern ( (|Seq#Index| (|Seq#Drop| s@@0 n@@0) j))
)))
(assert  (and (and (= (Ctor FrameTypeType) 15) (= (type null) RefType)) (forall ((arg0@@34 T@U) ) (! (let ((A (FieldTypeInv0 (type arg0@@34))))
(= (type (PredicateMaskField arg0@@34)) (FieldType A (MapType1Type RefType boolType))))
 :qid |funType:PredicateMaskField|
 :pattern ( (PredicateMaskField arg0@@34))
))))
(assert (forall ((Heap@@0 T@U) (ExhaleHeap T@U) (Mask@@0 T@U) (pm_f T@U) ) (! (let ((C (FieldTypeInv0 (type pm_f))))
 (=> (and (and (and (and (and (= (type Heap@@0) (MapType0Type RefType)) (= (type ExhaleHeap) (MapType0Type RefType))) (= (type Mask@@0) (MapType1Type RefType realType))) (= (type pm_f) (FieldType C FrameTypeType))) (IdenticalOnKnownLocations Heap@@0 ExhaleHeap Mask@@0)) (and (HasDirectPerm Mask@@0 null pm_f) (IsPredicateField pm_f))) (= (MapType0Select Heap@@0 null (PredicateMaskField pm_f)) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))))
 :qid |stdinbpl.47:19|
 :skolemid |2|
 :pattern ( (IdenticalOnKnownLocations Heap@@0 ExhaleHeap Mask@@0) (IsPredicateField pm_f) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))
)))
(assert (forall ((arg0@@35 T@U) ) (! (let ((A@@0 (FieldTypeInv0 (type arg0@@35))))
(= (type (WandMaskField arg0@@35)) (FieldType A@@0 (MapType1Type RefType boolType))))
 :qid |funType:WandMaskField|
 :pattern ( (WandMaskField arg0@@35))
)))
(assert (forall ((Heap@@1 T@U) (ExhaleHeap@@0 T@U) (Mask@@1 T@U) (pm_f@@0 T@U) ) (! (let ((C@@0 (FieldTypeInv0 (type pm_f@@0))))
 (=> (and (and (and (and (and (= (type Heap@@1) (MapType0Type RefType)) (= (type ExhaleHeap@@0) (MapType0Type RefType))) (= (type Mask@@1) (MapType1Type RefType realType))) (= (type pm_f@@0) (FieldType C@@0 FrameTypeType))) (IdenticalOnKnownLocations Heap@@1 ExhaleHeap@@0 Mask@@1)) (and (HasDirectPerm Mask@@1 null pm_f@@0) (IsWandField pm_f@@0))) (= (MapType0Select Heap@@1 null (WandMaskField pm_f@@0)) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))))
 :qid |stdinbpl.60:19|
 :skolemid |5|
 :pattern ( (IdenticalOnKnownLocations Heap@@1 ExhaleHeap@@0 Mask@@1) (IsWandField pm_f@@0) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))
)))
(assert (forall ((arg0@@36 T@U) (arg1@@16 Int) (arg2@@5 T@U) ) (! (let ((T@@7 (type arg2@@5)))
(= (type (|Seq#Update| arg0@@36 arg1@@16 arg2@@5)) (SeqType T@@7)))
 :qid |funType:Seq#Update|
 :pattern ( (|Seq#Update| arg0@@36 arg1@@16 arg2@@5))
)))
(assert (forall ((s@@1 T@U) (i Int) (v T@U) (n@@1 Int) ) (! (let ((T@@8 (type v)))
 (=> (= (type s@@1) (SeqType T@@8)) (=> (and (<= 0 n@@1) (< n@@1 (|Seq#Length| s@@1))) (and (=> (= i n@@1) (= (|Seq#Index| (|Seq#Update| s@@1 i v) n@@1) v)) (=> (not (= i n@@1)) (= (|Seq#Index| (|Seq#Update| s@@1 i v) n@@1) (|Seq#Index| s@@1 n@@1)))))))
 :qid |stdinbpl.379:18|
 :skolemid |35|
 :pattern ( (|Seq#Index| (|Seq#Update| s@@1 i v) n@@1))
 :pattern ( (|Seq#Index| s@@1 n@@1) (|Seq#Update| s@@1 i v))
)))
(assert (forall ((a@@1 T@U) (b@@1 T@U) (y@@1 T@U) ) (! (let ((T@@9 (type y@@1)))
 (=> (and (and (= (type a@@1) (MultiSetType T@@9)) (= (type b@@1) (MultiSetType T@@9))) (<= (|MultiSet#Select| a@@1 y@@1) (|MultiSet#Select| b@@1 y@@1))) (= (|MultiSet#Select| (|MultiSet#Difference| a@@1 b@@1) y@@1) 0)))
 :qid |stdinbpl.833:18|
 :skolemid |109|
 :pattern ( (|MultiSet#Difference| a@@1 b@@1) (|MultiSet#Select| b@@1 y@@1) (|MultiSet#Select| a@@1 y@@1))
)))
(assert  (and (and (and (and (and (and (and (forall ((arg0@@37 T@T) (arg1@@17 T@T) ) (! (= (Ctor (MapType2Type arg0@@37 arg1@@17)) 16)
 :qid |ctor:MapType2Type|
)) (forall ((arg0@@38 T@T) (arg1@@18 T@T) ) (! (= (MapType2TypeInv0 (MapType2Type arg0@@38 arg1@@18)) arg0@@38)
 :qid |typeInv:MapType2TypeInv0|
 :pattern ( (MapType2Type arg0@@38 arg1@@18))
))) (forall ((arg0@@39 T@T) (arg1@@19 T@T) ) (! (= (MapType2TypeInv1 (MapType2Type arg0@@39 arg1@@19)) arg1@@19)
 :qid |typeInv:MapType2TypeInv1|
 :pattern ( (MapType2Type arg0@@39 arg1@@19))
))) (forall ((arg0@@40 T@U) (arg1@@20 T@U) ) (! (let ((aVar1@@2 (MapType2TypeInv1 (type arg0@@40))))
(= (type (MapType2Select arg0@@40 arg1@@20)) aVar1@@2))
 :qid |funType:MapType2Select|
 :pattern ( (MapType2Select arg0@@40 arg1@@20))
))) (forall ((arg0@@41 T@U) (arg1@@21 T@U) (arg2@@6 T@U) ) (! (let ((aVar1@@3 (type arg2@@6)))
(let ((aVar0@@1 (type arg1@@21)))
(= (type (MapType2Store arg0@@41 arg1@@21 arg2@@6)) (MapType2Type aVar0@@1 aVar1@@3))))
 :qid |funType:MapType2Store|
 :pattern ( (MapType2Store arg0@@41 arg1@@21 arg2@@6))
))) (forall ((m@@7 T@U) (x0@@7 T@U) (val@@8 T@U) ) (! (let ((aVar1@@4 (MapType2TypeInv1 (type m@@7))))
 (=> (= (type val@@8) aVar1@@4) (= (MapType2Select (MapType2Store m@@7 x0@@7 val@@8) x0@@7) val@@8)))
 :qid |mapAx0:MapType2Select|
 :weight 0
))) (and (forall ((val@@9 T@U) (m@@8 T@U) (x0@@8 T@U) (y0@@5 T@U) ) (!  (or (= x0@@8 y0@@5) (= (MapType2Select (MapType2Store m@@8 x0@@8 val@@9) y0@@5) (MapType2Select m@@8 y0@@5)))
 :qid |mapAx1:MapType2Select:0|
 :weight 0
)) (forall ((val@@10 T@U) (m@@9 T@U) (x0@@9 T@U) (y0@@6 T@U) ) (!  (or true (= (MapType2Select (MapType2Store m@@9 x0@@9 val@@10) y0@@6) (MapType2Select m@@9 y0@@6)))
 :qid |mapAx2:MapType2Select|
 :weight 0
)))) (forall ((arg0@@42 T@U) (arg1@@22 T@U) ) (! (let ((T@@10 (MapType2TypeInv0 (type arg0@@42))))
(= (type (|Set#Union| arg0@@42 arg1@@22)) (MapType2Type T@@10 boolType)))
 :qid |funType:Set#Union|
 :pattern ( (|Set#Union| arg0@@42 arg1@@22))
))))
(assert (forall ((a@@2 T@U) (b@@2 T@U) ) (! (let ((T@@11 (MapType2TypeInv0 (type a@@2))))
 (=> (and (= (type a@@2) (MapType2Type T@@11 boolType)) (= (type b@@2) (MapType2Type T@@11 boolType))) (= (|Set#Union| (|Set#Union| a@@2 b@@2) b@@2) (|Set#Union| a@@2 b@@2))))
 :qid |stdinbpl.718:18|
 :skolemid |74|
 :pattern ( (|Set#Union| (|Set#Union| a@@2 b@@2) b@@2))
)))
(assert (forall ((arg0@@43 T@U) (arg1@@23 T@U) ) (! (let ((T@@12 (MapType2TypeInv0 (type arg0@@43))))
(= (type (|Set#Intersection| arg0@@43 arg1@@23)) (MapType2Type T@@12 boolType)))
 :qid |funType:Set#Intersection|
 :pattern ( (|Set#Intersection| arg0@@43 arg1@@23))
)))
(assert (forall ((a@@3 T@U) (b@@3 T@U) ) (! (let ((T@@13 (MapType2TypeInv0 (type a@@3))))
 (=> (and (= (type a@@3) (MapType2Type T@@13 boolType)) (= (type b@@3) (MapType2Type T@@13 boolType))) (= (|Set#Intersection| (|Set#Intersection| a@@3 b@@3) b@@3) (|Set#Intersection| a@@3 b@@3))))
 :qid |stdinbpl.722:18|
 :skolemid |76|
 :pattern ( (|Set#Intersection| (|Set#Intersection| a@@3 b@@3) b@@3))
)))
(assert (forall ((a@@4 T@U) (b@@4 T@U) ) (! (let ((T@@14 (MultiSetTypeInv0 (type a@@4))))
 (=> (and (= (type a@@4) (MultiSetType T@@14)) (= (type b@@4) (MultiSetType T@@14))) (= (|MultiSet#Intersection| (|MultiSet#Intersection| a@@4 b@@4) b@@4) (|MultiSet#Intersection| a@@4 b@@4))))
 :qid |stdinbpl.824:18|
 :skolemid |106|
 :pattern ( (|MultiSet#Intersection| (|MultiSet#Intersection| a@@4 b@@4) b@@4))
)))
(assert (forall ((arg0@@44 T@U) ) (! (let ((T@@15 (type arg0@@44)))
(= (type (|Set#Singleton| arg0@@44)) (MapType2Type T@@15 boolType)))
 :qid |funType:Set#Singleton|
 :pattern ( (|Set#Singleton| arg0@@44))
)))
(assert (forall ((r T@U) (o T@U) ) (! (let ((T@@16 (type r)))
 (=> (= (type o) T@@16) (= (U_2_bool (MapType2Select (|Set#Singleton| r) o)) (= r o))))
 :qid |stdinbpl.687:18|
 :skolemid |63|
 :pattern ( (MapType2Select (|Set#Singleton| r) o))
)))
(assert (forall ((arg0@@45 T@U) (arg1@@24 Int) ) (! (let ((T@@17 (SeqTypeInv0 (type arg0@@45))))
(= (type (|Seq#Take| arg0@@45 arg1@@24)) (SeqType T@@17)))
 :qid |funType:Seq#Take|
 :pattern ( (|Seq#Take| arg0@@45 arg1@@24))
)))
(assert (forall ((s@@2 T@U) (n@@2 Int) ) (! (let ((T@@18 (SeqTypeInv0 (type s@@2))))
 (=> (= (type s@@2) (SeqType T@@18)) (and (=> (<= 0 n@@2) (and (=> (<= n@@2 (|Seq#Length| s@@2)) (= (|Seq#Length| (|Seq#Take| s@@2 n@@2)) n@@2)) (=> (< (|Seq#Length| s@@2) n@@2) (= (|Seq#Length| (|Seq#Take| s@@2 n@@2)) (|Seq#Length| s@@2))))) (=> (< n@@2 0) (= (|Seq#Length| (|Seq#Take| s@@2 n@@2)) 0)))))
 :qid |stdinbpl.390:18|
 :skolemid |36|
 :pattern ( (|Seq#Length| (|Seq#Take| s@@2 n@@2)))
 :pattern ( (|Seq#Take| s@@2 n@@2) (|Seq#Length| s@@2))
)))
(assert (forall ((arg0@@46 Int) (arg1@@25 Int) ) (! (= (type (|Seq#Range| arg0@@46 arg1@@25)) (SeqType intType))
 :qid |funType:Seq#Range|
 :pattern ( (|Seq#Range| arg0@@46 arg1@@25))
)))
(assert (forall ((q@min Int) (q@max Int) (v@@0 T@U) ) (!  (=> (= (type v@@0) intType) (= (|Seq#Contains| (|Seq#Range| q@min q@max) v@@0)  (and (<= q@min (U_2_int v@@0)) (< (U_2_int v@@0) q@max))))
 :qid |stdinbpl.663:15|
 :skolemid |57|
 :pattern ( (|Seq#Contains| (|Seq#Range| q@min q@max) v@@0))
)))
(assert (forall ((a@@5 T@U) (b@@5 T@U) ) (! (let ((T@@19 (MapType2TypeInv0 (type a@@5))))
 (=> (and (= (type a@@5) (MapType2Type T@@19 boolType)) (= (type b@@5) (MapType2Type T@@19 boolType))) (= (+ (|Set#Card| (|Set#Union| a@@5 b@@5)) (|Set#Card| (|Set#Intersection| a@@5 b@@5))) (+ (|Set#Card| a@@5) (|Set#Card| b@@5)))))
 :qid |stdinbpl.726:18|
 :skolemid |78|
 :pattern ( (|Set#Card| (|Set#Union| a@@5 b@@5)))
 :pattern ( (|Set#Card| (|Set#Intersection| a@@5 b@@5)))
)))
(assert (forall ((s@@3 T@U) (x@@8 T@U) ) (! (let ((T@@20 (type x@@8)))
 (=> (and (= (type s@@3) (SeqType T@@20)) (|Seq#Contains| s@@3 x@@8)) (and (and (<= 0 (|Seq#Skolem| s@@3 x@@8)) (< (|Seq#Skolem| s@@3 x@@8) (|Seq#Length| s@@3))) (= (|Seq#Index| s@@3 (|Seq#Skolem| s@@3 x@@8)) x@@8))))
 :qid |stdinbpl.521:18|
 :skolemid |47|
 :pattern ( (|Seq#Contains| s@@3 x@@8))
)))
(assert (forall ((Heap@@2 T@U) (ExhaleHeap@@1 T@U) (Mask@@2 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@2) (MapType0Type RefType)) (= (type ExhaleHeap@@1) (MapType0Type RefType))) (= (type Mask@@2) (MapType1Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@2 ExhaleHeap@@1 Mask@@2)) (U_2_bool (MapType0Select Heap@@2 o_1 $allocated))) (U_2_bool (MapType0Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.73:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@2 ExhaleHeap@@1 Mask@@2) (MapType0Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert (forall ((s@@4 T@U) (n@@3 Int) ) (! (let ((T@@21 (SeqTypeInv0 (type s@@4))))
 (=> (and (= (type s@@4) (SeqType T@@21)) (<= n@@3 0)) (= (|Seq#Drop| s@@4 n@@3) s@@4)))
 :qid |stdinbpl.505:18|
 :skolemid |45|
 :pattern ( (|Seq#Drop| s@@4 n@@3))
)))
(assert (forall ((i@@0 Int) (j@@0 Int) ) (! (= (|Seq#Sub| i@@0 j@@0) (- i@@0 j@@0))
 :qid |stdinbpl.359:15|
 :skolemid |30|
 :pattern ( (|Seq#Sub| i@@0 j@@0))
)))
(assert (forall ((i@@1 Int) (j@@1 Int) ) (! (= (|Seq#Add| i@@1 j@@1) (+ i@@1 j@@1))
 :qid |stdinbpl.357:15|
 :skolemid |29|
 :pattern ( (|Seq#Add| i@@1 j@@1))
)))
(assert (forall ((a@@6 Int) ) (!  (=> (<= 0 a@@6) (= (|Math#clip| a@@6) a@@6))
 :qid |stdinbpl.769:15|
 :skolemid |90|
 :pattern ( (|Math#clip| a@@6))
)))
(assert (forall ((a@@7 T@U) (b@@6 T@U) (o@@0 T@U) ) (! (let ((T@@22 (type o@@0)))
 (=> (and (= (type a@@7) (MultiSetType T@@22)) (= (type b@@6) (MultiSetType T@@22))) (= (|MultiSet#Select| (|MultiSet#Intersection| a@@7 b@@6) o@@0) (|Math#min| (|MultiSet#Select| a@@7 o@@0) (|MultiSet#Select| b@@6 o@@0)))))
 :qid |stdinbpl.820:18|
 :skolemid |105|
 :pattern ( (|MultiSet#Select| (|MultiSet#Intersection| a@@7 b@@6) o@@0))
)))
(assert (forall ((arg0@@47 T@U) ) (! (let ((T@@23 (type arg0@@47)))
(= (type (|Seq#Singleton| arg0@@47)) (SeqType T@@23)))
 :qid |funType:Seq#Singleton|
 :pattern ( (|Seq#Singleton| arg0@@47))
)))
(assert (forall ((x@@9 T@U) (y@@2 T@U) ) (! (let ((T@@24 (type x@@9)))
 (=> (= (type y@@2) T@@24) (= (|Seq#Contains| (|Seq#Singleton| x@@9) y@@2) (= x@@9 y@@2))))
 :qid |stdinbpl.646:18|
 :skolemid |54|
 :pattern ( (|Seq#Contains| (|Seq#Singleton| x@@9) y@@2))
)))
(assert (forall ((s@@5 T@U) (n@@4 Int) (j@@2 Int) ) (! (let ((T@@25 (SeqTypeInv0 (type s@@5))))
 (=> (= (type s@@5) (SeqType T@@25)) (=> (and (and (<= 0 j@@2) (< j@@2 n@@4)) (< j@@2 (|Seq#Length| s@@5))) (= (|Seq#Index| (|Seq#Take| s@@5 n@@4) j@@2) (|Seq#Index| s@@5 j@@2)))))
 :qid |stdinbpl.398:18|
 :skolemid |37|
 :pattern ( (|Seq#Index| (|Seq#Take| s@@5 n@@4) j@@2))
 :pattern ( (|Seq#Index| s@@5 j@@2) (|Seq#Take| s@@5 n@@4))
)))
(assert (forall ((Heap@@3 T@U) (ExhaleHeap@@2 T@U) (Mask@@3 T@U) (o_1@@0 T@U) (f_2 T@U) ) (! (let ((B@@1 (FieldTypeInv1 (type f_2))))
(let ((A@@1 (FieldTypeInv0 (type f_2))))
 (=> (and (and (and (and (and (and (= (type Heap@@3) (MapType0Type RefType)) (= (type ExhaleHeap@@2) (MapType0Type RefType))) (= (type Mask@@3) (MapType1Type RefType realType))) (= (type o_1@@0) RefType)) (= (type f_2) (FieldType A@@1 B@@1))) (IdenticalOnKnownLocations Heap@@3 ExhaleHeap@@2 Mask@@3)) (HasDirectPerm Mask@@3 o_1@@0 f_2)) (= (MapType0Select Heap@@3 o_1@@0 f_2) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2)))))
 :qid |stdinbpl.42:22|
 :skolemid |1|
 :pattern ( (IdenticalOnKnownLocations Heap@@3 ExhaleHeap@@2 Mask@@3) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2))
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
(assert (forall ((arg0@@48 T@U) (arg1@@26 T@U) ) (! (let ((T@@28 (type arg1@@26)))
(= (type (|MultiSet#UnionOne| arg0@@48 arg1@@26)) (MultiSetType T@@28)))
 :qid |funType:MultiSet#UnionOne|
 :pattern ( (|MultiSet#UnionOne| arg0@@48 arg1@@26))
)))
(assert (forall ((a@@8 T@U) (x@@10 T@U) ) (! (let ((T@@29 (type x@@10)))
 (=> (= (type a@@8) (MultiSetType T@@29)) (= (|MultiSet#Card| (|MultiSet#UnionOne| a@@8 x@@10)) (+ (|MultiSet#Card| a@@8) 1))))
 :qid |stdinbpl.806:18|
 :skolemid |101|
 :pattern ( (|MultiSet#Card| (|MultiSet#UnionOne| a@@8 x@@10)))
 :pattern ( (|MultiSet#UnionOne| a@@8 x@@10) (|MultiSet#Card| a@@8))
)))
(assert (forall ((a@@9 T@U) (b@@7 T@U) ) (! (let ((T@@30 (MultiSetTypeInv0 (type a@@9))))
 (=> (and (= (type a@@9) (MultiSetType T@@30)) (= (type b@@7) (MultiSetType T@@30))) (= (|MultiSet#Disjoint| a@@9 b@@7) (forall ((o@@1 T@U) ) (!  (=> (= (type o@@1) T@@30) (or (= (|MultiSet#Select| a@@9 o@@1) 0) (= (|MultiSet#Select| b@@7 o@@1) 0)))
 :qid |stdinbpl.856:39|
 :skolemid |116|
 :pattern ( (|MultiSet#Select| a@@9 o@@1))
 :pattern ( (|MultiSet#Select| b@@7 o@@1))
)))))
 :qid |stdinbpl.855:18|
 :skolemid |117|
 :pattern ( (|MultiSet#Disjoint| a@@9 b@@7))
)))
(assert (forall ((p T@U) (v_1 T@U) (w T@U) ) (! (let ((A@@2 (FieldTypeInv0 (type p))))
 (=> (and (and (= (type p) (FieldType A@@2 FrameTypeType)) (= (type v_1) FrameTypeType)) (= (type w) FrameTypeType)) (not (InsidePredicate p v_1 p w))))
 :qid |stdinbpl.302:19|
 :skolemid |21|
 :pattern ( (InsidePredicate p v_1 p w))
)))
(assert (forall ((arg0@@49 T@U) (arg1@@27 T@U) ) (! (let ((T@@31 (SeqTypeInv0 (type arg0@@49))))
(= (type (|Seq#Append| arg0@@49 arg1@@27)) (SeqType T@@31)))
 :qid |funType:Seq#Append|
 :pattern ( (|Seq#Append| arg0@@49 arg1@@27))
)))
(assert (forall ((s0 T@U) (s1 T@U) (n@@5 Int) ) (! (let ((T@@32 (SeqTypeInv0 (type s0))))
 (=> (and (= (type s0) (SeqType T@@32)) (= (type s1) (SeqType T@@32))) (=> (and (and (and (not (= s0 (|Seq#Empty| T@@32))) (not (= s1 (|Seq#Empty| T@@32)))) (<= (|Seq#Length| s0) n@@5)) (< n@@5 (|Seq#Length| (|Seq#Append| s0 s1)))) (and (= (|Seq#Add| (|Seq#Sub| n@@5 (|Seq#Length| s0)) (|Seq#Length| s0)) n@@5) (= (|Seq#Index| (|Seq#Append| s0 s1) n@@5) (|Seq#Index| s1 (|Seq#Sub| n@@5 (|Seq#Length| s0))))))))
 :qid |stdinbpl.370:18|
 :skolemid |32|
 :pattern ( (|Seq#Index| (|Seq#Append| s0 s1) n@@5))
)))
(assert (forall ((arg0@@50 T@U) ) (! (let ((T@@33 (type arg0@@50)))
(= (type (|MultiSet#Singleton| arg0@@50)) (MultiSetType T@@33)))
 :qid |funType:MultiSet#Singleton|
 :pattern ( (|MultiSet#Singleton| arg0@@50))
)))
(assert (forall ((r@@0 T@U) ) (!  (and (= (|MultiSet#Card| (|MultiSet#Singleton| r@@0)) 1) (= (|MultiSet#Select| (|MultiSet#Singleton| r@@0) r@@0) 1))
 :qid |stdinbpl.798:18|
 :skolemid |98|
 :pattern ( (|MultiSet#Singleton| r@@0))
)))
(assert  (not (IsPredicateField val)))
(assert  (not (IsWandField val)))
(assert  (not (IsPredicateField edges)))
(assert  (not (IsWandField edges)))
(assert (forall ((Heap@@4 T@U) (ExhaleHeap@@3 T@U) (Mask@@4 T@U) ) (!  (=> (and (and (and (= (type Heap@@4) (MapType0Type RefType)) (= (type ExhaleHeap@@3) (MapType0Type RefType))) (= (type Mask@@4) (MapType1Type RefType realType))) (IdenticalOnKnownLocations Heap@@4 ExhaleHeap@@3 Mask@@4)) (succHeap Heap@@4 ExhaleHeap@@3))
 :qid |stdinbpl.83:15|
 :skolemid |10|
 :pattern ( (IdenticalOnKnownLocations Heap@@4 ExhaleHeap@@3 Mask@@4))
)))
(assert (forall ((arg0@@51 T@U) (arg1@@28 Int) ) (! (= (type (edge_lookup arg0@@51 arg1@@28)) RefType)
 :qid |funType:edge_lookup|
 :pattern ( (edge_lookup arg0@@51 arg1@@28))
)))
(assert (forall ((e_1@@0 T@U) (i_1@@0 Int) ) (!  (=> (= (type e_1@@0) IEdgesDomainTypeType) (= (has_edge e_1@@0 i_1@@0) (not (= (edge_lookup e_1@@0 i_1@@0) null))))
 :qid |stdinbpl.901:15|
 :skolemid |121|
 :pattern ( (has_edge e_1@@0 i_1@@0))
 :pattern ( (edge_lookup e_1@@0 i_1@@0))
)))
(assert (forall ((arg0@@52 T@U) (arg1@@29 T@U) ) (! (= (type (lookup arg0@@52 arg1@@29)) RefType)
 :qid |funType:lookup|
 :pattern ( (lookup arg0@@52 arg1@@29))
)))
(assert (forall ((node_map_1@@0 T@U) (node_1@@0 T@U) ) (!  (=> (and (= (type node_map_1@@0) INodeMapDomainTypeType) (= (type node_1@@0) RefType)) (= (has_node node_map_1@@0 node_1@@0) (not (= (lookup node_map_1@@0 node_1@@0) null))))
 :qid |stdinbpl.959:15|
 :skolemid |127|
 :pattern ( (has_node node_map_1@@0 node_1@@0))
 :pattern ( (lookup node_map_1@@0 node_1@@0))
)))
(assert (forall ((a@@10 T@U) (b@@8 T@U) ) (! (let ((T@@34 (MapType2TypeInv0 (type a@@10))))
 (=> (and (= (type a@@10) (MapType2Type T@@34 boolType)) (= (type b@@8) (MapType2Type T@@34 boolType))) (= (|Set#Equal| a@@10 b@@8) (forall ((o@@2 T@U) ) (!  (=> (= (type o@@2) T@@34) (= (U_2_bool (MapType2Select a@@10 o@@2)) (U_2_bool (MapType2Select b@@8 o@@2))))
 :qid |stdinbpl.751:31|
 :skolemid |84|
 :pattern ( (MapType2Select a@@10 o@@2))
 :pattern ( (MapType2Select b@@8 o@@2))
)))))
 :qid |stdinbpl.750:17|
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
 :qid |stdinbpl.816:18|
 :skolemid |104|
 :pattern ( (|MultiSet#Card| (|MultiSet#Union| a@@11 b@@9)))
 :pattern ( (|MultiSet#Card| a@@11) (|MultiSet#Union| a@@11 b@@9))
 :pattern ( (|MultiSet#Card| b@@9) (|MultiSet#Union| a@@11 b@@9))
)))
(assert  (and (forall ((arg0@@53 Real) (arg1@@30 T@U) ) (! (= (type (ConditionalFrame arg0@@53 arg1@@30)) FrameTypeType)
 :qid |funType:ConditionalFrame|
 :pattern ( (ConditionalFrame arg0@@53 arg1@@30))
)) (= (type EmptyFrame) FrameTypeType)))
(assert (forall ((p@@0 Real) (f_6 T@U) ) (!  (=> (= (type f_6) FrameTypeType) (= (ConditionalFrame p@@0 f_6) (ite (> p@@0 0.0) f_6 EmptyFrame)))
 :qid |stdinbpl.290:15|
 :skolemid |19|
 :pattern ( (ConditionalFrame p@@0 f_6))
)))
(assert (forall ((q@min@@0 Int) (q@max@@0 Int) (j@@3 Int) ) (!  (=> (and (<= 0 j@@3) (< j@@3 (- q@max@@0 q@min@@0))) (= (U_2_int (|Seq#Index| (|Seq#Range| q@min@@0 q@max@@0) j@@3)) (+ q@min@@0 j@@3)))
 :qid |stdinbpl.661:15|
 :skolemid |56|
 :pattern ( (|Seq#Index| (|Seq#Range| q@min@@0 q@max@@0) j@@3))
)))
(assert (forall ((Mask@@5 T@U) (o_2@@0 T@U) (f_4@@0 T@U) ) (! (let ((B@@3 (FieldTypeInv1 (type f_4@@0))))
(let ((A@@4 (FieldTypeInv0 (type f_4@@0))))
 (=> (and (and (= (type Mask@@5) (MapType1Type RefType realType)) (= (type o_2@@0) RefType)) (= (type f_4@@0) (FieldType A@@4 B@@3))) (= (HasDirectPerm Mask@@5 o_2@@0 f_4@@0) (> (U_2_real (MapType1Select Mask@@5 o_2@@0 f_4@@0)) NoPerm)))))
 :qid |stdinbpl.133:22|
 :skolemid |17|
 :pattern ( (HasDirectPerm Mask@@5 o_2@@0 f_4@@0))
)))
(assert (forall ((s0@@0 T@U) (s1@@0 T@U) ) (! (let ((T@@36 (SeqTypeInv0 (type s0@@0))))
 (=> (and (and (= (type s0@@0) (SeqType T@@36)) (= (type s1@@0) (SeqType T@@36))) (and (not (= s0@@0 (|Seq#Empty| T@@36))) (not (= s1@@0 (|Seq#Empty| T@@36))))) (= (|Seq#Length| (|Seq#Append| s0@@0 s1@@0)) (+ (|Seq#Length| s0@@0) (|Seq#Length| s1@@0)))))
 :qid |stdinbpl.339:18|
 :skolemid |26|
 :pattern ( (|Seq#Length| (|Seq#Append| s0@@0 s1@@0)))
)))
(assert (forall ((s@@6 T@U) (t T@U) (n@@6 Int) ) (! (let ((T@@37 (SeqTypeInv0 (type s@@6))))
 (=> (and (and (= (type s@@6) (SeqType T@@37)) (= (type t) (SeqType T@@37))) (and (> n@@6 0) (> n@@6 (|Seq#Length| s@@6)))) (and (= (|Seq#Add| (|Seq#Sub| n@@6 (|Seq#Length| s@@6)) (|Seq#Length| s@@6)) n@@6) (= (|Seq#Drop| (|Seq#Append| s@@6 t) n@@6) (|Seq#Drop| t (|Seq#Sub| n@@6 (|Seq#Length| s@@6)))))))
 :qid |stdinbpl.495:18|
 :skolemid |44|
 :pattern ( (|Seq#Drop| (|Seq#Append| s@@6 t) n@@6))
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
 :qid |stdinbpl.715:18|
 :skolemid |73|
 :pattern ( (MapType2Select (|Set#Intersection| a@@12 b@@10) o@@3))
 :pattern ( (|Set#Intersection| a@@12 b@@10) (MapType2Select a@@12 o@@3))
 :pattern ( (|Set#Intersection| a@@12 b@@10) (MapType2Select b@@10 o@@3))
)))
(assert (forall ((s@@7 T@U) (t@@0 T@U) (n@@7 Int) ) (! (let ((T@@39 (SeqTypeInv0 (type s@@7))))
 (=> (and (and (= (type s@@7) (SeqType T@@39)) (= (type t@@0) (SeqType T@@39))) (and (> n@@7 0) (> n@@7 (|Seq#Length| s@@7)))) (and (= (|Seq#Add| (|Seq#Sub| n@@7 (|Seq#Length| s@@7)) (|Seq#Length| s@@7)) n@@7) (= (|Seq#Take| (|Seq#Append| s@@7 t@@0) n@@7) (|Seq#Append| s@@7 (|Seq#Take| t@@0 (|Seq#Sub| n@@7 (|Seq#Length| s@@7))))))))
 :qid |stdinbpl.482:18|
 :skolemid |42|
 :pattern ( (|Seq#Take| (|Seq#Append| s@@7 t@@0) n@@7))
)))
(assert (forall ((q@min@@1 Int) (q@max@@1 Int) ) (!  (and (=> (< q@min@@1 q@max@@1) (= (|Seq#Length| (|Seq#Range| q@min@@1 q@max@@1)) (- q@max@@1 q@min@@1))) (=> (<= q@max@@1 q@min@@1) (= (|Seq#Length| (|Seq#Range| q@min@@1 q@max@@1)) 0)))
 :qid |stdinbpl.660:15|
 :skolemid |55|
 :pattern ( (|Seq#Length| (|Seq#Range| q@min@@1 q@max@@1)))
)))
(assert (forall ((arg0@@54 T@U) (arg1@@31 T@U) ) (! (let ((T@@40 (MapType2TypeInv0 (type arg0@@54))))
(= (type (|Set#Difference| arg0@@54 arg1@@31)) (MapType2Type T@@40 boolType)))
 :qid |funType:Set#Difference|
 :pattern ( (|Set#Difference| arg0@@54 arg1@@31))
)))
(assert (forall ((a@@13 T@U) (b@@11 T@U) (o@@4 T@U) ) (! (let ((T@@41 (type o@@4)))
 (=> (and (= (type a@@13) (MapType2Type T@@41 boolType)) (= (type b@@11) (MapType2Type T@@41 boolType))) (= (U_2_bool (MapType2Select (|Set#Difference| a@@13 b@@11) o@@4))  (and (U_2_bool (MapType2Select a@@13 o@@4)) (not (U_2_bool (MapType2Select b@@11 o@@4)))))))
 :qid |stdinbpl.730:18|
 :skolemid |79|
 :pattern ( (MapType2Select (|Set#Difference| a@@13 b@@11) o@@4))
 :pattern ( (|Set#Difference| a@@13 b@@11) (MapType2Select a@@13 o@@4))
)))
(assert (forall ((a@@14 T@U) (b@@12 T@U) ) (! (let ((T@@42 (SeqTypeInv0 (type a@@14))))
 (=> (and (and (= (type a@@14) (SeqType T@@42)) (= (type b@@12) (SeqType T@@42))) (|Seq#Equal| a@@14 b@@12)) (= a@@14 b@@12)))
 :qid |stdinbpl.633:18|
 :skolemid |53|
 :pattern ( (|Seq#Equal| a@@14 b@@12))
)))
(assert (forall ((a@@15 T@U) (b@@13 T@U) ) (! (let ((T@@43 (MapType2TypeInv0 (type a@@15))))
 (=> (and (and (= (type a@@15) (MapType2Type T@@43 boolType)) (= (type b@@13) (MapType2Type T@@43 boolType))) (|Set#Equal| a@@15 b@@13)) (= a@@15 b@@13)))
 :qid |stdinbpl.752:17|
 :skolemid |86|
 :pattern ( (|Set#Equal| a@@15 b@@13))
)))
(assert (forall ((a@@16 T@U) (b@@14 T@U) ) (! (let ((T@@44 (MultiSetTypeInv0 (type a@@16))))
 (=> (and (and (= (type a@@16) (MultiSetType T@@44)) (= (type b@@14) (MultiSetType T@@44))) (|MultiSet#Equal| a@@16 b@@14)) (= a@@16 b@@14)))
 :qid |stdinbpl.851:17|
 :skolemid |115|
 :pattern ( (|MultiSet#Equal| a@@16 b@@14))
)))
(assert (forall ((arg0@@55 T@U) (arg1@@32 T@U) ) (! (let ((T@@45 (type arg1@@32)))
(= (type (|Set#UnionOne| arg0@@55 arg1@@32)) (MapType2Type T@@45 boolType)))
 :qid |funType:Set#UnionOne|
 :pattern ( (|Set#UnionOne| arg0@@55 arg1@@32))
)))
(assert (forall ((a@@17 T@U) (x@@11 T@U) (y@@3 T@U) ) (! (let ((T@@46 (type x@@11)))
 (=> (and (and (= (type a@@17) (MapType2Type T@@46 boolType)) (= (type y@@3) T@@46)) (U_2_bool (MapType2Select a@@17 y@@3))) (U_2_bool (MapType2Select (|Set#UnionOne| a@@17 x@@11) y@@3))))
 :qid |stdinbpl.695:18|
 :skolemid |67|
 :pattern ( (|Set#UnionOne| a@@17 x@@11) (MapType2Select a@@17 y@@3))
)))
(assert (forall ((a@@18 T@U) (b@@15 T@U) (y@@4 T@U) ) (! (let ((T@@47 (type y@@4)))
 (=> (and (and (= (type a@@18) (MapType2Type T@@47 boolType)) (= (type b@@15) (MapType2Type T@@47 boolType))) (U_2_bool (MapType2Select a@@18 y@@4))) (U_2_bool (MapType2Select (|Set#Union| a@@18 b@@15) y@@4))))
 :qid |stdinbpl.705:18|
 :skolemid |71|
 :pattern ( (|Set#Union| a@@18 b@@15) (MapType2Select a@@18 y@@4))
)))
(assert (forall ((a@@19 T@U) (b@@16 T@U) (y@@5 T@U) ) (! (let ((T@@48 (type y@@5)))
 (=> (and (and (= (type a@@19) (MapType2Type T@@48 boolType)) (= (type b@@16) (MapType2Type T@@48 boolType))) (U_2_bool (MapType2Select b@@16 y@@5))) (U_2_bool (MapType2Select (|Set#Union| a@@19 b@@16) y@@5))))
 :qid |stdinbpl.707:18|
 :skolemid |72|
 :pattern ( (|Set#Union| a@@19 b@@16) (MapType2Select b@@16 y@@5))
)))
(assert (forall ((ms T@U) (x@@12 T@U) ) (! (let ((T@@49 (type x@@12)))
 (=> (= (type ms) (MultiSetType T@@49)) (>= (|MultiSet#Select| ms x@@12) 0)))
 :qid |stdinbpl.782:18|
 :skolemid |92|
 :pattern ( (|MultiSet#Select| ms x@@12))
)))
(assert (forall ((a@@20 T@U) (x@@13 T@U) (o@@5 T@U) ) (! (let ((T@@50 (type x@@13)))
 (=> (and (= (type a@@20) (MapType2Type T@@50 boolType)) (= (type o@@5) T@@50)) (= (U_2_bool (MapType2Select (|Set#UnionOne| a@@20 x@@13) o@@5))  (or (= o@@5 x@@13) (U_2_bool (MapType2Select a@@20 o@@5))))))
 :qid |stdinbpl.691:18|
 :skolemid |65|
 :pattern ( (MapType2Select (|Set#UnionOne| a@@20 x@@13) o@@5))
)))
(assert (forall ((a@@21 T@U) (b@@17 T@U) (y@@6 T@U) ) (! (let ((T@@51 (type y@@6)))
 (=> (and (and (= (type a@@21) (MapType2Type T@@51 boolType)) (= (type b@@17) (MapType2Type T@@51 boolType))) (U_2_bool (MapType2Select b@@17 y@@6))) (not (U_2_bool (MapType2Select (|Set#Difference| a@@21 b@@17) y@@6)))))
 :qid |stdinbpl.732:18|
 :skolemid |80|
 :pattern ( (|Set#Difference| a@@21 b@@17) (MapType2Select b@@17 y@@6))
)))
(assert (forall ((s@@8 T@U) (i@@2 Int) ) (! (let ((T@@52 (SeqTypeInv0 (type s@@8))))
 (=> (= (type s@@8) (SeqType T@@52)) (=> (and (<= 0 i@@2) (< i@@2 (|Seq#Length| s@@8))) (|Seq#ContainsTrigger| s@@8 (|Seq#Index| s@@8 i@@2)))))
 :qid |stdinbpl.526:18|
 :skolemid |49|
 :pattern ( (|Seq#Index| s@@8 i@@2))
)))
(assert (forall ((a@@22 T@U) (b@@18 T@U) ) (! (let ((T@@53 (MapType2TypeInv0 (type a@@22))))
 (=> (and (= (type a@@22) (MapType2Type T@@53 boolType)) (= (type b@@18) (MapType2Type T@@53 boolType))) (and (= (+ (+ (|Set#Card| (|Set#Difference| a@@22 b@@18)) (|Set#Card| (|Set#Difference| b@@18 a@@22))) (|Set#Card| (|Set#Intersection| a@@22 b@@18))) (|Set#Card| (|Set#Union| a@@22 b@@18))) (= (|Set#Card| (|Set#Difference| a@@22 b@@18)) (- (|Set#Card| a@@22) (|Set#Card| (|Set#Intersection| a@@22 b@@18)))))))
 :qid |stdinbpl.734:18|
 :skolemid |81|
 :pattern ( (|Set#Card| (|Set#Difference| a@@22 b@@18)))
)))
(assert (forall ((s0@@1 T@U) (s1@@1 T@U) ) (! (let ((T@@54 (SeqTypeInv0 (type s0@@1))))
 (=> (and (= (type s0@@1) (SeqType T@@54)) (= (type s1@@1) (SeqType T@@54))) (and (=> (= s0@@1 (|Seq#Empty| T@@54)) (= (|Seq#Append| s0@@1 s1@@1) s1@@1)) (=> (= s1@@1 (|Seq#Empty| T@@54)) (= (|Seq#Append| s0@@1 s1@@1) s0@@1)))))
 :qid |stdinbpl.345:18|
 :skolemid |27|
 :pattern ( (|Seq#Append| s0@@1 s1@@1))
)))
(assert (forall ((t@@1 T@U) ) (! (= (|Seq#Index| (|Seq#Singleton| t@@1) 0) t@@1)
 :qid |stdinbpl.349:18|
 :skolemid |28|
 :pattern ( (|Seq#Singleton| t@@1))
)))
(assert (forall ((s@@9 T@U) ) (! (let ((T@@55 (SeqTypeInv0 (type s@@9))))
 (=> (= (type s@@9) (SeqType T@@55)) (<= 0 (|Seq#Length| s@@9))))
 :qid |stdinbpl.328:18|
 :skolemid |22|
 :pattern ( (|Seq#Length| s@@9))
)))
(assert (forall ((s@@10 T@U) ) (! (let ((T@@56 (MapType2TypeInv0 (type s@@10))))
 (=> (= (type s@@10) (MapType2Type T@@56 boolType)) (<= 0 (|Set#Card| s@@10))))
 :qid |stdinbpl.677:18|
 :skolemid |58|
 :pattern ( (|Set#Card| s@@10))
)))
(assert (forall ((s@@11 T@U) ) (! (let ((T@@57 (MultiSetTypeInv0 (type s@@11))))
 (=> (= (type s@@11) (MultiSetType T@@57)) (<= 0 (|MultiSet#Card| s@@11))))
 :qid |stdinbpl.785:18|
 :skolemid |93|
 :pattern ( (|MultiSet#Card| s@@11))
)))
(assert (forall ((T@@58 T@T) ) (! (= (type (|MultiSet#Empty| T@@58)) (MultiSetType T@@58))
 :qid |funType:MultiSet#Empty|
 :pattern ( (|MultiSet#Empty| T@@58))
)))
(assert (forall ((o@@6 T@U) ) (! (let ((T@@59 (type o@@6)))
(= (|MultiSet#Select| (|MultiSet#Empty| T@@59) o@@6) 0))
 :qid |stdinbpl.790:18|
 :skolemid |94|
 :pattern ( (let ((T@@59 (type o@@6)))
(|MultiSet#Select| (|MultiSet#Empty| T@@59) o@@6)))
)))
(assert (forall ((a@@23 T@U) (x@@14 T@U) ) (! (let ((T@@60 (type x@@14)))
 (=> (= (type a@@23) (MapType2Type T@@60 boolType)) (U_2_bool (MapType2Select (|Set#UnionOne| a@@23 x@@14) x@@14))))
 :qid |stdinbpl.693:18|
 :skolemid |66|
 :pattern ( (|Set#UnionOne| a@@23 x@@14))
)))
(assert (forall ((s0@@2 T@U) (s1@@2 T@U) ) (! (let ((T@@61 (SeqTypeInv0 (type s0@@2))))
 (=> (and (and (= (type s0@@2) (SeqType T@@61)) (= (type s1@@2) (SeqType T@@61))) (|Seq#Equal| s0@@2 s1@@2)) (and (= (|Seq#Length| s0@@2) (|Seq#Length| s1@@2)) (forall ((j@@4 Int) ) (!  (=> (and (<= 0 j@@4) (< j@@4 (|Seq#Length| s0@@2))) (= (|Seq#Index| s0@@2 j@@4) (|Seq#Index| s1@@2 j@@4)))
 :qid |stdinbpl.623:13|
 :skolemid |50|
 :pattern ( (|Seq#Index| s0@@2 j@@4))
 :pattern ( (|Seq#Index| s1@@2 j@@4))
)))))
 :qid |stdinbpl.620:18|
 :skolemid |51|
 :pattern ( (|Seq#Equal| s0@@2 s1@@2))
)))
(assert (= (type empty_edges) IEdgesDomainTypeType))
(assert (forall ((i_1@@1 Int) ) (!  (not (has_edge empty_edges i_1@@1))
 :qid |stdinbpl.913:15|
 :skolemid |123|
 :pattern ( (has_edge empty_edges i_1@@1))
)))
(assert (= (type empty_map) INodeMapDomainTypeType))
(assert (forall ((node_1@@1 T@U) ) (!  (=> (= (type node_1@@1) RefType) (not (has_node empty_map node_1@@1)))
 :qid |stdinbpl.971:15|
 :skolemid |129|
 :pattern ( (has_node empty_map node_1@@1))
)))
(assert (forall ((Heap@@5 T@U) (ExhaleHeap@@4 T@U) (Mask@@6 T@U) (pm_f@@1 T@U) ) (! (let ((C@@1 (FieldTypeInv0 (type pm_f@@1))))
 (=> (and (and (and (and (and (= (type Heap@@5) (MapType0Type RefType)) (= (type ExhaleHeap@@4) (MapType0Type RefType))) (= (type Mask@@6) (MapType1Type RefType realType))) (= (type pm_f@@1) (FieldType C@@1 FrameTypeType))) (IdenticalOnKnownLocations Heap@@5 ExhaleHeap@@4 Mask@@6)) (and (HasDirectPerm Mask@@6 null pm_f@@1) (IsPredicateField pm_f@@1))) (forall ((o2 T@U) (f_2@@0 T@U) ) (! (let ((B@@5 (FieldTypeInv1 (type f_2@@0))))
(let ((A@@6 (FieldTypeInv0 (type f_2@@0))))
 (=> (and (and (= (type o2) RefType) (= (type f_2@@0) (FieldType A@@6 B@@5))) (U_2_bool (MapType1Select (MapType0Select Heap@@5 null (PredicateMaskField pm_f@@1)) o2 f_2@@0))) (= (MapType0Select Heap@@5 o2 f_2@@0) (MapType0Select ExhaleHeap@@4 o2 f_2@@0)))))
 :qid |stdinbpl.54:134|
 :skolemid |3|
 :pattern ( (MapType0Select ExhaleHeap@@4 o2 f_2@@0))
))))
 :qid |stdinbpl.52:19|
 :skolemid |4|
 :pattern ( (IdenticalOnKnownLocations Heap@@5 ExhaleHeap@@4 Mask@@6) (IsPredicateField pm_f@@1))
)))
(assert (forall ((Heap@@6 T@U) (ExhaleHeap@@5 T@U) (Mask@@7 T@U) (pm_f@@2 T@U) ) (! (let ((C@@2 (FieldTypeInv0 (type pm_f@@2))))
 (=> (and (and (and (and (and (= (type Heap@@6) (MapType0Type RefType)) (= (type ExhaleHeap@@5) (MapType0Type RefType))) (= (type Mask@@7) (MapType1Type RefType realType))) (= (type pm_f@@2) (FieldType C@@2 FrameTypeType))) (IdenticalOnKnownLocations Heap@@6 ExhaleHeap@@5 Mask@@7)) (and (HasDirectPerm Mask@@7 null pm_f@@2) (IsWandField pm_f@@2))) (forall ((o2@@0 T@U) (f_2@@1 T@U) ) (! (let ((B@@6 (FieldTypeInv1 (type f_2@@1))))
(let ((A@@7 (FieldTypeInv0 (type f_2@@1))))
 (=> (and (and (= (type o2@@0) RefType) (= (type f_2@@1) (FieldType A@@7 B@@6))) (U_2_bool (MapType1Select (MapType0Select Heap@@6 null (WandMaskField pm_f@@2)) o2@@0 f_2@@1))) (= (MapType0Select Heap@@6 o2@@0 f_2@@1) (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1)))))
 :qid |stdinbpl.67:129|
 :skolemid |6|
 :pattern ( (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1))
))))
 :qid |stdinbpl.65:19|
 :skolemid |7|
 :pattern ( (IdenticalOnKnownLocations Heap@@6 ExhaleHeap@@5 Mask@@7) (IsWandField pm_f@@2))
)))
(assert (forall ((a@@24 T@U) (x@@15 T@U) ) (! (let ((T@@62 (type x@@15)))
 (=> (and (= (type a@@24) (MapType2Type T@@62 boolType)) (U_2_bool (MapType2Select a@@24 x@@15))) (= (|Set#Card| (|Set#UnionOne| a@@24 x@@15)) (|Set#Card| a@@24))))
 :qid |stdinbpl.697:18|
 :skolemid |68|
 :pattern ( (|Set#Card| (|Set#UnionOne| a@@24 x@@15)))
)))
(assert (forall ((a@@25 T@U) (x@@16 T@U) ) (! (let ((T@@63 (type x@@16)))
 (=> (= (type a@@25) (MultiSetType T@@63)) (and (> (|MultiSet#Select| (|MultiSet#UnionOne| a@@25 x@@16) x@@16) 0) (> (|MultiSet#Card| (|MultiSet#UnionOne| a@@25 x@@16)) 0))))
 :qid |stdinbpl.809:18|
 :skolemid |102|
 :pattern ( (|MultiSet#UnionOne| a@@25 x@@16))
)))
(assert (forall ((t@@2 T@U) ) (! (= (|Seq#Length| (|Seq#Singleton| t@@2)) 1)
 :qid |stdinbpl.336:18|
 :skolemid |25|
 :pattern ( (|Seq#Singleton| t@@2))
)))
(assert (forall ((r@@1 T@U) ) (! (= (|Set#Card| (|Set#Singleton| r@@1)) 1)
 :qid |stdinbpl.688:18|
 :skolemid |64|
 :pattern ( (|Set#Card| (|Set#Singleton| r@@1)))
)))
(assert (forall ((Mask@@8 T@U) (o_2@@2 T@U) (f_4@@2 T@U) ) (! (let ((B@@7 (FieldTypeInv1 (type f_4@@2))))
(let ((A@@8 (FieldTypeInv0 (type f_4@@2))))
 (=> (and (and (and (= (type Mask@@8) (MapType1Type RefType realType)) (= (type o_2@@2) RefType)) (= (type f_4@@2) (FieldType A@@8 B@@7))) (GoodMask Mask@@8)) (and (>= (U_2_real (MapType1Select Mask@@8 o_2@@2 f_4@@2)) NoPerm) (=> (and (and (GoodMask Mask@@8) (not (IsPredicateField f_4@@2))) (not (IsWandField f_4@@2))) (<= (U_2_real (MapType1Select Mask@@8 o_2@@2 f_4@@2)) FullPerm))))))
 :qid |stdinbpl.128:22|
 :skolemid |16|
 :pattern ( (GoodMask Mask@@8) (MapType1Select Mask@@8 o_2@@2 f_4@@2))
)))
(assert (forall ((r@@2 T@U) ) (! (U_2_bool (MapType2Select (|Set#Singleton| r@@2) r@@2))
 :qid |stdinbpl.686:18|
 :skolemid |62|
 :pattern ( (|Set#Singleton| r@@2))
)))
(assert (forall ((a@@26 T@U) (b@@19 T@U) ) (! (let ((T@@64 (MapType2TypeInv0 (type a@@26))))
 (=> (and (= (type a@@26) (MapType2Type T@@64 boolType)) (= (type b@@19) (MapType2Type T@@64 boolType))) (= (|Set#Union| a@@26 (|Set#Union| a@@26 b@@19)) (|Set#Union| a@@26 b@@19))))
 :qid |stdinbpl.720:18|
 :skolemid |75|
 :pattern ( (|Set#Union| a@@26 (|Set#Union| a@@26 b@@19)))
)))
(assert (forall ((a@@27 T@U) (b@@20 T@U) ) (! (let ((T@@65 (MapType2TypeInv0 (type a@@27))))
 (=> (and (= (type a@@27) (MapType2Type T@@65 boolType)) (= (type b@@20) (MapType2Type T@@65 boolType))) (= (|Set#Intersection| a@@27 (|Set#Intersection| a@@27 b@@20)) (|Set#Intersection| a@@27 b@@20))))
 :qid |stdinbpl.724:18|
 :skolemid |77|
 :pattern ( (|Set#Intersection| a@@27 (|Set#Intersection| a@@27 b@@20)))
)))
(assert (forall ((a@@28 T@U) (b@@21 T@U) ) (! (let ((T@@66 (MultiSetTypeInv0 (type a@@28))))
 (=> (and (= (type a@@28) (MultiSetType T@@66)) (= (type b@@21) (MultiSetType T@@66))) (= (|MultiSet#Intersection| a@@28 (|MultiSet#Intersection| a@@28 b@@21)) (|MultiSet#Intersection| a@@28 b@@21))))
 :qid |stdinbpl.826:18|
 :skolemid |107|
 :pattern ( (|MultiSet#Intersection| a@@28 (|MultiSet#Intersection| a@@28 b@@21)))
)))
(assert (forall ((s@@12 T@U) ) (! (let ((T@@67 (MultiSetTypeInv0 (type s@@12))))
 (=> (= (type s@@12) (MultiSetType T@@67)) (and (= (= (|MultiSet#Card| s@@12) 0) (= s@@12 (|MultiSet#Empty| T@@67))) (=> (not (= (|MultiSet#Card| s@@12) 0)) (exists ((x@@17 T@U) ) (!  (and (= (type x@@17) T@@67) (< 0 (|MultiSet#Select| s@@12 x@@17)))
 :qid |stdinbpl.793:38|
 :skolemid |95|
 :no-pattern (type x@@17)
 :no-pattern (U_2_int x@@17)
 :no-pattern (U_2_bool x@@17)
))))))
 :qid |stdinbpl.791:18|
 :skolemid |96|
 :pattern ( (|MultiSet#Card| s@@12))
)))
(assert (forall ((r@@3 T@U) (o@@7 T@U) ) (! (let ((T@@68 (type r@@3)))
 (=> (= (type o@@7) T@@68) (and (= (= (|MultiSet#Select| (|MultiSet#Singleton| r@@3) o@@7) 1) (= r@@3 o@@7)) (= (= (|MultiSet#Select| (|MultiSet#Singleton| r@@3) o@@7) 0) (not (= r@@3 o@@7))))))
 :qid |stdinbpl.796:18|
 :skolemid |97|
 :pattern ( (|MultiSet#Select| (|MultiSet#Singleton| r@@3) o@@7))
)))
(assert (forall ((o@@8 T@U) (f T@U) (Heap@@7 T@U) ) (!  (=> (and (and (and (= (type o@@8) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap@@7) (MapType0Type RefType))) (U_2_bool (MapType0Select Heap@@7 o@@8 $allocated))) (U_2_bool (MapType0Select Heap@@7 (MapType0Select Heap@@7 o@@8 f) $allocated)))
 :qid |stdinbpl.31:15|
 :skolemid |0|
 :pattern ( (MapType0Select Heap@@7 o@@8 f))
)))
(assert (forall ((a@@29 T@U) (b@@22 T@U) (o@@9 T@U) ) (! (let ((T@@69 (type o@@9)))
 (=> (and (= (type a@@29) (MultiSetType T@@69)) (= (type b@@22) (MultiSetType T@@69))) (= (|MultiSet#Select| (|MultiSet#Union| a@@29 b@@22) o@@9) (+ (|MultiSet#Select| a@@29 o@@9) (|MultiSet#Select| b@@22 o@@9)))))
 :qid |stdinbpl.814:18|
 :skolemid |103|
 :pattern ( (|MultiSet#Select| (|MultiSet#Union| a@@29 b@@22) o@@9))
 :pattern ( (|MultiSet#Union| a@@29 b@@22) (|MultiSet#Select| a@@29 o@@9) (|MultiSet#Select| b@@22 o@@9))
)))
(assert (forall ((s@@13 T@U) (t@@3 T@U) (n@@8 Int) ) (! (let ((T@@70 (SeqTypeInv0 (type s@@13))))
 (=> (and (and (= (type s@@13) (SeqType T@@70)) (= (type t@@3) (SeqType T@@70))) (and (< 0 n@@8) (<= n@@8 (|Seq#Length| s@@13)))) (= (|Seq#Take| (|Seq#Append| s@@13 t@@3) n@@8) (|Seq#Take| s@@13 n@@8))))
 :qid |stdinbpl.478:18|
 :skolemid |41|
 :pattern ( (|Seq#Take| (|Seq#Append| s@@13 t@@3) n@@8))
)))
(assert (forall ((T@@71 T@T) ) (! (= (type (|Set#Empty| T@@71)) (MapType2Type T@@71 boolType))
 :qid |funType:Set#Empty|
 :pattern ( (|Set#Empty| T@@71))
)))
(assert (forall ((o@@10 T@U) ) (! (let ((T@@72 (type o@@10)))
 (not (U_2_bool (MapType2Select (|Set#Empty| T@@72) o@@10))))
 :qid |stdinbpl.680:18|
 :skolemid |59|
 :pattern ( (let ((T@@72 (type o@@10)))
(MapType2Select (|Set#Empty| T@@72) o@@10)))
)))
(assert (forall ((s@@14 T@U) (i@@3 Int) (v@@1 T@U) ) (! (let ((T@@73 (type v@@1)))
 (=> (= (type s@@14) (SeqType T@@73)) (=> (and (<= 0 i@@3) (< i@@3 (|Seq#Length| s@@14))) (= (|Seq#Length| (|Seq#Update| s@@14 i@@3 v@@1)) (|Seq#Length| s@@14)))))
 :qid |stdinbpl.377:18|
 :skolemid |34|
 :pattern ( (|Seq#Length| (|Seq#Update| s@@14 i@@3 v@@1)))
 :pattern ( (|Seq#Length| s@@14) (|Seq#Update| s@@14 i@@3 v@@1))
)))
(assert (forall ((r@@4 T@U) ) (! (let ((T@@74 (type r@@4)))
(= (|MultiSet#Singleton| r@@4) (|MultiSet#UnionOne| (|MultiSet#Empty| T@@74) r@@4)))
 :qid |stdinbpl.799:18|
 :skolemid |99|
 :pattern ( (|MultiSet#Singleton| r@@4))
)))
(assert (forall ((s@@15 T@U) (t@@4 T@U) (n@@9 Int) ) (! (let ((T@@75 (SeqTypeInv0 (type s@@15))))
 (=> (and (and (= (type s@@15) (SeqType T@@75)) (= (type t@@4) (SeqType T@@75))) (and (< 0 n@@9) (<= n@@9 (|Seq#Length| s@@15)))) (= (|Seq#Drop| (|Seq#Append| s@@15 t@@4) n@@9) (|Seq#Append| (|Seq#Drop| s@@15 n@@9) t@@4))))
 :qid |stdinbpl.491:18|
 :skolemid |43|
 :pattern ( (|Seq#Drop| (|Seq#Append| s@@15 t@@4) n@@9))
)))
(assert (forall ((a@@30 Int) (b@@23 Int) ) (! (= (<= a@@30 b@@23) (= (|Math#min| a@@30 b@@23) a@@30))
 :qid |stdinbpl.764:15|
 :skolemid |87|
 :pattern ( (|Math#min| a@@30 b@@23))
)))
(assert (forall ((a@@31 Int) (b@@24 Int) ) (! (= (<= b@@24 a@@31) (= (|Math#min| a@@31 b@@24) b@@24))
 :qid |stdinbpl.765:15|
 :skolemid |88|
 :pattern ( (|Math#min| a@@31 b@@24))
)))
(assert (forall ((s@@16 T@U) (n@@10 Int) (i@@4 Int) ) (! (let ((T@@76 (SeqTypeInv0 (type s@@16))))
 (=> (= (type s@@16) (SeqType T@@76)) (=> (and (and (< 0 n@@10) (<= n@@10 i@@4)) (< i@@4 (|Seq#Length| s@@16))) (and (= (|Seq#Add| (|Seq#Sub| i@@4 n@@10) n@@10) i@@4) (= (|Seq#Index| (|Seq#Drop| s@@16 n@@10) (|Seq#Sub| i@@4 n@@10)) (|Seq#Index| s@@16 i@@4))))))
 :qid |stdinbpl.428:18|
 :skolemid |40|
 :pattern ( (|Seq#Drop| s@@16 n@@10) (|Seq#Index| s@@16 i@@4))
)))
(assert (forall ((s@@17 T@U) ) (! (let ((T@@77 (MapType2TypeInv0 (type s@@17))))
 (=> (= (type s@@17) (MapType2Type T@@77 boolType)) (and (= (= (|Set#Card| s@@17) 0) (= s@@17 (|Set#Empty| T@@77))) (=> (not (= (|Set#Card| s@@17) 0)) (exists ((x@@18 T@U) ) (!  (and (= (type x@@18) T@@77) (U_2_bool (MapType2Select s@@17 x@@18)))
 :qid |stdinbpl.683:33|
 :skolemid |60|
 :no-pattern (type x@@18)
 :no-pattern (U_2_int x@@18)
 :no-pattern (U_2_bool x@@18)
))))))
 :qid |stdinbpl.681:18|
 :skolemid |61|
 :pattern ( (|Set#Card| s@@17))
)))
(assert (forall ((arg0@@56 T@U) ) (! (= (type (edges_domain arg0@@56)) (MapType2Type intType boolType))
 :qid |funType:edges_domain|
 :pattern ( (edges_domain arg0@@56))
)))
(assert (forall ((e_1@@1 T@U) (i_1@@2 Int) ) (!  (=> (= (type e_1@@1) IEdgesDomainTypeType) (= (U_2_bool (MapType2Select (edges_domain e_1@@1) (int_2_U i_1@@2))) (has_edge e_1@@1 i_1@@2)))
 :qid |stdinbpl.907:15|
 :skolemid |122|
 :pattern ( (edges_domain e_1@@1) (has_edge e_1@@1 i_1@@2))
 :pattern ( (MapType2Select (edges_domain e_1@@1) (int_2_U i_1@@2)))
 :pattern ( (has_edge e_1@@1 i_1@@2))
)))
(assert (forall ((s0@@3 T@U) (s1@@3 T@U) (n@@11 Int) ) (! (let ((T@@78 (SeqTypeInv0 (type s0@@3))))
 (=> (and (= (type s0@@3) (SeqType T@@78)) (= (type s1@@3) (SeqType T@@78))) (=> (and (and (and (not (= s0@@3 (|Seq#Empty| T@@78))) (not (= s1@@3 (|Seq#Empty| T@@78)))) (<= 0 n@@11)) (< n@@11 (|Seq#Length| s0@@3))) (= (|Seq#Index| (|Seq#Append| s0@@3 s1@@3) n@@11) (|Seq#Index| s0@@3 n@@11)))))
 :qid |stdinbpl.368:18|
 :skolemid |31|
 :pattern ( (|Seq#Index| (|Seq#Append| s0@@3 s1@@3) n@@11))
 :pattern ( (|Seq#Index| s0@@3 n@@11) (|Seq#Append| s0@@3 s1@@3))
)))
(assert (forall ((Heap@@8 T@U) (o@@11 T@U) (f_3 T@U) (v@@2 T@U) ) (! (let ((B@@8 (type v@@2)))
(let ((A@@9 (FieldTypeInv0 (type f_3))))
 (=> (and (and (= (type Heap@@8) (MapType0Type RefType)) (= (type o@@11) RefType)) (= (type f_3) (FieldType A@@9 B@@8))) (succHeap Heap@@8 (MapType0Store Heap@@8 o@@11 f_3 v@@2)))))
 :qid |stdinbpl.78:22|
 :skolemid |9|
 :pattern ( (MapType0Store Heap@@8 o@@11 f_3 v@@2))
)))
(assert (forall ((a@@32 T@U) (b@@25 T@U) ) (! (let ((T@@79 (MapType2TypeInv0 (type a@@32))))
 (=> (and (= (type a@@32) (MapType2Type T@@79 boolType)) (= (type b@@25) (MapType2Type T@@79 boolType))) (= (|Set#Subset| a@@32 b@@25) (forall ((o@@12 T@U) ) (!  (=> (and (= (type o@@12) T@@79) (U_2_bool (MapType2Select a@@32 o@@12))) (U_2_bool (MapType2Select b@@25 o@@12)))
 :qid |stdinbpl.743:32|
 :skolemid |82|
 :pattern ( (MapType2Select a@@32 o@@12))
 :pattern ( (MapType2Select b@@25 o@@12))
)))))
 :qid |stdinbpl.742:17|
 :skolemid |83|
 :pattern ( (|Set#Subset| a@@32 b@@25))
)))
(assert (forall ((s0@@4 T@U) (s1@@4 T@U) (m@@10 Int) ) (! (let ((T@@80 (SeqTypeInv0 (type s0@@4))))
 (=> (and (= (type s0@@4) (SeqType T@@80)) (= (type s1@@4) (SeqType T@@80))) (=> (and (and (and (not (= s0@@4 (|Seq#Empty| T@@80))) (not (= s1@@4 (|Seq#Empty| T@@80)))) (<= 0 m@@10)) (< m@@10 (|Seq#Length| s1@@4))) (and (= (|Seq#Sub| (|Seq#Add| m@@10 (|Seq#Length| s0@@4)) (|Seq#Length| s0@@4)) m@@10) (= (|Seq#Index| (|Seq#Append| s0@@4 s1@@4) (|Seq#Add| m@@10 (|Seq#Length| s0@@4))) (|Seq#Index| s1@@4 m@@10))))))
 :qid |stdinbpl.373:18|
 :skolemid |33|
 :pattern ( (|Seq#Index| s1@@4 m@@10) (|Seq#Append| s0@@4 s1@@4))
)))
(assert (forall ((a@@33 T@U) (x@@19 T@U) ) (! (let ((T@@81 (type x@@19)))
 (=> (and (= (type a@@33) (MapType2Type T@@81 boolType)) (not (U_2_bool (MapType2Select a@@33 x@@19)))) (= (|Set#Card| (|Set#UnionOne| a@@33 x@@19)) (+ (|Set#Card| a@@33) 1))))
 :qid |stdinbpl.699:18|
 :skolemid |69|
 :pattern ( (|Set#Card| (|Set#UnionOne| a@@33 x@@19)))
)))
(assert (forall ((a@@34 T@U) (b@@26 T@U) (o@@13 T@U) ) (! (let ((T@@82 (type o@@13)))
 (=> (and (= (type a@@34) (MultiSetType T@@82)) (= (type b@@26) (MultiSetType T@@82))) (= (|MultiSet#Select| (|MultiSet#Difference| a@@34 b@@26) o@@13) (|Math#clip| (- (|MultiSet#Select| a@@34 o@@13) (|MultiSet#Select| b@@26 o@@13))))))
 :qid |stdinbpl.831:18|
 :skolemid |108|
 :pattern ( (|MultiSet#Select| (|MultiSet#Difference| a@@34 b@@26) o@@13))
)))
(assert (forall ((e_1@@2 T@U) (i_1@@3 Int) (node_1@@2 T@U) ) (!  (=> (and (= (type e_1@@2) IEdgesDomainTypeType) (= (type node_1@@2) RefType)) (= (edge_lookup (insert_edge e_1@@2 i_1@@3 node_1@@2) i_1@@3) node_1@@2))
 :qid |stdinbpl.883:15|
 :skolemid |118|
 :pattern ( (edge_lookup (insert_edge e_1@@2 i_1@@3 node_1@@2) i_1@@3))
)))
(assert (forall ((node_map_1@@1 T@U) (key_node_1@@0 T@U) (val_node_1@@0 T@U) ) (!  (=> (and (and (= (type node_map_1@@1) INodeMapDomainTypeType) (= (type key_node_1@@0) RefType)) (= (type val_node_1@@0) RefType)) (= (lookup (insert node_map_1@@1 key_node_1@@0 val_node_1@@0) key_node_1@@0) val_node_1@@0))
 :qid |stdinbpl.941:15|
 :skolemid |124|
 :pattern ( (lookup (insert node_map_1@@1 key_node_1@@0 val_node_1@@0) key_node_1@@0))
)))
(assert (= (type ZeroPMask) (MapType1Type RefType boolType)))
(assert (forall ((o_2@@3 T@U) (f_4@@3 T@U) ) (! (let ((B@@9 (FieldTypeInv1 (type f_4@@3))))
(let ((A@@10 (FieldTypeInv0 (type f_4@@3))))
 (=> (and (= (type o_2@@3) RefType) (= (type f_4@@3) (FieldType A@@10 B@@9))) (not (U_2_bool (MapType1Select ZeroPMask o_2@@3 f_4@@3))))))
 :qid |stdinbpl.112:22|
 :skolemid |14|
 :pattern ( (MapType1Select ZeroPMask o_2@@3 f_4@@3))
)))
(assert (forall ((s@@18 T@U) (x@@20 T@U) (i@@5 Int) ) (! (let ((T@@83 (type x@@20)))
 (=> (= (type s@@18) (SeqType T@@83)) (=> (and (and (<= 0 i@@5) (< i@@5 (|Seq#Length| s@@18))) (= (|Seq#Index| s@@18 i@@5) x@@20)) (|Seq#Contains| s@@18 x@@20))))
 :qid |stdinbpl.524:18|
 :skolemid |48|
 :pattern ( (|Seq#Contains| s@@18 x@@20) (|Seq#Index| s@@18 i@@5))
)))
(assert (forall ((s0@@5 T@U) (s1@@5 T@U) ) (! (let ((T@@84 (SeqTypeInv0 (type s0@@5))))
 (=> (and (= (type s0@@5) (SeqType T@@84)) (= (type s1@@5) (SeqType T@@84))) (or (or (and (= s0@@5 s1@@5) (|Seq#Equal| s0@@5 s1@@5)) (and (and (not (= s0@@5 s1@@5)) (not (|Seq#Equal| s0@@5 s1@@5))) (not (= (|Seq#Length| s0@@5) (|Seq#Length| s1@@5))))) (and (and (and (and (and (and (not (= s0@@5 s1@@5)) (not (|Seq#Equal| s0@@5 s1@@5))) (= (|Seq#Length| s0@@5) (|Seq#Length| s1@@5))) (= (|Seq#SkolemDiff| s0@@5 s1@@5) (|Seq#SkolemDiff| s1@@5 s0@@5))) (<= 0 (|Seq#SkolemDiff| s0@@5 s1@@5))) (< (|Seq#SkolemDiff| s0@@5 s1@@5) (|Seq#Length| s0@@5))) (not (= (|Seq#Index| s0@@5 (|Seq#SkolemDiff| s0@@5 s1@@5)) (|Seq#Index| s1@@5 (|Seq#SkolemDiff| s0@@5 s1@@5))))))))
 :qid |stdinbpl.628:18|
 :skolemid |52|
 :pattern ( (|Seq#Equal| s0@@5 s1@@5))
)))
(assert (forall ((p@@1 T@U) (v_1@@0 T@U) (q T@U) (w@@0 T@U) (r@@5 T@U) (u T@U) ) (! (let ((C@@3 (FieldTypeInv0 (type r@@5))))
(let ((B@@10 (FieldTypeInv0 (type q))))
(let ((A@@11 (FieldTypeInv0 (type p@@1))))
 (=> (and (and (and (and (and (and (= (type p@@1) (FieldType A@@11 FrameTypeType)) (= (type v_1@@0) FrameTypeType)) (= (type q) (FieldType B@@10 FrameTypeType))) (= (type w@@0) FrameTypeType)) (= (type r@@5) (FieldType C@@3 FrameTypeType))) (= (type u) FrameTypeType)) (and (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r@@5 u))) (InsidePredicate p@@1 v_1@@0 r@@5 u)))))
 :qid |stdinbpl.297:25|
 :skolemid |20|
 :pattern ( (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r@@5 u))
)))
(assert (forall ((a@@35 Int) ) (!  (=> (< a@@35 0) (= (|Math#clip| a@@35) 0))
 :qid |stdinbpl.770:15|
 :skolemid |91|
 :pattern ( (|Math#clip| a@@35))
)))
(assert (forall ((e_1@@3 T@U) (i_1@@4 Int) (node_1@@3 T@U) (j@@5 Int) ) (!  (=> (and (and (= (type e_1@@3) IEdgesDomainTypeType) (= (type node_1@@3) RefType)) (not (= i_1@@4 j@@5))) (= (edge_lookup e_1@@3 j@@5) (edge_lookup (insert_edge e_1@@3 i_1@@4 node_1@@3) j@@5)))
 :qid |stdinbpl.889:15|
 :skolemid |119|
 :pattern ( (edge_lookup e_1@@3 j@@5) (insert_edge e_1@@3 i_1@@4 node_1@@3))
 :pattern ( (edge_lookup e_1@@3 j@@5) (edge_lookup (insert_edge e_1@@3 i_1@@4 node_1@@3) j@@5))
 :pattern ( (edge_lookup (insert_edge e_1@@3 i_1@@4 node_1@@3) j@@5))
)))
(assert (forall ((node_map_1@@2 T@U) (key_node_1@@1 T@U) (val_node_1@@1 T@U) (node_1@@4 T@U) ) (!  (=> (and (and (and (and (= (type node_map_1@@2) INodeMapDomainTypeType) (= (type key_node_1@@1) RefType)) (= (type val_node_1@@1) RefType)) (= (type node_1@@4) RefType)) (not (= node_1@@4 key_node_1@@1))) (= (lookup node_map_1@@2 node_1@@4) (lookup (insert node_map_1@@2 key_node_1@@1 val_node_1@@1) node_1@@4)))
 :qid |stdinbpl.947:15|
 :skolemid |125|
 :pattern ( (lookup node_map_1@@2 node_1@@4) (insert node_map_1@@2 key_node_1@@1 val_node_1@@1))
 :pattern ( (lookup node_map_1@@2 node_1@@4) (lookup (insert node_map_1@@2 key_node_1@@1 val_node_1@@1) node_1@@4))
 :pattern ( (lookup (insert node_map_1@@2 key_node_1@@1 val_node_1@@1) node_1@@4))
)))
(assert (forall ((s@@19 T@U) ) (! (let ((T@@85 (SeqTypeInv0 (type s@@19))))
 (=> (and (= (type s@@19) (SeqType T@@85)) (= (|Seq#Length| s@@19) 0)) (= s@@19 (|Seq#Empty| T@@85))))
 :qid |stdinbpl.332:18|
 :skolemid |24|
 :pattern ( (|Seq#Length| s@@19))
)))
(assert (forall ((s@@20 T@U) (n@@12 Int) ) (! (let ((T@@86 (SeqTypeInv0 (type s@@20))))
 (=> (and (= (type s@@20) (SeqType T@@86)) (<= n@@12 0)) (= (|Seq#Take| s@@20 n@@12) (|Seq#Empty| T@@86))))
 :qid |stdinbpl.507:18|
 :skolemid |46|
 :pattern ( (|Seq#Take| s@@20 n@@12))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
(assert (forall ((arg0@@57 T@U) ) (! (= (type (map_domain arg0@@57)) (SeqType RefType))
 :qid |funType:map_domain|
 :pattern ( (map_domain arg0@@57))
)))
(assert (forall ((node_map_1@@3 T@U) (key T@U) ) (!  (=> (and (= (type node_map_1@@3) INodeMapDomainTypeType) (= (type key) RefType)) (= (|Seq#Contains| (map_domain node_map_1@@3) key) (has_node node_map_1@@3 key)))
 :qid |stdinbpl.965:15|
 :skolemid |128|
 :pattern ( (map_domain node_map_1@@3) (has_node node_map_1@@3 key))
 :pattern ( (|Seq#ContainsTrigger| (map_domain node_map_1@@3) key))
 :pattern ( (|Seq#Contains| (map_domain node_map_1@@3) key))
 :pattern ( (has_node node_map_1@@3 key))
)))
(assert (forall ((a@@36 T@U) (x@@21 T@U) (o@@14 T@U) ) (! (let ((T@@87 (type x@@21)))
 (=> (and (= (type a@@36) (MultiSetType T@@87)) (= (type o@@14) T@@87)) (= (|MultiSet#Select| (|MultiSet#UnionOne| a@@36 x@@21) o@@14) (ite (= x@@21 o@@14) (+ (|MultiSet#Select| a@@36 o@@14) 1) (|MultiSet#Select| a@@36 o@@14)))))
 :qid |stdinbpl.803:18|
 :skolemid |100|
 :pattern ( (|MultiSet#Select| (|MultiSet#UnionOne| a@@36 x@@21) o@@14))
 :pattern ( (|MultiSet#UnionOne| a@@36 x@@21) (|MultiSet#Select| a@@36 o@@14))
)))
(assert (forall ((a@@37 T@U) (b@@27 T@U) ) (! (let ((T@@88 (MultiSetTypeInv0 (type a@@37))))
 (=> (and (= (type a@@37) (MultiSetType T@@88)) (= (type b@@27) (MultiSetType T@@88))) (= (|MultiSet#Equal| a@@37 b@@27) (forall ((o@@15 T@U) ) (!  (=> (= (type o@@15) T@@88) (= (|MultiSet#Select| a@@37 o@@15) (|MultiSet#Select| b@@27 o@@15)))
 :qid |stdinbpl.849:36|
 :skolemid |113|
 :pattern ( (|MultiSet#Select| a@@37 o@@15))
 :pattern ( (|MultiSet#Select| b@@27 o@@15))
)))))
 :qid |stdinbpl.848:17|
 :skolemid |114|
 :pattern ( (|MultiSet#Equal| a@@37 b@@27))
)))
(assert (forall ((a@@38 T@U) (b@@28 T@U) ) (! (let ((T@@89 (MultiSetTypeInv0 (type a@@38))))
 (=> (and (= (type a@@38) (MultiSetType T@@89)) (= (type b@@28) (MultiSetType T@@89))) (= (|MultiSet#Subset| a@@38 b@@28) (forall ((o@@16 T@U) ) (!  (=> (= (type o@@16) T@@89) (<= (|MultiSet#Select| a@@38 o@@16) (|MultiSet#Select| b@@28 o@@16)))
 :qid |stdinbpl.845:37|
 :skolemid |111|
 :pattern ( (|MultiSet#Select| a@@38 o@@16))
 :pattern ( (|MultiSet#Select| b@@28 o@@16))
)))))
 :qid |stdinbpl.844:17|
 :skolemid |112|
 :pattern ( (|MultiSet#Subset| a@@38 b@@28))
)))
(assert (forall ((a@@39 T@U) (b@@29 T@U) (o@@17 T@U) ) (! (let ((T@@90 (type o@@17)))
 (=> (and (= (type a@@39) (MapType2Type T@@90 boolType)) (= (type b@@29) (MapType2Type T@@90 boolType))) (= (U_2_bool (MapType2Select (|Set#Union| a@@39 b@@29) o@@17))  (or (U_2_bool (MapType2Select a@@39 o@@17)) (U_2_bool (MapType2Select b@@29 o@@17))))))
 :qid |stdinbpl.703:18|
 :skolemid |70|
 :pattern ( (MapType2Select (|Set#Union| a@@39 b@@29) o@@17))
)))
(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun res_copy_nodes () T@U)
(declare-fun PostHeap@0 () T@U)
(declare-fun QPMask@38 () T@U)
(declare-fun qpRange7 (T@U) Bool)
(declare-fun invRecv7 (T@U) T@U)
(declare-fun QPMask@37 () T@U)
(declare-fun res_node_map () T@U)
(declare-fun setOfRef () T@U)
(declare-fun node_map_image () T@U)
(declare-fun x_6 () T@U)
(declare-fun i_3 () Int)
(declare-fun Heap@@9 () T@U)
(declare-fun x_4 () T@U)
(declare-fun QPMask@3 () T@U)
(declare-fun rd () Real)
(declare-fun qpRange6 (T@U) Bool)
(declare-fun invRecv6 (T@U) T@U)
(declare-fun QPMask@36 () T@U)
(declare-fun x_2 () T@U)
(declare-fun qpRange5 (T@U) Bool)
(declare-fun invRecv5 (T@U) T@U)
(declare-fun nodeCopy () T@U)
(declare-fun res_copy_nodes@1 () T@U)
(declare-fun ExhaleHeap@0 () T@U)
(declare-fun QPMask@34 () T@U)
(declare-fun qpRange19 (T@U) Bool)
(declare-fun invRecv19 (T@U) T@U)
(declare-fun QPMask@33 () T@U)
(declare-fun res_node_map@1 () T@U)
(declare-fun r_3 () T@U)
(declare-fun j_3 () Int)
(declare-fun S@1 () T@U)
(declare-fun this () T@U)
(declare-fun j_1 () Int)
(declare-fun x_10 () T@U)
(declare-fun qpRange18 (T@U) Bool)
(declare-fun invRecv18 (T@U) T@U)
(declare-fun QPMask@32 () T@U)
(declare-fun x_8 () T@U)
(declare-fun qpRange17 (T@U) Bool)
(declare-fun invRecv17 (T@U) T@U)
(declare-fun QPMask@7 () T@U)
(declare-fun freshObj@0 () T@U)
(declare-fun res_node_map@3 () T@U)
(declare-fun r_20 () T@U)
(declare-fun res_copy_nodes@3 () T@U)
(declare-fun neverTriggered35 (T@U) Bool)
(declare-fun Heap@3 () T@U)
(declare-fun QPMask@30 () T@U)
(declare-fun QPMask@29 () T@U)
(declare-fun qpRange35 (T@U) Bool)
(declare-fun invRecv35 (T@U) T@U)
(declare-fun neverTriggered36 (T@U) Bool)
(declare-fun QPMask@31 () T@U)
(declare-fun r_18 () T@U)
(declare-fun j_12 () Int)
(declare-fun S@2 () T@U)
(declare-fun j_10 () Int)
(declare-fun x_78 () T@U)
(declare-fun dummyFunction (T@U) Bool)
(declare-fun neverTriggered34 (T@U) Bool)
(declare-fun QPMask@28 () T@U)
(declare-fun qpRange34 (T@U) Bool)
(declare-fun invRecv34 (T@U) T@U)
(declare-fun x_75 () T@U)
(declare-fun neverTriggered27 (T@U) Bool)
(declare-fun QPMask@22 () T@U)
(declare-fun QPMask@13 () T@U)
(declare-fun qpRange27 (T@U) Bool)
(declare-fun invRecv27 (T@U) T@U)
(declare-fun neverTriggered28 (T@U) Bool)
(declare-fun QPMask@23 () T@U)
(declare-fun qpRange28 (T@U) Bool)
(declare-fun invRecv28 (T@U) T@U)
(declare-fun ExhaleHeap@2 () T@U)
(declare-fun newNode@0 () T@U)
(declare-fun arg_rd@0 () Real)
(declare-fun QPMask@24 () T@U)
(declare-fun qpRange29 (T@U) Bool)
(declare-fun invRecv29 (T@U) T@U)
(declare-fun QPMask@25 () T@U)
(declare-fun qpRange30 (T@U) Bool)
(declare-fun invRecv30 (T@U) T@U)
(declare-fun QPMask@26 () T@U)
(declare-fun qpRange31 (T@U) Bool)
(declare-fun invRecv31 (T@U) T@U)
(declare-fun QPMask@27 () T@U)
(declare-fun qpRange32 (T@U) Bool)
(declare-fun invRecv32 (T@U) T@U)
(declare-fun i_6@1 () Int)
(declare-fun neverTriggered33 (T@U) Bool)
(declare-fun qpRange33 (T@U) Bool)
(declare-fun invRecv33 (T@U) T@U)
(declare-fun x_62 () T@U)
(declare-fun x_60 () T@U)
(declare-fun i$0 () Int)
(declare-fun QPMask@8 () T@U)
(declare-fun qpRange21 (T@U) Bool)
(declare-fun invRecv21 (T@U) T@U)
(declare-fun QPMask@9 () T@U)
(declare-fun qpRange22 (T@U) Bool)
(declare-fun invRecv22 (T@U) T@U)
(declare-fun QPMask@10 () T@U)
(declare-fun qpRange23 (T@U) Bool)
(declare-fun invRecv23 (T@U) T@U)
(declare-fun QPMask@11 () T@U)
(declare-fun qpRange24 (T@U) Bool)
(declare-fun invRecv24 (T@U) T@U)
(declare-fun newNode () T@U)
(declare-fun nodeForId () T@U)
(declare-fun nodeForId@0 () T@U)
(declare-fun QPMask@12 () T@U)
(declare-fun neverTriggered25 (T@U) Bool)
(declare-fun qpRange25 (T@U) Bool)
(declare-fun invRecv25 (T@U) T@U)
(declare-fun neverTriggered26 (T@U) Bool)
(declare-fun qpRange26 (T@U) Bool)
(declare-fun invRecv26 (T@U) T@U)
(declare-fun res_node_map@2 () T@U)
(declare-fun x_36 () T@U)
(declare-fun res_copy_nodes@2 () T@U)
(declare-fun neverTriggered11 (T@U) Bool)
(declare-fun Heap@2 () T@U)
(declare-fun QPMask@20 () T@U)
(declare-fun QPMask@19 () T@U)
(declare-fun qpRange11 (T@U) Bool)
(declare-fun invRecv11 (T@U) T@U)
(declare-fun neverTriggered12 (T@U) Bool)
(declare-fun QPMask@21 () T@U)
(declare-fun x_34 () T@U)
(declare-fun i_4 () Int)
(declare-fun x_32 () T@U)
(declare-fun neverTriggered10 (T@U) Bool)
(declare-fun QPMask@18 () T@U)
(declare-fun qpRange10 (T@U) Bool)
(declare-fun invRecv10 (T@U) T@U)
(declare-fun x_29 () T@U)
(declare-fun Mask@2 () T@U)
(declare-fun nodeCopy@1 () T@U)
(declare-fun neverTriggered9 (T@U) Bool)
(declare-fun qpRange9 (T@U) Bool)
(declare-fun invRecv9 (T@U) T@U)
(declare-fun QPMask@14 () T@U)
(declare-fun qpRange37 (T@U) Bool)
(declare-fun invRecv37 (T@U) T@U)
(declare-fun QPMask@15 () T@U)
(declare-fun qpRange38 (T@U) Bool)
(declare-fun invRecv38 (T@U) T@U)
(declare-fun QPMask@16 () T@U)
(declare-fun qpRange39 (T@U) Bool)
(declare-fun invRecv39 (T@U) T@U)
(declare-fun QPMask@17 () T@U)
(declare-fun qpRange40 (T@U) Bool)
(declare-fun invRecv40 (T@U) T@U)
(declare-fun res_node_map@0 () T@U)
(declare-fun res_copy_nodes@0 () T@U)
(declare-fun neverTriggered15 (T@U) Bool)
(declare-fun Heap@1 () T@U)
(declare-fun QPMask@6 () T@U)
(declare-fun QPMask@5 () T@U)
(declare-fun qpRange15 (T@U) Bool)
(declare-fun invRecv15 (T@U) T@U)
(declare-fun neverTriggered16 (T@U) Bool)
(declare-fun qpRange16 (T@U) Bool)
(declare-fun invRecv16 (T@U) T@U)
(declare-fun node_map_1@@4 () T@U)
(declare-fun nodeCopy@0 () T@U)
(declare-fun r_2 () T@U)
(declare-fun r_1 () T@U)
(declare-fun j_2 () Int)
(declare-fun S@0 () T@U)
(declare-fun j@@6 () Int)
(declare-fun x_44 () T@U)
(declare-fun neverTriggered14 (T@U) Bool)
(declare-fun QPMask@4 () T@U)
(declare-fun qpRange14 (T@U) Bool)
(declare-fun invRecv14 (T@U) T@U)
(declare-fun x_41 () T@U)
(declare-fun Heap@0 () T@U)
(declare-fun Mask@0 () T@U)
(declare-fun Mask@1 () T@U)
(declare-fun neverTriggered13 (T@U) Bool)
(declare-fun qpRange13 (T@U) Bool)
(declare-fun invRecv13 (T@U) T@U)
(declare-fun qpRange4 (T@U) Bool)
(declare-fun invRecv4 (T@U) T@U)
(declare-fun QPMask@2 () T@U)
(declare-fun qpRange3 (T@U) Bool)
(declare-fun invRecv3 (T@U) T@U)
(declare-fun QPMask@1 () T@U)
(declare-fun x@@22 () T@U)
(declare-fun i_2 () Int)
(declare-fun qpRange2 (T@U) Bool)
(declare-fun invRecv2 (T@U) T@U)
(declare-fun QPMask@0 () T@U)
(declare-fun qpRange1 (T@U) Bool)
(declare-fun invRecv1 (T@U) T@U)
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (= (type setOfRef) (MapType2Type RefType boolType)) (= (type x@@22) RefType)) (= (type Heap@@9) (MapType0Type RefType))) (= (type QPMask@1) (MapType1Type RefType realType))) (= (type x_41) RefType)) (= (type Heap@1) (MapType0Type RefType))) (= (type x_44) RefType)) (= (type S@0) (MapType2Type intType boolType))) (= (type this) RefType)) (= (type r_1) RefType)) (= (type res_node_map@0) INodeMapDomainTypeType)) (= (type r_2) RefType)) (= (type res_copy_nodes@0) (MapType2Type RefType boolType))) (= (type x_29) RefType)) (= (type Heap@2) (MapType0Type RefType))) (= (type x_32) RefType)) (= (type x_34) RefType)) (= (type res_node_map@2) INodeMapDomainTypeType)) (= (type res_copy_nodes@2) (MapType2Type RefType boolType))) (= (type QPMask@20) (MapType1Type RefType realType))) (= (type QPMask@19) (MapType1Type RefType realType))) (forall ((arg0@@58 T@U) ) (! (= (type (invRecv11 arg0@@58)) RefType)
 :qid |funType:invRecv11|
 :pattern ( (invRecv11 arg0@@58))
))) (= (type QPMask@21) (MapType1Type RefType realType))) (= (type x_36) RefType)) (= (type node_map_image) (MapType2Type RefType boolType))) (= (type QPMask@18) (MapType1Type RefType realType))) (forall ((arg0@@59 T@U) ) (! (= (type (invRecv10 arg0@@59)) RefType)
 :qid |funType:invRecv10|
 :pattern ( (invRecv10 arg0@@59))
))) (= (type Mask@2) (MapType1Type RefType realType))) (= (type nodeCopy@1) RefType)) (forall ((arg0@@60 T@U) ) (! (= (type (invRecv9 arg0@@60)) RefType)
 :qid |funType:invRecv9|
 :pattern ( (invRecv9 arg0@@60))
))) (= (type node_map_1@@4) INodeMapDomainTypeType)) (= (type nodeCopy@0) RefType)) (= (type QPMask@3) (MapType1Type RefType realType))) (= (type S@1) (MapType2Type intType boolType))) (= (type ExhaleHeap@0) (MapType0Type RefType))) (= (type QPMask@7) (MapType1Type RefType realType))) (= (type res_copy_nodes@1) (MapType2Type RefType boolType))) (= (type freshObj@0) RefType)) (= (type QPMask@14) (MapType1Type RefType realType))) (forall ((arg0@@61 T@U) ) (! (= (type (invRecv37 arg0@@61)) RefType)
 :qid |funType:invRecv37|
 :pattern ( (invRecv37 arg0@@61))
))) (= (type QPMask@15) (MapType1Type RefType realType))) (forall ((arg0@@62 T@U) ) (! (= (type (invRecv38 arg0@@62)) RefType)
 :qid |funType:invRecv38|
 :pattern ( (invRecv38 arg0@@62))
))) (= (type res_node_map@1) INodeMapDomainTypeType)) (= (type QPMask@16) (MapType1Type RefType realType))) (forall ((arg0@@63 T@U) ) (! (= (type (invRecv39 arg0@@63)) RefType)
 :qid |funType:invRecv39|
 :pattern ( (invRecv39 arg0@@63))
))) (= (type QPMask@17) (MapType1Type RefType realType))) (forall ((arg0@@64 T@U) ) (! (= (type (invRecv40 arg0@@64)) RefType)
 :qid |funType:invRecv40|
 :pattern ( (invRecv40 arg0@@64))
))) (= (type x_60) RefType)) (= (type x_62) RefType)) (= (type x_75) RefType)) (= (type Heap@3) (MapType0Type RefType))) (= (type x_78) RefType)) (= (type S@2) (MapType2Type intType boolType))) (= (type r_18) RefType)) (= (type res_node_map@3) INodeMapDomainTypeType)) (= (type res_copy_nodes@3) (MapType2Type RefType boolType))) (= (type QPMask@30) (MapType1Type RefType realType))) (= (type QPMask@29) (MapType1Type RefType realType))) (forall ((arg0@@65 T@U) ) (! (= (type (invRecv35 arg0@@65)) RefType)
 :qid |funType:invRecv35|
 :pattern ( (invRecv35 arg0@@65))
))) (= (type QPMask@31) (MapType1Type RefType realType))) (= (type r_20) RefType)) (= (type QPMask@28) (MapType1Type RefType realType))) (forall ((arg0@@66 T@U) ) (! (= (type (invRecv34 arg0@@66)) RefType)
 :qid |funType:invRecv34|
 :pattern ( (invRecv34 arg0@@66))
))) (= (type QPMask@22) (MapType1Type RefType realType))) (= (type QPMask@13) (MapType1Type RefType realType))) (forall ((arg0@@67 T@U) ) (! (= (type (invRecv27 arg0@@67)) RefType)
 :qid |funType:invRecv27|
 :pattern ( (invRecv27 arg0@@67))
))) (= (type QPMask@23) (MapType1Type RefType realType))) (forall ((arg0@@68 T@U) ) (! (= (type (invRecv28 arg0@@68)) RefType)
 :qid |funType:invRecv28|
 :pattern ( (invRecv28 arg0@@68))
))) (= (type ExhaleHeap@2) (MapType0Type RefType))) (= (type newNode@0) RefType)) (= (type QPMask@24) (MapType1Type RefType realType))) (forall ((arg0@@69 T@U) ) (! (= (type (invRecv29 arg0@@69)) RefType)
 :qid |funType:invRecv29|
 :pattern ( (invRecv29 arg0@@69))
))) (= (type QPMask@25) (MapType1Type RefType realType))) (forall ((arg0@@70 T@U) ) (! (= (type (invRecv30 arg0@@70)) RefType)
 :qid |funType:invRecv30|
 :pattern ( (invRecv30 arg0@@70))
))) (= (type QPMask@26) (MapType1Type RefType realType))) (forall ((arg0@@71 T@U) ) (! (= (type (invRecv31 arg0@@71)) RefType)
 :qid |funType:invRecv31|
 :pattern ( (invRecv31 arg0@@71))
))) (= (type QPMask@27) (MapType1Type RefType realType))) (forall ((arg0@@72 T@U) ) (! (= (type (invRecv32 arg0@@72)) RefType)
 :qid |funType:invRecv32|
 :pattern ( (invRecv32 arg0@@72))
))) (forall ((arg0@@73 T@U) ) (! (= (type (invRecv33 arg0@@73)) RefType)
 :qid |funType:invRecv33|
 :pattern ( (invRecv33 arg0@@73))
))) (= (type QPMask@8) (MapType1Type RefType realType))) (forall ((arg0@@74 T@U) ) (! (= (type (invRecv21 arg0@@74)) RefType)
 :qid |funType:invRecv21|
 :pattern ( (invRecv21 arg0@@74))
))) (= (type QPMask@9) (MapType1Type RefType realType))) (forall ((arg0@@75 T@U) ) (! (= (type (invRecv22 arg0@@75)) RefType)
 :qid |funType:invRecv22|
 :pattern ( (invRecv22 arg0@@75))
))) (= (type QPMask@10) (MapType1Type RefType realType))) (forall ((arg0@@76 T@U) ) (! (= (type (invRecv23 arg0@@76)) RefType)
 :qid |funType:invRecv23|
 :pattern ( (invRecv23 arg0@@76))
))) (= (type QPMask@11) (MapType1Type RefType realType))) (forall ((arg0@@77 T@U) ) (! (= (type (invRecv24 arg0@@77)) RefType)
 :qid |funType:invRecv24|
 :pattern ( (invRecv24 arg0@@77))
))) (= (type newNode) RefType)) (= (type nodeForId) RefType)) (= (type nodeForId@0) RefType)) (= (type QPMask@12) (MapType1Type RefType realType))) (forall ((arg0@@78 T@U) ) (! (= (type (invRecv25 arg0@@78)) RefType)
 :qid |funType:invRecv25|
 :pattern ( (invRecv25 arg0@@78))
))) (forall ((arg0@@79 T@U) ) (! (= (type (invRecv26 arg0@@79)) RefType)
 :qid |funType:invRecv26|
 :pattern ( (invRecv26 arg0@@79))
))) (= (type x_8) RefType)) (= (type QPMask@32) (MapType1Type RefType realType))) (= (type x_10) RefType)) (= (type QPMask@33) (MapType1Type RefType realType))) (= (type r_3) RefType)) (= (type QPMask@34) (MapType1Type RefType realType))) (forall ((arg0@@80 T@U) ) (! (= (type (invRecv19 arg0@@80)) RefType)
 :qid |funType:invRecv19|
 :pattern ( (invRecv19 arg0@@80))
))) (forall ((arg0@@81 T@U) ) (! (= (type (invRecv18 arg0@@81)) RefType)
 :qid |funType:invRecv18|
 :pattern ( (invRecv18 arg0@@81))
))) (forall ((arg0@@82 T@U) ) (! (= (type (invRecv17 arg0@@82)) RefType)
 :qid |funType:invRecv17|
 :pattern ( (invRecv17 arg0@@82))
))) (= (type QPMask@6) (MapType1Type RefType realType))) (= (type QPMask@5) (MapType1Type RefType realType))) (forall ((arg0@@83 T@U) ) (! (= (type (invRecv15 arg0@@83)) RefType)
 :qid |funType:invRecv15|
 :pattern ( (invRecv15 arg0@@83))
))) (forall ((arg0@@84 T@U) ) (! (= (type (invRecv16 arg0@@84)) RefType)
 :qid |funType:invRecv16|
 :pattern ( (invRecv16 arg0@@84))
))) (= (type QPMask@4) (MapType1Type RefType realType))) (forall ((arg0@@85 T@U) ) (! (= (type (invRecv14 arg0@@85)) RefType)
 :qid |funType:invRecv14|
 :pattern ( (invRecv14 arg0@@85))
))) (= (type Heap@0) (MapType0Type RefType))) (= (type Mask@0) (MapType1Type RefType realType))) (= (type Mask@1) (MapType1Type RefType realType))) (forall ((arg0@@86 T@U) ) (! (= (type (invRecv13 arg0@@86)) RefType)
 :qid |funType:invRecv13|
 :pattern ( (invRecv13 arg0@@86))
))) (= (type x_2) RefType)) (= (type QPMask@36) (MapType1Type RefType realType))) (= (type x_4) RefType)) (= (type QPMask@37) (MapType1Type RefType realType))) (= (type x_6) RefType)) (= (type PostHeap@0) (MapType0Type RefType))) (= (type res_copy_nodes) (MapType2Type RefType boolType))) (= (type QPMask@38) (MapType1Type RefType realType))) (forall ((arg0@@87 T@U) ) (! (= (type (invRecv7 arg0@@87)) RefType)
 :qid |funType:invRecv7|
 :pattern ( (invRecv7 arg0@@87))
))) (= (type res_node_map) INodeMapDomainTypeType)) (forall ((arg0@@88 T@U) ) (! (= (type (invRecv6 arg0@@88)) RefType)
 :qid |funType:invRecv6|
 :pattern ( (invRecv6 arg0@@88))
))) (forall ((arg0@@89 T@U) ) (! (= (type (invRecv5 arg0@@89)) RefType)
 :qid |funType:invRecv5|
 :pattern ( (invRecv5 arg0@@89))
))) (= (type nodeCopy) RefType)) (forall ((arg0@@90 T@U) ) (! (= (type (invRecv4 arg0@@90)) RefType)
 :qid |funType:invRecv4|
 :pattern ( (invRecv4 arg0@@90))
))) (= (type QPMask@2) (MapType1Type RefType realType))) (forall ((arg0@@91 T@U) ) (! (= (type (invRecv3 arg0@@91)) RefType)
 :qid |funType:invRecv3|
 :pattern ( (invRecv3 arg0@@91))
))) (forall ((arg0@@92 T@U) ) (! (= (type (invRecv2 arg0@@92)) RefType)
 :qid |funType:invRecv2|
 :pattern ( (invRecv2 arg0@@92))
))) (= (type QPMask@0) (MapType1Type RefType realType))) (forall ((arg0@@93 T@U) ) (! (= (type (invRecv1 arg0@@93)) RefType)
 :qid |funType:invRecv1|
 :pattern ( (invRecv1 arg0@@93))
))))
(set-info :boogie-vc-id graph_copy_rec)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 272) (let ((anon162_Else_correct  (=> (= (ControlFlow 0 245) (- 0 244)) (forall ((x_27 T@U) (x_27_1 T@U) ) (!  (=> (and (= (type x_27) RefType) (= (type x_27_1) RefType)) (=> (and (and (and (and (not (= x_27 x_27_1)) (U_2_bool (MapType2Select res_copy_nodes x_27))) (U_2_bool (MapType2Select res_copy_nodes x_27_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= x_27 x_27_1))))
 :qid |stdinbpl.1480:15|
 :skolemid |182|
 :no-pattern (type x_27)
 :no-pattern (type x_27_1)
 :no-pattern (U_2_int x_27)
 :no-pattern (U_2_bool x_27)
 :no-pattern (U_2_int x_27_1)
 :no-pattern (U_2_bool x_27_1)
)))))
(let ((anon162_Then_correct true))
(let ((anon161_Else_correct  (and (=> (= (ControlFlow 0 246) (- 0 247)) (forall ((x_25 T@U) (x_25_1 T@U) ) (!  (=> (and (= (type x_25) RefType) (= (type x_25_1) RefType)) (=> (and (and (and (and (not (= x_25 x_25_1)) (U_2_bool (MapType2Select res_copy_nodes x_25))) (U_2_bool (MapType2Select res_copy_nodes x_25_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= x_25 x_25_1))))
 :qid |stdinbpl.1440:15|
 :skolemid |176|
 :no-pattern (type x_25)
 :no-pattern (type x_25_1)
 :no-pattern (U_2_int x_25)
 :no-pattern (U_2_bool x_25)
 :no-pattern (U_2_int x_25_1)
 :no-pattern (U_2_bool x_25_1)
))) (=> (forall ((x_25@@0 T@U) (x_25_1@@0 T@U) ) (!  (=> (and (= (type x_25@@0) RefType) (= (type x_25_1@@0) RefType)) (=> (and (and (and (and (not (= x_25@@0 x_25_1@@0)) (U_2_bool (MapType2Select res_copy_nodes x_25@@0))) (U_2_bool (MapType2Select res_copy_nodes x_25_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= x_25@@0 x_25_1@@0))))
 :qid |stdinbpl.1440:15|
 :skolemid |176|
 :no-pattern (type x_25@@0)
 :no-pattern (type x_25_1@@0)
 :no-pattern (U_2_int x_25@@0)
 :no-pattern (U_2_bool x_25@@0)
 :no-pattern (U_2_int x_25_1@@0)
 :no-pattern (U_2_bool x_25_1@@0)
)) (=> (forall ((x_25@@1 T@U) ) (!  (=> (= (type x_25@@1) RefType) (=> (and (U_2_bool (MapType2Select res_copy_nodes x_25@@1)) (< NoPerm FullPerm)) (and (qpRange7 x_25@@1) (= (invRecv7 x_25@@1) x_25@@1))))
 :qid |stdinbpl.1446:22|
 :skolemid |177|
 :pattern ( (MapType0Select PostHeap@0 x_25@@1 val))
 :pattern ( (MapType1Select QPMask@38 x_25@@1 val))
 :pattern ( (MapType2Select res_copy_nodes x_25@@1))
)) (=> (and (forall ((o_3 T@U) ) (!  (=> (= (type o_3) RefType) (=> (and (and (U_2_bool (MapType2Select res_copy_nodes (invRecv7 o_3))) (< NoPerm FullPerm)) (qpRange7 o_3)) (= (invRecv7 o_3) o_3)))
 :qid |stdinbpl.1450:22|
 :skolemid |178|
 :pattern ( (invRecv7 o_3))
)) (forall ((x_25@@2 T@U) ) (!  (=> (and (= (type x_25@@2) RefType) (U_2_bool (MapType2Select res_copy_nodes x_25@@2))) (not (= x_25@@2 null)))
 :qid |stdinbpl.1456:22|
 :skolemid |179|
 :pattern ( (MapType0Select PostHeap@0 x_25@@2 val))
 :pattern ( (MapType1Select QPMask@38 x_25@@2 val))
 :pattern ( (MapType2Select res_copy_nodes x_25@@2))
))) (=> (and (and (forall ((o_3@@0 T@U) ) (!  (=> (= (type o_3@@0) RefType) (and (=> (and (and (U_2_bool (MapType2Select res_copy_nodes (invRecv7 o_3@@0))) (< NoPerm FullPerm)) (qpRange7 o_3@@0)) (and (=> (< NoPerm FullPerm) (= (invRecv7 o_3@@0) o_3@@0)) (= (U_2_real (MapType1Select QPMask@38 o_3@@0 val)) (+ (U_2_real (MapType1Select QPMask@37 o_3@@0 val)) FullPerm)))) (=> (not (and (and (U_2_bool (MapType2Select res_copy_nodes (invRecv7 o_3@@0))) (< NoPerm FullPerm)) (qpRange7 o_3@@0))) (= (U_2_real (MapType1Select QPMask@38 o_3@@0 val)) (U_2_real (MapType1Select QPMask@37 o_3@@0 val))))))
 :qid |stdinbpl.1462:22|
 :skolemid |180|
 :pattern ( (MapType1Select QPMask@38 o_3@@0 val))
)) (forall ((o_3@@1 T@U) (f_5 T@U) ) (! (let ((B@@11 (FieldTypeInv1 (type f_5))))
(let ((A@@12 (FieldTypeInv0 (type f_5))))
 (=> (and (and (= (type o_3@@1) RefType) (= (type f_5) (FieldType A@@12 B@@11))) (not (= f_5 val))) (= (U_2_real (MapType1Select QPMask@37 o_3@@1 f_5)) (U_2_real (MapType1Select QPMask@38 o_3@@1 f_5))))))
 :qid |stdinbpl.1466:29|
 :skolemid |181|
 :pattern ( (MapType1Select QPMask@37 o_3@@1 f_5))
 :pattern ( (MapType1Select QPMask@38 o_3@@1 f_5))
))) (and (state PostHeap@0 QPMask@38) (state PostHeap@0 QPMask@38))) (and (=> (= (ControlFlow 0 246) 243) anon162_Then_correct) (=> (= (ControlFlow 0 246) 245) anon162_Else_correct)))))))))
(let ((anon161_Then_correct true))
(let ((anon160_Else_correct  (=> (and (forall ((x_23 T@U) ) (!  (=> (and (= (type x_23) RefType) (|Seq#Contains| (map_domain res_node_map) x_23)) (U_2_bool (MapType2Select res_copy_nodes (lookup res_node_map x_23))))
 :qid |stdinbpl.1428:20|
 :skolemid |175|
 :pattern ( (|Seq#ContainsTrigger| (map_domain res_node_map) x_23))
 :pattern ( (|Seq#Contains| (map_domain res_node_map) x_23))
 :pattern ( (MapType2Select res_copy_nodes (lookup res_node_map x_23)))
)) (state PostHeap@0 QPMask@37)) (and (=> (= (ControlFlow 0 248) 242) anon161_Then_correct) (=> (= (ControlFlow 0 248) 246) anon161_Else_correct)))))
(let ((anon160_Then_correct true))
(let ((anon157_Else_correct  (=> (and (and (forall ((x_21 T@U) (i_3_1 Int) ) (!  (=> (= (type x_21) RefType) (=> (and (U_2_bool (MapType2Select setOfRef x_21)) (U_2_bool (MapType2Select (edges_domain (MapType0Select PostHeap@0 x_21 edges)) (int_2_U i_3_1)))) (U_2_bool (MapType2Select setOfRef (edge_lookup (MapType0Select PostHeap@0 x_21 edges) i_3_1)))))
 :qid |stdinbpl.1416:20|
 :skolemid |174|
 :pattern ( (MapType2Select setOfRef x_21) (MapType2Select (edges_domain (MapType0Select PostHeap@0 x_21 edges)) (int_2_U i_3_1)))
 :pattern ( (MapType2Select setOfRef x_21) (edge_lookup (MapType0Select PostHeap@0 x_21 edges) i_3_1))
 :pattern ( (MapType2Select setOfRef x_21) (MapType2Select setOfRef (edge_lookup (MapType0Select PostHeap@0 x_21 edges) i_3_1)))
 :pattern ( (edges_domain (MapType0Select PostHeap@0 x_21 edges)) (edge_lookup (MapType0Select PostHeap@0 x_21 edges) i_3_1))
 :pattern ( (edges_domain (MapType0Select PostHeap@0 x_21 edges)) (MapType2Select setOfRef (edge_lookup (MapType0Select PostHeap@0 x_21 edges) i_3_1)))
 :pattern ( (MapType2Select (edges_domain (MapType0Select PostHeap@0 x_21 edges)) (int_2_U i_3_1)))
 :pattern ( (MapType2Select setOfRef (edge_lookup (MapType0Select PostHeap@0 x_21 edges) i_3_1)))
)) (state PostHeap@0 QPMask@37)) (and (|Set#Equal| res_copy_nodes (|Set#Union| res_copy_nodes node_map_image)) (state PostHeap@0 QPMask@37))) (and (=> (= (ControlFlow 0 249) 241) anon160_Then_correct) (=> (= (ControlFlow 0 249) 248) anon160_Else_correct)))))
(let ((anon34_correct true))
(let ((anon159_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select setOfRef x_6)) (U_2_bool (MapType2Select (edges_domain (MapType0Select PostHeap@0 x_6 edges)) (int_2_U i_3))))) (= (ControlFlow 0 237) 234)) anon34_correct)))
(let ((anon159_Then_correct  (=> (and (U_2_bool (MapType2Select setOfRef x_6)) (U_2_bool (MapType2Select (edges_domain (MapType0Select PostHeap@0 x_6 edges)) (int_2_U i_3)))) (and (=> (= (ControlFlow 0 235) (- 0 236)) (HasDirectPerm QPMask@37 x_6 edges)) (=> (HasDirectPerm QPMask@37 x_6 edges) (=> (= (ControlFlow 0 235) 234) anon34_correct))))))
(let ((anon158_Else_correct  (=> (not (U_2_bool (MapType2Select setOfRef x_6))) (and (=> (= (ControlFlow 0 240) 235) anon159_Then_correct) (=> (= (ControlFlow 0 240) 237) anon159_Else_correct)))))
(let ((anon158_Then_correct  (=> (U_2_bool (MapType2Select setOfRef x_6)) (and (=> (= (ControlFlow 0 238) (- 0 239)) (HasDirectPerm QPMask@37 x_6 edges)) (=> (HasDirectPerm QPMask@37 x_6 edges) (and (=> (= (ControlFlow 0 238) 235) anon159_Then_correct) (=> (= (ControlFlow 0 238) 237) anon159_Else_correct)))))))
(let ((anon155_Else_correct  (=> (and (forall ((x_19 T@U) ) (!  (=> (and (= (type x_19) RefType) (U_2_bool (MapType2Select setOfRef x_19))) (= (MapType0Select PostHeap@0 x_19 edges) (MapType0Select Heap@@9 x_19 edges)))
 :qid |stdinbpl.1398:20|
 :skolemid |173|
 :pattern ( (MapType2Select setOfRef x_19))
)) (state PostHeap@0 QPMask@37)) (and (and (=> (= (ControlFlow 0 250) 249) anon157_Else_correct) (=> (= (ControlFlow 0 250) 238) anon158_Then_correct)) (=> (= (ControlFlow 0 250) 240) anon158_Else_correct)))))
(let ((anon28_correct true))
(let ((anon156_Else_correct  (=> (and (not (U_2_bool (MapType2Select setOfRef x_4))) (= (ControlFlow 0 233) 229)) anon28_correct)))
(let ((anon156_Then_correct  (=> (U_2_bool (MapType2Select setOfRef x_4)) (and (=> (= (ControlFlow 0 230) (- 0 232)) (HasDirectPerm QPMask@37 x_4 edges)) (=> (HasDirectPerm QPMask@37 x_4 edges) (and (=> (= (ControlFlow 0 230) (- 0 231)) (HasDirectPerm QPMask@3 x_4 edges)) (=> (HasDirectPerm QPMask@3 x_4 edges) (=> (= (ControlFlow 0 230) 229) anon28_correct))))))))
(let ((anon154_Else_correct  (and (=> (= (ControlFlow 0 251) (- 0 253)) (forall ((x_17 T@U) (x_17_1 T@U) ) (!  (=> (and (= (type x_17) RefType) (= (type x_17_1) RefType)) (=> (and (and (and (and (not (= x_17 x_17_1)) (U_2_bool (MapType2Select setOfRef x_17))) (U_2_bool (MapType2Select setOfRef x_17_1))) (< NoPerm rd)) (< NoPerm rd)) (not (= x_17 x_17_1))))
 :qid |stdinbpl.1348:15|
 :skolemid |166|
 :no-pattern (type x_17)
 :no-pattern (type x_17_1)
 :no-pattern (U_2_int x_17)
 :no-pattern (U_2_bool x_17)
 :no-pattern (U_2_int x_17_1)
 :no-pattern (U_2_bool x_17_1)
))) (=> (forall ((x_17@@0 T@U) (x_17_1@@0 T@U) ) (!  (=> (and (= (type x_17@@0) RefType) (= (type x_17_1@@0) RefType)) (=> (and (and (and (and (not (= x_17@@0 x_17_1@@0)) (U_2_bool (MapType2Select setOfRef x_17@@0))) (U_2_bool (MapType2Select setOfRef x_17_1@@0))) (< NoPerm rd)) (< NoPerm rd)) (not (= x_17@@0 x_17_1@@0))))
 :qid |stdinbpl.1348:15|
 :skolemid |166|
 :no-pattern (type x_17@@0)
 :no-pattern (type x_17_1@@0)
 :no-pattern (U_2_int x_17@@0)
 :no-pattern (U_2_bool x_17@@0)
 :no-pattern (U_2_int x_17_1@@0)
 :no-pattern (U_2_bool x_17_1@@0)
)) (=> (and (forall ((x_17@@1 T@U) ) (!  (=> (= (type x_17@@1) RefType) (=> (and (U_2_bool (MapType2Select setOfRef x_17@@1)) (< NoPerm rd)) (and (qpRange6 x_17@@1) (= (invRecv6 x_17@@1) x_17@@1))))
 :qid |stdinbpl.1354:22|
 :skolemid |167|
 :pattern ( (MapType0Select PostHeap@0 x_17@@1 edges))
 :pattern ( (MapType1Select QPMask@37 x_17@@1 edges))
 :pattern ( (MapType2Select setOfRef x_17@@1))
)) (forall ((o_3@@2 T@U) ) (!  (=> (= (type o_3@@2) RefType) (=> (and (and (U_2_bool (MapType2Select setOfRef (invRecv6 o_3@@2))) (< NoPerm rd)) (qpRange6 o_3@@2)) (= (invRecv6 o_3@@2) o_3@@2)))
 :qid |stdinbpl.1358:22|
 :skolemid |168|
 :pattern ( (invRecv6 o_3@@2))
))) (and (=> (= (ControlFlow 0 251) (- 0 252)) (forall ((x_17@@2 T@U) ) (!  (=> (and (= (type x_17@@2) RefType) (U_2_bool (MapType2Select setOfRef x_17@@2))) (>= rd NoPerm))
 :qid |stdinbpl.1364:15|
 :skolemid |169|
 :pattern ( (MapType0Select PostHeap@0 x_17@@2 edges))
 :pattern ( (MapType1Select QPMask@37 x_17@@2 edges))
 :pattern ( (MapType2Select setOfRef x_17@@2))
))) (=> (forall ((x_17@@3 T@U) ) (!  (=> (and (= (type x_17@@3) RefType) (U_2_bool (MapType2Select setOfRef x_17@@3))) (>= rd NoPerm))
 :qid |stdinbpl.1364:15|
 :skolemid |169|
 :pattern ( (MapType0Select PostHeap@0 x_17@@3 edges))
 :pattern ( (MapType1Select QPMask@37 x_17@@3 edges))
 :pattern ( (MapType2Select setOfRef x_17@@3))
)) (=> (forall ((x_17@@4 T@U) ) (!  (=> (= (type x_17@@4) RefType) (=> (and (U_2_bool (MapType2Select setOfRef x_17@@4)) (> rd NoPerm)) (not (= x_17@@4 null))))
 :qid |stdinbpl.1370:22|
 :skolemid |170|
 :pattern ( (MapType0Select PostHeap@0 x_17@@4 edges))
 :pattern ( (MapType1Select QPMask@37 x_17@@4 edges))
 :pattern ( (MapType2Select setOfRef x_17@@4))
)) (=> (and (and (forall ((o_3@@3 T@U) ) (!  (=> (= (type o_3@@3) RefType) (and (=> (and (and (U_2_bool (MapType2Select setOfRef (invRecv6 o_3@@3))) (< NoPerm rd)) (qpRange6 o_3@@3)) (and (=> (< NoPerm rd) (= (invRecv6 o_3@@3) o_3@@3)) (= (U_2_real (MapType1Select QPMask@37 o_3@@3 edges)) (+ (U_2_real (MapType1Select QPMask@36 o_3@@3 edges)) rd)))) (=> (not (and (and (U_2_bool (MapType2Select setOfRef (invRecv6 o_3@@3))) (< NoPerm rd)) (qpRange6 o_3@@3))) (= (U_2_real (MapType1Select QPMask@37 o_3@@3 edges)) (U_2_real (MapType1Select QPMask@36 o_3@@3 edges))))))
 :qid |stdinbpl.1376:22|
 :skolemid |171|
 :pattern ( (MapType1Select QPMask@37 o_3@@3 edges))
)) (forall ((o_3@@4 T@U) (f_5@@0 T@U) ) (! (let ((B@@12 (FieldTypeInv1 (type f_5@@0))))
(let ((A@@13 (FieldTypeInv0 (type f_5@@0))))
 (=> (and (and (= (type o_3@@4) RefType) (= (type f_5@@0) (FieldType A@@13 B@@12))) (not (= f_5@@0 edges))) (= (U_2_real (MapType1Select QPMask@36 o_3@@4 f_5@@0)) (U_2_real (MapType1Select QPMask@37 o_3@@4 f_5@@0))))))
 :qid |stdinbpl.1380:29|
 :skolemid |172|
 :pattern ( (MapType1Select QPMask@36 o_3@@4 f_5@@0))
 :pattern ( (MapType1Select QPMask@37 o_3@@4 f_5@@0))
))) (and (state PostHeap@0 QPMask@37) (state PostHeap@0 QPMask@37))) (and (and (=> (= (ControlFlow 0 251) 250) anon155_Else_correct) (=> (= (ControlFlow 0 251) 230) anon156_Then_correct)) (=> (= (ControlFlow 0 251) 233) anon156_Else_correct)))))))))))
(let ((anon154_Then_correct true))
(let ((anon152_Else_correct  (=> (and (forall ((x_15 T@U) ) (!  (=> (and (= (type x_15) RefType) (U_2_bool (MapType2Select setOfRef x_15))) (= (U_2_int (MapType0Select PostHeap@0 x_15 val)) (U_2_int (MapType0Select Heap@@9 x_15 val))))
 :qid |stdinbpl.1336:20|
 :skolemid |165|
 :pattern ( (MapType2Select setOfRef x_15))
)) (state PostHeap@0 QPMask@36)) (and (=> (= (ControlFlow 0 254) 228) anon154_Then_correct) (=> (= (ControlFlow 0 254) 251) anon154_Else_correct)))))
(let ((anon22_correct true))
(let ((anon153_Else_correct  (=> (and (not (U_2_bool (MapType2Select setOfRef x_2))) (= (ControlFlow 0 227) 223)) anon22_correct)))
(let ((anon153_Then_correct  (=> (U_2_bool (MapType2Select setOfRef x_2)) (and (=> (= (ControlFlow 0 224) (- 0 226)) (HasDirectPerm QPMask@36 x_2 val)) (=> (HasDirectPerm QPMask@36 x_2 val) (and (=> (= (ControlFlow 0 224) (- 0 225)) (HasDirectPerm QPMask@3 x_2 val)) (=> (HasDirectPerm QPMask@3 x_2 val) (=> (= (ControlFlow 0 224) 223) anon22_correct))))))))
(let ((anon151_Else_correct  (and (=> (= (ControlFlow 0 255) (- 0 257)) (forall ((x_13 T@U) (x_13_1 T@U) ) (!  (=> (and (= (type x_13) RefType) (= (type x_13_1) RefType)) (=> (and (and (and (and (not (= x_13 x_13_1)) (U_2_bool (MapType2Select setOfRef x_13))) (U_2_bool (MapType2Select setOfRef x_13_1))) (< NoPerm rd)) (< NoPerm rd)) (not (= x_13 x_13_1))))
 :qid |stdinbpl.1286:15|
 :skolemid |158|
 :no-pattern (type x_13)
 :no-pattern (type x_13_1)
 :no-pattern (U_2_int x_13)
 :no-pattern (U_2_bool x_13)
 :no-pattern (U_2_int x_13_1)
 :no-pattern (U_2_bool x_13_1)
))) (=> (forall ((x_13@@0 T@U) (x_13_1@@0 T@U) ) (!  (=> (and (= (type x_13@@0) RefType) (= (type x_13_1@@0) RefType)) (=> (and (and (and (and (not (= x_13@@0 x_13_1@@0)) (U_2_bool (MapType2Select setOfRef x_13@@0))) (U_2_bool (MapType2Select setOfRef x_13_1@@0))) (< NoPerm rd)) (< NoPerm rd)) (not (= x_13@@0 x_13_1@@0))))
 :qid |stdinbpl.1286:15|
 :skolemid |158|
 :no-pattern (type x_13@@0)
 :no-pattern (type x_13_1@@0)
 :no-pattern (U_2_int x_13@@0)
 :no-pattern (U_2_bool x_13@@0)
 :no-pattern (U_2_int x_13_1@@0)
 :no-pattern (U_2_bool x_13_1@@0)
)) (=> (and (forall ((x_13@@1 T@U) ) (!  (=> (= (type x_13@@1) RefType) (=> (and (U_2_bool (MapType2Select setOfRef x_13@@1)) (< NoPerm rd)) (and (qpRange5 x_13@@1) (= (invRecv5 x_13@@1) x_13@@1))))
 :qid |stdinbpl.1292:22|
 :skolemid |159|
 :pattern ( (MapType0Select PostHeap@0 x_13@@1 val))
 :pattern ( (MapType1Select QPMask@36 x_13@@1 val))
 :pattern ( (MapType2Select setOfRef x_13@@1))
)) (forall ((o_3@@5 T@U) ) (!  (=> (= (type o_3@@5) RefType) (=> (and (and (U_2_bool (MapType2Select setOfRef (invRecv5 o_3@@5))) (< NoPerm rd)) (qpRange5 o_3@@5)) (= (invRecv5 o_3@@5) o_3@@5)))
 :qid |stdinbpl.1296:22|
 :skolemid |160|
 :pattern ( (invRecv5 o_3@@5))
))) (and (=> (= (ControlFlow 0 255) (- 0 256)) (forall ((x_13@@2 T@U) ) (!  (=> (and (= (type x_13@@2) RefType) (U_2_bool (MapType2Select setOfRef x_13@@2))) (>= rd NoPerm))
 :qid |stdinbpl.1302:15|
 :skolemid |161|
 :pattern ( (MapType0Select PostHeap@0 x_13@@2 val))
 :pattern ( (MapType1Select QPMask@36 x_13@@2 val))
 :pattern ( (MapType2Select setOfRef x_13@@2))
))) (=> (forall ((x_13@@3 T@U) ) (!  (=> (and (= (type x_13@@3) RefType) (U_2_bool (MapType2Select setOfRef x_13@@3))) (>= rd NoPerm))
 :qid |stdinbpl.1302:15|
 :skolemid |161|
 :pattern ( (MapType0Select PostHeap@0 x_13@@3 val))
 :pattern ( (MapType1Select QPMask@36 x_13@@3 val))
 :pattern ( (MapType2Select setOfRef x_13@@3))
)) (=> (forall ((x_13@@4 T@U) ) (!  (=> (= (type x_13@@4) RefType) (=> (and (U_2_bool (MapType2Select setOfRef x_13@@4)) (> rd NoPerm)) (not (= x_13@@4 null))))
 :qid |stdinbpl.1308:22|
 :skolemid |162|
 :pattern ( (MapType0Select PostHeap@0 x_13@@4 val))
 :pattern ( (MapType1Select QPMask@36 x_13@@4 val))
 :pattern ( (MapType2Select setOfRef x_13@@4))
)) (=> (and (and (forall ((o_3@@6 T@U) ) (!  (=> (= (type o_3@@6) RefType) (and (=> (and (and (U_2_bool (MapType2Select setOfRef (invRecv5 o_3@@6))) (< NoPerm rd)) (qpRange5 o_3@@6)) (and (=> (< NoPerm rd) (= (invRecv5 o_3@@6) o_3@@6)) (= (U_2_real (MapType1Select QPMask@36 o_3@@6 val)) (+ (U_2_real (MapType1Select ZeroMask o_3@@6 val)) rd)))) (=> (not (and (and (U_2_bool (MapType2Select setOfRef (invRecv5 o_3@@6))) (< NoPerm rd)) (qpRange5 o_3@@6))) (= (U_2_real (MapType1Select QPMask@36 o_3@@6 val)) (U_2_real (MapType1Select ZeroMask o_3@@6 val))))))
 :qid |stdinbpl.1314:22|
 :skolemid |163|
 :pattern ( (MapType1Select QPMask@36 o_3@@6 val))
)) (forall ((o_3@@7 T@U) (f_5@@1 T@U) ) (! (let ((B@@13 (FieldTypeInv1 (type f_5@@1))))
(let ((A@@14 (FieldTypeInv0 (type f_5@@1))))
 (=> (and (and (= (type o_3@@7) RefType) (= (type f_5@@1) (FieldType A@@14 B@@13))) (not (= f_5@@1 val))) (= (U_2_real (MapType1Select ZeroMask o_3@@7 f_5@@1)) (U_2_real (MapType1Select QPMask@36 o_3@@7 f_5@@1))))))
 :qid |stdinbpl.1318:29|
 :skolemid |164|
 :pattern ( (MapType1Select ZeroMask o_3@@7 f_5@@1))
 :pattern ( (MapType1Select QPMask@36 o_3@@7 f_5@@1))
))) (and (state PostHeap@0 QPMask@36) (state PostHeap@0 QPMask@36))) (and (and (=> (= (ControlFlow 0 255) 254) anon152_Else_correct) (=> (= (ControlFlow 0 255) 224) anon153_Then_correct)) (=> (= (ControlFlow 0 255) 227) anon153_Else_correct)))))))))))
(let ((anon151_Then_correct true))
(let ((anon150_Then_correct  (=> (and (state PostHeap@0 ZeroMask) (not (= nodeCopy null))) (=> (and (and (U_2_bool (MapType2Select res_copy_nodes nodeCopy)) (state PostHeap@0 ZeroMask)) (and (= (|Set#Card| (|Set#Intersection| setOfRef res_copy_nodes)) 0) (state PostHeap@0 ZeroMask))) (and (=> (= (ControlFlow 0 258) 222) anon151_Then_correct) (=> (= (ControlFlow 0 258) 255) anon151_Else_correct))))))
(let ((anon188_Else_correct  (=> (= (ControlFlow 0 183) (- 0 182)) (forall ((r_13 T@U) (r_13_1 T@U) ) (!  (=> (and (= (type r_13) RefType) (= (type r_13_1) RefType)) (=> (and (and (and (and (not (= r_13 r_13_1)) (U_2_bool (MapType2Select res_copy_nodes@1 r_13))) (U_2_bool (MapType2Select res_copy_nodes@1 r_13_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= r_13 r_13_1))))
 :qid |stdinbpl.2050:23|
 :skolemid |244|
 :no-pattern (type r_13)
 :no-pattern (type r_13_1)
 :no-pattern (U_2_int r_13)
 :no-pattern (U_2_bool r_13)
 :no-pattern (U_2_int r_13_1)
 :no-pattern (U_2_bool r_13_1)
)))))
(let ((anon188_Then_correct true))
(let ((anon187_Else_correct  (and (=> (= (ControlFlow 0 184) (- 0 185)) (forall ((r_11 T@U) (r_11_1 T@U) ) (!  (=> (and (= (type r_11) RefType) (= (type r_11_1) RefType)) (=> (and (and (and (and (not (= r_11 r_11_1)) (U_2_bool (MapType2Select res_copy_nodes@1 r_11))) (U_2_bool (MapType2Select res_copy_nodes@1 r_11_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= r_11 r_11_1))))
 :qid |stdinbpl.2010:23|
 :skolemid |238|
 :no-pattern (type r_11)
 :no-pattern (type r_11_1)
 :no-pattern (U_2_int r_11)
 :no-pattern (U_2_bool r_11)
 :no-pattern (U_2_int r_11_1)
 :no-pattern (U_2_bool r_11_1)
))) (=> (forall ((r_11@@0 T@U) (r_11_1@@0 T@U) ) (!  (=> (and (= (type r_11@@0) RefType) (= (type r_11_1@@0) RefType)) (=> (and (and (and (and (not (= r_11@@0 r_11_1@@0)) (U_2_bool (MapType2Select res_copy_nodes@1 r_11@@0))) (U_2_bool (MapType2Select res_copy_nodes@1 r_11_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= r_11@@0 r_11_1@@0))))
 :qid |stdinbpl.2010:23|
 :skolemid |238|
 :no-pattern (type r_11@@0)
 :no-pattern (type r_11_1@@0)
 :no-pattern (U_2_int r_11@@0)
 :no-pattern (U_2_bool r_11@@0)
 :no-pattern (U_2_int r_11_1@@0)
 :no-pattern (U_2_bool r_11_1@@0)
)) (=> (forall ((r_11@@1 T@U) ) (!  (=> (= (type r_11@@1) RefType) (=> (and (U_2_bool (MapType2Select res_copy_nodes@1 r_11@@1)) (< NoPerm FullPerm)) (and (qpRange19 r_11@@1) (= (invRecv19 r_11@@1) r_11@@1))))
 :qid |stdinbpl.2016:30|
 :skolemid |239|
 :pattern ( (MapType0Select ExhaleHeap@0 r_11@@1 val))
 :pattern ( (MapType1Select QPMask@34 r_11@@1 val))
 :pattern ( (MapType2Select res_copy_nodes@1 r_11@@1))
)) (=> (and (forall ((o_3@@8 T@U) ) (!  (=> (= (type o_3@@8) RefType) (=> (and (and (U_2_bool (MapType2Select res_copy_nodes@1 (invRecv19 o_3@@8))) (< NoPerm FullPerm)) (qpRange19 o_3@@8)) (= (invRecv19 o_3@@8) o_3@@8)))
 :qid |stdinbpl.2020:30|
 :skolemid |240|
 :pattern ( (invRecv19 o_3@@8))
)) (forall ((r_11@@2 T@U) ) (!  (=> (and (= (type r_11@@2) RefType) (U_2_bool (MapType2Select res_copy_nodes@1 r_11@@2))) (not (= r_11@@2 null)))
 :qid |stdinbpl.2026:30|
 :skolemid |241|
 :pattern ( (MapType0Select ExhaleHeap@0 r_11@@2 val))
 :pattern ( (MapType1Select QPMask@34 r_11@@2 val))
 :pattern ( (MapType2Select res_copy_nodes@1 r_11@@2))
))) (=> (and (and (forall ((o_3@@9 T@U) ) (!  (=> (= (type o_3@@9) RefType) (and (=> (and (and (U_2_bool (MapType2Select res_copy_nodes@1 (invRecv19 o_3@@9))) (< NoPerm FullPerm)) (qpRange19 o_3@@9)) (and (=> (< NoPerm FullPerm) (= (invRecv19 o_3@@9) o_3@@9)) (= (U_2_real (MapType1Select QPMask@34 o_3@@9 val)) (+ (U_2_real (MapType1Select QPMask@33 o_3@@9 val)) FullPerm)))) (=> (not (and (and (U_2_bool (MapType2Select res_copy_nodes@1 (invRecv19 o_3@@9))) (< NoPerm FullPerm)) (qpRange19 o_3@@9))) (= (U_2_real (MapType1Select QPMask@34 o_3@@9 val)) (U_2_real (MapType1Select QPMask@33 o_3@@9 val))))))
 :qid |stdinbpl.2032:30|
 :skolemid |242|
 :pattern ( (MapType1Select QPMask@34 o_3@@9 val))
)) (forall ((o_3@@10 T@U) (f_5@@2 T@U) ) (! (let ((B@@14 (FieldTypeInv1 (type f_5@@2))))
(let ((A@@15 (FieldTypeInv0 (type f_5@@2))))
 (=> (and (and (= (type o_3@@10) RefType) (= (type f_5@@2) (FieldType A@@15 B@@14))) (not (= f_5@@2 val))) (= (U_2_real (MapType1Select QPMask@33 o_3@@10 f_5@@2)) (U_2_real (MapType1Select QPMask@34 o_3@@10 f_5@@2))))))
 :qid |stdinbpl.2036:37|
 :skolemid |243|
 :pattern ( (MapType1Select QPMask@33 o_3@@10 f_5@@2))
 :pattern ( (MapType1Select QPMask@34 o_3@@10 f_5@@2))
))) (and (state ExhaleHeap@0 QPMask@34) (state ExhaleHeap@0 QPMask@34))) (and (=> (= (ControlFlow 0 184) 181) anon188_Then_correct) (=> (= (ControlFlow 0 184) 183) anon188_Else_correct)))))))))
(let ((anon187_Then_correct true))
(let ((anon186_Else_correct  (=> (and (forall ((r_9 T@U) ) (!  (=> (and (= (type r_9) RefType) (|Seq#Contains| (map_domain res_node_map@1) r_9)) (U_2_bool (MapType2Select res_copy_nodes@1 (lookup res_node_map@1 r_9))))
 :qid |stdinbpl.1998:28|
 :skolemid |237|
 :pattern ( (|Seq#ContainsTrigger| (map_domain res_node_map@1) r_9))
 :pattern ( (|Seq#Contains| (map_domain res_node_map@1) r_9))
 :pattern ( (MapType2Select res_copy_nodes@1 (lookup res_node_map@1 r_9)))
)) (state ExhaleHeap@0 QPMask@33)) (and (=> (= (ControlFlow 0 186) 180) anon187_Then_correct) (=> (= (ControlFlow 0 186) 184) anon187_Else_correct)))))
(let ((anon186_Then_correct true))
(let ((anon183_Else_correct  (=> (and (forall ((r_7 T@U) (j_7 Int) ) (!  (=> (= (type r_7) RefType) (=> (and (U_2_bool (MapType2Select setOfRef r_7)) (U_2_bool (MapType2Select (edges_domain (MapType0Select ExhaleHeap@0 r_7 edges)) (int_2_U j_7)))) (U_2_bool (MapType2Select setOfRef (edge_lookup (MapType0Select ExhaleHeap@0 r_7 edges) j_7)))))
 :qid |stdinbpl.1984:28|
 :skolemid |236|
 :pattern ( (MapType2Select setOfRef r_7) (MapType2Select (edges_domain (MapType0Select ExhaleHeap@0 r_7 edges)) (int_2_U j_7)))
 :pattern ( (MapType2Select setOfRef r_7) (edge_lookup (MapType0Select ExhaleHeap@0 r_7 edges) j_7))
 :pattern ( (MapType2Select setOfRef r_7) (MapType2Select setOfRef (edge_lookup (MapType0Select ExhaleHeap@0 r_7 edges) j_7)))
 :pattern ( (edges_domain (MapType0Select ExhaleHeap@0 r_7 edges)) (edge_lookup (MapType0Select ExhaleHeap@0 r_7 edges) j_7))
 :pattern ( (edges_domain (MapType0Select ExhaleHeap@0 r_7 edges)) (MapType2Select setOfRef (edge_lookup (MapType0Select ExhaleHeap@0 r_7 edges) j_7)))
 :pattern ( (MapType2Select (edges_domain (MapType0Select ExhaleHeap@0 r_7 edges)) (int_2_U j_7)))
 :pattern ( (MapType2Select setOfRef (edge_lookup (MapType0Select ExhaleHeap@0 r_7 edges) j_7)))
)) (state ExhaleHeap@0 QPMask@33)) (=> (and (and (|Set#Subset| node_map_image res_copy_nodes@1) (state ExhaleHeap@0 QPMask@33)) (and (= (|Set#Card| (|Set#Intersection| setOfRef res_copy_nodes@1)) 0) (state ExhaleHeap@0 QPMask@33))) (and (=> (= (ControlFlow 0 187) 179) anon186_Then_correct) (=> (= (ControlFlow 0 187) 186) anon186_Else_correct))))))
(let ((anon86_correct true))
(let ((anon185_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select setOfRef r_3)) (U_2_bool (MapType2Select (edges_domain (MapType0Select ExhaleHeap@0 r_3 edges)) (int_2_U j_3))))) (= (ControlFlow 0 175) 172)) anon86_correct)))
(let ((anon185_Then_correct  (=> (and (U_2_bool (MapType2Select setOfRef r_3)) (U_2_bool (MapType2Select (edges_domain (MapType0Select ExhaleHeap@0 r_3 edges)) (int_2_U j_3)))) (and (=> (= (ControlFlow 0 173) (- 0 174)) (HasDirectPerm QPMask@33 r_3 edges)) (=> (HasDirectPerm QPMask@33 r_3 edges) (=> (= (ControlFlow 0 173) 172) anon86_correct))))))
(let ((anon184_Else_correct  (=> (not (U_2_bool (MapType2Select setOfRef r_3))) (and (=> (= (ControlFlow 0 178) 173) anon185_Then_correct) (=> (= (ControlFlow 0 178) 175) anon185_Else_correct)))))
(let ((anon184_Then_correct  (=> (U_2_bool (MapType2Select setOfRef r_3)) (and (=> (= (ControlFlow 0 176) (- 0 177)) (HasDirectPerm QPMask@33 r_3 edges)) (=> (HasDirectPerm QPMask@33 r_3 edges) (and (=> (= (ControlFlow 0 176) 173) anon185_Then_correct) (=> (= (ControlFlow 0 176) 175) anon185_Else_correct)))))))
(let ((anon181_Else_correct  (=> (and (forall ((j_5 Int) ) (!  (=> (U_2_bool (MapType2Select S@1 (int_2_U j_5))) (U_2_bool (MapType2Select setOfRef (edge_lookup (MapType0Select ExhaleHeap@0 this edges) j_5))))
 :qid |stdinbpl.1966:28|
 :skolemid |235|
 :pattern ( (MapType2Select S@1 (int_2_U j_5)))
 :pattern ( (MapType2Select setOfRef (edge_lookup (MapType0Select ExhaleHeap@0 this edges) j_5)))
)) (state ExhaleHeap@0 QPMask@33)) (and (and (=> (= (ControlFlow 0 188) 187) anon183_Else_correct) (=> (= (ControlFlow 0 188) 176) anon184_Then_correct)) (=> (= (ControlFlow 0 188) 178) anon184_Else_correct)))))
(let ((anon80_correct true))
(let ((anon182_Else_correct  (=> (and (not (U_2_bool (MapType2Select S@1 (int_2_U j_1)))) (= (ControlFlow 0 171) 168)) anon80_correct)))
(let ((anon182_Then_correct  (=> (U_2_bool (MapType2Select S@1 (int_2_U j_1))) (and (=> (= (ControlFlow 0 169) (- 0 170)) (HasDirectPerm QPMask@33 this edges)) (=> (HasDirectPerm QPMask@33 this edges) (=> (= (ControlFlow 0 169) 168) anon80_correct))))))
(let ((anon179_Else_correct  (=> (and (forall ((x_53 T@U) ) (!  (=> (and (= (type x_53) RefType) (U_2_bool (MapType2Select setOfRef x_53))) (= (MapType0Select ExhaleHeap@0 x_53 edges) (MapType0Select Heap@@9 x_53 edges)))
 :qid |stdinbpl.1952:28|
 :skolemid |234|
 :pattern ( (MapType2Select setOfRef x_53))
)) (state ExhaleHeap@0 QPMask@33)) (and (and (=> (= (ControlFlow 0 189) 188) anon181_Else_correct) (=> (= (ControlFlow 0 189) 169) anon182_Then_correct)) (=> (= (ControlFlow 0 189) 171) anon182_Else_correct)))))
(let ((anon76_correct true))
(let ((anon180_Else_correct  (=> (and (not (U_2_bool (MapType2Select setOfRef x_10))) (= (ControlFlow 0 167) 163)) anon76_correct)))
(let ((anon180_Then_correct  (=> (U_2_bool (MapType2Select setOfRef x_10)) (and (=> (= (ControlFlow 0 164) (- 0 166)) (HasDirectPerm QPMask@33 x_10 edges)) (=> (HasDirectPerm QPMask@33 x_10 edges) (and (=> (= (ControlFlow 0 164) (- 0 165)) (HasDirectPerm QPMask@3 x_10 edges)) (=> (HasDirectPerm QPMask@3 x_10 edges) (=> (= (ControlFlow 0 164) 163) anon76_correct))))))))
(let ((anon178_Else_correct  (and (=> (= (ControlFlow 0 190) (- 0 192)) (forall ((x_51 T@U) (x_51_1 T@U) ) (!  (=> (and (= (type x_51) RefType) (= (type x_51_1) RefType)) (=> (and (and (and (and (not (= x_51 x_51_1)) (U_2_bool (MapType2Select setOfRef x_51))) (U_2_bool (MapType2Select setOfRef x_51_1))) (< NoPerm rd)) (< NoPerm rd)) (not (= x_51 x_51_1))))
 :qid |stdinbpl.1902:23|
 :skolemid |227|
 :no-pattern (type x_51)
 :no-pattern (type x_51_1)
 :no-pattern (U_2_int x_51)
 :no-pattern (U_2_bool x_51)
 :no-pattern (U_2_int x_51_1)
 :no-pattern (U_2_bool x_51_1)
))) (=> (forall ((x_51@@0 T@U) (x_51_1@@0 T@U) ) (!  (=> (and (= (type x_51@@0) RefType) (= (type x_51_1@@0) RefType)) (=> (and (and (and (and (not (= x_51@@0 x_51_1@@0)) (U_2_bool (MapType2Select setOfRef x_51@@0))) (U_2_bool (MapType2Select setOfRef x_51_1@@0))) (< NoPerm rd)) (< NoPerm rd)) (not (= x_51@@0 x_51_1@@0))))
 :qid |stdinbpl.1902:23|
 :skolemid |227|
 :no-pattern (type x_51@@0)
 :no-pattern (type x_51_1@@0)
 :no-pattern (U_2_int x_51@@0)
 :no-pattern (U_2_bool x_51@@0)
 :no-pattern (U_2_int x_51_1@@0)
 :no-pattern (U_2_bool x_51_1@@0)
)) (=> (and (forall ((x_51@@1 T@U) ) (!  (=> (= (type x_51@@1) RefType) (=> (and (U_2_bool (MapType2Select setOfRef x_51@@1)) (< NoPerm rd)) (and (qpRange18 x_51@@1) (= (invRecv18 x_51@@1) x_51@@1))))
 :qid |stdinbpl.1908:30|
 :skolemid |228|
 :pattern ( (MapType0Select ExhaleHeap@0 x_51@@1 edges))
 :pattern ( (MapType1Select QPMask@33 x_51@@1 edges))
 :pattern ( (MapType2Select setOfRef x_51@@1))
)) (forall ((o_3@@11 T@U) ) (!  (=> (= (type o_3@@11) RefType) (=> (and (and (U_2_bool (MapType2Select setOfRef (invRecv18 o_3@@11))) (< NoPerm rd)) (qpRange18 o_3@@11)) (= (invRecv18 o_3@@11) o_3@@11)))
 :qid |stdinbpl.1912:30|
 :skolemid |229|
 :pattern ( (invRecv18 o_3@@11))
))) (and (=> (= (ControlFlow 0 190) (- 0 191)) (forall ((x_51@@2 T@U) ) (!  (=> (and (= (type x_51@@2) RefType) (U_2_bool (MapType2Select setOfRef x_51@@2))) (>= rd NoPerm))
 :qid |stdinbpl.1918:23|
 :skolemid |230|
 :pattern ( (MapType0Select ExhaleHeap@0 x_51@@2 edges))
 :pattern ( (MapType1Select QPMask@33 x_51@@2 edges))
 :pattern ( (MapType2Select setOfRef x_51@@2))
))) (=> (forall ((x_51@@3 T@U) ) (!  (=> (and (= (type x_51@@3) RefType) (U_2_bool (MapType2Select setOfRef x_51@@3))) (>= rd NoPerm))
 :qid |stdinbpl.1918:23|
 :skolemid |230|
 :pattern ( (MapType0Select ExhaleHeap@0 x_51@@3 edges))
 :pattern ( (MapType1Select QPMask@33 x_51@@3 edges))
 :pattern ( (MapType2Select setOfRef x_51@@3))
)) (=> (forall ((x_51@@4 T@U) ) (!  (=> (= (type x_51@@4) RefType) (=> (and (U_2_bool (MapType2Select setOfRef x_51@@4)) (> rd NoPerm)) (not (= x_51@@4 null))))
 :qid |stdinbpl.1924:30|
 :skolemid |231|
 :pattern ( (MapType0Select ExhaleHeap@0 x_51@@4 edges))
 :pattern ( (MapType1Select QPMask@33 x_51@@4 edges))
 :pattern ( (MapType2Select setOfRef x_51@@4))
)) (=> (and (and (forall ((o_3@@12 T@U) ) (!  (=> (= (type o_3@@12) RefType) (and (=> (and (and (U_2_bool (MapType2Select setOfRef (invRecv18 o_3@@12))) (< NoPerm rd)) (qpRange18 o_3@@12)) (and (=> (< NoPerm rd) (= (invRecv18 o_3@@12) o_3@@12)) (= (U_2_real (MapType1Select QPMask@33 o_3@@12 edges)) (+ (U_2_real (MapType1Select QPMask@32 o_3@@12 edges)) rd)))) (=> (not (and (and (U_2_bool (MapType2Select setOfRef (invRecv18 o_3@@12))) (< NoPerm rd)) (qpRange18 o_3@@12))) (= (U_2_real (MapType1Select QPMask@33 o_3@@12 edges)) (U_2_real (MapType1Select QPMask@32 o_3@@12 edges))))))
 :qid |stdinbpl.1930:30|
 :skolemid |232|
 :pattern ( (MapType1Select QPMask@33 o_3@@12 edges))
)) (forall ((o_3@@13 T@U) (f_5@@3 T@U) ) (! (let ((B@@15 (FieldTypeInv1 (type f_5@@3))))
(let ((A@@16 (FieldTypeInv0 (type f_5@@3))))
 (=> (and (and (= (type o_3@@13) RefType) (= (type f_5@@3) (FieldType A@@16 B@@15))) (not (= f_5@@3 edges))) (= (U_2_real (MapType1Select QPMask@32 o_3@@13 f_5@@3)) (U_2_real (MapType1Select QPMask@33 o_3@@13 f_5@@3))))))
 :qid |stdinbpl.1934:37|
 :skolemid |233|
 :pattern ( (MapType1Select QPMask@32 o_3@@13 f_5@@3))
 :pattern ( (MapType1Select QPMask@33 o_3@@13 f_5@@3))
))) (and (state ExhaleHeap@0 QPMask@33) (state ExhaleHeap@0 QPMask@33))) (and (and (=> (= (ControlFlow 0 190) 189) anon179_Else_correct) (=> (= (ControlFlow 0 190) 164) anon180_Then_correct)) (=> (= (ControlFlow 0 190) 167) anon180_Else_correct)))))))))))
(let ((anon178_Then_correct true))
(let ((anon176_Else_correct  (=> (and (forall ((x_49 T@U) ) (!  (=> (and (= (type x_49) RefType) (U_2_bool (MapType2Select setOfRef x_49))) (= (U_2_int (MapType0Select ExhaleHeap@0 x_49 val)) (U_2_int (MapType0Select Heap@@9 x_49 val))))
 :qid |stdinbpl.1890:28|
 :skolemid |226|
 :pattern ( (MapType2Select setOfRef x_49))
)) (state ExhaleHeap@0 QPMask@32)) (and (=> (= (ControlFlow 0 193) 162) anon178_Then_correct) (=> (= (ControlFlow 0 193) 190) anon178_Else_correct)))))
(let ((anon70_correct true))
(let ((anon177_Else_correct  (=> (and (not (U_2_bool (MapType2Select setOfRef x_8))) (= (ControlFlow 0 161) 157)) anon70_correct)))
(let ((anon177_Then_correct  (=> (U_2_bool (MapType2Select setOfRef x_8)) (and (=> (= (ControlFlow 0 158) (- 0 160)) (HasDirectPerm QPMask@32 x_8 val)) (=> (HasDirectPerm QPMask@32 x_8 val) (and (=> (= (ControlFlow 0 158) (- 0 159)) (HasDirectPerm QPMask@3 x_8 val)) (=> (HasDirectPerm QPMask@3 x_8 val) (=> (= (ControlFlow 0 158) 157) anon70_correct))))))))
(let ((anon175_Else_correct  (and (=> (= (ControlFlow 0 194) (- 0 196)) (forall ((x_47 T@U) (x_47_1 T@U) ) (!  (=> (and (= (type x_47) RefType) (= (type x_47_1) RefType)) (=> (and (and (and (and (not (= x_47 x_47_1)) (U_2_bool (MapType2Select setOfRef x_47))) (U_2_bool (MapType2Select setOfRef x_47_1))) (< NoPerm rd)) (< NoPerm rd)) (not (= x_47 x_47_1))))
 :qid |stdinbpl.1840:23|
 :skolemid |219|
 :no-pattern (type x_47)
 :no-pattern (type x_47_1)
 :no-pattern (U_2_int x_47)
 :no-pattern (U_2_bool x_47)
 :no-pattern (U_2_int x_47_1)
 :no-pattern (U_2_bool x_47_1)
))) (=> (forall ((x_47@@0 T@U) (x_47_1@@0 T@U) ) (!  (=> (and (= (type x_47@@0) RefType) (= (type x_47_1@@0) RefType)) (=> (and (and (and (and (not (= x_47@@0 x_47_1@@0)) (U_2_bool (MapType2Select setOfRef x_47@@0))) (U_2_bool (MapType2Select setOfRef x_47_1@@0))) (< NoPerm rd)) (< NoPerm rd)) (not (= x_47@@0 x_47_1@@0))))
 :qid |stdinbpl.1840:23|
 :skolemid |219|
 :no-pattern (type x_47@@0)
 :no-pattern (type x_47_1@@0)
 :no-pattern (U_2_int x_47@@0)
 :no-pattern (U_2_bool x_47@@0)
 :no-pattern (U_2_int x_47_1@@0)
 :no-pattern (U_2_bool x_47_1@@0)
)) (=> (and (forall ((x_47@@1 T@U) ) (!  (=> (= (type x_47@@1) RefType) (=> (and (U_2_bool (MapType2Select setOfRef x_47@@1)) (< NoPerm rd)) (and (qpRange17 x_47@@1) (= (invRecv17 x_47@@1) x_47@@1))))
 :qid |stdinbpl.1846:30|
 :skolemid |220|
 :pattern ( (MapType0Select ExhaleHeap@0 x_47@@1 val))
 :pattern ( (MapType1Select QPMask@32 x_47@@1 val))
 :pattern ( (MapType2Select setOfRef x_47@@1))
)) (forall ((o_3@@14 T@U) ) (!  (=> (= (type o_3@@14) RefType) (=> (and (and (U_2_bool (MapType2Select setOfRef (invRecv17 o_3@@14))) (< NoPerm rd)) (qpRange17 o_3@@14)) (= (invRecv17 o_3@@14) o_3@@14)))
 :qid |stdinbpl.1850:30|
 :skolemid |221|
 :pattern ( (invRecv17 o_3@@14))
))) (and (=> (= (ControlFlow 0 194) (- 0 195)) (forall ((x_47@@2 T@U) ) (!  (=> (and (= (type x_47@@2) RefType) (U_2_bool (MapType2Select setOfRef x_47@@2))) (>= rd NoPerm))
 :qid |stdinbpl.1856:23|
 :skolemid |222|
 :pattern ( (MapType0Select ExhaleHeap@0 x_47@@2 val))
 :pattern ( (MapType1Select QPMask@32 x_47@@2 val))
 :pattern ( (MapType2Select setOfRef x_47@@2))
))) (=> (forall ((x_47@@3 T@U) ) (!  (=> (and (= (type x_47@@3) RefType) (U_2_bool (MapType2Select setOfRef x_47@@3))) (>= rd NoPerm))
 :qid |stdinbpl.1856:23|
 :skolemid |222|
 :pattern ( (MapType0Select ExhaleHeap@0 x_47@@3 val))
 :pattern ( (MapType1Select QPMask@32 x_47@@3 val))
 :pattern ( (MapType2Select setOfRef x_47@@3))
)) (=> (forall ((x_47@@4 T@U) ) (!  (=> (= (type x_47@@4) RefType) (=> (and (U_2_bool (MapType2Select setOfRef x_47@@4)) (> rd NoPerm)) (not (= x_47@@4 null))))
 :qid |stdinbpl.1862:30|
 :skolemid |223|
 :pattern ( (MapType0Select ExhaleHeap@0 x_47@@4 val))
 :pattern ( (MapType1Select QPMask@32 x_47@@4 val))
 :pattern ( (MapType2Select setOfRef x_47@@4))
)) (=> (and (and (forall ((o_3@@15 T@U) ) (!  (=> (= (type o_3@@15) RefType) (and (=> (and (and (U_2_bool (MapType2Select setOfRef (invRecv17 o_3@@15))) (< NoPerm rd)) (qpRange17 o_3@@15)) (and (=> (< NoPerm rd) (= (invRecv17 o_3@@15) o_3@@15)) (= (U_2_real (MapType1Select QPMask@32 o_3@@15 val)) (+ (U_2_real (MapType1Select QPMask@7 o_3@@15 val)) rd)))) (=> (not (and (and (U_2_bool (MapType2Select setOfRef (invRecv17 o_3@@15))) (< NoPerm rd)) (qpRange17 o_3@@15))) (= (U_2_real (MapType1Select QPMask@32 o_3@@15 val)) (U_2_real (MapType1Select QPMask@7 o_3@@15 val))))))
 :qid |stdinbpl.1868:30|
 :skolemid |224|
 :pattern ( (MapType1Select QPMask@32 o_3@@15 val))
)) (forall ((o_3@@16 T@U) (f_5@@4 T@U) ) (! (let ((B@@16 (FieldTypeInv1 (type f_5@@4))))
(let ((A@@17 (FieldTypeInv0 (type f_5@@4))))
 (=> (and (and (= (type o_3@@16) RefType) (= (type f_5@@4) (FieldType A@@17 B@@16))) (not (= f_5@@4 val))) (= (U_2_real (MapType1Select QPMask@7 o_3@@16 f_5@@4)) (U_2_real (MapType1Select QPMask@32 o_3@@16 f_5@@4))))))
 :qid |stdinbpl.1872:37|
 :skolemid |225|
 :pattern ( (MapType1Select QPMask@7 o_3@@16 f_5@@4))
 :pattern ( (MapType1Select QPMask@32 o_3@@16 f_5@@4))
))) (and (state ExhaleHeap@0 QPMask@32) (state ExhaleHeap@0 QPMask@32))) (and (and (=> (= (ControlFlow 0 194) 193) anon176_Else_correct) (=> (= (ControlFlow 0 194) 158) anon177_Then_correct)) (=> (= (ControlFlow 0 194) 161) anon177_Else_correct)))))))))))
(let ((anon175_Then_correct true))
(let ((anon174_Then_correct  (=> (and (and (U_2_bool (MapType2Select res_copy_nodes@1 freshObj@0)) (state ExhaleHeap@0 QPMask@7)) (and (U_2_bool (MapType2Select setOfRef this)) (state ExhaleHeap@0 QPMask@7))) (and (=> (= (ControlFlow 0 197) 156) anon175_Then_correct) (=> (= (ControlFlow 0 197) 194) anon175_Else_correct)))))
(let ((anon122_correct true))
(let ((anon203_Else_correct  (=> (and (not (|Seq#Contains| (map_domain res_node_map@3) r_20)) (= (ControlFlow 0 108) 105)) anon122_correct)))
(let ((anon203_Then_correct  (=> (|Seq#Contains| (map_domain res_node_map@3) r_20) (and (=> (= (ControlFlow 0 106) (- 0 107)) (U_2_bool (MapType2Select res_copy_nodes@3 (lookup res_node_map@3 r_20)))) (=> (U_2_bool (MapType2Select res_copy_nodes@3 (lookup res_node_map@3 r_20))) (=> (= (ControlFlow 0 106) 105) anon122_correct))))))
(let ((anon202_Else_correct  (=> (forall ((r_21_1 T@U) ) (!  (=> (and (= (type r_21_1) RefType) (|Seq#Contains| (map_domain res_node_map@3) r_21_1)) (U_2_bool (MapType2Select res_copy_nodes@3 (lookup res_node_map@3 r_21_1))))
 :qid |stdinbpl.2860:28|
 :skolemid |357|
 :pattern ( (|Seq#ContainsTrigger| (map_domain res_node_map@3) r_21_1))
 :pattern ( (|Seq#Contains| (map_domain res_node_map@3) r_21_1))
 :pattern ( (MapType2Select res_copy_nodes@3 (lookup res_node_map@3 r_21_1)))
)) (and (=> (= (ControlFlow 0 101) (- 0 104)) (forall ((r_22 T@U) (r_22_1 T@U) ) (!  (=> (and (= (type r_22) RefType) (= (type r_22_1) RefType)) (=> (and (and (and (and (not (= r_22 r_22_1)) (U_2_bool (MapType2Select res_copy_nodes@3 r_22))) (U_2_bool (MapType2Select res_copy_nodes@3 r_22_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= r_22 r_22_1))))
 :qid |stdinbpl.2871:25|
 :skolemid |358|
 :pattern ( (neverTriggered35 r_22) (neverTriggered35 r_22_1))
))) (=> (forall ((r_22@@0 T@U) (r_22_1@@0 T@U) ) (!  (=> (and (= (type r_22@@0) RefType) (= (type r_22_1@@0) RefType)) (=> (and (and (and (and (not (= r_22@@0 r_22_1@@0)) (U_2_bool (MapType2Select res_copy_nodes@3 r_22@@0))) (U_2_bool (MapType2Select res_copy_nodes@3 r_22_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= r_22@@0 r_22_1@@0))))
 :qid |stdinbpl.2871:25|
 :skolemid |358|
 :pattern ( (neverTriggered35 r_22@@0) (neverTriggered35 r_22_1@@0))
)) (and (=> (= (ControlFlow 0 101) (- 0 103)) (forall ((r_22@@1 T@U) ) (!  (=> (and (= (type r_22@@1) RefType) (U_2_bool (MapType2Select res_copy_nodes@3 r_22@@1))) (>= (U_2_real (MapType1Select QPMask@29 r_22@@1 val)) FullPerm))
 :qid |stdinbpl.2878:25|
 :skolemid |359|
 :pattern ( (MapType0Select Heap@3 r_22@@1 val))
 :pattern ( (MapType1Select QPMask@30 r_22@@1 val))
 :pattern ( (MapType2Select res_copy_nodes@3 r_22@@1))
))) (=> (forall ((r_22@@2 T@U) ) (!  (=> (and (= (type r_22@@2) RefType) (U_2_bool (MapType2Select res_copy_nodes@3 r_22@@2))) (>= (U_2_real (MapType1Select QPMask@29 r_22@@2 val)) FullPerm))
 :qid |stdinbpl.2878:25|
 :skolemid |359|
 :pattern ( (MapType0Select Heap@3 r_22@@2 val))
 :pattern ( (MapType1Select QPMask@30 r_22@@2 val))
 :pattern ( (MapType2Select res_copy_nodes@3 r_22@@2))
)) (=> (and (and (forall ((r_22@@3 T@U) ) (!  (=> (= (type r_22@@3) RefType) (=> (and (U_2_bool (MapType2Select res_copy_nodes@3 r_22@@3)) (< NoPerm FullPerm)) (and (qpRange35 r_22@@3) (= (invRecv35 r_22@@3) r_22@@3))))
 :qid |stdinbpl.2884:30|
 :skolemid |360|
 :pattern ( (MapType0Select Heap@3 r_22@@3 val))
 :pattern ( (MapType1Select QPMask@30 r_22@@3 val))
 :pattern ( (MapType2Select res_copy_nodes@3 r_22@@3))
)) (forall ((o_3@@17 T@U) ) (!  (=> (= (type o_3@@17) RefType) (=> (and (U_2_bool (MapType2Select res_copy_nodes@3 (invRecv35 o_3@@17))) (and (< NoPerm FullPerm) (qpRange35 o_3@@17))) (= (invRecv35 o_3@@17) o_3@@17)))
 :qid |stdinbpl.2888:30|
 :skolemid |361|
 :pattern ( (invRecv35 o_3@@17))
))) (and (forall ((o_3@@18 T@U) ) (!  (=> (= (type o_3@@18) RefType) (and (=> (and (U_2_bool (MapType2Select res_copy_nodes@3 (invRecv35 o_3@@18))) (and (< NoPerm FullPerm) (qpRange35 o_3@@18))) (and (= (invRecv35 o_3@@18) o_3@@18) (= (U_2_real (MapType1Select QPMask@30 o_3@@18 val)) (- (U_2_real (MapType1Select QPMask@29 o_3@@18 val)) FullPerm)))) (=> (not (and (U_2_bool (MapType2Select res_copy_nodes@3 (invRecv35 o_3@@18))) (and (< NoPerm FullPerm) (qpRange35 o_3@@18)))) (= (U_2_real (MapType1Select QPMask@30 o_3@@18 val)) (U_2_real (MapType1Select QPMask@29 o_3@@18 val))))))
 :qid |stdinbpl.2894:30|
 :skolemid |362|
 :pattern ( (MapType1Select QPMask@30 o_3@@18 val))
)) (forall ((o_3@@19 T@U) (f_5@@5 T@U) ) (! (let ((B@@17 (FieldTypeInv1 (type f_5@@5))))
(let ((A@@18 (FieldTypeInv0 (type f_5@@5))))
 (=> (and (and (= (type o_3@@19) RefType) (= (type f_5@@5) (FieldType A@@18 B@@17))) (not (= f_5@@5 val))) (= (U_2_real (MapType1Select QPMask@29 o_3@@19 f_5@@5)) (U_2_real (MapType1Select QPMask@30 o_3@@19 f_5@@5))))))
 :qid |stdinbpl.2900:37|
 :skolemid |363|
 :pattern ( (MapType1Select QPMask@30 o_3@@19 f_5@@5))
)))) (and (=> (= (ControlFlow 0 101) (- 0 102)) (forall ((r_23 T@U) (r_23_1 T@U) ) (!  (=> (and (= (type r_23) RefType) (= (type r_23_1) RefType)) (=> (and (and (and (and (not (= r_23 r_23_1)) (U_2_bool (MapType2Select res_copy_nodes@3 r_23))) (U_2_bool (MapType2Select res_copy_nodes@3 r_23_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= r_23 r_23_1))))
 :qid |stdinbpl.2912:25|
 :skolemid |364|
 :pattern ( (neverTriggered36 r_23) (neverTriggered36 r_23_1))
))) (=> (forall ((r_23@@0 T@U) (r_23_1@@0 T@U) ) (!  (=> (and (= (type r_23@@0) RefType) (= (type r_23_1@@0) RefType)) (=> (and (and (and (and (not (= r_23@@0 r_23_1@@0)) (U_2_bool (MapType2Select res_copy_nodes@3 r_23@@0))) (U_2_bool (MapType2Select res_copy_nodes@3 r_23_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= r_23@@0 r_23_1@@0))))
 :qid |stdinbpl.2912:25|
 :skolemid |364|
 :pattern ( (neverTriggered36 r_23@@0) (neverTriggered36 r_23_1@@0))
)) (=> (= (ControlFlow 0 101) (- 0 100)) (forall ((r_23@@1 T@U) ) (!  (=> (and (= (type r_23@@1) RefType) (U_2_bool (MapType2Select res_copy_nodes@3 r_23@@1))) (>= (U_2_real (MapType1Select QPMask@30 r_23@@1 edges)) FullPerm))
 :qid |stdinbpl.2919:25|
 :skolemid |365|
 :pattern ( (MapType0Select Heap@3 r_23@@1 edges))
 :pattern ( (MapType1Select QPMask@31 r_23@@1 edges))
 :pattern ( (MapType2Select res_copy_nodes@3 r_23@@1))
)))))))))))))
(let ((anon200_Else_correct  (=> (forall ((r_19_1 T@U) (j_13_1 Int) ) (!  (=> (= (type r_19_1) RefType) (=> (and (U_2_bool (MapType2Select setOfRef r_19_1)) (U_2_bool (MapType2Select (edges_domain (MapType0Select Heap@3 r_19_1 edges)) (int_2_U j_13_1)))) (U_2_bool (MapType2Select setOfRef (edge_lookup (MapType0Select Heap@3 r_19_1 edges) j_13_1)))))
 :qid |stdinbpl.2845:28|
 :skolemid |356|
 :pattern ( (MapType2Select setOfRef r_19_1) (MapType2Select (edges_domain (MapType0Select Heap@3 r_19_1 edges)) (int_2_U j_13_1)))
 :pattern ( (MapType2Select setOfRef r_19_1) (edge_lookup (MapType0Select Heap@3 r_19_1 edges) j_13_1))
 :pattern ( (MapType2Select setOfRef r_19_1) (MapType2Select setOfRef (edge_lookup (MapType0Select Heap@3 r_19_1 edges) j_13_1)))
 :pattern ( (edges_domain (MapType0Select Heap@3 r_19_1 edges)) (edge_lookup (MapType0Select Heap@3 r_19_1 edges) j_13_1))
 :pattern ( (edges_domain (MapType0Select Heap@3 r_19_1 edges)) (MapType2Select setOfRef (edge_lookup (MapType0Select Heap@3 r_19_1 edges) j_13_1)))
 :pattern ( (MapType2Select (edges_domain (MapType0Select Heap@3 r_19_1 edges)) (int_2_U j_13_1)))
 :pattern ( (MapType2Select setOfRef (edge_lookup (MapType0Select Heap@3 r_19_1 edges) j_13_1)))
)) (and (=> (= (ControlFlow 0 109) (- 0 111)) (|Set#Subset| node_map_image res_copy_nodes@3)) (=> (|Set#Subset| node_map_image res_copy_nodes@3) (and (=> (= (ControlFlow 0 109) (- 0 110)) (= (|Set#Card| (|Set#Intersection| setOfRef res_copy_nodes@3)) 0)) (=> (= (|Set#Card| (|Set#Intersection| setOfRef res_copy_nodes@3)) 0) (and (and (=> (= (ControlFlow 0 109) 101) anon202_Else_correct) (=> (= (ControlFlow 0 109) 106) anon203_Then_correct)) (=> (= (ControlFlow 0 109) 108) anon203_Else_correct)))))))))
(let ((anon118_correct true))
(let ((anon201_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select setOfRef r_18)) (U_2_bool (MapType2Select (edges_domain (MapType0Select Heap@3 r_18 edges)) (int_2_U j_12))))) (= (ControlFlow 0 99) 96)) anon118_correct)))
(let ((anon201_Then_correct  (=> (and (U_2_bool (MapType2Select setOfRef r_18)) (U_2_bool (MapType2Select (edges_domain (MapType0Select Heap@3 r_18 edges)) (int_2_U j_12)))) (and (=> (= (ControlFlow 0 97) (- 0 98)) (U_2_bool (MapType2Select setOfRef (edge_lookup (MapType0Select Heap@3 r_18 edges) j_12)))) (=> (U_2_bool (MapType2Select setOfRef (edge_lookup (MapType0Select Heap@3 r_18 edges) j_12))) (=> (= (ControlFlow 0 97) 96) anon118_correct))))))
(let ((anon198_Else_correct  (=> (forall ((j_11_1 Int) ) (!  (=> (U_2_bool (MapType2Select S@2 (int_2_U j_11_1))) (U_2_bool (MapType2Select setOfRef (edge_lookup (MapType0Select Heap@3 this edges) j_11_1))))
 :qid |stdinbpl.2834:28|
 :skolemid |355|
 :pattern ( (MapType2Select S@2 (int_2_U j_11_1)))
 :pattern ( (MapType2Select setOfRef (edge_lookup (MapType0Select Heap@3 this edges) j_11_1)))
)) (and (and (=> (= (ControlFlow 0 112) 109) anon200_Else_correct) (=> (= (ControlFlow 0 112) 97) anon201_Then_correct)) (=> (= (ControlFlow 0 112) 99) anon201_Else_correct)))))
(let ((anon114_correct true))
(let ((anon199_Else_correct  (=> (and (not (U_2_bool (MapType2Select S@2 (int_2_U j_10)))) (= (ControlFlow 0 95) 92)) anon114_correct)))
(let ((anon199_Then_correct  (=> (U_2_bool (MapType2Select S@2 (int_2_U j_10))) (and (=> (= (ControlFlow 0 93) (- 0 94)) (U_2_bool (MapType2Select setOfRef (edge_lookup (MapType0Select Heap@3 this edges) j_10)))) (=> (U_2_bool (MapType2Select setOfRef (edge_lookup (MapType0Select Heap@3 this edges) j_10))) (=> (= (ControlFlow 0 93) 92) anon114_correct))))))
(let ((anon196_Else_correct  (=> (forall ((x_79_1 T@U) ) (!  (=> (and (= (type x_79_1) RefType) (U_2_bool (MapType2Select setOfRef x_79_1))) (= (MapType0Select Heap@3 x_79_1 edges) (MapType0Select Heap@@9 x_79_1 edges)))
 :qid |stdinbpl.2823:28|
 :skolemid |354|
 :pattern ( (MapType2Select setOfRef x_79_1))
)) (and (and (=> (= (ControlFlow 0 113) 112) anon198_Else_correct) (=> (= (ControlFlow 0 113) 93) anon199_Then_correct)) (=> (= (ControlFlow 0 113) 95) anon199_Else_correct)))))
(let ((anon110_correct true))
(let ((anon197_Else_correct  (=> (and (not (U_2_bool (MapType2Select setOfRef x_78))) (= (ControlFlow 0 91) 88)) anon110_correct)))
(let ((anon197_Then_correct  (=> (U_2_bool (MapType2Select setOfRef x_78)) (and (=> (= (ControlFlow 0 89) (- 0 90)) (= (MapType0Select Heap@3 x_78 edges) (MapType0Select Heap@@9 x_78 edges))) (=> (= (MapType0Select Heap@3 x_78 edges) (MapType0Select Heap@@9 x_78 edges)) (=> (= (ControlFlow 0 89) 88) anon110_correct))))))
(let ((anon194_Else_correct  (=> (forall ((x_76_1 T@U) ) (!  (=> (and (= (type x_76_1) RefType) (U_2_bool (MapType2Select setOfRef x_76_1))) (= (U_2_int (MapType0Select Heap@3 x_76_1 val)) (U_2_int (MapType0Select Heap@@9 x_76_1 val))))
 :qid |stdinbpl.2767:28|
 :skolemid |346|
 :pattern ( (MapType2Select setOfRef x_76_1))
)) (and (=> (= (ControlFlow 0 114) (- 0 117)) (forall ((x_77 T@U) ) (!  (=> (= (type x_77) RefType) (=> (and (U_2_bool (MapType2Select setOfRef x_77)) (dummyFunction (MapType0Select Heap@3 x_77 edges))) (>= rd NoPerm)))
 :qid |stdinbpl.2775:25|
 :skolemid |347|
 :pattern ( (MapType0Select Heap@3 x_77 edges))
 :pattern ( (MapType1Select QPMask@29 x_77 edges))
 :pattern ( (MapType2Select setOfRef x_77))
))) (=> (forall ((x_77@@0 T@U) ) (!  (=> (= (type x_77@@0) RefType) (=> (and (U_2_bool (MapType2Select setOfRef x_77@@0)) (dummyFunction (MapType0Select Heap@3 x_77@@0 edges))) (>= rd NoPerm)))
 :qid |stdinbpl.2775:25|
 :skolemid |347|
 :pattern ( (MapType0Select Heap@3 x_77@@0 edges))
 :pattern ( (MapType1Select QPMask@29 x_77@@0 edges))
 :pattern ( (MapType2Select setOfRef x_77@@0))
)) (and (=> (= (ControlFlow 0 114) (- 0 116)) (forall ((x_77@@1 T@U) (x_77_1 T@U) ) (!  (=> (and (= (type x_77@@1) RefType) (= (type x_77_1) RefType)) (=> (and (and (and (and (not (= x_77@@1 x_77_1)) (U_2_bool (MapType2Select setOfRef x_77@@1))) (U_2_bool (MapType2Select setOfRef x_77_1))) (< NoPerm rd)) (< NoPerm rd)) (not (= x_77@@1 x_77_1))))
 :qid |stdinbpl.2782:25|
 :skolemid |348|
 :pattern ( (neverTriggered34 x_77@@1) (neverTriggered34 x_77_1))
))) (=> (forall ((x_77@@2 T@U) (x_77_1@@0 T@U) ) (!  (=> (and (= (type x_77@@2) RefType) (= (type x_77_1@@0) RefType)) (=> (and (and (and (and (not (= x_77@@2 x_77_1@@0)) (U_2_bool (MapType2Select setOfRef x_77@@2))) (U_2_bool (MapType2Select setOfRef x_77_1@@0))) (< NoPerm rd)) (< NoPerm rd)) (not (= x_77@@2 x_77_1@@0))))
 :qid |stdinbpl.2782:25|
 :skolemid |348|
 :pattern ( (neverTriggered34 x_77@@2) (neverTriggered34 x_77_1@@0))
)) (and (=> (= (ControlFlow 0 114) (- 0 115)) (forall ((x_77@@3 T@U) ) (!  (=> (and (= (type x_77@@3) RefType) (U_2_bool (MapType2Select setOfRef x_77@@3))) (>= (U_2_real (MapType1Select QPMask@28 x_77@@3 edges)) rd))
 :qid |stdinbpl.2789:25|
 :skolemid |349|
 :pattern ( (MapType0Select Heap@3 x_77@@3 edges))
 :pattern ( (MapType1Select QPMask@29 x_77@@3 edges))
 :pattern ( (MapType2Select setOfRef x_77@@3))
))) (=> (forall ((x_77@@4 T@U) ) (!  (=> (and (= (type x_77@@4) RefType) (U_2_bool (MapType2Select setOfRef x_77@@4))) (>= (U_2_real (MapType1Select QPMask@28 x_77@@4 edges)) rd))
 :qid |stdinbpl.2789:25|
 :skolemid |349|
 :pattern ( (MapType0Select Heap@3 x_77@@4 edges))
 :pattern ( (MapType1Select QPMask@29 x_77@@4 edges))
 :pattern ( (MapType2Select setOfRef x_77@@4))
)) (=> (and (and (forall ((x_77@@5 T@U) ) (!  (=> (= (type x_77@@5) RefType) (=> (and (U_2_bool (MapType2Select setOfRef x_77@@5)) (< NoPerm rd)) (and (qpRange34 x_77@@5) (= (invRecv34 x_77@@5) x_77@@5))))
 :qid |stdinbpl.2795:30|
 :skolemid |350|
 :pattern ( (MapType0Select Heap@3 x_77@@5 edges))
 :pattern ( (MapType1Select QPMask@29 x_77@@5 edges))
 :pattern ( (MapType2Select setOfRef x_77@@5))
)) (forall ((o_3@@20 T@U) ) (!  (=> (= (type o_3@@20) RefType) (=> (and (U_2_bool (MapType2Select setOfRef (invRecv34 o_3@@20))) (and (< NoPerm rd) (qpRange34 o_3@@20))) (= (invRecv34 o_3@@20) o_3@@20)))
 :qid |stdinbpl.2799:30|
 :skolemid |351|
 :pattern ( (invRecv34 o_3@@20))
))) (and (forall ((o_3@@21 T@U) ) (!  (=> (= (type o_3@@21) RefType) (and (=> (and (U_2_bool (MapType2Select setOfRef (invRecv34 o_3@@21))) (and (< NoPerm rd) (qpRange34 o_3@@21))) (and (= (invRecv34 o_3@@21) o_3@@21) (= (U_2_real (MapType1Select QPMask@29 o_3@@21 edges)) (- (U_2_real (MapType1Select QPMask@28 o_3@@21 edges)) rd)))) (=> (not (and (U_2_bool (MapType2Select setOfRef (invRecv34 o_3@@21))) (and (< NoPerm rd) (qpRange34 o_3@@21)))) (= (U_2_real (MapType1Select QPMask@29 o_3@@21 edges)) (U_2_real (MapType1Select QPMask@28 o_3@@21 edges))))))
 :qid |stdinbpl.2805:30|
 :skolemid |352|
 :pattern ( (MapType1Select QPMask@29 o_3@@21 edges))
)) (forall ((o_3@@22 T@U) (f_5@@6 T@U) ) (! (let ((B@@18 (FieldTypeInv1 (type f_5@@6))))
(let ((A@@19 (FieldTypeInv0 (type f_5@@6))))
 (=> (and (and (= (type o_3@@22) RefType) (= (type f_5@@6) (FieldType A@@19 B@@18))) (not (= f_5@@6 edges))) (= (U_2_real (MapType1Select QPMask@28 o_3@@22 f_5@@6)) (U_2_real (MapType1Select QPMask@29 o_3@@22 f_5@@6))))))
 :qid |stdinbpl.2811:37|
 :skolemid |353|
 :pattern ( (MapType1Select QPMask@29 o_3@@22 f_5@@6))
)))) (and (and (=> (= (ControlFlow 0 114) 113) anon196_Else_correct) (=> (= (ControlFlow 0 114) 89) anon197_Then_correct)) (=> (= (ControlFlow 0 114) 91) anon197_Else_correct))))))))))))
(let ((anon106_correct true))
(let ((anon195_Else_correct  (=> (and (not (U_2_bool (MapType2Select setOfRef x_75))) (= (ControlFlow 0 87) 84)) anon106_correct)))
(let ((anon195_Then_correct  (=> (U_2_bool (MapType2Select setOfRef x_75)) (and (=> (= (ControlFlow 0 85) (- 0 86)) (= (U_2_int (MapType0Select Heap@3 x_75 val)) (U_2_int (MapType0Select Heap@@9 x_75 val)))) (=> (= (U_2_int (MapType0Select Heap@3 x_75 val)) (U_2_int (MapType0Select Heap@@9 x_75 val))) (=> (= (ControlFlow 0 85) 84) anon106_correct))))))
(let ((anon192_Else_correct  (=> (forall ((x_63_1 T@U) ) (!  (=> (and (= (type x_63_1) RefType) (|Seq#Contains| (map_domain res_node_map@1) x_63_1)) (U_2_bool (MapType2Select res_copy_nodes@1 (lookup res_node_map@1 x_63_1))))
 :qid |stdinbpl.2432:34|
 :skolemid |296|
 :pattern ( (|Seq#ContainsTrigger| (map_domain res_node_map@1) x_63_1))
 :pattern ( (|Seq#Contains| (map_domain res_node_map@1) x_63_1))
 :pattern ( (MapType2Select res_copy_nodes@1 (lookup res_node_map@1 x_63_1)))
)) (and (=> (= (ControlFlow 0 118) (- 0 135)) (forall ((x_64 T@U) (x_64_1 T@U) ) (!  (=> (and (= (type x_64) RefType) (= (type x_64_1) RefType)) (=> (and (and (and (and (not (= x_64 x_64_1)) (U_2_bool (MapType2Select res_copy_nodes@1 x_64))) (U_2_bool (MapType2Select res_copy_nodes@1 x_64_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= x_64 x_64_1))))
 :qid |stdinbpl.2443:31|
 :skolemid |297|
 :pattern ( (neverTriggered27 x_64) (neverTriggered27 x_64_1))
))) (=> (forall ((x_64@@0 T@U) (x_64_1@@0 T@U) ) (!  (=> (and (= (type x_64@@0) RefType) (= (type x_64_1@@0) RefType)) (=> (and (and (and (and (not (= x_64@@0 x_64_1@@0)) (U_2_bool (MapType2Select res_copy_nodes@1 x_64@@0))) (U_2_bool (MapType2Select res_copy_nodes@1 x_64_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= x_64@@0 x_64_1@@0))))
 :qid |stdinbpl.2443:31|
 :skolemid |297|
 :pattern ( (neverTriggered27 x_64@@0) (neverTriggered27 x_64_1@@0))
)) (and (=> (= (ControlFlow 0 118) (- 0 134)) (forall ((x_64@@1 T@U) ) (!  (=> (and (= (type x_64@@1) RefType) (U_2_bool (MapType2Select res_copy_nodes@1 x_64@@1))) (>= (U_2_real (MapType1Select QPMask@13 x_64@@1 val)) FullPerm))
 :qid |stdinbpl.2450:31|
 :skolemid |298|
 :pattern ( (MapType0Select ExhaleHeap@0 x_64@@1 val))
 :pattern ( (MapType1Select QPMask@22 x_64@@1 val))
 :pattern ( (MapType2Select res_copy_nodes@1 x_64@@1))
))) (=> (forall ((x_64@@2 T@U) ) (!  (=> (and (= (type x_64@@2) RefType) (U_2_bool (MapType2Select res_copy_nodes@1 x_64@@2))) (>= (U_2_real (MapType1Select QPMask@13 x_64@@2 val)) FullPerm))
 :qid |stdinbpl.2450:31|
 :skolemid |298|
 :pattern ( (MapType0Select ExhaleHeap@0 x_64@@2 val))
 :pattern ( (MapType1Select QPMask@22 x_64@@2 val))
 :pattern ( (MapType2Select res_copy_nodes@1 x_64@@2))
)) (=> (and (and (forall ((x_64@@3 T@U) ) (!  (=> (= (type x_64@@3) RefType) (=> (and (U_2_bool (MapType2Select res_copy_nodes@1 x_64@@3)) (< NoPerm FullPerm)) (and (qpRange27 x_64@@3) (= (invRecv27 x_64@@3) x_64@@3))))
 :qid |stdinbpl.2456:36|
 :skolemid |299|
 :pattern ( (MapType0Select ExhaleHeap@0 x_64@@3 val))
 :pattern ( (MapType1Select QPMask@22 x_64@@3 val))
 :pattern ( (MapType2Select res_copy_nodes@1 x_64@@3))
)) (forall ((o_3@@23 T@U) ) (!  (=> (= (type o_3@@23) RefType) (=> (and (U_2_bool (MapType2Select res_copy_nodes@1 (invRecv27 o_3@@23))) (and (< NoPerm FullPerm) (qpRange27 o_3@@23))) (= (invRecv27 o_3@@23) o_3@@23)))
 :qid |stdinbpl.2460:36|
 :skolemid |300|
 :pattern ( (invRecv27 o_3@@23))
))) (and (forall ((o_3@@24 T@U) ) (!  (=> (= (type o_3@@24) RefType) (and (=> (and (U_2_bool (MapType2Select res_copy_nodes@1 (invRecv27 o_3@@24))) (and (< NoPerm FullPerm) (qpRange27 o_3@@24))) (and (= (invRecv27 o_3@@24) o_3@@24) (= (U_2_real (MapType1Select QPMask@22 o_3@@24 val)) (- (U_2_real (MapType1Select QPMask@13 o_3@@24 val)) FullPerm)))) (=> (not (and (U_2_bool (MapType2Select res_copy_nodes@1 (invRecv27 o_3@@24))) (and (< NoPerm FullPerm) (qpRange27 o_3@@24)))) (= (U_2_real (MapType1Select QPMask@22 o_3@@24 val)) (U_2_real (MapType1Select QPMask@13 o_3@@24 val))))))
 :qid |stdinbpl.2466:36|
 :skolemid |301|
 :pattern ( (MapType1Select QPMask@22 o_3@@24 val))
)) (forall ((o_3@@25 T@U) (f_5@@7 T@U) ) (! (let ((B@@19 (FieldTypeInv1 (type f_5@@7))))
(let ((A@@20 (FieldTypeInv0 (type f_5@@7))))
 (=> (and (and (= (type o_3@@25) RefType) (= (type f_5@@7) (FieldType A@@20 B@@19))) (not (= f_5@@7 val))) (= (U_2_real (MapType1Select QPMask@13 o_3@@25 f_5@@7)) (U_2_real (MapType1Select QPMask@22 o_3@@25 f_5@@7))))))
 :qid |stdinbpl.2472:43|
 :skolemid |302|
 :pattern ( (MapType1Select QPMask@22 o_3@@25 f_5@@7))
)))) (and (=> (= (ControlFlow 0 118) (- 0 133)) (forall ((x_65 T@U) (x_65_1 T@U) ) (!  (=> (and (= (type x_65) RefType) (= (type x_65_1) RefType)) (=> (and (and (and (and (not (= x_65 x_65_1)) (U_2_bool (MapType2Select res_copy_nodes@1 x_65))) (U_2_bool (MapType2Select res_copy_nodes@1 x_65_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= x_65 x_65_1))))
 :qid |stdinbpl.2484:31|
 :skolemid |303|
 :pattern ( (neverTriggered28 x_65) (neverTriggered28 x_65_1))
))) (=> (forall ((x_65@@0 T@U) (x_65_1@@0 T@U) ) (!  (=> (and (= (type x_65@@0) RefType) (= (type x_65_1@@0) RefType)) (=> (and (and (and (and (not (= x_65@@0 x_65_1@@0)) (U_2_bool (MapType2Select res_copy_nodes@1 x_65@@0))) (U_2_bool (MapType2Select res_copy_nodes@1 x_65_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= x_65@@0 x_65_1@@0))))
 :qid |stdinbpl.2484:31|
 :skolemid |303|
 :pattern ( (neverTriggered28 x_65@@0) (neverTriggered28 x_65_1@@0))
)) (and (=> (= (ControlFlow 0 118) (- 0 132)) (forall ((x_65@@1 T@U) ) (!  (=> (and (= (type x_65@@1) RefType) (U_2_bool (MapType2Select res_copy_nodes@1 x_65@@1))) (>= (U_2_real (MapType1Select QPMask@22 x_65@@1 edges)) FullPerm))
 :qid |stdinbpl.2491:31|
 :skolemid |304|
 :pattern ( (MapType0Select ExhaleHeap@0 x_65@@1 edges))
 :pattern ( (MapType1Select QPMask@23 x_65@@1 edges))
 :pattern ( (MapType2Select res_copy_nodes@1 x_65@@1))
))) (=> (forall ((x_65@@2 T@U) ) (!  (=> (and (= (type x_65@@2) RefType) (U_2_bool (MapType2Select res_copy_nodes@1 x_65@@2))) (>= (U_2_real (MapType1Select QPMask@22 x_65@@2 edges)) FullPerm))
 :qid |stdinbpl.2491:31|
 :skolemid |304|
 :pattern ( (MapType0Select ExhaleHeap@0 x_65@@2 edges))
 :pattern ( (MapType1Select QPMask@23 x_65@@2 edges))
 :pattern ( (MapType2Select res_copy_nodes@1 x_65@@2))
)) (=> (and (and (and (forall ((x_65@@3 T@U) ) (!  (=> (= (type x_65@@3) RefType) (=> (and (U_2_bool (MapType2Select res_copy_nodes@1 x_65@@3)) (< NoPerm FullPerm)) (and (qpRange28 x_65@@3) (= (invRecv28 x_65@@3) x_65@@3))))
 :qid |stdinbpl.2497:36|
 :skolemid |305|
 :pattern ( (MapType0Select ExhaleHeap@0 x_65@@3 edges))
 :pattern ( (MapType1Select QPMask@23 x_65@@3 edges))
 :pattern ( (MapType2Select res_copy_nodes@1 x_65@@3))
)) (forall ((o_3@@26 T@U) ) (!  (=> (= (type o_3@@26) RefType) (=> (and (U_2_bool (MapType2Select res_copy_nodes@1 (invRecv28 o_3@@26))) (and (< NoPerm FullPerm) (qpRange28 o_3@@26))) (= (invRecv28 o_3@@26) o_3@@26)))
 :qid |stdinbpl.2501:36|
 :skolemid |306|
 :pattern ( (invRecv28 o_3@@26))
))) (and (forall ((o_3@@27 T@U) ) (!  (=> (= (type o_3@@27) RefType) (and (=> (and (U_2_bool (MapType2Select res_copy_nodes@1 (invRecv28 o_3@@27))) (and (< NoPerm FullPerm) (qpRange28 o_3@@27))) (and (= (invRecv28 o_3@@27) o_3@@27) (= (U_2_real (MapType1Select QPMask@23 o_3@@27 edges)) (- (U_2_real (MapType1Select QPMask@22 o_3@@27 edges)) FullPerm)))) (=> (not (and (U_2_bool (MapType2Select res_copy_nodes@1 (invRecv28 o_3@@27))) (and (< NoPerm FullPerm) (qpRange28 o_3@@27)))) (= (U_2_real (MapType1Select QPMask@23 o_3@@27 edges)) (U_2_real (MapType1Select QPMask@22 o_3@@27 edges))))))
 :qid |stdinbpl.2507:36|
 :skolemid |307|
 :pattern ( (MapType1Select QPMask@23 o_3@@27 edges))
)) (forall ((o_3@@28 T@U) (f_5@@8 T@U) ) (! (let ((B@@20 (FieldTypeInv1 (type f_5@@8))))
(let ((A@@21 (FieldTypeInv0 (type f_5@@8))))
 (=> (and (and (= (type o_3@@28) RefType) (= (type f_5@@8) (FieldType A@@21 B@@20))) (not (= f_5@@8 edges))) (= (U_2_real (MapType1Select QPMask@22 o_3@@28 f_5@@8)) (U_2_real (MapType1Select QPMask@23 o_3@@28 f_5@@8))))))
 :qid |stdinbpl.2513:43|
 :skolemid |308|
 :pattern ( (MapType1Select QPMask@23 o_3@@28 f_5@@8))
)))) (and (and (IdenticalOnKnownLocations ExhaleHeap@0 ExhaleHeap@2 QPMask@23) (not (= newNode@0 null))) (and (U_2_bool (MapType2Select res_copy_nodes@3 newNode@0)) (= (|Set#Card| (|Set#Intersection| setOfRef res_copy_nodes@3)) 0)))) (and (=> (= (ControlFlow 0 118) (- 0 131)) (forall ((x_66 T@U) (x_66_1 T@U) ) (!  (=> (and (= (type x_66) RefType) (= (type x_66_1) RefType)) (=> (and (and (and (and (not (= x_66 x_66_1)) (U_2_bool (MapType2Select setOfRef x_66))) (U_2_bool (MapType2Select setOfRef x_66_1))) (< NoPerm arg_rd@0)) (< NoPerm arg_rd@0)) (not (= x_66 x_66_1))))
 :qid |stdinbpl.2532:29|
 :skolemid |309|
 :no-pattern (type x_66)
 :no-pattern (type x_66_1)
 :no-pattern (U_2_int x_66)
 :no-pattern (U_2_bool x_66)
 :no-pattern (U_2_int x_66_1)
 :no-pattern (U_2_bool x_66_1)
))) (=> (forall ((x_66@@0 T@U) (x_66_1@@0 T@U) ) (!  (=> (and (= (type x_66@@0) RefType) (= (type x_66_1@@0) RefType)) (=> (and (and (and (and (not (= x_66@@0 x_66_1@@0)) (U_2_bool (MapType2Select setOfRef x_66@@0))) (U_2_bool (MapType2Select setOfRef x_66_1@@0))) (< NoPerm arg_rd@0)) (< NoPerm arg_rd@0)) (not (= x_66@@0 x_66_1@@0))))
 :qid |stdinbpl.2532:29|
 :skolemid |309|
 :no-pattern (type x_66@@0)
 :no-pattern (type x_66_1@@0)
 :no-pattern (U_2_int x_66@@0)
 :no-pattern (U_2_bool x_66@@0)
 :no-pattern (U_2_int x_66_1@@0)
 :no-pattern (U_2_bool x_66_1@@0)
)) (=> (and (forall ((x_66@@1 T@U) ) (!  (=> (= (type x_66@@1) RefType) (=> (and (U_2_bool (MapType2Select setOfRef x_66@@1)) (< NoPerm arg_rd@0)) (and (qpRange29 x_66@@1) (= (invRecv29 x_66@@1) x_66@@1))))
 :qid |stdinbpl.2538:36|
 :skolemid |310|
 :pattern ( (MapType0Select ExhaleHeap@2 x_66@@1 val))
 :pattern ( (MapType1Select QPMask@24 x_66@@1 val))
 :pattern ( (MapType2Select setOfRef x_66@@1))
)) (forall ((o_3@@29 T@U) ) (!  (=> (= (type o_3@@29) RefType) (=> (and (and (U_2_bool (MapType2Select setOfRef (invRecv29 o_3@@29))) (< NoPerm arg_rd@0)) (qpRange29 o_3@@29)) (= (invRecv29 o_3@@29) o_3@@29)))
 :qid |stdinbpl.2542:36|
 :skolemid |311|
 :pattern ( (invRecv29 o_3@@29))
))) (and (=> (= (ControlFlow 0 118) (- 0 130)) (forall ((x_66@@2 T@U) ) (!  (=> (and (= (type x_66@@2) RefType) (U_2_bool (MapType2Select setOfRef x_66@@2))) (>= arg_rd@0 NoPerm))
 :qid |stdinbpl.2548:29|
 :skolemid |312|
 :pattern ( (MapType0Select ExhaleHeap@2 x_66@@2 val))
 :pattern ( (MapType1Select QPMask@24 x_66@@2 val))
 :pattern ( (MapType2Select setOfRef x_66@@2))
))) (=> (forall ((x_66@@3 T@U) ) (!  (=> (and (= (type x_66@@3) RefType) (U_2_bool (MapType2Select setOfRef x_66@@3))) (>= arg_rd@0 NoPerm))
 :qid |stdinbpl.2548:29|
 :skolemid |312|
 :pattern ( (MapType0Select ExhaleHeap@2 x_66@@3 val))
 :pattern ( (MapType1Select QPMask@24 x_66@@3 val))
 :pattern ( (MapType2Select setOfRef x_66@@3))
)) (=> (forall ((x_66@@4 T@U) ) (!  (=> (= (type x_66@@4) RefType) (=> (and (U_2_bool (MapType2Select setOfRef x_66@@4)) (> arg_rd@0 NoPerm)) (not (= x_66@@4 null))))
 :qid |stdinbpl.2554:36|
 :skolemid |313|
 :pattern ( (MapType0Select ExhaleHeap@2 x_66@@4 val))
 :pattern ( (MapType1Select QPMask@24 x_66@@4 val))
 :pattern ( (MapType2Select setOfRef x_66@@4))
)) (=> (and (and (forall ((o_3@@30 T@U) ) (!  (=> (= (type o_3@@30) RefType) (and (=> (and (and (U_2_bool (MapType2Select setOfRef (invRecv29 o_3@@30))) (< NoPerm arg_rd@0)) (qpRange29 o_3@@30)) (and (=> (< NoPerm arg_rd@0) (= (invRecv29 o_3@@30) o_3@@30)) (= (U_2_real (MapType1Select QPMask@24 o_3@@30 val)) (+ (U_2_real (MapType1Select QPMask@23 o_3@@30 val)) arg_rd@0)))) (=> (not (and (and (U_2_bool (MapType2Select setOfRef (invRecv29 o_3@@30))) (< NoPerm arg_rd@0)) (qpRange29 o_3@@30))) (= (U_2_real (MapType1Select QPMask@24 o_3@@30 val)) (U_2_real (MapType1Select QPMask@23 o_3@@30 val))))))
 :qid |stdinbpl.2560:36|
 :skolemid |314|
 :pattern ( (MapType1Select QPMask@24 o_3@@30 val))
)) (forall ((o_3@@31 T@U) (f_5@@9 T@U) ) (! (let ((B@@21 (FieldTypeInv1 (type f_5@@9))))
(let ((A@@22 (FieldTypeInv0 (type f_5@@9))))
 (=> (and (and (= (type o_3@@31) RefType) (= (type f_5@@9) (FieldType A@@22 B@@21))) (not (= f_5@@9 val))) (= (U_2_real (MapType1Select QPMask@23 o_3@@31 f_5@@9)) (U_2_real (MapType1Select QPMask@24 o_3@@31 f_5@@9))))))
 :qid |stdinbpl.2564:43|
 :skolemid |315|
 :pattern ( (MapType1Select QPMask@23 o_3@@31 f_5@@9))
 :pattern ( (MapType1Select QPMask@24 o_3@@31 f_5@@9))
))) (and (state ExhaleHeap@2 QPMask@24) (forall ((x_67 T@U) ) (!  (=> (and (= (type x_67) RefType) (U_2_bool (MapType2Select setOfRef x_67))) (= (U_2_int (MapType0Select ExhaleHeap@2 x_67 val)) (U_2_int (MapType0Select ExhaleHeap@0 x_67 val))))
 :qid |stdinbpl.2570:34|
 :skolemid |316|
 :pattern ( (MapType2Select setOfRef x_67))
)))) (and (=> (= (ControlFlow 0 118) (- 0 129)) (forall ((x_68 T@U) (x_68_1 T@U) ) (!  (=> (and (= (type x_68) RefType) (= (type x_68_1) RefType)) (=> (and (and (and (and (not (= x_68 x_68_1)) (U_2_bool (MapType2Select setOfRef x_68))) (U_2_bool (MapType2Select setOfRef x_68_1))) (< NoPerm arg_rd@0)) (< NoPerm arg_rd@0)) (not (= x_68 x_68_1))))
 :qid |stdinbpl.2576:29|
 :skolemid |317|
 :no-pattern (type x_68)
 :no-pattern (type x_68_1)
 :no-pattern (U_2_int x_68)
 :no-pattern (U_2_bool x_68)
 :no-pattern (U_2_int x_68_1)
 :no-pattern (U_2_bool x_68_1)
))) (=> (forall ((x_68@@0 T@U) (x_68_1@@0 T@U) ) (!  (=> (and (= (type x_68@@0) RefType) (= (type x_68_1@@0) RefType)) (=> (and (and (and (and (not (= x_68@@0 x_68_1@@0)) (U_2_bool (MapType2Select setOfRef x_68@@0))) (U_2_bool (MapType2Select setOfRef x_68_1@@0))) (< NoPerm arg_rd@0)) (< NoPerm arg_rd@0)) (not (= x_68@@0 x_68_1@@0))))
 :qid |stdinbpl.2576:29|
 :skolemid |317|
 :no-pattern (type x_68@@0)
 :no-pattern (type x_68_1@@0)
 :no-pattern (U_2_int x_68@@0)
 :no-pattern (U_2_bool x_68@@0)
 :no-pattern (U_2_int x_68_1@@0)
 :no-pattern (U_2_bool x_68_1@@0)
)) (=> (and (forall ((x_68@@1 T@U) ) (!  (=> (= (type x_68@@1) RefType) (=> (and (U_2_bool (MapType2Select setOfRef x_68@@1)) (< NoPerm arg_rd@0)) (and (qpRange30 x_68@@1) (= (invRecv30 x_68@@1) x_68@@1))))
 :qid |stdinbpl.2582:36|
 :skolemid |318|
 :pattern ( (MapType0Select ExhaleHeap@2 x_68@@1 edges))
 :pattern ( (MapType1Select QPMask@25 x_68@@1 edges))
 :pattern ( (MapType2Select setOfRef x_68@@1))
)) (forall ((o_3@@32 T@U) ) (!  (=> (= (type o_3@@32) RefType) (=> (and (and (U_2_bool (MapType2Select setOfRef (invRecv30 o_3@@32))) (< NoPerm arg_rd@0)) (qpRange30 o_3@@32)) (= (invRecv30 o_3@@32) o_3@@32)))
 :qid |stdinbpl.2586:36|
 :skolemid |319|
 :pattern ( (invRecv30 o_3@@32))
))) (and (=> (= (ControlFlow 0 118) (- 0 128)) (forall ((x_68@@2 T@U) ) (!  (=> (and (= (type x_68@@2) RefType) (U_2_bool (MapType2Select setOfRef x_68@@2))) (>= arg_rd@0 NoPerm))
 :qid |stdinbpl.2592:29|
 :skolemid |320|
 :pattern ( (MapType0Select ExhaleHeap@2 x_68@@2 edges))
 :pattern ( (MapType1Select QPMask@25 x_68@@2 edges))
 :pattern ( (MapType2Select setOfRef x_68@@2))
))) (=> (forall ((x_68@@3 T@U) ) (!  (=> (and (= (type x_68@@3) RefType) (U_2_bool (MapType2Select setOfRef x_68@@3))) (>= arg_rd@0 NoPerm))
 :qid |stdinbpl.2592:29|
 :skolemid |320|
 :pattern ( (MapType0Select ExhaleHeap@2 x_68@@3 edges))
 :pattern ( (MapType1Select QPMask@25 x_68@@3 edges))
 :pattern ( (MapType2Select setOfRef x_68@@3))
)) (=> (and (and (and (forall ((x_68@@4 T@U) ) (!  (=> (= (type x_68@@4) RefType) (=> (and (U_2_bool (MapType2Select setOfRef x_68@@4)) (> arg_rd@0 NoPerm)) (not (= x_68@@4 null))))
 :qid |stdinbpl.2598:36|
 :skolemid |321|
 :pattern ( (MapType0Select ExhaleHeap@2 x_68@@4 edges))
 :pattern ( (MapType1Select QPMask@25 x_68@@4 edges))
 :pattern ( (MapType2Select setOfRef x_68@@4))
)) (forall ((o_3@@33 T@U) ) (!  (=> (= (type o_3@@33) RefType) (and (=> (and (and (U_2_bool (MapType2Select setOfRef (invRecv30 o_3@@33))) (< NoPerm arg_rd@0)) (qpRange30 o_3@@33)) (and (=> (< NoPerm arg_rd@0) (= (invRecv30 o_3@@33) o_3@@33)) (= (U_2_real (MapType1Select QPMask@25 o_3@@33 edges)) (+ (U_2_real (MapType1Select QPMask@24 o_3@@33 edges)) arg_rd@0)))) (=> (not (and (and (U_2_bool (MapType2Select setOfRef (invRecv30 o_3@@33))) (< NoPerm arg_rd@0)) (qpRange30 o_3@@33))) (= (U_2_real (MapType1Select QPMask@25 o_3@@33 edges)) (U_2_real (MapType1Select QPMask@24 o_3@@33 edges))))))
 :qid |stdinbpl.2604:36|
 :skolemid |322|
 :pattern ( (MapType1Select QPMask@25 o_3@@33 edges))
))) (and (forall ((o_3@@34 T@U) (f_5@@10 T@U) ) (! (let ((B@@22 (FieldTypeInv1 (type f_5@@10))))
(let ((A@@23 (FieldTypeInv0 (type f_5@@10))))
 (=> (and (and (= (type o_3@@34) RefType) (= (type f_5@@10) (FieldType A@@23 B@@22))) (not (= f_5@@10 edges))) (= (U_2_real (MapType1Select QPMask@24 o_3@@34 f_5@@10)) (U_2_real (MapType1Select QPMask@25 o_3@@34 f_5@@10))))))
 :qid |stdinbpl.2608:43|
 :skolemid |323|
 :pattern ( (MapType1Select QPMask@24 o_3@@34 f_5@@10))
 :pattern ( (MapType1Select QPMask@25 o_3@@34 f_5@@10))
)) (state ExhaleHeap@2 QPMask@25))) (and (and (forall ((x_69 T@U) ) (!  (=> (and (= (type x_69) RefType) (U_2_bool (MapType2Select setOfRef x_69))) (= (MapType0Select ExhaleHeap@2 x_69 edges) (MapType0Select ExhaleHeap@0 x_69 edges)))
 :qid |stdinbpl.2614:34|
 :skolemid |324|
 :pattern ( (MapType2Select setOfRef x_69))
)) (forall ((x_70 T@U) (i$0_2 Int) ) (!  (=> (= (type x_70) RefType) (=> (and (U_2_bool (MapType2Select setOfRef x_70)) (U_2_bool (MapType2Select (edges_domain (MapType0Select ExhaleHeap@2 x_70 edges)) (int_2_U i$0_2)))) (U_2_bool (MapType2Select setOfRef (edge_lookup (MapType0Select ExhaleHeap@2 x_70 edges) i$0_2)))))
 :qid |stdinbpl.2618:34|
 :skolemid |325|
 :pattern ( (MapType2Select setOfRef x_70) (MapType2Select (edges_domain (MapType0Select ExhaleHeap@2 x_70 edges)) (int_2_U i$0_2)))
 :pattern ( (MapType2Select setOfRef x_70) (edge_lookup (MapType0Select ExhaleHeap@2 x_70 edges) i$0_2))
 :pattern ( (MapType2Select setOfRef x_70) (MapType2Select setOfRef (edge_lookup (MapType0Select ExhaleHeap@2 x_70 edges) i$0_2)))
 :pattern ( (edges_domain (MapType0Select ExhaleHeap@2 x_70 edges)) (edge_lookup (MapType0Select ExhaleHeap@2 x_70 edges) i$0_2))
 :pattern ( (edges_domain (MapType0Select ExhaleHeap@2 x_70 edges)) (MapType2Select setOfRef (edge_lookup (MapType0Select ExhaleHeap@2 x_70 edges) i$0_2)))
 :pattern ( (MapType2Select (edges_domain (MapType0Select ExhaleHeap@2 x_70 edges)) (int_2_U i$0_2)))
 :pattern ( (MapType2Select setOfRef (edge_lookup (MapType0Select ExhaleHeap@2 x_70 edges) i$0_2)))
))) (and (|Set#Equal| res_copy_nodes@3 (|Set#Union| res_copy_nodes@3 res_copy_nodes@1)) (forall ((x_71 T@U) ) (!  (=> (and (= (type x_71) RefType) (|Seq#Contains| (map_domain res_node_map@3) x_71)) (U_2_bool (MapType2Select res_copy_nodes@3 (lookup res_node_map@3 x_71))))
 :qid |stdinbpl.2623:34|
 :skolemid |326|
 :pattern ( (|Seq#ContainsTrigger| (map_domain res_node_map@3) x_71))
 :pattern ( (|Seq#Contains| (map_domain res_node_map@3) x_71))
 :pattern ( (MapType2Select res_copy_nodes@3 (lookup res_node_map@3 x_71)))
))))) (and (=> (= (ControlFlow 0 118) (- 0 127)) (forall ((x_72 T@U) (x_72_1 T@U) ) (!  (=> (and (= (type x_72) RefType) (= (type x_72_1) RefType)) (=> (and (and (and (and (not (= x_72 x_72_1)) (U_2_bool (MapType2Select res_copy_nodes@3 x_72))) (U_2_bool (MapType2Select res_copy_nodes@3 x_72_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= x_72 x_72_1))))
 :qid |stdinbpl.2629:29|
 :skolemid |327|
 :no-pattern (type x_72)
 :no-pattern (type x_72_1)
 :no-pattern (U_2_int x_72)
 :no-pattern (U_2_bool x_72)
 :no-pattern (U_2_int x_72_1)
 :no-pattern (U_2_bool x_72_1)
))) (=> (forall ((x_72@@0 T@U) (x_72_1@@0 T@U) ) (!  (=> (and (= (type x_72@@0) RefType) (= (type x_72_1@@0) RefType)) (=> (and (and (and (and (not (= x_72@@0 x_72_1@@0)) (U_2_bool (MapType2Select res_copy_nodes@3 x_72@@0))) (U_2_bool (MapType2Select res_copy_nodes@3 x_72_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= x_72@@0 x_72_1@@0))))
 :qid |stdinbpl.2629:29|
 :skolemid |327|
 :no-pattern (type x_72@@0)
 :no-pattern (type x_72_1@@0)
 :no-pattern (U_2_int x_72@@0)
 :no-pattern (U_2_bool x_72@@0)
 :no-pattern (U_2_int x_72_1@@0)
 :no-pattern (U_2_bool x_72_1@@0)
)) (=> (and (forall ((x_72@@1 T@U) ) (!  (=> (= (type x_72@@1) RefType) (=> (and (U_2_bool (MapType2Select res_copy_nodes@3 x_72@@1)) (< NoPerm FullPerm)) (and (qpRange31 x_72@@1) (= (invRecv31 x_72@@1) x_72@@1))))
 :qid |stdinbpl.2635:36|
 :skolemid |328|
 :pattern ( (MapType0Select ExhaleHeap@2 x_72@@1 val))
 :pattern ( (MapType1Select QPMask@26 x_72@@1 val))
 :pattern ( (MapType2Select res_copy_nodes@3 x_72@@1))
)) (forall ((o_3@@35 T@U) ) (!  (=> (= (type o_3@@35) RefType) (=> (and (and (U_2_bool (MapType2Select res_copy_nodes@3 (invRecv31 o_3@@35))) (< NoPerm FullPerm)) (qpRange31 o_3@@35)) (= (invRecv31 o_3@@35) o_3@@35)))
 :qid |stdinbpl.2639:36|
 :skolemid |329|
 :pattern ( (invRecv31 o_3@@35))
))) (=> (and (and (forall ((x_72@@2 T@U) ) (!  (=> (and (= (type x_72@@2) RefType) (U_2_bool (MapType2Select res_copy_nodes@3 x_72@@2))) (not (= x_72@@2 null)))
 :qid |stdinbpl.2645:36|
 :skolemid |330|
 :pattern ( (MapType0Select ExhaleHeap@2 x_72@@2 val))
 :pattern ( (MapType1Select QPMask@26 x_72@@2 val))
 :pattern ( (MapType2Select res_copy_nodes@3 x_72@@2))
)) (forall ((o_3@@36 T@U) ) (!  (=> (= (type o_3@@36) RefType) (and (=> (and (and (U_2_bool (MapType2Select res_copy_nodes@3 (invRecv31 o_3@@36))) (< NoPerm FullPerm)) (qpRange31 o_3@@36)) (and (=> (< NoPerm FullPerm) (= (invRecv31 o_3@@36) o_3@@36)) (= (U_2_real (MapType1Select QPMask@26 o_3@@36 val)) (+ (U_2_real (MapType1Select QPMask@25 o_3@@36 val)) FullPerm)))) (=> (not (and (and (U_2_bool (MapType2Select res_copy_nodes@3 (invRecv31 o_3@@36))) (< NoPerm FullPerm)) (qpRange31 o_3@@36))) (= (U_2_real (MapType1Select QPMask@26 o_3@@36 val)) (U_2_real (MapType1Select QPMask@25 o_3@@36 val))))))
 :qid |stdinbpl.2651:36|
 :skolemid |331|
 :pattern ( (MapType1Select QPMask@26 o_3@@36 val))
))) (and (forall ((o_3@@37 T@U) (f_5@@11 T@U) ) (! (let ((B@@23 (FieldTypeInv1 (type f_5@@11))))
(let ((A@@24 (FieldTypeInv0 (type f_5@@11))))
 (=> (and (and (= (type o_3@@37) RefType) (= (type f_5@@11) (FieldType A@@24 B@@23))) (not (= f_5@@11 val))) (= (U_2_real (MapType1Select QPMask@25 o_3@@37 f_5@@11)) (U_2_real (MapType1Select QPMask@26 o_3@@37 f_5@@11))))))
 :qid |stdinbpl.2655:43|
 :skolemid |332|
 :pattern ( (MapType1Select QPMask@25 o_3@@37 f_5@@11))
 :pattern ( (MapType1Select QPMask@26 o_3@@37 f_5@@11))
)) (state ExhaleHeap@2 QPMask@26))) (and (=> (= (ControlFlow 0 118) (- 0 126)) (forall ((x_73 T@U) (x_73_1 T@U) ) (!  (=> (and (= (type x_73) RefType) (= (type x_73_1) RefType)) (=> (and (and (and (and (not (= x_73 x_73_1)) (U_2_bool (MapType2Select res_copy_nodes@3 x_73))) (U_2_bool (MapType2Select res_copy_nodes@3 x_73_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= x_73 x_73_1))))
 :qid |stdinbpl.2663:29|
 :skolemid |333|
 :no-pattern (type x_73)
 :no-pattern (type x_73_1)
 :no-pattern (U_2_int x_73)
 :no-pattern (U_2_bool x_73)
 :no-pattern (U_2_int x_73_1)
 :no-pattern (U_2_bool x_73_1)
))) (=> (forall ((x_73@@0 T@U) (x_73_1@@0 T@U) ) (!  (=> (and (= (type x_73@@0) RefType) (= (type x_73_1@@0) RefType)) (=> (and (and (and (and (not (= x_73@@0 x_73_1@@0)) (U_2_bool (MapType2Select res_copy_nodes@3 x_73@@0))) (U_2_bool (MapType2Select res_copy_nodes@3 x_73_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= x_73@@0 x_73_1@@0))))
 :qid |stdinbpl.2663:29|
 :skolemid |333|
 :no-pattern (type x_73@@0)
 :no-pattern (type x_73_1@@0)
 :no-pattern (U_2_int x_73@@0)
 :no-pattern (U_2_bool x_73@@0)
 :no-pattern (U_2_int x_73_1@@0)
 :no-pattern (U_2_bool x_73_1@@0)
)) (=> (forall ((x_73@@1 T@U) ) (!  (=> (= (type x_73@@1) RefType) (=> (and (U_2_bool (MapType2Select res_copy_nodes@3 x_73@@1)) (< NoPerm FullPerm)) (and (qpRange32 x_73@@1) (= (invRecv32 x_73@@1) x_73@@1))))
 :qid |stdinbpl.2669:36|
 :skolemid |334|
 :pattern ( (MapType0Select ExhaleHeap@2 x_73@@1 edges))
 :pattern ( (MapType1Select QPMask@27 x_73@@1 edges))
 :pattern ( (MapType2Select res_copy_nodes@3 x_73@@1))
)) (=> (and (and (and (forall ((o_3@@38 T@U) ) (!  (=> (= (type o_3@@38) RefType) (=> (and (and (U_2_bool (MapType2Select res_copy_nodes@3 (invRecv32 o_3@@38))) (< NoPerm FullPerm)) (qpRange32 o_3@@38)) (= (invRecv32 o_3@@38) o_3@@38)))
 :qid |stdinbpl.2673:36|
 :skolemid |335|
 :pattern ( (invRecv32 o_3@@38))
)) (forall ((x_73@@2 T@U) ) (!  (=> (and (= (type x_73@@2) RefType) (U_2_bool (MapType2Select res_copy_nodes@3 x_73@@2))) (not (= x_73@@2 null)))
 :qid |stdinbpl.2679:36|
 :skolemid |336|
 :pattern ( (MapType0Select ExhaleHeap@2 x_73@@2 edges))
 :pattern ( (MapType1Select QPMask@27 x_73@@2 edges))
 :pattern ( (MapType2Select res_copy_nodes@3 x_73@@2))
))) (and (forall ((o_3@@39 T@U) ) (!  (=> (= (type o_3@@39) RefType) (and (=> (and (and (U_2_bool (MapType2Select res_copy_nodes@3 (invRecv32 o_3@@39))) (< NoPerm FullPerm)) (qpRange32 o_3@@39)) (and (=> (< NoPerm FullPerm) (= (invRecv32 o_3@@39) o_3@@39)) (= (U_2_real (MapType1Select QPMask@27 o_3@@39 edges)) (+ (U_2_real (MapType1Select QPMask@26 o_3@@39 edges)) FullPerm)))) (=> (not (and (and (U_2_bool (MapType2Select res_copy_nodes@3 (invRecv32 o_3@@39))) (< NoPerm FullPerm)) (qpRange32 o_3@@39))) (= (U_2_real (MapType1Select QPMask@27 o_3@@39 edges)) (U_2_real (MapType1Select QPMask@26 o_3@@39 edges))))))
 :qid |stdinbpl.2685:36|
 :skolemid |337|
 :pattern ( (MapType1Select QPMask@27 o_3@@39 edges))
)) (forall ((o_3@@40 T@U) (f_5@@12 T@U) ) (! (let ((B@@24 (FieldTypeInv1 (type f_5@@12))))
(let ((A@@25 (FieldTypeInv0 (type f_5@@12))))
 (=> (and (and (= (type o_3@@40) RefType) (= (type f_5@@12) (FieldType A@@25 B@@24))) (not (= f_5@@12 edges))) (= (U_2_real (MapType1Select QPMask@26 o_3@@40 f_5@@12)) (U_2_real (MapType1Select QPMask@27 o_3@@40 f_5@@12))))))
 :qid |stdinbpl.2689:43|
 :skolemid |338|
 :pattern ( (MapType1Select QPMask@26 o_3@@40 f_5@@12))
 :pattern ( (MapType1Select QPMask@27 o_3@@40 f_5@@12))
)))) (and (and (state ExhaleHeap@2 QPMask@27) (state ExhaleHeap@2 QPMask@27)) (and (U_2_bool (MapType0Select ExhaleHeap@2 newNode@0 $allocated)) (state ExhaleHeap@2 QPMask@27)))) (and (=> (= (ControlFlow 0 118) (- 0 125)) (HasDirectPerm QPMask@27 freshObj@0 edges)) (=> (HasDirectPerm QPMask@27 freshObj@0 edges) (and (=> (= (ControlFlow 0 118) (- 0 124)) (= FullPerm (U_2_real (MapType1Select QPMask@27 freshObj@0 edges)))) (=> (= FullPerm (U_2_real (MapType1Select QPMask@27 freshObj@0 edges))) (=> (and (= Heap@3 (MapType0Store ExhaleHeap@2 freshObj@0 edges (insert_edge (MapType0Select ExhaleHeap@2 freshObj@0 edges) i_6@1 newNode@0))) (state Heap@3 QPMask@27)) (and (=> (= (ControlFlow 0 118) (- 0 123)) (U_2_bool (MapType2Select res_copy_nodes@3 freshObj@0))) (=> (U_2_bool (MapType2Select res_copy_nodes@3 freshObj@0)) (and (=> (= (ControlFlow 0 118) (- 0 122)) (U_2_bool (MapType2Select setOfRef this))) (=> (U_2_bool (MapType2Select setOfRef this)) (and (=> (= (ControlFlow 0 118) (- 0 121)) (forall ((x_74 T@U) ) (!  (=> (= (type x_74) RefType) (=> (and (U_2_bool (MapType2Select setOfRef x_74)) (dummyFunction (MapType0Select Heap@3 x_74 val))) (>= rd NoPerm)))
 :qid |stdinbpl.2719:25|
 :skolemid |339|
 :pattern ( (MapType0Select Heap@3 x_74 val))
 :pattern ( (MapType1Select QPMask@28 x_74 val))
 :pattern ( (MapType2Select setOfRef x_74))
))) (=> (forall ((x_74@@0 T@U) ) (!  (=> (= (type x_74@@0) RefType) (=> (and (U_2_bool (MapType2Select setOfRef x_74@@0)) (dummyFunction (MapType0Select Heap@3 x_74@@0 val))) (>= rd NoPerm)))
 :qid |stdinbpl.2719:25|
 :skolemid |339|
 :pattern ( (MapType0Select Heap@3 x_74@@0 val))
 :pattern ( (MapType1Select QPMask@28 x_74@@0 val))
 :pattern ( (MapType2Select setOfRef x_74@@0))
)) (and (=> (= (ControlFlow 0 118) (- 0 120)) (forall ((x_74@@1 T@U) (x_74_1 T@U) ) (!  (=> (and (= (type x_74@@1) RefType) (= (type x_74_1) RefType)) (=> (and (and (and (and (not (= x_74@@1 x_74_1)) (U_2_bool (MapType2Select setOfRef x_74@@1))) (U_2_bool (MapType2Select setOfRef x_74_1))) (< NoPerm rd)) (< NoPerm rd)) (not (= x_74@@1 x_74_1))))
 :qid |stdinbpl.2726:25|
 :skolemid |340|
 :pattern ( (neverTriggered33 x_74@@1) (neverTriggered33 x_74_1))
))) (=> (forall ((x_74@@2 T@U) (x_74_1@@0 T@U) ) (!  (=> (and (= (type x_74@@2) RefType) (= (type x_74_1@@0) RefType)) (=> (and (and (and (and (not (= x_74@@2 x_74_1@@0)) (U_2_bool (MapType2Select setOfRef x_74@@2))) (U_2_bool (MapType2Select setOfRef x_74_1@@0))) (< NoPerm rd)) (< NoPerm rd)) (not (= x_74@@2 x_74_1@@0))))
 :qid |stdinbpl.2726:25|
 :skolemid |340|
 :pattern ( (neverTriggered33 x_74@@2) (neverTriggered33 x_74_1@@0))
)) (and (=> (= (ControlFlow 0 118) (- 0 119)) (forall ((x_74@@3 T@U) ) (!  (=> (and (= (type x_74@@3) RefType) (U_2_bool (MapType2Select setOfRef x_74@@3))) (>= (U_2_real (MapType1Select QPMask@27 x_74@@3 val)) rd))
 :qid |stdinbpl.2733:25|
 :skolemid |341|
 :pattern ( (MapType0Select Heap@3 x_74@@3 val))
 :pattern ( (MapType1Select QPMask@28 x_74@@3 val))
 :pattern ( (MapType2Select setOfRef x_74@@3))
))) (=> (forall ((x_74@@4 T@U) ) (!  (=> (and (= (type x_74@@4) RefType) (U_2_bool (MapType2Select setOfRef x_74@@4))) (>= (U_2_real (MapType1Select QPMask@27 x_74@@4 val)) rd))
 :qid |stdinbpl.2733:25|
 :skolemid |341|
 :pattern ( (MapType0Select Heap@3 x_74@@4 val))
 :pattern ( (MapType1Select QPMask@28 x_74@@4 val))
 :pattern ( (MapType2Select setOfRef x_74@@4))
)) (=> (and (and (forall ((x_74@@5 T@U) ) (!  (=> (= (type x_74@@5) RefType) (=> (and (U_2_bool (MapType2Select setOfRef x_74@@5)) (< NoPerm rd)) (and (qpRange33 x_74@@5) (= (invRecv33 x_74@@5) x_74@@5))))
 :qid |stdinbpl.2739:30|
 :skolemid |342|
 :pattern ( (MapType0Select Heap@3 x_74@@5 val))
 :pattern ( (MapType1Select QPMask@28 x_74@@5 val))
 :pattern ( (MapType2Select setOfRef x_74@@5))
)) (forall ((o_3@@41 T@U) ) (!  (=> (= (type o_3@@41) RefType) (=> (and (U_2_bool (MapType2Select setOfRef (invRecv33 o_3@@41))) (and (< NoPerm rd) (qpRange33 o_3@@41))) (= (invRecv33 o_3@@41) o_3@@41)))
 :qid |stdinbpl.2743:30|
 :skolemid |343|
 :pattern ( (invRecv33 o_3@@41))
))) (and (forall ((o_3@@42 T@U) ) (!  (=> (= (type o_3@@42) RefType) (and (=> (and (U_2_bool (MapType2Select setOfRef (invRecv33 o_3@@42))) (and (< NoPerm rd) (qpRange33 o_3@@42))) (and (= (invRecv33 o_3@@42) o_3@@42) (= (U_2_real (MapType1Select QPMask@28 o_3@@42 val)) (- (U_2_real (MapType1Select QPMask@27 o_3@@42 val)) rd)))) (=> (not (and (U_2_bool (MapType2Select setOfRef (invRecv33 o_3@@42))) (and (< NoPerm rd) (qpRange33 o_3@@42)))) (= (U_2_real (MapType1Select QPMask@28 o_3@@42 val)) (U_2_real (MapType1Select QPMask@27 o_3@@42 val))))))
 :qid |stdinbpl.2749:30|
 :skolemid |344|
 :pattern ( (MapType1Select QPMask@28 o_3@@42 val))
)) (forall ((o_3@@43 T@U) (f_5@@13 T@U) ) (! (let ((B@@25 (FieldTypeInv1 (type f_5@@13))))
(let ((A@@26 (FieldTypeInv0 (type f_5@@13))))
 (=> (and (and (= (type o_3@@43) RefType) (= (type f_5@@13) (FieldType A@@26 B@@25))) (not (= f_5@@13 val))) (= (U_2_real (MapType1Select QPMask@27 o_3@@43 f_5@@13)) (U_2_real (MapType1Select QPMask@28 o_3@@43 f_5@@13))))))
 :qid |stdinbpl.2755:37|
 :skolemid |345|
 :pattern ( (MapType1Select QPMask@28 o_3@@43 f_5@@13))
)))) (and (and (=> (= (ControlFlow 0 118) 114) anon194_Else_correct) (=> (= (ControlFlow 0 118) 85) anon195_Then_correct)) (=> (= (ControlFlow 0 118) 87) anon195_Else_correct))))))))))))))))))))))))))))))))))))))))))))))))))))
(let ((anon102_correct true))
(let ((anon193_Else_correct  (=> (and (not (|Seq#Contains| (map_domain res_node_map@1) x_62)) (= (ControlFlow 0 83) 80)) anon102_correct)))
(let ((anon193_Then_correct  (=> (|Seq#Contains| (map_domain res_node_map@1) x_62) (and (=> (= (ControlFlow 0 81) (- 0 82)) (U_2_bool (MapType2Select res_copy_nodes@1 (lookup res_node_map@1 x_62)))) (=> (U_2_bool (MapType2Select res_copy_nodes@1 (lookup res_node_map@1 x_62))) (=> (= (ControlFlow 0 81) 80) anon102_correct))))))
(let ((anon190_Else_correct  (=> (forall ((x_61_1 T@U) (i$0_1_1 Int) ) (!  (=> (= (type x_61_1) RefType) (=> (and (U_2_bool (MapType2Select setOfRef x_61_1)) (U_2_bool (MapType2Select (edges_domain (MapType0Select ExhaleHeap@0 x_61_1 edges)) (int_2_U i$0_1_1)))) (U_2_bool (MapType2Select setOfRef (edge_lookup (MapType0Select ExhaleHeap@0 x_61_1 edges) i$0_1_1)))))
 :qid |stdinbpl.2421:34|
 :skolemid |295|
 :pattern ( (MapType2Select setOfRef x_61_1) (MapType2Select (edges_domain (MapType0Select ExhaleHeap@0 x_61_1 edges)) (int_2_U i$0_1_1)))
 :pattern ( (MapType2Select setOfRef x_61_1) (edge_lookup (MapType0Select ExhaleHeap@0 x_61_1 edges) i$0_1_1))
 :pattern ( (MapType2Select setOfRef x_61_1) (MapType2Select setOfRef (edge_lookup (MapType0Select ExhaleHeap@0 x_61_1 edges) i$0_1_1)))
 :pattern ( (edges_domain (MapType0Select ExhaleHeap@0 x_61_1 edges)) (edge_lookup (MapType0Select ExhaleHeap@0 x_61_1 edges) i$0_1_1))
 :pattern ( (edges_domain (MapType0Select ExhaleHeap@0 x_61_1 edges)) (MapType2Select setOfRef (edge_lookup (MapType0Select ExhaleHeap@0 x_61_1 edges) i$0_1_1)))
 :pattern ( (MapType2Select (edges_domain (MapType0Select ExhaleHeap@0 x_61_1 edges)) (int_2_U i$0_1_1)))
 :pattern ( (MapType2Select setOfRef (edge_lookup (MapType0Select ExhaleHeap@0 x_61_1 edges) i$0_1_1)))
)) (and (and (=> (= (ControlFlow 0 136) 118) anon192_Else_correct) (=> (= (ControlFlow 0 136) 81) anon193_Then_correct)) (=> (= (ControlFlow 0 136) 83) anon193_Else_correct)))))
(let ((anon98_correct true))
(let ((anon191_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select setOfRef x_60)) (U_2_bool (MapType2Select (edges_domain (MapType0Select ExhaleHeap@0 x_60 edges)) (int_2_U i$0))))) (= (ControlFlow 0 79) 76)) anon98_correct)))
(let ((anon191_Then_correct  (=> (and (U_2_bool (MapType2Select setOfRef x_60)) (U_2_bool (MapType2Select (edges_domain (MapType0Select ExhaleHeap@0 x_60 edges)) (int_2_U i$0)))) (and (=> (= (ControlFlow 0 77) (- 0 78)) (U_2_bool (MapType2Select setOfRef (edge_lookup (MapType0Select ExhaleHeap@0 x_60 edges) i$0)))) (=> (U_2_bool (MapType2Select setOfRef (edge_lookup (MapType0Select ExhaleHeap@0 x_60 edges) i$0))) (=> (= (ControlFlow 0 77) 76) anon98_correct))))))
(let ((anon189_Then_correct  (=> (state ExhaleHeap@0 ZeroMask) (=> (and (U_2_bool (MapType2Select res_copy_nodes@1 freshObj@0)) (U_2_bool (MapType2Select setOfRef this))) (and (=> (= (ControlFlow 0 137) (- 0 155)) (forall ((x_54 T@U) (x_54_1 T@U) ) (!  (=> (and (= (type x_54) RefType) (= (type x_54_1) RefType)) (=> (and (and (and (and (not (= x_54 x_54_1)) (U_2_bool (MapType2Select setOfRef x_54))) (U_2_bool (MapType2Select setOfRef x_54_1))) (< NoPerm rd)) (< NoPerm rd)) (not (= x_54 x_54_1))))
 :qid |stdinbpl.2098:23|
 :skolemid |250|
 :no-pattern (type x_54)
 :no-pattern (type x_54_1)
 :no-pattern (U_2_int x_54)
 :no-pattern (U_2_bool x_54)
 :no-pattern (U_2_int x_54_1)
 :no-pattern (U_2_bool x_54_1)
))) (=> (forall ((x_54@@0 T@U) (x_54_1@@0 T@U) ) (!  (=> (and (= (type x_54@@0) RefType) (= (type x_54_1@@0) RefType)) (=> (and (and (and (and (not (= x_54@@0 x_54_1@@0)) (U_2_bool (MapType2Select setOfRef x_54@@0))) (U_2_bool (MapType2Select setOfRef x_54_1@@0))) (< NoPerm rd)) (< NoPerm rd)) (not (= x_54@@0 x_54_1@@0))))
 :qid |stdinbpl.2098:23|
 :skolemid |250|
 :no-pattern (type x_54@@0)
 :no-pattern (type x_54_1@@0)
 :no-pattern (U_2_int x_54@@0)
 :no-pattern (U_2_bool x_54@@0)
 :no-pattern (U_2_int x_54_1@@0)
 :no-pattern (U_2_bool x_54_1@@0)
)) (=> (and (forall ((x_54@@1 T@U) ) (!  (=> (= (type x_54@@1) RefType) (=> (and (U_2_bool (MapType2Select setOfRef x_54@@1)) (< NoPerm rd)) (and (qpRange21 x_54@@1) (= (invRecv21 x_54@@1) x_54@@1))))
 :qid |stdinbpl.2104:30|
 :skolemid |251|
 :pattern ( (MapType0Select ExhaleHeap@0 x_54@@1 val))
 :pattern ( (MapType1Select QPMask@8 x_54@@1 val))
 :pattern ( (MapType2Select setOfRef x_54@@1))
)) (forall ((o_3@@44 T@U) ) (!  (=> (= (type o_3@@44) RefType) (=> (and (and (U_2_bool (MapType2Select setOfRef (invRecv21 o_3@@44))) (< NoPerm rd)) (qpRange21 o_3@@44)) (= (invRecv21 o_3@@44) o_3@@44)))
 :qid |stdinbpl.2108:30|
 :skolemid |252|
 :pattern ( (invRecv21 o_3@@44))
))) (and (=> (= (ControlFlow 0 137) (- 0 154)) (forall ((x_54@@2 T@U) ) (!  (=> (and (= (type x_54@@2) RefType) (U_2_bool (MapType2Select setOfRef x_54@@2))) (>= rd NoPerm))
 :qid |stdinbpl.2114:23|
 :skolemid |253|
 :pattern ( (MapType0Select ExhaleHeap@0 x_54@@2 val))
 :pattern ( (MapType1Select QPMask@8 x_54@@2 val))
 :pattern ( (MapType2Select setOfRef x_54@@2))
))) (=> (forall ((x_54@@3 T@U) ) (!  (=> (and (= (type x_54@@3) RefType) (U_2_bool (MapType2Select setOfRef x_54@@3))) (>= rd NoPerm))
 :qid |stdinbpl.2114:23|
 :skolemid |253|
 :pattern ( (MapType0Select ExhaleHeap@0 x_54@@3 val))
 :pattern ( (MapType1Select QPMask@8 x_54@@3 val))
 :pattern ( (MapType2Select setOfRef x_54@@3))
)) (=> (forall ((x_54@@4 T@U) ) (!  (=> (= (type x_54@@4) RefType) (=> (and (U_2_bool (MapType2Select setOfRef x_54@@4)) (> rd NoPerm)) (not (= x_54@@4 null))))
 :qid |stdinbpl.2120:30|
 :skolemid |254|
 :pattern ( (MapType0Select ExhaleHeap@0 x_54@@4 val))
 :pattern ( (MapType1Select QPMask@8 x_54@@4 val))
 :pattern ( (MapType2Select setOfRef x_54@@4))
)) (=> (and (and (forall ((o_3@@45 T@U) ) (!  (=> (= (type o_3@@45) RefType) (and (=> (and (and (U_2_bool (MapType2Select setOfRef (invRecv21 o_3@@45))) (< NoPerm rd)) (qpRange21 o_3@@45)) (and (=> (< NoPerm rd) (= (invRecv21 o_3@@45) o_3@@45)) (= (U_2_real (MapType1Select QPMask@8 o_3@@45 val)) (+ (U_2_real (MapType1Select ZeroMask o_3@@45 val)) rd)))) (=> (not (and (and (U_2_bool (MapType2Select setOfRef (invRecv21 o_3@@45))) (< NoPerm rd)) (qpRange21 o_3@@45))) (= (U_2_real (MapType1Select QPMask@8 o_3@@45 val)) (U_2_real (MapType1Select ZeroMask o_3@@45 val))))))
 :qid |stdinbpl.2126:30|
 :skolemid |255|
 :pattern ( (MapType1Select QPMask@8 o_3@@45 val))
)) (forall ((o_3@@46 T@U) (f_5@@14 T@U) ) (! (let ((B@@26 (FieldTypeInv1 (type f_5@@14))))
(let ((A@@27 (FieldTypeInv0 (type f_5@@14))))
 (=> (and (and (= (type o_3@@46) RefType) (= (type f_5@@14) (FieldType A@@27 B@@26))) (not (= f_5@@14 val))) (= (U_2_real (MapType1Select ZeroMask o_3@@46 f_5@@14)) (U_2_real (MapType1Select QPMask@8 o_3@@46 f_5@@14))))))
 :qid |stdinbpl.2130:37|
 :skolemid |256|
 :pattern ( (MapType1Select ZeroMask o_3@@46 f_5@@14))
 :pattern ( (MapType1Select QPMask@8 o_3@@46 f_5@@14))
))) (and (state ExhaleHeap@0 QPMask@8) (forall ((x_55 T@U) ) (!  (=> (and (= (type x_55) RefType) (U_2_bool (MapType2Select setOfRef x_55))) (= (U_2_int (MapType0Select ExhaleHeap@0 x_55 val)) (U_2_int (MapType0Select Heap@@9 x_55 val))))
 :qid |stdinbpl.2136:28|
 :skolemid |257|
 :pattern ( (MapType2Select setOfRef x_55))
)))) (and (=> (= (ControlFlow 0 137) (- 0 153)) (forall ((x_56 T@U) (x_56_1 T@U) ) (!  (=> (and (= (type x_56) RefType) (= (type x_56_1) RefType)) (=> (and (and (and (and (not (= x_56 x_56_1)) (U_2_bool (MapType2Select setOfRef x_56))) (U_2_bool (MapType2Select setOfRef x_56_1))) (< NoPerm rd)) (< NoPerm rd)) (not (= x_56 x_56_1))))
 :qid |stdinbpl.2142:23|
 :skolemid |258|
 :no-pattern (type x_56)
 :no-pattern (type x_56_1)
 :no-pattern (U_2_int x_56)
 :no-pattern (U_2_bool x_56)
 :no-pattern (U_2_int x_56_1)
 :no-pattern (U_2_bool x_56_1)
))) (=> (forall ((x_56@@0 T@U) (x_56_1@@0 T@U) ) (!  (=> (and (= (type x_56@@0) RefType) (= (type x_56_1@@0) RefType)) (=> (and (and (and (and (not (= x_56@@0 x_56_1@@0)) (U_2_bool (MapType2Select setOfRef x_56@@0))) (U_2_bool (MapType2Select setOfRef x_56_1@@0))) (< NoPerm rd)) (< NoPerm rd)) (not (= x_56@@0 x_56_1@@0))))
 :qid |stdinbpl.2142:23|
 :skolemid |258|
 :no-pattern (type x_56@@0)
 :no-pattern (type x_56_1@@0)
 :no-pattern (U_2_int x_56@@0)
 :no-pattern (U_2_bool x_56@@0)
 :no-pattern (U_2_int x_56_1@@0)
 :no-pattern (U_2_bool x_56_1@@0)
)) (=> (and (forall ((x_56@@1 T@U) ) (!  (=> (= (type x_56@@1) RefType) (=> (and (U_2_bool (MapType2Select setOfRef x_56@@1)) (< NoPerm rd)) (and (qpRange22 x_56@@1) (= (invRecv22 x_56@@1) x_56@@1))))
 :qid |stdinbpl.2148:30|
 :skolemid |259|
 :pattern ( (MapType0Select ExhaleHeap@0 x_56@@1 edges))
 :pattern ( (MapType1Select QPMask@9 x_56@@1 edges))
 :pattern ( (MapType2Select setOfRef x_56@@1))
)) (forall ((o_3@@47 T@U) ) (!  (=> (= (type o_3@@47) RefType) (=> (and (and (U_2_bool (MapType2Select setOfRef (invRecv22 o_3@@47))) (< NoPerm rd)) (qpRange22 o_3@@47)) (= (invRecv22 o_3@@47) o_3@@47)))
 :qid |stdinbpl.2152:30|
 :skolemid |260|
 :pattern ( (invRecv22 o_3@@47))
))) (and (=> (= (ControlFlow 0 137) (- 0 152)) (forall ((x_56@@2 T@U) ) (!  (=> (and (= (type x_56@@2) RefType) (U_2_bool (MapType2Select setOfRef x_56@@2))) (>= rd NoPerm))
 :qid |stdinbpl.2158:23|
 :skolemid |261|
 :pattern ( (MapType0Select ExhaleHeap@0 x_56@@2 edges))
 :pattern ( (MapType1Select QPMask@9 x_56@@2 edges))
 :pattern ( (MapType2Select setOfRef x_56@@2))
))) (=> (forall ((x_56@@3 T@U) ) (!  (=> (and (= (type x_56@@3) RefType) (U_2_bool (MapType2Select setOfRef x_56@@3))) (>= rd NoPerm))
 :qid |stdinbpl.2158:23|
 :skolemid |261|
 :pattern ( (MapType0Select ExhaleHeap@0 x_56@@3 edges))
 :pattern ( (MapType1Select QPMask@9 x_56@@3 edges))
 :pattern ( (MapType2Select setOfRef x_56@@3))
)) (=> (and (forall ((x_56@@4 T@U) ) (!  (=> (= (type x_56@@4) RefType) (=> (and (U_2_bool (MapType2Select setOfRef x_56@@4)) (> rd NoPerm)) (not (= x_56@@4 null))))
 :qid |stdinbpl.2164:30|
 :skolemid |262|
 :pattern ( (MapType0Select ExhaleHeap@0 x_56@@4 edges))
 :pattern ( (MapType1Select QPMask@9 x_56@@4 edges))
 :pattern ( (MapType2Select setOfRef x_56@@4))
)) (forall ((o_3@@48 T@U) ) (!  (=> (= (type o_3@@48) RefType) (and (=> (and (and (U_2_bool (MapType2Select setOfRef (invRecv22 o_3@@48))) (< NoPerm rd)) (qpRange22 o_3@@48)) (and (=> (< NoPerm rd) (= (invRecv22 o_3@@48) o_3@@48)) (= (U_2_real (MapType1Select QPMask@9 o_3@@48 edges)) (+ (U_2_real (MapType1Select QPMask@8 o_3@@48 edges)) rd)))) (=> (not (and (and (U_2_bool (MapType2Select setOfRef (invRecv22 o_3@@48))) (< NoPerm rd)) (qpRange22 o_3@@48))) (= (U_2_real (MapType1Select QPMask@9 o_3@@48 edges)) (U_2_real (MapType1Select QPMask@8 o_3@@48 edges))))))
 :qid |stdinbpl.2170:30|
 :skolemid |263|
 :pattern ( (MapType1Select QPMask@9 o_3@@48 edges))
))) (=> (and (and (and (forall ((o_3@@49 T@U) (f_5@@15 T@U) ) (! (let ((B@@27 (FieldTypeInv1 (type f_5@@15))))
(let ((A@@28 (FieldTypeInv0 (type f_5@@15))))
 (=> (and (and (= (type o_3@@49) RefType) (= (type f_5@@15) (FieldType A@@28 B@@27))) (not (= f_5@@15 edges))) (= (U_2_real (MapType1Select QPMask@8 o_3@@49 f_5@@15)) (U_2_real (MapType1Select QPMask@9 o_3@@49 f_5@@15))))))
 :qid |stdinbpl.2174:37|
 :skolemid |264|
 :pattern ( (MapType1Select QPMask@8 o_3@@49 f_5@@15))
 :pattern ( (MapType1Select QPMask@9 o_3@@49 f_5@@15))
)) (state ExhaleHeap@0 QPMask@9)) (and (forall ((x_57 T@U) ) (!  (=> (and (= (type x_57) RefType) (U_2_bool (MapType2Select setOfRef x_57))) (= (MapType0Select ExhaleHeap@0 x_57 edges) (MapType0Select Heap@@9 x_57 edges)))
 :qid |stdinbpl.2180:28|
 :skolemid |265|
 :pattern ( (MapType2Select setOfRef x_57))
)) (forall ((j_8 Int) ) (!  (=> (U_2_bool (MapType2Select S@1 (int_2_U j_8))) (U_2_bool (MapType2Select setOfRef (edge_lookup (MapType0Select ExhaleHeap@0 this edges) j_8))))
 :qid |stdinbpl.2184:28|
 :skolemid |266|
 :pattern ( (MapType2Select S@1 (int_2_U j_8)))
 :pattern ( (MapType2Select setOfRef (edge_lookup (MapType0Select ExhaleHeap@0 this edges) j_8)))
)))) (and (and (forall ((r_14 T@U) (j_9 Int) ) (!  (=> (= (type r_14) RefType) (=> (and (U_2_bool (MapType2Select setOfRef r_14)) (U_2_bool (MapType2Select (edges_domain (MapType0Select ExhaleHeap@0 r_14 edges)) (int_2_U j_9)))) (U_2_bool (MapType2Select setOfRef (edge_lookup (MapType0Select ExhaleHeap@0 r_14 edges) j_9)))))
 :qid |stdinbpl.2188:28|
 :skolemid |267|
 :pattern ( (MapType2Select setOfRef r_14) (MapType2Select (edges_domain (MapType0Select ExhaleHeap@0 r_14 edges)) (int_2_U j_9)))
 :pattern ( (MapType2Select setOfRef r_14) (edge_lookup (MapType0Select ExhaleHeap@0 r_14 edges) j_9))
 :pattern ( (MapType2Select setOfRef r_14) (MapType2Select setOfRef (edge_lookup (MapType0Select ExhaleHeap@0 r_14 edges) j_9)))
 :pattern ( (edges_domain (MapType0Select ExhaleHeap@0 r_14 edges)) (edge_lookup (MapType0Select ExhaleHeap@0 r_14 edges) j_9))
 :pattern ( (edges_domain (MapType0Select ExhaleHeap@0 r_14 edges)) (MapType2Select setOfRef (edge_lookup (MapType0Select ExhaleHeap@0 r_14 edges) j_9)))
 :pattern ( (MapType2Select (edges_domain (MapType0Select ExhaleHeap@0 r_14 edges)) (int_2_U j_9)))
 :pattern ( (MapType2Select setOfRef (edge_lookup (MapType0Select ExhaleHeap@0 r_14 edges) j_9)))
)) (|Set#Subset| node_map_image res_copy_nodes@1)) (and (= (|Set#Card| (|Set#Intersection| setOfRef res_copy_nodes@1)) 0) (forall ((r_15 T@U) ) (!  (=> (and (= (type r_15) RefType) (|Seq#Contains| (map_domain res_node_map@1) r_15)) (U_2_bool (MapType2Select res_copy_nodes@1 (lookup res_node_map@1 r_15))))
 :qid |stdinbpl.2194:28|
 :skolemid |268|
 :pattern ( (|Seq#ContainsTrigger| (map_domain res_node_map@1) r_15))
 :pattern ( (|Seq#Contains| (map_domain res_node_map@1) r_15))
 :pattern ( (MapType2Select res_copy_nodes@1 (lookup res_node_map@1 r_15)))
))))) (and (=> (= (ControlFlow 0 137) (- 0 151)) (forall ((r_16 T@U) (r_16_1 T@U) ) (!  (=> (and (= (type r_16) RefType) (= (type r_16_1) RefType)) (=> (and (and (and (and (not (= r_16 r_16_1)) (U_2_bool (MapType2Select res_copy_nodes@1 r_16))) (U_2_bool (MapType2Select res_copy_nodes@1 r_16_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= r_16 r_16_1))))
 :qid |stdinbpl.2200:23|
 :skolemid |269|
 :no-pattern (type r_16)
 :no-pattern (type r_16_1)
 :no-pattern (U_2_int r_16)
 :no-pattern (U_2_bool r_16)
 :no-pattern (U_2_int r_16_1)
 :no-pattern (U_2_bool r_16_1)
))) (=> (forall ((r_16@@0 T@U) (r_16_1@@0 T@U) ) (!  (=> (and (= (type r_16@@0) RefType) (= (type r_16_1@@0) RefType)) (=> (and (and (and (and (not (= r_16@@0 r_16_1@@0)) (U_2_bool (MapType2Select res_copy_nodes@1 r_16@@0))) (U_2_bool (MapType2Select res_copy_nodes@1 r_16_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= r_16@@0 r_16_1@@0))))
 :qid |stdinbpl.2200:23|
 :skolemid |269|
 :no-pattern (type r_16@@0)
 :no-pattern (type r_16_1@@0)
 :no-pattern (U_2_int r_16@@0)
 :no-pattern (U_2_bool r_16@@0)
 :no-pattern (U_2_int r_16_1@@0)
 :no-pattern (U_2_bool r_16_1@@0)
)) (=> (and (forall ((r_16@@1 T@U) ) (!  (=> (= (type r_16@@1) RefType) (=> (and (U_2_bool (MapType2Select res_copy_nodes@1 r_16@@1)) (< NoPerm FullPerm)) (and (qpRange23 r_16@@1) (= (invRecv23 r_16@@1) r_16@@1))))
 :qid |stdinbpl.2206:30|
 :skolemid |270|
 :pattern ( (MapType0Select ExhaleHeap@0 r_16@@1 val))
 :pattern ( (MapType1Select QPMask@10 r_16@@1 val))
 :pattern ( (MapType2Select res_copy_nodes@1 r_16@@1))
)) (forall ((o_3@@50 T@U) ) (!  (=> (= (type o_3@@50) RefType) (=> (and (and (U_2_bool (MapType2Select res_copy_nodes@1 (invRecv23 o_3@@50))) (< NoPerm FullPerm)) (qpRange23 o_3@@50)) (= (invRecv23 o_3@@50) o_3@@50)))
 :qid |stdinbpl.2210:30|
 :skolemid |271|
 :pattern ( (invRecv23 o_3@@50))
))) (=> (and (and (forall ((r_16@@2 T@U) ) (!  (=> (and (= (type r_16@@2) RefType) (U_2_bool (MapType2Select res_copy_nodes@1 r_16@@2))) (not (= r_16@@2 null)))
 :qid |stdinbpl.2216:30|
 :skolemid |272|
 :pattern ( (MapType0Select ExhaleHeap@0 r_16@@2 val))
 :pattern ( (MapType1Select QPMask@10 r_16@@2 val))
 :pattern ( (MapType2Select res_copy_nodes@1 r_16@@2))
)) (forall ((o_3@@51 T@U) ) (!  (=> (= (type o_3@@51) RefType) (and (=> (and (and (U_2_bool (MapType2Select res_copy_nodes@1 (invRecv23 o_3@@51))) (< NoPerm FullPerm)) (qpRange23 o_3@@51)) (and (=> (< NoPerm FullPerm) (= (invRecv23 o_3@@51) o_3@@51)) (= (U_2_real (MapType1Select QPMask@10 o_3@@51 val)) (+ (U_2_real (MapType1Select QPMask@9 o_3@@51 val)) FullPerm)))) (=> (not (and (and (U_2_bool (MapType2Select res_copy_nodes@1 (invRecv23 o_3@@51))) (< NoPerm FullPerm)) (qpRange23 o_3@@51))) (= (U_2_real (MapType1Select QPMask@10 o_3@@51 val)) (U_2_real (MapType1Select QPMask@9 o_3@@51 val))))))
 :qid |stdinbpl.2222:30|
 :skolemid |273|
 :pattern ( (MapType1Select QPMask@10 o_3@@51 val))
))) (and (forall ((o_3@@52 T@U) (f_5@@16 T@U) ) (! (let ((B@@28 (FieldTypeInv1 (type f_5@@16))))
(let ((A@@29 (FieldTypeInv0 (type f_5@@16))))
 (=> (and (and (= (type o_3@@52) RefType) (= (type f_5@@16) (FieldType A@@29 B@@28))) (not (= f_5@@16 val))) (= (U_2_real (MapType1Select QPMask@9 o_3@@52 f_5@@16)) (U_2_real (MapType1Select QPMask@10 o_3@@52 f_5@@16))))))
 :qid |stdinbpl.2226:37|
 :skolemid |274|
 :pattern ( (MapType1Select QPMask@9 o_3@@52 f_5@@16))
 :pattern ( (MapType1Select QPMask@10 o_3@@52 f_5@@16))
)) (state ExhaleHeap@0 QPMask@10))) (and (=> (= (ControlFlow 0 137) (- 0 150)) (forall ((r_17 T@U) (r_17_1 T@U) ) (!  (=> (and (= (type r_17) RefType) (= (type r_17_1) RefType)) (=> (and (and (and (and (not (= r_17 r_17_1)) (U_2_bool (MapType2Select res_copy_nodes@1 r_17))) (U_2_bool (MapType2Select res_copy_nodes@1 r_17_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= r_17 r_17_1))))
 :qid |stdinbpl.2234:23|
 :skolemid |275|
 :no-pattern (type r_17)
 :no-pattern (type r_17_1)
 :no-pattern (U_2_int r_17)
 :no-pattern (U_2_bool r_17)
 :no-pattern (U_2_int r_17_1)
 :no-pattern (U_2_bool r_17_1)
))) (=> (forall ((r_17@@0 T@U) (r_17_1@@0 T@U) ) (!  (=> (and (= (type r_17@@0) RefType) (= (type r_17_1@@0) RefType)) (=> (and (and (and (and (not (= r_17@@0 r_17_1@@0)) (U_2_bool (MapType2Select res_copy_nodes@1 r_17@@0))) (U_2_bool (MapType2Select res_copy_nodes@1 r_17_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= r_17@@0 r_17_1@@0))))
 :qid |stdinbpl.2234:23|
 :skolemid |275|
 :no-pattern (type r_17@@0)
 :no-pattern (type r_17_1@@0)
 :no-pattern (U_2_int r_17@@0)
 :no-pattern (U_2_bool r_17@@0)
 :no-pattern (U_2_int r_17_1@@0)
 :no-pattern (U_2_bool r_17_1@@0)
)) (=> (forall ((r_17@@1 T@U) ) (!  (=> (= (type r_17@@1) RefType) (=> (and (U_2_bool (MapType2Select res_copy_nodes@1 r_17@@1)) (< NoPerm FullPerm)) (and (qpRange24 r_17@@1) (= (invRecv24 r_17@@1) r_17@@1))))
 :qid |stdinbpl.2240:30|
 :skolemid |276|
 :pattern ( (MapType0Select ExhaleHeap@0 r_17@@1 edges))
 :pattern ( (MapType1Select QPMask@11 r_17@@1 edges))
 :pattern ( (MapType2Select res_copy_nodes@1 r_17@@1))
)) (=> (and (forall ((o_3@@53 T@U) ) (!  (=> (= (type o_3@@53) RefType) (=> (and (and (U_2_bool (MapType2Select res_copy_nodes@1 (invRecv24 o_3@@53))) (< NoPerm FullPerm)) (qpRange24 o_3@@53)) (= (invRecv24 o_3@@53) o_3@@53)))
 :qid |stdinbpl.2244:30|
 :skolemid |277|
 :pattern ( (invRecv24 o_3@@53))
)) (forall ((r_17@@2 T@U) ) (!  (=> (and (= (type r_17@@2) RefType) (U_2_bool (MapType2Select res_copy_nodes@1 r_17@@2))) (not (= r_17@@2 null)))
 :qid |stdinbpl.2250:30|
 :skolemid |278|
 :pattern ( (MapType0Select ExhaleHeap@0 r_17@@2 edges))
 :pattern ( (MapType1Select QPMask@11 r_17@@2 edges))
 :pattern ( (MapType2Select res_copy_nodes@1 r_17@@2))
))) (=> (and (and (and (forall ((o_3@@54 T@U) ) (!  (=> (= (type o_3@@54) RefType) (and (=> (and (and (U_2_bool (MapType2Select res_copy_nodes@1 (invRecv24 o_3@@54))) (< NoPerm FullPerm)) (qpRange24 o_3@@54)) (and (=> (< NoPerm FullPerm) (= (invRecv24 o_3@@54) o_3@@54)) (= (U_2_real (MapType1Select QPMask@11 o_3@@54 edges)) (+ (U_2_real (MapType1Select QPMask@10 o_3@@54 edges)) FullPerm)))) (=> (not (and (and (U_2_bool (MapType2Select res_copy_nodes@1 (invRecv24 o_3@@54))) (< NoPerm FullPerm)) (qpRange24 o_3@@54))) (= (U_2_real (MapType1Select QPMask@11 o_3@@54 edges)) (U_2_real (MapType1Select QPMask@10 o_3@@54 edges))))))
 :qid |stdinbpl.2256:30|
 :skolemid |279|
 :pattern ( (MapType1Select QPMask@11 o_3@@54 edges))
)) (forall ((o_3@@55 T@U) (f_5@@17 T@U) ) (! (let ((B@@29 (FieldTypeInv1 (type f_5@@17))))
(let ((A@@30 (FieldTypeInv0 (type f_5@@17))))
 (=> (and (and (= (type o_3@@55) RefType) (= (type f_5@@17) (FieldType A@@30 B@@29))) (not (= f_5@@17 edges))) (= (U_2_real (MapType1Select QPMask@10 o_3@@55 f_5@@17)) (U_2_real (MapType1Select QPMask@11 o_3@@55 f_5@@17))))))
 :qid |stdinbpl.2260:37|
 :skolemid |280|
 :pattern ( (MapType1Select QPMask@10 o_3@@55 f_5@@17))
 :pattern ( (MapType1Select QPMask@11 o_3@@55 f_5@@17))
))) (and (state ExhaleHeap@0 QPMask@11) (state ExhaleHeap@0 QPMask@11))) (and (and (> (|Set#Card| S@1) 0) (state ExhaleHeap@0 QPMask@11)) (and (U_2_bool (MapType0Select ExhaleHeap@0 newNode $allocated)) (U_2_bool (MapType0Select ExhaleHeap@0 nodeForId $allocated))))) (and (=> (= (ControlFlow 0 137) (- 0 149)) (< 0 (|Set#Card| S@1))) (=> (< 0 (|Set#Card| S@1)) (=> (and (and (U_2_bool (MapType2Select S@1 (int_2_U i_6@1))) (|Set#Equal| S@2 (|Set#Difference| S@1 (|Set#Singleton| (int_2_U i_6@1))))) (and (state ExhaleHeap@0 QPMask@11) (state ExhaleHeap@0 QPMask@11))) (and (=> (= (ControlFlow 0 137) (- 0 148)) (HasDirectPerm QPMask@11 this edges)) (=> (HasDirectPerm QPMask@11 this edges) (=> (= nodeForId@0 (edge_lookup (MapType0Select ExhaleHeap@0 this edges) i_6@1)) (=> (and (state ExhaleHeap@0 QPMask@11) (= arg_rd@0 (/ rd (to_real 2)))) (and (=> (= (ControlFlow 0 137) (- 0 147)) (< NoPerm arg_rd@0)) (=> (< NoPerm arg_rd@0) (and (=> (= (ControlFlow 0 137) (- 0 146)) (not (= nodeForId@0 null))) (=> (not (= nodeForId@0 null)) (and (=> (= (ControlFlow 0 137) (- 0 145)) (U_2_bool (MapType2Select setOfRef nodeForId@0))) (=> (U_2_bool (MapType2Select setOfRef nodeForId@0)) (and (=> (= (ControlFlow 0 137) (- 0 144)) (= (|Set#Card| (|Set#Intersection| setOfRef res_copy_nodes@1)) 0)) (=> (= (|Set#Card| (|Set#Intersection| setOfRef res_copy_nodes@1)) 0) (and (=> (= (ControlFlow 0 137) (- 0 143)) (forall ((x_58 T@U) ) (!  (=> (= (type x_58) RefType) (=> (and (U_2_bool (MapType2Select setOfRef x_58)) (dummyFunction (MapType0Select ExhaleHeap@0 x_58 val))) (>= arg_rd@0 NoPerm)))
 :qid |stdinbpl.2328:31|
 :skolemid |281|
 :pattern ( (MapType0Select ExhaleHeap@0 x_58 val))
 :pattern ( (MapType1Select QPMask@12 x_58 val))
 :pattern ( (MapType2Select setOfRef x_58))
))) (=> (forall ((x_58@@0 T@U) ) (!  (=> (= (type x_58@@0) RefType) (=> (and (U_2_bool (MapType2Select setOfRef x_58@@0)) (dummyFunction (MapType0Select ExhaleHeap@0 x_58@@0 val))) (>= arg_rd@0 NoPerm)))
 :qid |stdinbpl.2328:31|
 :skolemid |281|
 :pattern ( (MapType0Select ExhaleHeap@0 x_58@@0 val))
 :pattern ( (MapType1Select QPMask@12 x_58@@0 val))
 :pattern ( (MapType2Select setOfRef x_58@@0))
)) (and (=> (= (ControlFlow 0 137) (- 0 142)) (forall ((x_58@@1 T@U) (x_58_1 T@U) ) (!  (=> (and (= (type x_58@@1) RefType) (= (type x_58_1) RefType)) (=> (and (and (and (and (not (= x_58@@1 x_58_1)) (U_2_bool (MapType2Select setOfRef x_58@@1))) (U_2_bool (MapType2Select setOfRef x_58_1))) (< NoPerm arg_rd@0)) (< NoPerm arg_rd@0)) (not (= x_58@@1 x_58_1))))
 :qid |stdinbpl.2335:31|
 :skolemid |282|
 :pattern ( (neverTriggered25 x_58@@1) (neverTriggered25 x_58_1))
))) (=> (forall ((x_58@@2 T@U) (x_58_1@@0 T@U) ) (!  (=> (and (= (type x_58@@2) RefType) (= (type x_58_1@@0) RefType)) (=> (and (and (and (and (not (= x_58@@2 x_58_1@@0)) (U_2_bool (MapType2Select setOfRef x_58@@2))) (U_2_bool (MapType2Select setOfRef x_58_1@@0))) (< NoPerm arg_rd@0)) (< NoPerm arg_rd@0)) (not (= x_58@@2 x_58_1@@0))))
 :qid |stdinbpl.2335:31|
 :skolemid |282|
 :pattern ( (neverTriggered25 x_58@@2) (neverTriggered25 x_58_1@@0))
)) (and (=> (= (ControlFlow 0 137) (- 0 141)) (forall ((x_58@@3 T@U) ) (!  (=> (and (= (type x_58@@3) RefType) (U_2_bool (MapType2Select setOfRef x_58@@3))) (>= (U_2_real (MapType1Select QPMask@11 x_58@@3 val)) arg_rd@0))
 :qid |stdinbpl.2342:31|
 :skolemid |283|
 :pattern ( (MapType0Select ExhaleHeap@0 x_58@@3 val))
 :pattern ( (MapType1Select QPMask@12 x_58@@3 val))
 :pattern ( (MapType2Select setOfRef x_58@@3))
))) (=> (forall ((x_58@@4 T@U) ) (!  (=> (and (= (type x_58@@4) RefType) (U_2_bool (MapType2Select setOfRef x_58@@4))) (>= (U_2_real (MapType1Select QPMask@11 x_58@@4 val)) arg_rd@0))
 :qid |stdinbpl.2342:31|
 :skolemid |283|
 :pattern ( (MapType0Select ExhaleHeap@0 x_58@@4 val))
 :pattern ( (MapType1Select QPMask@12 x_58@@4 val))
 :pattern ( (MapType2Select setOfRef x_58@@4))
)) (=> (and (and (forall ((x_58@@5 T@U) ) (!  (=> (= (type x_58@@5) RefType) (=> (and (U_2_bool (MapType2Select setOfRef x_58@@5)) (< NoPerm arg_rd@0)) (and (qpRange25 x_58@@5) (= (invRecv25 x_58@@5) x_58@@5))))
 :qid |stdinbpl.2348:36|
 :skolemid |284|
 :pattern ( (MapType0Select ExhaleHeap@0 x_58@@5 val))
 :pattern ( (MapType1Select QPMask@12 x_58@@5 val))
 :pattern ( (MapType2Select setOfRef x_58@@5))
)) (forall ((o_3@@56 T@U) ) (!  (=> (= (type o_3@@56) RefType) (=> (and (U_2_bool (MapType2Select setOfRef (invRecv25 o_3@@56))) (and (< NoPerm arg_rd@0) (qpRange25 o_3@@56))) (= (invRecv25 o_3@@56) o_3@@56)))
 :qid |stdinbpl.2352:36|
 :skolemid |285|
 :pattern ( (invRecv25 o_3@@56))
))) (and (forall ((o_3@@57 T@U) ) (!  (=> (= (type o_3@@57) RefType) (and (=> (and (U_2_bool (MapType2Select setOfRef (invRecv25 o_3@@57))) (and (< NoPerm arg_rd@0) (qpRange25 o_3@@57))) (and (= (invRecv25 o_3@@57) o_3@@57) (= (U_2_real (MapType1Select QPMask@12 o_3@@57 val)) (- (U_2_real (MapType1Select QPMask@11 o_3@@57 val)) arg_rd@0)))) (=> (not (and (U_2_bool (MapType2Select setOfRef (invRecv25 o_3@@57))) (and (< NoPerm arg_rd@0) (qpRange25 o_3@@57)))) (= (U_2_real (MapType1Select QPMask@12 o_3@@57 val)) (U_2_real (MapType1Select QPMask@11 o_3@@57 val))))))
 :qid |stdinbpl.2358:36|
 :skolemid |286|
 :pattern ( (MapType1Select QPMask@12 o_3@@57 val))
)) (forall ((o_3@@58 T@U) (f_5@@18 T@U) ) (! (let ((B@@30 (FieldTypeInv1 (type f_5@@18))))
(let ((A@@31 (FieldTypeInv0 (type f_5@@18))))
 (=> (and (and (= (type o_3@@58) RefType) (= (type f_5@@18) (FieldType A@@31 B@@30))) (not (= f_5@@18 val))) (= (U_2_real (MapType1Select QPMask@11 o_3@@58 f_5@@18)) (U_2_real (MapType1Select QPMask@12 o_3@@58 f_5@@18))))))
 :qid |stdinbpl.2364:43|
 :skolemid |287|
 :pattern ( (MapType1Select QPMask@12 o_3@@58 f_5@@18))
)))) (and (=> (= (ControlFlow 0 137) (- 0 140)) (forall ((x_59 T@U) ) (!  (=> (= (type x_59) RefType) (=> (and (U_2_bool (MapType2Select setOfRef x_59)) (dummyFunction (MapType0Select ExhaleHeap@0 x_59 edges))) (>= arg_rd@0 NoPerm)))
 :qid |stdinbpl.2373:31|
 :skolemid |288|
 :pattern ( (MapType0Select ExhaleHeap@0 x_59 edges))
 :pattern ( (MapType1Select QPMask@13 x_59 edges))
 :pattern ( (MapType2Select setOfRef x_59))
))) (=> (forall ((x_59@@0 T@U) ) (!  (=> (= (type x_59@@0) RefType) (=> (and (U_2_bool (MapType2Select setOfRef x_59@@0)) (dummyFunction (MapType0Select ExhaleHeap@0 x_59@@0 edges))) (>= arg_rd@0 NoPerm)))
 :qid |stdinbpl.2373:31|
 :skolemid |288|
 :pattern ( (MapType0Select ExhaleHeap@0 x_59@@0 edges))
 :pattern ( (MapType1Select QPMask@13 x_59@@0 edges))
 :pattern ( (MapType2Select setOfRef x_59@@0))
)) (and (=> (= (ControlFlow 0 137) (- 0 139)) (forall ((x_59@@1 T@U) (x_59_1 T@U) ) (!  (=> (and (= (type x_59@@1) RefType) (= (type x_59_1) RefType)) (=> (and (and (and (and (not (= x_59@@1 x_59_1)) (U_2_bool (MapType2Select setOfRef x_59@@1))) (U_2_bool (MapType2Select setOfRef x_59_1))) (< NoPerm arg_rd@0)) (< NoPerm arg_rd@0)) (not (= x_59@@1 x_59_1))))
 :qid |stdinbpl.2380:31|
 :skolemid |289|
 :pattern ( (neverTriggered26 x_59@@1) (neverTriggered26 x_59_1))
))) (=> (forall ((x_59@@2 T@U) (x_59_1@@0 T@U) ) (!  (=> (and (= (type x_59@@2) RefType) (= (type x_59_1@@0) RefType)) (=> (and (and (and (and (not (= x_59@@2 x_59_1@@0)) (U_2_bool (MapType2Select setOfRef x_59@@2))) (U_2_bool (MapType2Select setOfRef x_59_1@@0))) (< NoPerm arg_rd@0)) (< NoPerm arg_rd@0)) (not (= x_59@@2 x_59_1@@0))))
 :qid |stdinbpl.2380:31|
 :skolemid |289|
 :pattern ( (neverTriggered26 x_59@@2) (neverTriggered26 x_59_1@@0))
)) (and (=> (= (ControlFlow 0 137) (- 0 138)) (forall ((x_59@@3 T@U) ) (!  (=> (and (= (type x_59@@3) RefType) (U_2_bool (MapType2Select setOfRef x_59@@3))) (>= (U_2_real (MapType1Select QPMask@12 x_59@@3 edges)) arg_rd@0))
 :qid |stdinbpl.2387:31|
 :skolemid |290|
 :pattern ( (MapType0Select ExhaleHeap@0 x_59@@3 edges))
 :pattern ( (MapType1Select QPMask@13 x_59@@3 edges))
 :pattern ( (MapType2Select setOfRef x_59@@3))
))) (=> (forall ((x_59@@4 T@U) ) (!  (=> (and (= (type x_59@@4) RefType) (U_2_bool (MapType2Select setOfRef x_59@@4))) (>= (U_2_real (MapType1Select QPMask@12 x_59@@4 edges)) arg_rd@0))
 :qid |stdinbpl.2387:31|
 :skolemid |290|
 :pattern ( (MapType0Select ExhaleHeap@0 x_59@@4 edges))
 :pattern ( (MapType1Select QPMask@13 x_59@@4 edges))
 :pattern ( (MapType2Select setOfRef x_59@@4))
)) (=> (and (and (forall ((x_59@@5 T@U) ) (!  (=> (= (type x_59@@5) RefType) (=> (and (U_2_bool (MapType2Select setOfRef x_59@@5)) (< NoPerm arg_rd@0)) (and (qpRange26 x_59@@5) (= (invRecv26 x_59@@5) x_59@@5))))
 :qid |stdinbpl.2393:36|
 :skolemid |291|
 :pattern ( (MapType0Select ExhaleHeap@0 x_59@@5 edges))
 :pattern ( (MapType1Select QPMask@13 x_59@@5 edges))
 :pattern ( (MapType2Select setOfRef x_59@@5))
)) (forall ((o_3@@59 T@U) ) (!  (=> (= (type o_3@@59) RefType) (=> (and (U_2_bool (MapType2Select setOfRef (invRecv26 o_3@@59))) (and (< NoPerm arg_rd@0) (qpRange26 o_3@@59))) (= (invRecv26 o_3@@59) o_3@@59)))
 :qid |stdinbpl.2397:36|
 :skolemid |292|
 :pattern ( (invRecv26 o_3@@59))
))) (and (forall ((o_3@@60 T@U) ) (!  (=> (= (type o_3@@60) RefType) (and (=> (and (U_2_bool (MapType2Select setOfRef (invRecv26 o_3@@60))) (and (< NoPerm arg_rd@0) (qpRange26 o_3@@60))) (and (= (invRecv26 o_3@@60) o_3@@60) (= (U_2_real (MapType1Select QPMask@13 o_3@@60 edges)) (- (U_2_real (MapType1Select QPMask@12 o_3@@60 edges)) arg_rd@0)))) (=> (not (and (U_2_bool (MapType2Select setOfRef (invRecv26 o_3@@60))) (and (< NoPerm arg_rd@0) (qpRange26 o_3@@60)))) (= (U_2_real (MapType1Select QPMask@13 o_3@@60 edges)) (U_2_real (MapType1Select QPMask@12 o_3@@60 edges))))))
 :qid |stdinbpl.2403:36|
 :skolemid |293|
 :pattern ( (MapType1Select QPMask@13 o_3@@60 edges))
)) (forall ((o_3@@61 T@U) (f_5@@19 T@U) ) (! (let ((B@@31 (FieldTypeInv1 (type f_5@@19))))
(let ((A@@32 (FieldTypeInv0 (type f_5@@19))))
 (=> (and (and (= (type o_3@@61) RefType) (= (type f_5@@19) (FieldType A@@32 B@@31))) (not (= f_5@@19 edges))) (= (U_2_real (MapType1Select QPMask@12 o_3@@61 f_5@@19)) (U_2_real (MapType1Select QPMask@13 o_3@@61 f_5@@19))))))
 :qid |stdinbpl.2409:43|
 :skolemid |294|
 :pattern ( (MapType1Select QPMask@13 o_3@@61 f_5@@19))
)))) (and (and (=> (= (ControlFlow 0 137) 136) anon190_Else_correct) (=> (= (ControlFlow 0 137) 77) anon191_Then_correct)) (=> (= (ControlFlow 0 137) 79) anon191_Else_correct))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
(let ((anon140_correct true))
(let ((anon211_Else_correct  (=> (and (not (|Seq#Contains| (map_domain res_node_map@2) x_36)) (= (ControlFlow 0 53) 50)) anon140_correct)))
(let ((anon211_Then_correct  (=> (|Seq#Contains| (map_domain res_node_map@2) x_36) (and (=> (= (ControlFlow 0 51) (- 0 52)) (U_2_bool (MapType2Select res_copy_nodes@2 (lookup res_node_map@2 x_36)))) (=> (U_2_bool (MapType2Select res_copy_nodes@2 (lookup res_node_map@2 x_36))) (=> (= (ControlFlow 0 51) 50) anon140_correct))))))
(let ((anon210_Else_correct  (=> (forall ((x_37_1 T@U) ) (!  (=> (and (= (type x_37_1) RefType) (|Seq#Contains| (map_domain res_node_map@2) x_37_1)) (U_2_bool (MapType2Select res_copy_nodes@2 (lookup res_node_map@2 x_37_1))))
 :qid |stdinbpl.3275:20|
 :skolemid |418|
 :pattern ( (|Seq#ContainsTrigger| (map_domain res_node_map@2) x_37_1))
 :pattern ( (|Seq#Contains| (map_domain res_node_map@2) x_37_1))
 :pattern ( (MapType2Select res_copy_nodes@2 (lookup res_node_map@2 x_37_1)))
)) (and (=> (= (ControlFlow 0 46) (- 0 49)) (forall ((x_38 T@U) (x_38_1 T@U) ) (!  (=> (and (= (type x_38) RefType) (= (type x_38_1) RefType)) (=> (and (and (and (and (not (= x_38 x_38_1)) (U_2_bool (MapType2Select res_copy_nodes@2 x_38))) (U_2_bool (MapType2Select res_copy_nodes@2 x_38_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= x_38 x_38_1))))
 :qid |stdinbpl.3286:17|
 :skolemid |419|
 :pattern ( (neverTriggered11 x_38) (neverTriggered11 x_38_1))
))) (=> (forall ((x_38@@0 T@U) (x_38_1@@0 T@U) ) (!  (=> (and (= (type x_38@@0) RefType) (= (type x_38_1@@0) RefType)) (=> (and (and (and (and (not (= x_38@@0 x_38_1@@0)) (U_2_bool (MapType2Select res_copy_nodes@2 x_38@@0))) (U_2_bool (MapType2Select res_copy_nodes@2 x_38_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= x_38@@0 x_38_1@@0))))
 :qid |stdinbpl.3286:17|
 :skolemid |419|
 :pattern ( (neverTriggered11 x_38@@0) (neverTriggered11 x_38_1@@0))
)) (and (=> (= (ControlFlow 0 46) (- 0 48)) (forall ((x_38@@1 T@U) ) (!  (=> (and (= (type x_38@@1) RefType) (U_2_bool (MapType2Select res_copy_nodes@2 x_38@@1))) (>= (U_2_real (MapType1Select QPMask@19 x_38@@1 val)) FullPerm))
 :qid |stdinbpl.3293:17|
 :skolemid |420|
 :pattern ( (MapType0Select Heap@2 x_38@@1 val))
 :pattern ( (MapType1Select QPMask@20 x_38@@1 val))
 :pattern ( (MapType2Select res_copy_nodes@2 x_38@@1))
))) (=> (forall ((x_38@@2 T@U) ) (!  (=> (and (= (type x_38@@2) RefType) (U_2_bool (MapType2Select res_copy_nodes@2 x_38@@2))) (>= (U_2_real (MapType1Select QPMask@19 x_38@@2 val)) FullPerm))
 :qid |stdinbpl.3293:17|
 :skolemid |420|
 :pattern ( (MapType0Select Heap@2 x_38@@2 val))
 :pattern ( (MapType1Select QPMask@20 x_38@@2 val))
 :pattern ( (MapType2Select res_copy_nodes@2 x_38@@2))
)) (=> (and (and (forall ((x_38@@3 T@U) ) (!  (=> (= (type x_38@@3) RefType) (=> (and (U_2_bool (MapType2Select res_copy_nodes@2 x_38@@3)) (< NoPerm FullPerm)) (and (qpRange11 x_38@@3) (= (invRecv11 x_38@@3) x_38@@3))))
 :qid |stdinbpl.3299:22|
 :skolemid |421|
 :pattern ( (MapType0Select Heap@2 x_38@@3 val))
 :pattern ( (MapType1Select QPMask@20 x_38@@3 val))
 :pattern ( (MapType2Select res_copy_nodes@2 x_38@@3))
)) (forall ((o_3@@62 T@U) ) (!  (=> (= (type o_3@@62) RefType) (=> (and (U_2_bool (MapType2Select res_copy_nodes@2 (invRecv11 o_3@@62))) (and (< NoPerm FullPerm) (qpRange11 o_3@@62))) (= (invRecv11 o_3@@62) o_3@@62)))
 :qid |stdinbpl.3303:22|
 :skolemid |422|
 :pattern ( (invRecv11 o_3@@62))
))) (and (forall ((o_3@@63 T@U) ) (!  (=> (= (type o_3@@63) RefType) (and (=> (and (U_2_bool (MapType2Select res_copy_nodes@2 (invRecv11 o_3@@63))) (and (< NoPerm FullPerm) (qpRange11 o_3@@63))) (and (= (invRecv11 o_3@@63) o_3@@63) (= (U_2_real (MapType1Select QPMask@20 o_3@@63 val)) (- (U_2_real (MapType1Select QPMask@19 o_3@@63 val)) FullPerm)))) (=> (not (and (U_2_bool (MapType2Select res_copy_nodes@2 (invRecv11 o_3@@63))) (and (< NoPerm FullPerm) (qpRange11 o_3@@63)))) (= (U_2_real (MapType1Select QPMask@20 o_3@@63 val)) (U_2_real (MapType1Select QPMask@19 o_3@@63 val))))))
 :qid |stdinbpl.3309:22|
 :skolemid |423|
 :pattern ( (MapType1Select QPMask@20 o_3@@63 val))
)) (forall ((o_3@@64 T@U) (f_5@@20 T@U) ) (! (let ((B@@32 (FieldTypeInv1 (type f_5@@20))))
(let ((A@@33 (FieldTypeInv0 (type f_5@@20))))
 (=> (and (and (= (type o_3@@64) RefType) (= (type f_5@@20) (FieldType A@@33 B@@32))) (not (= f_5@@20 val))) (= (U_2_real (MapType1Select QPMask@19 o_3@@64 f_5@@20)) (U_2_real (MapType1Select QPMask@20 o_3@@64 f_5@@20))))))
 :qid |stdinbpl.3315:29|
 :skolemid |424|
 :pattern ( (MapType1Select QPMask@20 o_3@@64 f_5@@20))
)))) (and (=> (= (ControlFlow 0 46) (- 0 47)) (forall ((x_39 T@U) (x_39_1 T@U) ) (!  (=> (and (= (type x_39) RefType) (= (type x_39_1) RefType)) (=> (and (and (and (and (not (= x_39 x_39_1)) (U_2_bool (MapType2Select res_copy_nodes@2 x_39))) (U_2_bool (MapType2Select res_copy_nodes@2 x_39_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= x_39 x_39_1))))
 :qid |stdinbpl.3327:17|
 :skolemid |425|
 :pattern ( (neverTriggered12 x_39) (neverTriggered12 x_39_1))
))) (=> (forall ((x_39@@0 T@U) (x_39_1@@0 T@U) ) (!  (=> (and (= (type x_39@@0) RefType) (= (type x_39_1@@0) RefType)) (=> (and (and (and (and (not (= x_39@@0 x_39_1@@0)) (U_2_bool (MapType2Select res_copy_nodes@2 x_39@@0))) (U_2_bool (MapType2Select res_copy_nodes@2 x_39_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= x_39@@0 x_39_1@@0))))
 :qid |stdinbpl.3327:17|
 :skolemid |425|
 :pattern ( (neverTriggered12 x_39@@0) (neverTriggered12 x_39_1@@0))
)) (=> (= (ControlFlow 0 46) (- 0 45)) (forall ((x_39@@1 T@U) ) (!  (=> (and (= (type x_39@@1) RefType) (U_2_bool (MapType2Select res_copy_nodes@2 x_39@@1))) (>= (U_2_real (MapType1Select QPMask@20 x_39@@1 edges)) FullPerm))
 :qid |stdinbpl.3334:17|
 :skolemid |426|
 :pattern ( (MapType0Select Heap@2 x_39@@1 edges))
 :pattern ( (MapType1Select QPMask@21 x_39@@1 edges))
 :pattern ( (MapType2Select res_copy_nodes@2 x_39@@1))
)))))))))))))
(let ((anon208_Else_correct  (=> (forall ((x_35_1 T@U) (i_5_1 Int) ) (!  (=> (= (type x_35_1) RefType) (=> (and (U_2_bool (MapType2Select setOfRef x_35_1)) (U_2_bool (MapType2Select (edges_domain (MapType0Select Heap@2 x_35_1 edges)) (int_2_U i_5_1)))) (U_2_bool (MapType2Select setOfRef (edge_lookup (MapType0Select Heap@2 x_35_1 edges) i_5_1)))))
 :qid |stdinbpl.3262:20|
 :skolemid |417|
 :pattern ( (MapType2Select setOfRef x_35_1) (MapType2Select (edges_domain (MapType0Select Heap@2 x_35_1 edges)) (int_2_U i_5_1)))
 :pattern ( (MapType2Select setOfRef x_35_1) (edge_lookup (MapType0Select Heap@2 x_35_1 edges) i_5_1))
 :pattern ( (MapType2Select setOfRef x_35_1) (MapType2Select setOfRef (edge_lookup (MapType0Select Heap@2 x_35_1 edges) i_5_1)))
 :pattern ( (edges_domain (MapType0Select Heap@2 x_35_1 edges)) (edge_lookup (MapType0Select Heap@2 x_35_1 edges) i_5_1))
 :pattern ( (edges_domain (MapType0Select Heap@2 x_35_1 edges)) (MapType2Select setOfRef (edge_lookup (MapType0Select Heap@2 x_35_1 edges) i_5_1)))
 :pattern ( (MapType2Select (edges_domain (MapType0Select Heap@2 x_35_1 edges)) (int_2_U i_5_1)))
 :pattern ( (MapType2Select setOfRef (edge_lookup (MapType0Select Heap@2 x_35_1 edges) i_5_1)))
)) (and (=> (= (ControlFlow 0 54) (- 0 55)) (|Set#Equal| res_copy_nodes@2 (|Set#Union| res_copy_nodes@2 node_map_image))) (=> (|Set#Equal| res_copy_nodes@2 (|Set#Union| res_copy_nodes@2 node_map_image)) (and (and (=> (= (ControlFlow 0 54) 46) anon210_Else_correct) (=> (= (ControlFlow 0 54) 51) anon211_Then_correct)) (=> (= (ControlFlow 0 54) 53) anon211_Else_correct)))))))
(let ((anon136_correct true))
(let ((anon209_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select setOfRef x_34)) (U_2_bool (MapType2Select (edges_domain (MapType0Select Heap@2 x_34 edges)) (int_2_U i_4))))) (= (ControlFlow 0 44) 41)) anon136_correct)))
(let ((anon209_Then_correct  (=> (and (U_2_bool (MapType2Select setOfRef x_34)) (U_2_bool (MapType2Select (edges_domain (MapType0Select Heap@2 x_34 edges)) (int_2_U i_4)))) (and (=> (= (ControlFlow 0 42) (- 0 43)) (U_2_bool (MapType2Select setOfRef (edge_lookup (MapType0Select Heap@2 x_34 edges) i_4)))) (=> (U_2_bool (MapType2Select setOfRef (edge_lookup (MapType0Select Heap@2 x_34 edges) i_4))) (=> (= (ControlFlow 0 42) 41) anon136_correct))))))
(let ((anon206_Else_correct  (=> (forall ((x_33_1 T@U) ) (!  (=> (and (= (type x_33_1) RefType) (U_2_bool (MapType2Select setOfRef x_33_1))) (= (MapType0Select Heap@2 x_33_1 edges) (MapType0Select Heap@@9 x_33_1 edges)))
 :qid |stdinbpl.3251:20|
 :skolemid |416|
 :pattern ( (MapType2Select setOfRef x_33_1))
)) (and (and (=> (= (ControlFlow 0 56) 54) anon208_Else_correct) (=> (= (ControlFlow 0 56) 42) anon209_Then_correct)) (=> (= (ControlFlow 0 56) 44) anon209_Else_correct)))))
(let ((anon132_correct true))
(let ((anon207_Else_correct  (=> (and (not (U_2_bool (MapType2Select setOfRef x_32))) (= (ControlFlow 0 40) 37)) anon132_correct)))
(let ((anon207_Then_correct  (=> (U_2_bool (MapType2Select setOfRef x_32)) (and (=> (= (ControlFlow 0 38) (- 0 39)) (= (MapType0Select Heap@2 x_32 edges) (MapType0Select Heap@@9 x_32 edges))) (=> (= (MapType0Select Heap@2 x_32 edges) (MapType0Select Heap@@9 x_32 edges)) (=> (= (ControlFlow 0 38) 37) anon132_correct))))))
(let ((anon204_Else_correct  (=> (forall ((x_30_1 T@U) ) (!  (=> (and (= (type x_30_1) RefType) (U_2_bool (MapType2Select setOfRef x_30_1))) (= (U_2_int (MapType0Select Heap@2 x_30_1 val)) (U_2_int (MapType0Select Heap@@9 x_30_1 val))))
 :qid |stdinbpl.3195:20|
 :skolemid |408|
 :pattern ( (MapType2Select setOfRef x_30_1))
)) (and (=> (= (ControlFlow 0 57) (- 0 60)) (forall ((x_31 T@U) ) (!  (=> (= (type x_31) RefType) (=> (and (U_2_bool (MapType2Select setOfRef x_31)) (dummyFunction (MapType0Select Heap@2 x_31 edges))) (>= rd NoPerm)))
 :qid |stdinbpl.3203:17|
 :skolemid |409|
 :pattern ( (MapType0Select Heap@2 x_31 edges))
 :pattern ( (MapType1Select QPMask@19 x_31 edges))
 :pattern ( (MapType2Select setOfRef x_31))
))) (=> (forall ((x_31@@0 T@U) ) (!  (=> (= (type x_31@@0) RefType) (=> (and (U_2_bool (MapType2Select setOfRef x_31@@0)) (dummyFunction (MapType0Select Heap@2 x_31@@0 edges))) (>= rd NoPerm)))
 :qid |stdinbpl.3203:17|
 :skolemid |409|
 :pattern ( (MapType0Select Heap@2 x_31@@0 edges))
 :pattern ( (MapType1Select QPMask@19 x_31@@0 edges))
 :pattern ( (MapType2Select setOfRef x_31@@0))
)) (and (=> (= (ControlFlow 0 57) (- 0 59)) (forall ((x_31@@1 T@U) (x_31_1 T@U) ) (!  (=> (and (= (type x_31@@1) RefType) (= (type x_31_1) RefType)) (=> (and (and (and (and (not (= x_31@@1 x_31_1)) (U_2_bool (MapType2Select setOfRef x_31@@1))) (U_2_bool (MapType2Select setOfRef x_31_1))) (< NoPerm rd)) (< NoPerm rd)) (not (= x_31@@1 x_31_1))))
 :qid |stdinbpl.3210:17|
 :skolemid |410|
 :pattern ( (neverTriggered10 x_31@@1) (neverTriggered10 x_31_1))
))) (=> (forall ((x_31@@2 T@U) (x_31_1@@0 T@U) ) (!  (=> (and (= (type x_31@@2) RefType) (= (type x_31_1@@0) RefType)) (=> (and (and (and (and (not (= x_31@@2 x_31_1@@0)) (U_2_bool (MapType2Select setOfRef x_31@@2))) (U_2_bool (MapType2Select setOfRef x_31_1@@0))) (< NoPerm rd)) (< NoPerm rd)) (not (= x_31@@2 x_31_1@@0))))
 :qid |stdinbpl.3210:17|
 :skolemid |410|
 :pattern ( (neverTriggered10 x_31@@2) (neverTriggered10 x_31_1@@0))
)) (and (=> (= (ControlFlow 0 57) (- 0 58)) (forall ((x_31@@3 T@U) ) (!  (=> (and (= (type x_31@@3) RefType) (U_2_bool (MapType2Select setOfRef x_31@@3))) (>= (U_2_real (MapType1Select QPMask@18 x_31@@3 edges)) rd))
 :qid |stdinbpl.3217:17|
 :skolemid |411|
 :pattern ( (MapType0Select Heap@2 x_31@@3 edges))
 :pattern ( (MapType1Select QPMask@19 x_31@@3 edges))
 :pattern ( (MapType2Select setOfRef x_31@@3))
))) (=> (forall ((x_31@@4 T@U) ) (!  (=> (and (= (type x_31@@4) RefType) (U_2_bool (MapType2Select setOfRef x_31@@4))) (>= (U_2_real (MapType1Select QPMask@18 x_31@@4 edges)) rd))
 :qid |stdinbpl.3217:17|
 :skolemid |411|
 :pattern ( (MapType0Select Heap@2 x_31@@4 edges))
 :pattern ( (MapType1Select QPMask@19 x_31@@4 edges))
 :pattern ( (MapType2Select setOfRef x_31@@4))
)) (=> (and (and (forall ((x_31@@5 T@U) ) (!  (=> (= (type x_31@@5) RefType) (=> (and (U_2_bool (MapType2Select setOfRef x_31@@5)) (< NoPerm rd)) (and (qpRange10 x_31@@5) (= (invRecv10 x_31@@5) x_31@@5))))
 :qid |stdinbpl.3223:22|
 :skolemid |412|
 :pattern ( (MapType0Select Heap@2 x_31@@5 edges))
 :pattern ( (MapType1Select QPMask@19 x_31@@5 edges))
 :pattern ( (MapType2Select setOfRef x_31@@5))
)) (forall ((o_3@@65 T@U) ) (!  (=> (= (type o_3@@65) RefType) (=> (and (U_2_bool (MapType2Select setOfRef (invRecv10 o_3@@65))) (and (< NoPerm rd) (qpRange10 o_3@@65))) (= (invRecv10 o_3@@65) o_3@@65)))
 :qid |stdinbpl.3227:22|
 :skolemid |413|
 :pattern ( (invRecv10 o_3@@65))
))) (and (forall ((o_3@@66 T@U) ) (!  (=> (= (type o_3@@66) RefType) (and (=> (and (U_2_bool (MapType2Select setOfRef (invRecv10 o_3@@66))) (and (< NoPerm rd) (qpRange10 o_3@@66))) (and (= (invRecv10 o_3@@66) o_3@@66) (= (U_2_real (MapType1Select QPMask@19 o_3@@66 edges)) (- (U_2_real (MapType1Select QPMask@18 o_3@@66 edges)) rd)))) (=> (not (and (U_2_bool (MapType2Select setOfRef (invRecv10 o_3@@66))) (and (< NoPerm rd) (qpRange10 o_3@@66)))) (= (U_2_real (MapType1Select QPMask@19 o_3@@66 edges)) (U_2_real (MapType1Select QPMask@18 o_3@@66 edges))))))
 :qid |stdinbpl.3233:22|
 :skolemid |414|
 :pattern ( (MapType1Select QPMask@19 o_3@@66 edges))
)) (forall ((o_3@@67 T@U) (f_5@@21 T@U) ) (! (let ((B@@33 (FieldTypeInv1 (type f_5@@21))))
(let ((A@@34 (FieldTypeInv0 (type f_5@@21))))
 (=> (and (and (= (type o_3@@67) RefType) (= (type f_5@@21) (FieldType A@@34 B@@33))) (not (= f_5@@21 edges))) (= (U_2_real (MapType1Select QPMask@18 o_3@@67 f_5@@21)) (U_2_real (MapType1Select QPMask@19 o_3@@67 f_5@@21))))))
 :qid |stdinbpl.3239:29|
 :skolemid |415|
 :pattern ( (MapType1Select QPMask@19 o_3@@67 f_5@@21))
)))) (and (and (=> (= (ControlFlow 0 57) 56) anon206_Else_correct) (=> (= (ControlFlow 0 57) 38) anon207_Then_correct)) (=> (= (ControlFlow 0 57) 40) anon207_Else_correct))))))))))))
(let ((anon128_correct true))
(let ((anon205_Else_correct  (=> (and (not (U_2_bool (MapType2Select setOfRef x_29))) (= (ControlFlow 0 36) 33)) anon128_correct)))
(let ((anon205_Then_correct  (=> (U_2_bool (MapType2Select setOfRef x_29)) (and (=> (= (ControlFlow 0 34) (- 0 35)) (= (U_2_int (MapType0Select Heap@2 x_29 val)) (U_2_int (MapType0Select Heap@@9 x_29 val)))) (=> (= (U_2_int (MapType0Select Heap@2 x_29 val)) (U_2_int (MapType0Select Heap@@9 x_29 val))) (=> (= (ControlFlow 0 34) 33) anon128_correct))))))
(let ((anon125_correct  (=> (state Heap@2 Mask@2) (and (=> (= (ControlFlow 0 61) (- 0 67)) (not (= nodeCopy@1 null))) (=> (not (= nodeCopy@1 null)) (and (=> (= (ControlFlow 0 61) (- 0 66)) (U_2_bool (MapType2Select res_copy_nodes@2 nodeCopy@1))) (=> (U_2_bool (MapType2Select res_copy_nodes@2 nodeCopy@1)) (and (=> (= (ControlFlow 0 61) (- 0 65)) (= (|Set#Card| (|Set#Intersection| setOfRef res_copy_nodes@2)) 0)) (=> (= (|Set#Card| (|Set#Intersection| setOfRef res_copy_nodes@2)) 0) (and (=> (= (ControlFlow 0 61) (- 0 64)) (forall ((x_28 T@U) ) (!  (=> (= (type x_28) RefType) (=> (and (U_2_bool (MapType2Select setOfRef x_28)) (dummyFunction (MapType0Select Heap@2 x_28 val))) (>= rd NoPerm)))
 :qid |stdinbpl.3147:17|
 :skolemid |401|
 :pattern ( (MapType0Select Heap@2 x_28 val))
 :pattern ( (MapType1Select QPMask@18 x_28 val))
 :pattern ( (MapType2Select setOfRef x_28))
))) (=> (forall ((x_28@@0 T@U) ) (!  (=> (= (type x_28@@0) RefType) (=> (and (U_2_bool (MapType2Select setOfRef x_28@@0)) (dummyFunction (MapType0Select Heap@2 x_28@@0 val))) (>= rd NoPerm)))
 :qid |stdinbpl.3147:17|
 :skolemid |401|
 :pattern ( (MapType0Select Heap@2 x_28@@0 val))
 :pattern ( (MapType1Select QPMask@18 x_28@@0 val))
 :pattern ( (MapType2Select setOfRef x_28@@0))
)) (and (=> (= (ControlFlow 0 61) (- 0 63)) (forall ((x_28@@1 T@U) (x_28_1 T@U) ) (!  (=> (and (= (type x_28@@1) RefType) (= (type x_28_1) RefType)) (=> (and (and (and (and (not (= x_28@@1 x_28_1)) (U_2_bool (MapType2Select setOfRef x_28@@1))) (U_2_bool (MapType2Select setOfRef x_28_1))) (< NoPerm rd)) (< NoPerm rd)) (not (= x_28@@1 x_28_1))))
 :qid |stdinbpl.3154:17|
 :skolemid |402|
 :pattern ( (neverTriggered9 x_28@@1) (neverTriggered9 x_28_1))
))) (=> (forall ((x_28@@2 T@U) (x_28_1@@0 T@U) ) (!  (=> (and (= (type x_28@@2) RefType) (= (type x_28_1@@0) RefType)) (=> (and (and (and (and (not (= x_28@@2 x_28_1@@0)) (U_2_bool (MapType2Select setOfRef x_28@@2))) (U_2_bool (MapType2Select setOfRef x_28_1@@0))) (< NoPerm rd)) (< NoPerm rd)) (not (= x_28@@2 x_28_1@@0))))
 :qid |stdinbpl.3154:17|
 :skolemid |402|
 :pattern ( (neverTriggered9 x_28@@2) (neverTriggered9 x_28_1@@0))
)) (and (=> (= (ControlFlow 0 61) (- 0 62)) (forall ((x_28@@3 T@U) ) (!  (=> (and (= (type x_28@@3) RefType) (U_2_bool (MapType2Select setOfRef x_28@@3))) (>= (U_2_real (MapType1Select Mask@2 x_28@@3 val)) rd))
 :qid |stdinbpl.3161:17|
 :skolemid |403|
 :pattern ( (MapType0Select Heap@2 x_28@@3 val))
 :pattern ( (MapType1Select QPMask@18 x_28@@3 val))
 :pattern ( (MapType2Select setOfRef x_28@@3))
))) (=> (forall ((x_28@@4 T@U) ) (!  (=> (and (= (type x_28@@4) RefType) (U_2_bool (MapType2Select setOfRef x_28@@4))) (>= (U_2_real (MapType1Select Mask@2 x_28@@4 val)) rd))
 :qid |stdinbpl.3161:17|
 :skolemid |403|
 :pattern ( (MapType0Select Heap@2 x_28@@4 val))
 :pattern ( (MapType1Select QPMask@18 x_28@@4 val))
 :pattern ( (MapType2Select setOfRef x_28@@4))
)) (=> (and (and (forall ((x_28@@5 T@U) ) (!  (=> (= (type x_28@@5) RefType) (=> (and (U_2_bool (MapType2Select setOfRef x_28@@5)) (< NoPerm rd)) (and (qpRange9 x_28@@5) (= (invRecv9 x_28@@5) x_28@@5))))
 :qid |stdinbpl.3167:22|
 :skolemid |404|
 :pattern ( (MapType0Select Heap@2 x_28@@5 val))
 :pattern ( (MapType1Select QPMask@18 x_28@@5 val))
 :pattern ( (MapType2Select setOfRef x_28@@5))
)) (forall ((o_3@@68 T@U) ) (!  (=> (= (type o_3@@68) RefType) (=> (and (U_2_bool (MapType2Select setOfRef (invRecv9 o_3@@68))) (and (< NoPerm rd) (qpRange9 o_3@@68))) (= (invRecv9 o_3@@68) o_3@@68)))
 :qid |stdinbpl.3171:22|
 :skolemid |405|
 :pattern ( (invRecv9 o_3@@68))
))) (and (forall ((o_3@@69 T@U) ) (!  (=> (= (type o_3@@69) RefType) (and (=> (and (U_2_bool (MapType2Select setOfRef (invRecv9 o_3@@69))) (and (< NoPerm rd) (qpRange9 o_3@@69))) (and (= (invRecv9 o_3@@69) o_3@@69) (= (U_2_real (MapType1Select QPMask@18 o_3@@69 val)) (- (U_2_real (MapType1Select Mask@2 o_3@@69 val)) rd)))) (=> (not (and (U_2_bool (MapType2Select setOfRef (invRecv9 o_3@@69))) (and (< NoPerm rd) (qpRange9 o_3@@69)))) (= (U_2_real (MapType1Select QPMask@18 o_3@@69 val)) (U_2_real (MapType1Select Mask@2 o_3@@69 val))))))
 :qid |stdinbpl.3177:22|
 :skolemid |406|
 :pattern ( (MapType1Select QPMask@18 o_3@@69 val))
)) (forall ((o_3@@70 T@U) (f_5@@22 T@U) ) (! (let ((B@@34 (FieldTypeInv1 (type f_5@@22))))
(let ((A@@35 (FieldTypeInv0 (type f_5@@22))))
 (=> (and (and (= (type o_3@@70) RefType) (= (type f_5@@22) (FieldType A@@35 B@@34))) (not (= f_5@@22 val))) (= (U_2_real (MapType1Select Mask@2 o_3@@70 f_5@@22)) (U_2_real (MapType1Select QPMask@18 o_3@@70 f_5@@22))))))
 :qid |stdinbpl.3183:29|
 :skolemid |407|
 :pattern ( (MapType1Select QPMask@18 o_3@@70 f_5@@22))
)))) (and (and (=> (= (ControlFlow 0 61) 57) anon204_Else_correct) (=> (= (ControlFlow 0 61) 34) anon205_Then_correct)) (=> (= (ControlFlow 0 61) 36) anon205_Else_correct))))))))))))))))))
(let ((anon189_Else_correct  (=> (and (and (not (> (|Set#Card| S@1) 0)) (state ExhaleHeap@0 QPMask@7)) (and (U_2_bool (MapType2Select res_copy_nodes@1 freshObj@0)) (U_2_bool (MapType2Select setOfRef this)))) (and (=> (= (ControlFlow 0 69) (- 0 75)) (forall ((x_80 T@U) (x_80_1 T@U) ) (!  (=> (and (= (type x_80) RefType) (= (type x_80_1) RefType)) (=> (and (and (and (and (not (= x_80 x_80_1)) (U_2_bool (MapType2Select setOfRef x_80))) (U_2_bool (MapType2Select setOfRef x_80_1))) (< NoPerm rd)) (< NoPerm rd)) (not (= x_80 x_80_1))))
 :qid |stdinbpl.2961:21|
 :skolemid |370|
 :no-pattern (type x_80)
 :no-pattern (type x_80_1)
 :no-pattern (U_2_int x_80)
 :no-pattern (U_2_bool x_80)
 :no-pattern (U_2_int x_80_1)
 :no-pattern (U_2_bool x_80_1)
))) (=> (forall ((x_80@@0 T@U) (x_80_1@@0 T@U) ) (!  (=> (and (= (type x_80@@0) RefType) (= (type x_80_1@@0) RefType)) (=> (and (and (and (and (not (= x_80@@0 x_80_1@@0)) (U_2_bool (MapType2Select setOfRef x_80@@0))) (U_2_bool (MapType2Select setOfRef x_80_1@@0))) (< NoPerm rd)) (< NoPerm rd)) (not (= x_80@@0 x_80_1@@0))))
 :qid |stdinbpl.2961:21|
 :skolemid |370|
 :no-pattern (type x_80@@0)
 :no-pattern (type x_80_1@@0)
 :no-pattern (U_2_int x_80@@0)
 :no-pattern (U_2_bool x_80@@0)
 :no-pattern (U_2_int x_80_1@@0)
 :no-pattern (U_2_bool x_80_1@@0)
)) (=> (and (forall ((x_80@@1 T@U) ) (!  (=> (= (type x_80@@1) RefType) (=> (and (U_2_bool (MapType2Select setOfRef x_80@@1)) (< NoPerm rd)) (and (qpRange37 x_80@@1) (= (invRecv37 x_80@@1) x_80@@1))))
 :qid |stdinbpl.2967:28|
 :skolemid |371|
 :pattern ( (MapType0Select ExhaleHeap@0 x_80@@1 val))
 :pattern ( (MapType1Select QPMask@14 x_80@@1 val))
 :pattern ( (MapType2Select setOfRef x_80@@1))
)) (forall ((o_3@@71 T@U) ) (!  (=> (= (type o_3@@71) RefType) (=> (and (and (U_2_bool (MapType2Select setOfRef (invRecv37 o_3@@71))) (< NoPerm rd)) (qpRange37 o_3@@71)) (= (invRecv37 o_3@@71) o_3@@71)))
 :qid |stdinbpl.2971:28|
 :skolemid |372|
 :pattern ( (invRecv37 o_3@@71))
))) (and (=> (= (ControlFlow 0 69) (- 0 74)) (forall ((x_80@@2 T@U) ) (!  (=> (and (= (type x_80@@2) RefType) (U_2_bool (MapType2Select setOfRef x_80@@2))) (>= rd NoPerm))
 :qid |stdinbpl.2977:21|
 :skolemid |373|
 :pattern ( (MapType0Select ExhaleHeap@0 x_80@@2 val))
 :pattern ( (MapType1Select QPMask@14 x_80@@2 val))
 :pattern ( (MapType2Select setOfRef x_80@@2))
))) (=> (forall ((x_80@@3 T@U) ) (!  (=> (and (= (type x_80@@3) RefType) (U_2_bool (MapType2Select setOfRef x_80@@3))) (>= rd NoPerm))
 :qid |stdinbpl.2977:21|
 :skolemid |373|
 :pattern ( (MapType0Select ExhaleHeap@0 x_80@@3 val))
 :pattern ( (MapType1Select QPMask@14 x_80@@3 val))
 :pattern ( (MapType2Select setOfRef x_80@@3))
)) (=> (forall ((x_80@@4 T@U) ) (!  (=> (= (type x_80@@4) RefType) (=> (and (U_2_bool (MapType2Select setOfRef x_80@@4)) (> rd NoPerm)) (not (= x_80@@4 null))))
 :qid |stdinbpl.2983:28|
 :skolemid |374|
 :pattern ( (MapType0Select ExhaleHeap@0 x_80@@4 val))
 :pattern ( (MapType1Select QPMask@14 x_80@@4 val))
 :pattern ( (MapType2Select setOfRef x_80@@4))
)) (=> (and (and (forall ((o_3@@72 T@U) ) (!  (=> (= (type o_3@@72) RefType) (and (=> (and (and (U_2_bool (MapType2Select setOfRef (invRecv37 o_3@@72))) (< NoPerm rd)) (qpRange37 o_3@@72)) (and (=> (< NoPerm rd) (= (invRecv37 o_3@@72) o_3@@72)) (= (U_2_real (MapType1Select QPMask@14 o_3@@72 val)) (+ (U_2_real (MapType1Select QPMask@7 o_3@@72 val)) rd)))) (=> (not (and (and (U_2_bool (MapType2Select setOfRef (invRecv37 o_3@@72))) (< NoPerm rd)) (qpRange37 o_3@@72))) (= (U_2_real (MapType1Select QPMask@14 o_3@@72 val)) (U_2_real (MapType1Select QPMask@7 o_3@@72 val))))))
 :qid |stdinbpl.2989:28|
 :skolemid |375|
 :pattern ( (MapType1Select QPMask@14 o_3@@72 val))
)) (forall ((o_3@@73 T@U) (f_5@@23 T@U) ) (! (let ((B@@35 (FieldTypeInv1 (type f_5@@23))))
(let ((A@@36 (FieldTypeInv0 (type f_5@@23))))
 (=> (and (and (= (type o_3@@73) RefType) (= (type f_5@@23) (FieldType A@@36 B@@35))) (not (= f_5@@23 val))) (= (U_2_real (MapType1Select QPMask@7 o_3@@73 f_5@@23)) (U_2_real (MapType1Select QPMask@14 o_3@@73 f_5@@23))))))
 :qid |stdinbpl.2993:35|
 :skolemid |376|
 :pattern ( (MapType1Select QPMask@7 o_3@@73 f_5@@23))
 :pattern ( (MapType1Select QPMask@14 o_3@@73 f_5@@23))
))) (and (state ExhaleHeap@0 QPMask@14) (forall ((x_81 T@U) ) (!  (=> (and (= (type x_81) RefType) (U_2_bool (MapType2Select setOfRef x_81))) (= (U_2_int (MapType0Select ExhaleHeap@0 x_81 val)) (U_2_int (MapType0Select Heap@@9 x_81 val))))
 :qid |stdinbpl.2999:26|
 :skolemid |377|
 :pattern ( (MapType2Select setOfRef x_81))
)))) (and (=> (= (ControlFlow 0 69) (- 0 73)) (forall ((x_82 T@U) (x_82_1 T@U) ) (!  (=> (and (= (type x_82) RefType) (= (type x_82_1) RefType)) (=> (and (and (and (and (not (= x_82 x_82_1)) (U_2_bool (MapType2Select setOfRef x_82))) (U_2_bool (MapType2Select setOfRef x_82_1))) (< NoPerm rd)) (< NoPerm rd)) (not (= x_82 x_82_1))))
 :qid |stdinbpl.3005:21|
 :skolemid |378|
 :no-pattern (type x_82)
 :no-pattern (type x_82_1)
 :no-pattern (U_2_int x_82)
 :no-pattern (U_2_bool x_82)
 :no-pattern (U_2_int x_82_1)
 :no-pattern (U_2_bool x_82_1)
))) (=> (forall ((x_82@@0 T@U) (x_82_1@@0 T@U) ) (!  (=> (and (= (type x_82@@0) RefType) (= (type x_82_1@@0) RefType)) (=> (and (and (and (and (not (= x_82@@0 x_82_1@@0)) (U_2_bool (MapType2Select setOfRef x_82@@0))) (U_2_bool (MapType2Select setOfRef x_82_1@@0))) (< NoPerm rd)) (< NoPerm rd)) (not (= x_82@@0 x_82_1@@0))))
 :qid |stdinbpl.3005:21|
 :skolemid |378|
 :no-pattern (type x_82@@0)
 :no-pattern (type x_82_1@@0)
 :no-pattern (U_2_int x_82@@0)
 :no-pattern (U_2_bool x_82@@0)
 :no-pattern (U_2_int x_82_1@@0)
 :no-pattern (U_2_bool x_82_1@@0)
)) (=> (and (forall ((x_82@@1 T@U) ) (!  (=> (= (type x_82@@1) RefType) (=> (and (U_2_bool (MapType2Select setOfRef x_82@@1)) (< NoPerm rd)) (and (qpRange38 x_82@@1) (= (invRecv38 x_82@@1) x_82@@1))))
 :qid |stdinbpl.3011:28|
 :skolemid |379|
 :pattern ( (MapType0Select ExhaleHeap@0 x_82@@1 edges))
 :pattern ( (MapType1Select QPMask@15 x_82@@1 edges))
 :pattern ( (MapType2Select setOfRef x_82@@1))
)) (forall ((o_3@@74 T@U) ) (!  (=> (= (type o_3@@74) RefType) (=> (and (and (U_2_bool (MapType2Select setOfRef (invRecv38 o_3@@74))) (< NoPerm rd)) (qpRange38 o_3@@74)) (= (invRecv38 o_3@@74) o_3@@74)))
 :qid |stdinbpl.3015:28|
 :skolemid |380|
 :pattern ( (invRecv38 o_3@@74))
))) (and (=> (= (ControlFlow 0 69) (- 0 72)) (forall ((x_82@@2 T@U) ) (!  (=> (and (= (type x_82@@2) RefType) (U_2_bool (MapType2Select setOfRef x_82@@2))) (>= rd NoPerm))
 :qid |stdinbpl.3021:21|
 :skolemid |381|
 :pattern ( (MapType0Select ExhaleHeap@0 x_82@@2 edges))
 :pattern ( (MapType1Select QPMask@15 x_82@@2 edges))
 :pattern ( (MapType2Select setOfRef x_82@@2))
))) (=> (forall ((x_82@@3 T@U) ) (!  (=> (and (= (type x_82@@3) RefType) (U_2_bool (MapType2Select setOfRef x_82@@3))) (>= rd NoPerm))
 :qid |stdinbpl.3021:21|
 :skolemid |381|
 :pattern ( (MapType0Select ExhaleHeap@0 x_82@@3 edges))
 :pattern ( (MapType1Select QPMask@15 x_82@@3 edges))
 :pattern ( (MapType2Select setOfRef x_82@@3))
)) (=> (and (forall ((x_82@@4 T@U) ) (!  (=> (= (type x_82@@4) RefType) (=> (and (U_2_bool (MapType2Select setOfRef x_82@@4)) (> rd NoPerm)) (not (= x_82@@4 null))))
 :qid |stdinbpl.3027:28|
 :skolemid |382|
 :pattern ( (MapType0Select ExhaleHeap@0 x_82@@4 edges))
 :pattern ( (MapType1Select QPMask@15 x_82@@4 edges))
 :pattern ( (MapType2Select setOfRef x_82@@4))
)) (forall ((o_3@@75 T@U) ) (!  (=> (= (type o_3@@75) RefType) (and (=> (and (and (U_2_bool (MapType2Select setOfRef (invRecv38 o_3@@75))) (< NoPerm rd)) (qpRange38 o_3@@75)) (and (=> (< NoPerm rd) (= (invRecv38 o_3@@75) o_3@@75)) (= (U_2_real (MapType1Select QPMask@15 o_3@@75 edges)) (+ (U_2_real (MapType1Select QPMask@14 o_3@@75 edges)) rd)))) (=> (not (and (and (U_2_bool (MapType2Select setOfRef (invRecv38 o_3@@75))) (< NoPerm rd)) (qpRange38 o_3@@75))) (= (U_2_real (MapType1Select QPMask@15 o_3@@75 edges)) (U_2_real (MapType1Select QPMask@14 o_3@@75 edges))))))
 :qid |stdinbpl.3033:28|
 :skolemid |383|
 :pattern ( (MapType1Select QPMask@15 o_3@@75 edges))
))) (=> (and (and (and (forall ((o_3@@76 T@U) (f_5@@24 T@U) ) (! (let ((B@@36 (FieldTypeInv1 (type f_5@@24))))
(let ((A@@37 (FieldTypeInv0 (type f_5@@24))))
 (=> (and (and (= (type o_3@@76) RefType) (= (type f_5@@24) (FieldType A@@37 B@@36))) (not (= f_5@@24 edges))) (= (U_2_real (MapType1Select QPMask@14 o_3@@76 f_5@@24)) (U_2_real (MapType1Select QPMask@15 o_3@@76 f_5@@24))))))
 :qid |stdinbpl.3037:35|
 :skolemid |384|
 :pattern ( (MapType1Select QPMask@14 o_3@@76 f_5@@24))
 :pattern ( (MapType1Select QPMask@15 o_3@@76 f_5@@24))
)) (state ExhaleHeap@0 QPMask@15)) (and (forall ((x_83 T@U) ) (!  (=> (and (= (type x_83) RefType) (U_2_bool (MapType2Select setOfRef x_83))) (= (MapType0Select ExhaleHeap@0 x_83 edges) (MapType0Select Heap@@9 x_83 edges)))
 :qid |stdinbpl.3043:26|
 :skolemid |385|
 :pattern ( (MapType2Select setOfRef x_83))
)) (forall ((j_14 Int) ) (!  (=> (U_2_bool (MapType2Select S@1 (int_2_U j_14))) (U_2_bool (MapType2Select setOfRef (edge_lookup (MapType0Select ExhaleHeap@0 this edges) j_14))))
 :qid |stdinbpl.3047:26|
 :skolemid |386|
 :pattern ( (MapType2Select S@1 (int_2_U j_14)))
 :pattern ( (MapType2Select setOfRef (edge_lookup (MapType0Select ExhaleHeap@0 this edges) j_14)))
)))) (and (and (forall ((r_24 T@U) (j_15 Int) ) (!  (=> (= (type r_24) RefType) (=> (and (U_2_bool (MapType2Select setOfRef r_24)) (U_2_bool (MapType2Select (edges_domain (MapType0Select ExhaleHeap@0 r_24 edges)) (int_2_U j_15)))) (U_2_bool (MapType2Select setOfRef (edge_lookup (MapType0Select ExhaleHeap@0 r_24 edges) j_15)))))
 :qid |stdinbpl.3051:26|
 :skolemid |387|
 :pattern ( (MapType2Select setOfRef r_24) (MapType2Select (edges_domain (MapType0Select ExhaleHeap@0 r_24 edges)) (int_2_U j_15)))
 :pattern ( (MapType2Select setOfRef r_24) (edge_lookup (MapType0Select ExhaleHeap@0 r_24 edges) j_15))
 :pattern ( (MapType2Select setOfRef r_24) (MapType2Select setOfRef (edge_lookup (MapType0Select ExhaleHeap@0 r_24 edges) j_15)))
 :pattern ( (edges_domain (MapType0Select ExhaleHeap@0 r_24 edges)) (edge_lookup (MapType0Select ExhaleHeap@0 r_24 edges) j_15))
 :pattern ( (edges_domain (MapType0Select ExhaleHeap@0 r_24 edges)) (MapType2Select setOfRef (edge_lookup (MapType0Select ExhaleHeap@0 r_24 edges) j_15)))
 :pattern ( (MapType2Select (edges_domain (MapType0Select ExhaleHeap@0 r_24 edges)) (int_2_U j_15)))
 :pattern ( (MapType2Select setOfRef (edge_lookup (MapType0Select ExhaleHeap@0 r_24 edges) j_15)))
)) (|Set#Subset| node_map_image res_copy_nodes@1)) (and (= (|Set#Card| (|Set#Intersection| setOfRef res_copy_nodes@1)) 0) (forall ((r_25 T@U) ) (!  (=> (and (= (type r_25) RefType) (|Seq#Contains| (map_domain res_node_map@1) r_25)) (U_2_bool (MapType2Select res_copy_nodes@1 (lookup res_node_map@1 r_25))))
 :qid |stdinbpl.3057:26|
 :skolemid |388|
 :pattern ( (|Seq#ContainsTrigger| (map_domain res_node_map@1) r_25))
 :pattern ( (|Seq#Contains| (map_domain res_node_map@1) r_25))
 :pattern ( (MapType2Select res_copy_nodes@1 (lookup res_node_map@1 r_25)))
))))) (and (=> (= (ControlFlow 0 69) (- 0 71)) (forall ((r_26 T@U) (r_26_1 T@U) ) (!  (=> (and (= (type r_26) RefType) (= (type r_26_1) RefType)) (=> (and (and (and (and (not (= r_26 r_26_1)) (U_2_bool (MapType2Select res_copy_nodes@1 r_26))) (U_2_bool (MapType2Select res_copy_nodes@1 r_26_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= r_26 r_26_1))))
 :qid |stdinbpl.3063:21|
 :skolemid |389|
 :no-pattern (type r_26)
 :no-pattern (type r_26_1)
 :no-pattern (U_2_int r_26)
 :no-pattern (U_2_bool r_26)
 :no-pattern (U_2_int r_26_1)
 :no-pattern (U_2_bool r_26_1)
))) (=> (forall ((r_26@@0 T@U) (r_26_1@@0 T@U) ) (!  (=> (and (= (type r_26@@0) RefType) (= (type r_26_1@@0) RefType)) (=> (and (and (and (and (not (= r_26@@0 r_26_1@@0)) (U_2_bool (MapType2Select res_copy_nodes@1 r_26@@0))) (U_2_bool (MapType2Select res_copy_nodes@1 r_26_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= r_26@@0 r_26_1@@0))))
 :qid |stdinbpl.3063:21|
 :skolemid |389|
 :no-pattern (type r_26@@0)
 :no-pattern (type r_26_1@@0)
 :no-pattern (U_2_int r_26@@0)
 :no-pattern (U_2_bool r_26@@0)
 :no-pattern (U_2_int r_26_1@@0)
 :no-pattern (U_2_bool r_26_1@@0)
)) (=> (and (forall ((r_26@@1 T@U) ) (!  (=> (= (type r_26@@1) RefType) (=> (and (U_2_bool (MapType2Select res_copy_nodes@1 r_26@@1)) (< NoPerm FullPerm)) (and (qpRange39 r_26@@1) (= (invRecv39 r_26@@1) r_26@@1))))
 :qid |stdinbpl.3069:28|
 :skolemid |390|
 :pattern ( (MapType0Select ExhaleHeap@0 r_26@@1 val))
 :pattern ( (MapType1Select QPMask@16 r_26@@1 val))
 :pattern ( (MapType2Select res_copy_nodes@1 r_26@@1))
)) (forall ((o_3@@77 T@U) ) (!  (=> (= (type o_3@@77) RefType) (=> (and (and (U_2_bool (MapType2Select res_copy_nodes@1 (invRecv39 o_3@@77))) (< NoPerm FullPerm)) (qpRange39 o_3@@77)) (= (invRecv39 o_3@@77) o_3@@77)))
 :qid |stdinbpl.3073:28|
 :skolemid |391|
 :pattern ( (invRecv39 o_3@@77))
))) (=> (and (and (forall ((r_26@@2 T@U) ) (!  (=> (and (= (type r_26@@2) RefType) (U_2_bool (MapType2Select res_copy_nodes@1 r_26@@2))) (not (= r_26@@2 null)))
 :qid |stdinbpl.3079:28|
 :skolemid |392|
 :pattern ( (MapType0Select ExhaleHeap@0 r_26@@2 val))
 :pattern ( (MapType1Select QPMask@16 r_26@@2 val))
 :pattern ( (MapType2Select res_copy_nodes@1 r_26@@2))
)) (forall ((o_3@@78 T@U) ) (!  (=> (= (type o_3@@78) RefType) (and (=> (and (and (U_2_bool (MapType2Select res_copy_nodes@1 (invRecv39 o_3@@78))) (< NoPerm FullPerm)) (qpRange39 o_3@@78)) (and (=> (< NoPerm FullPerm) (= (invRecv39 o_3@@78) o_3@@78)) (= (U_2_real (MapType1Select QPMask@16 o_3@@78 val)) (+ (U_2_real (MapType1Select QPMask@15 o_3@@78 val)) FullPerm)))) (=> (not (and (and (U_2_bool (MapType2Select res_copy_nodes@1 (invRecv39 o_3@@78))) (< NoPerm FullPerm)) (qpRange39 o_3@@78))) (= (U_2_real (MapType1Select QPMask@16 o_3@@78 val)) (U_2_real (MapType1Select QPMask@15 o_3@@78 val))))))
 :qid |stdinbpl.3085:28|
 :skolemid |393|
 :pattern ( (MapType1Select QPMask@16 o_3@@78 val))
))) (and (forall ((o_3@@79 T@U) (f_5@@25 T@U) ) (! (let ((B@@37 (FieldTypeInv1 (type f_5@@25))))
(let ((A@@38 (FieldTypeInv0 (type f_5@@25))))
 (=> (and (and (= (type o_3@@79) RefType) (= (type f_5@@25) (FieldType A@@38 B@@37))) (not (= f_5@@25 val))) (= (U_2_real (MapType1Select QPMask@15 o_3@@79 f_5@@25)) (U_2_real (MapType1Select QPMask@16 o_3@@79 f_5@@25))))))
 :qid |stdinbpl.3089:35|
 :skolemid |394|
 :pattern ( (MapType1Select QPMask@15 o_3@@79 f_5@@25))
 :pattern ( (MapType1Select QPMask@16 o_3@@79 f_5@@25))
)) (state ExhaleHeap@0 QPMask@16))) (and (=> (= (ControlFlow 0 69) (- 0 70)) (forall ((r_27 T@U) (r_27_1 T@U) ) (!  (=> (and (= (type r_27) RefType) (= (type r_27_1) RefType)) (=> (and (and (and (and (not (= r_27 r_27_1)) (U_2_bool (MapType2Select res_copy_nodes@1 r_27))) (U_2_bool (MapType2Select res_copy_nodes@1 r_27_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= r_27 r_27_1))))
 :qid |stdinbpl.3097:21|
 :skolemid |395|
 :no-pattern (type r_27)
 :no-pattern (type r_27_1)
 :no-pattern (U_2_int r_27)
 :no-pattern (U_2_bool r_27)
 :no-pattern (U_2_int r_27_1)
 :no-pattern (U_2_bool r_27_1)
))) (=> (forall ((r_27@@0 T@U) (r_27_1@@0 T@U) ) (!  (=> (and (= (type r_27@@0) RefType) (= (type r_27_1@@0) RefType)) (=> (and (and (and (and (not (= r_27@@0 r_27_1@@0)) (U_2_bool (MapType2Select res_copy_nodes@1 r_27@@0))) (U_2_bool (MapType2Select res_copy_nodes@1 r_27_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= r_27@@0 r_27_1@@0))))
 :qid |stdinbpl.3097:21|
 :skolemid |395|
 :no-pattern (type r_27@@0)
 :no-pattern (type r_27_1@@0)
 :no-pattern (U_2_int r_27@@0)
 :no-pattern (U_2_bool r_27@@0)
 :no-pattern (U_2_int r_27_1@@0)
 :no-pattern (U_2_bool r_27_1@@0)
)) (=> (and (forall ((r_27@@1 T@U) ) (!  (=> (= (type r_27@@1) RefType) (=> (and (U_2_bool (MapType2Select res_copy_nodes@1 r_27@@1)) (< NoPerm FullPerm)) (and (qpRange40 r_27@@1) (= (invRecv40 r_27@@1) r_27@@1))))
 :qid |stdinbpl.3103:28|
 :skolemid |396|
 :pattern ( (MapType0Select ExhaleHeap@0 r_27@@1 edges))
 :pattern ( (MapType1Select QPMask@17 r_27@@1 edges))
 :pattern ( (MapType2Select res_copy_nodes@1 r_27@@1))
)) (forall ((o_3@@80 T@U) ) (!  (=> (= (type o_3@@80) RefType) (=> (and (and (U_2_bool (MapType2Select res_copy_nodes@1 (invRecv40 o_3@@80))) (< NoPerm FullPerm)) (qpRange40 o_3@@80)) (= (invRecv40 o_3@@80) o_3@@80)))
 :qid |stdinbpl.3107:28|
 :skolemid |397|
 :pattern ( (invRecv40 o_3@@80))
))) (=> (and (and (forall ((r_27@@2 T@U) ) (!  (=> (and (= (type r_27@@2) RefType) (U_2_bool (MapType2Select res_copy_nodes@1 r_27@@2))) (not (= r_27@@2 null)))
 :qid |stdinbpl.3113:28|
 :skolemid |398|
 :pattern ( (MapType0Select ExhaleHeap@0 r_27@@2 edges))
 :pattern ( (MapType1Select QPMask@17 r_27@@2 edges))
 :pattern ( (MapType2Select res_copy_nodes@1 r_27@@2))
)) (forall ((o_3@@81 T@U) ) (!  (=> (= (type o_3@@81) RefType) (and (=> (and (and (U_2_bool (MapType2Select res_copy_nodes@1 (invRecv40 o_3@@81))) (< NoPerm FullPerm)) (qpRange40 o_3@@81)) (and (=> (< NoPerm FullPerm) (= (invRecv40 o_3@@81) o_3@@81)) (= (U_2_real (MapType1Select QPMask@17 o_3@@81 edges)) (+ (U_2_real (MapType1Select QPMask@16 o_3@@81 edges)) FullPerm)))) (=> (not (and (and (U_2_bool (MapType2Select res_copy_nodes@1 (invRecv40 o_3@@81))) (< NoPerm FullPerm)) (qpRange40 o_3@@81))) (= (U_2_real (MapType1Select QPMask@17 o_3@@81 edges)) (U_2_real (MapType1Select QPMask@16 o_3@@81 edges))))))
 :qid |stdinbpl.3119:28|
 :skolemid |399|
 :pattern ( (MapType1Select QPMask@17 o_3@@81 edges))
))) (and (forall ((o_3@@82 T@U) (f_5@@26 T@U) ) (! (let ((B@@38 (FieldTypeInv1 (type f_5@@26))))
(let ((A@@39 (FieldTypeInv0 (type f_5@@26))))
 (=> (and (and (= (type o_3@@82) RefType) (= (type f_5@@26) (FieldType A@@39 B@@38))) (not (= f_5@@26 edges))) (= (U_2_real (MapType1Select QPMask@16 o_3@@82 f_5@@26)) (U_2_real (MapType1Select QPMask@17 o_3@@82 f_5@@26))))))
 :qid |stdinbpl.3123:35|
 :skolemid |400|
 :pattern ( (MapType1Select QPMask@16 o_3@@82 f_5@@26))
 :pattern ( (MapType1Select QPMask@17 o_3@@82 f_5@@26))
)) (state ExhaleHeap@0 QPMask@17))) (=> (and (and (and (state ExhaleHeap@0 QPMask@17) (state ExhaleHeap@0 QPMask@17)) (and (= Heap@2 ExhaleHeap@0) (= Mask@2 QPMask@17))) (and (and (= nodeCopy@1 freshObj@0) (= res_node_map@2 res_node_map@1)) (and (= res_copy_nodes@2 res_copy_nodes@1) (= (ControlFlow 0 69) 61)))) anon125_correct))))))))))))))))))))))))))
(let ((anon172_Else_correct  (=> (forall ((r_3_1 T@U) ) (!  (=> (and (= (type r_3_1) RefType) (|Seq#Contains| (map_domain res_node_map@0) r_3_1)) (U_2_bool (MapType2Select res_copy_nodes@0 (lookup res_node_map@0 r_3_1))))
 :qid |stdinbpl.1733:28|
 :skolemid |206|
 :pattern ( (|Seq#ContainsTrigger| (map_domain res_node_map@0) r_3_1))
 :pattern ( (|Seq#Contains| (map_domain res_node_map@0) r_3_1))
 :pattern ( (MapType2Select res_copy_nodes@0 (lookup res_node_map@0 r_3_1)))
)) (and (=> (= (ControlFlow 0 198) (- 0 202)) (forall ((r_4 T@U) (r_4_1 T@U) ) (!  (=> (and (= (type r_4) RefType) (= (type r_4_1) RefType)) (=> (and (and (and (and (not (= r_4 r_4_1)) (U_2_bool (MapType2Select res_copy_nodes@0 r_4))) (U_2_bool (MapType2Select res_copy_nodes@0 r_4_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= r_4 r_4_1))))
 :qid |stdinbpl.1744:25|
 :skolemid |207|
 :pattern ( (neverTriggered15 r_4) (neverTriggered15 r_4_1))
))) (=> (forall ((r_4@@0 T@U) (r_4_1@@0 T@U) ) (!  (=> (and (= (type r_4@@0) RefType) (= (type r_4_1@@0) RefType)) (=> (and (and (and (and (not (= r_4@@0 r_4_1@@0)) (U_2_bool (MapType2Select res_copy_nodes@0 r_4@@0))) (U_2_bool (MapType2Select res_copy_nodes@0 r_4_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= r_4@@0 r_4_1@@0))))
 :qid |stdinbpl.1744:25|
 :skolemid |207|
 :pattern ( (neverTriggered15 r_4@@0) (neverTriggered15 r_4_1@@0))
)) (and (=> (= (ControlFlow 0 198) (- 0 201)) (forall ((r_4@@1 T@U) ) (!  (=> (and (= (type r_4@@1) RefType) (U_2_bool (MapType2Select res_copy_nodes@0 r_4@@1))) (>= (U_2_real (MapType1Select QPMask@5 r_4@@1 val)) FullPerm))
 :qid |stdinbpl.1751:25|
 :skolemid |208|
 :pattern ( (MapType0Select Heap@1 r_4@@1 val))
 :pattern ( (MapType1Select QPMask@6 r_4@@1 val))
 :pattern ( (MapType2Select res_copy_nodes@0 r_4@@1))
))) (=> (forall ((r_4@@2 T@U) ) (!  (=> (and (= (type r_4@@2) RefType) (U_2_bool (MapType2Select res_copy_nodes@0 r_4@@2))) (>= (U_2_real (MapType1Select QPMask@5 r_4@@2 val)) FullPerm))
 :qid |stdinbpl.1751:25|
 :skolemid |208|
 :pattern ( (MapType0Select Heap@1 r_4@@2 val))
 :pattern ( (MapType1Select QPMask@6 r_4@@2 val))
 :pattern ( (MapType2Select res_copy_nodes@0 r_4@@2))
)) (=> (and (and (forall ((r_4@@3 T@U) ) (!  (=> (= (type r_4@@3) RefType) (=> (and (U_2_bool (MapType2Select res_copy_nodes@0 r_4@@3)) (< NoPerm FullPerm)) (and (qpRange15 r_4@@3) (= (invRecv15 r_4@@3) r_4@@3))))
 :qid |stdinbpl.1757:30|
 :skolemid |209|
 :pattern ( (MapType0Select Heap@1 r_4@@3 val))
 :pattern ( (MapType1Select QPMask@6 r_4@@3 val))
 :pattern ( (MapType2Select res_copy_nodes@0 r_4@@3))
)) (forall ((o_3@@83 T@U) ) (!  (=> (= (type o_3@@83) RefType) (=> (and (U_2_bool (MapType2Select res_copy_nodes@0 (invRecv15 o_3@@83))) (and (< NoPerm FullPerm) (qpRange15 o_3@@83))) (= (invRecv15 o_3@@83) o_3@@83)))
 :qid |stdinbpl.1761:30|
 :skolemid |210|
 :pattern ( (invRecv15 o_3@@83))
))) (and (forall ((o_3@@84 T@U) ) (!  (=> (= (type o_3@@84) RefType) (and (=> (and (U_2_bool (MapType2Select res_copy_nodes@0 (invRecv15 o_3@@84))) (and (< NoPerm FullPerm) (qpRange15 o_3@@84))) (and (= (invRecv15 o_3@@84) o_3@@84) (= (U_2_real (MapType1Select QPMask@6 o_3@@84 val)) (- (U_2_real (MapType1Select QPMask@5 o_3@@84 val)) FullPerm)))) (=> (not (and (U_2_bool (MapType2Select res_copy_nodes@0 (invRecv15 o_3@@84))) (and (< NoPerm FullPerm) (qpRange15 o_3@@84)))) (= (U_2_real (MapType1Select QPMask@6 o_3@@84 val)) (U_2_real (MapType1Select QPMask@5 o_3@@84 val))))))
 :qid |stdinbpl.1767:30|
 :skolemid |211|
 :pattern ( (MapType1Select QPMask@6 o_3@@84 val))
)) (forall ((o_3@@85 T@U) (f_5@@27 T@U) ) (! (let ((B@@39 (FieldTypeInv1 (type f_5@@27))))
(let ((A@@40 (FieldTypeInv0 (type f_5@@27))))
 (=> (and (and (= (type o_3@@85) RefType) (= (type f_5@@27) (FieldType A@@40 B@@39))) (not (= f_5@@27 val))) (= (U_2_real (MapType1Select QPMask@5 o_3@@85 f_5@@27)) (U_2_real (MapType1Select QPMask@6 o_3@@85 f_5@@27))))))
 :qid |stdinbpl.1773:37|
 :skolemid |212|
 :pattern ( (MapType1Select QPMask@6 o_3@@85 f_5@@27))
)))) (and (=> (= (ControlFlow 0 198) (- 0 200)) (forall ((r_5 T@U) (r_5_1 T@U) ) (!  (=> (and (= (type r_5) RefType) (= (type r_5_1) RefType)) (=> (and (and (and (and (not (= r_5 r_5_1)) (U_2_bool (MapType2Select res_copy_nodes@0 r_5))) (U_2_bool (MapType2Select res_copy_nodes@0 r_5_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= r_5 r_5_1))))
 :qid |stdinbpl.1785:25|
 :skolemid |213|
 :pattern ( (neverTriggered16 r_5) (neverTriggered16 r_5_1))
))) (=> (forall ((r_5@@0 T@U) (r_5_1@@0 T@U) ) (!  (=> (and (= (type r_5@@0) RefType) (= (type r_5_1@@0) RefType)) (=> (and (and (and (and (not (= r_5@@0 r_5_1@@0)) (U_2_bool (MapType2Select res_copy_nodes@0 r_5@@0))) (U_2_bool (MapType2Select res_copy_nodes@0 r_5_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= r_5@@0 r_5_1@@0))))
 :qid |stdinbpl.1785:25|
 :skolemid |213|
 :pattern ( (neverTriggered16 r_5@@0) (neverTriggered16 r_5_1@@0))
)) (and (=> (= (ControlFlow 0 198) (- 0 199)) (forall ((r_5@@1 T@U) ) (!  (=> (and (= (type r_5@@1) RefType) (U_2_bool (MapType2Select res_copy_nodes@0 r_5@@1))) (>= (U_2_real (MapType1Select QPMask@6 r_5@@1 edges)) FullPerm))
 :qid |stdinbpl.1792:25|
 :skolemid |214|
 :pattern ( (MapType0Select Heap@1 r_5@@1 edges))
 :pattern ( (MapType1Select QPMask@7 r_5@@1 edges))
 :pattern ( (MapType2Select res_copy_nodes@0 r_5@@1))
))) (=> (forall ((r_5@@2 T@U) ) (!  (=> (and (= (type r_5@@2) RefType) (U_2_bool (MapType2Select res_copy_nodes@0 r_5@@2))) (>= (U_2_real (MapType1Select QPMask@6 r_5@@2 edges)) FullPerm))
 :qid |stdinbpl.1792:25|
 :skolemid |214|
 :pattern ( (MapType0Select Heap@1 r_5@@2 edges))
 :pattern ( (MapType1Select QPMask@7 r_5@@2 edges))
 :pattern ( (MapType2Select res_copy_nodes@0 r_5@@2))
)) (=> (forall ((r_5@@3 T@U) ) (!  (=> (= (type r_5@@3) RefType) (=> (and (U_2_bool (MapType2Select res_copy_nodes@0 r_5@@3)) (< NoPerm FullPerm)) (and (qpRange16 r_5@@3) (= (invRecv16 r_5@@3) r_5@@3))))
 :qid |stdinbpl.1798:30|
 :skolemid |215|
 :pattern ( (MapType0Select Heap@1 r_5@@3 edges))
 :pattern ( (MapType1Select QPMask@7 r_5@@3 edges))
 :pattern ( (MapType2Select res_copy_nodes@0 r_5@@3))
)) (=> (and (and (forall ((o_3@@86 T@U) ) (!  (=> (= (type o_3@@86) RefType) (=> (and (U_2_bool (MapType2Select res_copy_nodes@0 (invRecv16 o_3@@86))) (and (< NoPerm FullPerm) (qpRange16 o_3@@86))) (= (invRecv16 o_3@@86) o_3@@86)))
 :qid |stdinbpl.1802:30|
 :skolemid |216|
 :pattern ( (invRecv16 o_3@@86))
)) (forall ((o_3@@87 T@U) ) (!  (=> (= (type o_3@@87) RefType) (and (=> (and (U_2_bool (MapType2Select res_copy_nodes@0 (invRecv16 o_3@@87))) (and (< NoPerm FullPerm) (qpRange16 o_3@@87))) (and (= (invRecv16 o_3@@87) o_3@@87) (= (U_2_real (MapType1Select QPMask@7 o_3@@87 edges)) (- (U_2_real (MapType1Select QPMask@6 o_3@@87 edges)) FullPerm)))) (=> (not (and (U_2_bool (MapType2Select res_copy_nodes@0 (invRecv16 o_3@@87))) (and (< NoPerm FullPerm) (qpRange16 o_3@@87)))) (= (U_2_real (MapType1Select QPMask@7 o_3@@87 edges)) (U_2_real (MapType1Select QPMask@6 o_3@@87 edges))))))
 :qid |stdinbpl.1808:30|
 :skolemid |217|
 :pattern ( (MapType1Select QPMask@7 o_3@@87 edges))
))) (and (forall ((o_3@@88 T@U) (f_5@@28 T@U) ) (! (let ((B@@40 (FieldTypeInv1 (type f_5@@28))))
(let ((A@@41 (FieldTypeInv0 (type f_5@@28))))
 (=> (and (and (= (type o_3@@88) RefType) (= (type f_5@@28) (FieldType A@@41 B@@40))) (not (= f_5@@28 edges))) (= (U_2_real (MapType1Select QPMask@6 o_3@@88 f_5@@28)) (U_2_real (MapType1Select QPMask@7 o_3@@88 f_5@@28))))))
 :qid |stdinbpl.1814:37|
 :skolemid |218|
 :pattern ( (MapType1Select QPMask@7 o_3@@88 f_5@@28))
)) (IdenticalOnKnownLocations Heap@1 ExhaleHeap@0 QPMask@7))) (and (and (=> (= (ControlFlow 0 198) 197) anon174_Then_correct) (=> (= (ControlFlow 0 198) 137) anon189_Then_correct)) (=> (= (ControlFlow 0 198) 69) anon189_Else_correct))))))))))))))))
(let ((anon163_Then_correct  (=> (has_node node_map_1@@4 this) (=> (and (= nodeCopy@0 (lookup node_map_1@@4 this)) (state Heap@@9 QPMask@3)) (=> (and (and (and (state Heap@@9 QPMask@3) (state Heap@@9 QPMask@3)) (and (= Heap@2 Heap@@9) (= Mask@2 QPMask@3))) (and (and (= nodeCopy@1 nodeCopy@0) (= res_node_map@2 node_map_1@@4)) (and (= res_copy_nodes@2 node_map_image) (= (ControlFlow 0 68) 61)))) anon125_correct)))))
(let ((anon63_correct true))
(let ((anon173_Else_correct  (=> (and (not (|Seq#Contains| (map_domain res_node_map@0) r_2)) (= (ControlFlow 0 32) 29)) anon63_correct)))
(let ((anon173_Then_correct  (=> (|Seq#Contains| (map_domain res_node_map@0) r_2) (and (=> (= (ControlFlow 0 30) (- 0 31)) (U_2_bool (MapType2Select res_copy_nodes@0 (lookup res_node_map@0 r_2)))) (=> (U_2_bool (MapType2Select res_copy_nodes@0 (lookup res_node_map@0 r_2))) (=> (= (ControlFlow 0 30) 29) anon63_correct))))))
(let ((anon170_Else_correct  (=> (forall ((r_1_1 T@U) (j_3_1 Int) ) (!  (=> (= (type r_1_1) RefType) (=> (and (U_2_bool (MapType2Select setOfRef r_1_1)) (U_2_bool (MapType2Select (edges_domain (MapType0Select Heap@1 r_1_1 edges)) (int_2_U j_3_1)))) (U_2_bool (MapType2Select setOfRef (edge_lookup (MapType0Select Heap@1 r_1_1 edges) j_3_1)))))
 :qid |stdinbpl.1718:28|
 :skolemid |205|
 :pattern ( (MapType2Select setOfRef r_1_1) (MapType2Select (edges_domain (MapType0Select Heap@1 r_1_1 edges)) (int_2_U j_3_1)))
 :pattern ( (MapType2Select setOfRef r_1_1) (edge_lookup (MapType0Select Heap@1 r_1_1 edges) j_3_1))
 :pattern ( (MapType2Select setOfRef r_1_1) (MapType2Select setOfRef (edge_lookup (MapType0Select Heap@1 r_1_1 edges) j_3_1)))
 :pattern ( (edges_domain (MapType0Select Heap@1 r_1_1 edges)) (edge_lookup (MapType0Select Heap@1 r_1_1 edges) j_3_1))
 :pattern ( (edges_domain (MapType0Select Heap@1 r_1_1 edges)) (MapType2Select setOfRef (edge_lookup (MapType0Select Heap@1 r_1_1 edges) j_3_1)))
 :pattern ( (MapType2Select (edges_domain (MapType0Select Heap@1 r_1_1 edges)) (int_2_U j_3_1)))
 :pattern ( (MapType2Select setOfRef (edge_lookup (MapType0Select Heap@1 r_1_1 edges) j_3_1)))
)) (and (=> (= (ControlFlow 0 203) (- 0 205)) (|Set#Subset| node_map_image res_copy_nodes@0)) (=> (|Set#Subset| node_map_image res_copy_nodes@0) (and (=> (= (ControlFlow 0 203) (- 0 204)) (= (|Set#Card| (|Set#Intersection| setOfRef res_copy_nodes@0)) 0)) (=> (= (|Set#Card| (|Set#Intersection| setOfRef res_copy_nodes@0)) 0) (and (and (=> (= (ControlFlow 0 203) 198) anon172_Else_correct) (=> (= (ControlFlow 0 203) 30) anon173_Then_correct)) (=> (= (ControlFlow 0 203) 32) anon173_Else_correct)))))))))
(let ((anon59_correct true))
(let ((anon171_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select setOfRef r_1)) (U_2_bool (MapType2Select (edges_domain (MapType0Select Heap@1 r_1 edges)) (int_2_U j_2))))) (= (ControlFlow 0 28) 25)) anon59_correct)))
(let ((anon171_Then_correct  (=> (and (U_2_bool (MapType2Select setOfRef r_1)) (U_2_bool (MapType2Select (edges_domain (MapType0Select Heap@1 r_1 edges)) (int_2_U j_2)))) (and (=> (= (ControlFlow 0 26) (- 0 27)) (U_2_bool (MapType2Select setOfRef (edge_lookup (MapType0Select Heap@1 r_1 edges) j_2)))) (=> (U_2_bool (MapType2Select setOfRef (edge_lookup (MapType0Select Heap@1 r_1 edges) j_2))) (=> (= (ControlFlow 0 26) 25) anon59_correct))))))
(let ((anon168_Else_correct  (=> (forall ((j_1_1 Int) ) (!  (=> (U_2_bool (MapType2Select S@0 (int_2_U j_1_1))) (U_2_bool (MapType2Select setOfRef (edge_lookup (MapType0Select Heap@1 this edges) j_1_1))))
 :qid |stdinbpl.1707:28|
 :skolemid |204|
 :pattern ( (MapType2Select S@0 (int_2_U j_1_1)))
 :pattern ( (MapType2Select setOfRef (edge_lookup (MapType0Select Heap@1 this edges) j_1_1)))
)) (and (and (=> (= (ControlFlow 0 206) 203) anon170_Else_correct) (=> (= (ControlFlow 0 206) 26) anon171_Then_correct)) (=> (= (ControlFlow 0 206) 28) anon171_Else_correct)))))
(let ((anon55_correct true))
(let ((anon169_Else_correct  (=> (and (not (U_2_bool (MapType2Select S@0 (int_2_U j@@6)))) (= (ControlFlow 0 24) 21)) anon55_correct)))
(let ((anon169_Then_correct  (=> (U_2_bool (MapType2Select S@0 (int_2_U j@@6))) (and (=> (= (ControlFlow 0 22) (- 0 23)) (U_2_bool (MapType2Select setOfRef (edge_lookup (MapType0Select Heap@1 this edges) j@@6)))) (=> (U_2_bool (MapType2Select setOfRef (edge_lookup (MapType0Select Heap@1 this edges) j@@6))) (=> (= (ControlFlow 0 22) 21) anon55_correct))))))
(let ((anon166_Else_correct  (=> (forall ((x_45_1 T@U) ) (!  (=> (and (= (type x_45_1) RefType) (U_2_bool (MapType2Select setOfRef x_45_1))) (= (MapType0Select Heap@1 x_45_1 edges) (MapType0Select Heap@@9 x_45_1 edges)))
 :qid |stdinbpl.1696:28|
 :skolemid |203|
 :pattern ( (MapType2Select setOfRef x_45_1))
)) (and (and (=> (= (ControlFlow 0 207) 206) anon168_Else_correct) (=> (= (ControlFlow 0 207) 22) anon169_Then_correct)) (=> (= (ControlFlow 0 207) 24) anon169_Else_correct)))))
(let ((anon51_correct true))
(let ((anon167_Else_correct  (=> (and (not (U_2_bool (MapType2Select setOfRef x_44))) (= (ControlFlow 0 20) 17)) anon51_correct)))
(let ((anon167_Then_correct  (=> (U_2_bool (MapType2Select setOfRef x_44)) (and (=> (= (ControlFlow 0 18) (- 0 19)) (= (MapType0Select Heap@1 x_44 edges) (MapType0Select Heap@@9 x_44 edges))) (=> (= (MapType0Select Heap@1 x_44 edges) (MapType0Select Heap@@9 x_44 edges)) (=> (= (ControlFlow 0 18) 17) anon51_correct))))))
(let ((anon164_Else_correct  (=> (forall ((x_42_1 T@U) ) (!  (=> (and (= (type x_42_1) RefType) (U_2_bool (MapType2Select setOfRef x_42_1))) (= (U_2_int (MapType0Select Heap@1 x_42_1 val)) (U_2_int (MapType0Select Heap@@9 x_42_1 val))))
 :qid |stdinbpl.1640:28|
 :skolemid |195|
 :pattern ( (MapType2Select setOfRef x_42_1))
)) (and (=> (= (ControlFlow 0 208) (- 0 211)) (forall ((x_43 T@U) ) (!  (=> (= (type x_43) RefType) (=> (and (U_2_bool (MapType2Select setOfRef x_43)) (dummyFunction (MapType0Select Heap@1 x_43 edges))) (>= rd NoPerm)))
 :qid |stdinbpl.1648:25|
 :skolemid |196|
 :pattern ( (MapType0Select Heap@1 x_43 edges))
 :pattern ( (MapType1Select QPMask@5 x_43 edges))
 :pattern ( (MapType2Select setOfRef x_43))
))) (=> (forall ((x_43@@0 T@U) ) (!  (=> (= (type x_43@@0) RefType) (=> (and (U_2_bool (MapType2Select setOfRef x_43@@0)) (dummyFunction (MapType0Select Heap@1 x_43@@0 edges))) (>= rd NoPerm)))
 :qid |stdinbpl.1648:25|
 :skolemid |196|
 :pattern ( (MapType0Select Heap@1 x_43@@0 edges))
 :pattern ( (MapType1Select QPMask@5 x_43@@0 edges))
 :pattern ( (MapType2Select setOfRef x_43@@0))
)) (and (=> (= (ControlFlow 0 208) (- 0 210)) (forall ((x_43@@1 T@U) (x_43_1 T@U) ) (!  (=> (and (= (type x_43@@1) RefType) (= (type x_43_1) RefType)) (=> (and (and (and (and (not (= x_43@@1 x_43_1)) (U_2_bool (MapType2Select setOfRef x_43@@1))) (U_2_bool (MapType2Select setOfRef x_43_1))) (< NoPerm rd)) (< NoPerm rd)) (not (= x_43@@1 x_43_1))))
 :qid |stdinbpl.1655:25|
 :skolemid |197|
 :pattern ( (neverTriggered14 x_43@@1) (neverTriggered14 x_43_1))
))) (=> (forall ((x_43@@2 T@U) (x_43_1@@0 T@U) ) (!  (=> (and (= (type x_43@@2) RefType) (= (type x_43_1@@0) RefType)) (=> (and (and (and (and (not (= x_43@@2 x_43_1@@0)) (U_2_bool (MapType2Select setOfRef x_43@@2))) (U_2_bool (MapType2Select setOfRef x_43_1@@0))) (< NoPerm rd)) (< NoPerm rd)) (not (= x_43@@2 x_43_1@@0))))
 :qid |stdinbpl.1655:25|
 :skolemid |197|
 :pattern ( (neverTriggered14 x_43@@2) (neverTriggered14 x_43_1@@0))
)) (and (=> (= (ControlFlow 0 208) (- 0 209)) (forall ((x_43@@3 T@U) ) (!  (=> (and (= (type x_43@@3) RefType) (U_2_bool (MapType2Select setOfRef x_43@@3))) (>= (U_2_real (MapType1Select QPMask@4 x_43@@3 edges)) rd))
 :qid |stdinbpl.1662:25|
 :skolemid |198|
 :pattern ( (MapType0Select Heap@1 x_43@@3 edges))
 :pattern ( (MapType1Select QPMask@5 x_43@@3 edges))
 :pattern ( (MapType2Select setOfRef x_43@@3))
))) (=> (forall ((x_43@@4 T@U) ) (!  (=> (and (= (type x_43@@4) RefType) (U_2_bool (MapType2Select setOfRef x_43@@4))) (>= (U_2_real (MapType1Select QPMask@4 x_43@@4 edges)) rd))
 :qid |stdinbpl.1662:25|
 :skolemid |198|
 :pattern ( (MapType0Select Heap@1 x_43@@4 edges))
 :pattern ( (MapType1Select QPMask@5 x_43@@4 edges))
 :pattern ( (MapType2Select setOfRef x_43@@4))
)) (=> (and (and (forall ((x_43@@5 T@U) ) (!  (=> (= (type x_43@@5) RefType) (=> (and (U_2_bool (MapType2Select setOfRef x_43@@5)) (< NoPerm rd)) (and (qpRange14 x_43@@5) (= (invRecv14 x_43@@5) x_43@@5))))
 :qid |stdinbpl.1668:30|
 :skolemid |199|
 :pattern ( (MapType0Select Heap@1 x_43@@5 edges))
 :pattern ( (MapType1Select QPMask@5 x_43@@5 edges))
 :pattern ( (MapType2Select setOfRef x_43@@5))
)) (forall ((o_3@@89 T@U) ) (!  (=> (= (type o_3@@89) RefType) (=> (and (U_2_bool (MapType2Select setOfRef (invRecv14 o_3@@89))) (and (< NoPerm rd) (qpRange14 o_3@@89))) (= (invRecv14 o_3@@89) o_3@@89)))
 :qid |stdinbpl.1672:30|
 :skolemid |200|
 :pattern ( (invRecv14 o_3@@89))
))) (and (forall ((o_3@@90 T@U) ) (!  (=> (= (type o_3@@90) RefType) (and (=> (and (U_2_bool (MapType2Select setOfRef (invRecv14 o_3@@90))) (and (< NoPerm rd) (qpRange14 o_3@@90))) (and (= (invRecv14 o_3@@90) o_3@@90) (= (U_2_real (MapType1Select QPMask@5 o_3@@90 edges)) (- (U_2_real (MapType1Select QPMask@4 o_3@@90 edges)) rd)))) (=> (not (and (U_2_bool (MapType2Select setOfRef (invRecv14 o_3@@90))) (and (< NoPerm rd) (qpRange14 o_3@@90)))) (= (U_2_real (MapType1Select QPMask@5 o_3@@90 edges)) (U_2_real (MapType1Select QPMask@4 o_3@@90 edges))))))
 :qid |stdinbpl.1678:30|
 :skolemid |201|
 :pattern ( (MapType1Select QPMask@5 o_3@@90 edges))
)) (forall ((o_3@@91 T@U) (f_5@@29 T@U) ) (! (let ((B@@41 (FieldTypeInv1 (type f_5@@29))))
(let ((A@@42 (FieldTypeInv0 (type f_5@@29))))
 (=> (and (and (= (type o_3@@91) RefType) (= (type f_5@@29) (FieldType A@@42 B@@41))) (not (= f_5@@29 edges))) (= (U_2_real (MapType1Select QPMask@4 o_3@@91 f_5@@29)) (U_2_real (MapType1Select QPMask@5 o_3@@91 f_5@@29))))))
 :qid |stdinbpl.1684:37|
 :skolemid |202|
 :pattern ( (MapType1Select QPMask@5 o_3@@91 f_5@@29))
)))) (and (and (=> (= (ControlFlow 0 208) 207) anon166_Else_correct) (=> (= (ControlFlow 0 208) 18) anon167_Then_correct)) (=> (= (ControlFlow 0 208) 20) anon167_Else_correct))))))))))))
(let ((anon47_correct true))
(let ((anon165_Else_correct  (=> (and (not (U_2_bool (MapType2Select setOfRef x_41))) (= (ControlFlow 0 16) 13)) anon47_correct)))
(let ((anon165_Then_correct  (=> (U_2_bool (MapType2Select setOfRef x_41)) (and (=> (= (ControlFlow 0 14) (- 0 15)) (= (U_2_int (MapType0Select Heap@1 x_41 val)) (U_2_int (MapType0Select Heap@@9 x_41 val)))) (=> (= (U_2_int (MapType0Select Heap@1 x_41 val)) (U_2_int (MapType0Select Heap@@9 x_41 val))) (=> (= (ControlFlow 0 14) 13) anon47_correct))))))
(let ((anon163_Else_correct  (=> (not (has_node node_map_1@@4 this)) (=> (and (not (= freshObj@0 null)) (not (U_2_bool (MapType0Select Heap@@9 freshObj@0 $allocated)))) (=> (and (and (= Heap@0 (MapType0Store Heap@@9 freshObj@0 $allocated (bool_2_U true))) (= Mask@0 (MapType1Store QPMask@3 freshObj@0 val (real_2_U (+ (U_2_real (MapType1Select QPMask@3 freshObj@0 val)) FullPerm))))) (and (= Mask@1 (MapType1Store Mask@0 freshObj@0 edges (real_2_U (+ (U_2_real (MapType1Select Mask@0 freshObj@0 edges)) FullPerm)))) (state Heap@0 Mask@1))) (and (=> (= (ControlFlow 0 212) (- 0 221)) (HasDirectPerm Mask@1 this val)) (=> (HasDirectPerm Mask@1 this val) (and (=> (= (ControlFlow 0 212) (- 0 220)) (= FullPerm (U_2_real (MapType1Select Mask@1 freshObj@0 val)))) (=> (= FullPerm (U_2_real (MapType1Select Mask@1 freshObj@0 val))) (=> (and (= Heap@1 (MapType0Store Heap@0 freshObj@0 val (MapType0Select Heap@0 this val))) (state Heap@1 Mask@1)) (=> (and (and (= res_node_map@0 (insert node_map_1@@4 this freshObj@0)) (state Heap@1 Mask@1)) (and (= res_copy_nodes@0 (|Set#Union| node_map_image (|Set#Singleton| freshObj@0))) (state Heap@1 Mask@1))) (and (=> (= (ControlFlow 0 212) (- 0 219)) (|Set#Equal| (|Set#Union| (|Set#Intersection| setOfRef node_map_image) (|Set#Intersection| setOfRef (|Set#Singleton| freshObj@0))) (|Set#Intersection| setOfRef res_copy_nodes@0))) (=> (|Set#Equal| (|Set#Union| (|Set#Intersection| setOfRef node_map_image) (|Set#Intersection| setOfRef (|Set#Singleton| freshObj@0))) (|Set#Intersection| setOfRef res_copy_nodes@0)) (=> (state Heap@1 Mask@1) (and (=> (= (ControlFlow 0 212) (- 0 218)) (HasDirectPerm Mask@1 this edges)) (=> (HasDirectPerm Mask@1 this edges) (=> (and (= S@0 (edges_domain (MapType0Select Heap@1 this edges))) (state Heap@1 Mask@1)) (and (=> (= (ControlFlow 0 212) (- 0 217)) (U_2_bool (MapType2Select res_copy_nodes@0 freshObj@0))) (=> (U_2_bool (MapType2Select res_copy_nodes@0 freshObj@0)) (and (=> (= (ControlFlow 0 212) (- 0 216)) (U_2_bool (MapType2Select setOfRef this))) (=> (U_2_bool (MapType2Select setOfRef this)) (and (=> (= (ControlFlow 0 212) (- 0 215)) (forall ((x_40 T@U) ) (!  (=> (= (type x_40) RefType) (=> (and (U_2_bool (MapType2Select setOfRef x_40)) (dummyFunction (MapType0Select Heap@1 x_40 val))) (>= rd NoPerm)))
 :qid |stdinbpl.1592:25|
 :skolemid |188|
 :pattern ( (MapType0Select Heap@1 x_40 val))
 :pattern ( (MapType1Select QPMask@4 x_40 val))
 :pattern ( (MapType2Select setOfRef x_40))
))) (=> (forall ((x_40@@0 T@U) ) (!  (=> (= (type x_40@@0) RefType) (=> (and (U_2_bool (MapType2Select setOfRef x_40@@0)) (dummyFunction (MapType0Select Heap@1 x_40@@0 val))) (>= rd NoPerm)))
 :qid |stdinbpl.1592:25|
 :skolemid |188|
 :pattern ( (MapType0Select Heap@1 x_40@@0 val))
 :pattern ( (MapType1Select QPMask@4 x_40@@0 val))
 :pattern ( (MapType2Select setOfRef x_40@@0))
)) (and (=> (= (ControlFlow 0 212) (- 0 214)) (forall ((x_40@@1 T@U) (x_40_1 T@U) ) (!  (=> (and (= (type x_40@@1) RefType) (= (type x_40_1) RefType)) (=> (and (and (and (and (not (= x_40@@1 x_40_1)) (U_2_bool (MapType2Select setOfRef x_40@@1))) (U_2_bool (MapType2Select setOfRef x_40_1))) (< NoPerm rd)) (< NoPerm rd)) (not (= x_40@@1 x_40_1))))
 :qid |stdinbpl.1599:25|
 :skolemid |189|
 :pattern ( (neverTriggered13 x_40@@1) (neverTriggered13 x_40_1))
))) (=> (forall ((x_40@@2 T@U) (x_40_1@@0 T@U) ) (!  (=> (and (= (type x_40@@2) RefType) (= (type x_40_1@@0) RefType)) (=> (and (and (and (and (not (= x_40@@2 x_40_1@@0)) (U_2_bool (MapType2Select setOfRef x_40@@2))) (U_2_bool (MapType2Select setOfRef x_40_1@@0))) (< NoPerm rd)) (< NoPerm rd)) (not (= x_40@@2 x_40_1@@0))))
 :qid |stdinbpl.1599:25|
 :skolemid |189|
 :pattern ( (neverTriggered13 x_40@@2) (neverTriggered13 x_40_1@@0))
)) (and (=> (= (ControlFlow 0 212) (- 0 213)) (forall ((x_40@@3 T@U) ) (!  (=> (and (= (type x_40@@3) RefType) (U_2_bool (MapType2Select setOfRef x_40@@3))) (>= (U_2_real (MapType1Select Mask@1 x_40@@3 val)) rd))
 :qid |stdinbpl.1606:25|
 :skolemid |190|
 :pattern ( (MapType0Select Heap@1 x_40@@3 val))
 :pattern ( (MapType1Select QPMask@4 x_40@@3 val))
 :pattern ( (MapType2Select setOfRef x_40@@3))
))) (=> (forall ((x_40@@4 T@U) ) (!  (=> (and (= (type x_40@@4) RefType) (U_2_bool (MapType2Select setOfRef x_40@@4))) (>= (U_2_real (MapType1Select Mask@1 x_40@@4 val)) rd))
 :qid |stdinbpl.1606:25|
 :skolemid |190|
 :pattern ( (MapType0Select Heap@1 x_40@@4 val))
 :pattern ( (MapType1Select QPMask@4 x_40@@4 val))
 :pattern ( (MapType2Select setOfRef x_40@@4))
)) (=> (and (and (forall ((x_40@@5 T@U) ) (!  (=> (= (type x_40@@5) RefType) (=> (and (U_2_bool (MapType2Select setOfRef x_40@@5)) (< NoPerm rd)) (and (qpRange13 x_40@@5) (= (invRecv13 x_40@@5) x_40@@5))))
 :qid |stdinbpl.1612:30|
 :skolemid |191|
 :pattern ( (MapType0Select Heap@1 x_40@@5 val))
 :pattern ( (MapType1Select QPMask@4 x_40@@5 val))
 :pattern ( (MapType2Select setOfRef x_40@@5))
)) (forall ((o_3@@92 T@U) ) (!  (=> (= (type o_3@@92) RefType) (=> (and (U_2_bool (MapType2Select setOfRef (invRecv13 o_3@@92))) (and (< NoPerm rd) (qpRange13 o_3@@92))) (= (invRecv13 o_3@@92) o_3@@92)))
 :qid |stdinbpl.1616:30|
 :skolemid |192|
 :pattern ( (invRecv13 o_3@@92))
))) (and (forall ((o_3@@93 T@U) ) (!  (=> (= (type o_3@@93) RefType) (and (=> (and (U_2_bool (MapType2Select setOfRef (invRecv13 o_3@@93))) (and (< NoPerm rd) (qpRange13 o_3@@93))) (and (= (invRecv13 o_3@@93) o_3@@93) (= (U_2_real (MapType1Select QPMask@4 o_3@@93 val)) (- (U_2_real (MapType1Select Mask@1 o_3@@93 val)) rd)))) (=> (not (and (U_2_bool (MapType2Select setOfRef (invRecv13 o_3@@93))) (and (< NoPerm rd) (qpRange13 o_3@@93)))) (= (U_2_real (MapType1Select QPMask@4 o_3@@93 val)) (U_2_real (MapType1Select Mask@1 o_3@@93 val))))))
 :qid |stdinbpl.1622:30|
 :skolemid |193|
 :pattern ( (MapType1Select QPMask@4 o_3@@93 val))
)) (forall ((o_3@@94 T@U) (f_5@@30 T@U) ) (! (let ((B@@42 (FieldTypeInv1 (type f_5@@30))))
(let ((A@@43 (FieldTypeInv0 (type f_5@@30))))
 (=> (and (and (= (type o_3@@94) RefType) (= (type f_5@@30) (FieldType A@@43 B@@42))) (not (= f_5@@30 val))) (= (U_2_real (MapType1Select Mask@1 o_3@@94 f_5@@30)) (U_2_real (MapType1Select QPMask@4 o_3@@94 f_5@@30))))))
 :qid |stdinbpl.1628:37|
 :skolemid |194|
 :pattern ( (MapType1Select QPMask@4 o_3@@94 f_5@@30))
)))) (and (and (=> (= (ControlFlow 0 212) 208) anon164_Else_correct) (=> (= (ControlFlow 0 212) 14) anon165_Then_correct)) (=> (= (ControlFlow 0 212) 16) anon165_Else_correct))))))))))))))))))))))))))))))
(let ((anon149_Else_correct  (and (=> (= (ControlFlow 0 259) (- 0 260)) (forall ((x_11 T@U) (x_11_1 T@U) ) (!  (=> (and (= (type x_11) RefType) (= (type x_11_1) RefType)) (=> (and (and (and (and (not (= x_11 x_11_1)) (U_2_bool (MapType2Select node_map_image x_11))) (U_2_bool (MapType2Select node_map_image x_11_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= x_11 x_11_1))))
 :qid |stdinbpl.1230:15|
 :skolemid |152|
 :no-pattern (type x_11)
 :no-pattern (type x_11_1)
 :no-pattern (U_2_int x_11)
 :no-pattern (U_2_bool x_11)
 :no-pattern (U_2_int x_11_1)
 :no-pattern (U_2_bool x_11_1)
))) (=> (forall ((x_11@@0 T@U) (x_11_1@@0 T@U) ) (!  (=> (and (= (type x_11@@0) RefType) (= (type x_11_1@@0) RefType)) (=> (and (and (and (and (not (= x_11@@0 x_11_1@@0)) (U_2_bool (MapType2Select node_map_image x_11@@0))) (U_2_bool (MapType2Select node_map_image x_11_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= x_11@@0 x_11_1@@0))))
 :qid |stdinbpl.1230:15|
 :skolemid |152|
 :no-pattern (type x_11@@0)
 :no-pattern (type x_11_1@@0)
 :no-pattern (U_2_int x_11@@0)
 :no-pattern (U_2_bool x_11@@0)
 :no-pattern (U_2_int x_11_1@@0)
 :no-pattern (U_2_bool x_11_1@@0)
)) (=> (forall ((x_11@@1 T@U) ) (!  (=> (= (type x_11@@1) RefType) (=> (and (U_2_bool (MapType2Select node_map_image x_11@@1)) (< NoPerm FullPerm)) (and (qpRange4 x_11@@1) (= (invRecv4 x_11@@1) x_11@@1))))
 :qid |stdinbpl.1236:22|
 :skolemid |153|
 :pattern ( (MapType0Select Heap@@9 x_11@@1 edges))
 :pattern ( (MapType1Select QPMask@3 x_11@@1 edges))
 :pattern ( (MapType2Select node_map_image x_11@@1))
)) (=> (and (forall ((o_3@@95 T@U) ) (!  (=> (= (type o_3@@95) RefType) (=> (and (and (U_2_bool (MapType2Select node_map_image (invRecv4 o_3@@95))) (< NoPerm FullPerm)) (qpRange4 o_3@@95)) (= (invRecv4 o_3@@95) o_3@@95)))
 :qid |stdinbpl.1240:22|
 :skolemid |154|
 :pattern ( (invRecv4 o_3@@95))
)) (forall ((x_11@@2 T@U) ) (!  (=> (and (= (type x_11@@2) RefType) (U_2_bool (MapType2Select node_map_image x_11@@2))) (not (= x_11@@2 null)))
 :qid |stdinbpl.1246:22|
 :skolemid |155|
 :pattern ( (MapType0Select Heap@@9 x_11@@2 edges))
 :pattern ( (MapType1Select QPMask@3 x_11@@2 edges))
 :pattern ( (MapType2Select node_map_image x_11@@2))
))) (=> (and (and (forall ((o_3@@96 T@U) ) (!  (=> (= (type o_3@@96) RefType) (and (=> (and (and (U_2_bool (MapType2Select node_map_image (invRecv4 o_3@@96))) (< NoPerm FullPerm)) (qpRange4 o_3@@96)) (and (=> (< NoPerm FullPerm) (= (invRecv4 o_3@@96) o_3@@96)) (= (U_2_real (MapType1Select QPMask@3 o_3@@96 edges)) (+ (U_2_real (MapType1Select QPMask@2 o_3@@96 edges)) FullPerm)))) (=> (not (and (and (U_2_bool (MapType2Select node_map_image (invRecv4 o_3@@96))) (< NoPerm FullPerm)) (qpRange4 o_3@@96))) (= (U_2_real (MapType1Select QPMask@3 o_3@@96 edges)) (U_2_real (MapType1Select QPMask@2 o_3@@96 edges))))))
 :qid |stdinbpl.1252:22|
 :skolemid |156|
 :pattern ( (MapType1Select QPMask@3 o_3@@96 edges))
)) (forall ((o_3@@97 T@U) (f_5@@31 T@U) ) (! (let ((B@@43 (FieldTypeInv1 (type f_5@@31))))
(let ((A@@44 (FieldTypeInv0 (type f_5@@31))))
 (=> (and (and (= (type o_3@@97) RefType) (= (type f_5@@31) (FieldType A@@44 B@@43))) (not (= f_5@@31 edges))) (= (U_2_real (MapType1Select QPMask@2 o_3@@97 f_5@@31)) (U_2_real (MapType1Select QPMask@3 o_3@@97 f_5@@31))))))
 :qid |stdinbpl.1256:29|
 :skolemid |157|
 :pattern ( (MapType1Select QPMask@2 o_3@@97 f_5@@31))
 :pattern ( (MapType1Select QPMask@3 o_3@@97 f_5@@31))
))) (and (state Heap@@9 QPMask@3) (state Heap@@9 QPMask@3))) (and (and (=> (= (ControlFlow 0 259) 258) anon150_Then_correct) (=> (= (ControlFlow 0 259) 68) anon163_Then_correct)) (=> (= (ControlFlow 0 259) 212) anon163_Else_correct)))))))))
(let ((anon149_Then_correct true))
(let ((anon148_Else_correct  (and (=> (= (ControlFlow 0 261) (- 0 262)) (forall ((x_9 T@U) (x_9_1 T@U) ) (!  (=> (and (= (type x_9) RefType) (= (type x_9_1) RefType)) (=> (and (and (and (and (not (= x_9 x_9_1)) (U_2_bool (MapType2Select node_map_image x_9))) (U_2_bool (MapType2Select node_map_image x_9_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= x_9 x_9_1))))
 :qid |stdinbpl.1190:15|
 :skolemid |146|
 :no-pattern (type x_9)
 :no-pattern (type x_9_1)
 :no-pattern (U_2_int x_9)
 :no-pattern (U_2_bool x_9)
 :no-pattern (U_2_int x_9_1)
 :no-pattern (U_2_bool x_9_1)
))) (=> (forall ((x_9@@0 T@U) (x_9_1@@0 T@U) ) (!  (=> (and (= (type x_9@@0) RefType) (= (type x_9_1@@0) RefType)) (=> (and (and (and (and (not (= x_9@@0 x_9_1@@0)) (U_2_bool (MapType2Select node_map_image x_9@@0))) (U_2_bool (MapType2Select node_map_image x_9_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= x_9@@0 x_9_1@@0))))
 :qid |stdinbpl.1190:15|
 :skolemid |146|
 :no-pattern (type x_9@@0)
 :no-pattern (type x_9_1@@0)
 :no-pattern (U_2_int x_9@@0)
 :no-pattern (U_2_bool x_9@@0)
 :no-pattern (U_2_int x_9_1@@0)
 :no-pattern (U_2_bool x_9_1@@0)
)) (=> (forall ((x_9@@1 T@U) ) (!  (=> (= (type x_9@@1) RefType) (=> (and (U_2_bool (MapType2Select node_map_image x_9@@1)) (< NoPerm FullPerm)) (and (qpRange3 x_9@@1) (= (invRecv3 x_9@@1) x_9@@1))))
 :qid |stdinbpl.1196:22|
 :skolemid |147|
 :pattern ( (MapType0Select Heap@@9 x_9@@1 val))
 :pattern ( (MapType1Select QPMask@2 x_9@@1 val))
 :pattern ( (MapType2Select node_map_image x_9@@1))
)) (=> (and (forall ((o_3@@98 T@U) ) (!  (=> (= (type o_3@@98) RefType) (=> (and (and (U_2_bool (MapType2Select node_map_image (invRecv3 o_3@@98))) (< NoPerm FullPerm)) (qpRange3 o_3@@98)) (= (invRecv3 o_3@@98) o_3@@98)))
 :qid |stdinbpl.1200:22|
 :skolemid |148|
 :pattern ( (invRecv3 o_3@@98))
)) (forall ((x_9@@2 T@U) ) (!  (=> (and (= (type x_9@@2) RefType) (U_2_bool (MapType2Select node_map_image x_9@@2))) (not (= x_9@@2 null)))
 :qid |stdinbpl.1206:22|
 :skolemid |149|
 :pattern ( (MapType0Select Heap@@9 x_9@@2 val))
 :pattern ( (MapType1Select QPMask@2 x_9@@2 val))
 :pattern ( (MapType2Select node_map_image x_9@@2))
))) (=> (and (and (forall ((o_3@@99 T@U) ) (!  (=> (= (type o_3@@99) RefType) (and (=> (and (and (U_2_bool (MapType2Select node_map_image (invRecv3 o_3@@99))) (< NoPerm FullPerm)) (qpRange3 o_3@@99)) (and (=> (< NoPerm FullPerm) (= (invRecv3 o_3@@99) o_3@@99)) (= (U_2_real (MapType1Select QPMask@2 o_3@@99 val)) (+ (U_2_real (MapType1Select QPMask@1 o_3@@99 val)) FullPerm)))) (=> (not (and (and (U_2_bool (MapType2Select node_map_image (invRecv3 o_3@@99))) (< NoPerm FullPerm)) (qpRange3 o_3@@99))) (= (U_2_real (MapType1Select QPMask@2 o_3@@99 val)) (U_2_real (MapType1Select QPMask@1 o_3@@99 val))))))
 :qid |stdinbpl.1212:22|
 :skolemid |150|
 :pattern ( (MapType1Select QPMask@2 o_3@@99 val))
)) (forall ((o_3@@100 T@U) (f_5@@32 T@U) ) (! (let ((B@@44 (FieldTypeInv1 (type f_5@@32))))
(let ((A@@45 (FieldTypeInv0 (type f_5@@32))))
 (=> (and (and (= (type o_3@@100) RefType) (= (type f_5@@32) (FieldType A@@45 B@@44))) (not (= f_5@@32 val))) (= (U_2_real (MapType1Select QPMask@1 o_3@@100 f_5@@32)) (U_2_real (MapType1Select QPMask@2 o_3@@100 f_5@@32))))))
 :qid |stdinbpl.1216:29|
 :skolemid |151|
 :pattern ( (MapType1Select QPMask@1 o_3@@100 f_5@@32))
 :pattern ( (MapType1Select QPMask@2 o_3@@100 f_5@@32))
))) (and (state Heap@@9 QPMask@2) (state Heap@@9 QPMask@2))) (and (=> (= (ControlFlow 0 261) 12) anon149_Then_correct) (=> (= (ControlFlow 0 261) 259) anon149_Else_correct)))))))))
(let ((anon148_Then_correct true))
(let ((anon147_Else_correct  (=> (and (forall ((x_7 T@U) ) (!  (=> (and (= (type x_7) RefType) (|Seq#Contains| (map_domain node_map_1@@4) x_7)) (U_2_bool (MapType2Select node_map_image (lookup node_map_1@@4 x_7))))
 :qid |stdinbpl.1178:20|
 :skolemid |145|
 :pattern ( (|Seq#ContainsTrigger| (map_domain node_map_1@@4) x_7))
 :pattern ( (|Seq#Contains| (map_domain node_map_1@@4) x_7))
 :pattern ( (MapType2Select node_map_image (lookup node_map_1@@4 x_7)))
)) (state Heap@@9 QPMask@1)) (and (=> (= (ControlFlow 0 263) 11) anon148_Then_correct) (=> (= (ControlFlow 0 263) 261) anon148_Else_correct)))))
(let ((anon147_Then_correct true))
(let ((anon144_Else_correct  (=> (and (forall ((x_5 T@U) (i_1_1 Int) ) (!  (=> (= (type x_5) RefType) (=> (and (U_2_bool (MapType2Select setOfRef x_5)) (U_2_bool (MapType2Select (edges_domain (MapType0Select Heap@@9 x_5 edges)) (int_2_U i_1_1)))) (U_2_bool (MapType2Select setOfRef (edge_lookup (MapType0Select Heap@@9 x_5 edges) i_1_1)))))
 :qid |stdinbpl.1168:20|
 :skolemid |144|
 :pattern ( (MapType2Select setOfRef x_5) (MapType2Select (edges_domain (MapType0Select Heap@@9 x_5 edges)) (int_2_U i_1_1)))
 :pattern ( (MapType2Select setOfRef x_5) (edge_lookup (MapType0Select Heap@@9 x_5 edges) i_1_1))
 :pattern ( (MapType2Select setOfRef x_5) (MapType2Select setOfRef (edge_lookup (MapType0Select Heap@@9 x_5 edges) i_1_1)))
 :pattern ( (edges_domain (MapType0Select Heap@@9 x_5 edges)) (edge_lookup (MapType0Select Heap@@9 x_5 edges) i_1_1))
 :pattern ( (edges_domain (MapType0Select Heap@@9 x_5 edges)) (MapType2Select setOfRef (edge_lookup (MapType0Select Heap@@9 x_5 edges) i_1_1)))
 :pattern ( (MapType2Select (edges_domain (MapType0Select Heap@@9 x_5 edges)) (int_2_U i_1_1)))
 :pattern ( (MapType2Select setOfRef (edge_lookup (MapType0Select Heap@@9 x_5 edges) i_1_1)))
)) (state Heap@@9 QPMask@1)) (and (=> (= (ControlFlow 0 264) 10) anon147_Then_correct) (=> (= (ControlFlow 0 264) 263) anon147_Else_correct)))))
(let ((anon9_correct true))
(let ((anon146_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select setOfRef x@@22)) (U_2_bool (MapType2Select (edges_domain (MapType0Select Heap@@9 x@@22 edges)) (int_2_U i_2))))) (= (ControlFlow 0 6) 3)) anon9_correct)))
(let ((anon146_Then_correct  (=> (and (U_2_bool (MapType2Select setOfRef x@@22)) (U_2_bool (MapType2Select (edges_domain (MapType0Select Heap@@9 x@@22 edges)) (int_2_U i_2)))) (and (=> (= (ControlFlow 0 4) (- 0 5)) (HasDirectPerm QPMask@1 x@@22 edges)) (=> (HasDirectPerm QPMask@1 x@@22 edges) (=> (= (ControlFlow 0 4) 3) anon9_correct))))))
(let ((anon145_Else_correct  (=> (not (U_2_bool (MapType2Select setOfRef x@@22))) (and (=> (= (ControlFlow 0 9) 4) anon146_Then_correct) (=> (= (ControlFlow 0 9) 6) anon146_Else_correct)))))
(let ((anon145_Then_correct  (=> (U_2_bool (MapType2Select setOfRef x@@22)) (and (=> (= (ControlFlow 0 7) (- 0 8)) (HasDirectPerm QPMask@1 x@@22 edges)) (=> (HasDirectPerm QPMask@1 x@@22 edges) (and (=> (= (ControlFlow 0 7) 4) anon146_Then_correct) (=> (= (ControlFlow 0 7) 6) anon146_Else_correct)))))))
(let ((anon143_Else_correct  (and (=> (= (ControlFlow 0 265) (- 0 267)) (forall ((x_3 T@U) (x_3_1 T@U) ) (!  (=> (and (= (type x_3) RefType) (= (type x_3_1) RefType)) (=> (and (and (and (and (not (= x_3 x_3_1)) (U_2_bool (MapType2Select setOfRef x_3))) (U_2_bool (MapType2Select setOfRef x_3_1))) (< NoPerm rd)) (< NoPerm rd)) (not (= x_3 x_3_1))))
 :qid |stdinbpl.1116:15|
 :skolemid |137|
 :no-pattern (type x_3)
 :no-pattern (type x_3_1)
 :no-pattern (U_2_int x_3)
 :no-pattern (U_2_bool x_3)
 :no-pattern (U_2_int x_3_1)
 :no-pattern (U_2_bool x_3_1)
))) (=> (forall ((x_3@@0 T@U) (x_3_1@@0 T@U) ) (!  (=> (and (= (type x_3@@0) RefType) (= (type x_3_1@@0) RefType)) (=> (and (and (and (and (not (= x_3@@0 x_3_1@@0)) (U_2_bool (MapType2Select setOfRef x_3@@0))) (U_2_bool (MapType2Select setOfRef x_3_1@@0))) (< NoPerm rd)) (< NoPerm rd)) (not (= x_3@@0 x_3_1@@0))))
 :qid |stdinbpl.1116:15|
 :skolemid |137|
 :no-pattern (type x_3@@0)
 :no-pattern (type x_3_1@@0)
 :no-pattern (U_2_int x_3@@0)
 :no-pattern (U_2_bool x_3@@0)
 :no-pattern (U_2_int x_3_1@@0)
 :no-pattern (U_2_bool x_3_1@@0)
)) (=> (and (forall ((x_3@@1 T@U) ) (!  (=> (= (type x_3@@1) RefType) (=> (and (U_2_bool (MapType2Select setOfRef x_3@@1)) (< NoPerm rd)) (and (qpRange2 x_3@@1) (= (invRecv2 x_3@@1) x_3@@1))))
 :qid |stdinbpl.1122:22|
 :skolemid |138|
 :pattern ( (MapType0Select Heap@@9 x_3@@1 edges))
 :pattern ( (MapType1Select QPMask@1 x_3@@1 edges))
 :pattern ( (MapType2Select setOfRef x_3@@1))
)) (forall ((o_3@@101 T@U) ) (!  (=> (= (type o_3@@101) RefType) (=> (and (and (U_2_bool (MapType2Select setOfRef (invRecv2 o_3@@101))) (< NoPerm rd)) (qpRange2 o_3@@101)) (= (invRecv2 o_3@@101) o_3@@101)))
 :qid |stdinbpl.1126:22|
 :skolemid |139|
 :pattern ( (invRecv2 o_3@@101))
))) (and (=> (= (ControlFlow 0 265) (- 0 266)) (forall ((x_3@@2 T@U) ) (!  (=> (and (= (type x_3@@2) RefType) (U_2_bool (MapType2Select setOfRef x_3@@2))) (>= rd NoPerm))
 :qid |stdinbpl.1132:15|
 :skolemid |140|
 :pattern ( (MapType0Select Heap@@9 x_3@@2 edges))
 :pattern ( (MapType1Select QPMask@1 x_3@@2 edges))
 :pattern ( (MapType2Select setOfRef x_3@@2))
))) (=> (forall ((x_3@@3 T@U) ) (!  (=> (and (= (type x_3@@3) RefType) (U_2_bool (MapType2Select setOfRef x_3@@3))) (>= rd NoPerm))
 :qid |stdinbpl.1132:15|
 :skolemid |140|
 :pattern ( (MapType0Select Heap@@9 x_3@@3 edges))
 :pattern ( (MapType1Select QPMask@1 x_3@@3 edges))
 :pattern ( (MapType2Select setOfRef x_3@@3))
)) (=> (forall ((x_3@@4 T@U) ) (!  (=> (= (type x_3@@4) RefType) (=> (and (U_2_bool (MapType2Select setOfRef x_3@@4)) (> rd NoPerm)) (not (= x_3@@4 null))))
 :qid |stdinbpl.1138:22|
 :skolemid |141|
 :pattern ( (MapType0Select Heap@@9 x_3@@4 edges))
 :pattern ( (MapType1Select QPMask@1 x_3@@4 edges))
 :pattern ( (MapType2Select setOfRef x_3@@4))
)) (=> (and (and (forall ((o_3@@102 T@U) ) (!  (=> (= (type o_3@@102) RefType) (and (=> (and (and (U_2_bool (MapType2Select setOfRef (invRecv2 o_3@@102))) (< NoPerm rd)) (qpRange2 o_3@@102)) (and (=> (< NoPerm rd) (= (invRecv2 o_3@@102) o_3@@102)) (= (U_2_real (MapType1Select QPMask@1 o_3@@102 edges)) (+ (U_2_real (MapType1Select QPMask@0 o_3@@102 edges)) rd)))) (=> (not (and (and (U_2_bool (MapType2Select setOfRef (invRecv2 o_3@@102))) (< NoPerm rd)) (qpRange2 o_3@@102))) (= (U_2_real (MapType1Select QPMask@1 o_3@@102 edges)) (U_2_real (MapType1Select QPMask@0 o_3@@102 edges))))))
 :qid |stdinbpl.1144:22|
 :skolemid |142|
 :pattern ( (MapType1Select QPMask@1 o_3@@102 edges))
)) (forall ((o_3@@103 T@U) (f_5@@33 T@U) ) (! (let ((B@@45 (FieldTypeInv1 (type f_5@@33))))
(let ((A@@46 (FieldTypeInv0 (type f_5@@33))))
 (=> (and (and (= (type o_3@@103) RefType) (= (type f_5@@33) (FieldType A@@46 B@@45))) (not (= f_5@@33 edges))) (= (U_2_real (MapType1Select QPMask@0 o_3@@103 f_5@@33)) (U_2_real (MapType1Select QPMask@1 o_3@@103 f_5@@33))))))
 :qid |stdinbpl.1148:29|
 :skolemid |143|
 :pattern ( (MapType1Select QPMask@0 o_3@@103 f_5@@33))
 :pattern ( (MapType1Select QPMask@1 o_3@@103 f_5@@33))
))) (and (state Heap@@9 QPMask@1) (state Heap@@9 QPMask@1))) (and (and (=> (= (ControlFlow 0 265) 264) anon144_Else_correct) (=> (= (ControlFlow 0 265) 7) anon145_Then_correct)) (=> (= (ControlFlow 0 265) 9) anon145_Else_correct)))))))))))
(let ((anon143_Then_correct true))
(let ((anon142_Else_correct  (and (=> (= (ControlFlow 0 268) (- 0 270)) (forall ((x_1 T@U) (x_1_1 T@U) ) (!  (=> (and (= (type x_1) RefType) (= (type x_1_1) RefType)) (=> (and (and (and (and (not (= x_1 x_1_1)) (U_2_bool (MapType2Select setOfRef x_1))) (U_2_bool (MapType2Select setOfRef x_1_1))) (< NoPerm rd)) (< NoPerm rd)) (not (= x_1 x_1_1))))
 :qid |stdinbpl.1070:15|
 :skolemid |130|
 :no-pattern (type x_1)
 :no-pattern (type x_1_1)
 :no-pattern (U_2_int x_1)
 :no-pattern (U_2_bool x_1)
 :no-pattern (U_2_int x_1_1)
 :no-pattern (U_2_bool x_1_1)
))) (=> (forall ((x_1@@0 T@U) (x_1_1@@0 T@U) ) (!  (=> (and (= (type x_1@@0) RefType) (= (type x_1_1@@0) RefType)) (=> (and (and (and (and (not (= x_1@@0 x_1_1@@0)) (U_2_bool (MapType2Select setOfRef x_1@@0))) (U_2_bool (MapType2Select setOfRef x_1_1@@0))) (< NoPerm rd)) (< NoPerm rd)) (not (= x_1@@0 x_1_1@@0))))
 :qid |stdinbpl.1070:15|
 :skolemid |130|
 :no-pattern (type x_1@@0)
 :no-pattern (type x_1_1@@0)
 :no-pattern (U_2_int x_1@@0)
 :no-pattern (U_2_bool x_1@@0)
 :no-pattern (U_2_int x_1_1@@0)
 :no-pattern (U_2_bool x_1_1@@0)
)) (=> (and (forall ((x_1@@1 T@U) ) (!  (=> (= (type x_1@@1) RefType) (=> (and (U_2_bool (MapType2Select setOfRef x_1@@1)) (< NoPerm rd)) (and (qpRange1 x_1@@1) (= (invRecv1 x_1@@1) x_1@@1))))
 :qid |stdinbpl.1076:22|
 :skolemid |131|
 :pattern ( (MapType0Select Heap@@9 x_1@@1 val))
 :pattern ( (MapType1Select QPMask@0 x_1@@1 val))
 :pattern ( (MapType2Select setOfRef x_1@@1))
)) (forall ((o_3@@104 T@U) ) (!  (=> (= (type o_3@@104) RefType) (=> (and (and (U_2_bool (MapType2Select setOfRef (invRecv1 o_3@@104))) (< NoPerm rd)) (qpRange1 o_3@@104)) (= (invRecv1 o_3@@104) o_3@@104)))
 :qid |stdinbpl.1080:22|
 :skolemid |132|
 :pattern ( (invRecv1 o_3@@104))
))) (and (=> (= (ControlFlow 0 268) (- 0 269)) (forall ((x_1@@2 T@U) ) (!  (=> (and (= (type x_1@@2) RefType) (U_2_bool (MapType2Select setOfRef x_1@@2))) (>= rd NoPerm))
 :qid |stdinbpl.1086:15|
 :skolemid |133|
 :pattern ( (MapType0Select Heap@@9 x_1@@2 val))
 :pattern ( (MapType1Select QPMask@0 x_1@@2 val))
 :pattern ( (MapType2Select setOfRef x_1@@2))
))) (=> (forall ((x_1@@3 T@U) ) (!  (=> (and (= (type x_1@@3) RefType) (U_2_bool (MapType2Select setOfRef x_1@@3))) (>= rd NoPerm))
 :qid |stdinbpl.1086:15|
 :skolemid |133|
 :pattern ( (MapType0Select Heap@@9 x_1@@3 val))
 :pattern ( (MapType1Select QPMask@0 x_1@@3 val))
 :pattern ( (MapType2Select setOfRef x_1@@3))
)) (=> (forall ((x_1@@4 T@U) ) (!  (=> (= (type x_1@@4) RefType) (=> (and (U_2_bool (MapType2Select setOfRef x_1@@4)) (> rd NoPerm)) (not (= x_1@@4 null))))
 :qid |stdinbpl.1092:22|
 :skolemid |134|
 :pattern ( (MapType0Select Heap@@9 x_1@@4 val))
 :pattern ( (MapType1Select QPMask@0 x_1@@4 val))
 :pattern ( (MapType2Select setOfRef x_1@@4))
)) (=> (and (and (forall ((o_3@@105 T@U) ) (!  (=> (= (type o_3@@105) RefType) (and (=> (and (and (U_2_bool (MapType2Select setOfRef (invRecv1 o_3@@105))) (< NoPerm rd)) (qpRange1 o_3@@105)) (and (=> (< NoPerm rd) (= (invRecv1 o_3@@105) o_3@@105)) (= (U_2_real (MapType1Select QPMask@0 o_3@@105 val)) (+ (U_2_real (MapType1Select ZeroMask o_3@@105 val)) rd)))) (=> (not (and (and (U_2_bool (MapType2Select setOfRef (invRecv1 o_3@@105))) (< NoPerm rd)) (qpRange1 o_3@@105))) (= (U_2_real (MapType1Select QPMask@0 o_3@@105 val)) (U_2_real (MapType1Select ZeroMask o_3@@105 val))))))
 :qid |stdinbpl.1098:22|
 :skolemid |135|
 :pattern ( (MapType1Select QPMask@0 o_3@@105 val))
)) (forall ((o_3@@106 T@U) (f_5@@34 T@U) ) (! (let ((B@@46 (FieldTypeInv1 (type f_5@@34))))
(let ((A@@47 (FieldTypeInv0 (type f_5@@34))))
 (=> (and (and (= (type o_3@@106) RefType) (= (type f_5@@34) (FieldType A@@47 B@@46))) (not (= f_5@@34 val))) (= (U_2_real (MapType1Select ZeroMask o_3@@106 f_5@@34)) (U_2_real (MapType1Select QPMask@0 o_3@@106 f_5@@34))))))
 :qid |stdinbpl.1102:29|
 :skolemid |136|
 :pattern ( (MapType1Select ZeroMask o_3@@106 f_5@@34))
 :pattern ( (MapType1Select QPMask@0 o_3@@106 f_5@@34))
))) (and (state Heap@@9 QPMask@0) (state Heap@@9 QPMask@0))) (and (=> (= (ControlFlow 0 268) 2) anon143_Then_correct) (=> (= (ControlFlow 0 268) 265) anon143_Else_correct)))))))))))
(let ((anon142_Then_correct true))
(let ((anon0_correct  (=> (and (state Heap@@9 ZeroMask) (U_2_bool (MapType0Select Heap@@9 this $allocated))) (=> (and (and (and (< NoPerm rd) (state Heap@@9 ZeroMask)) (and (not (= this null)) (state Heap@@9 ZeroMask))) (and (and (U_2_bool (MapType2Select setOfRef this)) (state Heap@@9 ZeroMask)) (and (= (|Set#Card| (|Set#Intersection| setOfRef node_map_image)) 0) (state Heap@@9 ZeroMask)))) (and (=> (= (ControlFlow 0 271) 1) anon142_Then_correct) (=> (= (ControlFlow 0 271) 268) anon142_Else_correct))))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 272) 271) anon0_correct)))
PreconditionGeneratedEntry_correct))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
))
(check-sat)
(pop 1)
; Valid
(get-info :rlimit)
