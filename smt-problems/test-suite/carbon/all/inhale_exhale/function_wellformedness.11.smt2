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
(declare-fun x@@8 () T@U)
(declare-fun FieldType (T@T T@T) T@T)
(declare-fun FieldTypeInv0 (T@T) T@T)
(declare-fun FieldTypeInv1 (T@T) T@T)
(declare-fun NormalFieldType () T@T)
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
(declare-fun IdenticalOnKnownLocations (T@U T@U T@U) Bool)
(declare-fun IsPredicateField (T@U) Bool)
(declare-fun null () T@U)
(declare-fun PredicateMaskField (T@U) T@U)
(declare-fun FrameTypeType () T@T)
(declare-fun HasDirectPerm (T@U T@U T@U) Bool)
(declare-fun IsWandField (T@U) Bool)
(declare-fun WandMaskField (T@U) T@U)
(declare-fun |s0'| (T@U T@U) Int)
(declare-fun dummyFunction (T@U) Bool)
(declare-fun |s0#triggerStateless| (T@U) Int)
(declare-fun |s0Abstract'| (T@U T@U) Int)
(declare-fun |s0Abstract#triggerStateless| (T@U) Int)
(declare-fun |s1'| (T@U T@U) Int)
(declare-fun |s1#triggerStateless| (T@U) Int)
(declare-fun |s1Abstract'| (T@U T@U) Int)
(declare-fun |s1Abstract#triggerStateless| (T@U) Int)
(declare-fun |s2'| (T@U T@U) Int)
(declare-fun |s2#triggerStateless| (T@U) Int)
(declare-fun |i0'| (T@U T@U) Int)
(declare-fun |i0#triggerStateless| (T@U) Int)
(declare-fun |i0Abstract'| (T@U T@U) Int)
(declare-fun |i0Abstract#triggerStateless| (T@U) Int)
(declare-fun |i1'| (T@U T@U) Int)
(declare-fun |i1#triggerStateless| (T@U) Int)
(declare-fun |i1Abstract'| (T@U T@U) Int)
(declare-fun |i1Abstract#triggerStateless| (T@U) Int)
(declare-fun |e0'| (T@U T@U) Int)
(declare-fun |e0#triggerStateless| (T@U) Int)
(declare-fun |e0Abstract'| (T@U T@U) Int)
(declare-fun |e0Abstract#triggerStateless| (T@U) Int)
(declare-fun |e1'| (T@U T@U) Int)
(declare-fun |e1#triggerStateless| (T@U) Int)
(declare-fun |e1Abstract'| (T@U T@U) Int)
(declare-fun |e1Abstract#triggerStateless| (T@U) Int)
(declare-fun |ie0'| (T@U T@U) Int)
(declare-fun |ie0#triggerStateless| (T@U) Int)
(declare-fun |ie0Abstract'| (T@U T@U) Int)
(declare-fun |ie0Abstract#triggerStateless| (T@U) Int)
(declare-fun |ie1'| (T@U T@U) Int)
(declare-fun |ie1#triggerStateless| (T@U) Int)
(declare-fun |ie1Abstract'| (T@U T@U) Int)
(declare-fun |ie1Abstract#triggerStateless| (T@U) Int)
(declare-fun |t1'| (T@U T@U) Int)
(declare-fun |t1#triggerStateless| (T@U) Int)
(declare-fun |t1Abstract'| (T@U T@U) Int)
(declare-fun |t1Abstract#triggerStateless| (T@U) Int)
(declare-fun |t2'| (T@U T@U) Int)
(declare-fun |t2#triggerStateless| (T@U) Int)
(declare-fun |t2Abstract'| (T@U T@U) Int)
(declare-fun |t2Abstract#triggerStateless| (T@U) Int)
(declare-fun |t3'| (T@U T@U) Int)
(declare-fun |t3#triggerStateless| (T@U) Int)
(declare-fun |t3Abstract'| (T@U T@U) Int)
(declare-fun |t3Abstract#triggerStateless| (T@U) Int)
(declare-fun |t4'| (T@U T@U) Int)
(declare-fun |t4#triggerStateless| (T@U) Int)
(declare-fun |t4Abstract'| (T@U T@U) Int)
(declare-fun |t4Abstract#triggerStateless| (T@U) Int)
(declare-fun |t5'| (T@U T@U) Int)
(declare-fun |t5#triggerStateless| (T@U) Int)
(declare-fun |t5Abstract'| (T@U T@U) Int)
(declare-fun |t5Abstract#triggerStateless| (T@U) Int)
(declare-fun |t6'| (T@U T@U) Int)
(declare-fun |t6#triggerStateless| (T@U) Int)
(declare-fun |t6Abstract'| (T@U T@U) Int)
(declare-fun |t6Abstract#triggerStateless| (T@U) Int)
(declare-fun s0 (T@U T@U) Int)
(declare-fun s0Abstract (T@U T@U) Int)
(declare-fun s1 (T@U T@U) Int)
(declare-fun s1Abstract (T@U T@U) Int)
(declare-fun s2 (T@U T@U) Int)
(declare-fun i0 (T@U T@U) Int)
(declare-fun i0Abstract (T@U T@U) Int)
(declare-fun i1 (T@U T@U) Int)
(declare-fun i1Abstract (T@U T@U) Int)
(declare-fun e0 (T@U T@U) Int)
(declare-fun e0Abstract (T@U T@U) Int)
(declare-fun e1 (T@U T@U) Int)
(declare-fun e1Abstract (T@U T@U) Int)
(declare-fun ie0 (T@U T@U) Int)
(declare-fun ie0Abstract (T@U T@U) Int)
(declare-fun ie1 (T@U T@U) Int)
(declare-fun ie1Abstract (T@U T@U) Int)
(declare-fun t1 (T@U T@U) Int)
(declare-fun t1Abstract (T@U T@U) Int)
(declare-fun t2 (T@U T@U) Int)
(declare-fun t2Abstract (T@U T@U) Int)
(declare-fun t3 (T@U T@U) Int)
(declare-fun t3Abstract (T@U T@U) Int)
(declare-fun t4 (T@U T@U) Int)
(declare-fun t4Abstract (T@U T@U) Int)
(declare-fun t5 (T@U T@U) Int)
(declare-fun t5Abstract (T@U T@U) Int)
(declare-fun t6 (T@U T@U) Int)
(declare-fun t6Abstract (T@U T@U) Int)
(declare-fun AssumeFunctionsAbove () Int)
(declare-fun dummyHeap () T@U)
(declare-fun ZeroMask () T@U)
(declare-fun InsidePredicate (T@U T@U T@U T@U) Bool)
(declare-fun sumMask (T@U T@U T@U) Bool)
(declare-fun ConditionalFrame (Real T@U) T@U)
(declare-fun EmptyFrame () T@U)
(declare-fun NoPerm () Real)
(declare-fun |t5#trigger| (T@U T@U) Bool)
(declare-fun FrameFragment (T@U) T@U)
(declare-fun |t5Abstract#trigger| (T@U T@U) Bool)
(declare-fun FullPerm () Real)
(declare-fun |s0#frame| (T@U T@U) Int)
(declare-fun |s0Abstract#frame| (T@U T@U) Int)
(declare-fun |s1#frame| (T@U T@U) Int)
(declare-fun |s1Abstract#frame| (T@U T@U) Int)
(declare-fun |s2#frame| (T@U T@U) Int)
(declare-fun |i0#frame| (T@U T@U) Int)
(declare-fun |i0Abstract#frame| (T@U T@U) Int)
(declare-fun |i1#frame| (T@U T@U) Int)
(declare-fun |i1Abstract#frame| (T@U T@U) Int)
(declare-fun |e0#frame| (T@U T@U) Int)
(declare-fun |e0Abstract#frame| (T@U T@U) Int)
(declare-fun |e1#frame| (T@U T@U) Int)
(declare-fun |e1Abstract#frame| (T@U T@U) Int)
(declare-fun |ie0#frame| (T@U T@U) Int)
(declare-fun |ie0Abstract#frame| (T@U T@U) Int)
(declare-fun |ie1#frame| (T@U T@U) Int)
(declare-fun |ie1Abstract#frame| (T@U T@U) Int)
(declare-fun |t1#frame| (T@U T@U) Int)
(declare-fun |t1Abstract#frame| (T@U T@U) Int)
(declare-fun |t3#frame| (T@U T@U) Int)
(declare-fun |t3Abstract#frame| (T@U T@U) Int)
(declare-fun |t6#frame| (T@U T@U) Int)
(declare-fun |t6Abstract#frame| (T@U T@U) Int)
(declare-fun |i1Abstract#trigger| (T@U T@U) Bool)
(declare-fun |ie1Abstract#trigger| (T@U T@U) Bool)
(declare-fun |ie1#trigger| (T@U T@U) Bool)
(declare-fun |t6#trigger| (T@U T@U) Bool)
(declare-fun |t6Abstract#trigger| (T@U T@U) Bool)
(declare-fun |s1Abstract#trigger| (T@U T@U) Bool)
(declare-fun |i1#trigger| (T@U T@U) Bool)
(declare-fun |s1#trigger| (T@U T@U) Bool)
(declare-fun |t2#frame| (T@U T@U) Int)
(declare-fun |t2Abstract#frame| (T@U T@U) Int)
(declare-fun |t4#frame| (T@U T@U) Int)
(declare-fun |t4Abstract#frame| (T@U T@U) Int)
(declare-fun |t5#frame| (T@U T@U) Int)
(declare-fun |t5Abstract#frame| (T@U T@U) Int)
(declare-fun ZeroPMask () T@U)
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
))) (= (Ctor NormalFieldType) 7)) (= (type $allocated) (FieldType NormalFieldType boolType))) (= (type x@@8) (FieldType NormalFieldType intType))))
(assert (distinct $allocated x@@8)
)
(assert  (and (and (and (and (and (and (forall ((arg0@@14 T@T) ) (! (= (Ctor (MapType0Type arg0@@14)) 8)
 :qid |ctor:MapType0Type|
)) (forall ((arg0@@15 T@T) ) (! (= (MapType0TypeInv0 (MapType0Type arg0@@15)) arg0@@15)
 :qid |typeInv:MapType0TypeInv0|
 :pattern ( (MapType0Type arg0@@15))
))) (forall ((arg0@@16 T@U) (arg1@@2 T@U) (arg2 T@U) ) (! (let ((B (FieldTypeInv1 (type arg2))))
(= (type (MapType0Select arg0@@16 arg1@@2 arg2)) B))
 :qid |funType:MapType0Select|
 :pattern ( (MapType0Select arg0@@16 arg1@@2 arg2))
))) (forall ((arg0@@17 T@U) (arg1@@3 T@U) (arg2@@0 T@U) (arg3 T@U) ) (! (let ((aVar0 (type arg1@@3)))
(= (type (MapType0Store arg0@@17 arg1@@3 arg2@@0 arg3)) (MapType0Type aVar0)))
 :qid |funType:MapType0Store|
 :pattern ( (MapType0Store arg0@@17 arg1@@3 arg2@@0 arg3))
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
)))) (= (Ctor RefType) 9)))
(assert (forall ((Heap0 T@U) (Heap1 T@U) ) (!  (=> (and (and (= (type Heap0) (MapType0Type RefType)) (= (type Heap1) (MapType0Type RefType))) (succHeap Heap0 Heap1)) (succHeapTrans Heap0 Heap1))
 :qid |stdinbpl.88:15|
 :skolemid |11|
 :pattern ( (succHeap Heap0 Heap1))
)))
(assert  (and (and (and (and (and (and (forall ((arg0@@18 T@T) (arg1@@4 T@T) ) (! (= (Ctor (MapType1Type arg0@@18 arg1@@4)) 10)
 :qid |ctor:MapType1Type|
)) (forall ((arg0@@19 T@T) (arg1@@5 T@T) ) (! (= (MapType1TypeInv0 (MapType1Type arg0@@19 arg1@@5)) arg0@@19)
 :qid |typeInv:MapType1TypeInv0|
 :pattern ( (MapType1Type arg0@@19 arg1@@5))
))) (forall ((arg0@@20 T@T) (arg1@@6 T@T) ) (! (= (MapType1TypeInv1 (MapType1Type arg0@@20 arg1@@6)) arg1@@6)
 :qid |typeInv:MapType1TypeInv1|
 :pattern ( (MapType1Type arg0@@20 arg1@@6))
))) (forall ((arg0@@21 T@U) (arg1@@7 T@U) (arg2@@1 T@U) ) (! (let ((aVar1 (MapType1TypeInv1 (type arg0@@21))))
(= (type (MapType1Select arg0@@21 arg1@@7 arg2@@1)) aVar1))
 :qid |funType:MapType1Select|
 :pattern ( (MapType1Select arg0@@21 arg1@@7 arg2@@1))
))) (forall ((arg0@@22 T@U) (arg1@@8 T@U) (arg2@@2 T@U) (arg3@@0 T@U) ) (! (let ((aVar1@@0 (type arg3@@0)))
(let ((aVar0@@0 (type arg1@@8)))
(= (type (MapType1Store arg0@@22 arg1@@8 arg2@@2 arg3@@0)) (MapType1Type aVar0@@0 aVar1@@0))))
 :qid |funType:MapType1Store|
 :pattern ( (MapType1Store arg0@@22 arg1@@8 arg2@@2 arg3@@0))
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
(assert  (and (and (= (Ctor FrameTypeType) 11) (= (type null) RefType)) (forall ((arg0@@23 T@U) ) (! (let ((A (FieldTypeInv0 (type arg0@@23))))
(= (type (PredicateMaskField arg0@@23)) (FieldType A (MapType1Type RefType boolType))))
 :qid |funType:PredicateMaskField|
 :pattern ( (PredicateMaskField arg0@@23))
))))
(assert (forall ((Heap@@0 T@U) (ExhaleHeap T@U) (Mask@@0 T@U) (pm_f T@U) ) (! (let ((C (FieldTypeInv0 (type pm_f))))
 (=> (and (and (and (and (and (= (type Heap@@0) (MapType0Type RefType)) (= (type ExhaleHeap) (MapType0Type RefType))) (= (type Mask@@0) (MapType1Type RefType realType))) (= (type pm_f) (FieldType C FrameTypeType))) (IdenticalOnKnownLocations Heap@@0 ExhaleHeap Mask@@0)) (and (HasDirectPerm Mask@@0 null pm_f) (IsPredicateField pm_f))) (= (MapType0Select Heap@@0 null (PredicateMaskField pm_f)) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))))
 :qid |stdinbpl.47:19|
 :skolemid |2|
 :pattern ( (IdenticalOnKnownLocations Heap@@0 ExhaleHeap Mask@@0) (IsPredicateField pm_f) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))
)))
(assert (forall ((arg0@@24 T@U) ) (! (let ((A@@0 (FieldTypeInv0 (type arg0@@24))))
(= (type (WandMaskField arg0@@24)) (FieldType A@@0 (MapType1Type RefType boolType))))
 :qid |funType:WandMaskField|
 :pattern ( (WandMaskField arg0@@24))
)))
(assert (forall ((Heap@@1 T@U) (ExhaleHeap@@0 T@U) (Mask@@1 T@U) (pm_f@@0 T@U) ) (! (let ((C@@0 (FieldTypeInv0 (type pm_f@@0))))
 (=> (and (and (and (and (and (= (type Heap@@1) (MapType0Type RefType)) (= (type ExhaleHeap@@0) (MapType0Type RefType))) (= (type Mask@@1) (MapType1Type RefType realType))) (= (type pm_f@@0) (FieldType C@@0 FrameTypeType))) (IdenticalOnKnownLocations Heap@@1 ExhaleHeap@@0 Mask@@1)) (and (HasDirectPerm Mask@@1 null pm_f@@0) (IsWandField pm_f@@0))) (= (MapType0Select Heap@@1 null (WandMaskField pm_f@@0)) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))))
 :qid |stdinbpl.60:19|
 :skolemid |5|
 :pattern ( (IdenticalOnKnownLocations Heap@@1 ExhaleHeap@@0 Mask@@1) (IsWandField pm_f@@0) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))
)))
(assert (forall ((Heap@@2 T@U) (this T@U) ) (!  (=> (and (= (type Heap@@2) (MapType0Type RefType)) (= (type this) RefType)) (dummyFunction (int_2_U (|s0#triggerStateless| this))))
 :qid |stdinbpl.225:15|
 :skolemid |23|
 :pattern ( (|s0'| Heap@@2 this))
)))
(assert (forall ((Heap@@3 T@U) (this@@0 T@U) ) (!  (=> (and (= (type Heap@@3) (MapType0Type RefType)) (= (type this@@0) RefType)) (dummyFunction (int_2_U (|s0Abstract#triggerStateless| this@@0))))
 :qid |stdinbpl.284:15|
 :skolemid |27|
 :pattern ( (|s0Abstract'| Heap@@3 this@@0))
)))
(assert (forall ((Heap@@4 T@U) (this@@1 T@U) ) (!  (=> (and (= (type Heap@@4) (MapType0Type RefType)) (= (type this@@1) RefType)) (dummyFunction (int_2_U (|s1#triggerStateless| this@@1))))
 :qid |stdinbpl.334:15|
 :skolemid |30|
 :pattern ( (|s1'| Heap@@4 this@@1))
)))
(assert (forall ((Heap@@5 T@U) (this@@2 T@U) ) (!  (=> (and (= (type Heap@@5) (MapType0Type RefType)) (= (type this@@2) RefType)) (dummyFunction (int_2_U (|s1Abstract#triggerStateless| this@@2))))
 :qid |stdinbpl.404:15|
 :skolemid |35|
 :pattern ( (|s1Abstract'| Heap@@5 this@@2))
)))
(assert (forall ((Heap@@6 T@U) (this@@3 T@U) ) (!  (=> (and (= (type Heap@@6) (MapType0Type RefType)) (= (type this@@3) RefType)) (dummyFunction (int_2_U (|s2#triggerStateless| this@@3))))
 :qid |stdinbpl.460:15|
 :skolemid |39|
 :pattern ( (|s2'| Heap@@6 this@@3))
)))
(assert (forall ((Heap@@7 T@U) (this@@4 T@U) ) (!  (=> (and (= (type Heap@@7) (MapType0Type RefType)) (= (type this@@4) RefType)) (dummyFunction (int_2_U (|i0#triggerStateless| this@@4))))
 :qid |stdinbpl.520:15|
 :skolemid |43|
 :pattern ( (|i0'| Heap@@7 this@@4))
)))
(assert (forall ((Heap@@8 T@U) (this@@5 T@U) ) (!  (=> (and (= (type Heap@@8) (MapType0Type RefType)) (= (type this@@5) RefType)) (dummyFunction (int_2_U (|i0Abstract#triggerStateless| this@@5))))
 :qid |stdinbpl.587:15|
 :skolemid |47|
 :pattern ( (|i0Abstract'| Heap@@8 this@@5))
)))
(assert (forall ((Heap@@9 T@U) (this@@6 T@U) ) (!  (=> (and (= (type Heap@@9) (MapType0Type RefType)) (= (type this@@6) RefType)) (dummyFunction (int_2_U (|i1#triggerStateless| this@@6))))
 :qid |stdinbpl.645:15|
 :skolemid |50|
 :pattern ( (|i1'| Heap@@9 this@@6))
)))
(assert (forall ((Heap@@10 T@U) (this@@7 T@U) ) (!  (=> (and (= (type Heap@@10) (MapType0Type RefType)) (= (type this@@7) RefType)) (dummyFunction (int_2_U (|i1Abstract#triggerStateless| this@@7))))
 :qid |stdinbpl.721:15|
 :skolemid |55|
 :pattern ( (|i1Abstract'| Heap@@10 this@@7))
)))
(assert (forall ((Heap@@11 T@U) (this@@8 T@U) ) (!  (=> (and (= (type Heap@@11) (MapType0Type RefType)) (= (type this@@8) RefType)) (dummyFunction (int_2_U (|e0#triggerStateless| this@@8))))
 :qid |stdinbpl.785:15|
 :skolemid |59|
 :pattern ( (|e0'| Heap@@11 this@@8))
)))
(assert (forall ((Heap@@12 T@U) (this@@9 T@U) ) (!  (=> (and (= (type Heap@@12) (MapType0Type RefType)) (= (type this@@9) RefType)) (dummyFunction (int_2_U (|e0Abstract#triggerStateless| this@@9))))
 :qid |stdinbpl.852:15|
 :skolemid |63|
 :pattern ( (|e0Abstract'| Heap@@12 this@@9))
)))
(assert (forall ((Heap@@13 T@U) (this@@10 T@U) ) (!  (=> (and (= (type Heap@@13) (MapType0Type RefType)) (= (type this@@10) RefType)) (dummyFunction (int_2_U (|e1#triggerStateless| this@@10))))
 :qid |stdinbpl.910:15|
 :skolemid |66|
 :pattern ( (|e1'| Heap@@13 this@@10))
)))
(assert (forall ((Heap@@14 T@U) (this@@11 T@U) ) (!  (=> (and (= (type Heap@@14) (MapType0Type RefType)) (= (type this@@11) RefType)) (dummyFunction (int_2_U (|e1Abstract#triggerStateless| this@@11))))
 :qid |stdinbpl.985:15|
 :skolemid |70|
 :pattern ( (|e1Abstract'| Heap@@14 this@@11))
)))
(assert (forall ((Heap@@15 T@U) (this@@12 T@U) ) (!  (=> (and (= (type Heap@@15) (MapType0Type RefType)) (= (type this@@12) RefType)) (dummyFunction (int_2_U (|ie0#triggerStateless| this@@12))))
 :qid |stdinbpl.1046:15|
 :skolemid |73|
 :pattern ( (|ie0'| Heap@@15 this@@12))
)))
(assert (forall ((Heap@@16 T@U) (this@@13 T@U) ) (!  (=> (and (= (type Heap@@16) (MapType0Type RefType)) (= (type this@@13) RefType)) (dummyFunction (int_2_U (|ie0Abstract#triggerStateless| this@@13))))
 :qid |stdinbpl.1119:15|
 :skolemid |77|
 :pattern ( (|ie0Abstract'| Heap@@16 this@@13))
)))
(assert (forall ((Heap@@17 T@U) (this@@14 T@U) ) (!  (=> (and (= (type Heap@@17) (MapType0Type RefType)) (= (type this@@14) RefType)) (dummyFunction (int_2_U (|ie1#triggerStateless| this@@14))))
 :qid |stdinbpl.1183:15|
 :skolemid |80|
 :pattern ( (|ie1'| Heap@@17 this@@14))
)))
(assert (forall ((Heap@@18 T@U) (this@@15 T@U) ) (!  (=> (and (= (type Heap@@18) (MapType0Type RefType)) (= (type this@@15) RefType)) (dummyFunction (int_2_U (|ie1Abstract#triggerStateless| this@@15))))
 :qid |stdinbpl.1267:15|
 :skolemid |85|
 :pattern ( (|ie1Abstract'| Heap@@18 this@@15))
)))
(assert (forall ((Heap@@19 T@U) (this@@16 T@U) ) (!  (=> (and (= (type Heap@@19) (MapType0Type RefType)) (= (type this@@16) RefType)) (dummyFunction (int_2_U (|t1#triggerStateless| this@@16))))
 :qid |stdinbpl.1337:15|
 :skolemid |89|
 :pattern ( (|t1'| Heap@@19 this@@16))
)))
(assert (forall ((Heap@@20 T@U) (this@@17 T@U) ) (!  (=> (and (= (type Heap@@20) (MapType0Type RefType)) (= (type this@@17) RefType)) (dummyFunction (int_2_U (|t1Abstract#triggerStateless| this@@17))))
 :qid |stdinbpl.1411:15|
 :skolemid |93|
 :pattern ( (|t1Abstract'| Heap@@20 this@@17))
)))
(assert (forall ((Heap@@21 T@U) (this@@18 T@U) ) (!  (=> (and (= (type Heap@@21) (MapType0Type RefType)) (= (type this@@18) RefType)) (dummyFunction (int_2_U (|t2#triggerStateless| this@@18))))
 :qid |stdinbpl.1476:15|
 :skolemid |96|
 :pattern ( (|t2'| Heap@@21 this@@18))
)))
(assert (forall ((Heap@@22 T@U) (this@@19 T@U) ) (!  (=> (and (= (type Heap@@22) (MapType0Type RefType)) (= (type this@@19) RefType)) (dummyFunction (int_2_U (|t2Abstract#triggerStateless| this@@19))))
 :qid |stdinbpl.1550:15|
 :skolemid |100|
 :pattern ( (|t2Abstract'| Heap@@22 this@@19))
)))
(assert (forall ((Heap@@23 T@U) (this@@20 T@U) ) (!  (=> (and (= (type Heap@@23) (MapType0Type RefType)) (= (type this@@20) RefType)) (dummyFunction (int_2_U (|t3#triggerStateless| this@@20))))
 :qid |stdinbpl.1615:15|
 :skolemid |103|
 :pattern ( (|t3'| Heap@@23 this@@20))
)))
(assert (forall ((Heap@@24 T@U) (this@@21 T@U) ) (!  (=> (and (= (type Heap@@24) (MapType0Type RefType)) (= (type this@@21) RefType)) (dummyFunction (int_2_U (|t3Abstract#triggerStateless| this@@21))))
 :qid |stdinbpl.1711:15|
 :skolemid |107|
 :pattern ( (|t3Abstract'| Heap@@24 this@@21))
)))
(assert (forall ((Heap@@25 T@U) (this@@22 T@U) ) (!  (=> (and (= (type Heap@@25) (MapType0Type RefType)) (= (type this@@22) RefType)) (dummyFunction (int_2_U (|t4#triggerStateless| this@@22))))
 :qid |stdinbpl.1793:15|
 :skolemid |110|
 :pattern ( (|t4'| Heap@@25 this@@22))
)))
(assert (forall ((Heap@@26 T@U) (this@@23 T@U) ) (!  (=> (and (= (type Heap@@26) (MapType0Type RefType)) (= (type this@@23) RefType)) (dummyFunction (int_2_U (|t4Abstract#triggerStateless| this@@23))))
 :qid |stdinbpl.1889:15|
 :skolemid |114|
 :pattern ( (|t4Abstract'| Heap@@26 this@@23))
)))
(assert (forall ((Heap@@27 T@U) (this@@24 T@U) ) (!  (=> (and (= (type Heap@@27) (MapType0Type RefType)) (= (type this@@24) RefType)) (dummyFunction (int_2_U (|t5#triggerStateless| this@@24))))
 :qid |stdinbpl.1971:15|
 :skolemid |117|
 :pattern ( (|t5'| Heap@@27 this@@24))
)))
(assert (forall ((Heap@@28 T@U) (this@@25 T@U) ) (!  (=> (and (= (type Heap@@28) (MapType0Type RefType)) (= (type this@@25) RefType)) (dummyFunction (int_2_U (|t5Abstract#triggerStateless| this@@25))))
 :qid |stdinbpl.2063:15|
 :skolemid |122|
 :pattern ( (|t5Abstract'| Heap@@28 this@@25))
)))
(assert (forall ((Heap@@29 T@U) (this@@26 T@U) ) (!  (=> (and (= (type Heap@@29) (MapType0Type RefType)) (= (type this@@26) RefType)) (dummyFunction (int_2_U (|t6#triggerStateless| this@@26))))
 :qid |stdinbpl.2143:15|
 :skolemid |126|
 :pattern ( (|t6'| Heap@@29 this@@26))
)))
(assert (forall ((Heap@@30 T@U) (this@@27 T@U) ) (!  (=> (and (= (type Heap@@30) (MapType0Type RefType)) (= (type this@@27) RefType)) (dummyFunction (int_2_U (|t6Abstract#triggerStateless| this@@27))))
 :qid |stdinbpl.2235:15|
 :skolemid |131|
 :pattern ( (|t6Abstract'| Heap@@30 this@@27))
)))
(assert (forall ((Heap@@31 T@U) (ExhaleHeap@@1 T@U) (Mask@@2 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@31) (MapType0Type RefType)) (= (type ExhaleHeap@@1) (MapType0Type RefType))) (= (type Mask@@2) (MapType1Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@31 ExhaleHeap@@1 Mask@@2)) (U_2_bool (MapType0Select Heap@@31 o_1 $allocated))) (U_2_bool (MapType0Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.73:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@31 ExhaleHeap@@1 Mask@@2) (MapType0Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert (forall ((Heap@@32 T@U) (this@@28 T@U) ) (!  (=> (and (= (type Heap@@32) (MapType0Type RefType)) (= (type this@@28) RefType)) (and (= (s0 Heap@@32 this@@28) (|s0'| Heap@@32 this@@28)) (dummyFunction (int_2_U (|s0#triggerStateless| this@@28)))))
 :qid |stdinbpl.221:15|
 :skolemid |22|
 :pattern ( (s0 Heap@@32 this@@28))
)))
(assert (forall ((Heap@@33 T@U) (this@@29 T@U) ) (!  (=> (and (= (type Heap@@33) (MapType0Type RefType)) (= (type this@@29) RefType)) (and (= (s0Abstract Heap@@33 this@@29) (|s0Abstract'| Heap@@33 this@@29)) (dummyFunction (int_2_U (|s0Abstract#triggerStateless| this@@29)))))
 :qid |stdinbpl.280:15|
 :skolemid |26|
 :pattern ( (s0Abstract Heap@@33 this@@29))
)))
(assert (forall ((Heap@@34 T@U) (this@@30 T@U) ) (!  (=> (and (= (type Heap@@34) (MapType0Type RefType)) (= (type this@@30) RefType)) (and (= (s1 Heap@@34 this@@30) (|s1'| Heap@@34 this@@30)) (dummyFunction (int_2_U (|s1#triggerStateless| this@@30)))))
 :qid |stdinbpl.330:15|
 :skolemid |29|
 :pattern ( (s1 Heap@@34 this@@30))
)))
(assert (forall ((Heap@@35 T@U) (this@@31 T@U) ) (!  (=> (and (= (type Heap@@35) (MapType0Type RefType)) (= (type this@@31) RefType)) (and (= (s1Abstract Heap@@35 this@@31) (|s1Abstract'| Heap@@35 this@@31)) (dummyFunction (int_2_U (|s1Abstract#triggerStateless| this@@31)))))
 :qid |stdinbpl.400:15|
 :skolemid |34|
 :pattern ( (s1Abstract Heap@@35 this@@31))
)))
(assert (forall ((Heap@@36 T@U) (this@@32 T@U) ) (!  (=> (and (= (type Heap@@36) (MapType0Type RefType)) (= (type this@@32) RefType)) (and (= (s2 Heap@@36 this@@32) (|s2'| Heap@@36 this@@32)) (dummyFunction (int_2_U (|s2#triggerStateless| this@@32)))))
 :qid |stdinbpl.456:15|
 :skolemid |38|
 :pattern ( (s2 Heap@@36 this@@32))
)))
(assert (forall ((Heap@@37 T@U) (this@@33 T@U) ) (!  (=> (and (= (type Heap@@37) (MapType0Type RefType)) (= (type this@@33) RefType)) (and (= (i0 Heap@@37 this@@33) (|i0'| Heap@@37 this@@33)) (dummyFunction (int_2_U (|i0#triggerStateless| this@@33)))))
 :qid |stdinbpl.516:15|
 :skolemid |42|
 :pattern ( (i0 Heap@@37 this@@33))
)))
(assert (forall ((Heap@@38 T@U) (this@@34 T@U) ) (!  (=> (and (= (type Heap@@38) (MapType0Type RefType)) (= (type this@@34) RefType)) (and (= (i0Abstract Heap@@38 this@@34) (|i0Abstract'| Heap@@38 this@@34)) (dummyFunction (int_2_U (|i0Abstract#triggerStateless| this@@34)))))
 :qid |stdinbpl.583:15|
 :skolemid |46|
 :pattern ( (i0Abstract Heap@@38 this@@34))
)))
(assert (forall ((Heap@@39 T@U) (this@@35 T@U) ) (!  (=> (and (= (type Heap@@39) (MapType0Type RefType)) (= (type this@@35) RefType)) (and (= (i1 Heap@@39 this@@35) (|i1'| Heap@@39 this@@35)) (dummyFunction (int_2_U (|i1#triggerStateless| this@@35)))))
 :qid |stdinbpl.641:15|
 :skolemid |49|
 :pattern ( (i1 Heap@@39 this@@35))
)))
(assert (forall ((Heap@@40 T@U) (this@@36 T@U) ) (!  (=> (and (= (type Heap@@40) (MapType0Type RefType)) (= (type this@@36) RefType)) (and (= (i1Abstract Heap@@40 this@@36) (|i1Abstract'| Heap@@40 this@@36)) (dummyFunction (int_2_U (|i1Abstract#triggerStateless| this@@36)))))
 :qid |stdinbpl.717:15|
 :skolemid |54|
 :pattern ( (i1Abstract Heap@@40 this@@36))
)))
(assert (forall ((Heap@@41 T@U) (this@@37 T@U) ) (!  (=> (and (= (type Heap@@41) (MapType0Type RefType)) (= (type this@@37) RefType)) (and (= (e0 Heap@@41 this@@37) (|e0'| Heap@@41 this@@37)) (dummyFunction (int_2_U (|e0#triggerStateless| this@@37)))))
 :qid |stdinbpl.781:15|
 :skolemid |58|
 :pattern ( (e0 Heap@@41 this@@37))
)))
(assert (forall ((Heap@@42 T@U) (this@@38 T@U) ) (!  (=> (and (= (type Heap@@42) (MapType0Type RefType)) (= (type this@@38) RefType)) (and (= (e0Abstract Heap@@42 this@@38) (|e0Abstract'| Heap@@42 this@@38)) (dummyFunction (int_2_U (|e0Abstract#triggerStateless| this@@38)))))
 :qid |stdinbpl.848:15|
 :skolemid |62|
 :pattern ( (e0Abstract Heap@@42 this@@38))
)))
(assert (forall ((Heap@@43 T@U) (this@@39 T@U) ) (!  (=> (and (= (type Heap@@43) (MapType0Type RefType)) (= (type this@@39) RefType)) (and (= (e1 Heap@@43 this@@39) (|e1'| Heap@@43 this@@39)) (dummyFunction (int_2_U (|e1#triggerStateless| this@@39)))))
 :qid |stdinbpl.906:15|
 :skolemid |65|
 :pattern ( (e1 Heap@@43 this@@39))
)))
(assert (forall ((Heap@@44 T@U) (this@@40 T@U) ) (!  (=> (and (= (type Heap@@44) (MapType0Type RefType)) (= (type this@@40) RefType)) (and (= (e1Abstract Heap@@44 this@@40) (|e1Abstract'| Heap@@44 this@@40)) (dummyFunction (int_2_U (|e1Abstract#triggerStateless| this@@40)))))
 :qid |stdinbpl.981:15|
 :skolemid |69|
 :pattern ( (e1Abstract Heap@@44 this@@40))
)))
(assert (forall ((Heap@@45 T@U) (this@@41 T@U) ) (!  (=> (and (= (type Heap@@45) (MapType0Type RefType)) (= (type this@@41) RefType)) (and (= (ie0 Heap@@45 this@@41) (|ie0'| Heap@@45 this@@41)) (dummyFunction (int_2_U (|ie0#triggerStateless| this@@41)))))
 :qid |stdinbpl.1042:15|
 :skolemid |72|
 :pattern ( (ie0 Heap@@45 this@@41))
)))
(assert (forall ((Heap@@46 T@U) (this@@42 T@U) ) (!  (=> (and (= (type Heap@@46) (MapType0Type RefType)) (= (type this@@42) RefType)) (and (= (ie0Abstract Heap@@46 this@@42) (|ie0Abstract'| Heap@@46 this@@42)) (dummyFunction (int_2_U (|ie0Abstract#triggerStateless| this@@42)))))
 :qid |stdinbpl.1115:15|
 :skolemid |76|
 :pattern ( (ie0Abstract Heap@@46 this@@42))
)))
(assert (forall ((Heap@@47 T@U) (this@@43 T@U) ) (!  (=> (and (= (type Heap@@47) (MapType0Type RefType)) (= (type this@@43) RefType)) (and (= (ie1 Heap@@47 this@@43) (|ie1'| Heap@@47 this@@43)) (dummyFunction (int_2_U (|ie1#triggerStateless| this@@43)))))
 :qid |stdinbpl.1179:15|
 :skolemid |79|
 :pattern ( (ie1 Heap@@47 this@@43))
)))
(assert (forall ((Heap@@48 T@U) (this@@44 T@U) ) (!  (=> (and (= (type Heap@@48) (MapType0Type RefType)) (= (type this@@44) RefType)) (and (= (ie1Abstract Heap@@48 this@@44) (|ie1Abstract'| Heap@@48 this@@44)) (dummyFunction (int_2_U (|ie1Abstract#triggerStateless| this@@44)))))
 :qid |stdinbpl.1263:15|
 :skolemid |84|
 :pattern ( (ie1Abstract Heap@@48 this@@44))
)))
(assert (forall ((Heap@@49 T@U) (this@@45 T@U) ) (!  (=> (and (= (type Heap@@49) (MapType0Type RefType)) (= (type this@@45) RefType)) (and (= (t1 Heap@@49 this@@45) (|t1'| Heap@@49 this@@45)) (dummyFunction (int_2_U (|t1#triggerStateless| this@@45)))))
 :qid |stdinbpl.1333:15|
 :skolemid |88|
 :pattern ( (t1 Heap@@49 this@@45))
)))
(assert (forall ((Heap@@50 T@U) (this@@46 T@U) ) (!  (=> (and (= (type Heap@@50) (MapType0Type RefType)) (= (type this@@46) RefType)) (and (= (t1Abstract Heap@@50 this@@46) (|t1Abstract'| Heap@@50 this@@46)) (dummyFunction (int_2_U (|t1Abstract#triggerStateless| this@@46)))))
 :qid |stdinbpl.1407:15|
 :skolemid |92|
 :pattern ( (t1Abstract Heap@@50 this@@46))
)))
(assert (forall ((Heap@@51 T@U) (this@@47 T@U) ) (!  (=> (and (= (type Heap@@51) (MapType0Type RefType)) (= (type this@@47) RefType)) (and (= (t2 Heap@@51 this@@47) (|t2'| Heap@@51 this@@47)) (dummyFunction (int_2_U (|t2#triggerStateless| this@@47)))))
 :qid |stdinbpl.1472:15|
 :skolemid |95|
 :pattern ( (t2 Heap@@51 this@@47))
)))
(assert (forall ((Heap@@52 T@U) (this@@48 T@U) ) (!  (=> (and (= (type Heap@@52) (MapType0Type RefType)) (= (type this@@48) RefType)) (and (= (t2Abstract Heap@@52 this@@48) (|t2Abstract'| Heap@@52 this@@48)) (dummyFunction (int_2_U (|t2Abstract#triggerStateless| this@@48)))))
 :qid |stdinbpl.1546:15|
 :skolemid |99|
 :pattern ( (t2Abstract Heap@@52 this@@48))
)))
(assert (forall ((Heap@@53 T@U) (this@@49 T@U) ) (!  (=> (and (= (type Heap@@53) (MapType0Type RefType)) (= (type this@@49) RefType)) (and (= (t3 Heap@@53 this@@49) (|t3'| Heap@@53 this@@49)) (dummyFunction (int_2_U (|t3#triggerStateless| this@@49)))))
 :qid |stdinbpl.1611:15|
 :skolemid |102|
 :pattern ( (t3 Heap@@53 this@@49))
)))
(assert (forall ((Heap@@54 T@U) (this@@50 T@U) ) (!  (=> (and (= (type Heap@@54) (MapType0Type RefType)) (= (type this@@50) RefType)) (and (= (t3Abstract Heap@@54 this@@50) (|t3Abstract'| Heap@@54 this@@50)) (dummyFunction (int_2_U (|t3Abstract#triggerStateless| this@@50)))))
 :qid |stdinbpl.1707:15|
 :skolemid |106|
 :pattern ( (t3Abstract Heap@@54 this@@50))
)))
(assert (forall ((Heap@@55 T@U) (this@@51 T@U) ) (!  (=> (and (= (type Heap@@55) (MapType0Type RefType)) (= (type this@@51) RefType)) (and (= (t4 Heap@@55 this@@51) (|t4'| Heap@@55 this@@51)) (dummyFunction (int_2_U (|t4#triggerStateless| this@@51)))))
 :qid |stdinbpl.1789:15|
 :skolemid |109|
 :pattern ( (t4 Heap@@55 this@@51))
)))
(assert (forall ((Heap@@56 T@U) (this@@52 T@U) ) (!  (=> (and (= (type Heap@@56) (MapType0Type RefType)) (= (type this@@52) RefType)) (and (= (t4Abstract Heap@@56 this@@52) (|t4Abstract'| Heap@@56 this@@52)) (dummyFunction (int_2_U (|t4Abstract#triggerStateless| this@@52)))))
 :qid |stdinbpl.1885:15|
 :skolemid |113|
 :pattern ( (t4Abstract Heap@@56 this@@52))
)))
(assert (forall ((Heap@@57 T@U) (this@@53 T@U) ) (!  (=> (and (= (type Heap@@57) (MapType0Type RefType)) (= (type this@@53) RefType)) (and (= (t5 Heap@@57 this@@53) (|t5'| Heap@@57 this@@53)) (dummyFunction (int_2_U (|t5#triggerStateless| this@@53)))))
 :qid |stdinbpl.1967:15|
 :skolemid |116|
 :pattern ( (t5 Heap@@57 this@@53))
)))
(assert (forall ((Heap@@58 T@U) (this@@54 T@U) ) (!  (=> (and (= (type Heap@@58) (MapType0Type RefType)) (= (type this@@54) RefType)) (and (= (t5Abstract Heap@@58 this@@54) (|t5Abstract'| Heap@@58 this@@54)) (dummyFunction (int_2_U (|t5Abstract#triggerStateless| this@@54)))))
 :qid |stdinbpl.2059:15|
 :skolemid |121|
 :pattern ( (t5Abstract Heap@@58 this@@54))
)))
(assert (forall ((Heap@@59 T@U) (this@@55 T@U) ) (!  (=> (and (= (type Heap@@59) (MapType0Type RefType)) (= (type this@@55) RefType)) (and (= (t6 Heap@@59 this@@55) (|t6'| Heap@@59 this@@55)) (dummyFunction (int_2_U (|t6#triggerStateless| this@@55)))))
 :qid |stdinbpl.2139:15|
 :skolemid |125|
 :pattern ( (t6 Heap@@59 this@@55))
)))
(assert (forall ((Heap@@60 T@U) (this@@56 T@U) ) (!  (=> (and (= (type Heap@@60) (MapType0Type RefType)) (= (type this@@56) RefType)) (and (= (t6Abstract Heap@@60 this@@56) (|t6Abstract'| Heap@@60 this@@56)) (dummyFunction (int_2_U (|t6Abstract#triggerStateless| this@@56)))))
 :qid |stdinbpl.2231:15|
 :skolemid |130|
 :pattern ( (t6Abstract Heap@@60 this@@56))
)))
(assert (forall ((Heap@@61 T@U) (Mask@@3 T@U) (this@@57 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@61) (MapType0Type RefType)) (= (type Mask@@3) (MapType1Type RefType realType))) (= (type this@@57) RefType)) (and (state Heap@@61 Mask@@3) (< AssumeFunctionsAbove 9))) (= (U_2_int (MapType0Select Heap@@61 this@@57 x@@8)) 0)) (= (t4 Heap@@61 this@@57) 0))
 :qid |stdinbpl.1799:15|
 :skolemid |111|
 :pattern ( (state Heap@@61 Mask@@3) (t4 Heap@@61 this@@57))
)))
(assert (forall ((Heap@@62 T@U) (ExhaleHeap@@2 T@U) (Mask@@4 T@U) (o_1@@0 T@U) (f_2 T@U) ) (! (let ((B@@1 (FieldTypeInv1 (type f_2))))
(let ((A@@1 (FieldTypeInv0 (type f_2))))
 (=> (and (and (and (and (and (and (= (type Heap@@62) (MapType0Type RefType)) (= (type ExhaleHeap@@2) (MapType0Type RefType))) (= (type Mask@@4) (MapType1Type RefType realType))) (= (type o_1@@0) RefType)) (= (type f_2) (FieldType A@@1 B@@1))) (IdenticalOnKnownLocations Heap@@62 ExhaleHeap@@2 Mask@@4)) (HasDirectPerm Mask@@4 o_1@@0 f_2)) (= (MapType0Select Heap@@62 o_1@@0 f_2) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2)))))
 :qid |stdinbpl.42:22|
 :skolemid |1|
 :pattern ( (IdenticalOnKnownLocations Heap@@62 ExhaleHeap@@2 Mask@@4) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2))
)))
(assert  (and (= (type dummyHeap) (MapType0Type RefType)) (= (type ZeroMask) (MapType1Type RefType realType))))
(assert (state dummyHeap ZeroMask))
(assert (forall ((p T@U) (v_1 T@U) (w T@U) ) (! (let ((A@@2 (FieldTypeInv0 (type p))))
 (=> (and (and (= (type p) (FieldType A@@2 FrameTypeType)) (= (type v_1) FrameTypeType)) (= (type w) FrameTypeType)) (not (InsidePredicate p v_1 p w))))
 :qid |stdinbpl.201:19|
 :skolemid |21|
 :pattern ( (InsidePredicate p v_1 p w))
)))
(assert  (not (IsPredicateField x@@8)))
(assert  (not (IsWandField x@@8)))
(assert (forall ((Heap@@63 T@U) (ExhaleHeap@@3 T@U) (Mask@@5 T@U) ) (!  (=> (and (and (and (= (type Heap@@63) (MapType0Type RefType)) (= (type ExhaleHeap@@3) (MapType0Type RefType))) (= (type Mask@@5) (MapType1Type RefType realType))) (IdenticalOnKnownLocations Heap@@63 ExhaleHeap@@3 Mask@@5)) (succHeap Heap@@63 ExhaleHeap@@3))
 :qid |stdinbpl.83:15|
 :skolemid |10|
 :pattern ( (IdenticalOnKnownLocations Heap@@63 ExhaleHeap@@3 Mask@@5))
)))
(assert (forall ((Heap@@64 T@U) (Mask@@6 T@U) (this@@58 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@64) (MapType0Type RefType)) (= (type Mask@@6) (MapType1Type RefType realType))) (= (type this@@58) RefType)) (and (state Heap@@64 Mask@@6) (< AssumeFunctionsAbove 22))) (not (= this@@58 null))) (= (s2 Heap@@64 this@@58) (U_2_int (MapType0Select Heap@@64 this@@58 x@@8))))
 :qid |stdinbpl.466:15|
 :skolemid |40|
 :pattern ( (state Heap@@64 Mask@@6) (s2 Heap@@64 this@@58))
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
(assert  (and (forall ((arg0@@25 Real) (arg1@@9 T@U) ) (! (= (type (ConditionalFrame arg0@@25 arg1@@9)) FrameTypeType)
 :qid |funType:ConditionalFrame|
 :pattern ( (ConditionalFrame arg0@@25 arg1@@9))
)) (= (type EmptyFrame) FrameTypeType)))
(assert (forall ((p@@0 Real) (f_6 T@U) ) (!  (=> (= (type f_6) FrameTypeType) (= (ConditionalFrame p@@0 f_6) (ite (> p@@0 0.0) f_6 EmptyFrame)))
 :qid |stdinbpl.189:15|
 :skolemid |19|
 :pattern ( (ConditionalFrame p@@0 f_6))
)))
(assert (forall ((Mask@@7 T@U) (o_2@@0 T@U) (f_4@@0 T@U) ) (! (let ((B@@3 (FieldTypeInv1 (type f_4@@0))))
(let ((A@@4 (FieldTypeInv0 (type f_4@@0))))
 (=> (and (and (= (type Mask@@7) (MapType1Type RefType realType)) (= (type o_2@@0) RefType)) (= (type f_4@@0) (FieldType A@@4 B@@3))) (= (HasDirectPerm Mask@@7 o_2@@0 f_4@@0) (> (U_2_real (MapType1Select Mask@@7 o_2@@0 f_4@@0)) NoPerm)))))
 :qid |stdinbpl.133:22|
 :skolemid |17|
 :pattern ( (HasDirectPerm Mask@@7 o_2@@0 f_4@@0))
)))
(assert (forall ((o_2@@1 T@U) (f_4@@1 T@U) ) (! (let ((B@@4 (FieldTypeInv1 (type f_4@@1))))
(let ((A@@5 (FieldTypeInv0 (type f_4@@1))))
 (=> (and (= (type o_2@@1) RefType) (= (type f_4@@1) (FieldType A@@5 B@@4))) (= (U_2_real (MapType1Select ZeroMask o_2@@1 f_4@@1)) NoPerm))))
 :qid |stdinbpl.106:22|
 :skolemid |13|
 :pattern ( (MapType1Select ZeroMask o_2@@1 f_4@@1))
)))
(assert (forall ((arg0@@26 T@U) ) (! (= (type (FrameFragment arg0@@26)) FrameTypeType)
 :qid |funType:FrameFragment|
 :pattern ( (FrameFragment arg0@@26))
)))
(assert (forall ((Heap@@65 T@U) (Mask@@8 T@U) (this@@59 T@U) ) (!  (=> (and (and (and (= (type Heap@@65) (MapType0Type RefType)) (= (type Mask@@8) (MapType1Type RefType realType))) (= (type this@@59) RefType)) (and (state Heap@@65 Mask@@8) (or (< AssumeFunctionsAbove 10) (|t5#trigger| (FrameFragment (MapType0Select Heap@@65 this@@59 x@@8)) this@@59)))) (and (not (= this@@59 null)) (= (U_2_int (MapType0Select Heap@@65 this@@59 x@@8)) 0)))
 :qid |stdinbpl.1990:15|
 :skolemid |120|
 :pattern ( (state Heap@@65 Mask@@8) (|t5'| Heap@@65 this@@59))
)))
(assert (forall ((Heap@@66 T@U) (Mask@@9 T@U) (this@@60 T@U) ) (!  (=> (and (and (and (= (type Heap@@66) (MapType0Type RefType)) (= (type Mask@@9) (MapType1Type RefType realType))) (= (type this@@60) RefType)) (and (state Heap@@66 Mask@@9) (or (< AssumeFunctionsAbove 25) (|t5Abstract#trigger| (FrameFragment (MapType0Select Heap@@66 this@@60 x@@8)) this@@60)))) (and (not (= this@@60 null)) (= (U_2_int (MapType0Select Heap@@66 this@@60 x@@8)) 0)))
 :qid |stdinbpl.2076:15|
 :skolemid |124|
 :pattern ( (state Heap@@66 Mask@@9) (|t5Abstract'| Heap@@66 this@@60))
)))
(assert (forall ((Heap@@67 T@U) (Mask@@10 T@U) (this@@61 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@67) (MapType0Type RefType)) (= (type Mask@@10) (MapType1Type RefType realType))) (= (type this@@61) RefType)) (and (state Heap@@67 Mask@@10) (< AssumeFunctionsAbove 8))) (and (not (= this@@61 null)) (= (U_2_int (MapType0Select Heap@@67 this@@61 x@@8)) 0))) (= (t1 Heap@@67 this@@61) 0))
 :qid |stdinbpl.1343:15|
 :skolemid |90|
 :pattern ( (state Heap@@67 Mask@@10) (t1 Heap@@67 this@@61))
)))
(assert (forall ((Heap@@68 T@U) (Mask@@11 T@U) (this@@62 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@68) (MapType0Type RefType)) (= (type Mask@@11) (MapType1Type RefType realType))) (= (type this@@62) RefType)) (and (state Heap@@68 Mask@@11) (< AssumeFunctionsAbove 11))) (and (not (= this@@62 null)) (= (U_2_int (MapType0Select Heap@@68 this@@62 x@@8)) 0))) (= (e0 Heap@@68 this@@62) 0))
 :qid |stdinbpl.791:15|
 :skolemid |60|
 :pattern ( (state Heap@@68 Mask@@11) (e0 Heap@@68 this@@62))
)))
(assert (forall ((Heap@@69 T@U) (Mask@@12 T@U) (this@@63 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@69) (MapType0Type RefType)) (= (type Mask@@12) (MapType1Type RefType realType))) (= (type this@@63) RefType)) (and (state Heap@@69 Mask@@12) (< AssumeFunctionsAbove 21))) (and (not (= this@@63 null)) (= (U_2_int (MapType0Select Heap@@69 this@@63 x@@8)) 0))) (= (ie0 Heap@@69 this@@63) 0))
 :qid |stdinbpl.1052:15|
 :skolemid |74|
 :pattern ( (state Heap@@69 Mask@@12) (ie0 Heap@@69 this@@63))
)))
(assert (forall ((Heap@@70 T@U) (Mask@@13 T@U) (this@@64 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@70) (MapType0Type RefType)) (= (type Mask@@13) (MapType1Type RefType realType))) (= (type this@@64) RefType)) (and (state Heap@@70 Mask@@13) (< AssumeFunctionsAbove 28))) (and (not (= this@@64 null)) (= (U_2_int (MapType0Select Heap@@70 this@@64 x@@8)) 0))) (= (s0 Heap@@70 this@@64) 0))
 :qid |stdinbpl.231:15|
 :skolemid |24|
 :pattern ( (state Heap@@70 Mask@@13) (s0 Heap@@70 this@@64))
)))
(assert (forall ((Heap@@71 T@U) (ExhaleHeap@@4 T@U) (Mask@@14 T@U) (pm_f@@1 T@U) ) (! (let ((C@@1 (FieldTypeInv0 (type pm_f@@1))))
 (=> (and (and (and (and (and (= (type Heap@@71) (MapType0Type RefType)) (= (type ExhaleHeap@@4) (MapType0Type RefType))) (= (type Mask@@14) (MapType1Type RefType realType))) (= (type pm_f@@1) (FieldType C@@1 FrameTypeType))) (IdenticalOnKnownLocations Heap@@71 ExhaleHeap@@4 Mask@@14)) (and (HasDirectPerm Mask@@14 null pm_f@@1) (IsPredicateField pm_f@@1))) (forall ((o2 T@U) (f_2@@0 T@U) ) (! (let ((B@@5 (FieldTypeInv1 (type f_2@@0))))
(let ((A@@6 (FieldTypeInv0 (type f_2@@0))))
 (=> (and (and (= (type o2) RefType) (= (type f_2@@0) (FieldType A@@6 B@@5))) (U_2_bool (MapType1Select (MapType0Select Heap@@71 null (PredicateMaskField pm_f@@1)) o2 f_2@@0))) (= (MapType0Select Heap@@71 o2 f_2@@0) (MapType0Select ExhaleHeap@@4 o2 f_2@@0)))))
 :qid |stdinbpl.54:134|
 :skolemid |3|
 :pattern ( (MapType0Select ExhaleHeap@@4 o2 f_2@@0))
))))
 :qid |stdinbpl.52:19|
 :skolemid |4|
 :pattern ( (IdenticalOnKnownLocations Heap@@71 ExhaleHeap@@4 Mask@@14) (IsPredicateField pm_f@@1))
)))
(assert (forall ((Heap@@72 T@U) (ExhaleHeap@@5 T@U) (Mask@@15 T@U) (pm_f@@2 T@U) ) (! (let ((C@@2 (FieldTypeInv0 (type pm_f@@2))))
 (=> (and (and (and (and (and (= (type Heap@@72) (MapType0Type RefType)) (= (type ExhaleHeap@@5) (MapType0Type RefType))) (= (type Mask@@15) (MapType1Type RefType realType))) (= (type pm_f@@2) (FieldType C@@2 FrameTypeType))) (IdenticalOnKnownLocations Heap@@72 ExhaleHeap@@5 Mask@@15)) (and (HasDirectPerm Mask@@15 null pm_f@@2) (IsWandField pm_f@@2))) (forall ((o2@@0 T@U) (f_2@@1 T@U) ) (! (let ((B@@6 (FieldTypeInv1 (type f_2@@1))))
(let ((A@@7 (FieldTypeInv0 (type f_2@@1))))
 (=> (and (and (= (type o2@@0) RefType) (= (type f_2@@1) (FieldType A@@7 B@@6))) (U_2_bool (MapType1Select (MapType0Select Heap@@72 null (WandMaskField pm_f@@2)) o2@@0 f_2@@1))) (= (MapType0Select Heap@@72 o2@@0 f_2@@1) (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1)))))
 :qid |stdinbpl.67:129|
 :skolemid |6|
 :pattern ( (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1))
))))
 :qid |stdinbpl.65:19|
 :skolemid |7|
 :pattern ( (IdenticalOnKnownLocations Heap@@72 ExhaleHeap@@5 Mask@@15) (IsWandField pm_f@@2))
)))
(assert (forall ((Mask@@16 T@U) (o_2@@2 T@U) (f_4@@2 T@U) ) (! (let ((B@@7 (FieldTypeInv1 (type f_4@@2))))
(let ((A@@8 (FieldTypeInv0 (type f_4@@2))))
 (=> (and (and (and (= (type Mask@@16) (MapType1Type RefType realType)) (= (type o_2@@2) RefType)) (= (type f_4@@2) (FieldType A@@8 B@@7))) (GoodMask Mask@@16)) (and (>= (U_2_real (MapType1Select Mask@@16 o_2@@2 f_4@@2)) NoPerm) (=> (and (and (GoodMask Mask@@16) (not (IsPredicateField f_4@@2))) (not (IsWandField f_4@@2))) (<= (U_2_real (MapType1Select Mask@@16 o_2@@2 f_4@@2)) FullPerm))))))
 :qid |stdinbpl.128:22|
 :skolemid |16|
 :pattern ( (GoodMask Mask@@16) (MapType1Select Mask@@16 o_2@@2 f_4@@2))
)))
(assert (forall ((Heap@@73 T@U) (Mask@@17 T@U) (this@@65 T@U) ) (!  (=> (and (and (and (= (type Heap@@73) (MapType0Type RefType)) (= (type Mask@@17) (MapType1Type RefType realType))) (= (type this@@65) RefType)) (state Heap@@73 Mask@@17)) (= (|s0'| Heap@@73 this@@65) (|s0#frame| EmptyFrame this@@65)))
 :qid |stdinbpl.238:15|
 :skolemid |25|
 :pattern ( (state Heap@@73 Mask@@17) (|s0'| Heap@@73 this@@65))
)))
(assert (forall ((Heap@@74 T@U) (Mask@@18 T@U) (this@@66 T@U) ) (!  (=> (and (and (and (= (type Heap@@74) (MapType0Type RefType)) (= (type Mask@@18) (MapType1Type RefType realType))) (= (type this@@66) RefType)) (state Heap@@74 Mask@@18)) (= (|s0Abstract'| Heap@@74 this@@66) (|s0Abstract#frame| EmptyFrame this@@66)))
 :qid |stdinbpl.291:15|
 :skolemid |28|
 :pattern ( (state Heap@@74 Mask@@18) (|s0Abstract'| Heap@@74 this@@66))
)))
(assert (forall ((Heap@@75 T@U) (Mask@@19 T@U) (this@@67 T@U) ) (!  (=> (and (and (and (= (type Heap@@75) (MapType0Type RefType)) (= (type Mask@@19) (MapType1Type RefType realType))) (= (type this@@67) RefType)) (state Heap@@75 Mask@@19)) (= (|s1'| Heap@@75 this@@67) (|s1#frame| EmptyFrame this@@67)))
 :qid |stdinbpl.347:15|
 :skolemid |32|
 :pattern ( (state Heap@@75 Mask@@19) (|s1'| Heap@@75 this@@67))
)))
(assert (forall ((Heap@@76 T@U) (Mask@@20 T@U) (this@@68 T@U) ) (!  (=> (and (and (and (= (type Heap@@76) (MapType0Type RefType)) (= (type Mask@@20) (MapType1Type RefType realType))) (= (type this@@68) RefType)) (state Heap@@76 Mask@@20)) (= (|s1Abstract'| Heap@@76 this@@68) (|s1Abstract#frame| EmptyFrame this@@68)))
 :qid |stdinbpl.411:15|
 :skolemid |36|
 :pattern ( (state Heap@@76 Mask@@20) (|s1Abstract'| Heap@@76 this@@68))
)))
(assert (forall ((Heap@@77 T@U) (Mask@@21 T@U) (this@@69 T@U) ) (!  (=> (and (and (and (= (type Heap@@77) (MapType0Type RefType)) (= (type Mask@@21) (MapType1Type RefType realType))) (= (type this@@69) RefType)) (state Heap@@77 Mask@@21)) (= (|s2'| Heap@@77 this@@69) (|s2#frame| EmptyFrame this@@69)))
 :qid |stdinbpl.473:15|
 :skolemid |41|
 :pattern ( (state Heap@@77 Mask@@21) (|s2'| Heap@@77 this@@69))
)))
(assert (forall ((Heap@@78 T@U) (Mask@@22 T@U) (this@@70 T@U) ) (!  (=> (and (and (and (= (type Heap@@78) (MapType0Type RefType)) (= (type Mask@@22) (MapType1Type RefType realType))) (= (type this@@70) RefType)) (state Heap@@78 Mask@@22)) (= (|i0'| Heap@@78 this@@70) (|i0#frame| EmptyFrame this@@70)))
 :qid |stdinbpl.533:15|
 :skolemid |45|
 :pattern ( (state Heap@@78 Mask@@22) (|i0'| Heap@@78 this@@70))
)))
(assert (forall ((Heap@@79 T@U) (Mask@@23 T@U) (this@@71 T@U) ) (!  (=> (and (and (and (= (type Heap@@79) (MapType0Type RefType)) (= (type Mask@@23) (MapType1Type RefType realType))) (= (type this@@71) RefType)) (state Heap@@79 Mask@@23)) (= (|i0Abstract'| Heap@@79 this@@71) (|i0Abstract#frame| EmptyFrame this@@71)))
 :qid |stdinbpl.594:15|
 :skolemid |48|
 :pattern ( (state Heap@@79 Mask@@23) (|i0Abstract'| Heap@@79 this@@71))
)))
(assert (forall ((Heap@@80 T@U) (Mask@@24 T@U) (this@@72 T@U) ) (!  (=> (and (and (and (= (type Heap@@80) (MapType0Type RefType)) (= (type Mask@@24) (MapType1Type RefType realType))) (= (type this@@72) RefType)) (state Heap@@80 Mask@@24)) (= (|i1'| Heap@@80 this@@72) (|i1#frame| EmptyFrame this@@72)))
 :qid |stdinbpl.658:15|
 :skolemid |52|
 :pattern ( (state Heap@@80 Mask@@24) (|i1'| Heap@@80 this@@72))
)))
(assert (forall ((Heap@@81 T@U) (Mask@@25 T@U) (this@@73 T@U) ) (!  (=> (and (and (and (= (type Heap@@81) (MapType0Type RefType)) (= (type Mask@@25) (MapType1Type RefType realType))) (= (type this@@73) RefType)) (state Heap@@81 Mask@@25)) (= (|i1Abstract'| Heap@@81 this@@73) (|i1Abstract#frame| EmptyFrame this@@73)))
 :qid |stdinbpl.728:15|
 :skolemid |56|
 :pattern ( (state Heap@@81 Mask@@25) (|i1Abstract'| Heap@@81 this@@73))
)))
(assert (forall ((Heap@@82 T@U) (Mask@@26 T@U) (this@@74 T@U) ) (!  (=> (and (and (and (= (type Heap@@82) (MapType0Type RefType)) (= (type Mask@@26) (MapType1Type RefType realType))) (= (type this@@74) RefType)) (state Heap@@82 Mask@@26)) (= (|e0'| Heap@@82 this@@74) (|e0#frame| EmptyFrame this@@74)))
 :qid |stdinbpl.798:15|
 :skolemid |61|
 :pattern ( (state Heap@@82 Mask@@26) (|e0'| Heap@@82 this@@74))
)))
(assert (forall ((Heap@@83 T@U) (Mask@@27 T@U) (this@@75 T@U) ) (!  (=> (and (and (and (= (type Heap@@83) (MapType0Type RefType)) (= (type Mask@@27) (MapType1Type RefType realType))) (= (type this@@75) RefType)) (state Heap@@83 Mask@@27)) (= (|e0Abstract'| Heap@@83 this@@75) (|e0Abstract#frame| EmptyFrame this@@75)))
 :qid |stdinbpl.859:15|
 :skolemid |64|
 :pattern ( (state Heap@@83 Mask@@27) (|e0Abstract'| Heap@@83 this@@75))
)))
(assert (forall ((Heap@@84 T@U) (Mask@@28 T@U) (this@@76 T@U) ) (!  (=> (and (and (and (= (type Heap@@84) (MapType0Type RefType)) (= (type Mask@@28) (MapType1Type RefType realType))) (= (type this@@76) RefType)) (state Heap@@84 Mask@@28)) (= (|e1'| Heap@@84 this@@76) (|e1#frame| EmptyFrame this@@76)))
 :qid |stdinbpl.923:15|
 :skolemid |68|
 :pattern ( (state Heap@@84 Mask@@28) (|e1'| Heap@@84 this@@76))
)))
(assert (forall ((Heap@@85 T@U) (Mask@@29 T@U) (this@@77 T@U) ) (!  (=> (and (and (and (= (type Heap@@85) (MapType0Type RefType)) (= (type Mask@@29) (MapType1Type RefType realType))) (= (type this@@77) RefType)) (state Heap@@85 Mask@@29)) (= (|e1Abstract'| Heap@@85 this@@77) (|e1Abstract#frame| EmptyFrame this@@77)))
 :qid |stdinbpl.992:15|
 :skolemid |71|
 :pattern ( (state Heap@@85 Mask@@29) (|e1Abstract'| Heap@@85 this@@77))
)))
(assert (forall ((Heap@@86 T@U) (Mask@@30 T@U) (this@@78 T@U) ) (!  (=> (and (and (and (= (type Heap@@86) (MapType0Type RefType)) (= (type Mask@@30) (MapType1Type RefType realType))) (= (type this@@78) RefType)) (state Heap@@86 Mask@@30)) (= (|ie0'| Heap@@86 this@@78) (|ie0#frame| EmptyFrame this@@78)))
 :qid |stdinbpl.1059:15|
 :skolemid |75|
 :pattern ( (state Heap@@86 Mask@@30) (|ie0'| Heap@@86 this@@78))
)))
(assert (forall ((Heap@@87 T@U) (Mask@@31 T@U) (this@@79 T@U) ) (!  (=> (and (and (and (= (type Heap@@87) (MapType0Type RefType)) (= (type Mask@@31) (MapType1Type RefType realType))) (= (type this@@79) RefType)) (state Heap@@87 Mask@@31)) (= (|ie0Abstract'| Heap@@87 this@@79) (|ie0Abstract#frame| EmptyFrame this@@79)))
 :qid |stdinbpl.1126:15|
 :skolemid |78|
 :pattern ( (state Heap@@87 Mask@@31) (|ie0Abstract'| Heap@@87 this@@79))
)))
(assert (forall ((Heap@@88 T@U) (Mask@@32 T@U) (this@@80 T@U) ) (!  (=> (and (and (and (= (type Heap@@88) (MapType0Type RefType)) (= (type Mask@@32) (MapType1Type RefType realType))) (= (type this@@80) RefType)) (state Heap@@88 Mask@@32)) (= (|ie1'| Heap@@88 this@@80) (|ie1#frame| EmptyFrame this@@80)))
 :qid |stdinbpl.1196:15|
 :skolemid |82|
 :pattern ( (state Heap@@88 Mask@@32) (|ie1'| Heap@@88 this@@80))
)))
(assert (forall ((Heap@@89 T@U) (Mask@@33 T@U) (this@@81 T@U) ) (!  (=> (and (and (and (= (type Heap@@89) (MapType0Type RefType)) (= (type Mask@@33) (MapType1Type RefType realType))) (= (type this@@81) RefType)) (state Heap@@89 Mask@@33)) (= (|ie1Abstract'| Heap@@89 this@@81) (|ie1Abstract#frame| EmptyFrame this@@81)))
 :qid |stdinbpl.1274:15|
 :skolemid |86|
 :pattern ( (state Heap@@89 Mask@@33) (|ie1Abstract'| Heap@@89 this@@81))
)))
(assert (forall ((Heap@@90 T@U) (Mask@@34 T@U) (this@@82 T@U) ) (!  (=> (and (and (and (= (type Heap@@90) (MapType0Type RefType)) (= (type Mask@@34) (MapType1Type RefType realType))) (= (type this@@82) RefType)) (state Heap@@90 Mask@@34)) (= (|t1'| Heap@@90 this@@82) (|t1#frame| EmptyFrame this@@82)))
 :qid |stdinbpl.1350:15|
 :skolemid |91|
 :pattern ( (state Heap@@90 Mask@@34) (|t1'| Heap@@90 this@@82))
)))
(assert (forall ((Heap@@91 T@U) (Mask@@35 T@U) (this@@83 T@U) ) (!  (=> (and (and (and (= (type Heap@@91) (MapType0Type RefType)) (= (type Mask@@35) (MapType1Type RefType realType))) (= (type this@@83) RefType)) (state Heap@@91 Mask@@35)) (= (|t1Abstract'| Heap@@91 this@@83) (|t1Abstract#frame| EmptyFrame this@@83)))
 :qid |stdinbpl.1418:15|
 :skolemid |94|
 :pattern ( (state Heap@@91 Mask@@35) (|t1Abstract'| Heap@@91 this@@83))
)))
(assert (forall ((Heap@@92 T@U) (Mask@@36 T@U) (this@@84 T@U) ) (!  (=> (and (and (and (= (type Heap@@92) (MapType0Type RefType)) (= (type Mask@@36) (MapType1Type RefType realType))) (= (type this@@84) RefType)) (state Heap@@92 Mask@@36)) (= (|t3'| Heap@@92 this@@84) (|t3#frame| EmptyFrame this@@84)))
 :qid |stdinbpl.1628:15|
 :skolemid |105|
 :pattern ( (state Heap@@92 Mask@@36) (|t3'| Heap@@92 this@@84))
)))
(assert (forall ((Heap@@93 T@U) (Mask@@37 T@U) (this@@85 T@U) ) (!  (=> (and (and (and (= (type Heap@@93) (MapType0Type RefType)) (= (type Mask@@37) (MapType1Type RefType realType))) (= (type this@@85) RefType)) (state Heap@@93 Mask@@37)) (= (|t3Abstract'| Heap@@93 this@@85) (|t3Abstract#frame| EmptyFrame this@@85)))
 :qid |stdinbpl.1718:15|
 :skolemid |108|
 :pattern ( (state Heap@@93 Mask@@37) (|t3Abstract'| Heap@@93 this@@85))
)))
(assert (forall ((Heap@@94 T@U) (Mask@@38 T@U) (this@@86 T@U) ) (!  (=> (and (and (and (= (type Heap@@94) (MapType0Type RefType)) (= (type Mask@@38) (MapType1Type RefType realType))) (= (type this@@86) RefType)) (state Heap@@94 Mask@@38)) (= (|t6'| Heap@@94 this@@86) (|t6#frame| EmptyFrame this@@86)))
 :qid |stdinbpl.2156:15|
 :skolemid |128|
 :pattern ( (state Heap@@94 Mask@@38) (|t6'| Heap@@94 this@@86))
)))
(assert (forall ((Heap@@95 T@U) (Mask@@39 T@U) (this@@87 T@U) ) (!  (=> (and (and (and (= (type Heap@@95) (MapType0Type RefType)) (= (type Mask@@39) (MapType1Type RefType realType))) (= (type this@@87) RefType)) (state Heap@@95 Mask@@39)) (= (|t6Abstract'| Heap@@95 this@@87) (|t6Abstract#frame| EmptyFrame this@@87)))
 :qid |stdinbpl.2242:15|
 :skolemid |132|
 :pattern ( (state Heap@@95 Mask@@39) (|t6Abstract'| Heap@@95 this@@87))
)))
(assert (forall ((Heap@@96 T@U) (Mask@@40 T@U) (this@@88 T@U) ) (!  (=> (and (and (and (= (type Heap@@96) (MapType0Type RefType)) (= (type Mask@@40) (MapType1Type RefType realType))) (= (type this@@88) RefType)) (and (state Heap@@96 Mask@@40) (or (< AssumeFunctionsAbove 2) (|i1Abstract#trigger| EmptyFrame this@@88)))) (and (not (= this@@88 null)) (= (U_2_int (MapType0Select Heap@@96 this@@88 x@@8)) 0)))
 :qid |stdinbpl.734:15|
 :skolemid |57|
 :pattern ( (state Heap@@96 Mask@@40) (|i1Abstract'| Heap@@96 this@@88))
)))
(assert (forall ((Heap@@97 T@U) (Mask@@41 T@U) (this@@89 T@U) ) (!  (=> (and (and (and (= (type Heap@@97) (MapType0Type RefType)) (= (type Mask@@41) (MapType1Type RefType realType))) (= (type this@@89) RefType)) (and (state Heap@@97 Mask@@41) (or (< AssumeFunctionsAbove 3) (|ie1Abstract#trigger| EmptyFrame this@@89)))) (and (not (= this@@89 null)) (= (U_2_int (MapType0Select Heap@@97 this@@89 x@@8)) 0)))
 :qid |stdinbpl.1280:15|
 :skolemid |87|
 :pattern ( (state Heap@@97 Mask@@41) (|ie1Abstract'| Heap@@97 this@@89))
)))
(assert (forall ((Heap@@98 T@U) (Mask@@42 T@U) (this@@90 T@U) ) (!  (=> (and (and (and (= (type Heap@@98) (MapType0Type RefType)) (= (type Mask@@42) (MapType1Type RefType realType))) (= (type this@@90) RefType)) (and (state Heap@@98 Mask@@42) (or (< AssumeFunctionsAbove 7) (|ie1#trigger| EmptyFrame this@@90)))) (and (not (= this@@90 null)) (= (U_2_int (MapType0Select Heap@@98 this@@90 x@@8)) 0)))
 :qid |stdinbpl.1202:15|
 :skolemid |83|
 :pattern ( (state Heap@@98 Mask@@42) (|ie1'| Heap@@98 this@@90))
)))
(assert (forall ((Heap@@99 T@U) (Mask@@43 T@U) (this@@91 T@U) ) (!  (=> (and (and (and (= (type Heap@@99) (MapType0Type RefType)) (= (type Mask@@43) (MapType1Type RefType realType))) (= (type this@@91) RefType)) (and (state Heap@@99 Mask@@43) (or (< AssumeFunctionsAbove 16) (|t6#trigger| EmptyFrame this@@91)))) (and (not (= this@@91 null)) (= (U_2_int (MapType0Select Heap@@99 this@@91 x@@8)) 0)))
 :qid |stdinbpl.2162:15|
 :skolemid |129|
 :pattern ( (state Heap@@99 Mask@@43) (|t6'| Heap@@99 this@@91))
)))
(assert (forall ((Heap@@100 T@U) (Mask@@44 T@U) (this@@92 T@U) ) (!  (=> (and (and (and (= (type Heap@@100) (MapType0Type RefType)) (= (type Mask@@44) (MapType1Type RefType realType))) (= (type this@@92) RefType)) (and (state Heap@@100 Mask@@44) (or (< AssumeFunctionsAbove 19) (|t6Abstract#trigger| EmptyFrame this@@92)))) (and (not (= this@@92 null)) (= (U_2_int (MapType0Select Heap@@100 this@@92 x@@8)) 0)))
 :qid |stdinbpl.2248:15|
 :skolemid |133|
 :pattern ( (state Heap@@100 Mask@@44) (|t6Abstract'| Heap@@100 this@@92))
)))
(assert (forall ((Heap@@101 T@U) (Mask@@45 T@U) (this@@93 T@U) ) (!  (=> (and (and (and (= (type Heap@@101) (MapType0Type RefType)) (= (type Mask@@45) (MapType1Type RefType realType))) (= (type this@@93) RefType)) (and (state Heap@@101 Mask@@45) (or (< AssumeFunctionsAbove 20) (|s1Abstract#trigger| EmptyFrame this@@93)))) (and (not (= this@@93 null)) (= (U_2_int (MapType0Select Heap@@101 this@@93 x@@8)) 0)))
 :qid |stdinbpl.417:15|
 :skolemid |37|
 :pattern ( (state Heap@@101 Mask@@45) (|s1Abstract'| Heap@@101 this@@93))
)))
(assert (forall ((Heap@@102 T@U) (Mask@@46 T@U) (this@@94 T@U) ) (!  (=> (and (and (and (= (type Heap@@102) (MapType0Type RefType)) (= (type Mask@@46) (MapType1Type RefType realType))) (= (type this@@94) RefType)) (and (state Heap@@102 Mask@@46) (or (< AssumeFunctionsAbove 24) (|i1#trigger| EmptyFrame this@@94)))) (and (not (= this@@94 null)) (= (U_2_int (MapType0Select Heap@@102 this@@94 x@@8)) 0)))
 :qid |stdinbpl.664:15|
 :skolemid |53|
 :pattern ( (state Heap@@102 Mask@@46) (|i1'| Heap@@102 this@@94))
)))
(assert (forall ((Heap@@103 T@U) (Mask@@47 T@U) (this@@95 T@U) ) (!  (=> (and (and (and (= (type Heap@@103) (MapType0Type RefType)) (= (type Mask@@47) (MapType1Type RefType realType))) (= (type this@@95) RefType)) (and (state Heap@@103 Mask@@47) (or (< AssumeFunctionsAbove 26) (|s1#trigger| EmptyFrame this@@95)))) (and (not (= this@@95 null)) (= (U_2_int (MapType0Select Heap@@103 this@@95 x@@8)) 0)))
 :qid |stdinbpl.353:15|
 :skolemid |33|
 :pattern ( (state Heap@@103 Mask@@47) (|s1'| Heap@@103 this@@95))
)))
(assert (forall ((Heap@@104 T@U) (Mask@@48 T@U) (this@@96 T@U) ) (!  (=> (and (and (and (= (type Heap@@104) (MapType0Type RefType)) (= (type Mask@@48) (MapType1Type RefType realType))) (= (type this@@96) RefType)) (state Heap@@104 Mask@@48)) (= (|t2'| Heap@@104 this@@96) (|t2#frame| (FrameFragment (MapType0Select Heap@@104 this@@96 x@@8)) this@@96)))
 :qid |stdinbpl.1489:15|
 :skolemid |98|
 :pattern ( (state Heap@@104 Mask@@48) (|t2'| Heap@@104 this@@96))
)))
(assert (forall ((Heap@@105 T@U) (Mask@@49 T@U) (this@@97 T@U) ) (!  (=> (and (and (and (= (type Heap@@105) (MapType0Type RefType)) (= (type Mask@@49) (MapType1Type RefType realType))) (= (type this@@97) RefType)) (state Heap@@105 Mask@@49)) (= (|t2Abstract'| Heap@@105 this@@97) (|t2Abstract#frame| (FrameFragment (MapType0Select Heap@@105 this@@97 x@@8)) this@@97)))
 :qid |stdinbpl.1557:15|
 :skolemid |101|
 :pattern ( (state Heap@@105 Mask@@49) (|t2Abstract'| Heap@@105 this@@97))
)))
(assert (forall ((Heap@@106 T@U) (Mask@@50 T@U) (this@@98 T@U) ) (!  (=> (and (and (and (= (type Heap@@106) (MapType0Type RefType)) (= (type Mask@@50) (MapType1Type RefType realType))) (= (type this@@98) RefType)) (state Heap@@106 Mask@@50)) (= (|t4'| Heap@@106 this@@98) (|t4#frame| (FrameFragment (MapType0Select Heap@@106 this@@98 x@@8)) this@@98)))
 :qid |stdinbpl.1806:15|
 :skolemid |112|
 :pattern ( (state Heap@@106 Mask@@50) (|t4'| Heap@@106 this@@98))
)))
(assert (forall ((Heap@@107 T@U) (Mask@@51 T@U) (this@@99 T@U) ) (!  (=> (and (and (and (= (type Heap@@107) (MapType0Type RefType)) (= (type Mask@@51) (MapType1Type RefType realType))) (= (type this@@99) RefType)) (state Heap@@107 Mask@@51)) (= (|t4Abstract'| Heap@@107 this@@99) (|t4Abstract#frame| (FrameFragment (MapType0Select Heap@@107 this@@99 x@@8)) this@@99)))
 :qid |stdinbpl.1896:15|
 :skolemid |115|
 :pattern ( (state Heap@@107 Mask@@51) (|t4Abstract'| Heap@@107 this@@99))
)))
(assert (forall ((Heap@@108 T@U) (Mask@@52 T@U) (this@@100 T@U) ) (!  (=> (and (and (and (= (type Heap@@108) (MapType0Type RefType)) (= (type Mask@@52) (MapType1Type RefType realType))) (= (type this@@100) RefType)) (state Heap@@108 Mask@@52)) (= (|t5'| Heap@@108 this@@100) (|t5#frame| (FrameFragment (MapType0Select Heap@@108 this@@100 x@@8)) this@@100)))
 :qid |stdinbpl.1984:15|
 :skolemid |119|
 :pattern ( (state Heap@@108 Mask@@52) (|t5'| Heap@@108 this@@100))
)))
(assert (forall ((Heap@@109 T@U) (Mask@@53 T@U) (this@@101 T@U) ) (!  (=> (and (and (and (= (type Heap@@109) (MapType0Type RefType)) (= (type Mask@@53) (MapType1Type RefType realType))) (= (type this@@101) RefType)) (state Heap@@109 Mask@@53)) (= (|t5Abstract'| Heap@@109 this@@101) (|t5Abstract#frame| (FrameFragment (MapType0Select Heap@@109 this@@101 x@@8)) this@@101)))
 :qid |stdinbpl.2070:15|
 :skolemid |123|
 :pattern ( (state Heap@@109 Mask@@53) (|t5Abstract'| Heap@@109 this@@101))
)))
(assert (forall ((o T@U) (f T@U) (Heap@@110 T@U) ) (!  (=> (and (and (and (= (type o) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap@@110) (MapType0Type RefType))) (U_2_bool (MapType0Select Heap@@110 o $allocated))) (U_2_bool (MapType0Select Heap@@110 (MapType0Select Heap@@110 o f) $allocated)))
 :qid |stdinbpl.31:15|
 :skolemid |0|
 :pattern ( (MapType0Select Heap@@110 o f))
)))
(assert (forall ((Heap@@111 T@U) (o@@0 T@U) (f_3 T@U) (v T@U) ) (! (let ((B@@8 (type v)))
(let ((A@@9 (FieldTypeInv0 (type f_3))))
 (=> (and (and (= (type Heap@@111) (MapType0Type RefType)) (= (type o@@0) RefType)) (= (type f_3) (FieldType A@@9 B@@8))) (succHeap Heap@@111 (MapType0Store Heap@@111 o@@0 f_3 v)))))
 :qid |stdinbpl.78:22|
 :skolemid |9|
 :pattern ( (MapType0Store Heap@@111 o@@0 f_3 v))
)))
(assert (= (type ZeroPMask) (MapType1Type RefType boolType)))
(assert (forall ((o_2@@3 T@U) (f_4@@3 T@U) ) (! (let ((B@@9 (FieldTypeInv1 (type f_4@@3))))
(let ((A@@10 (FieldTypeInv0 (type f_4@@3))))
 (=> (and (= (type o_2@@3) RefType) (= (type f_4@@3) (FieldType A@@10 B@@9))) (not (U_2_bool (MapType1Select ZeroPMask o_2@@3 f_4@@3))))))
 :qid |stdinbpl.112:22|
 :skolemid |14|
 :pattern ( (MapType1Select ZeroPMask o_2@@3 f_4@@3))
)))
(assert (forall ((p@@1 T@U) (v_1@@0 T@U) (q T@U) (w@@0 T@U) (r T@U) (u T@U) ) (! (let ((C@@3 (FieldTypeInv0 (type r))))
(let ((B@@10 (FieldTypeInv0 (type q))))
(let ((A@@11 (FieldTypeInv0 (type p@@1))))
 (=> (and (and (and (and (and (and (= (type p@@1) (FieldType A@@11 FrameTypeType)) (= (type v_1@@0) FrameTypeType)) (= (type q) (FieldType B@@10 FrameTypeType))) (= (type w@@0) FrameTypeType)) (= (type r) (FieldType C@@3 FrameTypeType))) (= (type u) FrameTypeType)) (and (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))) (InsidePredicate p@@1 v_1@@0 r u)))))
 :qid |stdinbpl.196:25|
 :skolemid |20|
 :pattern ( (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))
)))
(assert (forall ((Heap@@112 T@U) (Mask@@54 T@U) (this@@102 T@U) ) (!  (=> (and (and (and (= (type Heap@@112) (MapType0Type RefType)) (= (type Mask@@54) (MapType1Type RefType realType))) (= (type this@@102) RefType)) (and (state Heap@@112 Mask@@54) (< AssumeFunctionsAbove 6))) (= (t3 Heap@@112 this@@102) 0))
 :qid |stdinbpl.1621:15|
 :skolemid |104|
 :pattern ( (state Heap@@112 Mask@@54) (t3 Heap@@112 this@@102))
)))
(assert (forall ((Heap@@113 T@U) (Mask@@55 T@U) (this@@103 T@U) ) (!  (=> (and (and (and (= (type Heap@@113) (MapType0Type RefType)) (= (type Mask@@55) (MapType1Type RefType realType))) (= (type this@@103) RefType)) (and (state Heap@@113 Mask@@55) (< AssumeFunctionsAbove 7))) (= (ie1 Heap@@113 this@@103) 0))
 :qid |stdinbpl.1189:15|
 :skolemid |81|
 :pattern ( (state Heap@@113 Mask@@55) (ie1 Heap@@113 this@@103))
)))
(assert (forall ((Heap@@114 T@U) (Mask@@56 T@U) (this@@104 T@U) ) (!  (=> (and (and (and (= (type Heap@@114) (MapType0Type RefType)) (= (type Mask@@56) (MapType1Type RefType realType))) (= (type this@@104) RefType)) (and (state Heap@@114 Mask@@56) (< AssumeFunctionsAbove 10))) (= (t5 Heap@@114 this@@104) 0))
 :qid |stdinbpl.1977:15|
 :skolemid |118|
 :pattern ( (state Heap@@114 Mask@@56) (t5 Heap@@114 this@@104))
)))
(assert (forall ((Heap@@115 T@U) (Mask@@57 T@U) (this@@105 T@U) ) (!  (=> (and (and (and (= (type Heap@@115) (MapType0Type RefType)) (= (type Mask@@57) (MapType1Type RefType realType))) (= (type this@@105) RefType)) (and (state Heap@@115 Mask@@57) (< AssumeFunctionsAbove 13))) (= (e1 Heap@@115 this@@105) 0))
 :qid |stdinbpl.916:15|
 :skolemid |67|
 :pattern ( (state Heap@@115 Mask@@57) (e1 Heap@@115 this@@105))
)))
(assert (forall ((Heap@@116 T@U) (Mask@@58 T@U) (this@@106 T@U) ) (!  (=> (and (and (and (= (type Heap@@116) (MapType0Type RefType)) (= (type Mask@@58) (MapType1Type RefType realType))) (= (type this@@106) RefType)) (and (state Heap@@116 Mask@@58) (< AssumeFunctionsAbove 15))) (= (i0 Heap@@116 this@@106) 0))
 :qid |stdinbpl.526:15|
 :skolemid |44|
 :pattern ( (state Heap@@116 Mask@@58) (i0 Heap@@116 this@@106))
)))
(assert (forall ((Heap@@117 T@U) (Mask@@59 T@U) (this@@107 T@U) ) (!  (=> (and (and (and (= (type Heap@@117) (MapType0Type RefType)) (= (type Mask@@59) (MapType1Type RefType realType))) (= (type this@@107) RefType)) (and (state Heap@@117 Mask@@59) (< AssumeFunctionsAbove 16))) (= (t6 Heap@@117 this@@107) 0))
 :qid |stdinbpl.2149:15|
 :skolemid |127|
 :pattern ( (state Heap@@117 Mask@@59) (t6 Heap@@117 this@@107))
)))
(assert (forall ((Heap@@118 T@U) (Mask@@60 T@U) (this@@108 T@U) ) (!  (=> (and (and (and (= (type Heap@@118) (MapType0Type RefType)) (= (type Mask@@60) (MapType1Type RefType realType))) (= (type this@@108) RefType)) (and (state Heap@@118 Mask@@60) (< AssumeFunctionsAbove 24))) (= (i1 Heap@@118 this@@108) 0))
 :qid |stdinbpl.651:15|
 :skolemid |51|
 :pattern ( (state Heap@@118 Mask@@60) (i1 Heap@@118 this@@108))
)))
(assert (forall ((Heap@@119 T@U) (Mask@@61 T@U) (this@@109 T@U) ) (!  (=> (and (and (and (= (type Heap@@119) (MapType0Type RefType)) (= (type Mask@@61) (MapType1Type RefType realType))) (= (type this@@109) RefType)) (and (state Heap@@119 Mask@@61) (< AssumeFunctionsAbove 26))) (= (s1 Heap@@119 this@@109) 0))
 :qid |stdinbpl.340:15|
 :skolemid |31|
 :pattern ( (state Heap@@119 Mask@@61) (s1 Heap@@119 this@@109))
)))
(assert (forall ((Heap@@120 T@U) (Mask@@62 T@U) (this@@110 T@U) ) (!  (=> (and (and (and (= (type Heap@@120) (MapType0Type RefType)) (= (type Mask@@62) (MapType1Type RefType realType))) (= (type this@@110) RefType)) (and (state Heap@@120 Mask@@62) (< AssumeFunctionsAbove 27))) (= (t2 Heap@@120 this@@110) 0))
 :qid |stdinbpl.1482:15|
 :skolemid |97|
 :pattern ( (state Heap@@120 Mask@@62) (t2 Heap@@120 this@@110))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun this@@111 () T@U)
(declare-fun Heap@@121 () T@U)
(assert  (and (= (type this@@111) RefType) (= (type Heap@@121) (MapType0Type RefType))))
(set-info :boogie-vc-id |e0#definedness|)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 5) (let ((anon3_Else_correct true))
(let ((anon3_Then_correct  (=> (and (not (= this@@111 null)) (= (ControlFlow 0 2) (- 0 1))) (HasDirectPerm ZeroMask this@@111 x@@8))))
(let ((anon0_correct  (=> (state Heap@@121 ZeroMask) (=> (and (U_2_bool (MapType0Select Heap@@121 this@@111 $allocated)) (= AssumeFunctionsAbove 11)) (and (=> (= (ControlFlow 0 4) 2) anon3_Then_correct) (=> (= (ControlFlow 0 4) 3) anon3_Else_correct))))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 5) 4) anon0_correct)))
PreconditionGeneratedEntry_correct)))))
))
(check-sat)
(get-info :reason-unknown)
(assert (not (= (ControlFlow 0 2) (- 1))))
(check-sat)
(pop 1)
; Invalid
(get-info :rlimit)
(reset)
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
(declare-fun x@@8 () T@U)
(declare-fun FieldType (T@T T@T) T@T)
(declare-fun FieldTypeInv0 (T@T) T@T)
(declare-fun FieldTypeInv1 (T@T) T@T)
(declare-fun NormalFieldType () T@T)
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
(declare-fun IdenticalOnKnownLocations (T@U T@U T@U) Bool)
(declare-fun IsPredicateField (T@U) Bool)
(declare-fun null () T@U)
(declare-fun PredicateMaskField (T@U) T@U)
(declare-fun FrameTypeType () T@T)
(declare-fun HasDirectPerm (T@U T@U T@U) Bool)
(declare-fun IsWandField (T@U) Bool)
(declare-fun WandMaskField (T@U) T@U)
(declare-fun |s0'| (T@U T@U) Int)
(declare-fun dummyFunction (T@U) Bool)
(declare-fun |s0#triggerStateless| (T@U) Int)
(declare-fun |s0Abstract'| (T@U T@U) Int)
(declare-fun |s0Abstract#triggerStateless| (T@U) Int)
(declare-fun |s1'| (T@U T@U) Int)
(declare-fun |s1#triggerStateless| (T@U) Int)
(declare-fun |s1Abstract'| (T@U T@U) Int)
(declare-fun |s1Abstract#triggerStateless| (T@U) Int)
(declare-fun |s2'| (T@U T@U) Int)
(declare-fun |s2#triggerStateless| (T@U) Int)
(declare-fun |i0'| (T@U T@U) Int)
(declare-fun |i0#triggerStateless| (T@U) Int)
(declare-fun |i0Abstract'| (T@U T@U) Int)
(declare-fun |i0Abstract#triggerStateless| (T@U) Int)
(declare-fun |i1'| (T@U T@U) Int)
(declare-fun |i1#triggerStateless| (T@U) Int)
(declare-fun |i1Abstract'| (T@U T@U) Int)
(declare-fun |i1Abstract#triggerStateless| (T@U) Int)
(declare-fun |e0'| (T@U T@U) Int)
(declare-fun |e0#triggerStateless| (T@U) Int)
(declare-fun |e0Abstract'| (T@U T@U) Int)
(declare-fun |e0Abstract#triggerStateless| (T@U) Int)
(declare-fun |e1'| (T@U T@U) Int)
(declare-fun |e1#triggerStateless| (T@U) Int)
(declare-fun |e1Abstract'| (T@U T@U) Int)
(declare-fun |e1Abstract#triggerStateless| (T@U) Int)
(declare-fun |ie0'| (T@U T@U) Int)
(declare-fun |ie0#triggerStateless| (T@U) Int)
(declare-fun |ie0Abstract'| (T@U T@U) Int)
(declare-fun |ie0Abstract#triggerStateless| (T@U) Int)
(declare-fun |ie1'| (T@U T@U) Int)
(declare-fun |ie1#triggerStateless| (T@U) Int)
(declare-fun |ie1Abstract'| (T@U T@U) Int)
(declare-fun |ie1Abstract#triggerStateless| (T@U) Int)
(declare-fun |t1'| (T@U T@U) Int)
(declare-fun |t1#triggerStateless| (T@U) Int)
(declare-fun |t1Abstract'| (T@U T@U) Int)
(declare-fun |t1Abstract#triggerStateless| (T@U) Int)
(declare-fun |t2'| (T@U T@U) Int)
(declare-fun |t2#triggerStateless| (T@U) Int)
(declare-fun |t2Abstract'| (T@U T@U) Int)
(declare-fun |t2Abstract#triggerStateless| (T@U) Int)
(declare-fun |t3'| (T@U T@U) Int)
(declare-fun |t3#triggerStateless| (T@U) Int)
(declare-fun |t3Abstract'| (T@U T@U) Int)
(declare-fun |t3Abstract#triggerStateless| (T@U) Int)
(declare-fun |t4'| (T@U T@U) Int)
(declare-fun |t4#triggerStateless| (T@U) Int)
(declare-fun |t4Abstract'| (T@U T@U) Int)
(declare-fun |t4Abstract#triggerStateless| (T@U) Int)
(declare-fun |t5'| (T@U T@U) Int)
(declare-fun |t5#triggerStateless| (T@U) Int)
(declare-fun |t5Abstract'| (T@U T@U) Int)
(declare-fun |t5Abstract#triggerStateless| (T@U) Int)
(declare-fun |t6'| (T@U T@U) Int)
(declare-fun |t6#triggerStateless| (T@U) Int)
(declare-fun |t6Abstract'| (T@U T@U) Int)
(declare-fun |t6Abstract#triggerStateless| (T@U) Int)
(declare-fun s0 (T@U T@U) Int)
(declare-fun s0Abstract (T@U T@U) Int)
(declare-fun s1 (T@U T@U) Int)
(declare-fun s1Abstract (T@U T@U) Int)
(declare-fun s2 (T@U T@U) Int)
(declare-fun i0 (T@U T@U) Int)
(declare-fun i0Abstract (T@U T@U) Int)
(declare-fun i1 (T@U T@U) Int)
(declare-fun i1Abstract (T@U T@U) Int)
(declare-fun e0 (T@U T@U) Int)
(declare-fun e0Abstract (T@U T@U) Int)
(declare-fun e1 (T@U T@U) Int)
(declare-fun e1Abstract (T@U T@U) Int)
(declare-fun ie0 (T@U T@U) Int)
(declare-fun ie0Abstract (T@U T@U) Int)
(declare-fun ie1 (T@U T@U) Int)
(declare-fun ie1Abstract (T@U T@U) Int)
(declare-fun t1 (T@U T@U) Int)
(declare-fun t1Abstract (T@U T@U) Int)
(declare-fun t2 (T@U T@U) Int)
(declare-fun t2Abstract (T@U T@U) Int)
(declare-fun t3 (T@U T@U) Int)
(declare-fun t3Abstract (T@U T@U) Int)
(declare-fun t4 (T@U T@U) Int)
(declare-fun t4Abstract (T@U T@U) Int)
(declare-fun t5 (T@U T@U) Int)
(declare-fun t5Abstract (T@U T@U) Int)
(declare-fun t6 (T@U T@U) Int)
(declare-fun t6Abstract (T@U T@U) Int)
(declare-fun AssumeFunctionsAbove () Int)
(declare-fun dummyHeap () T@U)
(declare-fun ZeroMask () T@U)
(declare-fun InsidePredicate (T@U T@U T@U T@U) Bool)
(declare-fun sumMask (T@U T@U T@U) Bool)
(declare-fun ConditionalFrame (Real T@U) T@U)
(declare-fun EmptyFrame () T@U)
(declare-fun NoPerm () Real)
(declare-fun |t5#trigger| (T@U T@U) Bool)
(declare-fun FrameFragment (T@U) T@U)
(declare-fun |t5Abstract#trigger| (T@U T@U) Bool)
(declare-fun FullPerm () Real)
(declare-fun |s0#frame| (T@U T@U) Int)
(declare-fun |s0Abstract#frame| (T@U T@U) Int)
(declare-fun |s1#frame| (T@U T@U) Int)
(declare-fun |s1Abstract#frame| (T@U T@U) Int)
(declare-fun |s2#frame| (T@U T@U) Int)
(declare-fun |i0#frame| (T@U T@U) Int)
(declare-fun |i0Abstract#frame| (T@U T@U) Int)
(declare-fun |i1#frame| (T@U T@U) Int)
(declare-fun |i1Abstract#frame| (T@U T@U) Int)
(declare-fun |e0#frame| (T@U T@U) Int)
(declare-fun |e0Abstract#frame| (T@U T@U) Int)
(declare-fun |e1#frame| (T@U T@U) Int)
(declare-fun |e1Abstract#frame| (T@U T@U) Int)
(declare-fun |ie0#frame| (T@U T@U) Int)
(declare-fun |ie0Abstract#frame| (T@U T@U) Int)
(declare-fun |ie1#frame| (T@U T@U) Int)
(declare-fun |ie1Abstract#frame| (T@U T@U) Int)
(declare-fun |t1#frame| (T@U T@U) Int)
(declare-fun |t1Abstract#frame| (T@U T@U) Int)
(declare-fun |t3#frame| (T@U T@U) Int)
(declare-fun |t3Abstract#frame| (T@U T@U) Int)
(declare-fun |t6#frame| (T@U T@U) Int)
(declare-fun |t6Abstract#frame| (T@U T@U) Int)
(declare-fun |i1Abstract#trigger| (T@U T@U) Bool)
(declare-fun |ie1Abstract#trigger| (T@U T@U) Bool)
(declare-fun |ie1#trigger| (T@U T@U) Bool)
(declare-fun |t6#trigger| (T@U T@U) Bool)
(declare-fun |t6Abstract#trigger| (T@U T@U) Bool)
(declare-fun |s1Abstract#trigger| (T@U T@U) Bool)
(declare-fun |i1#trigger| (T@U T@U) Bool)
(declare-fun |s1#trigger| (T@U T@U) Bool)
(declare-fun |t2#frame| (T@U T@U) Int)
(declare-fun |t2Abstract#frame| (T@U T@U) Int)
(declare-fun |t4#frame| (T@U T@U) Int)
(declare-fun |t4Abstract#frame| (T@U T@U) Int)
(declare-fun |t5#frame| (T@U T@U) Int)
(declare-fun |t5Abstract#frame| (T@U T@U) Int)
(declare-fun ZeroPMask () T@U)
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
))) (= (Ctor NormalFieldType) 7)) (= (type $allocated) (FieldType NormalFieldType boolType))) (= (type x@@8) (FieldType NormalFieldType intType))))
(assert (distinct $allocated x@@8)
)
(assert  (and (and (and (and (and (and (forall ((arg0@@14 T@T) ) (! (= (Ctor (MapType0Type arg0@@14)) 8)
 :qid |ctor:MapType0Type|
)) (forall ((arg0@@15 T@T) ) (! (= (MapType0TypeInv0 (MapType0Type arg0@@15)) arg0@@15)
 :qid |typeInv:MapType0TypeInv0|
 :pattern ( (MapType0Type arg0@@15))
))) (forall ((arg0@@16 T@U) (arg1@@2 T@U) (arg2 T@U) ) (! (let ((B (FieldTypeInv1 (type arg2))))
(= (type (MapType0Select arg0@@16 arg1@@2 arg2)) B))
 :qid |funType:MapType0Select|
 :pattern ( (MapType0Select arg0@@16 arg1@@2 arg2))
))) (forall ((arg0@@17 T@U) (arg1@@3 T@U) (arg2@@0 T@U) (arg3 T@U) ) (! (let ((aVar0 (type arg1@@3)))
(= (type (MapType0Store arg0@@17 arg1@@3 arg2@@0 arg3)) (MapType0Type aVar0)))
 :qid |funType:MapType0Store|
 :pattern ( (MapType0Store arg0@@17 arg1@@3 arg2@@0 arg3))
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
)))) (= (Ctor RefType) 9)))
(assert (forall ((Heap0 T@U) (Heap1 T@U) ) (!  (=> (and (and (= (type Heap0) (MapType0Type RefType)) (= (type Heap1) (MapType0Type RefType))) (succHeap Heap0 Heap1)) (succHeapTrans Heap0 Heap1))
 :qid |stdinbpl.88:15|
 :skolemid |11|
 :pattern ( (succHeap Heap0 Heap1))
)))
(assert  (and (and (and (and (and (and (forall ((arg0@@18 T@T) (arg1@@4 T@T) ) (! (= (Ctor (MapType1Type arg0@@18 arg1@@4)) 10)
 :qid |ctor:MapType1Type|
)) (forall ((arg0@@19 T@T) (arg1@@5 T@T) ) (! (= (MapType1TypeInv0 (MapType1Type arg0@@19 arg1@@5)) arg0@@19)
 :qid |typeInv:MapType1TypeInv0|
 :pattern ( (MapType1Type arg0@@19 arg1@@5))
))) (forall ((arg0@@20 T@T) (arg1@@6 T@T) ) (! (= (MapType1TypeInv1 (MapType1Type arg0@@20 arg1@@6)) arg1@@6)
 :qid |typeInv:MapType1TypeInv1|
 :pattern ( (MapType1Type arg0@@20 arg1@@6))
))) (forall ((arg0@@21 T@U) (arg1@@7 T@U) (arg2@@1 T@U) ) (! (let ((aVar1 (MapType1TypeInv1 (type arg0@@21))))
(= (type (MapType1Select arg0@@21 arg1@@7 arg2@@1)) aVar1))
 :qid |funType:MapType1Select|
 :pattern ( (MapType1Select arg0@@21 arg1@@7 arg2@@1))
))) (forall ((arg0@@22 T@U) (arg1@@8 T@U) (arg2@@2 T@U) (arg3@@0 T@U) ) (! (let ((aVar1@@0 (type arg3@@0)))
(let ((aVar0@@0 (type arg1@@8)))
(= (type (MapType1Store arg0@@22 arg1@@8 arg2@@2 arg3@@0)) (MapType1Type aVar0@@0 aVar1@@0))))
 :qid |funType:MapType1Store|
 :pattern ( (MapType1Store arg0@@22 arg1@@8 arg2@@2 arg3@@0))
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
(assert  (and (and (= (Ctor FrameTypeType) 11) (= (type null) RefType)) (forall ((arg0@@23 T@U) ) (! (let ((A (FieldTypeInv0 (type arg0@@23))))
(= (type (PredicateMaskField arg0@@23)) (FieldType A (MapType1Type RefType boolType))))
 :qid |funType:PredicateMaskField|
 :pattern ( (PredicateMaskField arg0@@23))
))))
(assert (forall ((Heap@@0 T@U) (ExhaleHeap T@U) (Mask@@0 T@U) (pm_f T@U) ) (! (let ((C (FieldTypeInv0 (type pm_f))))
 (=> (and (and (and (and (and (= (type Heap@@0) (MapType0Type RefType)) (= (type ExhaleHeap) (MapType0Type RefType))) (= (type Mask@@0) (MapType1Type RefType realType))) (= (type pm_f) (FieldType C FrameTypeType))) (IdenticalOnKnownLocations Heap@@0 ExhaleHeap Mask@@0)) (and (HasDirectPerm Mask@@0 null pm_f) (IsPredicateField pm_f))) (= (MapType0Select Heap@@0 null (PredicateMaskField pm_f)) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))))
 :qid |stdinbpl.47:19|
 :skolemid |2|
 :pattern ( (IdenticalOnKnownLocations Heap@@0 ExhaleHeap Mask@@0) (IsPredicateField pm_f) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))
)))
(assert (forall ((arg0@@24 T@U) ) (! (let ((A@@0 (FieldTypeInv0 (type arg0@@24))))
(= (type (WandMaskField arg0@@24)) (FieldType A@@0 (MapType1Type RefType boolType))))
 :qid |funType:WandMaskField|
 :pattern ( (WandMaskField arg0@@24))
)))
(assert (forall ((Heap@@1 T@U) (ExhaleHeap@@0 T@U) (Mask@@1 T@U) (pm_f@@0 T@U) ) (! (let ((C@@0 (FieldTypeInv0 (type pm_f@@0))))
 (=> (and (and (and (and (and (= (type Heap@@1) (MapType0Type RefType)) (= (type ExhaleHeap@@0) (MapType0Type RefType))) (= (type Mask@@1) (MapType1Type RefType realType))) (= (type pm_f@@0) (FieldType C@@0 FrameTypeType))) (IdenticalOnKnownLocations Heap@@1 ExhaleHeap@@0 Mask@@1)) (and (HasDirectPerm Mask@@1 null pm_f@@0) (IsWandField pm_f@@0))) (= (MapType0Select Heap@@1 null (WandMaskField pm_f@@0)) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))))
 :qid |stdinbpl.60:19|
 :skolemid |5|
 :pattern ( (IdenticalOnKnownLocations Heap@@1 ExhaleHeap@@0 Mask@@1) (IsWandField pm_f@@0) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))
)))
(assert (forall ((Heap@@2 T@U) (this T@U) ) (!  (=> (and (= (type Heap@@2) (MapType0Type RefType)) (= (type this) RefType)) (dummyFunction (int_2_U (|s0#triggerStateless| this))))
 :qid |stdinbpl.225:15|
 :skolemid |23|
 :pattern ( (|s0'| Heap@@2 this))
)))
(assert (forall ((Heap@@3 T@U) (this@@0 T@U) ) (!  (=> (and (= (type Heap@@3) (MapType0Type RefType)) (= (type this@@0) RefType)) (dummyFunction (int_2_U (|s0Abstract#triggerStateless| this@@0))))
 :qid |stdinbpl.284:15|
 :skolemid |27|
 :pattern ( (|s0Abstract'| Heap@@3 this@@0))
)))
(assert (forall ((Heap@@4 T@U) (this@@1 T@U) ) (!  (=> (and (= (type Heap@@4) (MapType0Type RefType)) (= (type this@@1) RefType)) (dummyFunction (int_2_U (|s1#triggerStateless| this@@1))))
 :qid |stdinbpl.334:15|
 :skolemid |30|
 :pattern ( (|s1'| Heap@@4 this@@1))
)))
(assert (forall ((Heap@@5 T@U) (this@@2 T@U) ) (!  (=> (and (= (type Heap@@5) (MapType0Type RefType)) (= (type this@@2) RefType)) (dummyFunction (int_2_U (|s1Abstract#triggerStateless| this@@2))))
 :qid |stdinbpl.404:15|
 :skolemid |35|
 :pattern ( (|s1Abstract'| Heap@@5 this@@2))
)))
(assert (forall ((Heap@@6 T@U) (this@@3 T@U) ) (!  (=> (and (= (type Heap@@6) (MapType0Type RefType)) (= (type this@@3) RefType)) (dummyFunction (int_2_U (|s2#triggerStateless| this@@3))))
 :qid |stdinbpl.460:15|
 :skolemid |39|
 :pattern ( (|s2'| Heap@@6 this@@3))
)))
(assert (forall ((Heap@@7 T@U) (this@@4 T@U) ) (!  (=> (and (= (type Heap@@7) (MapType0Type RefType)) (= (type this@@4) RefType)) (dummyFunction (int_2_U (|i0#triggerStateless| this@@4))))
 :qid |stdinbpl.520:15|
 :skolemid |43|
 :pattern ( (|i0'| Heap@@7 this@@4))
)))
(assert (forall ((Heap@@8 T@U) (this@@5 T@U) ) (!  (=> (and (= (type Heap@@8) (MapType0Type RefType)) (= (type this@@5) RefType)) (dummyFunction (int_2_U (|i0Abstract#triggerStateless| this@@5))))
 :qid |stdinbpl.587:15|
 :skolemid |47|
 :pattern ( (|i0Abstract'| Heap@@8 this@@5))
)))
(assert (forall ((Heap@@9 T@U) (this@@6 T@U) ) (!  (=> (and (= (type Heap@@9) (MapType0Type RefType)) (= (type this@@6) RefType)) (dummyFunction (int_2_U (|i1#triggerStateless| this@@6))))
 :qid |stdinbpl.645:15|
 :skolemid |50|
 :pattern ( (|i1'| Heap@@9 this@@6))
)))
(assert (forall ((Heap@@10 T@U) (this@@7 T@U) ) (!  (=> (and (= (type Heap@@10) (MapType0Type RefType)) (= (type this@@7) RefType)) (dummyFunction (int_2_U (|i1Abstract#triggerStateless| this@@7))))
 :qid |stdinbpl.721:15|
 :skolemid |55|
 :pattern ( (|i1Abstract'| Heap@@10 this@@7))
)))
(assert (forall ((Heap@@11 T@U) (this@@8 T@U) ) (!  (=> (and (= (type Heap@@11) (MapType0Type RefType)) (= (type this@@8) RefType)) (dummyFunction (int_2_U (|e0#triggerStateless| this@@8))))
 :qid |stdinbpl.785:15|
 :skolemid |59|
 :pattern ( (|e0'| Heap@@11 this@@8))
)))
(assert (forall ((Heap@@12 T@U) (this@@9 T@U) ) (!  (=> (and (= (type Heap@@12) (MapType0Type RefType)) (= (type this@@9) RefType)) (dummyFunction (int_2_U (|e0Abstract#triggerStateless| this@@9))))
 :qid |stdinbpl.852:15|
 :skolemid |63|
 :pattern ( (|e0Abstract'| Heap@@12 this@@9))
)))
(assert (forall ((Heap@@13 T@U) (this@@10 T@U) ) (!  (=> (and (= (type Heap@@13) (MapType0Type RefType)) (= (type this@@10) RefType)) (dummyFunction (int_2_U (|e1#triggerStateless| this@@10))))
 :qid |stdinbpl.910:15|
 :skolemid |66|
 :pattern ( (|e1'| Heap@@13 this@@10))
)))
(assert (forall ((Heap@@14 T@U) (this@@11 T@U) ) (!  (=> (and (= (type Heap@@14) (MapType0Type RefType)) (= (type this@@11) RefType)) (dummyFunction (int_2_U (|e1Abstract#triggerStateless| this@@11))))
 :qid |stdinbpl.985:15|
 :skolemid |70|
 :pattern ( (|e1Abstract'| Heap@@14 this@@11))
)))
(assert (forall ((Heap@@15 T@U) (this@@12 T@U) ) (!  (=> (and (= (type Heap@@15) (MapType0Type RefType)) (= (type this@@12) RefType)) (dummyFunction (int_2_U (|ie0#triggerStateless| this@@12))))
 :qid |stdinbpl.1046:15|
 :skolemid |73|
 :pattern ( (|ie0'| Heap@@15 this@@12))
)))
(assert (forall ((Heap@@16 T@U) (this@@13 T@U) ) (!  (=> (and (= (type Heap@@16) (MapType0Type RefType)) (= (type this@@13) RefType)) (dummyFunction (int_2_U (|ie0Abstract#triggerStateless| this@@13))))
 :qid |stdinbpl.1119:15|
 :skolemid |77|
 :pattern ( (|ie0Abstract'| Heap@@16 this@@13))
)))
(assert (forall ((Heap@@17 T@U) (this@@14 T@U) ) (!  (=> (and (= (type Heap@@17) (MapType0Type RefType)) (= (type this@@14) RefType)) (dummyFunction (int_2_U (|ie1#triggerStateless| this@@14))))
 :qid |stdinbpl.1183:15|
 :skolemid |80|
 :pattern ( (|ie1'| Heap@@17 this@@14))
)))
(assert (forall ((Heap@@18 T@U) (this@@15 T@U) ) (!  (=> (and (= (type Heap@@18) (MapType0Type RefType)) (= (type this@@15) RefType)) (dummyFunction (int_2_U (|ie1Abstract#triggerStateless| this@@15))))
 :qid |stdinbpl.1267:15|
 :skolemid |85|
 :pattern ( (|ie1Abstract'| Heap@@18 this@@15))
)))
(assert (forall ((Heap@@19 T@U) (this@@16 T@U) ) (!  (=> (and (= (type Heap@@19) (MapType0Type RefType)) (= (type this@@16) RefType)) (dummyFunction (int_2_U (|t1#triggerStateless| this@@16))))
 :qid |stdinbpl.1337:15|
 :skolemid |89|
 :pattern ( (|t1'| Heap@@19 this@@16))
)))
(assert (forall ((Heap@@20 T@U) (this@@17 T@U) ) (!  (=> (and (= (type Heap@@20) (MapType0Type RefType)) (= (type this@@17) RefType)) (dummyFunction (int_2_U (|t1Abstract#triggerStateless| this@@17))))
 :qid |stdinbpl.1411:15|
 :skolemid |93|
 :pattern ( (|t1Abstract'| Heap@@20 this@@17))
)))
(assert (forall ((Heap@@21 T@U) (this@@18 T@U) ) (!  (=> (and (= (type Heap@@21) (MapType0Type RefType)) (= (type this@@18) RefType)) (dummyFunction (int_2_U (|t2#triggerStateless| this@@18))))
 :qid |stdinbpl.1476:15|
 :skolemid |96|
 :pattern ( (|t2'| Heap@@21 this@@18))
)))
(assert (forall ((Heap@@22 T@U) (this@@19 T@U) ) (!  (=> (and (= (type Heap@@22) (MapType0Type RefType)) (= (type this@@19) RefType)) (dummyFunction (int_2_U (|t2Abstract#triggerStateless| this@@19))))
 :qid |stdinbpl.1550:15|
 :skolemid |100|
 :pattern ( (|t2Abstract'| Heap@@22 this@@19))
)))
(assert (forall ((Heap@@23 T@U) (this@@20 T@U) ) (!  (=> (and (= (type Heap@@23) (MapType0Type RefType)) (= (type this@@20) RefType)) (dummyFunction (int_2_U (|t3#triggerStateless| this@@20))))
 :qid |stdinbpl.1615:15|
 :skolemid |103|
 :pattern ( (|t3'| Heap@@23 this@@20))
)))
(assert (forall ((Heap@@24 T@U) (this@@21 T@U) ) (!  (=> (and (= (type Heap@@24) (MapType0Type RefType)) (= (type this@@21) RefType)) (dummyFunction (int_2_U (|t3Abstract#triggerStateless| this@@21))))
 :qid |stdinbpl.1711:15|
 :skolemid |107|
 :pattern ( (|t3Abstract'| Heap@@24 this@@21))
)))
(assert (forall ((Heap@@25 T@U) (this@@22 T@U) ) (!  (=> (and (= (type Heap@@25) (MapType0Type RefType)) (= (type this@@22) RefType)) (dummyFunction (int_2_U (|t4#triggerStateless| this@@22))))
 :qid |stdinbpl.1793:15|
 :skolemid |110|
 :pattern ( (|t4'| Heap@@25 this@@22))
)))
(assert (forall ((Heap@@26 T@U) (this@@23 T@U) ) (!  (=> (and (= (type Heap@@26) (MapType0Type RefType)) (= (type this@@23) RefType)) (dummyFunction (int_2_U (|t4Abstract#triggerStateless| this@@23))))
 :qid |stdinbpl.1889:15|
 :skolemid |114|
 :pattern ( (|t4Abstract'| Heap@@26 this@@23))
)))
(assert (forall ((Heap@@27 T@U) (this@@24 T@U) ) (!  (=> (and (= (type Heap@@27) (MapType0Type RefType)) (= (type this@@24) RefType)) (dummyFunction (int_2_U (|t5#triggerStateless| this@@24))))
 :qid |stdinbpl.1971:15|
 :skolemid |117|
 :pattern ( (|t5'| Heap@@27 this@@24))
)))
(assert (forall ((Heap@@28 T@U) (this@@25 T@U) ) (!  (=> (and (= (type Heap@@28) (MapType0Type RefType)) (= (type this@@25) RefType)) (dummyFunction (int_2_U (|t5Abstract#triggerStateless| this@@25))))
 :qid |stdinbpl.2063:15|
 :skolemid |122|
 :pattern ( (|t5Abstract'| Heap@@28 this@@25))
)))
(assert (forall ((Heap@@29 T@U) (this@@26 T@U) ) (!  (=> (and (= (type Heap@@29) (MapType0Type RefType)) (= (type this@@26) RefType)) (dummyFunction (int_2_U (|t6#triggerStateless| this@@26))))
 :qid |stdinbpl.2143:15|
 :skolemid |126|
 :pattern ( (|t6'| Heap@@29 this@@26))
)))
(assert (forall ((Heap@@30 T@U) (this@@27 T@U) ) (!  (=> (and (= (type Heap@@30) (MapType0Type RefType)) (= (type this@@27) RefType)) (dummyFunction (int_2_U (|t6Abstract#triggerStateless| this@@27))))
 :qid |stdinbpl.2235:15|
 :skolemid |131|
 :pattern ( (|t6Abstract'| Heap@@30 this@@27))
)))
(assert (forall ((Heap@@31 T@U) (ExhaleHeap@@1 T@U) (Mask@@2 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@31) (MapType0Type RefType)) (= (type ExhaleHeap@@1) (MapType0Type RefType))) (= (type Mask@@2) (MapType1Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@31 ExhaleHeap@@1 Mask@@2)) (U_2_bool (MapType0Select Heap@@31 o_1 $allocated))) (U_2_bool (MapType0Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.73:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@31 ExhaleHeap@@1 Mask@@2) (MapType0Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert (forall ((Heap@@32 T@U) (this@@28 T@U) ) (!  (=> (and (= (type Heap@@32) (MapType0Type RefType)) (= (type this@@28) RefType)) (and (= (s0 Heap@@32 this@@28) (|s0'| Heap@@32 this@@28)) (dummyFunction (int_2_U (|s0#triggerStateless| this@@28)))))
 :qid |stdinbpl.221:15|
 :skolemid |22|
 :pattern ( (s0 Heap@@32 this@@28))
)))
(assert (forall ((Heap@@33 T@U) (this@@29 T@U) ) (!  (=> (and (= (type Heap@@33) (MapType0Type RefType)) (= (type this@@29) RefType)) (and (= (s0Abstract Heap@@33 this@@29) (|s0Abstract'| Heap@@33 this@@29)) (dummyFunction (int_2_U (|s0Abstract#triggerStateless| this@@29)))))
 :qid |stdinbpl.280:15|
 :skolemid |26|
 :pattern ( (s0Abstract Heap@@33 this@@29))
)))
(assert (forall ((Heap@@34 T@U) (this@@30 T@U) ) (!  (=> (and (= (type Heap@@34) (MapType0Type RefType)) (= (type this@@30) RefType)) (and (= (s1 Heap@@34 this@@30) (|s1'| Heap@@34 this@@30)) (dummyFunction (int_2_U (|s1#triggerStateless| this@@30)))))
 :qid |stdinbpl.330:15|
 :skolemid |29|
 :pattern ( (s1 Heap@@34 this@@30))
)))
(assert (forall ((Heap@@35 T@U) (this@@31 T@U) ) (!  (=> (and (= (type Heap@@35) (MapType0Type RefType)) (= (type this@@31) RefType)) (and (= (s1Abstract Heap@@35 this@@31) (|s1Abstract'| Heap@@35 this@@31)) (dummyFunction (int_2_U (|s1Abstract#triggerStateless| this@@31)))))
 :qid |stdinbpl.400:15|
 :skolemid |34|
 :pattern ( (s1Abstract Heap@@35 this@@31))
)))
(assert (forall ((Heap@@36 T@U) (this@@32 T@U) ) (!  (=> (and (= (type Heap@@36) (MapType0Type RefType)) (= (type this@@32) RefType)) (and (= (s2 Heap@@36 this@@32) (|s2'| Heap@@36 this@@32)) (dummyFunction (int_2_U (|s2#triggerStateless| this@@32)))))
 :qid |stdinbpl.456:15|
 :skolemid |38|
 :pattern ( (s2 Heap@@36 this@@32))
)))
(assert (forall ((Heap@@37 T@U) (this@@33 T@U) ) (!  (=> (and (= (type Heap@@37) (MapType0Type RefType)) (= (type this@@33) RefType)) (and (= (i0 Heap@@37 this@@33) (|i0'| Heap@@37 this@@33)) (dummyFunction (int_2_U (|i0#triggerStateless| this@@33)))))
 :qid |stdinbpl.516:15|
 :skolemid |42|
 :pattern ( (i0 Heap@@37 this@@33))
)))
(assert (forall ((Heap@@38 T@U) (this@@34 T@U) ) (!  (=> (and (= (type Heap@@38) (MapType0Type RefType)) (= (type this@@34) RefType)) (and (= (i0Abstract Heap@@38 this@@34) (|i0Abstract'| Heap@@38 this@@34)) (dummyFunction (int_2_U (|i0Abstract#triggerStateless| this@@34)))))
 :qid |stdinbpl.583:15|
 :skolemid |46|
 :pattern ( (i0Abstract Heap@@38 this@@34))
)))
(assert (forall ((Heap@@39 T@U) (this@@35 T@U) ) (!  (=> (and (= (type Heap@@39) (MapType0Type RefType)) (= (type this@@35) RefType)) (and (= (i1 Heap@@39 this@@35) (|i1'| Heap@@39 this@@35)) (dummyFunction (int_2_U (|i1#triggerStateless| this@@35)))))
 :qid |stdinbpl.641:15|
 :skolemid |49|
 :pattern ( (i1 Heap@@39 this@@35))
)))
(assert (forall ((Heap@@40 T@U) (this@@36 T@U) ) (!  (=> (and (= (type Heap@@40) (MapType0Type RefType)) (= (type this@@36) RefType)) (and (= (i1Abstract Heap@@40 this@@36) (|i1Abstract'| Heap@@40 this@@36)) (dummyFunction (int_2_U (|i1Abstract#triggerStateless| this@@36)))))
 :qid |stdinbpl.717:15|
 :skolemid |54|
 :pattern ( (i1Abstract Heap@@40 this@@36))
)))
(assert (forall ((Heap@@41 T@U) (this@@37 T@U) ) (!  (=> (and (= (type Heap@@41) (MapType0Type RefType)) (= (type this@@37) RefType)) (and (= (e0 Heap@@41 this@@37) (|e0'| Heap@@41 this@@37)) (dummyFunction (int_2_U (|e0#triggerStateless| this@@37)))))
 :qid |stdinbpl.781:15|
 :skolemid |58|
 :pattern ( (e0 Heap@@41 this@@37))
)))
(assert (forall ((Heap@@42 T@U) (this@@38 T@U) ) (!  (=> (and (= (type Heap@@42) (MapType0Type RefType)) (= (type this@@38) RefType)) (and (= (e0Abstract Heap@@42 this@@38) (|e0Abstract'| Heap@@42 this@@38)) (dummyFunction (int_2_U (|e0Abstract#triggerStateless| this@@38)))))
 :qid |stdinbpl.848:15|
 :skolemid |62|
 :pattern ( (e0Abstract Heap@@42 this@@38))
)))
(assert (forall ((Heap@@43 T@U) (this@@39 T@U) ) (!  (=> (and (= (type Heap@@43) (MapType0Type RefType)) (= (type this@@39) RefType)) (and (= (e1 Heap@@43 this@@39) (|e1'| Heap@@43 this@@39)) (dummyFunction (int_2_U (|e1#triggerStateless| this@@39)))))
 :qid |stdinbpl.906:15|
 :skolemid |65|
 :pattern ( (e1 Heap@@43 this@@39))
)))
(assert (forall ((Heap@@44 T@U) (this@@40 T@U) ) (!  (=> (and (= (type Heap@@44) (MapType0Type RefType)) (= (type this@@40) RefType)) (and (= (e1Abstract Heap@@44 this@@40) (|e1Abstract'| Heap@@44 this@@40)) (dummyFunction (int_2_U (|e1Abstract#triggerStateless| this@@40)))))
 :qid |stdinbpl.981:15|
 :skolemid |69|
 :pattern ( (e1Abstract Heap@@44 this@@40))
)))
(assert (forall ((Heap@@45 T@U) (this@@41 T@U) ) (!  (=> (and (= (type Heap@@45) (MapType0Type RefType)) (= (type this@@41) RefType)) (and (= (ie0 Heap@@45 this@@41) (|ie0'| Heap@@45 this@@41)) (dummyFunction (int_2_U (|ie0#triggerStateless| this@@41)))))
 :qid |stdinbpl.1042:15|
 :skolemid |72|
 :pattern ( (ie0 Heap@@45 this@@41))
)))
(assert (forall ((Heap@@46 T@U) (this@@42 T@U) ) (!  (=> (and (= (type Heap@@46) (MapType0Type RefType)) (= (type this@@42) RefType)) (and (= (ie0Abstract Heap@@46 this@@42) (|ie0Abstract'| Heap@@46 this@@42)) (dummyFunction (int_2_U (|ie0Abstract#triggerStateless| this@@42)))))
 :qid |stdinbpl.1115:15|
 :skolemid |76|
 :pattern ( (ie0Abstract Heap@@46 this@@42))
)))
(assert (forall ((Heap@@47 T@U) (this@@43 T@U) ) (!  (=> (and (= (type Heap@@47) (MapType0Type RefType)) (= (type this@@43) RefType)) (and (= (ie1 Heap@@47 this@@43) (|ie1'| Heap@@47 this@@43)) (dummyFunction (int_2_U (|ie1#triggerStateless| this@@43)))))
 :qid |stdinbpl.1179:15|
 :skolemid |79|
 :pattern ( (ie1 Heap@@47 this@@43))
)))
(assert (forall ((Heap@@48 T@U) (this@@44 T@U) ) (!  (=> (and (= (type Heap@@48) (MapType0Type RefType)) (= (type this@@44) RefType)) (and (= (ie1Abstract Heap@@48 this@@44) (|ie1Abstract'| Heap@@48 this@@44)) (dummyFunction (int_2_U (|ie1Abstract#triggerStateless| this@@44)))))
 :qid |stdinbpl.1263:15|
 :skolemid |84|
 :pattern ( (ie1Abstract Heap@@48 this@@44))
)))
(assert (forall ((Heap@@49 T@U) (this@@45 T@U) ) (!  (=> (and (= (type Heap@@49) (MapType0Type RefType)) (= (type this@@45) RefType)) (and (= (t1 Heap@@49 this@@45) (|t1'| Heap@@49 this@@45)) (dummyFunction (int_2_U (|t1#triggerStateless| this@@45)))))
 :qid |stdinbpl.1333:15|
 :skolemid |88|
 :pattern ( (t1 Heap@@49 this@@45))
)))
(assert (forall ((Heap@@50 T@U) (this@@46 T@U) ) (!  (=> (and (= (type Heap@@50) (MapType0Type RefType)) (= (type this@@46) RefType)) (and (= (t1Abstract Heap@@50 this@@46) (|t1Abstract'| Heap@@50 this@@46)) (dummyFunction (int_2_U (|t1Abstract#triggerStateless| this@@46)))))
 :qid |stdinbpl.1407:15|
 :skolemid |92|
 :pattern ( (t1Abstract Heap@@50 this@@46))
)))
(assert (forall ((Heap@@51 T@U) (this@@47 T@U) ) (!  (=> (and (= (type Heap@@51) (MapType0Type RefType)) (= (type this@@47) RefType)) (and (= (t2 Heap@@51 this@@47) (|t2'| Heap@@51 this@@47)) (dummyFunction (int_2_U (|t2#triggerStateless| this@@47)))))
 :qid |stdinbpl.1472:15|
 :skolemid |95|
 :pattern ( (t2 Heap@@51 this@@47))
)))
(assert (forall ((Heap@@52 T@U) (this@@48 T@U) ) (!  (=> (and (= (type Heap@@52) (MapType0Type RefType)) (= (type this@@48) RefType)) (and (= (t2Abstract Heap@@52 this@@48) (|t2Abstract'| Heap@@52 this@@48)) (dummyFunction (int_2_U (|t2Abstract#triggerStateless| this@@48)))))
 :qid |stdinbpl.1546:15|
 :skolemid |99|
 :pattern ( (t2Abstract Heap@@52 this@@48))
)))
(assert (forall ((Heap@@53 T@U) (this@@49 T@U) ) (!  (=> (and (= (type Heap@@53) (MapType0Type RefType)) (= (type this@@49) RefType)) (and (= (t3 Heap@@53 this@@49) (|t3'| Heap@@53 this@@49)) (dummyFunction (int_2_U (|t3#triggerStateless| this@@49)))))
 :qid |stdinbpl.1611:15|
 :skolemid |102|
 :pattern ( (t3 Heap@@53 this@@49))
)))
(assert (forall ((Heap@@54 T@U) (this@@50 T@U) ) (!  (=> (and (= (type Heap@@54) (MapType0Type RefType)) (= (type this@@50) RefType)) (and (= (t3Abstract Heap@@54 this@@50) (|t3Abstract'| Heap@@54 this@@50)) (dummyFunction (int_2_U (|t3Abstract#triggerStateless| this@@50)))))
 :qid |stdinbpl.1707:15|
 :skolemid |106|
 :pattern ( (t3Abstract Heap@@54 this@@50))
)))
(assert (forall ((Heap@@55 T@U) (this@@51 T@U) ) (!  (=> (and (= (type Heap@@55) (MapType0Type RefType)) (= (type this@@51) RefType)) (and (= (t4 Heap@@55 this@@51) (|t4'| Heap@@55 this@@51)) (dummyFunction (int_2_U (|t4#triggerStateless| this@@51)))))
 :qid |stdinbpl.1789:15|
 :skolemid |109|
 :pattern ( (t4 Heap@@55 this@@51))
)))
(assert (forall ((Heap@@56 T@U) (this@@52 T@U) ) (!  (=> (and (= (type Heap@@56) (MapType0Type RefType)) (= (type this@@52) RefType)) (and (= (t4Abstract Heap@@56 this@@52) (|t4Abstract'| Heap@@56 this@@52)) (dummyFunction (int_2_U (|t4Abstract#triggerStateless| this@@52)))))
 :qid |stdinbpl.1885:15|
 :skolemid |113|
 :pattern ( (t4Abstract Heap@@56 this@@52))
)))
(assert (forall ((Heap@@57 T@U) (this@@53 T@U) ) (!  (=> (and (= (type Heap@@57) (MapType0Type RefType)) (= (type this@@53) RefType)) (and (= (t5 Heap@@57 this@@53) (|t5'| Heap@@57 this@@53)) (dummyFunction (int_2_U (|t5#triggerStateless| this@@53)))))
 :qid |stdinbpl.1967:15|
 :skolemid |116|
 :pattern ( (t5 Heap@@57 this@@53))
)))
(assert (forall ((Heap@@58 T@U) (this@@54 T@U) ) (!  (=> (and (= (type Heap@@58) (MapType0Type RefType)) (= (type this@@54) RefType)) (and (= (t5Abstract Heap@@58 this@@54) (|t5Abstract'| Heap@@58 this@@54)) (dummyFunction (int_2_U (|t5Abstract#triggerStateless| this@@54)))))
 :qid |stdinbpl.2059:15|
 :skolemid |121|
 :pattern ( (t5Abstract Heap@@58 this@@54))
)))
(assert (forall ((Heap@@59 T@U) (this@@55 T@U) ) (!  (=> (and (= (type Heap@@59) (MapType0Type RefType)) (= (type this@@55) RefType)) (and (= (t6 Heap@@59 this@@55) (|t6'| Heap@@59 this@@55)) (dummyFunction (int_2_U (|t6#triggerStateless| this@@55)))))
 :qid |stdinbpl.2139:15|
 :skolemid |125|
 :pattern ( (t6 Heap@@59 this@@55))
)))
(assert (forall ((Heap@@60 T@U) (this@@56 T@U) ) (!  (=> (and (= (type Heap@@60) (MapType0Type RefType)) (= (type this@@56) RefType)) (and (= (t6Abstract Heap@@60 this@@56) (|t6Abstract'| Heap@@60 this@@56)) (dummyFunction (int_2_U (|t6Abstract#triggerStateless| this@@56)))))
 :qid |stdinbpl.2231:15|
 :skolemid |130|
 :pattern ( (t6Abstract Heap@@60 this@@56))
)))
(assert (forall ((Heap@@61 T@U) (Mask@@3 T@U) (this@@57 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@61) (MapType0Type RefType)) (= (type Mask@@3) (MapType1Type RefType realType))) (= (type this@@57) RefType)) (and (state Heap@@61 Mask@@3) (< AssumeFunctionsAbove 9))) (= (U_2_int (MapType0Select Heap@@61 this@@57 x@@8)) 0)) (= (t4 Heap@@61 this@@57) 0))
 :qid |stdinbpl.1799:15|
 :skolemid |111|
 :pattern ( (state Heap@@61 Mask@@3) (t4 Heap@@61 this@@57))
)))
(assert (forall ((Heap@@62 T@U) (ExhaleHeap@@2 T@U) (Mask@@4 T@U) (o_1@@0 T@U) (f_2 T@U) ) (! (let ((B@@1 (FieldTypeInv1 (type f_2))))
(let ((A@@1 (FieldTypeInv0 (type f_2))))
 (=> (and (and (and (and (and (and (= (type Heap@@62) (MapType0Type RefType)) (= (type ExhaleHeap@@2) (MapType0Type RefType))) (= (type Mask@@4) (MapType1Type RefType realType))) (= (type o_1@@0) RefType)) (= (type f_2) (FieldType A@@1 B@@1))) (IdenticalOnKnownLocations Heap@@62 ExhaleHeap@@2 Mask@@4)) (HasDirectPerm Mask@@4 o_1@@0 f_2)) (= (MapType0Select Heap@@62 o_1@@0 f_2) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2)))))
 :qid |stdinbpl.42:22|
 :skolemid |1|
 :pattern ( (IdenticalOnKnownLocations Heap@@62 ExhaleHeap@@2 Mask@@4) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2))
)))
(assert  (and (= (type dummyHeap) (MapType0Type RefType)) (= (type ZeroMask) (MapType1Type RefType realType))))
(assert (state dummyHeap ZeroMask))
(assert (forall ((p T@U) (v_1 T@U) (w T@U) ) (! (let ((A@@2 (FieldTypeInv0 (type p))))
 (=> (and (and (= (type p) (FieldType A@@2 FrameTypeType)) (= (type v_1) FrameTypeType)) (= (type w) FrameTypeType)) (not (InsidePredicate p v_1 p w))))
 :qid |stdinbpl.201:19|
 :skolemid |21|
 :pattern ( (InsidePredicate p v_1 p w))
)))
(assert  (not (IsPredicateField x@@8)))
(assert  (not (IsWandField x@@8)))
(assert (forall ((Heap@@63 T@U) (ExhaleHeap@@3 T@U) (Mask@@5 T@U) ) (!  (=> (and (and (and (= (type Heap@@63) (MapType0Type RefType)) (= (type ExhaleHeap@@3) (MapType0Type RefType))) (= (type Mask@@5) (MapType1Type RefType realType))) (IdenticalOnKnownLocations Heap@@63 ExhaleHeap@@3 Mask@@5)) (succHeap Heap@@63 ExhaleHeap@@3))
 :qid |stdinbpl.83:15|
 :skolemid |10|
 :pattern ( (IdenticalOnKnownLocations Heap@@63 ExhaleHeap@@3 Mask@@5))
)))
(assert (forall ((Heap@@64 T@U) (Mask@@6 T@U) (this@@58 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@64) (MapType0Type RefType)) (= (type Mask@@6) (MapType1Type RefType realType))) (= (type this@@58) RefType)) (and (state Heap@@64 Mask@@6) (< AssumeFunctionsAbove 22))) (not (= this@@58 null))) (= (s2 Heap@@64 this@@58) (U_2_int (MapType0Select Heap@@64 this@@58 x@@8))))
 :qid |stdinbpl.466:15|
 :skolemid |40|
 :pattern ( (state Heap@@64 Mask@@6) (s2 Heap@@64 this@@58))
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
(assert  (and (forall ((arg0@@25 Real) (arg1@@9 T@U) ) (! (= (type (ConditionalFrame arg0@@25 arg1@@9)) FrameTypeType)
 :qid |funType:ConditionalFrame|
 :pattern ( (ConditionalFrame arg0@@25 arg1@@9))
)) (= (type EmptyFrame) FrameTypeType)))
(assert (forall ((p@@0 Real) (f_6 T@U) ) (!  (=> (= (type f_6) FrameTypeType) (= (ConditionalFrame p@@0 f_6) (ite (> p@@0 0.0) f_6 EmptyFrame)))
 :qid |stdinbpl.189:15|
 :skolemid |19|
 :pattern ( (ConditionalFrame p@@0 f_6))
)))
(assert (forall ((Mask@@7 T@U) (o_2@@0 T@U) (f_4@@0 T@U) ) (! (let ((B@@3 (FieldTypeInv1 (type f_4@@0))))
(let ((A@@4 (FieldTypeInv0 (type f_4@@0))))
 (=> (and (and (= (type Mask@@7) (MapType1Type RefType realType)) (= (type o_2@@0) RefType)) (= (type f_4@@0) (FieldType A@@4 B@@3))) (= (HasDirectPerm Mask@@7 o_2@@0 f_4@@0) (> (U_2_real (MapType1Select Mask@@7 o_2@@0 f_4@@0)) NoPerm)))))
 :qid |stdinbpl.133:22|
 :skolemid |17|
 :pattern ( (HasDirectPerm Mask@@7 o_2@@0 f_4@@0))
)))
(assert (forall ((o_2@@1 T@U) (f_4@@1 T@U) ) (! (let ((B@@4 (FieldTypeInv1 (type f_4@@1))))
(let ((A@@5 (FieldTypeInv0 (type f_4@@1))))
 (=> (and (= (type o_2@@1) RefType) (= (type f_4@@1) (FieldType A@@5 B@@4))) (= (U_2_real (MapType1Select ZeroMask o_2@@1 f_4@@1)) NoPerm))))
 :qid |stdinbpl.106:22|
 :skolemid |13|
 :pattern ( (MapType1Select ZeroMask o_2@@1 f_4@@1))
)))
(assert (forall ((arg0@@26 T@U) ) (! (= (type (FrameFragment arg0@@26)) FrameTypeType)
 :qid |funType:FrameFragment|
 :pattern ( (FrameFragment arg0@@26))
)))
(assert (forall ((Heap@@65 T@U) (Mask@@8 T@U) (this@@59 T@U) ) (!  (=> (and (and (and (= (type Heap@@65) (MapType0Type RefType)) (= (type Mask@@8) (MapType1Type RefType realType))) (= (type this@@59) RefType)) (and (state Heap@@65 Mask@@8) (or (< AssumeFunctionsAbove 10) (|t5#trigger| (FrameFragment (MapType0Select Heap@@65 this@@59 x@@8)) this@@59)))) (and (not (= this@@59 null)) (= (U_2_int (MapType0Select Heap@@65 this@@59 x@@8)) 0)))
 :qid |stdinbpl.1990:15|
 :skolemid |120|
 :pattern ( (state Heap@@65 Mask@@8) (|t5'| Heap@@65 this@@59))
)))
(assert (forall ((Heap@@66 T@U) (Mask@@9 T@U) (this@@60 T@U) ) (!  (=> (and (and (and (= (type Heap@@66) (MapType0Type RefType)) (= (type Mask@@9) (MapType1Type RefType realType))) (= (type this@@60) RefType)) (and (state Heap@@66 Mask@@9) (or (< AssumeFunctionsAbove 25) (|t5Abstract#trigger| (FrameFragment (MapType0Select Heap@@66 this@@60 x@@8)) this@@60)))) (and (not (= this@@60 null)) (= (U_2_int (MapType0Select Heap@@66 this@@60 x@@8)) 0)))
 :qid |stdinbpl.2076:15|
 :skolemid |124|
 :pattern ( (state Heap@@66 Mask@@9) (|t5Abstract'| Heap@@66 this@@60))
)))
(assert (forall ((Heap@@67 T@U) (Mask@@10 T@U) (this@@61 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@67) (MapType0Type RefType)) (= (type Mask@@10) (MapType1Type RefType realType))) (= (type this@@61) RefType)) (and (state Heap@@67 Mask@@10) (< AssumeFunctionsAbove 8))) (and (not (= this@@61 null)) (= (U_2_int (MapType0Select Heap@@67 this@@61 x@@8)) 0))) (= (t1 Heap@@67 this@@61) 0))
 :qid |stdinbpl.1343:15|
 :skolemid |90|
 :pattern ( (state Heap@@67 Mask@@10) (t1 Heap@@67 this@@61))
)))
(assert (forall ((Heap@@68 T@U) (Mask@@11 T@U) (this@@62 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@68) (MapType0Type RefType)) (= (type Mask@@11) (MapType1Type RefType realType))) (= (type this@@62) RefType)) (and (state Heap@@68 Mask@@11) (< AssumeFunctionsAbove 11))) (and (not (= this@@62 null)) (= (U_2_int (MapType0Select Heap@@68 this@@62 x@@8)) 0))) (= (e0 Heap@@68 this@@62) 0))
 :qid |stdinbpl.791:15|
 :skolemid |60|
 :pattern ( (state Heap@@68 Mask@@11) (e0 Heap@@68 this@@62))
)))
(assert (forall ((Heap@@69 T@U) (Mask@@12 T@U) (this@@63 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@69) (MapType0Type RefType)) (= (type Mask@@12) (MapType1Type RefType realType))) (= (type this@@63) RefType)) (and (state Heap@@69 Mask@@12) (< AssumeFunctionsAbove 21))) (and (not (= this@@63 null)) (= (U_2_int (MapType0Select Heap@@69 this@@63 x@@8)) 0))) (= (ie0 Heap@@69 this@@63) 0))
 :qid |stdinbpl.1052:15|
 :skolemid |74|
 :pattern ( (state Heap@@69 Mask@@12) (ie0 Heap@@69 this@@63))
)))
(assert (forall ((Heap@@70 T@U) (Mask@@13 T@U) (this@@64 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@70) (MapType0Type RefType)) (= (type Mask@@13) (MapType1Type RefType realType))) (= (type this@@64) RefType)) (and (state Heap@@70 Mask@@13) (< AssumeFunctionsAbove 28))) (and (not (= this@@64 null)) (= (U_2_int (MapType0Select Heap@@70 this@@64 x@@8)) 0))) (= (s0 Heap@@70 this@@64) 0))
 :qid |stdinbpl.231:15|
 :skolemid |24|
 :pattern ( (state Heap@@70 Mask@@13) (s0 Heap@@70 this@@64))
)))
(assert (forall ((Heap@@71 T@U) (ExhaleHeap@@4 T@U) (Mask@@14 T@U) (pm_f@@1 T@U) ) (! (let ((C@@1 (FieldTypeInv0 (type pm_f@@1))))
 (=> (and (and (and (and (and (= (type Heap@@71) (MapType0Type RefType)) (= (type ExhaleHeap@@4) (MapType0Type RefType))) (= (type Mask@@14) (MapType1Type RefType realType))) (= (type pm_f@@1) (FieldType C@@1 FrameTypeType))) (IdenticalOnKnownLocations Heap@@71 ExhaleHeap@@4 Mask@@14)) (and (HasDirectPerm Mask@@14 null pm_f@@1) (IsPredicateField pm_f@@1))) (forall ((o2 T@U) (f_2@@0 T@U) ) (! (let ((B@@5 (FieldTypeInv1 (type f_2@@0))))
(let ((A@@6 (FieldTypeInv0 (type f_2@@0))))
 (=> (and (and (= (type o2) RefType) (= (type f_2@@0) (FieldType A@@6 B@@5))) (U_2_bool (MapType1Select (MapType0Select Heap@@71 null (PredicateMaskField pm_f@@1)) o2 f_2@@0))) (= (MapType0Select Heap@@71 o2 f_2@@0) (MapType0Select ExhaleHeap@@4 o2 f_2@@0)))))
 :qid |stdinbpl.54:134|
 :skolemid |3|
 :pattern ( (MapType0Select ExhaleHeap@@4 o2 f_2@@0))
))))
 :qid |stdinbpl.52:19|
 :skolemid |4|
 :pattern ( (IdenticalOnKnownLocations Heap@@71 ExhaleHeap@@4 Mask@@14) (IsPredicateField pm_f@@1))
)))
(assert (forall ((Heap@@72 T@U) (ExhaleHeap@@5 T@U) (Mask@@15 T@U) (pm_f@@2 T@U) ) (! (let ((C@@2 (FieldTypeInv0 (type pm_f@@2))))
 (=> (and (and (and (and (and (= (type Heap@@72) (MapType0Type RefType)) (= (type ExhaleHeap@@5) (MapType0Type RefType))) (= (type Mask@@15) (MapType1Type RefType realType))) (= (type pm_f@@2) (FieldType C@@2 FrameTypeType))) (IdenticalOnKnownLocations Heap@@72 ExhaleHeap@@5 Mask@@15)) (and (HasDirectPerm Mask@@15 null pm_f@@2) (IsWandField pm_f@@2))) (forall ((o2@@0 T@U) (f_2@@1 T@U) ) (! (let ((B@@6 (FieldTypeInv1 (type f_2@@1))))
(let ((A@@7 (FieldTypeInv0 (type f_2@@1))))
 (=> (and (and (= (type o2@@0) RefType) (= (type f_2@@1) (FieldType A@@7 B@@6))) (U_2_bool (MapType1Select (MapType0Select Heap@@72 null (WandMaskField pm_f@@2)) o2@@0 f_2@@1))) (= (MapType0Select Heap@@72 o2@@0 f_2@@1) (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1)))))
 :qid |stdinbpl.67:129|
 :skolemid |6|
 :pattern ( (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1))
))))
 :qid |stdinbpl.65:19|
 :skolemid |7|
 :pattern ( (IdenticalOnKnownLocations Heap@@72 ExhaleHeap@@5 Mask@@15) (IsWandField pm_f@@2))
)))
(assert (forall ((Mask@@16 T@U) (o_2@@2 T@U) (f_4@@2 T@U) ) (! (let ((B@@7 (FieldTypeInv1 (type f_4@@2))))
(let ((A@@8 (FieldTypeInv0 (type f_4@@2))))
 (=> (and (and (and (= (type Mask@@16) (MapType1Type RefType realType)) (= (type o_2@@2) RefType)) (= (type f_4@@2) (FieldType A@@8 B@@7))) (GoodMask Mask@@16)) (and (>= (U_2_real (MapType1Select Mask@@16 o_2@@2 f_4@@2)) NoPerm) (=> (and (and (GoodMask Mask@@16) (not (IsPredicateField f_4@@2))) (not (IsWandField f_4@@2))) (<= (U_2_real (MapType1Select Mask@@16 o_2@@2 f_4@@2)) FullPerm))))))
 :qid |stdinbpl.128:22|
 :skolemid |16|
 :pattern ( (GoodMask Mask@@16) (MapType1Select Mask@@16 o_2@@2 f_4@@2))
)))
(assert (forall ((Heap@@73 T@U) (Mask@@17 T@U) (this@@65 T@U) ) (!  (=> (and (and (and (= (type Heap@@73) (MapType0Type RefType)) (= (type Mask@@17) (MapType1Type RefType realType))) (= (type this@@65) RefType)) (state Heap@@73 Mask@@17)) (= (|s0'| Heap@@73 this@@65) (|s0#frame| EmptyFrame this@@65)))
 :qid |stdinbpl.238:15|
 :skolemid |25|
 :pattern ( (state Heap@@73 Mask@@17) (|s0'| Heap@@73 this@@65))
)))
(assert (forall ((Heap@@74 T@U) (Mask@@18 T@U) (this@@66 T@U) ) (!  (=> (and (and (and (= (type Heap@@74) (MapType0Type RefType)) (= (type Mask@@18) (MapType1Type RefType realType))) (= (type this@@66) RefType)) (state Heap@@74 Mask@@18)) (= (|s0Abstract'| Heap@@74 this@@66) (|s0Abstract#frame| EmptyFrame this@@66)))
 :qid |stdinbpl.291:15|
 :skolemid |28|
 :pattern ( (state Heap@@74 Mask@@18) (|s0Abstract'| Heap@@74 this@@66))
)))
(assert (forall ((Heap@@75 T@U) (Mask@@19 T@U) (this@@67 T@U) ) (!  (=> (and (and (and (= (type Heap@@75) (MapType0Type RefType)) (= (type Mask@@19) (MapType1Type RefType realType))) (= (type this@@67) RefType)) (state Heap@@75 Mask@@19)) (= (|s1'| Heap@@75 this@@67) (|s1#frame| EmptyFrame this@@67)))
 :qid |stdinbpl.347:15|
 :skolemid |32|
 :pattern ( (state Heap@@75 Mask@@19) (|s1'| Heap@@75 this@@67))
)))
(assert (forall ((Heap@@76 T@U) (Mask@@20 T@U) (this@@68 T@U) ) (!  (=> (and (and (and (= (type Heap@@76) (MapType0Type RefType)) (= (type Mask@@20) (MapType1Type RefType realType))) (= (type this@@68) RefType)) (state Heap@@76 Mask@@20)) (= (|s1Abstract'| Heap@@76 this@@68) (|s1Abstract#frame| EmptyFrame this@@68)))
 :qid |stdinbpl.411:15|
 :skolemid |36|
 :pattern ( (state Heap@@76 Mask@@20) (|s1Abstract'| Heap@@76 this@@68))
)))
(assert (forall ((Heap@@77 T@U) (Mask@@21 T@U) (this@@69 T@U) ) (!  (=> (and (and (and (= (type Heap@@77) (MapType0Type RefType)) (= (type Mask@@21) (MapType1Type RefType realType))) (= (type this@@69) RefType)) (state Heap@@77 Mask@@21)) (= (|s2'| Heap@@77 this@@69) (|s2#frame| EmptyFrame this@@69)))
 :qid |stdinbpl.473:15|
 :skolemid |41|
 :pattern ( (state Heap@@77 Mask@@21) (|s2'| Heap@@77 this@@69))
)))
(assert (forall ((Heap@@78 T@U) (Mask@@22 T@U) (this@@70 T@U) ) (!  (=> (and (and (and (= (type Heap@@78) (MapType0Type RefType)) (= (type Mask@@22) (MapType1Type RefType realType))) (= (type this@@70) RefType)) (state Heap@@78 Mask@@22)) (= (|i0'| Heap@@78 this@@70) (|i0#frame| EmptyFrame this@@70)))
 :qid |stdinbpl.533:15|
 :skolemid |45|
 :pattern ( (state Heap@@78 Mask@@22) (|i0'| Heap@@78 this@@70))
)))
(assert (forall ((Heap@@79 T@U) (Mask@@23 T@U) (this@@71 T@U) ) (!  (=> (and (and (and (= (type Heap@@79) (MapType0Type RefType)) (= (type Mask@@23) (MapType1Type RefType realType))) (= (type this@@71) RefType)) (state Heap@@79 Mask@@23)) (= (|i0Abstract'| Heap@@79 this@@71) (|i0Abstract#frame| EmptyFrame this@@71)))
 :qid |stdinbpl.594:15|
 :skolemid |48|
 :pattern ( (state Heap@@79 Mask@@23) (|i0Abstract'| Heap@@79 this@@71))
)))
(assert (forall ((Heap@@80 T@U) (Mask@@24 T@U) (this@@72 T@U) ) (!  (=> (and (and (and (= (type Heap@@80) (MapType0Type RefType)) (= (type Mask@@24) (MapType1Type RefType realType))) (= (type this@@72) RefType)) (state Heap@@80 Mask@@24)) (= (|i1'| Heap@@80 this@@72) (|i1#frame| EmptyFrame this@@72)))
 :qid |stdinbpl.658:15|
 :skolemid |52|
 :pattern ( (state Heap@@80 Mask@@24) (|i1'| Heap@@80 this@@72))
)))
(assert (forall ((Heap@@81 T@U) (Mask@@25 T@U) (this@@73 T@U) ) (!  (=> (and (and (and (= (type Heap@@81) (MapType0Type RefType)) (= (type Mask@@25) (MapType1Type RefType realType))) (= (type this@@73) RefType)) (state Heap@@81 Mask@@25)) (= (|i1Abstract'| Heap@@81 this@@73) (|i1Abstract#frame| EmptyFrame this@@73)))
 :qid |stdinbpl.728:15|
 :skolemid |56|
 :pattern ( (state Heap@@81 Mask@@25) (|i1Abstract'| Heap@@81 this@@73))
)))
(assert (forall ((Heap@@82 T@U) (Mask@@26 T@U) (this@@74 T@U) ) (!  (=> (and (and (and (= (type Heap@@82) (MapType0Type RefType)) (= (type Mask@@26) (MapType1Type RefType realType))) (= (type this@@74) RefType)) (state Heap@@82 Mask@@26)) (= (|e0'| Heap@@82 this@@74) (|e0#frame| EmptyFrame this@@74)))
 :qid |stdinbpl.798:15|
 :skolemid |61|
 :pattern ( (state Heap@@82 Mask@@26) (|e0'| Heap@@82 this@@74))
)))
(assert (forall ((Heap@@83 T@U) (Mask@@27 T@U) (this@@75 T@U) ) (!  (=> (and (and (and (= (type Heap@@83) (MapType0Type RefType)) (= (type Mask@@27) (MapType1Type RefType realType))) (= (type this@@75) RefType)) (state Heap@@83 Mask@@27)) (= (|e0Abstract'| Heap@@83 this@@75) (|e0Abstract#frame| EmptyFrame this@@75)))
 :qid |stdinbpl.859:15|
 :skolemid |64|
 :pattern ( (state Heap@@83 Mask@@27) (|e0Abstract'| Heap@@83 this@@75))
)))
(assert (forall ((Heap@@84 T@U) (Mask@@28 T@U) (this@@76 T@U) ) (!  (=> (and (and (and (= (type Heap@@84) (MapType0Type RefType)) (= (type Mask@@28) (MapType1Type RefType realType))) (= (type this@@76) RefType)) (state Heap@@84 Mask@@28)) (= (|e1'| Heap@@84 this@@76) (|e1#frame| EmptyFrame this@@76)))
 :qid |stdinbpl.923:15|
 :skolemid |68|
 :pattern ( (state Heap@@84 Mask@@28) (|e1'| Heap@@84 this@@76))
)))
(assert (forall ((Heap@@85 T@U) (Mask@@29 T@U) (this@@77 T@U) ) (!  (=> (and (and (and (= (type Heap@@85) (MapType0Type RefType)) (= (type Mask@@29) (MapType1Type RefType realType))) (= (type this@@77) RefType)) (state Heap@@85 Mask@@29)) (= (|e1Abstract'| Heap@@85 this@@77) (|e1Abstract#frame| EmptyFrame this@@77)))
 :qid |stdinbpl.992:15|
 :skolemid |71|
 :pattern ( (state Heap@@85 Mask@@29) (|e1Abstract'| Heap@@85 this@@77))
)))
(assert (forall ((Heap@@86 T@U) (Mask@@30 T@U) (this@@78 T@U) ) (!  (=> (and (and (and (= (type Heap@@86) (MapType0Type RefType)) (= (type Mask@@30) (MapType1Type RefType realType))) (= (type this@@78) RefType)) (state Heap@@86 Mask@@30)) (= (|ie0'| Heap@@86 this@@78) (|ie0#frame| EmptyFrame this@@78)))
 :qid |stdinbpl.1059:15|
 :skolemid |75|
 :pattern ( (state Heap@@86 Mask@@30) (|ie0'| Heap@@86 this@@78))
)))
(assert (forall ((Heap@@87 T@U) (Mask@@31 T@U) (this@@79 T@U) ) (!  (=> (and (and (and (= (type Heap@@87) (MapType0Type RefType)) (= (type Mask@@31) (MapType1Type RefType realType))) (= (type this@@79) RefType)) (state Heap@@87 Mask@@31)) (= (|ie0Abstract'| Heap@@87 this@@79) (|ie0Abstract#frame| EmptyFrame this@@79)))
 :qid |stdinbpl.1126:15|
 :skolemid |78|
 :pattern ( (state Heap@@87 Mask@@31) (|ie0Abstract'| Heap@@87 this@@79))
)))
(assert (forall ((Heap@@88 T@U) (Mask@@32 T@U) (this@@80 T@U) ) (!  (=> (and (and (and (= (type Heap@@88) (MapType0Type RefType)) (= (type Mask@@32) (MapType1Type RefType realType))) (= (type this@@80) RefType)) (state Heap@@88 Mask@@32)) (= (|ie1'| Heap@@88 this@@80) (|ie1#frame| EmptyFrame this@@80)))
 :qid |stdinbpl.1196:15|
 :skolemid |82|
 :pattern ( (state Heap@@88 Mask@@32) (|ie1'| Heap@@88 this@@80))
)))
(assert (forall ((Heap@@89 T@U) (Mask@@33 T@U) (this@@81 T@U) ) (!  (=> (and (and (and (= (type Heap@@89) (MapType0Type RefType)) (= (type Mask@@33) (MapType1Type RefType realType))) (= (type this@@81) RefType)) (state Heap@@89 Mask@@33)) (= (|ie1Abstract'| Heap@@89 this@@81) (|ie1Abstract#frame| EmptyFrame this@@81)))
 :qid |stdinbpl.1274:15|
 :skolemid |86|
 :pattern ( (state Heap@@89 Mask@@33) (|ie1Abstract'| Heap@@89 this@@81))
)))
(assert (forall ((Heap@@90 T@U) (Mask@@34 T@U) (this@@82 T@U) ) (!  (=> (and (and (and (= (type Heap@@90) (MapType0Type RefType)) (= (type Mask@@34) (MapType1Type RefType realType))) (= (type this@@82) RefType)) (state Heap@@90 Mask@@34)) (= (|t1'| Heap@@90 this@@82) (|t1#frame| EmptyFrame this@@82)))
 :qid |stdinbpl.1350:15|
 :skolemid |91|
 :pattern ( (state Heap@@90 Mask@@34) (|t1'| Heap@@90 this@@82))
)))
(assert (forall ((Heap@@91 T@U) (Mask@@35 T@U) (this@@83 T@U) ) (!  (=> (and (and (and (= (type Heap@@91) (MapType0Type RefType)) (= (type Mask@@35) (MapType1Type RefType realType))) (= (type this@@83) RefType)) (state Heap@@91 Mask@@35)) (= (|t1Abstract'| Heap@@91 this@@83) (|t1Abstract#frame| EmptyFrame this@@83)))
 :qid |stdinbpl.1418:15|
 :skolemid |94|
 :pattern ( (state Heap@@91 Mask@@35) (|t1Abstract'| Heap@@91 this@@83))
)))
(assert (forall ((Heap@@92 T@U) (Mask@@36 T@U) (this@@84 T@U) ) (!  (=> (and (and (and (= (type Heap@@92) (MapType0Type RefType)) (= (type Mask@@36) (MapType1Type RefType realType))) (= (type this@@84) RefType)) (state Heap@@92 Mask@@36)) (= (|t3'| Heap@@92 this@@84) (|t3#frame| EmptyFrame this@@84)))
 :qid |stdinbpl.1628:15|
 :skolemid |105|
 :pattern ( (state Heap@@92 Mask@@36) (|t3'| Heap@@92 this@@84))
)))
(assert (forall ((Heap@@93 T@U) (Mask@@37 T@U) (this@@85 T@U) ) (!  (=> (and (and (and (= (type Heap@@93) (MapType0Type RefType)) (= (type Mask@@37) (MapType1Type RefType realType))) (= (type this@@85) RefType)) (state Heap@@93 Mask@@37)) (= (|t3Abstract'| Heap@@93 this@@85) (|t3Abstract#frame| EmptyFrame this@@85)))
 :qid |stdinbpl.1718:15|
 :skolemid |108|
 :pattern ( (state Heap@@93 Mask@@37) (|t3Abstract'| Heap@@93 this@@85))
)))
(assert (forall ((Heap@@94 T@U) (Mask@@38 T@U) (this@@86 T@U) ) (!  (=> (and (and (and (= (type Heap@@94) (MapType0Type RefType)) (= (type Mask@@38) (MapType1Type RefType realType))) (= (type this@@86) RefType)) (state Heap@@94 Mask@@38)) (= (|t6'| Heap@@94 this@@86) (|t6#frame| EmptyFrame this@@86)))
 :qid |stdinbpl.2156:15|
 :skolemid |128|
 :pattern ( (state Heap@@94 Mask@@38) (|t6'| Heap@@94 this@@86))
)))
(assert (forall ((Heap@@95 T@U) (Mask@@39 T@U) (this@@87 T@U) ) (!  (=> (and (and (and (= (type Heap@@95) (MapType0Type RefType)) (= (type Mask@@39) (MapType1Type RefType realType))) (= (type this@@87) RefType)) (state Heap@@95 Mask@@39)) (= (|t6Abstract'| Heap@@95 this@@87) (|t6Abstract#frame| EmptyFrame this@@87)))
 :qid |stdinbpl.2242:15|
 :skolemid |132|
 :pattern ( (state Heap@@95 Mask@@39) (|t6Abstract'| Heap@@95 this@@87))
)))
(assert (forall ((Heap@@96 T@U) (Mask@@40 T@U) (this@@88 T@U) ) (!  (=> (and (and (and (= (type Heap@@96) (MapType0Type RefType)) (= (type Mask@@40) (MapType1Type RefType realType))) (= (type this@@88) RefType)) (and (state Heap@@96 Mask@@40) (or (< AssumeFunctionsAbove 2) (|i1Abstract#trigger| EmptyFrame this@@88)))) (and (not (= this@@88 null)) (= (U_2_int (MapType0Select Heap@@96 this@@88 x@@8)) 0)))
 :qid |stdinbpl.734:15|
 :skolemid |57|
 :pattern ( (state Heap@@96 Mask@@40) (|i1Abstract'| Heap@@96 this@@88))
)))
(assert (forall ((Heap@@97 T@U) (Mask@@41 T@U) (this@@89 T@U) ) (!  (=> (and (and (and (= (type Heap@@97) (MapType0Type RefType)) (= (type Mask@@41) (MapType1Type RefType realType))) (= (type this@@89) RefType)) (and (state Heap@@97 Mask@@41) (or (< AssumeFunctionsAbove 3) (|ie1Abstract#trigger| EmptyFrame this@@89)))) (and (not (= this@@89 null)) (= (U_2_int (MapType0Select Heap@@97 this@@89 x@@8)) 0)))
 :qid |stdinbpl.1280:15|
 :skolemid |87|
 :pattern ( (state Heap@@97 Mask@@41) (|ie1Abstract'| Heap@@97 this@@89))
)))
(assert (forall ((Heap@@98 T@U) (Mask@@42 T@U) (this@@90 T@U) ) (!  (=> (and (and (and (= (type Heap@@98) (MapType0Type RefType)) (= (type Mask@@42) (MapType1Type RefType realType))) (= (type this@@90) RefType)) (and (state Heap@@98 Mask@@42) (or (< AssumeFunctionsAbove 7) (|ie1#trigger| EmptyFrame this@@90)))) (and (not (= this@@90 null)) (= (U_2_int (MapType0Select Heap@@98 this@@90 x@@8)) 0)))
 :qid |stdinbpl.1202:15|
 :skolemid |83|
 :pattern ( (state Heap@@98 Mask@@42) (|ie1'| Heap@@98 this@@90))
)))
(assert (forall ((Heap@@99 T@U) (Mask@@43 T@U) (this@@91 T@U) ) (!  (=> (and (and (and (= (type Heap@@99) (MapType0Type RefType)) (= (type Mask@@43) (MapType1Type RefType realType))) (= (type this@@91) RefType)) (and (state Heap@@99 Mask@@43) (or (< AssumeFunctionsAbove 16) (|t6#trigger| EmptyFrame this@@91)))) (and (not (= this@@91 null)) (= (U_2_int (MapType0Select Heap@@99 this@@91 x@@8)) 0)))
 :qid |stdinbpl.2162:15|
 :skolemid |129|
 :pattern ( (state Heap@@99 Mask@@43) (|t6'| Heap@@99 this@@91))
)))
(assert (forall ((Heap@@100 T@U) (Mask@@44 T@U) (this@@92 T@U) ) (!  (=> (and (and (and (= (type Heap@@100) (MapType0Type RefType)) (= (type Mask@@44) (MapType1Type RefType realType))) (= (type this@@92) RefType)) (and (state Heap@@100 Mask@@44) (or (< AssumeFunctionsAbove 19) (|t6Abstract#trigger| EmptyFrame this@@92)))) (and (not (= this@@92 null)) (= (U_2_int (MapType0Select Heap@@100 this@@92 x@@8)) 0)))
 :qid |stdinbpl.2248:15|
 :skolemid |133|
 :pattern ( (state Heap@@100 Mask@@44) (|t6Abstract'| Heap@@100 this@@92))
)))
(assert (forall ((Heap@@101 T@U) (Mask@@45 T@U) (this@@93 T@U) ) (!  (=> (and (and (and (= (type Heap@@101) (MapType0Type RefType)) (= (type Mask@@45) (MapType1Type RefType realType))) (= (type this@@93) RefType)) (and (state Heap@@101 Mask@@45) (or (< AssumeFunctionsAbove 20) (|s1Abstract#trigger| EmptyFrame this@@93)))) (and (not (= this@@93 null)) (= (U_2_int (MapType0Select Heap@@101 this@@93 x@@8)) 0)))
 :qid |stdinbpl.417:15|
 :skolemid |37|
 :pattern ( (state Heap@@101 Mask@@45) (|s1Abstract'| Heap@@101 this@@93))
)))
(assert (forall ((Heap@@102 T@U) (Mask@@46 T@U) (this@@94 T@U) ) (!  (=> (and (and (and (= (type Heap@@102) (MapType0Type RefType)) (= (type Mask@@46) (MapType1Type RefType realType))) (= (type this@@94) RefType)) (and (state Heap@@102 Mask@@46) (or (< AssumeFunctionsAbove 24) (|i1#trigger| EmptyFrame this@@94)))) (and (not (= this@@94 null)) (= (U_2_int (MapType0Select Heap@@102 this@@94 x@@8)) 0)))
 :qid |stdinbpl.664:15|
 :skolemid |53|
 :pattern ( (state Heap@@102 Mask@@46) (|i1'| Heap@@102 this@@94))
)))
(assert (forall ((Heap@@103 T@U) (Mask@@47 T@U) (this@@95 T@U) ) (!  (=> (and (and (and (= (type Heap@@103) (MapType0Type RefType)) (= (type Mask@@47) (MapType1Type RefType realType))) (= (type this@@95) RefType)) (and (state Heap@@103 Mask@@47) (or (< AssumeFunctionsAbove 26) (|s1#trigger| EmptyFrame this@@95)))) (and (not (= this@@95 null)) (= (U_2_int (MapType0Select Heap@@103 this@@95 x@@8)) 0)))
 :qid |stdinbpl.353:15|
 :skolemid |33|
 :pattern ( (state Heap@@103 Mask@@47) (|s1'| Heap@@103 this@@95))
)))
(assert (forall ((Heap@@104 T@U) (Mask@@48 T@U) (this@@96 T@U) ) (!  (=> (and (and (and (= (type Heap@@104) (MapType0Type RefType)) (= (type Mask@@48) (MapType1Type RefType realType))) (= (type this@@96) RefType)) (state Heap@@104 Mask@@48)) (= (|t2'| Heap@@104 this@@96) (|t2#frame| (FrameFragment (MapType0Select Heap@@104 this@@96 x@@8)) this@@96)))
 :qid |stdinbpl.1489:15|
 :skolemid |98|
 :pattern ( (state Heap@@104 Mask@@48) (|t2'| Heap@@104 this@@96))
)))
(assert (forall ((Heap@@105 T@U) (Mask@@49 T@U) (this@@97 T@U) ) (!  (=> (and (and (and (= (type Heap@@105) (MapType0Type RefType)) (= (type Mask@@49) (MapType1Type RefType realType))) (= (type this@@97) RefType)) (state Heap@@105 Mask@@49)) (= (|t2Abstract'| Heap@@105 this@@97) (|t2Abstract#frame| (FrameFragment (MapType0Select Heap@@105 this@@97 x@@8)) this@@97)))
 :qid |stdinbpl.1557:15|
 :skolemid |101|
 :pattern ( (state Heap@@105 Mask@@49) (|t2Abstract'| Heap@@105 this@@97))
)))
(assert (forall ((Heap@@106 T@U) (Mask@@50 T@U) (this@@98 T@U) ) (!  (=> (and (and (and (= (type Heap@@106) (MapType0Type RefType)) (= (type Mask@@50) (MapType1Type RefType realType))) (= (type this@@98) RefType)) (state Heap@@106 Mask@@50)) (= (|t4'| Heap@@106 this@@98) (|t4#frame| (FrameFragment (MapType0Select Heap@@106 this@@98 x@@8)) this@@98)))
 :qid |stdinbpl.1806:15|
 :skolemid |112|
 :pattern ( (state Heap@@106 Mask@@50) (|t4'| Heap@@106 this@@98))
)))
(assert (forall ((Heap@@107 T@U) (Mask@@51 T@U) (this@@99 T@U) ) (!  (=> (and (and (and (= (type Heap@@107) (MapType0Type RefType)) (= (type Mask@@51) (MapType1Type RefType realType))) (= (type this@@99) RefType)) (state Heap@@107 Mask@@51)) (= (|t4Abstract'| Heap@@107 this@@99) (|t4Abstract#frame| (FrameFragment (MapType0Select Heap@@107 this@@99 x@@8)) this@@99)))
 :qid |stdinbpl.1896:15|
 :skolemid |115|
 :pattern ( (state Heap@@107 Mask@@51) (|t4Abstract'| Heap@@107 this@@99))
)))
(assert (forall ((Heap@@108 T@U) (Mask@@52 T@U) (this@@100 T@U) ) (!  (=> (and (and (and (= (type Heap@@108) (MapType0Type RefType)) (= (type Mask@@52) (MapType1Type RefType realType))) (= (type this@@100) RefType)) (state Heap@@108 Mask@@52)) (= (|t5'| Heap@@108 this@@100) (|t5#frame| (FrameFragment (MapType0Select Heap@@108 this@@100 x@@8)) this@@100)))
 :qid |stdinbpl.1984:15|
 :skolemid |119|
 :pattern ( (state Heap@@108 Mask@@52) (|t5'| Heap@@108 this@@100))
)))
(assert (forall ((Heap@@109 T@U) (Mask@@53 T@U) (this@@101 T@U) ) (!  (=> (and (and (and (= (type Heap@@109) (MapType0Type RefType)) (= (type Mask@@53) (MapType1Type RefType realType))) (= (type this@@101) RefType)) (state Heap@@109 Mask@@53)) (= (|t5Abstract'| Heap@@109 this@@101) (|t5Abstract#frame| (FrameFragment (MapType0Select Heap@@109 this@@101 x@@8)) this@@101)))
 :qid |stdinbpl.2070:15|
 :skolemid |123|
 :pattern ( (state Heap@@109 Mask@@53) (|t5Abstract'| Heap@@109 this@@101))
)))
(assert (forall ((o T@U) (f T@U) (Heap@@110 T@U) ) (!  (=> (and (and (and (= (type o) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap@@110) (MapType0Type RefType))) (U_2_bool (MapType0Select Heap@@110 o $allocated))) (U_2_bool (MapType0Select Heap@@110 (MapType0Select Heap@@110 o f) $allocated)))
 :qid |stdinbpl.31:15|
 :skolemid |0|
 :pattern ( (MapType0Select Heap@@110 o f))
)))
(assert (forall ((Heap@@111 T@U) (o@@0 T@U) (f_3 T@U) (v T@U) ) (! (let ((B@@8 (type v)))
(let ((A@@9 (FieldTypeInv0 (type f_3))))
 (=> (and (and (= (type Heap@@111) (MapType0Type RefType)) (= (type o@@0) RefType)) (= (type f_3) (FieldType A@@9 B@@8))) (succHeap Heap@@111 (MapType0Store Heap@@111 o@@0 f_3 v)))))
 :qid |stdinbpl.78:22|
 :skolemid |9|
 :pattern ( (MapType0Store Heap@@111 o@@0 f_3 v))
)))
(assert (= (type ZeroPMask) (MapType1Type RefType boolType)))
(assert (forall ((o_2@@3 T@U) (f_4@@3 T@U) ) (! (let ((B@@9 (FieldTypeInv1 (type f_4@@3))))
(let ((A@@10 (FieldTypeInv0 (type f_4@@3))))
 (=> (and (= (type o_2@@3) RefType) (= (type f_4@@3) (FieldType A@@10 B@@9))) (not (U_2_bool (MapType1Select ZeroPMask o_2@@3 f_4@@3))))))
 :qid |stdinbpl.112:22|
 :skolemid |14|
 :pattern ( (MapType1Select ZeroPMask o_2@@3 f_4@@3))
)))
(assert (forall ((p@@1 T@U) (v_1@@0 T@U) (q T@U) (w@@0 T@U) (r T@U) (u T@U) ) (! (let ((C@@3 (FieldTypeInv0 (type r))))
(let ((B@@10 (FieldTypeInv0 (type q))))
(let ((A@@11 (FieldTypeInv0 (type p@@1))))
 (=> (and (and (and (and (and (and (= (type p@@1) (FieldType A@@11 FrameTypeType)) (= (type v_1@@0) FrameTypeType)) (= (type q) (FieldType B@@10 FrameTypeType))) (= (type w@@0) FrameTypeType)) (= (type r) (FieldType C@@3 FrameTypeType))) (= (type u) FrameTypeType)) (and (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))) (InsidePredicate p@@1 v_1@@0 r u)))))
 :qid |stdinbpl.196:25|
 :skolemid |20|
 :pattern ( (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))
)))
(assert (forall ((Heap@@112 T@U) (Mask@@54 T@U) (this@@102 T@U) ) (!  (=> (and (and (and (= (type Heap@@112) (MapType0Type RefType)) (= (type Mask@@54) (MapType1Type RefType realType))) (= (type this@@102) RefType)) (and (state Heap@@112 Mask@@54) (< AssumeFunctionsAbove 6))) (= (t3 Heap@@112 this@@102) 0))
 :qid |stdinbpl.1621:15|
 :skolemid |104|
 :pattern ( (state Heap@@112 Mask@@54) (t3 Heap@@112 this@@102))
)))
(assert (forall ((Heap@@113 T@U) (Mask@@55 T@U) (this@@103 T@U) ) (!  (=> (and (and (and (= (type Heap@@113) (MapType0Type RefType)) (= (type Mask@@55) (MapType1Type RefType realType))) (= (type this@@103) RefType)) (and (state Heap@@113 Mask@@55) (< AssumeFunctionsAbove 7))) (= (ie1 Heap@@113 this@@103) 0))
 :qid |stdinbpl.1189:15|
 :skolemid |81|
 :pattern ( (state Heap@@113 Mask@@55) (ie1 Heap@@113 this@@103))
)))
(assert (forall ((Heap@@114 T@U) (Mask@@56 T@U) (this@@104 T@U) ) (!  (=> (and (and (and (= (type Heap@@114) (MapType0Type RefType)) (= (type Mask@@56) (MapType1Type RefType realType))) (= (type this@@104) RefType)) (and (state Heap@@114 Mask@@56) (< AssumeFunctionsAbove 10))) (= (t5 Heap@@114 this@@104) 0))
 :qid |stdinbpl.1977:15|
 :skolemid |118|
 :pattern ( (state Heap@@114 Mask@@56) (t5 Heap@@114 this@@104))
)))
(assert (forall ((Heap@@115 T@U) (Mask@@57 T@U) (this@@105 T@U) ) (!  (=> (and (and (and (= (type Heap@@115) (MapType0Type RefType)) (= (type Mask@@57) (MapType1Type RefType realType))) (= (type this@@105) RefType)) (and (state Heap@@115 Mask@@57) (< AssumeFunctionsAbove 13))) (= (e1 Heap@@115 this@@105) 0))
 :qid |stdinbpl.916:15|
 :skolemid |67|
 :pattern ( (state Heap@@115 Mask@@57) (e1 Heap@@115 this@@105))
)))
(assert (forall ((Heap@@116 T@U) (Mask@@58 T@U) (this@@106 T@U) ) (!  (=> (and (and (and (= (type Heap@@116) (MapType0Type RefType)) (= (type Mask@@58) (MapType1Type RefType realType))) (= (type this@@106) RefType)) (and (state Heap@@116 Mask@@58) (< AssumeFunctionsAbove 15))) (= (i0 Heap@@116 this@@106) 0))
 :qid |stdinbpl.526:15|
 :skolemid |44|
 :pattern ( (state Heap@@116 Mask@@58) (i0 Heap@@116 this@@106))
)))
(assert (forall ((Heap@@117 T@U) (Mask@@59 T@U) (this@@107 T@U) ) (!  (=> (and (and (and (= (type Heap@@117) (MapType0Type RefType)) (= (type Mask@@59) (MapType1Type RefType realType))) (= (type this@@107) RefType)) (and (state Heap@@117 Mask@@59) (< AssumeFunctionsAbove 16))) (= (t6 Heap@@117 this@@107) 0))
 :qid |stdinbpl.2149:15|
 :skolemid |127|
 :pattern ( (state Heap@@117 Mask@@59) (t6 Heap@@117 this@@107))
)))
(assert (forall ((Heap@@118 T@U) (Mask@@60 T@U) (this@@108 T@U) ) (!  (=> (and (and (and (= (type Heap@@118) (MapType0Type RefType)) (= (type Mask@@60) (MapType1Type RefType realType))) (= (type this@@108) RefType)) (and (state Heap@@118 Mask@@60) (< AssumeFunctionsAbove 24))) (= (i1 Heap@@118 this@@108) 0))
 :qid |stdinbpl.651:15|
 :skolemid |51|
 :pattern ( (state Heap@@118 Mask@@60) (i1 Heap@@118 this@@108))
)))
(assert (forall ((Heap@@119 T@U) (Mask@@61 T@U) (this@@109 T@U) ) (!  (=> (and (and (and (= (type Heap@@119) (MapType0Type RefType)) (= (type Mask@@61) (MapType1Type RefType realType))) (= (type this@@109) RefType)) (and (state Heap@@119 Mask@@61) (< AssumeFunctionsAbove 26))) (= (s1 Heap@@119 this@@109) 0))
 :qid |stdinbpl.340:15|
 :skolemid |31|
 :pattern ( (state Heap@@119 Mask@@61) (s1 Heap@@119 this@@109))
)))
(assert (forall ((Heap@@120 T@U) (Mask@@62 T@U) (this@@110 T@U) ) (!  (=> (and (and (and (= (type Heap@@120) (MapType0Type RefType)) (= (type Mask@@62) (MapType1Type RefType realType))) (= (type this@@110) RefType)) (and (state Heap@@120 Mask@@62) (< AssumeFunctionsAbove 27))) (= (t2 Heap@@120 this@@110) 0))
 :qid |stdinbpl.1482:15|
 :skolemid |97|
 :pattern ( (state Heap@@120 Mask@@62) (t2 Heap@@120 this@@110))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
; Invalid

(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun Heap@@121 () T@U)
(declare-fun this@@111 () T@U)
(assert  (and (= (type Heap@@121) (MapType0Type RefType)) (= (type this@@111) RefType)))
(set-info :boogie-vc-id |t2Abstract#definedness|)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 5) (let ((anon3_Else_correct  (=> (state Heap@@121 ZeroMask) (=> (and (not (= this@@111 null)) (= (ControlFlow 0 3) (- 0 2))) (HasDirectPerm ZeroMask this@@111 x@@8)))))
(let ((anon3_Then_correct true))
(let ((anon0_correct  (=> (state Heap@@121 ZeroMask) (=> (and (U_2_bool (MapType0Select Heap@@121 this@@111 $allocated)) (= AssumeFunctionsAbove 17)) (and (=> (= (ControlFlow 0 4) 1) anon3_Then_correct) (=> (= (ControlFlow 0 4) 3) anon3_Else_correct))))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 5) 4) anon0_correct)))
PreconditionGeneratedEntry_correct)))))
))
(check-sat)
(get-info :reason-unknown)
(assert (not (= (ControlFlow 0 3) (- 2))))
(check-sat)
(pop 1)
; Invalid
(get-info :rlimit)
