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
(declare-fun data () T@U)
(declare-fun next () T@U)
(declare-fun head () T@U)
(declare-fun held () T@U)
(declare-fun changed () T@U)
(declare-fun FieldType (T@T T@T) T@T)
(declare-fun FieldTypeInv0 (T@T) T@T)
(declare-fun FieldTypeInv1 (T@T) T@T)
(declare-fun NormalFieldType () T@T)
(declare-fun RefType () T@T)
(declare-fun |Seq#Length| (T@U) Int)
(declare-fun |Seq#Drop| (T@U Int) T@U)
(declare-fun SeqTypeInv0 (T@T) T@T)
(declare-fun SeqType (T@T) T@T)
(declare-fun succHeap (T@U T@U) Bool)
(declare-fun MapType0Type (T@T) T@T)
(declare-fun succHeapTrans (T@U T@U) Bool)
(declare-fun MapType0TypeInv0 (T@T) T@T)
(declare-fun MapType0Select (T@U T@U T@U) T@U)
(declare-fun MapType0Store (T@U T@U T@U T@U) T@U)
(declare-fun state (T@U T@U) Bool)
(declare-fun lengthNodes (T@U T@U T@U) Int)
(declare-fun |lengthNodes#triggerStateless| (T@U T@U) Int)
(declare-fun |lseg#trigger| (T@U T@U) Bool)
(declare-fun lseg (T@U T@U) T@U)
(declare-fun MapType1Type (T@T T@T) T@T)
(declare-fun AssumeFunctionsAbove () Int)
(declare-fun |lengthNodes'| (T@U T@U T@U) Int)
(declare-fun MapType1TypeInv0 (T@T) T@T)
(declare-fun MapType1TypeInv1 (T@T) T@T)
(declare-fun MapType1Select (T@U T@U T@U) T@U)
(declare-fun MapType1Store (T@U T@U T@U T@U) T@U)
(declare-fun PredicateType_lsegType () T@T)
(declare-fun FrameTypeType () T@T)
(declare-fun GoodMask (T@U) Bool)
(declare-fun IsPredicateField (T@U) Bool)
(declare-fun |contentNodes'| (T@U T@U T@U) T@U)
(declare-fun dummyFunction (T@U) Bool)
(declare-fun |contentNodes#triggerStateless| (T@U T@U) T@U)
(declare-fun |lseg#everUsed| (T@U) Bool)
(declare-fun |Seq#Index| (T@U Int) T@U)
(declare-fun |Seq#Sub| (Int Int) Int)
(declare-fun |Seq#Add| (Int Int) Int)
(declare-fun IdenticalOnKnownLocations (T@U T@U T@U) Bool)
(declare-fun null () T@U)
(declare-fun PredicateMaskField (T@U) T@U)
(declare-fun HasDirectPerm (T@U T@U T@U) Bool)
(declare-fun IsWandField (T@U) Bool)
(declare-fun WandMaskField (T@U) T@U)
(declare-fun List (T@U) T@U)
(declare-fun PredicateType_ListType () T@T)
(declare-fun |content'| (T@U T@U) T@U)
(declare-fun |content#triggerStateless| (T@U) T@U)
(declare-fun |length'| (T@U T@U) Int)
(declare-fun |length#triggerStateless| (T@U) Int)
(declare-fun |peek'| (T@U T@U) Int)
(declare-fun |peek#triggerStateless| (T@U) Int)
(declare-fun |List#trigger| (T@U T@U) Bool)
(declare-fun |List#everUsed| (T@U) Bool)
(declare-fun |Seq#Update| (T@U Int T@U) T@U)
(declare-fun peek (T@U T@U) Int)
(declare-fun length (T@U T@U) Int)
(declare-fun |Seq#Take| (T@U Int) T@U)
(declare-fun |length#trigger| (T@U T@U) Bool)
(declare-fun content (T@U T@U) T@U)
(declare-fun |Seq#Contains| (T@U T@U) Bool)
(declare-fun |Seq#Range| (Int Int) T@U)
(declare-fun |Seq#Skolem| (T@U T@U) Int)
(declare-fun contentNodes (T@U T@U T@U) T@U)
(declare-fun |Seq#Empty| (T@T) T@U)
(declare-fun |Seq#Append| (T@U T@U) T@U)
(declare-fun |Seq#Singleton| (T@U) T@U)
(declare-fun |lengthNodes#trigger| (T@U T@U T@U) Bool)
(declare-fun |contentNodes#trigger| (T@U T@U T@U) Bool)
(declare-fun |lseg#sm| (T@U T@U) T@U)
(declare-fun |List#sm| (T@U) T@U)
(declare-fun |contentNodes#frame| (T@U T@U T@U) T@U)
(declare-fun |lengthNodes#frame| (T@U T@U T@U) Int)
(declare-fun dummyHeap () T@U)
(declare-fun ZeroMask () T@U)
(declare-fun InsidePredicate (T@U T@U T@U T@U) Bool)
(declare-fun |peek#trigger| (T@U T@U) Bool)
(declare-fun sumMask (T@U T@U T@U) Bool)
(declare-fun ConditionalFrame (Real T@U) T@U)
(declare-fun EmptyFrame () T@U)
(declare-fun NoPerm () Real)
(declare-fun |Seq#Equal| (T@U T@U) Bool)
(declare-fun |Seq#ContainsTrigger| (T@U T@U) Bool)
(declare-fun getPredWandId (T@U) Int)
(declare-fun FullPerm () Real)
(declare-fun |content#frame| (T@U T@U) T@U)
(declare-fun |length#frame| (T@U T@U) Int)
(declare-fun |peek#frame| (T@U T@U) Int)
(declare-fun |content#trigger| (T@U T@U) Bool)
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
(assert  (and (and (and (and (and (and (and (and (and (and (forall ((arg0@@11 T@T) (arg1 T@T) ) (! (= (Ctor (FieldType arg0@@11 arg1)) 6)
 :qid |ctor:FieldType|
)) (forall ((arg0@@12 T@T) (arg1@@0 T@T) ) (! (= (FieldTypeInv0 (FieldType arg0@@12 arg1@@0)) arg0@@12)
 :qid |typeInv:FieldTypeInv0|
 :pattern ( (FieldType arg0@@12 arg1@@0))
))) (forall ((arg0@@13 T@T) (arg1@@1 T@T) ) (! (= (FieldTypeInv1 (FieldType arg0@@13 arg1@@1)) arg1@@1)
 :qid |typeInv:FieldTypeInv1|
 :pattern ( (FieldType arg0@@13 arg1@@1))
))) (= (Ctor NormalFieldType) 7)) (= (type $allocated) (FieldType NormalFieldType boolType))) (= (type data) (FieldType NormalFieldType intType))) (= (Ctor RefType) 8)) (= (type next) (FieldType NormalFieldType RefType))) (= (type head) (FieldType NormalFieldType RefType))) (= (type held) (FieldType NormalFieldType intType))) (= (type changed) (FieldType NormalFieldType boolType))))
(assert (distinct $allocated data next head held changed)
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
 :qid |stdinbpl.278:18|
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
)))))
(assert (forall ((Heap0 T@U) (Heap1 T@U) ) (!  (=> (and (and (= (type Heap0) (MapType0Type RefType)) (= (type Heap1) (MapType0Type RefType))) (succHeap Heap0 Heap1)) (succHeapTrans Heap0 Heap1))
 :qid |stdinbpl.88:15|
 :skolemid |11|
 :pattern ( (succHeap Heap0 Heap1))
)))
(assert  (and (and (and (and (and (and (and (and (and (forall ((arg0@@21 T@T) (arg1@@5 T@T) ) (! (= (Ctor (MapType1Type arg0@@21 arg1@@5)) 11)
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
)))) (= (Ctor PredicateType_lsegType) 12)) (= (Ctor FrameTypeType) 13)) (forall ((arg0@@26 T@U) (arg1@@10 T@U) ) (! (= (type (lseg arg0@@26 arg1@@10)) (FieldType PredicateType_lsegType FrameTypeType))
 :qid |funType:lseg|
 :pattern ( (lseg arg0@@26 arg1@@10))
))))
(assert (forall ((Heap T@U) (Mask T@U) (this T@U) (end T@U) ) (!  (=> (and (and (and (and (= (type Heap) (MapType0Type RefType)) (= (type Mask) (MapType1Type RefType realType))) (= (type this) RefType)) (= (type end) RefType)) (and (state Heap Mask) (< AssumeFunctionsAbove 3))) (= (lengthNodes Heap this end) (ite (= this end) 0 (+ 1 (|lengthNodes'| Heap (MapType0Select Heap this next) end)))))
 :qid |stdinbpl.967:15|
 :skolemid |77|
 :pattern ( (state Heap Mask) (lengthNodes Heap this end))
 :pattern ( (state Heap Mask) (|lengthNodes#triggerStateless| this end) (|lseg#trigger| Heap (lseg this end)))
)))
(assert (forall ((Heap@@0 T@U) (Mask@@0 T@U) ) (!  (=> (and (and (= (type Heap@@0) (MapType0Type RefType)) (= (type Mask@@0) (MapType1Type RefType realType))) (state Heap@@0 Mask@@0)) (GoodMask Mask@@0))
 :qid |stdinbpl.124:15|
 :skolemid |15|
 :pattern ( (state Heap@@0 Mask@@0))
)))
(assert (forall ((Heap0@@0 T@U) (Heap1@@0 T@U) (Heap2 T@U) ) (!  (=> (and (and (and (= (type Heap0@@0) (MapType0Type RefType)) (= (type Heap1@@0) (MapType0Type RefType))) (= (type Heap2) (MapType0Type RefType))) (and (succHeapTrans Heap0@@0 Heap1@@0) (succHeap Heap1@@0 Heap2))) (succHeapTrans Heap0@@0 Heap2))
 :qid |stdinbpl.93:15|
 :skolemid |12|
 :pattern ( (succHeapTrans Heap0@@0 Heap1@@0) (succHeap Heap1@@0 Heap2))
)))
(assert (forall ((this@@0 T@U) (end@@0 T@U) ) (!  (=> (and (= (type this@@0) RefType) (= (type end@@0) RefType)) (IsPredicateField (lseg this@@0 end@@0)))
 :qid |stdinbpl.1775:15|
 :skolemid |108|
 :pattern ( (lseg this@@0 end@@0))
)))
(assert  (and (forall ((arg0@@27 T@U) (arg1@@11 T@U) (arg2@@3 T@U) ) (! (= (type (|contentNodes'| arg0@@27 arg1@@11 arg2@@3)) (SeqType intType))
 :qid |funType:contentNodes'|
 :pattern ( (|contentNodes'| arg0@@27 arg1@@11 arg2@@3))
)) (forall ((arg0@@28 T@U) (arg1@@12 T@U) ) (! (= (type (|contentNodes#triggerStateless| arg0@@28 arg1@@12)) (SeqType intType))
 :qid |funType:contentNodes#triggerStateless|
 :pattern ( (|contentNodes#triggerStateless| arg0@@28 arg1@@12))
))))
(assert (forall ((Heap@@1 T@U) (this@@1 T@U) (end@@1 T@U) ) (!  (=> (and (and (= (type Heap@@1) (MapType0Type RefType)) (= (type this@@1) RefType)) (= (type end@@1) RefType)) (dummyFunction (|contentNodes#triggerStateless| this@@1 end@@1)))
 :qid |stdinbpl.575:15|
 :skolemid |59|
 :pattern ( (|contentNodes'| Heap@@1 this@@1 end@@1))
)))
(assert (forall ((Heap@@2 T@U) (this@@2 T@U) (end@@2 T@U) ) (!  (=> (and (and (= (type Heap@@2) (MapType0Type RefType)) (= (type this@@2) RefType)) (= (type end@@2) RefType)) (dummyFunction (int_2_U (|lengthNodes#triggerStateless| this@@2 end@@2))))
 :qid |stdinbpl.961:15|
 :skolemid |76|
 :pattern ( (|lengthNodes'| Heap@@2 this@@2 end@@2))
)))
(assert (forall ((Heap@@3 T@U) (this@@3 T@U) (end@@3 T@U) ) (!  (=> (and (and (= (type Heap@@3) (MapType0Type RefType)) (= (type this@@3) RefType)) (= (type end@@3) RefType)) (|lseg#everUsed| (lseg this@@3 end@@3)))
 :qid |stdinbpl.1794:15|
 :skolemid |112|
 :pattern ( (|lseg#trigger| Heap@@3 (lseg this@@3 end@@3)))
)))
(assert (forall ((arg0@@29 T@U) (arg1@@13 Int) ) (! (let ((T@@1 (SeqTypeInv0 (type arg0@@29))))
(= (type (|Seq#Index| arg0@@29 arg1@@13)) T@@1))
 :qid |funType:Seq#Index|
 :pattern ( (|Seq#Index| arg0@@29 arg1@@13))
)))
(assert (forall ((s@@0 T@U) (n@@0 Int) (j Int) ) (! (let ((T@@2 (SeqTypeInv0 (type s@@0))))
 (=> (= (type s@@0) (SeqType T@@2)) (=> (and (and (< 0 n@@0) (<= 0 j)) (< j (- (|Seq#Length| s@@0) n@@0))) (and (= (|Seq#Sub| (|Seq#Add| j n@@0) n@@0) j) (= (|Seq#Index| (|Seq#Drop| s@@0 n@@0) j) (|Seq#Index| s@@0 (|Seq#Add| j n@@0)))))))
 :qid |stdinbpl.299:18|
 :skolemid |39|
 :pattern ( (|Seq#Index| (|Seq#Drop| s@@0 n@@0) j))
)))
(assert  (and (= (type null) RefType) (forall ((arg0@@30 T@U) ) (! (let ((A (FieldTypeInv0 (type arg0@@30))))
(= (type (PredicateMaskField arg0@@30)) (FieldType A (MapType1Type RefType boolType))))
 :qid |funType:PredicateMaskField|
 :pattern ( (PredicateMaskField arg0@@30))
))))
(assert (forall ((Heap@@4 T@U) (ExhaleHeap T@U) (Mask@@1 T@U) (pm_f T@U) ) (! (let ((C (FieldTypeInv0 (type pm_f))))
 (=> (and (and (and (and (and (= (type Heap@@4) (MapType0Type RefType)) (= (type ExhaleHeap) (MapType0Type RefType))) (= (type Mask@@1) (MapType1Type RefType realType))) (= (type pm_f) (FieldType C FrameTypeType))) (IdenticalOnKnownLocations Heap@@4 ExhaleHeap Mask@@1)) (and (HasDirectPerm Mask@@1 null pm_f) (IsPredicateField pm_f))) (= (MapType0Select Heap@@4 null (PredicateMaskField pm_f)) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))))
 :qid |stdinbpl.47:19|
 :skolemid |2|
 :pattern ( (IdenticalOnKnownLocations Heap@@4 ExhaleHeap Mask@@1) (IsPredicateField pm_f) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))
)))
(assert (forall ((arg0@@31 T@U) ) (! (let ((A@@0 (FieldTypeInv0 (type arg0@@31))))
(= (type (WandMaskField arg0@@31)) (FieldType A@@0 (MapType1Type RefType boolType))))
 :qid |funType:WandMaskField|
 :pattern ( (WandMaskField arg0@@31))
)))
(assert (forall ((Heap@@5 T@U) (ExhaleHeap@@0 T@U) (Mask@@2 T@U) (pm_f@@0 T@U) ) (! (let ((C@@0 (FieldTypeInv0 (type pm_f@@0))))
 (=> (and (and (and (and (and (= (type Heap@@5) (MapType0Type RefType)) (= (type ExhaleHeap@@0) (MapType0Type RefType))) (= (type Mask@@2) (MapType1Type RefType realType))) (= (type pm_f@@0) (FieldType C@@0 FrameTypeType))) (IdenticalOnKnownLocations Heap@@5 ExhaleHeap@@0 Mask@@2)) (and (HasDirectPerm Mask@@2 null pm_f@@0) (IsWandField pm_f@@0))) (= (MapType0Select Heap@@5 null (WandMaskField pm_f@@0)) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))))
 :qid |stdinbpl.60:19|
 :skolemid |5|
 :pattern ( (IdenticalOnKnownLocations Heap@@5 ExhaleHeap@@0 Mask@@2) (IsWandField pm_f@@0) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))
)))
(assert  (and (= (Ctor PredicateType_ListType) 14) (forall ((arg0@@32 T@U) ) (! (= (type (List arg0@@32)) (FieldType PredicateType_ListType FrameTypeType))
 :qid |funType:List|
 :pattern ( (List arg0@@32))
))))
(assert (forall ((this@@4 T@U) ) (!  (=> (= (type this@@4) RefType) (IsPredicateField (List this@@4)))
 :qid |stdinbpl.2003:15|
 :skolemid |118|
 :pattern ( (List this@@4))
)))
(assert  (and (forall ((arg0@@33 T@U) (arg1@@14 T@U) ) (! (= (type (|content'| arg0@@33 arg1@@14)) (SeqType intType))
 :qid |funType:content'|
 :pattern ( (|content'| arg0@@33 arg1@@14))
)) (forall ((arg0@@34 T@U) ) (! (= (type (|content#triggerStateless| arg0@@34)) (SeqType intType))
 :qid |funType:content#triggerStateless|
 :pattern ( (|content#triggerStateless| arg0@@34))
))))
(assert (forall ((Heap@@6 T@U) (this@@5 T@U) ) (!  (=> (and (= (type Heap@@6) (MapType0Type RefType)) (= (type this@@5) RefType)) (dummyFunction (|content#triggerStateless| this@@5)))
 :qid |stdinbpl.1186:15|
 :skolemid |84|
 :pattern ( (|content'| Heap@@6 this@@5))
)))
(assert (forall ((Heap@@7 T@U) (this@@6 T@U) ) (!  (=> (and (= (type Heap@@7) (MapType0Type RefType)) (= (type this@@6) RefType)) (dummyFunction (int_2_U (|length#triggerStateless| this@@6))))
 :qid |stdinbpl.1348:15|
 :skolemid |92|
 :pattern ( (|length'| Heap@@7 this@@6))
)))
(assert (forall ((Heap@@8 T@U) (this@@7 T@U) ) (!  (=> (and (= (type Heap@@8) (MapType0Type RefType)) (= (type this@@7) RefType)) (dummyFunction (int_2_U (|peek#triggerStateless| this@@7))))
 :qid |stdinbpl.1500:15|
 :skolemid |98|
 :pattern ( (|peek'| Heap@@8 this@@7))
)))
(assert (forall ((Heap@@9 T@U) (this@@8 T@U) ) (!  (=> (and (= (type Heap@@9) (MapType0Type RefType)) (= (type this@@8) RefType)) (|List#everUsed| (List this@@8)))
 :qid |stdinbpl.2022:15|
 :skolemid |122|
 :pattern ( (|List#trigger| Heap@@9 (List this@@8)))
)))
(assert (forall ((arg0@@35 T@U) (arg1@@15 Int) (arg2@@4 T@U) ) (! (let ((T@@3 (type arg2@@4)))
(= (type (|Seq#Update| arg0@@35 arg1@@15 arg2@@4)) (SeqType T@@3)))
 :qid |funType:Seq#Update|
 :pattern ( (|Seq#Update| arg0@@35 arg1@@15 arg2@@4))
)))
(assert (forall ((s@@1 T@U) (i Int) (v T@U) (n@@1 Int) ) (! (let ((T@@4 (type v)))
 (=> (= (type s@@1) (SeqType T@@4)) (=> (and (<= 0 n@@1) (< n@@1 (|Seq#Length| s@@1))) (and (=> (= i n@@1) (= (|Seq#Index| (|Seq#Update| s@@1 i v) n@@1) v)) (=> (not (= i n@@1)) (= (|Seq#Index| (|Seq#Update| s@@1 i v) n@@1) (|Seq#Index| s@@1 n@@1)))))))
 :qid |stdinbpl.254:18|
 :skolemid |35|
 :pattern ( (|Seq#Index| (|Seq#Update| s@@1 i v) n@@1))
 :pattern ( (|Seq#Index| s@@1 n@@1) (|Seq#Update| s@@1 i v))
)))
(assert (forall ((Heap@@10 T@U) (Mask@@3 T@U) (this@@9 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@10) (MapType0Type RefType)) (= (type Mask@@3) (MapType1Type RefType realType))) (= (type this@@9) RefType)) (and (state Heap@@10 Mask@@3) (< AssumeFunctionsAbove 0))) (< 0 (length Heap@@10 this@@9))) (= (peek Heap@@10 this@@9) (U_2_int (MapType0Select Heap@@10 (MapType0Select Heap@@10 this@@9 head) data))))
 :qid |stdinbpl.1506:15|
 :skolemid |99|
 :pattern ( (state Heap@@10 Mask@@3) (peek Heap@@10 this@@9))
 :pattern ( (state Heap@@10 Mask@@3) (|peek#triggerStateless| this@@9) (|List#trigger| Heap@@10 (List this@@9)))
)))
(assert (forall ((arg0@@36 T@U) (arg1@@16 Int) ) (! (let ((T@@5 (SeqTypeInv0 (type arg0@@36))))
(= (type (|Seq#Take| arg0@@36 arg1@@16)) (SeqType T@@5)))
 :qid |funType:Seq#Take|
 :pattern ( (|Seq#Take| arg0@@36 arg1@@16))
)))
(assert (forall ((s@@2 T@U) (n@@2 Int) ) (! (let ((T@@6 (SeqTypeInv0 (type s@@2))))
 (=> (= (type s@@2) (SeqType T@@6)) (and (=> (<= 0 n@@2) (and (=> (<= n@@2 (|Seq#Length| s@@2)) (= (|Seq#Length| (|Seq#Take| s@@2 n@@2)) n@@2)) (=> (< (|Seq#Length| s@@2) n@@2) (= (|Seq#Length| (|Seq#Take| s@@2 n@@2)) (|Seq#Length| s@@2))))) (=> (< n@@2 0) (= (|Seq#Length| (|Seq#Take| s@@2 n@@2)) 0)))))
 :qid |stdinbpl.265:18|
 :skolemid |36|
 :pattern ( (|Seq#Length| (|Seq#Take| s@@2 n@@2)))
 :pattern ( (|Seq#Take| s@@2 n@@2) (|Seq#Length| s@@2))
)))
(assert (forall ((arg0@@37 T@U) (arg1@@17 T@U) ) (! (= (type (content arg0@@37 arg1@@17)) (SeqType intType))
 :qid |funType:content|
 :pattern ( (content arg0@@37 arg1@@17))
)))
(assert (forall ((Heap@@11 T@U) (Mask@@4 T@U) (this@@10 T@U) ) (!  (=> (and (and (and (= (type Heap@@11) (MapType0Type RefType)) (= (type Mask@@4) (MapType1Type RefType realType))) (= (type this@@10) RefType)) (and (state Heap@@11 Mask@@4) (or (< AssumeFunctionsAbove 1) (|length#trigger| (MapType0Select Heap@@11 null (List this@@10)) this@@10)))) (= (|length'| Heap@@11 this@@10) (|Seq#Length| (content Heap@@11 this@@10))))
 :qid |stdinbpl.1367:15|
 :skolemid |95|
 :pattern ( (state Heap@@11 Mask@@4) (|length'| Heap@@11 this@@10))
)))
(assert (forall ((arg0@@38 Int) (arg1@@18 Int) ) (! (= (type (|Seq#Range| arg0@@38 arg1@@18)) (SeqType intType))
 :qid |funType:Seq#Range|
 :pattern ( (|Seq#Range| arg0@@38 arg1@@18))
)))
(assert (forall ((q@min Int) (q@max Int) (v@@0 T@U) ) (!  (=> (= (type v@@0) intType) (= (|Seq#Contains| (|Seq#Range| q@min q@max) v@@0)  (and (<= q@min (U_2_int v@@0)) (< (U_2_int v@@0) q@max))))
 :qid |stdinbpl.538:15|
 :skolemid |57|
 :pattern ( (|Seq#Contains| (|Seq#Range| q@min q@max) v@@0))
)))
(assert (forall ((s@@3 T@U) (x@@8 T@U) ) (! (let ((T@@7 (type x@@8)))
 (=> (and (= (type s@@3) (SeqType T@@7)) (|Seq#Contains| s@@3 x@@8)) (and (and (<= 0 (|Seq#Skolem| s@@3 x@@8)) (< (|Seq#Skolem| s@@3 x@@8) (|Seq#Length| s@@3))) (= (|Seq#Index| s@@3 (|Seq#Skolem| s@@3 x@@8)) x@@8))))
 :qid |stdinbpl.396:18|
 :skolemid |47|
 :pattern ( (|Seq#Contains| s@@3 x@@8))
)))
(assert (forall ((Heap@@12 T@U) (ExhaleHeap@@1 T@U) (Mask@@5 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@12) (MapType0Type RefType)) (= (type ExhaleHeap@@1) (MapType0Type RefType))) (= (type Mask@@5) (MapType1Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@12 ExhaleHeap@@1 Mask@@5)) (U_2_bool (MapType0Select Heap@@12 o_1 $allocated))) (U_2_bool (MapType0Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.73:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@12 ExhaleHeap@@1 Mask@@5) (MapType0Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert (forall ((Heap@@13 T@U) (this@@11 T@U) ) (!  (=> (and (= (type Heap@@13) (MapType0Type RefType)) (= (type this@@11) RefType)) (and (= (content Heap@@13 this@@11) (|content'| Heap@@13 this@@11)) (dummyFunction (|content#triggerStateless| this@@11))))
 :qid |stdinbpl.1182:15|
 :skolemid |83|
 :pattern ( (content Heap@@13 this@@11))
)))
(assert (forall ((Heap@@14 T@U) (this@@12 T@U) ) (!  (=> (and (= (type Heap@@14) (MapType0Type RefType)) (= (type this@@12) RefType)) (and (= (length Heap@@14 this@@12) (|length'| Heap@@14 this@@12)) (dummyFunction (int_2_U (|length#triggerStateless| this@@12)))))
 :qid |stdinbpl.1344:15|
 :skolemid |91|
 :pattern ( (length Heap@@14 this@@12))
)))
(assert (forall ((Heap@@15 T@U) (this@@13 T@U) ) (!  (=> (and (= (type Heap@@15) (MapType0Type RefType)) (= (type this@@13) RefType)) (and (= (peek Heap@@15 this@@13) (|peek'| Heap@@15 this@@13)) (dummyFunction (int_2_U (|peek#triggerStateless| this@@13)))))
 :qid |stdinbpl.1496:15|
 :skolemid |97|
 :pattern ( (peek Heap@@15 this@@13))
)))
(assert (forall ((s@@4 T@U) (n@@3 Int) ) (! (let ((T@@8 (SeqTypeInv0 (type s@@4))))
 (=> (and (= (type s@@4) (SeqType T@@8)) (<= n@@3 0)) (= (|Seq#Drop| s@@4 n@@3) s@@4)))
 :qid |stdinbpl.380:18|
 :skolemid |45|
 :pattern ( (|Seq#Drop| s@@4 n@@3))
)))
(assert (forall ((i@@0 Int) (j@@0 Int) ) (! (= (|Seq#Sub| i@@0 j@@0) (- i@@0 j@@0))
 :qid |stdinbpl.234:15|
 :skolemid |30|
 :pattern ( (|Seq#Sub| i@@0 j@@0))
)))
(assert (forall ((i@@1 Int) (j@@1 Int) ) (! (= (|Seq#Add| i@@1 j@@1) (+ i@@1 j@@1))
 :qid |stdinbpl.232:15|
 :skolemid |29|
 :pattern ( (|Seq#Add| i@@1 j@@1))
)))
(assert  (and (and (and (forall ((arg0@@39 T@U) (arg1@@19 T@U) (arg2@@5 T@U) ) (! (= (type (contentNodes arg0@@39 arg1@@19 arg2@@5)) (SeqType intType))
 :qid |funType:contentNodes|
 :pattern ( (contentNodes arg0@@39 arg1@@19 arg2@@5))
)) (forall ((T@@9 T@T) ) (! (= (type (|Seq#Empty| T@@9)) (SeqType T@@9))
 :qid |funType:Seq#Empty|
 :pattern ( (|Seq#Empty| T@@9))
))) (forall ((arg0@@40 T@U) (arg1@@20 T@U) ) (! (let ((T@@10 (SeqTypeInv0 (type arg0@@40))))
(= (type (|Seq#Append| arg0@@40 arg1@@20)) (SeqType T@@10)))
 :qid |funType:Seq#Append|
 :pattern ( (|Seq#Append| arg0@@40 arg1@@20))
))) (forall ((arg0@@41 T@U) ) (! (let ((T@@11 (type arg0@@41)))
(= (type (|Seq#Singleton| arg0@@41)) (SeqType T@@11)))
 :qid |funType:Seq#Singleton|
 :pattern ( (|Seq#Singleton| arg0@@41))
))))
(assert (forall ((Heap@@16 T@U) (Mask@@6 T@U) (this@@14 T@U) (end@@4 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@16) (MapType0Type RefType)) (= (type Mask@@6) (MapType1Type RefType realType))) (= (type this@@14) RefType)) (= (type end@@4) RefType)) (and (state Heap@@16 Mask@@6) (< AssumeFunctionsAbove 4))) (= (contentNodes Heap@@16 this@@14 end@@4) (ite (= this@@14 end@@4) (|Seq#Empty| intType) (|Seq#Append| (|Seq#Singleton| (MapType0Select Heap@@16 this@@14 data)) (|contentNodes'| Heap@@16 (MapType0Select Heap@@16 this@@14 next) end@@4)))))
 :qid |stdinbpl.581:15|
 :skolemid |60|
 :pattern ( (state Heap@@16 Mask@@6) (contentNodes Heap@@16 this@@14 end@@4))
 :pattern ( (state Heap@@16 Mask@@6) (|contentNodes#triggerStateless| this@@14 end@@4) (|lseg#trigger| Heap@@16 (lseg this@@14 end@@4)))
)))
(assert (forall ((x@@9 T@U) (y@@1 T@U) ) (! (let ((T@@12 (type x@@9)))
 (=> (= (type y@@1) T@@12) (= (|Seq#Contains| (|Seq#Singleton| x@@9) y@@1) (= x@@9 y@@1))))
 :qid |stdinbpl.521:18|
 :skolemid |54|
 :pattern ( (|Seq#Contains| (|Seq#Singleton| x@@9) y@@1))
)))
(assert (forall ((Heap@@17 T@U) (Mask@@7 T@U) (this@@15 T@U) (end@@5 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@17) (MapType0Type RefType)) (= (type Mask@@7) (MapType1Type RefType realType))) (= (type this@@15) RefType)) (= (type end@@5) RefType)) (and (state Heap@@17 Mask@@7) (or (< AssumeFunctionsAbove 3) (|lengthNodes#trigger| (MapType0Select Heap@@17 null (lseg this@@15 end@@5)) this@@15 end@@5)))) (= (|lengthNodes'| Heap@@17 this@@15 end@@5) (|Seq#Length| (contentNodes Heap@@17 this@@15 end@@5))))
 :qid |stdinbpl.980:15|
 :skolemid |79|
 :pattern ( (state Heap@@17 Mask@@7) (|lengthNodes'| Heap@@17 this@@15 end@@5))
)))
(assert (forall ((Heap@@18 T@U) (Mask@@8 T@U) (this@@16 T@U) (end@@6 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@18) (MapType0Type RefType)) (= (type Mask@@8) (MapType1Type RefType realType))) (= (type this@@16) RefType)) (= (type end@@6) RefType)) (and (state Heap@@18 Mask@@8) (or (< AssumeFunctionsAbove 4) (|contentNodes#trigger| (MapType0Select Heap@@18 null (lseg this@@16 end@@6)) this@@16 end@@6)))) (forall ((i@@2 Int) (j@@2 Int) ) (!  (=> (and (<= 0 i@@2) (and (< i@@2 j@@2) (< j@@2 (|Seq#Length| (|contentNodes'| Heap@@18 this@@16 end@@6))))) (<= (U_2_int (|Seq#Index| (|contentNodes'| Heap@@18 this@@16 end@@6) i@@2)) (U_2_int (|Seq#Index| (|contentNodes'| Heap@@18 this@@16 end@@6) j@@2))))
 :qid |stdinbpl.604:127|
 :skolemid |64|
 :pattern ( (|Seq#Index| (|contentNodes'| Heap@@18 this@@16 end@@6) i@@2) (|Seq#Index| (|contentNodes'| Heap@@18 this@@16 end@@6) j@@2))
)))
 :qid |stdinbpl.602:15|
 :skolemid |65|
 :pattern ( (state Heap@@18 Mask@@8) (|contentNodes'| Heap@@18 this@@16 end@@6))
)))
(assert (forall ((this@@17 T@U) (end@@7 T@U) (this2 T@U) (end2 T@U) ) (!  (=> (and (and (and (and (= (type this@@17) RefType) (= (type end@@7) RefType)) (= (type this2) RefType)) (= (type end2) RefType)) (= (lseg this@@17 end@@7) (lseg this2 end2))) (and (= this@@17 this2) (= end@@7 end2)))
 :qid |stdinbpl.1785:15|
 :skolemid |110|
 :pattern ( (lseg this@@17 end@@7) (lseg this2 end2))
)))
(assert (forall ((arg0@@42 T@U) (arg1@@21 T@U) ) (! (= (type (|lseg#sm| arg0@@42 arg1@@21)) (FieldType PredicateType_lsegType (MapType1Type RefType boolType)))
 :qid |funType:lseg#sm|
 :pattern ( (|lseg#sm| arg0@@42 arg1@@21))
)))
(assert (forall ((this@@18 T@U) (end@@8 T@U) (this2@@0 T@U) (end2@@0 T@U) ) (!  (=> (and (and (and (and (= (type this@@18) RefType) (= (type end@@8) RefType)) (= (type this2@@0) RefType)) (= (type end2@@0) RefType)) (= (|lseg#sm| this@@18 end@@8) (|lseg#sm| this2@@0 end2@@0))) (and (= this@@18 this2@@0) (= end@@8 end2@@0)))
 :qid |stdinbpl.1789:15|
 :skolemid |111|
 :pattern ( (|lseg#sm| this@@18 end@@8) (|lseg#sm| this2@@0 end2@@0))
)))
(assert (forall ((s@@5 T@U) (n@@4 Int) (j@@3 Int) ) (! (let ((T@@13 (SeqTypeInv0 (type s@@5))))
 (=> (= (type s@@5) (SeqType T@@13)) (=> (and (and (<= 0 j@@3) (< j@@3 n@@4)) (< j@@3 (|Seq#Length| s@@5))) (= (|Seq#Index| (|Seq#Take| s@@5 n@@4) j@@3) (|Seq#Index| s@@5 j@@3)))))
 :qid |stdinbpl.273:18|
 :skolemid |37|
 :pattern ( (|Seq#Index| (|Seq#Take| s@@5 n@@4) j@@3))
 :pattern ( (|Seq#Index| s@@5 j@@3) (|Seq#Take| s@@5 n@@4))
)))
(assert (forall ((this@@19 T@U) (this2@@1 T@U) ) (!  (=> (and (and (= (type this@@19) RefType) (= (type this2@@1) RefType)) (= (List this@@19) (List this2@@1))) (= this@@19 this2@@1))
 :qid |stdinbpl.2013:15|
 :skolemid |120|
 :pattern ( (List this@@19) (List this2@@1))
)))
(assert (forall ((arg0@@43 T@U) ) (! (= (type (|List#sm| arg0@@43)) (FieldType PredicateType_ListType (MapType1Type RefType boolType)))
 :qid |funType:List#sm|
 :pattern ( (|List#sm| arg0@@43))
)))
(assert (forall ((this@@20 T@U) (this2@@2 T@U) ) (!  (=> (and (and (= (type this@@20) RefType) (= (type this2@@2) RefType)) (= (|List#sm| this@@20) (|List#sm| this2@@2))) (= this@@20 this2@@2))
 :qid |stdinbpl.2017:15|
 :skolemid |121|
 :pattern ( (|List#sm| this@@20) (|List#sm| this2@@2))
)))
(assert (forall ((arg0@@44 T@U) (arg1@@22 T@U) (arg2@@6 T@U) ) (! (= (type (|contentNodes#frame| arg0@@44 arg1@@22 arg2@@6)) (SeqType intType))
 :qid |funType:contentNodes#frame|
 :pattern ( (|contentNodes#frame| arg0@@44 arg1@@22 arg2@@6))
)))
(assert (forall ((Heap@@19 T@U) (Mask@@9 T@U) (this@@21 T@U) (end@@9 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@19) (MapType0Type RefType)) (= (type Mask@@9) (MapType1Type RefType realType))) (= (type this@@21) RefType)) (= (type end@@9) RefType)) (state Heap@@19 Mask@@9)) (= (|contentNodes'| Heap@@19 this@@21 end@@9) (|contentNodes#frame| (MapType0Select Heap@@19 null (lseg this@@21 end@@9)) this@@21 end@@9)))
 :qid |stdinbpl.588:15|
 :skolemid |61|
 :pattern ( (state Heap@@19 Mask@@9) (|contentNodes'| Heap@@19 this@@21 end@@9))
 :pattern ( (state Heap@@19 Mask@@9) (|contentNodes#triggerStateless| this@@21 end@@9) (|lseg#trigger| Heap@@19 (lseg this@@21 end@@9)))
)))
(assert (forall ((Heap@@20 T@U) (Mask@@10 T@U) (this@@22 T@U) (end@@10 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@20) (MapType0Type RefType)) (= (type Mask@@10) (MapType1Type RefType realType))) (= (type this@@22) RefType)) (= (type end@@10) RefType)) (state Heap@@20 Mask@@10)) (= (|lengthNodes'| Heap@@20 this@@22 end@@10) (|lengthNodes#frame| (MapType0Select Heap@@20 null (lseg this@@22 end@@10)) this@@22 end@@10)))
 :qid |stdinbpl.974:15|
 :skolemid |78|
 :pattern ( (state Heap@@20 Mask@@10) (|lengthNodes'| Heap@@20 this@@22 end@@10))
 :pattern ( (state Heap@@20 Mask@@10) (|lengthNodes#triggerStateless| this@@22 end@@10) (|lseg#trigger| Heap@@20 (lseg this@@22 end@@10)))
)))
(assert (forall ((Heap@@21 T@U) (ExhaleHeap@@2 T@U) (Mask@@11 T@U) (o_1@@0 T@U) (f_2 T@U) ) (! (let ((B@@1 (FieldTypeInv1 (type f_2))))
(let ((A@@1 (FieldTypeInv0 (type f_2))))
 (=> (and (and (and (and (and (and (= (type Heap@@21) (MapType0Type RefType)) (= (type ExhaleHeap@@2) (MapType0Type RefType))) (= (type Mask@@11) (MapType1Type RefType realType))) (= (type o_1@@0) RefType)) (= (type f_2) (FieldType A@@1 B@@1))) (IdenticalOnKnownLocations Heap@@21 ExhaleHeap@@2 Mask@@11)) (HasDirectPerm Mask@@11 o_1@@0 f_2)) (= (MapType0Select Heap@@21 o_1@@0 f_2) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2)))))
 :qid |stdinbpl.42:22|
 :skolemid |1|
 :pattern ( (IdenticalOnKnownLocations Heap@@21 ExhaleHeap@@2 Mask@@11) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2))
)))
(assert (forall ((T@@14 T@T) ) (! (= (|Seq#Length| (|Seq#Empty| T@@14)) 0)
 :skolemid |23|
)))
(assert  (and (= (type dummyHeap) (MapType0Type RefType)) (= (type ZeroMask) (MapType1Type RefType realType))))
(assert (state dummyHeap ZeroMask))
(assert (forall ((p T@U) (v_1 T@U) (w T@U) ) (! (let ((A@@2 (FieldTypeInv0 (type p))))
 (=> (and (and (= (type p) (FieldType A@@2 FrameTypeType)) (= (type v_1) FrameTypeType)) (= (type w) FrameTypeType)) (not (InsidePredicate p v_1 p w))))
 :qid |stdinbpl.177:19|
 :skolemid |21|
 :pattern ( (InsidePredicate p v_1 p w))
)))
(assert (forall ((s0 T@U) (s1 T@U) (n@@5 Int) ) (! (let ((T@@15 (SeqTypeInv0 (type s0))))
 (=> (and (= (type s0) (SeqType T@@15)) (= (type s1) (SeqType T@@15))) (=> (and (and (and (not (= s0 (|Seq#Empty| T@@15))) (not (= s1 (|Seq#Empty| T@@15)))) (<= (|Seq#Length| s0) n@@5)) (< n@@5 (|Seq#Length| (|Seq#Append| s0 s1)))) (and (= (|Seq#Add| (|Seq#Sub| n@@5 (|Seq#Length| s0)) (|Seq#Length| s0)) n@@5) (= (|Seq#Index| (|Seq#Append| s0 s1) n@@5) (|Seq#Index| s1 (|Seq#Sub| n@@5 (|Seq#Length| s0))))))))
 :qid |stdinbpl.245:18|
 :skolemid |32|
 :pattern ( (|Seq#Index| (|Seq#Append| s0 s1) n@@5))
)))
(assert  (not (IsPredicateField data)))
(assert  (not (IsWandField data)))
(assert  (not (IsPredicateField next)))
(assert  (not (IsWandField next)))
(assert  (not (IsPredicateField head)))
(assert  (not (IsWandField head)))
(assert  (not (IsPredicateField held)))
(assert  (not (IsWandField held)))
(assert  (not (IsPredicateField changed)))
(assert  (not (IsWandField changed)))
(assert (forall ((Heap@@22 T@U) (ExhaleHeap@@3 T@U) (Mask@@12 T@U) ) (!  (=> (and (and (and (= (type Heap@@22) (MapType0Type RefType)) (= (type ExhaleHeap@@3) (MapType0Type RefType))) (= (type Mask@@12) (MapType1Type RefType realType))) (IdenticalOnKnownLocations Heap@@22 ExhaleHeap@@3 Mask@@12)) (succHeap Heap@@22 ExhaleHeap@@3))
 :qid |stdinbpl.83:15|
 :skolemid |10|
 :pattern ( (IdenticalOnKnownLocations Heap@@22 ExhaleHeap@@3 Mask@@12))
)))
(assert (forall ((Heap@@23 T@U) (Mask@@13 T@U) (this@@23 T@U) (end@@11 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@23) (MapType0Type RefType)) (= (type Mask@@13) (MapType1Type RefType realType))) (= (type this@@23) RefType)) (= (type end@@11) RefType)) (and (state Heap@@23 Mask@@13) (or (< AssumeFunctionsAbove 4) (|contentNodes#trigger| (MapType0Select Heap@@23 null (lseg this@@23 end@@11)) this@@23 end@@11)))) (not (= this@@23 end@@11))) (and (< 0 (|Seq#Length| (|contentNodes'| Heap@@23 this@@23 end@@11))) (= (U_2_int (|Seq#Index| (|contentNodes'| Heap@@23 this@@23 end@@11) 0)) (U_2_int (MapType0Select Heap@@23 this@@23 data)))))
 :qid |stdinbpl.598:15|
 :skolemid |63|
 :pattern ( (state Heap@@23 Mask@@13) (|contentNodes'| Heap@@23 this@@23 end@@11))
)))
(assert (forall ((Heap@@24 T@U) (Mask@@14 T@U) (this@@24 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@24) (MapType0Type RefType)) (= (type Mask@@14) (MapType1Type RefType realType))) (= (type this@@24) RefType)) (and (state Heap@@24 Mask@@14) (or (< AssumeFunctionsAbove 0) (|peek#trigger| (MapType0Select Heap@@24 null (List this@@24)) this@@24)))) (< 0 (length Heap@@24 this@@24))) (= (|peek'| Heap@@24 this@@24) (U_2_int (|Seq#Index| (content Heap@@24 this@@24) 0))))
 :qid |stdinbpl.1519:15|
 :skolemid |101|
 :pattern ( (state Heap@@24 Mask@@14) (|peek'| Heap@@24 this@@24))
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
(assert  (and (forall ((arg0@@45 Real) (arg1@@23 T@U) ) (! (= (type (ConditionalFrame arg0@@45 arg1@@23)) FrameTypeType)
 :qid |funType:ConditionalFrame|
 :pattern ( (ConditionalFrame arg0@@45 arg1@@23))
)) (= (type EmptyFrame) FrameTypeType)))
(assert (forall ((p@@0 Real) (f_6 T@U) ) (!  (=> (= (type f_6) FrameTypeType) (= (ConditionalFrame p@@0 f_6) (ite (> p@@0 0.0) f_6 EmptyFrame)))
 :qid |stdinbpl.165:15|
 :skolemid |19|
 :pattern ( (ConditionalFrame p@@0 f_6))
)))
(assert (forall ((q@min@@0 Int) (q@max@@0 Int) (j@@4 Int) ) (!  (=> (and (<= 0 j@@4) (< j@@4 (- q@max@@0 q@min@@0))) (= (U_2_int (|Seq#Index| (|Seq#Range| q@min@@0 q@max@@0) j@@4)) (+ q@min@@0 j@@4)))
 :qid |stdinbpl.536:15|
 :skolemid |56|
 :pattern ( (|Seq#Index| (|Seq#Range| q@min@@0 q@max@@0) j@@4))
)))
(assert (forall ((Mask@@15 T@U) (o_2@@0 T@U) (f_4@@0 T@U) ) (! (let ((B@@3 (FieldTypeInv1 (type f_4@@0))))
(let ((A@@4 (FieldTypeInv0 (type f_4@@0))))
 (=> (and (and (= (type Mask@@15) (MapType1Type RefType realType)) (= (type o_2@@0) RefType)) (= (type f_4@@0) (FieldType A@@4 B@@3))) (= (HasDirectPerm Mask@@15 o_2@@0 f_4@@0) (> (U_2_real (MapType1Select Mask@@15 o_2@@0 f_4@@0)) NoPerm)))))
 :qid |stdinbpl.133:22|
 :skolemid |17|
 :pattern ( (HasDirectPerm Mask@@15 o_2@@0 f_4@@0))
)))
(assert (forall ((s0@@0 T@U) (s1@@0 T@U) ) (! (let ((T@@16 (SeqTypeInv0 (type s0@@0))))
 (=> (and (and (= (type s0@@0) (SeqType T@@16)) (= (type s1@@0) (SeqType T@@16))) (and (not (= s0@@0 (|Seq#Empty| T@@16))) (not (= s1@@0 (|Seq#Empty| T@@16))))) (= (|Seq#Length| (|Seq#Append| s0@@0 s1@@0)) (+ (|Seq#Length| s0@@0) (|Seq#Length| s1@@0)))))
 :qid |stdinbpl.214:18|
 :skolemid |26|
 :pattern ( (|Seq#Length| (|Seq#Append| s0@@0 s1@@0)))
)))
(assert (forall ((s@@6 T@U) (t T@U) (n@@6 Int) ) (! (let ((T@@17 (SeqTypeInv0 (type s@@6))))
 (=> (and (and (= (type s@@6) (SeqType T@@17)) (= (type t) (SeqType T@@17))) (and (> n@@6 0) (> n@@6 (|Seq#Length| s@@6)))) (and (= (|Seq#Add| (|Seq#Sub| n@@6 (|Seq#Length| s@@6)) (|Seq#Length| s@@6)) n@@6) (= (|Seq#Drop| (|Seq#Append| s@@6 t) n@@6) (|Seq#Drop| t (|Seq#Sub| n@@6 (|Seq#Length| s@@6)))))))
 :qid |stdinbpl.370:18|
 :skolemid |44|
 :pattern ( (|Seq#Drop| (|Seq#Append| s@@6 t) n@@6))
)))
(assert (forall ((Heap@@25 T@U) (this@@25 T@U) (end@@12 T@U) ) (!  (=> (and (and (= (type Heap@@25) (MapType0Type RefType)) (= (type this@@25) RefType)) (= (type end@@12) RefType)) (and (= (contentNodes Heap@@25 this@@25 end@@12) (|contentNodes'| Heap@@25 this@@25 end@@12)) (dummyFunction (|contentNodes#triggerStateless| this@@25 end@@12))))
 :qid |stdinbpl.571:15|
 :skolemid |58|
 :pattern ( (contentNodes Heap@@25 this@@25 end@@12))
)))
(assert (forall ((Heap@@26 T@U) (this@@26 T@U) (end@@13 T@U) ) (!  (=> (and (and (= (type Heap@@26) (MapType0Type RefType)) (= (type this@@26) RefType)) (= (type end@@13) RefType)) (and (= (lengthNodes Heap@@26 this@@26 end@@13) (|lengthNodes'| Heap@@26 this@@26 end@@13)) (dummyFunction (int_2_U (|lengthNodes#triggerStateless| this@@26 end@@13)))))
 :qid |stdinbpl.957:15|
 :skolemid |75|
 :pattern ( (lengthNodes Heap@@26 this@@26 end@@13))
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
 :qid |stdinbpl.357:18|
 :skolemid |42|
 :pattern ( (|Seq#Take| (|Seq#Append| s@@7 t@@0) n@@7))
)))
(assert (forall ((q@min@@1 Int) (q@max@@1 Int) ) (!  (and (=> (< q@min@@1 q@max@@1) (= (|Seq#Length| (|Seq#Range| q@min@@1 q@max@@1)) (- q@max@@1 q@min@@1))) (=> (<= q@max@@1 q@min@@1) (= (|Seq#Length| (|Seq#Range| q@min@@1 q@max@@1)) 0)))
 :qid |stdinbpl.535:15|
 :skolemid |55|
 :pattern ( (|Seq#Length| (|Seq#Range| q@min@@1 q@max@@1)))
)))
(assert (forall ((a T@U) (b T@U) ) (! (let ((T@@19 (SeqTypeInv0 (type a))))
 (=> (and (and (= (type a) (SeqType T@@19)) (= (type b) (SeqType T@@19))) (|Seq#Equal| a b)) (= a b)))
 :qid |stdinbpl.508:18|
 :skolemid |53|
 :pattern ( (|Seq#Equal| a b))
)))
(assert (forall ((s@@8 T@U) (i@@3 Int) ) (! (let ((T@@20 (SeqTypeInv0 (type s@@8))))
 (=> (= (type s@@8) (SeqType T@@20)) (=> (and (<= 0 i@@3) (< i@@3 (|Seq#Length| s@@8))) (|Seq#ContainsTrigger| s@@8 (|Seq#Index| s@@8 i@@3)))))
 :qid |stdinbpl.401:18|
 :skolemid |49|
 :pattern ( (|Seq#Index| s@@8 i@@3))
)))
(assert (forall ((s0@@1 T@U) (s1@@1 T@U) ) (! (let ((T@@21 (SeqTypeInv0 (type s0@@1))))
 (=> (and (= (type s0@@1) (SeqType T@@21)) (= (type s1@@1) (SeqType T@@21))) (and (=> (= s0@@1 (|Seq#Empty| T@@21)) (= (|Seq#Append| s0@@1 s1@@1) s1@@1)) (=> (= s1@@1 (|Seq#Empty| T@@21)) (= (|Seq#Append| s0@@1 s1@@1) s0@@1)))))
 :qid |stdinbpl.220:18|
 :skolemid |27|
 :pattern ( (|Seq#Append| s0@@1 s1@@1))
)))
(assert (forall ((t@@1 T@U) ) (! (= (|Seq#Index| (|Seq#Singleton| t@@1) 0) t@@1)
 :qid |stdinbpl.224:18|
 :skolemid |28|
 :pattern ( (|Seq#Singleton| t@@1))
)))
(assert (forall ((s@@9 T@U) ) (! (let ((T@@22 (SeqTypeInv0 (type s@@9))))
 (=> (= (type s@@9) (SeqType T@@22)) (<= 0 (|Seq#Length| s@@9))))
 :qid |stdinbpl.203:18|
 :skolemid |22|
 :pattern ( (|Seq#Length| s@@9))
)))
(assert (forall ((this@@27 T@U) (end@@14 T@U) ) (!  (=> (and (= (type this@@27) RefType) (= (type end@@14) RefType)) (= (getPredWandId (lseg this@@27 end@@14)) 0))
 :qid |stdinbpl.1779:15|
 :skolemid |109|
 :pattern ( (lseg this@@27 end@@14))
)))
(assert (forall ((s0@@2 T@U) (s1@@2 T@U) ) (! (let ((T@@23 (SeqTypeInv0 (type s0@@2))))
 (=> (and (and (= (type s0@@2) (SeqType T@@23)) (= (type s1@@2) (SeqType T@@23))) (|Seq#Equal| s0@@2 s1@@2)) (and (= (|Seq#Length| s0@@2) (|Seq#Length| s1@@2)) (forall ((j@@5 Int) ) (!  (=> (and (<= 0 j@@5) (< j@@5 (|Seq#Length| s0@@2))) (= (|Seq#Index| s0@@2 j@@5) (|Seq#Index| s1@@2 j@@5)))
 :qid |stdinbpl.498:13|
 :skolemid |50|
 :pattern ( (|Seq#Index| s0@@2 j@@5))
 :pattern ( (|Seq#Index| s1@@2 j@@5))
)))))
 :qid |stdinbpl.495:18|
 :skolemid |51|
 :pattern ( (|Seq#Equal| s0@@2 s1@@2))
)))
(assert (forall ((Heap@@27 T@U) (ExhaleHeap@@4 T@U) (Mask@@16 T@U) (pm_f@@1 T@U) ) (! (let ((C@@1 (FieldTypeInv0 (type pm_f@@1))))
 (=> (and (and (and (and (and (= (type Heap@@27) (MapType0Type RefType)) (= (type ExhaleHeap@@4) (MapType0Type RefType))) (= (type Mask@@16) (MapType1Type RefType realType))) (= (type pm_f@@1) (FieldType C@@1 FrameTypeType))) (IdenticalOnKnownLocations Heap@@27 ExhaleHeap@@4 Mask@@16)) (and (HasDirectPerm Mask@@16 null pm_f@@1) (IsPredicateField pm_f@@1))) (forall ((o2 T@U) (f_2@@0 T@U) ) (! (let ((B@@5 (FieldTypeInv1 (type f_2@@0))))
(let ((A@@6 (FieldTypeInv0 (type f_2@@0))))
 (=> (and (and (= (type o2) RefType) (= (type f_2@@0) (FieldType A@@6 B@@5))) (U_2_bool (MapType1Select (MapType0Select Heap@@27 null (PredicateMaskField pm_f@@1)) o2 f_2@@0))) (= (MapType0Select Heap@@27 o2 f_2@@0) (MapType0Select ExhaleHeap@@4 o2 f_2@@0)))))
 :qid |stdinbpl.54:134|
 :skolemid |3|
 :pattern ( (MapType0Select ExhaleHeap@@4 o2 f_2@@0))
))))
 :qid |stdinbpl.52:19|
 :skolemid |4|
 :pattern ( (IdenticalOnKnownLocations Heap@@27 ExhaleHeap@@4 Mask@@16) (IsPredicateField pm_f@@1))
)))
(assert (forall ((Heap@@28 T@U) (ExhaleHeap@@5 T@U) (Mask@@17 T@U) (pm_f@@2 T@U) ) (! (let ((C@@2 (FieldTypeInv0 (type pm_f@@2))))
 (=> (and (and (and (and (and (= (type Heap@@28) (MapType0Type RefType)) (= (type ExhaleHeap@@5) (MapType0Type RefType))) (= (type Mask@@17) (MapType1Type RefType realType))) (= (type pm_f@@2) (FieldType C@@2 FrameTypeType))) (IdenticalOnKnownLocations Heap@@28 ExhaleHeap@@5 Mask@@17)) (and (HasDirectPerm Mask@@17 null pm_f@@2) (IsWandField pm_f@@2))) (forall ((o2@@0 T@U) (f_2@@1 T@U) ) (! (let ((B@@6 (FieldTypeInv1 (type f_2@@1))))
(let ((A@@7 (FieldTypeInv0 (type f_2@@1))))
 (=> (and (and (= (type o2@@0) RefType) (= (type f_2@@1) (FieldType A@@7 B@@6))) (U_2_bool (MapType1Select (MapType0Select Heap@@28 null (WandMaskField pm_f@@2)) o2@@0 f_2@@1))) (= (MapType0Select Heap@@28 o2@@0 f_2@@1) (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1)))))
 :qid |stdinbpl.67:129|
 :skolemid |6|
 :pattern ( (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1))
))))
 :qid |stdinbpl.65:19|
 :skolemid |7|
 :pattern ( (IdenticalOnKnownLocations Heap@@28 ExhaleHeap@@5 Mask@@17) (IsWandField pm_f@@2))
)))
(assert (forall ((this@@28 T@U) ) (!  (=> (= (type this@@28) RefType) (= (getPredWandId (List this@@28)) 1))
 :qid |stdinbpl.2007:15|
 :skolemid |119|
 :pattern ( (List this@@28))
)))
(assert (forall ((t@@2 T@U) ) (! (= (|Seq#Length| (|Seq#Singleton| t@@2)) 1)
 :qid |stdinbpl.211:18|
 :skolemid |25|
 :pattern ( (|Seq#Singleton| t@@2))
)))
(assert (forall ((Mask@@18 T@U) (o_2@@2 T@U) (f_4@@2 T@U) ) (! (let ((B@@7 (FieldTypeInv1 (type f_4@@2))))
(let ((A@@8 (FieldTypeInv0 (type f_4@@2))))
 (=> (and (and (and (= (type Mask@@18) (MapType1Type RefType realType)) (= (type o_2@@2) RefType)) (= (type f_4@@2) (FieldType A@@8 B@@7))) (GoodMask Mask@@18)) (and (>= (U_2_real (MapType1Select Mask@@18 o_2@@2 f_4@@2)) NoPerm) (=> (and (and (GoodMask Mask@@18) (not (IsPredicateField f_4@@2))) (not (IsWandField f_4@@2))) (<= (U_2_real (MapType1Select Mask@@18 o_2@@2 f_4@@2)) FullPerm))))))
 :qid |stdinbpl.128:22|
 :skolemid |16|
 :pattern ( (GoodMask Mask@@18) (MapType1Select Mask@@18 o_2@@2 f_4@@2))
)))
(assert (forall ((arg0@@46 T@U) (arg1@@24 T@U) ) (! (= (type (|content#frame| arg0@@46 arg1@@24)) (SeqType intType))
 :qid |funType:content#frame|
 :pattern ( (|content#frame| arg0@@46 arg1@@24))
)))
(assert (forall ((Heap@@29 T@U) (Mask@@19 T@U) (this@@29 T@U) ) (!  (=> (and (and (and (= (type Heap@@29) (MapType0Type RefType)) (= (type Mask@@19) (MapType1Type RefType realType))) (= (type this@@29) RefType)) (state Heap@@29 Mask@@19)) (= (|content'| Heap@@29 this@@29) (|content#frame| (MapType0Select Heap@@29 null (List this@@29)) this@@29)))
 :qid |stdinbpl.1199:15|
 :skolemid |86|
 :pattern ( (state Heap@@29 Mask@@19) (|content'| Heap@@29 this@@29))
 :pattern ( (state Heap@@29 Mask@@19) (|content#triggerStateless| this@@29) (|List#trigger| Heap@@29 (List this@@29)))
)))
(assert (forall ((Heap@@30 T@U) (Mask@@20 T@U) (this@@30 T@U) ) (!  (=> (and (and (and (= (type Heap@@30) (MapType0Type RefType)) (= (type Mask@@20) (MapType1Type RefType realType))) (= (type this@@30) RefType)) (state Heap@@30 Mask@@20)) (= (|length'| Heap@@30 this@@30) (|length#frame| (MapType0Select Heap@@30 null (List this@@30)) this@@30)))
 :qid |stdinbpl.1361:15|
 :skolemid |94|
 :pattern ( (state Heap@@30 Mask@@20) (|length'| Heap@@30 this@@30))
 :pattern ( (state Heap@@30 Mask@@20) (|length#triggerStateless| this@@30) (|List#trigger| Heap@@30 (List this@@30)))
)))
(assert (forall ((Heap@@31 T@U) (Mask@@21 T@U) (this@@31 T@U) ) (!  (=> (and (and (and (= (type Heap@@31) (MapType0Type RefType)) (= (type Mask@@21) (MapType1Type RefType realType))) (= (type this@@31) RefType)) (state Heap@@31 Mask@@21)) (= (|peek'| Heap@@31 this@@31) (|peek#frame| (MapType0Select Heap@@31 null (List this@@31)) this@@31)))
 :qid |stdinbpl.1513:15|
 :skolemid |100|
 :pattern ( (state Heap@@31 Mask@@21) (|peek'| Heap@@31 this@@31))
)))
(assert (forall ((o T@U) (f T@U) (Heap@@32 T@U) ) (!  (=> (and (and (and (= (type o) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap@@32) (MapType0Type RefType))) (U_2_bool (MapType0Select Heap@@32 o $allocated))) (U_2_bool (MapType0Select Heap@@32 (MapType0Select Heap@@32 o f) $allocated)))
 :qid |stdinbpl.31:15|
 :skolemid |0|
 :pattern ( (MapType0Select Heap@@32 o f))
)))
(assert (forall ((this@@32 T@U) (end@@15 T@U) ) (!  (=> (and (= (type this@@32) RefType) (= (type end@@15) RefType)) (= (PredicateMaskField (lseg this@@32 end@@15)) (|lseg#sm| this@@32 end@@15)))
 :qid |stdinbpl.1771:15|
 :skolemid |107|
 :pattern ( (PredicateMaskField (lseg this@@32 end@@15)))
)))
(assert (forall ((s@@10 T@U) (t@@3 T@U) (n@@8 Int) ) (! (let ((T@@24 (SeqTypeInv0 (type s@@10))))
 (=> (and (and (= (type s@@10) (SeqType T@@24)) (= (type t@@3) (SeqType T@@24))) (and (< 0 n@@8) (<= n@@8 (|Seq#Length| s@@10)))) (= (|Seq#Take| (|Seq#Append| s@@10 t@@3) n@@8) (|Seq#Take| s@@10 n@@8))))
 :qid |stdinbpl.353:18|
 :skolemid |41|
 :pattern ( (|Seq#Take| (|Seq#Append| s@@10 t@@3) n@@8))
)))
(assert (forall ((s@@11 T@U) (i@@4 Int) (v@@1 T@U) ) (! (let ((T@@25 (type v@@1)))
 (=> (= (type s@@11) (SeqType T@@25)) (=> (and (<= 0 i@@4) (< i@@4 (|Seq#Length| s@@11))) (= (|Seq#Length| (|Seq#Update| s@@11 i@@4 v@@1)) (|Seq#Length| s@@11)))))
 :qid |stdinbpl.252:18|
 :skolemid |34|
 :pattern ( (|Seq#Length| (|Seq#Update| s@@11 i@@4 v@@1)))
 :pattern ( (|Seq#Length| s@@11) (|Seq#Update| s@@11 i@@4 v@@1))
)))
(assert (forall ((this@@33 T@U) ) (!  (=> (= (type this@@33) RefType) (= (PredicateMaskField (List this@@33)) (|List#sm| this@@33)))
 :qid |stdinbpl.1999:15|
 :skolemid |117|
 :pattern ( (PredicateMaskField (List this@@33)))
)))
(assert (forall ((s@@12 T@U) (t@@4 T@U) (n@@9 Int) ) (! (let ((T@@26 (SeqTypeInv0 (type s@@12))))
 (=> (and (and (= (type s@@12) (SeqType T@@26)) (= (type t@@4) (SeqType T@@26))) (and (< 0 n@@9) (<= n@@9 (|Seq#Length| s@@12)))) (= (|Seq#Drop| (|Seq#Append| s@@12 t@@4) n@@9) (|Seq#Append| (|Seq#Drop| s@@12 n@@9) t@@4))))
 :qid |stdinbpl.366:18|
 :skolemid |43|
 :pattern ( (|Seq#Drop| (|Seq#Append| s@@12 t@@4) n@@9))
)))
(assert (forall ((s@@13 T@U) (n@@10 Int) (i@@5 Int) ) (! (let ((T@@27 (SeqTypeInv0 (type s@@13))))
 (=> (= (type s@@13) (SeqType T@@27)) (=> (and (and (< 0 n@@10) (<= n@@10 i@@5)) (< i@@5 (|Seq#Length| s@@13))) (and (= (|Seq#Add| (|Seq#Sub| i@@5 n@@10) n@@10) i@@5) (= (|Seq#Index| (|Seq#Drop| s@@13 n@@10) (|Seq#Sub| i@@5 n@@10)) (|Seq#Index| s@@13 i@@5))))))
 :qid |stdinbpl.303:18|
 :skolemid |40|
 :pattern ( (|Seq#Drop| s@@13 n@@10) (|Seq#Index| s@@13 i@@5))
)))
(assert (forall ((Heap@@33 T@U) (Mask@@22 T@U) (this@@34 T@U) ) (!  (=> (and (and (and (= (type Heap@@33) (MapType0Type RefType)) (= (type Mask@@22) (MapType1Type RefType realType))) (= (type this@@34) RefType)) (and (state Heap@@33 Mask@@22) (or (< AssumeFunctionsAbove 2) (|content#trigger| (MapType0Select Heap@@33 null (List this@@34)) this@@34)))) (forall ((i@@6 Int) (j@@6 Int) ) (!  (=> (and (<= 0 i@@6) (and (< i@@6 j@@6) (< j@@6 (|Seq#Length| (|content'| Heap@@33 this@@34))))) (<= (U_2_int (|Seq#Index| (|content'| Heap@@33 this@@34) i@@6)) (U_2_int (|Seq#Index| (|content'| Heap@@33 this@@34) j@@6))))
 :qid |stdinbpl.1207:112|
 :skolemid |87|
 :pattern ( (|Seq#Index| (|content'| Heap@@33 this@@34) i@@6) (|Seq#Index| (|content'| Heap@@33 this@@34) j@@6))
)))
 :qid |stdinbpl.1205:15|
 :skolemid |88|
 :pattern ( (state Heap@@33 Mask@@22) (|content'| Heap@@33 this@@34))
)))
(assert (forall ((s0@@3 T@U) (s1@@3 T@U) (n@@11 Int) ) (! (let ((T@@28 (SeqTypeInv0 (type s0@@3))))
 (=> (and (= (type s0@@3) (SeqType T@@28)) (= (type s1@@3) (SeqType T@@28))) (=> (and (and (and (not (= s0@@3 (|Seq#Empty| T@@28))) (not (= s1@@3 (|Seq#Empty| T@@28)))) (<= 0 n@@11)) (< n@@11 (|Seq#Length| s0@@3))) (= (|Seq#Index| (|Seq#Append| s0@@3 s1@@3) n@@11) (|Seq#Index| s0@@3 n@@11)))))
 :qid |stdinbpl.243:18|
 :skolemid |31|
 :pattern ( (|Seq#Index| (|Seq#Append| s0@@3 s1@@3) n@@11))
 :pattern ( (|Seq#Index| s0@@3 n@@11) (|Seq#Append| s0@@3 s1@@3))
)))
(assert (forall ((Heap@@34 T@U) (Mask@@23 T@U) (this@@35 T@U) (end@@16 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@34) (MapType0Type RefType)) (= (type Mask@@23) (MapType1Type RefType realType))) (= (type this@@35) RefType)) (= (type end@@16) RefType)) (and (state Heap@@34 Mask@@23) (or (< AssumeFunctionsAbove 4) (|contentNodes#trigger| (MapType0Select Heap@@34 null (lseg this@@35 end@@16)) this@@35 end@@16)))) (= this@@35 end@@16)) (|Seq#Equal| (|contentNodes'| Heap@@34 this@@35 end@@16) (|Seq#Empty| intType)))
 :qid |stdinbpl.594:15|
 :skolemid |62|
 :pattern ( (state Heap@@34 Mask@@23) (|contentNodes'| Heap@@34 this@@35 end@@16))
)))
(assert (forall ((Heap@@35 T@U) (o@@0 T@U) (f_3 T@U) (v@@2 T@U) ) (! (let ((B@@8 (type v@@2)))
(let ((A@@9 (FieldTypeInv0 (type f_3))))
 (=> (and (and (= (type Heap@@35) (MapType0Type RefType)) (= (type o@@0) RefType)) (= (type f_3) (FieldType A@@9 B@@8))) (succHeap Heap@@35 (MapType0Store Heap@@35 o@@0 f_3 v@@2)))))
 :qid |stdinbpl.78:22|
 :skolemid |9|
 :pattern ( (MapType0Store Heap@@35 o@@0 f_3 v@@2))
)))
(assert (forall ((s0@@4 T@U) (s1@@4 T@U) (m@@7 Int) ) (! (let ((T@@29 (SeqTypeInv0 (type s0@@4))))
 (=> (and (= (type s0@@4) (SeqType T@@29)) (= (type s1@@4) (SeqType T@@29))) (=> (and (and (and (not (= s0@@4 (|Seq#Empty| T@@29))) (not (= s1@@4 (|Seq#Empty| T@@29)))) (<= 0 m@@7)) (< m@@7 (|Seq#Length| s1@@4))) (and (= (|Seq#Sub| (|Seq#Add| m@@7 (|Seq#Length| s0@@4)) (|Seq#Length| s0@@4)) m@@7) (= (|Seq#Index| (|Seq#Append| s0@@4 s1@@4) (|Seq#Add| m@@7 (|Seq#Length| s0@@4))) (|Seq#Index| s1@@4 m@@7))))))
 :qid |stdinbpl.248:18|
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
(assert (forall ((s@@14 T@U) (x@@10 T@U) (i@@7 Int) ) (! (let ((T@@30 (type x@@10)))
 (=> (= (type s@@14) (SeqType T@@30)) (=> (and (and (<= 0 i@@7) (< i@@7 (|Seq#Length| s@@14))) (= (|Seq#Index| s@@14 i@@7) x@@10)) (|Seq#Contains| s@@14 x@@10))))
 :qid |stdinbpl.399:18|
 :skolemid |48|
 :pattern ( (|Seq#Contains| s@@14 x@@10) (|Seq#Index| s@@14 i@@7))
)))
(assert (forall ((s0@@5 T@U) (s1@@5 T@U) ) (! (let ((T@@31 (SeqTypeInv0 (type s0@@5))))
 (=> (and (= (type s0@@5) (SeqType T@@31)) (= (type s1@@5) (SeqType T@@31))) (or (or (and (= s0@@5 s1@@5) (|Seq#Equal| s0@@5 s1@@5)) (and (and (not (= s0@@5 s1@@5)) (not (|Seq#Equal| s0@@5 s1@@5))) (not (= (|Seq#Length| s0@@5) (|Seq#Length| s1@@5))))) (and (and (and (and (and (and (not (= s0@@5 s1@@5)) (not (|Seq#Equal| s0@@5 s1@@5))) (= (|Seq#Length| s0@@5) (|Seq#Length| s1@@5))) (= (|Seq#SkolemDiff| s0@@5 s1@@5) (|Seq#SkolemDiff| s1@@5 s0@@5))) (<= 0 (|Seq#SkolemDiff| s0@@5 s1@@5))) (< (|Seq#SkolemDiff| s0@@5 s1@@5) (|Seq#Length| s0@@5))) (not (= (|Seq#Index| s0@@5 (|Seq#SkolemDiff| s0@@5 s1@@5)) (|Seq#Index| s1@@5 (|Seq#SkolemDiff| s0@@5 s1@@5))))))))
 :qid |stdinbpl.503:18|
 :skolemid |52|
 :pattern ( (|Seq#Equal| s0@@5 s1@@5))
)))
(assert (forall ((p@@1 T@U) (v_1@@0 T@U) (q T@U) (w@@0 T@U) (r T@U) (u T@U) ) (! (let ((C@@3 (FieldTypeInv0 (type r))))
(let ((B@@10 (FieldTypeInv0 (type q))))
(let ((A@@11 (FieldTypeInv0 (type p@@1))))
 (=> (and (and (and (and (and (and (= (type p@@1) (FieldType A@@11 FrameTypeType)) (= (type v_1@@0) FrameTypeType)) (= (type q) (FieldType B@@10 FrameTypeType))) (= (type w@@0) FrameTypeType)) (= (type r) (FieldType C@@3 FrameTypeType))) (= (type u) FrameTypeType)) (and (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))) (InsidePredicate p@@1 v_1@@0 r u)))))
 :qid |stdinbpl.172:25|
 :skolemid |20|
 :pattern ( (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))
)))
(assert (forall ((Heap@@36 T@U) (Mask@@24 T@U) (this@@36 T@U) ) (!  (=> (and (and (and (= (type Heap@@36) (MapType0Type RefType)) (= (type Mask@@24) (MapType1Type RefType realType))) (= (type this@@36) RefType)) (and (state Heap@@36 Mask@@24) (< AssumeFunctionsAbove 1))) (= (length Heap@@36 this@@36) (lengthNodes Heap@@36 (MapType0Select Heap@@36 this@@36 head) null)))
 :qid |stdinbpl.1354:15|
 :skolemid |93|
 :pattern ( (state Heap@@36 Mask@@24) (length Heap@@36 this@@36))
 :pattern ( (state Heap@@36 Mask@@24) (|length#triggerStateless| this@@36) (|List#trigger| Heap@@36 (List this@@36)))
)))
(assert (forall ((Heap@@37 T@U) (Mask@@25 T@U) (this@@37 T@U) ) (!  (=> (and (and (and (= (type Heap@@37) (MapType0Type RefType)) (= (type Mask@@25) (MapType1Type RefType realType))) (= (type this@@37) RefType)) (and (state Heap@@37 Mask@@25) (< AssumeFunctionsAbove 2))) (= (content Heap@@37 this@@37) (contentNodes Heap@@37 (MapType0Select Heap@@37 this@@37 head) null)))
 :qid |stdinbpl.1192:15|
 :skolemid |85|
 :pattern ( (state Heap@@37 Mask@@25) (content Heap@@37 this@@37))
 :pattern ( (state Heap@@37 Mask@@25) (|content#triggerStateless| this@@37) (|List#trigger| Heap@@37 (List this@@37)))
)))
(assert (forall ((s@@15 T@U) ) (! (let ((T@@32 (SeqTypeInv0 (type s@@15))))
 (=> (and (= (type s@@15) (SeqType T@@32)) (= (|Seq#Length| s@@15) 0)) (= s@@15 (|Seq#Empty| T@@32))))
 :qid |stdinbpl.207:18|
 :skolemid |24|
 :pattern ( (|Seq#Length| s@@15))
)))
(assert (forall ((s@@16 T@U) (n@@12 Int) ) (! (let ((T@@33 (SeqTypeInv0 (type s@@16))))
 (=> (and (= (type s@@16) (SeqType T@@33)) (<= n@@12 0)) (= (|Seq#Take| s@@16 n@@12) (|Seq#Empty| T@@33))))
 :qid |stdinbpl.382:18|
 :skolemid |46|
 :pattern ( (|Seq#Take| s@@16 n@@12))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun Mask@3 () T@U)
(declare-fun ptr () T@U)
(declare-fun end@@17 () T@U)
(declare-fun this@@38 () T@U)
(declare-fun PostMask@2 () T@U)
(declare-fun PostMask@0 () T@U)
(declare-fun perm@4 () Real)
(declare-fun PostMask@1 () T@U)
(declare-fun PostHeap@0 () T@U)
(declare-fun Heap@@38 () T@U)
(declare-fun Mask@23 () T@U)
(declare-fun Mask@22 () T@U)
(declare-fun perm@3 () Real)
(declare-fun Mask@24 () T@U)
(declare-fun Mask@21 () T@U)
(declare-fun Heap@18 () T@U)
(declare-fun Heap@17 () T@U)
(declare-fun Mask@20 () T@U)
(declare-fun Heap@13 () T@U)
(declare-fun Heap@14 () T@U)
(declare-fun Heap@15 () T@U)
(declare-fun newPMask@4 () T@U)
(declare-fun Heap@16 () T@U)
(declare-fun Heap@10 () T@U)
(declare-fun Heap@11 () T@U)
(declare-fun Heap@12 () T@U)
(declare-fun freshVersion@0 () T@U)
(declare-fun Mask@19 () T@U)
(declare-fun FrameFragment (T@U) T@U)
(declare-fun CombineFrames (T@U T@U) T@U)
(declare-fun ExhaleHeap@0 () T@U)
(declare-fun Heap@7 () T@U)
(declare-fun Heap@8 () T@U)
(declare-fun newPMask@3 () T@U)
(declare-fun Heap@9 () T@U)
(declare-fun Mask@18 () T@U)
(declare-fun UnfoldingHeap@9 () T@U)
(declare-fun UnfoldingMask@9 () T@U)
(declare-fun UnfoldingHeap@8 () T@U)
(declare-fun UnfoldingMask@8 () T@U)
(declare-fun UnfoldingHeap@5 () T@U)
(declare-fun UnfoldingHeap@6 () T@U)
(declare-fun newPMask@2 () T@U)
(declare-fun UnfoldingHeap@7 () T@U)
(declare-fun UnfoldingMask@6 () T@U)
(declare-fun UnfoldingMask@5 () T@U)
(declare-fun UnfoldingMask@7 () T@U)
(declare-fun Mask@15 () T@U)
(declare-fun Mask@17 () T@U)
(declare-fun Mask@16 () T@U)
(declare-fun Mask@13 () T@U)
(declare-fun perm@2 () Real)
(declare-fun Mask@14 () T@U)
(declare-fun Heap@6 () T@U)
(declare-fun Mask@12 () T@U)
(declare-fun arg_this@0 () T@U)
(declare-fun Mask@11 () T@U)
(declare-fun Mask@10 () T@U)
(declare-fun perm@1 () Real)
(declare-fun Mask@9 () T@U)
(declare-fun Mask@8 () T@U)
(declare-fun Heap@5 () T@U)
(declare-fun Mask@7 () T@U)
(declare-fun Heap@1 () T@U)
(declare-fun Heap@2 () T@U)
(declare-fun Heap@3 () T@U)
(declare-fun newPMask@1 () T@U)
(declare-fun Heap@4 () T@U)
(declare-fun UnfoldingHeap@4 () T@U)
(declare-fun UnfoldingMask@4 () T@U)
(declare-fun UnfoldingHeap@3 () T@U)
(declare-fun UnfoldingMask@3 () T@U)
(declare-fun UnfoldingHeap@0 () T@U)
(declare-fun UnfoldingHeap@1 () T@U)
(declare-fun newPMask@0 () T@U)
(declare-fun UnfoldingHeap@2 () T@U)
(declare-fun UnfoldingMask@1 () T@U)
(declare-fun UnfoldingMask@0 () T@U)
(declare-fun UnfoldingMask@2 () T@U)
(declare-fun Mask@5 () T@U)
(declare-fun Mask@4 () T@U)
(declare-fun Mask@6 () T@U)
(declare-fun Heap@0 () T@U)
(declare-fun newVersion@0 () T@U)
(declare-fun Mask@1 () T@U)
(declare-fun perm@0 () Real)
(declare-fun Mask@2 () T@U)
(declare-fun Mask@0 () T@U)
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (= (type Mask@3) (MapType1Type RefType realType)) (= (type this@@38) RefType)) (= (type ptr) RefType)) (= (type end@@17) RefType)) (= (type Mask@24) (MapType1Type RefType realType))) (= (type Mask@22) (MapType1Type RefType realType))) (= (type Mask@23) (MapType1Type RefType realType))) (= (type Mask@21) (MapType1Type RefType realType))) (= (type Heap@18) (MapType0Type RefType))) (= (type Heap@@38) (MapType0Type RefType))) (= (type Heap@17) (MapType0Type RefType))) (= (type Mask@20) (MapType1Type RefType realType))) (= (type Heap@14) (MapType0Type RefType))) (= (type Heap@13) (MapType0Type RefType))) (= (type Heap@15) (MapType0Type RefType))) (= (type newPMask@4) (MapType1Type RefType boolType))) (= (type Heap@16) (MapType0Type RefType))) (= (type Heap@11) (MapType0Type RefType))) (= (type Heap@10) (MapType0Type RefType))) (= (type Heap@12) (MapType0Type RefType))) (= (type freshVersion@0) FrameTypeType)) (= (type Mask@19) (MapType1Type RefType realType))) (forall ((arg0@@47 T@U) ) (! (= (type (FrameFragment arg0@@47)) FrameTypeType)
 :qid |funType:FrameFragment|
 :pattern ( (FrameFragment arg0@@47))
))) (forall ((arg0@@48 T@U) (arg1@@25 T@U) ) (! (= (type (CombineFrames arg0@@48 arg1@@25)) FrameTypeType)
 :qid |funType:CombineFrames|
 :pattern ( (CombineFrames arg0@@48 arg1@@25))
))) (= (type ExhaleHeap@0) (MapType0Type RefType))) (= (type Heap@7) (MapType0Type RefType))) (= (type Heap@8) (MapType0Type RefType))) (= (type newPMask@3) (MapType1Type RefType boolType))) (= (type Heap@9) (MapType0Type RefType))) (= (type Mask@15) (MapType1Type RefType realType))) (= (type Mask@18) (MapType1Type RefType realType))) (= (type UnfoldingHeap@9) (MapType0Type RefType))) (= (type UnfoldingMask@9) (MapType1Type RefType realType))) (= (type UnfoldingMask@5) (MapType1Type RefType realType))) (= (type UnfoldingHeap@8) (MapType0Type RefType))) (= (type UnfoldingMask@8) (MapType1Type RefType realType))) (= (type UnfoldingHeap@5) (MapType0Type RefType))) (= (type UnfoldingHeap@6) (MapType0Type RefType))) (= (type newPMask@2) (MapType1Type RefType boolType))) (= (type UnfoldingHeap@7) (MapType0Type RefType))) (= (type UnfoldingMask@6) (MapType1Type RefType realType))) (= (type UnfoldingMask@7) (MapType1Type RefType realType))) (= (type Mask@17) (MapType1Type RefType realType))) (= (type Mask@16) (MapType1Type RefType realType))) (= (type Mask@14) (MapType1Type RefType realType))) (= (type Mask@13) (MapType1Type RefType realType))) (= (type Heap@6) (MapType0Type RefType))) (= (type Mask@12) (MapType1Type RefType realType))) (= (type arg_this@0) RefType)) (= (type Mask@10) (MapType1Type RefType realType))) (= (type Mask@11) (MapType1Type RefType realType))) (= (type Mask@9) (MapType1Type RefType realType))) (= (type Mask@8) (MapType1Type RefType realType))) (= (type Mask@4) (MapType1Type RefType realType))) (= (type Heap@1) (MapType0Type RefType))) (= (type Heap@5) (MapType0Type RefType))) (= (type Mask@7) (MapType1Type RefType realType))) (= (type Heap@2) (MapType0Type RefType))) (= (type Heap@3) (MapType0Type RefType))) (= (type newPMask@1) (MapType1Type RefType boolType))) (= (type Heap@4) (MapType0Type RefType))) (= (type UnfoldingHeap@4) (MapType0Type RefType))) (= (type UnfoldingMask@4) (MapType1Type RefType realType))) (= (type UnfoldingMask@0) (MapType1Type RefType realType))) (= (type UnfoldingHeap@3) (MapType0Type RefType))) (= (type UnfoldingMask@3) (MapType1Type RefType realType))) (= (type UnfoldingHeap@0) (MapType0Type RefType))) (= (type UnfoldingHeap@1) (MapType0Type RefType))) (= (type newPMask@0) (MapType1Type RefType boolType))) (= (type UnfoldingHeap@2) (MapType0Type RefType))) (= (type UnfoldingMask@1) (MapType1Type RefType realType))) (= (type UnfoldingMask@2) (MapType1Type RefType realType))) (= (type Mask@5) (MapType1Type RefType realType))) (= (type Mask@6) (MapType1Type RefType realType))) (= (type Heap@0) (MapType0Type RefType))) (= (type newVersion@0) FrameTypeType)) (= (type PostMask@0) (MapType1Type RefType realType))) (= (type PostMask@1) (MapType1Type RefType realType))) (= (type PostHeap@0) (MapType0Type RefType))) (= (type PostMask@2) (MapType1Type RefType realType))) (= (type Mask@2) (MapType1Type RefType realType))) (= (type Mask@1) (MapType1Type RefType realType))) (= (type Mask@0) (MapType1Type RefType realType))))
(set-info :boogie-vc-id vconcat)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 147) (let ((anon10_correct true))
(let ((anon100_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 140) 137)) anon10_correct)))
(let ((anon100_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 138) (- 0 139)) (<= FullPerm (U_2_real (MapType1Select Mask@3 null (lseg ptr end@@17))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@3 null (lseg ptr end@@17)))) (=> (= (ControlFlow 0 138) 137) anon10_correct))))))
(let ((anon23_correct true))
(let ((anon107_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 131) 128)) anon23_correct)))
(let ((anon107_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 129) (- 0 130)) (<= FullPerm (U_2_real (MapType1Select Mask@3 null (lseg ptr end@@17))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@3 null (lseg ptr end@@17)))) (=> (= (ControlFlow 0 129) 128) anon23_correct))))))
(let ((anon19_correct true))
(let ((anon105_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 125) 122)) anon19_correct)))
(let ((anon105_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 123) (- 0 124)) (<= FullPerm (U_2_real (MapType1Select Mask@3 null (lseg this@@38 ptr))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@3 null (lseg this@@38 ptr)))) (=> (= (ControlFlow 0 123) 122) anon19_correct))))))
(let ((anon15_correct true))
(let ((anon103_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 121) 118)) anon15_correct)))
(let ((anon103_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 119) (- 0 120)) (<= FullPerm (U_2_real (MapType1Select Mask@3 null (lseg this@@38 ptr))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@3 null (lseg this@@38 ptr)))) (=> (= (ControlFlow 0 119) 118) anon15_correct))))))
(let ((anon40_correct true))
(let ((anon115_Else_correct  (=> (= end@@17 null) (=> (and (= PostMask@2 PostMask@0) (= (ControlFlow 0 113) 110)) anon40_correct))))
(let ((anon115_Then_correct  (=> (and (not (= end@@17 null)) (= perm@4 (/ (to_real 1) (to_real 2)))) (and (=> (= (ControlFlow 0 111) (- 0 112)) (>= perm@4 NoPerm)) (=> (>= perm@4 NoPerm) (=> (=> (> perm@4 NoPerm) (not (= end@@17 null))) (=> (and (and (= PostMask@1 (MapType1Store PostMask@0 end@@17 next (real_2_U (+ (U_2_real (MapType1Select PostMask@0 end@@17 next)) perm@4)))) (state PostHeap@0 PostMask@1)) (and (= PostMask@2 PostMask@1) (= (ControlFlow 0 111) 110))) anon40_correct)))))))
(let ((anon113_Else_correct  (=> (and (|Seq#Equal| (contentNodes PostHeap@0 this@@38 end@@17) (|Seq#Append| (contentNodes Heap@@38 this@@38 ptr) (contentNodes Heap@@38 ptr end@@17))) (state PostHeap@0 PostMask@0)) (and (=> (= (ControlFlow 0 114) 111) anon115_Then_correct) (=> (= (ControlFlow 0 114) 113) anon115_Else_correct)))))
(let ((anon37_correct true))
(let ((anon114_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 109) 106)) anon37_correct)))
(let ((anon114_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 107) (- 0 108)) (<= FullPerm (U_2_real (MapType1Select Mask@3 null (lseg ptr end@@17))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@3 null (lseg ptr end@@17)))) (=> (= (ControlFlow 0 107) 106) anon37_correct))))))
(let ((anon33_correct true))
(let ((anon112_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 105) 102)) anon33_correct)))
(let ((anon112_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 103) (- 0 104)) (<= FullPerm (U_2_real (MapType1Select Mask@3 null (lseg this@@38 ptr))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@3 null (lseg this@@38 ptr)))) (=> (= (ControlFlow 0 103) 102) anon33_correct))))))
(let ((anon29_correct true))
(let ((anon110_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 101) 98)) anon29_correct)))
(let ((anon110_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 99) (- 0 100)) (<= FullPerm (U_2_real (MapType1Select PostMask@0 null (lseg this@@38 end@@17))))) (=> (<= FullPerm (U_2_real (MapType1Select PostMask@0 null (lseg this@@38 end@@17)))) (=> (= (ControlFlow 0 99) 98) anon29_correct))))))
(let ((anon108_Then_correct  (=> (state PostHeap@0 ZeroMask) (=> (and (and (= PostMask@0 (MapType1Store ZeroMask null (lseg this@@38 end@@17) (real_2_U (+ (U_2_real (MapType1Select ZeroMask null (lseg this@@38 end@@17))) FullPerm)))) (state PostHeap@0 PostMask@0)) (and (state PostHeap@0 PostMask@0) (state PostHeap@0 PostMask@0))) (and (and (and (and (and (and (=> (= (ControlFlow 0 115) 114) anon113_Else_correct) (=> (= (ControlFlow 0 115) 107) anon114_Then_correct)) (=> (= (ControlFlow 0 115) 109) anon114_Else_correct)) (=> (= (ControlFlow 0 115) 103) anon112_Then_correct)) (=> (= (ControlFlow 0 115) 105) anon112_Else_correct)) (=> (= (ControlFlow 0 115) 99) anon110_Then_correct)) (=> (= (ControlFlow 0 115) 101) anon110_Else_correct))))))
(let ((anon94_correct true))
(let ((anon93_correct  (=> (= Mask@23 (MapType1Store Mask@22 end@@17 next (real_2_U (- (U_2_real (MapType1Select Mask@22 end@@17 next)) perm@3)))) (=> (and (= Mask@24 Mask@23) (= (ControlFlow 0 7) 5)) anon94_correct))))
(let ((anon142_Else_correct  (=> (and (= perm@3 NoPerm) (= (ControlFlow 0 10) 7)) anon93_correct)))
(let ((anon142_Then_correct  (=> (not (= perm@3 NoPerm)) (and (=> (= (ControlFlow 0 8) (- 0 9)) (<= perm@3 (U_2_real (MapType1Select Mask@22 end@@17 next)))) (=> (<= perm@3 (U_2_real (MapType1Select Mask@22 end@@17 next))) (=> (= (ControlFlow 0 8) 7) anon93_correct))))))
(let ((anon141_Then_correct  (=> (and (not (= end@@17 null)) (= perm@3 (/ (to_real 1) (to_real 2)))) (and (=> (= (ControlFlow 0 11) (- 0 12)) (>= perm@3 NoPerm)) (=> (>= perm@3 NoPerm) (and (=> (= (ControlFlow 0 11) 8) anon142_Then_correct) (=> (= (ControlFlow 0 11) 10) anon142_Else_correct)))))))
(let ((anon141_Else_correct  (=> (= end@@17 null) (=> (and (= Mask@24 Mask@22) (= (ControlFlow 0 6) 5)) anon94_correct))))
(let ((anon90_correct  (=> (= Mask@22 (MapType1Store Mask@21 null (lseg this@@38 end@@17) (real_2_U (- (U_2_real (MapType1Select Mask@21 null (lseg this@@38 end@@17))) FullPerm)))) (and (=> (= (ControlFlow 0 13) (- 0 14)) (|Seq#Equal| (contentNodes Heap@18 this@@38 end@@17) (|Seq#Append| (contentNodes Heap@@38 this@@38 ptr) (contentNodes Heap@@38 ptr end@@17)))) (=> (|Seq#Equal| (contentNodes Heap@18 this@@38 end@@17) (|Seq#Append| (contentNodes Heap@@38 this@@38 ptr) (contentNodes Heap@@38 ptr end@@17))) (and (=> (= (ControlFlow 0 13) 11) anon141_Then_correct) (=> (= (ControlFlow 0 13) 6) anon141_Else_correct)))))))
(let ((anon140_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 17) 13)) anon90_correct)))
(let ((anon140_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 15) (- 0 16)) (<= FullPerm (U_2_real (MapType1Select Mask@21 null (lseg this@@38 end@@17))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@21 null (lseg this@@38 end@@17)))) (=> (= (ControlFlow 0 15) 13) anon90_correct))))))
(let ((anon88_correct  (=> (state Heap@18 Mask@21) (and (=> (= (ControlFlow 0 18) 15) anon140_Then_correct) (=> (= (ControlFlow 0 18) 17) anon140_Else_correct)))))
(let ((anon87_correct  (=> (state Heap@17 Mask@20) (=> (and (and (state Heap@17 Mask@20) (= Heap@18 Heap@17)) (and (= Mask@21 Mask@20) (= (ControlFlow 0 20) 18))) anon88_correct))))
(let ((anon139_Else_correct  (=> (= this@@38 end@@17) (=> (and (= Heap@17 Heap@13) (= (ControlFlow 0 22) 20)) anon87_correct))))
(let ((anon139_Then_correct  (=> (not (= this@@38 end@@17)) (=> (and (= Heap@14 (MapType0Store Heap@13 null (|lseg#sm| this@@38 end@@17) (MapType1Store (MapType0Select Heap@13 null (|lseg#sm| this@@38 end@@17)) this@@38 data (bool_2_U true)))) (= Heap@15 (MapType0Store Heap@14 null (|lseg#sm| this@@38 end@@17) (MapType1Store (MapType0Select Heap@14 null (|lseg#sm| this@@38 end@@17)) this@@38 next (bool_2_U true))))) (=> (and (and (forall ((o_33 T@U) (f_37 T@U) ) (! (let ((B@@11 (FieldTypeInv1 (type f_37))))
(let ((A@@12 (FieldTypeInv0 (type f_37))))
 (=> (and (and (= (type o_33) RefType) (= (type f_37) (FieldType A@@12 B@@11))) (or (U_2_bool (MapType1Select (MapType0Select Heap@15 null (|lseg#sm| this@@38 end@@17)) o_33 f_37)) (U_2_bool (MapType1Select (MapType0Select Heap@15 null (|lseg#sm| (MapType0Select Heap@15 this@@38 next) end@@17)) o_33 f_37)))) (U_2_bool (MapType1Select newPMask@4 o_33 f_37)))))
 :qid |stdinbpl.2800:33|
 :skolemid |131|
 :pattern ( (MapType1Select newPMask@4 o_33 f_37))
)) (= Heap@16 (MapType0Store Heap@15 null (|lseg#sm| this@@38 end@@17) newPMask@4))) (and (= Heap@17 Heap@16) (= (ControlFlow 0 21) 20))) anon87_correct)))))
(let ((anon138_Else_correct  (=> (and (HasDirectPerm Mask@20 null (lseg this@@38 end@@17)) (= Heap@13 Heap@10)) (and (=> (= (ControlFlow 0 24) 21) anon139_Then_correct) (=> (= (ControlFlow 0 24) 22) anon139_Else_correct)))))
(let ((anon138_Then_correct  (=> (and (and (not (HasDirectPerm Mask@20 null (lseg this@@38 end@@17))) (= Heap@11 (MapType0Store Heap@10 null (|lseg#sm| this@@38 end@@17) ZeroPMask))) (and (= Heap@12 (MapType0Store Heap@11 null (lseg this@@38 end@@17) freshVersion@0)) (= Heap@13 Heap@12))) (and (=> (= (ControlFlow 0 23) 21) anon139_Then_correct) (=> (= (ControlFlow 0 23) 22) anon139_Else_correct)))))
(let ((anon83_correct  (=> (and (state Heap@10 Mask@19) (= Mask@20 (MapType1Store Mask@19 null (lseg this@@38 end@@17) (real_2_U (+ (U_2_real (MapType1Select Mask@19 null (lseg this@@38 end@@17))) FullPerm))))) (=> (and (and (state Heap@10 Mask@20) (state Heap@10 Mask@20)) (and (|lseg#trigger| Heap@10 (lseg this@@38 end@@17)) (= (MapType0Select Heap@10 null (lseg this@@38 end@@17)) (FrameFragment (ite (not (= this@@38 end@@17)) (CombineFrames (FrameFragment (MapType0Select Heap@10 this@@38 data)) (CombineFrames (FrameFragment (MapType0Select Heap@10 this@@38 next)) (MapType0Select Heap@10 null (lseg (MapType0Select Heap@10 this@@38 next) end@@17)))) EmptyFrame))))) (and (=> (= (ControlFlow 0 25) 23) anon138_Then_correct) (=> (= (ControlFlow 0 25) 24) anon138_Else_correct))))))
(let ((anon137_Else_correct  (=> (= (MapType0Select ExhaleHeap@0 this@@38 next) end@@17) (=> (and (= Heap@10 ExhaleHeap@0) (= (ControlFlow 0 27) 25)) anon83_correct))))
(let ((anon137_Then_correct  (=> (not (= (MapType0Select ExhaleHeap@0 this@@38 next) end@@17)) (=> (and (= Heap@7 (MapType0Store ExhaleHeap@0 null (|lseg#sm| (MapType0Select ExhaleHeap@0 this@@38 next) end@@17) (MapType1Store (MapType0Select ExhaleHeap@0 null (|lseg#sm| (MapType0Select ExhaleHeap@0 this@@38 next) end@@17)) (MapType0Select ExhaleHeap@0 this@@38 next) data (bool_2_U true)))) (= Heap@8 (MapType0Store Heap@7 null (|lseg#sm| (MapType0Select Heap@7 this@@38 next) end@@17) (MapType1Store (MapType0Select Heap@7 null (|lseg#sm| (MapType0Select Heap@7 this@@38 next) end@@17)) (MapType0Select Heap@7 this@@38 next) next (bool_2_U true))))) (=> (and (and (forall ((o_32 T@U) (f_36 T@U) ) (! (let ((B@@12 (FieldTypeInv1 (type f_36))))
(let ((A@@13 (FieldTypeInv0 (type f_36))))
 (=> (and (and (= (type o_32) RefType) (= (type f_36) (FieldType A@@13 B@@12))) (or (U_2_bool (MapType1Select (MapType0Select Heap@8 null (|lseg#sm| (MapType0Select Heap@8 this@@38 next) end@@17)) o_32 f_36)) (U_2_bool (MapType1Select (MapType0Select Heap@8 null (|lseg#sm| (MapType0Select Heap@8 (MapType0Select Heap@8 this@@38 next) next) end@@17)) o_32 f_36)))) (U_2_bool (MapType1Select newPMask@3 o_32 f_36)))))
 :qid |stdinbpl.2778:35|
 :skolemid |130|
 :pattern ( (MapType1Select newPMask@3 o_32 f_36))
)) (= Heap@9 (MapType0Store Heap@8 null (|lseg#sm| (MapType0Select Heap@8 this@@38 next) end@@17) newPMask@3))) (and (= Heap@10 Heap@9) (= (ControlFlow 0 26) 25))) anon83_correct)))))
(let ((anon136_Else_correct  (=> (and (= (MapType0Select ExhaleHeap@0 this@@38 next) end@@17) (= Mask@19 Mask@18)) (and (=> (= (ControlFlow 0 31) 26) anon137_Then_correct) (=> (= (ControlFlow 0 31) 27) anon137_Else_correct)))))
(let ((anon136_Then_correct  (=> (not (= (MapType0Select ExhaleHeap@0 this@@38 next) end@@17)) (and (=> (= (ControlFlow 0 29) (- 0 30)) (<= (U_2_int (MapType0Select ExhaleHeap@0 this@@38 data)) (U_2_int (MapType0Select ExhaleHeap@0 (MapType0Select ExhaleHeap@0 this@@38 next) data)))) (=> (<= (U_2_int (MapType0Select ExhaleHeap@0 this@@38 data)) (U_2_int (MapType0Select ExhaleHeap@0 (MapType0Select ExhaleHeap@0 this@@38 next) data))) (=> (= Mask@19 Mask@18) (and (=> (= (ControlFlow 0 29) 26) anon137_Then_correct) (=> (= (ControlFlow 0 29) 27) anon137_Else_correct))))))))
(let ((anon79_correct  (=> (state UnfoldingHeap@9 UnfoldingMask@9) (and (=> (= (ControlFlow 0 32) 29) anon136_Then_correct) (=> (= (ControlFlow 0 32) 31) anon136_Else_correct)))))
(let ((anon78_correct  (=> (and (and (state UnfoldingHeap@8 UnfoldingMask@8) (= UnfoldingHeap@9 UnfoldingHeap@8)) (and (= UnfoldingMask@9 UnfoldingMask@8) (= (ControlFlow 0 34) 32))) anon79_correct)))
(let ((anon135_Else_correct  (=> (= (MapType0Select ExhaleHeap@0 (MapType0Select ExhaleHeap@0 this@@38 next) next) end@@17) (=> (and (= UnfoldingHeap@8 ExhaleHeap@0) (= (ControlFlow 0 36) 34)) anon78_correct))))
(let ((anon135_Then_correct  (=> (not (= (MapType0Select ExhaleHeap@0 (MapType0Select ExhaleHeap@0 this@@38 next) next) end@@17)) (=> (and (= UnfoldingHeap@5 (MapType0Store ExhaleHeap@0 null (|lseg#sm| (MapType0Select ExhaleHeap@0 (MapType0Select ExhaleHeap@0 this@@38 next) next) end@@17) (MapType1Store (MapType0Select ExhaleHeap@0 null (|lseg#sm| (MapType0Select ExhaleHeap@0 (MapType0Select ExhaleHeap@0 this@@38 next) next) end@@17)) (MapType0Select ExhaleHeap@0 (MapType0Select ExhaleHeap@0 this@@38 next) next) data (bool_2_U true)))) (= UnfoldingHeap@6 (MapType0Store UnfoldingHeap@5 null (|lseg#sm| (MapType0Select UnfoldingHeap@5 (MapType0Select UnfoldingHeap@5 this@@38 next) next) end@@17) (MapType1Store (MapType0Select UnfoldingHeap@5 null (|lseg#sm| (MapType0Select UnfoldingHeap@5 (MapType0Select UnfoldingHeap@5 this@@38 next) next) end@@17)) (MapType0Select UnfoldingHeap@5 (MapType0Select UnfoldingHeap@5 this@@38 next) next) next (bool_2_U true))))) (=> (and (and (forall ((o_31 T@U) (f_35 T@U) ) (! (let ((B@@13 (FieldTypeInv1 (type f_35))))
(let ((A@@14 (FieldTypeInv0 (type f_35))))
 (=> (and (and (= (type o_31) RefType) (= (type f_35) (FieldType A@@14 B@@13))) (or (U_2_bool (MapType1Select (MapType0Select UnfoldingHeap@6 null (|lseg#sm| (MapType0Select UnfoldingHeap@6 (MapType0Select UnfoldingHeap@6 this@@38 next) next) end@@17)) o_31 f_35)) (U_2_bool (MapType1Select (MapType0Select UnfoldingHeap@6 null (|lseg#sm| (MapType0Select UnfoldingHeap@6 (MapType0Select UnfoldingHeap@6 (MapType0Select UnfoldingHeap@6 this@@38 next) next) next) end@@17)) o_31 f_35)))) (U_2_bool (MapType1Select newPMask@2 o_31 f_35)))))
 :qid |stdinbpl.2758:41|
 :skolemid |129|
 :pattern ( (MapType1Select newPMask@2 o_31 f_35))
)) (= UnfoldingHeap@7 (MapType0Store UnfoldingHeap@6 null (|lseg#sm| (MapType0Select UnfoldingHeap@6 (MapType0Select UnfoldingHeap@6 this@@38 next) next) end@@17) newPMask@2))) (and (= UnfoldingHeap@8 UnfoldingHeap@7) (= (ControlFlow 0 35) 34))) anon78_correct)))))
(let ((anon134_Then_correct  (=> (not (= (MapType0Select ExhaleHeap@0 this@@38 next) end@@17)) (=> (and (not (= (MapType0Select ExhaleHeap@0 this@@38 next) null)) (= UnfoldingMask@6 (MapType1Store UnfoldingMask@5 (MapType0Select ExhaleHeap@0 this@@38 next) data (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@5 (MapType0Select ExhaleHeap@0 this@@38 next) data)) FullPerm))))) (=> (and (and (and (state ExhaleHeap@0 UnfoldingMask@6) (not (= (MapType0Select ExhaleHeap@0 this@@38 next) null))) (and (= UnfoldingMask@7 (MapType1Store UnfoldingMask@6 (MapType0Select ExhaleHeap@0 this@@38 next) next (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@6 (MapType0Select ExhaleHeap@0 this@@38 next) next)) FullPerm)))) (state ExhaleHeap@0 UnfoldingMask@7))) (and (and (= UnfoldingMask@8 (MapType1Store UnfoldingMask@7 null (lseg (MapType0Select ExhaleHeap@0 (MapType0Select ExhaleHeap@0 this@@38 next) next) end@@17) (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@7 null (lseg (MapType0Select ExhaleHeap@0 (MapType0Select ExhaleHeap@0 this@@38 next) next) end@@17))) FullPerm)))) (InsidePredicate (lseg (MapType0Select ExhaleHeap@0 this@@38 next) end@@17) (MapType0Select ExhaleHeap@0 null (lseg (MapType0Select ExhaleHeap@0 this@@38 next) end@@17)) (lseg (MapType0Select ExhaleHeap@0 (MapType0Select ExhaleHeap@0 this@@38 next) next) end@@17) (MapType0Select ExhaleHeap@0 null (lseg (MapType0Select ExhaleHeap@0 (MapType0Select ExhaleHeap@0 this@@38 next) next) end@@17)))) (and (state ExhaleHeap@0 UnfoldingMask@8) (=> (not (= (MapType0Select ExhaleHeap@0 (MapType0Select ExhaleHeap@0 this@@38 next) next) end@@17)) (<= (U_2_int (MapType0Select ExhaleHeap@0 (MapType0Select ExhaleHeap@0 this@@38 next) data)) (U_2_int (MapType0Select ExhaleHeap@0 (MapType0Select ExhaleHeap@0 (MapType0Select ExhaleHeap@0 this@@38 next) next) data))))))) (and (=> (= (ControlFlow 0 37) 35) anon135_Then_correct) (=> (= (ControlFlow 0 37) 36) anon135_Else_correct)))))))
(let ((anon134_Else_correct  (=> (and (and (= (MapType0Select ExhaleHeap@0 this@@38 next) end@@17) (= UnfoldingHeap@9 ExhaleHeap@0)) (and (= UnfoldingMask@9 UnfoldingMask@5) (= (ControlFlow 0 33) 32))) anon79_correct)))
(let ((anon75_correct  (=> (= UnfoldingMask@5 (MapType1Store Mask@15 null (lseg (MapType0Select ExhaleHeap@0 this@@38 next) end@@17) (real_2_U (- (U_2_real (MapType1Select Mask@15 null (lseg (MapType0Select ExhaleHeap@0 this@@38 next) end@@17))) FullPerm)))) (and (=> (= (ControlFlow 0 38) 37) anon134_Then_correct) (=> (= (ControlFlow 0 38) 33) anon134_Else_correct)))))
(let ((anon133_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 41) 38)) anon75_correct)))
(let ((anon133_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 39) (- 0 40)) (<= FullPerm (U_2_real (MapType1Select Mask@15 null (lseg (MapType0Select ExhaleHeap@0 this@@38 next) end@@17))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@15 null (lseg (MapType0Select ExhaleHeap@0 this@@38 next) end@@17)))) (=> (= (ControlFlow 0 39) 38) anon75_correct))))))
(let ((anon73_correct  (=> (and (and (= Mask@18 (MapType1Store Mask@17 null (lseg (MapType0Select ExhaleHeap@0 this@@38 next) end@@17) (real_2_U (- (U_2_real (MapType1Select Mask@17 null (lseg (MapType0Select ExhaleHeap@0 this@@38 next) end@@17))) FullPerm)))) (InsidePredicate (lseg this@@38 end@@17) (MapType0Select ExhaleHeap@0 null (lseg this@@38 end@@17)) (lseg (MapType0Select ExhaleHeap@0 this@@38 next) end@@17) (MapType0Select ExhaleHeap@0 null (lseg (MapType0Select ExhaleHeap@0 this@@38 next) end@@17)))) (and (|lseg#trigger| ExhaleHeap@0 (lseg (MapType0Select ExhaleHeap@0 this@@38 next) end@@17)) (= (MapType0Select ExhaleHeap@0 null (lseg (MapType0Select ExhaleHeap@0 this@@38 next) end@@17)) (FrameFragment (ite (not (= (MapType0Select ExhaleHeap@0 this@@38 next) end@@17)) (CombineFrames (FrameFragment (MapType0Select ExhaleHeap@0 (MapType0Select ExhaleHeap@0 this@@38 next) data)) (CombineFrames (FrameFragment (MapType0Select ExhaleHeap@0 (MapType0Select ExhaleHeap@0 this@@38 next) next)) (MapType0Select ExhaleHeap@0 null (lseg (MapType0Select ExhaleHeap@0 (MapType0Select ExhaleHeap@0 this@@38 next) next) end@@17)))) EmptyFrame))))) (and (=> (= (ControlFlow 0 42) 39) anon133_Then_correct) (=> (= (ControlFlow 0 42) 41) anon133_Else_correct)))))
(let ((anon132_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 45) 42)) anon73_correct)))
(let ((anon132_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 43) (- 0 44)) (<= FullPerm (U_2_real (MapType1Select Mask@17 null (lseg (MapType0Select ExhaleHeap@0 this@@38 next) end@@17))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@17 null (lseg (MapType0Select ExhaleHeap@0 this@@38 next) end@@17)))) (=> (= (ControlFlow 0 43) 42) anon73_correct))))))
(let ((anon71_correct  (=> (= Mask@17 (MapType1Store Mask@16 this@@38 next (real_2_U (- (U_2_real (MapType1Select Mask@16 this@@38 next)) FullPerm)))) (and (=> (= (ControlFlow 0 46) 43) anon132_Then_correct) (=> (= (ControlFlow 0 46) 45) anon132_Else_correct)))))
(let ((anon131_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 49) 46)) anon71_correct)))
(let ((anon131_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 47) (- 0 48)) (<= FullPerm (U_2_real (MapType1Select Mask@16 this@@38 next)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@16 this@@38 next))) (=> (= (ControlFlow 0 47) 46) anon71_correct))))))
(let ((anon69_correct  (=> (= Mask@16 (MapType1Store Mask@15 this@@38 data (real_2_U (- (U_2_real (MapType1Select Mask@15 this@@38 data)) FullPerm)))) (and (=> (= (ControlFlow 0 50) 47) anon131_Then_correct) (=> (= (ControlFlow 0 50) 49) anon131_Else_correct)))))
(let ((anon130_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 53) 50)) anon69_correct)))
(let ((anon130_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 51) (- 0 52)) (<= FullPerm (U_2_real (MapType1Select Mask@15 this@@38 data)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@15 this@@38 data))) (=> (= (ControlFlow 0 51) 50) anon69_correct))))))
(let ((anon129_Then_correct  (=> (not (= this@@38 end@@17)) (and (=> (= (ControlFlow 0 54) 51) anon130_Then_correct) (=> (= (ControlFlow 0 54) 53) anon130_Else_correct)))))
(let ((anon129_Else_correct  (=> (and (= this@@38 end@@17) (= Mask@19 Mask@15)) (and (=> (= (ControlFlow 0 28) 26) anon137_Then_correct) (=> (= (ControlFlow 0 28) 27) anon137_Else_correct)))))
(let ((anon66_correct  (=> (and (state ExhaleHeap@0 Mask@15) (state ExhaleHeap@0 Mask@15)) (and (=> (= (ControlFlow 0 55) 54) anon129_Then_correct) (=> (= (ControlFlow 0 55) 28) anon129_Else_correct)))))
(let ((anon128_Else_correct  (=> (= end@@17 null) (=> (and (= Mask@15 Mask@13) (= (ControlFlow 0 58) 55)) anon66_correct))))
(let ((anon128_Then_correct  (=> (and (not (= end@@17 null)) (= perm@2 (/ (to_real 1) (to_real 2)))) (and (=> (= (ControlFlow 0 56) (- 0 57)) (>= perm@2 NoPerm)) (=> (>= perm@2 NoPerm) (=> (=> (> perm@2 NoPerm) (not (= end@@17 null))) (=> (and (and (= Mask@14 (MapType1Store Mask@13 end@@17 next (real_2_U (+ (U_2_real (MapType1Select Mask@13 end@@17 next)) perm@2)))) (state ExhaleHeap@0 Mask@14)) (and (= Mask@15 Mask@14) (= (ControlFlow 0 56) 55))) anon66_correct)))))))
(let ((anon64_correct  (=> (IdenticalOnKnownLocations Heap@6 ExhaleHeap@0 Mask@12) (=> (and (and (= Mask@13 (MapType1Store Mask@12 null (lseg arg_this@0 end@@17) (real_2_U (+ (U_2_real (MapType1Select Mask@12 null (lseg arg_this@0 end@@17))) FullPerm)))) (state ExhaleHeap@0 Mask@13)) (and (state ExhaleHeap@0 Mask@13) (|Seq#Equal| (contentNodes ExhaleHeap@0 arg_this@0 end@@17) (|Seq#Append| (contentNodes Heap@6 arg_this@0 ptr) (contentNodes Heap@6 ptr end@@17))))) (and (=> (= (ControlFlow 0 59) 56) anon128_Then_correct) (=> (= (ControlFlow 0 59) 58) anon128_Else_correct))))))
(let ((anon127_Else_correct  (=> (and (not (and (< 0 (|Seq#Length| (contentNodes Heap@6 arg_this@0 ptr))) (< 0 (|Seq#Length| (contentNodes Heap@6 ptr end@@17))))) (= (ControlFlow 0 62) 59)) anon64_correct)))
(let ((anon127_Then_correct  (=> (and (< 0 (|Seq#Length| (contentNodes Heap@6 arg_this@0 ptr))) (< 0 (|Seq#Length| (contentNodes Heap@6 ptr end@@17)))) (and (=> (= (ControlFlow 0 60) (- 0 61)) (<= (U_2_int (|Seq#Index| (contentNodes Heap@6 arg_this@0 ptr) (- (|Seq#Length| (contentNodes Heap@6 arg_this@0 ptr)) 1))) (U_2_int (|Seq#Index| (contentNodes Heap@6 ptr end@@17) 0)))) (=> (<= (U_2_int (|Seq#Index| (contentNodes Heap@6 arg_this@0 ptr) (- (|Seq#Length| (contentNodes Heap@6 arg_this@0 ptr)) 1))) (U_2_int (|Seq#Index| (contentNodes Heap@6 ptr end@@17) 0))) (=> (= (ControlFlow 0 60) 59) anon64_correct))))))
(let ((anon61_correct  (=> (and (= Mask@11 (MapType1Store Mask@10 end@@17 next (real_2_U (- (U_2_real (MapType1Select Mask@10 end@@17 next)) perm@1)))) (= Mask@12 Mask@11)) (and (=> (= (ControlFlow 0 64) 60) anon127_Then_correct) (=> (= (ControlFlow 0 64) 62) anon127_Else_correct)))))
(let ((anon126_Else_correct  (=> (and (= perm@1 NoPerm) (= (ControlFlow 0 67) 64)) anon61_correct)))
(let ((anon126_Then_correct  (=> (not (= perm@1 NoPerm)) (and (=> (= (ControlFlow 0 65) (- 0 66)) (<= perm@1 (U_2_real (MapType1Select Mask@10 end@@17 next)))) (=> (<= perm@1 (U_2_real (MapType1Select Mask@10 end@@17 next))) (=> (= (ControlFlow 0 65) 64) anon61_correct))))))
(let ((anon125_Then_correct  (=> (and (not (= end@@17 null)) (= perm@1 (/ (to_real 1) (to_real 2)))) (and (=> (= (ControlFlow 0 68) (- 0 69)) (>= perm@1 NoPerm)) (=> (>= perm@1 NoPerm) (and (=> (= (ControlFlow 0 68) 65) anon126_Then_correct) (=> (= (ControlFlow 0 68) 67) anon126_Else_correct)))))))
(let ((anon125_Else_correct  (=> (and (= end@@17 null) (= Mask@12 Mask@10)) (and (=> (= (ControlFlow 0 63) 60) anon127_Then_correct) (=> (= (ControlFlow 0 63) 62) anon127_Else_correct)))))
(let ((anon58_correct  (=> (= Mask@10 (MapType1Store Mask@9 null (lseg ptr end@@17) (real_2_U (- (U_2_real (MapType1Select Mask@9 null (lseg ptr end@@17))) FullPerm)))) (and (=> (= (ControlFlow 0 70) 68) anon125_Then_correct) (=> (= (ControlFlow 0 70) 63) anon125_Else_correct)))))
(let ((anon124_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 73) 70)) anon58_correct)))
(let ((anon124_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 71) (- 0 72)) (<= FullPerm (U_2_real (MapType1Select Mask@9 null (lseg ptr end@@17))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@9 null (lseg ptr end@@17)))) (=> (= (ControlFlow 0 71) 70) anon58_correct))))))
(let ((anon56_correct  (=> (= Mask@9 (MapType1Store Mask@8 null (lseg arg_this@0 ptr) (real_2_U (- (U_2_real (MapType1Select Mask@8 null (lseg arg_this@0 ptr))) FullPerm)))) (and (=> (= (ControlFlow 0 74) 71) anon124_Then_correct) (=> (= (ControlFlow 0 74) 73) anon124_Else_correct)))))
(let ((anon123_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 77) 74)) anon56_correct)))
(let ((anon123_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 75) (- 0 76)) (<= FullPerm (U_2_real (MapType1Select Mask@8 null (lseg arg_this@0 ptr))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@8 null (lseg arg_this@0 ptr)))) (=> (= (ControlFlow 0 75) 74) anon56_correct))))))
(let ((anon54_correct  (=> (and (state Heap@6 Mask@8) (state Heap@6 Mask@8)) (and (=> (= (ControlFlow 0 78) (- 0 79)) (HasDirectPerm Mask@8 this@@38 next)) (=> (HasDirectPerm Mask@8 this@@38 next) (=> (= arg_this@0 (MapType0Select Heap@6 this@@38 next)) (and (=> (= (ControlFlow 0 78) 75) anon123_Then_correct) (=> (= (ControlFlow 0 78) 77) anon123_Else_correct))))))))
(let ((anon53_correct  (=> (and (and (state Heap@5 Mask@7) (= Mask@8 Mask@7)) (and (= Heap@6 Heap@5) (= (ControlFlow 0 81) 78))) anon54_correct)))
(let ((anon122_Else_correct  (=> (= (MapType0Select Heap@1 this@@38 next) ptr) (=> (and (= Heap@5 Heap@1) (= (ControlFlow 0 83) 81)) anon53_correct))))
(let ((anon122_Then_correct  (=> (not (= (MapType0Select Heap@1 this@@38 next) ptr)) (=> (and (= Heap@2 (MapType0Store Heap@1 null (|lseg#sm| (MapType0Select Heap@1 this@@38 next) ptr) (MapType1Store (MapType0Select Heap@1 null (|lseg#sm| (MapType0Select Heap@1 this@@38 next) ptr)) (MapType0Select Heap@1 this@@38 next) data (bool_2_U true)))) (= Heap@3 (MapType0Store Heap@2 null (|lseg#sm| (MapType0Select Heap@2 this@@38 next) ptr) (MapType1Store (MapType0Select Heap@2 null (|lseg#sm| (MapType0Select Heap@2 this@@38 next) ptr)) (MapType0Select Heap@2 this@@38 next) next (bool_2_U true))))) (=> (and (and (forall ((o_30 T@U) (f_34 T@U) ) (! (let ((B@@14 (FieldTypeInv1 (type f_34))))
(let ((A@@15 (FieldTypeInv0 (type f_34))))
 (=> (and (and (= (type o_30) RefType) (= (type f_34) (FieldType A@@15 B@@14))) (or (U_2_bool (MapType1Select (MapType0Select Heap@3 null (|lseg#sm| (MapType0Select Heap@3 this@@38 next) ptr)) o_30 f_34)) (U_2_bool (MapType1Select (MapType0Select Heap@3 null (|lseg#sm| (MapType0Select Heap@3 (MapType0Select Heap@3 this@@38 next) next) ptr)) o_30 f_34)))) (U_2_bool (MapType1Select newPMask@1 o_30 f_34)))))
 :qid |stdinbpl.2626:37|
 :skolemid |128|
 :pattern ( (MapType1Select newPMask@1 o_30 f_34))
)) (= Heap@4 (MapType0Store Heap@3 null (|lseg#sm| (MapType0Select Heap@3 this@@38 next) ptr) newPMask@1))) (and (= Heap@5 Heap@4) (= (ControlFlow 0 82) 81))) anon53_correct)))))
(let ((anon51_correct  (=> (and (state UnfoldingHeap@4 UnfoldingMask@4) (=> (not (= (MapType0Select Heap@1 this@@38 next) ptr)) (<= (U_2_int (MapType0Select Heap@1 this@@38 data)) (U_2_int (MapType0Select Heap@1 (MapType0Select Heap@1 this@@38 next) data))))) (and (=> (= (ControlFlow 0 84) 82) anon122_Then_correct) (=> (= (ControlFlow 0 84) 83) anon122_Else_correct)))))
(let ((anon50_correct  (=> (and (and (state UnfoldingHeap@3 UnfoldingMask@3) (= UnfoldingHeap@4 UnfoldingHeap@3)) (and (= UnfoldingMask@4 UnfoldingMask@3) (= (ControlFlow 0 86) 84))) anon51_correct)))
(let ((anon121_Else_correct  (=> (= (MapType0Select Heap@1 (MapType0Select Heap@1 this@@38 next) next) ptr) (=> (and (= UnfoldingHeap@3 Heap@1) (= (ControlFlow 0 88) 86)) anon50_correct))))
(let ((anon121_Then_correct  (=> (not (= (MapType0Select Heap@1 (MapType0Select Heap@1 this@@38 next) next) ptr)) (=> (and (= UnfoldingHeap@0 (MapType0Store Heap@1 null (|lseg#sm| (MapType0Select Heap@1 (MapType0Select Heap@1 this@@38 next) next) ptr) (MapType1Store (MapType0Select Heap@1 null (|lseg#sm| (MapType0Select Heap@1 (MapType0Select Heap@1 this@@38 next) next) ptr)) (MapType0Select Heap@1 (MapType0Select Heap@1 this@@38 next) next) data (bool_2_U true)))) (= UnfoldingHeap@1 (MapType0Store UnfoldingHeap@0 null (|lseg#sm| (MapType0Select UnfoldingHeap@0 (MapType0Select UnfoldingHeap@0 this@@38 next) next) ptr) (MapType1Store (MapType0Select UnfoldingHeap@0 null (|lseg#sm| (MapType0Select UnfoldingHeap@0 (MapType0Select UnfoldingHeap@0 this@@38 next) next) ptr)) (MapType0Select UnfoldingHeap@0 (MapType0Select UnfoldingHeap@0 this@@38 next) next) next (bool_2_U true))))) (=> (and (and (forall ((o_29 T@U) (f_33 T@U) ) (! (let ((B@@15 (FieldTypeInv1 (type f_33))))
(let ((A@@16 (FieldTypeInv0 (type f_33))))
 (=> (and (and (= (type o_29) RefType) (= (type f_33) (FieldType A@@16 B@@15))) (or (U_2_bool (MapType1Select (MapType0Select UnfoldingHeap@1 null (|lseg#sm| (MapType0Select UnfoldingHeap@1 (MapType0Select UnfoldingHeap@1 this@@38 next) next) ptr)) o_29 f_33)) (U_2_bool (MapType1Select (MapType0Select UnfoldingHeap@1 null (|lseg#sm| (MapType0Select UnfoldingHeap@1 (MapType0Select UnfoldingHeap@1 (MapType0Select UnfoldingHeap@1 this@@38 next) next) next) ptr)) o_29 f_33)))) (U_2_bool (MapType1Select newPMask@0 o_29 f_33)))))
 :qid |stdinbpl.2610:41|
 :skolemid |127|
 :pattern ( (MapType1Select newPMask@0 o_29 f_33))
)) (= UnfoldingHeap@2 (MapType0Store UnfoldingHeap@1 null (|lseg#sm| (MapType0Select UnfoldingHeap@1 (MapType0Select UnfoldingHeap@1 this@@38 next) next) ptr) newPMask@0))) (and (= UnfoldingHeap@3 UnfoldingHeap@2) (= (ControlFlow 0 87) 86))) anon50_correct)))))
(let ((anon120_Then_correct  (=> (not (= (MapType0Select Heap@1 this@@38 next) ptr)) (=> (and (not (= (MapType0Select Heap@1 this@@38 next) null)) (= UnfoldingMask@1 (MapType1Store UnfoldingMask@0 (MapType0Select Heap@1 this@@38 next) data (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@0 (MapType0Select Heap@1 this@@38 next) data)) FullPerm))))) (=> (and (and (and (state Heap@1 UnfoldingMask@1) (not (= (MapType0Select Heap@1 this@@38 next) null))) (and (= UnfoldingMask@2 (MapType1Store UnfoldingMask@1 (MapType0Select Heap@1 this@@38 next) next (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@1 (MapType0Select Heap@1 this@@38 next) next)) FullPerm)))) (state Heap@1 UnfoldingMask@2))) (and (and (= UnfoldingMask@3 (MapType1Store UnfoldingMask@2 null (lseg (MapType0Select Heap@1 (MapType0Select Heap@1 this@@38 next) next) ptr) (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@2 null (lseg (MapType0Select Heap@1 (MapType0Select Heap@1 this@@38 next) next) ptr))) FullPerm)))) (InsidePredicate (lseg (MapType0Select Heap@1 this@@38 next) ptr) (MapType0Select Heap@1 null (lseg (MapType0Select Heap@1 this@@38 next) ptr)) (lseg (MapType0Select Heap@1 (MapType0Select Heap@1 this@@38 next) next) ptr) (MapType0Select Heap@1 null (lseg (MapType0Select Heap@1 (MapType0Select Heap@1 this@@38 next) next) ptr)))) (and (state Heap@1 UnfoldingMask@3) (=> (not (= (MapType0Select Heap@1 (MapType0Select Heap@1 this@@38 next) next) ptr)) (<= (U_2_int (MapType0Select Heap@1 (MapType0Select Heap@1 this@@38 next) data)) (U_2_int (MapType0Select Heap@1 (MapType0Select Heap@1 (MapType0Select Heap@1 this@@38 next) next) data))))))) (and (=> (= (ControlFlow 0 89) 87) anon121_Then_correct) (=> (= (ControlFlow 0 89) 88) anon121_Else_correct)))))))
(let ((anon120_Else_correct  (=> (and (and (= (MapType0Select Heap@1 this@@38 next) ptr) (= UnfoldingHeap@4 Heap@1)) (and (= UnfoldingMask@4 UnfoldingMask@0) (= (ControlFlow 0 85) 84))) anon51_correct)))
(let ((anon119_Then_correct  (=> (not (= this@@38 ptr)) (=> (and (and (not (= this@@38 null)) (= Mask@5 (MapType1Store Mask@4 this@@38 data (real_2_U (+ (U_2_real (MapType1Select Mask@4 this@@38 data)) FullPerm))))) (and (state Heap@1 Mask@5) (not (= this@@38 null)))) (=> (and (and (and (= Mask@6 (MapType1Store Mask@5 this@@38 next (real_2_U (+ (U_2_real (MapType1Select Mask@5 this@@38 next)) FullPerm)))) (state Heap@1 Mask@6)) (and (= Mask@7 (MapType1Store Mask@6 null (lseg (MapType0Select Heap@1 this@@38 next) ptr) (real_2_U (+ (U_2_real (MapType1Select Mask@6 null (lseg (MapType0Select Heap@1 this@@38 next) ptr))) FullPerm)))) (InsidePredicate (lseg this@@38 ptr) (MapType0Select Heap@1 null (lseg this@@38 ptr)) (lseg (MapType0Select Heap@1 this@@38 next) ptr) (MapType0Select Heap@1 null (lseg (MapType0Select Heap@1 this@@38 next) ptr))))) (and (and (state Heap@1 Mask@7) (|lseg#trigger| Heap@1 (lseg (MapType0Select Heap@1 this@@38 next) ptr))) (and (= (MapType0Select Heap@1 null (lseg (MapType0Select Heap@1 this@@38 next) ptr)) (FrameFragment (ite (not (= (MapType0Select Heap@1 this@@38 next) ptr)) (CombineFrames (FrameFragment (MapType0Select Heap@1 (MapType0Select Heap@1 this@@38 next) data)) (CombineFrames (FrameFragment (MapType0Select Heap@1 (MapType0Select Heap@1 this@@38 next) next)) (MapType0Select Heap@1 null (lseg (MapType0Select Heap@1 (MapType0Select Heap@1 this@@38 next) next) ptr)))) EmptyFrame))) (= UnfoldingMask@0 (MapType1Store Mask@7 null (lseg (MapType0Select Heap@1 this@@38 next) ptr) (real_2_U (- (U_2_real (MapType1Select Mask@7 null (lseg (MapType0Select Heap@1 this@@38 next) ptr))) FullPerm))))))) (and (=> (= (ControlFlow 0 90) 89) anon120_Then_correct) (=> (= (ControlFlow 0 90) 85) anon120_Else_correct)))))))
(let ((anon119_Else_correct  (=> (and (and (= this@@38 ptr) (= Mask@8 Mask@4)) (and (= Heap@6 Heap@1) (= (ControlFlow 0 80) 78))) anon54_correct)))
(let ((anon118_Else_correct  (=> (and (HasDirectPerm Mask@4 null (lseg this@@38 ptr)) (= Heap@1 Heap@@38)) (and (=> (= (ControlFlow 0 92) 90) anon119_Then_correct) (=> (= (ControlFlow 0 92) 80) anon119_Else_correct)))))
(let ((anon118_Then_correct  (=> (not (HasDirectPerm Mask@4 null (lseg this@@38 ptr))) (=> (and (= Heap@0 (MapType0Store Heap@@38 null (lseg this@@38 ptr) newVersion@0)) (= Heap@1 Heap@0)) (and (=> (= (ControlFlow 0 91) 90) anon119_Then_correct) (=> (= (ControlFlow 0 91) 80) anon119_Else_correct))))))
(let ((anon44_correct  (=> (= Mask@4 (MapType1Store Mask@3 null (lseg this@@38 ptr) (real_2_U (- (U_2_real (MapType1Select Mask@3 null (lseg this@@38 ptr))) FullPerm)))) (and (=> (= (ControlFlow 0 93) 91) anon118_Then_correct) (=> (= (ControlFlow 0 93) 92) anon118_Else_correct)))))
(let ((anon117_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 96) 93)) anon44_correct)))
(let ((anon117_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 94) (- 0 95)) (<= FullPerm (U_2_real (MapType1Select Mask@3 null (lseg this@@38 ptr))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@3 null (lseg this@@38 ptr)))) (=> (= (ControlFlow 0 94) 93) anon44_correct))))))
(let ((anon116_Then_correct  (=> (not (= this@@38 ptr)) (=> (and (|lseg#trigger| Heap@@38 (lseg this@@38 ptr)) (= (MapType0Select Heap@@38 null (lseg this@@38 ptr)) (FrameFragment (ite (not (= this@@38 ptr)) (CombineFrames (FrameFragment (MapType0Select Heap@@38 this@@38 data)) (CombineFrames (FrameFragment (MapType0Select Heap@@38 this@@38 next)) (MapType0Select Heap@@38 null (lseg (MapType0Select Heap@@38 this@@38 next) ptr)))) EmptyFrame)))) (and (=> (= (ControlFlow 0 97) 94) anon117_Then_correct) (=> (= (ControlFlow 0 97) 96) anon117_Else_correct))))))
(let ((anon116_Else_correct  (=> (and (and (= this@@38 ptr) (= Heap@18 Heap@@38)) (and (= Mask@21 Mask@3) (= (ControlFlow 0 19) 18))) anon88_correct)))
(let ((anon25_correct  (=> (state Heap@@38 Mask@3) (and (and (=> (= (ControlFlow 0 116) 115) anon108_Then_correct) (=> (= (ControlFlow 0 116) 97) anon116_Then_correct)) (=> (= (ControlFlow 0 116) 19) anon116_Else_correct)))))
(let ((anon106_Else_correct  (and (=> (= (ControlFlow 0 126) (- 0 127)) (< 0 (|Seq#Length| (contentNodes Heap@@38 ptr end@@17)))) (=> (< 0 (|Seq#Length| (contentNodes Heap@@38 ptr end@@17))) (=> (and (<= (U_2_int (|Seq#Index| (contentNodes Heap@@38 this@@38 ptr) (- (|Seq#Length| (contentNodes Heap@@38 this@@38 ptr)) 1))) (U_2_int (|Seq#Index| (contentNodes Heap@@38 ptr end@@17) 0))) (= (ControlFlow 0 126) 116)) anon25_correct)))))
(let ((anon104_Else_correct  (and (=> (= (ControlFlow 0 132) (- 0 134)) (>= (- (|Seq#Length| (contentNodes Heap@@38 this@@38 ptr)) 1) 0)) (=> (>= (- (|Seq#Length| (contentNodes Heap@@38 this@@38 ptr)) 1) 0) (and (=> (= (ControlFlow 0 132) (- 0 133)) (< (- (|Seq#Length| (contentNodes Heap@@38 this@@38 ptr)) 1) (|Seq#Length| (contentNodes Heap@@38 this@@38 ptr)))) (=> (< (- (|Seq#Length| (contentNodes Heap@@38 this@@38 ptr)) 1) (|Seq#Length| (contentNodes Heap@@38 this@@38 ptr))) (and (and (=> (= (ControlFlow 0 132) 126) anon106_Else_correct) (=> (= (ControlFlow 0 132) 129) anon107_Then_correct)) (=> (= (ControlFlow 0 132) 131) anon107_Else_correct))))))))
(let ((anon101_Then_correct  (=> (and (and (< 0 (|Seq#Length| (contentNodes Heap@@38 this@@38 ptr))) (< 0 (|Seq#Length| (contentNodes Heap@@38 ptr end@@17)))) (state Heap@@38 Mask@3)) (and (and (and (and (=> (= (ControlFlow 0 135) 132) anon104_Else_correct) (=> (= (ControlFlow 0 135) 123) anon105_Then_correct)) (=> (= (ControlFlow 0 135) 125) anon105_Else_correct)) (=> (= (ControlFlow 0 135) 119) anon103_Then_correct)) (=> (= (ControlFlow 0 135) 121) anon103_Else_correct)))))
(let ((anon101_Else_correct  (=> (and (not (and (< 0 (|Seq#Length| (contentNodes Heap@@38 this@@38 ptr))) (< 0 (|Seq#Length| (contentNodes Heap@@38 ptr end@@17))))) (= (ControlFlow 0 117) 116)) anon25_correct)))
(let ((anon98_Then_correct  (=> (< 0 (|Seq#Length| (contentNodes Heap@@38 this@@38 ptr))) (and (and (and (=> (= (ControlFlow 0 141) 135) anon101_Then_correct) (=> (= (ControlFlow 0 141) 117) anon101_Else_correct)) (=> (= (ControlFlow 0 141) 138) anon100_Then_correct)) (=> (= (ControlFlow 0 141) 140) anon100_Else_correct)))))
(let ((anon98_Else_correct  (=> (<= (|Seq#Length| (contentNodes Heap@@38 this@@38 ptr)) 0) (and (=> (= (ControlFlow 0 136) 135) anon101_Then_correct) (=> (= (ControlFlow 0 136) 117) anon101_Else_correct)))))
(let ((anon5_correct true))
(let ((anon97_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 4) 1)) anon5_correct)))
(let ((anon97_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 2) (- 0 3)) (<= FullPerm (U_2_real (MapType1Select Mask@3 null (lseg this@@38 ptr))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@3 null (lseg this@@38 ptr)))) (=> (= (ControlFlow 0 2) 1) anon5_correct))))))
(let ((anon2_correct  (=> (state Heap@@38 Mask@3) (and (and (and (=> (= (ControlFlow 0 142) 141) anon98_Then_correct) (=> (= (ControlFlow 0 142) 136) anon98_Else_correct)) (=> (= (ControlFlow 0 142) 2) anon97_Then_correct)) (=> (= (ControlFlow 0 142) 4) anon97_Else_correct)))))
(let ((anon95_Else_correct  (=> (= end@@17 null) (=> (and (= Mask@3 Mask@1) (= (ControlFlow 0 145) 142)) anon2_correct))))
(let ((anon95_Then_correct  (=> (and (not (= end@@17 null)) (= perm@0 (/ (to_real 1) (to_real 2)))) (and (=> (= (ControlFlow 0 143) (- 0 144)) (>= perm@0 NoPerm)) (=> (>= perm@0 NoPerm) (=> (=> (> perm@0 NoPerm) (not (= end@@17 null))) (=> (and (and (= Mask@2 (MapType1Store Mask@1 end@@17 next (real_2_U (+ (U_2_real (MapType1Select Mask@1 end@@17 next)) perm@0)))) (state Heap@@38 Mask@2)) (and (= Mask@3 Mask@2) (= (ControlFlow 0 143) 142))) anon2_correct)))))))
(let ((anon0_correct  (=> (state Heap@@38 ZeroMask) (=> (and (= AssumeFunctionsAbove (- 0 1)) (U_2_bool (MapType0Select Heap@@38 this@@38 $allocated))) (=> (and (and (and (U_2_bool (MapType0Select Heap@@38 ptr $allocated)) (U_2_bool (MapType0Select Heap@@38 end@@17 $allocated))) (and (= Mask@0 (MapType1Store ZeroMask null (lseg this@@38 ptr) (real_2_U (+ (U_2_real (MapType1Select ZeroMask null (lseg this@@38 ptr))) FullPerm)))) (state Heap@@38 Mask@0))) (and (and (state Heap@@38 Mask@0) (= Mask@1 (MapType1Store Mask@0 null (lseg ptr end@@17) (real_2_U (+ (U_2_real (MapType1Select Mask@0 null (lseg ptr end@@17))) FullPerm))))) (and (state Heap@@38 Mask@1) (state Heap@@38 Mask@1)))) (and (=> (= (ControlFlow 0 146) 143) anon95_Then_correct) (=> (= (ControlFlow 0 146) 145) anon95_Else_correct)))))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 147) 146) anon0_correct)))
PreconditionGeneratedEntry_correct))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
))
(check-sat)
(pop 1)
; Valid
(get-info :rlimit)
