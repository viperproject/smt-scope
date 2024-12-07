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
(declare-fun Integer__item () T@U)
(declare-fun FieldType (T@T T@T) T@T)
(declare-fun FieldTypeInv0 (T@T) T@T)
(declare-fun FieldTypeInv1 (T@T) T@T)
(declare-fun NormalFieldType () T@T)
(declare-fun |Seq#Length| (T@U) Int)
(declare-fun |Seq#Drop| (T@U Int) T@U)
(declare-fun SeqTypeInv0 (T@T) T@T)
(declare-fun SeqType (T@T) T@T)
(declare-fun IsReordered (T@U T@U T@U T@U Int) Bool)
(declare-fun MapType0Type (T@T) T@T)
(declare-fun RefType () T@T)
(declare-fun VCTArrayDomainTypeType (T@T) T@T)
(declare-fun |IsReordered'| (T@U T@U T@U T@U Int) Bool)
(declare-fun dummyFunction (T@U) Bool)
(declare-fun |IsReordered#triggerStateless| (T@U T@U T@U Int) Bool)
(declare-fun MapType0TypeInv0 (T@T) T@T)
(declare-fun MapType0Select (T@U T@U T@U) T@U)
(declare-fun MapType0Store (T@U T@U T@U T@U) T@U)
(declare-fun VCTArrayDomainTypeTypeInv0 (T@T) T@T)
(declare-fun state (T@U T@U) Bool)
(declare-fun |CheckBounded'| (T@U T@U Int) Bool)
(declare-fun MapType1Type (T@T T@T) T@T)
(declare-fun |CheckBounded#frame| (T@U T@U Int) Bool)
(declare-fun EmptyFrame () T@U)
(declare-fun MapType1TypeInv0 (T@T) T@T)
(declare-fun MapType1TypeInv1 (T@T) T@T)
(declare-fun MapType1Select (T@U T@U T@U) T@U)
(declare-fun MapType1Store (T@U T@U T@U T@U) T@U)
(declare-fun FrameTypeType () T@T)
(declare-fun succHeap (T@U T@U) Bool)
(declare-fun succHeapTrans (T@U T@U) Bool)
(declare-fun GoodMask (T@U) Bool)
(declare-fun loc (T@U Int) T@U)
(declare-fun alen (T@U) Int)
(declare-fun |CheckBounded#triggerStateless| (T@U Int) Bool)
(declare-fun |Seq#Index| (T@U Int) T@U)
(declare-fun |Seq#Sub| (Int Int) Int)
(declare-fun |Seq#Add| (Int Int) Int)
(declare-fun IdenticalOnKnownLocations (T@U T@U T@U) Bool)
(declare-fun IsPredicateField (T@U) Bool)
(declare-fun null () T@U)
(declare-fun PredicateMaskField (T@U) T@U)
(declare-fun HasDirectPerm (T@U T@U T@U) Bool)
(declare-fun IsWandField (T@U) Bool)
(declare-fun WandMaskField (T@U) T@U)
(declare-fun AssumeFunctionsAbove () Int)
(declare-fun |CheckBounded#trigger| (T@U T@U Int) Bool)
(declare-fun |Seq#Update| (T@U Int T@U) T@U)
(declare-fun |IsReordered#condqp1| (T@U T@U T@U T@U Int) Int)
(declare-fun |sk_IsReordered#condqp1| (Int Int) Int)
(declare-fun NoPerm () Real)
(declare-fun |IsReordered#condqp2| (T@U T@U T@U T@U Int) Int)
(declare-fun |sk_IsReordered#condqp2| (Int Int) Int)
(declare-fun |Seq#Take| (T@U Int) T@U)
(declare-fun |Seq#Contains| (T@U T@U) Bool)
(declare-fun |Seq#Range| (Int Int) T@U)
(declare-fun |Seq#Skolem| (T@U T@U) Int)
(declare-fun |Seq#Singleton| (T@U) T@U)
(declare-fun |IsReordered#trigger| (T@U T@U T@U T@U Int) Bool)
(declare-fun CombineFrames (T@U T@U) T@U)
(declare-fun FrameFragment (T@U) T@U)
(declare-fun CheckBounded (T@U T@U Int) Bool)
(declare-fun |Seq#Empty| (T@T) T@U)
(declare-fun dummyHeap () T@U)
(declare-fun ZeroMask () T@U)
(declare-fun InsidePredicate (T@U T@U T@U T@U) Bool)
(declare-fun |Seq#Append| (T@U T@U) T@U)
(declare-fun sumMask (T@U T@U T@U) Bool)
(declare-fun ConditionalFrame (Real T@U) T@U)
(declare-fun |IsReordered#frame| (T@U T@U T@U T@U Int) Bool)
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
(assert  (and (and (and (and (and (forall ((arg0@@11 T@T) (arg1 T@T) ) (! (= (Ctor (FieldType arg0@@11 arg1)) 6)
 :qid |ctor:FieldType|
)) (forall ((arg0@@12 T@T) (arg1@@0 T@T) ) (! (= (FieldTypeInv0 (FieldType arg0@@12 arg1@@0)) arg0@@12)
 :qid |typeInv:FieldTypeInv0|
 :pattern ( (FieldType arg0@@12 arg1@@0))
))) (forall ((arg0@@13 T@T) (arg1@@1 T@T) ) (! (= (FieldTypeInv1 (FieldType arg0@@13 arg1@@1)) arg1@@1)
 :qid |typeInv:FieldTypeInv1|
 :pattern ( (FieldType arg0@@13 arg1@@1))
))) (= (Ctor NormalFieldType) 7)) (= (type $allocated) (FieldType NormalFieldType boolType))) (= (type Integer__item) (FieldType NormalFieldType intType))))
(assert (distinct $allocated Integer__item)
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
 :qid |stdinbpl.305:18|
 :skolemid |38|
 :pattern ( (|Seq#Length| (|Seq#Drop| s n)))
 :pattern ( (|Seq#Length| s) (|Seq#Drop| s n))
)))
(assert  (and (and (and (and (and (and (and (and (forall ((arg0@@17 T@T) ) (! (= (Ctor (MapType0Type arg0@@17)) 9)
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
)))) (= (Ctor RefType) 10)) (forall ((arg0@@21 T@T) ) (! (= (Ctor (VCTArrayDomainTypeType arg0@@21)) 11)
 :qid |ctor:VCTArrayDomainTypeType|
))) (forall ((arg0@@22 T@T) ) (! (= (VCTArrayDomainTypeTypeInv0 (VCTArrayDomainTypeType arg0@@22)) arg0@@22)
 :qid |typeInv:VCTArrayDomainTypeTypeInv0|
 :pattern ( (VCTArrayDomainTypeType arg0@@22))
))))
(assert (forall ((Heap T@U) (origL T@U) (newO T@U) (newL T@U) (maxLen Int) ) (!  (=> (and (and (and (= (type Heap) (MapType0Type RefType)) (= (type origL) (VCTArrayDomainTypeType RefType))) (= (type newO) (SeqType intType))) (= (type newL) (VCTArrayDomainTypeType RefType))) (and (= (IsReordered Heap origL newO newL maxLen) (|IsReordered'| Heap origL newO newL maxLen)) (dummyFunction (bool_2_U (|IsReordered#triggerStateless| origL newO newL maxLen)))))
 :qid |stdinbpl.686:15|
 :skolemid |66|
 :pattern ( (IsReordered Heap origL newO newL maxLen))
)))
(assert  (and (and (and (and (and (and (and (and (forall ((arg0@@23 T@T) (arg1@@5 T@T) ) (! (= (Ctor (MapType1Type arg0@@23 arg1@@5)) 12)
 :qid |ctor:MapType1Type|
)) (forall ((arg0@@24 T@T) (arg1@@6 T@T) ) (! (= (MapType1TypeInv0 (MapType1Type arg0@@24 arg1@@6)) arg0@@24)
 :qid |typeInv:MapType1TypeInv0|
 :pattern ( (MapType1Type arg0@@24 arg1@@6))
))) (forall ((arg0@@25 T@T) (arg1@@7 T@T) ) (! (= (MapType1TypeInv1 (MapType1Type arg0@@25 arg1@@7)) arg1@@7)
 :qid |typeInv:MapType1TypeInv1|
 :pattern ( (MapType1Type arg0@@25 arg1@@7))
))) (forall ((arg0@@26 T@U) (arg1@@8 T@U) (arg2@@1 T@U) ) (! (let ((aVar1 (MapType1TypeInv1 (type arg0@@26))))
(= (type (MapType1Select arg0@@26 arg1@@8 arg2@@1)) aVar1))
 :qid |funType:MapType1Select|
 :pattern ( (MapType1Select arg0@@26 arg1@@8 arg2@@1))
))) (forall ((arg0@@27 T@U) (arg1@@9 T@U) (arg2@@2 T@U) (arg3@@0 T@U) ) (! (let ((aVar1@@0 (type arg3@@0)))
(let ((aVar0@@0 (type arg1@@9)))
(= (type (MapType1Store arg0@@27 arg1@@9 arg2@@2 arg3@@0)) (MapType1Type aVar0@@0 aVar1@@0))))
 :qid |funType:MapType1Store|
 :pattern ( (MapType1Store arg0@@27 arg1@@9 arg2@@2 arg3@@0))
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
)))) (= (Ctor FrameTypeType) 13)) (= (type EmptyFrame) FrameTypeType)))
(assert (forall ((Heap@@0 T@U) (Mask T@U) (order T@U) (maxLen@@0 Int) ) (!  (=> (and (and (and (= (type Heap@@0) (MapType0Type RefType)) (= (type Mask) (MapType1Type RefType realType))) (= (type order) (SeqType intType))) (state Heap@@0 Mask)) (= (|CheckBounded'| Heap@@0 order maxLen@@0) (|CheckBounded#frame| EmptyFrame order maxLen@@0)))
 :qid |stdinbpl.622:15|
 :skolemid |62|
 :pattern ( (state Heap@@0 Mask) (|CheckBounded'| Heap@@0 order maxLen@@0))
)))
(assert (forall ((Heap0 T@U) (Heap1 T@U) ) (!  (=> (and (and (= (type Heap0) (MapType0Type RefType)) (= (type Heap1) (MapType0Type RefType))) (succHeap Heap0 Heap1)) (succHeapTrans Heap0 Heap1))
 :qid |stdinbpl.88:15|
 :skolemid |11|
 :pattern ( (succHeap Heap0 Heap1))
)))
(assert (forall ((Heap@@1 T@U) (Mask@@0 T@U) ) (!  (=> (and (and (= (type Heap@@1) (MapType0Type RefType)) (= (type Mask@@0) (MapType1Type RefType realType))) (state Heap@@1 Mask@@0)) (GoodMask Mask@@0))
 :qid |stdinbpl.124:15|
 :skolemid |15|
 :pattern ( (state Heap@@1 Mask@@0))
)))
(assert (forall ((Heap0@@0 T@U) (Heap1@@0 T@U) (Heap2 T@U) ) (!  (=> (and (and (and (= (type Heap0@@0) (MapType0Type RefType)) (= (type Heap1@@0) (MapType0Type RefType))) (= (type Heap2) (MapType0Type RefType))) (and (succHeapTrans Heap0@@0 Heap1@@0) (succHeap Heap1@@0 Heap2))) (succHeapTrans Heap0@@0 Heap2))
 :qid |stdinbpl.93:15|
 :skolemid |12|
 :pattern ( (succHeapTrans Heap0@@0 Heap1@@0) (succHeap Heap1@@0 Heap2))
)))
(assert (forall ((arg0@@28 T@U) (arg1@@10 Int) ) (! (let ((CT (VCTArrayDomainTypeTypeInv0 (type arg0@@28))))
(= (type (loc arg0@@28 arg1@@10)) CT))
 :qid |funType:loc|
 :pattern ( (loc arg0@@28 arg1@@10))
)))
(assert (forall ((a_3 T@U) (i_2 Int) (j Int) ) (! (let ((CT@@0 (VCTArrayDomainTypeTypeInv0 (type a_3))))
 (=> (= (type a_3) (VCTArrayDomainTypeType CT@@0)) (=> (and (>= i_2 0) (and (>= j 0) (and (< i_2 (alen a_3)) (and (< j (alen a_3)) (not (= i_2 j)))))) (not (= (loc a_3 i_2) (loc a_3 j))))))
 :qid |stdinbpl.591:20|
 :skolemid |59|
 :pattern ( (loc a_3 i_2) (loc a_3 j))
)))
(assert (forall ((Heap@@2 T@U) (order@@0 T@U) (maxLen@@1 Int) ) (!  (=> (and (= (type Heap@@2) (MapType0Type RefType)) (= (type order@@0) (SeqType intType))) (dummyFunction (bool_2_U (|CheckBounded#triggerStateless| order@@0 maxLen@@1))))
 :qid |stdinbpl.615:15|
 :skolemid |61|
 :pattern ( (|CheckBounded'| Heap@@2 order@@0 maxLen@@1))
)))
(assert (forall ((arg0@@29 T@U) (arg1@@11 Int) ) (! (let ((T@@1 (SeqTypeInv0 (type arg0@@29))))
(= (type (|Seq#Index| arg0@@29 arg1@@11)) T@@1))
 :qid |funType:Seq#Index|
 :pattern ( (|Seq#Index| arg0@@29 arg1@@11))
)))
(assert (forall ((s@@0 T@U) (n@@0 Int) (j@@0 Int) ) (! (let ((T@@2 (SeqTypeInv0 (type s@@0))))
 (=> (= (type s@@0) (SeqType T@@2)) (=> (and (and (< 0 n@@0) (<= 0 j@@0)) (< j@@0 (- (|Seq#Length| s@@0) n@@0))) (and (= (|Seq#Sub| (|Seq#Add| j@@0 n@@0) n@@0) j@@0) (= (|Seq#Index| (|Seq#Drop| s@@0 n@@0) j@@0) (|Seq#Index| s@@0 (|Seq#Add| j@@0 n@@0)))))))
 :qid |stdinbpl.326:18|
 :skolemid |39|
 :pattern ( (|Seq#Index| (|Seq#Drop| s@@0 n@@0) j@@0))
)))
(assert  (and (= (type null) RefType) (forall ((arg0@@30 T@U) ) (! (let ((A (FieldTypeInv0 (type arg0@@30))))
(= (type (PredicateMaskField arg0@@30)) (FieldType A (MapType1Type RefType boolType))))
 :qid |funType:PredicateMaskField|
 :pattern ( (PredicateMaskField arg0@@30))
))))
(assert (forall ((Heap@@3 T@U) (ExhaleHeap T@U) (Mask@@1 T@U) (pm_f T@U) ) (! (let ((C (FieldTypeInv0 (type pm_f))))
 (=> (and (and (and (and (and (= (type Heap@@3) (MapType0Type RefType)) (= (type ExhaleHeap) (MapType0Type RefType))) (= (type Mask@@1) (MapType1Type RefType realType))) (= (type pm_f) (FieldType C FrameTypeType))) (IdenticalOnKnownLocations Heap@@3 ExhaleHeap Mask@@1)) (and (HasDirectPerm Mask@@1 null pm_f) (IsPredicateField pm_f))) (= (MapType0Select Heap@@3 null (PredicateMaskField pm_f)) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))))
 :qid |stdinbpl.47:19|
 :skolemid |2|
 :pattern ( (IdenticalOnKnownLocations Heap@@3 ExhaleHeap Mask@@1) (IsPredicateField pm_f) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))
)))
(assert (forall ((arg0@@31 T@U) ) (! (let ((A@@0 (FieldTypeInv0 (type arg0@@31))))
(= (type (WandMaskField arg0@@31)) (FieldType A@@0 (MapType1Type RefType boolType))))
 :qid |funType:WandMaskField|
 :pattern ( (WandMaskField arg0@@31))
)))
(assert (forall ((Heap@@4 T@U) (ExhaleHeap@@0 T@U) (Mask@@2 T@U) (pm_f@@0 T@U) ) (! (let ((C@@0 (FieldTypeInv0 (type pm_f@@0))))
 (=> (and (and (and (and (and (= (type Heap@@4) (MapType0Type RefType)) (= (type ExhaleHeap@@0) (MapType0Type RefType))) (= (type Mask@@2) (MapType1Type RefType realType))) (= (type pm_f@@0) (FieldType C@@0 FrameTypeType))) (IdenticalOnKnownLocations Heap@@4 ExhaleHeap@@0 Mask@@2)) (and (HasDirectPerm Mask@@2 null pm_f@@0) (IsWandField pm_f@@0))) (= (MapType0Select Heap@@4 null (WandMaskField pm_f@@0)) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))))
 :qid |stdinbpl.60:19|
 :skolemid |5|
 :pattern ( (IdenticalOnKnownLocations Heap@@4 ExhaleHeap@@0 Mask@@2) (IsWandField pm_f@@0) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))
)))
(assert (forall ((Heap@@5 T@U) (Mask@@3 T@U) (order@@1 T@U) (maxLen@@2 Int) ) (!  (=> (and (and (and (= (type Heap@@5) (MapType0Type RefType)) (= (type Mask@@3) (MapType1Type RefType realType))) (= (type order@@1) (SeqType intType))) (and (state Heap@@5 Mask@@3) (or (< AssumeFunctionsAbove 1) (|CheckBounded#trigger| EmptyFrame order@@1 maxLen@@2)))) (and (<= (|Seq#Length| order@@1) maxLen@@2) (forall ((i_2@@0 Int) ) (!  (=> (and (<= 0 i_2@@0) (< i_2@@0 (|Seq#Length| order@@1))) (and (<= 0 (U_2_int (|Seq#Index| order@@1 i_2@@0))) (< (U_2_int (|Seq#Index| order@@1 i_2@@0)) maxLen@@2)))
 :qid |stdinbpl.630:145|
 :skolemid |63|
 :pattern ( (|Seq#Index| order@@1 i_2@@0))
))))
 :qid |stdinbpl.628:15|
 :skolemid |64|
 :pattern ( (state Heap@@5 Mask@@3) (|CheckBounded'| Heap@@5 order@@1 maxLen@@2))
)))
(assert (forall ((arg0@@32 T@U) (arg1@@12 Int) (arg2@@3 T@U) ) (! (let ((T@@3 (type arg2@@3)))
(= (type (|Seq#Update| arg0@@32 arg1@@12 arg2@@3)) (SeqType T@@3)))
 :qid |funType:Seq#Update|
 :pattern ( (|Seq#Update| arg0@@32 arg1@@12 arg2@@3))
)))
(assert (forall ((s@@1 T@U) (i Int) (v T@U) (n@@1 Int) ) (! (let ((T@@4 (type v)))
 (=> (= (type s@@1) (SeqType T@@4)) (=> (and (<= 0 n@@1) (< n@@1 (|Seq#Length| s@@1))) (and (=> (= i n@@1) (= (|Seq#Index| (|Seq#Update| s@@1 i v) n@@1) v)) (=> (not (= i n@@1)) (= (|Seq#Index| (|Seq#Update| s@@1 i v) n@@1) (|Seq#Index| s@@1 n@@1)))))))
 :qid |stdinbpl.281:18|
 :skolemid |35|
 :pattern ( (|Seq#Index| (|Seq#Update| s@@1 i v) n@@1))
 :pattern ( (|Seq#Index| s@@1 n@@1) (|Seq#Update| s@@1 i v))
)))
(assert (forall ((Heap2Heap T@U) (Heap1Heap T@U) (origL@@0 T@U) (newO@@0 T@U) (newL@@0 T@U) (maxLen@@3 Int) ) (!  (=> (and (and (and (and (and (= (type Heap2Heap) (MapType0Type RefType)) (= (type Heap1Heap) (MapType0Type RefType))) (= (type origL@@0) (VCTArrayDomainTypeType RefType))) (= (type newO@@0) (SeqType intType))) (= (type newL@@0) (VCTArrayDomainTypeType RefType))) (and (=  (and (and (<= 0 (|sk_IsReordered#condqp1| (|IsReordered#condqp1| Heap2Heap origL@@0 newO@@0 newL@@0 maxLen@@3) (|IsReordered#condqp1| Heap1Heap origL@@0 newO@@0 newL@@0 maxLen@@3))) (< (|sk_IsReordered#condqp1| (|IsReordered#condqp1| Heap2Heap origL@@0 newO@@0 newL@@0 maxLen@@3) (|IsReordered#condqp1| Heap1Heap origL@@0 newO@@0 newL@@0 maxLen@@3)) (alen origL@@0))) (< NoPerm (/ (to_real 1) (to_real 2))))  (and (and (<= 0 (|sk_IsReordered#condqp1| (|IsReordered#condqp1| Heap2Heap origL@@0 newO@@0 newL@@0 maxLen@@3) (|IsReordered#condqp1| Heap1Heap origL@@0 newO@@0 newL@@0 maxLen@@3))) (< (|sk_IsReordered#condqp1| (|IsReordered#condqp1| Heap2Heap origL@@0 newO@@0 newL@@0 maxLen@@3) (|IsReordered#condqp1| Heap1Heap origL@@0 newO@@0 newL@@0 maxLen@@3)) (alen origL@@0))) (< NoPerm (/ (to_real 1) (to_real 2))))) (=> (and (and (<= 0 (|sk_IsReordered#condqp1| (|IsReordered#condqp1| Heap2Heap origL@@0 newO@@0 newL@@0 maxLen@@3) (|IsReordered#condqp1| Heap1Heap origL@@0 newO@@0 newL@@0 maxLen@@3))) (< (|sk_IsReordered#condqp1| (|IsReordered#condqp1| Heap2Heap origL@@0 newO@@0 newL@@0 maxLen@@3) (|IsReordered#condqp1| Heap1Heap origL@@0 newO@@0 newL@@0 maxLen@@3)) (alen origL@@0))) (< NoPerm (/ (to_real 1) (to_real 2)))) (= (U_2_int (MapType0Select Heap2Heap (loc origL@@0 (|sk_IsReordered#condqp1| (|IsReordered#condqp1| Heap2Heap origL@@0 newO@@0 newL@@0 maxLen@@3) (|IsReordered#condqp1| Heap1Heap origL@@0 newO@@0 newL@@0 maxLen@@3))) Integer__item)) (U_2_int (MapType0Select Heap1Heap (loc origL@@0 (|sk_IsReordered#condqp1| (|IsReordered#condqp1| Heap2Heap origL@@0 newO@@0 newL@@0 maxLen@@3) (|IsReordered#condqp1| Heap1Heap origL@@0 newO@@0 newL@@0 maxLen@@3))) Integer__item)))))) (= (|IsReordered#condqp1| Heap2Heap origL@@0 newO@@0 newL@@0 maxLen@@3) (|IsReordered#condqp1| Heap1Heap origL@@0 newO@@0 newL@@0 maxLen@@3)))
 :qid |stdinbpl.716:15|
 :skolemid |71|
 :pattern ( (|IsReordered#condqp1| Heap2Heap origL@@0 newO@@0 newL@@0 maxLen@@3) (|IsReordered#condqp1| Heap1Heap origL@@0 newO@@0 newL@@0 maxLen@@3) (succHeapTrans Heap2Heap Heap1Heap))
)))
(assert (forall ((Heap2Heap@@0 T@U) (Heap1Heap@@0 T@U) (origL@@1 T@U) (newO@@1 T@U) (newL@@1 T@U) (maxLen@@4 Int) ) (!  (=> (and (and (and (and (and (= (type Heap2Heap@@0) (MapType0Type RefType)) (= (type Heap1Heap@@0) (MapType0Type RefType))) (= (type origL@@1) (VCTArrayDomainTypeType RefType))) (= (type newO@@1) (SeqType intType))) (= (type newL@@1) (VCTArrayDomainTypeType RefType))) (and (=  (and (and (<= 0 (|sk_IsReordered#condqp2| (|IsReordered#condqp2| Heap2Heap@@0 origL@@1 newO@@1 newL@@1 maxLen@@4) (|IsReordered#condqp2| Heap1Heap@@0 origL@@1 newO@@1 newL@@1 maxLen@@4))) (< (|sk_IsReordered#condqp2| (|IsReordered#condqp2| Heap2Heap@@0 origL@@1 newO@@1 newL@@1 maxLen@@4) (|IsReordered#condqp2| Heap1Heap@@0 origL@@1 newO@@1 newL@@1 maxLen@@4)) (alen newL@@1))) (< NoPerm (/ (to_real 1) (to_real 2))))  (and (and (<= 0 (|sk_IsReordered#condqp2| (|IsReordered#condqp2| Heap2Heap@@0 origL@@1 newO@@1 newL@@1 maxLen@@4) (|IsReordered#condqp2| Heap1Heap@@0 origL@@1 newO@@1 newL@@1 maxLen@@4))) (< (|sk_IsReordered#condqp2| (|IsReordered#condqp2| Heap2Heap@@0 origL@@1 newO@@1 newL@@1 maxLen@@4) (|IsReordered#condqp2| Heap1Heap@@0 origL@@1 newO@@1 newL@@1 maxLen@@4)) (alen newL@@1))) (< NoPerm (/ (to_real 1) (to_real 2))))) (=> (and (and (<= 0 (|sk_IsReordered#condqp2| (|IsReordered#condqp2| Heap2Heap@@0 origL@@1 newO@@1 newL@@1 maxLen@@4) (|IsReordered#condqp2| Heap1Heap@@0 origL@@1 newO@@1 newL@@1 maxLen@@4))) (< (|sk_IsReordered#condqp2| (|IsReordered#condqp2| Heap2Heap@@0 origL@@1 newO@@1 newL@@1 maxLen@@4) (|IsReordered#condqp2| Heap1Heap@@0 origL@@1 newO@@1 newL@@1 maxLen@@4)) (alen newL@@1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (= (U_2_int (MapType0Select Heap2Heap@@0 (loc newL@@1 (|sk_IsReordered#condqp2| (|IsReordered#condqp2| Heap2Heap@@0 origL@@1 newO@@1 newL@@1 maxLen@@4) (|IsReordered#condqp2| Heap1Heap@@0 origL@@1 newO@@1 newL@@1 maxLen@@4))) Integer__item)) (U_2_int (MapType0Select Heap1Heap@@0 (loc newL@@1 (|sk_IsReordered#condqp2| (|IsReordered#condqp2| Heap2Heap@@0 origL@@1 newO@@1 newL@@1 maxLen@@4) (|IsReordered#condqp2| Heap1Heap@@0 origL@@1 newO@@1 newL@@1 maxLen@@4))) Integer__item)))))) (= (|IsReordered#condqp2| Heap2Heap@@0 origL@@1 newO@@1 newL@@1 maxLen@@4) (|IsReordered#condqp2| Heap1Heap@@0 origL@@1 newO@@1 newL@@1 maxLen@@4)))
 :qid |stdinbpl.726:15|
 :skolemid |72|
 :pattern ( (|IsReordered#condqp2| Heap2Heap@@0 origL@@1 newO@@1 newL@@1 maxLen@@4) (|IsReordered#condqp2| Heap1Heap@@0 origL@@1 newO@@1 newL@@1 maxLen@@4) (succHeapTrans Heap2Heap@@0 Heap1Heap@@0))
)))
(assert (forall ((arg0@@33 T@U) (arg1@@13 Int) ) (! (let ((T@@5 (SeqTypeInv0 (type arg0@@33))))
(= (type (|Seq#Take| arg0@@33 arg1@@13)) (SeqType T@@5)))
 :qid |funType:Seq#Take|
 :pattern ( (|Seq#Take| arg0@@33 arg1@@13))
)))
(assert (forall ((s@@2 T@U) (n@@2 Int) ) (! (let ((T@@6 (SeqTypeInv0 (type s@@2))))
 (=> (= (type s@@2) (SeqType T@@6)) (and (=> (<= 0 n@@2) (and (=> (<= n@@2 (|Seq#Length| s@@2)) (= (|Seq#Length| (|Seq#Take| s@@2 n@@2)) n@@2)) (=> (< (|Seq#Length| s@@2) n@@2) (= (|Seq#Length| (|Seq#Take| s@@2 n@@2)) (|Seq#Length| s@@2))))) (=> (< n@@2 0) (= (|Seq#Length| (|Seq#Take| s@@2 n@@2)) 0)))))
 :qid |stdinbpl.292:18|
 :skolemid |36|
 :pattern ( (|Seq#Length| (|Seq#Take| s@@2 n@@2)))
 :pattern ( (|Seq#Take| s@@2 n@@2) (|Seq#Length| s@@2))
)))
(assert (forall ((arg0@@34 Int) (arg1@@14 Int) ) (! (= (type (|Seq#Range| arg0@@34 arg1@@14)) (SeqType intType))
 :qid |funType:Seq#Range|
 :pattern ( (|Seq#Range| arg0@@34 arg1@@14))
)))
(assert (forall ((q@min Int) (q@max Int) (v@@0 T@U) ) (!  (=> (= (type v@@0) intType) (= (|Seq#Contains| (|Seq#Range| q@min q@max) v@@0)  (and (<= q@min (U_2_int v@@0)) (< (U_2_int v@@0) q@max))))
 :qid |stdinbpl.565:15|
 :skolemid |57|
 :pattern ( (|Seq#Contains| (|Seq#Range| q@min q@max) v@@0))
)))
(assert (forall ((s@@3 T@U) (x@@8 T@U) ) (! (let ((T@@7 (type x@@8)))
 (=> (and (= (type s@@3) (SeqType T@@7)) (|Seq#Contains| s@@3 x@@8)) (and (and (<= 0 (|Seq#Skolem| s@@3 x@@8)) (< (|Seq#Skolem| s@@3 x@@8) (|Seq#Length| s@@3))) (= (|Seq#Index| s@@3 (|Seq#Skolem| s@@3 x@@8)) x@@8))))
 :qid |stdinbpl.423:18|
 :skolemid |47|
 :pattern ( (|Seq#Contains| s@@3 x@@8))
)))
(assert (forall ((Heap@@6 T@U) (ExhaleHeap@@1 T@U) (Mask@@4 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@6) (MapType0Type RefType)) (= (type ExhaleHeap@@1) (MapType0Type RefType))) (= (type Mask@@4) (MapType1Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@6 ExhaleHeap@@1 Mask@@4)) (U_2_bool (MapType0Select Heap@@6 o_1 $allocated))) (U_2_bool (MapType0Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.73:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@6 ExhaleHeap@@1 Mask@@4) (MapType0Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert (forall ((s@@4 T@U) (n@@3 Int) ) (! (let ((T@@8 (SeqTypeInv0 (type s@@4))))
 (=> (and (= (type s@@4) (SeqType T@@8)) (<= n@@3 0)) (= (|Seq#Drop| s@@4 n@@3) s@@4)))
 :qid |stdinbpl.407:18|
 :skolemid |45|
 :pattern ( (|Seq#Drop| s@@4 n@@3))
)))
(assert (forall ((i@@0 Int) (j@@1 Int) ) (! (= (|Seq#Sub| i@@0 j@@1) (- i@@0 j@@1))
 :qid |stdinbpl.261:15|
 :skolemid |30|
 :pattern ( (|Seq#Sub| i@@0 j@@1))
)))
(assert (forall ((i@@1 Int) (j@@2 Int) ) (! (= (|Seq#Add| i@@1 j@@2) (+ i@@1 j@@2))
 :qid |stdinbpl.259:15|
 :skolemid |29|
 :pattern ( (|Seq#Add| i@@1 j@@2))
)))
(assert (forall ((a_3@@0 T@U) ) (! (let ((CT@@1 (VCTArrayDomainTypeTypeInv0 (type a_3@@0))))
 (=> (= (type a_3@@0) (VCTArrayDomainTypeType CT@@1)) (>= (alen a_3@@0) 0)))
 :qid |stdinbpl.585:20|
 :skolemid |58|
 :pattern ( (alen a_3@@0))
)))
(assert (forall ((arg0@@35 T@U) ) (! (let ((T@@9 (type arg0@@35)))
(= (type (|Seq#Singleton| arg0@@35)) (SeqType T@@9)))
 :qid |funType:Seq#Singleton|
 :pattern ( (|Seq#Singleton| arg0@@35))
)))
(assert (forall ((x@@9 T@U) (y@@1 T@U) ) (! (let ((T@@10 (type x@@9)))
 (=> (= (type y@@1) T@@10) (= (|Seq#Contains| (|Seq#Singleton| x@@9) y@@1) (= x@@9 y@@1))))
 :qid |stdinbpl.548:18|
 :skolemid |54|
 :pattern ( (|Seq#Contains| (|Seq#Singleton| x@@9) y@@1))
)))
(assert (forall ((s@@5 T@U) (n@@4 Int) (j@@3 Int) ) (! (let ((T@@11 (SeqTypeInv0 (type s@@5))))
 (=> (= (type s@@5) (SeqType T@@11)) (=> (and (and (<= 0 j@@3) (< j@@3 n@@4)) (< j@@3 (|Seq#Length| s@@5))) (= (|Seq#Index| (|Seq#Take| s@@5 n@@4) j@@3) (|Seq#Index| s@@5 j@@3)))))
 :qid |stdinbpl.300:18|
 :skolemid |37|
 :pattern ( (|Seq#Index| (|Seq#Take| s@@5 n@@4) j@@3))
 :pattern ( (|Seq#Index| s@@5 j@@3) (|Seq#Take| s@@5 n@@4))
)))
(assert (forall ((Heap@@7 T@U) (ExhaleHeap@@2 T@U) (Mask@@5 T@U) (o_1@@0 T@U) (f_2 T@U) ) (! (let ((B@@1 (FieldTypeInv1 (type f_2))))
(let ((A@@1 (FieldTypeInv0 (type f_2))))
 (=> (and (and (and (and (and (and (= (type Heap@@7) (MapType0Type RefType)) (= (type ExhaleHeap@@2) (MapType0Type RefType))) (= (type Mask@@5) (MapType1Type RefType realType))) (= (type o_1@@0) RefType)) (= (type f_2) (FieldType A@@1 B@@1))) (IdenticalOnKnownLocations Heap@@7 ExhaleHeap@@2 Mask@@5)) (HasDirectPerm Mask@@5 o_1@@0 f_2)) (= (MapType0Select Heap@@7 o_1@@0 f_2) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2)))))
 :qid |stdinbpl.42:22|
 :skolemid |1|
 :pattern ( (IdenticalOnKnownLocations Heap@@7 ExhaleHeap@@2 Mask@@5) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2))
)))
(assert  (and (forall ((arg0@@36 T@U) (arg1@@15 T@U) ) (! (= (type (CombineFrames arg0@@36 arg1@@15)) FrameTypeType)
 :qid |funType:CombineFrames|
 :pattern ( (CombineFrames arg0@@36 arg1@@15))
)) (forall ((arg0@@37 T@U) ) (! (= (type (FrameFragment arg0@@37)) FrameTypeType)
 :qid |funType:FrameFragment|
 :pattern ( (FrameFragment arg0@@37))
))))
(assert (forall ((Heap@@8 T@U) (Mask@@6 T@U) (origL@@2 T@U) (newO@@2 T@U) (newL@@2 T@U) (maxLen@@5 Int) ) (!  (=> (and (and (and (and (and (= (type Heap@@8) (MapType0Type RefType)) (= (type Mask@@6) (MapType1Type RefType realType))) (= (type origL@@2) (VCTArrayDomainTypeType RefType))) (= (type newO@@2) (SeqType intType))) (= (type newL@@2) (VCTArrayDomainTypeType RefType))) (and (state Heap@@8 Mask@@6) (or (< AssumeFunctionsAbove 0) (|IsReordered#trigger| (CombineFrames (FrameFragment (int_2_U (|IsReordered#condqp1| Heap@@8 origL@@2 newO@@2 newL@@2 maxLen@@5))) (FrameFragment (ite (not (= origL@@2 newL@@2)) (FrameFragment (int_2_U (|IsReordered#condqp2| Heap@@8 origL@@2 newO@@2 newL@@2 maxLen@@5))) EmptyFrame))) origL@@2 newO@@2 newL@@2 maxLen@@5)))) (= (|IsReordered'| Heap@@8 origL@@2 newO@@2 newL@@2 maxLen@@5)  (and (<= maxLen@@5 (alen origL@@2)) (and (<= maxLen@@5 (alen newL@@2)) (and (CheckBounded Heap@@8 newO@@2 maxLen@@5) (forall ((i_7 Int) ) (!  (=> (and (<= 0 i_7) (< i_7 (|Seq#Length| newO@@2))) (= (U_2_int (MapType0Select Heap@@8 (loc newL@@2 i_7) Integer__item)) (U_2_int (MapType0Select Heap@@8 (loc origL@@2 (U_2_int (|Seq#Index| newO@@2 i_7))) Integer__item))))
 :qid |stdinbpl.734:472|
 :skolemid |73|
 :pattern ( (loc origL@@2 (U_2_int (|Seq#Index| newO@@2 i_7))))
)))))))
 :qid |stdinbpl.732:15|
 :skolemid |74|
 :pattern ( (state Heap@@8 Mask@@6) (|IsReordered'| Heap@@8 origL@@2 newO@@2 newL@@2 maxLen@@5))
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
 :qid |stdinbpl.204:19|
 :skolemid |21|
 :pattern ( (InsidePredicate p v_1 p w))
)))
(assert (forall ((arg0@@38 T@U) (arg1@@16 T@U) ) (! (let ((T@@14 (SeqTypeInv0 (type arg0@@38))))
(= (type (|Seq#Append| arg0@@38 arg1@@16)) (SeqType T@@14)))
 :qid |funType:Seq#Append|
 :pattern ( (|Seq#Append| arg0@@38 arg1@@16))
)))
(assert (forall ((s0 T@U) (s1 T@U) (n@@5 Int) ) (! (let ((T@@15 (SeqTypeInv0 (type s0))))
 (=> (and (= (type s0) (SeqType T@@15)) (= (type s1) (SeqType T@@15))) (=> (and (and (and (not (= s0 (|Seq#Empty| T@@15))) (not (= s1 (|Seq#Empty| T@@15)))) (<= (|Seq#Length| s0) n@@5)) (< n@@5 (|Seq#Length| (|Seq#Append| s0 s1)))) (and (= (|Seq#Add| (|Seq#Sub| n@@5 (|Seq#Length| s0)) (|Seq#Length| s0)) n@@5) (= (|Seq#Index| (|Seq#Append| s0 s1) n@@5) (|Seq#Index| s1 (|Seq#Sub| n@@5 (|Seq#Length| s0))))))))
 :qid |stdinbpl.272:18|
 :skolemid |32|
 :pattern ( (|Seq#Index| (|Seq#Append| s0 s1) n@@5))
)))
(assert  (not (IsPredicateField Integer__item)))
(assert  (not (IsWandField Integer__item)))
(assert (forall ((Heap@@9 T@U) (ExhaleHeap@@3 T@U) (Mask@@7 T@U) ) (!  (=> (and (and (and (= (type Heap@@9) (MapType0Type RefType)) (= (type ExhaleHeap@@3) (MapType0Type RefType))) (= (type Mask@@7) (MapType1Type RefType realType))) (IdenticalOnKnownLocations Heap@@9 ExhaleHeap@@3 Mask@@7)) (succHeap Heap@@9 ExhaleHeap@@3))
 :qid |stdinbpl.83:15|
 :skolemid |10|
 :pattern ( (IdenticalOnKnownLocations Heap@@9 ExhaleHeap@@3 Mask@@7))
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
(assert (forall ((Heap@@10 T@U) (origL@@3 T@U) (newO@@3 T@U) (newL@@3 T@U) (maxLen@@6 Int) ) (!  (=> (and (and (and (= (type Heap@@10) (MapType0Type RefType)) (= (type origL@@3) (VCTArrayDomainTypeType RefType))) (= (type newO@@3) (SeqType intType))) (= (type newL@@3) (VCTArrayDomainTypeType RefType))) (dummyFunction (bool_2_U (|IsReordered#triggerStateless| origL@@3 newO@@3 newL@@3 maxLen@@6))))
 :qid |stdinbpl.690:15|
 :skolemid |67|
 :pattern ( (|IsReordered'| Heap@@10 origL@@3 newO@@3 newL@@3 maxLen@@6))
)))
(assert (forall ((arg0@@39 Real) (arg1@@17 T@U) ) (! (= (type (ConditionalFrame arg0@@39 arg1@@17)) FrameTypeType)
 :qid |funType:ConditionalFrame|
 :pattern ( (ConditionalFrame arg0@@39 arg1@@17))
)))
(assert (forall ((p@@0 Real) (f_6 T@U) ) (!  (=> (= (type f_6) FrameTypeType) (= (ConditionalFrame p@@0 f_6) (ite (> p@@0 0.0) f_6 EmptyFrame)))
 :qid |stdinbpl.192:15|
 :skolemid |19|
 :pattern ( (ConditionalFrame p@@0 f_6))
)))
(assert (forall ((q@min@@0 Int) (q@max@@0 Int) (j@@4 Int) ) (!  (=> (and (<= 0 j@@4) (< j@@4 (- q@max@@0 q@min@@0))) (= (U_2_int (|Seq#Index| (|Seq#Range| q@min@@0 q@max@@0) j@@4)) (+ q@min@@0 j@@4)))
 :qid |stdinbpl.563:15|
 :skolemid |56|
 :pattern ( (|Seq#Index| (|Seq#Range| q@min@@0 q@max@@0) j@@4))
)))
(assert (forall ((Mask@@8 T@U) (o_2@@0 T@U) (f_4@@0 T@U) ) (! (let ((B@@3 (FieldTypeInv1 (type f_4@@0))))
(let ((A@@4 (FieldTypeInv0 (type f_4@@0))))
 (=> (and (and (= (type Mask@@8) (MapType1Type RefType realType)) (= (type o_2@@0) RefType)) (= (type f_4@@0) (FieldType A@@4 B@@3))) (= (HasDirectPerm Mask@@8 o_2@@0 f_4@@0) (> (U_2_real (MapType1Select Mask@@8 o_2@@0 f_4@@0)) NoPerm)))))
 :qid |stdinbpl.133:22|
 :skolemid |17|
 :pattern ( (HasDirectPerm Mask@@8 o_2@@0 f_4@@0))
)))
(assert (forall ((s0@@0 T@U) (s1@@0 T@U) ) (! (let ((T@@16 (SeqTypeInv0 (type s0@@0))))
 (=> (and (and (= (type s0@@0) (SeqType T@@16)) (= (type s1@@0) (SeqType T@@16))) (and (not (= s0@@0 (|Seq#Empty| T@@16))) (not (= s1@@0 (|Seq#Empty| T@@16))))) (= (|Seq#Length| (|Seq#Append| s0@@0 s1@@0)) (+ (|Seq#Length| s0@@0) (|Seq#Length| s1@@0)))))
 :qid |stdinbpl.241:18|
 :skolemid |26|
 :pattern ( (|Seq#Length| (|Seq#Append| s0@@0 s1@@0)))
)))
(assert (forall ((s@@6 T@U) (t T@U) (n@@6 Int) ) (! (let ((T@@17 (SeqTypeInv0 (type s@@6))))
 (=> (and (and (= (type s@@6) (SeqType T@@17)) (= (type t) (SeqType T@@17))) (and (> n@@6 0) (> n@@6 (|Seq#Length| s@@6)))) (and (= (|Seq#Add| (|Seq#Sub| n@@6 (|Seq#Length| s@@6)) (|Seq#Length| s@@6)) n@@6) (= (|Seq#Drop| (|Seq#Append| s@@6 t) n@@6) (|Seq#Drop| t (|Seq#Sub| n@@6 (|Seq#Length| s@@6)))))))
 :qid |stdinbpl.397:18|
 :skolemid |44|
 :pattern ( (|Seq#Drop| (|Seq#Append| s@@6 t) n@@6))
)))
(assert (forall ((Heap@@11 T@U) (Mask@@9 T@U) (origL@@4 T@U) (newO@@4 T@U) (newL@@4 T@U) (maxLen@@7 Int) ) (!  (=> (and (and (and (and (and (= (type Heap@@11) (MapType0Type RefType)) (= (type Mask@@9) (MapType1Type RefType realType))) (= (type origL@@4) (VCTArrayDomainTypeType RefType))) (= (type newO@@4) (SeqType intType))) (= (type newL@@4) (VCTArrayDomainTypeType RefType))) (state Heap@@11 Mask@@9)) (= (|IsReordered'| Heap@@11 origL@@4 newO@@4 newL@@4 maxLen@@7) (|IsReordered#frame| (CombineFrames (FrameFragment (int_2_U (|IsReordered#condqp1| Heap@@11 origL@@4 newO@@4 newL@@4 maxLen@@7))) (FrameFragment (ite (not (= origL@@4 newL@@4)) (FrameFragment (int_2_U (|IsReordered#condqp2| Heap@@11 origL@@4 newO@@4 newL@@4 maxLen@@7))) EmptyFrame))) origL@@4 newO@@4 newL@@4 maxLen@@7)))
 :qid |stdinbpl.706:15|
 :skolemid |70|
 :pattern ( (state Heap@@11 Mask@@9) (|IsReordered'| Heap@@11 origL@@4 newO@@4 newL@@4 maxLen@@7))
)))
(assert (forall ((o_2@@1 T@U) (f_4@@1 T@U) ) (! (let ((B@@4 (FieldTypeInv1 (type f_4@@1))))
(let ((A@@5 (FieldTypeInv0 (type f_4@@1))))
 (=> (and (= (type o_2@@1) RefType) (= (type f_4@@1) (FieldType A@@5 B@@4))) (= (U_2_real (MapType1Select ZeroMask o_2@@1 f_4@@1)) NoPerm))))
 :qid |stdinbpl.106:22|
 :skolemid |13|
 :pattern ( (MapType1Select ZeroMask o_2@@1 f_4@@1))
)))
(assert (forall ((Heap@@12 T@U) (Mask@@10 T@U) (origL@@5 T@U) (newO@@5 T@U) (newL@@5 T@U) (maxLen@@8 Int) ) (!  (=> (and (and (and (and (and (= (type Heap@@12) (MapType0Type RefType)) (= (type Mask@@10) (MapType1Type RefType realType))) (= (type origL@@5) (VCTArrayDomainTypeType RefType))) (= (type newO@@5) (SeqType intType))) (= (type newL@@5) (VCTArrayDomainTypeType RefType))) (and (state Heap@@12 Mask@@10) (< AssumeFunctionsAbove 0))) (= (IsReordered Heap@@12 origL@@5 newO@@5 newL@@5 maxLen@@8)  (and (<= maxLen@@8 (alen origL@@5)) (and (<= maxLen@@8 (alen newL@@5)) (and (CheckBounded Heap@@12 newO@@5 maxLen@@8) (forall ((i_2_1 Int) ) (!  (=> (and (<= 0 i_2_1) (< i_2_1 (|Seq#Length| newO@@5))) (= (U_2_int (MapType0Select Heap@@12 (loc newL@@5 i_2_1) Integer__item)) (U_2_int (MapType0Select Heap@@12 (loc origL@@5 (U_2_int (|Seq#Index| newO@@5 i_2_1))) Integer__item))))
 :qid |stdinbpl.698:211|
 :skolemid |68|
 :pattern ( (loc origL@@5 (U_2_int (|Seq#Index| newO@@5 i_2_1))))
)))))))
 :qid |stdinbpl.696:15|
 :skolemid |69|
 :pattern ( (state Heap@@12 Mask@@10) (IsReordered Heap@@12 origL@@5 newO@@5 newL@@5 maxLen@@8))
)))
(assert (forall ((s@@7 T@U) (t@@0 T@U) (n@@7 Int) ) (! (let ((T@@18 (SeqTypeInv0 (type s@@7))))
 (=> (and (and (= (type s@@7) (SeqType T@@18)) (= (type t@@0) (SeqType T@@18))) (and (> n@@7 0) (> n@@7 (|Seq#Length| s@@7)))) (and (= (|Seq#Add| (|Seq#Sub| n@@7 (|Seq#Length| s@@7)) (|Seq#Length| s@@7)) n@@7) (= (|Seq#Take| (|Seq#Append| s@@7 t@@0) n@@7) (|Seq#Append| s@@7 (|Seq#Take| t@@0 (|Seq#Sub| n@@7 (|Seq#Length| s@@7))))))))
 :qid |stdinbpl.384:18|
 :skolemid |42|
 :pattern ( (|Seq#Take| (|Seq#Append| s@@7 t@@0) n@@7))
)))
(assert (forall ((q@min@@1 Int) (q@max@@1 Int) ) (!  (and (=> (< q@min@@1 q@max@@1) (= (|Seq#Length| (|Seq#Range| q@min@@1 q@max@@1)) (- q@max@@1 q@min@@1))) (=> (<= q@max@@1 q@min@@1) (= (|Seq#Length| (|Seq#Range| q@min@@1 q@max@@1)) 0)))
 :qid |stdinbpl.562:15|
 :skolemid |55|
 :pattern ( (|Seq#Length| (|Seq#Range| q@min@@1 q@max@@1)))
)))
(assert (forall ((a T@U) (b T@U) ) (! (let ((T@@19 (SeqTypeInv0 (type a))))
 (=> (and (and (= (type a) (SeqType T@@19)) (= (type b) (SeqType T@@19))) (|Seq#Equal| a b)) (= a b)))
 :qid |stdinbpl.535:18|
 :skolemid |53|
 :pattern ( (|Seq#Equal| a b))
)))
(assert (forall ((s@@8 T@U) (i@@2 Int) ) (! (let ((T@@20 (SeqTypeInv0 (type s@@8))))
 (=> (= (type s@@8) (SeqType T@@20)) (=> (and (<= 0 i@@2) (< i@@2 (|Seq#Length| s@@8))) (|Seq#ContainsTrigger| s@@8 (|Seq#Index| s@@8 i@@2)))))
 :qid |stdinbpl.428:18|
 :skolemid |49|
 :pattern ( (|Seq#Index| s@@8 i@@2))
)))
(assert (forall ((s0@@1 T@U) (s1@@1 T@U) ) (! (let ((T@@21 (SeqTypeInv0 (type s0@@1))))
 (=> (and (= (type s0@@1) (SeqType T@@21)) (= (type s1@@1) (SeqType T@@21))) (and (=> (= s0@@1 (|Seq#Empty| T@@21)) (= (|Seq#Append| s0@@1 s1@@1) s1@@1)) (=> (= s1@@1 (|Seq#Empty| T@@21)) (= (|Seq#Append| s0@@1 s1@@1) s0@@1)))))
 :qid |stdinbpl.247:18|
 :skolemid |27|
 :pattern ( (|Seq#Append| s0@@1 s1@@1))
)))
(assert (forall ((t@@1 T@U) ) (! (= (|Seq#Index| (|Seq#Singleton| t@@1) 0) t@@1)
 :qid |stdinbpl.251:18|
 :skolemid |28|
 :pattern ( (|Seq#Singleton| t@@1))
)))
(assert (forall ((s@@9 T@U) ) (! (let ((T@@22 (SeqTypeInv0 (type s@@9))))
 (=> (= (type s@@9) (SeqType T@@22)) (<= 0 (|Seq#Length| s@@9))))
 :qid |stdinbpl.230:18|
 :skolemid |22|
 :pattern ( (|Seq#Length| s@@9))
)))
(assert (forall ((s0@@2 T@U) (s1@@2 T@U) ) (! (let ((T@@23 (SeqTypeInv0 (type s0@@2))))
 (=> (and (and (= (type s0@@2) (SeqType T@@23)) (= (type s1@@2) (SeqType T@@23))) (|Seq#Equal| s0@@2 s1@@2)) (and (= (|Seq#Length| s0@@2) (|Seq#Length| s1@@2)) (forall ((j@@5 Int) ) (!  (=> (and (<= 0 j@@5) (< j@@5 (|Seq#Length| s0@@2))) (= (|Seq#Index| s0@@2 j@@5) (|Seq#Index| s1@@2 j@@5)))
 :qid |stdinbpl.525:13|
 :skolemid |50|
 :pattern ( (|Seq#Index| s0@@2 j@@5))
 :pattern ( (|Seq#Index| s1@@2 j@@5))
)))))
 :qid |stdinbpl.522:18|
 :skolemid |51|
 :pattern ( (|Seq#Equal| s0@@2 s1@@2))
)))
(assert (forall ((Heap@@13 T@U) (ExhaleHeap@@4 T@U) (Mask@@11 T@U) (pm_f@@1 T@U) ) (! (let ((C@@1 (FieldTypeInv0 (type pm_f@@1))))
 (=> (and (and (and (and (and (= (type Heap@@13) (MapType0Type RefType)) (= (type ExhaleHeap@@4) (MapType0Type RefType))) (= (type Mask@@11) (MapType1Type RefType realType))) (= (type pm_f@@1) (FieldType C@@1 FrameTypeType))) (IdenticalOnKnownLocations Heap@@13 ExhaleHeap@@4 Mask@@11)) (and (HasDirectPerm Mask@@11 null pm_f@@1) (IsPredicateField pm_f@@1))) (forall ((o2 T@U) (f_2@@0 T@U) ) (! (let ((B@@5 (FieldTypeInv1 (type f_2@@0))))
(let ((A@@6 (FieldTypeInv0 (type f_2@@0))))
 (=> (and (and (= (type o2) RefType) (= (type f_2@@0) (FieldType A@@6 B@@5))) (U_2_bool (MapType1Select (MapType0Select Heap@@13 null (PredicateMaskField pm_f@@1)) o2 f_2@@0))) (= (MapType0Select Heap@@13 o2 f_2@@0) (MapType0Select ExhaleHeap@@4 o2 f_2@@0)))))
 :qid |stdinbpl.54:134|
 :skolemid |3|
 :pattern ( (MapType0Select ExhaleHeap@@4 o2 f_2@@0))
))))
 :qid |stdinbpl.52:19|
 :skolemid |4|
 :pattern ( (IdenticalOnKnownLocations Heap@@13 ExhaleHeap@@4 Mask@@11) (IsPredicateField pm_f@@1))
)))
(assert (forall ((Heap@@14 T@U) (ExhaleHeap@@5 T@U) (Mask@@12 T@U) (pm_f@@2 T@U) ) (! (let ((C@@2 (FieldTypeInv0 (type pm_f@@2))))
 (=> (and (and (and (and (and (= (type Heap@@14) (MapType0Type RefType)) (= (type ExhaleHeap@@5) (MapType0Type RefType))) (= (type Mask@@12) (MapType1Type RefType realType))) (= (type pm_f@@2) (FieldType C@@2 FrameTypeType))) (IdenticalOnKnownLocations Heap@@14 ExhaleHeap@@5 Mask@@12)) (and (HasDirectPerm Mask@@12 null pm_f@@2) (IsWandField pm_f@@2))) (forall ((o2@@0 T@U) (f_2@@1 T@U) ) (! (let ((B@@6 (FieldTypeInv1 (type f_2@@1))))
(let ((A@@7 (FieldTypeInv0 (type f_2@@1))))
 (=> (and (and (= (type o2@@0) RefType) (= (type f_2@@1) (FieldType A@@7 B@@6))) (U_2_bool (MapType1Select (MapType0Select Heap@@14 null (WandMaskField pm_f@@2)) o2@@0 f_2@@1))) (= (MapType0Select Heap@@14 o2@@0 f_2@@1) (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1)))))
 :qid |stdinbpl.67:129|
 :skolemid |6|
 :pattern ( (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1))
))))
 :qid |stdinbpl.65:19|
 :skolemid |7|
 :pattern ( (IdenticalOnKnownLocations Heap@@14 ExhaleHeap@@5 Mask@@12) (IsWandField pm_f@@2))
)))
(assert (forall ((t@@2 T@U) ) (! (= (|Seq#Length| (|Seq#Singleton| t@@2)) 1)
 :qid |stdinbpl.238:18|
 :skolemid |25|
 :pattern ( (|Seq#Singleton| t@@2))
)))
(assert (forall ((Mask@@13 T@U) (o_2@@2 T@U) (f_4@@2 T@U) ) (! (let ((B@@7 (FieldTypeInv1 (type f_4@@2))))
(let ((A@@8 (FieldTypeInv0 (type f_4@@2))))
 (=> (and (and (and (= (type Mask@@13) (MapType1Type RefType realType)) (= (type o_2@@2) RefType)) (= (type f_4@@2) (FieldType A@@8 B@@7))) (GoodMask Mask@@13)) (and (>= (U_2_real (MapType1Select Mask@@13 o_2@@2 f_4@@2)) NoPerm) (=> (and (and (GoodMask Mask@@13) (not (IsPredicateField f_4@@2))) (not (IsWandField f_4@@2))) (<= (U_2_real (MapType1Select Mask@@13 o_2@@2 f_4@@2)) FullPerm))))))
 :qid |stdinbpl.128:22|
 :skolemid |16|
 :pattern ( (GoodMask Mask@@13) (MapType1Select Mask@@13 o_2@@2 f_4@@2))
)))
(assert (forall ((o T@U) (f T@U) (Heap@@15 T@U) ) (!  (=> (and (and (and (= (type o) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap@@15) (MapType0Type RefType))) (U_2_bool (MapType0Select Heap@@15 o $allocated))) (U_2_bool (MapType0Select Heap@@15 (MapType0Select Heap@@15 o f) $allocated)))
 :qid |stdinbpl.31:15|
 :skolemid |0|
 :pattern ( (MapType0Select Heap@@15 o f))
)))
(assert (forall ((s@@10 T@U) (t@@3 T@U) (n@@8 Int) ) (! (let ((T@@24 (SeqTypeInv0 (type s@@10))))
 (=> (and (and (= (type s@@10) (SeqType T@@24)) (= (type t@@3) (SeqType T@@24))) (and (< 0 n@@8) (<= n@@8 (|Seq#Length| s@@10)))) (= (|Seq#Take| (|Seq#Append| s@@10 t@@3) n@@8) (|Seq#Take| s@@10 n@@8))))
 :qid |stdinbpl.380:18|
 :skolemid |41|
 :pattern ( (|Seq#Take| (|Seq#Append| s@@10 t@@3) n@@8))
)))
(assert (forall ((s@@11 T@U) (i@@3 Int) (v@@1 T@U) ) (! (let ((T@@25 (type v@@1)))
 (=> (= (type s@@11) (SeqType T@@25)) (=> (and (<= 0 i@@3) (< i@@3 (|Seq#Length| s@@11))) (= (|Seq#Length| (|Seq#Update| s@@11 i@@3 v@@1)) (|Seq#Length| s@@11)))))
 :qid |stdinbpl.279:18|
 :skolemid |34|
 :pattern ( (|Seq#Length| (|Seq#Update| s@@11 i@@3 v@@1)))
 :pattern ( (|Seq#Length| s@@11) (|Seq#Update| s@@11 i@@3 v@@1))
)))
(assert (forall ((s@@12 T@U) (t@@4 T@U) (n@@9 Int) ) (! (let ((T@@26 (SeqTypeInv0 (type s@@12))))
 (=> (and (and (= (type s@@12) (SeqType T@@26)) (= (type t@@4) (SeqType T@@26))) (and (< 0 n@@9) (<= n@@9 (|Seq#Length| s@@12)))) (= (|Seq#Drop| (|Seq#Append| s@@12 t@@4) n@@9) (|Seq#Append| (|Seq#Drop| s@@12 n@@9) t@@4))))
 :qid |stdinbpl.393:18|
 :skolemid |43|
 :pattern ( (|Seq#Drop| (|Seq#Append| s@@12 t@@4) n@@9))
)))
(assert (forall ((s@@13 T@U) (n@@10 Int) (i@@4 Int) ) (! (let ((T@@27 (SeqTypeInv0 (type s@@13))))
 (=> (= (type s@@13) (SeqType T@@27)) (=> (and (and (< 0 n@@10) (<= n@@10 i@@4)) (< i@@4 (|Seq#Length| s@@13))) (and (= (|Seq#Add| (|Seq#Sub| i@@4 n@@10) n@@10) i@@4) (= (|Seq#Index| (|Seq#Drop| s@@13 n@@10) (|Seq#Sub| i@@4 n@@10)) (|Seq#Index| s@@13 i@@4))))))
 :qid |stdinbpl.330:18|
 :skolemid |40|
 :pattern ( (|Seq#Drop| s@@13 n@@10) (|Seq#Index| s@@13 i@@4))
)))
(assert (forall ((s0@@3 T@U) (s1@@3 T@U) (n@@11 Int) ) (! (let ((T@@28 (SeqTypeInv0 (type s0@@3))))
 (=> (and (= (type s0@@3) (SeqType T@@28)) (= (type s1@@3) (SeqType T@@28))) (=> (and (and (and (not (= s0@@3 (|Seq#Empty| T@@28))) (not (= s1@@3 (|Seq#Empty| T@@28)))) (<= 0 n@@11)) (< n@@11 (|Seq#Length| s0@@3))) (= (|Seq#Index| (|Seq#Append| s0@@3 s1@@3) n@@11) (|Seq#Index| s0@@3 n@@11)))))
 :qid |stdinbpl.270:18|
 :skolemid |31|
 :pattern ( (|Seq#Index| (|Seq#Append| s0@@3 s1@@3) n@@11))
 :pattern ( (|Seq#Index| s0@@3 n@@11) (|Seq#Append| s0@@3 s1@@3))
)))
(assert (forall ((Heap@@16 T@U) (o@@0 T@U) (f_3 T@U) (v@@2 T@U) ) (! (let ((B@@8 (type v@@2)))
(let ((A@@9 (FieldTypeInv0 (type f_3))))
 (=> (and (and (= (type Heap@@16) (MapType0Type RefType)) (= (type o@@0) RefType)) (= (type f_3) (FieldType A@@9 B@@8))) (succHeap Heap@@16 (MapType0Store Heap@@16 o@@0 f_3 v@@2)))))
 :qid |stdinbpl.78:22|
 :skolemid |9|
 :pattern ( (MapType0Store Heap@@16 o@@0 f_3 v@@2))
)))
(assert (forall ((s0@@4 T@U) (s1@@4 T@U) (m@@7 Int) ) (! (let ((T@@29 (SeqTypeInv0 (type s0@@4))))
 (=> (and (= (type s0@@4) (SeqType T@@29)) (= (type s1@@4) (SeqType T@@29))) (=> (and (and (and (not (= s0@@4 (|Seq#Empty| T@@29))) (not (= s1@@4 (|Seq#Empty| T@@29)))) (<= 0 m@@7)) (< m@@7 (|Seq#Length| s1@@4))) (and (= (|Seq#Sub| (|Seq#Add| m@@7 (|Seq#Length| s0@@4)) (|Seq#Length| s0@@4)) m@@7) (= (|Seq#Index| (|Seq#Append| s0@@4 s1@@4) (|Seq#Add| m@@7 (|Seq#Length| s0@@4))) (|Seq#Index| s1@@4 m@@7))))))
 :qid |stdinbpl.275:18|
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
 :qid |stdinbpl.426:18|
 :skolemid |48|
 :pattern ( (|Seq#Contains| s@@14 x@@10) (|Seq#Index| s@@14 i@@5))
)))
(assert (forall ((s0@@5 T@U) (s1@@5 T@U) ) (! (let ((T@@31 (SeqTypeInv0 (type s0@@5))))
 (=> (and (= (type s0@@5) (SeqType T@@31)) (= (type s1@@5) (SeqType T@@31))) (or (or (and (= s0@@5 s1@@5) (|Seq#Equal| s0@@5 s1@@5)) (and (and (not (= s0@@5 s1@@5)) (not (|Seq#Equal| s0@@5 s1@@5))) (not (= (|Seq#Length| s0@@5) (|Seq#Length| s1@@5))))) (and (and (and (and (and (and (not (= s0@@5 s1@@5)) (not (|Seq#Equal| s0@@5 s1@@5))) (= (|Seq#Length| s0@@5) (|Seq#Length| s1@@5))) (= (|Seq#SkolemDiff| s0@@5 s1@@5) (|Seq#SkolemDiff| s1@@5 s0@@5))) (<= 0 (|Seq#SkolemDiff| s0@@5 s1@@5))) (< (|Seq#SkolemDiff| s0@@5 s1@@5) (|Seq#Length| s0@@5))) (not (= (|Seq#Index| s0@@5 (|Seq#SkolemDiff| s0@@5 s1@@5)) (|Seq#Index| s1@@5 (|Seq#SkolemDiff| s0@@5 s1@@5))))))))
 :qid |stdinbpl.530:18|
 :skolemid |52|
 :pattern ( (|Seq#Equal| s0@@5 s1@@5))
)))
(assert (forall ((p@@1 T@U) (v_1@@0 T@U) (q T@U) (w@@0 T@U) (r T@U) (u T@U) ) (! (let ((C@@3 (FieldTypeInv0 (type r))))
(let ((B@@10 (FieldTypeInv0 (type q))))
(let ((A@@11 (FieldTypeInv0 (type p@@1))))
 (=> (and (and (and (and (and (and (= (type p@@1) (FieldType A@@11 FrameTypeType)) (= (type v_1@@0) FrameTypeType)) (= (type q) (FieldType B@@10 FrameTypeType))) (= (type w@@0) FrameTypeType)) (= (type r) (FieldType C@@3 FrameTypeType))) (= (type u) FrameTypeType)) (and (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))) (InsidePredicate p@@1 v_1@@0 r u)))))
 :qid |stdinbpl.199:25|
 :skolemid |20|
 :pattern ( (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))
)))
(assert (forall ((s@@15 T@U) ) (! (let ((T@@32 (SeqTypeInv0 (type s@@15))))
 (=> (and (= (type s@@15) (SeqType T@@32)) (= (|Seq#Length| s@@15) 0)) (= s@@15 (|Seq#Empty| T@@32))))
 :qid |stdinbpl.234:18|
 :skolemid |24|
 :pattern ( (|Seq#Length| s@@15))
)))
(assert (forall ((s@@16 T@U) (n@@12 Int) ) (! (let ((T@@33 (SeqTypeInv0 (type s@@16))))
 (=> (and (= (type s@@16) (SeqType T@@33)) (<= n@@12 0)) (= (|Seq#Take| s@@16 n@@12) (|Seq#Empty| T@@33))))
 :qid |stdinbpl.409:18|
 :skolemid |46|
 :pattern ( (|Seq#Take| s@@16 n@@12))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
(assert (forall ((Heap@@17 T@U) (order@@2 T@U) (maxLen@@9 Int) ) (!  (=> (and (= (type Heap@@17) (MapType0Type RefType)) (= (type order@@2) (SeqType intType))) (and (= (CheckBounded Heap@@17 order@@2 maxLen@@9) (|CheckBounded'| Heap@@17 order@@2 maxLen@@9)) (dummyFunction (bool_2_U (|CheckBounded#triggerStateless| order@@2 maxLen@@9)))))
 :qid |stdinbpl.611:15|
 :skolemid |60|
 :pattern ( (CheckBounded Heap@@17 order@@2 maxLen@@9))
)))
(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun i_8 () Int)
(declare-fun newO@@6 () T@U)
(declare-fun Mask@0 () T@U)
(declare-fun newL@@6 () T@U)
(declare-fun origL@@6 () T@U)
(declare-fun i_10 () Int)
(declare-fun Result@0 () Bool)
(declare-fun maxLen@@10 () Int)
(declare-fun Heap@@18 () T@U)
(declare-fun qpRange2 (T@U) Bool)
(declare-fun invRecv2 (T@U) Int)
(declare-fun QPMask@1 () T@U)
(declare-fun QPMask@0 () T@U)
(declare-fun qpRange1 (T@U) Bool)
(declare-fun invRecv1 (T@U) Int)
(assert  (and (and (and (and (and (and (= (type origL@@6) (VCTArrayDomainTypeType RefType)) (= (type newL@@6) (VCTArrayDomainTypeType RefType))) (= (type Heap@@18) (MapType0Type RefType))) (= (type newO@@6) (SeqType intType))) (= (type Mask@0) (MapType1Type RefType realType))) (= (type QPMask@0) (MapType1Type RefType realType))) (= (type QPMask@1) (MapType1Type RefType realType))))
(set-info :boogie-vc-id |IsReordered#definedness|)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 44) (let ((anon27_Then_correct true))
(let ((anon14_correct true))
(let ((anon33_Else_correct  (=> (and (not (and (<= 0 i_8) (< i_8 (|Seq#Length| newO@@6)))) (= (ControlFlow 0 29) 23)) anon14_correct)))
(let ((anon33_Then_correct  (=> (and (<= 0 i_8) (< i_8 (|Seq#Length| newO@@6))) (and (=> (= (ControlFlow 0 24) (- 0 28)) (HasDirectPerm Mask@0 (loc newL@@6 i_8) Integer__item)) (=> (HasDirectPerm Mask@0 (loc newL@@6 i_8) Integer__item) (and (=> (= (ControlFlow 0 24) (- 0 27)) (>= i_8 0)) (=> (>= i_8 0) (and (=> (= (ControlFlow 0 24) (- 0 26)) (< i_8 (|Seq#Length| newO@@6))) (=> (< i_8 (|Seq#Length| newO@@6)) (and (=> (= (ControlFlow 0 24) (- 0 25)) (HasDirectPerm Mask@0 (loc origL@@6 (U_2_int (|Seq#Index| newO@@6 i_8))) Integer__item)) (=> (HasDirectPerm Mask@0 (loc origL@@6 (U_2_int (|Seq#Index| newO@@6 i_8))) Integer__item) (=> (= (ControlFlow 0 24) 23) anon14_correct))))))))))))
(let ((anon30_Then_correct true))
(let ((anon23_correct true))
(let ((anon39_Else_correct  (=> (and (not (and (<= 0 i_10) (< i_10 (|Seq#Length| newO@@6)))) (= (ControlFlow 0 14) 8)) anon23_correct)))
(let ((anon39_Then_correct  (=> (and (<= 0 i_10) (< i_10 (|Seq#Length| newO@@6))) (and (=> (= (ControlFlow 0 9) (- 0 13)) (HasDirectPerm Mask@0 (loc newL@@6 i_10) Integer__item)) (=> (HasDirectPerm Mask@0 (loc newL@@6 i_10) Integer__item) (and (=> (= (ControlFlow 0 9) (- 0 12)) (>= i_10 0)) (=> (>= i_10 0) (and (=> (= (ControlFlow 0 9) (- 0 11)) (< i_10 (|Seq#Length| newO@@6))) (=> (< i_10 (|Seq#Length| newO@@6)) (and (=> (= (ControlFlow 0 9) (- 0 10)) (HasDirectPerm Mask@0 (loc origL@@6 (U_2_int (|Seq#Index| newO@@6 i_10))) Integer__item)) (=> (HasDirectPerm Mask@0 (loc origL@@6 (U_2_int (|Seq#Index| newO@@6 i_10))) Integer__item) (=> (= (ControlFlow 0 9) 8) anon23_correct))))))))))))
(let ((anon36_Then_correct true))
(let ((anon24_correct  (=> (= (ControlFlow 0 3) (- 0 2)) (= Result@0  (and (<= maxLen@@10 (alen origL@@6)) (and (<= maxLen@@10 (alen newL@@6)) (and (CheckBounded Heap@@18 newO@@6 maxLen@@10) (forall ((i_15 Int) ) (!  (=> (and (<= 0 i_15) (< i_15 (|Seq#Length| newO@@6))) (= (U_2_int (MapType0Select Heap@@18 (loc newL@@6 i_15) Integer__item)) (U_2_int (MapType0Select Heap@@18 (loc origL@@6 (U_2_int (|Seq#Index| newO@@6 i_15))) Integer__item))))
 :qid |stdinbpl.919:127|
 :skolemid |90|
 :pattern ( (loc origL@@6 (U_2_int (|Seq#Index| newO@@6 i_15))))
)))))))))
(let ((anon37_Then_correct  (=> (CheckBounded Heap@@18 newO@@6 maxLen@@10) (and (and (=> (= (ControlFlow 0 15) 3) anon24_correct) (=> (= (ControlFlow 0 15) 9) anon39_Then_correct)) (=> (= (ControlFlow 0 15) 14) anon39_Else_correct)))))
(let ((anon37_Else_correct  (=> (and (not (CheckBounded Heap@@18 newO@@6 maxLen@@10)) (= (ControlFlow 0 7) 3)) anon24_correct)))
(let ((anon35_Then_correct  (=> (<= maxLen@@10 (alen newL@@6)) (and (and (=> (= (ControlFlow 0 16) 6) anon36_Then_correct) (=> (= (ControlFlow 0 16) 15) anon37_Then_correct)) (=> (= (ControlFlow 0 16) 7) anon37_Else_correct)))))
(let ((anon35_Else_correct  (=> (and (< (alen newL@@6) maxLen@@10) (= (ControlFlow 0 5) 3)) anon24_correct)))
(let ((anon34_Then_correct  (=> (<= maxLen@@10 (alen origL@@6)) (and (=> (= (ControlFlow 0 17) 16) anon35_Then_correct) (=> (= (ControlFlow 0 17) 5) anon35_Else_correct)))))
(let ((anon34_Else_correct  (=> (and (< (alen origL@@6) maxLen@@10) (= (ControlFlow 0 4) 3)) anon24_correct)))
(let ((anon15_correct  (=> (= Result@0  (and (<= maxLen@@10 (alen origL@@6)) (and (<= maxLen@@10 (alen newL@@6)) (and (CheckBounded Heap@@18 newO@@6 maxLen@@10) (forall ((i_13 Int) ) (!  (=> (and (<= 0 i_13) (< i_13 (|Seq#Length| newO@@6))) (= (U_2_int (MapType0Select Heap@@18 (loc newL@@6 i_13) Integer__item)) (U_2_int (MapType0Select Heap@@18 (loc origL@@6 (U_2_int (|Seq#Index| newO@@6 i_13))) Integer__item))))
 :qid |stdinbpl.885:124|
 :skolemid |89|
 :pattern ( (loc origL@@6 (U_2_int (|Seq#Index| newO@@6 i_13))))
)))))) (and (=> (= (ControlFlow 0 18) 17) anon34_Then_correct) (=> (= (ControlFlow 0 18) 4) anon34_Else_correct)))))
(let ((anon31_Then_correct  (=> (CheckBounded Heap@@18 newO@@6 maxLen@@10) (and (and (=> (= (ControlFlow 0 30) 18) anon15_correct) (=> (= (ControlFlow 0 30) 24) anon33_Then_correct)) (=> (= (ControlFlow 0 30) 29) anon33_Else_correct)))))
(let ((anon31_Else_correct  (=> (and (not (CheckBounded Heap@@18 newO@@6 maxLen@@10)) (= (ControlFlow 0 22) 18)) anon15_correct)))
(let ((anon29_Then_correct  (=> (<= maxLen@@10 (alen newL@@6)) (and (and (=> (= (ControlFlow 0 31) 21) anon30_Then_correct) (=> (= (ControlFlow 0 31) 30) anon31_Then_correct)) (=> (= (ControlFlow 0 31) 22) anon31_Else_correct)))))
(let ((anon29_Else_correct  (=> (and (< (alen newL@@6) maxLen@@10) (= (ControlFlow 0 20) 18)) anon15_correct)))
(let ((anon28_Then_correct  (=> (<= maxLen@@10 (alen origL@@6)) (and (=> (= (ControlFlow 0 32) 31) anon29_Then_correct) (=> (= (ControlFlow 0 32) 20) anon29_Else_correct)))))
(let ((anon28_Else_correct  (=> (and (< (alen origL@@6) maxLen@@10) (= (ControlFlow 0 19) 18)) anon15_correct)))
(let ((anon6_correct  (=> (state Heap@@18 Mask@0) (and (=> (= (ControlFlow 0 33) 32) anon28_Then_correct) (=> (= (ControlFlow 0 33) 19) anon28_Else_correct)))))
(let ((anon27_Else_correct  (and (=> (= (ControlFlow 0 36) (- 0 38)) (forall ((i_11 Int) (i_11_1 Int) ) (!  (=> (and (and (and (and (not (= i_11 i_11_1)) (and (<= 0 i_11) (< i_11 (alen newL@@6)))) (and (<= 0 i_11_1) (< i_11_1 (alen newL@@6)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= (loc newL@@6 i_11) (loc newL@@6 i_11_1))))
 :qid |stdinbpl.816:17|
 :skolemid |82|
))) (=> (forall ((i_11@@0 Int) (i_11_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_11@@0 i_11_1@@0)) (and (<= 0 i_11@@0) (< i_11@@0 (alen newL@@6)))) (and (<= 0 i_11_1@@0) (< i_11_1@@0 (alen newL@@6)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= (loc newL@@6 i_11@@0) (loc newL@@6 i_11_1@@0))))
 :qid |stdinbpl.816:17|
 :skolemid |82|
)) (=> (and (forall ((i_11@@1 Int) ) (!  (=> (and (and (<= 0 i_11@@1) (< i_11@@1 (alen newL@@6))) (< NoPerm (/ (to_real 1) (to_real 2)))) (and (qpRange2 (loc newL@@6 i_11@@1)) (= (invRecv2 (loc newL@@6 i_11@@1)) i_11@@1)))
 :qid |stdinbpl.822:24|
 :skolemid |83|
 :pattern ( (loc newL@@6 i_11@@1))
 :pattern ( (loc newL@@6 i_11@@1))
)) (forall ((o_3 T@U) ) (!  (=> (= (type o_3) RefType) (=> (and (and (and (<= 0 (invRecv2 o_3)) (< (invRecv2 o_3) (alen newL@@6))) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange2 o_3)) (= (loc newL@@6 (invRecv2 o_3)) o_3)))
 :qid |stdinbpl.826:24|
 :skolemid |84|
 :pattern ( (invRecv2 o_3))
))) (and (=> (= (ControlFlow 0 36) (- 0 37)) (forall ((i_11@@2 Int) ) (!  (=> (and (<= 0 i_11@@2) (< i_11@@2 (alen newL@@6))) (>= (/ (to_real 1) (to_real 2)) NoPerm))
 :qid |stdinbpl.832:17|
 :skolemid |85|
 :pattern ( (loc newL@@6 i_11@@2))
 :pattern ( (loc newL@@6 i_11@@2))
))) (=> (forall ((i_11@@3 Int) ) (!  (=> (and (<= 0 i_11@@3) (< i_11@@3 (alen newL@@6))) (>= (/ (to_real 1) (to_real 2)) NoPerm))
 :qid |stdinbpl.832:17|
 :skolemid |85|
 :pattern ( (loc newL@@6 i_11@@3))
 :pattern ( (loc newL@@6 i_11@@3))
)) (=> (and (forall ((i_11@@4 Int) ) (!  (=> (and (and (<= 0 i_11@@4) (< i_11@@4 (alen newL@@6))) (> (/ (to_real 1) (to_real 2)) NoPerm)) (not (= (loc newL@@6 i_11@@4) null)))
 :qid |stdinbpl.838:24|
 :skolemid |86|
 :pattern ( (loc newL@@6 i_11@@4))
 :pattern ( (loc newL@@6 i_11@@4))
)) (forall ((o_3@@0 T@U) ) (!  (=> (= (type o_3@@0) RefType) (and (=> (and (and (and (<= 0 (invRecv2 o_3@@0)) (< (invRecv2 o_3@@0) (alen newL@@6))) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange2 o_3@@0)) (and (=> (< NoPerm (/ (to_real 1) (to_real 2))) (= (loc newL@@6 (invRecv2 o_3@@0)) o_3@@0)) (= (U_2_real (MapType1Select QPMask@1 o_3@@0 Integer__item)) (+ (U_2_real (MapType1Select QPMask@0 o_3@@0 Integer__item)) (/ (to_real 1) (to_real 2)))))) (=> (not (and (and (and (<= 0 (invRecv2 o_3@@0)) (< (invRecv2 o_3@@0) (alen newL@@6))) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange2 o_3@@0))) (= (U_2_real (MapType1Select QPMask@1 o_3@@0 Integer__item)) (U_2_real (MapType1Select QPMask@0 o_3@@0 Integer__item))))))
 :qid |stdinbpl.844:24|
 :skolemid |87|
 :pattern ( (MapType1Select QPMask@1 o_3@@0 Integer__item))
))) (=> (and (and (forall ((o_3@@1 T@U) (f_5 T@U) ) (! (let ((B@@11 (FieldTypeInv1 (type f_5))))
(let ((A@@12 (FieldTypeInv0 (type f_5))))
 (=> (and (and (= (type o_3@@1) RefType) (= (type f_5) (FieldType A@@12 B@@11))) (not (= f_5 Integer__item))) (= (U_2_real (MapType1Select QPMask@0 o_3@@1 f_5)) (U_2_real (MapType1Select QPMask@1 o_3@@1 f_5))))))
 :qid |stdinbpl.848:31|
 :skolemid |88|
 :pattern ( (MapType1Select QPMask@0 o_3@@1 f_5))
 :pattern ( (MapType1Select QPMask@1 o_3@@1 f_5))
)) (state Heap@@18 QPMask@1)) (and (= Mask@0 QPMask@1) (= (ControlFlow 0 36) 33))) anon6_correct)))))))))
(let ((anon26_Then_correct  (=> (not (= origL@@6 newL@@6)) (and (=> (= (ControlFlow 0 39) 35) anon27_Then_correct) (=> (= (ControlFlow 0 39) 36) anon27_Else_correct)))))
(let ((anon26_Else_correct  (=> (= origL@@6 newL@@6) (=> (and (= Mask@0 QPMask@0) (= (ControlFlow 0 34) 33)) anon6_correct))))
(let ((anon25_Else_correct  (and (=> (= (ControlFlow 0 40) (- 0 42)) (forall ((i_9 Int) (i_9_1 Int) ) (!  (=> (and (and (and (and (not (= i_9 i_9_1)) (and (<= 0 i_9) (< i_9 (alen origL@@6)))) (and (<= 0 i_9_1) (< i_9_1 (alen origL@@6)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= (loc origL@@6 i_9) (loc origL@@6 i_9_1))))
 :qid |stdinbpl.769:15|
 :skolemid |75|
))) (=> (forall ((i_9@@0 Int) (i_9_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_9@@0 i_9_1@@0)) (and (<= 0 i_9@@0) (< i_9@@0 (alen origL@@6)))) (and (<= 0 i_9_1@@0) (< i_9_1@@0 (alen origL@@6)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= (loc origL@@6 i_9@@0) (loc origL@@6 i_9_1@@0))))
 :qid |stdinbpl.769:15|
 :skolemid |75|
)) (=> (and (forall ((i_9@@1 Int) ) (!  (=> (and (and (<= 0 i_9@@1) (< i_9@@1 (alen origL@@6))) (< NoPerm (/ (to_real 1) (to_real 2)))) (and (qpRange1 (loc origL@@6 i_9@@1)) (= (invRecv1 (loc origL@@6 i_9@@1)) i_9@@1)))
 :qid |stdinbpl.775:22|
 :skolemid |76|
 :pattern ( (loc origL@@6 i_9@@1))
 :pattern ( (loc origL@@6 i_9@@1))
)) (forall ((o_3@@2 T@U) ) (!  (=> (= (type o_3@@2) RefType) (=> (and (and (and (<= 0 (invRecv1 o_3@@2)) (< (invRecv1 o_3@@2) (alen origL@@6))) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange1 o_3@@2)) (= (loc origL@@6 (invRecv1 o_3@@2)) o_3@@2)))
 :qid |stdinbpl.779:22|
 :skolemid |77|
 :pattern ( (invRecv1 o_3@@2))
))) (and (=> (= (ControlFlow 0 40) (- 0 41)) (forall ((i_9@@2 Int) ) (!  (=> (and (<= 0 i_9@@2) (< i_9@@2 (alen origL@@6))) (>= (/ (to_real 1) (to_real 2)) NoPerm))
 :qid |stdinbpl.785:15|
 :skolemid |78|
 :pattern ( (loc origL@@6 i_9@@2))
 :pattern ( (loc origL@@6 i_9@@2))
))) (=> (forall ((i_9@@3 Int) ) (!  (=> (and (<= 0 i_9@@3) (< i_9@@3 (alen origL@@6))) (>= (/ (to_real 1) (to_real 2)) NoPerm))
 :qid |stdinbpl.785:15|
 :skolemid |78|
 :pattern ( (loc origL@@6 i_9@@3))
 :pattern ( (loc origL@@6 i_9@@3))
)) (=> (forall ((i_9@@4 Int) ) (!  (=> (and (and (<= 0 i_9@@4) (< i_9@@4 (alen origL@@6))) (> (/ (to_real 1) (to_real 2)) NoPerm)) (not (= (loc origL@@6 i_9@@4) null)))
 :qid |stdinbpl.791:22|
 :skolemid |79|
 :pattern ( (loc origL@@6 i_9@@4))
 :pattern ( (loc origL@@6 i_9@@4))
)) (=> (and (and (forall ((o_3@@3 T@U) ) (!  (=> (= (type o_3@@3) RefType) (and (=> (and (and (and (<= 0 (invRecv1 o_3@@3)) (< (invRecv1 o_3@@3) (alen origL@@6))) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange1 o_3@@3)) (and (=> (< NoPerm (/ (to_real 1) (to_real 2))) (= (loc origL@@6 (invRecv1 o_3@@3)) o_3@@3)) (= (U_2_real (MapType1Select QPMask@0 o_3@@3 Integer__item)) (+ (U_2_real (MapType1Select ZeroMask o_3@@3 Integer__item)) (/ (to_real 1) (to_real 2)))))) (=> (not (and (and (and (<= 0 (invRecv1 o_3@@3)) (< (invRecv1 o_3@@3) (alen origL@@6))) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange1 o_3@@3))) (= (U_2_real (MapType1Select QPMask@0 o_3@@3 Integer__item)) (U_2_real (MapType1Select ZeroMask o_3@@3 Integer__item))))))
 :qid |stdinbpl.797:22|
 :skolemid |80|
 :pattern ( (MapType1Select QPMask@0 o_3@@3 Integer__item))
)) (forall ((o_3@@4 T@U) (f_5@@0 T@U) ) (! (let ((B@@12 (FieldTypeInv1 (type f_5@@0))))
(let ((A@@13 (FieldTypeInv0 (type f_5@@0))))
 (=> (and (and (= (type o_3@@4) RefType) (= (type f_5@@0) (FieldType A@@13 B@@12))) (not (= f_5@@0 Integer__item))) (= (U_2_real (MapType1Select ZeroMask o_3@@4 f_5@@0)) (U_2_real (MapType1Select QPMask@0 o_3@@4 f_5@@0))))))
 :qid |stdinbpl.801:29|
 :skolemid |81|
 :pattern ( (MapType1Select ZeroMask o_3@@4 f_5@@0))
 :pattern ( (MapType1Select QPMask@0 o_3@@4 f_5@@0))
))) (and (state Heap@@18 QPMask@0) (state Heap@@18 QPMask@0))) (and (=> (= (ControlFlow 0 40) 39) anon26_Then_correct) (=> (= (ControlFlow 0 40) 34) anon26_Else_correct)))))))))))
(let ((anon25_Then_correct true))
(let ((anon0_correct  (=> (and (state Heap@@18 ZeroMask) (= AssumeFunctionsAbove 0)) (and (=> (= (ControlFlow 0 43) 1) anon25_Then_correct) (=> (= (ControlFlow 0 43) 40) anon25_Else_correct)))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 44) 43) anon0_correct)))
PreconditionGeneratedEntry_correct))))))))))))))))))))))))))))))))
))
(check-sat)
(pop 1)
; Valid
(get-info :rlimit)
