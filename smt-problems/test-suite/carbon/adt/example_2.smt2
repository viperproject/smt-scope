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
(declare-fun state (T@U T@U) Bool)
(declare-fun children (T@U T@U) T@U)
(declare-fun MapType0Type (T@T) T@T)
(declare-fun RefType () T@T)
(declare-fun MapType1Type (T@T T@T) T@T)
(declare-fun TreeDomainTypeType () T@T)
(declare-fun AssumeFunctionsAbove () Int)
(declare-fun Tree_tag (T@U) Int)
(declare-fun get_Tree_left (T@U) T@U)
(declare-fun get_Tree_right (T@U) T@U)
(declare-fun |Seq#Empty| (T@T) T@U)
(declare-fun |Seq#Append| (T@U T@U) T@U)
(declare-fun |Seq#Singleton| (T@U) T@U)
(declare-fun MapType0TypeInv0 (T@T) T@T)
(declare-fun FieldType (T@T T@T) T@T)
(declare-fun FieldTypeInv0 (T@T) T@T)
(declare-fun FieldTypeInv1 (T@T) T@T)
(declare-fun MapType0Select (T@U T@U T@U) T@U)
(declare-fun MapType0Store (T@U T@U T@U T@U) T@U)
(declare-fun MapType1TypeInv0 (T@T) T@T)
(declare-fun MapType1TypeInv1 (T@T) T@T)
(declare-fun MapType1Select (T@U T@U T@U) T@U)
(declare-fun MapType1Store (T@U T@U T@U T@U) T@U)
(declare-fun succHeap (T@U T@U) Bool)
(declare-fun succHeapTrans (T@U T@U) Bool)
(declare-fun height (T@U T@U) Int)
(declare-fun height_recursive (T@U T@U) Int)
(declare-fun GoodMask (T@U) Bool)
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
(declare-fun children_seq (T@U T@U) T@U)
(declare-fun |children_seq'| (T@U T@U) T@U)
(declare-fun |height_recursive'| (T@U T@U) Int)
(declare-fun dummyFunction (T@U) Bool)
(declare-fun |height_recursive#triggerStateless| (T@U) Int)
(declare-fun |height'| (T@U T@U) Int)
(declare-fun |height#triggerStateless| (T@U) Int)
(declare-fun |children'| (T@U T@U) T@U)
(declare-fun |children#triggerStateless| (T@U) T@U)
(declare-fun |children_seq#triggerStateless| (T@U) T@U)
(declare-fun |Seq#Update| (T@U Int T@U) T@U)
(declare-fun |Seq#Take| (T@U Int) T@U)
(declare-fun |Seq#Contains| (T@U T@U) Bool)
(declare-fun |Seq#Range| (Int Int) T@U)
(declare-fun |Seq#Skolem| (T@U T@U) Int)
(declare-fun $allocated () T@U)
(declare-fun NormalFieldType () T@T)
(declare-fun Node (Int T@U T@U) T@U)
(declare-fun Leaf () T@U)
(declare-fun dummyHeap () T@U)
(declare-fun ZeroMask () T@U)
(declare-fun InsidePredicate (T@U T@U T@U T@U) Bool)
(declare-fun sumMask (T@U T@U T@U) Bool)
(declare-fun get_Tree_v (T@U) Int)
(declare-fun ConditionalFrame (Real T@U) T@U)
(declare-fun EmptyFrame () T@U)
(declare-fun NoPerm () Real)
(declare-fun |Seq#Equal| (T@U T@U) Bool)
(declare-fun |Seq#ContainsTrigger| (T@U T@U) Bool)
(declare-fun FullPerm () Real)
(declare-fun |height_recursive#frame| (T@U T@U) Int)
(declare-fun |height#frame| (T@U T@U) Int)
(declare-fun |children#frame| (T@U T@U) T@U)
(declare-fun |children_seq#frame| (T@U T@U) T@U)
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
 :qid |stdinbpl.277:18|
 :skolemid |38|
 :pattern ( (|Seq#Length| (|Seq#Drop| s n)))
 :pattern ( (|Seq#Length| s) (|Seq#Drop| s n))
)))
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (forall ((arg0@@14 T@T) ) (! (= (Ctor (MapType0Type arg0@@14)) 7)
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
)))) (= (Ctor RefType) 9)) (forall ((arg0@@21 T@T) (arg1@@5 T@T) ) (! (= (Ctor (MapType1Type arg0@@21 arg1@@5)) 10)
 :qid |ctor:MapType1Type|
))) (forall ((arg0@@22 T@T) (arg1@@6 T@T) ) (! (= (MapType1TypeInv0 (MapType1Type arg0@@22 arg1@@6)) arg0@@22)
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
)))) (= (Ctor TreeDomainTypeType) 11)) (forall ((arg0@@26 T@U) (arg1@@10 T@U) ) (! (= (type (children arg0@@26 arg1@@10)) (SeqType TreeDomainTypeType))
 :qid |funType:children|
 :pattern ( (children arg0@@26 arg1@@10))
))) (forall ((arg0@@27 T@U) ) (! (= (type (get_Tree_left arg0@@27)) TreeDomainTypeType)
 :qid |funType:get_Tree_left|
 :pattern ( (get_Tree_left arg0@@27))
))) (forall ((arg0@@28 T@U) ) (! (= (type (get_Tree_right arg0@@28)) TreeDomainTypeType)
 :qid |funType:get_Tree_right|
 :pattern ( (get_Tree_right arg0@@28))
))) (forall ((T@@1 T@T) ) (! (= (type (|Seq#Empty| T@@1)) (SeqType T@@1))
 :qid |funType:Seq#Empty|
 :pattern ( (|Seq#Empty| T@@1))
))) (forall ((arg0@@29 T@U) (arg1@@11 T@U) ) (! (let ((T@@2 (SeqTypeInv0 (type arg0@@29))))
(= (type (|Seq#Append| arg0@@29 arg1@@11)) (SeqType T@@2)))
 :qid |funType:Seq#Append|
 :pattern ( (|Seq#Append| arg0@@29 arg1@@11))
))) (forall ((arg0@@30 T@U) ) (! (let ((T@@3 (type arg0@@30)))
(= (type (|Seq#Singleton| arg0@@30)) (SeqType T@@3)))
 :qid |funType:Seq#Singleton|
 :pattern ( (|Seq#Singleton| arg0@@30))
))))
(assert (forall ((Heap T@U) (Mask T@U) (t_2 T@U) ) (!  (=> (and (and (and (= (type Heap) (MapType0Type RefType)) (= (type Mask) (MapType1Type RefType realType))) (= (type t_2) TreeDomainTypeType)) (and (state Heap Mask) (< AssumeFunctionsAbove 3))) (= (children Heap t_2) (ite  (or (= (Tree_tag t_2) 0) (and (= (Tree_tag t_2) 1) (and (= (Tree_tag (get_Tree_left t_2)) 0) (= (Tree_tag (get_Tree_right t_2)) 0)))) (|Seq#Empty| TreeDomainTypeType) (ite  (and (= (Tree_tag (get_Tree_left t_2)) 1) (= (Tree_tag (get_Tree_right t_2)) 1)) (|Seq#Append| (|Seq#Singleton| (get_Tree_right t_2)) (|Seq#Singleton| (get_Tree_left t_2))) (ite (= (Tree_tag (get_Tree_left t_2)) 1) (|Seq#Singleton| (get_Tree_left t_2)) (|Seq#Singleton| (get_Tree_right t_2)))))))
 :qid |stdinbpl.745:15|
 :skolemid |73|
 :pattern ( (state Heap Mask) (children Heap t_2))
)))
(assert (forall ((Heap0 T@U) (Heap1 T@U) ) (!  (=> (and (and (= (type Heap0) (MapType0Type RefType)) (= (type Heap1) (MapType0Type RefType))) (succHeap Heap0 Heap1)) (succHeapTrans Heap0 Heap1))
 :qid |stdinbpl.88:15|
 :skolemid |11|
 :pattern ( (succHeap Heap0 Heap1))
)))
(assert (forall ((Heap@@0 T@U) (Mask@@0 T@U) (t_2@@0 T@U) ) (!  (=> (and (and (and (= (type Heap@@0) (MapType0Type RefType)) (= (type Mask@@0) (MapType1Type RefType realType))) (= (type t_2@@0) TreeDomainTypeType)) (and (state Heap@@0 Mask@@0) (< AssumeFunctionsAbove 0))) (= (height Heap@@0 t_2@@0) (ite (= (Tree_tag t_2@@0) 0) 0 (height_recursive Heap@@0 (|Seq#Singleton| t_2@@0)))))
 :qid |stdinbpl.685:15|
 :skolemid |69|
 :pattern ( (state Heap@@0 Mask@@0) (height Heap@@0 t_2@@0))
)))
(assert (forall ((Heap@@1 T@U) (Mask@@1 T@U) ) (!  (=> (and (and (= (type Heap@@1) (MapType0Type RefType)) (= (type Mask@@1) (MapType1Type RefType realType))) (state Heap@@1 Mask@@1)) (GoodMask Mask@@1))
 :qid |stdinbpl.124:15|
 :skolemid |15|
 :pattern ( (state Heap@@1 Mask@@1))
)))
(assert (forall ((Heap0@@0 T@U) (Heap1@@0 T@U) (Heap2 T@U) ) (!  (=> (and (and (and (= (type Heap0@@0) (MapType0Type RefType)) (= (type Heap1@@0) (MapType0Type RefType))) (= (type Heap2) (MapType0Type RefType))) (and (succHeapTrans Heap0@@0 Heap1@@0) (succHeap Heap1@@0 Heap2))) (succHeapTrans Heap0@@0 Heap2))
 :qid |stdinbpl.93:15|
 :skolemid |12|
 :pattern ( (succHeapTrans Heap0@@0 Heap1@@0) (succHeap Heap1@@0 Heap2))
)))
(assert (forall ((arg0@@31 T@U) (arg1@@12 Int) ) (! (let ((T@@4 (SeqTypeInv0 (type arg0@@31))))
(= (type (|Seq#Index| arg0@@31 arg1@@12)) T@@4))
 :qid |funType:Seq#Index|
 :pattern ( (|Seq#Index| arg0@@31 arg1@@12))
)))
(assert (forall ((s@@0 T@U) (n@@0 Int) (j Int) ) (! (let ((T@@5 (SeqTypeInv0 (type s@@0))))
 (=> (= (type s@@0) (SeqType T@@5)) (=> (and (and (< 0 n@@0) (<= 0 j)) (< j (- (|Seq#Length| s@@0) n@@0))) (and (= (|Seq#Sub| (|Seq#Add| j n@@0) n@@0) j) (= (|Seq#Index| (|Seq#Drop| s@@0 n@@0) j) (|Seq#Index| s@@0 (|Seq#Add| j n@@0)))))))
 :qid |stdinbpl.298:18|
 :skolemid |39|
 :pattern ( (|Seq#Index| (|Seq#Drop| s@@0 n@@0) j))
)))
(assert  (and (and (= (Ctor FrameTypeType) 12) (= (type null) RefType)) (forall ((arg0@@32 T@U) ) (! (let ((A (FieldTypeInv0 (type arg0@@32))))
(= (type (PredicateMaskField arg0@@32)) (FieldType A (MapType1Type RefType boolType))))
 :qid |funType:PredicateMaskField|
 :pattern ( (PredicateMaskField arg0@@32))
))))
(assert (forall ((Heap@@2 T@U) (ExhaleHeap T@U) (Mask@@2 T@U) (pm_f T@U) ) (! (let ((C (FieldTypeInv0 (type pm_f))))
 (=> (and (and (and (and (and (= (type Heap@@2) (MapType0Type RefType)) (= (type ExhaleHeap) (MapType0Type RefType))) (= (type Mask@@2) (MapType1Type RefType realType))) (= (type pm_f) (FieldType C FrameTypeType))) (IdenticalOnKnownLocations Heap@@2 ExhaleHeap Mask@@2)) (and (HasDirectPerm Mask@@2 null pm_f) (IsPredicateField pm_f))) (= (MapType0Select Heap@@2 null (PredicateMaskField pm_f)) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))))
 :qid |stdinbpl.47:19|
 :skolemid |2|
 :pattern ( (IdenticalOnKnownLocations Heap@@2 ExhaleHeap Mask@@2) (IsPredicateField pm_f) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))
)))
(assert (forall ((arg0@@33 T@U) ) (! (let ((A@@0 (FieldTypeInv0 (type arg0@@33))))
(= (type (WandMaskField arg0@@33)) (FieldType A@@0 (MapType1Type RefType boolType))))
 :qid |funType:WandMaskField|
 :pattern ( (WandMaskField arg0@@33))
)))
(assert (forall ((Heap@@3 T@U) (ExhaleHeap@@0 T@U) (Mask@@3 T@U) (pm_f@@0 T@U) ) (! (let ((C@@0 (FieldTypeInv0 (type pm_f@@0))))
 (=> (and (and (and (and (and (= (type Heap@@3) (MapType0Type RefType)) (= (type ExhaleHeap@@0) (MapType0Type RefType))) (= (type Mask@@3) (MapType1Type RefType realType))) (= (type pm_f@@0) (FieldType C@@0 FrameTypeType))) (IdenticalOnKnownLocations Heap@@3 ExhaleHeap@@0 Mask@@3)) (and (HasDirectPerm Mask@@3 null pm_f@@0) (IsWandField pm_f@@0))) (= (MapType0Select Heap@@3 null (WandMaskField pm_f@@0)) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))))
 :qid |stdinbpl.60:19|
 :skolemid |5|
 :pattern ( (IdenticalOnKnownLocations Heap@@3 ExhaleHeap@@0 Mask@@3) (IsWandField pm_f@@0) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))
)))
(assert  (and (forall ((arg0@@34 T@U) (arg1@@13 T@U) ) (! (= (type (children_seq arg0@@34 arg1@@13)) (SeqType TreeDomainTypeType))
 :qid |funType:children_seq|
 :pattern ( (children_seq arg0@@34 arg1@@13))
)) (forall ((arg0@@35 T@U) (arg1@@14 T@U) ) (! (= (type (|children_seq'| arg0@@35 arg1@@14)) (SeqType TreeDomainTypeType))
 :qid |funType:children_seq'|
 :pattern ( (|children_seq'| arg0@@35 arg1@@14))
))))
(assert (forall ((Heap@@4 T@U) (Mask@@4 T@U) (ts T@U) ) (!  (=> (and (and (and (= (type Heap@@4) (MapType0Type RefType)) (= (type Mask@@4) (MapType1Type RefType realType))) (= (type ts) (SeqType TreeDomainTypeType))) (and (state Heap@@4 Mask@@4) (< AssumeFunctionsAbove 2))) (= (children_seq Heap@@4 ts) (ite (= (|Seq#Length| ts) 0) (|Seq#Empty| TreeDomainTypeType) (ite (= (|Seq#Length| ts) 1) (children Heap@@4 (|Seq#Index| ts 0)) (|Seq#Append| (|children_seq'| Heap@@4 (|Seq#Drop| ts 1)) (children Heap@@4 (|Seq#Index| ts 0)))))))
 :qid |stdinbpl.794:15|
 :skolemid |77|
 :pattern ( (state Heap@@4 Mask@@4) (children_seq Heap@@4 ts))
)))
(assert (forall ((Heap@@5 T@U) (ts@@0 T@U) ) (!  (=> (and (= (type Heap@@5) (MapType0Type RefType)) (= (type ts@@0) (SeqType TreeDomainTypeType))) (dummyFunction (int_2_U (|height_recursive#triggerStateless| ts@@0))))
 :qid |stdinbpl.612:15|
 :skolemid |64|
 :pattern ( (|height_recursive'| Heap@@5 ts@@0))
)))
(assert (forall ((Heap@@6 T@U) (t_2@@1 T@U) ) (!  (=> (and (= (type Heap@@6) (MapType0Type RefType)) (= (type t_2@@1) TreeDomainTypeType)) (dummyFunction (int_2_U (|height#triggerStateless| t_2@@1))))
 :qid |stdinbpl.679:15|
 :skolemid |68|
 :pattern ( (|height'| Heap@@6 t_2@@1))
)))
(assert  (and (forall ((arg0@@36 T@U) (arg1@@15 T@U) ) (! (= (type (|children'| arg0@@36 arg1@@15)) (SeqType TreeDomainTypeType))
 :qid |funType:children'|
 :pattern ( (|children'| arg0@@36 arg1@@15))
)) (forall ((arg0@@37 T@U) ) (! (= (type (|children#triggerStateless| arg0@@37)) (SeqType TreeDomainTypeType))
 :qid |funType:children#triggerStateless|
 :pattern ( (|children#triggerStateless| arg0@@37))
))))
(assert (forall ((Heap@@7 T@U) (t_2@@2 T@U) ) (!  (=> (and (= (type Heap@@7) (MapType0Type RefType)) (= (type t_2@@2) TreeDomainTypeType)) (dummyFunction (|children#triggerStateless| t_2@@2)))
 :qid |stdinbpl.739:15|
 :skolemid |72|
 :pattern ( (|children'| Heap@@7 t_2@@2))
)))
(assert (forall ((arg0@@38 T@U) ) (! (= (type (|children_seq#triggerStateless| arg0@@38)) (SeqType TreeDomainTypeType))
 :qid |funType:children_seq#triggerStateless|
 :pattern ( (|children_seq#triggerStateless| arg0@@38))
)))
(assert (forall ((Heap@@8 T@U) (ts@@1 T@U) ) (!  (=> (and (= (type Heap@@8) (MapType0Type RefType)) (= (type ts@@1) (SeqType TreeDomainTypeType))) (dummyFunction (|children_seq#triggerStateless| ts@@1)))
 :qid |stdinbpl.788:15|
 :skolemid |76|
 :pattern ( (|children_seq'| Heap@@8 ts@@1))
)))
(assert (forall ((arg0@@39 T@U) (arg1@@16 Int) (arg2@@3 T@U) ) (! (let ((T@@6 (type arg2@@3)))
(= (type (|Seq#Update| arg0@@39 arg1@@16 arg2@@3)) (SeqType T@@6)))
 :qid |funType:Seq#Update|
 :pattern ( (|Seq#Update| arg0@@39 arg1@@16 arg2@@3))
)))
(assert (forall ((s@@1 T@U) (i Int) (v T@U) (n@@1 Int) ) (! (let ((T@@7 (type v)))
 (=> (= (type s@@1) (SeqType T@@7)) (=> (and (<= 0 n@@1) (< n@@1 (|Seq#Length| s@@1))) (and (=> (= i n@@1) (= (|Seq#Index| (|Seq#Update| s@@1 i v) n@@1) v)) (=> (not (= i n@@1)) (= (|Seq#Index| (|Seq#Update| s@@1 i v) n@@1) (|Seq#Index| s@@1 n@@1)))))))
 :qid |stdinbpl.253:18|
 :skolemid |35|
 :pattern ( (|Seq#Index| (|Seq#Update| s@@1 i v) n@@1))
 :pattern ( (|Seq#Index| s@@1 n@@1) (|Seq#Update| s@@1 i v))
)))
(assert (forall ((arg0@@40 T@U) (arg1@@17 Int) ) (! (let ((T@@8 (SeqTypeInv0 (type arg0@@40))))
(= (type (|Seq#Take| arg0@@40 arg1@@17)) (SeqType T@@8)))
 :qid |funType:Seq#Take|
 :pattern ( (|Seq#Take| arg0@@40 arg1@@17))
)))
(assert (forall ((s@@2 T@U) (n@@2 Int) ) (! (let ((T@@9 (SeqTypeInv0 (type s@@2))))
 (=> (= (type s@@2) (SeqType T@@9)) (and (=> (<= 0 n@@2) (and (=> (<= n@@2 (|Seq#Length| s@@2)) (= (|Seq#Length| (|Seq#Take| s@@2 n@@2)) n@@2)) (=> (< (|Seq#Length| s@@2) n@@2) (= (|Seq#Length| (|Seq#Take| s@@2 n@@2)) (|Seq#Length| s@@2))))) (=> (< n@@2 0) (= (|Seq#Length| (|Seq#Take| s@@2 n@@2)) 0)))))
 :qid |stdinbpl.264:18|
 :skolemid |36|
 :pattern ( (|Seq#Length| (|Seq#Take| s@@2 n@@2)))
 :pattern ( (|Seq#Take| s@@2 n@@2) (|Seq#Length| s@@2))
)))
(assert (forall ((arg0@@41 Int) (arg1@@18 Int) ) (! (= (type (|Seq#Range| arg0@@41 arg1@@18)) (SeqType intType))
 :qid |funType:Seq#Range|
 :pattern ( (|Seq#Range| arg0@@41 arg1@@18))
)))
(assert (forall ((q@min Int) (q@max Int) (v@@0 T@U) ) (!  (=> (= (type v@@0) intType) (= (|Seq#Contains| (|Seq#Range| q@min q@max) v@@0)  (and (<= q@min (U_2_int v@@0)) (< (U_2_int v@@0) q@max))))
 :qid |stdinbpl.537:15|
 :skolemid |57|
 :pattern ( (|Seq#Contains| (|Seq#Range| q@min q@max) v@@0))
)))
(assert (forall ((Heap@@9 T@U) (Mask@@5 T@U) (ts@@2 T@U) ) (!  (=> (and (and (and (= (type Heap@@9) (MapType0Type RefType)) (= (type Mask@@5) (MapType1Type RefType realType))) (= (type ts@@2) (SeqType TreeDomainTypeType))) (and (state Heap@@9 Mask@@5) (< AssumeFunctionsAbove 1))) (= (height_recursive Heap@@9 ts@@2) (ite (= (|Seq#Length| ts@@2) 0) 0 (+ 1 (|height_recursive'| Heap@@9 (children_seq Heap@@9 ts@@2))))))
 :qid |stdinbpl.618:15|
 :skolemid |65|
 :pattern ( (state Heap@@9 Mask@@5) (height_recursive Heap@@9 ts@@2))
)))
(assert (forall ((s@@3 T@U) (x@@8 T@U) ) (! (let ((T@@10 (type x@@8)))
 (=> (and (= (type s@@3) (SeqType T@@10)) (|Seq#Contains| s@@3 x@@8)) (and (and (<= 0 (|Seq#Skolem| s@@3 x@@8)) (< (|Seq#Skolem| s@@3 x@@8) (|Seq#Length| s@@3))) (= (|Seq#Index| s@@3 (|Seq#Skolem| s@@3 x@@8)) x@@8))))
 :qid |stdinbpl.395:18|
 :skolemid |47|
 :pattern ( (|Seq#Contains| s@@3 x@@8))
)))
(assert  (and (= (Ctor NormalFieldType) 13) (= (type $allocated) (FieldType NormalFieldType boolType))))
(assert (forall ((Heap@@10 T@U) (ExhaleHeap@@1 T@U) (Mask@@6 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@10) (MapType0Type RefType)) (= (type ExhaleHeap@@1) (MapType0Type RefType))) (= (type Mask@@6) (MapType1Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@10 ExhaleHeap@@1 Mask@@6)) (U_2_bool (MapType0Select Heap@@10 o_1 $allocated))) (U_2_bool (MapType0Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.73:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@10 ExhaleHeap@@1 Mask@@6) (MapType0Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert (forall ((Heap@@11 T@U) (ts@@3 T@U) ) (!  (=> (and (= (type Heap@@11) (MapType0Type RefType)) (= (type ts@@3) (SeqType TreeDomainTypeType))) (and (= (height_recursive Heap@@11 ts@@3) (|height_recursive'| Heap@@11 ts@@3)) (dummyFunction (int_2_U (|height_recursive#triggerStateless| ts@@3)))))
 :qid |stdinbpl.608:15|
 :skolemid |63|
 :pattern ( (height_recursive Heap@@11 ts@@3))
)))
(assert (forall ((Heap@@12 T@U) (t_2@@3 T@U) ) (!  (=> (and (= (type Heap@@12) (MapType0Type RefType)) (= (type t_2@@3) TreeDomainTypeType)) (and (= (height Heap@@12 t_2@@3) (|height'| Heap@@12 t_2@@3)) (dummyFunction (int_2_U (|height#triggerStateless| t_2@@3)))))
 :qid |stdinbpl.675:15|
 :skolemid |67|
 :pattern ( (height Heap@@12 t_2@@3))
)))
(assert (forall ((Heap@@13 T@U) (t_2@@4 T@U) ) (!  (=> (and (= (type Heap@@13) (MapType0Type RefType)) (= (type t_2@@4) TreeDomainTypeType)) (and (= (children Heap@@13 t_2@@4) (|children'| Heap@@13 t_2@@4)) (dummyFunction (|children#triggerStateless| t_2@@4))))
 :qid |stdinbpl.735:15|
 :skolemid |71|
 :pattern ( (children Heap@@13 t_2@@4))
)))
(assert (forall ((Heap@@14 T@U) (ts@@4 T@U) ) (!  (=> (and (= (type Heap@@14) (MapType0Type RefType)) (= (type ts@@4) (SeqType TreeDomainTypeType))) (and (= (children_seq Heap@@14 ts@@4) (|children_seq'| Heap@@14 ts@@4)) (dummyFunction (|children_seq#triggerStateless| ts@@4))))
 :qid |stdinbpl.784:15|
 :skolemid |75|
 :pattern ( (children_seq Heap@@14 ts@@4))
)))
(assert (forall ((s@@4 T@U) (n@@3 Int) ) (! (let ((T@@11 (SeqTypeInv0 (type s@@4))))
 (=> (and (= (type s@@4) (SeqType T@@11)) (<= n@@3 0)) (= (|Seq#Drop| s@@4 n@@3) s@@4)))
 :qid |stdinbpl.379:18|
 :skolemid |45|
 :pattern ( (|Seq#Drop| s@@4 n@@3))
)))
(assert (forall ((i@@0 Int) (j@@0 Int) ) (! (= (|Seq#Sub| i@@0 j@@0) (- i@@0 j@@0))
 :qid |stdinbpl.233:15|
 :skolemid |30|
 :pattern ( (|Seq#Sub| i@@0 j@@0))
)))
(assert (forall ((i@@1 Int) (j@@1 Int) ) (! (= (|Seq#Add| i@@1 j@@1) (+ i@@1 j@@1))
 :qid |stdinbpl.231:15|
 :skolemid |29|
 :pattern ( (|Seq#Add| i@@1 j@@1))
)))
(assert (forall ((x@@9 T@U) (y@@1 T@U) ) (! (let ((T@@12 (type x@@9)))
 (=> (= (type y@@1) T@@12) (= (|Seq#Contains| (|Seq#Singleton| x@@9) y@@1) (= x@@9 y@@1))))
 :qid |stdinbpl.520:18|
 :skolemid |54|
 :pattern ( (|Seq#Contains| (|Seq#Singleton| x@@9) y@@1))
)))
(assert (forall ((arg0@@42 Int) (arg1@@19 T@U) (arg2@@4 T@U) ) (! (= (type (Node arg0@@42 arg1@@19 arg2@@4)) TreeDomainTypeType)
 :qid |funType:Node|
 :pattern ( (Node arg0@@42 arg1@@19 arg2@@4))
)))
(assert (forall ((v_3 Int) (left_1 T@U) (right_1 T@U) ) (!  (=> (and (= (type left_1) TreeDomainTypeType) (= (type right_1) TreeDomainTypeType)) (= (Tree_tag (Node v_3 left_1 right_1)) 1))
 :qid |stdinbpl.590:15|
 :skolemid |61|
 :pattern ( (Node v_3 left_1 right_1))
)))
(assert (forall ((s@@5 T@U) (n@@4 Int) (j@@2 Int) ) (! (let ((T@@13 (SeqTypeInv0 (type s@@5))))
 (=> (= (type s@@5) (SeqType T@@13)) (=> (and (and (<= 0 j@@2) (< j@@2 n@@4)) (< j@@2 (|Seq#Length| s@@5))) (= (|Seq#Index| (|Seq#Take| s@@5 n@@4) j@@2) (|Seq#Index| s@@5 j@@2)))))
 :qid |stdinbpl.272:18|
 :skolemid |37|
 :pattern ( (|Seq#Index| (|Seq#Take| s@@5 n@@4) j@@2))
 :pattern ( (|Seq#Index| s@@5 j@@2) (|Seq#Take| s@@5 n@@4))
)))
(assert (= (type Leaf) TreeDomainTypeType))
(assert (= (Tree_tag Leaf) 0))
(assert (forall ((Heap@@15 T@U) (ExhaleHeap@@2 T@U) (Mask@@7 T@U) (o_1@@0 T@U) (f_2 T@U) ) (! (let ((B@@1 (FieldTypeInv1 (type f_2))))
(let ((A@@1 (FieldTypeInv0 (type f_2))))
 (=> (and (and (and (and (and (and (= (type Heap@@15) (MapType0Type RefType)) (= (type ExhaleHeap@@2) (MapType0Type RefType))) (= (type Mask@@7) (MapType1Type RefType realType))) (= (type o_1@@0) RefType)) (= (type f_2) (FieldType A@@1 B@@1))) (IdenticalOnKnownLocations Heap@@15 ExhaleHeap@@2 Mask@@7)) (HasDirectPerm Mask@@7 o_1@@0 f_2)) (= (MapType0Select Heap@@15 o_1@@0 f_2) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2)))))
 :qid |stdinbpl.42:22|
 :skolemid |1|
 :pattern ( (IdenticalOnKnownLocations Heap@@15 ExhaleHeap@@2 Mask@@7) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2))
)))
(assert (forall ((T@@14 T@T) ) (! (= (|Seq#Length| (|Seq#Empty| T@@14)) 0)
 :skolemid |23|
)))
(assert  (and (= (type dummyHeap) (MapType0Type RefType)) (= (type ZeroMask) (MapType1Type RefType realType))))
(assert (state dummyHeap ZeroMask))
(assert (forall ((p T@U) (v_1 T@U) (w T@U) ) (! (let ((A@@2 (FieldTypeInv0 (type p))))
 (=> (and (and (= (type p) (FieldType A@@2 FrameTypeType)) (= (type v_1) FrameTypeType)) (= (type w) FrameTypeType)) (not (InsidePredicate p v_1 p w))))
 :qid |stdinbpl.176:19|
 :skolemid |21|
 :pattern ( (InsidePredicate p v_1 p w))
)))
(assert (forall ((s0 T@U) (s1 T@U) (n@@5 Int) ) (! (let ((T@@15 (SeqTypeInv0 (type s0))))
 (=> (and (= (type s0) (SeqType T@@15)) (= (type s1) (SeqType T@@15))) (=> (and (and (and (not (= s0 (|Seq#Empty| T@@15))) (not (= s1 (|Seq#Empty| T@@15)))) (<= (|Seq#Length| s0) n@@5)) (< n@@5 (|Seq#Length| (|Seq#Append| s0 s1)))) (and (= (|Seq#Add| (|Seq#Sub| n@@5 (|Seq#Length| s0)) (|Seq#Length| s0)) n@@5) (= (|Seq#Index| (|Seq#Append| s0 s1) n@@5) (|Seq#Index| s1 (|Seq#Sub| n@@5 (|Seq#Length| s0))))))))
 :qid |stdinbpl.244:18|
 :skolemid |32|
 :pattern ( (|Seq#Index| (|Seq#Append| s0 s1) n@@5))
)))
(assert (forall ((Heap@@16 T@U) (ExhaleHeap@@3 T@U) (Mask@@8 T@U) ) (!  (=> (and (and (and (= (type Heap@@16) (MapType0Type RefType)) (= (type ExhaleHeap@@3) (MapType0Type RefType))) (= (type Mask@@8) (MapType1Type RefType realType))) (IdenticalOnKnownLocations Heap@@16 ExhaleHeap@@3 Mask@@8)) (succHeap Heap@@16 ExhaleHeap@@3))
 :qid |stdinbpl.83:15|
 :skolemid |10|
 :pattern ( (IdenticalOnKnownLocations Heap@@16 ExhaleHeap@@3 Mask@@8))
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
(assert (forall ((t_2@@5 T@U) ) (!  (=> (= (type t_2@@5) TreeDomainTypeType) (or (= t_2@@5 Leaf) (= t_2@@5 (Node (get_Tree_v t_2@@5) (get_Tree_left t_2@@5) (get_Tree_right t_2@@5)))))
 :qid |stdinbpl.596:15|
 :skolemid |62|
 :pattern ( (Tree_tag t_2@@5))
 :pattern ( (get_Tree_v t_2@@5))
 :pattern ( (get_Tree_left t_2@@5))
 :pattern ( (get_Tree_right t_2@@5))
)))
(assert  (and (forall ((arg0@@43 Real) (arg1@@20 T@U) ) (! (= (type (ConditionalFrame arg0@@43 arg1@@20)) FrameTypeType)
 :qid |funType:ConditionalFrame|
 :pattern ( (ConditionalFrame arg0@@43 arg1@@20))
)) (= (type EmptyFrame) FrameTypeType)))
(assert (forall ((p@@0 Real) (f_6 T@U) ) (!  (=> (= (type f_6) FrameTypeType) (= (ConditionalFrame p@@0 f_6) (ite (> p@@0 0.0) f_6 EmptyFrame)))
 :qid |stdinbpl.164:15|
 :skolemid |19|
 :pattern ( (ConditionalFrame p@@0 f_6))
)))
(assert (forall ((q@min@@0 Int) (q@max@@0 Int) (j@@3 Int) ) (!  (=> (and (<= 0 j@@3) (< j@@3 (- q@max@@0 q@min@@0))) (= (U_2_int (|Seq#Index| (|Seq#Range| q@min@@0 q@max@@0) j@@3)) (+ q@min@@0 j@@3)))
 :qid |stdinbpl.535:15|
 :skolemid |56|
 :pattern ( (|Seq#Index| (|Seq#Range| q@min@@0 q@max@@0) j@@3))
)))
(assert (forall ((Mask@@9 T@U) (o_2@@0 T@U) (f_4@@0 T@U) ) (! (let ((B@@3 (FieldTypeInv1 (type f_4@@0))))
(let ((A@@4 (FieldTypeInv0 (type f_4@@0))))
 (=> (and (and (= (type Mask@@9) (MapType1Type RefType realType)) (= (type o_2@@0) RefType)) (= (type f_4@@0) (FieldType A@@4 B@@3))) (= (HasDirectPerm Mask@@9 o_2@@0 f_4@@0) (> (U_2_real (MapType1Select Mask@@9 o_2@@0 f_4@@0)) NoPerm)))))
 :qid |stdinbpl.133:22|
 :skolemid |17|
 :pattern ( (HasDirectPerm Mask@@9 o_2@@0 f_4@@0))
)))
(assert (forall ((s0@@0 T@U) (s1@@0 T@U) ) (! (let ((T@@16 (SeqTypeInv0 (type s0@@0))))
 (=> (and (and (= (type s0@@0) (SeqType T@@16)) (= (type s1@@0) (SeqType T@@16))) (and (not (= s0@@0 (|Seq#Empty| T@@16))) (not (= s1@@0 (|Seq#Empty| T@@16))))) (= (|Seq#Length| (|Seq#Append| s0@@0 s1@@0)) (+ (|Seq#Length| s0@@0) (|Seq#Length| s1@@0)))))
 :qid |stdinbpl.213:18|
 :skolemid |26|
 :pattern ( (|Seq#Length| (|Seq#Append| s0@@0 s1@@0)))
)))
(assert (forall ((s@@6 T@U) (t T@U) (n@@6 Int) ) (! (let ((T@@17 (SeqTypeInv0 (type s@@6))))
 (=> (and (and (= (type s@@6) (SeqType T@@17)) (= (type t) (SeqType T@@17))) (and (> n@@6 0) (> n@@6 (|Seq#Length| s@@6)))) (and (= (|Seq#Add| (|Seq#Sub| n@@6 (|Seq#Length| s@@6)) (|Seq#Length| s@@6)) n@@6) (= (|Seq#Drop| (|Seq#Append| s@@6 t) n@@6) (|Seq#Drop| t (|Seq#Sub| n@@6 (|Seq#Length| s@@6)))))))
 :qid |stdinbpl.369:18|
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
(assert (forall ((s@@7 T@U) (t@@0 T@U) (n@@7 Int) ) (! (let ((T@@18 (SeqTypeInv0 (type s@@7))))
 (=> (and (and (= (type s@@7) (SeqType T@@18)) (= (type t@@0) (SeqType T@@18))) (and (> n@@7 0) (> n@@7 (|Seq#Length| s@@7)))) (and (= (|Seq#Add| (|Seq#Sub| n@@7 (|Seq#Length| s@@7)) (|Seq#Length| s@@7)) n@@7) (= (|Seq#Take| (|Seq#Append| s@@7 t@@0) n@@7) (|Seq#Append| s@@7 (|Seq#Take| t@@0 (|Seq#Sub| n@@7 (|Seq#Length| s@@7))))))))
 :qid |stdinbpl.356:18|
 :skolemid |42|
 :pattern ( (|Seq#Take| (|Seq#Append| s@@7 t@@0) n@@7))
)))
(assert (forall ((q@min@@1 Int) (q@max@@1 Int) ) (!  (and (=> (< q@min@@1 q@max@@1) (= (|Seq#Length| (|Seq#Range| q@min@@1 q@max@@1)) (- q@max@@1 q@min@@1))) (=> (<= q@max@@1 q@min@@1) (= (|Seq#Length| (|Seq#Range| q@min@@1 q@max@@1)) 0)))
 :qid |stdinbpl.534:15|
 :skolemid |55|
 :pattern ( (|Seq#Length| (|Seq#Range| q@min@@1 q@max@@1)))
)))
(assert (forall ((a T@U) (b T@U) ) (! (let ((T@@19 (SeqTypeInv0 (type a))))
 (=> (and (and (= (type a) (SeqType T@@19)) (= (type b) (SeqType T@@19))) (|Seq#Equal| a b)) (= a b)))
 :qid |stdinbpl.507:18|
 :skolemid |53|
 :pattern ( (|Seq#Equal| a b))
)))
(assert (forall ((s@@8 T@U) (i@@2 Int) ) (! (let ((T@@20 (SeqTypeInv0 (type s@@8))))
 (=> (= (type s@@8) (SeqType T@@20)) (=> (and (<= 0 i@@2) (< i@@2 (|Seq#Length| s@@8))) (|Seq#ContainsTrigger| s@@8 (|Seq#Index| s@@8 i@@2)))))
 :qid |stdinbpl.400:18|
 :skolemid |49|
 :pattern ( (|Seq#Index| s@@8 i@@2))
)))
(assert (forall ((s0@@1 T@U) (s1@@1 T@U) ) (! (let ((T@@21 (SeqTypeInv0 (type s0@@1))))
 (=> (and (= (type s0@@1) (SeqType T@@21)) (= (type s1@@1) (SeqType T@@21))) (and (=> (= s0@@1 (|Seq#Empty| T@@21)) (= (|Seq#Append| s0@@1 s1@@1) s1@@1)) (=> (= s1@@1 (|Seq#Empty| T@@21)) (= (|Seq#Append| s0@@1 s1@@1) s0@@1)))))
 :qid |stdinbpl.219:18|
 :skolemid |27|
 :pattern ( (|Seq#Append| s0@@1 s1@@1))
)))
(assert (forall ((t@@1 T@U) ) (! (= (|Seq#Index| (|Seq#Singleton| t@@1) 0) t@@1)
 :qid |stdinbpl.223:18|
 :skolemid |28|
 :pattern ( (|Seq#Singleton| t@@1))
)))
(assert (forall ((s@@9 T@U) ) (! (let ((T@@22 (SeqTypeInv0 (type s@@9))))
 (=> (= (type s@@9) (SeqType T@@22)) (<= 0 (|Seq#Length| s@@9))))
 :qid |stdinbpl.202:18|
 :skolemid |22|
 :pattern ( (|Seq#Length| s@@9))
)))
(assert (forall ((s0@@2 T@U) (s1@@2 T@U) ) (! (let ((T@@23 (SeqTypeInv0 (type s0@@2))))
 (=> (and (and (= (type s0@@2) (SeqType T@@23)) (= (type s1@@2) (SeqType T@@23))) (|Seq#Equal| s0@@2 s1@@2)) (and (= (|Seq#Length| s0@@2) (|Seq#Length| s1@@2)) (forall ((j@@4 Int) ) (!  (=> (and (<= 0 j@@4) (< j@@4 (|Seq#Length| s0@@2))) (= (|Seq#Index| s0@@2 j@@4) (|Seq#Index| s1@@2 j@@4)))
 :qid |stdinbpl.497:13|
 :skolemid |50|
 :pattern ( (|Seq#Index| s0@@2 j@@4))
 :pattern ( (|Seq#Index| s1@@2 j@@4))
)))))
 :qid |stdinbpl.494:18|
 :skolemid |51|
 :pattern ( (|Seq#Equal| s0@@2 s1@@2))
)))
(assert (forall ((Heap@@17 T@U) (ExhaleHeap@@4 T@U) (Mask@@10 T@U) (pm_f@@1 T@U) ) (! (let ((C@@1 (FieldTypeInv0 (type pm_f@@1))))
 (=> (and (and (and (and (and (= (type Heap@@17) (MapType0Type RefType)) (= (type ExhaleHeap@@4) (MapType0Type RefType))) (= (type Mask@@10) (MapType1Type RefType realType))) (= (type pm_f@@1) (FieldType C@@1 FrameTypeType))) (IdenticalOnKnownLocations Heap@@17 ExhaleHeap@@4 Mask@@10)) (and (HasDirectPerm Mask@@10 null pm_f@@1) (IsPredicateField pm_f@@1))) (forall ((o2 T@U) (f_2@@0 T@U) ) (! (let ((B@@5 (FieldTypeInv1 (type f_2@@0))))
(let ((A@@6 (FieldTypeInv0 (type f_2@@0))))
 (=> (and (and (= (type o2) RefType) (= (type f_2@@0) (FieldType A@@6 B@@5))) (U_2_bool (MapType1Select (MapType0Select Heap@@17 null (PredicateMaskField pm_f@@1)) o2 f_2@@0))) (= (MapType0Select Heap@@17 o2 f_2@@0) (MapType0Select ExhaleHeap@@4 o2 f_2@@0)))))
 :qid |stdinbpl.54:134|
 :skolemid |3|
 :pattern ( (MapType0Select ExhaleHeap@@4 o2 f_2@@0))
))))
 :qid |stdinbpl.52:19|
 :skolemid |4|
 :pattern ( (IdenticalOnKnownLocations Heap@@17 ExhaleHeap@@4 Mask@@10) (IsPredicateField pm_f@@1))
)))
(assert (forall ((Heap@@18 T@U) (ExhaleHeap@@5 T@U) (Mask@@11 T@U) (pm_f@@2 T@U) ) (! (let ((C@@2 (FieldTypeInv0 (type pm_f@@2))))
 (=> (and (and (and (and (and (= (type Heap@@18) (MapType0Type RefType)) (= (type ExhaleHeap@@5) (MapType0Type RefType))) (= (type Mask@@11) (MapType1Type RefType realType))) (= (type pm_f@@2) (FieldType C@@2 FrameTypeType))) (IdenticalOnKnownLocations Heap@@18 ExhaleHeap@@5 Mask@@11)) (and (HasDirectPerm Mask@@11 null pm_f@@2) (IsWandField pm_f@@2))) (forall ((o2@@0 T@U) (f_2@@1 T@U) ) (! (let ((B@@6 (FieldTypeInv1 (type f_2@@1))))
(let ((A@@7 (FieldTypeInv0 (type f_2@@1))))
 (=> (and (and (= (type o2@@0) RefType) (= (type f_2@@1) (FieldType A@@7 B@@6))) (U_2_bool (MapType1Select (MapType0Select Heap@@18 null (WandMaskField pm_f@@2)) o2@@0 f_2@@1))) (= (MapType0Select Heap@@18 o2@@0 f_2@@1) (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1)))))
 :qid |stdinbpl.67:129|
 :skolemid |6|
 :pattern ( (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1))
))))
 :qid |stdinbpl.65:19|
 :skolemid |7|
 :pattern ( (IdenticalOnKnownLocations Heap@@18 ExhaleHeap@@5 Mask@@11) (IsWandField pm_f@@2))
)))
(assert (forall ((t@@2 T@U) ) (! (= (|Seq#Length| (|Seq#Singleton| t@@2)) 1)
 :qid |stdinbpl.210:18|
 :skolemid |25|
 :pattern ( (|Seq#Singleton| t@@2))
)))
(assert (forall ((Mask@@12 T@U) (o_2@@2 T@U) (f_4@@2 T@U) ) (! (let ((B@@7 (FieldTypeInv1 (type f_4@@2))))
(let ((A@@8 (FieldTypeInv0 (type f_4@@2))))
 (=> (and (and (and (= (type Mask@@12) (MapType1Type RefType realType)) (= (type o_2@@2) RefType)) (= (type f_4@@2) (FieldType A@@8 B@@7))) (GoodMask Mask@@12)) (and (>= (U_2_real (MapType1Select Mask@@12 o_2@@2 f_4@@2)) NoPerm) (=> (and (and (GoodMask Mask@@12) (not (IsPredicateField f_4@@2))) (not (IsWandField f_4@@2))) (<= (U_2_real (MapType1Select Mask@@12 o_2@@2 f_4@@2)) FullPerm))))))
 :qid |stdinbpl.128:22|
 :skolemid |16|
 :pattern ( (GoodMask Mask@@12) (MapType1Select Mask@@12 o_2@@2 f_4@@2))
)))
(assert (forall ((Heap@@19 T@U) (Mask@@13 T@U) (ts@@5 T@U) ) (!  (=> (and (and (and (= (type Heap@@19) (MapType0Type RefType)) (= (type Mask@@13) (MapType1Type RefType realType))) (= (type ts@@5) (SeqType TreeDomainTypeType))) (state Heap@@19 Mask@@13)) (= (|height_recursive'| Heap@@19 ts@@5) (|height_recursive#frame| EmptyFrame ts@@5)))
 :qid |stdinbpl.625:15|
 :skolemid |66|
 :pattern ( (state Heap@@19 Mask@@13) (|height_recursive'| Heap@@19 ts@@5))
)))
(assert (forall ((Heap@@20 T@U) (Mask@@14 T@U) (t_2@@6 T@U) ) (!  (=> (and (and (and (= (type Heap@@20) (MapType0Type RefType)) (= (type Mask@@14) (MapType1Type RefType realType))) (= (type t_2@@6) TreeDomainTypeType)) (state Heap@@20 Mask@@14)) (= (|height'| Heap@@20 t_2@@6) (|height#frame| EmptyFrame t_2@@6)))
 :qid |stdinbpl.692:15|
 :skolemid |70|
 :pattern ( (state Heap@@20 Mask@@14) (|height'| Heap@@20 t_2@@6))
)))
(assert (forall ((arg0@@44 T@U) (arg1@@21 T@U) ) (! (= (type (|children#frame| arg0@@44 arg1@@21)) (SeqType TreeDomainTypeType))
 :qid |funType:children#frame|
 :pattern ( (|children#frame| arg0@@44 arg1@@21))
)))
(assert (forall ((Heap@@21 T@U) (Mask@@15 T@U) (t_2@@7 T@U) ) (!  (=> (and (and (and (= (type Heap@@21) (MapType0Type RefType)) (= (type Mask@@15) (MapType1Type RefType realType))) (= (type t_2@@7) TreeDomainTypeType)) (state Heap@@21 Mask@@15)) (= (|children'| Heap@@21 t_2@@7) (|children#frame| EmptyFrame t_2@@7)))
 :qid |stdinbpl.752:15|
 :skolemid |74|
 :pattern ( (state Heap@@21 Mask@@15) (|children'| Heap@@21 t_2@@7))
)))
(assert (forall ((arg0@@45 T@U) (arg1@@22 T@U) ) (! (= (type (|children_seq#frame| arg0@@45 arg1@@22)) (SeqType TreeDomainTypeType))
 :qid |funType:children_seq#frame|
 :pattern ( (|children_seq#frame| arg0@@45 arg1@@22))
)))
(assert (forall ((Heap@@22 T@U) (Mask@@16 T@U) (ts@@6 T@U) ) (!  (=> (and (and (and (= (type Heap@@22) (MapType0Type RefType)) (= (type Mask@@16) (MapType1Type RefType realType))) (= (type ts@@6) (SeqType TreeDomainTypeType))) (state Heap@@22 Mask@@16)) (= (|children_seq'| Heap@@22 ts@@6) (|children_seq#frame| EmptyFrame ts@@6)))
 :qid |stdinbpl.801:15|
 :skolemid |78|
 :pattern ( (state Heap@@22 Mask@@16) (|children_seq'| Heap@@22 ts@@6))
)))
(assert (forall ((o T@U) (f T@U) (Heap@@23 T@U) ) (!  (=> (and (and (and (= (type o) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap@@23) (MapType0Type RefType))) (U_2_bool (MapType0Select Heap@@23 o $allocated))) (U_2_bool (MapType0Select Heap@@23 (MapType0Select Heap@@23 o f) $allocated)))
 :qid |stdinbpl.31:15|
 :skolemid |0|
 :pattern ( (MapType0Select Heap@@23 o f))
)))
(assert (forall ((v_3@@0 Int) (left_1@@0 T@U) (right_1@@0 T@U) ) (!  (=> (and (= (type left_1@@0) TreeDomainTypeType) (= (type right_1@@0) TreeDomainTypeType)) (= v_3@@0 (get_Tree_v (Node v_3@@0 left_1@@0 right_1@@0))))
 :qid |stdinbpl.569:15|
 :skolemid |58|
 :pattern ( (Node v_3@@0 left_1@@0 right_1@@0))
)))
(assert (forall ((v_3@@1 Int) (left_1@@1 T@U) (right_1@@1 T@U) ) (!  (=> (and (= (type left_1@@1) TreeDomainTypeType) (= (type right_1@@1) TreeDomainTypeType)) (= left_1@@1 (get_Tree_left (Node v_3@@1 left_1@@1 right_1@@1))))
 :qid |stdinbpl.575:15|
 :skolemid |59|
 :pattern ( (Node v_3@@1 left_1@@1 right_1@@1))
)))
(assert (forall ((v_3@@2 Int) (left_1@@2 T@U) (right_1@@2 T@U) ) (!  (=> (and (= (type left_1@@2) TreeDomainTypeType) (= (type right_1@@2) TreeDomainTypeType)) (= right_1@@2 (get_Tree_right (Node v_3@@2 left_1@@2 right_1@@2))))
 :qid |stdinbpl.581:15|
 :skolemid |60|
 :pattern ( (Node v_3@@2 left_1@@2 right_1@@2))
)))
(assert (forall ((s@@10 T@U) (t@@3 T@U) (n@@8 Int) ) (! (let ((T@@24 (SeqTypeInv0 (type s@@10))))
 (=> (and (and (= (type s@@10) (SeqType T@@24)) (= (type t@@3) (SeqType T@@24))) (and (< 0 n@@8) (<= n@@8 (|Seq#Length| s@@10)))) (= (|Seq#Take| (|Seq#Append| s@@10 t@@3) n@@8) (|Seq#Take| s@@10 n@@8))))
 :qid |stdinbpl.352:18|
 :skolemid |41|
 :pattern ( (|Seq#Take| (|Seq#Append| s@@10 t@@3) n@@8))
)))
(assert (forall ((s@@11 T@U) (i@@3 Int) (v@@1 T@U) ) (! (let ((T@@25 (type v@@1)))
 (=> (= (type s@@11) (SeqType T@@25)) (=> (and (<= 0 i@@3) (< i@@3 (|Seq#Length| s@@11))) (= (|Seq#Length| (|Seq#Update| s@@11 i@@3 v@@1)) (|Seq#Length| s@@11)))))
 :qid |stdinbpl.251:18|
 :skolemid |34|
 :pattern ( (|Seq#Length| (|Seq#Update| s@@11 i@@3 v@@1)))
 :pattern ( (|Seq#Length| s@@11) (|Seq#Update| s@@11 i@@3 v@@1))
)))
(assert (forall ((s@@12 T@U) (t@@4 T@U) (n@@9 Int) ) (! (let ((T@@26 (SeqTypeInv0 (type s@@12))))
 (=> (and (and (= (type s@@12) (SeqType T@@26)) (= (type t@@4) (SeqType T@@26))) (and (< 0 n@@9) (<= n@@9 (|Seq#Length| s@@12)))) (= (|Seq#Drop| (|Seq#Append| s@@12 t@@4) n@@9) (|Seq#Append| (|Seq#Drop| s@@12 n@@9) t@@4))))
 :qid |stdinbpl.365:18|
 :skolemid |43|
 :pattern ( (|Seq#Drop| (|Seq#Append| s@@12 t@@4) n@@9))
)))
(assert (forall ((s@@13 T@U) (n@@10 Int) (i@@4 Int) ) (! (let ((T@@27 (SeqTypeInv0 (type s@@13))))
 (=> (= (type s@@13) (SeqType T@@27)) (=> (and (and (< 0 n@@10) (<= n@@10 i@@4)) (< i@@4 (|Seq#Length| s@@13))) (and (= (|Seq#Add| (|Seq#Sub| i@@4 n@@10) n@@10) i@@4) (= (|Seq#Index| (|Seq#Drop| s@@13 n@@10) (|Seq#Sub| i@@4 n@@10)) (|Seq#Index| s@@13 i@@4))))))
 :qid |stdinbpl.302:18|
 :skolemid |40|
 :pattern ( (|Seq#Drop| s@@13 n@@10) (|Seq#Index| s@@13 i@@4))
)))
(assert (forall ((s0@@3 T@U) (s1@@3 T@U) (n@@11 Int) ) (! (let ((T@@28 (SeqTypeInv0 (type s0@@3))))
 (=> (and (= (type s0@@3) (SeqType T@@28)) (= (type s1@@3) (SeqType T@@28))) (=> (and (and (and (not (= s0@@3 (|Seq#Empty| T@@28))) (not (= s1@@3 (|Seq#Empty| T@@28)))) (<= 0 n@@11)) (< n@@11 (|Seq#Length| s0@@3))) (= (|Seq#Index| (|Seq#Append| s0@@3 s1@@3) n@@11) (|Seq#Index| s0@@3 n@@11)))))
 :qid |stdinbpl.242:18|
 :skolemid |31|
 :pattern ( (|Seq#Index| (|Seq#Append| s0@@3 s1@@3) n@@11))
 :pattern ( (|Seq#Index| s0@@3 n@@11) (|Seq#Append| s0@@3 s1@@3))
)))
(assert (forall ((Heap@@24 T@U) (o@@0 T@U) (f_3 T@U) (v@@2 T@U) ) (! (let ((B@@8 (type v@@2)))
(let ((A@@9 (FieldTypeInv0 (type f_3))))
 (=> (and (and (= (type Heap@@24) (MapType0Type RefType)) (= (type o@@0) RefType)) (= (type f_3) (FieldType A@@9 B@@8))) (succHeap Heap@@24 (MapType0Store Heap@@24 o@@0 f_3 v@@2)))))
 :qid |stdinbpl.78:22|
 :skolemid |9|
 :pattern ( (MapType0Store Heap@@24 o@@0 f_3 v@@2))
)))
(assert (forall ((s0@@4 T@U) (s1@@4 T@U) (m@@7 Int) ) (! (let ((T@@29 (SeqTypeInv0 (type s0@@4))))
 (=> (and (= (type s0@@4) (SeqType T@@29)) (= (type s1@@4) (SeqType T@@29))) (=> (and (and (and (not (= s0@@4 (|Seq#Empty| T@@29))) (not (= s1@@4 (|Seq#Empty| T@@29)))) (<= 0 m@@7)) (< m@@7 (|Seq#Length| s1@@4))) (and (= (|Seq#Sub| (|Seq#Add| m@@7 (|Seq#Length| s0@@4)) (|Seq#Length| s0@@4)) m@@7) (= (|Seq#Index| (|Seq#Append| s0@@4 s1@@4) (|Seq#Add| m@@7 (|Seq#Length| s0@@4))) (|Seq#Index| s1@@4 m@@7))))))
 :qid |stdinbpl.247:18|
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
(assert (forall ((s@@14 T@U) (x@@10 T@U) (i@@5 Int) ) (! (let ((T@@30 (type x@@10)))
 (=> (= (type s@@14) (SeqType T@@30)) (=> (and (and (<= 0 i@@5) (< i@@5 (|Seq#Length| s@@14))) (= (|Seq#Index| s@@14 i@@5) x@@10)) (|Seq#Contains| s@@14 x@@10))))
 :qid |stdinbpl.398:18|
 :skolemid |48|
 :pattern ( (|Seq#Contains| s@@14 x@@10) (|Seq#Index| s@@14 i@@5))
)))
(assert (forall ((s0@@5 T@U) (s1@@5 T@U) ) (! (let ((T@@31 (SeqTypeInv0 (type s0@@5))))
 (=> (and (= (type s0@@5) (SeqType T@@31)) (= (type s1@@5) (SeqType T@@31))) (or (or (and (= s0@@5 s1@@5) (|Seq#Equal| s0@@5 s1@@5)) (and (and (not (= s0@@5 s1@@5)) (not (|Seq#Equal| s0@@5 s1@@5))) (not (= (|Seq#Length| s0@@5) (|Seq#Length| s1@@5))))) (and (and (and (and (and (and (not (= s0@@5 s1@@5)) (not (|Seq#Equal| s0@@5 s1@@5))) (= (|Seq#Length| s0@@5) (|Seq#Length| s1@@5))) (= (|Seq#SkolemDiff| s0@@5 s1@@5) (|Seq#SkolemDiff| s1@@5 s0@@5))) (<= 0 (|Seq#SkolemDiff| s0@@5 s1@@5))) (< (|Seq#SkolemDiff| s0@@5 s1@@5) (|Seq#Length| s0@@5))) (not (= (|Seq#Index| s0@@5 (|Seq#SkolemDiff| s0@@5 s1@@5)) (|Seq#Index| s1@@5 (|Seq#SkolemDiff| s0@@5 s1@@5))))))))
 :qid |stdinbpl.502:18|
 :skolemid |52|
 :pattern ( (|Seq#Equal| s0@@5 s1@@5))
)))
(assert (forall ((p@@1 T@U) (v_1@@0 T@U) (q T@U) (w@@0 T@U) (r T@U) (u T@U) ) (! (let ((C@@3 (FieldTypeInv0 (type r))))
(let ((B@@10 (FieldTypeInv0 (type q))))
(let ((A@@11 (FieldTypeInv0 (type p@@1))))
 (=> (and (and (and (and (and (and (= (type p@@1) (FieldType A@@11 FrameTypeType)) (= (type v_1@@0) FrameTypeType)) (= (type q) (FieldType B@@10 FrameTypeType))) (= (type w@@0) FrameTypeType)) (= (type r) (FieldType C@@3 FrameTypeType))) (= (type u) FrameTypeType)) (and (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))) (InsidePredicate p@@1 v_1@@0 r u)))))
 :qid |stdinbpl.171:25|
 :skolemid |20|
 :pattern ( (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))
)))
(assert (forall ((s@@15 T@U) ) (! (let ((T@@32 (SeqTypeInv0 (type s@@15))))
 (=> (and (= (type s@@15) (SeqType T@@32)) (= (|Seq#Length| s@@15) 0)) (= s@@15 (|Seq#Empty| T@@32))))
 :qid |stdinbpl.206:18|
 :skolemid |24|
 :pattern ( (|Seq#Length| s@@15))
)))
(assert (forall ((s@@16 T@U) (n@@12 Int) ) (! (let ((T@@33 (SeqTypeInv0 (type s@@16))))
 (=> (and (= (type s@@16) (SeqType T@@33)) (<= n@@12 0)) (= (|Seq#Take| s@@16 n@@12) (|Seq#Empty| T@@33))))
 :qid |stdinbpl.381:18|
 :skolemid |46|
 :pattern ( (|Seq#Take| s@@16 n@@12))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun PostHeap@0 () T@U)
(declare-fun i_17 () Int)
(declare-fun next@7 () T@U)
(declare-fun Heap@@25 () T@U)
(declare-fun old_current () T@U)
(declare-fun current@3 () T@U)
(declare-fun i_15 () Int)
(declare-fun node@0 () T@U)
(declare-fun next@5 () T@U)
(declare-fun next@6 () T@U)
(declare-fun next@3 () T@U)
(declare-fun next@4 () T@U)
(declare-fun current@2 () T@U)
(declare-fun i_21 () Int)
(declare-fun t_2@@8 () T@U)
(declare-fun res@1 () Int)
(declare-fun i_6 () Int)
(declare-fun i_2 () Int)
(declare-fun next@2 () T@U)
(declare-fun current@1 () T@U)
(declare-fun i_7 () Int)
(declare-fun i_5 () Int)
(declare-fun res@0 () Int)
(declare-fun res@2 () Int)
(declare-fun i_1 () Int)
(declare-fun current@0 () T@U)
(declare-fun i@@6 () Int)
(declare-fun next@0 () T@U)
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (= (type current@0) (SeqType TreeDomainTypeType)) (= (type current@1) (SeqType TreeDomainTypeType))) (= (type Heap@@25) (MapType0Type RefType))) (= (type t_2@@8) TreeDomainTypeType)) (= (type next@2) (SeqType TreeDomainTypeType))) (= (type current@2) (SeqType TreeDomainTypeType))) (= (type next@3) (SeqType TreeDomainTypeType))) (= (type old_current) (SeqType TreeDomainTypeType))) (= (type current@3) (SeqType TreeDomainTypeType))) (= (type next@7) (SeqType TreeDomainTypeType))) (= (type node@0) TreeDomainTypeType)) (= (type next@6) (SeqType TreeDomainTypeType))) (= (type next@5) (SeqType TreeDomainTypeType))) (= (type next@4) (SeqType TreeDomainTypeType))) (= (type next@0) (SeqType TreeDomainTypeType))) (= (type PostHeap@0) (MapType0Type RefType))))
(set-info :boogie-vc-id computeTreeHeight)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 78) (let ((anon65_Else_correct true))
(let ((anon65_Then_correct true))
(let ((anon64_Then_correct  (=> (and (state PostHeap@0 ZeroMask) (state PostHeap@0 ZeroMask)) (and (=> (= (ControlFlow 0 76) 74) anon65_Then_correct) (=> (= (ControlFlow 0 76) 75) anon65_Else_correct)))))
(let ((anon55_correct true))
(let ((anon92_Else_correct  (=> (and (not (and (>= i_17 0) (< i_17 (|Seq#Length| next@7)))) (= (ControlFlow 0 57) 54)) anon55_correct)))
(let ((anon92_Then_correct  (=> (and (>= i_17 0) (< i_17 (|Seq#Length| next@7))) (and (=> (= (ControlFlow 0 55) (- 0 56)) (= (Tree_tag (|Seq#Index| next@7 i_17)) 1)) (=> (= (Tree_tag (|Seq#Index| next@7 i_17)) 1) (=> (= (ControlFlow 0 55) 54) anon55_correct))))))
(let ((anon91_Else_correct  (=> (and (forall ((i_18_1 Int) ) (!  (=> (and (>= i_18_1 0) (< i_18_1 (|Seq#Length| next@7))) (= (Tree_tag (|Seq#Index| next@7 i_18_1)) 1))
 :qid |stdinbpl.1184:36|
 :skolemid |89|
 :pattern ( (Tree_tag (|Seq#Index| next@7 i_18_1)))
)) (= (ControlFlow 0 53) (- 0 52))) (|Seq#Equal| (children_seq Heap@@25 old_current) (|Seq#Append| (children_seq Heap@@25 current@3) next@7)))))
(let ((anon89_Else_correct  (=> (forall ((i_16_1 Int) ) (!  (=> (and (>= i_16_1 0) (< i_16_1 (|Seq#Length| current@3))) (= (Tree_tag (|Seq#Index| current@3 i_16_1)) 1))
 :qid |stdinbpl.1173:36|
 :skolemid |88|
 :pattern ( (Tree_tag (|Seq#Index| current@3 i_16_1)))
)) (and (and (=> (= (ControlFlow 0 58) 53) anon91_Else_correct) (=> (= (ControlFlow 0 58) 55) anon92_Then_correct)) (=> (= (ControlFlow 0 58) 57) anon92_Else_correct)))))
(let ((anon51_correct true))
(let ((anon90_Else_correct  (=> (and (not (and (>= i_15 0) (< i_15 (|Seq#Length| current@3)))) (= (ControlFlow 0 51) 48)) anon51_correct)))
(let ((anon90_Then_correct  (=> (and (>= i_15 0) (< i_15 (|Seq#Length| current@3))) (and (=> (= (ControlFlow 0 49) (- 0 50)) (= (Tree_tag (|Seq#Index| current@3 i_15)) 1)) (=> (= (Tree_tag (|Seq#Index| current@3 i_15)) 1) (=> (= (ControlFlow 0 49) 48) anon51_correct))))))
(let ((anon48_correct  (=> (state Heap@@25 ZeroMask) (and (and (=> (= (ControlFlow 0 59) 58) anon89_Else_correct) (=> (= (ControlFlow 0 59) 49) anon90_Then_correct)) (=> (= (ControlFlow 0 59) 51) anon90_Else_correct)))))
(let ((anon88_Else_correct  (=> (not (= (Tree_tag (get_Tree_right node@0)) 1)) (=> (and (= next@7 next@5) (= (ControlFlow 0 61) 59)) anon48_correct))))
(let ((anon88_Then_correct  (=> (= (Tree_tag (get_Tree_right node@0)) 1) (=> (and (and (= next@6 (|Seq#Append| (|Seq#Singleton| (get_Tree_right node@0)) next@5)) (state Heap@@25 ZeroMask)) (and (= next@7 next@6) (= (ControlFlow 0 60) 59))) anon48_correct))))
(let ((anon46_correct  (=> (state Heap@@25 ZeroMask) (and (=> (= (ControlFlow 0 62) 60) anon88_Then_correct) (=> (= (ControlFlow 0 62) 61) anon88_Else_correct)))))
(let ((anon87_Else_correct  (=> (not (= (Tree_tag (get_Tree_left node@0)) 1)) (=> (and (= next@5 next@3) (= (ControlFlow 0 64) 62)) anon46_correct))))
(let ((anon87_Then_correct  (=> (= (Tree_tag (get_Tree_left node@0)) 1) (=> (and (and (= next@4 (|Seq#Append| (|Seq#Singleton| (get_Tree_left node@0)) next@3)) (state Heap@@25 ZeroMask)) (and (= next@5 next@4) (= (ControlFlow 0 63) 62))) anon46_correct))))
(let ((anon86_Then_correct  (=> (and (and (and (state Heap@@25 ZeroMask) (forall ((i_13 Int) ) (!  (=> (and (>= i_13 0) (< i_13 (|Seq#Length| current@2))) (= (Tree_tag (|Seq#Index| current@2 i_13)) 1))
 :qid |stdinbpl.1117:36|
 :skolemid |86|
 :pattern ( (Tree_tag (|Seq#Index| current@2 i_13)))
))) (and (forall ((i_14 Int) ) (!  (=> (and (>= i_14 0) (< i_14 (|Seq#Length| next@3))) (= (Tree_tag (|Seq#Index| next@3 i_14)) 1))
 :qid |stdinbpl.1121:36|
 :skolemid |87|
 :pattern ( (Tree_tag (|Seq#Index| next@3 i_14)))
)) (state Heap@@25 ZeroMask))) (and (and (|Seq#Equal| (children_seq Heap@@25 old_current) (|Seq#Append| (children_seq Heap@@25 current@2) next@3)) (state Heap@@25 ZeroMask)) (and (> (|Seq#Length| current@2) 0) (state Heap@@25 ZeroMask)))) (and (=> (= (ControlFlow 0 65) (- 0 66)) (< 0 (|Seq#Length| current@2))) (=> (< 0 (|Seq#Length| current@2)) (=> (and (and (= node@0 (|Seq#Index| current@2 0)) (state Heap@@25 ZeroMask)) (and (= current@3 (|Seq#Drop| current@2 1)) (state Heap@@25 ZeroMask))) (and (=> (= (ControlFlow 0 65) 63) anon87_Then_correct) (=> (= (ControlFlow 0 65) 64) anon87_Else_correct))))))))
(let ((anon60_correct true))
(let ((anon94_Else_correct  (=> (and (not (and (>= i_21 0) (< i_21 (|Seq#Length| next@3)))) (= (ControlFlow 0 46) 43)) anon60_correct)))
(let ((anon94_Then_correct  (=> (and (>= i_21 0) (< i_21 (|Seq#Length| next@3))) (and (=> (= (ControlFlow 0 44) (- 0 45)) (= (Tree_tag (|Seq#Index| next@3 i_21)) 1)) (=> (= (Tree_tag (|Seq#Index| next@3 i_21)) 1) (=> (= (ControlFlow 0 44) 43) anon60_correct))))))
(let ((anon93_Else_correct  (=> (and (forall ((i_22_1 Int) ) (!  (=> (and (>= i_22_1 0) (< i_22_1 (|Seq#Length| next@3))) (= (Tree_tag (|Seq#Index| next@3 i_22_1)) 1))
 :qid |stdinbpl.1223:28|
 :skolemid |92|
 :pattern ( (Tree_tag (|Seq#Index| next@3 i_22_1)))
)) (= (ControlFlow 0 42) (- 0 41))) (= (height Heap@@25 t_2@@8) (+ res@1 (height_recursive Heap@@25 next@3))))))
(let ((anon86_Else_correct  (=> (not (> (|Seq#Length| current@2) 0)) (=> (and (and (and (state Heap@@25 ZeroMask) (forall ((i_19 Int) ) (!  (=> (and (>= i_19 0) (< i_19 (|Seq#Length| current@2))) (= (Tree_tag (|Seq#Index| current@2 i_19)) 1))
 :qid |stdinbpl.1197:34|
 :skolemid |90|
 :pattern ( (Tree_tag (|Seq#Index| current@2 i_19)))
))) (and (forall ((i_20 Int) ) (!  (=> (and (>= i_20 0) (< i_20 (|Seq#Length| next@3))) (= (Tree_tag (|Seq#Index| next@3 i_20)) 1))
 :qid |stdinbpl.1201:34|
 :skolemid |91|
 :pattern ( (Tree_tag (|Seq#Index| next@3 i_20)))
)) (state Heap@@25 ZeroMask))) (and (and (|Seq#Equal| (children_seq Heap@@25 old_current) (|Seq#Append| (children_seq Heap@@25 current@2) next@3)) (state Heap@@25 ZeroMask)) (and (state Heap@@25 ZeroMask) (state Heap@@25 ZeroMask)))) (and (and (=> (= (ControlFlow 0 47) 42) anon93_Else_correct) (=> (= (ControlFlow 0 47) 44) anon94_Then_correct)) (=> (= (ControlFlow 0 47) 46) anon94_Else_correct))))))
(let ((anon85_Else_correct true))
(let ((anon85_Then_correct true))
(let ((anon84_Then_correct true))
(let ((anon82_Else_correct  (=> (forall ((i_12 Int) ) (!  (=> (and (>= i_12 0) (< i_12 (|Seq#Length| next@3))) (= (Tree_tag (|Seq#Index| next@3 i_12)) 1))
 :qid |stdinbpl.1088:36|
 :skolemid |85|
 :pattern ( (Tree_tag (|Seq#Index| next@3 i_12)))
)) (=> (and (state Heap@@25 ZeroMask) (state Heap@@25 ZeroMask)) (and (and (=> (= (ControlFlow 0 39) 36) anon84_Then_correct) (=> (= (ControlFlow 0 39) 37) anon85_Then_correct)) (=> (= (ControlFlow 0 39) 38) anon85_Else_correct))))))
(let ((anon37_correct true))
(let ((anon83_Else_correct  (=> (and (not (and (>= i_6 0) (< i_6 (|Seq#Length| next@3)))) (= (ControlFlow 0 35) 31)) anon37_correct)))
(let ((anon83_Then_correct  (=> (and (>= i_6 0) (< i_6 (|Seq#Length| next@3))) (and (=> (= (ControlFlow 0 32) (- 0 34)) (>= i_6 0)) (=> (>= i_6 0) (and (=> (= (ControlFlow 0 32) (- 0 33)) (< i_6 (|Seq#Length| next@3))) (=> (< i_6 (|Seq#Length| next@3)) (=> (= (ControlFlow 0 32) 31) anon37_correct))))))))
(let ((anon80_Else_correct  (=> (and (forall ((i_10 Int) ) (!  (=> (and (>= i_10 0) (< i_10 (|Seq#Length| current@2))) (= (Tree_tag (|Seq#Index| current@2 i_10)) 1))
 :qid |stdinbpl.1072:36|
 :skolemid |84|
 :pattern ( (Tree_tag (|Seq#Index| current@2 i_10)))
)) (state Heap@@25 ZeroMask)) (and (and (=> (= (ControlFlow 0 40) 39) anon82_Else_correct) (=> (= (ControlFlow 0 40) 32) anon83_Then_correct)) (=> (= (ControlFlow 0 40) 35) anon83_Else_correct)))))
(let ((anon33_correct true))
(let ((anon81_Else_correct  (=> (and (not (and (>= i_2 0) (< i_2 (|Seq#Length| current@2)))) (= (ControlFlow 0 30) 26)) anon33_correct)))
(let ((anon81_Then_correct  (=> (and (>= i_2 0) (< i_2 (|Seq#Length| current@2))) (and (=> (= (ControlFlow 0 27) (- 0 29)) (>= i_2 0)) (=> (>= i_2 0) (and (=> (= (ControlFlow 0 27) (- 0 28)) (< i_2 (|Seq#Length| current@2))) (=> (< i_2 (|Seq#Length| current@2)) (=> (= (ControlFlow 0 27) 26) anon33_correct))))))))
(let ((anon77_Else_correct  (=> (forall ((i_8_1 Int) ) (!  (=> (and (>= i_8_1 0) (< i_8_1 (|Seq#Length| next@2))) (= (Tree_tag (|Seq#Index| next@2 i_8_1)) 1))
 :qid |stdinbpl.1049:36|
 :skolemid |83|
 :pattern ( (Tree_tag (|Seq#Index| next@2 i_8_1)))
)) (and (=> (= (ControlFlow 0 67) (- 0 68)) (|Seq#Equal| (children_seq Heap@@25 old_current) (|Seq#Append| (children_seq Heap@@25 current@1) next@2))) (=> (|Seq#Equal| (children_seq Heap@@25 old_current) (|Seq#Append| (children_seq Heap@@25 current@1) next@2)) (and (and (and (and (=> (= (ControlFlow 0 67) 65) anon86_Then_correct) (=> (= (ControlFlow 0 67) 47) anon86_Else_correct)) (=> (= (ControlFlow 0 67) 40) anon80_Else_correct)) (=> (= (ControlFlow 0 67) 27) anon81_Then_correct)) (=> (= (ControlFlow 0 67) 30) anon81_Else_correct)))))))
(let ((anon28_correct true))
(let ((anon78_Else_correct  (=> (and (not (and (>= i_7 0) (< i_7 (|Seq#Length| next@2)))) (= (ControlFlow 0 25) 22)) anon28_correct)))
(let ((anon78_Then_correct  (=> (and (>= i_7 0) (< i_7 (|Seq#Length| next@2))) (and (=> (= (ControlFlow 0 23) (- 0 24)) (= (Tree_tag (|Seq#Index| next@2 i_7)) 1)) (=> (= (Tree_tag (|Seq#Index| next@2 i_7)) 1) (=> (= (ControlFlow 0 23) 22) anon28_correct))))))
(let ((anon75_Else_correct  (=> (forall ((i_6_1 Int) ) (!  (=> (and (>= i_6_1 0) (< i_6_1 (|Seq#Length| current@1))) (= (Tree_tag (|Seq#Index| current@1 i_6_1)) 1))
 :qid |stdinbpl.1038:36|
 :skolemid |82|
 :pattern ( (Tree_tag (|Seq#Index| current@1 i_6_1)))
)) (and (and (=> (= (ControlFlow 0 69) 67) anon77_Else_correct) (=> (= (ControlFlow 0 69) 23) anon78_Then_correct)) (=> (= (ControlFlow 0 69) 25) anon78_Else_correct)))))
(let ((anon24_correct true))
(let ((anon76_Else_correct  (=> (and (not (and (>= i_5 0) (< i_5 (|Seq#Length| current@1)))) (= (ControlFlow 0 21) 18)) anon24_correct)))
(let ((anon76_Then_correct  (=> (and (>= i_5 0) (< i_5 (|Seq#Length| current@1))) (and (=> (= (ControlFlow 0 19) (- 0 20)) (= (Tree_tag (|Seq#Index| current@1 i_5)) 1)) (=> (= (Tree_tag (|Seq#Index| current@1 i_5)) 1) (=> (= (ControlFlow 0 19) 18) anon24_correct))))))
(let ((anon74_Then_correct  (=> (and (state Heap@@25 ZeroMask) (forall ((i_4 Int) ) (!  (=> (and (>= i_4 0) (< i_4 (|Seq#Length| current@1))) (= (Tree_tag (|Seq#Index| current@1 i_4)) 1))
 :qid |stdinbpl.998:28|
 :skolemid |81|
 :pattern ( (Tree_tag (|Seq#Index| current@1 i_4)))
))) (=> (and (and (state Heap@@25 ZeroMask) (= (height Heap@@25 t_2@@8) (+ res@0 (height_recursive Heap@@25 current@1)))) (and (state Heap@@25 ZeroMask) (> (|Seq#Length| current@1) 0))) (=> (and (and (and (state Heap@@25 ZeroMask) (= res@1 (+ res@0 1))) (and (state Heap@@25 ZeroMask) (= next@2 (|Seq#Empty| TreeDomainTypeType)))) (and (and (state Heap@@25 ZeroMask) (|Seq#Equal| old_current current@1)) (and (state Heap@@25 ZeroMask) (state Heap@@25 ZeroMask)))) (and (and (=> (= (ControlFlow 0 70) 69) anon75_Else_correct) (=> (= (ControlFlow 0 70) 19) anon76_Then_correct)) (=> (= (ControlFlow 0 70) 21) anon76_Else_correct)))))))
(let ((anon63_correct  (=> (and (state Heap@@25 ZeroMask) (= (ControlFlow 0 15) (- 0 14))) (= (height Heap@@25 t_2@@8) res@2))))
(let ((anon74_Else_correct  (=> (not (> (|Seq#Length| current@1) 0)) (=> (and (and (and (state Heap@@25 ZeroMask) (forall ((i_23 Int) ) (!  (=> (and (>= i_23 0) (< i_23 (|Seq#Length| current@1))) (= (Tree_tag (|Seq#Index| current@1 i_23)) 1))
 :qid |stdinbpl.1236:26|
 :skolemid |93|
 :pattern ( (Tree_tag (|Seq#Index| current@1 i_23)))
))) (and (state Heap@@25 ZeroMask) (= (height Heap@@25 t_2@@8) (+ res@0 (height_recursive Heap@@25 current@1))))) (and (and (state Heap@@25 ZeroMask) (state Heap@@25 ZeroMask)) (and (= res@2 res@0) (= (ControlFlow 0 17) 15)))) anon63_correct))))
(let ((anon66_Then_correct  (=> (and (and (= (Tree_tag t_2@@8) 0) (state Heap@@25 ZeroMask)) (and (= res@2 0) (= (ControlFlow 0 16) 15))) anon63_correct)))
(let ((anon73_Else_correct true))
(let ((anon73_Then_correct true))
(let ((anon72_Then_correct true))
(let ((anon70_Else_correct  (=> (forall ((i_3 Int) ) (!  (=> (and (>= i_3 0) (< i_3 (|Seq#Length| current@1))) (= (Tree_tag (|Seq#Index| current@1 i_3)) 1))
 :qid |stdinbpl.969:28|
 :skolemid |80|
 :pattern ( (Tree_tag (|Seq#Index| current@1 i_3)))
)) (=> (and (state Heap@@25 ZeroMask) (state Heap@@25 ZeroMask)) (and (and (=> (= (ControlFlow 0 13) 10) anon72_Then_correct) (=> (= (ControlFlow 0 13) 11) anon73_Then_correct)) (=> (= (ControlFlow 0 13) 12) anon73_Else_correct))))))
(let ((anon14_correct true))
(let ((anon71_Else_correct  (=> (and (not (and (>= i_1 0) (< i_1 (|Seq#Length| current@1)))) (= (ControlFlow 0 9) 5)) anon14_correct)))
(let ((anon71_Then_correct  (=> (and (>= i_1 0) (< i_1 (|Seq#Length| current@1))) (and (=> (= (ControlFlow 0 6) (- 0 8)) (>= i_1 0)) (=> (>= i_1 0) (and (=> (= (ControlFlow 0 6) (- 0 7)) (< i_1 (|Seq#Length| current@1))) (=> (< i_1 (|Seq#Length| current@1)) (=> (= (ControlFlow 0 6) 5) anon14_correct))))))))
(let ((anon67_Else_correct  (=> (forall ((i_1_1 Int) ) (!  (=> (and (>= i_1_1 0) (< i_1_1 (|Seq#Length| current@0))) (= (Tree_tag (|Seq#Index| current@0 i_1_1)) 1))
 :qid |stdinbpl.946:28|
 :skolemid |79|
 :pattern ( (Tree_tag (|Seq#Index| current@0 i_1_1)))
)) (and (=> (= (ControlFlow 0 71) (- 0 72)) (= (height Heap@@25 t_2@@8) (+ 0 (height_recursive Heap@@25 current@0)))) (=> (= (height Heap@@25 t_2@@8) (+ 0 (height_recursive Heap@@25 current@0))) (and (and (and (and (=> (= (ControlFlow 0 71) 70) anon74_Then_correct) (=> (= (ControlFlow 0 71) 17) anon74_Else_correct)) (=> (= (ControlFlow 0 71) 13) anon70_Else_correct)) (=> (= (ControlFlow 0 71) 6) anon71_Then_correct)) (=> (= (ControlFlow 0 71) 9) anon71_Else_correct)))))))
(let ((anon9_correct true))
(let ((anon68_Else_correct  (=> (and (not (and (>= i@@6 0) (< i@@6 (|Seq#Length| current@0)))) (= (ControlFlow 0 4) 1)) anon9_correct)))
(let ((anon68_Then_correct  (=> (and (>= i@@6 0) (< i@@6 (|Seq#Length| current@0))) (and (=> (= (ControlFlow 0 2) (- 0 3)) (= (Tree_tag (|Seq#Index| current@0 i@@6)) 1)) (=> (= (Tree_tag (|Seq#Index| current@0 i@@6)) 1) (=> (= (ControlFlow 0 2) 1) anon9_correct))))))
(let ((anon66_Else_correct  (=> (and (not (= (Tree_tag t_2@@8) 0)) (= current@0 (|Seq#Singleton| t_2@@8))) (=> (and (and (state Heap@@25 ZeroMask) (= next@0 (|Seq#Empty| TreeDomainTypeType))) (and (state Heap@@25 ZeroMask) (state Heap@@25 ZeroMask))) (and (and (=> (= (ControlFlow 0 73) 71) anon67_Else_correct) (=> (= (ControlFlow 0 73) 2) anon68_Then_correct)) (=> (= (ControlFlow 0 73) 4) anon68_Else_correct))))))
(let ((anon0_correct  (=> (and (state Heap@@25 ZeroMask) (= AssumeFunctionsAbove (- 0 1))) (and (and (=> (= (ControlFlow 0 77) 76) anon64_Then_correct) (=> (= (ControlFlow 0 77) 16) anon66_Then_correct)) (=> (= (ControlFlow 0 77) 73) anon66_Else_correct)))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 78) 77) anon0_correct)))
PreconditionGeneratedEntry_correct)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
))
(check-sat)
(pop 1)
; Valid
(get-info :rlimit)
