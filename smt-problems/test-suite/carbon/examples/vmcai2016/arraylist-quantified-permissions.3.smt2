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
(declare-fun elems () T@U)
(declare-fun size () T@U)
(declare-fun FieldType (T@T T@T) T@T)
(declare-fun FieldTypeInv0 (T@T) T@T)
(declare-fun FieldTypeInv1 (T@T) T@T)
(declare-fun NormalFieldType () T@T)
(declare-fun ArrayDomainTypeType () T@T)
(declare-fun state (T@U T@U) Bool)
(declare-fun |length'| (T@U T@U) Int)
(declare-fun MapType0Type (T@T) T@T)
(declare-fun RefType () T@T)
(declare-fun MapType1Type (T@T T@T) T@T)
(declare-fun AssumeFunctionsAbove () Int)
(declare-fun |length#trigger| (T@U T@U) Bool)
(declare-fun MapType0Select (T@U T@U T@U) T@U)
(declare-fun null () T@U)
(declare-fun AList (T@U) T@U)
(declare-fun MapType0TypeInv0 (T@T) T@T)
(declare-fun MapType0Store (T@U T@U T@U T@U) T@U)
(declare-fun MapType1TypeInv0 (T@T) T@T)
(declare-fun MapType1TypeInv1 (T@T) T@T)
(declare-fun MapType1Select (T@U T@U T@U) T@U)
(declare-fun MapType1Store (T@U T@U T@U T@U) T@U)
(declare-fun PredicateType_AListType () T@T)
(declare-fun FrameTypeType () T@T)
(declare-fun succHeap (T@U T@U) Bool)
(declare-fun succHeapTrans (T@U T@U) Bool)
(declare-fun GoodMask (T@U) Bool)
(declare-fun |itemAt'| (T@U T@U Int) Int)
(declare-fun dummyFunction (T@U) Bool)
(declare-fun |itemAt#triggerStateless| (T@U Int) Int)
(declare-fun IdenticalOnKnownLocations (T@U T@U T@U) Bool)
(declare-fun IsPredicateField (T@U) Bool)
(declare-fun PredicateMaskField (T@U) T@U)
(declare-fun HasDirectPerm (T@U T@U T@U) Bool)
(declare-fun IsWandField (T@U) Bool)
(declare-fun WandMaskField (T@U) T@U)
(declare-fun |length#triggerStateless| (T@U) Int)
(declare-fun |AList#trigger| (T@U T@U) Bool)
(declare-fun |AList#everUsed| (T@U) Bool)
(declare-fun length (T@U T@U) Int)
(declare-fun itemAt (T@U T@U Int) Int)
(declare-fun loc (T@U Int) T@U)
(declare-fun len (T@U) Int)
(declare-fun |AList#sm| (T@U) T@U)
(declare-fun dummyHeap () T@U)
(declare-fun ZeroMask () T@U)
(declare-fun InsidePredicate (T@U T@U T@U T@U) Bool)
(declare-fun sumMask (T@U T@U T@U) Bool)
(declare-fun ConditionalFrame (Real T@U) T@U)
(declare-fun EmptyFrame () T@U)
(declare-fun NoPerm () Real)
(declare-fun first (T@U) T@U)
(declare-fun inv_loc (T@U) T@U)
(declare-fun second (T@U) T@U)
(declare-fun PairDomainTypeType (T@T T@T) T@T)
(declare-fun PairDomainTypeTypeInv0 (T@T) T@T)
(declare-fun PairDomainTypeTypeInv1 (T@T) T@T)
(declare-fun getPredWandId (T@U) Int)
(declare-fun FullPerm () Real)
(declare-fun |length#frame| (T@U T@U) Int)
(declare-fun |AList#condqp1| (T@U T@U) Int)
(declare-fun |sk_AList#condqp1| (Int Int) Int)
(declare-fun ZeroPMask () T@U)
(declare-fun |itemAt#frame| (T@U T@U Int) Int)
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
(assert  (and (and (and (and (and (and (and (and (forall ((arg0@@11 T@T) (arg1 T@T) ) (! (= (Ctor (FieldType arg0@@11 arg1)) 6)
 :qid |ctor:FieldType|
)) (forall ((arg0@@12 T@T) (arg1@@0 T@T) ) (! (= (FieldTypeInv0 (FieldType arg0@@12 arg1@@0)) arg0@@12)
 :qid |typeInv:FieldTypeInv0|
 :pattern ( (FieldType arg0@@12 arg1@@0))
))) (forall ((arg0@@13 T@T) (arg1@@1 T@T) ) (! (= (FieldTypeInv1 (FieldType arg0@@13 arg1@@1)) arg1@@1)
 :qid |typeInv:FieldTypeInv1|
 :pattern ( (FieldType arg0@@13 arg1@@1))
))) (= (Ctor NormalFieldType) 7)) (= (type $allocated) (FieldType NormalFieldType boolType))) (= (type val) (FieldType NormalFieldType intType))) (= (Ctor ArrayDomainTypeType) 8)) (= (type elems) (FieldType NormalFieldType ArrayDomainTypeType))) (= (type size) (FieldType NormalFieldType intType))))
(assert (distinct $allocated val elems size)
)
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (forall ((arg0@@14 T@T) ) (! (= (Ctor (MapType0Type arg0@@14)) 9)
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
)))) (= (Ctor RefType) 10)) (forall ((arg0@@18 T@T) (arg1@@4 T@T) ) (! (= (Ctor (MapType1Type arg0@@18 arg1@@4)) 11)
 :qid |ctor:MapType1Type|
))) (forall ((arg0@@19 T@T) (arg1@@5 T@T) ) (! (= (MapType1TypeInv0 (MapType1Type arg0@@19 arg1@@5)) arg0@@19)
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
)))) (= (type null) RefType)) (= (Ctor PredicateType_AListType) 12)) (= (Ctor FrameTypeType) 13)) (forall ((arg0@@23 T@U) ) (! (= (type (AList arg0@@23)) (FieldType PredicateType_AListType FrameTypeType))
 :qid |funType:AList|
 :pattern ( (AList arg0@@23))
))))
(assert (forall ((Heap T@U) (Mask T@U) (this T@U) ) (!  (=> (and (and (and (= (type Heap) (MapType0Type RefType)) (= (type Mask) (MapType1Type RefType realType))) (= (type this) RefType)) (and (state Heap Mask) (or (< AssumeFunctionsAbove 1) (|length#trigger| (MapType0Select Heap null (AList this)) this)))) (>= (|length'| Heap this) 0))
 :qid |stdinbpl.330:15|
 :skolemid |28|
 :pattern ( (state Heap Mask) (|length'| Heap this))
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
(assert (forall ((Heap@@1 T@U) (this@@0 T@U) (index Int) ) (!  (=> (and (= (type Heap@@1) (MapType0Type RefType)) (= (type this@@0) RefType)) (dummyFunction (int_2_U (|itemAt#triggerStateless| this@@0 index))))
 :qid |stdinbpl.466:15|
 :skolemid |38|
 :pattern ( (|itemAt'| Heap@@1 this@@0 index))
)))
(assert (forall ((arg0@@24 T@U) ) (! (let ((A (FieldTypeInv0 (type arg0@@24))))
(= (type (PredicateMaskField arg0@@24)) (FieldType A (MapType1Type RefType boolType))))
 :qid |funType:PredicateMaskField|
 :pattern ( (PredicateMaskField arg0@@24))
)))
(assert (forall ((Heap@@2 T@U) (ExhaleHeap T@U) (Mask@@1 T@U) (pm_f T@U) ) (! (let ((C (FieldTypeInv0 (type pm_f))))
 (=> (and (and (and (and (and (= (type Heap@@2) (MapType0Type RefType)) (= (type ExhaleHeap) (MapType0Type RefType))) (= (type Mask@@1) (MapType1Type RefType realType))) (= (type pm_f) (FieldType C FrameTypeType))) (IdenticalOnKnownLocations Heap@@2 ExhaleHeap Mask@@1)) (and (HasDirectPerm Mask@@1 null pm_f) (IsPredicateField pm_f))) (= (MapType0Select Heap@@2 null (PredicateMaskField pm_f)) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))))
 :qid |stdinbpl.47:19|
 :skolemid |2|
 :pattern ( (IdenticalOnKnownLocations Heap@@2 ExhaleHeap Mask@@1) (IsPredicateField pm_f) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))
)))
(assert (forall ((arg0@@25 T@U) ) (! (let ((A@@0 (FieldTypeInv0 (type arg0@@25))))
(= (type (WandMaskField arg0@@25)) (FieldType A@@0 (MapType1Type RefType boolType))))
 :qid |funType:WandMaskField|
 :pattern ( (WandMaskField arg0@@25))
)))
(assert (forall ((Heap@@3 T@U) (ExhaleHeap@@0 T@U) (Mask@@2 T@U) (pm_f@@0 T@U) ) (! (let ((C@@0 (FieldTypeInv0 (type pm_f@@0))))
 (=> (and (and (and (and (and (= (type Heap@@3) (MapType0Type RefType)) (= (type ExhaleHeap@@0) (MapType0Type RefType))) (= (type Mask@@2) (MapType1Type RefType realType))) (= (type pm_f@@0) (FieldType C@@0 FrameTypeType))) (IdenticalOnKnownLocations Heap@@3 ExhaleHeap@@0 Mask@@2)) (and (HasDirectPerm Mask@@2 null pm_f@@0) (IsWandField pm_f@@0))) (= (MapType0Select Heap@@3 null (WandMaskField pm_f@@0)) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))))
 :qid |stdinbpl.60:19|
 :skolemid |5|
 :pattern ( (IdenticalOnKnownLocations Heap@@3 ExhaleHeap@@0 Mask@@2) (IsWandField pm_f@@0) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))
)))
(assert (forall ((this@@1 T@U) ) (!  (=> (= (type this@@1) RefType) (IsPredicateField (AList this@@1)))
 :qid |stdinbpl.635:15|
 :skolemid |50|
 :pattern ( (AList this@@1))
)))
(assert (forall ((Heap@@4 T@U) (this@@2 T@U) ) (!  (=> (and (= (type Heap@@4) (MapType0Type RefType)) (= (type this@@2) RefType)) (dummyFunction (int_2_U (|length#triggerStateless| this@@2))))
 :qid |stdinbpl.311:15|
 :skolemid |25|
 :pattern ( (|length'| Heap@@4 this@@2))
)))
(assert (forall ((Heap@@5 T@U) (this@@3 T@U) ) (!  (=> (and (= (type Heap@@5) (MapType0Type RefType)) (= (type this@@3) RefType)) (|AList#everUsed| (AList this@@3)))
 :qid |stdinbpl.654:15|
 :skolemid |54|
 :pattern ( (|AList#trigger| Heap@@5 (AList this@@3)))
)))
(assert (forall ((Heap@@6 T@U) (ExhaleHeap@@1 T@U) (Mask@@3 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@6) (MapType0Type RefType)) (= (type ExhaleHeap@@1) (MapType0Type RefType))) (= (type Mask@@3) (MapType1Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@6 ExhaleHeap@@1 Mask@@3)) (U_2_bool (MapType0Select Heap@@6 o_1 $allocated))) (U_2_bool (MapType0Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.73:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@6 ExhaleHeap@@1 Mask@@3) (MapType0Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert (forall ((Heap@@7 T@U) (this@@4 T@U) ) (!  (=> (and (= (type Heap@@7) (MapType0Type RefType)) (= (type this@@4) RefType)) (and (= (length Heap@@7 this@@4) (|length'| Heap@@7 this@@4)) (dummyFunction (int_2_U (|length#triggerStateless| this@@4)))))
 :qid |stdinbpl.307:15|
 :skolemid |24|
 :pattern ( (length Heap@@7 this@@4))
)))
(assert (forall ((arg0@@26 T@U) (arg1@@9 Int) ) (! (= (type (loc arg0@@26 arg1@@9)) RefType)
 :qid |funType:loc|
 :pattern ( (loc arg0@@26 arg1@@9))
)))
(assert (forall ((Heap@@8 T@U) (Mask@@4 T@U) (this@@5 T@U) (index@@0 Int) ) (!  (=> (and (and (and (and (= (type Heap@@8) (MapType0Type RefType)) (= (type Mask@@4) (MapType1Type RefType realType))) (= (type this@@5) RefType)) (and (state Heap@@8 Mask@@4) (< AssumeFunctionsAbove 0))) (and (<= 0 index@@0) (< index@@0 (length Heap@@8 this@@5)))) (= (itemAt Heap@@8 this@@5 index@@0) (U_2_int (MapType0Select Heap@@8 (loc (MapType0Select Heap@@8 this@@5 elems) index@@0) val))))
 :qid |stdinbpl.472:15|
 :skolemid |39|
 :pattern ( (state Heap@@8 Mask@@4) (itemAt Heap@@8 this@@5 index@@0))
 :pattern ( (state Heap@@8 Mask@@4) (|itemAt#triggerStateless| this@@5 index@@0) (|AList#trigger| Heap@@8 (AList this@@5)))
)))
(assert (forall ((a_3 T@U) ) (!  (=> (= (type a_3) ArrayDomainTypeType) (>= (len a_3) 0))
 :qid |stdinbpl.281:15|
 :skolemid |23|
 :pattern ( (len a_3))
)))
(assert (forall ((this@@6 T@U) (this2 T@U) ) (!  (=> (and (and (= (type this@@6) RefType) (= (type this2) RefType)) (= (AList this@@6) (AList this2))) (= this@@6 this2))
 :qid |stdinbpl.645:15|
 :skolemid |52|
 :pattern ( (AList this@@6) (AList this2))
)))
(assert (forall ((arg0@@27 T@U) ) (! (= (type (|AList#sm| arg0@@27)) (FieldType PredicateType_AListType (MapType1Type RefType boolType)))
 :qid |funType:AList#sm|
 :pattern ( (|AList#sm| arg0@@27))
)))
(assert (forall ((this@@7 T@U) (this2@@0 T@U) ) (!  (=> (and (and (= (type this@@7) RefType) (= (type this2@@0) RefType)) (= (|AList#sm| this@@7) (|AList#sm| this2@@0))) (= this@@7 this2@@0))
 :qid |stdinbpl.649:15|
 :skolemid |53|
 :pattern ( (|AList#sm| this@@7) (|AList#sm| this2@@0))
)))
(assert (forall ((Heap@@9 T@U) (ExhaleHeap@@2 T@U) (Mask@@5 T@U) (o_1@@0 T@U) (f_2 T@U) ) (! (let ((B@@1 (FieldTypeInv1 (type f_2))))
(let ((A@@1 (FieldTypeInv0 (type f_2))))
 (=> (and (and (and (and (and (and (= (type Heap@@9) (MapType0Type RefType)) (= (type ExhaleHeap@@2) (MapType0Type RefType))) (= (type Mask@@5) (MapType1Type RefType realType))) (= (type o_1@@0) RefType)) (= (type f_2) (FieldType A@@1 B@@1))) (IdenticalOnKnownLocations Heap@@9 ExhaleHeap@@2 Mask@@5)) (HasDirectPerm Mask@@5 o_1@@0 f_2)) (= (MapType0Select Heap@@9 o_1@@0 f_2) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2)))))
 :qid |stdinbpl.42:22|
 :skolemid |1|
 :pattern ( (IdenticalOnKnownLocations Heap@@9 ExhaleHeap@@2 Mask@@5) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2))
)))
(assert  (and (= (type dummyHeap) (MapType0Type RefType)) (= (type ZeroMask) (MapType1Type RefType realType))))
(assert (state dummyHeap ZeroMask))
(assert (forall ((p T@U) (v_1 T@U) (w T@U) ) (! (let ((A@@2 (FieldTypeInv0 (type p))))
 (=> (and (and (= (type p) (FieldType A@@2 FrameTypeType)) (= (type v_1) FrameTypeType)) (= (type w) FrameTypeType)) (not (InsidePredicate p v_1 p w))))
 :qid |stdinbpl.240:19|
 :skolemid |21|
 :pattern ( (InsidePredicate p v_1 p w))
)))
(assert  (not (IsPredicateField val)))
(assert  (not (IsWandField val)))
(assert  (not (IsPredicateField elems)))
(assert  (not (IsWandField elems)))
(assert  (not (IsPredicateField size)))
(assert  (not (IsWandField size)))
(assert (forall ((Heap@@10 T@U) (ExhaleHeap@@3 T@U) (Mask@@6 T@U) ) (!  (=> (and (and (and (= (type Heap@@10) (MapType0Type RefType)) (= (type ExhaleHeap@@3) (MapType0Type RefType))) (= (type Mask@@6) (MapType1Type RefType realType))) (IdenticalOnKnownLocations Heap@@10 ExhaleHeap@@3 Mask@@6)) (succHeap Heap@@10 ExhaleHeap@@3))
 :qid |stdinbpl.83:15|
 :skolemid |10|
 :pattern ( (IdenticalOnKnownLocations Heap@@10 ExhaleHeap@@3 Mask@@6))
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
(assert  (and (forall ((arg0@@28 Real) (arg1@@10 T@U) ) (! (= (type (ConditionalFrame arg0@@28 arg1@@10)) FrameTypeType)
 :qid |funType:ConditionalFrame|
 :pattern ( (ConditionalFrame arg0@@28 arg1@@10))
)) (= (type EmptyFrame) FrameTypeType)))
(assert (forall ((p@@0 Real) (f_6 T@U) ) (!  (=> (= (type f_6) FrameTypeType) (= (ConditionalFrame p@@0 f_6) (ite (> p@@0 0.0) f_6 EmptyFrame)))
 :qid |stdinbpl.228:15|
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
(assert (forall ((Heap@@11 T@U) (this@@8 T@U) (index@@1 Int) ) (!  (=> (and (= (type Heap@@11) (MapType0Type RefType)) (= (type this@@8) RefType)) (and (= (itemAt Heap@@11 this@@8 index@@1) (|itemAt'| Heap@@11 this@@8 index@@1)) (dummyFunction (int_2_U (|itemAt#triggerStateless| this@@8 index@@1)))))
 :qid |stdinbpl.462:15|
 :skolemid |37|
 :pattern ( (itemAt Heap@@11 this@@8 index@@1))
)))
(assert (forall ((o_2@@1 T@U) (f_4@@1 T@U) ) (! (let ((B@@4 (FieldTypeInv1 (type f_4@@1))))
(let ((A@@5 (FieldTypeInv0 (type f_4@@1))))
 (=> (and (= (type o_2@@1) RefType) (= (type f_4@@1) (FieldType A@@5 B@@4))) (= (U_2_real (MapType1Select ZeroMask o_2@@1 f_4@@1)) NoPerm))))
 :qid |stdinbpl.106:22|
 :skolemid |13|
 :pattern ( (MapType1Select ZeroMask o_2@@1 f_4@@1))
)))
(assert  (and (and (and (and (and (forall ((arg0@@29 T@T) (arg1@@11 T@T) ) (! (= (Ctor (PairDomainTypeType arg0@@29 arg1@@11)) 14)
 :qid |ctor:PairDomainTypeType|
)) (forall ((arg0@@30 T@T) (arg1@@12 T@T) ) (! (= (PairDomainTypeTypeInv0 (PairDomainTypeType arg0@@30 arg1@@12)) arg0@@30)
 :qid |typeInv:PairDomainTypeTypeInv0|
 :pattern ( (PairDomainTypeType arg0@@30 arg1@@12))
))) (forall ((arg0@@31 T@T) (arg1@@13 T@T) ) (! (= (PairDomainTypeTypeInv1 (PairDomainTypeType arg0@@31 arg1@@13)) arg1@@13)
 :qid |typeInv:PairDomainTypeTypeInv1|
 :pattern ( (PairDomainTypeType arg0@@31 arg1@@13))
))) (forall ((arg0@@32 T@U) ) (! (let ((T1 (PairDomainTypeTypeInv0 (type arg0@@32))))
(= (type (first arg0@@32)) T1))
 :qid |funType:first|
 :pattern ( (first arg0@@32))
))) (forall ((arg0@@33 T@U) ) (! (= (type (inv_loc arg0@@33)) (PairDomainTypeType ArrayDomainTypeType intType))
 :qid |funType:inv_loc|
 :pattern ( (inv_loc arg0@@33))
))) (forall ((arg0@@34 T@U) ) (! (let ((T2 (PairDomainTypeTypeInv1 (type arg0@@34))))
(= (type (second arg0@@34)) T2))
 :qid |funType:second|
 :pattern ( (second arg0@@34))
))))
(assert (forall ((a_3@@0 T@U) (i Int) ) (!  (=> (= (type a_3@@0) ArrayDomainTypeType) (=> (and (<= 0 i) (< i (len a_3@@0))) (and (= (first (inv_loc (loc a_3@@0 i))) a_3@@0) (= (U_2_int (second (inv_loc (loc a_3@@0 i)))) i))))
 :qid |stdinbpl.275:15|
 :skolemid |22|
 :pattern ( (loc a_3@@0 i))
)))
(assert (forall ((Heap@@12 T@U) (ExhaleHeap@@4 T@U) (Mask@@8 T@U) (pm_f@@1 T@U) ) (! (let ((C@@1 (FieldTypeInv0 (type pm_f@@1))))
 (=> (and (and (and (and (and (= (type Heap@@12) (MapType0Type RefType)) (= (type ExhaleHeap@@4) (MapType0Type RefType))) (= (type Mask@@8) (MapType1Type RefType realType))) (= (type pm_f@@1) (FieldType C@@1 FrameTypeType))) (IdenticalOnKnownLocations Heap@@12 ExhaleHeap@@4 Mask@@8)) (and (HasDirectPerm Mask@@8 null pm_f@@1) (IsPredicateField pm_f@@1))) (forall ((o2 T@U) (f_2@@0 T@U) ) (! (let ((B@@5 (FieldTypeInv1 (type f_2@@0))))
(let ((A@@6 (FieldTypeInv0 (type f_2@@0))))
 (=> (and (and (= (type o2) RefType) (= (type f_2@@0) (FieldType A@@6 B@@5))) (U_2_bool (MapType1Select (MapType0Select Heap@@12 null (PredicateMaskField pm_f@@1)) o2 f_2@@0))) (= (MapType0Select Heap@@12 o2 f_2@@0) (MapType0Select ExhaleHeap@@4 o2 f_2@@0)))))
 :qid |stdinbpl.54:134|
 :skolemid |3|
 :pattern ( (MapType0Select ExhaleHeap@@4 o2 f_2@@0))
))))
 :qid |stdinbpl.52:19|
 :skolemid |4|
 :pattern ( (IdenticalOnKnownLocations Heap@@12 ExhaleHeap@@4 Mask@@8) (IsPredicateField pm_f@@1))
)))
(assert (forall ((Heap@@13 T@U) (ExhaleHeap@@5 T@U) (Mask@@9 T@U) (pm_f@@2 T@U) ) (! (let ((C@@2 (FieldTypeInv0 (type pm_f@@2))))
 (=> (and (and (and (and (and (= (type Heap@@13) (MapType0Type RefType)) (= (type ExhaleHeap@@5) (MapType0Type RefType))) (= (type Mask@@9) (MapType1Type RefType realType))) (= (type pm_f@@2) (FieldType C@@2 FrameTypeType))) (IdenticalOnKnownLocations Heap@@13 ExhaleHeap@@5 Mask@@9)) (and (HasDirectPerm Mask@@9 null pm_f@@2) (IsWandField pm_f@@2))) (forall ((o2@@0 T@U) (f_2@@1 T@U) ) (! (let ((B@@6 (FieldTypeInv1 (type f_2@@1))))
(let ((A@@7 (FieldTypeInv0 (type f_2@@1))))
 (=> (and (and (= (type o2@@0) RefType) (= (type f_2@@1) (FieldType A@@7 B@@6))) (U_2_bool (MapType1Select (MapType0Select Heap@@13 null (WandMaskField pm_f@@2)) o2@@0 f_2@@1))) (= (MapType0Select Heap@@13 o2@@0 f_2@@1) (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1)))))
 :qid |stdinbpl.67:129|
 :skolemid |6|
 :pattern ( (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1))
))))
 :qid |stdinbpl.65:19|
 :skolemid |7|
 :pattern ( (IdenticalOnKnownLocations Heap@@13 ExhaleHeap@@5 Mask@@9) (IsWandField pm_f@@2))
)))
(assert (forall ((this@@9 T@U) ) (!  (=> (= (type this@@9) RefType) (= (getPredWandId (AList this@@9)) 0))
 :qid |stdinbpl.639:15|
 :skolemid |51|
 :pattern ( (AList this@@9))
)))
(assert (forall ((Mask@@10 T@U) (o_2@@2 T@U) (f_4@@2 T@U) ) (! (let ((B@@7 (FieldTypeInv1 (type f_4@@2))))
(let ((A@@8 (FieldTypeInv0 (type f_4@@2))))
 (=> (and (and (and (= (type Mask@@10) (MapType1Type RefType realType)) (= (type o_2@@2) RefType)) (= (type f_4@@2) (FieldType A@@8 B@@7))) (GoodMask Mask@@10)) (and (>= (U_2_real (MapType1Select Mask@@10 o_2@@2 f_4@@2)) NoPerm) (=> (and (and (GoodMask Mask@@10) (not (IsPredicateField f_4@@2))) (not (IsWandField f_4@@2))) (<= (U_2_real (MapType1Select Mask@@10 o_2@@2 f_4@@2)) FullPerm))))))
 :qid |stdinbpl.128:22|
 :skolemid |16|
 :pattern ( (GoodMask Mask@@10) (MapType1Select Mask@@10 o_2@@2 f_4@@2))
)))
(assert (forall ((Heap@@14 T@U) (Mask@@11 T@U) (this@@10 T@U) ) (!  (=> (and (and (and (= (type Heap@@14) (MapType0Type RefType)) (= (type Mask@@11) (MapType1Type RefType realType))) (= (type this@@10) RefType)) (state Heap@@14 Mask@@11)) (= (|length'| Heap@@14 this@@10) (|length#frame| (MapType0Select Heap@@14 null (AList this@@10)) this@@10)))
 :qid |stdinbpl.324:15|
 :skolemid |27|
 :pattern ( (state Heap@@14 Mask@@11) (|length'| Heap@@14 this@@10))
)))
(assert (forall ((o T@U) (f T@U) (Heap@@15 T@U) ) (!  (=> (and (and (and (= (type o) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap@@15) (MapType0Type RefType))) (U_2_bool (MapType0Select Heap@@15 o $allocated))) (U_2_bool (MapType0Select Heap@@15 (MapType0Select Heap@@15 o f) $allocated)))
 :qid |stdinbpl.31:15|
 :skolemid |0|
 :pattern ( (MapType0Select Heap@@15 o f))
)))
(assert (forall ((Heap2Heap T@U) (Heap1Heap T@U) (this@@11 T@U) ) (!  (=> (and (and (and (= (type Heap2Heap) (MapType0Type RefType)) (= (type Heap1Heap) (MapType0Type RefType))) (= (type this@@11) RefType)) (and (=  (and (and (<= 0 (|sk_AList#condqp1| (|AList#condqp1| Heap2Heap this@@11) (|AList#condqp1| Heap1Heap this@@11))) (< (|sk_AList#condqp1| (|AList#condqp1| Heap2Heap this@@11) (|AList#condqp1| Heap1Heap this@@11)) (len (MapType0Select Heap2Heap this@@11 elems)))) (< NoPerm FullPerm))  (and (and (<= 0 (|sk_AList#condqp1| (|AList#condqp1| Heap2Heap this@@11) (|AList#condqp1| Heap1Heap this@@11))) (< (|sk_AList#condqp1| (|AList#condqp1| Heap2Heap this@@11) (|AList#condqp1| Heap1Heap this@@11)) (len (MapType0Select Heap1Heap this@@11 elems)))) (< NoPerm FullPerm))) (=> (and (and (<= 0 (|sk_AList#condqp1| (|AList#condqp1| Heap2Heap this@@11) (|AList#condqp1| Heap1Heap this@@11))) (< (|sk_AList#condqp1| (|AList#condqp1| Heap2Heap this@@11) (|AList#condqp1| Heap1Heap this@@11)) (len (MapType0Select Heap2Heap this@@11 elems)))) (< NoPerm FullPerm)) (= (U_2_int (MapType0Select Heap2Heap (loc (MapType0Select Heap2Heap this@@11 elems) (|sk_AList#condqp1| (|AList#condqp1| Heap2Heap this@@11) (|AList#condqp1| Heap1Heap this@@11))) val)) (U_2_int (MapType0Select Heap1Heap (loc (MapType0Select Heap1Heap this@@11 elems) (|sk_AList#condqp1| (|AList#condqp1| Heap2Heap this@@11) (|AList#condqp1| Heap1Heap this@@11))) val)))))) (= (|AList#condqp1| Heap2Heap this@@11) (|AList#condqp1| Heap1Heap this@@11)))
 :qid |stdinbpl.665:15|
 :skolemid |55|
 :pattern ( (|AList#condqp1| Heap2Heap this@@11) (|AList#condqp1| Heap1Heap this@@11) (succHeapTrans Heap2Heap Heap1Heap))
)))
(assert (forall ((this@@12 T@U) ) (!  (=> (= (type this@@12) RefType) (= (PredicateMaskField (AList this@@12)) (|AList#sm| this@@12)))
 :qid |stdinbpl.631:15|
 :skolemid |49|
 :pattern ( (PredicateMaskField (AList this@@12)))
)))
(assert (forall ((Heap@@16 T@U) (o@@0 T@U) (f_3 T@U) (v T@U) ) (! (let ((B@@8 (type v)))
(let ((A@@9 (FieldTypeInv0 (type f_3))))
 (=> (and (and (= (type Heap@@16) (MapType0Type RefType)) (= (type o@@0) RefType)) (= (type f_3) (FieldType A@@9 B@@8))) (succHeap Heap@@16 (MapType0Store Heap@@16 o@@0 f_3 v)))))
 :qid |stdinbpl.78:22|
 :skolemid |9|
 :pattern ( (MapType0Store Heap@@16 o@@0 f_3 v))
)))
(assert (forall ((Heap@@17 T@U) (Mask@@12 T@U) (this@@13 T@U) ) (!  (=> (and (and (and (= (type Heap@@17) (MapType0Type RefType)) (= (type Mask@@12) (MapType1Type RefType realType))) (= (type this@@13) RefType)) (and (state Heap@@17 Mask@@12) (< AssumeFunctionsAbove 1))) (= (length Heap@@17 this@@13) (U_2_int (MapType0Select Heap@@17 this@@13 size))))
 :qid |stdinbpl.317:15|
 :skolemid |26|
 :pattern ( (state Heap@@17 Mask@@12) (length Heap@@17 this@@13))
 :pattern ( (state Heap@@17 Mask@@12) (|length#triggerStateless| this@@13) (|AList#trigger| Heap@@17 (AList this@@13)))
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
 :qid |stdinbpl.235:25|
 :skolemid |20|
 :pattern ( (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))
)))
(assert (forall ((Heap@@18 T@U) (Mask@@13 T@U) (this@@14 T@U) (index@@2 Int) ) (!  (=> (and (and (and (= (type Heap@@18) (MapType0Type RefType)) (= (type Mask@@13) (MapType1Type RefType realType))) (= (type this@@14) RefType)) (state Heap@@18 Mask@@13)) (= (|itemAt'| Heap@@18 this@@14 index@@2) (|itemAt#frame| (MapType0Select Heap@@18 null (AList this@@14)) this@@14 index@@2)))
 :qid |stdinbpl.479:15|
 :skolemid |40|
 :pattern ( (state Heap@@18 Mask@@13) (|itemAt'| Heap@@18 this@@14 index@@2))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun PostMask@0 () T@U)
(declare-fun this@@15 () T@U)
(declare-fun k_2 () Int)
(declare-fun Heap@@19 () T@U)
(declare-fun Mask@0 () T@U)
(declare-fun PostMask@1 () T@U)
(declare-fun PostHeap@0 () T@U)
(declare-fun j () Int)
(declare-fun elem () Int)
(declare-fun PostMask@3 () T@U)
(declare-fun k () Int)
(declare-fun PostMask@4 () T@U)
(declare-fun Mask@40 () T@U)
(declare-fun Mask@2 () T@U)
(declare-fun j@0 () Int)
(declare-fun ExhaleHeap@0 () T@U)
(declare-fun k_4 () Int)
(declare-fun Mask@37 () T@U)
(declare-fun Mask@1 () T@U)
(declare-fun Mask@35 () T@U)
(declare-fun Mask@3 () T@U)
(declare-fun k_13 () Int)
(declare-fun Heap@20 () T@U)
(declare-fun j@1 () Int)
(declare-fun Mask@34 () T@U)
(declare-fun Mask@33 () T@U)
(declare-fun Heap@18 () T@U)
(declare-fun Heap@17 () T@U)
(declare-fun Heap@19 () T@U)
(declare-fun newPMask@1 () T@U)
(declare-fun Heap@14 () T@U)
(declare-fun Heap@15 () T@U)
(declare-fun Heap@16 () T@U)
(declare-fun freshVersion@1 () T@U)
(declare-fun Mask@32 () T@U)
(declare-fun Mask@31 () T@U)
(declare-fun neverTriggered10 (Int) Bool)
(declare-fun qpRange10 (T@U) Bool)
(declare-fun invRecv10 (T@U) Int)
(declare-fun QPMask@9 () T@U)
(declare-fun CombineFrames (T@U T@U) T@U)
(declare-fun FrameFragment (T@U) T@U)
(declare-fun QPMask@8 () T@U)
(declare-fun Mask@29 () T@U)
(declare-fun Mask@28 () T@U)
(declare-fun Mask@30 () T@U)
(declare-fun qpRange9 (T@U) Bool)
(declare-fun invRecv9 (T@U) Int)
(declare-fun Heap@13 () T@U)
(declare-fun newVersion@1 () T@U)
(declare-fun i_15 () Int)
(declare-fun Heap@1 () T@U)
(declare-fun QPMask@1 () T@U)
(declare-fun a_3@@1 () T@U)
(declare-fun i_18 () Int)
(declare-fun t_1@1 () Int)
(declare-fun QPMask@7 () T@U)
(declare-fun ExhaleHeap@1 () T@U)
(declare-fun i_17 () Int)
(declare-fun qpRange14 (T@U) Bool)
(declare-fun invRecv14 (T@U) Int)
(declare-fun Mask@14 () T@U)
(declare-fun i_16 () Int)
(declare-fun perm@3 () Real)
(declare-fun Mask@12 () T@U)
(declare-fun QPMask@2 () T@U)
(declare-fun perm@4 () Real)
(declare-fun Mask@13 () T@U)
(declare-fun perm@5 () Real)
(declare-fun t_1@2 () Int)
(declare-fun i_25 () Int)
(declare-fun Heap@4 () T@U)
(declare-fun i_23 () Int)
(declare-fun Mask@27 () T@U)
(declare-fun Mask@26 () T@U)
(declare-fun perm@14 () Real)
(declare-fun neverTriggered16 (Int) Bool)
(declare-fun qpRange16 (T@U) Bool)
(declare-fun invRecv16 (T@U) Int)
(declare-fun QPMask@6 () T@U)
(declare-fun Mask@25 () T@U)
(declare-fun perm@13 () Real)
(declare-fun QPMask@3 () T@U)
(declare-fun perm@9 () Real)
(declare-fun perm@6 () Real)
(declare-fun Mask@15 () T@U)
(declare-fun perm@7 () Real)
(declare-fun Mask@16 () T@U)
(declare-fun perm@8 () Real)
(declare-fun Mask@17 () T@U)
(declare-fun qpRange15 (T@U) Bool)
(declare-fun invRecv15 (T@U) Int)
(declare-fun k_6 () Int)
(declare-fun Heap@12 () T@U)
(declare-fun k_4_1 () Int)
(declare-fun Mask@24 () T@U)
(declare-fun Mask@23 () T@U)
(declare-fun Heap@10 () T@U)
(declare-fun Heap@9 () T@U)
(declare-fun Heap@11 () T@U)
(declare-fun newPMask@0 () T@U)
(declare-fun Heap@6 () T@U)
(declare-fun Heap@7 () T@U)
(declare-fun Heap@8 () T@U)
(declare-fun freshVersion@0 () T@U)
(declare-fun Mask@22 () T@U)
(declare-fun Mask@21 () T@U)
(declare-fun neverTriggered18 (Int) Bool)
(declare-fun qpRange18 (T@U) Bool)
(declare-fun invRecv18 (T@U) Int)
(declare-fun QPMask@5 () T@U)
(declare-fun QPMask@4 () T@U)
(declare-fun perm@10 () Real)
(declare-fun Mask@18 () T@U)
(declare-fun perm@11 () Real)
(declare-fun Mask@19 () T@U)
(declare-fun perm@12 () Real)
(declare-fun Mask@20 () T@U)
(declare-fun qpRange17 (T@U) Bool)
(declare-fun invRecv17 (T@U) Int)
(declare-fun Heap@5 () T@U)
(declare-fun Heap@3 () T@U)
(declare-fun t_1@0 () Int)
(declare-fun i_11_1 () Int)
(declare-fun i_9 () Int)
(declare-fun Mask@11 () T@U)
(declare-fun Mask@10 () T@U)
(declare-fun perm@2 () Real)
(declare-fun neverTriggered13 (Int) Bool)
(declare-fun qpRange13 (T@U) Bool)
(declare-fun invRecv13 (T@U) Int)
(declare-fun Mask@9 () T@U)
(declare-fun perm@1 () Real)
(declare-fun Mask@8 () T@U)
(declare-fun perm@0 () Real)
(declare-fun Heap@2 () T@U)
(declare-fun qpRange12 (T@U) Bool)
(declare-fun invRecv12 (T@U) Int)
(declare-fun QPMask@0 () T@U)
(declare-fun Mask@6 () T@U)
(declare-fun Mask@5 () T@U)
(declare-fun Mask@7 () T@U)
(declare-fun qpRange11 (T@U) Bool)
(declare-fun invRecv11 (T@U) Int)
(declare-fun Heap@0 () T@U)
(declare-fun newVersion@0 () T@U)
(declare-fun Mask@4 () T@U)
(declare-fun k_8 () Int)
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (= (type Heap@@19) (MapType0Type RefType)) (= (type this@@15) RefType)) (= (type Heap@3) (MapType0Type RefType))) (= (type Heap@12) (MapType0Type RefType))) (= (type Mask@24) (MapType1Type RefType realType))) (= (type Mask@23) (MapType1Type RefType realType))) (= (type Heap@10) (MapType0Type RefType))) (= (type Heap@9) (MapType0Type RefType))) (= (type Heap@11) (MapType0Type RefType))) (= (type newPMask@0) (MapType1Type RefType boolType))) (= (type Heap@7) (MapType0Type RefType))) (= (type Heap@6) (MapType0Type RefType))) (= (type Heap@8) (MapType0Type RefType))) (= (type freshVersion@0) FrameTypeType)) (= (type Mask@22) (MapType1Type RefType realType))) (= (type Mask@21) (MapType1Type RefType realType))) (= (type QPMask@5) (MapType1Type RefType realType))) (forall ((arg0@@35 T@U) (arg1@@14 T@U) ) (! (= (type (CombineFrames arg0@@35 arg1@@14)) FrameTypeType)
 :qid |funType:CombineFrames|
 :pattern ( (CombineFrames arg0@@35 arg1@@14))
))) (forall ((arg0@@36 T@U) ) (! (= (type (FrameFragment arg0@@36)) FrameTypeType)
 :qid |funType:FrameFragment|
 :pattern ( (FrameFragment arg0@@36))
))) (= (type QPMask@4) (MapType1Type RefType realType))) (= (type ExhaleHeap@1) (MapType0Type RefType))) (= (type QPMask@2) (MapType1Type RefType realType))) (= (type Mask@18) (MapType1Type RefType realType))) (= (type Mask@19) (MapType1Type RefType realType))) (= (type Mask@20) (MapType1Type RefType realType))) (= (type Heap@5) (MapType0Type RefType))) (= (type Heap@4) (MapType0Type RefType))) (= (type Mask@27) (MapType1Type RefType realType))) (= (type Mask@26) (MapType1Type RefType realType))) (= (type QPMask@6) (MapType1Type RefType realType))) (= (type Mask@25) (MapType1Type RefType realType))) (= (type QPMask@3) (MapType1Type RefType realType))) (= (type Mask@15) (MapType1Type RefType realType))) (= (type Mask@16) (MapType1Type RefType realType))) (= (type Mask@17) (MapType1Type RefType realType))) (= (type Mask@0) (MapType1Type RefType realType))) (= (type Mask@14) (MapType1Type RefType realType))) (= (type QPMask@7) (MapType1Type RefType realType))) (= (type Mask@12) (MapType1Type RefType realType))) (= (type Mask@13) (MapType1Type RefType realType))) (= (type Mask@11) (MapType1Type RefType realType))) (= (type Mask@10) (MapType1Type RefType realType))) (= (type Mask@9) (MapType1Type RefType realType))) (= (type Mask@8) (MapType1Type RefType realType))) (= (type Heap@1) (MapType0Type RefType))) (= (type QPMask@0) (MapType1Type RefType realType))) (= (type a_3@@1) ArrayDomainTypeType)) (= (type QPMask@1) (MapType1Type RefType realType))) (= (type Heap@2) (MapType0Type RefType))) (= (type Mask@6) (MapType1Type RefType realType))) (= (type Mask@5) (MapType1Type RefType realType))) (= (type Mask@7) (MapType1Type RefType realType))) (= (type Heap@0) (MapType0Type RefType))) (= (type ExhaleHeap@0) (MapType0Type RefType))) (= (type newVersion@0) FrameTypeType)) (= (type Mask@4) (MapType1Type RefType realType))) (= (type Mask@1) (MapType1Type RefType realType))) (= (type Mask@3) (MapType1Type RefType realType))) (= (type Heap@20) (MapType0Type RefType))) (= (type Mask@34) (MapType1Type RefType realType))) (= (type Mask@33) (MapType1Type RefType realType))) (= (type Heap@18) (MapType0Type RefType))) (= (type Heap@17) (MapType0Type RefType))) (= (type Heap@19) (MapType0Type RefType))) (= (type newPMask@1) (MapType1Type RefType boolType))) (= (type Heap@15) (MapType0Type RefType))) (= (type Heap@14) (MapType0Type RefType))) (= (type Heap@16) (MapType0Type RefType))) (= (type freshVersion@1) FrameTypeType)) (= (type Mask@32) (MapType1Type RefType realType))) (= (type Mask@31) (MapType1Type RefType realType))) (= (type QPMask@9) (MapType1Type RefType realType))) (= (type QPMask@8) (MapType1Type RefType realType))) (= (type Mask@29) (MapType1Type RefType realType))) (= (type Mask@28) (MapType1Type RefType realType))) (= (type Mask@30) (MapType1Type RefType realType))) (= (type Heap@13) (MapType0Type RefType))) (= (type newVersion@1) FrameTypeType)) (= (type Mask@35) (MapType1Type RefType realType))) (= (type Mask@2) (MapType1Type RefType realType))) (= (type Mask@37) (MapType1Type RefType realType))) (= (type Mask@40) (MapType1Type RefType realType))) (= (type PostMask@0) (MapType1Type RefType realType))) (= (type PostMask@4) (MapType1Type RefType realType))) (= (type PostHeap@0) (MapType0Type RefType))) (= (type PostMask@3) (MapType1Type RefType realType))) (= (type PostMask@1) (MapType1Type RefType realType))))
(set-info :boogie-vc-id insert)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 397) (let ((anon33_correct true))
(let ((anon237_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 389) 386)) anon33_correct)))
(let ((anon237_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 387) (- 0 388)) (<= FullPerm (U_2_real (MapType1Select PostMask@0 null (AList this@@15))))) (=> (<= FullPerm (U_2_real (MapType1Select PostMask@0 null (AList this@@15)))) (=> (= (ControlFlow 0 387) 386) anon33_correct))))))
(let ((anon42_correct  (and (=> (= (ControlFlow 0 379) (- 0 380)) (<= 0 (- k_2 1))) (=> (<= 0 (- k_2 1)) (=> (= (ControlFlow 0 379) (- 0 378)) (< (- k_2 1) (length Heap@@19 this@@15)))))))
(let ((anon242_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 383) 379)) anon42_correct)))
(let ((anon242_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 381) (- 0 382)) (<= FullPerm (U_2_real (MapType1Select Mask@0 null (AList this@@15))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@0 null (AList this@@15)))) (=> (= (ControlFlow 0 381) 379) anon42_correct))))))
(let ((anon38_correct  (=> (= PostMask@1 (MapType1Store PostMask@0 null (AList this@@15) (real_2_U (- (U_2_real (MapType1Select PostMask@0 null (AList this@@15))) FullPerm)))) (and (=> (= (ControlFlow 0 373) (- 0 374)) (<= 0 k_2)) (=> (<= 0 k_2) (=> (= (ControlFlow 0 373) (- 0 372)) (< k_2 (length PostHeap@0 this@@15))))))))
(let ((anon240_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 377) 373)) anon38_correct)))
(let ((anon240_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 375) (- 0 376)) (<= FullPerm (U_2_real (MapType1Select PostMask@0 null (AList this@@15))))) (=> (<= FullPerm (U_2_real (MapType1Select PostMask@0 null (AList this@@15)))) (=> (= (ControlFlow 0 375) 373) anon38_correct))))))
(let ((anon43_correct true))
(let ((anon238_Then_correct  (=> (and (< j k_2) (< k_2 (length PostHeap@0 this@@15))) (and (and (and (and (=> (= (ControlFlow 0 384) 370) anon43_correct) (=> (= (ControlFlow 0 384) 381) anon242_Then_correct)) (=> (= (ControlFlow 0 384) 383) anon242_Else_correct)) (=> (= (ControlFlow 0 384) 375) anon240_Then_correct)) (=> (= (ControlFlow 0 384) 377) anon240_Else_correct)))))
(let ((anon238_Else_correct  (=> (and (not (and (< j k_2) (< k_2 (length PostHeap@0 this@@15)))) (= (ControlFlow 0 371) 370)) anon43_correct)))
(let ((anon235_Then_correct  (=> (< j k_2) (and (and (and (=> (= (ControlFlow 0 390) 384) anon238_Then_correct) (=> (= (ControlFlow 0 390) 371) anon238_Else_correct)) (=> (= (ControlFlow 0 390) 387) anon237_Then_correct)) (=> (= (ControlFlow 0 390) 389) anon237_Else_correct)))))
(let ((anon235_Else_correct  (=> (<= k_2 j) (and (=> (= (ControlFlow 0 385) 384) anon238_Then_correct) (=> (= (ControlFlow 0 385) 371) anon238_Else_correct)))))
(let ((anon234_Else_correct true))
(let ((anon232_Else_correct  (=> (= (itemAt PostHeap@0 this@@15 j) elem) (=> (and (state PostHeap@0 PostMask@0) (state PostHeap@0 PostMask@0)) (and (and (=> (= (ControlFlow 0 391) 369) anon234_Else_correct) (=> (= (ControlFlow 0 391) 390) anon235_Then_correct)) (=> (= (ControlFlow 0 391) 385) anon235_Else_correct))))))
(let ((anon27_correct  (=> (= PostMask@3 (MapType1Store PostMask@0 null (AList this@@15) (real_2_U (- (U_2_real (MapType1Select PostMask@0 null (AList this@@15))) FullPerm)))) (and (=> (= (ControlFlow 0 364) (- 0 365)) (<= 0 j)) (=> (<= 0 j) (=> (= (ControlFlow 0 364) (- 0 363)) (< j (length PostHeap@0 this@@15))))))))
(let ((anon233_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 368) 364)) anon27_correct)))
(let ((anon233_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 366) (- 0 367)) (<= FullPerm (U_2_real (MapType1Select PostMask@0 null (AList this@@15))))) (=> (<= FullPerm (U_2_real (MapType1Select PostMask@0 null (AList this@@15)))) (=> (= (ControlFlow 0 366) 364) anon27_correct))))))
(let ((anon226_Else_correct  (=> (forall ((k_1 Int) ) (!  (=> (and (<= 0 k_1) (< k_1 j)) (= (itemAt PostHeap@0 this@@15 k_1) (itemAt Heap@@19 this@@15 k_1)))
 :qid |stdinbpl.1781:20|
 :skolemid |99|
 :pattern ( (|itemAt#frame| (MapType0Select Heap@@19 null (AList this@@15)) this@@15 k_1))
)) (=> (and (state PostHeap@0 PostMask@0) (state PostHeap@0 PostMask@0)) (and (and (=> (= (ControlFlow 0 392) 391) anon232_Else_correct) (=> (= (ControlFlow 0 392) 366) anon233_Then_correct)) (=> (= (ControlFlow 0 392) 368) anon233_Else_correct))))))
(let ((anon22_correct  (and (=> (= (ControlFlow 0 357) (- 0 358)) (<= 0 k)) (=> (<= 0 k) (=> (= (ControlFlow 0 357) (- 0 356)) (< k (length Heap@@19 this@@15)))))))
(let ((anon231_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 361) 357)) anon22_correct)))
(let ((anon231_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 359) (- 0 360)) (<= FullPerm (U_2_real (MapType1Select Mask@0 null (AList this@@15))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@0 null (AList this@@15)))) (=> (= (ControlFlow 0 359) 357) anon22_correct))))))
(let ((anon18_correct  (=> (= PostMask@4 (MapType1Store PostMask@0 null (AList this@@15) (real_2_U (- (U_2_real (MapType1Select PostMask@0 null (AList this@@15))) FullPerm)))) (and (=> (= (ControlFlow 0 351) (- 0 352)) (<= 0 k)) (=> (<= 0 k) (=> (= (ControlFlow 0 351) (- 0 350)) (< k (length PostHeap@0 this@@15))))))))
(let ((anon229_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 355) 351)) anon18_correct)))
(let ((anon229_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 353) (- 0 354)) (<= FullPerm (U_2_real (MapType1Select PostMask@0 null (AList this@@15))))) (=> (<= FullPerm (U_2_real (MapType1Select PostMask@0 null (AList this@@15)))) (=> (= (ControlFlow 0 353) 351) anon18_correct))))))
(let ((anon23_correct true))
(let ((anon227_Then_correct  (=> (and (<= 0 k) (< k j)) (and (and (and (and (=> (= (ControlFlow 0 362) 348) anon23_correct) (=> (= (ControlFlow 0 362) 359) anon231_Then_correct)) (=> (= (ControlFlow 0 362) 361) anon231_Else_correct)) (=> (= (ControlFlow 0 362) 353) anon229_Then_correct)) (=> (= (ControlFlow 0 362) 355) anon229_Else_correct)))))
(let ((anon227_Else_correct  (=> (and (not (and (<= 0 k) (< k j))) (= (ControlFlow 0 349) 348)) anon23_correct)))
(let ((anon224_Else_correct  (=> (= (length PostHeap@0 this@@15) (+ (length Heap@@19 this@@15) 1)) (=> (and (state PostHeap@0 PostMask@0) (state PostHeap@0 PostMask@0)) (and (and (=> (= (ControlFlow 0 393) 392) anon226_Else_correct) (=> (= (ControlFlow 0 393) 362) anon227_Then_correct)) (=> (= (ControlFlow 0 393) 349) anon227_Else_correct))))))
(let ((anon12_correct true))
(let ((anon225_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 347) 344)) anon12_correct)))
(let ((anon225_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 345) (- 0 346)) (<= FullPerm (U_2_real (MapType1Select Mask@0 null (AList this@@15))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@0 null (AList this@@15)))) (=> (= (ControlFlow 0 345) 344) anon12_correct))))))
(let ((anon8_correct true))
(let ((anon223_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 343) 340)) anon8_correct)))
(let ((anon223_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 341) (- 0 342)) (<= FullPerm (U_2_real (MapType1Select PostMask@0 null (AList this@@15))))) (=> (<= FullPerm (U_2_real (MapType1Select PostMask@0 null (AList this@@15)))) (=> (= (ControlFlow 0 341) 340) anon8_correct))))))
(let ((anon220_Else_correct  (=> (< j (length PostHeap@0 this@@15)) (=> (and (state PostHeap@0 PostMask@0) (state PostHeap@0 PostMask@0)) (and (and (and (and (=> (= (ControlFlow 0 394) 393) anon224_Else_correct) (=> (= (ControlFlow 0 394) 345) anon225_Then_correct)) (=> (= (ControlFlow 0 394) 347) anon225_Else_correct)) (=> (= (ControlFlow 0 394) 341) anon223_Then_correct)) (=> (= (ControlFlow 0 394) 343) anon223_Else_correct))))))
(let ((anon4_correct true))
(let ((anon221_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 339) 336)) anon4_correct)))
(let ((anon221_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 337) (- 0 338)) (<= FullPerm (U_2_real (MapType1Select PostMask@0 null (AList this@@15))))) (=> (<= FullPerm (U_2_real (MapType1Select PostMask@0 null (AList this@@15)))) (=> (= (ControlFlow 0 337) 336) anon4_correct))))))
(let ((anon219_Then_correct  (=> (and (state PostHeap@0 ZeroMask) (= PostMask@0 (MapType1Store ZeroMask null (AList this@@15) (real_2_U (+ (U_2_real (MapType1Select ZeroMask null (AList this@@15))) FullPerm))))) (=> (and (and (state PostHeap@0 PostMask@0) (state PostHeap@0 PostMask@0)) (and (<= 0 j) (state PostHeap@0 PostMask@0))) (and (and (=> (= (ControlFlow 0 395) 394) anon220_Else_correct) (=> (= (ControlFlow 0 395) 337) anon221_Then_correct)) (=> (= (ControlFlow 0 395) 339) anon221_Else_correct))))))
(let ((anon62_correct  (=> (= Mask@40 (MapType1Store Mask@2 null (AList this@@15) (real_2_U (- (U_2_real (MapType1Select Mask@2 null (AList this@@15))) FullPerm)))) (and (=> (= (ControlFlow 0 315) (- 0 316)) (<= 0 (- j@0 1))) (=> (<= 0 (- j@0 1)) (=> (= (ControlFlow 0 315) (- 0 314)) (< (- j@0 1) (length ExhaleHeap@0 this@@15))))))))
(let ((anon252_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 319) 315)) anon62_correct)))
(let ((anon252_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 317) (- 0 318)) (<= FullPerm (U_2_real (MapType1Select Mask@2 null (AList this@@15))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@2 null (AList this@@15)))) (=> (= (ControlFlow 0 317) 315) anon62_correct))))))
(let ((anon77_correct true))
(let ((anon260_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 308) 305)) anon77_correct)))
(let ((anon260_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 306) (- 0 307)) (<= FullPerm (U_2_real (MapType1Select Mask@2 null (AList this@@15))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@2 null (AList this@@15)))) (=> (= (ControlFlow 0 306) 305) anon77_correct))))))
(let ((anon86_correct  (and (=> (= (ControlFlow 0 298) (- 0 299)) (<= 0 k_4)) (=> (<= 0 k_4) (=> (= (ControlFlow 0 298) (- 0 297)) (< k_4 (length Heap@@19 this@@15)))))))
(let ((anon265_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 302) 298)) anon86_correct)))
(let ((anon265_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 300) (- 0 301)) (<= FullPerm (U_2_real (MapType1Select Mask@0 null (AList this@@15))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@0 null (AList this@@15)))) (=> (= (ControlFlow 0 300) 298) anon86_correct))))))
(let ((anon82_correct  (=> (= Mask@37 (MapType1Store Mask@2 null (AList this@@15) (real_2_U (- (U_2_real (MapType1Select Mask@2 null (AList this@@15))) FullPerm)))) (and (=> (= (ControlFlow 0 292) (- 0 293)) (<= 0 k_4)) (=> (<= 0 k_4) (=> (= (ControlFlow 0 292) (- 0 291)) (< k_4 (length ExhaleHeap@0 this@@15))))))))
(let ((anon263_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 296) 292)) anon82_correct)))
(let ((anon263_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 294) (- 0 295)) (<= FullPerm (U_2_real (MapType1Select Mask@2 null (AList this@@15))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@2 null (AList this@@15)))) (=> (= (ControlFlow 0 294) 292) anon82_correct))))))
(let ((anon87_correct true))
(let ((anon261_Then_correct  (=> (and (<= 0 k_4) (< k_4 (length ExhaleHeap@0 this@@15))) (and (and (and (and (=> (= (ControlFlow 0 303) 289) anon87_correct) (=> (= (ControlFlow 0 303) 300) anon265_Then_correct)) (=> (= (ControlFlow 0 303) 302) anon265_Else_correct)) (=> (= (ControlFlow 0 303) 294) anon263_Then_correct)) (=> (= (ControlFlow 0 303) 296) anon263_Else_correct)))))
(let ((anon261_Else_correct  (=> (and (not (and (<= 0 k_4) (< k_4 (length ExhaleHeap@0 this@@15)))) (= (ControlFlow 0 290) 289)) anon87_correct)))
(let ((anon258_Then_correct  (=> (<= 0 k_4) (and (and (and (=> (= (ControlFlow 0 309) 303) anon261_Then_correct) (=> (= (ControlFlow 0 309) 290) anon261_Else_correct)) (=> (= (ControlFlow 0 309) 306) anon260_Then_correct)) (=> (= (ControlFlow 0 309) 308) anon260_Else_correct)))))
(let ((anon258_Else_correct  (=> (< k_4 0) (and (=> (= (ControlFlow 0 304) 303) anon261_Then_correct) (=> (= (ControlFlow 0 304) 290) anon261_Else_correct)))))
(let ((anon257_Else_correct true))
(let ((anon255_Else_correct  (=> (= (length ExhaleHeap@0 this@@15) (length Heap@@19 this@@15)) (=> (and (state ExhaleHeap@0 Mask@2) (state ExhaleHeap@0 Mask@2)) (and (and (=> (= (ControlFlow 0 310) 288) anon257_Else_correct) (=> (= (ControlFlow 0 310) 309) anon258_Then_correct)) (=> (= (ControlFlow 0 310) 304) anon258_Else_correct))))))
(let ((anon71_correct true))
(let ((anon256_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 287) 284)) anon71_correct)))
(let ((anon256_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 285) (- 0 286)) (<= FullPerm (U_2_real (MapType1Select Mask@0 null (AList this@@15))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@0 null (AList this@@15)))) (=> (= (ControlFlow 0 285) 284) anon71_correct))))))
(let ((anon67_correct true))
(let ((anon254_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 283) 280)) anon67_correct)))
(let ((anon254_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 281) (- 0 282)) (<= FullPerm (U_2_real (MapType1Select Mask@2 null (AList this@@15))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@2 null (AList this@@15)))) (=> (= (ControlFlow 0 281) 280) anon67_correct))))))
(let ((anon64_correct  (=> (and (state ExhaleHeap@0 Mask@2) (state ExhaleHeap@0 Mask@2)) (and (and (and (and (=> (= (ControlFlow 0 311) 310) anon255_Else_correct) (=> (= (ControlFlow 0 311) 285) anon256_Then_correct)) (=> (= (ControlFlow 0 311) 287) anon256_Else_correct)) (=> (= (ControlFlow 0 311) 281) anon254_Then_correct)) (=> (= (ControlFlow 0 311) 283) anon254_Else_correct)))))
(let ((anon251_Else_correct  (=> (and (<= (itemAt ExhaleHeap@0 this@@15 (- j@0 1)) elem) (= (ControlFlow 0 313) 311)) anon64_correct)))
(let ((anon250_Then_correct  (=> (and (> j@0 0) (state ExhaleHeap@0 Mask@2)) (and (and (=> (= (ControlFlow 0 320) 313) anon251_Else_correct) (=> (= (ControlFlow 0 320) 317) anon252_Then_correct)) (=> (= (ControlFlow 0 320) 319) anon252_Else_correct)))))
(let ((anon250_Else_correct  (=> (and (>= 0 j@0) (= (ControlFlow 0 312) 311)) anon64_correct)))
(let ((anon248_Else_correct  (=> (and (<= j@0 (length ExhaleHeap@0 this@@15)) (state ExhaleHeap@0 Mask@2)) (and (=> (= (ControlFlow 0 321) 320) anon250_Then_correct) (=> (= (ControlFlow 0 321) 312) anon250_Else_correct)))))
(let ((anon57_correct true))
(let ((anon249_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 279) 276)) anon57_correct)))
(let ((anon249_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 277) (- 0 278)) (<= FullPerm (U_2_real (MapType1Select Mask@2 null (AList this@@15))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@2 null (AList this@@15)))) (=> (= (ControlFlow 0 277) 276) anon57_correct))))))
(let ((anon247_Then_correct  (=> (= Mask@2 (MapType1Store Mask@1 null (AList this@@15) (real_2_U (+ (U_2_real (MapType1Select Mask@1 null (AList this@@15))) FullPerm)))) (=> (and (and (state ExhaleHeap@0 Mask@2) (state ExhaleHeap@0 Mask@2)) (and (<= 0 j@0) (state ExhaleHeap@0 Mask@2))) (and (and (=> (= (ControlFlow 0 322) 321) anon248_Else_correct) (=> (= (ControlFlow 0 322) 277) anon249_Then_correct)) (=> (= (ControlFlow 0 322) 279) anon249_Else_correct))))))
(let ((anon100_correct  (=> (= Mask@35 (MapType1Store Mask@3 null (AList this@@15) (real_2_U (- (U_2_real (MapType1Select Mask@3 null (AList this@@15))) FullPerm)))) (and (=> (= (ControlFlow 0 266) (- 0 267)) (<= 0 j@0)) (=> (<= 0 j@0) (=> (= (ControlFlow 0 266) (- 0 265)) (< j@0 (length ExhaleHeap@0 this@@15))))))))
(let ((anon272_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 270) 266)) anon100_correct)))
(let ((anon272_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 268) (- 0 269)) (<= FullPerm (U_2_real (MapType1Select Mask@3 null (AList this@@15))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@3 null (AList this@@15)))) (=> (= (ControlFlow 0 268) 266) anon100_correct))))))
(let ((anon118_correct true))
(let ((anon281_Else_correct  (=> (and (not (and (<= 0 k_13) (< k_13 (length Heap@20 this@@15)))) (= (ControlFlow 0 227) 224)) anon118_correct)))
(let ((anon281_Then_correct  (=> (and (<= 0 k_13) (< k_13 (length Heap@20 this@@15))) (and (=> (= (ControlFlow 0 225) (- 0 226)) (= (itemAt Heap@20 this@@15 k_13) (itemAt Heap@@19 this@@15 k_13))) (=> (= (itemAt Heap@20 this@@15 k_13) (itemAt Heap@@19 this@@15 k_13)) (=> (= (ControlFlow 0 225) 224) anon118_correct))))))
(let ((anon280_Else_correct true))
(let ((anon115_correct  (and (=> (= (ControlFlow 0 228) (- 0 229)) (= (length Heap@20 this@@15) (length Heap@@19 this@@15))) (=> (= (length Heap@20 this@@15) (length Heap@@19 this@@15)) (and (and (=> (= (ControlFlow 0 228) 223) anon280_Else_correct) (=> (= (ControlFlow 0 228) 225) anon281_Then_correct)) (=> (= (ControlFlow 0 228) 227) anon281_Else_correct))))))
(let ((anon279_Else_correct  (=> (and (>= 0 j@1) (= (ControlFlow 0 232) 228)) anon115_correct)))
(let ((anon279_Then_correct  (=> (> j@1 0) (and (=> (= (ControlFlow 0 230) (- 0 231)) (<= (itemAt Heap@20 this@@15 (- j@1 1)) elem)) (=> (<= (itemAt Heap@20 this@@15 (- j@1 1)) elem) (=> (= (ControlFlow 0 230) 228) anon115_correct))))))
(let ((anon113_correct  (=> (= Mask@34 (MapType1Store Mask@33 null (AList this@@15) (real_2_U (- (U_2_real (MapType1Select Mask@33 null (AList this@@15))) FullPerm)))) (and (=> (= (ControlFlow 0 233) (- 0 235)) (<= 0 j@1)) (=> (<= 0 j@1) (and (=> (= (ControlFlow 0 233) (- 0 234)) (<= j@1 (length Heap@20 this@@15))) (=> (<= j@1 (length Heap@20 this@@15)) (and (=> (= (ControlFlow 0 233) 230) anon279_Then_correct) (=> (= (ControlFlow 0 233) 232) anon279_Else_correct)))))))))
(let ((anon278_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 238) 233)) anon113_correct)))
(let ((anon278_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 236) (- 0 237)) (<= FullPerm (U_2_real (MapType1Select Mask@33 null (AList this@@15))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@33 null (AList this@@15)))) (=> (= (ControlFlow 0 236) 233) anon113_correct))))))
(let ((anon111_correct  (=> (= Heap@18 (MapType0Store Heap@17 null (|AList#sm| this@@15) (MapType1Store (MapType0Select Heap@17 null (|AList#sm| this@@15)) this@@15 elems (bool_2_U true)))) (=> (and (= Heap@19 (MapType0Store Heap@18 null (|AList#sm| this@@15) (MapType1Store (MapType0Select Heap@18 null (|AList#sm| this@@15)) this@@15 size (bool_2_U true)))) (forall ((o_8 T@U) (f_11 T@U) ) (! (let ((B@@11 (FieldTypeInv1 (type f_11))))
(let ((A@@12 (FieldTypeInv0 (type f_11))))
 (=> (and (and (= (type o_8) RefType) (= (type f_11) (FieldType A@@12 B@@11))) (U_2_bool (MapType1Select (MapType0Select Heap@19 null (|AList#sm| this@@15)) o_8 f_11))) (U_2_bool (MapType1Select newPMask@1 o_8 f_11)))))
 :qid |stdinbpl.2317:35|
 :skolemid |116|
 :pattern ( (MapType1Select newPMask@1 o_8 f_11))
))) (=> (and (and (forall ((i_2 Int) ) (!  (=> (and (<= 0 i_2) (< i_2 (len (MapType0Select Heap@19 this@@15 elems)))) (U_2_bool (MapType1Select newPMask@1 (loc (MapType0Select Heap@19 this@@15 elems) i_2) val)))
 :qid |stdinbpl.2321:28|
 :skolemid |117|
)) (= Heap@20 (MapType0Store Heap@19 null (|AList#sm| this@@15) newPMask@1))) (and (state Heap@20 Mask@33) (state Heap@20 Mask@33))) (and (=> (= (ControlFlow 0 239) 236) anon278_Then_correct) (=> (= (ControlFlow 0 239) 238) anon278_Else_correct)))))))
(let ((anon277_Else_correct  (=> (HasDirectPerm Mask@33 null (AList this@@15)) (=> (and (= Heap@17 Heap@14) (= (ControlFlow 0 241) 239)) anon111_correct))))
(let ((anon277_Then_correct  (=> (not (HasDirectPerm Mask@33 null (AList this@@15))) (=> (and (and (= Heap@15 (MapType0Store Heap@14 null (|AList#sm| this@@15) ZeroPMask)) (= Heap@16 (MapType0Store Heap@15 null (AList this@@15) freshVersion@1))) (and (= Heap@17 Heap@16) (= (ControlFlow 0 240) 239))) anon111_correct))))
(let ((anon109_correct  (=> (= Mask@32 (MapType1Store Mask@31 this@@15 size (real_2_U (- (U_2_real (MapType1Select Mask@31 this@@15 size)) FullPerm)))) (and (=> (= (ControlFlow 0 242) (- 0 247)) (<= 0 (U_2_int (MapType0Select Heap@14 this@@15 size)))) (=> (<= 0 (U_2_int (MapType0Select Heap@14 this@@15 size))) (and (=> (= (ControlFlow 0 242) (- 0 246)) (<= (U_2_int (MapType0Select Heap@14 this@@15 size)) (len (MapType0Select Heap@14 this@@15 elems)))) (=> (<= (U_2_int (MapType0Select Heap@14 this@@15 size)) (len (MapType0Select Heap@14 this@@15 elems))) (and (=> (= (ControlFlow 0 242) (- 0 245)) (< 0 (len (MapType0Select Heap@14 this@@15 elems)))) (=> (< 0 (len (MapType0Select Heap@14 this@@15 elems))) (and (=> (= (ControlFlow 0 242) (- 0 244)) (forall ((i_1 Int) (i_1_1 Int) ) (!  (=> (and (and (and (and (not (= i_1 i_1_1)) (and (<= 0 i_1) (< i_1 (len (MapType0Select Heap@14 this@@15 elems))))) (and (<= 0 i_1_1) (< i_1_1 (len (MapType0Select Heap@14 this@@15 elems))))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (loc (MapType0Select Heap@14 this@@15 elems) i_1) (loc (MapType0Select Heap@14 this@@15 elems) i_1_1))))
 :qid |stdinbpl.2268:25|
 :skolemid |110|
 :pattern ( (neverTriggered10 i_1) (neverTriggered10 i_1_1))
))) (=> (forall ((i_1@@0 Int) (i_1_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_1@@0 i_1_1@@0)) (and (<= 0 i_1@@0) (< i_1@@0 (len (MapType0Select Heap@14 this@@15 elems))))) (and (<= 0 i_1_1@@0) (< i_1_1@@0 (len (MapType0Select Heap@14 this@@15 elems))))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (loc (MapType0Select Heap@14 this@@15 elems) i_1@@0) (loc (MapType0Select Heap@14 this@@15 elems) i_1_1@@0))))
 :qid |stdinbpl.2268:25|
 :skolemid |110|
 :pattern ( (neverTriggered10 i_1@@0) (neverTriggered10 i_1_1@@0))
)) (and (=> (= (ControlFlow 0 242) (- 0 243)) (forall ((i_1@@1 Int) ) (!  (=> (and (<= 0 i_1@@1) (< i_1@@1 (len (MapType0Select Heap@14 this@@15 elems)))) (>= (U_2_real (MapType1Select Mask@32 (loc (MapType0Select Heap@14 this@@15 elems) i_1@@1) val)) FullPerm))
 :qid |stdinbpl.2275:25|
 :skolemid |111|
 :pattern ( (loc (MapType0Select Heap@14 this@@15 elems) i_1@@1))
 :pattern ( (loc (MapType0Select Heap@14 this@@15 elems) i_1@@1))
))) (=> (forall ((i_1@@2 Int) ) (!  (=> (and (<= 0 i_1@@2) (< i_1@@2 (len (MapType0Select Heap@14 this@@15 elems)))) (>= (U_2_real (MapType1Select Mask@32 (loc (MapType0Select Heap@14 this@@15 elems) i_1@@2) val)) FullPerm))
 :qid |stdinbpl.2275:25|
 :skolemid |111|
 :pattern ( (loc (MapType0Select Heap@14 this@@15 elems) i_1@@2))
 :pattern ( (loc (MapType0Select Heap@14 this@@15 elems) i_1@@2))
)) (=> (forall ((i_1@@3 Int) ) (!  (=> (and (and (<= 0 i_1@@3) (< i_1@@3 (len (MapType0Select Heap@14 this@@15 elems)))) (< NoPerm FullPerm)) (and (qpRange10 (loc (MapType0Select Heap@14 this@@15 elems) i_1@@3)) (= (invRecv10 (loc (MapType0Select Heap@14 this@@15 elems) i_1@@3)) i_1@@3)))
 :qid |stdinbpl.2281:30|
 :skolemid |112|
 :pattern ( (loc (MapType0Select Heap@14 this@@15 elems) i_1@@3))
 :pattern ( (loc (MapType0Select Heap@14 this@@15 elems) i_1@@3))
)) (=> (and (and (and (forall ((o_3 T@U) ) (!  (=> (= (type o_3) RefType) (=> (and (and (<= 0 (invRecv10 o_3)) (< (invRecv10 o_3) (len (MapType0Select Heap@14 this@@15 elems)))) (and (< NoPerm FullPerm) (qpRange10 o_3))) (= (loc (MapType0Select Heap@14 this@@15 elems) (invRecv10 o_3)) o_3)))
 :qid |stdinbpl.2285:30|
 :skolemid |113|
 :pattern ( (invRecv10 o_3))
)) (forall ((o_3@@0 T@U) ) (!  (=> (= (type o_3@@0) RefType) (and (=> (and (and (<= 0 (invRecv10 o_3@@0)) (< (invRecv10 o_3@@0) (len (MapType0Select Heap@14 this@@15 elems)))) (and (< NoPerm FullPerm) (qpRange10 o_3@@0))) (and (= (loc (MapType0Select Heap@14 this@@15 elems) (invRecv10 o_3@@0)) o_3@@0) (= (U_2_real (MapType1Select QPMask@9 o_3@@0 val)) (- (U_2_real (MapType1Select Mask@32 o_3@@0 val)) FullPerm)))) (=> (not (and (and (<= 0 (invRecv10 o_3@@0)) (< (invRecv10 o_3@@0) (len (MapType0Select Heap@14 this@@15 elems)))) (and (< NoPerm FullPerm) (qpRange10 o_3@@0)))) (= (U_2_real (MapType1Select QPMask@9 o_3@@0 val)) (U_2_real (MapType1Select Mask@32 o_3@@0 val))))))
 :qid |stdinbpl.2291:30|
 :skolemid |114|
 :pattern ( (MapType1Select QPMask@9 o_3@@0 val))
))) (and (forall ((o_3@@1 T@U) (f_5 T@U) ) (! (let ((B@@12 (FieldTypeInv1 (type f_5))))
(let ((A@@13 (FieldTypeInv0 (type f_5))))
 (=> (and (and (= (type o_3@@1) RefType) (= (type f_5) (FieldType A@@13 B@@12))) (not (= f_5 val))) (= (U_2_real (MapType1Select Mask@32 o_3@@1 f_5)) (U_2_real (MapType1Select QPMask@9 o_3@@1 f_5))))))
 :qid |stdinbpl.2297:37|
 :skolemid |115|
 :pattern ( (MapType1Select QPMask@9 o_3@@1 f_5))
)) (= Mask@33 (MapType1Store QPMask@9 null (AList this@@15) (real_2_U (+ (U_2_real (MapType1Select QPMask@9 null (AList this@@15))) FullPerm)))))) (and (and (state Heap@14 Mask@33) (state Heap@14 Mask@33)) (and (|AList#trigger| Heap@14 (AList this@@15)) (= (MapType0Select Heap@14 null (AList this@@15)) (CombineFrames (FrameFragment (MapType0Select Heap@14 this@@15 elems)) (CombineFrames (FrameFragment (MapType0Select Heap@14 this@@15 size)) (FrameFragment (int_2_U (|AList#condqp1| Heap@14 this@@15))))))))) (and (=> (= (ControlFlow 0 242) 240) anon277_Then_correct) (=> (= (ControlFlow 0 242) 241) anon277_Else_correct)))))))))))))))))
(let ((anon276_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 250) 242)) anon109_correct)))
(let ((anon276_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 248) (- 0 249)) (<= FullPerm (U_2_real (MapType1Select Mask@31 this@@15 size)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@31 this@@15 size))) (=> (= (ControlFlow 0 248) 242) anon109_correct))))))
(let ((anon107_correct  (=> (= Mask@31 (MapType1Store QPMask@8 this@@15 elems (real_2_U (- (U_2_real (MapType1Select QPMask@8 this@@15 elems)) FullPerm)))) (and (=> (= (ControlFlow 0 251) 248) anon276_Then_correct) (=> (= (ControlFlow 0 251) 250) anon276_Else_correct)))))
(let ((anon275_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 254) 251)) anon107_correct)))
(let ((anon275_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 252) (- 0 253)) (<= FullPerm (U_2_real (MapType1Select QPMask@8 this@@15 elems)))) (=> (<= FullPerm (U_2_real (MapType1Select QPMask@8 this@@15 elems))) (=> (= (ControlFlow 0 252) 251) anon107_correct))))))
(let ((anon105_correct  (=> (not (= this@@15 null)) (=> (and (and (and (= Mask@29 (MapType1Store Mask@28 this@@15 elems (real_2_U (+ (U_2_real (MapType1Select Mask@28 this@@15 elems)) FullPerm)))) (state Heap@14 Mask@29)) (and (not (= this@@15 null)) (= Mask@30 (MapType1Store Mask@29 this@@15 size (real_2_U (+ (U_2_real (MapType1Select Mask@29 this@@15 size)) FullPerm)))))) (and (and (state Heap@14 Mask@30) (<= 0 (U_2_int (MapType0Select Heap@14 this@@15 size)))) (and (<= (U_2_int (MapType0Select Heap@14 this@@15 size)) (len (MapType0Select Heap@14 this@@15 elems))) (< 0 (len (MapType0Select Heap@14 this@@15 elems)))))) (and (=> (= (ControlFlow 0 255) (- 0 256)) (forall ((i@@0 Int) (i_10 Int) ) (!  (=> (and (and (and (and (not (= i@@0 i_10)) (and (<= 0 i@@0) (< i@@0 (len (MapType0Select Heap@14 this@@15 elems))))) (and (<= 0 i_10) (< i_10 (len (MapType0Select Heap@14 this@@15 elems))))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (loc (MapType0Select Heap@14 this@@15 elems) i@@0) (loc (MapType0Select Heap@14 this@@15 elems) i_10))))
 :qid |stdinbpl.2201:23|
 :skolemid |104|
))) (=> (forall ((i@@1 Int) (i_10@@0 Int) ) (!  (=> (and (and (and (and (not (= i@@1 i_10@@0)) (and (<= 0 i@@1) (< i@@1 (len (MapType0Select Heap@14 this@@15 elems))))) (and (<= 0 i_10@@0) (< i_10@@0 (len (MapType0Select Heap@14 this@@15 elems))))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (loc (MapType0Select Heap@14 this@@15 elems) i@@1) (loc (MapType0Select Heap@14 this@@15 elems) i_10@@0))))
 :qid |stdinbpl.2201:23|
 :skolemid |104|
)) (=> (and (forall ((i@@2 Int) ) (!  (=> (and (and (<= 0 i@@2) (< i@@2 (len (MapType0Select Heap@14 this@@15 elems)))) (< NoPerm FullPerm)) (and (qpRange9 (loc (MapType0Select Heap@14 this@@15 elems) i@@2)) (= (invRecv9 (loc (MapType0Select Heap@14 this@@15 elems) i@@2)) i@@2)))
 :qid |stdinbpl.2207:30|
 :skolemid |105|
 :pattern ( (loc (MapType0Select Heap@14 this@@15 elems) i@@2))
 :pattern ( (loc (MapType0Select Heap@14 this@@15 elems) i@@2))
)) (forall ((o_3@@2 T@U) ) (!  (=> (= (type o_3@@2) RefType) (=> (and (and (and (<= 0 (invRecv9 o_3@@2)) (< (invRecv9 o_3@@2) (len (MapType0Select Heap@14 this@@15 elems)))) (< NoPerm FullPerm)) (qpRange9 o_3@@2)) (= (loc (MapType0Select Heap@14 this@@15 elems) (invRecv9 o_3@@2)) o_3@@2)))
 :qid |stdinbpl.2211:30|
 :skolemid |106|
 :pattern ( (invRecv9 o_3@@2))
))) (=> (and (and (and (forall ((i@@3 Int) ) (!  (=> (and (<= 0 i@@3) (< i@@3 (len (MapType0Select Heap@14 this@@15 elems)))) (not (= (loc (MapType0Select Heap@14 this@@15 elems) i@@3) null)))
 :qid |stdinbpl.2217:30|
 :skolemid |107|
 :pattern ( (loc (MapType0Select Heap@14 this@@15 elems) i@@3))
 :pattern ( (loc (MapType0Select Heap@14 this@@15 elems) i@@3))
)) (forall ((o_3@@3 T@U) ) (!  (=> (= (type o_3@@3) RefType) (and (=> (and (and (and (<= 0 (invRecv9 o_3@@3)) (< (invRecv9 o_3@@3) (len (MapType0Select Heap@14 this@@15 elems)))) (< NoPerm FullPerm)) (qpRange9 o_3@@3)) (and (=> (< NoPerm FullPerm) (= (loc (MapType0Select Heap@14 this@@15 elems) (invRecv9 o_3@@3)) o_3@@3)) (= (U_2_real (MapType1Select QPMask@8 o_3@@3 val)) (+ (U_2_real (MapType1Select Mask@30 o_3@@3 val)) FullPerm)))) (=> (not (and (and (and (<= 0 (invRecv9 o_3@@3)) (< (invRecv9 o_3@@3) (len (MapType0Select Heap@14 this@@15 elems)))) (< NoPerm FullPerm)) (qpRange9 o_3@@3))) (= (U_2_real (MapType1Select QPMask@8 o_3@@3 val)) (U_2_real (MapType1Select Mask@30 o_3@@3 val))))))
 :qid |stdinbpl.2223:30|
 :skolemid |108|
 :pattern ( (MapType1Select QPMask@8 o_3@@3 val))
))) (and (forall ((o_3@@4 T@U) (f_5@@0 T@U) ) (! (let ((B@@13 (FieldTypeInv1 (type f_5@@0))))
(let ((A@@14 (FieldTypeInv0 (type f_5@@0))))
 (=> (and (and (= (type o_3@@4) RefType) (= (type f_5@@0) (FieldType A@@14 B@@13))) (not (= f_5@@0 val))) (= (U_2_real (MapType1Select Mask@30 o_3@@4 f_5@@0)) (U_2_real (MapType1Select QPMask@8 o_3@@4 f_5@@0))))))
 :qid |stdinbpl.2227:37|
 :skolemid |109|
 :pattern ( (MapType1Select Mask@30 o_3@@4 f_5@@0))
 :pattern ( (MapType1Select QPMask@8 o_3@@4 f_5@@0))
)) (state Heap@14 QPMask@8))) (and (and (state Heap@14 QPMask@8) (state Heap@14 QPMask@8)) (and (= j@1 (+ j@0 1)) (state Heap@14 QPMask@8)))) (and (=> (= (ControlFlow 0 255) 252) anon275_Then_correct) (=> (= (ControlFlow 0 255) 254) anon275_Else_correct))))))))))
(let ((anon274_Else_correct  (=> (HasDirectPerm Mask@28 null (AList this@@15)) (=> (and (= Heap@14 ExhaleHeap@0) (= (ControlFlow 0 258) 255)) anon105_correct))))
(let ((anon274_Then_correct  (=> (and (and (not (HasDirectPerm Mask@28 null (AList this@@15))) (= Heap@13 (MapType0Store ExhaleHeap@0 null (AList this@@15) newVersion@1))) (and (= Heap@14 Heap@13) (= (ControlFlow 0 257) 255))) anon105_correct)))
(let ((anon103_correct  (=> (= Mask@28 (MapType1Store Mask@3 null (AList this@@15) (real_2_U (- (U_2_real (MapType1Select Mask@3 null (AList this@@15))) FullPerm)))) (and (=> (= (ControlFlow 0 259) 257) anon274_Then_correct) (=> (= (ControlFlow 0 259) 258) anon274_Else_correct)))))
(let ((anon273_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 262) 259)) anon103_correct)))
(let ((anon273_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 260) (- 0 261)) (<= FullPerm (U_2_real (MapType1Select Mask@3 null (AList this@@15))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@3 null (AList this@@15)))) (=> (= (ControlFlow 0 260) 259) anon103_correct))))))
(let ((anon101_correct  (=> (and (and (and (< j@0 (length ExhaleHeap@0 this@@15)) (< (itemAt ExhaleHeap@0 this@@15 j@0) elem)) (state ExhaleHeap@0 Mask@3)) (and (|AList#trigger| ExhaleHeap@0 (AList this@@15)) (= (MapType0Select ExhaleHeap@0 null (AList this@@15)) (CombineFrames (FrameFragment (MapType0Select ExhaleHeap@0 this@@15 elems)) (CombineFrames (FrameFragment (MapType0Select ExhaleHeap@0 this@@15 size)) (FrameFragment (int_2_U (|AList#condqp1| ExhaleHeap@0 this@@15)))))))) (and (=> (= (ControlFlow 0 263) 260) anon273_Then_correct) (=> (= (ControlFlow 0 263) 262) anon273_Else_correct)))))
(let ((anon270_Then_correct  (=> (< j@0 (length ExhaleHeap@0 this@@15)) (and (and (=> (= (ControlFlow 0 271) 263) anon101_correct) (=> (= (ControlFlow 0 271) 268) anon272_Then_correct)) (=> (= (ControlFlow 0 271) 270) anon272_Else_correct)))))
(let ((anon270_Else_correct  (=> (and (<= (length ExhaleHeap@0 this@@15) j@0) (= (ControlFlow 0 264) 263)) anon101_correct)))
(let ((anon95_correct true))
(let ((anon269_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 222) 219)) anon95_correct)))
(let ((anon269_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 220) (- 0 221)) (<= FullPerm (U_2_real (MapType1Select Mask@3 null (AList this@@15))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@3 null (AList this@@15)))) (=> (= (ControlFlow 0 220) 219) anon95_correct))))))
(let ((anon92_correct  (=> (state ExhaleHeap@0 Mask@3) (=> (and (and (= (length ExhaleHeap@0 this@@15) (length Heap@@19 this@@15)) (state ExhaleHeap@0 Mask@3)) (and (forall ((k_12 Int) ) (!  (=> (and (<= 0 k_12) (< k_12 (length ExhaleHeap@0 this@@15))) (= (itemAt ExhaleHeap@0 this@@15 k_12) (itemAt Heap@@19 this@@15 k_12)))
 :qid |stdinbpl.2118:24|
 :skolemid |103|
 :pattern ( (|itemAt#frame| (MapType0Select Heap@@19 null (AList this@@15)) this@@15 k_12))
)) (state ExhaleHeap@0 Mask@3))) (and (and (and (=> (= (ControlFlow 0 272) 271) anon270_Then_correct) (=> (= (ControlFlow 0 272) 264) anon270_Else_correct)) (=> (= (ControlFlow 0 272) 220) anon269_Then_correct)) (=> (= (ControlFlow 0 272) 222) anon269_Else_correct))))))
(let ((anon267_Else_correct  (=> (and (>= 0 j@0) (= (ControlFlow 0 274) 272)) anon92_correct)))
(let ((anon267_Then_correct  (=> (and (and (> j@0 0) (state ExhaleHeap@0 Mask@3)) (and (<= (itemAt ExhaleHeap@0 this@@15 (- j@0 1)) elem) (= (ControlFlow 0 273) 272))) anon92_correct)))
(let ((anon266_Then_correct  (=> (and (state ExhaleHeap@0 ZeroMask) (= Mask@3 (MapType1Store ZeroMask null (AList this@@15) (real_2_U (+ (U_2_real (MapType1Select ZeroMask null (AList this@@15))) FullPerm))))) (=> (and (and (state ExhaleHeap@0 Mask@3) (<= 0 j@0)) (and (state ExhaleHeap@0 Mask@3) (<= j@0 (length ExhaleHeap@0 this@@15)))) (and (=> (= (ControlFlow 0 275) 273) anon267_Then_correct) (=> (= (ControlFlow 0 275) 274) anon267_Else_correct))))))
(let ((anon134_correct true))
(let ((anon289_Else_correct  (=> (and (not (and (<= 0 i_15) (< i_15 (len (MapType0Select Heap@1 this@@15 elems))))) (= (ControlFlow 0 197) 192)) anon134_correct)))
(let ((anon289_Then_correct  (=> (and (<= 0 i_15) (< i_15 (len (MapType0Select Heap@1 this@@15 elems)))) (and (=> (= (ControlFlow 0 193) (- 0 196)) (HasDirectPerm QPMask@1 (loc a_3@@1 i_15) val)) (=> (HasDirectPerm QPMask@1 (loc a_3@@1 i_15) val) (and (=> (= (ControlFlow 0 193) (- 0 195)) (HasDirectPerm QPMask@1 this@@15 elems)) (=> (HasDirectPerm QPMask@1 this@@15 elems) (and (=> (= (ControlFlow 0 193) (- 0 194)) (HasDirectPerm QPMask@1 (loc (MapType0Select Heap@1 this@@15 elems) i_15) val)) (=> (HasDirectPerm QPMask@1 (loc (MapType0Select Heap@1 this@@15 elems) i_15) val) (=> (= (ControlFlow 0 193) 192) anon134_correct))))))))))
(let ((anon288_Else_correct  (=> (< i_15 0) (and (=> (= (ControlFlow 0 200) 193) anon289_Then_correct) (=> (= (ControlFlow 0 200) 197) anon289_Else_correct)))))
(let ((anon288_Then_correct  (=> (<= 0 i_15) (and (=> (= (ControlFlow 0 198) (- 0 199)) (HasDirectPerm QPMask@1 this@@15 elems)) (=> (HasDirectPerm QPMask@1 this@@15 elems) (and (=> (= (ControlFlow 0 198) 193) anon289_Then_correct) (=> (= (ControlFlow 0 198) 197) anon289_Else_correct)))))))
(let ((anon286_Then_correct true))
(let ((anon181_correct  (and (=> (= (ControlFlow 0 137) (- 0 138)) (<= 0 (- i_18 1))) (=> (<= 0 (- i_18 1)) (=> (= (ControlFlow 0 137) (- 0 136)) (< (- i_18 1) (length Heap@@19 this@@15)))))))
(let ((anon316_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 141) 137)) anon181_correct)))
(let ((anon316_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 139) (- 0 140)) (<= FullPerm (U_2_real (MapType1Select Mask@0 null (AList this@@15))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@0 null (AList this@@15)))) (=> (= (ControlFlow 0 139) 137) anon181_correct))))))
(let ((anon182_correct true))
(let ((anon314_Then_correct  (=> (> i_18 t_1@1) (and (=> (= (ControlFlow 0 142) (- 0 144)) (HasDirectPerm QPMask@7 this@@15 elems)) (=> (HasDirectPerm QPMask@7 this@@15 elems) (and (=> (= (ControlFlow 0 142) (- 0 143)) (HasDirectPerm QPMask@7 (loc (MapType0Select ExhaleHeap@1 this@@15 elems) i_18) val)) (=> (HasDirectPerm QPMask@7 (loc (MapType0Select ExhaleHeap@1 this@@15 elems) i_18) val) (and (and (=> (= (ControlFlow 0 142) 133) anon182_correct) (=> (= (ControlFlow 0 142) 139) anon316_Then_correct)) (=> (= (ControlFlow 0 142) 141) anon316_Else_correct)))))))))
(let ((anon314_Else_correct  (=> (and (>= t_1@1 i_18) (= (ControlFlow 0 135) 133)) anon182_correct)))
(let ((anon313_Then_correct  (=> (and (< j@0 i_18) (<= i_18 (U_2_int (MapType0Select ExhaleHeap@1 this@@15 size)))) (and (=> (= (ControlFlow 0 145) 142) anon314_Then_correct) (=> (= (ControlFlow 0 145) 135) anon314_Else_correct)))))
(let ((anon313_Else_correct  (=> (and (not (and (< j@0 i_18) (<= i_18 (U_2_int (MapType0Select ExhaleHeap@1 this@@15 size))))) (= (ControlFlow 0 134) 133)) anon182_correct)))
(let ((anon312_Else_correct  (=> (<= i_18 j@0) (and (=> (= (ControlFlow 0 148) 145) anon313_Then_correct) (=> (= (ControlFlow 0 148) 134) anon313_Else_correct)))))
(let ((anon312_Then_correct  (=> (< j@0 i_18) (and (=> (= (ControlFlow 0 146) (- 0 147)) (HasDirectPerm QPMask@7 this@@15 size)) (=> (HasDirectPerm QPMask@7 this@@15 size) (and (=> (= (ControlFlow 0 146) 145) anon313_Then_correct) (=> (= (ControlFlow 0 146) 134) anon313_Else_correct)))))))
(let ((anon311_Else_correct true))
(let ((anon305_Else_correct  (=> (forall ((i_16_1 Int) ) (!  (=> (and (<= j@0 i_16_1) (<= i_16_1 (U_2_int (MapType0Select ExhaleHeap@1 this@@15 size)))) (=> (< i_16_1 t_1@1) (= (U_2_int (MapType0Select ExhaleHeap@1 (loc (MapType0Select ExhaleHeap@1 this@@15 elems) i_16_1) val)) (itemAt Heap@@19 this@@15 i_16_1))))
 :qid |stdinbpl.2818:24|
 :skolemid |147|
 :pattern ( (loc (MapType0Select ExhaleHeap@1 this@@15 elems) i_16_1))
)) (=> (and (state ExhaleHeap@1 QPMask@7) (state ExhaleHeap@1 QPMask@7)) (and (and (=> (= (ControlFlow 0 149) 132) anon311_Else_correct) (=> (= (ControlFlow 0 149) 146) anon312_Then_correct)) (=> (= (ControlFlow 0 149) 148) anon312_Else_correct))))))
(let ((anon171_correct  (and (=> (= (ControlFlow 0 120) (- 0 121)) (<= 0 i_17)) (=> (<= 0 i_17) (=> (= (ControlFlow 0 120) (- 0 119)) (< i_17 (length Heap@@19 this@@15)))))))
(let ((anon310_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 124) 120)) anon171_correct)))
(let ((anon310_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 122) (- 0 123)) (<= FullPerm (U_2_real (MapType1Select Mask@0 null (AList this@@15))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@0 null (AList this@@15)))) (=> (= (ControlFlow 0 122) 120) anon171_correct))))))
(let ((anon172_correct true))
(let ((anon308_Then_correct  (=> (< i_17 t_1@1) (and (=> (= (ControlFlow 0 125) (- 0 127)) (HasDirectPerm QPMask@7 this@@15 elems)) (=> (HasDirectPerm QPMask@7 this@@15 elems) (and (=> (= (ControlFlow 0 125) (- 0 126)) (HasDirectPerm QPMask@7 (loc (MapType0Select ExhaleHeap@1 this@@15 elems) i_17) val)) (=> (HasDirectPerm QPMask@7 (loc (MapType0Select ExhaleHeap@1 this@@15 elems) i_17) val) (and (and (=> (= (ControlFlow 0 125) 116) anon172_correct) (=> (= (ControlFlow 0 125) 122) anon310_Then_correct)) (=> (= (ControlFlow 0 125) 124) anon310_Else_correct)))))))))
(let ((anon308_Else_correct  (=> (and (<= t_1@1 i_17) (= (ControlFlow 0 118) 116)) anon172_correct)))
(let ((anon307_Then_correct  (=> (and (<= j@0 i_17) (<= i_17 (U_2_int (MapType0Select ExhaleHeap@1 this@@15 size)))) (and (=> (= (ControlFlow 0 128) 125) anon308_Then_correct) (=> (= (ControlFlow 0 128) 118) anon308_Else_correct)))))
(let ((anon307_Else_correct  (=> (and (not (and (<= j@0 i_17) (<= i_17 (U_2_int (MapType0Select ExhaleHeap@1 this@@15 size))))) (= (ControlFlow 0 117) 116)) anon172_correct)))
(let ((anon306_Else_correct  (=> (< i_17 j@0) (and (=> (= (ControlFlow 0 131) 128) anon307_Then_correct) (=> (= (ControlFlow 0 131) 117) anon307_Else_correct)))))
(let ((anon306_Then_correct  (=> (<= j@0 i_17) (and (=> (= (ControlFlow 0 129) (- 0 130)) (HasDirectPerm QPMask@7 this@@15 size)) (=> (HasDirectPerm QPMask@7 this@@15 size) (and (=> (= (ControlFlow 0 129) 128) anon307_Then_correct) (=> (= (ControlFlow 0 129) 117) anon307_Else_correct)))))))
(let ((anon302_Else_correct  (and (=> (= (ControlFlow 0 150) (- 0 151)) (forall ((i_14 Int) (i_14_1 Int) ) (!  (=> (and (and (and (and (not (= i_14 i_14_1)) (and (< j@0 i_14) (<= i_14 (U_2_int (MapType0Select ExhaleHeap@1 this@@15 size))))) (and (< j@0 i_14_1) (<= i_14_1 (U_2_int (MapType0Select ExhaleHeap@1 this@@15 size))))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (loc (MapType0Select ExhaleHeap@1 this@@15 elems) i_14) (loc (MapType0Select ExhaleHeap@1 this@@15 elems) i_14_1))))
 :qid |stdinbpl.2750:19|
 :skolemid |141|
))) (=> (forall ((i_14@@0 Int) (i_14_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_14@@0 i_14_1@@0)) (and (< j@0 i_14@@0) (<= i_14@@0 (U_2_int (MapType0Select ExhaleHeap@1 this@@15 size))))) (and (< j@0 i_14_1@@0) (<= i_14_1@@0 (U_2_int (MapType0Select ExhaleHeap@1 this@@15 size))))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (loc (MapType0Select ExhaleHeap@1 this@@15 elems) i_14@@0) (loc (MapType0Select ExhaleHeap@1 this@@15 elems) i_14_1@@0))))
 :qid |stdinbpl.2750:19|
 :skolemid |141|
)) (=> (and (and (and (forall ((i_14@@1 Int) ) (!  (=> (and (and (< j@0 i_14@@1) (<= i_14@@1 (U_2_int (MapType0Select ExhaleHeap@1 this@@15 size)))) (< NoPerm FullPerm)) (and (qpRange14 (loc (MapType0Select ExhaleHeap@1 this@@15 elems) i_14@@1)) (= (invRecv14 (loc (MapType0Select ExhaleHeap@1 this@@15 elems) i_14@@1)) i_14@@1)))
 :qid |stdinbpl.2756:26|
 :skolemid |142|
 :pattern ( (loc (MapType0Select ExhaleHeap@1 this@@15 elems) i_14@@1))
 :pattern ( (loc (MapType0Select ExhaleHeap@1 this@@15 elems) i_14@@1))
)) (forall ((o_3@@5 T@U) ) (!  (=> (= (type o_3@@5) RefType) (=> (and (and (and (< j@0 (invRecv14 o_3@@5)) (<= (invRecv14 o_3@@5) (U_2_int (MapType0Select ExhaleHeap@1 this@@15 size)))) (< NoPerm FullPerm)) (qpRange14 o_3@@5)) (= (loc (MapType0Select ExhaleHeap@1 this@@15 elems) (invRecv14 o_3@@5)) o_3@@5)))
 :qid |stdinbpl.2760:26|
 :skolemid |143|
 :pattern ( (invRecv14 o_3@@5))
))) (and (forall ((i_14@@2 Int) ) (!  (=> (and (< j@0 i_14@@2) (<= i_14@@2 (U_2_int (MapType0Select ExhaleHeap@1 this@@15 size)))) (not (= (loc (MapType0Select ExhaleHeap@1 this@@15 elems) i_14@@2) null)))
 :qid |stdinbpl.2766:26|
 :skolemid |144|
 :pattern ( (loc (MapType0Select ExhaleHeap@1 this@@15 elems) i_14@@2))
 :pattern ( (loc (MapType0Select ExhaleHeap@1 this@@15 elems) i_14@@2))
)) (forall ((o_3@@6 T@U) ) (!  (=> (= (type o_3@@6) RefType) (and (=> (and (and (and (< j@0 (invRecv14 o_3@@6)) (<= (invRecv14 o_3@@6) (U_2_int (MapType0Select ExhaleHeap@1 this@@15 size)))) (< NoPerm FullPerm)) (qpRange14 o_3@@6)) (and (=> (< NoPerm FullPerm) (= (loc (MapType0Select ExhaleHeap@1 this@@15 elems) (invRecv14 o_3@@6)) o_3@@6)) (= (U_2_real (MapType1Select QPMask@7 o_3@@6 val)) (+ (U_2_real (MapType1Select Mask@14 o_3@@6 val)) FullPerm)))) (=> (not (and (and (and (< j@0 (invRecv14 o_3@@6)) (<= (invRecv14 o_3@@6) (U_2_int (MapType0Select ExhaleHeap@1 this@@15 size)))) (< NoPerm FullPerm)) (qpRange14 o_3@@6))) (= (U_2_real (MapType1Select QPMask@7 o_3@@6 val)) (U_2_real (MapType1Select Mask@14 o_3@@6 val))))))
 :qid |stdinbpl.2772:26|
 :skolemid |145|
 :pattern ( (MapType1Select QPMask@7 o_3@@6 val))
)))) (and (and (forall ((o_3@@7 T@U) (f_5@@1 T@U) ) (! (let ((B@@14 (FieldTypeInv1 (type f_5@@1))))
(let ((A@@15 (FieldTypeInv0 (type f_5@@1))))
 (=> (and (and (= (type o_3@@7) RefType) (= (type f_5@@1) (FieldType A@@15 B@@14))) (not (= f_5@@1 val))) (= (U_2_real (MapType1Select Mask@14 o_3@@7 f_5@@1)) (U_2_real (MapType1Select QPMask@7 o_3@@7 f_5@@1))))))
 :qid |stdinbpl.2776:33|
 :skolemid |146|
 :pattern ( (MapType1Select Mask@14 o_3@@7 f_5@@1))
 :pattern ( (MapType1Select QPMask@7 o_3@@7 f_5@@1))
)) (state ExhaleHeap@1 QPMask@7)) (and (state ExhaleHeap@1 QPMask@7) (state ExhaleHeap@1 QPMask@7)))) (and (and (=> (= (ControlFlow 0 150) 149) anon305_Else_correct) (=> (= (ControlFlow 0 150) 129) anon306_Then_correct)) (=> (= (ControlFlow 0 150) 131) anon306_Else_correct)))))))
(let ((anon162_correct true))
(let ((anon304_Else_correct  (=> (and (not (and (< j@0 i_16) (<= i_16 (U_2_int (MapType0Select ExhaleHeap@1 this@@15 size))))) (= (ControlFlow 0 112) 109)) anon162_correct)))
(let ((anon304_Then_correct  (=> (and (< j@0 i_16) (<= i_16 (U_2_int (MapType0Select ExhaleHeap@1 this@@15 size)))) (and (=> (= (ControlFlow 0 110) (- 0 111)) (HasDirectPerm Mask@14 this@@15 elems)) (=> (HasDirectPerm Mask@14 this@@15 elems) (=> (= (ControlFlow 0 110) 109) anon162_correct))))))
(let ((anon303_Else_correct  (=> (<= i_16 j@0) (and (=> (= (ControlFlow 0 115) 110) anon304_Then_correct) (=> (= (ControlFlow 0 115) 112) anon304_Else_correct)))))
(let ((anon303_Then_correct  (=> (< j@0 i_16) (and (=> (= (ControlFlow 0 113) (- 0 114)) (HasDirectPerm Mask@14 this@@15 size)) (=> (HasDirectPerm Mask@14 this@@15 size) (and (=> (= (ControlFlow 0 113) 110) anon304_Then_correct) (=> (= (ControlFlow 0 113) 112) anon304_Else_correct)))))))
(let ((anon300_Else_correct  (=> (= (U_2_int (MapType0Select ExhaleHeap@1 this@@15 size)) (length Heap@@19 this@@15)) (=> (and (state ExhaleHeap@1 Mask@14) (<= (- 0 1) j@0)) (and (=> (= (ControlFlow 0 152) (- 0 154)) (HasDirectPerm Mask@14 this@@15 size)) (=> (HasDirectPerm Mask@14 this@@15 size) (and (=> (= (ControlFlow 0 152) (- 0 153)) (HasDirectPerm Mask@14 this@@15 elems)) (=> (HasDirectPerm Mask@14 this@@15 elems) (=> (and (< (U_2_int (MapType0Select ExhaleHeap@1 this@@15 size)) (len (MapType0Select ExhaleHeap@1 this@@15 elems))) (state ExhaleHeap@1 Mask@14)) (and (and (=> (= (ControlFlow 0 152) 150) anon302_Else_correct) (=> (= (ControlFlow 0 152) 113) anon303_Then_correct)) (=> (= (ControlFlow 0 152) 115) anon303_Else_correct)))))))))))
(let ((anon156_correct true))
(let ((anon301_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 108) 105)) anon156_correct)))
(let ((anon301_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 106) (- 0 107)) (<= FullPerm (U_2_real (MapType1Select Mask@0 null (AList this@@15))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@0 null (AList this@@15)))) (=> (= (ControlFlow 0 106) 105) anon156_correct))))))
(let ((anon299_Then_correct  (=> (= perm@3 (/ (to_real 1) (to_real 2))) (and (=> (= (ControlFlow 0 155) (- 0 161)) (>= perm@3 NoPerm)) (=> (>= perm@3 NoPerm) (=> (and (and (=> (> perm@3 NoPerm) (not (= this@@15 null))) (= Mask@12 (MapType1Store QPMask@2 this@@15 elems (real_2_U (+ (U_2_real (MapType1Select QPMask@2 this@@15 elems)) perm@3))))) (and (state ExhaleHeap@1 Mask@12) (= perm@4 (/ (to_real 1) (to_real 2))))) (and (=> (= (ControlFlow 0 155) (- 0 160)) (>= perm@4 NoPerm)) (=> (>= perm@4 NoPerm) (=> (=> (> perm@4 NoPerm) (not (= this@@15 null))) (=> (and (= Mask@13 (MapType1Store Mask@12 this@@15 size (real_2_U (+ (U_2_real (MapType1Select Mask@12 this@@15 size)) perm@4)))) (state ExhaleHeap@1 Mask@13)) (and (=> (= (ControlFlow 0 155) (- 0 159)) (HasDirectPerm Mask@13 this@@15 elems)) (=> (HasDirectPerm Mask@13 this@@15 elems) (=> (= perm@5 (/ (to_real 1) (to_real 2))) (and (=> (= (ControlFlow 0 155) (- 0 158)) (>= perm@5 NoPerm)) (=> (>= perm@5 NoPerm) (=> (=> (> perm@5 NoPerm) (not (= (loc (MapType0Select ExhaleHeap@1 this@@15 elems) j@0) null))) (=> (and (and (= Mask@14 (MapType1Store Mask@13 (loc (MapType0Select ExhaleHeap@1 this@@15 elems) j@0) val (real_2_U (+ (U_2_real (MapType1Select Mask@13 (loc (MapType0Select ExhaleHeap@1 this@@15 elems) j@0) val)) perm@5)))) (state ExhaleHeap@1 Mask@14)) (and (state ExhaleHeap@1 Mask@14) (<= j@0 t_1@1))) (and (=> (= (ControlFlow 0 155) (- 0 157)) (HasDirectPerm Mask@14 this@@15 size)) (=> (HasDirectPerm Mask@14 this@@15 size) (=> (<= t_1@1 (U_2_int (MapType0Select ExhaleHeap@1 this@@15 size))) (=> (and (state ExhaleHeap@1 Mask@14) (state ExhaleHeap@1 Mask@14)) (and (=> (= (ControlFlow 0 155) (- 0 156)) (HasDirectPerm Mask@14 this@@15 size)) (=> (HasDirectPerm Mask@14 this@@15 size) (and (and (=> (= (ControlFlow 0 155) 152) anon300_Else_correct) (=> (= (ControlFlow 0 155) 106) anon301_Then_correct)) (=> (= (ControlFlow 0 155) 108) anon301_Else_correct)))))))))))))))))))))))))
(let ((anon200_correct true))
(let ((anon326_Else_correct  (=> (and (>= t_1@2 i_25) (= (ControlFlow 0 71) 67)) anon200_correct)))
(let ((anon326_Then_correct  (=> (> i_25 t_1@2) (and (=> (= (ControlFlow 0 69) (- 0 70)) (= (U_2_int (MapType0Select Heap@4 (loc (MapType0Select Heap@4 this@@15 elems) i_25) val)) (itemAt Heap@@19 this@@15 (- i_25 1)))) (=> (= (U_2_int (MapType0Select Heap@4 (loc (MapType0Select Heap@4 this@@15 elems) i_25) val)) (itemAt Heap@@19 this@@15 (- i_25 1))) (=> (= (ControlFlow 0 69) 67) anon200_correct))))))
(let ((anon325_Then_correct  (=> (and (< j@0 i_25) (<= i_25 (U_2_int (MapType0Select Heap@4 this@@15 size)))) (and (=> (= (ControlFlow 0 72) 69) anon326_Then_correct) (=> (= (ControlFlow 0 72) 71) anon326_Else_correct)))))
(let ((anon325_Else_correct  (=> (and (not (and (< j@0 i_25) (<= i_25 (U_2_int (MapType0Select Heap@4 this@@15 size))))) (= (ControlFlow 0 68) 67)) anon200_correct)))
(let ((anon324_Else_correct true))
(let ((anon321_Else_correct  (=> (forall ((i_24_1 Int) ) (!  (=> (and (<= j@0 i_24_1) (<= i_24_1 (U_2_int (MapType0Select Heap@4 this@@15 size)))) (=> (< i_24_1 t_1@2) (= (U_2_int (MapType0Select Heap@4 (loc (MapType0Select Heap@4 this@@15 elems) i_24_1) val)) (itemAt Heap@@19 this@@15 i_24_1))))
 :qid |stdinbpl.3055:24|
 :skolemid |163|
 :pattern ( (loc (MapType0Select Heap@4 this@@15 elems) i_24_1))
)) (and (and (=> (= (ControlFlow 0 73) 66) anon324_Else_correct) (=> (= (ControlFlow 0 73) 72) anon325_Then_correct)) (=> (= (ControlFlow 0 73) 68) anon325_Else_correct)))))
(let ((anon195_correct true))
(let ((anon323_Else_correct  (=> (and (<= t_1@2 i_23) (= (ControlFlow 0 64) 60)) anon195_correct)))
(let ((anon323_Then_correct  (=> (< i_23 t_1@2) (and (=> (= (ControlFlow 0 62) (- 0 63)) (= (U_2_int (MapType0Select Heap@4 (loc (MapType0Select Heap@4 this@@15 elems) i_23) val)) (itemAt Heap@@19 this@@15 i_23))) (=> (= (U_2_int (MapType0Select Heap@4 (loc (MapType0Select Heap@4 this@@15 elems) i_23) val)) (itemAt Heap@@19 this@@15 i_23)) (=> (= (ControlFlow 0 62) 60) anon195_correct))))))
(let ((anon322_Then_correct  (=> (and (<= j@0 i_23) (<= i_23 (U_2_int (MapType0Select Heap@4 this@@15 size)))) (and (=> (= (ControlFlow 0 65) 62) anon323_Then_correct) (=> (= (ControlFlow 0 65) 64) anon323_Else_correct)))))
(let ((anon322_Else_correct  (=> (and (not (and (<= j@0 i_23) (<= i_23 (U_2_int (MapType0Select Heap@4 this@@15 size))))) (= (ControlFlow 0 61) 60)) anon195_correct)))
(let ((anon191_correct  (=> (= Mask@27 (MapType1Store Mask@26 (loc (MapType0Select Heap@4 this@@15 elems) j@0) val (real_2_U (- (U_2_real (MapType1Select Mask@26 (loc (MapType0Select Heap@4 this@@15 elems) j@0) val)) perm@14)))) (and (=> (= (ControlFlow 0 74) (- 0 81)) (<= j@0 t_1@2)) (=> (<= j@0 t_1@2) (and (=> (= (ControlFlow 0 74) (- 0 80)) (<= t_1@2 (U_2_int (MapType0Select Heap@4 this@@15 size)))) (=> (<= t_1@2 (U_2_int (MapType0Select Heap@4 this@@15 size))) (and (=> (= (ControlFlow 0 74) (- 0 79)) (= (U_2_int (MapType0Select Heap@4 this@@15 size)) (length Heap@@19 this@@15))) (=> (= (U_2_int (MapType0Select Heap@4 this@@15 size)) (length Heap@@19 this@@15)) (and (=> (= (ControlFlow 0 74) (- 0 78)) (<= (- 0 1) j@0)) (=> (<= (- 0 1) j@0) (and (=> (= (ControlFlow 0 74) (- 0 77)) (< (U_2_int (MapType0Select Heap@4 this@@15 size)) (len (MapType0Select Heap@4 this@@15 elems)))) (=> (< (U_2_int (MapType0Select Heap@4 this@@15 size)) (len (MapType0Select Heap@4 this@@15 elems))) (and (=> (= (ControlFlow 0 74) (- 0 76)) (forall ((i_22 Int) (i_22_1 Int) ) (!  (=> (and (and (and (and (not (= i_22 i_22_1)) (and (< j@0 i_22) (<= i_22 (U_2_int (MapType0Select Heap@4 this@@15 size))))) (and (< j@0 i_22_1) (<= i_22_1 (U_2_int (MapType0Select Heap@4 this@@15 size))))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (loc (MapType0Select Heap@4 this@@15 elems) i_22) (loc (MapType0Select Heap@4 this@@15 elems) i_22_1))))
 :qid |stdinbpl.3012:21|
 :skolemid |157|
 :pattern ( (neverTriggered16 i_22) (neverTriggered16 i_22_1))
))) (=> (forall ((i_22@@0 Int) (i_22_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_22@@0 i_22_1@@0)) (and (< j@0 i_22@@0) (<= i_22@@0 (U_2_int (MapType0Select Heap@4 this@@15 size))))) (and (< j@0 i_22_1@@0) (<= i_22_1@@0 (U_2_int (MapType0Select Heap@4 this@@15 size))))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (loc (MapType0Select Heap@4 this@@15 elems) i_22@@0) (loc (MapType0Select Heap@4 this@@15 elems) i_22_1@@0))))
 :qid |stdinbpl.3012:21|
 :skolemid |157|
 :pattern ( (neverTriggered16 i_22@@0) (neverTriggered16 i_22_1@@0))
)) (and (=> (= (ControlFlow 0 74) (- 0 75)) (forall ((i_22@@1 Int) ) (!  (=> (and (< j@0 i_22@@1) (<= i_22@@1 (U_2_int (MapType0Select Heap@4 this@@15 size)))) (>= (U_2_real (MapType1Select Mask@27 (loc (MapType0Select Heap@4 this@@15 elems) i_22@@1) val)) FullPerm))
 :qid |stdinbpl.3019:21|
 :skolemid |158|
 :pattern ( (loc (MapType0Select Heap@4 this@@15 elems) i_22@@1))
 :pattern ( (loc (MapType0Select Heap@4 this@@15 elems) i_22@@1))
))) (=> (forall ((i_22@@2 Int) ) (!  (=> (and (< j@0 i_22@@2) (<= i_22@@2 (U_2_int (MapType0Select Heap@4 this@@15 size)))) (>= (U_2_real (MapType1Select Mask@27 (loc (MapType0Select Heap@4 this@@15 elems) i_22@@2) val)) FullPerm))
 :qid |stdinbpl.3019:21|
 :skolemid |158|
 :pattern ( (loc (MapType0Select Heap@4 this@@15 elems) i_22@@2))
 :pattern ( (loc (MapType0Select Heap@4 this@@15 elems) i_22@@2))
)) (=> (and (and (forall ((i_22@@3 Int) ) (!  (=> (and (and (< j@0 i_22@@3) (<= i_22@@3 (U_2_int (MapType0Select Heap@4 this@@15 size)))) (< NoPerm FullPerm)) (and (qpRange16 (loc (MapType0Select Heap@4 this@@15 elems) i_22@@3)) (= (invRecv16 (loc (MapType0Select Heap@4 this@@15 elems) i_22@@3)) i_22@@3)))
 :qid |stdinbpl.3025:26|
 :skolemid |159|
 :pattern ( (loc (MapType0Select Heap@4 this@@15 elems) i_22@@3))
 :pattern ( (loc (MapType0Select Heap@4 this@@15 elems) i_22@@3))
)) (forall ((o_3@@8 T@U) ) (!  (=> (= (type o_3@@8) RefType) (=> (and (and (< j@0 (invRecv16 o_3@@8)) (<= (invRecv16 o_3@@8) (U_2_int (MapType0Select Heap@4 this@@15 size)))) (and (< NoPerm FullPerm) (qpRange16 o_3@@8))) (= (loc (MapType0Select Heap@4 this@@15 elems) (invRecv16 o_3@@8)) o_3@@8)))
 :qid |stdinbpl.3029:26|
 :skolemid |160|
 :pattern ( (invRecv16 o_3@@8))
))) (and (forall ((o_3@@9 T@U) ) (!  (=> (= (type o_3@@9) RefType) (and (=> (and (and (< j@0 (invRecv16 o_3@@9)) (<= (invRecv16 o_3@@9) (U_2_int (MapType0Select Heap@4 this@@15 size)))) (and (< NoPerm FullPerm) (qpRange16 o_3@@9))) (and (= (loc (MapType0Select Heap@4 this@@15 elems) (invRecv16 o_3@@9)) o_3@@9) (= (U_2_real (MapType1Select QPMask@6 o_3@@9 val)) (- (U_2_real (MapType1Select Mask@27 o_3@@9 val)) FullPerm)))) (=> (not (and (and (< j@0 (invRecv16 o_3@@9)) (<= (invRecv16 o_3@@9) (U_2_int (MapType0Select Heap@4 this@@15 size)))) (and (< NoPerm FullPerm) (qpRange16 o_3@@9)))) (= (U_2_real (MapType1Select QPMask@6 o_3@@9 val)) (U_2_real (MapType1Select Mask@27 o_3@@9 val))))))
 :qid |stdinbpl.3035:26|
 :skolemid |161|
 :pattern ( (MapType1Select QPMask@6 o_3@@9 val))
)) (forall ((o_3@@10 T@U) (f_5@@2 T@U) ) (! (let ((B@@15 (FieldTypeInv1 (type f_5@@2))))
(let ((A@@16 (FieldTypeInv0 (type f_5@@2))))
 (=> (and (and (= (type o_3@@10) RefType) (= (type f_5@@2) (FieldType A@@16 B@@15))) (not (= f_5@@2 val))) (= (U_2_real (MapType1Select Mask@27 o_3@@10 f_5@@2)) (U_2_real (MapType1Select QPMask@6 o_3@@10 f_5@@2))))))
 :qid |stdinbpl.3041:33|
 :skolemid |162|
 :pattern ( (MapType1Select QPMask@6 o_3@@10 f_5@@2))
)))) (and (and (=> (= (ControlFlow 0 74) 73) anon321_Else_correct) (=> (= (ControlFlow 0 74) 65) anon322_Then_correct)) (=> (= (ControlFlow 0 74) 61) anon322_Else_correct))))))))))))))))))))
(let ((anon320_Else_correct  (=> (and (= perm@14 NoPerm) (= (ControlFlow 0 84) 74)) anon191_correct)))
(let ((anon320_Then_correct  (=> (not (= perm@14 NoPerm)) (and (=> (= (ControlFlow 0 82) (- 0 83)) (<= perm@14 (U_2_real (MapType1Select Mask@26 (loc (MapType0Select Heap@4 this@@15 elems) j@0) val)))) (=> (<= perm@14 (U_2_real (MapType1Select Mask@26 (loc (MapType0Select Heap@4 this@@15 elems) j@0) val))) (=> (= (ControlFlow 0 82) 74) anon191_correct))))))
(let ((anon189_correct  (=> (and (= Mask@26 (MapType1Store Mask@25 this@@15 size (real_2_U (- (U_2_real (MapType1Select Mask@25 this@@15 size)) perm@13)))) (= perm@14 (/ (to_real 1) (to_real 2)))) (and (=> (= (ControlFlow 0 85) (- 0 86)) (>= perm@14 NoPerm)) (=> (>= perm@14 NoPerm) (and (=> (= (ControlFlow 0 85) 82) anon320_Then_correct) (=> (= (ControlFlow 0 85) 84) anon320_Else_correct)))))))
(let ((anon319_Else_correct  (=> (and (= perm@13 NoPerm) (= (ControlFlow 0 89) 85)) anon189_correct)))
(let ((anon319_Then_correct  (=> (not (= perm@13 NoPerm)) (and (=> (= (ControlFlow 0 87) (- 0 88)) (<= perm@13 (U_2_real (MapType1Select Mask@25 this@@15 size)))) (=> (<= perm@13 (U_2_real (MapType1Select Mask@25 this@@15 size))) (=> (= (ControlFlow 0 87) 85) anon189_correct))))))
(let ((anon187_correct  (=> (and (= Mask@25 (MapType1Store QPMask@3 this@@15 elems (real_2_U (- (U_2_real (MapType1Select QPMask@3 this@@15 elems)) perm@9)))) (= perm@13 (/ (to_real 1) (to_real 2)))) (and (=> (= (ControlFlow 0 90) (- 0 91)) (>= perm@13 NoPerm)) (=> (>= perm@13 NoPerm) (and (=> (= (ControlFlow 0 90) 87) anon319_Then_correct) (=> (= (ControlFlow 0 90) 89) anon319_Else_correct)))))))
(let ((anon318_Else_correct  (=> (and (= perm@9 NoPerm) (= (ControlFlow 0 94) 90)) anon187_correct)))
(let ((anon318_Then_correct  (=> (not (= perm@9 NoPerm)) (and (=> (= (ControlFlow 0 92) (- 0 93)) (<= perm@9 (U_2_real (MapType1Select QPMask@3 this@@15 elems)))) (=> (<= perm@9 (U_2_real (MapType1Select QPMask@3 this@@15 elems))) (=> (= (ControlFlow 0 92) 90) anon187_correct))))))
(let ((anon317_Then_correct  (=> (and (state ExhaleHeap@1 ZeroMask) (= perm@6 (/ (to_real 1) (to_real 2)))) (and (=> (= (ControlFlow 0 95) (- 0 104)) (>= perm@6 NoPerm)) (=> (>= perm@6 NoPerm) (=> (and (and (=> (> perm@6 NoPerm) (not (= this@@15 null))) (= Mask@15 (MapType1Store ZeroMask this@@15 elems (real_2_U (+ (U_2_real (MapType1Select ZeroMask this@@15 elems)) perm@6))))) (and (state ExhaleHeap@1 Mask@15) (= perm@7 (/ (to_real 1) (to_real 2))))) (and (=> (= (ControlFlow 0 95) (- 0 103)) (>= perm@7 NoPerm)) (=> (>= perm@7 NoPerm) (=> (and (and (=> (> perm@7 NoPerm) (not (= this@@15 null))) (= Mask@16 (MapType1Store Mask@15 this@@15 size (real_2_U (+ (U_2_real (MapType1Select Mask@15 this@@15 size)) perm@7))))) (and (state ExhaleHeap@1 Mask@16) (= perm@8 (/ (to_real 1) (to_real 2))))) (and (=> (= (ControlFlow 0 95) (- 0 102)) (>= perm@8 NoPerm)) (=> (>= perm@8 NoPerm) (=> (=> (> perm@8 NoPerm) (not (= (loc (MapType0Select ExhaleHeap@1 this@@15 elems) j@0) null))) (=> (and (and (and (= Mask@17 (MapType1Store Mask@16 (loc (MapType0Select ExhaleHeap@1 this@@15 elems) j@0) val (real_2_U (+ (U_2_real (MapType1Select Mask@16 (loc (MapType0Select ExhaleHeap@1 this@@15 elems) j@0) val)) perm@8)))) (state ExhaleHeap@1 Mask@17)) (and (<= j@0 t_1@1) (<= t_1@1 (U_2_int (MapType0Select ExhaleHeap@1 this@@15 size))))) (and (and (state ExhaleHeap@1 Mask@17) (= (U_2_int (MapType0Select ExhaleHeap@1 this@@15 size)) (length Heap@@19 this@@15))) (and (<= (- 0 1) j@0) (< (U_2_int (MapType0Select ExhaleHeap@1 this@@15 size)) (len (MapType0Select ExhaleHeap@1 this@@15 elems)))))) (and (=> (= (ControlFlow 0 95) (- 0 101)) (forall ((i_19 Int) (i_19_1 Int) ) (!  (=> (and (and (and (and (not (= i_19 i_19_1)) (and (< j@0 i_19) (<= i_19 (U_2_int (MapType0Select ExhaleHeap@1 this@@15 size))))) (and (< j@0 i_19_1) (<= i_19_1 (U_2_int (MapType0Select ExhaleHeap@1 this@@15 size))))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (loc (MapType0Select ExhaleHeap@1 this@@15 elems) i_19) (loc (MapType0Select ExhaleHeap@1 this@@15 elems) i_19_1))))
 :qid |stdinbpl.2900:19|
 :skolemid |149|
))) (=> (forall ((i_19@@0 Int) (i_19_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_19@@0 i_19_1@@0)) (and (< j@0 i_19@@0) (<= i_19@@0 (U_2_int (MapType0Select ExhaleHeap@1 this@@15 size))))) (and (< j@0 i_19_1@@0) (<= i_19_1@@0 (U_2_int (MapType0Select ExhaleHeap@1 this@@15 size))))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (loc (MapType0Select ExhaleHeap@1 this@@15 elems) i_19@@0) (loc (MapType0Select ExhaleHeap@1 this@@15 elems) i_19_1@@0))))
 :qid |stdinbpl.2900:19|
 :skolemid |149|
)) (=> (forall ((i_19@@1 Int) ) (!  (=> (and (and (< j@0 i_19@@1) (<= i_19@@1 (U_2_int (MapType0Select ExhaleHeap@1 this@@15 size)))) (< NoPerm FullPerm)) (and (qpRange15 (loc (MapType0Select ExhaleHeap@1 this@@15 elems) i_19@@1)) (= (invRecv15 (loc (MapType0Select ExhaleHeap@1 this@@15 elems) i_19@@1)) i_19@@1)))
 :qid |stdinbpl.2906:26|
 :skolemid |150|
 :pattern ( (loc (MapType0Select ExhaleHeap@1 this@@15 elems) i_19@@1))
 :pattern ( (loc (MapType0Select ExhaleHeap@1 this@@15 elems) i_19@@1))
)) (=> (and (and (forall ((o_3@@11 T@U) ) (!  (=> (= (type o_3@@11) RefType) (=> (and (and (and (< j@0 (invRecv15 o_3@@11)) (<= (invRecv15 o_3@@11) (U_2_int (MapType0Select ExhaleHeap@1 this@@15 size)))) (< NoPerm FullPerm)) (qpRange15 o_3@@11)) (= (loc (MapType0Select ExhaleHeap@1 this@@15 elems) (invRecv15 o_3@@11)) o_3@@11)))
 :qid |stdinbpl.2910:26|
 :skolemid |151|
 :pattern ( (invRecv15 o_3@@11))
)) (forall ((i_19@@2 Int) ) (!  (=> (and (< j@0 i_19@@2) (<= i_19@@2 (U_2_int (MapType0Select ExhaleHeap@1 this@@15 size)))) (not (= (loc (MapType0Select ExhaleHeap@1 this@@15 elems) i_19@@2) null)))
 :qid |stdinbpl.2916:26|
 :skolemid |152|
 :pattern ( (loc (MapType0Select ExhaleHeap@1 this@@15 elems) i_19@@2))
 :pattern ( (loc (MapType0Select ExhaleHeap@1 this@@15 elems) i_19@@2))
))) (and (forall ((o_3@@12 T@U) ) (!  (=> (= (type o_3@@12) RefType) (and (=> (and (and (and (< j@0 (invRecv15 o_3@@12)) (<= (invRecv15 o_3@@12) (U_2_int (MapType0Select ExhaleHeap@1 this@@15 size)))) (< NoPerm FullPerm)) (qpRange15 o_3@@12)) (and (=> (< NoPerm FullPerm) (= (loc (MapType0Select ExhaleHeap@1 this@@15 elems) (invRecv15 o_3@@12)) o_3@@12)) (= (U_2_real (MapType1Select QPMask@3 o_3@@12 val)) (+ (U_2_real (MapType1Select Mask@17 o_3@@12 val)) FullPerm)))) (=> (not (and (and (and (< j@0 (invRecv15 o_3@@12)) (<= (invRecv15 o_3@@12) (U_2_int (MapType0Select ExhaleHeap@1 this@@15 size)))) (< NoPerm FullPerm)) (qpRange15 o_3@@12))) (= (U_2_real (MapType1Select QPMask@3 o_3@@12 val)) (U_2_real (MapType1Select Mask@17 o_3@@12 val))))))
 :qid |stdinbpl.2922:26|
 :skolemid |153|
 :pattern ( (MapType1Select QPMask@3 o_3@@12 val))
)) (forall ((o_3@@13 T@U) (f_5@@3 T@U) ) (! (let ((B@@16 (FieldTypeInv1 (type f_5@@3))))
(let ((A@@17 (FieldTypeInv0 (type f_5@@3))))
 (=> (and (and (= (type o_3@@13) RefType) (= (type f_5@@3) (FieldType A@@17 B@@16))) (not (= f_5@@3 val))) (= (U_2_real (MapType1Select Mask@17 o_3@@13 f_5@@3)) (U_2_real (MapType1Select QPMask@3 o_3@@13 f_5@@3))))))
 :qid |stdinbpl.2926:33|
 :skolemid |154|
 :pattern ( (MapType1Select Mask@17 o_3@@13 f_5@@3))
 :pattern ( (MapType1Select QPMask@3 o_3@@13 f_5@@3))
)))) (=> (and (and (and (state ExhaleHeap@1 QPMask@3) (state ExhaleHeap@1 QPMask@3)) (and (forall ((i_20 Int) ) (!  (=> (and (<= j@0 i_20) (<= i_20 (U_2_int (MapType0Select ExhaleHeap@1 this@@15 size)))) (=> (< i_20 t_1@1) (= (U_2_int (MapType0Select ExhaleHeap@1 (loc (MapType0Select ExhaleHeap@1 this@@15 elems) i_20) val)) (itemAt Heap@@19 this@@15 i_20))))
 :qid |stdinbpl.2933:24|
 :skolemid |155|
 :pattern ( (loc (MapType0Select ExhaleHeap@1 this@@15 elems) i_20))
)) (state ExhaleHeap@1 QPMask@3))) (and (and (forall ((i_21 Int) ) (!  (=> (and (< j@0 i_21) (<= i_21 (U_2_int (MapType0Select ExhaleHeap@1 this@@15 size)))) (=> (> i_21 t_1@1) (= (U_2_int (MapType0Select ExhaleHeap@1 (loc (MapType0Select ExhaleHeap@1 this@@15 elems) i_21) val)) (itemAt Heap@@19 this@@15 (- i_21 1)))))
 :qid |stdinbpl.2938:24|
 :skolemid |156|
 :pattern ( (loc (MapType0Select ExhaleHeap@1 this@@15 elems) i_21))
)) (state ExhaleHeap@1 QPMask@3)) (and (> t_1@1 j@0) (state ExhaleHeap@1 QPMask@3)))) (and (=> (= (ControlFlow 0 95) (- 0 100)) (HasDirectPerm QPMask@3 this@@15 elems)) (=> (HasDirectPerm QPMask@3 this@@15 elems) (and (=> (= (ControlFlow 0 95) (- 0 99)) (HasDirectPerm QPMask@3 this@@15 elems)) (=> (HasDirectPerm QPMask@3 this@@15 elems) (and (=> (= (ControlFlow 0 95) (- 0 98)) (HasDirectPerm QPMask@3 (loc (MapType0Select ExhaleHeap@1 this@@15 elems) (- t_1@1 1)) val)) (=> (HasDirectPerm QPMask@3 (loc (MapType0Select ExhaleHeap@1 this@@15 elems) (- t_1@1 1)) val) (and (=> (= (ControlFlow 0 95) (- 0 97)) (= FullPerm (U_2_real (MapType1Select QPMask@3 (loc (MapType0Select ExhaleHeap@1 this@@15 elems) t_1@1) val)))) (=> (= FullPerm (U_2_real (MapType1Select QPMask@3 (loc (MapType0Select ExhaleHeap@1 this@@15 elems) t_1@1) val))) (=> (= Heap@4 (MapType0Store ExhaleHeap@1 (loc (MapType0Select ExhaleHeap@1 this@@15 elems) t_1@1) val (MapType0Select ExhaleHeap@1 (loc (MapType0Select ExhaleHeap@1 this@@15 elems) (- t_1@1 1)) val))) (=> (and (and (state Heap@4 QPMask@3) (= t_1@2 (- t_1@1 1))) (and (state Heap@4 QPMask@3) (= perm@9 (/ (to_real 1) (to_real 2))))) (and (=> (= (ControlFlow 0 95) (- 0 96)) (>= perm@9 NoPerm)) (=> (>= perm@9 NoPerm) (and (=> (= (ControlFlow 0 95) 92) anon318_Then_correct) (=> (= (ControlFlow 0 95) 94) anon318_Else_correct))))))))))))))))))))))))))))))))
(let ((anon217_correct true))
(let ((anon334_Else_correct  (=> (and (not (and (< j@0 k_6) (< k_6 (length Heap@12 this@@15)))) (= (ControlFlow 0 25) 22)) anon217_correct)))
(let ((anon334_Then_correct  (=> (and (< j@0 k_6) (< k_6 (length Heap@12 this@@15))) (and (=> (= (ControlFlow 0 23) (- 0 24)) (= (itemAt Heap@12 this@@15 k_6) (itemAt Heap@@19 this@@15 (- k_6 1)))) (=> (= (itemAt Heap@12 this@@15 k_6) (itemAt Heap@@19 this@@15 (- k_6 1))) (=> (= (ControlFlow 0 23) 22) anon217_correct))))))
(let ((anon333_Else_correct true))
(let ((anon331_Else_correct  (=> (forall ((k_5_1 Int) ) (!  (=> (and (<= 0 k_5_1) (< k_5_1 j@0)) (= (itemAt Heap@12 this@@15 k_5_1) (itemAt Heap@@19 this@@15 k_5_1)))
 :qid |stdinbpl.3285:20|
 :skolemid |181|
 :pattern ( (|itemAt#frame| (MapType0Select Heap@@19 null (AList this@@15)) this@@15 k_5_1))
)) (and (=> (= (ControlFlow 0 26) (- 0 27)) (= (itemAt Heap@12 this@@15 j@0) elem)) (=> (= (itemAt Heap@12 this@@15 j@0) elem) (and (and (=> (= (ControlFlow 0 26) 21) anon333_Else_correct) (=> (= (ControlFlow 0 26) 23) anon334_Then_correct)) (=> (= (ControlFlow 0 26) 25) anon334_Else_correct)))))))
(let ((anon213_correct true))
(let ((anon332_Else_correct  (=> (and (not (and (<= 0 k_4_1) (< k_4_1 j@0))) (= (ControlFlow 0 20) 17)) anon213_correct)))
(let ((anon332_Then_correct  (=> (and (<= 0 k_4_1) (< k_4_1 j@0)) (and (=> (= (ControlFlow 0 18) (- 0 19)) (= (itemAt Heap@12 this@@15 k_4_1) (itemAt Heap@@19 this@@15 k_4_1))) (=> (= (itemAt Heap@12 this@@15 k_4_1) (itemAt Heap@@19 this@@15 k_4_1)) (=> (= (ControlFlow 0 18) 17) anon213_correct))))))
(let ((anon210_correct  (=> (= Mask@24 (MapType1Store Mask@23 null (AList this@@15) (real_2_U (- (U_2_real (MapType1Select Mask@23 null (AList this@@15))) FullPerm)))) (and (=> (= (ControlFlow 0 28) (- 0 31)) (<= 0 j@0)) (=> (<= 0 j@0) (and (=> (= (ControlFlow 0 28) (- 0 30)) (< j@0 (length Heap@12 this@@15))) (=> (< j@0 (length Heap@12 this@@15)) (and (=> (= (ControlFlow 0 28) (- 0 29)) (= (length Heap@12 this@@15) (+ (length Heap@@19 this@@15) 1))) (=> (= (length Heap@12 this@@15) (+ (length Heap@@19 this@@15) 1)) (and (and (=> (= (ControlFlow 0 28) 26) anon331_Else_correct) (=> (= (ControlFlow 0 28) 18) anon332_Then_correct)) (=> (= (ControlFlow 0 28) 20) anon332_Else_correct)))))))))))
(let ((anon330_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 34) 28)) anon210_correct)))
(let ((anon330_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 32) (- 0 33)) (<= FullPerm (U_2_real (MapType1Select Mask@23 null (AList this@@15))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@23 null (AList this@@15)))) (=> (= (ControlFlow 0 32) 28) anon210_correct))))))
(let ((anon208_correct  (=> (= Heap@10 (MapType0Store Heap@9 null (|AList#sm| this@@15) (MapType1Store (MapType0Select Heap@9 null (|AList#sm| this@@15)) this@@15 elems (bool_2_U true)))) (=> (and (= Heap@11 (MapType0Store Heap@10 null (|AList#sm| this@@15) (MapType1Store (MapType0Select Heap@10 null (|AList#sm| this@@15)) this@@15 size (bool_2_U true)))) (forall ((o_9 T@U) (f_12 T@U) ) (! (let ((B@@17 (FieldTypeInv1 (type f_12))))
(let ((A@@18 (FieldTypeInv0 (type f_12))))
 (=> (and (and (= (type o_9) RefType) (= (type f_12) (FieldType A@@18 B@@17))) (U_2_bool (MapType1Select (MapType0Select Heap@11 null (|AList#sm| this@@15)) o_9 f_12))) (U_2_bool (MapType1Select newPMask@0 o_9 f_12)))))
 :qid |stdinbpl.3251:27|
 :skolemid |179|
 :pattern ( (MapType1Select newPMask@0 o_9 f_12))
))) (=> (and (and (forall ((i_31 Int) ) (!  (=> (and (<= 0 i_31) (< i_31 (len (MapType0Select Heap@11 this@@15 elems)))) (U_2_bool (MapType1Select newPMask@0 (loc (MapType0Select Heap@11 this@@15 elems) i_31) val)))
 :qid |stdinbpl.3255:20|
 :skolemid |180|
)) (= Heap@12 (MapType0Store Heap@11 null (|AList#sm| this@@15) newPMask@0))) (and (state Heap@12 Mask@23) (state Heap@12 Mask@23))) (and (=> (= (ControlFlow 0 35) 32) anon330_Then_correct) (=> (= (ControlFlow 0 35) 34) anon330_Else_correct)))))))
(let ((anon329_Else_correct  (=> (HasDirectPerm Mask@23 null (AList this@@15)) (=> (and (= Heap@9 Heap@6) (= (ControlFlow 0 37) 35)) anon208_correct))))
(let ((anon329_Then_correct  (=> (not (HasDirectPerm Mask@23 null (AList this@@15))) (=> (and (and (= Heap@7 (MapType0Store Heap@6 null (|AList#sm| this@@15) ZeroPMask)) (= Heap@8 (MapType0Store Heap@7 null (AList this@@15) freshVersion@0))) (and (= Heap@9 Heap@8) (= (ControlFlow 0 36) 35))) anon208_correct))))
(let ((anon206_correct  (=> (= Mask@22 (MapType1Store Mask@21 this@@15 size (real_2_U (- (U_2_real (MapType1Select Mask@21 this@@15 size)) FullPerm)))) (and (=> (= (ControlFlow 0 38) (- 0 43)) (<= 0 (U_2_int (MapType0Select Heap@6 this@@15 size)))) (=> (<= 0 (U_2_int (MapType0Select Heap@6 this@@15 size))) (and (=> (= (ControlFlow 0 38) (- 0 42)) (<= (U_2_int (MapType0Select Heap@6 this@@15 size)) (len (MapType0Select Heap@6 this@@15 elems)))) (=> (<= (U_2_int (MapType0Select Heap@6 this@@15 size)) (len (MapType0Select Heap@6 this@@15 elems))) (and (=> (= (ControlFlow 0 38) (- 0 41)) (< 0 (len (MapType0Select Heap@6 this@@15 elems)))) (=> (< 0 (len (MapType0Select Heap@6 this@@15 elems))) (and (=> (= (ControlFlow 0 38) (- 0 40)) (forall ((i_30 Int) (i_30_1 Int) ) (!  (=> (and (and (and (and (not (= i_30 i_30_1)) (and (<= 0 i_30) (< i_30 (len (MapType0Select Heap@6 this@@15 elems))))) (and (<= 0 i_30_1) (< i_30_1 (len (MapType0Select Heap@6 this@@15 elems))))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (loc (MapType0Select Heap@6 this@@15 elems) i_30) (loc (MapType0Select Heap@6 this@@15 elems) i_30_1))))
 :qid |stdinbpl.3202:17|
 :skolemid |173|
 :pattern ( (neverTriggered18 i_30) (neverTriggered18 i_30_1))
))) (=> (forall ((i_30@@0 Int) (i_30_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_30@@0 i_30_1@@0)) (and (<= 0 i_30@@0) (< i_30@@0 (len (MapType0Select Heap@6 this@@15 elems))))) (and (<= 0 i_30_1@@0) (< i_30_1@@0 (len (MapType0Select Heap@6 this@@15 elems))))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (loc (MapType0Select Heap@6 this@@15 elems) i_30@@0) (loc (MapType0Select Heap@6 this@@15 elems) i_30_1@@0))))
 :qid |stdinbpl.3202:17|
 :skolemid |173|
 :pattern ( (neverTriggered18 i_30@@0) (neverTriggered18 i_30_1@@0))
)) (and (=> (= (ControlFlow 0 38) (- 0 39)) (forall ((i_30@@1 Int) ) (!  (=> (and (<= 0 i_30@@1) (< i_30@@1 (len (MapType0Select Heap@6 this@@15 elems)))) (>= (U_2_real (MapType1Select Mask@22 (loc (MapType0Select Heap@6 this@@15 elems) i_30@@1) val)) FullPerm))
 :qid |stdinbpl.3209:17|
 :skolemid |174|
 :pattern ( (loc (MapType0Select Heap@6 this@@15 elems) i_30@@1))
 :pattern ( (loc (MapType0Select Heap@6 this@@15 elems) i_30@@1))
))) (=> (forall ((i_30@@2 Int) ) (!  (=> (and (<= 0 i_30@@2) (< i_30@@2 (len (MapType0Select Heap@6 this@@15 elems)))) (>= (U_2_real (MapType1Select Mask@22 (loc (MapType0Select Heap@6 this@@15 elems) i_30@@2) val)) FullPerm))
 :qid |stdinbpl.3209:17|
 :skolemid |174|
 :pattern ( (loc (MapType0Select Heap@6 this@@15 elems) i_30@@2))
 :pattern ( (loc (MapType0Select Heap@6 this@@15 elems) i_30@@2))
)) (=> (forall ((i_30@@3 Int) ) (!  (=> (and (and (<= 0 i_30@@3) (< i_30@@3 (len (MapType0Select Heap@6 this@@15 elems)))) (< NoPerm FullPerm)) (and (qpRange18 (loc (MapType0Select Heap@6 this@@15 elems) i_30@@3)) (= (invRecv18 (loc (MapType0Select Heap@6 this@@15 elems) i_30@@3)) i_30@@3)))
 :qid |stdinbpl.3215:22|
 :skolemid |175|
 :pattern ( (loc (MapType0Select Heap@6 this@@15 elems) i_30@@3))
 :pattern ( (loc (MapType0Select Heap@6 this@@15 elems) i_30@@3))
)) (=> (and (and (and (forall ((o_3@@14 T@U) ) (!  (=> (= (type o_3@@14) RefType) (=> (and (and (<= 0 (invRecv18 o_3@@14)) (< (invRecv18 o_3@@14) (len (MapType0Select Heap@6 this@@15 elems)))) (and (< NoPerm FullPerm) (qpRange18 o_3@@14))) (= (loc (MapType0Select Heap@6 this@@15 elems) (invRecv18 o_3@@14)) o_3@@14)))
 :qid |stdinbpl.3219:22|
 :skolemid |176|
 :pattern ( (invRecv18 o_3@@14))
)) (forall ((o_3@@15 T@U) ) (!  (=> (= (type o_3@@15) RefType) (and (=> (and (and (<= 0 (invRecv18 o_3@@15)) (< (invRecv18 o_3@@15) (len (MapType0Select Heap@6 this@@15 elems)))) (and (< NoPerm FullPerm) (qpRange18 o_3@@15))) (and (= (loc (MapType0Select Heap@6 this@@15 elems) (invRecv18 o_3@@15)) o_3@@15) (= (U_2_real (MapType1Select QPMask@5 o_3@@15 val)) (- (U_2_real (MapType1Select Mask@22 o_3@@15 val)) FullPerm)))) (=> (not (and (and (<= 0 (invRecv18 o_3@@15)) (< (invRecv18 o_3@@15) (len (MapType0Select Heap@6 this@@15 elems)))) (and (< NoPerm FullPerm) (qpRange18 o_3@@15)))) (= (U_2_real (MapType1Select QPMask@5 o_3@@15 val)) (U_2_real (MapType1Select Mask@22 o_3@@15 val))))))
 :qid |stdinbpl.3225:22|
 :skolemid |177|
 :pattern ( (MapType1Select QPMask@5 o_3@@15 val))
))) (and (forall ((o_3@@16 T@U) (f_5@@4 T@U) ) (! (let ((B@@18 (FieldTypeInv1 (type f_5@@4))))
(let ((A@@19 (FieldTypeInv0 (type f_5@@4))))
 (=> (and (and (= (type o_3@@16) RefType) (= (type f_5@@4) (FieldType A@@19 B@@18))) (not (= f_5@@4 val))) (= (U_2_real (MapType1Select Mask@22 o_3@@16 f_5@@4)) (U_2_real (MapType1Select QPMask@5 o_3@@16 f_5@@4))))))
 :qid |stdinbpl.3231:29|
 :skolemid |178|
 :pattern ( (MapType1Select QPMask@5 o_3@@16 f_5@@4))
)) (= Mask@23 (MapType1Store QPMask@5 null (AList this@@15) (real_2_U (+ (U_2_real (MapType1Select QPMask@5 null (AList this@@15))) FullPerm)))))) (and (and (state Heap@6 Mask@23) (state Heap@6 Mask@23)) (and (|AList#trigger| Heap@6 (AList this@@15)) (= (MapType0Select Heap@6 null (AList this@@15)) (CombineFrames (FrameFragment (MapType0Select Heap@6 this@@15 elems)) (CombineFrames (FrameFragment (MapType0Select Heap@6 this@@15 size)) (FrameFragment (int_2_U (|AList#condqp1| Heap@6 this@@15))))))))) (and (=> (= (ControlFlow 0 38) 36) anon329_Then_correct) (=> (= (ControlFlow 0 38) 37) anon329_Else_correct)))))))))))))))))
(let ((anon328_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 46) 38)) anon206_correct)))
(let ((anon328_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 44) (- 0 45)) (<= FullPerm (U_2_real (MapType1Select Mask@21 this@@15 size)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@21 this@@15 size))) (=> (= (ControlFlow 0 44) 38) anon206_correct))))))
(let ((anon204_correct  (=> (= Mask@21 (MapType1Store QPMask@4 this@@15 elems (real_2_U (- (U_2_real (MapType1Select QPMask@4 this@@15 elems)) FullPerm)))) (and (=> (= (ControlFlow 0 47) 44) anon328_Then_correct) (=> (= (ControlFlow 0 47) 46) anon328_Else_correct)))))
(let ((anon327_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 50) 47)) anon204_correct)))
(let ((anon327_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 48) (- 0 49)) (<= FullPerm (U_2_real (MapType1Select QPMask@4 this@@15 elems)))) (=> (<= FullPerm (U_2_real (MapType1Select QPMask@4 this@@15 elems))) (=> (= (ControlFlow 0 48) 47) anon204_correct))))))
(let ((anon317_Else_correct  (=> (not (> t_1@1 j@0)) (=> (and (state ExhaleHeap@1 QPMask@2) (= perm@10 (/ (to_real 1) (to_real 2)))) (and (=> (= (ControlFlow 0 51) (- 0 59)) (>= perm@10 NoPerm)) (=> (>= perm@10 NoPerm) (=> (and (and (=> (> perm@10 NoPerm) (not (= this@@15 null))) (= Mask@18 (MapType1Store QPMask@2 this@@15 elems (real_2_U (+ (U_2_real (MapType1Select QPMask@2 this@@15 elems)) perm@10))))) (and (state ExhaleHeap@1 Mask@18) (= perm@11 (/ (to_real 1) (to_real 2))))) (and (=> (= (ControlFlow 0 51) (- 0 58)) (>= perm@11 NoPerm)) (=> (>= perm@11 NoPerm) (=> (and (and (=> (> perm@11 NoPerm) (not (= this@@15 null))) (= Mask@19 (MapType1Store Mask@18 this@@15 size (real_2_U (+ (U_2_real (MapType1Select Mask@18 this@@15 size)) perm@11))))) (and (state ExhaleHeap@1 Mask@19) (= perm@12 (/ (to_real 1) (to_real 2))))) (and (=> (= (ControlFlow 0 51) (- 0 57)) (>= perm@12 NoPerm)) (=> (>= perm@12 NoPerm) (=> (=> (> perm@12 NoPerm) (not (= (loc (MapType0Select ExhaleHeap@1 this@@15 elems) j@0) null))) (=> (and (and (and (= Mask@20 (MapType1Store Mask@19 (loc (MapType0Select ExhaleHeap@1 this@@15 elems) j@0) val (real_2_U (+ (U_2_real (MapType1Select Mask@19 (loc (MapType0Select ExhaleHeap@1 this@@15 elems) j@0) val)) perm@12)))) (state ExhaleHeap@1 Mask@20)) (and (<= j@0 t_1@1) (<= t_1@1 (U_2_int (MapType0Select ExhaleHeap@1 this@@15 size))))) (and (and (state ExhaleHeap@1 Mask@20) (= (U_2_int (MapType0Select ExhaleHeap@1 this@@15 size)) (length Heap@@19 this@@15))) (and (<= (- 0 1) j@0) (< (U_2_int (MapType0Select ExhaleHeap@1 this@@15 size)) (len (MapType0Select ExhaleHeap@1 this@@15 elems)))))) (and (=> (= (ControlFlow 0 51) (- 0 56)) (forall ((i_27 Int) (i_27_1 Int) ) (!  (=> (and (and (and (and (not (= i_27 i_27_1)) (and (< j@0 i_27) (<= i_27 (U_2_int (MapType0Select ExhaleHeap@1 this@@15 size))))) (and (< j@0 i_27_1) (<= i_27_1 (U_2_int (MapType0Select ExhaleHeap@1 this@@15 size))))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (loc (MapType0Select ExhaleHeap@1 this@@15 elems) i_27) (loc (MapType0Select ExhaleHeap@1 this@@15 elems) i_27_1))))
 :qid |stdinbpl.3109:17|
 :skolemid |165|
))) (=> (forall ((i_27@@0 Int) (i_27_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_27@@0 i_27_1@@0)) (and (< j@0 i_27@@0) (<= i_27@@0 (U_2_int (MapType0Select ExhaleHeap@1 this@@15 size))))) (and (< j@0 i_27_1@@0) (<= i_27_1@@0 (U_2_int (MapType0Select ExhaleHeap@1 this@@15 size))))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (loc (MapType0Select ExhaleHeap@1 this@@15 elems) i_27@@0) (loc (MapType0Select ExhaleHeap@1 this@@15 elems) i_27_1@@0))))
 :qid |stdinbpl.3109:17|
 :skolemid |165|
)) (=> (and (and (forall ((i_27@@1 Int) ) (!  (=> (and (and (< j@0 i_27@@1) (<= i_27@@1 (U_2_int (MapType0Select ExhaleHeap@1 this@@15 size)))) (< NoPerm FullPerm)) (and (qpRange17 (loc (MapType0Select ExhaleHeap@1 this@@15 elems) i_27@@1)) (= (invRecv17 (loc (MapType0Select ExhaleHeap@1 this@@15 elems) i_27@@1)) i_27@@1)))
 :qid |stdinbpl.3115:24|
 :skolemid |166|
 :pattern ( (loc (MapType0Select ExhaleHeap@1 this@@15 elems) i_27@@1))
 :pattern ( (loc (MapType0Select ExhaleHeap@1 this@@15 elems) i_27@@1))
)) (forall ((o_3@@17 T@U) ) (!  (=> (= (type o_3@@17) RefType) (=> (and (and (and (< j@0 (invRecv17 o_3@@17)) (<= (invRecv17 o_3@@17) (U_2_int (MapType0Select ExhaleHeap@1 this@@15 size)))) (< NoPerm FullPerm)) (qpRange17 o_3@@17)) (= (loc (MapType0Select ExhaleHeap@1 this@@15 elems) (invRecv17 o_3@@17)) o_3@@17)))
 :qid |stdinbpl.3119:24|
 :skolemid |167|
 :pattern ( (invRecv17 o_3@@17))
))) (and (forall ((i_27@@2 Int) ) (!  (=> (and (< j@0 i_27@@2) (<= i_27@@2 (U_2_int (MapType0Select ExhaleHeap@1 this@@15 size)))) (not (= (loc (MapType0Select ExhaleHeap@1 this@@15 elems) i_27@@2) null)))
 :qid |stdinbpl.3125:24|
 :skolemid |168|
 :pattern ( (loc (MapType0Select ExhaleHeap@1 this@@15 elems) i_27@@2))
 :pattern ( (loc (MapType0Select ExhaleHeap@1 this@@15 elems) i_27@@2))
)) (forall ((o_3@@18 T@U) ) (!  (=> (= (type o_3@@18) RefType) (and (=> (and (and (and (< j@0 (invRecv17 o_3@@18)) (<= (invRecv17 o_3@@18) (U_2_int (MapType0Select ExhaleHeap@1 this@@15 size)))) (< NoPerm FullPerm)) (qpRange17 o_3@@18)) (and (=> (< NoPerm FullPerm) (= (loc (MapType0Select ExhaleHeap@1 this@@15 elems) (invRecv17 o_3@@18)) o_3@@18)) (= (U_2_real (MapType1Select QPMask@4 o_3@@18 val)) (+ (U_2_real (MapType1Select Mask@20 o_3@@18 val)) FullPerm)))) (=> (not (and (and (and (< j@0 (invRecv17 o_3@@18)) (<= (invRecv17 o_3@@18) (U_2_int (MapType0Select ExhaleHeap@1 this@@15 size)))) (< NoPerm FullPerm)) (qpRange17 o_3@@18))) (= (U_2_real (MapType1Select QPMask@4 o_3@@18 val)) (U_2_real (MapType1Select Mask@20 o_3@@18 val))))))
 :qid |stdinbpl.3131:24|
 :skolemid |169|
 :pattern ( (MapType1Select QPMask@4 o_3@@18 val))
)))) (=> (and (and (and (forall ((o_3@@19 T@U) (f_5@@5 T@U) ) (! (let ((B@@19 (FieldTypeInv1 (type f_5@@5))))
(let ((A@@20 (FieldTypeInv0 (type f_5@@5))))
 (=> (and (and (= (type o_3@@19) RefType) (= (type f_5@@5) (FieldType A@@20 B@@19))) (not (= f_5@@5 val))) (= (U_2_real (MapType1Select Mask@20 o_3@@19 f_5@@5)) (U_2_real (MapType1Select QPMask@4 o_3@@19 f_5@@5))))))
 :qid |stdinbpl.3135:31|
 :skolemid |170|
 :pattern ( (MapType1Select Mask@20 o_3@@19 f_5@@5))
 :pattern ( (MapType1Select QPMask@4 o_3@@19 f_5@@5))
)) (state ExhaleHeap@1 QPMask@4)) (and (state ExhaleHeap@1 QPMask@4) (forall ((i_28 Int) ) (!  (=> (and (<= j@0 i_28) (<= i_28 (U_2_int (MapType0Select ExhaleHeap@1 this@@15 size)))) (=> (< i_28 t_1@1) (= (U_2_int (MapType0Select ExhaleHeap@1 (loc (MapType0Select ExhaleHeap@1 this@@15 elems) i_28) val)) (itemAt Heap@@19 this@@15 i_28))))
 :qid |stdinbpl.3142:22|
 :skolemid |171|
 :pattern ( (loc (MapType0Select ExhaleHeap@1 this@@15 elems) i_28))
)))) (and (and (state ExhaleHeap@1 QPMask@4) (forall ((i_29 Int) ) (!  (=> (and (< j@0 i_29) (<= i_29 (U_2_int (MapType0Select ExhaleHeap@1 this@@15 size)))) (=> (> i_29 t_1@1) (= (U_2_int (MapType0Select ExhaleHeap@1 (loc (MapType0Select ExhaleHeap@1 this@@15 elems) i_29) val)) (itemAt Heap@@19 this@@15 (- i_29 1)))))
 :qid |stdinbpl.3147:22|
 :skolemid |172|
 :pattern ( (loc (MapType0Select ExhaleHeap@1 this@@15 elems) i_29))
))) (and (state ExhaleHeap@1 QPMask@4) (state ExhaleHeap@1 QPMask@4)))) (and (=> (= (ControlFlow 0 51) (- 0 55)) (HasDirectPerm QPMask@4 this@@15 elems)) (=> (HasDirectPerm QPMask@4 this@@15 elems) (and (=> (= (ControlFlow 0 51) (- 0 54)) (= FullPerm (U_2_real (MapType1Select QPMask@4 (loc (MapType0Select ExhaleHeap@1 this@@15 elems) j@0) val)))) (=> (= FullPerm (U_2_real (MapType1Select QPMask@4 (loc (MapType0Select ExhaleHeap@1 this@@15 elems) j@0) val))) (=> (and (= Heap@5 (MapType0Store ExhaleHeap@1 (loc (MapType0Select ExhaleHeap@1 this@@15 elems) j@0) val (int_2_U elem))) (state Heap@5 QPMask@4)) (and (=> (= (ControlFlow 0 51) (- 0 53)) (HasDirectPerm QPMask@4 this@@15 size)) (=> (HasDirectPerm QPMask@4 this@@15 size) (and (=> (= (ControlFlow 0 51) (- 0 52)) (= FullPerm (U_2_real (MapType1Select QPMask@4 this@@15 size)))) (=> (= FullPerm (U_2_real (MapType1Select QPMask@4 this@@15 size))) (=> (and (= Heap@6 (MapType0Store Heap@5 this@@15 size (int_2_U (+ (U_2_int (MapType0Select Heap@5 this@@15 size)) 1)))) (state Heap@6 QPMask@4)) (and (=> (= (ControlFlow 0 51) 48) anon327_Then_correct) (=> (= (ControlFlow 0 51) 50) anon327_Else_correct))))))))))))))))))))))))))))))
(let ((anon296_Else_correct  (=> (and (forall ((i_12_1 Int) ) (!  (=> (and (< j@0 i_12_1) (<= i_12_1 (U_2_int (MapType0Select Heap@3 this@@15 size)))) (=> (> i_12_1 t_1@0) (= (U_2_int (MapType0Select Heap@3 (loc (MapType0Select Heap@3 this@@15 elems) i_12_1) val)) (itemAt Heap@@19 this@@15 (- i_12_1 1)))))
 :qid |stdinbpl.2662:24|
 :skolemid |140|
 :pattern ( (loc (MapType0Select Heap@3 this@@15 elems) i_12_1))
)) (IdenticalOnKnownLocations Heap@3 ExhaleHeap@1 QPMask@2)) (and (and (=> (= (ControlFlow 0 162) 155) anon299_Then_correct) (=> (= (ControlFlow 0 162) 95) anon317_Then_correct)) (=> (= (ControlFlow 0 162) 51) anon317_Else_correct)))))
(let ((anon151_correct true))
(let ((anon298_Else_correct  (=> (and (>= t_1@0 i_11_1) (= (ControlFlow 0 15) 11)) anon151_correct)))
(let ((anon298_Then_correct  (=> (> i_11_1 t_1@0) (and (=> (= (ControlFlow 0 13) (- 0 14)) (= (U_2_int (MapType0Select Heap@3 (loc (MapType0Select Heap@3 this@@15 elems) i_11_1) val)) (itemAt Heap@@19 this@@15 (- i_11_1 1)))) (=> (= (U_2_int (MapType0Select Heap@3 (loc (MapType0Select Heap@3 this@@15 elems) i_11_1) val)) (itemAt Heap@@19 this@@15 (- i_11_1 1))) (=> (= (ControlFlow 0 13) 11) anon151_correct))))))
(let ((anon297_Then_correct  (=> (and (< j@0 i_11_1) (<= i_11_1 (U_2_int (MapType0Select Heap@3 this@@15 size)))) (and (=> (= (ControlFlow 0 16) 13) anon298_Then_correct) (=> (= (ControlFlow 0 16) 15) anon298_Else_correct)))))
(let ((anon297_Else_correct  (=> (and (not (and (< j@0 i_11_1) (<= i_11_1 (U_2_int (MapType0Select Heap@3 this@@15 size))))) (= (ControlFlow 0 12) 11)) anon151_correct)))
(let ((anon293_Else_correct  (=> (forall ((i_10_1_1 Int) ) (!  (=> (and (<= j@0 i_10_1_1) (<= i_10_1_1 (U_2_int (MapType0Select Heap@3 this@@15 size)))) (=> (< i_10_1_1 t_1@0) (= (U_2_int (MapType0Select Heap@3 (loc (MapType0Select Heap@3 this@@15 elems) i_10_1_1) val)) (itemAt Heap@@19 this@@15 i_10_1_1))))
 :qid |stdinbpl.2649:24|
 :skolemid |139|
 :pattern ( (loc (MapType0Select Heap@3 this@@15 elems) i_10_1_1))
)) (and (and (=> (= (ControlFlow 0 163) 162) anon296_Else_correct) (=> (= (ControlFlow 0 163) 16) anon297_Then_correct)) (=> (= (ControlFlow 0 163) 12) anon297_Else_correct)))))
(let ((anon146_correct true))
(let ((anon295_Else_correct  (=> (and (<= t_1@0 i_9) (= (ControlFlow 0 9) 5)) anon146_correct)))
(let ((anon295_Then_correct  (=> (< i_9 t_1@0) (and (=> (= (ControlFlow 0 7) (- 0 8)) (= (U_2_int (MapType0Select Heap@3 (loc (MapType0Select Heap@3 this@@15 elems) i_9) val)) (itemAt Heap@@19 this@@15 i_9))) (=> (= (U_2_int (MapType0Select Heap@3 (loc (MapType0Select Heap@3 this@@15 elems) i_9) val)) (itemAt Heap@@19 this@@15 i_9)) (=> (= (ControlFlow 0 7) 5) anon146_correct))))))
(let ((anon294_Then_correct  (=> (and (<= j@0 i_9) (<= i_9 (U_2_int (MapType0Select Heap@3 this@@15 size)))) (and (=> (= (ControlFlow 0 10) 7) anon295_Then_correct) (=> (= (ControlFlow 0 10) 9) anon295_Else_correct)))))
(let ((anon294_Else_correct  (=> (and (not (and (<= j@0 i_9) (<= i_9 (U_2_int (MapType0Select Heap@3 this@@15 size))))) (= (ControlFlow 0 6) 5)) anon146_correct)))
(let ((anon142_correct  (=> (= Mask@11 (MapType1Store Mask@10 (loc (MapType0Select Heap@3 this@@15 elems) j@0) val (real_2_U (- (U_2_real (MapType1Select Mask@10 (loc (MapType0Select Heap@3 this@@15 elems) j@0) val)) perm@2)))) (and (=> (= (ControlFlow 0 164) (- 0 171)) (<= j@0 t_1@0)) (=> (<= j@0 t_1@0) (and (=> (= (ControlFlow 0 164) (- 0 170)) (<= t_1@0 (U_2_int (MapType0Select Heap@3 this@@15 size)))) (=> (<= t_1@0 (U_2_int (MapType0Select Heap@3 this@@15 size))) (and (=> (= (ControlFlow 0 164) (- 0 169)) (= (U_2_int (MapType0Select Heap@3 this@@15 size)) (length Heap@@19 this@@15))) (=> (= (U_2_int (MapType0Select Heap@3 this@@15 size)) (length Heap@@19 this@@15)) (and (=> (= (ControlFlow 0 164) (- 0 168)) (<= (- 0 1) j@0)) (=> (<= (- 0 1) j@0) (and (=> (= (ControlFlow 0 164) (- 0 167)) (< (U_2_int (MapType0Select Heap@3 this@@15 size)) (len (MapType0Select Heap@3 this@@15 elems)))) (=> (< (U_2_int (MapType0Select Heap@3 this@@15 size)) (len (MapType0Select Heap@3 this@@15 elems))) (and (=> (= (ControlFlow 0 164) (- 0 166)) (forall ((i_8 Int) (i_8_1 Int) ) (!  (=> (and (and (and (and (not (= i_8 i_8_1)) (and (< j@0 i_8) (<= i_8 (U_2_int (MapType0Select Heap@3 this@@15 size))))) (and (< j@0 i_8_1) (<= i_8_1 (U_2_int (MapType0Select Heap@3 this@@15 size))))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (loc (MapType0Select Heap@3 this@@15 elems) i_8) (loc (MapType0Select Heap@3 this@@15 elems) i_8_1))))
 :qid |stdinbpl.2606:21|
 :skolemid |133|
 :pattern ( (neverTriggered13 i_8) (neverTriggered13 i_8_1))
))) (=> (forall ((i_8@@0 Int) (i_8_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_8@@0 i_8_1@@0)) (and (< j@0 i_8@@0) (<= i_8@@0 (U_2_int (MapType0Select Heap@3 this@@15 size))))) (and (< j@0 i_8_1@@0) (<= i_8_1@@0 (U_2_int (MapType0Select Heap@3 this@@15 size))))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (loc (MapType0Select Heap@3 this@@15 elems) i_8@@0) (loc (MapType0Select Heap@3 this@@15 elems) i_8_1@@0))))
 :qid |stdinbpl.2606:21|
 :skolemid |133|
 :pattern ( (neverTriggered13 i_8@@0) (neverTriggered13 i_8_1@@0))
)) (and (=> (= (ControlFlow 0 164) (- 0 165)) (forall ((i_8@@1 Int) ) (!  (=> (and (< j@0 i_8@@1) (<= i_8@@1 (U_2_int (MapType0Select Heap@3 this@@15 size)))) (>= (U_2_real (MapType1Select Mask@11 (loc (MapType0Select Heap@3 this@@15 elems) i_8@@1) val)) FullPerm))
 :qid |stdinbpl.2613:21|
 :skolemid |134|
 :pattern ( (loc (MapType0Select Heap@3 this@@15 elems) i_8@@1))
 :pattern ( (loc (MapType0Select Heap@3 this@@15 elems) i_8@@1))
))) (=> (forall ((i_8@@2 Int) ) (!  (=> (and (< j@0 i_8@@2) (<= i_8@@2 (U_2_int (MapType0Select Heap@3 this@@15 size)))) (>= (U_2_real (MapType1Select Mask@11 (loc (MapType0Select Heap@3 this@@15 elems) i_8@@2) val)) FullPerm))
 :qid |stdinbpl.2613:21|
 :skolemid |134|
 :pattern ( (loc (MapType0Select Heap@3 this@@15 elems) i_8@@2))
 :pattern ( (loc (MapType0Select Heap@3 this@@15 elems) i_8@@2))
)) (=> (and (and (forall ((i_8@@3 Int) ) (!  (=> (and (and (< j@0 i_8@@3) (<= i_8@@3 (U_2_int (MapType0Select Heap@3 this@@15 size)))) (< NoPerm FullPerm)) (and (qpRange13 (loc (MapType0Select Heap@3 this@@15 elems) i_8@@3)) (= (invRecv13 (loc (MapType0Select Heap@3 this@@15 elems) i_8@@3)) i_8@@3)))
 :qid |stdinbpl.2619:26|
 :skolemid |135|
 :pattern ( (loc (MapType0Select Heap@3 this@@15 elems) i_8@@3))
 :pattern ( (loc (MapType0Select Heap@3 this@@15 elems) i_8@@3))
)) (forall ((o_3@@20 T@U) ) (!  (=> (= (type o_3@@20) RefType) (=> (and (and (< j@0 (invRecv13 o_3@@20)) (<= (invRecv13 o_3@@20) (U_2_int (MapType0Select Heap@3 this@@15 size)))) (and (< NoPerm FullPerm) (qpRange13 o_3@@20))) (= (loc (MapType0Select Heap@3 this@@15 elems) (invRecv13 o_3@@20)) o_3@@20)))
 :qid |stdinbpl.2623:26|
 :skolemid |136|
 :pattern ( (invRecv13 o_3@@20))
))) (and (forall ((o_3@@21 T@U) ) (!  (=> (= (type o_3@@21) RefType) (and (=> (and (and (< j@0 (invRecv13 o_3@@21)) (<= (invRecv13 o_3@@21) (U_2_int (MapType0Select Heap@3 this@@15 size)))) (and (< NoPerm FullPerm) (qpRange13 o_3@@21))) (and (= (loc (MapType0Select Heap@3 this@@15 elems) (invRecv13 o_3@@21)) o_3@@21) (= (U_2_real (MapType1Select QPMask@2 o_3@@21 val)) (- (U_2_real (MapType1Select Mask@11 o_3@@21 val)) FullPerm)))) (=> (not (and (and (< j@0 (invRecv13 o_3@@21)) (<= (invRecv13 o_3@@21) (U_2_int (MapType0Select Heap@3 this@@15 size)))) (and (< NoPerm FullPerm) (qpRange13 o_3@@21)))) (= (U_2_real (MapType1Select QPMask@2 o_3@@21 val)) (U_2_real (MapType1Select Mask@11 o_3@@21 val))))))
 :qid |stdinbpl.2629:26|
 :skolemid |137|
 :pattern ( (MapType1Select QPMask@2 o_3@@21 val))
)) (forall ((o_3@@22 T@U) (f_5@@6 T@U) ) (! (let ((B@@20 (FieldTypeInv1 (type f_5@@6))))
(let ((A@@21 (FieldTypeInv0 (type f_5@@6))))
 (=> (and (and (= (type o_3@@22) RefType) (= (type f_5@@6) (FieldType A@@21 B@@20))) (not (= f_5@@6 val))) (= (U_2_real (MapType1Select Mask@11 o_3@@22 f_5@@6)) (U_2_real (MapType1Select QPMask@2 o_3@@22 f_5@@6))))))
 :qid |stdinbpl.2635:33|
 :skolemid |138|
 :pattern ( (MapType1Select QPMask@2 o_3@@22 f_5@@6))
)))) (and (and (=> (= (ControlFlow 0 164) 163) anon293_Else_correct) (=> (= (ControlFlow 0 164) 10) anon294_Then_correct)) (=> (= (ControlFlow 0 164) 6) anon294_Else_correct))))))))))))))))))))
(let ((anon292_Else_correct  (=> (and (= perm@2 NoPerm) (= (ControlFlow 0 174) 164)) anon142_correct)))
(let ((anon292_Then_correct  (=> (not (= perm@2 NoPerm)) (and (=> (= (ControlFlow 0 172) (- 0 173)) (<= perm@2 (U_2_real (MapType1Select Mask@10 (loc (MapType0Select Heap@3 this@@15 elems) j@0) val)))) (=> (<= perm@2 (U_2_real (MapType1Select Mask@10 (loc (MapType0Select Heap@3 this@@15 elems) j@0) val))) (=> (= (ControlFlow 0 172) 164) anon142_correct))))))
(let ((anon140_correct  (=> (and (= Mask@10 (MapType1Store Mask@9 this@@15 size (real_2_U (- (U_2_real (MapType1Select Mask@9 this@@15 size)) perm@1)))) (= perm@2 (/ (to_real 1) (to_real 2)))) (and (=> (= (ControlFlow 0 175) (- 0 176)) (>= perm@2 NoPerm)) (=> (>= perm@2 NoPerm) (and (=> (= (ControlFlow 0 175) 172) anon292_Then_correct) (=> (= (ControlFlow 0 175) 174) anon292_Else_correct)))))))
(let ((anon291_Else_correct  (=> (and (= perm@1 NoPerm) (= (ControlFlow 0 179) 175)) anon140_correct)))
(let ((anon291_Then_correct  (=> (not (= perm@1 NoPerm)) (and (=> (= (ControlFlow 0 177) (- 0 178)) (<= perm@1 (U_2_real (MapType1Select Mask@9 this@@15 size)))) (=> (<= perm@1 (U_2_real (MapType1Select Mask@9 this@@15 size))) (=> (= (ControlFlow 0 177) 175) anon140_correct))))))
(let ((anon138_correct  (=> (and (= Mask@9 (MapType1Store Mask@8 this@@15 elems (real_2_U (- (U_2_real (MapType1Select Mask@8 this@@15 elems)) perm@0)))) (= perm@1 (/ (to_real 1) (to_real 2)))) (and (=> (= (ControlFlow 0 180) (- 0 181)) (>= perm@1 NoPerm)) (=> (>= perm@1 NoPerm) (and (=> (= (ControlFlow 0 180) 177) anon291_Then_correct) (=> (= (ControlFlow 0 180) 179) anon291_Else_correct)))))))
(let ((anon290_Else_correct  (=> (and (= perm@0 NoPerm) (= (ControlFlow 0 184) 180)) anon138_correct)))
(let ((anon290_Then_correct  (=> (not (= perm@0 NoPerm)) (and (=> (= (ControlFlow 0 182) (- 0 183)) (<= perm@0 (U_2_real (MapType1Select Mask@8 this@@15 elems)))) (=> (<= perm@0 (U_2_real (MapType1Select Mask@8 this@@15 elems))) (=> (= (ControlFlow 0 182) 180) anon138_correct))))))
(let ((anon136_correct  (=> (state Heap@3 Mask@8) (and (=> (= (ControlFlow 0 185) (- 0 187)) (HasDirectPerm Mask@8 this@@15 size)) (=> (HasDirectPerm Mask@8 this@@15 size) (=> (= t_1@0 (U_2_int (MapType0Select Heap@3 this@@15 size))) (=> (and (state Heap@3 Mask@8) (= perm@0 (/ (to_real 1) (to_real 2)))) (and (=> (= (ControlFlow 0 185) (- 0 186)) (>= perm@0 NoPerm)) (=> (>= perm@0 NoPerm) (and (=> (= (ControlFlow 0 185) 182) anon290_Then_correct) (=> (= (ControlFlow 0 185) 184) anon290_Else_correct)))))))))))
(let ((anon287_Else_correct  (=> (forall ((i_7_1 Int) ) (!  (=> (and (<= 0 i_7_1) (< i_7_1 (len (MapType0Select Heap@1 this@@15 elems)))) (= (U_2_int (MapType0Select Heap@1 (loc a_3@@1 i_7_1) val)) (U_2_int (MapType0Select Heap@1 (loc (MapType0Select Heap@1 this@@15 elems) i_7_1) val))))
 :qid |stdinbpl.2535:24|
 :skolemid |132|
 :pattern ( (MapType0Select Heap@1 (loc a_3@@1 i_7_1) val))
)) (=> (and (state Heap@1 QPMask@1) (state Heap@1 QPMask@1)) (and (=> (= (ControlFlow 0 190) (- 0 191)) (= FullPerm (U_2_real (MapType1Select QPMask@1 this@@15 elems)))) (=> (= FullPerm (U_2_real (MapType1Select QPMask@1 this@@15 elems))) (=> (= Heap@2 (MapType0Store Heap@1 this@@15 elems a_3@@1)) (=> (and (and (state Heap@2 QPMask@1) (= Mask@8 QPMask@1)) (and (= Heap@3 Heap@2) (= (ControlFlow 0 190) 185))) anon136_correct))))))))
(let ((anon286_Else_correct  (and (=> (= (ControlFlow 0 201) (- 0 202)) (forall ((i_5 Int) (i_5_1 Int) ) (!  (=> (and (and (and (and (not (= i_5 i_5_1)) (and (<= 0 i_5) (< i_5 (len a_3@@1)))) (and (<= 0 i_5_1) (< i_5_1 (len a_3@@1)))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (loc a_3@@1 i_5) (loc a_3@@1 i_5_1))))
 :qid |stdinbpl.2479:19|
 :skolemid |126|
))) (=> (forall ((i_5@@0 Int) (i_5_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_5@@0 i_5_1@@0)) (and (<= 0 i_5@@0) (< i_5@@0 (len a_3@@1)))) (and (<= 0 i_5_1@@0) (< i_5_1@@0 (len a_3@@1)))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (loc a_3@@1 i_5@@0) (loc a_3@@1 i_5_1@@0))))
 :qid |stdinbpl.2479:19|
 :skolemid |126|
)) (=> (and (and (and (forall ((i_5@@1 Int) ) (!  (=> (and (and (<= 0 i_5@@1) (< i_5@@1 (len a_3@@1))) (< NoPerm FullPerm)) (and (qpRange12 (loc a_3@@1 i_5@@1)) (= (invRecv12 (loc a_3@@1 i_5@@1)) i_5@@1)))
 :qid |stdinbpl.2485:26|
 :skolemid |127|
 :pattern ( (loc a_3@@1 i_5@@1))
 :pattern ( (loc a_3@@1 i_5@@1))
)) (forall ((o_3@@23 T@U) ) (!  (=> (= (type o_3@@23) RefType) (=> (and (and (and (<= 0 (invRecv12 o_3@@23)) (< (invRecv12 o_3@@23) (len a_3@@1))) (< NoPerm FullPerm)) (qpRange12 o_3@@23)) (= (loc a_3@@1 (invRecv12 o_3@@23)) o_3@@23)))
 :qid |stdinbpl.2489:26|
 :skolemid |128|
 :pattern ( (invRecv12 o_3@@23))
))) (and (forall ((i_5@@2 Int) ) (!  (=> (and (<= 0 i_5@@2) (< i_5@@2 (len a_3@@1))) (not (= (loc a_3@@1 i_5@@2) null)))
 :qid |stdinbpl.2495:26|
 :skolemid |129|
 :pattern ( (loc a_3@@1 i_5@@2))
 :pattern ( (loc a_3@@1 i_5@@2))
)) (forall ((o_3@@24 T@U) ) (!  (=> (= (type o_3@@24) RefType) (and (=> (and (and (and (<= 0 (invRecv12 o_3@@24)) (< (invRecv12 o_3@@24) (len a_3@@1))) (< NoPerm FullPerm)) (qpRange12 o_3@@24)) (and (=> (< NoPerm FullPerm) (= (loc a_3@@1 (invRecv12 o_3@@24)) o_3@@24)) (= (U_2_real (MapType1Select QPMask@1 o_3@@24 val)) (+ (U_2_real (MapType1Select QPMask@0 o_3@@24 val)) FullPerm)))) (=> (not (and (and (and (<= 0 (invRecv12 o_3@@24)) (< (invRecv12 o_3@@24) (len a_3@@1))) (< NoPerm FullPerm)) (qpRange12 o_3@@24))) (= (U_2_real (MapType1Select QPMask@1 o_3@@24 val)) (U_2_real (MapType1Select QPMask@0 o_3@@24 val))))))
 :qid |stdinbpl.2501:26|
 :skolemid |130|
 :pattern ( (MapType1Select QPMask@1 o_3@@24 val))
)))) (and (and (forall ((o_3@@25 T@U) (f_5@@7 T@U) ) (! (let ((B@@21 (FieldTypeInv1 (type f_5@@7))))
(let ((A@@22 (FieldTypeInv0 (type f_5@@7))))
 (=> (and (and (= (type o_3@@25) RefType) (= (type f_5@@7) (FieldType A@@22 B@@21))) (not (= f_5@@7 val))) (= (U_2_real (MapType1Select QPMask@0 o_3@@25 f_5@@7)) (U_2_real (MapType1Select QPMask@1 o_3@@25 f_5@@7))))))
 :qid |stdinbpl.2505:33|
 :skolemid |131|
 :pattern ( (MapType1Select QPMask@0 o_3@@25 f_5@@7))
 :pattern ( (MapType1Select QPMask@1 o_3@@25 f_5@@7))
)) (state Heap@1 QPMask@1)) (and (state Heap@1 QPMask@1) (state Heap@1 QPMask@1)))) (and (and (=> (= (ControlFlow 0 201) 190) anon287_Else_correct) (=> (= (ControlFlow 0 201) 198) anon288_Then_correct)) (=> (= (ControlFlow 0 201) 200) anon288_Else_correct)))))))
(let ((anon285_Then_correct  (=> (= (U_2_int (MapType0Select Heap@1 this@@15 size)) (len (MapType0Select Heap@1 this@@15 elems))) (and (=> (= (ControlFlow 0 203) (- 0 204)) (HasDirectPerm QPMask@0 this@@15 elems)) (=> (HasDirectPerm QPMask@0 this@@15 elems) (=> (= (len a_3@@1) (* (len (MapType0Select Heap@1 this@@15 elems)) 2)) (and (=> (= (ControlFlow 0 203) 189) anon286_Then_correct) (=> (= (ControlFlow 0 203) 201) anon286_Else_correct))))))))
(let ((anon285_Else_correct  (=> (and (and (not (= (U_2_int (MapType0Select Heap@1 this@@15 size)) (len (MapType0Select Heap@1 this@@15 elems)))) (= Mask@8 QPMask@0)) (and (= Heap@3 Heap@1) (= (ControlFlow 0 188) 185))) anon136_correct)))
(let ((anon126_correct  (=> (not (= this@@15 null)) (=> (and (and (and (= Mask@6 (MapType1Store Mask@5 this@@15 elems (real_2_U (+ (U_2_real (MapType1Select Mask@5 this@@15 elems)) FullPerm)))) (state Heap@1 Mask@6)) (and (not (= this@@15 null)) (= Mask@7 (MapType1Store Mask@6 this@@15 size (real_2_U (+ (U_2_real (MapType1Select Mask@6 this@@15 size)) FullPerm)))))) (and (and (state Heap@1 Mask@7) (<= 0 (U_2_int (MapType0Select Heap@1 this@@15 size)))) (and (<= (U_2_int (MapType0Select Heap@1 this@@15 size)) (len (MapType0Select Heap@1 this@@15 elems))) (< 0 (len (MapType0Select Heap@1 this@@15 elems)))))) (and (=> (= (ControlFlow 0 205) (- 0 208)) (forall ((i_3 Int) (i_3_2 Int) ) (!  (=> (and (and (and (and (not (= i_3 i_3_2)) (and (<= 0 i_3) (< i_3 (len (MapType0Select Heap@1 this@@15 elems))))) (and (<= 0 i_3_2) (< i_3_2 (len (MapType0Select Heap@1 this@@15 elems))))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (loc (MapType0Select Heap@1 this@@15 elems) i_3) (loc (MapType0Select Heap@1 this@@15 elems) i_3_2))))
 :qid |stdinbpl.2419:15|
 :skolemid |120|
))) (=> (forall ((i_3@@0 Int) (i_3_2@@0 Int) ) (!  (=> (and (and (and (and (not (= i_3@@0 i_3_2@@0)) (and (<= 0 i_3@@0) (< i_3@@0 (len (MapType0Select Heap@1 this@@15 elems))))) (and (<= 0 i_3_2@@0) (< i_3_2@@0 (len (MapType0Select Heap@1 this@@15 elems))))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (loc (MapType0Select Heap@1 this@@15 elems) i_3@@0) (loc (MapType0Select Heap@1 this@@15 elems) i_3_2@@0))))
 :qid |stdinbpl.2419:15|
 :skolemid |120|
)) (=> (and (and (and (forall ((i_3@@1 Int) ) (!  (=> (and (and (<= 0 i_3@@1) (< i_3@@1 (len (MapType0Select Heap@1 this@@15 elems)))) (< NoPerm FullPerm)) (and (qpRange11 (loc (MapType0Select Heap@1 this@@15 elems) i_3@@1)) (= (invRecv11 (loc (MapType0Select Heap@1 this@@15 elems) i_3@@1)) i_3@@1)))
 :qid |stdinbpl.2425:22|
 :skolemid |121|
 :pattern ( (loc (MapType0Select Heap@1 this@@15 elems) i_3@@1))
 :pattern ( (loc (MapType0Select Heap@1 this@@15 elems) i_3@@1))
)) (forall ((o_3@@26 T@U) ) (!  (=> (= (type o_3@@26) RefType) (=> (and (and (and (<= 0 (invRecv11 o_3@@26)) (< (invRecv11 o_3@@26) (len (MapType0Select Heap@1 this@@15 elems)))) (< NoPerm FullPerm)) (qpRange11 o_3@@26)) (= (loc (MapType0Select Heap@1 this@@15 elems) (invRecv11 o_3@@26)) o_3@@26)))
 :qid |stdinbpl.2429:22|
 :skolemid |122|
 :pattern ( (invRecv11 o_3@@26))
))) (and (forall ((i_3@@2 Int) ) (!  (=> (and (<= 0 i_3@@2) (< i_3@@2 (len (MapType0Select Heap@1 this@@15 elems)))) (not (= (loc (MapType0Select Heap@1 this@@15 elems) i_3@@2) null)))
 :qid |stdinbpl.2435:22|
 :skolemid |123|
 :pattern ( (loc (MapType0Select Heap@1 this@@15 elems) i_3@@2))
 :pattern ( (loc (MapType0Select Heap@1 this@@15 elems) i_3@@2))
)) (forall ((o_3@@27 T@U) ) (!  (=> (= (type o_3@@27) RefType) (and (=> (and (and (and (<= 0 (invRecv11 o_3@@27)) (< (invRecv11 o_3@@27) (len (MapType0Select Heap@1 this@@15 elems)))) (< NoPerm FullPerm)) (qpRange11 o_3@@27)) (and (=> (< NoPerm FullPerm) (= (loc (MapType0Select Heap@1 this@@15 elems) (invRecv11 o_3@@27)) o_3@@27)) (= (U_2_real (MapType1Select QPMask@0 o_3@@27 val)) (+ (U_2_real (MapType1Select Mask@7 o_3@@27 val)) FullPerm)))) (=> (not (and (and (and (<= 0 (invRecv11 o_3@@27)) (< (invRecv11 o_3@@27) (len (MapType0Select Heap@1 this@@15 elems)))) (< NoPerm FullPerm)) (qpRange11 o_3@@27))) (= (U_2_real (MapType1Select QPMask@0 o_3@@27 val)) (U_2_real (MapType1Select Mask@7 o_3@@27 val))))))
 :qid |stdinbpl.2441:22|
 :skolemid |124|
 :pattern ( (MapType1Select QPMask@0 o_3@@27 val))
)))) (and (and (forall ((o_3@@28 T@U) (f_5@@8 T@U) ) (! (let ((B@@22 (FieldTypeInv1 (type f_5@@8))))
(let ((A@@23 (FieldTypeInv0 (type f_5@@8))))
 (=> (and (and (= (type o_3@@28) RefType) (= (type f_5@@8) (FieldType A@@23 B@@22))) (not (= f_5@@8 val))) (= (U_2_real (MapType1Select Mask@7 o_3@@28 f_5@@8)) (U_2_real (MapType1Select QPMask@0 o_3@@28 f_5@@8))))))
 :qid |stdinbpl.2445:29|
 :skolemid |125|
 :pattern ( (MapType1Select Mask@7 o_3@@28 f_5@@8))
 :pattern ( (MapType1Select QPMask@0 o_3@@28 f_5@@8))
)) (state Heap@1 QPMask@0)) (and (state Heap@1 QPMask@0) (state Heap@1 QPMask@0)))) (and (=> (= (ControlFlow 0 205) (- 0 207)) (HasDirectPerm QPMask@0 this@@15 size)) (=> (HasDirectPerm QPMask@0 this@@15 size) (and (=> (= (ControlFlow 0 205) (- 0 206)) (HasDirectPerm QPMask@0 this@@15 elems)) (=> (HasDirectPerm QPMask@0 this@@15 elems) (and (=> (= (ControlFlow 0 205) 203) anon285_Then_correct) (=> (= (ControlFlow 0 205) 188) anon285_Else_correct)))))))))))))
(let ((anon284_Else_correct  (=> (HasDirectPerm Mask@5 null (AList this@@15)) (=> (and (= Heap@1 ExhaleHeap@0) (= (ControlFlow 0 210) 205)) anon126_correct))))
(let ((anon284_Then_correct  (=> (and (and (not (HasDirectPerm Mask@5 null (AList this@@15))) (= Heap@0 (MapType0Store ExhaleHeap@0 null (AList this@@15) newVersion@0))) (and (= Heap@1 Heap@0) (= (ControlFlow 0 209) 205))) anon126_correct)))
(let ((anon124_correct  (=> (= Mask@5 (MapType1Store Mask@4 null (AList this@@15) (real_2_U (- (U_2_real (MapType1Select Mask@4 null (AList this@@15))) FullPerm)))) (and (=> (= (ControlFlow 0 211) 209) anon284_Then_correct) (=> (= (ControlFlow 0 211) 210) anon284_Else_correct)))))
(let ((anon283_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 214) 211)) anon124_correct)))
(let ((anon283_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 212) (- 0 213)) (<= FullPerm (U_2_real (MapType1Select Mask@4 null (AList this@@15))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@4 null (AList this@@15)))) (=> (= (ControlFlow 0 212) 211) anon124_correct))))))
(let ((anon122_correct  (=> (and (and (and (state ExhaleHeap@0 Mask@4) (= (length ExhaleHeap@0 this@@15) (length Heap@@19 this@@15))) (and (state ExhaleHeap@0 Mask@4) (forall ((k_15 Int) ) (!  (=> (and (<= 0 k_15) (< k_15 (length ExhaleHeap@0 this@@15))) (= (itemAt ExhaleHeap@0 this@@15 k_15) (itemAt Heap@@19 this@@15 k_15)))
 :qid |stdinbpl.2382:22|
 :skolemid |119|
 :pattern ( (|itemAt#frame| (MapType0Select Heap@@19 null (AList this@@15)) this@@15 k_15))
)))) (and (and (state ExhaleHeap@0 Mask@4) (state ExhaleHeap@0 Mask@4)) (and (|AList#trigger| ExhaleHeap@0 (AList this@@15)) (= (MapType0Select ExhaleHeap@0 null (AList this@@15)) (CombineFrames (FrameFragment (MapType0Select ExhaleHeap@0 this@@15 elems)) (CombineFrames (FrameFragment (MapType0Select ExhaleHeap@0 this@@15 size)) (FrameFragment (int_2_U (|AList#condqp1| ExhaleHeap@0 this@@15))))))))) (and (=> (= (ControlFlow 0 215) 212) anon283_Then_correct) (=> (= (ControlFlow 0 215) 214) anon283_Else_correct)))))
(let ((anon282_Else_correct  (=> (and (>= 0 j@0) (= (ControlFlow 0 217) 215)) anon122_correct)))
(let ((anon282_Then_correct  (=> (and (and (> j@0 0) (state ExhaleHeap@0 Mask@4)) (and (<= (itemAt ExhaleHeap@0 this@@15 (- j@0 1)) elem) (= (ControlFlow 0 216) 215))) anon122_correct)))
(let ((anon266_Else_correct  (=> (not (and (< j@0 (length ExhaleHeap@0 this@@15)) (< (itemAt ExhaleHeap@0 this@@15 j@0) elem))) (=> (and (state ExhaleHeap@0 Mask@1) (= Mask@4 (MapType1Store Mask@1 null (AList this@@15) (real_2_U (+ (U_2_real (MapType1Select Mask@1 null (AList this@@15))) FullPerm))))) (=> (and (and (state ExhaleHeap@0 Mask@4) (<= 0 j@0)) (and (state ExhaleHeap@0 Mask@4) (<= j@0 (length ExhaleHeap@0 this@@15)))) (and (=> (= (ControlFlow 0 218) 216) anon282_Then_correct) (=> (= (ControlFlow 0 218) 217) anon282_Else_correct)))))))
(let ((anon245_Else_correct  (=> (and (forall ((k_9_1 Int) ) (!  (=> (and (<= 0 k_9_1) (< k_9_1 (length Heap@@19 this@@15))) (= (itemAt Heap@@19 this@@15 k_9_1) (itemAt Heap@@19 this@@15 k_9_1)))
 :qid |stdinbpl.1920:24|
 :skolemid |101|
 :pattern ( (|itemAt#frame| (MapType0Select Heap@@19 null (AList this@@15)) this@@15 k_9_1))
)) (IdenticalOnKnownLocations Heap@@19 ExhaleHeap@0 Mask@1)) (and (and (=> (= (ControlFlow 0 323) 322) anon247_Then_correct) (=> (= (ControlFlow 0 323) 275) anon266_Then_correct)) (=> (= (ControlFlow 0 323) 218) anon266_Else_correct)))))
(let ((anon52_correct true))
(let ((anon246_Else_correct  (=> (and (not (and (<= 0 k_8) (< k_8 (length Heap@@19 this@@15)))) (= (ControlFlow 0 4) 1)) anon52_correct)))
(let ((anon246_Then_correct  (=> (and (<= 0 k_8) (< k_8 (length Heap@@19 this@@15))) (and (=> (= (ControlFlow 0 2) (- 0 3)) (= (itemAt Heap@@19 this@@15 k_8) (itemAt Heap@@19 this@@15 k_8))) (=> (= (itemAt Heap@@19 this@@15 k_8) (itemAt Heap@@19 this@@15 k_8)) (=> (= (ControlFlow 0 2) 1) anon52_correct))))))
(let ((anon49_correct  (and (=> (= (ControlFlow 0 324) (- 0 325)) (= (length Heap@@19 this@@15) (length Heap@@19 this@@15))) (=> (= (length Heap@@19 this@@15) (length Heap@@19 this@@15)) (and (and (=> (= (ControlFlow 0 324) 323) anon245_Else_correct) (=> (= (ControlFlow 0 324) 2) anon246_Then_correct)) (=> (= (ControlFlow 0 324) 4) anon246_Else_correct))))))
(let ((anon244_Else_correct  (=> (and (>= 0 0) (= (ControlFlow 0 328) 324)) anon49_correct)))
(let ((anon244_Then_correct  (=> (> 0 0) (and (=> (= (ControlFlow 0 326) (- 0 327)) (<= (itemAt Heap@@19 this@@15 (- 0 1)) elem)) (=> (<= (itemAt Heap@@19 this@@15 (- 0 1)) elem) (=> (= (ControlFlow 0 326) 324) anon49_correct))))))
(let ((anon47_correct  (=> (= Mask@1 (MapType1Store Mask@0 null (AList this@@15) (real_2_U (- (U_2_real (MapType1Select Mask@0 null (AList this@@15))) FullPerm)))) (and (=> (= (ControlFlow 0 329) (- 0 331)) (<= 0 0)) (=> (<= 0 0) (and (=> (= (ControlFlow 0 329) (- 0 330)) (<= 0 (length Heap@@19 this@@15))) (=> (<= 0 (length Heap@@19 this@@15)) (and (=> (= (ControlFlow 0 329) 326) anon244_Then_correct) (=> (= (ControlFlow 0 329) 328) anon244_Else_correct)))))))))
(let ((anon243_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 334) 329)) anon47_correct)))
(let ((anon243_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 332) (- 0 333)) (<= FullPerm (U_2_real (MapType1Select Mask@0 null (AList this@@15))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@0 null (AList this@@15)))) (=> (= (ControlFlow 0 332) 329) anon47_correct))))))
(let ((anon219_Else_correct  (=> (state Heap@@19 Mask@0) (and (=> (= (ControlFlow 0 335) 332) anon243_Then_correct) (=> (= (ControlFlow 0 335) 334) anon243_Else_correct)))))
(let ((anon0_correct  (=> (and (state Heap@@19 ZeroMask) (= AssumeFunctionsAbove (- 0 1))) (=> (and (and (U_2_bool (MapType0Select Heap@@19 this@@15 $allocated)) (= Mask@0 (MapType1Store ZeroMask null (AList this@@15) (real_2_U (+ (U_2_real (MapType1Select ZeroMask null (AList this@@15))) FullPerm))))) (and (state Heap@@19 Mask@0) (state Heap@@19 Mask@0))) (and (=> (= (ControlFlow 0 396) 395) anon219_Then_correct) (=> (= (ControlFlow 0 396) 335) anon219_Else_correct))))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 397) 396) anon0_correct)))
PreconditionGeneratedEntry_correct)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
))
(check-sat)
(pop 1)
; Valid
(get-info :rlimit)
