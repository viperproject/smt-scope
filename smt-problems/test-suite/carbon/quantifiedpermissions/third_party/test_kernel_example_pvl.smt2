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
 :qid |stdinbpl.319:18|
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
 :qid |stdinbpl.340:18|
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
 :qid |stdinbpl.295:18|
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
 :qid |stdinbpl.306:18|
 :skolemid |36|
 :pattern ( (|Seq#Length| (|Seq#Take| s@@2 n@@2)))
 :pattern ( (|Seq#Take| s@@2 n@@2) (|Seq#Length| s@@2))
)))
(assert (forall ((arg0@@31 Int) (arg1@@13 Int) ) (! (= (type (|Seq#Range| arg0@@31 arg1@@13)) (SeqType intType))
 :qid |funType:Seq#Range|
 :pattern ( (|Seq#Range| arg0@@31 arg1@@13))
)))
(assert (forall ((q@min Int) (q@max Int) (v@@0 T@U) ) (!  (=> (= (type v@@0) intType) (= (|Seq#Contains| (|Seq#Range| q@min q@max) v@@0)  (and (<= q@min (U_2_int v@@0)) (< (U_2_int v@@0) q@max))))
 :qid |stdinbpl.579:15|
 :skolemid |57|
 :pattern ( (|Seq#Contains| (|Seq#Range| q@min q@max) v@@0))
)))
(assert (forall ((s@@3 T@U) (x@@8 T@U) ) (! (let ((T@@7 (type x@@8)))
 (=> (and (= (type s@@3) (SeqType T@@7)) (|Seq#Contains| s@@3 x@@8)) (and (and (<= 0 (|Seq#Skolem| s@@3 x@@8)) (< (|Seq#Skolem| s@@3 x@@8) (|Seq#Length| s@@3))) (= (|Seq#Index| s@@3 (|Seq#Skolem| s@@3 x@@8)) x@@8))))
 :qid |stdinbpl.437:18|
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
 :qid |stdinbpl.421:18|
 :skolemid |45|
 :pattern ( (|Seq#Drop| s@@4 n@@3))
)))
(assert (forall ((i@@0 Int) (j@@0 Int) ) (! (= (|Seq#Sub| i@@0 j@@0) (- i@@0 j@@0))
 :qid |stdinbpl.275:15|
 :skolemid |30|
 :pattern ( (|Seq#Sub| i@@0 j@@0))
)))
(assert (forall ((i@@1 Int) (j@@1 Int) ) (! (= (|Seq#Add| i@@1 j@@1) (+ i@@1 j@@1))
 :qid |stdinbpl.273:15|
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
 :qid |stdinbpl.562:18|
 :skolemid |54|
 :pattern ( (|Seq#Contains| (|Seq#Singleton| x@@9) y@@1))
)))
(assert (forall ((s@@5 T@U) (n@@4 Int) (j@@2 Int) ) (! (let ((T@@11 (SeqTypeInv0 (type s@@5))))
 (=> (= (type s@@5) (SeqType T@@11)) (=> (and (and (<= 0 j@@2) (< j@@2 n@@4)) (< j@@2 (|Seq#Length| s@@5))) (= (|Seq#Index| (|Seq#Take| s@@5 n@@4) j@@2) (|Seq#Index| s@@5 j@@2)))))
 :qid |stdinbpl.314:18|
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
 :qid |stdinbpl.218:19|
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
 :qid |stdinbpl.286:18|
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
 :qid |stdinbpl.206:15|
 :skolemid |19|
 :pattern ( (ConditionalFrame p@@0 f_6))
)))
(assert (forall ((q@min@@0 Int) (q@max@@0 Int) (j@@3 Int) ) (!  (=> (and (<= 0 j@@3) (< j@@3 (- q@max@@0 q@min@@0))) (= (U_2_int (|Seq#Index| (|Seq#Range| q@min@@0 q@max@@0) j@@3)) (+ q@min@@0 j@@3)))
 :qid |stdinbpl.577:15|
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
 :qid |stdinbpl.255:18|
 :skolemid |26|
 :pattern ( (|Seq#Length| (|Seq#Append| s0@@0 s1@@0)))
)))
(assert (forall ((s@@6 T@U) (t T@U) (n@@6 Int) ) (! (let ((T@@17 (SeqTypeInv0 (type s@@6))))
 (=> (and (and (= (type s@@6) (SeqType T@@17)) (= (type t) (SeqType T@@17))) (and (> n@@6 0) (> n@@6 (|Seq#Length| s@@6)))) (and (= (|Seq#Add| (|Seq#Sub| n@@6 (|Seq#Length| s@@6)) (|Seq#Length| s@@6)) n@@6) (= (|Seq#Drop| (|Seq#Append| s@@6 t) n@@6) (|Seq#Drop| t (|Seq#Sub| n@@6 (|Seq#Length| s@@6)))))))
 :qid |stdinbpl.411:18|
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
 :qid |stdinbpl.398:18|
 :skolemid |42|
 :pattern ( (|Seq#Take| (|Seq#Append| s@@7 t@@0) n@@7))
)))
(assert (forall ((q@min@@1 Int) (q@max@@1 Int) ) (!  (and (=> (< q@min@@1 q@max@@1) (= (|Seq#Length| (|Seq#Range| q@min@@1 q@max@@1)) (- q@max@@1 q@min@@1))) (=> (<= q@max@@1 q@min@@1) (= (|Seq#Length| (|Seq#Range| q@min@@1 q@max@@1)) 0)))
 :qid |stdinbpl.576:15|
 :skolemid |55|
 :pattern ( (|Seq#Length| (|Seq#Range| q@min@@1 q@max@@1)))
)))
(assert (forall ((a T@U) (b T@U) ) (! (let ((T@@19 (SeqTypeInv0 (type a))))
 (=> (and (and (= (type a) (SeqType T@@19)) (= (type b) (SeqType T@@19))) (|Seq#Equal| a b)) (= a b)))
 :qid |stdinbpl.549:18|
 :skolemid |53|
 :pattern ( (|Seq#Equal| a b))
)))
(assert (forall ((s@@8 T@U) (i@@2 Int) ) (! (let ((T@@20 (SeqTypeInv0 (type s@@8))))
 (=> (= (type s@@8) (SeqType T@@20)) (=> (and (<= 0 i@@2) (< i@@2 (|Seq#Length| s@@8))) (|Seq#ContainsTrigger| s@@8 (|Seq#Index| s@@8 i@@2)))))
 :qid |stdinbpl.442:18|
 :skolemid |49|
 :pattern ( (|Seq#Index| s@@8 i@@2))
)))
(assert (forall ((s0@@1 T@U) (s1@@1 T@U) ) (! (let ((T@@21 (SeqTypeInv0 (type s0@@1))))
 (=> (and (= (type s0@@1) (SeqType T@@21)) (= (type s1@@1) (SeqType T@@21))) (and (=> (= s0@@1 (|Seq#Empty| T@@21)) (= (|Seq#Append| s0@@1 s1@@1) s1@@1)) (=> (= s1@@1 (|Seq#Empty| T@@21)) (= (|Seq#Append| s0@@1 s1@@1) s0@@1)))))
 :qid |stdinbpl.261:18|
 :skolemid |27|
 :pattern ( (|Seq#Append| s0@@1 s1@@1))
)))
(assert (forall ((t@@1 T@U) ) (! (= (|Seq#Index| (|Seq#Singleton| t@@1) 0) t@@1)
 :qid |stdinbpl.265:18|
 :skolemid |28|
 :pattern ( (|Seq#Singleton| t@@1))
)))
(assert (forall ((s@@9 T@U) ) (! (let ((T@@22 (SeqTypeInv0 (type s@@9))))
 (=> (= (type s@@9) (SeqType T@@22)) (<= 0 (|Seq#Length| s@@9))))
 :qid |stdinbpl.244:18|
 :skolemid |22|
 :pattern ( (|Seq#Length| s@@9))
)))
(assert (forall ((s0@@2 T@U) (s1@@2 T@U) ) (! (let ((T@@23 (SeqTypeInv0 (type s0@@2))))
 (=> (and (and (= (type s0@@2) (SeqType T@@23)) (= (type s1@@2) (SeqType T@@23))) (|Seq#Equal| s0@@2 s1@@2)) (and (= (|Seq#Length| s0@@2) (|Seq#Length| s1@@2)) (forall ((j@@4 Int) ) (!  (=> (and (<= 0 j@@4) (< j@@4 (|Seq#Length| s0@@2))) (= (|Seq#Index| s0@@2 j@@4) (|Seq#Index| s1@@2 j@@4)))
 :qid |stdinbpl.539:13|
 :skolemid |50|
 :pattern ( (|Seq#Index| s0@@2 j@@4))
 :pattern ( (|Seq#Index| s1@@2 j@@4))
)))))
 :qid |stdinbpl.536:18|
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
 :qid |stdinbpl.252:18|
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
 :qid |stdinbpl.394:18|
 :skolemid |41|
 :pattern ( (|Seq#Take| (|Seq#Append| s@@10 t@@3) n@@8))
)))
(assert (forall ((s@@11 T@U) (i@@3 Int) (v@@1 T@U) ) (! (let ((T@@25 (type v@@1)))
 (=> (= (type s@@11) (SeqType T@@25)) (=> (and (<= 0 i@@3) (< i@@3 (|Seq#Length| s@@11))) (= (|Seq#Length| (|Seq#Update| s@@11 i@@3 v@@1)) (|Seq#Length| s@@11)))))
 :qid |stdinbpl.293:18|
 :skolemid |34|
 :pattern ( (|Seq#Length| (|Seq#Update| s@@11 i@@3 v@@1)))
 :pattern ( (|Seq#Length| s@@11) (|Seq#Update| s@@11 i@@3 v@@1))
)))
(assert (forall ((s@@12 T@U) (t@@4 T@U) (n@@9 Int) ) (! (let ((T@@26 (SeqTypeInv0 (type s@@12))))
 (=> (and (and (= (type s@@12) (SeqType T@@26)) (= (type t@@4) (SeqType T@@26))) (and (< 0 n@@9) (<= n@@9 (|Seq#Length| s@@12)))) (= (|Seq#Drop| (|Seq#Append| s@@12 t@@4) n@@9) (|Seq#Append| (|Seq#Drop| s@@12 n@@9) t@@4))))
 :qid |stdinbpl.407:18|
 :skolemid |43|
 :pattern ( (|Seq#Drop| (|Seq#Append| s@@12 t@@4) n@@9))
)))
(assert (forall ((s@@13 T@U) (n@@10 Int) (i@@4 Int) ) (! (let ((T@@27 (SeqTypeInv0 (type s@@13))))
 (=> (= (type s@@13) (SeqType T@@27)) (=> (and (and (< 0 n@@10) (<= n@@10 i@@4)) (< i@@4 (|Seq#Length| s@@13))) (and (= (|Seq#Add| (|Seq#Sub| i@@4 n@@10) n@@10) i@@4) (= (|Seq#Index| (|Seq#Drop| s@@13 n@@10) (|Seq#Sub| i@@4 n@@10)) (|Seq#Index| s@@13 i@@4))))))
 :qid |stdinbpl.344:18|
 :skolemid |40|
 :pattern ( (|Seq#Drop| s@@13 n@@10) (|Seq#Index| s@@13 i@@4))
)))
(assert (forall ((s0@@3 T@U) (s1@@3 T@U) (n@@11 Int) ) (! (let ((T@@28 (SeqTypeInv0 (type s0@@3))))
 (=> (and (= (type s0@@3) (SeqType T@@28)) (= (type s1@@3) (SeqType T@@28))) (=> (and (and (and (not (= s0@@3 (|Seq#Empty| T@@28))) (not (= s1@@3 (|Seq#Empty| T@@28)))) (<= 0 n@@11)) (< n@@11 (|Seq#Length| s0@@3))) (= (|Seq#Index| (|Seq#Append| s0@@3 s1@@3) n@@11) (|Seq#Index| s0@@3 n@@11)))))
 :qid |stdinbpl.284:18|
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
 :qid |stdinbpl.289:18|
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
 :qid |stdinbpl.440:18|
 :skolemid |48|
 :pattern ( (|Seq#Contains| s@@14 x@@10) (|Seq#Index| s@@14 i@@5))
)))
(assert (forall ((s0@@5 T@U) (s1@@5 T@U) ) (! (let ((T@@31 (SeqTypeInv0 (type s0@@5))))
 (=> (and (= (type s0@@5) (SeqType T@@31)) (= (type s1@@5) (SeqType T@@31))) (or (or (and (= s0@@5 s1@@5) (|Seq#Equal| s0@@5 s1@@5)) (and (and (not (= s0@@5 s1@@5)) (not (|Seq#Equal| s0@@5 s1@@5))) (not (= (|Seq#Length| s0@@5) (|Seq#Length| s1@@5))))) (and (and (and (and (and (and (not (= s0@@5 s1@@5)) (not (|Seq#Equal| s0@@5 s1@@5))) (= (|Seq#Length| s0@@5) (|Seq#Length| s1@@5))) (= (|Seq#SkolemDiff| s0@@5 s1@@5) (|Seq#SkolemDiff| s1@@5 s0@@5))) (<= 0 (|Seq#SkolemDiff| s0@@5 s1@@5))) (< (|Seq#SkolemDiff| s0@@5 s1@@5) (|Seq#Length| s0@@5))) (not (= (|Seq#Index| s0@@5 (|Seq#SkolemDiff| s0@@5 s1@@5)) (|Seq#Index| s1@@5 (|Seq#SkolemDiff| s0@@5 s1@@5))))))))
 :qid |stdinbpl.544:18|
 :skolemid |52|
 :pattern ( (|Seq#Equal| s0@@5 s1@@5))
)))
(assert (forall ((p@@1 T@U) (v_1@@0 T@U) (q T@U) (w@@0 T@U) (r T@U) (u T@U) ) (! (let ((C@@3 (FieldTypeInv0 (type r))))
(let ((B@@10 (FieldTypeInv0 (type q))))
(let ((A@@11 (FieldTypeInv0 (type p@@1))))
 (=> (and (and (and (and (and (and (= (type p@@1) (FieldType A@@11 FrameTypeType)) (= (type v_1@@0) FrameTypeType)) (= (type q) (FieldType B@@10 FrameTypeType))) (= (type w@@0) FrameTypeType)) (= (type r) (FieldType C@@3 FrameTypeType))) (= (type u) FrameTypeType)) (and (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))) (InsidePredicate p@@1 v_1@@0 r u)))))
 :qid |stdinbpl.213:25|
 :skolemid |20|
 :pattern ( (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))
)))
(assert (forall ((s@@15 T@U) ) (! (let ((T@@32 (SeqTypeInv0 (type s@@15))))
 (=> (and (= (type s@@15) (SeqType T@@32)) (= (|Seq#Length| s@@15) 0)) (= s@@15 (|Seq#Empty| T@@32))))
 :qid |stdinbpl.248:18|
 :skolemid |24|
 :pattern ( (|Seq#Length| s@@15))
)))
(assert (forall ((s@@16 T@U) (n@@12 Int) ) (! (let ((T@@33 (SeqTypeInv0 (type s@@16))))
 (=> (and (= (type s@@16) (SeqType T@@33)) (<= n@@12 0)) (= (|Seq#Take| s@@16 n@@12) (|Seq#Empty| T@@33))))
 :qid |stdinbpl.423:18|
 :skolemid |46|
 :pattern ( (|Seq#Take| s@@16 n@@12))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun Heap@3 () T@U)
(declare-fun Mask@27 () T@U)
(declare-fun tid () Int)
(declare-fun tcount () Int)
(declare-fun lid () Int)
(declare-fun gsize () Int)
(declare-fun gid () Int)
(declare-fun diz () T@U)
(declare-fun wildcard@12 () Real)
(declare-fun Mask@28 () T@U)
(declare-fun wildcard@13 () Real)
(declare-fun Mask@29 () T@U)
(declare-fun wildcard@14 () Real)
(declare-fun Mask@30 () T@U)
(declare-fun Heap@@9 () T@U)
(declare-fun ExhaleHeap@0 () T@U)
(declare-fun __flatten_10@0 () T@U)
(declare-fun __flatten_12@0 () T@U)
(declare-fun __flatten_11@0 () Int)
(declare-fun Heap@2 () T@U)
(declare-fun __flatten_6@0 () T@U)
(declare-fun __flatten_8@0 () T@U)
(declare-fun __flatten_9@0 () T@U)
(declare-fun __flatten_7@0 () Int)
(declare-fun Heap@1 () T@U)
(declare-fun __flatten_1@0 () Int)
(declare-fun Mask@23 () T@U)
(declare-fun Mask@24 () T@U)
(declare-fun Mask@25 () T@U)
(declare-fun perm@6 () Real)
(declare-fun Mask@26 () T@U)
(declare-fun Mask@21 () T@U)
(declare-fun perm@5 () Real)
(declare-fun Mask@22 () T@U)
(declare-fun Mask@20 () T@U)
(declare-fun Mask@19 () T@U)
(declare-fun perm@4 () Real)
(declare-fun Heap@0 () T@U)
(declare-fun Mask@16 () T@U)
(declare-fun wildcard@9 () Real)
(declare-fun Mask@17 () T@U)
(declare-fun wildcard@10 () Real)
(declare-fun Mask@18 () T@U)
(declare-fun wildcard@11 () Real)
(declare-fun Mask@15 () T@U)
(declare-fun Mask@14 () T@U)
(declare-fun perm@3 () Real)
(declare-fun Mask@13 () T@U)
(declare-fun Mask@12 () T@U)
(declare-fun Mask@11 () T@U)
(declare-fun Mask@10 () T@U)
(declare-fun perm@2 () Real)
(declare-fun Mask@9 () T@U)
(declare-fun perm@1 () Real)
(declare-fun Mask@8 () T@U)
(declare-fun __flatten_2 () T@U)
(declare-fun __flatten_4 () T@U)
(declare-fun __flatten_6 () T@U)
(declare-fun __flatten_8 () T@U)
(declare-fun __flatten_9 () T@U)
(declare-fun __flatten_10 () T@U)
(declare-fun __flatten_12 () T@U)
(declare-fun Mask@5 () T@U)
(declare-fun __flatten_2@0 () T@U)
(declare-fun __flatten_4@0 () T@U)
(declare-fun __flatten_3@0 () Int)
(declare-fun current_thread_id () Int)
(declare-fun wildcard@6 () Real)
(declare-fun Mask@6 () T@U)
(declare-fun wildcard@7 () Real)
(declare-fun Mask@7 () T@U)
(declare-fun wildcard@8 () Real)
(declare-fun PostHeap@0 () T@U)
(declare-fun wildcard@3 () Real)
(declare-fun PostMask@0 () T@U)
(declare-fun wildcard@4 () Real)
(declare-fun PostMask@1 () T@U)
(declare-fun wildcard@5 () Real)
(declare-fun PostMask@2 () T@U)
(declare-fun wildcard@0 () Real)
(declare-fun Mask@0 () T@U)
(declare-fun wildcard@1 () Real)
(declare-fun Mask@1 () T@U)
(declare-fun wildcard@2 () Real)
(declare-fun Mask@2 () T@U)
(declare-fun Mask@3 () T@U)
(declare-fun Mask@4 () T@U)
(declare-fun perm@0 () Real)
(declare-fun wildcard () Real)
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (= (type PostHeap@0) (MapType0Type RefType)) (= (type diz) RefType)) (= (type PostMask@0) (MapType1Type RefType realType))) (= (type PostMask@1) (MapType1Type RefType realType))) (= (type PostMask@2) (MapType1Type RefType realType))) (= (type Mask@5) (MapType1Type RefType realType))) (= (type Heap@@9) (MapType0Type RefType))) (= (type Heap@3) (MapType0Type RefType))) (= (type Mask@27) (MapType1Type RefType realType))) (= (type Mask@28) (MapType1Type RefType realType))) (= (type Mask@29) (MapType1Type RefType realType))) (= (type Mask@30) (MapType1Type RefType realType))) (= (type ExhaleHeap@0) (MapType0Type RefType))) (= (type __flatten_6@0) RefType)) (= (type __flatten_8@0) RefType)) (= (type __flatten_9@0) RefType)) (= (type Heap@1) (MapType0Type RefType))) (= (type __flatten_10@0) RefType)) (= (type __flatten_12@0) RefType)) (= (type Heap@2) (MapType0Type RefType))) (= (type Mask@24) (MapType1Type RefType realType))) (= (type Mask@23) (MapType1Type RefType realType))) (= (type Mask@25) (MapType1Type RefType realType))) (= (type Mask@26) (MapType1Type RefType realType))) (= (type Mask@19) (MapType1Type RefType realType))) (= (type Mask@22) (MapType1Type RefType realType))) (= (type Mask@21) (MapType1Type RefType realType))) (= (type Mask@20) (MapType1Type RefType realType))) (= (type Heap@0) (MapType0Type RefType))) (= (type Mask@16) (MapType1Type RefType realType))) (= (type Mask@17) (MapType1Type RefType realType))) (= (type Mask@18) (MapType1Type RefType realType))) (= (type Mask@12) (MapType1Type RefType realType))) (= (type Mask@15) (MapType1Type RefType realType))) (= (type Mask@14) (MapType1Type RefType realType))) (= (type Mask@13) (MapType1Type RefType realType))) (= (type Mask@8) (MapType1Type RefType realType))) (= (type Mask@10) (MapType1Type RefType realType))) (= (type Mask@11) (MapType1Type RefType realType))) (= (type Mask@9) (MapType1Type RefType realType))) (= (type __flatten_2) RefType)) (= (type __flatten_4) RefType)) (= (type __flatten_6) RefType)) (= (type __flatten_8) RefType)) (= (type __flatten_9) RefType)) (= (type __flatten_10) RefType)) (= (type __flatten_12) RefType)) (= (type __flatten_2@0) RefType)) (= (type __flatten_4@0) RefType)) (= (type Mask@6) (MapType1Type RefType realType))) (= (type Mask@7) (MapType1Type RefType realType))) (= (type Mask@0) (MapType1Type RefType realType))) (= (type Mask@1) (MapType1Type RefType realType))) (= (type Mask@2) (MapType1Type RefType realType))) (= (type Mask@3) (MapType1Type RefType realType))) (= (type Mask@4) (MapType1Type RefType realType))))
(set-info :boogie-vc-id Ref__main_main)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 129) (let ((anon27_correct  (=> (state Heap@3 Mask@27) (and (=> (= (ControlFlow 0 12) (- 0 25)) (<= 0 tid)) (=> (<= 0 tid) (and (=> (= (ControlFlow 0 12) (- 0 24)) (< tid tcount)) (=> (< tid tcount) (and (=> (= (ControlFlow 0 12) (- 0 23)) (= tid lid)) (=> (= tid lid) (and (=> (= (ControlFlow 0 12) (- 0 22)) (= tcount gsize)) (=> (= tcount gsize) (and (=> (= (ControlFlow 0 12) (- 0 21)) (= gid 0)) (=> (= gid 0) (and (=> (= (ControlFlow 0 12) (- 0 20)) (> (U_2_real (MapType1Select Mask@27 diz Ref__a)) NoPerm)) (=> (> (U_2_real (MapType1Select Mask@27 diz Ref__a)) NoPerm) (=> (> wildcard@12 NoPerm) (=> (and (< wildcard@12 (U_2_real (MapType1Select Mask@27 diz Ref__a))) (= Mask@28 (MapType1Store Mask@27 diz Ref__a (real_2_U (- (U_2_real (MapType1Select Mask@27 diz Ref__a)) wildcard@12))))) (and (=> (= (ControlFlow 0 12) (- 0 19)) (= (|Seq#Length| (MapType0Select Heap@3 diz Ref__a)) tcount)) (=> (= (|Seq#Length| (MapType0Select Heap@3 diz Ref__a)) tcount) (and (=> (= (ControlFlow 0 12) (- 0 18)) (> (U_2_real (MapType1Select Mask@28 diz Ref__b)) NoPerm)) (=> (> (U_2_real (MapType1Select Mask@28 diz Ref__b)) NoPerm) (=> (> wildcard@13 NoPerm) (=> (and (< wildcard@13 (U_2_real (MapType1Select Mask@28 diz Ref__b))) (= Mask@29 (MapType1Store Mask@28 diz Ref__b (real_2_U (- (U_2_real (MapType1Select Mask@28 diz Ref__b)) wildcard@13))))) (and (=> (= (ControlFlow 0 12) (- 0 17)) (= (|Seq#Length| (MapType0Select Heap@3 diz Ref__b)) tcount)) (=> (= (|Seq#Length| (MapType0Select Heap@3 diz Ref__b)) tcount) (and (=> (= (ControlFlow 0 12) (- 0 16)) (> (U_2_real (MapType1Select Mask@29 diz Ref__c)) NoPerm)) (=> (> (U_2_real (MapType1Select Mask@29 diz Ref__c)) NoPerm) (=> (> wildcard@14 NoPerm) (=> (and (< wildcard@14 (U_2_real (MapType1Select Mask@29 diz Ref__c))) (= Mask@30 (MapType1Store Mask@29 diz Ref__c (real_2_U (- (U_2_real (MapType1Select Mask@29 diz Ref__c)) wildcard@14))))) (and (=> (= (ControlFlow 0 12) (- 0 15)) (= (|Seq#Length| (MapType0Select Heap@3 diz Ref__c)) tcount)) (=> (= (|Seq#Length| (MapType0Select Heap@3 diz Ref__c)) tcount) (and (=> (= (ControlFlow 0 12) (- 0 14)) (|Seq#Equal| (MapType0Select Heap@3 diz Ref__a) (MapType0Select Heap@@9 diz Ref__a))) (=> (|Seq#Equal| (MapType0Select Heap@3 diz Ref__a) (MapType0Select Heap@@9 diz Ref__a)) (and (=> (= (ControlFlow 0 12) (- 0 13)) (|Seq#Equal| (MapType0Select Heap@3 diz Ref__b) (MapType0Select Heap@@9 diz Ref__b))) (=> (|Seq#Equal| (MapType0Select Heap@3 diz Ref__b) (MapType0Select Heap@@9 diz Ref__b)) (=> (= (ControlFlow 0 12) (- 0 11)) (|Seq#Equal| (MapType0Select Heap@3 diz Ref__c) (MapType0Select Heap@@9 diz Ref__c))))))))))))))))))))))))))))))))))))))
(let ((anon41_Else_correct  (=> (>= 0 tid) (and (=> (= (ControlFlow 0 39) (- 0 47)) (HasDirectPerm Mask@27 diz Ref__a)) (=> (HasDirectPerm Mask@27 diz Ref__a) (and (=> (= (ControlFlow 0 39) (- 0 46)) (>= tid 0)) (=> (>= tid 0) (and (=> (= (ControlFlow 0 39) (- 0 45)) (< tid (|Seq#Length| (MapType0Select ExhaleHeap@0 diz Ref__a)))) (=> (< tid (|Seq#Length| (MapType0Select ExhaleHeap@0 diz Ref__a))) (=> (and (= __flatten_10@0 (|Seq#Index| (MapType0Select ExhaleHeap@0 diz Ref__a) tid)) (state ExhaleHeap@0 Mask@27)) (and (=> (= (ControlFlow 0 39) (- 0 44)) (HasDirectPerm Mask@27 diz Ref__b)) (=> (HasDirectPerm Mask@27 diz Ref__b) (and (=> (= (ControlFlow 0 39) (- 0 43)) (>= tid 0)) (=> (>= tid 0) (and (=> (= (ControlFlow 0 39) (- 0 42)) (< tid (|Seq#Length| (MapType0Select ExhaleHeap@0 diz Ref__b)))) (=> (< tid (|Seq#Length| (MapType0Select ExhaleHeap@0 diz Ref__b))) (=> (and (= __flatten_12@0 (|Seq#Index| (MapType0Select ExhaleHeap@0 diz Ref__b) tid)) (state ExhaleHeap@0 Mask@27)) (and (=> (= (ControlFlow 0 39) (- 0 41)) (HasDirectPerm Mask@27 __flatten_12@0 Ref__Integer_value)) (=> (HasDirectPerm Mask@27 __flatten_12@0 Ref__Integer_value) (=> (and (= __flatten_11@0 (U_2_int (MapType0Select ExhaleHeap@0 __flatten_12@0 Ref__Integer_value))) (state ExhaleHeap@0 Mask@27)) (and (=> (= (ControlFlow 0 39) (- 0 40)) (= FullPerm (U_2_real (MapType1Select Mask@27 __flatten_10@0 Ref__Integer_value)))) (=> (= FullPerm (U_2_real (MapType1Select Mask@27 __flatten_10@0 Ref__Integer_value))) (=> (and (and (= Heap@2 (MapType0Store ExhaleHeap@0 __flatten_10@0 Ref__Integer_value (int_2_U __flatten_11@0))) (state Heap@2 Mask@27)) (and (= Heap@3 Heap@2) (= (ControlFlow 0 39) 12))) anon27_correct)))))))))))))))))))))))
(let ((anon41_Then_correct  (=> (> tid 0) (and (=> (= (ControlFlow 0 26) (- 0 38)) (HasDirectPerm Mask@27 diz Ref__a)) (=> (HasDirectPerm Mask@27 diz Ref__a) (and (=> (= (ControlFlow 0 26) (- 0 37)) (>= tid 0)) (=> (>= tid 0) (and (=> (= (ControlFlow 0 26) (- 0 36)) (< tid (|Seq#Length| (MapType0Select ExhaleHeap@0 diz Ref__a)))) (=> (< tid (|Seq#Length| (MapType0Select ExhaleHeap@0 diz Ref__a))) (=> (and (= __flatten_6@0 (|Seq#Index| (MapType0Select ExhaleHeap@0 diz Ref__a) tid)) (state ExhaleHeap@0 Mask@27)) (and (=> (= (ControlFlow 0 26) (- 0 35)) (HasDirectPerm Mask@27 diz Ref__b)) (=> (HasDirectPerm Mask@27 diz Ref__b) (and (=> (= (ControlFlow 0 26) (- 0 34)) (>= (- tid 1) 0)) (=> (>= (- tid 1) 0) (and (=> (= (ControlFlow 0 26) (- 0 33)) (< (- tid 1) (|Seq#Length| (MapType0Select ExhaleHeap@0 diz Ref__b)))) (=> (< (- tid 1) (|Seq#Length| (MapType0Select ExhaleHeap@0 diz Ref__b))) (=> (and (= __flatten_8@0 (|Seq#Index| (MapType0Select ExhaleHeap@0 diz Ref__b) (- tid 1))) (state ExhaleHeap@0 Mask@27)) (and (=> (= (ControlFlow 0 26) (- 0 32)) (HasDirectPerm Mask@27 diz Ref__b)) (=> (HasDirectPerm Mask@27 diz Ref__b) (and (=> (= (ControlFlow 0 26) (- 0 31)) (>= tid 0)) (=> (>= tid 0) (and (=> (= (ControlFlow 0 26) (- 0 30)) (< tid (|Seq#Length| (MapType0Select ExhaleHeap@0 diz Ref__b)))) (=> (< tid (|Seq#Length| (MapType0Select ExhaleHeap@0 diz Ref__b))) (=> (and (= __flatten_9@0 (|Seq#Index| (MapType0Select ExhaleHeap@0 diz Ref__b) tid)) (state ExhaleHeap@0 Mask@27)) (and (=> (= (ControlFlow 0 26) (- 0 29)) (HasDirectPerm Mask@27 __flatten_8@0 Ref__Integer_value)) (=> (HasDirectPerm Mask@27 __flatten_8@0 Ref__Integer_value) (and (=> (= (ControlFlow 0 26) (- 0 28)) (HasDirectPerm Mask@27 __flatten_9@0 Ref__Integer_value)) (=> (HasDirectPerm Mask@27 __flatten_9@0 Ref__Integer_value) (=> (and (= __flatten_7@0 (+ (U_2_int (MapType0Select ExhaleHeap@0 __flatten_8@0 Ref__Integer_value)) (U_2_int (MapType0Select ExhaleHeap@0 __flatten_9@0 Ref__Integer_value)))) (state ExhaleHeap@0 Mask@27)) (and (=> (= (ControlFlow 0 26) (- 0 27)) (= FullPerm (U_2_real (MapType1Select Mask@27 __flatten_6@0 Ref__Integer_value)))) (=> (= FullPerm (U_2_real (MapType1Select Mask@27 __flatten_6@0 Ref__Integer_value))) (=> (and (and (= Heap@1 (MapType0Store ExhaleHeap@0 __flatten_6@0 Ref__Integer_value (int_2_U __flatten_7@0))) (state Heap@1 Mask@27)) (and (= Heap@3 Heap@1) (= (ControlFlow 0 26) 12))) anon27_correct))))))))))))))))))))))))))))))))
(let ((anon24_correct  (=> (and (and (= __flatten_1@0 1) (state ExhaleHeap@0 Mask@27)) (and (state ExhaleHeap@0 Mask@27) (state ExhaleHeap@0 Mask@27))) (and (=> (= (ControlFlow 0 48) 26) anon41_Then_correct) (=> (= (ControlFlow 0 48) 39) anon41_Else_correct)))))
(let ((anon40_Else_correct  (=> (not (= __flatten_1@0 0)) (=> (and (= Mask@27 Mask@23) (= (ControlFlow 0 51) 48)) anon24_correct))))
(let ((anon40_Then_correct  (=> (and (and (and (= __flatten_1@0 0) (not (= (|Seq#Index| (MapType0Select ExhaleHeap@0 diz Ref__a) tid) null))) (and (= Mask@24 (MapType1Store Mask@23 (|Seq#Index| (MapType0Select ExhaleHeap@0 diz Ref__a) tid) Ref__Integer_value (real_2_U (+ (U_2_real (MapType1Select Mask@23 (|Seq#Index| (MapType0Select ExhaleHeap@0 diz Ref__a) tid) Ref__Integer_value)) FullPerm)))) (state ExhaleHeap@0 Mask@24))) (and (and (not (= (|Seq#Index| (MapType0Select ExhaleHeap@0 diz Ref__b) tid) null)) (= Mask@25 (MapType1Store Mask@24 (|Seq#Index| (MapType0Select ExhaleHeap@0 diz Ref__b) tid) Ref__Integer_value (real_2_U (+ (U_2_real (MapType1Select Mask@24 (|Seq#Index| (MapType0Select ExhaleHeap@0 diz Ref__b) tid) Ref__Integer_value)) FullPerm))))) (and (state ExhaleHeap@0 Mask@25) (= perm@6 (/ (to_real 1) (to_real 4)))))) (and (=> (= (ControlFlow 0 49) (- 0 50)) (>= perm@6 NoPerm)) (=> (>= perm@6 NoPerm) (=> (=> (> perm@6 NoPerm) (not (= (|Seq#Index| (MapType0Select ExhaleHeap@0 diz Ref__c) tid) null))) (=> (and (and (= Mask@26 (MapType1Store Mask@25 (|Seq#Index| (MapType0Select ExhaleHeap@0 diz Ref__c) tid) Ref__Integer_value (real_2_U (+ (U_2_real (MapType1Select Mask@25 (|Seq#Index| (MapType0Select ExhaleHeap@0 diz Ref__c) tid) Ref__Integer_value)) perm@6)))) (state ExhaleHeap@0 Mask@26)) (and (= Mask@27 Mask@26) (= (ControlFlow 0 49) 48))) anon24_correct)))))))
(let ((anon39_Else_correct  (=> (and (>= 0 tid) (= Mask@23 Mask@21)) (and (=> (= (ControlFlow 0 55) 49) anon40_Then_correct) (=> (= (ControlFlow 0 55) 51) anon40_Else_correct)))))
(let ((anon39_Then_correct  (=> (and (> tid 0) (= perm@5 (/ (to_real 1) (to_real 4)))) (and (=> (= (ControlFlow 0 53) (- 0 54)) (>= perm@5 NoPerm)) (=> (>= perm@5 NoPerm) (=> (and (and (=> (> perm@5 NoPerm) (not (= (|Seq#Index| (MapType0Select ExhaleHeap@0 diz Ref__b) (- tid 1)) null))) (= Mask@22 (MapType1Store Mask@21 (|Seq#Index| (MapType0Select ExhaleHeap@0 diz Ref__b) (- tid 1)) Ref__Integer_value (real_2_U (+ (U_2_real (MapType1Select Mask@21 (|Seq#Index| (MapType0Select ExhaleHeap@0 diz Ref__b) (- tid 1)) Ref__Integer_value)) perm@5))))) (and (state ExhaleHeap@0 Mask@22) (= Mask@23 Mask@22))) (and (=> (= (ControlFlow 0 53) 49) anon40_Then_correct) (=> (= (ControlFlow 0 53) 51) anon40_Else_correct))))))))
(let ((anon38_Then_correct  (=> (= __flatten_1@0 1) (=> (and (and (not (= (|Seq#Index| (MapType0Select ExhaleHeap@0 diz Ref__a) tid) null)) (= Mask@20 (MapType1Store Mask@19 (|Seq#Index| (MapType0Select ExhaleHeap@0 diz Ref__a) tid) Ref__Integer_value (real_2_U (+ (U_2_real (MapType1Select Mask@19 (|Seq#Index| (MapType0Select ExhaleHeap@0 diz Ref__a) tid) Ref__Integer_value)) FullPerm))))) (and (state ExhaleHeap@0 Mask@20) (= perm@4 (/ (to_real 1) (to_real 4))))) (and (=> (= (ControlFlow 0 56) (- 0 57)) (>= perm@4 NoPerm)) (=> (>= perm@4 NoPerm) (=> (=> (> perm@4 NoPerm) (not (= (|Seq#Index| (MapType0Select ExhaleHeap@0 diz Ref__b) tid) null))) (=> (and (= Mask@21 (MapType1Store Mask@20 (|Seq#Index| (MapType0Select ExhaleHeap@0 diz Ref__b) tid) Ref__Integer_value (real_2_U (+ (U_2_real (MapType1Select Mask@20 (|Seq#Index| (MapType0Select ExhaleHeap@0 diz Ref__b) tid) Ref__Integer_value)) perm@4)))) (state ExhaleHeap@0 Mask@21)) (and (=> (= (ControlFlow 0 56) 53) anon39_Then_correct) (=> (= (ControlFlow 0 56) 55) anon39_Else_correct))))))))))
(let ((anon38_Else_correct  (=> (and (not (= __flatten_1@0 1)) (= Mask@23 Mask@19)) (and (=> (= (ControlFlow 0 52) 49) anon40_Then_correct) (=> (= (ControlFlow 0 52) 51) anon40_Else_correct)))))
(let ((anon19_correct  (=> (and (and (and (IdenticalOnKnownLocations Heap@0 ExhaleHeap@0 Mask@16) (<= 0 tid)) (and (< tid tcount) (= tid lid))) (and (and (= tcount gsize) (= gid 0)) (and (> wildcard@9 NoPerm) (not (= diz null))))) (=> (and (and (and (and (= Mask@17 (MapType1Store Mask@16 diz Ref__a (real_2_U (+ (U_2_real (MapType1Select Mask@16 diz Ref__a)) wildcard@9)))) (state ExhaleHeap@0 Mask@17)) (and (= (|Seq#Length| (MapType0Select ExhaleHeap@0 diz Ref__a)) tcount) (> wildcard@10 NoPerm))) (and (and (not (= diz null)) (= Mask@18 (MapType1Store Mask@17 diz Ref__b (real_2_U (+ (U_2_real (MapType1Select Mask@17 diz Ref__b)) wildcard@10))))) (and (state ExhaleHeap@0 Mask@18) (= (|Seq#Length| (MapType0Select ExhaleHeap@0 diz Ref__b)) tcount)))) (and (and (and (> wildcard@11 NoPerm) (not (= diz null))) (and (= Mask@19 (MapType1Store Mask@18 diz Ref__c (real_2_U (+ (U_2_real (MapType1Select Mask@18 diz Ref__c)) wildcard@11)))) (state ExhaleHeap@0 Mask@19))) (and (and (= (|Seq#Length| (MapType0Select ExhaleHeap@0 diz Ref__c)) tcount) (|Seq#Equal| (MapType0Select ExhaleHeap@0 diz Ref__a) (MapType0Select Heap@0 diz Ref__a))) (and (|Seq#Equal| (MapType0Select ExhaleHeap@0 diz Ref__b) (MapType0Select Heap@0 diz Ref__b)) (|Seq#Equal| (MapType0Select ExhaleHeap@0 diz Ref__c) (MapType0Select Heap@0 diz Ref__c)))))) (and (=> (= (ControlFlow 0 58) 56) anon38_Then_correct) (=> (= (ControlFlow 0 58) 52) anon38_Else_correct))))))
(let ((anon18_correct  (=> (= Mask@15 (MapType1Store Mask@14 (|Seq#Index| (MapType0Select Heap@0 diz Ref__c) tid) Ref__Integer_value (real_2_U (- (U_2_real (MapType1Select Mask@14 (|Seq#Index| (MapType0Select Heap@0 diz Ref__c) tid) Ref__Integer_value)) perm@3)))) (=> (and (= Mask@16 Mask@15) (= (ControlFlow 0 60) 58)) anon19_correct))))
(let ((anon37_Else_correct  (=> (and (= perm@3 NoPerm) (= (ControlFlow 0 63) 60)) anon18_correct)))
(let ((anon37_Then_correct  (=> (not (= perm@3 NoPerm)) (and (=> (= (ControlFlow 0 61) (- 0 62)) (<= perm@3 (U_2_real (MapType1Select Mask@14 (|Seq#Index| (MapType0Select Heap@0 diz Ref__c) tid) Ref__Integer_value)))) (=> (<= perm@3 (U_2_real (MapType1Select Mask@14 (|Seq#Index| (MapType0Select Heap@0 diz Ref__c) tid) Ref__Integer_value))) (=> (= (ControlFlow 0 61) 60) anon18_correct))))))
(let ((anon16_correct  (=> (and (= Mask@14 (MapType1Store Mask@13 (|Seq#Index| (MapType0Select Heap@0 diz Ref__b) tid) Ref__Integer_value (real_2_U (- (U_2_real (MapType1Select Mask@13 (|Seq#Index| (MapType0Select Heap@0 diz Ref__b) tid) Ref__Integer_value)) FullPerm)))) (= perm@3 (/ (to_real 1) (to_real 4)))) (and (=> (= (ControlFlow 0 64) (- 0 65)) (>= perm@3 NoPerm)) (=> (>= perm@3 NoPerm) (and (=> (= (ControlFlow 0 64) 61) anon37_Then_correct) (=> (= (ControlFlow 0 64) 63) anon37_Else_correct)))))))
(let ((anon36_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 68) 64)) anon16_correct)))
(let ((anon36_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 66) (- 0 67)) (<= FullPerm (U_2_real (MapType1Select Mask@13 (|Seq#Index| (MapType0Select Heap@0 diz Ref__b) tid) Ref__Integer_value)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@13 (|Seq#Index| (MapType0Select Heap@0 diz Ref__b) tid) Ref__Integer_value))) (=> (= (ControlFlow 0 66) 64) anon16_correct))))))
(let ((anon14_correct  (=> (= Mask@13 (MapType1Store Mask@12 (|Seq#Index| (MapType0Select Heap@0 diz Ref__a) tid) Ref__Integer_value (real_2_U (- (U_2_real (MapType1Select Mask@12 (|Seq#Index| (MapType0Select Heap@0 diz Ref__a) tid) Ref__Integer_value)) FullPerm)))) (and (=> (= (ControlFlow 0 69) 66) anon36_Then_correct) (=> (= (ControlFlow 0 69) 68) anon36_Else_correct)))))
(let ((anon35_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 72) 69)) anon14_correct)))
(let ((anon35_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 70) (- 0 71)) (<= FullPerm (U_2_real (MapType1Select Mask@12 (|Seq#Index| (MapType0Select Heap@0 diz Ref__a) tid) Ref__Integer_value)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@12 (|Seq#Index| (MapType0Select Heap@0 diz Ref__a) tid) Ref__Integer_value))) (=> (= (ControlFlow 0 70) 69) anon14_correct))))))
(let ((anon34_Then_correct  (=> (= 0 0) (and (=> (= (ControlFlow 0 73) 70) anon35_Then_correct) (=> (= (ControlFlow 0 73) 72) anon35_Else_correct)))))
(let ((anon34_Else_correct  (=> (not (= 0 0)) (=> (and (= Mask@16 Mask@12) (= (ControlFlow 0 59) 58)) anon19_correct))))
(let ((anon10_correct  (=> (and (= Mask@11 (MapType1Store Mask@10 (|Seq#Index| (MapType0Select Heap@0 diz Ref__b) (- tid 1)) Ref__Integer_value (real_2_U (- (U_2_real (MapType1Select Mask@10 (|Seq#Index| (MapType0Select Heap@0 diz Ref__b) (- tid 1)) Ref__Integer_value)) perm@2)))) (= Mask@12 Mask@11)) (and (=> (= (ControlFlow 0 76) 73) anon34_Then_correct) (=> (= (ControlFlow 0 76) 59) anon34_Else_correct)))))
(let ((anon33_Else_correct  (=> (and (= perm@2 NoPerm) (= (ControlFlow 0 79) 76)) anon10_correct)))
(let ((anon33_Then_correct  (=> (not (= perm@2 NoPerm)) (and (=> (= (ControlFlow 0 77) (- 0 78)) (<= perm@2 (U_2_real (MapType1Select Mask@10 (|Seq#Index| (MapType0Select Heap@0 diz Ref__b) (- tid 1)) Ref__Integer_value)))) (=> (<= perm@2 (U_2_real (MapType1Select Mask@10 (|Seq#Index| (MapType0Select Heap@0 diz Ref__b) (- tid 1)) Ref__Integer_value))) (=> (= (ControlFlow 0 77) 76) anon10_correct))))))
(let ((anon32_Then_correct  (=> (and (> tid 0) (= perm@2 (/ (to_real 1) (to_real 4)))) (and (=> (= (ControlFlow 0 80) (- 0 81)) (>= perm@2 NoPerm)) (=> (>= perm@2 NoPerm) (and (=> (= (ControlFlow 0 80) 77) anon33_Then_correct) (=> (= (ControlFlow 0 80) 79) anon33_Else_correct)))))))
(let ((anon32_Else_correct  (=> (and (>= 0 tid) (= Mask@12 Mask@10)) (and (=> (= (ControlFlow 0 75) 73) anon34_Then_correct) (=> (= (ControlFlow 0 75) 59) anon34_Else_correct)))))
(let ((anon7_correct  (=> (= Mask@10 (MapType1Store Mask@9 (|Seq#Index| (MapType0Select Heap@0 diz Ref__b) tid) Ref__Integer_value (real_2_U (- (U_2_real (MapType1Select Mask@9 (|Seq#Index| (MapType0Select Heap@0 diz Ref__b) tid) Ref__Integer_value)) perm@1)))) (and (=> (= (ControlFlow 0 82) 80) anon32_Then_correct) (=> (= (ControlFlow 0 82) 75) anon32_Else_correct)))))
(let ((anon31_Else_correct  (=> (and (= perm@1 NoPerm) (= (ControlFlow 0 85) 82)) anon7_correct)))
(let ((anon31_Then_correct  (=> (not (= perm@1 NoPerm)) (and (=> (= (ControlFlow 0 83) (- 0 84)) (<= perm@1 (U_2_real (MapType1Select Mask@9 (|Seq#Index| (MapType0Select Heap@0 diz Ref__b) tid) Ref__Integer_value)))) (=> (<= perm@1 (U_2_real (MapType1Select Mask@9 (|Seq#Index| (MapType0Select Heap@0 diz Ref__b) tid) Ref__Integer_value))) (=> (= (ControlFlow 0 83) 82) anon7_correct))))))
(let ((anon5_correct  (=> (and (= Mask@9 (MapType1Store Mask@8 (|Seq#Index| (MapType0Select Heap@0 diz Ref__a) tid) Ref__Integer_value (real_2_U (- (U_2_real (MapType1Select Mask@8 (|Seq#Index| (MapType0Select Heap@0 diz Ref__a) tid) Ref__Integer_value)) FullPerm)))) (= perm@1 (/ (to_real 1) (to_real 4)))) (and (=> (= (ControlFlow 0 86) (- 0 87)) (>= perm@1 NoPerm)) (=> (>= perm@1 NoPerm) (and (=> (= (ControlFlow 0 86) 83) anon31_Then_correct) (=> (= (ControlFlow 0 86) 85) anon31_Else_correct)))))))
(let ((anon30_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 90) 86)) anon5_correct)))
(let ((anon30_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 88) (- 0 89)) (<= FullPerm (U_2_real (MapType1Select Mask@8 (|Seq#Index| (MapType0Select Heap@0 diz Ref__a) tid) Ref__Integer_value)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@8 (|Seq#Index| (MapType0Select Heap@0 diz Ref__a) tid) Ref__Integer_value))) (=> (= (ControlFlow 0 88) 86) anon5_correct))))))
(let ((anon29_Then_correct  (=> (= 0 1) (and (=> (= (ControlFlow 0 91) 88) anon30_Then_correct) (=> (= (ControlFlow 0 91) 90) anon30_Else_correct)))))
(let ((anon29_Else_correct  (=> (and (not (= 0 1)) (= Mask@12 Mask@8)) (and (=> (= (ControlFlow 0 74) 73) anon34_Then_correct) (=> (= (ControlFlow 0 74) 59) anon34_Else_correct)))))
(let ((anon28_Else_correct  (=> (and (and (and (U_2_bool (MapType0Select Heap@@9 __flatten_2 $allocated)) (U_2_bool (MapType0Select Heap@@9 __flatten_4 $allocated))) (and (U_2_bool (MapType0Select Heap@@9 __flatten_6 $allocated)) (U_2_bool (MapType0Select Heap@@9 __flatten_8 $allocated)))) (and (and (U_2_bool (MapType0Select Heap@@9 __flatten_9 $allocated)) (U_2_bool (MapType0Select Heap@@9 __flatten_10 $allocated))) (and (U_2_bool (MapType0Select Heap@@9 __flatten_12 $allocated)) (state Heap@@9 Mask@5)))) (and (=> (= (ControlFlow 0 92) (- 0 114)) (HasDirectPerm Mask@5 diz Ref__b)) (=> (HasDirectPerm Mask@5 diz Ref__b) (and (=> (= (ControlFlow 0 92) (- 0 113)) (>= tid 0)) (=> (>= tid 0) (and (=> (= (ControlFlow 0 92) (- 0 112)) (< tid (|Seq#Length| (MapType0Select Heap@@9 diz Ref__b)))) (=> (< tid (|Seq#Length| (MapType0Select Heap@@9 diz Ref__b))) (=> (and (= __flatten_2@0 (|Seq#Index| (MapType0Select Heap@@9 diz Ref__b) tid)) (state Heap@@9 Mask@5)) (and (=> (= (ControlFlow 0 92) (- 0 111)) (HasDirectPerm Mask@5 diz Ref__c)) (=> (HasDirectPerm Mask@5 diz Ref__c) (and (=> (= (ControlFlow 0 92) (- 0 110)) (>= tid 0)) (=> (>= tid 0) (and (=> (= (ControlFlow 0 92) (- 0 109)) (< tid (|Seq#Length| (MapType0Select Heap@@9 diz Ref__c)))) (=> (< tid (|Seq#Length| (MapType0Select Heap@@9 diz Ref__c))) (=> (and (= __flatten_4@0 (|Seq#Index| (MapType0Select Heap@@9 diz Ref__c) tid)) (state Heap@@9 Mask@5)) (and (=> (= (ControlFlow 0 92) (- 0 108)) (HasDirectPerm Mask@5 __flatten_4@0 Ref__Integer_value)) (=> (HasDirectPerm Mask@5 __flatten_4@0 Ref__Integer_value) (=> (and (= __flatten_3@0 (U_2_int (MapType0Select Heap@@9 __flatten_4@0 Ref__Integer_value))) (state Heap@@9 Mask@5)) (and (=> (= (ControlFlow 0 92) (- 0 107)) (= FullPerm (U_2_real (MapType1Select Mask@5 __flatten_2@0 Ref__Integer_value)))) (=> (= FullPerm (U_2_real (MapType1Select Mask@5 __flatten_2@0 Ref__Integer_value))) (=> (and (= Heap@0 (MapType0Store Heap@@9 __flatten_2@0 Ref__Integer_value (int_2_U __flatten_3@0))) (state Heap@0 Mask@5)) (and (=> (= (ControlFlow 0 92) (- 0 106)) (not (= diz null))) (=> (not (= diz null)) (and (=> (= (ControlFlow 0 92) (- 0 105)) (>= current_thread_id 0)) (=> (>= current_thread_id 0) (and (=> (= (ControlFlow 0 92) (- 0 104)) (= 0 0)) (=> (= 0 0) (and (=> (= (ControlFlow 0 92) (- 0 103)) (<= 0 tid)) (=> (<= 0 tid) (and (=> (= (ControlFlow 0 92) (- 0 102)) (< tid tcount)) (=> (< tid tcount) (and (=> (= (ControlFlow 0 92) (- 0 101)) (= tid lid)) (=> (= tid lid) (and (=> (= (ControlFlow 0 92) (- 0 100)) (= tcount gsize)) (=> (= tcount gsize) (and (=> (= (ControlFlow 0 92) (- 0 99)) (= gid 0)) (=> (= gid 0) (and (=> (= (ControlFlow 0 92) (- 0 98)) (> (U_2_real (MapType1Select Mask@5 diz Ref__a)) NoPerm)) (=> (> (U_2_real (MapType1Select Mask@5 diz Ref__a)) NoPerm) (=> (> wildcard@6 NoPerm) (=> (and (< wildcard@6 (U_2_real (MapType1Select Mask@5 diz Ref__a))) (= Mask@6 (MapType1Store Mask@5 diz Ref__a (real_2_U (- (U_2_real (MapType1Select Mask@5 diz Ref__a)) wildcard@6))))) (and (=> (= (ControlFlow 0 92) (- 0 97)) (= (|Seq#Length| (MapType0Select Heap@0 diz Ref__a)) tcount)) (=> (= (|Seq#Length| (MapType0Select Heap@0 diz Ref__a)) tcount) (and (=> (= (ControlFlow 0 92) (- 0 96)) (> (U_2_real (MapType1Select Mask@6 diz Ref__b)) NoPerm)) (=> (> (U_2_real (MapType1Select Mask@6 diz Ref__b)) NoPerm) (=> (> wildcard@7 NoPerm) (=> (and (< wildcard@7 (U_2_real (MapType1Select Mask@6 diz Ref__b))) (= Mask@7 (MapType1Store Mask@6 diz Ref__b (real_2_U (- (U_2_real (MapType1Select Mask@6 diz Ref__b)) wildcard@7))))) (and (=> (= (ControlFlow 0 92) (- 0 95)) (= (|Seq#Length| (MapType0Select Heap@0 diz Ref__b)) tcount)) (=> (= (|Seq#Length| (MapType0Select Heap@0 diz Ref__b)) tcount) (and (=> (= (ControlFlow 0 92) (- 0 94)) (> (U_2_real (MapType1Select Mask@7 diz Ref__c)) NoPerm)) (=> (> (U_2_real (MapType1Select Mask@7 diz Ref__c)) NoPerm) (=> (> wildcard@8 NoPerm) (=> (and (< wildcard@8 (U_2_real (MapType1Select Mask@7 diz Ref__c))) (= Mask@8 (MapType1Store Mask@7 diz Ref__c (real_2_U (- (U_2_real (MapType1Select Mask@7 diz Ref__c)) wildcard@8))))) (and (=> (= (ControlFlow 0 92) (- 0 93)) (= (|Seq#Length| (MapType0Select Heap@0 diz Ref__c)) tcount)) (=> (= (|Seq#Length| (MapType0Select Heap@0 diz Ref__c)) tcount) (and (=> (= (ControlFlow 0 92) 91) anon29_Then_correct) (=> (= (ControlFlow 0 92) 74) anon29_Else_correct)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
(let ((anon28_Then_correct  (=> (and (and (and (and (state PostHeap@0 ZeroMask) (<= 0 tid)) (and (state PostHeap@0 ZeroMask) (< tid tcount))) (and (and (state PostHeap@0 ZeroMask) (= tid lid)) (and (state PostHeap@0 ZeroMask) (= tcount gsize)))) (and (and (and (state PostHeap@0 ZeroMask) (= gid 0)) (and (state PostHeap@0 ZeroMask) (> wildcard@3 NoPerm))) (and (and (not (= diz null)) (= PostMask@0 (MapType1Store ZeroMask diz Ref__a (real_2_U (+ (U_2_real (MapType1Select ZeroMask diz Ref__a)) wildcard@3))))) (and (state PostHeap@0 PostMask@0) (state PostHeap@0 PostMask@0))))) (and (=> (= (ControlFlow 0 2) (- 0 10)) (HasDirectPerm PostMask@0 diz Ref__a)) (=> (HasDirectPerm PostMask@0 diz Ref__a) (=> (= (|Seq#Length| (MapType0Select PostHeap@0 diz Ref__a)) tcount) (=> (and (state PostHeap@0 PostMask@0) (> wildcard@4 NoPerm)) (=> (and (and (not (= diz null)) (= PostMask@1 (MapType1Store PostMask@0 diz Ref__b (real_2_U (+ (U_2_real (MapType1Select PostMask@0 diz Ref__b)) wildcard@4))))) (and (state PostHeap@0 PostMask@1) (state PostHeap@0 PostMask@1))) (and (=> (= (ControlFlow 0 2) (- 0 9)) (HasDirectPerm PostMask@1 diz Ref__b)) (=> (HasDirectPerm PostMask@1 diz Ref__b) (=> (= (|Seq#Length| (MapType0Select PostHeap@0 diz Ref__b)) tcount) (=> (and (state PostHeap@0 PostMask@1) (> wildcard@5 NoPerm)) (=> (and (and (not (= diz null)) (= PostMask@2 (MapType1Store PostMask@1 diz Ref__c (real_2_U (+ (U_2_real (MapType1Select PostMask@1 diz Ref__c)) wildcard@5))))) (and (state PostHeap@0 PostMask@2) (state PostHeap@0 PostMask@2))) (and (=> (= (ControlFlow 0 2) (- 0 8)) (HasDirectPerm PostMask@2 diz Ref__c)) (=> (HasDirectPerm PostMask@2 diz Ref__c) (=> (and (= (|Seq#Length| (MapType0Select PostHeap@0 diz Ref__c)) tcount) (state PostHeap@0 PostMask@2)) (and (=> (= (ControlFlow 0 2) (- 0 7)) (HasDirectPerm PostMask@2 diz Ref__a)) (=> (HasDirectPerm PostMask@2 diz Ref__a) (and (=> (= (ControlFlow 0 2) (- 0 6)) (HasDirectPerm Mask@5 diz Ref__a)) (=> (HasDirectPerm Mask@5 diz Ref__a) (=> (and (|Seq#Equal| (MapType0Select PostHeap@0 diz Ref__a) (MapType0Select Heap@@9 diz Ref__a)) (state PostHeap@0 PostMask@2)) (and (=> (= (ControlFlow 0 2) (- 0 5)) (HasDirectPerm PostMask@2 diz Ref__b)) (=> (HasDirectPerm PostMask@2 diz Ref__b) (and (=> (= (ControlFlow 0 2) (- 0 4)) (HasDirectPerm Mask@5 diz Ref__b)) (=> (HasDirectPerm Mask@5 diz Ref__b) (=> (and (|Seq#Equal| (MapType0Select PostHeap@0 diz Ref__b) (MapType0Select Heap@@9 diz Ref__b)) (state PostHeap@0 PostMask@2)) (and (=> (= (ControlFlow 0 2) (- 0 3)) (HasDirectPerm PostMask@2 diz Ref__c)) (=> (HasDirectPerm PostMask@2 diz Ref__c) (=> (= (ControlFlow 0 2) (- 0 1)) (HasDirectPerm Mask@5 diz Ref__c))))))))))))))))))))))))))))))
(let ((anon0_correct  (=> (state Heap@@9 ZeroMask) (=> (and (and (U_2_bool (MapType0Select Heap@@9 diz $allocated)) (not (= diz null))) (and (state Heap@@9 ZeroMask) (>= current_thread_id 0))) (=> (and (and (and (and (state Heap@@9 ZeroMask) (<= 0 tid)) (and (state Heap@@9 ZeroMask) (< tid tcount))) (and (and (state Heap@@9 ZeroMask) (= tid lid)) (and (state Heap@@9 ZeroMask) (= tcount gsize)))) (and (and (and (state Heap@@9 ZeroMask) (= gid 0)) (and (state Heap@@9 ZeroMask) (> wildcard@0 NoPerm))) (and (and (not (= diz null)) (= Mask@0 (MapType1Store ZeroMask diz Ref__a (real_2_U (+ (U_2_real (MapType1Select ZeroMask diz Ref__a)) wildcard@0))))) (and (state Heap@@9 Mask@0) (state Heap@@9 Mask@0))))) (and (=> (= (ControlFlow 0 115) (- 0 128)) (HasDirectPerm Mask@0 diz Ref__a)) (=> (HasDirectPerm Mask@0 diz Ref__a) (=> (= (|Seq#Length| (MapType0Select Heap@@9 diz Ref__a)) tcount) (=> (and (state Heap@@9 Mask@0) (> wildcard@1 NoPerm)) (=> (and (and (not (= diz null)) (= Mask@1 (MapType1Store Mask@0 diz Ref__b (real_2_U (+ (U_2_real (MapType1Select Mask@0 diz Ref__b)) wildcard@1))))) (and (state Heap@@9 Mask@1) (state Heap@@9 Mask@1))) (and (=> (= (ControlFlow 0 115) (- 0 127)) (HasDirectPerm Mask@1 diz Ref__b)) (=> (HasDirectPerm Mask@1 diz Ref__b) (=> (= (|Seq#Length| (MapType0Select Heap@@9 diz Ref__b)) tcount) (=> (and (state Heap@@9 Mask@1) (> wildcard@2 NoPerm)) (=> (and (and (not (= diz null)) (= Mask@2 (MapType1Store Mask@1 diz Ref__c (real_2_U (+ (U_2_real (MapType1Select Mask@1 diz Ref__c)) wildcard@2))))) (and (state Heap@@9 Mask@2) (state Heap@@9 Mask@2))) (and (=> (= (ControlFlow 0 115) (- 0 126)) (HasDirectPerm Mask@2 diz Ref__c)) (=> (HasDirectPerm Mask@2 diz Ref__c) (=> (and (= (|Seq#Length| (MapType0Select Heap@@9 diz Ref__c)) tcount) (state Heap@@9 Mask@2)) (and (=> (= (ControlFlow 0 115) (- 0 125)) (HasDirectPerm Mask@2 diz Ref__a)) (=> (HasDirectPerm Mask@2 diz Ref__a) (and (=> (= (ControlFlow 0 115) (- 0 124)) (>= tid 0)) (=> (>= tid 0) (and (=> (= (ControlFlow 0 115) (- 0 123)) (< tid (|Seq#Length| (MapType0Select Heap@@9 diz Ref__a)))) (=> (< tid (|Seq#Length| (MapType0Select Heap@@9 diz Ref__a))) (=> (and (and (not (= (|Seq#Index| (MapType0Select Heap@@9 diz Ref__a) tid) null)) (= Mask@3 (MapType1Store Mask@2 (|Seq#Index| (MapType0Select Heap@@9 diz Ref__a) tid) Ref__Integer_value (real_2_U (+ (U_2_real (MapType1Select Mask@2 (|Seq#Index| (MapType0Select Heap@@9 diz Ref__a) tid) Ref__Integer_value)) FullPerm))))) (and (state Heap@@9 Mask@3) (state Heap@@9 Mask@3))) (and (=> (= (ControlFlow 0 115) (- 0 122)) (HasDirectPerm Mask@3 diz Ref__b)) (=> (HasDirectPerm Mask@3 diz Ref__b) (and (=> (= (ControlFlow 0 115) (- 0 121)) (>= tid 0)) (=> (>= tid 0) (and (=> (= (ControlFlow 0 115) (- 0 120)) (< tid (|Seq#Length| (MapType0Select Heap@@9 diz Ref__b)))) (=> (< tid (|Seq#Length| (MapType0Select Heap@@9 diz Ref__b))) (=> (and (and (not (= (|Seq#Index| (MapType0Select Heap@@9 diz Ref__b) tid) null)) (= Mask@4 (MapType1Store Mask@3 (|Seq#Index| (MapType0Select Heap@@9 diz Ref__b) tid) Ref__Integer_value (real_2_U (+ (U_2_real (MapType1Select Mask@3 (|Seq#Index| (MapType0Select Heap@@9 diz Ref__b) tid) Ref__Integer_value)) FullPerm))))) (and (state Heap@@9 Mask@4) (state Heap@@9 Mask@4))) (and (=> (= (ControlFlow 0 115) (- 0 119)) (HasDirectPerm Mask@4 diz Ref__c)) (=> (HasDirectPerm Mask@4 diz Ref__c) (and (=> (= (ControlFlow 0 115) (- 0 118)) (>= tid 0)) (=> (>= tid 0) (and (=> (= (ControlFlow 0 115) (- 0 117)) (< tid (|Seq#Length| (MapType0Select Heap@@9 diz Ref__c)))) (=> (< tid (|Seq#Length| (MapType0Select Heap@@9 diz Ref__c))) (=> (= perm@0 (/ (to_real 1) (to_real 4))) (and (=> (= (ControlFlow 0 115) (- 0 116)) (>= perm@0 NoPerm)) (=> (>= perm@0 NoPerm) (=> (and (and (=> (> perm@0 NoPerm) (not (= (|Seq#Index| (MapType0Select Heap@@9 diz Ref__c) tid) null))) (= Mask@5 (MapType1Store Mask@4 (|Seq#Index| (MapType0Select Heap@@9 diz Ref__c) tid) Ref__Integer_value (real_2_U (+ (U_2_real (MapType1Select Mask@4 (|Seq#Index| (MapType0Select Heap@@9 diz Ref__c) tid) Ref__Integer_value)) perm@0))))) (and (state Heap@@9 Mask@5) (state Heap@@9 Mask@5))) (and (=> (= (ControlFlow 0 115) 2) anon28_Then_correct) (=> (= (ControlFlow 0 115) 92) anon28_Else_correct))))))))))))))))))))))))))))))))))))))))))))
(let ((PreconditionGeneratedEntry_correct  (=> (and (and (> wildcard NoPerm) true) (= (ControlFlow 0 129) 115)) anon0_correct)))
PreconditionGeneratedEntry_correct))))))))))))))))))))))))))))))))))))))))
))
(check-sat)
(pop 1)
; Valid
(get-info :rlimit)
