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
 :qid |stdinbpl.364:18|
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
 :qid |stdinbpl.670:15|
 :skolemid |63|
 :pattern ( (state Heap Mask) (|Ref__multidim_index_2'| Heap N0 N1 i0 i1))
)))
(assert (forall ((arg0@@26 T@U) ) (! (= (type (FrameFragment arg0@@26)) FrameTypeType)
 :qid |funType:FrameFragment|
 :pattern ( (FrameFragment arg0@@26))
)))
(assert (forall ((Heap@@0 T@U) (Mask@@0 T@U) (i Int) (lo Int) (hi Int) (step Int) (vmin Int) (vmax Int) (ar T@U) (v_2 Int) ) (!  (=> (and (and (and (= (type Heap@@0) (MapType0Type RefType)) (= (type Mask@@0) (MapType1Type RefType realType))) (= (type ar) (SeqType RefType))) (state Heap@@0 Mask@@0)) (= (|count_square'| Heap@@0 i lo hi step vmin vmax ar v_2) (|count_square#frame| (FrameFragment (int_2_U (|count_square#condqp3| Heap@@0 i lo hi step vmin vmax ar v_2))) i lo hi step vmin vmax ar v_2)))
 :qid |stdinbpl.1370:15|
 :skolemid |120|
 :pattern ( (state Heap@@0 Mask@@0) (|count_square'| Heap@@0 i lo hi step vmin vmax ar v_2))
)))
(assert (forall ((Heap@@1 T@U) (Mask@@1 T@U) (N0@@0 Int) (N1@@0 Int) (i0@@0 Int) (i1@@0 Int) ) (!  (=> (and (and (= (type Heap@@1) (MapType0Type RefType)) (= (type Mask@@1) (MapType1Type RefType realType))) (and (state Heap@@1 Mask@@1) (or (< AssumeFunctionsAbove 0) (|Ref__multidim_index_2#trigger| EmptyFrame N0@@0 N1@@0 i0@@0 i1@@0)))) (=> (and (and (and (and (and (<= 0 i0@@0) (< i0@@0 N0@@0)) (<= 0 N0@@0)) (<= 0 i1@@0)) (< i1@@0 N1@@0)) (<= 0 N1@@0)) (< (mod (|Ref__multidim_index_2'| Heap@@1 N0@@0 N1@@0 i0@@0 i1@@0) N1@@0) N0@@0)))
 :qid |stdinbpl.678:15|
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
 :qid |stdinbpl.745:15|
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
 :qid |stdinbpl.385:18|
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
 :qid |stdinbpl.674:15|
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
 :qid |stdinbpl.340:18|
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
 :qid |stdinbpl.351:18|
 :skolemid |36|
 :pattern ( (|Seq#Length| (|Seq#Take| s@@2 n@@2)))
 :pattern ( (|Seq#Take| s@@2 n@@2) (|Seq#Length| s@@2))
)))
(assert (forall ((arg0@@32 Int) (arg1@@13 Int) ) (! (= (type (|Seq#Range| arg0@@32 arg1@@13)) (SeqType intType))
 :qid |funType:Seq#Range|
 :pattern ( (|Seq#Range| arg0@@32 arg1@@13))
)))
(assert (forall ((q@min Int) (q@max Int) (v@@0 T@U) ) (!  (=> (= (type v@@0) intType) (= (|Seq#Contains| (|Seq#Range| q@min q@max) v@@0)  (and (<= q@min (U_2_int v@@0)) (< (U_2_int v@@0) q@max))))
 :qid |stdinbpl.624:15|
 :skolemid |57|
 :pattern ( (|Seq#Contains| (|Seq#Range| q@min q@max) v@@0))
)))
(assert (forall ((s@@3 T@U) (x@@8 T@U) ) (! (let ((T@@7 (type x@@8)))
 (=> (and (= (type s@@3) (SeqType T@@7)) (|Seq#Contains| s@@3 x@@8)) (and (and (<= 0 (|Seq#Skolem| s@@3 x@@8)) (< (|Seq#Skolem| s@@3 x@@8) (|Seq#Length| s@@3))) (= (|Seq#Index| s@@3 (|Seq#Skolem| s@@3 x@@8)) x@@8))))
 :qid |stdinbpl.482:18|
 :skolemid |47|
 :pattern ( (|Seq#Contains| s@@3 x@@8))
)))
(assert (forall ((Heap@@7 T@U) (Mask@@6 T@U) (i@@2 Int) (lo@@0 Int) (hi@@1 Int) (step@@0 Int) (vmin@@0 Int) (vmax@@0 Int) (ar@@1 T@U) (v_2@@0 Int) ) (!  (=> (and (and (and (= (type Heap@@7) (MapType0Type RefType)) (= (type Mask@@6) (MapType1Type RefType realType))) (= (type ar@@1) (SeqType RefType))) (and (state Heap@@7 Mask@@6) (< AssumeFunctionsAbove 2))) (=> (and (and (and (and (<= 0 lo@@0) (and (<= lo@@0 hi@@1) (and (<= hi@@1 step@@0) (> step@@0 0)))) (and (<= 0 vmin@@0) (and (<= vmin@@0 i@@2) (<= i@@2 vmax@@0)))) (<= vmax@@0 (|Seq#Length| ar@@1))) (forall ((j@@0 Int) (k Int) ) (!  (=> (and (<= 0 j@@0) (and (< j@@0 vmax@@0) (and (<= 0 k) (and (< k vmax@@0) (not (= j@@0 k)))))) (not (= (|Seq#Index| ar@@1 j@@0) (|Seq#Index| ar@@1 k))))
 :qid |stdinbpl.1362:189|
 :skolemid |118|
 :pattern ( (|Seq#Index| ar@@1 j@@0) (|Seq#Index| ar@@1 k))
))) (= (count_square Heap@@7 i@@2 lo@@0 hi@@1 step@@0 vmin@@0 vmax@@0 ar@@1 v_2@@0) (ite (< i@@2 vmax@@0) (+ (ite  (and (<= lo@@0 (mod i@@2 step@@0)) (and (< (mod i@@2 step@@0) hi@@1) (= (U_2_int (MapType0Select Heap@@7 (|Seq#Index| ar@@1 i@@2) Ref__Integer_value)) v_2@@0))) 1 0) (|count_square'| Heap@@7 (+ i@@2 1) lo@@0 hi@@1 step@@0 vmin@@0 vmax@@0 ar@@1 v_2@@0)) 0))))
 :qid |stdinbpl.1360:15|
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
 :qid |stdinbpl.466:18|
 :skolemid |45|
 :pattern ( (|Seq#Drop| s@@4 n@@3))
)))
(assert (forall ((i@@3 Int) (j@@1 Int) ) (! (= (|Seq#Sub| i@@3 j@@1) (- i@@3 j@@1))
 :qid |stdinbpl.320:15|
 :skolemid |30|
 :pattern ( (|Seq#Sub| i@@3 j@@1))
)))
(assert (forall ((i@@4 Int) (j@@2 Int) ) (! (= (|Seq#Add| i@@4 j@@2) (+ i@@4 j@@2))
 :qid |stdinbpl.318:15|
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
 :qid |stdinbpl.607:18|
 :skolemid |54|
 :pattern ( (|Seq#Contains| (|Seq#Singleton| x@@9) y@@1))
)))
(assert (forall ((Heap@@9 T@U) (i@@5 Int) (lo@@1 Int) (hi@@2 Int) (step@@1 Int) (vmin@@1 Int) (vmax@@1 Int) (ar@@2 T@U) (v_2@@1 Int) ) (!  (=> (and (= (type Heap@@9) (MapType0Type RefType)) (= (type ar@@2) (SeqType RefType))) (and (= (count_square Heap@@9 i@@5 lo@@1 hi@@2 step@@1 vmin@@1 vmax@@1 ar@@2 v_2@@1) (|count_square'| Heap@@9 i@@5 lo@@1 hi@@2 step@@1 vmin@@1 vmax@@1 ar@@2 v_2@@1)) (dummyFunction (int_2_U (|count_square#triggerStateless| i@@5 lo@@1 hi@@2 step@@1 vmin@@1 vmax@@1 ar@@2 v_2@@1)))))
 :qid |stdinbpl.1350:15|
 :skolemid |116|
 :pattern ( (count_square Heap@@9 i@@5 lo@@1 hi@@2 step@@1 vmin@@1 vmax@@1 ar@@2 v_2@@1))
)))
(assert (forall ((s@@5 T@U) (n@@4 Int) (j@@3 Int) ) (! (let ((T@@11 (SeqTypeInv0 (type s@@5))))
 (=> (= (type s@@5) (SeqType T@@11)) (=> (and (and (<= 0 j@@3) (< j@@3 n@@4)) (< j@@3 (|Seq#Length| s@@5))) (= (|Seq#Index| (|Seq#Take| s@@5 n@@4) j@@3) (|Seq#Index| s@@5 j@@3)))))
 :qid |stdinbpl.359:18|
 :skolemid |37|
 :pattern ( (|Seq#Index| (|Seq#Take| s@@5 n@@4) j@@3))
 :pattern ( (|Seq#Index| s@@5 j@@3) (|Seq#Take| s@@5 n@@4))
)))
(assert (forall ((Heap@@10 T@U) (i@@6 Int) (lo@@2 Int) (hi@@3 Int) (step@@2 Int) (vmin@@2 Int) (vmax@@2 Int) (ar@@3 T@U) (v_2@@2 Int) ) (!  (=> (and (= (type Heap@@10) (MapType0Type RefType)) (= (type ar@@3) (SeqType RefType))) (dummyFunction (int_2_U (|count_square#triggerStateless| i@@6 lo@@2 hi@@3 step@@2 vmin@@2 vmax@@2 ar@@3 v_2@@2))))
 :qid |stdinbpl.1354:15|
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
 :qid |stdinbpl.263:19|
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
 :qid |stdinbpl.331:18|
 :skolemid |32|
 :pattern ( (|Seq#Index| (|Seq#Append| s0 s1) n@@5))
)))
(assert (forall ((Heap@@12 T@U) (Mask@@9 T@U) (i@@7 Int) (hi@@4 Int) (ar@@4 T@U) (v_2@@3 Int) ) (!  (=> (and (and (and (and (= (type Heap@@12) (MapType0Type RefType)) (= (type Mask@@9) (MapType1Type RefType realType))) (= (type ar@@4) (SeqType RefType))) (and (state Heap@@12 Mask@@9) (< AssumeFunctionsAbove 1))) (and (and (and (<= 0 i@@7) (<= i@@7 hi@@4)) (<= hi@@4 (|Seq#Length| ar@@4))) (forall ((j@@4 Int) (k@@0 Int) ) (!  (=> (and (<= 0 j@@4) (and (< j@@4 hi@@4) (and (<= 0 k@@0) (and (< k@@0 hi@@4) (not (= j@@4 k@@0)))))) (not (= (|Seq#Index| ar@@4 j@@4) (|Seq#Index| ar@@4 k@@0))))
 :qid |stdinbpl.1724:110|
 :skolemid |145|
 :pattern ( (|Seq#Index| ar@@4 j@@4) (|Seq#Index| ar@@4 k@@0))
)))) (= (count_array Heap@@12 i@@7 hi@@4 ar@@4 v_2@@3) (ite (< i@@7 hi@@4) (+ (ite (= (U_2_int (MapType0Select Heap@@12 (|Seq#Index| ar@@4 i@@7) Ref__Integer_value)) v_2@@3) 1 0) (|count_array'| Heap@@12 (+ i@@7 1) hi@@4 ar@@4 v_2@@3)) 0)))
 :qid |stdinbpl.1722:15|
 :skolemid |146|
 :pattern ( (state Heap@@12 Mask@@9) (count_array Heap@@12 i@@7 hi@@4 ar@@4 v_2@@3))
)))
(assert (forall ((Heap@@13 T@U) (Mask@@10 T@U) (i@@8 Int) (lo@@3 Int) (hi@@5 Int) (step@@3 Int) (vmin@@3 Int) (vmax@@3 Int) (ar@@5 T@U) ) (!  (=> (and (and (and (= (type Heap@@13) (MapType0Type RefType)) (= (type Mask@@10) (MapType1Type RefType realType))) (= (type ar@@5) (SeqType RefType))) (and (state Heap@@13 Mask@@10) (< AssumeFunctionsAbove 5))) (=> (and (and (and (and (<= 0 lo@@3) (and (<= lo@@3 hi@@5) (and (<= hi@@5 step@@3) (> step@@3 0)))) (and (<= 0 vmin@@3) (and (<= vmin@@3 i@@8) (<= i@@8 vmax@@3)))) (<= vmax@@3 (|Seq#Length| ar@@5))) (forall ((j@@5 Int) (k@@1 Int) ) (!  (=> (and (<= 0 j@@5) (and (< j@@5 vmax@@3) (and (<= 0 k@@1) (and (< k@@1 vmax@@3) (not (= j@@5 k@@1)))))) (not (= (|Seq#Index| ar@@5 j@@5) (|Seq#Index| ar@@5 k@@1))))
 :qid |stdinbpl.1084:189|
 :skolemid |95|
 :pattern ( (|Seq#Index| ar@@5 j@@5) (|Seq#Index| ar@@5 k@@1))
))) (= (sum_square Heap@@13 i@@8 lo@@3 hi@@5 step@@3 vmin@@3 vmax@@3 ar@@5) (ite (< i@@8 vmax@@3) (+ (ite  (and (<= lo@@3 (mod i@@8 step@@3)) (< (mod i@@8 step@@3) hi@@5)) (U_2_int (MapType0Select Heap@@13 (|Seq#Index| ar@@5 i@@8) Ref__Integer_value)) 0) (|sum_square'| Heap@@13 (+ i@@8 1) lo@@3 hi@@5 step@@3 vmin@@3 vmax@@3 ar@@5)) 0))))
 :qid |stdinbpl.1082:15|
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
 :qid |stdinbpl.758:15|
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
 :qid |stdinbpl.649:15|
 :skolemid |59|
 :pattern ( (|Ref__multidim_index_2'| Heap@@16 N0@@2 N1@@2 i0@@2 i1@@2))
)))
(assert (forall ((Heap@@17 T@U) (i@@10 Int) (lo@@4 Int) (hi@@7 Int) (ar@@7 T@U) ) (!  (=> (and (= (type Heap@@17) (MapType0Type RefType)) (= (type ar@@7) (SeqType RefType))) (dummyFunction (int_2_U (|sum_array#triggerStateless| i@@10 lo@@4 hi@@7 ar@@7))))
 :qid |stdinbpl.829:15|
 :skolemid |71|
 :pattern ( (|sum_array'| Heap@@17 i@@10 lo@@4 hi@@7 ar@@7))
)))
(assert (forall ((Heap@@18 T@U) (i@@11 Int) (hi@@8 Int) (ar@@8 T@U) (v_2@@4 Int) ) (!  (=> (and (= (type Heap@@18) (MapType0Type RefType)) (= (type ar@@8) (SeqType intType))) (dummyFunction (int_2_U (|count_list#triggerStateless| i@@11 hi@@8 ar@@8 v_2@@4))))
 :qid |stdinbpl.1632:15|
 :skolemid |140|
 :pattern ( (|count_list'| Heap@@18 i@@11 hi@@8 ar@@8 v_2@@4))
)))
(assert (forall ((Heap@@19 T@U) (i@@12 Int) (hi@@9 Int) (ar@@9 T@U) (v_2@@5 Int) ) (!  (=> (and (= (type Heap@@19) (MapType0Type RefType)) (= (type ar@@9) (SeqType RefType))) (dummyFunction (int_2_U (|count_array#triggerStateless| i@@12 hi@@9 ar@@9 v_2@@5))))
 :qid |stdinbpl.1716:15|
 :skolemid |144|
 :pattern ( (|count_array'| Heap@@19 i@@12 hi@@9 ar@@9 v_2@@5))
)))
(assert (forall ((arg0@@35 Real) (arg1@@15 T@U) ) (! (= (type (ConditionalFrame arg0@@35 arg1@@15)) FrameTypeType)
 :qid |funType:ConditionalFrame|
 :pattern ( (ConditionalFrame arg0@@35 arg1@@15))
)))
(assert (forall ((p@@0 Real) (f_6 T@U) ) (!  (=> (= (type f_6) FrameTypeType) (= (ConditionalFrame p@@0 f_6) (ite (> p@@0 0.0) f_6 EmptyFrame)))
 :qid |stdinbpl.251:15|
 :skolemid |19|
 :pattern ( (ConditionalFrame p@@0 f_6))
)))
(assert (forall ((q@min@@0 Int) (q@max@@0 Int) (j@@6 Int) ) (!  (=> (and (<= 0 j@@6) (< j@@6 (- q@max@@0 q@min@@0))) (= (U_2_int (|Seq#Index| (|Seq#Range| q@min@@0 q@max@@0) j@@6)) (+ q@min@@0 j@@6)))
 :qid |stdinbpl.622:15|
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
 :qid |stdinbpl.300:18|
 :skolemid |26|
 :pattern ( (|Seq#Length| (|Seq#Append| s0@@0 s1@@0)))
)))
(assert (forall ((Heap@@20 T@U) (Mask@@14 T@U) (i@@13 Int) (hi@@10 Int) (ar@@10 T@U) (v_2@@6 Int) ) (!  (=> (and (and (and (and (= (type Heap@@20) (MapType0Type RefType)) (= (type Mask@@14) (MapType1Type RefType realType))) (= (type ar@@10) (SeqType intType))) (and (state Heap@@20 Mask@@14) (< AssumeFunctionsAbove 6))) (and (and (<= 0 i@@13) (<= i@@13 hi@@10)) (<= hi@@10 (|Seq#Length| ar@@10)))) (= (count_list Heap@@20 i@@13 hi@@10 ar@@10 v_2@@6) (ite (< i@@13 hi@@10) (+ (ite (= (U_2_int (|Seq#Index| ar@@10 i@@13)) v_2@@6) 1 0) (|count_list'| Heap@@20 (+ i@@13 1) hi@@10 ar@@10 v_2@@6)) 0)))
 :qid |stdinbpl.1638:15|
 :skolemid |141|
 :pattern ( (state Heap@@20 Mask@@14) (count_list Heap@@20 i@@13 hi@@10 ar@@10 v_2@@6))
)))
(assert (forall ((s@@6 T@U) (t T@U) (n@@6 Int) ) (! (let ((T@@17 (SeqTypeInv0 (type s@@6))))
 (=> (and (and (= (type s@@6) (SeqType T@@17)) (= (type t) (SeqType T@@17))) (and (> n@@6 0) (> n@@6 (|Seq#Length| s@@6)))) (and (= (|Seq#Add| (|Seq#Sub| n@@6 (|Seq#Length| s@@6)) (|Seq#Length| s@@6)) n@@6) (= (|Seq#Drop| (|Seq#Append| s@@6 t) n@@6) (|Seq#Drop| t (|Seq#Sub| n@@6 (|Seq#Length| s@@6)))))))
 :qid |stdinbpl.456:18|
 :skolemid |44|
 :pattern ( (|Seq#Drop| (|Seq#Append| s@@6 t) n@@6))
)))
(assert (forall ((Heap@@21 T@U) (N0@@3 Int) (N1@@3 Int) (i0@@3 Int) (i1@@3 Int) ) (!  (=> (= (type Heap@@21) (MapType0Type RefType)) (and (= (Ref__multidim_index_2 Heap@@21 N0@@3 N1@@3 i0@@3 i1@@3) (|Ref__multidim_index_2'| Heap@@21 N0@@3 N1@@3 i0@@3 i1@@3)) (dummyFunction (int_2_U (|Ref__multidim_index_2#triggerStateless| N0@@3 N1@@3 i0@@3 i1@@3)))))
 :qid |stdinbpl.645:15|
 :skolemid |58|
 :pattern ( (Ref__multidim_index_2 Heap@@21 N0@@3 N1@@3 i0@@3 i1@@3))
)))
(assert (forall ((Heap@@22 T@U) (i@@14 Int) (lo@@5 Int) (hi@@11 Int) (ar@@11 T@U) ) (!  (=> (and (= (type Heap@@22) (MapType0Type RefType)) (= (type ar@@11) (SeqType RefType))) (and (= (sum_array Heap@@22 i@@14 lo@@5 hi@@11 ar@@11) (|sum_array'| Heap@@22 i@@14 lo@@5 hi@@11 ar@@11)) (dummyFunction (int_2_U (|sum_array#triggerStateless| i@@14 lo@@5 hi@@11 ar@@11)))))
 :qid |stdinbpl.825:15|
 :skolemid |70|
 :pattern ( (sum_array Heap@@22 i@@14 lo@@5 hi@@11 ar@@11))
)))
(assert (forall ((Heap@@23 T@U) (i@@15 Int) (hi@@12 Int) (ar@@12 T@U) (v_2@@7 Int) ) (!  (=> (and (= (type Heap@@23) (MapType0Type RefType)) (= (type ar@@12) (SeqType intType))) (and (= (count_list Heap@@23 i@@15 hi@@12 ar@@12 v_2@@7) (|count_list'| Heap@@23 i@@15 hi@@12 ar@@12 v_2@@7)) (dummyFunction (int_2_U (|count_list#triggerStateless| i@@15 hi@@12 ar@@12 v_2@@7)))))
 :qid |stdinbpl.1628:15|
 :skolemid |139|
 :pattern ( (count_list Heap@@23 i@@15 hi@@12 ar@@12 v_2@@7))
)))
(assert (forall ((Heap@@24 T@U) (i@@16 Int) (hi@@13 Int) (ar@@13 T@U) (v_2@@8 Int) ) (!  (=> (and (= (type Heap@@24) (MapType0Type RefType)) (= (type ar@@13) (SeqType RefType))) (and (= (count_array Heap@@24 i@@16 hi@@13 ar@@13 v_2@@8) (|count_array'| Heap@@24 i@@16 hi@@13 ar@@13 v_2@@8)) (dummyFunction (int_2_U (|count_array#triggerStateless| i@@16 hi@@13 ar@@13 v_2@@8)))))
 :qid |stdinbpl.1712:15|
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
 :qid |stdinbpl.837:124|
 :skolemid |72|
 :pattern ( (|Seq#Index| ar@@14 j@@7) (|Seq#Index| ar@@14 k@@2))
)))) (= (sum_array Heap@@25 i@@17 lo@@6 hi@@14 ar@@14) (ite (< i@@17 hi@@14) (+ (U_2_int (MapType0Select Heap@@25 (|Seq#Index| ar@@14 i@@17) Ref__Integer_value)) (|sum_array'| Heap@@25 (+ i@@17 1) lo@@6 hi@@14 ar@@14)) 0)))
 :qid |stdinbpl.835:15|
 :skolemid |73|
 :pattern ( (state Heap@@25 Mask@@15) (sum_array Heap@@25 i@@17 lo@@6 hi@@14 ar@@14))
)))
(assert (forall ((Heap@@26 T@U) (i@@18 Int) (lo@@7 Int) (hi@@15 Int) (step@@4 Int) (vmin@@4 Int) (vmax@@4 Int) (ar@@15 T@U) ) (!  (=> (and (= (type Heap@@26) (MapType0Type RefType)) (= (type ar@@15) (SeqType RefType))) (and (= (sum_square Heap@@26 i@@18 lo@@7 hi@@15 step@@4 vmin@@4 vmax@@4 ar@@15) (|sum_square'| Heap@@26 i@@18 lo@@7 hi@@15 step@@4 vmin@@4 vmax@@4 ar@@15)) (dummyFunction (int_2_U (|sum_square#triggerStateless| i@@18 lo@@7 hi@@15 step@@4 vmin@@4 vmax@@4 ar@@15)))))
 :qid |stdinbpl.1072:15|
 :skolemid |93|
 :pattern ( (sum_square Heap@@26 i@@18 lo@@7 hi@@15 step@@4 vmin@@4 vmax@@4 ar@@15))
)))
(assert (forall ((Heap@@27 T@U) (Mask@@16 T@U) (N0@@4 Int) (N1@@4 Int) (i0@@4 Int) (i1@@4 Int) ) (!  (=> (and (and (= (type Heap@@27) (MapType0Type RefType)) (= (type Mask@@16) (MapType1Type RefType realType))) (state Heap@@27 Mask@@16)) (= (|Ref__multidim_index_2'| Heap@@27 N0@@4 N1@@4 i0@@4 i1@@4) (|Ref__multidim_index_2#frame| EmptyFrame N0@@4 N1@@4 i0@@4 i1@@4)))
 :qid |stdinbpl.656:15|
 :skolemid |60|
 :pattern ( (state Heap@@27 Mask@@16) (|Ref__multidim_index_2'| Heap@@27 N0@@4 N1@@4 i0@@4 i1@@4))
)))
(assert (forall ((Heap@@28 T@U) (Mask@@17 T@U) (i@@19 Int) (hi@@16 Int) (ar@@16 T@U) (v_2@@9 Int) ) (!  (=> (and (and (and (= (type Heap@@28) (MapType0Type RefType)) (= (type Mask@@17) (MapType1Type RefType realType))) (= (type ar@@16) (SeqType intType))) (state Heap@@28 Mask@@17)) (= (|count_list'| Heap@@28 i@@19 hi@@16 ar@@16 v_2@@9) (|count_list#frame| EmptyFrame i@@19 hi@@16 ar@@16 v_2@@9)))
 :qid |stdinbpl.1645:15|
 :skolemid |142|
 :pattern ( (state Heap@@28 Mask@@17) (|count_list'| Heap@@28 i@@19 hi@@16 ar@@16 v_2@@9))
)))
(assert (forall ((s@@7 T@U) (t@@0 T@U) (n@@7 Int) ) (! (let ((T@@18 (SeqTypeInv0 (type s@@7))))
 (=> (and (and (= (type s@@7) (SeqType T@@18)) (= (type t@@0) (SeqType T@@18))) (and (> n@@7 0) (> n@@7 (|Seq#Length| s@@7)))) (and (= (|Seq#Add| (|Seq#Sub| n@@7 (|Seq#Length| s@@7)) (|Seq#Length| s@@7)) n@@7) (= (|Seq#Take| (|Seq#Append| s@@7 t@@0) n@@7) (|Seq#Append| s@@7 (|Seq#Take| t@@0 (|Seq#Sub| n@@7 (|Seq#Length| s@@7))))))))
 :qid |stdinbpl.443:18|
 :skolemid |42|
 :pattern ( (|Seq#Take| (|Seq#Append| s@@7 t@@0) n@@7))
)))
(assert (forall ((q@min@@1 Int) (q@max@@1 Int) ) (!  (and (=> (< q@min@@1 q@max@@1) (= (|Seq#Length| (|Seq#Range| q@min@@1 q@max@@1)) (- q@max@@1 q@min@@1))) (=> (<= q@max@@1 q@min@@1) (= (|Seq#Length| (|Seq#Range| q@min@@1 q@max@@1)) 0)))
 :qid |stdinbpl.621:15|
 :skolemid |55|
 :pattern ( (|Seq#Length| (|Seq#Range| q@min@@1 q@max@@1)))
)))
(assert (forall ((Heap2Heap T@U) (Heap1Heap T@U) (i@@20 Int) (lo@@8 Int) (hi@@17 Int) (step@@5 Int) (vmin@@5 Int) (vmax@@5 Int) (ar@@17 T@U) ) (!  (=> (and (and (and (= (type Heap2Heap) (MapType0Type RefType)) (= (type Heap1Heap) (MapType0Type RefType))) (= (type ar@@17) (SeqType RefType))) (and (=  (and (<= vmin@@5 (|sk_sum_square#condqp2| (|sum_square#condqp2| Heap2Heap i@@20 lo@@8 hi@@17 step@@5 vmin@@5 vmax@@5 ar@@17) (|sum_square#condqp2| Heap1Heap i@@20 lo@@8 hi@@17 step@@5 vmin@@5 vmax@@5 ar@@17))) (and (< (|sk_sum_square#condqp2| (|sum_square#condqp2| Heap2Heap i@@20 lo@@8 hi@@17 step@@5 vmin@@5 vmax@@5 ar@@17) (|sum_square#condqp2| Heap1Heap i@@20 lo@@8 hi@@17 step@@5 vmin@@5 vmax@@5 ar@@17)) vmax@@5) (and (<= lo@@8 (mod (|sk_sum_square#condqp2| (|sum_square#condqp2| Heap2Heap i@@20 lo@@8 hi@@17 step@@5 vmin@@5 vmax@@5 ar@@17) (|sum_square#condqp2| Heap1Heap i@@20 lo@@8 hi@@17 step@@5 vmin@@5 vmax@@5 ar@@17)) step@@5)) (< (mod (|sk_sum_square#condqp2| (|sum_square#condqp2| Heap2Heap i@@20 lo@@8 hi@@17 step@@5 vmin@@5 vmax@@5 ar@@17) (|sum_square#condqp2| Heap1Heap i@@20 lo@@8 hi@@17 step@@5 vmin@@5 vmax@@5 ar@@17)) step@@5) hi@@17))))  (and (<= vmin@@5 (|sk_sum_square#condqp2| (|sum_square#condqp2| Heap2Heap i@@20 lo@@8 hi@@17 step@@5 vmin@@5 vmax@@5 ar@@17) (|sum_square#condqp2| Heap1Heap i@@20 lo@@8 hi@@17 step@@5 vmin@@5 vmax@@5 ar@@17))) (and (< (|sk_sum_square#condqp2| (|sum_square#condqp2| Heap2Heap i@@20 lo@@8 hi@@17 step@@5 vmin@@5 vmax@@5 ar@@17) (|sum_square#condqp2| Heap1Heap i@@20 lo@@8 hi@@17 step@@5 vmin@@5 vmax@@5 ar@@17)) vmax@@5) (and (<= lo@@8 (mod (|sk_sum_square#condqp2| (|sum_square#condqp2| Heap2Heap i@@20 lo@@8 hi@@17 step@@5 vmin@@5 vmax@@5 ar@@17) (|sum_square#condqp2| Heap1Heap i@@20 lo@@8 hi@@17 step@@5 vmin@@5 vmax@@5 ar@@17)) step@@5)) (< (mod (|sk_sum_square#condqp2| (|sum_square#condqp2| Heap2Heap i@@20 lo@@8 hi@@17 step@@5 vmin@@5 vmax@@5 ar@@17) (|sum_square#condqp2| Heap1Heap i@@20 lo@@8 hi@@17 step@@5 vmin@@5 vmax@@5 ar@@17)) step@@5) hi@@17))))) (=> (and (<= vmin@@5 (|sk_sum_square#condqp2| (|sum_square#condqp2| Heap2Heap i@@20 lo@@8 hi@@17 step@@5 vmin@@5 vmax@@5 ar@@17) (|sum_square#condqp2| Heap1Heap i@@20 lo@@8 hi@@17 step@@5 vmin@@5 vmax@@5 ar@@17))) (and (< (|sk_sum_square#condqp2| (|sum_square#condqp2| Heap2Heap i@@20 lo@@8 hi@@17 step@@5 vmin@@5 vmax@@5 ar@@17) (|sum_square#condqp2| Heap1Heap i@@20 lo@@8 hi@@17 step@@5 vmin@@5 vmax@@5 ar@@17)) vmax@@5) (and (<= lo@@8 (mod (|sk_sum_square#condqp2| (|sum_square#condqp2| Heap2Heap i@@20 lo@@8 hi@@17 step@@5 vmin@@5 vmax@@5 ar@@17) (|sum_square#condqp2| Heap1Heap i@@20 lo@@8 hi@@17 step@@5 vmin@@5 vmax@@5 ar@@17)) step@@5)) (< (mod (|sk_sum_square#condqp2| (|sum_square#condqp2| Heap2Heap i@@20 lo@@8 hi@@17 step@@5 vmin@@5 vmax@@5 ar@@17) (|sum_square#condqp2| Heap1Heap i@@20 lo@@8 hi@@17 step@@5 vmin@@5 vmax@@5 ar@@17)) step@@5) hi@@17)))) (= (U_2_int (MapType0Select Heap2Heap (|Seq#Index| ar@@17 (|sk_sum_square#condqp2| (|sum_square#condqp2| Heap2Heap i@@20 lo@@8 hi@@17 step@@5 vmin@@5 vmax@@5 ar@@17) (|sum_square#condqp2| Heap1Heap i@@20 lo@@8 hi@@17 step@@5 vmin@@5 vmax@@5 ar@@17))) Ref__Integer_value)) (U_2_int (MapType0Select Heap1Heap (|Seq#Index| ar@@17 (|sk_sum_square#condqp2| (|sum_square#condqp2| Heap2Heap i@@20 lo@@8 hi@@17 step@@5 vmin@@5 vmax@@5 ar@@17) (|sum_square#condqp2| Heap1Heap i@@20 lo@@8 hi@@17 step@@5 vmin@@5 vmax@@5 ar@@17))) Ref__Integer_value)))))) (= (|sum_square#condqp2| Heap2Heap i@@20 lo@@8 hi@@17 step@@5 vmin@@5 vmax@@5 ar@@17) (|sum_square#condqp2| Heap1Heap i@@20 lo@@8 hi@@17 step@@5 vmin@@5 vmax@@5 ar@@17)))
 :qid |stdinbpl.1102:15|
 :skolemid |98|
 :pattern ( (|sum_square#condqp2| Heap2Heap i@@20 lo@@8 hi@@17 step@@5 vmin@@5 vmax@@5 ar@@17) (|sum_square#condqp2| Heap1Heap i@@20 lo@@8 hi@@17 step@@5 vmin@@5 vmax@@5 ar@@17) (succHeapTrans Heap2Heap Heap1Heap))
)))
(assert (forall ((Heap2Heap@@0 T@U) (Heap1Heap@@0 T@U) (i@@21 Int) (lo@@9 Int) (hi@@18 Int) (step@@6 Int) (vmin@@6 Int) (vmax@@6 Int) (ar@@18 T@U) (v_2@@10 Int) ) (!  (=> (and (and (and (= (type Heap2Heap@@0) (MapType0Type RefType)) (= (type Heap1Heap@@0) (MapType0Type RefType))) (= (type ar@@18) (SeqType RefType))) (and (=  (and (<= vmin@@6 (|sk_count_square#condqp3| (|count_square#condqp3| Heap2Heap@@0 i@@21 lo@@9 hi@@18 step@@6 vmin@@6 vmax@@6 ar@@18 v_2@@10) (|count_square#condqp3| Heap1Heap@@0 i@@21 lo@@9 hi@@18 step@@6 vmin@@6 vmax@@6 ar@@18 v_2@@10))) (and (< (|sk_count_square#condqp3| (|count_square#condqp3| Heap2Heap@@0 i@@21 lo@@9 hi@@18 step@@6 vmin@@6 vmax@@6 ar@@18 v_2@@10) (|count_square#condqp3| Heap1Heap@@0 i@@21 lo@@9 hi@@18 step@@6 vmin@@6 vmax@@6 ar@@18 v_2@@10)) vmax@@6) (and (<= lo@@9 (mod (|sk_count_square#condqp3| (|count_square#condqp3| Heap2Heap@@0 i@@21 lo@@9 hi@@18 step@@6 vmin@@6 vmax@@6 ar@@18 v_2@@10) (|count_square#condqp3| Heap1Heap@@0 i@@21 lo@@9 hi@@18 step@@6 vmin@@6 vmax@@6 ar@@18 v_2@@10)) step@@6)) (< (mod (|sk_count_square#condqp3| (|count_square#condqp3| Heap2Heap@@0 i@@21 lo@@9 hi@@18 step@@6 vmin@@6 vmax@@6 ar@@18 v_2@@10) (|count_square#condqp3| Heap1Heap@@0 i@@21 lo@@9 hi@@18 step@@6 vmin@@6 vmax@@6 ar@@18 v_2@@10)) step@@6) hi@@18))))  (and (<= vmin@@6 (|sk_count_square#condqp3| (|count_square#condqp3| Heap2Heap@@0 i@@21 lo@@9 hi@@18 step@@6 vmin@@6 vmax@@6 ar@@18 v_2@@10) (|count_square#condqp3| Heap1Heap@@0 i@@21 lo@@9 hi@@18 step@@6 vmin@@6 vmax@@6 ar@@18 v_2@@10))) (and (< (|sk_count_square#condqp3| (|count_square#condqp3| Heap2Heap@@0 i@@21 lo@@9 hi@@18 step@@6 vmin@@6 vmax@@6 ar@@18 v_2@@10) (|count_square#condqp3| Heap1Heap@@0 i@@21 lo@@9 hi@@18 step@@6 vmin@@6 vmax@@6 ar@@18 v_2@@10)) vmax@@6) (and (<= lo@@9 (mod (|sk_count_square#condqp3| (|count_square#condqp3| Heap2Heap@@0 i@@21 lo@@9 hi@@18 step@@6 vmin@@6 vmax@@6 ar@@18 v_2@@10) (|count_square#condqp3| Heap1Heap@@0 i@@21 lo@@9 hi@@18 step@@6 vmin@@6 vmax@@6 ar@@18 v_2@@10)) step@@6)) (< (mod (|sk_count_square#condqp3| (|count_square#condqp3| Heap2Heap@@0 i@@21 lo@@9 hi@@18 step@@6 vmin@@6 vmax@@6 ar@@18 v_2@@10) (|count_square#condqp3| Heap1Heap@@0 i@@21 lo@@9 hi@@18 step@@6 vmin@@6 vmax@@6 ar@@18 v_2@@10)) step@@6) hi@@18))))) (=> (and (<= vmin@@6 (|sk_count_square#condqp3| (|count_square#condqp3| Heap2Heap@@0 i@@21 lo@@9 hi@@18 step@@6 vmin@@6 vmax@@6 ar@@18 v_2@@10) (|count_square#condqp3| Heap1Heap@@0 i@@21 lo@@9 hi@@18 step@@6 vmin@@6 vmax@@6 ar@@18 v_2@@10))) (and (< (|sk_count_square#condqp3| (|count_square#condqp3| Heap2Heap@@0 i@@21 lo@@9 hi@@18 step@@6 vmin@@6 vmax@@6 ar@@18 v_2@@10) (|count_square#condqp3| Heap1Heap@@0 i@@21 lo@@9 hi@@18 step@@6 vmin@@6 vmax@@6 ar@@18 v_2@@10)) vmax@@6) (and (<= lo@@9 (mod (|sk_count_square#condqp3| (|count_square#condqp3| Heap2Heap@@0 i@@21 lo@@9 hi@@18 step@@6 vmin@@6 vmax@@6 ar@@18 v_2@@10) (|count_square#condqp3| Heap1Heap@@0 i@@21 lo@@9 hi@@18 step@@6 vmin@@6 vmax@@6 ar@@18 v_2@@10)) step@@6)) (< (mod (|sk_count_square#condqp3| (|count_square#condqp3| Heap2Heap@@0 i@@21 lo@@9 hi@@18 step@@6 vmin@@6 vmax@@6 ar@@18 v_2@@10) (|count_square#condqp3| Heap1Heap@@0 i@@21 lo@@9 hi@@18 step@@6 vmin@@6 vmax@@6 ar@@18 v_2@@10)) step@@6) hi@@18)))) (= (U_2_int (MapType0Select Heap2Heap@@0 (|Seq#Index| ar@@18 (|sk_count_square#condqp3| (|count_square#condqp3| Heap2Heap@@0 i@@21 lo@@9 hi@@18 step@@6 vmin@@6 vmax@@6 ar@@18 v_2@@10) (|count_square#condqp3| Heap1Heap@@0 i@@21 lo@@9 hi@@18 step@@6 vmin@@6 vmax@@6 ar@@18 v_2@@10))) Ref__Integer_value)) (U_2_int (MapType0Select Heap1Heap@@0 (|Seq#Index| ar@@18 (|sk_count_square#condqp3| (|count_square#condqp3| Heap2Heap@@0 i@@21 lo@@9 hi@@18 step@@6 vmin@@6 vmax@@6 ar@@18 v_2@@10) (|count_square#condqp3| Heap1Heap@@0 i@@21 lo@@9 hi@@18 step@@6 vmin@@6 vmax@@6 ar@@18 v_2@@10))) Ref__Integer_value)))))) (= (|count_square#condqp3| Heap2Heap@@0 i@@21 lo@@9 hi@@18 step@@6 vmin@@6 vmax@@6 ar@@18 v_2@@10) (|count_square#condqp3| Heap1Heap@@0 i@@21 lo@@9 hi@@18 step@@6 vmin@@6 vmax@@6 ar@@18 v_2@@10)))
 :qid |stdinbpl.1380:15|
 :skolemid |121|
 :pattern ( (|count_square#condqp3| Heap2Heap@@0 i@@21 lo@@9 hi@@18 step@@6 vmin@@6 vmax@@6 ar@@18 v_2@@10) (|count_square#condqp3| Heap1Heap@@0 i@@21 lo@@9 hi@@18 step@@6 vmin@@6 vmax@@6 ar@@18 v_2@@10) (succHeapTrans Heap2Heap@@0 Heap1Heap@@0))
)))
(assert (forall ((a T@U) (b T@U) ) (! (let ((T@@19 (SeqTypeInv0 (type a))))
 (=> (and (and (= (type a) (SeqType T@@19)) (= (type b) (SeqType T@@19))) (|Seq#Equal| a b)) (= a b)))
 :qid |stdinbpl.594:18|
 :skolemid |53|
 :pattern ( (|Seq#Equal| a b))
)))
(assert (forall ((Heap@@29 T@U) (i@@22 Int) (hi@@19 Int) (ar@@19 T@U) ) (!  (=> (and (= (type Heap@@29) (MapType0Type RefType)) (= (type ar@@19) (SeqType intType))) (and (= (sum_list Heap@@29 i@@22 hi@@19 ar@@19) (|sum_list'| Heap@@29 i@@22 hi@@19 ar@@19)) (dummyFunction (int_2_U (|sum_list#triggerStateless| i@@22 hi@@19 ar@@19)))))
 :qid |stdinbpl.741:15|
 :skolemid |66|
 :pattern ( (sum_list Heap@@29 i@@22 hi@@19 ar@@19))
)))
(assert (forall ((Heap@@30 T@U) (Mask@@18 T@U) (N0@@5 Int) (N1@@5 Int) (i0@@5 Int) (i1@@5 Int) ) (!  (=> (and (and (= (type Heap@@30) (MapType0Type RefType)) (= (type Mask@@18) (MapType1Type RefType realType))) (and (state Heap@@30 Mask@@18) (or (< AssumeFunctionsAbove 0) (|Ref__multidim_index_2#trigger| EmptyFrame N0@@5 N1@@5 i0@@5 i1@@5)))) (=> (and (and (and (and (and (<= 0 i0@@5) (< i0@@5 N0@@5)) (<= 0 N0@@5)) (<= 0 i1@@5)) (< i1@@5 N1@@5)) (<= 0 N1@@5)) (< (|Ref__multidim_index_2'| Heap@@30 N0@@5 N1@@5 i0@@5 i1@@5) (* N0@@5 N1@@5))))
 :qid |stdinbpl.666:15|
 :skolemid |62|
 :pattern ( (state Heap@@30 Mask@@18) (|Ref__multidim_index_2'| Heap@@30 N0@@5 N1@@5 i0@@5 i1@@5))
)))
(assert (forall ((s@@8 T@U) (i@@23 Int) ) (! (let ((T@@20 (SeqTypeInv0 (type s@@8))))
 (=> (= (type s@@8) (SeqType T@@20)) (=> (and (<= 0 i@@23) (< i@@23 (|Seq#Length| s@@8))) (|Seq#ContainsTrigger| s@@8 (|Seq#Index| s@@8 i@@23)))))
 :qid |stdinbpl.487:18|
 :skolemid |49|
 :pattern ( (|Seq#Index| s@@8 i@@23))
)))
(assert (forall ((s0@@1 T@U) (s1@@1 T@U) ) (! (let ((T@@21 (SeqTypeInv0 (type s0@@1))))
 (=> (and (= (type s0@@1) (SeqType T@@21)) (= (type s1@@1) (SeqType T@@21))) (and (=> (= s0@@1 (|Seq#Empty| T@@21)) (= (|Seq#Append| s0@@1 s1@@1) s1@@1)) (=> (= s1@@1 (|Seq#Empty| T@@21)) (= (|Seq#Append| s0@@1 s1@@1) s0@@1)))))
 :qid |stdinbpl.306:18|
 :skolemid |27|
 :pattern ( (|Seq#Append| s0@@1 s1@@1))
)))
(assert (forall ((t@@1 T@U) ) (! (= (|Seq#Index| (|Seq#Singleton| t@@1) 0) t@@1)
 :qid |stdinbpl.310:18|
 :skolemid |28|
 :pattern ( (|Seq#Singleton| t@@1))
)))
(assert (forall ((s@@9 T@U) ) (! (let ((T@@22 (SeqTypeInv0 (type s@@9))))
 (=> (= (type s@@9) (SeqType T@@22)) (<= 0 (|Seq#Length| s@@9))))
 :qid |stdinbpl.289:18|
 :skolemid |22|
 :pattern ( (|Seq#Length| s@@9))
)))
(assert (forall ((s0@@2 T@U) (s1@@2 T@U) ) (! (let ((T@@23 (SeqTypeInv0 (type s0@@2))))
 (=> (and (and (= (type s0@@2) (SeqType T@@23)) (= (type s1@@2) (SeqType T@@23))) (|Seq#Equal| s0@@2 s1@@2)) (and (= (|Seq#Length| s0@@2) (|Seq#Length| s1@@2)) (forall ((j@@8 Int) ) (!  (=> (and (<= 0 j@@8) (< j@@8 (|Seq#Length| s0@@2))) (= (|Seq#Index| s0@@2 j@@8) (|Seq#Index| s1@@2 j@@8)))
 :qid |stdinbpl.584:13|
 :skolemid |50|
 :pattern ( (|Seq#Index| s0@@2 j@@8))
 :pattern ( (|Seq#Index| s1@@2 j@@8))
)))))
 :qid |stdinbpl.581:18|
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
 :qid |stdinbpl.297:18|
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
 :qid |stdinbpl.751:15|
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
 :qid |stdinbpl.439:18|
 :skolemid |41|
 :pattern ( (|Seq#Take| (|Seq#Append| s@@10 t@@3) n@@8))
)))
(assert (forall ((s@@11 T@U) (i@@25 Int) (v@@1 T@U) ) (! (let ((T@@25 (type v@@1)))
 (=> (= (type s@@11) (SeqType T@@25)) (=> (and (<= 0 i@@25) (< i@@25 (|Seq#Length| s@@11))) (= (|Seq#Length| (|Seq#Update| s@@11 i@@25 v@@1)) (|Seq#Length| s@@11)))))
 :qid |stdinbpl.338:18|
 :skolemid |34|
 :pattern ( (|Seq#Length| (|Seq#Update| s@@11 i@@25 v@@1)))
 :pattern ( (|Seq#Length| s@@11) (|Seq#Update| s@@11 i@@25 v@@1))
)))
(assert (forall ((s@@12 T@U) (t@@4 T@U) (n@@9 Int) ) (! (let ((T@@26 (SeqTypeInv0 (type s@@12))))
 (=> (and (and (= (type s@@12) (SeqType T@@26)) (= (type t@@4) (SeqType T@@26))) (and (< 0 n@@9) (<= n@@9 (|Seq#Length| s@@12)))) (= (|Seq#Drop| (|Seq#Append| s@@12 t@@4) n@@9) (|Seq#Append| (|Seq#Drop| s@@12 n@@9) t@@4))))
 :qid |stdinbpl.452:18|
 :skolemid |43|
 :pattern ( (|Seq#Drop| (|Seq#Append| s@@12 t@@4) n@@9))
)))
(assert (forall ((s@@13 T@U) (n@@10 Int) (i@@26 Int) ) (! (let ((T@@27 (SeqTypeInv0 (type s@@13))))
 (=> (= (type s@@13) (SeqType T@@27)) (=> (and (and (< 0 n@@10) (<= n@@10 i@@26)) (< i@@26 (|Seq#Length| s@@13))) (and (= (|Seq#Add| (|Seq#Sub| i@@26 n@@10) n@@10) i@@26) (= (|Seq#Index| (|Seq#Drop| s@@13 n@@10) (|Seq#Sub| i@@26 n@@10)) (|Seq#Index| s@@13 i@@26))))))
 :qid |stdinbpl.389:18|
 :skolemid |40|
 :pattern ( (|Seq#Drop| s@@13 n@@10) (|Seq#Index| s@@13 i@@26))
)))
(assert (forall ((s0@@3 T@U) (s1@@3 T@U) (n@@11 Int) ) (! (let ((T@@28 (SeqTypeInv0 (type s0@@3))))
 (=> (and (= (type s0@@3) (SeqType T@@28)) (= (type s1@@3) (SeqType T@@28))) (=> (and (and (and (not (= s0@@3 (|Seq#Empty| T@@28))) (not (= s1@@3 (|Seq#Empty| T@@28)))) (<= 0 n@@11)) (< n@@11 (|Seq#Length| s0@@3))) (= (|Seq#Index| (|Seq#Append| s0@@3 s1@@3) n@@11) (|Seq#Index| s0@@3 n@@11)))))
 :qid |stdinbpl.329:18|
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
 :qid |stdinbpl.334:18|
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
 :qid |stdinbpl.1092:15|
 :skolemid |97|
 :pattern ( (state Heap@@36 Mask@@23) (|sum_square'| Heap@@36 i@@27 lo@@10 hi@@21 step@@7 vmin@@7 vmax@@7 ar@@21))
)))
(assert (forall ((s@@14 T@U) (x@@10 T@U) (i@@28 Int) ) (! (let ((T@@30 (type x@@10)))
 (=> (= (type s@@14) (SeqType T@@30)) (=> (and (and (<= 0 i@@28) (< i@@28 (|Seq#Length| s@@14))) (= (|Seq#Index| s@@14 i@@28) x@@10)) (|Seq#Contains| s@@14 x@@10))))
 :qid |stdinbpl.485:18|
 :skolemid |48|
 :pattern ( (|Seq#Contains| s@@14 x@@10) (|Seq#Index| s@@14 i@@28))
)))
(assert (forall ((s0@@5 T@U) (s1@@5 T@U) ) (! (let ((T@@31 (SeqTypeInv0 (type s0@@5))))
 (=> (and (= (type s0@@5) (SeqType T@@31)) (= (type s1@@5) (SeqType T@@31))) (or (or (and (= s0@@5 s1@@5) (|Seq#Equal| s0@@5 s1@@5)) (and (and (not (= s0@@5 s1@@5)) (not (|Seq#Equal| s0@@5 s1@@5))) (not (= (|Seq#Length| s0@@5) (|Seq#Length| s1@@5))))) (and (and (and (and (and (and (not (= s0@@5 s1@@5)) (not (|Seq#Equal| s0@@5 s1@@5))) (= (|Seq#Length| s0@@5) (|Seq#Length| s1@@5))) (= (|Seq#SkolemDiff| s0@@5 s1@@5) (|Seq#SkolemDiff| s1@@5 s0@@5))) (<= 0 (|Seq#SkolemDiff| s0@@5 s1@@5))) (< (|Seq#SkolemDiff| s0@@5 s1@@5) (|Seq#Length| s0@@5))) (not (= (|Seq#Index| s0@@5 (|Seq#SkolemDiff| s0@@5 s1@@5)) (|Seq#Index| s1@@5 (|Seq#SkolemDiff| s0@@5 s1@@5))))))))
 :qid |stdinbpl.589:18|
 :skolemid |52|
 :pattern ( (|Seq#Equal| s0@@5 s1@@5))
)))
(assert (forall ((p@@1 T@U) (v_1@@0 T@U) (q T@U) (w@@0 T@U) (r T@U) (u T@U) ) (! (let ((C@@3 (FieldTypeInv0 (type r))))
(let ((B@@10 (FieldTypeInv0 (type q))))
(let ((A@@11 (FieldTypeInv0 (type p@@1))))
 (=> (and (and (and (and (and (and (= (type p@@1) (FieldType A@@11 FrameTypeType)) (= (type v_1@@0) FrameTypeType)) (= (type q) (FieldType B@@10 FrameTypeType))) (= (type w@@0) FrameTypeType)) (= (type r) (FieldType C@@3 FrameTypeType))) (= (type u) FrameTypeType)) (and (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))) (InsidePredicate p@@1 v_1@@0 r u)))))
 :qid |stdinbpl.258:25|
 :skolemid |20|
 :pattern ( (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))
)))
(assert (forall ((Heap@@37 T@U) (i@@29 Int) (lo@@11 Int) (hi@@22 Int) (step@@8 Int) (vmin@@8 Int) (vmax@@8 Int) (ar@@22 T@U) ) (!  (=> (and (= (type Heap@@37) (MapType0Type RefType)) (= (type ar@@22) (SeqType RefType))) (dummyFunction (int_2_U (|sum_square#triggerStateless| i@@29 lo@@11 hi@@22 step@@8 vmin@@8 vmax@@8 ar@@22))))
 :qid |stdinbpl.1076:15|
 :skolemid |94|
 :pattern ( (|sum_square'| Heap@@37 i@@29 lo@@11 hi@@22 step@@8 vmin@@8 vmax@@8 ar@@22))
)))
(assert (forall ((s@@15 T@U) ) (! (let ((T@@32 (SeqTypeInv0 (type s@@15))))
 (=> (and (= (type s@@15) (SeqType T@@32)) (= (|Seq#Length| s@@15) 0)) (= s@@15 (|Seq#Empty| T@@32))))
 :qid |stdinbpl.293:18|
 :skolemid |24|
 :pattern ( (|Seq#Length| s@@15))
)))
(assert (forall ((s@@16 T@U) (n@@12 Int) ) (! (let ((T@@33 (SeqTypeInv0 (type s@@16))))
 (=> (and (= (type s@@16) (SeqType T@@33)) (<= n@@12 0)) (= (|Seq#Take| s@@16 n@@12) (|Seq#Empty| T@@33))))
 :qid |stdinbpl.468:18|
 :skolemid |46|
 :pattern ( (|Seq#Take| s@@16 n@@12))
)))
(assert (forall ((Heap@@38 T@U) (Mask@@24 T@U) (N0@@6 Int) (N1@@6 Int) (i0@@6 Int) (i1@@6 Int) ) (!  (=> (and (and (= (type Heap@@38) (MapType0Type RefType)) (= (type Mask@@24) (MapType1Type RefType realType))) (and (state Heap@@38 Mask@@24) (or (< AssumeFunctionsAbove 0) (|Ref__multidim_index_2#trigger| EmptyFrame N0@@6 N1@@6 i0@@6 i1@@6)))) (=> (and (and (and (and (and (<= 0 i0@@6) (< i0@@6 N0@@6)) (<= 0 N0@@6)) (<= 0 i1@@6)) (< i1@@6 N1@@6)) (<= 0 N1@@6)) (<= 0 (|Ref__multidim_index_2'| Heap@@38 N0@@6 N1@@6 i0@@6 i1@@6))))
 :qid |stdinbpl.662:15|
 :skolemid |61|
 :pattern ( (state Heap@@38 Mask@@24) (|Ref__multidim_index_2'| Heap@@38 N0@@6 N1@@6 i0@@6 i1@@6))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
(assert (forall ((Heap@@39 T@U) (Mask@@25 T@U) (i@@30 Int) (lo@@12 Int) (hi@@23 Int) (ar@@23 T@U) ) (!  (=> (and (and (and (= (type Heap@@39) (MapType0Type RefType)) (= (type Mask@@25) (MapType1Type RefType realType))) (= (type ar@@23) (SeqType RefType))) (state Heap@@39 Mask@@25)) (= (|sum_array'| Heap@@39 i@@30 lo@@12 hi@@23 ar@@23) (|sum_array#frame| (FrameFragment (int_2_U (|sum_array#condqp1| Heap@@39 i@@30 lo@@12 hi@@23 ar@@23))) i@@30 lo@@12 hi@@23 ar@@23)))
 :qid |stdinbpl.845:15|
 :skolemid |74|
 :pattern ( (state Heap@@39 Mask@@25) (|sum_array'| Heap@@39 i@@30 lo@@12 hi@@23 ar@@23))
)))
(assert (forall ((Heap@@40 T@U) (Mask@@26 T@U) (i@@31 Int) (hi@@24 Int) (ar@@24 T@U) (v_2@@11 Int) ) (!  (=> (and (and (and (= (type Heap@@40) (MapType0Type RefType)) (= (type Mask@@26) (MapType1Type RefType realType))) (= (type ar@@24) (SeqType RefType))) (state Heap@@40 Mask@@26)) (= (|count_array'| Heap@@40 i@@31 hi@@24 ar@@24 v_2@@11) (|count_array#frame| (FrameFragment (int_2_U (|count_array#condqp4| Heap@@40 i@@31 hi@@24 ar@@24 v_2@@11))) i@@31 hi@@24 ar@@24 v_2@@11)))
 :qid |stdinbpl.1732:15|
 :skolemid |147|
 :pattern ( (state Heap@@40 Mask@@26) (|count_array'| Heap@@40 i@@31 hi@@24 ar@@24 v_2@@11))
)))
(assert (forall ((Heap2Heap@@1 T@U) (Heap1Heap@@1 T@U) (i@@32 Int) (hi@@25 Int) (ar@@25 T@U) (v_2@@12 Int) ) (!  (=> (and (and (and (= (type Heap2Heap@@1) (MapType0Type RefType)) (= (type Heap1Heap@@1) (MapType0Type RefType))) (= (type ar@@25) (SeqType RefType))) (and (=  (and (<= 0 (|sk_count_array#condqp4| (|count_array#condqp4| Heap2Heap@@1 i@@32 hi@@25 ar@@25 v_2@@12) (|count_array#condqp4| Heap1Heap@@1 i@@32 hi@@25 ar@@25 v_2@@12))) (< (|sk_count_array#condqp4| (|count_array#condqp4| Heap2Heap@@1 i@@32 hi@@25 ar@@25 v_2@@12) (|count_array#condqp4| Heap1Heap@@1 i@@32 hi@@25 ar@@25 v_2@@12)) hi@@25))  (and (<= 0 (|sk_count_array#condqp4| (|count_array#condqp4| Heap2Heap@@1 i@@32 hi@@25 ar@@25 v_2@@12) (|count_array#condqp4| Heap1Heap@@1 i@@32 hi@@25 ar@@25 v_2@@12))) (< (|sk_count_array#condqp4| (|count_array#condqp4| Heap2Heap@@1 i@@32 hi@@25 ar@@25 v_2@@12) (|count_array#condqp4| Heap1Heap@@1 i@@32 hi@@25 ar@@25 v_2@@12)) hi@@25))) (=> (and (<= 0 (|sk_count_array#condqp4| (|count_array#condqp4| Heap2Heap@@1 i@@32 hi@@25 ar@@25 v_2@@12) (|count_array#condqp4| Heap1Heap@@1 i@@32 hi@@25 ar@@25 v_2@@12))) (< (|sk_count_array#condqp4| (|count_array#condqp4| Heap2Heap@@1 i@@32 hi@@25 ar@@25 v_2@@12) (|count_array#condqp4| Heap1Heap@@1 i@@32 hi@@25 ar@@25 v_2@@12)) hi@@25)) (= (U_2_int (MapType0Select Heap2Heap@@1 (|Seq#Index| ar@@25 (|sk_count_array#condqp4| (|count_array#condqp4| Heap2Heap@@1 i@@32 hi@@25 ar@@25 v_2@@12) (|count_array#condqp4| Heap1Heap@@1 i@@32 hi@@25 ar@@25 v_2@@12))) Ref__Integer_value)) (U_2_int (MapType0Select Heap1Heap@@1 (|Seq#Index| ar@@25 (|sk_count_array#condqp4| (|count_array#condqp4| Heap2Heap@@1 i@@32 hi@@25 ar@@25 v_2@@12) (|count_array#condqp4| Heap1Heap@@1 i@@32 hi@@25 ar@@25 v_2@@12))) Ref__Integer_value)))))) (= (|count_array#condqp4| Heap2Heap@@1 i@@32 hi@@25 ar@@25 v_2@@12) (|count_array#condqp4| Heap1Heap@@1 i@@32 hi@@25 ar@@25 v_2@@12)))
 :qid |stdinbpl.1742:15|
 :skolemid |148|
 :pattern ( (|count_array#condqp4| Heap2Heap@@1 i@@32 hi@@25 ar@@25 v_2@@12) (|count_array#condqp4| Heap1Heap@@1 i@@32 hi@@25 ar@@25 v_2@@12) (succHeapTrans Heap2Heap@@1 Heap1Heap@@1))
)))
(assert (forall ((Heap2Heap@@2 T@U) (Heap1Heap@@2 T@U) (i@@33 Int) (lo@@13 Int) (hi@@26 Int) (ar@@26 T@U) ) (!  (=> (and (and (and (= (type Heap2Heap@@2) (MapType0Type RefType)) (= (type Heap1Heap@@2) (MapType0Type RefType))) (= (type ar@@26) (SeqType RefType))) (and (=  (and (<= lo@@13 (|sk_sum_array#condqp1| (|sum_array#condqp1| Heap2Heap@@2 i@@33 lo@@13 hi@@26 ar@@26) (|sum_array#condqp1| Heap1Heap@@2 i@@33 lo@@13 hi@@26 ar@@26))) (< (|sk_sum_array#condqp1| (|sum_array#condqp1| Heap2Heap@@2 i@@33 lo@@13 hi@@26 ar@@26) (|sum_array#condqp1| Heap1Heap@@2 i@@33 lo@@13 hi@@26 ar@@26)) hi@@26))  (and (<= lo@@13 (|sk_sum_array#condqp1| (|sum_array#condqp1| Heap2Heap@@2 i@@33 lo@@13 hi@@26 ar@@26) (|sum_array#condqp1| Heap1Heap@@2 i@@33 lo@@13 hi@@26 ar@@26))) (< (|sk_sum_array#condqp1| (|sum_array#condqp1| Heap2Heap@@2 i@@33 lo@@13 hi@@26 ar@@26) (|sum_array#condqp1| Heap1Heap@@2 i@@33 lo@@13 hi@@26 ar@@26)) hi@@26))) (=> (and (<= lo@@13 (|sk_sum_array#condqp1| (|sum_array#condqp1| Heap2Heap@@2 i@@33 lo@@13 hi@@26 ar@@26) (|sum_array#condqp1| Heap1Heap@@2 i@@33 lo@@13 hi@@26 ar@@26))) (< (|sk_sum_array#condqp1| (|sum_array#condqp1| Heap2Heap@@2 i@@33 lo@@13 hi@@26 ar@@26) (|sum_array#condqp1| Heap1Heap@@2 i@@33 lo@@13 hi@@26 ar@@26)) hi@@26)) (= (U_2_int (MapType0Select Heap2Heap@@2 (|Seq#Index| ar@@26 (|sk_sum_array#condqp1| (|sum_array#condqp1| Heap2Heap@@2 i@@33 lo@@13 hi@@26 ar@@26) (|sum_array#condqp1| Heap1Heap@@2 i@@33 lo@@13 hi@@26 ar@@26))) Ref__Integer_value)) (U_2_int (MapType0Select Heap1Heap@@2 (|Seq#Index| ar@@26 (|sk_sum_array#condqp1| (|sum_array#condqp1| Heap2Heap@@2 i@@33 lo@@13 hi@@26 ar@@26) (|sum_array#condqp1| Heap1Heap@@2 i@@33 lo@@13 hi@@26 ar@@26))) Ref__Integer_value)))))) (= (|sum_array#condqp1| Heap2Heap@@2 i@@33 lo@@13 hi@@26 ar@@26) (|sum_array#condqp1| Heap1Heap@@2 i@@33 lo@@13 hi@@26 ar@@26)))
 :qid |stdinbpl.855:15|
 :skolemid |75|
 :pattern ( (|sum_array#condqp1| Heap2Heap@@2 i@@33 lo@@13 hi@@26 ar@@26) (|sum_array#condqp1| Heap1Heap@@2 i@@33 lo@@13 hi@@26 ar@@26) (succHeapTrans Heap2Heap@@2 Heap1Heap@@2))
)))
(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun j_19 () Int)
(declare-fun N () Int)
(declare-fun i_11 () Int)
(declare-fun M () Int)
(declare-fun Heap@@41 () T@U)
(declare-fun inp () T@U)
(declare-fun QPMask@1 () T@U)
(declare-fun PostHeap@0 () T@U)
(declare-fun QPMask@9 () T@U)
(declare-fun out () T@U)
(declare-fun j_18 () Int)
(declare-fun i_10 () Int)
(declare-fun qpRange18 (T@U) Bool)
(declare-fun invRecv18 (T@U) Int)
(declare-fun QPMask@8 () T@U)
(declare-fun j1_6 () Int)
(declare-fun qpRange17 (T@U) Bool)
(declare-fun invRecv17 (T@U) Int)
(declare-fun j1_4 () Int)
(declare-fun i_6 () Int)
(declare-fun j_10 () Int)
(declare-fun ExhaleHeap@0 () T@U)
(declare-fun i_4_1 () Int)
(declare-fun j_8_1 () Int)
(declare-fun neverTriggered22 (Int) Bool)
(declare-fun QPMask@2 () T@U)
(declare-fun qpRange22 (T@U) Bool)
(declare-fun invRecv22 (T@U) Int)
(declare-fun QPMask@3 () T@U)
(declare-fun qpRange23 (T@U) Bool)
(declare-fun invRecv23 (T@U) Int)
(declare-fun QPMask@4 () T@U)
(declare-fun qpRange24 (T@U) Bool)
(declare-fun invRecv24 (T@U) Int)
(declare-fun QPMask@5 () T@U)
(declare-fun neverTriggered19 (Int) Bool)
(declare-fun qpRange19 (T@U) Bool)
(declare-fun invRecv19 (T@U) Int)
(declare-fun QPMask@6 () T@U)
(declare-fun neverTriggered20 (Int) Bool)
(declare-fun qpRange20 (T@U) Bool)
(declare-fun invRecv20 (T@U) Int)
(declare-fun QPMask@7 () T@U)
(declare-fun j_15_1 () Int)
(declare-fun k_6 () Int)
(declare-fun neverTriggered21 (Int) Bool)
(declare-fun qpRange21 (T@U) Bool)
(declare-fun invRecv21 (T@U) Int)
(declare-fun j_12_2 () Int)
(declare-fun k_4_1 () Int)
(declare-fun diz () T@U)
(declare-fun current_thread_id () Int)
(declare-fun qpRange16 (T@U) Bool)
(declare-fun invRecv16 (T@U) Int)
(declare-fun QPMask@0 () T@U)
(declare-fun j1_2 () Int)
(declare-fun j_16 () Int)
(declare-fun k_16 () Int)
(declare-fun qpRange15 (T@U) Bool)
(declare-fun invRecv15 (T@U) Int)
(declare-fun j1 () Int)
(declare-fun j_15 () Int)
(declare-fun k_15 () Int)
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (= (type out) (SeqType RefType)) (= (type inp) (SeqType RefType))) (= (type ExhaleHeap@0) (MapType0Type RefType))) (= (type Heap@@41) (MapType0Type RefType))) (= (type QPMask@2) (MapType1Type RefType realType))) (= (type QPMask@3) (MapType1Type RefType realType))) (= (type QPMask@4) (MapType1Type RefType realType))) (= (type QPMask@5) (MapType1Type RefType realType))) (= (type QPMask@6) (MapType1Type RefType realType))) (= (type QPMask@7) (MapType1Type RefType realType))) (= (type QPMask@1) (MapType1Type RefType realType))) (= (type diz) RefType)) (= (type PostHeap@0) (MapType0Type RefType))) (= (type QPMask@9) (MapType1Type RefType realType))) (= (type QPMask@8) (MapType1Type RefType realType))) (= (type QPMask@0) (MapType1Type RefType realType))))
(set-info :boogie-vc-id Ref__transpose)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 141) (let ((anon79_Then_correct  (and (=> (= (ControlFlow 0 111) (- 0 116)) (<= 0 j_19)) (=> (<= 0 j_19) (and (=> (= (ControlFlow 0 111) (- 0 115)) (< j_19 N)) (=> (< j_19 N) (and (=> (= (ControlFlow 0 111) (- 0 114)) (<= 0 N)) (=> (<= 0 N) (and (=> (= (ControlFlow 0 111) (- 0 113)) (<= 0 i_11)) (=> (<= 0 i_11) (and (=> (= (ControlFlow 0 111) (- 0 112)) (< i_11 M)) (=> (< i_11 M) (=> (= (ControlFlow 0 111) (- 0 110)) (<= 0 M))))))))))))))
(let ((anon78_Then_correct  (and (=> (= (ControlFlow 0 104) (- 0 109)) (<= 0 j_19)) (=> (<= 0 j_19) (and (=> (= (ControlFlow 0 104) (- 0 108)) (< j_19 N)) (=> (< j_19 N) (and (=> (= (ControlFlow 0 104) (- 0 107)) (<= 0 N)) (=> (<= 0 N) (and (=> (= (ControlFlow 0 104) (- 0 106)) (<= 0 i_11)) (=> (<= 0 i_11) (and (=> (= (ControlFlow 0 104) (- 0 105)) (< i_11 M)) (=> (< i_11 M) (=> (= (ControlFlow 0 104) (- 0 103)) (<= 0 M))))))))))))))
(let ((anon40_correct true))
(let ((anon79_Else_correct  (and (=> (= (ControlFlow 0 117) (- 0 120)) (>= (Ref__multidim_index_2 Heap@@41 N M j_19 i_11) 0)) (=> (>= (Ref__multidim_index_2 Heap@@41 N M j_19 i_11) 0) (and (=> (= (ControlFlow 0 117) (- 0 119)) (< (Ref__multidim_index_2 Heap@@41 N M j_19 i_11) (|Seq#Length| inp))) (=> (< (Ref__multidim_index_2 Heap@@41 N M j_19 i_11) (|Seq#Length| inp)) (and (=> (= (ControlFlow 0 117) (- 0 118)) (HasDirectPerm QPMask@1 (|Seq#Index| inp (Ref__multidim_index_2 Heap@@41 N M j_19 i_11)) Ref__Integer_value)) (=> (HasDirectPerm QPMask@1 (|Seq#Index| inp (Ref__multidim_index_2 Heap@@41 N M j_19 i_11)) Ref__Integer_value) (=> (= (ControlFlow 0 117) 101) anon40_correct)))))))))
(let ((anon78_Else_correct  (and (=> (= (ControlFlow 0 121) (- 0 124)) (>= (Ref__multidim_index_2 PostHeap@0 N M j_19 i_11) 0)) (=> (>= (Ref__multidim_index_2 PostHeap@0 N M j_19 i_11) 0) (and (=> (= (ControlFlow 0 121) (- 0 123)) (< (Ref__multidim_index_2 PostHeap@0 N M j_19 i_11) (|Seq#Length| inp))) (=> (< (Ref__multidim_index_2 PostHeap@0 N M j_19 i_11) (|Seq#Length| inp)) (and (=> (= (ControlFlow 0 121) (- 0 122)) (HasDirectPerm QPMask@9 (|Seq#Index| inp (Ref__multidim_index_2 PostHeap@0 N M j_19 i_11)) Ref__Integer_value)) (=> (HasDirectPerm QPMask@9 (|Seq#Index| inp (Ref__multidim_index_2 PostHeap@0 N M j_19 i_11)) Ref__Integer_value) (and (=> (= (ControlFlow 0 121) 111) anon79_Then_correct) (=> (= (ControlFlow 0 121) 117) anon79_Else_correct))))))))))
(let ((anon77_Then_correct  (=> (and (<= 0 i_11) (and (< i_11 M) (and (<= 0 j_19) (< j_19 N)))) (and (=> (= (ControlFlow 0 125) 104) anon78_Then_correct) (=> (= (ControlFlow 0 125) 121) anon78_Else_correct)))))
(let ((anon77_Else_correct  (=> (and (not (and (<= 0 i_11) (and (< i_11 M) (and (<= 0 j_19) (< j_19 N))))) (= (ControlFlow 0 102) 101)) anon40_correct)))
(let ((anon76_Else_correct true))
(let ((anon72_Else_correct  (=> (forall ((i_1 Int) (j_5_2 Int) ) (!  (=> (and (<= 0 i_1) (and (< i_1 M) (and (<= 0 j_5_2) (< j_5_2 N)))) (= (U_2_int (MapType0Select PostHeap@0 (|Seq#Index| out (Ref__multidim_index_2 PostHeap@0 M N i_1 j_5_2)) Ref__Integer_value)) (U_2_int (MapType0Select PostHeap@0 (|Seq#Index| inp (Ref__multidim_index_2 PostHeap@0 N M j_5_2 i_1)) Ref__Integer_value))))
 :qid |stdinbpl.3206:20|
 :skolemid |237|
 :pattern ( (|Seq#Index| out (|Ref__multidim_index_2#frame| EmptyFrame M N i_1 j_5_2)))
 :pattern ( (|Seq#Index| inp (|Ref__multidim_index_2#frame| EmptyFrame N M j_5_2 i_1)))
)) (=> (and (state PostHeap@0 QPMask@9) (state PostHeap@0 QPMask@9)) (and (and (=> (= (ControlFlow 0 126) 100) anon76_Else_correct) (=> (= (ControlFlow 0 126) 125) anon77_Then_correct)) (=> (= (ControlFlow 0 126) 102) anon77_Else_correct))))))
(let ((anon75_Then_correct  (and (=> (= (ControlFlow 0 85) (- 0 90)) (<= 0 j_18)) (=> (<= 0 j_18) (and (=> (= (ControlFlow 0 85) (- 0 89)) (< j_18 N)) (=> (< j_18 N) (and (=> (= (ControlFlow 0 85) (- 0 88)) (<= 0 N)) (=> (<= 0 N) (and (=> (= (ControlFlow 0 85) (- 0 87)) (<= 0 i_10)) (=> (<= 0 i_10) (and (=> (= (ControlFlow 0 85) (- 0 86)) (< i_10 M)) (=> (< i_10 M) (=> (= (ControlFlow 0 85) (- 0 84)) (<= 0 M))))))))))))))
(let ((anon74_Then_correct  (and (=> (= (ControlFlow 0 78) (- 0 83)) (<= 0 i_10)) (=> (<= 0 i_10) (and (=> (= (ControlFlow 0 78) (- 0 82)) (< i_10 M)) (=> (< i_10 M) (and (=> (= (ControlFlow 0 78) (- 0 81)) (<= 0 M)) (=> (<= 0 M) (and (=> (= (ControlFlow 0 78) (- 0 80)) (<= 0 j_18)) (=> (<= 0 j_18) (and (=> (= (ControlFlow 0 78) (- 0 79)) (< j_18 N)) (=> (< j_18 N) (=> (= (ControlFlow 0 78) (- 0 77)) (<= 0 N))))))))))))))
(let ((anon32_correct true))
(let ((anon75_Else_correct  (and (=> (= (ControlFlow 0 91) (- 0 94)) (>= (Ref__multidim_index_2 PostHeap@0 N M j_18 i_10) 0)) (=> (>= (Ref__multidim_index_2 PostHeap@0 N M j_18 i_10) 0) (and (=> (= (ControlFlow 0 91) (- 0 93)) (< (Ref__multidim_index_2 PostHeap@0 N M j_18 i_10) (|Seq#Length| inp))) (=> (< (Ref__multidim_index_2 PostHeap@0 N M j_18 i_10) (|Seq#Length| inp)) (and (=> (= (ControlFlow 0 91) (- 0 92)) (HasDirectPerm QPMask@9 (|Seq#Index| inp (Ref__multidim_index_2 PostHeap@0 N M j_18 i_10)) Ref__Integer_value)) (=> (HasDirectPerm QPMask@9 (|Seq#Index| inp (Ref__multidim_index_2 PostHeap@0 N M j_18 i_10)) Ref__Integer_value) (=> (= (ControlFlow 0 91) 75) anon32_correct)))))))))
(let ((anon74_Else_correct  (and (=> (= (ControlFlow 0 95) (- 0 98)) (>= (Ref__multidim_index_2 PostHeap@0 M N i_10 j_18) 0)) (=> (>= (Ref__multidim_index_2 PostHeap@0 M N i_10 j_18) 0) (and (=> (= (ControlFlow 0 95) (- 0 97)) (< (Ref__multidim_index_2 PostHeap@0 M N i_10 j_18) (|Seq#Length| out))) (=> (< (Ref__multidim_index_2 PostHeap@0 M N i_10 j_18) (|Seq#Length| out)) (and (=> (= (ControlFlow 0 95) (- 0 96)) (HasDirectPerm QPMask@9 (|Seq#Index| out (Ref__multidim_index_2 PostHeap@0 M N i_10 j_18)) Ref__Integer_value)) (=> (HasDirectPerm QPMask@9 (|Seq#Index| out (Ref__multidim_index_2 PostHeap@0 M N i_10 j_18)) Ref__Integer_value) (and (=> (= (ControlFlow 0 95) 85) anon75_Then_correct) (=> (= (ControlFlow 0 95) 91) anon75_Else_correct))))))))))
(let ((anon73_Then_correct  (=> (and (<= 0 i_10) (and (< i_10 M) (and (<= 0 j_18) (< j_18 N)))) (and (=> (= (ControlFlow 0 99) 78) anon74_Then_correct) (=> (= (ControlFlow 0 99) 95) anon74_Else_correct)))))
(let ((anon73_Else_correct  (=> (and (not (and (<= 0 i_10) (and (< i_10 M) (and (<= 0 j_18) (< j_18 N))))) (= (ControlFlow 0 76) 75)) anon32_correct)))
(let ((anon70_Else_correct  (and (=> (= (ControlFlow 0 127) (- 0 129)) (forall ((j1_7 Int) (j1_7_1 Int) ) (!  (=> (and (and (and (and (not (= j1_7 j1_7_1)) (and (<= 0 j1_7) (< j1_7 (* N M)))) (and (<= 0 j1_7_1) (< j1_7_1 (* N M)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= (|Seq#Index| inp j1_7) (|Seq#Index| inp j1_7_1))))
 :qid |stdinbpl.3109:15|
 :skolemid |230|
))) (=> (forall ((j1_7@@0 Int) (j1_7_1@@0 Int) ) (!  (=> (and (and (and (and (not (= j1_7@@0 j1_7_1@@0)) (and (<= 0 j1_7@@0) (< j1_7@@0 (* N M)))) (and (<= 0 j1_7_1@@0) (< j1_7_1@@0 (* N M)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= (|Seq#Index| inp j1_7@@0) (|Seq#Index| inp j1_7_1@@0))))
 :qid |stdinbpl.3109:15|
 :skolemid |230|
)) (=> (and (forall ((j1_7@@1 Int) ) (!  (=> (and (and (<= 0 j1_7@@1) (< j1_7@@1 (* N M))) (< NoPerm (/ (to_real 1) (to_real 2)))) (and (qpRange18 (|Seq#Index| inp j1_7@@1)) (= (invRecv18 (|Seq#Index| inp j1_7@@1)) j1_7@@1)))
 :qid |stdinbpl.3115:22|
 :skolemid |231|
 :pattern ( (|Seq#Index| inp j1_7@@1))
 :pattern ( (|Seq#Index| inp j1_7@@1))
)) (forall ((o_3 T@U) ) (!  (=> (= (type o_3) RefType) (=> (and (and (and (<= 0 (invRecv18 o_3)) (< (invRecv18 o_3) (* N M))) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange18 o_3)) (= (|Seq#Index| inp (invRecv18 o_3)) o_3)))
 :qid |stdinbpl.3119:22|
 :skolemid |232|
 :pattern ( (invRecv18 o_3))
))) (and (=> (= (ControlFlow 0 127) (- 0 128)) (forall ((j1_7@@2 Int) ) (!  (=> (and (<= 0 j1_7@@2) (< j1_7@@2 (* N M))) (>= (/ (to_real 1) (to_real 2)) NoPerm))
 :qid |stdinbpl.3125:15|
 :skolemid |233|
 :pattern ( (|Seq#Index| inp j1_7@@2))
 :pattern ( (|Seq#Index| inp j1_7@@2))
))) (=> (forall ((j1_7@@3 Int) ) (!  (=> (and (<= 0 j1_7@@3) (< j1_7@@3 (* N M))) (>= (/ (to_real 1) (to_real 2)) NoPerm))
 :qid |stdinbpl.3125:15|
 :skolemid |233|
 :pattern ( (|Seq#Index| inp j1_7@@3))
 :pattern ( (|Seq#Index| inp j1_7@@3))
)) (=> (and (forall ((j1_7@@4 Int) ) (!  (=> (and (and (<= 0 j1_7@@4) (< j1_7@@4 (* N M))) (> (/ (to_real 1) (to_real 2)) NoPerm)) (not (= (|Seq#Index| inp j1_7@@4) null)))
 :qid |stdinbpl.3131:22|
 :skolemid |234|
 :pattern ( (|Seq#Index| inp j1_7@@4))
 :pattern ( (|Seq#Index| inp j1_7@@4))
)) (forall ((o_3@@0 T@U) ) (!  (=> (= (type o_3@@0) RefType) (and (=> (and (and (and (<= 0 (invRecv18 o_3@@0)) (< (invRecv18 o_3@@0) (* N M))) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange18 o_3@@0)) (and (=> (< NoPerm (/ (to_real 1) (to_real 2))) (= (|Seq#Index| inp (invRecv18 o_3@@0)) o_3@@0)) (= (U_2_real (MapType1Select QPMask@9 o_3@@0 Ref__Integer_value)) (+ (U_2_real (MapType1Select QPMask@8 o_3@@0 Ref__Integer_value)) (/ (to_real 1) (to_real 2)))))) (=> (not (and (and (and (<= 0 (invRecv18 o_3@@0)) (< (invRecv18 o_3@@0) (* N M))) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange18 o_3@@0))) (= (U_2_real (MapType1Select QPMask@9 o_3@@0 Ref__Integer_value)) (U_2_real (MapType1Select QPMask@8 o_3@@0 Ref__Integer_value))))))
 :qid |stdinbpl.3137:22|
 :skolemid |235|
 :pattern ( (MapType1Select QPMask@9 o_3@@0 Ref__Integer_value))
))) (=> (and (and (forall ((o_3@@1 T@U) (f_5 T@U) ) (! (let ((B@@11 (FieldTypeInv1 (type f_5))))
(let ((A@@12 (FieldTypeInv0 (type f_5))))
 (=> (and (and (= (type o_3@@1) RefType) (= (type f_5) (FieldType A@@12 B@@11))) (not (= f_5 Ref__Integer_value))) (= (U_2_real (MapType1Select QPMask@8 o_3@@1 f_5)) (U_2_real (MapType1Select QPMask@9 o_3@@1 f_5))))))
 :qid |stdinbpl.3141:29|
 :skolemid |236|
 :pattern ( (MapType1Select QPMask@8 o_3@@1 f_5))
 :pattern ( (MapType1Select QPMask@9 o_3@@1 f_5))
)) (state PostHeap@0 QPMask@9)) (and (state PostHeap@0 QPMask@9) (state PostHeap@0 QPMask@9))) (and (and (=> (= (ControlFlow 0 127) 126) anon72_Else_correct) (=> (= (ControlFlow 0 127) 99) anon73_Then_correct)) (=> (= (ControlFlow 0 127) 76) anon73_Else_correct)))))))))))
(let ((anon24_correct true))
(let ((anon71_Else_correct  (=> (and (not (and (<= 0 j1_6) (< j1_6 (* N M)))) (= (ControlFlow 0 74) 70)) anon24_correct)))
(let ((anon71_Then_correct  (=> (and (<= 0 j1_6) (< j1_6 (* N M))) (and (=> (= (ControlFlow 0 71) (- 0 73)) (>= j1_6 0)) (=> (>= j1_6 0) (and (=> (= (ControlFlow 0 71) (- 0 72)) (< j1_6 (|Seq#Length| inp))) (=> (< j1_6 (|Seq#Length| inp)) (=> (= (ControlFlow 0 71) 70) anon24_correct))))))))
(let ((anon68_Else_correct  (and (=> (= (ControlFlow 0 130) (- 0 131)) (forall ((j1_5 Int) (j1_5_1 Int) ) (!  (=> (and (and (and (and (not (= j1_5 j1_5_1)) (and (<= 0 j1_5) (< j1_5 (* M N)))) (and (<= 0 j1_5_1) (< j1_5_1 (* M N)))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| out j1_5) (|Seq#Index| out j1_5_1))))
 :qid |stdinbpl.3063:15|
 :skolemid |224|
))) (=> (forall ((j1_5@@0 Int) (j1_5_1@@0 Int) ) (!  (=> (and (and (and (and (not (= j1_5@@0 j1_5_1@@0)) (and (<= 0 j1_5@@0) (< j1_5@@0 (* M N)))) (and (<= 0 j1_5_1@@0) (< j1_5_1@@0 (* M N)))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| out j1_5@@0) (|Seq#Index| out j1_5_1@@0))))
 :qid |stdinbpl.3063:15|
 :skolemid |224|
)) (=> (forall ((j1_5@@1 Int) ) (!  (=> (and (and (<= 0 j1_5@@1) (< j1_5@@1 (* M N))) (< NoPerm FullPerm)) (and (qpRange17 (|Seq#Index| out j1_5@@1)) (= (invRecv17 (|Seq#Index| out j1_5@@1)) j1_5@@1)))
 :qid |stdinbpl.3069:22|
 :skolemid |225|
 :pattern ( (|Seq#Index| out j1_5@@1))
 :pattern ( (|Seq#Index| out j1_5@@1))
)) (=> (and (forall ((o_3@@2 T@U) ) (!  (=> (= (type o_3@@2) RefType) (=> (and (and (and (<= 0 (invRecv17 o_3@@2)) (< (invRecv17 o_3@@2) (* M N))) (< NoPerm FullPerm)) (qpRange17 o_3@@2)) (= (|Seq#Index| out (invRecv17 o_3@@2)) o_3@@2)))
 :qid |stdinbpl.3073:22|
 :skolemid |226|
 :pattern ( (invRecv17 o_3@@2))
)) (forall ((j1_5@@2 Int) ) (!  (=> (and (<= 0 j1_5@@2) (< j1_5@@2 (* M N))) (not (= (|Seq#Index| out j1_5@@2) null)))
 :qid |stdinbpl.3079:22|
 :skolemid |227|
 :pattern ( (|Seq#Index| out j1_5@@2))
 :pattern ( (|Seq#Index| out j1_5@@2))
))) (=> (and (and (forall ((o_3@@3 T@U) ) (!  (=> (= (type o_3@@3) RefType) (and (=> (and (and (and (<= 0 (invRecv17 o_3@@3)) (< (invRecv17 o_3@@3) (* M N))) (< NoPerm FullPerm)) (qpRange17 o_3@@3)) (and (=> (< NoPerm FullPerm) (= (|Seq#Index| out (invRecv17 o_3@@3)) o_3@@3)) (= (U_2_real (MapType1Select QPMask@8 o_3@@3 Ref__Integer_value)) (+ (U_2_real (MapType1Select ZeroMask o_3@@3 Ref__Integer_value)) FullPerm)))) (=> (not (and (and (and (<= 0 (invRecv17 o_3@@3)) (< (invRecv17 o_3@@3) (* M N))) (< NoPerm FullPerm)) (qpRange17 o_3@@3))) (= (U_2_real (MapType1Select QPMask@8 o_3@@3 Ref__Integer_value)) (U_2_real (MapType1Select ZeroMask o_3@@3 Ref__Integer_value))))))
 :qid |stdinbpl.3085:22|
 :skolemid |228|
 :pattern ( (MapType1Select QPMask@8 o_3@@3 Ref__Integer_value))
)) (forall ((o_3@@4 T@U) (f_5@@0 T@U) ) (! (let ((B@@12 (FieldTypeInv1 (type f_5@@0))))
(let ((A@@13 (FieldTypeInv0 (type f_5@@0))))
 (=> (and (and (= (type o_3@@4) RefType) (= (type f_5@@0) (FieldType A@@13 B@@12))) (not (= f_5@@0 Ref__Integer_value))) (= (U_2_real (MapType1Select ZeroMask o_3@@4 f_5@@0)) (U_2_real (MapType1Select QPMask@8 o_3@@4 f_5@@0))))))
 :qid |stdinbpl.3089:29|
 :skolemid |229|
 :pattern ( (MapType1Select ZeroMask o_3@@4 f_5@@0))
 :pattern ( (MapType1Select QPMask@8 o_3@@4 f_5@@0))
))) (and (state PostHeap@0 QPMask@8) (state PostHeap@0 QPMask@8))) (and (and (=> (= (ControlFlow 0 130) 127) anon70_Else_correct) (=> (= (ControlFlow 0 130) 71) anon71_Then_correct)) (=> (= (ControlFlow 0 130) 74) anon71_Else_correct)))))))))
(let ((anon20_correct true))
(let ((anon69_Else_correct  (=> (and (not (and (<= 0 j1_4) (< j1_4 (* M N)))) (= (ControlFlow 0 69) 65)) anon20_correct)))
(let ((anon69_Then_correct  (=> (and (<= 0 j1_4) (< j1_4 (* M N))) (and (=> (= (ControlFlow 0 66) (- 0 68)) (>= j1_4 0)) (=> (>= j1_4 0) (and (=> (= (ControlFlow 0 66) (- 0 67)) (< j1_4 (|Seq#Length| out))) (=> (< j1_4 (|Seq#Length| out)) (=> (= (ControlFlow 0 66) 65) anon20_correct))))))))
(let ((anon67_Then_correct  (=> (and (and (state PostHeap@0 ZeroMask) (> M 0)) (and (> N 0) (state PostHeap@0 ZeroMask))) (and (and (=> (= (ControlFlow 0 132) 130) anon68_Else_correct) (=> (= (ControlFlow 0 132) 66) anon69_Then_correct)) (=> (= (ControlFlow 0 132) 69) anon69_Else_correct)))))
(let ((anon57_correct true))
(let ((anon87_Else_correct  (=> (and (not (and (<= 0 i_6) (and (< i_6 M) (and (<= 0 j_10) (< j_10 N))))) (= (ControlFlow 0 41) 38)) anon57_correct)))
(let ((anon87_Then_correct  (=> (and (<= 0 i_6) (and (< i_6 M) (and (<= 0 j_10) (< j_10 N)))) (and (=> (= (ControlFlow 0 39) (- 0 40)) (= (U_2_int (MapType0Select ExhaleHeap@0 (|Seq#Index| inp (Ref__multidim_index_2 ExhaleHeap@0 N M j_10 i_6)) Ref__Integer_value)) (U_2_int (MapType0Select Heap@@41 (|Seq#Index| inp (Ref__multidim_index_2 Heap@@41 N M j_10 i_6)) Ref__Integer_value)))) (=> (= (U_2_int (MapType0Select ExhaleHeap@0 (|Seq#Index| inp (Ref__multidim_index_2 ExhaleHeap@0 N M j_10 i_6)) Ref__Integer_value)) (U_2_int (MapType0Select Heap@@41 (|Seq#Index| inp (Ref__multidim_index_2 Heap@@41 N M j_10 i_6)) Ref__Integer_value))) (=> (= (ControlFlow 0 39) 38) anon57_correct))))))
(let ((anon86_Else_correct true))
(let ((anon84_Else_correct  (=> (forall ((i_5_1_1 Int) (j_9_1_1 Int) ) (!  (=> (and (<= 0 i_5_1_1) (and (< i_5_1_1 M) (and (<= 0 j_9_1_1) (< j_9_1_1 N)))) (= (U_2_int (MapType0Select ExhaleHeap@0 (|Seq#Index| out (Ref__multidim_index_2 ExhaleHeap@0 M N i_5_1_1 j_9_1_1)) Ref__Integer_value)) (U_2_int (MapType0Select ExhaleHeap@0 (|Seq#Index| inp (Ref__multidim_index_2 ExhaleHeap@0 N M j_9_1_1 i_5_1_1)) Ref__Integer_value))))
 :qid |stdinbpl.3589:20|
 :skolemid |281|
 :pattern ( (|Seq#Index| out (|Ref__multidim_index_2#frame| EmptyFrame M N i_5_1_1 j_9_1_1)))
 :pattern ( (|Seq#Index| inp (|Ref__multidim_index_2#frame| EmptyFrame N M j_9_1_1 i_5_1_1)))
)) (and (and (=> (= (ControlFlow 0 42) 37) anon86_Else_correct) (=> (= (ControlFlow 0 42) 39) anon87_Then_correct)) (=> (= (ControlFlow 0 42) 41) anon87_Else_correct)))))
(let ((anon53_correct true))
(let ((anon85_Else_correct  (=> (and (not (and (<= 0 i_4_1) (and (< i_4_1 M) (and (<= 0 j_8_1) (< j_8_1 N))))) (= (ControlFlow 0 36) 33)) anon53_correct)))
(let ((anon85_Then_correct  (=> (and (<= 0 i_4_1) (and (< i_4_1 M) (and (<= 0 j_8_1) (< j_8_1 N)))) (and (=> (= (ControlFlow 0 34) (- 0 35)) (= (U_2_int (MapType0Select ExhaleHeap@0 (|Seq#Index| out (Ref__multidim_index_2 ExhaleHeap@0 M N i_4_1 j_8_1)) Ref__Integer_value)) (U_2_int (MapType0Select ExhaleHeap@0 (|Seq#Index| inp (Ref__multidim_index_2 ExhaleHeap@0 N M j_8_1 i_4_1)) Ref__Integer_value)))) (=> (= (U_2_int (MapType0Select ExhaleHeap@0 (|Seq#Index| out (Ref__multidim_index_2 ExhaleHeap@0 M N i_4_1 j_8_1)) Ref__Integer_value)) (U_2_int (MapType0Select ExhaleHeap@0 (|Seq#Index| inp (Ref__multidim_index_2 ExhaleHeap@0 N M j_8_1 i_4_1)) Ref__Integer_value))) (=> (= (ControlFlow 0 34) 33) anon53_correct))))))
(let ((anon82_Else_correct  (=> (forall ((j_16_1 Int) (k_7_1 Int) ) (!  (=> (and (<= 0 j_16_1) (and (< j_16_1 (* M N)) (and (<= 0 k_7_1) (and (< k_7_1 (* M N)) (not (= j_16_1 k_7_1)))))) (not (= (|Seq#Index| inp j_16_1) (|Seq#Index| inp k_7_1))))
 :qid |stdinbpl.3352:22|
 :skolemid |246|
 :pattern ( (|Seq#Index| inp j_16_1) (|Seq#Index| inp k_7_1))
)) (and (=> (= (ControlFlow 0 43) (- 0 56)) (forall ((i_8 Int) ) (!  (=> (and (and (<= 0 i_8) (< i_8 (* N M))) (dummyFunction (MapType0Select Heap@@41 (|Seq#Index| inp i_8) Ref__Integer_value))) (>= (/ (to_real 1) (to_real 4)) NoPerm))
 :qid |stdinbpl.3360:19|
 :skolemid |247|
 :pattern ( (|Seq#Index| inp i_8))
 :pattern ( (|Seq#Index| inp i_8))
))) (=> (forall ((i_8@@0 Int) ) (!  (=> (and (and (<= 0 i_8@@0) (< i_8@@0 (* N M))) (dummyFunction (MapType0Select Heap@@41 (|Seq#Index| inp i_8@@0) Ref__Integer_value))) (>= (/ (to_real 1) (to_real 4)) NoPerm))
 :qid |stdinbpl.3360:19|
 :skolemid |247|
 :pattern ( (|Seq#Index| inp i_8@@0))
 :pattern ( (|Seq#Index| inp i_8@@0))
)) (and (=> (= (ControlFlow 0 43) (- 0 55)) (forall ((i_8@@1 Int) (i_8_2 Int) ) (!  (=> (and (and (and (and (not (= i_8@@1 i_8_2)) (and (<= 0 i_8@@1) (< i_8@@1 (* N M)))) (and (<= 0 i_8_2) (< i_8_2 (* N M)))) (< NoPerm (/ (to_real 1) (to_real 4)))) (< NoPerm (/ (to_real 1) (to_real 4)))) (not (= (|Seq#Index| inp i_8@@1) (|Seq#Index| inp i_8_2))))
 :qid |stdinbpl.3367:19|
 :skolemid |248|
 :pattern ( (neverTriggered22 i_8@@1) (neverTriggered22 i_8_2))
))) (=> (forall ((i_8@@2 Int) (i_8_2@@0 Int) ) (!  (=> (and (and (and (and (not (= i_8@@2 i_8_2@@0)) (and (<= 0 i_8@@2) (< i_8@@2 (* N M)))) (and (<= 0 i_8_2@@0) (< i_8_2@@0 (* N M)))) (< NoPerm (/ (to_real 1) (to_real 4)))) (< NoPerm (/ (to_real 1) (to_real 4)))) (not (= (|Seq#Index| inp i_8@@2) (|Seq#Index| inp i_8_2@@0))))
 :qid |stdinbpl.3367:19|
 :skolemid |248|
 :pattern ( (neverTriggered22 i_8@@2) (neverTriggered22 i_8_2@@0))
)) (and (=> (= (ControlFlow 0 43) (- 0 54)) (forall ((i_8@@3 Int) ) (!  (=> (and (<= 0 i_8@@3) (< i_8@@3 (* N M))) (>= (U_2_real (MapType1Select QPMask@2 (|Seq#Index| inp i_8@@3) Ref__Integer_value)) (/ (to_real 1) (to_real 4))))
 :qid |stdinbpl.3374:19|
 :skolemid |249|
 :pattern ( (|Seq#Index| inp i_8@@3))
 :pattern ( (|Seq#Index| inp i_8@@3))
))) (=> (forall ((i_8@@4 Int) ) (!  (=> (and (<= 0 i_8@@4) (< i_8@@4 (* N M))) (>= (U_2_real (MapType1Select QPMask@2 (|Seq#Index| inp i_8@@4) Ref__Integer_value)) (/ (to_real 1) (to_real 4))))
 :qid |stdinbpl.3374:19|
 :skolemid |249|
 :pattern ( (|Seq#Index| inp i_8@@4))
 :pattern ( (|Seq#Index| inp i_8@@4))
)) (=> (forall ((i_8@@5 Int) ) (!  (=> (and (and (<= 0 i_8@@5) (< i_8@@5 (* N M))) (< NoPerm (/ (to_real 1) (to_real 4)))) (and (qpRange22 (|Seq#Index| inp i_8@@5)) (= (invRecv22 (|Seq#Index| inp i_8@@5)) i_8@@5)))
 :qid |stdinbpl.3380:24|
 :skolemid |250|
 :pattern ( (|Seq#Index| inp i_8@@5))
 :pattern ( (|Seq#Index| inp i_8@@5))
)) (=> (and (and (forall ((o_3@@5 T@U) ) (!  (=> (= (type o_3@@5) RefType) (=> (and (and (<= 0 (invRecv22 o_3@@5)) (< (invRecv22 o_3@@5) (* N M))) (and (< NoPerm (/ (to_real 1) (to_real 4))) (qpRange22 o_3@@5))) (= (|Seq#Index| inp (invRecv22 o_3@@5)) o_3@@5)))
 :qid |stdinbpl.3384:24|
 :skolemid |251|
 :pattern ( (invRecv22 o_3@@5))
)) (forall ((o_3@@6 T@U) ) (!  (=> (= (type o_3@@6) RefType) (and (=> (and (and (<= 0 (invRecv22 o_3@@6)) (< (invRecv22 o_3@@6) (* N M))) (and (< NoPerm (/ (to_real 1) (to_real 4))) (qpRange22 o_3@@6))) (and (= (|Seq#Index| inp (invRecv22 o_3@@6)) o_3@@6) (= (U_2_real (MapType1Select QPMask@3 o_3@@6 Ref__Integer_value)) (- (U_2_real (MapType1Select QPMask@2 o_3@@6 Ref__Integer_value)) (/ (to_real 1) (to_real 4)))))) (=> (not (and (and (<= 0 (invRecv22 o_3@@6)) (< (invRecv22 o_3@@6) (* N M))) (and (< NoPerm (/ (to_real 1) (to_real 4))) (qpRange22 o_3@@6)))) (= (U_2_real (MapType1Select QPMask@3 o_3@@6 Ref__Integer_value)) (U_2_real (MapType1Select QPMask@2 o_3@@6 Ref__Integer_value))))))
 :qid |stdinbpl.3390:24|
 :skolemid |252|
 :pattern ( (MapType1Select QPMask@3 o_3@@6 Ref__Integer_value))
))) (and (forall ((o_3@@7 T@U) (f_5@@1 T@U) ) (! (let ((B@@13 (FieldTypeInv1 (type f_5@@1))))
(let ((A@@14 (FieldTypeInv0 (type f_5@@1))))
 (=> (and (and (= (type o_3@@7) RefType) (= (type f_5@@1) (FieldType A@@14 B@@13))) (not (= f_5@@1 Ref__Integer_value))) (= (U_2_real (MapType1Select QPMask@2 o_3@@7 f_5@@1)) (U_2_real (MapType1Select QPMask@3 o_3@@7 f_5@@1))))))
 :qid |stdinbpl.3396:31|
 :skolemid |253|
 :pattern ( (MapType1Select QPMask@3 o_3@@7 f_5@@1))
)) (IdenticalOnKnownLocations Heap@@41 ExhaleHeap@0 QPMask@3))) (and (=> (= (ControlFlow 0 43) (- 0 53)) (forall ((j_17 Int) (j_17_1 Int) ) (!  (=> (and (and (and (and (not (= j_17 j_17_1)) (and (<= 0 j_17) (< j_17 (* M N)))) (and (<= 0 j_17_1) (< j_17_1 (* M N)))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| out j_17) (|Seq#Index| out j_17_1))))
 :qid |stdinbpl.3409:17|
 :skolemid |254|
))) (=> (forall ((j_17@@0 Int) (j_17_1@@0 Int) ) (!  (=> (and (and (and (and (not (= j_17@@0 j_17_1@@0)) (and (<= 0 j_17@@0) (< j_17@@0 (* M N)))) (and (<= 0 j_17_1@@0) (< j_17_1@@0 (* M N)))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| out j_17@@0) (|Seq#Index| out j_17_1@@0))))
 :qid |stdinbpl.3409:17|
 :skolemid |254|
)) (=> (and (forall ((j_17@@1 Int) ) (!  (=> (and (and (<= 0 j_17@@1) (< j_17@@1 (* M N))) (< NoPerm FullPerm)) (and (qpRange23 (|Seq#Index| out j_17@@1)) (= (invRecv23 (|Seq#Index| out j_17@@1)) j_17@@1)))
 :qid |stdinbpl.3415:24|
 :skolemid |255|
 :pattern ( (|Seq#Index| out j_17@@1))
 :pattern ( (|Seq#Index| out j_17@@1))
)) (forall ((o_3@@8 T@U) ) (!  (=> (= (type o_3@@8) RefType) (=> (and (and (and (<= 0 (invRecv23 o_3@@8)) (< (invRecv23 o_3@@8) (* M N))) (< NoPerm FullPerm)) (qpRange23 o_3@@8)) (= (|Seq#Index| out (invRecv23 o_3@@8)) o_3@@8)))
 :qid |stdinbpl.3419:24|
 :skolemid |256|
 :pattern ( (invRecv23 o_3@@8))
))) (=> (and (and (forall ((j_17@@2 Int) ) (!  (=> (and (<= 0 j_17@@2) (< j_17@@2 (* M N))) (not (= (|Seq#Index| out j_17@@2) null)))
 :qid |stdinbpl.3425:24|
 :skolemid |257|
 :pattern ( (|Seq#Index| out j_17@@2))
 :pattern ( (|Seq#Index| out j_17@@2))
)) (forall ((o_3@@9 T@U) ) (!  (=> (= (type o_3@@9) RefType) (and (=> (and (and (and (<= 0 (invRecv23 o_3@@9)) (< (invRecv23 o_3@@9) (* M N))) (< NoPerm FullPerm)) (qpRange23 o_3@@9)) (and (=> (< NoPerm FullPerm) (= (|Seq#Index| out (invRecv23 o_3@@9)) o_3@@9)) (= (U_2_real (MapType1Select QPMask@4 o_3@@9 Ref__Integer_value)) (+ (U_2_real (MapType1Select QPMask@3 o_3@@9 Ref__Integer_value)) FullPerm)))) (=> (not (and (and (and (<= 0 (invRecv23 o_3@@9)) (< (invRecv23 o_3@@9) (* M N))) (< NoPerm FullPerm)) (qpRange23 o_3@@9))) (= (U_2_real (MapType1Select QPMask@4 o_3@@9 Ref__Integer_value)) (U_2_real (MapType1Select QPMask@3 o_3@@9 Ref__Integer_value))))))
 :qid |stdinbpl.3431:24|
 :skolemid |258|
 :pattern ( (MapType1Select QPMask@4 o_3@@9 Ref__Integer_value))
))) (and (forall ((o_3@@10 T@U) (f_5@@2 T@U) ) (! (let ((B@@14 (FieldTypeInv1 (type f_5@@2))))
(let ((A@@15 (FieldTypeInv0 (type f_5@@2))))
 (=> (and (and (= (type o_3@@10) RefType) (= (type f_5@@2) (FieldType A@@15 B@@14))) (not (= f_5@@2 Ref__Integer_value))) (= (U_2_real (MapType1Select QPMask@3 o_3@@10 f_5@@2)) (U_2_real (MapType1Select QPMask@4 o_3@@10 f_5@@2))))))
 :qid |stdinbpl.3435:31|
 :skolemid |259|
 :pattern ( (MapType1Select QPMask@3 o_3@@10 f_5@@2))
 :pattern ( (MapType1Select QPMask@4 o_3@@10 f_5@@2))
)) (state ExhaleHeap@0 QPMask@4))) (and (=> (= (ControlFlow 0 43) (- 0 52)) (forall ((i_9 Int) (i_9_1 Int) ) (!  (=> (and (and (and (and (not (= i_9 i_9_1)) (and (<= 0 i_9) (< i_9 (* N M)))) (and (<= 0 i_9_1) (< i_9_1 (* N M)))) (< NoPerm (/ (to_real 1) (to_real 4)))) (< NoPerm (/ (to_real 1) (to_real 4)))) (not (= (|Seq#Index| inp i_9) (|Seq#Index| inp i_9_1))))
 :qid |stdinbpl.3443:17|
 :skolemid |260|
))) (=> (forall ((i_9@@0 Int) (i_9_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_9@@0 i_9_1@@0)) (and (<= 0 i_9@@0) (< i_9@@0 (* N M)))) (and (<= 0 i_9_1@@0) (< i_9_1@@0 (* N M)))) (< NoPerm (/ (to_real 1) (to_real 4)))) (< NoPerm (/ (to_real 1) (to_real 4)))) (not (= (|Seq#Index| inp i_9@@0) (|Seq#Index| inp i_9_1@@0))))
 :qid |stdinbpl.3443:17|
 :skolemid |260|
)) (=> (and (forall ((i_9@@1 Int) ) (!  (=> (and (and (<= 0 i_9@@1) (< i_9@@1 (* N M))) (< NoPerm (/ (to_real 1) (to_real 4)))) (and (qpRange24 (|Seq#Index| inp i_9@@1)) (= (invRecv24 (|Seq#Index| inp i_9@@1)) i_9@@1)))
 :qid |stdinbpl.3449:24|
 :skolemid |261|
 :pattern ( (|Seq#Index| inp i_9@@1))
 :pattern ( (|Seq#Index| inp i_9@@1))
)) (forall ((o_3@@11 T@U) ) (!  (=> (= (type o_3@@11) RefType) (=> (and (and (and (<= 0 (invRecv24 o_3@@11)) (< (invRecv24 o_3@@11) (* N M))) (< NoPerm (/ (to_real 1) (to_real 4)))) (qpRange24 o_3@@11)) (= (|Seq#Index| inp (invRecv24 o_3@@11)) o_3@@11)))
 :qid |stdinbpl.3453:24|
 :skolemid |262|
 :pattern ( (invRecv24 o_3@@11))
))) (and (=> (= (ControlFlow 0 43) (- 0 51)) (forall ((i_9@@2 Int) ) (!  (=> (and (<= 0 i_9@@2) (< i_9@@2 (* N M))) (>= (/ (to_real 1) (to_real 4)) NoPerm))
 :qid |stdinbpl.3459:17|
 :skolemid |263|
 :pattern ( (|Seq#Index| inp i_9@@2))
 :pattern ( (|Seq#Index| inp i_9@@2))
))) (=> (forall ((i_9@@3 Int) ) (!  (=> (and (<= 0 i_9@@3) (< i_9@@3 (* N M))) (>= (/ (to_real 1) (to_real 4)) NoPerm))
 :qid |stdinbpl.3459:17|
 :skolemid |263|
 :pattern ( (|Seq#Index| inp i_9@@3))
 :pattern ( (|Seq#Index| inp i_9@@3))
)) (=> (and (and (and (forall ((i_9@@4 Int) ) (!  (=> (and (and (<= 0 i_9@@4) (< i_9@@4 (* N M))) (> (/ (to_real 1) (to_real 4)) NoPerm)) (not (= (|Seq#Index| inp i_9@@4) null)))
 :qid |stdinbpl.3465:24|
 :skolemid |264|
 :pattern ( (|Seq#Index| inp i_9@@4))
 :pattern ( (|Seq#Index| inp i_9@@4))
)) (forall ((o_3@@12 T@U) ) (!  (=> (= (type o_3@@12) RefType) (and (=> (and (and (and (<= 0 (invRecv24 o_3@@12)) (< (invRecv24 o_3@@12) (* N M))) (< NoPerm (/ (to_real 1) (to_real 4)))) (qpRange24 o_3@@12)) (and (=> (< NoPerm (/ (to_real 1) (to_real 4))) (= (|Seq#Index| inp (invRecv24 o_3@@12)) o_3@@12)) (= (U_2_real (MapType1Select QPMask@5 o_3@@12 Ref__Integer_value)) (+ (U_2_real (MapType1Select QPMask@4 o_3@@12 Ref__Integer_value)) (/ (to_real 1) (to_real 4)))))) (=> (not (and (and (and (<= 0 (invRecv24 o_3@@12)) (< (invRecv24 o_3@@12) (* N M))) (< NoPerm (/ (to_real 1) (to_real 4)))) (qpRange24 o_3@@12))) (= (U_2_real (MapType1Select QPMask@5 o_3@@12 Ref__Integer_value)) (U_2_real (MapType1Select QPMask@4 o_3@@12 Ref__Integer_value))))))
 :qid |stdinbpl.3471:24|
 :skolemid |265|
 :pattern ( (MapType1Select QPMask@5 o_3@@12 Ref__Integer_value))
))) (and (forall ((o_3@@13 T@U) (f_5@@3 T@U) ) (! (let ((B@@15 (FieldTypeInv1 (type f_5@@3))))
(let ((A@@16 (FieldTypeInv0 (type f_5@@3))))
 (=> (and (and (= (type o_3@@13) RefType) (= (type f_5@@3) (FieldType A@@16 B@@15))) (not (= f_5@@3 Ref__Integer_value))) (= (U_2_real (MapType1Select QPMask@4 o_3@@13 f_5@@3)) (U_2_real (MapType1Select QPMask@5 o_3@@13 f_5@@3))))))
 :qid |stdinbpl.3475:31|
 :skolemid |266|
 :pattern ( (MapType1Select QPMask@4 o_3@@13 f_5@@3))
 :pattern ( (MapType1Select QPMask@5 o_3@@13 f_5@@3))
)) (state ExhaleHeap@0 QPMask@5))) (and (and (state ExhaleHeap@0 QPMask@5) (forall ((i_10_1 Int) (j_18_1 Int) ) (!  (=> (and (<= 0 i_10_1) (and (< i_10_1 M) (and (<= 0 j_18_1) (< j_18_1 N)))) (= (U_2_int (MapType0Select ExhaleHeap@0 (|Seq#Index| out (Ref__multidim_index_2 ExhaleHeap@0 M N i_10_1 j_18_1)) Ref__Integer_value)) (U_2_int (MapType0Select ExhaleHeap@0 (|Seq#Index| inp (Ref__multidim_index_2 ExhaleHeap@0 N M j_18_1 i_10_1)) Ref__Integer_value))))
 :qid |stdinbpl.3482:22|
 :skolemid |267|
 :pattern ( (|Seq#Index| out (|Ref__multidim_index_2#frame| EmptyFrame M N i_10_1 j_18_1)))
 :pattern ( (|Seq#Index| inp (|Ref__multidim_index_2#frame| EmptyFrame N M j_18_1 i_10_1)))
))) (and (state ExhaleHeap@0 QPMask@5) (state ExhaleHeap@0 QPMask@5)))) (and (=> (= (ControlFlow 0 43) (- 0 50)) (> M 0)) (=> (> M 0) (and (=> (= (ControlFlow 0 43) (- 0 49)) (> N 0)) (=> (> N 0) (and (=> (= (ControlFlow 0 43) (- 0 48)) (forall ((j1_8 Int) (j1_8_1 Int) ) (!  (=> (and (and (and (and (not (= j1_8 j1_8_1)) (and (<= 0 j1_8) (< j1_8 (* M N)))) (and (<= 0 j1_8_1) (< j1_8_1 (* M N)))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| out j1_8) (|Seq#Index| out j1_8_1))))
 :qid |stdinbpl.3503:17|
 :skolemid |268|
 :pattern ( (neverTriggered19 j1_8) (neverTriggered19 j1_8_1))
))) (=> (forall ((j1_8@@0 Int) (j1_8_1@@0 Int) ) (!  (=> (and (and (and (and (not (= j1_8@@0 j1_8_1@@0)) (and (<= 0 j1_8@@0) (< j1_8@@0 (* M N)))) (and (<= 0 j1_8_1@@0) (< j1_8_1@@0 (* M N)))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| out j1_8@@0) (|Seq#Index| out j1_8_1@@0))))
 :qid |stdinbpl.3503:17|
 :skolemid |268|
 :pattern ( (neverTriggered19 j1_8@@0) (neverTriggered19 j1_8_1@@0))
)) (and (=> (= (ControlFlow 0 43) (- 0 47)) (forall ((j1_8@@1 Int) ) (!  (=> (and (<= 0 j1_8@@1) (< j1_8@@1 (* M N))) (>= (U_2_real (MapType1Select QPMask@5 (|Seq#Index| out j1_8@@1) Ref__Integer_value)) FullPerm))
 :qid |stdinbpl.3510:17|
 :skolemid |269|
 :pattern ( (|Seq#Index| out j1_8@@1))
 :pattern ( (|Seq#Index| out j1_8@@1))
))) (=> (forall ((j1_8@@2 Int) ) (!  (=> (and (<= 0 j1_8@@2) (< j1_8@@2 (* M N))) (>= (U_2_real (MapType1Select QPMask@5 (|Seq#Index| out j1_8@@2) Ref__Integer_value)) FullPerm))
 :qid |stdinbpl.3510:17|
 :skolemid |269|
 :pattern ( (|Seq#Index| out j1_8@@2))
 :pattern ( (|Seq#Index| out j1_8@@2))
)) (=> (and (and (forall ((j1_8@@3 Int) ) (!  (=> (and (and (<= 0 j1_8@@3) (< j1_8@@3 (* M N))) (< NoPerm FullPerm)) (and (qpRange19 (|Seq#Index| out j1_8@@3)) (= (invRecv19 (|Seq#Index| out j1_8@@3)) j1_8@@3)))
 :qid |stdinbpl.3516:22|
 :skolemid |270|
 :pattern ( (|Seq#Index| out j1_8@@3))
 :pattern ( (|Seq#Index| out j1_8@@3))
)) (forall ((o_3@@14 T@U) ) (!  (=> (= (type o_3@@14) RefType) (=> (and (and (<= 0 (invRecv19 o_3@@14)) (< (invRecv19 o_3@@14) (* M N))) (and (< NoPerm FullPerm) (qpRange19 o_3@@14))) (= (|Seq#Index| out (invRecv19 o_3@@14)) o_3@@14)))
 :qid |stdinbpl.3520:22|
 :skolemid |271|
 :pattern ( (invRecv19 o_3@@14))
))) (and (forall ((o_3@@15 T@U) ) (!  (=> (= (type o_3@@15) RefType) (and (=> (and (and (<= 0 (invRecv19 o_3@@15)) (< (invRecv19 o_3@@15) (* M N))) (and (< NoPerm FullPerm) (qpRange19 o_3@@15))) (and (= (|Seq#Index| out (invRecv19 o_3@@15)) o_3@@15) (= (U_2_real (MapType1Select QPMask@6 o_3@@15 Ref__Integer_value)) (- (U_2_real (MapType1Select QPMask@5 o_3@@15 Ref__Integer_value)) FullPerm)))) (=> (not (and (and (<= 0 (invRecv19 o_3@@15)) (< (invRecv19 o_3@@15) (* M N))) (and (< NoPerm FullPerm) (qpRange19 o_3@@15)))) (= (U_2_real (MapType1Select QPMask@6 o_3@@15 Ref__Integer_value)) (U_2_real (MapType1Select QPMask@5 o_3@@15 Ref__Integer_value))))))
 :qid |stdinbpl.3526:22|
 :skolemid |272|
 :pattern ( (MapType1Select QPMask@6 o_3@@15 Ref__Integer_value))
)) (forall ((o_3@@16 T@U) (f_5@@4 T@U) ) (! (let ((B@@16 (FieldTypeInv1 (type f_5@@4))))
(let ((A@@17 (FieldTypeInv0 (type f_5@@4))))
 (=> (and (and (= (type o_3@@16) RefType) (= (type f_5@@4) (FieldType A@@17 B@@16))) (not (= f_5@@4 Ref__Integer_value))) (= (U_2_real (MapType1Select QPMask@5 o_3@@16 f_5@@4)) (U_2_real (MapType1Select QPMask@6 o_3@@16 f_5@@4))))))
 :qid |stdinbpl.3532:29|
 :skolemid |273|
 :pattern ( (MapType1Select QPMask@6 o_3@@16 f_5@@4))
)))) (and (=> (= (ControlFlow 0 43) (- 0 46)) (forall ((j1_9 Int) ) (!  (=> (and (and (<= 0 j1_9) (< j1_9 (* N M))) (dummyFunction (MapType0Select ExhaleHeap@0 (|Seq#Index| inp j1_9) Ref__Integer_value))) (>= (/ (to_real 1) (to_real 2)) NoPerm))
 :qid |stdinbpl.3541:17|
 :skolemid |274|
 :pattern ( (|Seq#Index| inp j1_9))
 :pattern ( (|Seq#Index| inp j1_9))
))) (=> (forall ((j1_9@@0 Int) ) (!  (=> (and (and (<= 0 j1_9@@0) (< j1_9@@0 (* N M))) (dummyFunction (MapType0Select ExhaleHeap@0 (|Seq#Index| inp j1_9@@0) Ref__Integer_value))) (>= (/ (to_real 1) (to_real 2)) NoPerm))
 :qid |stdinbpl.3541:17|
 :skolemid |274|
 :pattern ( (|Seq#Index| inp j1_9@@0))
 :pattern ( (|Seq#Index| inp j1_9@@0))
)) (and (=> (= (ControlFlow 0 43) (- 0 45)) (forall ((j1_9@@1 Int) (j1_9_1 Int) ) (!  (=> (and (and (and (and (not (= j1_9@@1 j1_9_1)) (and (<= 0 j1_9@@1) (< j1_9@@1 (* N M)))) (and (<= 0 j1_9_1) (< j1_9_1 (* N M)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= (|Seq#Index| inp j1_9@@1) (|Seq#Index| inp j1_9_1))))
 :qid |stdinbpl.3548:17|
 :skolemid |275|
 :pattern ( (neverTriggered20 j1_9@@1) (neverTriggered20 j1_9_1))
))) (=> (forall ((j1_9@@2 Int) (j1_9_1@@0 Int) ) (!  (=> (and (and (and (and (not (= j1_9@@2 j1_9_1@@0)) (and (<= 0 j1_9@@2) (< j1_9@@2 (* N M)))) (and (<= 0 j1_9_1@@0) (< j1_9_1@@0 (* N M)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= (|Seq#Index| inp j1_9@@2) (|Seq#Index| inp j1_9_1@@0))))
 :qid |stdinbpl.3548:17|
 :skolemid |275|
 :pattern ( (neverTriggered20 j1_9@@2) (neverTriggered20 j1_9_1@@0))
)) (and (=> (= (ControlFlow 0 43) (- 0 44)) (forall ((j1_9@@3 Int) ) (!  (=> (and (<= 0 j1_9@@3) (< j1_9@@3 (* N M))) (>= (U_2_real (MapType1Select QPMask@6 (|Seq#Index| inp j1_9@@3) Ref__Integer_value)) (/ (to_real 1) (to_real 2))))
 :qid |stdinbpl.3555:17|
 :skolemid |276|
 :pattern ( (|Seq#Index| inp j1_9@@3))
 :pattern ( (|Seq#Index| inp j1_9@@3))
))) (=> (forall ((j1_9@@4 Int) ) (!  (=> (and (<= 0 j1_9@@4) (< j1_9@@4 (* N M))) (>= (U_2_real (MapType1Select QPMask@6 (|Seq#Index| inp j1_9@@4) Ref__Integer_value)) (/ (to_real 1) (to_real 2))))
 :qid |stdinbpl.3555:17|
 :skolemid |276|
 :pattern ( (|Seq#Index| inp j1_9@@4))
 :pattern ( (|Seq#Index| inp j1_9@@4))
)) (=> (and (and (forall ((j1_9@@5 Int) ) (!  (=> (and (and (<= 0 j1_9@@5) (< j1_9@@5 (* N M))) (< NoPerm (/ (to_real 1) (to_real 2)))) (and (qpRange20 (|Seq#Index| inp j1_9@@5)) (= (invRecv20 (|Seq#Index| inp j1_9@@5)) j1_9@@5)))
 :qid |stdinbpl.3561:22|
 :skolemid |277|
 :pattern ( (|Seq#Index| inp j1_9@@5))
 :pattern ( (|Seq#Index| inp j1_9@@5))
)) (forall ((o_3@@17 T@U) ) (!  (=> (= (type o_3@@17) RefType) (=> (and (and (<= 0 (invRecv20 o_3@@17)) (< (invRecv20 o_3@@17) (* N M))) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange20 o_3@@17))) (= (|Seq#Index| inp (invRecv20 o_3@@17)) o_3@@17)))
 :qid |stdinbpl.3565:22|
 :skolemid |278|
 :pattern ( (invRecv20 o_3@@17))
))) (and (forall ((o_3@@18 T@U) ) (!  (=> (= (type o_3@@18) RefType) (and (=> (and (and (<= 0 (invRecv20 o_3@@18)) (< (invRecv20 o_3@@18) (* N M))) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange20 o_3@@18))) (and (= (|Seq#Index| inp (invRecv20 o_3@@18)) o_3@@18) (= (U_2_real (MapType1Select QPMask@7 o_3@@18 Ref__Integer_value)) (- (U_2_real (MapType1Select QPMask@6 o_3@@18 Ref__Integer_value)) (/ (to_real 1) (to_real 2)))))) (=> (not (and (and (<= 0 (invRecv20 o_3@@18)) (< (invRecv20 o_3@@18) (* N M))) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange20 o_3@@18)))) (= (U_2_real (MapType1Select QPMask@7 o_3@@18 Ref__Integer_value)) (U_2_real (MapType1Select QPMask@6 o_3@@18 Ref__Integer_value))))))
 :qid |stdinbpl.3571:22|
 :skolemid |279|
 :pattern ( (MapType1Select QPMask@7 o_3@@18 Ref__Integer_value))
)) (forall ((o_3@@19 T@U) (f_5@@5 T@U) ) (! (let ((B@@17 (FieldTypeInv1 (type f_5@@5))))
(let ((A@@18 (FieldTypeInv0 (type f_5@@5))))
 (=> (and (and (= (type o_3@@19) RefType) (= (type f_5@@5) (FieldType A@@18 B@@17))) (not (= f_5@@5 Ref__Integer_value))) (= (U_2_real (MapType1Select QPMask@6 o_3@@19 f_5@@5)) (U_2_real (MapType1Select QPMask@7 o_3@@19 f_5@@5))))))
 :qid |stdinbpl.3577:29|
 :skolemid |280|
 :pattern ( (MapType1Select QPMask@7 o_3@@19 f_5@@5))
)))) (and (and (=> (= (ControlFlow 0 43) 42) anon84_Else_correct) (=> (= (ControlFlow 0 43) 34) anon85_Then_correct)) (=> (= (ControlFlow 0 43) 36) anon85_Else_correct)))))))))))))))))))))))))))))))))))))))
(let ((anon49_correct true))
(let ((anon83_Else_correct  (=> (and (not (and (<= 0 j_15_1) (and (< j_15_1 (* M N)) (and (<= 0 k_6) (and (< k_6 (* M N)) (not (= j_15_1 k_6))))))) (= (ControlFlow 0 32) 29)) anon49_correct)))
(let ((anon83_Then_correct  (=> (and (<= 0 j_15_1) (and (< j_15_1 (* M N)) (and (<= 0 k_6) (and (< k_6 (* M N)) (not (= j_15_1 k_6)))))) (and (=> (= (ControlFlow 0 30) (- 0 31)) (not (= (|Seq#Index| inp j_15_1) (|Seq#Index| inp k_6)))) (=> (not (= (|Seq#Index| inp j_15_1) (|Seq#Index| inp k_6))) (=> (= (ControlFlow 0 30) 29) anon49_correct))))))
(let ((anon80_Else_correct  (=> (forall ((j_13_1 Int) (k_5_1 Int) ) (!  (=> (and (<= 0 j_13_1) (and (< j_13_1 (* M N)) (and (<= 0 k_5_1) (and (< k_5_1 (* M N)) (not (= j_13_1 k_5_1)))))) (not (= (|Seq#Index| out j_13_1) (|Seq#Index| out k_5_1))))
 :qid |stdinbpl.3298:22|
 :skolemid |239|
 :pattern ( (|Seq#Index| out j_13_1) (|Seq#Index| out k_5_1))
)) (and (=> (= (ControlFlow 0 57) (- 0 60)) (forall ((j_14 Int) (j_14_1 Int) ) (!  (=> (and (and (and (and (not (= j_14 j_14_1)) (and (<= 0 j_14) (< j_14 (* M N)))) (and (<= 0 j_14_1) (< j_14_1 (* M N)))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| out j_14) (|Seq#Index| out j_14_1))))
 :qid |stdinbpl.3309:19|
 :skolemid |240|
 :pattern ( (neverTriggered21 j_14) (neverTriggered21 j_14_1))
))) (=> (forall ((j_14@@0 Int) (j_14_1@@0 Int) ) (!  (=> (and (and (and (and (not (= j_14@@0 j_14_1@@0)) (and (<= 0 j_14@@0) (< j_14@@0 (* M N)))) (and (<= 0 j_14_1@@0) (< j_14_1@@0 (* M N)))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| out j_14@@0) (|Seq#Index| out j_14_1@@0))))
 :qid |stdinbpl.3309:19|
 :skolemid |240|
 :pattern ( (neverTriggered21 j_14@@0) (neverTriggered21 j_14_1@@0))
)) (and (=> (= (ControlFlow 0 57) (- 0 59)) (forall ((j_14@@1 Int) ) (!  (=> (and (<= 0 j_14@@1) (< j_14@@1 (* M N))) (>= (U_2_real (MapType1Select QPMask@1 (|Seq#Index| out j_14@@1) Ref__Integer_value)) FullPerm))
 :qid |stdinbpl.3316:19|
 :skolemid |241|
 :pattern ( (|Seq#Index| out j_14@@1))
 :pattern ( (|Seq#Index| out j_14@@1))
))) (=> (forall ((j_14@@2 Int) ) (!  (=> (and (<= 0 j_14@@2) (< j_14@@2 (* M N))) (>= (U_2_real (MapType1Select QPMask@1 (|Seq#Index| out j_14@@2) Ref__Integer_value)) FullPerm))
 :qid |stdinbpl.3316:19|
 :skolemid |241|
 :pattern ( (|Seq#Index| out j_14@@2))
 :pattern ( (|Seq#Index| out j_14@@2))
)) (=> (and (and (forall ((j_14@@3 Int) ) (!  (=> (and (and (<= 0 j_14@@3) (< j_14@@3 (* M N))) (< NoPerm FullPerm)) (and (qpRange21 (|Seq#Index| out j_14@@3)) (= (invRecv21 (|Seq#Index| out j_14@@3)) j_14@@3)))
 :qid |stdinbpl.3322:24|
 :skolemid |242|
 :pattern ( (|Seq#Index| out j_14@@3))
 :pattern ( (|Seq#Index| out j_14@@3))
)) (forall ((o_3@@20 T@U) ) (!  (=> (= (type o_3@@20) RefType) (=> (and (and (<= 0 (invRecv21 o_3@@20)) (< (invRecv21 o_3@@20) (* M N))) (and (< NoPerm FullPerm) (qpRange21 o_3@@20))) (= (|Seq#Index| out (invRecv21 o_3@@20)) o_3@@20)))
 :qid |stdinbpl.3326:24|
 :skolemid |243|
 :pattern ( (invRecv21 o_3@@20))
))) (and (forall ((o_3@@21 T@U) ) (!  (=> (= (type o_3@@21) RefType) (and (=> (and (and (<= 0 (invRecv21 o_3@@21)) (< (invRecv21 o_3@@21) (* M N))) (and (< NoPerm FullPerm) (qpRange21 o_3@@21))) (and (= (|Seq#Index| out (invRecv21 o_3@@21)) o_3@@21) (= (U_2_real (MapType1Select QPMask@2 o_3@@21 Ref__Integer_value)) (- (U_2_real (MapType1Select QPMask@1 o_3@@21 Ref__Integer_value)) FullPerm)))) (=> (not (and (and (<= 0 (invRecv21 o_3@@21)) (< (invRecv21 o_3@@21) (* M N))) (and (< NoPerm FullPerm) (qpRange21 o_3@@21)))) (= (U_2_real (MapType1Select QPMask@2 o_3@@21 Ref__Integer_value)) (U_2_real (MapType1Select QPMask@1 o_3@@21 Ref__Integer_value))))))
 :qid |stdinbpl.3332:24|
 :skolemid |244|
 :pattern ( (MapType1Select QPMask@2 o_3@@21 Ref__Integer_value))
)) (forall ((o_3@@22 T@U) (f_5@@6 T@U) ) (! (let ((B@@18 (FieldTypeInv1 (type f_5@@6))))
(let ((A@@19 (FieldTypeInv0 (type f_5@@6))))
 (=> (and (and (= (type o_3@@22) RefType) (= (type f_5@@6) (FieldType A@@19 B@@18))) (not (= f_5@@6 Ref__Integer_value))) (= (U_2_real (MapType1Select QPMask@1 o_3@@22 f_5@@6)) (U_2_real (MapType1Select QPMask@2 o_3@@22 f_5@@6))))))
 :qid |stdinbpl.3338:31|
 :skolemid |245|
 :pattern ( (MapType1Select QPMask@2 o_3@@22 f_5@@6))
)))) (and (=> (= (ControlFlow 0 57) (- 0 58)) (<= (* N M) (|Seq#Length| inp))) (=> (<= (* N M) (|Seq#Length| inp)) (and (and (=> (= (ControlFlow 0 57) 43) anon82_Else_correct) (=> (= (ControlFlow 0 57) 30) anon83_Then_correct)) (=> (= (ControlFlow 0 57) 32) anon83_Else_correct))))))))))))
(let ((anon45_correct true))
(let ((anon81_Else_correct  (=> (and (not (and (<= 0 j_12_2) (and (< j_12_2 (* M N)) (and (<= 0 k_4_1) (and (< k_4_1 (* M N)) (not (= j_12_2 k_4_1))))))) (= (ControlFlow 0 28) 25)) anon45_correct)))
(let ((anon81_Then_correct  (=> (and (<= 0 j_12_2) (and (< j_12_2 (* M N)) (and (<= 0 k_4_1) (and (< k_4_1 (* M N)) (not (= j_12_2 k_4_1)))))) (and (=> (= (ControlFlow 0 26) (- 0 27)) (not (= (|Seq#Index| out j_12_2) (|Seq#Index| out k_4_1)))) (=> (not (= (|Seq#Index| out j_12_2) (|Seq#Index| out k_4_1))) (=> (= (ControlFlow 0 26) 25) anon45_correct))))))
(let ((anon67_Else_correct  (and (=> (= (ControlFlow 0 61) (- 0 64)) (not (= diz null))) (=> (not (= diz null)) (and (=> (= (ControlFlow 0 61) (- 0 63)) (>= current_thread_id 0)) (=> (>= current_thread_id 0) (and (=> (= (ControlFlow 0 61) (- 0 62)) (<= (* M N) (|Seq#Length| out))) (=> (<= (* M N) (|Seq#Length| out)) (and (and (=> (= (ControlFlow 0 61) 57) anon80_Else_correct) (=> (= (ControlFlow 0 61) 26) anon81_Then_correct)) (=> (= (ControlFlow 0 61) 28) anon81_Else_correct))))))))))
(let ((anon65_Else_correct  (and (=> (= (ControlFlow 0 133) (- 0 135)) (forall ((j1_3 Int) (j1_3_1 Int) ) (!  (=> (and (and (and (and (not (= j1_3 j1_3_1)) (and (<= 0 j1_3) (< j1_3 (* N M)))) (and (<= 0 j1_3_1) (< j1_3_1 (* N M)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= (|Seq#Index| inp j1_3) (|Seq#Index| inp j1_3_1))))
 :qid |stdinbpl.2997:15|
 :skolemid |217|
))) (=> (forall ((j1_3@@0 Int) (j1_3_1@@0 Int) ) (!  (=> (and (and (and (and (not (= j1_3@@0 j1_3_1@@0)) (and (<= 0 j1_3@@0) (< j1_3@@0 (* N M)))) (and (<= 0 j1_3_1@@0) (< j1_3_1@@0 (* N M)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= (|Seq#Index| inp j1_3@@0) (|Seq#Index| inp j1_3_1@@0))))
 :qid |stdinbpl.2997:15|
 :skolemid |217|
)) (=> (and (forall ((j1_3@@1 Int) ) (!  (=> (and (and (<= 0 j1_3@@1) (< j1_3@@1 (* N M))) (< NoPerm (/ (to_real 1) (to_real 2)))) (and (qpRange16 (|Seq#Index| inp j1_3@@1)) (= (invRecv16 (|Seq#Index| inp j1_3@@1)) j1_3@@1)))
 :qid |stdinbpl.3003:22|
 :skolemid |218|
 :pattern ( (|Seq#Index| inp j1_3@@1))
 :pattern ( (|Seq#Index| inp j1_3@@1))
)) (forall ((o_3@@23 T@U) ) (!  (=> (= (type o_3@@23) RefType) (=> (and (and (and (<= 0 (invRecv16 o_3@@23)) (< (invRecv16 o_3@@23) (* N M))) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange16 o_3@@23)) (= (|Seq#Index| inp (invRecv16 o_3@@23)) o_3@@23)))
 :qid |stdinbpl.3007:22|
 :skolemid |219|
 :pattern ( (invRecv16 o_3@@23))
))) (and (=> (= (ControlFlow 0 133) (- 0 134)) (forall ((j1_3@@2 Int) ) (!  (=> (and (<= 0 j1_3@@2) (< j1_3@@2 (* N M))) (>= (/ (to_real 1) (to_real 2)) NoPerm))
 :qid |stdinbpl.3013:15|
 :skolemid |220|
 :pattern ( (|Seq#Index| inp j1_3@@2))
 :pattern ( (|Seq#Index| inp j1_3@@2))
))) (=> (forall ((j1_3@@3 Int) ) (!  (=> (and (<= 0 j1_3@@3) (< j1_3@@3 (* N M))) (>= (/ (to_real 1) (to_real 2)) NoPerm))
 :qid |stdinbpl.3013:15|
 :skolemid |220|
 :pattern ( (|Seq#Index| inp j1_3@@3))
 :pattern ( (|Seq#Index| inp j1_3@@3))
)) (=> (forall ((j1_3@@4 Int) ) (!  (=> (and (and (<= 0 j1_3@@4) (< j1_3@@4 (* N M))) (> (/ (to_real 1) (to_real 2)) NoPerm)) (not (= (|Seq#Index| inp j1_3@@4) null)))
 :qid |stdinbpl.3019:22|
 :skolemid |221|
 :pattern ( (|Seq#Index| inp j1_3@@4))
 :pattern ( (|Seq#Index| inp j1_3@@4))
)) (=> (and (and (forall ((o_3@@24 T@U) ) (!  (=> (= (type o_3@@24) RefType) (and (=> (and (and (and (<= 0 (invRecv16 o_3@@24)) (< (invRecv16 o_3@@24) (* N M))) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange16 o_3@@24)) (and (=> (< NoPerm (/ (to_real 1) (to_real 2))) (= (|Seq#Index| inp (invRecv16 o_3@@24)) o_3@@24)) (= (U_2_real (MapType1Select QPMask@1 o_3@@24 Ref__Integer_value)) (+ (U_2_real (MapType1Select QPMask@0 o_3@@24 Ref__Integer_value)) (/ (to_real 1) (to_real 2)))))) (=> (not (and (and (and (<= 0 (invRecv16 o_3@@24)) (< (invRecv16 o_3@@24) (* N M))) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange16 o_3@@24))) (= (U_2_real (MapType1Select QPMask@1 o_3@@24 Ref__Integer_value)) (U_2_real (MapType1Select QPMask@0 o_3@@24 Ref__Integer_value))))))
 :qid |stdinbpl.3025:22|
 :skolemid |222|
 :pattern ( (MapType1Select QPMask@1 o_3@@24 Ref__Integer_value))
)) (forall ((o_3@@25 T@U) (f_5@@7 T@U) ) (! (let ((B@@19 (FieldTypeInv1 (type f_5@@7))))
(let ((A@@20 (FieldTypeInv0 (type f_5@@7))))
 (=> (and (and (= (type o_3@@25) RefType) (= (type f_5@@7) (FieldType A@@20 B@@19))) (not (= f_5@@7 Ref__Integer_value))) (= (U_2_real (MapType1Select QPMask@0 o_3@@25 f_5@@7)) (U_2_real (MapType1Select QPMask@1 o_3@@25 f_5@@7))))))
 :qid |stdinbpl.3029:29|
 :skolemid |223|
 :pattern ( (MapType1Select QPMask@0 o_3@@25 f_5@@7))
 :pattern ( (MapType1Select QPMask@1 o_3@@25 f_5@@7))
))) (and (state Heap@@41 QPMask@1) (state Heap@@41 QPMask@1))) (and (=> (= (ControlFlow 0 133) 132) anon67_Then_correct) (=> (= (ControlFlow 0 133) 61) anon67_Else_correct)))))))))))
(let ((anon15_correct true))
(let ((anon66_Else_correct  (=> (and (not (and (<= 0 j1_2) (< j1_2 (* N M)))) (= (ControlFlow 0 24) 20)) anon15_correct)))
(let ((anon66_Then_correct  (=> (and (<= 0 j1_2) (< j1_2 (* N M))) (and (=> (= (ControlFlow 0 21) (- 0 23)) (>= j1_2 0)) (=> (>= j1_2 0) (and (=> (= (ControlFlow 0 21) (- 0 22)) (< j1_2 (|Seq#Length| inp))) (=> (< j1_2 (|Seq#Length| inp)) (=> (= (ControlFlow 0 21) 20) anon15_correct))))))))
(let ((anon63_Else_correct  (=> (and (forall ((j_3 Int) (k_3_1 Int) ) (!  (=> (and (<= 0 j_3) (and (< j_3 (* M N)) (and (<= 0 k_3_1) (and (< k_3_1 (* M N)) (not (= j_3 k_3_1)))))) (not (= (|Seq#Index| inp j_3) (|Seq#Index| inp k_3_1))))
 :qid |stdinbpl.2979:20|
 :skolemid |216|
 :pattern ( (|Seq#Index| inp j_3) (|Seq#Index| inp k_3_1))
)) (state Heap@@41 QPMask@0)) (and (and (=> (= (ControlFlow 0 136) 133) anon65_Else_correct) (=> (= (ControlFlow 0 136) 21) anon66_Then_correct)) (=> (= (ControlFlow 0 136) 24) anon66_Else_correct)))))
(let ((anon11_correct true))
(let ((anon64_Else_correct  (=> (and (not (and (<= 0 j_16) (and (< j_16 (* M N)) (and (<= 0 k_16) (and (< k_16 (* M N)) (not (= j_16 k_16))))))) (= (ControlFlow 0 19) 13)) anon11_correct)))
(let ((anon64_Then_correct  (=> (and (<= 0 j_16) (and (< j_16 (* M N)) (and (<= 0 k_16) (and (< k_16 (* M N)) (not (= j_16 k_16)))))) (and (=> (= (ControlFlow 0 14) (- 0 18)) (>= j_16 0)) (=> (>= j_16 0) (and (=> (= (ControlFlow 0 14) (- 0 17)) (< j_16 (|Seq#Length| inp))) (=> (< j_16 (|Seq#Length| inp)) (and (=> (= (ControlFlow 0 14) (- 0 16)) (>= k_16 0)) (=> (>= k_16 0) (and (=> (= (ControlFlow 0 14) (- 0 15)) (< k_16 (|Seq#Length| inp))) (=> (< k_16 (|Seq#Length| inp)) (=> (= (ControlFlow 0 14) 13) anon11_correct))))))))))))
(let ((anon61_Else_correct  (and (=> (= (ControlFlow 0 137) (- 0 138)) (forall ((j1_1 Int) (j1_1_1 Int) ) (!  (=> (and (and (and (and (not (= j1_1 j1_1_1)) (and (<= 0 j1_1) (< j1_1 (* M N)))) (and (<= 0 j1_1_1) (< j1_1_1 (* M N)))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| out j1_1) (|Seq#Index| out j1_1_1))))
 :qid |stdinbpl.2929:15|
 :skolemid |210|
))) (=> (forall ((j1_1@@0 Int) (j1_1_1@@0 Int) ) (!  (=> (and (and (and (and (not (= j1_1@@0 j1_1_1@@0)) (and (<= 0 j1_1@@0) (< j1_1@@0 (* M N)))) (and (<= 0 j1_1_1@@0) (< j1_1_1@@0 (* M N)))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| out j1_1@@0) (|Seq#Index| out j1_1_1@@0))))
 :qid |stdinbpl.2929:15|
 :skolemid |210|
)) (=> (forall ((j1_1@@1 Int) ) (!  (=> (and (and (<= 0 j1_1@@1) (< j1_1@@1 (* M N))) (< NoPerm FullPerm)) (and (qpRange15 (|Seq#Index| out j1_1@@1)) (= (invRecv15 (|Seq#Index| out j1_1@@1)) j1_1@@1)))
 :qid |stdinbpl.2935:22|
 :skolemid |211|
 :pattern ( (|Seq#Index| out j1_1@@1))
 :pattern ( (|Seq#Index| out j1_1@@1))
)) (=> (and (and (and (forall ((o_3@@26 T@U) ) (!  (=> (= (type o_3@@26) RefType) (=> (and (and (and (<= 0 (invRecv15 o_3@@26)) (< (invRecv15 o_3@@26) (* M N))) (< NoPerm FullPerm)) (qpRange15 o_3@@26)) (= (|Seq#Index| out (invRecv15 o_3@@26)) o_3@@26)))
 :qid |stdinbpl.2939:22|
 :skolemid |212|
 :pattern ( (invRecv15 o_3@@26))
)) (forall ((j1_1@@2 Int) ) (!  (=> (and (<= 0 j1_1@@2) (< j1_1@@2 (* M N))) (not (= (|Seq#Index| out j1_1@@2) null)))
 :qid |stdinbpl.2945:22|
 :skolemid |213|
 :pattern ( (|Seq#Index| out j1_1@@2))
 :pattern ( (|Seq#Index| out j1_1@@2))
))) (and (forall ((o_3@@27 T@U) ) (!  (=> (= (type o_3@@27) RefType) (and (=> (and (and (and (<= 0 (invRecv15 o_3@@27)) (< (invRecv15 o_3@@27) (* M N))) (< NoPerm FullPerm)) (qpRange15 o_3@@27)) (and (=> (< NoPerm FullPerm) (= (|Seq#Index| out (invRecv15 o_3@@27)) o_3@@27)) (= (U_2_real (MapType1Select QPMask@0 o_3@@27 Ref__Integer_value)) (+ (U_2_real (MapType1Select ZeroMask o_3@@27 Ref__Integer_value)) FullPerm)))) (=> (not (and (and (and (<= 0 (invRecv15 o_3@@27)) (< (invRecv15 o_3@@27) (* M N))) (< NoPerm FullPerm)) (qpRange15 o_3@@27))) (= (U_2_real (MapType1Select QPMask@0 o_3@@27 Ref__Integer_value)) (U_2_real (MapType1Select ZeroMask o_3@@27 Ref__Integer_value))))))
 :qid |stdinbpl.2951:22|
 :skolemid |214|
 :pattern ( (MapType1Select QPMask@0 o_3@@27 Ref__Integer_value))
)) (forall ((o_3@@28 T@U) (f_5@@8 T@U) ) (! (let ((B@@20 (FieldTypeInv1 (type f_5@@8))))
(let ((A@@21 (FieldTypeInv0 (type f_5@@8))))
 (=> (and (and (= (type o_3@@28) RefType) (= (type f_5@@8) (FieldType A@@21 B@@20))) (not (= f_5@@8 Ref__Integer_value))) (= (U_2_real (MapType1Select ZeroMask o_3@@28 f_5@@8)) (U_2_real (MapType1Select QPMask@0 o_3@@28 f_5@@8))))))
 :qid |stdinbpl.2955:29|
 :skolemid |215|
 :pattern ( (MapType1Select ZeroMask o_3@@28 f_5@@8))
 :pattern ( (MapType1Select QPMask@0 o_3@@28 f_5@@8))
)))) (and (and (state Heap@@41 QPMask@0) (state Heap@@41 QPMask@0)) (and (<= (* N M) (|Seq#Length| inp)) (state Heap@@41 QPMask@0)))) (and (and (=> (= (ControlFlow 0 137) 136) anon63_Else_correct) (=> (= (ControlFlow 0 137) 14) anon64_Then_correct)) (=> (= (ControlFlow 0 137) 19) anon64_Else_correct))))))))
(let ((anon7_correct true))
(let ((anon62_Else_correct  (=> (and (not (and (<= 0 j1) (< j1 (* M N)))) (= (ControlFlow 0 12) 8)) anon7_correct)))
(let ((anon62_Then_correct  (=> (and (<= 0 j1) (< j1 (* M N))) (and (=> (= (ControlFlow 0 9) (- 0 11)) (>= j1 0)) (=> (>= j1 0) (and (=> (= (ControlFlow 0 9) (- 0 10)) (< j1 (|Seq#Length| out))) (=> (< j1 (|Seq#Length| out)) (=> (= (ControlFlow 0 9) 8) anon7_correct))))))))
(let ((anon59_Else_correct  (=> (and (forall ((j_1_1 Int) (k_1_1 Int) ) (!  (=> (and (<= 0 j_1_1) (and (< j_1_1 (* M N)) (and (<= 0 k_1_1) (and (< k_1_1 (* M N)) (not (= j_1_1 k_1_1)))))) (not (= (|Seq#Index| out j_1_1) (|Seq#Index| out k_1_1))))
 :qid |stdinbpl.2911:20|
 :skolemid |209|
 :pattern ( (|Seq#Index| out j_1_1) (|Seq#Index| out k_1_1))
)) (state Heap@@41 ZeroMask)) (and (and (=> (= (ControlFlow 0 139) 137) anon61_Else_correct) (=> (= (ControlFlow 0 139) 9) anon62_Then_correct)) (=> (= (ControlFlow 0 139) 12) anon62_Else_correct)))))
(let ((anon3_correct true))
(let ((anon60_Else_correct  (=> (and (not (and (<= 0 j_15) (and (< j_15 (* M N)) (and (<= 0 k_15) (and (< k_15 (* M N)) (not (= j_15 k_15))))))) (= (ControlFlow 0 7) 1)) anon3_correct)))
(let ((anon60_Then_correct  (=> (and (<= 0 j_15) (and (< j_15 (* M N)) (and (<= 0 k_15) (and (< k_15 (* M N)) (not (= j_15 k_15)))))) (and (=> (= (ControlFlow 0 2) (- 0 6)) (>= j_15 0)) (=> (>= j_15 0) (and (=> (= (ControlFlow 0 2) (- 0 5)) (< j_15 (|Seq#Length| out))) (=> (< j_15 (|Seq#Length| out)) (and (=> (= (ControlFlow 0 2) (- 0 4)) (>= k_15 0)) (=> (>= k_15 0) (and (=> (= (ControlFlow 0 2) (- 0 3)) (< k_15 (|Seq#Length| out))) (=> (< k_15 (|Seq#Length| out)) (=> (= (ControlFlow 0 2) 1) anon3_correct))))))))))))
(let ((anon0_correct  (=> (and (and (state Heap@@41 ZeroMask) (= AssumeFunctionsAbove (- 0 1))) (and (U_2_bool (MapType0Select Heap@@41 diz $allocated)) (not (= diz null)))) (=> (and (and (and (state Heap@@41 ZeroMask) (>= current_thread_id 0)) (and (state Heap@@41 ZeroMask) (> M 0))) (and (and (> N 0) (state Heap@@41 ZeroMask)) (and (<= (* M N) (|Seq#Length| out)) (state Heap@@41 ZeroMask)))) (and (and (=> (= (ControlFlow 0 140) 139) anon59_Else_correct) (=> (= (ControlFlow 0 140) 2) anon60_Then_correct)) (=> (= (ControlFlow 0 140) 7) anon60_Else_correct))))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 141) 140) anon0_correct)))
PreconditionGeneratedEntry_correct)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
))
(check-sat)
(pop 1)
; Valid
(get-info :rlimit)
