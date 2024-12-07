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
(declare-fun Heap@1 () T@U)
(declare-fun start@@19 () T@U)
(declare-fun end@@9 () T@U)
(declare-fun Heap@3 () T@U)
(declare-fun newPMask@0 () T@U)
(declare-fun Heap@2 () T@U)
(declare-fun Heap@0 () T@U)
(declare-fun Heap@@19 () T@U)
(declare-fun |lsegelems#trigger| (T@U T@U T@U) Bool)
(declare-fun UnfoldingMask@4 () T@U)
(declare-fun UnfoldingMask@2 () T@U)
(declare-fun UnfoldingMask@3 () T@U)
(declare-fun UnfoldingMask@0 () T@U)
(declare-fun Mask@0 () T@U)
(declare-fun UnfoldingMask@1 () T@U)
(declare-fun CombineFrames (T@U T@U) T@U)
(declare-fun FrameFragment (T@U) T@U)
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (= (type UnfoldingMask@4) (MapType1Type RefType realType)) (= (type Heap@@19) (MapType0Type RefType))) (= (type start@@19) RefType)) (= (type end@@9) RefType)) (= (type Heap@1) (MapType0Type RefType))) (= (type newPMask@0) (MapType1Type RefType boolType))) (= (type Heap@2) (MapType0Type RefType))) (= (type Heap@3) (MapType0Type RefType))) (= (type Heap@0) (MapType0Type RefType))) (= (type UnfoldingMask@3) (MapType1Type RefType realType))) (= (type UnfoldingMask@2) (MapType1Type RefType realType))) (= (type UnfoldingMask@0) (MapType1Type RefType realType))) (= (type Mask@0) (MapType1Type RefType realType))) (= (type UnfoldingMask@1) (MapType1Type RefType realType))) (forall ((arg0@@47 T@U) (arg1@@25 T@U) ) (! (= (type (CombineFrames arg0@@47 arg1@@25)) FrameTypeType)
 :qid |funType:CombineFrames|
 :pattern ( (CombineFrames arg0@@47 arg1@@25))
))) (forall ((arg0@@48 T@U) ) (! (= (type (FrameFragment arg0@@48)) FrameTypeType)
 :qid |funType:FrameFragment|
 :pattern ( (FrameFragment arg0@@48))
))))
(set-info :boogie-vc-id |lsegelems#definedness|)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 24) (let ((anon13_correct true))
(let ((anon19_Else_correct  (=> (= (MapType0Select Heap@1 start@@19 next) end@@9) (=> (and (= Heap@3 Heap@1) (= (ControlFlow 0 7) 5)) anon13_correct))))
(let ((anon19_Then_correct  (=> (not (= (MapType0Select Heap@1 start@@19 next) end@@9)) (=> (and (and (forall ((o_4 T@U) (f_8 T@U) ) (! (let ((B@@11 (FieldTypeInv1 (type f_8))))
(let ((A@@12 (FieldTypeInv0 (type f_8))))
 (=> (and (and (= (type o_4) RefType) (= (type f_8) (FieldType A@@12 B@@11))) (or (U_2_bool (MapType1Select (MapType0Select Heap@1 null (|lseg#sm| start@@19 end@@9)) o_4 f_8)) (U_2_bool (MapType1Select (MapType0Select Heap@1 null (|lseg#sm| (MapType0Select Heap@1 start@@19 next) end@@9)) o_4 f_8)))) (U_2_bool (MapType1Select newPMask@0 o_4 f_8)))))
 :qid |stdinbpl.821:33|
 :skolemid |67|
 :pattern ( (MapType1Select newPMask@0 o_4 f_8))
)) (= Heap@2 (MapType0Store Heap@1 null (|lseg#sm| start@@19 end@@9) newPMask@0))) (and (= Heap@3 Heap@2) (= (ControlFlow 0 6) 5))) anon13_correct))))
(let ((anon11_correct  (=> (and (= Heap@0 (MapType0Store Heap@@19 null (|lseg#sm| start@@19 end@@9) (MapType1Store (MapType0Select Heap@@19 null (|lseg#sm| start@@19 end@@9)) start@@19 val (bool_2_U true)))) (= Heap@1 (MapType0Store Heap@0 null (|lseg#sm| start@@19 end@@9) (MapType1Store (MapType0Select Heap@0 null (|lseg#sm| start@@19 end@@9)) start@@19 next (bool_2_U true))))) (and (=> (= (ControlFlow 0 8) 6) anon19_Then_correct) (=> (= (ControlFlow 0 8) 7) anon19_Else_correct)))))
(let ((anon17_Else_correct  (=> (and (|lsegelems#trigger| (MapType0Select Heap@@19 null (lseg (MapType0Select Heap@@19 start@@19 next) end@@9)) (MapType0Select Heap@@19 start@@19 next) end@@9) (= (ControlFlow 0 11) 8)) anon11_correct)))
(let ((anon16_Then_correct  (=> (= (MapType0Select Heap@@19 start@@19 next) end@@9) (and (=> (= (ControlFlow 0 9) (- 0 10)) (HasDirectPerm UnfoldingMask@4 start@@19 val)) (=> (HasDirectPerm UnfoldingMask@4 start@@19 val) (=> (= (ControlFlow 0 9) 8) anon11_correct))))))
(let ((anon9_correct true))
(let ((anon18_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 4) 1)) anon9_correct)))
(let ((anon18_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 2) (- 0 3)) (<= FullPerm (U_2_real (MapType1Select UnfoldingMask@4 null (lseg (MapType0Select Heap@@19 start@@19 next) end@@9))))) (=> (<= FullPerm (U_2_real (MapType1Select UnfoldingMask@4 null (lseg (MapType0Select Heap@@19 start@@19 next) end@@9)))) (=> (= (ControlFlow 0 2) 1) anon9_correct))))))
(let ((anon16_Else_correct  (=> (not (= (MapType0Select Heap@@19 start@@19 next) end@@9)) (and (=> (= (ControlFlow 0 12) (- 0 14)) (HasDirectPerm UnfoldingMask@4 start@@19 val)) (=> (HasDirectPerm UnfoldingMask@4 start@@19 val) (and (=> (= (ControlFlow 0 12) (- 0 13)) (HasDirectPerm UnfoldingMask@4 start@@19 next)) (=> (HasDirectPerm UnfoldingMask@4 start@@19 next) (and (and (=> (= (ControlFlow 0 12) 11) anon17_Else_correct) (=> (= (ControlFlow 0 12) 2) anon18_Then_correct)) (=> (= (ControlFlow 0 12) 4) anon18_Else_correct)))))))))
(let ((anon4_correct  (=> (state Heap@@19 UnfoldingMask@4) (and (=> (= (ControlFlow 0 15) (- 0 16)) (HasDirectPerm UnfoldingMask@4 start@@19 next)) (=> (HasDirectPerm UnfoldingMask@4 start@@19 next) (and (=> (= (ControlFlow 0 15) 9) anon16_Then_correct) (=> (= (ControlFlow 0 15) 12) anon16_Else_correct)))))))
(let ((anon15_Else_correct  (=> (= (MapType0Select Heap@@19 start@@19 next) end@@9) (=> (and (= UnfoldingMask@4 UnfoldingMask@2) (= (ControlFlow 0 18) 15)) anon4_correct))))
(let ((anon15_Then_correct  (=> (and (not (= (MapType0Select Heap@@19 start@@19 next) end@@9)) (= UnfoldingMask@3 (MapType1Store UnfoldingMask@2 null (lseg (MapType0Select Heap@@19 start@@19 next) end@@9) (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@2 null (lseg (MapType0Select Heap@@19 start@@19 next) end@@9))) FullPerm))))) (=> (and (and (InsidePredicate (lseg start@@19 end@@9) (MapType0Select Heap@@19 null (lseg start@@19 end@@9)) (lseg (MapType0Select Heap@@19 start@@19 next) end@@9) (MapType0Select Heap@@19 null (lseg (MapType0Select Heap@@19 start@@19 next) end@@9))) (state Heap@@19 UnfoldingMask@3)) (and (= UnfoldingMask@4 UnfoldingMask@3) (= (ControlFlow 0 17) 15))) anon4_correct))))
(let ((anon2_correct  (=> (= UnfoldingMask@0 (MapType1Store Mask@0 null (lseg start@@19 end@@9) (real_2_U (- (U_2_real (MapType1Select Mask@0 null (lseg start@@19 end@@9))) FullPerm)))) (=> (and (not (= start@@19 null)) (= UnfoldingMask@1 (MapType1Store UnfoldingMask@0 start@@19 val (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@0 start@@19 val)) FullPerm))))) (=> (and (and (state Heap@@19 UnfoldingMask@1) (not (= start@@19 null))) (and (= UnfoldingMask@2 (MapType1Store UnfoldingMask@1 start@@19 next (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@1 start@@19 next)) FullPerm)))) (state Heap@@19 UnfoldingMask@2))) (and (=> (= (ControlFlow 0 19) 17) anon15_Then_correct) (=> (= (ControlFlow 0 19) 18) anon15_Else_correct)))))))
(let ((anon14_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 22) 19)) anon2_correct)))
(let ((anon14_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 20) (- 0 21)) (<= FullPerm (U_2_real (MapType1Select Mask@0 null (lseg start@@19 end@@9))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@0 null (lseg start@@19 end@@9)))) (=> (= (ControlFlow 0 20) 19) anon2_correct))))))
(let ((anon0_correct  (=> (state Heap@@19 ZeroMask) (=> (and (and (and (U_2_bool (MapType0Select Heap@@19 start@@19 $allocated)) (U_2_bool (MapType0Select Heap@@19 end@@9 $allocated))) (and (= AssumeFunctionsAbove 1) (= Mask@0 (MapType1Store ZeroMask null (lseg start@@19 end@@9) (real_2_U (+ (U_2_real (MapType1Select ZeroMask null (lseg start@@19 end@@9))) FullPerm)))))) (and (and (state Heap@@19 Mask@0) (state Heap@@19 Mask@0)) (and (|lseg#trigger| Heap@@19 (lseg start@@19 end@@9)) (= (MapType0Select Heap@@19 null (lseg start@@19 end@@9)) (CombineFrames (FrameFragment (MapType0Select Heap@@19 start@@19 val)) (CombineFrames (FrameFragment (MapType0Select Heap@@19 start@@19 next)) (FrameFragment (ite (not (= (MapType0Select Heap@@19 start@@19 next) end@@9)) (MapType0Select Heap@@19 null (lseg (MapType0Select Heap@@19 start@@19 next) end@@9)) EmptyFrame)))))))) (and (=> (= (ControlFlow 0 23) 20) anon14_Then_correct) (=> (= (ControlFlow 0 23) 22) anon14_Else_correct))))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 24) 23) anon0_correct)))
PreconditionGeneratedEntry_correct)))))))))))))))))))
))
(check-sat)
(pop 1)
; Valid
(get-info :rlimit)
