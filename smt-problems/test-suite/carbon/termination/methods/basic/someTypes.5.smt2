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
(declare-fun FieldType (T@T T@T) T@T)
(declare-fun FieldTypeInv0 (T@T) T@T)
(declare-fun FieldTypeInv1 (T@T) T@T)
(declare-fun NormalFieldType () T@T)
(declare-fun RefType () T@T)
(declare-fun succHeap (T@U T@U) Bool)
(declare-fun MapType0Type (T@T) T@T)
(declare-fun succHeapTrans (T@U T@U) Bool)
(declare-fun MapType0TypeInv0 (T@T) T@T)
(declare-fun MapType0Select (T@U T@U T@U) T@U)
(declare-fun MapType0Store (T@U T@U T@U T@U) T@U)
(declare-fun nestedPredicates (T@U T@U) Bool)
(declare-fun PredicateInstanceDomainTypeType () T@T)
(declare-fun bounded (T@U) Bool)
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
(declare-fun list (T@U) T@U)
(declare-fun PredicateType_listType () T@T)
(declare-fun |PI_list'| (T@U T@U) T@U)
(declare-fun dummyFunction (T@U) Bool)
(declare-fun |PI_list#triggerStateless| (T@U) T@U)
(declare-fun |list#trigger| (T@U T@U) Bool)
(declare-fun |list#everUsed| (T@U) Bool)
(declare-fun PI_list (T@U T@U) T@U)
(declare-fun decreasing (T@U T@U) Bool)
(declare-fun |list#sm| (T@U) T@U)
(declare-fun dummyHeap () T@U)
(declare-fun ZeroMask () T@U)
(declare-fun InsidePredicate (T@U T@U T@U T@U) Bool)
(declare-fun sumMask (T@U T@U T@U) Bool)
(declare-fun ConditionalFrame (Real T@U) T@U)
(declare-fun EmptyFrame () T@U)
(declare-fun NoPerm () Real)
(declare-fun getPredWandId (T@U) Int)
(declare-fun FullPerm () Real)
(declare-fun |PI_list#frame| (T@U T@U) T@U)
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
(assert  (and (and (and (and (and (and (forall ((arg0@@11 T@T) (arg1 T@T) ) (! (= (Ctor (FieldType arg0@@11 arg1)) 6)
 :qid |ctor:FieldType|
)) (forall ((arg0@@12 T@T) (arg1@@0 T@T) ) (! (= (FieldTypeInv0 (FieldType arg0@@12 arg1@@0)) arg0@@12)
 :qid |typeInv:FieldTypeInv0|
 :pattern ( (FieldType arg0@@12 arg1@@0))
))) (forall ((arg0@@13 T@T) (arg1@@1 T@T) ) (! (= (FieldTypeInv1 (FieldType arg0@@13 arg1@@1)) arg1@@1)
 :qid |typeInv:FieldTypeInv1|
 :pattern ( (FieldType arg0@@13 arg1@@1))
))) (= (Ctor NormalFieldType) 7)) (= (type $allocated) (FieldType NormalFieldType boolType))) (= (Ctor RefType) 8)) (= (type next) (FieldType NormalFieldType RefType))))
(assert (distinct $allocated next)
)
(assert  (and (and (and (and (and (forall ((arg0@@14 T@T) ) (! (= (Ctor (MapType0Type arg0@@14)) 9)
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
)))))
(assert (forall ((Heap0 T@U) (Heap1 T@U) ) (!  (=> (and (and (= (type Heap0) (MapType0Type RefType)) (= (type Heap1) (MapType0Type RefType))) (succHeap Heap0 Heap1)) (succHeapTrans Heap0 Heap1))
 :qid |stdinbpl.88:15|
 :skolemid |11|
 :pattern ( (succHeap Heap0 Heap1))
)))
(assert (= (Ctor PredicateInstanceDomainTypeType) 10))
(assert (forall ((l1 T@U) ) (!  (=> (= (type l1) PredicateInstanceDomainTypeType) (not (nestedPredicates l1 l1)))
 :qid |stdinbpl.227:15|
 :skolemid |25|
 :pattern ( (nestedPredicates l1 l1))
)))
(assert (forall ((l1@@0 T@U) ) (!  (=> (= (type l1@@0) PredicateInstanceDomainTypeType) (bounded l1@@0))
 :qid |stdinbpl.192:15|
 :skolemid |23|
 :pattern ( (bounded l1@@0))
)))
(assert  (and (and (and (and (and (and (forall ((arg0@@18 T@T) (arg1@@4 T@T) ) (! (= (Ctor (MapType1Type arg0@@18 arg1@@4)) 11)
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
(assert  (and (and (= (Ctor FrameTypeType) 12) (= (type null) RefType)) (forall ((arg0@@23 T@U) ) (! (let ((A (FieldTypeInv0 (type arg0@@23))))
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
(assert  (and (= (Ctor PredicateType_listType) 13) (forall ((arg0@@25 T@U) ) (! (= (type (list arg0@@25)) (FieldType PredicateType_listType FrameTypeType))
 :qid |funType:list|
 :pattern ( (list arg0@@25))
))))
(assert (forall ((xs T@U) ) (!  (=> (= (type xs) RefType) (IsPredicateField (list xs)))
 :qid |stdinbpl.308:15|
 :skolemid |30|
 :pattern ( (list xs))
)))
(assert  (and (forall ((arg0@@26 T@U) (arg1@@9 T@U) ) (! (= (type (|PI_list'| arg0@@26 arg1@@9)) PredicateInstanceDomainTypeType)
 :qid |funType:PI_list'|
 :pattern ( (|PI_list'| arg0@@26 arg1@@9))
)) (forall ((arg0@@27 T@U) ) (! (= (type (|PI_list#triggerStateless| arg0@@27)) PredicateInstanceDomainTypeType)
 :qid |funType:PI_list#triggerStateless|
 :pattern ( (|PI_list#triggerStateless| arg0@@27))
))))
(assert (forall ((Heap@@2 T@U) (xs@@0 T@U) ) (!  (=> (and (= (type Heap@@2) (MapType0Type RefType)) (= (type xs@@0) RefType)) (dummyFunction (|PI_list#triggerStateless| xs@@0)))
 :qid |stdinbpl.258:15|
 :skolemid |27|
 :pattern ( (|PI_list'| Heap@@2 xs@@0))
)))
(assert (forall ((Heap@@3 T@U) (xs@@1 T@U) ) (!  (=> (and (= (type Heap@@3) (MapType0Type RefType)) (= (type xs@@1) RefType)) (|list#everUsed| (list xs@@1)))
 :qid |stdinbpl.327:15|
 :skolemid |34|
 :pattern ( (|list#trigger| Heap@@3 (list xs@@1)))
)))
(assert (forall ((Heap@@4 T@U) (ExhaleHeap@@1 T@U) (Mask@@2 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@4) (MapType0Type RefType)) (= (type ExhaleHeap@@1) (MapType0Type RefType))) (= (type Mask@@2) (MapType1Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@4 ExhaleHeap@@1 Mask@@2)) (U_2_bool (MapType0Select Heap@@4 o_1 $allocated))) (U_2_bool (MapType0Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.73:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@4 ExhaleHeap@@1 Mask@@2) (MapType0Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert (forall ((arg0@@28 T@U) (arg1@@10 T@U) ) (! (= (type (PI_list arg0@@28 arg1@@10)) PredicateInstanceDomainTypeType)
 :qid |funType:PI_list|
 :pattern ( (PI_list arg0@@28 arg1@@10))
)))
(assert (forall ((Heap@@5 T@U) (xs@@2 T@U) ) (!  (=> (and (= (type Heap@@5) (MapType0Type RefType)) (= (type xs@@2) RefType)) (and (= (PI_list Heap@@5 xs@@2) (|PI_list'| Heap@@5 xs@@2)) (dummyFunction (|PI_list#triggerStateless| xs@@2))))
 :qid |stdinbpl.254:15|
 :skolemid |26|
 :pattern ( (PI_list Heap@@5 xs@@2))
)))
(assert (forall ((l1@@1 T@U) (l2 T@U) ) (!  (=> (and (= (type l1@@1) PredicateInstanceDomainTypeType) (= (type l2) PredicateInstanceDomainTypeType)) (= (decreasing l1@@1 l2) (nestedPredicates l1@@1 l2)))
 :qid |stdinbpl.186:15|
 :skolemid |22|
 :pattern ( (nestedPredicates l1@@1 l2))
)))
(assert (forall ((xs@@3 T@U) (xs2 T@U) ) (!  (=> (and (and (= (type xs@@3) RefType) (= (type xs2) RefType)) (= (list xs@@3) (list xs2))) (= xs@@3 xs2))
 :qid |stdinbpl.318:15|
 :skolemid |32|
 :pattern ( (list xs@@3) (list xs2))
)))
(assert (forall ((arg0@@29 T@U) ) (! (= (type (|list#sm| arg0@@29)) (FieldType PredicateType_listType (MapType1Type RefType boolType)))
 :qid |funType:list#sm|
 :pattern ( (|list#sm| arg0@@29))
)))
(assert (forall ((xs@@4 T@U) (xs2@@0 T@U) ) (!  (=> (and (and (= (type xs@@4) RefType) (= (type xs2@@0) RefType)) (= (|list#sm| xs@@4) (|list#sm| xs2@@0))) (= xs@@4 xs2@@0))
 :qid |stdinbpl.322:15|
 :skolemid |33|
 :pattern ( (|list#sm| xs@@4) (|list#sm| xs2@@0))
)))
(assert (forall ((Heap@@6 T@U) (ExhaleHeap@@2 T@U) (Mask@@3 T@U) (o_1@@0 T@U) (f_2 T@U) ) (! (let ((B@@1 (FieldTypeInv1 (type f_2))))
(let ((A@@1 (FieldTypeInv0 (type f_2))))
 (=> (and (and (and (and (and (and (= (type Heap@@6) (MapType0Type RefType)) (= (type ExhaleHeap@@2) (MapType0Type RefType))) (= (type Mask@@3) (MapType1Type RefType realType))) (= (type o_1@@0) RefType)) (= (type f_2) (FieldType A@@1 B@@1))) (IdenticalOnKnownLocations Heap@@6 ExhaleHeap@@2 Mask@@3)) (HasDirectPerm Mask@@3 o_1@@0 f_2)) (= (MapType0Select Heap@@6 o_1@@0 f_2) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2)))))
 :qid |stdinbpl.42:22|
 :skolemid |1|
 :pattern ( (IdenticalOnKnownLocations Heap@@6 ExhaleHeap@@2 Mask@@3) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2))
)))
(assert  (and (= (type dummyHeap) (MapType0Type RefType)) (= (type ZeroMask) (MapType1Type RefType realType))))
(assert (state dummyHeap ZeroMask))
(assert (forall ((p T@U) (v_1 T@U) (w T@U) ) (! (let ((A@@2 (FieldTypeInv0 (type p))))
 (=> (and (and (= (type p) (FieldType A@@2 FrameTypeType)) (= (type v_1) FrameTypeType)) (= (type w) FrameTypeType)) (not (InsidePredicate p v_1 p w))))
 :qid |stdinbpl.173:19|
 :skolemid |21|
 :pattern ( (InsidePredicate p v_1 p w))
)))
(assert  (not (IsPredicateField next)))
(assert  (not (IsWandField next)))
(assert (forall ((Heap@@7 T@U) (ExhaleHeap@@3 T@U) (Mask@@4 T@U) ) (!  (=> (and (and (and (= (type Heap@@7) (MapType0Type RefType)) (= (type ExhaleHeap@@3) (MapType0Type RefType))) (= (type Mask@@4) (MapType1Type RefType realType))) (IdenticalOnKnownLocations Heap@@7 ExhaleHeap@@3 Mask@@4)) (succHeap Heap@@7 ExhaleHeap@@3))
 :qid |stdinbpl.83:15|
 :skolemid |10|
 :pattern ( (IdenticalOnKnownLocations Heap@@7 ExhaleHeap@@3 Mask@@4))
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
(assert  (and (forall ((arg0@@30 Real) (arg1@@11 T@U) ) (! (= (type (ConditionalFrame arg0@@30 arg1@@11)) FrameTypeType)
 :qid |funType:ConditionalFrame|
 :pattern ( (ConditionalFrame arg0@@30 arg1@@11))
)) (= (type EmptyFrame) FrameTypeType)))
(assert (forall ((p@@0 Real) (f_6 T@U) ) (!  (=> (= (type f_6) FrameTypeType) (= (ConditionalFrame p@@0 f_6) (ite (> p@@0 0.0) f_6 EmptyFrame)))
 :qid |stdinbpl.161:15|
 :skolemid |19|
 :pattern ( (ConditionalFrame p@@0 f_6))
)))
(assert (forall ((Mask@@5 T@U) (o_2@@0 T@U) (f_4@@0 T@U) ) (! (let ((B@@3 (FieldTypeInv1 (type f_4@@0))))
(let ((A@@4 (FieldTypeInv0 (type f_4@@0))))
 (=> (and (and (= (type Mask@@5) (MapType1Type RefType realType)) (= (type o_2@@0) RefType)) (= (type f_4@@0) (FieldType A@@4 B@@3))) (= (HasDirectPerm Mask@@5 o_2@@0 f_4@@0) (> (U_2_real (MapType1Select Mask@@5 o_2@@0 f_4@@0)) NoPerm)))))
 :qid |stdinbpl.133:22|
 :skolemid |17|
 :pattern ( (HasDirectPerm Mask@@5 o_2@@0 f_4@@0))
)))
(assert (forall ((o_2@@1 T@U) (f_4@@1 T@U) ) (! (let ((B@@4 (FieldTypeInv1 (type f_4@@1))))
(let ((A@@5 (FieldTypeInv0 (type f_4@@1))))
 (=> (and (= (type o_2@@1) RefType) (= (type f_4@@1) (FieldType A@@5 B@@4))) (= (U_2_real (MapType1Select ZeroMask o_2@@1 f_4@@1)) NoPerm))))
 :qid |stdinbpl.106:22|
 :skolemid |13|
 :pattern ( (MapType1Select ZeroMask o_2@@1 f_4@@1))
)))
(assert (forall ((Heap@@8 T@U) (ExhaleHeap@@4 T@U) (Mask@@6 T@U) (pm_f@@1 T@U) ) (! (let ((C@@1 (FieldTypeInv0 (type pm_f@@1))))
 (=> (and (and (and (and (and (= (type Heap@@8) (MapType0Type RefType)) (= (type ExhaleHeap@@4) (MapType0Type RefType))) (= (type Mask@@6) (MapType1Type RefType realType))) (= (type pm_f@@1) (FieldType C@@1 FrameTypeType))) (IdenticalOnKnownLocations Heap@@8 ExhaleHeap@@4 Mask@@6)) (and (HasDirectPerm Mask@@6 null pm_f@@1) (IsPredicateField pm_f@@1))) (forall ((o2 T@U) (f_2@@0 T@U) ) (! (let ((B@@5 (FieldTypeInv1 (type f_2@@0))))
(let ((A@@6 (FieldTypeInv0 (type f_2@@0))))
 (=> (and (and (= (type o2) RefType) (= (type f_2@@0) (FieldType A@@6 B@@5))) (U_2_bool (MapType1Select (MapType0Select Heap@@8 null (PredicateMaskField pm_f@@1)) o2 f_2@@0))) (= (MapType0Select Heap@@8 o2 f_2@@0) (MapType0Select ExhaleHeap@@4 o2 f_2@@0)))))
 :qid |stdinbpl.54:134|
 :skolemid |3|
 :pattern ( (MapType0Select ExhaleHeap@@4 o2 f_2@@0))
))))
 :qid |stdinbpl.52:19|
 :skolemid |4|
 :pattern ( (IdenticalOnKnownLocations Heap@@8 ExhaleHeap@@4 Mask@@6) (IsPredicateField pm_f@@1))
)))
(assert (forall ((Heap@@9 T@U) (ExhaleHeap@@5 T@U) (Mask@@7 T@U) (pm_f@@2 T@U) ) (! (let ((C@@2 (FieldTypeInv0 (type pm_f@@2))))
 (=> (and (and (and (and (and (= (type Heap@@9) (MapType0Type RefType)) (= (type ExhaleHeap@@5) (MapType0Type RefType))) (= (type Mask@@7) (MapType1Type RefType realType))) (= (type pm_f@@2) (FieldType C@@2 FrameTypeType))) (IdenticalOnKnownLocations Heap@@9 ExhaleHeap@@5 Mask@@7)) (and (HasDirectPerm Mask@@7 null pm_f@@2) (IsWandField pm_f@@2))) (forall ((o2@@0 T@U) (f_2@@1 T@U) ) (! (let ((B@@6 (FieldTypeInv1 (type f_2@@1))))
(let ((A@@7 (FieldTypeInv0 (type f_2@@1))))
 (=> (and (and (= (type o2@@0) RefType) (= (type f_2@@1) (FieldType A@@7 B@@6))) (U_2_bool (MapType1Select (MapType0Select Heap@@9 null (WandMaskField pm_f@@2)) o2@@0 f_2@@1))) (= (MapType0Select Heap@@9 o2@@0 f_2@@1) (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1)))))
 :qid |stdinbpl.67:129|
 :skolemid |6|
 :pattern ( (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1))
))))
 :qid |stdinbpl.65:19|
 :skolemid |7|
 :pattern ( (IdenticalOnKnownLocations Heap@@9 ExhaleHeap@@5 Mask@@7) (IsWandField pm_f@@2))
)))
(assert (forall ((xs@@5 T@U) ) (!  (=> (= (type xs@@5) RefType) (= (getPredWandId (list xs@@5)) 0))
 :qid |stdinbpl.312:15|
 :skolemid |31|
 :pattern ( (list xs@@5))
)))
(assert (forall ((Mask@@8 T@U) (o_2@@2 T@U) (f_4@@2 T@U) ) (! (let ((B@@7 (FieldTypeInv1 (type f_4@@2))))
(let ((A@@8 (FieldTypeInv0 (type f_4@@2))))
 (=> (and (and (and (= (type Mask@@8) (MapType1Type RefType realType)) (= (type o_2@@2) RefType)) (= (type f_4@@2) (FieldType A@@8 B@@7))) (GoodMask Mask@@8)) (and (>= (U_2_real (MapType1Select Mask@@8 o_2@@2 f_4@@2)) NoPerm) (=> (and (and (GoodMask Mask@@8) (not (IsPredicateField f_4@@2))) (not (IsWandField f_4@@2))) (<= (U_2_real (MapType1Select Mask@@8 o_2@@2 f_4@@2)) FullPerm))))))
 :qid |stdinbpl.128:22|
 :skolemid |16|
 :pattern ( (GoodMask Mask@@8) (MapType1Select Mask@@8 o_2@@2 f_4@@2))
)))
(assert (forall ((arg0@@31 T@U) (arg1@@12 T@U) ) (! (= (type (|PI_list#frame| arg0@@31 arg1@@12)) PredicateInstanceDomainTypeType)
 :qid |funType:PI_list#frame|
 :pattern ( (|PI_list#frame| arg0@@31 arg1@@12))
)))
(assert (forall ((Heap@@10 T@U) (Mask@@9 T@U) (xs@@6 T@U) ) (!  (=> (and (and (and (= (type Heap@@10) (MapType0Type RefType)) (= (type Mask@@9) (MapType1Type RefType realType))) (= (type xs@@6) RefType)) (state Heap@@10 Mask@@9)) (= (|PI_list'| Heap@@10 xs@@6) (|PI_list#frame| (MapType0Select Heap@@10 null (list xs@@6)) xs@@6)))
 :qid |stdinbpl.265:15|
 :skolemid |28|
 :pattern ( (state Heap@@10 Mask@@9) (|PI_list'| Heap@@10 xs@@6))
)))
(assert (forall ((o T@U) (f T@U) (Heap@@11 T@U) ) (!  (=> (and (and (and (= (type o) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap@@11) (MapType0Type RefType))) (U_2_bool (MapType0Select Heap@@11 o $allocated))) (U_2_bool (MapType0Select Heap@@11 (MapType0Select Heap@@11 o f) $allocated)))
 :qid |stdinbpl.31:15|
 :skolemid |0|
 :pattern ( (MapType0Select Heap@@11 o f))
)))
(assert (forall ((xs@@7 T@U) ) (!  (=> (= (type xs@@7) RefType) (= (PredicateMaskField (list xs@@7)) (|list#sm| xs@@7)))
 :qid |stdinbpl.304:15|
 :skolemid |29|
 :pattern ( (PredicateMaskField (list xs@@7)))
)))
(assert (forall ((Heap@@12 T@U) (o@@0 T@U) (f_3 T@U) (v T@U) ) (! (let ((B@@8 (type v)))
(let ((A@@9 (FieldTypeInv0 (type f_3))))
 (=> (and (and (= (type Heap@@12) (MapType0Type RefType)) (= (type o@@0) RefType)) (= (type f_3) (FieldType A@@9 B@@8))) (succHeap Heap@@12 (MapType0Store Heap@@12 o@@0 f_3 v)))))
 :qid |stdinbpl.78:22|
 :skolemid |9|
 :pattern ( (MapType0Store Heap@@12 o@@0 f_3 v))
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
 :qid |stdinbpl.168:25|
 :skolemid |20|
 :pattern ( (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))
)))
(assert (forall ((l1@@2 T@U) (l2@@0 T@U) (l3 T@U) ) (!  (=> (and (and (and (= (type l1@@2) PredicateInstanceDomainTypeType) (= (type l2@@0) PredicateInstanceDomainTypeType)) (= (type l3) PredicateInstanceDomainTypeType)) (and (nestedPredicates l1@@2 l2@@0) (nestedPredicates l2@@0 l3))) (nestedPredicates l1@@2 l3))
 :qid |stdinbpl.221:15|
 :skolemid |24|
 :pattern ( (nestedPredicates l1@@2 l2@@0) (nestedPredicates l2@@0 l3))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun Mask@5 () T@U)
(declare-fun Heap@1 () T@U)
(declare-fun xs@@8 () T@U)
(declare-fun Mask@0 () T@U)
(declare-fun Mask@10 () T@U)
(declare-fun perm@10 () Real)
(declare-fun Mask@12 () T@U)
(declare-fun Mask@11 () T@U)
(declare-fun perm@8 () Real)
(declare-fun Heap@7 () T@U)
(declare-fun ExhaleHeap@4 () T@U)
(declare-fun perm@9 () Real)
(declare-fun Heap@@13 () T@U)
(declare-fun Heap@5 () T@U)
(declare-fun newPMask@0 () T@U)
(declare-fun Heap@6 () T@U)
(declare-fun Heap@4 () T@U)
(declare-fun Heap@2 () T@U)
(declare-fun Heap@3 () T@U)
(declare-fun freshVersion@0 () T@U)
(declare-fun perm@7 () Real)
(declare-fun Mask@9 () T@U)
(declare-fun CombineFrames (T@U T@U) T@U)
(declare-fun FrameFragment (T@U) T@U)
(declare-fun Mask@8 () T@U)
(declare-fun Mask@7 () T@U)
(declare-fun perm@6 () Real)
(declare-fun perm@5 () Real)
(declare-fun list_16816818322@0 () T@U)
(declare-fun list__169813302@0 () T@U)
(declare-fun Mask@3 () T@U)
(declare-fun perm@4 () Real)
(declare-fun Mask@4 () T@U)
(declare-fun perm@3 () Real)
(declare-fun Mask@2 () T@U)
(declare-fun Heap@0 () T@U)
(declare-fun newVersion@0 () T@U)
(declare-fun perm@2 () Real)
(declare-fun PostHeap@0 () T@U)
(declare-fun perm@1 () Real)
(declare-fun AssumeFunctionsAbove () Int)
(declare-fun perm@0 () Real)
(declare-fun wildcard () Real)
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (= (type PostHeap@0) (MapType0Type RefType)) (= (type Mask@0) (MapType1Type RefType realType))) (= (type xs@@8) RefType)) (= (type Mask@10) (MapType1Type RefType realType))) (= (type Mask@12) (MapType1Type RefType realType))) (= (type Mask@11) (MapType1Type RefType realType))) (= (type Heap@7) (MapType0Type RefType))) (= (type ExhaleHeap@4) (MapType0Type RefType))) (= (type Heap@@13) (MapType0Type RefType))) (= (type Heap@5) (MapType0Type RefType))) (= (type newPMask@0) (MapType1Type RefType boolType))) (= (type Heap@6) (MapType0Type RefType))) (= (type Heap@4) (MapType0Type RefType))) (= (type Heap@2) (MapType0Type RefType))) (= (type Heap@1) (MapType0Type RefType))) (= (type Heap@3) (MapType0Type RefType))) (= (type freshVersion@0) FrameTypeType)) (= (type Mask@9) (MapType1Type RefType realType))) (forall ((arg0@@32 T@U) (arg1@@13 T@U) ) (! (= (type (CombineFrames arg0@@32 arg1@@13)) FrameTypeType)
 :qid |funType:CombineFrames|
 :pattern ( (CombineFrames arg0@@32 arg1@@13))
))) (forall ((arg0@@33 T@U) ) (! (= (type (FrameFragment arg0@@33)) FrameTypeType)
 :qid |funType:FrameFragment|
 :pattern ( (FrameFragment arg0@@33))
))) (= (type Mask@7) (MapType1Type RefType realType))) (= (type Mask@8) (MapType1Type RefType realType))) (= (type Mask@5) (MapType1Type RefType realType))) (= (type list_16816818322@0) PredicateInstanceDomainTypeType)) (= (type list__169813302@0) PredicateInstanceDomainTypeType)) (= (type Mask@4) (MapType1Type RefType realType))) (= (type Mask@3) (MapType1Type RefType realType))) (= (type Mask@2) (MapType1Type RefType realType))) (= (type Heap@0) (MapType0Type RefType))) (= (type newVersion@0) FrameTypeType)))
(set-info :boogie-vc-id predicateTest4)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 77) (let ((anon47_Then_correct  (=> (= (ControlFlow 0 56) (- 0 55)) (> (U_2_real (MapType1Select Mask@5 null (list (MapType0Select Heap@1 xs@@8 next)))) NoPerm))))
(let ((anon56_Then_correct  (=> (= (ControlFlow 0 30) (- 0 29)) (> (U_2_real (MapType1Select Mask@0 null (list xs@@8))) NoPerm))))
(let ((anon59_Then_correct  (=> (= (ControlFlow 0 26) (- 0 25)) (> (U_2_real (MapType1Select Mask@0 null (list xs@@8))) NoPerm))))
(let ((anon58_Then_correct  (=> (= (ControlFlow 0 24) (- 0 23)) (> (U_2_real (MapType1Select Mask@10 null (list xs@@8))) NoPerm))))
(let ((anon40_correct true))
(let ((anon61_Else_correct  (=> (and (= perm@10 NoPerm) (= (ControlFlow 0 12) 9)) anon40_correct)))
(let ((anon61_Then_correct  (=> (not (= perm@10 NoPerm)) (and (=> (= (ControlFlow 0 10) (- 0 11)) (<= perm@10 (U_2_real (MapType1Select Mask@12 null (list xs@@8))))) (=> (<= perm@10 (U_2_real (MapType1Select Mask@12 null (list xs@@8)))) (=> (= (ControlFlow 0 10) 9) anon40_correct))))))
(let ((anon38_correct  (=> (= Mask@11 (MapType1Store Mask@10 null (list xs@@8) (real_2_U (- (U_2_real (MapType1Select Mask@10 null (list xs@@8))) perm@8)))) (=> (and (IdenticalOnKnownLocations Heap@7 ExhaleHeap@4 Mask@11) (= perm@9 (/ (to_real 2) (to_real 3)))) (and (=> (= (ControlFlow 0 13) (- 0 15)) (>= perm@9 NoPerm)) (=> (>= perm@9 NoPerm) (=> (= Mask@12 (MapType1Store Mask@11 null (list xs@@8) (real_2_U (+ (U_2_real (MapType1Select Mask@11 null (list xs@@8))) perm@9)))) (=> (and (and (state ExhaleHeap@4 Mask@12) (state ExhaleHeap@4 Mask@12)) (and (state ExhaleHeap@4 Mask@12) (= perm@10 (/ (to_real 2) (to_real 3))))) (and (=> (= (ControlFlow 0 13) (- 0 14)) (>= perm@10 NoPerm)) (=> (>= perm@10 NoPerm) (and (=> (= (ControlFlow 0 13) 10) anon61_Then_correct) (=> (= (ControlFlow 0 13) 12) anon61_Else_correct))))))))))))
(let ((anon60_Else_correct  (=> (and (= perm@8 NoPerm) (= (ControlFlow 0 18) 13)) anon38_correct)))
(let ((anon60_Then_correct  (=> (not (= perm@8 NoPerm)) (and (=> (= (ControlFlow 0 16) (- 0 17)) (<= perm@8 (U_2_real (MapType1Select Mask@10 null (list xs@@8))))) (=> (<= perm@8 (U_2_real (MapType1Select Mask@10 null (list xs@@8)))) (=> (= (ControlFlow 0 16) 13) anon38_correct))))))
(let ((anon36_correct  (and (=> (= (ControlFlow 0 19) (- 0 21)) (and (decreasing (PI_list Heap@7 xs@@8) (PI_list Heap@@13 xs@@8)) (bounded (PI_list Heap@@13 xs@@8)))) (=> (and (decreasing (PI_list Heap@7 xs@@8) (PI_list Heap@@13 xs@@8)) (bounded (PI_list Heap@@13 xs@@8))) (=> (and (state Heap@7 Mask@10) (= perm@8 (/ (to_real 2) (to_real 3)))) (and (=> (= (ControlFlow 0 19) (- 0 20)) (>= perm@8 NoPerm)) (=> (>= perm@8 NoPerm) (and (=> (= (ControlFlow 0 19) 16) anon60_Then_correct) (=> (= (ControlFlow 0 19) 18) anon60_Else_correct)))))))))
(let ((anon57_Then_correct  (=> (not (and (decreasing (PI_list Heap@7 xs@@8) (PI_list Heap@@13 xs@@8)) (bounded (PI_list Heap@@13 xs@@8)))) (and (and (=> (= (ControlFlow 0 27) 24) anon58_Then_correct) (=> (= (ControlFlow 0 27) 26) anon59_Then_correct)) (=> (= (ControlFlow 0 27) 19) anon36_correct)))))
(let ((anon57_Else_correct  (=> (and (and (decreasing (PI_list Heap@7 xs@@8) (PI_list Heap@@13 xs@@8)) (bounded (PI_list Heap@@13 xs@@8))) (= (ControlFlow 0 22) 19)) anon36_correct)))
(let ((anon55_Then_correct  (=> (decreasing (PI_list Heap@7 xs@@8) (PI_list Heap@@13 xs@@8)) (and (and (=> (= (ControlFlow 0 31) 30) anon56_Then_correct) (=> (= (ControlFlow 0 31) 27) anon57_Then_correct)) (=> (= (ControlFlow 0 31) 22) anon57_Else_correct)))))
(let ((anon55_Else_correct  (=> (not (decreasing (PI_list Heap@7 xs@@8) (PI_list Heap@@13 xs@@8))) (and (=> (= (ControlFlow 0 28) 27) anon57_Then_correct) (=> (= (ControlFlow 0 28) 22) anon57_Else_correct)))))
(let ((anon54_Then_correct  (=> (= (ControlFlow 0 8) (- 0 7)) (> (U_2_real (MapType1Select Mask@0 null (list xs@@8))) NoPerm))))
(let ((anon53_Then_correct  (=> (= (ControlFlow 0 6) (- 0 5)) (> (U_2_real (MapType1Select Mask@10 null (list xs@@8))) NoPerm))))
(let ((anon24_correct  (=> (and (state Heap@7 Mask@10) (state Heap@7 Mask@10)) (and (and (and (=> (= (ControlFlow 0 32) 6) anon53_Then_correct) (=> (= (ControlFlow 0 32) 8) anon54_Then_correct)) (=> (= (ControlFlow 0 32) 31) anon55_Then_correct)) (=> (= (ControlFlow 0 32) 28) anon55_Else_correct)))))
(let ((anon52_Else_correct  (=> (= (MapType0Select Heap@5 xs@@8 next) null) (=> (and (= Heap@7 Heap@5) (= (ControlFlow 0 34) 32)) anon24_correct))))
(let ((anon52_Then_correct  (=> (not (= (MapType0Select Heap@5 xs@@8 next) null)) (=> (and (and (forall ((o_6 T@U) (f_10 T@U) ) (! (let ((B@@11 (FieldTypeInv1 (type f_10))))
(let ((A@@12 (FieldTypeInv0 (type f_10))))
 (=> (and (and (= (type o_6) RefType) (= (type f_10) (FieldType A@@12 B@@11))) (or (U_2_bool (MapType1Select (MapType0Select Heap@5 null (|list#sm| xs@@8)) o_6 f_10)) (U_2_bool (MapType1Select (MapType0Select Heap@5 null (|list#sm| (MapType0Select Heap@5 xs@@8 next))) o_6 f_10)))) (U_2_bool (MapType1Select newPMask@0 o_6 f_10)))))
 :qid |stdinbpl.1586:29|
 :skolemid |38|
 :pattern ( (MapType1Select newPMask@0 o_6 f_10))
)) (= Heap@6 (MapType0Store Heap@5 null (|list#sm| xs@@8) newPMask@0))) (and (= Heap@7 Heap@6) (= (ControlFlow 0 33) 32))) anon24_correct))))
(let ((anon22_correct  (=> (= Heap@5 (MapType0Store Heap@4 null (|list#sm| xs@@8) (MapType1Store (MapType0Select Heap@4 null (|list#sm| xs@@8)) xs@@8 next (bool_2_U true)))) (and (=> (= (ControlFlow 0 35) 33) anon52_Then_correct) (=> (= (ControlFlow 0 35) 34) anon52_Else_correct)))))
(let ((anon51_Else_correct  (=> (HasDirectPerm Mask@10 null (list xs@@8)) (=> (and (= Heap@4 Heap@1) (= (ControlFlow 0 37) 35)) anon22_correct))))
(let ((anon51_Then_correct  (=> (not (HasDirectPerm Mask@10 null (list xs@@8))) (=> (and (and (= Heap@2 (MapType0Store Heap@1 null (|list#sm| xs@@8) ZeroPMask)) (= Heap@3 (MapType0Store Heap@2 null (list xs@@8) freshVersion@0))) (and (= Heap@4 Heap@3) (= (ControlFlow 0 36) 35))) anon22_correct))))
(let ((anon20_correct  (=> (= perm@7 (/ (to_real 2) (to_real 3))) (and (=> (= (ControlFlow 0 38) (- 0 39)) (>= perm@7 NoPerm)) (=> (>= perm@7 NoPerm) (=> (= Mask@10 (MapType1Store Mask@9 null (list xs@@8) (real_2_U (+ (U_2_real (MapType1Select Mask@9 null (list xs@@8))) perm@7)))) (=> (and (and (state Heap@1 Mask@10) (state Heap@1 Mask@10)) (and (|list#trigger| Heap@1 (list xs@@8)) (= (MapType0Select Heap@1 null (list xs@@8)) (CombineFrames (FrameFragment (MapType0Select Heap@1 xs@@8 next)) (FrameFragment (ite (not (= (MapType0Select Heap@1 xs@@8 next) null)) (MapType0Select Heap@1 null (list (MapType0Select Heap@1 xs@@8 next))) EmptyFrame)))))) (and (=> (= (ControlFlow 0 38) 36) anon51_Then_correct) (=> (= (ControlFlow 0 38) 37) anon51_Else_correct)))))))))
(let ((anon19_correct  (=> (and (and (= Mask@8 (MapType1Store Mask@7 null (list (MapType0Select Heap@1 xs@@8 next)) (real_2_U (- (U_2_real (MapType1Select Mask@7 null (list (MapType0Select Heap@1 xs@@8 next)))) perm@6)))) (InsidePredicate (list xs@@8) (MapType0Select Heap@1 null (list xs@@8)) (list (MapType0Select Heap@1 xs@@8 next)) (MapType0Select Heap@1 null (list (MapType0Select Heap@1 xs@@8 next))))) (and (= Mask@9 Mask@8) (= (ControlFlow 0 41) 38))) anon20_correct)))
(let ((anon50_Else_correct  (=> (and (= perm@6 NoPerm) (= (ControlFlow 0 44) 41)) anon19_correct)))
(let ((anon50_Then_correct  (=> (not (= perm@6 NoPerm)) (and (=> (= (ControlFlow 0 42) (- 0 43)) (<= perm@6 (U_2_real (MapType1Select Mask@7 null (list (MapType0Select Heap@1 xs@@8 next)))))) (=> (<= perm@6 (U_2_real (MapType1Select Mask@7 null (list (MapType0Select Heap@1 xs@@8 next))))) (=> (= (ControlFlow 0 42) 41) anon19_correct))))))
(let ((anon49_Then_correct  (=> (and (not (= (MapType0Select Heap@1 xs@@8 next) null)) (= perm@6 (* FullPerm (/ (to_real 2) (to_real 3))))) (and (=> (= (ControlFlow 0 45) (- 0 46)) (>= perm@6 NoPerm)) (=> (>= perm@6 NoPerm) (and (=> (= (ControlFlow 0 45) 42) anon50_Then_correct) (=> (= (ControlFlow 0 45) 44) anon50_Else_correct)))))))
(let ((anon49_Else_correct  (=> (= (MapType0Select Heap@1 xs@@8 next) null) (=> (and (= Mask@9 Mask@7) (= (ControlFlow 0 40) 38)) anon20_correct))))
(let ((anon16_correct  (=> (= Mask@7 (MapType1Store Mask@5 xs@@8 next (real_2_U (- (U_2_real (MapType1Select Mask@5 xs@@8 next)) perm@5)))) (and (=> (= (ControlFlow 0 47) 45) anon49_Then_correct) (=> (= (ControlFlow 0 47) 40) anon49_Else_correct)))))
(let ((anon48_Else_correct  (=> (and (= perm@5 NoPerm) (= (ControlFlow 0 50) 47)) anon16_correct)))
(let ((anon48_Then_correct  (=> (not (= perm@5 NoPerm)) (and (=> (= (ControlFlow 0 48) (- 0 49)) (<= perm@5 (U_2_real (MapType1Select Mask@5 xs@@8 next)))) (=> (<= perm@5 (U_2_real (MapType1Select Mask@5 xs@@8 next))) (=> (= (ControlFlow 0 48) 47) anon16_correct))))))
(let ((anon14_correct  (=> (state Heap@1 Mask@5) (and (=> (= (ControlFlow 0 51) (- 0 53)) (HasDirectPerm Mask@5 xs@@8 next)) (=> (HasDirectPerm Mask@5 xs@@8 next) (=> (and (state Heap@1 Mask@5) (= perm@5 (* FullPerm (/ (to_real 2) (to_real 3))))) (and (=> (= (ControlFlow 0 51) (- 0 52)) (>= perm@5 NoPerm)) (=> (>= perm@5 NoPerm) (and (=> (= (ControlFlow 0 51) 48) anon48_Then_correct) (=> (= (ControlFlow 0 51) 50) anon48_Else_correct))))))))))
(let ((anon47_Else_correct  (=> (and (= list_16816818322@0 (PI_list Heap@1 (MapType0Select Heap@1 xs@@8 next))) (state Heap@1 Mask@5)) (=> (and (and (nestedPredicates list_16816818322@0 list__169813302@0) (state Heap@1 Mask@5)) (and (state Heap@1 Mask@5) (= (ControlFlow 0 57) 51))) anon14_correct))))
(let ((anon46_Then_correct  (=> (not (= (MapType0Select Heap@1 xs@@8 next) null)) (and (=> (= (ControlFlow 0 58) (- 0 59)) (HasDirectPerm Mask@5 xs@@8 next)) (=> (HasDirectPerm Mask@5 xs@@8 next) (and (=> (= (ControlFlow 0 58) 56) anon47_Then_correct) (=> (= (ControlFlow 0 58) 57) anon47_Else_correct)))))))
(let ((anon46_Else_correct  (=> (and (= (MapType0Select Heap@1 xs@@8 next) null) (= (ControlFlow 0 54) 51)) anon14_correct)))
(let ((anon10_correct  (=> (and (state Heap@1 Mask@5) (state Heap@1 Mask@5)) (and (=> (= (ControlFlow 0 60) (- 0 61)) (HasDirectPerm Mask@5 xs@@8 next)) (=> (HasDirectPerm Mask@5 xs@@8 next) (and (=> (= (ControlFlow 0 60) 58) anon46_Then_correct) (=> (= (ControlFlow 0 60) 54) anon46_Else_correct)))))))
(let ((anon45_Else_correct  (=> (= (MapType0Select Heap@1 xs@@8 next) null) (=> (and (= Mask@5 Mask@3) (= (ControlFlow 0 64) 60)) anon10_correct))))
(let ((anon45_Then_correct  (=> (and (not (= (MapType0Select Heap@1 xs@@8 next) null)) (= perm@4 (* FullPerm (/ (to_real 2) (to_real 3))))) (and (=> (= (ControlFlow 0 62) (- 0 63)) (>= perm@4 NoPerm)) (=> (>= perm@4 NoPerm) (=> (= Mask@4 (MapType1Store Mask@3 null (list (MapType0Select Heap@1 xs@@8 next)) (real_2_U (+ (U_2_real (MapType1Select Mask@3 null (list (MapType0Select Heap@1 xs@@8 next)))) perm@4)))) (=> (and (and (InsidePredicate (list xs@@8) (MapType0Select Heap@1 null (list xs@@8)) (list (MapType0Select Heap@1 xs@@8 next)) (MapType0Select Heap@1 null (list (MapType0Select Heap@1 xs@@8 next)))) (state Heap@1 Mask@4)) (and (= Mask@5 Mask@4) (= (ControlFlow 0 62) 60))) anon10_correct)))))))
(let ((anon8_correct  (=> (= perm@3 (* FullPerm (/ (to_real 2) (to_real 3)))) (and (=> (= (ControlFlow 0 65) (- 0 66)) (>= perm@3 NoPerm)) (=> (>= perm@3 NoPerm) (=> (=> (> perm@3 NoPerm) (not (= xs@@8 null))) (=> (and (= Mask@3 (MapType1Store Mask@2 xs@@8 next (real_2_U (+ (U_2_real (MapType1Select Mask@2 xs@@8 next)) perm@3)))) (state Heap@1 Mask@3)) (and (=> (= (ControlFlow 0 65) 62) anon45_Then_correct) (=> (= (ControlFlow 0 65) 64) anon45_Else_correct)))))))))
(let ((anon44_Else_correct  (=> (HasDirectPerm Mask@2 null (list xs@@8)) (=> (and (= Heap@1 Heap@@13) (= (ControlFlow 0 68) 65)) anon8_correct))))
(let ((anon44_Then_correct  (=> (and (and (not (HasDirectPerm Mask@2 null (list xs@@8))) (= Heap@0 (MapType0Store Heap@@13 null (list xs@@8) newVersion@0))) (and (= Heap@1 Heap@0) (= (ControlFlow 0 67) 65))) anon8_correct)))
(let ((anon6_correct  (=> (= Mask@2 (MapType1Store Mask@0 null (list xs@@8) (real_2_U (- (U_2_real (MapType1Select Mask@0 null (list xs@@8))) perm@2)))) (and (=> (= (ControlFlow 0 69) 67) anon44_Then_correct) (=> (= (ControlFlow 0 69) 68) anon44_Else_correct)))))
(let ((anon43_Else_correct  (=> (and (= perm@2 NoPerm) (= (ControlFlow 0 72) 69)) anon6_correct)))
(let ((anon43_Then_correct  (=> (not (= perm@2 NoPerm)) (and (=> (= (ControlFlow 0 70) (- 0 71)) (<= perm@2 (U_2_real (MapType1Select Mask@0 null (list xs@@8))))) (=> (<= perm@2 (U_2_real (MapType1Select Mask@0 null (list xs@@8)))) (=> (= (ControlFlow 0 70) 69) anon6_correct))))))
(let ((anon42_Else_correct  (=> (= list__169813302@0 (PI_list Heap@@13 xs@@8)) (=> (and (and (state Heap@@13 Mask@0) (|list#trigger| Heap@@13 (list xs@@8))) (and (= (MapType0Select Heap@@13 null (list xs@@8)) (CombineFrames (FrameFragment (MapType0Select Heap@@13 xs@@8 next)) (FrameFragment (ite (not (= (MapType0Select Heap@@13 xs@@8 next) null)) (MapType0Select Heap@@13 null (list (MapType0Select Heap@@13 xs@@8 next))) EmptyFrame)))) (= perm@2 (/ (to_real 2) (to_real 3))))) (and (=> (= (ControlFlow 0 73) (- 0 74)) (>= perm@2 NoPerm)) (=> (>= perm@2 NoPerm) (and (=> (= (ControlFlow 0 73) 70) anon43_Then_correct) (=> (= (ControlFlow 0 73) 72) anon43_Else_correct))))))))
(let ((anon42_Then_correct  (=> (= (ControlFlow 0 4) (- 0 3)) (> (U_2_real (MapType1Select Mask@0 null (list xs@@8))) NoPerm))))
(let ((anon41_Then_correct  (=> (state PostHeap@0 ZeroMask) (=> (and (= perm@1 (/ (to_real 2) (to_real 3))) (= (ControlFlow 0 2) (- 0 1))) (>= perm@1 NoPerm)))))
(let ((anon0_correct  (=> (and (and (state Heap@@13 ZeroMask) (= AssumeFunctionsAbove (- 0 1))) (and (U_2_bool (MapType0Select Heap@@13 xs@@8 $allocated)) (= perm@0 (/ (to_real 2) (to_real 3))))) (and (=> (= (ControlFlow 0 75) (- 0 76)) (>= perm@0 NoPerm)) (=> (>= perm@0 NoPerm) (=> (= Mask@0 (MapType1Store ZeroMask null (list xs@@8) (real_2_U (+ (U_2_real (MapType1Select ZeroMask null (list xs@@8))) perm@0)))) (=> (and (state Heap@@13 Mask@0) (state Heap@@13 Mask@0)) (and (and (=> (= (ControlFlow 0 75) 2) anon41_Then_correct) (=> (= (ControlFlow 0 75) 4) anon42_Then_correct)) (=> (= (ControlFlow 0 75) 73) anon42_Else_correct)))))))))
(let ((PreconditionGeneratedEntry_correct  (=> (and (and (> wildcard NoPerm) true) (= (ControlFlow 0 77) 75)) anon0_correct)))
PreconditionGeneratedEntry_correct)))))))))))))))))))))))))))))))))))))))))))))))))))
))
(check-sat)
(get-info :reason-unknown)
(assert (not (= (ControlFlow 0 19) (- 21))))
(check-sat)
(pop 1)
; Invalid
(get-info :rlimit)
