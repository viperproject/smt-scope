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
(declare-fun FieldType (T@T T@T) T@T)
(declare-fun FieldTypeInv0 (T@T) T@T)
(declare-fun FieldTypeInv1 (T@T) T@T)
(declare-fun NormalFieldType () T@T)
(declare-fun RefType () T@T)
(declare-fun |Seq#Length| (T@U) Int)
(declare-fun |Seq#Drop| (T@U Int) T@U)
(declare-fun SeqTypeInv0 (T@T) T@T)
(declare-fun SeqType (T@T) T@T)
(declare-fun state (T@U T@U) Bool)
(declare-fun length (T@U T@U) Int)
(declare-fun |length#triggerStateless| (T@U) Int)
(declare-fun |list#trigger| (T@U T@U) Bool)
(declare-fun list (T@U) T@U)
(declare-fun MapType0Type (T@T) T@T)
(declare-fun MapType1Type (T@T T@T) T@T)
(declare-fun AssumeFunctionsAbove () Int)
(declare-fun null () T@U)
(declare-fun MapType0Select (T@U T@U T@U) T@U)
(declare-fun |length'| (T@U T@U) Int)
(declare-fun MapType0TypeInv0 (T@T) T@T)
(declare-fun MapType0Store (T@U T@U T@U T@U) T@U)
(declare-fun MapType1TypeInv0 (T@T) T@T)
(declare-fun MapType1TypeInv1 (T@T) T@T)
(declare-fun MapType1Select (T@U T@U T@U) T@U)
(declare-fun MapType1Store (T@U T@U T@U T@U) T@U)
(declare-fun PredicateType_listType () T@T)
(declare-fun FrameTypeType () T@T)
(declare-fun succHeap (T@U T@U) Bool)
(declare-fun succHeapTrans (T@U T@U) Bool)
(declare-fun GoodMask (T@U) Bool)
(declare-fun |contains'| (T@U T@U Int) Bool)
(declare-fun dummyFunction (T@U) Bool)
(declare-fun |contains#triggerStateless| (T@U Int) Bool)
(declare-fun |get'| (T@U T@U Int) Int)
(declare-fun |get#triggerStateless| (T@U Int) Int)
(declare-fun |Seq#Index| (T@U Int) T@U)
(declare-fun |Seq#Sub| (Int Int) Int)
(declare-fun |Seq#Add| (Int Int) Int)
(declare-fun IdenticalOnKnownLocations (T@U T@U T@U) Bool)
(declare-fun IsPredicateField (T@U) Bool)
(declare-fun PredicateMaskField (T@U) T@U)
(declare-fun HasDirectPerm (T@U T@U T@U) Bool)
(declare-fun IsWandField (T@U) Bool)
(declare-fun WandMaskField (T@U) T@U)
(declare-fun |sum'| (T@U T@U) Int)
(declare-fun |sum#triggerStateless| (T@U) Int)
(declare-fun |head'| (T@U T@U) Int)
(declare-fun |head#triggerStateless| (T@U) Int)
(declare-fun |tail'| (T@U T@U) T@U)
(declare-fun |tail#triggerStateless| (T@U) T@U)
(declare-fun |last'| (T@U T@U) Int)
(declare-fun |last#triggerStateless| (T@U) Int)
(declare-fun |elems'| (T@U T@U) T@U)
(declare-fun |elems#triggerStateless| (T@U) T@U)
(declare-fun |ascending'| (T@U T@U) Bool)
(declare-fun |ascending#triggerStateless| (T@U) Bool)
(declare-fun |list#everUsed| (T@U) Bool)
(declare-fun |Seq#Update| (T@U Int T@U) T@U)
(declare-fun |Seq#Take| (T@U Int) T@U)
(declare-fun |Seq#Contains| (T@U T@U) Bool)
(declare-fun |Seq#Range| (Int Int) T@U)
(declare-fun contains (T@U T@U Int) Bool)
(declare-fun elems (T@U T@U) T@U)
(declare-fun |Seq#Append| (T@U T@U) T@U)
(declare-fun |Seq#Singleton| (T@U) T@U)
(declare-fun |Seq#Empty| (T@T) T@U)
(declare-fun |Seq#Skolem| (T@U T@U) Int)
(declare-fun sum (T@U T@U) Int)
(declare-fun head (T@U T@U) Int)
(declare-fun tail (T@U T@U) T@U)
(declare-fun last (T@U T@U) Int)
(declare-fun |list#sm| (T@U) T@U)
(declare-fun dummyHeap () T@U)
(declare-fun ZeroMask () T@U)
(declare-fun InsidePredicate (T@U T@U T@U T@U) Bool)
(declare-fun sumMask (T@U T@U T@U) Bool)
(declare-fun ConditionalFrame (Real T@U) T@U)
(declare-fun EmptyFrame () T@U)
(declare-fun NoPerm () Real)
(declare-fun get (T@U T@U Int) Int)
(declare-fun |length#trigger| (T@U T@U) Bool)
(declare-fun |Seq#Equal| (T@U T@U) Bool)
(declare-fun ascending (T@U T@U) Bool)
(declare-fun |Seq#ContainsTrigger| (T@U T@U) Bool)
(declare-fun |ascending#frame| (T@U T@U) Bool)
(declare-fun getPredWandId (T@U) Int)
(declare-fun FullPerm () Real)
(declare-fun |length#frame| (T@U T@U) Int)
(declare-fun |sum#frame| (T@U T@U) Int)
(declare-fun |head#frame| (T@U T@U) Int)
(declare-fun |tail#frame| (T@U T@U) T@U)
(declare-fun |last#frame| (T@U T@U) Int)
(declare-fun |elems#frame| (T@U T@U) T@U)
(declare-fun |contains#frame| (T@U T@U Int) Bool)
(declare-fun ZeroPMask () T@U)
(declare-fun |Seq#SkolemDiff| (T@U T@U) Int)
(declare-fun |get#frame| (T@U T@U Int) Int)
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
))) (= (Ctor NormalFieldType) 7)) (= (type $allocated) (FieldType NormalFieldType boolType))) (= (Ctor RefType) 8)) (= (type next) (FieldType NormalFieldType RefType))) (= (type val) (FieldType NormalFieldType intType))))
(assert (distinct $allocated next val)
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
 :qid |stdinbpl.282:18|
 :skolemid |38|
 :pattern ( (|Seq#Length| (|Seq#Drop| s n)))
 :pattern ( (|Seq#Length| s) (|Seq#Drop| s n))
)))
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (forall ((arg0@@17 T@T) ) (! (= (Ctor (MapType0Type arg0@@17)) 10)
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
)))) (forall ((arg0@@21 T@T) (arg1@@5 T@T) ) (! (= (Ctor (MapType1Type arg0@@21 arg1@@5)) 11)
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
)))) (= (Ctor PredicateType_listType) 12)) (= (Ctor FrameTypeType) 13)) (forall ((arg0@@26 T@U) ) (! (= (type (list arg0@@26)) (FieldType PredicateType_listType FrameTypeType))
 :qid |funType:list|
 :pattern ( (list arg0@@26))
))) (= (type null) RefType)))
(assert (forall ((Heap T@U) (Mask T@U) (xs T@U) ) (!  (=> (and (and (and (and (= (type Heap) (MapType0Type RefType)) (= (type Mask) (MapType1Type RefType realType))) (= (type xs) RefType)) (and (state Heap Mask) (< AssumeFunctionsAbove 8))) (not (= xs null))) (= (length Heap xs) (+ 1 (ite (= (MapType0Select Heap xs next) null) 0 (|length'| Heap (MapType0Select Heap xs next))))))
 :qid |stdinbpl.576:15|
 :skolemid |60|
 :pattern ( (state Heap Mask) (length Heap xs))
 :pattern ( (state Heap Mask) (|length#triggerStateless| xs) (|list#trigger| Heap (list xs)))
)))
(assert (forall ((Heap0 T@U) (Heap1 T@U) ) (!  (=> (and (and (= (type Heap0) (MapType0Type RefType)) (= (type Heap1) (MapType0Type RefType))) (succHeap Heap0 Heap1)) (succHeapTrans Heap0 Heap1))
 :qid |stdinbpl.88:15|
 :skolemid |11|
 :pattern ( (succHeap Heap0 Heap1))
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
(assert (forall ((Heap@@1 T@U) (xs@@0 T@U) (x@@8 Int) ) (!  (=> (and (= (type Heap@@1) (MapType0Type RefType)) (= (type xs@@0) RefType)) (dummyFunction (bool_2_U (|contains#triggerStateless| xs@@0 x@@8))))
 :qid |stdinbpl.1230:15|
 :skolemid |85|
 :pattern ( (|contains'| Heap@@1 xs@@0 x@@8))
)))
(assert (forall ((Heap@@2 T@U) (xs@@1 T@U) (index Int) ) (!  (=> (and (= (type Heap@@2) (MapType0Type RefType)) (= (type xs@@1) RefType)) (dummyFunction (int_2_U (|get#triggerStateless| xs@@1 index))))
 :qid |stdinbpl.1515:15|
 :skolemid |95|
 :pattern ( (|get'| Heap@@2 xs@@1 index))
)))
(assert (forall ((arg0@@27 T@U) (arg1@@10 Int) ) (! (let ((T@@1 (SeqTypeInv0 (type arg0@@27))))
(= (type (|Seq#Index| arg0@@27 arg1@@10)) T@@1))
 :qid |funType:Seq#Index|
 :pattern ( (|Seq#Index| arg0@@27 arg1@@10))
)))
(assert (forall ((s@@0 T@U) (n@@0 Int) (j Int) ) (! (let ((T@@2 (SeqTypeInv0 (type s@@0))))
 (=> (= (type s@@0) (SeqType T@@2)) (=> (and (and (< 0 n@@0) (<= 0 j)) (< j (- (|Seq#Length| s@@0) n@@0))) (and (= (|Seq#Sub| (|Seq#Add| j n@@0) n@@0) j) (= (|Seq#Index| (|Seq#Drop| s@@0 n@@0) j) (|Seq#Index| s@@0 (|Seq#Add| j n@@0)))))))
 :qid |stdinbpl.303:18|
 :skolemid |39|
 :pattern ( (|Seq#Index| (|Seq#Drop| s@@0 n@@0) j))
)))
(assert (forall ((arg0@@28 T@U) ) (! (let ((A (FieldTypeInv0 (type arg0@@28))))
(= (type (PredicateMaskField arg0@@28)) (FieldType A (MapType1Type RefType boolType))))
 :qid |funType:PredicateMaskField|
 :pattern ( (PredicateMaskField arg0@@28))
)))
(assert (forall ((Heap@@3 T@U) (ExhaleHeap T@U) (Mask@@1 T@U) (pm_f T@U) ) (! (let ((C (FieldTypeInv0 (type pm_f))))
 (=> (and (and (and (and (and (= (type Heap@@3) (MapType0Type RefType)) (= (type ExhaleHeap) (MapType0Type RefType))) (= (type Mask@@1) (MapType1Type RefType realType))) (= (type pm_f) (FieldType C FrameTypeType))) (IdenticalOnKnownLocations Heap@@3 ExhaleHeap Mask@@1)) (and (HasDirectPerm Mask@@1 null pm_f) (IsPredicateField pm_f))) (= (MapType0Select Heap@@3 null (PredicateMaskField pm_f)) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))))
 :qid |stdinbpl.47:19|
 :skolemid |2|
 :pattern ( (IdenticalOnKnownLocations Heap@@3 ExhaleHeap Mask@@1) (IsPredicateField pm_f) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))
)))
(assert (forall ((arg0@@29 T@U) ) (! (let ((A@@0 (FieldTypeInv0 (type arg0@@29))))
(= (type (WandMaskField arg0@@29)) (FieldType A@@0 (MapType1Type RefType boolType))))
 :qid |funType:WandMaskField|
 :pattern ( (WandMaskField arg0@@29))
)))
(assert (forall ((Heap@@4 T@U) (ExhaleHeap@@0 T@U) (Mask@@2 T@U) (pm_f@@0 T@U) ) (! (let ((C@@0 (FieldTypeInv0 (type pm_f@@0))))
 (=> (and (and (and (and (and (= (type Heap@@4) (MapType0Type RefType)) (= (type ExhaleHeap@@0) (MapType0Type RefType))) (= (type Mask@@2) (MapType1Type RefType realType))) (= (type pm_f@@0) (FieldType C@@0 FrameTypeType))) (IdenticalOnKnownLocations Heap@@4 ExhaleHeap@@0 Mask@@2)) (and (HasDirectPerm Mask@@2 null pm_f@@0) (IsWandField pm_f@@0))) (= (MapType0Select Heap@@4 null (WandMaskField pm_f@@0)) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))))
 :qid |stdinbpl.60:19|
 :skolemid |5|
 :pattern ( (IdenticalOnKnownLocations Heap@@4 ExhaleHeap@@0 Mask@@2) (IsWandField pm_f@@0) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))
)))
(assert (forall ((xs@@2 T@U) ) (!  (=> (= (type xs@@2) RefType) (IsPredicateField (list xs@@2)))
 :qid |stdinbpl.1848:15|
 :skolemid |105|
 :pattern ( (list xs@@2))
)))
(assert (forall ((Heap@@5 T@U) (xs@@3 T@U) ) (!  (=> (and (= (type Heap@@5) (MapType0Type RefType)) (= (type xs@@3) RefType)) (dummyFunction (int_2_U (|length#triggerStateless| xs@@3))))
 :qid |stdinbpl.570:15|
 :skolemid |59|
 :pattern ( (|length'| Heap@@5 xs@@3))
)))
(assert (forall ((Heap@@6 T@U) (xs@@4 T@U) ) (!  (=> (and (= (type Heap@@6) (MapType0Type RefType)) (= (type xs@@4) RefType)) (dummyFunction (int_2_U (|sum#triggerStateless| xs@@4))))
 :qid |stdinbpl.722:15|
 :skolemid |65|
 :pattern ( (|sum'| Heap@@6 xs@@4))
)))
(assert (forall ((Heap@@7 T@U) (xs@@5 T@U) ) (!  (=> (and (= (type Heap@@7) (MapType0Type RefType)) (= (type xs@@5) RefType)) (dummyFunction (int_2_U (|head#triggerStateless| xs@@5))))
 :qid |stdinbpl.864:15|
 :skolemid |70|
 :pattern ( (|head'| Heap@@7 xs@@5))
)))
(assert  (and (forall ((arg0@@30 T@U) (arg1@@11 T@U) ) (! (= (type (|tail'| arg0@@30 arg1@@11)) RefType)
 :qid |funType:tail'|
 :pattern ( (|tail'| arg0@@30 arg1@@11))
)) (forall ((arg0@@31 T@U) ) (! (= (type (|tail#triggerStateless| arg0@@31)) RefType)
 :qid |funType:tail#triggerStateless|
 :pattern ( (|tail#triggerStateless| arg0@@31))
))))
(assert (forall ((Heap@@8 T@U) (xs@@6 T@U) ) (!  (=> (and (= (type Heap@@8) (MapType0Type RefType)) (= (type xs@@6) RefType)) (dummyFunction (|tail#triggerStateless| xs@@6)))
 :qid |stdinbpl.976:15|
 :skolemid |75|
 :pattern ( (|tail'| Heap@@8 xs@@6))
)))
(assert (forall ((Heap@@9 T@U) (xs@@7 T@U) ) (!  (=> (and (= (type Heap@@9) (MapType0Type RefType)) (= (type xs@@7) RefType)) (dummyFunction (int_2_U (|last#triggerStateless| xs@@7))))
 :qid |stdinbpl.1088:15|
 :skolemid |80|
 :pattern ( (|last'| Heap@@9 xs@@7))
)))
(assert  (and (forall ((arg0@@32 T@U) (arg1@@12 T@U) ) (! (= (type (|elems'| arg0@@32 arg1@@12)) (SeqType intType))
 :qid |funType:elems'|
 :pattern ( (|elems'| arg0@@32 arg1@@12))
)) (forall ((arg0@@33 T@U) ) (! (= (type (|elems#triggerStateless| arg0@@33)) (SeqType intType))
 :qid |funType:elems#triggerStateless|
 :pattern ( (|elems#triggerStateless| arg0@@33))
))))
(assert (forall ((Heap@@10 T@U) (xs@@8 T@U) ) (!  (=> (and (= (type Heap@@10) (MapType0Type RefType)) (= (type xs@@8) RefType)) (dummyFunction (|elems#triggerStateless| xs@@8)))
 :qid |stdinbpl.1373:15|
 :skolemid |90|
 :pattern ( (|elems'| Heap@@10 xs@@8))
)))
(assert (forall ((Heap@@11 T@U) (xs@@9 T@U) ) (!  (=> (and (= (type Heap@@11) (MapType0Type RefType)) (= (type xs@@9) RefType)) (dummyFunction (bool_2_U (|ascending#triggerStateless| xs@@9))))
 :qid |stdinbpl.1684:15|
 :skolemid |100|
 :pattern ( (|ascending'| Heap@@11 xs@@9))
)))
(assert (forall ((Heap@@12 T@U) (xs@@10 T@U) ) (!  (=> (and (= (type Heap@@12) (MapType0Type RefType)) (= (type xs@@10) RefType)) (|list#everUsed| (list xs@@10)))
 :qid |stdinbpl.1867:15|
 :skolemid |109|
 :pattern ( (|list#trigger| Heap@@12 (list xs@@10)))
)))
(assert (forall ((arg0@@34 T@U) (arg1@@13 Int) (arg2@@3 T@U) ) (! (let ((T@@3 (type arg2@@3)))
(= (type (|Seq#Update| arg0@@34 arg1@@13 arg2@@3)) (SeqType T@@3)))
 :qid |funType:Seq#Update|
 :pattern ( (|Seq#Update| arg0@@34 arg1@@13 arg2@@3))
)))
(assert (forall ((s@@1 T@U) (i Int) (v T@U) (n@@1 Int) ) (! (let ((T@@4 (type v)))
 (=> (= (type s@@1) (SeqType T@@4)) (=> (and (<= 0 n@@1) (< n@@1 (|Seq#Length| s@@1))) (and (=> (= i n@@1) (= (|Seq#Index| (|Seq#Update| s@@1 i v) n@@1) v)) (=> (not (= i n@@1)) (= (|Seq#Index| (|Seq#Update| s@@1 i v) n@@1) (|Seq#Index| s@@1 n@@1)))))))
 :qid |stdinbpl.258:18|
 :skolemid |35|
 :pattern ( (|Seq#Index| (|Seq#Update| s@@1 i v) n@@1))
 :pattern ( (|Seq#Index| s@@1 n@@1) (|Seq#Update| s@@1 i v))
)))
(assert (forall ((arg0@@35 T@U) (arg1@@14 Int) ) (! (let ((T@@5 (SeqTypeInv0 (type arg0@@35))))
(= (type (|Seq#Take| arg0@@35 arg1@@14)) (SeqType T@@5)))
 :qid |funType:Seq#Take|
 :pattern ( (|Seq#Take| arg0@@35 arg1@@14))
)))
(assert (forall ((s@@2 T@U) (n@@2 Int) ) (! (let ((T@@6 (SeqTypeInv0 (type s@@2))))
 (=> (= (type s@@2) (SeqType T@@6)) (and (=> (<= 0 n@@2) (and (=> (<= n@@2 (|Seq#Length| s@@2)) (= (|Seq#Length| (|Seq#Take| s@@2 n@@2)) n@@2)) (=> (< (|Seq#Length| s@@2) n@@2) (= (|Seq#Length| (|Seq#Take| s@@2 n@@2)) (|Seq#Length| s@@2))))) (=> (< n@@2 0) (= (|Seq#Length| (|Seq#Take| s@@2 n@@2)) 0)))))
 :qid |stdinbpl.269:18|
 :skolemid |36|
 :pattern ( (|Seq#Length| (|Seq#Take| s@@2 n@@2)))
 :pattern ( (|Seq#Take| s@@2 n@@2) (|Seq#Length| s@@2))
)))
(assert (forall ((arg0@@36 Int) (arg1@@15 Int) ) (! (= (type (|Seq#Range| arg0@@36 arg1@@15)) (SeqType intType))
 :qid |funType:Seq#Range|
 :pattern ( (|Seq#Range| arg0@@36 arg1@@15))
)))
(assert (forall ((q@min Int) (q@max Int) (v@@0 T@U) ) (!  (=> (= (type v@@0) intType) (= (|Seq#Contains| (|Seq#Range| q@min q@max) v@@0)  (and (<= q@min (U_2_int v@@0)) (< (U_2_int v@@0) q@max))))
 :qid |stdinbpl.542:15|
 :skolemid |57|
 :pattern ( (|Seq#Contains| (|Seq#Range| q@min q@max) v@@0))
)))
(assert (forall ((Heap@@13 T@U) (Mask@@3 T@U) (xs@@11 T@U) (x@@9 Int) ) (!  (=> (and (and (and (and (= (type Heap@@13) (MapType0Type RefType)) (= (type Mask@@3) (MapType1Type RefType realType))) (= (type xs@@11) RefType)) (and (state Heap@@13 Mask@@3) (< AssumeFunctionsAbove 2))) (not (= xs@@11 null))) (= (contains Heap@@13 xs@@11 x@@9)  (or (= x@@9 (U_2_int (MapType0Select Heap@@13 xs@@11 val))) (and (not (= (MapType0Select Heap@@13 xs@@11 next) null)) (|contains'| Heap@@13 (MapType0Select Heap@@13 xs@@11 next) x@@9)))))
 :qid |stdinbpl.1236:15|
 :skolemid |86|
 :pattern ( (state Heap@@13 Mask@@3) (contains Heap@@13 xs@@11 x@@9))
 :pattern ( (state Heap@@13 Mask@@3) (|contains#triggerStateless| xs@@11 x@@9) (|list#trigger| Heap@@13 (list xs@@11)))
)))
(assert  (and (and (and (forall ((arg0@@37 T@U) (arg1@@16 T@U) ) (! (= (type (elems arg0@@37 arg1@@16)) (SeqType intType))
 :qid |funType:elems|
 :pattern ( (elems arg0@@37 arg1@@16))
)) (forall ((arg0@@38 T@U) (arg1@@17 T@U) ) (! (let ((T@@7 (SeqTypeInv0 (type arg0@@38))))
(= (type (|Seq#Append| arg0@@38 arg1@@17)) (SeqType T@@7)))
 :qid |funType:Seq#Append|
 :pattern ( (|Seq#Append| arg0@@38 arg1@@17))
))) (forall ((arg0@@39 T@U) ) (! (let ((T@@8 (type arg0@@39)))
(= (type (|Seq#Singleton| arg0@@39)) (SeqType T@@8)))
 :qid |funType:Seq#Singleton|
 :pattern ( (|Seq#Singleton| arg0@@39))
))) (forall ((T@@9 T@T) ) (! (= (type (|Seq#Empty| T@@9)) (SeqType T@@9))
 :qid |funType:Seq#Empty|
 :pattern ( (|Seq#Empty| T@@9))
))))
(assert (forall ((Heap@@14 T@U) (Mask@@4 T@U) (xs@@12 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@14) (MapType0Type RefType)) (= (type Mask@@4) (MapType1Type RefType realType))) (= (type xs@@12) RefType)) (and (state Heap@@14 Mask@@4) (< AssumeFunctionsAbove 4))) (not (= xs@@12 null))) (= (elems Heap@@14 xs@@12) (|Seq#Append| (|Seq#Singleton| (MapType0Select Heap@@14 xs@@12 val)) (ite (= (MapType0Select Heap@@14 xs@@12 next) null) (|Seq#Empty| intType) (|elems'| Heap@@14 (MapType0Select Heap@@14 xs@@12 next))))))
 :qid |stdinbpl.1379:15|
 :skolemid |91|
 :pattern ( (state Heap@@14 Mask@@4) (elems Heap@@14 xs@@12))
 :pattern ( (state Heap@@14 Mask@@4) (|elems#triggerStateless| xs@@12) (|list#trigger| Heap@@14 (list xs@@12)))
)))
(assert (forall ((s@@3 T@U) (x@@10 T@U) ) (! (let ((T@@10 (type x@@10)))
 (=> (and (= (type s@@3) (SeqType T@@10)) (|Seq#Contains| s@@3 x@@10)) (and (and (<= 0 (|Seq#Skolem| s@@3 x@@10)) (< (|Seq#Skolem| s@@3 x@@10) (|Seq#Length| s@@3))) (= (|Seq#Index| s@@3 (|Seq#Skolem| s@@3 x@@10)) x@@10))))
 :qid |stdinbpl.400:18|
 :skolemid |47|
 :pattern ( (|Seq#Contains| s@@3 x@@10))
)))
(assert (forall ((Heap@@15 T@U) (ExhaleHeap@@1 T@U) (Mask@@5 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@15) (MapType0Type RefType)) (= (type ExhaleHeap@@1) (MapType0Type RefType))) (= (type Mask@@5) (MapType1Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@15 ExhaleHeap@@1 Mask@@5)) (U_2_bool (MapType0Select Heap@@15 o_1 $allocated))) (U_2_bool (MapType0Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.73:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@15 ExhaleHeap@@1 Mask@@5) (MapType0Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert (forall ((Heap@@16 T@U) (xs@@13 T@U) ) (!  (=> (and (= (type Heap@@16) (MapType0Type RefType)) (= (type xs@@13) RefType)) (and (= (length Heap@@16 xs@@13) (|length'| Heap@@16 xs@@13)) (dummyFunction (int_2_U (|length#triggerStateless| xs@@13)))))
 :qid |stdinbpl.566:15|
 :skolemid |58|
 :pattern ( (length Heap@@16 xs@@13))
)))
(assert (forall ((Heap@@17 T@U) (xs@@14 T@U) ) (!  (=> (and (= (type Heap@@17) (MapType0Type RefType)) (= (type xs@@14) RefType)) (and (= (sum Heap@@17 xs@@14) (|sum'| Heap@@17 xs@@14)) (dummyFunction (int_2_U (|sum#triggerStateless| xs@@14)))))
 :qid |stdinbpl.718:15|
 :skolemid |64|
 :pattern ( (sum Heap@@17 xs@@14))
)))
(assert (forall ((Heap@@18 T@U) (xs@@15 T@U) ) (!  (=> (and (= (type Heap@@18) (MapType0Type RefType)) (= (type xs@@15) RefType)) (and (= (head Heap@@18 xs@@15) (|head'| Heap@@18 xs@@15)) (dummyFunction (int_2_U (|head#triggerStateless| xs@@15)))))
 :qid |stdinbpl.860:15|
 :skolemid |69|
 :pattern ( (head Heap@@18 xs@@15))
)))
(assert (forall ((arg0@@40 T@U) (arg1@@18 T@U) ) (! (= (type (tail arg0@@40 arg1@@18)) RefType)
 :qid |funType:tail|
 :pattern ( (tail arg0@@40 arg1@@18))
)))
(assert (forall ((Heap@@19 T@U) (xs@@16 T@U) ) (!  (=> (and (= (type Heap@@19) (MapType0Type RefType)) (= (type xs@@16) RefType)) (and (= (tail Heap@@19 xs@@16) (|tail'| Heap@@19 xs@@16)) (dummyFunction (|tail#triggerStateless| xs@@16))))
 :qid |stdinbpl.972:15|
 :skolemid |74|
 :pattern ( (tail Heap@@19 xs@@16))
)))
(assert (forall ((Heap@@20 T@U) (xs@@17 T@U) ) (!  (=> (and (= (type Heap@@20) (MapType0Type RefType)) (= (type xs@@17) RefType)) (and (= (last Heap@@20 xs@@17) (|last'| Heap@@20 xs@@17)) (dummyFunction (int_2_U (|last#triggerStateless| xs@@17)))))
 :qid |stdinbpl.1084:15|
 :skolemid |79|
 :pattern ( (last Heap@@20 xs@@17))
)))
(assert (forall ((Heap@@21 T@U) (xs@@18 T@U) ) (!  (=> (and (= (type Heap@@21) (MapType0Type RefType)) (= (type xs@@18) RefType)) (and (= (elems Heap@@21 xs@@18) (|elems'| Heap@@21 xs@@18)) (dummyFunction (|elems#triggerStateless| xs@@18))))
 :qid |stdinbpl.1369:15|
 :skolemid |89|
 :pattern ( (elems Heap@@21 xs@@18))
)))
(assert (forall ((s@@4 T@U) (n@@3 Int) ) (! (let ((T@@11 (SeqTypeInv0 (type s@@4))))
 (=> (and (= (type s@@4) (SeqType T@@11)) (<= n@@3 0)) (= (|Seq#Drop| s@@4 n@@3) s@@4)))
 :qid |stdinbpl.384:18|
 :skolemid |45|
 :pattern ( (|Seq#Drop| s@@4 n@@3))
)))
(assert (forall ((i@@0 Int) (j@@0 Int) ) (! (= (|Seq#Sub| i@@0 j@@0) (- i@@0 j@@0))
 :qid |stdinbpl.238:15|
 :skolemid |30|
 :pattern ( (|Seq#Sub| i@@0 j@@0))
)))
(assert (forall ((i@@1 Int) (j@@1 Int) ) (! (= (|Seq#Add| i@@1 j@@1) (+ i@@1 j@@1))
 :qid |stdinbpl.236:15|
 :skolemid |29|
 :pattern ( (|Seq#Add| i@@1 j@@1))
)))
(assert (forall ((x@@11 T@U) (y@@1 T@U) ) (! (let ((T@@12 (type x@@11)))
 (=> (= (type y@@1) T@@12) (= (|Seq#Contains| (|Seq#Singleton| x@@11) y@@1) (= x@@11 y@@1))))
 :qid |stdinbpl.525:18|
 :skolemid |54|
 :pattern ( (|Seq#Contains| (|Seq#Singleton| x@@11) y@@1))
)))
(assert (forall ((s@@5 T@U) (n@@4 Int) (j@@2 Int) ) (! (let ((T@@13 (SeqTypeInv0 (type s@@5))))
 (=> (= (type s@@5) (SeqType T@@13)) (=> (and (and (<= 0 j@@2) (< j@@2 n@@4)) (< j@@2 (|Seq#Length| s@@5))) (= (|Seq#Index| (|Seq#Take| s@@5 n@@4) j@@2) (|Seq#Index| s@@5 j@@2)))))
 :qid |stdinbpl.277:18|
 :skolemid |37|
 :pattern ( (|Seq#Index| (|Seq#Take| s@@5 n@@4) j@@2))
 :pattern ( (|Seq#Index| s@@5 j@@2) (|Seq#Take| s@@5 n@@4))
)))
(assert (forall ((xs@@19 T@U) (xs2 T@U) ) (!  (=> (and (and (= (type xs@@19) RefType) (= (type xs2) RefType)) (= (list xs@@19) (list xs2))) (= xs@@19 xs2))
 :qid |stdinbpl.1858:15|
 :skolemid |107|
 :pattern ( (list xs@@19) (list xs2))
)))
(assert (forall ((arg0@@41 T@U) ) (! (= (type (|list#sm| arg0@@41)) (FieldType PredicateType_listType (MapType1Type RefType boolType)))
 :qid |funType:list#sm|
 :pattern ( (|list#sm| arg0@@41))
)))
(assert (forall ((xs@@20 T@U) (xs2@@0 T@U) ) (!  (=> (and (and (= (type xs@@20) RefType) (= (type xs2@@0) RefType)) (= (|list#sm| xs@@20) (|list#sm| xs2@@0))) (= xs@@20 xs2@@0))
 :qid |stdinbpl.1862:15|
 :skolemid |108|
 :pattern ( (|list#sm| xs@@20) (|list#sm| xs2@@0))
)))
(assert (forall ((Heap@@22 T@U) (ExhaleHeap@@2 T@U) (Mask@@6 T@U) (o_1@@0 T@U) (f_2 T@U) ) (! (let ((B@@1 (FieldTypeInv1 (type f_2))))
(let ((A@@1 (FieldTypeInv0 (type f_2))))
 (=> (and (and (and (and (and (and (= (type Heap@@22) (MapType0Type RefType)) (= (type ExhaleHeap@@2) (MapType0Type RefType))) (= (type Mask@@6) (MapType1Type RefType realType))) (= (type o_1@@0) RefType)) (= (type f_2) (FieldType A@@1 B@@1))) (IdenticalOnKnownLocations Heap@@22 ExhaleHeap@@2 Mask@@6)) (HasDirectPerm Mask@@6 o_1@@0 f_2)) (= (MapType0Select Heap@@22 o_1@@0 f_2) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2)))))
 :qid |stdinbpl.42:22|
 :skolemid |1|
 :pattern ( (IdenticalOnKnownLocations Heap@@22 ExhaleHeap@@2 Mask@@6) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2))
)))
(assert (forall ((T@@14 T@T) ) (! (= (|Seq#Length| (|Seq#Empty| T@@14)) 0)
 :skolemid |23|
)))
(assert  (and (= (type dummyHeap) (MapType0Type RefType)) (= (type ZeroMask) (MapType1Type RefType realType))))
(assert (state dummyHeap ZeroMask))
(assert (forall ((p T@U) (v_1 T@U) (w T@U) ) (! (let ((A@@2 (FieldTypeInv0 (type p))))
 (=> (and (and (= (type p) (FieldType A@@2 FrameTypeType)) (= (type v_1) FrameTypeType)) (= (type w) FrameTypeType)) (not (InsidePredicate p v_1 p w))))
 :qid |stdinbpl.181:19|
 :skolemid |21|
 :pattern ( (InsidePredicate p v_1 p w))
)))
(assert (forall ((Heap@@23 T@U) (Mask@@7 T@U) (xs@@21 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@23) (MapType0Type RefType)) (= (type Mask@@7) (MapType1Type RefType realType))) (= (type xs@@21) RefType)) (and (state Heap@@23 Mask@@7) (< AssumeFunctionsAbove 0))) (not (= xs@@21 null))) (= (last Heap@@23 xs@@21) (ite (= (MapType0Select Heap@@23 xs@@21 next) null) (U_2_int (MapType0Select Heap@@23 xs@@21 val)) (|last'| Heap@@23 (MapType0Select Heap@@23 xs@@21 next)))))
 :qid |stdinbpl.1094:15|
 :skolemid |81|
 :pattern ( (state Heap@@23 Mask@@7) (last Heap@@23 xs@@21))
 :pattern ( (state Heap@@23 Mask@@7) (|last#triggerStateless| xs@@21) (|list#trigger| Heap@@23 (list xs@@21)))
)))
(assert (forall ((s0 T@U) (s1 T@U) (n@@5 Int) ) (! (let ((T@@15 (SeqTypeInv0 (type s0))))
 (=> (and (= (type s0) (SeqType T@@15)) (= (type s1) (SeqType T@@15))) (=> (and (and (and (not (= s0 (|Seq#Empty| T@@15))) (not (= s1 (|Seq#Empty| T@@15)))) (<= (|Seq#Length| s0) n@@5)) (< n@@5 (|Seq#Length| (|Seq#Append| s0 s1)))) (and (= (|Seq#Add| (|Seq#Sub| n@@5 (|Seq#Length| s0)) (|Seq#Length| s0)) n@@5) (= (|Seq#Index| (|Seq#Append| s0 s1) n@@5) (|Seq#Index| s1 (|Seq#Sub| n@@5 (|Seq#Length| s0))))))))
 :qid |stdinbpl.249:18|
 :skolemid |32|
 :pattern ( (|Seq#Index| (|Seq#Append| s0 s1) n@@5))
)))
(assert  (not (IsPredicateField next)))
(assert  (not (IsWandField next)))
(assert  (not (IsPredicateField val)))
(assert  (not (IsWandField val)))
(assert (forall ((Heap@@24 T@U) (ExhaleHeap@@3 T@U) (Mask@@8 T@U) ) (!  (=> (and (and (and (= (type Heap@@24) (MapType0Type RefType)) (= (type ExhaleHeap@@3) (MapType0Type RefType))) (= (type Mask@@8) (MapType1Type RefType realType))) (IdenticalOnKnownLocations Heap@@24 ExhaleHeap@@3 Mask@@8)) (succHeap Heap@@24 ExhaleHeap@@3))
 :qid |stdinbpl.83:15|
 :skolemid |10|
 :pattern ( (IdenticalOnKnownLocations Heap@@24 ExhaleHeap@@3 Mask@@8))
)))
(assert (forall ((Heap@@25 T@U) (Mask@@9 T@U) (xs@@22 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@25) (MapType0Type RefType)) (= (type Mask@@9) (MapType1Type RefType realType))) (= (type xs@@22) RefType)) (and (state Heap@@25 Mask@@9) (< AssumeFunctionsAbove 6))) (not (= xs@@22 null))) (= (tail Heap@@25 xs@@22) (MapType0Select Heap@@25 xs@@22 next)))
 :qid |stdinbpl.982:15|
 :skolemid |76|
 :pattern ( (state Heap@@25 Mask@@9) (tail Heap@@25 xs@@22))
 :pattern ( (state Heap@@25 Mask@@9) (|tail#triggerStateless| xs@@22) (|list#trigger| Heap@@25 (list xs@@22)))
)))
(assert (forall ((Heap@@26 T@U) (Mask@@10 T@U) (xs@@23 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@26) (MapType0Type RefType)) (= (type Mask@@10) (MapType1Type RefType realType))) (= (type xs@@23) RefType)) (and (state Heap@@26 Mask@@10) (< AssumeFunctionsAbove 7))) (not (= xs@@23 null))) (= (head Heap@@26 xs@@23) (U_2_int (MapType0Select Heap@@26 xs@@23 val))))
 :qid |stdinbpl.870:15|
 :skolemid |71|
 :pattern ( (state Heap@@26 Mask@@10) (head Heap@@26 xs@@23))
 :pattern ( (state Heap@@26 Mask@@10) (|head#triggerStateless| xs@@23) (|list#trigger| Heap@@26 (list xs@@23)))
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
(assert  (and (forall ((arg0@@42 Real) (arg1@@19 T@U) ) (! (= (type (ConditionalFrame arg0@@42 arg1@@19)) FrameTypeType)
 :qid |funType:ConditionalFrame|
 :pattern ( (ConditionalFrame arg0@@42 arg1@@19))
)) (= (type EmptyFrame) FrameTypeType)))
(assert (forall ((p@@0 Real) (f_6 T@U) ) (!  (=> (= (type f_6) FrameTypeType) (= (ConditionalFrame p@@0 f_6) (ite (> p@@0 0.0) f_6 EmptyFrame)))
 :qid |stdinbpl.169:15|
 :skolemid |19|
 :pattern ( (ConditionalFrame p@@0 f_6))
)))
(assert (forall ((q@min@@0 Int) (q@max@@0 Int) (j@@3 Int) ) (!  (=> (and (<= 0 j@@3) (< j@@3 (- q@max@@0 q@min@@0))) (= (U_2_int (|Seq#Index| (|Seq#Range| q@min@@0 q@max@@0) j@@3)) (+ q@min@@0 j@@3)))
 :qid |stdinbpl.540:15|
 :skolemid |56|
 :pattern ( (|Seq#Index| (|Seq#Range| q@min@@0 q@max@@0) j@@3))
)))
(assert (forall ((Mask@@11 T@U) (o_2@@0 T@U) (f_4@@0 T@U) ) (! (let ((B@@3 (FieldTypeInv1 (type f_4@@0))))
(let ((A@@4 (FieldTypeInv0 (type f_4@@0))))
 (=> (and (and (= (type Mask@@11) (MapType1Type RefType realType)) (= (type o_2@@0) RefType)) (= (type f_4@@0) (FieldType A@@4 B@@3))) (= (HasDirectPerm Mask@@11 o_2@@0 f_4@@0) (> (U_2_real (MapType1Select Mask@@11 o_2@@0 f_4@@0)) NoPerm)))))
 :qid |stdinbpl.133:22|
 :skolemid |17|
 :pattern ( (HasDirectPerm Mask@@11 o_2@@0 f_4@@0))
)))
(assert (forall ((s0@@0 T@U) (s1@@0 T@U) ) (! (let ((T@@16 (SeqTypeInv0 (type s0@@0))))
 (=> (and (and (= (type s0@@0) (SeqType T@@16)) (= (type s1@@0) (SeqType T@@16))) (and (not (= s0@@0 (|Seq#Empty| T@@16))) (not (= s1@@0 (|Seq#Empty| T@@16))))) (= (|Seq#Length| (|Seq#Append| s0@@0 s1@@0)) (+ (|Seq#Length| s0@@0) (|Seq#Length| s1@@0)))))
 :qid |stdinbpl.218:18|
 :skolemid |26|
 :pattern ( (|Seq#Length| (|Seq#Append| s0@@0 s1@@0)))
)))
(assert (forall ((s@@6 T@U) (t T@U) (n@@6 Int) ) (! (let ((T@@17 (SeqTypeInv0 (type s@@6))))
 (=> (and (and (= (type s@@6) (SeqType T@@17)) (= (type t) (SeqType T@@17))) (and (> n@@6 0) (> n@@6 (|Seq#Length| s@@6)))) (and (= (|Seq#Add| (|Seq#Sub| n@@6 (|Seq#Length| s@@6)) (|Seq#Length| s@@6)) n@@6) (= (|Seq#Drop| (|Seq#Append| s@@6 t) n@@6) (|Seq#Drop| t (|Seq#Sub| n@@6 (|Seq#Length| s@@6)))))))
 :qid |stdinbpl.374:18|
 :skolemid |44|
 :pattern ( (|Seq#Drop| (|Seq#Append| s@@6 t) n@@6))
)))
(assert (forall ((Heap@@27 T@U) (xs@@24 T@U) (index@@0 Int) ) (!  (=> (and (= (type Heap@@27) (MapType0Type RefType)) (= (type xs@@24) RefType)) (and (= (get Heap@@27 xs@@24 index@@0) (|get'| Heap@@27 xs@@24 index@@0)) (dummyFunction (int_2_U (|get#triggerStateless| xs@@24 index@@0)))))
 :qid |stdinbpl.1511:15|
 :skolemid |94|
 :pattern ( (get Heap@@27 xs@@24 index@@0))
)))
(assert (forall ((Heap@@28 T@U) (Mask@@12 T@U) (xs@@25 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@28) (MapType0Type RefType)) (= (type Mask@@12) (MapType1Type RefType realType))) (= (type xs@@25) RefType)) (and (state Heap@@28 Mask@@12) (or (< AssumeFunctionsAbove 8) (|length#trigger| (MapType0Select Heap@@28 null (list xs@@25)) xs@@25)))) (not (= xs@@25 null))) (> (|length'| Heap@@28 xs@@25) 0))
 :qid |stdinbpl.589:15|
 :skolemid |62|
 :pattern ( (state Heap@@28 Mask@@12) (|length'| Heap@@28 xs@@25))
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
 :qid |stdinbpl.361:18|
 :skolemid |42|
 :pattern ( (|Seq#Take| (|Seq#Append| s@@7 t@@0) n@@7))
)))
(assert (forall ((q@min@@1 Int) (q@max@@1 Int) ) (!  (and (=> (< q@min@@1 q@max@@1) (= (|Seq#Length| (|Seq#Range| q@min@@1 q@max@@1)) (- q@max@@1 q@min@@1))) (=> (<= q@max@@1 q@min@@1) (= (|Seq#Length| (|Seq#Range| q@min@@1 q@max@@1)) 0)))
 :qid |stdinbpl.539:15|
 :skolemid |55|
 :pattern ( (|Seq#Length| (|Seq#Range| q@min@@1 q@max@@1)))
)))
(assert (forall ((a T@U) (b T@U) ) (! (let ((T@@19 (SeqTypeInv0 (type a))))
 (=> (and (and (= (type a) (SeqType T@@19)) (= (type b) (SeqType T@@19))) (|Seq#Equal| a b)) (= a b)))
 :qid |stdinbpl.512:18|
 :skolemid |53|
 :pattern ( (|Seq#Equal| a b))
)))
(assert (forall ((Heap@@29 T@U) (Mask@@13 T@U) (xs@@26 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@29) (MapType0Type RefType)) (= (type Mask@@13) (MapType1Type RefType realType))) (= (type xs@@26) RefType)) (and (state Heap@@29 Mask@@13) (< AssumeFunctionsAbove 3))) (not (= xs@@26 null))) (= (ascending Heap@@29 xs@@26)  (or (= (MapType0Select Heap@@29 xs@@26 next) null) (and (<= (U_2_int (MapType0Select Heap@@29 xs@@26 val)) (head Heap@@29 (MapType0Select Heap@@29 xs@@26 next))) (|ascending'| Heap@@29 (MapType0Select Heap@@29 xs@@26 next))))))
 :qid |stdinbpl.1690:15|
 :skolemid |101|
 :pattern ( (state Heap@@29 Mask@@13) (ascending Heap@@29 xs@@26))
 :pattern ( (state Heap@@29 Mask@@13) (|ascending#triggerStateless| xs@@26) (|list#trigger| Heap@@29 (list xs@@26)) (|list#trigger| Heap@@29 (list xs@@26)))
)))
(assert (forall ((s@@8 T@U) (i@@2 Int) ) (! (let ((T@@20 (SeqTypeInv0 (type s@@8))))
 (=> (= (type s@@8) (SeqType T@@20)) (=> (and (<= 0 i@@2) (< i@@2 (|Seq#Length| s@@8))) (|Seq#ContainsTrigger| s@@8 (|Seq#Index| s@@8 i@@2)))))
 :qid |stdinbpl.405:18|
 :skolemid |49|
 :pattern ( (|Seq#Index| s@@8 i@@2))
)))
(assert (forall ((s0@@1 T@U) (s1@@1 T@U) ) (! (let ((T@@21 (SeqTypeInv0 (type s0@@1))))
 (=> (and (= (type s0@@1) (SeqType T@@21)) (= (type s1@@1) (SeqType T@@21))) (and (=> (= s0@@1 (|Seq#Empty| T@@21)) (= (|Seq#Append| s0@@1 s1@@1) s1@@1)) (=> (= s1@@1 (|Seq#Empty| T@@21)) (= (|Seq#Append| s0@@1 s1@@1) s0@@1)))))
 :qid |stdinbpl.224:18|
 :skolemid |27|
 :pattern ( (|Seq#Append| s0@@1 s1@@1))
)))
(assert (forall ((Heap@@30 T@U) (Mask@@14 T@U) (xs@@27 T@U) ) (!  (=> (and (and (and (= (type Heap@@30) (MapType0Type RefType)) (= (type Mask@@14) (MapType1Type RefType realType))) (= (type xs@@27) RefType)) (state Heap@@30 Mask@@14)) (= (|ascending'| Heap@@30 xs@@27) (|ascending#frame| (MapType0Select Heap@@30 null (list xs@@27)) xs@@27)))
 :qid |stdinbpl.1697:15|
 :skolemid |102|
 :pattern ( (state Heap@@30 Mask@@14) (|ascending'| Heap@@30 xs@@27))
 :pattern ( (state Heap@@30 Mask@@14) (|ascending#triggerStateless| xs@@27) (|list#trigger| Heap@@30 (list xs@@27)) (|list#trigger| Heap@@30 (list xs@@27)))
)))
(assert (forall ((t@@1 T@U) ) (! (= (|Seq#Index| (|Seq#Singleton| t@@1) 0) t@@1)
 :qid |stdinbpl.228:18|
 :skolemid |28|
 :pattern ( (|Seq#Singleton| t@@1))
)))
(assert (forall ((s@@9 T@U) ) (! (let ((T@@22 (SeqTypeInv0 (type s@@9))))
 (=> (= (type s@@9) (SeqType T@@22)) (<= 0 (|Seq#Length| s@@9))))
 :qid |stdinbpl.207:18|
 :skolemid |22|
 :pattern ( (|Seq#Length| s@@9))
)))
(assert (forall ((Heap@@31 T@U) (xs@@28 T@U) ) (!  (=> (and (= (type Heap@@31) (MapType0Type RefType)) (= (type xs@@28) RefType)) (and (= (ascending Heap@@31 xs@@28) (|ascending'| Heap@@31 xs@@28)) (dummyFunction (bool_2_U (|ascending#triggerStateless| xs@@28)))))
 :qid |stdinbpl.1680:15|
 :skolemid |99|
 :pattern ( (ascending Heap@@31 xs@@28))
)))
(assert (forall ((s0@@2 T@U) (s1@@2 T@U) ) (! (let ((T@@23 (SeqTypeInv0 (type s0@@2))))
 (=> (and (and (= (type s0@@2) (SeqType T@@23)) (= (type s1@@2) (SeqType T@@23))) (|Seq#Equal| s0@@2 s1@@2)) (and (= (|Seq#Length| s0@@2) (|Seq#Length| s1@@2)) (forall ((j@@4 Int) ) (!  (=> (and (<= 0 j@@4) (< j@@4 (|Seq#Length| s0@@2))) (= (|Seq#Index| s0@@2 j@@4) (|Seq#Index| s1@@2 j@@4)))
 :qid |stdinbpl.502:13|
 :skolemid |50|
 :pattern ( (|Seq#Index| s0@@2 j@@4))
 :pattern ( (|Seq#Index| s1@@2 j@@4))
)))))
 :qid |stdinbpl.499:18|
 :skolemid |51|
 :pattern ( (|Seq#Equal| s0@@2 s1@@2))
)))
(assert (forall ((Heap@@32 T@U) (ExhaleHeap@@4 T@U) (Mask@@15 T@U) (pm_f@@1 T@U) ) (! (let ((C@@1 (FieldTypeInv0 (type pm_f@@1))))
 (=> (and (and (and (and (and (= (type Heap@@32) (MapType0Type RefType)) (= (type ExhaleHeap@@4) (MapType0Type RefType))) (= (type Mask@@15) (MapType1Type RefType realType))) (= (type pm_f@@1) (FieldType C@@1 FrameTypeType))) (IdenticalOnKnownLocations Heap@@32 ExhaleHeap@@4 Mask@@15)) (and (HasDirectPerm Mask@@15 null pm_f@@1) (IsPredicateField pm_f@@1))) (forall ((o2 T@U) (f_2@@0 T@U) ) (! (let ((B@@5 (FieldTypeInv1 (type f_2@@0))))
(let ((A@@6 (FieldTypeInv0 (type f_2@@0))))
 (=> (and (and (= (type o2) RefType) (= (type f_2@@0) (FieldType A@@6 B@@5))) (U_2_bool (MapType1Select (MapType0Select Heap@@32 null (PredicateMaskField pm_f@@1)) o2 f_2@@0))) (= (MapType0Select Heap@@32 o2 f_2@@0) (MapType0Select ExhaleHeap@@4 o2 f_2@@0)))))
 :qid |stdinbpl.54:134|
 :skolemid |3|
 :pattern ( (MapType0Select ExhaleHeap@@4 o2 f_2@@0))
))))
 :qid |stdinbpl.52:19|
 :skolemid |4|
 :pattern ( (IdenticalOnKnownLocations Heap@@32 ExhaleHeap@@4 Mask@@15) (IsPredicateField pm_f@@1))
)))
(assert (forall ((Heap@@33 T@U) (ExhaleHeap@@5 T@U) (Mask@@16 T@U) (pm_f@@2 T@U) ) (! (let ((C@@2 (FieldTypeInv0 (type pm_f@@2))))
 (=> (and (and (and (and (and (= (type Heap@@33) (MapType0Type RefType)) (= (type ExhaleHeap@@5) (MapType0Type RefType))) (= (type Mask@@16) (MapType1Type RefType realType))) (= (type pm_f@@2) (FieldType C@@2 FrameTypeType))) (IdenticalOnKnownLocations Heap@@33 ExhaleHeap@@5 Mask@@16)) (and (HasDirectPerm Mask@@16 null pm_f@@2) (IsWandField pm_f@@2))) (forall ((o2@@0 T@U) (f_2@@1 T@U) ) (! (let ((B@@6 (FieldTypeInv1 (type f_2@@1))))
(let ((A@@7 (FieldTypeInv0 (type f_2@@1))))
 (=> (and (and (= (type o2@@0) RefType) (= (type f_2@@1) (FieldType A@@7 B@@6))) (U_2_bool (MapType1Select (MapType0Select Heap@@33 null (WandMaskField pm_f@@2)) o2@@0 f_2@@1))) (= (MapType0Select Heap@@33 o2@@0 f_2@@1) (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1)))))
 :qid |stdinbpl.67:129|
 :skolemid |6|
 :pattern ( (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1))
))))
 :qid |stdinbpl.65:19|
 :skolemid |7|
 :pattern ( (IdenticalOnKnownLocations Heap@@33 ExhaleHeap@@5 Mask@@16) (IsWandField pm_f@@2))
)))
(assert (forall ((xs@@29 T@U) ) (!  (=> (= (type xs@@29) RefType) (= (getPredWandId (list xs@@29)) 0))
 :qid |stdinbpl.1852:15|
 :skolemid |106|
 :pattern ( (list xs@@29))
)))
(assert (forall ((t@@2 T@U) ) (! (= (|Seq#Length| (|Seq#Singleton| t@@2)) 1)
 :qid |stdinbpl.215:18|
 :skolemid |25|
 :pattern ( (|Seq#Singleton| t@@2))
)))
(assert (forall ((Mask@@17 T@U) (o_2@@2 T@U) (f_4@@2 T@U) ) (! (let ((B@@7 (FieldTypeInv1 (type f_4@@2))))
(let ((A@@8 (FieldTypeInv0 (type f_4@@2))))
 (=> (and (and (and (= (type Mask@@17) (MapType1Type RefType realType)) (= (type o_2@@2) RefType)) (= (type f_4@@2) (FieldType A@@8 B@@7))) (GoodMask Mask@@17)) (and (>= (U_2_real (MapType1Select Mask@@17 o_2@@2 f_4@@2)) NoPerm) (=> (and (and (GoodMask Mask@@17) (not (IsPredicateField f_4@@2))) (not (IsWandField f_4@@2))) (<= (U_2_real (MapType1Select Mask@@17 o_2@@2 f_4@@2)) FullPerm))))))
 :qid |stdinbpl.128:22|
 :skolemid |16|
 :pattern ( (GoodMask Mask@@17) (MapType1Select Mask@@17 o_2@@2 f_4@@2))
)))
(assert (forall ((Heap@@34 T@U) (Mask@@18 T@U) (xs@@30 T@U) ) (!  (=> (and (and (and (= (type Heap@@34) (MapType0Type RefType)) (= (type Mask@@18) (MapType1Type RefType realType))) (= (type xs@@30) RefType)) (state Heap@@34 Mask@@18)) (= (|length'| Heap@@34 xs@@30) (|length#frame| (MapType0Select Heap@@34 null (list xs@@30)) xs@@30)))
 :qid |stdinbpl.583:15|
 :skolemid |61|
 :pattern ( (state Heap@@34 Mask@@18) (|length'| Heap@@34 xs@@30))
 :pattern ( (state Heap@@34 Mask@@18) (|length#triggerStateless| xs@@30) (|list#trigger| Heap@@34 (list xs@@30)))
)))
(assert (forall ((Heap@@35 T@U) (Mask@@19 T@U) (xs@@31 T@U) ) (!  (=> (and (and (and (= (type Heap@@35) (MapType0Type RefType)) (= (type Mask@@19) (MapType1Type RefType realType))) (= (type xs@@31) RefType)) (state Heap@@35 Mask@@19)) (= (|sum'| Heap@@35 xs@@31) (|sum#frame| (MapType0Select Heap@@35 null (list xs@@31)) xs@@31)))
 :qid |stdinbpl.735:15|
 :skolemid |67|
 :pattern ( (state Heap@@35 Mask@@19) (|sum'| Heap@@35 xs@@31))
 :pattern ( (state Heap@@35 Mask@@19) (|sum#triggerStateless| xs@@31) (|list#trigger| Heap@@35 (list xs@@31)))
)))
(assert (forall ((Heap@@36 T@U) (Mask@@20 T@U) (xs@@32 T@U) ) (!  (=> (and (and (and (= (type Heap@@36) (MapType0Type RefType)) (= (type Mask@@20) (MapType1Type RefType realType))) (= (type xs@@32) RefType)) (state Heap@@36 Mask@@20)) (= (|head'| Heap@@36 xs@@32) (|head#frame| (MapType0Select Heap@@36 null (list xs@@32)) xs@@32)))
 :qid |stdinbpl.877:15|
 :skolemid |72|
 :pattern ( (state Heap@@36 Mask@@20) (|head'| Heap@@36 xs@@32))
)))
(assert (forall ((arg0@@43 T@U) (arg1@@20 T@U) ) (! (= (type (|tail#frame| arg0@@43 arg1@@20)) RefType)
 :qid |funType:tail#frame|
 :pattern ( (|tail#frame| arg0@@43 arg1@@20))
)))
(assert (forall ((Heap@@37 T@U) (Mask@@21 T@U) (xs@@33 T@U) ) (!  (=> (and (and (and (= (type Heap@@37) (MapType0Type RefType)) (= (type Mask@@21) (MapType1Type RefType realType))) (= (type xs@@33) RefType)) (state Heap@@37 Mask@@21)) (= (|tail'| Heap@@37 xs@@33) (|tail#frame| (MapType0Select Heap@@37 null (list xs@@33)) xs@@33)))
 :qid |stdinbpl.989:15|
 :skolemid |77|
 :pattern ( (state Heap@@37 Mask@@21) (|tail'| Heap@@37 xs@@33))
)))
(assert (forall ((Heap@@38 T@U) (Mask@@22 T@U) (xs@@34 T@U) ) (!  (=> (and (and (and (= (type Heap@@38) (MapType0Type RefType)) (= (type Mask@@22) (MapType1Type RefType realType))) (= (type xs@@34) RefType)) (state Heap@@38 Mask@@22)) (= (|last'| Heap@@38 xs@@34) (|last#frame| (MapType0Select Heap@@38 null (list xs@@34)) xs@@34)))
 :qid |stdinbpl.1101:15|
 :skolemid |82|
 :pattern ( (state Heap@@38 Mask@@22) (|last'| Heap@@38 xs@@34))
 :pattern ( (state Heap@@38 Mask@@22) (|last#triggerStateless| xs@@34) (|list#trigger| Heap@@38 (list xs@@34)))
)))
(assert (forall ((arg0@@44 T@U) (arg1@@21 T@U) ) (! (= (type (|elems#frame| arg0@@44 arg1@@21)) (SeqType intType))
 :qid |funType:elems#frame|
 :pattern ( (|elems#frame| arg0@@44 arg1@@21))
)))
(assert (forall ((Heap@@39 T@U) (Mask@@23 T@U) (xs@@35 T@U) ) (!  (=> (and (and (and (= (type Heap@@39) (MapType0Type RefType)) (= (type Mask@@23) (MapType1Type RefType realType))) (= (type xs@@35) RefType)) (state Heap@@39 Mask@@23)) (= (|elems'| Heap@@39 xs@@35) (|elems#frame| (MapType0Select Heap@@39 null (list xs@@35)) xs@@35)))
 :qid |stdinbpl.1386:15|
 :skolemid |92|
 :pattern ( (state Heap@@39 Mask@@23) (|elems'| Heap@@39 xs@@35))
 :pattern ( (state Heap@@39 Mask@@23) (|elems#triggerStateless| xs@@35) (|list#trigger| Heap@@39 (list xs@@35)))
)))
(assert (forall ((o T@U) (f T@U) (Heap@@40 T@U) ) (!  (=> (and (and (and (= (type o) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap@@40) (MapType0Type RefType))) (U_2_bool (MapType0Select Heap@@40 o $allocated))) (U_2_bool (MapType0Select Heap@@40 (MapType0Select Heap@@40 o f) $allocated)))
 :qid |stdinbpl.31:15|
 :skolemid |0|
 :pattern ( (MapType0Select Heap@@40 o f))
)))
(assert (forall ((s@@10 T@U) (t@@3 T@U) (n@@8 Int) ) (! (let ((T@@24 (SeqTypeInv0 (type s@@10))))
 (=> (and (and (= (type s@@10) (SeqType T@@24)) (= (type t@@3) (SeqType T@@24))) (and (< 0 n@@8) (<= n@@8 (|Seq#Length| s@@10)))) (= (|Seq#Take| (|Seq#Append| s@@10 t@@3) n@@8) (|Seq#Take| s@@10 n@@8))))
 :qid |stdinbpl.357:18|
 :skolemid |41|
 :pattern ( (|Seq#Take| (|Seq#Append| s@@10 t@@3) n@@8))
)))
(assert (forall ((s@@11 T@U) (i@@3 Int) (v@@1 T@U) ) (! (let ((T@@25 (type v@@1)))
 (=> (= (type s@@11) (SeqType T@@25)) (=> (and (<= 0 i@@3) (< i@@3 (|Seq#Length| s@@11))) (= (|Seq#Length| (|Seq#Update| s@@11 i@@3 v@@1)) (|Seq#Length| s@@11)))))
 :qid |stdinbpl.256:18|
 :skolemid |34|
 :pattern ( (|Seq#Length| (|Seq#Update| s@@11 i@@3 v@@1)))
 :pattern ( (|Seq#Length| s@@11) (|Seq#Update| s@@11 i@@3 v@@1))
)))
(assert (forall ((xs@@36 T@U) ) (!  (=> (= (type xs@@36) RefType) (= (PredicateMaskField (list xs@@36)) (|list#sm| xs@@36)))
 :qid |stdinbpl.1844:15|
 :skolemid |104|
 :pattern ( (PredicateMaskField (list xs@@36)))
)))
(assert (forall ((s@@12 T@U) (t@@4 T@U) (n@@9 Int) ) (! (let ((T@@26 (SeqTypeInv0 (type s@@12))))
 (=> (and (and (= (type s@@12) (SeqType T@@26)) (= (type t@@4) (SeqType T@@26))) (and (< 0 n@@9) (<= n@@9 (|Seq#Length| s@@12)))) (= (|Seq#Drop| (|Seq#Append| s@@12 t@@4) n@@9) (|Seq#Append| (|Seq#Drop| s@@12 n@@9) t@@4))))
 :qid |stdinbpl.370:18|
 :skolemid |43|
 :pattern ( (|Seq#Drop| (|Seq#Append| s@@12 t@@4) n@@9))
)))
(assert (forall ((s@@13 T@U) (n@@10 Int) (i@@4 Int) ) (! (let ((T@@27 (SeqTypeInv0 (type s@@13))))
 (=> (= (type s@@13) (SeqType T@@27)) (=> (and (and (< 0 n@@10) (<= n@@10 i@@4)) (< i@@4 (|Seq#Length| s@@13))) (and (= (|Seq#Add| (|Seq#Sub| i@@4 n@@10) n@@10) i@@4) (= (|Seq#Index| (|Seq#Drop| s@@13 n@@10) (|Seq#Sub| i@@4 n@@10)) (|Seq#Index| s@@13 i@@4))))))
 :qid |stdinbpl.307:18|
 :skolemid |40|
 :pattern ( (|Seq#Drop| s@@13 n@@10) (|Seq#Index| s@@13 i@@4))
)))
(assert (forall ((Heap@@41 T@U) (Mask@@24 T@U) (xs@@37 T@U) (x@@12 Int) ) (!  (=> (and (and (and (= (type Heap@@41) (MapType0Type RefType)) (= (type Mask@@24) (MapType1Type RefType realType))) (= (type xs@@37) RefType)) (state Heap@@41 Mask@@24)) (= (|contains'| Heap@@41 xs@@37 x@@12) (|contains#frame| (MapType0Select Heap@@41 null (list xs@@37)) xs@@37 x@@12)))
 :qid |stdinbpl.1243:15|
 :skolemid |87|
 :pattern ( (state Heap@@41 Mask@@24) (|contains'| Heap@@41 xs@@37 x@@12))
 :pattern ( (state Heap@@41 Mask@@24) (|contains#triggerStateless| xs@@37 x@@12) (|list#trigger| Heap@@41 (list xs@@37)))
)))
(assert (forall ((s0@@3 T@U) (s1@@3 T@U) (n@@11 Int) ) (! (let ((T@@28 (SeqTypeInv0 (type s0@@3))))
 (=> (and (= (type s0@@3) (SeqType T@@28)) (= (type s1@@3) (SeqType T@@28))) (=> (and (and (and (not (= s0@@3 (|Seq#Empty| T@@28))) (not (= s1@@3 (|Seq#Empty| T@@28)))) (<= 0 n@@11)) (< n@@11 (|Seq#Length| s0@@3))) (= (|Seq#Index| (|Seq#Append| s0@@3 s1@@3) n@@11) (|Seq#Index| s0@@3 n@@11)))))
 :qid |stdinbpl.247:18|
 :skolemid |31|
 :pattern ( (|Seq#Index| (|Seq#Append| s0@@3 s1@@3) n@@11))
 :pattern ( (|Seq#Index| s0@@3 n@@11) (|Seq#Append| s0@@3 s1@@3))
)))
(assert (forall ((Heap@@42 T@U) (o@@0 T@U) (f_3 T@U) (v@@2 T@U) ) (! (let ((B@@8 (type v@@2)))
(let ((A@@9 (FieldTypeInv0 (type f_3))))
 (=> (and (and (= (type Heap@@42) (MapType0Type RefType)) (= (type o@@0) RefType)) (= (type f_3) (FieldType A@@9 B@@8))) (succHeap Heap@@42 (MapType0Store Heap@@42 o@@0 f_3 v@@2)))))
 :qid |stdinbpl.78:22|
 :skolemid |9|
 :pattern ( (MapType0Store Heap@@42 o@@0 f_3 v@@2))
)))
(assert (forall ((s0@@4 T@U) (s1@@4 T@U) (m@@7 Int) ) (! (let ((T@@29 (SeqTypeInv0 (type s0@@4))))
 (=> (and (= (type s0@@4) (SeqType T@@29)) (= (type s1@@4) (SeqType T@@29))) (=> (and (and (and (not (= s0@@4 (|Seq#Empty| T@@29))) (not (= s1@@4 (|Seq#Empty| T@@29)))) (<= 0 m@@7)) (< m@@7 (|Seq#Length| s1@@4))) (and (= (|Seq#Sub| (|Seq#Add| m@@7 (|Seq#Length| s0@@4)) (|Seq#Length| s0@@4)) m@@7) (= (|Seq#Index| (|Seq#Append| s0@@4 s1@@4) (|Seq#Add| m@@7 (|Seq#Length| s0@@4))) (|Seq#Index| s1@@4 m@@7))))))
 :qid |stdinbpl.252:18|
 :skolemid |33|
 :pattern ( (|Seq#Index| s1@@4 m@@7) (|Seq#Append| s0@@4 s1@@4))
)))
(assert (forall ((Heap@@43 T@U) (Mask@@25 T@U) (xs@@38 T@U) (index@@1 Int) ) (!  (=> (and (and (and (and (= (type Heap@@43) (MapType0Type RefType)) (= (type Mask@@25) (MapType1Type RefType realType))) (= (type xs@@38) RefType)) (and (state Heap@@43 Mask@@25) (< AssumeFunctionsAbove 5))) (and (not (= xs@@38 null)) (and (<= 0 index@@1) (< index@@1 (length Heap@@43 xs@@38))))) (= (get Heap@@43 xs@@38 index@@1) (ite (= index@@1 0) (U_2_int (MapType0Select Heap@@43 xs@@38 val)) (|get'| Heap@@43 (MapType0Select Heap@@43 xs@@38 next) (- index@@1 1)))))
 :qid |stdinbpl.1521:15|
 :skolemid |96|
 :pattern ( (state Heap@@43 Mask@@25) (get Heap@@43 xs@@38 index@@1))
 :pattern ( (state Heap@@43 Mask@@25) (|get#triggerStateless| xs@@38 index@@1) (|list#trigger| Heap@@43 (list xs@@38)))
)))
(assert (= (type ZeroPMask) (MapType1Type RefType boolType)))
(assert (forall ((o_2@@3 T@U) (f_4@@3 T@U) ) (! (let ((B@@9 (FieldTypeInv1 (type f_4@@3))))
(let ((A@@10 (FieldTypeInv0 (type f_4@@3))))
 (=> (and (= (type o_2@@3) RefType) (= (type f_4@@3) (FieldType A@@10 B@@9))) (not (U_2_bool (MapType1Select ZeroPMask o_2@@3 f_4@@3))))))
 :qid |stdinbpl.112:22|
 :skolemid |14|
 :pattern ( (MapType1Select ZeroPMask o_2@@3 f_4@@3))
)))
(assert (forall ((s@@14 T@U) (x@@13 T@U) (i@@5 Int) ) (! (let ((T@@30 (type x@@13)))
 (=> (= (type s@@14) (SeqType T@@30)) (=> (and (and (<= 0 i@@5) (< i@@5 (|Seq#Length| s@@14))) (= (|Seq#Index| s@@14 i@@5) x@@13)) (|Seq#Contains| s@@14 x@@13))))
 :qid |stdinbpl.403:18|
 :skolemid |48|
 :pattern ( (|Seq#Contains| s@@14 x@@13) (|Seq#Index| s@@14 i@@5))
)))
(assert (forall ((s0@@5 T@U) (s1@@5 T@U) ) (! (let ((T@@31 (SeqTypeInv0 (type s0@@5))))
 (=> (and (= (type s0@@5) (SeqType T@@31)) (= (type s1@@5) (SeqType T@@31))) (or (or (and (= s0@@5 s1@@5) (|Seq#Equal| s0@@5 s1@@5)) (and (and (not (= s0@@5 s1@@5)) (not (|Seq#Equal| s0@@5 s1@@5))) (not (= (|Seq#Length| s0@@5) (|Seq#Length| s1@@5))))) (and (and (and (and (and (and (not (= s0@@5 s1@@5)) (not (|Seq#Equal| s0@@5 s1@@5))) (= (|Seq#Length| s0@@5) (|Seq#Length| s1@@5))) (= (|Seq#SkolemDiff| s0@@5 s1@@5) (|Seq#SkolemDiff| s1@@5 s0@@5))) (<= 0 (|Seq#SkolemDiff| s0@@5 s1@@5))) (< (|Seq#SkolemDiff| s0@@5 s1@@5) (|Seq#Length| s0@@5))) (not (= (|Seq#Index| s0@@5 (|Seq#SkolemDiff| s0@@5 s1@@5)) (|Seq#Index| s1@@5 (|Seq#SkolemDiff| s0@@5 s1@@5))))))))
 :qid |stdinbpl.507:18|
 :skolemid |52|
 :pattern ( (|Seq#Equal| s0@@5 s1@@5))
)))
(assert (forall ((p@@1 T@U) (v_1@@0 T@U) (q T@U) (w@@0 T@U) (r T@U) (u T@U) ) (! (let ((C@@3 (FieldTypeInv0 (type r))))
(let ((B@@10 (FieldTypeInv0 (type q))))
(let ((A@@11 (FieldTypeInv0 (type p@@1))))
 (=> (and (and (and (and (and (and (= (type p@@1) (FieldType A@@11 FrameTypeType)) (= (type v_1@@0) FrameTypeType)) (= (type q) (FieldType B@@10 FrameTypeType))) (= (type w@@0) FrameTypeType)) (= (type r) (FieldType C@@3 FrameTypeType))) (= (type u) FrameTypeType)) (and (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))) (InsidePredicate p@@1 v_1@@0 r u)))))
 :qid |stdinbpl.176:25|
 :skolemid |20|
 :pattern ( (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))
)))
(assert (forall ((Heap@@44 T@U) (Mask@@26 T@U) (xs@@39 T@U) (index@@2 Int) ) (!  (=> (and (and (and (= (type Heap@@44) (MapType0Type RefType)) (= (type Mask@@26) (MapType1Type RefType realType))) (= (type xs@@39) RefType)) (state Heap@@44 Mask@@26)) (= (|get'| Heap@@44 xs@@39 index@@2) (|get#frame| (MapType0Select Heap@@44 null (list xs@@39)) xs@@39 index@@2)))
 :qid |stdinbpl.1528:15|
 :skolemid |97|
 :pattern ( (state Heap@@44 Mask@@26) (|get'| Heap@@44 xs@@39 index@@2))
 :pattern ( (state Heap@@44 Mask@@26) (|get#triggerStateless| xs@@39 index@@2) (|list#trigger| Heap@@44 (list xs@@39)))
)))
(assert (forall ((s@@15 T@U) ) (! (let ((T@@32 (SeqTypeInv0 (type s@@15))))
 (=> (and (= (type s@@15) (SeqType T@@32)) (= (|Seq#Length| s@@15) 0)) (= s@@15 (|Seq#Empty| T@@32))))
 :qid |stdinbpl.211:18|
 :skolemid |24|
 :pattern ( (|Seq#Length| s@@15))
)))
(assert (forall ((s@@16 T@U) (n@@12 Int) ) (! (let ((T@@33 (SeqTypeInv0 (type s@@16))))
 (=> (and (= (type s@@16) (SeqType T@@33)) (<= n@@12 0)) (= (|Seq#Take| s@@16 n@@12) (|Seq#Empty| T@@33))))
 :qid |stdinbpl.386:18|
 :skolemid |46|
 :pattern ( (|Seq#Take| s@@16 n@@12))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
(assert (forall ((Heap@@45 T@U) (Mask@@27 T@U) (xs@@40 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@45) (MapType0Type RefType)) (= (type Mask@@27) (MapType1Type RefType realType))) (= (type xs@@40) RefType)) (and (state Heap@@45 Mask@@27) (< AssumeFunctionsAbove 1))) (not (= xs@@40 null))) (= (sum Heap@@45 xs@@40) (+ (U_2_int (MapType0Select Heap@@45 xs@@40 val)) (ite (= (MapType0Select Heap@@45 xs@@40 next) null) 0 (|sum'| Heap@@45 (MapType0Select Heap@@45 xs@@40 next))))))
 :qid |stdinbpl.728:15|
 :skolemid |66|
 :pattern ( (state Heap@@45 Mask@@27) (sum Heap@@45 xs@@40))
 :pattern ( (state Heap@@45 Mask@@27) (|sum#triggerStateless| xs@@40) (|list#trigger| Heap@@45 (list xs@@40)))
)))
(assert (forall ((Heap@@46 T@U) (xs@@41 T@U) (x@@14 Int) ) (!  (=> (and (= (type Heap@@46) (MapType0Type RefType)) (= (type xs@@41) RefType)) (and (= (contains Heap@@46 xs@@41 x@@14) (|contains'| Heap@@46 xs@@41 x@@14)) (dummyFunction (bool_2_U (|contains#triggerStateless| xs@@41 x@@14)))))
 :qid |stdinbpl.1226:15|
 :skolemid |84|
 :pattern ( (contains Heap@@46 xs@@41 x@@14))
)))
(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun UnfoldingMask@5 () T@U)
(declare-fun UnfoldingMask@4 () T@U)
(declare-fun Heap@@47 () T@U)
(declare-fun xs@@42 () T@U)
(declare-fun Heap@1 () T@U)
(declare-fun Heap@3 () T@U)
(declare-fun newPMask@0 () T@U)
(declare-fun Heap@2 () T@U)
(declare-fun Heap@0 () T@U)
(declare-fun |contains#trigger| (T@U T@U Int) Bool)
(declare-fun x@@15 () Int)
(declare-fun UnfoldingMask@2 () T@U)
(declare-fun UnfoldingMask@3 () T@U)
(declare-fun UnfoldingMask@0 () T@U)
(declare-fun Mask@0 () T@U)
(declare-fun UnfoldingMask@1 () T@U)
(declare-fun CombineFrames (T@U T@U) T@U)
(declare-fun FrameFragment (T@U) T@U)
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (= (type Heap@1) (MapType0Type RefType)) (= (type xs@@42) RefType)) (= (type newPMask@0) (MapType1Type RefType boolType))) (= (type Heap@2) (MapType0Type RefType))) (= (type Heap@3) (MapType0Type RefType))) (= (type Heap@0) (MapType0Type RefType))) (= (type Heap@@47) (MapType0Type RefType))) (= (type UnfoldingMask@5) (MapType1Type RefType realType))) (= (type UnfoldingMask@4) (MapType1Type RefType realType))) (= (type UnfoldingMask@3) (MapType1Type RefType realType))) (= (type UnfoldingMask@2) (MapType1Type RefType realType))) (= (type UnfoldingMask@0) (MapType1Type RefType realType))) (= (type Mask@0) (MapType1Type RefType realType))) (= (type UnfoldingMask@1) (MapType1Type RefType realType))) (forall ((arg0@@45 T@U) (arg1@@22 T@U) ) (! (= (type (CombineFrames arg0@@45 arg1@@22)) FrameTypeType)
 :qid |funType:CombineFrames|
 :pattern ( (CombineFrames arg0@@45 arg1@@22))
))) (forall ((arg0@@46 T@U) ) (! (= (type (FrameFragment arg0@@46)) FrameTypeType)
 :qid |funType:FrameFragment|
 :pattern ( (FrameFragment arg0@@46))
))))
(set-info :boogie-vc-id |contains#definedness|)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 26) (let ((anon9_correct  (=> (and (= UnfoldingMask@5 (MapType1Store UnfoldingMask@4 null (list (MapType0Select Heap@@47 xs@@42 next)) (real_2_U (- (U_2_real (MapType1Select UnfoldingMask@4 null (list (MapType0Select Heap@@47 xs@@42 next)))) FullPerm)))) (= (ControlFlow 0 9) (- 0 8))) (not (= (MapType0Select Heap@@47 xs@@42 next) null)))))
(let ((anon19_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 12) 9)) anon9_correct)))
(let ((anon19_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 10) (- 0 11)) (<= FullPerm (U_2_real (MapType1Select UnfoldingMask@4 null (list (MapType0Select Heap@@47 xs@@42 next)))))) (=> (<= FullPerm (U_2_real (MapType1Select UnfoldingMask@4 null (list (MapType0Select Heap@@47 xs@@42 next))))) (=> (= (ControlFlow 0 10) 9) anon9_correct))))))
(let ((anon13_correct true))
(let ((anon20_Else_correct  (=> (= (MapType0Select Heap@1 xs@@42 next) null) (=> (and (= Heap@3 Heap@1) (= (ControlFlow 0 3) 1)) anon13_correct))))
(let ((anon20_Then_correct  (=> (not (= (MapType0Select Heap@1 xs@@42 next) null)) (=> (and (and (forall ((o_8 T@U) (f_12 T@U) ) (! (let ((B@@11 (FieldTypeInv1 (type f_12))))
(let ((A@@12 (FieldTypeInv0 (type f_12))))
 (=> (and (and (= (type o_8) RefType) (= (type f_12) (FieldType A@@12 B@@11))) (or (U_2_bool (MapType1Select (MapType0Select Heap@1 null (|list#sm| xs@@42)) o_8 f_12)) (U_2_bool (MapType1Select (MapType0Select Heap@1 null (|list#sm| (MapType0Select Heap@1 xs@@42 next))) o_8 f_12)))) (U_2_bool (MapType1Select newPMask@0 o_8 f_12)))))
 :qid |stdinbpl.1350:33|
 :skolemid |88|
 :pattern ( (MapType1Select newPMask@0 o_8 f_12))
)) (= Heap@2 (MapType0Store Heap@1 null (|list#sm| xs@@42) newPMask@0))) (and (= Heap@3 Heap@2) (= (ControlFlow 0 2) 1))) anon13_correct))))
(let ((anon11_correct  (=> (and (= Heap@0 (MapType0Store Heap@@47 null (|list#sm| xs@@42) (MapType1Store (MapType0Select Heap@@47 null (|list#sm| xs@@42)) xs@@42 next (bool_2_U true)))) (= Heap@1 (MapType0Store Heap@0 null (|list#sm| xs@@42) (MapType1Store (MapType0Select Heap@0 null (|list#sm| xs@@42)) xs@@42 val (bool_2_U true))))) (and (=> (= (ControlFlow 0 4) 2) anon20_Then_correct) (=> (= (ControlFlow 0 4) 3) anon20_Else_correct)))))
(let ((anon18_Else_correct  (=> (and (|contains#trigger| (MapType0Select Heap@@47 null (list (MapType0Select Heap@@47 xs@@42 next))) (MapType0Select Heap@@47 xs@@42 next) x@@15) (= (ControlFlow 0 7) 4)) anon11_correct)))
(let ((anon17_Then_correct  (=> (not (= (MapType0Select Heap@@47 xs@@42 next) null)) (and (=> (= (ControlFlow 0 13) (- 0 14)) (HasDirectPerm UnfoldingMask@4 xs@@42 next)) (=> (HasDirectPerm UnfoldingMask@4 xs@@42 next) (and (and (=> (= (ControlFlow 0 13) 7) anon18_Else_correct) (=> (= (ControlFlow 0 13) 10) anon19_Then_correct)) (=> (= (ControlFlow 0 13) 12) anon19_Else_correct)))))))
(let ((anon17_Else_correct  (=> (and (= (MapType0Select Heap@@47 xs@@42 next) null) (= (ControlFlow 0 6) 4)) anon11_correct)))
(let ((anon16_Then_correct  (=> (not (= x@@15 (U_2_int (MapType0Select Heap@@47 xs@@42 val)))) (and (=> (= (ControlFlow 0 15) (- 0 16)) (HasDirectPerm UnfoldingMask@4 xs@@42 next)) (=> (HasDirectPerm UnfoldingMask@4 xs@@42 next) (and (=> (= (ControlFlow 0 15) 13) anon17_Then_correct) (=> (= (ControlFlow 0 15) 6) anon17_Else_correct)))))))
(let ((anon16_Else_correct  (=> (and (= x@@15 (U_2_int (MapType0Select Heap@@47 xs@@42 val))) (= (ControlFlow 0 5) 4)) anon11_correct)))
(let ((anon4_correct  (=> (state Heap@@47 UnfoldingMask@4) (and (=> (= (ControlFlow 0 17) (- 0 18)) (HasDirectPerm UnfoldingMask@4 xs@@42 val)) (=> (HasDirectPerm UnfoldingMask@4 xs@@42 val) (and (=> (= (ControlFlow 0 17) 15) anon16_Then_correct) (=> (= (ControlFlow 0 17) 5) anon16_Else_correct)))))))
(let ((anon15_Else_correct  (=> (= (MapType0Select Heap@@47 xs@@42 next) null) (=> (and (= UnfoldingMask@4 UnfoldingMask@2) (= (ControlFlow 0 20) 17)) anon4_correct))))
(let ((anon15_Then_correct  (=> (not (= (MapType0Select Heap@@47 xs@@42 next) null)) (=> (and (= UnfoldingMask@3 (MapType1Store UnfoldingMask@2 null (list (MapType0Select Heap@@47 xs@@42 next)) (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@2 null (list (MapType0Select Heap@@47 xs@@42 next)))) FullPerm)))) (InsidePredicate (list xs@@42) (MapType0Select Heap@@47 null (list xs@@42)) (list (MapType0Select Heap@@47 xs@@42 next)) (MapType0Select Heap@@47 null (list (MapType0Select Heap@@47 xs@@42 next))))) (=> (and (and (state Heap@@47 UnfoldingMask@3) (not (= (MapType0Select Heap@@47 xs@@42 next) null))) (and (= UnfoldingMask@4 UnfoldingMask@3) (= (ControlFlow 0 19) 17))) anon4_correct)))))
(let ((anon2_correct  (=> (= UnfoldingMask@0 (MapType1Store Mask@0 null (list xs@@42) (real_2_U (- (U_2_real (MapType1Select Mask@0 null (list xs@@42))) FullPerm)))) (=> (and (not (= xs@@42 null)) (= UnfoldingMask@1 (MapType1Store UnfoldingMask@0 xs@@42 next (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@0 xs@@42 next)) FullPerm))))) (=> (and (and (state Heap@@47 UnfoldingMask@1) (not (= xs@@42 null))) (and (= UnfoldingMask@2 (MapType1Store UnfoldingMask@1 xs@@42 val (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@1 xs@@42 val)) FullPerm)))) (state Heap@@47 UnfoldingMask@2))) (and (=> (= (ControlFlow 0 21) 19) anon15_Then_correct) (=> (= (ControlFlow 0 21) 20) anon15_Else_correct)))))))
(let ((anon14_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 24) 21)) anon2_correct)))
(let ((anon14_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 22) (- 0 23)) (<= FullPerm (U_2_real (MapType1Select Mask@0 null (list xs@@42))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@0 null (list xs@@42)))) (=> (= (ControlFlow 0 22) 21) anon2_correct))))))
(let ((anon0_correct  (=> (state Heap@@47 ZeroMask) (=> (and (and (and (U_2_bool (MapType0Select Heap@@47 xs@@42 $allocated)) (= AssumeFunctionsAbove 2)) (and (= Mask@0 (MapType1Store ZeroMask null (list xs@@42) (real_2_U (+ (U_2_real (MapType1Select ZeroMask null (list xs@@42))) FullPerm)))) (state Heap@@47 Mask@0))) (and (and (not (= xs@@42 null)) (state Heap@@47 Mask@0)) (and (|list#trigger| Heap@@47 (list xs@@42)) (= (MapType0Select Heap@@47 null (list xs@@42)) (CombineFrames (FrameFragment (MapType0Select Heap@@47 xs@@42 next)) (CombineFrames (FrameFragment (MapType0Select Heap@@47 xs@@42 val)) (FrameFragment (ite (not (= (MapType0Select Heap@@47 xs@@42 next) null)) (MapType0Select Heap@@47 null (list (MapType0Select Heap@@47 xs@@42 next))) EmptyFrame)))))))) (and (=> (= (ControlFlow 0 25) 22) anon14_Then_correct) (=> (= (ControlFlow 0 25) 24) anon14_Else_correct))))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 26) 25) anon0_correct)))
PreconditionGeneratedEntry_correct)))))))))))))))))))))
))
(check-sat)
(pop 1)
; Valid
(get-info :rlimit)
(reset)
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
(declare-fun FieldType (T@T T@T) T@T)
(declare-fun FieldTypeInv0 (T@T) T@T)
(declare-fun FieldTypeInv1 (T@T) T@T)
(declare-fun NormalFieldType () T@T)
(declare-fun RefType () T@T)
(declare-fun |Seq#Length| (T@U) Int)
(declare-fun |Seq#Drop| (T@U Int) T@U)
(declare-fun SeqTypeInv0 (T@T) T@T)
(declare-fun SeqType (T@T) T@T)
(declare-fun state (T@U T@U) Bool)
(declare-fun length (T@U T@U) Int)
(declare-fun |length#triggerStateless| (T@U) Int)
(declare-fun |list#trigger| (T@U T@U) Bool)
(declare-fun list (T@U) T@U)
(declare-fun MapType0Type (T@T) T@T)
(declare-fun MapType1Type (T@T T@T) T@T)
(declare-fun AssumeFunctionsAbove () Int)
(declare-fun null () T@U)
(declare-fun MapType0Select (T@U T@U T@U) T@U)
(declare-fun |length'| (T@U T@U) Int)
(declare-fun MapType0TypeInv0 (T@T) T@T)
(declare-fun MapType0Store (T@U T@U T@U T@U) T@U)
(declare-fun MapType1TypeInv0 (T@T) T@T)
(declare-fun MapType1TypeInv1 (T@T) T@T)
(declare-fun MapType1Select (T@U T@U T@U) T@U)
(declare-fun MapType1Store (T@U T@U T@U T@U) T@U)
(declare-fun PredicateType_listType () T@T)
(declare-fun FrameTypeType () T@T)
(declare-fun succHeap (T@U T@U) Bool)
(declare-fun succHeapTrans (T@U T@U) Bool)
(declare-fun GoodMask (T@U) Bool)
(declare-fun |contains'| (T@U T@U Int) Bool)
(declare-fun dummyFunction (T@U) Bool)
(declare-fun |contains#triggerStateless| (T@U Int) Bool)
(declare-fun |get'| (T@U T@U Int) Int)
(declare-fun |get#triggerStateless| (T@U Int) Int)
(declare-fun |Seq#Index| (T@U Int) T@U)
(declare-fun |Seq#Sub| (Int Int) Int)
(declare-fun |Seq#Add| (Int Int) Int)
(declare-fun IdenticalOnKnownLocations (T@U T@U T@U) Bool)
(declare-fun IsPredicateField (T@U) Bool)
(declare-fun PredicateMaskField (T@U) T@U)
(declare-fun HasDirectPerm (T@U T@U T@U) Bool)
(declare-fun IsWandField (T@U) Bool)
(declare-fun WandMaskField (T@U) T@U)
(declare-fun |sum'| (T@U T@U) Int)
(declare-fun |sum#triggerStateless| (T@U) Int)
(declare-fun |head'| (T@U T@U) Int)
(declare-fun |head#triggerStateless| (T@U) Int)
(declare-fun |tail'| (T@U T@U) T@U)
(declare-fun |tail#triggerStateless| (T@U) T@U)
(declare-fun |last'| (T@U T@U) Int)
(declare-fun |last#triggerStateless| (T@U) Int)
(declare-fun |elems'| (T@U T@U) T@U)
(declare-fun |elems#triggerStateless| (T@U) T@U)
(declare-fun |ascending'| (T@U T@U) Bool)
(declare-fun |ascending#triggerStateless| (T@U) Bool)
(declare-fun |list#everUsed| (T@U) Bool)
(declare-fun |Seq#Update| (T@U Int T@U) T@U)
(declare-fun |Seq#Take| (T@U Int) T@U)
(declare-fun |Seq#Contains| (T@U T@U) Bool)
(declare-fun |Seq#Range| (Int Int) T@U)
(declare-fun contains (T@U T@U Int) Bool)
(declare-fun elems (T@U T@U) T@U)
(declare-fun |Seq#Append| (T@U T@U) T@U)
(declare-fun |Seq#Singleton| (T@U) T@U)
(declare-fun |Seq#Empty| (T@T) T@U)
(declare-fun |Seq#Skolem| (T@U T@U) Int)
(declare-fun sum (T@U T@U) Int)
(declare-fun head (T@U T@U) Int)
(declare-fun tail (T@U T@U) T@U)
(declare-fun last (T@U T@U) Int)
(declare-fun |list#sm| (T@U) T@U)
(declare-fun dummyHeap () T@U)
(declare-fun ZeroMask () T@U)
(declare-fun InsidePredicate (T@U T@U T@U T@U) Bool)
(declare-fun sumMask (T@U T@U T@U) Bool)
(declare-fun ConditionalFrame (Real T@U) T@U)
(declare-fun EmptyFrame () T@U)
(declare-fun NoPerm () Real)
(declare-fun get (T@U T@U Int) Int)
(declare-fun |length#trigger| (T@U T@U) Bool)
(declare-fun |Seq#Equal| (T@U T@U) Bool)
(declare-fun ascending (T@U T@U) Bool)
(declare-fun |Seq#ContainsTrigger| (T@U T@U) Bool)
(declare-fun |ascending#frame| (T@U T@U) Bool)
(declare-fun getPredWandId (T@U) Int)
(declare-fun FullPerm () Real)
(declare-fun |length#frame| (T@U T@U) Int)
(declare-fun |sum#frame| (T@U T@U) Int)
(declare-fun |head#frame| (T@U T@U) Int)
(declare-fun |tail#frame| (T@U T@U) T@U)
(declare-fun |last#frame| (T@U T@U) Int)
(declare-fun |elems#frame| (T@U T@U) T@U)
(declare-fun |contains#frame| (T@U T@U Int) Bool)
(declare-fun ZeroPMask () T@U)
(declare-fun |Seq#SkolemDiff| (T@U T@U) Int)
(declare-fun |get#frame| (T@U T@U Int) Int)
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
))) (= (Ctor NormalFieldType) 7)) (= (type $allocated) (FieldType NormalFieldType boolType))) (= (Ctor RefType) 8)) (= (type next) (FieldType NormalFieldType RefType))) (= (type val) (FieldType NormalFieldType intType))))
(assert (distinct $allocated next val)
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
 :qid |stdinbpl.282:18|
 :skolemid |38|
 :pattern ( (|Seq#Length| (|Seq#Drop| s n)))
 :pattern ( (|Seq#Length| s) (|Seq#Drop| s n))
)))
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (forall ((arg0@@17 T@T) ) (! (= (Ctor (MapType0Type arg0@@17)) 10)
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
)))) (forall ((arg0@@21 T@T) (arg1@@5 T@T) ) (! (= (Ctor (MapType1Type arg0@@21 arg1@@5)) 11)
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
)))) (= (Ctor PredicateType_listType) 12)) (= (Ctor FrameTypeType) 13)) (forall ((arg0@@26 T@U) ) (! (= (type (list arg0@@26)) (FieldType PredicateType_listType FrameTypeType))
 :qid |funType:list|
 :pattern ( (list arg0@@26))
))) (= (type null) RefType)))
(assert (forall ((Heap T@U) (Mask T@U) (xs T@U) ) (!  (=> (and (and (and (and (= (type Heap) (MapType0Type RefType)) (= (type Mask) (MapType1Type RefType realType))) (= (type xs) RefType)) (and (state Heap Mask) (< AssumeFunctionsAbove 8))) (not (= xs null))) (= (length Heap xs) (+ 1 (ite (= (MapType0Select Heap xs next) null) 0 (|length'| Heap (MapType0Select Heap xs next))))))
 :qid |stdinbpl.576:15|
 :skolemid |60|
 :pattern ( (state Heap Mask) (length Heap xs))
 :pattern ( (state Heap Mask) (|length#triggerStateless| xs) (|list#trigger| Heap (list xs)))
)))
(assert (forall ((Heap0 T@U) (Heap1 T@U) ) (!  (=> (and (and (= (type Heap0) (MapType0Type RefType)) (= (type Heap1) (MapType0Type RefType))) (succHeap Heap0 Heap1)) (succHeapTrans Heap0 Heap1))
 :qid |stdinbpl.88:15|
 :skolemid |11|
 :pattern ( (succHeap Heap0 Heap1))
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
(assert (forall ((Heap@@1 T@U) (xs@@0 T@U) (x@@8 Int) ) (!  (=> (and (= (type Heap@@1) (MapType0Type RefType)) (= (type xs@@0) RefType)) (dummyFunction (bool_2_U (|contains#triggerStateless| xs@@0 x@@8))))
 :qid |stdinbpl.1230:15|
 :skolemid |85|
 :pattern ( (|contains'| Heap@@1 xs@@0 x@@8))
)))
(assert (forall ((Heap@@2 T@U) (xs@@1 T@U) (index Int) ) (!  (=> (and (= (type Heap@@2) (MapType0Type RefType)) (= (type xs@@1) RefType)) (dummyFunction (int_2_U (|get#triggerStateless| xs@@1 index))))
 :qid |stdinbpl.1515:15|
 :skolemid |95|
 :pattern ( (|get'| Heap@@2 xs@@1 index))
)))
(assert (forall ((arg0@@27 T@U) (arg1@@10 Int) ) (! (let ((T@@1 (SeqTypeInv0 (type arg0@@27))))
(= (type (|Seq#Index| arg0@@27 arg1@@10)) T@@1))
 :qid |funType:Seq#Index|
 :pattern ( (|Seq#Index| arg0@@27 arg1@@10))
)))
(assert (forall ((s@@0 T@U) (n@@0 Int) (j Int) ) (! (let ((T@@2 (SeqTypeInv0 (type s@@0))))
 (=> (= (type s@@0) (SeqType T@@2)) (=> (and (and (< 0 n@@0) (<= 0 j)) (< j (- (|Seq#Length| s@@0) n@@0))) (and (= (|Seq#Sub| (|Seq#Add| j n@@0) n@@0) j) (= (|Seq#Index| (|Seq#Drop| s@@0 n@@0) j) (|Seq#Index| s@@0 (|Seq#Add| j n@@0)))))))
 :qid |stdinbpl.303:18|
 :skolemid |39|
 :pattern ( (|Seq#Index| (|Seq#Drop| s@@0 n@@0) j))
)))
(assert (forall ((arg0@@28 T@U) ) (! (let ((A (FieldTypeInv0 (type arg0@@28))))
(= (type (PredicateMaskField arg0@@28)) (FieldType A (MapType1Type RefType boolType))))
 :qid |funType:PredicateMaskField|
 :pattern ( (PredicateMaskField arg0@@28))
)))
(assert (forall ((Heap@@3 T@U) (ExhaleHeap T@U) (Mask@@1 T@U) (pm_f T@U) ) (! (let ((C (FieldTypeInv0 (type pm_f))))
 (=> (and (and (and (and (and (= (type Heap@@3) (MapType0Type RefType)) (= (type ExhaleHeap) (MapType0Type RefType))) (= (type Mask@@1) (MapType1Type RefType realType))) (= (type pm_f) (FieldType C FrameTypeType))) (IdenticalOnKnownLocations Heap@@3 ExhaleHeap Mask@@1)) (and (HasDirectPerm Mask@@1 null pm_f) (IsPredicateField pm_f))) (= (MapType0Select Heap@@3 null (PredicateMaskField pm_f)) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))))
 :qid |stdinbpl.47:19|
 :skolemid |2|
 :pattern ( (IdenticalOnKnownLocations Heap@@3 ExhaleHeap Mask@@1) (IsPredicateField pm_f) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))
)))
(assert (forall ((arg0@@29 T@U) ) (! (let ((A@@0 (FieldTypeInv0 (type arg0@@29))))
(= (type (WandMaskField arg0@@29)) (FieldType A@@0 (MapType1Type RefType boolType))))
 :qid |funType:WandMaskField|
 :pattern ( (WandMaskField arg0@@29))
)))
(assert (forall ((Heap@@4 T@U) (ExhaleHeap@@0 T@U) (Mask@@2 T@U) (pm_f@@0 T@U) ) (! (let ((C@@0 (FieldTypeInv0 (type pm_f@@0))))
 (=> (and (and (and (and (and (= (type Heap@@4) (MapType0Type RefType)) (= (type ExhaleHeap@@0) (MapType0Type RefType))) (= (type Mask@@2) (MapType1Type RefType realType))) (= (type pm_f@@0) (FieldType C@@0 FrameTypeType))) (IdenticalOnKnownLocations Heap@@4 ExhaleHeap@@0 Mask@@2)) (and (HasDirectPerm Mask@@2 null pm_f@@0) (IsWandField pm_f@@0))) (= (MapType0Select Heap@@4 null (WandMaskField pm_f@@0)) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))))
 :qid |stdinbpl.60:19|
 :skolemid |5|
 :pattern ( (IdenticalOnKnownLocations Heap@@4 ExhaleHeap@@0 Mask@@2) (IsWandField pm_f@@0) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))
)))
(assert (forall ((xs@@2 T@U) ) (!  (=> (= (type xs@@2) RefType) (IsPredicateField (list xs@@2)))
 :qid |stdinbpl.1848:15|
 :skolemid |105|
 :pattern ( (list xs@@2))
)))
(assert (forall ((Heap@@5 T@U) (xs@@3 T@U) ) (!  (=> (and (= (type Heap@@5) (MapType0Type RefType)) (= (type xs@@3) RefType)) (dummyFunction (int_2_U (|length#triggerStateless| xs@@3))))
 :qid |stdinbpl.570:15|
 :skolemid |59|
 :pattern ( (|length'| Heap@@5 xs@@3))
)))
(assert (forall ((Heap@@6 T@U) (xs@@4 T@U) ) (!  (=> (and (= (type Heap@@6) (MapType0Type RefType)) (= (type xs@@4) RefType)) (dummyFunction (int_2_U (|sum#triggerStateless| xs@@4))))
 :qid |stdinbpl.722:15|
 :skolemid |65|
 :pattern ( (|sum'| Heap@@6 xs@@4))
)))
(assert (forall ((Heap@@7 T@U) (xs@@5 T@U) ) (!  (=> (and (= (type Heap@@7) (MapType0Type RefType)) (= (type xs@@5) RefType)) (dummyFunction (int_2_U (|head#triggerStateless| xs@@5))))
 :qid |stdinbpl.864:15|
 :skolemid |70|
 :pattern ( (|head'| Heap@@7 xs@@5))
)))
(assert  (and (forall ((arg0@@30 T@U) (arg1@@11 T@U) ) (! (= (type (|tail'| arg0@@30 arg1@@11)) RefType)
 :qid |funType:tail'|
 :pattern ( (|tail'| arg0@@30 arg1@@11))
)) (forall ((arg0@@31 T@U) ) (! (= (type (|tail#triggerStateless| arg0@@31)) RefType)
 :qid |funType:tail#triggerStateless|
 :pattern ( (|tail#triggerStateless| arg0@@31))
))))
(assert (forall ((Heap@@8 T@U) (xs@@6 T@U) ) (!  (=> (and (= (type Heap@@8) (MapType0Type RefType)) (= (type xs@@6) RefType)) (dummyFunction (|tail#triggerStateless| xs@@6)))
 :qid |stdinbpl.976:15|
 :skolemid |75|
 :pattern ( (|tail'| Heap@@8 xs@@6))
)))
(assert (forall ((Heap@@9 T@U) (xs@@7 T@U) ) (!  (=> (and (= (type Heap@@9) (MapType0Type RefType)) (= (type xs@@7) RefType)) (dummyFunction (int_2_U (|last#triggerStateless| xs@@7))))
 :qid |stdinbpl.1088:15|
 :skolemid |80|
 :pattern ( (|last'| Heap@@9 xs@@7))
)))
(assert  (and (forall ((arg0@@32 T@U) (arg1@@12 T@U) ) (! (= (type (|elems'| arg0@@32 arg1@@12)) (SeqType intType))
 :qid |funType:elems'|
 :pattern ( (|elems'| arg0@@32 arg1@@12))
)) (forall ((arg0@@33 T@U) ) (! (= (type (|elems#triggerStateless| arg0@@33)) (SeqType intType))
 :qid |funType:elems#triggerStateless|
 :pattern ( (|elems#triggerStateless| arg0@@33))
))))
(assert (forall ((Heap@@10 T@U) (xs@@8 T@U) ) (!  (=> (and (= (type Heap@@10) (MapType0Type RefType)) (= (type xs@@8) RefType)) (dummyFunction (|elems#triggerStateless| xs@@8)))
 :qid |stdinbpl.1373:15|
 :skolemid |90|
 :pattern ( (|elems'| Heap@@10 xs@@8))
)))
(assert (forall ((Heap@@11 T@U) (xs@@9 T@U) ) (!  (=> (and (= (type Heap@@11) (MapType0Type RefType)) (= (type xs@@9) RefType)) (dummyFunction (bool_2_U (|ascending#triggerStateless| xs@@9))))
 :qid |stdinbpl.1684:15|
 :skolemid |100|
 :pattern ( (|ascending'| Heap@@11 xs@@9))
)))
(assert (forall ((Heap@@12 T@U) (xs@@10 T@U) ) (!  (=> (and (= (type Heap@@12) (MapType0Type RefType)) (= (type xs@@10) RefType)) (|list#everUsed| (list xs@@10)))
 :qid |stdinbpl.1867:15|
 :skolemid |109|
 :pattern ( (|list#trigger| Heap@@12 (list xs@@10)))
)))
(assert (forall ((arg0@@34 T@U) (arg1@@13 Int) (arg2@@3 T@U) ) (! (let ((T@@3 (type arg2@@3)))
(= (type (|Seq#Update| arg0@@34 arg1@@13 arg2@@3)) (SeqType T@@3)))
 :qid |funType:Seq#Update|
 :pattern ( (|Seq#Update| arg0@@34 arg1@@13 arg2@@3))
)))
(assert (forall ((s@@1 T@U) (i Int) (v T@U) (n@@1 Int) ) (! (let ((T@@4 (type v)))
 (=> (= (type s@@1) (SeqType T@@4)) (=> (and (<= 0 n@@1) (< n@@1 (|Seq#Length| s@@1))) (and (=> (= i n@@1) (= (|Seq#Index| (|Seq#Update| s@@1 i v) n@@1) v)) (=> (not (= i n@@1)) (= (|Seq#Index| (|Seq#Update| s@@1 i v) n@@1) (|Seq#Index| s@@1 n@@1)))))))
 :qid |stdinbpl.258:18|
 :skolemid |35|
 :pattern ( (|Seq#Index| (|Seq#Update| s@@1 i v) n@@1))
 :pattern ( (|Seq#Index| s@@1 n@@1) (|Seq#Update| s@@1 i v))
)))
(assert (forall ((arg0@@35 T@U) (arg1@@14 Int) ) (! (let ((T@@5 (SeqTypeInv0 (type arg0@@35))))
(= (type (|Seq#Take| arg0@@35 arg1@@14)) (SeqType T@@5)))
 :qid |funType:Seq#Take|
 :pattern ( (|Seq#Take| arg0@@35 arg1@@14))
)))
(assert (forall ((s@@2 T@U) (n@@2 Int) ) (! (let ((T@@6 (SeqTypeInv0 (type s@@2))))
 (=> (= (type s@@2) (SeqType T@@6)) (and (=> (<= 0 n@@2) (and (=> (<= n@@2 (|Seq#Length| s@@2)) (= (|Seq#Length| (|Seq#Take| s@@2 n@@2)) n@@2)) (=> (< (|Seq#Length| s@@2) n@@2) (= (|Seq#Length| (|Seq#Take| s@@2 n@@2)) (|Seq#Length| s@@2))))) (=> (< n@@2 0) (= (|Seq#Length| (|Seq#Take| s@@2 n@@2)) 0)))))
 :qid |stdinbpl.269:18|
 :skolemid |36|
 :pattern ( (|Seq#Length| (|Seq#Take| s@@2 n@@2)))
 :pattern ( (|Seq#Take| s@@2 n@@2) (|Seq#Length| s@@2))
)))
(assert (forall ((arg0@@36 Int) (arg1@@15 Int) ) (! (= (type (|Seq#Range| arg0@@36 arg1@@15)) (SeqType intType))
 :qid |funType:Seq#Range|
 :pattern ( (|Seq#Range| arg0@@36 arg1@@15))
)))
(assert (forall ((q@min Int) (q@max Int) (v@@0 T@U) ) (!  (=> (= (type v@@0) intType) (= (|Seq#Contains| (|Seq#Range| q@min q@max) v@@0)  (and (<= q@min (U_2_int v@@0)) (< (U_2_int v@@0) q@max))))
 :qid |stdinbpl.542:15|
 :skolemid |57|
 :pattern ( (|Seq#Contains| (|Seq#Range| q@min q@max) v@@0))
)))
(assert (forall ((Heap@@13 T@U) (Mask@@3 T@U) (xs@@11 T@U) (x@@9 Int) ) (!  (=> (and (and (and (and (= (type Heap@@13) (MapType0Type RefType)) (= (type Mask@@3) (MapType1Type RefType realType))) (= (type xs@@11) RefType)) (and (state Heap@@13 Mask@@3) (< AssumeFunctionsAbove 2))) (not (= xs@@11 null))) (= (contains Heap@@13 xs@@11 x@@9)  (or (= x@@9 (U_2_int (MapType0Select Heap@@13 xs@@11 val))) (and (not (= (MapType0Select Heap@@13 xs@@11 next) null)) (|contains'| Heap@@13 (MapType0Select Heap@@13 xs@@11 next) x@@9)))))
 :qid |stdinbpl.1236:15|
 :skolemid |86|
 :pattern ( (state Heap@@13 Mask@@3) (contains Heap@@13 xs@@11 x@@9))
 :pattern ( (state Heap@@13 Mask@@3) (|contains#triggerStateless| xs@@11 x@@9) (|list#trigger| Heap@@13 (list xs@@11)))
)))
(assert  (and (and (and (forall ((arg0@@37 T@U) (arg1@@16 T@U) ) (! (= (type (elems arg0@@37 arg1@@16)) (SeqType intType))
 :qid |funType:elems|
 :pattern ( (elems arg0@@37 arg1@@16))
)) (forall ((arg0@@38 T@U) (arg1@@17 T@U) ) (! (let ((T@@7 (SeqTypeInv0 (type arg0@@38))))
(= (type (|Seq#Append| arg0@@38 arg1@@17)) (SeqType T@@7)))
 :qid |funType:Seq#Append|
 :pattern ( (|Seq#Append| arg0@@38 arg1@@17))
))) (forall ((arg0@@39 T@U) ) (! (let ((T@@8 (type arg0@@39)))
(= (type (|Seq#Singleton| arg0@@39)) (SeqType T@@8)))
 :qid |funType:Seq#Singleton|
 :pattern ( (|Seq#Singleton| arg0@@39))
))) (forall ((T@@9 T@T) ) (! (= (type (|Seq#Empty| T@@9)) (SeqType T@@9))
 :qid |funType:Seq#Empty|
 :pattern ( (|Seq#Empty| T@@9))
))))
(assert (forall ((Heap@@14 T@U) (Mask@@4 T@U) (xs@@12 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@14) (MapType0Type RefType)) (= (type Mask@@4) (MapType1Type RefType realType))) (= (type xs@@12) RefType)) (and (state Heap@@14 Mask@@4) (< AssumeFunctionsAbove 4))) (not (= xs@@12 null))) (= (elems Heap@@14 xs@@12) (|Seq#Append| (|Seq#Singleton| (MapType0Select Heap@@14 xs@@12 val)) (ite (= (MapType0Select Heap@@14 xs@@12 next) null) (|Seq#Empty| intType) (|elems'| Heap@@14 (MapType0Select Heap@@14 xs@@12 next))))))
 :qid |stdinbpl.1379:15|
 :skolemid |91|
 :pattern ( (state Heap@@14 Mask@@4) (elems Heap@@14 xs@@12))
 :pattern ( (state Heap@@14 Mask@@4) (|elems#triggerStateless| xs@@12) (|list#trigger| Heap@@14 (list xs@@12)))
)))
(assert (forall ((s@@3 T@U) (x@@10 T@U) ) (! (let ((T@@10 (type x@@10)))
 (=> (and (= (type s@@3) (SeqType T@@10)) (|Seq#Contains| s@@3 x@@10)) (and (and (<= 0 (|Seq#Skolem| s@@3 x@@10)) (< (|Seq#Skolem| s@@3 x@@10) (|Seq#Length| s@@3))) (= (|Seq#Index| s@@3 (|Seq#Skolem| s@@3 x@@10)) x@@10))))
 :qid |stdinbpl.400:18|
 :skolemid |47|
 :pattern ( (|Seq#Contains| s@@3 x@@10))
)))
(assert (forall ((Heap@@15 T@U) (ExhaleHeap@@1 T@U) (Mask@@5 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@15) (MapType0Type RefType)) (= (type ExhaleHeap@@1) (MapType0Type RefType))) (= (type Mask@@5) (MapType1Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@15 ExhaleHeap@@1 Mask@@5)) (U_2_bool (MapType0Select Heap@@15 o_1 $allocated))) (U_2_bool (MapType0Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.73:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@15 ExhaleHeap@@1 Mask@@5) (MapType0Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert (forall ((Heap@@16 T@U) (xs@@13 T@U) ) (!  (=> (and (= (type Heap@@16) (MapType0Type RefType)) (= (type xs@@13) RefType)) (and (= (length Heap@@16 xs@@13) (|length'| Heap@@16 xs@@13)) (dummyFunction (int_2_U (|length#triggerStateless| xs@@13)))))
 :qid |stdinbpl.566:15|
 :skolemid |58|
 :pattern ( (length Heap@@16 xs@@13))
)))
(assert (forall ((Heap@@17 T@U) (xs@@14 T@U) ) (!  (=> (and (= (type Heap@@17) (MapType0Type RefType)) (= (type xs@@14) RefType)) (and (= (sum Heap@@17 xs@@14) (|sum'| Heap@@17 xs@@14)) (dummyFunction (int_2_U (|sum#triggerStateless| xs@@14)))))
 :qid |stdinbpl.718:15|
 :skolemid |64|
 :pattern ( (sum Heap@@17 xs@@14))
)))
(assert (forall ((Heap@@18 T@U) (xs@@15 T@U) ) (!  (=> (and (= (type Heap@@18) (MapType0Type RefType)) (= (type xs@@15) RefType)) (and (= (head Heap@@18 xs@@15) (|head'| Heap@@18 xs@@15)) (dummyFunction (int_2_U (|head#triggerStateless| xs@@15)))))
 :qid |stdinbpl.860:15|
 :skolemid |69|
 :pattern ( (head Heap@@18 xs@@15))
)))
(assert (forall ((arg0@@40 T@U) (arg1@@18 T@U) ) (! (= (type (tail arg0@@40 arg1@@18)) RefType)
 :qid |funType:tail|
 :pattern ( (tail arg0@@40 arg1@@18))
)))
(assert (forall ((Heap@@19 T@U) (xs@@16 T@U) ) (!  (=> (and (= (type Heap@@19) (MapType0Type RefType)) (= (type xs@@16) RefType)) (and (= (tail Heap@@19 xs@@16) (|tail'| Heap@@19 xs@@16)) (dummyFunction (|tail#triggerStateless| xs@@16))))
 :qid |stdinbpl.972:15|
 :skolemid |74|
 :pattern ( (tail Heap@@19 xs@@16))
)))
(assert (forall ((Heap@@20 T@U) (xs@@17 T@U) ) (!  (=> (and (= (type Heap@@20) (MapType0Type RefType)) (= (type xs@@17) RefType)) (and (= (last Heap@@20 xs@@17) (|last'| Heap@@20 xs@@17)) (dummyFunction (int_2_U (|last#triggerStateless| xs@@17)))))
 :qid |stdinbpl.1084:15|
 :skolemid |79|
 :pattern ( (last Heap@@20 xs@@17))
)))
(assert (forall ((Heap@@21 T@U) (xs@@18 T@U) ) (!  (=> (and (= (type Heap@@21) (MapType0Type RefType)) (= (type xs@@18) RefType)) (and (= (elems Heap@@21 xs@@18) (|elems'| Heap@@21 xs@@18)) (dummyFunction (|elems#triggerStateless| xs@@18))))
 :qid |stdinbpl.1369:15|
 :skolemid |89|
 :pattern ( (elems Heap@@21 xs@@18))
)))
(assert (forall ((s@@4 T@U) (n@@3 Int) ) (! (let ((T@@11 (SeqTypeInv0 (type s@@4))))
 (=> (and (= (type s@@4) (SeqType T@@11)) (<= n@@3 0)) (= (|Seq#Drop| s@@4 n@@3) s@@4)))
 :qid |stdinbpl.384:18|
 :skolemid |45|
 :pattern ( (|Seq#Drop| s@@4 n@@3))
)))
(assert (forall ((i@@0 Int) (j@@0 Int) ) (! (= (|Seq#Sub| i@@0 j@@0) (- i@@0 j@@0))
 :qid |stdinbpl.238:15|
 :skolemid |30|
 :pattern ( (|Seq#Sub| i@@0 j@@0))
)))
(assert (forall ((i@@1 Int) (j@@1 Int) ) (! (= (|Seq#Add| i@@1 j@@1) (+ i@@1 j@@1))
 :qid |stdinbpl.236:15|
 :skolemid |29|
 :pattern ( (|Seq#Add| i@@1 j@@1))
)))
(assert (forall ((x@@11 T@U) (y@@1 T@U) ) (! (let ((T@@12 (type x@@11)))
 (=> (= (type y@@1) T@@12) (= (|Seq#Contains| (|Seq#Singleton| x@@11) y@@1) (= x@@11 y@@1))))
 :qid |stdinbpl.525:18|
 :skolemid |54|
 :pattern ( (|Seq#Contains| (|Seq#Singleton| x@@11) y@@1))
)))
(assert (forall ((s@@5 T@U) (n@@4 Int) (j@@2 Int) ) (! (let ((T@@13 (SeqTypeInv0 (type s@@5))))
 (=> (= (type s@@5) (SeqType T@@13)) (=> (and (and (<= 0 j@@2) (< j@@2 n@@4)) (< j@@2 (|Seq#Length| s@@5))) (= (|Seq#Index| (|Seq#Take| s@@5 n@@4) j@@2) (|Seq#Index| s@@5 j@@2)))))
 :qid |stdinbpl.277:18|
 :skolemid |37|
 :pattern ( (|Seq#Index| (|Seq#Take| s@@5 n@@4) j@@2))
 :pattern ( (|Seq#Index| s@@5 j@@2) (|Seq#Take| s@@5 n@@4))
)))
(assert (forall ((xs@@19 T@U) (xs2 T@U) ) (!  (=> (and (and (= (type xs@@19) RefType) (= (type xs2) RefType)) (= (list xs@@19) (list xs2))) (= xs@@19 xs2))
 :qid |stdinbpl.1858:15|
 :skolemid |107|
 :pattern ( (list xs@@19) (list xs2))
)))
(assert (forall ((arg0@@41 T@U) ) (! (= (type (|list#sm| arg0@@41)) (FieldType PredicateType_listType (MapType1Type RefType boolType)))
 :qid |funType:list#sm|
 :pattern ( (|list#sm| arg0@@41))
)))
(assert (forall ((xs@@20 T@U) (xs2@@0 T@U) ) (!  (=> (and (and (= (type xs@@20) RefType) (= (type xs2@@0) RefType)) (= (|list#sm| xs@@20) (|list#sm| xs2@@0))) (= xs@@20 xs2@@0))
 :qid |stdinbpl.1862:15|
 :skolemid |108|
 :pattern ( (|list#sm| xs@@20) (|list#sm| xs2@@0))
)))
(assert (forall ((Heap@@22 T@U) (ExhaleHeap@@2 T@U) (Mask@@6 T@U) (o_1@@0 T@U) (f_2 T@U) ) (! (let ((B@@1 (FieldTypeInv1 (type f_2))))
(let ((A@@1 (FieldTypeInv0 (type f_2))))
 (=> (and (and (and (and (and (and (= (type Heap@@22) (MapType0Type RefType)) (= (type ExhaleHeap@@2) (MapType0Type RefType))) (= (type Mask@@6) (MapType1Type RefType realType))) (= (type o_1@@0) RefType)) (= (type f_2) (FieldType A@@1 B@@1))) (IdenticalOnKnownLocations Heap@@22 ExhaleHeap@@2 Mask@@6)) (HasDirectPerm Mask@@6 o_1@@0 f_2)) (= (MapType0Select Heap@@22 o_1@@0 f_2) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2)))))
 :qid |stdinbpl.42:22|
 :skolemid |1|
 :pattern ( (IdenticalOnKnownLocations Heap@@22 ExhaleHeap@@2 Mask@@6) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2))
)))
(assert (forall ((T@@14 T@T) ) (! (= (|Seq#Length| (|Seq#Empty| T@@14)) 0)
 :skolemid |23|
)))
(assert  (and (= (type dummyHeap) (MapType0Type RefType)) (= (type ZeroMask) (MapType1Type RefType realType))))
(assert (state dummyHeap ZeroMask))
(assert (forall ((p T@U) (v_1 T@U) (w T@U) ) (! (let ((A@@2 (FieldTypeInv0 (type p))))
 (=> (and (and (= (type p) (FieldType A@@2 FrameTypeType)) (= (type v_1) FrameTypeType)) (= (type w) FrameTypeType)) (not (InsidePredicate p v_1 p w))))
 :qid |stdinbpl.181:19|
 :skolemid |21|
 :pattern ( (InsidePredicate p v_1 p w))
)))
(assert (forall ((Heap@@23 T@U) (Mask@@7 T@U) (xs@@21 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@23) (MapType0Type RefType)) (= (type Mask@@7) (MapType1Type RefType realType))) (= (type xs@@21) RefType)) (and (state Heap@@23 Mask@@7) (< AssumeFunctionsAbove 0))) (not (= xs@@21 null))) (= (last Heap@@23 xs@@21) (ite (= (MapType0Select Heap@@23 xs@@21 next) null) (U_2_int (MapType0Select Heap@@23 xs@@21 val)) (|last'| Heap@@23 (MapType0Select Heap@@23 xs@@21 next)))))
 :qid |stdinbpl.1094:15|
 :skolemid |81|
 :pattern ( (state Heap@@23 Mask@@7) (last Heap@@23 xs@@21))
 :pattern ( (state Heap@@23 Mask@@7) (|last#triggerStateless| xs@@21) (|list#trigger| Heap@@23 (list xs@@21)))
)))
(assert (forall ((s0 T@U) (s1 T@U) (n@@5 Int) ) (! (let ((T@@15 (SeqTypeInv0 (type s0))))
 (=> (and (= (type s0) (SeqType T@@15)) (= (type s1) (SeqType T@@15))) (=> (and (and (and (not (= s0 (|Seq#Empty| T@@15))) (not (= s1 (|Seq#Empty| T@@15)))) (<= (|Seq#Length| s0) n@@5)) (< n@@5 (|Seq#Length| (|Seq#Append| s0 s1)))) (and (= (|Seq#Add| (|Seq#Sub| n@@5 (|Seq#Length| s0)) (|Seq#Length| s0)) n@@5) (= (|Seq#Index| (|Seq#Append| s0 s1) n@@5) (|Seq#Index| s1 (|Seq#Sub| n@@5 (|Seq#Length| s0))))))))
 :qid |stdinbpl.249:18|
 :skolemid |32|
 :pattern ( (|Seq#Index| (|Seq#Append| s0 s1) n@@5))
)))
(assert  (not (IsPredicateField next)))
(assert  (not (IsWandField next)))
(assert  (not (IsPredicateField val)))
(assert  (not (IsWandField val)))
(assert (forall ((Heap@@24 T@U) (ExhaleHeap@@3 T@U) (Mask@@8 T@U) ) (!  (=> (and (and (and (= (type Heap@@24) (MapType0Type RefType)) (= (type ExhaleHeap@@3) (MapType0Type RefType))) (= (type Mask@@8) (MapType1Type RefType realType))) (IdenticalOnKnownLocations Heap@@24 ExhaleHeap@@3 Mask@@8)) (succHeap Heap@@24 ExhaleHeap@@3))
 :qid |stdinbpl.83:15|
 :skolemid |10|
 :pattern ( (IdenticalOnKnownLocations Heap@@24 ExhaleHeap@@3 Mask@@8))
)))
(assert (forall ((Heap@@25 T@U) (Mask@@9 T@U) (xs@@22 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@25) (MapType0Type RefType)) (= (type Mask@@9) (MapType1Type RefType realType))) (= (type xs@@22) RefType)) (and (state Heap@@25 Mask@@9) (< AssumeFunctionsAbove 6))) (not (= xs@@22 null))) (= (tail Heap@@25 xs@@22) (MapType0Select Heap@@25 xs@@22 next)))
 :qid |stdinbpl.982:15|
 :skolemid |76|
 :pattern ( (state Heap@@25 Mask@@9) (tail Heap@@25 xs@@22))
 :pattern ( (state Heap@@25 Mask@@9) (|tail#triggerStateless| xs@@22) (|list#trigger| Heap@@25 (list xs@@22)))
)))
(assert (forall ((Heap@@26 T@U) (Mask@@10 T@U) (xs@@23 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@26) (MapType0Type RefType)) (= (type Mask@@10) (MapType1Type RefType realType))) (= (type xs@@23) RefType)) (and (state Heap@@26 Mask@@10) (< AssumeFunctionsAbove 7))) (not (= xs@@23 null))) (= (head Heap@@26 xs@@23) (U_2_int (MapType0Select Heap@@26 xs@@23 val))))
 :qid |stdinbpl.870:15|
 :skolemid |71|
 :pattern ( (state Heap@@26 Mask@@10) (head Heap@@26 xs@@23))
 :pattern ( (state Heap@@26 Mask@@10) (|head#triggerStateless| xs@@23) (|list#trigger| Heap@@26 (list xs@@23)))
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
(assert  (and (forall ((arg0@@42 Real) (arg1@@19 T@U) ) (! (= (type (ConditionalFrame arg0@@42 arg1@@19)) FrameTypeType)
 :qid |funType:ConditionalFrame|
 :pattern ( (ConditionalFrame arg0@@42 arg1@@19))
)) (= (type EmptyFrame) FrameTypeType)))
(assert (forall ((p@@0 Real) (f_6 T@U) ) (!  (=> (= (type f_6) FrameTypeType) (= (ConditionalFrame p@@0 f_6) (ite (> p@@0 0.0) f_6 EmptyFrame)))
 :qid |stdinbpl.169:15|
 :skolemid |19|
 :pattern ( (ConditionalFrame p@@0 f_6))
)))
(assert (forall ((q@min@@0 Int) (q@max@@0 Int) (j@@3 Int) ) (!  (=> (and (<= 0 j@@3) (< j@@3 (- q@max@@0 q@min@@0))) (= (U_2_int (|Seq#Index| (|Seq#Range| q@min@@0 q@max@@0) j@@3)) (+ q@min@@0 j@@3)))
 :qid |stdinbpl.540:15|
 :skolemid |56|
 :pattern ( (|Seq#Index| (|Seq#Range| q@min@@0 q@max@@0) j@@3))
)))
(assert (forall ((Mask@@11 T@U) (o_2@@0 T@U) (f_4@@0 T@U) ) (! (let ((B@@3 (FieldTypeInv1 (type f_4@@0))))
(let ((A@@4 (FieldTypeInv0 (type f_4@@0))))
 (=> (and (and (= (type Mask@@11) (MapType1Type RefType realType)) (= (type o_2@@0) RefType)) (= (type f_4@@0) (FieldType A@@4 B@@3))) (= (HasDirectPerm Mask@@11 o_2@@0 f_4@@0) (> (U_2_real (MapType1Select Mask@@11 o_2@@0 f_4@@0)) NoPerm)))))
 :qid |stdinbpl.133:22|
 :skolemid |17|
 :pattern ( (HasDirectPerm Mask@@11 o_2@@0 f_4@@0))
)))
(assert (forall ((s0@@0 T@U) (s1@@0 T@U) ) (! (let ((T@@16 (SeqTypeInv0 (type s0@@0))))
 (=> (and (and (= (type s0@@0) (SeqType T@@16)) (= (type s1@@0) (SeqType T@@16))) (and (not (= s0@@0 (|Seq#Empty| T@@16))) (not (= s1@@0 (|Seq#Empty| T@@16))))) (= (|Seq#Length| (|Seq#Append| s0@@0 s1@@0)) (+ (|Seq#Length| s0@@0) (|Seq#Length| s1@@0)))))
 :qid |stdinbpl.218:18|
 :skolemid |26|
 :pattern ( (|Seq#Length| (|Seq#Append| s0@@0 s1@@0)))
)))
(assert (forall ((s@@6 T@U) (t T@U) (n@@6 Int) ) (! (let ((T@@17 (SeqTypeInv0 (type s@@6))))
 (=> (and (and (= (type s@@6) (SeqType T@@17)) (= (type t) (SeqType T@@17))) (and (> n@@6 0) (> n@@6 (|Seq#Length| s@@6)))) (and (= (|Seq#Add| (|Seq#Sub| n@@6 (|Seq#Length| s@@6)) (|Seq#Length| s@@6)) n@@6) (= (|Seq#Drop| (|Seq#Append| s@@6 t) n@@6) (|Seq#Drop| t (|Seq#Sub| n@@6 (|Seq#Length| s@@6)))))))
 :qid |stdinbpl.374:18|
 :skolemid |44|
 :pattern ( (|Seq#Drop| (|Seq#Append| s@@6 t) n@@6))
)))
(assert (forall ((Heap@@27 T@U) (xs@@24 T@U) (index@@0 Int) ) (!  (=> (and (= (type Heap@@27) (MapType0Type RefType)) (= (type xs@@24) RefType)) (and (= (get Heap@@27 xs@@24 index@@0) (|get'| Heap@@27 xs@@24 index@@0)) (dummyFunction (int_2_U (|get#triggerStateless| xs@@24 index@@0)))))
 :qid |stdinbpl.1511:15|
 :skolemid |94|
 :pattern ( (get Heap@@27 xs@@24 index@@0))
)))
(assert (forall ((Heap@@28 T@U) (Mask@@12 T@U) (xs@@25 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@28) (MapType0Type RefType)) (= (type Mask@@12) (MapType1Type RefType realType))) (= (type xs@@25) RefType)) (and (state Heap@@28 Mask@@12) (or (< AssumeFunctionsAbove 8) (|length#trigger| (MapType0Select Heap@@28 null (list xs@@25)) xs@@25)))) (not (= xs@@25 null))) (> (|length'| Heap@@28 xs@@25) 0))
 :qid |stdinbpl.589:15|
 :skolemid |62|
 :pattern ( (state Heap@@28 Mask@@12) (|length'| Heap@@28 xs@@25))
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
 :qid |stdinbpl.361:18|
 :skolemid |42|
 :pattern ( (|Seq#Take| (|Seq#Append| s@@7 t@@0) n@@7))
)))
(assert (forall ((q@min@@1 Int) (q@max@@1 Int) ) (!  (and (=> (< q@min@@1 q@max@@1) (= (|Seq#Length| (|Seq#Range| q@min@@1 q@max@@1)) (- q@max@@1 q@min@@1))) (=> (<= q@max@@1 q@min@@1) (= (|Seq#Length| (|Seq#Range| q@min@@1 q@max@@1)) 0)))
 :qid |stdinbpl.539:15|
 :skolemid |55|
 :pattern ( (|Seq#Length| (|Seq#Range| q@min@@1 q@max@@1)))
)))
(assert (forall ((a T@U) (b T@U) ) (! (let ((T@@19 (SeqTypeInv0 (type a))))
 (=> (and (and (= (type a) (SeqType T@@19)) (= (type b) (SeqType T@@19))) (|Seq#Equal| a b)) (= a b)))
 :qid |stdinbpl.512:18|
 :skolemid |53|
 :pattern ( (|Seq#Equal| a b))
)))
(assert (forall ((Heap@@29 T@U) (Mask@@13 T@U) (xs@@26 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@29) (MapType0Type RefType)) (= (type Mask@@13) (MapType1Type RefType realType))) (= (type xs@@26) RefType)) (and (state Heap@@29 Mask@@13) (< AssumeFunctionsAbove 3))) (not (= xs@@26 null))) (= (ascending Heap@@29 xs@@26)  (or (= (MapType0Select Heap@@29 xs@@26 next) null) (and (<= (U_2_int (MapType0Select Heap@@29 xs@@26 val)) (head Heap@@29 (MapType0Select Heap@@29 xs@@26 next))) (|ascending'| Heap@@29 (MapType0Select Heap@@29 xs@@26 next))))))
 :qid |stdinbpl.1690:15|
 :skolemid |101|
 :pattern ( (state Heap@@29 Mask@@13) (ascending Heap@@29 xs@@26))
 :pattern ( (state Heap@@29 Mask@@13) (|ascending#triggerStateless| xs@@26) (|list#trigger| Heap@@29 (list xs@@26)) (|list#trigger| Heap@@29 (list xs@@26)))
)))
(assert (forall ((s@@8 T@U) (i@@2 Int) ) (! (let ((T@@20 (SeqTypeInv0 (type s@@8))))
 (=> (= (type s@@8) (SeqType T@@20)) (=> (and (<= 0 i@@2) (< i@@2 (|Seq#Length| s@@8))) (|Seq#ContainsTrigger| s@@8 (|Seq#Index| s@@8 i@@2)))))
 :qid |stdinbpl.405:18|
 :skolemid |49|
 :pattern ( (|Seq#Index| s@@8 i@@2))
)))
(assert (forall ((s0@@1 T@U) (s1@@1 T@U) ) (! (let ((T@@21 (SeqTypeInv0 (type s0@@1))))
 (=> (and (= (type s0@@1) (SeqType T@@21)) (= (type s1@@1) (SeqType T@@21))) (and (=> (= s0@@1 (|Seq#Empty| T@@21)) (= (|Seq#Append| s0@@1 s1@@1) s1@@1)) (=> (= s1@@1 (|Seq#Empty| T@@21)) (= (|Seq#Append| s0@@1 s1@@1) s0@@1)))))
 :qid |stdinbpl.224:18|
 :skolemid |27|
 :pattern ( (|Seq#Append| s0@@1 s1@@1))
)))
(assert (forall ((Heap@@30 T@U) (Mask@@14 T@U) (xs@@27 T@U) ) (!  (=> (and (and (and (= (type Heap@@30) (MapType0Type RefType)) (= (type Mask@@14) (MapType1Type RefType realType))) (= (type xs@@27) RefType)) (state Heap@@30 Mask@@14)) (= (|ascending'| Heap@@30 xs@@27) (|ascending#frame| (MapType0Select Heap@@30 null (list xs@@27)) xs@@27)))
 :qid |stdinbpl.1697:15|
 :skolemid |102|
 :pattern ( (state Heap@@30 Mask@@14) (|ascending'| Heap@@30 xs@@27))
 :pattern ( (state Heap@@30 Mask@@14) (|ascending#triggerStateless| xs@@27) (|list#trigger| Heap@@30 (list xs@@27)) (|list#trigger| Heap@@30 (list xs@@27)))
)))
(assert (forall ((t@@1 T@U) ) (! (= (|Seq#Index| (|Seq#Singleton| t@@1) 0) t@@1)
 :qid |stdinbpl.228:18|
 :skolemid |28|
 :pattern ( (|Seq#Singleton| t@@1))
)))
(assert (forall ((s@@9 T@U) ) (! (let ((T@@22 (SeqTypeInv0 (type s@@9))))
 (=> (= (type s@@9) (SeqType T@@22)) (<= 0 (|Seq#Length| s@@9))))
 :qid |stdinbpl.207:18|
 :skolemid |22|
 :pattern ( (|Seq#Length| s@@9))
)))
(assert (forall ((Heap@@31 T@U) (xs@@28 T@U) ) (!  (=> (and (= (type Heap@@31) (MapType0Type RefType)) (= (type xs@@28) RefType)) (and (= (ascending Heap@@31 xs@@28) (|ascending'| Heap@@31 xs@@28)) (dummyFunction (bool_2_U (|ascending#triggerStateless| xs@@28)))))
 :qid |stdinbpl.1680:15|
 :skolemid |99|
 :pattern ( (ascending Heap@@31 xs@@28))
)))
(assert (forall ((s0@@2 T@U) (s1@@2 T@U) ) (! (let ((T@@23 (SeqTypeInv0 (type s0@@2))))
 (=> (and (and (= (type s0@@2) (SeqType T@@23)) (= (type s1@@2) (SeqType T@@23))) (|Seq#Equal| s0@@2 s1@@2)) (and (= (|Seq#Length| s0@@2) (|Seq#Length| s1@@2)) (forall ((j@@4 Int) ) (!  (=> (and (<= 0 j@@4) (< j@@4 (|Seq#Length| s0@@2))) (= (|Seq#Index| s0@@2 j@@4) (|Seq#Index| s1@@2 j@@4)))
 :qid |stdinbpl.502:13|
 :skolemid |50|
 :pattern ( (|Seq#Index| s0@@2 j@@4))
 :pattern ( (|Seq#Index| s1@@2 j@@4))
)))))
 :qid |stdinbpl.499:18|
 :skolemid |51|
 :pattern ( (|Seq#Equal| s0@@2 s1@@2))
)))
(assert (forall ((Heap@@32 T@U) (ExhaleHeap@@4 T@U) (Mask@@15 T@U) (pm_f@@1 T@U) ) (! (let ((C@@1 (FieldTypeInv0 (type pm_f@@1))))
 (=> (and (and (and (and (and (= (type Heap@@32) (MapType0Type RefType)) (= (type ExhaleHeap@@4) (MapType0Type RefType))) (= (type Mask@@15) (MapType1Type RefType realType))) (= (type pm_f@@1) (FieldType C@@1 FrameTypeType))) (IdenticalOnKnownLocations Heap@@32 ExhaleHeap@@4 Mask@@15)) (and (HasDirectPerm Mask@@15 null pm_f@@1) (IsPredicateField pm_f@@1))) (forall ((o2 T@U) (f_2@@0 T@U) ) (! (let ((B@@5 (FieldTypeInv1 (type f_2@@0))))
(let ((A@@6 (FieldTypeInv0 (type f_2@@0))))
 (=> (and (and (= (type o2) RefType) (= (type f_2@@0) (FieldType A@@6 B@@5))) (U_2_bool (MapType1Select (MapType0Select Heap@@32 null (PredicateMaskField pm_f@@1)) o2 f_2@@0))) (= (MapType0Select Heap@@32 o2 f_2@@0) (MapType0Select ExhaleHeap@@4 o2 f_2@@0)))))
 :qid |stdinbpl.54:134|
 :skolemid |3|
 :pattern ( (MapType0Select ExhaleHeap@@4 o2 f_2@@0))
))))
 :qid |stdinbpl.52:19|
 :skolemid |4|
 :pattern ( (IdenticalOnKnownLocations Heap@@32 ExhaleHeap@@4 Mask@@15) (IsPredicateField pm_f@@1))
)))
(assert (forall ((Heap@@33 T@U) (ExhaleHeap@@5 T@U) (Mask@@16 T@U) (pm_f@@2 T@U) ) (! (let ((C@@2 (FieldTypeInv0 (type pm_f@@2))))
 (=> (and (and (and (and (and (= (type Heap@@33) (MapType0Type RefType)) (= (type ExhaleHeap@@5) (MapType0Type RefType))) (= (type Mask@@16) (MapType1Type RefType realType))) (= (type pm_f@@2) (FieldType C@@2 FrameTypeType))) (IdenticalOnKnownLocations Heap@@33 ExhaleHeap@@5 Mask@@16)) (and (HasDirectPerm Mask@@16 null pm_f@@2) (IsWandField pm_f@@2))) (forall ((o2@@0 T@U) (f_2@@1 T@U) ) (! (let ((B@@6 (FieldTypeInv1 (type f_2@@1))))
(let ((A@@7 (FieldTypeInv0 (type f_2@@1))))
 (=> (and (and (= (type o2@@0) RefType) (= (type f_2@@1) (FieldType A@@7 B@@6))) (U_2_bool (MapType1Select (MapType0Select Heap@@33 null (WandMaskField pm_f@@2)) o2@@0 f_2@@1))) (= (MapType0Select Heap@@33 o2@@0 f_2@@1) (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1)))))
 :qid |stdinbpl.67:129|
 :skolemid |6|
 :pattern ( (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1))
))))
 :qid |stdinbpl.65:19|
 :skolemid |7|
 :pattern ( (IdenticalOnKnownLocations Heap@@33 ExhaleHeap@@5 Mask@@16) (IsWandField pm_f@@2))
)))
(assert (forall ((xs@@29 T@U) ) (!  (=> (= (type xs@@29) RefType) (= (getPredWandId (list xs@@29)) 0))
 :qid |stdinbpl.1852:15|
 :skolemid |106|
 :pattern ( (list xs@@29))
)))
(assert (forall ((t@@2 T@U) ) (! (= (|Seq#Length| (|Seq#Singleton| t@@2)) 1)
 :qid |stdinbpl.215:18|
 :skolemid |25|
 :pattern ( (|Seq#Singleton| t@@2))
)))
(assert (forall ((Mask@@17 T@U) (o_2@@2 T@U) (f_4@@2 T@U) ) (! (let ((B@@7 (FieldTypeInv1 (type f_4@@2))))
(let ((A@@8 (FieldTypeInv0 (type f_4@@2))))
 (=> (and (and (and (= (type Mask@@17) (MapType1Type RefType realType)) (= (type o_2@@2) RefType)) (= (type f_4@@2) (FieldType A@@8 B@@7))) (GoodMask Mask@@17)) (and (>= (U_2_real (MapType1Select Mask@@17 o_2@@2 f_4@@2)) NoPerm) (=> (and (and (GoodMask Mask@@17) (not (IsPredicateField f_4@@2))) (not (IsWandField f_4@@2))) (<= (U_2_real (MapType1Select Mask@@17 o_2@@2 f_4@@2)) FullPerm))))))
 :qid |stdinbpl.128:22|
 :skolemid |16|
 :pattern ( (GoodMask Mask@@17) (MapType1Select Mask@@17 o_2@@2 f_4@@2))
)))
(assert (forall ((Heap@@34 T@U) (Mask@@18 T@U) (xs@@30 T@U) ) (!  (=> (and (and (and (= (type Heap@@34) (MapType0Type RefType)) (= (type Mask@@18) (MapType1Type RefType realType))) (= (type xs@@30) RefType)) (state Heap@@34 Mask@@18)) (= (|length'| Heap@@34 xs@@30) (|length#frame| (MapType0Select Heap@@34 null (list xs@@30)) xs@@30)))
 :qid |stdinbpl.583:15|
 :skolemid |61|
 :pattern ( (state Heap@@34 Mask@@18) (|length'| Heap@@34 xs@@30))
 :pattern ( (state Heap@@34 Mask@@18) (|length#triggerStateless| xs@@30) (|list#trigger| Heap@@34 (list xs@@30)))
)))
(assert (forall ((Heap@@35 T@U) (Mask@@19 T@U) (xs@@31 T@U) ) (!  (=> (and (and (and (= (type Heap@@35) (MapType0Type RefType)) (= (type Mask@@19) (MapType1Type RefType realType))) (= (type xs@@31) RefType)) (state Heap@@35 Mask@@19)) (= (|sum'| Heap@@35 xs@@31) (|sum#frame| (MapType0Select Heap@@35 null (list xs@@31)) xs@@31)))
 :qid |stdinbpl.735:15|
 :skolemid |67|
 :pattern ( (state Heap@@35 Mask@@19) (|sum'| Heap@@35 xs@@31))
 :pattern ( (state Heap@@35 Mask@@19) (|sum#triggerStateless| xs@@31) (|list#trigger| Heap@@35 (list xs@@31)))
)))
(assert (forall ((Heap@@36 T@U) (Mask@@20 T@U) (xs@@32 T@U) ) (!  (=> (and (and (and (= (type Heap@@36) (MapType0Type RefType)) (= (type Mask@@20) (MapType1Type RefType realType))) (= (type xs@@32) RefType)) (state Heap@@36 Mask@@20)) (= (|head'| Heap@@36 xs@@32) (|head#frame| (MapType0Select Heap@@36 null (list xs@@32)) xs@@32)))
 :qid |stdinbpl.877:15|
 :skolemid |72|
 :pattern ( (state Heap@@36 Mask@@20) (|head'| Heap@@36 xs@@32))
)))
(assert (forall ((arg0@@43 T@U) (arg1@@20 T@U) ) (! (= (type (|tail#frame| arg0@@43 arg1@@20)) RefType)
 :qid |funType:tail#frame|
 :pattern ( (|tail#frame| arg0@@43 arg1@@20))
)))
(assert (forall ((Heap@@37 T@U) (Mask@@21 T@U) (xs@@33 T@U) ) (!  (=> (and (and (and (= (type Heap@@37) (MapType0Type RefType)) (= (type Mask@@21) (MapType1Type RefType realType))) (= (type xs@@33) RefType)) (state Heap@@37 Mask@@21)) (= (|tail'| Heap@@37 xs@@33) (|tail#frame| (MapType0Select Heap@@37 null (list xs@@33)) xs@@33)))
 :qid |stdinbpl.989:15|
 :skolemid |77|
 :pattern ( (state Heap@@37 Mask@@21) (|tail'| Heap@@37 xs@@33))
)))
(assert (forall ((Heap@@38 T@U) (Mask@@22 T@U) (xs@@34 T@U) ) (!  (=> (and (and (and (= (type Heap@@38) (MapType0Type RefType)) (= (type Mask@@22) (MapType1Type RefType realType))) (= (type xs@@34) RefType)) (state Heap@@38 Mask@@22)) (= (|last'| Heap@@38 xs@@34) (|last#frame| (MapType0Select Heap@@38 null (list xs@@34)) xs@@34)))
 :qid |stdinbpl.1101:15|
 :skolemid |82|
 :pattern ( (state Heap@@38 Mask@@22) (|last'| Heap@@38 xs@@34))
 :pattern ( (state Heap@@38 Mask@@22) (|last#triggerStateless| xs@@34) (|list#trigger| Heap@@38 (list xs@@34)))
)))
(assert (forall ((arg0@@44 T@U) (arg1@@21 T@U) ) (! (= (type (|elems#frame| arg0@@44 arg1@@21)) (SeqType intType))
 :qid |funType:elems#frame|
 :pattern ( (|elems#frame| arg0@@44 arg1@@21))
)))
(assert (forall ((Heap@@39 T@U) (Mask@@23 T@U) (xs@@35 T@U) ) (!  (=> (and (and (and (= (type Heap@@39) (MapType0Type RefType)) (= (type Mask@@23) (MapType1Type RefType realType))) (= (type xs@@35) RefType)) (state Heap@@39 Mask@@23)) (= (|elems'| Heap@@39 xs@@35) (|elems#frame| (MapType0Select Heap@@39 null (list xs@@35)) xs@@35)))
 :qid |stdinbpl.1386:15|
 :skolemid |92|
 :pattern ( (state Heap@@39 Mask@@23) (|elems'| Heap@@39 xs@@35))
 :pattern ( (state Heap@@39 Mask@@23) (|elems#triggerStateless| xs@@35) (|list#trigger| Heap@@39 (list xs@@35)))
)))
(assert (forall ((o T@U) (f T@U) (Heap@@40 T@U) ) (!  (=> (and (and (and (= (type o) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap@@40) (MapType0Type RefType))) (U_2_bool (MapType0Select Heap@@40 o $allocated))) (U_2_bool (MapType0Select Heap@@40 (MapType0Select Heap@@40 o f) $allocated)))
 :qid |stdinbpl.31:15|
 :skolemid |0|
 :pattern ( (MapType0Select Heap@@40 o f))
)))
(assert (forall ((s@@10 T@U) (t@@3 T@U) (n@@8 Int) ) (! (let ((T@@24 (SeqTypeInv0 (type s@@10))))
 (=> (and (and (= (type s@@10) (SeqType T@@24)) (= (type t@@3) (SeqType T@@24))) (and (< 0 n@@8) (<= n@@8 (|Seq#Length| s@@10)))) (= (|Seq#Take| (|Seq#Append| s@@10 t@@3) n@@8) (|Seq#Take| s@@10 n@@8))))
 :qid |stdinbpl.357:18|
 :skolemid |41|
 :pattern ( (|Seq#Take| (|Seq#Append| s@@10 t@@3) n@@8))
)))
(assert (forall ((s@@11 T@U) (i@@3 Int) (v@@1 T@U) ) (! (let ((T@@25 (type v@@1)))
 (=> (= (type s@@11) (SeqType T@@25)) (=> (and (<= 0 i@@3) (< i@@3 (|Seq#Length| s@@11))) (= (|Seq#Length| (|Seq#Update| s@@11 i@@3 v@@1)) (|Seq#Length| s@@11)))))
 :qid |stdinbpl.256:18|
 :skolemid |34|
 :pattern ( (|Seq#Length| (|Seq#Update| s@@11 i@@3 v@@1)))
 :pattern ( (|Seq#Length| s@@11) (|Seq#Update| s@@11 i@@3 v@@1))
)))
(assert (forall ((xs@@36 T@U) ) (!  (=> (= (type xs@@36) RefType) (= (PredicateMaskField (list xs@@36)) (|list#sm| xs@@36)))
 :qid |stdinbpl.1844:15|
 :skolemid |104|
 :pattern ( (PredicateMaskField (list xs@@36)))
)))
(assert (forall ((s@@12 T@U) (t@@4 T@U) (n@@9 Int) ) (! (let ((T@@26 (SeqTypeInv0 (type s@@12))))
 (=> (and (and (= (type s@@12) (SeqType T@@26)) (= (type t@@4) (SeqType T@@26))) (and (< 0 n@@9) (<= n@@9 (|Seq#Length| s@@12)))) (= (|Seq#Drop| (|Seq#Append| s@@12 t@@4) n@@9) (|Seq#Append| (|Seq#Drop| s@@12 n@@9) t@@4))))
 :qid |stdinbpl.370:18|
 :skolemid |43|
 :pattern ( (|Seq#Drop| (|Seq#Append| s@@12 t@@4) n@@9))
)))
(assert (forall ((s@@13 T@U) (n@@10 Int) (i@@4 Int) ) (! (let ((T@@27 (SeqTypeInv0 (type s@@13))))
 (=> (= (type s@@13) (SeqType T@@27)) (=> (and (and (< 0 n@@10) (<= n@@10 i@@4)) (< i@@4 (|Seq#Length| s@@13))) (and (= (|Seq#Add| (|Seq#Sub| i@@4 n@@10) n@@10) i@@4) (= (|Seq#Index| (|Seq#Drop| s@@13 n@@10) (|Seq#Sub| i@@4 n@@10)) (|Seq#Index| s@@13 i@@4))))))
 :qid |stdinbpl.307:18|
 :skolemid |40|
 :pattern ( (|Seq#Drop| s@@13 n@@10) (|Seq#Index| s@@13 i@@4))
)))
(assert (forall ((Heap@@41 T@U) (Mask@@24 T@U) (xs@@37 T@U) (x@@12 Int) ) (!  (=> (and (and (and (= (type Heap@@41) (MapType0Type RefType)) (= (type Mask@@24) (MapType1Type RefType realType))) (= (type xs@@37) RefType)) (state Heap@@41 Mask@@24)) (= (|contains'| Heap@@41 xs@@37 x@@12) (|contains#frame| (MapType0Select Heap@@41 null (list xs@@37)) xs@@37 x@@12)))
 :qid |stdinbpl.1243:15|
 :skolemid |87|
 :pattern ( (state Heap@@41 Mask@@24) (|contains'| Heap@@41 xs@@37 x@@12))
 :pattern ( (state Heap@@41 Mask@@24) (|contains#triggerStateless| xs@@37 x@@12) (|list#trigger| Heap@@41 (list xs@@37)))
)))
(assert (forall ((s0@@3 T@U) (s1@@3 T@U) (n@@11 Int) ) (! (let ((T@@28 (SeqTypeInv0 (type s0@@3))))
 (=> (and (= (type s0@@3) (SeqType T@@28)) (= (type s1@@3) (SeqType T@@28))) (=> (and (and (and (not (= s0@@3 (|Seq#Empty| T@@28))) (not (= s1@@3 (|Seq#Empty| T@@28)))) (<= 0 n@@11)) (< n@@11 (|Seq#Length| s0@@3))) (= (|Seq#Index| (|Seq#Append| s0@@3 s1@@3) n@@11) (|Seq#Index| s0@@3 n@@11)))))
 :qid |stdinbpl.247:18|
 :skolemid |31|
 :pattern ( (|Seq#Index| (|Seq#Append| s0@@3 s1@@3) n@@11))
 :pattern ( (|Seq#Index| s0@@3 n@@11) (|Seq#Append| s0@@3 s1@@3))
)))
(assert (forall ((Heap@@42 T@U) (o@@0 T@U) (f_3 T@U) (v@@2 T@U) ) (! (let ((B@@8 (type v@@2)))
(let ((A@@9 (FieldTypeInv0 (type f_3))))
 (=> (and (and (= (type Heap@@42) (MapType0Type RefType)) (= (type o@@0) RefType)) (= (type f_3) (FieldType A@@9 B@@8))) (succHeap Heap@@42 (MapType0Store Heap@@42 o@@0 f_3 v@@2)))))
 :qid |stdinbpl.78:22|
 :skolemid |9|
 :pattern ( (MapType0Store Heap@@42 o@@0 f_3 v@@2))
)))
(assert (forall ((s0@@4 T@U) (s1@@4 T@U) (m@@7 Int) ) (! (let ((T@@29 (SeqTypeInv0 (type s0@@4))))
 (=> (and (= (type s0@@4) (SeqType T@@29)) (= (type s1@@4) (SeqType T@@29))) (=> (and (and (and (not (= s0@@4 (|Seq#Empty| T@@29))) (not (= s1@@4 (|Seq#Empty| T@@29)))) (<= 0 m@@7)) (< m@@7 (|Seq#Length| s1@@4))) (and (= (|Seq#Sub| (|Seq#Add| m@@7 (|Seq#Length| s0@@4)) (|Seq#Length| s0@@4)) m@@7) (= (|Seq#Index| (|Seq#Append| s0@@4 s1@@4) (|Seq#Add| m@@7 (|Seq#Length| s0@@4))) (|Seq#Index| s1@@4 m@@7))))))
 :qid |stdinbpl.252:18|
 :skolemid |33|
 :pattern ( (|Seq#Index| s1@@4 m@@7) (|Seq#Append| s0@@4 s1@@4))
)))
(assert (forall ((Heap@@43 T@U) (Mask@@25 T@U) (xs@@38 T@U) (index@@1 Int) ) (!  (=> (and (and (and (and (= (type Heap@@43) (MapType0Type RefType)) (= (type Mask@@25) (MapType1Type RefType realType))) (= (type xs@@38) RefType)) (and (state Heap@@43 Mask@@25) (< AssumeFunctionsAbove 5))) (and (not (= xs@@38 null)) (and (<= 0 index@@1) (< index@@1 (length Heap@@43 xs@@38))))) (= (get Heap@@43 xs@@38 index@@1) (ite (= index@@1 0) (U_2_int (MapType0Select Heap@@43 xs@@38 val)) (|get'| Heap@@43 (MapType0Select Heap@@43 xs@@38 next) (- index@@1 1)))))
 :qid |stdinbpl.1521:15|
 :skolemid |96|
 :pattern ( (state Heap@@43 Mask@@25) (get Heap@@43 xs@@38 index@@1))
 :pattern ( (state Heap@@43 Mask@@25) (|get#triggerStateless| xs@@38 index@@1) (|list#trigger| Heap@@43 (list xs@@38)))
)))
(assert (= (type ZeroPMask) (MapType1Type RefType boolType)))
(assert (forall ((o_2@@3 T@U) (f_4@@3 T@U) ) (! (let ((B@@9 (FieldTypeInv1 (type f_4@@3))))
(let ((A@@10 (FieldTypeInv0 (type f_4@@3))))
 (=> (and (= (type o_2@@3) RefType) (= (type f_4@@3) (FieldType A@@10 B@@9))) (not (U_2_bool (MapType1Select ZeroPMask o_2@@3 f_4@@3))))))
 :qid |stdinbpl.112:22|
 :skolemid |14|
 :pattern ( (MapType1Select ZeroPMask o_2@@3 f_4@@3))
)))
(assert (forall ((s@@14 T@U) (x@@13 T@U) (i@@5 Int) ) (! (let ((T@@30 (type x@@13)))
 (=> (= (type s@@14) (SeqType T@@30)) (=> (and (and (<= 0 i@@5) (< i@@5 (|Seq#Length| s@@14))) (= (|Seq#Index| s@@14 i@@5) x@@13)) (|Seq#Contains| s@@14 x@@13))))
 :qid |stdinbpl.403:18|
 :skolemid |48|
 :pattern ( (|Seq#Contains| s@@14 x@@13) (|Seq#Index| s@@14 i@@5))
)))
(assert (forall ((s0@@5 T@U) (s1@@5 T@U) ) (! (let ((T@@31 (SeqTypeInv0 (type s0@@5))))
 (=> (and (= (type s0@@5) (SeqType T@@31)) (= (type s1@@5) (SeqType T@@31))) (or (or (and (= s0@@5 s1@@5) (|Seq#Equal| s0@@5 s1@@5)) (and (and (not (= s0@@5 s1@@5)) (not (|Seq#Equal| s0@@5 s1@@5))) (not (= (|Seq#Length| s0@@5) (|Seq#Length| s1@@5))))) (and (and (and (and (and (and (not (= s0@@5 s1@@5)) (not (|Seq#Equal| s0@@5 s1@@5))) (= (|Seq#Length| s0@@5) (|Seq#Length| s1@@5))) (= (|Seq#SkolemDiff| s0@@5 s1@@5) (|Seq#SkolemDiff| s1@@5 s0@@5))) (<= 0 (|Seq#SkolemDiff| s0@@5 s1@@5))) (< (|Seq#SkolemDiff| s0@@5 s1@@5) (|Seq#Length| s0@@5))) (not (= (|Seq#Index| s0@@5 (|Seq#SkolemDiff| s0@@5 s1@@5)) (|Seq#Index| s1@@5 (|Seq#SkolemDiff| s0@@5 s1@@5))))))))
 :qid |stdinbpl.507:18|
 :skolemid |52|
 :pattern ( (|Seq#Equal| s0@@5 s1@@5))
)))
(assert (forall ((p@@1 T@U) (v_1@@0 T@U) (q T@U) (w@@0 T@U) (r T@U) (u T@U) ) (! (let ((C@@3 (FieldTypeInv0 (type r))))
(let ((B@@10 (FieldTypeInv0 (type q))))
(let ((A@@11 (FieldTypeInv0 (type p@@1))))
 (=> (and (and (and (and (and (and (= (type p@@1) (FieldType A@@11 FrameTypeType)) (= (type v_1@@0) FrameTypeType)) (= (type q) (FieldType B@@10 FrameTypeType))) (= (type w@@0) FrameTypeType)) (= (type r) (FieldType C@@3 FrameTypeType))) (= (type u) FrameTypeType)) (and (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))) (InsidePredicate p@@1 v_1@@0 r u)))))
 :qid |stdinbpl.176:25|
 :skolemid |20|
 :pattern ( (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))
)))
(assert (forall ((Heap@@44 T@U) (Mask@@26 T@U) (xs@@39 T@U) (index@@2 Int) ) (!  (=> (and (and (and (= (type Heap@@44) (MapType0Type RefType)) (= (type Mask@@26) (MapType1Type RefType realType))) (= (type xs@@39) RefType)) (state Heap@@44 Mask@@26)) (= (|get'| Heap@@44 xs@@39 index@@2) (|get#frame| (MapType0Select Heap@@44 null (list xs@@39)) xs@@39 index@@2)))
 :qid |stdinbpl.1528:15|
 :skolemid |97|
 :pattern ( (state Heap@@44 Mask@@26) (|get'| Heap@@44 xs@@39 index@@2))
 :pattern ( (state Heap@@44 Mask@@26) (|get#triggerStateless| xs@@39 index@@2) (|list#trigger| Heap@@44 (list xs@@39)))
)))
(assert (forall ((s@@15 T@U) ) (! (let ((T@@32 (SeqTypeInv0 (type s@@15))))
 (=> (and (= (type s@@15) (SeqType T@@32)) (= (|Seq#Length| s@@15) 0)) (= s@@15 (|Seq#Empty| T@@32))))
 :qid |stdinbpl.211:18|
 :skolemid |24|
 :pattern ( (|Seq#Length| s@@15))
)))
(assert (forall ((s@@16 T@U) (n@@12 Int) ) (! (let ((T@@33 (SeqTypeInv0 (type s@@16))))
 (=> (and (= (type s@@16) (SeqType T@@33)) (<= n@@12 0)) (= (|Seq#Take| s@@16 n@@12) (|Seq#Empty| T@@33))))
 :qid |stdinbpl.386:18|
 :skolemid |46|
 :pattern ( (|Seq#Take| s@@16 n@@12))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
(assert (forall ((Heap@@45 T@U) (Mask@@27 T@U) (xs@@40 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@45) (MapType0Type RefType)) (= (type Mask@@27) (MapType1Type RefType realType))) (= (type xs@@40) RefType)) (and (state Heap@@45 Mask@@27) (< AssumeFunctionsAbove 1))) (not (= xs@@40 null))) (= (sum Heap@@45 xs@@40) (+ (U_2_int (MapType0Select Heap@@45 xs@@40 val)) (ite (= (MapType0Select Heap@@45 xs@@40 next) null) 0 (|sum'| Heap@@45 (MapType0Select Heap@@45 xs@@40 next))))))
 :qid |stdinbpl.728:15|
 :skolemid |66|
 :pattern ( (state Heap@@45 Mask@@27) (sum Heap@@45 xs@@40))
 :pattern ( (state Heap@@45 Mask@@27) (|sum#triggerStateless| xs@@40) (|list#trigger| Heap@@45 (list xs@@40)))
)))
(assert (forall ((Heap@@46 T@U) (xs@@41 T@U) (x@@14 Int) ) (!  (=> (and (= (type Heap@@46) (MapType0Type RefType)) (= (type xs@@41) RefType)) (and (= (contains Heap@@46 xs@@41 x@@14) (|contains'| Heap@@46 xs@@41 x@@14)) (dummyFunction (bool_2_U (|contains#triggerStateless| xs@@41 x@@14)))))
 :qid |stdinbpl.1226:15|
 :skolemid |84|
 :pattern ( (contains Heap@@46 xs@@41 x@@14))
)))
; Valid

(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun Heap@8 () T@U)
(declare-fun xs@@42 () T@U)
(declare-fun i_1_1 () Int)
(declare-fun ys () T@U)
(declare-fun UnfoldingMask@5 () T@U)
(declare-fun UnfoldingMask@4 () T@U)
(declare-fun i_1 () Int)
(declare-fun ExhaleWellDef0Mask@0 () T@U)
(declare-fun Mask@7 () T@U)
(declare-fun Heap@16 () T@U)
(declare-fun Heap@14 () T@U)
(declare-fun newPMask@2 () T@U)
(declare-fun Heap@15 () T@U)
(declare-fun Heap@12 () T@U)
(declare-fun Heap@13 () T@U)
(declare-fun Heap@10 () T@U)
(declare-fun newPMask@1 () T@U)
(declare-fun Heap@11 () T@U)
(declare-fun Heap@9 () T@U)
(declare-fun UnfoldingMask@2 () T@U)
(declare-fun UnfoldingMask@3 () T@U)
(declare-fun UnfoldingMask@0 () T@U)
(declare-fun UnfoldingMask@1 () T@U)
(declare-fun CombineFrames (T@U T@U) T@U)
(declare-fun FrameFragment (T@U) T@U)
(declare-fun ExhaleWellDef0Mask@1 () T@U)
(declare-fun Heap@6 () T@U)
(declare-fun newPMask@0 () T@U)
(declare-fun Heap@7 () T@U)
(declare-fun Heap@5 () T@U)
(declare-fun Heap@4 () T@U)
(declare-fun Heap@1 () T@U)
(declare-fun Heap@2 () T@U)
(declare-fun Heap@3 () T@U)
(declare-fun freshVersion@0 () T@U)
(declare-fun Mask@6 () T@U)
(declare-fun Mask@5 () T@U)
(declare-fun Mask@4 () T@U)
(declare-fun Mask@3 () T@U)
(declare-fun Mask@2 () T@U)
(declare-fun Heap@@47 () T@U)
(declare-fun Mask@0 () T@U)
(declare-fun Mask@1 () T@U)
(declare-fun Heap@0 () T@U)
(declare-fun x@@15 () Int)
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (= (type ExhaleWellDef0Mask@1) (MapType1Type RefType realType)) (= (type Mask@7) (MapType1Type RefType realType))) (= (type xs@@42) RefType)) (= (type Heap@8) (MapType0Type RefType))) (= (type ExhaleWellDef0Mask@0) (MapType1Type RefType realType))) (= (type UnfoldingMask@5) (MapType1Type RefType realType))) (= (type UnfoldingMask@4) (MapType1Type RefType realType))) (= (type ys) RefType)) (= (type Heap@16) (MapType0Type RefType))) (= (type Heap@14) (MapType0Type RefType))) (= (type newPMask@2) (MapType1Type RefType boolType))) (= (type Heap@15) (MapType0Type RefType))) (= (type Heap@12) (MapType0Type RefType))) (= (type Heap@13) (MapType0Type RefType))) (= (type Heap@10) (MapType0Type RefType))) (= (type newPMask@1) (MapType1Type RefType boolType))) (= (type Heap@11) (MapType0Type RefType))) (= (type Heap@9) (MapType0Type RefType))) (= (type UnfoldingMask@3) (MapType1Type RefType realType))) (= (type UnfoldingMask@2) (MapType1Type RefType realType))) (= (type UnfoldingMask@0) (MapType1Type RefType realType))) (= (type UnfoldingMask@1) (MapType1Type RefType realType))) (forall ((arg0@@45 T@U) (arg1@@22 T@U) ) (! (= (type (CombineFrames arg0@@45 arg1@@22)) FrameTypeType)
 :qid |funType:CombineFrames|
 :pattern ( (CombineFrames arg0@@45 arg1@@22))
))) (forall ((arg0@@46 T@U) ) (! (= (type (FrameFragment arg0@@46)) FrameTypeType)
 :qid |funType:FrameFragment|
 :pattern ( (FrameFragment arg0@@46))
))) (= (type Heap@6) (MapType0Type RefType))) (= (type newPMask@0) (MapType1Type RefType boolType))) (= (type Heap@7) (MapType0Type RefType))) (= (type Heap@5) (MapType0Type RefType))) (= (type Heap@4) (MapType0Type RefType))) (= (type Heap@2) (MapType0Type RefType))) (= (type Heap@1) (MapType0Type RefType))) (= (type Heap@3) (MapType0Type RefType))) (= (type freshVersion@0) FrameTypeType)) (= (type Mask@6) (MapType1Type RefType realType))) (= (type Mask@4) (MapType1Type RefType realType))) (= (type Mask@5) (MapType1Type RefType realType))) (= (type Mask@3) (MapType1Type RefType realType))) (= (type Mask@2) (MapType1Type RefType realType))) (= (type Heap@@47) (MapType0Type RefType))) (= (type Mask@0) (MapType1Type RefType realType))) (= (type Mask@1) (MapType1Type RefType realType))) (= (type Heap@0) (MapType0Type RefType))))
(set-info :boogie-vc-id test02)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 68) (let ((anon39_correct true))
(let ((anon60_Else_correct  (=> (and (not (|Seq#Contains| (|Seq#Range| 1 (length Heap@8 xs@@42)) (int_2_U i_1_1))) (= (ControlFlow 0 42) 39)) anon39_correct)))
(let ((anon60_Then_correct  (=> (|Seq#Contains| (|Seq#Range| 1 (length Heap@8 xs@@42)) (int_2_U i_1_1)) (and (=> (= (ControlFlow 0 40) (- 0 41)) (= (get Heap@8 xs@@42 i_1_1) (get Heap@8 ys (- i_1_1 1)))) (=> (= (get Heap@8 xs@@42 i_1_1) (get Heap@8 ys (- i_1_1 1))) (=> (= (ControlFlow 0 40) 39) anon39_correct))))))
(let ((anon29_correct  (=> (= UnfoldingMask@5 (MapType1Store UnfoldingMask@4 null (list ys) (real_2_U (- (U_2_real (MapType1Select UnfoldingMask@4 null (list ys))) FullPerm)))) (and (=> (= (ControlFlow 0 17) (- 0 19)) (not (= ys null))) (=> (not (= ys null)) (and (=> (= (ControlFlow 0 17) (- 0 18)) (<= 0 (- i_1 1))) (=> (<= 0 (- i_1 1)) (=> (= (ControlFlow 0 17) (- 0 16)) (< (- i_1 1) (length Heap@8 ys))))))))))
(let ((anon56_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 22) 17)) anon29_correct)))
(let ((anon56_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 20) (- 0 21)) (<= FullPerm (U_2_real (MapType1Select UnfoldingMask@4 null (list ys))))) (=> (<= FullPerm (U_2_real (MapType1Select UnfoldingMask@4 null (list ys)))) (=> (= (ControlFlow 0 20) 17) anon29_correct))))))
(let ((anon21_correct  (=> (= ExhaleWellDef0Mask@0 (MapType1Store Mask@7 null (list xs@@42) (real_2_U (- (U_2_real (MapType1Select Mask@7 null (list xs@@42))) FullPerm)))) (and (=> (= (ControlFlow 0 10) (- 0 12)) (not (= xs@@42 null))) (=> (not (= xs@@42 null)) (and (=> (= (ControlFlow 0 10) (- 0 11)) (<= 0 i_1)) (=> (<= 0 i_1) (=> (= (ControlFlow 0 10) (- 0 9)) (< i_1 (length Heap@8 xs@@42))))))))))
(let ((anon52_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 15) 10)) anon21_correct)))
(let ((anon52_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 13) (- 0 14)) (<= FullPerm (U_2_real (MapType1Select Mask@7 null (list xs@@42))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@7 null (list xs@@42)))) (=> (= (ControlFlow 0 13) 10) anon21_correct))))))
(let ((anon35_correct true))
(let ((anon34_correct  (=> (and (state Heap@16 Mask@7) (= (ControlFlow 0 23) 7)) anon35_correct)))
(let ((anon58_Else_correct  (=> (= (MapType0Select Heap@14 xs@@42 next) null) (=> (and (= Heap@16 Heap@14) (= (ControlFlow 0 25) 23)) anon34_correct))))
(let ((anon58_Then_correct  (=> (not (= (MapType0Select Heap@14 xs@@42 next) null)) (=> (and (and (forall ((o_21 T@U) (f_25 T@U) ) (! (let ((B@@11 (FieldTypeInv1 (type f_25))))
(let ((A@@12 (FieldTypeInv0 (type f_25))))
 (=> (and (and (= (type o_21) RefType) (= (type f_25) (FieldType A@@12 B@@11))) (or (U_2_bool (MapType1Select (MapType0Select Heap@14 null (|list#sm| xs@@42)) o_21 f_25)) (U_2_bool (MapType1Select (MapType0Select Heap@14 null (|list#sm| (MapType0Select Heap@14 xs@@42 next))) o_21 f_25)))) (U_2_bool (MapType1Select newPMask@2 o_21 f_25)))))
 :qid |stdinbpl.3953:37|
 :skolemid |119|
 :pattern ( (MapType1Select newPMask@2 o_21 f_25))
)) (= Heap@15 (MapType0Store Heap@14 null (|list#sm| xs@@42) newPMask@2))) (and (= Heap@16 Heap@15) (= (ControlFlow 0 24) 23))) anon34_correct))))
(let ((anon32_correct  (=> (state Heap@12 Mask@7) (=> (and (= Heap@13 (MapType0Store Heap@12 null (|list#sm| xs@@42) (MapType1Store (MapType0Select Heap@12 null (|list#sm| xs@@42)) xs@@42 next (bool_2_U true)))) (= Heap@14 (MapType0Store Heap@13 null (|list#sm| xs@@42) (MapType1Store (MapType0Select Heap@13 null (|list#sm| xs@@42)) xs@@42 val (bool_2_U true))))) (and (=> (= (ControlFlow 0 26) 24) anon58_Then_correct) (=> (= (ControlFlow 0 26) 25) anon58_Else_correct))))))
(let ((anon57_Else_correct  (=> (= (MapType0Select Heap@10 xs@@42 next) null) (=> (and (= Heap@12 Heap@10) (= (ControlFlow 0 28) 26)) anon32_correct))))
(let ((anon57_Then_correct  (=> (not (= (MapType0Select Heap@10 xs@@42 next) null)) (=> (and (and (forall ((o_20 T@U) (f_24 T@U) ) (! (let ((B@@12 (FieldTypeInv1 (type f_24))))
(let ((A@@13 (FieldTypeInv0 (type f_24))))
 (=> (and (and (= (type o_20) RefType) (= (type f_24) (FieldType A@@13 B@@12))) (or (U_2_bool (MapType1Select (MapType0Select Heap@10 null (|list#sm| xs@@42)) o_20 f_24)) (U_2_bool (MapType1Select (MapType0Select Heap@10 null (|list#sm| (MapType0Select Heap@10 xs@@42 next))) o_20 f_24)))) (U_2_bool (MapType1Select newPMask@1 o_20 f_24)))))
 :qid |stdinbpl.3940:37|
 :skolemid |118|
 :pattern ( (MapType1Select newPMask@1 o_20 f_24))
)) (= Heap@11 (MapType0Store Heap@10 null (|list#sm| xs@@42) newPMask@1))) (and (= Heap@12 Heap@11) (= (ControlFlow 0 27) 26))) anon32_correct))))
(let ((anon55_Else_correct  (=> (and (= Heap@9 (MapType0Store Heap@8 null (|list#sm| xs@@42) (MapType1Store (MapType0Select Heap@8 null (|list#sm| xs@@42)) xs@@42 next (bool_2_U true)))) (= Heap@10 (MapType0Store Heap@9 null (|list#sm| xs@@42) (MapType1Store (MapType0Select Heap@9 null (|list#sm| xs@@42)) xs@@42 val (bool_2_U true))))) (and (=> (= (ControlFlow 0 29) 27) anon57_Then_correct) (=> (= (ControlFlow 0 29) 28) anon57_Else_correct)))))
(let ((anon26_correct  (=> (state Heap@8 UnfoldingMask@4) (and (and (=> (= (ControlFlow 0 30) 29) anon55_Else_correct) (=> (= (ControlFlow 0 30) 20) anon56_Then_correct)) (=> (= (ControlFlow 0 30) 22) anon56_Else_correct)))))
(let ((anon54_Else_correct  (=> (= (MapType0Select Heap@8 xs@@42 next) null) (=> (and (= UnfoldingMask@4 UnfoldingMask@2) (= (ControlFlow 0 32) 30)) anon26_correct))))
(let ((anon54_Then_correct  (=> (not (= (MapType0Select Heap@8 xs@@42 next) null)) (=> (and (= UnfoldingMask@3 (MapType1Store UnfoldingMask@2 null (list (MapType0Select Heap@8 xs@@42 next)) (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@2 null (list (MapType0Select Heap@8 xs@@42 next)))) FullPerm)))) (InsidePredicate (list xs@@42) (MapType0Select Heap@8 null (list xs@@42)) (list (MapType0Select Heap@8 xs@@42 next)) (MapType0Select Heap@8 null (list (MapType0Select Heap@8 xs@@42 next))))) (=> (and (and (state Heap@8 UnfoldingMask@3) (not (= (MapType0Select Heap@8 xs@@42 next) null))) (and (= UnfoldingMask@4 UnfoldingMask@3) (= (ControlFlow 0 31) 30))) anon26_correct)))))
(let ((anon24_correct  (=> (= UnfoldingMask@0 (MapType1Store Mask@7 null (list xs@@42) (real_2_U (- (U_2_real (MapType1Select Mask@7 null (list xs@@42))) FullPerm)))) (=> (and (not (= xs@@42 null)) (= UnfoldingMask@1 (MapType1Store UnfoldingMask@0 xs@@42 next (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@0 xs@@42 next)) FullPerm))))) (=> (and (and (state Heap@8 UnfoldingMask@1) (not (= xs@@42 null))) (and (= UnfoldingMask@2 (MapType1Store UnfoldingMask@1 xs@@42 val (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@1 xs@@42 val)) FullPerm)))) (state Heap@8 UnfoldingMask@2))) (and (=> (= (ControlFlow 0 33) 31) anon54_Then_correct) (=> (= (ControlFlow 0 33) 32) anon54_Else_correct)))))))
(let ((anon53_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 36) 33)) anon24_correct)))
(let ((anon53_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 34) (- 0 35)) (<= FullPerm (U_2_real (MapType1Select Mask@7 null (list xs@@42))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@7 null (list xs@@42)))) (=> (= (ControlFlow 0 34) 33) anon24_correct))))))
(let ((anon51_Else_correct  (=> (and (|list#trigger| Heap@8 (list xs@@42)) (= (MapType0Select Heap@8 null (list xs@@42)) (CombineFrames (FrameFragment (MapType0Select Heap@8 xs@@42 next)) (CombineFrames (FrameFragment (MapType0Select Heap@8 xs@@42 val)) (FrameFragment (ite (not (= (MapType0Select Heap@8 xs@@42 next) null)) (MapType0Select Heap@8 null (list (MapType0Select Heap@8 xs@@42 next))) EmptyFrame)))))) (and (=> (= (ControlFlow 0 37) 34) anon53_Then_correct) (=> (= (ControlFlow 0 37) 36) anon53_Else_correct)))))
(let ((anon50_Then_correct  (=> (|Seq#Contains| (|Seq#Range| 1 (length Heap@8 xs@@42)) (int_2_U i_1)) (and (and (=> (= (ControlFlow 0 38) 37) anon51_Else_correct) (=> (= (ControlFlow 0 38) 13) anon52_Then_correct)) (=> (= (ControlFlow 0 38) 15) anon52_Else_correct)))))
(let ((anon50_Else_correct  (=> (and (not (|Seq#Contains| (|Seq#Range| 1 (length Heap@8 xs@@42)) (int_2_U i_1))) (= (ControlFlow 0 8) 7)) anon35_correct)))
(let ((anon16_correct  (=> (and (= ExhaleWellDef0Mask@1 (MapType1Store Mask@7 null (list xs@@42) (real_2_U (- (U_2_real (MapType1Select Mask@7 null (list xs@@42))) FullPerm)))) (= (ControlFlow 0 3) (- 0 2))) (not (= xs@@42 null)))))
(let ((anon49_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 6) 3)) anon16_correct)))
(let ((anon49_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 4) (- 0 5)) (<= FullPerm (U_2_real (MapType1Select Mask@7 null (list xs@@42))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@7 null (list xs@@42)))) (=> (= (ControlFlow 0 4) 3) anon16_correct))))))
(let ((anon59_Else_correct true))
(let ((anon12_correct  (=> (and (state Heap@8 Mask@7) (state Heap@8 Mask@7)) (and (and (and (and (and (and (=> (= (ControlFlow 0 43) 1) anon59_Else_correct) (=> (= (ControlFlow 0 43) 40) anon60_Then_correct)) (=> (= (ControlFlow 0 43) 42) anon60_Else_correct)) (=> (= (ControlFlow 0 43) 38) anon50_Then_correct)) (=> (= (ControlFlow 0 43) 8) anon50_Else_correct)) (=> (= (ControlFlow 0 43) 4) anon49_Then_correct)) (=> (= (ControlFlow 0 43) 6) anon49_Else_correct)))))
(let ((anon46_Else_correct  (=> (= (MapType0Select Heap@6 xs@@42 next) null) (=> (and (= Heap@8 Heap@6) (= (ControlFlow 0 45) 43)) anon12_correct))))
(let ((anon46_Then_correct  (=> (not (= (MapType0Select Heap@6 xs@@42 next) null)) (=> (and (and (forall ((o_19 T@U) (f_23 T@U) ) (! (let ((B@@13 (FieldTypeInv1 (type f_23))))
(let ((A@@14 (FieldTypeInv0 (type f_23))))
 (=> (and (and (= (type o_19) RefType) (= (type f_23) (FieldType A@@14 B@@13))) (or (U_2_bool (MapType1Select (MapType0Select Heap@6 null (|list#sm| xs@@42)) o_19 f_23)) (U_2_bool (MapType1Select (MapType0Select Heap@6 null (|list#sm| (MapType0Select Heap@6 xs@@42 next))) o_19 f_23)))) (U_2_bool (MapType1Select newPMask@0 o_19 f_23)))))
 :qid |stdinbpl.3819:29|
 :skolemid |117|
 :pattern ( (MapType1Select newPMask@0 o_19 f_23))
)) (= Heap@7 (MapType0Store Heap@6 null (|list#sm| xs@@42) newPMask@0))) (and (= Heap@8 Heap@7) (= (ControlFlow 0 44) 43))) anon12_correct))))
(let ((anon10_correct  (=> (and (= Heap@5 (MapType0Store Heap@4 null (|list#sm| xs@@42) (MapType1Store (MapType0Select Heap@4 null (|list#sm| xs@@42)) xs@@42 next (bool_2_U true)))) (= Heap@6 (MapType0Store Heap@5 null (|list#sm| xs@@42) (MapType1Store (MapType0Select Heap@5 null (|list#sm| xs@@42)) xs@@42 val (bool_2_U true))))) (and (=> (= (ControlFlow 0 46) 44) anon46_Then_correct) (=> (= (ControlFlow 0 46) 45) anon46_Else_correct)))))
(let ((anon45_Else_correct  (=> (HasDirectPerm Mask@7 null (list xs@@42)) (=> (and (= Heap@4 Heap@1) (= (ControlFlow 0 48) 46)) anon10_correct))))
(let ((anon45_Then_correct  (=> (not (HasDirectPerm Mask@7 null (list xs@@42))) (=> (and (and (= Heap@2 (MapType0Store Heap@1 null (|list#sm| xs@@42) ZeroPMask)) (= Heap@3 (MapType0Store Heap@2 null (list xs@@42) freshVersion@0))) (and (= Heap@4 Heap@3) (= (ControlFlow 0 47) 46))) anon10_correct))))
(let ((anon8_correct  (=> (= Mask@7 (MapType1Store Mask@6 null (list xs@@42) (real_2_U (+ (U_2_real (MapType1Select Mask@6 null (list xs@@42))) FullPerm)))) (=> (and (and (state Heap@1 Mask@7) (state Heap@1 Mask@7)) (and (|list#trigger| Heap@1 (list xs@@42)) (= (MapType0Select Heap@1 null (list xs@@42)) (CombineFrames (FrameFragment (MapType0Select Heap@1 xs@@42 next)) (CombineFrames (FrameFragment (MapType0Select Heap@1 xs@@42 val)) (FrameFragment (ite (not (= (MapType0Select Heap@1 xs@@42 next) null)) (MapType0Select Heap@1 null (list (MapType0Select Heap@1 xs@@42 next))) EmptyFrame))))))) (and (=> (= (ControlFlow 0 49) 47) anon45_Then_correct) (=> (= (ControlFlow 0 49) 48) anon45_Else_correct))))))
(let ((anon7_correct  (=> (and (= Mask@5 (MapType1Store Mask@4 null (list (MapType0Select Heap@1 xs@@42 next)) (real_2_U (- (U_2_real (MapType1Select Mask@4 null (list (MapType0Select Heap@1 xs@@42 next)))) FullPerm)))) (InsidePredicate (list xs@@42) (MapType0Select Heap@1 null (list xs@@42)) (list (MapType0Select Heap@1 xs@@42 next)) (MapType0Select Heap@1 null (list (MapType0Select Heap@1 xs@@42 next))))) (and (=> (= (ControlFlow 0 51) (- 0 52)) (not (= (MapType0Select Heap@1 xs@@42 next) null))) (=> (not (= (MapType0Select Heap@1 xs@@42 next) null)) (=> (and (= Mask@6 Mask@5) (= (ControlFlow 0 51) 49)) anon8_correct))))))
(let ((anon44_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 55) 51)) anon7_correct)))
(let ((anon44_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 53) (- 0 54)) (<= FullPerm (U_2_real (MapType1Select Mask@4 null (list (MapType0Select Heap@1 xs@@42 next)))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@4 null (list (MapType0Select Heap@1 xs@@42 next))))) (=> (= (ControlFlow 0 53) 51) anon7_correct))))))
(let ((anon43_Then_correct  (=> (not (= (MapType0Select Heap@1 xs@@42 next) null)) (and (=> (= (ControlFlow 0 56) 53) anon44_Then_correct) (=> (= (ControlFlow 0 56) 55) anon44_Else_correct)))))
(let ((anon43_Else_correct  (=> (= (MapType0Select Heap@1 xs@@42 next) null) (=> (and (= Mask@6 Mask@4) (= (ControlFlow 0 50) 49)) anon8_correct))))
(let ((anon4_correct  (=> (= Mask@4 (MapType1Store Mask@3 xs@@42 val (real_2_U (- (U_2_real (MapType1Select Mask@3 xs@@42 val)) FullPerm)))) (and (=> (= (ControlFlow 0 57) 56) anon43_Then_correct) (=> (= (ControlFlow 0 57) 50) anon43_Else_correct)))))
(let ((anon42_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 60) 57)) anon4_correct)))
(let ((anon42_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 58) (- 0 59)) (<= FullPerm (U_2_real (MapType1Select Mask@3 xs@@42 val)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@3 xs@@42 val))) (=> (= (ControlFlow 0 58) 57) anon4_correct))))))
(let ((anon2_correct  (=> (= Mask@3 (MapType1Store Mask@2 xs@@42 next (real_2_U (- (U_2_real (MapType1Select Mask@2 xs@@42 next)) FullPerm)))) (and (=> (= (ControlFlow 0 61) 58) anon42_Then_correct) (=> (= (ControlFlow 0 61) 60) anon42_Else_correct)))))
(let ((anon41_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 64) 61)) anon2_correct)))
(let ((anon41_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 62) (- 0 63)) (<= FullPerm (U_2_real (MapType1Select Mask@2 xs@@42 next)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@2 xs@@42 next))) (=> (= (ControlFlow 0 62) 61) anon2_correct))))))
(let ((anon0_correct  (=> (and (and (and (and (state Heap@@47 ZeroMask) (= AssumeFunctionsAbove (- 0 1))) (and (U_2_bool (MapType0Select Heap@@47 xs@@42 $allocated)) (U_2_bool (MapType0Select Heap@@47 ys $allocated)))) (and (and (not (= ys null)) (state Heap@@47 ZeroMask)) (and (= Mask@0 (MapType1Store ZeroMask null (list ys) (real_2_U (+ (U_2_real (MapType1Select ZeroMask null (list ys))) FullPerm)))) (state Heap@@47 Mask@0)))) (and (and (and (state Heap@@47 Mask@0) (not (= xs@@42 null))) (and (= Mask@1 (MapType1Store Mask@0 xs@@42 val (real_2_U (+ (U_2_real (MapType1Select Mask@0 xs@@42 val)) FullPerm)))) (state Heap@@47 Mask@1))) (and (and (not (= xs@@42 null)) (= Mask@2 (MapType1Store Mask@1 xs@@42 next (real_2_U (+ (U_2_real (MapType1Select Mask@1 xs@@42 next)) FullPerm))))) (and (state Heap@@47 Mask@2) (state Heap@@47 Mask@2))))) (and (=> (= (ControlFlow 0 65) (- 0 67)) (= FullPerm (U_2_real (MapType1Select Mask@2 xs@@42 val)))) (=> (= FullPerm (U_2_real (MapType1Select Mask@2 xs@@42 val))) (=> (and (= Heap@0 (MapType0Store Heap@@47 xs@@42 val (int_2_U x@@15))) (state Heap@0 Mask@2)) (and (=> (= (ControlFlow 0 65) (- 0 66)) (= FullPerm (U_2_real (MapType1Select Mask@2 xs@@42 next)))) (=> (= FullPerm (U_2_real (MapType1Select Mask@2 xs@@42 next))) (=> (and (= Heap@1 (MapType0Store Heap@0 xs@@42 next ys)) (state Heap@1 Mask@2)) (and (=> (= (ControlFlow 0 65) 62) anon41_Then_correct) (=> (= (ControlFlow 0 65) 64) anon41_Else_correct)))))))))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 68) 65) anon0_correct)))
PreconditionGeneratedEntry_correct)))))))))))))))))))))))))))))))))))))))))))))))))))
))
(check-sat)
(pop 1)
; Valid
(get-info :rlimit)
