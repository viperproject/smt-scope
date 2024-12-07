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
(declare-fun lseg (T@U T@U) T@U)
(declare-fun IsPredicateField (T@U) Bool)
(declare-fun PredicateType_lsegType () T@T)
(declare-fun FrameTypeType () T@T)
(declare-fun |lsegelems'| (T@U T@U T@U) T@U)
(declare-fun dummyFunction (T@U) Bool)
(declare-fun |lsegelems#triggerStateless| (T@U T@U) T@U)
(declare-fun |lseg#trigger| (T@U T@U) Bool)
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
(declare-fun list (T@U) T@U)
(declare-fun PredicateType_listType () T@T)
(declare-fun |elems'| (T@U T@U) T@U)
(declare-fun |elems#triggerStateless| (T@U) T@U)
(declare-fun |list#trigger| (T@U T@U) Bool)
(declare-fun |list#everUsed| (T@U) Bool)
(declare-fun |Seq#Update| (T@U Int T@U) T@U)
(declare-fun |Seq#Take| (T@U Int) T@U)
(declare-fun |Seq#Contains| (T@U T@U) Bool)
(declare-fun |Seq#Range| (Int Int) T@U)
(declare-fun |Seq#Skolem| (T@U T@U) Int)
(declare-fun elems (T@U T@U) T@U)
(declare-fun |Seq#Singleton| (T@U) T@U)
(declare-fun |lseg#sm| (T@U T@U) T@U)
(declare-fun |list#sm| (T@U) T@U)
(declare-fun |lsegelems#frame| (T@U T@U T@U) T@U)
(declare-fun lsegelems (T@U T@U T@U) T@U)
(declare-fun AssumeFunctionsAbove () Int)
(declare-fun |Seq#Append| (T@U T@U) T@U)
(declare-fun |Seq#Empty| (T@T) T@U)
(declare-fun dummyHeap () T@U)
(declare-fun ZeroMask () T@U)
(declare-fun InsidePredicate (T@U T@U T@U T@U) Bool)
(declare-fun sumMask (T@U T@U T@U) Bool)
(declare-fun ConditionalFrame (Real T@U) T@U)
(declare-fun EmptyFrame () T@U)
(declare-fun NoPerm () Real)
(declare-fun |Seq#Equal| (T@U T@U) Bool)
(declare-fun |Seq#ContainsTrigger| (T@U T@U) Bool)
(declare-fun getPredWandId (T@U) Int)
(declare-fun FullPerm () Real)
(declare-fun |elems#frame| (T@U T@U) T@U)
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
 :qid |stdinbpl.275:18|
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
(assert  (and (and (= (Ctor PredicateType_lsegType) 12) (= (Ctor FrameTypeType) 13)) (forall ((arg0@@26 T@U) (arg1@@10 T@U) ) (! (= (type (lseg arg0@@26 arg1@@10)) (FieldType PredicateType_lsegType FrameTypeType))
 :qid |funType:lseg|
 :pattern ( (lseg arg0@@26 arg1@@10))
))))
(assert (forall ((start T@U) (end T@U) ) (!  (=> (and (= (type start) RefType) (= (type end) RefType)) (IsPredicateField (lseg start end)))
 :qid |stdinbpl.915:15|
 :skolemid |75|
 :pattern ( (lseg start end))
)))
(assert  (and (forall ((arg0@@27 T@U) (arg1@@11 T@U) (arg2@@3 T@U) ) (! (= (type (|lsegelems'| arg0@@27 arg1@@11 arg2@@3)) (SeqType intType))
 :qid |funType:lsegelems'|
 :pattern ( (|lsegelems'| arg0@@27 arg1@@11 arg2@@3))
)) (forall ((arg0@@28 T@U) (arg1@@12 T@U) ) (! (= (type (|lsegelems#triggerStateless| arg0@@28 arg1@@12)) (SeqType intType))
 :qid |funType:lsegelems#triggerStateless|
 :pattern ( (|lsegelems#triggerStateless| arg0@@28 arg1@@12))
))))
(assert (forall ((Heap@@0 T@U) (start@@0 T@U) (end@@0 T@U) ) (!  (=> (and (and (= (type Heap@@0) (MapType0Type RefType)) (= (type start@@0) RefType)) (= (type end@@0) RefType)) (dummyFunction (|lsegelems#triggerStateless| start@@0 end@@0)))
 :qid |stdinbpl.703:15|
 :skolemid |64|
 :pattern ( (|lsegelems'| Heap@@0 start@@0 end@@0))
)))
(assert (forall ((Heap@@1 T@U) (start@@1 T@U) (end@@1 T@U) ) (!  (=> (and (and (= (type Heap@@1) (MapType0Type RefType)) (= (type start@@1) RefType)) (= (type end@@1) RefType)) (|lseg#everUsed| (lseg start@@1 end@@1)))
 :qid |stdinbpl.934:15|
 :skolemid |79|
 :pattern ( (|lseg#trigger| Heap@@1 (lseg start@@1 end@@1)))
)))
(assert (forall ((arg0@@29 T@U) (arg1@@13 Int) ) (! (let ((T@@1 (SeqTypeInv0 (type arg0@@29))))
(= (type (|Seq#Index| arg0@@29 arg1@@13)) T@@1))
 :qid |funType:Seq#Index|
 :pattern ( (|Seq#Index| arg0@@29 arg1@@13))
)))
(assert (forall ((s@@0 T@U) (n@@0 Int) (j Int) ) (! (let ((T@@2 (SeqTypeInv0 (type s@@0))))
 (=> (= (type s@@0) (SeqType T@@2)) (=> (and (and (< 0 n@@0) (<= 0 j)) (< j (- (|Seq#Length| s@@0) n@@0))) (and (= (|Seq#Sub| (|Seq#Add| j n@@0) n@@0) j) (= (|Seq#Index| (|Seq#Drop| s@@0 n@@0) j) (|Seq#Index| s@@0 (|Seq#Add| j n@@0)))))))
 :qid |stdinbpl.296:18|
 :skolemid |39|
 :pattern ( (|Seq#Index| (|Seq#Drop| s@@0 n@@0) j))
)))
(assert  (and (= (type null) RefType) (forall ((arg0@@30 T@U) ) (! (let ((A (FieldTypeInv0 (type arg0@@30))))
(= (type (PredicateMaskField arg0@@30)) (FieldType A (MapType1Type RefType boolType))))
 :qid |funType:PredicateMaskField|
 :pattern ( (PredicateMaskField arg0@@30))
))))
(assert (forall ((Heap@@2 T@U) (ExhaleHeap T@U) (Mask@@0 T@U) (pm_f T@U) ) (! (let ((C (FieldTypeInv0 (type pm_f))))
 (=> (and (and (and (and (and (= (type Heap@@2) (MapType0Type RefType)) (= (type ExhaleHeap) (MapType0Type RefType))) (= (type Mask@@0) (MapType1Type RefType realType))) (= (type pm_f) (FieldType C FrameTypeType))) (IdenticalOnKnownLocations Heap@@2 ExhaleHeap Mask@@0)) (and (HasDirectPerm Mask@@0 null pm_f) (IsPredicateField pm_f))) (= (MapType0Select Heap@@2 null (PredicateMaskField pm_f)) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))))
 :qid |stdinbpl.47:19|
 :skolemid |2|
 :pattern ( (IdenticalOnKnownLocations Heap@@2 ExhaleHeap Mask@@0) (IsPredicateField pm_f) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))
)))
(assert (forall ((arg0@@31 T@U) ) (! (let ((A@@0 (FieldTypeInv0 (type arg0@@31))))
(= (type (WandMaskField arg0@@31)) (FieldType A@@0 (MapType1Type RefType boolType))))
 :qid |funType:WandMaskField|
 :pattern ( (WandMaskField arg0@@31))
)))
(assert (forall ((Heap@@3 T@U) (ExhaleHeap@@0 T@U) (Mask@@1 T@U) (pm_f@@0 T@U) ) (! (let ((C@@0 (FieldTypeInv0 (type pm_f@@0))))
 (=> (and (and (and (and (and (= (type Heap@@3) (MapType0Type RefType)) (= (type ExhaleHeap@@0) (MapType0Type RefType))) (= (type Mask@@1) (MapType1Type RefType realType))) (= (type pm_f@@0) (FieldType C@@0 FrameTypeType))) (IdenticalOnKnownLocations Heap@@3 ExhaleHeap@@0 Mask@@1)) (and (HasDirectPerm Mask@@1 null pm_f@@0) (IsWandField pm_f@@0))) (= (MapType0Select Heap@@3 null (WandMaskField pm_f@@0)) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))))
 :qid |stdinbpl.60:19|
 :skolemid |5|
 :pattern ( (IdenticalOnKnownLocations Heap@@3 ExhaleHeap@@0 Mask@@1) (IsWandField pm_f@@0) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))
)))
(assert  (and (= (Ctor PredicateType_listType) 14) (forall ((arg0@@32 T@U) ) (! (= (type (list arg0@@32)) (FieldType PredicateType_listType FrameTypeType))
 :qid |funType:list|
 :pattern ( (list arg0@@32))
))))
(assert (forall ((start@@2 T@U) ) (!  (=> (= (type start@@2) RefType) (IsPredicateField (list start@@2)))
 :qid |stdinbpl.844:15|
 :skolemid |69|
 :pattern ( (list start@@2))
)))
(assert  (and (forall ((arg0@@33 T@U) (arg1@@14 T@U) ) (! (= (type (|elems'| arg0@@33 arg1@@14)) (SeqType intType))
 :qid |funType:elems'|
 :pattern ( (|elems'| arg0@@33 arg1@@14))
)) (forall ((arg0@@34 T@U) ) (! (= (type (|elems#triggerStateless| arg0@@34)) (SeqType intType))
 :qid |funType:elems#triggerStateless|
 :pattern ( (|elems#triggerStateless| arg0@@34))
))))
(assert (forall ((Heap@@4 T@U) (start@@3 T@U) ) (!  (=> (and (= (type Heap@@4) (MapType0Type RefType)) (= (type start@@3) RefType)) (dummyFunction (|elems#triggerStateless| start@@3)))
 :qid |stdinbpl.563:15|
 :skolemid |59|
 :pattern ( (|elems'| Heap@@4 start@@3))
)))
(assert (forall ((Heap@@5 T@U) (start@@4 T@U) ) (!  (=> (and (= (type Heap@@5) (MapType0Type RefType)) (= (type start@@4) RefType)) (|list#everUsed| (list start@@4)))
 :qid |stdinbpl.863:15|
 :skolemid |73|
 :pattern ( (|list#trigger| Heap@@5 (list start@@4)))
)))
(assert (forall ((arg0@@35 T@U) (arg1@@15 Int) (arg2@@4 T@U) ) (! (let ((T@@3 (type arg2@@4)))
(= (type (|Seq#Update| arg0@@35 arg1@@15 arg2@@4)) (SeqType T@@3)))
 :qid |funType:Seq#Update|
 :pattern ( (|Seq#Update| arg0@@35 arg1@@15 arg2@@4))
)))
(assert (forall ((s@@1 T@U) (i Int) (v T@U) (n@@1 Int) ) (! (let ((T@@4 (type v)))
 (=> (= (type s@@1) (SeqType T@@4)) (=> (and (<= 0 n@@1) (< n@@1 (|Seq#Length| s@@1))) (and (=> (= i n@@1) (= (|Seq#Index| (|Seq#Update| s@@1 i v) n@@1) v)) (=> (not (= i n@@1)) (= (|Seq#Index| (|Seq#Update| s@@1 i v) n@@1) (|Seq#Index| s@@1 n@@1)))))))
 :qid |stdinbpl.251:18|
 :skolemid |35|
 :pattern ( (|Seq#Index| (|Seq#Update| s@@1 i v) n@@1))
 :pattern ( (|Seq#Index| s@@1 n@@1) (|Seq#Update| s@@1 i v))
)))
(assert (forall ((arg0@@36 T@U) (arg1@@16 Int) ) (! (let ((T@@5 (SeqTypeInv0 (type arg0@@36))))
(= (type (|Seq#Take| arg0@@36 arg1@@16)) (SeqType T@@5)))
 :qid |funType:Seq#Take|
 :pattern ( (|Seq#Take| arg0@@36 arg1@@16))
)))
(assert (forall ((s@@2 T@U) (n@@2 Int) ) (! (let ((T@@6 (SeqTypeInv0 (type s@@2))))
 (=> (= (type s@@2) (SeqType T@@6)) (and (=> (<= 0 n@@2) (and (=> (<= n@@2 (|Seq#Length| s@@2)) (= (|Seq#Length| (|Seq#Take| s@@2 n@@2)) n@@2)) (=> (< (|Seq#Length| s@@2) n@@2) (= (|Seq#Length| (|Seq#Take| s@@2 n@@2)) (|Seq#Length| s@@2))))) (=> (< n@@2 0) (= (|Seq#Length| (|Seq#Take| s@@2 n@@2)) 0)))))
 :qid |stdinbpl.262:18|
 :skolemid |36|
 :pattern ( (|Seq#Length| (|Seq#Take| s@@2 n@@2)))
 :pattern ( (|Seq#Take| s@@2 n@@2) (|Seq#Length| s@@2))
)))
(assert (forall ((arg0@@37 Int) (arg1@@17 Int) ) (! (= (type (|Seq#Range| arg0@@37 arg1@@17)) (SeqType intType))
 :qid |funType:Seq#Range|
 :pattern ( (|Seq#Range| arg0@@37 arg1@@17))
)))
(assert (forall ((q@min Int) (q@max Int) (v@@0 T@U) ) (!  (=> (= (type v@@0) intType) (= (|Seq#Contains| (|Seq#Range| q@min q@max) v@@0)  (and (<= q@min (U_2_int v@@0)) (< (U_2_int v@@0) q@max))))
 :qid |stdinbpl.535:15|
 :skolemid |57|
 :pattern ( (|Seq#Contains| (|Seq#Range| q@min q@max) v@@0))
)))
(assert (forall ((s@@3 T@U) (x@@8 T@U) ) (! (let ((T@@7 (type x@@8)))
 (=> (and (= (type s@@3) (SeqType T@@7)) (|Seq#Contains| s@@3 x@@8)) (and (and (<= 0 (|Seq#Skolem| s@@3 x@@8)) (< (|Seq#Skolem| s@@3 x@@8) (|Seq#Length| s@@3))) (= (|Seq#Index| s@@3 (|Seq#Skolem| s@@3 x@@8)) x@@8))))
 :qid |stdinbpl.393:18|
 :skolemid |47|
 :pattern ( (|Seq#Contains| s@@3 x@@8))
)))
(assert (forall ((Heap@@6 T@U) (ExhaleHeap@@1 T@U) (Mask@@2 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@6) (MapType0Type RefType)) (= (type ExhaleHeap@@1) (MapType0Type RefType))) (= (type Mask@@2) (MapType1Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@6 ExhaleHeap@@1 Mask@@2)) (U_2_bool (MapType0Select Heap@@6 o_1 $allocated))) (U_2_bool (MapType0Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.73:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@6 ExhaleHeap@@1 Mask@@2) (MapType0Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert (forall ((arg0@@38 T@U) (arg1@@18 T@U) ) (! (= (type (elems arg0@@38 arg1@@18)) (SeqType intType))
 :qid |funType:elems|
 :pattern ( (elems arg0@@38 arg1@@18))
)))
(assert (forall ((Heap@@7 T@U) (start@@5 T@U) ) (!  (=> (and (= (type Heap@@7) (MapType0Type RefType)) (= (type start@@5) RefType)) (and (= (elems Heap@@7 start@@5) (|elems'| Heap@@7 start@@5)) (dummyFunction (|elems#triggerStateless| start@@5))))
 :qid |stdinbpl.559:15|
 :skolemid |58|
 :pattern ( (elems Heap@@7 start@@5))
)))
(assert (forall ((s@@4 T@U) (n@@3 Int) ) (! (let ((T@@8 (SeqTypeInv0 (type s@@4))))
 (=> (and (= (type s@@4) (SeqType T@@8)) (<= n@@3 0)) (= (|Seq#Drop| s@@4 n@@3) s@@4)))
 :qid |stdinbpl.377:18|
 :skolemid |45|
 :pattern ( (|Seq#Drop| s@@4 n@@3))
)))
(assert (forall ((i@@0 Int) (j@@0 Int) ) (! (= (|Seq#Sub| i@@0 j@@0) (- i@@0 j@@0))
 :qid |stdinbpl.231:15|
 :skolemid |30|
 :pattern ( (|Seq#Sub| i@@0 j@@0))
)))
(assert (forall ((i@@1 Int) (j@@1 Int) ) (! (= (|Seq#Add| i@@1 j@@1) (+ i@@1 j@@1))
 :qid |stdinbpl.229:15|
 :skolemid |29|
 :pattern ( (|Seq#Add| i@@1 j@@1))
)))
(assert (forall ((arg0@@39 T@U) ) (! (let ((T@@9 (type arg0@@39)))
(= (type (|Seq#Singleton| arg0@@39)) (SeqType T@@9)))
 :qid |funType:Seq#Singleton|
 :pattern ( (|Seq#Singleton| arg0@@39))
)))
(assert (forall ((x@@9 T@U) (y@@1 T@U) ) (! (let ((T@@10 (type x@@9)))
 (=> (= (type y@@1) T@@10) (= (|Seq#Contains| (|Seq#Singleton| x@@9) y@@1) (= x@@9 y@@1))))
 :qid |stdinbpl.518:18|
 :skolemid |54|
 :pattern ( (|Seq#Contains| (|Seq#Singleton| x@@9) y@@1))
)))
(assert (forall ((start@@6 T@U) (end@@2 T@U) (start2 T@U) (end2 T@U) ) (!  (=> (and (and (and (and (= (type start@@6) RefType) (= (type end@@2) RefType)) (= (type start2) RefType)) (= (type end2) RefType)) (= (lseg start@@6 end@@2) (lseg start2 end2))) (and (= start@@6 start2) (= end@@2 end2)))
 :qid |stdinbpl.925:15|
 :skolemid |77|
 :pattern ( (lseg start@@6 end@@2) (lseg start2 end2))
)))
(assert (forall ((arg0@@40 T@U) (arg1@@19 T@U) ) (! (= (type (|lseg#sm| arg0@@40 arg1@@19)) (FieldType PredicateType_lsegType (MapType1Type RefType boolType)))
 :qid |funType:lseg#sm|
 :pattern ( (|lseg#sm| arg0@@40 arg1@@19))
)))
(assert (forall ((start@@7 T@U) (end@@3 T@U) (start2@@0 T@U) (end2@@0 T@U) ) (!  (=> (and (and (and (and (= (type start@@7) RefType) (= (type end@@3) RefType)) (= (type start2@@0) RefType)) (= (type end2@@0) RefType)) (= (|lseg#sm| start@@7 end@@3) (|lseg#sm| start2@@0 end2@@0))) (and (= start@@7 start2@@0) (= end@@3 end2@@0)))
 :qid |stdinbpl.929:15|
 :skolemid |78|
 :pattern ( (|lseg#sm| start@@7 end@@3) (|lseg#sm| start2@@0 end2@@0))
)))
(assert (forall ((s@@5 T@U) (n@@4 Int) (j@@2 Int) ) (! (let ((T@@11 (SeqTypeInv0 (type s@@5))))
 (=> (= (type s@@5) (SeqType T@@11)) (=> (and (and (<= 0 j@@2) (< j@@2 n@@4)) (< j@@2 (|Seq#Length| s@@5))) (= (|Seq#Index| (|Seq#Take| s@@5 n@@4) j@@2) (|Seq#Index| s@@5 j@@2)))))
 :qid |stdinbpl.270:18|
 :skolemid |37|
 :pattern ( (|Seq#Index| (|Seq#Take| s@@5 n@@4) j@@2))
 :pattern ( (|Seq#Index| s@@5 j@@2) (|Seq#Take| s@@5 n@@4))
)))
(assert (forall ((start@@8 T@U) (start2@@1 T@U) ) (!  (=> (and (and (= (type start@@8) RefType) (= (type start2@@1) RefType)) (= (list start@@8) (list start2@@1))) (= start@@8 start2@@1))
 :qid |stdinbpl.854:15|
 :skolemid |71|
 :pattern ( (list start@@8) (list start2@@1))
)))
(assert (forall ((arg0@@41 T@U) ) (! (= (type (|list#sm| arg0@@41)) (FieldType PredicateType_listType (MapType1Type RefType boolType)))
 :qid |funType:list#sm|
 :pattern ( (|list#sm| arg0@@41))
)))
(assert (forall ((start@@9 T@U) (start2@@2 T@U) ) (!  (=> (and (and (= (type start@@9) RefType) (= (type start2@@2) RefType)) (= (|list#sm| start@@9) (|list#sm| start2@@2))) (= start@@9 start2@@2))
 :qid |stdinbpl.858:15|
 :skolemid |72|
 :pattern ( (|list#sm| start@@9) (|list#sm| start2@@2))
)))
(assert (forall ((arg0@@42 T@U) (arg1@@20 T@U) (arg2@@5 T@U) ) (! (= (type (|lsegelems#frame| arg0@@42 arg1@@20 arg2@@5)) (SeqType intType))
 :qid |funType:lsegelems#frame|
 :pattern ( (|lsegelems#frame| arg0@@42 arg1@@20 arg2@@5))
)))
(assert (forall ((Heap@@8 T@U) (Mask@@3 T@U) (start@@10 T@U) (end@@4 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@8) (MapType0Type RefType)) (= (type Mask@@3) (MapType1Type RefType realType))) (= (type start@@10) RefType)) (= (type end@@4) RefType)) (state Heap@@8 Mask@@3)) (= (|lsegelems'| Heap@@8 start@@10 end@@4) (|lsegelems#frame| (MapType0Select Heap@@8 null (lseg start@@10 end@@4)) start@@10 end@@4)))
 :qid |stdinbpl.716:15|
 :skolemid |66|
 :pattern ( (state Heap@@8 Mask@@3) (|lsegelems'| Heap@@8 start@@10 end@@4))
 :pattern ( (state Heap@@8 Mask@@3) (|lsegelems#triggerStateless| start@@10 end@@4) (|lseg#trigger| Heap@@8 (lseg start@@10 end@@4)))
)))
(assert (forall ((Heap@@9 T@U) (ExhaleHeap@@2 T@U) (Mask@@4 T@U) (o_1@@0 T@U) (f_2 T@U) ) (! (let ((B@@1 (FieldTypeInv1 (type f_2))))
(let ((A@@1 (FieldTypeInv0 (type f_2))))
 (=> (and (and (and (and (and (and (= (type Heap@@9) (MapType0Type RefType)) (= (type ExhaleHeap@@2) (MapType0Type RefType))) (= (type Mask@@4) (MapType1Type RefType realType))) (= (type o_1@@0) RefType)) (= (type f_2) (FieldType A@@1 B@@1))) (IdenticalOnKnownLocations Heap@@9 ExhaleHeap@@2 Mask@@4)) (HasDirectPerm Mask@@4 o_1@@0 f_2)) (= (MapType0Select Heap@@9 o_1@@0 f_2) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2)))))
 :qid |stdinbpl.42:22|
 :skolemid |1|
 :pattern ( (IdenticalOnKnownLocations Heap@@9 ExhaleHeap@@2 Mask@@4) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2))
)))
(assert  (and (forall ((arg0@@43 T@U) (arg1@@21 T@U) (arg2@@6 T@U) ) (! (= (type (lsegelems arg0@@43 arg1@@21 arg2@@6)) (SeqType intType))
 :qid |funType:lsegelems|
 :pattern ( (lsegelems arg0@@43 arg1@@21 arg2@@6))
)) (forall ((arg0@@44 T@U) (arg1@@22 T@U) ) (! (let ((T@@12 (SeqTypeInv0 (type arg0@@44))))
(= (type (|Seq#Append| arg0@@44 arg1@@22)) (SeqType T@@12)))
 :qid |funType:Seq#Append|
 :pattern ( (|Seq#Append| arg0@@44 arg1@@22))
))))
(assert (forall ((Heap@@10 T@U) (Mask@@5 T@U) (start@@11 T@U) (end@@5 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@10) (MapType0Type RefType)) (= (type Mask@@5) (MapType1Type RefType realType))) (= (type start@@11) RefType)) (= (type end@@5) RefType)) (and (state Heap@@10 Mask@@5) (< AssumeFunctionsAbove 1))) (= (lsegelems Heap@@10 start@@11 end@@5) (ite (= (MapType0Select Heap@@10 start@@11 next) end@@5) (|Seq#Singleton| (MapType0Select Heap@@10 start@@11 val)) (|Seq#Append| (|Seq#Singleton| (MapType0Select Heap@@10 start@@11 val)) (|lsegelems'| Heap@@10 (MapType0Select Heap@@10 start@@11 next) end@@5)))))
 :qid |stdinbpl.709:15|
 :skolemid |65|
 :pattern ( (state Heap@@10 Mask@@5) (lsegelems Heap@@10 start@@11 end@@5))
 :pattern ( (state Heap@@10 Mask@@5) (|lsegelems#triggerStateless| start@@11 end@@5) (|lseg#trigger| Heap@@10 (lseg start@@11 end@@5)))
)))
(assert (forall ((T@@13 T@T) ) (! (= (type (|Seq#Empty| T@@13)) (SeqType T@@13))
 :qid |funType:Seq#Empty|
 :pattern ( (|Seq#Empty| T@@13))
)))
(assert (forall ((T@@14 T@T) ) (! (= (|Seq#Length| (|Seq#Empty| T@@14)) 0)
 :skolemid |23|
)))
(assert  (and (= (type dummyHeap) (MapType0Type RefType)) (= (type ZeroMask) (MapType1Type RefType realType))))
(assert (state dummyHeap ZeroMask))
(assert (forall ((p T@U) (v_1 T@U) (w T@U) ) (! (let ((A@@2 (FieldTypeInv0 (type p))))
 (=> (and (and (= (type p) (FieldType A@@2 FrameTypeType)) (= (type v_1) FrameTypeType)) (= (type w) FrameTypeType)) (not (InsidePredicate p v_1 p w))))
 :qid |stdinbpl.174:19|
 :skolemid |21|
 :pattern ( (InsidePredicate p v_1 p w))
)))
(assert (forall ((s0 T@U) (s1 T@U) (n@@5 Int) ) (! (let ((T@@15 (SeqTypeInv0 (type s0))))
 (=> (and (= (type s0) (SeqType T@@15)) (= (type s1) (SeqType T@@15))) (=> (and (and (and (not (= s0 (|Seq#Empty| T@@15))) (not (= s1 (|Seq#Empty| T@@15)))) (<= (|Seq#Length| s0) n@@5)) (< n@@5 (|Seq#Length| (|Seq#Append| s0 s1)))) (and (= (|Seq#Add| (|Seq#Sub| n@@5 (|Seq#Length| s0)) (|Seq#Length| s0)) n@@5) (= (|Seq#Index| (|Seq#Append| s0 s1) n@@5) (|Seq#Index| s1 (|Seq#Sub| n@@5 (|Seq#Length| s0))))))))
 :qid |stdinbpl.242:18|
 :skolemid |32|
 :pattern ( (|Seq#Index| (|Seq#Append| s0 s1) n@@5))
)))
(assert  (not (IsPredicateField next)))
(assert  (not (IsWandField next)))
(assert  (not (IsPredicateField val)))
(assert  (not (IsWandField val)))
(assert (forall ((Heap@@11 T@U) (ExhaleHeap@@3 T@U) (Mask@@6 T@U) ) (!  (=> (and (and (and (= (type Heap@@11) (MapType0Type RefType)) (= (type ExhaleHeap@@3) (MapType0Type RefType))) (= (type Mask@@6) (MapType1Type RefType realType))) (IdenticalOnKnownLocations Heap@@11 ExhaleHeap@@3 Mask@@6)) (succHeap Heap@@11 ExhaleHeap@@3))
 :qid |stdinbpl.83:15|
 :skolemid |10|
 :pattern ( (IdenticalOnKnownLocations Heap@@11 ExhaleHeap@@3 Mask@@6))
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
 :qid |stdinbpl.162:15|
 :skolemid |19|
 :pattern ( (ConditionalFrame p@@0 f_6))
)))
(assert (forall ((q@min@@0 Int) (q@max@@0 Int) (j@@3 Int) ) (!  (=> (and (<= 0 j@@3) (< j@@3 (- q@max@@0 q@min@@0))) (= (U_2_int (|Seq#Index| (|Seq#Range| q@min@@0 q@max@@0) j@@3)) (+ q@min@@0 j@@3)))
 :qid |stdinbpl.533:15|
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
 :qid |stdinbpl.211:18|
 :skolemid |26|
 :pattern ( (|Seq#Length| (|Seq#Append| s0@@0 s1@@0)))
)))
(assert (forall ((s@@6 T@U) (t T@U) (n@@6 Int) ) (! (let ((T@@17 (SeqTypeInv0 (type s@@6))))
 (=> (and (and (= (type s@@6) (SeqType T@@17)) (= (type t) (SeqType T@@17))) (and (> n@@6 0) (> n@@6 (|Seq#Length| s@@6)))) (and (= (|Seq#Add| (|Seq#Sub| n@@6 (|Seq#Length| s@@6)) (|Seq#Length| s@@6)) n@@6) (= (|Seq#Drop| (|Seq#Append| s@@6 t) n@@6) (|Seq#Drop| t (|Seq#Sub| n@@6 (|Seq#Length| s@@6)))))))
 :qid |stdinbpl.367:18|
 :skolemid |44|
 :pattern ( (|Seq#Drop| (|Seq#Append| s@@6 t) n@@6))
)))
(assert (forall ((Heap@@12 T@U) (start@@12 T@U) (end@@6 T@U) ) (!  (=> (and (and (= (type Heap@@12) (MapType0Type RefType)) (= (type start@@12) RefType)) (= (type end@@6) RefType)) (and (= (lsegelems Heap@@12 start@@12 end@@6) (|lsegelems'| Heap@@12 start@@12 end@@6)) (dummyFunction (|lsegelems#triggerStateless| start@@12 end@@6))))
 :qid |stdinbpl.699:15|
 :skolemid |63|
 :pattern ( (lsegelems Heap@@12 start@@12 end@@6))
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
 :qid |stdinbpl.354:18|
 :skolemid |42|
 :pattern ( (|Seq#Take| (|Seq#Append| s@@7 t@@0) n@@7))
)))
(assert (forall ((q@min@@1 Int) (q@max@@1 Int) ) (!  (and (=> (< q@min@@1 q@max@@1) (= (|Seq#Length| (|Seq#Range| q@min@@1 q@max@@1)) (- q@max@@1 q@min@@1))) (=> (<= q@max@@1 q@min@@1) (= (|Seq#Length| (|Seq#Range| q@min@@1 q@max@@1)) 0)))
 :qid |stdinbpl.532:15|
 :skolemid |55|
 :pattern ( (|Seq#Length| (|Seq#Range| q@min@@1 q@max@@1)))
)))
(assert (forall ((a T@U) (b T@U) ) (! (let ((T@@19 (SeqTypeInv0 (type a))))
 (=> (and (and (= (type a) (SeqType T@@19)) (= (type b) (SeqType T@@19))) (|Seq#Equal| a b)) (= a b)))
 :qid |stdinbpl.505:18|
 :skolemid |53|
 :pattern ( (|Seq#Equal| a b))
)))
(assert (forall ((s@@8 T@U) (i@@2 Int) ) (! (let ((T@@20 (SeqTypeInv0 (type s@@8))))
 (=> (= (type s@@8) (SeqType T@@20)) (=> (and (<= 0 i@@2) (< i@@2 (|Seq#Length| s@@8))) (|Seq#ContainsTrigger| s@@8 (|Seq#Index| s@@8 i@@2)))))
 :qid |stdinbpl.398:18|
 :skolemid |49|
 :pattern ( (|Seq#Index| s@@8 i@@2))
)))
(assert (forall ((s0@@1 T@U) (s1@@1 T@U) ) (! (let ((T@@21 (SeqTypeInv0 (type s0@@1))))
 (=> (and (= (type s0@@1) (SeqType T@@21)) (= (type s1@@1) (SeqType T@@21))) (and (=> (= s0@@1 (|Seq#Empty| T@@21)) (= (|Seq#Append| s0@@1 s1@@1) s1@@1)) (=> (= s1@@1 (|Seq#Empty| T@@21)) (= (|Seq#Append| s0@@1 s1@@1) s0@@1)))))
 :qid |stdinbpl.217:18|
 :skolemid |27|
 :pattern ( (|Seq#Append| s0@@1 s1@@1))
)))
(assert (forall ((t@@1 T@U) ) (! (= (|Seq#Index| (|Seq#Singleton| t@@1) 0) t@@1)
 :qid |stdinbpl.221:18|
 :skolemid |28|
 :pattern ( (|Seq#Singleton| t@@1))
)))
(assert (forall ((s@@9 T@U) ) (! (let ((T@@22 (SeqTypeInv0 (type s@@9))))
 (=> (= (type s@@9) (SeqType T@@22)) (<= 0 (|Seq#Length| s@@9))))
 :qid |stdinbpl.200:18|
 :skolemid |22|
 :pattern ( (|Seq#Length| s@@9))
)))
(assert (forall ((start@@13 T@U) (end@@7 T@U) ) (!  (=> (and (= (type start@@13) RefType) (= (type end@@7) RefType)) (= (getPredWandId (lseg start@@13 end@@7)) 1))
 :qid |stdinbpl.919:15|
 :skolemid |76|
 :pattern ( (lseg start@@13 end@@7))
)))
(assert (forall ((s0@@2 T@U) (s1@@2 T@U) ) (! (let ((T@@23 (SeqTypeInv0 (type s0@@2))))
 (=> (and (and (= (type s0@@2) (SeqType T@@23)) (= (type s1@@2) (SeqType T@@23))) (|Seq#Equal| s0@@2 s1@@2)) (and (= (|Seq#Length| s0@@2) (|Seq#Length| s1@@2)) (forall ((j@@4 Int) ) (!  (=> (and (<= 0 j@@4) (< j@@4 (|Seq#Length| s0@@2))) (= (|Seq#Index| s0@@2 j@@4) (|Seq#Index| s1@@2 j@@4)))
 :qid |stdinbpl.495:13|
 :skolemid |50|
 :pattern ( (|Seq#Index| s0@@2 j@@4))
 :pattern ( (|Seq#Index| s1@@2 j@@4))
)))))
 :qid |stdinbpl.492:18|
 :skolemid |51|
 :pattern ( (|Seq#Equal| s0@@2 s1@@2))
)))
(assert (forall ((Heap@@13 T@U) (ExhaleHeap@@4 T@U) (Mask@@8 T@U) (pm_f@@1 T@U) ) (! (let ((C@@1 (FieldTypeInv0 (type pm_f@@1))))
 (=> (and (and (and (and (and (= (type Heap@@13) (MapType0Type RefType)) (= (type ExhaleHeap@@4) (MapType0Type RefType))) (= (type Mask@@8) (MapType1Type RefType realType))) (= (type pm_f@@1) (FieldType C@@1 FrameTypeType))) (IdenticalOnKnownLocations Heap@@13 ExhaleHeap@@4 Mask@@8)) (and (HasDirectPerm Mask@@8 null pm_f@@1) (IsPredicateField pm_f@@1))) (forall ((o2 T@U) (f_2@@0 T@U) ) (! (let ((B@@5 (FieldTypeInv1 (type f_2@@0))))
(let ((A@@6 (FieldTypeInv0 (type f_2@@0))))
 (=> (and (and (= (type o2) RefType) (= (type f_2@@0) (FieldType A@@6 B@@5))) (U_2_bool (MapType1Select (MapType0Select Heap@@13 null (PredicateMaskField pm_f@@1)) o2 f_2@@0))) (= (MapType0Select Heap@@13 o2 f_2@@0) (MapType0Select ExhaleHeap@@4 o2 f_2@@0)))))
 :qid |stdinbpl.54:134|
 :skolemid |3|
 :pattern ( (MapType0Select ExhaleHeap@@4 o2 f_2@@0))
))))
 :qid |stdinbpl.52:19|
 :skolemid |4|
 :pattern ( (IdenticalOnKnownLocations Heap@@13 ExhaleHeap@@4 Mask@@8) (IsPredicateField pm_f@@1))
)))
(assert (forall ((Heap@@14 T@U) (ExhaleHeap@@5 T@U) (Mask@@9 T@U) (pm_f@@2 T@U) ) (! (let ((C@@2 (FieldTypeInv0 (type pm_f@@2))))
 (=> (and (and (and (and (and (= (type Heap@@14) (MapType0Type RefType)) (= (type ExhaleHeap@@5) (MapType0Type RefType))) (= (type Mask@@9) (MapType1Type RefType realType))) (= (type pm_f@@2) (FieldType C@@2 FrameTypeType))) (IdenticalOnKnownLocations Heap@@14 ExhaleHeap@@5 Mask@@9)) (and (HasDirectPerm Mask@@9 null pm_f@@2) (IsWandField pm_f@@2))) (forall ((o2@@0 T@U) (f_2@@1 T@U) ) (! (let ((B@@6 (FieldTypeInv1 (type f_2@@1))))
(let ((A@@7 (FieldTypeInv0 (type f_2@@1))))
 (=> (and (and (= (type o2@@0) RefType) (= (type f_2@@1) (FieldType A@@7 B@@6))) (U_2_bool (MapType1Select (MapType0Select Heap@@14 null (WandMaskField pm_f@@2)) o2@@0 f_2@@1))) (= (MapType0Select Heap@@14 o2@@0 f_2@@1) (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1)))))
 :qid |stdinbpl.67:129|
 :skolemid |6|
 :pattern ( (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1))
))))
 :qid |stdinbpl.65:19|
 :skolemid |7|
 :pattern ( (IdenticalOnKnownLocations Heap@@14 ExhaleHeap@@5 Mask@@9) (IsWandField pm_f@@2))
)))
(assert (forall ((start@@14 T@U) ) (!  (=> (= (type start@@14) RefType) (= (getPredWandId (list start@@14)) 0))
 :qid |stdinbpl.848:15|
 :skolemid |70|
 :pattern ( (list start@@14))
)))
(assert (forall ((t@@2 T@U) ) (! (= (|Seq#Length| (|Seq#Singleton| t@@2)) 1)
 :qid |stdinbpl.208:18|
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
(assert (forall ((arg0@@46 T@U) (arg1@@24 T@U) ) (! (= (type (|elems#frame| arg0@@46 arg1@@24)) (SeqType intType))
 :qid |funType:elems#frame|
 :pattern ( (|elems#frame| arg0@@46 arg1@@24))
)))
(assert (forall ((Heap@@15 T@U) (Mask@@11 T@U) (start@@15 T@U) ) (!  (=> (and (and (and (= (type Heap@@15) (MapType0Type RefType)) (= (type Mask@@11) (MapType1Type RefType realType))) (= (type start@@15) RefType)) (state Heap@@15 Mask@@11)) (= (|elems'| Heap@@15 start@@15) (|elems#frame| (MapType0Select Heap@@15 null (list start@@15)) start@@15)))
 :qid |stdinbpl.576:15|
 :skolemid |61|
 :pattern ( (state Heap@@15 Mask@@11) (|elems'| Heap@@15 start@@15))
 :pattern ( (state Heap@@15 Mask@@11) (|elems#triggerStateless| start@@15) (|list#trigger| Heap@@15 (list start@@15)))
)))
(assert (forall ((o T@U) (f T@U) (Heap@@16 T@U) ) (!  (=> (and (and (and (= (type o) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap@@16) (MapType0Type RefType))) (U_2_bool (MapType0Select Heap@@16 o $allocated))) (U_2_bool (MapType0Select Heap@@16 (MapType0Select Heap@@16 o f) $allocated)))
 :qid |stdinbpl.31:15|
 :skolemid |0|
 :pattern ( (MapType0Select Heap@@16 o f))
)))
(assert (forall ((start@@16 T@U) (end@@8 T@U) ) (!  (=> (and (= (type start@@16) RefType) (= (type end@@8) RefType)) (= (PredicateMaskField (lseg start@@16 end@@8)) (|lseg#sm| start@@16 end@@8)))
 :qid |stdinbpl.911:15|
 :skolemid |74|
 :pattern ( (PredicateMaskField (lseg start@@16 end@@8)))
)))
(assert (forall ((s@@10 T@U) (t@@3 T@U) (n@@8 Int) ) (! (let ((T@@24 (SeqTypeInv0 (type s@@10))))
 (=> (and (and (= (type s@@10) (SeqType T@@24)) (= (type t@@3) (SeqType T@@24))) (and (< 0 n@@8) (<= n@@8 (|Seq#Length| s@@10)))) (= (|Seq#Take| (|Seq#Append| s@@10 t@@3) n@@8) (|Seq#Take| s@@10 n@@8))))
 :qid |stdinbpl.350:18|
 :skolemid |41|
 :pattern ( (|Seq#Take| (|Seq#Append| s@@10 t@@3) n@@8))
)))
(assert (forall ((s@@11 T@U) (i@@3 Int) (v@@1 T@U) ) (! (let ((T@@25 (type v@@1)))
 (=> (= (type s@@11) (SeqType T@@25)) (=> (and (<= 0 i@@3) (< i@@3 (|Seq#Length| s@@11))) (= (|Seq#Length| (|Seq#Update| s@@11 i@@3 v@@1)) (|Seq#Length| s@@11)))))
 :qid |stdinbpl.249:18|
 :skolemid |34|
 :pattern ( (|Seq#Length| (|Seq#Update| s@@11 i@@3 v@@1)))
 :pattern ( (|Seq#Length| s@@11) (|Seq#Update| s@@11 i@@3 v@@1))
)))
(assert (forall ((start@@17 T@U) ) (!  (=> (= (type start@@17) RefType) (= (PredicateMaskField (list start@@17)) (|list#sm| start@@17)))
 :qid |stdinbpl.840:15|
 :skolemid |68|
 :pattern ( (PredicateMaskField (list start@@17)))
)))
(assert (forall ((s@@12 T@U) (t@@4 T@U) (n@@9 Int) ) (! (let ((T@@26 (SeqTypeInv0 (type s@@12))))
 (=> (and (and (= (type s@@12) (SeqType T@@26)) (= (type t@@4) (SeqType T@@26))) (and (< 0 n@@9) (<= n@@9 (|Seq#Length| s@@12)))) (= (|Seq#Drop| (|Seq#Append| s@@12 t@@4) n@@9) (|Seq#Append| (|Seq#Drop| s@@12 n@@9) t@@4))))
 :qid |stdinbpl.363:18|
 :skolemid |43|
 :pattern ( (|Seq#Drop| (|Seq#Append| s@@12 t@@4) n@@9))
)))
(assert (forall ((s@@13 T@U) (n@@10 Int) (i@@4 Int) ) (! (let ((T@@27 (SeqTypeInv0 (type s@@13))))
 (=> (= (type s@@13) (SeqType T@@27)) (=> (and (and (< 0 n@@10) (<= n@@10 i@@4)) (< i@@4 (|Seq#Length| s@@13))) (and (= (|Seq#Add| (|Seq#Sub| i@@4 n@@10) n@@10) i@@4) (= (|Seq#Index| (|Seq#Drop| s@@13 n@@10) (|Seq#Sub| i@@4 n@@10)) (|Seq#Index| s@@13 i@@4))))))
 :qid |stdinbpl.300:18|
 :skolemid |40|
 :pattern ( (|Seq#Drop| s@@13 n@@10) (|Seq#Index| s@@13 i@@4))
)))
(assert (forall ((s0@@3 T@U) (s1@@3 T@U) (n@@11 Int) ) (! (let ((T@@28 (SeqTypeInv0 (type s0@@3))))
 (=> (and (= (type s0@@3) (SeqType T@@28)) (= (type s1@@3) (SeqType T@@28))) (=> (and (and (and (not (= s0@@3 (|Seq#Empty| T@@28))) (not (= s1@@3 (|Seq#Empty| T@@28)))) (<= 0 n@@11)) (< n@@11 (|Seq#Length| s0@@3))) (= (|Seq#Index| (|Seq#Append| s0@@3 s1@@3) n@@11) (|Seq#Index| s0@@3 n@@11)))))
 :qid |stdinbpl.240:18|
 :skolemid |31|
 :pattern ( (|Seq#Index| (|Seq#Append| s0@@3 s1@@3) n@@11))
 :pattern ( (|Seq#Index| s0@@3 n@@11) (|Seq#Append| s0@@3 s1@@3))
)))
(assert (forall ((Heap@@17 T@U) (o@@0 T@U) (f_3 T@U) (v@@2 T@U) ) (! (let ((B@@8 (type v@@2)))
(let ((A@@9 (FieldTypeInv0 (type f_3))))
 (=> (and (and (= (type Heap@@17) (MapType0Type RefType)) (= (type o@@0) RefType)) (= (type f_3) (FieldType A@@9 B@@8))) (succHeap Heap@@17 (MapType0Store Heap@@17 o@@0 f_3 v@@2)))))
 :qid |stdinbpl.78:22|
 :skolemid |9|
 :pattern ( (MapType0Store Heap@@17 o@@0 f_3 v@@2))
)))
(assert (forall ((s0@@4 T@U) (s1@@4 T@U) (m@@7 Int) ) (! (let ((T@@29 (SeqTypeInv0 (type s0@@4))))
 (=> (and (= (type s0@@4) (SeqType T@@29)) (= (type s1@@4) (SeqType T@@29))) (=> (and (and (and (not (= s0@@4 (|Seq#Empty| T@@29))) (not (= s1@@4 (|Seq#Empty| T@@29)))) (<= 0 m@@7)) (< m@@7 (|Seq#Length| s1@@4))) (and (= (|Seq#Sub| (|Seq#Add| m@@7 (|Seq#Length| s0@@4)) (|Seq#Length| s0@@4)) m@@7) (= (|Seq#Index| (|Seq#Append| s0@@4 s1@@4) (|Seq#Add| m@@7 (|Seq#Length| s0@@4))) (|Seq#Index| s1@@4 m@@7))))))
 :qid |stdinbpl.245:18|
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
 :qid |stdinbpl.396:18|
 :skolemid |48|
 :pattern ( (|Seq#Contains| s@@14 x@@10) (|Seq#Index| s@@14 i@@5))
)))
(assert (forall ((s0@@5 T@U) (s1@@5 T@U) ) (! (let ((T@@31 (SeqTypeInv0 (type s0@@5))))
 (=> (and (= (type s0@@5) (SeqType T@@31)) (= (type s1@@5) (SeqType T@@31))) (or (or (and (= s0@@5 s1@@5) (|Seq#Equal| s0@@5 s1@@5)) (and (and (not (= s0@@5 s1@@5)) (not (|Seq#Equal| s0@@5 s1@@5))) (not (= (|Seq#Length| s0@@5) (|Seq#Length| s1@@5))))) (and (and (and (and (and (and (not (= s0@@5 s1@@5)) (not (|Seq#Equal| s0@@5 s1@@5))) (= (|Seq#Length| s0@@5) (|Seq#Length| s1@@5))) (= (|Seq#SkolemDiff| s0@@5 s1@@5) (|Seq#SkolemDiff| s1@@5 s0@@5))) (<= 0 (|Seq#SkolemDiff| s0@@5 s1@@5))) (< (|Seq#SkolemDiff| s0@@5 s1@@5) (|Seq#Length| s0@@5))) (not (= (|Seq#Index| s0@@5 (|Seq#SkolemDiff| s0@@5 s1@@5)) (|Seq#Index| s1@@5 (|Seq#SkolemDiff| s0@@5 s1@@5))))))))
 :qid |stdinbpl.500:18|
 :skolemid |52|
 :pattern ( (|Seq#Equal| s0@@5 s1@@5))
)))
(assert (forall ((p@@1 T@U) (v_1@@0 T@U) (q T@U) (w@@0 T@U) (r T@U) (u T@U) ) (! (let ((C@@3 (FieldTypeInv0 (type r))))
(let ((B@@10 (FieldTypeInv0 (type q))))
(let ((A@@11 (FieldTypeInv0 (type p@@1))))
 (=> (and (and (and (and (and (and (= (type p@@1) (FieldType A@@11 FrameTypeType)) (= (type v_1@@0) FrameTypeType)) (= (type q) (FieldType B@@10 FrameTypeType))) (= (type w@@0) FrameTypeType)) (= (type r) (FieldType C@@3 FrameTypeType))) (= (type u) FrameTypeType)) (and (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))) (InsidePredicate p@@1 v_1@@0 r u)))))
 :qid |stdinbpl.169:25|
 :skolemid |20|
 :pattern ( (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))
)))
(assert (forall ((s@@15 T@U) ) (! (let ((T@@32 (SeqTypeInv0 (type s@@15))))
 (=> (and (= (type s@@15) (SeqType T@@32)) (= (|Seq#Length| s@@15) 0)) (= s@@15 (|Seq#Empty| T@@32))))
 :qid |stdinbpl.204:18|
 :skolemid |24|
 :pattern ( (|Seq#Length| s@@15))
)))
(assert (forall ((s@@16 T@U) (n@@12 Int) ) (! (let ((T@@33 (SeqTypeInv0 (type s@@16))))
 (=> (and (= (type s@@16) (SeqType T@@33)) (<= n@@12 0)) (= (|Seq#Take| s@@16 n@@12) (|Seq#Empty| T@@33))))
 :qid |stdinbpl.379:18|
 :skolemid |46|
 :pattern ( (|Seq#Take| s@@16 n@@12))
)))
(assert (forall ((Heap@@18 T@U) (Mask@@12 T@U) (start@@18 T@U) ) (!  (=> (and (and (and (= (type Heap@@18) (MapType0Type RefType)) (= (type Mask@@12) (MapType1Type RefType realType))) (= (type start@@18) RefType)) (and (state Heap@@18 Mask@@12) (< AssumeFunctionsAbove 0))) (= (elems Heap@@18 start@@18) (ite (= (MapType0Select Heap@@18 start@@18 next) null) (|Seq#Singleton| (MapType0Select Heap@@18 start@@18 val)) (|Seq#Append| (|Seq#Singleton| (MapType0Select Heap@@18 start@@18 val)) (|elems'| Heap@@18 (MapType0Select Heap@@18 start@@18 next))))))
 :qid |stdinbpl.569:15|
 :skolemid |60|
 :pattern ( (state Heap@@18 Mask@@12) (elems Heap@@18 start@@18))
 :pattern ( (state Heap@@18 Mask@@12) (|elems#triggerStateless| start@@18) (|list#trigger| Heap@@18 (list start@@18)))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun Mask@3 () T@U)
(declare-fun l1 () T@U)
(declare-fun l2 () T@U)
(declare-fun PostMask@1 () T@U)
(declare-fun Heap@@19 () T@U)
(declare-fun PostHeap@0 () T@U)
(declare-fun PostMask@0 () T@U)
(declare-fun Mask@30 () T@U)
(declare-fun Mask@29 () T@U)
(declare-fun Heap@24 () T@U)
(declare-fun Mask@28 () T@U)
(declare-fun Heap@22 () T@U)
(declare-fun end@0 () T@U)
(declare-fun newPMask@2 () T@U)
(declare-fun Heap@23 () T@U)
(declare-fun Heap@21 () T@U)
(declare-fun Heap@20 () T@U)
(declare-fun Heap@17 () T@U)
(declare-fun Heap@18 () T@U)
(declare-fun Heap@19 () T@U)
(declare-fun freshVersion@2 () T@U)
(declare-fun Mask@27 () T@U)
(declare-fun CombineFrames (T@U T@U) T@U)
(declare-fun FrameFragment (T@U) T@U)
(declare-fun Mask@26 () T@U)
(declare-fun Mask@25 () T@U)
(declare-fun Mask@24 () T@U)
(declare-fun Mask@23 () T@U)
(declare-fun Heap@15 () T@U)
(declare-fun newPMask@1 () T@U)
(declare-fun Heap@16 () T@U)
(declare-fun Heap@14 () T@U)
(declare-fun Heap@13 () T@U)
(declare-fun Heap@10 () T@U)
(declare-fun Heap@11 () T@U)
(declare-fun Heap@12 () T@U)
(declare-fun freshVersion@1 () T@U)
(declare-fun Mask@22 () T@U)
(declare-fun Mask@21 () T@U)
(declare-fun Mask@20 () T@U)
(declare-fun Mask@19 () T@U)
(declare-fun Mask@18 () T@U)
(declare-fun Heap@8 () T@U)
(declare-fun newPMask@0 () T@U)
(declare-fun Heap@9 () T@U)
(declare-fun Heap@7 () T@U)
(declare-fun Heap@6 () T@U)
(declare-fun Heap@3 () T@U)
(declare-fun Heap@4 () T@U)
(declare-fun Heap@5 () T@U)
(declare-fun freshVersion@0 () T@U)
(declare-fun Mask@17 () T@U)
(declare-fun Mask@16 () T@U)
(declare-fun Mask@15 () T@U)
(declare-fun Mask@14 () T@U)
(declare-fun Mask@13 () T@U)
(declare-fun Mask@11 () T@U)
(declare-fun Mask@12 () T@U)
(declare-fun Mask@10 () T@U)
(declare-fun Mask@9 () T@U)
(declare-fun Heap@1 () T@U)
(declare-fun Heap@2 () T@U)
(declare-fun newVersion@1 () T@U)
(declare-fun Mask@8 () T@U)
(declare-fun Mask@6 () T@U)
(declare-fun Mask@7 () T@U)
(declare-fun Mask@5 () T@U)
(declare-fun Mask@4 () T@U)
(declare-fun Heap@0 () T@U)
(declare-fun newVersion@0 () T@U)
(declare-fun end@@9 () T@U)
(declare-fun Mask@0 () T@U)
(declare-fun Mask@1 () T@U)
(declare-fun Mask@2 () T@U)
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (= (type Mask@28) (MapType1Type RefType realType)) (= (type l1) RefType)) (= (type Heap@@19) (MapType0Type RefType))) (= (type l2) RefType)) (= (type Mask@3) (MapType1Type RefType realType))) (= (type Mask@30) (MapType1Type RefType realType))) (= (type Mask@29) (MapType1Type RefType realType))) (= (type Heap@24) (MapType0Type RefType))) (= (type Heap@22) (MapType0Type RefType))) (= (type end@0) RefType)) (= (type newPMask@2) (MapType1Type RefType boolType))) (= (type Heap@23) (MapType0Type RefType))) (= (type Heap@21) (MapType0Type RefType))) (= (type Heap@20) (MapType0Type RefType))) (= (type Heap@18) (MapType0Type RefType))) (= (type Heap@17) (MapType0Type RefType))) (= (type Heap@19) (MapType0Type RefType))) (= (type freshVersion@2) FrameTypeType)) (= (type Mask@27) (MapType1Type RefType realType))) (forall ((arg0@@47 T@U) (arg1@@25 T@U) ) (! (= (type (CombineFrames arg0@@47 arg1@@25)) FrameTypeType)
 :qid |funType:CombineFrames|
 :pattern ( (CombineFrames arg0@@47 arg1@@25))
))) (forall ((arg0@@48 T@U) ) (! (= (type (FrameFragment arg0@@48)) FrameTypeType)
 :qid |funType:FrameFragment|
 :pattern ( (FrameFragment arg0@@48))
))) (= (type Mask@25) (MapType1Type RefType realType))) (= (type Mask@26) (MapType1Type RefType realType))) (= (type Mask@24) (MapType1Type RefType realType))) (= (type Mask@23) (MapType1Type RefType realType))) (= (type Heap@15) (MapType0Type RefType))) (= (type newPMask@1) (MapType1Type RefType boolType))) (= (type Heap@16) (MapType0Type RefType))) (= (type Heap@14) (MapType0Type RefType))) (= (type Heap@13) (MapType0Type RefType))) (= (type Heap@11) (MapType0Type RefType))) (= (type Heap@10) (MapType0Type RefType))) (= (type Heap@12) (MapType0Type RefType))) (= (type freshVersion@1) FrameTypeType)) (= (type Mask@22) (MapType1Type RefType realType))) (= (type Mask@20) (MapType1Type RefType realType))) (= (type Mask@21) (MapType1Type RefType realType))) (= (type Mask@19) (MapType1Type RefType realType))) (= (type Mask@18) (MapType1Type RefType realType))) (= (type Heap@8) (MapType0Type RefType))) (= (type newPMask@0) (MapType1Type RefType boolType))) (= (type Heap@9) (MapType0Type RefType))) (= (type Heap@7) (MapType0Type RefType))) (= (type Heap@6) (MapType0Type RefType))) (= (type Heap@4) (MapType0Type RefType))) (= (type Heap@3) (MapType0Type RefType))) (= (type Heap@5) (MapType0Type RefType))) (= (type freshVersion@0) FrameTypeType)) (= (type Mask@17) (MapType1Type RefType realType))) (= (type Mask@15) (MapType1Type RefType realType))) (= (type Mask@16) (MapType1Type RefType realType))) (= (type Mask@14) (MapType1Type RefType realType))) (= (type Mask@13) (MapType1Type RefType realType))) (= (type Mask@12) (MapType1Type RefType realType))) (= (type Mask@11) (MapType1Type RefType realType))) (= (type Mask@10) (MapType1Type RefType realType))) (= (type Mask@9) (MapType1Type RefType realType))) (= (type Heap@2) (MapType0Type RefType))) (= (type Heap@1) (MapType0Type RefType))) (= (type newVersion@1) FrameTypeType)) (= (type Mask@8) (MapType1Type RefType realType))) (= (type Mask@7) (MapType1Type RefType realType))) (= (type Mask@6) (MapType1Type RefType realType))) (= (type Mask@5) (MapType1Type RefType realType))) (= (type Mask@4) (MapType1Type RefType realType))) (= (type Heap@0) (MapType0Type RefType))) (= (type newVersion@0) FrameTypeType)) (= (type end@@9) RefType)) (= (type PostMask@1) (MapType1Type RefType realType))) (= (type PostHeap@0) (MapType0Type RefType))) (= (type PostMask@0) (MapType1Type RefType realType))) (= (type Mask@0) (MapType1Type RefType realType))) (= (type Mask@1) (MapType1Type RefType realType))) (= (type Mask@2) (MapType1Type RefType realType))))
(set-info :boogie-vc-id addAtEnd)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 137) (let ((anon16_correct true))
(let ((anon87_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 126) 123)) anon16_correct)))
(let ((anon87_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 124) (- 0 125)) (<= FullPerm (U_2_real (MapType1Select Mask@3 null (lseg l1 l2))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@3 null (lseg l1 l2)))) (=> (= (ControlFlow 0 124) 123) anon16_correct))))))
(let ((anon12_correct true))
(let ((anon85_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 122) 119)) anon12_correct)))
(let ((anon85_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 120) (- 0 121)) (<= FullPerm (U_2_real (MapType1Select PostMask@1 null (lseg l1 (MapType0Select Heap@@19 l2 next)))))) (=> (<= FullPerm (U_2_real (MapType1Select PostMask@1 null (lseg l1 (MapType0Select Heap@@19 l2 next))))) (=> (= (ControlFlow 0 120) 119) anon12_correct))))))
(let ((anon86_Else_correct  (=> (= (ControlFlow 0 118) (- 0 117)) (HasDirectPerm Mask@3 l2 val))))
(let ((anon82_Else_correct  (=> (and (|Seq#Equal| (elems PostHeap@0 (MapType0Select Heap@@19 l2 next)) (elems Heap@@19 (MapType0Select Heap@@19 l2 next))) (state PostHeap@0 PostMask@1)) (and (=> (= (ControlFlow 0 127) (- 0 128)) (HasDirectPerm Mask@3 l2 next)) (=> (HasDirectPerm Mask@3 l2 next) (and (and (and (and (=> (= (ControlFlow 0 127) 118) anon86_Else_correct) (=> (= (ControlFlow 0 127) 124) anon87_Then_correct)) (=> (= (ControlFlow 0 127) 126) anon87_Else_correct)) (=> (= (ControlFlow 0 127) 120) anon85_Then_correct)) (=> (= (ControlFlow 0 127) 122) anon85_Else_correct)))))))
(let ((anon8_correct true))
(let ((anon83_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 116) 113)) anon8_correct)))
(let ((anon83_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 114) (- 0 115)) (<= FullPerm (U_2_real (MapType1Select Mask@3 null (list (MapType0Select Heap@@19 l2 next)))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@3 null (list (MapType0Select Heap@@19 l2 next))))) (=> (= (ControlFlow 0 114) 113) anon8_correct))))))
(let ((anon80_Else_correct  (and (=> (= (ControlFlow 0 129) (- 0 130)) (HasDirectPerm Mask@3 l2 next)) (=> (HasDirectPerm Mask@3 l2 next) (and (and (=> (= (ControlFlow 0 129) 127) anon82_Else_correct) (=> (= (ControlFlow 0 129) 114) anon83_Then_correct)) (=> (= (ControlFlow 0 129) 116) anon83_Else_correct))))))
(let ((anon4_correct true))
(let ((anon81_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 112) 109)) anon4_correct)))
(let ((anon81_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 110) (- 0 111)) (<= FullPerm (U_2_real (MapType1Select PostMask@1 null (list (MapType0Select Heap@@19 l2 next)))))) (=> (<= FullPerm (U_2_real (MapType1Select PostMask@1 null (list (MapType0Select Heap@@19 l2 next))))) (=> (= (ControlFlow 0 110) 109) anon4_correct))))))
(let ((anon79_Then_correct  (=> (state PostHeap@0 ZeroMask) (and (=> (= (ControlFlow 0 131) (- 0 134)) (HasDirectPerm Mask@3 l2 next)) (=> (HasDirectPerm Mask@3 l2 next) (=> (and (= PostMask@0 (MapType1Store ZeroMask null (lseg l1 (MapType0Select Heap@@19 l2 next)) (real_2_U (+ (U_2_real (MapType1Select ZeroMask null (lseg l1 (MapType0Select Heap@@19 l2 next)))) FullPerm)))) (state PostHeap@0 PostMask@0)) (and (=> (= (ControlFlow 0 131) (- 0 133)) (HasDirectPerm Mask@3 l2 next)) (=> (HasDirectPerm Mask@3 l2 next) (=> (= PostMask@1 (MapType1Store PostMask@0 null (list (MapType0Select Heap@@19 l2 next)) (real_2_U (+ (U_2_real (MapType1Select PostMask@0 null (list (MapType0Select Heap@@19 l2 next)))) FullPerm)))) (=> (and (state PostHeap@0 PostMask@1) (state PostHeap@0 PostMask@1)) (and (=> (= (ControlFlow 0 131) (- 0 132)) (HasDirectPerm Mask@3 l2 next)) (=> (HasDirectPerm Mask@3 l2 next) (and (and (=> (= (ControlFlow 0 131) 129) anon80_Else_correct) (=> (= (ControlFlow 0 131) 110) anon81_Then_correct)) (=> (= (ControlFlow 0 131) 112) anon81_Else_correct))))))))))))))
(let ((anon78_correct  (=> (= Mask@30 (MapType1Store Mask@29 null (list (MapType0Select Heap@@19 l2 next)) (real_2_U (- (U_2_real (MapType1Select Mask@29 null (list (MapType0Select Heap@@19 l2 next)))) FullPerm)))) (and (=> (= (ControlFlow 0 10) (- 0 11)) (|Seq#Equal| (elems Heap@24 (MapType0Select Heap@@19 l2 next)) (elems Heap@@19 (MapType0Select Heap@@19 l2 next)))) (=> (|Seq#Equal| (elems Heap@24 (MapType0Select Heap@@19 l2 next)) (elems Heap@@19 (MapType0Select Heap@@19 l2 next))) (=> (= (ControlFlow 0 10) (- 0 9)) (|Seq#Equal| (lsegelems Heap@24 l1 (MapType0Select Heap@@19 l2 next)) (|Seq#Append| (lsegelems Heap@@19 l1 l2) (|Seq#Singleton| (MapType0Select Heap@@19 l2 val))))))))))
(let ((anon117_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 14) 10)) anon78_correct)))
(let ((anon117_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 12) (- 0 13)) (<= FullPerm (U_2_real (MapType1Select Mask@29 null (list (MapType0Select Heap@@19 l2 next)))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@29 null (list (MapType0Select Heap@@19 l2 next))))) (=> (= (ControlFlow 0 12) 10) anon78_correct))))))
(let ((anon76_correct  (=> (= Mask@29 (MapType1Store Mask@28 null (lseg l1 (MapType0Select Heap@@19 l2 next)) (real_2_U (- (U_2_real (MapType1Select Mask@28 null (lseg l1 (MapType0Select Heap@@19 l2 next)))) FullPerm)))) (and (=> (= (ControlFlow 0 15) 12) anon117_Then_correct) (=> (= (ControlFlow 0 15) 14) anon117_Else_correct)))))
(let ((anon116_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 18) 15)) anon76_correct)))
(let ((anon116_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 16) (- 0 17)) (<= FullPerm (U_2_real (MapType1Select Mask@28 null (lseg l1 (MapType0Select Heap@@19 l2 next)))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@28 null (lseg l1 (MapType0Select Heap@@19 l2 next))))) (=> (= (ControlFlow 0 16) 15) anon76_correct))))))
(let ((anon114_Else_correct  (and (=> (= (ControlFlow 0 19) (- 0 21)) (HasDirectPerm Mask@3 l2 val)) (=> (HasDirectPerm Mask@3 l2 val) (and (=> (= (ControlFlow 0 19) (- 0 20)) (|Seq#Equal| (lsegelems Heap@24 l1 (MapType0Select Heap@@19 l2 next)) (|Seq#Append| (lsegelems Heap@@19 l1 l2) (|Seq#Singleton| (MapType0Select Heap@@19 l2 val))))) (=> (|Seq#Equal| (lsegelems Heap@24 l1 (MapType0Select Heap@@19 l2 next)) (|Seq#Append| (lsegelems Heap@@19 l1 l2) (|Seq#Singleton| (MapType0Select Heap@@19 l2 val)))) (=> (state Heap@24 Mask@28) (and (=> (= (ControlFlow 0 19) 16) anon116_Then_correct) (=> (= (ControlFlow 0 19) 18) anon116_Else_correct)))))))))
(let ((anon73_correct true))
(let ((anon115_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 8) 5)) anon73_correct)))
(let ((anon115_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 6) (- 0 7)) (<= FullPerm (U_2_real (MapType1Select Mask@3 null (lseg l1 l2))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@3 null (lseg l1 l2)))) (=> (= (ControlFlow 0 6) 5) anon73_correct))))))
(let ((anon69_correct true))
(let ((anon113_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 4) 1)) anon69_correct)))
(let ((anon113_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 2) (- 0 3)) (<= FullPerm (U_2_real (MapType1Select Mask@28 null (lseg l1 (MapType0Select Heap@@19 l2 next)))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@28 null (lseg l1 (MapType0Select Heap@@19 l2 next))))) (=> (= (ControlFlow 0 2) 1) anon69_correct))))))
(let ((anon66_correct  (=> (and (state Heap@24 Mask@28) (state Heap@24 Mask@28)) (and (=> (= (ControlFlow 0 22) (- 0 23)) (HasDirectPerm Mask@3 l2 next)) (=> (HasDirectPerm Mask@3 l2 next) (and (and (and (and (=> (= (ControlFlow 0 22) 19) anon114_Else_correct) (=> (= (ControlFlow 0 22) 6) anon115_Then_correct)) (=> (= (ControlFlow 0 22) 8) anon115_Else_correct)) (=> (= (ControlFlow 0 22) 2) anon113_Then_correct)) (=> (= (ControlFlow 0 22) 4) anon113_Else_correct)))))))
(let ((anon111_Else_correct  (=> (= (MapType0Select Heap@22 end@0 next) null) (=> (and (= Heap@24 Heap@22) (= (ControlFlow 0 25) 22)) anon66_correct))))
(let ((anon111_Then_correct  (=> (not (= (MapType0Select Heap@22 end@0 next) null)) (=> (and (and (forall ((o_7 T@U) (f_11 T@U) ) (! (let ((B@@11 (FieldTypeInv1 (type f_11))))
(let ((A@@12 (FieldTypeInv0 (type f_11))))
 (=> (and (and (= (type o_7) RefType) (= (type f_11) (FieldType A@@12 B@@11))) (or (U_2_bool (MapType1Select (MapType0Select Heap@22 null (|list#sm| end@0)) o_7 f_11)) (U_2_bool (MapType1Select (MapType0Select Heap@22 null (|list#sm| (MapType0Select Heap@22 end@0 next))) o_7 f_11)))) (U_2_bool (MapType1Select newPMask@2 o_7 f_11)))))
 :qid |stdinbpl.1366:29|
 :skolemid |82|
 :pattern ( (MapType1Select newPMask@2 o_7 f_11))
)) (= Heap@23 (MapType0Store Heap@22 null (|list#sm| end@0) newPMask@2))) (and (= Heap@24 Heap@23) (= (ControlFlow 0 24) 22))) anon66_correct))))
(let ((anon64_correct  (=> (and (= Heap@21 (MapType0Store Heap@20 null (|list#sm| end@0) (MapType1Store (MapType0Select Heap@20 null (|list#sm| end@0)) end@0 val (bool_2_U true)))) (= Heap@22 (MapType0Store Heap@21 null (|list#sm| end@0) (MapType1Store (MapType0Select Heap@21 null (|list#sm| end@0)) end@0 next (bool_2_U true))))) (and (=> (= (ControlFlow 0 26) 24) anon111_Then_correct) (=> (= (ControlFlow 0 26) 25) anon111_Else_correct)))))
(let ((anon110_Else_correct  (=> (HasDirectPerm Mask@28 null (list end@0)) (=> (and (= Heap@20 Heap@17) (= (ControlFlow 0 28) 26)) anon64_correct))))
(let ((anon110_Then_correct  (=> (not (HasDirectPerm Mask@28 null (list end@0))) (=> (and (and (= Heap@18 (MapType0Store Heap@17 null (|list#sm| end@0) ZeroPMask)) (= Heap@19 (MapType0Store Heap@18 null (list end@0) freshVersion@2))) (and (= Heap@20 Heap@19) (= (ControlFlow 0 27) 26))) anon64_correct))))
(let ((anon62_correct  (=> (= Mask@28 (MapType1Store Mask@27 null (list end@0) (real_2_U (+ (U_2_real (MapType1Select Mask@27 null (list end@0))) FullPerm)))) (=> (and (and (state Heap@17 Mask@28) (state Heap@17 Mask@28)) (and (|list#trigger| Heap@17 (list end@0)) (= (MapType0Select Heap@17 null (list end@0)) (CombineFrames (FrameFragment (MapType0Select Heap@17 end@0 val)) (CombineFrames (FrameFragment (MapType0Select Heap@17 end@0 next)) (FrameFragment (ite (not (= (MapType0Select Heap@17 end@0 next) null)) (MapType0Select Heap@17 null (list (MapType0Select Heap@17 end@0 next))) EmptyFrame))))))) (and (=> (= (ControlFlow 0 29) 27) anon110_Then_correct) (=> (= (ControlFlow 0 29) 28) anon110_Else_correct))))))
(let ((anon61_correct  (=> (and (and (= Mask@26 (MapType1Store Mask@25 null (list (MapType0Select Heap@17 end@0 next)) (real_2_U (- (U_2_real (MapType1Select Mask@25 null (list (MapType0Select Heap@17 end@0 next)))) FullPerm)))) (InsidePredicate (list end@0) (MapType0Select Heap@17 null (list end@0)) (list (MapType0Select Heap@17 end@0 next)) (MapType0Select Heap@17 null (list (MapType0Select Heap@17 end@0 next))))) (and (= Mask@27 Mask@26) (= (ControlFlow 0 31) 29))) anon62_correct)))
(let ((anon109_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 34) 31)) anon61_correct)))
(let ((anon109_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 32) (- 0 33)) (<= FullPerm (U_2_real (MapType1Select Mask@25 null (list (MapType0Select Heap@17 end@0 next)))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@25 null (list (MapType0Select Heap@17 end@0 next))))) (=> (= (ControlFlow 0 32) 31) anon61_correct))))))
(let ((anon108_Then_correct  (=> (not (= (MapType0Select Heap@17 end@0 next) null)) (and (=> (= (ControlFlow 0 35) 32) anon109_Then_correct) (=> (= (ControlFlow 0 35) 34) anon109_Else_correct)))))
(let ((anon108_Else_correct  (=> (= (MapType0Select Heap@17 end@0 next) null) (=> (and (= Mask@27 Mask@25) (= (ControlFlow 0 30) 29)) anon62_correct))))
(let ((anon58_correct  (=> (= Mask@25 (MapType1Store Mask@24 end@0 next (real_2_U (- (U_2_real (MapType1Select Mask@24 end@0 next)) FullPerm)))) (and (=> (= (ControlFlow 0 36) 35) anon108_Then_correct) (=> (= (ControlFlow 0 36) 30) anon108_Else_correct)))))
(let ((anon107_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 39) 36)) anon58_correct)))
(let ((anon107_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 37) (- 0 38)) (<= FullPerm (U_2_real (MapType1Select Mask@24 end@0 next)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@24 end@0 next))) (=> (= (ControlFlow 0 37) 36) anon58_correct))))))
(let ((anon56_correct  (=> (= Mask@24 (MapType1Store Mask@23 end@0 val (real_2_U (- (U_2_real (MapType1Select Mask@23 end@0 val)) FullPerm)))) (and (=> (= (ControlFlow 0 40) 37) anon107_Then_correct) (=> (= (ControlFlow 0 40) 39) anon107_Else_correct)))))
(let ((anon106_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 43) 40)) anon56_correct)))
(let ((anon106_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 41) (- 0 42)) (<= FullPerm (U_2_real (MapType1Select Mask@23 end@0 val)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@23 end@0 val))) (=> (= (ControlFlow 0 41) 40) anon56_correct))))))
(let ((anon54_correct  (=> (and (state Heap@17 Mask@23) (state Heap@17 Mask@23)) (and (=> (= (ControlFlow 0 44) 41) anon106_Then_correct) (=> (= (ControlFlow 0 44) 43) anon106_Else_correct)))))
(let ((anon105_Else_correct  (=> (= (MapType0Select Heap@15 l1 next) end@0) (=> (and (= Heap@17 Heap@15) (= (ControlFlow 0 46) 44)) anon54_correct))))
(let ((anon105_Then_correct  (=> (not (= (MapType0Select Heap@15 l1 next) end@0)) (=> (and (and (forall ((o_6 T@U) (f_10 T@U) ) (! (let ((B@@12 (FieldTypeInv1 (type f_10))))
(let ((A@@13 (FieldTypeInv0 (type f_10))))
 (=> (and (and (= (type o_6) RefType) (= (type f_10) (FieldType A@@13 B@@12))) (or (U_2_bool (MapType1Select (MapType0Select Heap@15 null (|lseg#sm| l1 end@0)) o_6 f_10)) (U_2_bool (MapType1Select (MapType0Select Heap@15 null (|lseg#sm| (MapType0Select Heap@15 l1 next) end@0)) o_6 f_10)))) (U_2_bool (MapType1Select newPMask@1 o_6 f_10)))))
 :qid |stdinbpl.1316:29|
 :skolemid |81|
 :pattern ( (MapType1Select newPMask@1 o_6 f_10))
)) (= Heap@16 (MapType0Store Heap@15 null (|lseg#sm| l1 end@0) newPMask@1))) (and (= Heap@17 Heap@16) (= (ControlFlow 0 45) 44))) anon54_correct))))
(let ((anon52_correct  (=> (and (= Heap@14 (MapType0Store Heap@13 null (|lseg#sm| l1 end@0) (MapType1Store (MapType0Select Heap@13 null (|lseg#sm| l1 end@0)) l1 val (bool_2_U true)))) (= Heap@15 (MapType0Store Heap@14 null (|lseg#sm| l1 end@0) (MapType1Store (MapType0Select Heap@14 null (|lseg#sm| l1 end@0)) l1 next (bool_2_U true))))) (and (=> (= (ControlFlow 0 47) 45) anon105_Then_correct) (=> (= (ControlFlow 0 47) 46) anon105_Else_correct)))))
(let ((anon104_Else_correct  (=> (HasDirectPerm Mask@23 null (lseg l1 end@0)) (=> (and (= Heap@13 Heap@10) (= (ControlFlow 0 49) 47)) anon52_correct))))
(let ((anon104_Then_correct  (=> (not (HasDirectPerm Mask@23 null (lseg l1 end@0))) (=> (and (and (= Heap@11 (MapType0Store Heap@10 null (|lseg#sm| l1 end@0) ZeroPMask)) (= Heap@12 (MapType0Store Heap@11 null (lseg l1 end@0) freshVersion@1))) (and (= Heap@13 Heap@12) (= (ControlFlow 0 48) 47))) anon52_correct))))
(let ((anon50_correct  (=> (= Mask@23 (MapType1Store Mask@22 null (lseg l1 end@0) (real_2_U (+ (U_2_real (MapType1Select Mask@22 null (lseg l1 end@0))) FullPerm)))) (=> (and (and (state Heap@10 Mask@23) (state Heap@10 Mask@23)) (and (|lseg#trigger| Heap@10 (lseg l1 end@0)) (= (MapType0Select Heap@10 null (lseg l1 end@0)) (CombineFrames (FrameFragment (MapType0Select Heap@10 l1 val)) (CombineFrames (FrameFragment (MapType0Select Heap@10 l1 next)) (FrameFragment (ite (not (= (MapType0Select Heap@10 l1 next) end@0)) (MapType0Select Heap@10 null (lseg (MapType0Select Heap@10 l1 next) end@0)) EmptyFrame))))))) (and (=> (= (ControlFlow 0 50) 48) anon104_Then_correct) (=> (= (ControlFlow 0 50) 49) anon104_Else_correct))))))
(let ((anon49_correct  (=> (and (and (= Mask@21 (MapType1Store Mask@20 null (lseg (MapType0Select Heap@10 l1 next) end@0) (real_2_U (- (U_2_real (MapType1Select Mask@20 null (lseg (MapType0Select Heap@10 l1 next) end@0))) FullPerm)))) (InsidePredicate (lseg l1 end@0) (MapType0Select Heap@10 null (lseg l1 end@0)) (lseg (MapType0Select Heap@10 l1 next) end@0) (MapType0Select Heap@10 null (lseg (MapType0Select Heap@10 l1 next) end@0)))) (and (= Mask@22 Mask@21) (= (ControlFlow 0 52) 50))) anon50_correct)))
(let ((anon103_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 55) 52)) anon49_correct)))
(let ((anon103_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 53) (- 0 54)) (<= FullPerm (U_2_real (MapType1Select Mask@20 null (lseg (MapType0Select Heap@10 l1 next) end@0))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@20 null (lseg (MapType0Select Heap@10 l1 next) end@0)))) (=> (= (ControlFlow 0 53) 52) anon49_correct))))))
(let ((anon102_Then_correct  (=> (not (= (MapType0Select Heap@10 l1 next) end@0)) (and (=> (= (ControlFlow 0 56) 53) anon103_Then_correct) (=> (= (ControlFlow 0 56) 55) anon103_Else_correct)))))
(let ((anon102_Else_correct  (=> (= (MapType0Select Heap@10 l1 next) end@0) (=> (and (= Mask@22 Mask@20) (= (ControlFlow 0 51) 50)) anon50_correct))))
(let ((anon46_correct  (=> (= Mask@20 (MapType1Store Mask@19 l1 next (real_2_U (- (U_2_real (MapType1Select Mask@19 l1 next)) FullPerm)))) (and (=> (= (ControlFlow 0 57) 56) anon102_Then_correct) (=> (= (ControlFlow 0 57) 51) anon102_Else_correct)))))
(let ((anon101_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 60) 57)) anon46_correct)))
(let ((anon101_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 58) (- 0 59)) (<= FullPerm (U_2_real (MapType1Select Mask@19 l1 next)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@19 l1 next))) (=> (= (ControlFlow 0 58) 57) anon46_correct))))))
(let ((anon44_correct  (=> (= Mask@19 (MapType1Store Mask@18 l1 val (real_2_U (- (U_2_real (MapType1Select Mask@18 l1 val)) FullPerm)))) (and (=> (= (ControlFlow 0 61) 58) anon101_Then_correct) (=> (= (ControlFlow 0 61) 60) anon101_Else_correct)))))
(let ((anon100_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 64) 61)) anon44_correct)))
(let ((anon100_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 62) (- 0 63)) (<= FullPerm (U_2_real (MapType1Select Mask@18 l1 val)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@18 l1 val))) (=> (= (ControlFlow 0 62) 61) anon44_correct))))))
(let ((anon42_correct  (=> (and (state Heap@10 Mask@18) (state Heap@10 Mask@18)) (and (=> (= (ControlFlow 0 65) 62) anon100_Then_correct) (=> (= (ControlFlow 0 65) 64) anon100_Else_correct)))))
(let ((anon99_Else_correct  (=> (= (MapType0Select Heap@8 l2 next) end@0) (=> (and (= Heap@10 Heap@8) (= (ControlFlow 0 67) 65)) anon42_correct))))
(let ((anon99_Then_correct  (=> (not (= (MapType0Select Heap@8 l2 next) end@0)) (=> (and (and (forall ((o_5 T@U) (f_9 T@U) ) (! (let ((B@@13 (FieldTypeInv1 (type f_9))))
(let ((A@@14 (FieldTypeInv0 (type f_9))))
 (=> (and (and (= (type o_5) RefType) (= (type f_9) (FieldType A@@14 B@@13))) (or (U_2_bool (MapType1Select (MapType0Select Heap@8 null (|lseg#sm| l2 end@0)) o_5 f_9)) (U_2_bool (MapType1Select (MapType0Select Heap@8 null (|lseg#sm| (MapType0Select Heap@8 l2 next) end@0)) o_5 f_9)))) (U_2_bool (MapType1Select newPMask@0 o_5 f_9)))))
 :qid |stdinbpl.1266:29|
 :skolemid |80|
 :pattern ( (MapType1Select newPMask@0 o_5 f_9))
)) (= Heap@9 (MapType0Store Heap@8 null (|lseg#sm| l2 end@0) newPMask@0))) (and (= Heap@10 Heap@9) (= (ControlFlow 0 66) 65))) anon42_correct))))
(let ((anon40_correct  (=> (and (= Heap@7 (MapType0Store Heap@6 null (|lseg#sm| l2 end@0) (MapType1Store (MapType0Select Heap@6 null (|lseg#sm| l2 end@0)) l2 val (bool_2_U true)))) (= Heap@8 (MapType0Store Heap@7 null (|lseg#sm| l2 end@0) (MapType1Store (MapType0Select Heap@7 null (|lseg#sm| l2 end@0)) l2 next (bool_2_U true))))) (and (=> (= (ControlFlow 0 68) 66) anon99_Then_correct) (=> (= (ControlFlow 0 68) 67) anon99_Else_correct)))))
(let ((anon98_Else_correct  (=> (HasDirectPerm Mask@18 null (lseg l2 end@0)) (=> (and (= Heap@6 Heap@3) (= (ControlFlow 0 70) 68)) anon40_correct))))
(let ((anon98_Then_correct  (=> (not (HasDirectPerm Mask@18 null (lseg l2 end@0))) (=> (and (and (= Heap@4 (MapType0Store Heap@3 null (|lseg#sm| l2 end@0) ZeroPMask)) (= Heap@5 (MapType0Store Heap@4 null (lseg l2 end@0) freshVersion@0))) (and (= Heap@6 Heap@5) (= (ControlFlow 0 69) 68))) anon40_correct))))
(let ((anon38_correct  (=> (= Mask@18 (MapType1Store Mask@17 null (lseg l2 end@0) (real_2_U (+ (U_2_real (MapType1Select Mask@17 null (lseg l2 end@0))) FullPerm)))) (=> (and (and (state Heap@3 Mask@18) (state Heap@3 Mask@18)) (and (|lseg#trigger| Heap@3 (lseg l2 end@0)) (= (MapType0Select Heap@3 null (lseg l2 end@0)) (CombineFrames (FrameFragment (MapType0Select Heap@3 l2 val)) (CombineFrames (FrameFragment (MapType0Select Heap@3 l2 next)) (FrameFragment (ite (not (= (MapType0Select Heap@3 l2 next) end@0)) (MapType0Select Heap@3 null (lseg (MapType0Select Heap@3 l2 next) end@0)) EmptyFrame))))))) (and (=> (= (ControlFlow 0 71) 69) anon98_Then_correct) (=> (= (ControlFlow 0 71) 70) anon98_Else_correct))))))
(let ((anon37_correct  (=> (and (and (= Mask@16 (MapType1Store Mask@15 null (lseg (MapType0Select Heap@3 l2 next) end@0) (real_2_U (- (U_2_real (MapType1Select Mask@15 null (lseg (MapType0Select Heap@3 l2 next) end@0))) FullPerm)))) (InsidePredicate (lseg l2 end@0) (MapType0Select Heap@3 null (lseg l2 end@0)) (lseg (MapType0Select Heap@3 l2 next) end@0) (MapType0Select Heap@3 null (lseg (MapType0Select Heap@3 l2 next) end@0)))) (and (= Mask@17 Mask@16) (= (ControlFlow 0 73) 71))) anon38_correct)))
(let ((anon97_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 76) 73)) anon37_correct)))
(let ((anon97_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 74) (- 0 75)) (<= FullPerm (U_2_real (MapType1Select Mask@15 null (lseg (MapType0Select Heap@3 l2 next) end@0))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@15 null (lseg (MapType0Select Heap@3 l2 next) end@0)))) (=> (= (ControlFlow 0 74) 73) anon37_correct))))))
(let ((anon96_Then_correct  (=> (not (= (MapType0Select Heap@3 l2 next) end@0)) (and (=> (= (ControlFlow 0 77) 74) anon97_Then_correct) (=> (= (ControlFlow 0 77) 76) anon97_Else_correct)))))
(let ((anon96_Else_correct  (=> (= (MapType0Select Heap@3 l2 next) end@0) (=> (and (= Mask@17 Mask@15) (= (ControlFlow 0 72) 71)) anon38_correct))))
(let ((anon34_correct  (=> (= Mask@15 (MapType1Store Mask@14 l2 next (real_2_U (- (U_2_real (MapType1Select Mask@14 l2 next)) FullPerm)))) (and (=> (= (ControlFlow 0 78) 77) anon96_Then_correct) (=> (= (ControlFlow 0 78) 72) anon96_Else_correct)))))
(let ((anon95_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 81) 78)) anon34_correct)))
(let ((anon95_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 79) (- 0 80)) (<= FullPerm (U_2_real (MapType1Select Mask@14 l2 next)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@14 l2 next))) (=> (= (ControlFlow 0 79) 78) anon34_correct))))))
(let ((anon32_correct  (=> (= Mask@14 (MapType1Store Mask@13 l2 val (real_2_U (- (U_2_real (MapType1Select Mask@13 l2 val)) FullPerm)))) (and (=> (= (ControlFlow 0 82) 79) anon95_Then_correct) (=> (= (ControlFlow 0 82) 81) anon95_Else_correct)))))
(let ((anon94_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 85) 82)) anon32_correct)))
(let ((anon94_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 83) (- 0 84)) (<= FullPerm (U_2_real (MapType1Select Mask@13 l2 val)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@13 l2 val))) (=> (= (ControlFlow 0 83) 82) anon32_correct))))))
(let ((anon30_correct  (=> (and (state Heap@3 Mask@13) (state Heap@3 Mask@13)) (and (=> (= (ControlFlow 0 86) (- 0 87)) (HasDirectPerm Mask@13 l1 next)) (=> (HasDirectPerm Mask@13 l1 next) (=> (= (MapType0Select Heap@3 l1 next) l2) (=> (and (state Heap@3 Mask@13) (state Heap@3 Mask@13)) (and (=> (= (ControlFlow 0 86) 83) anon94_Then_correct) (=> (= (ControlFlow 0 86) 85) anon94_Else_correct)))))))))
(let ((anon93_Else_correct  (=> (= (MapType0Select Heap@3 end@0 next) null) (=> (and (= Mask@13 Mask@11) (= (ControlFlow 0 89) 86)) anon30_correct))))
(let ((anon93_Then_correct  (=> (and (not (= (MapType0Select Heap@3 end@0 next) null)) (= Mask@12 (MapType1Store Mask@11 null (list (MapType0Select Heap@3 end@0 next)) (real_2_U (+ (U_2_real (MapType1Select Mask@11 null (list (MapType0Select Heap@3 end@0 next)))) FullPerm))))) (=> (and (and (InsidePredicate (list end@0) (MapType0Select Heap@3 null (list end@0)) (list (MapType0Select Heap@3 end@0 next)) (MapType0Select Heap@3 null (list (MapType0Select Heap@3 end@0 next)))) (state Heap@3 Mask@12)) (and (= Mask@13 Mask@12) (= (ControlFlow 0 88) 86))) anon30_correct))))
(let ((anon28_correct  (=> (and (not (= end@0 null)) (= Mask@10 (MapType1Store Mask@9 end@0 val (real_2_U (+ (U_2_real (MapType1Select Mask@9 end@0 val)) FullPerm))))) (=> (and (and (state Heap@3 Mask@10) (not (= end@0 null))) (and (= Mask@11 (MapType1Store Mask@10 end@0 next (real_2_U (+ (U_2_real (MapType1Select Mask@10 end@0 next)) FullPerm)))) (state Heap@3 Mask@11))) (and (=> (= (ControlFlow 0 90) 88) anon93_Then_correct) (=> (= (ControlFlow 0 90) 89) anon93_Else_correct))))))
(let ((anon92_Else_correct  (=> (HasDirectPerm Mask@9 null (list end@0)) (=> (and (= Heap@3 Heap@1) (= (ControlFlow 0 92) 90)) anon28_correct))))
(let ((anon92_Then_correct  (=> (and (and (not (HasDirectPerm Mask@9 null (list end@0))) (= Heap@2 (MapType0Store Heap@1 null (list end@0) newVersion@1))) (and (= Heap@3 Heap@2) (= (ControlFlow 0 91) 90))) anon28_correct)))
(let ((anon26_correct  (=> (= Mask@9 (MapType1Store Mask@8 null (list end@0) (real_2_U (- (U_2_real (MapType1Select Mask@8 null (list end@0))) FullPerm)))) (and (=> (= (ControlFlow 0 93) 91) anon92_Then_correct) (=> (= (ControlFlow 0 93) 92) anon92_Else_correct)))))
(let ((anon91_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 96) 93)) anon26_correct)))
(let ((anon91_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 94) (- 0 95)) (<= FullPerm (U_2_real (MapType1Select Mask@8 null (list end@0))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@8 null (list end@0)))) (=> (= (ControlFlow 0 94) 93) anon26_correct))))))
(let ((anon24_correct  (=> (and (state Heap@1 Mask@8) (state Heap@1 Mask@8)) (and (=> (= (ControlFlow 0 97) (- 0 98)) (HasDirectPerm Mask@8 l2 next)) (=> (HasDirectPerm Mask@8 l2 next) (=> (and (and (= end@0 (MapType0Select Heap@1 l2 next)) (state Heap@1 Mask@8)) (and (|list#trigger| Heap@1 (list end@0)) (= (MapType0Select Heap@1 null (list end@0)) (CombineFrames (FrameFragment (MapType0Select Heap@1 end@0 val)) (CombineFrames (FrameFragment (MapType0Select Heap@1 end@0 next)) (FrameFragment (ite (not (= (MapType0Select Heap@1 end@0 next) null)) (MapType0Select Heap@1 null (list (MapType0Select Heap@1 end@0 next))) EmptyFrame))))))) (and (=> (= (ControlFlow 0 97) 94) anon91_Then_correct) (=> (= (ControlFlow 0 97) 96) anon91_Else_correct))))))))
(let ((anon90_Else_correct  (=> (= (MapType0Select Heap@1 l1 next) l2) (=> (and (= Mask@8 Mask@6) (= (ControlFlow 0 100) 97)) anon24_correct))))
(let ((anon90_Then_correct  (=> (and (not (= (MapType0Select Heap@1 l1 next) l2)) (= Mask@7 (MapType1Store Mask@6 null (lseg (MapType0Select Heap@1 l1 next) l2) (real_2_U (+ (U_2_real (MapType1Select Mask@6 null (lseg (MapType0Select Heap@1 l1 next) l2))) FullPerm))))) (=> (and (and (InsidePredicate (lseg l1 l2) (MapType0Select Heap@1 null (lseg l1 l2)) (lseg (MapType0Select Heap@1 l1 next) l2) (MapType0Select Heap@1 null (lseg (MapType0Select Heap@1 l1 next) l2))) (state Heap@1 Mask@7)) (and (= Mask@8 Mask@7) (= (ControlFlow 0 99) 97))) anon24_correct))))
(let ((anon22_correct  (=> (and (not (= l1 null)) (= Mask@5 (MapType1Store Mask@4 l1 val (real_2_U (+ (U_2_real (MapType1Select Mask@4 l1 val)) FullPerm))))) (=> (and (and (state Heap@1 Mask@5) (not (= l1 null))) (and (= Mask@6 (MapType1Store Mask@5 l1 next (real_2_U (+ (U_2_real (MapType1Select Mask@5 l1 next)) FullPerm)))) (state Heap@1 Mask@6))) (and (=> (= (ControlFlow 0 101) 99) anon90_Then_correct) (=> (= (ControlFlow 0 101) 100) anon90_Else_correct))))))
(let ((anon89_Else_correct  (=> (HasDirectPerm Mask@4 null (lseg l1 l2)) (=> (and (= Heap@1 Heap@@19) (= (ControlFlow 0 103) 101)) anon22_correct))))
(let ((anon89_Then_correct  (=> (and (and (not (HasDirectPerm Mask@4 null (lseg l1 l2))) (= Heap@0 (MapType0Store Heap@@19 null (lseg l1 l2) newVersion@0))) (and (= Heap@1 Heap@0) (= (ControlFlow 0 102) 101))) anon22_correct)))
(let ((anon20_correct  (=> (= Mask@4 (MapType1Store Mask@3 null (lseg l1 l2) (real_2_U (- (U_2_real (MapType1Select Mask@3 null (lseg l1 l2))) FullPerm)))) (and (=> (= (ControlFlow 0 104) 102) anon89_Then_correct) (=> (= (ControlFlow 0 104) 103) anon89_Else_correct)))))
(let ((anon88_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 107) 104)) anon20_correct)))
(let ((anon88_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 105) (- 0 106)) (<= FullPerm (U_2_real (MapType1Select Mask@3 null (lseg l1 l2))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@3 null (lseg l1 l2)))) (=> (= (ControlFlow 0 105) 104) anon20_correct))))))
(let ((anon79_Else_correct  (=> (U_2_bool (MapType0Select Heap@@19 end@@9 $allocated)) (=> (and (|lseg#trigger| Heap@@19 (lseg l1 l2)) (= (MapType0Select Heap@@19 null (lseg l1 l2)) (CombineFrames (FrameFragment (MapType0Select Heap@@19 l1 val)) (CombineFrames (FrameFragment (MapType0Select Heap@@19 l1 next)) (FrameFragment (ite (not (= (MapType0Select Heap@@19 l1 next) l2)) (MapType0Select Heap@@19 null (lseg (MapType0Select Heap@@19 l1 next) l2)) EmptyFrame)))))) (and (=> (= (ControlFlow 0 108) 105) anon88_Then_correct) (=> (= (ControlFlow 0 108) 107) anon88_Else_correct))))))
(let ((anon0_correct  (=> (and (and (state Heap@@19 ZeroMask) (= AssumeFunctionsAbove (- 0 1))) (and (U_2_bool (MapType0Select Heap@@19 l1 $allocated)) (U_2_bool (MapType0Select Heap@@19 l2 $allocated)))) (=> (and (and (and (= Mask@0 (MapType1Store ZeroMask null (lseg l1 l2) (real_2_U (+ (U_2_real (MapType1Select ZeroMask null (lseg l1 l2))) FullPerm)))) (state Heap@@19 Mask@0)) (and (not (= l2 null)) (= Mask@1 (MapType1Store Mask@0 l2 val (real_2_U (+ (U_2_real (MapType1Select Mask@0 l2 val)) FullPerm)))))) (and (and (state Heap@@19 Mask@1) (not (= l2 null))) (and (= Mask@2 (MapType1Store Mask@1 l2 next (real_2_U (+ (U_2_real (MapType1Select Mask@1 l2 next)) FullPerm)))) (state Heap@@19 Mask@2)))) (and (=> (= (ControlFlow 0 135) (- 0 136)) (HasDirectPerm Mask@2 l2 next)) (=> (HasDirectPerm Mask@2 l2 next) (=> (= Mask@3 (MapType1Store Mask@2 null (list (MapType0Select Heap@@19 l2 next)) (real_2_U (+ (U_2_real (MapType1Select Mask@2 null (list (MapType0Select Heap@@19 l2 next)))) FullPerm)))) (=> (and (state Heap@@19 Mask@3) (state Heap@@19 Mask@3)) (and (=> (= (ControlFlow 0 135) 131) anon79_Then_correct) (=> (= (ControlFlow 0 135) 108) anon79_Else_correct))))))))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 137) 135) anon0_correct)))
PreconditionGeneratedEntry_correct)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
))
(check-sat)
(pop 1)
; Valid
(get-info :rlimit)
