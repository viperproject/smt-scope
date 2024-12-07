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
(declare-fun Ref__Integer_value () T@U)
(declare-fun FieldType (T@T T@T) T@T)
(declare-fun FieldTypeInv0 (T@T) T@T)
(declare-fun FieldTypeInv1 (T@T) T@T)
(declare-fun NormalFieldType () T@T)
(declare-fun |Seq#Length| (T@U) Int)
(declare-fun |Seq#Drop| (T@U Int) T@U)
(declare-fun SeqTypeInv0 (T@T) T@T)
(declare-fun SeqType (T@T) T@T)
(declare-fun state (T@U T@U) Bool)
(declare-fun |count_square'| (T@U Int Int Int Int Int Int T@U Int) Int)
(declare-fun MapType0Type (T@T) T@T)
(declare-fun RefType () T@T)
(declare-fun MapType1Type (T@T T@T) T@T)
(declare-fun |count_square#frame| (T@U Int Int Int Int Int Int T@U Int) Int)
(declare-fun FrameFragment (T@U) T@U)
(declare-fun |count_square#condqp3| (T@U Int Int Int Int Int Int T@U Int) Int)
(declare-fun MapType0TypeInv0 (T@T) T@T)
(declare-fun MapType0Select (T@U T@U T@U) T@U)
(declare-fun MapType0Store (T@U T@U T@U T@U) T@U)
(declare-fun MapType1TypeInv0 (T@T) T@T)
(declare-fun MapType1TypeInv1 (T@T) T@T)
(declare-fun MapType1Select (T@U T@U T@U) T@U)
(declare-fun MapType1Store (T@U T@U T@U T@U) T@U)
(declare-fun FrameTypeType () T@T)
(declare-fun succHeap (T@U T@U) Bool)
(declare-fun succHeapTrans (T@U T@U) Bool)
(declare-fun GoodMask (T@U) Bool)
(declare-fun |sum_list'| (T@U Int Int T@U) Int)
(declare-fun dummyFunction (T@U) Bool)
(declare-fun |sum_list#triggerStateless| (Int Int T@U) Int)
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
(declare-fun count_square (T@U Int Int Int Int Int Int T@U Int) Int)
(declare-fun AssumeFunctionsAbove () Int)
(declare-fun |Seq#Update| (T@U Int T@U) T@U)
(declare-fun |Seq#Take| (T@U Int) T@U)
(declare-fun |Seq#Contains| (T@U T@U) Bool)
(declare-fun |Seq#Range| (Int Int) T@U)
(declare-fun |Seq#Skolem| (T@U T@U) Int)
(declare-fun |Seq#Singleton| (T@U) T@U)
(declare-fun |count_square#triggerStateless| (Int Int Int Int Int Int T@U Int) Int)
(declare-fun count_array (T@U Int Int T@U Int) Int)
(declare-fun |count_array'| (T@U Int Int T@U Int) Int)
(declare-fun sum_square (T@U Int Int Int Int Int Int T@U) Int)
(declare-fun |sum_square'| (T@U Int Int Int Int Int Int T@U) Int)
(declare-fun |Seq#Empty| (T@T) T@U)
(declare-fun dummyHeap () T@U)
(declare-fun ZeroMask () T@U)
(declare-fun InsidePredicate (T@U T@U T@U T@U) Bool)
(declare-fun |Seq#Append| (T@U T@U) T@U)
(declare-fun |sum_list#frame| (T@U Int Int T@U) Int)
(declare-fun EmptyFrame () T@U)
(declare-fun sum_array (T@U Int Int Int T@U) Int)
(declare-fun |sum_array'| (T@U Int Int Int T@U) Int)
(declare-fun sumMask (T@U T@U T@U) Bool)
(declare-fun |sum_array#triggerStateless| (Int Int Int T@U) Int)
(declare-fun |count_list'| (T@U Int Int T@U Int) Int)
(declare-fun |count_list#triggerStateless| (Int Int T@U Int) Int)
(declare-fun |count_array#triggerStateless| (Int Int T@U Int) Int)
(declare-fun ConditionalFrame (Real T@U) T@U)
(declare-fun NoPerm () Real)
(declare-fun count_list (T@U Int Int T@U Int) Int)
(declare-fun |sum_square#triggerStateless| (Int Int Int Int Int Int T@U) Int)
(declare-fun |count_list#frame| (T@U Int Int T@U Int) Int)
(declare-fun |sum_square#condqp2| (T@U Int Int Int Int Int Int T@U) Int)
(declare-fun |sk_sum_square#condqp2| (Int Int) Int)
(declare-fun |sk_count_square#condqp3| (Int Int) Int)
(declare-fun |Seq#Equal| (T@U T@U) Bool)
(declare-fun sum_list (T@U Int Int T@U) Int)
(declare-fun |Seq#ContainsTrigger| (T@U T@U) Bool)
(declare-fun FullPerm () Real)
(declare-fun ZeroPMask () T@U)
(declare-fun |sum_square#frame| (T@U Int Int Int Int Int Int T@U) Int)
(declare-fun |Seq#SkolemDiff| (T@U T@U) Int)
(declare-fun |sum_array#frame| (T@U Int Int Int T@U) Int)
(declare-fun |sum_array#condqp1| (T@U Int Int Int T@U) Int)
(declare-fun |count_array#frame| (T@U Int Int T@U Int) Int)
(declare-fun |count_array#condqp4| (T@U Int Int T@U Int) Int)
(declare-fun |sk_count_array#condqp4| (Int Int) Int)
(declare-fun |sk_sum_array#condqp1| (Int Int) Int)
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
))) (= (Ctor NormalFieldType) 7)) (= (type $allocated) (FieldType NormalFieldType boolType))) (= (type Ref__Integer_value) (FieldType NormalFieldType intType))))
(assert (distinct $allocated Ref__Integer_value)
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
 :qid |stdinbpl.387:18|
 :skolemid |38|
 :pattern ( (|Seq#Length| (|Seq#Drop| s n)))
 :pattern ( (|Seq#Length| s) (|Seq#Drop| s n))
)))
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (forall ((arg0@@17 T@T) ) (! (= (Ctor (MapType0Type arg0@@17)) 9)
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
)))) (= (Ctor RefType) 10)) (forall ((arg0@@21 T@T) (arg1@@5 T@T) ) (! (= (Ctor (MapType1Type arg0@@21 arg1@@5)) 11)
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
)))) (= (Ctor FrameTypeType) 12)) (forall ((arg0@@26 T@U) ) (! (= (type (FrameFragment arg0@@26)) FrameTypeType)
 :qid |funType:FrameFragment|
 :pattern ( (FrameFragment arg0@@26))
))))
(assert (forall ((Heap T@U) (Mask T@U) (i Int) (lo Int) (hi Int) (step Int) (vmin Int) (vmax Int) (ar T@U) (v_2 Int) ) (!  (=> (and (and (and (= (type Heap) (MapType0Type RefType)) (= (type Mask) (MapType1Type RefType realType))) (= (type ar) (SeqType RefType))) (state Heap Mask)) (= (|count_square'| Heap i lo hi step vmin vmax ar v_2) (|count_square#frame| (FrameFragment (int_2_U (|count_square#condqp3| Heap i lo hi step vmin vmax ar v_2))) i lo hi step vmin vmax ar v_2)))
 :qid |stdinbpl.1297:15|
 :skolemid |112|
 :pattern ( (state Heap Mask) (|count_square'| Heap i lo hi step vmin vmax ar v_2))
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
(assert (forall ((Heap@@1 T@U) (i@@0 Int) (hi@@0 Int) (ar@@0 T@U) ) (!  (=> (and (= (type Heap@@1) (MapType0Type RefType)) (= (type ar@@0) (SeqType intType))) (dummyFunction (int_2_U (|sum_list#triggerStateless| i@@0 hi@@0 ar@@0))))
 :qid |stdinbpl.672:15|
 :skolemid |59|
 :pattern ( (|sum_list'| Heap@@1 i@@0 hi@@0 ar@@0))
)))
(assert (forall ((arg0@@27 T@U) (arg1@@10 Int) ) (! (let ((T@@1 (SeqTypeInv0 (type arg0@@27))))
(= (type (|Seq#Index| arg0@@27 arg1@@10)) T@@1))
 :qid |funType:Seq#Index|
 :pattern ( (|Seq#Index| arg0@@27 arg1@@10))
)))
(assert (forall ((s@@0 T@U) (n@@0 Int) (j Int) ) (! (let ((T@@2 (SeqTypeInv0 (type s@@0))))
 (=> (= (type s@@0) (SeqType T@@2)) (=> (and (and (< 0 n@@0) (<= 0 j)) (< j (- (|Seq#Length| s@@0) n@@0))) (and (= (|Seq#Sub| (|Seq#Add| j n@@0) n@@0) j) (= (|Seq#Index| (|Seq#Drop| s@@0 n@@0) j) (|Seq#Index| s@@0 (|Seq#Add| j n@@0)))))))
 :qid |stdinbpl.408:18|
 :skolemid |39|
 :pattern ( (|Seq#Index| (|Seq#Drop| s@@0 n@@0) j))
)))
(assert  (and (= (type null) RefType) (forall ((arg0@@28 T@U) ) (! (let ((A (FieldTypeInv0 (type arg0@@28))))
(= (type (PredicateMaskField arg0@@28)) (FieldType A (MapType1Type RefType boolType))))
 :qid |funType:PredicateMaskField|
 :pattern ( (PredicateMaskField arg0@@28))
))))
(assert (forall ((Heap@@2 T@U) (ExhaleHeap T@U) (Mask@@1 T@U) (pm_f T@U) ) (! (let ((C (FieldTypeInv0 (type pm_f))))
 (=> (and (and (and (and (and (= (type Heap@@2) (MapType0Type RefType)) (= (type ExhaleHeap) (MapType0Type RefType))) (= (type Mask@@1) (MapType1Type RefType realType))) (= (type pm_f) (FieldType C FrameTypeType))) (IdenticalOnKnownLocations Heap@@2 ExhaleHeap Mask@@1)) (and (HasDirectPerm Mask@@1 null pm_f) (IsPredicateField pm_f))) (= (MapType0Select Heap@@2 null (PredicateMaskField pm_f)) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))))
 :qid |stdinbpl.47:19|
 :skolemid |2|
 :pattern ( (IdenticalOnKnownLocations Heap@@2 ExhaleHeap Mask@@1) (IsPredicateField pm_f) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))
)))
(assert (forall ((arg0@@29 T@U) ) (! (let ((A@@0 (FieldTypeInv0 (type arg0@@29))))
(= (type (WandMaskField arg0@@29)) (FieldType A@@0 (MapType1Type RefType boolType))))
 :qid |funType:WandMaskField|
 :pattern ( (WandMaskField arg0@@29))
)))
(assert (forall ((Heap@@3 T@U) (ExhaleHeap@@0 T@U) (Mask@@2 T@U) (pm_f@@0 T@U) ) (! (let ((C@@0 (FieldTypeInv0 (type pm_f@@0))))
 (=> (and (and (and (and (and (= (type Heap@@3) (MapType0Type RefType)) (= (type ExhaleHeap@@0) (MapType0Type RefType))) (= (type Mask@@2) (MapType1Type RefType realType))) (= (type pm_f@@0) (FieldType C@@0 FrameTypeType))) (IdenticalOnKnownLocations Heap@@3 ExhaleHeap@@0 Mask@@2)) (and (HasDirectPerm Mask@@2 null pm_f@@0) (IsWandField pm_f@@0))) (= (MapType0Select Heap@@3 null (WandMaskField pm_f@@0)) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))))
 :qid |stdinbpl.60:19|
 :skolemid |5|
 :pattern ( (IdenticalOnKnownLocations Heap@@3 ExhaleHeap@@0 Mask@@2) (IsWandField pm_f@@0) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))
)))
(assert (forall ((Heap@@4 T@U) (Mask@@3 T@U) (i@@1 Int) (lo@@0 Int) (hi@@1 Int) (step@@0 Int) (vmin@@0 Int) (vmax@@0 Int) (ar@@1 T@U) (v_2@@0 Int) ) (!  (=> (and (and (and (= (type Heap@@4) (MapType0Type RefType)) (= (type Mask@@3) (MapType1Type RefType realType))) (= (type ar@@1) (SeqType RefType))) (and (state Heap@@4 Mask@@3) (< AssumeFunctionsAbove 1))) (=> (and (and (and (and (<= 0 lo@@0) (and (<= lo@@0 hi@@1) (and (<= hi@@1 step@@0) (> step@@0 0)))) (and (<= 0 vmin@@0) (and (<= vmin@@0 i@@1) (<= i@@1 vmax@@0)))) (<= vmax@@0 (|Seq#Length| ar@@1))) (forall ((ix Int) (jx Int) ) (!  (=> (and (>= ix 0) (and (< ix (|Seq#Length| ar@@1)) (and (>= jx 0) (and (< jx (|Seq#Length| ar@@1)) (not (= ix jx)))))) (not (= (|Seq#Index| ar@@1 ix) (|Seq#Index| ar@@1 jx))))
 :qid |stdinbpl.1289:189|
 :skolemid |110|
 :pattern ( (|Seq#Index| ar@@1 ix) (|Seq#Index| ar@@1 jx))
))) (= (count_square Heap@@4 i@@1 lo@@0 hi@@1 step@@0 vmin@@0 vmax@@0 ar@@1 v_2@@0) (ite (< i@@1 vmax@@0) (+ (ite  (and (<= lo@@0 (mod i@@1 step@@0)) (and (< (mod i@@1 step@@0) hi@@1) (= (U_2_int (MapType0Select Heap@@4 (|Seq#Index| ar@@1 i@@1) Ref__Integer_value)) v_2@@0))) 1 0) (|count_square'| Heap@@4 (+ i@@1 1) lo@@0 hi@@1 step@@0 vmin@@0 vmax@@0 ar@@1 v_2@@0)) 0))))
 :qid |stdinbpl.1287:15|
 :skolemid |111|
 :pattern ( (state Heap@@4 Mask@@3) (count_square Heap@@4 i@@1 lo@@0 hi@@1 step@@0 vmin@@0 vmax@@0 ar@@1 v_2@@0))
)))
(assert (forall ((arg0@@30 T@U) (arg1@@11 Int) (arg2@@3 T@U) ) (! (let ((T@@3 (type arg2@@3)))
(= (type (|Seq#Update| arg0@@30 arg1@@11 arg2@@3)) (SeqType T@@3)))
 :qid |funType:Seq#Update|
 :pattern ( (|Seq#Update| arg0@@30 arg1@@11 arg2@@3))
)))
(assert (forall ((s@@1 T@U) (i@@2 Int) (v T@U) (n@@1 Int) ) (! (let ((T@@4 (type v)))
 (=> (= (type s@@1) (SeqType T@@4)) (=> (and (<= 0 n@@1) (< n@@1 (|Seq#Length| s@@1))) (and (=> (= i@@2 n@@1) (= (|Seq#Index| (|Seq#Update| s@@1 i@@2 v) n@@1) v)) (=> (not (= i@@2 n@@1)) (= (|Seq#Index| (|Seq#Update| s@@1 i@@2 v) n@@1) (|Seq#Index| s@@1 n@@1)))))))
 :qid |stdinbpl.363:18|
 :skolemid |35|
 :pattern ( (|Seq#Index| (|Seq#Update| s@@1 i@@2 v) n@@1))
 :pattern ( (|Seq#Index| s@@1 n@@1) (|Seq#Update| s@@1 i@@2 v))
)))
(assert (forall ((arg0@@31 T@U) (arg1@@12 Int) ) (! (let ((T@@5 (SeqTypeInv0 (type arg0@@31))))
(= (type (|Seq#Take| arg0@@31 arg1@@12)) (SeqType T@@5)))
 :qid |funType:Seq#Take|
 :pattern ( (|Seq#Take| arg0@@31 arg1@@12))
)))
(assert (forall ((s@@2 T@U) (n@@2 Int) ) (! (let ((T@@6 (SeqTypeInv0 (type s@@2))))
 (=> (= (type s@@2) (SeqType T@@6)) (and (=> (<= 0 n@@2) (and (=> (<= n@@2 (|Seq#Length| s@@2)) (= (|Seq#Length| (|Seq#Take| s@@2 n@@2)) n@@2)) (=> (< (|Seq#Length| s@@2) n@@2) (= (|Seq#Length| (|Seq#Take| s@@2 n@@2)) (|Seq#Length| s@@2))))) (=> (< n@@2 0) (= (|Seq#Length| (|Seq#Take| s@@2 n@@2)) 0)))))
 :qid |stdinbpl.374:18|
 :skolemid |36|
 :pattern ( (|Seq#Length| (|Seq#Take| s@@2 n@@2)))
 :pattern ( (|Seq#Take| s@@2 n@@2) (|Seq#Length| s@@2))
)))
(assert (forall ((arg0@@32 Int) (arg1@@13 Int) ) (! (= (type (|Seq#Range| arg0@@32 arg1@@13)) (SeqType intType))
 :qid |funType:Seq#Range|
 :pattern ( (|Seq#Range| arg0@@32 arg1@@13))
)))
(assert (forall ((q@min Int) (q@max Int) (v@@0 T@U) ) (!  (=> (= (type v@@0) intType) (= (|Seq#Contains| (|Seq#Range| q@min q@max) v@@0)  (and (<= q@min (U_2_int v@@0)) (< (U_2_int v@@0) q@max))))
 :qid |stdinbpl.647:15|
 :skolemid |57|
 :pattern ( (|Seq#Contains| (|Seq#Range| q@min q@max) v@@0))
)))
(assert (forall ((s@@3 T@U) (x@@8 T@U) ) (! (let ((T@@7 (type x@@8)))
 (=> (and (= (type s@@3) (SeqType T@@7)) (|Seq#Contains| s@@3 x@@8)) (and (and (<= 0 (|Seq#Skolem| s@@3 x@@8)) (< (|Seq#Skolem| s@@3 x@@8) (|Seq#Length| s@@3))) (= (|Seq#Index| s@@3 (|Seq#Skolem| s@@3 x@@8)) x@@8))))
 :qid |stdinbpl.505:18|
 :skolemid |47|
 :pattern ( (|Seq#Contains| s@@3 x@@8))
)))
(assert (forall ((Heap@@5 T@U) (ExhaleHeap@@1 T@U) (Mask@@4 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@5) (MapType0Type RefType)) (= (type ExhaleHeap@@1) (MapType0Type RefType))) (= (type Mask@@4) (MapType1Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@5 ExhaleHeap@@1 Mask@@4)) (U_2_bool (MapType0Select Heap@@5 o_1 $allocated))) (U_2_bool (MapType0Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.73:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@5 ExhaleHeap@@1 Mask@@4) (MapType0Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert (forall ((s@@4 T@U) (n@@3 Int) ) (! (let ((T@@8 (SeqTypeInv0 (type s@@4))))
 (=> (and (= (type s@@4) (SeqType T@@8)) (<= n@@3 0)) (= (|Seq#Drop| s@@4 n@@3) s@@4)))
 :qid |stdinbpl.489:18|
 :skolemid |45|
 :pattern ( (|Seq#Drop| s@@4 n@@3))
)))
(assert (forall ((i@@3 Int) (j@@0 Int) ) (! (= (|Seq#Sub| i@@3 j@@0) (- i@@3 j@@0))
 :qid |stdinbpl.343:15|
 :skolemid |30|
 :pattern ( (|Seq#Sub| i@@3 j@@0))
)))
(assert (forall ((i@@4 Int) (j@@1 Int) ) (! (= (|Seq#Add| i@@4 j@@1) (+ i@@4 j@@1))
 :qid |stdinbpl.341:15|
 :skolemid |29|
 :pattern ( (|Seq#Add| i@@4 j@@1))
)))
(assert (forall ((arg0@@33 T@U) ) (! (let ((T@@9 (type arg0@@33)))
(= (type (|Seq#Singleton| arg0@@33)) (SeqType T@@9)))
 :qid |funType:Seq#Singleton|
 :pattern ( (|Seq#Singleton| arg0@@33))
)))
(assert (forall ((x@@9 T@U) (y@@1 T@U) ) (! (let ((T@@10 (type x@@9)))
 (=> (= (type y@@1) T@@10) (= (|Seq#Contains| (|Seq#Singleton| x@@9) y@@1) (= x@@9 y@@1))))
 :qid |stdinbpl.630:18|
 :skolemid |54|
 :pattern ( (|Seq#Contains| (|Seq#Singleton| x@@9) y@@1))
)))
(assert (forall ((Heap@@6 T@U) (i@@5 Int) (lo@@1 Int) (hi@@2 Int) (step@@1 Int) (vmin@@1 Int) (vmax@@1 Int) (ar@@2 T@U) (v_2@@1 Int) ) (!  (=> (and (= (type Heap@@6) (MapType0Type RefType)) (= (type ar@@2) (SeqType RefType))) (and (= (count_square Heap@@6 i@@5 lo@@1 hi@@2 step@@1 vmin@@1 vmax@@1 ar@@2 v_2@@1) (|count_square'| Heap@@6 i@@5 lo@@1 hi@@2 step@@1 vmin@@1 vmax@@1 ar@@2 v_2@@1)) (dummyFunction (int_2_U (|count_square#triggerStateless| i@@5 lo@@1 hi@@2 step@@1 vmin@@1 vmax@@1 ar@@2 v_2@@1)))))
 :qid |stdinbpl.1277:15|
 :skolemid |108|
 :pattern ( (count_square Heap@@6 i@@5 lo@@1 hi@@2 step@@1 vmin@@1 vmax@@1 ar@@2 v_2@@1))
)))
(assert (forall ((s@@5 T@U) (n@@4 Int) (j@@2 Int) ) (! (let ((T@@11 (SeqTypeInv0 (type s@@5))))
 (=> (= (type s@@5) (SeqType T@@11)) (=> (and (and (<= 0 j@@2) (< j@@2 n@@4)) (< j@@2 (|Seq#Length| s@@5))) (= (|Seq#Index| (|Seq#Take| s@@5 n@@4) j@@2) (|Seq#Index| s@@5 j@@2)))))
 :qid |stdinbpl.382:18|
 :skolemid |37|
 :pattern ( (|Seq#Index| (|Seq#Take| s@@5 n@@4) j@@2))
 :pattern ( (|Seq#Index| s@@5 j@@2) (|Seq#Take| s@@5 n@@4))
)))
(assert (forall ((Heap@@7 T@U) (Mask@@5 T@U) (i@@6 Int) (hi@@3 Int) (ar@@3 T@U) (v_2@@2 Int) ) (!  (=> (and (and (and (and (= (type Heap@@7) (MapType0Type RefType)) (= (type Mask@@5) (MapType1Type RefType realType))) (= (type ar@@3) (SeqType RefType))) (and (state Heap@@7 Mask@@5) (< AssumeFunctionsAbove 3))) (and (and (and (<= 0 i@@6) (<= i@@6 hi@@3)) (<= hi@@3 (|Seq#Length| ar@@3))) (forall ((ix@@0 Int) (jx@@0 Int) ) (!  (=> (and (>= ix@@0 0) (and (< ix@@0 (|Seq#Length| ar@@3)) (and (>= jx@@0 0) (and (< jx@@0 (|Seq#Length| ar@@3)) (not (= ix@@0 jx@@0)))))) (not (= (|Seq#Index| ar@@3 ix@@0) (|Seq#Index| ar@@3 jx@@0))))
 :qid |stdinbpl.1651:110|
 :skolemid |137|
 :pattern ( (|Seq#Index| ar@@3 ix@@0) (|Seq#Index| ar@@3 jx@@0))
)))) (= (count_array Heap@@7 i@@6 hi@@3 ar@@3 v_2@@2) (ite (< i@@6 hi@@3) (+ (ite (= (U_2_int (MapType0Select Heap@@7 (|Seq#Index| ar@@3 i@@6) Ref__Integer_value)) v_2@@2) 1 0) (|count_array'| Heap@@7 (+ i@@6 1) hi@@3 ar@@3 v_2@@2)) 0)))
 :qid |stdinbpl.1649:15|
 :skolemid |138|
 :pattern ( (state Heap@@7 Mask@@5) (count_array Heap@@7 i@@6 hi@@3 ar@@3 v_2@@2))
)))
(assert (forall ((Heap@@8 T@U) (Mask@@6 T@U) (i@@7 Int) (lo@@2 Int) (hi@@4 Int) (step@@2 Int) (vmin@@2 Int) (vmax@@2 Int) (ar@@4 T@U) ) (!  (=> (and (and (and (= (type Heap@@8) (MapType0Type RefType)) (= (type Mask@@6) (MapType1Type RefType realType))) (= (type ar@@4) (SeqType RefType))) (and (state Heap@@8 Mask@@6) (< AssumeFunctionsAbove 0))) (=> (and (and (and (and (<= 0 lo@@2) (and (<= lo@@2 hi@@4) (and (<= hi@@4 step@@2) (> step@@2 0)))) (and (<= 0 vmin@@2) (and (<= vmin@@2 i@@7) (<= i@@7 vmax@@2)))) (<= vmax@@2 (|Seq#Length| ar@@4))) (forall ((ix@@1 Int) (jx@@1 Int) ) (!  (=> (and (>= ix@@1 0) (and (< ix@@1 (|Seq#Length| ar@@4)) (and (>= jx@@1 0) (and (< jx@@1 (|Seq#Length| ar@@4)) (not (= ix@@1 jx@@1)))))) (not (= (|Seq#Index| ar@@4 ix@@1) (|Seq#Index| ar@@4 jx@@1))))
 :qid |stdinbpl.1011:189|
 :skolemid |87|
 :pattern ( (|Seq#Index| ar@@4 ix@@1) (|Seq#Index| ar@@4 jx@@1))
))) (= (sum_square Heap@@8 i@@7 lo@@2 hi@@4 step@@2 vmin@@2 vmax@@2 ar@@4) (ite (< i@@7 vmax@@2) (+ (ite  (and (<= lo@@2 (mod i@@7 step@@2)) (< (mod i@@7 step@@2) hi@@4)) (U_2_int (MapType0Select Heap@@8 (|Seq#Index| ar@@4 i@@7) Ref__Integer_value)) 0) (|sum_square'| Heap@@8 (+ i@@7 1) lo@@2 hi@@4 step@@2 vmin@@2 vmax@@2 ar@@4)) 0))))
 :qid |stdinbpl.1009:15|
 :skolemid |88|
 :pattern ( (state Heap@@8 Mask@@6) (sum_square Heap@@8 i@@7 lo@@2 hi@@4 step@@2 vmin@@2 vmax@@2 ar@@4))
)))
(assert (forall ((Heap@@9 T@U) (i@@8 Int) (lo@@3 Int) (hi@@5 Int) (step@@3 Int) (vmin@@3 Int) (vmax@@3 Int) (ar@@5 T@U) (v_2@@3 Int) ) (!  (=> (and (= (type Heap@@9) (MapType0Type RefType)) (= (type ar@@5) (SeqType RefType))) (dummyFunction (int_2_U (|count_square#triggerStateless| i@@8 lo@@3 hi@@5 step@@3 vmin@@3 vmax@@3 ar@@5 v_2@@3))))
 :qid |stdinbpl.1281:15|
 :skolemid |109|
 :pattern ( (|count_square'| Heap@@9 i@@8 lo@@3 hi@@5 step@@3 vmin@@3 vmax@@3 ar@@5 v_2@@3))
)))
(assert (forall ((Heap@@10 T@U) (ExhaleHeap@@2 T@U) (Mask@@7 T@U) (o_1@@0 T@U) (f_2 T@U) ) (! (let ((B@@1 (FieldTypeInv1 (type f_2))))
(let ((A@@1 (FieldTypeInv0 (type f_2))))
 (=> (and (and (and (and (and (and (= (type Heap@@10) (MapType0Type RefType)) (= (type ExhaleHeap@@2) (MapType0Type RefType))) (= (type Mask@@7) (MapType1Type RefType realType))) (= (type o_1@@0) RefType)) (= (type f_2) (FieldType A@@1 B@@1))) (IdenticalOnKnownLocations Heap@@10 ExhaleHeap@@2 Mask@@7)) (HasDirectPerm Mask@@7 o_1@@0 f_2)) (= (MapType0Select Heap@@10 o_1@@0 f_2) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2)))))
 :qid |stdinbpl.42:22|
 :skolemid |1|
 :pattern ( (IdenticalOnKnownLocations Heap@@10 ExhaleHeap@@2 Mask@@7) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2))
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
 :qid |stdinbpl.286:19|
 :skolemid |21|
 :pattern ( (InsidePredicate p v_1 p w))
)))
(assert (forall ((arg0@@34 T@U) (arg1@@14 T@U) ) (! (let ((T@@14 (SeqTypeInv0 (type arg0@@34))))
(= (type (|Seq#Append| arg0@@34 arg1@@14)) (SeqType T@@14)))
 :qid |funType:Seq#Append|
 :pattern ( (|Seq#Append| arg0@@34 arg1@@14))
)))
(assert (forall ((s0 T@U) (s1 T@U) (n@@5 Int) ) (! (let ((T@@15 (SeqTypeInv0 (type s0))))
 (=> (and (= (type s0) (SeqType T@@15)) (= (type s1) (SeqType T@@15))) (=> (and (and (and (not (= s0 (|Seq#Empty| T@@15))) (not (= s1 (|Seq#Empty| T@@15)))) (<= (|Seq#Length| s0) n@@5)) (< n@@5 (|Seq#Length| (|Seq#Append| s0 s1)))) (and (= (|Seq#Add| (|Seq#Sub| n@@5 (|Seq#Length| s0)) (|Seq#Length| s0)) n@@5) (= (|Seq#Index| (|Seq#Append| s0 s1) n@@5) (|Seq#Index| s1 (|Seq#Sub| n@@5 (|Seq#Length| s0))))))))
 :qid |stdinbpl.354:18|
 :skolemid |32|
 :pattern ( (|Seq#Index| (|Seq#Append| s0 s1) n@@5))
)))
(assert  (not (IsPredicateField Ref__Integer_value)))
(assert  (not (IsWandField Ref__Integer_value)))
(assert (forall ((Heap@@11 T@U) (ExhaleHeap@@3 T@U) (Mask@@8 T@U) ) (!  (=> (and (and (and (= (type Heap@@11) (MapType0Type RefType)) (= (type ExhaleHeap@@3) (MapType0Type RefType))) (= (type Mask@@8) (MapType1Type RefType realType))) (IdenticalOnKnownLocations Heap@@11 ExhaleHeap@@3 Mask@@8)) (succHeap Heap@@11 ExhaleHeap@@3))
 :qid |stdinbpl.83:15|
 :skolemid |10|
 :pattern ( (IdenticalOnKnownLocations Heap@@11 ExhaleHeap@@3 Mask@@8))
)))
(assert (= (type EmptyFrame) FrameTypeType))
(assert (forall ((Heap@@12 T@U) (Mask@@9 T@U) (i@@9 Int) (hi@@6 Int) (ar@@6 T@U) ) (!  (=> (and (and (and (= (type Heap@@12) (MapType0Type RefType)) (= (type Mask@@9) (MapType1Type RefType realType))) (= (type ar@@6) (SeqType intType))) (state Heap@@12 Mask@@9)) (= (|sum_list'| Heap@@12 i@@9 hi@@6 ar@@6) (|sum_list#frame| EmptyFrame i@@9 hi@@6 ar@@6)))
 :qid |stdinbpl.685:15|
 :skolemid |61|
 :pattern ( (state Heap@@12 Mask@@9) (|sum_list'| Heap@@12 i@@9 hi@@6 ar@@6))
)))
(assert (forall ((Heap@@13 T@U) (Mask@@10 T@U) (i@@10 Int) (lo@@4 Int) (hi@@7 Int) (ar@@7 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@13) (MapType0Type RefType)) (= (type Mask@@10) (MapType1Type RefType realType))) (= (type ar@@7) (SeqType RefType))) (and (state Heap@@13 Mask@@10) (< AssumeFunctionsAbove 2))) (and (and (and (<= 0 lo@@4) (and (<= lo@@4 i@@10) (<= i@@10 hi@@7))) (<= hi@@7 (|Seq#Length| ar@@7))) (forall ((ix@@2 Int) (jx@@2 Int) ) (!  (=> (and (>= ix@@2 0) (and (< ix@@2 (|Seq#Length| ar@@7)) (and (>= jx@@2 0) (and (< jx@@2 (|Seq#Length| ar@@7)) (not (= ix@@2 jx@@2)))))) (not (= (|Seq#Index| ar@@7 ix@@2) (|Seq#Index| ar@@7 jx@@2))))
 :qid |stdinbpl.764:124|
 :skolemid |64|
 :pattern ( (|Seq#Index| ar@@7 ix@@2) (|Seq#Index| ar@@7 jx@@2))
)))) (= (sum_array Heap@@13 i@@10 lo@@4 hi@@7 ar@@7) (ite (< i@@10 hi@@7) (+ (U_2_int (MapType0Select Heap@@13 (|Seq#Index| ar@@7 i@@10) Ref__Integer_value)) (|sum_array'| Heap@@13 (+ i@@10 1) lo@@4 hi@@7 ar@@7)) 0)))
 :qid |stdinbpl.762:15|
 :skolemid |65|
 :pattern ( (state Heap@@13 Mask@@10) (sum_array Heap@@13 i@@10 lo@@4 hi@@7 ar@@7))
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
(assert (forall ((Heap@@14 T@U) (i@@11 Int) (lo@@5 Int) (hi@@8 Int) (ar@@8 T@U) ) (!  (=> (and (= (type Heap@@14) (MapType0Type RefType)) (= (type ar@@8) (SeqType RefType))) (dummyFunction (int_2_U (|sum_array#triggerStateless| i@@11 lo@@5 hi@@8 ar@@8))))
 :qid |stdinbpl.756:15|
 :skolemid |63|
 :pattern ( (|sum_array'| Heap@@14 i@@11 lo@@5 hi@@8 ar@@8))
)))
(assert (forall ((Heap@@15 T@U) (i@@12 Int) (hi@@9 Int) (ar@@9 T@U) (v_2@@4 Int) ) (!  (=> (and (= (type Heap@@15) (MapType0Type RefType)) (= (type ar@@9) (SeqType intType))) (dummyFunction (int_2_U (|count_list#triggerStateless| i@@12 hi@@9 ar@@9 v_2@@4))))
 :qid |stdinbpl.1559:15|
 :skolemid |132|
 :pattern ( (|count_list'| Heap@@15 i@@12 hi@@9 ar@@9 v_2@@4))
)))
(assert (forall ((Heap@@16 T@U) (i@@13 Int) (hi@@10 Int) (ar@@10 T@U) (v_2@@5 Int) ) (!  (=> (and (= (type Heap@@16) (MapType0Type RefType)) (= (type ar@@10) (SeqType RefType))) (dummyFunction (int_2_U (|count_array#triggerStateless| i@@13 hi@@10 ar@@10 v_2@@5))))
 :qid |stdinbpl.1643:15|
 :skolemid |136|
 :pattern ( (|count_array'| Heap@@16 i@@13 hi@@10 ar@@10 v_2@@5))
)))
(assert (forall ((arg0@@35 Real) (arg1@@15 T@U) ) (! (= (type (ConditionalFrame arg0@@35 arg1@@15)) FrameTypeType)
 :qid |funType:ConditionalFrame|
 :pattern ( (ConditionalFrame arg0@@35 arg1@@15))
)))
(assert (forall ((p@@0 Real) (f_6 T@U) ) (!  (=> (= (type f_6) FrameTypeType) (= (ConditionalFrame p@@0 f_6) (ite (> p@@0 0.0) f_6 EmptyFrame)))
 :qid |stdinbpl.274:15|
 :skolemid |19|
 :pattern ( (ConditionalFrame p@@0 f_6))
)))
(assert (forall ((q@min@@0 Int) (q@max@@0 Int) (j@@3 Int) ) (!  (=> (and (<= 0 j@@3) (< j@@3 (- q@max@@0 q@min@@0))) (= (U_2_int (|Seq#Index| (|Seq#Range| q@min@@0 q@max@@0) j@@3)) (+ q@min@@0 j@@3)))
 :qid |stdinbpl.645:15|
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
 :qid |stdinbpl.323:18|
 :skolemid |26|
 :pattern ( (|Seq#Length| (|Seq#Append| s0@@0 s1@@0)))
)))
(assert (forall ((Heap@@17 T@U) (Mask@@12 T@U) (i@@14 Int) (hi@@11 Int) (ar@@11 T@U) (v_2@@6 Int) ) (!  (=> (and (and (and (and (= (type Heap@@17) (MapType0Type RefType)) (= (type Mask@@12) (MapType1Type RefType realType))) (= (type ar@@11) (SeqType intType))) (and (state Heap@@17 Mask@@12) (< AssumeFunctionsAbove 5))) (and (and (<= 0 i@@14) (<= i@@14 hi@@11)) (<= hi@@11 (|Seq#Length| ar@@11)))) (= (count_list Heap@@17 i@@14 hi@@11 ar@@11 v_2@@6) (ite (< i@@14 hi@@11) (+ (ite (= (U_2_int (|Seq#Index| ar@@11 i@@14)) v_2@@6) 1 0) (|count_list'| Heap@@17 (+ i@@14 1) hi@@11 ar@@11 v_2@@6)) 0)))
 :qid |stdinbpl.1565:15|
 :skolemid |133|
 :pattern ( (state Heap@@17 Mask@@12) (count_list Heap@@17 i@@14 hi@@11 ar@@11 v_2@@6))
)))
(assert (forall ((s@@6 T@U) (t T@U) (n@@6 Int) ) (! (let ((T@@17 (SeqTypeInv0 (type s@@6))))
 (=> (and (and (= (type s@@6) (SeqType T@@17)) (= (type t) (SeqType T@@17))) (and (> n@@6 0) (> n@@6 (|Seq#Length| s@@6)))) (and (= (|Seq#Add| (|Seq#Sub| n@@6 (|Seq#Length| s@@6)) (|Seq#Length| s@@6)) n@@6) (= (|Seq#Drop| (|Seq#Append| s@@6 t) n@@6) (|Seq#Drop| t (|Seq#Sub| n@@6 (|Seq#Length| s@@6)))))))
 :qid |stdinbpl.479:18|
 :skolemid |44|
 :pattern ( (|Seq#Drop| (|Seq#Append| s@@6 t) n@@6))
)))
(assert (forall ((Heap@@18 T@U) (i@@15 Int) (lo@@6 Int) (hi@@12 Int) (ar@@12 T@U) ) (!  (=> (and (= (type Heap@@18) (MapType0Type RefType)) (= (type ar@@12) (SeqType RefType))) (and (= (sum_array Heap@@18 i@@15 lo@@6 hi@@12 ar@@12) (|sum_array'| Heap@@18 i@@15 lo@@6 hi@@12 ar@@12)) (dummyFunction (int_2_U (|sum_array#triggerStateless| i@@15 lo@@6 hi@@12 ar@@12)))))
 :qid |stdinbpl.752:15|
 :skolemid |62|
 :pattern ( (sum_array Heap@@18 i@@15 lo@@6 hi@@12 ar@@12))
)))
(assert (forall ((Heap@@19 T@U) (i@@16 Int) (hi@@13 Int) (ar@@13 T@U) (v_2@@7 Int) ) (!  (=> (and (= (type Heap@@19) (MapType0Type RefType)) (= (type ar@@13) (SeqType intType))) (and (= (count_list Heap@@19 i@@16 hi@@13 ar@@13 v_2@@7) (|count_list'| Heap@@19 i@@16 hi@@13 ar@@13 v_2@@7)) (dummyFunction (int_2_U (|count_list#triggerStateless| i@@16 hi@@13 ar@@13 v_2@@7)))))
 :qid |stdinbpl.1555:15|
 :skolemid |131|
 :pattern ( (count_list Heap@@19 i@@16 hi@@13 ar@@13 v_2@@7))
)))
(assert (forall ((Heap@@20 T@U) (i@@17 Int) (hi@@14 Int) (ar@@14 T@U) (v_2@@8 Int) ) (!  (=> (and (= (type Heap@@20) (MapType0Type RefType)) (= (type ar@@14) (SeqType RefType))) (and (= (count_array Heap@@20 i@@17 hi@@14 ar@@14 v_2@@8) (|count_array'| Heap@@20 i@@17 hi@@14 ar@@14 v_2@@8)) (dummyFunction (int_2_U (|count_array#triggerStateless| i@@17 hi@@14 ar@@14 v_2@@8)))))
 :qid |stdinbpl.1639:15|
 :skolemid |135|
 :pattern ( (count_array Heap@@20 i@@17 hi@@14 ar@@14 v_2@@8))
)))
(assert (forall ((o_2@@1 T@U) (f_4@@1 T@U) ) (! (let ((B@@4 (FieldTypeInv1 (type f_4@@1))))
(let ((A@@5 (FieldTypeInv0 (type f_4@@1))))
 (=> (and (= (type o_2@@1) RefType) (= (type f_4@@1) (FieldType A@@5 B@@4))) (= (U_2_real (MapType1Select ZeroMask o_2@@1 f_4@@1)) NoPerm))))
 :qid |stdinbpl.106:22|
 :skolemid |13|
 :pattern ( (MapType1Select ZeroMask o_2@@1 f_4@@1))
)))
(assert (forall ((Heap@@21 T@U) (i@@18 Int) (lo@@7 Int) (hi@@15 Int) (step@@4 Int) (vmin@@4 Int) (vmax@@4 Int) (ar@@15 T@U) ) (!  (=> (and (= (type Heap@@21) (MapType0Type RefType)) (= (type ar@@15) (SeqType RefType))) (and (= (sum_square Heap@@21 i@@18 lo@@7 hi@@15 step@@4 vmin@@4 vmax@@4 ar@@15) (|sum_square'| Heap@@21 i@@18 lo@@7 hi@@15 step@@4 vmin@@4 vmax@@4 ar@@15)) (dummyFunction (int_2_U (|sum_square#triggerStateless| i@@18 lo@@7 hi@@15 step@@4 vmin@@4 vmax@@4 ar@@15)))))
 :qid |stdinbpl.999:15|
 :skolemid |85|
 :pattern ( (sum_square Heap@@21 i@@18 lo@@7 hi@@15 step@@4 vmin@@4 vmax@@4 ar@@15))
)))
(assert (forall ((Heap@@22 T@U) (Mask@@13 T@U) (i@@19 Int) (hi@@16 Int) (ar@@16 T@U) (v_2@@9 Int) ) (!  (=> (and (and (and (= (type Heap@@22) (MapType0Type RefType)) (= (type Mask@@13) (MapType1Type RefType realType))) (= (type ar@@16) (SeqType intType))) (state Heap@@22 Mask@@13)) (= (|count_list'| Heap@@22 i@@19 hi@@16 ar@@16 v_2@@9) (|count_list#frame| EmptyFrame i@@19 hi@@16 ar@@16 v_2@@9)))
 :qid |stdinbpl.1572:15|
 :skolemid |134|
 :pattern ( (state Heap@@22 Mask@@13) (|count_list'| Heap@@22 i@@19 hi@@16 ar@@16 v_2@@9))
)))
(assert (forall ((s@@7 T@U) (t@@0 T@U) (n@@7 Int) ) (! (let ((T@@18 (SeqTypeInv0 (type s@@7))))
 (=> (and (and (= (type s@@7) (SeqType T@@18)) (= (type t@@0) (SeqType T@@18))) (and (> n@@7 0) (> n@@7 (|Seq#Length| s@@7)))) (and (= (|Seq#Add| (|Seq#Sub| n@@7 (|Seq#Length| s@@7)) (|Seq#Length| s@@7)) n@@7) (= (|Seq#Take| (|Seq#Append| s@@7 t@@0) n@@7) (|Seq#Append| s@@7 (|Seq#Take| t@@0 (|Seq#Sub| n@@7 (|Seq#Length| s@@7))))))))
 :qid |stdinbpl.466:18|
 :skolemid |42|
 :pattern ( (|Seq#Take| (|Seq#Append| s@@7 t@@0) n@@7))
)))
(assert (forall ((q@min@@1 Int) (q@max@@1 Int) ) (!  (and (=> (< q@min@@1 q@max@@1) (= (|Seq#Length| (|Seq#Range| q@min@@1 q@max@@1)) (- q@max@@1 q@min@@1))) (=> (<= q@max@@1 q@min@@1) (= (|Seq#Length| (|Seq#Range| q@min@@1 q@max@@1)) 0)))
 :qid |stdinbpl.644:15|
 :skolemid |55|
 :pattern ( (|Seq#Length| (|Seq#Range| q@min@@1 q@max@@1)))
)))
(assert (forall ((Heap2Heap T@U) (Heap1Heap T@U) (i@@20 Int) (lo@@8 Int) (hi@@17 Int) (step@@5 Int) (vmin@@5 Int) (vmax@@5 Int) (ar@@17 T@U) ) (!  (=> (and (and (and (= (type Heap2Heap) (MapType0Type RefType)) (= (type Heap1Heap) (MapType0Type RefType))) (= (type ar@@17) (SeqType RefType))) (and (=  (and (<= vmin@@5 (|sk_sum_square#condqp2| (|sum_square#condqp2| Heap2Heap i@@20 lo@@8 hi@@17 step@@5 vmin@@5 vmax@@5 ar@@17) (|sum_square#condqp2| Heap1Heap i@@20 lo@@8 hi@@17 step@@5 vmin@@5 vmax@@5 ar@@17))) (and (< (|sk_sum_square#condqp2| (|sum_square#condqp2| Heap2Heap i@@20 lo@@8 hi@@17 step@@5 vmin@@5 vmax@@5 ar@@17) (|sum_square#condqp2| Heap1Heap i@@20 lo@@8 hi@@17 step@@5 vmin@@5 vmax@@5 ar@@17)) vmax@@5) (and (<= lo@@8 (mod (|sk_sum_square#condqp2| (|sum_square#condqp2| Heap2Heap i@@20 lo@@8 hi@@17 step@@5 vmin@@5 vmax@@5 ar@@17) (|sum_square#condqp2| Heap1Heap i@@20 lo@@8 hi@@17 step@@5 vmin@@5 vmax@@5 ar@@17)) step@@5)) (< (mod (|sk_sum_square#condqp2| (|sum_square#condqp2| Heap2Heap i@@20 lo@@8 hi@@17 step@@5 vmin@@5 vmax@@5 ar@@17) (|sum_square#condqp2| Heap1Heap i@@20 lo@@8 hi@@17 step@@5 vmin@@5 vmax@@5 ar@@17)) step@@5) hi@@17))))  (and (<= vmin@@5 (|sk_sum_square#condqp2| (|sum_square#condqp2| Heap2Heap i@@20 lo@@8 hi@@17 step@@5 vmin@@5 vmax@@5 ar@@17) (|sum_square#condqp2| Heap1Heap i@@20 lo@@8 hi@@17 step@@5 vmin@@5 vmax@@5 ar@@17))) (and (< (|sk_sum_square#condqp2| (|sum_square#condqp2| Heap2Heap i@@20 lo@@8 hi@@17 step@@5 vmin@@5 vmax@@5 ar@@17) (|sum_square#condqp2| Heap1Heap i@@20 lo@@8 hi@@17 step@@5 vmin@@5 vmax@@5 ar@@17)) vmax@@5) (and (<= lo@@8 (mod (|sk_sum_square#condqp2| (|sum_square#condqp2| Heap2Heap i@@20 lo@@8 hi@@17 step@@5 vmin@@5 vmax@@5 ar@@17) (|sum_square#condqp2| Heap1Heap i@@20 lo@@8 hi@@17 step@@5 vmin@@5 vmax@@5 ar@@17)) step@@5)) (< (mod (|sk_sum_square#condqp2| (|sum_square#condqp2| Heap2Heap i@@20 lo@@8 hi@@17 step@@5 vmin@@5 vmax@@5 ar@@17) (|sum_square#condqp2| Heap1Heap i@@20 lo@@8 hi@@17 step@@5 vmin@@5 vmax@@5 ar@@17)) step@@5) hi@@17))))) (=> (and (<= vmin@@5 (|sk_sum_square#condqp2| (|sum_square#condqp2| Heap2Heap i@@20 lo@@8 hi@@17 step@@5 vmin@@5 vmax@@5 ar@@17) (|sum_square#condqp2| Heap1Heap i@@20 lo@@8 hi@@17 step@@5 vmin@@5 vmax@@5 ar@@17))) (and (< (|sk_sum_square#condqp2| (|sum_square#condqp2| Heap2Heap i@@20 lo@@8 hi@@17 step@@5 vmin@@5 vmax@@5 ar@@17) (|sum_square#condqp2| Heap1Heap i@@20 lo@@8 hi@@17 step@@5 vmin@@5 vmax@@5 ar@@17)) vmax@@5) (and (<= lo@@8 (mod (|sk_sum_square#condqp2| (|sum_square#condqp2| Heap2Heap i@@20 lo@@8 hi@@17 step@@5 vmin@@5 vmax@@5 ar@@17) (|sum_square#condqp2| Heap1Heap i@@20 lo@@8 hi@@17 step@@5 vmin@@5 vmax@@5 ar@@17)) step@@5)) (< (mod (|sk_sum_square#condqp2| (|sum_square#condqp2| Heap2Heap i@@20 lo@@8 hi@@17 step@@5 vmin@@5 vmax@@5 ar@@17) (|sum_square#condqp2| Heap1Heap i@@20 lo@@8 hi@@17 step@@5 vmin@@5 vmax@@5 ar@@17)) step@@5) hi@@17)))) (= (U_2_int (MapType0Select Heap2Heap (|Seq#Index| ar@@17 (|sk_sum_square#condqp2| (|sum_square#condqp2| Heap2Heap i@@20 lo@@8 hi@@17 step@@5 vmin@@5 vmax@@5 ar@@17) (|sum_square#condqp2| Heap1Heap i@@20 lo@@8 hi@@17 step@@5 vmin@@5 vmax@@5 ar@@17))) Ref__Integer_value)) (U_2_int (MapType0Select Heap1Heap (|Seq#Index| ar@@17 (|sk_sum_square#condqp2| (|sum_square#condqp2| Heap2Heap i@@20 lo@@8 hi@@17 step@@5 vmin@@5 vmax@@5 ar@@17) (|sum_square#condqp2| Heap1Heap i@@20 lo@@8 hi@@17 step@@5 vmin@@5 vmax@@5 ar@@17))) Ref__Integer_value)))))) (= (|sum_square#condqp2| Heap2Heap i@@20 lo@@8 hi@@17 step@@5 vmin@@5 vmax@@5 ar@@17) (|sum_square#condqp2| Heap1Heap i@@20 lo@@8 hi@@17 step@@5 vmin@@5 vmax@@5 ar@@17)))
 :qid |stdinbpl.1029:15|
 :skolemid |90|
 :pattern ( (|sum_square#condqp2| Heap2Heap i@@20 lo@@8 hi@@17 step@@5 vmin@@5 vmax@@5 ar@@17) (|sum_square#condqp2| Heap1Heap i@@20 lo@@8 hi@@17 step@@5 vmin@@5 vmax@@5 ar@@17) (succHeapTrans Heap2Heap Heap1Heap))
)))
(assert (forall ((Heap2Heap@@0 T@U) (Heap1Heap@@0 T@U) (i@@21 Int) (lo@@9 Int) (hi@@18 Int) (step@@6 Int) (vmin@@6 Int) (vmax@@6 Int) (ar@@18 T@U) (v_2@@10 Int) ) (!  (=> (and (and (and (= (type Heap2Heap@@0) (MapType0Type RefType)) (= (type Heap1Heap@@0) (MapType0Type RefType))) (= (type ar@@18) (SeqType RefType))) (and (=  (and (<= vmin@@6 (|sk_count_square#condqp3| (|count_square#condqp3| Heap2Heap@@0 i@@21 lo@@9 hi@@18 step@@6 vmin@@6 vmax@@6 ar@@18 v_2@@10) (|count_square#condqp3| Heap1Heap@@0 i@@21 lo@@9 hi@@18 step@@6 vmin@@6 vmax@@6 ar@@18 v_2@@10))) (and (< (|sk_count_square#condqp3| (|count_square#condqp3| Heap2Heap@@0 i@@21 lo@@9 hi@@18 step@@6 vmin@@6 vmax@@6 ar@@18 v_2@@10) (|count_square#condqp3| Heap1Heap@@0 i@@21 lo@@9 hi@@18 step@@6 vmin@@6 vmax@@6 ar@@18 v_2@@10)) vmax@@6) (and (<= lo@@9 (mod (|sk_count_square#condqp3| (|count_square#condqp3| Heap2Heap@@0 i@@21 lo@@9 hi@@18 step@@6 vmin@@6 vmax@@6 ar@@18 v_2@@10) (|count_square#condqp3| Heap1Heap@@0 i@@21 lo@@9 hi@@18 step@@6 vmin@@6 vmax@@6 ar@@18 v_2@@10)) step@@6)) (< (mod (|sk_count_square#condqp3| (|count_square#condqp3| Heap2Heap@@0 i@@21 lo@@9 hi@@18 step@@6 vmin@@6 vmax@@6 ar@@18 v_2@@10) (|count_square#condqp3| Heap1Heap@@0 i@@21 lo@@9 hi@@18 step@@6 vmin@@6 vmax@@6 ar@@18 v_2@@10)) step@@6) hi@@18))))  (and (<= vmin@@6 (|sk_count_square#condqp3| (|count_square#condqp3| Heap2Heap@@0 i@@21 lo@@9 hi@@18 step@@6 vmin@@6 vmax@@6 ar@@18 v_2@@10) (|count_square#condqp3| Heap1Heap@@0 i@@21 lo@@9 hi@@18 step@@6 vmin@@6 vmax@@6 ar@@18 v_2@@10))) (and (< (|sk_count_square#condqp3| (|count_square#condqp3| Heap2Heap@@0 i@@21 lo@@9 hi@@18 step@@6 vmin@@6 vmax@@6 ar@@18 v_2@@10) (|count_square#condqp3| Heap1Heap@@0 i@@21 lo@@9 hi@@18 step@@6 vmin@@6 vmax@@6 ar@@18 v_2@@10)) vmax@@6) (and (<= lo@@9 (mod (|sk_count_square#condqp3| (|count_square#condqp3| Heap2Heap@@0 i@@21 lo@@9 hi@@18 step@@6 vmin@@6 vmax@@6 ar@@18 v_2@@10) (|count_square#condqp3| Heap1Heap@@0 i@@21 lo@@9 hi@@18 step@@6 vmin@@6 vmax@@6 ar@@18 v_2@@10)) step@@6)) (< (mod (|sk_count_square#condqp3| (|count_square#condqp3| Heap2Heap@@0 i@@21 lo@@9 hi@@18 step@@6 vmin@@6 vmax@@6 ar@@18 v_2@@10) (|count_square#condqp3| Heap1Heap@@0 i@@21 lo@@9 hi@@18 step@@6 vmin@@6 vmax@@6 ar@@18 v_2@@10)) step@@6) hi@@18))))) (=> (and (<= vmin@@6 (|sk_count_square#condqp3| (|count_square#condqp3| Heap2Heap@@0 i@@21 lo@@9 hi@@18 step@@6 vmin@@6 vmax@@6 ar@@18 v_2@@10) (|count_square#condqp3| Heap1Heap@@0 i@@21 lo@@9 hi@@18 step@@6 vmin@@6 vmax@@6 ar@@18 v_2@@10))) (and (< (|sk_count_square#condqp3| (|count_square#condqp3| Heap2Heap@@0 i@@21 lo@@9 hi@@18 step@@6 vmin@@6 vmax@@6 ar@@18 v_2@@10) (|count_square#condqp3| Heap1Heap@@0 i@@21 lo@@9 hi@@18 step@@6 vmin@@6 vmax@@6 ar@@18 v_2@@10)) vmax@@6) (and (<= lo@@9 (mod (|sk_count_square#condqp3| (|count_square#condqp3| Heap2Heap@@0 i@@21 lo@@9 hi@@18 step@@6 vmin@@6 vmax@@6 ar@@18 v_2@@10) (|count_square#condqp3| Heap1Heap@@0 i@@21 lo@@9 hi@@18 step@@6 vmin@@6 vmax@@6 ar@@18 v_2@@10)) step@@6)) (< (mod (|sk_count_square#condqp3| (|count_square#condqp3| Heap2Heap@@0 i@@21 lo@@9 hi@@18 step@@6 vmin@@6 vmax@@6 ar@@18 v_2@@10) (|count_square#condqp3| Heap1Heap@@0 i@@21 lo@@9 hi@@18 step@@6 vmin@@6 vmax@@6 ar@@18 v_2@@10)) step@@6) hi@@18)))) (= (U_2_int (MapType0Select Heap2Heap@@0 (|Seq#Index| ar@@18 (|sk_count_square#condqp3| (|count_square#condqp3| Heap2Heap@@0 i@@21 lo@@9 hi@@18 step@@6 vmin@@6 vmax@@6 ar@@18 v_2@@10) (|count_square#condqp3| Heap1Heap@@0 i@@21 lo@@9 hi@@18 step@@6 vmin@@6 vmax@@6 ar@@18 v_2@@10))) Ref__Integer_value)) (U_2_int (MapType0Select Heap1Heap@@0 (|Seq#Index| ar@@18 (|sk_count_square#condqp3| (|count_square#condqp3| Heap2Heap@@0 i@@21 lo@@9 hi@@18 step@@6 vmin@@6 vmax@@6 ar@@18 v_2@@10) (|count_square#condqp3| Heap1Heap@@0 i@@21 lo@@9 hi@@18 step@@6 vmin@@6 vmax@@6 ar@@18 v_2@@10))) Ref__Integer_value)))))) (= (|count_square#condqp3| Heap2Heap@@0 i@@21 lo@@9 hi@@18 step@@6 vmin@@6 vmax@@6 ar@@18 v_2@@10) (|count_square#condqp3| Heap1Heap@@0 i@@21 lo@@9 hi@@18 step@@6 vmin@@6 vmax@@6 ar@@18 v_2@@10)))
 :qid |stdinbpl.1307:15|
 :skolemid |113|
 :pattern ( (|count_square#condqp3| Heap2Heap@@0 i@@21 lo@@9 hi@@18 step@@6 vmin@@6 vmax@@6 ar@@18 v_2@@10) (|count_square#condqp3| Heap1Heap@@0 i@@21 lo@@9 hi@@18 step@@6 vmin@@6 vmax@@6 ar@@18 v_2@@10) (succHeapTrans Heap2Heap@@0 Heap1Heap@@0))
)))
(assert (forall ((a T@U) (b T@U) ) (! (let ((T@@19 (SeqTypeInv0 (type a))))
 (=> (and (and (= (type a) (SeqType T@@19)) (= (type b) (SeqType T@@19))) (|Seq#Equal| a b)) (= a b)))
 :qid |stdinbpl.617:18|
 :skolemid |53|
 :pattern ( (|Seq#Equal| a b))
)))
(assert (forall ((Heap@@23 T@U) (i@@22 Int) (hi@@19 Int) (ar@@19 T@U) ) (!  (=> (and (= (type Heap@@23) (MapType0Type RefType)) (= (type ar@@19) (SeqType intType))) (and (= (sum_list Heap@@23 i@@22 hi@@19 ar@@19) (|sum_list'| Heap@@23 i@@22 hi@@19 ar@@19)) (dummyFunction (int_2_U (|sum_list#triggerStateless| i@@22 hi@@19 ar@@19)))))
 :qid |stdinbpl.668:15|
 :skolemid |58|
 :pattern ( (sum_list Heap@@23 i@@22 hi@@19 ar@@19))
)))
(assert (forall ((s@@8 T@U) (i@@23 Int) ) (! (let ((T@@20 (SeqTypeInv0 (type s@@8))))
 (=> (= (type s@@8) (SeqType T@@20)) (=> (and (<= 0 i@@23) (< i@@23 (|Seq#Length| s@@8))) (|Seq#ContainsTrigger| s@@8 (|Seq#Index| s@@8 i@@23)))))
 :qid |stdinbpl.510:18|
 :skolemid |49|
 :pattern ( (|Seq#Index| s@@8 i@@23))
)))
(assert (forall ((s0@@1 T@U) (s1@@1 T@U) ) (! (let ((T@@21 (SeqTypeInv0 (type s0@@1))))
 (=> (and (= (type s0@@1) (SeqType T@@21)) (= (type s1@@1) (SeqType T@@21))) (and (=> (= s0@@1 (|Seq#Empty| T@@21)) (= (|Seq#Append| s0@@1 s1@@1) s1@@1)) (=> (= s1@@1 (|Seq#Empty| T@@21)) (= (|Seq#Append| s0@@1 s1@@1) s0@@1)))))
 :qid |stdinbpl.329:18|
 :skolemid |27|
 :pattern ( (|Seq#Append| s0@@1 s1@@1))
)))
(assert (forall ((t@@1 T@U) ) (! (= (|Seq#Index| (|Seq#Singleton| t@@1) 0) t@@1)
 :qid |stdinbpl.333:18|
 :skolemid |28|
 :pattern ( (|Seq#Singleton| t@@1))
)))
(assert (forall ((s@@9 T@U) ) (! (let ((T@@22 (SeqTypeInv0 (type s@@9))))
 (=> (= (type s@@9) (SeqType T@@22)) (<= 0 (|Seq#Length| s@@9))))
 :qid |stdinbpl.312:18|
 :skolemid |22|
 :pattern ( (|Seq#Length| s@@9))
)))
(assert (forall ((s0@@2 T@U) (s1@@2 T@U) ) (! (let ((T@@23 (SeqTypeInv0 (type s0@@2))))
 (=> (and (and (= (type s0@@2) (SeqType T@@23)) (= (type s1@@2) (SeqType T@@23))) (|Seq#Equal| s0@@2 s1@@2)) (and (= (|Seq#Length| s0@@2) (|Seq#Length| s1@@2)) (forall ((j@@4 Int) ) (!  (=> (and (<= 0 j@@4) (< j@@4 (|Seq#Length| s0@@2))) (= (|Seq#Index| s0@@2 j@@4) (|Seq#Index| s1@@2 j@@4)))
 :qid |stdinbpl.607:13|
 :skolemid |50|
 :pattern ( (|Seq#Index| s0@@2 j@@4))
 :pattern ( (|Seq#Index| s1@@2 j@@4))
)))))
 :qid |stdinbpl.604:18|
 :skolemid |51|
 :pattern ( (|Seq#Equal| s0@@2 s1@@2))
)))
(assert (forall ((Heap@@24 T@U) (ExhaleHeap@@4 T@U) (Mask@@14 T@U) (pm_f@@1 T@U) ) (! (let ((C@@1 (FieldTypeInv0 (type pm_f@@1))))
 (=> (and (and (and (and (and (= (type Heap@@24) (MapType0Type RefType)) (= (type ExhaleHeap@@4) (MapType0Type RefType))) (= (type Mask@@14) (MapType1Type RefType realType))) (= (type pm_f@@1) (FieldType C@@1 FrameTypeType))) (IdenticalOnKnownLocations Heap@@24 ExhaleHeap@@4 Mask@@14)) (and (HasDirectPerm Mask@@14 null pm_f@@1) (IsPredicateField pm_f@@1))) (forall ((o2 T@U) (f_2@@0 T@U) ) (! (let ((B@@5 (FieldTypeInv1 (type f_2@@0))))
(let ((A@@6 (FieldTypeInv0 (type f_2@@0))))
 (=> (and (and (= (type o2) RefType) (= (type f_2@@0) (FieldType A@@6 B@@5))) (U_2_bool (MapType1Select (MapType0Select Heap@@24 null (PredicateMaskField pm_f@@1)) o2 f_2@@0))) (= (MapType0Select Heap@@24 o2 f_2@@0) (MapType0Select ExhaleHeap@@4 o2 f_2@@0)))))
 :qid |stdinbpl.54:134|
 :skolemid |3|
 :pattern ( (MapType0Select ExhaleHeap@@4 o2 f_2@@0))
))))
 :qid |stdinbpl.52:19|
 :skolemid |4|
 :pattern ( (IdenticalOnKnownLocations Heap@@24 ExhaleHeap@@4 Mask@@14) (IsPredicateField pm_f@@1))
)))
(assert (forall ((Heap@@25 T@U) (ExhaleHeap@@5 T@U) (Mask@@15 T@U) (pm_f@@2 T@U) ) (! (let ((C@@2 (FieldTypeInv0 (type pm_f@@2))))
 (=> (and (and (and (and (and (= (type Heap@@25) (MapType0Type RefType)) (= (type ExhaleHeap@@5) (MapType0Type RefType))) (= (type Mask@@15) (MapType1Type RefType realType))) (= (type pm_f@@2) (FieldType C@@2 FrameTypeType))) (IdenticalOnKnownLocations Heap@@25 ExhaleHeap@@5 Mask@@15)) (and (HasDirectPerm Mask@@15 null pm_f@@2) (IsWandField pm_f@@2))) (forall ((o2@@0 T@U) (f_2@@1 T@U) ) (! (let ((B@@6 (FieldTypeInv1 (type f_2@@1))))
(let ((A@@7 (FieldTypeInv0 (type f_2@@1))))
 (=> (and (and (= (type o2@@0) RefType) (= (type f_2@@1) (FieldType A@@7 B@@6))) (U_2_bool (MapType1Select (MapType0Select Heap@@25 null (WandMaskField pm_f@@2)) o2@@0 f_2@@1))) (= (MapType0Select Heap@@25 o2@@0 f_2@@1) (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1)))))
 :qid |stdinbpl.67:129|
 :skolemid |6|
 :pattern ( (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1))
))))
 :qid |stdinbpl.65:19|
 :skolemid |7|
 :pattern ( (IdenticalOnKnownLocations Heap@@25 ExhaleHeap@@5 Mask@@15) (IsWandField pm_f@@2))
)))
(assert (forall ((t@@2 T@U) ) (! (= (|Seq#Length| (|Seq#Singleton| t@@2)) 1)
 :qid |stdinbpl.320:18|
 :skolemid |25|
 :pattern ( (|Seq#Singleton| t@@2))
)))
(assert (forall ((Mask@@16 T@U) (o_2@@2 T@U) (f_4@@2 T@U) ) (! (let ((B@@7 (FieldTypeInv1 (type f_4@@2))))
(let ((A@@8 (FieldTypeInv0 (type f_4@@2))))
 (=> (and (and (and (= (type Mask@@16) (MapType1Type RefType realType)) (= (type o_2@@2) RefType)) (= (type f_4@@2) (FieldType A@@8 B@@7))) (GoodMask Mask@@16)) (and (>= (U_2_real (MapType1Select Mask@@16 o_2@@2 f_4@@2)) NoPerm) (=> (and (and (GoodMask Mask@@16) (not (IsPredicateField f_4@@2))) (not (IsWandField f_4@@2))) (<= (U_2_real (MapType1Select Mask@@16 o_2@@2 f_4@@2)) FullPerm))))))
 :qid |stdinbpl.128:22|
 :skolemid |16|
 :pattern ( (GoodMask Mask@@16) (MapType1Select Mask@@16 o_2@@2 f_4@@2))
)))
(assert (forall ((Heap@@26 T@U) (Mask@@17 T@U) (i@@24 Int) (hi@@20 Int) (ar@@20 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@26) (MapType0Type RefType)) (= (type Mask@@17) (MapType1Type RefType realType))) (= (type ar@@20) (SeqType intType))) (and (state Heap@@26 Mask@@17) (< AssumeFunctionsAbove 4))) (and (and (<= 0 i@@24) (<= i@@24 hi@@20)) (<= hi@@20 (|Seq#Length| ar@@20)))) (= (sum_list Heap@@26 i@@24 hi@@20 ar@@20) (ite (< i@@24 hi@@20) (+ (U_2_int (|Seq#Index| ar@@20 i@@24)) (|sum_list'| Heap@@26 (+ i@@24 1) hi@@20 ar@@20)) 0)))
 :qid |stdinbpl.678:15|
 :skolemid |60|
 :pattern ( (state Heap@@26 Mask@@17) (sum_list Heap@@26 i@@24 hi@@20 ar@@20))
)))
(assert (forall ((o T@U) (f T@U) (Heap@@27 T@U) ) (!  (=> (and (and (and (= (type o) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap@@27) (MapType0Type RefType))) (U_2_bool (MapType0Select Heap@@27 o $allocated))) (U_2_bool (MapType0Select Heap@@27 (MapType0Select Heap@@27 o f) $allocated)))
 :qid |stdinbpl.31:15|
 :skolemid |0|
 :pattern ( (MapType0Select Heap@@27 o f))
)))
(assert (forall ((s@@10 T@U) (t@@3 T@U) (n@@8 Int) ) (! (let ((T@@24 (SeqTypeInv0 (type s@@10))))
 (=> (and (and (= (type s@@10) (SeqType T@@24)) (= (type t@@3) (SeqType T@@24))) (and (< 0 n@@8) (<= n@@8 (|Seq#Length| s@@10)))) (= (|Seq#Take| (|Seq#Append| s@@10 t@@3) n@@8) (|Seq#Take| s@@10 n@@8))))
 :qid |stdinbpl.462:18|
 :skolemid |41|
 :pattern ( (|Seq#Take| (|Seq#Append| s@@10 t@@3) n@@8))
)))
(assert (forall ((s@@11 T@U) (i@@25 Int) (v@@1 T@U) ) (! (let ((T@@25 (type v@@1)))
 (=> (= (type s@@11) (SeqType T@@25)) (=> (and (<= 0 i@@25) (< i@@25 (|Seq#Length| s@@11))) (= (|Seq#Length| (|Seq#Update| s@@11 i@@25 v@@1)) (|Seq#Length| s@@11)))))
 :qid |stdinbpl.361:18|
 :skolemid |34|
 :pattern ( (|Seq#Length| (|Seq#Update| s@@11 i@@25 v@@1)))
 :pattern ( (|Seq#Length| s@@11) (|Seq#Update| s@@11 i@@25 v@@1))
)))
(assert (forall ((s@@12 T@U) (t@@4 T@U) (n@@9 Int) ) (! (let ((T@@26 (SeqTypeInv0 (type s@@12))))
 (=> (and (and (= (type s@@12) (SeqType T@@26)) (= (type t@@4) (SeqType T@@26))) (and (< 0 n@@9) (<= n@@9 (|Seq#Length| s@@12)))) (= (|Seq#Drop| (|Seq#Append| s@@12 t@@4) n@@9) (|Seq#Append| (|Seq#Drop| s@@12 n@@9) t@@4))))
 :qid |stdinbpl.475:18|
 :skolemid |43|
 :pattern ( (|Seq#Drop| (|Seq#Append| s@@12 t@@4) n@@9))
)))
(assert (forall ((s@@13 T@U) (n@@10 Int) (i@@26 Int) ) (! (let ((T@@27 (SeqTypeInv0 (type s@@13))))
 (=> (= (type s@@13) (SeqType T@@27)) (=> (and (and (< 0 n@@10) (<= n@@10 i@@26)) (< i@@26 (|Seq#Length| s@@13))) (and (= (|Seq#Add| (|Seq#Sub| i@@26 n@@10) n@@10) i@@26) (= (|Seq#Index| (|Seq#Drop| s@@13 n@@10) (|Seq#Sub| i@@26 n@@10)) (|Seq#Index| s@@13 i@@26))))))
 :qid |stdinbpl.412:18|
 :skolemid |40|
 :pattern ( (|Seq#Drop| s@@13 n@@10) (|Seq#Index| s@@13 i@@26))
)))
(assert (forall ((s0@@3 T@U) (s1@@3 T@U) (n@@11 Int) ) (! (let ((T@@28 (SeqTypeInv0 (type s0@@3))))
 (=> (and (= (type s0@@3) (SeqType T@@28)) (= (type s1@@3) (SeqType T@@28))) (=> (and (and (and (not (= s0@@3 (|Seq#Empty| T@@28))) (not (= s1@@3 (|Seq#Empty| T@@28)))) (<= 0 n@@11)) (< n@@11 (|Seq#Length| s0@@3))) (= (|Seq#Index| (|Seq#Append| s0@@3 s1@@3) n@@11) (|Seq#Index| s0@@3 n@@11)))))
 :qid |stdinbpl.352:18|
 :skolemid |31|
 :pattern ( (|Seq#Index| (|Seq#Append| s0@@3 s1@@3) n@@11))
 :pattern ( (|Seq#Index| s0@@3 n@@11) (|Seq#Append| s0@@3 s1@@3))
)))
(assert (forall ((Heap@@28 T@U) (o@@0 T@U) (f_3 T@U) (v@@2 T@U) ) (! (let ((B@@8 (type v@@2)))
(let ((A@@9 (FieldTypeInv0 (type f_3))))
 (=> (and (and (= (type Heap@@28) (MapType0Type RefType)) (= (type o@@0) RefType)) (= (type f_3) (FieldType A@@9 B@@8))) (succHeap Heap@@28 (MapType0Store Heap@@28 o@@0 f_3 v@@2)))))
 :qid |stdinbpl.78:22|
 :skolemid |9|
 :pattern ( (MapType0Store Heap@@28 o@@0 f_3 v@@2))
)))
(assert (forall ((s0@@4 T@U) (s1@@4 T@U) (m@@7 Int) ) (! (let ((T@@29 (SeqTypeInv0 (type s0@@4))))
 (=> (and (= (type s0@@4) (SeqType T@@29)) (= (type s1@@4) (SeqType T@@29))) (=> (and (and (and (not (= s0@@4 (|Seq#Empty| T@@29))) (not (= s1@@4 (|Seq#Empty| T@@29)))) (<= 0 m@@7)) (< m@@7 (|Seq#Length| s1@@4))) (and (= (|Seq#Sub| (|Seq#Add| m@@7 (|Seq#Length| s0@@4)) (|Seq#Length| s0@@4)) m@@7) (= (|Seq#Index| (|Seq#Append| s0@@4 s1@@4) (|Seq#Add| m@@7 (|Seq#Length| s0@@4))) (|Seq#Index| s1@@4 m@@7))))))
 :qid |stdinbpl.357:18|
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
(assert (forall ((Heap@@29 T@U) (Mask@@18 T@U) (i@@27 Int) (lo@@10 Int) (hi@@21 Int) (step@@7 Int) (vmin@@7 Int) (vmax@@7 Int) (ar@@21 T@U) ) (!  (=> (and (and (and (= (type Heap@@29) (MapType0Type RefType)) (= (type Mask@@18) (MapType1Type RefType realType))) (= (type ar@@21) (SeqType RefType))) (state Heap@@29 Mask@@18)) (= (|sum_square'| Heap@@29 i@@27 lo@@10 hi@@21 step@@7 vmin@@7 vmax@@7 ar@@21) (|sum_square#frame| (FrameFragment (int_2_U (|sum_square#condqp2| Heap@@29 i@@27 lo@@10 hi@@21 step@@7 vmin@@7 vmax@@7 ar@@21))) i@@27 lo@@10 hi@@21 step@@7 vmin@@7 vmax@@7 ar@@21)))
 :qid |stdinbpl.1019:15|
 :skolemid |89|
 :pattern ( (state Heap@@29 Mask@@18) (|sum_square'| Heap@@29 i@@27 lo@@10 hi@@21 step@@7 vmin@@7 vmax@@7 ar@@21))
)))
(assert (forall ((s@@14 T@U) (x@@10 T@U) (i@@28 Int) ) (! (let ((T@@30 (type x@@10)))
 (=> (= (type s@@14) (SeqType T@@30)) (=> (and (and (<= 0 i@@28) (< i@@28 (|Seq#Length| s@@14))) (= (|Seq#Index| s@@14 i@@28) x@@10)) (|Seq#Contains| s@@14 x@@10))))
 :qid |stdinbpl.508:18|
 :skolemid |48|
 :pattern ( (|Seq#Contains| s@@14 x@@10) (|Seq#Index| s@@14 i@@28))
)))
(assert (forall ((s0@@5 T@U) (s1@@5 T@U) ) (! (let ((T@@31 (SeqTypeInv0 (type s0@@5))))
 (=> (and (= (type s0@@5) (SeqType T@@31)) (= (type s1@@5) (SeqType T@@31))) (or (or (and (= s0@@5 s1@@5) (|Seq#Equal| s0@@5 s1@@5)) (and (and (not (= s0@@5 s1@@5)) (not (|Seq#Equal| s0@@5 s1@@5))) (not (= (|Seq#Length| s0@@5) (|Seq#Length| s1@@5))))) (and (and (and (and (and (and (not (= s0@@5 s1@@5)) (not (|Seq#Equal| s0@@5 s1@@5))) (= (|Seq#Length| s0@@5) (|Seq#Length| s1@@5))) (= (|Seq#SkolemDiff| s0@@5 s1@@5) (|Seq#SkolemDiff| s1@@5 s0@@5))) (<= 0 (|Seq#SkolemDiff| s0@@5 s1@@5))) (< (|Seq#SkolemDiff| s0@@5 s1@@5) (|Seq#Length| s0@@5))) (not (= (|Seq#Index| s0@@5 (|Seq#SkolemDiff| s0@@5 s1@@5)) (|Seq#Index| s1@@5 (|Seq#SkolemDiff| s0@@5 s1@@5))))))))
 :qid |stdinbpl.612:18|
 :skolemid |52|
 :pattern ( (|Seq#Equal| s0@@5 s1@@5))
)))
(assert (forall ((p@@1 T@U) (v_1@@0 T@U) (q T@U) (w@@0 T@U) (r T@U) (u T@U) ) (! (let ((C@@3 (FieldTypeInv0 (type r))))
(let ((B@@10 (FieldTypeInv0 (type q))))
(let ((A@@11 (FieldTypeInv0 (type p@@1))))
 (=> (and (and (and (and (and (and (= (type p@@1) (FieldType A@@11 FrameTypeType)) (= (type v_1@@0) FrameTypeType)) (= (type q) (FieldType B@@10 FrameTypeType))) (= (type w@@0) FrameTypeType)) (= (type r) (FieldType C@@3 FrameTypeType))) (= (type u) FrameTypeType)) (and (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))) (InsidePredicate p@@1 v_1@@0 r u)))))
 :qid |stdinbpl.281:25|
 :skolemid |20|
 :pattern ( (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))
)))
(assert (forall ((Heap@@30 T@U) (i@@29 Int) (lo@@11 Int) (hi@@22 Int) (step@@8 Int) (vmin@@8 Int) (vmax@@8 Int) (ar@@22 T@U) ) (!  (=> (and (= (type Heap@@30) (MapType0Type RefType)) (= (type ar@@22) (SeqType RefType))) (dummyFunction (int_2_U (|sum_square#triggerStateless| i@@29 lo@@11 hi@@22 step@@8 vmin@@8 vmax@@8 ar@@22))))
 :qid |stdinbpl.1003:15|
 :skolemid |86|
 :pattern ( (|sum_square'| Heap@@30 i@@29 lo@@11 hi@@22 step@@8 vmin@@8 vmax@@8 ar@@22))
)))
(assert (forall ((s@@15 T@U) ) (! (let ((T@@32 (SeqTypeInv0 (type s@@15))))
 (=> (and (= (type s@@15) (SeqType T@@32)) (= (|Seq#Length| s@@15) 0)) (= s@@15 (|Seq#Empty| T@@32))))
 :qid |stdinbpl.316:18|
 :skolemid |24|
 :pattern ( (|Seq#Length| s@@15))
)))
(assert (forall ((s@@16 T@U) (n@@12 Int) ) (! (let ((T@@33 (SeqTypeInv0 (type s@@16))))
 (=> (and (= (type s@@16) (SeqType T@@33)) (<= n@@12 0)) (= (|Seq#Take| s@@16 n@@12) (|Seq#Empty| T@@33))))
 :qid |stdinbpl.491:18|
 :skolemid |46|
 :pattern ( (|Seq#Take| s@@16 n@@12))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
(assert (forall ((Heap@@31 T@U) (Mask@@19 T@U) (i@@30 Int) (lo@@12 Int) (hi@@23 Int) (ar@@23 T@U) ) (!  (=> (and (and (and (= (type Heap@@31) (MapType0Type RefType)) (= (type Mask@@19) (MapType1Type RefType realType))) (= (type ar@@23) (SeqType RefType))) (state Heap@@31 Mask@@19)) (= (|sum_array'| Heap@@31 i@@30 lo@@12 hi@@23 ar@@23) (|sum_array#frame| (FrameFragment (int_2_U (|sum_array#condqp1| Heap@@31 i@@30 lo@@12 hi@@23 ar@@23))) i@@30 lo@@12 hi@@23 ar@@23)))
 :qid |stdinbpl.772:15|
 :skolemid |66|
 :pattern ( (state Heap@@31 Mask@@19) (|sum_array'| Heap@@31 i@@30 lo@@12 hi@@23 ar@@23))
)))
(assert (forall ((Heap@@32 T@U) (Mask@@20 T@U) (i@@31 Int) (hi@@24 Int) (ar@@24 T@U) (v_2@@11 Int) ) (!  (=> (and (and (and (= (type Heap@@32) (MapType0Type RefType)) (= (type Mask@@20) (MapType1Type RefType realType))) (= (type ar@@24) (SeqType RefType))) (state Heap@@32 Mask@@20)) (= (|count_array'| Heap@@32 i@@31 hi@@24 ar@@24 v_2@@11) (|count_array#frame| (FrameFragment (int_2_U (|count_array#condqp4| Heap@@32 i@@31 hi@@24 ar@@24 v_2@@11))) i@@31 hi@@24 ar@@24 v_2@@11)))
 :qid |stdinbpl.1659:15|
 :skolemid |139|
 :pattern ( (state Heap@@32 Mask@@20) (|count_array'| Heap@@32 i@@31 hi@@24 ar@@24 v_2@@11))
)))
(assert (forall ((Heap2Heap@@1 T@U) (Heap1Heap@@1 T@U) (i@@32 Int) (hi@@25 Int) (ar@@25 T@U) (v_2@@12 Int) ) (!  (=> (and (and (and (= (type Heap2Heap@@1) (MapType0Type RefType)) (= (type Heap1Heap@@1) (MapType0Type RefType))) (= (type ar@@25) (SeqType RefType))) (and (=  (and (<= 0 (|sk_count_array#condqp4| (|count_array#condqp4| Heap2Heap@@1 i@@32 hi@@25 ar@@25 v_2@@12) (|count_array#condqp4| Heap1Heap@@1 i@@32 hi@@25 ar@@25 v_2@@12))) (< (|sk_count_array#condqp4| (|count_array#condqp4| Heap2Heap@@1 i@@32 hi@@25 ar@@25 v_2@@12) (|count_array#condqp4| Heap1Heap@@1 i@@32 hi@@25 ar@@25 v_2@@12)) hi@@25))  (and (<= 0 (|sk_count_array#condqp4| (|count_array#condqp4| Heap2Heap@@1 i@@32 hi@@25 ar@@25 v_2@@12) (|count_array#condqp4| Heap1Heap@@1 i@@32 hi@@25 ar@@25 v_2@@12))) (< (|sk_count_array#condqp4| (|count_array#condqp4| Heap2Heap@@1 i@@32 hi@@25 ar@@25 v_2@@12) (|count_array#condqp4| Heap1Heap@@1 i@@32 hi@@25 ar@@25 v_2@@12)) hi@@25))) (=> (and (<= 0 (|sk_count_array#condqp4| (|count_array#condqp4| Heap2Heap@@1 i@@32 hi@@25 ar@@25 v_2@@12) (|count_array#condqp4| Heap1Heap@@1 i@@32 hi@@25 ar@@25 v_2@@12))) (< (|sk_count_array#condqp4| (|count_array#condqp4| Heap2Heap@@1 i@@32 hi@@25 ar@@25 v_2@@12) (|count_array#condqp4| Heap1Heap@@1 i@@32 hi@@25 ar@@25 v_2@@12)) hi@@25)) (= (U_2_int (MapType0Select Heap2Heap@@1 (|Seq#Index| ar@@25 (|sk_count_array#condqp4| (|count_array#condqp4| Heap2Heap@@1 i@@32 hi@@25 ar@@25 v_2@@12) (|count_array#condqp4| Heap1Heap@@1 i@@32 hi@@25 ar@@25 v_2@@12))) Ref__Integer_value)) (U_2_int (MapType0Select Heap1Heap@@1 (|Seq#Index| ar@@25 (|sk_count_array#condqp4| (|count_array#condqp4| Heap2Heap@@1 i@@32 hi@@25 ar@@25 v_2@@12) (|count_array#condqp4| Heap1Heap@@1 i@@32 hi@@25 ar@@25 v_2@@12))) Ref__Integer_value)))))) (= (|count_array#condqp4| Heap2Heap@@1 i@@32 hi@@25 ar@@25 v_2@@12) (|count_array#condqp4| Heap1Heap@@1 i@@32 hi@@25 ar@@25 v_2@@12)))
 :qid |stdinbpl.1669:15|
 :skolemid |140|
 :pattern ( (|count_array#condqp4| Heap2Heap@@1 i@@32 hi@@25 ar@@25 v_2@@12) (|count_array#condqp4| Heap1Heap@@1 i@@32 hi@@25 ar@@25 v_2@@12) (succHeapTrans Heap2Heap@@1 Heap1Heap@@1))
)))
(assert (forall ((Heap2Heap@@2 T@U) (Heap1Heap@@2 T@U) (i@@33 Int) (lo@@13 Int) (hi@@26 Int) (ar@@26 T@U) ) (!  (=> (and (and (and (= (type Heap2Heap@@2) (MapType0Type RefType)) (= (type Heap1Heap@@2) (MapType0Type RefType))) (= (type ar@@26) (SeqType RefType))) (and (=  (and (<= lo@@13 (|sk_sum_array#condqp1| (|sum_array#condqp1| Heap2Heap@@2 i@@33 lo@@13 hi@@26 ar@@26) (|sum_array#condqp1| Heap1Heap@@2 i@@33 lo@@13 hi@@26 ar@@26))) (< (|sk_sum_array#condqp1| (|sum_array#condqp1| Heap2Heap@@2 i@@33 lo@@13 hi@@26 ar@@26) (|sum_array#condqp1| Heap1Heap@@2 i@@33 lo@@13 hi@@26 ar@@26)) hi@@26))  (and (<= lo@@13 (|sk_sum_array#condqp1| (|sum_array#condqp1| Heap2Heap@@2 i@@33 lo@@13 hi@@26 ar@@26) (|sum_array#condqp1| Heap1Heap@@2 i@@33 lo@@13 hi@@26 ar@@26))) (< (|sk_sum_array#condqp1| (|sum_array#condqp1| Heap2Heap@@2 i@@33 lo@@13 hi@@26 ar@@26) (|sum_array#condqp1| Heap1Heap@@2 i@@33 lo@@13 hi@@26 ar@@26)) hi@@26))) (=> (and (<= lo@@13 (|sk_sum_array#condqp1| (|sum_array#condqp1| Heap2Heap@@2 i@@33 lo@@13 hi@@26 ar@@26) (|sum_array#condqp1| Heap1Heap@@2 i@@33 lo@@13 hi@@26 ar@@26))) (< (|sk_sum_array#condqp1| (|sum_array#condqp1| Heap2Heap@@2 i@@33 lo@@13 hi@@26 ar@@26) (|sum_array#condqp1| Heap1Heap@@2 i@@33 lo@@13 hi@@26 ar@@26)) hi@@26)) (= (U_2_int (MapType0Select Heap2Heap@@2 (|Seq#Index| ar@@26 (|sk_sum_array#condqp1| (|sum_array#condqp1| Heap2Heap@@2 i@@33 lo@@13 hi@@26 ar@@26) (|sum_array#condqp1| Heap1Heap@@2 i@@33 lo@@13 hi@@26 ar@@26))) Ref__Integer_value)) (U_2_int (MapType0Select Heap1Heap@@2 (|Seq#Index| ar@@26 (|sk_sum_array#condqp1| (|sum_array#condqp1| Heap2Heap@@2 i@@33 lo@@13 hi@@26 ar@@26) (|sum_array#condqp1| Heap1Heap@@2 i@@33 lo@@13 hi@@26 ar@@26))) Ref__Integer_value)))))) (= (|sum_array#condqp1| Heap2Heap@@2 i@@33 lo@@13 hi@@26 ar@@26) (|sum_array#condqp1| Heap1Heap@@2 i@@33 lo@@13 hi@@26 ar@@26)))
 :qid |stdinbpl.782:15|
 :skolemid |67|
 :pattern ( (|sum_array#condqp1| Heap2Heap@@2 i@@33 lo@@13 hi@@26 ar@@26) (|sum_array#condqp1| Heap1Heap@@2 i@@33 lo@@13 hi@@26 ar@@26) (succHeapTrans Heap2Heap@@2 Heap1Heap@@2))
)))
(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun i_38 () Int)
(declare-fun len () Int)
(declare-fun c () T@U)
(declare-fun QPMask@14 () T@U)
(declare-fun QPMask@2 () T@U)
(declare-fun b_2 () T@U)
(declare-fun PostHeap@0 () T@U)
(declare-fun Heap@@33 () T@U)
(declare-fun i_37 () Int)
(declare-fun a_2 () T@U)
(declare-fun i_36 () Int)
(declare-fun qpRange23 (T@U) Bool)
(declare-fun invRecv23 (T@U) Int)
(declare-fun QPMask@13 () T@U)
(declare-fun i_35 () Int)
(declare-fun qpRange22 (T@U) Bool)
(declare-fun invRecv22 (T@U) Int)
(declare-fun QPMask@12 () T@U)
(declare-fun i_34 () Int)
(declare-fun qpRange21 (T@U) Bool)
(declare-fun invRecv21 (T@U) Int)
(declare-fun i_33 () Int)
(declare-fun i_25 () Int)
(declare-fun ExhaleHeap@0 () T@U)
(declare-fun i_23 () Int)
(declare-fun i_21 () Int)
(declare-fun qpRange32 (T@U) Bool)
(declare-fun invRecv32 (T@U) Int)
(declare-fun QPMask@8 () T@U)
(declare-fun QPMask@7 () T@U)
(declare-fun neverTriggered24 (Int) Bool)
(declare-fun qpRange24 (T@U) Bool)
(declare-fun invRecv24 (T@U) Int)
(declare-fun QPMask@9 () T@U)
(declare-fun neverTriggered25 (Int) Bool)
(declare-fun qpRange25 (T@U) Bool)
(declare-fun invRecv25 (T@U) Int)
(declare-fun QPMask@10 () T@U)
(declare-fun neverTriggered26 (Int) Bool)
(declare-fun qpRange26 (T@U) Bool)
(declare-fun invRecv26 (T@U) Int)
(declare-fun QPMask@11 () T@U)
(declare-fun qpRange31 (T@U) Bool)
(declare-fun invRecv31 (T@U) Int)
(declare-fun QPMask@6 () T@U)
(declare-fun qpRange30 (T@U) Bool)
(declare-fun invRecv30 (T@U) Int)
(declare-fun QPMask@5 () T@U)
(declare-fun neverTriggered29 (Int) Bool)
(declare-fun QPMask@4 () T@U)
(declare-fun qpRange29 (T@U) Bool)
(declare-fun invRecv29 (T@U) Int)
(declare-fun ix_10_1 () Int)
(declare-fun jx_10_1 () Int)
(declare-fun neverTriggered28 (Int) Bool)
(declare-fun QPMask@3 () T@U)
(declare-fun qpRange28 (T@U) Bool)
(declare-fun invRecv28 (T@U) Int)
(declare-fun ix_8_1 () Int)
(declare-fun jx_8_1 () Int)
(declare-fun neverTriggered27 (Int) Bool)
(declare-fun qpRange27 (T@U) Bool)
(declare-fun invRecv27 (T@U) Int)
(declare-fun ix_6_1 () Int)
(declare-fun jx_6_1 () Int)
(declare-fun diz () T@U)
(declare-fun current_thread_id () Int)
(declare-fun qpRange20 (T@U) Bool)
(declare-fun invRecv20 (T@U) Int)
(declare-fun QPMask@1 () T@U)
(declare-fun i_26 () Int)
(declare-fun ix_12 () Int)
(declare-fun jx_12 () Int)
(declare-fun qpRange19 (T@U) Bool)
(declare-fun invRecv19 (T@U) Int)
(declare-fun QPMask@0 () T@U)
(declare-fun i_24 () Int)
(declare-fun ix_11 () Int)
(declare-fun jx_11 () Int)
(declare-fun qpRange18 (T@U) Bool)
(declare-fun invRecv18 (T@U) Int)
(declare-fun i_22 () Int)
(declare-fun ix_10 () Int)
(declare-fun jx_10 () Int)
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (= (type a_2) (SeqType RefType)) (= (type b_2) (SeqType RefType))) (= (type c) (SeqType RefType))) (= (type ExhaleHeap@0) (MapType0Type RefType))) (= (type Heap@@33) (MapType0Type RefType))) (= (type QPMask@8) (MapType1Type RefType realType))) (= (type QPMask@7) (MapType1Type RefType realType))) (= (type QPMask@9) (MapType1Type RefType realType))) (= (type QPMask@10) (MapType1Type RefType realType))) (= (type QPMask@11) (MapType1Type RefType realType))) (= (type QPMask@6) (MapType1Type RefType realType))) (= (type QPMask@5) (MapType1Type RefType realType))) (= (type QPMask@4) (MapType1Type RefType realType))) (= (type QPMask@3) (MapType1Type RefType realType))) (= (type QPMask@2) (MapType1Type RefType realType))) (= (type diz) RefType)) (= (type QPMask@14) (MapType1Type RefType realType))) (= (type PostHeap@0) (MapType0Type RefType))) (= (type QPMask@13) (MapType1Type RefType realType))) (= (type QPMask@12) (MapType1Type RefType realType))) (= (type QPMask@1) (MapType1Type RefType realType))) (= (type QPMask@0) (MapType1Type RefType realType))))
(set-info :boogie-vc-id Ref__vector_add)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 181) (let ((anon48_correct true))
(let ((anon111_Else_correct  (=> (and (not (and (<= 0 i_38) (< i_38 len))) (= (ControlFlow 0 157) 149)) anon48_correct)))
(let ((anon111_Then_correct  (=> (and (<= 0 i_38) (< i_38 len)) (and (=> (= (ControlFlow 0 150) (- 0 156)) (>= i_38 0)) (=> (>= i_38 0) (and (=> (= (ControlFlow 0 150) (- 0 155)) (< i_38 (|Seq#Length| c))) (=> (< i_38 (|Seq#Length| c)) (and (=> (= (ControlFlow 0 150) (- 0 154)) (HasDirectPerm QPMask@14 (|Seq#Index| c i_38) Ref__Integer_value)) (=> (HasDirectPerm QPMask@14 (|Seq#Index| c i_38) Ref__Integer_value) (and (=> (= (ControlFlow 0 150) (- 0 153)) (>= i_38 0)) (=> (>= i_38 0) (and (=> (= (ControlFlow 0 150) (- 0 152)) (< i_38 (|Seq#Length| c))) (=> (< i_38 (|Seq#Length| c)) (and (=> (= (ControlFlow 0 150) (- 0 151)) (HasDirectPerm QPMask@2 (|Seq#Index| c i_38) Ref__Integer_value)) (=> (HasDirectPerm QPMask@2 (|Seq#Index| c i_38) Ref__Integer_value) (=> (= (ControlFlow 0 150) 149) anon48_correct))))))))))))))))
(let ((anon110_Else_correct true))
(let ((anon108_Else_correct  (=> (and (forall ((i_15 Int) ) (!  (=> (and (<= 0 i_15) (< i_15 len)) (= (U_2_int (MapType0Select PostHeap@0 (|Seq#Index| b_2 i_15) Ref__Integer_value)) (U_2_int (MapType0Select Heap@@33 (|Seq#Index| b_2 i_15) Ref__Integer_value))))
 :qid |stdinbpl.3370:20|
 :skolemid |271|
 :pattern ( (|Seq#Index| b_2 i_15))
)) (state PostHeap@0 QPMask@14)) (and (and (=> (= (ControlFlow 0 158) 148) anon110_Else_correct) (=> (= (ControlFlow 0 158) 150) anon111_Then_correct)) (=> (= (ControlFlow 0 158) 157) anon111_Else_correct)))))
(let ((anon44_correct true))
(let ((anon109_Else_correct  (=> (and (not (and (<= 0 i_37) (< i_37 len))) (= (ControlFlow 0 147) 139)) anon44_correct)))
(let ((anon109_Then_correct  (=> (and (<= 0 i_37) (< i_37 len)) (and (=> (= (ControlFlow 0 140) (- 0 146)) (>= i_37 0)) (=> (>= i_37 0) (and (=> (= (ControlFlow 0 140) (- 0 145)) (< i_37 (|Seq#Length| b_2))) (=> (< i_37 (|Seq#Length| b_2)) (and (=> (= (ControlFlow 0 140) (- 0 144)) (HasDirectPerm QPMask@14 (|Seq#Index| b_2 i_37) Ref__Integer_value)) (=> (HasDirectPerm QPMask@14 (|Seq#Index| b_2 i_37) Ref__Integer_value) (and (=> (= (ControlFlow 0 140) (- 0 143)) (>= i_37 0)) (=> (>= i_37 0) (and (=> (= (ControlFlow 0 140) (- 0 142)) (< i_37 (|Seq#Length| b_2))) (=> (< i_37 (|Seq#Length| b_2)) (and (=> (= (ControlFlow 0 140) (- 0 141)) (HasDirectPerm QPMask@2 (|Seq#Index| b_2 i_37) Ref__Integer_value)) (=> (HasDirectPerm QPMask@2 (|Seq#Index| b_2 i_37) Ref__Integer_value) (=> (= (ControlFlow 0 140) 139) anon44_correct))))))))))))))))
(let ((anon106_Else_correct  (=> (and (forall ((i_13_1 Int) ) (!  (=> (and (<= 0 i_13_1) (< i_13_1 len)) (= (U_2_int (MapType0Select PostHeap@0 (|Seq#Index| a_2 i_13_1) Ref__Integer_value)) (+ (U_2_int (MapType0Select PostHeap@0 (|Seq#Index| b_2 i_13_1) Ref__Integer_value)) (U_2_int (MapType0Select PostHeap@0 (|Seq#Index| c i_13_1) Ref__Integer_value)))))
 :qid |stdinbpl.3346:20|
 :skolemid |270|
 :pattern ( (|Seq#Index| a_2 i_13_1))
 :pattern ( (|Seq#Index| b_2 i_13_1))
 :pattern ( (|Seq#Index| c i_13_1))
)) (state PostHeap@0 QPMask@14)) (and (and (=> (= (ControlFlow 0 159) 158) anon108_Else_correct) (=> (= (ControlFlow 0 159) 140) anon109_Then_correct)) (=> (= (ControlFlow 0 159) 147) anon109_Else_correct)))))
(let ((anon40_correct true))
(let ((anon107_Else_correct  (=> (and (not (and (<= 0 i_36) (< i_36 len))) (= (ControlFlow 0 138) 127)) anon40_correct)))
(let ((anon107_Then_correct  (=> (and (<= 0 i_36) (< i_36 len)) (and (=> (= (ControlFlow 0 128) (- 0 137)) (>= i_36 0)) (=> (>= i_36 0) (and (=> (= (ControlFlow 0 128) (- 0 136)) (< i_36 (|Seq#Length| a_2))) (=> (< i_36 (|Seq#Length| a_2)) (and (=> (= (ControlFlow 0 128) (- 0 135)) (HasDirectPerm QPMask@14 (|Seq#Index| a_2 i_36) Ref__Integer_value)) (=> (HasDirectPerm QPMask@14 (|Seq#Index| a_2 i_36) Ref__Integer_value) (and (=> (= (ControlFlow 0 128) (- 0 134)) (>= i_36 0)) (=> (>= i_36 0) (and (=> (= (ControlFlow 0 128) (- 0 133)) (< i_36 (|Seq#Length| b_2))) (=> (< i_36 (|Seq#Length| b_2)) (and (=> (= (ControlFlow 0 128) (- 0 132)) (HasDirectPerm QPMask@14 (|Seq#Index| b_2 i_36) Ref__Integer_value)) (=> (HasDirectPerm QPMask@14 (|Seq#Index| b_2 i_36) Ref__Integer_value) (and (=> (= (ControlFlow 0 128) (- 0 131)) (>= i_36 0)) (=> (>= i_36 0) (and (=> (= (ControlFlow 0 128) (- 0 130)) (< i_36 (|Seq#Length| c))) (=> (< i_36 (|Seq#Length| c)) (and (=> (= (ControlFlow 0 128) (- 0 129)) (HasDirectPerm QPMask@14 (|Seq#Index| c i_36) Ref__Integer_value)) (=> (HasDirectPerm QPMask@14 (|Seq#Index| c i_36) Ref__Integer_value) (=> (= (ControlFlow 0 128) 127) anon40_correct))))))))))))))))))))))
(let ((anon104_Else_correct  (and (=> (= (ControlFlow 0 160) (- 0 162)) (forall ((i_11 Int) (i_11_1 Int) ) (!  (=> (and (and (and (and (not (= i_11 i_11_1)) (and (<= 0 i_11) (< i_11 len))) (and (<= 0 i_11_1) (< i_11_1 len))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= (|Seq#Index| c i_11) (|Seq#Index| c i_11_1))))
 :qid |stdinbpl.3282:15|
 :skolemid |263|
))) (=> (forall ((i_11@@0 Int) (i_11_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_11@@0 i_11_1@@0)) (and (<= 0 i_11@@0) (< i_11@@0 len))) (and (<= 0 i_11_1@@0) (< i_11_1@@0 len))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= (|Seq#Index| c i_11@@0) (|Seq#Index| c i_11_1@@0))))
 :qid |stdinbpl.3282:15|
 :skolemid |263|
)) (=> (and (forall ((i_11@@1 Int) ) (!  (=> (and (and (<= 0 i_11@@1) (< i_11@@1 len)) (< NoPerm (/ (to_real 1) (to_real 2)))) (and (qpRange23 (|Seq#Index| c i_11@@1)) (= (invRecv23 (|Seq#Index| c i_11@@1)) i_11@@1)))
 :qid |stdinbpl.3288:22|
 :skolemid |264|
 :pattern ( (|Seq#Index| c i_11@@1))
 :pattern ( (|Seq#Index| c i_11@@1))
)) (forall ((o_3 T@U) ) (!  (=> (= (type o_3) RefType) (=> (and (and (and (<= 0 (invRecv23 o_3)) (< (invRecv23 o_3) len)) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange23 o_3)) (= (|Seq#Index| c (invRecv23 o_3)) o_3)))
 :qid |stdinbpl.3292:22|
 :skolemid |265|
 :pattern ( (invRecv23 o_3))
))) (and (=> (= (ControlFlow 0 160) (- 0 161)) (forall ((i_11@@2 Int) ) (!  (=> (and (<= 0 i_11@@2) (< i_11@@2 len)) (>= (/ (to_real 1) (to_real 2)) NoPerm))
 :qid |stdinbpl.3298:15|
 :skolemid |266|
 :pattern ( (|Seq#Index| c i_11@@2))
 :pattern ( (|Seq#Index| c i_11@@2))
))) (=> (forall ((i_11@@3 Int) ) (!  (=> (and (<= 0 i_11@@3) (< i_11@@3 len)) (>= (/ (to_real 1) (to_real 2)) NoPerm))
 :qid |stdinbpl.3298:15|
 :skolemid |266|
 :pattern ( (|Seq#Index| c i_11@@3))
 :pattern ( (|Seq#Index| c i_11@@3))
)) (=> (forall ((i_11@@4 Int) ) (!  (=> (and (and (<= 0 i_11@@4) (< i_11@@4 len)) (> (/ (to_real 1) (to_real 2)) NoPerm)) (not (= (|Seq#Index| c i_11@@4) null)))
 :qid |stdinbpl.3304:22|
 :skolemid |267|
 :pattern ( (|Seq#Index| c i_11@@4))
 :pattern ( (|Seq#Index| c i_11@@4))
)) (=> (and (and (forall ((o_3@@0 T@U) ) (!  (=> (= (type o_3@@0) RefType) (and (=> (and (and (and (<= 0 (invRecv23 o_3@@0)) (< (invRecv23 o_3@@0) len)) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange23 o_3@@0)) (and (=> (< NoPerm (/ (to_real 1) (to_real 2))) (= (|Seq#Index| c (invRecv23 o_3@@0)) o_3@@0)) (= (U_2_real (MapType1Select QPMask@14 o_3@@0 Ref__Integer_value)) (+ (U_2_real (MapType1Select QPMask@13 o_3@@0 Ref__Integer_value)) (/ (to_real 1) (to_real 2)))))) (=> (not (and (and (and (<= 0 (invRecv23 o_3@@0)) (< (invRecv23 o_3@@0) len)) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange23 o_3@@0))) (= (U_2_real (MapType1Select QPMask@14 o_3@@0 Ref__Integer_value)) (U_2_real (MapType1Select QPMask@13 o_3@@0 Ref__Integer_value))))))
 :qid |stdinbpl.3310:22|
 :skolemid |268|
 :pattern ( (MapType1Select QPMask@14 o_3@@0 Ref__Integer_value))
)) (forall ((o_3@@1 T@U) (f_5 T@U) ) (! (let ((B@@11 (FieldTypeInv1 (type f_5))))
(let ((A@@12 (FieldTypeInv0 (type f_5))))
 (=> (and (and (= (type o_3@@1) RefType) (= (type f_5) (FieldType A@@12 B@@11))) (not (= f_5 Ref__Integer_value))) (= (U_2_real (MapType1Select QPMask@13 o_3@@1 f_5)) (U_2_real (MapType1Select QPMask@14 o_3@@1 f_5))))))
 :qid |stdinbpl.3314:29|
 :skolemid |269|
 :pattern ( (MapType1Select QPMask@13 o_3@@1 f_5))
 :pattern ( (MapType1Select QPMask@14 o_3@@1 f_5))
))) (and (state PostHeap@0 QPMask@14) (state PostHeap@0 QPMask@14))) (and (and (=> (= (ControlFlow 0 160) 159) anon106_Else_correct) (=> (= (ControlFlow 0 160) 128) anon107_Then_correct)) (=> (= (ControlFlow 0 160) 138) anon107_Else_correct)))))))))))
(let ((anon36_correct true))
(let ((anon105_Else_correct  (=> (and (not (and (<= 0 i_35) (< i_35 len))) (= (ControlFlow 0 126) 122)) anon36_correct)))
(let ((anon105_Then_correct  (=> (and (<= 0 i_35) (< i_35 len)) (and (=> (= (ControlFlow 0 123) (- 0 125)) (>= i_35 0)) (=> (>= i_35 0) (and (=> (= (ControlFlow 0 123) (- 0 124)) (< i_35 (|Seq#Length| c))) (=> (< i_35 (|Seq#Length| c)) (=> (= (ControlFlow 0 123) 122) anon36_correct))))))))
(let ((anon102_Else_correct  (and (=> (= (ControlFlow 0 163) (- 0 165)) (forall ((i_9 Int) (i_9_1 Int) ) (!  (=> (and (and (and (and (not (= i_9 i_9_1)) (and (<= 0 i_9) (< i_9 len))) (and (<= 0 i_9_1) (< i_9_1 len))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= (|Seq#Index| b_2 i_9) (|Seq#Index| b_2 i_9_1))))
 :qid |stdinbpl.3228:15|
 :skolemid |256|
))) (=> (forall ((i_9@@0 Int) (i_9_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_9@@0 i_9_1@@0)) (and (<= 0 i_9@@0) (< i_9@@0 len))) (and (<= 0 i_9_1@@0) (< i_9_1@@0 len))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= (|Seq#Index| b_2 i_9@@0) (|Seq#Index| b_2 i_9_1@@0))))
 :qid |stdinbpl.3228:15|
 :skolemid |256|
)) (=> (and (forall ((i_9@@1 Int) ) (!  (=> (and (and (<= 0 i_9@@1) (< i_9@@1 len)) (< NoPerm (/ (to_real 1) (to_real 2)))) (and (qpRange22 (|Seq#Index| b_2 i_9@@1)) (= (invRecv22 (|Seq#Index| b_2 i_9@@1)) i_9@@1)))
 :qid |stdinbpl.3234:22|
 :skolemid |257|
 :pattern ( (|Seq#Index| b_2 i_9@@1))
 :pattern ( (|Seq#Index| b_2 i_9@@1))
)) (forall ((o_3@@2 T@U) ) (!  (=> (= (type o_3@@2) RefType) (=> (and (and (and (<= 0 (invRecv22 o_3@@2)) (< (invRecv22 o_3@@2) len)) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange22 o_3@@2)) (= (|Seq#Index| b_2 (invRecv22 o_3@@2)) o_3@@2)))
 :qid |stdinbpl.3238:22|
 :skolemid |258|
 :pattern ( (invRecv22 o_3@@2))
))) (and (=> (= (ControlFlow 0 163) (- 0 164)) (forall ((i_9@@2 Int) ) (!  (=> (and (<= 0 i_9@@2) (< i_9@@2 len)) (>= (/ (to_real 1) (to_real 2)) NoPerm))
 :qid |stdinbpl.3244:15|
 :skolemid |259|
 :pattern ( (|Seq#Index| b_2 i_9@@2))
 :pattern ( (|Seq#Index| b_2 i_9@@2))
))) (=> (forall ((i_9@@3 Int) ) (!  (=> (and (<= 0 i_9@@3) (< i_9@@3 len)) (>= (/ (to_real 1) (to_real 2)) NoPerm))
 :qid |stdinbpl.3244:15|
 :skolemid |259|
 :pattern ( (|Seq#Index| b_2 i_9@@3))
 :pattern ( (|Seq#Index| b_2 i_9@@3))
)) (=> (forall ((i_9@@4 Int) ) (!  (=> (and (and (<= 0 i_9@@4) (< i_9@@4 len)) (> (/ (to_real 1) (to_real 2)) NoPerm)) (not (= (|Seq#Index| b_2 i_9@@4) null)))
 :qid |stdinbpl.3250:22|
 :skolemid |260|
 :pattern ( (|Seq#Index| b_2 i_9@@4))
 :pattern ( (|Seq#Index| b_2 i_9@@4))
)) (=> (and (forall ((o_3@@3 T@U) ) (!  (=> (= (type o_3@@3) RefType) (and (=> (and (and (and (<= 0 (invRecv22 o_3@@3)) (< (invRecv22 o_3@@3) len)) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange22 o_3@@3)) (and (=> (< NoPerm (/ (to_real 1) (to_real 2))) (= (|Seq#Index| b_2 (invRecv22 o_3@@3)) o_3@@3)) (= (U_2_real (MapType1Select QPMask@13 o_3@@3 Ref__Integer_value)) (+ (U_2_real (MapType1Select QPMask@12 o_3@@3 Ref__Integer_value)) (/ (to_real 1) (to_real 2)))))) (=> (not (and (and (and (<= 0 (invRecv22 o_3@@3)) (< (invRecv22 o_3@@3) len)) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange22 o_3@@3))) (= (U_2_real (MapType1Select QPMask@13 o_3@@3 Ref__Integer_value)) (U_2_real (MapType1Select QPMask@12 o_3@@3 Ref__Integer_value))))))
 :qid |stdinbpl.3256:22|
 :skolemid |261|
 :pattern ( (MapType1Select QPMask@13 o_3@@3 Ref__Integer_value))
)) (forall ((o_3@@4 T@U) (f_5@@0 T@U) ) (! (let ((B@@12 (FieldTypeInv1 (type f_5@@0))))
(let ((A@@13 (FieldTypeInv0 (type f_5@@0))))
 (=> (and (and (= (type o_3@@4) RefType) (= (type f_5@@0) (FieldType A@@13 B@@12))) (not (= f_5@@0 Ref__Integer_value))) (= (U_2_real (MapType1Select QPMask@12 o_3@@4 f_5@@0)) (U_2_real (MapType1Select QPMask@13 o_3@@4 f_5@@0))))))
 :qid |stdinbpl.3260:29|
 :skolemid |262|
 :pattern ( (MapType1Select QPMask@12 o_3@@4 f_5@@0))
 :pattern ( (MapType1Select QPMask@13 o_3@@4 f_5@@0))
))) (=> (and (and (state PostHeap@0 QPMask@13) (state PostHeap@0 QPMask@13)) (and (= (|Seq#Length| c) len) (state PostHeap@0 QPMask@13))) (and (and (=> (= (ControlFlow 0 163) 160) anon104_Else_correct) (=> (= (ControlFlow 0 163) 123) anon105_Then_correct)) (=> (= (ControlFlow 0 163) 126) anon105_Else_correct))))))))))))
(let ((anon32_correct true))
(let ((anon103_Else_correct  (=> (and (not (and (<= 0 i_34) (< i_34 len))) (= (ControlFlow 0 121) 117)) anon32_correct)))
(let ((anon103_Then_correct  (=> (and (<= 0 i_34) (< i_34 len)) (and (=> (= (ControlFlow 0 118) (- 0 120)) (>= i_34 0)) (=> (>= i_34 0) (and (=> (= (ControlFlow 0 118) (- 0 119)) (< i_34 (|Seq#Length| b_2))) (=> (< i_34 (|Seq#Length| b_2)) (=> (= (ControlFlow 0 118) 117) anon32_correct))))))))
(let ((anon100_Else_correct  (and (=> (= (ControlFlow 0 166) (- 0 167)) (forall ((i_7 Int) (i_7_1 Int) ) (!  (=> (and (and (and (and (not (= i_7 i_7_1)) (and (<= 0 i_7) (< i_7 len))) (and (<= 0 i_7_1) (< i_7_1 len))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| a_2 i_7) (|Seq#Index| a_2 i_7_1))))
 :qid |stdinbpl.3180:15|
 :skolemid |250|
))) (=> (forall ((i_7@@0 Int) (i_7_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_7@@0 i_7_1@@0)) (and (<= 0 i_7@@0) (< i_7@@0 len))) (and (<= 0 i_7_1@@0) (< i_7_1@@0 len))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| a_2 i_7@@0) (|Seq#Index| a_2 i_7_1@@0))))
 :qid |stdinbpl.3180:15|
 :skolemid |250|
)) (=> (forall ((i_7@@1 Int) ) (!  (=> (and (and (<= 0 i_7@@1) (< i_7@@1 len)) (< NoPerm FullPerm)) (and (qpRange21 (|Seq#Index| a_2 i_7@@1)) (= (invRecv21 (|Seq#Index| a_2 i_7@@1)) i_7@@1)))
 :qid |stdinbpl.3186:22|
 :skolemid |251|
 :pattern ( (|Seq#Index| a_2 i_7@@1))
 :pattern ( (|Seq#Index| a_2 i_7@@1))
)) (=> (and (and (and (forall ((o_3@@5 T@U) ) (!  (=> (= (type o_3@@5) RefType) (=> (and (and (and (<= 0 (invRecv21 o_3@@5)) (< (invRecv21 o_3@@5) len)) (< NoPerm FullPerm)) (qpRange21 o_3@@5)) (= (|Seq#Index| a_2 (invRecv21 o_3@@5)) o_3@@5)))
 :qid |stdinbpl.3190:22|
 :skolemid |252|
 :pattern ( (invRecv21 o_3@@5))
)) (forall ((i_7@@2 Int) ) (!  (=> (and (<= 0 i_7@@2) (< i_7@@2 len)) (not (= (|Seq#Index| a_2 i_7@@2) null)))
 :qid |stdinbpl.3196:22|
 :skolemid |253|
 :pattern ( (|Seq#Index| a_2 i_7@@2))
 :pattern ( (|Seq#Index| a_2 i_7@@2))
))) (and (forall ((o_3@@6 T@U) ) (!  (=> (= (type o_3@@6) RefType) (and (=> (and (and (and (<= 0 (invRecv21 o_3@@6)) (< (invRecv21 o_3@@6) len)) (< NoPerm FullPerm)) (qpRange21 o_3@@6)) (and (=> (< NoPerm FullPerm) (= (|Seq#Index| a_2 (invRecv21 o_3@@6)) o_3@@6)) (= (U_2_real (MapType1Select QPMask@12 o_3@@6 Ref__Integer_value)) (+ (U_2_real (MapType1Select ZeroMask o_3@@6 Ref__Integer_value)) FullPerm)))) (=> (not (and (and (and (<= 0 (invRecv21 o_3@@6)) (< (invRecv21 o_3@@6) len)) (< NoPerm FullPerm)) (qpRange21 o_3@@6))) (= (U_2_real (MapType1Select QPMask@12 o_3@@6 Ref__Integer_value)) (U_2_real (MapType1Select ZeroMask o_3@@6 Ref__Integer_value))))))
 :qid |stdinbpl.3202:22|
 :skolemid |254|
 :pattern ( (MapType1Select QPMask@12 o_3@@6 Ref__Integer_value))
)) (forall ((o_3@@7 T@U) (f_5@@1 T@U) ) (! (let ((B@@13 (FieldTypeInv1 (type f_5@@1))))
(let ((A@@14 (FieldTypeInv0 (type f_5@@1))))
 (=> (and (and (= (type o_3@@7) RefType) (= (type f_5@@1) (FieldType A@@14 B@@13))) (not (= f_5@@1 Ref__Integer_value))) (= (U_2_real (MapType1Select ZeroMask o_3@@7 f_5@@1)) (U_2_real (MapType1Select QPMask@12 o_3@@7 f_5@@1))))))
 :qid |stdinbpl.3206:29|
 :skolemid |255|
 :pattern ( (MapType1Select ZeroMask o_3@@7 f_5@@1))
 :pattern ( (MapType1Select QPMask@12 o_3@@7 f_5@@1))
)))) (and (and (state PostHeap@0 QPMask@12) (state PostHeap@0 QPMask@12)) (and (= (|Seq#Length| b_2) len) (state PostHeap@0 QPMask@12)))) (and (and (=> (= (ControlFlow 0 166) 163) anon102_Else_correct) (=> (= (ControlFlow 0 166) 118) anon103_Then_correct)) (=> (= (ControlFlow 0 166) 121) anon103_Else_correct))))))))
(let ((anon28_correct true))
(let ((anon101_Else_correct  (=> (and (not (and (<= 0 i_33) (< i_33 len))) (= (ControlFlow 0 116) 112)) anon28_correct)))
(let ((anon101_Then_correct  (=> (and (<= 0 i_33) (< i_33 len)) (and (=> (= (ControlFlow 0 113) (- 0 115)) (>= i_33 0)) (=> (>= i_33 0) (and (=> (= (ControlFlow 0 113) (- 0 114)) (< i_33 (|Seq#Length| a_2))) (=> (< i_33 (|Seq#Length| a_2)) (=> (= (ControlFlow 0 113) 112) anon28_correct))))))))
(let ((anon99_Then_correct  (=> (state PostHeap@0 ZeroMask) (=> (and (= (|Seq#Length| a_2) len) (state PostHeap@0 ZeroMask)) (and (and (=> (= (ControlFlow 0 168) 166) anon100_Else_correct) (=> (= (ControlFlow 0 168) 113) anon101_Then_correct)) (=> (= (ControlFlow 0 168) 116) anon101_Else_correct))))))
(let ((anon85_correct true))
(let ((anon129_Else_correct  (=> (and (not (and (<= 0 i_25) (< i_25 len))) (= (ControlFlow 0 61) 58)) anon85_correct)))
(let ((anon129_Then_correct  (=> (and (<= 0 i_25) (< i_25 len)) (and (=> (= (ControlFlow 0 59) (- 0 60)) (= (U_2_int (MapType0Select ExhaleHeap@0 (|Seq#Index| c i_25) Ref__Integer_value)) (U_2_int (MapType0Select Heap@@33 (|Seq#Index| c i_25) Ref__Integer_value)))) (=> (= (U_2_int (MapType0Select ExhaleHeap@0 (|Seq#Index| c i_25) Ref__Integer_value)) (U_2_int (MapType0Select Heap@@33 (|Seq#Index| c i_25) Ref__Integer_value))) (=> (= (ControlFlow 0 59) 58) anon85_correct))))))
(let ((anon128_Else_correct true))
(let ((anon126_Else_correct  (=> (forall ((i_24_1 Int) ) (!  (=> (and (<= 0 i_24_1) (< i_24_1 len)) (= (U_2_int (MapType0Select ExhaleHeap@0 (|Seq#Index| b_2 i_24_1) Ref__Integer_value)) (U_2_int (MapType0Select Heap@@33 (|Seq#Index| b_2 i_24_1) Ref__Integer_value))))
 :qid |stdinbpl.3892:20|
 :skolemid |340|
 :pattern ( (|Seq#Index| b_2 i_24_1))
)) (and (and (=> (= (ControlFlow 0 62) 57) anon128_Else_correct) (=> (= (ControlFlow 0 62) 59) anon129_Then_correct)) (=> (= (ControlFlow 0 62) 61) anon129_Else_correct)))))
(let ((anon81_correct true))
(let ((anon127_Else_correct  (=> (and (not (and (<= 0 i_23) (< i_23 len))) (= (ControlFlow 0 56) 53)) anon81_correct)))
(let ((anon127_Then_correct  (=> (and (<= 0 i_23) (< i_23 len)) (and (=> (= (ControlFlow 0 54) (- 0 55)) (= (U_2_int (MapType0Select ExhaleHeap@0 (|Seq#Index| b_2 i_23) Ref__Integer_value)) (U_2_int (MapType0Select Heap@@33 (|Seq#Index| b_2 i_23) Ref__Integer_value)))) (=> (= (U_2_int (MapType0Select ExhaleHeap@0 (|Seq#Index| b_2 i_23) Ref__Integer_value)) (U_2_int (MapType0Select Heap@@33 (|Seq#Index| b_2 i_23) Ref__Integer_value))) (=> (= (ControlFlow 0 54) 53) anon81_correct))))))
(let ((anon124_Else_correct  (=> (forall ((i_22_1 Int) ) (!  (=> (and (<= 0 i_22_1) (< i_22_1 len)) (= (U_2_int (MapType0Select ExhaleHeap@0 (|Seq#Index| a_2 i_22_1) Ref__Integer_value)) (+ (U_2_int (MapType0Select ExhaleHeap@0 (|Seq#Index| b_2 i_22_1) Ref__Integer_value)) (U_2_int (MapType0Select ExhaleHeap@0 (|Seq#Index| c i_22_1) Ref__Integer_value)))))
 :qid |stdinbpl.3881:20|
 :skolemid |339|
 :pattern ( (|Seq#Index| a_2 i_22_1))
 :pattern ( (|Seq#Index| b_2 i_22_1))
 :pattern ( (|Seq#Index| c i_22_1))
)) (and (and (=> (= (ControlFlow 0 63) 62) anon126_Else_correct) (=> (= (ControlFlow 0 63) 54) anon127_Then_correct)) (=> (= (ControlFlow 0 63) 56) anon127_Else_correct)))))
(let ((anon77_correct true))
(let ((anon125_Else_correct  (=> (and (not (and (<= 0 i_21) (< i_21 len))) (= (ControlFlow 0 52) 49)) anon77_correct)))
(let ((anon125_Then_correct  (=> (and (<= 0 i_21) (< i_21 len)) (and (=> (= (ControlFlow 0 50) (- 0 51)) (= (U_2_int (MapType0Select ExhaleHeap@0 (|Seq#Index| a_2 i_21) Ref__Integer_value)) (+ (U_2_int (MapType0Select ExhaleHeap@0 (|Seq#Index| b_2 i_21) Ref__Integer_value)) (U_2_int (MapType0Select ExhaleHeap@0 (|Seq#Index| c i_21) Ref__Integer_value))))) (=> (= (U_2_int (MapType0Select ExhaleHeap@0 (|Seq#Index| a_2 i_21) Ref__Integer_value)) (+ (U_2_int (MapType0Select ExhaleHeap@0 (|Seq#Index| b_2 i_21) Ref__Integer_value)) (U_2_int (MapType0Select ExhaleHeap@0 (|Seq#Index| c i_21) Ref__Integer_value)))) (=> (= (ControlFlow 0 50) 49) anon77_correct))))))
(let ((anon74_correct  (and (=> (= (ControlFlow 0 64) (- 0 77)) (forall ((i_32 Int) (i_32_1 Int) ) (!  (=> (and (and (and (and (not (= i_32 i_32_1)) (and (<= 0 i_32) (< i_32 len))) (and (<= 0 i_32_1) (< i_32_1 len))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= (|Seq#Index| c i_32) (|Seq#Index| c i_32_1))))
 :qid |stdinbpl.3681:17|
 :skolemid |309|
))) (=> (forall ((i_32@@0 Int) (i_32_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_32@@0 i_32_1@@0)) (and (<= 0 i_32@@0) (< i_32@@0 len))) (and (<= 0 i_32_1@@0) (< i_32_1@@0 len))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= (|Seq#Index| c i_32@@0) (|Seq#Index| c i_32_1@@0))))
 :qid |stdinbpl.3681:17|
 :skolemid |309|
)) (=> (and (forall ((i_32@@1 Int) ) (!  (=> (and (and (<= 0 i_32@@1) (< i_32@@1 len)) (< NoPerm (/ (to_real 1) (to_real 2)))) (and (qpRange32 (|Seq#Index| c i_32@@1)) (= (invRecv32 (|Seq#Index| c i_32@@1)) i_32@@1)))
 :qid |stdinbpl.3687:24|
 :skolemid |310|
 :pattern ( (|Seq#Index| c i_32@@1))
 :pattern ( (|Seq#Index| c i_32@@1))
)) (forall ((o_3@@8 T@U) ) (!  (=> (= (type o_3@@8) RefType) (=> (and (and (and (<= 0 (invRecv32 o_3@@8)) (< (invRecv32 o_3@@8) len)) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange32 o_3@@8)) (= (|Seq#Index| c (invRecv32 o_3@@8)) o_3@@8)))
 :qid |stdinbpl.3691:24|
 :skolemid |311|
 :pattern ( (invRecv32 o_3@@8))
))) (and (=> (= (ControlFlow 0 64) (- 0 76)) (forall ((i_32@@2 Int) ) (!  (=> (and (<= 0 i_32@@2) (< i_32@@2 len)) (>= (/ (to_real 1) (to_real 2)) NoPerm))
 :qid |stdinbpl.3697:17|
 :skolemid |312|
 :pattern ( (|Seq#Index| c i_32@@2))
 :pattern ( (|Seq#Index| c i_32@@2))
))) (=> (forall ((i_32@@3 Int) ) (!  (=> (and (<= 0 i_32@@3) (< i_32@@3 len)) (>= (/ (to_real 1) (to_real 2)) NoPerm))
 :qid |stdinbpl.3697:17|
 :skolemid |312|
 :pattern ( (|Seq#Index| c i_32@@3))
 :pattern ( (|Seq#Index| c i_32@@3))
)) (=> (forall ((i_32@@4 Int) ) (!  (=> (and (and (<= 0 i_32@@4) (< i_32@@4 len)) (> (/ (to_real 1) (to_real 2)) NoPerm)) (not (= (|Seq#Index| c i_32@@4) null)))
 :qid |stdinbpl.3703:24|
 :skolemid |313|
 :pattern ( (|Seq#Index| c i_32@@4))
 :pattern ( (|Seq#Index| c i_32@@4))
)) (=> (and (and (and (forall ((o_3@@9 T@U) ) (!  (=> (= (type o_3@@9) RefType) (and (=> (and (and (and (<= 0 (invRecv32 o_3@@9)) (< (invRecv32 o_3@@9) len)) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange32 o_3@@9)) (and (=> (< NoPerm (/ (to_real 1) (to_real 2))) (= (|Seq#Index| c (invRecv32 o_3@@9)) o_3@@9)) (= (U_2_real (MapType1Select QPMask@8 o_3@@9 Ref__Integer_value)) (+ (U_2_real (MapType1Select QPMask@7 o_3@@9 Ref__Integer_value)) (/ (to_real 1) (to_real 2)))))) (=> (not (and (and (and (<= 0 (invRecv32 o_3@@9)) (< (invRecv32 o_3@@9) len)) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange32 o_3@@9))) (= (U_2_real (MapType1Select QPMask@8 o_3@@9 Ref__Integer_value)) (U_2_real (MapType1Select QPMask@7 o_3@@9 Ref__Integer_value))))))
 :qid |stdinbpl.3709:24|
 :skolemid |314|
 :pattern ( (MapType1Select QPMask@8 o_3@@9 Ref__Integer_value))
)) (forall ((o_3@@10 T@U) (f_5@@2 T@U) ) (! (let ((B@@14 (FieldTypeInv1 (type f_5@@2))))
(let ((A@@15 (FieldTypeInv0 (type f_5@@2))))
 (=> (and (and (= (type o_3@@10) RefType) (= (type f_5@@2) (FieldType A@@15 B@@14))) (not (= f_5@@2 Ref__Integer_value))) (= (U_2_real (MapType1Select QPMask@7 o_3@@10 f_5@@2)) (U_2_real (MapType1Select QPMask@8 o_3@@10 f_5@@2))))))
 :qid |stdinbpl.3713:31|
 :skolemid |315|
 :pattern ( (MapType1Select QPMask@7 o_3@@10 f_5@@2))
 :pattern ( (MapType1Select QPMask@8 o_3@@10 f_5@@2))
))) (and (state ExhaleHeap@0 QPMask@8) (forall ((i_33_1 Int) ) (!  (=> (and (<= 0 i_33_1) (< i_33_1 len)) (= (U_2_int (MapType0Select ExhaleHeap@0 (|Seq#Index| b_2 i_33_1) Ref__Integer_value)) (U_2_int (MapType0Select Heap@@33 (|Seq#Index| b_2 i_33_1) Ref__Integer_value))))
 :qid |stdinbpl.3719:22|
 :skolemid |316|
 :pattern ( (|Seq#Index| b_2 i_33_1))
)))) (and (and (forall ((i_34_1 Int) ) (!  (=> (and (<= 0 i_34_1) (< i_34_1 len)) (= (U_2_int (MapType0Select ExhaleHeap@0 (|Seq#Index| c i_34_1) Ref__Integer_value)) (U_2_int (MapType0Select Heap@@33 (|Seq#Index| c i_34_1) Ref__Integer_value))))
 :qid |stdinbpl.3723:22|
 :skolemid |317|
 :pattern ( (|Seq#Index| c i_34_1))
)) (forall ((i_35_1 Int) ) (!  (=> (and (<= 0 i_35_1) (< i_35_1 len)) (= (U_2_int (MapType0Select ExhaleHeap@0 (|Seq#Index| a_2 i_35_1) Ref__Integer_value)) (+ (U_2_int (MapType0Select ExhaleHeap@0 (|Seq#Index| b_2 i_35_1) Ref__Integer_value)) (U_2_int (MapType0Select ExhaleHeap@0 (|Seq#Index| c i_35_1) Ref__Integer_value)))))
 :qid |stdinbpl.3727:22|
 :skolemid |318|
 :pattern ( (|Seq#Index| a_2 i_35_1))
 :pattern ( (|Seq#Index| b_2 i_35_1))
 :pattern ( (|Seq#Index| c i_35_1))
))) (and (state ExhaleHeap@0 QPMask@8) (state ExhaleHeap@0 QPMask@8)))) (and (=> (= (ControlFlow 0 64) (- 0 75)) (= (|Seq#Length| a_2) len)) (=> (= (|Seq#Length| a_2) len) (and (=> (= (ControlFlow 0 64) (- 0 74)) (forall ((i_18 Int) (i_18_1 Int) ) (!  (=> (and (and (and (and (not (= i_18 i_18_1)) (and (<= 0 i_18) (< i_18 len))) (and (<= 0 i_18_1) (< i_18_1 len))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| a_2 i_18) (|Seq#Index| a_2 i_18_1))))
 :qid |stdinbpl.3746:17|
 :skolemid |319|
 :pattern ( (neverTriggered24 i_18) (neverTriggered24 i_18_1))
))) (=> (forall ((i_18@@0 Int) (i_18_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_18@@0 i_18_1@@0)) (and (<= 0 i_18@@0) (< i_18@@0 len))) (and (<= 0 i_18_1@@0) (< i_18_1@@0 len))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| a_2 i_18@@0) (|Seq#Index| a_2 i_18_1@@0))))
 :qid |stdinbpl.3746:17|
 :skolemid |319|
 :pattern ( (neverTriggered24 i_18@@0) (neverTriggered24 i_18_1@@0))
)) (and (=> (= (ControlFlow 0 64) (- 0 73)) (forall ((i_18@@1 Int) ) (!  (=> (and (<= 0 i_18@@1) (< i_18@@1 len)) (>= (U_2_real (MapType1Select QPMask@8 (|Seq#Index| a_2 i_18@@1) Ref__Integer_value)) FullPerm))
 :qid |stdinbpl.3753:17|
 :skolemid |320|
 :pattern ( (|Seq#Index| a_2 i_18@@1))
 :pattern ( (|Seq#Index| a_2 i_18@@1))
))) (=> (forall ((i_18@@2 Int) ) (!  (=> (and (<= 0 i_18@@2) (< i_18@@2 len)) (>= (U_2_real (MapType1Select QPMask@8 (|Seq#Index| a_2 i_18@@2) Ref__Integer_value)) FullPerm))
 :qid |stdinbpl.3753:17|
 :skolemid |320|
 :pattern ( (|Seq#Index| a_2 i_18@@2))
 :pattern ( (|Seq#Index| a_2 i_18@@2))
)) (=> (and (and (forall ((i_18@@3 Int) ) (!  (=> (and (and (<= 0 i_18@@3) (< i_18@@3 len)) (< NoPerm FullPerm)) (and (qpRange24 (|Seq#Index| a_2 i_18@@3)) (= (invRecv24 (|Seq#Index| a_2 i_18@@3)) i_18@@3)))
 :qid |stdinbpl.3759:22|
 :skolemid |321|
 :pattern ( (|Seq#Index| a_2 i_18@@3))
 :pattern ( (|Seq#Index| a_2 i_18@@3))
)) (forall ((o_3@@11 T@U) ) (!  (=> (= (type o_3@@11) RefType) (=> (and (and (<= 0 (invRecv24 o_3@@11)) (< (invRecv24 o_3@@11) len)) (and (< NoPerm FullPerm) (qpRange24 o_3@@11))) (= (|Seq#Index| a_2 (invRecv24 o_3@@11)) o_3@@11)))
 :qid |stdinbpl.3763:22|
 :skolemid |322|
 :pattern ( (invRecv24 o_3@@11))
))) (and (forall ((o_3@@12 T@U) ) (!  (=> (= (type o_3@@12) RefType) (and (=> (and (and (<= 0 (invRecv24 o_3@@12)) (< (invRecv24 o_3@@12) len)) (and (< NoPerm FullPerm) (qpRange24 o_3@@12))) (and (= (|Seq#Index| a_2 (invRecv24 o_3@@12)) o_3@@12) (= (U_2_real (MapType1Select QPMask@9 o_3@@12 Ref__Integer_value)) (- (U_2_real (MapType1Select QPMask@8 o_3@@12 Ref__Integer_value)) FullPerm)))) (=> (not (and (and (<= 0 (invRecv24 o_3@@12)) (< (invRecv24 o_3@@12) len)) (and (< NoPerm FullPerm) (qpRange24 o_3@@12)))) (= (U_2_real (MapType1Select QPMask@9 o_3@@12 Ref__Integer_value)) (U_2_real (MapType1Select QPMask@8 o_3@@12 Ref__Integer_value))))))
 :qid |stdinbpl.3769:22|
 :skolemid |323|
 :pattern ( (MapType1Select QPMask@9 o_3@@12 Ref__Integer_value))
)) (forall ((o_3@@13 T@U) (f_5@@3 T@U) ) (! (let ((B@@15 (FieldTypeInv1 (type f_5@@3))))
(let ((A@@16 (FieldTypeInv0 (type f_5@@3))))
 (=> (and (and (= (type o_3@@13) RefType) (= (type f_5@@3) (FieldType A@@16 B@@15))) (not (= f_5@@3 Ref__Integer_value))) (= (U_2_real (MapType1Select QPMask@8 o_3@@13 f_5@@3)) (U_2_real (MapType1Select QPMask@9 o_3@@13 f_5@@3))))))
 :qid |stdinbpl.3775:29|
 :skolemid |324|
 :pattern ( (MapType1Select QPMask@9 o_3@@13 f_5@@3))
)))) (and (=> (= (ControlFlow 0 64) (- 0 72)) (= (|Seq#Length| b_2) len)) (=> (= (|Seq#Length| b_2) len) (and (=> (= (ControlFlow 0 64) (- 0 71)) (forall ((i_19 Int) ) (!  (=> (and (and (<= 0 i_19) (< i_19 len)) (dummyFunction (MapType0Select ExhaleHeap@0 (|Seq#Index| b_2 i_19) Ref__Integer_value))) (>= (/ (to_real 1) (to_real 2)) NoPerm))
 :qid |stdinbpl.3786:17|
 :skolemid |325|
 :pattern ( (|Seq#Index| b_2 i_19))
 :pattern ( (|Seq#Index| b_2 i_19))
))) (=> (forall ((i_19@@0 Int) ) (!  (=> (and (and (<= 0 i_19@@0) (< i_19@@0 len)) (dummyFunction (MapType0Select ExhaleHeap@0 (|Seq#Index| b_2 i_19@@0) Ref__Integer_value))) (>= (/ (to_real 1) (to_real 2)) NoPerm))
 :qid |stdinbpl.3786:17|
 :skolemid |325|
 :pattern ( (|Seq#Index| b_2 i_19@@0))
 :pattern ( (|Seq#Index| b_2 i_19@@0))
)) (and (=> (= (ControlFlow 0 64) (- 0 70)) (forall ((i_19@@1 Int) (i_19_1 Int) ) (!  (=> (and (and (and (and (not (= i_19@@1 i_19_1)) (and (<= 0 i_19@@1) (< i_19@@1 len))) (and (<= 0 i_19_1) (< i_19_1 len))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= (|Seq#Index| b_2 i_19@@1) (|Seq#Index| b_2 i_19_1))))
 :qid |stdinbpl.3793:17|
 :skolemid |326|
 :pattern ( (neverTriggered25 i_19@@1) (neverTriggered25 i_19_1))
))) (=> (forall ((i_19@@2 Int) (i_19_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_19@@2 i_19_1@@0)) (and (<= 0 i_19@@2) (< i_19@@2 len))) (and (<= 0 i_19_1@@0) (< i_19_1@@0 len))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= (|Seq#Index| b_2 i_19@@2) (|Seq#Index| b_2 i_19_1@@0))))
 :qid |stdinbpl.3793:17|
 :skolemid |326|
 :pattern ( (neverTriggered25 i_19@@2) (neverTriggered25 i_19_1@@0))
)) (and (=> (= (ControlFlow 0 64) (- 0 69)) (forall ((i_19@@3 Int) ) (!  (=> (and (<= 0 i_19@@3) (< i_19@@3 len)) (>= (U_2_real (MapType1Select QPMask@9 (|Seq#Index| b_2 i_19@@3) Ref__Integer_value)) (/ (to_real 1) (to_real 2))))
 :qid |stdinbpl.3800:17|
 :skolemid |327|
 :pattern ( (|Seq#Index| b_2 i_19@@3))
 :pattern ( (|Seq#Index| b_2 i_19@@3))
))) (=> (forall ((i_19@@4 Int) ) (!  (=> (and (<= 0 i_19@@4) (< i_19@@4 len)) (>= (U_2_real (MapType1Select QPMask@9 (|Seq#Index| b_2 i_19@@4) Ref__Integer_value)) (/ (to_real 1) (to_real 2))))
 :qid |stdinbpl.3800:17|
 :skolemid |327|
 :pattern ( (|Seq#Index| b_2 i_19@@4))
 :pattern ( (|Seq#Index| b_2 i_19@@4))
)) (=> (and (and (forall ((i_19@@5 Int) ) (!  (=> (and (and (<= 0 i_19@@5) (< i_19@@5 len)) (< NoPerm (/ (to_real 1) (to_real 2)))) (and (qpRange25 (|Seq#Index| b_2 i_19@@5)) (= (invRecv25 (|Seq#Index| b_2 i_19@@5)) i_19@@5)))
 :qid |stdinbpl.3806:22|
 :skolemid |328|
 :pattern ( (|Seq#Index| b_2 i_19@@5))
 :pattern ( (|Seq#Index| b_2 i_19@@5))
)) (forall ((o_3@@14 T@U) ) (!  (=> (= (type o_3@@14) RefType) (=> (and (and (<= 0 (invRecv25 o_3@@14)) (< (invRecv25 o_3@@14) len)) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange25 o_3@@14))) (= (|Seq#Index| b_2 (invRecv25 o_3@@14)) o_3@@14)))
 :qid |stdinbpl.3810:22|
 :skolemid |329|
 :pattern ( (invRecv25 o_3@@14))
))) (and (forall ((o_3@@15 T@U) ) (!  (=> (= (type o_3@@15) RefType) (and (=> (and (and (<= 0 (invRecv25 o_3@@15)) (< (invRecv25 o_3@@15) len)) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange25 o_3@@15))) (and (= (|Seq#Index| b_2 (invRecv25 o_3@@15)) o_3@@15) (= (U_2_real (MapType1Select QPMask@10 o_3@@15 Ref__Integer_value)) (- (U_2_real (MapType1Select QPMask@9 o_3@@15 Ref__Integer_value)) (/ (to_real 1) (to_real 2)))))) (=> (not (and (and (<= 0 (invRecv25 o_3@@15)) (< (invRecv25 o_3@@15) len)) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange25 o_3@@15)))) (= (U_2_real (MapType1Select QPMask@10 o_3@@15 Ref__Integer_value)) (U_2_real (MapType1Select QPMask@9 o_3@@15 Ref__Integer_value))))))
 :qid |stdinbpl.3816:22|
 :skolemid |330|
 :pattern ( (MapType1Select QPMask@10 o_3@@15 Ref__Integer_value))
)) (forall ((o_3@@16 T@U) (f_5@@4 T@U) ) (! (let ((B@@16 (FieldTypeInv1 (type f_5@@4))))
(let ((A@@17 (FieldTypeInv0 (type f_5@@4))))
 (=> (and (and (= (type o_3@@16) RefType) (= (type f_5@@4) (FieldType A@@17 B@@16))) (not (= f_5@@4 Ref__Integer_value))) (= (U_2_real (MapType1Select QPMask@9 o_3@@16 f_5@@4)) (U_2_real (MapType1Select QPMask@10 o_3@@16 f_5@@4))))))
 :qid |stdinbpl.3822:29|
 :skolemid |331|
 :pattern ( (MapType1Select QPMask@10 o_3@@16 f_5@@4))
)))) (and (=> (= (ControlFlow 0 64) (- 0 68)) (= (|Seq#Length| c) len)) (=> (= (|Seq#Length| c) len) (and (=> (= (ControlFlow 0 64) (- 0 67)) (forall ((i_20 Int) ) (!  (=> (and (and (<= 0 i_20) (< i_20 len)) (dummyFunction (MapType0Select ExhaleHeap@0 (|Seq#Index| c i_20) Ref__Integer_value))) (>= (/ (to_real 1) (to_real 2)) NoPerm))
 :qid |stdinbpl.3833:17|
 :skolemid |332|
 :pattern ( (|Seq#Index| c i_20))
 :pattern ( (|Seq#Index| c i_20))
))) (=> (forall ((i_20@@0 Int) ) (!  (=> (and (and (<= 0 i_20@@0) (< i_20@@0 len)) (dummyFunction (MapType0Select ExhaleHeap@0 (|Seq#Index| c i_20@@0) Ref__Integer_value))) (>= (/ (to_real 1) (to_real 2)) NoPerm))
 :qid |stdinbpl.3833:17|
 :skolemid |332|
 :pattern ( (|Seq#Index| c i_20@@0))
 :pattern ( (|Seq#Index| c i_20@@0))
)) (and (=> (= (ControlFlow 0 64) (- 0 66)) (forall ((i_20@@1 Int) (i_20_1 Int) ) (!  (=> (and (and (and (and (not (= i_20@@1 i_20_1)) (and (<= 0 i_20@@1) (< i_20@@1 len))) (and (<= 0 i_20_1) (< i_20_1 len))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= (|Seq#Index| c i_20@@1) (|Seq#Index| c i_20_1))))
 :qid |stdinbpl.3840:17|
 :skolemid |333|
 :pattern ( (neverTriggered26 i_20@@1) (neverTriggered26 i_20_1))
))) (=> (forall ((i_20@@2 Int) (i_20_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_20@@2 i_20_1@@0)) (and (<= 0 i_20@@2) (< i_20@@2 len))) (and (<= 0 i_20_1@@0) (< i_20_1@@0 len))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= (|Seq#Index| c i_20@@2) (|Seq#Index| c i_20_1@@0))))
 :qid |stdinbpl.3840:17|
 :skolemid |333|
 :pattern ( (neverTriggered26 i_20@@2) (neverTriggered26 i_20_1@@0))
)) (and (=> (= (ControlFlow 0 64) (- 0 65)) (forall ((i_20@@3 Int) ) (!  (=> (and (<= 0 i_20@@3) (< i_20@@3 len)) (>= (U_2_real (MapType1Select QPMask@10 (|Seq#Index| c i_20@@3) Ref__Integer_value)) (/ (to_real 1) (to_real 2))))
 :qid |stdinbpl.3847:17|
 :skolemid |334|
 :pattern ( (|Seq#Index| c i_20@@3))
 :pattern ( (|Seq#Index| c i_20@@3))
))) (=> (forall ((i_20@@4 Int) ) (!  (=> (and (<= 0 i_20@@4) (< i_20@@4 len)) (>= (U_2_real (MapType1Select QPMask@10 (|Seq#Index| c i_20@@4) Ref__Integer_value)) (/ (to_real 1) (to_real 2))))
 :qid |stdinbpl.3847:17|
 :skolemid |334|
 :pattern ( (|Seq#Index| c i_20@@4))
 :pattern ( (|Seq#Index| c i_20@@4))
)) (=> (and (and (forall ((i_20@@5 Int) ) (!  (=> (and (and (<= 0 i_20@@5) (< i_20@@5 len)) (< NoPerm (/ (to_real 1) (to_real 2)))) (and (qpRange26 (|Seq#Index| c i_20@@5)) (= (invRecv26 (|Seq#Index| c i_20@@5)) i_20@@5)))
 :qid |stdinbpl.3853:22|
 :skolemid |335|
 :pattern ( (|Seq#Index| c i_20@@5))
 :pattern ( (|Seq#Index| c i_20@@5))
)) (forall ((o_3@@17 T@U) ) (!  (=> (= (type o_3@@17) RefType) (=> (and (and (<= 0 (invRecv26 o_3@@17)) (< (invRecv26 o_3@@17) len)) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange26 o_3@@17))) (= (|Seq#Index| c (invRecv26 o_3@@17)) o_3@@17)))
 :qid |stdinbpl.3857:22|
 :skolemid |336|
 :pattern ( (invRecv26 o_3@@17))
))) (and (forall ((o_3@@18 T@U) ) (!  (=> (= (type o_3@@18) RefType) (and (=> (and (and (<= 0 (invRecv26 o_3@@18)) (< (invRecv26 o_3@@18) len)) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange26 o_3@@18))) (and (= (|Seq#Index| c (invRecv26 o_3@@18)) o_3@@18) (= (U_2_real (MapType1Select QPMask@11 o_3@@18 Ref__Integer_value)) (- (U_2_real (MapType1Select QPMask@10 o_3@@18 Ref__Integer_value)) (/ (to_real 1) (to_real 2)))))) (=> (not (and (and (<= 0 (invRecv26 o_3@@18)) (< (invRecv26 o_3@@18) len)) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange26 o_3@@18)))) (= (U_2_real (MapType1Select QPMask@11 o_3@@18 Ref__Integer_value)) (U_2_real (MapType1Select QPMask@10 o_3@@18 Ref__Integer_value))))))
 :qid |stdinbpl.3863:22|
 :skolemid |337|
 :pattern ( (MapType1Select QPMask@11 o_3@@18 Ref__Integer_value))
)) (forall ((o_3@@19 T@U) (f_5@@5 T@U) ) (! (let ((B@@17 (FieldTypeInv1 (type f_5@@5))))
(let ((A@@18 (FieldTypeInv0 (type f_5@@5))))
 (=> (and (and (= (type o_3@@19) RefType) (= (type f_5@@5) (FieldType A@@18 B@@17))) (not (= f_5@@5 Ref__Integer_value))) (= (U_2_real (MapType1Select QPMask@10 o_3@@19 f_5@@5)) (U_2_real (MapType1Select QPMask@11 o_3@@19 f_5@@5))))))
 :qid |stdinbpl.3869:29|
 :skolemid |338|
 :pattern ( (MapType1Select QPMask@11 o_3@@19 f_5@@5))
)))) (and (and (=> (= (ControlFlow 0 64) 63) anon124_Else_correct) (=> (= (ControlFlow 0 64) 50) anon125_Then_correct)) (=> (= (ControlFlow 0 64) 52) anon125_Else_correct))))))))))))))))))))))))))))))))))))
(let ((anon123_Else_correct  (=> (and (<= len 0) (= (ControlFlow 0 79) 64)) anon74_correct)))
(let ((anon123_Then_correct  (=> (< 0 len) (=> (and (= (|Seq#Length| c) len) (= (ControlFlow 0 78) 64)) anon74_correct))))
(let ((anon72_correct  (and (=> (= (ControlFlow 0 80) (- 0 82)) (forall ((i_31 Int) (i_31_1 Int) ) (!  (=> (and (and (and (and (not (= i_31 i_31_1)) (and (<= 0 i_31) (< i_31 len))) (and (<= 0 i_31_1) (< i_31_1 len))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= (|Seq#Index| b_2 i_31) (|Seq#Index| b_2 i_31_1))))
 :qid |stdinbpl.3638:17|
 :skolemid |302|
))) (=> (forall ((i_31@@0 Int) (i_31_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_31@@0 i_31_1@@0)) (and (<= 0 i_31@@0) (< i_31@@0 len))) (and (<= 0 i_31_1@@0) (< i_31_1@@0 len))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= (|Seq#Index| b_2 i_31@@0) (|Seq#Index| b_2 i_31_1@@0))))
 :qid |stdinbpl.3638:17|
 :skolemid |302|
)) (=> (and (forall ((i_31@@1 Int) ) (!  (=> (and (and (<= 0 i_31@@1) (< i_31@@1 len)) (< NoPerm (/ (to_real 1) (to_real 2)))) (and (qpRange31 (|Seq#Index| b_2 i_31@@1)) (= (invRecv31 (|Seq#Index| b_2 i_31@@1)) i_31@@1)))
 :qid |stdinbpl.3644:24|
 :skolemid |303|
 :pattern ( (|Seq#Index| b_2 i_31@@1))
 :pattern ( (|Seq#Index| b_2 i_31@@1))
)) (forall ((o_3@@20 T@U) ) (!  (=> (= (type o_3@@20) RefType) (=> (and (and (and (<= 0 (invRecv31 o_3@@20)) (< (invRecv31 o_3@@20) len)) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange31 o_3@@20)) (= (|Seq#Index| b_2 (invRecv31 o_3@@20)) o_3@@20)))
 :qid |stdinbpl.3648:24|
 :skolemid |304|
 :pattern ( (invRecv31 o_3@@20))
))) (and (=> (= (ControlFlow 0 80) (- 0 81)) (forall ((i_31@@2 Int) ) (!  (=> (and (<= 0 i_31@@2) (< i_31@@2 len)) (>= (/ (to_real 1) (to_real 2)) NoPerm))
 :qid |stdinbpl.3654:17|
 :skolemid |305|
 :pattern ( (|Seq#Index| b_2 i_31@@2))
 :pattern ( (|Seq#Index| b_2 i_31@@2))
))) (=> (forall ((i_31@@3 Int) ) (!  (=> (and (<= 0 i_31@@3) (< i_31@@3 len)) (>= (/ (to_real 1) (to_real 2)) NoPerm))
 :qid |stdinbpl.3654:17|
 :skolemid |305|
 :pattern ( (|Seq#Index| b_2 i_31@@3))
 :pattern ( (|Seq#Index| b_2 i_31@@3))
)) (=> (and (and (forall ((i_31@@4 Int) ) (!  (=> (and (and (<= 0 i_31@@4) (< i_31@@4 len)) (> (/ (to_real 1) (to_real 2)) NoPerm)) (not (= (|Seq#Index| b_2 i_31@@4) null)))
 :qid |stdinbpl.3660:24|
 :skolemid |306|
 :pattern ( (|Seq#Index| b_2 i_31@@4))
 :pattern ( (|Seq#Index| b_2 i_31@@4))
)) (forall ((o_3@@21 T@U) ) (!  (=> (= (type o_3@@21) RefType) (and (=> (and (and (and (<= 0 (invRecv31 o_3@@21)) (< (invRecv31 o_3@@21) len)) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange31 o_3@@21)) (and (=> (< NoPerm (/ (to_real 1) (to_real 2))) (= (|Seq#Index| b_2 (invRecv31 o_3@@21)) o_3@@21)) (= (U_2_real (MapType1Select QPMask@7 o_3@@21 Ref__Integer_value)) (+ (U_2_real (MapType1Select QPMask@6 o_3@@21 Ref__Integer_value)) (/ (to_real 1) (to_real 2)))))) (=> (not (and (and (and (<= 0 (invRecv31 o_3@@21)) (< (invRecv31 o_3@@21) len)) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange31 o_3@@21))) (= (U_2_real (MapType1Select QPMask@7 o_3@@21 Ref__Integer_value)) (U_2_real (MapType1Select QPMask@6 o_3@@21 Ref__Integer_value))))))
 :qid |stdinbpl.3666:24|
 :skolemid |307|
 :pattern ( (MapType1Select QPMask@7 o_3@@21 Ref__Integer_value))
))) (and (forall ((o_3@@22 T@U) (f_5@@6 T@U) ) (! (let ((B@@18 (FieldTypeInv1 (type f_5@@6))))
(let ((A@@19 (FieldTypeInv0 (type f_5@@6))))
 (=> (and (and (= (type o_3@@22) RefType) (= (type f_5@@6) (FieldType A@@19 B@@18))) (not (= f_5@@6 Ref__Integer_value))) (= (U_2_real (MapType1Select QPMask@6 o_3@@22 f_5@@6)) (U_2_real (MapType1Select QPMask@7 o_3@@22 f_5@@6))))))
 :qid |stdinbpl.3670:31|
 :skolemid |308|
 :pattern ( (MapType1Select QPMask@6 o_3@@22 f_5@@6))
 :pattern ( (MapType1Select QPMask@7 o_3@@22 f_5@@6))
)) (state ExhaleHeap@0 QPMask@7))) (and (=> (= (ControlFlow 0 80) 78) anon123_Then_correct) (=> (= (ControlFlow 0 80) 79) anon123_Else_correct))))))))))
(let ((anon122_Else_correct  (=> (and (<= len 0) (= (ControlFlow 0 84) 80)) anon72_correct)))
(let ((anon122_Then_correct  (=> (< 0 len) (=> (and (= (|Seq#Length| b_2) len) (= (ControlFlow 0 83) 80)) anon72_correct))))
(let ((anon70_correct  (and (=> (= (ControlFlow 0 85) (- 0 86)) (forall ((i_30 Int) (i_30_1 Int) ) (!  (=> (and (and (and (and (not (= i_30 i_30_1)) (and (<= 0 i_30) (< i_30 len))) (and (<= 0 i_30_1) (< i_30_1 len))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| a_2 i_30) (|Seq#Index| a_2 i_30_1))))
 :qid |stdinbpl.3601:17|
 :skolemid |296|
))) (=> (forall ((i_30@@0 Int) (i_30_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_30@@0 i_30_1@@0)) (and (<= 0 i_30@@0) (< i_30@@0 len))) (and (<= 0 i_30_1@@0) (< i_30_1@@0 len))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| a_2 i_30@@0) (|Seq#Index| a_2 i_30_1@@0))))
 :qid |stdinbpl.3601:17|
 :skolemid |296|
)) (=> (and (forall ((i_30@@1 Int) ) (!  (=> (and (and (<= 0 i_30@@1) (< i_30@@1 len)) (< NoPerm FullPerm)) (and (qpRange30 (|Seq#Index| a_2 i_30@@1)) (= (invRecv30 (|Seq#Index| a_2 i_30@@1)) i_30@@1)))
 :qid |stdinbpl.3607:24|
 :skolemid |297|
 :pattern ( (|Seq#Index| a_2 i_30@@1))
 :pattern ( (|Seq#Index| a_2 i_30@@1))
)) (forall ((o_3@@23 T@U) ) (!  (=> (= (type o_3@@23) RefType) (=> (and (and (and (<= 0 (invRecv30 o_3@@23)) (< (invRecv30 o_3@@23) len)) (< NoPerm FullPerm)) (qpRange30 o_3@@23)) (= (|Seq#Index| a_2 (invRecv30 o_3@@23)) o_3@@23)))
 :qid |stdinbpl.3611:24|
 :skolemid |298|
 :pattern ( (invRecv30 o_3@@23))
))) (=> (and (and (forall ((i_30@@2 Int) ) (!  (=> (and (<= 0 i_30@@2) (< i_30@@2 len)) (not (= (|Seq#Index| a_2 i_30@@2) null)))
 :qid |stdinbpl.3617:24|
 :skolemid |299|
 :pattern ( (|Seq#Index| a_2 i_30@@2))
 :pattern ( (|Seq#Index| a_2 i_30@@2))
)) (forall ((o_3@@24 T@U) ) (!  (=> (= (type o_3@@24) RefType) (and (=> (and (and (and (<= 0 (invRecv30 o_3@@24)) (< (invRecv30 o_3@@24) len)) (< NoPerm FullPerm)) (qpRange30 o_3@@24)) (and (=> (< NoPerm FullPerm) (= (|Seq#Index| a_2 (invRecv30 o_3@@24)) o_3@@24)) (= (U_2_real (MapType1Select QPMask@6 o_3@@24 Ref__Integer_value)) (+ (U_2_real (MapType1Select QPMask@5 o_3@@24 Ref__Integer_value)) FullPerm)))) (=> (not (and (and (and (<= 0 (invRecv30 o_3@@24)) (< (invRecv30 o_3@@24) len)) (< NoPerm FullPerm)) (qpRange30 o_3@@24))) (= (U_2_real (MapType1Select QPMask@6 o_3@@24 Ref__Integer_value)) (U_2_real (MapType1Select QPMask@5 o_3@@24 Ref__Integer_value))))))
 :qid |stdinbpl.3623:24|
 :skolemid |300|
 :pattern ( (MapType1Select QPMask@6 o_3@@24 Ref__Integer_value))
))) (and (forall ((o_3@@25 T@U) (f_5@@7 T@U) ) (! (let ((B@@19 (FieldTypeInv1 (type f_5@@7))))
(let ((A@@20 (FieldTypeInv0 (type f_5@@7))))
 (=> (and (and (= (type o_3@@25) RefType) (= (type f_5@@7) (FieldType A@@20 B@@19))) (not (= f_5@@7 Ref__Integer_value))) (= (U_2_real (MapType1Select QPMask@5 o_3@@25 f_5@@7)) (U_2_real (MapType1Select QPMask@6 o_3@@25 f_5@@7))))))
 :qid |stdinbpl.3627:31|
 :skolemid |301|
 :pattern ( (MapType1Select QPMask@5 o_3@@25 f_5@@7))
 :pattern ( (MapType1Select QPMask@6 o_3@@25 f_5@@7))
)) (state ExhaleHeap@0 QPMask@6))) (and (=> (= (ControlFlow 0 85) 83) anon122_Then_correct) (=> (= (ControlFlow 0 85) 84) anon122_Else_correct))))))))
(let ((anon121_Else_correct  (=> (and (<= len 0) (= (ControlFlow 0 88) 85)) anon70_correct)))
(let ((anon121_Then_correct  (=> (< 0 len) (=> (and (= (|Seq#Length| a_2) len) (= (ControlFlow 0 87) 85)) anon70_correct))))
(let ((anon119_Else_correct  (=> (forall ((ix_11_1 Int) (jx_11_1 Int) ) (!  (=> (and (>= ix_11_1 0) (and (< ix_11_1 (|Seq#Length| c)) (and (>= jx_11_1 0) (and (< jx_11_1 (|Seq#Length| c)) (not (= ix_11_1 jx_11_1)))))) (not (= (|Seq#Index| c ix_11_1) (|Seq#Index| c jx_11_1))))
 :qid |stdinbpl.3541:22|
 :skolemid |288|
 :pattern ( (|Seq#Index| c ix_11_1) (|Seq#Index| c jx_11_1))
)) (and (=> (= (ControlFlow 0 89) (- 0 92)) (forall ((i_29 Int) ) (!  (=> (and (and (<= 0 i_29) (< i_29 len)) (dummyFunction (MapType0Select Heap@@33 (|Seq#Index| c i_29) Ref__Integer_value))) (>= (/ (to_real 1) (to_real 2)) NoPerm))
 :qid |stdinbpl.3549:19|
 :skolemid |289|
 :pattern ( (|Seq#Index| c i_29))
 :pattern ( (|Seq#Index| c i_29))
))) (=> (forall ((i_29@@0 Int) ) (!  (=> (and (and (<= 0 i_29@@0) (< i_29@@0 len)) (dummyFunction (MapType0Select Heap@@33 (|Seq#Index| c i_29@@0) Ref__Integer_value))) (>= (/ (to_real 1) (to_real 2)) NoPerm))
 :qid |stdinbpl.3549:19|
 :skolemid |289|
 :pattern ( (|Seq#Index| c i_29@@0))
 :pattern ( (|Seq#Index| c i_29@@0))
)) (and (=> (= (ControlFlow 0 89) (- 0 91)) (forall ((i_29@@1 Int) (i_29_1 Int) ) (!  (=> (and (and (and (and (not (= i_29@@1 i_29_1)) (and (<= 0 i_29@@1) (< i_29@@1 len))) (and (<= 0 i_29_1) (< i_29_1 len))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= (|Seq#Index| c i_29@@1) (|Seq#Index| c i_29_1))))
 :qid |stdinbpl.3556:19|
 :skolemid |290|
 :pattern ( (neverTriggered29 i_29@@1) (neverTriggered29 i_29_1))
))) (=> (forall ((i_29@@2 Int) (i_29_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_29@@2 i_29_1@@0)) (and (<= 0 i_29@@2) (< i_29@@2 len))) (and (<= 0 i_29_1@@0) (< i_29_1@@0 len))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= (|Seq#Index| c i_29@@2) (|Seq#Index| c i_29_1@@0))))
 :qid |stdinbpl.3556:19|
 :skolemid |290|
 :pattern ( (neverTriggered29 i_29@@2) (neverTriggered29 i_29_1@@0))
)) (and (=> (= (ControlFlow 0 89) (- 0 90)) (forall ((i_29@@3 Int) ) (!  (=> (and (<= 0 i_29@@3) (< i_29@@3 len)) (>= (U_2_real (MapType1Select QPMask@4 (|Seq#Index| c i_29@@3) Ref__Integer_value)) (/ (to_real 1) (to_real 2))))
 :qid |stdinbpl.3563:19|
 :skolemid |291|
 :pattern ( (|Seq#Index| c i_29@@3))
 :pattern ( (|Seq#Index| c i_29@@3))
))) (=> (forall ((i_29@@4 Int) ) (!  (=> (and (<= 0 i_29@@4) (< i_29@@4 len)) (>= (U_2_real (MapType1Select QPMask@4 (|Seq#Index| c i_29@@4) Ref__Integer_value)) (/ (to_real 1) (to_real 2))))
 :qid |stdinbpl.3563:19|
 :skolemid |291|
 :pattern ( (|Seq#Index| c i_29@@4))
 :pattern ( (|Seq#Index| c i_29@@4))
)) (=> (forall ((i_29@@5 Int) ) (!  (=> (and (and (<= 0 i_29@@5) (< i_29@@5 len)) (< NoPerm (/ (to_real 1) (to_real 2)))) (and (qpRange29 (|Seq#Index| c i_29@@5)) (= (invRecv29 (|Seq#Index| c i_29@@5)) i_29@@5)))
 :qid |stdinbpl.3569:24|
 :skolemid |292|
 :pattern ( (|Seq#Index| c i_29@@5))
 :pattern ( (|Seq#Index| c i_29@@5))
)) (=> (and (and (forall ((o_3@@26 T@U) ) (!  (=> (= (type o_3@@26) RefType) (=> (and (and (<= 0 (invRecv29 o_3@@26)) (< (invRecv29 o_3@@26) len)) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange29 o_3@@26))) (= (|Seq#Index| c (invRecv29 o_3@@26)) o_3@@26)))
 :qid |stdinbpl.3573:24|
 :skolemid |293|
 :pattern ( (invRecv29 o_3@@26))
)) (forall ((o_3@@27 T@U) ) (!  (=> (= (type o_3@@27) RefType) (and (=> (and (and (<= 0 (invRecv29 o_3@@27)) (< (invRecv29 o_3@@27) len)) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange29 o_3@@27))) (and (= (|Seq#Index| c (invRecv29 o_3@@27)) o_3@@27) (= (U_2_real (MapType1Select QPMask@5 o_3@@27 Ref__Integer_value)) (- (U_2_real (MapType1Select QPMask@4 o_3@@27 Ref__Integer_value)) (/ (to_real 1) (to_real 2)))))) (=> (not (and (and (<= 0 (invRecv29 o_3@@27)) (< (invRecv29 o_3@@27) len)) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange29 o_3@@27)))) (= (U_2_real (MapType1Select QPMask@5 o_3@@27 Ref__Integer_value)) (U_2_real (MapType1Select QPMask@4 o_3@@27 Ref__Integer_value))))))
 :qid |stdinbpl.3579:24|
 :skolemid |294|
 :pattern ( (MapType1Select QPMask@5 o_3@@27 Ref__Integer_value))
))) (and (forall ((o_3@@28 T@U) (f_5@@8 T@U) ) (! (let ((B@@20 (FieldTypeInv1 (type f_5@@8))))
(let ((A@@21 (FieldTypeInv0 (type f_5@@8))))
 (=> (and (and (= (type o_3@@28) RefType) (= (type f_5@@8) (FieldType A@@21 B@@20))) (not (= f_5@@8 Ref__Integer_value))) (= (U_2_real (MapType1Select QPMask@4 o_3@@28 f_5@@8)) (U_2_real (MapType1Select QPMask@5 o_3@@28 f_5@@8))))))
 :qid |stdinbpl.3585:31|
 :skolemid |295|
 :pattern ( (MapType1Select QPMask@5 o_3@@28 f_5@@8))
)) (IdenticalOnKnownLocations Heap@@33 ExhaleHeap@0 QPMask@5))) (and (=> (= (ControlFlow 0 89) 87) anon121_Then_correct) (=> (= (ControlFlow 0 89) 88) anon121_Else_correct)))))))))))))
(let ((anon67_correct true))
(let ((anon120_Else_correct  (=> (and (not (and (>= ix_10_1 0) (and (< ix_10_1 (|Seq#Length| c)) (and (>= jx_10_1 0) (and (< jx_10_1 (|Seq#Length| c)) (not (= ix_10_1 jx_10_1))))))) (= (ControlFlow 0 48) 45)) anon67_correct)))
(let ((anon120_Then_correct  (=> (and (>= ix_10_1 0) (and (< ix_10_1 (|Seq#Length| c)) (and (>= jx_10_1 0) (and (< jx_10_1 (|Seq#Length| c)) (not (= ix_10_1 jx_10_1)))))) (and (=> (= (ControlFlow 0 46) (- 0 47)) (not (= (|Seq#Index| c ix_10_1) (|Seq#Index| c jx_10_1)))) (=> (not (= (|Seq#Index| c ix_10_1) (|Seq#Index| c jx_10_1))) (=> (= (ControlFlow 0 46) 45) anon67_correct))))))
(let ((anon118_Else_correct  (=> (<= len 0) (and (and (=> (= (ControlFlow 0 95) 89) anon119_Else_correct) (=> (= (ControlFlow 0 95) 46) anon120_Then_correct)) (=> (= (ControlFlow 0 95) 48) anon120_Else_correct)))))
(let ((anon118_Then_correct  (=> (< 0 len) (and (=> (= (ControlFlow 0 93) (- 0 94)) (= (|Seq#Length| c) len)) (=> (= (|Seq#Length| c) len) (and (and (=> (= (ControlFlow 0 93) 89) anon119_Else_correct) (=> (= (ControlFlow 0 93) 46) anon120_Then_correct)) (=> (= (ControlFlow 0 93) 48) anon120_Else_correct)))))))
(let ((anon116_Else_correct  (=> (forall ((ix_9_1 Int) (jx_9_1 Int) ) (!  (=> (and (>= ix_9_1 0) (and (< ix_9_1 (|Seq#Length| b_2)) (and (>= jx_9_1 0) (and (< jx_9_1 (|Seq#Length| b_2)) (not (= ix_9_1 jx_9_1)))))) (not (= (|Seq#Index| b_2 ix_9_1) (|Seq#Index| b_2 jx_9_1))))
 :qid |stdinbpl.3481:22|
 :skolemid |280|
 :pattern ( (|Seq#Index| b_2 ix_9_1) (|Seq#Index| b_2 jx_9_1))
)) (and (=> (= (ControlFlow 0 96) (- 0 99)) (forall ((i_28 Int) ) (!  (=> (and (and (<= 0 i_28) (< i_28 len)) (dummyFunction (MapType0Select Heap@@33 (|Seq#Index| b_2 i_28) Ref__Integer_value))) (>= (/ (to_real 1) (to_real 2)) NoPerm))
 :qid |stdinbpl.3489:19|
 :skolemid |281|
 :pattern ( (|Seq#Index| b_2 i_28))
 :pattern ( (|Seq#Index| b_2 i_28))
))) (=> (forall ((i_28@@0 Int) ) (!  (=> (and (and (<= 0 i_28@@0) (< i_28@@0 len)) (dummyFunction (MapType0Select Heap@@33 (|Seq#Index| b_2 i_28@@0) Ref__Integer_value))) (>= (/ (to_real 1) (to_real 2)) NoPerm))
 :qid |stdinbpl.3489:19|
 :skolemid |281|
 :pattern ( (|Seq#Index| b_2 i_28@@0))
 :pattern ( (|Seq#Index| b_2 i_28@@0))
)) (and (=> (= (ControlFlow 0 96) (- 0 98)) (forall ((i_28@@1 Int) (i_28_1 Int) ) (!  (=> (and (and (and (and (not (= i_28@@1 i_28_1)) (and (<= 0 i_28@@1) (< i_28@@1 len))) (and (<= 0 i_28_1) (< i_28_1 len))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= (|Seq#Index| b_2 i_28@@1) (|Seq#Index| b_2 i_28_1))))
 :qid |stdinbpl.3496:19|
 :skolemid |282|
 :pattern ( (neverTriggered28 i_28@@1) (neverTriggered28 i_28_1))
))) (=> (forall ((i_28@@2 Int) (i_28_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_28@@2 i_28_1@@0)) (and (<= 0 i_28@@2) (< i_28@@2 len))) (and (<= 0 i_28_1@@0) (< i_28_1@@0 len))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= (|Seq#Index| b_2 i_28@@2) (|Seq#Index| b_2 i_28_1@@0))))
 :qid |stdinbpl.3496:19|
 :skolemid |282|
 :pattern ( (neverTriggered28 i_28@@2) (neverTriggered28 i_28_1@@0))
)) (and (=> (= (ControlFlow 0 96) (- 0 97)) (forall ((i_28@@3 Int) ) (!  (=> (and (<= 0 i_28@@3) (< i_28@@3 len)) (>= (U_2_real (MapType1Select QPMask@3 (|Seq#Index| b_2 i_28@@3) Ref__Integer_value)) (/ (to_real 1) (to_real 2))))
 :qid |stdinbpl.3503:19|
 :skolemid |283|
 :pattern ( (|Seq#Index| b_2 i_28@@3))
 :pattern ( (|Seq#Index| b_2 i_28@@3))
))) (=> (forall ((i_28@@4 Int) ) (!  (=> (and (<= 0 i_28@@4) (< i_28@@4 len)) (>= (U_2_real (MapType1Select QPMask@3 (|Seq#Index| b_2 i_28@@4) Ref__Integer_value)) (/ (to_real 1) (to_real 2))))
 :qid |stdinbpl.3503:19|
 :skolemid |283|
 :pattern ( (|Seq#Index| b_2 i_28@@4))
 :pattern ( (|Seq#Index| b_2 i_28@@4))
)) (=> (and (and (forall ((i_28@@5 Int) ) (!  (=> (and (and (<= 0 i_28@@5) (< i_28@@5 len)) (< NoPerm (/ (to_real 1) (to_real 2)))) (and (qpRange28 (|Seq#Index| b_2 i_28@@5)) (= (invRecv28 (|Seq#Index| b_2 i_28@@5)) i_28@@5)))
 :qid |stdinbpl.3509:24|
 :skolemid |284|
 :pattern ( (|Seq#Index| b_2 i_28@@5))
 :pattern ( (|Seq#Index| b_2 i_28@@5))
)) (forall ((o_3@@29 T@U) ) (!  (=> (= (type o_3@@29) RefType) (=> (and (and (<= 0 (invRecv28 o_3@@29)) (< (invRecv28 o_3@@29) len)) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange28 o_3@@29))) (= (|Seq#Index| b_2 (invRecv28 o_3@@29)) o_3@@29)))
 :qid |stdinbpl.3513:24|
 :skolemid |285|
 :pattern ( (invRecv28 o_3@@29))
))) (and (forall ((o_3@@30 T@U) ) (!  (=> (= (type o_3@@30) RefType) (and (=> (and (and (<= 0 (invRecv28 o_3@@30)) (< (invRecv28 o_3@@30) len)) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange28 o_3@@30))) (and (= (|Seq#Index| b_2 (invRecv28 o_3@@30)) o_3@@30) (= (U_2_real (MapType1Select QPMask@4 o_3@@30 Ref__Integer_value)) (- (U_2_real (MapType1Select QPMask@3 o_3@@30 Ref__Integer_value)) (/ (to_real 1) (to_real 2)))))) (=> (not (and (and (<= 0 (invRecv28 o_3@@30)) (< (invRecv28 o_3@@30) len)) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange28 o_3@@30)))) (= (U_2_real (MapType1Select QPMask@4 o_3@@30 Ref__Integer_value)) (U_2_real (MapType1Select QPMask@3 o_3@@30 Ref__Integer_value))))))
 :qid |stdinbpl.3519:24|
 :skolemid |286|
 :pattern ( (MapType1Select QPMask@4 o_3@@30 Ref__Integer_value))
)) (forall ((o_3@@31 T@U) (f_5@@9 T@U) ) (! (let ((B@@21 (FieldTypeInv1 (type f_5@@9))))
(let ((A@@22 (FieldTypeInv0 (type f_5@@9))))
 (=> (and (and (= (type o_3@@31) RefType) (= (type f_5@@9) (FieldType A@@22 B@@21))) (not (= f_5@@9 Ref__Integer_value))) (= (U_2_real (MapType1Select QPMask@3 o_3@@31 f_5@@9)) (U_2_real (MapType1Select QPMask@4 o_3@@31 f_5@@9))))))
 :qid |stdinbpl.3525:31|
 :skolemid |287|
 :pattern ( (MapType1Select QPMask@4 o_3@@31 f_5@@9))
)))) (and (=> (= (ControlFlow 0 96) 93) anon118_Then_correct) (=> (= (ControlFlow 0 96) 95) anon118_Else_correct))))))))))))
(let ((anon61_correct true))
(let ((anon117_Else_correct  (=> (and (not (and (>= ix_8_1 0) (and (< ix_8_1 (|Seq#Length| b_2)) (and (>= jx_8_1 0) (and (< jx_8_1 (|Seq#Length| b_2)) (not (= ix_8_1 jx_8_1))))))) (= (ControlFlow 0 44) 41)) anon61_correct)))
(let ((anon117_Then_correct  (=> (and (>= ix_8_1 0) (and (< ix_8_1 (|Seq#Length| b_2)) (and (>= jx_8_1 0) (and (< jx_8_1 (|Seq#Length| b_2)) (not (= ix_8_1 jx_8_1)))))) (and (=> (= (ControlFlow 0 42) (- 0 43)) (not (= (|Seq#Index| b_2 ix_8_1) (|Seq#Index| b_2 jx_8_1)))) (=> (not (= (|Seq#Index| b_2 ix_8_1) (|Seq#Index| b_2 jx_8_1))) (=> (= (ControlFlow 0 42) 41) anon61_correct))))))
(let ((anon115_Else_correct  (=> (<= len 0) (and (and (=> (= (ControlFlow 0 102) 96) anon116_Else_correct) (=> (= (ControlFlow 0 102) 42) anon117_Then_correct)) (=> (= (ControlFlow 0 102) 44) anon117_Else_correct)))))
(let ((anon115_Then_correct  (=> (< 0 len) (and (=> (= (ControlFlow 0 100) (- 0 101)) (= (|Seq#Length| b_2) len)) (=> (= (|Seq#Length| b_2) len) (and (and (=> (= (ControlFlow 0 100) 96) anon116_Else_correct) (=> (= (ControlFlow 0 100) 42) anon117_Then_correct)) (=> (= (ControlFlow 0 100) 44) anon117_Else_correct)))))))
(let ((anon113_Else_correct  (=> (forall ((ix_7_1 Int) (jx_7_1 Int) ) (!  (=> (and (>= ix_7_1 0) (and (< ix_7_1 (|Seq#Length| a_2)) (and (>= jx_7_1 0) (and (< jx_7_1 (|Seq#Length| a_2)) (not (= ix_7_1 jx_7_1)))))) (not (= (|Seq#Index| a_2 ix_7_1) (|Seq#Index| a_2 jx_7_1))))
 :qid |stdinbpl.3425:22|
 :skolemid |273|
 :pattern ( (|Seq#Index| a_2 ix_7_1) (|Seq#Index| a_2 jx_7_1))
)) (and (=> (= (ControlFlow 0 103) (- 0 105)) (forall ((i_27 Int) (i_27_1 Int) ) (!  (=> (and (and (and (and (not (= i_27 i_27_1)) (and (<= 0 i_27) (< i_27 len))) (and (<= 0 i_27_1) (< i_27_1 len))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| a_2 i_27) (|Seq#Index| a_2 i_27_1))))
 :qid |stdinbpl.3436:19|
 :skolemid |274|
 :pattern ( (neverTriggered27 i_27) (neverTriggered27 i_27_1))
))) (=> (forall ((i_27@@0 Int) (i_27_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_27@@0 i_27_1@@0)) (and (<= 0 i_27@@0) (< i_27@@0 len))) (and (<= 0 i_27_1@@0) (< i_27_1@@0 len))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| a_2 i_27@@0) (|Seq#Index| a_2 i_27_1@@0))))
 :qid |stdinbpl.3436:19|
 :skolemid |274|
 :pattern ( (neverTriggered27 i_27@@0) (neverTriggered27 i_27_1@@0))
)) (and (=> (= (ControlFlow 0 103) (- 0 104)) (forall ((i_27@@1 Int) ) (!  (=> (and (<= 0 i_27@@1) (< i_27@@1 len)) (>= (U_2_real (MapType1Select QPMask@2 (|Seq#Index| a_2 i_27@@1) Ref__Integer_value)) FullPerm))
 :qid |stdinbpl.3443:19|
 :skolemid |275|
 :pattern ( (|Seq#Index| a_2 i_27@@1))
 :pattern ( (|Seq#Index| a_2 i_27@@1))
))) (=> (forall ((i_27@@2 Int) ) (!  (=> (and (<= 0 i_27@@2) (< i_27@@2 len)) (>= (U_2_real (MapType1Select QPMask@2 (|Seq#Index| a_2 i_27@@2) Ref__Integer_value)) FullPerm))
 :qid |stdinbpl.3443:19|
 :skolemid |275|
 :pattern ( (|Seq#Index| a_2 i_27@@2))
 :pattern ( (|Seq#Index| a_2 i_27@@2))
)) (=> (and (and (forall ((i_27@@3 Int) ) (!  (=> (and (and (<= 0 i_27@@3) (< i_27@@3 len)) (< NoPerm FullPerm)) (and (qpRange27 (|Seq#Index| a_2 i_27@@3)) (= (invRecv27 (|Seq#Index| a_2 i_27@@3)) i_27@@3)))
 :qid |stdinbpl.3449:24|
 :skolemid |276|
 :pattern ( (|Seq#Index| a_2 i_27@@3))
 :pattern ( (|Seq#Index| a_2 i_27@@3))
)) (forall ((o_3@@32 T@U) ) (!  (=> (= (type o_3@@32) RefType) (=> (and (and (<= 0 (invRecv27 o_3@@32)) (< (invRecv27 o_3@@32) len)) (and (< NoPerm FullPerm) (qpRange27 o_3@@32))) (= (|Seq#Index| a_2 (invRecv27 o_3@@32)) o_3@@32)))
 :qid |stdinbpl.3453:24|
 :skolemid |277|
 :pattern ( (invRecv27 o_3@@32))
))) (and (forall ((o_3@@33 T@U) ) (!  (=> (= (type o_3@@33) RefType) (and (=> (and (and (<= 0 (invRecv27 o_3@@33)) (< (invRecv27 o_3@@33) len)) (and (< NoPerm FullPerm) (qpRange27 o_3@@33))) (and (= (|Seq#Index| a_2 (invRecv27 o_3@@33)) o_3@@33) (= (U_2_real (MapType1Select QPMask@3 o_3@@33 Ref__Integer_value)) (- (U_2_real (MapType1Select QPMask@2 o_3@@33 Ref__Integer_value)) FullPerm)))) (=> (not (and (and (<= 0 (invRecv27 o_3@@33)) (< (invRecv27 o_3@@33) len)) (and (< NoPerm FullPerm) (qpRange27 o_3@@33)))) (= (U_2_real (MapType1Select QPMask@3 o_3@@33 Ref__Integer_value)) (U_2_real (MapType1Select QPMask@2 o_3@@33 Ref__Integer_value))))))
 :qid |stdinbpl.3459:24|
 :skolemid |278|
 :pattern ( (MapType1Select QPMask@3 o_3@@33 Ref__Integer_value))
)) (forall ((o_3@@34 T@U) (f_5@@10 T@U) ) (! (let ((B@@22 (FieldTypeInv1 (type f_5@@10))))
(let ((A@@23 (FieldTypeInv0 (type f_5@@10))))
 (=> (and (and (= (type o_3@@34) RefType) (= (type f_5@@10) (FieldType A@@23 B@@22))) (not (= f_5@@10 Ref__Integer_value))) (= (U_2_real (MapType1Select QPMask@2 o_3@@34 f_5@@10)) (U_2_real (MapType1Select QPMask@3 o_3@@34 f_5@@10))))))
 :qid |stdinbpl.3465:31|
 :skolemid |279|
 :pattern ( (MapType1Select QPMask@3 o_3@@34 f_5@@10))
)))) (and (=> (= (ControlFlow 0 103) 100) anon115_Then_correct) (=> (= (ControlFlow 0 103) 102) anon115_Else_correct))))))))))
(let ((anon55_correct true))
(let ((anon114_Else_correct  (=> (and (not (and (>= ix_6_1 0) (and (< ix_6_1 (|Seq#Length| a_2)) (and (>= jx_6_1 0) (and (< jx_6_1 (|Seq#Length| a_2)) (not (= ix_6_1 jx_6_1))))))) (= (ControlFlow 0 40) 37)) anon55_correct)))
(let ((anon114_Then_correct  (=> (and (>= ix_6_1 0) (and (< ix_6_1 (|Seq#Length| a_2)) (and (>= jx_6_1 0) (and (< jx_6_1 (|Seq#Length| a_2)) (not (= ix_6_1 jx_6_1)))))) (and (=> (= (ControlFlow 0 38) (- 0 39)) (not (= (|Seq#Index| a_2 ix_6_1) (|Seq#Index| a_2 jx_6_1)))) (=> (not (= (|Seq#Index| a_2 ix_6_1) (|Seq#Index| a_2 jx_6_1))) (=> (= (ControlFlow 0 38) 37) anon55_correct))))))
(let ((anon112_Else_correct  (=> (<= len 0) (and (and (=> (= (ControlFlow 0 108) 103) anon113_Else_correct) (=> (= (ControlFlow 0 108) 38) anon114_Then_correct)) (=> (= (ControlFlow 0 108) 40) anon114_Else_correct)))))
(let ((anon112_Then_correct  (=> (< 0 len) (and (=> (= (ControlFlow 0 106) (- 0 107)) (= (|Seq#Length| a_2) len)) (=> (= (|Seq#Length| a_2) len) (and (and (=> (= (ControlFlow 0 106) 103) anon113_Else_correct) (=> (= (ControlFlow 0 106) 38) anon114_Then_correct)) (=> (= (ControlFlow 0 106) 40) anon114_Else_correct)))))))
(let ((anon99_Else_correct  (and (=> (= (ControlFlow 0 109) (- 0 111)) (not (= diz null))) (=> (not (= diz null)) (and (=> (= (ControlFlow 0 109) (- 0 110)) (>= current_thread_id 0)) (=> (>= current_thread_id 0) (and (=> (= (ControlFlow 0 109) 106) anon112_Then_correct) (=> (= (ControlFlow 0 109) 108) anon112_Else_correct))))))))
(let ((anon97_Else_correct  (and (=> (= (ControlFlow 0 169) (- 0 171)) (forall ((i_5 Int) (i_5_1 Int) ) (!  (=> (and (and (and (and (not (= i_5 i_5_1)) (and (<= 0 i_5) (< i_5 len))) (and (<= 0 i_5_1) (< i_5_1 len))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= (|Seq#Index| c i_5) (|Seq#Index| c i_5_1))))
 :qid |stdinbpl.3115:15|
 :skolemid |243|
))) (=> (forall ((i_5@@0 Int) (i_5_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_5@@0 i_5_1@@0)) (and (<= 0 i_5@@0) (< i_5@@0 len))) (and (<= 0 i_5_1@@0) (< i_5_1@@0 len))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= (|Seq#Index| c i_5@@0) (|Seq#Index| c i_5_1@@0))))
 :qid |stdinbpl.3115:15|
 :skolemid |243|
)) (=> (and (forall ((i_5@@1 Int) ) (!  (=> (and (and (<= 0 i_5@@1) (< i_5@@1 len)) (< NoPerm (/ (to_real 1) (to_real 2)))) (and (qpRange20 (|Seq#Index| c i_5@@1)) (= (invRecv20 (|Seq#Index| c i_5@@1)) i_5@@1)))
 :qid |stdinbpl.3121:22|
 :skolemid |244|
 :pattern ( (|Seq#Index| c i_5@@1))
 :pattern ( (|Seq#Index| c i_5@@1))
)) (forall ((o_3@@35 T@U) ) (!  (=> (= (type o_3@@35) RefType) (=> (and (and (and (<= 0 (invRecv20 o_3@@35)) (< (invRecv20 o_3@@35) len)) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange20 o_3@@35)) (= (|Seq#Index| c (invRecv20 o_3@@35)) o_3@@35)))
 :qid |stdinbpl.3125:22|
 :skolemid |245|
 :pattern ( (invRecv20 o_3@@35))
))) (and (=> (= (ControlFlow 0 169) (- 0 170)) (forall ((i_5@@2 Int) ) (!  (=> (and (<= 0 i_5@@2) (< i_5@@2 len)) (>= (/ (to_real 1) (to_real 2)) NoPerm))
 :qid |stdinbpl.3131:15|
 :skolemid |246|
 :pattern ( (|Seq#Index| c i_5@@2))
 :pattern ( (|Seq#Index| c i_5@@2))
))) (=> (forall ((i_5@@3 Int) ) (!  (=> (and (<= 0 i_5@@3) (< i_5@@3 len)) (>= (/ (to_real 1) (to_real 2)) NoPerm))
 :qid |stdinbpl.3131:15|
 :skolemid |246|
 :pattern ( (|Seq#Index| c i_5@@3))
 :pattern ( (|Seq#Index| c i_5@@3))
)) (=> (forall ((i_5@@4 Int) ) (!  (=> (and (and (<= 0 i_5@@4) (< i_5@@4 len)) (> (/ (to_real 1) (to_real 2)) NoPerm)) (not (= (|Seq#Index| c i_5@@4) null)))
 :qid |stdinbpl.3137:22|
 :skolemid |247|
 :pattern ( (|Seq#Index| c i_5@@4))
 :pattern ( (|Seq#Index| c i_5@@4))
)) (=> (and (and (forall ((o_3@@36 T@U) ) (!  (=> (= (type o_3@@36) RefType) (and (=> (and (and (and (<= 0 (invRecv20 o_3@@36)) (< (invRecv20 o_3@@36) len)) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange20 o_3@@36)) (and (=> (< NoPerm (/ (to_real 1) (to_real 2))) (= (|Seq#Index| c (invRecv20 o_3@@36)) o_3@@36)) (= (U_2_real (MapType1Select QPMask@2 o_3@@36 Ref__Integer_value)) (+ (U_2_real (MapType1Select QPMask@1 o_3@@36 Ref__Integer_value)) (/ (to_real 1) (to_real 2)))))) (=> (not (and (and (and (<= 0 (invRecv20 o_3@@36)) (< (invRecv20 o_3@@36) len)) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange20 o_3@@36))) (= (U_2_real (MapType1Select QPMask@2 o_3@@36 Ref__Integer_value)) (U_2_real (MapType1Select QPMask@1 o_3@@36 Ref__Integer_value))))))
 :qid |stdinbpl.3143:22|
 :skolemid |248|
 :pattern ( (MapType1Select QPMask@2 o_3@@36 Ref__Integer_value))
)) (forall ((o_3@@37 T@U) (f_5@@11 T@U) ) (! (let ((B@@23 (FieldTypeInv1 (type f_5@@11))))
(let ((A@@24 (FieldTypeInv0 (type f_5@@11))))
 (=> (and (and (= (type o_3@@37) RefType) (= (type f_5@@11) (FieldType A@@24 B@@23))) (not (= f_5@@11 Ref__Integer_value))) (= (U_2_real (MapType1Select QPMask@1 o_3@@37 f_5@@11)) (U_2_real (MapType1Select QPMask@2 o_3@@37 f_5@@11))))))
 :qid |stdinbpl.3147:29|
 :skolemid |249|
 :pattern ( (MapType1Select QPMask@1 o_3@@37 f_5@@11))
 :pattern ( (MapType1Select QPMask@2 o_3@@37 f_5@@11))
))) (and (state Heap@@33 QPMask@2) (state Heap@@33 QPMask@2))) (and (=> (= (ControlFlow 0 169) 168) anon99_Then_correct) (=> (= (ControlFlow 0 169) 109) anon99_Else_correct)))))))))))
(let ((anon23_correct true))
(let ((anon98_Else_correct  (=> (and (not (and (<= 0 i_26) (< i_26 len))) (= (ControlFlow 0 36) 32)) anon23_correct)))
(let ((anon98_Then_correct  (=> (and (<= 0 i_26) (< i_26 len)) (and (=> (= (ControlFlow 0 33) (- 0 35)) (>= i_26 0)) (=> (>= i_26 0) (and (=> (= (ControlFlow 0 33) (- 0 34)) (< i_26 (|Seq#Length| c))) (=> (< i_26 (|Seq#Length| c)) (=> (= (ControlFlow 0 33) 32) anon23_correct))))))))
(let ((anon95_Else_correct  (=> (and (forall ((ix_5_2 Int) (jx_5_2 Int) ) (!  (=> (and (>= ix_5_2 0) (and (< ix_5_2 (|Seq#Length| c)) (and (>= jx_5_2 0) (and (< jx_5_2 (|Seq#Length| c)) (not (= ix_5_2 jx_5_2)))))) (not (= (|Seq#Index| c ix_5_2) (|Seq#Index| c jx_5_2))))
 :qid |stdinbpl.3097:20|
 :skolemid |242|
 :pattern ( (|Seq#Index| c ix_5_2) (|Seq#Index| c jx_5_2))
)) (state Heap@@33 QPMask@1)) (and (and (=> (= (ControlFlow 0 172) 169) anon97_Else_correct) (=> (= (ControlFlow 0 172) 33) anon98_Then_correct)) (=> (= (ControlFlow 0 172) 36) anon98_Else_correct)))))
(let ((anon19_correct true))
(let ((anon96_Else_correct  (=> (and (not (and (>= ix_12 0) (and (< ix_12 (|Seq#Length| c)) (and (>= jx_12 0) (and (< jx_12 (|Seq#Length| c)) (not (= ix_12 jx_12))))))) (= (ControlFlow 0 31) 25)) anon19_correct)))
(let ((anon96_Then_correct  (=> (and (>= ix_12 0) (and (< ix_12 (|Seq#Length| c)) (and (>= jx_12 0) (and (< jx_12 (|Seq#Length| c)) (not (= ix_12 jx_12)))))) (and (=> (= (ControlFlow 0 26) (- 0 30)) (>= ix_12 0)) (=> (>= ix_12 0) (and (=> (= (ControlFlow 0 26) (- 0 29)) (< ix_12 (|Seq#Length| c))) (=> (< ix_12 (|Seq#Length| c)) (and (=> (= (ControlFlow 0 26) (- 0 28)) (>= jx_12 0)) (=> (>= jx_12 0) (and (=> (= (ControlFlow 0 26) (- 0 27)) (< jx_12 (|Seq#Length| c))) (=> (< jx_12 (|Seq#Length| c)) (=> (= (ControlFlow 0 26) 25) anon19_correct))))))))))))
(let ((anon93_Else_correct  (and (=> (= (ControlFlow 0 173) (- 0 175)) (forall ((i_3 Int) (i_3_1 Int) ) (!  (=> (and (and (and (and (not (= i_3 i_3_1)) (and (<= 0 i_3) (< i_3 len))) (and (<= 0 i_3_1) (< i_3_1 len))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= (|Seq#Index| b_2 i_3) (|Seq#Index| b_2 i_3_1))))
 :qid |stdinbpl.3041:15|
 :skolemid |235|
))) (=> (forall ((i_3@@0 Int) (i_3_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_3@@0 i_3_1@@0)) (and (<= 0 i_3@@0) (< i_3@@0 len))) (and (<= 0 i_3_1@@0) (< i_3_1@@0 len))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= (|Seq#Index| b_2 i_3@@0) (|Seq#Index| b_2 i_3_1@@0))))
 :qid |stdinbpl.3041:15|
 :skolemid |235|
)) (=> (and (forall ((i_3@@1 Int) ) (!  (=> (and (and (<= 0 i_3@@1) (< i_3@@1 len)) (< NoPerm (/ (to_real 1) (to_real 2)))) (and (qpRange19 (|Seq#Index| b_2 i_3@@1)) (= (invRecv19 (|Seq#Index| b_2 i_3@@1)) i_3@@1)))
 :qid |stdinbpl.3047:22|
 :skolemid |236|
 :pattern ( (|Seq#Index| b_2 i_3@@1))
 :pattern ( (|Seq#Index| b_2 i_3@@1))
)) (forall ((o_3@@38 T@U) ) (!  (=> (= (type o_3@@38) RefType) (=> (and (and (and (<= 0 (invRecv19 o_3@@38)) (< (invRecv19 o_3@@38) len)) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange19 o_3@@38)) (= (|Seq#Index| b_2 (invRecv19 o_3@@38)) o_3@@38)))
 :qid |stdinbpl.3051:22|
 :skolemid |237|
 :pattern ( (invRecv19 o_3@@38))
))) (and (=> (= (ControlFlow 0 173) (- 0 174)) (forall ((i_3@@2 Int) ) (!  (=> (and (<= 0 i_3@@2) (< i_3@@2 len)) (>= (/ (to_real 1) (to_real 2)) NoPerm))
 :qid |stdinbpl.3057:15|
 :skolemid |238|
 :pattern ( (|Seq#Index| b_2 i_3@@2))
 :pattern ( (|Seq#Index| b_2 i_3@@2))
))) (=> (forall ((i_3@@3 Int) ) (!  (=> (and (<= 0 i_3@@3) (< i_3@@3 len)) (>= (/ (to_real 1) (to_real 2)) NoPerm))
 :qid |stdinbpl.3057:15|
 :skolemid |238|
 :pattern ( (|Seq#Index| b_2 i_3@@3))
 :pattern ( (|Seq#Index| b_2 i_3@@3))
)) (=> (forall ((i_3@@4 Int) ) (!  (=> (and (and (<= 0 i_3@@4) (< i_3@@4 len)) (> (/ (to_real 1) (to_real 2)) NoPerm)) (not (= (|Seq#Index| b_2 i_3@@4) null)))
 :qid |stdinbpl.3063:22|
 :skolemid |239|
 :pattern ( (|Seq#Index| b_2 i_3@@4))
 :pattern ( (|Seq#Index| b_2 i_3@@4))
)) (=> (and (forall ((o_3@@39 T@U) ) (!  (=> (= (type o_3@@39) RefType) (and (=> (and (and (and (<= 0 (invRecv19 o_3@@39)) (< (invRecv19 o_3@@39) len)) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange19 o_3@@39)) (and (=> (< NoPerm (/ (to_real 1) (to_real 2))) (= (|Seq#Index| b_2 (invRecv19 o_3@@39)) o_3@@39)) (= (U_2_real (MapType1Select QPMask@1 o_3@@39 Ref__Integer_value)) (+ (U_2_real (MapType1Select QPMask@0 o_3@@39 Ref__Integer_value)) (/ (to_real 1) (to_real 2)))))) (=> (not (and (and (and (<= 0 (invRecv19 o_3@@39)) (< (invRecv19 o_3@@39) len)) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange19 o_3@@39))) (= (U_2_real (MapType1Select QPMask@1 o_3@@39 Ref__Integer_value)) (U_2_real (MapType1Select QPMask@0 o_3@@39 Ref__Integer_value))))))
 :qid |stdinbpl.3069:22|
 :skolemid |240|
 :pattern ( (MapType1Select QPMask@1 o_3@@39 Ref__Integer_value))
)) (forall ((o_3@@40 T@U) (f_5@@12 T@U) ) (! (let ((B@@24 (FieldTypeInv1 (type f_5@@12))))
(let ((A@@25 (FieldTypeInv0 (type f_5@@12))))
 (=> (and (and (= (type o_3@@40) RefType) (= (type f_5@@12) (FieldType A@@25 B@@24))) (not (= f_5@@12 Ref__Integer_value))) (= (U_2_real (MapType1Select QPMask@0 o_3@@40 f_5@@12)) (U_2_real (MapType1Select QPMask@1 o_3@@40 f_5@@12))))))
 :qid |stdinbpl.3073:29|
 :skolemid |241|
 :pattern ( (MapType1Select QPMask@0 o_3@@40 f_5@@12))
 :pattern ( (MapType1Select QPMask@1 o_3@@40 f_5@@12))
))) (=> (and (and (state Heap@@33 QPMask@1) (state Heap@@33 QPMask@1)) (and (= (|Seq#Length| c) len) (state Heap@@33 QPMask@1))) (and (and (=> (= (ControlFlow 0 173) 172) anon95_Else_correct) (=> (= (ControlFlow 0 173) 26) anon96_Then_correct)) (=> (= (ControlFlow 0 173) 31) anon96_Else_correct))))))))))))
(let ((anon15_correct true))
(let ((anon94_Else_correct  (=> (and (not (and (<= 0 i_24) (< i_24 len))) (= (ControlFlow 0 24) 20)) anon15_correct)))
(let ((anon94_Then_correct  (=> (and (<= 0 i_24) (< i_24 len)) (and (=> (= (ControlFlow 0 21) (- 0 23)) (>= i_24 0)) (=> (>= i_24 0) (and (=> (= (ControlFlow 0 21) (- 0 22)) (< i_24 (|Seq#Length| b_2))) (=> (< i_24 (|Seq#Length| b_2)) (=> (= (ControlFlow 0 21) 20) anon15_correct))))))))
(let ((anon91_Else_correct  (=> (and (forall ((ix_3 Int) (jx_3 Int) ) (!  (=> (and (>= ix_3 0) (and (< ix_3 (|Seq#Length| b_2)) (and (>= jx_3 0) (and (< jx_3 (|Seq#Length| b_2)) (not (= ix_3 jx_3)))))) (not (= (|Seq#Index| b_2 ix_3) (|Seq#Index| b_2 jx_3))))
 :qid |stdinbpl.3023:20|
 :skolemid |234|
 :pattern ( (|Seq#Index| b_2 ix_3) (|Seq#Index| b_2 jx_3))
)) (state Heap@@33 QPMask@0)) (and (and (=> (= (ControlFlow 0 176) 173) anon93_Else_correct) (=> (= (ControlFlow 0 176) 21) anon94_Then_correct)) (=> (= (ControlFlow 0 176) 24) anon94_Else_correct)))))
(let ((anon11_correct true))
(let ((anon92_Else_correct  (=> (and (not (and (>= ix_11 0) (and (< ix_11 (|Seq#Length| b_2)) (and (>= jx_11 0) (and (< jx_11 (|Seq#Length| b_2)) (not (= ix_11 jx_11))))))) (= (ControlFlow 0 19) 13)) anon11_correct)))
(let ((anon92_Then_correct  (=> (and (>= ix_11 0) (and (< ix_11 (|Seq#Length| b_2)) (and (>= jx_11 0) (and (< jx_11 (|Seq#Length| b_2)) (not (= ix_11 jx_11)))))) (and (=> (= (ControlFlow 0 14) (- 0 18)) (>= ix_11 0)) (=> (>= ix_11 0) (and (=> (= (ControlFlow 0 14) (- 0 17)) (< ix_11 (|Seq#Length| b_2))) (=> (< ix_11 (|Seq#Length| b_2)) (and (=> (= (ControlFlow 0 14) (- 0 16)) (>= jx_11 0)) (=> (>= jx_11 0) (and (=> (= (ControlFlow 0 14) (- 0 15)) (< jx_11 (|Seq#Length| b_2))) (=> (< jx_11 (|Seq#Length| b_2)) (=> (= (ControlFlow 0 14) 13) anon11_correct))))))))))))
(let ((anon89_Else_correct  (and (=> (= (ControlFlow 0 177) (- 0 178)) (forall ((i_1 Int) (i_1_2 Int) ) (!  (=> (and (and (and (and (not (= i_1 i_1_2)) (and (<= 0 i_1) (< i_1 len))) (and (<= 0 i_1_2) (< i_1_2 len))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| a_2 i_1) (|Seq#Index| a_2 i_1_2))))
 :qid |stdinbpl.2973:15|
 :skolemid |228|
))) (=> (forall ((i_1@@0 Int) (i_1_2@@0 Int) ) (!  (=> (and (and (and (and (not (= i_1@@0 i_1_2@@0)) (and (<= 0 i_1@@0) (< i_1@@0 len))) (and (<= 0 i_1_2@@0) (< i_1_2@@0 len))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| a_2 i_1@@0) (|Seq#Index| a_2 i_1_2@@0))))
 :qid |stdinbpl.2973:15|
 :skolemid |228|
)) (=> (forall ((i_1@@1 Int) ) (!  (=> (and (and (<= 0 i_1@@1) (< i_1@@1 len)) (< NoPerm FullPerm)) (and (qpRange18 (|Seq#Index| a_2 i_1@@1)) (= (invRecv18 (|Seq#Index| a_2 i_1@@1)) i_1@@1)))
 :qid |stdinbpl.2979:22|
 :skolemid |229|
 :pattern ( (|Seq#Index| a_2 i_1@@1))
 :pattern ( (|Seq#Index| a_2 i_1@@1))
)) (=> (and (and (and (forall ((o_3@@41 T@U) ) (!  (=> (= (type o_3@@41) RefType) (=> (and (and (and (<= 0 (invRecv18 o_3@@41)) (< (invRecv18 o_3@@41) len)) (< NoPerm FullPerm)) (qpRange18 o_3@@41)) (= (|Seq#Index| a_2 (invRecv18 o_3@@41)) o_3@@41)))
 :qid |stdinbpl.2983:22|
 :skolemid |230|
 :pattern ( (invRecv18 o_3@@41))
)) (forall ((i_1@@2 Int) ) (!  (=> (and (<= 0 i_1@@2) (< i_1@@2 len)) (not (= (|Seq#Index| a_2 i_1@@2) null)))
 :qid |stdinbpl.2989:22|
 :skolemid |231|
 :pattern ( (|Seq#Index| a_2 i_1@@2))
 :pattern ( (|Seq#Index| a_2 i_1@@2))
))) (and (forall ((o_3@@42 T@U) ) (!  (=> (= (type o_3@@42) RefType) (and (=> (and (and (and (<= 0 (invRecv18 o_3@@42)) (< (invRecv18 o_3@@42) len)) (< NoPerm FullPerm)) (qpRange18 o_3@@42)) (and (=> (< NoPerm FullPerm) (= (|Seq#Index| a_2 (invRecv18 o_3@@42)) o_3@@42)) (= (U_2_real (MapType1Select QPMask@0 o_3@@42 Ref__Integer_value)) (+ (U_2_real (MapType1Select ZeroMask o_3@@42 Ref__Integer_value)) FullPerm)))) (=> (not (and (and (and (<= 0 (invRecv18 o_3@@42)) (< (invRecv18 o_3@@42) len)) (< NoPerm FullPerm)) (qpRange18 o_3@@42))) (= (U_2_real (MapType1Select QPMask@0 o_3@@42 Ref__Integer_value)) (U_2_real (MapType1Select ZeroMask o_3@@42 Ref__Integer_value))))))
 :qid |stdinbpl.2995:22|
 :skolemid |232|
 :pattern ( (MapType1Select QPMask@0 o_3@@42 Ref__Integer_value))
)) (forall ((o_3@@43 T@U) (f_5@@13 T@U) ) (! (let ((B@@25 (FieldTypeInv1 (type f_5@@13))))
(let ((A@@26 (FieldTypeInv0 (type f_5@@13))))
 (=> (and (and (= (type o_3@@43) RefType) (= (type f_5@@13) (FieldType A@@26 B@@25))) (not (= f_5@@13 Ref__Integer_value))) (= (U_2_real (MapType1Select ZeroMask o_3@@43 f_5@@13)) (U_2_real (MapType1Select QPMask@0 o_3@@43 f_5@@13))))))
 :qid |stdinbpl.2999:29|
 :skolemid |233|
 :pattern ( (MapType1Select ZeroMask o_3@@43 f_5@@13))
 :pattern ( (MapType1Select QPMask@0 o_3@@43 f_5@@13))
)))) (and (and (state Heap@@33 QPMask@0) (state Heap@@33 QPMask@0)) (and (= (|Seq#Length| b_2) len) (state Heap@@33 QPMask@0)))) (and (and (=> (= (ControlFlow 0 177) 176) anon91_Else_correct) (=> (= (ControlFlow 0 177) 14) anon92_Then_correct)) (=> (= (ControlFlow 0 177) 19) anon92_Else_correct))))))))
(let ((anon7_correct true))
(let ((anon90_Else_correct  (=> (and (not (and (<= 0 i_22) (< i_22 len))) (= (ControlFlow 0 12) 8)) anon7_correct)))
(let ((anon90_Then_correct  (=> (and (<= 0 i_22) (< i_22 len)) (and (=> (= (ControlFlow 0 9) (- 0 11)) (>= i_22 0)) (=> (>= i_22 0) (and (=> (= (ControlFlow 0 9) (- 0 10)) (< i_22 (|Seq#Length| a_2))) (=> (< i_22 (|Seq#Length| a_2)) (=> (= (ControlFlow 0 9) 8) anon7_correct))))))))
(let ((anon87_Else_correct  (=> (and (forall ((ix_1_1 Int) (jx_1_1 Int) ) (!  (=> (and (>= ix_1_1 0) (and (< ix_1_1 (|Seq#Length| a_2)) (and (>= jx_1_1 0) (and (< jx_1_1 (|Seq#Length| a_2)) (not (= ix_1_1 jx_1_1)))))) (not (= (|Seq#Index| a_2 ix_1_1) (|Seq#Index| a_2 jx_1_1))))
 :qid |stdinbpl.2955:20|
 :skolemid |227|
 :pattern ( (|Seq#Index| a_2 ix_1_1) (|Seq#Index| a_2 jx_1_1))
)) (state Heap@@33 ZeroMask)) (and (and (=> (= (ControlFlow 0 179) 177) anon89_Else_correct) (=> (= (ControlFlow 0 179) 9) anon90_Then_correct)) (=> (= (ControlFlow 0 179) 12) anon90_Else_correct)))))
(let ((anon3_correct true))
(let ((anon88_Else_correct  (=> (and (not (and (>= ix_10 0) (and (< ix_10 (|Seq#Length| a_2)) (and (>= jx_10 0) (and (< jx_10 (|Seq#Length| a_2)) (not (= ix_10 jx_10))))))) (= (ControlFlow 0 7) 1)) anon3_correct)))
(let ((anon88_Then_correct  (=> (and (>= ix_10 0) (and (< ix_10 (|Seq#Length| a_2)) (and (>= jx_10 0) (and (< jx_10 (|Seq#Length| a_2)) (not (= ix_10 jx_10)))))) (and (=> (= (ControlFlow 0 2) (- 0 6)) (>= ix_10 0)) (=> (>= ix_10 0) (and (=> (= (ControlFlow 0 2) (- 0 5)) (< ix_10 (|Seq#Length| a_2))) (=> (< ix_10 (|Seq#Length| a_2)) (and (=> (= (ControlFlow 0 2) (- 0 4)) (>= jx_10 0)) (=> (>= jx_10 0) (and (=> (= (ControlFlow 0 2) (- 0 3)) (< jx_10 (|Seq#Length| a_2))) (=> (< jx_10 (|Seq#Length| a_2)) (=> (= (ControlFlow 0 2) 1) anon3_correct))))))))))))
(let ((anon0_correct  (=> (state Heap@@33 ZeroMask) (=> (and (and (and (= AssumeFunctionsAbove (- 0 1)) (U_2_bool (MapType0Select Heap@@33 diz $allocated))) (and (not (= diz null)) (state Heap@@33 ZeroMask))) (and (and (>= current_thread_id 0) (state Heap@@33 ZeroMask)) (and (= (|Seq#Length| a_2) len) (state Heap@@33 ZeroMask)))) (and (and (=> (= (ControlFlow 0 180) 179) anon87_Else_correct) (=> (= (ControlFlow 0 180) 2) anon88_Then_correct)) (=> (= (ControlFlow 0 180) 7) anon88_Else_correct))))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 181) 180) anon0_correct)))
PreconditionGeneratedEntry_correct))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
))
(check-sat)
(pop 1)
; Valid
(get-info :rlimit)
