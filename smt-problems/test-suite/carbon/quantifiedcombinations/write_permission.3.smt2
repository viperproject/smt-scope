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
(declare-fun f_7 () T@U)
(declare-fun g () T@U)
(declare-fun FieldType (T@T T@T) T@T)
(declare-fun FieldTypeInv0 (T@T) T@T)
(declare-fun FieldTypeInv1 (T@T) T@T)
(declare-fun NormalFieldType () T@T)
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
(declare-fun state (T@U T@U) Bool)
(declare-fun MapType1Type (T@T T@T) T@T)
(declare-fun GoodMask (T@U) Bool)
(declare-fun MapType1TypeInv0 (T@T) T@T)
(declare-fun MapType1TypeInv1 (T@T) T@T)
(declare-fun MapType1Select (T@U T@U T@U) T@U)
(declare-fun MapType1Store (T@U T@U T@U T@U) T@U)
(declare-fun p2 (T@U Int) T@U)
(declare-fun IsPredicateField (T@U) Bool)
(declare-fun PredicateType_p2Type () T@T)
(declare-fun FrameTypeType () T@T)
(declare-fun |p2#trigger| (T@U T@U) Bool)
(declare-fun |p2#everUsed| (T@U) Bool)
(declare-fun |Seq#Index| (T@U Int) T@U)
(declare-fun |Seq#Sub| (Int Int) Int)
(declare-fun |Seq#Add| (Int Int) Int)
(declare-fun IdenticalOnKnownLocations (T@U T@U T@U) Bool)
(declare-fun null () T@U)
(declare-fun PredicateMaskField (T@U) T@U)
(declare-fun HasDirectPerm (T@U T@U T@U) Bool)
(declare-fun IsWandField (T@U) Bool)
(declare-fun WandMaskField (T@U) T@U)
(declare-fun p_1 (T@U) T@U)
(declare-fun PredicateType_pType () T@T)
(declare-fun |p#trigger| (T@U T@U) Bool)
(declare-fun |p#everUsed| (T@U) Bool)
(declare-fun |Seq#Update| (T@U Int T@U) T@U)
(declare-fun |Seq#Take| (T@U Int) T@U)
(declare-fun |Seq#Contains| (T@U T@U) Bool)
(declare-fun |Seq#Range| (Int Int) T@U)
(declare-fun |Seq#Skolem| (T@U T@U) Int)
(declare-fun |Seq#Singleton| (T@U) T@U)
(declare-fun |p2#sm| (T@U Int) T@U)
(declare-fun |p#sm| (T@U) T@U)
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
(declare-fun getPredWandId (T@U) Int)
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
(assert  (and (and (and (and (and (and (forall ((arg0@@11 T@T) (arg1 T@T) ) (! (= (Ctor (FieldType arg0@@11 arg1)) 6)
 :qid |ctor:FieldType|
)) (forall ((arg0@@12 T@T) (arg1@@0 T@T) ) (! (= (FieldTypeInv0 (FieldType arg0@@12 arg1@@0)) arg0@@12)
 :qid |typeInv:FieldTypeInv0|
 :pattern ( (FieldType arg0@@12 arg1@@0))
))) (forall ((arg0@@13 T@T) (arg1@@1 T@T) ) (! (= (FieldTypeInv1 (FieldType arg0@@13 arg1@@1)) arg1@@1)
 :qid |typeInv:FieldTypeInv1|
 :pattern ( (FieldType arg0@@13 arg1@@1))
))) (= (Ctor NormalFieldType) 7)) (= (type $allocated) (FieldType NormalFieldType boolType))) (= (type f_7) (FieldType NormalFieldType intType))) (= (type g) (FieldType NormalFieldType intType))))
(assert (distinct $allocated f_7 g)
)
(assert  (and (and (forall ((arg0@@14 T@T) ) (! (= (Ctor (SeqType arg0@@14)) 8)
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
 :qid |stdinbpl.391:18|
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
(assert  (and (and (= (Ctor PredicateType_p2Type) 12) (= (Ctor FrameTypeType) 13)) (forall ((arg0@@26 T@U) (arg1@@10 Int) ) (! (= (type (p2 arg0@@26 arg1@@10)) (FieldType PredicateType_p2Type FrameTypeType))
 :qid |funType:p2|
 :pattern ( (p2 arg0@@26 arg1@@10))
))))
(assert (forall ((r_1 T@U) (i Int) ) (!  (=> (= (type r_1) RefType) (IsPredicateField (p2 r_1 i)))
 :qid |stdinbpl.732:15|
 :skolemid |65|
 :pattern ( (p2 r_1 i))
)))
(assert (forall ((Heap@@0 T@U) (r_1@@0 T@U) (i@@0 Int) ) (!  (=> (and (= (type Heap@@0) (MapType0Type RefType)) (= (type r_1@@0) RefType)) (|p2#everUsed| (p2 r_1@@0 i@@0)))
 :qid |stdinbpl.751:15|
 :skolemid |69|
 :pattern ( (|p2#trigger| Heap@@0 (p2 r_1@@0 i@@0)))
)))
(assert (forall ((arg0@@27 T@U) (arg1@@11 Int) ) (! (let ((T@@1 (SeqTypeInv0 (type arg0@@27))))
(= (type (|Seq#Index| arg0@@27 arg1@@11)) T@@1))
 :qid |funType:Seq#Index|
 :pattern ( (|Seq#Index| arg0@@27 arg1@@11))
)))
(assert (forall ((s@@0 T@U) (n@@0 Int) (j Int) ) (! (let ((T@@2 (SeqTypeInv0 (type s@@0))))
 (=> (= (type s@@0) (SeqType T@@2)) (=> (and (and (< 0 n@@0) (<= 0 j)) (< j (- (|Seq#Length| s@@0) n@@0))) (and (= (|Seq#Sub| (|Seq#Add| j n@@0) n@@0) j) (= (|Seq#Index| (|Seq#Drop| s@@0 n@@0) j) (|Seq#Index| s@@0 (|Seq#Add| j n@@0)))))))
 :qid |stdinbpl.412:18|
 :skolemid |39|
 :pattern ( (|Seq#Index| (|Seq#Drop| s@@0 n@@0) j))
)))
(assert  (and (= (type null) RefType) (forall ((arg0@@28 T@U) ) (! (let ((A (FieldTypeInv0 (type arg0@@28))))
(= (type (PredicateMaskField arg0@@28)) (FieldType A (MapType1Type RefType boolType))))
 :qid |funType:PredicateMaskField|
 :pattern ( (PredicateMaskField arg0@@28))
))))
(assert (forall ((Heap@@1 T@U) (ExhaleHeap T@U) (Mask@@0 T@U) (pm_f T@U) ) (! (let ((C (FieldTypeInv0 (type pm_f))))
 (=> (and (and (and (and (and (= (type Heap@@1) (MapType0Type RefType)) (= (type ExhaleHeap) (MapType0Type RefType))) (= (type Mask@@0) (MapType1Type RefType realType))) (= (type pm_f) (FieldType C FrameTypeType))) (IdenticalOnKnownLocations Heap@@1 ExhaleHeap Mask@@0)) (and (HasDirectPerm Mask@@0 null pm_f) (IsPredicateField pm_f))) (= (MapType0Select Heap@@1 null (PredicateMaskField pm_f)) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))))
 :qid |stdinbpl.47:19|
 :skolemid |2|
 :pattern ( (IdenticalOnKnownLocations Heap@@1 ExhaleHeap Mask@@0) (IsPredicateField pm_f) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))
)))
(assert (forall ((arg0@@29 T@U) ) (! (let ((A@@0 (FieldTypeInv0 (type arg0@@29))))
(= (type (WandMaskField arg0@@29)) (FieldType A@@0 (MapType1Type RefType boolType))))
 :qid |funType:WandMaskField|
 :pattern ( (WandMaskField arg0@@29))
)))
(assert (forall ((Heap@@2 T@U) (ExhaleHeap@@0 T@U) (Mask@@1 T@U) (pm_f@@0 T@U) ) (! (let ((C@@0 (FieldTypeInv0 (type pm_f@@0))))
 (=> (and (and (and (and (and (= (type Heap@@2) (MapType0Type RefType)) (= (type ExhaleHeap@@0) (MapType0Type RefType))) (= (type Mask@@1) (MapType1Type RefType realType))) (= (type pm_f@@0) (FieldType C@@0 FrameTypeType))) (IdenticalOnKnownLocations Heap@@2 ExhaleHeap@@0 Mask@@1)) (and (HasDirectPerm Mask@@1 null pm_f@@0) (IsWandField pm_f@@0))) (= (MapType0Select Heap@@2 null (WandMaskField pm_f@@0)) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))))
 :qid |stdinbpl.60:19|
 :skolemid |5|
 :pattern ( (IdenticalOnKnownLocations Heap@@2 ExhaleHeap@@0 Mask@@1) (IsWandField pm_f@@0) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))
)))
(assert  (and (= (Ctor PredicateType_pType) 14) (forall ((arg0@@30 T@U) ) (! (= (type (p_1 arg0@@30)) (FieldType PredicateType_pType FrameTypeType))
 :qid |funType:p_1|
 :pattern ( (p_1 arg0@@30))
))))
(assert (forall ((r_1@@1 T@U) ) (!  (=> (= (type r_1@@1) RefType) (IsPredicateField (p_1 r_1@@1)))
 :qid |stdinbpl.679:15|
 :skolemid |59|
 :pattern ( (p_1 r_1@@1))
)))
(assert (forall ((Heap@@3 T@U) (r_1@@2 T@U) ) (!  (=> (and (= (type Heap@@3) (MapType0Type RefType)) (= (type r_1@@2) RefType)) (|p#everUsed| (p_1 r_1@@2)))
 :qid |stdinbpl.698:15|
 :skolemid |63|
 :pattern ( (|p#trigger| Heap@@3 (p_1 r_1@@2)))
)))
(assert (forall ((arg0@@31 T@U) (arg1@@12 Int) (arg2@@3 T@U) ) (! (let ((T@@3 (type arg2@@3)))
(= (type (|Seq#Update| arg0@@31 arg1@@12 arg2@@3)) (SeqType T@@3)))
 :qid |funType:Seq#Update|
 :pattern ( (|Seq#Update| arg0@@31 arg1@@12 arg2@@3))
)))
(assert (forall ((s@@1 T@U) (i@@1 Int) (v T@U) (n@@1 Int) ) (! (let ((T@@4 (type v)))
 (=> (= (type s@@1) (SeqType T@@4)) (=> (and (<= 0 n@@1) (< n@@1 (|Seq#Length| s@@1))) (and (=> (= i@@1 n@@1) (= (|Seq#Index| (|Seq#Update| s@@1 i@@1 v) n@@1) v)) (=> (not (= i@@1 n@@1)) (= (|Seq#Index| (|Seq#Update| s@@1 i@@1 v) n@@1) (|Seq#Index| s@@1 n@@1)))))))
 :qid |stdinbpl.367:18|
 :skolemid |35|
 :pattern ( (|Seq#Index| (|Seq#Update| s@@1 i@@1 v) n@@1))
 :pattern ( (|Seq#Index| s@@1 n@@1) (|Seq#Update| s@@1 i@@1 v))
)))
(assert (forall ((arg0@@32 T@U) (arg1@@13 Int) ) (! (let ((T@@5 (SeqTypeInv0 (type arg0@@32))))
(= (type (|Seq#Take| arg0@@32 arg1@@13)) (SeqType T@@5)))
 :qid |funType:Seq#Take|
 :pattern ( (|Seq#Take| arg0@@32 arg1@@13))
)))
(assert (forall ((s@@2 T@U) (n@@2 Int) ) (! (let ((T@@6 (SeqTypeInv0 (type s@@2))))
 (=> (= (type s@@2) (SeqType T@@6)) (and (=> (<= 0 n@@2) (and (=> (<= n@@2 (|Seq#Length| s@@2)) (= (|Seq#Length| (|Seq#Take| s@@2 n@@2)) n@@2)) (=> (< (|Seq#Length| s@@2) n@@2) (= (|Seq#Length| (|Seq#Take| s@@2 n@@2)) (|Seq#Length| s@@2))))) (=> (< n@@2 0) (= (|Seq#Length| (|Seq#Take| s@@2 n@@2)) 0)))))
 :qid |stdinbpl.378:18|
 :skolemid |36|
 :pattern ( (|Seq#Length| (|Seq#Take| s@@2 n@@2)))
 :pattern ( (|Seq#Take| s@@2 n@@2) (|Seq#Length| s@@2))
)))
(assert (forall ((arg0@@33 Int) (arg1@@14 Int) ) (! (= (type (|Seq#Range| arg0@@33 arg1@@14)) (SeqType intType))
 :qid |funType:Seq#Range|
 :pattern ( (|Seq#Range| arg0@@33 arg1@@14))
)))
(assert (forall ((q@min Int) (q@max Int) (v@@0 T@U) ) (!  (=> (= (type v@@0) intType) (= (|Seq#Contains| (|Seq#Range| q@min q@max) v@@0)  (and (<= q@min (U_2_int v@@0)) (< (U_2_int v@@0) q@max))))
 :qid |stdinbpl.651:15|
 :skolemid |57|
 :pattern ( (|Seq#Contains| (|Seq#Range| q@min q@max) v@@0))
)))
(assert (forall ((s@@3 T@U) (x@@8 T@U) ) (! (let ((T@@7 (type x@@8)))
 (=> (and (= (type s@@3) (SeqType T@@7)) (|Seq#Contains| s@@3 x@@8)) (and (and (<= 0 (|Seq#Skolem| s@@3 x@@8)) (< (|Seq#Skolem| s@@3 x@@8) (|Seq#Length| s@@3))) (= (|Seq#Index| s@@3 (|Seq#Skolem| s@@3 x@@8)) x@@8))))
 :qid |stdinbpl.509:18|
 :skolemid |47|
 :pattern ( (|Seq#Contains| s@@3 x@@8))
)))
(assert (forall ((Heap@@4 T@U) (ExhaleHeap@@1 T@U) (Mask@@2 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@4) (MapType0Type RefType)) (= (type ExhaleHeap@@1) (MapType0Type RefType))) (= (type Mask@@2) (MapType1Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@4 ExhaleHeap@@1 Mask@@2)) (U_2_bool (MapType0Select Heap@@4 o_1 $allocated))) (U_2_bool (MapType0Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.73:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@4 ExhaleHeap@@1 Mask@@2) (MapType0Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert (forall ((s@@4 T@U) (n@@3 Int) ) (! (let ((T@@8 (SeqTypeInv0 (type s@@4))))
 (=> (and (= (type s@@4) (SeqType T@@8)) (<= n@@3 0)) (= (|Seq#Drop| s@@4 n@@3) s@@4)))
 :qid |stdinbpl.493:18|
 :skolemid |45|
 :pattern ( (|Seq#Drop| s@@4 n@@3))
)))
(assert (forall ((i@@2 Int) (j@@0 Int) ) (! (= (|Seq#Sub| i@@2 j@@0) (- i@@2 j@@0))
 :qid |stdinbpl.347:15|
 :skolemid |30|
 :pattern ( (|Seq#Sub| i@@2 j@@0))
)))
(assert (forall ((i@@3 Int) (j@@1 Int) ) (! (= (|Seq#Add| i@@3 j@@1) (+ i@@3 j@@1))
 :qid |stdinbpl.345:15|
 :skolemid |29|
 :pattern ( (|Seq#Add| i@@3 j@@1))
)))
(assert (forall ((arg0@@34 T@U) ) (! (let ((T@@9 (type arg0@@34)))
(= (type (|Seq#Singleton| arg0@@34)) (SeqType T@@9)))
 :qid |funType:Seq#Singleton|
 :pattern ( (|Seq#Singleton| arg0@@34))
)))
(assert (forall ((x@@9 T@U) (y@@1 T@U) ) (! (let ((T@@10 (type x@@9)))
 (=> (= (type y@@1) T@@10) (= (|Seq#Contains| (|Seq#Singleton| x@@9) y@@1) (= x@@9 y@@1))))
 :qid |stdinbpl.634:18|
 :skolemid |54|
 :pattern ( (|Seq#Contains| (|Seq#Singleton| x@@9) y@@1))
)))
(assert (forall ((r_1@@3 T@U) (i@@4 Int) (r2 T@U) (i2 Int) ) (!  (=> (and (and (= (type r_1@@3) RefType) (= (type r2) RefType)) (= (p2 r_1@@3 i@@4) (p2 r2 i2))) (and (= r_1@@3 r2) (= i@@4 i2)))
 :qid |stdinbpl.742:15|
 :skolemid |67|
 :pattern ( (p2 r_1@@3 i@@4) (p2 r2 i2))
)))
(assert (forall ((arg0@@35 T@U) (arg1@@15 Int) ) (! (= (type (|p2#sm| arg0@@35 arg1@@15)) (FieldType PredicateType_p2Type (MapType1Type RefType boolType)))
 :qid |funType:p2#sm|
 :pattern ( (|p2#sm| arg0@@35 arg1@@15))
)))
(assert (forall ((r_1@@4 T@U) (i@@5 Int) (r2@@0 T@U) (i2@@0 Int) ) (!  (=> (and (and (= (type r_1@@4) RefType) (= (type r2@@0) RefType)) (= (|p2#sm| r_1@@4 i@@5) (|p2#sm| r2@@0 i2@@0))) (and (= r_1@@4 r2@@0) (= i@@5 i2@@0)))
 :qid |stdinbpl.746:15|
 :skolemid |68|
 :pattern ( (|p2#sm| r_1@@4 i@@5) (|p2#sm| r2@@0 i2@@0))
)))
(assert (forall ((s@@5 T@U) (n@@4 Int) (j@@2 Int) ) (! (let ((T@@11 (SeqTypeInv0 (type s@@5))))
 (=> (= (type s@@5) (SeqType T@@11)) (=> (and (and (<= 0 j@@2) (< j@@2 n@@4)) (< j@@2 (|Seq#Length| s@@5))) (= (|Seq#Index| (|Seq#Take| s@@5 n@@4) j@@2) (|Seq#Index| s@@5 j@@2)))))
 :qid |stdinbpl.386:18|
 :skolemid |37|
 :pattern ( (|Seq#Index| (|Seq#Take| s@@5 n@@4) j@@2))
 :pattern ( (|Seq#Index| s@@5 j@@2) (|Seq#Take| s@@5 n@@4))
)))
(assert (forall ((r_1@@5 T@U) (r2@@1 T@U) ) (!  (=> (and (and (= (type r_1@@5) RefType) (= (type r2@@1) RefType)) (= (p_1 r_1@@5) (p_1 r2@@1))) (= r_1@@5 r2@@1))
 :qid |stdinbpl.689:15|
 :skolemid |61|
 :pattern ( (p_1 r_1@@5) (p_1 r2@@1))
)))
(assert (forall ((arg0@@36 T@U) ) (! (= (type (|p#sm| arg0@@36)) (FieldType PredicateType_pType (MapType1Type RefType boolType)))
 :qid |funType:p#sm|
 :pattern ( (|p#sm| arg0@@36))
)))
(assert (forall ((r_1@@6 T@U) (r2@@2 T@U) ) (!  (=> (and (and (= (type r_1@@6) RefType) (= (type r2@@2) RefType)) (= (|p#sm| r_1@@6) (|p#sm| r2@@2))) (= r_1@@6 r2@@2))
 :qid |stdinbpl.693:15|
 :skolemid |62|
 :pattern ( (|p#sm| r_1@@6) (|p#sm| r2@@2))
)))
(assert (forall ((Heap@@5 T@U) (ExhaleHeap@@2 T@U) (Mask@@3 T@U) (o_1@@0 T@U) (f_2 T@U) ) (! (let ((B@@1 (FieldTypeInv1 (type f_2))))
(let ((A@@1 (FieldTypeInv0 (type f_2))))
 (=> (and (and (and (and (and (and (= (type Heap@@5) (MapType0Type RefType)) (= (type ExhaleHeap@@2) (MapType0Type RefType))) (= (type Mask@@3) (MapType1Type RefType realType))) (= (type o_1@@0) RefType)) (= (type f_2) (FieldType A@@1 B@@1))) (IdenticalOnKnownLocations Heap@@5 ExhaleHeap@@2 Mask@@3)) (HasDirectPerm Mask@@3 o_1@@0 f_2)) (= (MapType0Select Heap@@5 o_1@@0 f_2) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2)))))
 :qid |stdinbpl.42:22|
 :skolemid |1|
 :pattern ( (IdenticalOnKnownLocations Heap@@5 ExhaleHeap@@2 Mask@@3) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2))
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
 :qid |stdinbpl.290:19|
 :skolemid |21|
 :pattern ( (InsidePredicate p v_1 p w))
)))
(assert (forall ((arg0@@37 T@U) (arg1@@16 T@U) ) (! (let ((T@@14 (SeqTypeInv0 (type arg0@@37))))
(= (type (|Seq#Append| arg0@@37 arg1@@16)) (SeqType T@@14)))
 :qid |funType:Seq#Append|
 :pattern ( (|Seq#Append| arg0@@37 arg1@@16))
)))
(assert (forall ((s0 T@U) (s1 T@U) (n@@5 Int) ) (! (let ((T@@15 (SeqTypeInv0 (type s0))))
 (=> (and (= (type s0) (SeqType T@@15)) (= (type s1) (SeqType T@@15))) (=> (and (and (and (not (= s0 (|Seq#Empty| T@@15))) (not (= s1 (|Seq#Empty| T@@15)))) (<= (|Seq#Length| s0) n@@5)) (< n@@5 (|Seq#Length| (|Seq#Append| s0 s1)))) (and (= (|Seq#Add| (|Seq#Sub| n@@5 (|Seq#Length| s0)) (|Seq#Length| s0)) n@@5) (= (|Seq#Index| (|Seq#Append| s0 s1) n@@5) (|Seq#Index| s1 (|Seq#Sub| n@@5 (|Seq#Length| s0))))))))
 :qid |stdinbpl.358:18|
 :skolemid |32|
 :pattern ( (|Seq#Index| (|Seq#Append| s0 s1) n@@5))
)))
(assert  (not (IsPredicateField f_7)))
(assert  (not (IsWandField f_7)))
(assert  (not (IsPredicateField g)))
(assert  (not (IsWandField g)))
(assert (forall ((Heap@@6 T@U) (ExhaleHeap@@3 T@U) (Mask@@4 T@U) ) (!  (=> (and (and (and (= (type Heap@@6) (MapType0Type RefType)) (= (type ExhaleHeap@@3) (MapType0Type RefType))) (= (type Mask@@4) (MapType1Type RefType realType))) (IdenticalOnKnownLocations Heap@@6 ExhaleHeap@@3 Mask@@4)) (succHeap Heap@@6 ExhaleHeap@@3))
 :qid |stdinbpl.83:15|
 :skolemid |10|
 :pattern ( (IdenticalOnKnownLocations Heap@@6 ExhaleHeap@@3 Mask@@4))
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
(assert  (and (forall ((arg0@@38 Real) (arg1@@17 T@U) ) (! (= (type (ConditionalFrame arg0@@38 arg1@@17)) FrameTypeType)
 :qid |funType:ConditionalFrame|
 :pattern ( (ConditionalFrame arg0@@38 arg1@@17))
)) (= (type EmptyFrame) FrameTypeType)))
(assert (forall ((p@@0 Real) (f_6 T@U) ) (!  (=> (= (type f_6) FrameTypeType) (= (ConditionalFrame p@@0 f_6) (ite (> p@@0 0.0) f_6 EmptyFrame)))
 :qid |stdinbpl.278:15|
 :skolemid |19|
 :pattern ( (ConditionalFrame p@@0 f_6))
)))
(assert (forall ((q@min@@0 Int) (q@max@@0 Int) (j@@3 Int) ) (!  (=> (and (<= 0 j@@3) (< j@@3 (- q@max@@0 q@min@@0))) (= (U_2_int (|Seq#Index| (|Seq#Range| q@min@@0 q@max@@0) j@@3)) (+ q@min@@0 j@@3)))
 :qid |stdinbpl.649:15|
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
 :qid |stdinbpl.327:18|
 :skolemid |26|
 :pattern ( (|Seq#Length| (|Seq#Append| s0@@0 s1@@0)))
)))
(assert (forall ((s@@6 T@U) (t T@U) (n@@6 Int) ) (! (let ((T@@17 (SeqTypeInv0 (type s@@6))))
 (=> (and (and (= (type s@@6) (SeqType T@@17)) (= (type t) (SeqType T@@17))) (and (> n@@6 0) (> n@@6 (|Seq#Length| s@@6)))) (and (= (|Seq#Add| (|Seq#Sub| n@@6 (|Seq#Length| s@@6)) (|Seq#Length| s@@6)) n@@6) (= (|Seq#Drop| (|Seq#Append| s@@6 t) n@@6) (|Seq#Drop| t (|Seq#Sub| n@@6 (|Seq#Length| s@@6)))))))
 :qid |stdinbpl.483:18|
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
 :qid |stdinbpl.470:18|
 :skolemid |42|
 :pattern ( (|Seq#Take| (|Seq#Append| s@@7 t@@0) n@@7))
)))
(assert (forall ((q@min@@1 Int) (q@max@@1 Int) ) (!  (and (=> (< q@min@@1 q@max@@1) (= (|Seq#Length| (|Seq#Range| q@min@@1 q@max@@1)) (- q@max@@1 q@min@@1))) (=> (<= q@max@@1 q@min@@1) (= (|Seq#Length| (|Seq#Range| q@min@@1 q@max@@1)) 0)))
 :qid |stdinbpl.648:15|
 :skolemid |55|
 :pattern ( (|Seq#Length| (|Seq#Range| q@min@@1 q@max@@1)))
)))
(assert (forall ((a T@U) (b T@U) ) (! (let ((T@@19 (SeqTypeInv0 (type a))))
 (=> (and (and (= (type a) (SeqType T@@19)) (= (type b) (SeqType T@@19))) (|Seq#Equal| a b)) (= a b)))
 :qid |stdinbpl.621:18|
 :skolemid |53|
 :pattern ( (|Seq#Equal| a b))
)))
(assert (forall ((s@@8 T@U) (i@@6 Int) ) (! (let ((T@@20 (SeqTypeInv0 (type s@@8))))
 (=> (= (type s@@8) (SeqType T@@20)) (=> (and (<= 0 i@@6) (< i@@6 (|Seq#Length| s@@8))) (|Seq#ContainsTrigger| s@@8 (|Seq#Index| s@@8 i@@6)))))
 :qid |stdinbpl.514:18|
 :skolemid |49|
 :pattern ( (|Seq#Index| s@@8 i@@6))
)))
(assert (forall ((s0@@1 T@U) (s1@@1 T@U) ) (! (let ((T@@21 (SeqTypeInv0 (type s0@@1))))
 (=> (and (= (type s0@@1) (SeqType T@@21)) (= (type s1@@1) (SeqType T@@21))) (and (=> (= s0@@1 (|Seq#Empty| T@@21)) (= (|Seq#Append| s0@@1 s1@@1) s1@@1)) (=> (= s1@@1 (|Seq#Empty| T@@21)) (= (|Seq#Append| s0@@1 s1@@1) s0@@1)))))
 :qid |stdinbpl.333:18|
 :skolemid |27|
 :pattern ( (|Seq#Append| s0@@1 s1@@1))
)))
(assert (forall ((t@@1 T@U) ) (! (= (|Seq#Index| (|Seq#Singleton| t@@1) 0) t@@1)
 :qid |stdinbpl.337:18|
 :skolemid |28|
 :pattern ( (|Seq#Singleton| t@@1))
)))
(assert (forall ((s@@9 T@U) ) (! (let ((T@@22 (SeqTypeInv0 (type s@@9))))
 (=> (= (type s@@9) (SeqType T@@22)) (<= 0 (|Seq#Length| s@@9))))
 :qid |stdinbpl.316:18|
 :skolemid |22|
 :pattern ( (|Seq#Length| s@@9))
)))
(assert (forall ((r_1@@7 T@U) (i@@7 Int) ) (!  (=> (= (type r_1@@7) RefType) (= (getPredWandId (p2 r_1@@7 i@@7)) 1))
 :qid |stdinbpl.736:15|
 :skolemid |66|
 :pattern ( (p2 r_1@@7 i@@7))
)))
(assert (forall ((s0@@2 T@U) (s1@@2 T@U) ) (! (let ((T@@23 (SeqTypeInv0 (type s0@@2))))
 (=> (and (and (= (type s0@@2) (SeqType T@@23)) (= (type s1@@2) (SeqType T@@23))) (|Seq#Equal| s0@@2 s1@@2)) (and (= (|Seq#Length| s0@@2) (|Seq#Length| s1@@2)) (forall ((j@@4 Int) ) (!  (=> (and (<= 0 j@@4) (< j@@4 (|Seq#Length| s0@@2))) (= (|Seq#Index| s0@@2 j@@4) (|Seq#Index| s1@@2 j@@4)))
 :qid |stdinbpl.611:13|
 :skolemid |50|
 :pattern ( (|Seq#Index| s0@@2 j@@4))
 :pattern ( (|Seq#Index| s1@@2 j@@4))
)))))
 :qid |stdinbpl.608:18|
 :skolemid |51|
 :pattern ( (|Seq#Equal| s0@@2 s1@@2))
)))
(assert (forall ((Heap@@7 T@U) (ExhaleHeap@@4 T@U) (Mask@@6 T@U) (pm_f@@1 T@U) ) (! (let ((C@@1 (FieldTypeInv0 (type pm_f@@1))))
 (=> (and (and (and (and (and (= (type Heap@@7) (MapType0Type RefType)) (= (type ExhaleHeap@@4) (MapType0Type RefType))) (= (type Mask@@6) (MapType1Type RefType realType))) (= (type pm_f@@1) (FieldType C@@1 FrameTypeType))) (IdenticalOnKnownLocations Heap@@7 ExhaleHeap@@4 Mask@@6)) (and (HasDirectPerm Mask@@6 null pm_f@@1) (IsPredicateField pm_f@@1))) (forall ((o2 T@U) (f_2@@0 T@U) ) (! (let ((B@@5 (FieldTypeInv1 (type f_2@@0))))
(let ((A@@6 (FieldTypeInv0 (type f_2@@0))))
 (=> (and (and (= (type o2) RefType) (= (type f_2@@0) (FieldType A@@6 B@@5))) (U_2_bool (MapType1Select (MapType0Select Heap@@7 null (PredicateMaskField pm_f@@1)) o2 f_2@@0))) (= (MapType0Select Heap@@7 o2 f_2@@0) (MapType0Select ExhaleHeap@@4 o2 f_2@@0)))))
 :qid |stdinbpl.54:134|
 :skolemid |3|
 :pattern ( (MapType0Select ExhaleHeap@@4 o2 f_2@@0))
))))
 :qid |stdinbpl.52:19|
 :skolemid |4|
 :pattern ( (IdenticalOnKnownLocations Heap@@7 ExhaleHeap@@4 Mask@@6) (IsPredicateField pm_f@@1))
)))
(assert (forall ((Heap@@8 T@U) (ExhaleHeap@@5 T@U) (Mask@@7 T@U) (pm_f@@2 T@U) ) (! (let ((C@@2 (FieldTypeInv0 (type pm_f@@2))))
 (=> (and (and (and (and (and (= (type Heap@@8) (MapType0Type RefType)) (= (type ExhaleHeap@@5) (MapType0Type RefType))) (= (type Mask@@7) (MapType1Type RefType realType))) (= (type pm_f@@2) (FieldType C@@2 FrameTypeType))) (IdenticalOnKnownLocations Heap@@8 ExhaleHeap@@5 Mask@@7)) (and (HasDirectPerm Mask@@7 null pm_f@@2) (IsWandField pm_f@@2))) (forall ((o2@@0 T@U) (f_2@@1 T@U) ) (! (let ((B@@6 (FieldTypeInv1 (type f_2@@1))))
(let ((A@@7 (FieldTypeInv0 (type f_2@@1))))
 (=> (and (and (= (type o2@@0) RefType) (= (type f_2@@1) (FieldType A@@7 B@@6))) (U_2_bool (MapType1Select (MapType0Select Heap@@8 null (WandMaskField pm_f@@2)) o2@@0 f_2@@1))) (= (MapType0Select Heap@@8 o2@@0 f_2@@1) (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1)))))
 :qid |stdinbpl.67:129|
 :skolemid |6|
 :pattern ( (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1))
))))
 :qid |stdinbpl.65:19|
 :skolemid |7|
 :pattern ( (IdenticalOnKnownLocations Heap@@8 ExhaleHeap@@5 Mask@@7) (IsWandField pm_f@@2))
)))
(assert (forall ((r_1@@8 T@U) ) (!  (=> (= (type r_1@@8) RefType) (= (getPredWandId (p_1 r_1@@8)) 0))
 :qid |stdinbpl.683:15|
 :skolemid |60|
 :pattern ( (p_1 r_1@@8))
)))
(assert (forall ((t@@2 T@U) ) (! (= (|Seq#Length| (|Seq#Singleton| t@@2)) 1)
 :qid |stdinbpl.324:18|
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
(assert (forall ((o T@U) (f T@U) (Heap@@9 T@U) ) (!  (=> (and (and (and (= (type o) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap@@9) (MapType0Type RefType))) (U_2_bool (MapType0Select Heap@@9 o $allocated))) (U_2_bool (MapType0Select Heap@@9 (MapType0Select Heap@@9 o f) $allocated)))
 :qid |stdinbpl.31:15|
 :skolemid |0|
 :pattern ( (MapType0Select Heap@@9 o f))
)))
(assert (forall ((r_1@@9 T@U) (i@@8 Int) ) (!  (=> (= (type r_1@@9) RefType) (= (PredicateMaskField (p2 r_1@@9 i@@8)) (|p2#sm| r_1@@9 i@@8)))
 :qid |stdinbpl.728:15|
 :skolemid |64|
 :pattern ( (PredicateMaskField (p2 r_1@@9 i@@8)))
)))
(assert (forall ((s@@10 T@U) (t@@3 T@U) (n@@8 Int) ) (! (let ((T@@24 (SeqTypeInv0 (type s@@10))))
 (=> (and (and (= (type s@@10) (SeqType T@@24)) (= (type t@@3) (SeqType T@@24))) (and (< 0 n@@8) (<= n@@8 (|Seq#Length| s@@10)))) (= (|Seq#Take| (|Seq#Append| s@@10 t@@3) n@@8) (|Seq#Take| s@@10 n@@8))))
 :qid |stdinbpl.466:18|
 :skolemid |41|
 :pattern ( (|Seq#Take| (|Seq#Append| s@@10 t@@3) n@@8))
)))
(assert (forall ((s@@11 T@U) (i@@9 Int) (v@@1 T@U) ) (! (let ((T@@25 (type v@@1)))
 (=> (= (type s@@11) (SeqType T@@25)) (=> (and (<= 0 i@@9) (< i@@9 (|Seq#Length| s@@11))) (= (|Seq#Length| (|Seq#Update| s@@11 i@@9 v@@1)) (|Seq#Length| s@@11)))))
 :qid |stdinbpl.365:18|
 :skolemid |34|
 :pattern ( (|Seq#Length| (|Seq#Update| s@@11 i@@9 v@@1)))
 :pattern ( (|Seq#Length| s@@11) (|Seq#Update| s@@11 i@@9 v@@1))
)))
(assert (forall ((r_1@@10 T@U) ) (!  (=> (= (type r_1@@10) RefType) (= (PredicateMaskField (p_1 r_1@@10)) (|p#sm| r_1@@10)))
 :qid |stdinbpl.675:15|
 :skolemid |58|
 :pattern ( (PredicateMaskField (p_1 r_1@@10)))
)))
(assert (forall ((s@@12 T@U) (t@@4 T@U) (n@@9 Int) ) (! (let ((T@@26 (SeqTypeInv0 (type s@@12))))
 (=> (and (and (= (type s@@12) (SeqType T@@26)) (= (type t@@4) (SeqType T@@26))) (and (< 0 n@@9) (<= n@@9 (|Seq#Length| s@@12)))) (= (|Seq#Drop| (|Seq#Append| s@@12 t@@4) n@@9) (|Seq#Append| (|Seq#Drop| s@@12 n@@9) t@@4))))
 :qid |stdinbpl.479:18|
 :skolemid |43|
 :pattern ( (|Seq#Drop| (|Seq#Append| s@@12 t@@4) n@@9))
)))
(assert (forall ((s@@13 T@U) (n@@10 Int) (i@@10 Int) ) (! (let ((T@@27 (SeqTypeInv0 (type s@@13))))
 (=> (= (type s@@13) (SeqType T@@27)) (=> (and (and (< 0 n@@10) (<= n@@10 i@@10)) (< i@@10 (|Seq#Length| s@@13))) (and (= (|Seq#Add| (|Seq#Sub| i@@10 n@@10) n@@10) i@@10) (= (|Seq#Index| (|Seq#Drop| s@@13 n@@10) (|Seq#Sub| i@@10 n@@10)) (|Seq#Index| s@@13 i@@10))))))
 :qid |stdinbpl.416:18|
 :skolemid |40|
 :pattern ( (|Seq#Drop| s@@13 n@@10) (|Seq#Index| s@@13 i@@10))
)))
(assert (forall ((s0@@3 T@U) (s1@@3 T@U) (n@@11 Int) ) (! (let ((T@@28 (SeqTypeInv0 (type s0@@3))))
 (=> (and (= (type s0@@3) (SeqType T@@28)) (= (type s1@@3) (SeqType T@@28))) (=> (and (and (and (not (= s0@@3 (|Seq#Empty| T@@28))) (not (= s1@@3 (|Seq#Empty| T@@28)))) (<= 0 n@@11)) (< n@@11 (|Seq#Length| s0@@3))) (= (|Seq#Index| (|Seq#Append| s0@@3 s1@@3) n@@11) (|Seq#Index| s0@@3 n@@11)))))
 :qid |stdinbpl.356:18|
 :skolemid |31|
 :pattern ( (|Seq#Index| (|Seq#Append| s0@@3 s1@@3) n@@11))
 :pattern ( (|Seq#Index| s0@@3 n@@11) (|Seq#Append| s0@@3 s1@@3))
)))
(assert (forall ((Heap@@10 T@U) (o@@0 T@U) (f_3 T@U) (v@@2 T@U) ) (! (let ((B@@8 (type v@@2)))
(let ((A@@9 (FieldTypeInv0 (type f_3))))
 (=> (and (and (= (type Heap@@10) (MapType0Type RefType)) (= (type o@@0) RefType)) (= (type f_3) (FieldType A@@9 B@@8))) (succHeap Heap@@10 (MapType0Store Heap@@10 o@@0 f_3 v@@2)))))
 :qid |stdinbpl.78:22|
 :skolemid |9|
 :pattern ( (MapType0Store Heap@@10 o@@0 f_3 v@@2))
)))
(assert (forall ((s0@@4 T@U) (s1@@4 T@U) (m@@7 Int) ) (! (let ((T@@29 (SeqTypeInv0 (type s0@@4))))
 (=> (and (= (type s0@@4) (SeqType T@@29)) (= (type s1@@4) (SeqType T@@29))) (=> (and (and (and (not (= s0@@4 (|Seq#Empty| T@@29))) (not (= s1@@4 (|Seq#Empty| T@@29)))) (<= 0 m@@7)) (< m@@7 (|Seq#Length| s1@@4))) (and (= (|Seq#Sub| (|Seq#Add| m@@7 (|Seq#Length| s0@@4)) (|Seq#Length| s0@@4)) m@@7) (= (|Seq#Index| (|Seq#Append| s0@@4 s1@@4) (|Seq#Add| m@@7 (|Seq#Length| s0@@4))) (|Seq#Index| s1@@4 m@@7))))))
 :qid |stdinbpl.361:18|
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
(assert (forall ((s@@14 T@U) (x@@10 T@U) (i@@11 Int) ) (! (let ((T@@30 (type x@@10)))
 (=> (= (type s@@14) (SeqType T@@30)) (=> (and (and (<= 0 i@@11) (< i@@11 (|Seq#Length| s@@14))) (= (|Seq#Index| s@@14 i@@11) x@@10)) (|Seq#Contains| s@@14 x@@10))))
 :qid |stdinbpl.512:18|
 :skolemid |48|
 :pattern ( (|Seq#Contains| s@@14 x@@10) (|Seq#Index| s@@14 i@@11))
)))
(assert (forall ((s0@@5 T@U) (s1@@5 T@U) ) (! (let ((T@@31 (SeqTypeInv0 (type s0@@5))))
 (=> (and (= (type s0@@5) (SeqType T@@31)) (= (type s1@@5) (SeqType T@@31))) (or (or (and (= s0@@5 s1@@5) (|Seq#Equal| s0@@5 s1@@5)) (and (and (not (= s0@@5 s1@@5)) (not (|Seq#Equal| s0@@5 s1@@5))) (not (= (|Seq#Length| s0@@5) (|Seq#Length| s1@@5))))) (and (and (and (and (and (and (not (= s0@@5 s1@@5)) (not (|Seq#Equal| s0@@5 s1@@5))) (= (|Seq#Length| s0@@5) (|Seq#Length| s1@@5))) (= (|Seq#SkolemDiff| s0@@5 s1@@5) (|Seq#SkolemDiff| s1@@5 s0@@5))) (<= 0 (|Seq#SkolemDiff| s0@@5 s1@@5))) (< (|Seq#SkolemDiff| s0@@5 s1@@5) (|Seq#Length| s0@@5))) (not (= (|Seq#Index| s0@@5 (|Seq#SkolemDiff| s0@@5 s1@@5)) (|Seq#Index| s1@@5 (|Seq#SkolemDiff| s0@@5 s1@@5))))))))
 :qid |stdinbpl.616:18|
 :skolemid |52|
 :pattern ( (|Seq#Equal| s0@@5 s1@@5))
)))
(assert (forall ((p@@1 T@U) (v_1@@0 T@U) (q T@U) (w@@0 T@U) (r T@U) (u T@U) ) (! (let ((C@@3 (FieldTypeInv0 (type r))))
(let ((B@@10 (FieldTypeInv0 (type q))))
(let ((A@@11 (FieldTypeInv0 (type p@@1))))
 (=> (and (and (and (and (and (and (= (type p@@1) (FieldType A@@11 FrameTypeType)) (= (type v_1@@0) FrameTypeType)) (= (type q) (FieldType B@@10 FrameTypeType))) (= (type w@@0) FrameTypeType)) (= (type r) (FieldType C@@3 FrameTypeType))) (= (type u) FrameTypeType)) (and (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))) (InsidePredicate p@@1 v_1@@0 r u)))))
 :qid |stdinbpl.285:25|
 :skolemid |20|
 :pattern ( (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))
)))
(assert (forall ((s@@15 T@U) ) (! (let ((T@@32 (SeqTypeInv0 (type s@@15))))
 (=> (and (= (type s@@15) (SeqType T@@32)) (= (|Seq#Length| s@@15) 0)) (= s@@15 (|Seq#Empty| T@@32))))
 :qid |stdinbpl.320:18|
 :skolemid |24|
 :pattern ( (|Seq#Length| s@@15))
)))
(assert (forall ((s@@16 T@U) (n@@12 Int) ) (! (let ((T@@33 (SeqTypeInv0 (type s@@16))))
 (=> (and (= (type s@@16) (SeqType T@@33)) (<= n@@12 0)) (= (|Seq#Take| s@@16 n@@12) (|Seq#Empty| T@@33))))
 :qid |stdinbpl.495:18|
 :skolemid |46|
 :pattern ( (|Seq#Take| s@@16 n@@12))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun PostHeap@3 () T@U)
(declare-fun PostHeap@2 () T@U)
(declare-fun r_1@@11 () T@U)
(declare-fun i@@12 () Int)
(declare-fun QPMask@5 () T@U)
(declare-fun FrameFragment (T@U) T@U)
(declare-fun UnfoldingMask@10 () T@U)
(declare-fun UnfoldingMask@11 () T@U)
(declare-fun PostHeap@4 () T@U)
(declare-fun UnfoldingMask@9 () T@U)
(declare-fun UnfoldingMask@8 () T@U)
(declare-fun PostHeap@1 () T@U)
(declare-fun PostHeap@0 () T@U)
(declare-fun UnfoldingMask@6 () T@U)
(declare-fun UnfoldingMask@7 () T@U)
(declare-fun UnfoldingMask@5 () T@U)
(declare-fun UnfoldingMask@4 () T@U)
(declare-fun xs () T@U)
(declare-fun qpRange34 (T@U) Bool)
(declare-fun invRecv34 (T@U) T@U)
(declare-fun QPMask@4 () T@U)
(declare-fun neverTriggered33 (T@U) Bool)
(declare-fun invRecv33 (T@U Int) T@U)
(declare-fun qpRange33 (T@U Int) Bool)
(declare-fun UnfoldingMask@2 () T@U)
(declare-fun Mask@8 () T@U)
(declare-fun UnfoldingMask@3 () T@U)
(declare-fun Heap@14 () T@U)
(declare-fun UnfoldingMask@0 () T@U)
(declare-fun UnfoldingMask@1 () T@U)
(declare-fun neverTriggered35 (T@U) Bool)
(declare-fun invRecv35 (T@U Int) T@U)
(declare-fun qpRange35 (T@U Int) Bool)
(declare-fun QPMask@2 () T@U)
(declare-fun neverTriggered36 (T@U) Bool)
(declare-fun QPMask@3 () T@U)
(declare-fun qpRange36 (T@U) Bool)
(declare-fun invRecv36 (T@U) T@U)
(declare-fun Heap@13 () T@U)
(declare-fun Heap@12 () T@U)
(declare-fun Mask@7 () T@U)
(declare-fun Heap@9 () T@U)
(declare-fun Heap@10 () T@U)
(declare-fun Heap@11 () T@U)
(declare-fun freshVersion@1 () T@U)
(declare-fun Mask@6 () T@U)
(declare-fun Mask@5 () T@U)
(declare-fun Mask@4 () T@U)
(declare-fun Heap@8 () T@U)
(declare-fun Heap@@11 () T@U)
(declare-fun Heap@7 () T@U)
(declare-fun newVersion@1 () T@U)
(declare-fun QPMask@1 () T@U)
(declare-fun Heap@6 () T@U)
(declare-fun Heap@5 () T@U)
(declare-fun Mask@3 () T@U)
(declare-fun Heap@2 () T@U)
(declare-fun Heap@3 () T@U)
(declare-fun Heap@4 () T@U)
(declare-fun freshVersion@0 () T@U)
(declare-fun Mask@2 () T@U)
(declare-fun Mask@1 () T@U)
(declare-fun Mask@0 () T@U)
(declare-fun Heap@1 () T@U)
(declare-fun Heap@0 () T@U)
(declare-fun newVersion@0 () T@U)
(declare-fun qpRange32 (T@U) Bool)
(declare-fun invRecv32 (T@U) T@U)
(declare-fun QPMask@0 () T@U)
(declare-fun neverTriggered31 (T@U) Bool)
(declare-fun invRecv31 (T@U Int) T@U)
(declare-fun qpRange31 (T@U Int) Bool)
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (= (type UnfoldingMask@2) (MapType1Type RefType realType)) (= (type Mask@8) (MapType1Type RefType realType))) (= (type r_1@@11) RefType)) (= (type UnfoldingMask@3) (MapType1Type RefType realType))) (= (type Heap@14) (MapType0Type RefType))) (forall ((arg0@@39 T@U) ) (! (= (type (FrameFragment arg0@@39)) FrameTypeType)
 :qid |funType:FrameFragment|
 :pattern ( (FrameFragment arg0@@39))
))) (= (type UnfoldingMask@0) (MapType1Type RefType realType))) (= (type UnfoldingMask@1) (MapType1Type RefType realType))) (= (type xs) (SeqType RefType))) (forall ((arg0@@40 T@U) (arg1@@18 Int) ) (! (= (type (invRecv35 arg0@@40 arg1@@18)) RefType)
 :qid |funType:invRecv35|
 :pattern ( (invRecv35 arg0@@40 arg1@@18))
))) (= (type QPMask@2) (MapType1Type RefType realType))) (= (type QPMask@3) (MapType1Type RefType realType))) (forall ((arg0@@41 T@U) ) (! (= (type (invRecv36 arg0@@41)) RefType)
 :qid |funType:invRecv36|
 :pattern ( (invRecv36 arg0@@41))
))) (= (type Heap@6) (MapType0Type RefType))) (= (type Heap@5) (MapType0Type RefType))) (= (type Mask@3) (MapType1Type RefType realType))) (= (type Heap@3) (MapType0Type RefType))) (= (type Heap@2) (MapType0Type RefType))) (= (type Heap@4) (MapType0Type RefType))) (= (type freshVersion@0) FrameTypeType)) (= (type Mask@2) (MapType1Type RefType realType))) (= (type Mask@1) (MapType1Type RefType realType))) (= (type Mask@0) (MapType1Type RefType realType))) (= (type Heap@1) (MapType0Type RefType))) (= (type Heap@0) (MapType0Type RefType))) (= (type Heap@@11) (MapType0Type RefType))) (= (type newVersion@0) FrameTypeType)) (= (type QPMask@1) (MapType1Type RefType realType))) (= (type Heap@13) (MapType0Type RefType))) (= (type Heap@12) (MapType0Type RefType))) (= (type Mask@7) (MapType1Type RefType realType))) (= (type Heap@10) (MapType0Type RefType))) (= (type Heap@9) (MapType0Type RefType))) (= (type Heap@11) (MapType0Type RefType))) (= (type freshVersion@1) FrameTypeType)) (= (type Mask@6) (MapType1Type RefType realType))) (= (type Mask@5) (MapType1Type RefType realType))) (= (type Mask@4) (MapType1Type RefType realType))) (= (type Heap@8) (MapType0Type RefType))) (= (type Heap@7) (MapType0Type RefType))) (= (type newVersion@1) FrameTypeType)) (= (type PostHeap@4) (MapType0Type RefType))) (= (type PostHeap@2) (MapType0Type RefType))) (= (type PostHeap@3) (MapType0Type RefType))) (= (type QPMask@5) (MapType1Type RefType realType))) (= (type UnfoldingMask@10) (MapType1Type RefType realType))) (= (type UnfoldingMask@11) (MapType1Type RefType realType))) (= (type UnfoldingMask@9) (MapType1Type RefType realType))) (= (type UnfoldingMask@8) (MapType1Type RefType realType))) (= (type PostHeap@0) (MapType0Type RefType))) (= (type PostHeap@1) (MapType0Type RefType))) (= (type UnfoldingMask@6) (MapType1Type RefType realType))) (= (type UnfoldingMask@7) (MapType1Type RefType realType))) (= (type UnfoldingMask@5) (MapType1Type RefType realType))) (= (type UnfoldingMask@4) (MapType1Type RefType realType))) (forall ((arg0@@42 T@U) ) (! (= (type (invRecv34 arg0@@42)) RefType)
 :qid |funType:invRecv34|
 :pattern ( (invRecv34 arg0@@42))
))) (= (type QPMask@4) (MapType1Type RefType realType))) (forall ((arg0@@43 T@U) (arg1@@19 Int) ) (! (= (type (invRecv33 arg0@@43 arg1@@19)) RefType)
 :qid |funType:invRecv33|
 :pattern ( (invRecv33 arg0@@43 arg1@@19))
))) (forall ((arg0@@44 T@U) ) (! (= (type (invRecv32 arg0@@44)) RefType)
 :qid |funType:invRecv32|
 :pattern ( (invRecv32 arg0@@44))
))) (= (type QPMask@0) (MapType1Type RefType realType))) (forall ((arg0@@45 T@U) (arg1@@20 Int) ) (! (= (type (invRecv31 arg0@@45 arg1@@20)) RefType)
 :qid |funType:invRecv31|
 :pattern ( (invRecv31 arg0@@45 arg1@@20))
))))
(set-info :boogie-vc-id m4)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 99) (let ((anon21_correct true))
(let ((anon20_correct  (=> (and (= PostHeap@3 (MapType0Store PostHeap@2 null (|p2#sm| r_1@@11 i@@12) (MapType1Store (MapType0Select PostHeap@2 null (|p2#sm| r_1@@11 i@@12)) r_1@@11 f_7 (bool_2_U true)))) (state PostHeap@3 QPMask@5)) (=> (and (and (|p2#trigger| PostHeap@3 (p2 r_1@@11 i@@12)) (= (MapType0Select PostHeap@3 null (p2 r_1@@11 i@@12)) (FrameFragment (MapType0Select PostHeap@3 r_1@@11 f_7)))) (and (= UnfoldingMask@10 (MapType1Store QPMask@5 null (p2 r_1@@11 i@@12) (real_2_U (- (U_2_real (MapType1Select QPMask@5 null (p2 r_1@@11 i@@12))) FullPerm)))) (not (= r_1@@11 null)))) (=> (and (and (and (= UnfoldingMask@11 (MapType1Store UnfoldingMask@10 r_1@@11 f_7 (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@10 r_1@@11 f_7)) FullPerm)))) (state PostHeap@3 UnfoldingMask@11)) (and (= (U_2_int (MapType0Select PostHeap@3 r_1@@11 f_7)) i@@12) (state PostHeap@3 UnfoldingMask@11))) (and (and (= (U_2_int (MapType0Select PostHeap@3 r_1@@11 f_7)) i@@12) (= (U_2_int (MapType0Select PostHeap@3 r_1@@11 g)) 4)) (and (= PostHeap@4 PostHeap@3) (= (ControlFlow 0 67) 65)))) anon21_correct)))))
(let ((anon60_Else_correct  (=> (and (not (= (U_2_int (MapType0Select PostHeap@2 r_1@@11 f_7)) i@@12)) (= (ControlFlow 0 70) 67)) anon20_correct)))
(let ((anon60_Then_correct  (=> (= (U_2_int (MapType0Select PostHeap@2 r_1@@11 f_7)) i@@12) (and (=> (= (ControlFlow 0 68) (- 0 69)) (HasDirectPerm UnfoldingMask@9 r_1@@11 g)) (=> (HasDirectPerm UnfoldingMask@9 r_1@@11 g) (=> (= (ControlFlow 0 68) 67) anon20_correct))))))
(let ((anon18_correct  (=> (and (= UnfoldingMask@8 (MapType1Store QPMask@5 null (p2 r_1@@11 i@@12) (real_2_U (- (U_2_real (MapType1Select QPMask@5 null (p2 r_1@@11 i@@12))) FullPerm)))) (not (= r_1@@11 null))) (=> (and (and (= UnfoldingMask@9 (MapType1Store UnfoldingMask@8 r_1@@11 f_7 (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@8 r_1@@11 f_7)) FullPerm)))) (state PostHeap@2 UnfoldingMask@9)) (and (= (U_2_int (MapType0Select PostHeap@2 r_1@@11 f_7)) i@@12) (state PostHeap@2 UnfoldingMask@9))) (and (=> (= (ControlFlow 0 71) (- 0 72)) (HasDirectPerm UnfoldingMask@9 r_1@@11 f_7)) (=> (HasDirectPerm UnfoldingMask@9 r_1@@11 f_7) (and (=> (= (ControlFlow 0 71) 68) anon60_Then_correct) (=> (= (ControlFlow 0 71) 70) anon60_Else_correct))))))))
(let ((anon59_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 75) 71)) anon18_correct)))
(let ((anon59_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 73) (- 0 74)) (<= FullPerm (U_2_real (MapType1Select QPMask@5 null (p2 r_1@@11 i@@12))))) (=> (<= FullPerm (U_2_real (MapType1Select QPMask@5 null (p2 r_1@@11 i@@12)))) (=> (= (ControlFlow 0 73) 71) anon18_correct))))))
(let ((anon58_Then_correct  (=> (<= i@@12 0) (=> (and (|p2#trigger| PostHeap@2 (p2 r_1@@11 i@@12)) (= (MapType0Select PostHeap@2 null (p2 r_1@@11 i@@12)) (FrameFragment (MapType0Select PostHeap@2 r_1@@11 f_7)))) (and (=> (= (ControlFlow 0 76) 73) anon59_Then_correct) (=> (= (ControlFlow 0 76) 75) anon59_Else_correct))))))
(let ((anon58_Else_correct  (=> (< 0 i@@12) (=> (and (= PostHeap@4 PostHeap@2) (= (ControlFlow 0 66) 65)) anon21_correct))))
(let ((anon15_correct  (=> (state PostHeap@2 QPMask@5) (and (=> (= (ControlFlow 0 77) 76) anon58_Then_correct) (=> (= (ControlFlow 0 77) 66) anon58_Else_correct)))))
(let ((anon14_correct  (=> (and (= PostHeap@1 (MapType0Store PostHeap@0 null (|p2#sm| r_1@@11 i@@12) (MapType1Store (MapType0Select PostHeap@0 null (|p2#sm| r_1@@11 i@@12)) r_1@@11 f_7 (bool_2_U true)))) (state PostHeap@1 QPMask@5)) (=> (and (and (|p2#trigger| PostHeap@1 (p2 r_1@@11 i@@12)) (= (MapType0Select PostHeap@1 null (p2 r_1@@11 i@@12)) (FrameFragment (MapType0Select PostHeap@1 r_1@@11 f_7)))) (and (= UnfoldingMask@6 (MapType1Store QPMask@5 null (p2 r_1@@11 i@@12) (real_2_U (- (U_2_real (MapType1Select QPMask@5 null (p2 r_1@@11 i@@12))) FullPerm)))) (not (= r_1@@11 null)))) (=> (and (and (and (= UnfoldingMask@7 (MapType1Store UnfoldingMask@6 r_1@@11 f_7 (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@6 r_1@@11 f_7)) FullPerm)))) (state PostHeap@1 UnfoldingMask@7)) (and (= (U_2_int (MapType0Select PostHeap@1 r_1@@11 f_7)) i@@12) (state PostHeap@1 UnfoldingMask@7))) (and (and (= (U_2_int (MapType0Select PostHeap@1 r_1@@11 f_7)) i@@12) (= (U_2_int (MapType0Select PostHeap@1 r_1@@11 g)) 2)) (and (= PostHeap@2 PostHeap@1) (= (ControlFlow 0 79) 77)))) anon15_correct)))))
(let ((anon57_Else_correct  (=> (and (not (= (U_2_int (MapType0Select PostHeap@0 r_1@@11 f_7)) i@@12)) (= (ControlFlow 0 82) 79)) anon14_correct)))
(let ((anon57_Then_correct  (=> (= (U_2_int (MapType0Select PostHeap@0 r_1@@11 f_7)) i@@12) (and (=> (= (ControlFlow 0 80) (- 0 81)) (HasDirectPerm UnfoldingMask@5 r_1@@11 g)) (=> (HasDirectPerm UnfoldingMask@5 r_1@@11 g) (=> (= (ControlFlow 0 80) 79) anon14_correct))))))
(let ((anon12_correct  (=> (and (= UnfoldingMask@4 (MapType1Store QPMask@5 null (p2 r_1@@11 i@@12) (real_2_U (- (U_2_real (MapType1Select QPMask@5 null (p2 r_1@@11 i@@12))) FullPerm)))) (not (= r_1@@11 null))) (=> (and (and (= UnfoldingMask@5 (MapType1Store UnfoldingMask@4 r_1@@11 f_7 (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@4 r_1@@11 f_7)) FullPerm)))) (state PostHeap@0 UnfoldingMask@5)) (and (= (U_2_int (MapType0Select PostHeap@0 r_1@@11 f_7)) i@@12) (state PostHeap@0 UnfoldingMask@5))) (and (=> (= (ControlFlow 0 83) (- 0 84)) (HasDirectPerm UnfoldingMask@5 r_1@@11 f_7)) (=> (HasDirectPerm UnfoldingMask@5 r_1@@11 f_7) (and (=> (= (ControlFlow 0 83) 80) anon57_Then_correct) (=> (= (ControlFlow 0 83) 82) anon57_Else_correct))))))))
(let ((anon56_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 87) 83)) anon12_correct)))
(let ((anon56_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 85) (- 0 86)) (<= FullPerm (U_2_real (MapType1Select QPMask@5 null (p2 r_1@@11 i@@12))))) (=> (<= FullPerm (U_2_real (MapType1Select QPMask@5 null (p2 r_1@@11 i@@12)))) (=> (= (ControlFlow 0 85) 83) anon12_correct))))))
(let ((anon55_Then_correct  (=> (> i@@12 0) (=> (and (|p2#trigger| PostHeap@0 (p2 r_1@@11 i@@12)) (= (MapType0Select PostHeap@0 null (p2 r_1@@11 i@@12)) (FrameFragment (MapType0Select PostHeap@0 r_1@@11 f_7)))) (and (=> (= (ControlFlow 0 88) 85) anon56_Then_correct) (=> (= (ControlFlow 0 88) 87) anon56_Else_correct))))))
(let ((anon55_Else_correct  (=> (>= 0 i@@12) (=> (and (= PostHeap@2 PostHeap@0) (= (ControlFlow 0 78) 77)) anon15_correct))))
(let ((anon54_Else_correct  (and (=> (= (ControlFlow 0 89) (- 0 90)) (forall ((x_9 T@U) (x_9_1 T@U) ) (!  (=> (and (= (type x_9) RefType) (= (type x_9_1) RefType)) (=> (and (and (and (and (not (= x_9 x_9_1)) (|Seq#Contains| xs x_9)) (|Seq#Contains| xs x_9_1)) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= x_9 x_9_1))))
 :qid |stdinbpl.2767:15|
 :skolemid |270|
 :no-pattern (type x_9)
 :no-pattern (type x_9_1)
 :no-pattern (U_2_int x_9)
 :no-pattern (U_2_bool x_9)
 :no-pattern (U_2_int x_9_1)
 :no-pattern (U_2_bool x_9_1)
))) (=> (forall ((x_9@@0 T@U) (x_9_1@@0 T@U) ) (!  (=> (and (= (type x_9@@0) RefType) (= (type x_9_1@@0) RefType)) (=> (and (and (and (and (not (= x_9@@0 x_9_1@@0)) (|Seq#Contains| xs x_9@@0)) (|Seq#Contains| xs x_9_1@@0)) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= x_9@@0 x_9_1@@0))))
 :qid |stdinbpl.2767:15|
 :skolemid |270|
 :no-pattern (type x_9@@0)
 :no-pattern (type x_9_1@@0)
 :no-pattern (U_2_int x_9@@0)
 :no-pattern (U_2_bool x_9@@0)
 :no-pattern (U_2_int x_9_1@@0)
 :no-pattern (U_2_bool x_9_1@@0)
)) (=> (forall ((x_9@@1 T@U) ) (!  (=> (= (type x_9@@1) RefType) (=> (and (|Seq#Contains| xs x_9@@1) (< NoPerm FullPerm)) (and (qpRange34 x_9@@1) (= (invRecv34 x_9@@1) x_9@@1))))
 :qid |stdinbpl.2773:22|
 :skolemid |271|
 :pattern ( (MapType0Select PostHeap@0 x_9@@1 g))
 :pattern ( (MapType1Select QPMask@5 x_9@@1 g))
 :pattern ( (|Seq#ContainsTrigger| xs x_9@@1))
 :pattern ( (|Seq#Contains| xs x_9@@1))
)) (=> (and (forall ((o_3 T@U) ) (!  (=> (= (type o_3) RefType) (=> (and (and (|Seq#Contains| xs (invRecv34 o_3)) (< NoPerm FullPerm)) (qpRange34 o_3)) (= (invRecv34 o_3) o_3)))
 :qid |stdinbpl.2777:22|
 :skolemid |272|
 :pattern ( (invRecv34 o_3))
)) (forall ((x_9@@2 T@U) ) (!  (=> (and (= (type x_9@@2) RefType) (|Seq#Contains| xs x_9@@2)) (not (= x_9@@2 null)))
 :qid |stdinbpl.2783:22|
 :skolemid |273|
 :pattern ( (MapType0Select PostHeap@0 x_9@@2 g))
 :pattern ( (MapType1Select QPMask@5 x_9@@2 g))
 :pattern ( (|Seq#ContainsTrigger| xs x_9@@2))
 :pattern ( (|Seq#Contains| xs x_9@@2))
))) (=> (and (and (forall ((o_3@@0 T@U) ) (!  (=> (= (type o_3@@0) RefType) (and (=> (and (and (|Seq#Contains| xs (invRecv34 o_3@@0)) (< NoPerm FullPerm)) (qpRange34 o_3@@0)) (and (=> (< NoPerm FullPerm) (= (invRecv34 o_3@@0) o_3@@0)) (= (U_2_real (MapType1Select QPMask@5 o_3@@0 g)) (+ (U_2_real (MapType1Select QPMask@4 o_3@@0 g)) FullPerm)))) (=> (not (and (and (|Seq#Contains| xs (invRecv34 o_3@@0)) (< NoPerm FullPerm)) (qpRange34 o_3@@0))) (= (U_2_real (MapType1Select QPMask@5 o_3@@0 g)) (U_2_real (MapType1Select QPMask@4 o_3@@0 g))))))
 :qid |stdinbpl.2789:22|
 :skolemid |274|
 :pattern ( (MapType1Select QPMask@5 o_3@@0 g))
)) (forall ((o_3@@1 T@U) (f_5 T@U) ) (! (let ((B@@11 (FieldTypeInv1 (type f_5))))
(let ((A@@12 (FieldTypeInv0 (type f_5))))
 (=> (and (and (= (type o_3@@1) RefType) (= (type f_5) (FieldType A@@12 B@@11))) (not (= f_5 g))) (= (U_2_real (MapType1Select QPMask@4 o_3@@1 f_5)) (U_2_real (MapType1Select QPMask@5 o_3@@1 f_5))))))
 :qid |stdinbpl.2793:29|
 :skolemid |275|
 :pattern ( (MapType1Select QPMask@4 o_3@@1 f_5))
 :pattern ( (MapType1Select QPMask@5 o_3@@1 f_5))
))) (and (state PostHeap@0 QPMask@5) (state PostHeap@0 QPMask@5))) (and (=> (= (ControlFlow 0 89) 88) anon55_Then_correct) (=> (= (ControlFlow 0 89) 78) anon55_Else_correct)))))))))
(let ((anon54_Then_correct true))
(let ((anon53_Else_correct  (and (=> (= (ControlFlow 0 91) (- 0 92)) (forall ((x_6 T@U) (x_6_1 T@U) ) (!  (=> (and (= (type x_6) RefType) (= (type x_6_1) RefType)) (=> (and (and (and (and (not (= x_6 x_6_1)) (|Seq#Contains| xs x_6)) (|Seq#Contains| xs x_6_1)) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (or (not (= x_6 x_6_1)) (not (= i@@12 i@@12)))))
 :qid |stdinbpl.2728:17|
 :skolemid |264|
 :pattern ( (neverTriggered33 x_6) (neverTriggered33 x_6_1))
))) (=> (forall ((x_6@@0 T@U) (x_6_1@@0 T@U) ) (!  (=> (and (= (type x_6@@0) RefType) (= (type x_6_1@@0) RefType)) (=> (and (and (and (and (not (= x_6@@0 x_6_1@@0)) (|Seq#Contains| xs x_6@@0)) (|Seq#Contains| xs x_6_1@@0)) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (or (not (= x_6@@0 x_6_1@@0)) (not (= i@@12 i@@12)))))
 :qid |stdinbpl.2728:17|
 :skolemid |264|
 :pattern ( (neverTriggered33 x_6@@0) (neverTriggered33 x_6_1@@0))
)) (=> (and (forall ((x_6@@1 T@U) ) (!  (=> (= (type x_6@@1) RefType) (=> (and (|Seq#Contains| xs x_6@@1) (< NoPerm FullPerm)) (and (= (invRecv33 x_6@@1 i@@12) x_6@@1) (qpRange33 x_6@@1 i@@12))))
 :qid |stdinbpl.2734:22|
 :skolemid |265|
 :pattern ( (MapType0Select PostHeap@0 null (p2 x_6@@1 i@@12)))
 :pattern ( (MapType1Select ZeroMask null (p2 x_6@@1 i@@12)))
 :pattern ( (|Seq#ContainsTrigger| xs x_6@@1))
 :pattern ( (|Seq#Contains| xs x_6@@1))
)) (forall ((r_2_1 T@U) (i_2_1 Int) ) (!  (=> (= (type r_2_1) RefType) (=> (and (and (|Seq#Contains| xs (invRecv33 r_2_1 i_2_1)) (< NoPerm FullPerm)) (qpRange33 r_2_1 i_2_1)) (and (= (invRecv33 r_2_1 i_2_1) r_2_1) (= i@@12 i_2_1))))
 :qid |stdinbpl.2738:22|
 :skolemid |266|
 :pattern ( (invRecv33 r_2_1 i_2_1))
))) (=> (and (and (forall ((r_2_1@@0 T@U) (i_2_1@@0 Int) ) (!  (=> (= (type r_2_1@@0) RefType) (=> (and (and (|Seq#Contains| xs (invRecv33 r_2_1@@0 i_2_1@@0)) (< NoPerm FullPerm)) (qpRange33 r_2_1@@0 i_2_1@@0)) (and (=> (< NoPerm FullPerm) (and (= (invRecv33 r_2_1@@0 i_2_1@@0) r_2_1@@0) (= i@@12 i_2_1@@0))) (= (U_2_real (MapType1Select QPMask@4 null (p2 r_2_1@@0 i_2_1@@0))) (+ (U_2_real (MapType1Select ZeroMask null (p2 r_2_1@@0 i_2_1@@0))) FullPerm)))))
 :qid |stdinbpl.2744:22|
 :skolemid |267|
 :pattern ( (MapType1Select QPMask@4 null (p2 r_2_1@@0 i_2_1@@0)))
)) (forall ((o_3@@2 T@U) (f_5@@0 T@U) ) (! (let ((B@@12 (FieldTypeInv1 (type f_5@@0))))
(let ((A@@13 (FieldTypeInv0 (type f_5@@0))))
 (=> (and (and (= (type o_3@@2) RefType) (= (type f_5@@0) (FieldType A@@13 B@@12))) (or (or (not (= o_3@@2 null)) (not (IsPredicateField f_5@@0))) (not (= (getPredWandId f_5@@0) 1)))) (= (U_2_real (MapType1Select ZeroMask o_3@@2 f_5@@0)) (U_2_real (MapType1Select QPMask@4 o_3@@2 f_5@@0))))))
 :qid |stdinbpl.2750:29|
 :skolemid |268|
 :pattern ( (MapType1Select ZeroMask o_3@@2 f_5@@0))
 :pattern ( (MapType1Select QPMask@4 o_3@@2 f_5@@0))
))) (and (forall ((r_2_1@@1 T@U) (i_2_1@@1 Int) ) (!  (=> (and (= (type r_2_1@@1) RefType) (not (and (and (|Seq#Contains| xs (invRecv33 r_2_1@@1 i_2_1@@1)) (< NoPerm FullPerm)) (qpRange33 r_2_1@@1 i_2_1@@1)))) (= (U_2_real (MapType1Select QPMask@4 null (p2 r_2_1@@1 i_2_1@@1))) (U_2_real (MapType1Select ZeroMask null (p2 r_2_1@@1 i_2_1@@1)))))
 :qid |stdinbpl.2754:22|
 :skolemid |269|
 :pattern ( (MapType1Select QPMask@4 null (p2 r_2_1@@1 i_2_1@@1)))
)) (state PostHeap@0 QPMask@4))) (and (=> (= (ControlFlow 0 91) 64) anon54_Then_correct) (=> (= (ControlFlow 0 91) 89) anon54_Else_correct))))))))
(let ((anon53_Then_correct true))
(let ((anon52_Then_correct  (=> (state PostHeap@0 ZeroMask) (and (=> (= (ControlFlow 0 93) 63) anon53_Then_correct) (=> (= (ControlFlow 0 93) 91) anon53_Else_correct)))))
(let ((anon49_correct true))
(let ((anon48_correct  (=> (and (= UnfoldingMask@2 (MapType1Store Mask@8 null (p2 r_1@@11 i@@12) (real_2_U (- (U_2_real (MapType1Select Mask@8 null (p2 r_1@@11 i@@12))) FullPerm)))) (not (= r_1@@11 null))) (=> (and (and (= UnfoldingMask@3 (MapType1Store UnfoldingMask@2 r_1@@11 f_7 (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@2 r_1@@11 f_7)) FullPerm)))) (state Heap@14 UnfoldingMask@3)) (and (= (U_2_int (MapType0Select Heap@14 r_1@@11 f_7)) i@@12) (state Heap@14 UnfoldingMask@3))) (and (=> (= (ControlFlow 0 5) (- 0 7)) (= (U_2_int (MapType0Select Heap@14 r_1@@11 f_7)) i@@12)) (=> (= (U_2_int (MapType0Select Heap@14 r_1@@11 f_7)) i@@12) (and (=> (= (ControlFlow 0 5) (- 0 6)) (= (U_2_int (MapType0Select Heap@14 r_1@@11 g)) 4)) (=> (= (U_2_int (MapType0Select Heap@14 r_1@@11 g)) 4) (=> (= (ControlFlow 0 5) 3) anon49_correct)))))))))
(let ((anon73_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 10) 5)) anon48_correct)))
(let ((anon73_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 8) (- 0 9)) (<= FullPerm (U_2_real (MapType1Select Mask@8 null (p2 r_1@@11 i@@12))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@8 null (p2 r_1@@11 i@@12)))) (=> (= (ControlFlow 0 8) 5) anon48_correct))))))
(let ((anon72_Then_correct  (=> (<= i@@12 0) (=> (and (|p2#trigger| Heap@14 (p2 r_1@@11 i@@12)) (= (MapType0Select Heap@14 null (p2 r_1@@11 i@@12)) (FrameFragment (MapType0Select Heap@14 r_1@@11 f_7)))) (and (=> (= (ControlFlow 0 11) 8) anon73_Then_correct) (=> (= (ControlFlow 0 11) 10) anon73_Else_correct))))))
(let ((anon72_Else_correct  (=> (and (< 0 i@@12) (= (ControlFlow 0 4) 3)) anon49_correct)))
(let ((anon44_correct  (=> (and (= UnfoldingMask@0 (MapType1Store Mask@8 null (p2 r_1@@11 i@@12) (real_2_U (- (U_2_real (MapType1Select Mask@8 null (p2 r_1@@11 i@@12))) FullPerm)))) (not (= r_1@@11 null))) (=> (and (and (= UnfoldingMask@1 (MapType1Store UnfoldingMask@0 r_1@@11 f_7 (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@0 r_1@@11 f_7)) FullPerm)))) (state Heap@14 UnfoldingMask@1)) (and (= (U_2_int (MapType0Select Heap@14 r_1@@11 f_7)) i@@12) (state Heap@14 UnfoldingMask@1))) (and (=> (= (ControlFlow 0 13) (- 0 15)) (= (U_2_int (MapType0Select Heap@14 r_1@@11 f_7)) i@@12)) (=> (= (U_2_int (MapType0Select Heap@14 r_1@@11 f_7)) i@@12) (and (=> (= (ControlFlow 0 13) (- 0 14)) (= (U_2_int (MapType0Select Heap@14 r_1@@11 g)) 2)) (=> (= (U_2_int (MapType0Select Heap@14 r_1@@11 g)) 2) (and (=> (= (ControlFlow 0 13) 11) anon72_Then_correct) (=> (= (ControlFlow 0 13) 4) anon72_Else_correct))))))))))
(let ((anon71_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 18) 13)) anon44_correct)))
(let ((anon71_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 16) (- 0 17)) (<= FullPerm (U_2_real (MapType1Select Mask@8 null (p2 r_1@@11 i@@12))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@8 null (p2 r_1@@11 i@@12)))) (=> (= (ControlFlow 0 16) 13) anon44_correct))))))
(let ((anon70_Then_correct  (=> (> i@@12 0) (=> (and (|p2#trigger| Heap@14 (p2 r_1@@11 i@@12)) (= (MapType0Select Heap@14 null (p2 r_1@@11 i@@12)) (FrameFragment (MapType0Select Heap@14 r_1@@11 f_7)))) (and (=> (= (ControlFlow 0 19) 16) anon71_Then_correct) (=> (= (ControlFlow 0 19) 18) anon71_Else_correct))))))
(let ((anon70_Else_correct  (=> (>= 0 i@@12) (and (=> (= (ControlFlow 0 12) 11) anon72_Then_correct) (=> (= (ControlFlow 0 12) 4) anon72_Else_correct)))))
(let ((anon41_correct  (=> (state Heap@14 Mask@8) (and (=> (= (ControlFlow 0 20) (- 0 24)) (forall ((x_10 T@U) (x_10_1 T@U) ) (!  (=> (and (= (type x_10) RefType) (= (type x_10_1) RefType)) (=> (and (and (and (and (not (= x_10 x_10_1)) (|Seq#Contains| xs x_10)) (|Seq#Contains| xs x_10_1)) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (or (not (= x_10 x_10_1)) (not (= i@@12 i@@12)))))
 :qid |stdinbpl.3056:17|
 :skolemid |276|
 :pattern ( (neverTriggered35 x_10) (neverTriggered35 x_10_1))
))) (=> (forall ((x_10@@0 T@U) (x_10_1@@0 T@U) ) (!  (=> (and (= (type x_10@@0) RefType) (= (type x_10_1@@0) RefType)) (=> (and (and (and (and (not (= x_10@@0 x_10_1@@0)) (|Seq#Contains| xs x_10@@0)) (|Seq#Contains| xs x_10_1@@0)) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (or (not (= x_10@@0 x_10_1@@0)) (not (= i@@12 i@@12)))))
 :qid |stdinbpl.3056:17|
 :skolemid |276|
 :pattern ( (neverTriggered35 x_10@@0) (neverTriggered35 x_10_1@@0))
)) (and (=> (= (ControlFlow 0 20) (- 0 23)) (forall ((x_10@@1 T@U) ) (!  (=> (and (= (type x_10@@1) RefType) (|Seq#Contains| xs x_10@@1)) (>= (U_2_real (MapType1Select Mask@8 null (p2 x_10@@1 i@@12))) FullPerm))
 :qid |stdinbpl.3063:17|
 :skolemid |277|
 :pattern ( (MapType0Select Heap@14 null (p2 x_10@@1 i@@12)))
 :pattern ( (MapType1Select Mask@8 null (p2 x_10@@1 i@@12)))
 :pattern ( (|Seq#ContainsTrigger| xs x_10@@1))
 :pattern ( (|Seq#Contains| xs x_10@@1))
))) (=> (forall ((x_10@@2 T@U) ) (!  (=> (and (= (type x_10@@2) RefType) (|Seq#Contains| xs x_10@@2)) (>= (U_2_real (MapType1Select Mask@8 null (p2 x_10@@2 i@@12))) FullPerm))
 :qid |stdinbpl.3063:17|
 :skolemid |277|
 :pattern ( (MapType0Select Heap@14 null (p2 x_10@@2 i@@12)))
 :pattern ( (MapType1Select Mask@8 null (p2 x_10@@2 i@@12)))
 :pattern ( (|Seq#ContainsTrigger| xs x_10@@2))
 :pattern ( (|Seq#Contains| xs x_10@@2))
)) (=> (forall ((x_10@@3 T@U) ) (!  (=> (= (type x_10@@3) RefType) (=> (and (|Seq#Contains| xs x_10@@3) (< NoPerm FullPerm)) (and (= (invRecv35 x_10@@3 i@@12) x_10@@3) (qpRange35 x_10@@3 i@@12))))
 :qid |stdinbpl.3069:22|
 :skolemid |278|
 :pattern ( (MapType0Select Heap@14 null (p2 x_10@@3 i@@12)))
 :pattern ( (MapType1Select Mask@8 null (p2 x_10@@3 i@@12)))
 :pattern ( (|Seq#ContainsTrigger| xs x_10@@3))
 :pattern ( (|Seq#Contains| xs x_10@@3))
)) (=> (and (and (forall ((r_3_1 T@U) (i_3_1 Int) ) (!  (=> (= (type r_3_1) RefType) (=> (and (and (|Seq#Contains| xs (invRecv35 r_3_1 i_3_1)) (< NoPerm FullPerm)) (qpRange35 r_3_1 i_3_1)) (and (= (invRecv35 r_3_1 i_3_1) r_3_1) (= i@@12 i_3_1))))
 :qid |stdinbpl.3073:22|
 :skolemid |279|
 :pattern ( (invRecv35 r_3_1 i_3_1))
)) (forall ((r_3_1@@0 T@U) (i_3_1@@0 Int) ) (!  (=> (= (type r_3_1@@0) RefType) (=> (and (and (|Seq#Contains| xs (invRecv35 r_3_1@@0 i_3_1@@0)) (< NoPerm FullPerm)) (qpRange35 r_3_1@@0 i_3_1@@0)) (and (and (= (invRecv35 r_3_1@@0 i_3_1@@0) r_3_1@@0) (= i@@12 i_3_1@@0)) (= (U_2_real (MapType1Select QPMask@2 null (p2 r_3_1@@0 i_3_1@@0))) (- (U_2_real (MapType1Select Mask@8 null (p2 r_3_1@@0 i_3_1@@0))) FullPerm)))))
 :qid |stdinbpl.3079:22|
 :skolemid |280|
 :pattern ( (MapType1Select QPMask@2 null (p2 r_3_1@@0 i_3_1@@0)))
))) (and (forall ((r_3_1@@1 T@U) (i_3_1@@1 Int) ) (!  (=> (and (= (type r_3_1@@1) RefType) (not (and (and (|Seq#Contains| xs (invRecv35 r_3_1@@1 i_3_1@@1)) (< NoPerm FullPerm)) (qpRange35 r_3_1@@1 i_3_1@@1)))) (= (U_2_real (MapType1Select QPMask@2 null (p2 r_3_1@@1 i_3_1@@1))) (U_2_real (MapType1Select Mask@8 null (p2 r_3_1@@1 i_3_1@@1)))))
 :qid |stdinbpl.3083:22|
 :skolemid |281|
 :pattern ( (MapType1Select QPMask@2 null (p2 r_3_1@@1 i_3_1@@1)))
)) (forall ((o_3@@3 T@U) (f_5@@1 T@U) ) (! (let ((B@@13 (FieldTypeInv1 (type f_5@@1))))
(let ((A@@14 (FieldTypeInv0 (type f_5@@1))))
 (=> (and (and (= (type o_3@@3) RefType) (= (type f_5@@1) (FieldType A@@14 B@@13))) (or (or (not (= o_3@@3 null)) (not (IsPredicateField f_5@@1))) (not (= (getPredWandId f_5@@1) 1)))) (= (U_2_real (MapType1Select Mask@8 o_3@@3 f_5@@1)) (U_2_real (MapType1Select QPMask@2 o_3@@3 f_5@@1))))))
 :qid |stdinbpl.3089:29|
 :skolemid |282|
 :pattern ( (MapType1Select Mask@8 o_3@@3 f_5@@1))
 :pattern ( (MapType1Select QPMask@2 o_3@@3 f_5@@1))
)))) (and (=> (= (ControlFlow 0 20) (- 0 22)) (forall ((x_11 T@U) (x_11_1 T@U) ) (!  (=> (and (= (type x_11) RefType) (= (type x_11_1) RefType)) (=> (and (and (and (and (not (= x_11 x_11_1)) (|Seq#Contains| xs x_11)) (|Seq#Contains| xs x_11_1)) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= x_11 x_11_1))))
 :qid |stdinbpl.3101:17|
 :skolemid |283|
 :pattern ( (neverTriggered36 x_11) (neverTriggered36 x_11_1))
))) (=> (forall ((x_11@@0 T@U) (x_11_1@@0 T@U) ) (!  (=> (and (= (type x_11@@0) RefType) (= (type x_11_1@@0) RefType)) (=> (and (and (and (and (not (= x_11@@0 x_11_1@@0)) (|Seq#Contains| xs x_11@@0)) (|Seq#Contains| xs x_11_1@@0)) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= x_11@@0 x_11_1@@0))))
 :qid |stdinbpl.3101:17|
 :skolemid |283|
 :pattern ( (neverTriggered36 x_11@@0) (neverTriggered36 x_11_1@@0))
)) (and (=> (= (ControlFlow 0 20) (- 0 21)) (forall ((x_11@@1 T@U) ) (!  (=> (and (= (type x_11@@1) RefType) (|Seq#Contains| xs x_11@@1)) (>= (U_2_real (MapType1Select QPMask@2 x_11@@1 g)) FullPerm))
 :qid |stdinbpl.3108:17|
 :skolemid |284|
 :pattern ( (MapType0Select Heap@14 x_11@@1 g))
 :pattern ( (MapType1Select QPMask@3 x_11@@1 g))
 :pattern ( (|Seq#ContainsTrigger| xs x_11@@1))
 :pattern ( (|Seq#Contains| xs x_11@@1))
))) (=> (forall ((x_11@@2 T@U) ) (!  (=> (and (= (type x_11@@2) RefType) (|Seq#Contains| xs x_11@@2)) (>= (U_2_real (MapType1Select QPMask@2 x_11@@2 g)) FullPerm))
 :qid |stdinbpl.3108:17|
 :skolemid |284|
 :pattern ( (MapType0Select Heap@14 x_11@@2 g))
 :pattern ( (MapType1Select QPMask@3 x_11@@2 g))
 :pattern ( (|Seq#ContainsTrigger| xs x_11@@2))
 :pattern ( (|Seq#Contains| xs x_11@@2))
)) (=> (and (and (forall ((x_11@@3 T@U) ) (!  (=> (= (type x_11@@3) RefType) (=> (and (|Seq#Contains| xs x_11@@3) (< NoPerm FullPerm)) (and (qpRange36 x_11@@3) (= (invRecv36 x_11@@3) x_11@@3))))
 :qid |stdinbpl.3114:22|
 :skolemid |285|
 :pattern ( (MapType0Select Heap@14 x_11@@3 g))
 :pattern ( (MapType1Select QPMask@3 x_11@@3 g))
 :pattern ( (|Seq#ContainsTrigger| xs x_11@@3))
 :pattern ( (|Seq#Contains| xs x_11@@3))
)) (forall ((o_3@@4 T@U) ) (!  (=> (= (type o_3@@4) RefType) (=> (and (|Seq#Contains| xs (invRecv36 o_3@@4)) (and (< NoPerm FullPerm) (qpRange36 o_3@@4))) (= (invRecv36 o_3@@4) o_3@@4)))
 :qid |stdinbpl.3118:22|
 :skolemid |286|
 :pattern ( (invRecv36 o_3@@4))
))) (and (forall ((o_3@@5 T@U) ) (!  (=> (= (type o_3@@5) RefType) (and (=> (and (|Seq#Contains| xs (invRecv36 o_3@@5)) (and (< NoPerm FullPerm) (qpRange36 o_3@@5))) (and (= (invRecv36 o_3@@5) o_3@@5) (= (U_2_real (MapType1Select QPMask@3 o_3@@5 g)) (- (U_2_real (MapType1Select QPMask@2 o_3@@5 g)) FullPerm)))) (=> (not (and (|Seq#Contains| xs (invRecv36 o_3@@5)) (and (< NoPerm FullPerm) (qpRange36 o_3@@5)))) (= (U_2_real (MapType1Select QPMask@3 o_3@@5 g)) (U_2_real (MapType1Select QPMask@2 o_3@@5 g))))))
 :qid |stdinbpl.3124:22|
 :skolemid |287|
 :pattern ( (MapType1Select QPMask@3 o_3@@5 g))
)) (forall ((o_3@@6 T@U) (f_5@@2 T@U) ) (! (let ((B@@14 (FieldTypeInv1 (type f_5@@2))))
(let ((A@@15 (FieldTypeInv0 (type f_5@@2))))
 (=> (and (and (= (type o_3@@6) RefType) (= (type f_5@@2) (FieldType A@@15 B@@14))) (not (= f_5@@2 g))) (= (U_2_real (MapType1Select QPMask@2 o_3@@6 f_5@@2)) (U_2_real (MapType1Select QPMask@3 o_3@@6 f_5@@2))))))
 :qid |stdinbpl.3130:29|
 :skolemid |288|
 :pattern ( (MapType1Select QPMask@3 o_3@@6 f_5@@2))
)))) (and (=> (= (ControlFlow 0 20) 19) anon70_Then_correct) (=> (= (ControlFlow 0 20) 12) anon70_Else_correct))))))))))))))))
(let ((anon31_correct  (=> (and (= Heap@13 (MapType0Store Heap@12 null (|p2#sm| r_1@@11 i@@12) (MapType1Store (MapType0Select Heap@12 null (|p2#sm| r_1@@11 i@@12)) r_1@@11 f_7 (bool_2_U true)))) (state Heap@13 Mask@7)) (=> (and (and (state Heap@13 Mask@7) (= Mask@8 Mask@7)) (and (= Heap@14 Heap@13) (= (ControlFlow 0 44) 20))) anon41_correct))))
(let ((anon65_Else_correct  (=> (HasDirectPerm Mask@7 null (p2 r_1@@11 i@@12)) (=> (and (= Heap@12 Heap@9) (= (ControlFlow 0 46) 44)) anon31_correct))))
(let ((anon65_Then_correct  (=> (not (HasDirectPerm Mask@7 null (p2 r_1@@11 i@@12))) (=> (and (and (= Heap@10 (MapType0Store Heap@9 null (|p2#sm| r_1@@11 i@@12) ZeroPMask)) (= Heap@11 (MapType0Store Heap@10 null (p2 r_1@@11 i@@12) freshVersion@1))) (and (= Heap@12 Heap@11) (= (ControlFlow 0 45) 44))) anon31_correct))))
(let ((anon29_correct  (=> (= Mask@6 (MapType1Store Mask@5 r_1@@11 f_7 (real_2_U (- (U_2_real (MapType1Select Mask@5 r_1@@11 f_7)) FullPerm)))) (and (=> (= (ControlFlow 0 47) (- 0 48)) (= (U_2_int (MapType0Select Heap@9 r_1@@11 f_7)) i@@12)) (=> (= (U_2_int (MapType0Select Heap@9 r_1@@11 f_7)) i@@12) (=> (= Mask@7 (MapType1Store Mask@6 null (p2 r_1@@11 i@@12) (real_2_U (+ (U_2_real (MapType1Select Mask@6 null (p2 r_1@@11 i@@12))) FullPerm)))) (=> (and (and (state Heap@9 Mask@7) (state Heap@9 Mask@7)) (and (|p2#trigger| Heap@9 (p2 r_1@@11 i@@12)) (= (MapType0Select Heap@9 null (p2 r_1@@11 i@@12)) (FrameFragment (MapType0Select Heap@9 r_1@@11 f_7))))) (and (=> (= (ControlFlow 0 47) 45) anon65_Then_correct) (=> (= (ControlFlow 0 47) 46) anon65_Else_correct)))))))))
(let ((anon64_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 51) 47)) anon29_correct)))
(let ((anon64_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 49) (- 0 50)) (<= FullPerm (U_2_real (MapType1Select Mask@5 r_1@@11 f_7)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@5 r_1@@11 f_7))) (=> (= (ControlFlow 0 49) 47) anon29_correct))))))
(let ((anon27_correct  (=> (and (not (= r_1@@11 null)) (= Mask@5 (MapType1Store Mask@4 r_1@@11 f_7 (real_2_U (+ (U_2_real (MapType1Select Mask@4 r_1@@11 f_7)) FullPerm))))) (=> (and (and (state Heap@8 Mask@5) (= (U_2_int (MapType0Select Heap@8 r_1@@11 f_7)) i@@12)) (and (state Heap@8 Mask@5) (state Heap@8 Mask@5))) (and (=> (= (ControlFlow 0 52) (- 0 55)) (HasDirectPerm Mask@5 r_1@@11 f_7)) (=> (HasDirectPerm Mask@5 r_1@@11 f_7) (and (=> (= (ControlFlow 0 52) (- 0 54)) (= (U_2_int (MapType0Select Heap@8 r_1@@11 f_7)) i@@12)) (=> (= (U_2_int (MapType0Select Heap@8 r_1@@11 f_7)) i@@12) (=> (state Heap@8 Mask@5) (and (=> (= (ControlFlow 0 52) (- 0 53)) (= FullPerm (U_2_real (MapType1Select Mask@5 r_1@@11 g)))) (=> (= FullPerm (U_2_real (MapType1Select Mask@5 r_1@@11 g))) (=> (and (= Heap@9 (MapType0Store Heap@8 r_1@@11 g (int_2_U 2))) (state Heap@9 Mask@5)) (and (=> (= (ControlFlow 0 52) 49) anon64_Then_correct) (=> (= (ControlFlow 0 52) 51) anon64_Else_correct))))))))))))))
(let ((anon63_Else_correct  (=> (HasDirectPerm Mask@4 null (p2 r_1@@11 i@@12)) (=> (and (= Heap@8 Heap@@11) (= (ControlFlow 0 57) 52)) anon27_correct))))
(let ((anon63_Then_correct  (=> (and (and (not (HasDirectPerm Mask@4 null (p2 r_1@@11 i@@12))) (= Heap@7 (MapType0Store Heap@@11 null (p2 r_1@@11 i@@12) newVersion@1))) (and (= Heap@8 Heap@7) (= (ControlFlow 0 56) 52))) anon27_correct)))
(let ((anon25_correct  (=> (= Mask@4 (MapType1Store QPMask@1 null (p2 r_1@@11 i@@12) (real_2_U (- (U_2_real (MapType1Select QPMask@1 null (p2 r_1@@11 i@@12))) FullPerm)))) (and (=> (= (ControlFlow 0 58) 56) anon63_Then_correct) (=> (= (ControlFlow 0 58) 57) anon63_Else_correct)))))
(let ((anon62_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 61) 58)) anon25_correct)))
(let ((anon62_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 59) (- 0 60)) (<= FullPerm (U_2_real (MapType1Select QPMask@1 null (p2 r_1@@11 i@@12))))) (=> (<= FullPerm (U_2_real (MapType1Select QPMask@1 null (p2 r_1@@11 i@@12)))) (=> (= (ControlFlow 0 59) 58) anon25_correct))))))
(let ((anon61_Then_correct  (=> (> i@@12 0) (=> (and (|p2#trigger| Heap@@11 (p2 r_1@@11 i@@12)) (= (MapType0Select Heap@@11 null (p2 r_1@@11 i@@12)) (FrameFragment (MapType0Select Heap@@11 r_1@@11 f_7)))) (and (=> (= (ControlFlow 0 62) 59) anon62_Then_correct) (=> (= (ControlFlow 0 62) 61) anon62_Else_correct))))))
(let ((anon40_correct  (=> (and (= Heap@6 (MapType0Store Heap@5 null (|p2#sm| r_1@@11 i@@12) (MapType1Store (MapType0Select Heap@5 null (|p2#sm| r_1@@11 i@@12)) r_1@@11 f_7 (bool_2_U true)))) (state Heap@6 Mask@3)) (=> (and (and (state Heap@6 Mask@3) (= Mask@8 Mask@3)) (and (= Heap@14 Heap@6) (= (ControlFlow 0 25) 20))) anon41_correct))))
(let ((anon69_Else_correct  (=> (HasDirectPerm Mask@3 null (p2 r_1@@11 i@@12)) (=> (and (= Heap@5 Heap@2) (= (ControlFlow 0 27) 25)) anon40_correct))))
(let ((anon69_Then_correct  (=> (not (HasDirectPerm Mask@3 null (p2 r_1@@11 i@@12))) (=> (and (and (= Heap@3 (MapType0Store Heap@2 null (|p2#sm| r_1@@11 i@@12) ZeroPMask)) (= Heap@4 (MapType0Store Heap@3 null (p2 r_1@@11 i@@12) freshVersion@0))) (and (= Heap@5 Heap@4) (= (ControlFlow 0 26) 25))) anon40_correct))))
(let ((anon38_correct  (=> (= Mask@2 (MapType1Store Mask@1 r_1@@11 f_7 (real_2_U (- (U_2_real (MapType1Select Mask@1 r_1@@11 f_7)) FullPerm)))) (and (=> (= (ControlFlow 0 28) (- 0 29)) (= (U_2_int (MapType0Select Heap@2 r_1@@11 f_7)) i@@12)) (=> (= (U_2_int (MapType0Select Heap@2 r_1@@11 f_7)) i@@12) (=> (= Mask@3 (MapType1Store Mask@2 null (p2 r_1@@11 i@@12) (real_2_U (+ (U_2_real (MapType1Select Mask@2 null (p2 r_1@@11 i@@12))) FullPerm)))) (=> (and (and (state Heap@2 Mask@3) (state Heap@2 Mask@3)) (and (|p2#trigger| Heap@2 (p2 r_1@@11 i@@12)) (= (MapType0Select Heap@2 null (p2 r_1@@11 i@@12)) (FrameFragment (MapType0Select Heap@2 r_1@@11 f_7))))) (and (=> (= (ControlFlow 0 28) 26) anon69_Then_correct) (=> (= (ControlFlow 0 28) 27) anon69_Else_correct)))))))))
(let ((anon68_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 32) 28)) anon38_correct)))
(let ((anon68_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 30) (- 0 31)) (<= FullPerm (U_2_real (MapType1Select Mask@1 r_1@@11 f_7)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@1 r_1@@11 f_7))) (=> (= (ControlFlow 0 30) 28) anon38_correct))))))
(let ((anon36_correct  (=> (and (not (= r_1@@11 null)) (= Mask@1 (MapType1Store Mask@0 r_1@@11 f_7 (real_2_U (+ (U_2_real (MapType1Select Mask@0 r_1@@11 f_7)) FullPerm))))) (=> (and (and (state Heap@1 Mask@1) (= (U_2_int (MapType0Select Heap@1 r_1@@11 f_7)) i@@12)) (and (state Heap@1 Mask@1) (state Heap@1 Mask@1))) (and (=> (= (ControlFlow 0 33) (- 0 36)) (HasDirectPerm Mask@1 r_1@@11 f_7)) (=> (HasDirectPerm Mask@1 r_1@@11 f_7) (and (=> (= (ControlFlow 0 33) (- 0 35)) (= (U_2_int (MapType0Select Heap@1 r_1@@11 f_7)) i@@12)) (=> (= (U_2_int (MapType0Select Heap@1 r_1@@11 f_7)) i@@12) (=> (state Heap@1 Mask@1) (and (=> (= (ControlFlow 0 33) (- 0 34)) (= FullPerm (U_2_real (MapType1Select Mask@1 r_1@@11 g)))) (=> (= FullPerm (U_2_real (MapType1Select Mask@1 r_1@@11 g))) (=> (and (= Heap@2 (MapType0Store Heap@1 r_1@@11 g (int_2_U 4))) (state Heap@2 Mask@1)) (and (=> (= (ControlFlow 0 33) 30) anon68_Then_correct) (=> (= (ControlFlow 0 33) 32) anon68_Else_correct))))))))))))))
(let ((anon67_Else_correct  (=> (HasDirectPerm Mask@0 null (p2 r_1@@11 i@@12)) (=> (and (= Heap@1 Heap@@11) (= (ControlFlow 0 38) 33)) anon36_correct))))
(let ((anon67_Then_correct  (=> (and (and (not (HasDirectPerm Mask@0 null (p2 r_1@@11 i@@12))) (= Heap@0 (MapType0Store Heap@@11 null (p2 r_1@@11 i@@12) newVersion@0))) (and (= Heap@1 Heap@0) (= (ControlFlow 0 37) 33))) anon36_correct)))
(let ((anon34_correct  (=> (= Mask@0 (MapType1Store QPMask@1 null (p2 r_1@@11 i@@12) (real_2_U (- (U_2_real (MapType1Select QPMask@1 null (p2 r_1@@11 i@@12))) FullPerm)))) (and (=> (= (ControlFlow 0 39) 37) anon67_Then_correct) (=> (= (ControlFlow 0 39) 38) anon67_Else_correct)))))
(let ((anon66_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 42) 39)) anon34_correct)))
(let ((anon66_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 40) (- 0 41)) (<= FullPerm (U_2_real (MapType1Select QPMask@1 null (p2 r_1@@11 i@@12))))) (=> (<= FullPerm (U_2_real (MapType1Select QPMask@1 null (p2 r_1@@11 i@@12)))) (=> (= (ControlFlow 0 40) 39) anon34_correct))))))
(let ((anon61_Else_correct  (=> (>= 0 i@@12) (=> (and (|p2#trigger| Heap@@11 (p2 r_1@@11 i@@12)) (= (MapType0Select Heap@@11 null (p2 r_1@@11 i@@12)) (FrameFragment (MapType0Select Heap@@11 r_1@@11 f_7)))) (and (=> (= (ControlFlow 0 43) 40) anon66_Then_correct) (=> (= (ControlFlow 0 43) 42) anon66_Else_correct))))))
(let ((anon51_Else_correct  (and (=> (= (ControlFlow 0 94) (- 0 95)) (forall ((x_4 T@U) (x_4_1 T@U) ) (!  (=> (and (= (type x_4) RefType) (= (type x_4_1) RefType)) (=> (and (and (and (and (not (= x_4 x_4_1)) (|Seq#Contains| xs x_4)) (|Seq#Contains| xs x_4_1)) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= x_4 x_4_1))))
 :qid |stdinbpl.2675:15|
 :skolemid |258|
 :no-pattern (type x_4)
 :no-pattern (type x_4_1)
 :no-pattern (U_2_int x_4)
 :no-pattern (U_2_bool x_4)
 :no-pattern (U_2_int x_4_1)
 :no-pattern (U_2_bool x_4_1)
))) (=> (forall ((x_4@@0 T@U) (x_4_1@@0 T@U) ) (!  (=> (and (= (type x_4@@0) RefType) (= (type x_4_1@@0) RefType)) (=> (and (and (and (and (not (= x_4@@0 x_4_1@@0)) (|Seq#Contains| xs x_4@@0)) (|Seq#Contains| xs x_4_1@@0)) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= x_4@@0 x_4_1@@0))))
 :qid |stdinbpl.2675:15|
 :skolemid |258|
 :no-pattern (type x_4@@0)
 :no-pattern (type x_4_1@@0)
 :no-pattern (U_2_int x_4@@0)
 :no-pattern (U_2_bool x_4@@0)
 :no-pattern (U_2_int x_4_1@@0)
 :no-pattern (U_2_bool x_4_1@@0)
)) (=> (forall ((x_4@@1 T@U) ) (!  (=> (= (type x_4@@1) RefType) (=> (and (|Seq#Contains| xs x_4@@1) (< NoPerm FullPerm)) (and (qpRange32 x_4@@1) (= (invRecv32 x_4@@1) x_4@@1))))
 :qid |stdinbpl.2681:22|
 :skolemid |259|
 :pattern ( (MapType0Select Heap@@11 x_4@@1 g))
 :pattern ( (MapType1Select QPMask@1 x_4@@1 g))
 :pattern ( (|Seq#ContainsTrigger| xs x_4@@1))
 :pattern ( (|Seq#Contains| xs x_4@@1))
)) (=> (and (forall ((o_3@@7 T@U) ) (!  (=> (= (type o_3@@7) RefType) (=> (and (and (|Seq#Contains| xs (invRecv32 o_3@@7)) (< NoPerm FullPerm)) (qpRange32 o_3@@7)) (= (invRecv32 o_3@@7) o_3@@7)))
 :qid |stdinbpl.2685:22|
 :skolemid |260|
 :pattern ( (invRecv32 o_3@@7))
)) (forall ((x_4@@2 T@U) ) (!  (=> (and (= (type x_4@@2) RefType) (|Seq#Contains| xs x_4@@2)) (not (= x_4@@2 null)))
 :qid |stdinbpl.2691:22|
 :skolemid |261|
 :pattern ( (MapType0Select Heap@@11 x_4@@2 g))
 :pattern ( (MapType1Select QPMask@1 x_4@@2 g))
 :pattern ( (|Seq#ContainsTrigger| xs x_4@@2))
 :pattern ( (|Seq#Contains| xs x_4@@2))
))) (=> (and (and (forall ((o_3@@8 T@U) ) (!  (=> (= (type o_3@@8) RefType) (and (=> (and (and (|Seq#Contains| xs (invRecv32 o_3@@8)) (< NoPerm FullPerm)) (qpRange32 o_3@@8)) (and (=> (< NoPerm FullPerm) (= (invRecv32 o_3@@8) o_3@@8)) (= (U_2_real (MapType1Select QPMask@1 o_3@@8 g)) (+ (U_2_real (MapType1Select QPMask@0 o_3@@8 g)) FullPerm)))) (=> (not (and (and (|Seq#Contains| xs (invRecv32 o_3@@8)) (< NoPerm FullPerm)) (qpRange32 o_3@@8))) (= (U_2_real (MapType1Select QPMask@1 o_3@@8 g)) (U_2_real (MapType1Select QPMask@0 o_3@@8 g))))))
 :qid |stdinbpl.2697:22|
 :skolemid |262|
 :pattern ( (MapType1Select QPMask@1 o_3@@8 g))
)) (forall ((o_3@@9 T@U) (f_5@@3 T@U) ) (! (let ((B@@15 (FieldTypeInv1 (type f_5@@3))))
(let ((A@@16 (FieldTypeInv0 (type f_5@@3))))
 (=> (and (and (= (type o_3@@9) RefType) (= (type f_5@@3) (FieldType A@@16 B@@15))) (not (= f_5@@3 g))) (= (U_2_real (MapType1Select QPMask@0 o_3@@9 f_5@@3)) (U_2_real (MapType1Select QPMask@1 o_3@@9 f_5@@3))))))
 :qid |stdinbpl.2701:29|
 :skolemid |263|
 :pattern ( (MapType1Select QPMask@0 o_3@@9 f_5@@3))
 :pattern ( (MapType1Select QPMask@1 o_3@@9 f_5@@3))
))) (and (state Heap@@11 QPMask@1) (state Heap@@11 QPMask@1))) (and (and (=> (= (ControlFlow 0 94) 93) anon52_Then_correct) (=> (= (ControlFlow 0 94) 62) anon61_Then_correct)) (=> (= (ControlFlow 0 94) 43) anon61_Else_correct)))))))))
(let ((anon51_Then_correct true))
(let ((anon50_Else_correct  (and (=> (= (ControlFlow 0 96) (- 0 97)) (forall ((x_1 T@U) (x_1_1 T@U) ) (!  (=> (and (= (type x_1) RefType) (= (type x_1_1) RefType)) (=> (and (and (and (and (not (= x_1 x_1_1)) (|Seq#Contains| xs x_1)) (|Seq#Contains| xs x_1_1)) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (or (not (= x_1 x_1_1)) (not (= i@@12 i@@12)))))
 :qid |stdinbpl.2636:17|
 :skolemid |252|
 :pattern ( (neverTriggered31 x_1) (neverTriggered31 x_1_1))
))) (=> (forall ((x_1@@0 T@U) (x_1_1@@0 T@U) ) (!  (=> (and (= (type x_1@@0) RefType) (= (type x_1_1@@0) RefType)) (=> (and (and (and (and (not (= x_1@@0 x_1_1@@0)) (|Seq#Contains| xs x_1@@0)) (|Seq#Contains| xs x_1_1@@0)) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (or (not (= x_1@@0 x_1_1@@0)) (not (= i@@12 i@@12)))))
 :qid |stdinbpl.2636:17|
 :skolemid |252|
 :pattern ( (neverTriggered31 x_1@@0) (neverTriggered31 x_1_1@@0))
)) (=> (and (forall ((x_1@@1 T@U) ) (!  (=> (= (type x_1@@1) RefType) (=> (and (|Seq#Contains| xs x_1@@1) (< NoPerm FullPerm)) (and (= (invRecv31 x_1@@1 i@@12) x_1@@1) (qpRange31 x_1@@1 i@@12))))
 :qid |stdinbpl.2642:22|
 :skolemid |253|
 :pattern ( (MapType0Select Heap@@11 null (p2 x_1@@1 i@@12)))
 :pattern ( (MapType1Select ZeroMask null (p2 x_1@@1 i@@12)))
 :pattern ( (|Seq#ContainsTrigger| xs x_1@@1))
 :pattern ( (|Seq#Contains| xs x_1@@1))
)) (forall ((r_1_1 T@U) (i_1_1 Int) ) (!  (=> (= (type r_1_1) RefType) (=> (and (and (|Seq#Contains| xs (invRecv31 r_1_1 i_1_1)) (< NoPerm FullPerm)) (qpRange31 r_1_1 i_1_1)) (and (= (invRecv31 r_1_1 i_1_1) r_1_1) (= i@@12 i_1_1))))
 :qid |stdinbpl.2646:22|
 :skolemid |254|
 :pattern ( (invRecv31 r_1_1 i_1_1))
))) (=> (and (and (forall ((r_1_1@@0 T@U) (i_1_1@@0 Int) ) (!  (=> (= (type r_1_1@@0) RefType) (=> (and (and (|Seq#Contains| xs (invRecv31 r_1_1@@0 i_1_1@@0)) (< NoPerm FullPerm)) (qpRange31 r_1_1@@0 i_1_1@@0)) (and (=> (< NoPerm FullPerm) (and (= (invRecv31 r_1_1@@0 i_1_1@@0) r_1_1@@0) (= i@@12 i_1_1@@0))) (= (U_2_real (MapType1Select QPMask@0 null (p2 r_1_1@@0 i_1_1@@0))) (+ (U_2_real (MapType1Select ZeroMask null (p2 r_1_1@@0 i_1_1@@0))) FullPerm)))))
 :qid |stdinbpl.2652:22|
 :skolemid |255|
 :pattern ( (MapType1Select QPMask@0 null (p2 r_1_1@@0 i_1_1@@0)))
)) (forall ((o_3@@10 T@U) (f_5@@4 T@U) ) (! (let ((B@@16 (FieldTypeInv1 (type f_5@@4))))
(let ((A@@17 (FieldTypeInv0 (type f_5@@4))))
 (=> (and (and (= (type o_3@@10) RefType) (= (type f_5@@4) (FieldType A@@17 B@@16))) (or (or (not (= o_3@@10 null)) (not (IsPredicateField f_5@@4))) (not (= (getPredWandId f_5@@4) 1)))) (= (U_2_real (MapType1Select ZeroMask o_3@@10 f_5@@4)) (U_2_real (MapType1Select QPMask@0 o_3@@10 f_5@@4))))))
 :qid |stdinbpl.2658:29|
 :skolemid |256|
 :pattern ( (MapType1Select ZeroMask o_3@@10 f_5@@4))
 :pattern ( (MapType1Select QPMask@0 o_3@@10 f_5@@4))
))) (and (forall ((r_1_1@@1 T@U) (i_1_1@@1 Int) ) (!  (=> (and (= (type r_1_1@@1) RefType) (not (and (and (|Seq#Contains| xs (invRecv31 r_1_1@@1 i_1_1@@1)) (< NoPerm FullPerm)) (qpRange31 r_1_1@@1 i_1_1@@1)))) (= (U_2_real (MapType1Select QPMask@0 null (p2 r_1_1@@1 i_1_1@@1))) (U_2_real (MapType1Select ZeroMask null (p2 r_1_1@@1 i_1_1@@1)))))
 :qid |stdinbpl.2662:22|
 :skolemid |257|
 :pattern ( (MapType1Select QPMask@0 null (p2 r_1_1@@1 i_1_1@@1)))
)) (state Heap@@11 QPMask@0))) (and (=> (= (ControlFlow 0 96) 2) anon51_Then_correct) (=> (= (ControlFlow 0 96) 94) anon51_Else_correct))))))))
(let ((anon50_Then_correct true))
(let ((anon0_correct  (=> (and (and (state Heap@@11 ZeroMask) (U_2_bool (MapType0Select Heap@@11 r_1@@11 $allocated))) (and (|Seq#Contains| xs r_1@@11) (state Heap@@11 ZeroMask))) (and (=> (= (ControlFlow 0 98) 1) anon50_Then_correct) (=> (= (ControlFlow 0 98) 96) anon50_Else_correct)))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 99) 98) anon0_correct)))
PreconditionGeneratedEntry_correct))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
))
(check-sat)
(pop 1)
; Valid
(get-info :rlimit)
