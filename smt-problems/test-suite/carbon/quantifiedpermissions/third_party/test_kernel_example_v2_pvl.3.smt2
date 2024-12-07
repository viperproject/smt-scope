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
(declare-fun Ref__a () T@U)
(declare-fun Ref__b () T@U)
(declare-fun Ref__c () T@U)
(declare-fun Ref__Integer_value () T@U)
(declare-fun FieldType (T@T T@T) T@T)
(declare-fun FieldTypeInv0 (T@T) T@T)
(declare-fun FieldTypeInv1 (T@T) T@T)
(declare-fun NormalFieldType () T@T)
(declare-fun SeqType (T@T) T@T)
(declare-fun SeqTypeInv0 (T@T) T@T)
(declare-fun RefType () T@T)
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
(declare-fun |Seq#Contains| (T@U T@U) Bool)
(declare-fun |Seq#Range| (Int Int) T@U)
(declare-fun |Seq#Skolem| (T@U T@U) Int)
(declare-fun |Seq#Singleton| (T@U) T@U)
(declare-fun |Seq#Empty| (T@T) T@U)
(declare-fun dummyHeap () T@U)
(declare-fun ZeroMask () T@U)
(declare-fun InsidePredicate (T@U T@U T@U T@U) Bool)
(declare-fun |Seq#Append| (T@U T@U) T@U)
(declare-fun sumMask (T@U T@U T@U) Bool)
(declare-fun ConditionalFrame (Real T@U) T@U)
(declare-fun EmptyFrame () T@U)
(declare-fun NoPerm () Real)
(declare-fun |Seq#Equal| (T@U T@U) Bool)
(declare-fun |Seq#ContainsTrigger| (T@U T@U) Bool)
(declare-fun FullPerm () Real)
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
(assert  (and (and (and (and (and (and (and (and (and (and (and (forall ((arg0@@11 T@T) (arg1 T@T) ) (! (= (Ctor (FieldType arg0@@11 arg1)) 6)
 :qid |ctor:FieldType|
)) (forall ((arg0@@12 T@T) (arg1@@0 T@T) ) (! (= (FieldTypeInv0 (FieldType arg0@@12 arg1@@0)) arg0@@12)
 :qid |typeInv:FieldTypeInv0|
 :pattern ( (FieldType arg0@@12 arg1@@0))
))) (forall ((arg0@@13 T@T) (arg1@@1 T@T) ) (! (= (FieldTypeInv1 (FieldType arg0@@13 arg1@@1)) arg1@@1)
 :qid |typeInv:FieldTypeInv1|
 :pattern ( (FieldType arg0@@13 arg1@@1))
))) (= (Ctor NormalFieldType) 7)) (= (type $allocated) (FieldType NormalFieldType boolType))) (forall ((arg0@@14 T@T) ) (! (= (Ctor (SeqType arg0@@14)) 8)
 :qid |ctor:SeqType|
))) (forall ((arg0@@15 T@T) ) (! (= (SeqTypeInv0 (SeqType arg0@@15)) arg0@@15)
 :qid |typeInv:SeqTypeInv0|
 :pattern ( (SeqType arg0@@15))
))) (= (Ctor RefType) 9)) (= (type Ref__a) (FieldType NormalFieldType (SeqType RefType)))) (= (type Ref__b) (FieldType NormalFieldType (SeqType RefType)))) (= (type Ref__c) (FieldType NormalFieldType (SeqType RefType)))) (= (type Ref__Integer_value) (FieldType NormalFieldType intType))))
(assert (distinct $allocated Ref__a Ref__b Ref__c Ref__Integer_value)
)
(assert (forall ((arg0@@16 T@U) (arg1@@2 Int) ) (! (let ((T (SeqTypeInv0 (type arg0@@16))))
(= (type (|Seq#Drop| arg0@@16 arg1@@2)) (SeqType T)))
 :qid |funType:Seq#Drop|
 :pattern ( (|Seq#Drop| arg0@@16 arg1@@2))
)))
(assert (forall ((s T@U) (n Int) ) (! (let ((T@@0 (SeqTypeInv0 (type s))))
 (=> (= (type s) (SeqType T@@0)) (and (=> (<= 0 n) (and (=> (<= n (|Seq#Length| s)) (= (|Seq#Length| (|Seq#Drop| s n)) (- (|Seq#Length| s) n))) (=> (< (|Seq#Length| s) n) (= (|Seq#Length| (|Seq#Drop| s n)) 0)))) (=> (< n 0) (= (|Seq#Length| (|Seq#Drop| s n)) (|Seq#Length| s))))))
 :qid |stdinbpl.325:18|
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
 :qid |stdinbpl.346:18|
 :skolemid |39|
 :pattern ( (|Seq#Index| (|Seq#Drop| s@@0 n@@0) j))
)))
(assert  (and (and (= (Ctor FrameTypeType) 12) (= (type null) RefType)) (forall ((arg0@@27 T@U) ) (! (let ((A (FieldTypeInv0 (type arg0@@27))))
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
 :qid |stdinbpl.301:18|
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
 :qid |stdinbpl.312:18|
 :skolemid |36|
 :pattern ( (|Seq#Length| (|Seq#Take| s@@2 n@@2)))
 :pattern ( (|Seq#Take| s@@2 n@@2) (|Seq#Length| s@@2))
)))
(assert (forall ((arg0@@31 Int) (arg1@@13 Int) ) (! (= (type (|Seq#Range| arg0@@31 arg1@@13)) (SeqType intType))
 :qid |funType:Seq#Range|
 :pattern ( (|Seq#Range| arg0@@31 arg1@@13))
)))
(assert (forall ((q@min Int) (q@max Int) (v@@0 T@U) ) (!  (=> (= (type v@@0) intType) (= (|Seq#Contains| (|Seq#Range| q@min q@max) v@@0)  (and (<= q@min (U_2_int v@@0)) (< (U_2_int v@@0) q@max))))
 :qid |stdinbpl.585:15|
 :skolemid |57|
 :pattern ( (|Seq#Contains| (|Seq#Range| q@min q@max) v@@0))
)))
(assert (forall ((s@@3 T@U) (x@@8 T@U) ) (! (let ((T@@7 (type x@@8)))
 (=> (and (= (type s@@3) (SeqType T@@7)) (|Seq#Contains| s@@3 x@@8)) (and (and (<= 0 (|Seq#Skolem| s@@3 x@@8)) (< (|Seq#Skolem| s@@3 x@@8) (|Seq#Length| s@@3))) (= (|Seq#Index| s@@3 (|Seq#Skolem| s@@3 x@@8)) x@@8))))
 :qid |stdinbpl.443:18|
 :skolemid |47|
 :pattern ( (|Seq#Contains| s@@3 x@@8))
)))
(assert (forall ((Heap@@2 T@U) (ExhaleHeap@@1 T@U) (Mask@@2 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@2) (MapType0Type RefType)) (= (type ExhaleHeap@@1) (MapType0Type RefType))) (= (type Mask@@2) (MapType1Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@2 ExhaleHeap@@1 Mask@@2)) (U_2_bool (MapType0Select Heap@@2 o_1 $allocated))) (U_2_bool (MapType0Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.73:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@2 ExhaleHeap@@1 Mask@@2) (MapType0Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert (forall ((s@@4 T@U) (n@@3 Int) ) (! (let ((T@@8 (SeqTypeInv0 (type s@@4))))
 (=> (and (= (type s@@4) (SeqType T@@8)) (<= n@@3 0)) (= (|Seq#Drop| s@@4 n@@3) s@@4)))
 :qid |stdinbpl.427:18|
 :skolemid |45|
 :pattern ( (|Seq#Drop| s@@4 n@@3))
)))
(assert (forall ((i@@0 Int) (j@@0 Int) ) (! (= (|Seq#Sub| i@@0 j@@0) (- i@@0 j@@0))
 :qid |stdinbpl.281:15|
 :skolemid |30|
 :pattern ( (|Seq#Sub| i@@0 j@@0))
)))
(assert (forall ((i@@1 Int) (j@@1 Int) ) (! (= (|Seq#Add| i@@1 j@@1) (+ i@@1 j@@1))
 :qid |stdinbpl.279:15|
 :skolemid |29|
 :pattern ( (|Seq#Add| i@@1 j@@1))
)))
(assert (forall ((arg0@@32 T@U) ) (! (let ((T@@9 (type arg0@@32)))
(= (type (|Seq#Singleton| arg0@@32)) (SeqType T@@9)))
 :qid |funType:Seq#Singleton|
 :pattern ( (|Seq#Singleton| arg0@@32))
)))
(assert (forall ((x@@9 T@U) (y@@1 T@U) ) (! (let ((T@@10 (type x@@9)))
 (=> (= (type y@@1) T@@10) (= (|Seq#Contains| (|Seq#Singleton| x@@9) y@@1) (= x@@9 y@@1))))
 :qid |stdinbpl.568:18|
 :skolemid |54|
 :pattern ( (|Seq#Contains| (|Seq#Singleton| x@@9) y@@1))
)))
(assert (forall ((s@@5 T@U) (n@@4 Int) (j@@2 Int) ) (! (let ((T@@11 (SeqTypeInv0 (type s@@5))))
 (=> (= (type s@@5) (SeqType T@@11)) (=> (and (and (<= 0 j@@2) (< j@@2 n@@4)) (< j@@2 (|Seq#Length| s@@5))) (= (|Seq#Index| (|Seq#Take| s@@5 n@@4) j@@2) (|Seq#Index| s@@5 j@@2)))))
 :qid |stdinbpl.320:18|
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
 :qid |stdinbpl.224:19|
 :skolemid |21|
 :pattern ( (InsidePredicate p v_1 p w))
)))
(assert (forall ((arg0@@33 T@U) (arg1@@14 T@U) ) (! (let ((T@@14 (SeqTypeInv0 (type arg0@@33))))
(= (type (|Seq#Append| arg0@@33 arg1@@14)) (SeqType T@@14)))
 :qid |funType:Seq#Append|
 :pattern ( (|Seq#Append| arg0@@33 arg1@@14))
)))
(assert (forall ((s0 T@U) (s1 T@U) (n@@5 Int) ) (! (let ((T@@15 (SeqTypeInv0 (type s0))))
 (=> (and (= (type s0) (SeqType T@@15)) (= (type s1) (SeqType T@@15))) (=> (and (and (and (not (= s0 (|Seq#Empty| T@@15))) (not (= s1 (|Seq#Empty| T@@15)))) (<= (|Seq#Length| s0) n@@5)) (< n@@5 (|Seq#Length| (|Seq#Append| s0 s1)))) (and (= (|Seq#Add| (|Seq#Sub| n@@5 (|Seq#Length| s0)) (|Seq#Length| s0)) n@@5) (= (|Seq#Index| (|Seq#Append| s0 s1) n@@5) (|Seq#Index| s1 (|Seq#Sub| n@@5 (|Seq#Length| s0))))))))
 :qid |stdinbpl.292:18|
 :skolemid |32|
 :pattern ( (|Seq#Index| (|Seq#Append| s0 s1) n@@5))
)))
(assert  (not (IsPredicateField Ref__a)))
(assert  (not (IsWandField Ref__a)))
(assert  (not (IsPredicateField Ref__b)))
(assert  (not (IsWandField Ref__b)))
(assert  (not (IsPredicateField Ref__c)))
(assert  (not (IsWandField Ref__c)))
(assert  (not (IsPredicateField Ref__Integer_value)))
(assert  (not (IsWandField Ref__Integer_value)))
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
(assert  (and (forall ((arg0@@34 Real) (arg1@@15 T@U) ) (! (= (type (ConditionalFrame arg0@@34 arg1@@15)) FrameTypeType)
 :qid |funType:ConditionalFrame|
 :pattern ( (ConditionalFrame arg0@@34 arg1@@15))
)) (= (type EmptyFrame) FrameTypeType)))
(assert (forall ((p@@0 Real) (f_6 T@U) ) (!  (=> (= (type f_6) FrameTypeType) (= (ConditionalFrame p@@0 f_6) (ite (> p@@0 0.0) f_6 EmptyFrame)))
 :qid |stdinbpl.212:15|
 :skolemid |19|
 :pattern ( (ConditionalFrame p@@0 f_6))
)))
(assert (forall ((q@min@@0 Int) (q@max@@0 Int) (j@@3 Int) ) (!  (=> (and (<= 0 j@@3) (< j@@3 (- q@max@@0 q@min@@0))) (= (U_2_int (|Seq#Index| (|Seq#Range| q@min@@0 q@max@@0) j@@3)) (+ q@min@@0 j@@3)))
 :qid |stdinbpl.583:15|
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
(assert (forall ((s0@@0 T@U) (s1@@0 T@U) ) (! (let ((T@@16 (SeqTypeInv0 (type s0@@0))))
 (=> (and (and (= (type s0@@0) (SeqType T@@16)) (= (type s1@@0) (SeqType T@@16))) (and (not (= s0@@0 (|Seq#Empty| T@@16))) (not (= s1@@0 (|Seq#Empty| T@@16))))) (= (|Seq#Length| (|Seq#Append| s0@@0 s1@@0)) (+ (|Seq#Length| s0@@0) (|Seq#Length| s1@@0)))))
 :qid |stdinbpl.261:18|
 :skolemid |26|
 :pattern ( (|Seq#Length| (|Seq#Append| s0@@0 s1@@0)))
)))
(assert (forall ((s@@6 T@U) (t T@U) (n@@6 Int) ) (! (let ((T@@17 (SeqTypeInv0 (type s@@6))))
 (=> (and (and (= (type s@@6) (SeqType T@@17)) (= (type t) (SeqType T@@17))) (and (> n@@6 0) (> n@@6 (|Seq#Length| s@@6)))) (and (= (|Seq#Add| (|Seq#Sub| n@@6 (|Seq#Length| s@@6)) (|Seq#Length| s@@6)) n@@6) (= (|Seq#Drop| (|Seq#Append| s@@6 t) n@@6) (|Seq#Drop| t (|Seq#Sub| n@@6 (|Seq#Length| s@@6)))))))
 :qid |stdinbpl.417:18|
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
 :qid |stdinbpl.404:18|
 :skolemid |42|
 :pattern ( (|Seq#Take| (|Seq#Append| s@@7 t@@0) n@@7))
)))
(assert (forall ((q@min@@1 Int) (q@max@@1 Int) ) (!  (and (=> (< q@min@@1 q@max@@1) (= (|Seq#Length| (|Seq#Range| q@min@@1 q@max@@1)) (- q@max@@1 q@min@@1))) (=> (<= q@max@@1 q@min@@1) (= (|Seq#Length| (|Seq#Range| q@min@@1 q@max@@1)) 0)))
 :qid |stdinbpl.582:15|
 :skolemid |55|
 :pattern ( (|Seq#Length| (|Seq#Range| q@min@@1 q@max@@1)))
)))
(assert (forall ((a T@U) (b T@U) ) (! (let ((T@@19 (SeqTypeInv0 (type a))))
 (=> (and (and (= (type a) (SeqType T@@19)) (= (type b) (SeqType T@@19))) (|Seq#Equal| a b)) (= a b)))
 :qid |stdinbpl.555:18|
 :skolemid |53|
 :pattern ( (|Seq#Equal| a b))
)))
(assert (forall ((s@@8 T@U) (i@@2 Int) ) (! (let ((T@@20 (SeqTypeInv0 (type s@@8))))
 (=> (= (type s@@8) (SeqType T@@20)) (=> (and (<= 0 i@@2) (< i@@2 (|Seq#Length| s@@8))) (|Seq#ContainsTrigger| s@@8 (|Seq#Index| s@@8 i@@2)))))
 :qid |stdinbpl.448:18|
 :skolemid |49|
 :pattern ( (|Seq#Index| s@@8 i@@2))
)))
(assert (forall ((s0@@1 T@U) (s1@@1 T@U) ) (! (let ((T@@21 (SeqTypeInv0 (type s0@@1))))
 (=> (and (= (type s0@@1) (SeqType T@@21)) (= (type s1@@1) (SeqType T@@21))) (and (=> (= s0@@1 (|Seq#Empty| T@@21)) (= (|Seq#Append| s0@@1 s1@@1) s1@@1)) (=> (= s1@@1 (|Seq#Empty| T@@21)) (= (|Seq#Append| s0@@1 s1@@1) s0@@1)))))
 :qid |stdinbpl.267:18|
 :skolemid |27|
 :pattern ( (|Seq#Append| s0@@1 s1@@1))
)))
(assert (forall ((t@@1 T@U) ) (! (= (|Seq#Index| (|Seq#Singleton| t@@1) 0) t@@1)
 :qid |stdinbpl.271:18|
 :skolemid |28|
 :pattern ( (|Seq#Singleton| t@@1))
)))
(assert (forall ((s@@9 T@U) ) (! (let ((T@@22 (SeqTypeInv0 (type s@@9))))
 (=> (= (type s@@9) (SeqType T@@22)) (<= 0 (|Seq#Length| s@@9))))
 :qid |stdinbpl.250:18|
 :skolemid |22|
 :pattern ( (|Seq#Length| s@@9))
)))
(assert (forall ((s0@@2 T@U) (s1@@2 T@U) ) (! (let ((T@@23 (SeqTypeInv0 (type s0@@2))))
 (=> (and (and (= (type s0@@2) (SeqType T@@23)) (= (type s1@@2) (SeqType T@@23))) (|Seq#Equal| s0@@2 s1@@2)) (and (= (|Seq#Length| s0@@2) (|Seq#Length| s1@@2)) (forall ((j@@4 Int) ) (!  (=> (and (<= 0 j@@4) (< j@@4 (|Seq#Length| s0@@2))) (= (|Seq#Index| s0@@2 j@@4) (|Seq#Index| s1@@2 j@@4)))
 :qid |stdinbpl.545:13|
 :skolemid |50|
 :pattern ( (|Seq#Index| s0@@2 j@@4))
 :pattern ( (|Seq#Index| s1@@2 j@@4))
)))))
 :qid |stdinbpl.542:18|
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
 :qid |stdinbpl.258:18|
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
(assert (forall ((s@@10 T@U) (t@@3 T@U) (n@@8 Int) ) (! (let ((T@@24 (SeqTypeInv0 (type s@@10))))
 (=> (and (and (= (type s@@10) (SeqType T@@24)) (= (type t@@3) (SeqType T@@24))) (and (< 0 n@@8) (<= n@@8 (|Seq#Length| s@@10)))) (= (|Seq#Take| (|Seq#Append| s@@10 t@@3) n@@8) (|Seq#Take| s@@10 n@@8))))
 :qid |stdinbpl.400:18|
 :skolemid |41|
 :pattern ( (|Seq#Take| (|Seq#Append| s@@10 t@@3) n@@8))
)))
(assert (forall ((s@@11 T@U) (i@@3 Int) (v@@1 T@U) ) (! (let ((T@@25 (type v@@1)))
 (=> (= (type s@@11) (SeqType T@@25)) (=> (and (<= 0 i@@3) (< i@@3 (|Seq#Length| s@@11))) (= (|Seq#Length| (|Seq#Update| s@@11 i@@3 v@@1)) (|Seq#Length| s@@11)))))
 :qid |stdinbpl.299:18|
 :skolemid |34|
 :pattern ( (|Seq#Length| (|Seq#Update| s@@11 i@@3 v@@1)))
 :pattern ( (|Seq#Length| s@@11) (|Seq#Update| s@@11 i@@3 v@@1))
)))
(assert (forall ((s@@12 T@U) (t@@4 T@U) (n@@9 Int) ) (! (let ((T@@26 (SeqTypeInv0 (type s@@12))))
 (=> (and (and (= (type s@@12) (SeqType T@@26)) (= (type t@@4) (SeqType T@@26))) (and (< 0 n@@9) (<= n@@9 (|Seq#Length| s@@12)))) (= (|Seq#Drop| (|Seq#Append| s@@12 t@@4) n@@9) (|Seq#Append| (|Seq#Drop| s@@12 n@@9) t@@4))))
 :qid |stdinbpl.413:18|
 :skolemid |43|
 :pattern ( (|Seq#Drop| (|Seq#Append| s@@12 t@@4) n@@9))
)))
(assert (forall ((s@@13 T@U) (n@@10 Int) (i@@4 Int) ) (! (let ((T@@27 (SeqTypeInv0 (type s@@13))))
 (=> (= (type s@@13) (SeqType T@@27)) (=> (and (and (< 0 n@@10) (<= n@@10 i@@4)) (< i@@4 (|Seq#Length| s@@13))) (and (= (|Seq#Add| (|Seq#Sub| i@@4 n@@10) n@@10) i@@4) (= (|Seq#Index| (|Seq#Drop| s@@13 n@@10) (|Seq#Sub| i@@4 n@@10)) (|Seq#Index| s@@13 i@@4))))))
 :qid |stdinbpl.350:18|
 :skolemid |40|
 :pattern ( (|Seq#Drop| s@@13 n@@10) (|Seq#Index| s@@13 i@@4))
)))
(assert (forall ((s0@@3 T@U) (s1@@3 T@U) (n@@11 Int) ) (! (let ((T@@28 (SeqTypeInv0 (type s0@@3))))
 (=> (and (= (type s0@@3) (SeqType T@@28)) (= (type s1@@3) (SeqType T@@28))) (=> (and (and (and (not (= s0@@3 (|Seq#Empty| T@@28))) (not (= s1@@3 (|Seq#Empty| T@@28)))) (<= 0 n@@11)) (< n@@11 (|Seq#Length| s0@@3))) (= (|Seq#Index| (|Seq#Append| s0@@3 s1@@3) n@@11) (|Seq#Index| s0@@3 n@@11)))))
 :qid |stdinbpl.290:18|
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
(assert (forall ((s0@@4 T@U) (s1@@4 T@U) (m@@7 Int) ) (! (let ((T@@29 (SeqTypeInv0 (type s0@@4))))
 (=> (and (= (type s0@@4) (SeqType T@@29)) (= (type s1@@4) (SeqType T@@29))) (=> (and (and (and (not (= s0@@4 (|Seq#Empty| T@@29))) (not (= s1@@4 (|Seq#Empty| T@@29)))) (<= 0 m@@7)) (< m@@7 (|Seq#Length| s1@@4))) (and (= (|Seq#Sub| (|Seq#Add| m@@7 (|Seq#Length| s0@@4)) (|Seq#Length| s0@@4)) m@@7) (= (|Seq#Index| (|Seq#Append| s0@@4 s1@@4) (|Seq#Add| m@@7 (|Seq#Length| s0@@4))) (|Seq#Index| s1@@4 m@@7))))))
 :qid |stdinbpl.295:18|
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
 :qid |stdinbpl.446:18|
 :skolemid |48|
 :pattern ( (|Seq#Contains| s@@14 x@@10) (|Seq#Index| s@@14 i@@5))
)))
(assert (forall ((s0@@5 T@U) (s1@@5 T@U) ) (! (let ((T@@31 (SeqTypeInv0 (type s0@@5))))
 (=> (and (= (type s0@@5) (SeqType T@@31)) (= (type s1@@5) (SeqType T@@31))) (or (or (and (= s0@@5 s1@@5) (|Seq#Equal| s0@@5 s1@@5)) (and (and (not (= s0@@5 s1@@5)) (not (|Seq#Equal| s0@@5 s1@@5))) (not (= (|Seq#Length| s0@@5) (|Seq#Length| s1@@5))))) (and (and (and (and (and (and (not (= s0@@5 s1@@5)) (not (|Seq#Equal| s0@@5 s1@@5))) (= (|Seq#Length| s0@@5) (|Seq#Length| s1@@5))) (= (|Seq#SkolemDiff| s0@@5 s1@@5) (|Seq#SkolemDiff| s1@@5 s0@@5))) (<= 0 (|Seq#SkolemDiff| s0@@5 s1@@5))) (< (|Seq#SkolemDiff| s0@@5 s1@@5) (|Seq#Length| s0@@5))) (not (= (|Seq#Index| s0@@5 (|Seq#SkolemDiff| s0@@5 s1@@5)) (|Seq#Index| s1@@5 (|Seq#SkolemDiff| s0@@5 s1@@5))))))))
 :qid |stdinbpl.550:18|
 :skolemid |52|
 :pattern ( (|Seq#Equal| s0@@5 s1@@5))
)))
(assert (forall ((p@@1 T@U) (v_1@@0 T@U) (q T@U) (w@@0 T@U) (r T@U) (u T@U) ) (! (let ((C@@3 (FieldTypeInv0 (type r))))
(let ((B@@10 (FieldTypeInv0 (type q))))
(let ((A@@11 (FieldTypeInv0 (type p@@1))))
 (=> (and (and (and (and (and (and (= (type p@@1) (FieldType A@@11 FrameTypeType)) (= (type v_1@@0) FrameTypeType)) (= (type q) (FieldType B@@10 FrameTypeType))) (= (type w@@0) FrameTypeType)) (= (type r) (FieldType C@@3 FrameTypeType))) (= (type u) FrameTypeType)) (and (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))) (InsidePredicate p@@1 v_1@@0 r u)))))
 :qid |stdinbpl.219:25|
 :skolemid |20|
 :pattern ( (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))
)))
(assert (forall ((s@@15 T@U) ) (! (let ((T@@32 (SeqTypeInv0 (type s@@15))))
 (=> (and (= (type s@@15) (SeqType T@@32)) (= (|Seq#Length| s@@15) 0)) (= s@@15 (|Seq#Empty| T@@32))))
 :qid |stdinbpl.254:18|
 :skolemid |24|
 :pattern ( (|Seq#Length| s@@15))
)))
(assert (forall ((s@@16 T@U) (n@@12 Int) ) (! (let ((T@@33 (SeqTypeInv0 (type s@@16))))
 (=> (and (= (type s@@16) (SeqType T@@33)) (<= n@@12 0)) (= (|Seq#Take| s@@16 n@@12) (|Seq#Empty| T@@33))))
 :qid |stdinbpl.429:18|
 :skolemid |46|
 :pattern ( (|Seq#Take| s@@16 n@@12))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun tid_18 () Int)
(declare-fun gsize () Int)
(declare-fun QPMask@9 () T@U)
(declare-fun diz () T@U)
(declare-fun PostHeap@0 () T@U)
(declare-fun qpRange7 (T@U) Bool)
(declare-fun invRecv7 (T@U) Int)
(declare-fun qpRange6 (T@U) Bool)
(declare-fun invRecv6 (T@U) Int)
(declare-fun QPMask@8 () T@U)
(declare-fun tid_12 () Int)
(declare-fun qpRange5 (T@U) Bool)
(declare-fun invRecv5 (T@U) Int)
(declare-fun QPMask@7 () T@U)
(declare-fun tid_10 () Int)
(declare-fun qpRange4 (T@U) Bool)
(declare-fun invRecv4 (T@U) Int)
(declare-fun PostMask@2 () T@U)
(declare-fun tid_8 () Int)
(declare-fun tcount () Int)
(declare-fun gid () Int)
(declare-fun wildcard@3 () Real)
(declare-fun PostMask@0 () T@U)
(declare-fun wildcard@4 () Real)
(declare-fun PostMask@1 () T@U)
(declare-fun wildcard@5 () Real)
(declare-fun QPMask@2 () T@U)
(declare-fun Heap@@9 () T@U)
(declare-fun wildcard@6 () Real)
(declare-fun Mask@3 () T@U)
(declare-fun wildcard@7 () Real)
(declare-fun Mask@4 () T@U)
(declare-fun wildcard@8 () Real)
(declare-fun Mask@5 () T@U)
(declare-fun neverTriggered8 (Int) Bool)
(declare-fun qpRange8 (T@U) Bool)
(declare-fun invRecv8 (T@U) Int)
(declare-fun QPMask@3 () T@U)
(declare-fun dummyFunction (T@U) Bool)
(declare-fun neverTriggered9 (Int) Bool)
(declare-fun qpRange9 (T@U) Bool)
(declare-fun invRecv9 (T@U) Int)
(declare-fun QPMask@4 () T@U)
(declare-fun neverTriggered10 (Int) Bool)
(declare-fun qpRange10 (T@U) Bool)
(declare-fun invRecv10 (T@U) Int)
(declare-fun QPMask@5 () T@U)
(declare-fun neverTriggered11 (Int) Bool)
(declare-fun qpRange3 (T@U) Bool)
(declare-fun invRecv3 (T@U) Int)
(declare-fun QPMask@1 () T@U)
(declare-fun tid_6 () Int)
(declare-fun qpRange2 (T@U) Bool)
(declare-fun invRecv2 (T@U) Int)
(declare-fun QPMask@0 () T@U)
(declare-fun tid_4 () Int)
(declare-fun qpRange1 (T@U) Bool)
(declare-fun invRecv1 (T@U) Int)
(declare-fun Mask@2 () T@U)
(declare-fun tid_2 () Int)
(declare-fun i_4 () Int)
(declare-fun j_4 () Int)
(declare-fun i_2 () Int)
(declare-fun j_2 () Int)
(declare-fun i@@6 () Int)
(declare-fun j@@5 () Int)
(declare-fun current_thread_id () Int)
(declare-fun wildcard@0 () Real)
(declare-fun Mask@0 () T@U)
(declare-fun wildcard@1 () Real)
(declare-fun Mask@1 () T@U)
(declare-fun wildcard@2 () Real)
(declare-fun wildcard () Real)
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (= (type Heap@@9) (MapType0Type RefType)) (= (type diz) RefType)) (= (type Mask@2) (MapType1Type RefType realType))) (= (type QPMask@0) (MapType1Type RefType realType))) (= (type QPMask@1) (MapType1Type RefType realType))) (= (type QPMask@2) (MapType1Type RefType realType))) (= (type Mask@3) (MapType1Type RefType realType))) (= (type Mask@4) (MapType1Type RefType realType))) (= (type Mask@5) (MapType1Type RefType realType))) (= (type QPMask@3) (MapType1Type RefType realType))) (= (type QPMask@4) (MapType1Type RefType realType))) (= (type QPMask@5) (MapType1Type RefType realType))) (= (type PostMask@2) (MapType1Type RefType realType))) (= (type PostHeap@0) (MapType0Type RefType))) (= (type QPMask@7) (MapType1Type RefType realType))) (= (type QPMask@8) (MapType1Type RefType realType))) (= (type QPMask@9) (MapType1Type RefType realType))) (= (type PostMask@0) (MapType1Type RefType realType))) (= (type PostMask@1) (MapType1Type RefType realType))) (= (type Mask@0) (MapType1Type RefType realType))) (= (type Mask@1) (MapType1Type RefType realType))))
(set-info :boogie-vc-id Ref__main_resources_of_1)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 152) (let ((anon52_correct true))
(let ((anon84_Else_correct  (=> (and (not (and (<= 0 tid_18) (< tid_18 (- gsize 1)))) (= (ControlFlow 0 119) 114)) anon52_correct)))
(let ((anon84_Then_correct  (=> (and (<= 0 tid_18) (< tid_18 (- gsize 1))) (and (=> (= (ControlFlow 0 115) (- 0 118)) (HasDirectPerm QPMask@9 diz Ref__b)) (=> (HasDirectPerm QPMask@9 diz Ref__b) (and (=> (= (ControlFlow 0 115) (- 0 117)) (>= tid_18 0)) (=> (>= tid_18 0) (and (=> (= (ControlFlow 0 115) (- 0 116)) (< tid_18 (|Seq#Length| (MapType0Select PostHeap@0 diz Ref__b)))) (=> (< tid_18 (|Seq#Length| (MapType0Select PostHeap@0 diz Ref__b))) (=> (= (ControlFlow 0 115) 114) anon52_correct))))))))))
(let ((anon83_Else_correct  (and (=> (= (ControlFlow 0 112) (- 0 113)) (forall ((tid_13 Int) (tid_13_1 Int) ) (!  (=> (and (and (and (and (not (= tid_13 tid_13_1)) (and (<= 0 tid_13) (< tid_13 (- gsize 1)))) (and (<= 0 tid_13_1) (< tid_13_1 (- gsize 1)))) (< NoPerm (/ (to_real 1) (to_real 4)))) (< NoPerm (/ (to_real 1) (to_real 4)))) (not (= (|Seq#Index| (MapType0Select PostHeap@0 diz Ref__b) tid_13) (|Seq#Index| (MapType0Select PostHeap@0 diz Ref__b) tid_13_1))))
 :qid |stdinbpl.2477:15|
 :skolemid |100|
))) (=> (forall ((tid_13@@0 Int) (tid_13_1@@0 Int) ) (!  (=> (and (and (and (and (not (= tid_13@@0 tid_13_1@@0)) (and (<= 0 tid_13@@0) (< tid_13@@0 (- gsize 1)))) (and (<= 0 tid_13_1@@0) (< tid_13_1@@0 (- gsize 1)))) (< NoPerm (/ (to_real 1) (to_real 4)))) (< NoPerm (/ (to_real 1) (to_real 4)))) (not (= (|Seq#Index| (MapType0Select PostHeap@0 diz Ref__b) tid_13@@0) (|Seq#Index| (MapType0Select PostHeap@0 diz Ref__b) tid_13_1@@0))))
 :qid |stdinbpl.2477:15|
 :skolemid |100|
)) (=> (forall ((tid_13@@1 Int) ) (!  (=> (and (and (<= 0 tid_13@@1) (< tid_13@@1 (- gsize 1))) (< NoPerm (/ (to_real 1) (to_real 4)))) (and (qpRange7 (|Seq#Index| (MapType0Select PostHeap@0 diz Ref__b) tid_13@@1)) (= (invRecv7 (|Seq#Index| (MapType0Select PostHeap@0 diz Ref__b) tid_13@@1)) tid_13@@1)))
 :qid |stdinbpl.2483:22|
 :skolemid |101|
 :pattern ( (|Seq#Index| (MapType0Select PostHeap@0 diz Ref__b) tid_13@@1))
 :pattern ( (|Seq#Index| (MapType0Select PostHeap@0 diz Ref__b) tid_13@@1))
)) (=> (and (forall ((o_3 T@U) ) (!  (=> (= (type o_3) RefType) (=> (and (and (and (<= 0 (invRecv7 o_3)) (< (invRecv7 o_3) (- gsize 1))) (< NoPerm (/ (to_real 1) (to_real 4)))) (qpRange7 o_3)) (= (|Seq#Index| (MapType0Select PostHeap@0 diz Ref__b) (invRecv7 o_3)) o_3)))
 :qid |stdinbpl.2487:22|
 :skolemid |102|
 :pattern ( (invRecv7 o_3))
)) (= (ControlFlow 0 112) (- 0 111))) (forall ((tid_13@@2 Int) ) (!  (=> (and (<= 0 tid_13@@2) (< tid_13@@2 (- gsize 1))) (>= (/ (to_real 1) (to_real 4)) NoPerm))
 :qid |stdinbpl.2493:15|
 :skolemid |103|
 :pattern ( (|Seq#Index| (MapType0Select PostHeap@0 diz Ref__b) tid_13@@2))
 :pattern ( (|Seq#Index| (MapType0Select PostHeap@0 diz Ref__b) tid_13@@2))
))))))))
(let ((anon81_Else_correct  (and (=> (= (ControlFlow 0 120) (- 0 122)) (forall ((tid_11 Int) (tid_11_1 Int) ) (!  (=> (and (and (and (and (not (= tid_11 tid_11_1)) (and (<= 0 tid_11) (< tid_11 gsize))) (and (<= 0 tid_11_1) (< tid_11_1 gsize))) (< NoPerm (/ (to_real 1) (to_real 4)))) (< NoPerm (/ (to_real 1) (to_real 4)))) (not (= (|Seq#Index| (MapType0Select PostHeap@0 diz Ref__c) tid_11) (|Seq#Index| (MapType0Select PostHeap@0 diz Ref__c) tid_11_1))))
 :qid |stdinbpl.2423:15|
 :skolemid |93|
))) (=> (forall ((tid_11@@0 Int) (tid_11_1@@0 Int) ) (!  (=> (and (and (and (and (not (= tid_11@@0 tid_11_1@@0)) (and (<= 0 tid_11@@0) (< tid_11@@0 gsize))) (and (<= 0 tid_11_1@@0) (< tid_11_1@@0 gsize))) (< NoPerm (/ (to_real 1) (to_real 4)))) (< NoPerm (/ (to_real 1) (to_real 4)))) (not (= (|Seq#Index| (MapType0Select PostHeap@0 diz Ref__c) tid_11@@0) (|Seq#Index| (MapType0Select PostHeap@0 diz Ref__c) tid_11_1@@0))))
 :qid |stdinbpl.2423:15|
 :skolemid |93|
)) (=> (and (forall ((tid_11@@1 Int) ) (!  (=> (and (and (<= 0 tid_11@@1) (< tid_11@@1 gsize)) (< NoPerm (/ (to_real 1) (to_real 4)))) (and (qpRange6 (|Seq#Index| (MapType0Select PostHeap@0 diz Ref__c) tid_11@@1)) (= (invRecv6 (|Seq#Index| (MapType0Select PostHeap@0 diz Ref__c) tid_11@@1)) tid_11@@1)))
 :qid |stdinbpl.2429:22|
 :skolemid |94|
 :pattern ( (|Seq#Index| (MapType0Select PostHeap@0 diz Ref__c) tid_11@@1))
 :pattern ( (|Seq#Index| (MapType0Select PostHeap@0 diz Ref__c) tid_11@@1))
)) (forall ((o_3@@0 T@U) ) (!  (=> (= (type o_3@@0) RefType) (=> (and (and (and (<= 0 (invRecv6 o_3@@0)) (< (invRecv6 o_3@@0) gsize)) (< NoPerm (/ (to_real 1) (to_real 4)))) (qpRange6 o_3@@0)) (= (|Seq#Index| (MapType0Select PostHeap@0 diz Ref__c) (invRecv6 o_3@@0)) o_3@@0)))
 :qid |stdinbpl.2433:22|
 :skolemid |95|
 :pattern ( (invRecv6 o_3@@0))
))) (and (=> (= (ControlFlow 0 120) (- 0 121)) (forall ((tid_11@@2 Int) ) (!  (=> (and (<= 0 tid_11@@2) (< tid_11@@2 gsize)) (>= (/ (to_real 1) (to_real 4)) NoPerm))
 :qid |stdinbpl.2439:15|
 :skolemid |96|
 :pattern ( (|Seq#Index| (MapType0Select PostHeap@0 diz Ref__c) tid_11@@2))
 :pattern ( (|Seq#Index| (MapType0Select PostHeap@0 diz Ref__c) tid_11@@2))
))) (=> (forall ((tid_11@@3 Int) ) (!  (=> (and (<= 0 tid_11@@3) (< tid_11@@3 gsize)) (>= (/ (to_real 1) (to_real 4)) NoPerm))
 :qid |stdinbpl.2439:15|
 :skolemid |96|
 :pattern ( (|Seq#Index| (MapType0Select PostHeap@0 diz Ref__c) tid_11@@3))
 :pattern ( (|Seq#Index| (MapType0Select PostHeap@0 diz Ref__c) tid_11@@3))
)) (=> (forall ((tid_11@@4 Int) ) (!  (=> (and (and (<= 0 tid_11@@4) (< tid_11@@4 gsize)) (> (/ (to_real 1) (to_real 4)) NoPerm)) (not (= (|Seq#Index| (MapType0Select PostHeap@0 diz Ref__c) tid_11@@4) null)))
 :qid |stdinbpl.2445:22|
 :skolemid |97|
 :pattern ( (|Seq#Index| (MapType0Select PostHeap@0 diz Ref__c) tid_11@@4))
 :pattern ( (|Seq#Index| (MapType0Select PostHeap@0 diz Ref__c) tid_11@@4))
)) (=> (and (and (forall ((o_3@@1 T@U) ) (!  (=> (= (type o_3@@1) RefType) (and (=> (and (and (and (<= 0 (invRecv6 o_3@@1)) (< (invRecv6 o_3@@1) gsize)) (< NoPerm (/ (to_real 1) (to_real 4)))) (qpRange6 o_3@@1)) (and (=> (< NoPerm (/ (to_real 1) (to_real 4))) (= (|Seq#Index| (MapType0Select PostHeap@0 diz Ref__c) (invRecv6 o_3@@1)) o_3@@1)) (= (U_2_real (MapType1Select QPMask@9 o_3@@1 Ref__Integer_value)) (+ (U_2_real (MapType1Select QPMask@8 o_3@@1 Ref__Integer_value)) (/ (to_real 1) (to_real 4)))))) (=> (not (and (and (and (<= 0 (invRecv6 o_3@@1)) (< (invRecv6 o_3@@1) gsize)) (< NoPerm (/ (to_real 1) (to_real 4)))) (qpRange6 o_3@@1))) (= (U_2_real (MapType1Select QPMask@9 o_3@@1 Ref__Integer_value)) (U_2_real (MapType1Select QPMask@8 o_3@@1 Ref__Integer_value))))))
 :qid |stdinbpl.2451:22|
 :skolemid |98|
 :pattern ( (MapType1Select QPMask@9 o_3@@1 Ref__Integer_value))
)) (forall ((o_3@@2 T@U) (f_5 T@U) ) (! (let ((B@@11 (FieldTypeInv1 (type f_5))))
(let ((A@@12 (FieldTypeInv0 (type f_5))))
 (=> (and (and (= (type o_3@@2) RefType) (= (type f_5) (FieldType A@@12 B@@11))) (not (= f_5 Ref__Integer_value))) (= (U_2_real (MapType1Select QPMask@8 o_3@@2 f_5)) (U_2_real (MapType1Select QPMask@9 o_3@@2 f_5))))))
 :qid |stdinbpl.2455:29|
 :skolemid |99|
 :pattern ( (MapType1Select QPMask@8 o_3@@2 f_5))
 :pattern ( (MapType1Select QPMask@9 o_3@@2 f_5))
))) (and (state PostHeap@0 QPMask@9) (state PostHeap@0 QPMask@9))) (and (and (=> (= (ControlFlow 0 120) 112) anon83_Else_correct) (=> (= (ControlFlow 0 120) 115) anon84_Then_correct)) (=> (= (ControlFlow 0 120) 119) anon84_Else_correct)))))))))))
(let ((anon48_correct true))
(let ((anon82_Else_correct  (=> (and (not (and (<= 0 tid_12) (< tid_12 gsize))) (= (ControlFlow 0 110) 105)) anon48_correct)))
(let ((anon82_Then_correct  (=> (and (<= 0 tid_12) (< tid_12 gsize)) (and (=> (= (ControlFlow 0 106) (- 0 109)) (HasDirectPerm QPMask@8 diz Ref__c)) (=> (HasDirectPerm QPMask@8 diz Ref__c) (and (=> (= (ControlFlow 0 106) (- 0 108)) (>= tid_12 0)) (=> (>= tid_12 0) (and (=> (= (ControlFlow 0 106) (- 0 107)) (< tid_12 (|Seq#Length| (MapType0Select PostHeap@0 diz Ref__c)))) (=> (< tid_12 (|Seq#Length| (MapType0Select PostHeap@0 diz Ref__c))) (=> (= (ControlFlow 0 106) 105) anon48_correct))))))))))
(let ((anon79_Else_correct  (and (=> (= (ControlFlow 0 123) (- 0 125)) (forall ((tid_9 Int) (tid_9_1 Int) ) (!  (=> (and (and (and (and (not (= tid_9 tid_9_1)) (and (<= 0 tid_9) (< tid_9 gsize))) (and (<= 0 tid_9_1) (< tid_9_1 gsize))) (< NoPerm (/ (to_real 1) (to_real 4)))) (< NoPerm (/ (to_real 1) (to_real 4)))) (not (= (|Seq#Index| (MapType0Select PostHeap@0 diz Ref__b) tid_9) (|Seq#Index| (MapType0Select PostHeap@0 diz Ref__b) tid_9_1))))
 :qid |stdinbpl.2369:15|
 :skolemid |86|
))) (=> (forall ((tid_9@@0 Int) (tid_9_1@@0 Int) ) (!  (=> (and (and (and (and (not (= tid_9@@0 tid_9_1@@0)) (and (<= 0 tid_9@@0) (< tid_9@@0 gsize))) (and (<= 0 tid_9_1@@0) (< tid_9_1@@0 gsize))) (< NoPerm (/ (to_real 1) (to_real 4)))) (< NoPerm (/ (to_real 1) (to_real 4)))) (not (= (|Seq#Index| (MapType0Select PostHeap@0 diz Ref__b) tid_9@@0) (|Seq#Index| (MapType0Select PostHeap@0 diz Ref__b) tid_9_1@@0))))
 :qid |stdinbpl.2369:15|
 :skolemid |86|
)) (=> (and (forall ((tid_9@@1 Int) ) (!  (=> (and (and (<= 0 tid_9@@1) (< tid_9@@1 gsize)) (< NoPerm (/ (to_real 1) (to_real 4)))) (and (qpRange5 (|Seq#Index| (MapType0Select PostHeap@0 diz Ref__b) tid_9@@1)) (= (invRecv5 (|Seq#Index| (MapType0Select PostHeap@0 diz Ref__b) tid_9@@1)) tid_9@@1)))
 :qid |stdinbpl.2375:22|
 :skolemid |87|
 :pattern ( (|Seq#Index| (MapType0Select PostHeap@0 diz Ref__b) tid_9@@1))
 :pattern ( (|Seq#Index| (MapType0Select PostHeap@0 diz Ref__b) tid_9@@1))
)) (forall ((o_3@@3 T@U) ) (!  (=> (= (type o_3@@3) RefType) (=> (and (and (and (<= 0 (invRecv5 o_3@@3)) (< (invRecv5 o_3@@3) gsize)) (< NoPerm (/ (to_real 1) (to_real 4)))) (qpRange5 o_3@@3)) (= (|Seq#Index| (MapType0Select PostHeap@0 diz Ref__b) (invRecv5 o_3@@3)) o_3@@3)))
 :qid |stdinbpl.2379:22|
 :skolemid |88|
 :pattern ( (invRecv5 o_3@@3))
))) (and (=> (= (ControlFlow 0 123) (- 0 124)) (forall ((tid_9@@2 Int) ) (!  (=> (and (<= 0 tid_9@@2) (< tid_9@@2 gsize)) (>= (/ (to_real 1) (to_real 4)) NoPerm))
 :qid |stdinbpl.2385:15|
 :skolemid |89|
 :pattern ( (|Seq#Index| (MapType0Select PostHeap@0 diz Ref__b) tid_9@@2))
 :pattern ( (|Seq#Index| (MapType0Select PostHeap@0 diz Ref__b) tid_9@@2))
))) (=> (forall ((tid_9@@3 Int) ) (!  (=> (and (<= 0 tid_9@@3) (< tid_9@@3 gsize)) (>= (/ (to_real 1) (to_real 4)) NoPerm))
 :qid |stdinbpl.2385:15|
 :skolemid |89|
 :pattern ( (|Seq#Index| (MapType0Select PostHeap@0 diz Ref__b) tid_9@@3))
 :pattern ( (|Seq#Index| (MapType0Select PostHeap@0 diz Ref__b) tid_9@@3))
)) (=> (forall ((tid_9@@4 Int) ) (!  (=> (and (and (<= 0 tid_9@@4) (< tid_9@@4 gsize)) (> (/ (to_real 1) (to_real 4)) NoPerm)) (not (= (|Seq#Index| (MapType0Select PostHeap@0 diz Ref__b) tid_9@@4) null)))
 :qid |stdinbpl.2391:22|
 :skolemid |90|
 :pattern ( (|Seq#Index| (MapType0Select PostHeap@0 diz Ref__b) tid_9@@4))
 :pattern ( (|Seq#Index| (MapType0Select PostHeap@0 diz Ref__b) tid_9@@4))
)) (=> (and (and (forall ((o_3@@4 T@U) ) (!  (=> (= (type o_3@@4) RefType) (and (=> (and (and (and (<= 0 (invRecv5 o_3@@4)) (< (invRecv5 o_3@@4) gsize)) (< NoPerm (/ (to_real 1) (to_real 4)))) (qpRange5 o_3@@4)) (and (=> (< NoPerm (/ (to_real 1) (to_real 4))) (= (|Seq#Index| (MapType0Select PostHeap@0 diz Ref__b) (invRecv5 o_3@@4)) o_3@@4)) (= (U_2_real (MapType1Select QPMask@8 o_3@@4 Ref__Integer_value)) (+ (U_2_real (MapType1Select QPMask@7 o_3@@4 Ref__Integer_value)) (/ (to_real 1) (to_real 4)))))) (=> (not (and (and (and (<= 0 (invRecv5 o_3@@4)) (< (invRecv5 o_3@@4) gsize)) (< NoPerm (/ (to_real 1) (to_real 4)))) (qpRange5 o_3@@4))) (= (U_2_real (MapType1Select QPMask@8 o_3@@4 Ref__Integer_value)) (U_2_real (MapType1Select QPMask@7 o_3@@4 Ref__Integer_value))))))
 :qid |stdinbpl.2397:22|
 :skolemid |91|
 :pattern ( (MapType1Select QPMask@8 o_3@@4 Ref__Integer_value))
)) (forall ((o_3@@5 T@U) (f_5@@0 T@U) ) (! (let ((B@@12 (FieldTypeInv1 (type f_5@@0))))
(let ((A@@13 (FieldTypeInv0 (type f_5@@0))))
 (=> (and (and (= (type o_3@@5) RefType) (= (type f_5@@0) (FieldType A@@13 B@@12))) (not (= f_5@@0 Ref__Integer_value))) (= (U_2_real (MapType1Select QPMask@7 o_3@@5 f_5@@0)) (U_2_real (MapType1Select QPMask@8 o_3@@5 f_5@@0))))))
 :qid |stdinbpl.2401:29|
 :skolemid |92|
 :pattern ( (MapType1Select QPMask@7 o_3@@5 f_5@@0))
 :pattern ( (MapType1Select QPMask@8 o_3@@5 f_5@@0))
))) (and (state PostHeap@0 QPMask@8) (state PostHeap@0 QPMask@8))) (and (and (=> (= (ControlFlow 0 123) 120) anon81_Else_correct) (=> (= (ControlFlow 0 123) 106) anon82_Then_correct)) (=> (= (ControlFlow 0 123) 110) anon82_Else_correct)))))))))))
(let ((anon44_correct true))
(let ((anon80_Else_correct  (=> (and (not (and (<= 0 tid_10) (< tid_10 gsize))) (= (ControlFlow 0 104) 99)) anon44_correct)))
(let ((anon80_Then_correct  (=> (and (<= 0 tid_10) (< tid_10 gsize)) (and (=> (= (ControlFlow 0 100) (- 0 103)) (HasDirectPerm QPMask@7 diz Ref__b)) (=> (HasDirectPerm QPMask@7 diz Ref__b) (and (=> (= (ControlFlow 0 100) (- 0 102)) (>= tid_10 0)) (=> (>= tid_10 0) (and (=> (= (ControlFlow 0 100) (- 0 101)) (< tid_10 (|Seq#Length| (MapType0Select PostHeap@0 diz Ref__b)))) (=> (< tid_10 (|Seq#Length| (MapType0Select PostHeap@0 diz Ref__b))) (=> (= (ControlFlow 0 100) 99) anon44_correct))))))))))
(let ((anon77_Else_correct  (and (=> (= (ControlFlow 0 126) (- 0 127)) (forall ((tid_7 Int) (tid_7_1 Int) ) (!  (=> (and (and (and (and (not (= tid_7 tid_7_1)) (and (<= 0 tid_7) (< tid_7 gsize))) (and (<= 0 tid_7_1) (< tid_7_1 gsize))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| (MapType0Select PostHeap@0 diz Ref__a) tid_7) (|Seq#Index| (MapType0Select PostHeap@0 diz Ref__a) tid_7_1))))
 :qid |stdinbpl.2321:15|
 :skolemid |80|
))) (=> (forall ((tid_7@@0 Int) (tid_7_1@@0 Int) ) (!  (=> (and (and (and (and (not (= tid_7@@0 tid_7_1@@0)) (and (<= 0 tid_7@@0) (< tid_7@@0 gsize))) (and (<= 0 tid_7_1@@0) (< tid_7_1@@0 gsize))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| (MapType0Select PostHeap@0 diz Ref__a) tid_7@@0) (|Seq#Index| (MapType0Select PostHeap@0 diz Ref__a) tid_7_1@@0))))
 :qid |stdinbpl.2321:15|
 :skolemid |80|
)) (=> (forall ((tid_7@@1 Int) ) (!  (=> (and (and (<= 0 tid_7@@1) (< tid_7@@1 gsize)) (< NoPerm FullPerm)) (and (qpRange4 (|Seq#Index| (MapType0Select PostHeap@0 diz Ref__a) tid_7@@1)) (= (invRecv4 (|Seq#Index| (MapType0Select PostHeap@0 diz Ref__a) tid_7@@1)) tid_7@@1)))
 :qid |stdinbpl.2327:22|
 :skolemid |81|
 :pattern ( (|Seq#Index| (MapType0Select PostHeap@0 diz Ref__a) tid_7@@1))
 :pattern ( (|Seq#Index| (MapType0Select PostHeap@0 diz Ref__a) tid_7@@1))
)) (=> (and (forall ((o_3@@6 T@U) ) (!  (=> (= (type o_3@@6) RefType) (=> (and (and (and (<= 0 (invRecv4 o_3@@6)) (< (invRecv4 o_3@@6) gsize)) (< NoPerm FullPerm)) (qpRange4 o_3@@6)) (= (|Seq#Index| (MapType0Select PostHeap@0 diz Ref__a) (invRecv4 o_3@@6)) o_3@@6)))
 :qid |stdinbpl.2331:22|
 :skolemid |82|
 :pattern ( (invRecv4 o_3@@6))
)) (forall ((tid_7@@2 Int) ) (!  (=> (and (<= 0 tid_7@@2) (< tid_7@@2 gsize)) (not (= (|Seq#Index| (MapType0Select PostHeap@0 diz Ref__a) tid_7@@2) null)))
 :qid |stdinbpl.2337:22|
 :skolemid |83|
 :pattern ( (|Seq#Index| (MapType0Select PostHeap@0 diz Ref__a) tid_7@@2))
 :pattern ( (|Seq#Index| (MapType0Select PostHeap@0 diz Ref__a) tid_7@@2))
))) (=> (and (and (forall ((o_3@@7 T@U) ) (!  (=> (= (type o_3@@7) RefType) (and (=> (and (and (and (<= 0 (invRecv4 o_3@@7)) (< (invRecv4 o_3@@7) gsize)) (< NoPerm FullPerm)) (qpRange4 o_3@@7)) (and (=> (< NoPerm FullPerm) (= (|Seq#Index| (MapType0Select PostHeap@0 diz Ref__a) (invRecv4 o_3@@7)) o_3@@7)) (= (U_2_real (MapType1Select QPMask@7 o_3@@7 Ref__Integer_value)) (+ (U_2_real (MapType1Select PostMask@2 o_3@@7 Ref__Integer_value)) FullPerm)))) (=> (not (and (and (and (<= 0 (invRecv4 o_3@@7)) (< (invRecv4 o_3@@7) gsize)) (< NoPerm FullPerm)) (qpRange4 o_3@@7))) (= (U_2_real (MapType1Select QPMask@7 o_3@@7 Ref__Integer_value)) (U_2_real (MapType1Select PostMask@2 o_3@@7 Ref__Integer_value))))))
 :qid |stdinbpl.2343:22|
 :skolemid |84|
 :pattern ( (MapType1Select QPMask@7 o_3@@7 Ref__Integer_value))
)) (forall ((o_3@@8 T@U) (f_5@@1 T@U) ) (! (let ((B@@13 (FieldTypeInv1 (type f_5@@1))))
(let ((A@@14 (FieldTypeInv0 (type f_5@@1))))
 (=> (and (and (= (type o_3@@8) RefType) (= (type f_5@@1) (FieldType A@@14 B@@13))) (not (= f_5@@1 Ref__Integer_value))) (= (U_2_real (MapType1Select PostMask@2 o_3@@8 f_5@@1)) (U_2_real (MapType1Select QPMask@7 o_3@@8 f_5@@1))))))
 :qid |stdinbpl.2347:29|
 :skolemid |85|
 :pattern ( (MapType1Select PostMask@2 o_3@@8 f_5@@1))
 :pattern ( (MapType1Select QPMask@7 o_3@@8 f_5@@1))
))) (and (state PostHeap@0 QPMask@7) (state PostHeap@0 QPMask@7))) (and (and (=> (= (ControlFlow 0 126) 123) anon79_Else_correct) (=> (= (ControlFlow 0 126) 100) anon80_Then_correct)) (=> (= (ControlFlow 0 126) 104) anon80_Else_correct)))))))))
(let ((anon40_correct true))
(let ((anon78_Else_correct  (=> (and (not (and (<= 0 tid_8) (< tid_8 gsize))) (= (ControlFlow 0 98) 93)) anon40_correct)))
(let ((anon78_Then_correct  (=> (and (<= 0 tid_8) (< tid_8 gsize)) (and (=> (= (ControlFlow 0 94) (- 0 97)) (HasDirectPerm PostMask@2 diz Ref__a)) (=> (HasDirectPerm PostMask@2 diz Ref__a) (and (=> (= (ControlFlow 0 94) (- 0 96)) (>= tid_8 0)) (=> (>= tid_8 0) (and (=> (= (ControlFlow 0 94) (- 0 95)) (< tid_8 (|Seq#Length| (MapType0Select PostHeap@0 diz Ref__a)))) (=> (< tid_8 (|Seq#Length| (MapType0Select PostHeap@0 diz Ref__a))) (=> (= (ControlFlow 0 94) 93) anon40_correct))))))))))
(let ((anon76_Then_correct  (=> (and (state PostHeap@0 ZeroMask) (= tcount gsize)) (=> (and (and (and (state PostHeap@0 ZeroMask) (= gid 0)) (and (state PostHeap@0 ZeroMask) (> wildcard@3 NoPerm))) (and (and (not (= diz null)) (= PostMask@0 (MapType1Store ZeroMask diz Ref__a (real_2_U (+ (U_2_real (MapType1Select ZeroMask diz Ref__a)) wildcard@3))))) (and (state PostHeap@0 PostMask@0) (state PostHeap@0 PostMask@0)))) (and (=> (= (ControlFlow 0 128) (- 0 137)) (HasDirectPerm PostMask@0 diz Ref__a)) (=> (HasDirectPerm PostMask@0 diz Ref__a) (=> (= (|Seq#Length| (MapType0Select PostHeap@0 diz Ref__a)) tcount) (=> (and (state PostHeap@0 PostMask@0) (> wildcard@4 NoPerm)) (=> (and (and (not (= diz null)) (= PostMask@1 (MapType1Store PostMask@0 diz Ref__b (real_2_U (+ (U_2_real (MapType1Select PostMask@0 diz Ref__b)) wildcard@4))))) (and (state PostHeap@0 PostMask@1) (state PostHeap@0 PostMask@1))) (and (=> (= (ControlFlow 0 128) (- 0 136)) (HasDirectPerm PostMask@1 diz Ref__b)) (=> (HasDirectPerm PostMask@1 diz Ref__b) (=> (= (|Seq#Length| (MapType0Select PostHeap@0 diz Ref__b)) tcount) (=> (and (state PostHeap@0 PostMask@1) (> wildcard@5 NoPerm)) (=> (and (and (not (= diz null)) (= PostMask@2 (MapType1Store PostMask@1 diz Ref__c (real_2_U (+ (U_2_real (MapType1Select PostMask@1 diz Ref__c)) wildcard@5))))) (and (state PostHeap@0 PostMask@2) (state PostHeap@0 PostMask@2))) (and (=> (= (ControlFlow 0 128) (- 0 135)) (HasDirectPerm PostMask@2 diz Ref__c)) (=> (HasDirectPerm PostMask@2 diz Ref__c) (=> (and (= (|Seq#Length| (MapType0Select PostHeap@0 diz Ref__c)) tcount) (state PostHeap@0 PostMask@2)) (and (=> (= (ControlFlow 0 128) (- 0 134)) (HasDirectPerm PostMask@2 diz Ref__a)) (=> (HasDirectPerm PostMask@2 diz Ref__a) (and (=> (= (ControlFlow 0 128) (- 0 133)) (HasDirectPerm QPMask@2 diz Ref__a)) (=> (HasDirectPerm QPMask@2 diz Ref__a) (=> (and (|Seq#Equal| (MapType0Select PostHeap@0 diz Ref__a) (MapType0Select Heap@@9 diz Ref__a)) (state PostHeap@0 PostMask@2)) (and (=> (= (ControlFlow 0 128) (- 0 132)) (HasDirectPerm PostMask@2 diz Ref__b)) (=> (HasDirectPerm PostMask@2 diz Ref__b) (and (=> (= (ControlFlow 0 128) (- 0 131)) (HasDirectPerm QPMask@2 diz Ref__b)) (=> (HasDirectPerm QPMask@2 diz Ref__b) (=> (and (|Seq#Equal| (MapType0Select PostHeap@0 diz Ref__b) (MapType0Select Heap@@9 diz Ref__b)) (state PostHeap@0 PostMask@2)) (and (=> (= (ControlFlow 0 128) (- 0 130)) (HasDirectPerm PostMask@2 diz Ref__c)) (=> (HasDirectPerm PostMask@2 diz Ref__c) (and (=> (= (ControlFlow 0 128) (- 0 129)) (HasDirectPerm QPMask@2 diz Ref__c)) (=> (HasDirectPerm QPMask@2 diz Ref__c) (=> (and (|Seq#Equal| (MapType0Select PostHeap@0 diz Ref__c) (MapType0Select Heap@@9 diz Ref__c)) (state PostHeap@0 PostMask@2)) (and (and (=> (= (ControlFlow 0 128) 126) anon77_Else_correct) (=> (= (ControlFlow 0 128) 94) anon78_Then_correct)) (=> (= (ControlFlow 0 128) 98) anon78_Else_correct))))))))))))))))))))))))))))))))))
(let ((anon76_Else_correct  (and (=> (= (ControlFlow 0 71) (- 0 92)) (= tcount gsize)) (=> (= tcount gsize) (and (=> (= (ControlFlow 0 71) (- 0 91)) (= gid 0)) (=> (= gid 0) (and (=> (= (ControlFlow 0 71) (- 0 90)) (> (U_2_real (MapType1Select QPMask@2 diz Ref__a)) NoPerm)) (=> (> (U_2_real (MapType1Select QPMask@2 diz Ref__a)) NoPerm) (=> (> wildcard@6 NoPerm) (=> (and (< wildcard@6 (U_2_real (MapType1Select QPMask@2 diz Ref__a))) (= Mask@3 (MapType1Store QPMask@2 diz Ref__a (real_2_U (- (U_2_real (MapType1Select QPMask@2 diz Ref__a)) wildcard@6))))) (and (=> (= (ControlFlow 0 71) (- 0 89)) (= (|Seq#Length| (MapType0Select Heap@@9 diz Ref__a)) tcount)) (=> (= (|Seq#Length| (MapType0Select Heap@@9 diz Ref__a)) tcount) (and (=> (= (ControlFlow 0 71) (- 0 88)) (> (U_2_real (MapType1Select Mask@3 diz Ref__b)) NoPerm)) (=> (> (U_2_real (MapType1Select Mask@3 diz Ref__b)) NoPerm) (=> (> wildcard@7 NoPerm) (=> (and (< wildcard@7 (U_2_real (MapType1Select Mask@3 diz Ref__b))) (= Mask@4 (MapType1Store Mask@3 diz Ref__b (real_2_U (- (U_2_real (MapType1Select Mask@3 diz Ref__b)) wildcard@7))))) (and (=> (= (ControlFlow 0 71) (- 0 87)) (= (|Seq#Length| (MapType0Select Heap@@9 diz Ref__b)) tcount)) (=> (= (|Seq#Length| (MapType0Select Heap@@9 diz Ref__b)) tcount) (and (=> (= (ControlFlow 0 71) (- 0 86)) (> (U_2_real (MapType1Select Mask@4 diz Ref__c)) NoPerm)) (=> (> (U_2_real (MapType1Select Mask@4 diz Ref__c)) NoPerm) (=> (> wildcard@8 NoPerm) (=> (and (< wildcard@8 (U_2_real (MapType1Select Mask@4 diz Ref__c))) (= Mask@5 (MapType1Store Mask@4 diz Ref__c (real_2_U (- (U_2_real (MapType1Select Mask@4 diz Ref__c)) wildcard@8))))) (and (=> (= (ControlFlow 0 71) (- 0 85)) (= (|Seq#Length| (MapType0Select Heap@@9 diz Ref__c)) tcount)) (=> (= (|Seq#Length| (MapType0Select Heap@@9 diz Ref__c)) tcount) (and (=> (= (ControlFlow 0 71) (- 0 84)) (|Seq#Equal| (MapType0Select Heap@@9 diz Ref__a) (MapType0Select Heap@@9 diz Ref__a))) (=> (|Seq#Equal| (MapType0Select Heap@@9 diz Ref__a) (MapType0Select Heap@@9 diz Ref__a)) (and (=> (= (ControlFlow 0 71) (- 0 83)) (|Seq#Equal| (MapType0Select Heap@@9 diz Ref__b) (MapType0Select Heap@@9 diz Ref__b))) (=> (|Seq#Equal| (MapType0Select Heap@@9 diz Ref__b) (MapType0Select Heap@@9 diz Ref__b)) (and (=> (= (ControlFlow 0 71) (- 0 82)) (|Seq#Equal| (MapType0Select Heap@@9 diz Ref__c) (MapType0Select Heap@@9 diz Ref__c))) (=> (|Seq#Equal| (MapType0Select Heap@@9 diz Ref__c) (MapType0Select Heap@@9 diz Ref__c)) (and (=> (= (ControlFlow 0 71) (- 0 81)) (forall ((tid_14 Int) (tid_14_1 Int) ) (!  (=> (and (and (and (and (not (= tid_14 tid_14_1)) (and (<= 0 tid_14) (< tid_14 gsize))) (and (<= 0 tid_14_1) (< tid_14_1 gsize))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| (MapType0Select Heap@@9 diz Ref__a) tid_14) (|Seq#Index| (MapType0Select Heap@@9 diz Ref__a) tid_14_1))))
 :qid |stdinbpl.2561:17|
 :skolemid |107|
 :pattern ( (neverTriggered8 tid_14) (neverTriggered8 tid_14_1))
))) (=> (forall ((tid_14@@0 Int) (tid_14_1@@0 Int) ) (!  (=> (and (and (and (and (not (= tid_14@@0 tid_14_1@@0)) (and (<= 0 tid_14@@0) (< tid_14@@0 gsize))) (and (<= 0 tid_14_1@@0) (< tid_14_1@@0 gsize))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| (MapType0Select Heap@@9 diz Ref__a) tid_14@@0) (|Seq#Index| (MapType0Select Heap@@9 diz Ref__a) tid_14_1@@0))))
 :qid |stdinbpl.2561:17|
 :skolemid |107|
 :pattern ( (neverTriggered8 tid_14@@0) (neverTriggered8 tid_14_1@@0))
)) (and (=> (= (ControlFlow 0 71) (- 0 80)) (forall ((tid_14@@1 Int) ) (!  (=> (and (<= 0 tid_14@@1) (< tid_14@@1 gsize)) (>= (U_2_real (MapType1Select Mask@5 (|Seq#Index| (MapType0Select Heap@@9 diz Ref__a) tid_14@@1) Ref__Integer_value)) FullPerm))
 :qid |stdinbpl.2568:17|
 :skolemid |108|
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 diz Ref__a) tid_14@@1))
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 diz Ref__a) tid_14@@1))
))) (=> (forall ((tid_14@@2 Int) ) (!  (=> (and (<= 0 tid_14@@2) (< tid_14@@2 gsize)) (>= (U_2_real (MapType1Select Mask@5 (|Seq#Index| (MapType0Select Heap@@9 diz Ref__a) tid_14@@2) Ref__Integer_value)) FullPerm))
 :qid |stdinbpl.2568:17|
 :skolemid |108|
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 diz Ref__a) tid_14@@2))
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 diz Ref__a) tid_14@@2))
)) (=> (and (and (forall ((tid_14@@3 Int) ) (!  (=> (and (and (<= 0 tid_14@@3) (< tid_14@@3 gsize)) (< NoPerm FullPerm)) (and (qpRange8 (|Seq#Index| (MapType0Select Heap@@9 diz Ref__a) tid_14@@3)) (= (invRecv8 (|Seq#Index| (MapType0Select Heap@@9 diz Ref__a) tid_14@@3)) tid_14@@3)))
 :qid |stdinbpl.2574:22|
 :skolemid |109|
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 diz Ref__a) tid_14@@3))
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 diz Ref__a) tid_14@@3))
)) (forall ((o_3@@9 T@U) ) (!  (=> (= (type o_3@@9) RefType) (=> (and (and (<= 0 (invRecv8 o_3@@9)) (< (invRecv8 o_3@@9) gsize)) (and (< NoPerm FullPerm) (qpRange8 o_3@@9))) (= (|Seq#Index| (MapType0Select Heap@@9 diz Ref__a) (invRecv8 o_3@@9)) o_3@@9)))
 :qid |stdinbpl.2578:22|
 :skolemid |110|
 :pattern ( (invRecv8 o_3@@9))
))) (and (forall ((o_3@@10 T@U) ) (!  (=> (= (type o_3@@10) RefType) (and (=> (and (and (<= 0 (invRecv8 o_3@@10)) (< (invRecv8 o_3@@10) gsize)) (and (< NoPerm FullPerm) (qpRange8 o_3@@10))) (and (= (|Seq#Index| (MapType0Select Heap@@9 diz Ref__a) (invRecv8 o_3@@10)) o_3@@10) (= (U_2_real (MapType1Select QPMask@3 o_3@@10 Ref__Integer_value)) (- (U_2_real (MapType1Select Mask@5 o_3@@10 Ref__Integer_value)) FullPerm)))) (=> (not (and (and (<= 0 (invRecv8 o_3@@10)) (< (invRecv8 o_3@@10) gsize)) (and (< NoPerm FullPerm) (qpRange8 o_3@@10)))) (= (U_2_real (MapType1Select QPMask@3 o_3@@10 Ref__Integer_value)) (U_2_real (MapType1Select Mask@5 o_3@@10 Ref__Integer_value))))))
 :qid |stdinbpl.2584:22|
 :skolemid |111|
 :pattern ( (MapType1Select QPMask@3 o_3@@10 Ref__Integer_value))
)) (forall ((o_3@@11 T@U) (f_5@@2 T@U) ) (! (let ((B@@14 (FieldTypeInv1 (type f_5@@2))))
(let ((A@@15 (FieldTypeInv0 (type f_5@@2))))
 (=> (and (and (= (type o_3@@11) RefType) (= (type f_5@@2) (FieldType A@@15 B@@14))) (not (= f_5@@2 Ref__Integer_value))) (= (U_2_real (MapType1Select Mask@5 o_3@@11 f_5@@2)) (U_2_real (MapType1Select QPMask@3 o_3@@11 f_5@@2))))))
 :qid |stdinbpl.2590:29|
 :skolemid |112|
 :pattern ( (MapType1Select QPMask@3 o_3@@11 f_5@@2))
)))) (and (=> (= (ControlFlow 0 71) (- 0 79)) (forall ((tid_15 Int) ) (!  (=> (and (and (<= 0 tid_15) (< tid_15 gsize)) (dummyFunction (MapType0Select Heap@@9 (|Seq#Index| (MapType0Select Heap@@9 diz Ref__b) tid_15) Ref__Integer_value))) (>= (/ (to_real 1) (to_real 4)) NoPerm))
 :qid |stdinbpl.2599:17|
 :skolemid |113|
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 diz Ref__b) tid_15))
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 diz Ref__b) tid_15))
))) (=> (forall ((tid_15@@0 Int) ) (!  (=> (and (and (<= 0 tid_15@@0) (< tid_15@@0 gsize)) (dummyFunction (MapType0Select Heap@@9 (|Seq#Index| (MapType0Select Heap@@9 diz Ref__b) tid_15@@0) Ref__Integer_value))) (>= (/ (to_real 1) (to_real 4)) NoPerm))
 :qid |stdinbpl.2599:17|
 :skolemid |113|
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 diz Ref__b) tid_15@@0))
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 diz Ref__b) tid_15@@0))
)) (and (=> (= (ControlFlow 0 71) (- 0 78)) (forall ((tid_15@@1 Int) (tid_15_1 Int) ) (!  (=> (and (and (and (and (not (= tid_15@@1 tid_15_1)) (and (<= 0 tid_15@@1) (< tid_15@@1 gsize))) (and (<= 0 tid_15_1) (< tid_15_1 gsize))) (< NoPerm (/ (to_real 1) (to_real 4)))) (< NoPerm (/ (to_real 1) (to_real 4)))) (not (= (|Seq#Index| (MapType0Select Heap@@9 diz Ref__b) tid_15@@1) (|Seq#Index| (MapType0Select Heap@@9 diz Ref__b) tid_15_1))))
 :qid |stdinbpl.2606:17|
 :skolemid |114|
 :pattern ( (neverTriggered9 tid_15@@1) (neverTriggered9 tid_15_1))
))) (=> (forall ((tid_15@@2 Int) (tid_15_1@@0 Int) ) (!  (=> (and (and (and (and (not (= tid_15@@2 tid_15_1@@0)) (and (<= 0 tid_15@@2) (< tid_15@@2 gsize))) (and (<= 0 tid_15_1@@0) (< tid_15_1@@0 gsize))) (< NoPerm (/ (to_real 1) (to_real 4)))) (< NoPerm (/ (to_real 1) (to_real 4)))) (not (= (|Seq#Index| (MapType0Select Heap@@9 diz Ref__b) tid_15@@2) (|Seq#Index| (MapType0Select Heap@@9 diz Ref__b) tid_15_1@@0))))
 :qid |stdinbpl.2606:17|
 :skolemid |114|
 :pattern ( (neverTriggered9 tid_15@@2) (neverTriggered9 tid_15_1@@0))
)) (and (=> (= (ControlFlow 0 71) (- 0 77)) (forall ((tid_15@@3 Int) ) (!  (=> (and (<= 0 tid_15@@3) (< tid_15@@3 gsize)) (>= (U_2_real (MapType1Select QPMask@3 (|Seq#Index| (MapType0Select Heap@@9 diz Ref__b) tid_15@@3) Ref__Integer_value)) (/ (to_real 1) (to_real 4))))
 :qid |stdinbpl.2613:17|
 :skolemid |115|
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 diz Ref__b) tid_15@@3))
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 diz Ref__b) tid_15@@3))
))) (=> (forall ((tid_15@@4 Int) ) (!  (=> (and (<= 0 tid_15@@4) (< tid_15@@4 gsize)) (>= (U_2_real (MapType1Select QPMask@3 (|Seq#Index| (MapType0Select Heap@@9 diz Ref__b) tid_15@@4) Ref__Integer_value)) (/ (to_real 1) (to_real 4))))
 :qid |stdinbpl.2613:17|
 :skolemid |115|
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 diz Ref__b) tid_15@@4))
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 diz Ref__b) tid_15@@4))
)) (=> (and (and (forall ((tid_15@@5 Int) ) (!  (=> (and (and (<= 0 tid_15@@5) (< tid_15@@5 gsize)) (< NoPerm (/ (to_real 1) (to_real 4)))) (and (qpRange9 (|Seq#Index| (MapType0Select Heap@@9 diz Ref__b) tid_15@@5)) (= (invRecv9 (|Seq#Index| (MapType0Select Heap@@9 diz Ref__b) tid_15@@5)) tid_15@@5)))
 :qid |stdinbpl.2619:22|
 :skolemid |116|
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 diz Ref__b) tid_15@@5))
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 diz Ref__b) tid_15@@5))
)) (forall ((o_3@@12 T@U) ) (!  (=> (= (type o_3@@12) RefType) (=> (and (and (<= 0 (invRecv9 o_3@@12)) (< (invRecv9 o_3@@12) gsize)) (and (< NoPerm (/ (to_real 1) (to_real 4))) (qpRange9 o_3@@12))) (= (|Seq#Index| (MapType0Select Heap@@9 diz Ref__b) (invRecv9 o_3@@12)) o_3@@12)))
 :qid |stdinbpl.2623:22|
 :skolemid |117|
 :pattern ( (invRecv9 o_3@@12))
))) (and (forall ((o_3@@13 T@U) ) (!  (=> (= (type o_3@@13) RefType) (and (=> (and (and (<= 0 (invRecv9 o_3@@13)) (< (invRecv9 o_3@@13) gsize)) (and (< NoPerm (/ (to_real 1) (to_real 4))) (qpRange9 o_3@@13))) (and (= (|Seq#Index| (MapType0Select Heap@@9 diz Ref__b) (invRecv9 o_3@@13)) o_3@@13) (= (U_2_real (MapType1Select QPMask@4 o_3@@13 Ref__Integer_value)) (- (U_2_real (MapType1Select QPMask@3 o_3@@13 Ref__Integer_value)) (/ (to_real 1) (to_real 4)))))) (=> (not (and (and (<= 0 (invRecv9 o_3@@13)) (< (invRecv9 o_3@@13) gsize)) (and (< NoPerm (/ (to_real 1) (to_real 4))) (qpRange9 o_3@@13)))) (= (U_2_real (MapType1Select QPMask@4 o_3@@13 Ref__Integer_value)) (U_2_real (MapType1Select QPMask@3 o_3@@13 Ref__Integer_value))))))
 :qid |stdinbpl.2629:22|
 :skolemid |118|
 :pattern ( (MapType1Select QPMask@4 o_3@@13 Ref__Integer_value))
)) (forall ((o_3@@14 T@U) (f_5@@3 T@U) ) (! (let ((B@@15 (FieldTypeInv1 (type f_5@@3))))
(let ((A@@16 (FieldTypeInv0 (type f_5@@3))))
 (=> (and (and (= (type o_3@@14) RefType) (= (type f_5@@3) (FieldType A@@16 B@@15))) (not (= f_5@@3 Ref__Integer_value))) (= (U_2_real (MapType1Select QPMask@3 o_3@@14 f_5@@3)) (U_2_real (MapType1Select QPMask@4 o_3@@14 f_5@@3))))))
 :qid |stdinbpl.2635:29|
 :skolemid |119|
 :pattern ( (MapType1Select QPMask@4 o_3@@14 f_5@@3))
)))) (and (=> (= (ControlFlow 0 71) (- 0 76)) (forall ((tid_16 Int) ) (!  (=> (and (and (<= 0 tid_16) (< tid_16 gsize)) (dummyFunction (MapType0Select Heap@@9 (|Seq#Index| (MapType0Select Heap@@9 diz Ref__c) tid_16) Ref__Integer_value))) (>= (/ (to_real 1) (to_real 4)) NoPerm))
 :qid |stdinbpl.2644:17|
 :skolemid |120|
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 diz Ref__c) tid_16))
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 diz Ref__c) tid_16))
))) (=> (forall ((tid_16@@0 Int) ) (!  (=> (and (and (<= 0 tid_16@@0) (< tid_16@@0 gsize)) (dummyFunction (MapType0Select Heap@@9 (|Seq#Index| (MapType0Select Heap@@9 diz Ref__c) tid_16@@0) Ref__Integer_value))) (>= (/ (to_real 1) (to_real 4)) NoPerm))
 :qid |stdinbpl.2644:17|
 :skolemid |120|
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 diz Ref__c) tid_16@@0))
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 diz Ref__c) tid_16@@0))
)) (and (=> (= (ControlFlow 0 71) (- 0 75)) (forall ((tid_16@@1 Int) (tid_16_1 Int) ) (!  (=> (and (and (and (and (not (= tid_16@@1 tid_16_1)) (and (<= 0 tid_16@@1) (< tid_16@@1 gsize))) (and (<= 0 tid_16_1) (< tid_16_1 gsize))) (< NoPerm (/ (to_real 1) (to_real 4)))) (< NoPerm (/ (to_real 1) (to_real 4)))) (not (= (|Seq#Index| (MapType0Select Heap@@9 diz Ref__c) tid_16@@1) (|Seq#Index| (MapType0Select Heap@@9 diz Ref__c) tid_16_1))))
 :qid |stdinbpl.2651:17|
 :skolemid |121|
 :pattern ( (neverTriggered10 tid_16@@1) (neverTriggered10 tid_16_1))
))) (=> (forall ((tid_16@@2 Int) (tid_16_1@@0 Int) ) (!  (=> (and (and (and (and (not (= tid_16@@2 tid_16_1@@0)) (and (<= 0 tid_16@@2) (< tid_16@@2 gsize))) (and (<= 0 tid_16_1@@0) (< tid_16_1@@0 gsize))) (< NoPerm (/ (to_real 1) (to_real 4)))) (< NoPerm (/ (to_real 1) (to_real 4)))) (not (= (|Seq#Index| (MapType0Select Heap@@9 diz Ref__c) tid_16@@2) (|Seq#Index| (MapType0Select Heap@@9 diz Ref__c) tid_16_1@@0))))
 :qid |stdinbpl.2651:17|
 :skolemid |121|
 :pattern ( (neverTriggered10 tid_16@@2) (neverTriggered10 tid_16_1@@0))
)) (and (=> (= (ControlFlow 0 71) (- 0 74)) (forall ((tid_16@@3 Int) ) (!  (=> (and (<= 0 tid_16@@3) (< tid_16@@3 gsize)) (>= (U_2_real (MapType1Select QPMask@4 (|Seq#Index| (MapType0Select Heap@@9 diz Ref__c) tid_16@@3) Ref__Integer_value)) (/ (to_real 1) (to_real 4))))
 :qid |stdinbpl.2658:17|
 :skolemid |122|
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 diz Ref__c) tid_16@@3))
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 diz Ref__c) tid_16@@3))
))) (=> (forall ((tid_16@@4 Int) ) (!  (=> (and (<= 0 tid_16@@4) (< tid_16@@4 gsize)) (>= (U_2_real (MapType1Select QPMask@4 (|Seq#Index| (MapType0Select Heap@@9 diz Ref__c) tid_16@@4) Ref__Integer_value)) (/ (to_real 1) (to_real 4))))
 :qid |stdinbpl.2658:17|
 :skolemid |122|
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 diz Ref__c) tid_16@@4))
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 diz Ref__c) tid_16@@4))
)) (=> (and (and (forall ((tid_16@@5 Int) ) (!  (=> (and (and (<= 0 tid_16@@5) (< tid_16@@5 gsize)) (< NoPerm (/ (to_real 1) (to_real 4)))) (and (qpRange10 (|Seq#Index| (MapType0Select Heap@@9 diz Ref__c) tid_16@@5)) (= (invRecv10 (|Seq#Index| (MapType0Select Heap@@9 diz Ref__c) tid_16@@5)) tid_16@@5)))
 :qid |stdinbpl.2664:22|
 :skolemid |123|
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 diz Ref__c) tid_16@@5))
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 diz Ref__c) tid_16@@5))
)) (forall ((o_3@@15 T@U) ) (!  (=> (= (type o_3@@15) RefType) (=> (and (and (<= 0 (invRecv10 o_3@@15)) (< (invRecv10 o_3@@15) gsize)) (and (< NoPerm (/ (to_real 1) (to_real 4))) (qpRange10 o_3@@15))) (= (|Seq#Index| (MapType0Select Heap@@9 diz Ref__c) (invRecv10 o_3@@15)) o_3@@15)))
 :qid |stdinbpl.2668:22|
 :skolemid |124|
 :pattern ( (invRecv10 o_3@@15))
))) (and (forall ((o_3@@16 T@U) ) (!  (=> (= (type o_3@@16) RefType) (and (=> (and (and (<= 0 (invRecv10 o_3@@16)) (< (invRecv10 o_3@@16) gsize)) (and (< NoPerm (/ (to_real 1) (to_real 4))) (qpRange10 o_3@@16))) (and (= (|Seq#Index| (MapType0Select Heap@@9 diz Ref__c) (invRecv10 o_3@@16)) o_3@@16) (= (U_2_real (MapType1Select QPMask@5 o_3@@16 Ref__Integer_value)) (- (U_2_real (MapType1Select QPMask@4 o_3@@16 Ref__Integer_value)) (/ (to_real 1) (to_real 4)))))) (=> (not (and (and (<= 0 (invRecv10 o_3@@16)) (< (invRecv10 o_3@@16) gsize)) (and (< NoPerm (/ (to_real 1) (to_real 4))) (qpRange10 o_3@@16)))) (= (U_2_real (MapType1Select QPMask@5 o_3@@16 Ref__Integer_value)) (U_2_real (MapType1Select QPMask@4 o_3@@16 Ref__Integer_value))))))
 :qid |stdinbpl.2674:22|
 :skolemid |125|
 :pattern ( (MapType1Select QPMask@5 o_3@@16 Ref__Integer_value))
)) (forall ((o_3@@17 T@U) (f_5@@4 T@U) ) (! (let ((B@@16 (FieldTypeInv1 (type f_5@@4))))
(let ((A@@17 (FieldTypeInv0 (type f_5@@4))))
 (=> (and (and (= (type o_3@@17) RefType) (= (type f_5@@4) (FieldType A@@17 B@@16))) (not (= f_5@@4 Ref__Integer_value))) (= (U_2_real (MapType1Select QPMask@4 o_3@@17 f_5@@4)) (U_2_real (MapType1Select QPMask@5 o_3@@17 f_5@@4))))))
 :qid |stdinbpl.2680:29|
 :skolemid |126|
 :pattern ( (MapType1Select QPMask@5 o_3@@17 f_5@@4))
)))) (and (=> (= (ControlFlow 0 71) (- 0 73)) (forall ((tid_17 Int) ) (!  (=> (and (and (<= 0 tid_17) (< tid_17 (- gsize 1))) (dummyFunction (MapType0Select Heap@@9 (|Seq#Index| (MapType0Select Heap@@9 diz Ref__b) tid_17) Ref__Integer_value))) (>= (/ (to_real 1) (to_real 4)) NoPerm))
 :qid |stdinbpl.2689:17|
 :skolemid |127|
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 diz Ref__b) tid_17))
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 diz Ref__b) tid_17))
))) (=> (forall ((tid_17@@0 Int) ) (!  (=> (and (and (<= 0 tid_17@@0) (< tid_17@@0 (- gsize 1))) (dummyFunction (MapType0Select Heap@@9 (|Seq#Index| (MapType0Select Heap@@9 diz Ref__b) tid_17@@0) Ref__Integer_value))) (>= (/ (to_real 1) (to_real 4)) NoPerm))
 :qid |stdinbpl.2689:17|
 :skolemid |127|
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 diz Ref__b) tid_17@@0))
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 diz Ref__b) tid_17@@0))
)) (and (=> (= (ControlFlow 0 71) (- 0 72)) (forall ((tid_17@@1 Int) (tid_17_1 Int) ) (!  (=> (and (and (and (and (not (= tid_17@@1 tid_17_1)) (and (<= 0 tid_17@@1) (< tid_17@@1 (- gsize 1)))) (and (<= 0 tid_17_1) (< tid_17_1 (- gsize 1)))) (< NoPerm (/ (to_real 1) (to_real 4)))) (< NoPerm (/ (to_real 1) (to_real 4)))) (not (= (|Seq#Index| (MapType0Select Heap@@9 diz Ref__b) tid_17@@1) (|Seq#Index| (MapType0Select Heap@@9 diz Ref__b) tid_17_1))))
 :qid |stdinbpl.2696:17|
 :skolemid |128|
 :pattern ( (neverTriggered11 tid_17@@1) (neverTriggered11 tid_17_1))
))) (=> (forall ((tid_17@@2 Int) (tid_17_1@@0 Int) ) (!  (=> (and (and (and (and (not (= tid_17@@2 tid_17_1@@0)) (and (<= 0 tid_17@@2) (< tid_17@@2 (- gsize 1)))) (and (<= 0 tid_17_1@@0) (< tid_17_1@@0 (- gsize 1)))) (< NoPerm (/ (to_real 1) (to_real 4)))) (< NoPerm (/ (to_real 1) (to_real 4)))) (not (= (|Seq#Index| (MapType0Select Heap@@9 diz Ref__b) tid_17@@2) (|Seq#Index| (MapType0Select Heap@@9 diz Ref__b) tid_17_1@@0))))
 :qid |stdinbpl.2696:17|
 :skolemid |128|
 :pattern ( (neverTriggered11 tid_17@@2) (neverTriggered11 tid_17_1@@0))
)) (=> (= (ControlFlow 0 71) (- 0 70)) (forall ((tid_17@@3 Int) ) (!  (=> (and (<= 0 tid_17@@3) (< tid_17@@3 (- gsize 1))) (>= (U_2_real (MapType1Select QPMask@5 (|Seq#Index| (MapType0Select Heap@@9 diz Ref__b) tid_17@@3) Ref__Integer_value)) (/ (to_real 1) (to_real 4))))
 :qid |stdinbpl.2703:17|
 :skolemid |129|
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 diz Ref__b) tid_17@@3))
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 diz Ref__b) tid_17@@3))
))))))))))))))))))))))))))))))))))))))))))))))))))))))))
(let ((anon74_Else_correct  (and (=> (= (ControlFlow 0 138) (- 0 140)) (forall ((tid_5 Int) (tid_5_1 Int) ) (!  (=> (and (and (and (and (not (= tid_5 tid_5_1)) (and (<= 0 tid_5) (< tid_5 gsize))) (and (<= 0 tid_5_1) (< tid_5_1 gsize))) (< NoPerm (/ (to_real 1) (to_real 4)))) (< NoPerm (/ (to_real 1) (to_real 4)))) (not (= (|Seq#Index| (MapType0Select Heap@@9 diz Ref__c) tid_5) (|Seq#Index| (MapType0Select Heap@@9 diz Ref__c) tid_5_1))))
 :qid |stdinbpl.2192:15|
 :skolemid |73|
))) (=> (forall ((tid_5@@0 Int) (tid_5_1@@0 Int) ) (!  (=> (and (and (and (and (not (= tid_5@@0 tid_5_1@@0)) (and (<= 0 tid_5@@0) (< tid_5@@0 gsize))) (and (<= 0 tid_5_1@@0) (< tid_5_1@@0 gsize))) (< NoPerm (/ (to_real 1) (to_real 4)))) (< NoPerm (/ (to_real 1) (to_real 4)))) (not (= (|Seq#Index| (MapType0Select Heap@@9 diz Ref__c) tid_5@@0) (|Seq#Index| (MapType0Select Heap@@9 diz Ref__c) tid_5_1@@0))))
 :qid |stdinbpl.2192:15|
 :skolemid |73|
)) (=> (and (forall ((tid_5@@1 Int) ) (!  (=> (and (and (<= 0 tid_5@@1) (< tid_5@@1 gsize)) (< NoPerm (/ (to_real 1) (to_real 4)))) (and (qpRange3 (|Seq#Index| (MapType0Select Heap@@9 diz Ref__c) tid_5@@1)) (= (invRecv3 (|Seq#Index| (MapType0Select Heap@@9 diz Ref__c) tid_5@@1)) tid_5@@1)))
 :qid |stdinbpl.2198:22|
 :skolemid |74|
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 diz Ref__c) tid_5@@1))
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 diz Ref__c) tid_5@@1))
)) (forall ((o_3@@18 T@U) ) (!  (=> (= (type o_3@@18) RefType) (=> (and (and (and (<= 0 (invRecv3 o_3@@18)) (< (invRecv3 o_3@@18) gsize)) (< NoPerm (/ (to_real 1) (to_real 4)))) (qpRange3 o_3@@18)) (= (|Seq#Index| (MapType0Select Heap@@9 diz Ref__c) (invRecv3 o_3@@18)) o_3@@18)))
 :qid |stdinbpl.2202:22|
 :skolemid |75|
 :pattern ( (invRecv3 o_3@@18))
))) (and (=> (= (ControlFlow 0 138) (- 0 139)) (forall ((tid_5@@2 Int) ) (!  (=> (and (<= 0 tid_5@@2) (< tid_5@@2 gsize)) (>= (/ (to_real 1) (to_real 4)) NoPerm))
 :qid |stdinbpl.2208:15|
 :skolemid |76|
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 diz Ref__c) tid_5@@2))
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 diz Ref__c) tid_5@@2))
))) (=> (forall ((tid_5@@3 Int) ) (!  (=> (and (<= 0 tid_5@@3) (< tid_5@@3 gsize)) (>= (/ (to_real 1) (to_real 4)) NoPerm))
 :qid |stdinbpl.2208:15|
 :skolemid |76|
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 diz Ref__c) tid_5@@3))
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 diz Ref__c) tid_5@@3))
)) (=> (forall ((tid_5@@4 Int) ) (!  (=> (and (and (<= 0 tid_5@@4) (< tid_5@@4 gsize)) (> (/ (to_real 1) (to_real 4)) NoPerm)) (not (= (|Seq#Index| (MapType0Select Heap@@9 diz Ref__c) tid_5@@4) null)))
 :qid |stdinbpl.2214:22|
 :skolemid |77|
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 diz Ref__c) tid_5@@4))
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 diz Ref__c) tid_5@@4))
)) (=> (and (and (forall ((o_3@@19 T@U) ) (!  (=> (= (type o_3@@19) RefType) (and (=> (and (and (and (<= 0 (invRecv3 o_3@@19)) (< (invRecv3 o_3@@19) gsize)) (< NoPerm (/ (to_real 1) (to_real 4)))) (qpRange3 o_3@@19)) (and (=> (< NoPerm (/ (to_real 1) (to_real 4))) (= (|Seq#Index| (MapType0Select Heap@@9 diz Ref__c) (invRecv3 o_3@@19)) o_3@@19)) (= (U_2_real (MapType1Select QPMask@2 o_3@@19 Ref__Integer_value)) (+ (U_2_real (MapType1Select QPMask@1 o_3@@19 Ref__Integer_value)) (/ (to_real 1) (to_real 4)))))) (=> (not (and (and (and (<= 0 (invRecv3 o_3@@19)) (< (invRecv3 o_3@@19) gsize)) (< NoPerm (/ (to_real 1) (to_real 4)))) (qpRange3 o_3@@19))) (= (U_2_real (MapType1Select QPMask@2 o_3@@19 Ref__Integer_value)) (U_2_real (MapType1Select QPMask@1 o_3@@19 Ref__Integer_value))))))
 :qid |stdinbpl.2220:22|
 :skolemid |78|
 :pattern ( (MapType1Select QPMask@2 o_3@@19 Ref__Integer_value))
)) (forall ((o_3@@20 T@U) (f_5@@5 T@U) ) (! (let ((B@@17 (FieldTypeInv1 (type f_5@@5))))
(let ((A@@18 (FieldTypeInv0 (type f_5@@5))))
 (=> (and (and (= (type o_3@@20) RefType) (= (type f_5@@5) (FieldType A@@18 B@@17))) (not (= f_5@@5 Ref__Integer_value))) (= (U_2_real (MapType1Select QPMask@1 o_3@@20 f_5@@5)) (U_2_real (MapType1Select QPMask@2 o_3@@20 f_5@@5))))))
 :qid |stdinbpl.2224:29|
 :skolemid |79|
 :pattern ( (MapType1Select QPMask@1 o_3@@20 f_5@@5))
 :pattern ( (MapType1Select QPMask@2 o_3@@20 f_5@@5))
))) (and (state Heap@@9 QPMask@2) (state Heap@@9 QPMask@2))) (and (=> (= (ControlFlow 0 138) 128) anon76_Then_correct) (=> (= (ControlFlow 0 138) 71) anon76_Else_correct)))))))))))
(let ((anon35_correct true))
(let ((anon75_Else_correct  (=> (and (not (and (<= 0 tid_6) (< tid_6 gsize))) (= (ControlFlow 0 69) 64)) anon35_correct)))
(let ((anon75_Then_correct  (=> (and (<= 0 tid_6) (< tid_6 gsize)) (and (=> (= (ControlFlow 0 65) (- 0 68)) (HasDirectPerm QPMask@1 diz Ref__c)) (=> (HasDirectPerm QPMask@1 diz Ref__c) (and (=> (= (ControlFlow 0 65) (- 0 67)) (>= tid_6 0)) (=> (>= tid_6 0) (and (=> (= (ControlFlow 0 65) (- 0 66)) (< tid_6 (|Seq#Length| (MapType0Select Heap@@9 diz Ref__c)))) (=> (< tid_6 (|Seq#Length| (MapType0Select Heap@@9 diz Ref__c))) (=> (= (ControlFlow 0 65) 64) anon35_correct))))))))))
(let ((anon72_Else_correct  (and (=> (= (ControlFlow 0 141) (- 0 142)) (forall ((tid_3 Int) (tid_3_1 Int) ) (!  (=> (and (and (and (and (not (= tid_3 tid_3_1)) (and (<= 0 tid_3) (< tid_3 gsize))) (and (<= 0 tid_3_1) (< tid_3_1 gsize))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| (MapType0Select Heap@@9 diz Ref__b) tid_3) (|Seq#Index| (MapType0Select Heap@@9 diz Ref__b) tid_3_1))))
 :qid |stdinbpl.2144:15|
 :skolemid |67|
))) (=> (forall ((tid_3@@0 Int) (tid_3_1@@0 Int) ) (!  (=> (and (and (and (and (not (= tid_3@@0 tid_3_1@@0)) (and (<= 0 tid_3@@0) (< tid_3@@0 gsize))) (and (<= 0 tid_3_1@@0) (< tid_3_1@@0 gsize))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| (MapType0Select Heap@@9 diz Ref__b) tid_3@@0) (|Seq#Index| (MapType0Select Heap@@9 diz Ref__b) tid_3_1@@0))))
 :qid |stdinbpl.2144:15|
 :skolemid |67|
)) (=> (forall ((tid_3@@1 Int) ) (!  (=> (and (and (<= 0 tid_3@@1) (< tid_3@@1 gsize)) (< NoPerm FullPerm)) (and (qpRange2 (|Seq#Index| (MapType0Select Heap@@9 diz Ref__b) tid_3@@1)) (= (invRecv2 (|Seq#Index| (MapType0Select Heap@@9 diz Ref__b) tid_3@@1)) tid_3@@1)))
 :qid |stdinbpl.2150:22|
 :skolemid |68|
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 diz Ref__b) tid_3@@1))
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 diz Ref__b) tid_3@@1))
)) (=> (and (forall ((o_3@@21 T@U) ) (!  (=> (= (type o_3@@21) RefType) (=> (and (and (and (<= 0 (invRecv2 o_3@@21)) (< (invRecv2 o_3@@21) gsize)) (< NoPerm FullPerm)) (qpRange2 o_3@@21)) (= (|Seq#Index| (MapType0Select Heap@@9 diz Ref__b) (invRecv2 o_3@@21)) o_3@@21)))
 :qid |stdinbpl.2154:22|
 :skolemid |69|
 :pattern ( (invRecv2 o_3@@21))
)) (forall ((tid_3@@2 Int) ) (!  (=> (and (<= 0 tid_3@@2) (< tid_3@@2 gsize)) (not (= (|Seq#Index| (MapType0Select Heap@@9 diz Ref__b) tid_3@@2) null)))
 :qid |stdinbpl.2160:22|
 :skolemid |70|
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 diz Ref__b) tid_3@@2))
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 diz Ref__b) tid_3@@2))
))) (=> (and (and (forall ((o_3@@22 T@U) ) (!  (=> (= (type o_3@@22) RefType) (and (=> (and (and (and (<= 0 (invRecv2 o_3@@22)) (< (invRecv2 o_3@@22) gsize)) (< NoPerm FullPerm)) (qpRange2 o_3@@22)) (and (=> (< NoPerm FullPerm) (= (|Seq#Index| (MapType0Select Heap@@9 diz Ref__b) (invRecv2 o_3@@22)) o_3@@22)) (= (U_2_real (MapType1Select QPMask@1 o_3@@22 Ref__Integer_value)) (+ (U_2_real (MapType1Select QPMask@0 o_3@@22 Ref__Integer_value)) FullPerm)))) (=> (not (and (and (and (<= 0 (invRecv2 o_3@@22)) (< (invRecv2 o_3@@22) gsize)) (< NoPerm FullPerm)) (qpRange2 o_3@@22))) (= (U_2_real (MapType1Select QPMask@1 o_3@@22 Ref__Integer_value)) (U_2_real (MapType1Select QPMask@0 o_3@@22 Ref__Integer_value))))))
 :qid |stdinbpl.2166:22|
 :skolemid |71|
 :pattern ( (MapType1Select QPMask@1 o_3@@22 Ref__Integer_value))
)) (forall ((o_3@@23 T@U) (f_5@@6 T@U) ) (! (let ((B@@18 (FieldTypeInv1 (type f_5@@6))))
(let ((A@@19 (FieldTypeInv0 (type f_5@@6))))
 (=> (and (and (= (type o_3@@23) RefType) (= (type f_5@@6) (FieldType A@@19 B@@18))) (not (= f_5@@6 Ref__Integer_value))) (= (U_2_real (MapType1Select QPMask@0 o_3@@23 f_5@@6)) (U_2_real (MapType1Select QPMask@1 o_3@@23 f_5@@6))))))
 :qid |stdinbpl.2170:29|
 :skolemid |72|
 :pattern ( (MapType1Select QPMask@0 o_3@@23 f_5@@6))
 :pattern ( (MapType1Select QPMask@1 o_3@@23 f_5@@6))
))) (and (state Heap@@9 QPMask@1) (state Heap@@9 QPMask@1))) (and (and (=> (= (ControlFlow 0 141) 138) anon74_Else_correct) (=> (= (ControlFlow 0 141) 65) anon75_Then_correct)) (=> (= (ControlFlow 0 141) 69) anon75_Else_correct)))))))))
(let ((anon31_correct true))
(let ((anon73_Else_correct  (=> (and (not (and (<= 0 tid_4) (< tid_4 gsize))) (= (ControlFlow 0 63) 58)) anon31_correct)))
(let ((anon73_Then_correct  (=> (and (<= 0 tid_4) (< tid_4 gsize)) (and (=> (= (ControlFlow 0 59) (- 0 62)) (HasDirectPerm QPMask@0 diz Ref__b)) (=> (HasDirectPerm QPMask@0 diz Ref__b) (and (=> (= (ControlFlow 0 59) (- 0 61)) (>= tid_4 0)) (=> (>= tid_4 0) (and (=> (= (ControlFlow 0 59) (- 0 60)) (< tid_4 (|Seq#Length| (MapType0Select Heap@@9 diz Ref__b)))) (=> (< tid_4 (|Seq#Length| (MapType0Select Heap@@9 diz Ref__b))) (=> (= (ControlFlow 0 59) 58) anon31_correct))))))))))
(let ((anon70_Else_correct  (and (=> (= (ControlFlow 0 143) (- 0 144)) (forall ((tid_1 Int) (tid_1_1 Int) ) (!  (=> (and (and (and (and (not (= tid_1 tid_1_1)) (and (<= 0 tid_1) (< tid_1 gsize))) (and (<= 0 tid_1_1) (< tid_1_1 gsize))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| (MapType0Select Heap@@9 diz Ref__a) tid_1) (|Seq#Index| (MapType0Select Heap@@9 diz Ref__a) tid_1_1))))
 :qid |stdinbpl.2096:15|
 :skolemid |61|
))) (=> (forall ((tid_1@@0 Int) (tid_1_1@@0 Int) ) (!  (=> (and (and (and (and (not (= tid_1@@0 tid_1_1@@0)) (and (<= 0 tid_1@@0) (< tid_1@@0 gsize))) (and (<= 0 tid_1_1@@0) (< tid_1_1@@0 gsize))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| (MapType0Select Heap@@9 diz Ref__a) tid_1@@0) (|Seq#Index| (MapType0Select Heap@@9 diz Ref__a) tid_1_1@@0))))
 :qid |stdinbpl.2096:15|
 :skolemid |61|
)) (=> (forall ((tid_1@@1 Int) ) (!  (=> (and (and (<= 0 tid_1@@1) (< tid_1@@1 gsize)) (< NoPerm FullPerm)) (and (qpRange1 (|Seq#Index| (MapType0Select Heap@@9 diz Ref__a) tid_1@@1)) (= (invRecv1 (|Seq#Index| (MapType0Select Heap@@9 diz Ref__a) tid_1@@1)) tid_1@@1)))
 :qid |stdinbpl.2102:22|
 :skolemid |62|
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 diz Ref__a) tid_1@@1))
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 diz Ref__a) tid_1@@1))
)) (=> (and (forall ((o_3@@24 T@U) ) (!  (=> (= (type o_3@@24) RefType) (=> (and (and (and (<= 0 (invRecv1 o_3@@24)) (< (invRecv1 o_3@@24) gsize)) (< NoPerm FullPerm)) (qpRange1 o_3@@24)) (= (|Seq#Index| (MapType0Select Heap@@9 diz Ref__a) (invRecv1 o_3@@24)) o_3@@24)))
 :qid |stdinbpl.2106:22|
 :skolemid |63|
 :pattern ( (invRecv1 o_3@@24))
)) (forall ((tid_1@@2 Int) ) (!  (=> (and (<= 0 tid_1@@2) (< tid_1@@2 gsize)) (not (= (|Seq#Index| (MapType0Select Heap@@9 diz Ref__a) tid_1@@2) null)))
 :qid |stdinbpl.2112:22|
 :skolemid |64|
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 diz Ref__a) tid_1@@2))
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 diz Ref__a) tid_1@@2))
))) (=> (and (and (forall ((o_3@@25 T@U) ) (!  (=> (= (type o_3@@25) RefType) (and (=> (and (and (and (<= 0 (invRecv1 o_3@@25)) (< (invRecv1 o_3@@25) gsize)) (< NoPerm FullPerm)) (qpRange1 o_3@@25)) (and (=> (< NoPerm FullPerm) (= (|Seq#Index| (MapType0Select Heap@@9 diz Ref__a) (invRecv1 o_3@@25)) o_3@@25)) (= (U_2_real (MapType1Select QPMask@0 o_3@@25 Ref__Integer_value)) (+ (U_2_real (MapType1Select Mask@2 o_3@@25 Ref__Integer_value)) FullPerm)))) (=> (not (and (and (and (<= 0 (invRecv1 o_3@@25)) (< (invRecv1 o_3@@25) gsize)) (< NoPerm FullPerm)) (qpRange1 o_3@@25))) (= (U_2_real (MapType1Select QPMask@0 o_3@@25 Ref__Integer_value)) (U_2_real (MapType1Select Mask@2 o_3@@25 Ref__Integer_value))))))
 :qid |stdinbpl.2118:22|
 :skolemid |65|
 :pattern ( (MapType1Select QPMask@0 o_3@@25 Ref__Integer_value))
)) (forall ((o_3@@26 T@U) (f_5@@7 T@U) ) (! (let ((B@@19 (FieldTypeInv1 (type f_5@@7))))
(let ((A@@20 (FieldTypeInv0 (type f_5@@7))))
 (=> (and (and (= (type o_3@@26) RefType) (= (type f_5@@7) (FieldType A@@20 B@@19))) (not (= f_5@@7 Ref__Integer_value))) (= (U_2_real (MapType1Select Mask@2 o_3@@26 f_5@@7)) (U_2_real (MapType1Select QPMask@0 o_3@@26 f_5@@7))))))
 :qid |stdinbpl.2122:29|
 :skolemid |66|
 :pattern ( (MapType1Select Mask@2 o_3@@26 f_5@@7))
 :pattern ( (MapType1Select QPMask@0 o_3@@26 f_5@@7))
))) (and (state Heap@@9 QPMask@0) (state Heap@@9 QPMask@0))) (and (and (=> (= (ControlFlow 0 143) 141) anon72_Else_correct) (=> (= (ControlFlow 0 143) 59) anon73_Then_correct)) (=> (= (ControlFlow 0 143) 63) anon73_Else_correct)))))))))
(let ((anon27_correct true))
(let ((anon71_Else_correct  (=> (and (not (and (<= 0 tid_2) (< tid_2 gsize))) (= (ControlFlow 0 57) 52)) anon27_correct)))
(let ((anon71_Then_correct  (=> (and (<= 0 tid_2) (< tid_2 gsize)) (and (=> (= (ControlFlow 0 53) (- 0 56)) (HasDirectPerm Mask@2 diz Ref__a)) (=> (HasDirectPerm Mask@2 diz Ref__a) (and (=> (= (ControlFlow 0 53) (- 0 55)) (>= tid_2 0)) (=> (>= tid_2 0) (and (=> (= (ControlFlow 0 53) (- 0 54)) (< tid_2 (|Seq#Length| (MapType0Select Heap@@9 diz Ref__a)))) (=> (< tid_2 (|Seq#Length| (MapType0Select Heap@@9 diz Ref__a))) (=> (= (ControlFlow 0 53) 52) anon27_correct))))))))))
(let ((anon65_Else_correct  (=> (and (forall ((i_5 Int) (j_5 Int) ) (!  (=> (and (>= i_5 0) (and (< i_5 (|Seq#Length| (MapType0Select Heap@@9 diz Ref__c))) (and (>= j_5 0) (and (< j_5 (|Seq#Length| (MapType0Select Heap@@9 diz Ref__c))) (not (= i_5 j_5)))))) (not (= (|Seq#Index| (MapType0Select Heap@@9 diz Ref__c) i_5) (|Seq#Index| (MapType0Select Heap@@9 diz Ref__c) j_5))))
 :qid |stdinbpl.2076:20|
 :skolemid |60|
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 diz Ref__c) i_5) (|Seq#Index| (MapType0Select Heap@@9 diz Ref__c) j_5))
)) (state Heap@@9 Mask@2)) (and (and (=> (= (ControlFlow 0 145) 143) anon70_Else_correct) (=> (= (ControlFlow 0 145) 53) anon71_Then_correct)) (=> (= (ControlFlow 0 145) 57) anon71_Else_correct)))))
(let ((anon23_correct true))
(let ((anon69_Else_correct  (=> (and (not (and (>= i_4 0) (and (< i_4 (|Seq#Length| (MapType0Select Heap@@9 diz Ref__c))) (and (>= j_4 0) (and (< j_4 (|Seq#Length| (MapType0Select Heap@@9 diz Ref__c))) (not (= i_4 j_4))))))) (= (ControlFlow 0 43) 35)) anon23_correct)))
(let ((anon69_Then_correct  (=> (and (>= i_4 0) (and (< i_4 (|Seq#Length| (MapType0Select Heap@@9 diz Ref__c))) (and (>= j_4 0) (and (< j_4 (|Seq#Length| (MapType0Select Heap@@9 diz Ref__c))) (not (= i_4 j_4)))))) (and (=> (= (ControlFlow 0 36) (- 0 42)) (HasDirectPerm Mask@2 diz Ref__c)) (=> (HasDirectPerm Mask@2 diz Ref__c) (and (=> (= (ControlFlow 0 36) (- 0 41)) (>= i_4 0)) (=> (>= i_4 0) (and (=> (= (ControlFlow 0 36) (- 0 40)) (< i_4 (|Seq#Length| (MapType0Select Heap@@9 diz Ref__c)))) (=> (< i_4 (|Seq#Length| (MapType0Select Heap@@9 diz Ref__c))) (and (=> (= (ControlFlow 0 36) (- 0 39)) (HasDirectPerm Mask@2 diz Ref__c)) (=> (HasDirectPerm Mask@2 diz Ref__c) (and (=> (= (ControlFlow 0 36) (- 0 38)) (>= j_4 0)) (=> (>= j_4 0) (and (=> (= (ControlFlow 0 36) (- 0 37)) (< j_4 (|Seq#Length| (MapType0Select Heap@@9 diz Ref__c)))) (=> (< j_4 (|Seq#Length| (MapType0Select Heap@@9 diz Ref__c))) (=> (= (ControlFlow 0 36) 35) anon23_correct))))))))))))))))
(let ((anon68_Else_correct  (=> (> 0 j_4) (and (=> (= (ControlFlow 0 48) 36) anon69_Then_correct) (=> (= (ControlFlow 0 48) 43) anon69_Else_correct)))))
(let ((anon68_Then_correct  (=> (>= j_4 0) (and (=> (= (ControlFlow 0 46) (- 0 47)) (HasDirectPerm Mask@2 diz Ref__c)) (=> (HasDirectPerm Mask@2 diz Ref__c) (and (=> (= (ControlFlow 0 46) 36) anon69_Then_correct) (=> (= (ControlFlow 0 46) 43) anon69_Else_correct)))))))
(let ((anon67_Then_correct  (=> (< i_4 (|Seq#Length| (MapType0Select Heap@@9 diz Ref__c))) (and (=> (= (ControlFlow 0 49) 46) anon68_Then_correct) (=> (= (ControlFlow 0 49) 48) anon68_Else_correct)))))
(let ((anon67_Else_correct  (=> (<= (|Seq#Length| (MapType0Select Heap@@9 diz Ref__c)) i_4) (and (=> (= (ControlFlow 0 45) 36) anon69_Then_correct) (=> (= (ControlFlow 0 45) 43) anon69_Else_correct)))))
(let ((anon66_Then_correct  (=> (>= i_4 0) (and (=> (= (ControlFlow 0 50) (- 0 51)) (HasDirectPerm Mask@2 diz Ref__c)) (=> (HasDirectPerm Mask@2 diz Ref__c) (and (=> (= (ControlFlow 0 50) 49) anon67_Then_correct) (=> (= (ControlFlow 0 50) 45) anon67_Else_correct)))))))
(let ((anon66_Else_correct  (=> (> 0 i_4) (and (=> (= (ControlFlow 0 44) 36) anon69_Then_correct) (=> (= (ControlFlow 0 44) 43) anon69_Else_correct)))))
(let ((anon60_Else_correct  (=> (and (forall ((i_3 Int) (j_3 Int) ) (!  (=> (and (>= i_3 0) (and (< i_3 (|Seq#Length| (MapType0Select Heap@@9 diz Ref__b))) (and (>= j_3 0) (and (< j_3 (|Seq#Length| (MapType0Select Heap@@9 diz Ref__b))) (not (= i_3 j_3)))))) (not (= (|Seq#Index| (MapType0Select Heap@@9 diz Ref__b) i_3) (|Seq#Index| (MapType0Select Heap@@9 diz Ref__b) j_3))))
 :qid |stdinbpl.2042:20|
 :skolemid |59|
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 diz Ref__b) i_3) (|Seq#Index| (MapType0Select Heap@@9 diz Ref__b) j_3))
)) (state Heap@@9 Mask@2)) (and (and (=> (= (ControlFlow 0 146) 145) anon65_Else_correct) (=> (= (ControlFlow 0 146) 50) anon66_Then_correct)) (=> (= (ControlFlow 0 146) 44) anon66_Else_correct)))))
(let ((anon15_correct true))
(let ((anon64_Else_correct  (=> (and (not (and (>= i_2 0) (and (< i_2 (|Seq#Length| (MapType0Select Heap@@9 diz Ref__b))) (and (>= j_2 0) (and (< j_2 (|Seq#Length| (MapType0Select Heap@@9 diz Ref__b))) (not (= i_2 j_2))))))) (= (ControlFlow 0 26) 18)) anon15_correct)))
(let ((anon64_Then_correct  (=> (and (>= i_2 0) (and (< i_2 (|Seq#Length| (MapType0Select Heap@@9 diz Ref__b))) (and (>= j_2 0) (and (< j_2 (|Seq#Length| (MapType0Select Heap@@9 diz Ref__b))) (not (= i_2 j_2)))))) (and (=> (= (ControlFlow 0 19) (- 0 25)) (HasDirectPerm Mask@2 diz Ref__b)) (=> (HasDirectPerm Mask@2 diz Ref__b) (and (=> (= (ControlFlow 0 19) (- 0 24)) (>= i_2 0)) (=> (>= i_2 0) (and (=> (= (ControlFlow 0 19) (- 0 23)) (< i_2 (|Seq#Length| (MapType0Select Heap@@9 diz Ref__b)))) (=> (< i_2 (|Seq#Length| (MapType0Select Heap@@9 diz Ref__b))) (and (=> (= (ControlFlow 0 19) (- 0 22)) (HasDirectPerm Mask@2 diz Ref__b)) (=> (HasDirectPerm Mask@2 diz Ref__b) (and (=> (= (ControlFlow 0 19) (- 0 21)) (>= j_2 0)) (=> (>= j_2 0) (and (=> (= (ControlFlow 0 19) (- 0 20)) (< j_2 (|Seq#Length| (MapType0Select Heap@@9 diz Ref__b)))) (=> (< j_2 (|Seq#Length| (MapType0Select Heap@@9 diz Ref__b))) (=> (= (ControlFlow 0 19) 18) anon15_correct))))))))))))))))
(let ((anon63_Else_correct  (=> (> 0 j_2) (and (=> (= (ControlFlow 0 31) 19) anon64_Then_correct) (=> (= (ControlFlow 0 31) 26) anon64_Else_correct)))))
(let ((anon63_Then_correct  (=> (>= j_2 0) (and (=> (= (ControlFlow 0 29) (- 0 30)) (HasDirectPerm Mask@2 diz Ref__b)) (=> (HasDirectPerm Mask@2 diz Ref__b) (and (=> (= (ControlFlow 0 29) 19) anon64_Then_correct) (=> (= (ControlFlow 0 29) 26) anon64_Else_correct)))))))
(let ((anon62_Then_correct  (=> (< i_2 (|Seq#Length| (MapType0Select Heap@@9 diz Ref__b))) (and (=> (= (ControlFlow 0 32) 29) anon63_Then_correct) (=> (= (ControlFlow 0 32) 31) anon63_Else_correct)))))
(let ((anon62_Else_correct  (=> (<= (|Seq#Length| (MapType0Select Heap@@9 diz Ref__b)) i_2) (and (=> (= (ControlFlow 0 28) 19) anon64_Then_correct) (=> (= (ControlFlow 0 28) 26) anon64_Else_correct)))))
(let ((anon61_Then_correct  (=> (>= i_2 0) (and (=> (= (ControlFlow 0 33) (- 0 34)) (HasDirectPerm Mask@2 diz Ref__b)) (=> (HasDirectPerm Mask@2 diz Ref__b) (and (=> (= (ControlFlow 0 33) 32) anon62_Then_correct) (=> (= (ControlFlow 0 33) 28) anon62_Else_correct)))))))
(let ((anon61_Else_correct  (=> (> 0 i_2) (and (=> (= (ControlFlow 0 27) 19) anon64_Then_correct) (=> (= (ControlFlow 0 27) 26) anon64_Else_correct)))))
(let ((anon55_Else_correct  (=> (and (forall ((i_1 Int) (j_1 Int) ) (!  (=> (and (>= i_1 0) (and (< i_1 (|Seq#Length| (MapType0Select Heap@@9 diz Ref__a))) (and (>= j_1 0) (and (< j_1 (|Seq#Length| (MapType0Select Heap@@9 diz Ref__a))) (not (= i_1 j_1)))))) (not (= (|Seq#Index| (MapType0Select Heap@@9 diz Ref__a) i_1) (|Seq#Index| (MapType0Select Heap@@9 diz Ref__a) j_1))))
 :qid |stdinbpl.2008:20|
 :skolemid |58|
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 diz Ref__a) i_1) (|Seq#Index| (MapType0Select Heap@@9 diz Ref__a) j_1))
)) (state Heap@@9 Mask@2)) (and (and (=> (= (ControlFlow 0 147) 146) anon60_Else_correct) (=> (= (ControlFlow 0 147) 33) anon61_Then_correct)) (=> (= (ControlFlow 0 147) 27) anon61_Else_correct)))))
(let ((anon7_correct true))
(let ((anon59_Else_correct  (=> (and (not (and (>= i@@6 0) (and (< i@@6 (|Seq#Length| (MapType0Select Heap@@9 diz Ref__a))) (and (>= j@@5 0) (and (< j@@5 (|Seq#Length| (MapType0Select Heap@@9 diz Ref__a))) (not (= i@@6 j@@5))))))) (= (ControlFlow 0 9) 1)) anon7_correct)))
(let ((anon59_Then_correct  (=> (and (>= i@@6 0) (and (< i@@6 (|Seq#Length| (MapType0Select Heap@@9 diz Ref__a))) (and (>= j@@5 0) (and (< j@@5 (|Seq#Length| (MapType0Select Heap@@9 diz Ref__a))) (not (= i@@6 j@@5)))))) (and (=> (= (ControlFlow 0 2) (- 0 8)) (HasDirectPerm Mask@2 diz Ref__a)) (=> (HasDirectPerm Mask@2 diz Ref__a) (and (=> (= (ControlFlow 0 2) (- 0 7)) (>= i@@6 0)) (=> (>= i@@6 0) (and (=> (= (ControlFlow 0 2) (- 0 6)) (< i@@6 (|Seq#Length| (MapType0Select Heap@@9 diz Ref__a)))) (=> (< i@@6 (|Seq#Length| (MapType0Select Heap@@9 diz Ref__a))) (and (=> (= (ControlFlow 0 2) (- 0 5)) (HasDirectPerm Mask@2 diz Ref__a)) (=> (HasDirectPerm Mask@2 diz Ref__a) (and (=> (= (ControlFlow 0 2) (- 0 4)) (>= j@@5 0)) (=> (>= j@@5 0) (and (=> (= (ControlFlow 0 2) (- 0 3)) (< j@@5 (|Seq#Length| (MapType0Select Heap@@9 diz Ref__a)))) (=> (< j@@5 (|Seq#Length| (MapType0Select Heap@@9 diz Ref__a))) (=> (= (ControlFlow 0 2) 1) anon7_correct))))))))))))))))
(let ((anon58_Else_correct  (=> (> 0 j@@5) (and (=> (= (ControlFlow 0 14) 2) anon59_Then_correct) (=> (= (ControlFlow 0 14) 9) anon59_Else_correct)))))
(let ((anon58_Then_correct  (=> (>= j@@5 0) (and (=> (= (ControlFlow 0 12) (- 0 13)) (HasDirectPerm Mask@2 diz Ref__a)) (=> (HasDirectPerm Mask@2 diz Ref__a) (and (=> (= (ControlFlow 0 12) 2) anon59_Then_correct) (=> (= (ControlFlow 0 12) 9) anon59_Else_correct)))))))
(let ((anon57_Then_correct  (=> (< i@@6 (|Seq#Length| (MapType0Select Heap@@9 diz Ref__a))) (and (=> (= (ControlFlow 0 15) 12) anon58_Then_correct) (=> (= (ControlFlow 0 15) 14) anon58_Else_correct)))))
(let ((anon57_Else_correct  (=> (<= (|Seq#Length| (MapType0Select Heap@@9 diz Ref__a)) i@@6) (and (=> (= (ControlFlow 0 11) 2) anon59_Then_correct) (=> (= (ControlFlow 0 11) 9) anon59_Else_correct)))))
(let ((anon56_Then_correct  (=> (>= i@@6 0) (and (=> (= (ControlFlow 0 16) (- 0 17)) (HasDirectPerm Mask@2 diz Ref__a)) (=> (HasDirectPerm Mask@2 diz Ref__a) (and (=> (= (ControlFlow 0 16) 15) anon57_Then_correct) (=> (= (ControlFlow 0 16) 11) anon57_Else_correct)))))))
(let ((anon56_Else_correct  (=> (> 0 i@@6) (and (=> (= (ControlFlow 0 10) 2) anon59_Then_correct) (=> (= (ControlFlow 0 10) 9) anon59_Else_correct)))))
(let ((anon0_correct  (=> (state Heap@@9 ZeroMask) (=> (and (U_2_bool (MapType0Select Heap@@9 diz $allocated)) (not (= diz null))) (=> (and (and (state Heap@@9 ZeroMask) (>= current_thread_id 0)) (and (state Heap@@9 ZeroMask) (= tcount gsize))) (=> (and (and (and (state Heap@@9 ZeroMask) (= gid 0)) (and (state Heap@@9 ZeroMask) (> wildcard@0 NoPerm))) (and (and (not (= diz null)) (= Mask@0 (MapType1Store ZeroMask diz Ref__a (real_2_U (+ (U_2_real (MapType1Select ZeroMask diz Ref__a)) wildcard@0))))) (and (state Heap@@9 Mask@0) (state Heap@@9 Mask@0)))) (and (=> (= (ControlFlow 0 148) (- 0 151)) (HasDirectPerm Mask@0 diz Ref__a)) (=> (HasDirectPerm Mask@0 diz Ref__a) (=> (= (|Seq#Length| (MapType0Select Heap@@9 diz Ref__a)) tcount) (=> (and (state Heap@@9 Mask@0) (> wildcard@1 NoPerm)) (=> (and (and (not (= diz null)) (= Mask@1 (MapType1Store Mask@0 diz Ref__b (real_2_U (+ (U_2_real (MapType1Select Mask@0 diz Ref__b)) wildcard@1))))) (and (state Heap@@9 Mask@1) (state Heap@@9 Mask@1))) (and (=> (= (ControlFlow 0 148) (- 0 150)) (HasDirectPerm Mask@1 diz Ref__b)) (=> (HasDirectPerm Mask@1 diz Ref__b) (=> (= (|Seq#Length| (MapType0Select Heap@@9 diz Ref__b)) tcount) (=> (and (state Heap@@9 Mask@1) (> wildcard@2 NoPerm)) (=> (and (and (not (= diz null)) (= Mask@2 (MapType1Store Mask@1 diz Ref__c (real_2_U (+ (U_2_real (MapType1Select Mask@1 diz Ref__c)) wildcard@2))))) (and (state Heap@@9 Mask@2) (state Heap@@9 Mask@2))) (and (=> (= (ControlFlow 0 148) (- 0 149)) (HasDirectPerm Mask@2 diz Ref__c)) (=> (HasDirectPerm Mask@2 diz Ref__c) (=> (and (= (|Seq#Length| (MapType0Select Heap@@9 diz Ref__c)) tcount) (state Heap@@9 Mask@2)) (and (and (=> (= (ControlFlow 0 148) 147) anon55_Else_correct) (=> (= (ControlFlow 0 148) 16) anon56_Then_correct)) (=> (= (ControlFlow 0 148) 10) anon56_Else_correct)))))))))))))))))))))
(let ((PreconditionGeneratedEntry_correct  (=> (and (and (> wildcard NoPerm) true) (= (ControlFlow 0 152) 148)) anon0_correct)))
PreconditionGeneratedEntry_correct)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
))
(check-sat)
(pop 1)
; Valid
(get-info :rlimit)
