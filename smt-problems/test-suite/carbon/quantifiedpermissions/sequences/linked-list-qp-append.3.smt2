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
(declare-fun next () T@U)
(declare-fun val () T@U)
(declare-fun value () T@U)
(declare-fun nodes () T@U)
(declare-fun data () T@U)
(declare-fun FieldType (T@T T@T) T@T)
(declare-fun FieldTypeInv0 (T@T) T@T)
(declare-fun FieldTypeInv1 (T@T) T@T)
(declare-fun NormalFieldType () T@T)
(declare-fun RefType () T@T)
(declare-fun SeqType (T@T) T@T)
(declare-fun SeqTypeInv0 (T@T) T@T)
(declare-fun |Seq#Length| (T@U) Int)
(declare-fun |Seq#Drop| (T@U Int) T@U)
(declare-fun succHeap (T@U T@U) Bool)
(declare-fun MapType0Type (T@T) T@T)
(declare-fun succHeapTrans (T@U T@U) Bool)
(declare-fun MapType0TypeInv0 (T@T) T@T)
(declare-fun MapType0Select (T@U T@U T@U) T@U)
(declare-fun MapType0Store (T@U T@U T@U T@U) T@U)
(declare-fun state (T@U T@U) Bool)
(declare-fun MapType1Type (T@T T@T) T@T)
(declare-fun GoodMask (T@U) Bool)
(declare-fun MapType1TypeInv0 (T@T) T@T)
(declare-fun MapType1TypeInv1 (T@T) T@T)
(declare-fun MapType1Select (T@U T@U T@U) T@U)
(declare-fun MapType1Store (T@U T@U T@U T@U) T@U)
(declare-fun |itemAt'| (T@U T@U Int) Int)
(declare-fun dummyFunction (T@U) Bool)
(declare-fun |itemAt#triggerStateless| (T@U Int) Int)
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
(declare-fun List (T@U) T@U)
(declare-fun PredicateType_ListType () T@T)
(declare-fun |length'| (T@U T@U) Int)
(declare-fun |length#triggerStateless| (T@U) Int)
(declare-fun |List#trigger| (T@U T@U) Bool)
(declare-fun |List#everUsed| (T@U) Bool)
(declare-fun |Seq#Update| (T@U Int T@U) T@U)
(declare-fun |Seq#Take| (T@U Int) T@U)
(declare-fun |Seq#Contains| (T@U T@U) Bool)
(declare-fun |Seq#Range| (Int Int) T@U)
(declare-fun |Seq#Skolem| (T@U T@U) Int)
(declare-fun length (T@U T@U) Int)
(declare-fun |Seq#Singleton| (T@U) T@U)
(declare-fun |List#sm| (T@U) T@U)
(declare-fun |Seq#Empty| (T@T) T@U)
(declare-fun dummyHeap () T@U)
(declare-fun ZeroMask () T@U)
(declare-fun InsidePredicate (T@U T@U T@U T@U) Bool)
(declare-fun |Seq#Append| (T@U T@U) T@U)
(declare-fun sumMask (T@U T@U T@U) Bool)
(declare-fun ConditionalFrame (Real T@U) T@U)
(declare-fun EmptyFrame () T@U)
(declare-fun |List#condqp1| (T@U T@U) Int)
(declare-fun |sk_List#condqp1| (Int Int) Int)
(declare-fun NoPerm () Real)
(declare-fun FullPerm () Real)
(declare-fun |List#condqp2| (T@U T@U) Int)
(declare-fun |sk_List#condqp2| (Int Int) Int)
(declare-fun itemAt (T@U T@U Int) Int)
(declare-fun |Seq#Equal| (T@U T@U) Bool)
(declare-fun AssumeFunctionsAbove () Int)
(declare-fun |Seq#ContainsTrigger| (T@U T@U) Bool)
(declare-fun getPredWandId (T@U) Int)
(declare-fun |length#frame| (T@U T@U) Int)
(declare-fun ZeroPMask () T@U)
(declare-fun |Seq#SkolemDiff| (T@U T@U) Int)
(declare-fun |itemAt#frame| (T@U T@U Int) Int)
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
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (forall ((arg0@@11 T@T) (arg1 T@T) ) (! (= (Ctor (FieldType arg0@@11 arg1)) 6)
 :qid |ctor:FieldType|
)) (forall ((arg0@@12 T@T) (arg1@@0 T@T) ) (! (= (FieldTypeInv0 (FieldType arg0@@12 arg1@@0)) arg0@@12)
 :qid |typeInv:FieldTypeInv0|
 :pattern ( (FieldType arg0@@12 arg1@@0))
))) (forall ((arg0@@13 T@T) (arg1@@1 T@T) ) (! (= (FieldTypeInv1 (FieldType arg0@@13 arg1@@1)) arg1@@1)
 :qid |typeInv:FieldTypeInv1|
 :pattern ( (FieldType arg0@@13 arg1@@1))
))) (= (Ctor NormalFieldType) 7)) (= (type $allocated) (FieldType NormalFieldType boolType))) (= (Ctor RefType) 8)) (= (type next) (FieldType NormalFieldType RefType))) (= (type val) (FieldType NormalFieldType intType))) (= (type value) (FieldType NormalFieldType intType))) (forall ((arg0@@14 T@T) ) (! (= (Ctor (SeqType arg0@@14)) 9)
 :qid |ctor:SeqType|
))) (forall ((arg0@@15 T@T) ) (! (= (SeqTypeInv0 (SeqType arg0@@15)) arg0@@15)
 :qid |typeInv:SeqTypeInv0|
 :pattern ( (SeqType arg0@@15))
))) (= (type nodes) (FieldType NormalFieldType (SeqType RefType)))) (= (type data) (FieldType NormalFieldType (SeqType intType)))))
(assert (distinct $allocated next val value nodes data)
)
(assert (forall ((arg0@@16 T@U) (arg1@@2 Int) ) (! (let ((T (SeqTypeInv0 (type arg0@@16))))
(= (type (|Seq#Drop| arg0@@16 arg1@@2)) (SeqType T)))
 :qid |funType:Seq#Drop|
 :pattern ( (|Seq#Drop| arg0@@16 arg1@@2))
)))
(assert (forall ((s T@U) (n Int) ) (! (let ((T@@0 (SeqTypeInv0 (type s))))
 (=> (= (type s) (SeqType T@@0)) (and (=> (<= 0 n) (and (=> (<= n (|Seq#Length| s)) (= (|Seq#Length| (|Seq#Drop| s n)) (- (|Seq#Length| s) n))) (=> (< (|Seq#Length| s) n) (= (|Seq#Length| (|Seq#Drop| s n)) 0)))) (=> (< n 0) (= (|Seq#Length| (|Seq#Drop| s n)) (|Seq#Length| s))))))
 :qid |stdinbpl.317:18|
 :skolemid |38|
 :pattern ( (|Seq#Length| (|Seq#Drop| s n)))
 :pattern ( (|Seq#Length| s) (|Seq#Drop| s n))
)))
(assert  (and (and (and (and (and (forall ((arg0@@17 T@T) ) (! (= (Ctor (MapType0Type arg0@@17)) 10)
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
)))))
(assert (forall ((Heap0 T@U) (Heap1 T@U) ) (!  (=> (and (and (= (type Heap0) (MapType0Type RefType)) (= (type Heap1) (MapType0Type RefType))) (succHeap Heap0 Heap1)) (succHeapTrans Heap0 Heap1))
 :qid |stdinbpl.88:15|
 :skolemid |11|
 :pattern ( (succHeap Heap0 Heap1))
)))
(assert  (and (and (and (and (and (and (forall ((arg0@@21 T@T) (arg1@@5 T@T) ) (! (= (Ctor (MapType1Type arg0@@21 arg1@@5)) 11)
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
(assert (forall ((Heap@@0 T@U) (this T@U) (index Int) ) (!  (=> (and (= (type Heap@@0) (MapType0Type RefType)) (= (type this) RefType)) (dummyFunction (int_2_U (|itemAt#triggerStateless| this index))))
 :qid |stdinbpl.802:15|
 :skolemid |81|
 :pattern ( (|itemAt'| Heap@@0 this index))
)))
(assert (forall ((arg0@@26 T@U) (arg1@@10 Int) ) (! (let ((T@@1 (SeqTypeInv0 (type arg0@@26))))
(= (type (|Seq#Index| arg0@@26 arg1@@10)) T@@1))
 :qid |funType:Seq#Index|
 :pattern ( (|Seq#Index| arg0@@26 arg1@@10))
)))
(assert (forall ((s@@0 T@U) (n@@0 Int) (j Int) ) (! (let ((T@@2 (SeqTypeInv0 (type s@@0))))
 (=> (= (type s@@0) (SeqType T@@2)) (=> (and (and (< 0 n@@0) (<= 0 j)) (< j (- (|Seq#Length| s@@0) n@@0))) (and (= (|Seq#Sub| (|Seq#Add| j n@@0) n@@0) j) (= (|Seq#Index| (|Seq#Drop| s@@0 n@@0) j) (|Seq#Index| s@@0 (|Seq#Add| j n@@0)))))))
 :qid |stdinbpl.338:18|
 :skolemid |39|
 :pattern ( (|Seq#Index| (|Seq#Drop| s@@0 n@@0) j))
)))
(assert  (and (and (= (Ctor FrameTypeType) 12) (= (type null) RefType)) (forall ((arg0@@27 T@U) ) (! (let ((A (FieldTypeInv0 (type arg0@@27))))
(= (type (PredicateMaskField arg0@@27)) (FieldType A (MapType1Type RefType boolType))))
 :qid |funType:PredicateMaskField|
 :pattern ( (PredicateMaskField arg0@@27))
))))
(assert (forall ((Heap@@1 T@U) (ExhaleHeap T@U) (Mask@@0 T@U) (pm_f T@U) ) (! (let ((C (FieldTypeInv0 (type pm_f))))
 (=> (and (and (and (and (and (= (type Heap@@1) (MapType0Type RefType)) (= (type ExhaleHeap) (MapType0Type RefType))) (= (type Mask@@0) (MapType1Type RefType realType))) (= (type pm_f) (FieldType C FrameTypeType))) (IdenticalOnKnownLocations Heap@@1 ExhaleHeap Mask@@0)) (and (HasDirectPerm Mask@@0 null pm_f) (IsPredicateField pm_f))) (= (MapType0Select Heap@@1 null (PredicateMaskField pm_f)) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))))
 :qid |stdinbpl.47:19|
 :skolemid |2|
 :pattern ( (IdenticalOnKnownLocations Heap@@1 ExhaleHeap Mask@@0) (IsPredicateField pm_f) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))
)))
(assert (forall ((arg0@@28 T@U) ) (! (let ((A@@0 (FieldTypeInv0 (type arg0@@28))))
(= (type (WandMaskField arg0@@28)) (FieldType A@@0 (MapType1Type RefType boolType))))
 :qid |funType:WandMaskField|
 :pattern ( (WandMaskField arg0@@28))
)))
(assert (forall ((Heap@@2 T@U) (ExhaleHeap@@0 T@U) (Mask@@1 T@U) (pm_f@@0 T@U) ) (! (let ((C@@0 (FieldTypeInv0 (type pm_f@@0))))
 (=> (and (and (and (and (and (= (type Heap@@2) (MapType0Type RefType)) (= (type ExhaleHeap@@0) (MapType0Type RefType))) (= (type Mask@@1) (MapType1Type RefType realType))) (= (type pm_f@@0) (FieldType C@@0 FrameTypeType))) (IdenticalOnKnownLocations Heap@@2 ExhaleHeap@@0 Mask@@1)) (and (HasDirectPerm Mask@@1 null pm_f@@0) (IsWandField pm_f@@0))) (= (MapType0Select Heap@@2 null (WandMaskField pm_f@@0)) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))))
 :qid |stdinbpl.60:19|
 :skolemid |5|
 :pattern ( (IdenticalOnKnownLocations Heap@@2 ExhaleHeap@@0 Mask@@1) (IsWandField pm_f@@0) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))
)))
(assert  (and (= (Ctor PredicateType_ListType) 13) (forall ((arg0@@29 T@U) ) (! (= (type (List arg0@@29)) (FieldType PredicateType_ListType FrameTypeType))
 :qid |funType:List|
 :pattern ( (List arg0@@29))
))))
(assert (forall ((this@@0 T@U) ) (!  (=> (= (type this@@0) RefType) (IsPredicateField (List this@@0)))
 :qid |stdinbpl.1020:15|
 :skolemid |103|
 :pattern ( (List this@@0))
)))
(assert (forall ((Heap@@3 T@U) (this@@1 T@U) ) (!  (=> (and (= (type Heap@@3) (MapType0Type RefType)) (= (type this@@1) RefType)) (dummyFunction (int_2_U (|length#triggerStateless| this@@1))))
 :qid |stdinbpl.614:15|
 :skolemid |59|
 :pattern ( (|length'| Heap@@3 this@@1))
)))
(assert (forall ((Heap@@4 T@U) (this@@2 T@U) ) (!  (=> (and (= (type Heap@@4) (MapType0Type RefType)) (= (type this@@2) RefType)) (|List#everUsed| (List this@@2)))
 :qid |stdinbpl.1039:15|
 :skolemid |107|
 :pattern ( (|List#trigger| Heap@@4 (List this@@2)))
)))
(assert (forall ((arg0@@30 T@U) (arg1@@11 Int) (arg2@@3 T@U) ) (! (let ((T@@3 (type arg2@@3)))
(= (type (|Seq#Update| arg0@@30 arg1@@11 arg2@@3)) (SeqType T@@3)))
 :qid |funType:Seq#Update|
 :pattern ( (|Seq#Update| arg0@@30 arg1@@11 arg2@@3))
)))
(assert (forall ((s@@1 T@U) (i Int) (v T@U) (n@@1 Int) ) (! (let ((T@@4 (type v)))
 (=> (= (type s@@1) (SeqType T@@4)) (=> (and (<= 0 n@@1) (< n@@1 (|Seq#Length| s@@1))) (and (=> (= i n@@1) (= (|Seq#Index| (|Seq#Update| s@@1 i v) n@@1) v)) (=> (not (= i n@@1)) (= (|Seq#Index| (|Seq#Update| s@@1 i v) n@@1) (|Seq#Index| s@@1 n@@1)))))))
 :qid |stdinbpl.293:18|
 :skolemid |35|
 :pattern ( (|Seq#Index| (|Seq#Update| s@@1 i v) n@@1))
 :pattern ( (|Seq#Index| s@@1 n@@1) (|Seq#Update| s@@1 i v))
)))
(assert (forall ((arg0@@31 T@U) (arg1@@12 Int) ) (! (let ((T@@5 (SeqTypeInv0 (type arg0@@31))))
(= (type (|Seq#Take| arg0@@31 arg1@@12)) (SeqType T@@5)))
 :qid |funType:Seq#Take|
 :pattern ( (|Seq#Take| arg0@@31 arg1@@12))
)))
(assert (forall ((s@@2 T@U) (n@@2 Int) ) (! (let ((T@@6 (SeqTypeInv0 (type s@@2))))
 (=> (= (type s@@2) (SeqType T@@6)) (and (=> (<= 0 n@@2) (and (=> (<= n@@2 (|Seq#Length| s@@2)) (= (|Seq#Length| (|Seq#Take| s@@2 n@@2)) n@@2)) (=> (< (|Seq#Length| s@@2) n@@2) (= (|Seq#Length| (|Seq#Take| s@@2 n@@2)) (|Seq#Length| s@@2))))) (=> (< n@@2 0) (= (|Seq#Length| (|Seq#Take| s@@2 n@@2)) 0)))))
 :qid |stdinbpl.304:18|
 :skolemid |36|
 :pattern ( (|Seq#Length| (|Seq#Take| s@@2 n@@2)))
 :pattern ( (|Seq#Take| s@@2 n@@2) (|Seq#Length| s@@2))
)))
(assert (forall ((arg0@@32 Int) (arg1@@13 Int) ) (! (= (type (|Seq#Range| arg0@@32 arg1@@13)) (SeqType intType))
 :qid |funType:Seq#Range|
 :pattern ( (|Seq#Range| arg0@@32 arg1@@13))
)))
(assert (forall ((q@min Int) (q@max Int) (v@@0 T@U) ) (!  (=> (= (type v@@0) intType) (= (|Seq#Contains| (|Seq#Range| q@min q@max) v@@0)  (and (<= q@min (U_2_int v@@0)) (< (U_2_int v@@0) q@max))))
 :qid |stdinbpl.577:15|
 :skolemid |57|
 :pattern ( (|Seq#Contains| (|Seq#Range| q@min q@max) v@@0))
)))
(assert (forall ((s@@3 T@U) (x@@8 T@U) ) (! (let ((T@@7 (type x@@8)))
 (=> (and (= (type s@@3) (SeqType T@@7)) (|Seq#Contains| s@@3 x@@8)) (and (and (<= 0 (|Seq#Skolem| s@@3 x@@8)) (< (|Seq#Skolem| s@@3 x@@8) (|Seq#Length| s@@3))) (= (|Seq#Index| s@@3 (|Seq#Skolem| s@@3 x@@8)) x@@8))))
 :qid |stdinbpl.435:18|
 :skolemid |47|
 :pattern ( (|Seq#Contains| s@@3 x@@8))
)))
(assert (forall ((Heap@@5 T@U) (ExhaleHeap@@1 T@U) (Mask@@2 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@5) (MapType0Type RefType)) (= (type ExhaleHeap@@1) (MapType0Type RefType))) (= (type Mask@@2) (MapType1Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@5 ExhaleHeap@@1 Mask@@2)) (U_2_bool (MapType0Select Heap@@5 o_1 $allocated))) (U_2_bool (MapType0Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.73:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@5 ExhaleHeap@@1 Mask@@2) (MapType0Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert (forall ((Heap@@6 T@U) (this@@3 T@U) ) (!  (=> (and (= (type Heap@@6) (MapType0Type RefType)) (= (type this@@3) RefType)) (and (= (length Heap@@6 this@@3) (|length'| Heap@@6 this@@3)) (dummyFunction (int_2_U (|length#triggerStateless| this@@3)))))
 :qid |stdinbpl.610:15|
 :skolemid |58|
 :pattern ( (length Heap@@6 this@@3))
)))
(assert (forall ((s@@4 T@U) (n@@3 Int) ) (! (let ((T@@8 (SeqTypeInv0 (type s@@4))))
 (=> (and (= (type s@@4) (SeqType T@@8)) (<= n@@3 0)) (= (|Seq#Drop| s@@4 n@@3) s@@4)))
 :qid |stdinbpl.419:18|
 :skolemid |45|
 :pattern ( (|Seq#Drop| s@@4 n@@3))
)))
(assert (forall ((i@@0 Int) (j@@0 Int) ) (! (= (|Seq#Sub| i@@0 j@@0) (- i@@0 j@@0))
 :qid |stdinbpl.273:15|
 :skolemid |30|
 :pattern ( (|Seq#Sub| i@@0 j@@0))
)))
(assert (forall ((i@@1 Int) (j@@1 Int) ) (! (= (|Seq#Add| i@@1 j@@1) (+ i@@1 j@@1))
 :qid |stdinbpl.271:15|
 :skolemid |29|
 :pattern ( (|Seq#Add| i@@1 j@@1))
)))
(assert (forall ((arg0@@33 T@U) ) (! (let ((T@@9 (type arg0@@33)))
(= (type (|Seq#Singleton| arg0@@33)) (SeqType T@@9)))
 :qid |funType:Seq#Singleton|
 :pattern ( (|Seq#Singleton| arg0@@33))
)))
(assert (forall ((x@@9 T@U) (y@@1 T@U) ) (! (let ((T@@10 (type x@@9)))
 (=> (= (type y@@1) T@@10) (= (|Seq#Contains| (|Seq#Singleton| x@@9) y@@1) (= x@@9 y@@1))))
 :qid |stdinbpl.560:18|
 :skolemid |54|
 :pattern ( (|Seq#Contains| (|Seq#Singleton| x@@9) y@@1))
)))
(assert (forall ((s@@5 T@U) (n@@4 Int) (j@@2 Int) ) (! (let ((T@@11 (SeqTypeInv0 (type s@@5))))
 (=> (= (type s@@5) (SeqType T@@11)) (=> (and (and (<= 0 j@@2) (< j@@2 n@@4)) (< j@@2 (|Seq#Length| s@@5))) (= (|Seq#Index| (|Seq#Take| s@@5 n@@4) j@@2) (|Seq#Index| s@@5 j@@2)))))
 :qid |stdinbpl.312:18|
 :skolemid |37|
 :pattern ( (|Seq#Index| (|Seq#Take| s@@5 n@@4) j@@2))
 :pattern ( (|Seq#Index| s@@5 j@@2) (|Seq#Take| s@@5 n@@4))
)))
(assert (forall ((this@@4 T@U) (this2 T@U) ) (!  (=> (and (and (= (type this@@4) RefType) (= (type this2) RefType)) (= (List this@@4) (List this2))) (= this@@4 this2))
 :qid |stdinbpl.1030:15|
 :skolemid |105|
 :pattern ( (List this@@4) (List this2))
)))
(assert (forall ((arg0@@34 T@U) ) (! (= (type (|List#sm| arg0@@34)) (FieldType PredicateType_ListType (MapType1Type RefType boolType)))
 :qid |funType:List#sm|
 :pattern ( (|List#sm| arg0@@34))
)))
(assert (forall ((this@@5 T@U) (this2@@0 T@U) ) (!  (=> (and (and (= (type this@@5) RefType) (= (type this2@@0) RefType)) (= (|List#sm| this@@5) (|List#sm| this2@@0))) (= this@@5 this2@@0))
 :qid |stdinbpl.1034:15|
 :skolemid |106|
 :pattern ( (|List#sm| this@@5) (|List#sm| this2@@0))
)))
(assert (forall ((Heap@@7 T@U) (ExhaleHeap@@2 T@U) (Mask@@3 T@U) (o_1@@0 T@U) (f_2 T@U) ) (! (let ((B@@1 (FieldTypeInv1 (type f_2))))
(let ((A@@1 (FieldTypeInv0 (type f_2))))
 (=> (and (and (and (and (and (and (= (type Heap@@7) (MapType0Type RefType)) (= (type ExhaleHeap@@2) (MapType0Type RefType))) (= (type Mask@@3) (MapType1Type RefType realType))) (= (type o_1@@0) RefType)) (= (type f_2) (FieldType A@@1 B@@1))) (IdenticalOnKnownLocations Heap@@7 ExhaleHeap@@2 Mask@@3)) (HasDirectPerm Mask@@3 o_1@@0 f_2)) (= (MapType0Select Heap@@7 o_1@@0 f_2) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2)))))
 :qid |stdinbpl.42:22|
 :skolemid |1|
 :pattern ( (IdenticalOnKnownLocations Heap@@7 ExhaleHeap@@2 Mask@@3) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2))
)))
(assert (forall ((T@@12 T@T) ) (! (= (type (|Seq#Empty| T@@12)) (SeqType T@@12))
 :qid |funType:Seq#Empty|
 :pattern ( (|Seq#Empty| T@@12))
)))
(assert (forall ((T@@13 T@T) ) (! (= (|Seq#Length| (|Seq#Empty| T@@13)) 0)
 :skolemid |23|
)))
(assert  (and (= (type dummyHeap) (MapType0Type RefType)) (= (type ZeroMask) (MapType1Type RefType realType))))
(assert (state dummyHeap ZeroMask))
(assert (forall ((p T@U) (v_1 T@U) (w T@U) ) (! (let ((A@@2 (FieldTypeInv0 (type p))))
 (=> (and (and (= (type p) (FieldType A@@2 FrameTypeType)) (= (type v_1) FrameTypeType)) (= (type w) FrameTypeType)) (not (InsidePredicate p v_1 p w))))
 :qid |stdinbpl.216:19|
 :skolemid |21|
 :pattern ( (InsidePredicate p v_1 p w))
)))
(assert (forall ((arg0@@35 T@U) (arg1@@14 T@U) ) (! (let ((T@@14 (SeqTypeInv0 (type arg0@@35))))
(= (type (|Seq#Append| arg0@@35 arg1@@14)) (SeqType T@@14)))
 :qid |funType:Seq#Append|
 :pattern ( (|Seq#Append| arg0@@35 arg1@@14))
)))
(assert (forall ((s0 T@U) (s1 T@U) (n@@5 Int) ) (! (let ((T@@15 (SeqTypeInv0 (type s0))))
 (=> (and (= (type s0) (SeqType T@@15)) (= (type s1) (SeqType T@@15))) (=> (and (and (and (not (= s0 (|Seq#Empty| T@@15))) (not (= s1 (|Seq#Empty| T@@15)))) (<= (|Seq#Length| s0) n@@5)) (< n@@5 (|Seq#Length| (|Seq#Append| s0 s1)))) (and (= (|Seq#Add| (|Seq#Sub| n@@5 (|Seq#Length| s0)) (|Seq#Length| s0)) n@@5) (= (|Seq#Index| (|Seq#Append| s0 s1) n@@5) (|Seq#Index| s1 (|Seq#Sub| n@@5 (|Seq#Length| s0))))))))
 :qid |stdinbpl.284:18|
 :skolemid |32|
 :pattern ( (|Seq#Index| (|Seq#Append| s0 s1) n@@5))
)))
(assert  (not (IsPredicateField next)))
(assert  (not (IsWandField next)))
(assert  (not (IsPredicateField val)))
(assert  (not (IsWandField val)))
(assert  (not (IsPredicateField value)))
(assert  (not (IsWandField value)))
(assert  (not (IsPredicateField nodes)))
(assert  (not (IsWandField nodes)))
(assert  (not (IsPredicateField data)))
(assert  (not (IsWandField data)))
(assert (forall ((Heap@@8 T@U) (ExhaleHeap@@3 T@U) (Mask@@4 T@U) ) (!  (=> (and (and (and (= (type Heap@@8) (MapType0Type RefType)) (= (type ExhaleHeap@@3) (MapType0Type RefType))) (= (type Mask@@4) (MapType1Type RefType realType))) (IdenticalOnKnownLocations Heap@@8 ExhaleHeap@@3 Mask@@4)) (succHeap Heap@@8 ExhaleHeap@@3))
 :qid |stdinbpl.83:15|
 :skolemid |10|
 :pattern ( (IdenticalOnKnownLocations Heap@@8 ExhaleHeap@@3 Mask@@4))
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
(assert  (and (forall ((arg0@@36 Real) (arg1@@15 T@U) ) (! (= (type (ConditionalFrame arg0@@36 arg1@@15)) FrameTypeType)
 :qid |funType:ConditionalFrame|
 :pattern ( (ConditionalFrame arg0@@36 arg1@@15))
)) (= (type EmptyFrame) FrameTypeType)))
(assert (forall ((p@@0 Real) (f_6 T@U) ) (!  (=> (= (type f_6) FrameTypeType) (= (ConditionalFrame p@@0 f_6) (ite (> p@@0 0.0) f_6 EmptyFrame)))
 :qid |stdinbpl.204:15|
 :skolemid |19|
 :pattern ( (ConditionalFrame p@@0 f_6))
)))
(assert (forall ((q@min@@0 Int) (q@max@@0 Int) (j@@3 Int) ) (!  (=> (and (<= 0 j@@3) (< j@@3 (- q@max@@0 q@min@@0))) (= (U_2_int (|Seq#Index| (|Seq#Range| q@min@@0 q@max@@0) j@@3)) (+ q@min@@0 j@@3)))
 :qid |stdinbpl.575:15|
 :skolemid |56|
 :pattern ( (|Seq#Index| (|Seq#Range| q@min@@0 q@max@@0) j@@3))
)))
(assert (forall ((Heap2Heap T@U) (Heap1Heap T@U) (this@@6 T@U) ) (!  (=> (and (and (and (= (type Heap2Heap) (MapType0Type RefType)) (= (type Heap1Heap) (MapType0Type RefType))) (= (type this@@6) RefType)) (and (=  (and (and (<= 0 (|sk_List#condqp1| (|List#condqp1| Heap2Heap this@@6) (|List#condqp1| Heap1Heap this@@6))) (< (|sk_List#condqp1| (|List#condqp1| Heap2Heap this@@6) (|List#condqp1| Heap1Heap this@@6)) (|Seq#Length| (MapType0Select Heap2Heap this@@6 nodes)))) (< NoPerm FullPerm))  (and (and (<= 0 (|sk_List#condqp1| (|List#condqp1| Heap2Heap this@@6) (|List#condqp1| Heap1Heap this@@6))) (< (|sk_List#condqp1| (|List#condqp1| Heap2Heap this@@6) (|List#condqp1| Heap1Heap this@@6)) (|Seq#Length| (MapType0Select Heap1Heap this@@6 nodes)))) (< NoPerm FullPerm))) (=> (and (and (<= 0 (|sk_List#condqp1| (|List#condqp1| Heap2Heap this@@6) (|List#condqp1| Heap1Heap this@@6))) (< (|sk_List#condqp1| (|List#condqp1| Heap2Heap this@@6) (|List#condqp1| Heap1Heap this@@6)) (|Seq#Length| (MapType0Select Heap2Heap this@@6 nodes)))) (< NoPerm FullPerm)) (= (U_2_int (MapType0Select Heap2Heap (|Seq#Index| (MapType0Select Heap2Heap this@@6 nodes) (|sk_List#condqp1| (|List#condqp1| Heap2Heap this@@6) (|List#condqp1| Heap1Heap this@@6))) val)) (U_2_int (MapType0Select Heap1Heap (|Seq#Index| (MapType0Select Heap1Heap this@@6 nodes) (|sk_List#condqp1| (|List#condqp1| Heap2Heap this@@6) (|List#condqp1| Heap1Heap this@@6))) val)))))) (= (|List#condqp1| Heap2Heap this@@6) (|List#condqp1| Heap1Heap this@@6)))
 :qid |stdinbpl.1050:15|
 :skolemid |108|
 :pattern ( (|List#condqp1| Heap2Heap this@@6) (|List#condqp1| Heap1Heap this@@6) (succHeapTrans Heap2Heap Heap1Heap))
)))
(assert (forall ((Heap2Heap@@0 T@U) (Heap1Heap@@0 T@U) (this@@7 T@U) ) (!  (=> (and (and (and (= (type Heap2Heap@@0) (MapType0Type RefType)) (= (type Heap1Heap@@0) (MapType0Type RefType))) (= (type this@@7) RefType)) (and (=  (and (and (<= 0 (|sk_List#condqp2| (|List#condqp2| Heap2Heap@@0 this@@7) (|List#condqp2| Heap1Heap@@0 this@@7))) (< (|sk_List#condqp2| (|List#condqp2| Heap2Heap@@0 this@@7) (|List#condqp2| Heap1Heap@@0 this@@7)) (|Seq#Length| (MapType0Select Heap2Heap@@0 this@@7 nodes)))) (< NoPerm FullPerm))  (and (and (<= 0 (|sk_List#condqp2| (|List#condqp2| Heap2Heap@@0 this@@7) (|List#condqp2| Heap1Heap@@0 this@@7))) (< (|sk_List#condqp2| (|List#condqp2| Heap2Heap@@0 this@@7) (|List#condqp2| Heap1Heap@@0 this@@7)) (|Seq#Length| (MapType0Select Heap1Heap@@0 this@@7 nodes)))) (< NoPerm FullPerm))) (=> (and (and (<= 0 (|sk_List#condqp2| (|List#condqp2| Heap2Heap@@0 this@@7) (|List#condqp2| Heap1Heap@@0 this@@7))) (< (|sk_List#condqp2| (|List#condqp2| Heap2Heap@@0 this@@7) (|List#condqp2| Heap1Heap@@0 this@@7)) (|Seq#Length| (MapType0Select Heap2Heap@@0 this@@7 nodes)))) (< NoPerm FullPerm)) (= (MapType0Select Heap2Heap@@0 (|Seq#Index| (MapType0Select Heap2Heap@@0 this@@7 nodes) (|sk_List#condqp2| (|List#condqp2| Heap2Heap@@0 this@@7) (|List#condqp2| Heap1Heap@@0 this@@7))) next) (MapType0Select Heap1Heap@@0 (|Seq#Index| (MapType0Select Heap1Heap@@0 this@@7 nodes) (|sk_List#condqp2| (|List#condqp2| Heap2Heap@@0 this@@7) (|List#condqp2| Heap1Heap@@0 this@@7))) next))))) (= (|List#condqp2| Heap2Heap@@0 this@@7) (|List#condqp2| Heap1Heap@@0 this@@7)))
 :qid |stdinbpl.1061:15|
 :skolemid |109|
 :pattern ( (|List#condqp2| Heap2Heap@@0 this@@7) (|List#condqp2| Heap1Heap@@0 this@@7) (succHeapTrans Heap2Heap@@0 Heap1Heap@@0))
)))
(assert (forall ((Mask@@5 T@U) (o_2@@0 T@U) (f_4@@0 T@U) ) (! (let ((B@@3 (FieldTypeInv1 (type f_4@@0))))
(let ((A@@4 (FieldTypeInv0 (type f_4@@0))))
 (=> (and (and (= (type Mask@@5) (MapType1Type RefType realType)) (= (type o_2@@0) RefType)) (= (type f_4@@0) (FieldType A@@4 B@@3))) (= (HasDirectPerm Mask@@5 o_2@@0 f_4@@0) (> (U_2_real (MapType1Select Mask@@5 o_2@@0 f_4@@0)) NoPerm)))))
 :qid |stdinbpl.133:22|
 :skolemid |17|
 :pattern ( (HasDirectPerm Mask@@5 o_2@@0 f_4@@0))
)))
(assert (forall ((s0@@0 T@U) (s1@@0 T@U) ) (! (let ((T@@16 (SeqTypeInv0 (type s0@@0))))
 (=> (and (and (= (type s0@@0) (SeqType T@@16)) (= (type s1@@0) (SeqType T@@16))) (and (not (= s0@@0 (|Seq#Empty| T@@16))) (not (= s1@@0 (|Seq#Empty| T@@16))))) (= (|Seq#Length| (|Seq#Append| s0@@0 s1@@0)) (+ (|Seq#Length| s0@@0) (|Seq#Length| s1@@0)))))
 :qid |stdinbpl.253:18|
 :skolemid |26|
 :pattern ( (|Seq#Length| (|Seq#Append| s0@@0 s1@@0)))
)))
(assert (forall ((s@@6 T@U) (t T@U) (n@@6 Int) ) (! (let ((T@@17 (SeqTypeInv0 (type s@@6))))
 (=> (and (and (= (type s@@6) (SeqType T@@17)) (= (type t) (SeqType T@@17))) (and (> n@@6 0) (> n@@6 (|Seq#Length| s@@6)))) (and (= (|Seq#Add| (|Seq#Sub| n@@6 (|Seq#Length| s@@6)) (|Seq#Length| s@@6)) n@@6) (= (|Seq#Drop| (|Seq#Append| s@@6 t) n@@6) (|Seq#Drop| t (|Seq#Sub| n@@6 (|Seq#Length| s@@6)))))))
 :qid |stdinbpl.409:18|
 :skolemid |44|
 :pattern ( (|Seq#Drop| (|Seq#Append| s@@6 t) n@@6))
)))
(assert (forall ((Heap@@9 T@U) (this@@8 T@U) (index@@0 Int) ) (!  (=> (and (= (type Heap@@9) (MapType0Type RefType)) (= (type this@@8) RefType)) (and (= (itemAt Heap@@9 this@@8 index@@0) (|itemAt'| Heap@@9 this@@8 index@@0)) (dummyFunction (int_2_U (|itemAt#triggerStateless| this@@8 index@@0)))))
 :qid |stdinbpl.798:15|
 :skolemid |80|
 :pattern ( (itemAt Heap@@9 this@@8 index@@0))
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
 :qid |stdinbpl.396:18|
 :skolemid |42|
 :pattern ( (|Seq#Take| (|Seq#Append| s@@7 t@@0) n@@7))
)))
(assert (forall ((q@min@@1 Int) (q@max@@1 Int) ) (!  (and (=> (< q@min@@1 q@max@@1) (= (|Seq#Length| (|Seq#Range| q@min@@1 q@max@@1)) (- q@max@@1 q@min@@1))) (=> (<= q@max@@1 q@min@@1) (= (|Seq#Length| (|Seq#Range| q@min@@1 q@max@@1)) 0)))
 :qid |stdinbpl.574:15|
 :skolemid |55|
 :pattern ( (|Seq#Length| (|Seq#Range| q@min@@1 q@max@@1)))
)))
(assert (forall ((a T@U) (b T@U) ) (! (let ((T@@19 (SeqTypeInv0 (type a))))
 (=> (and (and (= (type a) (SeqType T@@19)) (= (type b) (SeqType T@@19))) (|Seq#Equal| a b)) (= a b)))
 :qid |stdinbpl.547:18|
 :skolemid |53|
 :pattern ( (|Seq#Equal| a b))
)))
(assert (forall ((Heap@@10 T@U) (Mask@@6 T@U) (this@@9 T@U) (index@@1 Int) ) (!  (=> (and (and (and (and (= (type Heap@@10) (MapType0Type RefType)) (= (type Mask@@6) (MapType1Type RefType realType))) (= (type this@@9) RefType)) (and (state Heap@@10 Mask@@6) (< AssumeFunctionsAbove 0))) (and (<= 0 index@@1) (< index@@1 (length Heap@@10 this@@9)))) (= (itemAt Heap@@10 this@@9 index@@1) (U_2_int (MapType0Select Heap@@10 (|Seq#Index| (MapType0Select Heap@@10 this@@9 nodes) index@@1) val))))
 :qid |stdinbpl.808:15|
 :skolemid |82|
 :pattern ( (state Heap@@10 Mask@@6) (itemAt Heap@@10 this@@9 index@@1))
 :pattern ( (state Heap@@10 Mask@@6) (|itemAt#triggerStateless| this@@9 index@@1) (|List#trigger| Heap@@10 (List this@@9)))
)))
(assert (forall ((s@@8 T@U) (i@@2 Int) ) (! (let ((T@@20 (SeqTypeInv0 (type s@@8))))
 (=> (= (type s@@8) (SeqType T@@20)) (=> (and (<= 0 i@@2) (< i@@2 (|Seq#Length| s@@8))) (|Seq#ContainsTrigger| s@@8 (|Seq#Index| s@@8 i@@2)))))
 :qid |stdinbpl.440:18|
 :skolemid |49|
 :pattern ( (|Seq#Index| s@@8 i@@2))
)))
(assert (forall ((s0@@1 T@U) (s1@@1 T@U) ) (! (let ((T@@21 (SeqTypeInv0 (type s0@@1))))
 (=> (and (= (type s0@@1) (SeqType T@@21)) (= (type s1@@1) (SeqType T@@21))) (and (=> (= s0@@1 (|Seq#Empty| T@@21)) (= (|Seq#Append| s0@@1 s1@@1) s1@@1)) (=> (= s1@@1 (|Seq#Empty| T@@21)) (= (|Seq#Append| s0@@1 s1@@1) s0@@1)))))
 :qid |stdinbpl.259:18|
 :skolemid |27|
 :pattern ( (|Seq#Append| s0@@1 s1@@1))
)))
(assert (forall ((t@@1 T@U) ) (! (= (|Seq#Index| (|Seq#Singleton| t@@1) 0) t@@1)
 :qid |stdinbpl.263:18|
 :skolemid |28|
 :pattern ( (|Seq#Singleton| t@@1))
)))
(assert (forall ((s@@9 T@U) ) (! (let ((T@@22 (SeqTypeInv0 (type s@@9))))
 (=> (= (type s@@9) (SeqType T@@22)) (<= 0 (|Seq#Length| s@@9))))
 :qid |stdinbpl.242:18|
 :skolemid |22|
 :pattern ( (|Seq#Length| s@@9))
)))
(assert (forall ((s0@@2 T@U) (s1@@2 T@U) ) (! (let ((T@@23 (SeqTypeInv0 (type s0@@2))))
 (=> (and (and (= (type s0@@2) (SeqType T@@23)) (= (type s1@@2) (SeqType T@@23))) (|Seq#Equal| s0@@2 s1@@2)) (and (= (|Seq#Length| s0@@2) (|Seq#Length| s1@@2)) (forall ((j@@4 Int) ) (!  (=> (and (<= 0 j@@4) (< j@@4 (|Seq#Length| s0@@2))) (= (|Seq#Index| s0@@2 j@@4) (|Seq#Index| s1@@2 j@@4)))
 :qid |stdinbpl.537:13|
 :skolemid |50|
 :pattern ( (|Seq#Index| s0@@2 j@@4))
 :pattern ( (|Seq#Index| s1@@2 j@@4))
)))))
 :qid |stdinbpl.534:18|
 :skolemid |51|
 :pattern ( (|Seq#Equal| s0@@2 s1@@2))
)))
(assert (forall ((Heap@@11 T@U) (ExhaleHeap@@4 T@U) (Mask@@7 T@U) (pm_f@@1 T@U) ) (! (let ((C@@1 (FieldTypeInv0 (type pm_f@@1))))
 (=> (and (and (and (and (and (= (type Heap@@11) (MapType0Type RefType)) (= (type ExhaleHeap@@4) (MapType0Type RefType))) (= (type Mask@@7) (MapType1Type RefType realType))) (= (type pm_f@@1) (FieldType C@@1 FrameTypeType))) (IdenticalOnKnownLocations Heap@@11 ExhaleHeap@@4 Mask@@7)) (and (HasDirectPerm Mask@@7 null pm_f@@1) (IsPredicateField pm_f@@1))) (forall ((o2 T@U) (f_2@@0 T@U) ) (! (let ((B@@5 (FieldTypeInv1 (type f_2@@0))))
(let ((A@@6 (FieldTypeInv0 (type f_2@@0))))
 (=> (and (and (= (type o2) RefType) (= (type f_2@@0) (FieldType A@@6 B@@5))) (U_2_bool (MapType1Select (MapType0Select Heap@@11 null (PredicateMaskField pm_f@@1)) o2 f_2@@0))) (= (MapType0Select Heap@@11 o2 f_2@@0) (MapType0Select ExhaleHeap@@4 o2 f_2@@0)))))
 :qid |stdinbpl.54:134|
 :skolemid |3|
 :pattern ( (MapType0Select ExhaleHeap@@4 o2 f_2@@0))
))))
 :qid |stdinbpl.52:19|
 :skolemid |4|
 :pattern ( (IdenticalOnKnownLocations Heap@@11 ExhaleHeap@@4 Mask@@7) (IsPredicateField pm_f@@1))
)))
(assert (forall ((Heap@@12 T@U) (ExhaleHeap@@5 T@U) (Mask@@8 T@U) (pm_f@@2 T@U) ) (! (let ((C@@2 (FieldTypeInv0 (type pm_f@@2))))
 (=> (and (and (and (and (and (= (type Heap@@12) (MapType0Type RefType)) (= (type ExhaleHeap@@5) (MapType0Type RefType))) (= (type Mask@@8) (MapType1Type RefType realType))) (= (type pm_f@@2) (FieldType C@@2 FrameTypeType))) (IdenticalOnKnownLocations Heap@@12 ExhaleHeap@@5 Mask@@8)) (and (HasDirectPerm Mask@@8 null pm_f@@2) (IsWandField pm_f@@2))) (forall ((o2@@0 T@U) (f_2@@1 T@U) ) (! (let ((B@@6 (FieldTypeInv1 (type f_2@@1))))
(let ((A@@7 (FieldTypeInv0 (type f_2@@1))))
 (=> (and (and (= (type o2@@0) RefType) (= (type f_2@@1) (FieldType A@@7 B@@6))) (U_2_bool (MapType1Select (MapType0Select Heap@@12 null (WandMaskField pm_f@@2)) o2@@0 f_2@@1))) (= (MapType0Select Heap@@12 o2@@0 f_2@@1) (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1)))))
 :qid |stdinbpl.67:129|
 :skolemid |6|
 :pattern ( (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1))
))))
 :qid |stdinbpl.65:19|
 :skolemid |7|
 :pattern ( (IdenticalOnKnownLocations Heap@@12 ExhaleHeap@@5 Mask@@8) (IsWandField pm_f@@2))
)))
(assert (forall ((this@@10 T@U) ) (!  (=> (= (type this@@10) RefType) (= (getPredWandId (List this@@10)) 0))
 :qid |stdinbpl.1024:15|
 :skolemid |104|
 :pattern ( (List this@@10))
)))
(assert (forall ((t@@2 T@U) ) (! (= (|Seq#Length| (|Seq#Singleton| t@@2)) 1)
 :qid |stdinbpl.250:18|
 :skolemid |25|
 :pattern ( (|Seq#Singleton| t@@2))
)))
(assert (forall ((Mask@@9 T@U) (o_2@@2 T@U) (f_4@@2 T@U) ) (! (let ((B@@7 (FieldTypeInv1 (type f_4@@2))))
(let ((A@@8 (FieldTypeInv0 (type f_4@@2))))
 (=> (and (and (and (= (type Mask@@9) (MapType1Type RefType realType)) (= (type o_2@@2) RefType)) (= (type f_4@@2) (FieldType A@@8 B@@7))) (GoodMask Mask@@9)) (and (>= (U_2_real (MapType1Select Mask@@9 o_2@@2 f_4@@2)) NoPerm) (=> (and (and (GoodMask Mask@@9) (not (IsPredicateField f_4@@2))) (not (IsWandField f_4@@2))) (<= (U_2_real (MapType1Select Mask@@9 o_2@@2 f_4@@2)) FullPerm))))))
 :qid |stdinbpl.128:22|
 :skolemid |16|
 :pattern ( (GoodMask Mask@@9) (MapType1Select Mask@@9 o_2@@2 f_4@@2))
)))
(assert (forall ((Heap@@13 T@U) (Mask@@10 T@U) (this@@11 T@U) ) (!  (=> (and (and (and (= (type Heap@@13) (MapType0Type RefType)) (= (type Mask@@10) (MapType1Type RefType realType))) (= (type this@@11) RefType)) (state Heap@@13 Mask@@10)) (= (|length'| Heap@@13 this@@11) (|length#frame| (MapType0Select Heap@@13 null (List this@@11)) this@@11)))
 :qid |stdinbpl.627:15|
 :skolemid |61|
 :pattern ( (state Heap@@13 Mask@@10) (|length'| Heap@@13 this@@11))
)))
(assert (forall ((o T@U) (f T@U) (Heap@@14 T@U) ) (!  (=> (and (and (and (= (type o) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap@@14) (MapType0Type RefType))) (U_2_bool (MapType0Select Heap@@14 o $allocated))) (U_2_bool (MapType0Select Heap@@14 (MapType0Select Heap@@14 o f) $allocated)))
 :qid |stdinbpl.31:15|
 :skolemid |0|
 :pattern ( (MapType0Select Heap@@14 o f))
)))
(assert (forall ((s@@10 T@U) (t@@3 T@U) (n@@8 Int) ) (! (let ((T@@24 (SeqTypeInv0 (type s@@10))))
 (=> (and (and (= (type s@@10) (SeqType T@@24)) (= (type t@@3) (SeqType T@@24))) (and (< 0 n@@8) (<= n@@8 (|Seq#Length| s@@10)))) (= (|Seq#Take| (|Seq#Append| s@@10 t@@3) n@@8) (|Seq#Take| s@@10 n@@8))))
 :qid |stdinbpl.392:18|
 :skolemid |41|
 :pattern ( (|Seq#Take| (|Seq#Append| s@@10 t@@3) n@@8))
)))
(assert (forall ((s@@11 T@U) (i@@3 Int) (v@@1 T@U) ) (! (let ((T@@25 (type v@@1)))
 (=> (= (type s@@11) (SeqType T@@25)) (=> (and (<= 0 i@@3) (< i@@3 (|Seq#Length| s@@11))) (= (|Seq#Length| (|Seq#Update| s@@11 i@@3 v@@1)) (|Seq#Length| s@@11)))))
 :qid |stdinbpl.291:18|
 :skolemid |34|
 :pattern ( (|Seq#Length| (|Seq#Update| s@@11 i@@3 v@@1)))
 :pattern ( (|Seq#Length| s@@11) (|Seq#Update| s@@11 i@@3 v@@1))
)))
(assert (forall ((this@@12 T@U) ) (!  (=> (= (type this@@12) RefType) (= (PredicateMaskField (List this@@12)) (|List#sm| this@@12)))
 :qid |stdinbpl.1016:15|
 :skolemid |102|
 :pattern ( (PredicateMaskField (List this@@12)))
)))
(assert (forall ((s@@12 T@U) (t@@4 T@U) (n@@9 Int) ) (! (let ((T@@26 (SeqTypeInv0 (type s@@12))))
 (=> (and (and (= (type s@@12) (SeqType T@@26)) (= (type t@@4) (SeqType T@@26))) (and (< 0 n@@9) (<= n@@9 (|Seq#Length| s@@12)))) (= (|Seq#Drop| (|Seq#Append| s@@12 t@@4) n@@9) (|Seq#Append| (|Seq#Drop| s@@12 n@@9) t@@4))))
 :qid |stdinbpl.405:18|
 :skolemid |43|
 :pattern ( (|Seq#Drop| (|Seq#Append| s@@12 t@@4) n@@9))
)))
(assert (forall ((s@@13 T@U) (n@@10 Int) (i@@4 Int) ) (! (let ((T@@27 (SeqTypeInv0 (type s@@13))))
 (=> (= (type s@@13) (SeqType T@@27)) (=> (and (and (< 0 n@@10) (<= n@@10 i@@4)) (< i@@4 (|Seq#Length| s@@13))) (and (= (|Seq#Add| (|Seq#Sub| i@@4 n@@10) n@@10) i@@4) (= (|Seq#Index| (|Seq#Drop| s@@13 n@@10) (|Seq#Sub| i@@4 n@@10)) (|Seq#Index| s@@13 i@@4))))))
 :qid |stdinbpl.342:18|
 :skolemid |40|
 :pattern ( (|Seq#Drop| s@@13 n@@10) (|Seq#Index| s@@13 i@@4))
)))
(assert (forall ((s0@@3 T@U) (s1@@3 T@U) (n@@11 Int) ) (! (let ((T@@28 (SeqTypeInv0 (type s0@@3))))
 (=> (and (= (type s0@@3) (SeqType T@@28)) (= (type s1@@3) (SeqType T@@28))) (=> (and (and (and (not (= s0@@3 (|Seq#Empty| T@@28))) (not (= s1@@3 (|Seq#Empty| T@@28)))) (<= 0 n@@11)) (< n@@11 (|Seq#Length| s0@@3))) (= (|Seq#Index| (|Seq#Append| s0@@3 s1@@3) n@@11) (|Seq#Index| s0@@3 n@@11)))))
 :qid |stdinbpl.282:18|
 :skolemid |31|
 :pattern ( (|Seq#Index| (|Seq#Append| s0@@3 s1@@3) n@@11))
 :pattern ( (|Seq#Index| s0@@3 n@@11) (|Seq#Append| s0@@3 s1@@3))
)))
(assert (forall ((Heap@@15 T@U) (o@@0 T@U) (f_3 T@U) (v@@2 T@U) ) (! (let ((B@@8 (type v@@2)))
(let ((A@@9 (FieldTypeInv0 (type f_3))))
 (=> (and (and (= (type Heap@@15) (MapType0Type RefType)) (= (type o@@0) RefType)) (= (type f_3) (FieldType A@@9 B@@8))) (succHeap Heap@@15 (MapType0Store Heap@@15 o@@0 f_3 v@@2)))))
 :qid |stdinbpl.78:22|
 :skolemid |9|
 :pattern ( (MapType0Store Heap@@15 o@@0 f_3 v@@2))
)))
(assert (forall ((s0@@4 T@U) (s1@@4 T@U) (m@@7 Int) ) (! (let ((T@@29 (SeqTypeInv0 (type s0@@4))))
 (=> (and (= (type s0@@4) (SeqType T@@29)) (= (type s1@@4) (SeqType T@@29))) (=> (and (and (and (not (= s0@@4 (|Seq#Empty| T@@29))) (not (= s1@@4 (|Seq#Empty| T@@29)))) (<= 0 m@@7)) (< m@@7 (|Seq#Length| s1@@4))) (and (= (|Seq#Sub| (|Seq#Add| m@@7 (|Seq#Length| s0@@4)) (|Seq#Length| s0@@4)) m@@7) (= (|Seq#Index| (|Seq#Append| s0@@4 s1@@4) (|Seq#Add| m@@7 (|Seq#Length| s0@@4))) (|Seq#Index| s1@@4 m@@7))))))
 :qid |stdinbpl.287:18|
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
 :qid |stdinbpl.438:18|
 :skolemid |48|
 :pattern ( (|Seq#Contains| s@@14 x@@10) (|Seq#Index| s@@14 i@@5))
)))
(assert (forall ((s0@@5 T@U) (s1@@5 T@U) ) (! (let ((T@@31 (SeqTypeInv0 (type s0@@5))))
 (=> (and (= (type s0@@5) (SeqType T@@31)) (= (type s1@@5) (SeqType T@@31))) (or (or (and (= s0@@5 s1@@5) (|Seq#Equal| s0@@5 s1@@5)) (and (and (not (= s0@@5 s1@@5)) (not (|Seq#Equal| s0@@5 s1@@5))) (not (= (|Seq#Length| s0@@5) (|Seq#Length| s1@@5))))) (and (and (and (and (and (and (not (= s0@@5 s1@@5)) (not (|Seq#Equal| s0@@5 s1@@5))) (= (|Seq#Length| s0@@5) (|Seq#Length| s1@@5))) (= (|Seq#SkolemDiff| s0@@5 s1@@5) (|Seq#SkolemDiff| s1@@5 s0@@5))) (<= 0 (|Seq#SkolemDiff| s0@@5 s1@@5))) (< (|Seq#SkolemDiff| s0@@5 s1@@5) (|Seq#Length| s0@@5))) (not (= (|Seq#Index| s0@@5 (|Seq#SkolemDiff| s0@@5 s1@@5)) (|Seq#Index| s1@@5 (|Seq#SkolemDiff| s0@@5 s1@@5))))))))
 :qid |stdinbpl.542:18|
 :skolemid |52|
 :pattern ( (|Seq#Equal| s0@@5 s1@@5))
)))
(assert (forall ((p@@1 T@U) (v_1@@0 T@U) (q T@U) (w@@0 T@U) (r T@U) (u T@U) ) (! (let ((C@@3 (FieldTypeInv0 (type r))))
(let ((B@@10 (FieldTypeInv0 (type q))))
(let ((A@@11 (FieldTypeInv0 (type p@@1))))
 (=> (and (and (and (and (and (and (= (type p@@1) (FieldType A@@11 FrameTypeType)) (= (type v_1@@0) FrameTypeType)) (= (type q) (FieldType B@@10 FrameTypeType))) (= (type w@@0) FrameTypeType)) (= (type r) (FieldType C@@3 FrameTypeType))) (= (type u) FrameTypeType)) (and (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))) (InsidePredicate p@@1 v_1@@0 r u)))))
 :qid |stdinbpl.211:25|
 :skolemid |20|
 :pattern ( (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))
)))
(assert (forall ((Heap@@16 T@U) (Mask@@11 T@U) (this@@13 T@U) (index@@2 Int) ) (!  (=> (and (and (and (= (type Heap@@16) (MapType0Type RefType)) (= (type Mask@@11) (MapType1Type RefType realType))) (= (type this@@13) RefType)) (state Heap@@16 Mask@@11)) (= (|itemAt'| Heap@@16 this@@13 index@@2) (|itemAt#frame| (MapType0Select Heap@@16 null (List this@@13)) this@@13 index@@2)))
 :qid |stdinbpl.815:15|
 :skolemid |83|
 :pattern ( (state Heap@@16 Mask@@11) (|itemAt'| Heap@@16 this@@13 index@@2))
)))
(assert (forall ((s@@15 T@U) ) (! (let ((T@@32 (SeqTypeInv0 (type s@@15))))
 (=> (and (= (type s@@15) (SeqType T@@32)) (= (|Seq#Length| s@@15) 0)) (= s@@15 (|Seq#Empty| T@@32))))
 :qid |stdinbpl.246:18|
 :skolemid |24|
 :pattern ( (|Seq#Length| s@@15))
)))
(assert (forall ((s@@16 T@U) (n@@12 Int) ) (! (let ((T@@33 (SeqTypeInv0 (type s@@16))))
 (=> (and (= (type s@@16) (SeqType T@@33)) (<= n@@12 0)) (= (|Seq#Take| s@@16 n@@12) (|Seq#Empty| T@@33))))
 :qid |stdinbpl.421:18|
 :skolemid |46|
 :pattern ( (|Seq#Take| s@@16 n@@12))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
(assert (forall ((Heap@@17 T@U) (Mask@@12 T@U) (this@@14 T@U) ) (!  (=> (and (and (and (= (type Heap@@17) (MapType0Type RefType)) (= (type Mask@@12) (MapType1Type RefType realType))) (= (type this@@14) RefType)) (and (state Heap@@17 Mask@@12) (< AssumeFunctionsAbove 1))) (= (length Heap@@17 this@@14) (|Seq#Length| (MapType0Select Heap@@17 this@@14 nodes))))
 :qid |stdinbpl.620:15|
 :skolemid |60|
 :pattern ( (state Heap@@17 Mask@@12) (length Heap@@17 this@@14))
 :pattern ( (state Heap@@17 Mask@@12) (|length#triggerStateless| this@@14) (|List#trigger| Heap@@17 (List this@@14)))
)))
(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun Mask@8 () T@U)
(declare-fun Mask@0 () T@U)
(declare-fun this@@15 () T@U)
(declare-fun Heap@@18 () T@U)
(declare-fun PostMask@0 () T@U)
(declare-fun i_14 () Int)
(declare-fun PostMask@1 () T@U)
(declare-fun PostHeap@0 () T@U)
(declare-fun elem () Int)
(declare-fun PostMask@3 () T@U)
(declare-fun i_2 () Int)
(declare-fun Heap@14 () T@U)
(declare-fun Mask@7 () T@U)
(declare-fun Mask@6 () T@U)
(declare-fun Heap@12 () T@U)
(declare-fun Heap@11 () T@U)
(declare-fun newPMask@0 () T@U)
(declare-fun Heap@13 () T@U)
(declare-fun newPMask@1 () T@U)
(declare-fun Heap@8 () T@U)
(declare-fun Heap@9 () T@U)
(declare-fun Heap@10 () T@U)
(declare-fun freshVersion@0 () T@U)
(declare-fun QPMask@3 () T@U)
(declare-fun CombineFrames (T@U T@U) T@U)
(declare-fun FrameFragment (T@U) T@U)
(declare-fun i_14_1 () Int)
(declare-fun neverTriggered9 (Int) Bool)
(declare-fun Mask@5 () T@U)
(declare-fun qpRange9 (T@U) Bool)
(declare-fun invRecv9 (T@U) Int)
(declare-fun QPMask@2 () T@U)
(declare-fun neverTriggered10 (Int) Bool)
(declare-fun qpRange10 (T@U) Bool)
(declare-fun invRecv10 (T@U) Int)
(declare-fun i_10_1 () Int)
(declare-fun j_1_1 () Int)
(declare-fun Mask@4 () T@U)
(declare-fun Heap@4 () T@U)
(declare-fun Heap@7 () T@U)
(declare-fun freshObj@0 () T@U)
(declare-fun Heap@5 () T@U)
(declare-fun Heap@6 () T@U)
(declare-fun Heap@2 () T@U)
(declare-fun Heap@3 () T@U)
(declare-fun i_15 () Int)
(declare-fun Mask@2 () T@U)
(declare-fun Mask@1 () T@U)
(declare-fun Heap@1 () T@U)
(declare-fun qpRange7 (T@U) Bool)
(declare-fun invRecv7 (T@U) Int)
(declare-fun QPMask@0 () T@U)
(declare-fun qpRange8 (T@U) Bool)
(declare-fun invRecv8 (T@U) Int)
(declare-fun QPMask@1 () T@U)
(declare-fun Mask@3 () T@U)
(declare-fun Heap@0 () T@U)
(declare-fun newVersion@0 () T@U)
(declare-fun n@@13 () T@U)
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (= (type Mask@0) (MapType1Type RefType realType)) (= (type this@@15) RefType)) (= (type Heap@2) (MapType0Type RefType))) (= (type Mask@4) (MapType1Type RefType realType))) (= (type Heap@8) (MapType0Type RefType))) (= (type Heap@14) (MapType0Type RefType))) (= (type Heap@@18) (MapType0Type RefType))) (= (type Mask@7) (MapType1Type RefType realType))) (= (type Mask@6) (MapType1Type RefType realType))) (= (type Heap@12) (MapType0Type RefType))) (= (type Heap@11) (MapType0Type RefType))) (= (type newPMask@0) (MapType1Type RefType boolType))) (= (type Heap@13) (MapType0Type RefType))) (= (type newPMask@1) (MapType1Type RefType boolType))) (= (type Heap@9) (MapType0Type RefType))) (= (type Heap@10) (MapType0Type RefType))) (= (type freshVersion@0) FrameTypeType)) (= (type QPMask@3) (MapType1Type RefType realType))) (forall ((arg0@@37 T@U) (arg1@@16 T@U) ) (! (= (type (CombineFrames arg0@@37 arg1@@16)) FrameTypeType)
 :qid |funType:CombineFrames|
 :pattern ( (CombineFrames arg0@@37 arg1@@16))
))) (forall ((arg0@@38 T@U) ) (! (= (type (FrameFragment arg0@@38)) FrameTypeType)
 :qid |funType:FrameFragment|
 :pattern ( (FrameFragment arg0@@38))
))) (= (type Mask@5) (MapType1Type RefType realType))) (= (type QPMask@2) (MapType1Type RefType realType))) (= (type Heap@4) (MapType0Type RefType))) (= (type Heap@5) (MapType0Type RefType))) (= (type freshObj@0) RefType)) (= (type Heap@6) (MapType0Type RefType))) (= (type Heap@7) (MapType0Type RefType))) (= (type Heap@3) (MapType0Type RefType))) (= (type Mask@2) (MapType1Type RefType realType))) (= (type Mask@1) (MapType1Type RefType realType))) (= (type Heap@1) (MapType0Type RefType))) (= (type QPMask@0) (MapType1Type RefType realType))) (= (type QPMask@1) (MapType1Type RefType realType))) (= (type Mask@3) (MapType1Type RefType realType))) (= (type Heap@0) (MapType0Type RefType))) (= (type newVersion@0) FrameTypeType)) (= (type n@@13) RefType)) (= (type PostMask@0) (MapType1Type RefType realType))) (= (type PostMask@3) (MapType1Type RefType realType))) (= (type PostHeap@0) (MapType0Type RefType))) (= (type PostMask@1) (MapType1Type RefType realType))) (= (type Mask@8) (MapType1Type RefType realType))))
(set-info :boogie-vc-id append)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 133) (let ((anon12_correct  (=> (= Mask@8 (MapType1Store Mask@0 null (List this@@15) (real_2_U (- (U_2_real (MapType1Select Mask@0 null (List this@@15))) FullPerm)))) (and (=> (= (ControlFlow 0 126) (- 0 127)) (<= 0 (- (length Heap@@18 this@@15) 1))) (=> (<= 0 (- (length Heap@@18 this@@15) 1)) (=> (= (ControlFlow 0 126) (- 0 125)) (< (- (length Heap@@18 this@@15) 1) (length Heap@@18 this@@15))))))))
(let ((anon88_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 130) 126)) anon12_correct)))
(let ((anon88_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 128) (- 0 129)) (<= FullPerm (U_2_real (MapType1Select Mask@0 null (List this@@15))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@0 null (List this@@15)))) (=> (= (ControlFlow 0 128) 126) anon12_correct))))))
(let ((anon8_correct true))
(let ((anon86_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 124) 121)) anon8_correct)))
(let ((anon86_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 122) (- 0 123)) (<= FullPerm (U_2_real (MapType1Select Mask@0 null (List this@@15))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@0 null (List this@@15)))) (=> (= (ControlFlow 0 122) 121) anon8_correct))))))
(let ((anon36_correct true))
(let ((anon101_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 113) 110)) anon36_correct)))
(let ((anon101_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 111) (- 0 112)) (<= FullPerm (U_2_real (MapType1Select PostMask@0 null (List this@@15))))) (=> (<= FullPerm (U_2_real (MapType1Select PostMask@0 null (List this@@15)))) (=> (= (ControlFlow 0 111) 110) anon36_correct))))))
(let ((anon45_correct  (and (=> (= (ControlFlow 0 103) (- 0 104)) (<= 0 i_14)) (=> (<= 0 i_14) (=> (= (ControlFlow 0 103) (- 0 102)) (< i_14 (length Heap@@18 this@@15)))))))
(let ((anon106_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 107) 103)) anon45_correct)))
(let ((anon106_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 105) (- 0 106)) (<= FullPerm (U_2_real (MapType1Select Mask@0 null (List this@@15))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@0 null (List this@@15)))) (=> (= (ControlFlow 0 105) 103) anon45_correct))))))
(let ((anon41_correct  (=> (= PostMask@1 (MapType1Store PostMask@0 null (List this@@15) (real_2_U (- (U_2_real (MapType1Select PostMask@0 null (List this@@15))) FullPerm)))) (and (=> (= (ControlFlow 0 97) (- 0 98)) (<= 0 i_14)) (=> (<= 0 i_14) (=> (= (ControlFlow 0 97) (- 0 96)) (< i_14 (length PostHeap@0 this@@15))))))))
(let ((anon104_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 101) 97)) anon41_correct)))
(let ((anon104_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 99) (- 0 100)) (<= FullPerm (U_2_real (MapType1Select PostMask@0 null (List this@@15))))) (=> (<= FullPerm (U_2_real (MapType1Select PostMask@0 null (List this@@15)))) (=> (= (ControlFlow 0 99) 97) anon41_correct))))))
(let ((anon46_correct true))
(let ((anon102_Then_correct  (=> (and (<= 0 i_14) (< i_14 (- (length PostHeap@0 this@@15) 1))) (and (and (and (and (=> (= (ControlFlow 0 108) 94) anon46_correct) (=> (= (ControlFlow 0 108) 105) anon106_Then_correct)) (=> (= (ControlFlow 0 108) 107) anon106_Else_correct)) (=> (= (ControlFlow 0 108) 99) anon104_Then_correct)) (=> (= (ControlFlow 0 108) 101) anon104_Else_correct)))))
(let ((anon102_Else_correct  (=> (and (not (and (<= 0 i_14) (< i_14 (- (length PostHeap@0 this@@15) 1)))) (= (ControlFlow 0 95) 94)) anon46_correct)))
(let ((anon99_Then_correct  (=> (<= 0 i_14) (and (and (and (=> (= (ControlFlow 0 114) 108) anon102_Then_correct) (=> (= (ControlFlow 0 114) 95) anon102_Else_correct)) (=> (= (ControlFlow 0 114) 111) anon101_Then_correct)) (=> (= (ControlFlow 0 114) 113) anon101_Else_correct)))))
(let ((anon99_Else_correct  (=> (< i_14 0) (and (=> (= (ControlFlow 0 109) 108) anon102_Then_correct) (=> (= (ControlFlow 0 109) 95) anon102_Else_correct)))))
(let ((anon98_Else_correct true))
(let ((anon96_Else_correct  (=> (= (itemAt PostHeap@0 this@@15 (- (length PostHeap@0 this@@15) 1)) elem) (=> (and (state PostHeap@0 PostMask@0) (state PostHeap@0 PostMask@0)) (and (and (=> (= (ControlFlow 0 115) 93) anon98_Else_correct) (=> (= (ControlFlow 0 115) 114) anon99_Then_correct)) (=> (= (ControlFlow 0 115) 109) anon99_Else_correct))))))
(let ((anon30_correct  (=> (= PostMask@3 (MapType1Store PostMask@0 null (List this@@15) (real_2_U (- (U_2_real (MapType1Select PostMask@0 null (List this@@15))) FullPerm)))) (and (=> (= (ControlFlow 0 88) (- 0 89)) (<= 0 (- (length PostHeap@0 this@@15) 1))) (=> (<= 0 (- (length PostHeap@0 this@@15) 1)) (=> (= (ControlFlow 0 88) (- 0 87)) (< (- (length PostHeap@0 this@@15) 1) (length PostHeap@0 this@@15))))))))
(let ((anon97_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 92) 88)) anon30_correct)))
(let ((anon97_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 90) (- 0 91)) (<= FullPerm (U_2_real (MapType1Select PostMask@0 null (List this@@15))))) (=> (<= FullPerm (U_2_real (MapType1Select PostMask@0 null (List this@@15)))) (=> (= (ControlFlow 0 90) 88) anon30_correct))))))
(let ((anon26_correct true))
(let ((anon95_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 86) 83)) anon26_correct)))
(let ((anon95_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 84) (- 0 85)) (<= FullPerm (U_2_real (MapType1Select PostMask@0 null (List this@@15))))) (=> (<= FullPerm (U_2_real (MapType1Select PostMask@0 null (List this@@15)))) (=> (= (ControlFlow 0 84) 83) anon26_correct))))))
(let ((anon92_Else_correct  (=> (= (length PostHeap@0 this@@15) (+ (length Heap@@18 this@@15) 1)) (=> (and (state PostHeap@0 PostMask@0) (state PostHeap@0 PostMask@0)) (and (and (and (and (=> (= (ControlFlow 0 116) 115) anon96_Else_correct) (=> (= (ControlFlow 0 116) 90) anon97_Then_correct)) (=> (= (ControlFlow 0 116) 92) anon97_Else_correct)) (=> (= (ControlFlow 0 116) 84) anon95_Then_correct)) (=> (= (ControlFlow 0 116) 86) anon95_Else_correct))))))
(let ((anon22_correct true))
(let ((anon93_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 82) 79)) anon22_correct)))
(let ((anon93_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 80) (- 0 81)) (<= FullPerm (U_2_real (MapType1Select Mask@0 null (List this@@15))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@0 null (List this@@15)))) (=> (= (ControlFlow 0 80) 79) anon22_correct))))))
(let ((anon18_correct true))
(let ((anon91_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 78) 75)) anon18_correct)))
(let ((anon91_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 76) (- 0 77)) (<= FullPerm (U_2_real (MapType1Select PostMask@0 null (List this@@15))))) (=> (<= FullPerm (U_2_real (MapType1Select PostMask@0 null (List this@@15)))) (=> (= (ControlFlow 0 76) 75) anon18_correct))))))
(let ((anon89_Then_correct  (=> (state PostHeap@0 ZeroMask) (=> (and (and (= PostMask@0 (MapType1Store ZeroMask null (List this@@15) (real_2_U (+ (U_2_real (MapType1Select ZeroMask null (List this@@15))) FullPerm)))) (state PostHeap@0 PostMask@0)) (and (state PostHeap@0 PostMask@0) (state PostHeap@0 PostMask@0))) (and (and (and (and (=> (= (ControlFlow 0 117) 116) anon92_Else_correct) (=> (= (ControlFlow 0 117) 80) anon93_Then_correct)) (=> (= (ControlFlow 0 117) 82) anon93_Else_correct)) (=> (= (ControlFlow 0 117) 76) anon91_Then_correct)) (=> (= (ControlFlow 0 117) 78) anon91_Else_correct))))))
(let ((anon80_correct true))
(let ((anon122_Else_correct  (=> (and (not (and (<= 0 i_2) (< i_2 (- (length Heap@14 this@@15) 1)))) (= (ControlFlow 0 30) 27)) anon80_correct)))
(let ((anon122_Then_correct  (=> (and (<= 0 i_2) (< i_2 (- (length Heap@14 this@@15) 1))) (and (=> (= (ControlFlow 0 28) (- 0 29)) (= (itemAt Heap@14 this@@15 i_2) (itemAt Heap@@18 this@@15 i_2))) (=> (= (itemAt Heap@14 this@@15 i_2) (itemAt Heap@@18 this@@15 i_2)) (=> (= (ControlFlow 0 28) 27) anon80_correct))))))
(let ((anon121_Else_correct true))
(let ((anon77_correct  (=> (= Mask@7 (MapType1Store Mask@6 null (List this@@15) (real_2_U (- (U_2_real (MapType1Select Mask@6 null (List this@@15))) FullPerm)))) (and (=> (= (ControlFlow 0 31) (- 0 33)) (= (length Heap@14 this@@15) (+ (length Heap@@18 this@@15) 1))) (=> (= (length Heap@14 this@@15) (+ (length Heap@@18 this@@15) 1)) (and (=> (= (ControlFlow 0 31) (- 0 32)) (= (itemAt Heap@14 this@@15 (- (length Heap@14 this@@15) 1)) elem)) (=> (= (itemAt Heap@14 this@@15 (- (length Heap@14 this@@15) 1)) elem) (and (and (=> (= (ControlFlow 0 31) 26) anon121_Else_correct) (=> (= (ControlFlow 0 31) 28) anon122_Then_correct)) (=> (= (ControlFlow 0 31) 30) anon122_Else_correct)))))))))
(let ((anon120_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 36) 31)) anon77_correct)))
(let ((anon120_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 34) (- 0 35)) (<= FullPerm (U_2_real (MapType1Select Mask@6 null (List this@@15))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@6 null (List this@@15)))) (=> (= (ControlFlow 0 34) 31) anon77_correct))))))
(let ((anon75_correct  (=> (= Heap@12 (MapType0Store Heap@11 null (|List#sm| this@@15) (MapType1Store (MapType0Select Heap@11 null (|List#sm| this@@15)) this@@15 nodes (bool_2_U true)))) (=> (and (and (and (forall ((o_8 T@U) (f_11 T@U) ) (! (let ((B@@11 (FieldTypeInv1 (type f_11))))
(let ((A@@12 (FieldTypeInv0 (type f_11))))
 (=> (and (and (= (type o_8) RefType) (= (type f_11) (FieldType A@@12 B@@11))) (U_2_bool (MapType1Select (MapType0Select Heap@12 null (|List#sm| this@@15)) o_8 f_11))) (U_2_bool (MapType1Select newPMask@0 o_8 f_11)))))
 :qid |stdinbpl.1881:27|
 :skolemid |154|
 :pattern ( (MapType1Select newPMask@0 o_8 f_11))
)) (forall ((i_16 Int) ) (!  (=> (and (<= 0 i_16) (< i_16 (|Seq#Length| (MapType0Select Heap@12 this@@15 nodes)))) (U_2_bool (MapType1Select newPMask@0 (|Seq#Index| (MapType0Select Heap@12 this@@15 nodes) i_16) val)))
 :qid |stdinbpl.1885:20|
 :skolemid |155|
))) (and (= Heap@13 (MapType0Store Heap@12 null (|List#sm| this@@15) newPMask@0)) (forall ((o_9 T@U) (f_12 T@U) ) (! (let ((B@@12 (FieldTypeInv1 (type f_12))))
(let ((A@@13 (FieldTypeInv0 (type f_12))))
 (=> (and (and (= (type o_9) RefType) (= (type f_12) (FieldType A@@13 B@@12))) (U_2_bool (MapType1Select (MapType0Select Heap@13 null (|List#sm| this@@15)) o_9 f_12))) (U_2_bool (MapType1Select newPMask@1 o_9 f_12)))))
 :qid |stdinbpl.1892:27|
 :skolemid |156|
 :pattern ( (MapType1Select newPMask@1 o_9 f_12))
)))) (and (and (forall ((i_17 Int) ) (!  (=> (and (<= 0 i_17) (< i_17 (|Seq#Length| (MapType0Select Heap@13 this@@15 nodes)))) (U_2_bool (MapType1Select newPMask@1 (|Seq#Index| (MapType0Select Heap@13 this@@15 nodes) i_17) next)))
 :qid |stdinbpl.1896:20|
 :skolemid |157|
)) (= Heap@14 (MapType0Store Heap@13 null (|List#sm| this@@15) newPMask@1))) (and (state Heap@14 Mask@6) (state Heap@14 Mask@6)))) (and (=> (= (ControlFlow 0 37) 34) anon120_Then_correct) (=> (= (ControlFlow 0 37) 36) anon120_Else_correct))))))
(let ((anon119_Else_correct  (=> (HasDirectPerm Mask@6 null (List this@@15)) (=> (and (= Heap@11 Heap@8) (= (ControlFlow 0 39) 37)) anon75_correct))))
(let ((anon119_Then_correct  (=> (not (HasDirectPerm Mask@6 null (List this@@15))) (=> (and (and (= Heap@9 (MapType0Store Heap@8 null (|List#sm| this@@15) ZeroPMask)) (= Heap@10 (MapType0Store Heap@9 null (List this@@15) freshVersion@0))) (and (= Heap@11 Heap@10) (= (ControlFlow 0 38) 37))) anon75_correct))))
(let ((anon116_Else_correct  (=> (and (forall ((i_15_1 Int) ) (!  (=> (and (<= 0 i_15_1) (< i_15_1 (|Seq#Length| (MapType0Select Heap@8 this@@15 nodes)))) (and (|Seq#Contains| (MapType0Select Heap@8 this@@15 nodes) (|Seq#Index| (MapType0Select Heap@8 this@@15 nodes) i_15_1)) (ite (< i_15_1 (- (|Seq#Length| (MapType0Select Heap@8 this@@15 nodes)) 1)) (= (MapType0Select Heap@8 (|Seq#Index| (MapType0Select Heap@8 this@@15 nodes) i_15_1) next) (|Seq#Index| (MapType0Select Heap@8 this@@15 nodes) (+ i_15_1 1))) (= (MapType0Select Heap@8 (|Seq#Index| (MapType0Select Heap@8 this@@15 nodes) i_15_1) next) null))))
 :qid |stdinbpl.1863:20|
 :skolemid |153|
 :pattern ( (MapType0Select Heap@8 (|Seq#Index| (MapType0Select Heap@8 this@@15 nodes) i_15_1) next))
)) (= Mask@6 (MapType1Store QPMask@3 null (List this@@15) (real_2_U (+ (U_2_real (MapType1Select QPMask@3 null (List this@@15))) FullPerm))))) (=> (and (and (state Heap@8 Mask@6) (state Heap@8 Mask@6)) (and (|List#trigger| Heap@8 (List this@@15)) (= (MapType0Select Heap@8 null (List this@@15)) (CombineFrames (FrameFragment (MapType0Select Heap@8 this@@15 nodes)) (CombineFrames (FrameFragment (int_2_U (|List#condqp1| Heap@8 this@@15))) (FrameFragment (int_2_U (|List#condqp2| Heap@8 this@@15)))))))) (and (=> (= (ControlFlow 0 40) 38) anon119_Then_correct) (=> (= (ControlFlow 0 40) 39) anon119_Else_correct))))))
(let ((anon72_correct true))
(let ((anon118_Else_correct  (=> (<= (- (|Seq#Length| (MapType0Select Heap@8 this@@15 nodes)) 1) i_14_1) (and (=> (= (ControlFlow 0 22) (- 0 23)) (= (MapType0Select Heap@8 (|Seq#Index| (MapType0Select Heap@8 this@@15 nodes) i_14_1) next) null)) (=> (= (MapType0Select Heap@8 (|Seq#Index| (MapType0Select Heap@8 this@@15 nodes) i_14_1) next) null) (=> (= (ControlFlow 0 22) 18) anon72_correct))))))
(let ((anon118_Then_correct  (=> (< i_14_1 (- (|Seq#Length| (MapType0Select Heap@8 this@@15 nodes)) 1)) (and (=> (= (ControlFlow 0 20) (- 0 21)) (= (MapType0Select Heap@8 (|Seq#Index| (MapType0Select Heap@8 this@@15 nodes) i_14_1) next) (|Seq#Index| (MapType0Select Heap@8 this@@15 nodes) (+ i_14_1 1)))) (=> (= (MapType0Select Heap@8 (|Seq#Index| (MapType0Select Heap@8 this@@15 nodes) i_14_1) next) (|Seq#Index| (MapType0Select Heap@8 this@@15 nodes) (+ i_14_1 1))) (=> (= (ControlFlow 0 20) 18) anon72_correct))))))
(let ((anon117_Then_correct  (=> (and (<= 0 i_14_1) (< i_14_1 (|Seq#Length| (MapType0Select Heap@8 this@@15 nodes)))) (and (=> (= (ControlFlow 0 24) (- 0 25)) (|Seq#Contains| (MapType0Select Heap@8 this@@15 nodes) (|Seq#Index| (MapType0Select Heap@8 this@@15 nodes) i_14_1))) (=> (|Seq#Contains| (MapType0Select Heap@8 this@@15 nodes) (|Seq#Index| (MapType0Select Heap@8 this@@15 nodes) i_14_1)) (and (=> (= (ControlFlow 0 24) 20) anon118_Then_correct) (=> (= (ControlFlow 0 24) 22) anon118_Else_correct)))))))
(let ((anon117_Else_correct  (=> (and (not (and (<= 0 i_14_1) (< i_14_1 (|Seq#Length| (MapType0Select Heap@8 this@@15 nodes))))) (= (ControlFlow 0 19) 18)) anon72_correct)))
(let ((anon114_Else_correct  (=> (forall ((i_11_1 Int) (j_2_1 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| (MapType0Select Heap@8 this@@15 nodes))) (int_2_U i_11_1)) (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| (MapType0Select Heap@8 this@@15 nodes))) (int_2_U j_2_1)) (not (= i_11_1 j_2_1)))) (not (= (|Seq#Index| (MapType0Select Heap@8 this@@15 nodes) i_11_1) (|Seq#Index| (MapType0Select Heap@8 this@@15 nodes) j_2_1))))
 :qid |stdinbpl.1763:20|
 :skolemid |140|
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| (MapType0Select Heap@8 this@@15 nodes))) (int_2_U i_11_1)) (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| (MapType0Select Heap@8 this@@15 nodes))) (int_2_U j_2_1)))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| (MapType0Select Heap@8 this@@15 nodes))) (int_2_U i_11_1)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| (MapType0Select Heap@8 this@@15 nodes))) (int_2_U j_2_1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| (MapType0Select Heap@8 this@@15 nodes))) (int_2_U i_11_1)) (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| (MapType0Select Heap@8 this@@15 nodes))) (int_2_U j_2_1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| (MapType0Select Heap@8 this@@15 nodes))) (int_2_U i_11_1)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| (MapType0Select Heap@8 this@@15 nodes))) (int_2_U j_2_1)))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| (MapType0Select Heap@8 this@@15 nodes))) (int_2_U i_11_1)) (|Seq#Index| (MapType0Select Heap@8 this@@15 nodes) j_2_1))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| (MapType0Select Heap@8 this@@15 nodes))) (int_2_U i_11_1)) (|Seq#Index| (MapType0Select Heap@8 this@@15 nodes) j_2_1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| (MapType0Select Heap@8 this@@15 nodes))) (int_2_U j_2_1)) (|Seq#Index| (MapType0Select Heap@8 this@@15 nodes) i_11_1))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| (MapType0Select Heap@8 this@@15 nodes))) (int_2_U j_2_1)) (|Seq#Index| (MapType0Select Heap@8 this@@15 nodes) i_11_1))
 :pattern ( (|Seq#Index| (MapType0Select Heap@8 this@@15 nodes) i_11_1) (|Seq#Index| (MapType0Select Heap@8 this@@15 nodes) j_2_1))
)) (and (=> (= (ControlFlow 0 41) (- 0 45)) (forall ((i_12 Int) (i_12_1 Int) ) (!  (=> (and (and (and (and (not (= i_12 i_12_1)) (and (<= 0 i_12) (< i_12 (|Seq#Length| (MapType0Select Heap@8 this@@15 nodes))))) (and (<= 0 i_12_1) (< i_12_1 (|Seq#Length| (MapType0Select Heap@8 this@@15 nodes))))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| (MapType0Select Heap@8 this@@15 nodes) i_12) (|Seq#Index| (MapType0Select Heap@8 this@@15 nodes) i_12_1))))
 :qid |stdinbpl.1774:17|
 :skolemid |141|
 :pattern ( (neverTriggered9 i_12) (neverTriggered9 i_12_1))
))) (=> (forall ((i_12@@0 Int) (i_12_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_12@@0 i_12_1@@0)) (and (<= 0 i_12@@0) (< i_12@@0 (|Seq#Length| (MapType0Select Heap@8 this@@15 nodes))))) (and (<= 0 i_12_1@@0) (< i_12_1@@0 (|Seq#Length| (MapType0Select Heap@8 this@@15 nodes))))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| (MapType0Select Heap@8 this@@15 nodes) i_12@@0) (|Seq#Index| (MapType0Select Heap@8 this@@15 nodes) i_12_1@@0))))
 :qid |stdinbpl.1774:17|
 :skolemid |141|
 :pattern ( (neverTriggered9 i_12@@0) (neverTriggered9 i_12_1@@0))
)) (and (=> (= (ControlFlow 0 41) (- 0 44)) (forall ((i_12@@1 Int) ) (!  (=> (and (<= 0 i_12@@1) (< i_12@@1 (|Seq#Length| (MapType0Select Heap@8 this@@15 nodes)))) (>= (U_2_real (MapType1Select Mask@5 (|Seq#Index| (MapType0Select Heap@8 this@@15 nodes) i_12@@1) val)) FullPerm))
 :qid |stdinbpl.1781:17|
 :skolemid |142|
 :pattern ( (|Seq#Index| (MapType0Select Heap@8 this@@15 nodes) i_12@@1))
 :pattern ( (|Seq#Index| (MapType0Select Heap@8 this@@15 nodes) i_12@@1))
))) (=> (forall ((i_12@@2 Int) ) (!  (=> (and (<= 0 i_12@@2) (< i_12@@2 (|Seq#Length| (MapType0Select Heap@8 this@@15 nodes)))) (>= (U_2_real (MapType1Select Mask@5 (|Seq#Index| (MapType0Select Heap@8 this@@15 nodes) i_12@@2) val)) FullPerm))
 :qid |stdinbpl.1781:17|
 :skolemid |142|
 :pattern ( (|Seq#Index| (MapType0Select Heap@8 this@@15 nodes) i_12@@2))
 :pattern ( (|Seq#Index| (MapType0Select Heap@8 this@@15 nodes) i_12@@2))
)) (=> (and (and (forall ((i_12@@3 Int) ) (!  (=> (and (and (<= 0 i_12@@3) (< i_12@@3 (|Seq#Length| (MapType0Select Heap@8 this@@15 nodes)))) (< NoPerm FullPerm)) (and (qpRange9 (|Seq#Index| (MapType0Select Heap@8 this@@15 nodes) i_12@@3)) (= (invRecv9 (|Seq#Index| (MapType0Select Heap@8 this@@15 nodes) i_12@@3)) i_12@@3)))
 :qid |stdinbpl.1787:22|
 :skolemid |143|
 :pattern ( (|Seq#Index| (MapType0Select Heap@8 this@@15 nodes) i_12@@3))
 :pattern ( (|Seq#Index| (MapType0Select Heap@8 this@@15 nodes) i_12@@3))
)) (forall ((o_3 T@U) ) (!  (=> (= (type o_3) RefType) (=> (and (and (<= 0 (invRecv9 o_3)) (< (invRecv9 o_3) (|Seq#Length| (MapType0Select Heap@8 this@@15 nodes)))) (and (< NoPerm FullPerm) (qpRange9 o_3))) (= (|Seq#Index| (MapType0Select Heap@8 this@@15 nodes) (invRecv9 o_3)) o_3)))
 :qid |stdinbpl.1791:22|
 :skolemid |144|
 :pattern ( (invRecv9 o_3))
))) (and (forall ((o_3@@0 T@U) ) (!  (=> (= (type o_3@@0) RefType) (and (=> (and (and (<= 0 (invRecv9 o_3@@0)) (< (invRecv9 o_3@@0) (|Seq#Length| (MapType0Select Heap@8 this@@15 nodes)))) (and (< NoPerm FullPerm) (qpRange9 o_3@@0))) (and (= (|Seq#Index| (MapType0Select Heap@8 this@@15 nodes) (invRecv9 o_3@@0)) o_3@@0) (= (U_2_real (MapType1Select QPMask@2 o_3@@0 val)) (- (U_2_real (MapType1Select Mask@5 o_3@@0 val)) FullPerm)))) (=> (not (and (and (<= 0 (invRecv9 o_3@@0)) (< (invRecv9 o_3@@0) (|Seq#Length| (MapType0Select Heap@8 this@@15 nodes)))) (and (< NoPerm FullPerm) (qpRange9 o_3@@0)))) (= (U_2_real (MapType1Select QPMask@2 o_3@@0 val)) (U_2_real (MapType1Select Mask@5 o_3@@0 val))))))
 :qid |stdinbpl.1797:22|
 :skolemid |145|
 :pattern ( (MapType1Select QPMask@2 o_3@@0 val))
)) (forall ((o_3@@1 T@U) (f_5 T@U) ) (! (let ((B@@13 (FieldTypeInv1 (type f_5))))
(let ((A@@14 (FieldTypeInv0 (type f_5))))
 (=> (and (and (= (type o_3@@1) RefType) (= (type f_5) (FieldType A@@14 B@@13))) (not (= f_5 val))) (= (U_2_real (MapType1Select Mask@5 o_3@@1 f_5)) (U_2_real (MapType1Select QPMask@2 o_3@@1 f_5))))))
 :qid |stdinbpl.1803:29|
 :skolemid |146|
 :pattern ( (MapType1Select QPMask@2 o_3@@1 f_5))
)))) (and (=> (= (ControlFlow 0 41) (- 0 43)) (forall ((i_13 Int) (i_13_1 Int) ) (!  (=> (and (and (and (and (not (= i_13 i_13_1)) (and (<= 0 i_13) (< i_13 (|Seq#Length| (MapType0Select Heap@8 this@@15 nodes))))) (and (<= 0 i_13_1) (< i_13_1 (|Seq#Length| (MapType0Select Heap@8 this@@15 nodes))))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| (MapType0Select Heap@8 this@@15 nodes) i_13) (|Seq#Index| (MapType0Select Heap@8 this@@15 nodes) i_13_1))))
 :qid |stdinbpl.1815:17|
 :skolemid |147|
 :pattern ( (neverTriggered10 i_13) (neverTriggered10 i_13_1))
))) (=> (forall ((i_13@@0 Int) (i_13_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_13@@0 i_13_1@@0)) (and (<= 0 i_13@@0) (< i_13@@0 (|Seq#Length| (MapType0Select Heap@8 this@@15 nodes))))) (and (<= 0 i_13_1@@0) (< i_13_1@@0 (|Seq#Length| (MapType0Select Heap@8 this@@15 nodes))))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| (MapType0Select Heap@8 this@@15 nodes) i_13@@0) (|Seq#Index| (MapType0Select Heap@8 this@@15 nodes) i_13_1@@0))))
 :qid |stdinbpl.1815:17|
 :skolemid |147|
 :pattern ( (neverTriggered10 i_13@@0) (neverTriggered10 i_13_1@@0))
)) (and (=> (= (ControlFlow 0 41) (- 0 42)) (forall ((i_13@@1 Int) ) (!  (=> (and (<= 0 i_13@@1) (< i_13@@1 (|Seq#Length| (MapType0Select Heap@8 this@@15 nodes)))) (>= (U_2_real (MapType1Select QPMask@2 (|Seq#Index| (MapType0Select Heap@8 this@@15 nodes) i_13@@1) next)) FullPerm))
 :qid |stdinbpl.1822:17|
 :skolemid |148|
 :pattern ( (|Seq#Index| (MapType0Select Heap@8 this@@15 nodes) i_13@@1))
 :pattern ( (|Seq#Index| (MapType0Select Heap@8 this@@15 nodes) i_13@@1))
))) (=> (forall ((i_13@@2 Int) ) (!  (=> (and (<= 0 i_13@@2) (< i_13@@2 (|Seq#Length| (MapType0Select Heap@8 this@@15 nodes)))) (>= (U_2_real (MapType1Select QPMask@2 (|Seq#Index| (MapType0Select Heap@8 this@@15 nodes) i_13@@2) next)) FullPerm))
 :qid |stdinbpl.1822:17|
 :skolemid |148|
 :pattern ( (|Seq#Index| (MapType0Select Heap@8 this@@15 nodes) i_13@@2))
 :pattern ( (|Seq#Index| (MapType0Select Heap@8 this@@15 nodes) i_13@@2))
)) (=> (and (and (forall ((i_13@@3 Int) ) (!  (=> (and (and (<= 0 i_13@@3) (< i_13@@3 (|Seq#Length| (MapType0Select Heap@8 this@@15 nodes)))) (< NoPerm FullPerm)) (and (qpRange10 (|Seq#Index| (MapType0Select Heap@8 this@@15 nodes) i_13@@3)) (= (invRecv10 (|Seq#Index| (MapType0Select Heap@8 this@@15 nodes) i_13@@3)) i_13@@3)))
 :qid |stdinbpl.1828:22|
 :skolemid |149|
 :pattern ( (|Seq#Index| (MapType0Select Heap@8 this@@15 nodes) i_13@@3))
 :pattern ( (|Seq#Index| (MapType0Select Heap@8 this@@15 nodes) i_13@@3))
)) (forall ((o_3@@2 T@U) ) (!  (=> (= (type o_3@@2) RefType) (=> (and (and (<= 0 (invRecv10 o_3@@2)) (< (invRecv10 o_3@@2) (|Seq#Length| (MapType0Select Heap@8 this@@15 nodes)))) (and (< NoPerm FullPerm) (qpRange10 o_3@@2))) (= (|Seq#Index| (MapType0Select Heap@8 this@@15 nodes) (invRecv10 o_3@@2)) o_3@@2)))
 :qid |stdinbpl.1832:22|
 :skolemid |150|
 :pattern ( (invRecv10 o_3@@2))
))) (and (forall ((o_3@@3 T@U) ) (!  (=> (= (type o_3@@3) RefType) (and (=> (and (and (<= 0 (invRecv10 o_3@@3)) (< (invRecv10 o_3@@3) (|Seq#Length| (MapType0Select Heap@8 this@@15 nodes)))) (and (< NoPerm FullPerm) (qpRange10 o_3@@3))) (and (= (|Seq#Index| (MapType0Select Heap@8 this@@15 nodes) (invRecv10 o_3@@3)) o_3@@3) (= (U_2_real (MapType1Select QPMask@3 o_3@@3 next)) (- (U_2_real (MapType1Select QPMask@2 o_3@@3 next)) FullPerm)))) (=> (not (and (and (<= 0 (invRecv10 o_3@@3)) (< (invRecv10 o_3@@3) (|Seq#Length| (MapType0Select Heap@8 this@@15 nodes)))) (and (< NoPerm FullPerm) (qpRange10 o_3@@3)))) (= (U_2_real (MapType1Select QPMask@3 o_3@@3 next)) (U_2_real (MapType1Select QPMask@2 o_3@@3 next))))))
 :qid |stdinbpl.1838:22|
 :skolemid |151|
 :pattern ( (MapType1Select QPMask@3 o_3@@3 next))
)) (forall ((o_3@@4 T@U) (f_5@@0 T@U) ) (! (let ((B@@14 (FieldTypeInv1 (type f_5@@0))))
(let ((A@@15 (FieldTypeInv0 (type f_5@@0))))
 (=> (and (and (= (type o_3@@4) RefType) (= (type f_5@@0) (FieldType A@@15 B@@14))) (not (= f_5@@0 next))) (= (U_2_real (MapType1Select QPMask@2 o_3@@4 f_5@@0)) (U_2_real (MapType1Select QPMask@3 o_3@@4 f_5@@0))))))
 :qid |stdinbpl.1844:29|
 :skolemid |152|
 :pattern ( (MapType1Select QPMask@3 o_3@@4 f_5@@0))
)))) (and (and (=> (= (ControlFlow 0 41) 40) anon116_Else_correct) (=> (= (ControlFlow 0 41) 24) anon117_Then_correct)) (=> (= (ControlFlow 0 41) 19) anon117_Else_correct)))))))))))))))
(let ((anon66_correct true))
(let ((anon115_Else_correct  (=> (and (not (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| (MapType0Select Heap@8 this@@15 nodes))) (int_2_U i_10_1)) (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| (MapType0Select Heap@8 this@@15 nodes))) (int_2_U j_1_1)) (not (= i_10_1 j_1_1))))) (= (ControlFlow 0 17) 14)) anon66_correct)))
(let ((anon115_Then_correct  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| (MapType0Select Heap@8 this@@15 nodes))) (int_2_U i_10_1)) (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| (MapType0Select Heap@8 this@@15 nodes))) (int_2_U j_1_1)) (not (= i_10_1 j_1_1)))) (and (=> (= (ControlFlow 0 15) (- 0 16)) (not (= (|Seq#Index| (MapType0Select Heap@8 this@@15 nodes) i_10_1) (|Seq#Index| (MapType0Select Heap@8 this@@15 nodes) j_1_1)))) (=> (not (= (|Seq#Index| (MapType0Select Heap@8 this@@15 nodes) i_10_1) (|Seq#Index| (MapType0Select Heap@8 this@@15 nodes) j_1_1))) (=> (= (ControlFlow 0 15) 14) anon66_correct))))))
(let ((anon63_correct  (=> (= Mask@5 (MapType1Store Mask@4 this@@15 nodes (real_2_U (- (U_2_real (MapType1Select Mask@4 this@@15 nodes)) FullPerm)))) (and (and (=> (= (ControlFlow 0 46) 41) anon114_Else_correct) (=> (= (ControlFlow 0 46) 15) anon115_Then_correct)) (=> (= (ControlFlow 0 46) 17) anon115_Else_correct)))))
(let ((anon113_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 49) 46)) anon63_correct)))
(let ((anon113_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 47) (- 0 48)) (<= FullPerm (U_2_real (MapType1Select Mask@4 this@@15 nodes)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@4 this@@15 nodes))) (=> (= (ControlFlow 0 47) 46) anon63_correct))))))
(let ((anon61_correct  (=> (state Heap@8 Mask@4) (and (=> (= (ControlFlow 0 50) 47) anon113_Then_correct) (=> (= (ControlFlow 0 50) 49) anon113_Else_correct)))))
(let ((anon112_Else_correct  (=> (>= 0 (|Seq#Length| (MapType0Select Heap@4 this@@15 nodes))) (and (=> (= (ControlFlow 0 59) (- 0 60)) (= FullPerm (U_2_real (MapType1Select Mask@4 this@@15 nodes)))) (=> (= FullPerm (U_2_real (MapType1Select Mask@4 this@@15 nodes))) (=> (and (and (= Heap@7 (MapType0Store Heap@4 this@@15 nodes (|Seq#Singleton| freshObj@0))) (state Heap@7 Mask@4)) (and (= Heap@8 Heap@7) (= (ControlFlow 0 59) 50))) anon61_correct))))))
(let ((anon112_Then_correct  (=> (> (|Seq#Length| (MapType0Select Heap@4 this@@15 nodes)) 0) (and (=> (= (ControlFlow 0 51) (- 0 58)) (HasDirectPerm Mask@4 this@@15 nodes)) (=> (HasDirectPerm Mask@4 this@@15 nodes) (and (=> (= (ControlFlow 0 51) (- 0 57)) (HasDirectPerm Mask@4 this@@15 nodes)) (=> (HasDirectPerm Mask@4 this@@15 nodes) (and (=> (= (ControlFlow 0 51) (- 0 56)) (>= (- (|Seq#Length| (MapType0Select Heap@4 this@@15 nodes)) 1) 0)) (=> (>= (- (|Seq#Length| (MapType0Select Heap@4 this@@15 nodes)) 1) 0) (and (=> (= (ControlFlow 0 51) (- 0 55)) (< (- (|Seq#Length| (MapType0Select Heap@4 this@@15 nodes)) 1) (|Seq#Length| (MapType0Select Heap@4 this@@15 nodes)))) (=> (< (- (|Seq#Length| (MapType0Select Heap@4 this@@15 nodes)) 1) (|Seq#Length| (MapType0Select Heap@4 this@@15 nodes))) (and (=> (= (ControlFlow 0 51) (- 0 54)) (= FullPerm (U_2_real (MapType1Select Mask@4 (|Seq#Index| (MapType0Select Heap@4 this@@15 nodes) (- (|Seq#Length| (MapType0Select Heap@4 this@@15 nodes)) 1)) next)))) (=> (= FullPerm (U_2_real (MapType1Select Mask@4 (|Seq#Index| (MapType0Select Heap@4 this@@15 nodes) (- (|Seq#Length| (MapType0Select Heap@4 this@@15 nodes)) 1)) next))) (=> (and (= Heap@5 (MapType0Store Heap@4 (|Seq#Index| (MapType0Select Heap@4 this@@15 nodes) (- (|Seq#Length| (MapType0Select Heap@4 this@@15 nodes)) 1)) next freshObj@0)) (state Heap@5 Mask@4)) (and (=> (= (ControlFlow 0 51) (- 0 53)) (HasDirectPerm Mask@4 this@@15 nodes)) (=> (HasDirectPerm Mask@4 this@@15 nodes) (and (=> (= (ControlFlow 0 51) (- 0 52)) (= FullPerm (U_2_real (MapType1Select Mask@4 this@@15 nodes)))) (=> (= FullPerm (U_2_real (MapType1Select Mask@4 this@@15 nodes))) (=> (and (and (= Heap@6 (MapType0Store Heap@5 this@@15 nodes (|Seq#Append| (MapType0Select Heap@5 this@@15 nodes) (|Seq#Singleton| freshObj@0)))) (state Heap@6 Mask@4)) (and (= Heap@8 Heap@6) (= (ControlFlow 0 51) 50))) anon61_correct)))))))))))))))))))
(let ((anon109_Else_correct  (=> (forall ((i_9_1 Int) ) (!  (=> (and (<= 0 i_9_1) (< i_9_1 (|Seq#Length| (MapType0Select Heap@2 this@@15 nodes)))) (not (= (|Seq#Index| (MapType0Select Heap@2 this@@15 nodes) i_9_1) freshObj@0)))
 :qid |stdinbpl.1686:20|
 :skolemid |139|
 :pattern ( (|Seq#Index| (MapType0Select Heap@2 this@@15 nodes) i_9_1))
)) (=> (and (state Heap@2 Mask@4) (state Heap@2 Mask@4)) (and (=> (= (ControlFlow 0 61) (- 0 64)) (= FullPerm (U_2_real (MapType1Select Mask@4 freshObj@0 next)))) (=> (= FullPerm (U_2_real (MapType1Select Mask@4 freshObj@0 next))) (=> (and (= Heap@3 (MapType0Store Heap@2 freshObj@0 next null)) (state Heap@3 Mask@4)) (and (=> (= (ControlFlow 0 61) (- 0 63)) (= FullPerm (U_2_real (MapType1Select Mask@4 freshObj@0 val)))) (=> (= FullPerm (U_2_real (MapType1Select Mask@4 freshObj@0 val))) (=> (and (= Heap@4 (MapType0Store Heap@3 freshObj@0 val (int_2_U elem))) (state Heap@4 Mask@4)) (and (=> (= (ControlFlow 0 61) (- 0 62)) (HasDirectPerm Mask@4 this@@15 nodes)) (=> (HasDirectPerm Mask@4 this@@15 nodes) (and (=> (= (ControlFlow 0 61) 51) anon112_Then_correct) (=> (= (ControlFlow 0 61) 59) anon112_Else_correct))))))))))))))
(let ((anon57_correct true))
(let ((anon111_Else_correct  (=> (and (not (and (<= 0 i_15) (< i_15 (|Seq#Length| (MapType0Select Heap@2 this@@15 nodes))))) (= (ControlFlow 0 10) 5)) anon57_correct)))
(let ((anon111_Then_correct  (=> (and (<= 0 i_15) (< i_15 (|Seq#Length| (MapType0Select Heap@2 this@@15 nodes)))) (and (=> (= (ControlFlow 0 6) (- 0 9)) (HasDirectPerm Mask@4 this@@15 nodes)) (=> (HasDirectPerm Mask@4 this@@15 nodes) (and (=> (= (ControlFlow 0 6) (- 0 8)) (>= i_15 0)) (=> (>= i_15 0) (and (=> (= (ControlFlow 0 6) (- 0 7)) (< i_15 (|Seq#Length| (MapType0Select Heap@2 this@@15 nodes)))) (=> (< i_15 (|Seq#Length| (MapType0Select Heap@2 this@@15 nodes))) (=> (= (ControlFlow 0 6) 5) anon57_correct))))))))))
(let ((anon110_Else_correct  (=> (< i_15 0) (and (=> (= (ControlFlow 0 13) 6) anon111_Then_correct) (=> (= (ControlFlow 0 13) 10) anon111_Else_correct)))))
(let ((anon110_Then_correct  (=> (<= 0 i_15) (and (=> (= (ControlFlow 0 11) (- 0 12)) (HasDirectPerm Mask@4 this@@15 nodes)) (=> (HasDirectPerm Mask@4 this@@15 nodes) (and (=> (= (ControlFlow 0 11) 6) anon111_Then_correct) (=> (= (ControlFlow 0 11) 10) anon111_Else_correct)))))))
(let ((anon52_correct  (=> (and (and (not (= this@@15 null)) (= Mask@2 (MapType1Store Mask@1 this@@15 nodes (real_2_U (+ (U_2_real (MapType1Select Mask@1 this@@15 nodes)) FullPerm))))) (and (state Heap@1 Mask@2) (forall ((i_4 Int) (j@@5 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| (MapType0Select Heap@1 this@@15 nodes))) (int_2_U i_4)) (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| (MapType0Select Heap@1 this@@15 nodes))) (int_2_U j@@5)) (not (= i_4 j@@5)))) (not (= (|Seq#Index| (MapType0Select Heap@1 this@@15 nodes) i_4) (|Seq#Index| (MapType0Select Heap@1 this@@15 nodes) j@@5))))
 :qid |stdinbpl.1570:20|
 :skolemid |125|
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| (MapType0Select Heap@1 this@@15 nodes))) (int_2_U i_4)) (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| (MapType0Select Heap@1 this@@15 nodes))) (int_2_U j@@5)))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| (MapType0Select Heap@1 this@@15 nodes))) (int_2_U i_4)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| (MapType0Select Heap@1 this@@15 nodes))) (int_2_U j@@5)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| (MapType0Select Heap@1 this@@15 nodes))) (int_2_U i_4)) (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| (MapType0Select Heap@1 this@@15 nodes))) (int_2_U j@@5)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| (MapType0Select Heap@1 this@@15 nodes))) (int_2_U i_4)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| (MapType0Select Heap@1 this@@15 nodes))) (int_2_U j@@5)))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| (MapType0Select Heap@1 this@@15 nodes))) (int_2_U i_4)) (|Seq#Index| (MapType0Select Heap@1 this@@15 nodes) j@@5))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| (MapType0Select Heap@1 this@@15 nodes))) (int_2_U i_4)) (|Seq#Index| (MapType0Select Heap@1 this@@15 nodes) j@@5))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| (MapType0Select Heap@1 this@@15 nodes))) (int_2_U j@@5)) (|Seq#Index| (MapType0Select Heap@1 this@@15 nodes) i_4))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| (MapType0Select Heap@1 this@@15 nodes))) (int_2_U j@@5)) (|Seq#Index| (MapType0Select Heap@1 this@@15 nodes) i_4))
 :pattern ( (|Seq#Index| (MapType0Select Heap@1 this@@15 nodes) i_4) (|Seq#Index| (MapType0Select Heap@1 this@@15 nodes) j@@5))
)))) (and (=> (= (ControlFlow 0 65) (- 0 67)) (forall ((i_5 Int) (i_5_1 Int) ) (!  (=> (and (and (and (and (not (= i_5 i_5_1)) (and (<= 0 i_5) (< i_5 (|Seq#Length| (MapType0Select Heap@1 this@@15 nodes))))) (and (<= 0 i_5_1) (< i_5_1 (|Seq#Length| (MapType0Select Heap@1 this@@15 nodes))))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| (MapType0Select Heap@1 this@@15 nodes) i_5) (|Seq#Index| (MapType0Select Heap@1 this@@15 nodes) i_5_1))))
 :qid |stdinbpl.1576:15|
 :skolemid |126|
))) (=> (forall ((i_5@@0 Int) (i_5_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_5@@0 i_5_1@@0)) (and (<= 0 i_5@@0) (< i_5@@0 (|Seq#Length| (MapType0Select Heap@1 this@@15 nodes))))) (and (<= 0 i_5_1@@0) (< i_5_1@@0 (|Seq#Length| (MapType0Select Heap@1 this@@15 nodes))))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| (MapType0Select Heap@1 this@@15 nodes) i_5@@0) (|Seq#Index| (MapType0Select Heap@1 this@@15 nodes) i_5_1@@0))))
 :qid |stdinbpl.1576:15|
 :skolemid |126|
)) (=> (and (forall ((i_5@@1 Int) ) (!  (=> (and (and (<= 0 i_5@@1) (< i_5@@1 (|Seq#Length| (MapType0Select Heap@1 this@@15 nodes)))) (< NoPerm FullPerm)) (and (qpRange7 (|Seq#Index| (MapType0Select Heap@1 this@@15 nodes) i_5@@1)) (= (invRecv7 (|Seq#Index| (MapType0Select Heap@1 this@@15 nodes) i_5@@1)) i_5@@1)))
 :qid |stdinbpl.1582:22|
 :skolemid |127|
 :pattern ( (|Seq#Index| (MapType0Select Heap@1 this@@15 nodes) i_5@@1))
 :pattern ( (|Seq#Index| (MapType0Select Heap@1 this@@15 nodes) i_5@@1))
)) (forall ((o_3@@5 T@U) ) (!  (=> (= (type o_3@@5) RefType) (=> (and (and (and (<= 0 (invRecv7 o_3@@5)) (< (invRecv7 o_3@@5) (|Seq#Length| (MapType0Select Heap@1 this@@15 nodes)))) (< NoPerm FullPerm)) (qpRange7 o_3@@5)) (= (|Seq#Index| (MapType0Select Heap@1 this@@15 nodes) (invRecv7 o_3@@5)) o_3@@5)))
 :qid |stdinbpl.1586:22|
 :skolemid |128|
 :pattern ( (invRecv7 o_3@@5))
))) (=> (and (and (forall ((i_5@@2 Int) ) (!  (=> (and (<= 0 i_5@@2) (< i_5@@2 (|Seq#Length| (MapType0Select Heap@1 this@@15 nodes)))) (not (= (|Seq#Index| (MapType0Select Heap@1 this@@15 nodes) i_5@@2) null)))
 :qid |stdinbpl.1592:22|
 :skolemid |129|
 :pattern ( (|Seq#Index| (MapType0Select Heap@1 this@@15 nodes) i_5@@2))
 :pattern ( (|Seq#Index| (MapType0Select Heap@1 this@@15 nodes) i_5@@2))
)) (forall ((o_3@@6 T@U) ) (!  (=> (= (type o_3@@6) RefType) (and (=> (and (and (and (<= 0 (invRecv7 o_3@@6)) (< (invRecv7 o_3@@6) (|Seq#Length| (MapType0Select Heap@1 this@@15 nodes)))) (< NoPerm FullPerm)) (qpRange7 o_3@@6)) (and (=> (< NoPerm FullPerm) (= (|Seq#Index| (MapType0Select Heap@1 this@@15 nodes) (invRecv7 o_3@@6)) o_3@@6)) (= (U_2_real (MapType1Select QPMask@0 o_3@@6 val)) (+ (U_2_real (MapType1Select Mask@2 o_3@@6 val)) FullPerm)))) (=> (not (and (and (and (<= 0 (invRecv7 o_3@@6)) (< (invRecv7 o_3@@6) (|Seq#Length| (MapType0Select Heap@1 this@@15 nodes)))) (< NoPerm FullPerm)) (qpRange7 o_3@@6))) (= (U_2_real (MapType1Select QPMask@0 o_3@@6 val)) (U_2_real (MapType1Select Mask@2 o_3@@6 val))))))
 :qid |stdinbpl.1598:22|
 :skolemid |130|
 :pattern ( (MapType1Select QPMask@0 o_3@@6 val))
))) (and (forall ((o_3@@7 T@U) (f_5@@1 T@U) ) (! (let ((B@@15 (FieldTypeInv1 (type f_5@@1))))
(let ((A@@16 (FieldTypeInv0 (type f_5@@1))))
 (=> (and (and (= (type o_3@@7) RefType) (= (type f_5@@1) (FieldType A@@16 B@@15))) (not (= f_5@@1 val))) (= (U_2_real (MapType1Select Mask@2 o_3@@7 f_5@@1)) (U_2_real (MapType1Select QPMask@0 o_3@@7 f_5@@1))))))
 :qid |stdinbpl.1602:29|
 :skolemid |131|
 :pattern ( (MapType1Select Mask@2 o_3@@7 f_5@@1))
 :pattern ( (MapType1Select QPMask@0 o_3@@7 f_5@@1))
)) (state Heap@1 QPMask@0))) (and (=> (= (ControlFlow 0 65) (- 0 66)) (forall ((i_6 Int) (i_6_1 Int) ) (!  (=> (and (and (and (and (not (= i_6 i_6_1)) (and (<= 0 i_6) (< i_6 (|Seq#Length| (MapType0Select Heap@1 this@@15 nodes))))) (and (<= 0 i_6_1) (< i_6_1 (|Seq#Length| (MapType0Select Heap@1 this@@15 nodes))))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| (MapType0Select Heap@1 this@@15 nodes) i_6) (|Seq#Index| (MapType0Select Heap@1 this@@15 nodes) i_6_1))))
 :qid |stdinbpl.1610:15|
 :skolemid |132|
))) (=> (forall ((i_6@@0 Int) (i_6_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_6@@0 i_6_1@@0)) (and (<= 0 i_6@@0) (< i_6@@0 (|Seq#Length| (MapType0Select Heap@1 this@@15 nodes))))) (and (<= 0 i_6_1@@0) (< i_6_1@@0 (|Seq#Length| (MapType0Select Heap@1 this@@15 nodes))))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| (MapType0Select Heap@1 this@@15 nodes) i_6@@0) (|Seq#Index| (MapType0Select Heap@1 this@@15 nodes) i_6_1@@0))))
 :qid |stdinbpl.1610:15|
 :skolemid |132|
)) (=> (forall ((i_6@@1 Int) ) (!  (=> (and (and (<= 0 i_6@@1) (< i_6@@1 (|Seq#Length| (MapType0Select Heap@1 this@@15 nodes)))) (< NoPerm FullPerm)) (and (qpRange8 (|Seq#Index| (MapType0Select Heap@1 this@@15 nodes) i_6@@1)) (= (invRecv8 (|Seq#Index| (MapType0Select Heap@1 this@@15 nodes) i_6@@1)) i_6@@1)))
 :qid |stdinbpl.1616:22|
 :skolemid |133|
 :pattern ( (|Seq#Index| (MapType0Select Heap@1 this@@15 nodes) i_6@@1))
 :pattern ( (|Seq#Index| (MapType0Select Heap@1 this@@15 nodes) i_6@@1))
)) (=> (and (forall ((o_3@@8 T@U) ) (!  (=> (= (type o_3@@8) RefType) (=> (and (and (and (<= 0 (invRecv8 o_3@@8)) (< (invRecv8 o_3@@8) (|Seq#Length| (MapType0Select Heap@1 this@@15 nodes)))) (< NoPerm FullPerm)) (qpRange8 o_3@@8)) (= (|Seq#Index| (MapType0Select Heap@1 this@@15 nodes) (invRecv8 o_3@@8)) o_3@@8)))
 :qid |stdinbpl.1620:22|
 :skolemid |134|
 :pattern ( (invRecv8 o_3@@8))
)) (forall ((i_6@@2 Int) ) (!  (=> (and (<= 0 i_6@@2) (< i_6@@2 (|Seq#Length| (MapType0Select Heap@1 this@@15 nodes)))) (not (= (|Seq#Index| (MapType0Select Heap@1 this@@15 nodes) i_6@@2) null)))
 :qid |stdinbpl.1626:22|
 :skolemid |135|
 :pattern ( (|Seq#Index| (MapType0Select Heap@1 this@@15 nodes) i_6@@2))
 :pattern ( (|Seq#Index| (MapType0Select Heap@1 this@@15 nodes) i_6@@2))
))) (=> (and (and (and (and (forall ((o_3@@9 T@U) ) (!  (=> (= (type o_3@@9) RefType) (and (=> (and (and (and (<= 0 (invRecv8 o_3@@9)) (< (invRecv8 o_3@@9) (|Seq#Length| (MapType0Select Heap@1 this@@15 nodes)))) (< NoPerm FullPerm)) (qpRange8 o_3@@9)) (and (=> (< NoPerm FullPerm) (= (|Seq#Index| (MapType0Select Heap@1 this@@15 nodes) (invRecv8 o_3@@9)) o_3@@9)) (= (U_2_real (MapType1Select QPMask@1 o_3@@9 next)) (+ (U_2_real (MapType1Select QPMask@0 o_3@@9 next)) FullPerm)))) (=> (not (and (and (and (<= 0 (invRecv8 o_3@@9)) (< (invRecv8 o_3@@9) (|Seq#Length| (MapType0Select Heap@1 this@@15 nodes)))) (< NoPerm FullPerm)) (qpRange8 o_3@@9))) (= (U_2_real (MapType1Select QPMask@1 o_3@@9 next)) (U_2_real (MapType1Select QPMask@0 o_3@@9 next))))))
 :qid |stdinbpl.1632:22|
 :skolemid |136|
 :pattern ( (MapType1Select QPMask@1 o_3@@9 next))
)) (forall ((o_3@@10 T@U) (f_5@@2 T@U) ) (! (let ((B@@16 (FieldTypeInv1 (type f_5@@2))))
(let ((A@@17 (FieldTypeInv0 (type f_5@@2))))
 (=> (and (and (= (type o_3@@10) RefType) (= (type f_5@@2) (FieldType A@@17 B@@16))) (not (= f_5@@2 next))) (= (U_2_real (MapType1Select QPMask@0 o_3@@10 f_5@@2)) (U_2_real (MapType1Select QPMask@1 o_3@@10 f_5@@2))))))
 :qid |stdinbpl.1636:29|
 :skolemid |137|
 :pattern ( (MapType1Select QPMask@0 o_3@@10 f_5@@2))
 :pattern ( (MapType1Select QPMask@1 o_3@@10 f_5@@2))
))) (and (state Heap@1 QPMask@1) (forall ((i_7 Int) ) (!  (=> (and (<= 0 i_7) (< i_7 (|Seq#Length| (MapType0Select Heap@1 this@@15 nodes)))) (and (|Seq#Contains| (MapType0Select Heap@1 this@@15 nodes) (|Seq#Index| (MapType0Select Heap@1 this@@15 nodes) i_7)) (ite (< i_7 (- (|Seq#Length| (MapType0Select Heap@1 this@@15 nodes)) 1)) (= (MapType0Select Heap@1 (|Seq#Index| (MapType0Select Heap@1 this@@15 nodes) i_7) next) (|Seq#Index| (MapType0Select Heap@1 this@@15 nodes) (+ i_7 1))) (= (MapType0Select Heap@1 (|Seq#Index| (MapType0Select Heap@1 this@@15 nodes) i_7) next) null))))
 :qid |stdinbpl.1642:20|
 :skolemid |138|
 :pattern ( (MapType0Select Heap@1 (|Seq#Index| (MapType0Select Heap@1 this@@15 nodes) i_7) next))
)))) (and (and (state Heap@1 QPMask@1) (state Heap@1 QPMask@1)) (and (not (= freshObj@0 null)) (not (U_2_bool (MapType0Select Heap@1 freshObj@0 $allocated)))))) (and (and (and (= Heap@2 (MapType0Store Heap@1 freshObj@0 $allocated (bool_2_U true))) (state Heap@2 QPMask@1)) (and (not (= freshObj@0 null)) (= Mask@3 (MapType1Store QPMask@1 freshObj@0 val (real_2_U (+ (U_2_real (MapType1Select QPMask@1 freshObj@0 val)) FullPerm)))))) (and (and (state Heap@2 Mask@3) (not (= freshObj@0 null))) (and (= Mask@4 (MapType1Store Mask@3 freshObj@0 next (real_2_U (+ (U_2_real (MapType1Select Mask@3 freshObj@0 next)) FullPerm)))) (state Heap@2 Mask@4))))) (and (and (=> (= (ControlFlow 0 65) 61) anon109_Else_correct) (=> (= (ControlFlow 0 65) 11) anon110_Then_correct)) (=> (= (ControlFlow 0 65) 13) anon110_Else_correct))))))))))))))
(let ((anon108_Else_correct  (=> (HasDirectPerm Mask@1 null (List this@@15)) (=> (and (= Heap@1 Heap@@18) (= (ControlFlow 0 69) 65)) anon52_correct))))
(let ((anon108_Then_correct  (=> (and (and (not (HasDirectPerm Mask@1 null (List this@@15))) (= Heap@0 (MapType0Store Heap@@18 null (List this@@15) newVersion@0))) (and (= Heap@1 Heap@0) (= (ControlFlow 0 68) 65))) anon52_correct)))
(let ((anon50_correct  (=> (= Mask@1 (MapType1Store Mask@0 null (List this@@15) (real_2_U (- (U_2_real (MapType1Select Mask@0 null (List this@@15))) FullPerm)))) (and (=> (= (ControlFlow 0 70) 68) anon108_Then_correct) (=> (= (ControlFlow 0 70) 69) anon108_Else_correct)))))
(let ((anon107_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 73) 70)) anon50_correct)))
(let ((anon107_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 71) (- 0 72)) (<= FullPerm (U_2_real (MapType1Select Mask@0 null (List this@@15))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@0 null (List this@@15)))) (=> (= (ControlFlow 0 71) 70) anon50_correct))))))
(let ((anon89_Else_correct  (=> (U_2_bool (MapType0Select Heap@@18 n@@13 $allocated)) (=> (and (|List#trigger| Heap@@18 (List this@@15)) (= (MapType0Select Heap@@18 null (List this@@15)) (CombineFrames (FrameFragment (MapType0Select Heap@@18 this@@15 nodes)) (CombineFrames (FrameFragment (int_2_U (|List#condqp1| Heap@@18 this@@15))) (FrameFragment (int_2_U (|List#condqp2| Heap@@18 this@@15))))))) (and (=> (= (ControlFlow 0 74) 71) anon107_Then_correct) (=> (= (ControlFlow 0 74) 73) anon107_Else_correct))))))
(let ((anon14_correct  (=> (state Heap@@18 Mask@0) (and (=> (= (ControlFlow 0 118) 117) anon89_Then_correct) (=> (= (ControlFlow 0 118) 74) anon89_Else_correct)))))
(let ((anon87_Else_correct  (=> (and (<= (itemAt Heap@@18 this@@15 (- (length Heap@@18 this@@15) 1)) elem) (= (ControlFlow 0 120) 118)) anon14_correct)))
(let ((anon84_Then_correct  (=> (and (< 0 (length Heap@@18 this@@15)) (state Heap@@18 Mask@0)) (and (and (and (and (=> (= (ControlFlow 0 131) 120) anon87_Else_correct) (=> (= (ControlFlow 0 131) 128) anon88_Then_correct)) (=> (= (ControlFlow 0 131) 130) anon88_Else_correct)) (=> (= (ControlFlow 0 131) 122) anon86_Then_correct)) (=> (= (ControlFlow 0 131) 124) anon86_Else_correct)))))
(let ((anon84_Else_correct  (=> (and (<= (length Heap@@18 this@@15) 0) (= (ControlFlow 0 119) 118)) anon14_correct)))
(let ((anon3_correct true))
(let ((anon83_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 4) 1)) anon3_correct)))
(let ((anon83_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 2) (- 0 3)) (<= FullPerm (U_2_real (MapType1Select Mask@0 null (List this@@15))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@0 null (List this@@15)))) (=> (= (ControlFlow 0 2) 1) anon3_correct))))))
(let ((anon0_correct  (=> (and (state Heap@@18 ZeroMask) (= AssumeFunctionsAbove (- 0 1))) (=> (and (and (U_2_bool (MapType0Select Heap@@18 this@@15 $allocated)) (= Mask@0 (MapType1Store ZeroMask null (List this@@15) (real_2_U (+ (U_2_real (MapType1Select ZeroMask null (List this@@15))) FullPerm))))) (and (state Heap@@18 Mask@0) (state Heap@@18 Mask@0))) (and (and (and (=> (= (ControlFlow 0 132) 131) anon84_Then_correct) (=> (= (ControlFlow 0 132) 119) anon84_Else_correct)) (=> (= (ControlFlow 0 132) 2) anon83_Then_correct)) (=> (= (ControlFlow 0 132) 4) anon83_Else_correct))))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 133) 132) anon0_correct)))
PreconditionGeneratedEntry_correct)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
))
(check-sat)
(pop 1)
; Valid
(get-info :rlimit)
