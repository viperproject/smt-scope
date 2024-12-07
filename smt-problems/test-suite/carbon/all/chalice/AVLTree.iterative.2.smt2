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
(declare-fun root1 () T@U)
(declare-fun key () T@U)
(declare-fun left () T@U)
(declare-fun right () T@U)
(declare-fun parent () T@U)
(declare-fun leftDown () T@U)
(declare-fun root () T@U)
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
(declare-fun valid1 (T@U) T@U)
(declare-fun PredicateType_valid1Type () T@T)
(declare-fun valid (T@U) T@U)
(declare-fun PredicateType_validType () T@T)
(declare-fun validRest (T@U) T@U)
(declare-fun PredicateType_validRestType () T@T)
(declare-fun rightValid (T@U) T@U)
(declare-fun PredicateType_rightValidType () T@T)
(declare-fun leftValid (T@U) T@U)
(declare-fun PredicateType_leftValidType () T@T)
(declare-fun leftOpen (T@U) T@U)
(declare-fun PredicateType_leftOpenType () T@T)
(declare-fun rightOpen (T@U) T@U)
(declare-fun PredicateType_rightOpenType () T@T)
(declare-fun udParentValid (T@U) T@U)
(declare-fun PredicateType_udParentValidType () T@T)
(declare-fun udValid (T@U) T@U)
(declare-fun PredicateType_udValidType () T@T)
(declare-fun |valid1#trigger| (T@U T@U) Bool)
(declare-fun |valid1#everUsed| (T@U) Bool)
(declare-fun |valid#trigger| (T@U T@U) Bool)
(declare-fun |valid#everUsed| (T@U) Bool)
(declare-fun |validRest#trigger| (T@U T@U) Bool)
(declare-fun |validRest#everUsed| (T@U) Bool)
(declare-fun |rightValid#trigger| (T@U T@U) Bool)
(declare-fun |rightValid#everUsed| (T@U) Bool)
(declare-fun |leftValid#trigger| (T@U T@U) Bool)
(declare-fun |leftValid#everUsed| (T@U) Bool)
(declare-fun |leftOpen#trigger| (T@U T@U) Bool)
(declare-fun |leftOpen#everUsed| (T@U) Bool)
(declare-fun |rightOpen#trigger| (T@U T@U) Bool)
(declare-fun |rightOpen#everUsed| (T@U) Bool)
(declare-fun |udParentValid#trigger| (T@U T@U) Bool)
(declare-fun |udParentValid#everUsed| (T@U) Bool)
(declare-fun |udValid#trigger| (T@U T@U) Bool)
(declare-fun |udValid#everUsed| (T@U) Bool)
(declare-fun |valid1#sm| (T@U) T@U)
(declare-fun |valid#sm| (T@U) T@U)
(declare-fun |validRest#sm| (T@U) T@U)
(declare-fun |rightValid#sm| (T@U) T@U)
(declare-fun |leftValid#sm| (T@U) T@U)
(declare-fun |leftOpen#sm| (T@U) T@U)
(declare-fun |rightOpen#sm| (T@U) T@U)
(declare-fun |udParentValid#sm| (T@U) T@U)
(declare-fun |udValid#sm| (T@U) T@U)
(declare-fun dummyHeap () T@U)
(declare-fun ZeroMask () T@U)
(declare-fun InsidePredicate (T@U T@U T@U T@U) Bool)
(declare-fun sumMask (T@U T@U T@U) Bool)
(declare-fun ConditionalFrame (Real T@U) T@U)
(declare-fun EmptyFrame () T@U)
(declare-fun NoPerm () Real)
(declare-fun getPredWandId (T@U) Int)
(declare-fun FullPerm () Real)
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
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (forall ((arg0@@11 T@T) (arg1 T@T) ) (! (= (Ctor (FieldType arg0@@11 arg1)) 6)
 :qid |ctor:FieldType|
)) (forall ((arg0@@12 T@T) (arg1@@0 T@T) ) (! (= (FieldTypeInv0 (FieldType arg0@@12 arg1@@0)) arg0@@12)
 :qid |typeInv:FieldTypeInv0|
 :pattern ( (FieldType arg0@@12 arg1@@0))
))) (forall ((arg0@@13 T@T) (arg1@@1 T@T) ) (! (= (FieldTypeInv1 (FieldType arg0@@13 arg1@@1)) arg1@@1)
 :qid |typeInv:FieldTypeInv1|
 :pattern ( (FieldType arg0@@13 arg1@@1))
))) (= (Ctor NormalFieldType) 7)) (= (type $allocated) (FieldType NormalFieldType boolType))) (= (Ctor RefType) 8)) (= (type root1) (FieldType NormalFieldType RefType))) (= (type key) (FieldType NormalFieldType intType))) (= (type left) (FieldType NormalFieldType RefType))) (= (type right) (FieldType NormalFieldType RefType))) (= (type parent) (FieldType NormalFieldType RefType))) (= (type leftDown) (FieldType NormalFieldType boolType))) (= (type root) (FieldType NormalFieldType RefType))))
(assert (distinct $allocated root1 key left right parent leftDown root)
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
(assert  (and (= (Ctor PredicateType_valid1Type) 12) (forall ((arg0@@25 T@U) ) (! (= (type (valid1 arg0@@25)) (FieldType PredicateType_valid1Type FrameTypeType))
 :qid |funType:valid1|
 :pattern ( (valid1 arg0@@25))
))))
(assert (forall ((this T@U) ) (!  (=> (= (type this) RefType) (IsPredicateField (valid1 this)))
 :qid |stdinbpl.212:15|
 :skolemid |23|
 :pattern ( (valid1 this))
)))
(assert  (and (= (Ctor PredicateType_validType) 13) (forall ((arg0@@26 T@U) ) (! (= (type (valid arg0@@26)) (FieldType PredicateType_validType FrameTypeType))
 :qid |funType:valid|
 :pattern ( (valid arg0@@26))
))))
(assert (forall ((this@@0 T@U) ) (!  (=> (= (type this@@0) RefType) (IsPredicateField (valid this@@0)))
 :qid |stdinbpl.336:15|
 :skolemid |29|
 :pattern ( (valid this@@0))
)))
(assert  (and (= (Ctor PredicateType_validRestType) 14) (forall ((arg0@@27 T@U) ) (! (= (type (validRest arg0@@27)) (FieldType PredicateType_validRestType FrameTypeType))
 :qid |funType:validRest|
 :pattern ( (validRest arg0@@27))
))))
(assert (forall ((this@@1 T@U) ) (!  (=> (= (type this@@1) RefType) (IsPredicateField (validRest this@@1)))
 :qid |stdinbpl.394:15|
 :skolemid |35|
 :pattern ( (validRest this@@1))
)))
(assert  (and (= (Ctor PredicateType_rightValidType) 15) (forall ((arg0@@28 T@U) ) (! (= (type (rightValid arg0@@28)) (FieldType PredicateType_rightValidType FrameTypeType))
 :qid |funType:rightValid|
 :pattern ( (rightValid arg0@@28))
))))
(assert (forall ((this@@2 T@U) ) (!  (=> (= (type this@@2) RefType) (IsPredicateField (rightValid this@@2)))
 :qid |stdinbpl.480:15|
 :skolemid |41|
 :pattern ( (rightValid this@@2))
)))
(assert  (and (= (Ctor PredicateType_leftValidType) 16) (forall ((arg0@@29 T@U) ) (! (= (type (leftValid arg0@@29)) (FieldType PredicateType_leftValidType FrameTypeType))
 :qid |funType:leftValid|
 :pattern ( (leftValid arg0@@29))
))))
(assert (forall ((this@@3 T@U) ) (!  (=> (= (type this@@3) RefType) (IsPredicateField (leftValid this@@3)))
 :qid |stdinbpl.612:15|
 :skolemid |47|
 :pattern ( (leftValid this@@3))
)))
(assert  (and (= (Ctor PredicateType_leftOpenType) 17) (forall ((arg0@@30 T@U) ) (! (= (type (leftOpen arg0@@30)) (FieldType PredicateType_leftOpenType FrameTypeType))
 :qid |funType:leftOpen|
 :pattern ( (leftOpen arg0@@30))
))))
(assert (forall ((this@@4 T@U) ) (!  (=> (= (type this@@4) RefType) (IsPredicateField (leftOpen this@@4)))
 :qid |stdinbpl.744:15|
 :skolemid |53|
 :pattern ( (leftOpen this@@4))
)))
(assert  (and (= (Ctor PredicateType_rightOpenType) 18) (forall ((arg0@@31 T@U) ) (! (= (type (rightOpen arg0@@31)) (FieldType PredicateType_rightOpenType FrameTypeType))
 :qid |funType:rightOpen|
 :pattern ( (rightOpen arg0@@31))
))))
(assert (forall ((this@@5 T@U) ) (!  (=> (= (type this@@5) RefType) (IsPredicateField (rightOpen this@@5)))
 :qid |stdinbpl.834:15|
 :skolemid |59|
 :pattern ( (rightOpen this@@5))
)))
(assert  (and (= (Ctor PredicateType_udParentValidType) 19) (forall ((arg0@@32 T@U) ) (! (= (type (udParentValid arg0@@32)) (FieldType PredicateType_udParentValidType FrameTypeType))
 :qid |funType:udParentValid|
 :pattern ( (udParentValid arg0@@32))
))))
(assert (forall ((this@@6 T@U) ) (!  (=> (= (type this@@6) RefType) (IsPredicateField (udParentValid this@@6)))
 :qid |stdinbpl.924:15|
 :skolemid |65|
 :pattern ( (udParentValid this@@6))
)))
(assert  (and (= (Ctor PredicateType_udValidType) 20) (forall ((arg0@@33 T@U) ) (! (= (type (udValid arg0@@33)) (FieldType PredicateType_udValidType FrameTypeType))
 :qid |funType:udValid|
 :pattern ( (udValid arg0@@33))
))))
(assert (forall ((this@@7 T@U) ) (!  (=> (= (type this@@7) RefType) (IsPredicateField (udValid this@@7)))
 :qid |stdinbpl.1122:15|
 :skolemid |71|
 :pattern ( (udValid this@@7))
)))
(assert (forall ((Heap@@2 T@U) (this@@8 T@U) ) (!  (=> (and (= (type Heap@@2) (MapType0Type RefType)) (= (type this@@8) RefType)) (|valid1#everUsed| (valid1 this@@8)))
 :qid |stdinbpl.231:15|
 :skolemid |27|
 :pattern ( (|valid1#trigger| Heap@@2 (valid1 this@@8)))
)))
(assert (forall ((Heap@@3 T@U) (this@@9 T@U) ) (!  (=> (and (= (type Heap@@3) (MapType0Type RefType)) (= (type this@@9) RefType)) (|valid#everUsed| (valid this@@9)))
 :qid |stdinbpl.355:15|
 :skolemid |33|
 :pattern ( (|valid#trigger| Heap@@3 (valid this@@9)))
)))
(assert (forall ((Heap@@4 T@U) (this@@10 T@U) ) (!  (=> (and (= (type Heap@@4) (MapType0Type RefType)) (= (type this@@10) RefType)) (|validRest#everUsed| (validRest this@@10)))
 :qid |stdinbpl.413:15|
 :skolemid |39|
 :pattern ( (|validRest#trigger| Heap@@4 (validRest this@@10)))
)))
(assert (forall ((Heap@@5 T@U) (this@@11 T@U) ) (!  (=> (and (= (type Heap@@5) (MapType0Type RefType)) (= (type this@@11) RefType)) (|rightValid#everUsed| (rightValid this@@11)))
 :qid |stdinbpl.499:15|
 :skolemid |45|
 :pattern ( (|rightValid#trigger| Heap@@5 (rightValid this@@11)))
)))
(assert (forall ((Heap@@6 T@U) (this@@12 T@U) ) (!  (=> (and (= (type Heap@@6) (MapType0Type RefType)) (= (type this@@12) RefType)) (|leftValid#everUsed| (leftValid this@@12)))
 :qid |stdinbpl.631:15|
 :skolemid |51|
 :pattern ( (|leftValid#trigger| Heap@@6 (leftValid this@@12)))
)))
(assert (forall ((Heap@@7 T@U) (this@@13 T@U) ) (!  (=> (and (= (type Heap@@7) (MapType0Type RefType)) (= (type this@@13) RefType)) (|leftOpen#everUsed| (leftOpen this@@13)))
 :qid |stdinbpl.763:15|
 :skolemid |57|
 :pattern ( (|leftOpen#trigger| Heap@@7 (leftOpen this@@13)))
)))
(assert (forall ((Heap@@8 T@U) (this@@14 T@U) ) (!  (=> (and (= (type Heap@@8) (MapType0Type RefType)) (= (type this@@14) RefType)) (|rightOpen#everUsed| (rightOpen this@@14)))
 :qid |stdinbpl.853:15|
 :skolemid |63|
 :pattern ( (|rightOpen#trigger| Heap@@8 (rightOpen this@@14)))
)))
(assert (forall ((Heap@@9 T@U) (this@@15 T@U) ) (!  (=> (and (= (type Heap@@9) (MapType0Type RefType)) (= (type this@@15) RefType)) (|udParentValid#everUsed| (udParentValid this@@15)))
 :qid |stdinbpl.943:15|
 :skolemid |69|
 :pattern ( (|udParentValid#trigger| Heap@@9 (udParentValid this@@15)))
)))
(assert (forall ((Heap@@10 T@U) (this@@16 T@U) ) (!  (=> (and (= (type Heap@@10) (MapType0Type RefType)) (= (type this@@16) RefType)) (|udValid#everUsed| (udValid this@@16)))
 :qid |stdinbpl.1141:15|
 :skolemid |75|
 :pattern ( (|udValid#trigger| Heap@@10 (udValid this@@16)))
)))
(assert (forall ((Heap@@11 T@U) (ExhaleHeap@@1 T@U) (Mask@@2 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@11) (MapType0Type RefType)) (= (type ExhaleHeap@@1) (MapType0Type RefType))) (= (type Mask@@2) (MapType1Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@11 ExhaleHeap@@1 Mask@@2)) (U_2_bool (MapType0Select Heap@@11 o_1 $allocated))) (U_2_bool (MapType0Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.73:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@11 ExhaleHeap@@1 Mask@@2) (MapType0Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert (forall ((this@@17 T@U) (this2 T@U) ) (!  (=> (and (and (= (type this@@17) RefType) (= (type this2) RefType)) (= (valid1 this@@17) (valid1 this2))) (= this@@17 this2))
 :qid |stdinbpl.222:15|
 :skolemid |25|
 :pattern ( (valid1 this@@17) (valid1 this2))
)))
(assert (forall ((arg0@@34 T@U) ) (! (= (type (|valid1#sm| arg0@@34)) (FieldType PredicateType_valid1Type (MapType1Type RefType boolType)))
 :qid |funType:valid1#sm|
 :pattern ( (|valid1#sm| arg0@@34))
)))
(assert (forall ((this@@18 T@U) (this2@@0 T@U) ) (!  (=> (and (and (= (type this@@18) RefType) (= (type this2@@0) RefType)) (= (|valid1#sm| this@@18) (|valid1#sm| this2@@0))) (= this@@18 this2@@0))
 :qid |stdinbpl.226:15|
 :skolemid |26|
 :pattern ( (|valid1#sm| this@@18) (|valid1#sm| this2@@0))
)))
(assert (forall ((this@@19 T@U) (this2@@1 T@U) ) (!  (=> (and (and (= (type this@@19) RefType) (= (type this2@@1) RefType)) (= (valid this@@19) (valid this2@@1))) (= this@@19 this2@@1))
 :qid |stdinbpl.346:15|
 :skolemid |31|
 :pattern ( (valid this@@19) (valid this2@@1))
)))
(assert (forall ((arg0@@35 T@U) ) (! (= (type (|valid#sm| arg0@@35)) (FieldType PredicateType_validType (MapType1Type RefType boolType)))
 :qid |funType:valid#sm|
 :pattern ( (|valid#sm| arg0@@35))
)))
(assert (forall ((this@@20 T@U) (this2@@2 T@U) ) (!  (=> (and (and (= (type this@@20) RefType) (= (type this2@@2) RefType)) (= (|valid#sm| this@@20) (|valid#sm| this2@@2))) (= this@@20 this2@@2))
 :qid |stdinbpl.350:15|
 :skolemid |32|
 :pattern ( (|valid#sm| this@@20) (|valid#sm| this2@@2))
)))
(assert (forall ((this@@21 T@U) (this2@@3 T@U) ) (!  (=> (and (and (= (type this@@21) RefType) (= (type this2@@3) RefType)) (= (validRest this@@21) (validRest this2@@3))) (= this@@21 this2@@3))
 :qid |stdinbpl.404:15|
 :skolemid |37|
 :pattern ( (validRest this@@21) (validRest this2@@3))
)))
(assert (forall ((arg0@@36 T@U) ) (! (= (type (|validRest#sm| arg0@@36)) (FieldType PredicateType_validRestType (MapType1Type RefType boolType)))
 :qid |funType:validRest#sm|
 :pattern ( (|validRest#sm| arg0@@36))
)))
(assert (forall ((this@@22 T@U) (this2@@4 T@U) ) (!  (=> (and (and (= (type this@@22) RefType) (= (type this2@@4) RefType)) (= (|validRest#sm| this@@22) (|validRest#sm| this2@@4))) (= this@@22 this2@@4))
 :qid |stdinbpl.408:15|
 :skolemid |38|
 :pattern ( (|validRest#sm| this@@22) (|validRest#sm| this2@@4))
)))
(assert (forall ((this@@23 T@U) (this2@@5 T@U) ) (!  (=> (and (and (= (type this@@23) RefType) (= (type this2@@5) RefType)) (= (rightValid this@@23) (rightValid this2@@5))) (= this@@23 this2@@5))
 :qid |stdinbpl.490:15|
 :skolemid |43|
 :pattern ( (rightValid this@@23) (rightValid this2@@5))
)))
(assert (forall ((arg0@@37 T@U) ) (! (= (type (|rightValid#sm| arg0@@37)) (FieldType PredicateType_rightValidType (MapType1Type RefType boolType)))
 :qid |funType:rightValid#sm|
 :pattern ( (|rightValid#sm| arg0@@37))
)))
(assert (forall ((this@@24 T@U) (this2@@6 T@U) ) (!  (=> (and (and (= (type this@@24) RefType) (= (type this2@@6) RefType)) (= (|rightValid#sm| this@@24) (|rightValid#sm| this2@@6))) (= this@@24 this2@@6))
 :qid |stdinbpl.494:15|
 :skolemid |44|
 :pattern ( (|rightValid#sm| this@@24) (|rightValid#sm| this2@@6))
)))
(assert (forall ((this@@25 T@U) (this2@@7 T@U) ) (!  (=> (and (and (= (type this@@25) RefType) (= (type this2@@7) RefType)) (= (leftValid this@@25) (leftValid this2@@7))) (= this@@25 this2@@7))
 :qid |stdinbpl.622:15|
 :skolemid |49|
 :pattern ( (leftValid this@@25) (leftValid this2@@7))
)))
(assert (forall ((arg0@@38 T@U) ) (! (= (type (|leftValid#sm| arg0@@38)) (FieldType PredicateType_leftValidType (MapType1Type RefType boolType)))
 :qid |funType:leftValid#sm|
 :pattern ( (|leftValid#sm| arg0@@38))
)))
(assert (forall ((this@@26 T@U) (this2@@8 T@U) ) (!  (=> (and (and (= (type this@@26) RefType) (= (type this2@@8) RefType)) (= (|leftValid#sm| this@@26) (|leftValid#sm| this2@@8))) (= this@@26 this2@@8))
 :qid |stdinbpl.626:15|
 :skolemid |50|
 :pattern ( (|leftValid#sm| this@@26) (|leftValid#sm| this2@@8))
)))
(assert (forall ((this@@27 T@U) (this2@@9 T@U) ) (!  (=> (and (and (= (type this@@27) RefType) (= (type this2@@9) RefType)) (= (leftOpen this@@27) (leftOpen this2@@9))) (= this@@27 this2@@9))
 :qid |stdinbpl.754:15|
 :skolemid |55|
 :pattern ( (leftOpen this@@27) (leftOpen this2@@9))
)))
(assert (forall ((arg0@@39 T@U) ) (! (= (type (|leftOpen#sm| arg0@@39)) (FieldType PredicateType_leftOpenType (MapType1Type RefType boolType)))
 :qid |funType:leftOpen#sm|
 :pattern ( (|leftOpen#sm| arg0@@39))
)))
(assert (forall ((this@@28 T@U) (this2@@10 T@U) ) (!  (=> (and (and (= (type this@@28) RefType) (= (type this2@@10) RefType)) (= (|leftOpen#sm| this@@28) (|leftOpen#sm| this2@@10))) (= this@@28 this2@@10))
 :qid |stdinbpl.758:15|
 :skolemid |56|
 :pattern ( (|leftOpen#sm| this@@28) (|leftOpen#sm| this2@@10))
)))
(assert (forall ((this@@29 T@U) (this2@@11 T@U) ) (!  (=> (and (and (= (type this@@29) RefType) (= (type this2@@11) RefType)) (= (rightOpen this@@29) (rightOpen this2@@11))) (= this@@29 this2@@11))
 :qid |stdinbpl.844:15|
 :skolemid |61|
 :pattern ( (rightOpen this@@29) (rightOpen this2@@11))
)))
(assert (forall ((arg0@@40 T@U) ) (! (= (type (|rightOpen#sm| arg0@@40)) (FieldType PredicateType_rightOpenType (MapType1Type RefType boolType)))
 :qid |funType:rightOpen#sm|
 :pattern ( (|rightOpen#sm| arg0@@40))
)))
(assert (forall ((this@@30 T@U) (this2@@12 T@U) ) (!  (=> (and (and (= (type this@@30) RefType) (= (type this2@@12) RefType)) (= (|rightOpen#sm| this@@30) (|rightOpen#sm| this2@@12))) (= this@@30 this2@@12))
 :qid |stdinbpl.848:15|
 :skolemid |62|
 :pattern ( (|rightOpen#sm| this@@30) (|rightOpen#sm| this2@@12))
)))
(assert (forall ((this@@31 T@U) (this2@@13 T@U) ) (!  (=> (and (and (= (type this@@31) RefType) (= (type this2@@13) RefType)) (= (udParentValid this@@31) (udParentValid this2@@13))) (= this@@31 this2@@13))
 :qid |stdinbpl.934:15|
 :skolemid |67|
 :pattern ( (udParentValid this@@31) (udParentValid this2@@13))
)))
(assert (forall ((arg0@@41 T@U) ) (! (= (type (|udParentValid#sm| arg0@@41)) (FieldType PredicateType_udParentValidType (MapType1Type RefType boolType)))
 :qid |funType:udParentValid#sm|
 :pattern ( (|udParentValid#sm| arg0@@41))
)))
(assert (forall ((this@@32 T@U) (this2@@14 T@U) ) (!  (=> (and (and (= (type this@@32) RefType) (= (type this2@@14) RefType)) (= (|udParentValid#sm| this@@32) (|udParentValid#sm| this2@@14))) (= this@@32 this2@@14))
 :qid |stdinbpl.938:15|
 :skolemid |68|
 :pattern ( (|udParentValid#sm| this@@32) (|udParentValid#sm| this2@@14))
)))
(assert (forall ((this@@33 T@U) (this2@@15 T@U) ) (!  (=> (and (and (= (type this@@33) RefType) (= (type this2@@15) RefType)) (= (udValid this@@33) (udValid this2@@15))) (= this@@33 this2@@15))
 :qid |stdinbpl.1132:15|
 :skolemid |73|
 :pattern ( (udValid this@@33) (udValid this2@@15))
)))
(assert (forall ((arg0@@42 T@U) ) (! (= (type (|udValid#sm| arg0@@42)) (FieldType PredicateType_udValidType (MapType1Type RefType boolType)))
 :qid |funType:udValid#sm|
 :pattern ( (|udValid#sm| arg0@@42))
)))
(assert (forall ((this@@34 T@U) (this2@@16 T@U) ) (!  (=> (and (and (= (type this@@34) RefType) (= (type this2@@16) RefType)) (= (|udValid#sm| this@@34) (|udValid#sm| this2@@16))) (= this@@34 this2@@16))
 :qid |stdinbpl.1136:15|
 :skolemid |74|
 :pattern ( (|udValid#sm| this@@34) (|udValid#sm| this2@@16))
)))
(assert (forall ((Heap@@12 T@U) (ExhaleHeap@@2 T@U) (Mask@@3 T@U) (o_1@@0 T@U) (f_2 T@U) ) (! (let ((B@@1 (FieldTypeInv1 (type f_2))))
(let ((A@@1 (FieldTypeInv0 (type f_2))))
 (=> (and (and (and (and (and (and (= (type Heap@@12) (MapType0Type RefType)) (= (type ExhaleHeap@@2) (MapType0Type RefType))) (= (type Mask@@3) (MapType1Type RefType realType))) (= (type o_1@@0) RefType)) (= (type f_2) (FieldType A@@1 B@@1))) (IdenticalOnKnownLocations Heap@@12 ExhaleHeap@@2 Mask@@3)) (HasDirectPerm Mask@@3 o_1@@0 f_2)) (= (MapType0Select Heap@@12 o_1@@0 f_2) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2)))))
 :qid |stdinbpl.42:22|
 :skolemid |1|
 :pattern ( (IdenticalOnKnownLocations Heap@@12 ExhaleHeap@@2 Mask@@3) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2))
)))
(assert  (and (= (type dummyHeap) (MapType0Type RefType)) (= (type ZeroMask) (MapType1Type RefType realType))))
(assert (state dummyHeap ZeroMask))
(assert (forall ((p T@U) (v_1 T@U) (w T@U) ) (! (let ((A@@2 (FieldTypeInv0 (type p))))
 (=> (and (and (= (type p) (FieldType A@@2 FrameTypeType)) (= (type v_1) FrameTypeType)) (= (type w) FrameTypeType)) (not (InsidePredicate p v_1 p w))))
 :qid |stdinbpl.170:19|
 :skolemid |21|
 :pattern ( (InsidePredicate p v_1 p w))
)))
(assert  (not (IsPredicateField root1)))
(assert  (not (IsWandField root1)))
(assert  (not (IsPredicateField key)))
(assert  (not (IsWandField key)))
(assert  (not (IsPredicateField left)))
(assert  (not (IsWandField left)))
(assert  (not (IsPredicateField right)))
(assert  (not (IsWandField right)))
(assert  (not (IsPredicateField parent)))
(assert  (not (IsWandField parent)))
(assert  (not (IsPredicateField leftDown)))
(assert  (not (IsWandField leftDown)))
(assert  (not (IsPredicateField root)))
(assert  (not (IsWandField root)))
(assert (forall ((Heap@@13 T@U) (ExhaleHeap@@3 T@U) (Mask@@4 T@U) ) (!  (=> (and (and (and (= (type Heap@@13) (MapType0Type RefType)) (= (type ExhaleHeap@@3) (MapType0Type RefType))) (= (type Mask@@4) (MapType1Type RefType realType))) (IdenticalOnKnownLocations Heap@@13 ExhaleHeap@@3 Mask@@4)) (succHeap Heap@@13 ExhaleHeap@@3))
 :qid |stdinbpl.83:15|
 :skolemid |10|
 :pattern ( (IdenticalOnKnownLocations Heap@@13 ExhaleHeap@@3 Mask@@4))
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
(assert  (and (forall ((arg0@@43 Real) (arg1@@9 T@U) ) (! (= (type (ConditionalFrame arg0@@43 arg1@@9)) FrameTypeType)
 :qid |funType:ConditionalFrame|
 :pattern ( (ConditionalFrame arg0@@43 arg1@@9))
)) (= (type EmptyFrame) FrameTypeType)))
(assert (forall ((p@@0 Real) (f_6 T@U) ) (!  (=> (= (type f_6) FrameTypeType) (= (ConditionalFrame p@@0 f_6) (ite (> p@@0 0.0) f_6 EmptyFrame)))
 :qid |stdinbpl.158:15|
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
(assert (forall ((Heap@@14 T@U) (ExhaleHeap@@4 T@U) (Mask@@6 T@U) (pm_f@@1 T@U) ) (! (let ((C@@1 (FieldTypeInv0 (type pm_f@@1))))
 (=> (and (and (and (and (and (= (type Heap@@14) (MapType0Type RefType)) (= (type ExhaleHeap@@4) (MapType0Type RefType))) (= (type Mask@@6) (MapType1Type RefType realType))) (= (type pm_f@@1) (FieldType C@@1 FrameTypeType))) (IdenticalOnKnownLocations Heap@@14 ExhaleHeap@@4 Mask@@6)) (and (HasDirectPerm Mask@@6 null pm_f@@1) (IsPredicateField pm_f@@1))) (forall ((o2 T@U) (f_2@@0 T@U) ) (! (let ((B@@5 (FieldTypeInv1 (type f_2@@0))))
(let ((A@@6 (FieldTypeInv0 (type f_2@@0))))
 (=> (and (and (= (type o2) RefType) (= (type f_2@@0) (FieldType A@@6 B@@5))) (U_2_bool (MapType1Select (MapType0Select Heap@@14 null (PredicateMaskField pm_f@@1)) o2 f_2@@0))) (= (MapType0Select Heap@@14 o2 f_2@@0) (MapType0Select ExhaleHeap@@4 o2 f_2@@0)))))
 :qid |stdinbpl.54:134|
 :skolemid |3|
 :pattern ( (MapType0Select ExhaleHeap@@4 o2 f_2@@0))
))))
 :qid |stdinbpl.52:19|
 :skolemid |4|
 :pattern ( (IdenticalOnKnownLocations Heap@@14 ExhaleHeap@@4 Mask@@6) (IsPredicateField pm_f@@1))
)))
(assert (forall ((Heap@@15 T@U) (ExhaleHeap@@5 T@U) (Mask@@7 T@U) (pm_f@@2 T@U) ) (! (let ((C@@2 (FieldTypeInv0 (type pm_f@@2))))
 (=> (and (and (and (and (and (= (type Heap@@15) (MapType0Type RefType)) (= (type ExhaleHeap@@5) (MapType0Type RefType))) (= (type Mask@@7) (MapType1Type RefType realType))) (= (type pm_f@@2) (FieldType C@@2 FrameTypeType))) (IdenticalOnKnownLocations Heap@@15 ExhaleHeap@@5 Mask@@7)) (and (HasDirectPerm Mask@@7 null pm_f@@2) (IsWandField pm_f@@2))) (forall ((o2@@0 T@U) (f_2@@1 T@U) ) (! (let ((B@@6 (FieldTypeInv1 (type f_2@@1))))
(let ((A@@7 (FieldTypeInv0 (type f_2@@1))))
 (=> (and (and (= (type o2@@0) RefType) (= (type f_2@@1) (FieldType A@@7 B@@6))) (U_2_bool (MapType1Select (MapType0Select Heap@@15 null (WandMaskField pm_f@@2)) o2@@0 f_2@@1))) (= (MapType0Select Heap@@15 o2@@0 f_2@@1) (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1)))))
 :qid |stdinbpl.67:129|
 :skolemid |6|
 :pattern ( (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1))
))))
 :qid |stdinbpl.65:19|
 :skolemid |7|
 :pattern ( (IdenticalOnKnownLocations Heap@@15 ExhaleHeap@@5 Mask@@7) (IsWandField pm_f@@2))
)))
(assert (forall ((this@@35 T@U) ) (!  (=> (= (type this@@35) RefType) (= (getPredWandId (valid1 this@@35)) 0))
 :qid |stdinbpl.216:15|
 :skolemid |24|
 :pattern ( (valid1 this@@35))
)))
(assert (forall ((this@@36 T@U) ) (!  (=> (= (type this@@36) RefType) (= (getPredWandId (valid this@@36)) 1))
 :qid |stdinbpl.340:15|
 :skolemid |30|
 :pattern ( (valid this@@36))
)))
(assert (forall ((this@@37 T@U) ) (!  (=> (= (type this@@37) RefType) (= (getPredWandId (validRest this@@37)) 2))
 :qid |stdinbpl.398:15|
 :skolemid |36|
 :pattern ( (validRest this@@37))
)))
(assert (forall ((this@@38 T@U) ) (!  (=> (= (type this@@38) RefType) (= (getPredWandId (rightValid this@@38)) 3))
 :qid |stdinbpl.484:15|
 :skolemid |42|
 :pattern ( (rightValid this@@38))
)))
(assert (forall ((this@@39 T@U) ) (!  (=> (= (type this@@39) RefType) (= (getPredWandId (leftValid this@@39)) 4))
 :qid |stdinbpl.616:15|
 :skolemid |48|
 :pattern ( (leftValid this@@39))
)))
(assert (forall ((this@@40 T@U) ) (!  (=> (= (type this@@40) RefType) (= (getPredWandId (leftOpen this@@40)) 5))
 :qid |stdinbpl.748:15|
 :skolemid |54|
 :pattern ( (leftOpen this@@40))
)))
(assert (forall ((this@@41 T@U) ) (!  (=> (= (type this@@41) RefType) (= (getPredWandId (rightOpen this@@41)) 6))
 :qid |stdinbpl.838:15|
 :skolemid |60|
 :pattern ( (rightOpen this@@41))
)))
(assert (forall ((this@@42 T@U) ) (!  (=> (= (type this@@42) RefType) (= (getPredWandId (udParentValid this@@42)) 7))
 :qid |stdinbpl.928:15|
 :skolemid |66|
 :pattern ( (udParentValid this@@42))
)))
(assert (forall ((this@@43 T@U) ) (!  (=> (= (type this@@43) RefType) (= (getPredWandId (udValid this@@43)) 8))
 :qid |stdinbpl.1126:15|
 :skolemid |72|
 :pattern ( (udValid this@@43))
)))
(assert (forall ((Mask@@8 T@U) (o_2@@2 T@U) (f_4@@2 T@U) ) (! (let ((B@@7 (FieldTypeInv1 (type f_4@@2))))
(let ((A@@8 (FieldTypeInv0 (type f_4@@2))))
 (=> (and (and (and (= (type Mask@@8) (MapType1Type RefType realType)) (= (type o_2@@2) RefType)) (= (type f_4@@2) (FieldType A@@8 B@@7))) (GoodMask Mask@@8)) (and (>= (U_2_real (MapType1Select Mask@@8 o_2@@2 f_4@@2)) NoPerm) (=> (and (and (GoodMask Mask@@8) (not (IsPredicateField f_4@@2))) (not (IsWandField f_4@@2))) (<= (U_2_real (MapType1Select Mask@@8 o_2@@2 f_4@@2)) FullPerm))))))
 :qid |stdinbpl.128:22|
 :skolemid |16|
 :pattern ( (GoodMask Mask@@8) (MapType1Select Mask@@8 o_2@@2 f_4@@2))
)))
(assert (forall ((o T@U) (f T@U) (Heap@@16 T@U) ) (!  (=> (and (and (and (= (type o) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap@@16) (MapType0Type RefType))) (U_2_bool (MapType0Select Heap@@16 o $allocated))) (U_2_bool (MapType0Select Heap@@16 (MapType0Select Heap@@16 o f) $allocated)))
 :qid |stdinbpl.31:15|
 :skolemid |0|
 :pattern ( (MapType0Select Heap@@16 o f))
)))
(assert (forall ((this@@44 T@U) ) (!  (=> (= (type this@@44) RefType) (= (PredicateMaskField (valid1 this@@44)) (|valid1#sm| this@@44)))
 :qid |stdinbpl.208:15|
 :skolemid |22|
 :pattern ( (PredicateMaskField (valid1 this@@44)))
)))
(assert (forall ((this@@45 T@U) ) (!  (=> (= (type this@@45) RefType) (= (PredicateMaskField (valid this@@45)) (|valid#sm| this@@45)))
 :qid |stdinbpl.332:15|
 :skolemid |28|
 :pattern ( (PredicateMaskField (valid this@@45)))
)))
(assert (forall ((this@@46 T@U) ) (!  (=> (= (type this@@46) RefType) (= (PredicateMaskField (validRest this@@46)) (|validRest#sm| this@@46)))
 :qid |stdinbpl.390:15|
 :skolemid |34|
 :pattern ( (PredicateMaskField (validRest this@@46)))
)))
(assert (forall ((this@@47 T@U) ) (!  (=> (= (type this@@47) RefType) (= (PredicateMaskField (rightValid this@@47)) (|rightValid#sm| this@@47)))
 :qid |stdinbpl.476:15|
 :skolemid |40|
 :pattern ( (PredicateMaskField (rightValid this@@47)))
)))
(assert (forall ((this@@48 T@U) ) (!  (=> (= (type this@@48) RefType) (= (PredicateMaskField (leftValid this@@48)) (|leftValid#sm| this@@48)))
 :qid |stdinbpl.608:15|
 :skolemid |46|
 :pattern ( (PredicateMaskField (leftValid this@@48)))
)))
(assert (forall ((this@@49 T@U) ) (!  (=> (= (type this@@49) RefType) (= (PredicateMaskField (leftOpen this@@49)) (|leftOpen#sm| this@@49)))
 :qid |stdinbpl.740:15|
 :skolemid |52|
 :pattern ( (PredicateMaskField (leftOpen this@@49)))
)))
(assert (forall ((this@@50 T@U) ) (!  (=> (= (type this@@50) RefType) (= (PredicateMaskField (rightOpen this@@50)) (|rightOpen#sm| this@@50)))
 :qid |stdinbpl.830:15|
 :skolemid |58|
 :pattern ( (PredicateMaskField (rightOpen this@@50)))
)))
(assert (forall ((this@@51 T@U) ) (!  (=> (= (type this@@51) RefType) (= (PredicateMaskField (udParentValid this@@51)) (|udParentValid#sm| this@@51)))
 :qid |stdinbpl.920:15|
 :skolemid |64|
 :pattern ( (PredicateMaskField (udParentValid this@@51)))
)))
(assert (forall ((this@@52 T@U) ) (!  (=> (= (type this@@52) RefType) (= (PredicateMaskField (udValid this@@52)) (|udValid#sm| this@@52)))
 :qid |stdinbpl.1118:15|
 :skolemid |70|
 :pattern ( (PredicateMaskField (udValid this@@52)))
)))
(assert (forall ((Heap@@17 T@U) (o@@0 T@U) (f_3 T@U) (v T@U) ) (! (let ((B@@8 (type v)))
(let ((A@@9 (FieldTypeInv0 (type f_3))))
 (=> (and (and (= (type Heap@@17) (MapType0Type RefType)) (= (type o@@0) RefType)) (= (type f_3) (FieldType A@@9 B@@8))) (succHeap Heap@@17 (MapType0Store Heap@@17 o@@0 f_3 v)))))
 :qid |stdinbpl.78:22|
 :skolemid |9|
 :pattern ( (MapType0Store Heap@@17 o@@0 f_3 v))
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
 :qid |stdinbpl.165:25|
 :skolemid |20|
 :pattern ( (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun Heap@@18 () T@U)
(declare-fun this@@53 () T@U)
(declare-fun Mask@3 () T@U)
(declare-fun Mask@1 () T@U)
(declare-fun perm@2 () Real)
(declare-fun Mask@2 () T@U)
(declare-fun perm@0 () Real)
(declare-fun Mask@0 () T@U)
(declare-fun perm@1 () Real)
(assert  (and (and (and (and (and (= (type Heap@@18) (MapType0Type RefType)) (= (type this@@53) RefType)) (= (type Mask@3) (MapType1Type RefType realType))) (= (type Mask@1) (MapType1Type RefType realType))) (= (type Mask@2) (MapType1Type RefType realType))) (= (type Mask@0) (MapType1Type RefType realType))))
(set-info :boogie-vc-id |rightOpen#definedness|)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 16) (let ((anon4_correct true))
(let ((anon6_Else_correct  (=> (and (= (MapType0Select Heap@@18 this@@53 right) null) (= (ControlFlow 0 5) 1)) anon4_correct)))
(let ((anon6_Then_correct  (=> (not (= (MapType0Select Heap@@18 this@@53 right) null)) (and (=> (= (ControlFlow 0 2) (- 0 4)) (HasDirectPerm Mask@3 this@@53 right)) (=> (HasDirectPerm Mask@3 this@@53 right) (and (=> (= (ControlFlow 0 2) (- 0 3)) (HasDirectPerm Mask@3 (MapType0Select Heap@@18 this@@53 right) parent)) (=> (HasDirectPerm Mask@3 (MapType0Select Heap@@18 this@@53 right) parent) (=> (and (= (MapType0Select Heap@@18 (MapType0Select Heap@@18 this@@53 right) parent) this@@53) (= (ControlFlow 0 2) 1)) anon4_correct))))))))
(let ((anon2_correct  (and (=> (= (ControlFlow 0 6) (- 0 7)) (HasDirectPerm Mask@3 this@@53 right)) (=> (HasDirectPerm Mask@3 this@@53 right) (and (=> (= (ControlFlow 0 6) 2) anon6_Then_correct) (=> (= (ControlFlow 0 6) 5) anon6_Else_correct))))))
(let ((anon5_Else_correct  (=> (= (MapType0Select Heap@@18 this@@53 right) null) (=> (and (= Mask@3 Mask@1) (= (ControlFlow 0 11) 6)) anon2_correct))))
(let ((anon5_Then_correct  (=> (not (= (MapType0Select Heap@@18 this@@53 right) null)) (and (=> (= (ControlFlow 0 8) (- 0 10)) (HasDirectPerm Mask@1 this@@53 right)) (=> (HasDirectPerm Mask@1 this@@53 right) (=> (= perm@2 (/ (to_real 1) (to_real 2))) (and (=> (= (ControlFlow 0 8) (- 0 9)) (>= perm@2 NoPerm)) (=> (>= perm@2 NoPerm) (=> (=> (> perm@2 NoPerm) (not (= (MapType0Select Heap@@18 this@@53 right) null))) (=> (and (and (= Mask@2 (MapType1Store Mask@1 (MapType0Select Heap@@18 this@@53 right) parent (real_2_U (+ (U_2_real (MapType1Select Mask@1 (MapType0Select Heap@@18 this@@53 right) parent)) perm@2)))) (state Heap@@18 Mask@2)) (and (= Mask@3 Mask@2) (= (ControlFlow 0 8) 6))) anon2_correct))))))))))
(let ((anon0_correct  (=> (state Heap@@18 ZeroMask) (=> (and (U_2_bool (MapType0Select Heap@@18 this@@53 $allocated)) (= perm@0 (/ (to_real 1) (to_real 4)))) (and (=> (= (ControlFlow 0 12) (- 0 15)) (>= perm@0 NoPerm)) (=> (>= perm@0 NoPerm) (=> (and (and (=> (> perm@0 NoPerm) (not (= this@@53 null))) (= Mask@0 (MapType1Store ZeroMask this@@53 right (real_2_U (+ (U_2_real (MapType1Select ZeroMask this@@53 right)) perm@0))))) (and (state Heap@@18 Mask@0) (= perm@1 (/ (to_real 1) (to_real 10))))) (and (=> (= (ControlFlow 0 12) (- 0 14)) (>= perm@1 NoPerm)) (=> (>= perm@1 NoPerm) (=> (=> (> perm@1 NoPerm) (not (= this@@53 null))) (=> (and (= Mask@1 (MapType1Store Mask@0 this@@53 root (real_2_U (+ (U_2_real (MapType1Select Mask@0 this@@53 root)) perm@1)))) (state Heap@@18 Mask@1)) (and (=> (= (ControlFlow 0 12) (- 0 13)) (HasDirectPerm Mask@1 this@@53 right)) (=> (HasDirectPerm Mask@1 this@@53 right) (and (=> (= (ControlFlow 0 12) 8) anon5_Then_correct) (=> (= (ControlFlow 0 12) 11) anon5_Else_correct)))))))))))))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 16) 12) anon0_correct)))
PreconditionGeneratedEntry_correct)))))))))
))
(check-sat)
(pop 1)
; Valid
(get-info :rlimit)
