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
(declare-fun key () T@U)
(declare-fun degree () T@U)
(declare-fun parent () T@U)
(declare-fun sibling () T@U)
(declare-fun child () T@U)
(declare-fun Nodes () T@U)
(declare-fun size () T@U)
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
(declare-fun segLength (T@U T@U T@U) Int)
(declare-fun |segLength#triggerStateless| (T@U T@U) Int)
(declare-fun |heapseg#trigger| (T@U T@U) Bool)
(declare-fun heapseg (T@U T@U) T@U)
(declare-fun MapType1Type (T@T T@T) T@T)
(declare-fun AssumeFunctionsAbove () Int)
(declare-fun |segLength'| (T@U T@U T@U) Int)
(declare-fun MapType1TypeInv0 (T@T) T@T)
(declare-fun MapType1TypeInv1 (T@T) T@T)
(declare-fun MapType1Select (T@U T@U T@U) T@U)
(declare-fun MapType1Store (T@U T@U T@U T@U) T@U)
(declare-fun PredicateType_heapsegType () T@T)
(declare-fun FrameTypeType () T@T)
(declare-fun |treeDegree'| (T@U T@U) Int)
(declare-fun |treeDegree#trigger| (T@U T@U) Bool)
(declare-fun null () T@U)
(declare-fun tree (T@U) T@U)
(declare-fun PredicateType_treeType () T@T)
(declare-fun GoodMask (T@U) Bool)
(declare-fun |segDegree'| (T@U T@U T@U Int) Int)
(declare-fun dummyFunction (T@U) Bool)
(declare-fun |segDegree#triggerStateless| (T@U T@U Int) Int)
(declare-fun segSize (T@U T@U T@U) Int)
(declare-fun |segSize#triggerStateless| (T@U T@U) Int)
(declare-fun |treeSize'| (T@U T@U) Int)
(declare-fun |segSize'| (T@U T@U T@U) Int)
(declare-fun IsPredicateField (T@U) Bool)
(declare-fun |segParent'| (T@U T@U T@U) T@U)
(declare-fun |segParent#triggerStateless| (T@U T@U) T@U)
(declare-fun |sorted'| (T@U T@U T@U) Bool)
(declare-fun |sorted#triggerStateless| (T@U T@U) Bool)
(declare-fun |presorted'| (T@U T@U T@U) Bool)
(declare-fun |presorted#triggerStateless| (T@U T@U) Bool)
(declare-fun |validChildren'| (T@U T@U T@U) Bool)
(declare-fun |validChildren#triggerStateless| (T@U T@U) Bool)
(declare-fun |heapseg#everUsed| (T@U) Bool)
(declare-fun IdenticalOnKnownLocations (T@U T@U T@U) Bool)
(declare-fun PredicateMaskField (T@U) T@U)
(declare-fun HasDirectPerm (T@U T@U T@U) Bool)
(declare-fun IsWandField (T@U) Bool)
(declare-fun WandMaskField (T@U) T@U)
(declare-fun heap (T@U) T@U)
(declare-fun PredicateType_heapType () T@T)
(declare-fun |treeKey'| (T@U T@U) Int)
(declare-fun |treeKey#triggerStateless| (T@U) Int)
(declare-fun |treeDegree#triggerStateless| (T@U) Int)
(declare-fun |treeSize#triggerStateless| (T@U) Int)
(declare-fun |treeParent'| (T@U T@U) T@U)
(declare-fun |treeParent#triggerStateless| (T@U) T@U)
(declare-fun |tree#trigger| (T@U T@U) Bool)
(declare-fun |tree#everUsed| (T@U) Bool)
(declare-fun |heap#trigger| (T@U T@U) Bool)
(declare-fun |heap#everUsed| (T@U) Bool)
(declare-fun segDegree (T@U T@U T@U Int) Int)
(declare-fun treeDegree (T@U T@U) Int)
(declare-fun |sorted#frame| (T@U T@U T@U) Bool)
(declare-fun |presorted#frame| (T@U T@U T@U) Bool)
(declare-fun |validChildren#frame| (T@U T@U T@U) Bool)
(declare-fun treeKey (T@U T@U) Int)
(declare-fun treeSize (T@U T@U) Int)
(declare-fun treeParent (T@U T@U) T@U)
(declare-fun |heapseg#sm| (T@U T@U) T@U)
(declare-fun |tree#sm| (T@U) T@U)
(declare-fun |heap#sm| (T@U) T@U)
(declare-fun |segLength#frame| (T@U T@U T@U) Int)
(declare-fun |segSize#frame| (T@U T@U T@U) Int)
(declare-fun |segParent#frame| (T@U T@U T@U) T@U)
(declare-fun presorted (T@U T@U T@U) Bool)
(declare-fun dummyHeap () T@U)
(declare-fun ZeroMask () T@U)
(declare-fun InsidePredicate (T@U T@U T@U T@U) Bool)
(declare-fun sumMask (T@U T@U T@U) Bool)
(declare-fun ConditionalFrame (Real T@U) T@U)
(declare-fun EmptyFrame () T@U)
(declare-fun NoPerm () Real)
(declare-fun |sorted#trigger| (T@U T@U T@U) Bool)
(declare-fun segParent (T@U T@U T@U) T@U)
(declare-fun |segDegree#trigger| (T@U T@U T@U Int) Bool)
(declare-fun |segDegree#frame| (T@U T@U T@U Int) Int)
(declare-fun getPredWandId (T@U) Int)
(declare-fun |segSize#trigger| (T@U T@U T@U) Bool)
(declare-fun FullPerm () Real)
(declare-fun |segLength#trigger| (T@U T@U T@U) Bool)
(declare-fun |treeKey#frame| (T@U T@U) Int)
(declare-fun |treeDegree#frame| (T@U T@U) Int)
(declare-fun |treeSize#frame| (T@U T@U) Int)
(declare-fun |treeParent#frame| (T@U T@U) T@U)
(declare-fun sorted (T@U T@U T@U) Bool)
(declare-fun ZeroPMask () T@U)
(declare-fun validChildren (T@U T@U T@U) Bool)
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
))) (= (Ctor NormalFieldType) 7)) (= (type $allocated) (FieldType NormalFieldType boolType))) (= (type key) (FieldType NormalFieldType intType))) (= (type degree) (FieldType NormalFieldType intType))) (= (Ctor RefType) 8)) (= (type parent) (FieldType NormalFieldType RefType))) (= (type sibling) (FieldType NormalFieldType RefType))) (= (type child) (FieldType NormalFieldType RefType))) (= (type Nodes) (FieldType NormalFieldType RefType))) (= (type size) (FieldType NormalFieldType intType))))
(assert (distinct $allocated key degree parent sibling child Nodes size)
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
(assert  (and (and (and (and (and (and (and (and (and (forall ((arg0@@18 T@T) (arg1@@4 T@T) ) (! (= (Ctor (MapType1Type arg0@@18 arg1@@4)) 10)
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
)))) (= (Ctor PredicateType_heapsegType) 11)) (= (Ctor FrameTypeType) 12)) (forall ((arg0@@23 T@U) (arg1@@9 T@U) ) (! (= (type (heapseg arg0@@23 arg1@@9)) (FieldType PredicateType_heapsegType FrameTypeType))
 :qid |funType:heapseg|
 :pattern ( (heapseg arg0@@23 arg1@@9))
))))
(assert (forall ((Heap T@U) (Mask T@U) (this T@U) (last T@U) ) (!  (=> (and (and (and (and (= (type Heap) (MapType0Type RefType)) (= (type Mask) (MapType1Type RefType realType))) (= (type this) RefType)) (= (type last) RefType)) (and (state Heap Mask) (< AssumeFunctionsAbove 8))) (= (segLength Heap this last) (ite (= this last) 0 (+ 1 (|segLength'| Heap (MapType0Select Heap this sibling) last)))))
 :qid |stdinbpl.781:15|
 :skolemid |45|
 :pattern ( (state Heap Mask) (segLength Heap this last))
 :pattern ( (state Heap Mask) (|segLength#triggerStateless| this last) (|heapseg#trigger| Heap (heapseg this last)))
)))
(assert  (and (and (= (type null) RefType) (= (Ctor PredicateType_treeType) 13)) (forall ((arg0@@24 T@U) ) (! (= (type (tree arg0@@24)) (FieldType PredicateType_treeType FrameTypeType))
 :qid |funType:tree|
 :pattern ( (tree arg0@@24))
))))
(assert (forall ((Heap@@0 T@U) (Mask@@0 T@U) (this@@0 T@U) ) (!  (=> (and (and (and (= (type Heap@@0) (MapType0Type RefType)) (= (type Mask@@0) (MapType1Type RefType realType))) (= (type this@@0) RefType)) (and (state Heap@@0 Mask@@0) (or (< AssumeFunctionsAbove 9) (|treeDegree#trigger| (MapType0Select Heap@@0 null (tree this@@0)) this@@0)))) (<= 0 (|treeDegree'| Heap@@0 this@@0)))
 :qid |stdinbpl.372:15|
 :skolemid |31|
 :pattern ( (state Heap@@0 Mask@@0) (|treeDegree'| Heap@@0 this@@0))
)))
(assert (forall ((Heap@@1 T@U) (Mask@@1 T@U) ) (!  (=> (and (and (= (type Heap@@1) (MapType0Type RefType)) (= (type Mask@@1) (MapType1Type RefType realType))) (state Heap@@1 Mask@@1)) (GoodMask Mask@@1))
 :qid |stdinbpl.124:15|
 :skolemid |15|
 :pattern ( (state Heap@@1 Mask@@1))
)))
(assert (forall ((Heap0@@0 T@U) (Heap1@@0 T@U) (Heap2 T@U) ) (!  (=> (and (and (and (= (type Heap0@@0) (MapType0Type RefType)) (= (type Heap1@@0) (MapType0Type RefType))) (= (type Heap2) (MapType0Type RefType))) (and (succHeapTrans Heap0@@0 Heap1@@0) (succHeap Heap1@@0 Heap2))) (succHeapTrans Heap0@@0 Heap2))
 :qid |stdinbpl.93:15|
 :skolemid |12|
 :pattern ( (succHeapTrans Heap0@@0 Heap1@@0) (succHeap Heap1@@0 Heap2))
)))
(assert (forall ((Heap@@2 T@U) (this@@1 T@U) (last@@0 T@U) (index Int) ) (!  (=> (and (and (= (type Heap@@2) (MapType0Type RefType)) (= (type this@@1) RefType)) (= (type last@@0) RefType)) (dummyFunction (int_2_U (|segDegree#triggerStateless| this@@1 last@@0 index))))
 :qid |stdinbpl.1128:15|
 :skolemid |60|
 :pattern ( (|segDegree'| Heap@@2 this@@1 last@@0 index))
)))
(assert (forall ((Heap@@3 T@U) (Mask@@2 T@U) (this@@2 T@U) (last@@1 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@3) (MapType0Type RefType)) (= (type Mask@@2) (MapType1Type RefType realType))) (= (type this@@2) RefType)) (= (type last@@1) RefType)) (and (state Heap@@3 Mask@@2) (< AssumeFunctionsAbove 1))) (= (segSize Heap@@3 this@@2 last@@1) (ite (= this@@2 last@@1) 0 (+ (|treeSize'| Heap@@3 this@@2) (|segSize'| Heap@@3 (MapType0Select Heap@@3 this@@2 sibling) last@@1)))))
 :qid |stdinbpl.957:15|
 :skolemid |54|
 :pattern ( (state Heap@@3 Mask@@2) (segSize Heap@@3 this@@2 last@@1))
 :pattern ( (state Heap@@3 Mask@@2) (|segSize#triggerStateless| this@@2 last@@1) (|heapseg#trigger| Heap@@3 (heapseg this@@2 last@@1)) (|heapseg#trigger| Heap@@3 (heapseg this@@2 last@@1)))
)))
(assert (forall ((this@@3 T@U) (last@@2 T@U) ) (!  (=> (and (= (type this@@3) RefType) (= (type last@@2) RefType)) (IsPredicateField (heapseg this@@3 last@@2)))
 :qid |stdinbpl.2402:15|
 :skolemid |98|
 :pattern ( (heapseg this@@3 last@@2))
)))
(assert (forall ((Heap@@4 T@U) (this@@4 T@U) (last@@3 T@U) ) (!  (=> (and (and (= (type Heap@@4) (MapType0Type RefType)) (= (type this@@4) RefType)) (= (type last@@3) RefType)) (dummyFunction (int_2_U (|segLength#triggerStateless| this@@4 last@@3))))
 :qid |stdinbpl.775:15|
 :skolemid |44|
 :pattern ( (|segLength'| Heap@@4 this@@4 last@@3))
)))
(assert (forall ((Heap@@5 T@U) (this@@5 T@U) (last@@4 T@U) ) (!  (=> (and (and (= (type Heap@@5) (MapType0Type RefType)) (= (type this@@5) RefType)) (= (type last@@4) RefType)) (dummyFunction (int_2_U (|segSize#triggerStateless| this@@5 last@@4))))
 :qid |stdinbpl.951:15|
 :skolemid |53|
 :pattern ( (|segSize'| Heap@@5 this@@5 last@@4))
)))
(assert  (and (forall ((arg0@@25 T@U) (arg1@@10 T@U) (arg2@@3 T@U) ) (! (= (type (|segParent'| arg0@@25 arg1@@10 arg2@@3)) RefType)
 :qid |funType:segParent'|
 :pattern ( (|segParent'| arg0@@25 arg1@@10 arg2@@3))
)) (forall ((arg0@@26 T@U) (arg1@@11 T@U) ) (! (= (type (|segParent#triggerStateless| arg0@@26 arg1@@11)) RefType)
 :qid |funType:segParent#triggerStateless|
 :pattern ( (|segParent#triggerStateless| arg0@@26 arg1@@11))
))))
(assert (forall ((Heap@@6 T@U) (this@@6 T@U) (last@@5 T@U) ) (!  (=> (and (and (= (type Heap@@6) (MapType0Type RefType)) (= (type this@@6) RefType)) (= (type last@@5) RefType)) (dummyFunction (|segParent#triggerStateless| this@@6 last@@5)))
 :qid |stdinbpl.1330:15|
 :skolemid |67|
 :pattern ( (|segParent'| Heap@@6 this@@6 last@@5))
)))
(assert (forall ((Heap@@7 T@U) (this@@7 T@U) (last@@6 T@U) ) (!  (=> (and (and (= (type Heap@@7) (MapType0Type RefType)) (= (type this@@7) RefType)) (= (type last@@6) RefType)) (dummyFunction (bool_2_U (|sorted#triggerStateless| this@@7 last@@6))))
 :qid |stdinbpl.1469:15|
 :skolemid |73|
 :pattern ( (|sorted'| Heap@@7 this@@7 last@@6))
)))
(assert (forall ((Heap@@8 T@U) (this@@8 T@U) (last@@7 T@U) ) (!  (=> (and (and (= (type Heap@@8) (MapType0Type RefType)) (= (type this@@8) RefType)) (= (type last@@7) RefType)) (dummyFunction (bool_2_U (|presorted#triggerStateless| this@@8 last@@7))))
 :qid |stdinbpl.1706:15|
 :skolemid |80|
 :pattern ( (|presorted'| Heap@@8 this@@8 last@@7))
)))
(assert (forall ((Heap@@9 T@U) (this@@9 T@U) (last@@8 T@U) ) (!  (=> (and (and (= (type Heap@@9) (MapType0Type RefType)) (= (type this@@9) RefType)) (= (type last@@8) RefType)) (dummyFunction (bool_2_U (|validChildren#triggerStateless| this@@9 last@@8))))
 :qid |stdinbpl.2007:15|
 :skolemid |86|
 :pattern ( (|validChildren'| Heap@@9 this@@9 last@@8))
)))
(assert (forall ((Heap@@10 T@U) (this@@10 T@U) (last@@9 T@U) ) (!  (=> (and (and (= (type Heap@@10) (MapType0Type RefType)) (= (type this@@10) RefType)) (= (type last@@9) RefType)) (|heapseg#everUsed| (heapseg this@@10 last@@9)))
 :qid |stdinbpl.2421:15|
 :skolemid |102|
 :pattern ( (|heapseg#trigger| Heap@@10 (heapseg this@@10 last@@9)))
)))
(assert (forall ((arg0@@27 T@U) ) (! (let ((A (FieldTypeInv0 (type arg0@@27))))
(= (type (PredicateMaskField arg0@@27)) (FieldType A (MapType1Type RefType boolType))))
 :qid |funType:PredicateMaskField|
 :pattern ( (PredicateMaskField arg0@@27))
)))
(assert (forall ((Heap@@11 T@U) (ExhaleHeap T@U) (Mask@@3 T@U) (pm_f T@U) ) (! (let ((C (FieldTypeInv0 (type pm_f))))
 (=> (and (and (and (and (and (= (type Heap@@11) (MapType0Type RefType)) (= (type ExhaleHeap) (MapType0Type RefType))) (= (type Mask@@3) (MapType1Type RefType realType))) (= (type pm_f) (FieldType C FrameTypeType))) (IdenticalOnKnownLocations Heap@@11 ExhaleHeap Mask@@3)) (and (HasDirectPerm Mask@@3 null pm_f) (IsPredicateField pm_f))) (= (MapType0Select Heap@@11 null (PredicateMaskField pm_f)) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))))
 :qid |stdinbpl.47:19|
 :skolemid |2|
 :pattern ( (IdenticalOnKnownLocations Heap@@11 ExhaleHeap Mask@@3) (IsPredicateField pm_f) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))
)))
(assert (forall ((arg0@@28 T@U) ) (! (let ((A@@0 (FieldTypeInv0 (type arg0@@28))))
(= (type (WandMaskField arg0@@28)) (FieldType A@@0 (MapType1Type RefType boolType))))
 :qid |funType:WandMaskField|
 :pattern ( (WandMaskField arg0@@28))
)))
(assert (forall ((Heap@@12 T@U) (ExhaleHeap@@0 T@U) (Mask@@4 T@U) (pm_f@@0 T@U) ) (! (let ((C@@0 (FieldTypeInv0 (type pm_f@@0))))
 (=> (and (and (and (and (and (= (type Heap@@12) (MapType0Type RefType)) (= (type ExhaleHeap@@0) (MapType0Type RefType))) (= (type Mask@@4) (MapType1Type RefType realType))) (= (type pm_f@@0) (FieldType C@@0 FrameTypeType))) (IdenticalOnKnownLocations Heap@@12 ExhaleHeap@@0 Mask@@4)) (and (HasDirectPerm Mask@@4 null pm_f@@0) (IsWandField pm_f@@0))) (= (MapType0Select Heap@@12 null (WandMaskField pm_f@@0)) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))))
 :qid |stdinbpl.60:19|
 :skolemid |5|
 :pattern ( (IdenticalOnKnownLocations Heap@@12 ExhaleHeap@@0 Mask@@4) (IsWandField pm_f@@0) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))
)))
(assert (forall ((this@@11 T@U) ) (!  (=> (= (type this@@11) RefType) (IsPredicateField (tree this@@11)))
 :qid |stdinbpl.2209:15|
 :skolemid |92|
 :pattern ( (tree this@@11))
)))
(assert  (and (= (Ctor PredicateType_heapType) 14) (forall ((arg0@@29 T@U) ) (! (= (type (heap arg0@@29)) (FieldType PredicateType_heapType FrameTypeType))
 :qid |funType:heap|
 :pattern ( (heap arg0@@29))
))))
(assert (forall ((this@@12 T@U) ) (!  (=> (= (type this@@12) RefType) (IsPredicateField (heap this@@12)))
 :qid |stdinbpl.2520:15|
 :skolemid |104|
 :pattern ( (heap this@@12))
)))
(assert (forall ((Heap@@13 T@U) (this@@13 T@U) ) (!  (=> (and (= (type Heap@@13) (MapType0Type RefType)) (= (type this@@13) RefType)) (dummyFunction (int_2_U (|treeKey#triggerStateless| this@@13))))
 :qid |stdinbpl.224:15|
 :skolemid |23|
 :pattern ( (|treeKey'| Heap@@13 this@@13))
)))
(assert (forall ((Heap@@14 T@U) (this@@14 T@U) ) (!  (=> (and (= (type Heap@@14) (MapType0Type RefType)) (= (type this@@14) RefType)) (dummyFunction (int_2_U (|treeDegree#triggerStateless| this@@14))))
 :qid |stdinbpl.353:15|
 :skolemid |28|
 :pattern ( (|treeDegree'| Heap@@14 this@@14))
)))
(assert (forall ((Heap@@15 T@U) (this@@15 T@U) ) (!  (=> (and (= (type Heap@@15) (MapType0Type RefType)) (= (type this@@15) RefType)) (dummyFunction (int_2_U (|treeSize#triggerStateless| this@@15))))
 :qid |stdinbpl.494:15|
 :skolemid |34|
 :pattern ( (|treeSize'| Heap@@15 this@@15))
)))
(assert  (and (forall ((arg0@@30 T@U) (arg1@@12 T@U) ) (! (= (type (|treeParent'| arg0@@30 arg1@@12)) RefType)
 :qid |funType:treeParent'|
 :pattern ( (|treeParent'| arg0@@30 arg1@@12))
)) (forall ((arg0@@31 T@U) ) (! (= (type (|treeParent#triggerStateless| arg0@@31)) RefType)
 :qid |funType:treeParent#triggerStateless|
 :pattern ( (|treeParent#triggerStateless| arg0@@31))
))))
(assert (forall ((Heap@@16 T@U) (this@@16 T@U) ) (!  (=> (and (= (type Heap@@16) (MapType0Type RefType)) (= (type this@@16) RefType)) (dummyFunction (|treeParent#triggerStateless| this@@16)))
 :qid |stdinbpl.646:15|
 :skolemid |39|
 :pattern ( (|treeParent'| Heap@@16 this@@16))
)))
(assert (forall ((Heap@@17 T@U) (this@@17 T@U) ) (!  (=> (and (= (type Heap@@17) (MapType0Type RefType)) (= (type this@@17) RefType)) (|tree#everUsed| (tree this@@17)))
 :qid |stdinbpl.2228:15|
 :skolemid |96|
 :pattern ( (|tree#trigger| Heap@@17 (tree this@@17)))
)))
(assert (forall ((Heap@@18 T@U) (this@@18 T@U) ) (!  (=> (and (= (type Heap@@18) (MapType0Type RefType)) (= (type this@@18) RefType)) (|heap#everUsed| (heap this@@18)))
 :qid |stdinbpl.2539:15|
 :skolemid |108|
 :pattern ( (|heap#trigger| Heap@@18 (heap this@@18)))
)))
(assert (forall ((Heap@@19 T@U) (Mask@@5 T@U) (this@@19 T@U) (last@@10 T@U) (index@@0 Int) ) (!  (=> (and (and (and (and (and (= (type Heap@@19) (MapType0Type RefType)) (= (type Mask@@5) (MapType1Type RefType realType))) (= (type this@@19) RefType)) (= (type last@@10) RefType)) (and (state Heap@@19 Mask@@5) (< AssumeFunctionsAbove 7))) (and (<= 0 index@@0) (< index@@0 (segLength Heap@@19 this@@19 last@@10)))) (= (segDegree Heap@@19 this@@19 last@@10 index@@0) (ite (= index@@0 0) (treeDegree Heap@@19 this@@19) (|segDegree'| Heap@@19 (MapType0Select Heap@@19 this@@19 sibling) last@@10 (- index@@0 1)))))
 :qid |stdinbpl.1134:15|
 :skolemid |61|
 :pattern ( (state Heap@@19 Mask@@5) (segDegree Heap@@19 this@@19 last@@10 index@@0))
 :pattern ( (state Heap@@19 Mask@@5) (|segDegree#triggerStateless| this@@19 last@@10 index@@0) (|heapseg#trigger| Heap@@19 (heapseg this@@19 last@@10)) (|heapseg#trigger| Heap@@19 (heapseg this@@19 last@@10)))
)))
(assert (forall ((Heap@@20 T@U) (Mask@@6 T@U) (this@@20 T@U) (last@@11 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@20) (MapType0Type RefType)) (= (type Mask@@6) (MapType1Type RefType realType))) (= (type this@@20) RefType)) (= (type last@@11) RefType)) (state Heap@@20 Mask@@6)) (= (|sorted'| Heap@@20 this@@20 last@@11) (|sorted#frame| (MapType0Select Heap@@20 null (heapseg this@@20 last@@11)) this@@20 last@@11)))
 :qid |stdinbpl.1482:15|
 :skolemid |75|
 :pattern ( (state Heap@@20 Mask@@6) (|sorted'| Heap@@20 this@@20 last@@11))
 :pattern ( (state Heap@@20 Mask@@6) (|sorted#triggerStateless| this@@20 last@@11) (|heapseg#trigger| Heap@@20 (heapseg this@@20 last@@11)) (|heapseg#trigger| Heap@@20 (heapseg this@@20 last@@11)) (|heapseg#trigger| Heap@@20 (heapseg this@@20 last@@11)))
)))
(assert (forall ((Heap@@21 T@U) (Mask@@7 T@U) (this@@21 T@U) (last@@12 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@21) (MapType0Type RefType)) (= (type Mask@@7) (MapType1Type RefType realType))) (= (type this@@21) RefType)) (= (type last@@12) RefType)) (state Heap@@21 Mask@@7)) (= (|presorted'| Heap@@21 this@@21 last@@12) (|presorted#frame| (MapType0Select Heap@@21 null (heapseg this@@21 last@@12)) this@@21 last@@12)))
 :qid |stdinbpl.1719:15|
 :skolemid |82|
 :pattern ( (state Heap@@21 Mask@@7) (|presorted'| Heap@@21 this@@21 last@@12))
 :pattern ( (state Heap@@21 Mask@@7) (|presorted#triggerStateless| this@@21 last@@12) (|heapseg#trigger| Heap@@21 (heapseg this@@21 last@@12)) (|heapseg#trigger| Heap@@21 (heapseg this@@21 last@@12)) (|heapseg#trigger| Heap@@21 (heapseg this@@21 last@@12)))
)))
(assert (forall ((Heap@@22 T@U) (Mask@@8 T@U) (this@@22 T@U) (last@@13 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@22) (MapType0Type RefType)) (= (type Mask@@8) (MapType1Type RefType realType))) (= (type this@@22) RefType)) (= (type last@@13) RefType)) (state Heap@@22 Mask@@8)) (= (|validChildren'| Heap@@22 this@@22 last@@13) (|validChildren#frame| (MapType0Select Heap@@22 null (heapseg this@@22 last@@13)) this@@22 last@@13)))
 :qid |stdinbpl.2020:15|
 :skolemid |88|
 :pattern ( (state Heap@@22 Mask@@8) (|validChildren'| Heap@@22 this@@22 last@@13))
 :pattern ( (state Heap@@22 Mask@@8) (|validChildren#triggerStateless| this@@22 last@@13) (|heapseg#trigger| Heap@@22 (heapseg this@@22 last@@13)) (|heapseg#trigger| Heap@@22 (heapseg this@@22 last@@13)) (|heapseg#trigger| Heap@@22 (heapseg this@@22 last@@13)))
)))
(assert (forall ((Heap@@23 T@U) (ExhaleHeap@@1 T@U) (Mask@@9 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@23) (MapType0Type RefType)) (= (type ExhaleHeap@@1) (MapType0Type RefType))) (= (type Mask@@9) (MapType1Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@23 ExhaleHeap@@1 Mask@@9)) (U_2_bool (MapType0Select Heap@@23 o_1 $allocated))) (U_2_bool (MapType0Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.73:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@23 ExhaleHeap@@1 Mask@@9) (MapType0Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert (forall ((Heap@@24 T@U) (this@@23 T@U) ) (!  (=> (and (= (type Heap@@24) (MapType0Type RefType)) (= (type this@@23) RefType)) (and (= (treeKey Heap@@24 this@@23) (|treeKey'| Heap@@24 this@@23)) (dummyFunction (int_2_U (|treeKey#triggerStateless| this@@23)))))
 :qid |stdinbpl.220:15|
 :skolemid |22|
 :pattern ( (treeKey Heap@@24 this@@23))
)))
(assert (forall ((Heap@@25 T@U) (this@@24 T@U) ) (!  (=> (and (= (type Heap@@25) (MapType0Type RefType)) (= (type this@@24) RefType)) (and (= (treeDegree Heap@@25 this@@24) (|treeDegree'| Heap@@25 this@@24)) (dummyFunction (int_2_U (|treeDegree#triggerStateless| this@@24)))))
 :qid |stdinbpl.349:15|
 :skolemid |27|
 :pattern ( (treeDegree Heap@@25 this@@24))
)))
(assert (forall ((Heap@@26 T@U) (this@@25 T@U) ) (!  (=> (and (= (type Heap@@26) (MapType0Type RefType)) (= (type this@@25) RefType)) (and (= (treeSize Heap@@26 this@@25) (|treeSize'| Heap@@26 this@@25)) (dummyFunction (int_2_U (|treeSize#triggerStateless| this@@25)))))
 :qid |stdinbpl.490:15|
 :skolemid |33|
 :pattern ( (treeSize Heap@@26 this@@25))
)))
(assert (forall ((arg0@@32 T@U) (arg1@@13 T@U) ) (! (= (type (treeParent arg0@@32 arg1@@13)) RefType)
 :qid |funType:treeParent|
 :pattern ( (treeParent arg0@@32 arg1@@13))
)))
(assert (forall ((Heap@@27 T@U) (this@@26 T@U) ) (!  (=> (and (= (type Heap@@27) (MapType0Type RefType)) (= (type this@@26) RefType)) (and (= (treeParent Heap@@27 this@@26) (|treeParent'| Heap@@27 this@@26)) (dummyFunction (|treeParent#triggerStateless| this@@26))))
 :qid |stdinbpl.642:15|
 :skolemid |38|
 :pattern ( (treeParent Heap@@27 this@@26))
)))
(assert (forall ((this@@27 T@U) (last@@14 T@U) (this2 T@U) (last2 T@U) ) (!  (=> (and (and (and (and (= (type this@@27) RefType) (= (type last@@14) RefType)) (= (type this2) RefType)) (= (type last2) RefType)) (= (heapseg this@@27 last@@14) (heapseg this2 last2))) (and (= this@@27 this2) (= last@@14 last2)))
 :qid |stdinbpl.2412:15|
 :skolemid |100|
 :pattern ( (heapseg this@@27 last@@14) (heapseg this2 last2))
)))
(assert (forall ((arg0@@33 T@U) (arg1@@14 T@U) ) (! (= (type (|heapseg#sm| arg0@@33 arg1@@14)) (FieldType PredicateType_heapsegType (MapType1Type RefType boolType)))
 :qid |funType:heapseg#sm|
 :pattern ( (|heapseg#sm| arg0@@33 arg1@@14))
)))
(assert (forall ((this@@28 T@U) (last@@15 T@U) (this2@@0 T@U) (last2@@0 T@U) ) (!  (=> (and (and (and (and (= (type this@@28) RefType) (= (type last@@15) RefType)) (= (type this2@@0) RefType)) (= (type last2@@0) RefType)) (= (|heapseg#sm| this@@28 last@@15) (|heapseg#sm| this2@@0 last2@@0))) (and (= this@@28 this2@@0) (= last@@15 last2@@0)))
 :qid |stdinbpl.2416:15|
 :skolemid |101|
 :pattern ( (|heapseg#sm| this@@28 last@@15) (|heapseg#sm| this2@@0 last2@@0))
)))
(assert (forall ((this@@29 T@U) (this2@@1 T@U) ) (!  (=> (and (and (= (type this@@29) RefType) (= (type this2@@1) RefType)) (= (tree this@@29) (tree this2@@1))) (= this@@29 this2@@1))
 :qid |stdinbpl.2219:15|
 :skolemid |94|
 :pattern ( (tree this@@29) (tree this2@@1))
)))
(assert (forall ((arg0@@34 T@U) ) (! (= (type (|tree#sm| arg0@@34)) (FieldType PredicateType_treeType (MapType1Type RefType boolType)))
 :qid |funType:tree#sm|
 :pattern ( (|tree#sm| arg0@@34))
)))
(assert (forall ((this@@30 T@U) (this2@@2 T@U) ) (!  (=> (and (and (= (type this@@30) RefType) (= (type this2@@2) RefType)) (= (|tree#sm| this@@30) (|tree#sm| this2@@2))) (= this@@30 this2@@2))
 :qid |stdinbpl.2223:15|
 :skolemid |95|
 :pattern ( (|tree#sm| this@@30) (|tree#sm| this2@@2))
)))
(assert (forall ((this@@31 T@U) (this2@@3 T@U) ) (!  (=> (and (and (= (type this@@31) RefType) (= (type this2@@3) RefType)) (= (heap this@@31) (heap this2@@3))) (= this@@31 this2@@3))
 :qid |stdinbpl.2530:15|
 :skolemid |106|
 :pattern ( (heap this@@31) (heap this2@@3))
)))
(assert (forall ((arg0@@35 T@U) ) (! (= (type (|heap#sm| arg0@@35)) (FieldType PredicateType_heapType (MapType1Type RefType boolType)))
 :qid |funType:heap#sm|
 :pattern ( (|heap#sm| arg0@@35))
)))
(assert (forall ((this@@32 T@U) (this2@@4 T@U) ) (!  (=> (and (and (= (type this@@32) RefType) (= (type this2@@4) RefType)) (= (|heap#sm| this@@32) (|heap#sm| this2@@4))) (= this@@32 this2@@4))
 :qid |stdinbpl.2534:15|
 :skolemid |107|
 :pattern ( (|heap#sm| this@@32) (|heap#sm| this2@@4))
)))
(assert (forall ((Heap@@28 T@U) (Mask@@10 T@U) (this@@33 T@U) (last@@16 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@28) (MapType0Type RefType)) (= (type Mask@@10) (MapType1Type RefType realType))) (= (type this@@33) RefType)) (= (type last@@16) RefType)) (state Heap@@28 Mask@@10)) (= (|segLength'| Heap@@28 this@@33 last@@16) (|segLength#frame| (MapType0Select Heap@@28 null (heapseg this@@33 last@@16)) this@@33 last@@16)))
 :qid |stdinbpl.788:15|
 :skolemid |46|
 :pattern ( (state Heap@@28 Mask@@10) (|segLength'| Heap@@28 this@@33 last@@16))
 :pattern ( (state Heap@@28 Mask@@10) (|segLength#triggerStateless| this@@33 last@@16) (|heapseg#trigger| Heap@@28 (heapseg this@@33 last@@16)))
)))
(assert (forall ((Heap@@29 T@U) (Mask@@11 T@U) (this@@34 T@U) (last@@17 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@29) (MapType0Type RefType)) (= (type Mask@@11) (MapType1Type RefType realType))) (= (type this@@34) RefType)) (= (type last@@17) RefType)) (state Heap@@29 Mask@@11)) (= (|segSize'| Heap@@29 this@@34 last@@17) (|segSize#frame| (MapType0Select Heap@@29 null (heapseg this@@34 last@@17)) this@@34 last@@17)))
 :qid |stdinbpl.964:15|
 :skolemid |55|
 :pattern ( (state Heap@@29 Mask@@11) (|segSize'| Heap@@29 this@@34 last@@17))
 :pattern ( (state Heap@@29 Mask@@11) (|segSize#triggerStateless| this@@34 last@@17) (|heapseg#trigger| Heap@@29 (heapseg this@@34 last@@17)) (|heapseg#trigger| Heap@@29 (heapseg this@@34 last@@17)))
)))
(assert (forall ((arg0@@36 T@U) (arg1@@15 T@U) (arg2@@4 T@U) ) (! (= (type (|segParent#frame| arg0@@36 arg1@@15 arg2@@4)) RefType)
 :qid |funType:segParent#frame|
 :pattern ( (|segParent#frame| arg0@@36 arg1@@15 arg2@@4))
)))
(assert (forall ((Heap@@30 T@U) (Mask@@12 T@U) (this@@35 T@U) (last@@18 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@30) (MapType0Type RefType)) (= (type Mask@@12) (MapType1Type RefType realType))) (= (type this@@35) RefType)) (= (type last@@18) RefType)) (state Heap@@30 Mask@@12)) (= (|segParent'| Heap@@30 this@@35 last@@18) (|segParent#frame| (MapType0Select Heap@@30 null (heapseg this@@35 last@@18)) this@@35 last@@18)))
 :qid |stdinbpl.1343:15|
 :skolemid |69|
 :pattern ( (state Heap@@30 Mask@@12) (|segParent'| Heap@@30 this@@35 last@@18))
 :pattern ( (state Heap@@30 Mask@@12) (|segParent#triggerStateless| this@@35 last@@18) (|heapseg#trigger| Heap@@30 (heapseg this@@35 last@@18)))
)))
(assert (forall ((Heap@@31 T@U) (ExhaleHeap@@2 T@U) (Mask@@13 T@U) (o_1@@0 T@U) (f_2 T@U) ) (! (let ((B@@1 (FieldTypeInv1 (type f_2))))
(let ((A@@1 (FieldTypeInv0 (type f_2))))
 (=> (and (and (and (and (and (and (= (type Heap@@31) (MapType0Type RefType)) (= (type ExhaleHeap@@2) (MapType0Type RefType))) (= (type Mask@@13) (MapType1Type RefType realType))) (= (type o_1@@0) RefType)) (= (type f_2) (FieldType A@@1 B@@1))) (IdenticalOnKnownLocations Heap@@31 ExhaleHeap@@2 Mask@@13)) (HasDirectPerm Mask@@13 o_1@@0 f_2)) (= (MapType0Select Heap@@31 o_1@@0 f_2) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2)))))
 :qid |stdinbpl.42:22|
 :skolemid |1|
 :pattern ( (IdenticalOnKnownLocations Heap@@31 ExhaleHeap@@2 Mask@@13) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2))
)))
(assert (forall ((Heap@@32 T@U) (Mask@@14 T@U) (this@@36 T@U) (last@@19 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@32) (MapType0Type RefType)) (= (type Mask@@14) (MapType1Type RefType realType))) (= (type this@@36) RefType)) (= (type last@@19) RefType)) (and (state Heap@@32 Mask@@14) (< AssumeFunctionsAbove 5))) (= (presorted Heap@@32 this@@36 last@@19)  (and (=> (< 1 (segLength Heap@@32 this@@36 last@@19)) (and (<= (treeDegree Heap@@32 this@@36) (segDegree Heap@@32 (MapType0Select Heap@@32 this@@36 sibling) last@@19 0)) (|presorted'| Heap@@32 (MapType0Select Heap@@32 this@@36 sibling) last@@19))) (=> (and (< 2 (segLength Heap@@32 this@@36 last@@19)) (= (segDegree Heap@@32 this@@36 last@@19 0) (segDegree Heap@@32 this@@36 last@@19 1))) (< (segDegree Heap@@32 this@@36 last@@19 1) (segDegree Heap@@32 this@@36 last@@19 2))))))
 :qid |stdinbpl.1712:15|
 :skolemid |81|
 :pattern ( (state Heap@@32 Mask@@14) (presorted Heap@@32 this@@36 last@@19))
 :pattern ( (state Heap@@32 Mask@@14) (|presorted#triggerStateless| this@@36 last@@19) (|heapseg#trigger| Heap@@32 (heapseg this@@36 last@@19)) (|heapseg#trigger| Heap@@32 (heapseg this@@36 last@@19)) (|heapseg#trigger| Heap@@32 (heapseg this@@36 last@@19)))
)))
(assert  (and (= (type dummyHeap) (MapType0Type RefType)) (= (type ZeroMask) (MapType1Type RefType realType))))
(assert (state dummyHeap ZeroMask))
(assert (forall ((p T@U) (v_1 T@U) (w T@U) ) (! (let ((A@@2 (FieldTypeInv0 (type p))))
 (=> (and (and (= (type p) (FieldType A@@2 FrameTypeType)) (= (type v_1) FrameTypeType)) (= (type w) FrameTypeType)) (not (InsidePredicate p v_1 p w))))
 :qid |stdinbpl.182:19|
 :skolemid |21|
 :pattern ( (InsidePredicate p v_1 p w))
)))
(assert  (not (IsPredicateField key)))
(assert  (not (IsWandField key)))
(assert  (not (IsPredicateField degree)))
(assert  (not (IsWandField degree)))
(assert  (not (IsPredicateField parent)))
(assert  (not (IsWandField parent)))
(assert  (not (IsPredicateField sibling)))
(assert  (not (IsWandField sibling)))
(assert  (not (IsPredicateField child)))
(assert  (not (IsWandField child)))
(assert  (not (IsPredicateField Nodes)))
(assert  (not (IsWandField Nodes)))
(assert  (not (IsPredicateField size)))
(assert  (not (IsWandField size)))
(assert (forall ((Heap@@33 T@U) (ExhaleHeap@@3 T@U) (Mask@@15 T@U) ) (!  (=> (and (and (and (= (type Heap@@33) (MapType0Type RefType)) (= (type ExhaleHeap@@3) (MapType0Type RefType))) (= (type Mask@@15) (MapType1Type RefType realType))) (IdenticalOnKnownLocations Heap@@33 ExhaleHeap@@3 Mask@@15)) (succHeap Heap@@33 ExhaleHeap@@3))
 :qid |stdinbpl.83:15|
 :skolemid |10|
 :pattern ( (IdenticalOnKnownLocations Heap@@33 ExhaleHeap@@3 Mask@@15))
)))
(assert (forall ((Heap@@34 T@U) (Mask@@16 T@U) (this@@37 T@U) ) (!  (=> (and (and (and (= (type Heap@@34) (MapType0Type RefType)) (= (type Mask@@16) (MapType1Type RefType realType))) (= (type this@@37) RefType)) (and (state Heap@@34 Mask@@16) (< AssumeFunctionsAbove 1))) (= (treeSize Heap@@34 this@@37) (ite (= (U_2_int (MapType0Select Heap@@34 this@@37 degree)) 0) 1 (+ 1 (|segSize'| Heap@@34 (MapType0Select Heap@@34 this@@37 child) null)))))
 :qid |stdinbpl.500:15|
 :skolemid |35|
 :pattern ( (state Heap@@34 Mask@@16) (treeSize Heap@@34 this@@37))
 :pattern ( (state Heap@@34 Mask@@16) (|treeSize#triggerStateless| this@@37) (|tree#trigger| Heap@@34 (tree this@@37)))
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
(assert  (and (forall ((arg0@@37 Real) (arg1@@16 T@U) ) (! (= (type (ConditionalFrame arg0@@37 arg1@@16)) FrameTypeType)
 :qid |funType:ConditionalFrame|
 :pattern ( (ConditionalFrame arg0@@37 arg1@@16))
)) (= (type EmptyFrame) FrameTypeType)))
(assert (forall ((p@@0 Real) (f_6 T@U) ) (!  (=> (= (type f_6) FrameTypeType) (= (ConditionalFrame p@@0 f_6) (ite (> p@@0 0.0) f_6 EmptyFrame)))
 :qid |stdinbpl.170:15|
 :skolemid |19|
 :pattern ( (ConditionalFrame p@@0 f_6))
)))
(assert (forall ((Mask@@17 T@U) (o_2@@0 T@U) (f_4@@0 T@U) ) (! (let ((B@@3 (FieldTypeInv1 (type f_4@@0))))
(let ((A@@4 (FieldTypeInv0 (type f_4@@0))))
 (=> (and (and (= (type Mask@@17) (MapType1Type RefType realType)) (= (type o_2@@0) RefType)) (= (type f_4@@0) (FieldType A@@4 B@@3))) (= (HasDirectPerm Mask@@17 o_2@@0 f_4@@0) (> (U_2_real (MapType1Select Mask@@17 o_2@@0 f_4@@0)) NoPerm)))))
 :qid |stdinbpl.133:22|
 :skolemid |17|
 :pattern ( (HasDirectPerm Mask@@17 o_2@@0 f_4@@0))
)))
(assert (forall ((Heap@@35 T@U) (Mask@@18 T@U) (this@@38 T@U) (last@@20 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@35) (MapType0Type RefType)) (= (type Mask@@18) (MapType1Type RefType realType))) (= (type this@@38) RefType)) (= (type last@@20) RefType)) (and (state Heap@@35 Mask@@18) (or (< AssumeFunctionsAbove 0) (|sorted#trigger| (MapType0Select Heap@@35 null (heapseg this@@38 last@@20)) this@@38 last@@20)))) (|sorted'| Heap@@35 this@@38 last@@20)) (presorted Heap@@35 this@@38 last@@20))
 :qid |stdinbpl.1488:15|
 :skolemid |76|
 :pattern ( (state Heap@@35 Mask@@18) (|sorted'| Heap@@35 this@@38 last@@20))
)))
(assert (forall ((Heap@@36 T@U) (this@@39 T@U) (last@@21 T@U) ) (!  (=> (and (and (= (type Heap@@36) (MapType0Type RefType)) (= (type this@@39) RefType)) (= (type last@@21) RefType)) (and (= (segLength Heap@@36 this@@39 last@@21) (|segLength'| Heap@@36 this@@39 last@@21)) (dummyFunction (int_2_U (|segLength#triggerStateless| this@@39 last@@21)))))
 :qid |stdinbpl.771:15|
 :skolemid |43|
 :pattern ( (segLength Heap@@36 this@@39 last@@21))
)))
(assert (forall ((Heap@@37 T@U) (this@@40 T@U) (last@@22 T@U) ) (!  (=> (and (and (= (type Heap@@37) (MapType0Type RefType)) (= (type this@@40) RefType)) (= (type last@@22) RefType)) (and (= (segSize Heap@@37 this@@40 last@@22) (|segSize'| Heap@@37 this@@40 last@@22)) (dummyFunction (int_2_U (|segSize#triggerStateless| this@@40 last@@22)))))
 :qid |stdinbpl.947:15|
 :skolemid |52|
 :pattern ( (segSize Heap@@37 this@@40 last@@22))
)))
(assert (forall ((arg0@@38 T@U) (arg1@@17 T@U) (arg2@@5 T@U) ) (! (= (type (segParent arg0@@38 arg1@@17 arg2@@5)) RefType)
 :qid |funType:segParent|
 :pattern ( (segParent arg0@@38 arg1@@17 arg2@@5))
)))
(assert (forall ((Heap@@38 T@U) (this@@41 T@U) (last@@23 T@U) ) (!  (=> (and (and (= (type Heap@@38) (MapType0Type RefType)) (= (type this@@41) RefType)) (= (type last@@23) RefType)) (and (= (segParent Heap@@38 this@@41 last@@23) (|segParent'| Heap@@38 this@@41 last@@23)) (dummyFunction (|segParent#triggerStateless| this@@41 last@@23))))
 :qid |stdinbpl.1326:15|
 :skolemid |66|
 :pattern ( (segParent Heap@@38 this@@41 last@@23))
)))
(assert (forall ((Heap@@39 T@U) (Mask@@19 T@U) (this@@42 T@U) (last@@24 T@U) (index@@1 Int) ) (!  (=> (and (and (and (and (and (= (type Heap@@39) (MapType0Type RefType)) (= (type Mask@@19) (MapType1Type RefType realType))) (= (type this@@42) RefType)) (= (type last@@24) RefType)) (and (state Heap@@39 Mask@@19) (or (< AssumeFunctionsAbove 7) (|segDegree#trigger| (MapType0Select Heap@@39 null (heapseg this@@42 last@@24)) this@@42 last@@24 index@@1)))) (and (<= 0 index@@1) (< index@@1 (segLength Heap@@39 this@@42 last@@24)))) (<= 0 (|segDegree'| Heap@@39 this@@42 last@@24 index@@1)))
 :qid |stdinbpl.1147:15|
 :skolemid |63|
 :pattern ( (state Heap@@39 Mask@@19) (|segDegree'| Heap@@39 this@@42 last@@24 index@@1))
)))
(assert (forall ((o_2@@1 T@U) (f_4@@1 T@U) ) (! (let ((B@@4 (FieldTypeInv1 (type f_4@@1))))
(let ((A@@5 (FieldTypeInv0 (type f_4@@1))))
 (=> (and (= (type o_2@@1) RefType) (= (type f_4@@1) (FieldType A@@5 B@@4))) (= (U_2_real (MapType1Select ZeroMask o_2@@1 f_4@@1)) NoPerm))))
 :qid |stdinbpl.106:22|
 :skolemid |13|
 :pattern ( (MapType1Select ZeroMask o_2@@1 f_4@@1))
)))
(assert (forall ((Heap@@40 T@U) (Mask@@20 T@U) (this@@43 T@U) (last@@25 T@U) (index@@2 Int) ) (!  (=> (and (and (and (and (= (type Heap@@40) (MapType0Type RefType)) (= (type Mask@@20) (MapType1Type RefType realType))) (= (type this@@43) RefType)) (= (type last@@25) RefType)) (state Heap@@40 Mask@@20)) (= (|segDegree'| Heap@@40 this@@43 last@@25 index@@2) (|segDegree#frame| (MapType0Select Heap@@40 null (heapseg this@@43 last@@25)) this@@43 last@@25 index@@2)))
 :qid |stdinbpl.1141:15|
 :skolemid |62|
 :pattern ( (state Heap@@40 Mask@@20) (|segDegree'| Heap@@40 this@@43 last@@25 index@@2))
 :pattern ( (state Heap@@40 Mask@@20) (|segDegree#triggerStateless| this@@43 last@@25 index@@2) (|heapseg#trigger| Heap@@40 (heapseg this@@43 last@@25)) (|heapseg#trigger| Heap@@40 (heapseg this@@43 last@@25)))
)))
(assert (forall ((Heap@@41 T@U) (this@@44 T@U) (last@@26 T@U) (index@@3 Int) ) (!  (=> (and (and (= (type Heap@@41) (MapType0Type RefType)) (= (type this@@44) RefType)) (= (type last@@26) RefType)) (and (= (segDegree Heap@@41 this@@44 last@@26 index@@3) (|segDegree'| Heap@@41 this@@44 last@@26 index@@3)) (dummyFunction (int_2_U (|segDegree#triggerStateless| this@@44 last@@26 index@@3)))))
 :qid |stdinbpl.1124:15|
 :skolemid |59|
 :pattern ( (segDegree Heap@@41 this@@44 last@@26 index@@3))
)))
(assert (forall ((this@@45 T@U) (last@@27 T@U) ) (!  (=> (and (= (type this@@45) RefType) (= (type last@@27) RefType)) (= (getPredWandId (heapseg this@@45 last@@27)) 1))
 :qid |stdinbpl.2406:15|
 :skolemid |99|
 :pattern ( (heapseg this@@45 last@@27))
)))
(assert (forall ((Heap@@42 T@U) (Mask@@21 T@U) (this@@46 T@U) (last@@28 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@42) (MapType0Type RefType)) (= (type Mask@@21) (MapType1Type RefType realType))) (= (type this@@46) RefType)) (= (type last@@28) RefType)) (and (state Heap@@42 Mask@@21) (or (< AssumeFunctionsAbove 1) (|segSize#trigger| (MapType0Select Heap@@42 null (heapseg this@@46 last@@28)) this@@46 last@@28)))) (= this@@46 last@@28)) (= (|segSize'| Heap@@42 this@@46 last@@28) 0))
 :qid |stdinbpl.970:15|
 :skolemid |56|
 :pattern ( (state Heap@@42 Mask@@21) (|segSize'| Heap@@42 this@@46 last@@28))
)))
(assert (forall ((Heap@@43 T@U) (ExhaleHeap@@4 T@U) (Mask@@22 T@U) (pm_f@@1 T@U) ) (! (let ((C@@1 (FieldTypeInv0 (type pm_f@@1))))
 (=> (and (and (and (and (and (= (type Heap@@43) (MapType0Type RefType)) (= (type ExhaleHeap@@4) (MapType0Type RefType))) (= (type Mask@@22) (MapType1Type RefType realType))) (= (type pm_f@@1) (FieldType C@@1 FrameTypeType))) (IdenticalOnKnownLocations Heap@@43 ExhaleHeap@@4 Mask@@22)) (and (HasDirectPerm Mask@@22 null pm_f@@1) (IsPredicateField pm_f@@1))) (forall ((o2 T@U) (f_2@@0 T@U) ) (! (let ((B@@5 (FieldTypeInv1 (type f_2@@0))))
(let ((A@@6 (FieldTypeInv0 (type f_2@@0))))
 (=> (and (and (= (type o2) RefType) (= (type f_2@@0) (FieldType A@@6 B@@5))) (U_2_bool (MapType1Select (MapType0Select Heap@@43 null (PredicateMaskField pm_f@@1)) o2 f_2@@0))) (= (MapType0Select Heap@@43 o2 f_2@@0) (MapType0Select ExhaleHeap@@4 o2 f_2@@0)))))
 :qid |stdinbpl.54:134|
 :skolemid |3|
 :pattern ( (MapType0Select ExhaleHeap@@4 o2 f_2@@0))
))))
 :qid |stdinbpl.52:19|
 :skolemid |4|
 :pattern ( (IdenticalOnKnownLocations Heap@@43 ExhaleHeap@@4 Mask@@22) (IsPredicateField pm_f@@1))
)))
(assert (forall ((Heap@@44 T@U) (ExhaleHeap@@5 T@U) (Mask@@23 T@U) (pm_f@@2 T@U) ) (! (let ((C@@2 (FieldTypeInv0 (type pm_f@@2))))
 (=> (and (and (and (and (and (= (type Heap@@44) (MapType0Type RefType)) (= (type ExhaleHeap@@5) (MapType0Type RefType))) (= (type Mask@@23) (MapType1Type RefType realType))) (= (type pm_f@@2) (FieldType C@@2 FrameTypeType))) (IdenticalOnKnownLocations Heap@@44 ExhaleHeap@@5 Mask@@23)) (and (HasDirectPerm Mask@@23 null pm_f@@2) (IsWandField pm_f@@2))) (forall ((o2@@0 T@U) (f_2@@1 T@U) ) (! (let ((B@@6 (FieldTypeInv1 (type f_2@@1))))
(let ((A@@7 (FieldTypeInv0 (type f_2@@1))))
 (=> (and (and (= (type o2@@0) RefType) (= (type f_2@@1) (FieldType A@@7 B@@6))) (U_2_bool (MapType1Select (MapType0Select Heap@@44 null (WandMaskField pm_f@@2)) o2@@0 f_2@@1))) (= (MapType0Select Heap@@44 o2@@0 f_2@@1) (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1)))))
 :qid |stdinbpl.67:129|
 :skolemid |6|
 :pattern ( (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1))
))))
 :qid |stdinbpl.65:19|
 :skolemid |7|
 :pattern ( (IdenticalOnKnownLocations Heap@@44 ExhaleHeap@@5 Mask@@23) (IsWandField pm_f@@2))
)))
(assert (forall ((this@@47 T@U) ) (!  (=> (= (type this@@47) RefType) (= (getPredWandId (tree this@@47)) 0))
 :qid |stdinbpl.2213:15|
 :skolemid |93|
 :pattern ( (tree this@@47))
)))
(assert (forall ((this@@48 T@U) ) (!  (=> (= (type this@@48) RefType) (= (getPredWandId (heap this@@48)) 2))
 :qid |stdinbpl.2524:15|
 :skolemid |105|
 :pattern ( (heap this@@48))
)))
(assert (forall ((Mask@@24 T@U) (o_2@@2 T@U) (f_4@@2 T@U) ) (! (let ((B@@7 (FieldTypeInv1 (type f_4@@2))))
(let ((A@@8 (FieldTypeInv0 (type f_4@@2))))
 (=> (and (and (and (= (type Mask@@24) (MapType1Type RefType realType)) (= (type o_2@@2) RefType)) (= (type f_4@@2) (FieldType A@@8 B@@7))) (GoodMask Mask@@24)) (and (>= (U_2_real (MapType1Select Mask@@24 o_2@@2 f_4@@2)) NoPerm) (=> (and (and (GoodMask Mask@@24) (not (IsPredicateField f_4@@2))) (not (IsWandField f_4@@2))) (<= (U_2_real (MapType1Select Mask@@24 o_2@@2 f_4@@2)) FullPerm))))))
 :qid |stdinbpl.128:22|
 :skolemid |16|
 :pattern ( (GoodMask Mask@@24) (MapType1Select Mask@@24 o_2@@2 f_4@@2))
)))
(assert (forall ((Heap@@45 T@U) (Mask@@25 T@U) (this@@49 T@U) (last@@29 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@45) (MapType0Type RefType)) (= (type Mask@@25) (MapType1Type RefType realType))) (= (type this@@49) RefType)) (= (type last@@29) RefType)) (and (state Heap@@45 Mask@@25) (or (< AssumeFunctionsAbove 8) (|segLength#trigger| (MapType0Select Heap@@45 null (heapseg this@@49 last@@29)) this@@49 last@@29)))) (<= 0 (|segLength'| Heap@@45 this@@49 last@@29)))
 :qid |stdinbpl.794:15|
 :skolemid |47|
 :pattern ( (state Heap@@45 Mask@@25) (|segLength'| Heap@@45 this@@49 last@@29))
)))
(assert (forall ((Heap@@46 T@U) (Mask@@26 T@U) (this@@50 T@U) ) (!  (=> (and (and (and (= (type Heap@@46) (MapType0Type RefType)) (= (type Mask@@26) (MapType1Type RefType realType))) (= (type this@@50) RefType)) (state Heap@@46 Mask@@26)) (= (|treeKey'| Heap@@46 this@@50) (|treeKey#frame| (MapType0Select Heap@@46 null (tree this@@50)) this@@50)))
 :qid |stdinbpl.237:15|
 :skolemid |25|
 :pattern ( (state Heap@@46 Mask@@26) (|treeKey'| Heap@@46 this@@50))
)))
(assert (forall ((Heap@@47 T@U) (Mask@@27 T@U) (this@@51 T@U) ) (!  (=> (and (and (and (= (type Heap@@47) (MapType0Type RefType)) (= (type Mask@@27) (MapType1Type RefType realType))) (= (type this@@51) RefType)) (state Heap@@47 Mask@@27)) (= (|treeDegree'| Heap@@47 this@@51) (|treeDegree#frame| (MapType0Select Heap@@47 null (tree this@@51)) this@@51)))
 :qid |stdinbpl.366:15|
 :skolemid |30|
 :pattern ( (state Heap@@47 Mask@@27) (|treeDegree'| Heap@@47 this@@51))
)))
(assert (forall ((Heap@@48 T@U) (Mask@@28 T@U) (this@@52 T@U) ) (!  (=> (and (and (and (= (type Heap@@48) (MapType0Type RefType)) (= (type Mask@@28) (MapType1Type RefType realType))) (= (type this@@52) RefType)) (state Heap@@48 Mask@@28)) (= (|treeSize'| Heap@@48 this@@52) (|treeSize#frame| (MapType0Select Heap@@48 null (tree this@@52)) this@@52)))
 :qid |stdinbpl.507:15|
 :skolemid |36|
 :pattern ( (state Heap@@48 Mask@@28) (|treeSize'| Heap@@48 this@@52))
 :pattern ( (state Heap@@48 Mask@@28) (|treeSize#triggerStateless| this@@52) (|tree#trigger| Heap@@48 (tree this@@52)))
)))
(assert (forall ((arg0@@39 T@U) (arg1@@18 T@U) ) (! (= (type (|treeParent#frame| arg0@@39 arg1@@18)) RefType)
 :qid |funType:treeParent#frame|
 :pattern ( (|treeParent#frame| arg0@@39 arg1@@18))
)))
(assert (forall ((Heap@@49 T@U) (Mask@@29 T@U) (this@@53 T@U) ) (!  (=> (and (and (and (= (type Heap@@49) (MapType0Type RefType)) (= (type Mask@@29) (MapType1Type RefType realType))) (= (type this@@53) RefType)) (state Heap@@49 Mask@@29)) (= (|treeParent'| Heap@@49 this@@53) (|treeParent#frame| (MapType0Select Heap@@49 null (tree this@@53)) this@@53)))
 :qid |stdinbpl.659:15|
 :skolemid |41|
 :pattern ( (state Heap@@49 Mask@@29) (|treeParent'| Heap@@49 this@@53))
)))
(assert (forall ((o T@U) (f T@U) (Heap@@50 T@U) ) (!  (=> (and (and (and (= (type o) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap@@50) (MapType0Type RefType))) (U_2_bool (MapType0Select Heap@@50 o $allocated))) (U_2_bool (MapType0Select Heap@@50 (MapType0Select Heap@@50 o f) $allocated)))
 :qid |stdinbpl.31:15|
 :skolemid |0|
 :pattern ( (MapType0Select Heap@@50 o f))
)))
(assert (forall ((this@@54 T@U) (last@@30 T@U) ) (!  (=> (and (= (type this@@54) RefType) (= (type last@@30) RefType)) (= (PredicateMaskField (heapseg this@@54 last@@30)) (|heapseg#sm| this@@54 last@@30)))
 :qid |stdinbpl.2398:15|
 :skolemid |97|
 :pattern ( (PredicateMaskField (heapseg this@@54 last@@30)))
)))
(assert (forall ((Heap@@51 T@U) (Mask@@30 T@U) (this@@55 T@U) (last@@31 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@51) (MapType0Type RefType)) (= (type Mask@@30) (MapType1Type RefType realType))) (= (type this@@55) RefType)) (= (type last@@31) RefType)) (and (state Heap@@51 Mask@@30) (< AssumeFunctionsAbove 0))) (= (sorted Heap@@51 this@@55 last@@31)  (=> (< 1 (segLength Heap@@51 this@@55 last@@31)) (and (< (treeDegree Heap@@51 this@@55) (segDegree Heap@@51 (MapType0Select Heap@@51 this@@55 sibling) last@@31 0)) (|sorted'| Heap@@51 (MapType0Select Heap@@51 this@@55 sibling) last@@31)))))
 :qid |stdinbpl.1475:15|
 :skolemid |74|
 :pattern ( (state Heap@@51 Mask@@30) (sorted Heap@@51 this@@55 last@@31))
 :pattern ( (state Heap@@51 Mask@@30) (|sorted#triggerStateless| this@@55 last@@31) (|heapseg#trigger| Heap@@51 (heapseg this@@55 last@@31)) (|heapseg#trigger| Heap@@51 (heapseg this@@55 last@@31)) (|heapseg#trigger| Heap@@51 (heapseg this@@55 last@@31)))
)))
(assert (forall ((this@@56 T@U) ) (!  (=> (= (type this@@56) RefType) (= (PredicateMaskField (tree this@@56)) (|tree#sm| this@@56)))
 :qid |stdinbpl.2205:15|
 :skolemid |91|
 :pattern ( (PredicateMaskField (tree this@@56)))
)))
(assert (forall ((this@@57 T@U) ) (!  (=> (= (type this@@57) RefType) (= (PredicateMaskField (heap this@@57)) (|heap#sm| this@@57)))
 :qid |stdinbpl.2516:15|
 :skolemid |103|
 :pattern ( (PredicateMaskField (heap this@@57)))
)))
(assert (forall ((Heap@@52 T@U) (o@@0 T@U) (f_3 T@U) (v T@U) ) (! (let ((B@@8 (type v)))
(let ((A@@9 (FieldTypeInv0 (type f_3))))
 (=> (and (and (= (type Heap@@52) (MapType0Type RefType)) (= (type o@@0) RefType)) (= (type f_3) (FieldType A@@9 B@@8))) (succHeap Heap@@52 (MapType0Store Heap@@52 o@@0 f_3 v)))))
 :qid |stdinbpl.78:22|
 :skolemid |9|
 :pattern ( (MapType0Store Heap@@52 o@@0 f_3 v))
)))
(assert (forall ((Heap@@53 T@U) (Mask@@31 T@U) (this@@58 T@U) ) (!  (=> (and (and (and (= (type Heap@@53) (MapType0Type RefType)) (= (type Mask@@31) (MapType1Type RefType realType))) (= (type this@@58) RefType)) (and (state Heap@@53 Mask@@31) (< AssumeFunctionsAbove 3))) (= (treeKey Heap@@53 this@@58) (U_2_int (MapType0Select Heap@@53 this@@58 key))))
 :qid |stdinbpl.230:15|
 :skolemid |24|
 :pattern ( (state Heap@@53 Mask@@31) (treeKey Heap@@53 this@@58))
 :pattern ( (state Heap@@53 Mask@@31) (|treeKey#triggerStateless| this@@58) (|tree#trigger| Heap@@53 (tree this@@58)))
)))
(assert (forall ((Heap@@54 T@U) (Mask@@32 T@U) (this@@59 T@U) ) (!  (=> (and (and (and (= (type Heap@@54) (MapType0Type RefType)) (= (type Mask@@32) (MapType1Type RefType realType))) (= (type this@@59) RefType)) (and (state Heap@@54 Mask@@32) (< AssumeFunctionsAbove 6))) (= (treeParent Heap@@54 this@@59) (MapType0Select Heap@@54 this@@59 parent)))
 :qid |stdinbpl.652:15|
 :skolemid |40|
 :pattern ( (state Heap@@54 Mask@@32) (treeParent Heap@@54 this@@59))
 :pattern ( (state Heap@@54 Mask@@32) (|treeParent#triggerStateless| this@@59) (|tree#trigger| Heap@@54 (tree this@@59)))
)))
(assert (forall ((Heap@@55 T@U) (Mask@@33 T@U) (this@@60 T@U) ) (!  (=> (and (and (and (= (type Heap@@55) (MapType0Type RefType)) (= (type Mask@@33) (MapType1Type RefType realType))) (= (type this@@60) RefType)) (and (state Heap@@55 Mask@@33) (< AssumeFunctionsAbove 9))) (= (treeDegree Heap@@55 this@@60) (U_2_int (MapType0Select Heap@@55 this@@60 degree))))
 :qid |stdinbpl.359:15|
 :skolemid |29|
 :pattern ( (state Heap@@55 Mask@@33) (treeDegree Heap@@55 this@@60))
 :pattern ( (state Heap@@55 Mask@@33) (|treeDegree#triggerStateless| this@@60) (|tree#trigger| Heap@@55 (tree this@@60)))
)))
(assert (= (type ZeroPMask) (MapType1Type RefType boolType)))
(assert (forall ((o_2@@3 T@U) (f_4@@3 T@U) ) (! (let ((B@@9 (FieldTypeInv1 (type f_4@@3))))
(let ((A@@10 (FieldTypeInv0 (type f_4@@3))))
 (=> (and (= (type o_2@@3) RefType) (= (type f_4@@3) (FieldType A@@10 B@@9))) (not (U_2_bool (MapType1Select ZeroPMask o_2@@3 f_4@@3))))))
 :qid |stdinbpl.112:22|
 :skolemid |14|
 :pattern ( (MapType1Select ZeroPMask o_2@@3 f_4@@3))
)))
(assert (forall ((Heap@@56 T@U) (Mask@@34 T@U) (this@@61 T@U) (last@@32 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@56) (MapType0Type RefType)) (= (type Mask@@34) (MapType1Type RefType realType))) (= (type this@@61) RefType)) (= (type last@@32) RefType)) (and (state Heap@@56 Mask@@34) (< AssumeFunctionsAbove 2))) (= (validChildren Heap@@56 this@@61 last@@32)  (=> (< 1 (segLength Heap@@56 this@@61 last@@32)) (and (= (treeDegree Heap@@56 this@@61) (+ (segDegree Heap@@56 (MapType0Select Heap@@56 this@@61 sibling) last@@32 0) 1)) (|validChildren'| Heap@@56 (MapType0Select Heap@@56 this@@61 sibling) last@@32)))))
 :qid |stdinbpl.2013:15|
 :skolemid |87|
 :pattern ( (state Heap@@56 Mask@@34) (validChildren Heap@@56 this@@61 last@@32))
 :pattern ( (state Heap@@56 Mask@@34) (|validChildren#triggerStateless| this@@61 last@@32) (|heapseg#trigger| Heap@@56 (heapseg this@@61 last@@32)) (|heapseg#trigger| Heap@@56 (heapseg this@@61 last@@32)) (|heapseg#trigger| Heap@@56 (heapseg this@@61 last@@32)))
)))
(assert (forall ((p@@1 T@U) (v_1@@0 T@U) (q T@U) (w@@0 T@U) (r T@U) (u T@U) ) (! (let ((C@@3 (FieldTypeInv0 (type r))))
(let ((B@@10 (FieldTypeInv0 (type q))))
(let ((A@@11 (FieldTypeInv0 (type p@@1))))
 (=> (and (and (and (and (and (and (= (type p@@1) (FieldType A@@11 FrameTypeType)) (= (type v_1@@0) FrameTypeType)) (= (type q) (FieldType B@@10 FrameTypeType))) (= (type w@@0) FrameTypeType)) (= (type r) (FieldType C@@3 FrameTypeType))) (= (type u) FrameTypeType)) (and (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))) (InsidePredicate p@@1 v_1@@0 r u)))))
 :qid |stdinbpl.177:25|
 :skolemid |20|
 :pattern ( (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
(assert (forall ((Heap@@57 T@U) (Mask@@35 T@U) (this@@62 T@U) (last@@33 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@57) (MapType0Type RefType)) (= (type Mask@@35) (MapType1Type RefType realType))) (= (type this@@62) RefType)) (= (type last@@33) RefType)) (and (state Heap@@57 Mask@@35) (< AssumeFunctionsAbove 4))) (not (= this@@62 last@@33))) (= (segParent Heap@@57 this@@62 last@@33) (treeParent Heap@@57 this@@62)))
 :qid |stdinbpl.1336:15|
 :skolemid |68|
 :pattern ( (state Heap@@57 Mask@@35) (segParent Heap@@57 this@@62 last@@33))
 :pattern ( (state Heap@@57 Mask@@35) (|segParent#triggerStateless| this@@62 last@@33) (|heapseg#trigger| Heap@@57 (heapseg this@@62 last@@33)))
)))
(assert (forall ((Heap@@58 T@U) (this@@63 T@U) (last@@34 T@U) ) (!  (=> (and (and (= (type Heap@@58) (MapType0Type RefType)) (= (type this@@63) RefType)) (= (type last@@34) RefType)) (and (= (sorted Heap@@58 this@@63 last@@34) (|sorted'| Heap@@58 this@@63 last@@34)) (dummyFunction (bool_2_U (|sorted#triggerStateless| this@@63 last@@34)))))
 :qid |stdinbpl.1465:15|
 :skolemid |72|
 :pattern ( (sorted Heap@@58 this@@63 last@@34))
)))
(assert (forall ((Heap@@59 T@U) (this@@64 T@U) (last@@35 T@U) ) (!  (=> (and (and (= (type Heap@@59) (MapType0Type RefType)) (= (type this@@64) RefType)) (= (type last@@35) RefType)) (and (= (presorted Heap@@59 this@@64 last@@35) (|presorted'| Heap@@59 this@@64 last@@35)) (dummyFunction (bool_2_U (|presorted#triggerStateless| this@@64 last@@35)))))
 :qid |stdinbpl.1702:15|
 :skolemid |79|
 :pattern ( (presorted Heap@@59 this@@64 last@@35))
)))
(assert (forall ((Heap@@60 T@U) (this@@65 T@U) (last@@36 T@U) ) (!  (=> (and (and (= (type Heap@@60) (MapType0Type RefType)) (= (type this@@65) RefType)) (= (type last@@36) RefType)) (and (= (validChildren Heap@@60 this@@65 last@@36) (|validChildren'| Heap@@60 this@@65 last@@36)) (dummyFunction (bool_2_U (|validChildren#triggerStateless| this@@65 last@@36)))))
 :qid |stdinbpl.2003:15|
 :skolemid |85|
 :pattern ( (validChildren Heap@@60 this@@65 last@@36))
)))
(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun UnfoldingMask@5 () T@U)
(declare-fun Heap@@61 () T@U)
(declare-fun this@@66 () T@U)
(declare-fun UnfoldingMask@0 () T@U)
(declare-fun Mask@0 () T@U)
(declare-fun UnfoldingMask@1 () T@U)
(declare-fun UnfoldingMask@2 () T@U)
(declare-fun UnfoldingMask@3 () T@U)
(declare-fun UnfoldingMask@4 () T@U)
(declare-fun CombineFrames (T@U T@U) T@U)
(declare-fun FrameFragment (T@U) T@U)
(assert  (and (and (and (and (and (and (and (and (and (and (= (type Heap@@61) (MapType0Type RefType)) (= (type this@@66) RefType)) (= (type UnfoldingMask@5) (MapType1Type RefType realType))) (= (type UnfoldingMask@0) (MapType1Type RefType realType))) (= (type Mask@0) (MapType1Type RefType realType))) (= (type UnfoldingMask@1) (MapType1Type RefType realType))) (= (type UnfoldingMask@2) (MapType1Type RefType realType))) (= (type UnfoldingMask@3) (MapType1Type RefType realType))) (= (type UnfoldingMask@4) (MapType1Type RefType realType))) (forall ((arg0@@40 T@U) (arg1@@19 T@U) ) (! (= (type (CombineFrames arg0@@40 arg1@@19)) FrameTypeType)
 :qid |funType:CombineFrames|
 :pattern ( (CombineFrames arg0@@40 arg1@@19))
))) (forall ((arg0@@41 T@U) ) (! (= (type (FrameFragment arg0@@41)) FrameTypeType)
 :qid |funType:FrameFragment|
 :pattern ( (FrameFragment arg0@@41))
))))
(set-info :boogie-vc-id |treeSize#definedness|)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 21) (let ((anon11_correct true))
(let ((anon18_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 6) 3)) anon11_correct)))
(let ((anon18_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 4) (- 0 5)) (<= FullPerm (U_2_real (MapType1Select UnfoldingMask@5 null (heapseg (MapType0Select Heap@@61 this@@66 child) null))))) (=> (<= FullPerm (U_2_real (MapType1Select UnfoldingMask@5 null (heapseg (MapType0Select Heap@@61 this@@66 child) null)))) (=> (= (ControlFlow 0 4) 3) anon11_correct))))))
(let ((anon12_correct true))
(let ((anon16_Else_correct  (=> (not (= (U_2_int (MapType0Select Heap@@61 this@@66 degree)) 0)) (and (=> (= (ControlFlow 0 7) (- 0 8)) (HasDirectPerm UnfoldingMask@5 this@@66 child)) (=> (HasDirectPerm UnfoldingMask@5 this@@66 child) (and (and (=> (= (ControlFlow 0 7) 1) anon12_correct) (=> (= (ControlFlow 0 7) 4) anon18_Then_correct)) (=> (= (ControlFlow 0 7) 6) anon18_Else_correct)))))))
(let ((anon16_Then_correct  (=> (and (= (U_2_int (MapType0Select Heap@@61 this@@66 degree)) 0) (= (ControlFlow 0 2) 1)) anon12_correct)))
(let ((anon6_correct  (=> (state Heap@@61 UnfoldingMask@5) (and (=> (= (ControlFlow 0 9) (- 0 10)) (HasDirectPerm UnfoldingMask@5 this@@66 degree)) (=> (HasDirectPerm UnfoldingMask@5 this@@66 degree) (and (=> (= (ControlFlow 0 9) 2) anon16_Then_correct) (=> (= (ControlFlow 0 9) 7) anon16_Else_correct)))))))
(let ((anon15_Else_correct  (=> (and (= (MapType0Select Heap@@61 this@@66 child) null) (= (ControlFlow 0 12) 9)) anon6_correct)))
(let ((anon15_Then_correct  (=> (and (and (not (= (MapType0Select Heap@@61 this@@66 child) null)) (state Heap@@61 UnfoldingMask@5)) (and (= (segParent Heap@@61 (MapType0Select Heap@@61 this@@66 child) null) this@@66) (= (ControlFlow 0 11) 9))) anon6_correct)))
(let ((anon4_correct  (=> (and (state Heap@@61 UnfoldingMask@5) (validChildren Heap@@61 (MapType0Select Heap@@61 this@@66 child) null)) (and (=> (= (ControlFlow 0 13) 11) anon15_Then_correct) (=> (= (ControlFlow 0 13) 12) anon15_Else_correct)))))
(let ((anon14_Else_correct  (=> (and (<= (U_2_int (MapType0Select Heap@@61 this@@66 degree)) 0) (= (ControlFlow 0 15) 13)) anon4_correct)))
(let ((anon14_Then_correct  (=> (and (and (< 0 (U_2_int (MapType0Select Heap@@61 this@@66 degree))) (state Heap@@61 UnfoldingMask@5)) (and (= (segDegree Heap@@61 (MapType0Select Heap@@61 this@@66 child) null 0) (- (U_2_int (MapType0Select Heap@@61 this@@66 degree)) 1)) (= (ControlFlow 0 14) 13))) anon4_correct)))
(let ((anon2_correct  (=> (= UnfoldingMask@0 (MapType1Store Mask@0 null (tree this@@66) (real_2_U (- (U_2_real (MapType1Select Mask@0 null (tree this@@66))) FullPerm)))) (=> (and (not (= this@@66 null)) (= UnfoldingMask@1 (MapType1Store UnfoldingMask@0 this@@66 key (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@0 this@@66 key)) FullPerm))))) (=> (and (and (and (and (state Heap@@61 UnfoldingMask@1) (not (= this@@66 null))) (and (= UnfoldingMask@2 (MapType1Store UnfoldingMask@1 this@@66 degree (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@1 this@@66 degree)) FullPerm)))) (state Heap@@61 UnfoldingMask@2))) (and (and (not (= this@@66 null)) (= UnfoldingMask@3 (MapType1Store UnfoldingMask@2 this@@66 child (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@2 this@@66 child)) FullPerm))))) (and (state Heap@@61 UnfoldingMask@3) (not (= this@@66 null))))) (and (and (and (= UnfoldingMask@4 (MapType1Store UnfoldingMask@3 this@@66 parent (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@3 this@@66 parent)) FullPerm)))) (state Heap@@61 UnfoldingMask@4)) (and (<= 0 (U_2_int (MapType0Select Heap@@61 this@@66 degree))) (= UnfoldingMask@5 (MapType1Store UnfoldingMask@4 null (heapseg (MapType0Select Heap@@61 this@@66 child) null) (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@4 null (heapseg (MapType0Select Heap@@61 this@@66 child) null))) FullPerm)))))) (and (and (InsidePredicate (tree this@@66) (MapType0Select Heap@@61 null (tree this@@66)) (heapseg (MapType0Select Heap@@61 this@@66 child) null) (MapType0Select Heap@@61 null (heapseg (MapType0Select Heap@@61 this@@66 child) null))) (state Heap@@61 UnfoldingMask@5)) (and (state Heap@@61 UnfoldingMask@5) (= (U_2_int (MapType0Select Heap@@61 this@@66 degree)) (segLength Heap@@61 (MapType0Select Heap@@61 this@@66 child) null)))))) (and (=> (= (ControlFlow 0 16) 14) anon14_Then_correct) (=> (= (ControlFlow 0 16) 15) anon14_Else_correct)))))))
(let ((anon13_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 19) 16)) anon2_correct)))
(let ((anon13_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 17) (- 0 18)) (<= FullPerm (U_2_real (MapType1Select Mask@0 null (tree this@@66))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@0 null (tree this@@66)))) (=> (= (ControlFlow 0 17) 16) anon2_correct))))))
(let ((anon0_correct  (=> (and (and (and (state Heap@@61 ZeroMask) (U_2_bool (MapType0Select Heap@@61 this@@66 $allocated))) (and (= AssumeFunctionsAbove 1) (= Mask@0 (MapType1Store ZeroMask null (tree this@@66) (real_2_U (+ (U_2_real (MapType1Select ZeroMask null (tree this@@66))) FullPerm)))))) (and (and (state Heap@@61 Mask@0) (state Heap@@61 Mask@0)) (and (|tree#trigger| Heap@@61 (tree this@@66)) (= (MapType0Select Heap@@61 null (tree this@@66)) (CombineFrames (FrameFragment (MapType0Select Heap@@61 this@@66 key)) (CombineFrames (FrameFragment (MapType0Select Heap@@61 this@@66 degree)) (CombineFrames (FrameFragment (MapType0Select Heap@@61 this@@66 child)) (CombineFrames (FrameFragment (MapType0Select Heap@@61 this@@66 parent)) (CombineFrames (MapType0Select Heap@@61 null (heapseg (MapType0Select Heap@@61 this@@66 child) null)) (CombineFrames (FrameFragment (ite (< 0 (U_2_int (MapType0Select Heap@@61 this@@66 degree))) EmptyFrame EmptyFrame)) (FrameFragment (ite (not (= (MapType0Select Heap@@61 this@@66 child) null)) EmptyFrame EmptyFrame)))))))))))) (and (=> (= (ControlFlow 0 20) 17) anon13_Then_correct) (=> (= (ControlFlow 0 20) 19) anon13_Else_correct)))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 21) 20) anon0_correct)))
PreconditionGeneratedEntry_correct))))))))))))))))))
))
(check-sat)
(pop 1)
; Valid
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
(declare-fun key () T@U)
(declare-fun degree () T@U)
(declare-fun parent () T@U)
(declare-fun sibling () T@U)
(declare-fun child () T@U)
(declare-fun Nodes () T@U)
(declare-fun size () T@U)
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
(declare-fun segLength (T@U T@U T@U) Int)
(declare-fun |segLength#triggerStateless| (T@U T@U) Int)
(declare-fun |heapseg#trigger| (T@U T@U) Bool)
(declare-fun heapseg (T@U T@U) T@U)
(declare-fun MapType1Type (T@T T@T) T@T)
(declare-fun AssumeFunctionsAbove () Int)
(declare-fun |segLength'| (T@U T@U T@U) Int)
(declare-fun MapType1TypeInv0 (T@T) T@T)
(declare-fun MapType1TypeInv1 (T@T) T@T)
(declare-fun MapType1Select (T@U T@U T@U) T@U)
(declare-fun MapType1Store (T@U T@U T@U T@U) T@U)
(declare-fun PredicateType_heapsegType () T@T)
(declare-fun FrameTypeType () T@T)
(declare-fun |treeDegree'| (T@U T@U) Int)
(declare-fun |treeDegree#trigger| (T@U T@U) Bool)
(declare-fun null () T@U)
(declare-fun tree (T@U) T@U)
(declare-fun PredicateType_treeType () T@T)
(declare-fun GoodMask (T@U) Bool)
(declare-fun |segDegree'| (T@U T@U T@U Int) Int)
(declare-fun dummyFunction (T@U) Bool)
(declare-fun |segDegree#triggerStateless| (T@U T@U Int) Int)
(declare-fun segSize (T@U T@U T@U) Int)
(declare-fun |segSize#triggerStateless| (T@U T@U) Int)
(declare-fun |treeSize'| (T@U T@U) Int)
(declare-fun |segSize'| (T@U T@U T@U) Int)
(declare-fun IsPredicateField (T@U) Bool)
(declare-fun |segParent'| (T@U T@U T@U) T@U)
(declare-fun |segParent#triggerStateless| (T@U T@U) T@U)
(declare-fun |sorted'| (T@U T@U T@U) Bool)
(declare-fun |sorted#triggerStateless| (T@U T@U) Bool)
(declare-fun |presorted'| (T@U T@U T@U) Bool)
(declare-fun |presorted#triggerStateless| (T@U T@U) Bool)
(declare-fun |validChildren'| (T@U T@U T@U) Bool)
(declare-fun |validChildren#triggerStateless| (T@U T@U) Bool)
(declare-fun |heapseg#everUsed| (T@U) Bool)
(declare-fun IdenticalOnKnownLocations (T@U T@U T@U) Bool)
(declare-fun PredicateMaskField (T@U) T@U)
(declare-fun HasDirectPerm (T@U T@U T@U) Bool)
(declare-fun IsWandField (T@U) Bool)
(declare-fun WandMaskField (T@U) T@U)
(declare-fun heap (T@U) T@U)
(declare-fun PredicateType_heapType () T@T)
(declare-fun |treeKey'| (T@U T@U) Int)
(declare-fun |treeKey#triggerStateless| (T@U) Int)
(declare-fun |treeDegree#triggerStateless| (T@U) Int)
(declare-fun |treeSize#triggerStateless| (T@U) Int)
(declare-fun |treeParent'| (T@U T@U) T@U)
(declare-fun |treeParent#triggerStateless| (T@U) T@U)
(declare-fun |tree#trigger| (T@U T@U) Bool)
(declare-fun |tree#everUsed| (T@U) Bool)
(declare-fun |heap#trigger| (T@U T@U) Bool)
(declare-fun |heap#everUsed| (T@U) Bool)
(declare-fun segDegree (T@U T@U T@U Int) Int)
(declare-fun treeDegree (T@U T@U) Int)
(declare-fun |sorted#frame| (T@U T@U T@U) Bool)
(declare-fun |presorted#frame| (T@U T@U T@U) Bool)
(declare-fun |validChildren#frame| (T@U T@U T@U) Bool)
(declare-fun treeKey (T@U T@U) Int)
(declare-fun treeSize (T@U T@U) Int)
(declare-fun treeParent (T@U T@U) T@U)
(declare-fun |heapseg#sm| (T@U T@U) T@U)
(declare-fun |tree#sm| (T@U) T@U)
(declare-fun |heap#sm| (T@U) T@U)
(declare-fun |segLength#frame| (T@U T@U T@U) Int)
(declare-fun |segSize#frame| (T@U T@U T@U) Int)
(declare-fun |segParent#frame| (T@U T@U T@U) T@U)
(declare-fun presorted (T@U T@U T@U) Bool)
(declare-fun dummyHeap () T@U)
(declare-fun ZeroMask () T@U)
(declare-fun InsidePredicate (T@U T@U T@U T@U) Bool)
(declare-fun sumMask (T@U T@U T@U) Bool)
(declare-fun ConditionalFrame (Real T@U) T@U)
(declare-fun EmptyFrame () T@U)
(declare-fun NoPerm () Real)
(declare-fun |sorted#trigger| (T@U T@U T@U) Bool)
(declare-fun segParent (T@U T@U T@U) T@U)
(declare-fun |segDegree#trigger| (T@U T@U T@U Int) Bool)
(declare-fun |segDegree#frame| (T@U T@U T@U Int) Int)
(declare-fun getPredWandId (T@U) Int)
(declare-fun |segSize#trigger| (T@U T@U T@U) Bool)
(declare-fun FullPerm () Real)
(declare-fun |segLength#trigger| (T@U T@U T@U) Bool)
(declare-fun |treeKey#frame| (T@U T@U) Int)
(declare-fun |treeDegree#frame| (T@U T@U) Int)
(declare-fun |treeSize#frame| (T@U T@U) Int)
(declare-fun |treeParent#frame| (T@U T@U) T@U)
(declare-fun sorted (T@U T@U T@U) Bool)
(declare-fun ZeroPMask () T@U)
(declare-fun validChildren (T@U T@U T@U) Bool)
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
))) (= (Ctor NormalFieldType) 7)) (= (type $allocated) (FieldType NormalFieldType boolType))) (= (type key) (FieldType NormalFieldType intType))) (= (type degree) (FieldType NormalFieldType intType))) (= (Ctor RefType) 8)) (= (type parent) (FieldType NormalFieldType RefType))) (= (type sibling) (FieldType NormalFieldType RefType))) (= (type child) (FieldType NormalFieldType RefType))) (= (type Nodes) (FieldType NormalFieldType RefType))) (= (type size) (FieldType NormalFieldType intType))))
(assert (distinct $allocated key degree parent sibling child Nodes size)
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
(assert  (and (and (and (and (and (and (and (and (and (forall ((arg0@@18 T@T) (arg1@@4 T@T) ) (! (= (Ctor (MapType1Type arg0@@18 arg1@@4)) 10)
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
)))) (= (Ctor PredicateType_heapsegType) 11)) (= (Ctor FrameTypeType) 12)) (forall ((arg0@@23 T@U) (arg1@@9 T@U) ) (! (= (type (heapseg arg0@@23 arg1@@9)) (FieldType PredicateType_heapsegType FrameTypeType))
 :qid |funType:heapseg|
 :pattern ( (heapseg arg0@@23 arg1@@9))
))))
(assert (forall ((Heap T@U) (Mask T@U) (this T@U) (last T@U) ) (!  (=> (and (and (and (and (= (type Heap) (MapType0Type RefType)) (= (type Mask) (MapType1Type RefType realType))) (= (type this) RefType)) (= (type last) RefType)) (and (state Heap Mask) (< AssumeFunctionsAbove 8))) (= (segLength Heap this last) (ite (= this last) 0 (+ 1 (|segLength'| Heap (MapType0Select Heap this sibling) last)))))
 :qid |stdinbpl.781:15|
 :skolemid |45|
 :pattern ( (state Heap Mask) (segLength Heap this last))
 :pattern ( (state Heap Mask) (|segLength#triggerStateless| this last) (|heapseg#trigger| Heap (heapseg this last)))
)))
(assert  (and (and (= (type null) RefType) (= (Ctor PredicateType_treeType) 13)) (forall ((arg0@@24 T@U) ) (! (= (type (tree arg0@@24)) (FieldType PredicateType_treeType FrameTypeType))
 :qid |funType:tree|
 :pattern ( (tree arg0@@24))
))))
(assert (forall ((Heap@@0 T@U) (Mask@@0 T@U) (this@@0 T@U) ) (!  (=> (and (and (and (= (type Heap@@0) (MapType0Type RefType)) (= (type Mask@@0) (MapType1Type RefType realType))) (= (type this@@0) RefType)) (and (state Heap@@0 Mask@@0) (or (< AssumeFunctionsAbove 9) (|treeDegree#trigger| (MapType0Select Heap@@0 null (tree this@@0)) this@@0)))) (<= 0 (|treeDegree'| Heap@@0 this@@0)))
 :qid |stdinbpl.372:15|
 :skolemid |31|
 :pattern ( (state Heap@@0 Mask@@0) (|treeDegree'| Heap@@0 this@@0))
)))
(assert (forall ((Heap@@1 T@U) (Mask@@1 T@U) ) (!  (=> (and (and (= (type Heap@@1) (MapType0Type RefType)) (= (type Mask@@1) (MapType1Type RefType realType))) (state Heap@@1 Mask@@1)) (GoodMask Mask@@1))
 :qid |stdinbpl.124:15|
 :skolemid |15|
 :pattern ( (state Heap@@1 Mask@@1))
)))
(assert (forall ((Heap0@@0 T@U) (Heap1@@0 T@U) (Heap2 T@U) ) (!  (=> (and (and (and (= (type Heap0@@0) (MapType0Type RefType)) (= (type Heap1@@0) (MapType0Type RefType))) (= (type Heap2) (MapType0Type RefType))) (and (succHeapTrans Heap0@@0 Heap1@@0) (succHeap Heap1@@0 Heap2))) (succHeapTrans Heap0@@0 Heap2))
 :qid |stdinbpl.93:15|
 :skolemid |12|
 :pattern ( (succHeapTrans Heap0@@0 Heap1@@0) (succHeap Heap1@@0 Heap2))
)))
(assert (forall ((Heap@@2 T@U) (this@@1 T@U) (last@@0 T@U) (index Int) ) (!  (=> (and (and (= (type Heap@@2) (MapType0Type RefType)) (= (type this@@1) RefType)) (= (type last@@0) RefType)) (dummyFunction (int_2_U (|segDegree#triggerStateless| this@@1 last@@0 index))))
 :qid |stdinbpl.1128:15|
 :skolemid |60|
 :pattern ( (|segDegree'| Heap@@2 this@@1 last@@0 index))
)))
(assert (forall ((Heap@@3 T@U) (Mask@@2 T@U) (this@@2 T@U) (last@@1 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@3) (MapType0Type RefType)) (= (type Mask@@2) (MapType1Type RefType realType))) (= (type this@@2) RefType)) (= (type last@@1) RefType)) (and (state Heap@@3 Mask@@2) (< AssumeFunctionsAbove 1))) (= (segSize Heap@@3 this@@2 last@@1) (ite (= this@@2 last@@1) 0 (+ (|treeSize'| Heap@@3 this@@2) (|segSize'| Heap@@3 (MapType0Select Heap@@3 this@@2 sibling) last@@1)))))
 :qid |stdinbpl.957:15|
 :skolemid |54|
 :pattern ( (state Heap@@3 Mask@@2) (segSize Heap@@3 this@@2 last@@1))
 :pattern ( (state Heap@@3 Mask@@2) (|segSize#triggerStateless| this@@2 last@@1) (|heapseg#trigger| Heap@@3 (heapseg this@@2 last@@1)) (|heapseg#trigger| Heap@@3 (heapseg this@@2 last@@1)))
)))
(assert (forall ((this@@3 T@U) (last@@2 T@U) ) (!  (=> (and (= (type this@@3) RefType) (= (type last@@2) RefType)) (IsPredicateField (heapseg this@@3 last@@2)))
 :qid |stdinbpl.2402:15|
 :skolemid |98|
 :pattern ( (heapseg this@@3 last@@2))
)))
(assert (forall ((Heap@@4 T@U) (this@@4 T@U) (last@@3 T@U) ) (!  (=> (and (and (= (type Heap@@4) (MapType0Type RefType)) (= (type this@@4) RefType)) (= (type last@@3) RefType)) (dummyFunction (int_2_U (|segLength#triggerStateless| this@@4 last@@3))))
 :qid |stdinbpl.775:15|
 :skolemid |44|
 :pattern ( (|segLength'| Heap@@4 this@@4 last@@3))
)))
(assert (forall ((Heap@@5 T@U) (this@@5 T@U) (last@@4 T@U) ) (!  (=> (and (and (= (type Heap@@5) (MapType0Type RefType)) (= (type this@@5) RefType)) (= (type last@@4) RefType)) (dummyFunction (int_2_U (|segSize#triggerStateless| this@@5 last@@4))))
 :qid |stdinbpl.951:15|
 :skolemid |53|
 :pattern ( (|segSize'| Heap@@5 this@@5 last@@4))
)))
(assert  (and (forall ((arg0@@25 T@U) (arg1@@10 T@U) (arg2@@3 T@U) ) (! (= (type (|segParent'| arg0@@25 arg1@@10 arg2@@3)) RefType)
 :qid |funType:segParent'|
 :pattern ( (|segParent'| arg0@@25 arg1@@10 arg2@@3))
)) (forall ((arg0@@26 T@U) (arg1@@11 T@U) ) (! (= (type (|segParent#triggerStateless| arg0@@26 arg1@@11)) RefType)
 :qid |funType:segParent#triggerStateless|
 :pattern ( (|segParent#triggerStateless| arg0@@26 arg1@@11))
))))
(assert (forall ((Heap@@6 T@U) (this@@6 T@U) (last@@5 T@U) ) (!  (=> (and (and (= (type Heap@@6) (MapType0Type RefType)) (= (type this@@6) RefType)) (= (type last@@5) RefType)) (dummyFunction (|segParent#triggerStateless| this@@6 last@@5)))
 :qid |stdinbpl.1330:15|
 :skolemid |67|
 :pattern ( (|segParent'| Heap@@6 this@@6 last@@5))
)))
(assert (forall ((Heap@@7 T@U) (this@@7 T@U) (last@@6 T@U) ) (!  (=> (and (and (= (type Heap@@7) (MapType0Type RefType)) (= (type this@@7) RefType)) (= (type last@@6) RefType)) (dummyFunction (bool_2_U (|sorted#triggerStateless| this@@7 last@@6))))
 :qid |stdinbpl.1469:15|
 :skolemid |73|
 :pattern ( (|sorted'| Heap@@7 this@@7 last@@6))
)))
(assert (forall ((Heap@@8 T@U) (this@@8 T@U) (last@@7 T@U) ) (!  (=> (and (and (= (type Heap@@8) (MapType0Type RefType)) (= (type this@@8) RefType)) (= (type last@@7) RefType)) (dummyFunction (bool_2_U (|presorted#triggerStateless| this@@8 last@@7))))
 :qid |stdinbpl.1706:15|
 :skolemid |80|
 :pattern ( (|presorted'| Heap@@8 this@@8 last@@7))
)))
(assert (forall ((Heap@@9 T@U) (this@@9 T@U) (last@@8 T@U) ) (!  (=> (and (and (= (type Heap@@9) (MapType0Type RefType)) (= (type this@@9) RefType)) (= (type last@@8) RefType)) (dummyFunction (bool_2_U (|validChildren#triggerStateless| this@@9 last@@8))))
 :qid |stdinbpl.2007:15|
 :skolemid |86|
 :pattern ( (|validChildren'| Heap@@9 this@@9 last@@8))
)))
(assert (forall ((Heap@@10 T@U) (this@@10 T@U) (last@@9 T@U) ) (!  (=> (and (and (= (type Heap@@10) (MapType0Type RefType)) (= (type this@@10) RefType)) (= (type last@@9) RefType)) (|heapseg#everUsed| (heapseg this@@10 last@@9)))
 :qid |stdinbpl.2421:15|
 :skolemid |102|
 :pattern ( (|heapseg#trigger| Heap@@10 (heapseg this@@10 last@@9)))
)))
(assert (forall ((arg0@@27 T@U) ) (! (let ((A (FieldTypeInv0 (type arg0@@27))))
(= (type (PredicateMaskField arg0@@27)) (FieldType A (MapType1Type RefType boolType))))
 :qid |funType:PredicateMaskField|
 :pattern ( (PredicateMaskField arg0@@27))
)))
(assert (forall ((Heap@@11 T@U) (ExhaleHeap T@U) (Mask@@3 T@U) (pm_f T@U) ) (! (let ((C (FieldTypeInv0 (type pm_f))))
 (=> (and (and (and (and (and (= (type Heap@@11) (MapType0Type RefType)) (= (type ExhaleHeap) (MapType0Type RefType))) (= (type Mask@@3) (MapType1Type RefType realType))) (= (type pm_f) (FieldType C FrameTypeType))) (IdenticalOnKnownLocations Heap@@11 ExhaleHeap Mask@@3)) (and (HasDirectPerm Mask@@3 null pm_f) (IsPredicateField pm_f))) (= (MapType0Select Heap@@11 null (PredicateMaskField pm_f)) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))))
 :qid |stdinbpl.47:19|
 :skolemid |2|
 :pattern ( (IdenticalOnKnownLocations Heap@@11 ExhaleHeap Mask@@3) (IsPredicateField pm_f) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))
)))
(assert (forall ((arg0@@28 T@U) ) (! (let ((A@@0 (FieldTypeInv0 (type arg0@@28))))
(= (type (WandMaskField arg0@@28)) (FieldType A@@0 (MapType1Type RefType boolType))))
 :qid |funType:WandMaskField|
 :pattern ( (WandMaskField arg0@@28))
)))
(assert (forall ((Heap@@12 T@U) (ExhaleHeap@@0 T@U) (Mask@@4 T@U) (pm_f@@0 T@U) ) (! (let ((C@@0 (FieldTypeInv0 (type pm_f@@0))))
 (=> (and (and (and (and (and (= (type Heap@@12) (MapType0Type RefType)) (= (type ExhaleHeap@@0) (MapType0Type RefType))) (= (type Mask@@4) (MapType1Type RefType realType))) (= (type pm_f@@0) (FieldType C@@0 FrameTypeType))) (IdenticalOnKnownLocations Heap@@12 ExhaleHeap@@0 Mask@@4)) (and (HasDirectPerm Mask@@4 null pm_f@@0) (IsWandField pm_f@@0))) (= (MapType0Select Heap@@12 null (WandMaskField pm_f@@0)) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))))
 :qid |stdinbpl.60:19|
 :skolemid |5|
 :pattern ( (IdenticalOnKnownLocations Heap@@12 ExhaleHeap@@0 Mask@@4) (IsWandField pm_f@@0) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))
)))
(assert (forall ((this@@11 T@U) ) (!  (=> (= (type this@@11) RefType) (IsPredicateField (tree this@@11)))
 :qid |stdinbpl.2209:15|
 :skolemid |92|
 :pattern ( (tree this@@11))
)))
(assert  (and (= (Ctor PredicateType_heapType) 14) (forall ((arg0@@29 T@U) ) (! (= (type (heap arg0@@29)) (FieldType PredicateType_heapType FrameTypeType))
 :qid |funType:heap|
 :pattern ( (heap arg0@@29))
))))
(assert (forall ((this@@12 T@U) ) (!  (=> (= (type this@@12) RefType) (IsPredicateField (heap this@@12)))
 :qid |stdinbpl.2520:15|
 :skolemid |104|
 :pattern ( (heap this@@12))
)))
(assert (forall ((Heap@@13 T@U) (this@@13 T@U) ) (!  (=> (and (= (type Heap@@13) (MapType0Type RefType)) (= (type this@@13) RefType)) (dummyFunction (int_2_U (|treeKey#triggerStateless| this@@13))))
 :qid |stdinbpl.224:15|
 :skolemid |23|
 :pattern ( (|treeKey'| Heap@@13 this@@13))
)))
(assert (forall ((Heap@@14 T@U) (this@@14 T@U) ) (!  (=> (and (= (type Heap@@14) (MapType0Type RefType)) (= (type this@@14) RefType)) (dummyFunction (int_2_U (|treeDegree#triggerStateless| this@@14))))
 :qid |stdinbpl.353:15|
 :skolemid |28|
 :pattern ( (|treeDegree'| Heap@@14 this@@14))
)))
(assert (forall ((Heap@@15 T@U) (this@@15 T@U) ) (!  (=> (and (= (type Heap@@15) (MapType0Type RefType)) (= (type this@@15) RefType)) (dummyFunction (int_2_U (|treeSize#triggerStateless| this@@15))))
 :qid |stdinbpl.494:15|
 :skolemid |34|
 :pattern ( (|treeSize'| Heap@@15 this@@15))
)))
(assert  (and (forall ((arg0@@30 T@U) (arg1@@12 T@U) ) (! (= (type (|treeParent'| arg0@@30 arg1@@12)) RefType)
 :qid |funType:treeParent'|
 :pattern ( (|treeParent'| arg0@@30 arg1@@12))
)) (forall ((arg0@@31 T@U) ) (! (= (type (|treeParent#triggerStateless| arg0@@31)) RefType)
 :qid |funType:treeParent#triggerStateless|
 :pattern ( (|treeParent#triggerStateless| arg0@@31))
))))
(assert (forall ((Heap@@16 T@U) (this@@16 T@U) ) (!  (=> (and (= (type Heap@@16) (MapType0Type RefType)) (= (type this@@16) RefType)) (dummyFunction (|treeParent#triggerStateless| this@@16)))
 :qid |stdinbpl.646:15|
 :skolemid |39|
 :pattern ( (|treeParent'| Heap@@16 this@@16))
)))
(assert (forall ((Heap@@17 T@U) (this@@17 T@U) ) (!  (=> (and (= (type Heap@@17) (MapType0Type RefType)) (= (type this@@17) RefType)) (|tree#everUsed| (tree this@@17)))
 :qid |stdinbpl.2228:15|
 :skolemid |96|
 :pattern ( (|tree#trigger| Heap@@17 (tree this@@17)))
)))
(assert (forall ((Heap@@18 T@U) (this@@18 T@U) ) (!  (=> (and (= (type Heap@@18) (MapType0Type RefType)) (= (type this@@18) RefType)) (|heap#everUsed| (heap this@@18)))
 :qid |stdinbpl.2539:15|
 :skolemid |108|
 :pattern ( (|heap#trigger| Heap@@18 (heap this@@18)))
)))
(assert (forall ((Heap@@19 T@U) (Mask@@5 T@U) (this@@19 T@U) (last@@10 T@U) (index@@0 Int) ) (!  (=> (and (and (and (and (and (= (type Heap@@19) (MapType0Type RefType)) (= (type Mask@@5) (MapType1Type RefType realType))) (= (type this@@19) RefType)) (= (type last@@10) RefType)) (and (state Heap@@19 Mask@@5) (< AssumeFunctionsAbove 7))) (and (<= 0 index@@0) (< index@@0 (segLength Heap@@19 this@@19 last@@10)))) (= (segDegree Heap@@19 this@@19 last@@10 index@@0) (ite (= index@@0 0) (treeDegree Heap@@19 this@@19) (|segDegree'| Heap@@19 (MapType0Select Heap@@19 this@@19 sibling) last@@10 (- index@@0 1)))))
 :qid |stdinbpl.1134:15|
 :skolemid |61|
 :pattern ( (state Heap@@19 Mask@@5) (segDegree Heap@@19 this@@19 last@@10 index@@0))
 :pattern ( (state Heap@@19 Mask@@5) (|segDegree#triggerStateless| this@@19 last@@10 index@@0) (|heapseg#trigger| Heap@@19 (heapseg this@@19 last@@10)) (|heapseg#trigger| Heap@@19 (heapseg this@@19 last@@10)))
)))
(assert (forall ((Heap@@20 T@U) (Mask@@6 T@U) (this@@20 T@U) (last@@11 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@20) (MapType0Type RefType)) (= (type Mask@@6) (MapType1Type RefType realType))) (= (type this@@20) RefType)) (= (type last@@11) RefType)) (state Heap@@20 Mask@@6)) (= (|sorted'| Heap@@20 this@@20 last@@11) (|sorted#frame| (MapType0Select Heap@@20 null (heapseg this@@20 last@@11)) this@@20 last@@11)))
 :qid |stdinbpl.1482:15|
 :skolemid |75|
 :pattern ( (state Heap@@20 Mask@@6) (|sorted'| Heap@@20 this@@20 last@@11))
 :pattern ( (state Heap@@20 Mask@@6) (|sorted#triggerStateless| this@@20 last@@11) (|heapseg#trigger| Heap@@20 (heapseg this@@20 last@@11)) (|heapseg#trigger| Heap@@20 (heapseg this@@20 last@@11)) (|heapseg#trigger| Heap@@20 (heapseg this@@20 last@@11)))
)))
(assert (forall ((Heap@@21 T@U) (Mask@@7 T@U) (this@@21 T@U) (last@@12 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@21) (MapType0Type RefType)) (= (type Mask@@7) (MapType1Type RefType realType))) (= (type this@@21) RefType)) (= (type last@@12) RefType)) (state Heap@@21 Mask@@7)) (= (|presorted'| Heap@@21 this@@21 last@@12) (|presorted#frame| (MapType0Select Heap@@21 null (heapseg this@@21 last@@12)) this@@21 last@@12)))
 :qid |stdinbpl.1719:15|
 :skolemid |82|
 :pattern ( (state Heap@@21 Mask@@7) (|presorted'| Heap@@21 this@@21 last@@12))
 :pattern ( (state Heap@@21 Mask@@7) (|presorted#triggerStateless| this@@21 last@@12) (|heapseg#trigger| Heap@@21 (heapseg this@@21 last@@12)) (|heapseg#trigger| Heap@@21 (heapseg this@@21 last@@12)) (|heapseg#trigger| Heap@@21 (heapseg this@@21 last@@12)))
)))
(assert (forall ((Heap@@22 T@U) (Mask@@8 T@U) (this@@22 T@U) (last@@13 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@22) (MapType0Type RefType)) (= (type Mask@@8) (MapType1Type RefType realType))) (= (type this@@22) RefType)) (= (type last@@13) RefType)) (state Heap@@22 Mask@@8)) (= (|validChildren'| Heap@@22 this@@22 last@@13) (|validChildren#frame| (MapType0Select Heap@@22 null (heapseg this@@22 last@@13)) this@@22 last@@13)))
 :qid |stdinbpl.2020:15|
 :skolemid |88|
 :pattern ( (state Heap@@22 Mask@@8) (|validChildren'| Heap@@22 this@@22 last@@13))
 :pattern ( (state Heap@@22 Mask@@8) (|validChildren#triggerStateless| this@@22 last@@13) (|heapseg#trigger| Heap@@22 (heapseg this@@22 last@@13)) (|heapseg#trigger| Heap@@22 (heapseg this@@22 last@@13)) (|heapseg#trigger| Heap@@22 (heapseg this@@22 last@@13)))
)))
(assert (forall ((Heap@@23 T@U) (ExhaleHeap@@1 T@U) (Mask@@9 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@23) (MapType0Type RefType)) (= (type ExhaleHeap@@1) (MapType0Type RefType))) (= (type Mask@@9) (MapType1Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@23 ExhaleHeap@@1 Mask@@9)) (U_2_bool (MapType0Select Heap@@23 o_1 $allocated))) (U_2_bool (MapType0Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.73:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@23 ExhaleHeap@@1 Mask@@9) (MapType0Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert (forall ((Heap@@24 T@U) (this@@23 T@U) ) (!  (=> (and (= (type Heap@@24) (MapType0Type RefType)) (= (type this@@23) RefType)) (and (= (treeKey Heap@@24 this@@23) (|treeKey'| Heap@@24 this@@23)) (dummyFunction (int_2_U (|treeKey#triggerStateless| this@@23)))))
 :qid |stdinbpl.220:15|
 :skolemid |22|
 :pattern ( (treeKey Heap@@24 this@@23))
)))
(assert (forall ((Heap@@25 T@U) (this@@24 T@U) ) (!  (=> (and (= (type Heap@@25) (MapType0Type RefType)) (= (type this@@24) RefType)) (and (= (treeDegree Heap@@25 this@@24) (|treeDegree'| Heap@@25 this@@24)) (dummyFunction (int_2_U (|treeDegree#triggerStateless| this@@24)))))
 :qid |stdinbpl.349:15|
 :skolemid |27|
 :pattern ( (treeDegree Heap@@25 this@@24))
)))
(assert (forall ((Heap@@26 T@U) (this@@25 T@U) ) (!  (=> (and (= (type Heap@@26) (MapType0Type RefType)) (= (type this@@25) RefType)) (and (= (treeSize Heap@@26 this@@25) (|treeSize'| Heap@@26 this@@25)) (dummyFunction (int_2_U (|treeSize#triggerStateless| this@@25)))))
 :qid |stdinbpl.490:15|
 :skolemid |33|
 :pattern ( (treeSize Heap@@26 this@@25))
)))
(assert (forall ((arg0@@32 T@U) (arg1@@13 T@U) ) (! (= (type (treeParent arg0@@32 arg1@@13)) RefType)
 :qid |funType:treeParent|
 :pattern ( (treeParent arg0@@32 arg1@@13))
)))
(assert (forall ((Heap@@27 T@U) (this@@26 T@U) ) (!  (=> (and (= (type Heap@@27) (MapType0Type RefType)) (= (type this@@26) RefType)) (and (= (treeParent Heap@@27 this@@26) (|treeParent'| Heap@@27 this@@26)) (dummyFunction (|treeParent#triggerStateless| this@@26))))
 :qid |stdinbpl.642:15|
 :skolemid |38|
 :pattern ( (treeParent Heap@@27 this@@26))
)))
(assert (forall ((this@@27 T@U) (last@@14 T@U) (this2 T@U) (last2 T@U) ) (!  (=> (and (and (and (and (= (type this@@27) RefType) (= (type last@@14) RefType)) (= (type this2) RefType)) (= (type last2) RefType)) (= (heapseg this@@27 last@@14) (heapseg this2 last2))) (and (= this@@27 this2) (= last@@14 last2)))
 :qid |stdinbpl.2412:15|
 :skolemid |100|
 :pattern ( (heapseg this@@27 last@@14) (heapseg this2 last2))
)))
(assert (forall ((arg0@@33 T@U) (arg1@@14 T@U) ) (! (= (type (|heapseg#sm| arg0@@33 arg1@@14)) (FieldType PredicateType_heapsegType (MapType1Type RefType boolType)))
 :qid |funType:heapseg#sm|
 :pattern ( (|heapseg#sm| arg0@@33 arg1@@14))
)))
(assert (forall ((this@@28 T@U) (last@@15 T@U) (this2@@0 T@U) (last2@@0 T@U) ) (!  (=> (and (and (and (and (= (type this@@28) RefType) (= (type last@@15) RefType)) (= (type this2@@0) RefType)) (= (type last2@@0) RefType)) (= (|heapseg#sm| this@@28 last@@15) (|heapseg#sm| this2@@0 last2@@0))) (and (= this@@28 this2@@0) (= last@@15 last2@@0)))
 :qid |stdinbpl.2416:15|
 :skolemid |101|
 :pattern ( (|heapseg#sm| this@@28 last@@15) (|heapseg#sm| this2@@0 last2@@0))
)))
(assert (forall ((this@@29 T@U) (this2@@1 T@U) ) (!  (=> (and (and (= (type this@@29) RefType) (= (type this2@@1) RefType)) (= (tree this@@29) (tree this2@@1))) (= this@@29 this2@@1))
 :qid |stdinbpl.2219:15|
 :skolemid |94|
 :pattern ( (tree this@@29) (tree this2@@1))
)))
(assert (forall ((arg0@@34 T@U) ) (! (= (type (|tree#sm| arg0@@34)) (FieldType PredicateType_treeType (MapType1Type RefType boolType)))
 :qid |funType:tree#sm|
 :pattern ( (|tree#sm| arg0@@34))
)))
(assert (forall ((this@@30 T@U) (this2@@2 T@U) ) (!  (=> (and (and (= (type this@@30) RefType) (= (type this2@@2) RefType)) (= (|tree#sm| this@@30) (|tree#sm| this2@@2))) (= this@@30 this2@@2))
 :qid |stdinbpl.2223:15|
 :skolemid |95|
 :pattern ( (|tree#sm| this@@30) (|tree#sm| this2@@2))
)))
(assert (forall ((this@@31 T@U) (this2@@3 T@U) ) (!  (=> (and (and (= (type this@@31) RefType) (= (type this2@@3) RefType)) (= (heap this@@31) (heap this2@@3))) (= this@@31 this2@@3))
 :qid |stdinbpl.2530:15|
 :skolemid |106|
 :pattern ( (heap this@@31) (heap this2@@3))
)))
(assert (forall ((arg0@@35 T@U) ) (! (= (type (|heap#sm| arg0@@35)) (FieldType PredicateType_heapType (MapType1Type RefType boolType)))
 :qid |funType:heap#sm|
 :pattern ( (|heap#sm| arg0@@35))
)))
(assert (forall ((this@@32 T@U) (this2@@4 T@U) ) (!  (=> (and (and (= (type this@@32) RefType) (= (type this2@@4) RefType)) (= (|heap#sm| this@@32) (|heap#sm| this2@@4))) (= this@@32 this2@@4))
 :qid |stdinbpl.2534:15|
 :skolemid |107|
 :pattern ( (|heap#sm| this@@32) (|heap#sm| this2@@4))
)))
(assert (forall ((Heap@@28 T@U) (Mask@@10 T@U) (this@@33 T@U) (last@@16 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@28) (MapType0Type RefType)) (= (type Mask@@10) (MapType1Type RefType realType))) (= (type this@@33) RefType)) (= (type last@@16) RefType)) (state Heap@@28 Mask@@10)) (= (|segLength'| Heap@@28 this@@33 last@@16) (|segLength#frame| (MapType0Select Heap@@28 null (heapseg this@@33 last@@16)) this@@33 last@@16)))
 :qid |stdinbpl.788:15|
 :skolemid |46|
 :pattern ( (state Heap@@28 Mask@@10) (|segLength'| Heap@@28 this@@33 last@@16))
 :pattern ( (state Heap@@28 Mask@@10) (|segLength#triggerStateless| this@@33 last@@16) (|heapseg#trigger| Heap@@28 (heapseg this@@33 last@@16)))
)))
(assert (forall ((Heap@@29 T@U) (Mask@@11 T@U) (this@@34 T@U) (last@@17 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@29) (MapType0Type RefType)) (= (type Mask@@11) (MapType1Type RefType realType))) (= (type this@@34) RefType)) (= (type last@@17) RefType)) (state Heap@@29 Mask@@11)) (= (|segSize'| Heap@@29 this@@34 last@@17) (|segSize#frame| (MapType0Select Heap@@29 null (heapseg this@@34 last@@17)) this@@34 last@@17)))
 :qid |stdinbpl.964:15|
 :skolemid |55|
 :pattern ( (state Heap@@29 Mask@@11) (|segSize'| Heap@@29 this@@34 last@@17))
 :pattern ( (state Heap@@29 Mask@@11) (|segSize#triggerStateless| this@@34 last@@17) (|heapseg#trigger| Heap@@29 (heapseg this@@34 last@@17)) (|heapseg#trigger| Heap@@29 (heapseg this@@34 last@@17)))
)))
(assert (forall ((arg0@@36 T@U) (arg1@@15 T@U) (arg2@@4 T@U) ) (! (= (type (|segParent#frame| arg0@@36 arg1@@15 arg2@@4)) RefType)
 :qid |funType:segParent#frame|
 :pattern ( (|segParent#frame| arg0@@36 arg1@@15 arg2@@4))
)))
(assert (forall ((Heap@@30 T@U) (Mask@@12 T@U) (this@@35 T@U) (last@@18 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@30) (MapType0Type RefType)) (= (type Mask@@12) (MapType1Type RefType realType))) (= (type this@@35) RefType)) (= (type last@@18) RefType)) (state Heap@@30 Mask@@12)) (= (|segParent'| Heap@@30 this@@35 last@@18) (|segParent#frame| (MapType0Select Heap@@30 null (heapseg this@@35 last@@18)) this@@35 last@@18)))
 :qid |stdinbpl.1343:15|
 :skolemid |69|
 :pattern ( (state Heap@@30 Mask@@12) (|segParent'| Heap@@30 this@@35 last@@18))
 :pattern ( (state Heap@@30 Mask@@12) (|segParent#triggerStateless| this@@35 last@@18) (|heapseg#trigger| Heap@@30 (heapseg this@@35 last@@18)))
)))
(assert (forall ((Heap@@31 T@U) (ExhaleHeap@@2 T@U) (Mask@@13 T@U) (o_1@@0 T@U) (f_2 T@U) ) (! (let ((B@@1 (FieldTypeInv1 (type f_2))))
(let ((A@@1 (FieldTypeInv0 (type f_2))))
 (=> (and (and (and (and (and (and (= (type Heap@@31) (MapType0Type RefType)) (= (type ExhaleHeap@@2) (MapType0Type RefType))) (= (type Mask@@13) (MapType1Type RefType realType))) (= (type o_1@@0) RefType)) (= (type f_2) (FieldType A@@1 B@@1))) (IdenticalOnKnownLocations Heap@@31 ExhaleHeap@@2 Mask@@13)) (HasDirectPerm Mask@@13 o_1@@0 f_2)) (= (MapType0Select Heap@@31 o_1@@0 f_2) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2)))))
 :qid |stdinbpl.42:22|
 :skolemid |1|
 :pattern ( (IdenticalOnKnownLocations Heap@@31 ExhaleHeap@@2 Mask@@13) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2))
)))
(assert (forall ((Heap@@32 T@U) (Mask@@14 T@U) (this@@36 T@U) (last@@19 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@32) (MapType0Type RefType)) (= (type Mask@@14) (MapType1Type RefType realType))) (= (type this@@36) RefType)) (= (type last@@19) RefType)) (and (state Heap@@32 Mask@@14) (< AssumeFunctionsAbove 5))) (= (presorted Heap@@32 this@@36 last@@19)  (and (=> (< 1 (segLength Heap@@32 this@@36 last@@19)) (and (<= (treeDegree Heap@@32 this@@36) (segDegree Heap@@32 (MapType0Select Heap@@32 this@@36 sibling) last@@19 0)) (|presorted'| Heap@@32 (MapType0Select Heap@@32 this@@36 sibling) last@@19))) (=> (and (< 2 (segLength Heap@@32 this@@36 last@@19)) (= (segDegree Heap@@32 this@@36 last@@19 0) (segDegree Heap@@32 this@@36 last@@19 1))) (< (segDegree Heap@@32 this@@36 last@@19 1) (segDegree Heap@@32 this@@36 last@@19 2))))))
 :qid |stdinbpl.1712:15|
 :skolemid |81|
 :pattern ( (state Heap@@32 Mask@@14) (presorted Heap@@32 this@@36 last@@19))
 :pattern ( (state Heap@@32 Mask@@14) (|presorted#triggerStateless| this@@36 last@@19) (|heapseg#trigger| Heap@@32 (heapseg this@@36 last@@19)) (|heapseg#trigger| Heap@@32 (heapseg this@@36 last@@19)) (|heapseg#trigger| Heap@@32 (heapseg this@@36 last@@19)))
)))
(assert  (and (= (type dummyHeap) (MapType0Type RefType)) (= (type ZeroMask) (MapType1Type RefType realType))))
(assert (state dummyHeap ZeroMask))
(assert (forall ((p T@U) (v_1 T@U) (w T@U) ) (! (let ((A@@2 (FieldTypeInv0 (type p))))
 (=> (and (and (= (type p) (FieldType A@@2 FrameTypeType)) (= (type v_1) FrameTypeType)) (= (type w) FrameTypeType)) (not (InsidePredicate p v_1 p w))))
 :qid |stdinbpl.182:19|
 :skolemid |21|
 :pattern ( (InsidePredicate p v_1 p w))
)))
(assert  (not (IsPredicateField key)))
(assert  (not (IsWandField key)))
(assert  (not (IsPredicateField degree)))
(assert  (not (IsWandField degree)))
(assert  (not (IsPredicateField parent)))
(assert  (not (IsWandField parent)))
(assert  (not (IsPredicateField sibling)))
(assert  (not (IsWandField sibling)))
(assert  (not (IsPredicateField child)))
(assert  (not (IsWandField child)))
(assert  (not (IsPredicateField Nodes)))
(assert  (not (IsWandField Nodes)))
(assert  (not (IsPredicateField size)))
(assert  (not (IsWandField size)))
(assert (forall ((Heap@@33 T@U) (ExhaleHeap@@3 T@U) (Mask@@15 T@U) ) (!  (=> (and (and (and (= (type Heap@@33) (MapType0Type RefType)) (= (type ExhaleHeap@@3) (MapType0Type RefType))) (= (type Mask@@15) (MapType1Type RefType realType))) (IdenticalOnKnownLocations Heap@@33 ExhaleHeap@@3 Mask@@15)) (succHeap Heap@@33 ExhaleHeap@@3))
 :qid |stdinbpl.83:15|
 :skolemid |10|
 :pattern ( (IdenticalOnKnownLocations Heap@@33 ExhaleHeap@@3 Mask@@15))
)))
(assert (forall ((Heap@@34 T@U) (Mask@@16 T@U) (this@@37 T@U) ) (!  (=> (and (and (and (= (type Heap@@34) (MapType0Type RefType)) (= (type Mask@@16) (MapType1Type RefType realType))) (= (type this@@37) RefType)) (and (state Heap@@34 Mask@@16) (< AssumeFunctionsAbove 1))) (= (treeSize Heap@@34 this@@37) (ite (= (U_2_int (MapType0Select Heap@@34 this@@37 degree)) 0) 1 (+ 1 (|segSize'| Heap@@34 (MapType0Select Heap@@34 this@@37 child) null)))))
 :qid |stdinbpl.500:15|
 :skolemid |35|
 :pattern ( (state Heap@@34 Mask@@16) (treeSize Heap@@34 this@@37))
 :pattern ( (state Heap@@34 Mask@@16) (|treeSize#triggerStateless| this@@37) (|tree#trigger| Heap@@34 (tree this@@37)))
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
(assert  (and (forall ((arg0@@37 Real) (arg1@@16 T@U) ) (! (= (type (ConditionalFrame arg0@@37 arg1@@16)) FrameTypeType)
 :qid |funType:ConditionalFrame|
 :pattern ( (ConditionalFrame arg0@@37 arg1@@16))
)) (= (type EmptyFrame) FrameTypeType)))
(assert (forall ((p@@0 Real) (f_6 T@U) ) (!  (=> (= (type f_6) FrameTypeType) (= (ConditionalFrame p@@0 f_6) (ite (> p@@0 0.0) f_6 EmptyFrame)))
 :qid |stdinbpl.170:15|
 :skolemid |19|
 :pattern ( (ConditionalFrame p@@0 f_6))
)))
(assert (forall ((Mask@@17 T@U) (o_2@@0 T@U) (f_4@@0 T@U) ) (! (let ((B@@3 (FieldTypeInv1 (type f_4@@0))))
(let ((A@@4 (FieldTypeInv0 (type f_4@@0))))
 (=> (and (and (= (type Mask@@17) (MapType1Type RefType realType)) (= (type o_2@@0) RefType)) (= (type f_4@@0) (FieldType A@@4 B@@3))) (= (HasDirectPerm Mask@@17 o_2@@0 f_4@@0) (> (U_2_real (MapType1Select Mask@@17 o_2@@0 f_4@@0)) NoPerm)))))
 :qid |stdinbpl.133:22|
 :skolemid |17|
 :pattern ( (HasDirectPerm Mask@@17 o_2@@0 f_4@@0))
)))
(assert (forall ((Heap@@35 T@U) (Mask@@18 T@U) (this@@38 T@U) (last@@20 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@35) (MapType0Type RefType)) (= (type Mask@@18) (MapType1Type RefType realType))) (= (type this@@38) RefType)) (= (type last@@20) RefType)) (and (state Heap@@35 Mask@@18) (or (< AssumeFunctionsAbove 0) (|sorted#trigger| (MapType0Select Heap@@35 null (heapseg this@@38 last@@20)) this@@38 last@@20)))) (|sorted'| Heap@@35 this@@38 last@@20)) (presorted Heap@@35 this@@38 last@@20))
 :qid |stdinbpl.1488:15|
 :skolemid |76|
 :pattern ( (state Heap@@35 Mask@@18) (|sorted'| Heap@@35 this@@38 last@@20))
)))
(assert (forall ((Heap@@36 T@U) (this@@39 T@U) (last@@21 T@U) ) (!  (=> (and (and (= (type Heap@@36) (MapType0Type RefType)) (= (type this@@39) RefType)) (= (type last@@21) RefType)) (and (= (segLength Heap@@36 this@@39 last@@21) (|segLength'| Heap@@36 this@@39 last@@21)) (dummyFunction (int_2_U (|segLength#triggerStateless| this@@39 last@@21)))))
 :qid |stdinbpl.771:15|
 :skolemid |43|
 :pattern ( (segLength Heap@@36 this@@39 last@@21))
)))
(assert (forall ((Heap@@37 T@U) (this@@40 T@U) (last@@22 T@U) ) (!  (=> (and (and (= (type Heap@@37) (MapType0Type RefType)) (= (type this@@40) RefType)) (= (type last@@22) RefType)) (and (= (segSize Heap@@37 this@@40 last@@22) (|segSize'| Heap@@37 this@@40 last@@22)) (dummyFunction (int_2_U (|segSize#triggerStateless| this@@40 last@@22)))))
 :qid |stdinbpl.947:15|
 :skolemid |52|
 :pattern ( (segSize Heap@@37 this@@40 last@@22))
)))
(assert (forall ((arg0@@38 T@U) (arg1@@17 T@U) (arg2@@5 T@U) ) (! (= (type (segParent arg0@@38 arg1@@17 arg2@@5)) RefType)
 :qid |funType:segParent|
 :pattern ( (segParent arg0@@38 arg1@@17 arg2@@5))
)))
(assert (forall ((Heap@@38 T@U) (this@@41 T@U) (last@@23 T@U) ) (!  (=> (and (and (= (type Heap@@38) (MapType0Type RefType)) (= (type this@@41) RefType)) (= (type last@@23) RefType)) (and (= (segParent Heap@@38 this@@41 last@@23) (|segParent'| Heap@@38 this@@41 last@@23)) (dummyFunction (|segParent#triggerStateless| this@@41 last@@23))))
 :qid |stdinbpl.1326:15|
 :skolemid |66|
 :pattern ( (segParent Heap@@38 this@@41 last@@23))
)))
(assert (forall ((Heap@@39 T@U) (Mask@@19 T@U) (this@@42 T@U) (last@@24 T@U) (index@@1 Int) ) (!  (=> (and (and (and (and (and (= (type Heap@@39) (MapType0Type RefType)) (= (type Mask@@19) (MapType1Type RefType realType))) (= (type this@@42) RefType)) (= (type last@@24) RefType)) (and (state Heap@@39 Mask@@19) (or (< AssumeFunctionsAbove 7) (|segDegree#trigger| (MapType0Select Heap@@39 null (heapseg this@@42 last@@24)) this@@42 last@@24 index@@1)))) (and (<= 0 index@@1) (< index@@1 (segLength Heap@@39 this@@42 last@@24)))) (<= 0 (|segDegree'| Heap@@39 this@@42 last@@24 index@@1)))
 :qid |stdinbpl.1147:15|
 :skolemid |63|
 :pattern ( (state Heap@@39 Mask@@19) (|segDegree'| Heap@@39 this@@42 last@@24 index@@1))
)))
(assert (forall ((o_2@@1 T@U) (f_4@@1 T@U) ) (! (let ((B@@4 (FieldTypeInv1 (type f_4@@1))))
(let ((A@@5 (FieldTypeInv0 (type f_4@@1))))
 (=> (and (= (type o_2@@1) RefType) (= (type f_4@@1) (FieldType A@@5 B@@4))) (= (U_2_real (MapType1Select ZeroMask o_2@@1 f_4@@1)) NoPerm))))
 :qid |stdinbpl.106:22|
 :skolemid |13|
 :pattern ( (MapType1Select ZeroMask o_2@@1 f_4@@1))
)))
(assert (forall ((Heap@@40 T@U) (Mask@@20 T@U) (this@@43 T@U) (last@@25 T@U) (index@@2 Int) ) (!  (=> (and (and (and (and (= (type Heap@@40) (MapType0Type RefType)) (= (type Mask@@20) (MapType1Type RefType realType))) (= (type this@@43) RefType)) (= (type last@@25) RefType)) (state Heap@@40 Mask@@20)) (= (|segDegree'| Heap@@40 this@@43 last@@25 index@@2) (|segDegree#frame| (MapType0Select Heap@@40 null (heapseg this@@43 last@@25)) this@@43 last@@25 index@@2)))
 :qid |stdinbpl.1141:15|
 :skolemid |62|
 :pattern ( (state Heap@@40 Mask@@20) (|segDegree'| Heap@@40 this@@43 last@@25 index@@2))
 :pattern ( (state Heap@@40 Mask@@20) (|segDegree#triggerStateless| this@@43 last@@25 index@@2) (|heapseg#trigger| Heap@@40 (heapseg this@@43 last@@25)) (|heapseg#trigger| Heap@@40 (heapseg this@@43 last@@25)))
)))
(assert (forall ((Heap@@41 T@U) (this@@44 T@U) (last@@26 T@U) (index@@3 Int) ) (!  (=> (and (and (= (type Heap@@41) (MapType0Type RefType)) (= (type this@@44) RefType)) (= (type last@@26) RefType)) (and (= (segDegree Heap@@41 this@@44 last@@26 index@@3) (|segDegree'| Heap@@41 this@@44 last@@26 index@@3)) (dummyFunction (int_2_U (|segDegree#triggerStateless| this@@44 last@@26 index@@3)))))
 :qid |stdinbpl.1124:15|
 :skolemid |59|
 :pattern ( (segDegree Heap@@41 this@@44 last@@26 index@@3))
)))
(assert (forall ((this@@45 T@U) (last@@27 T@U) ) (!  (=> (and (= (type this@@45) RefType) (= (type last@@27) RefType)) (= (getPredWandId (heapseg this@@45 last@@27)) 1))
 :qid |stdinbpl.2406:15|
 :skolemid |99|
 :pattern ( (heapseg this@@45 last@@27))
)))
(assert (forall ((Heap@@42 T@U) (Mask@@21 T@U) (this@@46 T@U) (last@@28 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@42) (MapType0Type RefType)) (= (type Mask@@21) (MapType1Type RefType realType))) (= (type this@@46) RefType)) (= (type last@@28) RefType)) (and (state Heap@@42 Mask@@21) (or (< AssumeFunctionsAbove 1) (|segSize#trigger| (MapType0Select Heap@@42 null (heapseg this@@46 last@@28)) this@@46 last@@28)))) (= this@@46 last@@28)) (= (|segSize'| Heap@@42 this@@46 last@@28) 0))
 :qid |stdinbpl.970:15|
 :skolemid |56|
 :pattern ( (state Heap@@42 Mask@@21) (|segSize'| Heap@@42 this@@46 last@@28))
)))
(assert (forall ((Heap@@43 T@U) (ExhaleHeap@@4 T@U) (Mask@@22 T@U) (pm_f@@1 T@U) ) (! (let ((C@@1 (FieldTypeInv0 (type pm_f@@1))))
 (=> (and (and (and (and (and (= (type Heap@@43) (MapType0Type RefType)) (= (type ExhaleHeap@@4) (MapType0Type RefType))) (= (type Mask@@22) (MapType1Type RefType realType))) (= (type pm_f@@1) (FieldType C@@1 FrameTypeType))) (IdenticalOnKnownLocations Heap@@43 ExhaleHeap@@4 Mask@@22)) (and (HasDirectPerm Mask@@22 null pm_f@@1) (IsPredicateField pm_f@@1))) (forall ((o2 T@U) (f_2@@0 T@U) ) (! (let ((B@@5 (FieldTypeInv1 (type f_2@@0))))
(let ((A@@6 (FieldTypeInv0 (type f_2@@0))))
 (=> (and (and (= (type o2) RefType) (= (type f_2@@0) (FieldType A@@6 B@@5))) (U_2_bool (MapType1Select (MapType0Select Heap@@43 null (PredicateMaskField pm_f@@1)) o2 f_2@@0))) (= (MapType0Select Heap@@43 o2 f_2@@0) (MapType0Select ExhaleHeap@@4 o2 f_2@@0)))))
 :qid |stdinbpl.54:134|
 :skolemid |3|
 :pattern ( (MapType0Select ExhaleHeap@@4 o2 f_2@@0))
))))
 :qid |stdinbpl.52:19|
 :skolemid |4|
 :pattern ( (IdenticalOnKnownLocations Heap@@43 ExhaleHeap@@4 Mask@@22) (IsPredicateField pm_f@@1))
)))
(assert (forall ((Heap@@44 T@U) (ExhaleHeap@@5 T@U) (Mask@@23 T@U) (pm_f@@2 T@U) ) (! (let ((C@@2 (FieldTypeInv0 (type pm_f@@2))))
 (=> (and (and (and (and (and (= (type Heap@@44) (MapType0Type RefType)) (= (type ExhaleHeap@@5) (MapType0Type RefType))) (= (type Mask@@23) (MapType1Type RefType realType))) (= (type pm_f@@2) (FieldType C@@2 FrameTypeType))) (IdenticalOnKnownLocations Heap@@44 ExhaleHeap@@5 Mask@@23)) (and (HasDirectPerm Mask@@23 null pm_f@@2) (IsWandField pm_f@@2))) (forall ((o2@@0 T@U) (f_2@@1 T@U) ) (! (let ((B@@6 (FieldTypeInv1 (type f_2@@1))))
(let ((A@@7 (FieldTypeInv0 (type f_2@@1))))
 (=> (and (and (= (type o2@@0) RefType) (= (type f_2@@1) (FieldType A@@7 B@@6))) (U_2_bool (MapType1Select (MapType0Select Heap@@44 null (WandMaskField pm_f@@2)) o2@@0 f_2@@1))) (= (MapType0Select Heap@@44 o2@@0 f_2@@1) (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1)))))
 :qid |stdinbpl.67:129|
 :skolemid |6|
 :pattern ( (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1))
))))
 :qid |stdinbpl.65:19|
 :skolemid |7|
 :pattern ( (IdenticalOnKnownLocations Heap@@44 ExhaleHeap@@5 Mask@@23) (IsWandField pm_f@@2))
)))
(assert (forall ((this@@47 T@U) ) (!  (=> (= (type this@@47) RefType) (= (getPredWandId (tree this@@47)) 0))
 :qid |stdinbpl.2213:15|
 :skolemid |93|
 :pattern ( (tree this@@47))
)))
(assert (forall ((this@@48 T@U) ) (!  (=> (= (type this@@48) RefType) (= (getPredWandId (heap this@@48)) 2))
 :qid |stdinbpl.2524:15|
 :skolemid |105|
 :pattern ( (heap this@@48))
)))
(assert (forall ((Mask@@24 T@U) (o_2@@2 T@U) (f_4@@2 T@U) ) (! (let ((B@@7 (FieldTypeInv1 (type f_4@@2))))
(let ((A@@8 (FieldTypeInv0 (type f_4@@2))))
 (=> (and (and (and (= (type Mask@@24) (MapType1Type RefType realType)) (= (type o_2@@2) RefType)) (= (type f_4@@2) (FieldType A@@8 B@@7))) (GoodMask Mask@@24)) (and (>= (U_2_real (MapType1Select Mask@@24 o_2@@2 f_4@@2)) NoPerm) (=> (and (and (GoodMask Mask@@24) (not (IsPredicateField f_4@@2))) (not (IsWandField f_4@@2))) (<= (U_2_real (MapType1Select Mask@@24 o_2@@2 f_4@@2)) FullPerm))))))
 :qid |stdinbpl.128:22|
 :skolemid |16|
 :pattern ( (GoodMask Mask@@24) (MapType1Select Mask@@24 o_2@@2 f_4@@2))
)))
(assert (forall ((Heap@@45 T@U) (Mask@@25 T@U) (this@@49 T@U) (last@@29 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@45) (MapType0Type RefType)) (= (type Mask@@25) (MapType1Type RefType realType))) (= (type this@@49) RefType)) (= (type last@@29) RefType)) (and (state Heap@@45 Mask@@25) (or (< AssumeFunctionsAbove 8) (|segLength#trigger| (MapType0Select Heap@@45 null (heapseg this@@49 last@@29)) this@@49 last@@29)))) (<= 0 (|segLength'| Heap@@45 this@@49 last@@29)))
 :qid |stdinbpl.794:15|
 :skolemid |47|
 :pattern ( (state Heap@@45 Mask@@25) (|segLength'| Heap@@45 this@@49 last@@29))
)))
(assert (forall ((Heap@@46 T@U) (Mask@@26 T@U) (this@@50 T@U) ) (!  (=> (and (and (and (= (type Heap@@46) (MapType0Type RefType)) (= (type Mask@@26) (MapType1Type RefType realType))) (= (type this@@50) RefType)) (state Heap@@46 Mask@@26)) (= (|treeKey'| Heap@@46 this@@50) (|treeKey#frame| (MapType0Select Heap@@46 null (tree this@@50)) this@@50)))
 :qid |stdinbpl.237:15|
 :skolemid |25|
 :pattern ( (state Heap@@46 Mask@@26) (|treeKey'| Heap@@46 this@@50))
)))
(assert (forall ((Heap@@47 T@U) (Mask@@27 T@U) (this@@51 T@U) ) (!  (=> (and (and (and (= (type Heap@@47) (MapType0Type RefType)) (= (type Mask@@27) (MapType1Type RefType realType))) (= (type this@@51) RefType)) (state Heap@@47 Mask@@27)) (= (|treeDegree'| Heap@@47 this@@51) (|treeDegree#frame| (MapType0Select Heap@@47 null (tree this@@51)) this@@51)))
 :qid |stdinbpl.366:15|
 :skolemid |30|
 :pattern ( (state Heap@@47 Mask@@27) (|treeDegree'| Heap@@47 this@@51))
)))
(assert (forall ((Heap@@48 T@U) (Mask@@28 T@U) (this@@52 T@U) ) (!  (=> (and (and (and (= (type Heap@@48) (MapType0Type RefType)) (= (type Mask@@28) (MapType1Type RefType realType))) (= (type this@@52) RefType)) (state Heap@@48 Mask@@28)) (= (|treeSize'| Heap@@48 this@@52) (|treeSize#frame| (MapType0Select Heap@@48 null (tree this@@52)) this@@52)))
 :qid |stdinbpl.507:15|
 :skolemid |36|
 :pattern ( (state Heap@@48 Mask@@28) (|treeSize'| Heap@@48 this@@52))
 :pattern ( (state Heap@@48 Mask@@28) (|treeSize#triggerStateless| this@@52) (|tree#trigger| Heap@@48 (tree this@@52)))
)))
(assert (forall ((arg0@@39 T@U) (arg1@@18 T@U) ) (! (= (type (|treeParent#frame| arg0@@39 arg1@@18)) RefType)
 :qid |funType:treeParent#frame|
 :pattern ( (|treeParent#frame| arg0@@39 arg1@@18))
)))
(assert (forall ((Heap@@49 T@U) (Mask@@29 T@U) (this@@53 T@U) ) (!  (=> (and (and (and (= (type Heap@@49) (MapType0Type RefType)) (= (type Mask@@29) (MapType1Type RefType realType))) (= (type this@@53) RefType)) (state Heap@@49 Mask@@29)) (= (|treeParent'| Heap@@49 this@@53) (|treeParent#frame| (MapType0Select Heap@@49 null (tree this@@53)) this@@53)))
 :qid |stdinbpl.659:15|
 :skolemid |41|
 :pattern ( (state Heap@@49 Mask@@29) (|treeParent'| Heap@@49 this@@53))
)))
(assert (forall ((o T@U) (f T@U) (Heap@@50 T@U) ) (!  (=> (and (and (and (= (type o) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap@@50) (MapType0Type RefType))) (U_2_bool (MapType0Select Heap@@50 o $allocated))) (U_2_bool (MapType0Select Heap@@50 (MapType0Select Heap@@50 o f) $allocated)))
 :qid |stdinbpl.31:15|
 :skolemid |0|
 :pattern ( (MapType0Select Heap@@50 o f))
)))
(assert (forall ((this@@54 T@U) (last@@30 T@U) ) (!  (=> (and (= (type this@@54) RefType) (= (type last@@30) RefType)) (= (PredicateMaskField (heapseg this@@54 last@@30)) (|heapseg#sm| this@@54 last@@30)))
 :qid |stdinbpl.2398:15|
 :skolemid |97|
 :pattern ( (PredicateMaskField (heapseg this@@54 last@@30)))
)))
(assert (forall ((Heap@@51 T@U) (Mask@@30 T@U) (this@@55 T@U) (last@@31 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@51) (MapType0Type RefType)) (= (type Mask@@30) (MapType1Type RefType realType))) (= (type this@@55) RefType)) (= (type last@@31) RefType)) (and (state Heap@@51 Mask@@30) (< AssumeFunctionsAbove 0))) (= (sorted Heap@@51 this@@55 last@@31)  (=> (< 1 (segLength Heap@@51 this@@55 last@@31)) (and (< (treeDegree Heap@@51 this@@55) (segDegree Heap@@51 (MapType0Select Heap@@51 this@@55 sibling) last@@31 0)) (|sorted'| Heap@@51 (MapType0Select Heap@@51 this@@55 sibling) last@@31)))))
 :qid |stdinbpl.1475:15|
 :skolemid |74|
 :pattern ( (state Heap@@51 Mask@@30) (sorted Heap@@51 this@@55 last@@31))
 :pattern ( (state Heap@@51 Mask@@30) (|sorted#triggerStateless| this@@55 last@@31) (|heapseg#trigger| Heap@@51 (heapseg this@@55 last@@31)) (|heapseg#trigger| Heap@@51 (heapseg this@@55 last@@31)) (|heapseg#trigger| Heap@@51 (heapseg this@@55 last@@31)))
)))
(assert (forall ((this@@56 T@U) ) (!  (=> (= (type this@@56) RefType) (= (PredicateMaskField (tree this@@56)) (|tree#sm| this@@56)))
 :qid |stdinbpl.2205:15|
 :skolemid |91|
 :pattern ( (PredicateMaskField (tree this@@56)))
)))
(assert (forall ((this@@57 T@U) ) (!  (=> (= (type this@@57) RefType) (= (PredicateMaskField (heap this@@57)) (|heap#sm| this@@57)))
 :qid |stdinbpl.2516:15|
 :skolemid |103|
 :pattern ( (PredicateMaskField (heap this@@57)))
)))
(assert (forall ((Heap@@52 T@U) (o@@0 T@U) (f_3 T@U) (v T@U) ) (! (let ((B@@8 (type v)))
(let ((A@@9 (FieldTypeInv0 (type f_3))))
 (=> (and (and (= (type Heap@@52) (MapType0Type RefType)) (= (type o@@0) RefType)) (= (type f_3) (FieldType A@@9 B@@8))) (succHeap Heap@@52 (MapType0Store Heap@@52 o@@0 f_3 v)))))
 :qid |stdinbpl.78:22|
 :skolemid |9|
 :pattern ( (MapType0Store Heap@@52 o@@0 f_3 v))
)))
(assert (forall ((Heap@@53 T@U) (Mask@@31 T@U) (this@@58 T@U) ) (!  (=> (and (and (and (= (type Heap@@53) (MapType0Type RefType)) (= (type Mask@@31) (MapType1Type RefType realType))) (= (type this@@58) RefType)) (and (state Heap@@53 Mask@@31) (< AssumeFunctionsAbove 3))) (= (treeKey Heap@@53 this@@58) (U_2_int (MapType0Select Heap@@53 this@@58 key))))
 :qid |stdinbpl.230:15|
 :skolemid |24|
 :pattern ( (state Heap@@53 Mask@@31) (treeKey Heap@@53 this@@58))
 :pattern ( (state Heap@@53 Mask@@31) (|treeKey#triggerStateless| this@@58) (|tree#trigger| Heap@@53 (tree this@@58)))
)))
(assert (forall ((Heap@@54 T@U) (Mask@@32 T@U) (this@@59 T@U) ) (!  (=> (and (and (and (= (type Heap@@54) (MapType0Type RefType)) (= (type Mask@@32) (MapType1Type RefType realType))) (= (type this@@59) RefType)) (and (state Heap@@54 Mask@@32) (< AssumeFunctionsAbove 6))) (= (treeParent Heap@@54 this@@59) (MapType0Select Heap@@54 this@@59 parent)))
 :qid |stdinbpl.652:15|
 :skolemid |40|
 :pattern ( (state Heap@@54 Mask@@32) (treeParent Heap@@54 this@@59))
 :pattern ( (state Heap@@54 Mask@@32) (|treeParent#triggerStateless| this@@59) (|tree#trigger| Heap@@54 (tree this@@59)))
)))
(assert (forall ((Heap@@55 T@U) (Mask@@33 T@U) (this@@60 T@U) ) (!  (=> (and (and (and (= (type Heap@@55) (MapType0Type RefType)) (= (type Mask@@33) (MapType1Type RefType realType))) (= (type this@@60) RefType)) (and (state Heap@@55 Mask@@33) (< AssumeFunctionsAbove 9))) (= (treeDegree Heap@@55 this@@60) (U_2_int (MapType0Select Heap@@55 this@@60 degree))))
 :qid |stdinbpl.359:15|
 :skolemid |29|
 :pattern ( (state Heap@@55 Mask@@33) (treeDegree Heap@@55 this@@60))
 :pattern ( (state Heap@@55 Mask@@33) (|treeDegree#triggerStateless| this@@60) (|tree#trigger| Heap@@55 (tree this@@60)))
)))
(assert (= (type ZeroPMask) (MapType1Type RefType boolType)))
(assert (forall ((o_2@@3 T@U) (f_4@@3 T@U) ) (! (let ((B@@9 (FieldTypeInv1 (type f_4@@3))))
(let ((A@@10 (FieldTypeInv0 (type f_4@@3))))
 (=> (and (= (type o_2@@3) RefType) (= (type f_4@@3) (FieldType A@@10 B@@9))) (not (U_2_bool (MapType1Select ZeroPMask o_2@@3 f_4@@3))))))
 :qid |stdinbpl.112:22|
 :skolemid |14|
 :pattern ( (MapType1Select ZeroPMask o_2@@3 f_4@@3))
)))
(assert (forall ((Heap@@56 T@U) (Mask@@34 T@U) (this@@61 T@U) (last@@32 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@56) (MapType0Type RefType)) (= (type Mask@@34) (MapType1Type RefType realType))) (= (type this@@61) RefType)) (= (type last@@32) RefType)) (and (state Heap@@56 Mask@@34) (< AssumeFunctionsAbove 2))) (= (validChildren Heap@@56 this@@61 last@@32)  (=> (< 1 (segLength Heap@@56 this@@61 last@@32)) (and (= (treeDegree Heap@@56 this@@61) (+ (segDegree Heap@@56 (MapType0Select Heap@@56 this@@61 sibling) last@@32 0) 1)) (|validChildren'| Heap@@56 (MapType0Select Heap@@56 this@@61 sibling) last@@32)))))
 :qid |stdinbpl.2013:15|
 :skolemid |87|
 :pattern ( (state Heap@@56 Mask@@34) (validChildren Heap@@56 this@@61 last@@32))
 :pattern ( (state Heap@@56 Mask@@34) (|validChildren#triggerStateless| this@@61 last@@32) (|heapseg#trigger| Heap@@56 (heapseg this@@61 last@@32)) (|heapseg#trigger| Heap@@56 (heapseg this@@61 last@@32)) (|heapseg#trigger| Heap@@56 (heapseg this@@61 last@@32)))
)))
(assert (forall ((p@@1 T@U) (v_1@@0 T@U) (q T@U) (w@@0 T@U) (r T@U) (u T@U) ) (! (let ((C@@3 (FieldTypeInv0 (type r))))
(let ((B@@10 (FieldTypeInv0 (type q))))
(let ((A@@11 (FieldTypeInv0 (type p@@1))))
 (=> (and (and (and (and (and (and (= (type p@@1) (FieldType A@@11 FrameTypeType)) (= (type v_1@@0) FrameTypeType)) (= (type q) (FieldType B@@10 FrameTypeType))) (= (type w@@0) FrameTypeType)) (= (type r) (FieldType C@@3 FrameTypeType))) (= (type u) FrameTypeType)) (and (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))) (InsidePredicate p@@1 v_1@@0 r u)))))
 :qid |stdinbpl.177:25|
 :skolemid |20|
 :pattern ( (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
(assert (forall ((Heap@@57 T@U) (Mask@@35 T@U) (this@@62 T@U) (last@@33 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@57) (MapType0Type RefType)) (= (type Mask@@35) (MapType1Type RefType realType))) (= (type this@@62) RefType)) (= (type last@@33) RefType)) (and (state Heap@@57 Mask@@35) (< AssumeFunctionsAbove 4))) (not (= this@@62 last@@33))) (= (segParent Heap@@57 this@@62 last@@33) (treeParent Heap@@57 this@@62)))
 :qid |stdinbpl.1336:15|
 :skolemid |68|
 :pattern ( (state Heap@@57 Mask@@35) (segParent Heap@@57 this@@62 last@@33))
 :pattern ( (state Heap@@57 Mask@@35) (|segParent#triggerStateless| this@@62 last@@33) (|heapseg#trigger| Heap@@57 (heapseg this@@62 last@@33)))
)))
(assert (forall ((Heap@@58 T@U) (this@@63 T@U) (last@@34 T@U) ) (!  (=> (and (and (= (type Heap@@58) (MapType0Type RefType)) (= (type this@@63) RefType)) (= (type last@@34) RefType)) (and (= (sorted Heap@@58 this@@63 last@@34) (|sorted'| Heap@@58 this@@63 last@@34)) (dummyFunction (bool_2_U (|sorted#triggerStateless| this@@63 last@@34)))))
 :qid |stdinbpl.1465:15|
 :skolemid |72|
 :pattern ( (sorted Heap@@58 this@@63 last@@34))
)))
(assert (forall ((Heap@@59 T@U) (this@@64 T@U) (last@@35 T@U) ) (!  (=> (and (and (= (type Heap@@59) (MapType0Type RefType)) (= (type this@@64) RefType)) (= (type last@@35) RefType)) (and (= (presorted Heap@@59 this@@64 last@@35) (|presorted'| Heap@@59 this@@64 last@@35)) (dummyFunction (bool_2_U (|presorted#triggerStateless| this@@64 last@@35)))))
 :qid |stdinbpl.1702:15|
 :skolemid |79|
 :pattern ( (presorted Heap@@59 this@@64 last@@35))
)))
(assert (forall ((Heap@@60 T@U) (this@@65 T@U) (last@@36 T@U) ) (!  (=> (and (and (= (type Heap@@60) (MapType0Type RefType)) (= (type this@@65) RefType)) (= (type last@@36) RefType)) (and (= (validChildren Heap@@60 this@@65 last@@36) (|validChildren'| Heap@@60 this@@65 last@@36)) (dummyFunction (bool_2_U (|validChildren#triggerStateless| this@@65 last@@36)))))
 :qid |stdinbpl.2003:15|
 :skolemid |85|
 :pattern ( (validChildren Heap@@60 this@@65 last@@36))
)))
; Valid

(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun PostMask@6 () T@U)
(declare-fun PostMask@1 () T@U)
(declare-fun res () T@U)
(declare-fun PostHeap@0 () T@U)
(declare-fun PostMask@7 () T@U)
(declare-fun arg () T@U)
(declare-fun Mask@0 () T@U)
(declare-fun PostMask@3 () T@U)
(declare-fun PostMask@2 () T@U)
(declare-fun Heap@@61 () T@U)
(declare-fun PostMask@0 () T@U)
(declare-fun Mask@93 () T@U)
(declare-fun Mask@74 () T@U)
(declare-fun res@0 () T@U)
(declare-fun x@0 () T@U)
(declare-fun ExhaleHeap@0 () T@U)
(declare-fun Mask@94 () T@U)
(declare-fun Mask@90 () T@U)
(declare-fun Mask@91 () T@U)
(declare-fun Mask@87 () T@U)
(declare-fun Mask@88 () T@U)
(declare-fun Mask@82 () T@U)
(declare-fun Mask@83 () T@U)
(declare-fun Mask@80 () T@U)
(declare-fun Mask@81 () T@U)
(declare-fun Mask@78 () T@U)
(declare-fun Mask@79 () T@U)
(declare-fun Mask@77 () T@U)
(declare-fun Mask@76 () T@U)
(declare-fun Mask@75 () T@U)
(declare-fun Mask@73 () T@U)
(declare-fun Mask@14 () T@U)
(declare-fun Mask@13 () T@U)
(declare-fun Mask@34 () T@U)
(declare-fun x@1 () T@U)
(declare-fun Heap@50 () T@U)
(declare-fun res@1 () T@U)
(declare-fun Mask@70 () T@U)
(declare-fun Mask@69 () T@U)
(declare-fun Mask@68 () T@U)
(declare-fun Mask@67 () T@U)
(declare-fun Heap@46 () T@U)
(declare-fun newPMask@12 () T@U)
(declare-fun Heap@47 () T@U)
(declare-fun Heap@48 () T@U)
(declare-fun newPMask@13 () T@U)
(declare-fun Heap@49 () T@U)
(declare-fun ExhaleHeap@3 () T@U)
(declare-fun Heap@44 () T@U)
(declare-fun Heap@45 () T@U)
(declare-fun freshVersion@5 () T@U)
(declare-fun Mask@66 () T@U)
(declare-fun FrameFragment (T@U) T@U)
(declare-fun CombineFrames (T@U T@U) T@U)
(declare-fun Mask@65 () T@U)
(declare-fun Mask@64 () T@U)
(declare-fun Mask@63 () T@U)
(declare-fun Mask@62 () T@U)
(declare-fun Heap@43 () T@U)
(declare-fun Mask@60 () T@U)
(declare-fun Mask@61 () T@U)
(declare-fun Mask@59 () T@U)
(declare-fun Mask@58 () T@U)
(declare-fun Mask@57 () T@U)
(declare-fun Mask@56 () T@U)
(declare-fun Mask@55 () T@U)
(declare-fun Mask@54 () T@U)
(declare-fun Mask@52 () T@U)
(declare-fun Mask@51 () T@U)
(declare-fun Mask@53 () T@U)
(declare-fun Heap@41 () T@U)
(declare-fun Heap@42 () T@U)
(declare-fun newVersion@1 () T@U)
(declare-fun Mask@50 () T@U)
(declare-fun Heap@37 () T@U)
(declare-fun newPMask@10 () T@U)
(declare-fun Heap@38 () T@U)
(declare-fun Heap@39 () T@U)
(declare-fun newPMask@11 () T@U)
(declare-fun Heap@40 () T@U)
(declare-fun Heap@34 () T@U)
(declare-fun Heap@35 () T@U)
(declare-fun Heap@36 () T@U)
(declare-fun freshVersion@4 () T@U)
(declare-fun Mask@49 () T@U)
(declare-fun Mask@48 () T@U)
(declare-fun Mask@47 () T@U)
(declare-fun Mask@46 () T@U)
(declare-fun Mask@45 () T@U)
(declare-fun Heap@30 () T@U)
(declare-fun newPMask@8 () T@U)
(declare-fun Heap@31 () T@U)
(declare-fun Heap@32 () T@U)
(declare-fun newPMask@9 () T@U)
(declare-fun Heap@33 () T@U)
(declare-fun Heap@27 () T@U)
(declare-fun Heap@28 () T@U)
(declare-fun Heap@29 () T@U)
(declare-fun freshVersion@3 () T@U)
(declare-fun Mask@44 () T@U)
(declare-fun Mask@43 () T@U)
(declare-fun Mask@42 () T@U)
(declare-fun Mask@41 () T@U)
(declare-fun Mask@40 () T@U)
(declare-fun Heap@26 () T@U)
(declare-fun Mask@39 () T@U)
(declare-fun Heap@22 () T@U)
(declare-fun newPMask@6 () T@U)
(declare-fun Heap@23 () T@U)
(declare-fun Heap@24 () T@U)
(declare-fun newPMask@7 () T@U)
(declare-fun Heap@25 () T@U)
(declare-fun ExhaleHeap@2 () T@U)
(declare-fun Heap@20 () T@U)
(declare-fun Heap@21 () T@U)
(declare-fun freshVersion@2 () T@U)
(declare-fun Mask@38 () T@U)
(declare-fun Mask@37 () T@U)
(declare-fun Mask@36 () T@U)
(declare-fun Mask@35 () T@U)
(declare-fun vmin@2 () Int)
(declare-fun Heap@19 () T@U)
(declare-fun Mask@32 () T@U)
(declare-fun Mask@33 () T@U)
(declare-fun Mask@31 () T@U)
(declare-fun Mask@30 () T@U)
(declare-fun Mask@29 () T@U)
(declare-fun Mask@28 () T@U)
(declare-fun Mask@27 () T@U)
(declare-fun vmin@1 () Int)
(declare-fun Mask@26 () T@U)
(declare-fun Mask@24 () T@U)
(declare-fun Mask@23 () T@U)
(declare-fun Mask@25 () T@U)
(declare-fun Heap@18 () T@U)
(declare-fun newVersion@0 () T@U)
(declare-fun Mask@17 () T@U)
(declare-fun tmp () T@U)
(declare-fun Mask@15 () T@U)
(declare-fun Mask@16 () T@U)
(declare-fun Mask@22 () T@U)
(declare-fun Mask@21 () T@U)
(declare-fun Mask@20 () T@U)
(declare-fun Mask@18 () T@U)
(declare-fun Mask@19 () T@U)
(declare-fun Heap@17 () T@U)
(declare-fun Mask@12 () T@U)
(declare-fun Mask@11 () T@U)
(declare-fun Mask@10 () T@U)
(declare-fun Heap@13 () T@U)
(declare-fun newPMask@4 () T@U)
(declare-fun Heap@14 () T@U)
(declare-fun Heap@15 () T@U)
(declare-fun newPMask@5 () T@U)
(declare-fun Heap@16 () T@U)
(declare-fun Heap@10 () T@U)
(declare-fun Heap@11 () T@U)
(declare-fun Heap@12 () T@U)
(declare-fun freshVersion@1 () T@U)
(declare-fun Mask@9 () T@U)
(declare-fun Mask@8 () T@U)
(declare-fun Mask@7 () T@U)
(declare-fun Mask@6 () T@U)
(declare-fun Mask@5 () T@U)
(declare-fun Heap@6 () T@U)
(declare-fun newPMask@2 () T@U)
(declare-fun Heap@7 () T@U)
(declare-fun Heap@8 () T@U)
(declare-fun newPMask@3 () T@U)
(declare-fun Heap@9 () T@U)
(declare-fun Heap@3 () T@U)
(declare-fun Heap@4 () T@U)
(declare-fun Heap@5 () T@U)
(declare-fun freshVersion@0 () T@U)
(declare-fun Mask@4 () T@U)
(declare-fun Mask@3 () T@U)
(declare-fun Mask@2 () T@U)
(declare-fun Mask@1 () T@U)
(declare-fun vmin@0 () Int)
(declare-fun newPMask@0 () T@U)
(declare-fun Heap@0 () T@U)
(declare-fun Heap@1 () T@U)
(declare-fun newPMask@1 () T@U)
(declare-fun Heap@2 () T@U)
(declare-fun UnfoldingMask@4 () T@U)
(declare-fun UnfoldingMask@3 () T@U)
(declare-fun UnfoldingMask@1 () T@U)
(declare-fun UnfoldingMask@0 () T@U)
(declare-fun UnfoldingMask@2 () T@U)
(declare-fun x@@8 () T@U)
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (= (type Mask@0) (MapType1Type RefType realType)) (= (type arg) RefType)) (= (type UnfoldingMask@4) (MapType1Type RefType realType))) (= (type ExhaleHeap@0) (MapType0Type RefType))) (= (type res@0) RefType)) (= (type Heap@@61) (MapType0Type RefType))) (= (type Mask@22) (MapType1Type RefType realType))) (= (type Mask@21) (MapType1Type RefType realType))) (= (type Mask@20) (MapType1Type RefType realType))) (= (type x@0) RefType)) (= (type Mask@13) (MapType1Type RefType realType))) (= (type Mask@18) (MapType1Type RefType realType))) (= (type Mask@19) (MapType1Type RefType realType))) (= (type Mask@27) (MapType1Type RefType realType))) (= (type x@1) RefType)) (= (type Heap@50) (MapType0Type RefType))) (= (type res@1) RefType)) (= (type Mask@70) (MapType1Type RefType realType))) (= (type Mask@69) (MapType1Type RefType realType))) (= (type Mask@68) (MapType1Type RefType realType))) (= (type Mask@67) (MapType1Type RefType realType))) (= (type newPMask@12) (MapType1Type RefType boolType))) (= (type Heap@46) (MapType0Type RefType))) (= (type Heap@47) (MapType0Type RefType))) (= (type Heap@48) (MapType0Type RefType))) (= (type newPMask@13) (MapType1Type RefType boolType))) (= (type Heap@49) (MapType0Type RefType))) (= (type Heap@44) (MapType0Type RefType))) (= (type ExhaleHeap@3) (MapType0Type RefType))) (= (type Heap@45) (MapType0Type RefType))) (= (type freshVersion@5) FrameTypeType)) (= (type Mask@66) (MapType1Type RefType realType))) (forall ((arg0@@40 T@U) ) (! (= (type (FrameFragment arg0@@40)) FrameTypeType)
 :qid |funType:FrameFragment|
 :pattern ( (FrameFragment arg0@@40))
))) (forall ((arg0@@41 T@U) (arg1@@19 T@U) ) (! (= (type (CombineFrames arg0@@41 arg1@@19)) FrameTypeType)
 :qid |funType:CombineFrames|
 :pattern ( (CombineFrames arg0@@41 arg1@@19))
))) (= (type Mask@62) (MapType1Type RefType realType))) (= (type Mask@65) (MapType1Type RefType realType))) (= (type Mask@64) (MapType1Type RefType realType))) (= (type Mask@63) (MapType1Type RefType realType))) (= (type Heap@43) (MapType0Type RefType))) (= (type Mask@61) (MapType1Type RefType realType))) (= (type Mask@60) (MapType1Type RefType realType))) (= (type Mask@59) (MapType1Type RefType realType))) (= (type Mask@57) (MapType1Type RefType realType))) (= (type Mask@58) (MapType1Type RefType realType))) (= (type Mask@56) (MapType1Type RefType realType))) (= (type Mask@55) (MapType1Type RefType realType))) (= (type Mask@51) (MapType1Type RefType realType))) (= (type Mask@54) (MapType1Type RefType realType))) (= (type Mask@52) (MapType1Type RefType realType))) (= (type Mask@53) (MapType1Type RefType realType))) (= (type Heap@42) (MapType0Type RefType))) (= (type Heap@41) (MapType0Type RefType))) (= (type newVersion@1) FrameTypeType)) (= (type Mask@50) (MapType1Type RefType realType))) (= (type newPMask@10) (MapType1Type RefType boolType))) (= (type Heap@37) (MapType0Type RefType))) (= (type Heap@38) (MapType0Type RefType))) (= (type Heap@39) (MapType0Type RefType))) (= (type newPMask@11) (MapType1Type RefType boolType))) (= (type Heap@40) (MapType0Type RefType))) (= (type Heap@35) (MapType0Type RefType))) (= (type Heap@34) (MapType0Type RefType))) (= (type Heap@36) (MapType0Type RefType))) (= (type freshVersion@4) FrameTypeType)) (= (type Mask@49) (MapType1Type RefType realType))) (= (type Mask@45) (MapType1Type RefType realType))) (= (type Mask@48) (MapType1Type RefType realType))) (= (type Mask@47) (MapType1Type RefType realType))) (= (type Mask@46) (MapType1Type RefType realType))) (= (type newPMask@8) (MapType1Type RefType boolType))) (= (type Heap@30) (MapType0Type RefType))) (= (type Heap@31) (MapType0Type RefType))) (= (type Heap@32) (MapType0Type RefType))) (= (type newPMask@9) (MapType1Type RefType boolType))) (= (type Heap@33) (MapType0Type RefType))) (= (type Heap@28) (MapType0Type RefType))) (= (type Heap@27) (MapType0Type RefType))) (= (type Heap@29) (MapType0Type RefType))) (= (type freshVersion@3) FrameTypeType)) (= (type Mask@44) (MapType1Type RefType realType))) (= (type Mask@40) (MapType1Type RefType realType))) (= (type Mask@43) (MapType1Type RefType realType))) (= (type Mask@42) (MapType1Type RefType realType))) (= (type Mask@41) (MapType1Type RefType realType))) (= (type Heap@19) (MapType0Type RefType))) (= (type Mask@34) (MapType1Type RefType realType))) (= (type Heap@26) (MapType0Type RefType))) (= (type Mask@39) (MapType1Type RefType realType))) (= (type newPMask@6) (MapType1Type RefType boolType))) (= (type Heap@22) (MapType0Type RefType))) (= (type Heap@23) (MapType0Type RefType))) (= (type Heap@24) (MapType0Type RefType))) (= (type newPMask@7) (MapType1Type RefType boolType))) (= (type Heap@25) (MapType0Type RefType))) (= (type Heap@20) (MapType0Type RefType))) (= (type ExhaleHeap@2) (MapType0Type RefType))) (= (type Heap@21) (MapType0Type RefType))) (= (type freshVersion@2) FrameTypeType)) (= (type Mask@38) (MapType1Type RefType realType))) (= (type Mask@37) (MapType1Type RefType realType))) (= (type Mask@36) (MapType1Type RefType realType))) (= (type Mask@35) (MapType1Type RefType realType))) (= (type Mask@33) (MapType1Type RefType realType))) (= (type Mask@32) (MapType1Type RefType realType))) (= (type Mask@31) (MapType1Type RefType realType))) (= (type Mask@29) (MapType1Type RefType realType))) (= (type Mask@30) (MapType1Type RefType realType))) (= (type Mask@28) (MapType1Type RefType realType))) (= (type Mask@23) (MapType1Type RefType realType))) (= (type Mask@26) (MapType1Type RefType realType))) (= (type Mask@24) (MapType1Type RefType realType))) (= (type Mask@25) (MapType1Type RefType realType))) (= (type Heap@18) (MapType0Type RefType))) (= (type newVersion@0) FrameTypeType)) (= (type Mask@17) (MapType1Type RefType realType))) (= (type tmp) RefType)) (= (type Mask@15) (MapType1Type RefType realType))) (= (type Mask@16) (MapType1Type RefType realType))) (= (type Mask@14) (MapType1Type RefType realType))) (= (type Mask@73) (MapType1Type RefType realType))) (= (type Mask@74) (MapType1Type RefType realType))) (= (type Mask@75) (MapType1Type RefType realType))) (= (type Mask@76) (MapType1Type RefType realType))) (= (type Mask@77) (MapType1Type RefType realType))) (= (type Mask@79) (MapType1Type RefType realType))) (= (type Mask@78) (MapType1Type RefType realType))) (= (type Mask@81) (MapType1Type RefType realType))) (= (type Mask@80) (MapType1Type RefType realType))) (= (type Mask@83) (MapType1Type RefType realType))) (= (type Mask@82) (MapType1Type RefType realType))) (= (type Mask@88) (MapType1Type RefType realType))) (= (type Mask@87) (MapType1Type RefType realType))) (= (type Mask@91) (MapType1Type RefType realType))) (= (type Mask@90) (MapType1Type RefType realType))) (= (type Mask@94) (MapType1Type RefType realType))) (= (type Mask@93) (MapType1Type RefType realType))) (= (type Heap@17) (MapType0Type RefType))) (= (type Mask@12) (MapType1Type RefType realType))) (= (type Mask@11) (MapType1Type RefType realType))) (= (type Mask@10) (MapType1Type RefType realType))) (= (type newPMask@4) (MapType1Type RefType boolType))) (= (type Heap@13) (MapType0Type RefType))) (= (type Heap@14) (MapType0Type RefType))) (= (type Heap@15) (MapType0Type RefType))) (= (type newPMask@5) (MapType1Type RefType boolType))) (= (type Heap@16) (MapType0Type RefType))) (= (type Heap@11) (MapType0Type RefType))) (= (type Heap@10) (MapType0Type RefType))) (= (type Heap@12) (MapType0Type RefType))) (= (type freshVersion@1) FrameTypeType)) (= (type Mask@9) (MapType1Type RefType realType))) (= (type Mask@5) (MapType1Type RefType realType))) (= (type Mask@8) (MapType1Type RefType realType))) (= (type Mask@7) (MapType1Type RefType realType))) (= (type Mask@6) (MapType1Type RefType realType))) (= (type newPMask@2) (MapType1Type RefType boolType))) (= (type Heap@6) (MapType0Type RefType))) (= (type Heap@7) (MapType0Type RefType))) (= (type Heap@8) (MapType0Type RefType))) (= (type newPMask@3) (MapType1Type RefType boolType))) (= (type Heap@9) (MapType0Type RefType))) (= (type Heap@4) (MapType0Type RefType))) (= (type Heap@3) (MapType0Type RefType))) (= (type Heap@5) (MapType0Type RefType))) (= (type freshVersion@0) FrameTypeType)) (= (type Mask@4) (MapType1Type RefType realType))) (= (type Mask@3) (MapType1Type RefType realType))) (= (type Mask@2) (MapType1Type RefType realType))) (= (type Mask@1) (MapType1Type RefType realType))) (= (type newPMask@0) (MapType1Type RefType boolType))) (= (type Heap@0) (MapType0Type RefType))) (= (type Heap@1) (MapType0Type RefType))) (= (type newPMask@1) (MapType1Type RefType boolType))) (= (type Heap@2) (MapType0Type RefType))) (= (type UnfoldingMask@0) (MapType1Type RefType realType))) (= (type UnfoldingMask@3) (MapType1Type RefType realType))) (= (type UnfoldingMask@1) (MapType1Type RefType realType))) (= (type UnfoldingMask@2) (MapType1Type RefType realType))) (= (type x@@8) RefType)) (= (type PostMask@0) (MapType1Type RefType realType))) (= (type res) RefType)) (= (type PostMask@1) (MapType1Type RefType realType))) (= (type PostMask@2) (MapType1Type RefType realType))) (= (type PostHeap@0) (MapType0Type RefType))) (= (type PostMask@3) (MapType1Type RefType realType))) (= (type PostMask@7) (MapType1Type RefType realType))) (= (type PostMask@6) (MapType1Type RefType realType))))
(set-info :boogie-vc-id findMinNode)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 658) (let ((anon25_correct  (=> (and (= PostMask@6 (MapType1Store PostMask@1 null (heapseg res null) (real_2_U (- (U_2_real (MapType1Select PostMask@1 null (heapseg res null))) FullPerm)))) (= (ControlFlow 0 648) (- 0 647))) (< 0 (segLength PostHeap@0 res null)))))
(let ((anon455_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 651) 648)) anon25_correct)))
(let ((anon455_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 649) (- 0 650)) (<= FullPerm (U_2_real (MapType1Select PostMask@1 null (heapseg res null))))) (=> (<= FullPerm (U_2_real (MapType1Select PostMask@1 null (heapseg res null)))) (=> (= (ControlFlow 0 649) 648) anon25_correct))))))
(let ((anon21_correct  (=> (= PostMask@7 (MapType1Store PostMask@1 null (heapseg arg res) (real_2_U (- (U_2_real (MapType1Select PostMask@1 null (heapseg arg res))) FullPerm)))) (and (=> (= (ControlFlow 0 642) (- 0 643)) (<= 0 (- (segLength PostHeap@0 arg res) 1))) (=> (<= 0 (- (segLength PostHeap@0 arg res) 1)) (=> (= (ControlFlow 0 642) (- 0 641)) (< (- (segLength PostHeap@0 arg res) 1) (segLength PostHeap@0 arg res))))))))
(let ((anon453_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 646) 642)) anon21_correct)))
(let ((anon453_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 644) (- 0 645)) (<= FullPerm (U_2_real (MapType1Select PostMask@1 null (heapseg arg res))))) (=> (<= FullPerm (U_2_real (MapType1Select PostMask@1 null (heapseg arg res)))) (=> (= (ControlFlow 0 644) 642) anon21_correct))))))
(let ((anon17_correct true))
(let ((anon451_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 640) 637)) anon17_correct)))
(let ((anon451_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 638) (- 0 639)) (<= FullPerm (U_2_real (MapType1Select PostMask@1 null (heapseg arg res))))) (=> (<= FullPerm (U_2_real (MapType1Select PostMask@1 null (heapseg arg res)))) (=> (= (ControlFlow 0 638) 637) anon17_correct))))))
(let ((anon47_correct  (=> (= (ControlFlow 0 628) (- 0 627)) (not (= arg null)))))
(let ((anon466_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 631) 628)) anon47_correct)))
(let ((anon466_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 629) (- 0 630)) (<= FullPerm (U_2_real (MapType1Select Mask@0 null (heapseg arg null))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@0 null (heapseg arg null)))) (=> (= (ControlFlow 0 629) 628) anon47_correct))))))
(let ((anon43_correct  (=> (and (= PostMask@3 (MapType1Store PostMask@1 null (heapseg arg res) (real_2_U (- (U_2_real (MapType1Select PostMask@1 null (heapseg arg res))) FullPerm)))) (= (ControlFlow 0 623) (- 0 622))) (not (= arg res)))))
(let ((anon464_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 626) 623)) anon43_correct)))
(let ((anon464_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 624) (- 0 625)) (<= FullPerm (U_2_real (MapType1Select PostMask@1 null (heapseg arg res))))) (=> (<= FullPerm (U_2_real (MapType1Select PostMask@1 null (heapseg arg res)))) (=> (= (ControlFlow 0 624) 623) anon43_correct))))))
(let ((anon56_correct  (=> (= (ControlFlow 0 615) (- 0 614)) (not (= arg null)))))
(let ((anon470_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 618) 615)) anon56_correct)))
(let ((anon470_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 616) (- 0 617)) (<= FullPerm (U_2_real (MapType1Select Mask@0 null (heapseg arg null))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@0 null (heapseg arg null)))) (=> (= (ControlFlow 0 616) 615) anon56_correct))))))
(let ((anon52_correct  (=> (and (= PostMask@2 (MapType1Store PostMask@1 null (heapseg res null) (real_2_U (- (U_2_real (MapType1Select PostMask@1 null (heapseg res null))) FullPerm)))) (= (ControlFlow 0 610) (- 0 609))) (not (= res null)))))
(let ((anon468_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 613) 610)) anon52_correct)))
(let ((anon468_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 611) (- 0 612)) (<= FullPerm (U_2_real (MapType1Select PostMask@1 null (heapseg res null))))) (=> (<= FullPerm (U_2_real (MapType1Select PostMask@1 null (heapseg res null)))) (=> (= (ControlFlow 0 611) 610) anon52_correct))))))
(let ((anon469_Else_correct true))
(let ((anon49_correct  (=> (and (state PostHeap@0 PostMask@1) (state PostHeap@0 PostMask@1)) (and (and (and (and (=> (= (ControlFlow 0 619) 608) anon469_Else_correct) (=> (= (ControlFlow 0 619) 616) anon470_Then_correct)) (=> (= (ControlFlow 0 619) 618) anon470_Else_correct)) (=> (= (ControlFlow 0 619) 611) anon468_Then_correct)) (=> (= (ControlFlow 0 619) 613) anon468_Else_correct)))))
(let ((anon465_Else_correct  (=> (and (= (segParent PostHeap@0 arg res) (segParent Heap@@61 arg null)) (= (ControlFlow 0 621) 619)) anon49_correct)))
(let ((anon462_Then_correct  (=> (and (not (= arg res)) (state PostHeap@0 PostMask@1)) (and (and (and (and (=> (= (ControlFlow 0 632) 621) anon465_Else_correct) (=> (= (ControlFlow 0 632) 629) anon466_Then_correct)) (=> (= (ControlFlow 0 632) 631) anon466_Else_correct)) (=> (= (ControlFlow 0 632) 624) anon464_Then_correct)) (=> (= (ControlFlow 0 632) 626) anon464_Else_correct)))))
(let ((anon462_Else_correct  (=> (and (= arg res) (= (ControlFlow 0 620) 619)) anon49_correct)))
(let ((anon460_Else_correct  (=> (and (= (+ (segSize PostHeap@0 arg res) (segSize PostHeap@0 res null)) (segSize Heap@@61 arg null)) (state PostHeap@0 PostMask@1)) (and (=> (= (ControlFlow 0 633) 632) anon462_Then_correct) (=> (= (ControlFlow 0 633) 620) anon462_Else_correct)))))
(let ((anon38_correct true))
(let ((anon461_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 607) 604)) anon38_correct)))
(let ((anon461_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 605) (- 0 606)) (<= FullPerm (U_2_real (MapType1Select Mask@0 null (heapseg arg null))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@0 null (heapseg arg null)))) (=> (= (ControlFlow 0 605) 604) anon38_correct))))))
(let ((anon34_correct true))
(let ((anon459_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 603) 600)) anon34_correct)))
(let ((anon459_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 601) (- 0 602)) (<= FullPerm (U_2_real (MapType1Select PostMask@1 null (heapseg res null))))) (=> (<= FullPerm (U_2_real (MapType1Select PostMask@1 null (heapseg res null)))) (=> (= (ControlFlow 0 601) 600) anon34_correct))))))
(let ((anon30_correct true))
(let ((anon457_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 599) 596)) anon30_correct)))
(let ((anon457_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 597) (- 0 598)) (<= FullPerm (U_2_real (MapType1Select PostMask@1 null (heapseg arg res))))) (=> (<= FullPerm (U_2_real (MapType1Select PostMask@1 null (heapseg arg res)))) (=> (= (ControlFlow 0 597) 596) anon30_correct))))))
(let ((anon27_correct  (=> (and (state PostHeap@0 PostMask@1) (state PostHeap@0 PostMask@1)) (and (and (and (and (and (and (=> (= (ControlFlow 0 634) 633) anon460_Else_correct) (=> (= (ControlFlow 0 634) 605) anon461_Then_correct)) (=> (= (ControlFlow 0 634) 607) anon461_Else_correct)) (=> (= (ControlFlow 0 634) 601) anon459_Then_correct)) (=> (= (ControlFlow 0 634) 603) anon459_Else_correct)) (=> (= (ControlFlow 0 634) 597) anon457_Then_correct)) (=> (= (ControlFlow 0 634) 599) anon457_Else_correct)))))
(let ((anon454_Else_correct  (=> (and (< (segDegree PostHeap@0 arg res (- (segLength PostHeap@0 arg res) 1)) (segDegree PostHeap@0 res null 0)) (= (ControlFlow 0 636) 634)) anon27_correct)))
(let ((anon449_Then_correct  (=> (and (not (= arg res)) (state PostHeap@0 PostMask@1)) (and (and (and (and (and (and (=> (= (ControlFlow 0 652) 636) anon454_Else_correct) (=> (= (ControlFlow 0 652) 649) anon455_Then_correct)) (=> (= (ControlFlow 0 652) 651) anon455_Else_correct)) (=> (= (ControlFlow 0 652) 644) anon453_Then_correct)) (=> (= (ControlFlow 0 652) 646) anon453_Else_correct)) (=> (= (ControlFlow 0 652) 638) anon451_Then_correct)) (=> (= (ControlFlow 0 652) 640) anon451_Else_correct)))))
(let ((anon449_Else_correct  (=> (and (= arg res) (= (ControlFlow 0 635) 634)) anon27_correct)))
(let ((anon447_Else_correct  (=> (and (sorted PostHeap@0 res null) (state PostHeap@0 PostMask@1)) (and (=> (= (ControlFlow 0 653) 652) anon449_Then_correct) (=> (= (ControlFlow 0 653) 635) anon449_Else_correct)))))
(let ((anon12_correct true))
(let ((anon448_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 595) 592)) anon12_correct)))
(let ((anon448_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 593) (- 0 594)) (<= FullPerm (U_2_real (MapType1Select PostMask@1 null (heapseg res null))))) (=> (<= FullPerm (U_2_real (MapType1Select PostMask@1 null (heapseg res null)))) (=> (= (ControlFlow 0 593) 592) anon12_correct))))))
(let ((anon445_Else_correct  (=> (sorted PostHeap@0 arg res) (=> (and (and (state PostHeap@0 PostMask@0) (= PostMask@1 (MapType1Store PostMask@0 null (heapseg res null) (real_2_U (+ (U_2_real (MapType1Select PostMask@0 null (heapseg res null))) FullPerm))))) (and (state PostHeap@0 PostMask@1) (state PostHeap@0 PostMask@1))) (and (and (=> (= (ControlFlow 0 654) 653) anon447_Else_correct) (=> (= (ControlFlow 0 654) 593) anon448_Then_correct)) (=> (= (ControlFlow 0 654) 595) anon448_Else_correct))))))
(let ((anon8_correct true))
(let ((anon446_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 591) 588)) anon8_correct)))
(let ((anon446_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 589) (- 0 590)) (<= FullPerm (U_2_real (MapType1Select PostMask@0 null (heapseg arg res))))) (=> (<= FullPerm (U_2_real (MapType1Select PostMask@0 null (heapseg arg res)))) (=> (= (ControlFlow 0 589) 588) anon8_correct))))))
(let ((anon444_Then_correct  (=> (and (state PostHeap@0 ZeroMask) (not (= res null))) (=> (and (and (state PostHeap@0 ZeroMask) (= PostMask@0 (MapType1Store ZeroMask null (heapseg arg res) (real_2_U (+ (U_2_real (MapType1Select ZeroMask null (heapseg arg res))) FullPerm))))) (and (state PostHeap@0 PostMask@0) (state PostHeap@0 PostMask@0))) (and (and (=> (= (ControlFlow 0 655) 654) anon445_Else_correct) (=> (= (ControlFlow 0 655) 589) anon446_Then_correct)) (=> (= (ControlFlow 0 655) 591) anon446_Else_correct))))))
(let ((anon144_correct  (=> (and (= Mask@93 (MapType1Store Mask@74 null (heapseg res@0 x@0) (real_2_U (- (U_2_real (MapType1Select Mask@74 null (heapseg res@0 x@0))) FullPerm)))) (= (ControlFlow 0 474) (- 0 473))) (< 0 (segLength ExhaleHeap@0 res@0 x@0)))))
(let ((anon516_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 477) 474)) anon144_correct)))
(let ((anon516_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 475) (- 0 476)) (<= FullPerm (U_2_real (MapType1Select Mask@74 null (heapseg res@0 x@0))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@74 null (heapseg res@0 x@0)))) (=> (= (ControlFlow 0 475) 474) anon144_correct))))))
(let ((anon140_correct  (=> (= Mask@94 (MapType1Store Mask@74 null (heapseg arg res@0) (real_2_U (- (U_2_real (MapType1Select Mask@74 null (heapseg arg res@0))) FullPerm)))) (and (=> (= (ControlFlow 0 468) (- 0 469)) (<= 0 (- (segLength ExhaleHeap@0 arg res@0) 1))) (=> (<= 0 (- (segLength ExhaleHeap@0 arg res@0) 1)) (=> (= (ControlFlow 0 468) (- 0 467)) (< (- (segLength ExhaleHeap@0 arg res@0) 1) (segLength ExhaleHeap@0 arg res@0))))))))
(let ((anon514_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 472) 468)) anon140_correct)))
(let ((anon514_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 470) (- 0 471)) (<= FullPerm (U_2_real (MapType1Select Mask@74 null (heapseg arg res@0))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@74 null (heapseg arg res@0)))) (=> (= (ControlFlow 0 470) 468) anon140_correct))))))
(let ((anon136_correct true))
(let ((anon512_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 466) 463)) anon136_correct)))
(let ((anon512_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 464) (- 0 465)) (<= FullPerm (U_2_real (MapType1Select Mask@74 null (heapseg arg res@0))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@74 null (heapseg arg res@0)))) (=> (= (ControlFlow 0 464) 463) anon136_correct))))))
(let ((anon158_correct  (=> (and (= Mask@90 (MapType1Store Mask@74 null (heapseg x@0 null) (real_2_U (- (U_2_real (MapType1Select Mask@74 null (heapseg x@0 null))) FullPerm)))) (= (ControlFlow 0 455) (- 0 454))) (< 0 (segLength ExhaleHeap@0 x@0 null)))))
(let ((anon523_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 458) 455)) anon158_correct)))
(let ((anon523_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 456) (- 0 457)) (<= FullPerm (U_2_real (MapType1Select Mask@74 null (heapseg x@0 null))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@74 null (heapseg x@0 null)))) (=> (= (ControlFlow 0 456) 455) anon158_correct))))))
(let ((anon154_correct  (=> (= Mask@91 (MapType1Store Mask@74 null (heapseg res@0 x@0) (real_2_U (- (U_2_real (MapType1Select Mask@74 null (heapseg res@0 x@0))) FullPerm)))) (and (=> (= (ControlFlow 0 449) (- 0 450)) (<= 0 (- (segLength ExhaleHeap@0 res@0 x@0) 1))) (=> (<= 0 (- (segLength ExhaleHeap@0 res@0 x@0) 1)) (=> (= (ControlFlow 0 449) (- 0 448)) (< (- (segLength ExhaleHeap@0 res@0 x@0) 1) (segLength ExhaleHeap@0 res@0 x@0))))))))
(let ((anon521_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 453) 449)) anon154_correct)))
(let ((anon521_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 451) (- 0 452)) (<= FullPerm (U_2_real (MapType1Select Mask@74 null (heapseg res@0 x@0))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@74 null (heapseg res@0 x@0)))) (=> (= (ControlFlow 0 451) 449) anon154_correct))))))
(let ((anon150_correct true))
(let ((anon519_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 447) 444)) anon150_correct)))
(let ((anon519_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 445) (- 0 446)) (<= FullPerm (U_2_real (MapType1Select Mask@74 null (heapseg res@0 x@0))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@74 null (heapseg res@0 x@0)))) (=> (= (ControlFlow 0 445) 444) anon150_correct))))))
(let ((anon172_correct  (=> (and (= Mask@87 (MapType1Store Mask@74 null (heapseg x@0 null) (real_2_U (- (U_2_real (MapType1Select Mask@74 null (heapseg x@0 null))) FullPerm)))) (= (ControlFlow 0 436) (- 0 435))) (< 0 (segLength ExhaleHeap@0 x@0 null)))))
(let ((anon530_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 439) 436)) anon172_correct)))
(let ((anon530_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 437) (- 0 438)) (<= FullPerm (U_2_real (MapType1Select Mask@74 null (heapseg x@0 null))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@74 null (heapseg x@0 null)))) (=> (= (ControlFlow 0 437) 436) anon172_correct))))))
(let ((anon168_correct  (=> (= Mask@88 (MapType1Store Mask@74 null (heapseg arg res@0) (real_2_U (- (U_2_real (MapType1Select Mask@74 null (heapseg arg res@0))) FullPerm)))) (and (=> (= (ControlFlow 0 430) (- 0 431)) (<= 0 (- (segLength ExhaleHeap@0 arg res@0) 1))) (=> (<= 0 (- (segLength ExhaleHeap@0 arg res@0) 1)) (=> (= (ControlFlow 0 430) (- 0 429)) (< (- (segLength ExhaleHeap@0 arg res@0) 1) (segLength ExhaleHeap@0 arg res@0))))))))
(let ((anon528_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 434) 430)) anon168_correct)))
(let ((anon528_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 432) (- 0 433)) (<= FullPerm (U_2_real (MapType1Select Mask@74 null (heapseg arg res@0))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@74 null (heapseg arg res@0)))) (=> (= (ControlFlow 0 432) 430) anon168_correct))))))
(let ((anon164_correct true))
(let ((anon526_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 428) 425)) anon164_correct)))
(let ((anon526_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 426) (- 0 427)) (<= FullPerm (U_2_real (MapType1Select Mask@74 null (heapseg arg res@0))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@74 null (heapseg arg res@0)))) (=> (= (ControlFlow 0 426) 425) anon164_correct))))))
(let ((anon198_correct  (=> (and (= Mask@82 (MapType1Store Mask@74 null (heapseg res@0 x@0) (real_2_U (- (U_2_real (MapType1Select Mask@74 null (heapseg res@0 x@0))) FullPerm)))) (= (ControlFlow 0 416) (- 0 415))) (not (= res@0 x@0)))))
(let ((anon543_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 419) 416)) anon198_correct)))
(let ((anon543_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 417) (- 0 418)) (<= FullPerm (U_2_real (MapType1Select Mask@74 null (heapseg res@0 x@0))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@74 null (heapseg res@0 x@0)))) (=> (= (ControlFlow 0 417) 416) anon198_correct))))))
(let ((anon194_correct  (=> (and (= Mask@83 (MapType1Store Mask@74 null (heapseg arg res@0) (real_2_U (- (U_2_real (MapType1Select Mask@74 null (heapseg arg res@0))) FullPerm)))) (= (ControlFlow 0 411) (- 0 410))) (not (= arg res@0)))))
(let ((anon541_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 414) 411)) anon194_correct)))
(let ((anon541_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 412) (- 0 413)) (<= FullPerm (U_2_real (MapType1Select Mask@74 null (heapseg arg res@0))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@74 null (heapseg arg res@0)))) (=> (= (ControlFlow 0 412) 411) anon194_correct))))))
(let ((anon208_correct  (=> (and (= Mask@80 (MapType1Store Mask@74 null (heapseg x@0 null) (real_2_U (- (U_2_real (MapType1Select Mask@74 null (heapseg x@0 null))) FullPerm)))) (= (ControlFlow 0 402) (- 0 401))) (not (= x@0 null)))))
(let ((anon548_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 405) 402)) anon208_correct)))
(let ((anon548_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 403) (- 0 404)) (<= FullPerm (U_2_real (MapType1Select Mask@74 null (heapseg x@0 null))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@74 null (heapseg x@0 null)))) (=> (= (ControlFlow 0 403) 402) anon208_correct))))))
(let ((anon204_correct  (=> (and (= Mask@81 (MapType1Store Mask@74 null (heapseg res@0 x@0) (real_2_U (- (U_2_real (MapType1Select Mask@74 null (heapseg res@0 x@0))) FullPerm)))) (= (ControlFlow 0 397) (- 0 396))) (not (= res@0 x@0)))))
(let ((anon546_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 400) 397)) anon204_correct)))
(let ((anon546_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 398) (- 0 399)) (<= FullPerm (U_2_real (MapType1Select Mask@74 null (heapseg res@0 x@0))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@74 null (heapseg res@0 x@0)))) (=> (= (ControlFlow 0 398) 397) anon204_correct))))))
(let ((anon218_correct  (=> (and (= Mask@78 (MapType1Store Mask@74 null (heapseg x@0 null) (real_2_U (- (U_2_real (MapType1Select Mask@74 null (heapseg x@0 null))) FullPerm)))) (= (ControlFlow 0 388) (- 0 387))) (not (= x@0 null)))))
(let ((anon553_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 391) 388)) anon218_correct)))
(let ((anon553_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 389) (- 0 390)) (<= FullPerm (U_2_real (MapType1Select Mask@74 null (heapseg x@0 null))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@74 null (heapseg x@0 null)))) (=> (= (ControlFlow 0 389) 388) anon218_correct))))))
(let ((anon214_correct  (=> (and (= Mask@79 (MapType1Store Mask@74 null (heapseg arg res@0) (real_2_U (- (U_2_real (MapType1Select Mask@74 null (heapseg arg res@0))) FullPerm)))) (= (ControlFlow 0 383) (- 0 382))) (not (= arg res@0)))))
(let ((anon551_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 386) 383)) anon214_correct)))
(let ((anon551_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 384) (- 0 385)) (<= FullPerm (U_2_real (MapType1Select Mask@74 null (heapseg arg res@0))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@74 null (heapseg arg res@0)))) (=> (= (ControlFlow 0 384) 383) anon214_correct))))))
(let ((anon228_correct  (=> (= (ControlFlow 0 374) (- 0 373)) (not (= arg null)))))
(let ((anon558_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 377) 374)) anon228_correct)))
(let ((anon558_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 375) (- 0 376)) (<= FullPerm (U_2_real (MapType1Select Mask@0 null (heapseg arg null))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@0 null (heapseg arg null)))) (=> (= (ControlFlow 0 375) 374) anon228_correct))))))
(let ((anon224_correct  (=> (and (= Mask@77 (MapType1Store Mask@74 null (heapseg arg res@0) (real_2_U (- (U_2_real (MapType1Select Mask@74 null (heapseg arg res@0))) FullPerm)))) (= (ControlFlow 0 369) (- 0 368))) (not (= arg res@0)))))
(let ((anon556_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 372) 369)) anon224_correct)))
(let ((anon556_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 370) (- 0 371)) (<= FullPerm (U_2_real (MapType1Select Mask@74 null (heapseg arg res@0))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@74 null (heapseg arg res@0)))) (=> (= (ControlFlow 0 370) 369) anon224_correct))))))
(let ((anon238_correct  (=> (= (ControlFlow 0 360) (- 0 359)) (not (= arg null)))))
(let ((anon563_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 363) 360)) anon238_correct)))
(let ((anon563_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 361) (- 0 362)) (<= FullPerm (U_2_real (MapType1Select Mask@0 null (heapseg arg null))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@0 null (heapseg arg null)))) (=> (= (ControlFlow 0 361) 360) anon238_correct))))))
(let ((anon234_correct  (=> (and (= Mask@76 (MapType1Store Mask@74 null (heapseg res@0 x@0) (real_2_U (- (U_2_real (MapType1Select Mask@74 null (heapseg res@0 x@0))) FullPerm)))) (= (ControlFlow 0 355) (- 0 354))) (not (= res@0 x@0)))))
(let ((anon561_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 358) 355)) anon234_correct)))
(let ((anon561_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 356) (- 0 357)) (<= FullPerm (U_2_real (MapType1Select Mask@74 null (heapseg res@0 x@0))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@74 null (heapseg res@0 x@0)))) (=> (= (ControlFlow 0 356) 355) anon234_correct))))))
(let ((anon248_correct  (=> (= (ControlFlow 0 346) (- 0 345)) (not (= arg null)))))
(let ((anon568_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 349) 346)) anon248_correct)))
(let ((anon568_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 347) (- 0 348)) (<= FullPerm (U_2_real (MapType1Select Mask@0 null (heapseg arg null))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@0 null (heapseg arg null)))) (=> (= (ControlFlow 0 347) 346) anon248_correct))))))
(let ((anon244_correct  (=> (and (= Mask@75 (MapType1Store Mask@74 null (heapseg x@0 null) (real_2_U (- (U_2_real (MapType1Select Mask@74 null (heapseg x@0 null))) FullPerm)))) (= (ControlFlow 0 341) (- 0 340))) (not (= x@0 null)))))
(let ((anon566_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 344) 341)) anon244_correct)))
(let ((anon566_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 342) (- 0 343)) (<= FullPerm (U_2_real (MapType1Select Mask@74 null (heapseg x@0 null))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@74 null (heapseg x@0 null)))) (=> (= (ControlFlow 0 342) 341) anon244_correct))))))
(let ((anon250_correct true))
(let ((anon567_Else_correct  (=> (and (= (segParent ExhaleHeap@0 x@0 null) (segParent Heap@@61 arg null)) (= (ControlFlow 0 339) 337)) anon250_correct)))
(let ((anon564_Then_correct  (=> (and (not (= x@0 null)) (state ExhaleHeap@0 Mask@74)) (and (and (and (and (=> (= (ControlFlow 0 350) 339) anon567_Else_correct) (=> (= (ControlFlow 0 350) 347) anon568_Then_correct)) (=> (= (ControlFlow 0 350) 349) anon568_Else_correct)) (=> (= (ControlFlow 0 350) 342) anon566_Then_correct)) (=> (= (ControlFlow 0 350) 344) anon566_Else_correct)))))
(let ((anon564_Else_correct  (=> (and (= x@0 null) (= (ControlFlow 0 338) 337)) anon250_correct)))
(let ((anon240_correct  (=> (state ExhaleHeap@0 Mask@74) (and (=> (= (ControlFlow 0 351) 350) anon564_Then_correct) (=> (= (ControlFlow 0 351) 338) anon564_Else_correct)))))
(let ((anon562_Else_correct  (=> (and (= (segParent ExhaleHeap@0 res@0 x@0) (segParent Heap@@61 arg null)) (= (ControlFlow 0 353) 351)) anon240_correct)))
(let ((anon559_Then_correct  (=> (and (not (= res@0 x@0)) (state ExhaleHeap@0 Mask@74)) (and (and (and (and (=> (= (ControlFlow 0 364) 353) anon562_Else_correct) (=> (= (ControlFlow 0 364) 361) anon563_Then_correct)) (=> (= (ControlFlow 0 364) 363) anon563_Else_correct)) (=> (= (ControlFlow 0 364) 356) anon561_Then_correct)) (=> (= (ControlFlow 0 364) 358) anon561_Else_correct)))))
(let ((anon559_Else_correct  (=> (and (= res@0 x@0) (= (ControlFlow 0 352) 351)) anon240_correct)))
(let ((anon230_correct  (=> (state ExhaleHeap@0 Mask@74) (and (=> (= (ControlFlow 0 365) 364) anon559_Then_correct) (=> (= (ControlFlow 0 365) 352) anon559_Else_correct)))))
(let ((anon557_Else_correct  (=> (and (= (segParent ExhaleHeap@0 arg res@0) (segParent Heap@@61 arg null)) (= (ControlFlow 0 367) 365)) anon230_correct)))
(let ((anon554_Then_correct  (=> (and (not (= arg res@0)) (state ExhaleHeap@0 Mask@74)) (and (and (and (and (=> (= (ControlFlow 0 378) 367) anon557_Else_correct) (=> (= (ControlFlow 0 378) 375) anon558_Then_correct)) (=> (= (ControlFlow 0 378) 377) anon558_Else_correct)) (=> (= (ControlFlow 0 378) 370) anon556_Then_correct)) (=> (= (ControlFlow 0 378) 372) anon556_Else_correct)))))
(let ((anon554_Else_correct  (=> (and (= arg res@0) (= (ControlFlow 0 366) 365)) anon230_correct)))
(let ((anon220_correct  (=> (state ExhaleHeap@0 Mask@74) (and (=> (= (ControlFlow 0 379) 378) anon554_Then_correct) (=> (= (ControlFlow 0 379) 366) anon554_Else_correct)))))
(let ((anon552_Else_correct  (=> (and (= (segParent ExhaleHeap@0 arg res@0) (segParent ExhaleHeap@0 x@0 null)) (= (ControlFlow 0 381) 379)) anon220_correct)))
(let ((anon549_Then_correct  (=> (and (and (not (= arg res@0)) (not (= x@0 null))) (state ExhaleHeap@0 Mask@74)) (and (and (and (and (=> (= (ControlFlow 0 392) 381) anon552_Else_correct) (=> (= (ControlFlow 0 392) 389) anon553_Then_correct)) (=> (= (ControlFlow 0 392) 391) anon553_Else_correct)) (=> (= (ControlFlow 0 392) 384) anon551_Then_correct)) (=> (= (ControlFlow 0 392) 386) anon551_Else_correct)))))
(let ((anon549_Else_correct  (=> (and (not (and (not (= arg res@0)) (not (= x@0 null)))) (= (ControlFlow 0 380) 379)) anon220_correct)))
(let ((anon210_correct  (=> (state ExhaleHeap@0 Mask@74) (and (=> (= (ControlFlow 0 393) 392) anon549_Then_correct) (=> (= (ControlFlow 0 393) 380) anon549_Else_correct)))))
(let ((anon547_Else_correct  (=> (and (= (segParent ExhaleHeap@0 res@0 x@0) (segParent ExhaleHeap@0 x@0 null)) (= (ControlFlow 0 395) 393)) anon210_correct)))
(let ((anon544_Then_correct  (=> (and (and (not (= res@0 x@0)) (not (= x@0 null))) (state ExhaleHeap@0 Mask@74)) (and (and (and (and (=> (= (ControlFlow 0 406) 395) anon547_Else_correct) (=> (= (ControlFlow 0 406) 403) anon548_Then_correct)) (=> (= (ControlFlow 0 406) 405) anon548_Else_correct)) (=> (= (ControlFlow 0 406) 398) anon546_Then_correct)) (=> (= (ControlFlow 0 406) 400) anon546_Else_correct)))))
(let ((anon544_Else_correct  (=> (and (not (and (not (= res@0 x@0)) (not (= x@0 null)))) (= (ControlFlow 0 394) 393)) anon210_correct)))
(let ((anon200_correct  (=> (state ExhaleHeap@0 Mask@74) (and (=> (= (ControlFlow 0 407) 406) anon544_Then_correct) (=> (= (ControlFlow 0 407) 394) anon544_Else_correct)))))
(let ((anon542_Else_correct  (=> (and (= (segParent ExhaleHeap@0 arg res@0) (segParent ExhaleHeap@0 res@0 x@0)) (= (ControlFlow 0 409) 407)) anon200_correct)))
(let ((anon539_Then_correct  (=> (and (and (not (= arg res@0)) (not (= res@0 x@0))) (state ExhaleHeap@0 Mask@74)) (and (and (and (and (=> (= (ControlFlow 0 420) 409) anon542_Else_correct) (=> (= (ControlFlow 0 420) 417) anon543_Then_correct)) (=> (= (ControlFlow 0 420) 419) anon543_Else_correct)) (=> (= (ControlFlow 0 420) 412) anon541_Then_correct)) (=> (= (ControlFlow 0 420) 414) anon541_Else_correct)))))
(let ((anon539_Else_correct  (=> (and (not (and (not (= arg res@0)) (not (= res@0 x@0)))) (= (ControlFlow 0 408) 407)) anon200_correct)))
(let ((anon537_Else_correct  (=> (and (= (+ (+ (segSize ExhaleHeap@0 arg res@0) (segSize ExhaleHeap@0 res@0 x@0)) (segSize ExhaleHeap@0 x@0 null)) (segSize Heap@@61 arg null)) (state ExhaleHeap@0 Mask@74)) (and (=> (= (ControlFlow 0 421) 420) anon539_Then_correct) (=> (= (ControlFlow 0 421) 408) anon539_Else_correct)))))
(let ((anon189_correct true))
(let ((anon538_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 336) 333)) anon189_correct)))
(let ((anon538_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 334) (- 0 335)) (<= FullPerm (U_2_real (MapType1Select Mask@0 null (heapseg arg null))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@0 null (heapseg arg null)))) (=> (= (ControlFlow 0 334) 333) anon189_correct))))))
(let ((anon185_correct true))
(let ((anon536_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 332) 329)) anon185_correct)))
(let ((anon536_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 330) (- 0 331)) (<= FullPerm (U_2_real (MapType1Select Mask@74 null (heapseg x@0 null))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@74 null (heapseg x@0 null)))) (=> (= (ControlFlow 0 330) 329) anon185_correct))))))
(let ((anon181_correct true))
(let ((anon534_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 328) 325)) anon181_correct)))
(let ((anon534_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 326) (- 0 327)) (<= FullPerm (U_2_real (MapType1Select Mask@74 null (heapseg res@0 x@0))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@74 null (heapseg res@0 x@0)))) (=> (= (ControlFlow 0 326) 325) anon181_correct))))))
(let ((anon177_correct true))
(let ((anon532_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 324) 321)) anon177_correct)))
(let ((anon532_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 322) (- 0 323)) (<= FullPerm (U_2_real (MapType1Select Mask@74 null (heapseg arg res@0))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@74 null (heapseg arg res@0)))) (=> (= (ControlFlow 0 322) 321) anon177_correct))))))
(let ((anon174_correct  (=> (and (and (state ExhaleHeap@0 Mask@74) (not (= res@0 null))) (and (state ExhaleHeap@0 Mask@74) (state ExhaleHeap@0 Mask@74))) (and (and (and (and (and (and (and (and (=> (= (ControlFlow 0 422) 421) anon537_Else_correct) (=> (= (ControlFlow 0 422) 334) anon538_Then_correct)) (=> (= (ControlFlow 0 422) 336) anon538_Else_correct)) (=> (= (ControlFlow 0 422) 330) anon536_Then_correct)) (=> (= (ControlFlow 0 422) 332) anon536_Else_correct)) (=> (= (ControlFlow 0 422) 326) anon534_Then_correct)) (=> (= (ControlFlow 0 422) 328) anon534_Else_correct)) (=> (= (ControlFlow 0 422) 322) anon532_Then_correct)) (=> (= (ControlFlow 0 422) 324) anon532_Else_correct)))))
(let ((anon529_Else_correct  (=> (and (< (segDegree ExhaleHeap@0 arg res@0 (- (segLength ExhaleHeap@0 arg res@0) 1)) (segDegree ExhaleHeap@0 x@0 null 0)) (= (ControlFlow 0 424) 422)) anon174_correct)))
(let ((anon524_Then_correct  (=> (and (and (not (= arg res@0)) (and (= res@0 x@0) (not (= x@0 null)))) (state ExhaleHeap@0 Mask@74)) (and (and (and (and (and (and (=> (= (ControlFlow 0 440) 424) anon529_Else_correct) (=> (= (ControlFlow 0 440) 437) anon530_Then_correct)) (=> (= (ControlFlow 0 440) 439) anon530_Else_correct)) (=> (= (ControlFlow 0 440) 432) anon528_Then_correct)) (=> (= (ControlFlow 0 440) 434) anon528_Else_correct)) (=> (= (ControlFlow 0 440) 426) anon526_Then_correct)) (=> (= (ControlFlow 0 440) 428) anon526_Else_correct)))))
(let ((anon524_Else_correct  (=> (and (not (and (not (= arg res@0)) (and (= res@0 x@0) (not (= x@0 null))))) (= (ControlFlow 0 423) 422)) anon174_correct)))
(let ((anon160_correct  (=> (state ExhaleHeap@0 Mask@74) (and (=> (= (ControlFlow 0 441) 440) anon524_Then_correct) (=> (= (ControlFlow 0 441) 423) anon524_Else_correct)))))
(let ((anon522_Else_correct  (=> (and (< (segDegree ExhaleHeap@0 res@0 x@0 (- (segLength ExhaleHeap@0 res@0 x@0) 1)) (segDegree ExhaleHeap@0 x@0 null 0)) (= (ControlFlow 0 443) 441)) anon160_correct)))
(let ((anon517_Then_correct  (=> (and (and (not (= x@0 null)) (not (= res@0 x@0))) (state ExhaleHeap@0 Mask@74)) (and (and (and (and (and (and (=> (= (ControlFlow 0 459) 443) anon522_Else_correct) (=> (= (ControlFlow 0 459) 456) anon523_Then_correct)) (=> (= (ControlFlow 0 459) 458) anon523_Else_correct)) (=> (= (ControlFlow 0 459) 451) anon521_Then_correct)) (=> (= (ControlFlow 0 459) 453) anon521_Else_correct)) (=> (= (ControlFlow 0 459) 445) anon519_Then_correct)) (=> (= (ControlFlow 0 459) 447) anon519_Else_correct)))))
(let ((anon517_Else_correct  (=> (and (not (and (not (= x@0 null)) (not (= res@0 x@0)))) (= (ControlFlow 0 442) 441)) anon160_correct)))
(let ((anon146_correct  (=> (state ExhaleHeap@0 Mask@74) (and (=> (= (ControlFlow 0 460) 459) anon517_Then_correct) (=> (= (ControlFlow 0 460) 442) anon517_Else_correct)))))
(let ((anon515_Else_correct  (=> (and (< (segDegree ExhaleHeap@0 arg res@0 (- (segLength ExhaleHeap@0 arg res@0) 1)) (segDegree ExhaleHeap@0 res@0 x@0 0)) (= (ControlFlow 0 462) 460)) anon146_correct)))
(let ((anon510_Then_correct  (=> (and (and (not (= arg res@0)) (not (= res@0 x@0))) (state ExhaleHeap@0 Mask@74)) (and (and (and (and (and (and (=> (= (ControlFlow 0 478) 462) anon515_Else_correct) (=> (= (ControlFlow 0 478) 475) anon516_Then_correct)) (=> (= (ControlFlow 0 478) 477) anon516_Else_correct)) (=> (= (ControlFlow 0 478) 470) anon514_Then_correct)) (=> (= (ControlFlow 0 478) 472) anon514_Else_correct)) (=> (= (ControlFlow 0 478) 464) anon512_Then_correct)) (=> (= (ControlFlow 0 478) 466) anon512_Else_correct)))))
(let ((anon510_Else_correct  (=> (and (not (and (not (= arg res@0)) (not (= res@0 x@0)))) (= (ControlFlow 0 461) 460)) anon146_correct)))
(let ((anon508_Else_correct  (=> (and (sorted ExhaleHeap@0 x@0 null) (state ExhaleHeap@0 Mask@74)) (and (=> (= (ControlFlow 0 479) 478) anon510_Then_correct) (=> (= (ControlFlow 0 479) 461) anon510_Else_correct)))))
(let ((anon131_correct true))
(let ((anon509_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 320) 317)) anon131_correct)))
(let ((anon509_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 318) (- 0 319)) (<= FullPerm (U_2_real (MapType1Select Mask@74 null (heapseg x@0 null))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@74 null (heapseg x@0 null)))) (=> (= (ControlFlow 0 318) 317) anon131_correct))))))
(let ((anon506_Else_correct  (=> (sorted ExhaleHeap@0 res@0 x@0) (=> (and (and (state ExhaleHeap@0 Mask@73) (= Mask@74 (MapType1Store Mask@73 null (heapseg x@0 null) (real_2_U (+ (U_2_real (MapType1Select Mask@73 null (heapseg x@0 null))) FullPerm))))) (and (state ExhaleHeap@0 Mask@74) (state ExhaleHeap@0 Mask@74))) (and (and (=> (= (ControlFlow 0 480) 479) anon508_Else_correct) (=> (= (ControlFlow 0 480) 318) anon509_Then_correct)) (=> (= (ControlFlow 0 480) 320) anon509_Else_correct))))))
(let ((anon127_correct true))
(let ((anon507_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 316) 313)) anon127_correct)))
(let ((anon507_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 314) (- 0 315)) (<= FullPerm (U_2_real (MapType1Select Mask@73 null (heapseg res@0 x@0))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@73 null (heapseg res@0 x@0)))) (=> (= (ControlFlow 0 314) 313) anon127_correct))))))
(let ((anon504_Else_correct  (=> (sorted ExhaleHeap@0 arg res@0) (=> (and (and (state ExhaleHeap@0 Mask@14) (= Mask@73 (MapType1Store Mask@14 null (heapseg res@0 x@0) (real_2_U (+ (U_2_real (MapType1Select Mask@14 null (heapseg res@0 x@0))) FullPerm))))) (and (state ExhaleHeap@0 Mask@73) (state ExhaleHeap@0 Mask@73))) (and (and (=> (= (ControlFlow 0 481) 480) anon506_Else_correct) (=> (= (ControlFlow 0 481) 314) anon507_Then_correct)) (=> (= (ControlFlow 0 481) 316) anon507_Else_correct))))))
(let ((anon123_correct true))
(let ((anon505_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 312) 309)) anon123_correct)))
(let ((anon505_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 310) (- 0 311)) (<= FullPerm (U_2_real (MapType1Select Mask@14 null (heapseg arg res@0))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@14 null (heapseg arg res@0)))) (=> (= (ControlFlow 0 310) 309) anon123_correct))))))
(let ((anon503_Then_correct  (=> (= Mask@14 (MapType1Store Mask@13 null (heapseg arg res@0) (real_2_U (+ (U_2_real (MapType1Select Mask@13 null (heapseg arg res@0))) FullPerm)))) (=> (and (state ExhaleHeap@0 Mask@14) (state ExhaleHeap@0 Mask@14)) (and (and (=> (= (ControlFlow 0 482) 481) anon504_Else_correct) (=> (= (ControlFlow 0 482) 310) anon505_Then_correct)) (=> (= (ControlFlow 0 482) 312) anon505_Else_correct))))))
(let ((anon307_correct true))
(let ((anon598_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 219) 216)) anon307_correct)))
(let ((anon598_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 217) (- 0 218)) (<= FullPerm (U_2_real (MapType1Select Mask@34 null (tree x@0))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@34 null (tree x@0)))) (=> (= (ControlFlow 0 217) 216) anon307_correct))))))
(let ((anon414_correct true))
(let ((anon653_Else_correct  (=> (and (= x@1 null) (= (ControlFlow 0 58) 55)) anon414_correct)))
(let ((anon653_Then_correct  (=> (not (= x@1 null)) (and (=> (= (ControlFlow 0 56) (- 0 57)) (= (segParent Heap@50 x@1 null) (segParent Heap@@61 arg null))) (=> (= (segParent Heap@50 x@1 null) (segParent Heap@@61 arg null)) (=> (= (ControlFlow 0 56) 55) anon414_correct))))))
(let ((anon652_Else_correct  (=> (= res@1 x@1) (and (=> (= (ControlFlow 0 61) 56) anon653_Then_correct) (=> (= (ControlFlow 0 61) 58) anon653_Else_correct)))))
(let ((anon652_Then_correct  (=> (not (= res@1 x@1)) (and (=> (= (ControlFlow 0 59) (- 0 60)) (= (segParent Heap@50 res@1 x@1) (segParent Heap@@61 arg null))) (=> (= (segParent Heap@50 res@1 x@1) (segParent Heap@@61 arg null)) (and (=> (= (ControlFlow 0 59) 56) anon653_Then_correct) (=> (= (ControlFlow 0 59) 58) anon653_Else_correct)))))))
(let ((anon651_Else_correct  (=> (= arg res@1) (and (=> (= (ControlFlow 0 64) 59) anon652_Then_correct) (=> (= (ControlFlow 0 64) 61) anon652_Else_correct)))))
(let ((anon651_Then_correct  (=> (not (= arg res@1)) (and (=> (= (ControlFlow 0 62) (- 0 63)) (= (segParent Heap@50 arg res@1) (segParent Heap@@61 arg null))) (=> (= (segParent Heap@50 arg res@1) (segParent Heap@@61 arg null)) (and (=> (= (ControlFlow 0 62) 59) anon652_Then_correct) (=> (= (ControlFlow 0 62) 61) anon652_Else_correct)))))))
(let ((anon650_Else_correct  (=> (not (and (not (= arg res@1)) (not (= x@1 null)))) (and (=> (= (ControlFlow 0 67) 62) anon651_Then_correct) (=> (= (ControlFlow 0 67) 64) anon651_Else_correct)))))
(let ((anon650_Then_correct  (=> (and (not (= arg res@1)) (not (= x@1 null))) (and (=> (= (ControlFlow 0 65) (- 0 66)) (= (segParent Heap@50 arg res@1) (segParent Heap@50 x@1 null))) (=> (= (segParent Heap@50 arg res@1) (segParent Heap@50 x@1 null)) (and (=> (= (ControlFlow 0 65) 62) anon651_Then_correct) (=> (= (ControlFlow 0 65) 64) anon651_Else_correct)))))))
(let ((anon649_Else_correct  (=> (not (and (not (= res@1 x@1)) (not (= x@1 null)))) (and (=> (= (ControlFlow 0 70) 65) anon650_Then_correct) (=> (= (ControlFlow 0 70) 67) anon650_Else_correct)))))
(let ((anon649_Then_correct  (=> (and (not (= res@1 x@1)) (not (= x@1 null))) (and (=> (= (ControlFlow 0 68) (- 0 69)) (= (segParent Heap@50 res@1 x@1) (segParent Heap@50 x@1 null))) (=> (= (segParent Heap@50 res@1 x@1) (segParent Heap@50 x@1 null)) (and (=> (= (ControlFlow 0 68) 65) anon650_Then_correct) (=> (= (ControlFlow 0 68) 67) anon650_Else_correct)))))))
(let ((anon648_Else_correct  (=> (not (and (not (= arg res@1)) (not (= res@1 x@1)))) (and (=> (= (ControlFlow 0 73) 68) anon649_Then_correct) (=> (= (ControlFlow 0 73) 70) anon649_Else_correct)))))
(let ((anon648_Then_correct  (=> (and (not (= arg res@1)) (not (= res@1 x@1))) (and (=> (= (ControlFlow 0 71) (- 0 72)) (= (segParent Heap@50 arg res@1) (segParent Heap@50 res@1 x@1))) (=> (= (segParent Heap@50 arg res@1) (segParent Heap@50 res@1 x@1)) (and (=> (= (ControlFlow 0 71) 68) anon649_Then_correct) (=> (= (ControlFlow 0 71) 70) anon649_Else_correct)))))))
(let ((anon402_correct  (and (=> (= (ControlFlow 0 74) (- 0 76)) (not (= res@1 null))) (=> (not (= res@1 null)) (and (=> (= (ControlFlow 0 74) (- 0 75)) (= (+ (+ (segSize Heap@50 arg res@1) (segSize Heap@50 res@1 x@1)) (segSize Heap@50 x@1 null)) (segSize Heap@@61 arg null))) (=> (= (+ (+ (segSize Heap@50 arg res@1) (segSize Heap@50 res@1 x@1)) (segSize Heap@50 x@1 null)) (segSize Heap@@61 arg null)) (and (=> (= (ControlFlow 0 74) 71) anon648_Then_correct) (=> (= (ControlFlow 0 74) 73) anon648_Else_correct))))))))
(let ((anon647_Else_correct  (=> (and (not (and (not (= arg res@1)) (and (= res@1 x@1) (not (= x@1 null))))) (= (ControlFlow 0 79) 74)) anon402_correct)))
(let ((anon647_Then_correct  (=> (and (not (= arg res@1)) (and (= res@1 x@1) (not (= x@1 null)))) (and (=> (= (ControlFlow 0 77) (- 0 78)) (< (segDegree Heap@50 arg res@1 (- (segLength Heap@50 arg res@1) 1)) (segDegree Heap@50 x@1 null 0))) (=> (< (segDegree Heap@50 arg res@1 (- (segLength Heap@50 arg res@1) 1)) (segDegree Heap@50 x@1 null 0)) (=> (= (ControlFlow 0 77) 74) anon402_correct))))))
(let ((anon646_Else_correct  (=> (not (and (not (= x@1 null)) (not (= res@1 x@1)))) (and (=> (= (ControlFlow 0 82) 77) anon647_Then_correct) (=> (= (ControlFlow 0 82) 79) anon647_Else_correct)))))
(let ((anon646_Then_correct  (=> (and (not (= x@1 null)) (not (= res@1 x@1))) (and (=> (= (ControlFlow 0 80) (- 0 81)) (< (segDegree Heap@50 res@1 x@1 (- (segLength Heap@50 res@1 x@1) 1)) (segDegree Heap@50 x@1 null 0))) (=> (< (segDegree Heap@50 res@1 x@1 (- (segLength Heap@50 res@1 x@1) 1)) (segDegree Heap@50 x@1 null 0)) (and (=> (= (ControlFlow 0 80) 77) anon647_Then_correct) (=> (= (ControlFlow 0 80) 79) anon647_Else_correct)))))))
(let ((anon645_Else_correct  (=> (not (and (not (= arg res@1)) (not (= res@1 x@1)))) (and (=> (= (ControlFlow 0 85) 80) anon646_Then_correct) (=> (= (ControlFlow 0 85) 82) anon646_Else_correct)))))
(let ((anon645_Then_correct  (=> (and (not (= arg res@1)) (not (= res@1 x@1))) (and (=> (= (ControlFlow 0 83) (- 0 84)) (< (segDegree Heap@50 arg res@1 (- (segLength Heap@50 arg res@1) 1)) (segDegree Heap@50 res@1 x@1 0))) (=> (< (segDegree Heap@50 arg res@1 (- (segLength Heap@50 arg res@1) 1)) (segDegree Heap@50 res@1 x@1 0)) (and (=> (= (ControlFlow 0 83) 80) anon646_Then_correct) (=> (= (ControlFlow 0 83) 82) anon646_Else_correct)))))))
(let ((anon396_correct  (=> (= Mask@70 (MapType1Store Mask@69 null (heapseg x@1 null) (real_2_U (- (U_2_real (MapType1Select Mask@69 null (heapseg x@1 null))) FullPerm)))) (and (=> (= (ControlFlow 0 86) (- 0 87)) (sorted Heap@50 x@1 null)) (=> (sorted Heap@50 x@1 null) (and (=> (= (ControlFlow 0 86) 83) anon645_Then_correct) (=> (= (ControlFlow 0 86) 85) anon645_Else_correct)))))))
(let ((anon644_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 90) 86)) anon396_correct)))
(let ((anon644_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 88) (- 0 89)) (<= FullPerm (U_2_real (MapType1Select Mask@69 null (heapseg x@1 null))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@69 null (heapseg x@1 null)))) (=> (= (ControlFlow 0 88) 86) anon396_correct))))))
(let ((anon394_correct  (=> (= Mask@69 (MapType1Store Mask@68 null (heapseg res@1 x@1) (real_2_U (- (U_2_real (MapType1Select Mask@68 null (heapseg res@1 x@1))) FullPerm)))) (and (=> (= (ControlFlow 0 91) (- 0 92)) (sorted Heap@50 res@1 x@1)) (=> (sorted Heap@50 res@1 x@1) (and (=> (= (ControlFlow 0 91) 88) anon644_Then_correct) (=> (= (ControlFlow 0 91) 90) anon644_Else_correct)))))))
(let ((anon643_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 95) 91)) anon394_correct)))
(let ((anon643_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 93) (- 0 94)) (<= FullPerm (U_2_real (MapType1Select Mask@68 null (heapseg res@1 x@1))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@68 null (heapseg res@1 x@1)))) (=> (= (ControlFlow 0 93) 91) anon394_correct))))))
(let ((anon392_correct  (=> (= Mask@68 (MapType1Store Mask@67 null (heapseg arg res@1) (real_2_U (- (U_2_real (MapType1Select Mask@67 null (heapseg arg res@1))) FullPerm)))) (and (=> (= (ControlFlow 0 96) (- 0 97)) (sorted Heap@50 arg res@1)) (=> (sorted Heap@50 arg res@1) (and (=> (= (ControlFlow 0 96) 93) anon643_Then_correct) (=> (= (ControlFlow 0 96) 95) anon643_Else_correct)))))))
(let ((anon642_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 100) 96)) anon392_correct)))
(let ((anon642_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 98) (- 0 99)) (<= FullPerm (U_2_real (MapType1Select Mask@67 null (heapseg arg res@1))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@67 null (heapseg arg res@1)))) (=> (= (ControlFlow 0 98) 96) anon392_correct))))))
(let ((anon390_correct  (=> (and (state Heap@50 Mask@67) (state Heap@50 Mask@67)) (and (=> (= (ControlFlow 0 101) 98) anon642_Then_correct) (=> (= (ControlFlow 0 101) 100) anon642_Else_correct)))))
(let ((anon641_Else_correct  (=> (= x@1 null) (=> (and (= Heap@50 Heap@46) (= (ControlFlow 0 103) 101)) anon390_correct))))
(let ((anon641_Then_correct  (=> (and (and (and (not (= x@1 null)) (forall ((o_46 T@U) (f_50 T@U) ) (! (let ((B@@11 (FieldTypeInv1 (type f_50))))
(let ((A@@12 (FieldTypeInv0 (type f_50))))
 (=> (and (and (= (type o_46) RefType) (= (type f_50) (FieldType A@@12 B@@11))) (or (U_2_bool (MapType1Select (MapType0Select Heap@46 null (|heapseg#sm| x@1 null)) o_46 f_50)) (U_2_bool (MapType1Select (MapType0Select Heap@46 null (|tree#sm| x@1)) o_46 f_50)))) (U_2_bool (MapType1Select newPMask@12 o_46 f_50)))))
 :qid |stdinbpl.6745:37|
 :skolemid |142|
 :pattern ( (MapType1Select newPMask@12 o_46 f_50))
))) (and (= Heap@47 (MapType0Store Heap@46 null (|heapseg#sm| x@1 null) newPMask@12)) (= Heap@48 (MapType0Store Heap@47 null (|heapseg#sm| x@1 null) (MapType1Store (MapType0Select Heap@47 null (|heapseg#sm| x@1 null)) x@1 sibling (bool_2_U true)))))) (and (and (forall ((o_47 T@U) (f_51 T@U) ) (! (let ((B@@12 (FieldTypeInv1 (type f_51))))
(let ((A@@13 (FieldTypeInv0 (type f_51))))
 (=> (and (and (= (type o_47) RefType) (= (type f_51) (FieldType A@@13 B@@12))) (or (U_2_bool (MapType1Select (MapType0Select Heap@48 null (|heapseg#sm| x@1 null)) o_47 f_51)) (U_2_bool (MapType1Select (MapType0Select Heap@48 null (|heapseg#sm| (MapType0Select Heap@48 x@1 sibling) null)) o_47 f_51)))) (U_2_bool (MapType1Select newPMask@13 o_47 f_51)))))
 :qid |stdinbpl.6752:37|
 :skolemid |143|
 :pattern ( (MapType1Select newPMask@13 o_47 f_51))
)) (= Heap@49 (MapType0Store Heap@48 null (|heapseg#sm| x@1 null) newPMask@13))) (and (= Heap@50 Heap@49) (= (ControlFlow 0 102) 101)))) anon390_correct)))
(let ((anon640_Else_correct  (=> (and (HasDirectPerm Mask@67 null (heapseg x@1 null)) (= Heap@46 ExhaleHeap@3)) (and (=> (= (ControlFlow 0 105) 102) anon641_Then_correct) (=> (= (ControlFlow 0 105) 103) anon641_Else_correct)))))
(let ((anon640_Then_correct  (=> (and (and (not (HasDirectPerm Mask@67 null (heapseg x@1 null))) (= Heap@44 (MapType0Store ExhaleHeap@3 null (|heapseg#sm| x@1 null) ZeroPMask))) (and (= Heap@45 (MapType0Store Heap@44 null (heapseg x@1 null) freshVersion@5)) (= Heap@46 Heap@45))) (and (=> (= (ControlFlow 0 104) 102) anon641_Then_correct) (=> (= (ControlFlow 0 104) 103) anon641_Else_correct)))))
(let ((anon386_correct  (=> (= Mask@67 (MapType1Store Mask@66 null (heapseg x@1 null) (real_2_U (+ (U_2_real (MapType1Select Mask@66 null (heapseg x@1 null))) FullPerm)))) (=> (and (and (state ExhaleHeap@3 Mask@67) (state ExhaleHeap@3 Mask@67)) (and (|heapseg#trigger| ExhaleHeap@3 (heapseg x@1 null)) (= (MapType0Select ExhaleHeap@3 null (heapseg x@1 null)) (FrameFragment (ite (not (= x@1 null)) (CombineFrames (MapType0Select ExhaleHeap@3 null (tree x@1)) (CombineFrames (FrameFragment (MapType0Select ExhaleHeap@3 x@1 sibling)) (CombineFrames (MapType0Select ExhaleHeap@3 null (heapseg (MapType0Select ExhaleHeap@3 x@1 sibling) null)) (FrameFragment (ite (not (= (MapType0Select ExhaleHeap@3 x@1 sibling) null)) EmptyFrame EmptyFrame))))) EmptyFrame))))) (and (=> (= (ControlFlow 0 106) 104) anon640_Then_correct) (=> (= (ControlFlow 0 106) 105) anon640_Else_correct))))))
(let ((anon639_Else_correct  (=> (= (MapType0Select ExhaleHeap@3 x@1 sibling) null) (=> (and (= Mask@66 Mask@65) (= (ControlFlow 0 110) 106)) anon386_correct))))
(let ((anon639_Then_correct  (=> (not (= (MapType0Select ExhaleHeap@3 x@1 sibling) null)) (and (=> (= (ControlFlow 0 108) (- 0 109)) (= (treeParent ExhaleHeap@3 x@1) (segParent ExhaleHeap@3 (MapType0Select ExhaleHeap@3 x@1 sibling) null))) (=> (= (treeParent ExhaleHeap@3 x@1) (segParent ExhaleHeap@3 (MapType0Select ExhaleHeap@3 x@1 sibling) null)) (=> (and (= Mask@66 Mask@65) (= (ControlFlow 0 108) 106)) anon386_correct))))))
(let ((anon384_correct  (=> (and (= Mask@65 (MapType1Store Mask@64 null (heapseg (MapType0Select ExhaleHeap@3 x@1 sibling) null) (real_2_U (- (U_2_real (MapType1Select Mask@64 null (heapseg (MapType0Select ExhaleHeap@3 x@1 sibling) null))) FullPerm)))) (InsidePredicate (heapseg x@1 null) (MapType0Select ExhaleHeap@3 null (heapseg x@1 null)) (heapseg (MapType0Select ExhaleHeap@3 x@1 sibling) null) (MapType0Select ExhaleHeap@3 null (heapseg (MapType0Select ExhaleHeap@3 x@1 sibling) null)))) (and (=> (= (ControlFlow 0 111) 108) anon639_Then_correct) (=> (= (ControlFlow 0 111) 110) anon639_Else_correct)))))
(let ((anon638_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 114) 111)) anon384_correct)))
(let ((anon638_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 112) (- 0 113)) (<= FullPerm (U_2_real (MapType1Select Mask@64 null (heapseg (MapType0Select ExhaleHeap@3 x@1 sibling) null))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@64 null (heapseg (MapType0Select ExhaleHeap@3 x@1 sibling) null)))) (=> (= (ControlFlow 0 112) 111) anon384_correct))))))
(let ((anon382_correct  (=> (= Mask@64 (MapType1Store Mask@63 x@1 sibling (real_2_U (- (U_2_real (MapType1Select Mask@63 x@1 sibling)) FullPerm)))) (and (=> (= (ControlFlow 0 115) 112) anon638_Then_correct) (=> (= (ControlFlow 0 115) 114) anon638_Else_correct)))))
(let ((anon637_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 118) 115)) anon382_correct)))
(let ((anon637_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 116) (- 0 117)) (<= FullPerm (U_2_real (MapType1Select Mask@63 x@1 sibling)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@63 x@1 sibling))) (=> (= (ControlFlow 0 116) 115) anon382_correct))))))
(let ((anon380_correct  (=> (and (= Mask@63 (MapType1Store Mask@62 null (tree x@1) (real_2_U (- (U_2_real (MapType1Select Mask@62 null (tree x@1))) FullPerm)))) (InsidePredicate (heapseg x@1 null) (MapType0Select ExhaleHeap@3 null (heapseg x@1 null)) (tree x@1) (MapType0Select ExhaleHeap@3 null (tree x@1)))) (and (=> (= (ControlFlow 0 119) 116) anon637_Then_correct) (=> (= (ControlFlow 0 119) 118) anon637_Else_correct)))))
(let ((anon636_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 122) 119)) anon380_correct)))
(let ((anon636_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 120) (- 0 121)) (<= FullPerm (U_2_real (MapType1Select Mask@62 null (tree x@1))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@62 null (tree x@1)))) (=> (= (ControlFlow 0 120) 119) anon380_correct))))))
(let ((anon635_Then_correct  (=> (not (= x@1 null)) (and (=> (= (ControlFlow 0 123) 120) anon636_Then_correct) (=> (= (ControlFlow 0 123) 122) anon636_Else_correct)))))
(let ((anon635_Else_correct  (=> (= x@1 null) (=> (and (= Mask@66 Mask@62) (= (ControlFlow 0 107) 106)) anon386_correct))))
(let ((anon377_correct  (=> (and (state ExhaleHeap@3 Mask@62) (state ExhaleHeap@3 Mask@62)) (and (=> (= (ControlFlow 0 124) 123) anon635_Then_correct) (=> (= (ControlFlow 0 124) 107) anon635_Else_correct)))))
(let ((anon634_Else_correct  (=> (and (= x@0 x@1) (= (ControlFlow 0 126) 124)) anon377_correct)))
(let ((anon634_Then_correct  (=> (and (and (not (= x@0 x@1)) (state ExhaleHeap@3 Mask@62)) (and (= (segParent ExhaleHeap@3 res@1 x@1) (segParent Heap@43 x@0 x@1)) (= (ControlFlow 0 125) 124))) anon377_correct)))
(let ((anon633_Else_correct  (=> (= res@1 x@0) (and (=> (= (ControlFlow 0 128) 125) anon634_Then_correct) (=> (= (ControlFlow 0 128) 126) anon634_Else_correct)))))
(let ((anon633_Then_correct  (=> (not (= res@1 x@0)) (=> (and (state ExhaleHeap@3 Mask@62) (= (segParent ExhaleHeap@3 res@1 x@1) (segParent Heap@43 res@1 x@0))) (and (=> (= (ControlFlow 0 127) 125) anon634_Then_correct) (=> (= (ControlFlow 0 127) 126) anon634_Else_correct))))))
(let ((anon373_correct  (=> (and (state ExhaleHeap@3 Mask@62) (= (segSize ExhaleHeap@3 res@1 x@1) (+ (segSize Heap@43 res@1 x@0) (segSize Heap@43 x@0 x@1)))) (and (=> (= (ControlFlow 0 129) 127) anon633_Then_correct) (=> (= (ControlFlow 0 129) 128) anon633_Else_correct)))))
(let ((anon632_Else_correct  (=> (and (not (and (validChildren Heap@43 res@1 x@0) (and (validChildren Heap@43 x@0 x@1) (=> (and (< 0 (segLength Heap@43 res@1 x@0)) (< 0 (segLength Heap@43 x@0 x@1))) (= (segDegree Heap@43 res@1 x@0 (- (segLength Heap@43 res@1 x@0) 1)) (+ (segDegree Heap@43 x@0 x@1 0) 1)))))) (= (ControlFlow 0 131) 129)) anon373_correct)))
(let ((anon632_Then_correct  (=> (and (and (and (validChildren Heap@43 res@1 x@0) (and (validChildren Heap@43 x@0 x@1) (=> (and (< 0 (segLength Heap@43 res@1 x@0)) (< 0 (segLength Heap@43 x@0 x@1))) (= (segDegree Heap@43 res@1 x@0 (- (segLength Heap@43 res@1 x@0) 1)) (+ (segDegree Heap@43 x@0 x@1 0) 1))))) (state ExhaleHeap@3 Mask@62)) (and (validChildren ExhaleHeap@3 res@1 x@1) (= (ControlFlow 0 130) 129))) anon373_correct)))
(let ((anon631_Else_correct  (=> (not (and (presorted Heap@43 res@1 x@0) (and (presorted Heap@43 x@0 x@1) (=> (and (< 0 (segLength Heap@43 res@1 x@0)) (< 0 (segLength Heap@43 x@0 x@1))) (and (<= (segDegree Heap@43 res@1 x@0 (- (segLength Heap@43 res@1 x@0) 1)) (segDegree Heap@43 x@0 x@1 0)) (and (=> (and (<= 2 (segLength Heap@43 res@1 x@0)) (= (segDegree Heap@43 res@1 x@0 (- (segLength Heap@43 res@1 x@0) 1)) (segDegree Heap@43 res@1 x@0 (- (segLength Heap@43 res@1 x@0) 2)))) (< (segDegree Heap@43 res@1 x@0 (- (segLength Heap@43 res@1 x@0) 1)) (segDegree Heap@43 x@0 x@1 0))) (=> (and (<= 2 (segLength Heap@43 x@0 x@1)) (= (segDegree Heap@43 x@0 x@1 0) (segDegree Heap@43 x@0 x@1 1))) (< (segDegree Heap@43 res@1 x@0 (- (segLength Heap@43 res@1 x@0) 1)) (segDegree Heap@43 x@0 x@1 0))))))))) (and (=> (= (ControlFlow 0 133) 130) anon632_Then_correct) (=> (= (ControlFlow 0 133) 131) anon632_Else_correct)))))
(let ((anon631_Then_correct  (=> (and (and (presorted Heap@43 res@1 x@0) (and (presorted Heap@43 x@0 x@1) (=> (and (< 0 (segLength Heap@43 res@1 x@0)) (< 0 (segLength Heap@43 x@0 x@1))) (and (<= (segDegree Heap@43 res@1 x@0 (- (segLength Heap@43 res@1 x@0) 1)) (segDegree Heap@43 x@0 x@1 0)) (and (=> (and (<= 2 (segLength Heap@43 res@1 x@0)) (= (segDegree Heap@43 res@1 x@0 (- (segLength Heap@43 res@1 x@0) 1)) (segDegree Heap@43 res@1 x@0 (- (segLength Heap@43 res@1 x@0) 2)))) (< (segDegree Heap@43 res@1 x@0 (- (segLength Heap@43 res@1 x@0) 1)) (segDegree Heap@43 x@0 x@1 0))) (=> (and (<= 2 (segLength Heap@43 x@0 x@1)) (= (segDegree Heap@43 x@0 x@1 0) (segDegree Heap@43 x@0 x@1 1))) (< (segDegree Heap@43 res@1 x@0 (- (segLength Heap@43 res@1 x@0) 1)) (segDegree Heap@43 x@0 x@1 0)))))))) (and (state ExhaleHeap@3 Mask@62) (presorted ExhaleHeap@3 res@1 x@1))) (and (=> (= (ControlFlow 0 132) 130) anon632_Then_correct) (=> (= (ControlFlow 0 132) 131) anon632_Else_correct)))))
(let ((anon630_Else_correct  (=> (not (and (sorted Heap@43 res@1 x@0) (and (sorted Heap@43 x@0 x@1) (=> (and (< 0 (segLength Heap@43 res@1 x@0)) (< 0 (segLength Heap@43 x@0 x@1))) (< (segDegree Heap@43 res@1 x@0 (- (segLength Heap@43 res@1 x@0) 1)) (segDegree Heap@43 x@0 x@1 0)))))) (and (=> (= (ControlFlow 0 135) 132) anon631_Then_correct) (=> (= (ControlFlow 0 135) 133) anon631_Else_correct)))))
(let ((anon630_Then_correct  (=> (and (and (sorted Heap@43 res@1 x@0) (and (sorted Heap@43 x@0 x@1) (=> (and (< 0 (segLength Heap@43 res@1 x@0)) (< 0 (segLength Heap@43 x@0 x@1))) (< (segDegree Heap@43 res@1 x@0 (- (segLength Heap@43 res@1 x@0) 1)) (segDegree Heap@43 x@0 x@1 0))))) (and (state ExhaleHeap@3 Mask@62) (sorted ExhaleHeap@3 res@1 x@1))) (and (=> (= (ControlFlow 0 134) 132) anon631_Then_correct) (=> (= (ControlFlow 0 134) 133) anon631_Else_correct)))))
(let ((anon629_Else_correct  (=> (and (= x@1 null) (= Mask@62 Mask@60)) (and (=> (= (ControlFlow 0 137) 134) anon630_Then_correct) (=> (= (ControlFlow 0 137) 135) anon630_Else_correct)))))
(let ((anon629_Then_correct  (=> (and (not (= x@1 null)) (= Mask@61 (MapType1Store Mask@60 null (tree x@1) (real_2_U (+ (U_2_real (MapType1Select Mask@60 null (tree x@1))) FullPerm))))) (=> (and (and (and (state ExhaleHeap@3 Mask@61) (state ExhaleHeap@3 Mask@61)) (and (= (treeDegree ExhaleHeap@3 x@1) (treeDegree Heap@43 x@1)) (state ExhaleHeap@3 Mask@61))) (and (and (= (treeSize ExhaleHeap@3 x@1) (treeSize Heap@43 x@1)) (state ExhaleHeap@3 Mask@61)) (and (= (treeParent ExhaleHeap@3 x@1) (treeParent Heap@43 x@1)) (= Mask@62 Mask@61)))) (and (=> (= (ControlFlow 0 136) 134) anon630_Then_correct) (=> (= (ControlFlow 0 136) 135) anon630_Else_correct))))))
(let ((anon365_correct  (=> (IdenticalOnKnownLocations Heap@43 ExhaleHeap@3 Mask@59) (=> (and (and (and (= Mask@60 (MapType1Store Mask@59 null (heapseg res@1 x@1) (real_2_U (+ (U_2_real (MapType1Select Mask@59 null (heapseg res@1 x@1))) FullPerm)))) (state ExhaleHeap@3 Mask@60)) (and (state ExhaleHeap@3 Mask@60) (= (segLength ExhaleHeap@3 res@1 x@1) (+ (segLength Heap@43 res@1 x@0) (segLength Heap@43 x@0 x@1))))) (and (and (state ExhaleHeap@3 Mask@60) (forall ((i_2_1 Int) ) (!  (=> (and (<= 0 i_2_1) (< i_2_1 (segLength Heap@43 res@1 x@0))) (= (segDegree ExhaleHeap@3 res@1 x@1 i_2_1) (segDegree Heap@43 res@1 x@0 i_2_1)))
 :qid |stdinbpl.6654:30|
 :skolemid |140|
 :pattern ( (|segDegree#frame| (MapType0Select ExhaleHeap@3 null (heapseg res@1 x@1)) res@1 x@1 i_2_1))
 :pattern ( (|segDegree#frame| (MapType0Select Heap@43 null (heapseg res@1 x@0)) res@1 x@0 i_2_1))
))) (and (state ExhaleHeap@3 Mask@60) (forall ((i_3 Int) ) (!  (=> (and (<= (segLength Heap@43 res@1 x@0) i_3) (< i_3 (segLength ExhaleHeap@3 res@1 x@1))) (= (segDegree ExhaleHeap@3 res@1 x@1 i_3) (segDegree Heap@43 x@0 x@1 (- i_3 (segLength Heap@43 res@1 x@0)))))
 :qid |stdinbpl.6659:30|
 :skolemid |141|
 :pattern ( (|segDegree#frame| (MapType0Select ExhaleHeap@3 null (heapseg res@1 x@1)) res@1 x@1 i_3))
))))) (and (=> (= (ControlFlow 0 138) 136) anon629_Then_correct) (=> (= (ControlFlow 0 138) 137) anon629_Else_correct))))))
(let ((anon628_Else_correct  (=> (and (not (and (not (= res@1 x@0)) (not (= x@0 x@1)))) (= (ControlFlow 0 141) 138)) anon365_correct)))
(let ((anon628_Then_correct  (=> (and (not (= res@1 x@0)) (not (= x@0 x@1))) (and (=> (= (ControlFlow 0 139) (- 0 140)) (= (segParent Heap@43 res@1 x@0) (segParent Heap@43 x@0 x@1))) (=> (= (segParent Heap@43 res@1 x@0) (segParent Heap@43 x@0 x@1)) (=> (= (ControlFlow 0 139) 138) anon365_correct))))))
(let ((anon362_correct  (=> (and (= Mask@58 (MapType1Store Mask@57 null (tree x@1) (real_2_U (- (U_2_real (MapType1Select Mask@57 null (tree x@1))) FullPerm)))) (= Mask@59 Mask@58)) (and (=> (= (ControlFlow 0 143) 139) anon628_Then_correct) (=> (= (ControlFlow 0 143) 141) anon628_Else_correct)))))
(let ((anon627_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 146) 143)) anon362_correct)))
(let ((anon627_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 144) (- 0 145)) (<= FullPerm (U_2_real (MapType1Select Mask@57 null (tree x@1))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@57 null (tree x@1)))) (=> (= (ControlFlow 0 144) 143) anon362_correct))))))
(let ((anon626_Then_correct  (=> (not (= x@1 null)) (and (=> (= (ControlFlow 0 147) 144) anon627_Then_correct) (=> (= (ControlFlow 0 147) 146) anon627_Else_correct)))))
(let ((anon626_Else_correct  (=> (and (= x@1 null) (= Mask@59 Mask@57)) (and (=> (= (ControlFlow 0 142) 139) anon628_Then_correct) (=> (= (ControlFlow 0 142) 141) anon628_Else_correct)))))
(let ((anon359_correct  (=> (= Mask@57 (MapType1Store Mask@56 null (heapseg x@0 x@1) (real_2_U (- (U_2_real (MapType1Select Mask@56 null (heapseg x@0 x@1))) FullPerm)))) (and (=> (= (ControlFlow 0 148) 147) anon626_Then_correct) (=> (= (ControlFlow 0 148) 142) anon626_Else_correct)))))
(let ((anon625_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 151) 148)) anon359_correct)))
(let ((anon625_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 149) (- 0 150)) (<= FullPerm (U_2_real (MapType1Select Mask@56 null (heapseg x@0 x@1))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@56 null (heapseg x@0 x@1)))) (=> (= (ControlFlow 0 149) 148) anon359_correct))))))
(let ((anon357_correct  (=> (= Mask@56 (MapType1Store Mask@55 null (heapseg res@1 x@0) (real_2_U (- (U_2_real (MapType1Select Mask@55 null (heapseg res@1 x@0))) FullPerm)))) (and (=> (= (ControlFlow 0 152) 149) anon625_Then_correct) (=> (= (ControlFlow 0 152) 151) anon625_Else_correct)))))
(let ((anon624_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 155) 152)) anon357_correct)))
(let ((anon624_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 153) (- 0 154)) (<= FullPerm (U_2_real (MapType1Select Mask@55 null (heapseg res@1 x@0))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@55 null (heapseg res@1 x@0)))) (=> (= (ControlFlow 0 153) 152) anon357_correct))))))
(let ((anon355_correct  (=> (and (state Heap@43 Mask@55) (state Heap@43 Mask@55)) (and (=> (= (ControlFlow 0 156) 153) anon624_Then_correct) (=> (= (ControlFlow 0 156) 155) anon624_Else_correct)))))
(let ((anon623_Else_correct  (=> (= (MapType0Select Heap@43 x@1 sibling) null) (=> (and (= Mask@55 Mask@54) (= (ControlFlow 0 159) 156)) anon355_correct))))
(let ((anon623_Then_correct  (=> (not (= (MapType0Select Heap@43 x@1 sibling) null)) (=> (and (and (state Heap@43 Mask@54) (= (treeParent Heap@43 x@1) (segParent Heap@43 (MapType0Select Heap@43 x@1 sibling) null))) (and (= Mask@55 Mask@54) (= (ControlFlow 0 158) 156))) anon355_correct))))
(let ((anon622_Then_correct  (=> (and (not (= x@1 null)) (= Mask@52 (MapType1Store Mask@51 null (tree x@1) (real_2_U (+ (U_2_real (MapType1Select Mask@51 null (tree x@1))) FullPerm))))) (=> (and (and (and (InsidePredicate (heapseg x@1 null) (MapType0Select Heap@43 null (heapseg x@1 null)) (tree x@1) (MapType0Select Heap@43 null (tree x@1))) (state Heap@43 Mask@52)) (and (not (= x@1 null)) (= Mask@53 (MapType1Store Mask@52 x@1 sibling (real_2_U (+ (U_2_real (MapType1Select Mask@52 x@1 sibling)) FullPerm)))))) (and (and (state Heap@43 Mask@53) (= Mask@54 (MapType1Store Mask@53 null (heapseg (MapType0Select Heap@43 x@1 sibling) null) (real_2_U (+ (U_2_real (MapType1Select Mask@53 null (heapseg (MapType0Select Heap@43 x@1 sibling) null))) FullPerm))))) (and (InsidePredicate (heapseg x@1 null) (MapType0Select Heap@43 null (heapseg x@1 null)) (heapseg (MapType0Select Heap@43 x@1 sibling) null) (MapType0Select Heap@43 null (heapseg (MapType0Select Heap@43 x@1 sibling) null))) (state Heap@43 Mask@54)))) (and (=> (= (ControlFlow 0 160) 158) anon623_Then_correct) (=> (= (ControlFlow 0 160) 159) anon623_Else_correct))))))
(let ((anon622_Else_correct  (=> (= x@1 null) (=> (and (= Mask@55 Mask@51) (= (ControlFlow 0 157) 156)) anon355_correct))))
(let ((anon621_Else_correct  (=> (and (HasDirectPerm Mask@51 null (heapseg x@1 null)) (= Heap@43 Heap@41)) (and (=> (= (ControlFlow 0 162) 160) anon622_Then_correct) (=> (= (ControlFlow 0 162) 157) anon622_Else_correct)))))
(let ((anon621_Then_correct  (=> (not (HasDirectPerm Mask@51 null (heapseg x@1 null))) (=> (and (= Heap@42 (MapType0Store Heap@41 null (heapseg x@1 null) newVersion@1)) (= Heap@43 Heap@42)) (and (=> (= (ControlFlow 0 161) 160) anon622_Then_correct) (=> (= (ControlFlow 0 161) 157) anon622_Else_correct))))))
(let ((anon350_correct  (=> (= Mask@51 (MapType1Store Mask@50 null (heapseg x@1 null) (real_2_U (- (U_2_real (MapType1Select Mask@50 null (heapseg x@1 null))) FullPerm)))) (and (=> (= (ControlFlow 0 163) 161) anon621_Then_correct) (=> (= (ControlFlow 0 163) 162) anon621_Else_correct)))))
(let ((anon620_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 166) 163)) anon350_correct)))
(let ((anon620_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 164) (- 0 165)) (<= FullPerm (U_2_real (MapType1Select Mask@50 null (heapseg x@1 null))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@50 null (heapseg x@1 null)))) (=> (= (ControlFlow 0 164) 163) anon350_correct))))))
(let ((anon348_correct  (=> (and (and (state Heap@41 Mask@50) (state Heap@41 Mask@50)) (and (|heapseg#trigger| Heap@41 (heapseg x@1 null)) (= (MapType0Select Heap@41 null (heapseg x@1 null)) (FrameFragment (ite (not (= x@1 null)) (CombineFrames (MapType0Select Heap@41 null (tree x@1)) (CombineFrames (FrameFragment (MapType0Select Heap@41 x@1 sibling)) (CombineFrames (MapType0Select Heap@41 null (heapseg (MapType0Select Heap@41 x@1 sibling) null)) (FrameFragment (ite (not (= (MapType0Select Heap@41 x@1 sibling) null)) EmptyFrame EmptyFrame))))) EmptyFrame))))) (and (=> (= (ControlFlow 0 167) 164) anon620_Then_correct) (=> (= (ControlFlow 0 167) 166) anon620_Else_correct)))))
(let ((anon619_Else_correct  (=> (= x@0 x@1) (=> (and (= Heap@41 Heap@37) (= (ControlFlow 0 169) 167)) anon348_correct))))
(let ((anon619_Then_correct  (=> (and (and (and (not (= x@0 x@1)) (forall ((o_44 T@U) (f_48 T@U) ) (! (let ((B@@13 (FieldTypeInv1 (type f_48))))
(let ((A@@14 (FieldTypeInv0 (type f_48))))
 (=> (and (and (= (type o_44) RefType) (= (type f_48) (FieldType A@@14 B@@13))) (or (U_2_bool (MapType1Select (MapType0Select Heap@37 null (|heapseg#sm| x@0 x@1)) o_44 f_48)) (U_2_bool (MapType1Select (MapType0Select Heap@37 null (|tree#sm| x@0)) o_44 f_48)))) (U_2_bool (MapType1Select newPMask@10 o_44 f_48)))))
 :qid |stdinbpl.6553:37|
 :skolemid |138|
 :pattern ( (MapType1Select newPMask@10 o_44 f_48))
))) (and (= Heap@38 (MapType0Store Heap@37 null (|heapseg#sm| x@0 x@1) newPMask@10)) (= Heap@39 (MapType0Store Heap@38 null (|heapseg#sm| x@0 x@1) (MapType1Store (MapType0Select Heap@38 null (|heapseg#sm| x@0 x@1)) x@0 sibling (bool_2_U true)))))) (and (and (forall ((o_45 T@U) (f_49 T@U) ) (! (let ((B@@14 (FieldTypeInv1 (type f_49))))
(let ((A@@15 (FieldTypeInv0 (type f_49))))
 (=> (and (and (= (type o_45) RefType) (= (type f_49) (FieldType A@@15 B@@14))) (or (U_2_bool (MapType1Select (MapType0Select Heap@39 null (|heapseg#sm| x@0 x@1)) o_45 f_49)) (U_2_bool (MapType1Select (MapType0Select Heap@39 null (|heapseg#sm| (MapType0Select Heap@39 x@0 sibling) x@1)) o_45 f_49)))) (U_2_bool (MapType1Select newPMask@11 o_45 f_49)))))
 :qid |stdinbpl.6560:37|
 :skolemid |139|
 :pattern ( (MapType1Select newPMask@11 o_45 f_49))
)) (= Heap@40 (MapType0Store Heap@39 null (|heapseg#sm| x@0 x@1) newPMask@11))) (and (= Heap@41 Heap@40) (= (ControlFlow 0 168) 167)))) anon348_correct)))
(let ((anon618_Else_correct  (=> (and (HasDirectPerm Mask@50 null (heapseg x@0 x@1)) (= Heap@37 Heap@34)) (and (=> (= (ControlFlow 0 171) 168) anon619_Then_correct) (=> (= (ControlFlow 0 171) 169) anon619_Else_correct)))))
(let ((anon618_Then_correct  (=> (and (and (not (HasDirectPerm Mask@50 null (heapseg x@0 x@1))) (= Heap@35 (MapType0Store Heap@34 null (|heapseg#sm| x@0 x@1) ZeroPMask))) (and (= Heap@36 (MapType0Store Heap@35 null (heapseg x@0 x@1) freshVersion@4)) (= Heap@37 Heap@36))) (and (=> (= (ControlFlow 0 170) 168) anon619_Then_correct) (=> (= (ControlFlow 0 170) 169) anon619_Else_correct)))))
(let ((anon344_correct  (=> (= Mask@50 (MapType1Store Mask@49 null (heapseg x@0 x@1) (real_2_U (+ (U_2_real (MapType1Select Mask@49 null (heapseg x@0 x@1))) FullPerm)))) (=> (and (and (state Heap@34 Mask@50) (state Heap@34 Mask@50)) (and (|heapseg#trigger| Heap@34 (heapseg x@0 x@1)) (= (MapType0Select Heap@34 null (heapseg x@0 x@1)) (FrameFragment (ite (not (= x@0 x@1)) (CombineFrames (MapType0Select Heap@34 null (tree x@0)) (CombineFrames (FrameFragment (MapType0Select Heap@34 x@0 sibling)) (CombineFrames (MapType0Select Heap@34 null (heapseg (MapType0Select Heap@34 x@0 sibling) x@1)) (FrameFragment (ite (not (= (MapType0Select Heap@34 x@0 sibling) x@1)) EmptyFrame EmptyFrame))))) EmptyFrame))))) (and (=> (= (ControlFlow 0 172) 170) anon618_Then_correct) (=> (= (ControlFlow 0 172) 171) anon618_Else_correct))))))
(let ((anon617_Else_correct  (=> (= (MapType0Select Heap@34 x@0 sibling) x@1) (=> (and (= Mask@49 Mask@48) (= (ControlFlow 0 176) 172)) anon344_correct))))
(let ((anon617_Then_correct  (=> (not (= (MapType0Select Heap@34 x@0 sibling) x@1)) (and (=> (= (ControlFlow 0 174) (- 0 175)) (= (treeParent Heap@34 x@0) (segParent Heap@34 (MapType0Select Heap@34 x@0 sibling) x@1))) (=> (= (treeParent Heap@34 x@0) (segParent Heap@34 (MapType0Select Heap@34 x@0 sibling) x@1)) (=> (and (= Mask@49 Mask@48) (= (ControlFlow 0 174) 172)) anon344_correct))))))
(let ((anon342_correct  (=> (and (= Mask@48 (MapType1Store Mask@47 null (heapseg (MapType0Select Heap@34 x@0 sibling) x@1) (real_2_U (- (U_2_real (MapType1Select Mask@47 null (heapseg (MapType0Select Heap@34 x@0 sibling) x@1))) FullPerm)))) (InsidePredicate (heapseg x@0 x@1) (MapType0Select Heap@34 null (heapseg x@0 x@1)) (heapseg (MapType0Select Heap@34 x@0 sibling) x@1) (MapType0Select Heap@34 null (heapseg (MapType0Select Heap@34 x@0 sibling) x@1)))) (and (=> (= (ControlFlow 0 177) 174) anon617_Then_correct) (=> (= (ControlFlow 0 177) 176) anon617_Else_correct)))))
(let ((anon616_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 180) 177)) anon342_correct)))
(let ((anon616_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 178) (- 0 179)) (<= FullPerm (U_2_real (MapType1Select Mask@47 null (heapseg (MapType0Select Heap@34 x@0 sibling) x@1))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@47 null (heapseg (MapType0Select Heap@34 x@0 sibling) x@1)))) (=> (= (ControlFlow 0 178) 177) anon342_correct))))))
(let ((anon340_correct  (=> (= Mask@47 (MapType1Store Mask@46 x@0 sibling (real_2_U (- (U_2_real (MapType1Select Mask@46 x@0 sibling)) FullPerm)))) (and (=> (= (ControlFlow 0 181) 178) anon616_Then_correct) (=> (= (ControlFlow 0 181) 180) anon616_Else_correct)))))
(let ((anon615_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 184) 181)) anon340_correct)))
(let ((anon615_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 182) (- 0 183)) (<= FullPerm (U_2_real (MapType1Select Mask@46 x@0 sibling)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@46 x@0 sibling))) (=> (= (ControlFlow 0 182) 181) anon340_correct))))))
(let ((anon338_correct  (=> (and (= Mask@46 (MapType1Store Mask@45 null (tree x@0) (real_2_U (- (U_2_real (MapType1Select Mask@45 null (tree x@0))) FullPerm)))) (InsidePredicate (heapseg x@0 x@1) (MapType0Select Heap@34 null (heapseg x@0 x@1)) (tree x@0) (MapType0Select Heap@34 null (tree x@0)))) (and (=> (= (ControlFlow 0 185) 182) anon615_Then_correct) (=> (= (ControlFlow 0 185) 184) anon615_Else_correct)))))
(let ((anon614_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 188) 185)) anon338_correct)))
(let ((anon614_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 186) (- 0 187)) (<= FullPerm (U_2_real (MapType1Select Mask@45 null (tree x@0))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@45 null (tree x@0)))) (=> (= (ControlFlow 0 186) 185) anon338_correct))))))
(let ((anon613_Then_correct  (=> (not (= x@0 x@1)) (and (=> (= (ControlFlow 0 189) 186) anon614_Then_correct) (=> (= (ControlFlow 0 189) 188) anon614_Else_correct)))))
(let ((anon613_Else_correct  (=> (= x@0 x@1) (=> (and (= Mask@49 Mask@45) (= (ControlFlow 0 173) 172)) anon344_correct))))
(let ((anon335_correct  (=> (and (state Heap@34 Mask@45) (state Heap@34 Mask@45)) (and (=> (= (ControlFlow 0 190) 189) anon613_Then_correct) (=> (= (ControlFlow 0 190) 173) anon613_Else_correct)))))
(let ((anon612_Else_correct  (=> (= x@1 x@1) (=> (and (= Heap@34 Heap@30) (= (ControlFlow 0 192) 190)) anon335_correct))))
(let ((anon612_Then_correct  (=> (and (and (and (not (= x@1 x@1)) (forall ((o_42 T@U) (f_46 T@U) ) (! (let ((B@@15 (FieldTypeInv1 (type f_46))))
(let ((A@@16 (FieldTypeInv0 (type f_46))))
 (=> (and (and (= (type o_42) RefType) (= (type f_46) (FieldType A@@16 B@@15))) (or (U_2_bool (MapType1Select (MapType0Select Heap@30 null (|heapseg#sm| x@1 x@1)) o_42 f_46)) (U_2_bool (MapType1Select (MapType0Select Heap@30 null (|tree#sm| x@1)) o_42 f_46)))) (U_2_bool (MapType1Select newPMask@8 o_42 f_46)))))
 :qid |stdinbpl.6491:37|
 :skolemid |136|
 :pattern ( (MapType1Select newPMask@8 o_42 f_46))
))) (and (= Heap@31 (MapType0Store Heap@30 null (|heapseg#sm| x@1 x@1) newPMask@8)) (= Heap@32 (MapType0Store Heap@31 null (|heapseg#sm| x@1 x@1) (MapType1Store (MapType0Select Heap@31 null (|heapseg#sm| x@1 x@1)) x@1 sibling (bool_2_U true)))))) (and (and (forall ((o_43 T@U) (f_47 T@U) ) (! (let ((B@@16 (FieldTypeInv1 (type f_47))))
(let ((A@@17 (FieldTypeInv0 (type f_47))))
 (=> (and (and (= (type o_43) RefType) (= (type f_47) (FieldType A@@17 B@@16))) (or (U_2_bool (MapType1Select (MapType0Select Heap@32 null (|heapseg#sm| x@1 x@1)) o_43 f_47)) (U_2_bool (MapType1Select (MapType0Select Heap@32 null (|heapseg#sm| (MapType0Select Heap@32 x@1 sibling) x@1)) o_43 f_47)))) (U_2_bool (MapType1Select newPMask@9 o_43 f_47)))))
 :qid |stdinbpl.6498:37|
 :skolemid |137|
 :pattern ( (MapType1Select newPMask@9 o_43 f_47))
)) (= Heap@33 (MapType0Store Heap@32 null (|heapseg#sm| x@1 x@1) newPMask@9))) (and (= Heap@34 Heap@33) (= (ControlFlow 0 191) 190)))) anon335_correct)))
(let ((anon611_Else_correct  (=> (and (HasDirectPerm Mask@45 null (heapseg x@1 x@1)) (= Heap@30 Heap@27)) (and (=> (= (ControlFlow 0 194) 191) anon612_Then_correct) (=> (= (ControlFlow 0 194) 192) anon612_Else_correct)))))
(let ((anon611_Then_correct  (=> (and (and (not (HasDirectPerm Mask@45 null (heapseg x@1 x@1))) (= Heap@28 (MapType0Store Heap@27 null (|heapseg#sm| x@1 x@1) ZeroPMask))) (and (= Heap@29 (MapType0Store Heap@28 null (heapseg x@1 x@1) freshVersion@3)) (= Heap@30 Heap@29))) (and (=> (= (ControlFlow 0 193) 191) anon612_Then_correct) (=> (= (ControlFlow 0 193) 192) anon612_Else_correct)))))
(let ((anon331_correct  (=> (= Mask@45 (MapType1Store Mask@44 null (heapseg x@1 x@1) (real_2_U (+ (U_2_real (MapType1Select Mask@44 null (heapseg x@1 x@1))) FullPerm)))) (=> (and (and (state Heap@27 Mask@45) (state Heap@27 Mask@45)) (and (|heapseg#trigger| Heap@27 (heapseg x@1 x@1)) (= (MapType0Select Heap@27 null (heapseg x@1 x@1)) (FrameFragment (ite (not (= x@1 x@1)) (CombineFrames (MapType0Select Heap@27 null (tree x@1)) (CombineFrames (FrameFragment (MapType0Select Heap@27 x@1 sibling)) (CombineFrames (MapType0Select Heap@27 null (heapseg (MapType0Select Heap@27 x@1 sibling) x@1)) (FrameFragment (ite (not (= (MapType0Select Heap@27 x@1 sibling) x@1)) EmptyFrame EmptyFrame))))) EmptyFrame))))) (and (=> (= (ControlFlow 0 195) 193) anon611_Then_correct) (=> (= (ControlFlow 0 195) 194) anon611_Else_correct))))))
(let ((anon610_Else_correct  (=> (= (MapType0Select Heap@27 x@1 sibling) x@1) (=> (and (= Mask@44 Mask@43) (= (ControlFlow 0 199) 195)) anon331_correct))))
(let ((anon610_Then_correct  (=> (not (= (MapType0Select Heap@27 x@1 sibling) x@1)) (and (=> (= (ControlFlow 0 197) (- 0 198)) (= (treeParent Heap@27 x@1) (segParent Heap@27 (MapType0Select Heap@27 x@1 sibling) x@1))) (=> (= (treeParent Heap@27 x@1) (segParent Heap@27 (MapType0Select Heap@27 x@1 sibling) x@1)) (=> (and (= Mask@44 Mask@43) (= (ControlFlow 0 197) 195)) anon331_correct))))))
(let ((anon329_correct  (=> (and (= Mask@43 (MapType1Store Mask@42 null (heapseg (MapType0Select Heap@27 x@1 sibling) x@1) (real_2_U (- (U_2_real (MapType1Select Mask@42 null (heapseg (MapType0Select Heap@27 x@1 sibling) x@1))) FullPerm)))) (InsidePredicate (heapseg x@1 x@1) (MapType0Select Heap@27 null (heapseg x@1 x@1)) (heapseg (MapType0Select Heap@27 x@1 sibling) x@1) (MapType0Select Heap@27 null (heapseg (MapType0Select Heap@27 x@1 sibling) x@1)))) (and (=> (= (ControlFlow 0 200) 197) anon610_Then_correct) (=> (= (ControlFlow 0 200) 199) anon610_Else_correct)))))
(let ((anon609_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 203) 200)) anon329_correct)))
(let ((anon609_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 201) (- 0 202)) (<= FullPerm (U_2_real (MapType1Select Mask@42 null (heapseg (MapType0Select Heap@27 x@1 sibling) x@1))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@42 null (heapseg (MapType0Select Heap@27 x@1 sibling) x@1)))) (=> (= (ControlFlow 0 201) 200) anon329_correct))))))
(let ((anon327_correct  (=> (= Mask@42 (MapType1Store Mask@41 x@1 sibling (real_2_U (- (U_2_real (MapType1Select Mask@41 x@1 sibling)) FullPerm)))) (and (=> (= (ControlFlow 0 204) 201) anon609_Then_correct) (=> (= (ControlFlow 0 204) 203) anon609_Else_correct)))))
(let ((anon608_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 207) 204)) anon327_correct)))
(let ((anon608_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 205) (- 0 206)) (<= FullPerm (U_2_real (MapType1Select Mask@41 x@1 sibling)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@41 x@1 sibling))) (=> (= (ControlFlow 0 205) 204) anon327_correct))))))
(let ((anon325_correct  (=> (and (= Mask@41 (MapType1Store Mask@40 null (tree x@1) (real_2_U (- (U_2_real (MapType1Select Mask@40 null (tree x@1))) FullPerm)))) (InsidePredicate (heapseg x@1 x@1) (MapType0Select Heap@27 null (heapseg x@1 x@1)) (tree x@1) (MapType0Select Heap@27 null (tree x@1)))) (and (=> (= (ControlFlow 0 208) 205) anon608_Then_correct) (=> (= (ControlFlow 0 208) 207) anon608_Else_correct)))))
(let ((anon607_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 211) 208)) anon325_correct)))
(let ((anon607_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 209) (- 0 210)) (<= FullPerm (U_2_real (MapType1Select Mask@40 null (tree x@1))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@40 null (tree x@1)))) (=> (= (ControlFlow 0 209) 208) anon325_correct))))))
(let ((anon606_Then_correct  (=> (not (= x@1 x@1)) (and (=> (= (ControlFlow 0 212) 209) anon607_Then_correct) (=> (= (ControlFlow 0 212) 211) anon607_Else_correct)))))
(let ((anon606_Else_correct  (=> (= x@1 x@1) (=> (and (= Mask@44 Mask@40) (= (ControlFlow 0 196) 195)) anon331_correct))))
(let ((anon322_correct  (=> (and (state Heap@27 Mask@40) (state Heap@27 Mask@40)) (and (=> (= (ControlFlow 0 213) (- 0 214)) (HasDirectPerm Mask@40 x@0 sibling)) (=> (HasDirectPerm Mask@40 x@0 sibling) (=> (and (= x@1 (MapType0Select Heap@27 x@0 sibling)) (state Heap@27 Mask@40)) (and (=> (= (ControlFlow 0 213) 212) anon606_Then_correct) (=> (= (ControlFlow 0 213) 196) anon606_Else_correct))))))))
(let ((anon321_correct  (=> (and (state Heap@26 Mask@39) (state Heap@26 Mask@39)) (=> (and (and (= res@1 x@0) (= Heap@27 Heap@26)) (and (= Mask@40 Mask@39) (= (ControlFlow 0 220) 213))) anon322_correct))))
(let ((anon605_Else_correct  (=> (= x@0 x@0) (=> (and (= Heap@26 Heap@22) (= (ControlFlow 0 222) 220)) anon321_correct))))
(let ((anon605_Then_correct  (=> (and (and (and (not (= x@0 x@0)) (forall ((o_40 T@U) (f_44 T@U) ) (! (let ((B@@17 (FieldTypeInv1 (type f_44))))
(let ((A@@18 (FieldTypeInv0 (type f_44))))
 (=> (and (and (= (type o_40) RefType) (= (type f_44) (FieldType A@@18 B@@17))) (or (U_2_bool (MapType1Select (MapType0Select Heap@22 null (|heapseg#sm| x@0 x@0)) o_40 f_44)) (U_2_bool (MapType1Select (MapType0Select Heap@22 null (|tree#sm| x@0)) o_40 f_44)))) (U_2_bool (MapType1Select newPMask@6 o_40 f_44)))))
 :qid |stdinbpl.6415:41|
 :skolemid |134|
 :pattern ( (MapType1Select newPMask@6 o_40 f_44))
))) (and (= Heap@23 (MapType0Store Heap@22 null (|heapseg#sm| x@0 x@0) newPMask@6)) (= Heap@24 (MapType0Store Heap@23 null (|heapseg#sm| x@0 x@0) (MapType1Store (MapType0Select Heap@23 null (|heapseg#sm| x@0 x@0)) x@0 sibling (bool_2_U true)))))) (and (and (forall ((o_41 T@U) (f_45 T@U) ) (! (let ((B@@18 (FieldTypeInv1 (type f_45))))
(let ((A@@19 (FieldTypeInv0 (type f_45))))
 (=> (and (and (= (type o_41) RefType) (= (type f_45) (FieldType A@@19 B@@18))) (or (U_2_bool (MapType1Select (MapType0Select Heap@24 null (|heapseg#sm| x@0 x@0)) o_41 f_45)) (U_2_bool (MapType1Select (MapType0Select Heap@24 null (|heapseg#sm| (MapType0Select Heap@24 x@0 sibling) x@0)) o_41 f_45)))) (U_2_bool (MapType1Select newPMask@7 o_41 f_45)))))
 :qid |stdinbpl.6422:41|
 :skolemid |135|
 :pattern ( (MapType1Select newPMask@7 o_41 f_45))
)) (= Heap@25 (MapType0Store Heap@24 null (|heapseg#sm| x@0 x@0) newPMask@7))) (and (= Heap@26 Heap@25) (= (ControlFlow 0 221) 220)))) anon321_correct)))
(let ((anon604_Else_correct  (=> (and (HasDirectPerm Mask@39 null (heapseg x@0 x@0)) (= Heap@22 ExhaleHeap@2)) (and (=> (= (ControlFlow 0 224) 221) anon605_Then_correct) (=> (= (ControlFlow 0 224) 222) anon605_Else_correct)))))
(let ((anon604_Then_correct  (=> (and (and (not (HasDirectPerm Mask@39 null (heapseg x@0 x@0))) (= Heap@20 (MapType0Store ExhaleHeap@2 null (|heapseg#sm| x@0 x@0) ZeroPMask))) (and (= Heap@21 (MapType0Store Heap@20 null (heapseg x@0 x@0) freshVersion@2)) (= Heap@22 Heap@21))) (and (=> (= (ControlFlow 0 223) 221) anon605_Then_correct) (=> (= (ControlFlow 0 223) 222) anon605_Else_correct)))))
(let ((anon317_correct  (=> (= Mask@39 (MapType1Store Mask@38 null (heapseg x@0 x@0) (real_2_U (+ (U_2_real (MapType1Select Mask@38 null (heapseg x@0 x@0))) FullPerm)))) (=> (and (and (state ExhaleHeap@2 Mask@39) (state ExhaleHeap@2 Mask@39)) (and (|heapseg#trigger| ExhaleHeap@2 (heapseg x@0 x@0)) (= (MapType0Select ExhaleHeap@2 null (heapseg x@0 x@0)) (FrameFragment (ite (not (= x@0 x@0)) (CombineFrames (MapType0Select ExhaleHeap@2 null (tree x@0)) (CombineFrames (FrameFragment (MapType0Select ExhaleHeap@2 x@0 sibling)) (CombineFrames (MapType0Select ExhaleHeap@2 null (heapseg (MapType0Select ExhaleHeap@2 x@0 sibling) x@0)) (FrameFragment (ite (not (= (MapType0Select ExhaleHeap@2 x@0 sibling) x@0)) EmptyFrame EmptyFrame))))) EmptyFrame))))) (and (=> (= (ControlFlow 0 225) 223) anon604_Then_correct) (=> (= (ControlFlow 0 225) 224) anon604_Else_correct))))))
(let ((anon603_Else_correct  (=> (= (MapType0Select ExhaleHeap@2 x@0 sibling) x@0) (=> (and (= Mask@38 Mask@37) (= (ControlFlow 0 229) 225)) anon317_correct))))
(let ((anon603_Then_correct  (=> (not (= (MapType0Select ExhaleHeap@2 x@0 sibling) x@0)) (and (=> (= (ControlFlow 0 227) (- 0 228)) (= (treeParent ExhaleHeap@2 x@0) (segParent ExhaleHeap@2 (MapType0Select ExhaleHeap@2 x@0 sibling) x@0))) (=> (= (treeParent ExhaleHeap@2 x@0) (segParent ExhaleHeap@2 (MapType0Select ExhaleHeap@2 x@0 sibling) x@0)) (=> (and (= Mask@38 Mask@37) (= (ControlFlow 0 227) 225)) anon317_correct))))))
(let ((anon315_correct  (=> (and (= Mask@37 (MapType1Store Mask@36 null (heapseg (MapType0Select ExhaleHeap@2 x@0 sibling) x@0) (real_2_U (- (U_2_real (MapType1Select Mask@36 null (heapseg (MapType0Select ExhaleHeap@2 x@0 sibling) x@0))) FullPerm)))) (InsidePredicate (heapseg x@0 x@0) (MapType0Select ExhaleHeap@2 null (heapseg x@0 x@0)) (heapseg (MapType0Select ExhaleHeap@2 x@0 sibling) x@0) (MapType0Select ExhaleHeap@2 null (heapseg (MapType0Select ExhaleHeap@2 x@0 sibling) x@0)))) (and (=> (= (ControlFlow 0 230) 227) anon603_Then_correct) (=> (= (ControlFlow 0 230) 229) anon603_Else_correct)))))
(let ((anon602_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 233) 230)) anon315_correct)))
(let ((anon602_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 231) (- 0 232)) (<= FullPerm (U_2_real (MapType1Select Mask@36 null (heapseg (MapType0Select ExhaleHeap@2 x@0 sibling) x@0))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@36 null (heapseg (MapType0Select ExhaleHeap@2 x@0 sibling) x@0)))) (=> (= (ControlFlow 0 231) 230) anon315_correct))))))
(let ((anon313_correct  (=> (= Mask@36 (MapType1Store Mask@35 x@0 sibling (real_2_U (- (U_2_real (MapType1Select Mask@35 x@0 sibling)) FullPerm)))) (and (=> (= (ControlFlow 0 234) 231) anon602_Then_correct) (=> (= (ControlFlow 0 234) 233) anon602_Else_correct)))))
(let ((anon601_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 237) 234)) anon313_correct)))
(let ((anon601_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 235) (- 0 236)) (<= FullPerm (U_2_real (MapType1Select Mask@35 x@0 sibling)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@35 x@0 sibling))) (=> (= (ControlFlow 0 235) 234) anon313_correct))))))
(let ((anon311_correct  (=> (and (= Mask@35 (MapType1Store Mask@34 null (tree x@0) (real_2_U (- (U_2_real (MapType1Select Mask@34 null (tree x@0))) FullPerm)))) (InsidePredicate (heapseg x@0 x@0) (MapType0Select ExhaleHeap@2 null (heapseg x@0 x@0)) (tree x@0) (MapType0Select ExhaleHeap@2 null (tree x@0)))) (and (=> (= (ControlFlow 0 238) 235) anon601_Then_correct) (=> (= (ControlFlow 0 238) 237) anon601_Else_correct)))))
(let ((anon600_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 241) 238)) anon311_correct)))
(let ((anon600_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 239) (- 0 240)) (<= FullPerm (U_2_real (MapType1Select Mask@34 null (tree x@0))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@34 null (tree x@0)))) (=> (= (ControlFlow 0 239) 238) anon311_correct))))))
(let ((anon599_Then_correct  (=> (not (= x@0 x@0)) (and (=> (= (ControlFlow 0 242) 239) anon600_Then_correct) (=> (= (ControlFlow 0 242) 241) anon600_Else_correct)))))
(let ((anon599_Else_correct  (=> (= x@0 x@0) (=> (and (= Mask@38 Mask@34) (= (ControlFlow 0 226) 225)) anon317_correct))))
(let ((anon597_Else_correct  (=> (and (= vmin@2 (treeKey ExhaleHeap@2 x@0)) (state ExhaleHeap@2 Mask@34)) (and (=> (= (ControlFlow 0 243) 242) anon599_Then_correct) (=> (= (ControlFlow 0 243) 226) anon599_Else_correct)))))
(let ((anon304_correct  (=> (state ExhaleHeap@2 Mask@34) (=> (and (state ExhaleHeap@2 Mask@34) (state ExhaleHeap@2 Mask@34)) (and (and (=> (= (ControlFlow 0 244) 243) anon597_Else_correct) (=> (= (ControlFlow 0 244) 217) anon598_Then_correct)) (=> (= (ControlFlow 0 244) 219) anon598_Else_correct))))))
(let ((anon596_Else_correct  (=> (and (= res@0 x@0) (= (ControlFlow 0 246) 244)) anon304_correct)))
(let ((anon596_Then_correct  (=> (and (and (not (= res@0 x@0)) (state ExhaleHeap@2 Mask@34)) (and (= (segParent ExhaleHeap@2 arg x@0) (segParent Heap@19 res@0 x@0)) (= (ControlFlow 0 245) 244))) anon304_correct)))
(let ((anon595_Else_correct  (=> (= arg res@0) (and (=> (= (ControlFlow 0 248) 245) anon596_Then_correct) (=> (= (ControlFlow 0 248) 246) anon596_Else_correct)))))
(let ((anon595_Then_correct  (=> (not (= arg res@0)) (=> (and (state ExhaleHeap@2 Mask@34) (= (segParent ExhaleHeap@2 arg x@0) (segParent Heap@19 arg res@0))) (and (=> (= (ControlFlow 0 247) 245) anon596_Then_correct) (=> (= (ControlFlow 0 247) 246) anon596_Else_correct))))))
(let ((anon300_correct  (=> (and (state ExhaleHeap@2 Mask@34) (= (segSize ExhaleHeap@2 arg x@0) (+ (segSize Heap@19 arg res@0) (segSize Heap@19 res@0 x@0)))) (and (=> (= (ControlFlow 0 249) 247) anon595_Then_correct) (=> (= (ControlFlow 0 249) 248) anon595_Else_correct)))))
(let ((anon594_Else_correct  (=> (and (not (and (validChildren Heap@19 arg res@0) (and (validChildren Heap@19 res@0 x@0) (=> (and (< 0 (segLength Heap@19 arg res@0)) (< 0 (segLength Heap@19 res@0 x@0))) (= (segDegree Heap@19 arg res@0 (- (segLength Heap@19 arg res@0) 1)) (+ (segDegree Heap@19 res@0 x@0 0) 1)))))) (= (ControlFlow 0 251) 249)) anon300_correct)))
(let ((anon594_Then_correct  (=> (and (and (and (validChildren Heap@19 arg res@0) (and (validChildren Heap@19 res@0 x@0) (=> (and (< 0 (segLength Heap@19 arg res@0)) (< 0 (segLength Heap@19 res@0 x@0))) (= (segDegree Heap@19 arg res@0 (- (segLength Heap@19 arg res@0) 1)) (+ (segDegree Heap@19 res@0 x@0 0) 1))))) (state ExhaleHeap@2 Mask@34)) (and (validChildren ExhaleHeap@2 arg x@0) (= (ControlFlow 0 250) 249))) anon300_correct)))
(let ((anon593_Else_correct  (=> (not (and (presorted Heap@19 arg res@0) (and (presorted Heap@19 res@0 x@0) (=> (and (< 0 (segLength Heap@19 arg res@0)) (< 0 (segLength Heap@19 res@0 x@0))) (and (<= (segDegree Heap@19 arg res@0 (- (segLength Heap@19 arg res@0) 1)) (segDegree Heap@19 res@0 x@0 0)) (and (=> (and (<= 2 (segLength Heap@19 arg res@0)) (= (segDegree Heap@19 arg res@0 (- (segLength Heap@19 arg res@0) 1)) (segDegree Heap@19 arg res@0 (- (segLength Heap@19 arg res@0) 2)))) (< (segDegree Heap@19 arg res@0 (- (segLength Heap@19 arg res@0) 1)) (segDegree Heap@19 res@0 x@0 0))) (=> (and (<= 2 (segLength Heap@19 res@0 x@0)) (= (segDegree Heap@19 res@0 x@0 0) (segDegree Heap@19 res@0 x@0 1))) (< (segDegree Heap@19 arg res@0 (- (segLength Heap@19 arg res@0) 1)) (segDegree Heap@19 res@0 x@0 0))))))))) (and (=> (= (ControlFlow 0 253) 250) anon594_Then_correct) (=> (= (ControlFlow 0 253) 251) anon594_Else_correct)))))
(let ((anon593_Then_correct  (=> (and (and (presorted Heap@19 arg res@0) (and (presorted Heap@19 res@0 x@0) (=> (and (< 0 (segLength Heap@19 arg res@0)) (< 0 (segLength Heap@19 res@0 x@0))) (and (<= (segDegree Heap@19 arg res@0 (- (segLength Heap@19 arg res@0) 1)) (segDegree Heap@19 res@0 x@0 0)) (and (=> (and (<= 2 (segLength Heap@19 arg res@0)) (= (segDegree Heap@19 arg res@0 (- (segLength Heap@19 arg res@0) 1)) (segDegree Heap@19 arg res@0 (- (segLength Heap@19 arg res@0) 2)))) (< (segDegree Heap@19 arg res@0 (- (segLength Heap@19 arg res@0) 1)) (segDegree Heap@19 res@0 x@0 0))) (=> (and (<= 2 (segLength Heap@19 res@0 x@0)) (= (segDegree Heap@19 res@0 x@0 0) (segDegree Heap@19 res@0 x@0 1))) (< (segDegree Heap@19 arg res@0 (- (segLength Heap@19 arg res@0) 1)) (segDegree Heap@19 res@0 x@0 0)))))))) (and (state ExhaleHeap@2 Mask@34) (presorted ExhaleHeap@2 arg x@0))) (and (=> (= (ControlFlow 0 252) 250) anon594_Then_correct) (=> (= (ControlFlow 0 252) 251) anon594_Else_correct)))))
(let ((anon592_Else_correct  (=> (not (and (sorted Heap@19 arg res@0) (and (sorted Heap@19 res@0 x@0) (=> (and (< 0 (segLength Heap@19 arg res@0)) (< 0 (segLength Heap@19 res@0 x@0))) (< (segDegree Heap@19 arg res@0 (- (segLength Heap@19 arg res@0) 1)) (segDegree Heap@19 res@0 x@0 0)))))) (and (=> (= (ControlFlow 0 255) 252) anon593_Then_correct) (=> (= (ControlFlow 0 255) 253) anon593_Else_correct)))))
(let ((anon592_Then_correct  (=> (and (and (sorted Heap@19 arg res@0) (and (sorted Heap@19 res@0 x@0) (=> (and (< 0 (segLength Heap@19 arg res@0)) (< 0 (segLength Heap@19 res@0 x@0))) (< (segDegree Heap@19 arg res@0 (- (segLength Heap@19 arg res@0) 1)) (segDegree Heap@19 res@0 x@0 0))))) (and (state ExhaleHeap@2 Mask@34) (sorted ExhaleHeap@2 arg x@0))) (and (=> (= (ControlFlow 0 254) 252) anon593_Then_correct) (=> (= (ControlFlow 0 254) 253) anon593_Else_correct)))))
(let ((anon591_Else_correct  (=> (and (= x@0 null) (= Mask@34 Mask@32)) (and (=> (= (ControlFlow 0 257) 254) anon592_Then_correct) (=> (= (ControlFlow 0 257) 255) anon592_Else_correct)))))
(let ((anon591_Then_correct  (=> (and (not (= x@0 null)) (= Mask@33 (MapType1Store Mask@32 null (tree x@0) (real_2_U (+ (U_2_real (MapType1Select Mask@32 null (tree x@0))) FullPerm))))) (=> (and (and (and (state ExhaleHeap@2 Mask@33) (state ExhaleHeap@2 Mask@33)) (and (= (treeDegree ExhaleHeap@2 x@0) (treeDegree Heap@19 x@0)) (state ExhaleHeap@2 Mask@33))) (and (and (= (treeSize ExhaleHeap@2 x@0) (treeSize Heap@19 x@0)) (state ExhaleHeap@2 Mask@33)) (and (= (treeParent ExhaleHeap@2 x@0) (treeParent Heap@19 x@0)) (= Mask@34 Mask@33)))) (and (=> (= (ControlFlow 0 256) 254) anon592_Then_correct) (=> (= (ControlFlow 0 256) 255) anon592_Else_correct))))))
(let ((anon292_correct  (=> (IdenticalOnKnownLocations Heap@19 ExhaleHeap@2 Mask@31) (=> (and (and (and (= Mask@32 (MapType1Store Mask@31 null (heapseg arg x@0) (real_2_U (+ (U_2_real (MapType1Select Mask@31 null (heapseg arg x@0))) FullPerm)))) (state ExhaleHeap@2 Mask@32)) (and (state ExhaleHeap@2 Mask@32) (= (segLength ExhaleHeap@2 arg x@0) (+ (segLength Heap@19 arg res@0) (segLength Heap@19 res@0 x@0))))) (and (and (state ExhaleHeap@2 Mask@32) (forall ((i_5 Int) ) (!  (=> (and (<= 0 i_5) (< i_5 (segLength Heap@19 arg res@0))) (= (segDegree ExhaleHeap@2 arg x@0 i_5) (segDegree Heap@19 arg res@0 i_5)))
 :qid |stdinbpl.6297:34|
 :skolemid |132|
 :pattern ( (|segDegree#frame| (MapType0Select ExhaleHeap@2 null (heapseg arg x@0)) arg x@0 i_5))
 :pattern ( (|segDegree#frame| (MapType0Select Heap@19 null (heapseg arg res@0)) arg res@0 i_5))
))) (and (state ExhaleHeap@2 Mask@32) (forall ((i_1 Int) ) (!  (=> (and (<= (segLength Heap@19 arg res@0) i_1) (< i_1 (segLength ExhaleHeap@2 arg x@0))) (= (segDegree ExhaleHeap@2 arg x@0 i_1) (segDegree Heap@19 res@0 x@0 (- i_1 (segLength Heap@19 arg res@0)))))
 :qid |stdinbpl.6302:34|
 :skolemid |133|
 :pattern ( (|segDegree#frame| (MapType0Select ExhaleHeap@2 null (heapseg arg x@0)) arg x@0 i_1))
))))) (and (=> (= (ControlFlow 0 258) 256) anon591_Then_correct) (=> (= (ControlFlow 0 258) 257) anon591_Else_correct))))))
(let ((anon590_Else_correct  (=> (and (not (and (not (= arg res@0)) (not (= res@0 x@0)))) (= (ControlFlow 0 261) 258)) anon292_correct)))
(let ((anon590_Then_correct  (=> (and (not (= arg res@0)) (not (= res@0 x@0))) (and (=> (= (ControlFlow 0 259) (- 0 260)) (= (segParent Heap@19 arg res@0) (segParent Heap@19 res@0 x@0))) (=> (= (segParent Heap@19 arg res@0) (segParent Heap@19 res@0 x@0)) (=> (= (ControlFlow 0 259) 258) anon292_correct))))))
(let ((anon289_correct  (=> (and (= Mask@30 (MapType1Store Mask@29 null (tree x@0) (real_2_U (- (U_2_real (MapType1Select Mask@29 null (tree x@0))) FullPerm)))) (= Mask@31 Mask@30)) (and (=> (= (ControlFlow 0 263) 259) anon590_Then_correct) (=> (= (ControlFlow 0 263) 261) anon590_Else_correct)))))
(let ((anon589_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 266) 263)) anon289_correct)))
(let ((anon589_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 264) (- 0 265)) (<= FullPerm (U_2_real (MapType1Select Mask@29 null (tree x@0))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@29 null (tree x@0)))) (=> (= (ControlFlow 0 264) 263) anon289_correct))))))
(let ((anon588_Then_correct  (=> (not (= x@0 null)) (and (=> (= (ControlFlow 0 267) 264) anon589_Then_correct) (=> (= (ControlFlow 0 267) 266) anon589_Else_correct)))))
(let ((anon588_Else_correct  (=> (and (= x@0 null) (= Mask@31 Mask@29)) (and (=> (= (ControlFlow 0 262) 259) anon590_Then_correct) (=> (= (ControlFlow 0 262) 261) anon590_Else_correct)))))
(let ((anon286_correct  (=> (= Mask@29 (MapType1Store Mask@28 null (heapseg res@0 x@0) (real_2_U (- (U_2_real (MapType1Select Mask@28 null (heapseg res@0 x@0))) FullPerm)))) (and (=> (= (ControlFlow 0 268) 267) anon588_Then_correct) (=> (= (ControlFlow 0 268) 262) anon588_Else_correct)))))
(let ((anon587_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 271) 268)) anon286_correct)))
(let ((anon587_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 269) (- 0 270)) (<= FullPerm (U_2_real (MapType1Select Mask@28 null (heapseg res@0 x@0))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@28 null (heapseg res@0 x@0)))) (=> (= (ControlFlow 0 269) 268) anon286_correct))))))
(let ((anon284_correct  (=> (= Mask@28 (MapType1Store Mask@27 null (heapseg arg res@0) (real_2_U (- (U_2_real (MapType1Select Mask@27 null (heapseg arg res@0))) FullPerm)))) (and (=> (= (ControlFlow 0 272) 269) anon587_Then_correct) (=> (= (ControlFlow 0 272) 271) anon587_Else_correct)))))
(let ((anon586_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 275) 272)) anon284_correct)))
(let ((anon586_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 273) (- 0 274)) (<= FullPerm (U_2_real (MapType1Select Mask@27 null (heapseg arg res@0))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@27 null (heapseg arg res@0)))) (=> (= (ControlFlow 0 273) 272) anon284_correct))))))
(let ((anon585_Then_correct  (=> (< (treeKey Heap@19 x@0) vmin@1) (and (=> (= (ControlFlow 0 276) 273) anon586_Then_correct) (=> (= (ControlFlow 0 276) 275) anon586_Else_correct)))))
(let ((anon585_Else_correct  (=> (<= vmin@1 (treeKey Heap@19 x@0)) (=> (and (and (= res@1 res@0) (= Heap@27 Heap@19)) (and (= Mask@40 Mask@27) (= (ControlFlow 0 215) 213))) anon322_correct))))
(let ((anon280_correct true))
(let ((anon584_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 54) 51)) anon280_correct)))
(let ((anon584_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 52) (- 0 53)) (<= FullPerm (U_2_real (MapType1Select Mask@27 null (tree x@0))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@27 null (tree x@0)))) (=> (= (ControlFlow 0 52) 51) anon280_correct))))))
(let ((anon277_correct  (=> (and (state Heap@19 Mask@27) (state Heap@19 Mask@27)) (and (and (and (=> (= (ControlFlow 0 277) 276) anon585_Then_correct) (=> (= (ControlFlow 0 277) 215) anon585_Else_correct)) (=> (= (ControlFlow 0 277) 52) anon584_Then_correct)) (=> (= (ControlFlow 0 277) 54) anon584_Else_correct)))))
(let ((anon582_Else_correct  (=> (= (MapType0Select Heap@19 x@0 sibling) null) (=> (and (= Mask@27 Mask@26) (= (ControlFlow 0 280) 277)) anon277_correct))))
(let ((anon582_Then_correct  (=> (not (= (MapType0Select Heap@19 x@0 sibling) null)) (=> (and (and (state Heap@19 Mask@26) (= (treeParent Heap@19 x@0) (segParent Heap@19 (MapType0Select Heap@19 x@0 sibling) null))) (and (= Mask@27 Mask@26) (= (ControlFlow 0 279) 277))) anon277_correct))))
(let ((anon581_Then_correct  (=> (and (not (= x@0 null)) (= Mask@24 (MapType1Store Mask@23 null (tree x@0) (real_2_U (+ (U_2_real (MapType1Select Mask@23 null (tree x@0))) FullPerm))))) (=> (and (and (and (InsidePredicate (heapseg x@0 null) (MapType0Select Heap@19 null (heapseg x@0 null)) (tree x@0) (MapType0Select Heap@19 null (tree x@0))) (state Heap@19 Mask@24)) (and (not (= x@0 null)) (= Mask@25 (MapType1Store Mask@24 x@0 sibling (real_2_U (+ (U_2_real (MapType1Select Mask@24 x@0 sibling)) FullPerm)))))) (and (and (state Heap@19 Mask@25) (= Mask@26 (MapType1Store Mask@25 null (heapseg (MapType0Select Heap@19 x@0 sibling) null) (real_2_U (+ (U_2_real (MapType1Select Mask@25 null (heapseg (MapType0Select Heap@19 x@0 sibling) null))) FullPerm))))) (and (InsidePredicate (heapseg x@0 null) (MapType0Select Heap@19 null (heapseg x@0 null)) (heapseg (MapType0Select Heap@19 x@0 sibling) null) (MapType0Select Heap@19 null (heapseg (MapType0Select Heap@19 x@0 sibling) null))) (state Heap@19 Mask@26)))) (and (=> (= (ControlFlow 0 281) 279) anon582_Then_correct) (=> (= (ControlFlow 0 281) 280) anon582_Else_correct))))))
(let ((anon581_Else_correct  (=> (= x@0 null) (=> (and (= Mask@27 Mask@23) (= (ControlFlow 0 278) 277)) anon277_correct))))
(let ((anon580_Else_correct  (=> (and (HasDirectPerm Mask@23 null (heapseg x@0 null)) (= Heap@19 ExhaleHeap@0)) (and (=> (= (ControlFlow 0 283) 281) anon581_Then_correct) (=> (= (ControlFlow 0 283) 278) anon581_Else_correct)))))
(let ((anon580_Then_correct  (=> (not (HasDirectPerm Mask@23 null (heapseg x@0 null))) (=> (and (= Heap@18 (MapType0Store ExhaleHeap@0 null (heapseg x@0 null) newVersion@0)) (= Heap@19 Heap@18)) (and (=> (= (ControlFlow 0 282) 281) anon581_Then_correct) (=> (= (ControlFlow 0 282) 278) anon581_Else_correct))))))
(let ((anon272_correct  (=> (= Mask@23 (MapType1Store Mask@17 null (heapseg x@0 null) (real_2_U (- (U_2_real (MapType1Select Mask@17 null (heapseg x@0 null))) FullPerm)))) (and (=> (= (ControlFlow 0 284) 282) anon580_Then_correct) (=> (= (ControlFlow 0 284) 283) anon580_Else_correct)))))
(let ((anon579_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 287) 284)) anon272_correct)))
(let ((anon579_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 285) (- 0 286)) (<= FullPerm (U_2_real (MapType1Select Mask@17 null (heapseg x@0 null))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@17 null (heapseg x@0 null)))) (=> (= (ControlFlow 0 285) 284) anon272_correct))))))
(let ((anon270_correct  (=> (and (state ExhaleHeap@0 Mask@17) (not (= x@0 null))) (=> (and (and (state ExhaleHeap@0 Mask@17) (U_2_bool (MapType0Select ExhaleHeap@0 tmp $allocated))) (and (|heapseg#trigger| ExhaleHeap@0 (heapseg x@0 null)) (= (MapType0Select ExhaleHeap@0 null (heapseg x@0 null)) (FrameFragment (ite (not (= x@0 null)) (CombineFrames (MapType0Select ExhaleHeap@0 null (tree x@0)) (CombineFrames (FrameFragment (MapType0Select ExhaleHeap@0 x@0 sibling)) (CombineFrames (MapType0Select ExhaleHeap@0 null (heapseg (MapType0Select ExhaleHeap@0 x@0 sibling) null)) (FrameFragment (ite (not (= (MapType0Select ExhaleHeap@0 x@0 sibling) null)) EmptyFrame EmptyFrame))))) EmptyFrame))))) (and (=> (= (ControlFlow 0 288) 285) anon579_Then_correct) (=> (= (ControlFlow 0 288) 287) anon579_Else_correct))))))
(let ((anon578_Else_correct  (=> (and (= x@0 null) (= (ControlFlow 0 290) 288)) anon270_correct)))
(let ((anon578_Then_correct  (=> (and (and (not (= x@0 null)) (state ExhaleHeap@0 Mask@17)) (and (= (segParent ExhaleHeap@0 x@0 null) (segParent Heap@@61 arg null)) (= (ControlFlow 0 289) 288))) anon270_correct)))
(let ((anon577_Else_correct  (=> (= res@0 x@0) (and (=> (= (ControlFlow 0 292) 289) anon578_Then_correct) (=> (= (ControlFlow 0 292) 290) anon578_Else_correct)))))
(let ((anon577_Then_correct  (=> (not (= res@0 x@0)) (=> (and (state ExhaleHeap@0 Mask@17) (= (segParent ExhaleHeap@0 res@0 x@0) (segParent Heap@@61 arg null))) (and (=> (= (ControlFlow 0 291) 289) anon578_Then_correct) (=> (= (ControlFlow 0 291) 290) anon578_Else_correct))))))
(let ((anon576_Else_correct  (=> (= arg res@0) (and (=> (= (ControlFlow 0 294) 291) anon577_Then_correct) (=> (= (ControlFlow 0 294) 292) anon577_Else_correct)))))
(let ((anon576_Then_correct  (=> (not (= arg res@0)) (=> (and (state ExhaleHeap@0 Mask@17) (= (segParent ExhaleHeap@0 arg res@0) (segParent Heap@@61 arg null))) (and (=> (= (ControlFlow 0 293) 291) anon577_Then_correct) (=> (= (ControlFlow 0 293) 292) anon577_Else_correct))))))
(let ((anon575_Else_correct  (=> (not (and (not (= arg res@0)) (not (= x@0 null)))) (and (=> (= (ControlFlow 0 296) 293) anon576_Then_correct) (=> (= (ControlFlow 0 296) 294) anon576_Else_correct)))))
(let ((anon575_Then_correct  (=> (and (and (not (= arg res@0)) (not (= x@0 null))) (and (state ExhaleHeap@0 Mask@17) (= (segParent ExhaleHeap@0 arg res@0) (segParent ExhaleHeap@0 x@0 null)))) (and (=> (= (ControlFlow 0 295) 293) anon576_Then_correct) (=> (= (ControlFlow 0 295) 294) anon576_Else_correct)))))
(let ((anon574_Else_correct  (=> (not (and (not (= res@0 x@0)) (not (= x@0 null)))) (and (=> (= (ControlFlow 0 298) 295) anon575_Then_correct) (=> (= (ControlFlow 0 298) 296) anon575_Else_correct)))))
(let ((anon574_Then_correct  (=> (and (and (not (= res@0 x@0)) (not (= x@0 null))) (and (state ExhaleHeap@0 Mask@17) (= (segParent ExhaleHeap@0 res@0 x@0) (segParent ExhaleHeap@0 x@0 null)))) (and (=> (= (ControlFlow 0 297) 295) anon575_Then_correct) (=> (= (ControlFlow 0 297) 296) anon575_Else_correct)))))
(let ((anon573_Else_correct  (=> (not (and (not (= arg res@0)) (not (= res@0 x@0)))) (and (=> (= (ControlFlow 0 300) 297) anon574_Then_correct) (=> (= (ControlFlow 0 300) 298) anon574_Else_correct)))))
(let ((anon573_Then_correct  (=> (and (and (not (= arg res@0)) (not (= res@0 x@0))) (and (state ExhaleHeap@0 Mask@17) (= (segParent ExhaleHeap@0 arg res@0) (segParent ExhaleHeap@0 res@0 x@0)))) (and (=> (= (ControlFlow 0 299) 297) anon574_Then_correct) (=> (= (ControlFlow 0 299) 298) anon574_Else_correct)))))
(let ((anon258_correct  (=> (not (= res@0 null)) (=> (and (state ExhaleHeap@0 Mask@17) (= (+ (+ (segSize ExhaleHeap@0 arg res@0) (segSize ExhaleHeap@0 res@0 x@0)) (segSize ExhaleHeap@0 x@0 null)) (segSize Heap@@61 arg null))) (and (=> (= (ControlFlow 0 301) 299) anon573_Then_correct) (=> (= (ControlFlow 0 301) 300) anon573_Else_correct))))))
(let ((anon572_Else_correct  (=> (and (not (and (not (= arg res@0)) (and (= res@0 x@0) (not (= x@0 null))))) (= (ControlFlow 0 303) 301)) anon258_correct)))
(let ((anon572_Then_correct  (=> (and (and (and (not (= arg res@0)) (and (= res@0 x@0) (not (= x@0 null)))) (state ExhaleHeap@0 Mask@17)) (and (< (segDegree ExhaleHeap@0 arg res@0 (- (segLength ExhaleHeap@0 arg res@0) 1)) (segDegree ExhaleHeap@0 x@0 null 0)) (= (ControlFlow 0 302) 301))) anon258_correct)))
(let ((anon571_Else_correct  (=> (not (and (not (= x@0 null)) (not (= res@0 x@0)))) (and (=> (= (ControlFlow 0 305) 302) anon572_Then_correct) (=> (= (ControlFlow 0 305) 303) anon572_Else_correct)))))
(let ((anon571_Then_correct  (=> (and (and (not (= x@0 null)) (not (= res@0 x@0))) (and (state ExhaleHeap@0 Mask@17) (< (segDegree ExhaleHeap@0 res@0 x@0 (- (segLength ExhaleHeap@0 res@0 x@0) 1)) (segDegree ExhaleHeap@0 x@0 null 0)))) (and (=> (= (ControlFlow 0 304) 302) anon572_Then_correct) (=> (= (ControlFlow 0 304) 303) anon572_Else_correct)))))
(let ((anon570_Else_correct  (=> (not (and (not (= arg res@0)) (not (= res@0 x@0)))) (and (=> (= (ControlFlow 0 307) 304) anon571_Then_correct) (=> (= (ControlFlow 0 307) 305) anon571_Else_correct)))))
(let ((anon570_Then_correct  (=> (and (and (not (= arg res@0)) (not (= res@0 x@0))) (and (state ExhaleHeap@0 Mask@17) (< (segDegree ExhaleHeap@0 arg res@0 (- (segLength ExhaleHeap@0 arg res@0) 1)) (segDegree ExhaleHeap@0 res@0 x@0 0)))) (and (=> (= (ControlFlow 0 306) 304) anon571_Then_correct) (=> (= (ControlFlow 0 306) 305) anon571_Else_correct)))))
(let ((anon569_Then_correct  (=> (state ExhaleHeap@0 ZeroMask) (=> (and (and (= Mask@15 (MapType1Store ZeroMask null (heapseg arg res@0) (real_2_U (+ (U_2_real (MapType1Select ZeroMask null (heapseg arg res@0))) FullPerm)))) (state ExhaleHeap@0 Mask@15)) (and (state ExhaleHeap@0 Mask@15) (sorted ExhaleHeap@0 arg res@0))) (=> (and (and (and (= Mask@16 (MapType1Store Mask@15 null (heapseg res@0 x@0) (real_2_U (+ (U_2_real (MapType1Select Mask@15 null (heapseg res@0 x@0))) FullPerm)))) (state ExhaleHeap@0 Mask@16)) (and (state ExhaleHeap@0 Mask@16) (sorted ExhaleHeap@0 res@0 x@0))) (and (and (= Mask@17 (MapType1Store Mask@16 null (heapseg x@0 null) (real_2_U (+ (U_2_real (MapType1Select Mask@16 null (heapseg x@0 null))) FullPerm)))) (state ExhaleHeap@0 Mask@17)) (and (state ExhaleHeap@0 Mask@17) (sorted ExhaleHeap@0 x@0 null)))) (and (=> (= (ControlFlow 0 308) 306) anon570_Then_correct) (=> (= (ControlFlow 0 308) 307) anon570_Else_correct)))))))
(let ((anon441_correct  (=> (= (ControlFlow 0 10) (- 0 9)) (= (segParent ExhaleHeap@0 res@0 null) (segParent Heap@@61 arg null)))))
(let ((anon666_Else_correct  (=> (and (= arg res@0) (= (ControlFlow 0 13) 10)) anon441_correct)))
(let ((anon666_Then_correct  (=> (not (= arg res@0)) (and (=> (= (ControlFlow 0 11) (- 0 12)) (= (segParent ExhaleHeap@0 arg res@0) (segParent Heap@@61 arg null))) (=> (= (segParent ExhaleHeap@0 arg res@0) (segParent Heap@@61 arg null)) (=> (= (ControlFlow 0 11) 10) anon441_correct))))))
(let ((anon439_correct  (and (=> (= (ControlFlow 0 14) (- 0 15)) (= (+ (segSize ExhaleHeap@0 arg res@0) (segSize ExhaleHeap@0 res@0 null)) (segSize Heap@@61 arg null))) (=> (= (+ (segSize ExhaleHeap@0 arg res@0) (segSize ExhaleHeap@0 res@0 null)) (segSize Heap@@61 arg null)) (and (=> (= (ControlFlow 0 14) 11) anon666_Then_correct) (=> (= (ControlFlow 0 14) 13) anon666_Else_correct))))))
(let ((anon665_Else_correct  (=> (and (= arg res@0) (= (ControlFlow 0 18) 14)) anon439_correct)))
(let ((anon665_Then_correct  (=> (not (= arg res@0)) (and (=> (= (ControlFlow 0 16) (- 0 17)) (< (segDegree ExhaleHeap@0 arg res@0 (- (segLength ExhaleHeap@0 arg res@0) 1)) (segDegree ExhaleHeap@0 res@0 null 0))) (=> (< (segDegree ExhaleHeap@0 arg res@0 (- (segLength ExhaleHeap@0 arg res@0) 1)) (segDegree ExhaleHeap@0 res@0 null 0)) (=> (= (ControlFlow 0 16) 14) anon439_correct))))))
(let ((anon437_correct  (=> (= Mask@22 (MapType1Store Mask@21 null (heapseg res@0 null) (real_2_U (- (U_2_real (MapType1Select Mask@21 null (heapseg res@0 null))) FullPerm)))) (and (=> (= (ControlFlow 0 19) (- 0 20)) (sorted ExhaleHeap@0 res@0 null)) (=> (sorted ExhaleHeap@0 res@0 null) (and (=> (= (ControlFlow 0 19) 16) anon665_Then_correct) (=> (= (ControlFlow 0 19) 18) anon665_Else_correct)))))))
(let ((anon664_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 23) 19)) anon437_correct)))
(let ((anon664_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 21) (- 0 22)) (<= FullPerm (U_2_real (MapType1Select Mask@21 null (heapseg res@0 null))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@21 null (heapseg res@0 null)))) (=> (= (ControlFlow 0 21) 19) anon437_correct))))))
(let ((anon435_correct  (=> (= Mask@21 (MapType1Store Mask@20 null (heapseg arg res@0) (real_2_U (- (U_2_real (MapType1Select Mask@20 null (heapseg arg res@0))) FullPerm)))) (and (=> (= (ControlFlow 0 24) (- 0 25)) (sorted ExhaleHeap@0 arg res@0)) (=> (sorted ExhaleHeap@0 arg res@0) (and (=> (= (ControlFlow 0 24) 21) anon664_Then_correct) (=> (= (ControlFlow 0 24) 23) anon664_Else_correct)))))))
(let ((anon663_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 28) 24)) anon435_correct)))
(let ((anon663_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 26) (- 0 27)) (<= FullPerm (U_2_real (MapType1Select Mask@20 null (heapseg arg res@0))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@20 null (heapseg arg res@0)))) (=> (= (ControlFlow 0 26) 24) anon435_correct))))))
(let ((anon433_correct  (=> (and (state ExhaleHeap@0 Mask@20) (state ExhaleHeap@0 Mask@20)) (and (=> (= (ControlFlow 0 29) (- 0 30)) (not (= res@0 null))) (=> (not (= res@0 null)) (and (=> (= (ControlFlow 0 29) 26) anon663_Then_correct) (=> (= (ControlFlow 0 29) 28) anon663_Else_correct)))))))
(let ((anon662_Else_correct  (=> (and (= x@0 null) (= (ControlFlow 0 32) 29)) anon433_correct)))
(let ((anon662_Then_correct  (=> (and (and (not (= x@0 null)) (state ExhaleHeap@0 Mask@20)) (and (= (segParent ExhaleHeap@0 x@0 null) (segParent Heap@@61 arg null)) (= (ControlFlow 0 31) 29))) anon433_correct)))
(let ((anon661_Else_correct  (=> (= res@0 x@0) (and (=> (= (ControlFlow 0 34) 31) anon662_Then_correct) (=> (= (ControlFlow 0 34) 32) anon662_Else_correct)))))
(let ((anon661_Then_correct  (=> (not (= res@0 x@0)) (=> (and (state ExhaleHeap@0 Mask@20) (= (segParent ExhaleHeap@0 res@0 x@0) (segParent Heap@@61 arg null))) (and (=> (= (ControlFlow 0 33) 31) anon662_Then_correct) (=> (= (ControlFlow 0 33) 32) anon662_Else_correct))))))
(let ((anon660_Else_correct  (=> (= arg res@0) (and (=> (= (ControlFlow 0 36) 33) anon661_Then_correct) (=> (= (ControlFlow 0 36) 34) anon661_Else_correct)))))
(let ((anon660_Then_correct  (=> (not (= arg res@0)) (=> (and (state ExhaleHeap@0 Mask@20) (= (segParent ExhaleHeap@0 arg res@0) (segParent Heap@@61 arg null))) (and (=> (= (ControlFlow 0 35) 33) anon661_Then_correct) (=> (= (ControlFlow 0 35) 34) anon661_Else_correct))))))
(let ((anon659_Else_correct  (=> (not (and (not (= arg res@0)) (not (= x@0 null)))) (and (=> (= (ControlFlow 0 38) 35) anon660_Then_correct) (=> (= (ControlFlow 0 38) 36) anon660_Else_correct)))))
(let ((anon659_Then_correct  (=> (and (and (not (= arg res@0)) (not (= x@0 null))) (and (state ExhaleHeap@0 Mask@20) (= (segParent ExhaleHeap@0 arg res@0) (segParent ExhaleHeap@0 x@0 null)))) (and (=> (= (ControlFlow 0 37) 35) anon660_Then_correct) (=> (= (ControlFlow 0 37) 36) anon660_Else_correct)))))
(let ((anon658_Else_correct  (=> (not (and (not (= res@0 x@0)) (not (= x@0 null)))) (and (=> (= (ControlFlow 0 40) 37) anon659_Then_correct) (=> (= (ControlFlow 0 40) 38) anon659_Else_correct)))))
(let ((anon658_Then_correct  (=> (and (and (not (= res@0 x@0)) (not (= x@0 null))) (and (state ExhaleHeap@0 Mask@20) (= (segParent ExhaleHeap@0 res@0 x@0) (segParent ExhaleHeap@0 x@0 null)))) (and (=> (= (ControlFlow 0 39) 37) anon659_Then_correct) (=> (= (ControlFlow 0 39) 38) anon659_Else_correct)))))
(let ((anon657_Else_correct  (=> (not (and (not (= arg res@0)) (not (= res@0 x@0)))) (and (=> (= (ControlFlow 0 42) 39) anon658_Then_correct) (=> (= (ControlFlow 0 42) 40) anon658_Else_correct)))))
(let ((anon657_Then_correct  (=> (and (and (not (= arg res@0)) (not (= res@0 x@0))) (and (state ExhaleHeap@0 Mask@20) (= (segParent ExhaleHeap@0 arg res@0) (segParent ExhaleHeap@0 res@0 x@0)))) (and (=> (= (ControlFlow 0 41) 39) anon658_Then_correct) (=> (= (ControlFlow 0 41) 40) anon658_Else_correct)))))
(let ((anon421_correct  (=> (not (= res@0 null)) (=> (and (state ExhaleHeap@0 Mask@20) (= (+ (+ (segSize ExhaleHeap@0 arg res@0) (segSize ExhaleHeap@0 res@0 x@0)) (segSize ExhaleHeap@0 x@0 null)) (segSize Heap@@61 arg null))) (and (=> (= (ControlFlow 0 43) 41) anon657_Then_correct) (=> (= (ControlFlow 0 43) 42) anon657_Else_correct))))))
(let ((anon656_Else_correct  (=> (and (not (and (not (= arg res@0)) (and (= res@0 x@0) (not (= x@0 null))))) (= (ControlFlow 0 45) 43)) anon421_correct)))
(let ((anon656_Then_correct  (=> (and (and (and (not (= arg res@0)) (and (= res@0 x@0) (not (= x@0 null)))) (state ExhaleHeap@0 Mask@20)) (and (< (segDegree ExhaleHeap@0 arg res@0 (- (segLength ExhaleHeap@0 arg res@0) 1)) (segDegree ExhaleHeap@0 x@0 null 0)) (= (ControlFlow 0 44) 43))) anon421_correct)))
(let ((anon655_Else_correct  (=> (not (and (not (= x@0 null)) (not (= res@0 x@0)))) (and (=> (= (ControlFlow 0 47) 44) anon656_Then_correct) (=> (= (ControlFlow 0 47) 45) anon656_Else_correct)))))
(let ((anon655_Then_correct  (=> (and (and (not (= x@0 null)) (not (= res@0 x@0))) (and (state ExhaleHeap@0 Mask@20) (< (segDegree ExhaleHeap@0 res@0 x@0 (- (segLength ExhaleHeap@0 res@0 x@0) 1)) (segDegree ExhaleHeap@0 x@0 null 0)))) (and (=> (= (ControlFlow 0 46) 44) anon656_Then_correct) (=> (= (ControlFlow 0 46) 45) anon656_Else_correct)))))
(let ((anon654_Else_correct  (=> (not (and (not (= arg res@0)) (not (= res@0 x@0)))) (and (=> (= (ControlFlow 0 49) 46) anon655_Then_correct) (=> (= (ControlFlow 0 49) 47) anon655_Else_correct)))))
(let ((anon654_Then_correct  (=> (and (and (not (= arg res@0)) (not (= res@0 x@0))) (and (state ExhaleHeap@0 Mask@20) (< (segDegree ExhaleHeap@0 arg res@0 (- (segLength ExhaleHeap@0 arg res@0) 1)) (segDegree ExhaleHeap@0 res@0 x@0 0)))) (and (=> (= (ControlFlow 0 48) 46) anon655_Then_correct) (=> (= (ControlFlow 0 48) 47) anon655_Else_correct)))))
(let ((anon569_Else_correct  (=> (and (not (not (= x@0 null))) (state ExhaleHeap@0 Mask@13)) (=> (and (and (= Mask@18 (MapType1Store Mask@13 null (heapseg arg res@0) (real_2_U (+ (U_2_real (MapType1Select Mask@13 null (heapseg arg res@0))) FullPerm)))) (state ExhaleHeap@0 Mask@18)) (and (state ExhaleHeap@0 Mask@18) (sorted ExhaleHeap@0 arg res@0))) (=> (and (and (and (= Mask@19 (MapType1Store Mask@18 null (heapseg res@0 x@0) (real_2_U (+ (U_2_real (MapType1Select Mask@18 null (heapseg res@0 x@0))) FullPerm)))) (state ExhaleHeap@0 Mask@19)) (and (state ExhaleHeap@0 Mask@19) (sorted ExhaleHeap@0 res@0 x@0))) (and (and (= Mask@20 (MapType1Store Mask@19 null (heapseg x@0 null) (real_2_U (+ (U_2_real (MapType1Select Mask@19 null (heapseg x@0 null))) FullPerm)))) (state ExhaleHeap@0 Mask@20)) (and (state ExhaleHeap@0 Mask@20) (sorted ExhaleHeap@0 x@0 null)))) (and (=> (= (ControlFlow 0 50) 48) anon654_Then_correct) (=> (= (ControlFlow 0 50) 49) anon654_Else_correct)))))))
(let ((anon119_correct  (=> (IdenticalOnKnownLocations Heap@17 ExhaleHeap@0 Mask@13) (=> (and (U_2_bool (MapType0Select ExhaleHeap@0 x@0 $allocated)) (U_2_bool (MapType0Select ExhaleHeap@0 res@0 $allocated))) (and (and (=> (= (ControlFlow 0 483) 482) anon503_Then_correct) (=> (= (ControlFlow 0 483) 308) anon569_Then_correct)) (=> (= (ControlFlow 0 483) 50) anon569_Else_correct))))))
(let ((anon502_Else_correct  (=> (and (= arg null) (= (ControlFlow 0 486) 483)) anon119_correct)))
(let ((anon502_Then_correct  (=> (not (= arg null)) (and (=> (= (ControlFlow 0 484) (- 0 485)) (= (segParent Heap@17 arg null) (segParent Heap@@61 arg null))) (=> (= (segParent Heap@17 arg null) (segParent Heap@@61 arg null)) (=> (= (ControlFlow 0 484) 483) anon119_correct))))))
(let ((anon501_Else_correct  (=> (= arg arg) (and (=> (= (ControlFlow 0 489) 484) anon502_Then_correct) (=> (= (ControlFlow 0 489) 486) anon502_Else_correct)))))
(let ((anon501_Then_correct  (=> (not (= arg arg)) (and (=> (= (ControlFlow 0 487) (- 0 488)) (= (segParent Heap@17 arg arg) (segParent Heap@@61 arg null))) (=> (= (segParent Heap@17 arg arg) (segParent Heap@@61 arg null)) (and (=> (= (ControlFlow 0 487) 484) anon502_Then_correct) (=> (= (ControlFlow 0 487) 486) anon502_Else_correct)))))))
(let ((anon500_Else_correct  (=> (= arg arg) (and (=> (= (ControlFlow 0 492) 487) anon501_Then_correct) (=> (= (ControlFlow 0 492) 489) anon501_Else_correct)))))
(let ((anon500_Then_correct  (=> (not (= arg arg)) (and (=> (= (ControlFlow 0 490) (- 0 491)) (= (segParent Heap@17 arg arg) (segParent Heap@@61 arg null))) (=> (= (segParent Heap@17 arg arg) (segParent Heap@@61 arg null)) (and (=> (= (ControlFlow 0 490) 487) anon501_Then_correct) (=> (= (ControlFlow 0 490) 489) anon501_Else_correct)))))))
(let ((anon499_Else_correct  (=> (not (and (not (= arg arg)) (not (= arg null)))) (and (=> (= (ControlFlow 0 495) 490) anon500_Then_correct) (=> (= (ControlFlow 0 495) 492) anon500_Else_correct)))))
(let ((anon499_Then_correct  (=> (and (not (= arg arg)) (not (= arg null))) (and (=> (= (ControlFlow 0 493) (- 0 494)) (= (segParent Heap@17 arg arg) (segParent Heap@17 arg null))) (=> (= (segParent Heap@17 arg arg) (segParent Heap@17 arg null)) (and (=> (= (ControlFlow 0 493) 490) anon500_Then_correct) (=> (= (ControlFlow 0 493) 492) anon500_Else_correct)))))))
(let ((anon498_Else_correct  (=> (not (and (not (= arg arg)) (not (= arg null)))) (and (=> (= (ControlFlow 0 498) 493) anon499_Then_correct) (=> (= (ControlFlow 0 498) 495) anon499_Else_correct)))))
(let ((anon498_Then_correct  (=> (and (not (= arg arg)) (not (= arg null))) (and (=> (= (ControlFlow 0 496) (- 0 497)) (= (segParent Heap@17 arg arg) (segParent Heap@17 arg null))) (=> (= (segParent Heap@17 arg arg) (segParent Heap@17 arg null)) (and (=> (= (ControlFlow 0 496) 493) anon499_Then_correct) (=> (= (ControlFlow 0 496) 495) anon499_Else_correct)))))))
(let ((anon497_Else_correct  (=> (not (and (not (= arg arg)) (not (= arg arg)))) (and (=> (= (ControlFlow 0 501) 496) anon498_Then_correct) (=> (= (ControlFlow 0 501) 498) anon498_Else_correct)))))
(let ((anon497_Then_correct  (=> (and (not (= arg arg)) (not (= arg arg))) (and (=> (= (ControlFlow 0 499) (- 0 500)) (= (segParent Heap@17 arg arg) (segParent Heap@17 arg arg))) (=> (= (segParent Heap@17 arg arg) (segParent Heap@17 arg arg)) (and (=> (= (ControlFlow 0 499) 496) anon498_Then_correct) (=> (= (ControlFlow 0 499) 498) anon498_Else_correct)))))))
(let ((anon107_correct  (and (=> (= (ControlFlow 0 502) (- 0 504)) (not (= arg null))) (=> (not (= arg null)) (and (=> (= (ControlFlow 0 502) (- 0 503)) (= (+ (+ (segSize Heap@17 arg arg) (segSize Heap@17 arg arg)) (segSize Heap@17 arg null)) (segSize Heap@@61 arg null))) (=> (= (+ (+ (segSize Heap@17 arg arg) (segSize Heap@17 arg arg)) (segSize Heap@17 arg null)) (segSize Heap@@61 arg null)) (and (=> (= (ControlFlow 0 502) 499) anon497_Then_correct) (=> (= (ControlFlow 0 502) 501) anon497_Else_correct))))))))
(let ((anon496_Else_correct  (=> (and (not (and (not (= arg arg)) (and (= arg arg) (not (= arg null))))) (= (ControlFlow 0 507) 502)) anon107_correct)))
(let ((anon496_Then_correct  (=> (and (not (= arg arg)) (and (= arg arg) (not (= arg null)))) (and (=> (= (ControlFlow 0 505) (- 0 506)) (< (segDegree Heap@17 arg arg (- (segLength Heap@17 arg arg) 1)) (segDegree Heap@17 arg null 0))) (=> (< (segDegree Heap@17 arg arg (- (segLength Heap@17 arg arg) 1)) (segDegree Heap@17 arg null 0)) (=> (= (ControlFlow 0 505) 502) anon107_correct))))))
(let ((anon495_Else_correct  (=> (not (and (not (= arg null)) (not (= arg arg)))) (and (=> (= (ControlFlow 0 510) 505) anon496_Then_correct) (=> (= (ControlFlow 0 510) 507) anon496_Else_correct)))))
(let ((anon495_Then_correct  (=> (and (not (= arg null)) (not (= arg arg))) (and (=> (= (ControlFlow 0 508) (- 0 509)) (< (segDegree Heap@17 arg arg (- (segLength Heap@17 arg arg) 1)) (segDegree Heap@17 arg null 0))) (=> (< (segDegree Heap@17 arg arg (- (segLength Heap@17 arg arg) 1)) (segDegree Heap@17 arg null 0)) (and (=> (= (ControlFlow 0 508) 505) anon496_Then_correct) (=> (= (ControlFlow 0 508) 507) anon496_Else_correct)))))))
(let ((anon494_Else_correct  (=> (not (and (not (= arg arg)) (not (= arg arg)))) (and (=> (= (ControlFlow 0 513) 508) anon495_Then_correct) (=> (= (ControlFlow 0 513) 510) anon495_Else_correct)))))
(let ((anon494_Then_correct  (=> (and (not (= arg arg)) (not (= arg arg))) (and (=> (= (ControlFlow 0 511) (- 0 512)) (< (segDegree Heap@17 arg arg (- (segLength Heap@17 arg arg) 1)) (segDegree Heap@17 arg arg 0))) (=> (< (segDegree Heap@17 arg arg (- (segLength Heap@17 arg arg) 1)) (segDegree Heap@17 arg arg 0)) (and (=> (= (ControlFlow 0 511) 508) anon495_Then_correct) (=> (= (ControlFlow 0 511) 510) anon495_Else_correct)))))))
(let ((anon101_correct  (=> (= Mask@13 (MapType1Store Mask@12 null (heapseg arg null) (real_2_U (- (U_2_real (MapType1Select Mask@12 null (heapseg arg null))) FullPerm)))) (and (=> (= (ControlFlow 0 514) (- 0 515)) (sorted Heap@17 arg null)) (=> (sorted Heap@17 arg null) (and (=> (= (ControlFlow 0 514) 511) anon494_Then_correct) (=> (= (ControlFlow 0 514) 513) anon494_Else_correct)))))))
(let ((anon493_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 518) 514)) anon101_correct)))
(let ((anon493_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 516) (- 0 517)) (<= FullPerm (U_2_real (MapType1Select Mask@12 null (heapseg arg null))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@12 null (heapseg arg null)))) (=> (= (ControlFlow 0 516) 514) anon101_correct))))))
(let ((anon99_correct  (=> (= Mask@12 (MapType1Store Mask@11 null (heapseg arg arg) (real_2_U (- (U_2_real (MapType1Select Mask@11 null (heapseg arg arg))) FullPerm)))) (and (=> (= (ControlFlow 0 519) (- 0 520)) (sorted Heap@17 arg arg)) (=> (sorted Heap@17 arg arg) (and (=> (= (ControlFlow 0 519) 516) anon493_Then_correct) (=> (= (ControlFlow 0 519) 518) anon493_Else_correct)))))))
(let ((anon492_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 523) 519)) anon99_correct)))
(let ((anon492_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 521) (- 0 522)) (<= FullPerm (U_2_real (MapType1Select Mask@11 null (heapseg arg arg))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@11 null (heapseg arg arg)))) (=> (= (ControlFlow 0 521) 519) anon99_correct))))))
(let ((anon97_correct  (=> (= Mask@11 (MapType1Store Mask@10 null (heapseg arg arg) (real_2_U (- (U_2_real (MapType1Select Mask@10 null (heapseg arg arg))) FullPerm)))) (and (=> (= (ControlFlow 0 524) (- 0 525)) (sorted Heap@17 arg arg)) (=> (sorted Heap@17 arg arg) (and (=> (= (ControlFlow 0 524) 521) anon492_Then_correct) (=> (= (ControlFlow 0 524) 523) anon492_Else_correct)))))))
(let ((anon491_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 528) 524)) anon97_correct)))
(let ((anon491_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 526) (- 0 527)) (<= FullPerm (U_2_real (MapType1Select Mask@10 null (heapseg arg arg))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@10 null (heapseg arg arg)))) (=> (= (ControlFlow 0 526) 524) anon97_correct))))))
(let ((anon95_correct  (=> (and (state Heap@17 Mask@10) (state Heap@17 Mask@10)) (and (=> (= (ControlFlow 0 529) 526) anon491_Then_correct) (=> (= (ControlFlow 0 529) 528) anon491_Else_correct)))))
(let ((anon490_Else_correct  (=> (= arg arg) (=> (and (= Heap@17 Heap@13) (= (ControlFlow 0 531) 529)) anon95_correct))))
(let ((anon490_Then_correct  (=> (and (and (and (not (= arg arg)) (forall ((o_38 T@U) (f_42 T@U) ) (! (let ((B@@19 (FieldTypeInv1 (type f_42))))
(let ((A@@20 (FieldTypeInv0 (type f_42))))
 (=> (and (and (= (type o_38) RefType) (= (type f_42) (FieldType A@@20 B@@19))) (or (U_2_bool (MapType1Select (MapType0Select Heap@13 null (|heapseg#sm| arg arg)) o_38 f_42)) (U_2_bool (MapType1Select (MapType0Select Heap@13 null (|tree#sm| arg)) o_38 f_42)))) (U_2_bool (MapType1Select newPMask@4 o_38 f_42)))))
 :qid |stdinbpl.5420:29|
 :skolemid |130|
 :pattern ( (MapType1Select newPMask@4 o_38 f_42))
))) (and (= Heap@14 (MapType0Store Heap@13 null (|heapseg#sm| arg arg) newPMask@4)) (= Heap@15 (MapType0Store Heap@14 null (|heapseg#sm| arg arg) (MapType1Store (MapType0Select Heap@14 null (|heapseg#sm| arg arg)) arg sibling (bool_2_U true)))))) (and (and (forall ((o_39 T@U) (f_43 T@U) ) (! (let ((B@@20 (FieldTypeInv1 (type f_43))))
(let ((A@@21 (FieldTypeInv0 (type f_43))))
 (=> (and (and (= (type o_39) RefType) (= (type f_43) (FieldType A@@21 B@@20))) (or (U_2_bool (MapType1Select (MapType0Select Heap@15 null (|heapseg#sm| arg arg)) o_39 f_43)) (U_2_bool (MapType1Select (MapType0Select Heap@15 null (|heapseg#sm| (MapType0Select Heap@15 arg sibling) arg)) o_39 f_43)))) (U_2_bool (MapType1Select newPMask@5 o_39 f_43)))))
 :qid |stdinbpl.5427:29|
 :skolemid |131|
 :pattern ( (MapType1Select newPMask@5 o_39 f_43))
)) (= Heap@16 (MapType0Store Heap@15 null (|heapseg#sm| arg arg) newPMask@5))) (and (= Heap@17 Heap@16) (= (ControlFlow 0 530) 529)))) anon95_correct)))
(let ((anon489_Else_correct  (=> (and (HasDirectPerm Mask@10 null (heapseg arg arg)) (= Heap@13 Heap@10)) (and (=> (= (ControlFlow 0 533) 530) anon490_Then_correct) (=> (= (ControlFlow 0 533) 531) anon490_Else_correct)))))
(let ((anon489_Then_correct  (=> (and (and (not (HasDirectPerm Mask@10 null (heapseg arg arg))) (= Heap@11 (MapType0Store Heap@10 null (|heapseg#sm| arg arg) ZeroPMask))) (and (= Heap@12 (MapType0Store Heap@11 null (heapseg arg arg) freshVersion@1)) (= Heap@13 Heap@12))) (and (=> (= (ControlFlow 0 532) 530) anon490_Then_correct) (=> (= (ControlFlow 0 532) 531) anon490_Else_correct)))))
(let ((anon91_correct  (=> (= Mask@10 (MapType1Store Mask@9 null (heapseg arg arg) (real_2_U (+ (U_2_real (MapType1Select Mask@9 null (heapseg arg arg))) FullPerm)))) (=> (and (and (state Heap@10 Mask@10) (state Heap@10 Mask@10)) (and (|heapseg#trigger| Heap@10 (heapseg arg arg)) (= (MapType0Select Heap@10 null (heapseg arg arg)) (FrameFragment (ite (not (= arg arg)) (CombineFrames (MapType0Select Heap@10 null (tree arg)) (CombineFrames (FrameFragment (MapType0Select Heap@10 arg sibling)) (CombineFrames (MapType0Select Heap@10 null (heapseg (MapType0Select Heap@10 arg sibling) arg)) (FrameFragment (ite (not (= (MapType0Select Heap@10 arg sibling) arg)) EmptyFrame EmptyFrame))))) EmptyFrame))))) (and (=> (= (ControlFlow 0 534) 532) anon489_Then_correct) (=> (= (ControlFlow 0 534) 533) anon489_Else_correct))))))
(let ((anon488_Else_correct  (=> (= (MapType0Select Heap@10 arg sibling) arg) (=> (and (= Mask@9 Mask@8) (= (ControlFlow 0 538) 534)) anon91_correct))))
(let ((anon488_Then_correct  (=> (not (= (MapType0Select Heap@10 arg sibling) arg)) (and (=> (= (ControlFlow 0 536) (- 0 537)) (= (treeParent Heap@10 arg) (segParent Heap@10 (MapType0Select Heap@10 arg sibling) arg))) (=> (= (treeParent Heap@10 arg) (segParent Heap@10 (MapType0Select Heap@10 arg sibling) arg)) (=> (and (= Mask@9 Mask@8) (= (ControlFlow 0 536) 534)) anon91_correct))))))
(let ((anon89_correct  (=> (and (= Mask@8 (MapType1Store Mask@7 null (heapseg (MapType0Select Heap@10 arg sibling) arg) (real_2_U (- (U_2_real (MapType1Select Mask@7 null (heapseg (MapType0Select Heap@10 arg sibling) arg))) FullPerm)))) (InsidePredicate (heapseg arg arg) (MapType0Select Heap@10 null (heapseg arg arg)) (heapseg (MapType0Select Heap@10 arg sibling) arg) (MapType0Select Heap@10 null (heapseg (MapType0Select Heap@10 arg sibling) arg)))) (and (=> (= (ControlFlow 0 539) 536) anon488_Then_correct) (=> (= (ControlFlow 0 539) 538) anon488_Else_correct)))))
(let ((anon487_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 542) 539)) anon89_correct)))
(let ((anon487_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 540) (- 0 541)) (<= FullPerm (U_2_real (MapType1Select Mask@7 null (heapseg (MapType0Select Heap@10 arg sibling) arg))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@7 null (heapseg (MapType0Select Heap@10 arg sibling) arg)))) (=> (= (ControlFlow 0 540) 539) anon89_correct))))))
(let ((anon87_correct  (=> (= Mask@7 (MapType1Store Mask@6 arg sibling (real_2_U (- (U_2_real (MapType1Select Mask@6 arg sibling)) FullPerm)))) (and (=> (= (ControlFlow 0 543) 540) anon487_Then_correct) (=> (= (ControlFlow 0 543) 542) anon487_Else_correct)))))
(let ((anon486_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 546) 543)) anon87_correct)))
(let ((anon486_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 544) (- 0 545)) (<= FullPerm (U_2_real (MapType1Select Mask@6 arg sibling)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@6 arg sibling))) (=> (= (ControlFlow 0 544) 543) anon87_correct))))))
(let ((anon85_correct  (=> (and (= Mask@6 (MapType1Store Mask@5 null (tree arg) (real_2_U (- (U_2_real (MapType1Select Mask@5 null (tree arg))) FullPerm)))) (InsidePredicate (heapseg arg arg) (MapType0Select Heap@10 null (heapseg arg arg)) (tree arg) (MapType0Select Heap@10 null (tree arg)))) (and (=> (= (ControlFlow 0 547) 544) anon486_Then_correct) (=> (= (ControlFlow 0 547) 546) anon486_Else_correct)))))
(let ((anon485_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 550) 547)) anon85_correct)))
(let ((anon485_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 548) (- 0 549)) (<= FullPerm (U_2_real (MapType1Select Mask@5 null (tree arg))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@5 null (tree arg)))) (=> (= (ControlFlow 0 548) 547) anon85_correct))))))
(let ((anon484_Then_correct  (=> (not (= arg arg)) (and (=> (= (ControlFlow 0 551) 548) anon485_Then_correct) (=> (= (ControlFlow 0 551) 550) anon485_Else_correct)))))
(let ((anon484_Else_correct  (=> (= arg arg) (=> (and (= Mask@9 Mask@5) (= (ControlFlow 0 535) 534)) anon91_correct))))
(let ((anon82_correct  (=> (and (state Heap@10 Mask@5) (state Heap@10 Mask@5)) (and (=> (= (ControlFlow 0 552) 551) anon484_Then_correct) (=> (= (ControlFlow 0 552) 535) anon484_Else_correct)))))
(let ((anon483_Else_correct  (=> (= arg arg) (=> (and (= Heap@10 Heap@6) (= (ControlFlow 0 554) 552)) anon82_correct))))
(let ((anon483_Then_correct  (=> (and (and (and (not (= arg arg)) (forall ((o_36 T@U) (f_40 T@U) ) (! (let ((B@@21 (FieldTypeInv1 (type f_40))))
(let ((A@@22 (FieldTypeInv0 (type f_40))))
 (=> (and (and (= (type o_36) RefType) (= (type f_40) (FieldType A@@22 B@@21))) (or (U_2_bool (MapType1Select (MapType0Select Heap@6 null (|heapseg#sm| arg arg)) o_36 f_40)) (U_2_bool (MapType1Select (MapType0Select Heap@6 null (|tree#sm| arg)) o_36 f_40)))) (U_2_bool (MapType1Select newPMask@2 o_36 f_40)))))
 :qid |stdinbpl.5358:29|
 :skolemid |128|
 :pattern ( (MapType1Select newPMask@2 o_36 f_40))
))) (and (= Heap@7 (MapType0Store Heap@6 null (|heapseg#sm| arg arg) newPMask@2)) (= Heap@8 (MapType0Store Heap@7 null (|heapseg#sm| arg arg) (MapType1Store (MapType0Select Heap@7 null (|heapseg#sm| arg arg)) arg sibling (bool_2_U true)))))) (and (and (forall ((o_37 T@U) (f_41 T@U) ) (! (let ((B@@22 (FieldTypeInv1 (type f_41))))
(let ((A@@23 (FieldTypeInv0 (type f_41))))
 (=> (and (and (= (type o_37) RefType) (= (type f_41) (FieldType A@@23 B@@22))) (or (U_2_bool (MapType1Select (MapType0Select Heap@8 null (|heapseg#sm| arg arg)) o_37 f_41)) (U_2_bool (MapType1Select (MapType0Select Heap@8 null (|heapseg#sm| (MapType0Select Heap@8 arg sibling) arg)) o_37 f_41)))) (U_2_bool (MapType1Select newPMask@3 o_37 f_41)))))
 :qid |stdinbpl.5365:29|
 :skolemid |129|
 :pattern ( (MapType1Select newPMask@3 o_37 f_41))
)) (= Heap@9 (MapType0Store Heap@8 null (|heapseg#sm| arg arg) newPMask@3))) (and (= Heap@10 Heap@9) (= (ControlFlow 0 553) 552)))) anon82_correct)))
(let ((anon482_Else_correct  (=> (and (HasDirectPerm Mask@5 null (heapseg arg arg)) (= Heap@6 Heap@3)) (and (=> (= (ControlFlow 0 556) 553) anon483_Then_correct) (=> (= (ControlFlow 0 556) 554) anon483_Else_correct)))))
(let ((anon482_Then_correct  (=> (and (and (not (HasDirectPerm Mask@5 null (heapseg arg arg))) (= Heap@4 (MapType0Store Heap@3 null (|heapseg#sm| arg arg) ZeroPMask))) (and (= Heap@5 (MapType0Store Heap@4 null (heapseg arg arg) freshVersion@0)) (= Heap@6 Heap@5))) (and (=> (= (ControlFlow 0 555) 553) anon483_Then_correct) (=> (= (ControlFlow 0 555) 554) anon483_Else_correct)))))
(let ((anon78_correct  (=> (= Mask@5 (MapType1Store Mask@4 null (heapseg arg arg) (real_2_U (+ (U_2_real (MapType1Select Mask@4 null (heapseg arg arg))) FullPerm)))) (=> (and (and (state Heap@3 Mask@5) (state Heap@3 Mask@5)) (and (|heapseg#trigger| Heap@3 (heapseg arg arg)) (= (MapType0Select Heap@3 null (heapseg arg arg)) (FrameFragment (ite (not (= arg arg)) (CombineFrames (MapType0Select Heap@3 null (tree arg)) (CombineFrames (FrameFragment (MapType0Select Heap@3 arg sibling)) (CombineFrames (MapType0Select Heap@3 null (heapseg (MapType0Select Heap@3 arg sibling) arg)) (FrameFragment (ite (not (= (MapType0Select Heap@3 arg sibling) arg)) EmptyFrame EmptyFrame))))) EmptyFrame))))) (and (=> (= (ControlFlow 0 557) 555) anon482_Then_correct) (=> (= (ControlFlow 0 557) 556) anon482_Else_correct))))))
(let ((anon481_Else_correct  (=> (= (MapType0Select Heap@3 arg sibling) arg) (=> (and (= Mask@4 Mask@3) (= (ControlFlow 0 561) 557)) anon78_correct))))
(let ((anon481_Then_correct  (=> (not (= (MapType0Select Heap@3 arg sibling) arg)) (and (=> (= (ControlFlow 0 559) (- 0 560)) (= (treeParent Heap@3 arg) (segParent Heap@3 (MapType0Select Heap@3 arg sibling) arg))) (=> (= (treeParent Heap@3 arg) (segParent Heap@3 (MapType0Select Heap@3 arg sibling) arg)) (=> (and (= Mask@4 Mask@3) (= (ControlFlow 0 559) 557)) anon78_correct))))))
(let ((anon76_correct  (=> (and (= Mask@3 (MapType1Store Mask@2 null (heapseg (MapType0Select Heap@3 arg sibling) arg) (real_2_U (- (U_2_real (MapType1Select Mask@2 null (heapseg (MapType0Select Heap@3 arg sibling) arg))) FullPerm)))) (InsidePredicate (heapseg arg arg) (MapType0Select Heap@3 null (heapseg arg arg)) (heapseg (MapType0Select Heap@3 arg sibling) arg) (MapType0Select Heap@3 null (heapseg (MapType0Select Heap@3 arg sibling) arg)))) (and (=> (= (ControlFlow 0 562) 559) anon481_Then_correct) (=> (= (ControlFlow 0 562) 561) anon481_Else_correct)))))
(let ((anon480_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 565) 562)) anon76_correct)))
(let ((anon480_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 563) (- 0 564)) (<= FullPerm (U_2_real (MapType1Select Mask@2 null (heapseg (MapType0Select Heap@3 arg sibling) arg))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@2 null (heapseg (MapType0Select Heap@3 arg sibling) arg)))) (=> (= (ControlFlow 0 563) 562) anon76_correct))))))
(let ((anon74_correct  (=> (= Mask@2 (MapType1Store Mask@1 arg sibling (real_2_U (- (U_2_real (MapType1Select Mask@1 arg sibling)) FullPerm)))) (and (=> (= (ControlFlow 0 566) 563) anon480_Then_correct) (=> (= (ControlFlow 0 566) 565) anon480_Else_correct)))))
(let ((anon479_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 569) 566)) anon74_correct)))
(let ((anon479_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 567) (- 0 568)) (<= FullPerm (U_2_real (MapType1Select Mask@1 arg sibling)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@1 arg sibling))) (=> (= (ControlFlow 0 567) 566) anon74_correct))))))
(let ((anon72_correct  (=> (and (= Mask@1 (MapType1Store Mask@0 null (tree arg) (real_2_U (- (U_2_real (MapType1Select Mask@0 null (tree arg))) FullPerm)))) (InsidePredicate (heapseg arg arg) (MapType0Select Heap@3 null (heapseg arg arg)) (tree arg) (MapType0Select Heap@3 null (tree arg)))) (and (=> (= (ControlFlow 0 570) 567) anon479_Then_correct) (=> (= (ControlFlow 0 570) 569) anon479_Else_correct)))))
(let ((anon478_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 573) 570)) anon72_correct)))
(let ((anon478_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 571) (- 0 572)) (<= FullPerm (U_2_real (MapType1Select Mask@0 null (tree arg))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@0 null (tree arg)))) (=> (= (ControlFlow 0 571) 570) anon72_correct))))))
(let ((anon477_Then_correct  (=> (not (= arg arg)) (and (=> (= (ControlFlow 0 574) 571) anon478_Then_correct) (=> (= (ControlFlow 0 574) 573) anon478_Else_correct)))))
(let ((anon477_Else_correct  (=> (= arg arg) (=> (and (= Mask@4 Mask@0) (= (ControlFlow 0 558) 557)) anon78_correct))))
(let ((anon69_correct  (=> (state Heap@3 Mask@0) (=> (and (= vmin@0 (treeKey Heap@3 arg)) (state Heap@3 Mask@0)) (and (=> (= (ControlFlow 0 575) 574) anon477_Then_correct) (=> (= (ControlFlow 0 575) 558) anon477_Else_correct))))))
(let ((anon476_Else_correct  (=> (= arg null) (=> (and (= Heap@3 Heap@@61) (= (ControlFlow 0 577) 575)) anon69_correct))))
(let ((anon476_Then_correct  (=> (and (and (and (not (= arg null)) (forall ((o_34 T@U) (f_38 T@U) ) (! (let ((B@@23 (FieldTypeInv1 (type f_38))))
(let ((A@@24 (FieldTypeInv0 (type f_38))))
 (=> (and (and (= (type o_34) RefType) (= (type f_38) (FieldType A@@24 B@@23))) (or (U_2_bool (MapType1Select (MapType0Select Heap@@61 null (|heapseg#sm| arg null)) o_34 f_38)) (U_2_bool (MapType1Select (MapType0Select Heap@@61 null (|tree#sm| arg)) o_34 f_38)))) (U_2_bool (MapType1Select newPMask@0 o_34 f_38)))))
 :qid |stdinbpl.5295:33|
 :skolemid |126|
 :pattern ( (MapType1Select newPMask@0 o_34 f_38))
))) (and (= Heap@0 (MapType0Store Heap@@61 null (|heapseg#sm| arg null) newPMask@0)) (= Heap@1 (MapType0Store Heap@0 null (|heapseg#sm| arg null) (MapType1Store (MapType0Select Heap@0 null (|heapseg#sm| arg null)) arg sibling (bool_2_U true)))))) (and (and (forall ((o_35 T@U) (f_39 T@U) ) (! (let ((B@@24 (FieldTypeInv1 (type f_39))))
(let ((A@@25 (FieldTypeInv0 (type f_39))))
 (=> (and (and (= (type o_35) RefType) (= (type f_39) (FieldType A@@25 B@@24))) (or (U_2_bool (MapType1Select (MapType0Select Heap@1 null (|heapseg#sm| arg null)) o_35 f_39)) (U_2_bool (MapType1Select (MapType0Select Heap@1 null (|heapseg#sm| (MapType0Select Heap@1 arg sibling) null)) o_35 f_39)))) (U_2_bool (MapType1Select newPMask@1 o_35 f_39)))))
 :qid |stdinbpl.5302:33|
 :skolemid |127|
 :pattern ( (MapType1Select newPMask@1 o_35 f_39))
)) (= Heap@2 (MapType0Store Heap@1 null (|heapseg#sm| arg null) newPMask@1))) (and (= Heap@3 Heap@2) (= (ControlFlow 0 576) 575)))) anon69_correct)))
(let ((anon66_correct true))
(let ((anon475_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 8) 5)) anon66_correct)))
(let ((anon475_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 6) (- 0 7)) (<= FullPerm (U_2_real (MapType1Select UnfoldingMask@4 null (tree arg))))) (=> (<= FullPerm (U_2_real (MapType1Select UnfoldingMask@4 null (tree arg)))) (=> (= (ControlFlow 0 6) 5) anon66_correct))))))
(let ((anon63_correct  (=> (state Heap@@61 UnfoldingMask@4) (and (and (and (=> (= (ControlFlow 0 578) 576) anon476_Then_correct) (=> (= (ControlFlow 0 578) 577) anon476_Else_correct)) (=> (= (ControlFlow 0 578) 6) anon475_Then_correct)) (=> (= (ControlFlow 0 578) 8) anon475_Else_correct)))))
(let ((anon473_Else_correct  (=> (= (MapType0Select Heap@@61 arg sibling) null) (=> (and (= UnfoldingMask@4 UnfoldingMask@3) (= (ControlFlow 0 581) 578)) anon63_correct))))
(let ((anon473_Then_correct  (=> (not (= (MapType0Select Heap@@61 arg sibling) null)) (=> (and (and (state Heap@@61 UnfoldingMask@3) (= (treeParent Heap@@61 arg) (segParent Heap@@61 (MapType0Select Heap@@61 arg sibling) null))) (and (= UnfoldingMask@4 UnfoldingMask@3) (= (ControlFlow 0 580) 578))) anon63_correct))))
(let ((anon472_Then_correct  (=> (and (not (= arg null)) (= UnfoldingMask@1 (MapType1Store UnfoldingMask@0 null (tree arg) (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@0 null (tree arg))) FullPerm))))) (=> (and (and (and (InsidePredicate (heapseg arg null) (MapType0Select Heap@@61 null (heapseg arg null)) (tree arg) (MapType0Select Heap@@61 null (tree arg))) (state Heap@@61 UnfoldingMask@1)) (and (not (= arg null)) (= UnfoldingMask@2 (MapType1Store UnfoldingMask@1 arg sibling (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@1 arg sibling)) FullPerm)))))) (and (and (state Heap@@61 UnfoldingMask@2) (= UnfoldingMask@3 (MapType1Store UnfoldingMask@2 null (heapseg (MapType0Select Heap@@61 arg sibling) null) (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@2 null (heapseg (MapType0Select Heap@@61 arg sibling) null))) FullPerm))))) (and (InsidePredicate (heapseg arg null) (MapType0Select Heap@@61 null (heapseg arg null)) (heapseg (MapType0Select Heap@@61 arg sibling) null) (MapType0Select Heap@@61 null (heapseg (MapType0Select Heap@@61 arg sibling) null))) (state Heap@@61 UnfoldingMask@3)))) (and (=> (= (ControlFlow 0 582) 580) anon473_Then_correct) (=> (= (ControlFlow 0 582) 581) anon473_Else_correct))))))
(let ((anon472_Else_correct  (=> (= arg null) (=> (and (= UnfoldingMask@4 UnfoldingMask@0) (= (ControlFlow 0 579) 578)) anon63_correct))))
(let ((anon60_correct  (=> (= UnfoldingMask@0 (MapType1Store Mask@0 null (heapseg arg null) (real_2_U (- (U_2_real (MapType1Select Mask@0 null (heapseg arg null))) FullPerm)))) (and (=> (= (ControlFlow 0 583) 582) anon472_Then_correct) (=> (= (ControlFlow 0 583) 579) anon472_Else_correct)))))
(let ((anon471_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 586) 583)) anon60_correct)))
(let ((anon471_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 584) (- 0 585)) (<= FullPerm (U_2_real (MapType1Select Mask@0 null (heapseg arg null))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@0 null (heapseg arg null)))) (=> (= (ControlFlow 0 584) 583) anon60_correct))))))
(let ((anon444_Else_correct  (=> (U_2_bool (MapType0Select Heap@@61 x@@8 $allocated)) (=> (and (and (state Heap@@61 Mask@0) (state Heap@@61 Mask@0)) (and (|heapseg#trigger| Heap@@61 (heapseg arg null)) (= (MapType0Select Heap@@61 null (heapseg arg null)) (FrameFragment (ite (not (= arg null)) (CombineFrames (MapType0Select Heap@@61 null (tree arg)) (CombineFrames (FrameFragment (MapType0Select Heap@@61 arg sibling)) (CombineFrames (MapType0Select Heap@@61 null (heapseg (MapType0Select Heap@@61 arg sibling) null)) (FrameFragment (ite (not (= (MapType0Select Heap@@61 arg sibling) null)) EmptyFrame EmptyFrame))))) EmptyFrame))))) (and (=> (= (ControlFlow 0 587) 584) anon471_Then_correct) (=> (= (ControlFlow 0 587) 586) anon471_Else_correct))))))
(let ((anon442_Else_correct  (=> (and (sorted Heap@@61 arg null) (state Heap@@61 Mask@0)) (and (=> (= (ControlFlow 0 656) 655) anon444_Then_correct) (=> (= (ControlFlow 0 656) 587) anon444_Else_correct)))))
(let ((anon3_correct true))
(let ((anon443_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 4) 1)) anon3_correct)))
(let ((anon443_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 2) (- 0 3)) (<= FullPerm (U_2_real (MapType1Select Mask@0 null (heapseg arg null))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@0 null (heapseg arg null)))) (=> (= (ControlFlow 0 2) 1) anon3_correct))))))
(let ((anon0_correct  (=> (state Heap@@61 ZeroMask) (=> (and (= AssumeFunctionsAbove (- 0 1)) (U_2_bool (MapType0Select Heap@@61 arg $allocated))) (=> (and (and (not (= arg null)) (= Mask@0 (MapType1Store ZeroMask null (heapseg arg null) (real_2_U (+ (U_2_real (MapType1Select ZeroMask null (heapseg arg null))) FullPerm))))) (and (state Heap@@61 Mask@0) (state Heap@@61 Mask@0))) (and (and (=> (= (ControlFlow 0 657) 656) anon442_Else_correct) (=> (= (ControlFlow 0 657) 2) anon443_Then_correct)) (=> (= (ControlFlow 0 657) 4) anon443_Else_correct)))))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 658) 657) anon0_correct)))
PreconditionGeneratedEntry_correct))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
))
(check-sat)
