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
(declare-fun |Ref__multidim_index_2'| (T@U Int Int Int Int) Int)
(declare-fun MapType0Type (T@T) T@T)
(declare-fun RefType () T@T)
(declare-fun MapType1Type (T@T T@T) T@T)
(declare-fun AssumeFunctionsAbove () Int)
(declare-fun |Ref__multidim_index_2#trigger| (T@U Int Int Int Int) Bool)
(declare-fun EmptyFrame () T@U)
(declare-fun MapType0TypeInv0 (T@T) T@T)
(declare-fun MapType0Select (T@U T@U T@U) T@U)
(declare-fun MapType0Store (T@U T@U T@U T@U) T@U)
(declare-fun MapType1TypeInv0 (T@T) T@T)
(declare-fun MapType1TypeInv1 (T@T) T@T)
(declare-fun MapType1Select (T@U T@U T@U) T@U)
(declare-fun MapType1Store (T@U T@U T@U T@U) T@U)
(declare-fun FrameTypeType () T@T)
(declare-fun |count_square'| (T@U Int Int Int Int Int Int T@U Int) Int)
(declare-fun |count_square#frame| (T@U Int Int Int Int Int Int T@U Int) Int)
(declare-fun FrameFragment (T@U) T@U)
(declare-fun |count_square#condqp3| (T@U Int Int Int Int Int Int T@U Int) Int)
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
(declare-fun |Seq#Update| (T@U Int T@U) T@U)
(declare-fun |Seq#Take| (T@U Int) T@U)
(declare-fun |Seq#Contains| (T@U T@U) Bool)
(declare-fun |Seq#Range| (Int Int) T@U)
(declare-fun |Seq#Skolem| (T@U T@U) Int)
(declare-fun count_square (T@U Int Int Int Int Int Int T@U Int) Int)
(declare-fun |Seq#Singleton| (T@U) T@U)
(declare-fun |count_square#triggerStateless| (Int Int Int Int Int Int T@U Int) Int)
(declare-fun |Seq#Empty| (T@T) T@U)
(declare-fun dummyHeap () T@U)
(declare-fun ZeroMask () T@U)
(declare-fun InsidePredicate (T@U T@U T@U T@U) Bool)
(declare-fun |Seq#Append| (T@U T@U) T@U)
(declare-fun count_array (T@U Int Int T@U Int) Int)
(declare-fun |count_array'| (T@U Int Int T@U Int) Int)
(declare-fun sum_square (T@U Int Int Int Int Int Int T@U) Int)
(declare-fun |sum_square'| (T@U Int Int Int Int Int Int T@U) Int)
(declare-fun |sum_list#frame| (T@U Int Int T@U) Int)
(declare-fun sumMask (T@U T@U T@U) Bool)
(declare-fun |Ref__multidim_index_2#triggerStateless| (Int Int Int Int) Int)
(declare-fun |sum_array'| (T@U Int Int Int T@U) Int)
(declare-fun |sum_array#triggerStateless| (Int Int Int T@U) Int)
(declare-fun |count_list'| (T@U Int Int T@U Int) Int)
(declare-fun |count_list#triggerStateless| (Int Int T@U Int) Int)
(declare-fun |count_array#triggerStateless| (Int Int T@U Int) Int)
(declare-fun ConditionalFrame (Real T@U) T@U)
(declare-fun NoPerm () Real)
(declare-fun count_list (T@U Int Int T@U Int) Int)
(declare-fun Ref__multidim_index_2 (T@U Int Int Int Int) Int)
(declare-fun sum_array (T@U Int Int Int T@U) Int)
(declare-fun |sum_square#triggerStateless| (Int Int Int Int Int Int T@U) Int)
(declare-fun |Ref__multidim_index_2#frame| (T@U Int Int Int Int) Int)
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
 :qid |stdinbpl.340:18|
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
)))) (= (Ctor FrameTypeType) 12)) (= (type EmptyFrame) FrameTypeType)))
(assert (forall ((Heap T@U) (Mask T@U) (N0 Int) (N1 Int) (i0 Int) (i1 Int) ) (!  (=> (and (and (= (type Heap) (MapType0Type RefType)) (= (type Mask) (MapType1Type RefType realType))) (and (state Heap Mask) (or (< AssumeFunctionsAbove 0) (|Ref__multidim_index_2#trigger| EmptyFrame N0 N1 i0 i1)))) (=> (and (and (and (and (and (<= 0 i0) (< i0 N0)) (<= 0 N0)) (<= 0 i1)) (< i1 N1)) (<= 0 N1)) (= (|Ref__multidim_index_2'| Heap N0 N1 i0 i1) (+ (* i0 N1) i1))))
 :qid |stdinbpl.646:15|
 :skolemid |63|
 :pattern ( (state Heap Mask) (|Ref__multidim_index_2'| Heap N0 N1 i0 i1))
)))
(assert (forall ((arg0@@26 T@U) ) (! (= (type (FrameFragment arg0@@26)) FrameTypeType)
 :qid |funType:FrameFragment|
 :pattern ( (FrameFragment arg0@@26))
)))
(assert (forall ((Heap@@0 T@U) (Mask@@0 T@U) (i Int) (lo Int) (hi Int) (step Int) (vmin Int) (vmax Int) (ar T@U) (v_2 Int) ) (!  (=> (and (and (and (= (type Heap@@0) (MapType0Type RefType)) (= (type Mask@@0) (MapType1Type RefType realType))) (= (type ar) (SeqType RefType))) (state Heap@@0 Mask@@0)) (= (|count_square'| Heap@@0 i lo hi step vmin vmax ar v_2) (|count_square#frame| (FrameFragment (int_2_U (|count_square#condqp3| Heap@@0 i lo hi step vmin vmax ar v_2))) i lo hi step vmin vmax ar v_2)))
 :qid |stdinbpl.1346:15|
 :skolemid |120|
 :pattern ( (state Heap@@0 Mask@@0) (|count_square'| Heap@@0 i lo hi step vmin vmax ar v_2))
)))
(assert (forall ((Heap@@1 T@U) (Mask@@1 T@U) (N0@@0 Int) (N1@@0 Int) (i0@@0 Int) (i1@@0 Int) ) (!  (=> (and (and (= (type Heap@@1) (MapType0Type RefType)) (= (type Mask@@1) (MapType1Type RefType realType))) (and (state Heap@@1 Mask@@1) (or (< AssumeFunctionsAbove 0) (|Ref__multidim_index_2#trigger| EmptyFrame N0@@0 N1@@0 i0@@0 i1@@0)))) (=> (and (and (and (and (and (<= 0 i0@@0) (< i0@@0 N0@@0)) (<= 0 N0@@0)) (<= 0 i1@@0)) (< i1@@0 N1@@0)) (<= 0 N1@@0)) (< (mod (|Ref__multidim_index_2'| Heap@@1 N0@@0 N1@@0 i0@@0 i1@@0) N1@@0) N0@@0)))
 :qid |stdinbpl.654:15|
 :skolemid |65|
 :pattern ( (state Heap@@1 Mask@@1) (|Ref__multidim_index_2'| Heap@@1 N0@@0 N1@@0 i0@@0 i1@@0))
)))
(assert (forall ((Heap0 T@U) (Heap1 T@U) ) (!  (=> (and (and (= (type Heap0) (MapType0Type RefType)) (= (type Heap1) (MapType0Type RefType))) (succHeap Heap0 Heap1)) (succHeapTrans Heap0 Heap1))
 :qid |stdinbpl.88:15|
 :skolemid |11|
 :pattern ( (succHeap Heap0 Heap1))
)))
(assert (forall ((Heap@@2 T@U) (Mask@@2 T@U) ) (!  (=> (and (and (= (type Heap@@2) (MapType0Type RefType)) (= (type Mask@@2) (MapType1Type RefType realType))) (state Heap@@2 Mask@@2)) (GoodMask Mask@@2))
 :qid |stdinbpl.124:15|
 :skolemid |15|
 :pattern ( (state Heap@@2 Mask@@2))
)))
(assert (forall ((Heap0@@0 T@U) (Heap1@@0 T@U) (Heap2 T@U) ) (!  (=> (and (and (and (= (type Heap0@@0) (MapType0Type RefType)) (= (type Heap1@@0) (MapType0Type RefType))) (= (type Heap2) (MapType0Type RefType))) (and (succHeapTrans Heap0@@0 Heap1@@0) (succHeap Heap1@@0 Heap2))) (succHeapTrans Heap0@@0 Heap2))
 :qid |stdinbpl.93:15|
 :skolemid |12|
 :pattern ( (succHeapTrans Heap0@@0 Heap1@@0) (succHeap Heap1@@0 Heap2))
)))
(assert (forall ((Heap@@3 T@U) (i@@0 Int) (hi@@0 Int) (ar@@0 T@U) ) (!  (=> (and (= (type Heap@@3) (MapType0Type RefType)) (= (type ar@@0) (SeqType intType))) (dummyFunction (int_2_U (|sum_list#triggerStateless| i@@0 hi@@0 ar@@0))))
 :qid |stdinbpl.721:15|
 :skolemid |67|
 :pattern ( (|sum_list'| Heap@@3 i@@0 hi@@0 ar@@0))
)))
(assert (forall ((arg0@@27 T@U) (arg1@@10 Int) ) (! (let ((T@@1 (SeqTypeInv0 (type arg0@@27))))
(= (type (|Seq#Index| arg0@@27 arg1@@10)) T@@1))
 :qid |funType:Seq#Index|
 :pattern ( (|Seq#Index| arg0@@27 arg1@@10))
)))
(assert (forall ((s@@0 T@U) (n@@0 Int) (j Int) ) (! (let ((T@@2 (SeqTypeInv0 (type s@@0))))
 (=> (= (type s@@0) (SeqType T@@2)) (=> (and (and (< 0 n@@0) (<= 0 j)) (< j (- (|Seq#Length| s@@0) n@@0))) (and (= (|Seq#Sub| (|Seq#Add| j n@@0) n@@0) j) (= (|Seq#Index| (|Seq#Drop| s@@0 n@@0) j) (|Seq#Index| s@@0 (|Seq#Add| j n@@0)))))))
 :qid |stdinbpl.361:18|
 :skolemid |39|
 :pattern ( (|Seq#Index| (|Seq#Drop| s@@0 n@@0) j))
)))
(assert  (and (= (type null) RefType) (forall ((arg0@@28 T@U) ) (! (let ((A (FieldTypeInv0 (type arg0@@28))))
(= (type (PredicateMaskField arg0@@28)) (FieldType A (MapType1Type RefType boolType))))
 :qid |funType:PredicateMaskField|
 :pattern ( (PredicateMaskField arg0@@28))
))))
(assert (forall ((Heap@@4 T@U) (ExhaleHeap T@U) (Mask@@3 T@U) (pm_f T@U) ) (! (let ((C (FieldTypeInv0 (type pm_f))))
 (=> (and (and (and (and (and (= (type Heap@@4) (MapType0Type RefType)) (= (type ExhaleHeap) (MapType0Type RefType))) (= (type Mask@@3) (MapType1Type RefType realType))) (= (type pm_f) (FieldType C FrameTypeType))) (IdenticalOnKnownLocations Heap@@4 ExhaleHeap Mask@@3)) (and (HasDirectPerm Mask@@3 null pm_f) (IsPredicateField pm_f))) (= (MapType0Select Heap@@4 null (PredicateMaskField pm_f)) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))))
 :qid |stdinbpl.47:19|
 :skolemid |2|
 :pattern ( (IdenticalOnKnownLocations Heap@@4 ExhaleHeap Mask@@3) (IsPredicateField pm_f) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))
)))
(assert (forall ((arg0@@29 T@U) ) (! (let ((A@@0 (FieldTypeInv0 (type arg0@@29))))
(= (type (WandMaskField arg0@@29)) (FieldType A@@0 (MapType1Type RefType boolType))))
 :qid |funType:WandMaskField|
 :pattern ( (WandMaskField arg0@@29))
)))
(assert (forall ((Heap@@5 T@U) (ExhaleHeap@@0 T@U) (Mask@@4 T@U) (pm_f@@0 T@U) ) (! (let ((C@@0 (FieldTypeInv0 (type pm_f@@0))))
 (=> (and (and (and (and (and (= (type Heap@@5) (MapType0Type RefType)) (= (type ExhaleHeap@@0) (MapType0Type RefType))) (= (type Mask@@4) (MapType1Type RefType realType))) (= (type pm_f@@0) (FieldType C@@0 FrameTypeType))) (IdenticalOnKnownLocations Heap@@5 ExhaleHeap@@0 Mask@@4)) (and (HasDirectPerm Mask@@4 null pm_f@@0) (IsWandField pm_f@@0))) (= (MapType0Select Heap@@5 null (WandMaskField pm_f@@0)) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))))
 :qid |stdinbpl.60:19|
 :skolemid |5|
 :pattern ( (IdenticalOnKnownLocations Heap@@5 ExhaleHeap@@0 Mask@@4) (IsWandField pm_f@@0) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))
)))
(assert (forall ((Heap@@6 T@U) (Mask@@5 T@U) (N0@@1 Int) (N1@@1 Int) (i0@@1 Int) (i1@@1 Int) ) (!  (=> (and (and (= (type Heap@@6) (MapType0Type RefType)) (= (type Mask@@5) (MapType1Type RefType realType))) (and (state Heap@@6 Mask@@5) (or (< AssumeFunctionsAbove 0) (|Ref__multidim_index_2#trigger| EmptyFrame N0@@1 N1@@1 i0@@1 i1@@1)))) (=> (and (and (and (and (and (<= 0 i0@@1) (< i0@@1 N0@@1)) (<= 0 N0@@1)) (<= 0 i1@@1)) (< i1@@1 N1@@1)) (<= 0 N1@@1)) (= (mod (|Ref__multidim_index_2'| Heap@@6 N0@@1 N1@@1 i0@@1 i1@@1) N1@@1) i1@@1)))
 :qid |stdinbpl.650:15|
 :skolemid |64|
 :pattern ( (state Heap@@6 Mask@@5) (|Ref__multidim_index_2'| Heap@@6 N0@@1 N1@@1 i0@@1 i1@@1))
)))
(assert (forall ((arg0@@30 T@U) (arg1@@11 Int) (arg2@@3 T@U) ) (! (let ((T@@3 (type arg2@@3)))
(= (type (|Seq#Update| arg0@@30 arg1@@11 arg2@@3)) (SeqType T@@3)))
 :qid |funType:Seq#Update|
 :pattern ( (|Seq#Update| arg0@@30 arg1@@11 arg2@@3))
)))
(assert (forall ((s@@1 T@U) (i@@1 Int) (v T@U) (n@@1 Int) ) (! (let ((T@@4 (type v)))
 (=> (= (type s@@1) (SeqType T@@4)) (=> (and (<= 0 n@@1) (< n@@1 (|Seq#Length| s@@1))) (and (=> (= i@@1 n@@1) (= (|Seq#Index| (|Seq#Update| s@@1 i@@1 v) n@@1) v)) (=> (not (= i@@1 n@@1)) (= (|Seq#Index| (|Seq#Update| s@@1 i@@1 v) n@@1) (|Seq#Index| s@@1 n@@1)))))))
 :qid |stdinbpl.316:18|
 :skolemid |35|
 :pattern ( (|Seq#Index| (|Seq#Update| s@@1 i@@1 v) n@@1))
 :pattern ( (|Seq#Index| s@@1 n@@1) (|Seq#Update| s@@1 i@@1 v))
)))
(assert (forall ((arg0@@31 T@U) (arg1@@12 Int) ) (! (let ((T@@5 (SeqTypeInv0 (type arg0@@31))))
(= (type (|Seq#Take| arg0@@31 arg1@@12)) (SeqType T@@5)))
 :qid |funType:Seq#Take|
 :pattern ( (|Seq#Take| arg0@@31 arg1@@12))
)))
(assert (forall ((s@@2 T@U) (n@@2 Int) ) (! (let ((T@@6 (SeqTypeInv0 (type s@@2))))
 (=> (= (type s@@2) (SeqType T@@6)) (and (=> (<= 0 n@@2) (and (=> (<= n@@2 (|Seq#Length| s@@2)) (= (|Seq#Length| (|Seq#Take| s@@2 n@@2)) n@@2)) (=> (< (|Seq#Length| s@@2) n@@2) (= (|Seq#Length| (|Seq#Take| s@@2 n@@2)) (|Seq#Length| s@@2))))) (=> (< n@@2 0) (= (|Seq#Length| (|Seq#Take| s@@2 n@@2)) 0)))))
 :qid |stdinbpl.327:18|
 :skolemid |36|
 :pattern ( (|Seq#Length| (|Seq#Take| s@@2 n@@2)))
 :pattern ( (|Seq#Take| s@@2 n@@2) (|Seq#Length| s@@2))
)))
(assert (forall ((arg0@@32 Int) (arg1@@13 Int) ) (! (= (type (|Seq#Range| arg0@@32 arg1@@13)) (SeqType intType))
 :qid |funType:Seq#Range|
 :pattern ( (|Seq#Range| arg0@@32 arg1@@13))
)))
(assert (forall ((q@min Int) (q@max Int) (v@@0 T@U) ) (!  (=> (= (type v@@0) intType) (= (|Seq#Contains| (|Seq#Range| q@min q@max) v@@0)  (and (<= q@min (U_2_int v@@0)) (< (U_2_int v@@0) q@max))))
 :qid |stdinbpl.600:15|
 :skolemid |57|
 :pattern ( (|Seq#Contains| (|Seq#Range| q@min q@max) v@@0))
)))
(assert (forall ((s@@3 T@U) (x@@8 T@U) ) (! (let ((T@@7 (type x@@8)))
 (=> (and (= (type s@@3) (SeqType T@@7)) (|Seq#Contains| s@@3 x@@8)) (and (and (<= 0 (|Seq#Skolem| s@@3 x@@8)) (< (|Seq#Skolem| s@@3 x@@8) (|Seq#Length| s@@3))) (= (|Seq#Index| s@@3 (|Seq#Skolem| s@@3 x@@8)) x@@8))))
 :qid |stdinbpl.458:18|
 :skolemid |47|
 :pattern ( (|Seq#Contains| s@@3 x@@8))
)))
(assert (forall ((Heap@@7 T@U) (Mask@@6 T@U) (i@@2 Int) (lo@@0 Int) (hi@@1 Int) (step@@0 Int) (vmin@@0 Int) (vmax@@0 Int) (ar@@1 T@U) (v_2@@0 Int) ) (!  (=> (and (and (and (= (type Heap@@7) (MapType0Type RefType)) (= (type Mask@@6) (MapType1Type RefType realType))) (= (type ar@@1) (SeqType RefType))) (and (state Heap@@7 Mask@@6) (< AssumeFunctionsAbove 2))) (=> (and (and (and (and (<= 0 lo@@0) (and (<= lo@@0 hi@@1) (and (<= hi@@1 step@@0) (> step@@0 0)))) (and (<= 0 vmin@@0) (and (<= vmin@@0 i@@2) (<= i@@2 vmax@@0)))) (<= vmax@@0 (|Seq#Length| ar@@1))) (forall ((j@@0 Int) (k Int) ) (!  (=> (and (<= 0 j@@0) (and (< j@@0 vmax@@0) (and (<= 0 k) (and (< k vmax@@0) (not (= j@@0 k)))))) (not (= (|Seq#Index| ar@@1 j@@0) (|Seq#Index| ar@@1 k))))
 :qid |stdinbpl.1338:189|
 :skolemid |118|
 :pattern ( (|Seq#Index| ar@@1 j@@0) (|Seq#Index| ar@@1 k))
))) (= (count_square Heap@@7 i@@2 lo@@0 hi@@1 step@@0 vmin@@0 vmax@@0 ar@@1 v_2@@0) (ite (< i@@2 vmax@@0) (+ (ite  (and (<= lo@@0 (mod i@@2 step@@0)) (and (< (mod i@@2 step@@0) hi@@1) (= (U_2_int (MapType0Select Heap@@7 (|Seq#Index| ar@@1 i@@2) Ref__Integer_value)) v_2@@0))) 1 0) (|count_square'| Heap@@7 (+ i@@2 1) lo@@0 hi@@1 step@@0 vmin@@0 vmax@@0 ar@@1 v_2@@0)) 0))))
 :qid |stdinbpl.1336:15|
 :skolemid |119|
 :pattern ( (state Heap@@7 Mask@@6) (count_square Heap@@7 i@@2 lo@@0 hi@@1 step@@0 vmin@@0 vmax@@0 ar@@1 v_2@@0))
)))
(assert (forall ((Heap@@8 T@U) (ExhaleHeap@@1 T@U) (Mask@@7 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@8) (MapType0Type RefType)) (= (type ExhaleHeap@@1) (MapType0Type RefType))) (= (type Mask@@7) (MapType1Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@8 ExhaleHeap@@1 Mask@@7)) (U_2_bool (MapType0Select Heap@@8 o_1 $allocated))) (U_2_bool (MapType0Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.73:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@8 ExhaleHeap@@1 Mask@@7) (MapType0Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert (forall ((s@@4 T@U) (n@@3 Int) ) (! (let ((T@@8 (SeqTypeInv0 (type s@@4))))
 (=> (and (= (type s@@4) (SeqType T@@8)) (<= n@@3 0)) (= (|Seq#Drop| s@@4 n@@3) s@@4)))
 :qid |stdinbpl.442:18|
 :skolemid |45|
 :pattern ( (|Seq#Drop| s@@4 n@@3))
)))
(assert (forall ((i@@3 Int) (j@@1 Int) ) (! (= (|Seq#Sub| i@@3 j@@1) (- i@@3 j@@1))
 :qid |stdinbpl.296:15|
 :skolemid |30|
 :pattern ( (|Seq#Sub| i@@3 j@@1))
)))
(assert (forall ((i@@4 Int) (j@@2 Int) ) (! (= (|Seq#Add| i@@4 j@@2) (+ i@@4 j@@2))
 :qid |stdinbpl.294:15|
 :skolemid |29|
 :pattern ( (|Seq#Add| i@@4 j@@2))
)))
(assert (forall ((arg0@@33 T@U) ) (! (let ((T@@9 (type arg0@@33)))
(= (type (|Seq#Singleton| arg0@@33)) (SeqType T@@9)))
 :qid |funType:Seq#Singleton|
 :pattern ( (|Seq#Singleton| arg0@@33))
)))
(assert (forall ((x@@9 T@U) (y@@1 T@U) ) (! (let ((T@@10 (type x@@9)))
 (=> (= (type y@@1) T@@10) (= (|Seq#Contains| (|Seq#Singleton| x@@9) y@@1) (= x@@9 y@@1))))
 :qid |stdinbpl.583:18|
 :skolemid |54|
 :pattern ( (|Seq#Contains| (|Seq#Singleton| x@@9) y@@1))
)))
(assert (forall ((Heap@@9 T@U) (i@@5 Int) (lo@@1 Int) (hi@@2 Int) (step@@1 Int) (vmin@@1 Int) (vmax@@1 Int) (ar@@2 T@U) (v_2@@1 Int) ) (!  (=> (and (= (type Heap@@9) (MapType0Type RefType)) (= (type ar@@2) (SeqType RefType))) (and (= (count_square Heap@@9 i@@5 lo@@1 hi@@2 step@@1 vmin@@1 vmax@@1 ar@@2 v_2@@1) (|count_square'| Heap@@9 i@@5 lo@@1 hi@@2 step@@1 vmin@@1 vmax@@1 ar@@2 v_2@@1)) (dummyFunction (int_2_U (|count_square#triggerStateless| i@@5 lo@@1 hi@@2 step@@1 vmin@@1 vmax@@1 ar@@2 v_2@@1)))))
 :qid |stdinbpl.1326:15|
 :skolemid |116|
 :pattern ( (count_square Heap@@9 i@@5 lo@@1 hi@@2 step@@1 vmin@@1 vmax@@1 ar@@2 v_2@@1))
)))
(assert (forall ((s@@5 T@U) (n@@4 Int) (j@@3 Int) ) (! (let ((T@@11 (SeqTypeInv0 (type s@@5))))
 (=> (= (type s@@5) (SeqType T@@11)) (=> (and (and (<= 0 j@@3) (< j@@3 n@@4)) (< j@@3 (|Seq#Length| s@@5))) (= (|Seq#Index| (|Seq#Take| s@@5 n@@4) j@@3) (|Seq#Index| s@@5 j@@3)))))
 :qid |stdinbpl.335:18|
 :skolemid |37|
 :pattern ( (|Seq#Index| (|Seq#Take| s@@5 n@@4) j@@3))
 :pattern ( (|Seq#Index| s@@5 j@@3) (|Seq#Take| s@@5 n@@4))
)))
(assert (forall ((Heap@@10 T@U) (i@@6 Int) (lo@@2 Int) (hi@@3 Int) (step@@2 Int) (vmin@@2 Int) (vmax@@2 Int) (ar@@3 T@U) (v_2@@2 Int) ) (!  (=> (and (= (type Heap@@10) (MapType0Type RefType)) (= (type ar@@3) (SeqType RefType))) (dummyFunction (int_2_U (|count_square#triggerStateless| i@@6 lo@@2 hi@@3 step@@2 vmin@@2 vmax@@2 ar@@3 v_2@@2))))
 :qid |stdinbpl.1330:15|
 :skolemid |117|
 :pattern ( (|count_square'| Heap@@10 i@@6 lo@@2 hi@@3 step@@2 vmin@@2 vmax@@2 ar@@3 v_2@@2))
)))
(assert (forall ((Heap@@11 T@U) (ExhaleHeap@@2 T@U) (Mask@@8 T@U) (o_1@@0 T@U) (f_2 T@U) ) (! (let ((B@@1 (FieldTypeInv1 (type f_2))))
(let ((A@@1 (FieldTypeInv0 (type f_2))))
 (=> (and (and (and (and (and (and (= (type Heap@@11) (MapType0Type RefType)) (= (type ExhaleHeap@@2) (MapType0Type RefType))) (= (type Mask@@8) (MapType1Type RefType realType))) (= (type o_1@@0) RefType)) (= (type f_2) (FieldType A@@1 B@@1))) (IdenticalOnKnownLocations Heap@@11 ExhaleHeap@@2 Mask@@8)) (HasDirectPerm Mask@@8 o_1@@0 f_2)) (= (MapType0Select Heap@@11 o_1@@0 f_2) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2)))))
 :qid |stdinbpl.42:22|
 :skolemid |1|
 :pattern ( (IdenticalOnKnownLocations Heap@@11 ExhaleHeap@@2 Mask@@8) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2))
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
 :qid |stdinbpl.239:19|
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
 :qid |stdinbpl.307:18|
 :skolemid |32|
 :pattern ( (|Seq#Index| (|Seq#Append| s0 s1) n@@5))
)))
(assert (forall ((Heap@@12 T@U) (Mask@@9 T@U) (i@@7 Int) (hi@@4 Int) (ar@@4 T@U) (v_2@@3 Int) ) (!  (=> (and (and (and (and (= (type Heap@@12) (MapType0Type RefType)) (= (type Mask@@9) (MapType1Type RefType realType))) (= (type ar@@4) (SeqType RefType))) (and (state Heap@@12 Mask@@9) (< AssumeFunctionsAbove 1))) (and (and (and (<= 0 i@@7) (<= i@@7 hi@@4)) (<= hi@@4 (|Seq#Length| ar@@4))) (forall ((j@@4 Int) (k@@0 Int) ) (!  (=> (and (<= 0 j@@4) (and (< j@@4 hi@@4) (and (<= 0 k@@0) (and (< k@@0 hi@@4) (not (= j@@4 k@@0)))))) (not (= (|Seq#Index| ar@@4 j@@4) (|Seq#Index| ar@@4 k@@0))))
 :qid |stdinbpl.1700:110|
 :skolemid |145|
 :pattern ( (|Seq#Index| ar@@4 j@@4) (|Seq#Index| ar@@4 k@@0))
)))) (= (count_array Heap@@12 i@@7 hi@@4 ar@@4 v_2@@3) (ite (< i@@7 hi@@4) (+ (ite (= (U_2_int (MapType0Select Heap@@12 (|Seq#Index| ar@@4 i@@7) Ref__Integer_value)) v_2@@3) 1 0) (|count_array'| Heap@@12 (+ i@@7 1) hi@@4 ar@@4 v_2@@3)) 0)))
 :qid |stdinbpl.1698:15|
 :skolemid |146|
 :pattern ( (state Heap@@12 Mask@@9) (count_array Heap@@12 i@@7 hi@@4 ar@@4 v_2@@3))
)))
(assert (forall ((Heap@@13 T@U) (Mask@@10 T@U) (i@@8 Int) (lo@@3 Int) (hi@@5 Int) (step@@3 Int) (vmin@@3 Int) (vmax@@3 Int) (ar@@5 T@U) ) (!  (=> (and (and (and (= (type Heap@@13) (MapType0Type RefType)) (= (type Mask@@10) (MapType1Type RefType realType))) (= (type ar@@5) (SeqType RefType))) (and (state Heap@@13 Mask@@10) (< AssumeFunctionsAbove 5))) (=> (and (and (and (and (<= 0 lo@@3) (and (<= lo@@3 hi@@5) (and (<= hi@@5 step@@3) (> step@@3 0)))) (and (<= 0 vmin@@3) (and (<= vmin@@3 i@@8) (<= i@@8 vmax@@3)))) (<= vmax@@3 (|Seq#Length| ar@@5))) (forall ((j@@5 Int) (k@@1 Int) ) (!  (=> (and (<= 0 j@@5) (and (< j@@5 vmax@@3) (and (<= 0 k@@1) (and (< k@@1 vmax@@3) (not (= j@@5 k@@1)))))) (not (= (|Seq#Index| ar@@5 j@@5) (|Seq#Index| ar@@5 k@@1))))
 :qid |stdinbpl.1060:189|
 :skolemid |95|
 :pattern ( (|Seq#Index| ar@@5 j@@5) (|Seq#Index| ar@@5 k@@1))
))) (= (sum_square Heap@@13 i@@8 lo@@3 hi@@5 step@@3 vmin@@3 vmax@@3 ar@@5) (ite (< i@@8 vmax@@3) (+ (ite  (and (<= lo@@3 (mod i@@8 step@@3)) (< (mod i@@8 step@@3) hi@@5)) (U_2_int (MapType0Select Heap@@13 (|Seq#Index| ar@@5 i@@8) Ref__Integer_value)) 0) (|sum_square'| Heap@@13 (+ i@@8 1) lo@@3 hi@@5 step@@3 vmin@@3 vmax@@3 ar@@5)) 0))))
 :qid |stdinbpl.1058:15|
 :skolemid |96|
 :pattern ( (state Heap@@13 Mask@@10) (sum_square Heap@@13 i@@8 lo@@3 hi@@5 step@@3 vmin@@3 vmax@@3 ar@@5))
)))
(assert  (not (IsPredicateField Ref__Integer_value)))
(assert  (not (IsWandField Ref__Integer_value)))
(assert (forall ((Heap@@14 T@U) (ExhaleHeap@@3 T@U) (Mask@@11 T@U) ) (!  (=> (and (and (and (= (type Heap@@14) (MapType0Type RefType)) (= (type ExhaleHeap@@3) (MapType0Type RefType))) (= (type Mask@@11) (MapType1Type RefType realType))) (IdenticalOnKnownLocations Heap@@14 ExhaleHeap@@3 Mask@@11)) (succHeap Heap@@14 ExhaleHeap@@3))
 :qid |stdinbpl.83:15|
 :skolemid |10|
 :pattern ( (IdenticalOnKnownLocations Heap@@14 ExhaleHeap@@3 Mask@@11))
)))
(assert (forall ((Heap@@15 T@U) (Mask@@12 T@U) (i@@9 Int) (hi@@6 Int) (ar@@6 T@U) ) (!  (=> (and (and (and (= (type Heap@@15) (MapType0Type RefType)) (= (type Mask@@12) (MapType1Type RefType realType))) (= (type ar@@6) (SeqType intType))) (state Heap@@15 Mask@@12)) (= (|sum_list'| Heap@@15 i@@9 hi@@6 ar@@6) (|sum_list#frame| EmptyFrame i@@9 hi@@6 ar@@6)))
 :qid |stdinbpl.734:15|
 :skolemid |69|
 :pattern ( (state Heap@@15 Mask@@12) (|sum_list'| Heap@@15 i@@9 hi@@6 ar@@6))
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
(assert (forall ((Heap@@16 T@U) (N0@@2 Int) (N1@@2 Int) (i0@@2 Int) (i1@@2 Int) ) (!  (=> (= (type Heap@@16) (MapType0Type RefType)) (dummyFunction (int_2_U (|Ref__multidim_index_2#triggerStateless| N0@@2 N1@@2 i0@@2 i1@@2))))
 :qid |stdinbpl.625:15|
 :skolemid |59|
 :pattern ( (|Ref__multidim_index_2'| Heap@@16 N0@@2 N1@@2 i0@@2 i1@@2))
)))
(assert (forall ((Heap@@17 T@U) (i@@10 Int) (lo@@4 Int) (hi@@7 Int) (ar@@7 T@U) ) (!  (=> (and (= (type Heap@@17) (MapType0Type RefType)) (= (type ar@@7) (SeqType RefType))) (dummyFunction (int_2_U (|sum_array#triggerStateless| i@@10 lo@@4 hi@@7 ar@@7))))
 :qid |stdinbpl.805:15|
 :skolemid |71|
 :pattern ( (|sum_array'| Heap@@17 i@@10 lo@@4 hi@@7 ar@@7))
)))
(assert (forall ((Heap@@18 T@U) (i@@11 Int) (hi@@8 Int) (ar@@8 T@U) (v_2@@4 Int) ) (!  (=> (and (= (type Heap@@18) (MapType0Type RefType)) (= (type ar@@8) (SeqType intType))) (dummyFunction (int_2_U (|count_list#triggerStateless| i@@11 hi@@8 ar@@8 v_2@@4))))
 :qid |stdinbpl.1608:15|
 :skolemid |140|
 :pattern ( (|count_list'| Heap@@18 i@@11 hi@@8 ar@@8 v_2@@4))
)))
(assert (forall ((Heap@@19 T@U) (i@@12 Int) (hi@@9 Int) (ar@@9 T@U) (v_2@@5 Int) ) (!  (=> (and (= (type Heap@@19) (MapType0Type RefType)) (= (type ar@@9) (SeqType RefType))) (dummyFunction (int_2_U (|count_array#triggerStateless| i@@12 hi@@9 ar@@9 v_2@@5))))
 :qid |stdinbpl.1692:15|
 :skolemid |144|
 :pattern ( (|count_array'| Heap@@19 i@@12 hi@@9 ar@@9 v_2@@5))
)))
(assert (forall ((arg0@@35 Real) (arg1@@15 T@U) ) (! (= (type (ConditionalFrame arg0@@35 arg1@@15)) FrameTypeType)
 :qid |funType:ConditionalFrame|
 :pattern ( (ConditionalFrame arg0@@35 arg1@@15))
)))
(assert (forall ((p@@0 Real) (f_6 T@U) ) (!  (=> (= (type f_6) FrameTypeType) (= (ConditionalFrame p@@0 f_6) (ite (> p@@0 0.0) f_6 EmptyFrame)))
 :qid |stdinbpl.227:15|
 :skolemid |19|
 :pattern ( (ConditionalFrame p@@0 f_6))
)))
(assert (forall ((q@min@@0 Int) (q@max@@0 Int) (j@@6 Int) ) (!  (=> (and (<= 0 j@@6) (< j@@6 (- q@max@@0 q@min@@0))) (= (U_2_int (|Seq#Index| (|Seq#Range| q@min@@0 q@max@@0) j@@6)) (+ q@min@@0 j@@6)))
 :qid |stdinbpl.598:15|
 :skolemid |56|
 :pattern ( (|Seq#Index| (|Seq#Range| q@min@@0 q@max@@0) j@@6))
)))
(assert (forall ((Mask@@13 T@U) (o_2@@0 T@U) (f_4@@0 T@U) ) (! (let ((B@@3 (FieldTypeInv1 (type f_4@@0))))
(let ((A@@4 (FieldTypeInv0 (type f_4@@0))))
 (=> (and (and (= (type Mask@@13) (MapType1Type RefType realType)) (= (type o_2@@0) RefType)) (= (type f_4@@0) (FieldType A@@4 B@@3))) (= (HasDirectPerm Mask@@13 o_2@@0 f_4@@0) (> (U_2_real (MapType1Select Mask@@13 o_2@@0 f_4@@0)) NoPerm)))))
 :qid |stdinbpl.133:22|
 :skolemid |17|
 :pattern ( (HasDirectPerm Mask@@13 o_2@@0 f_4@@0))
)))
(assert (forall ((s0@@0 T@U) (s1@@0 T@U) ) (! (let ((T@@16 (SeqTypeInv0 (type s0@@0))))
 (=> (and (and (= (type s0@@0) (SeqType T@@16)) (= (type s1@@0) (SeqType T@@16))) (and (not (= s0@@0 (|Seq#Empty| T@@16))) (not (= s1@@0 (|Seq#Empty| T@@16))))) (= (|Seq#Length| (|Seq#Append| s0@@0 s1@@0)) (+ (|Seq#Length| s0@@0) (|Seq#Length| s1@@0)))))
 :qid |stdinbpl.276:18|
 :skolemid |26|
 :pattern ( (|Seq#Length| (|Seq#Append| s0@@0 s1@@0)))
)))
(assert (forall ((Heap@@20 T@U) (Mask@@14 T@U) (i@@13 Int) (hi@@10 Int) (ar@@10 T@U) (v_2@@6 Int) ) (!  (=> (and (and (and (and (= (type Heap@@20) (MapType0Type RefType)) (= (type Mask@@14) (MapType1Type RefType realType))) (= (type ar@@10) (SeqType intType))) (and (state Heap@@20 Mask@@14) (< AssumeFunctionsAbove 6))) (and (and (<= 0 i@@13) (<= i@@13 hi@@10)) (<= hi@@10 (|Seq#Length| ar@@10)))) (= (count_list Heap@@20 i@@13 hi@@10 ar@@10 v_2@@6) (ite (< i@@13 hi@@10) (+ (ite (= (U_2_int (|Seq#Index| ar@@10 i@@13)) v_2@@6) 1 0) (|count_list'| Heap@@20 (+ i@@13 1) hi@@10 ar@@10 v_2@@6)) 0)))
 :qid |stdinbpl.1614:15|
 :skolemid |141|
 :pattern ( (state Heap@@20 Mask@@14) (count_list Heap@@20 i@@13 hi@@10 ar@@10 v_2@@6))
)))
(assert (forall ((s@@6 T@U) (t T@U) (n@@6 Int) ) (! (let ((T@@17 (SeqTypeInv0 (type s@@6))))
 (=> (and (and (= (type s@@6) (SeqType T@@17)) (= (type t) (SeqType T@@17))) (and (> n@@6 0) (> n@@6 (|Seq#Length| s@@6)))) (and (= (|Seq#Add| (|Seq#Sub| n@@6 (|Seq#Length| s@@6)) (|Seq#Length| s@@6)) n@@6) (= (|Seq#Drop| (|Seq#Append| s@@6 t) n@@6) (|Seq#Drop| t (|Seq#Sub| n@@6 (|Seq#Length| s@@6)))))))
 :qid |stdinbpl.432:18|
 :skolemid |44|
 :pattern ( (|Seq#Drop| (|Seq#Append| s@@6 t) n@@6))
)))
(assert (forall ((Heap@@21 T@U) (N0@@3 Int) (N1@@3 Int) (i0@@3 Int) (i1@@3 Int) ) (!  (=> (= (type Heap@@21) (MapType0Type RefType)) (and (= (Ref__multidim_index_2 Heap@@21 N0@@3 N1@@3 i0@@3 i1@@3) (|Ref__multidim_index_2'| Heap@@21 N0@@3 N1@@3 i0@@3 i1@@3)) (dummyFunction (int_2_U (|Ref__multidim_index_2#triggerStateless| N0@@3 N1@@3 i0@@3 i1@@3)))))
 :qid |stdinbpl.621:15|
 :skolemid |58|
 :pattern ( (Ref__multidim_index_2 Heap@@21 N0@@3 N1@@3 i0@@3 i1@@3))
)))
(assert (forall ((Heap@@22 T@U) (i@@14 Int) (lo@@5 Int) (hi@@11 Int) (ar@@11 T@U) ) (!  (=> (and (= (type Heap@@22) (MapType0Type RefType)) (= (type ar@@11) (SeqType RefType))) (and (= (sum_array Heap@@22 i@@14 lo@@5 hi@@11 ar@@11) (|sum_array'| Heap@@22 i@@14 lo@@5 hi@@11 ar@@11)) (dummyFunction (int_2_U (|sum_array#triggerStateless| i@@14 lo@@5 hi@@11 ar@@11)))))
 :qid |stdinbpl.801:15|
 :skolemid |70|
 :pattern ( (sum_array Heap@@22 i@@14 lo@@5 hi@@11 ar@@11))
)))
(assert (forall ((Heap@@23 T@U) (i@@15 Int) (hi@@12 Int) (ar@@12 T@U) (v_2@@7 Int) ) (!  (=> (and (= (type Heap@@23) (MapType0Type RefType)) (= (type ar@@12) (SeqType intType))) (and (= (count_list Heap@@23 i@@15 hi@@12 ar@@12 v_2@@7) (|count_list'| Heap@@23 i@@15 hi@@12 ar@@12 v_2@@7)) (dummyFunction (int_2_U (|count_list#triggerStateless| i@@15 hi@@12 ar@@12 v_2@@7)))))
 :qid |stdinbpl.1604:15|
 :skolemid |139|
 :pattern ( (count_list Heap@@23 i@@15 hi@@12 ar@@12 v_2@@7))
)))
(assert (forall ((Heap@@24 T@U) (i@@16 Int) (hi@@13 Int) (ar@@13 T@U) (v_2@@8 Int) ) (!  (=> (and (= (type Heap@@24) (MapType0Type RefType)) (= (type ar@@13) (SeqType RefType))) (and (= (count_array Heap@@24 i@@16 hi@@13 ar@@13 v_2@@8) (|count_array'| Heap@@24 i@@16 hi@@13 ar@@13 v_2@@8)) (dummyFunction (int_2_U (|count_array#triggerStateless| i@@16 hi@@13 ar@@13 v_2@@8)))))
 :qid |stdinbpl.1688:15|
 :skolemid |143|
 :pattern ( (count_array Heap@@24 i@@16 hi@@13 ar@@13 v_2@@8))
)))
(assert (forall ((o_2@@1 T@U) (f_4@@1 T@U) ) (! (let ((B@@4 (FieldTypeInv1 (type f_4@@1))))
(let ((A@@5 (FieldTypeInv0 (type f_4@@1))))
 (=> (and (= (type o_2@@1) RefType) (= (type f_4@@1) (FieldType A@@5 B@@4))) (= (U_2_real (MapType1Select ZeroMask o_2@@1 f_4@@1)) NoPerm))))
 :qid |stdinbpl.106:22|
 :skolemid |13|
 :pattern ( (MapType1Select ZeroMask o_2@@1 f_4@@1))
)))
(assert (forall ((Heap@@25 T@U) (Mask@@15 T@U) (i@@17 Int) (lo@@6 Int) (hi@@14 Int) (ar@@14 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@25) (MapType0Type RefType)) (= (type Mask@@15) (MapType1Type RefType realType))) (= (type ar@@14) (SeqType RefType))) (and (state Heap@@25 Mask@@15) (< AssumeFunctionsAbove 3))) (and (and (and (<= 0 lo@@6) (and (<= lo@@6 i@@17) (<= i@@17 hi@@14))) (<= hi@@14 (|Seq#Length| ar@@14))) (forall ((j@@7 Int) (k@@2 Int) ) (!  (=> (and (<= 0 j@@7) (and (< j@@7 hi@@14) (and (<= 0 k@@2) (and (< k@@2 hi@@14) (not (= j@@7 k@@2)))))) (not (= (|Seq#Index| ar@@14 j@@7) (|Seq#Index| ar@@14 k@@2))))
 :qid |stdinbpl.813:124|
 :skolemid |72|
 :pattern ( (|Seq#Index| ar@@14 j@@7) (|Seq#Index| ar@@14 k@@2))
)))) (= (sum_array Heap@@25 i@@17 lo@@6 hi@@14 ar@@14) (ite (< i@@17 hi@@14) (+ (U_2_int (MapType0Select Heap@@25 (|Seq#Index| ar@@14 i@@17) Ref__Integer_value)) (|sum_array'| Heap@@25 (+ i@@17 1) lo@@6 hi@@14 ar@@14)) 0)))
 :qid |stdinbpl.811:15|
 :skolemid |73|
 :pattern ( (state Heap@@25 Mask@@15) (sum_array Heap@@25 i@@17 lo@@6 hi@@14 ar@@14))
)))
(assert (forall ((Heap@@26 T@U) (i@@18 Int) (lo@@7 Int) (hi@@15 Int) (step@@4 Int) (vmin@@4 Int) (vmax@@4 Int) (ar@@15 T@U) ) (!  (=> (and (= (type Heap@@26) (MapType0Type RefType)) (= (type ar@@15) (SeqType RefType))) (and (= (sum_square Heap@@26 i@@18 lo@@7 hi@@15 step@@4 vmin@@4 vmax@@4 ar@@15) (|sum_square'| Heap@@26 i@@18 lo@@7 hi@@15 step@@4 vmin@@4 vmax@@4 ar@@15)) (dummyFunction (int_2_U (|sum_square#triggerStateless| i@@18 lo@@7 hi@@15 step@@4 vmin@@4 vmax@@4 ar@@15)))))
 :qid |stdinbpl.1048:15|
 :skolemid |93|
 :pattern ( (sum_square Heap@@26 i@@18 lo@@7 hi@@15 step@@4 vmin@@4 vmax@@4 ar@@15))
)))
(assert (forall ((Heap@@27 T@U) (Mask@@16 T@U) (N0@@4 Int) (N1@@4 Int) (i0@@4 Int) (i1@@4 Int) ) (!  (=> (and (and (= (type Heap@@27) (MapType0Type RefType)) (= (type Mask@@16) (MapType1Type RefType realType))) (state Heap@@27 Mask@@16)) (= (|Ref__multidim_index_2'| Heap@@27 N0@@4 N1@@4 i0@@4 i1@@4) (|Ref__multidim_index_2#frame| EmptyFrame N0@@4 N1@@4 i0@@4 i1@@4)))
 :qid |stdinbpl.632:15|
 :skolemid |60|
 :pattern ( (state Heap@@27 Mask@@16) (|Ref__multidim_index_2'| Heap@@27 N0@@4 N1@@4 i0@@4 i1@@4))
)))
(assert (forall ((Heap@@28 T@U) (Mask@@17 T@U) (i@@19 Int) (hi@@16 Int) (ar@@16 T@U) (v_2@@9 Int) ) (!  (=> (and (and (and (= (type Heap@@28) (MapType0Type RefType)) (= (type Mask@@17) (MapType1Type RefType realType))) (= (type ar@@16) (SeqType intType))) (state Heap@@28 Mask@@17)) (= (|count_list'| Heap@@28 i@@19 hi@@16 ar@@16 v_2@@9) (|count_list#frame| EmptyFrame i@@19 hi@@16 ar@@16 v_2@@9)))
 :qid |stdinbpl.1621:15|
 :skolemid |142|
 :pattern ( (state Heap@@28 Mask@@17) (|count_list'| Heap@@28 i@@19 hi@@16 ar@@16 v_2@@9))
)))
(assert (forall ((s@@7 T@U) (t@@0 T@U) (n@@7 Int) ) (! (let ((T@@18 (SeqTypeInv0 (type s@@7))))
 (=> (and (and (= (type s@@7) (SeqType T@@18)) (= (type t@@0) (SeqType T@@18))) (and (> n@@7 0) (> n@@7 (|Seq#Length| s@@7)))) (and (= (|Seq#Add| (|Seq#Sub| n@@7 (|Seq#Length| s@@7)) (|Seq#Length| s@@7)) n@@7) (= (|Seq#Take| (|Seq#Append| s@@7 t@@0) n@@7) (|Seq#Append| s@@7 (|Seq#Take| t@@0 (|Seq#Sub| n@@7 (|Seq#Length| s@@7))))))))
 :qid |stdinbpl.419:18|
 :skolemid |42|
 :pattern ( (|Seq#Take| (|Seq#Append| s@@7 t@@0) n@@7))
)))
(assert (forall ((q@min@@1 Int) (q@max@@1 Int) ) (!  (and (=> (< q@min@@1 q@max@@1) (= (|Seq#Length| (|Seq#Range| q@min@@1 q@max@@1)) (- q@max@@1 q@min@@1))) (=> (<= q@max@@1 q@min@@1) (= (|Seq#Length| (|Seq#Range| q@min@@1 q@max@@1)) 0)))
 :qid |stdinbpl.597:15|
 :skolemid |55|
 :pattern ( (|Seq#Length| (|Seq#Range| q@min@@1 q@max@@1)))
)))
(assert (forall ((Heap2Heap T@U) (Heap1Heap T@U) (i@@20 Int) (lo@@8 Int) (hi@@17 Int) (step@@5 Int) (vmin@@5 Int) (vmax@@5 Int) (ar@@17 T@U) ) (!  (=> (and (and (and (= (type Heap2Heap) (MapType0Type RefType)) (= (type Heap1Heap) (MapType0Type RefType))) (= (type ar@@17) (SeqType RefType))) (and (=  (and (<= vmin@@5 (|sk_sum_square#condqp2| (|sum_square#condqp2| Heap2Heap i@@20 lo@@8 hi@@17 step@@5 vmin@@5 vmax@@5 ar@@17) (|sum_square#condqp2| Heap1Heap i@@20 lo@@8 hi@@17 step@@5 vmin@@5 vmax@@5 ar@@17))) (and (< (|sk_sum_square#condqp2| (|sum_square#condqp2| Heap2Heap i@@20 lo@@8 hi@@17 step@@5 vmin@@5 vmax@@5 ar@@17) (|sum_square#condqp2| Heap1Heap i@@20 lo@@8 hi@@17 step@@5 vmin@@5 vmax@@5 ar@@17)) vmax@@5) (and (<= lo@@8 (mod (|sk_sum_square#condqp2| (|sum_square#condqp2| Heap2Heap i@@20 lo@@8 hi@@17 step@@5 vmin@@5 vmax@@5 ar@@17) (|sum_square#condqp2| Heap1Heap i@@20 lo@@8 hi@@17 step@@5 vmin@@5 vmax@@5 ar@@17)) step@@5)) (< (mod (|sk_sum_square#condqp2| (|sum_square#condqp2| Heap2Heap i@@20 lo@@8 hi@@17 step@@5 vmin@@5 vmax@@5 ar@@17) (|sum_square#condqp2| Heap1Heap i@@20 lo@@8 hi@@17 step@@5 vmin@@5 vmax@@5 ar@@17)) step@@5) hi@@17))))  (and (<= vmin@@5 (|sk_sum_square#condqp2| (|sum_square#condqp2| Heap2Heap i@@20 lo@@8 hi@@17 step@@5 vmin@@5 vmax@@5 ar@@17) (|sum_square#condqp2| Heap1Heap i@@20 lo@@8 hi@@17 step@@5 vmin@@5 vmax@@5 ar@@17))) (and (< (|sk_sum_square#condqp2| (|sum_square#condqp2| Heap2Heap i@@20 lo@@8 hi@@17 step@@5 vmin@@5 vmax@@5 ar@@17) (|sum_square#condqp2| Heap1Heap i@@20 lo@@8 hi@@17 step@@5 vmin@@5 vmax@@5 ar@@17)) vmax@@5) (and (<= lo@@8 (mod (|sk_sum_square#condqp2| (|sum_square#condqp2| Heap2Heap i@@20 lo@@8 hi@@17 step@@5 vmin@@5 vmax@@5 ar@@17) (|sum_square#condqp2| Heap1Heap i@@20 lo@@8 hi@@17 step@@5 vmin@@5 vmax@@5 ar@@17)) step@@5)) (< (mod (|sk_sum_square#condqp2| (|sum_square#condqp2| Heap2Heap i@@20 lo@@8 hi@@17 step@@5 vmin@@5 vmax@@5 ar@@17) (|sum_square#condqp2| Heap1Heap i@@20 lo@@8 hi@@17 step@@5 vmin@@5 vmax@@5 ar@@17)) step@@5) hi@@17))))) (=> (and (<= vmin@@5 (|sk_sum_square#condqp2| (|sum_square#condqp2| Heap2Heap i@@20 lo@@8 hi@@17 step@@5 vmin@@5 vmax@@5 ar@@17) (|sum_square#condqp2| Heap1Heap i@@20 lo@@8 hi@@17 step@@5 vmin@@5 vmax@@5 ar@@17))) (and (< (|sk_sum_square#condqp2| (|sum_square#condqp2| Heap2Heap i@@20 lo@@8 hi@@17 step@@5 vmin@@5 vmax@@5 ar@@17) (|sum_square#condqp2| Heap1Heap i@@20 lo@@8 hi@@17 step@@5 vmin@@5 vmax@@5 ar@@17)) vmax@@5) (and (<= lo@@8 (mod (|sk_sum_square#condqp2| (|sum_square#condqp2| Heap2Heap i@@20 lo@@8 hi@@17 step@@5 vmin@@5 vmax@@5 ar@@17) (|sum_square#condqp2| Heap1Heap i@@20 lo@@8 hi@@17 step@@5 vmin@@5 vmax@@5 ar@@17)) step@@5)) (< (mod (|sk_sum_square#condqp2| (|sum_square#condqp2| Heap2Heap i@@20 lo@@8 hi@@17 step@@5 vmin@@5 vmax@@5 ar@@17) (|sum_square#condqp2| Heap1Heap i@@20 lo@@8 hi@@17 step@@5 vmin@@5 vmax@@5 ar@@17)) step@@5) hi@@17)))) (= (U_2_int (MapType0Select Heap2Heap (|Seq#Index| ar@@17 (|sk_sum_square#condqp2| (|sum_square#condqp2| Heap2Heap i@@20 lo@@8 hi@@17 step@@5 vmin@@5 vmax@@5 ar@@17) (|sum_square#condqp2| Heap1Heap i@@20 lo@@8 hi@@17 step@@5 vmin@@5 vmax@@5 ar@@17))) Ref__Integer_value)) (U_2_int (MapType0Select Heap1Heap (|Seq#Index| ar@@17 (|sk_sum_square#condqp2| (|sum_square#condqp2| Heap2Heap i@@20 lo@@8 hi@@17 step@@5 vmin@@5 vmax@@5 ar@@17) (|sum_square#condqp2| Heap1Heap i@@20 lo@@8 hi@@17 step@@5 vmin@@5 vmax@@5 ar@@17))) Ref__Integer_value)))))) (= (|sum_square#condqp2| Heap2Heap i@@20 lo@@8 hi@@17 step@@5 vmin@@5 vmax@@5 ar@@17) (|sum_square#condqp2| Heap1Heap i@@20 lo@@8 hi@@17 step@@5 vmin@@5 vmax@@5 ar@@17)))
 :qid |stdinbpl.1078:15|
 :skolemid |98|
 :pattern ( (|sum_square#condqp2| Heap2Heap i@@20 lo@@8 hi@@17 step@@5 vmin@@5 vmax@@5 ar@@17) (|sum_square#condqp2| Heap1Heap i@@20 lo@@8 hi@@17 step@@5 vmin@@5 vmax@@5 ar@@17) (succHeapTrans Heap2Heap Heap1Heap))
)))
(assert (forall ((Heap2Heap@@0 T@U) (Heap1Heap@@0 T@U) (i@@21 Int) (lo@@9 Int) (hi@@18 Int) (step@@6 Int) (vmin@@6 Int) (vmax@@6 Int) (ar@@18 T@U) (v_2@@10 Int) ) (!  (=> (and (and (and (= (type Heap2Heap@@0) (MapType0Type RefType)) (= (type Heap1Heap@@0) (MapType0Type RefType))) (= (type ar@@18) (SeqType RefType))) (and (=  (and (<= vmin@@6 (|sk_count_square#condqp3| (|count_square#condqp3| Heap2Heap@@0 i@@21 lo@@9 hi@@18 step@@6 vmin@@6 vmax@@6 ar@@18 v_2@@10) (|count_square#condqp3| Heap1Heap@@0 i@@21 lo@@9 hi@@18 step@@6 vmin@@6 vmax@@6 ar@@18 v_2@@10))) (and (< (|sk_count_square#condqp3| (|count_square#condqp3| Heap2Heap@@0 i@@21 lo@@9 hi@@18 step@@6 vmin@@6 vmax@@6 ar@@18 v_2@@10) (|count_square#condqp3| Heap1Heap@@0 i@@21 lo@@9 hi@@18 step@@6 vmin@@6 vmax@@6 ar@@18 v_2@@10)) vmax@@6) (and (<= lo@@9 (mod (|sk_count_square#condqp3| (|count_square#condqp3| Heap2Heap@@0 i@@21 lo@@9 hi@@18 step@@6 vmin@@6 vmax@@6 ar@@18 v_2@@10) (|count_square#condqp3| Heap1Heap@@0 i@@21 lo@@9 hi@@18 step@@6 vmin@@6 vmax@@6 ar@@18 v_2@@10)) step@@6)) (< (mod (|sk_count_square#condqp3| (|count_square#condqp3| Heap2Heap@@0 i@@21 lo@@9 hi@@18 step@@6 vmin@@6 vmax@@6 ar@@18 v_2@@10) (|count_square#condqp3| Heap1Heap@@0 i@@21 lo@@9 hi@@18 step@@6 vmin@@6 vmax@@6 ar@@18 v_2@@10)) step@@6) hi@@18))))  (and (<= vmin@@6 (|sk_count_square#condqp3| (|count_square#condqp3| Heap2Heap@@0 i@@21 lo@@9 hi@@18 step@@6 vmin@@6 vmax@@6 ar@@18 v_2@@10) (|count_square#condqp3| Heap1Heap@@0 i@@21 lo@@9 hi@@18 step@@6 vmin@@6 vmax@@6 ar@@18 v_2@@10))) (and (< (|sk_count_square#condqp3| (|count_square#condqp3| Heap2Heap@@0 i@@21 lo@@9 hi@@18 step@@6 vmin@@6 vmax@@6 ar@@18 v_2@@10) (|count_square#condqp3| Heap1Heap@@0 i@@21 lo@@9 hi@@18 step@@6 vmin@@6 vmax@@6 ar@@18 v_2@@10)) vmax@@6) (and (<= lo@@9 (mod (|sk_count_square#condqp3| (|count_square#condqp3| Heap2Heap@@0 i@@21 lo@@9 hi@@18 step@@6 vmin@@6 vmax@@6 ar@@18 v_2@@10) (|count_square#condqp3| Heap1Heap@@0 i@@21 lo@@9 hi@@18 step@@6 vmin@@6 vmax@@6 ar@@18 v_2@@10)) step@@6)) (< (mod (|sk_count_square#condqp3| (|count_square#condqp3| Heap2Heap@@0 i@@21 lo@@9 hi@@18 step@@6 vmin@@6 vmax@@6 ar@@18 v_2@@10) (|count_square#condqp3| Heap1Heap@@0 i@@21 lo@@9 hi@@18 step@@6 vmin@@6 vmax@@6 ar@@18 v_2@@10)) step@@6) hi@@18))))) (=> (and (<= vmin@@6 (|sk_count_square#condqp3| (|count_square#condqp3| Heap2Heap@@0 i@@21 lo@@9 hi@@18 step@@6 vmin@@6 vmax@@6 ar@@18 v_2@@10) (|count_square#condqp3| Heap1Heap@@0 i@@21 lo@@9 hi@@18 step@@6 vmin@@6 vmax@@6 ar@@18 v_2@@10))) (and (< (|sk_count_square#condqp3| (|count_square#condqp3| Heap2Heap@@0 i@@21 lo@@9 hi@@18 step@@6 vmin@@6 vmax@@6 ar@@18 v_2@@10) (|count_square#condqp3| Heap1Heap@@0 i@@21 lo@@9 hi@@18 step@@6 vmin@@6 vmax@@6 ar@@18 v_2@@10)) vmax@@6) (and (<= lo@@9 (mod (|sk_count_square#condqp3| (|count_square#condqp3| Heap2Heap@@0 i@@21 lo@@9 hi@@18 step@@6 vmin@@6 vmax@@6 ar@@18 v_2@@10) (|count_square#condqp3| Heap1Heap@@0 i@@21 lo@@9 hi@@18 step@@6 vmin@@6 vmax@@6 ar@@18 v_2@@10)) step@@6)) (< (mod (|sk_count_square#condqp3| (|count_square#condqp3| Heap2Heap@@0 i@@21 lo@@9 hi@@18 step@@6 vmin@@6 vmax@@6 ar@@18 v_2@@10) (|count_square#condqp3| Heap1Heap@@0 i@@21 lo@@9 hi@@18 step@@6 vmin@@6 vmax@@6 ar@@18 v_2@@10)) step@@6) hi@@18)))) (= (U_2_int (MapType0Select Heap2Heap@@0 (|Seq#Index| ar@@18 (|sk_count_square#condqp3| (|count_square#condqp3| Heap2Heap@@0 i@@21 lo@@9 hi@@18 step@@6 vmin@@6 vmax@@6 ar@@18 v_2@@10) (|count_square#condqp3| Heap1Heap@@0 i@@21 lo@@9 hi@@18 step@@6 vmin@@6 vmax@@6 ar@@18 v_2@@10))) Ref__Integer_value)) (U_2_int (MapType0Select Heap1Heap@@0 (|Seq#Index| ar@@18 (|sk_count_square#condqp3| (|count_square#condqp3| Heap2Heap@@0 i@@21 lo@@9 hi@@18 step@@6 vmin@@6 vmax@@6 ar@@18 v_2@@10) (|count_square#condqp3| Heap1Heap@@0 i@@21 lo@@9 hi@@18 step@@6 vmin@@6 vmax@@6 ar@@18 v_2@@10))) Ref__Integer_value)))))) (= (|count_square#condqp3| Heap2Heap@@0 i@@21 lo@@9 hi@@18 step@@6 vmin@@6 vmax@@6 ar@@18 v_2@@10) (|count_square#condqp3| Heap1Heap@@0 i@@21 lo@@9 hi@@18 step@@6 vmin@@6 vmax@@6 ar@@18 v_2@@10)))
 :qid |stdinbpl.1356:15|
 :skolemid |121|
 :pattern ( (|count_square#condqp3| Heap2Heap@@0 i@@21 lo@@9 hi@@18 step@@6 vmin@@6 vmax@@6 ar@@18 v_2@@10) (|count_square#condqp3| Heap1Heap@@0 i@@21 lo@@9 hi@@18 step@@6 vmin@@6 vmax@@6 ar@@18 v_2@@10) (succHeapTrans Heap2Heap@@0 Heap1Heap@@0))
)))
(assert (forall ((a T@U) (b T@U) ) (! (let ((T@@19 (SeqTypeInv0 (type a))))
 (=> (and (and (= (type a) (SeqType T@@19)) (= (type b) (SeqType T@@19))) (|Seq#Equal| a b)) (= a b)))
 :qid |stdinbpl.570:18|
 :skolemid |53|
 :pattern ( (|Seq#Equal| a b))
)))
(assert (forall ((Heap@@29 T@U) (i@@22 Int) (hi@@19 Int) (ar@@19 T@U) ) (!  (=> (and (= (type Heap@@29) (MapType0Type RefType)) (= (type ar@@19) (SeqType intType))) (and (= (sum_list Heap@@29 i@@22 hi@@19 ar@@19) (|sum_list'| Heap@@29 i@@22 hi@@19 ar@@19)) (dummyFunction (int_2_U (|sum_list#triggerStateless| i@@22 hi@@19 ar@@19)))))
 :qid |stdinbpl.717:15|
 :skolemid |66|
 :pattern ( (sum_list Heap@@29 i@@22 hi@@19 ar@@19))
)))
(assert (forall ((Heap@@30 T@U) (Mask@@18 T@U) (N0@@5 Int) (N1@@5 Int) (i0@@5 Int) (i1@@5 Int) ) (!  (=> (and (and (= (type Heap@@30) (MapType0Type RefType)) (= (type Mask@@18) (MapType1Type RefType realType))) (and (state Heap@@30 Mask@@18) (or (< AssumeFunctionsAbove 0) (|Ref__multidim_index_2#trigger| EmptyFrame N0@@5 N1@@5 i0@@5 i1@@5)))) (=> (and (and (and (and (and (<= 0 i0@@5) (< i0@@5 N0@@5)) (<= 0 N0@@5)) (<= 0 i1@@5)) (< i1@@5 N1@@5)) (<= 0 N1@@5)) (< (|Ref__multidim_index_2'| Heap@@30 N0@@5 N1@@5 i0@@5 i1@@5) (* N0@@5 N1@@5))))
 :qid |stdinbpl.642:15|
 :skolemid |62|
 :pattern ( (state Heap@@30 Mask@@18) (|Ref__multidim_index_2'| Heap@@30 N0@@5 N1@@5 i0@@5 i1@@5))
)))
(assert (forall ((s@@8 T@U) (i@@23 Int) ) (! (let ((T@@20 (SeqTypeInv0 (type s@@8))))
 (=> (= (type s@@8) (SeqType T@@20)) (=> (and (<= 0 i@@23) (< i@@23 (|Seq#Length| s@@8))) (|Seq#ContainsTrigger| s@@8 (|Seq#Index| s@@8 i@@23)))))
 :qid |stdinbpl.463:18|
 :skolemid |49|
 :pattern ( (|Seq#Index| s@@8 i@@23))
)))
(assert (forall ((s0@@1 T@U) (s1@@1 T@U) ) (! (let ((T@@21 (SeqTypeInv0 (type s0@@1))))
 (=> (and (= (type s0@@1) (SeqType T@@21)) (= (type s1@@1) (SeqType T@@21))) (and (=> (= s0@@1 (|Seq#Empty| T@@21)) (= (|Seq#Append| s0@@1 s1@@1) s1@@1)) (=> (= s1@@1 (|Seq#Empty| T@@21)) (= (|Seq#Append| s0@@1 s1@@1) s0@@1)))))
 :qid |stdinbpl.282:18|
 :skolemid |27|
 :pattern ( (|Seq#Append| s0@@1 s1@@1))
)))
(assert (forall ((t@@1 T@U) ) (! (= (|Seq#Index| (|Seq#Singleton| t@@1) 0) t@@1)
 :qid |stdinbpl.286:18|
 :skolemid |28|
 :pattern ( (|Seq#Singleton| t@@1))
)))
(assert (forall ((s@@9 T@U) ) (! (let ((T@@22 (SeqTypeInv0 (type s@@9))))
 (=> (= (type s@@9) (SeqType T@@22)) (<= 0 (|Seq#Length| s@@9))))
 :qid |stdinbpl.265:18|
 :skolemid |22|
 :pattern ( (|Seq#Length| s@@9))
)))
(assert (forall ((s0@@2 T@U) (s1@@2 T@U) ) (! (let ((T@@23 (SeqTypeInv0 (type s0@@2))))
 (=> (and (and (= (type s0@@2) (SeqType T@@23)) (= (type s1@@2) (SeqType T@@23))) (|Seq#Equal| s0@@2 s1@@2)) (and (= (|Seq#Length| s0@@2) (|Seq#Length| s1@@2)) (forall ((j@@8 Int) ) (!  (=> (and (<= 0 j@@8) (< j@@8 (|Seq#Length| s0@@2))) (= (|Seq#Index| s0@@2 j@@8) (|Seq#Index| s1@@2 j@@8)))
 :qid |stdinbpl.560:13|
 :skolemid |50|
 :pattern ( (|Seq#Index| s0@@2 j@@8))
 :pattern ( (|Seq#Index| s1@@2 j@@8))
)))))
 :qid |stdinbpl.557:18|
 :skolemid |51|
 :pattern ( (|Seq#Equal| s0@@2 s1@@2))
)))
(assert (forall ((Heap@@31 T@U) (ExhaleHeap@@4 T@U) (Mask@@19 T@U) (pm_f@@1 T@U) ) (! (let ((C@@1 (FieldTypeInv0 (type pm_f@@1))))
 (=> (and (and (and (and (and (= (type Heap@@31) (MapType0Type RefType)) (= (type ExhaleHeap@@4) (MapType0Type RefType))) (= (type Mask@@19) (MapType1Type RefType realType))) (= (type pm_f@@1) (FieldType C@@1 FrameTypeType))) (IdenticalOnKnownLocations Heap@@31 ExhaleHeap@@4 Mask@@19)) (and (HasDirectPerm Mask@@19 null pm_f@@1) (IsPredicateField pm_f@@1))) (forall ((o2 T@U) (f_2@@0 T@U) ) (! (let ((B@@5 (FieldTypeInv1 (type f_2@@0))))
(let ((A@@6 (FieldTypeInv0 (type f_2@@0))))
 (=> (and (and (= (type o2) RefType) (= (type f_2@@0) (FieldType A@@6 B@@5))) (U_2_bool (MapType1Select (MapType0Select Heap@@31 null (PredicateMaskField pm_f@@1)) o2 f_2@@0))) (= (MapType0Select Heap@@31 o2 f_2@@0) (MapType0Select ExhaleHeap@@4 o2 f_2@@0)))))
 :qid |stdinbpl.54:134|
 :skolemid |3|
 :pattern ( (MapType0Select ExhaleHeap@@4 o2 f_2@@0))
))))
 :qid |stdinbpl.52:19|
 :skolemid |4|
 :pattern ( (IdenticalOnKnownLocations Heap@@31 ExhaleHeap@@4 Mask@@19) (IsPredicateField pm_f@@1))
)))
(assert (forall ((Heap@@32 T@U) (ExhaleHeap@@5 T@U) (Mask@@20 T@U) (pm_f@@2 T@U) ) (! (let ((C@@2 (FieldTypeInv0 (type pm_f@@2))))
 (=> (and (and (and (and (and (= (type Heap@@32) (MapType0Type RefType)) (= (type ExhaleHeap@@5) (MapType0Type RefType))) (= (type Mask@@20) (MapType1Type RefType realType))) (= (type pm_f@@2) (FieldType C@@2 FrameTypeType))) (IdenticalOnKnownLocations Heap@@32 ExhaleHeap@@5 Mask@@20)) (and (HasDirectPerm Mask@@20 null pm_f@@2) (IsWandField pm_f@@2))) (forall ((o2@@0 T@U) (f_2@@1 T@U) ) (! (let ((B@@6 (FieldTypeInv1 (type f_2@@1))))
(let ((A@@7 (FieldTypeInv0 (type f_2@@1))))
 (=> (and (and (= (type o2@@0) RefType) (= (type f_2@@1) (FieldType A@@7 B@@6))) (U_2_bool (MapType1Select (MapType0Select Heap@@32 null (WandMaskField pm_f@@2)) o2@@0 f_2@@1))) (= (MapType0Select Heap@@32 o2@@0 f_2@@1) (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1)))))
 :qid |stdinbpl.67:129|
 :skolemid |6|
 :pattern ( (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1))
))))
 :qid |stdinbpl.65:19|
 :skolemid |7|
 :pattern ( (IdenticalOnKnownLocations Heap@@32 ExhaleHeap@@5 Mask@@20) (IsWandField pm_f@@2))
)))
(assert (forall ((t@@2 T@U) ) (! (= (|Seq#Length| (|Seq#Singleton| t@@2)) 1)
 :qid |stdinbpl.273:18|
 :skolemid |25|
 :pattern ( (|Seq#Singleton| t@@2))
)))
(assert (forall ((Mask@@21 T@U) (o_2@@2 T@U) (f_4@@2 T@U) ) (! (let ((B@@7 (FieldTypeInv1 (type f_4@@2))))
(let ((A@@8 (FieldTypeInv0 (type f_4@@2))))
 (=> (and (and (and (= (type Mask@@21) (MapType1Type RefType realType)) (= (type o_2@@2) RefType)) (= (type f_4@@2) (FieldType A@@8 B@@7))) (GoodMask Mask@@21)) (and (>= (U_2_real (MapType1Select Mask@@21 o_2@@2 f_4@@2)) NoPerm) (=> (and (and (GoodMask Mask@@21) (not (IsPredicateField f_4@@2))) (not (IsWandField f_4@@2))) (<= (U_2_real (MapType1Select Mask@@21 o_2@@2 f_4@@2)) FullPerm))))))
 :qid |stdinbpl.128:22|
 :skolemid |16|
 :pattern ( (GoodMask Mask@@21) (MapType1Select Mask@@21 o_2@@2 f_4@@2))
)))
(assert (forall ((Heap@@33 T@U) (Mask@@22 T@U) (i@@24 Int) (hi@@20 Int) (ar@@20 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@33) (MapType0Type RefType)) (= (type Mask@@22) (MapType1Type RefType realType))) (= (type ar@@20) (SeqType intType))) (and (state Heap@@33 Mask@@22) (< AssumeFunctionsAbove 4))) (and (and (<= 0 i@@24) (<= i@@24 hi@@20)) (<= hi@@20 (|Seq#Length| ar@@20)))) (= (sum_list Heap@@33 i@@24 hi@@20 ar@@20) (ite (< i@@24 hi@@20) (+ (U_2_int (|Seq#Index| ar@@20 i@@24)) (|sum_list'| Heap@@33 (+ i@@24 1) hi@@20 ar@@20)) 0)))
 :qid |stdinbpl.727:15|
 :skolemid |68|
 :pattern ( (state Heap@@33 Mask@@22) (sum_list Heap@@33 i@@24 hi@@20 ar@@20))
)))
(assert (forall ((o T@U) (f T@U) (Heap@@34 T@U) ) (!  (=> (and (and (and (= (type o) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap@@34) (MapType0Type RefType))) (U_2_bool (MapType0Select Heap@@34 o $allocated))) (U_2_bool (MapType0Select Heap@@34 (MapType0Select Heap@@34 o f) $allocated)))
 :qid |stdinbpl.31:15|
 :skolemid |0|
 :pattern ( (MapType0Select Heap@@34 o f))
)))
(assert (forall ((s@@10 T@U) (t@@3 T@U) (n@@8 Int) ) (! (let ((T@@24 (SeqTypeInv0 (type s@@10))))
 (=> (and (and (= (type s@@10) (SeqType T@@24)) (= (type t@@3) (SeqType T@@24))) (and (< 0 n@@8) (<= n@@8 (|Seq#Length| s@@10)))) (= (|Seq#Take| (|Seq#Append| s@@10 t@@3) n@@8) (|Seq#Take| s@@10 n@@8))))
 :qid |stdinbpl.415:18|
 :skolemid |41|
 :pattern ( (|Seq#Take| (|Seq#Append| s@@10 t@@3) n@@8))
)))
(assert (forall ((s@@11 T@U) (i@@25 Int) (v@@1 T@U) ) (! (let ((T@@25 (type v@@1)))
 (=> (= (type s@@11) (SeqType T@@25)) (=> (and (<= 0 i@@25) (< i@@25 (|Seq#Length| s@@11))) (= (|Seq#Length| (|Seq#Update| s@@11 i@@25 v@@1)) (|Seq#Length| s@@11)))))
 :qid |stdinbpl.314:18|
 :skolemid |34|
 :pattern ( (|Seq#Length| (|Seq#Update| s@@11 i@@25 v@@1)))
 :pattern ( (|Seq#Length| s@@11) (|Seq#Update| s@@11 i@@25 v@@1))
)))
(assert (forall ((s@@12 T@U) (t@@4 T@U) (n@@9 Int) ) (! (let ((T@@26 (SeqTypeInv0 (type s@@12))))
 (=> (and (and (= (type s@@12) (SeqType T@@26)) (= (type t@@4) (SeqType T@@26))) (and (< 0 n@@9) (<= n@@9 (|Seq#Length| s@@12)))) (= (|Seq#Drop| (|Seq#Append| s@@12 t@@4) n@@9) (|Seq#Append| (|Seq#Drop| s@@12 n@@9) t@@4))))
 :qid |stdinbpl.428:18|
 :skolemid |43|
 :pattern ( (|Seq#Drop| (|Seq#Append| s@@12 t@@4) n@@9))
)))
(assert (forall ((s@@13 T@U) (n@@10 Int) (i@@26 Int) ) (! (let ((T@@27 (SeqTypeInv0 (type s@@13))))
 (=> (= (type s@@13) (SeqType T@@27)) (=> (and (and (< 0 n@@10) (<= n@@10 i@@26)) (< i@@26 (|Seq#Length| s@@13))) (and (= (|Seq#Add| (|Seq#Sub| i@@26 n@@10) n@@10) i@@26) (= (|Seq#Index| (|Seq#Drop| s@@13 n@@10) (|Seq#Sub| i@@26 n@@10)) (|Seq#Index| s@@13 i@@26))))))
 :qid |stdinbpl.365:18|
 :skolemid |40|
 :pattern ( (|Seq#Drop| s@@13 n@@10) (|Seq#Index| s@@13 i@@26))
)))
(assert (forall ((s0@@3 T@U) (s1@@3 T@U) (n@@11 Int) ) (! (let ((T@@28 (SeqTypeInv0 (type s0@@3))))
 (=> (and (= (type s0@@3) (SeqType T@@28)) (= (type s1@@3) (SeqType T@@28))) (=> (and (and (and (not (= s0@@3 (|Seq#Empty| T@@28))) (not (= s1@@3 (|Seq#Empty| T@@28)))) (<= 0 n@@11)) (< n@@11 (|Seq#Length| s0@@3))) (= (|Seq#Index| (|Seq#Append| s0@@3 s1@@3) n@@11) (|Seq#Index| s0@@3 n@@11)))))
 :qid |stdinbpl.305:18|
 :skolemid |31|
 :pattern ( (|Seq#Index| (|Seq#Append| s0@@3 s1@@3) n@@11))
 :pattern ( (|Seq#Index| s0@@3 n@@11) (|Seq#Append| s0@@3 s1@@3))
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
 :qid |stdinbpl.310:18|
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
(assert (forall ((Heap@@36 T@U) (Mask@@23 T@U) (i@@27 Int) (lo@@10 Int) (hi@@21 Int) (step@@7 Int) (vmin@@7 Int) (vmax@@7 Int) (ar@@21 T@U) ) (!  (=> (and (and (and (= (type Heap@@36) (MapType0Type RefType)) (= (type Mask@@23) (MapType1Type RefType realType))) (= (type ar@@21) (SeqType RefType))) (state Heap@@36 Mask@@23)) (= (|sum_square'| Heap@@36 i@@27 lo@@10 hi@@21 step@@7 vmin@@7 vmax@@7 ar@@21) (|sum_square#frame| (FrameFragment (int_2_U (|sum_square#condqp2| Heap@@36 i@@27 lo@@10 hi@@21 step@@7 vmin@@7 vmax@@7 ar@@21))) i@@27 lo@@10 hi@@21 step@@7 vmin@@7 vmax@@7 ar@@21)))
 :qid |stdinbpl.1068:15|
 :skolemid |97|
 :pattern ( (state Heap@@36 Mask@@23) (|sum_square'| Heap@@36 i@@27 lo@@10 hi@@21 step@@7 vmin@@7 vmax@@7 ar@@21))
)))
(assert (forall ((s@@14 T@U) (x@@10 T@U) (i@@28 Int) ) (! (let ((T@@30 (type x@@10)))
 (=> (= (type s@@14) (SeqType T@@30)) (=> (and (and (<= 0 i@@28) (< i@@28 (|Seq#Length| s@@14))) (= (|Seq#Index| s@@14 i@@28) x@@10)) (|Seq#Contains| s@@14 x@@10))))
 :qid |stdinbpl.461:18|
 :skolemid |48|
 :pattern ( (|Seq#Contains| s@@14 x@@10) (|Seq#Index| s@@14 i@@28))
)))
(assert (forall ((s0@@5 T@U) (s1@@5 T@U) ) (! (let ((T@@31 (SeqTypeInv0 (type s0@@5))))
 (=> (and (= (type s0@@5) (SeqType T@@31)) (= (type s1@@5) (SeqType T@@31))) (or (or (and (= s0@@5 s1@@5) (|Seq#Equal| s0@@5 s1@@5)) (and (and (not (= s0@@5 s1@@5)) (not (|Seq#Equal| s0@@5 s1@@5))) (not (= (|Seq#Length| s0@@5) (|Seq#Length| s1@@5))))) (and (and (and (and (and (and (not (= s0@@5 s1@@5)) (not (|Seq#Equal| s0@@5 s1@@5))) (= (|Seq#Length| s0@@5) (|Seq#Length| s1@@5))) (= (|Seq#SkolemDiff| s0@@5 s1@@5) (|Seq#SkolemDiff| s1@@5 s0@@5))) (<= 0 (|Seq#SkolemDiff| s0@@5 s1@@5))) (< (|Seq#SkolemDiff| s0@@5 s1@@5) (|Seq#Length| s0@@5))) (not (= (|Seq#Index| s0@@5 (|Seq#SkolemDiff| s0@@5 s1@@5)) (|Seq#Index| s1@@5 (|Seq#SkolemDiff| s0@@5 s1@@5))))))))
 :qid |stdinbpl.565:18|
 :skolemid |52|
 :pattern ( (|Seq#Equal| s0@@5 s1@@5))
)))
(assert (forall ((p@@1 T@U) (v_1@@0 T@U) (q T@U) (w@@0 T@U) (r T@U) (u T@U) ) (! (let ((C@@3 (FieldTypeInv0 (type r))))
(let ((B@@10 (FieldTypeInv0 (type q))))
(let ((A@@11 (FieldTypeInv0 (type p@@1))))
 (=> (and (and (and (and (and (and (= (type p@@1) (FieldType A@@11 FrameTypeType)) (= (type v_1@@0) FrameTypeType)) (= (type q) (FieldType B@@10 FrameTypeType))) (= (type w@@0) FrameTypeType)) (= (type r) (FieldType C@@3 FrameTypeType))) (= (type u) FrameTypeType)) (and (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))) (InsidePredicate p@@1 v_1@@0 r u)))))
 :qid |stdinbpl.234:25|
 :skolemid |20|
 :pattern ( (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))
)))
(assert (forall ((Heap@@37 T@U) (i@@29 Int) (lo@@11 Int) (hi@@22 Int) (step@@8 Int) (vmin@@8 Int) (vmax@@8 Int) (ar@@22 T@U) ) (!  (=> (and (= (type Heap@@37) (MapType0Type RefType)) (= (type ar@@22) (SeqType RefType))) (dummyFunction (int_2_U (|sum_square#triggerStateless| i@@29 lo@@11 hi@@22 step@@8 vmin@@8 vmax@@8 ar@@22))))
 :qid |stdinbpl.1052:15|
 :skolemid |94|
 :pattern ( (|sum_square'| Heap@@37 i@@29 lo@@11 hi@@22 step@@8 vmin@@8 vmax@@8 ar@@22))
)))
(assert (forall ((s@@15 T@U) ) (! (let ((T@@32 (SeqTypeInv0 (type s@@15))))
 (=> (and (= (type s@@15) (SeqType T@@32)) (= (|Seq#Length| s@@15) 0)) (= s@@15 (|Seq#Empty| T@@32))))
 :qid |stdinbpl.269:18|
 :skolemid |24|
 :pattern ( (|Seq#Length| s@@15))
)))
(assert (forall ((s@@16 T@U) (n@@12 Int) ) (! (let ((T@@33 (SeqTypeInv0 (type s@@16))))
 (=> (and (= (type s@@16) (SeqType T@@33)) (<= n@@12 0)) (= (|Seq#Take| s@@16 n@@12) (|Seq#Empty| T@@33))))
 :qid |stdinbpl.444:18|
 :skolemid |46|
 :pattern ( (|Seq#Take| s@@16 n@@12))
)))
(assert (forall ((Heap@@38 T@U) (Mask@@24 T@U) (N0@@6 Int) (N1@@6 Int) (i0@@6 Int) (i1@@6 Int) ) (!  (=> (and (and (= (type Heap@@38) (MapType0Type RefType)) (= (type Mask@@24) (MapType1Type RefType realType))) (and (state Heap@@38 Mask@@24) (or (< AssumeFunctionsAbove 0) (|Ref__multidim_index_2#trigger| EmptyFrame N0@@6 N1@@6 i0@@6 i1@@6)))) (=> (and (and (and (and (and (<= 0 i0@@6) (< i0@@6 N0@@6)) (<= 0 N0@@6)) (<= 0 i1@@6)) (< i1@@6 N1@@6)) (<= 0 N1@@6)) (<= 0 (|Ref__multidim_index_2'| Heap@@38 N0@@6 N1@@6 i0@@6 i1@@6))))
 :qid |stdinbpl.638:15|
 :skolemid |61|
 :pattern ( (state Heap@@38 Mask@@24) (|Ref__multidim_index_2'| Heap@@38 N0@@6 N1@@6 i0@@6 i1@@6))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
(assert (forall ((Heap@@39 T@U) (Mask@@25 T@U) (i@@30 Int) (lo@@12 Int) (hi@@23 Int) (ar@@23 T@U) ) (!  (=> (and (and (and (= (type Heap@@39) (MapType0Type RefType)) (= (type Mask@@25) (MapType1Type RefType realType))) (= (type ar@@23) (SeqType RefType))) (state Heap@@39 Mask@@25)) (= (|sum_array'| Heap@@39 i@@30 lo@@12 hi@@23 ar@@23) (|sum_array#frame| (FrameFragment (int_2_U (|sum_array#condqp1| Heap@@39 i@@30 lo@@12 hi@@23 ar@@23))) i@@30 lo@@12 hi@@23 ar@@23)))
 :qid |stdinbpl.821:15|
 :skolemid |74|
 :pattern ( (state Heap@@39 Mask@@25) (|sum_array'| Heap@@39 i@@30 lo@@12 hi@@23 ar@@23))
)))
(assert (forall ((Heap@@40 T@U) (Mask@@26 T@U) (i@@31 Int) (hi@@24 Int) (ar@@24 T@U) (v_2@@11 Int) ) (!  (=> (and (and (and (= (type Heap@@40) (MapType0Type RefType)) (= (type Mask@@26) (MapType1Type RefType realType))) (= (type ar@@24) (SeqType RefType))) (state Heap@@40 Mask@@26)) (= (|count_array'| Heap@@40 i@@31 hi@@24 ar@@24 v_2@@11) (|count_array#frame| (FrameFragment (int_2_U (|count_array#condqp4| Heap@@40 i@@31 hi@@24 ar@@24 v_2@@11))) i@@31 hi@@24 ar@@24 v_2@@11)))
 :qid |stdinbpl.1708:15|
 :skolemid |147|
 :pattern ( (state Heap@@40 Mask@@26) (|count_array'| Heap@@40 i@@31 hi@@24 ar@@24 v_2@@11))
)))
(assert (forall ((Heap2Heap@@1 T@U) (Heap1Heap@@1 T@U) (i@@32 Int) (hi@@25 Int) (ar@@25 T@U) (v_2@@12 Int) ) (!  (=> (and (and (and (= (type Heap2Heap@@1) (MapType0Type RefType)) (= (type Heap1Heap@@1) (MapType0Type RefType))) (= (type ar@@25) (SeqType RefType))) (and (=  (and (<= 0 (|sk_count_array#condqp4| (|count_array#condqp4| Heap2Heap@@1 i@@32 hi@@25 ar@@25 v_2@@12) (|count_array#condqp4| Heap1Heap@@1 i@@32 hi@@25 ar@@25 v_2@@12))) (< (|sk_count_array#condqp4| (|count_array#condqp4| Heap2Heap@@1 i@@32 hi@@25 ar@@25 v_2@@12) (|count_array#condqp4| Heap1Heap@@1 i@@32 hi@@25 ar@@25 v_2@@12)) hi@@25))  (and (<= 0 (|sk_count_array#condqp4| (|count_array#condqp4| Heap2Heap@@1 i@@32 hi@@25 ar@@25 v_2@@12) (|count_array#condqp4| Heap1Heap@@1 i@@32 hi@@25 ar@@25 v_2@@12))) (< (|sk_count_array#condqp4| (|count_array#condqp4| Heap2Heap@@1 i@@32 hi@@25 ar@@25 v_2@@12) (|count_array#condqp4| Heap1Heap@@1 i@@32 hi@@25 ar@@25 v_2@@12)) hi@@25))) (=> (and (<= 0 (|sk_count_array#condqp4| (|count_array#condqp4| Heap2Heap@@1 i@@32 hi@@25 ar@@25 v_2@@12) (|count_array#condqp4| Heap1Heap@@1 i@@32 hi@@25 ar@@25 v_2@@12))) (< (|sk_count_array#condqp4| (|count_array#condqp4| Heap2Heap@@1 i@@32 hi@@25 ar@@25 v_2@@12) (|count_array#condqp4| Heap1Heap@@1 i@@32 hi@@25 ar@@25 v_2@@12)) hi@@25)) (= (U_2_int (MapType0Select Heap2Heap@@1 (|Seq#Index| ar@@25 (|sk_count_array#condqp4| (|count_array#condqp4| Heap2Heap@@1 i@@32 hi@@25 ar@@25 v_2@@12) (|count_array#condqp4| Heap1Heap@@1 i@@32 hi@@25 ar@@25 v_2@@12))) Ref__Integer_value)) (U_2_int (MapType0Select Heap1Heap@@1 (|Seq#Index| ar@@25 (|sk_count_array#condqp4| (|count_array#condqp4| Heap2Heap@@1 i@@32 hi@@25 ar@@25 v_2@@12) (|count_array#condqp4| Heap1Heap@@1 i@@32 hi@@25 ar@@25 v_2@@12))) Ref__Integer_value)))))) (= (|count_array#condqp4| Heap2Heap@@1 i@@32 hi@@25 ar@@25 v_2@@12) (|count_array#condqp4| Heap1Heap@@1 i@@32 hi@@25 ar@@25 v_2@@12)))
 :qid |stdinbpl.1718:15|
 :skolemid |148|
 :pattern ( (|count_array#condqp4| Heap2Heap@@1 i@@32 hi@@25 ar@@25 v_2@@12) (|count_array#condqp4| Heap1Heap@@1 i@@32 hi@@25 ar@@25 v_2@@12) (succHeapTrans Heap2Heap@@1 Heap1Heap@@1))
)))
(assert (forall ((Heap2Heap@@2 T@U) (Heap1Heap@@2 T@U) (i@@33 Int) (lo@@13 Int) (hi@@26 Int) (ar@@26 T@U) ) (!  (=> (and (and (and (= (type Heap2Heap@@2) (MapType0Type RefType)) (= (type Heap1Heap@@2) (MapType0Type RefType))) (= (type ar@@26) (SeqType RefType))) (and (=  (and (<= lo@@13 (|sk_sum_array#condqp1| (|sum_array#condqp1| Heap2Heap@@2 i@@33 lo@@13 hi@@26 ar@@26) (|sum_array#condqp1| Heap1Heap@@2 i@@33 lo@@13 hi@@26 ar@@26))) (< (|sk_sum_array#condqp1| (|sum_array#condqp1| Heap2Heap@@2 i@@33 lo@@13 hi@@26 ar@@26) (|sum_array#condqp1| Heap1Heap@@2 i@@33 lo@@13 hi@@26 ar@@26)) hi@@26))  (and (<= lo@@13 (|sk_sum_array#condqp1| (|sum_array#condqp1| Heap2Heap@@2 i@@33 lo@@13 hi@@26 ar@@26) (|sum_array#condqp1| Heap1Heap@@2 i@@33 lo@@13 hi@@26 ar@@26))) (< (|sk_sum_array#condqp1| (|sum_array#condqp1| Heap2Heap@@2 i@@33 lo@@13 hi@@26 ar@@26) (|sum_array#condqp1| Heap1Heap@@2 i@@33 lo@@13 hi@@26 ar@@26)) hi@@26))) (=> (and (<= lo@@13 (|sk_sum_array#condqp1| (|sum_array#condqp1| Heap2Heap@@2 i@@33 lo@@13 hi@@26 ar@@26) (|sum_array#condqp1| Heap1Heap@@2 i@@33 lo@@13 hi@@26 ar@@26))) (< (|sk_sum_array#condqp1| (|sum_array#condqp1| Heap2Heap@@2 i@@33 lo@@13 hi@@26 ar@@26) (|sum_array#condqp1| Heap1Heap@@2 i@@33 lo@@13 hi@@26 ar@@26)) hi@@26)) (= (U_2_int (MapType0Select Heap2Heap@@2 (|Seq#Index| ar@@26 (|sk_sum_array#condqp1| (|sum_array#condqp1| Heap2Heap@@2 i@@33 lo@@13 hi@@26 ar@@26) (|sum_array#condqp1| Heap1Heap@@2 i@@33 lo@@13 hi@@26 ar@@26))) Ref__Integer_value)) (U_2_int (MapType0Select Heap1Heap@@2 (|Seq#Index| ar@@26 (|sk_sum_array#condqp1| (|sum_array#condqp1| Heap2Heap@@2 i@@33 lo@@13 hi@@26 ar@@26) (|sum_array#condqp1| Heap1Heap@@2 i@@33 lo@@13 hi@@26 ar@@26))) Ref__Integer_value)))))) (= (|sum_array#condqp1| Heap2Heap@@2 i@@33 lo@@13 hi@@26 ar@@26) (|sum_array#condqp1| Heap1Heap@@2 i@@33 lo@@13 hi@@26 ar@@26)))
 :qid |stdinbpl.831:15|
 :skolemid |75|
 :pattern ( (|sum_array#condqp1| Heap2Heap@@2 i@@33 lo@@13 hi@@26 ar@@26) (|sum_array#condqp1| Heap1Heap@@2 i@@33 lo@@13 hi@@26 ar@@26) (succHeapTrans Heap2Heap@@2 Heap1Heap@@2))
)))
(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun PostHeap@0 () T@U)
(declare-fun M () Int)
(declare-fun N () Int)
(declare-fun i@@34 () Int)
(declare-fun j@@9 () Int)
(declare-fun matrix () T@U)
(declare-fun PostMask@0 () T@U)
(declare-fun Mask@1 () T@U)
(declare-fun Mask@0 () T@U)
(declare-fun Heap@0 () T@U)
(declare-fun __flatten_3@0 () Int)
(declare-fun Heap@@41 () T@U)
(declare-fun __flatten_4@0 () T@U)
(declare-fun __flatten_4 () T@U)
(declare-fun diz () T@U)
(declare-fun current_thread_id () Int)
(assert  (and (and (and (and (and (and (and (and (and (= (type Mask@1) (MapType1Type RefType realType)) (= (type Mask@0) (MapType1Type RefType realType))) (= (type matrix) (SeqType RefType))) (= (type Heap@0) (MapType0Type RefType))) (= (type Heap@@41) (MapType0Type RefType))) (= (type __flatten_4@0) RefType)) (= (type __flatten_4) RefType)) (= (type PostHeap@0) (MapType0Type RefType))) (= (type PostMask@0) (MapType1Type RefType realType))) (= (type diz) RefType)))
(set-info :boogie-vc-id Ref__loop_body_31)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 64) (let ((anon19_Else_correct  (and (=> (= (ControlFlow 0 52) (- 0 54)) (>= (Ref__multidim_index_2 PostHeap@0 M N i@@34 j@@9) 0)) (=> (>= (Ref__multidim_index_2 PostHeap@0 M N i@@34 j@@9) 0) (and (=> (= (ControlFlow 0 52) (- 0 53)) (< (Ref__multidim_index_2 PostHeap@0 M N i@@34 j@@9) (|Seq#Length| matrix))) (=> (< (Ref__multidim_index_2 PostHeap@0 M N i@@34 j@@9) (|Seq#Length| matrix)) (=> (= (ControlFlow 0 52) (- 0 51)) (HasDirectPerm PostMask@0 (|Seq#Index| matrix (Ref__multidim_index_2 PostHeap@0 M N i@@34 j@@9)) Ref__Integer_value))))))))
(let ((anon19_Then_correct  (and (=> (= (ControlFlow 0 45) (- 0 50)) (<= 0 i@@34)) (=> (<= 0 i@@34) (and (=> (= (ControlFlow 0 45) (- 0 49)) (< i@@34 M)) (=> (< i@@34 M) (and (=> (= (ControlFlow 0 45) (- 0 48)) (<= 0 M)) (=> (<= 0 M) (and (=> (= (ControlFlow 0 45) (- 0 47)) (<= 0 j@@9)) (=> (<= 0 j@@9) (and (=> (= (ControlFlow 0 45) (- 0 46)) (< j@@9 N)) (=> (< j@@9 N) (=> (= (ControlFlow 0 45) (- 0 44)) (<= 0 N))))))))))))))
(let ((anon18_Else_correct  (and (=> (= (ControlFlow 0 55) (- 0 57)) (>= (Ref__multidim_index_2 PostHeap@0 M N i@@34 j@@9) 0)) (=> (>= (Ref__multidim_index_2 PostHeap@0 M N i@@34 j@@9) 0) (and (=> (= (ControlFlow 0 55) (- 0 56)) (< (Ref__multidim_index_2 PostHeap@0 M N i@@34 j@@9) (|Seq#Length| matrix))) (=> (< (Ref__multidim_index_2 PostHeap@0 M N i@@34 j@@9) (|Seq#Length| matrix)) (=> (not (= (|Seq#Index| matrix (Ref__multidim_index_2 PostHeap@0 M N i@@34 j@@9)) null)) (=> (and (and (= PostMask@0 (MapType1Store ZeroMask (|Seq#Index| matrix (Ref__multidim_index_2 PostHeap@0 M N i@@34 j@@9)) Ref__Integer_value (real_2_U (+ (U_2_real (MapType1Select ZeroMask (|Seq#Index| matrix (Ref__multidim_index_2 PostHeap@0 M N i@@34 j@@9)) Ref__Integer_value)) FullPerm)))) (state PostHeap@0 PostMask@0)) (and (state PostHeap@0 PostMask@0) (state PostHeap@0 PostMask@0))) (and (=> (= (ControlFlow 0 55) 45) anon19_Then_correct) (=> (= (ControlFlow 0 55) 52) anon19_Else_correct))))))))))
(let ((anon18_Then_correct  (and (=> (= (ControlFlow 0 38) (- 0 43)) (<= 0 i@@34)) (=> (<= 0 i@@34) (and (=> (= (ControlFlow 0 38) (- 0 42)) (< i@@34 M)) (=> (< i@@34 M) (and (=> (= (ControlFlow 0 38) (- 0 41)) (<= 0 M)) (=> (<= 0 M) (and (=> (= (ControlFlow 0 38) (- 0 40)) (<= 0 j@@9)) (=> (<= 0 j@@9) (and (=> (= (ControlFlow 0 38) (- 0 39)) (< j@@9 N)) (=> (< j@@9 N) (=> (= (ControlFlow 0 38) (- 0 37)) (<= 0 N))))))))))))))
(let ((anon17_Then_correct  (=> (state PostHeap@0 ZeroMask) (=> (and (<= 0 i@@34) (< i@@34 M)) (=> (and (and (<= 0 j@@9) (< j@@9 N)) (and (state PostHeap@0 ZeroMask) (state PostHeap@0 ZeroMask))) (and (=> (= (ControlFlow 0 58) 38) anon18_Then_correct) (=> (= (ControlFlow 0 58) 55) anon18_Else_correct)))))))
(let ((anon14_correct  (=> (and (= Mask@1 (MapType1Store Mask@0 (|Seq#Index| matrix (Ref__multidim_index_2 Heap@0 M N i@@34 j@@9)) Ref__Integer_value (real_2_U (- (U_2_real (MapType1Select Mask@0 (|Seq#Index| matrix (Ref__multidim_index_2 Heap@0 M N i@@34 j@@9)) Ref__Integer_value)) FullPerm)))) (= (ControlFlow 0 23) (- 0 22))) (= (U_2_int (MapType0Select Heap@0 (|Seq#Index| matrix (Ref__multidim_index_2 Heap@0 M N i@@34 j@@9)) Ref__Integer_value)) 0))))
(let ((anon21_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 26) 23)) anon14_correct)))
(let ((anon21_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 24) (- 0 25)) (<= FullPerm (U_2_real (MapType1Select Mask@0 (|Seq#Index| matrix (Ref__multidim_index_2 Heap@0 M N i@@34 j@@9)) Ref__Integer_value)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@0 (|Seq#Index| matrix (Ref__multidim_index_2 Heap@0 M N i@@34 j@@9)) Ref__Integer_value))) (=> (= (ControlFlow 0 24) 23) anon14_correct))))))
(let ((anon20_Else_correct  (=> (= __flatten_3@0 (Ref__multidim_index_2 Heap@@41 M N i@@34 j@@9)) (=> (and (state Heap@@41 Mask@0) (state Heap@@41 Mask@0)) (and (=> (= (ControlFlow 0 27) (- 0 35)) (>= __flatten_3@0 0)) (=> (>= __flatten_3@0 0) (and (=> (= (ControlFlow 0 27) (- 0 34)) (< __flatten_3@0 (|Seq#Length| matrix))) (=> (< __flatten_3@0 (|Seq#Length| matrix)) (=> (= __flatten_4@0 (|Seq#Index| matrix __flatten_3@0)) (=> (and (state Heap@@41 Mask@0) (state Heap@@41 Mask@0)) (and (=> (= (ControlFlow 0 27) (- 0 33)) (= FullPerm (U_2_real (MapType1Select Mask@0 __flatten_4@0 Ref__Integer_value)))) (=> (= FullPerm (U_2_real (MapType1Select Mask@0 __flatten_4@0 Ref__Integer_value))) (=> (and (= Heap@0 (MapType0Store Heap@@41 __flatten_4@0 Ref__Integer_value (int_2_U 0))) (state Heap@0 Mask@0)) (and (=> (= (ControlFlow 0 27) (- 0 32)) (> (* M N) 0)) (=> (> (* M N) 0) (=> (state Heap@0 Mask@0) (and (=> (= (ControlFlow 0 27) (- 0 31)) (<= 0 i@@34)) (=> (<= 0 i@@34) (and (=> (= (ControlFlow 0 27) (- 0 30)) (< i@@34 M)) (=> (< i@@34 M) (and (=> (= (ControlFlow 0 27) (- 0 29)) (<= 0 j@@9)) (=> (<= 0 j@@9) (and (=> (= (ControlFlow 0 27) (- 0 28)) (< j@@9 N)) (=> (< j@@9 N) (and (=> (= (ControlFlow 0 27) 24) anon21_Then_correct) (=> (= (ControlFlow 0 27) 26) anon21_Else_correct))))))))))))))))))))))))))
(let ((anon20_Then_correct  (and (=> (= (ControlFlow 0 16) (- 0 21)) (<= 0 i@@34)) (=> (<= 0 i@@34) (and (=> (= (ControlFlow 0 16) (- 0 20)) (< i@@34 M)) (=> (< i@@34 M) (and (=> (= (ControlFlow 0 16) (- 0 19)) (<= 0 M)) (=> (<= 0 M) (and (=> (= (ControlFlow 0 16) (- 0 18)) (<= 0 j@@9)) (=> (<= 0 j@@9) (and (=> (= (ControlFlow 0 16) (- 0 17)) (< j@@9 N)) (=> (< j@@9 N) (=> (= (ControlFlow 0 16) (- 0 15)) (<= 0 N))))))))))))))
(let ((anon17_Else_correct  (=> (U_2_bool (MapType0Select Heap@@41 __flatten_4 $allocated)) (and (=> (= (ControlFlow 0 36) 16) anon20_Then_correct) (=> (= (ControlFlow 0 36) 27) anon20_Else_correct)))))
(let ((anon16_Else_correct  (and (=> (= (ControlFlow 0 59) (- 0 61)) (>= (Ref__multidim_index_2 Heap@@41 M N i@@34 j@@9) 0)) (=> (>= (Ref__multidim_index_2 Heap@@41 M N i@@34 j@@9) 0) (and (=> (= (ControlFlow 0 59) (- 0 60)) (< (Ref__multidim_index_2 Heap@@41 M N i@@34 j@@9) (|Seq#Length| matrix))) (=> (< (Ref__multidim_index_2 Heap@@41 M N i@@34 j@@9) (|Seq#Length| matrix)) (=> (and (and (not (= (|Seq#Index| matrix (Ref__multidim_index_2 Heap@@41 M N i@@34 j@@9)) null)) (= Mask@0 (MapType1Store ZeroMask (|Seq#Index| matrix (Ref__multidim_index_2 Heap@@41 M N i@@34 j@@9)) Ref__Integer_value (real_2_U (+ (U_2_real (MapType1Select ZeroMask (|Seq#Index| matrix (Ref__multidim_index_2 Heap@@41 M N i@@34 j@@9)) Ref__Integer_value)) FullPerm))))) (and (state Heap@@41 Mask@0) (state Heap@@41 Mask@0))) (and (=> (= (ControlFlow 0 59) 58) anon17_Then_correct) (=> (= (ControlFlow 0 59) 36) anon17_Else_correct)))))))))
(let ((anon16_Then_correct  (and (=> (= (ControlFlow 0 9) (- 0 14)) (<= 0 i@@34)) (=> (<= 0 i@@34) (and (=> (= (ControlFlow 0 9) (- 0 13)) (< i@@34 M)) (=> (< i@@34 M) (and (=> (= (ControlFlow 0 9) (- 0 12)) (<= 0 M)) (=> (<= 0 M) (and (=> (= (ControlFlow 0 9) (- 0 11)) (<= 0 j@@9)) (=> (<= 0 j@@9) (and (=> (= (ControlFlow 0 9) (- 0 10)) (< j@@9 N)) (=> (< j@@9 N) (=> (= (ControlFlow 0 9) (- 0 8)) (<= 0 N))))))))))))))
(let ((anon15_Else_correct  (=> (< (Ref__multidim_index_2 Heap@@41 M N i@@34 j@@9) (|Seq#Length| matrix)) (=> (and (state Heap@@41 ZeroMask) (state Heap@@41 ZeroMask)) (and (=> (= (ControlFlow 0 62) 9) anon16_Then_correct) (=> (= (ControlFlow 0 62) 59) anon16_Else_correct))))))
(let ((anon15_Then_correct  (and (=> (= (ControlFlow 0 2) (- 0 7)) (<= 0 i@@34)) (=> (<= 0 i@@34) (and (=> (= (ControlFlow 0 2) (- 0 6)) (< i@@34 M)) (=> (< i@@34 M) (and (=> (= (ControlFlow 0 2) (- 0 5)) (<= 0 M)) (=> (<= 0 M) (and (=> (= (ControlFlow 0 2) (- 0 4)) (<= 0 j@@9)) (=> (<= 0 j@@9) (and (=> (= (ControlFlow 0 2) (- 0 3)) (< j@@9 N)) (=> (< j@@9 N) (=> (= (ControlFlow 0 2) (- 0 1)) (<= 0 N))))))))))))))
(let ((anon0_correct  (=> (state Heap@@41 ZeroMask) (=> (and (and (= AssumeFunctionsAbove (- 0 1)) (U_2_bool (MapType0Select Heap@@41 diz $allocated))) (and (not (= diz null)) (state Heap@@41 ZeroMask))) (=> (and (and (and (>= current_thread_id 0) (state Heap@@41 ZeroMask)) (and (<= 0 i@@34) (< i@@34 M))) (and (and (<= 0 j@@9) (< j@@9 N)) (and (state Heap@@41 ZeroMask) (state Heap@@41 ZeroMask)))) (and (=> (= (ControlFlow 0 63) 2) anon15_Then_correct) (=> (= (ControlFlow 0 63) 62) anon15_Else_correct)))))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 64) 63) anon0_correct)))
PreconditionGeneratedEntry_correct))))))))))))))))))
))
(check-sat)
(pop 1)
; Valid
(get-info :rlimit)
