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
(declare-fun this@@66 () T@U)
(declare-fun last@@37 () T@U)
(declare-fun Heap@3 () T@U)
(declare-fun Heap@@61 () T@U)
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
(declare-fun Mask@0 () T@U)
(declare-fun FrameFragment (T@U) T@U)
(declare-fun CombineFrames (T@U T@U) T@U)
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (= (type UnfoldingMask@4) (MapType1Type RefType realType)) (= (type this@@66) RefType)) (= (type last@@37) RefType)) (= (type newPMask@0) (MapType1Type RefType boolType))) (= (type Heap@@61) (MapType0Type RefType))) (= (type Heap@0) (MapType0Type RefType))) (= (type Heap@1) (MapType0Type RefType))) (= (type newPMask@1) (MapType1Type RefType boolType))) (= (type Heap@2) (MapType0Type RefType))) (= (type Heap@3) (MapType0Type RefType))) (= (type UnfoldingMask@0) (MapType1Type RefType realType))) (= (type UnfoldingMask@3) (MapType1Type RefType realType))) (= (type UnfoldingMask@1) (MapType1Type RefType realType))) (= (type UnfoldingMask@2) (MapType1Type RefType realType))) (= (type Mask@0) (MapType1Type RefType realType))) (forall ((arg0@@40 T@U) ) (! (= (type (FrameFragment arg0@@40)) FrameTypeType)
 :qid |funType:FrameFragment|
 :pattern ( (FrameFragment arg0@@40))
))) (forall ((arg0@@41 T@U) (arg1@@19 T@U) ) (! (= (type (CombineFrames arg0@@41 arg1@@19)) FrameTypeType)
 :qid |funType:CombineFrames|
 :pattern ( (CombineFrames arg0@@41 arg1@@19))
))))
(set-info :boogie-vc-id |segParent#definedness|)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 18) (let ((anon11_correct true))
(let ((anon17_Else_correct  (=> (= this@@66 last@@37) (=> (and (= Heap@3 Heap@@61) (= (ControlFlow 0 7) 5)) anon11_correct))))
(let ((anon17_Then_correct  (=> (and (and (and (not (= this@@66 last@@37)) (forall ((o_15 T@U) (f_19 T@U) ) (! (let ((B@@11 (FieldTypeInv1 (type f_19))))
(let ((A@@12 (FieldTypeInv0 (type f_19))))
 (=> (and (and (= (type o_15) RefType) (= (type f_19) (FieldType A@@12 B@@11))) (or (U_2_bool (MapType1Select (MapType0Select Heap@@61 null (|heapseg#sm| this@@66 last@@37)) o_15 f_19)) (U_2_bool (MapType1Select (MapType0Select Heap@@61 null (|tree#sm| this@@66)) o_15 f_19)))) (U_2_bool (MapType1Select newPMask@0 o_15 f_19)))))
 :qid |stdinbpl.1439:33|
 :skolemid |70|
 :pattern ( (MapType1Select newPMask@0 o_15 f_19))
))) (and (= Heap@0 (MapType0Store Heap@@61 null (|heapseg#sm| this@@66 last@@37) newPMask@0)) (= Heap@1 (MapType0Store Heap@0 null (|heapseg#sm| this@@66 last@@37) (MapType1Store (MapType0Select Heap@0 null (|heapseg#sm| this@@66 last@@37)) this@@66 sibling (bool_2_U true)))))) (and (and (forall ((o_16 T@U) (f_20 T@U) ) (! (let ((B@@12 (FieldTypeInv1 (type f_20))))
(let ((A@@13 (FieldTypeInv0 (type f_20))))
 (=> (and (and (= (type o_16) RefType) (= (type f_20) (FieldType A@@13 B@@12))) (or (U_2_bool (MapType1Select (MapType0Select Heap@1 null (|heapseg#sm| this@@66 last@@37)) o_16 f_20)) (U_2_bool (MapType1Select (MapType0Select Heap@1 null (|heapseg#sm| (MapType0Select Heap@1 this@@66 sibling) last@@37)) o_16 f_20)))) (U_2_bool (MapType1Select newPMask@1 o_16 f_20)))))
 :qid |stdinbpl.1446:33|
 :skolemid |71|
 :pattern ( (MapType1Select newPMask@1 o_16 f_20))
)) (= Heap@2 (MapType0Store Heap@1 null (|heapseg#sm| this@@66 last@@37) newPMask@1))) (and (= Heap@3 Heap@2) (= (ControlFlow 0 6) 5)))) anon11_correct)))
(let ((anon8_correct true))
(let ((anon16_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 4) 1)) anon8_correct)))
(let ((anon16_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 2) (- 0 3)) (<= FullPerm (U_2_real (MapType1Select UnfoldingMask@4 null (tree this@@66))))) (=> (<= FullPerm (U_2_real (MapType1Select UnfoldingMask@4 null (tree this@@66)))) (=> (= (ControlFlow 0 2) 1) anon8_correct))))))
(let ((anon5_correct  (=> (state Heap@@61 UnfoldingMask@4) (and (and (and (=> (= (ControlFlow 0 8) 6) anon17_Then_correct) (=> (= (ControlFlow 0 8) 7) anon17_Else_correct)) (=> (= (ControlFlow 0 8) 2) anon16_Then_correct)) (=> (= (ControlFlow 0 8) 4) anon16_Else_correct)))))
(let ((anon14_Else_correct  (=> (= (MapType0Select Heap@@61 this@@66 sibling) last@@37) (=> (and (= UnfoldingMask@4 UnfoldingMask@3) (= (ControlFlow 0 11) 8)) anon5_correct))))
(let ((anon14_Then_correct  (=> (not (= (MapType0Select Heap@@61 this@@66 sibling) last@@37)) (=> (and (and (state Heap@@61 UnfoldingMask@3) (= (treeParent Heap@@61 this@@66) (segParent Heap@@61 (MapType0Select Heap@@61 this@@66 sibling) last@@37))) (and (= UnfoldingMask@4 UnfoldingMask@3) (= (ControlFlow 0 10) 8))) anon5_correct))))
(let ((anon13_Then_correct  (=> (and (not (= this@@66 last@@37)) (= UnfoldingMask@1 (MapType1Store UnfoldingMask@0 null (tree this@@66) (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@0 null (tree this@@66))) FullPerm))))) (=> (and (and (and (InsidePredicate (heapseg this@@66 last@@37) (MapType0Select Heap@@61 null (heapseg this@@66 last@@37)) (tree this@@66) (MapType0Select Heap@@61 null (tree this@@66))) (state Heap@@61 UnfoldingMask@1)) (and (not (= this@@66 null)) (= UnfoldingMask@2 (MapType1Store UnfoldingMask@1 this@@66 sibling (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@1 this@@66 sibling)) FullPerm)))))) (and (and (state Heap@@61 UnfoldingMask@2) (= UnfoldingMask@3 (MapType1Store UnfoldingMask@2 null (heapseg (MapType0Select Heap@@61 this@@66 sibling) last@@37) (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@2 null (heapseg (MapType0Select Heap@@61 this@@66 sibling) last@@37))) FullPerm))))) (and (InsidePredicate (heapseg this@@66 last@@37) (MapType0Select Heap@@61 null (heapseg this@@66 last@@37)) (heapseg (MapType0Select Heap@@61 this@@66 sibling) last@@37) (MapType0Select Heap@@61 null (heapseg (MapType0Select Heap@@61 this@@66 sibling) last@@37))) (state Heap@@61 UnfoldingMask@3)))) (and (=> (= (ControlFlow 0 12) 10) anon14_Then_correct) (=> (= (ControlFlow 0 12) 11) anon14_Else_correct))))))
(let ((anon13_Else_correct  (=> (= this@@66 last@@37) (=> (and (= UnfoldingMask@4 UnfoldingMask@0) (= (ControlFlow 0 9) 8)) anon5_correct))))
(let ((anon2_correct  (=> (= UnfoldingMask@0 (MapType1Store Mask@0 null (heapseg this@@66 last@@37) (real_2_U (- (U_2_real (MapType1Select Mask@0 null (heapseg this@@66 last@@37))) FullPerm)))) (and (=> (= (ControlFlow 0 13) 12) anon13_Then_correct) (=> (= (ControlFlow 0 13) 9) anon13_Else_correct)))))
(let ((anon12_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 16) 13)) anon2_correct)))
(let ((anon12_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 14) (- 0 15)) (<= FullPerm (U_2_real (MapType1Select Mask@0 null (heapseg this@@66 last@@37))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@0 null (heapseg this@@66 last@@37)))) (=> (= (ControlFlow 0 14) 13) anon2_correct))))))
(let ((anon0_correct  (=> (and (state Heap@@61 ZeroMask) (U_2_bool (MapType0Select Heap@@61 this@@66 $allocated))) (=> (and (and (and (U_2_bool (MapType0Select Heap@@61 last@@37 $allocated)) (= AssumeFunctionsAbove 4)) (and (= Mask@0 (MapType1Store ZeroMask null (heapseg this@@66 last@@37) (real_2_U (+ (U_2_real (MapType1Select ZeroMask null (heapseg this@@66 last@@37))) FullPerm)))) (state Heap@@61 Mask@0))) (and (and (not (= this@@66 last@@37)) (state Heap@@61 Mask@0)) (and (|heapseg#trigger| Heap@@61 (heapseg this@@66 last@@37)) (= (MapType0Select Heap@@61 null (heapseg this@@66 last@@37)) (FrameFragment (ite (not (= this@@66 last@@37)) (CombineFrames (MapType0Select Heap@@61 null (tree this@@66)) (CombineFrames (FrameFragment (MapType0Select Heap@@61 this@@66 sibling)) (CombineFrames (MapType0Select Heap@@61 null (heapseg (MapType0Select Heap@@61 this@@66 sibling) last@@37)) (FrameFragment (ite (not (= (MapType0Select Heap@@61 this@@66 sibling) last@@37)) EmptyFrame EmptyFrame))))) EmptyFrame)))))) (and (=> (= (ControlFlow 0 17) 14) anon12_Then_correct) (=> (= (ControlFlow 0 17) 16) anon12_Else_correct))))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 18) 17) anon0_correct)))
PreconditionGeneratedEntry_correct)))))))))))))))))
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
(declare-fun Mask@4 () T@U)
(declare-fun Mask@1 () T@U)
(declare-fun Heap@@61 () T@U)
(declare-fun this@@66 () T@U)
(declare-fun Mask@2 () T@U)
(declare-fun Mask@0 () T@U)
(assert  (and (and (and (and (and (= (type Mask@1) (MapType1Type RefType realType)) (= (type Heap@@61) (MapType0Type RefType))) (= (type this@@66) RefType)) (= (type Mask@2) (MapType1Type RefType realType))) (= (type Mask@4) (MapType1Type RefType realType))) (= (type Mask@0) (MapType1Type RefType realType))))
(set-info :boogie-vc-id |heap#definedness|)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 27) (let ((anon8_correct  (=> (and (= Mask@4 (MapType1Store Mask@1 null (heapseg (MapType0Select Heap@@61 this@@66 Nodes) null) (real_2_U (- (U_2_real (MapType1Select Mask@1 null (heapseg (MapType0Select Heap@@61 this@@66 Nodes) null))) FullPerm)))) (= (ControlFlow 0 16) (- 0 15))) (not (= (MapType0Select Heap@@61 this@@66 Nodes) null)))))
(let ((anon19_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 19) 16)) anon8_correct)))
(let ((anon19_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 17) (- 0 18)) (<= FullPerm (U_2_real (MapType1Select Mask@1 null (heapseg (MapType0Select Heap@@61 this@@66 Nodes) null))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@1 null (heapseg (MapType0Select Heap@@61 this@@66 Nodes) null)))) (=> (= (ControlFlow 0 17) 16) anon8_correct))))))
(let ((anon13_correct true))
(let ((anon21_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 9) 6)) anon13_correct)))
(let ((anon21_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 7) (- 0 8)) (<= FullPerm (U_2_real (MapType1Select Mask@2 null (heapseg (MapType0Select Heap@@61 this@@66 Nodes) null))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@2 null (heapseg (MapType0Select Heap@@61 this@@66 Nodes) null)))) (=> (= (ControlFlow 0 7) 6) anon13_correct))))))
(let ((anon20_Else_correct true))
(let ((anon10_correct  (=> (and (and (not (= this@@66 null)) (= Mask@2 (MapType1Store Mask@1 this@@66 size (real_2_U (+ (U_2_real (MapType1Select Mask@1 this@@66 size)) FullPerm))))) (and (state Heap@@61 Mask@2) (state Heap@@61 Mask@2))) (and (=> (= (ControlFlow 0 10) (- 0 12)) (HasDirectPerm Mask@2 this@@66 size)) (=> (HasDirectPerm Mask@2 this@@66 size) (and (=> (= (ControlFlow 0 10) (- 0 11)) (HasDirectPerm Mask@2 this@@66 Nodes)) (=> (HasDirectPerm Mask@2 this@@66 Nodes) (and (and (=> (= (ControlFlow 0 10) 5) anon20_Else_correct) (=> (= (ControlFlow 0 10) 7) anon21_Then_correct)) (=> (= (ControlFlow 0 10) 9) anon21_Else_correct)))))))))
(let ((anon18_Else_correct  (=> (and (= (segParent Heap@@61 (MapType0Select Heap@@61 this@@66 Nodes) null) null) (= (ControlFlow 0 14) 10)) anon10_correct)))
(let ((anon17_Then_correct  (=> (and (not (= (MapType0Select Heap@@61 this@@66 Nodes) null)) (state Heap@@61 Mask@1)) (and (=> (= (ControlFlow 0 20) (- 0 21)) (HasDirectPerm Mask@1 this@@66 Nodes)) (=> (HasDirectPerm Mask@1 this@@66 Nodes) (and (and (=> (= (ControlFlow 0 20) 14) anon18_Else_correct) (=> (= (ControlFlow 0 20) 17) anon19_Then_correct)) (=> (= (ControlFlow 0 20) 19) anon19_Else_correct)))))))
(let ((anon17_Else_correct  (=> (and (= (MapType0Select Heap@@61 this@@66 Nodes) null) (= (ControlFlow 0 13) 10)) anon10_correct)))
(let ((anon15_Else_correct  (=> (sorted Heap@@61 (MapType0Select Heap@@61 this@@66 Nodes) null) (and (=> (= (ControlFlow 0 22) (- 0 23)) (HasDirectPerm Mask@1 this@@66 Nodes)) (=> (HasDirectPerm Mask@1 this@@66 Nodes) (and (=> (= (ControlFlow 0 22) 20) anon17_Then_correct) (=> (= (ControlFlow 0 22) 13) anon17_Else_correct)))))))
(let ((anon3_correct true))
(let ((anon16_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 4) 1)) anon3_correct)))
(let ((anon16_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 2) (- 0 3)) (<= FullPerm (U_2_real (MapType1Select Mask@1 null (heapseg (MapType0Select Heap@@61 this@@66 Nodes) null))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@1 null (heapseg (MapType0Select Heap@@61 this@@66 Nodes) null)))) (=> (= (ControlFlow 0 2) 1) anon3_correct))))))
(let ((anon0_correct  (=> (and (state Heap@@61 ZeroMask) (= AssumeFunctionsAbove (- 0 1))) (=> (and (and (U_2_bool (MapType0Select Heap@@61 this@@66 $allocated)) (not (= this@@66 null))) (and (= Mask@0 (MapType1Store ZeroMask this@@66 Nodes (real_2_U (+ (U_2_real (MapType1Select ZeroMask this@@66 Nodes)) FullPerm)))) (state Heap@@61 Mask@0))) (and (=> (= (ControlFlow 0 24) (- 0 26)) (HasDirectPerm Mask@0 this@@66 Nodes)) (=> (HasDirectPerm Mask@0 this@@66 Nodes) (=> (= Mask@1 (MapType1Store Mask@0 null (heapseg (MapType0Select Heap@@61 this@@66 Nodes) null) (real_2_U (+ (U_2_real (MapType1Select Mask@0 null (heapseg (MapType0Select Heap@@61 this@@66 Nodes) null))) FullPerm)))) (=> (and (state Heap@@61 Mask@1) (state Heap@@61 Mask@1)) (and (=> (= (ControlFlow 0 24) (- 0 25)) (HasDirectPerm Mask@1 this@@66 Nodes)) (=> (HasDirectPerm Mask@1 this@@66 Nodes) (and (and (=> (= (ControlFlow 0 24) 22) anon15_Else_correct) (=> (= (ControlFlow 0 24) 2) anon16_Then_correct)) (=> (= (ControlFlow 0 24) 4) anon16_Else_correct))))))))))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 27) 24) anon0_correct)))
PreconditionGeneratedEntry_correct))))))))))))))))))
))
(check-sat)
(pop 1)
; Valid
(get-info :rlimit)
