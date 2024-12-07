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
(declare-fun FieldType (T@T T@T) T@T)
(declare-fun FieldTypeInv0 (T@T) T@T)
(declare-fun FieldTypeInv1 (T@T) T@T)
(declare-fun NormalFieldType () T@T)
(declare-fun SeqType (T@T) T@T)
(declare-fun SeqTypeInv0 (T@T) T@T)
(declare-fun |Seq#Length| (T@U) Int)
(declare-fun |Seq#Drop| (T@U Int) T@U)
(declare-fun succHeap (T@U T@U) Bool)
(declare-fun MapType0Type (T@T) T@T)
(declare-fun RefType () T@T)
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
(declare-fun |valid'| (T@U T@U Int Bool) Bool)
(declare-fun dummyFunction (T@U) Bool)
(declare-fun |valid#triggerStateless| (T@U Int Bool) Bool)
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
(declare-fun valid (T@U T@U Int Bool) Bool)
(declare-fun |Seq#Update| (T@U Int T@U) T@U)
(declare-fun AssumeFunctionsAbove () Int)
(declare-fun |Seq#Take| (T@U Int) T@U)
(declare-fun |Seq#Contains| (T@U T@U) Bool)
(declare-fun |Seq#Range| (Int Int) T@U)
(declare-fun |Seq#Skolem| (T@U T@U) Int)
(declare-fun len (T@U) Int)
(declare-fun ArrayDomainTypeType () T@T)
(declare-fun |Seq#Singleton| (T@U) T@U)
(declare-fun |Seq#Empty| (T@T) T@U)
(declare-fun |valid#frame| (T@U T@U Int Bool) Bool)
(declare-fun EmptyFrame () T@U)
(declare-fun dummyHeap () T@U)
(declare-fun ZeroMask () T@U)
(declare-fun InsidePredicate (T@U T@U T@U T@U) Bool)
(declare-fun |Seq#Append| (T@U T@U) T@U)
(declare-fun sumMask (T@U T@U T@U) Bool)
(declare-fun ConditionalFrame (Real T@U) T@U)
(declare-fun NoPerm () Real)
(declare-fun |Seq#Equal| (T@U T@U) Bool)
(declare-fun |Seq#ContainsTrigger| (T@U T@U) Bool)
(declare-fun slot (T@U Int) T@U)
(declare-fun slotToArray (T@U) T@U)
(declare-fun slotToIndex (T@U) Int)
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
(assert  (and (and (and (and (and (and (and (forall ((arg0@@11 T@T) (arg1 T@T) ) (! (= (Ctor (FieldType arg0@@11 arg1)) 6)
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
))) (= (type val) (FieldType NormalFieldType (SeqType (SeqType intType))))))
(assert (distinct $allocated val)
)
(assert (forall ((arg0@@16 T@U) (arg1@@2 Int) ) (! (let ((T (SeqTypeInv0 (type arg0@@16))))
(= (type (|Seq#Drop| arg0@@16 arg1@@2)) (SeqType T)))
 :qid |funType:Seq#Drop|
 :pattern ( (|Seq#Drop| arg0@@16 arg1@@2))
)))
(assert (forall ((s T@U) (n Int) ) (! (let ((T@@0 (SeqTypeInv0 (type s))))
 (=> (= (type s) (SeqType T@@0)) (and (=> (<= 0 n) (and (=> (<= n (|Seq#Length| s)) (= (|Seq#Length| (|Seq#Drop| s n)) (- (|Seq#Length| s) n))) (=> (< (|Seq#Length| s) n) (= (|Seq#Length| (|Seq#Drop| s n)) 0)))) (=> (< n 0) (= (|Seq#Length| (|Seq#Drop| s n)) (|Seq#Length| s))))))
 :qid |stdinbpl.343:18|
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
)))) (= (Ctor RefType) 10)))
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
(assert (forall ((Heap@@0 T@U) (s@@0 T@U) (lenTiles Int) (isStart Bool) ) (!  (=> (and (= (type Heap@@0) (MapType0Type RefType)) (= (type s@@0) (SeqType intType))) (dummyFunction (bool_2_U (|valid#triggerStateless| s@@0 lenTiles isStart))))
 :qid |stdinbpl.659:15|
 :skolemid |61|
 :pattern ( (|valid'| Heap@@0 s@@0 lenTiles isStart))
)))
(assert (forall ((arg0@@26 T@U) (arg1@@10 Int) ) (! (let ((T@@1 (SeqTypeInv0 (type arg0@@26))))
(= (type (|Seq#Index| arg0@@26 arg1@@10)) T@@1))
 :qid |funType:Seq#Index|
 :pattern ( (|Seq#Index| arg0@@26 arg1@@10))
)))
(assert (forall ((s@@1 T@U) (n@@0 Int) (j Int) ) (! (let ((T@@2 (SeqTypeInv0 (type s@@1))))
 (=> (= (type s@@1) (SeqType T@@2)) (=> (and (and (< 0 n@@0) (<= 0 j)) (< j (- (|Seq#Length| s@@1) n@@0))) (and (= (|Seq#Sub| (|Seq#Add| j n@@0) n@@0) j) (= (|Seq#Index| (|Seq#Drop| s@@1 n@@0) j) (|Seq#Index| s@@1 (|Seq#Add| j n@@0)))))))
 :qid |stdinbpl.364:18|
 :skolemid |39|
 :pattern ( (|Seq#Index| (|Seq#Drop| s@@1 n@@0) j))
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
(assert (forall ((Heap@@3 T@U) (s@@2 T@U) (lenTiles@@0 Int) (isStart@@0 Bool) ) (!  (=> (and (= (type Heap@@3) (MapType0Type RefType)) (= (type s@@2) (SeqType intType))) (and (= (valid Heap@@3 s@@2 lenTiles@@0 isStart@@0) (|valid'| Heap@@3 s@@2 lenTiles@@0 isStart@@0)) (dummyFunction (bool_2_U (|valid#triggerStateless| s@@2 lenTiles@@0 isStart@@0)))))
 :qid |stdinbpl.655:15|
 :skolemid |60|
 :pattern ( (valid Heap@@3 s@@2 lenTiles@@0 isStart@@0))
)))
(assert (forall ((arg0@@29 T@U) (arg1@@11 Int) (arg2@@3 T@U) ) (! (let ((T@@3 (type arg2@@3)))
(= (type (|Seq#Update| arg0@@29 arg1@@11 arg2@@3)) (SeqType T@@3)))
 :qid |funType:Seq#Update|
 :pattern ( (|Seq#Update| arg0@@29 arg1@@11 arg2@@3))
)))
(assert (forall ((s@@3 T@U) (i Int) (v T@U) (n@@1 Int) ) (! (let ((T@@4 (type v)))
 (=> (= (type s@@3) (SeqType T@@4)) (=> (and (<= 0 n@@1) (< n@@1 (|Seq#Length| s@@3))) (and (=> (= i n@@1) (= (|Seq#Index| (|Seq#Update| s@@3 i v) n@@1) v)) (=> (not (= i n@@1)) (= (|Seq#Index| (|Seq#Update| s@@3 i v) n@@1) (|Seq#Index| s@@3 n@@1)))))))
 :qid |stdinbpl.319:18|
 :skolemid |35|
 :pattern ( (|Seq#Index| (|Seq#Update| s@@3 i v) n@@1))
 :pattern ( (|Seq#Index| s@@3 n@@1) (|Seq#Update| s@@3 i v))
)))
(assert (forall ((Heap@@4 T@U) (Mask@@2 T@U) (s@@4 T@U) (lenTiles@@1 Int) (isStart@@1 Bool) ) (!  (=> (and (and (and (= (type Heap@@4) (MapType0Type RefType)) (= (type Mask@@2) (MapType1Type RefType realType))) (= (type s@@4) (SeqType intType))) (and (state Heap@@4 Mask@@2) (< AssumeFunctionsAbove 0))) (= (valid Heap@@4 s@@4 lenTiles@@1 isStart@@1) (ite (= (|Seq#Length| s@@4) 0) (= lenTiles@@1 0) (ite (= (|Seq#Length| s@@4) 1)  (and (= lenTiles@@1 (U_2_int (|Seq#Index| s@@4 0))) (ite isStart@@1  (or (= (U_2_int (|Seq#Index| s@@4 0)) 0) (>= (U_2_int (|Seq#Index| s@@4 0)) 3)) (>= (U_2_int (|Seq#Index| s@@4 0)) 3)))  (and (ite isStart@@1  (or (= (U_2_int (|Seq#Index| s@@4 0)) 0) (>= (U_2_int (|Seq#Index| s@@4 0)) 3)) (>= (U_2_int (|Seq#Index| s@@4 0)) 3)) (and (> (U_2_int (|Seq#Index| s@@4 1)) 0) (|valid'| Heap@@4 (|Seq#Drop| s@@4 2) (- (- lenTiles@@1 (U_2_int (|Seq#Index| s@@4 1))) (U_2_int (|Seq#Index| s@@4 0))) false)))))))
 :qid |stdinbpl.665:15|
 :skolemid |62|
 :pattern ( (state Heap@@4 Mask@@2) (valid Heap@@4 s@@4 lenTiles@@1 isStart@@1))
)))
(assert (forall ((arg0@@30 T@U) (arg1@@12 Int) ) (! (let ((T@@5 (SeqTypeInv0 (type arg0@@30))))
(= (type (|Seq#Take| arg0@@30 arg1@@12)) (SeqType T@@5)))
 :qid |funType:Seq#Take|
 :pattern ( (|Seq#Take| arg0@@30 arg1@@12))
)))
(assert (forall ((s@@5 T@U) (n@@2 Int) ) (! (let ((T@@6 (SeqTypeInv0 (type s@@5))))
 (=> (= (type s@@5) (SeqType T@@6)) (and (=> (<= 0 n@@2) (and (=> (<= n@@2 (|Seq#Length| s@@5)) (= (|Seq#Length| (|Seq#Take| s@@5 n@@2)) n@@2)) (=> (< (|Seq#Length| s@@5) n@@2) (= (|Seq#Length| (|Seq#Take| s@@5 n@@2)) (|Seq#Length| s@@5))))) (=> (< n@@2 0) (= (|Seq#Length| (|Seq#Take| s@@5 n@@2)) 0)))))
 :qid |stdinbpl.330:18|
 :skolemid |36|
 :pattern ( (|Seq#Length| (|Seq#Take| s@@5 n@@2)))
 :pattern ( (|Seq#Take| s@@5 n@@2) (|Seq#Length| s@@5))
)))
(assert (forall ((arg0@@31 Int) (arg1@@13 Int) ) (! (= (type (|Seq#Range| arg0@@31 arg1@@13)) (SeqType intType))
 :qid |funType:Seq#Range|
 :pattern ( (|Seq#Range| arg0@@31 arg1@@13))
)))
(assert (forall ((q@min Int) (q@max Int) (v@@0 T@U) ) (!  (=> (= (type v@@0) intType) (= (|Seq#Contains| (|Seq#Range| q@min q@max) v@@0)  (and (<= q@min (U_2_int v@@0)) (< (U_2_int v@@0) q@max))))
 :qid |stdinbpl.603:15|
 :skolemid |57|
 :pattern ( (|Seq#Contains| (|Seq#Range| q@min q@max) v@@0))
)))
(assert (forall ((s@@6 T@U) (x@@8 T@U) ) (! (let ((T@@7 (type x@@8)))
 (=> (and (= (type s@@6) (SeqType T@@7)) (|Seq#Contains| s@@6 x@@8)) (and (and (<= 0 (|Seq#Skolem| s@@6 x@@8)) (< (|Seq#Skolem| s@@6 x@@8) (|Seq#Length| s@@6))) (= (|Seq#Index| s@@6 (|Seq#Skolem| s@@6 x@@8)) x@@8))))
 :qid |stdinbpl.461:18|
 :skolemid |47|
 :pattern ( (|Seq#Contains| s@@6 x@@8))
)))
(assert (forall ((Heap@@5 T@U) (ExhaleHeap@@1 T@U) (Mask@@3 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@5) (MapType0Type RefType)) (= (type ExhaleHeap@@1) (MapType0Type RefType))) (= (type Mask@@3) (MapType1Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@5 ExhaleHeap@@1 Mask@@3)) (U_2_bool (MapType0Select Heap@@5 o_1 $allocated))) (U_2_bool (MapType0Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.73:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@5 ExhaleHeap@@1 Mask@@3) (MapType0Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert (forall ((s@@7 T@U) (n@@3 Int) ) (! (let ((T@@8 (SeqTypeInv0 (type s@@7))))
 (=> (and (= (type s@@7) (SeqType T@@8)) (<= n@@3 0)) (= (|Seq#Drop| s@@7 n@@3) s@@7)))
 :qid |stdinbpl.445:18|
 :skolemid |45|
 :pattern ( (|Seq#Drop| s@@7 n@@3))
)))
(assert (forall ((i@@0 Int) (j@@0 Int) ) (! (= (|Seq#Sub| i@@0 j@@0) (- i@@0 j@@0))
 :qid |stdinbpl.299:15|
 :skolemid |30|
 :pattern ( (|Seq#Sub| i@@0 j@@0))
)))
(assert (forall ((i@@1 Int) (j@@1 Int) ) (! (= (|Seq#Add| i@@1 j@@1) (+ i@@1 j@@1))
 :qid |stdinbpl.297:15|
 :skolemid |29|
 :pattern ( (|Seq#Add| i@@1 j@@1))
)))
(assert (= (Ctor ArrayDomainTypeType) 13))
(assert (forall ((_a_1 T@U) ) (!  (=> (= (type _a_1) ArrayDomainTypeType) (>= (len _a_1) 0))
 :qid |stdinbpl.635:15|
 :skolemid |59|
 :pattern ( (len _a_1))
)))
(assert (forall ((arg0@@32 T@U) ) (! (let ((T@@9 (type arg0@@32)))
(= (type (|Seq#Singleton| arg0@@32)) (SeqType T@@9)))
 :qid |funType:Seq#Singleton|
 :pattern ( (|Seq#Singleton| arg0@@32))
)))
(assert (forall ((x@@9 T@U) (y@@1 T@U) ) (! (let ((T@@10 (type x@@9)))
 (=> (= (type y@@1) T@@10) (= (|Seq#Contains| (|Seq#Singleton| x@@9) y@@1) (= x@@9 y@@1))))
 :qid |stdinbpl.586:18|
 :skolemid |54|
 :pattern ( (|Seq#Contains| (|Seq#Singleton| x@@9) y@@1))
)))
(assert (forall ((s@@8 T@U) (n@@4 Int) (j@@2 Int) ) (! (let ((T@@11 (SeqTypeInv0 (type s@@8))))
 (=> (= (type s@@8) (SeqType T@@11)) (=> (and (and (<= 0 j@@2) (< j@@2 n@@4)) (< j@@2 (|Seq#Length| s@@8))) (= (|Seq#Index| (|Seq#Take| s@@8 n@@4) j@@2) (|Seq#Index| s@@8 j@@2)))))
 :qid |stdinbpl.338:18|
 :skolemid |37|
 :pattern ( (|Seq#Index| (|Seq#Take| s@@8 n@@4) j@@2))
 :pattern ( (|Seq#Index| s@@8 j@@2) (|Seq#Take| s@@8 n@@4))
)))
(assert (forall ((Heap@@6 T@U) (ExhaleHeap@@2 T@U) (Mask@@4 T@U) (o_1@@0 T@U) (f_2 T@U) ) (! (let ((B@@1 (FieldTypeInv1 (type f_2))))
(let ((A@@1 (FieldTypeInv0 (type f_2))))
 (=> (and (and (and (and (and (and (= (type Heap@@6) (MapType0Type RefType)) (= (type ExhaleHeap@@2) (MapType0Type RefType))) (= (type Mask@@4) (MapType1Type RefType realType))) (= (type o_1@@0) RefType)) (= (type f_2) (FieldType A@@1 B@@1))) (IdenticalOnKnownLocations Heap@@6 ExhaleHeap@@2 Mask@@4)) (HasDirectPerm Mask@@4 o_1@@0 f_2)) (= (MapType0Select Heap@@6 o_1@@0 f_2) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2)))))
 :qid |stdinbpl.42:22|
 :skolemid |1|
 :pattern ( (IdenticalOnKnownLocations Heap@@6 ExhaleHeap@@2 Mask@@4) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2))
)))
(assert (forall ((T@@12 T@T) ) (! (= (type (|Seq#Empty| T@@12)) (SeqType T@@12))
 :qid |funType:Seq#Empty|
 :pattern ( (|Seq#Empty| T@@12))
)))
(assert (forall ((T@@13 T@T) ) (! (= (|Seq#Length| (|Seq#Empty| T@@13)) 0)
 :skolemid |23|
)))
(assert (= (type EmptyFrame) FrameTypeType))
(assert (forall ((Heap@@7 T@U) (Mask@@5 T@U) (s@@9 T@U) (lenTiles@@2 Int) (isStart@@2 Bool) ) (!  (=> (and (and (and (= (type Heap@@7) (MapType0Type RefType)) (= (type Mask@@5) (MapType1Type RefType realType))) (= (type s@@9) (SeqType intType))) (state Heap@@7 Mask@@5)) (= (|valid'| Heap@@7 s@@9 lenTiles@@2 isStart@@2) (|valid#frame| EmptyFrame s@@9 lenTiles@@2 isStart@@2)))
 :qid |stdinbpl.672:15|
 :skolemid |63|
 :pattern ( (state Heap@@7 Mask@@5) (|valid'| Heap@@7 s@@9 lenTiles@@2 isStart@@2))
)))
(assert  (and (= (type dummyHeap) (MapType0Type RefType)) (= (type ZeroMask) (MapType1Type RefType realType))))
(assert (state dummyHeap ZeroMask))
(assert (forall ((p T@U) (v_1 T@U) (w T@U) ) (! (let ((A@@2 (FieldTypeInv0 (type p))))
 (=> (and (and (= (type p) (FieldType A@@2 FrameTypeType)) (= (type v_1) FrameTypeType)) (= (type w) FrameTypeType)) (not (InsidePredicate p v_1 p w))))
 :qid |stdinbpl.242:19|
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
 :qid |stdinbpl.310:18|
 :skolemid |32|
 :pattern ( (|Seq#Index| (|Seq#Append| s0 s1) n@@5))
)))
(assert  (not (IsPredicateField val)))
(assert  (not (IsWandField val)))
(assert (forall ((Heap@@8 T@U) (ExhaleHeap@@3 T@U) (Mask@@6 T@U) ) (!  (=> (and (and (and (= (type Heap@@8) (MapType0Type RefType)) (= (type ExhaleHeap@@3) (MapType0Type RefType))) (= (type Mask@@6) (MapType1Type RefType realType))) (IdenticalOnKnownLocations Heap@@8 ExhaleHeap@@3 Mask@@6)) (succHeap Heap@@8 ExhaleHeap@@3))
 :qid |stdinbpl.83:15|
 :skolemid |10|
 :pattern ( (IdenticalOnKnownLocations Heap@@8 ExhaleHeap@@3 Mask@@6))
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
(assert (forall ((arg0@@34 Real) (arg1@@15 T@U) ) (! (= (type (ConditionalFrame arg0@@34 arg1@@15)) FrameTypeType)
 :qid |funType:ConditionalFrame|
 :pattern ( (ConditionalFrame arg0@@34 arg1@@15))
)))
(assert (forall ((p@@0 Real) (f_6 T@U) ) (!  (=> (= (type f_6) FrameTypeType) (= (ConditionalFrame p@@0 f_6) (ite (> p@@0 0.0) f_6 EmptyFrame)))
 :qid |stdinbpl.230:15|
 :skolemid |19|
 :pattern ( (ConditionalFrame p@@0 f_6))
)))
(assert (forall ((q@min@@0 Int) (q@max@@0 Int) (j@@3 Int) ) (!  (=> (and (<= 0 j@@3) (< j@@3 (- q@max@@0 q@min@@0))) (= (U_2_int (|Seq#Index| (|Seq#Range| q@min@@0 q@max@@0) j@@3)) (+ q@min@@0 j@@3)))
 :qid |stdinbpl.601:15|
 :skolemid |56|
 :pattern ( (|Seq#Index| (|Seq#Range| q@min@@0 q@max@@0) j@@3))
)))
(assert (forall ((Mask@@7 T@U) (o_2@@0 T@U) (f_4@@0 T@U) ) (! (let ((B@@3 (FieldTypeInv1 (type f_4@@0))))
(let ((A@@4 (FieldTypeInv0 (type f_4@@0))))
 (=> (and (and (= (type Mask@@7) (MapType1Type RefType realType)) (= (type o_2@@0) RefType)) (= (type f_4@@0) (FieldType A@@4 B@@3))) (= (HasDirectPerm Mask@@7 o_2@@0 f_4@@0) (> (U_2_real (MapType1Select Mask@@7 o_2@@0 f_4@@0)) NoPerm)))))
 :qid |stdinbpl.133:22|
 :skolemid |17|
 :pattern ( (HasDirectPerm Mask@@7 o_2@@0 f_4@@0))
)))
(assert (forall ((s0@@0 T@U) (s1@@0 T@U) ) (! (let ((T@@16 (SeqTypeInv0 (type s0@@0))))
 (=> (and (and (= (type s0@@0) (SeqType T@@16)) (= (type s1@@0) (SeqType T@@16))) (and (not (= s0@@0 (|Seq#Empty| T@@16))) (not (= s1@@0 (|Seq#Empty| T@@16))))) (= (|Seq#Length| (|Seq#Append| s0@@0 s1@@0)) (+ (|Seq#Length| s0@@0) (|Seq#Length| s1@@0)))))
 :qid |stdinbpl.279:18|
 :skolemid |26|
 :pattern ( (|Seq#Length| (|Seq#Append| s0@@0 s1@@0)))
)))
(assert (forall ((s@@10 T@U) (t T@U) (n@@6 Int) ) (! (let ((T@@17 (SeqTypeInv0 (type s@@10))))
 (=> (and (and (= (type s@@10) (SeqType T@@17)) (= (type t) (SeqType T@@17))) (and (> n@@6 0) (> n@@6 (|Seq#Length| s@@10)))) (and (= (|Seq#Add| (|Seq#Sub| n@@6 (|Seq#Length| s@@10)) (|Seq#Length| s@@10)) n@@6) (= (|Seq#Drop| (|Seq#Append| s@@10 t) n@@6) (|Seq#Drop| t (|Seq#Sub| n@@6 (|Seq#Length| s@@10)))))))
 :qid |stdinbpl.435:18|
 :skolemid |44|
 :pattern ( (|Seq#Drop| (|Seq#Append| s@@10 t) n@@6))
)))
(assert (forall ((o_2@@1 T@U) (f_4@@1 T@U) ) (! (let ((B@@4 (FieldTypeInv1 (type f_4@@1))))
(let ((A@@5 (FieldTypeInv0 (type f_4@@1))))
 (=> (and (= (type o_2@@1) RefType) (= (type f_4@@1) (FieldType A@@5 B@@4))) (= (U_2_real (MapType1Select ZeroMask o_2@@1 f_4@@1)) NoPerm))))
 :qid |stdinbpl.106:22|
 :skolemid |13|
 :pattern ( (MapType1Select ZeroMask o_2@@1 f_4@@1))
)))
(assert (forall ((s@@11 T@U) (t@@0 T@U) (n@@7 Int) ) (! (let ((T@@18 (SeqTypeInv0 (type s@@11))))
 (=> (and (and (= (type s@@11) (SeqType T@@18)) (= (type t@@0) (SeqType T@@18))) (and (> n@@7 0) (> n@@7 (|Seq#Length| s@@11)))) (and (= (|Seq#Add| (|Seq#Sub| n@@7 (|Seq#Length| s@@11)) (|Seq#Length| s@@11)) n@@7) (= (|Seq#Take| (|Seq#Append| s@@11 t@@0) n@@7) (|Seq#Append| s@@11 (|Seq#Take| t@@0 (|Seq#Sub| n@@7 (|Seq#Length| s@@11))))))))
 :qid |stdinbpl.422:18|
 :skolemid |42|
 :pattern ( (|Seq#Take| (|Seq#Append| s@@11 t@@0) n@@7))
)))
(assert (forall ((q@min@@1 Int) (q@max@@1 Int) ) (!  (and (=> (< q@min@@1 q@max@@1) (= (|Seq#Length| (|Seq#Range| q@min@@1 q@max@@1)) (- q@max@@1 q@min@@1))) (=> (<= q@max@@1 q@min@@1) (= (|Seq#Length| (|Seq#Range| q@min@@1 q@max@@1)) 0)))
 :qid |stdinbpl.600:15|
 :skolemid |55|
 :pattern ( (|Seq#Length| (|Seq#Range| q@min@@1 q@max@@1)))
)))
(assert (forall ((a T@U) (b T@U) ) (! (let ((T@@19 (SeqTypeInv0 (type a))))
 (=> (and (and (= (type a) (SeqType T@@19)) (= (type b) (SeqType T@@19))) (|Seq#Equal| a b)) (= a b)))
 :qid |stdinbpl.573:18|
 :skolemid |53|
 :pattern ( (|Seq#Equal| a b))
)))
(assert (forall ((s@@12 T@U) (i@@2 Int) ) (! (let ((T@@20 (SeqTypeInv0 (type s@@12))))
 (=> (= (type s@@12) (SeqType T@@20)) (=> (and (<= 0 i@@2) (< i@@2 (|Seq#Length| s@@12))) (|Seq#ContainsTrigger| s@@12 (|Seq#Index| s@@12 i@@2)))))
 :qid |stdinbpl.466:18|
 :skolemid |49|
 :pattern ( (|Seq#Index| s@@12 i@@2))
)))
(assert (forall ((s0@@1 T@U) (s1@@1 T@U) ) (! (let ((T@@21 (SeqTypeInv0 (type s0@@1))))
 (=> (and (= (type s0@@1) (SeqType T@@21)) (= (type s1@@1) (SeqType T@@21))) (and (=> (= s0@@1 (|Seq#Empty| T@@21)) (= (|Seq#Append| s0@@1 s1@@1) s1@@1)) (=> (= s1@@1 (|Seq#Empty| T@@21)) (= (|Seq#Append| s0@@1 s1@@1) s0@@1)))))
 :qid |stdinbpl.285:18|
 :skolemid |27|
 :pattern ( (|Seq#Append| s0@@1 s1@@1))
)))
(assert (forall ((t@@1 T@U) ) (! (= (|Seq#Index| (|Seq#Singleton| t@@1) 0) t@@1)
 :qid |stdinbpl.289:18|
 :skolemid |28|
 :pattern ( (|Seq#Singleton| t@@1))
)))
(assert (forall ((s@@13 T@U) ) (! (let ((T@@22 (SeqTypeInv0 (type s@@13))))
 (=> (= (type s@@13) (SeqType T@@22)) (<= 0 (|Seq#Length| s@@13))))
 :qid |stdinbpl.268:18|
 :skolemid |22|
 :pattern ( (|Seq#Length| s@@13))
)))
(assert (forall ((s0@@2 T@U) (s1@@2 T@U) ) (! (let ((T@@23 (SeqTypeInv0 (type s0@@2))))
 (=> (and (and (= (type s0@@2) (SeqType T@@23)) (= (type s1@@2) (SeqType T@@23))) (|Seq#Equal| s0@@2 s1@@2)) (and (= (|Seq#Length| s0@@2) (|Seq#Length| s1@@2)) (forall ((j@@4 Int) ) (!  (=> (and (<= 0 j@@4) (< j@@4 (|Seq#Length| s0@@2))) (= (|Seq#Index| s0@@2 j@@4) (|Seq#Index| s1@@2 j@@4)))
 :qid |stdinbpl.563:13|
 :skolemid |50|
 :pattern ( (|Seq#Index| s0@@2 j@@4))
 :pattern ( (|Seq#Index| s1@@2 j@@4))
)))))
 :qid |stdinbpl.560:18|
 :skolemid |51|
 :pattern ( (|Seq#Equal| s0@@2 s1@@2))
)))
(assert  (and (forall ((arg0@@35 T@U) (arg1@@16 Int) ) (! (= (type (slot arg0@@35 arg1@@16)) RefType)
 :qid |funType:slot|
 :pattern ( (slot arg0@@35 arg1@@16))
)) (forall ((arg0@@36 T@U) ) (! (= (type (slotToArray arg0@@36)) ArrayDomainTypeType)
 :qid |funType:slotToArray|
 :pattern ( (slotToArray arg0@@36))
))))
(assert (forall ((_a_1@@0 T@U) (i_3 Int) ) (!  (=> (= (type _a_1@@0) ArrayDomainTypeType) (=> (and (<= 0 i_3) (< i_3 (len _a_1@@0))) (and (= (slotToArray (slot _a_1@@0 i_3)) _a_1@@0) (= (slotToIndex (slot _a_1@@0 i_3)) i_3))))
 :qid |stdinbpl.629:15|
 :skolemid |58|
 :pattern ( (len _a_1@@0) (slot _a_1@@0 i_3))
 :pattern ( (len _a_1@@0) (slotToArray (slot _a_1@@0 i_3)))
 :pattern ( (len _a_1@@0) (slotToIndex (slot _a_1@@0 i_3)))
 :pattern ( (slotToArray (slot _a_1@@0 i_3)))
 :pattern ( (slotToIndex (slot _a_1@@0 i_3)))
)))
(assert (forall ((Heap@@9 T@U) (ExhaleHeap@@4 T@U) (Mask@@8 T@U) (pm_f@@1 T@U) ) (! (let ((C@@1 (FieldTypeInv0 (type pm_f@@1))))
 (=> (and (and (and (and (and (= (type Heap@@9) (MapType0Type RefType)) (= (type ExhaleHeap@@4) (MapType0Type RefType))) (= (type Mask@@8) (MapType1Type RefType realType))) (= (type pm_f@@1) (FieldType C@@1 FrameTypeType))) (IdenticalOnKnownLocations Heap@@9 ExhaleHeap@@4 Mask@@8)) (and (HasDirectPerm Mask@@8 null pm_f@@1) (IsPredicateField pm_f@@1))) (forall ((o2 T@U) (f_2@@0 T@U) ) (! (let ((B@@5 (FieldTypeInv1 (type f_2@@0))))
(let ((A@@6 (FieldTypeInv0 (type f_2@@0))))
 (=> (and (and (= (type o2) RefType) (= (type f_2@@0) (FieldType A@@6 B@@5))) (U_2_bool (MapType1Select (MapType0Select Heap@@9 null (PredicateMaskField pm_f@@1)) o2 f_2@@0))) (= (MapType0Select Heap@@9 o2 f_2@@0) (MapType0Select ExhaleHeap@@4 o2 f_2@@0)))))
 :qid |stdinbpl.54:134|
 :skolemid |3|
 :pattern ( (MapType0Select ExhaleHeap@@4 o2 f_2@@0))
))))
 :qid |stdinbpl.52:19|
 :skolemid |4|
 :pattern ( (IdenticalOnKnownLocations Heap@@9 ExhaleHeap@@4 Mask@@8) (IsPredicateField pm_f@@1))
)))
(assert (forall ((Heap@@10 T@U) (ExhaleHeap@@5 T@U) (Mask@@9 T@U) (pm_f@@2 T@U) ) (! (let ((C@@2 (FieldTypeInv0 (type pm_f@@2))))
 (=> (and (and (and (and (and (= (type Heap@@10) (MapType0Type RefType)) (= (type ExhaleHeap@@5) (MapType0Type RefType))) (= (type Mask@@9) (MapType1Type RefType realType))) (= (type pm_f@@2) (FieldType C@@2 FrameTypeType))) (IdenticalOnKnownLocations Heap@@10 ExhaleHeap@@5 Mask@@9)) (and (HasDirectPerm Mask@@9 null pm_f@@2) (IsWandField pm_f@@2))) (forall ((o2@@0 T@U) (f_2@@1 T@U) ) (! (let ((B@@6 (FieldTypeInv1 (type f_2@@1))))
(let ((A@@7 (FieldTypeInv0 (type f_2@@1))))
 (=> (and (and (= (type o2@@0) RefType) (= (type f_2@@1) (FieldType A@@7 B@@6))) (U_2_bool (MapType1Select (MapType0Select Heap@@10 null (WandMaskField pm_f@@2)) o2@@0 f_2@@1))) (= (MapType0Select Heap@@10 o2@@0 f_2@@1) (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1)))))
 :qid |stdinbpl.67:129|
 :skolemid |6|
 :pattern ( (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1))
))))
 :qid |stdinbpl.65:19|
 :skolemid |7|
 :pattern ( (IdenticalOnKnownLocations Heap@@10 ExhaleHeap@@5 Mask@@9) (IsWandField pm_f@@2))
)))
(assert (forall ((t@@2 T@U) ) (! (= (|Seq#Length| (|Seq#Singleton| t@@2)) 1)
 :qid |stdinbpl.276:18|
 :skolemid |25|
 :pattern ( (|Seq#Singleton| t@@2))
)))
(assert (forall ((Mask@@10 T@U) (o_2@@2 T@U) (f_4@@2 T@U) ) (! (let ((B@@7 (FieldTypeInv1 (type f_4@@2))))
(let ((A@@8 (FieldTypeInv0 (type f_4@@2))))
 (=> (and (and (and (= (type Mask@@10) (MapType1Type RefType realType)) (= (type o_2@@2) RefType)) (= (type f_4@@2) (FieldType A@@8 B@@7))) (GoodMask Mask@@10)) (and (>= (U_2_real (MapType1Select Mask@@10 o_2@@2 f_4@@2)) NoPerm) (=> (and (and (GoodMask Mask@@10) (not (IsPredicateField f_4@@2))) (not (IsWandField f_4@@2))) (<= (U_2_real (MapType1Select Mask@@10 o_2@@2 f_4@@2)) FullPerm))))))
 :qid |stdinbpl.128:22|
 :skolemid |16|
 :pattern ( (GoodMask Mask@@10) (MapType1Select Mask@@10 o_2@@2 f_4@@2))
)))
(assert (forall ((o T@U) (f T@U) (Heap@@11 T@U) ) (!  (=> (and (and (and (= (type o) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap@@11) (MapType0Type RefType))) (U_2_bool (MapType0Select Heap@@11 o $allocated))) (U_2_bool (MapType0Select Heap@@11 (MapType0Select Heap@@11 o f) $allocated)))
 :qid |stdinbpl.31:15|
 :skolemid |0|
 :pattern ( (MapType0Select Heap@@11 o f))
)))
(assert (forall ((s@@14 T@U) (t@@3 T@U) (n@@8 Int) ) (! (let ((T@@24 (SeqTypeInv0 (type s@@14))))
 (=> (and (and (= (type s@@14) (SeqType T@@24)) (= (type t@@3) (SeqType T@@24))) (and (< 0 n@@8) (<= n@@8 (|Seq#Length| s@@14)))) (= (|Seq#Take| (|Seq#Append| s@@14 t@@3) n@@8) (|Seq#Take| s@@14 n@@8))))
 :qid |stdinbpl.418:18|
 :skolemid |41|
 :pattern ( (|Seq#Take| (|Seq#Append| s@@14 t@@3) n@@8))
)))
(assert (forall ((s@@15 T@U) (i@@3 Int) (v@@1 T@U) ) (! (let ((T@@25 (type v@@1)))
 (=> (= (type s@@15) (SeqType T@@25)) (=> (and (<= 0 i@@3) (< i@@3 (|Seq#Length| s@@15))) (= (|Seq#Length| (|Seq#Update| s@@15 i@@3 v@@1)) (|Seq#Length| s@@15)))))
 :qid |stdinbpl.317:18|
 :skolemid |34|
 :pattern ( (|Seq#Length| (|Seq#Update| s@@15 i@@3 v@@1)))
 :pattern ( (|Seq#Length| s@@15) (|Seq#Update| s@@15 i@@3 v@@1))
)))
(assert (forall ((s@@16 T@U) (t@@4 T@U) (n@@9 Int) ) (! (let ((T@@26 (SeqTypeInv0 (type s@@16))))
 (=> (and (and (= (type s@@16) (SeqType T@@26)) (= (type t@@4) (SeqType T@@26))) (and (< 0 n@@9) (<= n@@9 (|Seq#Length| s@@16)))) (= (|Seq#Drop| (|Seq#Append| s@@16 t@@4) n@@9) (|Seq#Append| (|Seq#Drop| s@@16 n@@9) t@@4))))
 :qid |stdinbpl.431:18|
 :skolemid |43|
 :pattern ( (|Seq#Drop| (|Seq#Append| s@@16 t@@4) n@@9))
)))
(assert (forall ((s@@17 T@U) (n@@10 Int) (i@@4 Int) ) (! (let ((T@@27 (SeqTypeInv0 (type s@@17))))
 (=> (= (type s@@17) (SeqType T@@27)) (=> (and (and (< 0 n@@10) (<= n@@10 i@@4)) (< i@@4 (|Seq#Length| s@@17))) (and (= (|Seq#Add| (|Seq#Sub| i@@4 n@@10) n@@10) i@@4) (= (|Seq#Index| (|Seq#Drop| s@@17 n@@10) (|Seq#Sub| i@@4 n@@10)) (|Seq#Index| s@@17 i@@4))))))
 :qid |stdinbpl.368:18|
 :skolemid |40|
 :pattern ( (|Seq#Drop| s@@17 n@@10) (|Seq#Index| s@@17 i@@4))
)))
(assert (forall ((s0@@3 T@U) (s1@@3 T@U) (n@@11 Int) ) (! (let ((T@@28 (SeqTypeInv0 (type s0@@3))))
 (=> (and (= (type s0@@3) (SeqType T@@28)) (= (type s1@@3) (SeqType T@@28))) (=> (and (and (and (not (= s0@@3 (|Seq#Empty| T@@28))) (not (= s1@@3 (|Seq#Empty| T@@28)))) (<= 0 n@@11)) (< n@@11 (|Seq#Length| s0@@3))) (= (|Seq#Index| (|Seq#Append| s0@@3 s1@@3) n@@11) (|Seq#Index| s0@@3 n@@11)))))
 :qid |stdinbpl.308:18|
 :skolemid |31|
 :pattern ( (|Seq#Index| (|Seq#Append| s0@@3 s1@@3) n@@11))
 :pattern ( (|Seq#Index| s0@@3 n@@11) (|Seq#Append| s0@@3 s1@@3))
)))
(assert (forall ((Heap@@12 T@U) (o@@0 T@U) (f_3 T@U) (v@@2 T@U) ) (! (let ((B@@8 (type v@@2)))
(let ((A@@9 (FieldTypeInv0 (type f_3))))
 (=> (and (and (= (type Heap@@12) (MapType0Type RefType)) (= (type o@@0) RefType)) (= (type f_3) (FieldType A@@9 B@@8))) (succHeap Heap@@12 (MapType0Store Heap@@12 o@@0 f_3 v@@2)))))
 :qid |stdinbpl.78:22|
 :skolemid |9|
 :pattern ( (MapType0Store Heap@@12 o@@0 f_3 v@@2))
)))
(assert (forall ((s0@@4 T@U) (s1@@4 T@U) (m@@7 Int) ) (! (let ((T@@29 (SeqTypeInv0 (type s0@@4))))
 (=> (and (= (type s0@@4) (SeqType T@@29)) (= (type s1@@4) (SeqType T@@29))) (=> (and (and (and (not (= s0@@4 (|Seq#Empty| T@@29))) (not (= s1@@4 (|Seq#Empty| T@@29)))) (<= 0 m@@7)) (< m@@7 (|Seq#Length| s1@@4))) (and (= (|Seq#Sub| (|Seq#Add| m@@7 (|Seq#Length| s0@@4)) (|Seq#Length| s0@@4)) m@@7) (= (|Seq#Index| (|Seq#Append| s0@@4 s1@@4) (|Seq#Add| m@@7 (|Seq#Length| s0@@4))) (|Seq#Index| s1@@4 m@@7))))))
 :qid |stdinbpl.313:18|
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
(assert (forall ((s@@18 T@U) (x@@10 T@U) (i@@5 Int) ) (! (let ((T@@30 (type x@@10)))
 (=> (= (type s@@18) (SeqType T@@30)) (=> (and (and (<= 0 i@@5) (< i@@5 (|Seq#Length| s@@18))) (= (|Seq#Index| s@@18 i@@5) x@@10)) (|Seq#Contains| s@@18 x@@10))))
 :qid |stdinbpl.464:18|
 :skolemid |48|
 :pattern ( (|Seq#Contains| s@@18 x@@10) (|Seq#Index| s@@18 i@@5))
)))
(assert (forall ((s0@@5 T@U) (s1@@5 T@U) ) (! (let ((T@@31 (SeqTypeInv0 (type s0@@5))))
 (=> (and (= (type s0@@5) (SeqType T@@31)) (= (type s1@@5) (SeqType T@@31))) (or (or (and (= s0@@5 s1@@5) (|Seq#Equal| s0@@5 s1@@5)) (and (and (not (= s0@@5 s1@@5)) (not (|Seq#Equal| s0@@5 s1@@5))) (not (= (|Seq#Length| s0@@5) (|Seq#Length| s1@@5))))) (and (and (and (and (and (and (not (= s0@@5 s1@@5)) (not (|Seq#Equal| s0@@5 s1@@5))) (= (|Seq#Length| s0@@5) (|Seq#Length| s1@@5))) (= (|Seq#SkolemDiff| s0@@5 s1@@5) (|Seq#SkolemDiff| s1@@5 s0@@5))) (<= 0 (|Seq#SkolemDiff| s0@@5 s1@@5))) (< (|Seq#SkolemDiff| s0@@5 s1@@5) (|Seq#Length| s0@@5))) (not (= (|Seq#Index| s0@@5 (|Seq#SkolemDiff| s0@@5 s1@@5)) (|Seq#Index| s1@@5 (|Seq#SkolemDiff| s0@@5 s1@@5))))))))
 :qid |stdinbpl.568:18|
 :skolemid |52|
 :pattern ( (|Seq#Equal| s0@@5 s1@@5))
)))
(assert (forall ((p@@1 T@U) (v_1@@0 T@U) (q T@U) (w@@0 T@U) (r T@U) (u T@U) ) (! (let ((C@@3 (FieldTypeInv0 (type r))))
(let ((B@@10 (FieldTypeInv0 (type q))))
(let ((A@@11 (FieldTypeInv0 (type p@@1))))
 (=> (and (and (and (and (and (and (= (type p@@1) (FieldType A@@11 FrameTypeType)) (= (type v_1@@0) FrameTypeType)) (= (type q) (FieldType B@@10 FrameTypeType))) (= (type w@@0) FrameTypeType)) (= (type r) (FieldType C@@3 FrameTypeType))) (= (type u) FrameTypeType)) (and (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))) (InsidePredicate p@@1 v_1@@0 r u)))))
 :qid |stdinbpl.237:25|
 :skolemid |20|
 :pattern ( (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))
)))
(assert (forall ((s@@19 T@U) ) (! (let ((T@@32 (SeqTypeInv0 (type s@@19))))
 (=> (and (= (type s@@19) (SeqType T@@32)) (= (|Seq#Length| s@@19) 0)) (= s@@19 (|Seq#Empty| T@@32))))
 :qid |stdinbpl.272:18|
 :skolemid |24|
 :pattern ( (|Seq#Length| s@@19))
)))
(assert (forall ((s@@20 T@U) (n@@12 Int) ) (! (let ((T@@33 (SeqTypeInv0 (type s@@20))))
 (=> (and (= (type s@@20) (SeqType T@@33)) (<= n@@12 0)) (= (|Seq#Take| s@@20 n@@12) (|Seq#Empty| T@@33))))
 :qid |stdinbpl.447:18|
 :skolemid |46|
 :pattern ( (|Seq#Take| s@@20 n@@12))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun m_6 () Int)
(declare-fun n@0 () Int)
(declare-fun j_34 () Int)
(declare-fun ExhaleHeap@0 () T@U)
(declare-fun a_2 () T@U)
(declare-fun QPMask@5 () T@U)
(declare-fun qpRange16 (T@U) Bool)
(declare-fun invRecv16 (T@U) Int)
(declare-fun QPMask@1 () T@U)
(declare-fun j_36 () Int)
(declare-fun i_6@0 () Int)
(declare-fun Mask@3 () T@U)
(declare-fun ExhaleHeap@1 () T@U)
(declare-fun n1_6 () Int)
(declare-fun j_35 () Int)
(declare-fun perm@1 () Real)
(declare-fun Mask@2 () T@U)
(declare-fun Mask@1 () T@U)
(declare-fun j_26 () Int)
(declare-fun i_6@1 () Int)
(declare-fun Heap@5 () T@U)
(declare-fun n1_5 () Int)
(declare-fun j_24 () Int)
(declare-fun Mask@9 () T@U)
(declare-fun Mask@8 () T@U)
(declare-fun Mask@5 () T@U)
(declare-fun perm@4 () Real)
(declare-fun soln@2 () T@U)
(declare-fun soln@0 () T@U)
(declare-fun oldSoln@0 () T@U)
(declare-fun soln@1 () T@U)
(declare-fun perm@2 () Real)
(declare-fun Mask@4 () T@U)
(declare-fun m_5 () Int)
(declare-fun n@1 () Int)
(declare-fun j_30 () Int)
(declare-fun perm@3 () Real)
(declare-fun Mask@6 () T@U)
(declare-fun Mask@7 () T@U)
(declare-fun neverTriggered18 (Int) Bool)
(declare-fun qpRange18 (T@U) Bool)
(declare-fun invRecv18 (T@U) Int)
(declare-fun QPMask@4 () T@U)
(declare-fun Heap@4 () T@U)
(declare-fun j_16 () Int)
(declare-fun n1 () Int)
(declare-fun j_14 () Int)
(declare-fun Mask@0 () T@U)
(declare-fun QPMask@2 () T@U)
(declare-fun perm@0 () Real)
(declare-fun qpRange17 (T@U) Bool)
(declare-fun invRecv17 (T@U) Int)
(declare-fun Heap@3 () T@U)
(declare-fun m@@8 () Int)
(declare-fun j_9 () Int)
(declare-fun QPMask@0 () T@U)
(declare-fun neverTriggered15 (Int) Bool)
(declare-fun qpRange15 (T@U) Bool)
(declare-fun invRecv15 (T@U) Int)
(declare-fun j_7 () Int)
(declare-fun j_33 () Int)
(declare-fun Heap@2 () T@U)
(declare-fun j_4 () Int)
(declare-fun j_31 () Int)
(declare-fun Heap@1 () T@U)
(declare-fun j_1 () Int)
(declare-fun j_27 () Int)
(declare-fun qpRange14 (T@U) Bool)
(declare-fun invRecv14 (T@U) Int)
(declare-fun Heap@@13 () T@U)
(declare-fun Heap@0 () T@U)
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (= (type Heap@1) (MapType0Type RefType)) (= (type a_2) ArrayDomainTypeType)) (= (type QPMask@0) (MapType1Type RefType realType))) (= (type Heap@2) (MapType0Type RefType))) (= (type Heap@3) (MapType0Type RefType))) (= (type ExhaleHeap@0) (MapType0Type RefType))) (= (type QPMask@1) (MapType1Type RefType realType))) (= (type Heap@4) (MapType0Type RefType))) (= (type ExhaleHeap@1) (MapType0Type RefType))) (= (type Mask@1) (MapType1Type RefType realType))) (= (type Mask@6) (MapType1Type RefType realType))) (= (type Mask@7) (MapType1Type RefType realType))) (= (type QPMask@4) (MapType1Type RefType realType))) (= (type Heap@5) (MapType0Type RefType))) (= (type Mask@9) (MapType1Type RefType realType))) (= (type Mask@8) (MapType1Type RefType realType))) (= (type Mask@5) (MapType1Type RefType realType))) (= (type soln@2) (SeqType intType))) (= (type soln@1) (SeqType intType))) (= (type oldSoln@0) (SeqType intType))) (= (type soln@0) (SeqType intType))) (= (type Mask@4) (MapType1Type RefType realType))) (= (type Mask@3) (MapType1Type RefType realType))) (= (type Mask@2) (MapType1Type RefType realType))) (= (type Mask@0) (MapType1Type RefType realType))) (= (type QPMask@2) (MapType1Type RefType realType))) (= (type QPMask@5) (MapType1Type RefType realType))) (= (type Heap@@13) (MapType0Type RefType))) (= (type Heap@0) (MapType0Type RefType))))
(set-info :boogie-vc-id colourings)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 207) (let ((anon142_Then_correct true))
(let ((anon53_correct true))
(let ((anon141_Then_correct  (=> (and (<= 0 m_6) (and (< m_6 n@0) (and (<= 0 j_34) (< j_34 (|Seq#Length| (MapType0Select ExhaleHeap@0 (slot a_2 m_6) val)))))) (and (=> (= (ControlFlow 0 172) (- 0 175)) (HasDirectPerm QPMask@5 (slot a_2 m_6) val)) (=> (HasDirectPerm QPMask@5 (slot a_2 m_6) val) (and (=> (= (ControlFlow 0 172) (- 0 174)) (>= j_34 0)) (=> (>= j_34 0) (and (=> (= (ControlFlow 0 172) (- 0 173)) (< j_34 (|Seq#Length| (MapType0Select ExhaleHeap@0 (slot a_2 m_6) val)))) (=> (< j_34 (|Seq#Length| (MapType0Select ExhaleHeap@0 (slot a_2 m_6) val))) (and (=> (= (ControlFlow 0 172) 171) anon142_Then_correct) (=> (= (ControlFlow 0 172) 169) anon53_correct)))))))))))
(let ((anon141_Else_correct  (=> (and (not (and (<= 0 m_6) (and (< m_6 n@0) (and (<= 0 j_34) (< j_34 (|Seq#Length| (MapType0Select ExhaleHeap@0 (slot a_2 m_6) val))))))) (= (ControlFlow 0 170) 169)) anon53_correct)))
(let ((anon140_Else_correct  (=> (< j_34 0) (and (=> (= (ControlFlow 0 180) 172) anon141_Then_correct) (=> (= (ControlFlow 0 180) 170) anon141_Else_correct)))))
(let ((anon140_Then_correct  (=> (<= 0 j_34) (and (=> (= (ControlFlow 0 178) (- 0 179)) (HasDirectPerm QPMask@5 (slot a_2 m_6) val)) (=> (HasDirectPerm QPMask@5 (slot a_2 m_6) val) (and (=> (= (ControlFlow 0 178) 172) anon141_Then_correct) (=> (= (ControlFlow 0 178) 170) anon141_Else_correct)))))))
(let ((anon139_Then_correct  (=> (< m_6 n@0) (and (=> (= (ControlFlow 0 181) 178) anon140_Then_correct) (=> (= (ControlFlow 0 181) 180) anon140_Else_correct)))))
(let ((anon139_Else_correct  (=> (<= n@0 m_6) (and (=> (= (ControlFlow 0 177) 172) anon141_Then_correct) (=> (= (ControlFlow 0 177) 170) anon141_Else_correct)))))
(let ((anon138_Then_correct  (=> (<= 0 m_6) (and (=> (= (ControlFlow 0 182) 181) anon139_Then_correct) (=> (= (ControlFlow 0 182) 177) anon139_Else_correct)))))
(let ((anon138_Else_correct  (=> (< m_6 0) (and (=> (= (ControlFlow 0 176) 172) anon141_Then_correct) (=> (= (ControlFlow 0 176) 170) anon141_Else_correct)))))
(let ((anon137_Else_correct true))
(let ((anon136_Else_correct  (and (=> (= (ControlFlow 0 183) (- 0 184)) (forall ((i_4 Int) (i_4_1 Int) ) (!  (=> (and (and (and (and (not (= i_4 i_4_1)) (and (<= 0 i_4) (< i_4 (len a_2)))) (and (<= 0 i_4_1) (< i_4_1 (len a_2)))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (slot a_2 i_4) (slot a_2 i_4_1))))
 :qid |stdinbpl.3256:19|
 :skolemid |195|
))) (=> (forall ((i_4@@0 Int) (i_4_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_4@@0 i_4_1@@0)) (and (<= 0 i_4@@0) (< i_4@@0 (len a_2)))) (and (<= 0 i_4_1@@0) (< i_4_1@@0 (len a_2)))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (slot a_2 i_4@@0) (slot a_2 i_4_1@@0))))
 :qid |stdinbpl.3256:19|
 :skolemid |195|
)) (=> (and (and (and (forall ((i_4@@1 Int) ) (!  (=> (and (and (<= 0 i_4@@1) (< i_4@@1 (len a_2))) (< NoPerm FullPerm)) (and (qpRange16 (slot a_2 i_4@@1)) (= (invRecv16 (slot a_2 i_4@@1)) i_4@@1)))
 :qid |stdinbpl.3262:26|
 :skolemid |196|
 :pattern ( (slot a_2 i_4@@1))
 :pattern ( (slot a_2 i_4@@1))
)) (forall ((o_3 T@U) ) (!  (=> (= (type o_3) RefType) (=> (and (and (and (<= 0 (invRecv16 o_3)) (< (invRecv16 o_3) (len a_2))) (< NoPerm FullPerm)) (qpRange16 o_3)) (= (slot a_2 (invRecv16 o_3)) o_3)))
 :qid |stdinbpl.3266:26|
 :skolemid |197|
 :pattern ( (invRecv16 o_3))
))) (and (forall ((i_4@@2 Int) ) (!  (=> (and (<= 0 i_4@@2) (< i_4@@2 (len a_2))) (not (= (slot a_2 i_4@@2) null)))
 :qid |stdinbpl.3272:26|
 :skolemid |198|
 :pattern ( (slot a_2 i_4@@2))
 :pattern ( (slot a_2 i_4@@2))
)) (forall ((o_3@@0 T@U) ) (!  (=> (= (type o_3@@0) RefType) (and (=> (and (and (and (<= 0 (invRecv16 o_3@@0)) (< (invRecv16 o_3@@0) (len a_2))) (< NoPerm FullPerm)) (qpRange16 o_3@@0)) (and (=> (< NoPerm FullPerm) (= (slot a_2 (invRecv16 o_3@@0)) o_3@@0)) (= (U_2_real (MapType1Select QPMask@5 o_3@@0 val)) (+ (U_2_real (MapType1Select QPMask@1 o_3@@0 val)) FullPerm)))) (=> (not (and (and (and (<= 0 (invRecv16 o_3@@0)) (< (invRecv16 o_3@@0) (len a_2))) (< NoPerm FullPerm)) (qpRange16 o_3@@0))) (= (U_2_real (MapType1Select QPMask@5 o_3@@0 val)) (U_2_real (MapType1Select QPMask@1 o_3@@0 val))))))
 :qid |stdinbpl.3278:26|
 :skolemid |199|
 :pattern ( (MapType1Select QPMask@5 o_3@@0 val))
)))) (and (and (forall ((o_3@@1 T@U) (f_5 T@U) ) (! (let ((B@@11 (FieldTypeInv1 (type f_5))))
(let ((A@@12 (FieldTypeInv0 (type f_5))))
 (=> (and (and (= (type o_3@@1) RefType) (= (type f_5) (FieldType A@@12 B@@11))) (not (= f_5 val))) (= (U_2_real (MapType1Select QPMask@1 o_3@@1 f_5)) (U_2_real (MapType1Select QPMask@5 o_3@@1 f_5))))))
 :qid |stdinbpl.3282:33|
 :skolemid |200|
 :pattern ( (MapType1Select QPMask@1 o_3@@1 f_5))
 :pattern ( (MapType1Select QPMask@5 o_3@@1 f_5))
)) (state ExhaleHeap@0 QPMask@5)) (and (state ExhaleHeap@0 QPMask@5) (state ExhaleHeap@0 QPMask@5)))) (and (and (=> (= (ControlFlow 0 183) 168) anon137_Else_correct) (=> (= (ControlFlow 0 183) 182) anon138_Then_correct)) (=> (= (ControlFlow 0 183) 176) anon138_Else_correct)))))))
(let ((anon136_Then_correct true))
(let ((anon135_Then_correct  (=> (<= 4 n@0) (=> (and (and (<= n@0 51) (state ExhaleHeap@0 QPMask@1)) (and (= (len a_2) 51) (state ExhaleHeap@0 QPMask@1))) (and (=> (= (ControlFlow 0 185) 167) anon136_Then_correct) (=> (= (ControlFlow 0 185) 183) anon136_Else_correct))))))
(let ((anon158_Then_correct true))
(let ((anon81_correct true))
(let ((anon157_Then_correct  (=> (and (<= 0 j_36) (< j_36 i_6@0)) (and (=> (= (ControlFlow 0 140) (- 0 143)) (HasDirectPerm Mask@3 (slot a_2 n@0) val)) (=> (HasDirectPerm Mask@3 (slot a_2 n@0) val) (and (=> (= (ControlFlow 0 140) (- 0 142)) (>= j_36 0)) (=> (>= j_36 0) (and (=> (= (ControlFlow 0 140) (- 0 141)) (< j_36 (|Seq#Length| (MapType0Select ExhaleHeap@1 (slot a_2 n@0) val)))) (=> (< j_36 (|Seq#Length| (MapType0Select ExhaleHeap@1 (slot a_2 n@0) val))) (and (=> (= (ControlFlow 0 140) 139) anon158_Then_correct) (=> (= (ControlFlow 0 140) 137) anon81_correct)))))))))))
(let ((anon157_Else_correct  (=> (and (not (and (<= 0 j_36) (< j_36 i_6@0))) (= (ControlFlow 0 138) 137)) anon81_correct)))
(let ((anon156_Else_correct true))
(let ((anon151_Else_correct  (=> (forall ((j_19 Int) (n1_3 Int) ) (!  (=> (and (= n1_3 (- n@0 1)) (and (<= 0 j_19) (< j_19 (|Seq#Length| (MapType0Select ExhaleHeap@1 (slot a_2 (- n@0 1)) val))))) (valid ExhaleHeap@1 (|Seq#Index| (MapType0Select ExhaleHeap@1 (slot a_2 n1_3) val) j_19) (- n@0 1) true))
 :qid |stdinbpl.3502:32|
 :skolemid |211|
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@1 (slot a_2 n1_3) val) j_19))
)) (=> (and (state ExhaleHeap@1 Mask@3) (state ExhaleHeap@1 Mask@3)) (and (and (=> (= (ControlFlow 0 144) 136) anon156_Else_correct) (=> (= (ControlFlow 0 144) 140) anon157_Then_correct)) (=> (= (ControlFlow 0 144) 138) anon157_Else_correct))))))
(let ((anon155_Then_correct true))
(let ((anon76_correct true))
(let ((anon154_Then_correct  (=> (and (= n1_6 (- n@0 1)) (and (<= 0 j_35) (< j_35 (|Seq#Length| (MapType0Select ExhaleHeap@1 (slot a_2 (- n@0 1)) val))))) (and (=> (= (ControlFlow 0 127) (- 0 130)) (HasDirectPerm Mask@3 (slot a_2 n1_6) val)) (=> (HasDirectPerm Mask@3 (slot a_2 n1_6) val) (and (=> (= (ControlFlow 0 127) (- 0 129)) (>= j_35 0)) (=> (>= j_35 0) (and (=> (= (ControlFlow 0 127) (- 0 128)) (< j_35 (|Seq#Length| (MapType0Select ExhaleHeap@1 (slot a_2 n1_6) val)))) (=> (< j_35 (|Seq#Length| (MapType0Select ExhaleHeap@1 (slot a_2 n1_6) val))) (and (=> (= (ControlFlow 0 127) 126) anon155_Then_correct) (=> (= (ControlFlow 0 127) 124) anon76_correct)))))))))))
(let ((anon154_Else_correct  (=> (and (not (and (= n1_6 (- n@0 1)) (and (<= 0 j_35) (< j_35 (|Seq#Length| (MapType0Select ExhaleHeap@1 (slot a_2 (- n@0 1)) val)))))) (= (ControlFlow 0 125) 124)) anon76_correct)))
(let ((anon153_Else_correct  (=> (< j_35 0) (and (=> (= (ControlFlow 0 134) 127) anon154_Then_correct) (=> (= (ControlFlow 0 134) 125) anon154_Else_correct)))))
(let ((anon153_Then_correct  (=> (<= 0 j_35) (and (=> (= (ControlFlow 0 132) (- 0 133)) (HasDirectPerm Mask@3 (slot a_2 (- n@0 1)) val)) (=> (HasDirectPerm Mask@3 (slot a_2 (- n@0 1)) val) (and (=> (= (ControlFlow 0 132) 127) anon154_Then_correct) (=> (= (ControlFlow 0 132) 125) anon154_Else_correct)))))))
(let ((anon152_Then_correct  (=> (= n1_6 (- n@0 1)) (and (=> (= (ControlFlow 0 135) 132) anon153_Then_correct) (=> (= (ControlFlow 0 135) 134) anon153_Else_correct)))))
(let ((anon152_Else_correct  (=> (not (= n1_6 (- n@0 1))) (and (=> (= (ControlFlow 0 131) 127) anon154_Then_correct) (=> (= (ControlFlow 0 131) 125) anon154_Else_correct)))))
(let ((anon150_Then_correct  (=> (= perm@1 (/ (to_real 1) (to_real 2))) (and (=> (= (ControlFlow 0 145) (- 0 148)) (>= perm@1 NoPerm)) (=> (>= perm@1 NoPerm) (=> (=> (> perm@1 NoPerm) (not (= (slot a_2 (- n@0 1)) null))) (=> (and (= Mask@2 (MapType1Store Mask@1 (slot a_2 (- n@0 1)) val (real_2_U (+ (U_2_real (MapType1Select Mask@1 (slot a_2 (- n@0 1)) val)) perm@1)))) (state ExhaleHeap@1 Mask@2)) (=> (and (and (state ExhaleHeap@1 Mask@2) (= (len a_2) 51)) (and (state ExhaleHeap@1 Mask@2) (<= 0 i_6@0))) (and (=> (= (ControlFlow 0 145) (- 0 147)) (HasDirectPerm Mask@2 (slot a_2 (- n@0 1)) val)) (=> (HasDirectPerm Mask@2 (slot a_2 (- n@0 1)) val) (=> (and (<= i_6@0 (|Seq#Length| (MapType0Select ExhaleHeap@1 (slot a_2 (- n@0 1)) val))) (state ExhaleHeap@1 Mask@2)) (=> (and (and (not (= (slot a_2 n@0) null)) (= Mask@3 (MapType1Store Mask@2 (slot a_2 n@0) val (real_2_U (+ (U_2_real (MapType1Select Mask@2 (slot a_2 n@0) val)) FullPerm))))) (and (state ExhaleHeap@1 Mask@3) (state ExhaleHeap@1 Mask@3))) (and (=> (= (ControlFlow 0 145) (- 0 146)) (HasDirectPerm Mask@3 (slot a_2 n@0) val)) (=> (HasDirectPerm Mask@3 (slot a_2 n@0) val) (=> (= (|Seq#Length| (MapType0Select ExhaleHeap@1 (slot a_2 n@0) val)) i_6@0) (=> (and (state ExhaleHeap@1 Mask@3) (state ExhaleHeap@1 Mask@3)) (and (and (=> (= (ControlFlow 0 145) 144) anon151_Else_correct) (=> (= (ControlFlow 0 145) 135) anon152_Then_correct)) (=> (= (ControlFlow 0 145) 131) anon152_Else_correct))))))))))))))))))
(let ((anon161_Then_correct true))
(let ((anon104_correct true))
(let ((anon169_Else_correct  (=> (and (not (and (<= 0 j_26) (< j_26 i_6@1))) (= (ControlFlow 0 87) 84)) anon104_correct)))
(let ((anon169_Then_correct  (=> (and (<= 0 j_26) (< j_26 i_6@1)) (and (=> (= (ControlFlow 0 85) (- 0 86)) (valid Heap@5 (|Seq#Index| (MapType0Select Heap@5 (slot a_2 n@0) val) j_26) n@0 true)) (=> (valid Heap@5 (|Seq#Index| (MapType0Select Heap@5 (slot a_2 n@0) val) j_26) n@0 true) (=> (= (ControlFlow 0 85) 84) anon104_correct))))))
(let ((anon168_Else_correct true))
(let ((anon166_Else_correct  (=> (forall ((j_25_1 Int) (n1_6_1 Int) ) (!  (=> (and (= n1_6_1 (- n@0 1)) (and (<= 0 j_25_1) (< j_25_1 (|Seq#Length| (MapType0Select Heap@5 (slot a_2 (- n@0 1)) val))))) (valid Heap@5 (|Seq#Index| (MapType0Select Heap@5 (slot a_2 n1_6_1) val) j_25_1) (- n@0 1) true))
 :qid |stdinbpl.3708:32|
 :skolemid |215|
 :pattern ( (|Seq#Index| (MapType0Select Heap@5 (slot a_2 n1_6_1) val) j_25_1))
)) (and (and (=> (= (ControlFlow 0 88) 83) anon168_Else_correct) (=> (= (ControlFlow 0 88) 85) anon169_Then_correct)) (=> (= (ControlFlow 0 88) 87) anon169_Else_correct)))))
(let ((anon100_correct true))
(let ((anon167_Else_correct  (=> (and (not (and (= n1_5 (- n@0 1)) (and (<= 0 j_24) (< j_24 (|Seq#Length| (MapType0Select Heap@5 (slot a_2 (- n@0 1)) val)))))) (= (ControlFlow 0 82) 79)) anon100_correct)))
(let ((anon167_Then_correct  (=> (and (= n1_5 (- n@0 1)) (and (<= 0 j_24) (< j_24 (|Seq#Length| (MapType0Select Heap@5 (slot a_2 (- n@0 1)) val))))) (and (=> (= (ControlFlow 0 80) (- 0 81)) (valid Heap@5 (|Seq#Index| (MapType0Select Heap@5 (slot a_2 n1_5) val) j_24) (- n@0 1) true)) (=> (valid Heap@5 (|Seq#Index| (MapType0Select Heap@5 (slot a_2 n1_5) val) j_24) (- n@0 1) true) (=> (= (ControlFlow 0 80) 79) anon100_correct))))))
(let ((anon97_correct  (=> (= Mask@9 (MapType1Store Mask@8 (slot a_2 n@0) val (real_2_U (- (U_2_real (MapType1Select Mask@8 (slot a_2 n@0) val)) FullPerm)))) (and (=> (= (ControlFlow 0 89) (- 0 90)) (= (|Seq#Length| (MapType0Select Heap@5 (slot a_2 n@0) val)) i_6@1)) (=> (= (|Seq#Length| (MapType0Select Heap@5 (slot a_2 n@0) val)) i_6@1) (and (and (=> (= (ControlFlow 0 89) 88) anon166_Else_correct) (=> (= (ControlFlow 0 89) 80) anon167_Then_correct)) (=> (= (ControlFlow 0 89) 82) anon167_Else_correct)))))))
(let ((anon165_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 93) 89)) anon97_correct)))
(let ((anon165_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 91) (- 0 92)) (<= FullPerm (U_2_real (MapType1Select Mask@8 (slot a_2 n@0) val)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@8 (slot a_2 n@0) val))) (=> (= (ControlFlow 0 91) 89) anon97_correct))))))
(let ((anon95_correct  (=> (= Mask@8 (MapType1Store Mask@5 (slot a_2 (- n@0 1)) val (real_2_U (- (U_2_real (MapType1Select Mask@5 (slot a_2 (- n@0 1)) val)) perm@4)))) (and (=> (= (ControlFlow 0 94) (- 0 97)) (= (len a_2) 51)) (=> (= (len a_2) 51) (and (=> (= (ControlFlow 0 94) (- 0 96)) (<= 0 i_6@1)) (=> (<= 0 i_6@1) (and (=> (= (ControlFlow 0 94) (- 0 95)) (<= i_6@1 (|Seq#Length| (MapType0Select Heap@5 (slot a_2 (- n@0 1)) val)))) (=> (<= i_6@1 (|Seq#Length| (MapType0Select Heap@5 (slot a_2 (- n@0 1)) val))) (and (=> (= (ControlFlow 0 94) 91) anon165_Then_correct) (=> (= (ControlFlow 0 94) 93) anon165_Else_correct)))))))))))
(let ((anon164_Else_correct  (=> (and (= perm@4 NoPerm) (= (ControlFlow 0 100) 94)) anon95_correct)))
(let ((anon164_Then_correct  (=> (not (= perm@4 NoPerm)) (and (=> (= (ControlFlow 0 98) (- 0 99)) (<= perm@4 (U_2_real (MapType1Select Mask@5 (slot a_2 (- n@0 1)) val)))) (=> (<= perm@4 (U_2_real (MapType1Select Mask@5 (slot a_2 (- n@0 1)) val))) (=> (= (ControlFlow 0 98) 94) anon95_correct))))))
(let ((anon93_correct  (=> (state ExhaleHeap@1 Mask@5) (and (=> (= (ControlFlow 0 101) (- 0 104)) (HasDirectPerm Mask@5 (slot a_2 n@0) val)) (=> (HasDirectPerm Mask@5 (slot a_2 n@0) val) (and (=> (= (ControlFlow 0 101) (- 0 103)) (= FullPerm (U_2_real (MapType1Select Mask@5 (slot a_2 n@0) val)))) (=> (= FullPerm (U_2_real (MapType1Select Mask@5 (slot a_2 n@0) val))) (=> (= Heap@5 (MapType0Store ExhaleHeap@1 (slot a_2 n@0) val (|Seq#Append| (MapType0Select ExhaleHeap@1 (slot a_2 n@0) val) (|Seq#Singleton| soln@2)))) (=> (and (and (state Heap@5 Mask@5) (= i_6@1 (+ i_6@0 1))) (and (state Heap@5 Mask@5) (= perm@4 (/ (to_real 1) (to_real 2))))) (and (=> (= (ControlFlow 0 101) (- 0 102)) (>= perm@4 NoPerm)) (=> (>= perm@4 NoPerm) (and (=> (= (ControlFlow 0 101) 98) anon164_Then_correct) (=> (= (ControlFlow 0 101) 100) anon164_Else_correct)))))))))))))
(let ((anon161_Else_correct  (and (=> (= (ControlFlow 0 112) (- 0 113)) (valid ExhaleHeap@1 soln@0 n@0 true)) (=> (valid ExhaleHeap@1 soln@0 n@0 true) (=> (state ExhaleHeap@1 Mask@5) (=> (and (= soln@2 soln@0) (= (ControlFlow 0 112) 101)) anon93_correct))))))
(let ((anon160_Then_correct  (=> (= (U_2_int (|Seq#Index| oldSoln@0 0)) 0) (and (=> (= (ControlFlow 0 114) (- 0 116)) (< 1 (|Seq#Length| oldSoln@0))) (=> (< 1 (|Seq#Length| oldSoln@0)) (=> (and (= soln@0 (|Seq#Append| (|Seq#Take| oldSoln@0 1) (|Seq#Append| (|Seq#Singleton| (int_2_U (+ (U_2_int (|Seq#Index| oldSoln@0 1)) 1))) (|Seq#Drop| oldSoln@0 2)))) (state ExhaleHeap@1 Mask@5)) (and (=> (= (ControlFlow 0 114) (- 0 115)) (|Seq#Equal| (|Seq#Drop| soln@0 2) (|Seq#Drop| oldSoln@0 2))) (=> (|Seq#Equal| (|Seq#Drop| soln@0 2) (|Seq#Drop| oldSoln@0 2)) (=> (state ExhaleHeap@1 Mask@5) (and (=> (= (ControlFlow 0 114) 111) anon161_Then_correct) (=> (= (ControlFlow 0 114) 112) anon161_Else_correct)))))))))))
(let ((anon163_Else_correct  (and (=> (= (ControlFlow 0 105) (- 0 106)) (valid ExhaleHeap@1 soln@1 n@0 true)) (=> (valid ExhaleHeap@1 soln@1 n@0 true) (=> (state ExhaleHeap@1 Mask@5) (=> (and (= soln@2 soln@1) (= (ControlFlow 0 105) 101)) anon93_correct))))))
(let ((anon163_Then_correct true))
(let ((anon162_Else_correct  (and (=> (= (ControlFlow 0 107) (- 0 108)) (valid ExhaleHeap@1 oldSoln@0 (- n@0 1) false)) (=> (valid ExhaleHeap@1 oldSoln@0 (- n@0 1) false) (=> (state ExhaleHeap@1 Mask@5) (and (=> (= (ControlFlow 0 107) 78) anon163_Then_correct) (=> (= (ControlFlow 0 107) 105) anon163_Else_correct)))))))
(let ((anon162_Then_correct true))
(let ((anon160_Else_correct  (=> (not (= (U_2_int (|Seq#Index| oldSoln@0 0)) 0)) (=> (and (= soln@1 (|Seq#Append| (|Seq#Append| (|Seq#Singleton| (int_2_U 0)) (|Seq#Singleton| (int_2_U 1))) oldSoln@0)) (state ExhaleHeap@1 Mask@5)) (and (=> (= (ControlFlow 0 109) (- 0 110)) (|Seq#Equal| (|Seq#Drop| soln@1 2) oldSoln@0)) (=> (|Seq#Equal| (|Seq#Drop| soln@1 2) oldSoln@0) (=> (state ExhaleHeap@1 Mask@5) (and (=> (= (ControlFlow 0 109) 77) anon162_Then_correct) (=> (= (ControlFlow 0 109) 107) anon162_Else_correct)))))))))
(let ((anon159_Then_correct  (=> (and (state ExhaleHeap@1 ZeroMask) (= perm@2 (/ (to_real 1) (to_real 2)))) (and (=> (= (ControlFlow 0 117) (- 0 123)) (>= perm@2 NoPerm)) (=> (>= perm@2 NoPerm) (=> (=> (> perm@2 NoPerm) (not (= (slot a_2 (- n@0 1)) null))) (=> (and (= Mask@4 (MapType1Store ZeroMask (slot a_2 (- n@0 1)) val (real_2_U (+ (U_2_real (MapType1Select ZeroMask (slot a_2 (- n@0 1)) val)) perm@2)))) (state ExhaleHeap@1 Mask@4)) (=> (and (and (= (len a_2) 51) (<= 0 i_6@0)) (and (<= i_6@0 (|Seq#Length| (MapType0Select ExhaleHeap@1 (slot a_2 (- n@0 1)) val))) (not (= (slot a_2 n@0) null)))) (=> (and (and (and (= Mask@5 (MapType1Store Mask@4 (slot a_2 n@0) val (real_2_U (+ (U_2_real (MapType1Select Mask@4 (slot a_2 n@0) val)) FullPerm)))) (state ExhaleHeap@1 Mask@5)) (and (= (|Seq#Length| (MapType0Select ExhaleHeap@1 (slot a_2 n@0) val)) i_6@0) (state ExhaleHeap@1 Mask@5))) (and (and (forall ((j_22 Int) (n1_4 Int) ) (!  (=> (and (= n1_4 (- n@0 1)) (and (<= 0 j_22) (< j_22 (|Seq#Length| (MapType0Select ExhaleHeap@1 (slot a_2 (- n@0 1)) val))))) (valid ExhaleHeap@1 (|Seq#Index| (MapType0Select ExhaleHeap@1 (slot a_2 n1_4) val) j_22) (- n@0 1) true))
 :qid |stdinbpl.3556:32|
 :skolemid |213|
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@1 (slot a_2 n1_4) val) j_22))
)) (state ExhaleHeap@1 Mask@5)) (and (forall ((j_23 Int) ) (!  (=> (and (<= 0 j_23) (< j_23 i_6@0)) (valid ExhaleHeap@1 (|Seq#Index| (MapType0Select ExhaleHeap@1 (slot a_2 n@0) val) j_23) n@0 true))
 :qid |stdinbpl.3561:32|
 :skolemid |214|
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@1 (slot a_2 n@0) val) j_23))
)) (state ExhaleHeap@1 Mask@5)))) (and (=> (= (ControlFlow 0 117) (- 0 122)) (HasDirectPerm Mask@5 (slot a_2 (- n@0 1)) val)) (=> (HasDirectPerm Mask@5 (slot a_2 (- n@0 1)) val) (=> (and (< i_6@0 (|Seq#Length| (MapType0Select ExhaleHeap@1 (slot a_2 (- n@0 1)) val))) (state ExhaleHeap@1 Mask@5)) (and (=> (= (ControlFlow 0 117) (- 0 121)) (HasDirectPerm Mask@5 (slot a_2 (- n@0 1)) val)) (=> (HasDirectPerm Mask@5 (slot a_2 (- n@0 1)) val) (and (=> (= (ControlFlow 0 117) (- 0 120)) (>= i_6@0 0)) (=> (>= i_6@0 0) (and (=> (= (ControlFlow 0 117) (- 0 119)) (< i_6@0 (|Seq#Length| (MapType0Select ExhaleHeap@1 (slot a_2 (- n@0 1)) val)))) (=> (< i_6@0 (|Seq#Length| (MapType0Select ExhaleHeap@1 (slot a_2 (- n@0 1)) val))) (=> (and (= oldSoln@0 (|Seq#Index| (MapType0Select ExhaleHeap@1 (slot a_2 (- n@0 1)) val) i_6@0)) (state ExhaleHeap@1 Mask@5)) (and (=> (= (ControlFlow 0 117) (- 0 118)) (< 0 (|Seq#Length| oldSoln@0))) (=> (< 0 (|Seq#Length| oldSoln@0)) (and (=> (= (ControlFlow 0 117) 114) anon160_Then_correct) (=> (= (ControlFlow 0 117) 109) anon160_Else_correct)))))))))))))))))))))))
(let ((anon109_correct true))
(let ((anon171_Else_correct  (=> (and (not (and (<= 0 m_5) (and (< m_5 n@1) (and (<= 0 j_30) (< j_30 (|Seq#Length| (MapType0Select ExhaleHeap@1 (slot a_2 m_5) val))))))) (= (ControlFlow 0 69) 66)) anon109_correct)))
(let ((anon171_Then_correct  (=> (and (<= 0 m_5) (and (< m_5 n@1) (and (<= 0 j_30) (< j_30 (|Seq#Length| (MapType0Select ExhaleHeap@1 (slot a_2 m_5) val)))))) (and (=> (= (ControlFlow 0 67) (- 0 68)) (valid ExhaleHeap@1 (|Seq#Index| (MapType0Select ExhaleHeap@1 (slot a_2 m_5) val) j_30) m_5 true)) (=> (valid ExhaleHeap@1 (|Seq#Index| (MapType0Select ExhaleHeap@1 (slot a_2 m_5) val) j_30) m_5 true) (=> (= (ControlFlow 0 67) 66) anon109_correct))))))
(let ((anon170_Else_correct true))
(let ((anon159_Else_correct  (=> (not (< i_6@0 (|Seq#Length| (MapType0Select ExhaleHeap@1 (slot a_2 (- n@0 1)) val)))) (=> (and (state ExhaleHeap@1 Mask@1) (= perm@3 (/ (to_real 1) (to_real 2)))) (and (=> (= (ControlFlow 0 70) (- 0 76)) (>= perm@3 NoPerm)) (=> (>= perm@3 NoPerm) (=> (and (=> (> perm@3 NoPerm) (not (= (slot a_2 (- n@0 1)) null))) (= Mask@6 (MapType1Store Mask@1 (slot a_2 (- n@0 1)) val (real_2_U (+ (U_2_real (MapType1Select Mask@1 (slot a_2 (- n@0 1)) val)) perm@3))))) (=> (and (and (and (and (state ExhaleHeap@1 Mask@6) (= (len a_2) 51)) (and (<= 0 i_6@0) (<= i_6@0 (|Seq#Length| (MapType0Select ExhaleHeap@1 (slot a_2 (- n@0 1)) val))))) (and (and (not (= (slot a_2 n@0) null)) (= Mask@7 (MapType1Store Mask@6 (slot a_2 n@0) val (real_2_U (+ (U_2_real (MapType1Select Mask@6 (slot a_2 n@0) val)) FullPerm))))) (and (state ExhaleHeap@1 Mask@7) (= (|Seq#Length| (MapType0Select ExhaleHeap@1 (slot a_2 n@0) val)) i_6@0)))) (and (and (and (state ExhaleHeap@1 Mask@7) (forall ((j_28 Int) (n1_7 Int) ) (!  (=> (and (= n1_7 (- n@0 1)) (and (<= 0 j_28) (< j_28 (|Seq#Length| (MapType0Select ExhaleHeap@1 (slot a_2 (- n@0 1)) val))))) (valid ExhaleHeap@1 (|Seq#Index| (MapType0Select ExhaleHeap@1 (slot a_2 n1_7) val) j_28) (- n@0 1) true))
 :qid |stdinbpl.3749:30|
 :skolemid |217|
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@1 (slot a_2 n1_7) val) j_28))
))) (and (state ExhaleHeap@1 Mask@7) (forall ((j_29 Int) ) (!  (=> (and (<= 0 j_29) (< j_29 i_6@0)) (valid ExhaleHeap@1 (|Seq#Index| (MapType0Select ExhaleHeap@1 (slot a_2 n@0) val) j_29) n@0 true))
 :qid |stdinbpl.3754:30|
 :skolemid |218|
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@1 (slot a_2 n@0) val) j_29))
)))) (and (and (state ExhaleHeap@1 Mask@7) (state ExhaleHeap@1 Mask@7)) (and (= n@1 (+ n@0 1)) (state ExhaleHeap@1 Mask@7))))) (and (=> (= (ControlFlow 0 70) (- 0 75)) (<= 4 n@1)) (=> (<= 4 n@1) (and (=> (= (ControlFlow 0 70) (- 0 74)) (<= n@1 51)) (=> (<= n@1 51) (and (=> (= (ControlFlow 0 70) (- 0 73)) (= (len a_2) 51)) (=> (= (len a_2) 51) (and (=> (= (ControlFlow 0 70) (- 0 72)) (forall ((i_7 Int) (i_7_1 Int) ) (!  (=> (and (and (and (and (not (= i_7 i_7_1)) (and (<= 0 i_7) (< i_7 (len a_2)))) (and (<= 0 i_7_1) (< i_7_1 (len a_2)))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (slot a_2 i_7) (slot a_2 i_7_1))))
 :qid |stdinbpl.3780:21|
 :skolemid |219|
 :pattern ( (neverTriggered18 i_7) (neverTriggered18 i_7_1))
))) (=> (forall ((i_7@@0 Int) (i_7_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_7@@0 i_7_1@@0)) (and (<= 0 i_7@@0) (< i_7@@0 (len a_2)))) (and (<= 0 i_7_1@@0) (< i_7_1@@0 (len a_2)))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (slot a_2 i_7@@0) (slot a_2 i_7_1@@0))))
 :qid |stdinbpl.3780:21|
 :skolemid |219|
 :pattern ( (neverTriggered18 i_7@@0) (neverTriggered18 i_7_1@@0))
)) (and (=> (= (ControlFlow 0 70) (- 0 71)) (forall ((i_7@@1 Int) ) (!  (=> (and (<= 0 i_7@@1) (< i_7@@1 (len a_2))) (>= (U_2_real (MapType1Select Mask@7 (slot a_2 i_7@@1) val)) FullPerm))
 :qid |stdinbpl.3787:21|
 :skolemid |220|
 :pattern ( (slot a_2 i_7@@1))
 :pattern ( (slot a_2 i_7@@1))
))) (=> (forall ((i_7@@2 Int) ) (!  (=> (and (<= 0 i_7@@2) (< i_7@@2 (len a_2))) (>= (U_2_real (MapType1Select Mask@7 (slot a_2 i_7@@2) val)) FullPerm))
 :qid |stdinbpl.3787:21|
 :skolemid |220|
 :pattern ( (slot a_2 i_7@@2))
 :pattern ( (slot a_2 i_7@@2))
)) (=> (and (and (forall ((i_7@@3 Int) ) (!  (=> (and (and (<= 0 i_7@@3) (< i_7@@3 (len a_2))) (< NoPerm FullPerm)) (and (qpRange18 (slot a_2 i_7@@3)) (= (invRecv18 (slot a_2 i_7@@3)) i_7@@3)))
 :qid |stdinbpl.3793:26|
 :skolemid |221|
 :pattern ( (slot a_2 i_7@@3))
 :pattern ( (slot a_2 i_7@@3))
)) (forall ((o_3@@2 T@U) ) (!  (=> (= (type o_3@@2) RefType) (=> (and (and (<= 0 (invRecv18 o_3@@2)) (< (invRecv18 o_3@@2) (len a_2))) (and (< NoPerm FullPerm) (qpRange18 o_3@@2))) (= (slot a_2 (invRecv18 o_3@@2)) o_3@@2)))
 :qid |stdinbpl.3797:26|
 :skolemid |222|
 :pattern ( (invRecv18 o_3@@2))
))) (and (forall ((o_3@@3 T@U) ) (!  (=> (= (type o_3@@3) RefType) (and (=> (and (and (<= 0 (invRecv18 o_3@@3)) (< (invRecv18 o_3@@3) (len a_2))) (and (< NoPerm FullPerm) (qpRange18 o_3@@3))) (and (= (slot a_2 (invRecv18 o_3@@3)) o_3@@3) (= (U_2_real (MapType1Select QPMask@4 o_3@@3 val)) (- (U_2_real (MapType1Select Mask@7 o_3@@3 val)) FullPerm)))) (=> (not (and (and (<= 0 (invRecv18 o_3@@3)) (< (invRecv18 o_3@@3) (len a_2))) (and (< NoPerm FullPerm) (qpRange18 o_3@@3)))) (= (U_2_real (MapType1Select QPMask@4 o_3@@3 val)) (U_2_real (MapType1Select Mask@7 o_3@@3 val))))))
 :qid |stdinbpl.3803:26|
 :skolemid |223|
 :pattern ( (MapType1Select QPMask@4 o_3@@3 val))
)) (forall ((o_3@@4 T@U) (f_5@@0 T@U) ) (! (let ((B@@12 (FieldTypeInv1 (type f_5@@0))))
(let ((A@@13 (FieldTypeInv0 (type f_5@@0))))
 (=> (and (and (= (type o_3@@4) RefType) (= (type f_5@@0) (FieldType A@@13 B@@12))) (not (= f_5@@0 val))) (= (U_2_real (MapType1Select Mask@7 o_3@@4 f_5@@0)) (U_2_real (MapType1Select QPMask@4 o_3@@4 f_5@@0))))))
 :qid |stdinbpl.3809:33|
 :skolemid |224|
 :pattern ( (MapType1Select QPMask@4 o_3@@4 f_5@@0))
)))) (and (and (=> (= (ControlFlow 0 70) 65) anon170_Else_correct) (=> (= (ControlFlow 0 70) 67) anon171_Then_correct)) (=> (= (ControlFlow 0 70) 69) anon171_Else_correct)))))))))))))))))))))
(let ((anon148_Else_correct  (=> (and (forall ((j_17_1 Int) ) (!  (=> (and (<= 0 j_17_1) (< j_17_1 0)) (valid Heap@4 (|Seq#Index| (MapType0Select Heap@4 (slot a_2 n@0) val) j_17_1) n@0 true))
 :qid |stdinbpl.3437:32|
 :skolemid |210|
 :pattern ( (|Seq#Index| (MapType0Select Heap@4 (slot a_2 n@0) val) j_17_1))
)) (IdenticalOnKnownLocations Heap@4 ExhaleHeap@1 Mask@1)) (and (and (=> (= (ControlFlow 0 149) 145) anon150_Then_correct) (=> (= (ControlFlow 0 149) 117) anon159_Then_correct)) (=> (= (ControlFlow 0 149) 70) anon159_Else_correct)))))
(let ((anon67_correct true))
(let ((anon149_Else_correct  (=> (and (not (and (<= 0 j_16) (< j_16 0))) (= (ControlFlow 0 64) 61)) anon67_correct)))
(let ((anon149_Then_correct  (=> (and (<= 0 j_16) (< j_16 0)) (and (=> (= (ControlFlow 0 62) (- 0 63)) (valid Heap@4 (|Seq#Index| (MapType0Select Heap@4 (slot a_2 n@0) val) j_16) n@0 true)) (=> (valid Heap@4 (|Seq#Index| (MapType0Select Heap@4 (slot a_2 n@0) val) j_16) n@0 true) (=> (= (ControlFlow 0 62) 61) anon67_correct))))))
(let ((anon146_Else_correct  (=> (forall ((j_15_1 Int) (n1_1_1 Int) ) (!  (=> (and (= n1_1_1 (- n@0 1)) (and (<= 0 j_15_1) (< j_15_1 (|Seq#Length| (MapType0Select Heap@4 (slot a_2 (- n@0 1)) val))))) (valid Heap@4 (|Seq#Index| (MapType0Select Heap@4 (slot a_2 n1_1_1) val) j_15_1) (- n@0 1) true))
 :qid |stdinbpl.3426:32|
 :skolemid |209|
 :pattern ( (|Seq#Index| (MapType0Select Heap@4 (slot a_2 n1_1_1) val) j_15_1))
)) (and (and (=> (= (ControlFlow 0 150) 149) anon148_Else_correct) (=> (= (ControlFlow 0 150) 62) anon149_Then_correct)) (=> (= (ControlFlow 0 150) 64) anon149_Else_correct)))))
(let ((anon63_correct true))
(let ((anon147_Else_correct  (=> (and (not (and (= n1 (- n@0 1)) (and (<= 0 j_14) (< j_14 (|Seq#Length| (MapType0Select Heap@4 (slot a_2 (- n@0 1)) val)))))) (= (ControlFlow 0 60) 57)) anon63_correct)))
(let ((anon147_Then_correct  (=> (and (= n1 (- n@0 1)) (and (<= 0 j_14) (< j_14 (|Seq#Length| (MapType0Select Heap@4 (slot a_2 (- n@0 1)) val))))) (and (=> (= (ControlFlow 0 58) (- 0 59)) (valid Heap@4 (|Seq#Index| (MapType0Select Heap@4 (slot a_2 n1) val) j_14) (- n@0 1) true)) (=> (valid Heap@4 (|Seq#Index| (MapType0Select Heap@4 (slot a_2 n1) val) j_14) (- n@0 1) true) (=> (= (ControlFlow 0 58) 57) anon63_correct))))))
(let ((anon60_correct  (=> (= Mask@1 (MapType1Store Mask@0 (slot a_2 n@0) val (real_2_U (- (U_2_real (MapType1Select Mask@0 (slot a_2 n@0) val)) FullPerm)))) (and (=> (= (ControlFlow 0 151) (- 0 152)) (= (|Seq#Length| (MapType0Select Heap@4 (slot a_2 n@0) val)) 0)) (=> (= (|Seq#Length| (MapType0Select Heap@4 (slot a_2 n@0) val)) 0) (and (and (=> (= (ControlFlow 0 151) 150) anon146_Else_correct) (=> (= (ControlFlow 0 151) 58) anon147_Then_correct)) (=> (= (ControlFlow 0 151) 60) anon147_Else_correct)))))))
(let ((anon145_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 155) 151)) anon60_correct)))
(let ((anon145_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 153) (- 0 154)) (<= FullPerm (U_2_real (MapType1Select Mask@0 (slot a_2 n@0) val)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@0 (slot a_2 n@0) val))) (=> (= (ControlFlow 0 153) 151) anon60_correct))))))
(let ((anon58_correct  (=> (= Mask@0 (MapType1Store QPMask@2 (slot a_2 (- n@0 1)) val (real_2_U (- (U_2_real (MapType1Select QPMask@2 (slot a_2 (- n@0 1)) val)) perm@0)))) (and (=> (= (ControlFlow 0 156) (- 0 159)) (= (len a_2) 51)) (=> (= (len a_2) 51) (and (=> (= (ControlFlow 0 156) (- 0 158)) (<= 0 0)) (=> (<= 0 0) (and (=> (= (ControlFlow 0 156) (- 0 157)) (<= 0 (|Seq#Length| (MapType0Select Heap@4 (slot a_2 (- n@0 1)) val)))) (=> (<= 0 (|Seq#Length| (MapType0Select Heap@4 (slot a_2 (- n@0 1)) val))) (and (=> (= (ControlFlow 0 156) 153) anon145_Then_correct) (=> (= (ControlFlow 0 156) 155) anon145_Else_correct)))))))))))
(let ((anon144_Else_correct  (=> (and (= perm@0 NoPerm) (= (ControlFlow 0 162) 156)) anon58_correct)))
(let ((anon144_Then_correct  (=> (not (= perm@0 NoPerm)) (and (=> (= (ControlFlow 0 160) (- 0 161)) (<= perm@0 (U_2_real (MapType1Select QPMask@2 (slot a_2 (- n@0 1)) val)))) (=> (<= perm@0 (U_2_real (MapType1Select QPMask@2 (slot a_2 (- n@0 1)) val))) (=> (= (ControlFlow 0 160) 156) anon58_correct))))))
(let ((anon143_Then_correct  (=> (and (and (state ExhaleHeap@0 ZeroMask) (<= 4 n@0)) (and (<= n@0 51) (= (len a_2) 51))) (and (=> (= (ControlFlow 0 163) (- 0 166)) (forall ((i_5 Int) (i_5_1 Int) ) (!  (=> (and (and (and (and (not (= i_5 i_5_1)) (and (<= 0 i_5) (< i_5 (len a_2)))) (and (<= 0 i_5_1) (< i_5_1 (len a_2)))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (slot a_2 i_5) (slot a_2 i_5_1))))
 :qid |stdinbpl.3336:19|
 :skolemid |202|
))) (=> (forall ((i_5@@0 Int) (i_5_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_5@@0 i_5_1@@0)) (and (<= 0 i_5@@0) (< i_5@@0 (len a_2)))) (and (<= 0 i_5_1@@0) (< i_5_1@@0 (len a_2)))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (slot a_2 i_5@@0) (slot a_2 i_5_1@@0))))
 :qid |stdinbpl.3336:19|
 :skolemid |202|
)) (=> (forall ((i_5@@1 Int) ) (!  (=> (and (and (<= 0 i_5@@1) (< i_5@@1 (len a_2))) (< NoPerm FullPerm)) (and (qpRange17 (slot a_2 i_5@@1)) (= (invRecv17 (slot a_2 i_5@@1)) i_5@@1)))
 :qid |stdinbpl.3342:26|
 :skolemid |203|
 :pattern ( (slot a_2 i_5@@1))
 :pattern ( (slot a_2 i_5@@1))
)) (=> (and (forall ((o_3@@5 T@U) ) (!  (=> (= (type o_3@@5) RefType) (=> (and (and (and (<= 0 (invRecv17 o_3@@5)) (< (invRecv17 o_3@@5) (len a_2))) (< NoPerm FullPerm)) (qpRange17 o_3@@5)) (= (slot a_2 (invRecv17 o_3@@5)) o_3@@5)))
 :qid |stdinbpl.3346:26|
 :skolemid |204|
 :pattern ( (invRecv17 o_3@@5))
)) (forall ((i_5@@2 Int) ) (!  (=> (and (<= 0 i_5@@2) (< i_5@@2 (len a_2))) (not (= (slot a_2 i_5@@2) null)))
 :qid |stdinbpl.3352:26|
 :skolemid |205|
 :pattern ( (slot a_2 i_5@@2))
 :pattern ( (slot a_2 i_5@@2))
))) (=> (and (and (and (forall ((o_3@@6 T@U) ) (!  (=> (= (type o_3@@6) RefType) (and (=> (and (and (and (<= 0 (invRecv17 o_3@@6)) (< (invRecv17 o_3@@6) (len a_2))) (< NoPerm FullPerm)) (qpRange17 o_3@@6)) (and (=> (< NoPerm FullPerm) (= (slot a_2 (invRecv17 o_3@@6)) o_3@@6)) (= (U_2_real (MapType1Select QPMask@2 o_3@@6 val)) (+ (U_2_real (MapType1Select ZeroMask o_3@@6 val)) FullPerm)))) (=> (not (and (and (and (<= 0 (invRecv17 o_3@@6)) (< (invRecv17 o_3@@6) (len a_2))) (< NoPerm FullPerm)) (qpRange17 o_3@@6))) (= (U_2_real (MapType1Select QPMask@2 o_3@@6 val)) (U_2_real (MapType1Select ZeroMask o_3@@6 val))))))
 :qid |stdinbpl.3358:26|
 :skolemid |206|
 :pattern ( (MapType1Select QPMask@2 o_3@@6 val))
)) (forall ((o_3@@7 T@U) (f_5@@1 T@U) ) (! (let ((B@@13 (FieldTypeInv1 (type f_5@@1))))
(let ((A@@14 (FieldTypeInv0 (type f_5@@1))))
 (=> (and (and (= (type o_3@@7) RefType) (= (type f_5@@1) (FieldType A@@14 B@@13))) (not (= f_5@@1 val))) (= (U_2_real (MapType1Select ZeroMask o_3@@7 f_5@@1)) (U_2_real (MapType1Select QPMask@2 o_3@@7 f_5@@1))))))
 :qid |stdinbpl.3362:33|
 :skolemid |207|
 :pattern ( (MapType1Select ZeroMask o_3@@7 f_5@@1))
 :pattern ( (MapType1Select QPMask@2 o_3@@7 f_5@@1))
))) (and (state ExhaleHeap@0 QPMask@2) (state ExhaleHeap@0 QPMask@2))) (and (and (forall ((m_4 Int) (j_13 Int) ) (!  (=> (and (<= 0 m_4) (and (< m_4 n@0) (and (<= 0 j_13) (< j_13 (|Seq#Length| (MapType0Select ExhaleHeap@0 (slot a_2 m_4) val)))))) (valid ExhaleHeap@0 (|Seq#Index| (MapType0Select ExhaleHeap@0 (slot a_2 m_4) val) j_13) m_4 true))
 :qid |stdinbpl.3369:24|
 :skolemid |208|
 :pattern ( (|Seq#Length| (MapType0Select ExhaleHeap@0 (slot a_2 m_4) val)) (|Seq#Index| (MapType0Select ExhaleHeap@0 (slot a_2 m_4) val) j_13))
 :pattern ( (|Seq#Length| (MapType0Select ExhaleHeap@0 (slot a_2 m_4) val)) (|valid#frame| EmptyFrame (|Seq#Index| (MapType0Select ExhaleHeap@0 (slot a_2 m_4) val) j_13) m_4 true))
 :pattern ( (|valid#frame| EmptyFrame (|Seq#Index| (MapType0Select ExhaleHeap@0 (slot a_2 m_4) val) j_13) m_4 true))
)) (state ExhaleHeap@0 QPMask@2)) (and (<= n@0 50) (state ExhaleHeap@0 QPMask@2)))) (and (=> (= (ControlFlow 0 163) (- 0 165)) (= FullPerm (U_2_real (MapType1Select QPMask@2 (slot a_2 n@0) val)))) (=> (= FullPerm (U_2_real (MapType1Select QPMask@2 (slot a_2 n@0) val))) (=> (and (and (= Heap@4 (MapType0Store ExhaleHeap@0 (slot a_2 n@0) val (|Seq#Empty| (SeqType intType)))) (state Heap@4 QPMask@2)) (and (state Heap@4 QPMask@2) (= perm@0 (/ (to_real 1) (to_real 2))))) (and (=> (= (ControlFlow 0 163) (- 0 164)) (>= perm@0 NoPerm)) (=> (>= perm@0 NoPerm) (and (=> (= (ControlFlow 0 163) 160) anon144_Then_correct) (=> (= (ControlFlow 0 163) 162) anon144_Else_correct)))))))))))))))
(let ((anon143_Else_correct  (=> (and (not (<= n@0 50)) (state ExhaleHeap@0 QPMask@1)) (=> (and (and (<= 4 n@0) (<= n@0 51)) (and (= (len a_2) 51) (= (ControlFlow 0 56) (- 0 55)))) (forall ((i_8 Int) (i_8_1 Int) ) (!  (=> (and (and (and (and (not (= i_8 i_8_1)) (and (<= 0 i_8) (< i_8 (len a_2)))) (and (<= 0 i_8_1) (< i_8_1 (len a_2)))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (slot a_2 i_8) (slot a_2 i_8_1))))
 :qid |stdinbpl.3841:17|
 :skolemid |226|
))))))
(let ((anon133_Else_correct  (=> (and (forall ((m_1_1 Int) (j_10_1 Int) ) (!  (=> (and (<= 0 m_1_1) (and (< m_1_1 4) (and (<= 0 j_10_1) (< j_10_1 (|Seq#Length| (MapType0Select Heap@3 (slot a_2 m_1_1) val)))))) (valid Heap@3 (|Seq#Index| (MapType0Select Heap@3 (slot a_2 m_1_1) val) j_10_1) m_1_1 true))
 :qid |stdinbpl.3230:24|
 :skolemid |194|
 :pattern ( (|Seq#Length| (MapType0Select Heap@3 (slot a_2 m_1_1) val)) (|Seq#Index| (MapType0Select Heap@3 (slot a_2 m_1_1) val) j_10_1))
 :pattern ( (|Seq#Length| (MapType0Select Heap@3 (slot a_2 m_1_1) val)) (|valid#frame| EmptyFrame (|Seq#Index| (MapType0Select Heap@3 (slot a_2 m_1_1) val) j_10_1) m_1_1 true))
 :pattern ( (|valid#frame| EmptyFrame (|Seq#Index| (MapType0Select Heap@3 (slot a_2 m_1_1) val) j_10_1) m_1_1 true))
)) (IdenticalOnKnownLocations Heap@3 ExhaleHeap@0 QPMask@1)) (and (and (=> (= (ControlFlow 0 186) 185) anon135_Then_correct) (=> (= (ControlFlow 0 186) 163) anon143_Then_correct)) (=> (= (ControlFlow 0 186) 56) anon143_Else_correct)))))
(let ((anon41_correct true))
(let ((anon134_Else_correct  (=> (and (not (and (<= 0 m@@8) (and (< m@@8 4) (and (<= 0 j_9) (< j_9 (|Seq#Length| (MapType0Select Heap@3 (slot a_2 m@@8) val))))))) (= (ControlFlow 0 54) 51)) anon41_correct)))
(let ((anon134_Then_correct  (=> (and (<= 0 m@@8) (and (< m@@8 4) (and (<= 0 j_9) (< j_9 (|Seq#Length| (MapType0Select Heap@3 (slot a_2 m@@8) val)))))) (and (=> (= (ControlFlow 0 52) (- 0 53)) (valid Heap@3 (|Seq#Index| (MapType0Select Heap@3 (slot a_2 m@@8) val) j_9) m@@8 true)) (=> (valid Heap@3 (|Seq#Index| (MapType0Select Heap@3 (slot a_2 m@@8) val) j_9) m@@8 true) (=> (= (ControlFlow 0 52) 51) anon41_correct))))))
(let ((anon131_Else_correct  (=> (forall ((j_8_1 Int) ) (!  (=> (and (<= 0 j_8_1) (< j_8_1 (|Seq#Length| (MapType0Select Heap@3 (slot a_2 3) val)))) (valid Heap@3 (|Seq#Index| (MapType0Select Heap@3 (slot a_2 3) val) j_8_1) 3 true))
 :qid |stdinbpl.3159:20|
 :skolemid |187|
 :pattern ( (|valid#frame| EmptyFrame (|Seq#Index| (MapType0Select Heap@3 (slot a_2 3) val) j_8_1) 3 true))
)) (=> (and (state Heap@3 QPMask@0) (state Heap@3 QPMask@0)) (and (=> (= (ControlFlow 0 187) (- 0 192)) (<= 4 4)) (=> (<= 4 4) (and (=> (= (ControlFlow 0 187) (- 0 191)) (<= 4 51)) (=> (<= 4 51) (and (=> (= (ControlFlow 0 187) (- 0 190)) (= (len a_2) 51)) (=> (= (len a_2) 51) (and (=> (= (ControlFlow 0 187) (- 0 189)) (forall ((i_2 Int) (i_2_1 Int) ) (!  (=> (and (and (and (and (not (= i_2 i_2_1)) (and (<= 0 i_2) (< i_2 (len a_2)))) (and (<= 0 i_2_1) (< i_2_1 (len a_2)))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (slot a_2 i_2) (slot a_2 i_2_1))))
 :qid |stdinbpl.3189:21|
 :skolemid |188|
 :pattern ( (neverTriggered15 i_2) (neverTriggered15 i_2_1))
))) (=> (forall ((i_2@@0 Int) (i_2_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_2@@0 i_2_1@@0)) (and (<= 0 i_2@@0) (< i_2@@0 (len a_2)))) (and (<= 0 i_2_1@@0) (< i_2_1@@0 (len a_2)))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (slot a_2 i_2@@0) (slot a_2 i_2_1@@0))))
 :qid |stdinbpl.3189:21|
 :skolemid |188|
 :pattern ( (neverTriggered15 i_2@@0) (neverTriggered15 i_2_1@@0))
)) (and (=> (= (ControlFlow 0 187) (- 0 188)) (forall ((i_2@@1 Int) ) (!  (=> (and (<= 0 i_2@@1) (< i_2@@1 (len a_2))) (>= (U_2_real (MapType1Select QPMask@0 (slot a_2 i_2@@1) val)) FullPerm))
 :qid |stdinbpl.3196:21|
 :skolemid |189|
 :pattern ( (slot a_2 i_2@@1))
 :pattern ( (slot a_2 i_2@@1))
))) (=> (forall ((i_2@@2 Int) ) (!  (=> (and (<= 0 i_2@@2) (< i_2@@2 (len a_2))) (>= (U_2_real (MapType1Select QPMask@0 (slot a_2 i_2@@2) val)) FullPerm))
 :qid |stdinbpl.3196:21|
 :skolemid |189|
 :pattern ( (slot a_2 i_2@@2))
 :pattern ( (slot a_2 i_2@@2))
)) (=> (and (and (forall ((i_2@@3 Int) ) (!  (=> (and (and (<= 0 i_2@@3) (< i_2@@3 (len a_2))) (< NoPerm FullPerm)) (and (qpRange15 (slot a_2 i_2@@3)) (= (invRecv15 (slot a_2 i_2@@3)) i_2@@3)))
 :qid |stdinbpl.3202:26|
 :skolemid |190|
 :pattern ( (slot a_2 i_2@@3))
 :pattern ( (slot a_2 i_2@@3))
)) (forall ((o_3@@8 T@U) ) (!  (=> (= (type o_3@@8) RefType) (=> (and (and (<= 0 (invRecv15 o_3@@8)) (< (invRecv15 o_3@@8) (len a_2))) (and (< NoPerm FullPerm) (qpRange15 o_3@@8))) (= (slot a_2 (invRecv15 o_3@@8)) o_3@@8)))
 :qid |stdinbpl.3206:26|
 :skolemid |191|
 :pattern ( (invRecv15 o_3@@8))
))) (and (forall ((o_3@@9 T@U) ) (!  (=> (= (type o_3@@9) RefType) (and (=> (and (and (<= 0 (invRecv15 o_3@@9)) (< (invRecv15 o_3@@9) (len a_2))) (and (< NoPerm FullPerm) (qpRange15 o_3@@9))) (and (= (slot a_2 (invRecv15 o_3@@9)) o_3@@9) (= (U_2_real (MapType1Select QPMask@1 o_3@@9 val)) (- (U_2_real (MapType1Select QPMask@0 o_3@@9 val)) FullPerm)))) (=> (not (and (and (<= 0 (invRecv15 o_3@@9)) (< (invRecv15 o_3@@9) (len a_2))) (and (< NoPerm FullPerm) (qpRange15 o_3@@9)))) (= (U_2_real (MapType1Select QPMask@1 o_3@@9 val)) (U_2_real (MapType1Select QPMask@0 o_3@@9 val))))))
 :qid |stdinbpl.3212:26|
 :skolemid |192|
 :pattern ( (MapType1Select QPMask@1 o_3@@9 val))
)) (forall ((o_3@@10 T@U) (f_5@@2 T@U) ) (! (let ((B@@14 (FieldTypeInv1 (type f_5@@2))))
(let ((A@@15 (FieldTypeInv0 (type f_5@@2))))
 (=> (and (and (= (type o_3@@10) RefType) (= (type f_5@@2) (FieldType A@@15 B@@14))) (not (= f_5@@2 val))) (= (U_2_real (MapType1Select QPMask@0 o_3@@10 f_5@@2)) (U_2_real (MapType1Select QPMask@1 o_3@@10 f_5@@2))))))
 :qid |stdinbpl.3218:33|
 :skolemid |193|
 :pattern ( (MapType1Select QPMask@1 o_3@@10 f_5@@2))
)))) (and (and (=> (= (ControlFlow 0 187) 186) anon133_Else_correct) (=> (= (ControlFlow 0 187) 52) anon134_Then_correct)) (=> (= (ControlFlow 0 187) 54) anon134_Else_correct)))))))))))))))))
(let ((anon37_correct true))
(let ((anon132_Else_correct  (=> (and (not (and (<= 0 j_7) (< j_7 (|Seq#Length| (MapType0Select Heap@3 (slot a_2 3) val))))) (= (ControlFlow 0 50) 47)) anon37_correct)))
(let ((anon132_Then_correct  (=> (and (<= 0 j_7) (< j_7 (|Seq#Length| (MapType0Select Heap@3 (slot a_2 3) val)))) (and (=> (= (ControlFlow 0 48) (- 0 49)) (valid Heap@3 (|Seq#Index| (MapType0Select Heap@3 (slot a_2 3) val) j_7) 3 true)) (=> (valid Heap@3 (|Seq#Index| (MapType0Select Heap@3 (slot a_2 3) val) j_7) 3 true) (=> (= (ControlFlow 0 48) 47) anon37_correct))))))
(let ((anon130_Then_correct true))
(let ((anon33_correct true))
(let ((anon129_Then_correct  (=> (and (<= 0 j_33) (< j_33 (|Seq#Length| (MapType0Select Heap@3 (slot a_2 3) val)))) (and (=> (= (ControlFlow 0 40) (- 0 43)) (HasDirectPerm QPMask@0 (slot a_2 3) val)) (=> (HasDirectPerm QPMask@0 (slot a_2 3) val) (and (=> (= (ControlFlow 0 40) (- 0 42)) (>= j_33 0)) (=> (>= j_33 0) (and (=> (= (ControlFlow 0 40) (- 0 41)) (< j_33 (|Seq#Length| (MapType0Select Heap@3 (slot a_2 3) val)))) (=> (< j_33 (|Seq#Length| (MapType0Select Heap@3 (slot a_2 3) val))) (and (=> (= (ControlFlow 0 40) 39) anon130_Then_correct) (=> (= (ControlFlow 0 40) 37) anon33_correct)))))))))))
(let ((anon129_Else_correct  (=> (and (not (and (<= 0 j_33) (< j_33 (|Seq#Length| (MapType0Select Heap@3 (slot a_2 3) val))))) (= (ControlFlow 0 38) 37)) anon33_correct)))
(let ((anon128_Else_correct  (=> (< j_33 0) (and (=> (= (ControlFlow 0 46) 40) anon129_Then_correct) (=> (= (ControlFlow 0 46) 38) anon129_Else_correct)))))
(let ((anon128_Then_correct  (=> (<= 0 j_33) (and (=> (= (ControlFlow 0 44) (- 0 45)) (HasDirectPerm QPMask@0 (slot a_2 3) val)) (=> (HasDirectPerm QPMask@0 (slot a_2 3) val) (and (=> (= (ControlFlow 0 44) 40) anon129_Then_correct) (=> (= (ControlFlow 0 44) 38) anon129_Else_correct)))))))
(let ((anon125_Else_correct  (=> (and (forall ((j_5_1 Int) ) (!  (=> (and (<= 0 j_5_1) (< j_5_1 (|Seq#Length| (MapType0Select Heap@2 (slot a_2 2) val)))) (valid Heap@2 (|Seq#Index| (MapType0Select Heap@2 (slot a_2 2) val) j_5_1) 2 true))
 :qid |stdinbpl.3107:20|
 :skolemid |186|
 :pattern ( (|valid#frame| EmptyFrame (|Seq#Index| (MapType0Select Heap@2 (slot a_2 2) val) j_5_1) 2 true))
)) (state Heap@2 QPMask@0)) (and (=> (= (ControlFlow 0 193) (- 0 195)) (= FullPerm (U_2_real (MapType1Select QPMask@0 (slot a_2 3) val)))) (=> (= FullPerm (U_2_real (MapType1Select QPMask@0 (slot a_2 3) val))) (=> (and (= Heap@3 (MapType0Store Heap@2 (slot a_2 3) val (|Seq#Append| (|Seq#Singleton| (|Seq#Append| (|Seq#Singleton| (int_2_U 0)) (|Seq#Singleton| (int_2_U 3)))) (|Seq#Singleton| (|Seq#Singleton| (int_2_U 3)))))) (state Heap@3 QPMask@0)) (and (=> (= (ControlFlow 0 193) (- 0 194)) (|Seq#Equal| (|Seq#Drop| (|Seq#Append| (|Seq#Singleton| (int_2_U 0)) (|Seq#Singleton| (int_2_U 3))) 2) (|Seq#Empty| intType))) (=> (|Seq#Equal| (|Seq#Drop| (|Seq#Append| (|Seq#Singleton| (int_2_U 0)) (|Seq#Singleton| (int_2_U 3))) 2) (|Seq#Empty| intType)) (=> (state Heap@3 QPMask@0) (and (and (and (and (=> (= (ControlFlow 0 193) 187) anon131_Else_correct) (=> (= (ControlFlow 0 193) 48) anon132_Then_correct)) (=> (= (ControlFlow 0 193) 50) anon132_Else_correct)) (=> (= (ControlFlow 0 193) 44) anon128_Then_correct)) (=> (= (ControlFlow 0 193) 46) anon128_Else_correct)))))))))))
(let ((anon26_correct true))
(let ((anon126_Else_correct  (=> (and (not (and (<= 0 j_4) (< j_4 (|Seq#Length| (MapType0Select Heap@2 (slot a_2 2) val))))) (= (ControlFlow 0 36) 33)) anon26_correct)))
(let ((anon126_Then_correct  (=> (and (<= 0 j_4) (< j_4 (|Seq#Length| (MapType0Select Heap@2 (slot a_2 2) val)))) (and (=> (= (ControlFlow 0 34) (- 0 35)) (valid Heap@2 (|Seq#Index| (MapType0Select Heap@2 (slot a_2 2) val) j_4) 2 true)) (=> (valid Heap@2 (|Seq#Index| (MapType0Select Heap@2 (slot a_2 2) val) j_4) 2 true) (=> (= (ControlFlow 0 34) 33) anon26_correct))))))
(let ((anon124_Then_correct true))
(let ((anon22_correct true))
(let ((anon123_Then_correct  (=> (and (<= 0 j_31) (< j_31 (|Seq#Length| (MapType0Select Heap@2 (slot a_2 2) val)))) (and (=> (= (ControlFlow 0 26) (- 0 29)) (HasDirectPerm QPMask@0 (slot a_2 2) val)) (=> (HasDirectPerm QPMask@0 (slot a_2 2) val) (and (=> (= (ControlFlow 0 26) (- 0 28)) (>= j_31 0)) (=> (>= j_31 0) (and (=> (= (ControlFlow 0 26) (- 0 27)) (< j_31 (|Seq#Length| (MapType0Select Heap@2 (slot a_2 2) val)))) (=> (< j_31 (|Seq#Length| (MapType0Select Heap@2 (slot a_2 2) val))) (and (=> (= (ControlFlow 0 26) 25) anon124_Then_correct) (=> (= (ControlFlow 0 26) 23) anon22_correct)))))))))))
(let ((anon123_Else_correct  (=> (and (not (and (<= 0 j_31) (< j_31 (|Seq#Length| (MapType0Select Heap@2 (slot a_2 2) val))))) (= (ControlFlow 0 24) 23)) anon22_correct)))
(let ((anon122_Else_correct  (=> (< j_31 0) (and (=> (= (ControlFlow 0 32) 26) anon123_Then_correct) (=> (= (ControlFlow 0 32) 24) anon123_Else_correct)))))
(let ((anon122_Then_correct  (=> (<= 0 j_31) (and (=> (= (ControlFlow 0 30) (- 0 31)) (HasDirectPerm QPMask@0 (slot a_2 2) val)) (=> (HasDirectPerm QPMask@0 (slot a_2 2) val) (and (=> (= (ControlFlow 0 30) 26) anon123_Then_correct) (=> (= (ControlFlow 0 30) 24) anon123_Else_correct)))))))
(let ((anon119_Else_correct  (=> (and (forall ((j_2_1 Int) ) (!  (=> (and (<= 0 j_2_1) (< j_2_1 (|Seq#Length| (MapType0Select Heap@1 (slot a_2 1) val)))) (and (|Seq#Equal| (|Seq#Index| (MapType0Select Heap@1 (slot a_2 1) val) j_2_1) (|Seq#Append| (|Seq#Singleton| (int_2_U 0)) (|Seq#Singleton| (int_2_U 1)))) (valid Heap@1 (|Seq#Index| (MapType0Select Heap@1 (slot a_2 1) val) j_2_1) 1 true)))
 :qid |stdinbpl.3055:20|
 :skolemid |185|
 :pattern ( (|valid#frame| EmptyFrame (|Seq#Index| (MapType0Select Heap@1 (slot a_2 1) val) j_2_1) 1 true))
)) (state Heap@1 QPMask@0)) (and (=> (= (ControlFlow 0 196) (- 0 198)) (= FullPerm (U_2_real (MapType1Select QPMask@0 (slot a_2 2) val)))) (=> (= FullPerm (U_2_real (MapType1Select QPMask@0 (slot a_2 2) val))) (=> (and (= Heap@2 (MapType0Store Heap@1 (slot a_2 2) val (|Seq#Singleton| (|Seq#Append| (|Seq#Singleton| (int_2_U 0)) (|Seq#Singleton| (int_2_U 2)))))) (state Heap@2 QPMask@0)) (and (=> (= (ControlFlow 0 196) (- 0 197)) (|Seq#Equal| (|Seq#Drop| (|Seq#Append| (|Seq#Singleton| (int_2_U 0)) (|Seq#Singleton| (int_2_U 2))) 2) (|Seq#Empty| intType))) (=> (|Seq#Equal| (|Seq#Drop| (|Seq#Append| (|Seq#Singleton| (int_2_U 0)) (|Seq#Singleton| (int_2_U 2))) 2) (|Seq#Empty| intType)) (=> (state Heap@2 QPMask@0) (and (and (and (and (=> (= (ControlFlow 0 196) 193) anon125_Else_correct) (=> (= (ControlFlow 0 196) 34) anon126_Then_correct)) (=> (= (ControlFlow 0 196) 36) anon126_Else_correct)) (=> (= (ControlFlow 0 196) 30) anon122_Then_correct)) (=> (= (ControlFlow 0 196) 32) anon122_Else_correct)))))))))))
(let ((anon15_correct true))
(let ((anon120_Else_correct  (=> (and (not (and (<= 0 j_1) (< j_1 (|Seq#Length| (MapType0Select Heap@1 (slot a_2 1) val))))) (= (ControlFlow 0 22) 18)) anon15_correct)))
(let ((anon120_Then_correct  (=> (and (<= 0 j_1) (< j_1 (|Seq#Length| (MapType0Select Heap@1 (slot a_2 1) val)))) (and (=> (= (ControlFlow 0 19) (- 0 21)) (|Seq#Equal| (|Seq#Index| (MapType0Select Heap@1 (slot a_2 1) val) j_1) (|Seq#Append| (|Seq#Singleton| (int_2_U 0)) (|Seq#Singleton| (int_2_U 1))))) (=> (|Seq#Equal| (|Seq#Index| (MapType0Select Heap@1 (slot a_2 1) val) j_1) (|Seq#Append| (|Seq#Singleton| (int_2_U 0)) (|Seq#Singleton| (int_2_U 1)))) (and (=> (= (ControlFlow 0 19) (- 0 20)) (valid Heap@1 (|Seq#Index| (MapType0Select Heap@1 (slot a_2 1) val) j_1) 1 true)) (=> (valid Heap@1 (|Seq#Index| (MapType0Select Heap@1 (slot a_2 1) val) j_1) 1 true) (=> (= (ControlFlow 0 19) 18) anon15_correct))))))))
(let ((anon118_Then_correct true))
(let ((anon11_correct true))
(let ((anon117_Then_correct  (=> (|Seq#Equal| (|Seq#Index| (MapType0Select Heap@1 (slot a_2 1) val) j_27) (|Seq#Append| (|Seq#Singleton| (int_2_U 0)) (|Seq#Singleton| (int_2_U 1)))) (and (=> (= (ControlFlow 0 7) (- 0 10)) (HasDirectPerm QPMask@0 (slot a_2 1) val)) (=> (HasDirectPerm QPMask@0 (slot a_2 1) val) (and (=> (= (ControlFlow 0 7) (- 0 9)) (>= j_27 0)) (=> (>= j_27 0) (and (=> (= (ControlFlow 0 7) (- 0 8)) (< j_27 (|Seq#Length| (MapType0Select Heap@1 (slot a_2 1) val)))) (=> (< j_27 (|Seq#Length| (MapType0Select Heap@1 (slot a_2 1) val))) (and (=> (= (ControlFlow 0 7) 6) anon118_Then_correct) (=> (= (ControlFlow 0 7) 3) anon11_correct)))))))))))
(let ((anon117_Else_correct  (=> (and (not (|Seq#Equal| (|Seq#Index| (MapType0Select Heap@1 (slot a_2 1) val) j_27) (|Seq#Append| (|Seq#Singleton| (int_2_U 0)) (|Seq#Singleton| (int_2_U 1))))) (= (ControlFlow 0 5) 3)) anon11_correct)))
(let ((anon116_Then_correct  (=> (and (<= 0 j_27) (< j_27 (|Seq#Length| (MapType0Select Heap@1 (slot a_2 1) val)))) (and (=> (= (ControlFlow 0 11) (- 0 14)) (HasDirectPerm QPMask@0 (slot a_2 1) val)) (=> (HasDirectPerm QPMask@0 (slot a_2 1) val) (and (=> (= (ControlFlow 0 11) (- 0 13)) (>= j_27 0)) (=> (>= j_27 0) (and (=> (= (ControlFlow 0 11) (- 0 12)) (< j_27 (|Seq#Length| (MapType0Select Heap@1 (slot a_2 1) val)))) (=> (< j_27 (|Seq#Length| (MapType0Select Heap@1 (slot a_2 1) val))) (and (=> (= (ControlFlow 0 11) 7) anon117_Then_correct) (=> (= (ControlFlow 0 11) 5) anon117_Else_correct)))))))))))
(let ((anon116_Else_correct  (=> (and (not (and (<= 0 j_27) (< j_27 (|Seq#Length| (MapType0Select Heap@1 (slot a_2 1) val))))) (= (ControlFlow 0 4) 3)) anon11_correct)))
(let ((anon115_Else_correct  (=> (< j_27 0) (and (=> (= (ControlFlow 0 17) 11) anon116_Then_correct) (=> (= (ControlFlow 0 17) 4) anon116_Else_correct)))))
(let ((anon115_Then_correct  (=> (<= 0 j_27) (and (=> (= (ControlFlow 0 15) (- 0 16)) (HasDirectPerm QPMask@0 (slot a_2 1) val)) (=> (HasDirectPerm QPMask@0 (slot a_2 1) val) (and (=> (= (ControlFlow 0 15) 11) anon116_Then_correct) (=> (= (ControlFlow 0 15) 4) anon116_Else_correct)))))))
(let ((anon113_Else_correct  (and (=> (= (ControlFlow 0 199) (- 0 201)) (valid Heap@1 (|Seq#Empty| intType) 0 false)) (=> (valid Heap@1 (|Seq#Empty| intType) 0 false) (=> (state Heap@1 QPMask@0) (and (=> (= (ControlFlow 0 199) (- 0 200)) (|Seq#Equal| (|Seq#Drop| (|Seq#Append| (|Seq#Singleton| (int_2_U 0)) (|Seq#Singleton| (int_2_U 1))) 2) (|Seq#Empty| intType))) (=> (|Seq#Equal| (|Seq#Drop| (|Seq#Append| (|Seq#Singleton| (int_2_U 0)) (|Seq#Singleton| (int_2_U 1))) 2) (|Seq#Empty| intType)) (=> (state Heap@1 QPMask@0) (and (and (and (and (=> (= (ControlFlow 0 199) 196) anon119_Else_correct) (=> (= (ControlFlow 0 199) 19) anon120_Then_correct)) (=> (= (ControlFlow 0 199) 22) anon120_Else_correct)) (=> (= (ControlFlow 0 199) 15) anon115_Then_correct)) (=> (= (ControlFlow 0 199) 17) anon115_Else_correct))))))))))
(let ((anon113_Then_correct true))
(let ((anon112_Else_correct  (and (=> (= (ControlFlow 0 202) (- 0 205)) (forall ((i_1 Int) (i_1_1 Int) ) (!  (=> (and (and (and (and (not (= i_1 i_1_1)) (and (<= 0 i_1) (< i_1 (len a_2)))) (and (<= 0 i_1_1) (< i_1_1 (len a_2)))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (slot a_2 i_1) (slot a_2 i_1_1))))
 :qid |stdinbpl.2939:15|
 :skolemid |179|
))) (=> (forall ((i_1@@0 Int) (i_1_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_1@@0 i_1_1@@0)) (and (<= 0 i_1@@0) (< i_1@@0 (len a_2)))) (and (<= 0 i_1_1@@0) (< i_1_1@@0 (len a_2)))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (slot a_2 i_1@@0) (slot a_2 i_1_1@@0))))
 :qid |stdinbpl.2939:15|
 :skolemid |179|
)) (=> (forall ((i_1@@1 Int) ) (!  (=> (and (and (<= 0 i_1@@1) (< i_1@@1 (len a_2))) (< NoPerm FullPerm)) (and (qpRange14 (slot a_2 i_1@@1)) (= (invRecv14 (slot a_2 i_1@@1)) i_1@@1)))
 :qid |stdinbpl.2945:22|
 :skolemid |180|
 :pattern ( (slot a_2 i_1@@1))
 :pattern ( (slot a_2 i_1@@1))
)) (=> (and (forall ((o_3@@11 T@U) ) (!  (=> (= (type o_3@@11) RefType) (=> (and (and (and (<= 0 (invRecv14 o_3@@11)) (< (invRecv14 o_3@@11) (len a_2))) (< NoPerm FullPerm)) (qpRange14 o_3@@11)) (= (slot a_2 (invRecv14 o_3@@11)) o_3@@11)))
 :qid |stdinbpl.2949:22|
 :skolemid |181|
 :pattern ( (invRecv14 o_3@@11))
)) (forall ((i_1@@2 Int) ) (!  (=> (and (<= 0 i_1@@2) (< i_1@@2 (len a_2))) (not (= (slot a_2 i_1@@2) null)))
 :qid |stdinbpl.2955:22|
 :skolemid |182|
 :pattern ( (slot a_2 i_1@@2))
 :pattern ( (slot a_2 i_1@@2))
))) (=> (and (and (forall ((o_3@@12 T@U) ) (!  (=> (= (type o_3@@12) RefType) (and (=> (and (and (and (<= 0 (invRecv14 o_3@@12)) (< (invRecv14 o_3@@12) (len a_2))) (< NoPerm FullPerm)) (qpRange14 o_3@@12)) (and (=> (< NoPerm FullPerm) (= (slot a_2 (invRecv14 o_3@@12)) o_3@@12)) (= (U_2_real (MapType1Select QPMask@0 o_3@@12 val)) (+ (U_2_real (MapType1Select ZeroMask o_3@@12 val)) FullPerm)))) (=> (not (and (and (and (<= 0 (invRecv14 o_3@@12)) (< (invRecv14 o_3@@12) (len a_2))) (< NoPerm FullPerm)) (qpRange14 o_3@@12))) (= (U_2_real (MapType1Select QPMask@0 o_3@@12 val)) (U_2_real (MapType1Select ZeroMask o_3@@12 val))))))
 :qid |stdinbpl.2961:22|
 :skolemid |183|
 :pattern ( (MapType1Select QPMask@0 o_3@@12 val))
)) (forall ((o_3@@13 T@U) (f_5@@3 T@U) ) (! (let ((B@@15 (FieldTypeInv1 (type f_5@@3))))
(let ((A@@16 (FieldTypeInv0 (type f_5@@3))))
 (=> (and (and (= (type o_3@@13) RefType) (= (type f_5@@3) (FieldType A@@16 B@@15))) (not (= f_5@@3 val))) (= (U_2_real (MapType1Select ZeroMask o_3@@13 f_5@@3)) (U_2_real (MapType1Select QPMask@0 o_3@@13 f_5@@3))))))
 :qid |stdinbpl.2965:29|
 :skolemid |184|
 :pattern ( (MapType1Select ZeroMask o_3@@13 f_5@@3))
 :pattern ( (MapType1Select QPMask@0 o_3@@13 f_5@@3))
))) (and (state Heap@@13 QPMask@0) (state Heap@@13 QPMask@0))) (and (=> (= (ControlFlow 0 202) (- 0 204)) (= FullPerm (U_2_real (MapType1Select QPMask@0 (slot a_2 0) val)))) (=> (= FullPerm (U_2_real (MapType1Select QPMask@0 (slot a_2 0) val))) (=> (and (= Heap@0 (MapType0Store Heap@@13 (slot a_2 0) val (|Seq#Singleton| (|Seq#Empty| intType)))) (state Heap@0 QPMask@0)) (and (=> (= (ControlFlow 0 202) (- 0 203)) (= FullPerm (U_2_real (MapType1Select QPMask@0 (slot a_2 1) val)))) (=> (= FullPerm (U_2_real (MapType1Select QPMask@0 (slot a_2 1) val))) (=> (and (= Heap@1 (MapType0Store Heap@0 (slot a_2 1) val (|Seq#Singleton| (|Seq#Append| (|Seq#Singleton| (int_2_U 0)) (|Seq#Singleton| (int_2_U 1)))))) (state Heap@1 QPMask@0)) (and (=> (= (ControlFlow 0 202) 2) anon113_Then_correct) (=> (= (ControlFlow 0 202) 199) anon113_Else_correct)))))))))))))))
(let ((anon112_Then_correct true))
(let ((anon0_correct  (=> (and (and (state Heap@@13 ZeroMask) (= AssumeFunctionsAbove (- 0 1))) (and (= (len a_2) 51) (state Heap@@13 ZeroMask))) (and (=> (= (ControlFlow 0 206) 1) anon112_Then_correct) (=> (= (ControlFlow 0 206) 202) anon112_Else_correct)))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 207) 206) anon0_correct)))
PreconditionGeneratedEntry_correct)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
))
(check-sat)
(pop 1)
; Valid
(get-info :rlimit)
