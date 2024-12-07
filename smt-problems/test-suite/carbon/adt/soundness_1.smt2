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
(declare-fun |Seq#Length| (T@U) Int)
(declare-fun |Seq#Drop| (T@U Int) T@U)
(declare-fun SeqTypeInv0 (T@T) T@T)
(declare-fun SeqType (T@T) T@T)
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
(declare-fun state (T@U T@U) Bool)
(declare-fun MapType1Type (T@T T@T) T@T)
(declare-fun GoodMask (T@U) Bool)
(declare-fun MapType1TypeInv0 (T@T) T@T)
(declare-fun MapType1TypeInv1 (T@T) T@T)
(declare-fun MapType1Select (T@U T@U T@U) T@U)
(declare-fun MapType1Store (T@U T@U T@U T@U) T@U)
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
(declare-fun |Seq#Take| (T@U Int) T@U)
(declare-fun Node3 (T@U T@U T@U T@U) T@U)
(declare-fun Tree3DomainTypeType (T@T) T@T)
(declare-fun get_Tree3_value (T@U) T@U)
(declare-fun Tree3DomainTypeTypeInv0 (T@T) T@T)
(declare-fun get_Tree3_left (T@U) T@U)
(declare-fun get_Tree3_middle (T@U) T@U)
(declare-fun get_Tree3_right (T@U) T@U)
(declare-fun Entity2 (T@U T@U T@U T@U) T@U)
(declare-fun SpecialListDomainTypeTypeInv1 (T@T) T@T)
(declare-fun SpecialListDomainTypeType (T@T T@T) T@T)
(declare-fun kTreeDomainTypeType (T@T) T@T)
(declare-fun get_Mixed_t3 (T@U) T@U)
(declare-fun SpecialListDomainTypeTypeInv0 (T@T) T@T)
(declare-fun kTreeDomainTypeTypeInv0 (T@T) T@T)
(declare-fun MixedDomainTypeType (T@T T@T) T@T)
(declare-fun MixedDomainTypeTypeInv0 (T@T) T@T)
(declare-fun MixedDomainTypeTypeInv1 (T@T) T@T)
(declare-fun get_Mixed_spl1 (T@U) T@U)
(declare-fun get_Mixed_spl2 (T@U) T@U)
(declare-fun get_Mixed_kt (T@U) T@U)
(declare-fun SimpleList_tag (T@U) Int)
(declare-fun get_SimpleList_value (T@U) Int)
(declare-fun get_SimpleList_tail (T@U) T@U)
(declare-fun SimpleListDomainTypeType () T@T)
(declare-fun SimpleNil () T@U)
(declare-fun SimpleCons (Int T@U) T@U)
(declare-fun List_tag (T@U) Int)
(declare-fun get_List_value (T@U) T@U)
(declare-fun get_List_tail (T@U) T@U)
(declare-fun ListDomainTypeTypeInv0 (T@T) T@T)
(declare-fun ListDomainTypeType (T@T) T@T)
(declare-fun Nil (T@T) T@U)
(declare-fun Cons (T@U T@U) T@U)
(declare-fun kTree_tag (T@U) Int)
(declare-fun get_kTree_value (T@U) T@U)
(declare-fun get_kTree_children (T@U) T@U)
(declare-fun kLeaf (T@T) T@U)
(declare-fun kNode (T@U T@U) T@U)
(declare-fun |Seq#Equal| (T@U T@U) Bool)
(declare-fun |Seq#Contains| (T@U T@U) Bool)
(declare-fun |Seq#Range| (Int Int) T@U)
(declare-fun Tree3_tag (T@U) Int)
(declare-fun Mixed_tag (T@U) Int)
(declare-fun |Seq#Skolem| (T@U T@U) Int)
(declare-fun SpecialList_tag (T@U) Int)
(declare-fun get_SpecialList_elemS (T@U) T@U)
(declare-fun get_SpecialList_tailS (T@U) T@U)
(declare-fun SpecialNil (T@T T@T) T@U)
(declare-fun TCons (T@U T@U) T@U)
(declare-fun get_SpecialList_elemT (T@U) T@U)
(declare-fun get_SpecialList_tailT (T@U) T@U)
(declare-fun SCons (T@U T@U) T@U)
(declare-fun $allocated () T@U)
(declare-fun NormalFieldType () T@T)
(declare-fun |Seq#Singleton| (T@U) T@U)
(declare-fun Node (T@U T@U T@U) T@U)
(declare-fun TreeDomainTypeType (T@T) T@T)
(declare-fun Tree_tag (T@U) Int)
(declare-fun TreeDomainTypeTypeInv0 (T@T) T@T)
(declare-fun Entity1 (T@U T@U T@U) T@U)
(declare-fun |Seq#Empty| (T@T) T@U)
(declare-fun dummyHeap () T@U)
(declare-fun ZeroMask () T@U)
(declare-fun InsidePredicate (T@U T@U T@U T@U) Bool)
(declare-fun |Seq#Append| (T@U T@U) T@U)
(declare-fun sumMask (T@U T@U T@U) Bool)
(declare-fun get_Tree_value (T@U) T@U)
(declare-fun get_Tree_left (T@U) T@U)
(declare-fun get_Tree_right (T@U) T@U)
(declare-fun Leaf (T@T) T@U)
(declare-fun ConditionalFrame (Real T@U) T@U)
(declare-fun EmptyFrame () T@U)
(declare-fun NoPerm () Real)
(declare-fun Leaf3 (T@T) T@U)
(declare-fun |Seq#ContainsTrigger| (T@U T@U) Bool)
(declare-fun FullPerm () Real)
(declare-fun get_Mixed_sl (T@U) T@U)
(declare-fun get_Mixed_ls (T@U) T@U)
(declare-fun get_Mixed_lt (T@U) T@U)
(declare-fun ZeroPMask () T@U)
(declare-fun |Seq#SkolemDiff| (T@U T@U) Int)
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
(assert  (and (and (forall ((arg0@@11 T@T) ) (! (= (Ctor (SeqType arg0@@11)) 6)
 :qid |ctor:SeqType|
)) (forall ((arg0@@12 T@T) ) (! (= (SeqTypeInv0 (SeqType arg0@@12)) arg0@@12)
 :qid |typeInv:SeqTypeInv0|
 :pattern ( (SeqType arg0@@12))
))) (forall ((arg0@@13 T@U) (arg1 Int) ) (! (let ((T (SeqTypeInv0 (type arg0@@13))))
(= (type (|Seq#Drop| arg0@@13 arg1)) (SeqType T)))
 :qid |funType:Seq#Drop|
 :pattern ( (|Seq#Drop| arg0@@13 arg1))
))))
(assert (forall ((s T@U) (n Int) ) (! (let ((T@@0 (SeqTypeInv0 (type s))))
 (=> (= (type s) (SeqType T@@0)) (and (=> (<= 0 n) (and (=> (<= n (|Seq#Length| s)) (= (|Seq#Length| (|Seq#Drop| s n)) (- (|Seq#Length| s) n))) (=> (< (|Seq#Length| s) n) (= (|Seq#Length| (|Seq#Drop| s n)) 0)))) (=> (< n 0) (= (|Seq#Length| (|Seq#Drop| s n)) (|Seq#Length| s))))))
 :qid |stdinbpl.271:18|
 :skolemid |38|
 :pattern ( (|Seq#Length| (|Seq#Drop| s n)))
 :pattern ( (|Seq#Length| s) (|Seq#Drop| s n))
)))
(assert  (and (and (and (and (and (and (and (and (and (forall ((arg0@@14 T@T) ) (! (= (Ctor (MapType0Type arg0@@14)) 7)
 :qid |ctor:MapType0Type|
)) (forall ((arg0@@15 T@T) ) (! (= (MapType0TypeInv0 (MapType0Type arg0@@15)) arg0@@15)
 :qid |typeInv:MapType0TypeInv0|
 :pattern ( (MapType0Type arg0@@15))
))) (forall ((arg0@@16 T@T) (arg1@@0 T@T) ) (! (= (Ctor (FieldType arg0@@16 arg1@@0)) 8)
 :qid |ctor:FieldType|
))) (forall ((arg0@@17 T@T) (arg1@@1 T@T) ) (! (= (FieldTypeInv0 (FieldType arg0@@17 arg1@@1)) arg0@@17)
 :qid |typeInv:FieldTypeInv0|
 :pattern ( (FieldType arg0@@17 arg1@@1))
))) (forall ((arg0@@18 T@T) (arg1@@2 T@T) ) (! (= (FieldTypeInv1 (FieldType arg0@@18 arg1@@2)) arg1@@2)
 :qid |typeInv:FieldTypeInv1|
 :pattern ( (FieldType arg0@@18 arg1@@2))
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
)))) (= (Ctor RefType) 9)))
(assert (forall ((Heap0 T@U) (Heap1 T@U) ) (!  (=> (and (and (= (type Heap0) (MapType0Type RefType)) (= (type Heap1) (MapType0Type RefType))) (succHeap Heap0 Heap1)) (succHeapTrans Heap0 Heap1))
 :qid |stdinbpl.88:15|
 :skolemid |11|
 :pattern ( (succHeap Heap0 Heap1))
)))
(assert  (and (and (and (and (and (and (forall ((arg0@@21 T@T) (arg1@@5 T@T) ) (! (= (Ctor (MapType1Type arg0@@21 arg1@@5)) 10)
 :qid |ctor:MapType1Type|
)) (forall ((arg0@@22 T@T) (arg1@@6 T@T) ) (! (= (MapType1TypeInv0 (MapType1Type arg0@@22 arg1@@6)) arg0@@22)
 :qid |typeInv:MapType1TypeInv0|
 :pattern ( (MapType1Type arg0@@22 arg1@@6))
))) (forall ((arg0@@23 T@T) (arg1@@7 T@T) ) (! (= (MapType1TypeInv1 (MapType1Type arg0@@23 arg1@@7)) arg1@@7)
 :qid |typeInv:MapType1TypeInv1|
 :pattern ( (MapType1Type arg0@@23 arg1@@7))
))) (forall ((arg0@@24 T@U) (arg1@@8 T@U) (arg2@@1 T@U) ) (! (let ((aVar1 (MapType1TypeInv1 (type arg0@@24))))
(= (type (MapType1Select arg0@@24 arg1@@8 arg2@@1)) aVar1))
 :qid |funType:MapType1Select|
 :pattern ( (MapType1Select arg0@@24 arg1@@8 arg2@@1))
))) (forall ((arg0@@25 T@U) (arg1@@9 T@U) (arg2@@2 T@U) (arg3@@0 T@U) ) (! (let ((aVar1@@0 (type arg3@@0)))
(let ((aVar0@@0 (type arg1@@9)))
(= (type (MapType1Store arg0@@25 arg1@@9 arg2@@2 arg3@@0)) (MapType1Type aVar0@@0 aVar1@@0))))
 :qid |funType:MapType1Store|
 :pattern ( (MapType1Store arg0@@25 arg1@@9 arg2@@2 arg3@@0))
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
(assert (forall ((arg0@@26 T@U) (arg1@@10 Int) ) (! (let ((T@@1 (SeqTypeInv0 (type arg0@@26))))
(= (type (|Seq#Index| arg0@@26 arg1@@10)) T@@1))
 :qid |funType:Seq#Index|
 :pattern ( (|Seq#Index| arg0@@26 arg1@@10))
)))
(assert (forall ((s@@0 T@U) (n@@0 Int) (j Int) ) (! (let ((T@@2 (SeqTypeInv0 (type s@@0))))
 (=> (= (type s@@0) (SeqType T@@2)) (=> (and (and (< 0 n@@0) (<= 0 j)) (< j (- (|Seq#Length| s@@0) n@@0))) (and (= (|Seq#Sub| (|Seq#Add| j n@@0) n@@0) j) (= (|Seq#Index| (|Seq#Drop| s@@0 n@@0) j) (|Seq#Index| s@@0 (|Seq#Add| j n@@0)))))))
 :qid |stdinbpl.292:18|
 :skolemid |39|
 :pattern ( (|Seq#Index| (|Seq#Drop| s@@0 n@@0) j))
)))
(assert  (and (and (= (Ctor FrameTypeType) 11) (= (type null) RefType)) (forall ((arg0@@27 T@U) ) (! (let ((A (FieldTypeInv0 (type arg0@@27))))
(= (type (PredicateMaskField arg0@@27)) (FieldType A (MapType1Type RefType boolType))))
 :qid |funType:PredicateMaskField|
 :pattern ( (PredicateMaskField arg0@@27))
))))
(assert (forall ((Heap@@0 T@U) (ExhaleHeap T@U) (Mask@@0 T@U) (pm_f T@U) ) (! (let ((C (FieldTypeInv0 (type pm_f))))
 (=> (and (and (and (and (and (= (type Heap@@0) (MapType0Type RefType)) (= (type ExhaleHeap) (MapType0Type RefType))) (= (type Mask@@0) (MapType1Type RefType realType))) (= (type pm_f) (FieldType C FrameTypeType))) (IdenticalOnKnownLocations Heap@@0 ExhaleHeap Mask@@0)) (and (HasDirectPerm Mask@@0 null pm_f) (IsPredicateField pm_f))) (= (MapType0Select Heap@@0 null (PredicateMaskField pm_f)) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))))
 :qid |stdinbpl.47:19|
 :skolemid |2|
 :pattern ( (IdenticalOnKnownLocations Heap@@0 ExhaleHeap Mask@@0) (IsPredicateField pm_f) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))
)))
(assert (forall ((arg0@@28 T@U) ) (! (let ((A@@0 (FieldTypeInv0 (type arg0@@28))))
(= (type (WandMaskField arg0@@28)) (FieldType A@@0 (MapType1Type RefType boolType))))
 :qid |funType:WandMaskField|
 :pattern ( (WandMaskField arg0@@28))
)))
(assert (forall ((Heap@@1 T@U) (ExhaleHeap@@0 T@U) (Mask@@1 T@U) (pm_f@@0 T@U) ) (! (let ((C@@0 (FieldTypeInv0 (type pm_f@@0))))
 (=> (and (and (and (and (and (= (type Heap@@1) (MapType0Type RefType)) (= (type ExhaleHeap@@0) (MapType0Type RefType))) (= (type Mask@@1) (MapType1Type RefType realType))) (= (type pm_f@@0) (FieldType C@@0 FrameTypeType))) (IdenticalOnKnownLocations Heap@@1 ExhaleHeap@@0 Mask@@1)) (and (HasDirectPerm Mask@@1 null pm_f@@0) (IsWandField pm_f@@0))) (= (MapType0Select Heap@@1 null (WandMaskField pm_f@@0)) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))))
 :qid |stdinbpl.60:19|
 :skolemid |5|
 :pattern ( (IdenticalOnKnownLocations Heap@@1 ExhaleHeap@@0 Mask@@1) (IsWandField pm_f@@0) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))
)))
(assert (forall ((arg0@@29 T@U) (arg1@@11 Int) (arg2@@3 T@U) ) (! (let ((T@@3 (type arg2@@3)))
(= (type (|Seq#Update| arg0@@29 arg1@@11 arg2@@3)) (SeqType T@@3)))
 :qid |funType:Seq#Update|
 :pattern ( (|Seq#Update| arg0@@29 arg1@@11 arg2@@3))
)))
(assert (forall ((s@@1 T@U) (i Int) (v T@U) (n@@1 Int) ) (! (let ((T@@4 (type v)))
 (=> (= (type s@@1) (SeqType T@@4)) (=> (and (<= 0 n@@1) (< n@@1 (|Seq#Length| s@@1))) (and (=> (= i n@@1) (= (|Seq#Index| (|Seq#Update| s@@1 i v) n@@1) v)) (=> (not (= i n@@1)) (= (|Seq#Index| (|Seq#Update| s@@1 i v) n@@1) (|Seq#Index| s@@1 n@@1)))))))
 :qid |stdinbpl.247:18|
 :skolemid |35|
 :pattern ( (|Seq#Index| (|Seq#Update| s@@1 i v) n@@1))
 :pattern ( (|Seq#Index| s@@1 n@@1) (|Seq#Update| s@@1 i v))
)))
(assert (forall ((arg0@@30 T@U) (arg1@@12 Int) ) (! (let ((T@@5 (SeqTypeInv0 (type arg0@@30))))
(= (type (|Seq#Take| arg0@@30 arg1@@12)) (SeqType T@@5)))
 :qid |funType:Seq#Take|
 :pattern ( (|Seq#Take| arg0@@30 arg1@@12))
)))
(assert (forall ((s@@2 T@U) (n@@2 Int) ) (! (let ((T@@6 (SeqTypeInv0 (type s@@2))))
 (=> (= (type s@@2) (SeqType T@@6)) (and (=> (<= 0 n@@2) (and (=> (<= n@@2 (|Seq#Length| s@@2)) (= (|Seq#Length| (|Seq#Take| s@@2 n@@2)) n@@2)) (=> (< (|Seq#Length| s@@2) n@@2) (= (|Seq#Length| (|Seq#Take| s@@2 n@@2)) (|Seq#Length| s@@2))))) (=> (< n@@2 0) (= (|Seq#Length| (|Seq#Take| s@@2 n@@2)) 0)))))
 :qid |stdinbpl.258:18|
 :skolemid |36|
 :pattern ( (|Seq#Length| (|Seq#Take| s@@2 n@@2)))
 :pattern ( (|Seq#Take| s@@2 n@@2) (|Seq#Length| s@@2))
)))
(assert  (and (and (and (forall ((arg0@@31 T@T) ) (! (= (Ctor (Tree3DomainTypeType arg0@@31)) 12)
 :qid |ctor:Tree3DomainTypeType|
)) (forall ((arg0@@32 T@T) ) (! (= (Tree3DomainTypeTypeInv0 (Tree3DomainTypeType arg0@@32)) arg0@@32)
 :qid |typeInv:Tree3DomainTypeTypeInv0|
 :pattern ( (Tree3DomainTypeType arg0@@32))
))) (forall ((arg0@@33 T@U) (arg1@@13 T@U) (arg2@@4 T@U) (arg3@@1 T@U) ) (! (let ((T@@7 (type arg0@@33)))
(= (type (Node3 arg0@@33 arg1@@13 arg2@@4 arg3@@1)) (Tree3DomainTypeType T@@7)))
 :qid |funType:Node3|
 :pattern ( (Node3 arg0@@33 arg1@@13 arg2@@4 arg3@@1))
))) (forall ((arg0@@34 T@U) ) (! (let ((T@@8 (Tree3DomainTypeTypeInv0 (type arg0@@34))))
(= (type (get_Tree3_value arg0@@34)) T@@8))
 :qid |funType:get_Tree3_value|
 :pattern ( (get_Tree3_value arg0@@34))
))))
(assert (forall ((value_1 T@U) (left_1 T@U) (middle_1 T@U) (right_1 T@U) ) (! (let ((T@@9 (type value_1)))
 (=> (and (and (= (type left_1) (Tree3DomainTypeType T@@9)) (= (type middle_1) (Tree3DomainTypeType T@@9))) (= (type right_1) (Tree3DomainTypeType T@@9))) (= value_1 (get_Tree3_value (Node3 value_1 left_1 middle_1 right_1)))))
 :qid |stdinbpl.728:19|
 :skolemid |73|
 :pattern ( (Node3 value_1 left_1 middle_1 right_1))
)))
(assert (forall ((arg0@@35 T@U) ) (! (let ((T@@10 (Tree3DomainTypeTypeInv0 (type arg0@@35))))
(= (type (get_Tree3_left arg0@@35)) (Tree3DomainTypeType T@@10)))
 :qid |funType:get_Tree3_left|
 :pattern ( (get_Tree3_left arg0@@35))
)))
(assert (forall ((value_1@@0 T@U) (left_1@@0 T@U) (middle_1@@0 T@U) (right_1@@0 T@U) ) (! (let ((T@@11 (type value_1@@0)))
 (=> (and (and (= (type left_1@@0) (Tree3DomainTypeType T@@11)) (= (type middle_1@@0) (Tree3DomainTypeType T@@11))) (= (type right_1@@0) (Tree3DomainTypeType T@@11))) (= left_1@@0 (get_Tree3_left (Node3 value_1@@0 left_1@@0 middle_1@@0 right_1@@0)))))
 :qid |stdinbpl.734:19|
 :skolemid |74|
 :pattern ( (Node3 value_1@@0 left_1@@0 middle_1@@0 right_1@@0))
)))
(assert (forall ((arg0@@36 T@U) ) (! (let ((T@@12 (Tree3DomainTypeTypeInv0 (type arg0@@36))))
(= (type (get_Tree3_middle arg0@@36)) (Tree3DomainTypeType T@@12)))
 :qid |funType:get_Tree3_middle|
 :pattern ( (get_Tree3_middle arg0@@36))
)))
(assert (forall ((value_1@@1 T@U) (left_1@@1 T@U) (middle_1@@1 T@U) (right_1@@1 T@U) ) (! (let ((T@@13 (type value_1@@1)))
 (=> (and (and (= (type left_1@@1) (Tree3DomainTypeType T@@13)) (= (type middle_1@@1) (Tree3DomainTypeType T@@13))) (= (type right_1@@1) (Tree3DomainTypeType T@@13))) (= middle_1@@1 (get_Tree3_middle (Node3 value_1@@1 left_1@@1 middle_1@@1 right_1@@1)))))
 :qid |stdinbpl.740:19|
 :skolemid |75|
 :pattern ( (Node3 value_1@@1 left_1@@1 middle_1@@1 right_1@@1))
)))
(assert (forall ((arg0@@37 T@U) ) (! (let ((T@@14 (Tree3DomainTypeTypeInv0 (type arg0@@37))))
(= (type (get_Tree3_right arg0@@37)) (Tree3DomainTypeType T@@14)))
 :qid |funType:get_Tree3_right|
 :pattern ( (get_Tree3_right arg0@@37))
)))
(assert (forall ((value_1@@2 T@U) (left_1@@2 T@U) (middle_1@@2 T@U) (right_1@@2 T@U) ) (! (let ((T@@15 (type value_1@@2)))
 (=> (and (and (= (type left_1@@2) (Tree3DomainTypeType T@@15)) (= (type middle_1@@2) (Tree3DomainTypeType T@@15))) (= (type right_1@@2) (Tree3DomainTypeType T@@15))) (= right_1@@2 (get_Tree3_right (Node3 value_1@@2 left_1@@2 middle_1@@2 right_1@@2)))))
 :qid |stdinbpl.746:19|
 :skolemid |76|
 :pattern ( (Node3 value_1@@2 left_1@@2 middle_1@@2 right_1@@2))
)))
(assert  (and (and (and (and (and (and (and (and (and (forall ((arg0@@38 T@T) (arg1@@14 T@T) ) (! (= (Ctor (SpecialListDomainTypeType arg0@@38 arg1@@14)) 13)
 :qid |ctor:SpecialListDomainTypeType|
)) (forall ((arg0@@39 T@T) (arg1@@15 T@T) ) (! (= (SpecialListDomainTypeTypeInv0 (SpecialListDomainTypeType arg0@@39 arg1@@15)) arg0@@39)
 :qid |typeInv:SpecialListDomainTypeTypeInv0|
 :pattern ( (SpecialListDomainTypeType arg0@@39 arg1@@15))
))) (forall ((arg0@@40 T@T) (arg1@@16 T@T) ) (! (= (SpecialListDomainTypeTypeInv1 (SpecialListDomainTypeType arg0@@40 arg1@@16)) arg1@@16)
 :qid |typeInv:SpecialListDomainTypeTypeInv1|
 :pattern ( (SpecialListDomainTypeType arg0@@40 arg1@@16))
))) (forall ((arg0@@41 T@T) ) (! (= (Ctor (kTreeDomainTypeType arg0@@41)) 14)
 :qid |ctor:kTreeDomainTypeType|
))) (forall ((arg0@@42 T@T) ) (! (= (kTreeDomainTypeTypeInv0 (kTreeDomainTypeType arg0@@42)) arg0@@42)
 :qid |typeInv:kTreeDomainTypeTypeInv0|
 :pattern ( (kTreeDomainTypeType arg0@@42))
))) (forall ((arg0@@43 T@T) (arg1@@17 T@T) ) (! (= (Ctor (MixedDomainTypeType arg0@@43 arg1@@17)) 15)
 :qid |ctor:MixedDomainTypeType|
))) (forall ((arg0@@44 T@T) (arg1@@18 T@T) ) (! (= (MixedDomainTypeTypeInv0 (MixedDomainTypeType arg0@@44 arg1@@18)) arg0@@44)
 :qid |typeInv:MixedDomainTypeTypeInv0|
 :pattern ( (MixedDomainTypeType arg0@@44 arg1@@18))
))) (forall ((arg0@@45 T@T) (arg1@@19 T@T) ) (! (= (MixedDomainTypeTypeInv1 (MixedDomainTypeType arg0@@45 arg1@@19)) arg1@@19)
 :qid |typeInv:MixedDomainTypeTypeInv1|
 :pattern ( (MixedDomainTypeType arg0@@45 arg1@@19))
))) (forall ((arg0@@46 T@U) (arg1@@20 T@U) (arg2@@5 T@U) (arg3@@2 T@U) ) (! (let ((S (SpecialListDomainTypeTypeInv1 (type arg1@@20))))
(let ((T@@16 (Tree3DomainTypeTypeInv0 (type arg0@@46))))
(= (type (Entity2 arg0@@46 arg1@@20 arg2@@5 arg3@@2)) (MixedDomainTypeType T@@16 S))))
 :qid |funType:Entity2|
 :pattern ( (Entity2 arg0@@46 arg1@@20 arg2@@5 arg3@@2))
))) (forall ((arg0@@47 T@U) ) (! (let ((T@@17 (MixedDomainTypeTypeInv0 (type arg0@@47))))
(= (type (get_Mixed_t3 arg0@@47)) (Tree3DomainTypeType T@@17)))
 :qid |funType:get_Mixed_t3|
 :pattern ( (get_Mixed_t3 arg0@@47))
))))
(assert (forall ((t3_1 T@U) (spl1_1 T@U) (spl2_1 T@U) (kt_1 T@U) ) (! (let ((S@@0 (SpecialListDomainTypeTypeInv1 (type spl1_1))))
(let ((T@@18 (Tree3DomainTypeTypeInv0 (type t3_1))))
 (=> (and (and (and (= (type t3_1) (Tree3DomainTypeType T@@18)) (= (type spl1_1) (SpecialListDomainTypeType T@@18 S@@0))) (= (type spl2_1) (SpecialListDomainTypeType S@@0 T@@18))) (= (type kt_1) (kTreeDomainTypeType T@@18))) (= t3_1 (get_Mixed_t3 (Entity2 t3_1 spl1_1 spl2_1 kt_1))))))
 :qid |stdinbpl.956:22|
 :skolemid |96|
 :pattern ( (Entity2 t3_1 spl1_1 spl2_1 kt_1))
)))
(assert (forall ((arg0@@48 T@U) ) (! (let ((S@@1 (MixedDomainTypeTypeInv1 (type arg0@@48))))
(let ((T@@19 (MixedDomainTypeTypeInv0 (type arg0@@48))))
(= (type (get_Mixed_spl1 arg0@@48)) (SpecialListDomainTypeType T@@19 S@@1))))
 :qid |funType:get_Mixed_spl1|
 :pattern ( (get_Mixed_spl1 arg0@@48))
)))
(assert (forall ((t3_1@@0 T@U) (spl1_1@@0 T@U) (spl2_1@@0 T@U) (kt_1@@0 T@U) ) (! (let ((S@@2 (SpecialListDomainTypeTypeInv1 (type spl1_1@@0))))
(let ((T@@20 (Tree3DomainTypeTypeInv0 (type t3_1@@0))))
 (=> (and (and (and (= (type t3_1@@0) (Tree3DomainTypeType T@@20)) (= (type spl1_1@@0) (SpecialListDomainTypeType T@@20 S@@2))) (= (type spl2_1@@0) (SpecialListDomainTypeType S@@2 T@@20))) (= (type kt_1@@0) (kTreeDomainTypeType T@@20))) (= spl1_1@@0 (get_Mixed_spl1 (Entity2 t3_1@@0 spl1_1@@0 spl2_1@@0 kt_1@@0))))))
 :qid |stdinbpl.962:22|
 :skolemid |97|
 :pattern ( (Entity2 t3_1@@0 spl1_1@@0 spl2_1@@0 kt_1@@0))
)))
(assert (forall ((arg0@@49 T@U) ) (! (let ((S@@3 (MixedDomainTypeTypeInv1 (type arg0@@49))))
(let ((T@@21 (MixedDomainTypeTypeInv0 (type arg0@@49))))
(= (type (get_Mixed_spl2 arg0@@49)) (SpecialListDomainTypeType S@@3 T@@21))))
 :qid |funType:get_Mixed_spl2|
 :pattern ( (get_Mixed_spl2 arg0@@49))
)))
(assert (forall ((t3_1@@1 T@U) (spl1_1@@1 T@U) (spl2_1@@1 T@U) (kt_1@@1 T@U) ) (! (let ((S@@4 (SpecialListDomainTypeTypeInv1 (type spl1_1@@1))))
(let ((T@@22 (Tree3DomainTypeTypeInv0 (type t3_1@@1))))
 (=> (and (and (and (= (type t3_1@@1) (Tree3DomainTypeType T@@22)) (= (type spl1_1@@1) (SpecialListDomainTypeType T@@22 S@@4))) (= (type spl2_1@@1) (SpecialListDomainTypeType S@@4 T@@22))) (= (type kt_1@@1) (kTreeDomainTypeType T@@22))) (= spl2_1@@1 (get_Mixed_spl2 (Entity2 t3_1@@1 spl1_1@@1 spl2_1@@1 kt_1@@1))))))
 :qid |stdinbpl.968:22|
 :skolemid |98|
 :pattern ( (Entity2 t3_1@@1 spl1_1@@1 spl2_1@@1 kt_1@@1))
)))
(assert (forall ((arg0@@50 T@U) ) (! (let ((T@@23 (MixedDomainTypeTypeInv0 (type arg0@@50))))
(= (type (get_Mixed_kt arg0@@50)) (kTreeDomainTypeType T@@23)))
 :qid |funType:get_Mixed_kt|
 :pattern ( (get_Mixed_kt arg0@@50))
)))
(assert (forall ((t3_1@@2 T@U) (spl1_1@@2 T@U) (spl2_1@@2 T@U) (kt_1@@2 T@U) ) (! (let ((S@@5 (SpecialListDomainTypeTypeInv1 (type spl1_1@@2))))
(let ((T@@24 (Tree3DomainTypeTypeInv0 (type t3_1@@2))))
 (=> (and (and (and (= (type t3_1@@2) (Tree3DomainTypeType T@@24)) (= (type spl1_1@@2) (SpecialListDomainTypeType T@@24 S@@5))) (= (type spl2_1@@2) (SpecialListDomainTypeType S@@5 T@@24))) (= (type kt_1@@2) (kTreeDomainTypeType T@@24))) (= kt_1@@2 (get_Mixed_kt (Entity2 t3_1@@2 spl1_1@@2 spl2_1@@2 kt_1@@2))))))
 :qid |stdinbpl.974:22|
 :skolemid |99|
 :pattern ( (Entity2 t3_1@@2 spl1_1@@2 spl2_1@@2 kt_1@@2))
)))
(assert  (and (and (and (= (Ctor SimpleListDomainTypeType) 16) (forall ((arg0@@51 T@U) ) (! (= (type (get_SimpleList_tail arg0@@51)) SimpleListDomainTypeType)
 :qid |funType:get_SimpleList_tail|
 :pattern ( (get_SimpleList_tail arg0@@51))
))) (= (type SimpleNil) SimpleListDomainTypeType)) (forall ((arg0@@52 Int) (arg1@@21 T@U) ) (! (= (type (SimpleCons arg0@@52 arg1@@21)) SimpleListDomainTypeType)
 :qid |funType:SimpleCons|
 :pattern ( (SimpleCons arg0@@52 arg1@@21))
))))
(assert (forall ((t_2 T@U) ) (!  (=> (= (type t_2) SimpleListDomainTypeType) (or (= t_2 SimpleNil) (= t_2 (SimpleCons (get_SimpleList_value t_2) (get_SimpleList_tail t_2)))))
 :qid |stdinbpl.581:15|
 :skolemid |61|
 :pattern ( (SimpleList_tag t_2))
 :pattern ( (get_SimpleList_value t_2))
 :pattern ( (get_SimpleList_tail t_2))
)))
(assert  (and (and (and (and (and (forall ((arg0@@53 T@T) ) (! (= (Ctor (ListDomainTypeType arg0@@53)) 17)
 :qid |ctor:ListDomainTypeType|
)) (forall ((arg0@@54 T@T) ) (! (= (ListDomainTypeTypeInv0 (ListDomainTypeType arg0@@54)) arg0@@54)
 :qid |typeInv:ListDomainTypeTypeInv0|
 :pattern ( (ListDomainTypeType arg0@@54))
))) (forall ((arg0@@55 T@U) ) (! (let ((T@@25 (ListDomainTypeTypeInv0 (type arg0@@55))))
(= (type (get_List_value arg0@@55)) T@@25))
 :qid |funType:get_List_value|
 :pattern ( (get_List_value arg0@@55))
))) (forall ((arg0@@56 T@U) ) (! (let ((T@@26 (ListDomainTypeTypeInv0 (type arg0@@56))))
(= (type (get_List_tail arg0@@56)) (ListDomainTypeType T@@26)))
 :qid |funType:get_List_tail|
 :pattern ( (get_List_tail arg0@@56))
))) (forall ((T@@27 T@T) ) (! (= (type (Nil T@@27)) (ListDomainTypeType T@@27))
 :qid |funType:Nil|
 :pattern ( (Nil T@@27))
))) (forall ((arg0@@57 T@U) (arg1@@22 T@U) ) (! (let ((T@@28 (type arg0@@57)))
(= (type (Cons arg0@@57 arg1@@22)) (ListDomainTypeType T@@28)))
 :qid |funType:Cons|
 :pattern ( (Cons arg0@@57 arg1@@22))
))))
(assert (forall ((t_2@@0 T@U) ) (! (let ((T@@29 (ListDomainTypeTypeInv0 (type t_2@@0))))
 (=> (= (type t_2@@0) (ListDomainTypeType T@@29)) (or (= t_2@@0 (Nil T@@29)) (= t_2@@0 (Cons (get_List_value t_2@@0) (get_List_tail t_2@@0))))))
 :qid |stdinbpl.633:19|
 :skolemid |66|
 :pattern ( (List_tag t_2@@0))
 :pattern ( (get_List_value t_2@@0))
 :pattern ( (get_List_tail t_2@@0))
)))
(assert  (and (and (and (forall ((arg0@@58 T@U) ) (! (let ((T@@30 (kTreeDomainTypeTypeInv0 (type arg0@@58))))
(= (type (get_kTree_value arg0@@58)) T@@30))
 :qid |funType:get_kTree_value|
 :pattern ( (get_kTree_value arg0@@58))
)) (forall ((arg0@@59 T@U) ) (! (let ((T@@31 (kTreeDomainTypeTypeInv0 (type arg0@@59))))
(= (type (get_kTree_children arg0@@59)) (SeqType (kTreeDomainTypeType T@@31))))
 :qid |funType:get_kTree_children|
 :pattern ( (get_kTree_children arg0@@59))
))) (forall ((T@@32 T@T) ) (! (= (type (kLeaf T@@32)) (kTreeDomainTypeType T@@32))
 :qid |funType:kLeaf|
 :pattern ( (kLeaf T@@32))
))) (forall ((arg0@@60 T@U) (arg1@@23 T@U) ) (! (let ((T@@33 (type arg0@@60)))
(= (type (kNode arg0@@60 arg1@@23)) (kTreeDomainTypeType T@@33)))
 :qid |funType:kNode|
 :pattern ( (kNode arg0@@60 arg1@@23))
))))
(assert (forall ((t_2@@1 T@U) ) (! (let ((T@@34 (kTreeDomainTypeTypeInv0 (type t_2@@1))))
 (=> (= (type t_2@@1) (kTreeDomainTypeType T@@34)) (or (= t_2@@1 (kLeaf T@@34)) (= t_2@@1 (kNode (get_kTree_value t_2@@1) (get_kTree_children t_2@@1))))))
 :qid |stdinbpl.895:19|
 :skolemid |92|
 :pattern ( (kTree_tag t_2@@1))
 :pattern ( (get_kTree_value t_2@@1))
 :pattern ( (get_kTree_children t_2@@1))
)))
(assert (forall ((value_1@@3 T@U) (children_1 T@U) ) (! (let ((T@@35 (type value_1@@3)))
 (=> (= (type children_1) (SeqType (kTreeDomainTypeType T@@35))) (|Seq#Equal| children_1 (get_kTree_children (kNode value_1@@3 children_1)))))
 :qid |stdinbpl.877:19|
 :skolemid |89|
 :pattern ( (kNode value_1@@3 children_1))
)))
(assert (forall ((arg0@@61 Int) (arg1@@24 Int) ) (! (= (type (|Seq#Range| arg0@@61 arg1@@24)) (SeqType intType))
 :qid |funType:Seq#Range|
 :pattern ( (|Seq#Range| arg0@@61 arg1@@24))
)))
(assert (forall ((q@min Int) (q@max Int) (v@@0 T@U) ) (!  (=> (= (type v@@0) intType) (= (|Seq#Contains| (|Seq#Range| q@min q@max) v@@0)  (and (<= q@min (U_2_int v@@0)) (< (U_2_int v@@0) q@max))))
 :qid |stdinbpl.531:15|
 :skolemid |57|
 :pattern ( (|Seq#Contains| (|Seq#Range| q@min q@max) v@@0))
)))
(assert (forall ((value_1@@4 T@U) (left_1@@3 T@U) (middle_1@@3 T@U) (right_1@@3 T@U) ) (! (let ((T@@36 (type value_1@@4)))
 (=> (and (and (= (type left_1@@3) (Tree3DomainTypeType T@@36)) (= (type middle_1@@3) (Tree3DomainTypeType T@@36))) (= (type right_1@@3) (Tree3DomainTypeType T@@36))) (= (Tree3_tag (Node3 value_1@@4 left_1@@3 middle_1@@3 right_1@@3)) 1)))
 :qid |stdinbpl.758:19|
 :skolemid |78|
 :pattern ( (Node3 value_1@@4 left_1@@3 middle_1@@3 right_1@@3))
)))
(assert (forall ((t3_1@@3 T@U) (spl1_1@@3 T@U) (spl2_1@@3 T@U) (kt_1@@3 T@U) ) (! (let ((S@@6 (SpecialListDomainTypeTypeInv1 (type spl1_1@@3))))
(let ((T@@37 (Tree3DomainTypeTypeInv0 (type t3_1@@3))))
 (=> (and (and (and (= (type t3_1@@3) (Tree3DomainTypeType T@@37)) (= (type spl1_1@@3) (SpecialListDomainTypeType T@@37 S@@6))) (= (type spl2_1@@3) (SpecialListDomainTypeType S@@6 T@@37))) (= (type kt_1@@3) (kTreeDomainTypeType T@@37))) (= (Mixed_tag (Entity2 t3_1@@3 spl1_1@@3 spl2_1@@3 kt_1@@3)) 1))))
 :qid |stdinbpl.986:22|
 :skolemid |101|
 :pattern ( (Entity2 t3_1@@3 spl1_1@@3 spl2_1@@3 kt_1@@3))
)))
(assert (forall ((s@@3 T@U) (x@@8 T@U) ) (! (let ((T@@38 (type x@@8)))
 (=> (and (= (type s@@3) (SeqType T@@38)) (|Seq#Contains| s@@3 x@@8)) (and (and (<= 0 (|Seq#Skolem| s@@3 x@@8)) (< (|Seq#Skolem| s@@3 x@@8) (|Seq#Length| s@@3))) (= (|Seq#Index| s@@3 (|Seq#Skolem| s@@3 x@@8)) x@@8))))
 :qid |stdinbpl.389:18|
 :skolemid |47|
 :pattern ( (|Seq#Contains| s@@3 x@@8))
)))
(assert  (and (and (and (and (and (and (forall ((arg0@@62 T@U) ) (! (let ((S@@7 (SpecialListDomainTypeTypeInv1 (type arg0@@62))))
(= (type (get_SpecialList_elemS arg0@@62)) S@@7))
 :qid |funType:get_SpecialList_elemS|
 :pattern ( (get_SpecialList_elemS arg0@@62))
)) (forall ((arg0@@63 T@U) ) (! (let ((S@@8 (SpecialListDomainTypeTypeInv1 (type arg0@@63))))
(let ((T@@39 (SpecialListDomainTypeTypeInv0 (type arg0@@63))))
(= (type (get_SpecialList_tailS arg0@@63)) (SpecialListDomainTypeType T@@39 S@@8))))
 :qid |funType:get_SpecialList_tailS|
 :pattern ( (get_SpecialList_tailS arg0@@63))
))) (forall ((T@@40 T@T) (S@@9 T@T) ) (! (= (type (SpecialNil T@@40 S@@9)) (SpecialListDomainTypeType T@@40 S@@9))
 :qid |funType:SpecialNil|
 :pattern ( (SpecialNil T@@40 S@@9))
))) (forall ((arg0@@64 T@U) (arg1@@25 T@U) ) (! (let ((S@@10 (SpecialListDomainTypeTypeInv1 (type arg1@@25))))
(let ((T@@41 (type arg0@@64)))
(= (type (TCons arg0@@64 arg1@@25)) (SpecialListDomainTypeType T@@41 S@@10))))
 :qid |funType:TCons|
 :pattern ( (TCons arg0@@64 arg1@@25))
))) (forall ((arg0@@65 T@U) ) (! (let ((T@@42 (SpecialListDomainTypeTypeInv0 (type arg0@@65))))
(= (type (get_SpecialList_elemT arg0@@65)) T@@42))
 :qid |funType:get_SpecialList_elemT|
 :pattern ( (get_SpecialList_elemT arg0@@65))
))) (forall ((arg0@@66 T@U) ) (! (let ((S@@11 (SpecialListDomainTypeTypeInv1 (type arg0@@66))))
(let ((T@@43 (SpecialListDomainTypeTypeInv0 (type arg0@@66))))
(= (type (get_SpecialList_tailT arg0@@66)) (SpecialListDomainTypeType T@@43 S@@11))))
 :qid |funType:get_SpecialList_tailT|
 :pattern ( (get_SpecialList_tailT arg0@@66))
))) (forall ((arg0@@67 T@U) (arg1@@26 T@U) ) (! (let ((T@@44 (SpecialListDomainTypeTypeInv0 (type arg1@@26))))
(let ((S@@12 (type arg0@@67)))
(= (type (SCons arg0@@67 arg1@@26)) (SpecialListDomainTypeType T@@44 S@@12))))
 :qid |funType:SCons|
 :pattern ( (SCons arg0@@67 arg1@@26))
))))
(assert (forall ((t_2@@2 T@U) ) (! (let ((S@@13 (SpecialListDomainTypeTypeInv1 (type t_2@@2))))
(let ((T@@45 (SpecialListDomainTypeTypeInv0 (type t_2@@2))))
 (=> (= (type t_2@@2) (SpecialListDomainTypeType T@@45 S@@13)) (or (or (= t_2@@2 (SpecialNil T@@45 S@@13)) (= t_2@@2 (TCons (get_SpecialList_elemT t_2@@2) (get_SpecialList_tailT t_2@@2)))) (= t_2@@2 (SCons (get_SpecialList_elemS t_2@@2) (get_SpecialList_tailS t_2@@2)))))))
 :qid |stdinbpl.843:22|
 :skolemid |87|
 :pattern ( (SpecialList_tag t_2@@2))
 :pattern ( (get_SpecialList_elemS t_2@@2))
 :pattern ( (get_SpecialList_tailS t_2@@2))
)))
(assert  (and (= (Ctor NormalFieldType) 18) (= (type $allocated) (FieldType NormalFieldType boolType))))
(assert (forall ((Heap@@2 T@U) (ExhaleHeap@@1 T@U) (Mask@@2 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@2) (MapType0Type RefType)) (= (type ExhaleHeap@@1) (MapType0Type RefType))) (= (type Mask@@2) (MapType1Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@2 ExhaleHeap@@1 Mask@@2)) (U_2_bool (MapType0Select Heap@@2 o_1 $allocated))) (U_2_bool (MapType0Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.73:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@2 ExhaleHeap@@1 Mask@@2) (MapType0Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert (forall ((s@@4 T@U) (n@@3 Int) ) (! (let ((T@@46 (SeqTypeInv0 (type s@@4))))
 (=> (and (= (type s@@4) (SeqType T@@46)) (<= n@@3 0)) (= (|Seq#Drop| s@@4 n@@3) s@@4)))
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
(assert (forall ((arg0@@68 T@U) ) (! (let ((T@@47 (type arg0@@68)))
(= (type (|Seq#Singleton| arg0@@68)) (SeqType T@@47)))
 :qid |funType:Seq#Singleton|
 :pattern ( (|Seq#Singleton| arg0@@68))
)))
(assert (forall ((x@@9 T@U) (y@@1 T@U) ) (! (let ((T@@48 (type x@@9)))
 (=> (= (type y@@1) T@@48) (= (|Seq#Contains| (|Seq#Singleton| x@@9) y@@1) (= x@@9 y@@1))))
 :qid |stdinbpl.514:18|
 :skolemid |54|
 :pattern ( (|Seq#Contains| (|Seq#Singleton| x@@9) y@@1))
)))
(assert  (and (and (forall ((arg0@@69 T@T) ) (! (= (Ctor (TreeDomainTypeType arg0@@69)) 19)
 :qid |ctor:TreeDomainTypeType|
)) (forall ((arg0@@70 T@T) ) (! (= (TreeDomainTypeTypeInv0 (TreeDomainTypeType arg0@@70)) arg0@@70)
 :qid |typeInv:TreeDomainTypeTypeInv0|
 :pattern ( (TreeDomainTypeType arg0@@70))
))) (forall ((arg0@@71 T@U) (arg1@@27 T@U) (arg2@@6 T@U) ) (! (let ((T@@49 (type arg0@@71)))
(= (type (Node arg0@@71 arg1@@27 arg2@@6)) (TreeDomainTypeType T@@49)))
 :qid |funType:Node|
 :pattern ( (Node arg0@@71 arg1@@27 arg2@@6))
))))
(assert (forall ((value_1@@5 T@U) (left_1@@4 T@U) (right_1@@4 T@U) ) (! (let ((T@@50 (type value_1@@5)))
 (=> (and (= (type left_1@@4) (TreeDomainTypeType T@@50)) (= (type right_1@@4) (TreeDomainTypeType T@@50))) (= (Tree_tag (Node value_1@@5 left_1@@4 right_1@@4)) 1)))
 :qid |stdinbpl.688:19|
 :skolemid |71|
 :pattern ( (Node value_1@@5 left_1@@4 right_1@@4))
)))
(assert (forall ((arg0@@72 T@U) (arg1@@28 T@U) (arg2@@7 T@U) ) (! (let ((T@@51 (ListDomainTypeTypeInv0 (type arg2@@7))))
(let ((S@@14 (ListDomainTypeTypeInv0 (type arg1@@28))))
(= (type (Entity1 arg0@@72 arg1@@28 arg2@@7)) (MixedDomainTypeType T@@51 S@@14))))
 :qid |funType:Entity1|
 :pattern ( (Entity1 arg0@@72 arg1@@28 arg2@@7))
)))
(assert (forall ((sl_1 T@U) (ls_1 T@U) (lt_1 T@U) ) (! (let ((T@@52 (ListDomainTypeTypeInv0 (type lt_1))))
(let ((S@@15 (ListDomainTypeTypeInv0 (type ls_1))))
 (=> (and (and (= (type sl_1) SimpleListDomainTypeType) (= (type ls_1) (ListDomainTypeType S@@15))) (= (type lt_1) (ListDomainTypeType T@@52))) (= (Mixed_tag (Entity1 sl_1 ls_1 lt_1)) 0))))
 :qid |stdinbpl.980:22|
 :skolemid |100|
 :pattern ( (Entity1 sl_1 ls_1 lt_1))
)))
(assert (forall ((s@@5 T@U) (n@@4 Int) (j@@2 Int) ) (! (let ((T@@53 (SeqTypeInv0 (type s@@5))))
 (=> (= (type s@@5) (SeqType T@@53)) (=> (and (and (<= 0 j@@2) (< j@@2 n@@4)) (< j@@2 (|Seq#Length| s@@5))) (= (|Seq#Index| (|Seq#Take| s@@5 n@@4) j@@2) (|Seq#Index| s@@5 j@@2)))))
 :qid |stdinbpl.266:18|
 :skolemid |37|
 :pattern ( (|Seq#Index| (|Seq#Take| s@@5 n@@4) j@@2))
 :pattern ( (|Seq#Index| s@@5 j@@2) (|Seq#Take| s@@5 n@@4))
)))
(assert (= (SimpleList_tag SimpleNil) 1))
(assert (forall ((Heap@@3 T@U) (ExhaleHeap@@2 T@U) (Mask@@3 T@U) (o_1@@0 T@U) (f_2 T@U) ) (! (let ((B@@1 (FieldTypeInv1 (type f_2))))
(let ((A@@1 (FieldTypeInv0 (type f_2))))
 (=> (and (and (and (and (and (and (= (type Heap@@3) (MapType0Type RefType)) (= (type ExhaleHeap@@2) (MapType0Type RefType))) (= (type Mask@@3) (MapType1Type RefType realType))) (= (type o_1@@0) RefType)) (= (type f_2) (FieldType A@@1 B@@1))) (IdenticalOnKnownLocations Heap@@3 ExhaleHeap@@2 Mask@@3)) (HasDirectPerm Mask@@3 o_1@@0 f_2)) (= (MapType0Select Heap@@3 o_1@@0 f_2) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2)))))
 :qid |stdinbpl.42:22|
 :skolemid |1|
 :pattern ( (IdenticalOnKnownLocations Heap@@3 ExhaleHeap@@2 Mask@@3) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2))
)))
(assert (forall ((T@@54 T@T) ) (! (= (type (|Seq#Empty| T@@54)) (SeqType T@@54))
 :qid |funType:Seq#Empty|
 :pattern ( (|Seq#Empty| T@@54))
)))
(assert (forall ((T@@55 T@T) ) (! (= (|Seq#Length| (|Seq#Empty| T@@55)) 0)
 :skolemid |23|
)))
(assert  (and (= (type dummyHeap) (MapType0Type RefType)) (= (type ZeroMask) (MapType1Type RefType realType))))
(assert (state dummyHeap ZeroMask))
(assert (forall ((p T@U) (v_1 T@U) (w T@U) ) (! (let ((A@@2 (FieldTypeInv0 (type p))))
 (=> (and (and (= (type p) (FieldType A@@2 FrameTypeType)) (= (type v_1) FrameTypeType)) (= (type w) FrameTypeType)) (not (InsidePredicate p v_1 p w))))
 :qid |stdinbpl.170:19|
 :skolemid |21|
 :pattern ( (InsidePredicate p v_1 p w))
)))
(assert (forall ((arg0@@73 T@U) (arg1@@29 T@U) ) (! (let ((T@@56 (SeqTypeInv0 (type arg0@@73))))
(= (type (|Seq#Append| arg0@@73 arg1@@29)) (SeqType T@@56)))
 :qid |funType:Seq#Append|
 :pattern ( (|Seq#Append| arg0@@73 arg1@@29))
)))
(assert (forall ((s0 T@U) (s1 T@U) (n@@5 Int) ) (! (let ((T@@57 (SeqTypeInv0 (type s0))))
 (=> (and (= (type s0) (SeqType T@@57)) (= (type s1) (SeqType T@@57))) (=> (and (and (and (not (= s0 (|Seq#Empty| T@@57))) (not (= s1 (|Seq#Empty| T@@57)))) (<= (|Seq#Length| s0) n@@5)) (< n@@5 (|Seq#Length| (|Seq#Append| s0 s1)))) (and (= (|Seq#Add| (|Seq#Sub| n@@5 (|Seq#Length| s0)) (|Seq#Length| s0)) n@@5) (= (|Seq#Index| (|Seq#Append| s0 s1) n@@5) (|Seq#Index| s1 (|Seq#Sub| n@@5 (|Seq#Length| s0))))))))
 :qid |stdinbpl.238:18|
 :skolemid |32|
 :pattern ( (|Seq#Index| (|Seq#Append| s0 s1) n@@5))
)))
(assert (forall ((Heap@@4 T@U) (ExhaleHeap@@3 T@U) (Mask@@4 T@U) ) (!  (=> (and (and (and (= (type Heap@@4) (MapType0Type RefType)) (= (type ExhaleHeap@@3) (MapType0Type RefType))) (= (type Mask@@4) (MapType1Type RefType realType))) (IdenticalOnKnownLocations Heap@@4 ExhaleHeap@@3 Mask@@4)) (succHeap Heap@@4 ExhaleHeap@@3))
 :qid |stdinbpl.83:15|
 :skolemid |10|
 :pattern ( (IdenticalOnKnownLocations Heap@@4 ExhaleHeap@@3 Mask@@4))
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
(assert  (and (and (and (forall ((arg0@@74 T@U) ) (! (let ((T@@58 (TreeDomainTypeTypeInv0 (type arg0@@74))))
(= (type (get_Tree_value arg0@@74)) T@@58))
 :qid |funType:get_Tree_value|
 :pattern ( (get_Tree_value arg0@@74))
)) (forall ((arg0@@75 T@U) ) (! (let ((T@@59 (TreeDomainTypeTypeInv0 (type arg0@@75))))
(= (type (get_Tree_left arg0@@75)) (TreeDomainTypeType T@@59)))
 :qid |funType:get_Tree_left|
 :pattern ( (get_Tree_left arg0@@75))
))) (forall ((arg0@@76 T@U) ) (! (let ((T@@60 (TreeDomainTypeTypeInv0 (type arg0@@76))))
(= (type (get_Tree_right arg0@@76)) (TreeDomainTypeType T@@60)))
 :qid |funType:get_Tree_right|
 :pattern ( (get_Tree_right arg0@@76))
))) (forall ((T@@61 T@T) ) (! (= (type (Leaf T@@61)) (TreeDomainTypeType T@@61))
 :qid |funType:Leaf|
 :pattern ( (Leaf T@@61))
))))
(assert (forall ((t_2@@3 T@U) ) (! (let ((T@@62 (TreeDomainTypeTypeInv0 (type t_2@@3))))
 (=> (= (type t_2@@3) (TreeDomainTypeType T@@62)) (or (= t_2@@3 (Leaf T@@62)) (= t_2@@3 (Node (get_Tree_value t_2@@3) (get_Tree_left t_2@@3) (get_Tree_right t_2@@3))))))
 :qid |stdinbpl.694:19|
 :skolemid |72|
 :pattern ( (Tree_tag t_2@@3))
 :pattern ( (get_Tree_value t_2@@3))
 :pattern ( (get_Tree_left t_2@@3))
 :pattern ( (get_Tree_right t_2@@3))
)))
(assert  (and (forall ((arg0@@77 Real) (arg1@@30 T@U) ) (! (= (type (ConditionalFrame arg0@@77 arg1@@30)) FrameTypeType)
 :qid |funType:ConditionalFrame|
 :pattern ( (ConditionalFrame arg0@@77 arg1@@30))
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
 (=> (and (and (= (type Mask@@5) (MapType1Type RefType realType)) (= (type o_2@@0) RefType)) (= (type f_4@@0) (FieldType A@@4 B@@3))) (= (HasDirectPerm Mask@@5 o_2@@0 f_4@@0) (> (U_2_real (MapType1Select Mask@@5 o_2@@0 f_4@@0)) NoPerm)))))
 :qid |stdinbpl.133:22|
 :skolemid |17|
 :pattern ( (HasDirectPerm Mask@@5 o_2@@0 f_4@@0))
)))
(assert (forall ((s0@@0 T@U) (s1@@0 T@U) ) (! (let ((T@@63 (SeqTypeInv0 (type s0@@0))))
 (=> (and (and (= (type s0@@0) (SeqType T@@63)) (= (type s1@@0) (SeqType T@@63))) (and (not (= s0@@0 (|Seq#Empty| T@@63))) (not (= s1@@0 (|Seq#Empty| T@@63))))) (= (|Seq#Length| (|Seq#Append| s0@@0 s1@@0)) (+ (|Seq#Length| s0@@0) (|Seq#Length| s1@@0)))))
 :qid |stdinbpl.207:18|
 :skolemid |26|
 :pattern ( (|Seq#Length| (|Seq#Append| s0@@0 s1@@0)))
)))
(assert (forall ((s@@6 T@U) (t T@U) (n@@6 Int) ) (! (let ((T@@64 (SeqTypeInv0 (type s@@6))))
 (=> (and (and (= (type s@@6) (SeqType T@@64)) (= (type t) (SeqType T@@64))) (and (> n@@6 0) (> n@@6 (|Seq#Length| s@@6)))) (and (= (|Seq#Add| (|Seq#Sub| n@@6 (|Seq#Length| s@@6)) (|Seq#Length| s@@6)) n@@6) (= (|Seq#Drop| (|Seq#Append| s@@6 t) n@@6) (|Seq#Drop| t (|Seq#Sub| n@@6 (|Seq#Length| s@@6)))))))
 :qid |stdinbpl.363:18|
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
(assert (forall ((s@@7 T@U) (t@@0 T@U) (n@@7 Int) ) (! (let ((T@@65 (SeqTypeInv0 (type s@@7))))
 (=> (and (and (= (type s@@7) (SeqType T@@65)) (= (type t@@0) (SeqType T@@65))) (and (> n@@7 0) (> n@@7 (|Seq#Length| s@@7)))) (and (= (|Seq#Add| (|Seq#Sub| n@@7 (|Seq#Length| s@@7)) (|Seq#Length| s@@7)) n@@7) (= (|Seq#Take| (|Seq#Append| s@@7 t@@0) n@@7) (|Seq#Append| s@@7 (|Seq#Take| t@@0 (|Seq#Sub| n@@7 (|Seq#Length| s@@7))))))))
 :qid |stdinbpl.350:18|
 :skolemid |42|
 :pattern ( (|Seq#Take| (|Seq#Append| s@@7 t@@0) n@@7))
)))
(assert (forall ((q@min@@1 Int) (q@max@@1 Int) ) (!  (and (=> (< q@min@@1 q@max@@1) (= (|Seq#Length| (|Seq#Range| q@min@@1 q@max@@1)) (- q@max@@1 q@min@@1))) (=> (<= q@max@@1 q@min@@1) (= (|Seq#Length| (|Seq#Range| q@min@@1 q@max@@1)) 0)))
 :qid |stdinbpl.528:15|
 :skolemid |55|
 :pattern ( (|Seq#Length| (|Seq#Range| q@min@@1 q@max@@1)))
)))
(assert (forall ((a T@U) (b T@U) ) (! (let ((T@@66 (SeqTypeInv0 (type a))))
 (=> (and (and (= (type a) (SeqType T@@66)) (= (type b) (SeqType T@@66))) (|Seq#Equal| a b)) (= a b)))
 :qid |stdinbpl.501:18|
 :skolemid |53|
 :pattern ( (|Seq#Equal| a b))
)))
(assert (forall ((T@@67 T@T) ) (! (= (type (Leaf3 T@@67)) (Tree3DomainTypeType T@@67))
 :qid |funType:Leaf3|
 :pattern ( (Leaf3 T@@67))
)))
(assert (forall ((t_2@@4 T@U) ) (! (let ((T@@68 (Tree3DomainTypeTypeInv0 (type t_2@@4))))
 (=> (= (type t_2@@4) (Tree3DomainTypeType T@@68)) (or (= t_2@@4 (Leaf3 T@@68)) (= t_2@@4 (Node3 (get_Tree3_value t_2@@4) (get_Tree3_left t_2@@4) (get_Tree3_middle t_2@@4) (get_Tree3_right t_2@@4))))))
 :qid |stdinbpl.764:19|
 :skolemid |79|
 :pattern ( (Tree3_tag t_2@@4))
 :pattern ( (get_Tree3_value t_2@@4))
 :pattern ( (get_Tree3_left t_2@@4))
 :pattern ( (get_Tree3_middle t_2@@4))
 :pattern ( (get_Tree3_right t_2@@4))
)))
(assert (forall ((s@@8 T@U) (i@@2 Int) ) (! (let ((T@@69 (SeqTypeInv0 (type s@@8))))
 (=> (= (type s@@8) (SeqType T@@69)) (=> (and (<= 0 i@@2) (< i@@2 (|Seq#Length| s@@8))) (|Seq#ContainsTrigger| s@@8 (|Seq#Index| s@@8 i@@2)))))
 :qid |stdinbpl.394:18|
 :skolemid |49|
 :pattern ( (|Seq#Index| s@@8 i@@2))
)))
(assert (forall ((s0@@1 T@U) (s1@@1 T@U) ) (! (let ((T@@70 (SeqTypeInv0 (type s0@@1))))
 (=> (and (= (type s0@@1) (SeqType T@@70)) (= (type s1@@1) (SeqType T@@70))) (and (=> (= s0@@1 (|Seq#Empty| T@@70)) (= (|Seq#Append| s0@@1 s1@@1) s1@@1)) (=> (= s1@@1 (|Seq#Empty| T@@70)) (= (|Seq#Append| s0@@1 s1@@1) s0@@1)))))
 :qid |stdinbpl.213:18|
 :skolemid |27|
 :pattern ( (|Seq#Append| s0@@1 s1@@1))
)))
(assert (forall ((t@@1 T@U) ) (! (= (|Seq#Index| (|Seq#Singleton| t@@1) 0) t@@1)
 :qid |stdinbpl.217:18|
 :skolemid |28|
 :pattern ( (|Seq#Singleton| t@@1))
)))
(assert (forall ((s@@9 T@U) ) (! (let ((T@@71 (SeqTypeInv0 (type s@@9))))
 (=> (= (type s@@9) (SeqType T@@71)) (<= 0 (|Seq#Length| s@@9))))
 :qid |stdinbpl.196:18|
 :skolemid |22|
 :pattern ( (|Seq#Length| s@@9))
)))
(assert (forall ((s0@@2 T@U) (s1@@2 T@U) ) (! (let ((T@@72 (SeqTypeInv0 (type s0@@2))))
 (=> (and (and (= (type s0@@2) (SeqType T@@72)) (= (type s1@@2) (SeqType T@@72))) (|Seq#Equal| s0@@2 s1@@2)) (and (= (|Seq#Length| s0@@2) (|Seq#Length| s1@@2)) (forall ((j@@4 Int) ) (!  (=> (and (<= 0 j@@4) (< j@@4 (|Seq#Length| s0@@2))) (= (|Seq#Index| s0@@2 j@@4) (|Seq#Index| s1@@2 j@@4)))
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
(assert (forall ((t@@2 T@U) ) (! (= (|Seq#Length| (|Seq#Singleton| t@@2)) 1)
 :qid |stdinbpl.204:18|
 :skolemid |25|
 :pattern ( (|Seq#Singleton| t@@2))
)))
(assert (forall ((Mask@@8 T@U) (o_2@@2 T@U) (f_4@@2 T@U) ) (! (let ((B@@7 (FieldTypeInv1 (type f_4@@2))))
(let ((A@@8 (FieldTypeInv0 (type f_4@@2))))
 (=> (and (and (and (= (type Mask@@8) (MapType1Type RefType realType)) (= (type o_2@@2) RefType)) (= (type f_4@@2) (FieldType A@@8 B@@7))) (GoodMask Mask@@8)) (and (>= (U_2_real (MapType1Select Mask@@8 o_2@@2 f_4@@2)) NoPerm) (=> (and (and (GoodMask Mask@@8) (not (IsPredicateField f_4@@2))) (not (IsWandField f_4@@2))) (<= (U_2_real (MapType1Select Mask@@8 o_2@@2 f_4@@2)) FullPerm))))))
 :qid |stdinbpl.128:22|
 :skolemid |16|
 :pattern ( (GoodMask Mask@@8) (MapType1Select Mask@@8 o_2@@2 f_4@@2))
)))
(assert (forall ((o T@U) (f T@U) (Heap@@7 T@U) ) (!  (=> (and (and (and (= (type o) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap@@7) (MapType0Type RefType))) (U_2_bool (MapType0Select Heap@@7 o $allocated))) (U_2_bool (MapType0Select Heap@@7 (MapType0Select Heap@@7 o f) $allocated)))
 :qid |stdinbpl.31:15|
 :skolemid |0|
 :pattern ( (MapType0Select Heap@@7 o f))
)))
(assert (forall ((value_1@@6 T@U) (left_1@@5 T@U) (right_1@@5 T@U) ) (! (let ((T@@73 (type value_1@@6)))
 (=> (and (= (type left_1@@5) (TreeDomainTypeType T@@73)) (= (type right_1@@5) (TreeDomainTypeType T@@73))) (= value_1@@6 (get_Tree_value (Node value_1@@6 left_1@@5 right_1@@5)))))
 :qid |stdinbpl.664:19|
 :skolemid |67|
 :pattern ( (Node value_1@@6 left_1@@5 right_1@@5))
)))
(assert (forall ((value_1@@7 T@U) (left_1@@6 T@U) (right_1@@6 T@U) ) (! (let ((T@@74 (type value_1@@7)))
 (=> (and (= (type left_1@@6) (TreeDomainTypeType T@@74)) (= (type right_1@@6) (TreeDomainTypeType T@@74))) (= left_1@@6 (get_Tree_left (Node value_1@@7 left_1@@6 right_1@@6)))))
 :qid |stdinbpl.670:19|
 :skolemid |68|
 :pattern ( (Node value_1@@7 left_1@@6 right_1@@6))
)))
(assert (forall ((value_1@@8 T@U) (left_1@@7 T@U) (right_1@@7 T@U) ) (! (let ((T@@75 (type value_1@@8)))
 (=> (and (= (type left_1@@7) (TreeDomainTypeType T@@75)) (= (type right_1@@7) (TreeDomainTypeType T@@75))) (= right_1@@7 (get_Tree_right (Node value_1@@8 left_1@@7 right_1@@7)))))
 :qid |stdinbpl.676:19|
 :skolemid |69|
 :pattern ( (Node value_1@@8 left_1@@7 right_1@@7))
)))
(assert (forall ((arg0@@78 T@U) ) (! (= (type (get_Mixed_sl arg0@@78)) SimpleListDomainTypeType)
 :qid |funType:get_Mixed_sl|
 :pattern ( (get_Mixed_sl arg0@@78))
)))
(assert (forall ((sl_1@@0 T@U) (ls_1@@0 T@U) (lt_1@@0 T@U) ) (! (let ((T@@76 (ListDomainTypeTypeInv0 (type lt_1@@0))))
(let ((S@@16 (ListDomainTypeTypeInv0 (type ls_1@@0))))
 (=> (and (and (= (type sl_1@@0) SimpleListDomainTypeType) (= (type ls_1@@0) (ListDomainTypeType S@@16))) (= (type lt_1@@0) (ListDomainTypeType T@@76))) (= sl_1@@0 (get_Mixed_sl (Entity1 sl_1@@0 ls_1@@0 lt_1@@0))))))
 :qid |stdinbpl.938:22|
 :skolemid |93|
 :pattern ( (Entity1 sl_1@@0 ls_1@@0 lt_1@@0))
)))
(assert (forall ((arg0@@79 T@U) ) (! (let ((S@@17 (MixedDomainTypeTypeInv1 (type arg0@@79))))
(= (type (get_Mixed_ls arg0@@79)) (ListDomainTypeType S@@17)))
 :qid |funType:get_Mixed_ls|
 :pattern ( (get_Mixed_ls arg0@@79))
)))
(assert (forall ((sl_1@@1 T@U) (ls_1@@1 T@U) (lt_1@@1 T@U) ) (! (let ((T@@77 (ListDomainTypeTypeInv0 (type lt_1@@1))))
(let ((S@@18 (ListDomainTypeTypeInv0 (type ls_1@@1))))
 (=> (and (and (= (type sl_1@@1) SimpleListDomainTypeType) (= (type ls_1@@1) (ListDomainTypeType S@@18))) (= (type lt_1@@1) (ListDomainTypeType T@@77))) (= ls_1@@1 (get_Mixed_ls (Entity1 sl_1@@1 ls_1@@1 lt_1@@1))))))
 :qid |stdinbpl.944:22|
 :skolemid |94|
 :pattern ( (Entity1 sl_1@@1 ls_1@@1 lt_1@@1))
)))
(assert (forall ((arg0@@80 T@U) ) (! (let ((T@@78 (MixedDomainTypeTypeInv0 (type arg0@@80))))
(= (type (get_Mixed_lt arg0@@80)) (ListDomainTypeType T@@78)))
 :qid |funType:get_Mixed_lt|
 :pattern ( (get_Mixed_lt arg0@@80))
)))
(assert (forall ((sl_1@@2 T@U) (ls_1@@2 T@U) (lt_1@@2 T@U) ) (! (let ((T@@79 (ListDomainTypeTypeInv0 (type lt_1@@2))))
(let ((S@@19 (ListDomainTypeTypeInv0 (type ls_1@@2))))
 (=> (and (and (= (type sl_1@@2) SimpleListDomainTypeType) (= (type ls_1@@2) (ListDomainTypeType S@@19))) (= (type lt_1@@2) (ListDomainTypeType T@@79))) (= lt_1@@2 (get_Mixed_lt (Entity1 sl_1@@2 ls_1@@2 lt_1@@2))))))
 :qid |stdinbpl.950:22|
 :skolemid |95|
 :pattern ( (Entity1 sl_1@@2 ls_1@@2 lt_1@@2))
)))
(assert (forall ((s@@10 T@U) (t@@3 T@U) (n@@8 Int) ) (! (let ((T@@80 (SeqTypeInv0 (type s@@10))))
 (=> (and (and (= (type s@@10) (SeqType T@@80)) (= (type t@@3) (SeqType T@@80))) (and (< 0 n@@8) (<= n@@8 (|Seq#Length| s@@10)))) (= (|Seq#Take| (|Seq#Append| s@@10 t@@3) n@@8) (|Seq#Take| s@@10 n@@8))))
 :qid |stdinbpl.346:18|
 :skolemid |41|
 :pattern ( (|Seq#Take| (|Seq#Append| s@@10 t@@3) n@@8))
)))
(assert (forall ((t_2@@5 T@U) ) (! (let ((S@@20 (MixedDomainTypeTypeInv1 (type t_2@@5))))
(let ((T@@81 (MixedDomainTypeTypeInv0 (type t_2@@5))))
 (=> (= (type t_2@@5) (MixedDomainTypeType T@@81 S@@20)) (or (= t_2@@5 (Entity1 (get_Mixed_sl t_2@@5) (get_Mixed_ls t_2@@5) (get_Mixed_lt t_2@@5))) (= t_2@@5 (Entity2 (get_Mixed_t3 t_2@@5) (get_Mixed_spl1 t_2@@5) (get_Mixed_spl2 t_2@@5) (get_Mixed_kt t_2@@5)))))))
 :qid |stdinbpl.992:22|
 :skolemid |102|
 :pattern ( (Mixed_tag t_2@@5))
 :pattern ( (get_Mixed_t3 t_2@@5))
 :pattern ( (get_Mixed_spl1 t_2@@5))
 :pattern ( (get_Mixed_spl2 t_2@@5))
 :pattern ( (get_Mixed_kt t_2@@5))
)))
(assert (forall ((value_1@@9 Int) (tail_1 T@U) ) (!  (=> (= (type tail_1) SimpleListDomainTypeType) (= value_1@@9 (get_SimpleList_value (SimpleCons value_1@@9 tail_1))))
 :qid |stdinbpl.560:15|
 :skolemid |58|
 :pattern ( (SimpleCons value_1@@9 tail_1))
)))
(assert (forall ((value_1@@10 Int) (tail_1@@0 T@U) ) (!  (=> (= (type tail_1@@0) SimpleListDomainTypeType) (= tail_1@@0 (get_SimpleList_tail (SimpleCons value_1@@10 tail_1@@0))))
 :qid |stdinbpl.566:15|
 :skolemid |59|
 :pattern ( (SimpleCons value_1@@10 tail_1@@0))
)))
(assert (forall ((value_1@@11 T@U) (tail_1@@1 T@U) ) (! (let ((T@@82 (type value_1@@11)))
 (=> (= (type tail_1@@1) (ListDomainTypeType T@@82)) (= value_1@@11 (get_List_value (Cons value_1@@11 tail_1@@1)))))
 :qid |stdinbpl.609:19|
 :skolemid |62|
 :pattern ( (Cons value_1@@11 tail_1@@1))
)))
(assert (forall ((value_1@@12 T@U) (tail_1@@2 T@U) ) (! (let ((T@@83 (type value_1@@12)))
 (=> (= (type tail_1@@2) (ListDomainTypeType T@@83)) (= tail_1@@2 (get_List_tail (Cons value_1@@12 tail_1@@2)))))
 :qid |stdinbpl.615:19|
 :skolemid |63|
 :pattern ( (Cons value_1@@12 tail_1@@2))
)))
(assert (forall ((value_1@@13 T@U) (children_1@@0 T@U) ) (! (let ((T@@84 (type value_1@@13)))
 (=> (= (type children_1@@0) (SeqType (kTreeDomainTypeType T@@84))) (= value_1@@13 (get_kTree_value (kNode value_1@@13 children_1@@0)))))
 :qid |stdinbpl.871:19|
 :skolemid |88|
 :pattern ( (kNode value_1@@13 children_1@@0))
)))
(assert (forall ((elemT_1 T@U) (tailT_1 T@U) ) (! (let ((S@@21 (SpecialListDomainTypeTypeInv1 (type tailT_1))))
(let ((T@@85 (type elemT_1)))
 (=> (= (type tailT_1) (SpecialListDomainTypeType T@@85 S@@21)) (= elemT_1 (get_SpecialList_elemT (TCons elemT_1 tailT_1))))))
 :qid |stdinbpl.801:22|
 :skolemid |80|
 :pattern ( (TCons elemT_1 tailT_1))
)))
(assert (forall ((elemT_1@@0 T@U) (tailT_1@@0 T@U) ) (! (let ((S@@22 (SpecialListDomainTypeTypeInv1 (type tailT_1@@0))))
(let ((T@@86 (type elemT_1@@0)))
 (=> (= (type tailT_1@@0) (SpecialListDomainTypeType T@@86 S@@22)) (= tailT_1@@0 (get_SpecialList_tailT (TCons elemT_1@@0 tailT_1@@0))))))
 :qid |stdinbpl.807:22|
 :skolemid |81|
 :pattern ( (TCons elemT_1@@0 tailT_1@@0))
)))
(assert (forall ((elemS_1 T@U) (tailS_1 T@U) ) (! (let ((T@@87 (SpecialListDomainTypeTypeInv0 (type tailS_1))))
(let ((S@@23 (type elemS_1)))
 (=> (= (type tailS_1) (SpecialListDomainTypeType T@@87 S@@23)) (= elemS_1 (get_SpecialList_elemS (SCons elemS_1 tailS_1))))))
 :qid |stdinbpl.813:22|
 :skolemid |82|
 :pattern ( (SCons elemS_1 tailS_1))
)))
(assert (forall ((elemS_1@@0 T@U) (tailS_1@@0 T@U) ) (! (let ((T@@88 (SpecialListDomainTypeTypeInv0 (type tailS_1@@0))))
(let ((S@@24 (type elemS_1@@0)))
 (=> (= (type tailS_1@@0) (SpecialListDomainTypeType T@@88 S@@24)) (= tailS_1@@0 (get_SpecialList_tailS (SCons elemS_1@@0 tailS_1@@0))))))
 :qid |stdinbpl.819:22|
 :skolemid |83|
 :pattern ( (SCons elemS_1@@0 tailS_1@@0))
)))
(assert (forall ((s@@11 T@U) (i@@3 Int) (v@@1 T@U) ) (! (let ((T@@89 (type v@@1)))
 (=> (= (type s@@11) (SeqType T@@89)) (=> (and (<= 0 i@@3) (< i@@3 (|Seq#Length| s@@11))) (= (|Seq#Length| (|Seq#Update| s@@11 i@@3 v@@1)) (|Seq#Length| s@@11)))))
 :qid |stdinbpl.245:18|
 :skolemid |34|
 :pattern ( (|Seq#Length| (|Seq#Update| s@@11 i@@3 v@@1)))
 :pattern ( (|Seq#Length| s@@11) (|Seq#Update| s@@11 i@@3 v@@1))
)))
(assert (forall ((s@@12 T@U) (t@@4 T@U) (n@@9 Int) ) (! (let ((T@@90 (SeqTypeInv0 (type s@@12))))
 (=> (and (and (= (type s@@12) (SeqType T@@90)) (= (type t@@4) (SeqType T@@90))) (and (< 0 n@@9) (<= n@@9 (|Seq#Length| s@@12)))) (= (|Seq#Drop| (|Seq#Append| s@@12 t@@4) n@@9) (|Seq#Append| (|Seq#Drop| s@@12 n@@9) t@@4))))
 :qid |stdinbpl.359:18|
 :skolemid |43|
 :pattern ( (|Seq#Drop| (|Seq#Append| s@@12 t@@4) n@@9))
)))
(assert (forall ((s@@13 T@U) (n@@10 Int) (i@@4 Int) ) (! (let ((T@@91 (SeqTypeInv0 (type s@@13))))
 (=> (= (type s@@13) (SeqType T@@91)) (=> (and (and (< 0 n@@10) (<= n@@10 i@@4)) (< i@@4 (|Seq#Length| s@@13))) (and (= (|Seq#Add| (|Seq#Sub| i@@4 n@@10) n@@10) i@@4) (= (|Seq#Index| (|Seq#Drop| s@@13 n@@10) (|Seq#Sub| i@@4 n@@10)) (|Seq#Index| s@@13 i@@4))))))
 :qid |stdinbpl.296:18|
 :skolemid |40|
 :pattern ( (|Seq#Drop| s@@13 n@@10) (|Seq#Index| s@@13 i@@4))
)))
(assert (forall ((s0@@3 T@U) (s1@@3 T@U) (n@@11 Int) ) (! (let ((T@@92 (SeqTypeInv0 (type s0@@3))))
 (=> (and (= (type s0@@3) (SeqType T@@92)) (= (type s1@@3) (SeqType T@@92))) (=> (and (and (and (not (= s0@@3 (|Seq#Empty| T@@92))) (not (= s1@@3 (|Seq#Empty| T@@92)))) (<= 0 n@@11)) (< n@@11 (|Seq#Length| s0@@3))) (= (|Seq#Index| (|Seq#Append| s0@@3 s1@@3) n@@11) (|Seq#Index| s0@@3 n@@11)))))
 :qid |stdinbpl.236:18|
 :skolemid |31|
 :pattern ( (|Seq#Index| (|Seq#Append| s0@@3 s1@@3) n@@11))
 :pattern ( (|Seq#Index| s0@@3 n@@11) (|Seq#Append| s0@@3 s1@@3))
)))
(assert (forall ((Heap@@8 T@U) (o@@0 T@U) (f_3 T@U) (v@@2 T@U) ) (! (let ((B@@8 (type v@@2)))
(let ((A@@9 (FieldTypeInv0 (type f_3))))
 (=> (and (and (= (type Heap@@8) (MapType0Type RefType)) (= (type o@@0) RefType)) (= (type f_3) (FieldType A@@9 B@@8))) (succHeap Heap@@8 (MapType0Store Heap@@8 o@@0 f_3 v@@2)))))
 :qid |stdinbpl.78:22|
 :skolemid |9|
 :pattern ( (MapType0Store Heap@@8 o@@0 f_3 v@@2))
)))
(assert (forall ((s0@@4 T@U) (s1@@4 T@U) (m@@7 Int) ) (! (let ((T@@93 (SeqTypeInv0 (type s0@@4))))
 (=> (and (= (type s0@@4) (SeqType T@@93)) (= (type s1@@4) (SeqType T@@93))) (=> (and (and (and (not (= s0@@4 (|Seq#Empty| T@@93))) (not (= s1@@4 (|Seq#Empty| T@@93)))) (<= 0 m@@7)) (< m@@7 (|Seq#Length| s1@@4))) (and (= (|Seq#Sub| (|Seq#Add| m@@7 (|Seq#Length| s0@@4)) (|Seq#Length| s0@@4)) m@@7) (= (|Seq#Index| (|Seq#Append| s0@@4 s1@@4) (|Seq#Add| m@@7 (|Seq#Length| s0@@4))) (|Seq#Index| s1@@4 m@@7))))))
 :qid |stdinbpl.241:18|
 :skolemid |33|
 :pattern ( (|Seq#Index| s1@@4 m@@7) (|Seq#Append| s0@@4 s1@@4))
)))
(assert (= (type ZeroPMask) (MapType1Type RefType boolType)))
(assert (forall ((o_2@@3 T@U) (f_4@@3 T@U) ) (! (let ((B@@9 (FieldTypeInv1 (type f_4@@3))))
(let ((A@@10 (FieldTypeInv0 (type f_4@@3))))
 (=> (and (= (type o_2@@3) RefType) (= (type f_4@@3) (FieldType A@@10 B@@9))) (not (U_2_bool (MapType1Select ZeroPMask o_2@@3 f_4@@3))))))
 :qid |stdinbpl.112:22|
 :skolemid |14|
 :pattern ( (MapType1Select ZeroPMask o_2@@3 f_4@@3))
)))
(assert (forall ((value_1@@14 Int) (tail_1@@3 T@U) ) (!  (=> (= (type tail_1@@3) SimpleListDomainTypeType) (= (SimpleList_tag (SimpleCons value_1@@14 tail_1@@3)) 0))
 :qid |stdinbpl.575:15|
 :skolemid |60|
 :pattern ( (SimpleCons value_1@@14 tail_1@@3))
)))
(assert (forall ((value_1@@15 T@U) (tail_1@@4 T@U) ) (! (let ((T@@94 (type value_1@@15)))
 (=> (= (type tail_1@@4) (ListDomainTypeType T@@94)) (= (List_tag (Cons value_1@@15 tail_1@@4)) 0)))
 :qid |stdinbpl.627:19|
 :skolemid |65|
 :pattern ( (Cons value_1@@15 tail_1@@4))
)))
(assert (forall ((value_1@@16 T@U) (children_1@@1 T@U) ) (! (let ((T@@95 (type value_1@@16)))
 (=> (= (type children_1@@1) (SeqType (kTreeDomainTypeType T@@95))) (= (kTree_tag (kNode value_1@@16 children_1@@1)) 1)))
 :qid |stdinbpl.889:19|
 :skolemid |91|
 :pattern ( (kNode value_1@@16 children_1@@1))
)))
(assert (forall ((elemS_1@@1 T@U) (tailS_1@@1 T@U) ) (! (let ((T@@96 (SpecialListDomainTypeTypeInv0 (type tailS_1@@1))))
(let ((S@@25 (type elemS_1@@1)))
 (=> (= (type tailS_1@@1) (SpecialListDomainTypeType T@@96 S@@25)) (= (SpecialList_tag (SCons elemS_1@@1 tailS_1@@1)) 0))))
 :qid |stdinbpl.837:22|
 :skolemid |86|
 :pattern ( (SCons elemS_1@@1 tailS_1@@1))
)))
(assert (forall ((elemT_1@@1 T@U) (tailT_1@@1 T@U) ) (! (let ((S@@26 (SpecialListDomainTypeTypeInv1 (type tailT_1@@1))))
(let ((T@@97 (type elemT_1@@1)))
 (=> (= (type tailT_1@@1) (SpecialListDomainTypeType T@@97 S@@26)) (= (SpecialList_tag (TCons elemT_1@@1 tailT_1@@1)) 2))))
 :qid |stdinbpl.831:22|
 :skolemid |85|
 :pattern ( (TCons elemT_1@@1 tailT_1@@1))
)))
(assert (forall ((s@@14 T@U) (x@@10 T@U) (i@@5 Int) ) (! (let ((T@@98 (type x@@10)))
 (=> (= (type s@@14) (SeqType T@@98)) (=> (and (and (<= 0 i@@5) (< i@@5 (|Seq#Length| s@@14))) (= (|Seq#Index| s@@14 i@@5) x@@10)) (|Seq#Contains| s@@14 x@@10))))
 :qid |stdinbpl.392:18|
 :skolemid |48|
 :pattern ( (|Seq#Contains| s@@14 x@@10) (|Seq#Index| s@@14 i@@5))
)))
(assert (forall ((s0@@5 T@U) (s1@@5 T@U) ) (! (let ((T@@99 (SeqTypeInv0 (type s0@@5))))
 (=> (and (= (type s0@@5) (SeqType T@@99)) (= (type s1@@5) (SeqType T@@99))) (or (or (and (= s0@@5 s1@@5) (|Seq#Equal| s0@@5 s1@@5)) (and (and (not (= s0@@5 s1@@5)) (not (|Seq#Equal| s0@@5 s1@@5))) (not (= (|Seq#Length| s0@@5) (|Seq#Length| s1@@5))))) (and (and (and (and (and (and (not (= s0@@5 s1@@5)) (not (|Seq#Equal| s0@@5 s1@@5))) (= (|Seq#Length| s0@@5) (|Seq#Length| s1@@5))) (= (|Seq#SkolemDiff| s0@@5 s1@@5) (|Seq#SkolemDiff| s1@@5 s0@@5))) (<= 0 (|Seq#SkolemDiff| s0@@5 s1@@5))) (< (|Seq#SkolemDiff| s0@@5 s1@@5) (|Seq#Length| s0@@5))) (not (= (|Seq#Index| s0@@5 (|Seq#SkolemDiff| s0@@5 s1@@5)) (|Seq#Index| s1@@5 (|Seq#SkolemDiff| s0@@5 s1@@5))))))))
 :qid |stdinbpl.496:18|
 :skolemid |52|
 :pattern ( (|Seq#Equal| s0@@5 s1@@5))
)))
(assert (forall ((p@@1 T@U) (v_1@@0 T@U) (q T@U) (w@@0 T@U) (r T@U) (u T@U) ) (! (let ((C@@3 (FieldTypeInv0 (type r))))
(let ((B@@10 (FieldTypeInv0 (type q))))
(let ((A@@11 (FieldTypeInv0 (type p@@1))))
 (=> (and (and (and (and (and (and (= (type p@@1) (FieldType A@@11 FrameTypeType)) (= (type v_1@@0) FrameTypeType)) (= (type q) (FieldType B@@10 FrameTypeType))) (= (type w@@0) FrameTypeType)) (= (type r) (FieldType C@@3 FrameTypeType))) (= (type u) FrameTypeType)) (and (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))) (InsidePredicate p@@1 v_1@@0 r u)))))
 :qid |stdinbpl.165:25|
 :skolemid |20|
 :pattern ( (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))
)))
(assert (forall ((T@@100 T@T) ) (! (= (Tree_tag (Leaf T@@100)) 0)
 :skolemid |70|
)))
(assert (forall ((T@@101 T@T) ) (! (= (Tree3_tag (Leaf3 T@@101)) 0)
 :skolemid |77|
)))
(assert (forall ((T@@102 T@T) ) (! (= (kTree_tag (kLeaf T@@102)) 0)
 :skolemid |90|
)))
(assert (forall ((T@@103 T@T) ) (! (= (List_tag (Nil T@@103)) 1)
 :skolemid |64|
)))
(assert (forall ((T@@104 T@T) (S@@27 T@T) ) (! (= (SpecialList_tag (SpecialNil T@@104 S@@27)) 1)
 :skolemid |84|
)))
(assert (forall ((s@@15 T@U) ) (! (let ((T@@105 (SeqTypeInv0 (type s@@15))))
 (=> (and (= (type s@@15) (SeqType T@@105)) (= (|Seq#Length| s@@15) 0)) (= s@@15 (|Seq#Empty| T@@105))))
 :qid |stdinbpl.200:18|
 :skolemid |24|
 :pattern ( (|Seq#Length| s@@15))
)))
(assert (forall ((s@@16 T@U) (n@@12 Int) ) (! (let ((T@@106 (SeqTypeInv0 (type s@@16))))
 (=> (and (= (type s@@16) (SeqType T@@106)) (<= n@@12 0)) (= (|Seq#Take| s@@16 n@@12) (|Seq#Empty| T@@106))))
 :qid |stdinbpl.375:18|
 :skolemid |46|
 :pattern ( (|Seq#Take| s@@16 n@@12))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun Heap@@9 () T@U)
(assert (= (type Heap@@9) (MapType0Type RefType)))
(set-info :boogie-vc-id soundness_1)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 3) (let ((anon0_correct  (=> (and (state Heap@@9 ZeroMask) (= (ControlFlow 0 2) (- 0 1))) false)))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 3) 2) anon0_correct)))
PreconditionGeneratedEntry_correct)))
))
(check-sat)
(get-info :reason-unknown)
(assert (not (= (ControlFlow 0 2) (- 1))))
(check-sat)
(pop 1)
; Invalid
(get-info :rlimit)
