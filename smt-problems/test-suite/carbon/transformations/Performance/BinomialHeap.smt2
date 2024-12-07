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
(declare-fun Result@0 () Int)
(declare-fun Heap@4 () T@U)
(declare-fun Heap@3 () T@U)
(declare-fun Mask@0 () T@U)
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
(declare-fun FrameFragment (T@U) T@U)
(declare-fun CombineFrames (T@U T@U) T@U)
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (= (type UnfoldingMask@4) (MapType1Type RefType realType)) (= (type this@@66) RefType)) (= (type Heap@@61) (MapType0Type RefType))) (= (type last@@37) RefType)) (= (type Heap@4) (MapType0Type RefType))) (= (type Heap@3) (MapType0Type RefType))) (= (type Mask@0) (MapType1Type RefType realType))) (= (type newPMask@0) (MapType1Type RefType boolType))) (= (type Heap@0) (MapType0Type RefType))) (= (type Heap@1) (MapType0Type RefType))) (= (type newPMask@1) (MapType1Type RefType boolType))) (= (type Heap@2) (MapType0Type RefType))) (= (type UnfoldingMask@0) (MapType1Type RefType realType))) (= (type UnfoldingMask@3) (MapType1Type RefType realType))) (= (type UnfoldingMask@1) (MapType1Type RefType realType))) (= (type UnfoldingMask@2) (MapType1Type RefType realType))) (forall ((arg0@@40 T@U) ) (! (= (type (FrameFragment arg0@@40)) FrameTypeType)
 :qid |funType:FrameFragment|
 :pattern ( (FrameFragment arg0@@40))
))) (forall ((arg0@@41 T@U) (arg1@@19 T@U) ) (! (= (type (CombineFrames arg0@@41 arg1@@19)) FrameTypeType)
 :qid |funType:CombineFrames|
 :pattern ( (CombineFrames arg0@@41 arg1@@19))
))))
(set-info :boogie-vc-id |segSize#definedness|)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 31) (let ((anon30_Else_correct true))
(let ((anon30_Then_correct  (=> (and (= this@@66 last@@37) (= (ControlFlow 0 10) (- 0 9))) (= Result@0 0))))
(let ((anon19_correct  (=> (= Result@0 (ite (= this@@66 last@@37) 0 (+ (treeSize Heap@4 this@@66) (segSize Heap@4 (MapType0Select Heap@4 this@@66 sibling) last@@37)))) (and (=> (= (ControlFlow 0 12) 10) anon30_Then_correct) (=> (= (ControlFlow 0 12) 11) anon30_Else_correct)))))
(let ((anon18_correct  (=> (state Heap@3 Mask@0) (=> (and (= Heap@4 Heap@3) (= (ControlFlow 0 14) 12)) anon19_correct))))
(let ((anon29_Else_correct  (=> (= this@@66 last@@37) (=> (and (= Heap@3 Heap@@61) (= (ControlFlow 0 16) 14)) anon18_correct))))
(let ((anon29_Then_correct  (=> (and (and (and (not (= this@@66 last@@37)) (forall ((o_11 T@U) (f_15 T@U) ) (! (let ((B@@11 (FieldTypeInv1 (type f_15))))
(let ((A@@12 (FieldTypeInv0 (type f_15))))
 (=> (and (and (= (type o_11) RefType) (= (type f_15) (FieldType A@@12 B@@11))) (or (U_2_bool (MapType1Select (MapType0Select Heap@@61 null (|heapseg#sm| this@@66 last@@37)) o_11 f_15)) (U_2_bool (MapType1Select (MapType0Select Heap@@61 null (|tree#sm| this@@66)) o_11 f_15)))) (U_2_bool (MapType1Select newPMask@0 o_11 f_15)))))
 :qid |stdinbpl.1089:35|
 :skolemid |57|
 :pattern ( (MapType1Select newPMask@0 o_11 f_15))
))) (and (= Heap@0 (MapType0Store Heap@@61 null (|heapseg#sm| this@@66 last@@37) newPMask@0)) (= Heap@1 (MapType0Store Heap@0 null (|heapseg#sm| this@@66 last@@37) (MapType1Store (MapType0Select Heap@0 null (|heapseg#sm| this@@66 last@@37)) this@@66 sibling (bool_2_U true)))))) (and (and (forall ((o_12 T@U) (f_16 T@U) ) (! (let ((B@@12 (FieldTypeInv1 (type f_16))))
(let ((A@@13 (FieldTypeInv0 (type f_16))))
 (=> (and (and (= (type o_12) RefType) (= (type f_16) (FieldType A@@13 B@@12))) (or (U_2_bool (MapType1Select (MapType0Select Heap@1 null (|heapseg#sm| this@@66 last@@37)) o_12 f_16)) (U_2_bool (MapType1Select (MapType0Select Heap@1 null (|heapseg#sm| (MapType0Select Heap@1 this@@66 sibling) last@@37)) o_12 f_16)))) (U_2_bool (MapType1Select newPMask@1 o_12 f_16)))))
 :qid |stdinbpl.1096:35|
 :skolemid |58|
 :pattern ( (MapType1Select newPMask@1 o_12 f_16))
)) (= Heap@2 (MapType0Store Heap@1 null (|heapseg#sm| this@@66 last@@37) newPMask@1))) (and (= Heap@3 Heap@2) (= (ControlFlow 0 15) 14)))) anon18_correct)))
(let ((anon27_Else_correct  (=> (|segSize#trigger| (MapType0Select Heap@@61 null (heapseg (MapType0Select Heap@@61 this@@66 sibling) last@@37)) (MapType0Select Heap@@61 this@@66 sibling) last@@37) (and (=> (= (ControlFlow 0 17) 15) anon29_Then_correct) (=> (= (ControlFlow 0 17) 16) anon29_Else_correct)))))
(let ((anon21_Then_correct  (=> (= this@@66 last@@37) (=> (and (= Heap@4 Heap@@61) (= (ControlFlow 0 13) 12)) anon19_correct))))
(let ((anon14_correct true))
(let ((anon28_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 8) 5)) anon14_correct)))
(let ((anon28_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 6) (- 0 7)) (<= FullPerm (U_2_real (MapType1Select UnfoldingMask@4 null (heapseg (MapType0Select Heap@@61 this@@66 sibling) last@@37))))) (=> (<= FullPerm (U_2_real (MapType1Select UnfoldingMask@4 null (heapseg (MapType0Select Heap@@61 this@@66 sibling) last@@37)))) (=> (= (ControlFlow 0 6) 5) anon14_correct))))))
(let ((anon25_Else_correct  (and (=> (= (ControlFlow 0 18) (- 0 19)) (HasDirectPerm UnfoldingMask@4 this@@66 sibling)) (=> (HasDirectPerm UnfoldingMask@4 this@@66 sibling) (and (and (=> (= (ControlFlow 0 18) 17) anon27_Else_correct) (=> (= (ControlFlow 0 18) 6) anon28_Then_correct)) (=> (= (ControlFlow 0 18) 8) anon28_Else_correct))))))
(let ((anon10_correct true))
(let ((anon26_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 4) 1)) anon10_correct)))
(let ((anon26_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 2) (- 0 3)) (<= FullPerm (U_2_real (MapType1Select UnfoldingMask@4 null (tree this@@66))))) (=> (<= FullPerm (U_2_real (MapType1Select UnfoldingMask@4 null (tree this@@66)))) (=> (= (ControlFlow 0 2) 1) anon10_correct))))))
(let ((anon7_correct  (=> (state Heap@@61 UnfoldingMask@4) (and (and (=> (= (ControlFlow 0 20) 18) anon25_Else_correct) (=> (= (ControlFlow 0 20) 2) anon26_Then_correct)) (=> (= (ControlFlow 0 20) 4) anon26_Else_correct)))))
(let ((anon24_Else_correct  (=> (= (MapType0Select Heap@@61 this@@66 sibling) last@@37) (=> (and (= UnfoldingMask@4 UnfoldingMask@3) (= (ControlFlow 0 23) 20)) anon7_correct))))
(let ((anon24_Then_correct  (=> (not (= (MapType0Select Heap@@61 this@@66 sibling) last@@37)) (=> (and (and (state Heap@@61 UnfoldingMask@3) (= (treeParent Heap@@61 this@@66) (segParent Heap@@61 (MapType0Select Heap@@61 this@@66 sibling) last@@37))) (and (= UnfoldingMask@4 UnfoldingMask@3) (= (ControlFlow 0 22) 20))) anon7_correct))))
(let ((anon23_Then_correct  (=> (and (not (= this@@66 last@@37)) (= UnfoldingMask@1 (MapType1Store UnfoldingMask@0 null (tree this@@66) (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@0 null (tree this@@66))) FullPerm))))) (=> (and (and (and (InsidePredicate (heapseg this@@66 last@@37) (MapType0Select Heap@@61 null (heapseg this@@66 last@@37)) (tree this@@66) (MapType0Select Heap@@61 null (tree this@@66))) (state Heap@@61 UnfoldingMask@1)) (and (not (= this@@66 null)) (= UnfoldingMask@2 (MapType1Store UnfoldingMask@1 this@@66 sibling (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@1 this@@66 sibling)) FullPerm)))))) (and (and (state Heap@@61 UnfoldingMask@2) (= UnfoldingMask@3 (MapType1Store UnfoldingMask@2 null (heapseg (MapType0Select Heap@@61 this@@66 sibling) last@@37) (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@2 null (heapseg (MapType0Select Heap@@61 this@@66 sibling) last@@37))) FullPerm))))) (and (InsidePredicate (heapseg this@@66 last@@37) (MapType0Select Heap@@61 null (heapseg this@@66 last@@37)) (heapseg (MapType0Select Heap@@61 this@@66 sibling) last@@37) (MapType0Select Heap@@61 null (heapseg (MapType0Select Heap@@61 this@@66 sibling) last@@37))) (state Heap@@61 UnfoldingMask@3)))) (and (=> (= (ControlFlow 0 24) 22) anon24_Then_correct) (=> (= (ControlFlow 0 24) 23) anon24_Else_correct))))))
(let ((anon23_Else_correct  (=> (= this@@66 last@@37) (=> (and (= UnfoldingMask@4 UnfoldingMask@0) (= (ControlFlow 0 21) 20)) anon7_correct))))
(let ((anon4_correct  (=> (= UnfoldingMask@0 (MapType1Store Mask@0 null (heapseg this@@66 last@@37) (real_2_U (- (U_2_real (MapType1Select Mask@0 null (heapseg this@@66 last@@37))) FullPerm)))) (and (=> (= (ControlFlow 0 25) 24) anon23_Then_correct) (=> (= (ControlFlow 0 25) 21) anon23_Else_correct)))))
(let ((anon22_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 28) 25)) anon4_correct)))
(let ((anon22_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 26) (- 0 27)) (<= FullPerm (U_2_real (MapType1Select Mask@0 null (heapseg this@@66 last@@37))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@0 null (heapseg this@@66 last@@37)))) (=> (= (ControlFlow 0 26) 25) anon4_correct))))))
(let ((anon21_Else_correct  (=> (not (= this@@66 last@@37)) (=> (and (|heapseg#trigger| Heap@@61 (heapseg this@@66 last@@37)) (= (MapType0Select Heap@@61 null (heapseg this@@66 last@@37)) (FrameFragment (ite (not (= this@@66 last@@37)) (CombineFrames (MapType0Select Heap@@61 null (tree this@@66)) (CombineFrames (FrameFragment (MapType0Select Heap@@61 this@@66 sibling)) (CombineFrames (MapType0Select Heap@@61 null (heapseg (MapType0Select Heap@@61 this@@66 sibling) last@@37)) (FrameFragment (ite (not (= (MapType0Select Heap@@61 this@@66 sibling) last@@37)) EmptyFrame EmptyFrame))))) EmptyFrame)))) (and (=> (= (ControlFlow 0 29) 26) anon22_Then_correct) (=> (= (ControlFlow 0 29) 28) anon22_Else_correct))))))
(let ((anon0_correct  (=> (state Heap@@61 ZeroMask) (=> (and (U_2_bool (MapType0Select Heap@@61 this@@66 $allocated)) (U_2_bool (MapType0Select Heap@@61 last@@37 $allocated))) (=> (and (and (= AssumeFunctionsAbove 1) (= Mask@0 (MapType1Store ZeroMask null (heapseg this@@66 last@@37) (real_2_U (+ (U_2_real (MapType1Select ZeroMask null (heapseg this@@66 last@@37))) FullPerm))))) (and (state Heap@@61 Mask@0) (state Heap@@61 Mask@0))) (and (=> (= (ControlFlow 0 30) 13) anon21_Then_correct) (=> (= (ControlFlow 0 30) 29) anon21_Else_correct)))))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 31) 30) anon0_correct)))
PreconditionGeneratedEntry_correct)))))))))))))))))))))))))))
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
(declare-fun Mask@25 () T@U)
(declare-fun Mask@3 () T@U)
(declare-fun b_2 () T@U)
(declare-fun c () T@U)
(declare-fun Mask@26 () T@U)
(declare-fun a_2 () T@U)
(declare-fun PostMask@1 () T@U)
(declare-fun Heap@@61 () T@U)
(declare-fun PostMask@2 () T@U)
(declare-fun PostMask@4 () T@U)
(declare-fun PostMask@3 () T@U)
(declare-fun PostHeap@0 () T@U)
(declare-fun PostMask@0 () T@U)
(declare-fun i_2 () Int)
(declare-fun PostMask@12 () T@U)
(declare-fun i () Int)
(declare-fun PostMask@14 () T@U)
(declare-fun Heap@35 () T@U)
(declare-fun Mask@23 () T@U)
(declare-fun Mask@22 () T@U)
(declare-fun Mask@24 () T@U)
(declare-fun i_6 () Int)
(declare-fun i_4 () Int)
(declare-fun Mask@21 () T@U)
(declare-fun Heap@34 () T@U)
(declare-fun Mask@20 () T@U)
(declare-fun Heap@30 () T@U)
(declare-fun newPMask@5 () T@U)
(declare-fun Heap@31 () T@U)
(declare-fun Heap@32 () T@U)
(declare-fun newPMask@6 () T@U)
(declare-fun Heap@33 () T@U)
(declare-fun Heap@27 () T@U)
(declare-fun Heap@28 () T@U)
(declare-fun Heap@29 () T@U)
(declare-fun freshVersion@0 () T@U)
(declare-fun Mask@19 () T@U)
(declare-fun FrameFragment (T@U) T@U)
(declare-fun CombineFrames (T@U T@U) T@U)
(declare-fun Mask@18 () T@U)
(declare-fun Mask@17 () T@U)
(declare-fun Mask@16 () T@U)
(declare-fun Mask@15 () T@U)
(declare-fun Heap@18 () T@U)
(declare-fun Heap@17 () T@U)
(declare-fun Heap@19 () T@U)
(declare-fun Heap@20 () T@U)
(declare-fun Heap@21 () T@U)
(declare-fun newPMask@3 () T@U)
(declare-fun Heap@22 () T@U)
(declare-fun Heap@23 () T@U)
(declare-fun Heap@24 () T@U)
(declare-fun Heap@25 () T@U)
(declare-fun Heap@26 () T@U)
(declare-fun newPMask@4 () T@U)
(declare-fun ExhaleHeap@0 () T@U)
(declare-fun Unfolding1Mask@5 () T@U)
(declare-fun Heap@2 () T@U)
(declare-fun Heap@3 () T@U)
(declare-fun Heap@4 () T@U)
(declare-fun Heap@5 () T@U)
(declare-fun newPMask@0 () T@U)
(declare-fun Heap@6 () T@U)
(declare-fun Heap@7 () T@U)
(declare-fun Heap@8 () T@U)
(declare-fun Heap@9 () T@U)
(declare-fun Heap@10 () T@U)
(declare-fun newPMask@1 () T@U)
(declare-fun Heap@11 () T@U)
(declare-fun Heap@12 () T@U)
(declare-fun Heap@13 () T@U)
(declare-fun Heap@14 () T@U)
(declare-fun Heap@15 () T@U)
(declare-fun newPMask@2 () T@U)
(declare-fun Heap@16 () T@U)
(declare-fun Unfolding1Mask@0 () T@U)
(declare-fun UnfoldingMask@5 () T@U)
(declare-fun perm@0 () Real)
(declare-fun perm@1 () Real)
(declare-fun Unfolding1Mask@1 () T@U)
(declare-fun perm@2 () Real)
(declare-fun Unfolding1Mask@2 () T@U)
(declare-fun perm@3 () Real)
(declare-fun Unfolding1Mask@3 () T@U)
(declare-fun perm@4 () Real)
(declare-fun Unfolding1Mask@4 () T@U)
(declare-fun perm@5 () Real)
(declare-fun UnfoldingMask@0 () T@U)
(declare-fun UnfoldingMask@1 () T@U)
(declare-fun UnfoldingMask@2 () T@U)
(declare-fun UnfoldingMask@3 () T@U)
(declare-fun UnfoldingMask@4 () T@U)
(declare-fun arg_a@0 () T@U)
(declare-fun Heap@1 () T@U)
(declare-fun Mask@13 () T@U)
(declare-fun Mask@14 () T@U)
(declare-fun Mask@12 () T@U)
(declare-fun Mask@11 () T@U)
(declare-fun Mask@10 () T@U)
(declare-fun Mask@9 () T@U)
(declare-fun Mask@8 () T@U)
(declare-fun Mask@7 () T@U)
(declare-fun Mask@5 () T@U)
(declare-fun Mask@4 () T@U)
(declare-fun Mask@6 () T@U)
(declare-fun Heap@0 () T@U)
(declare-fun newVersion@0 () T@U)
(declare-fun Mask@1 () T@U)
(declare-fun Mask@2 () T@U)
(declare-fun Mask@0 () T@U)
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (= (type Heap@@61) (MapType0Type RefType)) (= (type a_2) RefType)) (= (type b_2) RefType)) (= (type Heap@35) (MapType0Type RefType))) (= (type c) RefType)) (= (type Mask@24) (MapType1Type RefType realType))) (= (type Mask@22) (MapType1Type RefType realType))) (= (type Mask@23) (MapType1Type RefType realType))) (= (type Mask@21) (MapType1Type RefType realType))) (= (type Mask@3) (MapType1Type RefType realType))) (= (type Heap@34) (MapType0Type RefType))) (= (type Mask@20) (MapType1Type RefType realType))) (= (type newPMask@5) (MapType1Type RefType boolType))) (= (type Heap@30) (MapType0Type RefType))) (= (type Heap@31) (MapType0Type RefType))) (= (type Heap@32) (MapType0Type RefType))) (= (type newPMask@6) (MapType1Type RefType boolType))) (= (type Heap@33) (MapType0Type RefType))) (= (type Heap@28) (MapType0Type RefType))) (= (type Heap@27) (MapType0Type RefType))) (= (type Heap@29) (MapType0Type RefType))) (= (type freshVersion@0) FrameTypeType)) (= (type Mask@19) (MapType1Type RefType realType))) (forall ((arg0@@40 T@U) ) (! (= (type (FrameFragment arg0@@40)) FrameTypeType)
 :qid |funType:FrameFragment|
 :pattern ( (FrameFragment arg0@@40))
))) (forall ((arg0@@41 T@U) (arg1@@19 T@U) ) (! (= (type (CombineFrames arg0@@41 arg1@@19)) FrameTypeType)
 :qid |funType:CombineFrames|
 :pattern ( (CombineFrames arg0@@41 arg1@@19))
))) (= (type Mask@15) (MapType1Type RefType realType))) (= (type Mask@18) (MapType1Type RefType realType))) (= (type Mask@17) (MapType1Type RefType realType))) (= (type Mask@16) (MapType1Type RefType realType))) (= (type Heap@18) (MapType0Type RefType))) (= (type Heap@17) (MapType0Type RefType))) (= (type Heap@19) (MapType0Type RefType))) (= (type Heap@20) (MapType0Type RefType))) (= (type Heap@21) (MapType0Type RefType))) (= (type newPMask@3) (MapType1Type RefType boolType))) (= (type Heap@22) (MapType0Type RefType))) (= (type Heap@23) (MapType0Type RefType))) (= (type Heap@24) (MapType0Type RefType))) (= (type Heap@25) (MapType0Type RefType))) (= (type Heap@26) (MapType0Type RefType))) (= (type newPMask@4) (MapType1Type RefType boolType))) (= (type ExhaleHeap@0) (MapType0Type RefType))) (= (type Unfolding1Mask@5) (MapType1Type RefType realType))) (= (type Heap@2) (MapType0Type RefType))) (= (type Heap@3) (MapType0Type RefType))) (= (type Heap@4) (MapType0Type RefType))) (= (type Heap@5) (MapType0Type RefType))) (= (type newPMask@0) (MapType1Type RefType boolType))) (= (type Heap@6) (MapType0Type RefType))) (= (type Heap@7) (MapType0Type RefType))) (= (type Heap@8) (MapType0Type RefType))) (= (type Heap@9) (MapType0Type RefType))) (= (type Heap@10) (MapType0Type RefType))) (= (type newPMask@1) (MapType1Type RefType boolType))) (= (type Heap@11) (MapType0Type RefType))) (= (type Heap@12) (MapType0Type RefType))) (= (type Heap@13) (MapType0Type RefType))) (= (type Heap@14) (MapType0Type RefType))) (= (type Heap@15) (MapType0Type RefType))) (= (type newPMask@2) (MapType1Type RefType boolType))) (= (type Heap@16) (MapType0Type RefType))) (= (type Unfolding1Mask@0) (MapType1Type RefType realType))) (= (type UnfoldingMask@5) (MapType1Type RefType realType))) (= (type Unfolding1Mask@1) (MapType1Type RefType realType))) (= (type Unfolding1Mask@2) (MapType1Type RefType realType))) (= (type Unfolding1Mask@3) (MapType1Type RefType realType))) (= (type Unfolding1Mask@4) (MapType1Type RefType realType))) (= (type UnfoldingMask@0) (MapType1Type RefType realType))) (= (type UnfoldingMask@1) (MapType1Type RefType realType))) (= (type UnfoldingMask@2) (MapType1Type RefType realType))) (= (type UnfoldingMask@3) (MapType1Type RefType realType))) (= (type UnfoldingMask@4) (MapType1Type RefType realType))) (= (type arg_a@0) RefType)) (= (type Heap@1) (MapType0Type RefType))) (= (type Mask@14) (MapType1Type RefType realType))) (= (type Mask@13) (MapType1Type RefType realType))) (= (type Mask@12) (MapType1Type RefType realType))) (= (type Mask@10) (MapType1Type RefType realType))) (= (type Mask@11) (MapType1Type RefType realType))) (= (type Mask@9) (MapType1Type RefType realType))) (= (type Mask@8) (MapType1Type RefType realType))) (= (type Mask@4) (MapType1Type RefType realType))) (= (type Mask@7) (MapType1Type RefType realType))) (= (type Mask@5) (MapType1Type RefType realType))) (= (type Mask@6) (MapType1Type RefType realType))) (= (type Heap@0) (MapType0Type RefType))) (= (type newVersion@0) FrameTypeType)) (= (type PostMask@0) (MapType1Type RefType realType))) (= (type PostMask@14) (MapType1Type RefType realType))) (= (type PostHeap@0) (MapType0Type RefType))) (= (type PostMask@12) (MapType1Type RefType realType))) (= (type PostMask@2) (MapType1Type RefType realType))) (= (type PostMask@3) (MapType1Type RefType realType))) (= (type PostMask@4) (MapType1Type RefType realType))) (= (type PostMask@1) (MapType1Type RefType realType))) (= (type Mask@26) (MapType1Type RefType realType))) (= (type Mask@25) (MapType1Type RefType realType))) (= (type Mask@2) (MapType1Type RefType realType))) (= (type Mask@1) (MapType1Type RefType realType))) (= (type Mask@0) (MapType1Type RefType realType))))
(set-info :boogie-vc-id vconcat)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 519) (let ((anon10_correct  (=> (and (= Mask@25 (MapType1Store Mask@3 null (heapseg b_2 c) (real_2_U (- (U_2_real (MapType1Select Mask@3 null (heapseg b_2 c))) FullPerm)))) (= (ControlFlow 0 510) (- 0 509))) (not (= b_2 c)))))
(let ((anon388_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 513) 510)) anon10_correct)))
(let ((anon388_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 511) (- 0 512)) (<= FullPerm (U_2_real (MapType1Select Mask@3 null (heapseg b_2 c))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@3 null (heapseg b_2 c)))) (=> (= (ControlFlow 0 511) 510) anon10_correct))))))
(let ((anon6_correct  (=> (and (= Mask@26 (MapType1Store Mask@3 null (heapseg a_2 b_2) (real_2_U (- (U_2_real (MapType1Select Mask@3 null (heapseg a_2 b_2))) FullPerm)))) (= (ControlFlow 0 505) (- 0 504))) (not (= a_2 b_2)))))
(let ((anon386_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 508) 505)) anon6_correct)))
(let ((anon386_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 506) (- 0 507)) (<= FullPerm (U_2_real (MapType1Select Mask@3 null (heapseg a_2 b_2))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@3 null (heapseg a_2 b_2)))) (=> (= (ControlFlow 0 506) 505) anon6_correct))))))
(let ((anon89_correct true))
(let ((anon430_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 493) 490)) anon89_correct)))
(let ((anon430_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 491) (- 0 492)) (<= FullPerm (U_2_real (MapType1Select Mask@3 null (tree c))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@3 null (tree c)))) (=> (= (ControlFlow 0 491) 490) anon89_correct))))))
(let ((anon85_correct true))
(let ((anon428_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 489) 486)) anon85_correct)))
(let ((anon428_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 487) (- 0 488)) (<= FullPerm (U_2_real (MapType1Select PostMask@1 null (tree c))))) (=> (<= FullPerm (U_2_real (MapType1Select PostMask@1 null (tree c)))) (=> (= (ControlFlow 0 487) 486) anon85_correct))))))
(let ((anon81_correct true))
(let ((anon426_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 484) 481)) anon81_correct)))
(let ((anon426_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 482) (- 0 483)) (<= FullPerm (U_2_real (MapType1Select Mask@3 null (tree c))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@3 null (tree c)))) (=> (= (ControlFlow 0 482) 481) anon81_correct))))))
(let ((anon77_correct true))
(let ((anon424_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 480) 477)) anon77_correct)))
(let ((anon424_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 478) (- 0 479)) (<= FullPerm (U_2_real (MapType1Select PostMask@1 null (tree c))))) (=> (<= FullPerm (U_2_real (MapType1Select PostMask@1 null (tree c)))) (=> (= (ControlFlow 0 478) 477) anon77_correct))))))
(let ((anon73_correct true))
(let ((anon422_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 476) 473)) anon73_correct)))
(let ((anon422_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 474) (- 0 475)) (<= FullPerm (U_2_real (MapType1Select Mask@3 null (tree c))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@3 null (tree c)))) (=> (= (ControlFlow 0 474) 473) anon73_correct))))))
(let ((anon69_correct true))
(let ((anon420_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 472) 469)) anon69_correct)))
(let ((anon420_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 470) (- 0 471)) (<= FullPerm (U_2_real (MapType1Select PostMask@1 null (tree c))))) (=> (<= FullPerm (U_2_real (MapType1Select PostMask@1 null (tree c)))) (=> (= (ControlFlow 0 470) 469) anon69_correct))))))
(let ((anon109_correct true))
(let ((anon441_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 463) 460)) anon109_correct)))
(let ((anon441_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 461) (- 0 462)) (<= FullPerm (U_2_real (MapType1Select Mask@3 null (heapseg b_2 c))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@3 null (heapseg b_2 c)))) (=> (= (ControlFlow 0 461) 460) anon109_correct))))))
(let ((anon122_correct  (=> (= (ControlFlow 0 454) (- 0 453)) (< 0 (segLength Heap@@61 b_2 c)))))
(let ((anon448_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 457) 454)) anon122_correct)))
(let ((anon448_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 455) (- 0 456)) (<= FullPerm (U_2_real (MapType1Select Mask@3 null (heapseg b_2 c))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@3 null (heapseg b_2 c)))) (=> (= (ControlFlow 0 455) 454) anon122_correct))))))
(let ((anon118_correct  (and (=> (= (ControlFlow 0 448) (- 0 449)) (<= 0 (- (segLength Heap@@61 a_2 b_2) 1))) (=> (<= 0 (- (segLength Heap@@61 a_2 b_2) 1)) (=> (= (ControlFlow 0 448) (- 0 447)) (< (- (segLength Heap@@61 a_2 b_2) 1) (segLength Heap@@61 a_2 b_2)))))))
(let ((anon446_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 452) 448)) anon118_correct)))
(let ((anon446_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 450) (- 0 451)) (<= FullPerm (U_2_real (MapType1Select Mask@3 null (heapseg a_2 b_2))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@3 null (heapseg a_2 b_2)))) (=> (= (ControlFlow 0 450) 448) anon118_correct))))))
(let ((anon114_correct true))
(let ((anon444_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 446) 443)) anon114_correct)))
(let ((anon444_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 444) (- 0 445)) (<= FullPerm (U_2_real (MapType1Select Mask@3 null (heapseg a_2 b_2))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@3 null (heapseg a_2 b_2)))) (=> (= (ControlFlow 0 444) 443) anon114_correct))))))
(let ((anon104_correct true))
(let ((anon438_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 441) 438)) anon104_correct)))
(let ((anon438_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 439) (- 0 440)) (<= FullPerm (U_2_real (MapType1Select Mask@3 null (heapseg a_2 b_2))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@3 null (heapseg a_2 b_2)))) (=> (= (ControlFlow 0 439) 438) anon104_correct))))))
(let ((anon99_correct true))
(let ((anon435_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 437) 434)) anon99_correct)))
(let ((anon435_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 435) (- 0 436)) (<= FullPerm (U_2_real (MapType1Select Mask@3 null (heapseg b_2 c))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@3 null (heapseg b_2 c)))) (=> (= (ControlFlow 0 435) 434) anon99_correct))))))
(let ((anon127_correct true))
(let ((anon451_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 430) 427)) anon127_correct)))
(let ((anon451_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 428) (- 0 429)) (<= FullPerm (U_2_real (MapType1Select PostMask@2 null (heapseg a_2 c))))) (=> (<= FullPerm (U_2_real (MapType1Select PostMask@2 null (heapseg a_2 c)))) (=> (= (ControlFlow 0 428) 427) anon127_correct))))))
(let ((anon147_correct true))
(let ((anon462_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 420) 417)) anon147_correct)))
(let ((anon462_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 418) (- 0 419)) (<= FullPerm (U_2_real (MapType1Select Mask@3 null (heapseg b_2 c))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@3 null (heapseg b_2 c)))) (=> (= (ControlFlow 0 418) 417) anon147_correct))))))
(let ((anon182_correct  (and (=> (= (ControlFlow 0 408) (- 0 409)) (<= 0 (- (segLength Heap@@61 a_2 b_2) 2))) (=> (<= 0 (- (segLength Heap@@61 a_2 b_2) 2)) (=> (= (ControlFlow 0 408) (- 0 407)) (< (- (segLength Heap@@61 a_2 b_2) 2) (segLength Heap@@61 a_2 b_2)))))))
(let ((anon481_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 412) 408)) anon182_correct)))
(let ((anon481_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 410) (- 0 411)) (<= FullPerm (U_2_real (MapType1Select Mask@3 null (heapseg a_2 b_2))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@3 null (heapseg a_2 b_2)))) (=> (= (ControlFlow 0 410) 408) anon182_correct))))))
(let ((anon178_correct true))
(let ((anon479_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 406) 403)) anon178_correct)))
(let ((anon479_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 404) (- 0 405)) (<= FullPerm (U_2_real (MapType1Select Mask@3 null (heapseg a_2 b_2))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@3 null (heapseg a_2 b_2)))) (=> (= (ControlFlow 0 404) 403) anon178_correct))))))
(let ((anon174_correct  (and (=> (= (ControlFlow 0 398) (- 0 399)) (<= 0 (- (segLength Heap@@61 a_2 b_2) 1))) (=> (<= 0 (- (segLength Heap@@61 a_2 b_2) 1)) (=> (= (ControlFlow 0 398) (- 0 397)) (< (- (segLength Heap@@61 a_2 b_2) 1) (segLength Heap@@61 a_2 b_2)))))))
(let ((anon477_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 402) 398)) anon174_correct)))
(let ((anon477_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 400) (- 0 401)) (<= FullPerm (U_2_real (MapType1Select Mask@3 null (heapseg a_2 b_2))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@3 null (heapseg a_2 b_2)))) (=> (= (ControlFlow 0 400) 398) anon174_correct))))))
(let ((anon170_correct true))
(let ((anon475_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 396) 393)) anon170_correct)))
(let ((anon475_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 394) (- 0 395)) (<= FullPerm (U_2_real (MapType1Select Mask@3 null (heapseg a_2 b_2))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@3 null (heapseg a_2 b_2)))) (=> (= (ControlFlow 0 394) 393) anon170_correct))))))
(let ((anon195_correct  (=> (= (ControlFlow 0 387) (- 0 386)) (< 0 (segLength Heap@@61 b_2 c)))))
(let ((anon488_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 390) 387)) anon195_correct)))
(let ((anon488_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 388) (- 0 389)) (<= FullPerm (U_2_real (MapType1Select Mask@3 null (heapseg b_2 c))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@3 null (heapseg b_2 c)))) (=> (= (ControlFlow 0 388) 387) anon195_correct))))))
(let ((anon191_correct  (and (=> (= (ControlFlow 0 381) (- 0 382)) (<= 0 (- (segLength Heap@@61 a_2 b_2) 1))) (=> (<= 0 (- (segLength Heap@@61 a_2 b_2) 1)) (=> (= (ControlFlow 0 381) (- 0 380)) (< (- (segLength Heap@@61 a_2 b_2) 1) (segLength Heap@@61 a_2 b_2)))))))
(let ((anon486_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 385) 381)) anon191_correct)))
(let ((anon486_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 383) (- 0 384)) (<= FullPerm (U_2_real (MapType1Select Mask@3 null (heapseg a_2 b_2))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@3 null (heapseg a_2 b_2)))) (=> (= (ControlFlow 0 383) 381) anon191_correct))))))
(let ((anon187_correct true))
(let ((anon484_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 379) 376)) anon187_correct)))
(let ((anon484_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 377) (- 0 378)) (<= FullPerm (U_2_real (MapType1Select Mask@3 null (heapseg a_2 b_2))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@3 null (heapseg a_2 b_2)))) (=> (= (ControlFlow 0 377) 376) anon187_correct))))))
(let ((anon209_correct  (=> (= (ControlFlow 0 369) (- 0 368)) (< 1 (segLength Heap@@61 b_2 c)))))
(let ((anon496_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 372) 369)) anon209_correct)))
(let ((anon496_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 370) (- 0 371)) (<= FullPerm (U_2_real (MapType1Select Mask@3 null (heapseg b_2 c))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@3 null (heapseg b_2 c)))) (=> (= (ControlFlow 0 370) 369) anon209_correct))))))
(let ((anon205_correct  (=> (= (ControlFlow 0 364) (- 0 363)) (< 0 (segLength Heap@@61 b_2 c)))))
(let ((anon494_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 367) 364)) anon205_correct)))
(let ((anon494_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 365) (- 0 366)) (<= FullPerm (U_2_real (MapType1Select Mask@3 null (heapseg b_2 c))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@3 null (heapseg b_2 c)))) (=> (= (ControlFlow 0 365) 364) anon205_correct))))))
(let ((anon222_correct  (=> (= (ControlFlow 0 357) (- 0 356)) (< 0 (segLength Heap@@61 b_2 c)))))
(let ((anon503_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 360) 357)) anon222_correct)))
(let ((anon503_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 358) (- 0 359)) (<= FullPerm (U_2_real (MapType1Select Mask@3 null (heapseg b_2 c))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@3 null (heapseg b_2 c)))) (=> (= (ControlFlow 0 358) 357) anon222_correct))))))
(let ((anon218_correct  (and (=> (= (ControlFlow 0 351) (- 0 352)) (<= 0 (- (segLength Heap@@61 a_2 b_2) 1))) (=> (<= 0 (- (segLength Heap@@61 a_2 b_2) 1)) (=> (= (ControlFlow 0 351) (- 0 350)) (< (- (segLength Heap@@61 a_2 b_2) 1) (segLength Heap@@61 a_2 b_2)))))))
(let ((anon501_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 355) 351)) anon218_correct)))
(let ((anon501_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 353) (- 0 354)) (<= FullPerm (U_2_real (MapType1Select Mask@3 null (heapseg a_2 b_2))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@3 null (heapseg a_2 b_2)))) (=> (= (ControlFlow 0 353) 351) anon218_correct))))))
(let ((anon214_correct true))
(let ((anon499_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 349) 346)) anon214_correct)))
(let ((anon499_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 347) (- 0 348)) (<= FullPerm (U_2_real (MapType1Select Mask@3 null (heapseg a_2 b_2))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@3 null (heapseg a_2 b_2)))) (=> (= (ControlFlow 0 347) 346) anon214_correct))))))
(let ((anon200_correct true))
(let ((anon491_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 344) 341)) anon200_correct)))
(let ((anon491_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 342) (- 0 343)) (<= FullPerm (U_2_real (MapType1Select Mask@3 null (heapseg b_2 c))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@3 null (heapseg b_2 c)))) (=> (= (ControlFlow 0 342) 341) anon200_correct))))))
(let ((anon165_correct true))
(let ((anon472_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 339) 336)) anon165_correct)))
(let ((anon472_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 337) (- 0 338)) (<= FullPerm (U_2_real (MapType1Select Mask@3 null (heapseg a_2 b_2))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@3 null (heapseg a_2 b_2)))) (=> (= (ControlFlow 0 337) 336) anon165_correct))))))
(let ((anon160_correct  (=> (= (ControlFlow 0 332) (- 0 331)) (< 0 (segLength Heap@@61 b_2 c)))))
(let ((anon469_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 335) 332)) anon160_correct)))
(let ((anon469_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 333) (- 0 334)) (<= FullPerm (U_2_real (MapType1Select Mask@3 null (heapseg b_2 c))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@3 null (heapseg b_2 c)))) (=> (= (ControlFlow 0 333) 332) anon160_correct))))))
(let ((anon156_correct  (and (=> (= (ControlFlow 0 326) (- 0 327)) (<= 0 (- (segLength Heap@@61 a_2 b_2) 1))) (=> (<= 0 (- (segLength Heap@@61 a_2 b_2) 1)) (=> (= (ControlFlow 0 326) (- 0 325)) (< (- (segLength Heap@@61 a_2 b_2) 1) (segLength Heap@@61 a_2 b_2)))))))
(let ((anon467_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 330) 326)) anon156_correct)))
(let ((anon467_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 328) (- 0 329)) (<= FullPerm (U_2_real (MapType1Select Mask@3 null (heapseg a_2 b_2))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@3 null (heapseg a_2 b_2)))) (=> (= (ControlFlow 0 328) 326) anon156_correct))))))
(let ((anon152_correct true))
(let ((anon465_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 324) 321)) anon152_correct)))
(let ((anon465_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 322) (- 0 323)) (<= FullPerm (U_2_real (MapType1Select Mask@3 null (heapseg a_2 b_2))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@3 null (heapseg a_2 b_2)))) (=> (= (ControlFlow 0 322) 321) anon152_correct))))))
(let ((anon142_correct true))
(let ((anon459_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 318) 315)) anon142_correct)))
(let ((anon459_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 316) (- 0 317)) (<= FullPerm (U_2_real (MapType1Select Mask@3 null (heapseg a_2 b_2))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@3 null (heapseg a_2 b_2)))) (=> (= (ControlFlow 0 316) 315) anon142_correct))))))
(let ((anon137_correct true))
(let ((anon456_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 314) 311)) anon137_correct)))
(let ((anon456_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 312) (- 0 313)) (<= FullPerm (U_2_real (MapType1Select Mask@3 null (heapseg b_2 c))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@3 null (heapseg b_2 c)))) (=> (= (ControlFlow 0 312) 311) anon137_correct))))))
(let ((anon227_correct true))
(let ((anon506_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 307) 304)) anon227_correct)))
(let ((anon506_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 305) (- 0 306)) (<= FullPerm (U_2_real (MapType1Select PostMask@2 null (heapseg a_2 c))))) (=> (<= FullPerm (U_2_real (MapType1Select PostMask@2 null (heapseg a_2 c)))) (=> (= (ControlFlow 0 305) 304) anon227_correct))))))
(let ((anon247_correct true))
(let ((anon517_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 297) 294)) anon247_correct)))
(let ((anon517_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 295) (- 0 296)) (<= FullPerm (U_2_real (MapType1Select Mask@3 null (heapseg b_2 c))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@3 null (heapseg b_2 c)))) (=> (= (ControlFlow 0 295) 294) anon247_correct))))))
(let ((anon260_correct  (=> (= (ControlFlow 0 288) (- 0 287)) (< 0 (segLength Heap@@61 b_2 c)))))
(let ((anon524_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 291) 288)) anon260_correct)))
(let ((anon524_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 289) (- 0 290)) (<= FullPerm (U_2_real (MapType1Select Mask@3 null (heapseg b_2 c))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@3 null (heapseg b_2 c)))) (=> (= (ControlFlow 0 289) 288) anon260_correct))))))
(let ((anon256_correct  (and (=> (= (ControlFlow 0 282) (- 0 283)) (<= 0 (- (segLength Heap@@61 a_2 b_2) 1))) (=> (<= 0 (- (segLength Heap@@61 a_2 b_2) 1)) (=> (= (ControlFlow 0 282) (- 0 281)) (< (- (segLength Heap@@61 a_2 b_2) 1) (segLength Heap@@61 a_2 b_2)))))))
(let ((anon522_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 286) 282)) anon256_correct)))
(let ((anon522_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 284) (- 0 285)) (<= FullPerm (U_2_real (MapType1Select Mask@3 null (heapseg a_2 b_2))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@3 null (heapseg a_2 b_2)))) (=> (= (ControlFlow 0 284) 282) anon256_correct))))))
(let ((anon252_correct true))
(let ((anon520_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 280) 277)) anon252_correct)))
(let ((anon520_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 278) (- 0 279)) (<= FullPerm (U_2_real (MapType1Select Mask@3 null (heapseg a_2 b_2))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@3 null (heapseg a_2 b_2)))) (=> (= (ControlFlow 0 278) 277) anon252_correct))))))
(let ((anon242_correct true))
(let ((anon514_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 275) 272)) anon242_correct)))
(let ((anon514_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 273) (- 0 274)) (<= FullPerm (U_2_real (MapType1Select Mask@3 null (heapseg a_2 b_2))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@3 null (heapseg a_2 b_2)))) (=> (= (ControlFlow 0 273) 272) anon242_correct))))))
(let ((anon237_correct true))
(let ((anon511_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 271) 268)) anon237_correct)))
(let ((anon511_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 269) (- 0 270)) (<= FullPerm (U_2_real (MapType1Select Mask@3 null (heapseg b_2 c))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@3 null (heapseg b_2 c)))) (=> (= (ControlFlow 0 269) 268) anon237_correct))))))
(let ((anon265_correct true))
(let ((anon527_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 264) 261)) anon265_correct)))
(let ((anon527_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 262) (- 0 263)) (<= FullPerm (U_2_real (MapType1Select PostMask@2 null (heapseg a_2 c))))) (=> (<= FullPerm (U_2_real (MapType1Select PostMask@2 null (heapseg a_2 c)))) (=> (= (ControlFlow 0 262) 261) anon265_correct))))))
(let ((anon287_correct  (=> (= (ControlFlow 0 252) (- 0 251)) (not (= a_2 b_2)))))
(let ((anon538_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 255) 252)) anon287_correct)))
(let ((anon538_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 253) (- 0 254)) (<= FullPerm (U_2_real (MapType1Select Mask@3 null (heapseg a_2 b_2))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@3 null (heapseg a_2 b_2)))) (=> (= (ControlFlow 0 253) 252) anon287_correct))))))
(let ((anon283_correct  (=> (and (= PostMask@4 (MapType1Store PostMask@2 null (heapseg a_2 c) (real_2_U (- (U_2_real (MapType1Select PostMask@2 null (heapseg a_2 c))) FullPerm)))) (= (ControlFlow 0 247) (- 0 246))) (not (= a_2 c)))))
(let ((anon536_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 250) 247)) anon283_correct)))
(let ((anon536_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 248) (- 0 249)) (<= FullPerm (U_2_real (MapType1Select PostMask@2 null (heapseg a_2 c))))) (=> (<= FullPerm (U_2_real (MapType1Select PostMask@2 null (heapseg a_2 c)))) (=> (= (ControlFlow 0 248) 247) anon283_correct))))))
(let ((anon297_correct  (=> (= (ControlFlow 0 238) (- 0 237)) (not (= b_2 c)))))
(let ((anon543_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 241) 238)) anon297_correct)))
(let ((anon543_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 239) (- 0 240)) (<= FullPerm (U_2_real (MapType1Select Mask@3 null (heapseg b_2 c))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@3 null (heapseg b_2 c)))) (=> (= (ControlFlow 0 239) 238) anon297_correct))))))
(let ((anon293_correct  (=> (and (= PostMask@3 (MapType1Store PostMask@2 null (heapseg a_2 c) (real_2_U (- (U_2_real (MapType1Select PostMask@2 null (heapseg a_2 c))) FullPerm)))) (= (ControlFlow 0 233) (- 0 232))) (not (= a_2 c)))))
(let ((anon541_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 236) 233)) anon293_correct)))
(let ((anon541_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 234) (- 0 235)) (<= FullPerm (U_2_real (MapType1Select PostMask@2 null (heapseg a_2 c))))) (=> (<= FullPerm (U_2_real (MapType1Select PostMask@2 null (heapseg a_2 c)))) (=> (= (ControlFlow 0 234) 233) anon293_correct))))))
(let ((anon299_correct true))
(let ((anon542_Else_correct  (=> (and (= (segParent PostHeap@0 a_2 c) (segParent Heap@@61 b_2 c)) (= (ControlFlow 0 231) 229)) anon299_correct)))
(let ((anon539_Then_correct  (=> (and (not (= b_2 c)) (state PostHeap@0 PostMask@2)) (and (and (and (and (=> (= (ControlFlow 0 242) 231) anon542_Else_correct) (=> (= (ControlFlow 0 242) 239) anon543_Then_correct)) (=> (= (ControlFlow 0 242) 241) anon543_Else_correct)) (=> (= (ControlFlow 0 242) 234) anon541_Then_correct)) (=> (= (ControlFlow 0 242) 236) anon541_Else_correct)))))
(let ((anon539_Else_correct  (=> (and (= b_2 c) (= (ControlFlow 0 230) 229)) anon299_correct)))
(let ((anon289_correct  (=> (state PostHeap@0 PostMask@2) (and (=> (= (ControlFlow 0 243) 242) anon539_Then_correct) (=> (= (ControlFlow 0 243) 230) anon539_Else_correct)))))
(let ((anon537_Else_correct  (=> (and (= (segParent PostHeap@0 a_2 c) (segParent Heap@@61 a_2 b_2)) (= (ControlFlow 0 245) 243)) anon289_correct)))
(let ((anon534_Then_correct  (=> (and (not (= a_2 b_2)) (state PostHeap@0 PostMask@2)) (and (and (and (and (=> (= (ControlFlow 0 256) 245) anon537_Else_correct) (=> (= (ControlFlow 0 256) 253) anon538_Then_correct)) (=> (= (ControlFlow 0 256) 255) anon538_Else_correct)) (=> (= (ControlFlow 0 256) 248) anon536_Then_correct)) (=> (= (ControlFlow 0 256) 250) anon536_Else_correct)))))
(let ((anon534_Else_correct  (=> (and (= a_2 b_2) (= (ControlFlow 0 244) 243)) anon289_correct)))
(let ((anon532_Else_correct  (=> (and (= (segSize PostHeap@0 a_2 c) (+ (segSize Heap@@61 a_2 b_2) (segSize Heap@@61 b_2 c))) (state PostHeap@0 PostMask@2)) (and (=> (= (ControlFlow 0 257) 256) anon534_Then_correct) (=> (= (ControlFlow 0 257) 244) anon534_Else_correct)))))
(let ((anon278_correct true))
(let ((anon533_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 228) 225)) anon278_correct)))
(let ((anon533_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 226) (- 0 227)) (<= FullPerm (U_2_real (MapType1Select Mask@3 null (heapseg b_2 c))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@3 null (heapseg b_2 c)))) (=> (= (ControlFlow 0 226) 225) anon278_correct))))))
(let ((anon274_correct true))
(let ((anon531_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 224) 221)) anon274_correct)))
(let ((anon531_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 222) (- 0 223)) (<= FullPerm (U_2_real (MapType1Select Mask@3 null (heapseg a_2 b_2))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@3 null (heapseg a_2 b_2)))) (=> (= (ControlFlow 0 222) 221) anon274_correct))))))
(let ((anon270_correct true))
(let ((anon529_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 220) 217)) anon270_correct)))
(let ((anon529_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 218) (- 0 219)) (<= FullPerm (U_2_real (MapType1Select PostMask@2 null (heapseg a_2 c))))) (=> (<= FullPerm (U_2_real (MapType1Select PostMask@2 null (heapseg a_2 c)))) (=> (= (ControlFlow 0 218) 217) anon270_correct))))))
(let ((anon267_correct  (=> (and (state PostHeap@0 PostMask@2) (state PostHeap@0 PostMask@2)) (and (and (and (and (and (and (=> (= (ControlFlow 0 258) 257) anon532_Else_correct) (=> (= (ControlFlow 0 258) 226) anon533_Then_correct)) (=> (= (ControlFlow 0 258) 228) anon533_Else_correct)) (=> (= (ControlFlow 0 258) 222) anon531_Then_correct)) (=> (= (ControlFlow 0 258) 224) anon531_Else_correct)) (=> (= (ControlFlow 0 258) 218) anon529_Then_correct)) (=> (= (ControlFlow 0 258) 220) anon529_Else_correct)))))
(let ((anon526_Else_correct  (=> (and (validChildren PostHeap@0 a_2 c) (= (ControlFlow 0 260) 258)) anon267_correct)))
(let ((anon525_Then_correct  (=> (and (and (validChildren Heap@@61 a_2 b_2) (and (validChildren Heap@@61 b_2 c) (=> (and (< 0 (segLength Heap@@61 a_2 b_2)) (< 0 (segLength Heap@@61 b_2 c))) (= (segDegree Heap@@61 a_2 b_2 (- (segLength Heap@@61 a_2 b_2) 1)) (+ (segDegree Heap@@61 b_2 c 0) 1))))) (state PostHeap@0 PostMask@2)) (and (and (=> (= (ControlFlow 0 265) 260) anon526_Else_correct) (=> (= (ControlFlow 0 265) 262) anon527_Then_correct)) (=> (= (ControlFlow 0 265) 264) anon527_Else_correct)))))
(let ((anon525_Else_correct  (=> (and (not (and (validChildren Heap@@61 a_2 b_2) (and (validChildren Heap@@61 b_2 c) (=> (and (< 0 (segLength Heap@@61 a_2 b_2)) (< 0 (segLength Heap@@61 b_2 c))) (= (segDegree Heap@@61 a_2 b_2 (- (segLength Heap@@61 a_2 b_2) 1)) (+ (segDegree Heap@@61 b_2 c 0) 1)))))) (= (ControlFlow 0 259) 258)) anon267_correct)))
(let ((anon518_Then_correct  (=> (and (< 0 (segLength Heap@@61 a_2 b_2)) (< 0 (segLength Heap@@61 b_2 c))) (and (and (and (and (and (and (and (=> (= (ControlFlow 0 292) 265) anon525_Then_correct) (=> (= (ControlFlow 0 292) 259) anon525_Else_correct)) (=> (= (ControlFlow 0 292) 289) anon524_Then_correct)) (=> (= (ControlFlow 0 292) 291) anon524_Else_correct)) (=> (= (ControlFlow 0 292) 284) anon522_Then_correct)) (=> (= (ControlFlow 0 292) 286) anon522_Else_correct)) (=> (= (ControlFlow 0 292) 278) anon520_Then_correct)) (=> (= (ControlFlow 0 292) 280) anon520_Else_correct)))))
(let ((anon518_Else_correct  (=> (not (and (< 0 (segLength Heap@@61 a_2 b_2)) (< 0 (segLength Heap@@61 b_2 c)))) (and (=> (= (ControlFlow 0 276) 265) anon525_Then_correct) (=> (= (ControlFlow 0 276) 259) anon525_Else_correct)))))
(let ((anon515_Then_correct  (=> (< 0 (segLength Heap@@61 a_2 b_2)) (and (and (and (=> (= (ControlFlow 0 298) 292) anon518_Then_correct) (=> (= (ControlFlow 0 298) 276) anon518_Else_correct)) (=> (= (ControlFlow 0 298) 295) anon517_Then_correct)) (=> (= (ControlFlow 0 298) 297) anon517_Else_correct)))))
(let ((anon515_Else_correct  (=> (<= (segLength Heap@@61 a_2 b_2) 0) (and (=> (= (ControlFlow 0 293) 292) anon518_Then_correct) (=> (= (ControlFlow 0 293) 276) anon518_Else_correct)))))
(let ((anon512_Then_correct  (=> (validChildren Heap@@61 b_2 c) (and (and (and (=> (= (ControlFlow 0 299) 298) anon515_Then_correct) (=> (= (ControlFlow 0 299) 293) anon515_Else_correct)) (=> (= (ControlFlow 0 299) 273) anon514_Then_correct)) (=> (= (ControlFlow 0 299) 275) anon514_Else_correct)))))
(let ((anon512_Else_correct  (=> (not (validChildren Heap@@61 b_2 c)) (and (=> (= (ControlFlow 0 267) 265) anon525_Then_correct) (=> (= (ControlFlow 0 267) 259) anon525_Else_correct)))))
(let ((anon509_Then_correct  (=> (validChildren Heap@@61 a_2 b_2) (and (and (and (=> (= (ControlFlow 0 300) 299) anon512_Then_correct) (=> (= (ControlFlow 0 300) 267) anon512_Else_correct)) (=> (= (ControlFlow 0 300) 269) anon511_Then_correct)) (=> (= (ControlFlow 0 300) 271) anon511_Else_correct)))))
(let ((anon509_Else_correct  (=> (not (validChildren Heap@@61 a_2 b_2)) (and (=> (= (ControlFlow 0 266) 265) anon525_Then_correct) (=> (= (ControlFlow 0 266) 259) anon525_Else_correct)))))
(let ((anon232_correct true))
(let ((anon508_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 216) 213)) anon232_correct)))
(let ((anon508_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 214) (- 0 215)) (<= FullPerm (U_2_real (MapType1Select Mask@3 null (heapseg a_2 b_2))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@3 null (heapseg a_2 b_2)))) (=> (= (ControlFlow 0 214) 213) anon232_correct))))))
(let ((anon229_correct  (=> (state PostHeap@0 PostMask@2) (and (and (and (=> (= (ControlFlow 0 301) 300) anon509_Then_correct) (=> (= (ControlFlow 0 301) 266) anon509_Else_correct)) (=> (= (ControlFlow 0 301) 214) anon508_Then_correct)) (=> (= (ControlFlow 0 301) 216) anon508_Else_correct)))))
(let ((anon505_Else_correct  (=> (and (presorted PostHeap@0 a_2 c) (= (ControlFlow 0 303) 301)) anon229_correct)))
(let ((anon504_Then_correct  (=> (and (and (presorted Heap@@61 a_2 b_2) (and (presorted Heap@@61 b_2 c) (=> (and (< 0 (segLength Heap@@61 a_2 b_2)) (< 0 (segLength Heap@@61 b_2 c))) (and (<= (segDegree Heap@@61 a_2 b_2 (- (segLength Heap@@61 a_2 b_2) 1)) (segDegree Heap@@61 b_2 c 0)) (and (=> (and (<= 2 (segLength Heap@@61 a_2 b_2)) (= (segDegree Heap@@61 a_2 b_2 (- (segLength Heap@@61 a_2 b_2) 1)) (segDegree Heap@@61 a_2 b_2 (- (segLength Heap@@61 a_2 b_2) 2)))) (< (segDegree Heap@@61 a_2 b_2 (- (segLength Heap@@61 a_2 b_2) 1)) (segDegree Heap@@61 b_2 c 0))) (=> (and (<= 2 (segLength Heap@@61 b_2 c)) (= (segDegree Heap@@61 b_2 c 0) (segDegree Heap@@61 b_2 c 1))) (< (segDegree Heap@@61 a_2 b_2 (- (segLength Heap@@61 a_2 b_2) 1)) (segDegree Heap@@61 b_2 c 0)))))))) (state PostHeap@0 PostMask@2)) (and (and (=> (= (ControlFlow 0 308) 303) anon505_Else_correct) (=> (= (ControlFlow 0 308) 305) anon506_Then_correct)) (=> (= (ControlFlow 0 308) 307) anon506_Else_correct)))))
(let ((anon504_Else_correct  (=> (and (not (and (presorted Heap@@61 a_2 b_2) (and (presorted Heap@@61 b_2 c) (=> (and (< 0 (segLength Heap@@61 a_2 b_2)) (< 0 (segLength Heap@@61 b_2 c))) (and (<= (segDegree Heap@@61 a_2 b_2 (- (segLength Heap@@61 a_2 b_2) 1)) (segDegree Heap@@61 b_2 c 0)) (and (=> (and (<= 2 (segLength Heap@@61 a_2 b_2)) (= (segDegree Heap@@61 a_2 b_2 (- (segLength Heap@@61 a_2 b_2) 1)) (segDegree Heap@@61 a_2 b_2 (- (segLength Heap@@61 a_2 b_2) 2)))) (< (segDegree Heap@@61 a_2 b_2 (- (segLength Heap@@61 a_2 b_2) 1)) (segDegree Heap@@61 b_2 c 0))) (=> (and (<= 2 (segLength Heap@@61 b_2 c)) (= (segDegree Heap@@61 b_2 c 0) (segDegree Heap@@61 b_2 c 1))) (< (segDegree Heap@@61 a_2 b_2 (- (segLength Heap@@61 a_2 b_2) 1)) (segDegree Heap@@61 b_2 c 0))))))))) (= (ControlFlow 0 302) 301)) anon229_correct)))
(let ((anon497_Then_correct  (=> (and (<= 2 (segLength Heap@@61 b_2 c)) (= (segDegree Heap@@61 b_2 c 0) (segDegree Heap@@61 b_2 c 1))) (and (and (and (and (and (and (and (=> (= (ControlFlow 0 361) 308) anon504_Then_correct) (=> (= (ControlFlow 0 361) 302) anon504_Else_correct)) (=> (= (ControlFlow 0 361) 358) anon503_Then_correct)) (=> (= (ControlFlow 0 361) 360) anon503_Else_correct)) (=> (= (ControlFlow 0 361) 353) anon501_Then_correct)) (=> (= (ControlFlow 0 361) 355) anon501_Else_correct)) (=> (= (ControlFlow 0 361) 347) anon499_Then_correct)) (=> (= (ControlFlow 0 361) 349) anon499_Else_correct)))))
(let ((anon497_Else_correct  (=> (not (and (<= 2 (segLength Heap@@61 b_2 c)) (= (segDegree Heap@@61 b_2 c 0) (segDegree Heap@@61 b_2 c 1)))) (and (=> (= (ControlFlow 0 345) 308) anon504_Then_correct) (=> (= (ControlFlow 0 345) 302) anon504_Else_correct)))))
(let ((anon492_Then_correct  (=> (<= 2 (segLength Heap@@61 b_2 c)) (and (and (and (and (and (=> (= (ControlFlow 0 373) 361) anon497_Then_correct) (=> (= (ControlFlow 0 373) 345) anon497_Else_correct)) (=> (= (ControlFlow 0 373) 370) anon496_Then_correct)) (=> (= (ControlFlow 0 373) 372) anon496_Else_correct)) (=> (= (ControlFlow 0 373) 365) anon494_Then_correct)) (=> (= (ControlFlow 0 373) 367) anon494_Else_correct)))))
(let ((anon492_Else_correct  (=> (< (segLength Heap@@61 b_2 c) 2) (and (=> (= (ControlFlow 0 362) 361) anon497_Then_correct) (=> (= (ControlFlow 0 362) 345) anon497_Else_correct)))))
(let ((anon489_Then_correct  (=> (=> (and (<= 2 (segLength Heap@@61 a_2 b_2)) (= (segDegree Heap@@61 a_2 b_2 (- (segLength Heap@@61 a_2 b_2) 1)) (segDegree Heap@@61 a_2 b_2 (- (segLength Heap@@61 a_2 b_2) 2)))) (< (segDegree Heap@@61 a_2 b_2 (- (segLength Heap@@61 a_2 b_2) 1)) (segDegree Heap@@61 b_2 c 0))) (and (and (and (=> (= (ControlFlow 0 374) 373) anon492_Then_correct) (=> (= (ControlFlow 0 374) 362) anon492_Else_correct)) (=> (= (ControlFlow 0 374) 342) anon491_Then_correct)) (=> (= (ControlFlow 0 374) 344) anon491_Else_correct)))))
(let ((anon489_Else_correct  (=> (not (=> (and (<= 2 (segLength Heap@@61 a_2 b_2)) (= (segDegree Heap@@61 a_2 b_2 (- (segLength Heap@@61 a_2 b_2) 1)) (segDegree Heap@@61 a_2 b_2 (- (segLength Heap@@61 a_2 b_2) 2)))) (< (segDegree Heap@@61 a_2 b_2 (- (segLength Heap@@61 a_2 b_2) 1)) (segDegree Heap@@61 b_2 c 0)))) (and (=> (= (ControlFlow 0 340) 308) anon504_Then_correct) (=> (= (ControlFlow 0 340) 302) anon504_Else_correct)))))
(let ((anon482_Then_correct  (=> (and (<= 2 (segLength Heap@@61 a_2 b_2)) (= (segDegree Heap@@61 a_2 b_2 (- (segLength Heap@@61 a_2 b_2) 1)) (segDegree Heap@@61 a_2 b_2 (- (segLength Heap@@61 a_2 b_2) 2)))) (and (and (and (and (and (and (and (=> (= (ControlFlow 0 391) 374) anon489_Then_correct) (=> (= (ControlFlow 0 391) 340) anon489_Else_correct)) (=> (= (ControlFlow 0 391) 388) anon488_Then_correct)) (=> (= (ControlFlow 0 391) 390) anon488_Else_correct)) (=> (= (ControlFlow 0 391) 383) anon486_Then_correct)) (=> (= (ControlFlow 0 391) 385) anon486_Else_correct)) (=> (= (ControlFlow 0 391) 377) anon484_Then_correct)) (=> (= (ControlFlow 0 391) 379) anon484_Else_correct)))))
(let ((anon482_Else_correct  (=> (not (and (<= 2 (segLength Heap@@61 a_2 b_2)) (= (segDegree Heap@@61 a_2 b_2 (- (segLength Heap@@61 a_2 b_2) 1)) (segDegree Heap@@61 a_2 b_2 (- (segLength Heap@@61 a_2 b_2) 2))))) (and (=> (= (ControlFlow 0 375) 374) anon489_Then_correct) (=> (= (ControlFlow 0 375) 340) anon489_Else_correct)))))
(let ((anon473_Then_correct  (=> (<= 2 (segLength Heap@@61 a_2 b_2)) (and (and (and (and (and (and (and (and (and (=> (= (ControlFlow 0 413) 391) anon482_Then_correct) (=> (= (ControlFlow 0 413) 375) anon482_Else_correct)) (=> (= (ControlFlow 0 413) 410) anon481_Then_correct)) (=> (= (ControlFlow 0 413) 412) anon481_Else_correct)) (=> (= (ControlFlow 0 413) 404) anon479_Then_correct)) (=> (= (ControlFlow 0 413) 406) anon479_Else_correct)) (=> (= (ControlFlow 0 413) 400) anon477_Then_correct)) (=> (= (ControlFlow 0 413) 402) anon477_Else_correct)) (=> (= (ControlFlow 0 413) 394) anon475_Then_correct)) (=> (= (ControlFlow 0 413) 396) anon475_Else_correct)))))
(let ((anon473_Else_correct  (=> (< (segLength Heap@@61 a_2 b_2) 2) (and (=> (= (ControlFlow 0 392) 391) anon482_Then_correct) (=> (= (ControlFlow 0 392) 375) anon482_Else_correct)))))
(let ((anon470_Then_correct  (=> (<= (segDegree Heap@@61 a_2 b_2 (- (segLength Heap@@61 a_2 b_2) 1)) (segDegree Heap@@61 b_2 c 0)) (and (and (and (=> (= (ControlFlow 0 414) 413) anon473_Then_correct) (=> (= (ControlFlow 0 414) 392) anon473_Else_correct)) (=> (= (ControlFlow 0 414) 337) anon472_Then_correct)) (=> (= (ControlFlow 0 414) 339) anon472_Else_correct)))))
(let ((anon470_Else_correct  (=> (< (segDegree Heap@@61 b_2 c 0) (segDegree Heap@@61 a_2 b_2 (- (segLength Heap@@61 a_2 b_2) 1))) (and (=> (= (ControlFlow 0 320) 308) anon504_Then_correct) (=> (= (ControlFlow 0 320) 302) anon504_Else_correct)))))
(let ((anon463_Then_correct  (=> (and (< 0 (segLength Heap@@61 a_2 b_2)) (< 0 (segLength Heap@@61 b_2 c))) (and (and (and (and (and (and (and (=> (= (ControlFlow 0 415) 414) anon470_Then_correct) (=> (= (ControlFlow 0 415) 320) anon470_Else_correct)) (=> (= (ControlFlow 0 415) 333) anon469_Then_correct)) (=> (= (ControlFlow 0 415) 335) anon469_Else_correct)) (=> (= (ControlFlow 0 415) 328) anon467_Then_correct)) (=> (= (ControlFlow 0 415) 330) anon467_Else_correct)) (=> (= (ControlFlow 0 415) 322) anon465_Then_correct)) (=> (= (ControlFlow 0 415) 324) anon465_Else_correct)))))
(let ((anon463_Else_correct  (=> (not (and (< 0 (segLength Heap@@61 a_2 b_2)) (< 0 (segLength Heap@@61 b_2 c)))) (and (=> (= (ControlFlow 0 319) 308) anon504_Then_correct) (=> (= (ControlFlow 0 319) 302) anon504_Else_correct)))))
(let ((anon460_Then_correct  (=> (< 0 (segLength Heap@@61 a_2 b_2)) (and (and (and (=> (= (ControlFlow 0 421) 415) anon463_Then_correct) (=> (= (ControlFlow 0 421) 319) anon463_Else_correct)) (=> (= (ControlFlow 0 421) 418) anon462_Then_correct)) (=> (= (ControlFlow 0 421) 420) anon462_Else_correct)))))
(let ((anon460_Else_correct  (=> (<= (segLength Heap@@61 a_2 b_2) 0) (and (=> (= (ControlFlow 0 416) 415) anon463_Then_correct) (=> (= (ControlFlow 0 416) 319) anon463_Else_correct)))))
(let ((anon457_Then_correct  (=> (presorted Heap@@61 b_2 c) (and (and (and (=> (= (ControlFlow 0 422) 421) anon460_Then_correct) (=> (= (ControlFlow 0 422) 416) anon460_Else_correct)) (=> (= (ControlFlow 0 422) 316) anon459_Then_correct)) (=> (= (ControlFlow 0 422) 318) anon459_Else_correct)))))
(let ((anon457_Else_correct  (=> (not (presorted Heap@@61 b_2 c)) (and (=> (= (ControlFlow 0 310) 308) anon504_Then_correct) (=> (= (ControlFlow 0 310) 302) anon504_Else_correct)))))
(let ((anon454_Then_correct  (=> (presorted Heap@@61 a_2 b_2) (and (and (and (=> (= (ControlFlow 0 423) 422) anon457_Then_correct) (=> (= (ControlFlow 0 423) 310) anon457_Else_correct)) (=> (= (ControlFlow 0 423) 312) anon456_Then_correct)) (=> (= (ControlFlow 0 423) 314) anon456_Else_correct)))))
(let ((anon454_Else_correct  (=> (not (presorted Heap@@61 a_2 b_2)) (and (=> (= (ControlFlow 0 309) 308) anon504_Then_correct) (=> (= (ControlFlow 0 309) 302) anon504_Else_correct)))))
(let ((anon132_correct true))
(let ((anon453_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 212) 209)) anon132_correct)))
(let ((anon453_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 210) (- 0 211)) (<= FullPerm (U_2_real (MapType1Select Mask@3 null (heapseg a_2 b_2))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@3 null (heapseg a_2 b_2)))) (=> (= (ControlFlow 0 210) 209) anon132_correct))))))
(let ((anon129_correct  (=> (state PostHeap@0 PostMask@2) (and (and (and (=> (= (ControlFlow 0 424) 423) anon454_Then_correct) (=> (= (ControlFlow 0 424) 309) anon454_Else_correct)) (=> (= (ControlFlow 0 424) 210) anon453_Then_correct)) (=> (= (ControlFlow 0 424) 212) anon453_Else_correct)))))
(let ((anon450_Else_correct  (=> (and (sorted PostHeap@0 a_2 c) (= (ControlFlow 0 426) 424)) anon129_correct)))
(let ((anon449_Then_correct  (=> (and (and (sorted Heap@@61 a_2 b_2) (and (sorted Heap@@61 b_2 c) (=> (and (< 0 (segLength Heap@@61 a_2 b_2)) (< 0 (segLength Heap@@61 b_2 c))) (< (segDegree Heap@@61 a_2 b_2 (- (segLength Heap@@61 a_2 b_2) 1)) (segDegree Heap@@61 b_2 c 0))))) (state PostHeap@0 PostMask@2)) (and (and (=> (= (ControlFlow 0 431) 426) anon450_Else_correct) (=> (= (ControlFlow 0 431) 428) anon451_Then_correct)) (=> (= (ControlFlow 0 431) 430) anon451_Else_correct)))))
(let ((anon449_Else_correct  (=> (and (not (and (sorted Heap@@61 a_2 b_2) (and (sorted Heap@@61 b_2 c) (=> (and (< 0 (segLength Heap@@61 a_2 b_2)) (< 0 (segLength Heap@@61 b_2 c))) (< (segDegree Heap@@61 a_2 b_2 (- (segLength Heap@@61 a_2 b_2) 1)) (segDegree Heap@@61 b_2 c 0)))))) (= (ControlFlow 0 425) 424)) anon129_correct)))
(let ((anon442_Then_correct  (=> (and (< 0 (segLength Heap@@61 a_2 b_2)) (< 0 (segLength Heap@@61 b_2 c))) (and (and (and (and (and (and (and (=> (= (ControlFlow 0 458) 431) anon449_Then_correct) (=> (= (ControlFlow 0 458) 425) anon449_Else_correct)) (=> (= (ControlFlow 0 458) 455) anon448_Then_correct)) (=> (= (ControlFlow 0 458) 457) anon448_Else_correct)) (=> (= (ControlFlow 0 458) 450) anon446_Then_correct)) (=> (= (ControlFlow 0 458) 452) anon446_Else_correct)) (=> (= (ControlFlow 0 458) 444) anon444_Then_correct)) (=> (= (ControlFlow 0 458) 446) anon444_Else_correct)))))
(let ((anon442_Else_correct  (=> (not (and (< 0 (segLength Heap@@61 a_2 b_2)) (< 0 (segLength Heap@@61 b_2 c)))) (and (=> (= (ControlFlow 0 442) 431) anon449_Then_correct) (=> (= (ControlFlow 0 442) 425) anon449_Else_correct)))))
(let ((anon439_Then_correct  (=> (< 0 (segLength Heap@@61 a_2 b_2)) (and (and (and (=> (= (ControlFlow 0 464) 458) anon442_Then_correct) (=> (= (ControlFlow 0 464) 442) anon442_Else_correct)) (=> (= (ControlFlow 0 464) 461) anon441_Then_correct)) (=> (= (ControlFlow 0 464) 463) anon441_Else_correct)))))
(let ((anon439_Else_correct  (=> (<= (segLength Heap@@61 a_2 b_2) 0) (and (=> (= (ControlFlow 0 459) 458) anon442_Then_correct) (=> (= (ControlFlow 0 459) 442) anon442_Else_correct)))))
(let ((anon436_Then_correct  (=> (sorted Heap@@61 b_2 c) (and (and (and (=> (= (ControlFlow 0 465) 464) anon439_Then_correct) (=> (= (ControlFlow 0 465) 459) anon439_Else_correct)) (=> (= (ControlFlow 0 465) 439) anon438_Then_correct)) (=> (= (ControlFlow 0 465) 441) anon438_Else_correct)))))
(let ((anon436_Else_correct  (=> (not (sorted Heap@@61 b_2 c)) (and (=> (= (ControlFlow 0 433) 431) anon449_Then_correct) (=> (= (ControlFlow 0 433) 425) anon449_Else_correct)))))
(let ((anon433_Then_correct  (=> (sorted Heap@@61 a_2 b_2) (and (and (and (=> (= (ControlFlow 0 466) 465) anon436_Then_correct) (=> (= (ControlFlow 0 466) 433) anon436_Else_correct)) (=> (= (ControlFlow 0 466) 435) anon435_Then_correct)) (=> (= (ControlFlow 0 466) 437) anon435_Else_correct)))))
(let ((anon433_Else_correct  (=> (not (sorted Heap@@61 a_2 b_2)) (and (=> (= (ControlFlow 0 432) 431) anon449_Then_correct) (=> (= (ControlFlow 0 432) 425) anon449_Else_correct)))))
(let ((anon94_correct true))
(let ((anon432_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 208) 205)) anon94_correct)))
(let ((anon432_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 206) (- 0 207)) (<= FullPerm (U_2_real (MapType1Select Mask@3 null (heapseg a_2 b_2))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@3 null (heapseg a_2 b_2)))) (=> (= (ControlFlow 0 206) 205) anon94_correct))))))
(let ((anon91_correct  (=> (state PostHeap@0 PostMask@2) (and (and (and (=> (= (ControlFlow 0 467) 466) anon433_Then_correct) (=> (= (ControlFlow 0 467) 432) anon433_Else_correct)) (=> (= (ControlFlow 0 467) 206) anon432_Then_correct)) (=> (= (ControlFlow 0 467) 208) anon432_Else_correct)))))
(let ((anon429_Else_correct  (=> (= (treeParent PostHeap@0 c) (treeParent Heap@@61 c)) (=> (and (= PostMask@2 PostMask@1) (= (ControlFlow 0 485) 467)) anon91_correct))))
(let ((anon425_Else_correct  (=> (and (= (treeSize PostHeap@0 c) (treeSize Heap@@61 c)) (state PostHeap@0 PostMask@1)) (and (and (and (and (=> (= (ControlFlow 0 494) 485) anon429_Else_correct) (=> (= (ControlFlow 0 494) 491) anon430_Then_correct)) (=> (= (ControlFlow 0 494) 493) anon430_Else_correct)) (=> (= (ControlFlow 0 494) 487) anon428_Then_correct)) (=> (= (ControlFlow 0 494) 489) anon428_Else_correct)))))
(let ((anon421_Else_correct  (=> (and (= (treeDegree PostHeap@0 c) (treeDegree Heap@@61 c)) (state PostHeap@0 PostMask@1)) (and (and (and (and (=> (= (ControlFlow 0 495) 494) anon425_Else_correct) (=> (= (ControlFlow 0 495) 482) anon426_Then_correct)) (=> (= (ControlFlow 0 495) 484) anon426_Else_correct)) (=> (= (ControlFlow 0 495) 478) anon424_Then_correct)) (=> (= (ControlFlow 0 495) 480) anon424_Else_correct)))))
(let ((anon418_Then_correct  (=> (and (and (not (= c null)) (= PostMask@1 (MapType1Store PostMask@0 null (tree c) (real_2_U (+ (U_2_real (MapType1Select PostMask@0 null (tree c))) FullPerm))))) (and (state PostHeap@0 PostMask@1) (state PostHeap@0 PostMask@1))) (and (and (and (and (=> (= (ControlFlow 0 496) 495) anon421_Else_correct) (=> (= (ControlFlow 0 496) 474) anon422_Then_correct)) (=> (= (ControlFlow 0 496) 476) anon422_Else_correct)) (=> (= (ControlFlow 0 496) 470) anon420_Then_correct)) (=> (= (ControlFlow 0 496) 472) anon420_Else_correct)))))
(let ((anon418_Else_correct  (=> (= c null) (=> (and (= PostMask@2 PostMask@0) (= (ControlFlow 0 468) 467)) anon91_correct))))
(let ((anon405_Else_correct  (=> (and (forall ((i_3 Int) ) (!  (=> (and (<= (segLength Heap@@61 a_2 b_2) i_3) (< i_3 (segLength PostHeap@0 a_2 c))) (= (segDegree PostHeap@0 a_2 c i_3) (segDegree Heap@@61 b_2 c (- i_3 (segLength Heap@@61 a_2 b_2)))))
 :qid |stdinbpl.3582:20|
 :skolemid |114|
 :pattern ( (|segDegree#frame| (MapType0Select PostHeap@0 null (heapseg a_2 c)) a_2 c i_3))
)) (state PostHeap@0 PostMask@0)) (and (=> (= (ControlFlow 0 497) 496) anon418_Then_correct) (=> (= (ControlFlow 0 497) 468) anon418_Else_correct)))))
(let ((anon50_correct true))
(let ((anon410_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 203) 200)) anon50_correct)))
(let ((anon410_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 201) (- 0 202)) (<= FullPerm (U_2_real (MapType1Select PostMask@0 null (heapseg a_2 c))))) (=> (<= FullPerm (U_2_real (MapType1Select PostMask@0 null (heapseg a_2 c)))) (=> (= (ControlFlow 0 201) 200) anon50_correct))))))
(let ((anon63_correct  (and (=> (= (ControlFlow 0 193) (- 0 194)) (<= 0 (- i_2 (segLength Heap@@61 a_2 b_2)))) (=> (<= 0 (- i_2 (segLength Heap@@61 a_2 b_2))) (=> (= (ControlFlow 0 193) (- 0 192)) (< (- i_2 (segLength Heap@@61 a_2 b_2)) (segLength Heap@@61 b_2 c)))))))
(let ((anon417_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 197) 193)) anon63_correct)))
(let ((anon417_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 195) (- 0 196)) (<= FullPerm (U_2_real (MapType1Select Mask@3 null (heapseg b_2 c))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@3 null (heapseg b_2 c)))) (=> (= (ControlFlow 0 195) 193) anon63_correct))))))
(let ((anon59_correct true))
(let ((anon415_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 191) 188)) anon59_correct)))
(let ((anon415_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 189) (- 0 190)) (<= FullPerm (U_2_real (MapType1Select Mask@3 null (heapseg a_2 b_2))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@3 null (heapseg a_2 b_2)))) (=> (= (ControlFlow 0 189) 188) anon59_correct))))))
(let ((anon55_correct  (=> (= PostMask@12 (MapType1Store PostMask@0 null (heapseg a_2 c) (real_2_U (- (U_2_real (MapType1Select PostMask@0 null (heapseg a_2 c))) FullPerm)))) (and (=> (= (ControlFlow 0 183) (- 0 184)) (<= 0 i_2)) (=> (<= 0 i_2) (=> (= (ControlFlow 0 183) (- 0 182)) (< i_2 (segLength PostHeap@0 a_2 c))))))))
(let ((anon413_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 187) 183)) anon55_correct)))
(let ((anon413_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 185) (- 0 186)) (<= FullPerm (U_2_real (MapType1Select PostMask@0 null (heapseg a_2 c))))) (=> (<= FullPerm (U_2_real (MapType1Select PostMask@0 null (heapseg a_2 c)))) (=> (= (ControlFlow 0 185) 183) anon55_correct))))))
(let ((anon64_correct true))
(let ((anon411_Then_correct  (=> (and (<= (segLength Heap@@61 a_2 b_2) i_2) (< i_2 (segLength PostHeap@0 a_2 c))) (and (and (and (and (and (and (=> (= (ControlFlow 0 198) 180) anon64_correct) (=> (= (ControlFlow 0 198) 195) anon417_Then_correct)) (=> (= (ControlFlow 0 198) 197) anon417_Else_correct)) (=> (= (ControlFlow 0 198) 189) anon415_Then_correct)) (=> (= (ControlFlow 0 198) 191) anon415_Else_correct)) (=> (= (ControlFlow 0 198) 185) anon413_Then_correct)) (=> (= (ControlFlow 0 198) 187) anon413_Else_correct)))))
(let ((anon411_Else_correct  (=> (and (not (and (<= (segLength Heap@@61 a_2 b_2) i_2) (< i_2 (segLength PostHeap@0 a_2 c)))) (= (ControlFlow 0 181) 180)) anon64_correct)))
(let ((anon408_Then_correct  (=> (<= (segLength Heap@@61 a_2 b_2) i_2) (and (and (and (=> (= (ControlFlow 0 204) 198) anon411_Then_correct) (=> (= (ControlFlow 0 204) 181) anon411_Else_correct)) (=> (= (ControlFlow 0 204) 201) anon410_Then_correct)) (=> (= (ControlFlow 0 204) 203) anon410_Else_correct)))))
(let ((anon408_Else_correct  (=> (< i_2 (segLength Heap@@61 a_2 b_2)) (and (=> (= (ControlFlow 0 199) 198) anon411_Then_correct) (=> (= (ControlFlow 0 199) 181) anon411_Else_correct)))))
(let ((anon45_correct true))
(let ((anon407_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 179) 176)) anon45_correct)))
(let ((anon407_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 177) (- 0 178)) (<= FullPerm (U_2_real (MapType1Select Mask@3 null (heapseg a_2 b_2))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@3 null (heapseg a_2 b_2)))) (=> (= (ControlFlow 0 177) 176) anon45_correct))))))
(let ((anon396_Else_correct  (=> (forall ((i_1 Int) ) (!  (=> (and (<= 0 i_1) (< i_1 (segLength Heap@@61 a_2 b_2))) (= (segDegree PostHeap@0 a_2 c i_1) (segDegree Heap@@61 a_2 b_2 i_1)))
 :qid |stdinbpl.3486:20|
 :skolemid |113|
 :pattern ( (|segDegree#frame| (MapType0Select PostHeap@0 null (heapseg a_2 c)) a_2 c i_1))
 :pattern ( (|segDegree#frame| (MapType0Select Heap@@61 null (heapseg a_2 b_2)) a_2 b_2 i_1))
)) (=> (and (state PostHeap@0 PostMask@0) (state PostHeap@0 PostMask@0)) (and (and (and (and (=> (= (ControlFlow 0 498) 497) anon405_Else_correct) (=> (= (ControlFlow 0 498) 204) anon408_Then_correct)) (=> (= (ControlFlow 0 498) 199) anon408_Else_correct)) (=> (= (ControlFlow 0 498) 177) anon407_Then_correct)) (=> (= (ControlFlow 0 498) 179) anon407_Else_correct))))))
(let ((anon30_correct true))
(let ((anon399_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 174) 171)) anon30_correct)))
(let ((anon399_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 172) (- 0 173)) (<= FullPerm (U_2_real (MapType1Select Mask@3 null (heapseg a_2 b_2))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@3 null (heapseg a_2 b_2)))) (=> (= (ControlFlow 0 172) 171) anon30_correct))))))
(let ((anon39_correct  (and (=> (= (ControlFlow 0 164) (- 0 165)) (<= 0 i)) (=> (<= 0 i) (=> (= (ControlFlow 0 164) (- 0 163)) (< i (segLength Heap@@61 a_2 b_2)))))))
(let ((anon404_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 168) 164)) anon39_correct)))
(let ((anon404_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 166) (- 0 167)) (<= FullPerm (U_2_real (MapType1Select Mask@3 null (heapseg a_2 b_2))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@3 null (heapseg a_2 b_2)))) (=> (= (ControlFlow 0 166) 164) anon39_correct))))))
(let ((anon35_correct  (=> (= PostMask@14 (MapType1Store PostMask@0 null (heapseg a_2 c) (real_2_U (- (U_2_real (MapType1Select PostMask@0 null (heapseg a_2 c))) FullPerm)))) (and (=> (= (ControlFlow 0 158) (- 0 159)) (<= 0 i)) (=> (<= 0 i) (=> (= (ControlFlow 0 158) (- 0 157)) (< i (segLength PostHeap@0 a_2 c))))))))
(let ((anon402_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 162) 158)) anon35_correct)))
(let ((anon402_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 160) (- 0 161)) (<= FullPerm (U_2_real (MapType1Select PostMask@0 null (heapseg a_2 c))))) (=> (<= FullPerm (U_2_real (MapType1Select PostMask@0 null (heapseg a_2 c)))) (=> (= (ControlFlow 0 160) 158) anon35_correct))))))
(let ((anon40_correct true))
(let ((anon400_Then_correct  (=> (and (<= 0 i) (< i (segLength Heap@@61 a_2 b_2))) (and (and (and (and (=> (= (ControlFlow 0 169) 155) anon40_correct) (=> (= (ControlFlow 0 169) 166) anon404_Then_correct)) (=> (= (ControlFlow 0 169) 168) anon404_Else_correct)) (=> (= (ControlFlow 0 169) 160) anon402_Then_correct)) (=> (= (ControlFlow 0 169) 162) anon402_Else_correct)))))
(let ((anon400_Else_correct  (=> (and (not (and (<= 0 i) (< i (segLength Heap@@61 a_2 b_2)))) (= (ControlFlow 0 156) 155)) anon40_correct)))
(let ((anon397_Then_correct  (=> (<= 0 i) (and (and (and (=> (= (ControlFlow 0 175) 169) anon400_Then_correct) (=> (= (ControlFlow 0 175) 156) anon400_Else_correct)) (=> (= (ControlFlow 0 175) 172) anon399_Then_correct)) (=> (= (ControlFlow 0 175) 174) anon399_Else_correct)))))
(let ((anon397_Else_correct  (=> (< i 0) (and (=> (= (ControlFlow 0 170) 169) anon400_Then_correct) (=> (= (ControlFlow 0 170) 156) anon400_Else_correct)))))
(let ((anon394_Else_correct  (=> (= (segLength PostHeap@0 a_2 c) (+ (segLength Heap@@61 a_2 b_2) (segLength Heap@@61 b_2 c))) (=> (and (state PostHeap@0 PostMask@0) (state PostHeap@0 PostMask@0)) (and (and (=> (= (ControlFlow 0 499) 498) anon396_Else_correct) (=> (= (ControlFlow 0 499) 175) anon397_Then_correct)) (=> (= (ControlFlow 0 499) 170) anon397_Else_correct))))))
(let ((anon24_correct true))
(let ((anon395_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 154) 151)) anon24_correct)))
(let ((anon395_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 152) (- 0 153)) (<= FullPerm (U_2_real (MapType1Select Mask@3 null (heapseg b_2 c))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@3 null (heapseg b_2 c)))) (=> (= (ControlFlow 0 152) 151) anon24_correct))))))
(let ((anon20_correct true))
(let ((anon393_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 150) 147)) anon20_correct)))
(let ((anon393_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 148) (- 0 149)) (<= FullPerm (U_2_real (MapType1Select Mask@3 null (heapseg a_2 b_2))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@3 null (heapseg a_2 b_2)))) (=> (= (ControlFlow 0 148) 147) anon20_correct))))))
(let ((anon16_correct true))
(let ((anon391_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 146) 143)) anon16_correct)))
(let ((anon391_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 144) (- 0 145)) (<= FullPerm (U_2_real (MapType1Select PostMask@0 null (heapseg a_2 c))))) (=> (<= FullPerm (U_2_real (MapType1Select PostMask@0 null (heapseg a_2 c)))) (=> (= (ControlFlow 0 144) 143) anon16_correct))))))
(let ((anon389_Then_correct  (=> (state PostHeap@0 ZeroMask) (=> (and (and (= PostMask@0 (MapType1Store ZeroMask null (heapseg a_2 c) (real_2_U (+ (U_2_real (MapType1Select ZeroMask null (heapseg a_2 c))) FullPerm)))) (state PostHeap@0 PostMask@0)) (and (state PostHeap@0 PostMask@0) (state PostHeap@0 PostMask@0))) (and (and (and (and (and (and (=> (= (ControlFlow 0 500) 499) anon394_Else_correct) (=> (= (ControlFlow 0 500) 152) anon395_Then_correct)) (=> (= (ControlFlow 0 500) 154) anon395_Else_correct)) (=> (= (ControlFlow 0 500) 148) anon393_Then_correct)) (=> (= (ControlFlow 0 500) 150) anon393_Else_correct)) (=> (= (ControlFlow 0 500) 144) anon391_Then_correct)) (=> (= (ControlFlow 0 500) 146) anon391_Else_correct))))))
(let ((anon382_correct true))
(let ((anon585_Else_correct  (=> (and (= b_2 c) (= (ControlFlow 0 12) 9)) anon382_correct)))
(let ((anon585_Then_correct  (=> (not (= b_2 c)) (and (=> (= (ControlFlow 0 10) (- 0 11)) (= (segParent Heap@35 a_2 c) (segParent Heap@@61 b_2 c))) (=> (= (segParent Heap@35 a_2 c) (segParent Heap@@61 b_2 c)) (=> (= (ControlFlow 0 10) 9) anon382_correct))))))
(let ((anon584_Else_correct  (=> (= a_2 b_2) (and (=> (= (ControlFlow 0 15) 10) anon585_Then_correct) (=> (= (ControlFlow 0 15) 12) anon585_Else_correct)))))
(let ((anon584_Then_correct  (=> (not (= a_2 b_2)) (and (=> (= (ControlFlow 0 13) (- 0 14)) (= (segParent Heap@35 a_2 c) (segParent Heap@@61 a_2 b_2))) (=> (= (segParent Heap@35 a_2 c) (segParent Heap@@61 a_2 b_2)) (and (=> (= (ControlFlow 0 13) 10) anon585_Then_correct) (=> (= (ControlFlow 0 13) 12) anon585_Else_correct)))))))
(let ((anon378_correct  (and (=> (= (ControlFlow 0 16) (- 0 17)) (= (segSize Heap@35 a_2 c) (+ (segSize Heap@@61 a_2 b_2) (segSize Heap@@61 b_2 c)))) (=> (= (segSize Heap@35 a_2 c) (+ (segSize Heap@@61 a_2 b_2) (segSize Heap@@61 b_2 c))) (and (=> (= (ControlFlow 0 16) 13) anon584_Then_correct) (=> (= (ControlFlow 0 16) 15) anon584_Else_correct))))))
(let ((anon583_Else_correct  (=> (and (not (and (validChildren Heap@@61 a_2 b_2) (and (validChildren Heap@@61 b_2 c) (=> (and (< 0 (segLength Heap@@61 a_2 b_2)) (< 0 (segLength Heap@@61 b_2 c))) (= (segDegree Heap@@61 a_2 b_2 (- (segLength Heap@@61 a_2 b_2) 1)) (+ (segDegree Heap@@61 b_2 c 0) 1)))))) (= (ControlFlow 0 20) 16)) anon378_correct)))
(let ((anon583_Then_correct  (=> (and (validChildren Heap@@61 a_2 b_2) (and (validChildren Heap@@61 b_2 c) (=> (and (< 0 (segLength Heap@@61 a_2 b_2)) (< 0 (segLength Heap@@61 b_2 c))) (= (segDegree Heap@@61 a_2 b_2 (- (segLength Heap@@61 a_2 b_2) 1)) (+ (segDegree Heap@@61 b_2 c 0) 1))))) (and (=> (= (ControlFlow 0 18) (- 0 19)) (validChildren Heap@35 a_2 c)) (=> (validChildren Heap@35 a_2 c) (=> (= (ControlFlow 0 18) 16) anon378_correct))))))
(let ((anon582_Else_correct  (=> (not (and (presorted Heap@@61 a_2 b_2) (and (presorted Heap@@61 b_2 c) (=> (and (< 0 (segLength Heap@@61 a_2 b_2)) (< 0 (segLength Heap@@61 b_2 c))) (and (<= (segDegree Heap@@61 a_2 b_2 (- (segLength Heap@@61 a_2 b_2) 1)) (segDegree Heap@@61 b_2 c 0)) (and (=> (and (<= 2 (segLength Heap@@61 a_2 b_2)) (= (segDegree Heap@@61 a_2 b_2 (- (segLength Heap@@61 a_2 b_2) 1)) (segDegree Heap@@61 a_2 b_2 (- (segLength Heap@@61 a_2 b_2) 2)))) (< (segDegree Heap@@61 a_2 b_2 (- (segLength Heap@@61 a_2 b_2) 1)) (segDegree Heap@@61 b_2 c 0))) (=> (and (<= 2 (segLength Heap@@61 b_2 c)) (= (segDegree Heap@@61 b_2 c 0) (segDegree Heap@@61 b_2 c 1))) (< (segDegree Heap@@61 a_2 b_2 (- (segLength Heap@@61 a_2 b_2) 1)) (segDegree Heap@@61 b_2 c 0))))))))) (and (=> (= (ControlFlow 0 23) 18) anon583_Then_correct) (=> (= (ControlFlow 0 23) 20) anon583_Else_correct)))))
(let ((anon582_Then_correct  (=> (and (presorted Heap@@61 a_2 b_2) (and (presorted Heap@@61 b_2 c) (=> (and (< 0 (segLength Heap@@61 a_2 b_2)) (< 0 (segLength Heap@@61 b_2 c))) (and (<= (segDegree Heap@@61 a_2 b_2 (- (segLength Heap@@61 a_2 b_2) 1)) (segDegree Heap@@61 b_2 c 0)) (and (=> (and (<= 2 (segLength Heap@@61 a_2 b_2)) (= (segDegree Heap@@61 a_2 b_2 (- (segLength Heap@@61 a_2 b_2) 1)) (segDegree Heap@@61 a_2 b_2 (- (segLength Heap@@61 a_2 b_2) 2)))) (< (segDegree Heap@@61 a_2 b_2 (- (segLength Heap@@61 a_2 b_2) 1)) (segDegree Heap@@61 b_2 c 0))) (=> (and (<= 2 (segLength Heap@@61 b_2 c)) (= (segDegree Heap@@61 b_2 c 0) (segDegree Heap@@61 b_2 c 1))) (< (segDegree Heap@@61 a_2 b_2 (- (segLength Heap@@61 a_2 b_2) 1)) (segDegree Heap@@61 b_2 c 0)))))))) (and (=> (= (ControlFlow 0 21) (- 0 22)) (presorted Heap@35 a_2 c)) (=> (presorted Heap@35 a_2 c) (and (=> (= (ControlFlow 0 21) 18) anon583_Then_correct) (=> (= (ControlFlow 0 21) 20) anon583_Else_correct)))))))
(let ((anon581_Else_correct  (=> (not (and (sorted Heap@@61 a_2 b_2) (and (sorted Heap@@61 b_2 c) (=> (and (< 0 (segLength Heap@@61 a_2 b_2)) (< 0 (segLength Heap@@61 b_2 c))) (< (segDegree Heap@@61 a_2 b_2 (- (segLength Heap@@61 a_2 b_2) 1)) (segDegree Heap@@61 b_2 c 0)))))) (and (=> (= (ControlFlow 0 26) 21) anon582_Then_correct) (=> (= (ControlFlow 0 26) 23) anon582_Else_correct)))))
(let ((anon581_Then_correct  (=> (and (sorted Heap@@61 a_2 b_2) (and (sorted Heap@@61 b_2 c) (=> (and (< 0 (segLength Heap@@61 a_2 b_2)) (< 0 (segLength Heap@@61 b_2 c))) (< (segDegree Heap@@61 a_2 b_2 (- (segLength Heap@@61 a_2 b_2) 1)) (segDegree Heap@@61 b_2 c 0))))) (and (=> (= (ControlFlow 0 24) (- 0 25)) (sorted Heap@35 a_2 c)) (=> (sorted Heap@35 a_2 c) (and (=> (= (ControlFlow 0 24) 21) anon582_Then_correct) (=> (= (ControlFlow 0 24) 23) anon582_Else_correct)))))))
(let ((anon371_correct  (=> (= Mask@23 (MapType1Store Mask@22 null (tree c) (real_2_U (- (U_2_real (MapType1Select Mask@22 null (tree c))) FullPerm)))) (and (=> (= (ControlFlow 0 28) (- 0 31)) (= (treeDegree Heap@35 c) (treeDegree Heap@@61 c))) (=> (= (treeDegree Heap@35 c) (treeDegree Heap@@61 c)) (and (=> (= (ControlFlow 0 28) (- 0 30)) (= (treeSize Heap@35 c) (treeSize Heap@@61 c))) (=> (= (treeSize Heap@35 c) (treeSize Heap@@61 c)) (and (=> (= (ControlFlow 0 28) (- 0 29)) (= (treeParent Heap@35 c) (treeParent Heap@@61 c))) (=> (= (treeParent Heap@35 c) (treeParent Heap@@61 c)) (=> (= Mask@24 Mask@23) (and (=> (= (ControlFlow 0 28) 24) anon581_Then_correct) (=> (= (ControlFlow 0 28) 26) anon581_Else_correct))))))))))))
(let ((anon580_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 34) 28)) anon371_correct)))
(let ((anon580_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 32) (- 0 33)) (<= FullPerm (U_2_real (MapType1Select Mask@22 null (tree c))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@22 null (tree c)))) (=> (= (ControlFlow 0 32) 28) anon371_correct))))))
(let ((anon579_Then_correct  (=> (not (= c null)) (and (=> (= (ControlFlow 0 35) 32) anon580_Then_correct) (=> (= (ControlFlow 0 35) 34) anon580_Else_correct)))))
(let ((anon579_Else_correct  (=> (and (= c null) (= Mask@24 Mask@22)) (and (=> (= (ControlFlow 0 27) 24) anon581_Then_correct) (=> (= (ControlFlow 0 27) 26) anon581_Else_correct)))))
(let ((anon577_Else_correct  (=> (forall ((i_7_1 Int) ) (!  (=> (and (<= (segLength Heap@@61 a_2 b_2) i_7_1) (< i_7_1 (segLength Heap@35 a_2 c))) (= (segDegree Heap@35 a_2 c i_7_1) (segDegree Heap@@61 b_2 c (- i_7_1 (segLength Heap@@61 a_2 b_2)))))
 :qid |stdinbpl.4853:20|
 :skolemid |125|
 :pattern ( (|segDegree#frame| (MapType0Select Heap@35 null (heapseg a_2 c)) a_2 c i_7_1))
)) (and (=> (= (ControlFlow 0 36) 35) anon579_Then_correct) (=> (= (ControlFlow 0 36) 27) anon579_Else_correct)))))
(let ((anon367_correct true))
(let ((anon578_Else_correct  (=> (and (not (and (<= (segLength Heap@@61 a_2 b_2) i_6) (< i_6 (segLength Heap@35 a_2 c)))) (= (ControlFlow 0 8) 5)) anon367_correct)))
(let ((anon578_Then_correct  (=> (and (<= (segLength Heap@@61 a_2 b_2) i_6) (< i_6 (segLength Heap@35 a_2 c))) (and (=> (= (ControlFlow 0 6) (- 0 7)) (= (segDegree Heap@35 a_2 c i_6) (segDegree Heap@@61 b_2 c (- i_6 (segLength Heap@@61 a_2 b_2))))) (=> (= (segDegree Heap@35 a_2 c i_6) (segDegree Heap@@61 b_2 c (- i_6 (segLength Heap@@61 a_2 b_2)))) (=> (= (ControlFlow 0 6) 5) anon367_correct))))))
(let ((anon575_Else_correct  (=> (forall ((i_5_1 Int) ) (!  (=> (and (<= 0 i_5_1) (< i_5_1 (segLength Heap@@61 a_2 b_2))) (= (segDegree Heap@35 a_2 c i_5_1) (segDegree Heap@@61 a_2 b_2 i_5_1)))
 :qid |stdinbpl.4842:20|
 :skolemid |124|
 :pattern ( (|segDegree#frame| (MapType0Select Heap@35 null (heapseg a_2 c)) a_2 c i_5_1))
 :pattern ( (|segDegree#frame| (MapType0Select Heap@@61 null (heapseg a_2 b_2)) a_2 b_2 i_5_1))
)) (and (and (=> (= (ControlFlow 0 37) 36) anon577_Else_correct) (=> (= (ControlFlow 0 37) 6) anon578_Then_correct)) (=> (= (ControlFlow 0 37) 8) anon578_Else_correct)))))
(let ((anon363_correct true))
(let ((anon576_Else_correct  (=> (and (not (and (<= 0 i_4) (< i_4 (segLength Heap@@61 a_2 b_2)))) (= (ControlFlow 0 4) 1)) anon363_correct)))
(let ((anon576_Then_correct  (=> (and (<= 0 i_4) (< i_4 (segLength Heap@@61 a_2 b_2))) (and (=> (= (ControlFlow 0 2) (- 0 3)) (= (segDegree Heap@35 a_2 c i_4) (segDegree Heap@@61 a_2 b_2 i_4))) (=> (= (segDegree Heap@35 a_2 c i_4) (segDegree Heap@@61 a_2 b_2 i_4)) (=> (= (ControlFlow 0 2) 1) anon363_correct))))))
(let ((anon360_correct  (=> (= Mask@22 (MapType1Store Mask@21 null (heapseg a_2 c) (real_2_U (- (U_2_real (MapType1Select Mask@21 null (heapseg a_2 c))) FullPerm)))) (and (=> (= (ControlFlow 0 38) (- 0 39)) (= (segLength Heap@35 a_2 c) (+ (segLength Heap@@61 a_2 b_2) (segLength Heap@@61 b_2 c)))) (=> (= (segLength Heap@35 a_2 c) (+ (segLength Heap@@61 a_2 b_2) (segLength Heap@@61 b_2 c))) (and (and (=> (= (ControlFlow 0 38) 37) anon575_Else_correct) (=> (= (ControlFlow 0 38) 2) anon576_Then_correct)) (=> (= (ControlFlow 0 38) 4) anon576_Else_correct)))))))
(let ((anon574_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 42) 38)) anon360_correct)))
(let ((anon574_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 40) (- 0 41)) (<= FullPerm (U_2_real (MapType1Select Mask@21 null (heapseg a_2 c))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@21 null (heapseg a_2 c)))) (=> (= (ControlFlow 0 40) 38) anon360_correct))))))
(let ((anon358_correct  (=> (state Heap@35 Mask@21) (and (=> (= (ControlFlow 0 43) 40) anon574_Then_correct) (=> (= (ControlFlow 0 43) 42) anon574_Else_correct)))))
(let ((anon357_correct  (=> (state Heap@34 Mask@20) (=> (and (and (state Heap@34 Mask@20) (= Mask@21 Mask@20)) (and (= Heap@35 Heap@34) (= (ControlFlow 0 45) 43))) anon358_correct))))
(let ((anon573_Else_correct  (=> (= a_2 c) (=> (and (= Heap@34 Heap@30) (= (ControlFlow 0 47) 45)) anon357_correct))))
(let ((anon573_Then_correct  (=> (and (and (and (not (= a_2 c)) (forall ((o_32 T@U) (f_36 T@U) ) (! (let ((B@@11 (FieldTypeInv1 (type f_36))))
(let ((A@@12 (FieldTypeInv0 (type f_36))))
 (=> (and (and (= (type o_32) RefType) (= (type f_36) (FieldType A@@12 B@@11))) (or (U_2_bool (MapType1Select (MapType0Select Heap@30 null (|heapseg#sm| a_2 c)) o_32 f_36)) (U_2_bool (MapType1Select (MapType0Select Heap@30 null (|tree#sm| a_2)) o_32 f_36)))) (U_2_bool (MapType1Select newPMask@5 o_32 f_36)))))
 :qid |stdinbpl.4806:33|
 :skolemid |122|
 :pattern ( (MapType1Select newPMask@5 o_32 f_36))
))) (and (= Heap@31 (MapType0Store Heap@30 null (|heapseg#sm| a_2 c) newPMask@5)) (= Heap@32 (MapType0Store Heap@31 null (|heapseg#sm| a_2 c) (MapType1Store (MapType0Select Heap@31 null (|heapseg#sm| a_2 c)) a_2 sibling (bool_2_U true)))))) (and (and (forall ((o_33 T@U) (f_37 T@U) ) (! (let ((B@@12 (FieldTypeInv1 (type f_37))))
(let ((A@@13 (FieldTypeInv0 (type f_37))))
 (=> (and (and (= (type o_33) RefType) (= (type f_37) (FieldType A@@13 B@@12))) (or (U_2_bool (MapType1Select (MapType0Select Heap@32 null (|heapseg#sm| a_2 c)) o_33 f_37)) (U_2_bool (MapType1Select (MapType0Select Heap@32 null (|heapseg#sm| (MapType0Select Heap@32 a_2 sibling) c)) o_33 f_37)))) (U_2_bool (MapType1Select newPMask@6 o_33 f_37)))))
 :qid |stdinbpl.4813:33|
 :skolemid |123|
 :pattern ( (MapType1Select newPMask@6 o_33 f_37))
)) (= Heap@33 (MapType0Store Heap@32 null (|heapseg#sm| a_2 c) newPMask@6))) (and (= Heap@34 Heap@33) (= (ControlFlow 0 46) 45)))) anon357_correct)))
(let ((anon572_Else_correct  (=> (and (HasDirectPerm Mask@20 null (heapseg a_2 c)) (= Heap@30 Heap@27)) (and (=> (= (ControlFlow 0 49) 46) anon573_Then_correct) (=> (= (ControlFlow 0 49) 47) anon573_Else_correct)))))
(let ((anon572_Then_correct  (=> (and (and (not (HasDirectPerm Mask@20 null (heapseg a_2 c))) (= Heap@28 (MapType0Store Heap@27 null (|heapseg#sm| a_2 c) ZeroPMask))) (and (= Heap@29 (MapType0Store Heap@28 null (heapseg a_2 c) freshVersion@0)) (= Heap@30 Heap@29))) (and (=> (= (ControlFlow 0 48) 46) anon573_Then_correct) (=> (= (ControlFlow 0 48) 47) anon573_Else_correct)))))
(let ((anon353_correct  (=> (= Mask@20 (MapType1Store Mask@19 null (heapseg a_2 c) (real_2_U (+ (U_2_real (MapType1Select Mask@19 null (heapseg a_2 c))) FullPerm)))) (=> (and (and (state Heap@27 Mask@20) (state Heap@27 Mask@20)) (and (|heapseg#trigger| Heap@27 (heapseg a_2 c)) (= (MapType0Select Heap@27 null (heapseg a_2 c)) (FrameFragment (ite (not (= a_2 c)) (CombineFrames (MapType0Select Heap@27 null (tree a_2)) (CombineFrames (FrameFragment (MapType0Select Heap@27 a_2 sibling)) (CombineFrames (MapType0Select Heap@27 null (heapseg (MapType0Select Heap@27 a_2 sibling) c)) (FrameFragment (ite (not (= (MapType0Select Heap@27 a_2 sibling) c)) EmptyFrame EmptyFrame))))) EmptyFrame))))) (and (=> (= (ControlFlow 0 50) 48) anon572_Then_correct) (=> (= (ControlFlow 0 50) 49) anon572_Else_correct))))))
(let ((anon571_Else_correct  (=> (= (MapType0Select Heap@27 a_2 sibling) c) (=> (and (= Mask@19 Mask@18) (= (ControlFlow 0 54) 50)) anon353_correct))))
(let ((anon571_Then_correct  (=> (not (= (MapType0Select Heap@27 a_2 sibling) c)) (and (=> (= (ControlFlow 0 52) (- 0 53)) (= (treeParent Heap@27 a_2) (segParent Heap@27 (MapType0Select Heap@27 a_2 sibling) c))) (=> (= (treeParent Heap@27 a_2) (segParent Heap@27 (MapType0Select Heap@27 a_2 sibling) c)) (=> (and (= Mask@19 Mask@18) (= (ControlFlow 0 52) 50)) anon353_correct))))))
(let ((anon351_correct  (=> (and (= Mask@18 (MapType1Store Mask@17 null (heapseg (MapType0Select Heap@27 a_2 sibling) c) (real_2_U (- (U_2_real (MapType1Select Mask@17 null (heapseg (MapType0Select Heap@27 a_2 sibling) c))) FullPerm)))) (InsidePredicate (heapseg a_2 c) (MapType0Select Heap@27 null (heapseg a_2 c)) (heapseg (MapType0Select Heap@27 a_2 sibling) c) (MapType0Select Heap@27 null (heapseg (MapType0Select Heap@27 a_2 sibling) c)))) (and (=> (= (ControlFlow 0 55) 52) anon571_Then_correct) (=> (= (ControlFlow 0 55) 54) anon571_Else_correct)))))
(let ((anon570_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 58) 55)) anon351_correct)))
(let ((anon570_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 56) (- 0 57)) (<= FullPerm (U_2_real (MapType1Select Mask@17 null (heapseg (MapType0Select Heap@27 a_2 sibling) c))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@17 null (heapseg (MapType0Select Heap@27 a_2 sibling) c)))) (=> (= (ControlFlow 0 56) 55) anon351_correct))))))
(let ((anon349_correct  (=> (= Mask@17 (MapType1Store Mask@16 a_2 sibling (real_2_U (- (U_2_real (MapType1Select Mask@16 a_2 sibling)) FullPerm)))) (and (=> (= (ControlFlow 0 59) 56) anon570_Then_correct) (=> (= (ControlFlow 0 59) 58) anon570_Else_correct)))))
(let ((anon569_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 62) 59)) anon349_correct)))
(let ((anon569_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 60) (- 0 61)) (<= FullPerm (U_2_real (MapType1Select Mask@16 a_2 sibling)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@16 a_2 sibling))) (=> (= (ControlFlow 0 60) 59) anon349_correct))))))
(let ((anon347_correct  (=> (and (= Mask@16 (MapType1Store Mask@15 null (tree a_2) (real_2_U (- (U_2_real (MapType1Select Mask@15 null (tree a_2))) FullPerm)))) (InsidePredicate (heapseg a_2 c) (MapType0Select Heap@27 null (heapseg a_2 c)) (tree a_2) (MapType0Select Heap@27 null (tree a_2)))) (and (=> (= (ControlFlow 0 63) 60) anon569_Then_correct) (=> (= (ControlFlow 0 63) 62) anon569_Else_correct)))))
(let ((anon568_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 66) 63)) anon347_correct)))
(let ((anon568_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 64) (- 0 65)) (<= FullPerm (U_2_real (MapType1Select Mask@15 null (tree a_2))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@15 null (tree a_2)))) (=> (= (ControlFlow 0 64) 63) anon347_correct))))))
(let ((anon567_Then_correct  (=> (not (= a_2 c)) (and (=> (= (ControlFlow 0 67) 64) anon568_Then_correct) (=> (= (ControlFlow 0 67) 66) anon568_Else_correct)))))
(let ((anon567_Else_correct  (=> (= a_2 c) (=> (and (= Mask@19 Mask@15) (= (ControlFlow 0 51) 50)) anon353_correct))))
(let ((anon344_correct  (=> (= Heap@18 (MapType0Store Heap@17 null (|tree#sm| a_2) (MapType1Store (MapType0Select Heap@17 null (|tree#sm| a_2)) a_2 key (bool_2_U true)))) (=> (and (= Heap@19 (MapType0Store Heap@18 null (|tree#sm| a_2) (MapType1Store (MapType0Select Heap@18 null (|tree#sm| a_2)) a_2 degree (bool_2_U true)))) (= Heap@20 (MapType0Store Heap@19 null (|tree#sm| a_2) (MapType1Store (MapType0Select Heap@19 null (|tree#sm| a_2)) a_2 child (bool_2_U true))))) (=> (and (and (= Heap@21 (MapType0Store Heap@20 null (|tree#sm| a_2) (MapType1Store (MapType0Select Heap@20 null (|tree#sm| a_2)) a_2 parent (bool_2_U true)))) (forall ((o_30 T@U) (f_34 T@U) ) (! (let ((B@@13 (FieldTypeInv1 (type f_34))))
(let ((A@@14 (FieldTypeInv0 (type f_34))))
 (=> (and (and (= (type o_30) RefType) (= (type f_34) (FieldType A@@14 B@@13))) (or (U_2_bool (MapType1Select (MapType0Select Heap@21 null (|tree#sm| a_2)) o_30 f_34)) (U_2_bool (MapType1Select (MapType0Select Heap@21 null (|heapseg#sm| (MapType0Select Heap@21 a_2 child) null)) o_30 f_34)))) (U_2_bool (MapType1Select newPMask@3 o_30 f_34)))))
 :qid |stdinbpl.4741:33|
 :skolemid |120|
 :pattern ( (MapType1Select newPMask@3 o_30 f_34))
))) (and (= Heap@22 (MapType0Store Heap@21 null (|tree#sm| a_2) newPMask@3)) (state Heap@22 Mask@15))) (=> (and (and (and (= Heap@23 (MapType0Store Heap@22 null (|tree#sm| c) (MapType1Store (MapType0Select Heap@22 null (|tree#sm| c)) c key (bool_2_U true)))) (= Heap@24 (MapType0Store Heap@23 null (|tree#sm| c) (MapType1Store (MapType0Select Heap@23 null (|tree#sm| c)) c degree (bool_2_U true))))) (and (= Heap@25 (MapType0Store Heap@24 null (|tree#sm| c) (MapType1Store (MapType0Select Heap@24 null (|tree#sm| c)) c child (bool_2_U true)))) (= Heap@26 (MapType0Store Heap@25 null (|tree#sm| c) (MapType1Store (MapType0Select Heap@25 null (|tree#sm| c)) c parent (bool_2_U true)))))) (and (and (forall ((o_31 T@U) (f_35 T@U) ) (! (let ((B@@14 (FieldTypeInv1 (type f_35))))
(let ((A@@15 (FieldTypeInv0 (type f_35))))
 (=> (and (and (= (type o_31) RefType) (= (type f_35) (FieldType A@@15 B@@14))) (or (U_2_bool (MapType1Select (MapType0Select Heap@26 null (|tree#sm| c)) o_31 f_35)) (U_2_bool (MapType1Select (MapType0Select Heap@26 null (|heapseg#sm| (MapType0Select Heap@26 c child) null)) o_31 f_35)))) (U_2_bool (MapType1Select newPMask@4 o_31 f_35)))))
 :qid |stdinbpl.4752:33|
 :skolemid |121|
 :pattern ( (MapType1Select newPMask@4 o_31 f_35))
)) (= Heap@27 (MapType0Store Heap@26 null (|tree#sm| c) newPMask@4))) (and (state Heap@27 Mask@15) (state Heap@27 Mask@15)))) (and (=> (= (ControlFlow 0 68) 67) anon567_Then_correct) (=> (= (ControlFlow 0 68) 51) anon567_Else_correct))))))))
(let ((anon343_correct  (=> (and (state ExhaleHeap@0 Unfolding1Mask@5) (= Heap@2 (MapType0Store ExhaleHeap@0 null (|tree#sm| c) (MapType1Store (MapType0Select ExhaleHeap@0 null (|tree#sm| c)) c key (bool_2_U true))))) (=> (and (and (= Heap@3 (MapType0Store Heap@2 null (|tree#sm| c) (MapType1Store (MapType0Select Heap@2 null (|tree#sm| c)) c degree (bool_2_U true)))) (= Heap@4 (MapType0Store Heap@3 null (|tree#sm| c) (MapType1Store (MapType0Select Heap@3 null (|tree#sm| c)) c child (bool_2_U true))))) (and (= Heap@5 (MapType0Store Heap@4 null (|tree#sm| c) (MapType1Store (MapType0Select Heap@4 null (|tree#sm| c)) c parent (bool_2_U true)))) (forall ((o_27 T@U) (f_31 T@U) ) (! (let ((B@@15 (FieldTypeInv1 (type f_31))))
(let ((A@@16 (FieldTypeInv0 (type f_31))))
 (=> (and (and (= (type o_27) RefType) (= (type f_31) (FieldType A@@16 B@@15))) (or (U_2_bool (MapType1Select (MapType0Select Heap@5 null (|tree#sm| c)) o_27 f_31)) (U_2_bool (MapType1Select (MapType0Select Heap@5 null (|heapseg#sm| (MapType0Select Heap@5 c child) null)) o_27 f_31)))) (U_2_bool (MapType1Select newPMask@0 o_27 f_31)))))
 :qid |stdinbpl.4701:37|
 :skolemid |117|
 :pattern ( (MapType1Select newPMask@0 o_27 f_31))
)))) (=> (and (and (and (and (= Heap@6 (MapType0Store Heap@5 null (|tree#sm| c) newPMask@0)) (state Heap@6 Mask@15)) (and (= Heap@7 (MapType0Store Heap@6 null (|tree#sm| a_2) (MapType1Store (MapType0Select Heap@6 null (|tree#sm| a_2)) a_2 key (bool_2_U true)))) (= Heap@8 (MapType0Store Heap@7 null (|tree#sm| a_2) (MapType1Store (MapType0Select Heap@7 null (|tree#sm| a_2)) a_2 degree (bool_2_U true)))))) (and (and (= Heap@9 (MapType0Store Heap@8 null (|tree#sm| a_2) (MapType1Store (MapType0Select Heap@8 null (|tree#sm| a_2)) a_2 child (bool_2_U true)))) (= Heap@10 (MapType0Store Heap@9 null (|tree#sm| a_2) (MapType1Store (MapType0Select Heap@9 null (|tree#sm| a_2)) a_2 parent (bool_2_U true))))) (and (forall ((o_28 T@U) (f_32 T@U) ) (! (let ((B@@16 (FieldTypeInv1 (type f_32))))
(let ((A@@17 (FieldTypeInv0 (type f_32))))
 (=> (and (and (= (type o_28) RefType) (= (type f_32) (FieldType A@@17 B@@16))) (or (U_2_bool (MapType1Select (MapType0Select Heap@10 null (|tree#sm| a_2)) o_28 f_32)) (U_2_bool (MapType1Select (MapType0Select Heap@10 null (|heapseg#sm| (MapType0Select Heap@10 a_2 child) null)) o_28 f_32)))) (U_2_bool (MapType1Select newPMask@1 o_28 f_32)))))
 :qid |stdinbpl.4714:37|
 :skolemid |118|
 :pattern ( (MapType1Select newPMask@1 o_28 f_32))
)) (= Heap@11 (MapType0Store Heap@10 null (|tree#sm| a_2) newPMask@1))))) (and (and (and (state Heap@11 Mask@15) (= Heap@12 (MapType0Store Heap@11 null (|tree#sm| c) (MapType1Store (MapType0Select Heap@11 null (|tree#sm| c)) c key (bool_2_U true))))) (and (= Heap@13 (MapType0Store Heap@12 null (|tree#sm| c) (MapType1Store (MapType0Select Heap@12 null (|tree#sm| c)) c degree (bool_2_U true)))) (= Heap@14 (MapType0Store Heap@13 null (|tree#sm| c) (MapType1Store (MapType0Select Heap@13 null (|tree#sm| c)) c child (bool_2_U true)))))) (and (and (= Heap@15 (MapType0Store Heap@14 null (|tree#sm| c) (MapType1Store (MapType0Select Heap@14 null (|tree#sm| c)) c parent (bool_2_U true)))) (forall ((o_29 T@U) (f_33 T@U) ) (! (let ((B@@17 (FieldTypeInv1 (type f_33))))
(let ((A@@18 (FieldTypeInv0 (type f_33))))
 (=> (and (and (= (type o_29) RefType) (= (type f_33) (FieldType A@@18 B@@17))) (or (U_2_bool (MapType1Select (MapType0Select Heap@15 null (|tree#sm| c)) o_29 f_33)) (U_2_bool (MapType1Select (MapType0Select Heap@15 null (|heapseg#sm| (MapType0Select Heap@15 c child) null)) o_29 f_33)))) (U_2_bool (MapType1Select newPMask@2 o_29 f_33)))))
 :qid |stdinbpl.4725:37|
 :skolemid |119|
 :pattern ( (MapType1Select newPMask@2 o_29 f_33))
))) (and (= Heap@16 (MapType0Store Heap@15 null (|tree#sm| c) newPMask@2)) (state Heap@16 Mask@15))))) (and (=> (= (ControlFlow 0 70) (- 0 71)) (not (= a_2 c))) (=> (not (= a_2 c)) (=> (and (= Heap@17 Heap@16) (= (ControlFlow 0 70) 68)) anon344_correct))))))))
(let ((anon566_Else_correct  (=> (and (= (MapType0Select ExhaleHeap@0 c child) null) (= (ControlFlow 0 73) 70)) anon343_correct)))
(let ((anon566_Then_correct  (=> (and (and (not (= (MapType0Select ExhaleHeap@0 c child) null)) (state ExhaleHeap@0 Unfolding1Mask@5)) (and (= (segParent ExhaleHeap@0 (MapType0Select ExhaleHeap@0 c child) null) c) (= (ControlFlow 0 72) 70))) anon343_correct)))
(let ((anon341_correct  (=> (and (state ExhaleHeap@0 Unfolding1Mask@5) (validChildren ExhaleHeap@0 (MapType0Select ExhaleHeap@0 c child) null)) (and (=> (= (ControlFlow 0 74) 72) anon566_Then_correct) (=> (= (ControlFlow 0 74) 73) anon566_Else_correct)))))
(let ((anon565_Else_correct  (=> (and (<= (U_2_int (MapType0Select ExhaleHeap@0 c degree)) 0) (= (ControlFlow 0 76) 74)) anon341_correct)))
(let ((anon565_Then_correct  (=> (and (and (< 0 (U_2_int (MapType0Select ExhaleHeap@0 c degree))) (state ExhaleHeap@0 Unfolding1Mask@5)) (and (= (segDegree ExhaleHeap@0 (MapType0Select ExhaleHeap@0 c child) null 0) (- (U_2_int (MapType0Select ExhaleHeap@0 c degree)) 1)) (= (ControlFlow 0 75) 74))) anon341_correct)))
(let ((anon339_correct  (=> (and (= Unfolding1Mask@0 (MapType1Store UnfoldingMask@5 null (tree c) (real_2_U (- (U_2_real (MapType1Select UnfoldingMask@5 null (tree c))) perm@0)))) (= perm@1 (* FullPerm (/ (to_real 1) (to_real 2))))) (and (=> (= (ControlFlow 0 77) (- 0 82)) (>= perm@1 NoPerm)) (=> (>= perm@1 NoPerm) (=> (and (and (=> (> perm@1 NoPerm) (not (= c null))) (= Unfolding1Mask@1 (MapType1Store Unfolding1Mask@0 c key (real_2_U (+ (U_2_real (MapType1Select Unfolding1Mask@0 c key)) perm@1))))) (and (state ExhaleHeap@0 Unfolding1Mask@1) (= perm@2 (* FullPerm (/ (to_real 1) (to_real 2)))))) (and (=> (= (ControlFlow 0 77) (- 0 81)) (>= perm@2 NoPerm)) (=> (>= perm@2 NoPerm) (=> (and (and (=> (> perm@2 NoPerm) (not (= c null))) (= Unfolding1Mask@2 (MapType1Store Unfolding1Mask@1 c degree (real_2_U (+ (U_2_real (MapType1Select Unfolding1Mask@1 c degree)) perm@2))))) (and (state ExhaleHeap@0 Unfolding1Mask@2) (= perm@3 (* FullPerm (/ (to_real 1) (to_real 2)))))) (and (=> (= (ControlFlow 0 77) (- 0 80)) (>= perm@3 NoPerm)) (=> (>= perm@3 NoPerm) (=> (and (and (=> (> perm@3 NoPerm) (not (= c null))) (= Unfolding1Mask@3 (MapType1Store Unfolding1Mask@2 c child (real_2_U (+ (U_2_real (MapType1Select Unfolding1Mask@2 c child)) perm@3))))) (and (state ExhaleHeap@0 Unfolding1Mask@3) (= perm@4 (* FullPerm (/ (to_real 1) (to_real 2)))))) (and (=> (= (ControlFlow 0 77) (- 0 79)) (>= perm@4 NoPerm)) (=> (>= perm@4 NoPerm) (=> (=> (> perm@4 NoPerm) (not (= c null))) (=> (and (and (= Unfolding1Mask@4 (MapType1Store Unfolding1Mask@3 c parent (real_2_U (+ (U_2_real (MapType1Select Unfolding1Mask@3 c parent)) perm@4)))) (state ExhaleHeap@0 Unfolding1Mask@4)) (and (<= 0 (U_2_int (MapType0Select ExhaleHeap@0 c degree))) (= perm@5 (* FullPerm (/ (to_real 1) (to_real 2)))))) (and (=> (= (ControlFlow 0 77) (- 0 78)) (>= perm@5 NoPerm)) (=> (>= perm@5 NoPerm) (=> (= Unfolding1Mask@5 (MapType1Store Unfolding1Mask@4 null (heapseg (MapType0Select ExhaleHeap@0 c child) null) (real_2_U (+ (U_2_real (MapType1Select Unfolding1Mask@4 null (heapseg (MapType0Select ExhaleHeap@0 c child) null))) perm@5)))) (=> (and (and (InsidePredicate (tree c) (MapType0Select ExhaleHeap@0 null (tree c)) (heapseg (MapType0Select ExhaleHeap@0 c child) null) (MapType0Select ExhaleHeap@0 null (heapseg (MapType0Select ExhaleHeap@0 c child) null))) (state ExhaleHeap@0 Unfolding1Mask@5)) (and (state ExhaleHeap@0 Unfolding1Mask@5) (= (U_2_int (MapType0Select ExhaleHeap@0 c degree)) (segLength ExhaleHeap@0 (MapType0Select ExhaleHeap@0 c child) null)))) (and (=> (= (ControlFlow 0 77) 75) anon565_Then_correct) (=> (= (ControlFlow 0 77) 76) anon565_Else_correct))))))))))))))))))))))
(let ((anon564_Else_correct  (=> (and (= perm@0 NoPerm) (= (ControlFlow 0 85) 77)) anon339_correct)))
(let ((anon564_Then_correct  (=> (not (= perm@0 NoPerm)) (and (=> (= (ControlFlow 0 83) (- 0 84)) (<= perm@0 (U_2_real (MapType1Select UnfoldingMask@5 null (tree c))))) (=> (<= perm@0 (U_2_real (MapType1Select UnfoldingMask@5 null (tree c)))) (=> (= (ControlFlow 0 83) 77) anon339_correct))))))
(let ((anon337_correct  (=> (and (and (state ExhaleHeap@0 UnfoldingMask@5) (|tree#trigger| ExhaleHeap@0 (tree c))) (and (= (MapType0Select ExhaleHeap@0 null (tree c)) (CombineFrames (FrameFragment (MapType0Select ExhaleHeap@0 c key)) (CombineFrames (FrameFragment (MapType0Select ExhaleHeap@0 c degree)) (CombineFrames (FrameFragment (MapType0Select ExhaleHeap@0 c child)) (CombineFrames (FrameFragment (MapType0Select ExhaleHeap@0 c parent)) (CombineFrames (MapType0Select ExhaleHeap@0 null (heapseg (MapType0Select ExhaleHeap@0 c child) null)) (CombineFrames (FrameFragment (ite (< 0 (U_2_int (MapType0Select ExhaleHeap@0 c degree))) EmptyFrame EmptyFrame)) (FrameFragment (ite (not (= (MapType0Select ExhaleHeap@0 c child) null)) EmptyFrame EmptyFrame))))))))) (= perm@0 (/ (to_real 1) (to_real 2))))) (and (=> (= (ControlFlow 0 86) (- 0 87)) (>= perm@0 NoPerm)) (=> (>= perm@0 NoPerm) (and (=> (= (ControlFlow 0 86) 83) anon564_Then_correct) (=> (= (ControlFlow 0 86) 85) anon564_Else_correct)))))))
(let ((anon563_Else_correct  (=> (and (= (MapType0Select ExhaleHeap@0 a_2 child) null) (= (ControlFlow 0 89) 86)) anon337_correct)))
(let ((anon563_Then_correct  (=> (and (and (not (= (MapType0Select ExhaleHeap@0 a_2 child) null)) (state ExhaleHeap@0 UnfoldingMask@5)) (and (= (segParent ExhaleHeap@0 (MapType0Select ExhaleHeap@0 a_2 child) null) a_2) (= (ControlFlow 0 88) 86))) anon337_correct)))
(let ((anon335_correct  (=> (and (state ExhaleHeap@0 UnfoldingMask@5) (validChildren ExhaleHeap@0 (MapType0Select ExhaleHeap@0 a_2 child) null)) (and (=> (= (ControlFlow 0 90) 88) anon563_Then_correct) (=> (= (ControlFlow 0 90) 89) anon563_Else_correct)))))
(let ((anon562_Else_correct  (=> (and (<= (U_2_int (MapType0Select ExhaleHeap@0 a_2 degree)) 0) (= (ControlFlow 0 92) 90)) anon335_correct)))
(let ((anon562_Then_correct  (=> (and (and (< 0 (U_2_int (MapType0Select ExhaleHeap@0 a_2 degree))) (state ExhaleHeap@0 UnfoldingMask@5)) (and (= (segDegree ExhaleHeap@0 (MapType0Select ExhaleHeap@0 a_2 child) null 0) (- (U_2_int (MapType0Select ExhaleHeap@0 a_2 degree)) 1)) (= (ControlFlow 0 91) 90))) anon335_correct)))
(let ((anon333_correct  (=> (= UnfoldingMask@0 (MapType1Store Mask@15 null (tree a_2) (real_2_U (- (U_2_real (MapType1Select Mask@15 null (tree a_2))) FullPerm)))) (=> (and (not (= a_2 null)) (= UnfoldingMask@1 (MapType1Store UnfoldingMask@0 a_2 key (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@0 a_2 key)) FullPerm))))) (=> (and (and (and (and (state ExhaleHeap@0 UnfoldingMask@1) (not (= a_2 null))) (and (= UnfoldingMask@2 (MapType1Store UnfoldingMask@1 a_2 degree (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@1 a_2 degree)) FullPerm)))) (state ExhaleHeap@0 UnfoldingMask@2))) (and (and (not (= a_2 null)) (= UnfoldingMask@3 (MapType1Store UnfoldingMask@2 a_2 child (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@2 a_2 child)) FullPerm))))) (and (state ExhaleHeap@0 UnfoldingMask@3) (not (= a_2 null))))) (and (and (and (= UnfoldingMask@4 (MapType1Store UnfoldingMask@3 a_2 parent (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@3 a_2 parent)) FullPerm)))) (state ExhaleHeap@0 UnfoldingMask@4)) (and (<= 0 (U_2_int (MapType0Select ExhaleHeap@0 a_2 degree))) (= UnfoldingMask@5 (MapType1Store UnfoldingMask@4 null (heapseg (MapType0Select ExhaleHeap@0 a_2 child) null) (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@4 null (heapseg (MapType0Select ExhaleHeap@0 a_2 child) null))) FullPerm)))))) (and (and (InsidePredicate (tree a_2) (MapType0Select ExhaleHeap@0 null (tree a_2)) (heapseg (MapType0Select ExhaleHeap@0 a_2 child) null) (MapType0Select ExhaleHeap@0 null (heapseg (MapType0Select ExhaleHeap@0 a_2 child) null))) (state ExhaleHeap@0 UnfoldingMask@5)) (and (state ExhaleHeap@0 UnfoldingMask@5) (= (U_2_int (MapType0Select ExhaleHeap@0 a_2 degree)) (segLength ExhaleHeap@0 (MapType0Select ExhaleHeap@0 a_2 child) null)))))) (and (=> (= (ControlFlow 0 93) 91) anon562_Then_correct) (=> (= (ControlFlow 0 93) 92) anon562_Else_correct)))))))
(let ((anon561_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 96) 93)) anon333_correct)))
(let ((anon561_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 94) (- 0 95)) (<= FullPerm (U_2_real (MapType1Select Mask@15 null (tree a_2))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@15 null (tree a_2)))) (=> (= (ControlFlow 0 94) 93) anon333_correct))))))
(let ((anon560_Then_correct  (=> (not (= c null)) (=> (and (|tree#trigger| ExhaleHeap@0 (tree a_2)) (= (MapType0Select ExhaleHeap@0 null (tree a_2)) (CombineFrames (FrameFragment (MapType0Select ExhaleHeap@0 a_2 key)) (CombineFrames (FrameFragment (MapType0Select ExhaleHeap@0 a_2 degree)) (CombineFrames (FrameFragment (MapType0Select ExhaleHeap@0 a_2 child)) (CombineFrames (FrameFragment (MapType0Select ExhaleHeap@0 a_2 parent)) (CombineFrames (MapType0Select ExhaleHeap@0 null (heapseg (MapType0Select ExhaleHeap@0 a_2 child) null)) (CombineFrames (FrameFragment (ite (< 0 (U_2_int (MapType0Select ExhaleHeap@0 a_2 degree))) EmptyFrame EmptyFrame)) (FrameFragment (ite (not (= (MapType0Select ExhaleHeap@0 a_2 child) null)) EmptyFrame EmptyFrame)))))))))) (and (=> (= (ControlFlow 0 97) 94) anon561_Then_correct) (=> (= (ControlFlow 0 97) 96) anon561_Else_correct))))))
(let ((anon560_Else_correct  (=> (= c null) (=> (and (= Heap@17 ExhaleHeap@0) (= (ControlFlow 0 69) 68)) anon344_correct))))
(let ((anon330_correct  (=> (and (state ExhaleHeap@0 Mask@15) (state ExhaleHeap@0 Mask@15)) (and (=> (= (ControlFlow 0 98) 97) anon560_Then_correct) (=> (= (ControlFlow 0 98) 69) anon560_Else_correct)))))
(let ((anon559_Else_correct  (=> (and (= b_2 c) (= (ControlFlow 0 100) 98)) anon330_correct)))
(let ((anon559_Then_correct  (=> (and (and (not (= b_2 c)) (state ExhaleHeap@0 Mask@15)) (and (= (segParent ExhaleHeap@0 arg_a@0 c) (segParent Heap@1 b_2 c)) (= (ControlFlow 0 99) 98))) anon330_correct)))
(let ((anon558_Else_correct  (=> (= arg_a@0 b_2) (and (=> (= (ControlFlow 0 102) 99) anon559_Then_correct) (=> (= (ControlFlow 0 102) 100) anon559_Else_correct)))))
(let ((anon558_Then_correct  (=> (not (= arg_a@0 b_2)) (=> (and (state ExhaleHeap@0 Mask@15) (= (segParent ExhaleHeap@0 arg_a@0 c) (segParent Heap@1 arg_a@0 b_2))) (and (=> (= (ControlFlow 0 101) 99) anon559_Then_correct) (=> (= (ControlFlow 0 101) 100) anon559_Else_correct))))))
(let ((anon326_correct  (=> (and (state ExhaleHeap@0 Mask@15) (= (segSize ExhaleHeap@0 arg_a@0 c) (+ (segSize Heap@1 arg_a@0 b_2) (segSize Heap@1 b_2 c)))) (and (=> (= (ControlFlow 0 103) 101) anon558_Then_correct) (=> (= (ControlFlow 0 103) 102) anon558_Else_correct)))))
(let ((anon557_Else_correct  (=> (and (not (and (validChildren Heap@1 arg_a@0 b_2) (and (validChildren Heap@1 b_2 c) (=> (and (< 0 (segLength Heap@1 arg_a@0 b_2)) (< 0 (segLength Heap@1 b_2 c))) (= (segDegree Heap@1 arg_a@0 b_2 (- (segLength Heap@1 arg_a@0 b_2) 1)) (+ (segDegree Heap@1 b_2 c 0) 1)))))) (= (ControlFlow 0 105) 103)) anon326_correct)))
(let ((anon557_Then_correct  (=> (and (and (and (validChildren Heap@1 arg_a@0 b_2) (and (validChildren Heap@1 b_2 c) (=> (and (< 0 (segLength Heap@1 arg_a@0 b_2)) (< 0 (segLength Heap@1 b_2 c))) (= (segDegree Heap@1 arg_a@0 b_2 (- (segLength Heap@1 arg_a@0 b_2) 1)) (+ (segDegree Heap@1 b_2 c 0) 1))))) (state ExhaleHeap@0 Mask@15)) (and (validChildren ExhaleHeap@0 arg_a@0 c) (= (ControlFlow 0 104) 103))) anon326_correct)))
(let ((anon556_Else_correct  (=> (not (and (presorted Heap@1 arg_a@0 b_2) (and (presorted Heap@1 b_2 c) (=> (and (< 0 (segLength Heap@1 arg_a@0 b_2)) (< 0 (segLength Heap@1 b_2 c))) (and (<= (segDegree Heap@1 arg_a@0 b_2 (- (segLength Heap@1 arg_a@0 b_2) 1)) (segDegree Heap@1 b_2 c 0)) (and (=> (and (<= 2 (segLength Heap@1 arg_a@0 b_2)) (= (segDegree Heap@1 arg_a@0 b_2 (- (segLength Heap@1 arg_a@0 b_2) 1)) (segDegree Heap@1 arg_a@0 b_2 (- (segLength Heap@1 arg_a@0 b_2) 2)))) (< (segDegree Heap@1 arg_a@0 b_2 (- (segLength Heap@1 arg_a@0 b_2) 1)) (segDegree Heap@1 b_2 c 0))) (=> (and (<= 2 (segLength Heap@1 b_2 c)) (= (segDegree Heap@1 b_2 c 0) (segDegree Heap@1 b_2 c 1))) (< (segDegree Heap@1 arg_a@0 b_2 (- (segLength Heap@1 arg_a@0 b_2) 1)) (segDegree Heap@1 b_2 c 0))))))))) (and (=> (= (ControlFlow 0 107) 104) anon557_Then_correct) (=> (= (ControlFlow 0 107) 105) anon557_Else_correct)))))
(let ((anon556_Then_correct  (=> (and (and (presorted Heap@1 arg_a@0 b_2) (and (presorted Heap@1 b_2 c) (=> (and (< 0 (segLength Heap@1 arg_a@0 b_2)) (< 0 (segLength Heap@1 b_2 c))) (and (<= (segDegree Heap@1 arg_a@0 b_2 (- (segLength Heap@1 arg_a@0 b_2) 1)) (segDegree Heap@1 b_2 c 0)) (and (=> (and (<= 2 (segLength Heap@1 arg_a@0 b_2)) (= (segDegree Heap@1 arg_a@0 b_2 (- (segLength Heap@1 arg_a@0 b_2) 1)) (segDegree Heap@1 arg_a@0 b_2 (- (segLength Heap@1 arg_a@0 b_2) 2)))) (< (segDegree Heap@1 arg_a@0 b_2 (- (segLength Heap@1 arg_a@0 b_2) 1)) (segDegree Heap@1 b_2 c 0))) (=> (and (<= 2 (segLength Heap@1 b_2 c)) (= (segDegree Heap@1 b_2 c 0) (segDegree Heap@1 b_2 c 1))) (< (segDegree Heap@1 arg_a@0 b_2 (- (segLength Heap@1 arg_a@0 b_2) 1)) (segDegree Heap@1 b_2 c 0)))))))) (and (state ExhaleHeap@0 Mask@15) (presorted ExhaleHeap@0 arg_a@0 c))) (and (=> (= (ControlFlow 0 106) 104) anon557_Then_correct) (=> (= (ControlFlow 0 106) 105) anon557_Else_correct)))))
(let ((anon555_Else_correct  (=> (not (and (sorted Heap@1 arg_a@0 b_2) (and (sorted Heap@1 b_2 c) (=> (and (< 0 (segLength Heap@1 arg_a@0 b_2)) (< 0 (segLength Heap@1 b_2 c))) (< (segDegree Heap@1 arg_a@0 b_2 (- (segLength Heap@1 arg_a@0 b_2) 1)) (segDegree Heap@1 b_2 c 0)))))) (and (=> (= (ControlFlow 0 109) 106) anon556_Then_correct) (=> (= (ControlFlow 0 109) 107) anon556_Else_correct)))))
(let ((anon555_Then_correct  (=> (and (and (sorted Heap@1 arg_a@0 b_2) (and (sorted Heap@1 b_2 c) (=> (and (< 0 (segLength Heap@1 arg_a@0 b_2)) (< 0 (segLength Heap@1 b_2 c))) (< (segDegree Heap@1 arg_a@0 b_2 (- (segLength Heap@1 arg_a@0 b_2) 1)) (segDegree Heap@1 b_2 c 0))))) (and (state ExhaleHeap@0 Mask@15) (sorted ExhaleHeap@0 arg_a@0 c))) (and (=> (= (ControlFlow 0 108) 106) anon556_Then_correct) (=> (= (ControlFlow 0 108) 107) anon556_Else_correct)))))
(let ((anon554_Else_correct  (=> (and (= c null) (= Mask@15 Mask@13)) (and (=> (= (ControlFlow 0 111) 108) anon555_Then_correct) (=> (= (ControlFlow 0 111) 109) anon555_Else_correct)))))
(let ((anon554_Then_correct  (=> (and (not (= c null)) (= Mask@14 (MapType1Store Mask@13 null (tree c) (real_2_U (+ (U_2_real (MapType1Select Mask@13 null (tree c))) FullPerm))))) (=> (and (and (and (state ExhaleHeap@0 Mask@14) (state ExhaleHeap@0 Mask@14)) (and (= (treeDegree ExhaleHeap@0 c) (treeDegree Heap@1 c)) (state ExhaleHeap@0 Mask@14))) (and (and (= (treeSize ExhaleHeap@0 c) (treeSize Heap@1 c)) (state ExhaleHeap@0 Mask@14)) (and (= (treeParent ExhaleHeap@0 c) (treeParent Heap@1 c)) (= Mask@15 Mask@14)))) (and (=> (= (ControlFlow 0 110) 108) anon555_Then_correct) (=> (= (ControlFlow 0 110) 109) anon555_Else_correct))))))
(let ((anon318_correct  (=> (IdenticalOnKnownLocations Heap@1 ExhaleHeap@0 Mask@12) (=> (and (and (and (= Mask@13 (MapType1Store Mask@12 null (heapseg arg_a@0 c) (real_2_U (+ (U_2_real (MapType1Select Mask@12 null (heapseg arg_a@0 c))) FullPerm)))) (state ExhaleHeap@0 Mask@13)) (and (state ExhaleHeap@0 Mask@13) (= (segLength ExhaleHeap@0 arg_a@0 c) (+ (segLength Heap@1 arg_a@0 b_2) (segLength Heap@1 b_2 c))))) (and (and (state ExhaleHeap@0 Mask@13) (forall ((i_8 Int) ) (!  (=> (and (<= 0 i_8) (< i_8 (segLength Heap@1 arg_a@0 b_2))) (= (segDegree ExhaleHeap@0 arg_a@0 c i_8) (segDegree Heap@1 arg_a@0 b_2 i_8)))
 :qid |stdinbpl.4533:26|
 :skolemid |115|
 :pattern ( (|segDegree#frame| (MapType0Select ExhaleHeap@0 null (heapseg arg_a@0 c)) arg_a@0 c i_8))
 :pattern ( (|segDegree#frame| (MapType0Select Heap@1 null (heapseg arg_a@0 b_2)) arg_a@0 b_2 i_8))
))) (and (state ExhaleHeap@0 Mask@13) (forall ((i_9 Int) ) (!  (=> (and (<= (segLength Heap@1 arg_a@0 b_2) i_9) (< i_9 (segLength ExhaleHeap@0 arg_a@0 c))) (= (segDegree ExhaleHeap@0 arg_a@0 c i_9) (segDegree Heap@1 b_2 c (- i_9 (segLength Heap@1 arg_a@0 b_2)))))
 :qid |stdinbpl.4538:26|
 :skolemid |116|
 :pattern ( (|segDegree#frame| (MapType0Select ExhaleHeap@0 null (heapseg arg_a@0 c)) arg_a@0 c i_9))
))))) (and (=> (= (ControlFlow 0 112) 110) anon554_Then_correct) (=> (= (ControlFlow 0 112) 111) anon554_Else_correct))))))
(let ((anon553_Else_correct  (=> (and (not (and (not (= arg_a@0 b_2)) (not (= b_2 c)))) (= (ControlFlow 0 115) 112)) anon318_correct)))
(let ((anon553_Then_correct  (=> (and (not (= arg_a@0 b_2)) (not (= b_2 c))) (and (=> (= (ControlFlow 0 113) (- 0 114)) (= (segParent Heap@1 arg_a@0 b_2) (segParent Heap@1 b_2 c))) (=> (= (segParent Heap@1 arg_a@0 b_2) (segParent Heap@1 b_2 c)) (=> (= (ControlFlow 0 113) 112) anon318_correct))))))
(let ((anon315_correct  (=> (and (= Mask@11 (MapType1Store Mask@10 null (tree c) (real_2_U (- (U_2_real (MapType1Select Mask@10 null (tree c))) FullPerm)))) (= Mask@12 Mask@11)) (and (=> (= (ControlFlow 0 117) 113) anon553_Then_correct) (=> (= (ControlFlow 0 117) 115) anon553_Else_correct)))))
(let ((anon552_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 120) 117)) anon315_correct)))
(let ((anon552_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 118) (- 0 119)) (<= FullPerm (U_2_real (MapType1Select Mask@10 null (tree c))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@10 null (tree c)))) (=> (= (ControlFlow 0 118) 117) anon315_correct))))))
(let ((anon551_Then_correct  (=> (not (= c null)) (and (=> (= (ControlFlow 0 121) 118) anon552_Then_correct) (=> (= (ControlFlow 0 121) 120) anon552_Else_correct)))))
(let ((anon551_Else_correct  (=> (and (= c null) (= Mask@12 Mask@10)) (and (=> (= (ControlFlow 0 116) 113) anon553_Then_correct) (=> (= (ControlFlow 0 116) 115) anon553_Else_correct)))))
(let ((anon312_correct  (=> (= Mask@10 (MapType1Store Mask@9 null (heapseg b_2 c) (real_2_U (- (U_2_real (MapType1Select Mask@9 null (heapseg b_2 c))) FullPerm)))) (and (=> (= (ControlFlow 0 122) 121) anon551_Then_correct) (=> (= (ControlFlow 0 122) 116) anon551_Else_correct)))))
(let ((anon550_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 125) 122)) anon312_correct)))
(let ((anon550_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 123) (- 0 124)) (<= FullPerm (U_2_real (MapType1Select Mask@9 null (heapseg b_2 c))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@9 null (heapseg b_2 c)))) (=> (= (ControlFlow 0 123) 122) anon312_correct))))))
(let ((anon310_correct  (=> (= Mask@9 (MapType1Store Mask@8 null (heapseg arg_a@0 b_2) (real_2_U (- (U_2_real (MapType1Select Mask@8 null (heapseg arg_a@0 b_2))) FullPerm)))) (and (=> (= (ControlFlow 0 126) 123) anon550_Then_correct) (=> (= (ControlFlow 0 126) 125) anon550_Else_correct)))))
(let ((anon549_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 129) 126)) anon310_correct)))
(let ((anon549_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 127) (- 0 128)) (<= FullPerm (U_2_real (MapType1Select Mask@8 null (heapseg arg_a@0 b_2))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@8 null (heapseg arg_a@0 b_2)))) (=> (= (ControlFlow 0 127) 126) anon310_correct))))))
(let ((anon308_correct  (=> (and (state Heap@1 Mask@8) (state Heap@1 Mask@8)) (and (=> (= (ControlFlow 0 130) (- 0 131)) (HasDirectPerm Mask@8 a_2 sibling)) (=> (HasDirectPerm Mask@8 a_2 sibling) (=> (= arg_a@0 (MapType0Select Heap@1 a_2 sibling)) (and (=> (= (ControlFlow 0 130) 127) anon549_Then_correct) (=> (= (ControlFlow 0 130) 129) anon549_Else_correct))))))))
(let ((anon548_Else_correct  (=> (= (MapType0Select Heap@1 a_2 sibling) b_2) (=> (and (= Mask@8 Mask@7) (= (ControlFlow 0 134) 130)) anon308_correct))))
(let ((anon548_Then_correct  (=> (not (= (MapType0Select Heap@1 a_2 sibling) b_2)) (=> (and (and (state Heap@1 Mask@7) (= (treeParent Heap@1 a_2) (segParent Heap@1 (MapType0Select Heap@1 a_2 sibling) b_2))) (and (= Mask@8 Mask@7) (= (ControlFlow 0 133) 130))) anon308_correct))))
(let ((anon547_Then_correct  (=> (and (not (= a_2 b_2)) (= Mask@5 (MapType1Store Mask@4 null (tree a_2) (real_2_U (+ (U_2_real (MapType1Select Mask@4 null (tree a_2))) FullPerm))))) (=> (and (and (and (InsidePredicate (heapseg a_2 b_2) (MapType0Select Heap@1 null (heapseg a_2 b_2)) (tree a_2) (MapType0Select Heap@1 null (tree a_2))) (state Heap@1 Mask@5)) (and (not (= a_2 null)) (= Mask@6 (MapType1Store Mask@5 a_2 sibling (real_2_U (+ (U_2_real (MapType1Select Mask@5 a_2 sibling)) FullPerm)))))) (and (and (state Heap@1 Mask@6) (= Mask@7 (MapType1Store Mask@6 null (heapseg (MapType0Select Heap@1 a_2 sibling) b_2) (real_2_U (+ (U_2_real (MapType1Select Mask@6 null (heapseg (MapType0Select Heap@1 a_2 sibling) b_2))) FullPerm))))) (and (InsidePredicate (heapseg a_2 b_2) (MapType0Select Heap@1 null (heapseg a_2 b_2)) (heapseg (MapType0Select Heap@1 a_2 sibling) b_2) (MapType0Select Heap@1 null (heapseg (MapType0Select Heap@1 a_2 sibling) b_2))) (state Heap@1 Mask@7)))) (and (=> (= (ControlFlow 0 135) 133) anon548_Then_correct) (=> (= (ControlFlow 0 135) 134) anon548_Else_correct))))))
(let ((anon547_Else_correct  (=> (= a_2 b_2) (=> (and (= Mask@8 Mask@4) (= (ControlFlow 0 132) 130)) anon308_correct))))
(let ((anon546_Else_correct  (=> (and (HasDirectPerm Mask@4 null (heapseg a_2 b_2)) (= Heap@1 Heap@@61)) (and (=> (= (ControlFlow 0 137) 135) anon547_Then_correct) (=> (= (ControlFlow 0 137) 132) anon547_Else_correct)))))
(let ((anon546_Then_correct  (=> (not (HasDirectPerm Mask@4 null (heapseg a_2 b_2))) (=> (and (= Heap@0 (MapType0Store Heap@@61 null (heapseg a_2 b_2) newVersion@0)) (= Heap@1 Heap@0)) (and (=> (= (ControlFlow 0 136) 135) anon547_Then_correct) (=> (= (ControlFlow 0 136) 132) anon547_Else_correct))))))
(let ((anon303_correct  (=> (= Mask@4 (MapType1Store Mask@3 null (heapseg a_2 b_2) (real_2_U (- (U_2_real (MapType1Select Mask@3 null (heapseg a_2 b_2))) FullPerm)))) (and (=> (= (ControlFlow 0 138) 136) anon546_Then_correct) (=> (= (ControlFlow 0 138) 137) anon546_Else_correct)))))
(let ((anon545_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 141) 138)) anon303_correct)))
(let ((anon545_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 139) (- 0 140)) (<= FullPerm (U_2_real (MapType1Select Mask@3 null (heapseg a_2 b_2))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@3 null (heapseg a_2 b_2)))) (=> (= (ControlFlow 0 139) 138) anon303_correct))))))
(let ((anon544_Then_correct  (=> (not (= a_2 b_2)) (=> (and (|heapseg#trigger| Heap@@61 (heapseg a_2 b_2)) (= (MapType0Select Heap@@61 null (heapseg a_2 b_2)) (FrameFragment (ite (not (= a_2 b_2)) (CombineFrames (MapType0Select Heap@@61 null (tree a_2)) (CombineFrames (FrameFragment (MapType0Select Heap@@61 a_2 sibling)) (CombineFrames (MapType0Select Heap@@61 null (heapseg (MapType0Select Heap@@61 a_2 sibling) b_2)) (FrameFragment (ite (not (= (MapType0Select Heap@@61 a_2 sibling) b_2)) EmptyFrame EmptyFrame))))) EmptyFrame)))) (and (=> (= (ControlFlow 0 142) 139) anon545_Then_correct) (=> (= (ControlFlow 0 142) 141) anon545_Else_correct))))))
(let ((anon544_Else_correct  (=> (and (and (= a_2 b_2) (= Mask@21 Mask@3)) (and (= Heap@35 Heap@@61) (= (ControlFlow 0 44) 43))) anon358_correct)))
(let ((anon12_correct  (=> (state Heap@@61 Mask@3) (and (and (=> (= (ControlFlow 0 501) 500) anon389_Then_correct) (=> (= (ControlFlow 0 501) 142) anon544_Then_correct)) (=> (= (ControlFlow 0 501) 44) anon544_Else_correct)))))
(let ((anon387_Else_correct  (=> (and (= (segParent Heap@@61 a_2 b_2) (segParent Heap@@61 b_2 c)) (= (ControlFlow 0 503) 501)) anon12_correct)))
(let ((anon384_Then_correct  (=> (and (and (not (= a_2 b_2)) (not (= b_2 c))) (state Heap@@61 Mask@3)) (and (and (and (and (=> (= (ControlFlow 0 514) 503) anon387_Else_correct) (=> (= (ControlFlow 0 514) 511) anon388_Then_correct)) (=> (= (ControlFlow 0 514) 513) anon388_Else_correct)) (=> (= (ControlFlow 0 514) 506) anon386_Then_correct)) (=> (= (ControlFlow 0 514) 508) anon386_Else_correct)))))
(let ((anon384_Else_correct  (=> (and (not (and (not (= a_2 b_2)) (not (= b_2 c)))) (= (ControlFlow 0 502) 501)) anon12_correct)))
(let ((anon2_correct  (=> (state Heap@@61 Mask@3) (and (=> (= (ControlFlow 0 515) 514) anon384_Then_correct) (=> (= (ControlFlow 0 515) 502) anon384_Else_correct)))))
(let ((anon383_Else_correct  (=> (= c null) (=> (and (= Mask@3 Mask@1) (= (ControlFlow 0 517) 515)) anon2_correct))))
(let ((anon383_Then_correct  (=> (not (= c null)) (=> (and (and (= Mask@2 (MapType1Store Mask@1 null (tree c) (real_2_U (+ (U_2_real (MapType1Select Mask@1 null (tree c))) FullPerm)))) (state Heap@@61 Mask@2)) (and (= Mask@3 Mask@2) (= (ControlFlow 0 516) 515))) anon2_correct))))
(let ((anon0_correct  (=> (and (state Heap@@61 ZeroMask) (= AssumeFunctionsAbove (- 0 1))) (=> (and (and (and (U_2_bool (MapType0Select Heap@@61 a_2 $allocated)) (U_2_bool (MapType0Select Heap@@61 b_2 $allocated))) (and (U_2_bool (MapType0Select Heap@@61 c $allocated)) (= Mask@0 (MapType1Store ZeroMask null (heapseg a_2 b_2) (real_2_U (+ (U_2_real (MapType1Select ZeroMask null (heapseg a_2 b_2))) FullPerm)))))) (and (and (state Heap@@61 Mask@0) (= Mask@1 (MapType1Store Mask@0 null (heapseg b_2 c) (real_2_U (+ (U_2_real (MapType1Select Mask@0 null (heapseg b_2 c))) FullPerm))))) (and (state Heap@@61 Mask@1) (state Heap@@61 Mask@1)))) (and (=> (= (ControlFlow 0 518) 516) anon383_Then_correct) (=> (= (ControlFlow 0 518) 517) anon383_Else_correct))))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 519) 518) anon0_correct)))
PreconditionGeneratedEntry_correct))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
))
(check-sat)
(pop 1)
; Valid
(get-info :rlimit)
