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
(declare-fun Mask@9 () T@U)
(declare-fun Mask@0 () T@U)
(declare-fun this@@15 () T@U)
(declare-fun Heap@@19 () T@U)
(declare-fun PostMask@1 () T@U)
(declare-fun PostMask@0 () T@U)
(declare-fun PostHeap@0 () T@U)
(declare-fun i_12 () Int)
(declare-fun PostMask@2 () T@U)
(declare-fun elem () Int)
(declare-fun PostMask@3 () T@U)
(declare-fun i_13 () Int)
(declare-fun Heap@1 () T@U)
(declare-fun QPMask@1 () T@U)
(declare-fun a_3@@1 () T@U)
(declare-fun i_2 () Int)
(declare-fun Heap@11 () T@U)
(declare-fun Mask@8 () T@U)
(declare-fun Mask@7 () T@U)
(declare-fun Heap@9 () T@U)
(declare-fun Heap@8 () T@U)
(declare-fun Heap@10 () T@U)
(declare-fun newPMask@0 () T@U)
(declare-fun Heap@5 () T@U)
(declare-fun Heap@6 () T@U)
(declare-fun Heap@7 () T@U)
(declare-fun freshVersion@0 () T@U)
(declare-fun Mask@6 () T@U)
(declare-fun Mask@5 () T@U)
(declare-fun neverTriggered8 (Int) Bool)
(declare-fun qpRange8 (T@U) Bool)
(declare-fun invRecv8 (T@U) Int)
(declare-fun QPMask@2 () T@U)
(declare-fun CombineFrames (T@U T@U) T@U)
(declare-fun FrameFragment (T@U) T@U)
(declare-fun Mask@4 () T@U)
(declare-fun Heap@3 () T@U)
(declare-fun Heap@4 () T@U)
(declare-fun Heap@2 () T@U)
(declare-fun qpRange7 (T@U) Bool)
(declare-fun invRecv7 (T@U) Int)
(declare-fun QPMask@0 () T@U)
(declare-fun Mask@2 () T@U)
(declare-fun Mask@1 () T@U)
(declare-fun Mask@3 () T@U)
(declare-fun qpRange6 (T@U) Bool)
(declare-fun invRecv6 (T@U) Int)
(declare-fun Heap@0 () T@U)
(declare-fun newVersion@0 () T@U)
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (= (type Mask@0) (MapType1Type RefType realType)) (= (type this@@15) RefType)) (= (type Heap@@19) (MapType0Type RefType))) (= (type Heap@11) (MapType0Type RefType))) (= (type Mask@8) (MapType1Type RefType realType))) (= (type Mask@7) (MapType1Type RefType realType))) (= (type Heap@9) (MapType0Type RefType))) (= (type Heap@8) (MapType0Type RefType))) (= (type Heap@10) (MapType0Type RefType))) (= (type newPMask@0) (MapType1Type RefType boolType))) (= (type Heap@6) (MapType0Type RefType))) (= (type Heap@5) (MapType0Type RefType))) (= (type Heap@7) (MapType0Type RefType))) (= (type freshVersion@0) FrameTypeType)) (= (type Mask@6) (MapType1Type RefType realType))) (= (type Mask@5) (MapType1Type RefType realType))) (= (type QPMask@2) (MapType1Type RefType realType))) (forall ((arg0@@35 T@U) (arg1@@14 T@U) ) (! (= (type (CombineFrames arg0@@35 arg1@@14)) FrameTypeType)
 :qid |funType:CombineFrames|
 :pattern ( (CombineFrames arg0@@35 arg1@@14))
))) (forall ((arg0@@36 T@U) ) (! (= (type (FrameFragment arg0@@36)) FrameTypeType)
 :qid |funType:FrameFragment|
 :pattern ( (FrameFragment arg0@@36))
))) (= (type Mask@4) (MapType1Type RefType realType))) (= (type Heap@3) (MapType0Type RefType))) (= (type Heap@4) (MapType0Type RefType))) (= (type Heap@1) (MapType0Type RefType))) (= (type QPMask@0) (MapType1Type RefType realType))) (= (type a_3@@1) ArrayDomainTypeType)) (= (type QPMask@1) (MapType1Type RefType realType))) (= (type Heap@2) (MapType0Type RefType))) (= (type Mask@2) (MapType1Type RefType realType))) (= (type Mask@1) (MapType1Type RefType realType))) (= (type Mask@3) (MapType1Type RefType realType))) (= (type Heap@0) (MapType0Type RefType))) (= (type newVersion@0) FrameTypeType)) (= (type PostMask@0) (MapType1Type RefType realType))) (= (type PostMask@3) (MapType1Type RefType realType))) (= (type PostHeap@0) (MapType0Type RefType))) (= (type PostMask@2) (MapType1Type RefType realType))) (= (type PostMask@1) (MapType1Type RefType realType))) (= (type Mask@9) (MapType1Type RefType realType))))
(set-info :boogie-vc-id addAtEnd)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 136) (let ((anon12_correct  (=> (= Mask@9 (MapType1Store Mask@0 null (AList this@@15) (real_2_U (- (U_2_real (MapType1Select Mask@0 null (AList this@@15))) FullPerm)))) (and (=> (= (ControlFlow 0 129) (- 0 130)) (<= 0 (- (length Heap@@19 this@@15) 1))) (=> (<= 0 (- (length Heap@@19 this@@15) 1)) (=> (= (ControlFlow 0 129) (- 0 128)) (< (- (length Heap@@19 this@@15) 1) (length Heap@@19 this@@15))))))))
(let ((anon89_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 133) 129)) anon12_correct)))
(let ((anon89_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 131) (- 0 132)) (<= FullPerm (U_2_real (MapType1Select Mask@0 null (AList this@@15))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@0 null (AList this@@15)))) (=> (= (ControlFlow 0 131) 129) anon12_correct))))))
(let ((anon8_correct true))
(let ((anon87_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 127) 124)) anon8_correct)))
(let ((anon87_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 125) (- 0 126)) (<= FullPerm (U_2_real (MapType1Select Mask@0 null (AList this@@15))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@0 null (AList this@@15)))) (=> (= (ControlFlow 0 125) 124) anon8_correct))))))
(let ((anon54_correct  (=> (= PostMask@1 (MapType1Store PostMask@0 null (AList this@@15) (real_2_U (- (U_2_real (MapType1Select PostMask@0 null (AList this@@15))) FullPerm)))) (and (=> (= (ControlFlow 0 112) (- 0 113)) (<= 0 (length Heap@@19 this@@15))) (=> (<= 0 (length Heap@@19 this@@15)) (=> (= (ControlFlow 0 112) (- 0 111)) (< (length Heap@@19 this@@15) (length PostHeap@0 this@@15))))))))
(let ((anon111_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 116) 112)) anon54_correct)))
(let ((anon111_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 114) (- 0 115)) (<= FullPerm (U_2_real (MapType1Select PostMask@0 null (AList this@@15))))) (=> (<= FullPerm (U_2_real (MapType1Select PostMask@0 null (AList this@@15)))) (=> (= (ControlFlow 0 114) 112) anon54_correct))))))
(let ((anon50_correct true))
(let ((anon109_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 110) 107)) anon50_correct)))
(let ((anon109_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 108) (- 0 109)) (<= FullPerm (U_2_real (MapType1Select Mask@0 null (AList this@@15))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@0 null (AList this@@15)))) (=> (= (ControlFlow 0 108) 107) anon50_correct))))))
(let ((anon110_Else_correct true))
(let ((anon99_Else_correct  (=> (forall ((i_1 Int) ) (!  (=> (and (<= 0 i_1) (< i_1 (length Heap@@19 this@@15))) (= (itemAt PostHeap@0 this@@15 i_1) (itemAt Heap@@19 this@@15 i_1)))
 :qid |stdinbpl.1257:20|
 :skolemid |76|
 :pattern ( (|itemAt#frame| (MapType0Select Heap@@19 null (AList this@@15)) this@@15 i_1))
)) (=> (and (state PostHeap@0 PostMask@0) (state PostHeap@0 PostMask@0)) (and (and (and (and (=> (= (ControlFlow 0 117) 106) anon110_Else_correct) (=> (= (ControlFlow 0 117) 114) anon111_Then_correct)) (=> (= (ControlFlow 0 117) 116) anon111_Else_correct)) (=> (= (ControlFlow 0 117) 108) anon109_Then_correct)) (=> (= (ControlFlow 0 117) 110) anon109_Else_correct))))))
(let ((anon36_correct true))
(let ((anon102_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 104) 101)) anon36_correct)))
(let ((anon102_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 102) (- 0 103)) (<= FullPerm (U_2_real (MapType1Select Mask@0 null (AList this@@15))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@0 null (AList this@@15)))) (=> (= (ControlFlow 0 102) 101) anon36_correct))))))
(let ((anon45_correct  (and (=> (= (ControlFlow 0 94) (- 0 95)) (<= 0 i_12)) (=> (<= 0 i_12) (=> (= (ControlFlow 0 94) (- 0 93)) (< i_12 (length Heap@@19 this@@15)))))))
(let ((anon107_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 98) 94)) anon45_correct)))
(let ((anon107_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 96) (- 0 97)) (<= FullPerm (U_2_real (MapType1Select Mask@0 null (AList this@@15))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@0 null (AList this@@15)))) (=> (= (ControlFlow 0 96) 94) anon45_correct))))))
(let ((anon41_correct  (=> (= PostMask@2 (MapType1Store PostMask@0 null (AList this@@15) (real_2_U (- (U_2_real (MapType1Select PostMask@0 null (AList this@@15))) FullPerm)))) (and (=> (= (ControlFlow 0 88) (- 0 89)) (<= 0 i_12)) (=> (<= 0 i_12) (=> (= (ControlFlow 0 88) (- 0 87)) (< i_12 (length PostHeap@0 this@@15))))))))
(let ((anon105_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 92) 88)) anon41_correct)))
(let ((anon105_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 90) (- 0 91)) (<= FullPerm (U_2_real (MapType1Select PostMask@0 null (AList this@@15))))) (=> (<= FullPerm (U_2_real (MapType1Select PostMask@0 null (AList this@@15)))) (=> (= (ControlFlow 0 90) 88) anon41_correct))))))
(let ((anon46_correct true))
(let ((anon103_Then_correct  (=> (and (<= 0 i_12) (< i_12 (length Heap@@19 this@@15))) (and (and (and (and (=> (= (ControlFlow 0 99) 85) anon46_correct) (=> (= (ControlFlow 0 99) 96) anon107_Then_correct)) (=> (= (ControlFlow 0 99) 98) anon107_Else_correct)) (=> (= (ControlFlow 0 99) 90) anon105_Then_correct)) (=> (= (ControlFlow 0 99) 92) anon105_Else_correct)))))
(let ((anon103_Else_correct  (=> (and (not (and (<= 0 i_12) (< i_12 (length Heap@@19 this@@15)))) (= (ControlFlow 0 86) 85)) anon46_correct)))
(let ((anon100_Then_correct  (=> (<= 0 i_12) (and (and (and (=> (= (ControlFlow 0 105) 99) anon103_Then_correct) (=> (= (ControlFlow 0 105) 86) anon103_Else_correct)) (=> (= (ControlFlow 0 105) 102) anon102_Then_correct)) (=> (= (ControlFlow 0 105) 104) anon102_Else_correct)))))
(let ((anon100_Else_correct  (=> (< i_12 0) (and (=> (= (ControlFlow 0 100) 99) anon103_Then_correct) (=> (= (ControlFlow 0 100) 86) anon103_Else_correct)))))
(let ((anon97_Else_correct  (=> (= (itemAt PostHeap@0 this@@15 (- (length PostHeap@0 this@@15) 1)) elem) (=> (and (state PostHeap@0 PostMask@0) (state PostHeap@0 PostMask@0)) (and (and (=> (= (ControlFlow 0 118) 117) anon99_Else_correct) (=> (= (ControlFlow 0 118) 105) anon100_Then_correct)) (=> (= (ControlFlow 0 118) 100) anon100_Else_correct))))))
(let ((anon30_correct  (=> (= PostMask@3 (MapType1Store PostMask@0 null (AList this@@15) (real_2_U (- (U_2_real (MapType1Select PostMask@0 null (AList this@@15))) FullPerm)))) (and (=> (= (ControlFlow 0 80) (- 0 81)) (<= 0 (- (length PostHeap@0 this@@15) 1))) (=> (<= 0 (- (length PostHeap@0 this@@15) 1)) (=> (= (ControlFlow 0 80) (- 0 79)) (< (- (length PostHeap@0 this@@15) 1) (length PostHeap@0 this@@15))))))))
(let ((anon98_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 84) 80)) anon30_correct)))
(let ((anon98_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 82) (- 0 83)) (<= FullPerm (U_2_real (MapType1Select PostMask@0 null (AList this@@15))))) (=> (<= FullPerm (U_2_real (MapType1Select PostMask@0 null (AList this@@15)))) (=> (= (ControlFlow 0 82) 80) anon30_correct))))))
(let ((anon26_correct true))
(let ((anon96_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 78) 75)) anon26_correct)))
(let ((anon96_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 76) (- 0 77)) (<= FullPerm (U_2_real (MapType1Select PostMask@0 null (AList this@@15))))) (=> (<= FullPerm (U_2_real (MapType1Select PostMask@0 null (AList this@@15)))) (=> (= (ControlFlow 0 76) 75) anon26_correct))))))
(let ((anon93_Else_correct  (=> (= (length PostHeap@0 this@@15) (+ (length Heap@@19 this@@15) 1)) (=> (and (state PostHeap@0 PostMask@0) (state PostHeap@0 PostMask@0)) (and (and (and (and (=> (= (ControlFlow 0 119) 118) anon97_Else_correct) (=> (= (ControlFlow 0 119) 82) anon98_Then_correct)) (=> (= (ControlFlow 0 119) 84) anon98_Else_correct)) (=> (= (ControlFlow 0 119) 76) anon96_Then_correct)) (=> (= (ControlFlow 0 119) 78) anon96_Else_correct))))))
(let ((anon22_correct true))
(let ((anon94_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 74) 71)) anon22_correct)))
(let ((anon94_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 72) (- 0 73)) (<= FullPerm (U_2_real (MapType1Select Mask@0 null (AList this@@15))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@0 null (AList this@@15)))) (=> (= (ControlFlow 0 72) 71) anon22_correct))))))
(let ((anon18_correct true))
(let ((anon92_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 70) 67)) anon18_correct)))
(let ((anon92_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 68) (- 0 69)) (<= FullPerm (U_2_real (MapType1Select PostMask@0 null (AList this@@15))))) (=> (<= FullPerm (U_2_real (MapType1Select PostMask@0 null (AList this@@15)))) (=> (= (ControlFlow 0 68) 67) anon18_correct))))))
(let ((anon90_Then_correct  (=> (state PostHeap@0 ZeroMask) (=> (and (and (= PostMask@0 (MapType1Store ZeroMask null (AList this@@15) (real_2_U (+ (U_2_real (MapType1Select ZeroMask null (AList this@@15))) FullPerm)))) (state PostHeap@0 PostMask@0)) (and (state PostHeap@0 PostMask@0) (state PostHeap@0 PostMask@0))) (and (and (and (and (=> (= (ControlFlow 0 120) 119) anon93_Else_correct) (=> (= (ControlFlow 0 120) 72) anon94_Then_correct)) (=> (= (ControlFlow 0 120) 74) anon94_Else_correct)) (=> (= (ControlFlow 0 120) 68) anon92_Then_correct)) (=> (= (ControlFlow 0 120) 70) anon92_Else_correct))))))
(let ((anon68_correct true))
(let ((anon118_Else_correct  (=> (and (not (and (<= 0 i_13) (< i_13 (len (MapType0Select Heap@1 this@@15 elems))))) (= (ControlFlow 0 48) 43)) anon68_correct)))
(let ((anon118_Then_correct  (=> (and (<= 0 i_13) (< i_13 (len (MapType0Select Heap@1 this@@15 elems)))) (and (=> (= (ControlFlow 0 44) (- 0 47)) (HasDirectPerm QPMask@1 (loc a_3@@1 i_13) val)) (=> (HasDirectPerm QPMask@1 (loc a_3@@1 i_13) val) (and (=> (= (ControlFlow 0 44) (- 0 46)) (HasDirectPerm QPMask@1 this@@15 elems)) (=> (HasDirectPerm QPMask@1 this@@15 elems) (and (=> (= (ControlFlow 0 44) (- 0 45)) (HasDirectPerm QPMask@1 (loc (MapType0Select Heap@1 this@@15 elems) i_13) val)) (=> (HasDirectPerm QPMask@1 (loc (MapType0Select Heap@1 this@@15 elems) i_13) val) (=> (= (ControlFlow 0 44) 43) anon68_correct))))))))))
(let ((anon117_Else_correct  (=> (< i_13 0) (and (=> (= (ControlFlow 0 51) 44) anon118_Then_correct) (=> (= (ControlFlow 0 51) 48) anon118_Else_correct)))))
(let ((anon117_Then_correct  (=> (<= 0 i_13) (and (=> (= (ControlFlow 0 49) (- 0 50)) (HasDirectPerm QPMask@1 this@@15 elems)) (=> (HasDirectPerm QPMask@1 this@@15 elems) (and (=> (= (ControlFlow 0 49) 44) anon118_Then_correct) (=> (= (ControlFlow 0 49) 48) anon118_Else_correct)))))))
(let ((anon115_Then_correct true))
(let ((anon81_correct true))
(let ((anon124_Else_correct  (=> (and (not (and (<= 0 i_2) (< i_2 (length Heap@@19 this@@15)))) (= (ControlFlow 0 10) 7)) anon81_correct)))
(let ((anon124_Then_correct  (=> (and (<= 0 i_2) (< i_2 (length Heap@@19 this@@15))) (and (=> (= (ControlFlow 0 8) (- 0 9)) (= (itemAt Heap@11 this@@15 i_2) (itemAt Heap@@19 this@@15 i_2))) (=> (= (itemAt Heap@11 this@@15 i_2) (itemAt Heap@@19 this@@15 i_2)) (=> (= (ControlFlow 0 8) 7) anon81_correct))))))
(let ((anon123_Else_correct  (=> (and (forall ((i_3_1 Int) ) (!  (=> (and (<= 0 i_3_1) (< i_3_1 (length Heap@@19 this@@15))) (= (itemAt Heap@11 this@@15 i_3_1) (itemAt Heap@@19 this@@15 i_3_1)))
 :qid |stdinbpl.1598:20|
 :skolemid |98|
 :pattern ( (|itemAt#frame| (MapType0Select Heap@@19 null (AList this@@15)) this@@15 i_3_1))
)) (= (ControlFlow 0 6) (- 0 5))) (= (itemAt Heap@11 this@@15 (length Heap@@19 this@@15)) elem))))
(let ((anon78_correct  (=> (= Mask@8 (MapType1Store Mask@7 null (AList this@@15) (real_2_U (- (U_2_real (MapType1Select Mask@7 null (AList this@@15))) FullPerm)))) (and (=> (= (ControlFlow 0 11) (- 0 13)) (= (length Heap@11 this@@15) (+ (length Heap@@19 this@@15) 1))) (=> (= (length Heap@11 this@@15) (+ (length Heap@@19 this@@15) 1)) (and (=> (= (ControlFlow 0 11) (- 0 12)) (= (itemAt Heap@11 this@@15 (- (length Heap@11 this@@15) 1)) elem)) (=> (= (itemAt Heap@11 this@@15 (- (length Heap@11 this@@15) 1)) elem) (and (and (=> (= (ControlFlow 0 11) 6) anon123_Else_correct) (=> (= (ControlFlow 0 11) 8) anon124_Then_correct)) (=> (= (ControlFlow 0 11) 10) anon124_Else_correct)))))))))
(let ((anon122_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 16) 11)) anon78_correct)))
(let ((anon122_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 14) (- 0 15)) (<= FullPerm (U_2_real (MapType1Select Mask@7 null (AList this@@15))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@7 null (AList this@@15)))) (=> (= (ControlFlow 0 14) 11) anon78_correct))))))
(let ((anon76_correct  (=> (= Heap@9 (MapType0Store Heap@8 null (|AList#sm| this@@15) (MapType1Store (MapType0Select Heap@8 null (|AList#sm| this@@15)) this@@15 elems (bool_2_U true)))) (=> (and (= Heap@10 (MapType0Store Heap@9 null (|AList#sm| this@@15) (MapType1Store (MapType0Select Heap@9 null (|AList#sm| this@@15)) this@@15 size (bool_2_U true)))) (forall ((o_7 T@U) (f_10 T@U) ) (! (let ((B@@11 (FieldTypeInv1 (type f_10))))
(let ((A@@12 (FieldTypeInv0 (type f_10))))
 (=> (and (and (= (type o_7) RefType) (= (type f_10) (FieldType A@@12 B@@11))) (U_2_bool (MapType1Select (MapType0Select Heap@10 null (|AList#sm| this@@15)) o_7 f_10))) (U_2_bool (MapType1Select newPMask@0 o_7 f_10)))))
 :qid |stdinbpl.1566:27|
 :skolemid |96|
 :pattern ( (MapType1Select newPMask@0 o_7 f_10))
))) (=> (and (and (forall ((i_10_1 Int) ) (!  (=> (and (<= 0 i_10_1) (< i_10_1 (len (MapType0Select Heap@10 this@@15 elems)))) (U_2_bool (MapType1Select newPMask@0 (loc (MapType0Select Heap@10 this@@15 elems) i_10_1) val)))
 :qid |stdinbpl.1570:20|
 :skolemid |97|
)) (= Heap@11 (MapType0Store Heap@10 null (|AList#sm| this@@15) newPMask@0))) (and (state Heap@11 Mask@7) (state Heap@11 Mask@7))) (and (=> (= (ControlFlow 0 17) 14) anon122_Then_correct) (=> (= (ControlFlow 0 17) 16) anon122_Else_correct)))))))
(let ((anon121_Else_correct  (=> (HasDirectPerm Mask@7 null (AList this@@15)) (=> (and (= Heap@8 Heap@5) (= (ControlFlow 0 19) 17)) anon76_correct))))
(let ((anon121_Then_correct  (=> (not (HasDirectPerm Mask@7 null (AList this@@15))) (=> (and (and (= Heap@6 (MapType0Store Heap@5 null (|AList#sm| this@@15) ZeroPMask)) (= Heap@7 (MapType0Store Heap@6 null (AList this@@15) freshVersion@0))) (and (= Heap@8 Heap@7) (= (ControlFlow 0 18) 17))) anon76_correct))))
(let ((anon74_correct  (=> (= Mask@6 (MapType1Store Mask@5 this@@15 size (real_2_U (- (U_2_real (MapType1Select Mask@5 this@@15 size)) FullPerm)))) (and (=> (= (ControlFlow 0 20) (- 0 25)) (<= 0 (U_2_int (MapType0Select Heap@5 this@@15 size)))) (=> (<= 0 (U_2_int (MapType0Select Heap@5 this@@15 size))) (and (=> (= (ControlFlow 0 20) (- 0 24)) (<= (U_2_int (MapType0Select Heap@5 this@@15 size)) (len (MapType0Select Heap@5 this@@15 elems)))) (=> (<= (U_2_int (MapType0Select Heap@5 this@@15 size)) (len (MapType0Select Heap@5 this@@15 elems))) (and (=> (= (ControlFlow 0 20) (- 0 23)) (< 0 (len (MapType0Select Heap@5 this@@15 elems)))) (=> (< 0 (len (MapType0Select Heap@5 this@@15 elems))) (and (=> (= (ControlFlow 0 20) (- 0 22)) (forall ((i_9 Int) (i_9_1 Int) ) (!  (=> (and (and (and (and (not (= i_9 i_9_1)) (and (<= 0 i_9) (< i_9 (len (MapType0Select Heap@5 this@@15 elems))))) (and (<= 0 i_9_1) (< i_9_1 (len (MapType0Select Heap@5 this@@15 elems))))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (loc (MapType0Select Heap@5 this@@15 elems) i_9) (loc (MapType0Select Heap@5 this@@15 elems) i_9_1))))
 :qid |stdinbpl.1517:17|
 :skolemid |90|
 :pattern ( (neverTriggered8 i_9) (neverTriggered8 i_9_1))
))) (=> (forall ((i_9@@0 Int) (i_9_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_9@@0 i_9_1@@0)) (and (<= 0 i_9@@0) (< i_9@@0 (len (MapType0Select Heap@5 this@@15 elems))))) (and (<= 0 i_9_1@@0) (< i_9_1@@0 (len (MapType0Select Heap@5 this@@15 elems))))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (loc (MapType0Select Heap@5 this@@15 elems) i_9@@0) (loc (MapType0Select Heap@5 this@@15 elems) i_9_1@@0))))
 :qid |stdinbpl.1517:17|
 :skolemid |90|
 :pattern ( (neverTriggered8 i_9@@0) (neverTriggered8 i_9_1@@0))
)) (and (=> (= (ControlFlow 0 20) (- 0 21)) (forall ((i_9@@1 Int) ) (!  (=> (and (<= 0 i_9@@1) (< i_9@@1 (len (MapType0Select Heap@5 this@@15 elems)))) (>= (U_2_real (MapType1Select Mask@6 (loc (MapType0Select Heap@5 this@@15 elems) i_9@@1) val)) FullPerm))
 :qid |stdinbpl.1524:17|
 :skolemid |91|
 :pattern ( (loc (MapType0Select Heap@5 this@@15 elems) i_9@@1))
 :pattern ( (loc (MapType0Select Heap@5 this@@15 elems) i_9@@1))
))) (=> (forall ((i_9@@2 Int) ) (!  (=> (and (<= 0 i_9@@2) (< i_9@@2 (len (MapType0Select Heap@5 this@@15 elems)))) (>= (U_2_real (MapType1Select Mask@6 (loc (MapType0Select Heap@5 this@@15 elems) i_9@@2) val)) FullPerm))
 :qid |stdinbpl.1524:17|
 :skolemid |91|
 :pattern ( (loc (MapType0Select Heap@5 this@@15 elems) i_9@@2))
 :pattern ( (loc (MapType0Select Heap@5 this@@15 elems) i_9@@2))
)) (=> (forall ((i_9@@3 Int) ) (!  (=> (and (and (<= 0 i_9@@3) (< i_9@@3 (len (MapType0Select Heap@5 this@@15 elems)))) (< NoPerm FullPerm)) (and (qpRange8 (loc (MapType0Select Heap@5 this@@15 elems) i_9@@3)) (= (invRecv8 (loc (MapType0Select Heap@5 this@@15 elems) i_9@@3)) i_9@@3)))
 :qid |stdinbpl.1530:22|
 :skolemid |92|
 :pattern ( (loc (MapType0Select Heap@5 this@@15 elems) i_9@@3))
 :pattern ( (loc (MapType0Select Heap@5 this@@15 elems) i_9@@3))
)) (=> (and (and (and (forall ((o_3 T@U) ) (!  (=> (= (type o_3) RefType) (=> (and (and (<= 0 (invRecv8 o_3)) (< (invRecv8 o_3) (len (MapType0Select Heap@5 this@@15 elems)))) (and (< NoPerm FullPerm) (qpRange8 o_3))) (= (loc (MapType0Select Heap@5 this@@15 elems) (invRecv8 o_3)) o_3)))
 :qid |stdinbpl.1534:22|
 :skolemid |93|
 :pattern ( (invRecv8 o_3))
)) (forall ((o_3@@0 T@U) ) (!  (=> (= (type o_3@@0) RefType) (and (=> (and (and (<= 0 (invRecv8 o_3@@0)) (< (invRecv8 o_3@@0) (len (MapType0Select Heap@5 this@@15 elems)))) (and (< NoPerm FullPerm) (qpRange8 o_3@@0))) (and (= (loc (MapType0Select Heap@5 this@@15 elems) (invRecv8 o_3@@0)) o_3@@0) (= (U_2_real (MapType1Select QPMask@2 o_3@@0 val)) (- (U_2_real (MapType1Select Mask@6 o_3@@0 val)) FullPerm)))) (=> (not (and (and (<= 0 (invRecv8 o_3@@0)) (< (invRecv8 o_3@@0) (len (MapType0Select Heap@5 this@@15 elems)))) (and (< NoPerm FullPerm) (qpRange8 o_3@@0)))) (= (U_2_real (MapType1Select QPMask@2 o_3@@0 val)) (U_2_real (MapType1Select Mask@6 o_3@@0 val))))))
 :qid |stdinbpl.1540:22|
 :skolemid |94|
 :pattern ( (MapType1Select QPMask@2 o_3@@0 val))
))) (and (forall ((o_3@@1 T@U) (f_5 T@U) ) (! (let ((B@@12 (FieldTypeInv1 (type f_5))))
(let ((A@@13 (FieldTypeInv0 (type f_5))))
 (=> (and (and (= (type o_3@@1) RefType) (= (type f_5) (FieldType A@@13 B@@12))) (not (= f_5 val))) (= (U_2_real (MapType1Select Mask@6 o_3@@1 f_5)) (U_2_real (MapType1Select QPMask@2 o_3@@1 f_5))))))
 :qid |stdinbpl.1546:29|
 :skolemid |95|
 :pattern ( (MapType1Select QPMask@2 o_3@@1 f_5))
)) (= Mask@7 (MapType1Store QPMask@2 null (AList this@@15) (real_2_U (+ (U_2_real (MapType1Select QPMask@2 null (AList this@@15))) FullPerm)))))) (and (and (state Heap@5 Mask@7) (state Heap@5 Mask@7)) (and (|AList#trigger| Heap@5 (AList this@@15)) (= (MapType0Select Heap@5 null (AList this@@15)) (CombineFrames (FrameFragment (MapType0Select Heap@5 this@@15 elems)) (CombineFrames (FrameFragment (MapType0Select Heap@5 this@@15 size)) (FrameFragment (int_2_U (|AList#condqp1| Heap@5 this@@15))))))))) (and (=> (= (ControlFlow 0 20) 18) anon121_Then_correct) (=> (= (ControlFlow 0 20) 19) anon121_Else_correct)))))))))))))))))
(let ((anon120_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 28) 20)) anon74_correct)))
(let ((anon120_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 26) (- 0 27)) (<= FullPerm (U_2_real (MapType1Select Mask@5 this@@15 size)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@5 this@@15 size))) (=> (= (ControlFlow 0 26) 20) anon74_correct))))))
(let ((anon72_correct  (=> (= Mask@5 (MapType1Store Mask@4 this@@15 elems (real_2_U (- (U_2_real (MapType1Select Mask@4 this@@15 elems)) FullPerm)))) (and (=> (= (ControlFlow 0 29) 26) anon120_Then_correct) (=> (= (ControlFlow 0 29) 28) anon120_Else_correct)))))
(let ((anon119_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 32) 29)) anon72_correct)))
(let ((anon119_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 30) (- 0 31)) (<= FullPerm (U_2_real (MapType1Select Mask@4 this@@15 elems)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@4 this@@15 elems))) (=> (= (ControlFlow 0 30) 29) anon72_correct))))))
(let ((anon70_correct  (=> (state Heap@3 Mask@4) (and (=> (= (ControlFlow 0 33) (- 0 38)) (HasDirectPerm Mask@4 this@@15 elems)) (=> (HasDirectPerm Mask@4 this@@15 elems) (and (=> (= (ControlFlow 0 33) (- 0 37)) (HasDirectPerm Mask@4 this@@15 size)) (=> (HasDirectPerm Mask@4 this@@15 size) (and (=> (= (ControlFlow 0 33) (- 0 36)) (= FullPerm (U_2_real (MapType1Select Mask@4 (loc (MapType0Select Heap@3 this@@15 elems) (U_2_int (MapType0Select Heap@3 this@@15 size))) val)))) (=> (= FullPerm (U_2_real (MapType1Select Mask@4 (loc (MapType0Select Heap@3 this@@15 elems) (U_2_int (MapType0Select Heap@3 this@@15 size))) val))) (=> (and (= Heap@4 (MapType0Store Heap@3 (loc (MapType0Select Heap@3 this@@15 elems) (U_2_int (MapType0Select Heap@3 this@@15 size))) val (int_2_U elem))) (state Heap@4 Mask@4)) (and (=> (= (ControlFlow 0 33) (- 0 35)) (HasDirectPerm Mask@4 this@@15 size)) (=> (HasDirectPerm Mask@4 this@@15 size) (and (=> (= (ControlFlow 0 33) (- 0 34)) (= FullPerm (U_2_real (MapType1Select Mask@4 this@@15 size)))) (=> (= FullPerm (U_2_real (MapType1Select Mask@4 this@@15 size))) (=> (and (= Heap@5 (MapType0Store Heap@4 this@@15 size (int_2_U (+ (U_2_int (MapType0Select Heap@4 this@@15 size)) 1)))) (state Heap@5 Mask@4)) (and (=> (= (ControlFlow 0 33) 30) anon119_Then_correct) (=> (= (ControlFlow 0 33) 32) anon119_Else_correct)))))))))))))))))
(let ((anon116_Else_correct  (=> (forall ((i_8 Int) ) (!  (=> (and (<= 0 i_8) (< i_8 (len (MapType0Select Heap@1 this@@15 elems)))) (= (U_2_int (MapType0Select Heap@1 (loc a_3@@1 i_8) val)) (U_2_int (MapType0Select Heap@1 (loc (MapType0Select Heap@1 this@@15 elems) i_8) val))))
 :qid |stdinbpl.1452:24|
 :skolemid |89|
 :pattern ( (loc a_3@@1 i_8))
 :pattern ( (loc (MapType0Select Heap@1 this@@15 elems) i_8))
)) (=> (and (state Heap@1 QPMask@1) (state Heap@1 QPMask@1)) (and (=> (= (ControlFlow 0 41) (- 0 42)) (= FullPerm (U_2_real (MapType1Select QPMask@1 this@@15 elems)))) (=> (= FullPerm (U_2_real (MapType1Select QPMask@1 this@@15 elems))) (=> (= Heap@2 (MapType0Store Heap@1 this@@15 elems a_3@@1)) (=> (and (and (state Heap@2 QPMask@1) (= Mask@4 QPMask@1)) (and (= Heap@3 Heap@2) (= (ControlFlow 0 41) 33))) anon70_correct))))))))
(let ((anon115_Else_correct  (and (=> (= (ControlFlow 0 52) (- 0 53)) (forall ((i_6 Int) (i_6_1 Int) ) (!  (=> (and (and (and (and (not (= i_6 i_6_1)) (and (<= 0 i_6) (< i_6 (len a_3@@1)))) (and (<= 0 i_6_1) (< i_6_1 (len a_3@@1)))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (loc a_3@@1 i_6) (loc a_3@@1 i_6_1))))
 :qid |stdinbpl.1395:19|
 :skolemid |83|
))) (=> (forall ((i_6@@0 Int) (i_6_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_6@@0 i_6_1@@0)) (and (<= 0 i_6@@0) (< i_6@@0 (len a_3@@1)))) (and (<= 0 i_6_1@@0) (< i_6_1@@0 (len a_3@@1)))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (loc a_3@@1 i_6@@0) (loc a_3@@1 i_6_1@@0))))
 :qid |stdinbpl.1395:19|
 :skolemid |83|
)) (=> (and (and (and (forall ((i_6@@1 Int) ) (!  (=> (and (and (<= 0 i_6@@1) (< i_6@@1 (len a_3@@1))) (< NoPerm FullPerm)) (and (qpRange7 (loc a_3@@1 i_6@@1)) (= (invRecv7 (loc a_3@@1 i_6@@1)) i_6@@1)))
 :qid |stdinbpl.1401:26|
 :skolemid |84|
 :pattern ( (loc a_3@@1 i_6@@1))
 :pattern ( (loc a_3@@1 i_6@@1))
)) (forall ((o_3@@2 T@U) ) (!  (=> (= (type o_3@@2) RefType) (=> (and (and (and (<= 0 (invRecv7 o_3@@2)) (< (invRecv7 o_3@@2) (len a_3@@1))) (< NoPerm FullPerm)) (qpRange7 o_3@@2)) (= (loc a_3@@1 (invRecv7 o_3@@2)) o_3@@2)))
 :qid |stdinbpl.1405:26|
 :skolemid |85|
 :pattern ( (invRecv7 o_3@@2))
))) (and (forall ((i_6@@2 Int) ) (!  (=> (and (<= 0 i_6@@2) (< i_6@@2 (len a_3@@1))) (not (= (loc a_3@@1 i_6@@2) null)))
 :qid |stdinbpl.1411:26|
 :skolemid |86|
 :pattern ( (loc a_3@@1 i_6@@2))
 :pattern ( (loc a_3@@1 i_6@@2))
)) (forall ((o_3@@3 T@U) ) (!  (=> (= (type o_3@@3) RefType) (and (=> (and (and (and (<= 0 (invRecv7 o_3@@3)) (< (invRecv7 o_3@@3) (len a_3@@1))) (< NoPerm FullPerm)) (qpRange7 o_3@@3)) (and (=> (< NoPerm FullPerm) (= (loc a_3@@1 (invRecv7 o_3@@3)) o_3@@3)) (= (U_2_real (MapType1Select QPMask@1 o_3@@3 val)) (+ (U_2_real (MapType1Select QPMask@0 o_3@@3 val)) FullPerm)))) (=> (not (and (and (and (<= 0 (invRecv7 o_3@@3)) (< (invRecv7 o_3@@3) (len a_3@@1))) (< NoPerm FullPerm)) (qpRange7 o_3@@3))) (= (U_2_real (MapType1Select QPMask@1 o_3@@3 val)) (U_2_real (MapType1Select QPMask@0 o_3@@3 val))))))
 :qid |stdinbpl.1417:26|
 :skolemid |87|
 :pattern ( (MapType1Select QPMask@1 o_3@@3 val))
)))) (and (and (forall ((o_3@@4 T@U) (f_5@@0 T@U) ) (! (let ((B@@13 (FieldTypeInv1 (type f_5@@0))))
(let ((A@@14 (FieldTypeInv0 (type f_5@@0))))
 (=> (and (and (= (type o_3@@4) RefType) (= (type f_5@@0) (FieldType A@@14 B@@13))) (not (= f_5@@0 val))) (= (U_2_real (MapType1Select QPMask@0 o_3@@4 f_5@@0)) (U_2_real (MapType1Select QPMask@1 o_3@@4 f_5@@0))))))
 :qid |stdinbpl.1421:33|
 :skolemid |88|
 :pattern ( (MapType1Select QPMask@0 o_3@@4 f_5@@0))
 :pattern ( (MapType1Select QPMask@1 o_3@@4 f_5@@0))
)) (state Heap@1 QPMask@1)) (and (state Heap@1 QPMask@1) (state Heap@1 QPMask@1)))) (and (and (=> (= (ControlFlow 0 52) 41) anon116_Else_correct) (=> (= (ControlFlow 0 52) 49) anon117_Then_correct)) (=> (= (ControlFlow 0 52) 51) anon117_Else_correct)))))))
(let ((anon114_Then_correct  (=> (= (U_2_int (MapType0Select Heap@1 this@@15 size)) (len (MapType0Select Heap@1 this@@15 elems))) (and (=> (= (ControlFlow 0 54) (- 0 55)) (HasDirectPerm QPMask@0 this@@15 elems)) (=> (HasDirectPerm QPMask@0 this@@15 elems) (=> (= (len a_3@@1) (* (len (MapType0Select Heap@1 this@@15 elems)) 2)) (and (=> (= (ControlFlow 0 54) 40) anon115_Then_correct) (=> (= (ControlFlow 0 54) 52) anon115_Else_correct))))))))
(let ((anon114_Else_correct  (=> (and (and (not (= (U_2_int (MapType0Select Heap@1 this@@15 size)) (len (MapType0Select Heap@1 this@@15 elems)))) (= Mask@4 QPMask@0)) (and (= Heap@3 Heap@1) (= (ControlFlow 0 39) 33))) anon70_correct)))
(let ((anon60_correct  (=> (not (= this@@15 null)) (=> (and (and (and (= Mask@2 (MapType1Store Mask@1 this@@15 elems (real_2_U (+ (U_2_real (MapType1Select Mask@1 this@@15 elems)) FullPerm)))) (state Heap@1 Mask@2)) (and (not (= this@@15 null)) (= Mask@3 (MapType1Store Mask@2 this@@15 size (real_2_U (+ (U_2_real (MapType1Select Mask@2 this@@15 size)) FullPerm)))))) (and (and (state Heap@1 Mask@3) (<= 0 (U_2_int (MapType0Select Heap@1 this@@15 size)))) (and (<= (U_2_int (MapType0Select Heap@1 this@@15 size)) (len (MapType0Select Heap@1 this@@15 elems))) (< 0 (len (MapType0Select Heap@1 this@@15 elems)))))) (and (=> (= (ControlFlow 0 56) (- 0 59)) (forall ((i_4 Int) (i_4_1 Int) ) (!  (=> (and (and (and (and (not (= i_4 i_4_1)) (and (<= 0 i_4) (< i_4 (len (MapType0Select Heap@1 this@@15 elems))))) (and (<= 0 i_4_1) (< i_4_1 (len (MapType0Select Heap@1 this@@15 elems))))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (loc (MapType0Select Heap@1 this@@15 elems) i_4) (loc (MapType0Select Heap@1 this@@15 elems) i_4_1))))
 :qid |stdinbpl.1335:15|
 :skolemid |77|
))) (=> (forall ((i_4@@0 Int) (i_4_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_4@@0 i_4_1@@0)) (and (<= 0 i_4@@0) (< i_4@@0 (len (MapType0Select Heap@1 this@@15 elems))))) (and (<= 0 i_4_1@@0) (< i_4_1@@0 (len (MapType0Select Heap@1 this@@15 elems))))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (loc (MapType0Select Heap@1 this@@15 elems) i_4@@0) (loc (MapType0Select Heap@1 this@@15 elems) i_4_1@@0))))
 :qid |stdinbpl.1335:15|
 :skolemid |77|
)) (=> (and (and (and (forall ((i_4@@1 Int) ) (!  (=> (and (and (<= 0 i_4@@1) (< i_4@@1 (len (MapType0Select Heap@1 this@@15 elems)))) (< NoPerm FullPerm)) (and (qpRange6 (loc (MapType0Select Heap@1 this@@15 elems) i_4@@1)) (= (invRecv6 (loc (MapType0Select Heap@1 this@@15 elems) i_4@@1)) i_4@@1)))
 :qid |stdinbpl.1341:22|
 :skolemid |78|
 :pattern ( (loc (MapType0Select Heap@1 this@@15 elems) i_4@@1))
 :pattern ( (loc (MapType0Select Heap@1 this@@15 elems) i_4@@1))
)) (forall ((o_3@@5 T@U) ) (!  (=> (= (type o_3@@5) RefType) (=> (and (and (and (<= 0 (invRecv6 o_3@@5)) (< (invRecv6 o_3@@5) (len (MapType0Select Heap@1 this@@15 elems)))) (< NoPerm FullPerm)) (qpRange6 o_3@@5)) (= (loc (MapType0Select Heap@1 this@@15 elems) (invRecv6 o_3@@5)) o_3@@5)))
 :qid |stdinbpl.1345:22|
 :skolemid |79|
 :pattern ( (invRecv6 o_3@@5))
))) (and (forall ((i_4@@2 Int) ) (!  (=> (and (<= 0 i_4@@2) (< i_4@@2 (len (MapType0Select Heap@1 this@@15 elems)))) (not (= (loc (MapType0Select Heap@1 this@@15 elems) i_4@@2) null)))
 :qid |stdinbpl.1351:22|
 :skolemid |80|
 :pattern ( (loc (MapType0Select Heap@1 this@@15 elems) i_4@@2))
 :pattern ( (loc (MapType0Select Heap@1 this@@15 elems) i_4@@2))
)) (forall ((o_3@@6 T@U) ) (!  (=> (= (type o_3@@6) RefType) (and (=> (and (and (and (<= 0 (invRecv6 o_3@@6)) (< (invRecv6 o_3@@6) (len (MapType0Select Heap@1 this@@15 elems)))) (< NoPerm FullPerm)) (qpRange6 o_3@@6)) (and (=> (< NoPerm FullPerm) (= (loc (MapType0Select Heap@1 this@@15 elems) (invRecv6 o_3@@6)) o_3@@6)) (= (U_2_real (MapType1Select QPMask@0 o_3@@6 val)) (+ (U_2_real (MapType1Select Mask@3 o_3@@6 val)) FullPerm)))) (=> (not (and (and (and (<= 0 (invRecv6 o_3@@6)) (< (invRecv6 o_3@@6) (len (MapType0Select Heap@1 this@@15 elems)))) (< NoPerm FullPerm)) (qpRange6 o_3@@6))) (= (U_2_real (MapType1Select QPMask@0 o_3@@6 val)) (U_2_real (MapType1Select Mask@3 o_3@@6 val))))))
 :qid |stdinbpl.1357:22|
 :skolemid |81|
 :pattern ( (MapType1Select QPMask@0 o_3@@6 val))
)))) (and (and (forall ((o_3@@7 T@U) (f_5@@1 T@U) ) (! (let ((B@@14 (FieldTypeInv1 (type f_5@@1))))
(let ((A@@15 (FieldTypeInv0 (type f_5@@1))))
 (=> (and (and (= (type o_3@@7) RefType) (= (type f_5@@1) (FieldType A@@15 B@@14))) (not (= f_5@@1 val))) (= (U_2_real (MapType1Select Mask@3 o_3@@7 f_5@@1)) (U_2_real (MapType1Select QPMask@0 o_3@@7 f_5@@1))))))
 :qid |stdinbpl.1361:29|
 :skolemid |82|
 :pattern ( (MapType1Select Mask@3 o_3@@7 f_5@@1))
 :pattern ( (MapType1Select QPMask@0 o_3@@7 f_5@@1))
)) (state Heap@1 QPMask@0)) (and (state Heap@1 QPMask@0) (state Heap@1 QPMask@0)))) (and (=> (= (ControlFlow 0 56) (- 0 58)) (HasDirectPerm QPMask@0 this@@15 size)) (=> (HasDirectPerm QPMask@0 this@@15 size) (and (=> (= (ControlFlow 0 56) (- 0 57)) (HasDirectPerm QPMask@0 this@@15 elems)) (=> (HasDirectPerm QPMask@0 this@@15 elems) (and (=> (= (ControlFlow 0 56) 54) anon114_Then_correct) (=> (= (ControlFlow 0 56) 39) anon114_Else_correct)))))))))))))
(let ((anon113_Else_correct  (=> (HasDirectPerm Mask@1 null (AList this@@15)) (=> (and (= Heap@1 Heap@@19) (= (ControlFlow 0 61) 56)) anon60_correct))))
(let ((anon113_Then_correct  (=> (and (and (not (HasDirectPerm Mask@1 null (AList this@@15))) (= Heap@0 (MapType0Store Heap@@19 null (AList this@@15) newVersion@0))) (and (= Heap@1 Heap@0) (= (ControlFlow 0 60) 56))) anon60_correct)))
(let ((anon58_correct  (=> (= Mask@1 (MapType1Store Mask@0 null (AList this@@15) (real_2_U (- (U_2_real (MapType1Select Mask@0 null (AList this@@15))) FullPerm)))) (and (=> (= (ControlFlow 0 62) 60) anon113_Then_correct) (=> (= (ControlFlow 0 62) 61) anon113_Else_correct)))))
(let ((anon112_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 65) 62)) anon58_correct)))
(let ((anon112_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 63) (- 0 64)) (<= FullPerm (U_2_real (MapType1Select Mask@0 null (AList this@@15))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@0 null (AList this@@15)))) (=> (= (ControlFlow 0 63) 62) anon58_correct))))))
(let ((anon90_Else_correct  (=> (and (|AList#trigger| Heap@@19 (AList this@@15)) (= (MapType0Select Heap@@19 null (AList this@@15)) (CombineFrames (FrameFragment (MapType0Select Heap@@19 this@@15 elems)) (CombineFrames (FrameFragment (MapType0Select Heap@@19 this@@15 size)) (FrameFragment (int_2_U (|AList#condqp1| Heap@@19 this@@15))))))) (and (=> (= (ControlFlow 0 66) 63) anon112_Then_correct) (=> (= (ControlFlow 0 66) 65) anon112_Else_correct)))))
(let ((anon14_correct  (=> (state Heap@@19 Mask@0) (and (=> (= (ControlFlow 0 121) 120) anon90_Then_correct) (=> (= (ControlFlow 0 121) 66) anon90_Else_correct)))))
(let ((anon88_Else_correct  (=> (and (<= (itemAt Heap@@19 this@@15 (- (length Heap@@19 this@@15) 1)) elem) (= (ControlFlow 0 123) 121)) anon14_correct)))
(let ((anon85_Then_correct  (=> (and (< 0 (length Heap@@19 this@@15)) (state Heap@@19 Mask@0)) (and (and (and (and (=> (= (ControlFlow 0 134) 123) anon88_Else_correct) (=> (= (ControlFlow 0 134) 131) anon89_Then_correct)) (=> (= (ControlFlow 0 134) 133) anon89_Else_correct)) (=> (= (ControlFlow 0 134) 125) anon87_Then_correct)) (=> (= (ControlFlow 0 134) 127) anon87_Else_correct)))))
(let ((anon85_Else_correct  (=> (and (<= (length Heap@@19 this@@15) 0) (= (ControlFlow 0 122) 121)) anon14_correct)))
(let ((anon3_correct true))
(let ((anon84_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 4) 1)) anon3_correct)))
(let ((anon84_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 2) (- 0 3)) (<= FullPerm (U_2_real (MapType1Select Mask@0 null (AList this@@15))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@0 null (AList this@@15)))) (=> (= (ControlFlow 0 2) 1) anon3_correct))))))
(let ((anon0_correct  (=> (and (state Heap@@19 ZeroMask) (= AssumeFunctionsAbove (- 0 1))) (=> (and (and (U_2_bool (MapType0Select Heap@@19 this@@15 $allocated)) (= Mask@0 (MapType1Store ZeroMask null (AList this@@15) (real_2_U (+ (U_2_real (MapType1Select ZeroMask null (AList this@@15))) FullPerm))))) (and (state Heap@@19 Mask@0) (state Heap@@19 Mask@0))) (and (and (and (=> (= (ControlFlow 0 135) 134) anon85_Then_correct) (=> (= (ControlFlow 0 135) 122) anon85_Else_correct)) (=> (= (ControlFlow 0 135) 2) anon84_Then_correct)) (=> (= (ControlFlow 0 135) 4) anon84_Else_correct))))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 136) 135) anon0_correct)))
PreconditionGeneratedEntry_correct)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
))
(check-sat)
(pop 1)
; Valid
(get-info :rlimit)
