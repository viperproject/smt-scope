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
(declare-fun car () T@U)
(declare-fun cdr () T@U)
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
(declare-fun |MultiSet#Card| (T@U) Int)
(declare-fun |MultiSet#Difference| (T@U T@U) T@U)
(declare-fun MultiSetTypeInv0 (T@T) T@T)
(declare-fun MultiSetType (T@T) T@T)
(declare-fun |MultiSet#Intersection| (T@U T@U) T@U)
(declare-fun |MultiSet#Union| (T@U T@U) T@U)
(declare-fun state (T@U T@U) Bool)
(declare-fun MapType1Type (T@T T@T) T@T)
(declare-fun GoodMask (T@U) Bool)
(declare-fun MapType1TypeInv0 (T@T) T@T)
(declare-fun MapType1TypeInv1 (T@T) T@T)
(declare-fun MapType1Select (T@U T@U T@U) T@U)
(declare-fun MapType1Store (T@U T@U T@U T@U) T@U)
(declare-fun |Math#min| (Int Int) Int)
(declare-fun IdenticalOnKnownLocations (T@U T@U T@U) Bool)
(declare-fun IsPredicateField (T@U) Bool)
(declare-fun null () T@U)
(declare-fun PredicateMaskField (T@U) T@U)
(declare-fun FrameTypeType () T@T)
(declare-fun HasDirectPerm (T@U T@U T@U) Bool)
(declare-fun IsWandField (T@U) Bool)
(declare-fun WandMaskField (T@U) T@U)
(declare-fun |$$'| (T@U T@U) T@U)
(declare-fun MapType2Type (T@T T@T) T@T)
(declare-fun dummyFunction (T@U) Bool)
(declare-fun |$$#triggerStateless| (T@U) T@U)
(declare-fun MapType2TypeInv0 (T@T) T@T)
(declare-fun MapType2TypeInv1 (T@T) T@T)
(declare-fun MapType2Select (T@U T@U) T@U)
(declare-fun MapType2Store (T@U T@U T@U) T@U)
(declare-fun EdgeDomainTypeType () T@T)
(declare-fun |get'| (T@U T@U) T@U)
(declare-fun |get#triggerStateless| (T@U) T@U)
(declare-fun is_on_path (T@U T@U T@U T@U) Bool)
(declare-fun create_edge (T@U T@U) T@U)
(declare-fun exists_path_ (T@U T@U T@U) Bool)
(declare-fun |$$#condqp1| (T@U T@U) Int)
(declare-fun |sk_$$#condqp1| (Int Int) T@U)
(declare-fun NoPerm () Real)
(declare-fun FullPerm () Real)
(declare-fun |$$#condqp2| (T@U T@U) Int)
(declare-fun |sk_$$#condqp2| (Int Int) T@U)
(declare-fun |MultiSet#Select| (T@U T@U) Int)
(declare-fun |Set#Union| (T@U T@U) T@U)
(declare-fun |Set#Intersection| (T@U T@U) T@U)
(declare-fun |Set#Singleton| (T@U) T@U)
(declare-fun exists_spath (T@U T@U T@U) Bool)
(declare-fun exists_path (T@U T@U T@U) Bool)
(declare-fun |Set#Card| (T@U) Int)
(declare-fun inst_uReach (T@U T@U) T@U)
(declare-fun $$ (T@U T@U) T@U)
(declare-fun get (T@U T@U) T@U)
(declare-fun |Math#clip| (Int) Int)
(declare-fun dummyHeap () T@U)
(declare-fun ZeroMask () T@U)
(declare-fun |MultiSet#UnionOne| (T@U T@U) T@U)
(declare-fun |MultiSet#Disjoint| (T@U T@U) Bool)
(declare-fun |$$#frame| (T@U T@U) T@U)
(declare-fun CombineFrames (T@U T@U) T@U)
(declare-fun FrameFragment (T@U) T@U)
(declare-fun InsidePredicate (T@U T@U T@U T@U) Bool)
(declare-fun AssumeFunctionsAbove () Int)
(declare-fun |$$#trigger| (T@U T@U) Bool)
(declare-fun |MultiSet#Singleton| (T@U) T@U)
(declare-fun |Set#Equal| (T@U T@U) Bool)
(declare-fun sumMask (T@U T@U T@U) Bool)
(declare-fun ConditionalFrame (Real T@U) T@U)
(declare-fun EmptyFrame () T@U)
(declare-fun edge_pred (T@U) T@U)
(declare-fun edge_succ (T@U) T@U)
(declare-fun |Set#Difference| (T@U T@U) T@U)
(declare-fun |get#trigger| (T@U T@U) Bool)
(declare-fun |MultiSet#Equal| (T@U T@U) Bool)
(declare-fun |Set#UnionOne| (T@U T@U) T@U)
(declare-fun |MultiSet#Empty| (T@T) T@U)
(declare-fun |get#frame| (T@U T@U) T@U)
(declare-fun |Set#Empty| (T@T) T@U)
(declare-fun |Set#Subset| (T@U T@U) Bool)
(declare-fun ZeroPMask () T@U)
(declare-fun apply_noExit (T@U T@U T@U) Bool)
(declare-fun |MultiSet#Subset| (T@U T@U) Bool)
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
(assert  (and (and (and (and (and (and (and (forall ((arg0@@11 T@T) (arg1 T@T) ) (! (= (Ctor (FieldType arg0@@11 arg1)) 6)
 :qid |ctor:FieldType|
)) (forall ((arg0@@12 T@T) (arg1@@0 T@T) ) (! (= (FieldTypeInv0 (FieldType arg0@@12 arg1@@0)) arg0@@12)
 :qid |typeInv:FieldTypeInv0|
 :pattern ( (FieldType arg0@@12 arg1@@0))
))) (forall ((arg0@@13 T@T) (arg1@@1 T@T) ) (! (= (FieldTypeInv1 (FieldType arg0@@13 arg1@@1)) arg1@@1)
 :qid |typeInv:FieldTypeInv1|
 :pattern ( (FieldType arg0@@13 arg1@@1))
))) (= (Ctor NormalFieldType) 7)) (= (type $allocated) (FieldType NormalFieldType boolType))) (= (Ctor RefType) 8)) (= (type car) (FieldType NormalFieldType RefType))) (= (type cdr) (FieldType NormalFieldType RefType))))
(assert (distinct $allocated car cdr)
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
(assert  (and (and (and (and (forall ((arg0@@18 T@T) ) (! (= (Ctor (MultiSetType arg0@@18)) 10)
 :qid |ctor:MultiSetType|
)) (forall ((arg0@@19 T@T) ) (! (= (MultiSetTypeInv0 (MultiSetType arg0@@19)) arg0@@19)
 :qid |typeInv:MultiSetTypeInv0|
 :pattern ( (MultiSetType arg0@@19))
))) (forall ((arg0@@20 T@U) (arg1@@4 T@U) ) (! (let ((T (MultiSetTypeInv0 (type arg0@@20))))
(= (type (|MultiSet#Difference| arg0@@20 arg1@@4)) (MultiSetType T)))
 :qid |funType:MultiSet#Difference|
 :pattern ( (|MultiSet#Difference| arg0@@20 arg1@@4))
))) (forall ((arg0@@21 T@U) (arg1@@5 T@U) ) (! (let ((T@@0 (MultiSetTypeInv0 (type arg0@@21))))
(= (type (|MultiSet#Intersection| arg0@@21 arg1@@5)) (MultiSetType T@@0)))
 :qid |funType:MultiSet#Intersection|
 :pattern ( (|MultiSet#Intersection| arg0@@21 arg1@@5))
))) (forall ((arg0@@22 T@U) (arg1@@6 T@U) ) (! (let ((T@@1 (MultiSetTypeInv0 (type arg0@@22))))
(= (type (|MultiSet#Union| arg0@@22 arg1@@6)) (MultiSetType T@@1)))
 :qid |funType:MultiSet#Union|
 :pattern ( (|MultiSet#Union| arg0@@22 arg1@@6))
))))
(assert (forall ((a T@U) (b T@U) ) (! (let ((T@@2 (MultiSetTypeInv0 (type a))))
 (=> (and (= (type a) (MultiSetType T@@2)) (= (type b) (MultiSetType T@@2))) (and (= (+ (+ (|MultiSet#Card| (|MultiSet#Difference| a b)) (|MultiSet#Card| (|MultiSet#Difference| b a))) (* 2 (|MultiSet#Card| (|MultiSet#Intersection| a b)))) (|MultiSet#Card| (|MultiSet#Union| a b))) (= (|MultiSet#Card| (|MultiSet#Difference| a b)) (- (|MultiSet#Card| a) (|MultiSet#Card| (|MultiSet#Intersection| a b)))))))
 :qid |stdinbpl.483:18|
 :skolemid |74|
 :pattern ( (|MultiSet#Card| (|MultiSet#Difference| a b)))
)))
(assert  (and (and (and (and (and (and (forall ((arg0@@23 T@T) (arg1@@7 T@T) ) (! (= (Ctor (MapType1Type arg0@@23 arg1@@7)) 11)
 :qid |ctor:MapType1Type|
)) (forall ((arg0@@24 T@T) (arg1@@8 T@T) ) (! (= (MapType1TypeInv0 (MapType1Type arg0@@24 arg1@@8)) arg0@@24)
 :qid |typeInv:MapType1TypeInv0|
 :pattern ( (MapType1Type arg0@@24 arg1@@8))
))) (forall ((arg0@@25 T@T) (arg1@@9 T@T) ) (! (= (MapType1TypeInv1 (MapType1Type arg0@@25 arg1@@9)) arg1@@9)
 :qid |typeInv:MapType1TypeInv1|
 :pattern ( (MapType1Type arg0@@25 arg1@@9))
))) (forall ((arg0@@26 T@U) (arg1@@10 T@U) (arg2@@1 T@U) ) (! (let ((aVar1 (MapType1TypeInv1 (type arg0@@26))))
(= (type (MapType1Select arg0@@26 arg1@@10 arg2@@1)) aVar1))
 :qid |funType:MapType1Select|
 :pattern ( (MapType1Select arg0@@26 arg1@@10 arg2@@1))
))) (forall ((arg0@@27 T@U) (arg1@@11 T@U) (arg2@@2 T@U) (arg3@@0 T@U) ) (! (let ((aVar1@@0 (type arg3@@0)))
(let ((aVar0@@0 (type arg1@@11)))
(= (type (MapType1Store arg0@@27 arg1@@11 arg2@@2 arg3@@0)) (MapType1Type aVar0@@0 aVar1@@0))))
 :qid |funType:MapType1Store|
 :pattern ( (MapType1Store arg0@@27 arg1@@11 arg2@@2 arg3@@0))
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
(assert (forall ((a@@0 Int) (b@@0 Int) ) (!  (or (= (|Math#min| a@@0 b@@0) a@@0) (= (|Math#min| a@@0 b@@0) b@@0))
 :qid |stdinbpl.414:15|
 :skolemid |53|
 :pattern ( (|Math#min| a@@0 b@@0))
)))
(assert  (and (and (= (Ctor FrameTypeType) 12) (= (type null) RefType)) (forall ((arg0@@28 T@U) ) (! (let ((A (FieldTypeInv0 (type arg0@@28))))
(= (type (PredicateMaskField arg0@@28)) (FieldType A (MapType1Type RefType boolType))))
 :qid |funType:PredicateMaskField|
 :pattern ( (PredicateMaskField arg0@@28))
))))
(assert (forall ((Heap@@0 T@U) (ExhaleHeap T@U) (Mask@@0 T@U) (pm_f T@U) ) (! (let ((C (FieldTypeInv0 (type pm_f))))
 (=> (and (and (and (and (and (= (type Heap@@0) (MapType0Type RefType)) (= (type ExhaleHeap) (MapType0Type RefType))) (= (type Mask@@0) (MapType1Type RefType realType))) (= (type pm_f) (FieldType C FrameTypeType))) (IdenticalOnKnownLocations Heap@@0 ExhaleHeap Mask@@0)) (and (HasDirectPerm Mask@@0 null pm_f) (IsPredicateField pm_f))) (= (MapType0Select Heap@@0 null (PredicateMaskField pm_f)) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))))
 :qid |stdinbpl.47:19|
 :skolemid |2|
 :pattern ( (IdenticalOnKnownLocations Heap@@0 ExhaleHeap Mask@@0) (IsPredicateField pm_f) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))
)))
(assert (forall ((arg0@@29 T@U) ) (! (let ((A@@0 (FieldTypeInv0 (type arg0@@29))))
(= (type (WandMaskField arg0@@29)) (FieldType A@@0 (MapType1Type RefType boolType))))
 :qid |funType:WandMaskField|
 :pattern ( (WandMaskField arg0@@29))
)))
(assert (forall ((Heap@@1 T@U) (ExhaleHeap@@0 T@U) (Mask@@1 T@U) (pm_f@@0 T@U) ) (! (let ((C@@0 (FieldTypeInv0 (type pm_f@@0))))
 (=> (and (and (and (and (and (= (type Heap@@1) (MapType0Type RefType)) (= (type ExhaleHeap@@0) (MapType0Type RefType))) (= (type Mask@@1) (MapType1Type RefType realType))) (= (type pm_f@@0) (FieldType C@@0 FrameTypeType))) (IdenticalOnKnownLocations Heap@@1 ExhaleHeap@@0 Mask@@1)) (and (HasDirectPerm Mask@@1 null pm_f@@0) (IsWandField pm_f@@0))) (= (MapType0Select Heap@@1 null (WandMaskField pm_f@@0)) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))))
 :qid |stdinbpl.60:19|
 :skolemid |5|
 :pattern ( (IdenticalOnKnownLocations Heap@@1 ExhaleHeap@@0 Mask@@1) (IsWandField pm_f@@0) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))
)))
(assert  (and (and (and (and (and (and (and (and (and (forall ((arg0@@30 T@T) (arg1@@12 T@T) ) (! (= (Ctor (MapType2Type arg0@@30 arg1@@12)) 13)
 :qid |ctor:MapType2Type|
)) (forall ((arg0@@31 T@T) (arg1@@13 T@T) ) (! (= (MapType2TypeInv0 (MapType2Type arg0@@31 arg1@@13)) arg0@@31)
 :qid |typeInv:MapType2TypeInv0|
 :pattern ( (MapType2Type arg0@@31 arg1@@13))
))) (forall ((arg0@@32 T@T) (arg1@@14 T@T) ) (! (= (MapType2TypeInv1 (MapType2Type arg0@@32 arg1@@14)) arg1@@14)
 :qid |typeInv:MapType2TypeInv1|
 :pattern ( (MapType2Type arg0@@32 arg1@@14))
))) (forall ((arg0@@33 T@U) (arg1@@15 T@U) ) (! (let ((aVar1@@2 (MapType2TypeInv1 (type arg0@@33))))
(= (type (MapType2Select arg0@@33 arg1@@15)) aVar1@@2))
 :qid |funType:MapType2Select|
 :pattern ( (MapType2Select arg0@@33 arg1@@15))
))) (forall ((arg0@@34 T@U) (arg1@@16 T@U) (arg2@@3 T@U) ) (! (let ((aVar1@@3 (type arg2@@3)))
(let ((aVar0@@1 (type arg1@@16)))
(= (type (MapType2Store arg0@@34 arg1@@16 arg2@@3)) (MapType2Type aVar0@@1 aVar1@@3))))
 :qid |funType:MapType2Store|
 :pattern ( (MapType2Store arg0@@34 arg1@@16 arg2@@3))
))) (forall ((m@@7 T@U) (x0@@7 T@U) (val@@7 T@U) ) (! (let ((aVar1@@4 (MapType2TypeInv1 (type m@@7))))
 (=> (= (type val@@7) aVar1@@4) (= (MapType2Select (MapType2Store m@@7 x0@@7 val@@7) x0@@7) val@@7)))
 :qid |mapAx0:MapType2Select|
 :weight 0
))) (and (forall ((val@@8 T@U) (m@@8 T@U) (x0@@8 T@U) (y0@@5 T@U) ) (!  (or (= x0@@8 y0@@5) (= (MapType2Select (MapType2Store m@@8 x0@@8 val@@8) y0@@5) (MapType2Select m@@8 y0@@5)))
 :qid |mapAx1:MapType2Select:0|
 :weight 0
)) (forall ((val@@9 T@U) (m@@9 T@U) (x0@@9 T@U) (y0@@6 T@U) ) (!  (or true (= (MapType2Select (MapType2Store m@@9 x0@@9 val@@9) y0@@6) (MapType2Select m@@9 y0@@6)))
 :qid |mapAx2:MapType2Select|
 :weight 0
)))) (= (Ctor EdgeDomainTypeType) 14)) (forall ((arg0@@35 T@U) (arg1@@17 T@U) ) (! (= (type (|$$'| arg0@@35 arg1@@17)) (MapType2Type EdgeDomainTypeType boolType))
 :qid |funType:$$'|
 :pattern ( (|$$'| arg0@@35 arg1@@17))
))) (forall ((arg0@@36 T@U) ) (! (= (type (|$$#triggerStateless| arg0@@36)) (MapType2Type EdgeDomainTypeType boolType))
 :qid |funType:$$#triggerStateless|
 :pattern ( (|$$#triggerStateless| arg0@@36))
))))
(assert (forall ((Heap@@2 T@U) (refs T@U) ) (!  (=> (and (= (type Heap@@2) (MapType0Type RefType)) (= (type refs) (MapType2Type RefType boolType))) (dummyFunction (|$$#triggerStateless| refs)))
 :qid |stdinbpl.649:15|
 :skolemid |95|
 :pattern ( (|$$'| Heap@@2 refs))
)))
(assert  (and (forall ((arg0@@37 T@U) (arg1@@18 T@U) ) (! (= (type (|get'| arg0@@37 arg1@@18)) RefType)
 :qid |funType:get'|
 :pattern ( (|get'| arg0@@37 arg1@@18))
)) (forall ((arg0@@38 T@U) ) (! (= (type (|get#triggerStateless| arg0@@38)) RefType)
 :qid |funType:get#triggerStateless|
 :pattern ( (|get#triggerStateless| arg0@@38))
))))
(assert (forall ((Heap@@3 T@U) (s_1 T@U) ) (!  (=> (and (= (type Heap@@3) (MapType0Type RefType)) (= (type s_1) (MapType2Type RefType boolType))) (dummyFunction (|get#triggerStateless| s_1)))
 :qid |stdinbpl.824:15|
 :skolemid |115|
 :pattern ( (|get'| Heap@@3 s_1))
)))
(assert (forall ((arg0@@39 T@U) (arg1@@19 T@U) ) (! (= (type (create_edge arg0@@39 arg1@@19)) EdgeDomainTypeType)
 :qid |funType:create_edge|
 :pattern ( (create_edge arg0@@39 arg1@@19))
)))
(assert (forall ((EG_1 T@U) (start_1 T@U) (mid T@U) (end_1 T@U) ) (!  (=> (and (and (and (= (type EG_1) (MapType2Type EdgeDomainTypeType boolType)) (= (type start_1) RefType)) (= (type mid) RefType)) (= (type end_1) RefType)) (= (is_on_path EG_1 start_1 mid end_1)  (and (U_2_bool (MapType2Select EG_1 (create_edge start_1 mid))) (exists_path_ EG_1 mid end_1))))
 :qid |stdinbpl.598:15|
 :skolemid |88|
 :pattern ( (is_on_path EG_1 start_1 mid end_1))
 :pattern ( (MapType2Select EG_1 (create_edge start_1 mid)) (exists_path_ EG_1 mid end_1))
)))
(assert (forall ((arg0@@40 Int) (arg1@@20 Int) ) (! (= (type (|sk_$$#condqp1| arg0@@40 arg1@@20)) RefType)
 :qid |funType:sk_$$#condqp1|
 :pattern ( (|sk_$$#condqp1| arg0@@40 arg1@@20))
)))
(assert (forall ((Heap2Heap T@U) (Heap1Heap T@U) (refs@@0 T@U) ) (!  (=> (and (and (and (= (type Heap2Heap) (MapType0Type RefType)) (= (type Heap1Heap) (MapType0Type RefType))) (= (type refs@@0) (MapType2Type RefType boolType))) (and (=  (and (U_2_bool (MapType2Select refs@@0 (|sk_$$#condqp1| (|$$#condqp1| Heap2Heap refs@@0) (|$$#condqp1| Heap1Heap refs@@0)))) (< NoPerm FullPerm))  (and (U_2_bool (MapType2Select refs@@0 (|sk_$$#condqp1| (|$$#condqp1| Heap2Heap refs@@0) (|$$#condqp1| Heap1Heap refs@@0)))) (< NoPerm FullPerm))) (=> (and (U_2_bool (MapType2Select refs@@0 (|sk_$$#condqp1| (|$$#condqp1| Heap2Heap refs@@0) (|$$#condqp1| Heap1Heap refs@@0)))) (< NoPerm FullPerm)) (= (MapType0Select Heap2Heap (|sk_$$#condqp1| (|$$#condqp1| Heap2Heap refs@@0) (|$$#condqp1| Heap1Heap refs@@0)) car) (MapType0Select Heap1Heap (|sk_$$#condqp1| (|$$#condqp1| Heap2Heap refs@@0) (|$$#condqp1| Heap1Heap refs@@0)) car))))) (= (|$$#condqp1| Heap2Heap refs@@0) (|$$#condqp1| Heap1Heap refs@@0)))
 :qid |stdinbpl.666:15|
 :skolemid |97|
 :pattern ( (|$$#condqp1| Heap2Heap refs@@0) (|$$#condqp1| Heap1Heap refs@@0) (succHeapTrans Heap2Heap Heap1Heap))
)))
(assert (forall ((arg0@@41 Int) (arg1@@21 Int) ) (! (= (type (|sk_$$#condqp2| arg0@@41 arg1@@21)) RefType)
 :qid |funType:sk_$$#condqp2|
 :pattern ( (|sk_$$#condqp2| arg0@@41 arg1@@21))
)))
(assert (forall ((Heap2Heap@@0 T@U) (Heap1Heap@@0 T@U) (refs@@1 T@U) ) (!  (=> (and (and (and (= (type Heap2Heap@@0) (MapType0Type RefType)) (= (type Heap1Heap@@0) (MapType0Type RefType))) (= (type refs@@1) (MapType2Type RefType boolType))) (and (=  (and (U_2_bool (MapType2Select refs@@1 (|sk_$$#condqp2| (|$$#condqp2| Heap2Heap@@0 refs@@1) (|$$#condqp2| Heap1Heap@@0 refs@@1)))) (< NoPerm FullPerm))  (and (U_2_bool (MapType2Select refs@@1 (|sk_$$#condqp2| (|$$#condqp2| Heap2Heap@@0 refs@@1) (|$$#condqp2| Heap1Heap@@0 refs@@1)))) (< NoPerm FullPerm))) (=> (and (U_2_bool (MapType2Select refs@@1 (|sk_$$#condqp2| (|$$#condqp2| Heap2Heap@@0 refs@@1) (|$$#condqp2| Heap1Heap@@0 refs@@1)))) (< NoPerm FullPerm)) (= (MapType0Select Heap2Heap@@0 (|sk_$$#condqp2| (|$$#condqp2| Heap2Heap@@0 refs@@1) (|$$#condqp2| Heap1Heap@@0 refs@@1)) cdr) (MapType0Select Heap1Heap@@0 (|sk_$$#condqp2| (|$$#condqp2| Heap2Heap@@0 refs@@1) (|$$#condqp2| Heap1Heap@@0 refs@@1)) cdr))))) (= (|$$#condqp2| Heap2Heap@@0 refs@@1) (|$$#condqp2| Heap1Heap@@0 refs@@1)))
 :qid |stdinbpl.676:15|
 :skolemid |98|
 :pattern ( (|$$#condqp2| Heap2Heap@@0 refs@@1) (|$$#condqp2| Heap1Heap@@0 refs@@1) (succHeapTrans Heap2Heap@@0 Heap1Heap@@0))
)))
(assert (forall ((a@@1 T@U) (b@@1 T@U) (y@@1 T@U) ) (! (let ((T@@3 (type y@@1)))
 (=> (and (and (= (type a@@1) (MultiSetType T@@3)) (= (type b@@1) (MultiSetType T@@3))) (<= (|MultiSet#Select| a@@1 y@@1) (|MultiSet#Select| b@@1 y@@1))) (= (|MultiSet#Select| (|MultiSet#Difference| a@@1 b@@1) y@@1) 0)))
 :qid |stdinbpl.481:18|
 :skolemid |73|
 :pattern ( (|MultiSet#Difference| a@@1 b@@1) (|MultiSet#Select| b@@1 y@@1) (|MultiSet#Select| a@@1 y@@1))
)))
(assert (forall ((arg0@@42 T@U) (arg1@@22 T@U) ) (! (let ((T@@4 (MapType2TypeInv0 (type arg0@@42))))
(= (type (|Set#Union| arg0@@42 arg1@@22)) (MapType2Type T@@4 boolType)))
 :qid |funType:Set#Union|
 :pattern ( (|Set#Union| arg0@@42 arg1@@22))
)))
(assert (forall ((a@@2 T@U) (b@@2 T@U) ) (! (let ((T@@5 (MapType2TypeInv0 (type a@@2))))
 (=> (and (= (type a@@2) (MapType2Type T@@5 boolType)) (= (type b@@2) (MapType2Type T@@5 boolType))) (= (|Set#Union| (|Set#Union| a@@2 b@@2) b@@2) (|Set#Union| a@@2 b@@2))))
 :qid |stdinbpl.366:18|
 :skolemid |38|
 :pattern ( (|Set#Union| (|Set#Union| a@@2 b@@2) b@@2))
)))
(assert (forall ((arg0@@43 T@U) (arg1@@23 T@U) ) (! (let ((T@@6 (MapType2TypeInv0 (type arg0@@43))))
(= (type (|Set#Intersection| arg0@@43 arg1@@23)) (MapType2Type T@@6 boolType)))
 :qid |funType:Set#Intersection|
 :pattern ( (|Set#Intersection| arg0@@43 arg1@@23))
)))
(assert (forall ((a@@3 T@U) (b@@3 T@U) ) (! (let ((T@@7 (MapType2TypeInv0 (type a@@3))))
 (=> (and (= (type a@@3) (MapType2Type T@@7 boolType)) (= (type b@@3) (MapType2Type T@@7 boolType))) (= (|Set#Intersection| (|Set#Intersection| a@@3 b@@3) b@@3) (|Set#Intersection| a@@3 b@@3))))
 :qid |stdinbpl.370:18|
 :skolemid |40|
 :pattern ( (|Set#Intersection| (|Set#Intersection| a@@3 b@@3) b@@3))
)))
(assert (forall ((a@@4 T@U) (b@@4 T@U) ) (! (let ((T@@8 (MultiSetTypeInv0 (type a@@4))))
 (=> (and (= (type a@@4) (MultiSetType T@@8)) (= (type b@@4) (MultiSetType T@@8))) (= (|MultiSet#Intersection| (|MultiSet#Intersection| a@@4 b@@4) b@@4) (|MultiSet#Intersection| a@@4 b@@4))))
 :qid |stdinbpl.472:18|
 :skolemid |70|
 :pattern ( (|MultiSet#Intersection| (|MultiSet#Intersection| a@@4 b@@4) b@@4))
)))
(assert (forall ((arg0@@44 T@U) ) (! (let ((T@@9 (type arg0@@44)))
(= (type (|Set#Singleton| arg0@@44)) (MapType2Type T@@9 boolType)))
 :qid |funType:Set#Singleton|
 :pattern ( (|Set#Singleton| arg0@@44))
)))
(assert (forall ((r T@U) (o T@U) ) (! (let ((T@@10 (type r)))
 (=> (= (type o) T@@10) (= (U_2_bool (MapType2Select (|Set#Singleton| r) o)) (= r o))))
 :qid |stdinbpl.335:18|
 :skolemid |27|
 :pattern ( (MapType2Select (|Set#Singleton| r) o))
)))
(assert (forall ((EG_1@@0 T@U) (from_1 T@U) (to_1 T@U) ) (!  (=> (and (and (= (type EG_1@@0) (MapType2Type EdgeDomainTypeType boolType)) (= (type from_1) (MapType2Type RefType boolType))) (= (type to_1) RefType)) (= (exists_spath EG_1@@0 from_1 to_1) (exists ((f_7 T@U) ) (!  (and (= (type f_7) RefType) (and (U_2_bool (MapType2Select from_1 f_7)) (exists_path EG_1@@0 f_7 to_1)))
 :qid |stdinbpl.621:55|
 :skolemid |92|
 :pattern ( (MapType2Select from_1 f_7))
 :pattern ( (exists_path EG_1@@0 f_7 to_1))
))))
 :qid |stdinbpl.619:15|
 :skolemid |93|
 :pattern ( (exists_spath EG_1@@0 from_1 to_1))
)))
(assert (forall ((a@@5 T@U) (b@@5 T@U) ) (! (let ((T@@11 (MapType2TypeInv0 (type a@@5))))
 (=> (and (= (type a@@5) (MapType2Type T@@11 boolType)) (= (type b@@5) (MapType2Type T@@11 boolType))) (= (+ (|Set#Card| (|Set#Union| a@@5 b@@5)) (|Set#Card| (|Set#Intersection| a@@5 b@@5))) (+ (|Set#Card| a@@5) (|Set#Card| b@@5)))))
 :qid |stdinbpl.374:18|
 :skolemid |42|
 :pattern ( (|Set#Card| (|Set#Union| a@@5 b@@5)))
 :pattern ( (|Set#Card| (|Set#Intersection| a@@5 b@@5)))
)))
(assert (forall ((arg0@@45 T@U) (arg1@@24 T@U) ) (! (= (type (inst_uReach arg0@@45 arg1@@24)) (MapType2Type RefType boolType))
 :qid |funType:inst_uReach|
 :pattern ( (inst_uReach arg0@@45 arg1@@24))
)))
(assert (forall ((EG_1@@1 T@U) (x_1 T@U) (v_2 T@U) ) (!  (=> (and (and (= (type EG_1@@1) (MapType2Type EdgeDomainTypeType boolType)) (= (type x_1) RefType)) (= (type v_2) RefType)) (= (U_2_bool (MapType2Select (inst_uReach EG_1@@1 x_1) v_2)) (exists_path EG_1@@1 x_1 v_2)))
 :qid |stdinbpl.586:15|
 :skolemid |86|
 :pattern ( (MapType2Select (inst_uReach EG_1@@1 x_1) v_2))
 :pattern ( (exists_path EG_1@@1 x_1 v_2))
)))
(assert (forall ((Heap@@4 T@U) (ExhaleHeap@@1 T@U) (Mask@@2 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@4) (MapType0Type RefType)) (= (type ExhaleHeap@@1) (MapType0Type RefType))) (= (type Mask@@2) (MapType1Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@4 ExhaleHeap@@1 Mask@@2)) (U_2_bool (MapType0Select Heap@@4 o_1 $allocated))) (U_2_bool (MapType0Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.73:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@4 ExhaleHeap@@1 Mask@@2) (MapType0Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert (forall ((arg0@@46 T@U) (arg1@@25 T@U) ) (! (= (type ($$ arg0@@46 arg1@@25)) (MapType2Type EdgeDomainTypeType boolType))
 :qid |funType:$$|
 :pattern ( ($$ arg0@@46 arg1@@25))
)))
(assert (forall ((Heap@@5 T@U) (refs@@2 T@U) ) (!  (=> (and (= (type Heap@@5) (MapType0Type RefType)) (= (type refs@@2) (MapType2Type RefType boolType))) (and (= ($$ Heap@@5 refs@@2) (|$$'| Heap@@5 refs@@2)) (dummyFunction (|$$#triggerStateless| refs@@2))))
 :qid |stdinbpl.645:15|
 :skolemid |94|
 :pattern ( ($$ Heap@@5 refs@@2))
)))
(assert (forall ((arg0@@47 T@U) (arg1@@26 T@U) ) (! (= (type (get arg0@@47 arg1@@26)) RefType)
 :qid |funType:get|
 :pattern ( (get arg0@@47 arg1@@26))
)))
(assert (forall ((Heap@@6 T@U) (s_1@@0 T@U) ) (!  (=> (and (= (type Heap@@6) (MapType0Type RefType)) (= (type s_1@@0) (MapType2Type RefType boolType))) (and (= (get Heap@@6 s_1@@0) (|get'| Heap@@6 s_1@@0)) (dummyFunction (|get#triggerStateless| s_1@@0))))
 :qid |stdinbpl.820:15|
 :skolemid |114|
 :pattern ( (get Heap@@6 s_1@@0))
)))
(assert (forall ((a@@6 Int) ) (!  (=> (<= 0 a@@6) (= (|Math#clip| a@@6) a@@6))
 :qid |stdinbpl.417:15|
 :skolemid |54|
 :pattern ( (|Math#clip| a@@6))
)))
(assert (forall ((EG_1@@2 T@U) (u_1 T@U) (v_2@@0 T@U) (w_2 T@U) ) (!  (=> (and (and (and (and (= (type EG_1@@2) (MapType2Type EdgeDomainTypeType boolType)) (= (type u_1) RefType)) (= (type v_2@@0) RefType)) (= (type w_2) RefType)) (and (exists_path_ EG_1@@2 u_1 w_2) (exists_path_ EG_1@@2 w_2 v_2@@0))) (exists_path_ EG_1@@2 u_1 v_2@@0))
 :qid |stdinbpl.613:15|
 :skolemid |91|
 :pattern ( (exists_path EG_1@@2 u_1 w_2) (exists_path EG_1@@2 w_2 v_2@@0))
)))
(assert (forall ((a@@7 T@U) (b@@6 T@U) (o@@0 T@U) ) (! (let ((T@@12 (type o@@0)))
 (=> (and (= (type a@@7) (MultiSetType T@@12)) (= (type b@@6) (MultiSetType T@@12))) (= (|MultiSet#Select| (|MultiSet#Intersection| a@@7 b@@6) o@@0) (|Math#min| (|MultiSet#Select| a@@7 o@@0) (|MultiSet#Select| b@@6 o@@0)))))
 :qid |stdinbpl.468:18|
 :skolemid |69|
 :pattern ( (|MultiSet#Select| (|MultiSet#Intersection| a@@7 b@@6) o@@0))
)))
(assert (forall ((Heap@@7 T@U) (ExhaleHeap@@2 T@U) (Mask@@3 T@U) (o_1@@0 T@U) (f_2 T@U) ) (! (let ((B@@1 (FieldTypeInv1 (type f_2))))
(let ((A@@1 (FieldTypeInv0 (type f_2))))
 (=> (and (and (and (and (and (and (= (type Heap@@7) (MapType0Type RefType)) (= (type ExhaleHeap@@2) (MapType0Type RefType))) (= (type Mask@@3) (MapType1Type RefType realType))) (= (type o_1@@0) RefType)) (= (type f_2) (FieldType A@@1 B@@1))) (IdenticalOnKnownLocations Heap@@7 ExhaleHeap@@2 Mask@@3)) (HasDirectPerm Mask@@3 o_1@@0 f_2)) (= (MapType0Select Heap@@7 o_1@@0 f_2) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2)))))
 :qid |stdinbpl.42:22|
 :skolemid |1|
 :pattern ( (IdenticalOnKnownLocations Heap@@7 ExhaleHeap@@2 Mask@@3) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2))
)))
(assert  (and (= (type dummyHeap) (MapType0Type RefType)) (= (type ZeroMask) (MapType1Type RefType realType))))
(assert (state dummyHeap ZeroMask))
(assert (forall ((arg0@@48 T@U) (arg1@@27 T@U) ) (! (let ((T@@13 (type arg1@@27)))
(= (type (|MultiSet#UnionOne| arg0@@48 arg1@@27)) (MultiSetType T@@13)))
 :qid |funType:MultiSet#UnionOne|
 :pattern ( (|MultiSet#UnionOne| arg0@@48 arg1@@27))
)))
(assert (forall ((a@@8 T@U) (x@@8 T@U) ) (! (let ((T@@14 (type x@@8)))
 (=> (= (type a@@8) (MultiSetType T@@14)) (= (|MultiSet#Card| (|MultiSet#UnionOne| a@@8 x@@8)) (+ (|MultiSet#Card| a@@8) 1))))
 :qid |stdinbpl.454:18|
 :skolemid |65|
 :pattern ( (|MultiSet#Card| (|MultiSet#UnionOne| a@@8 x@@8)))
 :pattern ( (|MultiSet#UnionOne| a@@8 x@@8) (|MultiSet#Card| a@@8))
)))
(assert (forall ((a@@9 T@U) (b@@7 T@U) ) (! (let ((T@@15 (MultiSetTypeInv0 (type a@@9))))
 (=> (and (= (type a@@9) (MultiSetType T@@15)) (= (type b@@7) (MultiSetType T@@15))) (= (|MultiSet#Disjoint| a@@9 b@@7) (forall ((o@@1 T@U) ) (!  (=> (= (type o@@1) T@@15) (or (= (|MultiSet#Select| a@@9 o@@1) 0) (= (|MultiSet#Select| b@@7 o@@1) 0)))
 :qid |stdinbpl.504:39|
 :skolemid |80|
 :pattern ( (|MultiSet#Select| a@@9 o@@1))
 :pattern ( (|MultiSet#Select| b@@7 o@@1))
)))))
 :qid |stdinbpl.503:18|
 :skolemid |81|
 :pattern ( (|MultiSet#Disjoint| a@@9 b@@7))
)))
(assert  (and (and (forall ((arg0@@49 T@U) (arg1@@28 T@U) ) (! (= (type (|$$#frame| arg0@@49 arg1@@28)) (MapType2Type EdgeDomainTypeType boolType))
 :qid |funType:$$#frame|
 :pattern ( (|$$#frame| arg0@@49 arg1@@28))
)) (forall ((arg0@@50 T@U) (arg1@@29 T@U) ) (! (= (type (CombineFrames arg0@@50 arg1@@29)) FrameTypeType)
 :qid |funType:CombineFrames|
 :pattern ( (CombineFrames arg0@@50 arg1@@29))
))) (forall ((arg0@@51 T@U) ) (! (= (type (FrameFragment arg0@@51)) FrameTypeType)
 :qid |funType:FrameFragment|
 :pattern ( (FrameFragment arg0@@51))
))))
(assert (forall ((Heap@@8 T@U) (Mask@@4 T@U) (refs@@3 T@U) ) (!  (=> (and (and (and (= (type Heap@@8) (MapType0Type RefType)) (= (type Mask@@4) (MapType1Type RefType realType))) (= (type refs@@3) (MapType2Type RefType boolType))) (state Heap@@8 Mask@@4)) (= (|$$'| Heap@@8 refs@@3) (|$$#frame| (CombineFrames (FrameFragment (int_2_U (|$$#condqp1| Heap@@8 refs@@3))) (FrameFragment (int_2_U (|$$#condqp2| Heap@@8 refs@@3)))) refs@@3)))
 :qid |stdinbpl.656:15|
 :skolemid |96|
 :pattern ( (state Heap@@8 Mask@@4) (|$$'| Heap@@8 refs@@3))
)))
(assert (forall ((p T@U) (v_1 T@U) (w T@U) ) (! (let ((A@@2 (FieldTypeInv0 (type p))))
 (=> (and (and (= (type p) (FieldType A@@2 FrameTypeType)) (= (type v_1) FrameTypeType)) (= (type w) FrameTypeType)) (not (InsidePredicate p v_1 p w))))
 :qid |stdinbpl.312:19|
 :skolemid |21|
 :pattern ( (InsidePredicate p v_1 p w))
)))
(assert (forall ((Heap@@9 T@U) (Mask@@5 T@U) (refs@@4 T@U) ) (!  (=> (and (and (and (= (type Heap@@9) (MapType0Type RefType)) (= (type Mask@@5) (MapType1Type RefType realType))) (= (type refs@@4) (MapType2Type RefType boolType))) (and (state Heap@@9 Mask@@5) (or (< AssumeFunctionsAbove 1) (|$$#trigger| (CombineFrames (FrameFragment (int_2_U (|$$#condqp1| Heap@@9 refs@@4))) (FrameFragment (int_2_U (|$$#condqp2| Heap@@9 refs@@4)))) refs@@4)))) (forall ((p_2 T@U) (s_1@@1 T@U) ) (!  (=> (and (= (type p_2) RefType) (= (type s_1@@1) RefType)) (=  (and (U_2_bool (MapType2Select refs@@4 p_2)) (and (U_2_bool (MapType2Select refs@@4 s_1@@1)) (or (= (MapType0Select Heap@@9 p_2 car) s_1@@1) (= (MapType0Select Heap@@9 p_2 cdr) s_1@@1)))) (U_2_bool (MapType2Select (|$$'| Heap@@9 refs@@4) (create_edge p_2 s_1@@1)))))
 :qid |stdinbpl.684:176|
 :skolemid |99|
 :pattern ( (MapType2Select (|$$'| Heap@@9 refs@@4) (create_edge p_2 s_1@@1)))
)))
 :qid |stdinbpl.682:15|
 :skolemid |100|
 :pattern ( (state Heap@@9 Mask@@5) (|$$'| Heap@@9 refs@@4))
)))
(assert (forall ((arg0@@52 T@U) ) (! (let ((T@@16 (type arg0@@52)))
(= (type (|MultiSet#Singleton| arg0@@52)) (MultiSetType T@@16)))
 :qid |funType:MultiSet#Singleton|
 :pattern ( (|MultiSet#Singleton| arg0@@52))
)))
(assert (forall ((r@@0 T@U) ) (!  (and (= (|MultiSet#Card| (|MultiSet#Singleton| r@@0)) 1) (= (|MultiSet#Select| (|MultiSet#Singleton| r@@0) r@@0) 1))
 :qid |stdinbpl.446:18|
 :skolemid |62|
 :pattern ( (|MultiSet#Singleton| r@@0))
)))
(assert  (not (IsPredicateField car)))
(assert  (not (IsWandField car)))
(assert  (not (IsPredicateField cdr)))
(assert  (not (IsWandField cdr)))
(assert (forall ((Heap@@10 T@U) (ExhaleHeap@@3 T@U) (Mask@@6 T@U) ) (!  (=> (and (and (and (= (type Heap@@10) (MapType0Type RefType)) (= (type ExhaleHeap@@3) (MapType0Type RefType))) (= (type Mask@@6) (MapType1Type RefType realType))) (IdenticalOnKnownLocations Heap@@10 ExhaleHeap@@3 Mask@@6)) (succHeap Heap@@10 ExhaleHeap@@3))
 :qid |stdinbpl.83:15|
 :skolemid |10|
 :pattern ( (IdenticalOnKnownLocations Heap@@10 ExhaleHeap@@3 Mask@@6))
)))
(assert (forall ((a@@10 T@U) (b@@8 T@U) ) (! (let ((T@@17 (MapType2TypeInv0 (type a@@10))))
 (=> (and (= (type a@@10) (MapType2Type T@@17 boolType)) (= (type b@@8) (MapType2Type T@@17 boolType))) (= (|Set#Equal| a@@10 b@@8) (forall ((o@@2 T@U) ) (!  (=> (= (type o@@2) T@@17) (= (U_2_bool (MapType2Select a@@10 o@@2)) (U_2_bool (MapType2Select b@@8 o@@2))))
 :qid |stdinbpl.399:31|
 :skolemid |48|
 :pattern ( (MapType2Select a@@10 o@@2))
 :pattern ( (MapType2Select b@@8 o@@2))
)))))
 :qid |stdinbpl.398:17|
 :skolemid |49|
 :pattern ( (|Set#Equal| a@@10 b@@8))
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
(assert (forall ((a@@11 T@U) (b@@9 T@U) ) (! (let ((T@@18 (MultiSetTypeInv0 (type a@@11))))
 (=> (and (= (type a@@11) (MultiSetType T@@18)) (= (type b@@9) (MultiSetType T@@18))) (= (|MultiSet#Card| (|MultiSet#Union| a@@11 b@@9)) (+ (|MultiSet#Card| a@@11) (|MultiSet#Card| b@@9)))))
 :qid |stdinbpl.464:18|
 :skolemid |68|
 :pattern ( (|MultiSet#Card| (|MultiSet#Union| a@@11 b@@9)))
 :pattern ( (|MultiSet#Card| a@@11) (|MultiSet#Union| a@@11 b@@9))
 :pattern ( (|MultiSet#Card| b@@9) (|MultiSet#Union| a@@11 b@@9))
)))
(assert  (and (forall ((arg0@@53 Real) (arg1@@30 T@U) ) (! (= (type (ConditionalFrame arg0@@53 arg1@@30)) FrameTypeType)
 :qid |funType:ConditionalFrame|
 :pattern ( (ConditionalFrame arg0@@53 arg1@@30))
)) (= (type EmptyFrame) FrameTypeType)))
(assert (forall ((p@@0 Real) (f_6 T@U) ) (!  (=> (= (type f_6) FrameTypeType) (= (ConditionalFrame p@@0 f_6) (ite (> p@@0 0.0) f_6 EmptyFrame)))
 :qid |stdinbpl.300:15|
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
(assert  (and (forall ((arg0@@54 T@U) ) (! (= (type (edge_pred arg0@@54)) RefType)
 :qid |funType:edge_pred|
 :pattern ( (edge_pred arg0@@54))
)) (forall ((arg0@@55 T@U) ) (! (= (type (edge_succ arg0@@55)) RefType)
 :qid |funType:edge_succ|
 :pattern ( (edge_succ arg0@@55))
))))
(assert (forall ((p_2@@0 T@U) (s_1@@2 T@U) ) (!  (=> (and (= (type p_2@@0) RefType) (= (type s_1@@2) RefType)) (and (= (edge_pred (create_edge p_2@@0 s_1@@2)) p_2@@0) (= (edge_succ (create_edge p_2@@0 s_1@@2)) s_1@@2)))
 :qid |stdinbpl.525:15|
 :skolemid |82|
 :pattern ( (create_edge p_2@@0 s_1@@2))
)))
(assert (forall ((o_2@@1 T@U) (f_4@@1 T@U) ) (! (let ((B@@4 (FieldTypeInv1 (type f_4@@1))))
(let ((A@@5 (FieldTypeInv0 (type f_4@@1))))
 (=> (and (= (type o_2@@1) RefType) (= (type f_4@@1) (FieldType A@@5 B@@4))) (= (U_2_real (MapType1Select ZeroMask o_2@@1 f_4@@1)) NoPerm))))
 :qid |stdinbpl.106:22|
 :skolemid |13|
 :pattern ( (MapType1Select ZeroMask o_2@@1 f_4@@1))
)))
(assert (forall ((a@@12 T@U) (b@@10 T@U) (o@@3 T@U) ) (! (let ((T@@19 (type o@@3)))
 (=> (and (= (type a@@12) (MapType2Type T@@19 boolType)) (= (type b@@10) (MapType2Type T@@19 boolType))) (= (U_2_bool (MapType2Select (|Set#Intersection| a@@12 b@@10) o@@3))  (and (U_2_bool (MapType2Select a@@12 o@@3)) (U_2_bool (MapType2Select b@@10 o@@3))))))
 :qid |stdinbpl.363:18|
 :skolemid |37|
 :pattern ( (MapType2Select (|Set#Intersection| a@@12 b@@10) o@@3))
 :pattern ( (|Set#Intersection| a@@12 b@@10) (MapType2Select a@@12 o@@3))
 :pattern ( (|Set#Intersection| a@@12 b@@10) (MapType2Select b@@10 o@@3))
)))
(assert (forall ((arg0@@56 T@U) (arg1@@31 T@U) ) (! (let ((T@@20 (MapType2TypeInv0 (type arg0@@56))))
(= (type (|Set#Difference| arg0@@56 arg1@@31)) (MapType2Type T@@20 boolType)))
 :qid |funType:Set#Difference|
 :pattern ( (|Set#Difference| arg0@@56 arg1@@31))
)))
(assert (forall ((a@@13 T@U) (b@@11 T@U) (o@@4 T@U) ) (! (let ((T@@21 (type o@@4)))
 (=> (and (= (type a@@13) (MapType2Type T@@21 boolType)) (= (type b@@11) (MapType2Type T@@21 boolType))) (= (U_2_bool (MapType2Select (|Set#Difference| a@@13 b@@11) o@@4))  (and (U_2_bool (MapType2Select a@@13 o@@4)) (not (U_2_bool (MapType2Select b@@11 o@@4)))))))
 :qid |stdinbpl.378:18|
 :skolemid |43|
 :pattern ( (MapType2Select (|Set#Difference| a@@13 b@@11) o@@4))
 :pattern ( (|Set#Difference| a@@13 b@@11) (MapType2Select a@@13 o@@4))
)))
(assert (forall ((EG_1@@3 T@U) (start_1@@0 T@U) (end_1@@0 T@U) ) (!  (=> (and (and (= (type EG_1@@3) (MapType2Type EdgeDomainTypeType boolType)) (= (type start_1@@0) RefType)) (= (type end_1@@0) RefType)) (= (exists_path EG_1@@3 start_1@@0 end_1@@0) (exists_path_ EG_1@@3 start_1@@0 end_1@@0)))
 :qid |stdinbpl.592:15|
 :skolemid |87|
 :pattern ( (exists_path EG_1@@3 start_1@@0 end_1@@0))
)))
(assert (forall ((Heap@@11 T@U) (Mask@@8 T@U) (s_1@@3 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@11) (MapType0Type RefType)) (= (type Mask@@8) (MapType1Type RefType realType))) (= (type s_1@@3) (MapType2Type RefType boolType))) (and (state Heap@@11 Mask@@8) (or (< AssumeFunctionsAbove 0) (|get#trigger| EmptyFrame s_1@@3)))) (> (|Set#Card| s_1@@3) 0)) (U_2_bool (MapType2Select s_1@@3 (|get'| Heap@@11 s_1@@3))))
 :qid |stdinbpl.837:15|
 :skolemid |117|
 :pattern ( (state Heap@@11 Mask@@8) (|get'| Heap@@11 s_1@@3))
)))
(assert (forall ((a@@14 T@U) (b@@12 T@U) ) (! (let ((T@@22 (MapType2TypeInv0 (type a@@14))))
 (=> (and (and (= (type a@@14) (MapType2Type T@@22 boolType)) (= (type b@@12) (MapType2Type T@@22 boolType))) (|Set#Equal| a@@14 b@@12)) (= a@@14 b@@12)))
 :qid |stdinbpl.400:17|
 :skolemid |50|
 :pattern ( (|Set#Equal| a@@14 b@@12))
)))
(assert (forall ((a@@15 T@U) (b@@13 T@U) ) (! (let ((T@@23 (MultiSetTypeInv0 (type a@@15))))
 (=> (and (and (= (type a@@15) (MultiSetType T@@23)) (= (type b@@13) (MultiSetType T@@23))) (|MultiSet#Equal| a@@15 b@@13)) (= a@@15 b@@13)))
 :qid |stdinbpl.499:17|
 :skolemid |79|
 :pattern ( (|MultiSet#Equal| a@@15 b@@13))
)))
(assert (forall ((arg0@@57 T@U) (arg1@@32 T@U) ) (! (let ((T@@24 (type arg1@@32)))
(= (type (|Set#UnionOne| arg0@@57 arg1@@32)) (MapType2Type T@@24 boolType)))
 :qid |funType:Set#UnionOne|
 :pattern ( (|Set#UnionOne| arg0@@57 arg1@@32))
)))
(assert (forall ((a@@16 T@U) (x@@9 T@U) (y@@2 T@U) ) (! (let ((T@@25 (type x@@9)))
 (=> (and (and (= (type a@@16) (MapType2Type T@@25 boolType)) (= (type y@@2) T@@25)) (U_2_bool (MapType2Select a@@16 y@@2))) (U_2_bool (MapType2Select (|Set#UnionOne| a@@16 x@@9) y@@2))))
 :qid |stdinbpl.343:18|
 :skolemid |31|
 :pattern ( (|Set#UnionOne| a@@16 x@@9) (MapType2Select a@@16 y@@2))
)))
(assert (forall ((a@@17 T@U) (b@@14 T@U) (y@@3 T@U) ) (! (let ((T@@26 (type y@@3)))
 (=> (and (and (= (type a@@17) (MapType2Type T@@26 boolType)) (= (type b@@14) (MapType2Type T@@26 boolType))) (U_2_bool (MapType2Select a@@17 y@@3))) (U_2_bool (MapType2Select (|Set#Union| a@@17 b@@14) y@@3))))
 :qid |stdinbpl.353:18|
 :skolemid |35|
 :pattern ( (|Set#Union| a@@17 b@@14) (MapType2Select a@@17 y@@3))
)))
(assert (forall ((a@@18 T@U) (b@@15 T@U) (y@@4 T@U) ) (! (let ((T@@27 (type y@@4)))
 (=> (and (and (= (type a@@18) (MapType2Type T@@27 boolType)) (= (type b@@15) (MapType2Type T@@27 boolType))) (U_2_bool (MapType2Select b@@15 y@@4))) (U_2_bool (MapType2Select (|Set#Union| a@@18 b@@15) y@@4))))
 :qid |stdinbpl.355:18|
 :skolemid |36|
 :pattern ( (|Set#Union| a@@18 b@@15) (MapType2Select b@@15 y@@4))
)))
(assert (forall ((ms T@U) (x@@10 T@U) ) (! (let ((T@@28 (type x@@10)))
 (=> (= (type ms) (MultiSetType T@@28)) (>= (|MultiSet#Select| ms x@@10) 0)))
 :qid |stdinbpl.430:18|
 :skolemid |56|
 :pattern ( (|MultiSet#Select| ms x@@10))
)))
(assert (forall ((a@@19 T@U) (x@@11 T@U) (o@@5 T@U) ) (! (let ((T@@29 (type x@@11)))
 (=> (and (= (type a@@19) (MapType2Type T@@29 boolType)) (= (type o@@5) T@@29)) (= (U_2_bool (MapType2Select (|Set#UnionOne| a@@19 x@@11) o@@5))  (or (= o@@5 x@@11) (U_2_bool (MapType2Select a@@19 o@@5))))))
 :qid |stdinbpl.339:18|
 :skolemid |29|
 :pattern ( (MapType2Select (|Set#UnionOne| a@@19 x@@11) o@@5))
)))
(assert (forall ((a@@20 T@U) (b@@16 T@U) (y@@5 T@U) ) (! (let ((T@@30 (type y@@5)))
 (=> (and (and (= (type a@@20) (MapType2Type T@@30 boolType)) (= (type b@@16) (MapType2Type T@@30 boolType))) (U_2_bool (MapType2Select b@@16 y@@5))) (not (U_2_bool (MapType2Select (|Set#Difference| a@@20 b@@16) y@@5)))))
 :qid |stdinbpl.380:18|
 :skolemid |44|
 :pattern ( (|Set#Difference| a@@20 b@@16) (MapType2Select b@@16 y@@5))
)))
(assert (forall ((a@@21 T@U) (b@@17 T@U) ) (! (let ((T@@31 (MapType2TypeInv0 (type a@@21))))
 (=> (and (= (type a@@21) (MapType2Type T@@31 boolType)) (= (type b@@17) (MapType2Type T@@31 boolType))) (and (= (+ (+ (|Set#Card| (|Set#Difference| a@@21 b@@17)) (|Set#Card| (|Set#Difference| b@@17 a@@21))) (|Set#Card| (|Set#Intersection| a@@21 b@@17))) (|Set#Card| (|Set#Union| a@@21 b@@17))) (= (|Set#Card| (|Set#Difference| a@@21 b@@17)) (- (|Set#Card| a@@21) (|Set#Card| (|Set#Intersection| a@@21 b@@17)))))))
 :qid |stdinbpl.382:18|
 :skolemid |45|
 :pattern ( (|Set#Card| (|Set#Difference| a@@21 b@@17)))
)))
(assert (forall ((s T@U) ) (! (let ((T@@32 (MapType2TypeInv0 (type s))))
 (=> (= (type s) (MapType2Type T@@32 boolType)) (<= 0 (|Set#Card| s))))
 :qid |stdinbpl.325:18|
 :skolemid |22|
 :pattern ( (|Set#Card| s))
)))
(assert (forall ((s@@0 T@U) ) (! (let ((T@@33 (MultiSetTypeInv0 (type s@@0))))
 (=> (= (type s@@0) (MultiSetType T@@33)) (<= 0 (|MultiSet#Card| s@@0))))
 :qid |stdinbpl.433:18|
 :skolemid |57|
 :pattern ( (|MultiSet#Card| s@@0))
)))
(assert (forall ((T@@34 T@T) ) (! (= (type (|MultiSet#Empty| T@@34)) (MultiSetType T@@34))
 :qid |funType:MultiSet#Empty|
 :pattern ( (|MultiSet#Empty| T@@34))
)))
(assert (forall ((o@@6 T@U) ) (! (let ((T@@35 (type o@@6)))
(= (|MultiSet#Select| (|MultiSet#Empty| T@@35) o@@6) 0))
 :qid |stdinbpl.438:18|
 :skolemid |58|
 :pattern ( (let ((T@@35 (type o@@6)))
(|MultiSet#Select| (|MultiSet#Empty| T@@35) o@@6)))
)))
(assert (forall ((a@@22 T@U) (x@@12 T@U) ) (! (let ((T@@36 (type x@@12)))
 (=> (= (type a@@22) (MapType2Type T@@36 boolType)) (U_2_bool (MapType2Select (|Set#UnionOne| a@@22 x@@12) x@@12))))
 :qid |stdinbpl.341:18|
 :skolemid |30|
 :pattern ( (|Set#UnionOne| a@@22 x@@12))
)))
(assert (forall ((Heap@@12 T@U) (ExhaleHeap@@4 T@U) (Mask@@9 T@U) (pm_f@@1 T@U) ) (! (let ((C@@1 (FieldTypeInv0 (type pm_f@@1))))
 (=> (and (and (and (and (and (= (type Heap@@12) (MapType0Type RefType)) (= (type ExhaleHeap@@4) (MapType0Type RefType))) (= (type Mask@@9) (MapType1Type RefType realType))) (= (type pm_f@@1) (FieldType C@@1 FrameTypeType))) (IdenticalOnKnownLocations Heap@@12 ExhaleHeap@@4 Mask@@9)) (and (HasDirectPerm Mask@@9 null pm_f@@1) (IsPredicateField pm_f@@1))) (forall ((o2 T@U) (f_2@@0 T@U) ) (! (let ((B@@5 (FieldTypeInv1 (type f_2@@0))))
(let ((A@@6 (FieldTypeInv0 (type f_2@@0))))
 (=> (and (and (= (type o2) RefType) (= (type f_2@@0) (FieldType A@@6 B@@5))) (U_2_bool (MapType1Select (MapType0Select Heap@@12 null (PredicateMaskField pm_f@@1)) o2 f_2@@0))) (= (MapType0Select Heap@@12 o2 f_2@@0) (MapType0Select ExhaleHeap@@4 o2 f_2@@0)))))
 :qid |stdinbpl.54:134|
 :skolemid |3|
 :pattern ( (MapType0Select ExhaleHeap@@4 o2 f_2@@0))
))))
 :qid |stdinbpl.52:19|
 :skolemid |4|
 :pattern ( (IdenticalOnKnownLocations Heap@@12 ExhaleHeap@@4 Mask@@9) (IsPredicateField pm_f@@1))
)))
(assert (forall ((Heap@@13 T@U) (ExhaleHeap@@5 T@U) (Mask@@10 T@U) (pm_f@@2 T@U) ) (! (let ((C@@2 (FieldTypeInv0 (type pm_f@@2))))
 (=> (and (and (and (and (and (= (type Heap@@13) (MapType0Type RefType)) (= (type ExhaleHeap@@5) (MapType0Type RefType))) (= (type Mask@@10) (MapType1Type RefType realType))) (= (type pm_f@@2) (FieldType C@@2 FrameTypeType))) (IdenticalOnKnownLocations Heap@@13 ExhaleHeap@@5 Mask@@10)) (and (HasDirectPerm Mask@@10 null pm_f@@2) (IsWandField pm_f@@2))) (forall ((o2@@0 T@U) (f_2@@1 T@U) ) (! (let ((B@@6 (FieldTypeInv1 (type f_2@@1))))
(let ((A@@7 (FieldTypeInv0 (type f_2@@1))))
 (=> (and (and (= (type o2@@0) RefType) (= (type f_2@@1) (FieldType A@@7 B@@6))) (U_2_bool (MapType1Select (MapType0Select Heap@@13 null (WandMaskField pm_f@@2)) o2@@0 f_2@@1))) (= (MapType0Select Heap@@13 o2@@0 f_2@@1) (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1)))))
 :qid |stdinbpl.67:129|
 :skolemid |6|
 :pattern ( (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1))
))))
 :qid |stdinbpl.65:19|
 :skolemid |7|
 :pattern ( (IdenticalOnKnownLocations Heap@@13 ExhaleHeap@@5 Mask@@10) (IsWandField pm_f@@2))
)))
(assert (forall ((a@@23 T@U) (x@@13 T@U) ) (! (let ((T@@37 (type x@@13)))
 (=> (and (= (type a@@23) (MapType2Type T@@37 boolType)) (U_2_bool (MapType2Select a@@23 x@@13))) (= (|Set#Card| (|Set#UnionOne| a@@23 x@@13)) (|Set#Card| a@@23))))
 :qid |stdinbpl.345:18|
 :skolemid |32|
 :pattern ( (|Set#Card| (|Set#UnionOne| a@@23 x@@13)))
)))
(assert (forall ((a@@24 T@U) (x@@14 T@U) ) (! (let ((T@@38 (type x@@14)))
 (=> (= (type a@@24) (MultiSetType T@@38)) (and (> (|MultiSet#Select| (|MultiSet#UnionOne| a@@24 x@@14) x@@14) 0) (> (|MultiSet#Card| (|MultiSet#UnionOne| a@@24 x@@14)) 0))))
 :qid |stdinbpl.457:18|
 :skolemid |66|
 :pattern ( (|MultiSet#UnionOne| a@@24 x@@14))
)))
(assert (forall ((r@@1 T@U) ) (! (= (|Set#Card| (|Set#Singleton| r@@1)) 1)
 :qid |stdinbpl.336:18|
 :skolemid |28|
 :pattern ( (|Set#Card| (|Set#Singleton| r@@1)))
)))
(assert (forall ((Mask@@11 T@U) (o_2@@2 T@U) (f_4@@2 T@U) ) (! (let ((B@@7 (FieldTypeInv1 (type f_4@@2))))
(let ((A@@8 (FieldTypeInv0 (type f_4@@2))))
 (=> (and (and (and (= (type Mask@@11) (MapType1Type RefType realType)) (= (type o_2@@2) RefType)) (= (type f_4@@2) (FieldType A@@8 B@@7))) (GoodMask Mask@@11)) (and (>= (U_2_real (MapType1Select Mask@@11 o_2@@2 f_4@@2)) NoPerm) (=> (and (and (GoodMask Mask@@11) (not (IsPredicateField f_4@@2))) (not (IsWandField f_4@@2))) (<= (U_2_real (MapType1Select Mask@@11 o_2@@2 f_4@@2)) FullPerm))))))
 :qid |stdinbpl.128:22|
 :skolemid |16|
 :pattern ( (GoodMask Mask@@11) (MapType1Select Mask@@11 o_2@@2 f_4@@2))
)))
(assert (forall ((r@@2 T@U) ) (! (U_2_bool (MapType2Select (|Set#Singleton| r@@2) r@@2))
 :qid |stdinbpl.334:18|
 :skolemid |26|
 :pattern ( (|Set#Singleton| r@@2))
)))
(assert (forall ((arg0@@58 T@U) (arg1@@33 T@U) ) (! (= (type (|get#frame| arg0@@58 arg1@@33)) RefType)
 :qid |funType:get#frame|
 :pattern ( (|get#frame| arg0@@58 arg1@@33))
)))
(assert (forall ((Heap@@14 T@U) (Mask@@12 T@U) (s_1@@4 T@U) ) (!  (=> (and (and (and (= (type Heap@@14) (MapType0Type RefType)) (= (type Mask@@12) (MapType1Type RefType realType))) (= (type s_1@@4) (MapType2Type RefType boolType))) (state Heap@@14 Mask@@12)) (= (|get'| Heap@@14 s_1@@4) (|get#frame| EmptyFrame s_1@@4)))
 :qid |stdinbpl.831:15|
 :skolemid |116|
 :pattern ( (state Heap@@14 Mask@@12) (|get'| Heap@@14 s_1@@4))
)))
(assert (forall ((a@@25 T@U) (b@@18 T@U) ) (! (let ((T@@39 (MapType2TypeInv0 (type a@@25))))
 (=> (and (= (type a@@25) (MapType2Type T@@39 boolType)) (= (type b@@18) (MapType2Type T@@39 boolType))) (= (|Set#Union| a@@25 (|Set#Union| a@@25 b@@18)) (|Set#Union| a@@25 b@@18))))
 :qid |stdinbpl.368:18|
 :skolemid |39|
 :pattern ( (|Set#Union| a@@25 (|Set#Union| a@@25 b@@18)))
)))
(assert (forall ((a@@26 T@U) (b@@19 T@U) ) (! (let ((T@@40 (MapType2TypeInv0 (type a@@26))))
 (=> (and (= (type a@@26) (MapType2Type T@@40 boolType)) (= (type b@@19) (MapType2Type T@@40 boolType))) (= (|Set#Intersection| a@@26 (|Set#Intersection| a@@26 b@@19)) (|Set#Intersection| a@@26 b@@19))))
 :qid |stdinbpl.372:18|
 :skolemid |41|
 :pattern ( (|Set#Intersection| a@@26 (|Set#Intersection| a@@26 b@@19)))
)))
(assert (forall ((a@@27 T@U) (b@@20 T@U) ) (! (let ((T@@41 (MultiSetTypeInv0 (type a@@27))))
 (=> (and (= (type a@@27) (MultiSetType T@@41)) (= (type b@@20) (MultiSetType T@@41))) (= (|MultiSet#Intersection| a@@27 (|MultiSet#Intersection| a@@27 b@@20)) (|MultiSet#Intersection| a@@27 b@@20))))
 :qid |stdinbpl.474:18|
 :skolemid |71|
 :pattern ( (|MultiSet#Intersection| a@@27 (|MultiSet#Intersection| a@@27 b@@20)))
)))
(assert (forall ((s@@1 T@U) ) (! (let ((T@@42 (MultiSetTypeInv0 (type s@@1))))
 (=> (= (type s@@1) (MultiSetType T@@42)) (and (= (= (|MultiSet#Card| s@@1) 0) (= s@@1 (|MultiSet#Empty| T@@42))) (=> (not (= (|MultiSet#Card| s@@1) 0)) (exists ((x@@15 T@U) ) (!  (and (= (type x@@15) T@@42) (< 0 (|MultiSet#Select| s@@1 x@@15)))
 :qid |stdinbpl.441:38|
 :skolemid |59|
 :no-pattern (type x@@15)
 :no-pattern (U_2_int x@@15)
 :no-pattern (U_2_bool x@@15)
))))))
 :qid |stdinbpl.439:18|
 :skolemid |60|
 :pattern ( (|MultiSet#Card| s@@1))
)))
(assert (forall ((r@@3 T@U) (o@@7 T@U) ) (! (let ((T@@43 (type r@@3)))
 (=> (= (type o@@7) T@@43) (and (= (= (|MultiSet#Select| (|MultiSet#Singleton| r@@3) o@@7) 1) (= r@@3 o@@7)) (= (= (|MultiSet#Select| (|MultiSet#Singleton| r@@3) o@@7) 0) (not (= r@@3 o@@7))))))
 :qid |stdinbpl.444:18|
 :skolemid |61|
 :pattern ( (|MultiSet#Select| (|MultiSet#Singleton| r@@3) o@@7))
)))
(assert (forall ((o@@8 T@U) (f T@U) (Heap@@15 T@U) ) (!  (=> (and (and (and (= (type o@@8) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap@@15) (MapType0Type RefType))) (U_2_bool (MapType0Select Heap@@15 o@@8 $allocated))) (U_2_bool (MapType0Select Heap@@15 (MapType0Select Heap@@15 o@@8 f) $allocated)))
 :qid |stdinbpl.31:15|
 :skolemid |0|
 :pattern ( (MapType0Select Heap@@15 o@@8 f))
)))
(assert (forall ((a@@28 T@U) (b@@21 T@U) (o@@9 T@U) ) (! (let ((T@@44 (type o@@9)))
 (=> (and (= (type a@@28) (MultiSetType T@@44)) (= (type b@@21) (MultiSetType T@@44))) (= (|MultiSet#Select| (|MultiSet#Union| a@@28 b@@21) o@@9) (+ (|MultiSet#Select| a@@28 o@@9) (|MultiSet#Select| b@@21 o@@9)))))
 :qid |stdinbpl.462:18|
 :skolemid |67|
 :pattern ( (|MultiSet#Select| (|MultiSet#Union| a@@28 b@@21) o@@9))
 :pattern ( (|MultiSet#Union| a@@28 b@@21) (|MultiSet#Select| a@@28 o@@9) (|MultiSet#Select| b@@21 o@@9))
)))
(assert (forall ((T@@45 T@T) ) (! (= (type (|Set#Empty| T@@45)) (MapType2Type T@@45 boolType))
 :qid |funType:Set#Empty|
 :pattern ( (|Set#Empty| T@@45))
)))
(assert (forall ((o@@10 T@U) ) (! (let ((T@@46 (type o@@10)))
 (not (U_2_bool (MapType2Select (|Set#Empty| T@@46) o@@10))))
 :qid |stdinbpl.328:18|
 :skolemid |23|
 :pattern ( (let ((T@@46 (type o@@10)))
(MapType2Select (|Set#Empty| T@@46) o@@10)))
)))
(assert (forall ((r@@4 T@U) ) (! (let ((T@@47 (type r@@4)))
(= (|MultiSet#Singleton| r@@4) (|MultiSet#UnionOne| (|MultiSet#Empty| T@@47) r@@4)))
 :qid |stdinbpl.447:18|
 :skolemid |63|
 :pattern ( (|MultiSet#Singleton| r@@4))
)))
(assert (forall ((a@@29 Int) (b@@22 Int) ) (! (= (<= a@@29 b@@22) (= (|Math#min| a@@29 b@@22) a@@29))
 :qid |stdinbpl.412:15|
 :skolemid |51|
 :pattern ( (|Math#min| a@@29 b@@22))
)))
(assert (forall ((a@@30 Int) (b@@23 Int) ) (! (= (<= b@@23 a@@30) (= (|Math#min| a@@30 b@@23) b@@23))
 :qid |stdinbpl.413:15|
 :skolemid |52|
 :pattern ( (|Math#min| a@@30 b@@23))
)))
(assert (forall ((s@@2 T@U) ) (! (let ((T@@48 (MapType2TypeInv0 (type s@@2))))
 (=> (= (type s@@2) (MapType2Type T@@48 boolType)) (and (= (= (|Set#Card| s@@2) 0) (= s@@2 (|Set#Empty| T@@48))) (=> (not (= (|Set#Card| s@@2) 0)) (exists ((x@@16 T@U) ) (!  (and (= (type x@@16) T@@48) (U_2_bool (MapType2Select s@@2 x@@16)))
 :qid |stdinbpl.331:33|
 :skolemid |24|
 :no-pattern (type x@@16)
 :no-pattern (U_2_int x@@16)
 :no-pattern (U_2_bool x@@16)
))))))
 :qid |stdinbpl.329:18|
 :skolemid |25|
 :pattern ( (|Set#Card| s@@2))
)))
(assert (forall ((EG_1@@4 T@U) (start_1@@1 T@U) (end_1@@1 T@U) ) (!  (=> (and (and (= (type EG_1@@4) (MapType2Type EdgeDomainTypeType boolType)) (= (type start_1@@1) RefType)) (= (type end_1@@1) RefType)) (= (exists_path_ EG_1@@4 start_1@@1 end_1@@1)  (or (= start_1@@1 end_1@@1) (exists ((w_2@@0 T@U) ) (!  (and (= (type w_2@@0) RefType) (and (U_2_bool (MapType2Select EG_1@@4 (create_edge start_1@@1 w_2@@0))) (exists_path_ EG_1@@4 w_2@@0 end_1@@1)))
 :qid |stdinbpl.606:78|
 :skolemid |89|
 :pattern ( (MapType2Select EG_1@@4 (create_edge start_1@@1 w_2@@0)))
 :pattern ( (exists_path_ EG_1@@4 w_2@@0 end_1@@1))
)))))
 :qid |stdinbpl.604:15|
 :skolemid |90|
 :pattern ( (exists_path EG_1@@4 start_1@@1 end_1@@1))
 :pattern ( (MapType2Select EG_1@@4 (create_edge start_1@@1 end_1@@1)))
)))
(assert (forall ((Heap@@16 T@U) (o@@11 T@U) (f_3 T@U) (v T@U) ) (! (let ((B@@8 (type v)))
(let ((A@@9 (FieldTypeInv0 (type f_3))))
 (=> (and (and (= (type Heap@@16) (MapType0Type RefType)) (= (type o@@11) RefType)) (= (type f_3) (FieldType A@@9 B@@8))) (succHeap Heap@@16 (MapType0Store Heap@@16 o@@11 f_3 v)))))
 :qid |stdinbpl.78:22|
 :skolemid |9|
 :pattern ( (MapType0Store Heap@@16 o@@11 f_3 v))
)))
(assert (forall ((a@@31 T@U) (b@@24 T@U) ) (! (let ((T@@49 (MapType2TypeInv0 (type a@@31))))
 (=> (and (= (type a@@31) (MapType2Type T@@49 boolType)) (= (type b@@24) (MapType2Type T@@49 boolType))) (= (|Set#Subset| a@@31 b@@24) (forall ((o@@12 T@U) ) (!  (=> (and (= (type o@@12) T@@49) (U_2_bool (MapType2Select a@@31 o@@12))) (U_2_bool (MapType2Select b@@24 o@@12)))
 :qid |stdinbpl.391:32|
 :skolemid |46|
 :pattern ( (MapType2Select a@@31 o@@12))
 :pattern ( (MapType2Select b@@24 o@@12))
)))))
 :qid |stdinbpl.390:17|
 :skolemid |47|
 :pattern ( (|Set#Subset| a@@31 b@@24))
)))
(assert (forall ((a@@32 T@U) (x@@17 T@U) ) (! (let ((T@@50 (type x@@17)))
 (=> (and (= (type a@@32) (MapType2Type T@@50 boolType)) (not (U_2_bool (MapType2Select a@@32 x@@17)))) (= (|Set#Card| (|Set#UnionOne| a@@32 x@@17)) (+ (|Set#Card| a@@32) 1))))
 :qid |stdinbpl.347:18|
 :skolemid |33|
 :pattern ( (|Set#Card| (|Set#UnionOne| a@@32 x@@17)))
)))
(assert (forall ((a@@33 T@U) (b@@25 T@U) (o@@13 T@U) ) (! (let ((T@@51 (type o@@13)))
 (=> (and (= (type a@@33) (MultiSetType T@@51)) (= (type b@@25) (MultiSetType T@@51))) (= (|MultiSet#Select| (|MultiSet#Difference| a@@33 b@@25) o@@13) (|Math#clip| (- (|MultiSet#Select| a@@33 o@@13) (|MultiSet#Select| b@@25 o@@13))))))
 :qid |stdinbpl.479:18|
 :skolemid |72|
 :pattern ( (|MultiSet#Select| (|MultiSet#Difference| a@@33 b@@25) o@@13))
)))
(assert (= (type ZeroPMask) (MapType1Type RefType boolType)))
(assert (forall ((o_2@@3 T@U) (f_4@@3 T@U) ) (! (let ((B@@9 (FieldTypeInv1 (type f_4@@3))))
(let ((A@@10 (FieldTypeInv0 (type f_4@@3))))
 (=> (and (= (type o_2@@3) RefType) (= (type f_4@@3) (FieldType A@@10 B@@9))) (not (U_2_bool (MapType1Select ZeroPMask o_2@@3 f_4@@3))))))
 :qid |stdinbpl.112:22|
 :skolemid |14|
 :pattern ( (MapType1Select ZeroPMask o_2@@3 f_4@@3))
)))
(assert (forall ((p@@1 T@U) (v_1@@0 T@U) (q T@U) (w@@0 T@U) (r@@5 T@U) (u T@U) ) (! (let ((C@@3 (FieldTypeInv0 (type r@@5))))
(let ((B@@10 (FieldTypeInv0 (type q))))
(let ((A@@11 (FieldTypeInv0 (type p@@1))))
 (=> (and (and (and (and (and (and (= (type p@@1) (FieldType A@@11 FrameTypeType)) (= (type v_1@@0) FrameTypeType)) (= (type q) (FieldType B@@10 FrameTypeType))) (= (type w@@0) FrameTypeType)) (= (type r@@5) (FieldType C@@3 FrameTypeType))) (= (type u) FrameTypeType)) (and (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r@@5 u))) (InsidePredicate p@@1 v_1@@0 r@@5 u)))))
 :qid |stdinbpl.307:25|
 :skolemid |20|
 :pattern ( (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r@@5 u))
)))
(assert (forall ((a@@34 Int) ) (!  (=> (< a@@34 0) (= (|Math#clip| a@@34) 0))
 :qid |stdinbpl.418:15|
 :skolemid |55|
 :pattern ( (|Math#clip| a@@34))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
(assert (forall ((EG_1@@5 T@U) (U_1 T@U) (M_1 T@U) ) (!  (=> (and (and (and (and (= (type EG_1@@5) (MapType2Type EdgeDomainTypeType boolType)) (= (type U_1) (MapType2Type RefType boolType))) (= (type M_1) (MapType2Type RefType boolType))) (apply_noExit EG_1@@5 U_1 M_1)) (forall ((u_1@@0 T@U) (v_2@@1 T@U) ) (!  (=> (and (and (= (type u_1@@0) RefType) (= (type v_2@@1) RefType)) (and (U_2_bool (MapType2Select M_1 u_1@@0)) (and (U_2_bool (MapType2Select U_1 v_2@@1)) (not (U_2_bool (MapType2Select M_1 v_2@@1)))))) (not (U_2_bool (MapType2Select EG_1@@5 (create_edge u_1@@0 v_2@@1)))))
 :qid |stdinbpl.576:52|
 :skolemid |83|
 :pattern ( (MapType2Select EG_1@@5 (create_edge u_1@@0 v_2@@1)))
 :pattern ( (MapType2Select M_1 u_1@@0) (MapType2Select M_1 v_2@@1))
))) (forall ((u_1_1 T@U) (v_1_1 T@U) ) (!  (=> (and (and (= (type u_1_1) RefType) (= (type v_1_1) RefType)) (and (U_2_bool (MapType2Select M_1 u_1_1)) (and (U_2_bool (MapType2Select U_1 v_1_1)) (not (U_2_bool (MapType2Select M_1 v_1_1)))))) (not (exists_path EG_1@@5 u_1_1 v_1_1)))
 :qid |stdinbpl.579:17|
 :skolemid |84|
 :pattern ( (exists_path EG_1@@5 u_1_1 v_1_1))
 :pattern ( (MapType2Select M_1 u_1_1) (MapType2Select M_1 v_1_1))
)))
 :qid |stdinbpl.574:15|
 :skolemid |85|
 :pattern ( (apply_noExit EG_1@@5 U_1 M_1))
)))
(assert (forall ((a@@35 T@U) (x@@18 T@U) (o@@14 T@U) ) (! (let ((T@@52 (type x@@18)))
 (=> (and (= (type a@@35) (MultiSetType T@@52)) (= (type o@@14) T@@52)) (= (|MultiSet#Select| (|MultiSet#UnionOne| a@@35 x@@18) o@@14) (ite (= x@@18 o@@14) (+ (|MultiSet#Select| a@@35 o@@14) 1) (|MultiSet#Select| a@@35 o@@14)))))
 :qid |stdinbpl.451:18|
 :skolemid |64|
 :pattern ( (|MultiSet#Select| (|MultiSet#UnionOne| a@@35 x@@18) o@@14))
 :pattern ( (|MultiSet#UnionOne| a@@35 x@@18) (|MultiSet#Select| a@@35 o@@14))
)))
(assert (forall ((a@@36 T@U) (b@@26 T@U) ) (! (let ((T@@53 (MultiSetTypeInv0 (type a@@36))))
 (=> (and (= (type a@@36) (MultiSetType T@@53)) (= (type b@@26) (MultiSetType T@@53))) (= (|MultiSet#Equal| a@@36 b@@26) (forall ((o@@15 T@U) ) (!  (=> (= (type o@@15) T@@53) (= (|MultiSet#Select| a@@36 o@@15) (|MultiSet#Select| b@@26 o@@15)))
 :qid |stdinbpl.497:36|
 :skolemid |77|
 :pattern ( (|MultiSet#Select| a@@36 o@@15))
 :pattern ( (|MultiSet#Select| b@@26 o@@15))
)))))
 :qid |stdinbpl.496:17|
 :skolemid |78|
 :pattern ( (|MultiSet#Equal| a@@36 b@@26))
)))
(assert (forall ((a@@37 T@U) (b@@27 T@U) ) (! (let ((T@@54 (MultiSetTypeInv0 (type a@@37))))
 (=> (and (= (type a@@37) (MultiSetType T@@54)) (= (type b@@27) (MultiSetType T@@54))) (= (|MultiSet#Subset| a@@37 b@@27) (forall ((o@@16 T@U) ) (!  (=> (= (type o@@16) T@@54) (<= (|MultiSet#Select| a@@37 o@@16) (|MultiSet#Select| b@@27 o@@16)))
 :qid |stdinbpl.493:37|
 :skolemid |75|
 :pattern ( (|MultiSet#Select| a@@37 o@@16))
 :pattern ( (|MultiSet#Select| b@@27 o@@16))
)))))
 :qid |stdinbpl.492:17|
 :skolemid |76|
 :pattern ( (|MultiSet#Subset| a@@37 b@@27))
)))
(assert (forall ((a@@38 T@U) (b@@28 T@U) (o@@17 T@U) ) (! (let ((T@@55 (type o@@17)))
 (=> (and (= (type a@@38) (MapType2Type T@@55 boolType)) (= (type b@@28) (MapType2Type T@@55 boolType))) (= (U_2_bool (MapType2Select (|Set#Union| a@@38 b@@28) o@@17))  (or (U_2_bool (MapType2Select a@@38 o@@17)) (U_2_bool (MapType2Select b@@28 o@@17))))))
 :qid |stdinbpl.351:18|
 :skolemid |34|
 :pattern ( (MapType2Select (|Set#Union| a@@38 b@@28) o@@17))
)))
(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun neverTriggered9 (T@U) Bool)
(declare-fun g () T@U)
(declare-fun PostHeap@0 () T@U)
(declare-fun QPMask@36 () T@U)
(declare-fun QPMask@35 () T@U)
(declare-fun qpRange9 (T@U) Bool)
(declare-fun invRecv9 (T@U) T@U)
(declare-fun neverTriggered10 (T@U) Bool)
(declare-fun QPMask@37 () T@U)
(declare-fun v_4 () T@U)
(declare-fun marked () T@U)
(declare-fun roots () T@U)
(declare-fun neverTriggered7 (T@U) Bool)
(declare-fun QPMask@38 () T@U)
(declare-fun qpRange7 (T@U) Bool)
(declare-fun invRecv7 (T@U) T@U)
(declare-fun neverTriggered8 (T@U) Bool)
(declare-fun QPMask@39 () T@U)
(declare-fun v_3 () T@U)
(declare-fun n$4 () T@U)
(declare-fun n$3 () T@U)
(declare-fun qpRange6 (T@U) Bool)
(declare-fun invRecv6 (T@U) T@U)
(declare-fun QPMask@34 () T@U)
(declare-fun qpRange5 (T@U) Bool)
(declare-fun invRecv5 (T@U) T@U)
(declare-fun neverTriggered21 (T@U) Bool)
(declare-fun ExhaleHeap@0 () T@U)
(declare-fun QPMask@20 () T@U)
(declare-fun QPMask@15 () T@U)
(declare-fun qpRange21 (T@U) Bool)
(declare-fun invRecv21 (T@U) T@U)
(declare-fun neverTriggered22 (T@U) Bool)
(declare-fun QPMask@21 () T@U)
(declare-fun neverTriggered23 (T@U) Bool)
(declare-fun QPMask@22 () T@U)
(declare-fun qpRange23 (T@U) Bool)
(declare-fun invRecv23 (T@U) T@U)
(declare-fun neverTriggered24 (T@U) Bool)
(declare-fun QPMask@23 () T@U)
(declare-fun neverTriggered19 (T@U) Bool)
(declare-fun QPMask@18 () T@U)
(declare-fun qpRange19 (T@U) Bool)
(declare-fun invRecv19 (T@U) T@U)
(declare-fun neverTriggered20 (T@U) Bool)
(declare-fun QPMask@19 () T@U)
(declare-fun neverTriggered27 (T@U) Bool)
(declare-fun QPMask@26 () T@U)
(declare-fun qpRange27 (T@U) Bool)
(declare-fun invRecv27 (T@U) T@U)
(declare-fun neverTriggered28 (T@U) Bool)
(declare-fun QPMask@27 () T@U)
(declare-fun neverTriggered29 (T@U) Bool)
(declare-fun QPMask@28 () T@U)
(declare-fun qpRange29 (T@U) Bool)
(declare-fun invRecv29 (T@U) T@U)
(declare-fun neverTriggered30 (T@U) Bool)
(declare-fun QPMask@29 () T@U)
(declare-fun neverTriggered25 (T@U) Bool)
(declare-fun QPMask@24 () T@U)
(declare-fun qpRange25 (T@U) Bool)
(declare-fun invRecv25 (T@U) T@U)
(declare-fun neverTriggered26 (T@U) Bool)
(declare-fun QPMask@25 () T@U)
(declare-fun neverTriggered33 (T@U) Bool)
(declare-fun QPMask@30 () T@U)
(declare-fun qpRange33 (T@U) Bool)
(declare-fun invRecv33 (T@U) T@U)
(declare-fun neverTriggered34 (T@U) Bool)
(declare-fun QPMask@31 () T@U)
(declare-fun marked@1 () T@U)
(declare-fun n1_1 () T@U)
(declare-fun n2_1 () T@U)
(declare-fun pending@0 () T@U)
(declare-fun neverTriggered31 (T@U) Bool)
(declare-fun QPMask@32 () T@U)
(declare-fun qpRange31 (T@U) Bool)
(declare-fun invRecv31 (T@U) T@U)
(declare-fun neverTriggered32 (T@U) Bool)
(declare-fun QPMask@33 () T@U)
(declare-fun n_16 () T@U)
(declare-fun x_1@1 () T@U)
(declare-fun neverTriggered17 (T@U) Bool)
(declare-fun QPMask@16 () T@U)
(declare-fun qpRange17 (T@U) Bool)
(declare-fun invRecv17 (T@U) T@U)
(declare-fun neverTriggered18 (T@U) Bool)
(declare-fun QPMask@17 () T@U)
(declare-fun n$8_1 () T@U)
(declare-fun n$7_1 () T@U)
(declare-fun qpRange16 (T@U) Bool)
(declare-fun invRecv16 (T@U) T@U)
(declare-fun QPMask@14 () T@U)
(declare-fun qpRange15 (T@U) Bool)
(declare-fun invRecv15 (T@U) T@U)
(declare-fun QPMask@3 () T@U)
(declare-fun pending@5 () T@U)
(declare-fun marked@2 () T@U)
(declare-fun x_1@2 () T@U)
(declare-fun n$8_5 () T@U)
(declare-fun n$7_5 () T@U)
(declare-fun QPMask@5 () T@U)
(declare-fun neverTriggered37 (T@U) Bool)
(declare-fun QPMask@12 () T@U)
(declare-fun qpRange37 (T@U) Bool)
(declare-fun invRecv37 (T@U) T@U)
(declare-fun neverTriggered38 (T@U) Bool)
(declare-fun QPMask@13 () T@U)
(declare-fun qpRange38 (T@U) Bool)
(declare-fun invRecv38 (T@U) T@U)
(declare-fun pending@3 () T@U)
(declare-fun pending@4 () T@U)
(declare-fun pending@1 () T@U)
(declare-fun pending@2 () T@U)
(declare-fun QPMask@4 () T@U)
(declare-fun qpRange35 (T@U) Bool)
(declare-fun invRecv35 (T@U) T@U)
(declare-fun qpRange36 (T@U) Bool)
(declare-fun invRecv36 (T@U) T@U)
(declare-fun v_6 () T@U)
(declare-fun v_4_1 () T@U)
(declare-fun n$4_2 () T@U)
(declare-fun n$3_2 () T@U)
(declare-fun QPMask@7 () T@U)
(declare-fun neverTriggered11 (T@U) Bool)
(declare-fun QPMask@10 () T@U)
(declare-fun qpRange11 (T@U) Bool)
(declare-fun invRecv11 (T@U) T@U)
(declare-fun neverTriggered12 (T@U) Bool)
(declare-fun QPMask@11 () T@U)
(declare-fun qpRange12 (T@U) Bool)
(declare-fun invRecv12 (T@U) T@U)
(declare-fun neverTriggered41 (T@U) Bool)
(declare-fun QPMask@8 () T@U)
(declare-fun qpRange41 (T@U) Bool)
(declare-fun invRecv41 (T@U) T@U)
(declare-fun neverTriggered42 (T@U) Bool)
(declare-fun QPMask@9 () T@U)
(declare-fun QPMask@6 () T@U)
(declare-fun qpRange39 (T@U) Bool)
(declare-fun invRecv39 (T@U) T@U)
(declare-fun qpRange40 (T@U) Bool)
(declare-fun invRecv40 (T@U) T@U)
(declare-fun marked@0 () T@U)
(declare-fun Heap@@17 () T@U)
(declare-fun x_1@0 () T@U)
(declare-fun n$8 () T@U)
(declare-fun n$7 () T@U)
(declare-fun QPMask@1 () T@U)
(declare-fun neverTriggered13 (T@U) Bool)
(declare-fun QPMask@2 () T@U)
(declare-fun qpRange13 (T@U) Bool)
(declare-fun invRecv13 (T@U) T@U)
(declare-fun neverTriggered14 (T@U) Bool)
(declare-fun qpRange14 (T@U) Bool)
(declare-fun invRecv14 (T@U) T@U)
(declare-fun x_1@@0 () T@U)
(declare-fun n$0 () T@U)
(declare-fun n () T@U)
(declare-fun qpRange4 (T@U) Bool)
(declare-fun invRecv4 (T@U) T@U)
(declare-fun QPMask@0 () T@U)
(declare-fun qpRange3 (T@U) Bool)
(declare-fun invRecv3 (T@U) T@U)
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (= (type g) (MapType2Type RefType boolType)) (= (type n) RefType)) (= (type QPMask@1) (MapType1Type RefType realType))) (= (type n$0) RefType)) (= (type roots) (MapType2Type RefType boolType))) (= (type n$7) RefType)) (= (type Heap@@17) (MapType0Type RefType))) (= (type n$8) RefType)) (= (type ExhaleHeap@0) (MapType0Type RefType))) (= (type QPMask@8) (MapType1Type RefType realType))) (= (type QPMask@7) (MapType1Type RefType realType))) (forall ((arg0@@59 T@U) ) (! (= (type (invRecv41 arg0@@59)) RefType)
 :qid |funType:invRecv41|
 :pattern ( (invRecv41 arg0@@59))
))) (= (type QPMask@9) (MapType1Type RefType realType))) (= (type n$3_2) RefType)) (= (type n$4_2) RefType)) (= (type v_4_1) RefType)) (= (type marked@1) (MapType2Type RefType boolType))) (= (type v_6) RefType)) (= (type QPMask@10) (MapType1Type RefType realType))) (forall ((arg0@@60 T@U) ) (! (= (type (invRecv11 arg0@@60)) RefType)
 :qid |funType:invRecv11|
 :pattern ( (invRecv11 arg0@@60))
))) (= (type QPMask@11) (MapType1Type RefType realType))) (forall ((arg0@@61 T@U) ) (! (= (type (invRecv12 arg0@@61)) RefType)
 :qid |funType:invRecv12|
 :pattern ( (invRecv12 arg0@@61))
))) (= (type pending@0) (MapType2Type RefType boolType))) (= (type x_1@1) RefType)) (= (type QPMask@3) (MapType1Type RefType realType))) (= (type QPMask@6) (MapType1Type RefType realType))) (forall ((arg0@@62 T@U) ) (! (= (type (invRecv39 arg0@@62)) RefType)
 :qid |funType:invRecv39|
 :pattern ( (invRecv39 arg0@@62))
))) (forall ((arg0@@63 T@U) ) (! (= (type (invRecv40 arg0@@63)) RefType)
 :qid |funType:invRecv40|
 :pattern ( (invRecv40 arg0@@63))
))) (= (type n$7_5) RefType)) (= (type n$8_5) RefType)) (= (type pending@5) (MapType2Type RefType boolType))) (= (type marked@2) (MapType2Type RefType boolType))) (= (type x_1@2) RefType)) (= (type QPMask@5) (MapType1Type RefType realType))) (= (type QPMask@12) (MapType1Type RefType realType))) (forall ((arg0@@64 T@U) ) (! (= (type (invRecv37 arg0@@64)) RefType)
 :qid |funType:invRecv37|
 :pattern ( (invRecv37 arg0@@64))
))) (= (type QPMask@13) (MapType1Type RefType realType))) (forall ((arg0@@65 T@U) ) (! (= (type (invRecv38 arg0@@65)) RefType)
 :qid |funType:invRecv38|
 :pattern ( (invRecv38 arg0@@65))
))) (= (type pending@4) (MapType2Type RefType boolType))) (= (type pending@3) (MapType2Type RefType boolType))) (= (type pending@2) (MapType2Type RefType boolType))) (= (type pending@1) (MapType2Type RefType boolType))) (= (type QPMask@4) (MapType1Type RefType realType))) (forall ((arg0@@66 T@U) ) (! (= (type (invRecv35 arg0@@66)) RefType)
 :qid |funType:invRecv35|
 :pattern ( (invRecv35 arg0@@66))
))) (forall ((arg0@@67 T@U) ) (! (= (type (invRecv36 arg0@@67)) RefType)
 :qid |funType:invRecv36|
 :pattern ( (invRecv36 arg0@@67))
))) (= (type n$7_1) RefType)) (= (type QPMask@15) (MapType1Type RefType realType))) (= (type n$8_1) RefType)) (= (type QPMask@16) (MapType1Type RefType realType))) (forall ((arg0@@68 T@U) ) (! (= (type (invRecv17 arg0@@68)) RefType)
 :qid |funType:invRecv17|
 :pattern ( (invRecv17 arg0@@68))
))) (= (type QPMask@17) (MapType1Type RefType realType))) (= (type n_16) RefType)) (= (type QPMask@32) (MapType1Type RefType realType))) (forall ((arg0@@69 T@U) ) (! (= (type (invRecv31 arg0@@69)) RefType)
 :qid |funType:invRecv31|
 :pattern ( (invRecv31 arg0@@69))
))) (= (type QPMask@33) (MapType1Type RefType realType))) (= (type n1_1) RefType)) (= (type n2_1) RefType)) (= (type QPMask@30) (MapType1Type RefType realType))) (forall ((arg0@@70 T@U) ) (! (= (type (invRecv33 arg0@@70)) RefType)
 :qid |funType:invRecv33|
 :pattern ( (invRecv33 arg0@@70))
))) (= (type QPMask@31) (MapType1Type RefType realType))) (= (type QPMask@24) (MapType1Type RefType realType))) (forall ((arg0@@71 T@U) ) (! (= (type (invRecv25 arg0@@71)) RefType)
 :qid |funType:invRecv25|
 :pattern ( (invRecv25 arg0@@71))
))) (= (type QPMask@25) (MapType1Type RefType realType))) (= (type QPMask@28) (MapType1Type RefType realType))) (forall ((arg0@@72 T@U) ) (! (= (type (invRecv29 arg0@@72)) RefType)
 :qid |funType:invRecv29|
 :pattern ( (invRecv29 arg0@@72))
))) (= (type QPMask@29) (MapType1Type RefType realType))) (= (type QPMask@26) (MapType1Type RefType realType))) (forall ((arg0@@73 T@U) ) (! (= (type (invRecv27 arg0@@73)) RefType)
 :qid |funType:invRecv27|
 :pattern ( (invRecv27 arg0@@73))
))) (= (type QPMask@27) (MapType1Type RefType realType))) (= (type QPMask@18) (MapType1Type RefType realType))) (forall ((arg0@@74 T@U) ) (! (= (type (invRecv19 arg0@@74)) RefType)
 :qid |funType:invRecv19|
 :pattern ( (invRecv19 arg0@@74))
))) (= (type QPMask@19) (MapType1Type RefType realType))) (= (type QPMask@22) (MapType1Type RefType realType))) (forall ((arg0@@75 T@U) ) (! (= (type (invRecv23 arg0@@75)) RefType)
 :qid |funType:invRecv23|
 :pattern ( (invRecv23 arg0@@75))
))) (= (type QPMask@23) (MapType1Type RefType realType))) (= (type QPMask@20) (MapType1Type RefType realType))) (forall ((arg0@@76 T@U) ) (! (= (type (invRecv21 arg0@@76)) RefType)
 :qid |funType:invRecv21|
 :pattern ( (invRecv21 arg0@@76))
))) (= (type QPMask@21) (MapType1Type RefType realType))) (forall ((arg0@@77 T@U) ) (! (= (type (invRecv16 arg0@@77)) RefType)
 :qid |funType:invRecv16|
 :pattern ( (invRecv16 arg0@@77))
))) (= (type QPMask@14) (MapType1Type RefType realType))) (forall ((arg0@@78 T@U) ) (! (= (type (invRecv15 arg0@@78)) RefType)
 :qid |funType:invRecv15|
 :pattern ( (invRecv15 arg0@@78))
))) (= (type marked@0) (MapType2Type RefType boolType))) (= (type x_1@0) RefType)) (= (type QPMask@2) (MapType1Type RefType realType))) (forall ((arg0@@79 T@U) ) (! (= (type (invRecv13 arg0@@79)) RefType)
 :qid |funType:invRecv13|
 :pattern ( (invRecv13 arg0@@79))
))) (forall ((arg0@@80 T@U) ) (! (= (type (invRecv14 arg0@@80)) RefType)
 :qid |funType:invRecv14|
 :pattern ( (invRecv14 arg0@@80))
))) (= (type x_1@@0) RefType)) (= (type n$3) RefType)) (= (type QPMask@35) (MapType1Type RefType realType))) (= (type n$4) RefType)) (= (type v_3) RefType)) (= (type marked) (MapType2Type RefType boolType))) (= (type PostHeap@0) (MapType0Type RefType))) (= (type QPMask@38) (MapType1Type RefType realType))) (forall ((arg0@@81 T@U) ) (! (= (type (invRecv7 arg0@@81)) RefType)
 :qid |funType:invRecv7|
 :pattern ( (invRecv7 arg0@@81))
))) (= (type QPMask@39) (MapType1Type RefType realType))) (= (type v_4) RefType)) (= (type QPMask@36) (MapType1Type RefType realType))) (forall ((arg0@@82 T@U) ) (! (= (type (invRecv9 arg0@@82)) RefType)
 :qid |funType:invRecv9|
 :pattern ( (invRecv9 arg0@@82))
))) (= (type QPMask@37) (MapType1Type RefType realType))) (forall ((arg0@@83 T@U) ) (! (= (type (invRecv6 arg0@@83)) RefType)
 :qid |funType:invRecv6|
 :pattern ( (invRecv6 arg0@@83))
))) (= (type QPMask@34) (MapType1Type RefType realType))) (forall ((arg0@@84 T@U) ) (! (= (type (invRecv5 arg0@@84)) RefType)
 :qid |funType:invRecv5|
 :pattern ( (invRecv5 arg0@@84))
))) (forall ((arg0@@85 T@U) ) (! (= (type (invRecv4 arg0@@85)) RefType)
 :qid |funType:invRecv4|
 :pattern ( (invRecv4 arg0@@85))
))) (= (type QPMask@0) (MapType1Type RefType realType))) (forall ((arg0@@86 T@U) ) (! (= (type (invRecv3 arg0@@86)) RefType)
 :qid |funType:invRecv3|
 :pattern ( (invRecv3 arg0@@86))
))))
(set-info :boogie-vc-id mark)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 313) (let ((anon192_Then_correct  (and (=> (= (ControlFlow 0 293) (- 0 296)) (forall ((n_3 T@U) (n_3_1 T@U) ) (!  (=> (and (= (type n_3) RefType) (= (type n_3_1) RefType)) (=> (and (and (and (and (not (= n_3 n_3_1)) (U_2_bool (MapType2Select g n_3))) (U_2_bool (MapType2Select g n_3_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_3 n_3_1))))
 :qid |stdinbpl.1267:25|
 :skolemid |159|
 :pattern ( (neverTriggered9 n_3) (neverTriggered9 n_3_1))
))) (=> (forall ((n_3@@0 T@U) (n_3_1@@0 T@U) ) (!  (=> (and (= (type n_3@@0) RefType) (= (type n_3_1@@0) RefType)) (=> (and (and (and (and (not (= n_3@@0 n_3_1@@0)) (U_2_bool (MapType2Select g n_3@@0))) (U_2_bool (MapType2Select g n_3_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_3@@0 n_3_1@@0))))
 :qid |stdinbpl.1267:25|
 :skolemid |159|
 :pattern ( (neverTriggered9 n_3@@0) (neverTriggered9 n_3_1@@0))
)) (and (=> (= (ControlFlow 0 293) (- 0 295)) (forall ((n_3@@1 T@U) ) (!  (=> (and (= (type n_3@@1) RefType) (U_2_bool (MapType2Select g n_3@@1))) (>= (U_2_real (MapType1Select QPMask@35 n_3@@1 car)) FullPerm))
 :qid |stdinbpl.1274:25|
 :skolemid |160|
 :pattern ( (MapType0Select PostHeap@0 n_3@@1 car))
 :pattern ( (MapType1Select QPMask@36 n_3@@1 car))
 :pattern ( (MapType0Select PostHeap@0 n_3@@1 car))
))) (=> (forall ((n_3@@2 T@U) ) (!  (=> (and (= (type n_3@@2) RefType) (U_2_bool (MapType2Select g n_3@@2))) (>= (U_2_real (MapType1Select QPMask@35 n_3@@2 car)) FullPerm))
 :qid |stdinbpl.1274:25|
 :skolemid |160|
 :pattern ( (MapType0Select PostHeap@0 n_3@@2 car))
 :pattern ( (MapType1Select QPMask@36 n_3@@2 car))
 :pattern ( (MapType0Select PostHeap@0 n_3@@2 car))
)) (=> (and (and (forall ((n_3@@3 T@U) ) (!  (=> (= (type n_3@@3) RefType) (=> (and (U_2_bool (MapType2Select g n_3@@3)) (< NoPerm FullPerm)) (and (qpRange9 n_3@@3) (= (invRecv9 n_3@@3) n_3@@3))))
 :qid |stdinbpl.1280:30|
 :skolemid |161|
 :pattern ( (MapType0Select PostHeap@0 n_3@@3 car))
 :pattern ( (MapType1Select QPMask@36 n_3@@3 car))
 :pattern ( (MapType0Select PostHeap@0 n_3@@3 car))
)) (forall ((o_3 T@U) ) (!  (=> (= (type o_3) RefType) (=> (and (U_2_bool (MapType2Select g (invRecv9 o_3))) (and (< NoPerm FullPerm) (qpRange9 o_3))) (= (invRecv9 o_3) o_3)))
 :qid |stdinbpl.1284:30|
 :skolemid |162|
 :pattern ( (invRecv9 o_3))
))) (and (forall ((o_3@@0 T@U) ) (!  (=> (= (type o_3@@0) RefType) (and (=> (and (U_2_bool (MapType2Select g (invRecv9 o_3@@0))) (and (< NoPerm FullPerm) (qpRange9 o_3@@0))) (and (= (invRecv9 o_3@@0) o_3@@0) (= (U_2_real (MapType1Select QPMask@36 o_3@@0 car)) (- (U_2_real (MapType1Select QPMask@35 o_3@@0 car)) FullPerm)))) (=> (not (and (U_2_bool (MapType2Select g (invRecv9 o_3@@0))) (and (< NoPerm FullPerm) (qpRange9 o_3@@0)))) (= (U_2_real (MapType1Select QPMask@36 o_3@@0 car)) (U_2_real (MapType1Select QPMask@35 o_3@@0 car))))))
 :qid |stdinbpl.1290:30|
 :skolemid |163|
 :pattern ( (MapType1Select QPMask@36 o_3@@0 car))
)) (forall ((o_3@@1 T@U) (f_5 T@U) ) (! (let ((B@@11 (FieldTypeInv1 (type f_5))))
(let ((A@@12 (FieldTypeInv0 (type f_5))))
 (=> (and (and (= (type o_3@@1) RefType) (= (type f_5) (FieldType A@@12 B@@11))) (not (= f_5 car))) (= (U_2_real (MapType1Select QPMask@35 o_3@@1 f_5)) (U_2_real (MapType1Select QPMask@36 o_3@@1 f_5))))))
 :qid |stdinbpl.1296:37|
 :skolemid |164|
 :pattern ( (MapType1Select QPMask@36 o_3@@1 f_5))
)))) (and (=> (= (ControlFlow 0 293) (- 0 294)) (forall ((n$0_3 T@U) (n$0_3_1 T@U) ) (!  (=> (and (= (type n$0_3) RefType) (= (type n$0_3_1) RefType)) (=> (and (and (and (and (not (= n$0_3 n$0_3_1)) (U_2_bool (MapType2Select g n$0_3))) (U_2_bool (MapType2Select g n$0_3_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$0_3 n$0_3_1))))
 :qid |stdinbpl.1308:25|
 :skolemid |165|
 :pattern ( (neverTriggered10 n$0_3) (neverTriggered10 n$0_3_1))
))) (=> (forall ((n$0_3@@0 T@U) (n$0_3_1@@0 T@U) ) (!  (=> (and (= (type n$0_3@@0) RefType) (= (type n$0_3_1@@0) RefType)) (=> (and (and (and (and (not (= n$0_3@@0 n$0_3_1@@0)) (U_2_bool (MapType2Select g n$0_3@@0))) (U_2_bool (MapType2Select g n$0_3_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$0_3@@0 n$0_3_1@@0))))
 :qid |stdinbpl.1308:25|
 :skolemid |165|
 :pattern ( (neverTriggered10 n$0_3@@0) (neverTriggered10 n$0_3_1@@0))
)) (=> (= (ControlFlow 0 293) (- 0 292)) (forall ((n$0_3@@1 T@U) ) (!  (=> (and (= (type n$0_3@@1) RefType) (U_2_bool (MapType2Select g n$0_3@@1))) (>= (U_2_real (MapType1Select QPMask@36 n$0_3@@1 cdr)) FullPerm))
 :qid |stdinbpl.1315:25|
 :skolemid |166|
 :pattern ( (MapType0Select PostHeap@0 n$0_3@@1 cdr))
 :pattern ( (MapType1Select QPMask@37 n$0_3@@1 cdr))
 :pattern ( (MapType0Select PostHeap@0 n$0_3@@1 cdr))
))))))))))))
(let ((anon35_correct true))
(let ((anon191_Then_correct  (=> (U_2_bool (MapType2Select g v_4)) (and (=> (= (ControlFlow 0 297) 293) anon192_Then_correct) (=> (= (ControlFlow 0 297) 290) anon35_correct)))))
(let ((anon191_Else_correct  (=> (and (not (U_2_bool (MapType2Select g v_4))) (= (ControlFlow 0 291) 290)) anon35_correct)))
(let ((anon190_Else_correct true))
(let ((anon186_Else_correct  (=> (forall ((v_1_1@@0 T@U) ) (!  (=> (and (and (= (type v_1_1@@0) RefType) (U_2_bool (MapType2Select g v_1_1@@0))) (U_2_bool (MapType2Select marked v_1_1@@0))) (exists_spath ($$ PostHeap@0 g) roots v_1_1@@0))
 :qid |stdinbpl.1246:20|
 :skolemid |158|
 :pattern ( (MapType2Select marked v_1_1@@0))
 :pattern ( (exists_spath (|$$#frame| (CombineFrames (FrameFragment (int_2_U (|$$#condqp1| PostHeap@0 g))) (FrameFragment (int_2_U (|$$#condqp2| PostHeap@0 g)))) g) roots v_1_1@@0))
)) (=> (and (state PostHeap@0 QPMask@35) (state PostHeap@0 QPMask@35)) (and (and (=> (= (ControlFlow 0 298) 289) anon190_Else_correct) (=> (= (ControlFlow 0 298) 297) anon191_Then_correct)) (=> (= (ControlFlow 0 298) 291) anon191_Else_correct))))))
(let ((anon189_Then_correct  (and (=> (= (ControlFlow 0 283) (- 0 286)) (forall ((n_2 T@U) (n_2_1 T@U) ) (!  (=> (and (= (type n_2) RefType) (= (type n_2_1) RefType)) (=> (and (and (and (and (not (= n_2 n_2_1)) (U_2_bool (MapType2Select g n_2))) (U_2_bool (MapType2Select g n_2_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_2 n_2_1))))
 :qid |stdinbpl.1160:27|
 :skolemid |146|
 :pattern ( (neverTriggered7 n_2) (neverTriggered7 n_2_1))
))) (=> (forall ((n_2@@0 T@U) (n_2_1@@0 T@U) ) (!  (=> (and (= (type n_2@@0) RefType) (= (type n_2_1@@0) RefType)) (=> (and (and (and (and (not (= n_2@@0 n_2_1@@0)) (U_2_bool (MapType2Select g n_2@@0))) (U_2_bool (MapType2Select g n_2_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_2@@0 n_2_1@@0))))
 :qid |stdinbpl.1160:27|
 :skolemid |146|
 :pattern ( (neverTriggered7 n_2@@0) (neverTriggered7 n_2_1@@0))
)) (and (=> (= (ControlFlow 0 283) (- 0 285)) (forall ((n_2@@1 T@U) ) (!  (=> (and (= (type n_2@@1) RefType) (U_2_bool (MapType2Select g n_2@@1))) (>= (U_2_real (MapType1Select QPMask@35 n_2@@1 car)) FullPerm))
 :qid |stdinbpl.1167:27|
 :skolemid |147|
 :pattern ( (MapType0Select PostHeap@0 n_2@@1 car))
 :pattern ( (MapType1Select QPMask@38 n_2@@1 car))
 :pattern ( (MapType0Select PostHeap@0 n_2@@1 car))
))) (=> (forall ((n_2@@2 T@U) ) (!  (=> (and (= (type n_2@@2) RefType) (U_2_bool (MapType2Select g n_2@@2))) (>= (U_2_real (MapType1Select QPMask@35 n_2@@2 car)) FullPerm))
 :qid |stdinbpl.1167:27|
 :skolemid |147|
 :pattern ( (MapType0Select PostHeap@0 n_2@@2 car))
 :pattern ( (MapType1Select QPMask@38 n_2@@2 car))
 :pattern ( (MapType0Select PostHeap@0 n_2@@2 car))
)) (=> (and (and (forall ((n_2@@3 T@U) ) (!  (=> (= (type n_2@@3) RefType) (=> (and (U_2_bool (MapType2Select g n_2@@3)) (< NoPerm FullPerm)) (and (qpRange7 n_2@@3) (= (invRecv7 n_2@@3) n_2@@3))))
 :qid |stdinbpl.1173:32|
 :skolemid |148|
 :pattern ( (MapType0Select PostHeap@0 n_2@@3 car))
 :pattern ( (MapType1Select QPMask@38 n_2@@3 car))
 :pattern ( (MapType0Select PostHeap@0 n_2@@3 car))
)) (forall ((o_3@@2 T@U) ) (!  (=> (= (type o_3@@2) RefType) (=> (and (U_2_bool (MapType2Select g (invRecv7 o_3@@2))) (and (< NoPerm FullPerm) (qpRange7 o_3@@2))) (= (invRecv7 o_3@@2) o_3@@2)))
 :qid |stdinbpl.1177:32|
 :skolemid |149|
 :pattern ( (invRecv7 o_3@@2))
))) (and (forall ((o_3@@3 T@U) ) (!  (=> (= (type o_3@@3) RefType) (and (=> (and (U_2_bool (MapType2Select g (invRecv7 o_3@@3))) (and (< NoPerm FullPerm) (qpRange7 o_3@@3))) (and (= (invRecv7 o_3@@3) o_3@@3) (= (U_2_real (MapType1Select QPMask@38 o_3@@3 car)) (- (U_2_real (MapType1Select QPMask@35 o_3@@3 car)) FullPerm)))) (=> (not (and (U_2_bool (MapType2Select g (invRecv7 o_3@@3))) (and (< NoPerm FullPerm) (qpRange7 o_3@@3)))) (= (U_2_real (MapType1Select QPMask@38 o_3@@3 car)) (U_2_real (MapType1Select QPMask@35 o_3@@3 car))))))
 :qid |stdinbpl.1183:32|
 :skolemid |150|
 :pattern ( (MapType1Select QPMask@38 o_3@@3 car))
)) (forall ((o_3@@4 T@U) (f_5@@0 T@U) ) (! (let ((B@@12 (FieldTypeInv1 (type f_5@@0))))
(let ((A@@13 (FieldTypeInv0 (type f_5@@0))))
 (=> (and (and (= (type o_3@@4) RefType) (= (type f_5@@0) (FieldType A@@13 B@@12))) (not (= f_5@@0 car))) (= (U_2_real (MapType1Select QPMask@35 o_3@@4 f_5@@0)) (U_2_real (MapType1Select QPMask@38 o_3@@4 f_5@@0))))))
 :qid |stdinbpl.1189:39|
 :skolemid |151|
 :pattern ( (MapType1Select QPMask@38 o_3@@4 f_5@@0))
)))) (and (=> (= (ControlFlow 0 283) (- 0 284)) (forall ((n$0_2 T@U) (n$0_2_1 T@U) ) (!  (=> (and (= (type n$0_2) RefType) (= (type n$0_2_1) RefType)) (=> (and (and (and (and (not (= n$0_2 n$0_2_1)) (U_2_bool (MapType2Select g n$0_2))) (U_2_bool (MapType2Select g n$0_2_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$0_2 n$0_2_1))))
 :qid |stdinbpl.1201:27|
 :skolemid |152|
 :pattern ( (neverTriggered8 n$0_2) (neverTriggered8 n$0_2_1))
))) (=> (forall ((n$0_2@@0 T@U) (n$0_2_1@@0 T@U) ) (!  (=> (and (= (type n$0_2@@0) RefType) (= (type n$0_2_1@@0) RefType)) (=> (and (and (and (and (not (= n$0_2@@0 n$0_2_1@@0)) (U_2_bool (MapType2Select g n$0_2@@0))) (U_2_bool (MapType2Select g n$0_2_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$0_2@@0 n$0_2_1@@0))))
 :qid |stdinbpl.1201:27|
 :skolemid |152|
 :pattern ( (neverTriggered8 n$0_2@@0) (neverTriggered8 n$0_2_1@@0))
)) (=> (= (ControlFlow 0 283) (- 0 282)) (forall ((n$0_2@@1 T@U) ) (!  (=> (and (= (type n$0_2@@1) RefType) (U_2_bool (MapType2Select g n$0_2@@1))) (>= (U_2_real (MapType1Select QPMask@38 n$0_2@@1 cdr)) FullPerm))
 :qid |stdinbpl.1208:27|
 :skolemid |153|
 :pattern ( (MapType0Select PostHeap@0 n$0_2@@1 cdr))
 :pattern ( (MapType1Select QPMask@39 n$0_2@@1 cdr))
 :pattern ( (MapType0Select PostHeap@0 n$0_2@@1 cdr))
))))))))))))
(let ((anon30_correct true))
(let ((anon188_Then_correct  (=> (U_2_bool (MapType2Select marked v_3)) (and (=> (= (ControlFlow 0 287) 283) anon189_Then_correct) (=> (= (ControlFlow 0 287) 279) anon30_correct)))))
(let ((anon188_Else_correct  (=> (and (not (U_2_bool (MapType2Select marked v_3))) (= (ControlFlow 0 281) 279)) anon30_correct)))
(let ((anon187_Then_correct  (=> (U_2_bool (MapType2Select g v_3)) (and (=> (= (ControlFlow 0 288) 287) anon188_Then_correct) (=> (= (ControlFlow 0 288) 281) anon188_Else_correct)))))
(let ((anon187_Else_correct  (=> (and (not (U_2_bool (MapType2Select g v_3))) (= (ControlFlow 0 280) 279)) anon30_correct)))
(let ((anon184_Else_correct  (=> (forall ((n$4_1 T@U) ) (!  (=> (and (= (type n$4_1) RefType) (U_2_bool (MapType2Select g n$4_1))) (U_2_bool (MapType2Select g (MapType0Select PostHeap@0 n$4_1 cdr))))
 :qid |stdinbpl.1138:20|
 :skolemid |145|
 :pattern ( (MapType2Select g (MapType0Select PostHeap@0 n$4_1 cdr)))
 :pattern ( (MapType2Select g n$4_1) (MapType0Select PostHeap@0 n$4_1 cdr))
)) (=> (and (state PostHeap@0 QPMask@35) (state PostHeap@0 QPMask@35)) (and (and (=> (= (ControlFlow 0 299) 298) anon186_Else_correct) (=> (= (ControlFlow 0 299) 288) anon187_Then_correct)) (=> (= (ControlFlow 0 299) 280) anon187_Else_correct))))))
(let ((anon24_correct true))
(let ((anon185_Else_correct  (=> (and (not (U_2_bool (MapType2Select g n$4))) (= (ControlFlow 0 278) 275)) anon24_correct)))
(let ((anon185_Then_correct  (=> (U_2_bool (MapType2Select g n$4)) (and (=> (= (ControlFlow 0 276) (- 0 277)) (HasDirectPerm QPMask@35 n$4 cdr)) (=> (HasDirectPerm QPMask@35 n$4 cdr) (=> (= (ControlFlow 0 276) 275) anon24_correct))))))
(let ((anon182_Else_correct  (=> (forall ((n$3_1 T@U) ) (!  (=> (and (= (type n$3_1) RefType) (U_2_bool (MapType2Select g n$3_1))) (U_2_bool (MapType2Select g (MapType0Select PostHeap@0 n$3_1 car))))
 :qid |stdinbpl.1125:20|
 :skolemid |144|
 :pattern ( (MapType2Select g (MapType0Select PostHeap@0 n$3_1 car)))
 :pattern ( (MapType2Select g n$3_1) (MapType0Select PostHeap@0 n$3_1 car))
)) (and (and (=> (= (ControlFlow 0 300) 299) anon184_Else_correct) (=> (= (ControlFlow 0 300) 276) anon185_Then_correct)) (=> (= (ControlFlow 0 300) 278) anon185_Else_correct)))))
(let ((anon20_correct true))
(let ((anon183_Else_correct  (=> (and (not (U_2_bool (MapType2Select g n$3))) (= (ControlFlow 0 274) 271)) anon20_correct)))
(let ((anon183_Then_correct  (=> (U_2_bool (MapType2Select g n$3)) (and (=> (= (ControlFlow 0 272) (- 0 273)) (HasDirectPerm QPMask@35 n$3 car)) (=> (HasDirectPerm QPMask@35 n$3 car) (=> (= (ControlFlow 0 272) 271) anon20_correct))))))
(let ((anon181_Else_correct  (and (=> (= (ControlFlow 0 301) (- 0 302)) (forall ((n$6_1 T@U) (n$6_1_1 T@U) ) (!  (=> (and (= (type n$6_1) RefType) (= (type n$6_1_1) RefType)) (=> (and (and (and (and (not (= n$6_1 n$6_1_1)) (U_2_bool (MapType2Select g n$6_1))) (U_2_bool (MapType2Select g n$6_1_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$6_1 n$6_1_1))))
 :qid |stdinbpl.1084:15|
 :skolemid |138|
 :no-pattern (type n$6_1)
 :no-pattern (type n$6_1_1)
 :no-pattern (U_2_int n$6_1)
 :no-pattern (U_2_bool n$6_1)
 :no-pattern (U_2_int n$6_1_1)
 :no-pattern (U_2_bool n$6_1_1)
))) (=> (forall ((n$6_1@@0 T@U) (n$6_1_1@@0 T@U) ) (!  (=> (and (= (type n$6_1@@0) RefType) (= (type n$6_1_1@@0) RefType)) (=> (and (and (and (and (not (= n$6_1@@0 n$6_1_1@@0)) (U_2_bool (MapType2Select g n$6_1@@0))) (U_2_bool (MapType2Select g n$6_1_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$6_1@@0 n$6_1_1@@0))))
 :qid |stdinbpl.1084:15|
 :skolemid |138|
 :no-pattern (type n$6_1@@0)
 :no-pattern (type n$6_1_1@@0)
 :no-pattern (U_2_int n$6_1@@0)
 :no-pattern (U_2_bool n$6_1@@0)
 :no-pattern (U_2_int n$6_1_1@@0)
 :no-pattern (U_2_bool n$6_1_1@@0)
)) (=> (and (forall ((n$6_1@@1 T@U) ) (!  (=> (= (type n$6_1@@1) RefType) (=> (and (U_2_bool (MapType2Select g n$6_1@@1)) (< NoPerm FullPerm)) (and (qpRange6 n$6_1@@1) (= (invRecv6 n$6_1@@1) n$6_1@@1))))
 :qid |stdinbpl.1090:22|
 :skolemid |139|
 :pattern ( (MapType0Select PostHeap@0 n$6_1@@1 cdr))
 :pattern ( (MapType1Select QPMask@35 n$6_1@@1 cdr))
 :pattern ( (MapType0Select PostHeap@0 n$6_1@@1 cdr))
)) (forall ((o_3@@5 T@U) ) (!  (=> (= (type o_3@@5) RefType) (=> (and (and (U_2_bool (MapType2Select g (invRecv6 o_3@@5))) (< NoPerm FullPerm)) (qpRange6 o_3@@5)) (= (invRecv6 o_3@@5) o_3@@5)))
 :qid |stdinbpl.1094:22|
 :skolemid |140|
 :pattern ( (invRecv6 o_3@@5))
))) (=> (and (and (forall ((n$6_1@@2 T@U) ) (!  (=> (and (= (type n$6_1@@2) RefType) (U_2_bool (MapType2Select g n$6_1@@2))) (not (= n$6_1@@2 null)))
 :qid |stdinbpl.1100:22|
 :skolemid |141|
 :pattern ( (MapType0Select PostHeap@0 n$6_1@@2 cdr))
 :pattern ( (MapType1Select QPMask@35 n$6_1@@2 cdr))
 :pattern ( (MapType0Select PostHeap@0 n$6_1@@2 cdr))
)) (forall ((o_3@@6 T@U) ) (!  (=> (= (type o_3@@6) RefType) (and (=> (and (and (U_2_bool (MapType2Select g (invRecv6 o_3@@6))) (< NoPerm FullPerm)) (qpRange6 o_3@@6)) (and (=> (< NoPerm FullPerm) (= (invRecv6 o_3@@6) o_3@@6)) (= (U_2_real (MapType1Select QPMask@35 o_3@@6 cdr)) (+ (U_2_real (MapType1Select QPMask@34 o_3@@6 cdr)) FullPerm)))) (=> (not (and (and (U_2_bool (MapType2Select g (invRecv6 o_3@@6))) (< NoPerm FullPerm)) (qpRange6 o_3@@6))) (= (U_2_real (MapType1Select QPMask@35 o_3@@6 cdr)) (U_2_real (MapType1Select QPMask@34 o_3@@6 cdr))))))
 :qid |stdinbpl.1106:22|
 :skolemid |142|
 :pattern ( (MapType1Select QPMask@35 o_3@@6 cdr))
))) (and (forall ((o_3@@7 T@U) (f_5@@1 T@U) ) (! (let ((B@@13 (FieldTypeInv1 (type f_5@@1))))
(let ((A@@14 (FieldTypeInv0 (type f_5@@1))))
 (=> (and (and (= (type o_3@@7) RefType) (= (type f_5@@1) (FieldType A@@14 B@@13))) (not (= f_5@@1 cdr))) (= (U_2_real (MapType1Select QPMask@34 o_3@@7 f_5@@1)) (U_2_real (MapType1Select QPMask@35 o_3@@7 f_5@@1))))))
 :qid |stdinbpl.1110:29|
 :skolemid |143|
 :pattern ( (MapType1Select QPMask@34 o_3@@7 f_5@@1))
 :pattern ( (MapType1Select QPMask@35 o_3@@7 f_5@@1))
)) (state PostHeap@0 QPMask@35))) (and (and (=> (= (ControlFlow 0 301) 300) anon182_Else_correct) (=> (= (ControlFlow 0 301) 272) anon183_Then_correct)) (=> (= (ControlFlow 0 301) 274) anon183_Else_correct))))))))
(let ((anon181_Then_correct true))
(let ((anon180_Else_correct  (and (=> (= (ControlFlow 0 303) (- 0 304)) (forall ((n$5_1 T@U) (n$5_1_1 T@U) ) (!  (=> (and (= (type n$5_1) RefType) (= (type n$5_1_1) RefType)) (=> (and (and (and (and (not (= n$5_1 n$5_1_1)) (U_2_bool (MapType2Select g n$5_1))) (U_2_bool (MapType2Select g n$5_1_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$5_1 n$5_1_1))))
 :qid |stdinbpl.1045:15|
 :skolemid |132|
 :no-pattern (type n$5_1)
 :no-pattern (type n$5_1_1)
 :no-pattern (U_2_int n$5_1)
 :no-pattern (U_2_bool n$5_1)
 :no-pattern (U_2_int n$5_1_1)
 :no-pattern (U_2_bool n$5_1_1)
))) (=> (forall ((n$5_1@@0 T@U) (n$5_1_1@@0 T@U) ) (!  (=> (and (= (type n$5_1@@0) RefType) (= (type n$5_1_1@@0) RefType)) (=> (and (and (and (and (not (= n$5_1@@0 n$5_1_1@@0)) (U_2_bool (MapType2Select g n$5_1@@0))) (U_2_bool (MapType2Select g n$5_1_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$5_1@@0 n$5_1_1@@0))))
 :qid |stdinbpl.1045:15|
 :skolemid |132|
 :no-pattern (type n$5_1@@0)
 :no-pattern (type n$5_1_1@@0)
 :no-pattern (U_2_int n$5_1@@0)
 :no-pattern (U_2_bool n$5_1@@0)
 :no-pattern (U_2_int n$5_1_1@@0)
 :no-pattern (U_2_bool n$5_1_1@@0)
)) (=> (and (forall ((n$5_1@@1 T@U) ) (!  (=> (= (type n$5_1@@1) RefType) (=> (and (U_2_bool (MapType2Select g n$5_1@@1)) (< NoPerm FullPerm)) (and (qpRange5 n$5_1@@1) (= (invRecv5 n$5_1@@1) n$5_1@@1))))
 :qid |stdinbpl.1051:22|
 :skolemid |133|
 :pattern ( (MapType0Select PostHeap@0 n$5_1@@1 car))
 :pattern ( (MapType1Select QPMask@34 n$5_1@@1 car))
 :pattern ( (MapType0Select PostHeap@0 n$5_1@@1 car))
)) (forall ((o_3@@8 T@U) ) (!  (=> (= (type o_3@@8) RefType) (=> (and (and (U_2_bool (MapType2Select g (invRecv5 o_3@@8))) (< NoPerm FullPerm)) (qpRange5 o_3@@8)) (= (invRecv5 o_3@@8) o_3@@8)))
 :qid |stdinbpl.1055:22|
 :skolemid |134|
 :pattern ( (invRecv5 o_3@@8))
))) (=> (and (and (forall ((n$5_1@@2 T@U) ) (!  (=> (and (= (type n$5_1@@2) RefType) (U_2_bool (MapType2Select g n$5_1@@2))) (not (= n$5_1@@2 null)))
 :qid |stdinbpl.1061:22|
 :skolemid |135|
 :pattern ( (MapType0Select PostHeap@0 n$5_1@@2 car))
 :pattern ( (MapType1Select QPMask@34 n$5_1@@2 car))
 :pattern ( (MapType0Select PostHeap@0 n$5_1@@2 car))
)) (forall ((o_3@@9 T@U) ) (!  (=> (= (type o_3@@9) RefType) (and (=> (and (and (U_2_bool (MapType2Select g (invRecv5 o_3@@9))) (< NoPerm FullPerm)) (qpRange5 o_3@@9)) (and (=> (< NoPerm FullPerm) (= (invRecv5 o_3@@9) o_3@@9)) (= (U_2_real (MapType1Select QPMask@34 o_3@@9 car)) (+ (U_2_real (MapType1Select ZeroMask o_3@@9 car)) FullPerm)))) (=> (not (and (and (U_2_bool (MapType2Select g (invRecv5 o_3@@9))) (< NoPerm FullPerm)) (qpRange5 o_3@@9))) (= (U_2_real (MapType1Select QPMask@34 o_3@@9 car)) (U_2_real (MapType1Select ZeroMask o_3@@9 car))))))
 :qid |stdinbpl.1067:22|
 :skolemid |136|
 :pattern ( (MapType1Select QPMask@34 o_3@@9 car))
))) (and (forall ((o_3@@10 T@U) (f_5@@2 T@U) ) (! (let ((B@@14 (FieldTypeInv1 (type f_5@@2))))
(let ((A@@15 (FieldTypeInv0 (type f_5@@2))))
 (=> (and (and (= (type o_3@@10) RefType) (= (type f_5@@2) (FieldType A@@15 B@@14))) (not (= f_5@@2 car))) (= (U_2_real (MapType1Select ZeroMask o_3@@10 f_5@@2)) (U_2_real (MapType1Select QPMask@34 o_3@@10 f_5@@2))))))
 :qid |stdinbpl.1071:29|
 :skolemid |137|
 :pattern ( (MapType1Select ZeroMask o_3@@10 f_5@@2))
 :pattern ( (MapType1Select QPMask@34 o_3@@10 f_5@@2))
)) (state PostHeap@0 QPMask@34))) (and (=> (= (ControlFlow 0 303) 270) anon181_Then_correct) (=> (= (ControlFlow 0 303) 301) anon181_Else_correct))))))))
(let ((anon180_Then_correct true))
(let ((anon179_Then_correct  (=> (and (state PostHeap@0 ZeroMask) (|Set#Subset| roots marked)) (=> (and (and (state PostHeap@0 ZeroMask) (|Set#Subset| marked g)) (and (state PostHeap@0 ZeroMask) (not (U_2_bool (MapType2Select g null))))) (and (=> (= (ControlFlow 0 305) 269) anon180_Then_correct) (=> (= (ControlFlow 0 305) 303) anon180_Else_correct))))))
(let ((anon213_Then_correct  (and (=> (= (ControlFlow 0 225) (- 0 228)) (forall ((n_11 T@U) (n_11_1 T@U) ) (!  (=> (and (= (type n_11) RefType) (= (type n_11_1) RefType)) (=> (and (and (and (and (not (= n_11 n_11_1)) (U_2_bool (MapType2Select g n_11))) (U_2_bool (MapType2Select g n_11_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_11 n_11_1))))
 :qid |stdinbpl.1874:29|
 :skolemid |230|
 :pattern ( (neverTriggered21 n_11) (neverTriggered21 n_11_1))
))) (=> (forall ((n_11@@0 T@U) (n_11_1@@0 T@U) ) (!  (=> (and (= (type n_11@@0) RefType) (= (type n_11_1@@0) RefType)) (=> (and (and (and (and (not (= n_11@@0 n_11_1@@0)) (U_2_bool (MapType2Select g n_11@@0))) (U_2_bool (MapType2Select g n_11_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_11@@0 n_11_1@@0))))
 :qid |stdinbpl.1874:29|
 :skolemid |230|
 :pattern ( (neverTriggered21 n_11@@0) (neverTriggered21 n_11_1@@0))
)) (and (=> (= (ControlFlow 0 225) (- 0 227)) (forall ((n_11@@1 T@U) ) (!  (=> (and (= (type n_11@@1) RefType) (U_2_bool (MapType2Select g n_11@@1))) (>= (U_2_real (MapType1Select QPMask@15 n_11@@1 car)) FullPerm))
 :qid |stdinbpl.1881:29|
 :skolemid |231|
 :pattern ( (MapType0Select ExhaleHeap@0 n_11@@1 car))
 :pattern ( (MapType1Select QPMask@20 n_11@@1 car))
 :pattern ( (MapType0Select ExhaleHeap@0 n_11@@1 car))
))) (=> (forall ((n_11@@2 T@U) ) (!  (=> (and (= (type n_11@@2) RefType) (U_2_bool (MapType2Select g n_11@@2))) (>= (U_2_real (MapType1Select QPMask@15 n_11@@2 car)) FullPerm))
 :qid |stdinbpl.1881:29|
 :skolemid |231|
 :pattern ( (MapType0Select ExhaleHeap@0 n_11@@2 car))
 :pattern ( (MapType1Select QPMask@20 n_11@@2 car))
 :pattern ( (MapType0Select ExhaleHeap@0 n_11@@2 car))
)) (=> (and (and (forall ((n_11@@3 T@U) ) (!  (=> (= (type n_11@@3) RefType) (=> (and (U_2_bool (MapType2Select g n_11@@3)) (< NoPerm FullPerm)) (and (qpRange21 n_11@@3) (= (invRecv21 n_11@@3) n_11@@3))))
 :qid |stdinbpl.1887:34|
 :skolemid |232|
 :pattern ( (MapType0Select ExhaleHeap@0 n_11@@3 car))
 :pattern ( (MapType1Select QPMask@20 n_11@@3 car))
 :pattern ( (MapType0Select ExhaleHeap@0 n_11@@3 car))
)) (forall ((o_3@@11 T@U) ) (!  (=> (= (type o_3@@11) RefType) (=> (and (U_2_bool (MapType2Select g (invRecv21 o_3@@11))) (and (< NoPerm FullPerm) (qpRange21 o_3@@11))) (= (invRecv21 o_3@@11) o_3@@11)))
 :qid |stdinbpl.1891:34|
 :skolemid |233|
 :pattern ( (invRecv21 o_3@@11))
))) (and (forall ((o_3@@12 T@U) ) (!  (=> (= (type o_3@@12) RefType) (and (=> (and (U_2_bool (MapType2Select g (invRecv21 o_3@@12))) (and (< NoPerm FullPerm) (qpRange21 o_3@@12))) (and (= (invRecv21 o_3@@12) o_3@@12) (= (U_2_real (MapType1Select QPMask@20 o_3@@12 car)) (- (U_2_real (MapType1Select QPMask@15 o_3@@12 car)) FullPerm)))) (=> (not (and (U_2_bool (MapType2Select g (invRecv21 o_3@@12))) (and (< NoPerm FullPerm) (qpRange21 o_3@@12)))) (= (U_2_real (MapType1Select QPMask@20 o_3@@12 car)) (U_2_real (MapType1Select QPMask@15 o_3@@12 car))))))
 :qid |stdinbpl.1897:34|
 :skolemid |234|
 :pattern ( (MapType1Select QPMask@20 o_3@@12 car))
)) (forall ((o_3@@13 T@U) (f_5@@3 T@U) ) (! (let ((B@@15 (FieldTypeInv1 (type f_5@@3))))
(let ((A@@16 (FieldTypeInv0 (type f_5@@3))))
 (=> (and (and (= (type o_3@@13) RefType) (= (type f_5@@3) (FieldType A@@16 B@@15))) (not (= f_5@@3 car))) (= (U_2_real (MapType1Select QPMask@15 o_3@@13 f_5@@3)) (U_2_real (MapType1Select QPMask@20 o_3@@13 f_5@@3))))))
 :qid |stdinbpl.1903:41|
 :skolemid |235|
 :pattern ( (MapType1Select QPMask@20 o_3@@13 f_5@@3))
)))) (and (=> (= (ControlFlow 0 225) (- 0 226)) (forall ((n$0_6 T@U) (n$0_6_1 T@U) ) (!  (=> (and (= (type n$0_6) RefType) (= (type n$0_6_1) RefType)) (=> (and (and (and (and (not (= n$0_6 n$0_6_1)) (U_2_bool (MapType2Select g n$0_6))) (U_2_bool (MapType2Select g n$0_6_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$0_6 n$0_6_1))))
 :qid |stdinbpl.1915:29|
 :skolemid |236|
 :pattern ( (neverTriggered22 n$0_6) (neverTriggered22 n$0_6_1))
))) (=> (forall ((n$0_6@@0 T@U) (n$0_6_1@@0 T@U) ) (!  (=> (and (= (type n$0_6@@0) RefType) (= (type n$0_6_1@@0) RefType)) (=> (and (and (and (and (not (= n$0_6@@0 n$0_6_1@@0)) (U_2_bool (MapType2Select g n$0_6@@0))) (U_2_bool (MapType2Select g n$0_6_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$0_6@@0 n$0_6_1@@0))))
 :qid |stdinbpl.1915:29|
 :skolemid |236|
 :pattern ( (neverTriggered22 n$0_6@@0) (neverTriggered22 n$0_6_1@@0))
)) (=> (= (ControlFlow 0 225) (- 0 224)) (forall ((n$0_6@@1 T@U) ) (!  (=> (and (= (type n$0_6@@1) RefType) (U_2_bool (MapType2Select g n$0_6@@1))) (>= (U_2_real (MapType1Select QPMask@20 n$0_6@@1 cdr)) FullPerm))
 :qid |stdinbpl.1922:29|
 :skolemid |237|
 :pattern ( (MapType0Select ExhaleHeap@0 n$0_6@@1 cdr))
 :pattern ( (MapType1Select QPMask@21 n$0_6@@1 cdr))
 :pattern ( (MapType0Select ExhaleHeap@0 n$0_6@@1 cdr))
))))))))))))
(let ((anon215_Then_correct  (and (=> (= (ControlFlow 0 216) (- 0 219)) (forall ((n_12 T@U) (n_12_1 T@U) ) (!  (=> (and (= (type n_12) RefType) (= (type n_12_1) RefType)) (=> (and (and (and (and (not (= n_12 n_12_1)) (U_2_bool (MapType2Select g n_12))) (U_2_bool (MapType2Select g n_12_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_12 n_12_1))))
 :qid |stdinbpl.1976:29|
 :skolemid |242|
 :pattern ( (neverTriggered23 n_12) (neverTriggered23 n_12_1))
))) (=> (forall ((n_12@@0 T@U) (n_12_1@@0 T@U) ) (!  (=> (and (= (type n_12@@0) RefType) (= (type n_12_1@@0) RefType)) (=> (and (and (and (and (not (= n_12@@0 n_12_1@@0)) (U_2_bool (MapType2Select g n_12@@0))) (U_2_bool (MapType2Select g n_12_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_12@@0 n_12_1@@0))))
 :qid |stdinbpl.1976:29|
 :skolemid |242|
 :pattern ( (neverTriggered23 n_12@@0) (neverTriggered23 n_12_1@@0))
)) (and (=> (= (ControlFlow 0 216) (- 0 218)) (forall ((n_12@@1 T@U) ) (!  (=> (and (= (type n_12@@1) RefType) (U_2_bool (MapType2Select g n_12@@1))) (>= (U_2_real (MapType1Select QPMask@15 n_12@@1 car)) FullPerm))
 :qid |stdinbpl.1983:29|
 :skolemid |243|
 :pattern ( (MapType0Select ExhaleHeap@0 n_12@@1 car))
 :pattern ( (MapType1Select QPMask@22 n_12@@1 car))
 :pattern ( (MapType0Select ExhaleHeap@0 n_12@@1 car))
))) (=> (forall ((n_12@@2 T@U) ) (!  (=> (and (= (type n_12@@2) RefType) (U_2_bool (MapType2Select g n_12@@2))) (>= (U_2_real (MapType1Select QPMask@15 n_12@@2 car)) FullPerm))
 :qid |stdinbpl.1983:29|
 :skolemid |243|
 :pattern ( (MapType0Select ExhaleHeap@0 n_12@@2 car))
 :pattern ( (MapType1Select QPMask@22 n_12@@2 car))
 :pattern ( (MapType0Select ExhaleHeap@0 n_12@@2 car))
)) (=> (and (and (forall ((n_12@@3 T@U) ) (!  (=> (= (type n_12@@3) RefType) (=> (and (U_2_bool (MapType2Select g n_12@@3)) (< NoPerm FullPerm)) (and (qpRange23 n_12@@3) (= (invRecv23 n_12@@3) n_12@@3))))
 :qid |stdinbpl.1989:34|
 :skolemid |244|
 :pattern ( (MapType0Select ExhaleHeap@0 n_12@@3 car))
 :pattern ( (MapType1Select QPMask@22 n_12@@3 car))
 :pattern ( (MapType0Select ExhaleHeap@0 n_12@@3 car))
)) (forall ((o_3@@14 T@U) ) (!  (=> (= (type o_3@@14) RefType) (=> (and (U_2_bool (MapType2Select g (invRecv23 o_3@@14))) (and (< NoPerm FullPerm) (qpRange23 o_3@@14))) (= (invRecv23 o_3@@14) o_3@@14)))
 :qid |stdinbpl.1993:34|
 :skolemid |245|
 :pattern ( (invRecv23 o_3@@14))
))) (and (forall ((o_3@@15 T@U) ) (!  (=> (= (type o_3@@15) RefType) (and (=> (and (U_2_bool (MapType2Select g (invRecv23 o_3@@15))) (and (< NoPerm FullPerm) (qpRange23 o_3@@15))) (and (= (invRecv23 o_3@@15) o_3@@15) (= (U_2_real (MapType1Select QPMask@22 o_3@@15 car)) (- (U_2_real (MapType1Select QPMask@15 o_3@@15 car)) FullPerm)))) (=> (not (and (U_2_bool (MapType2Select g (invRecv23 o_3@@15))) (and (< NoPerm FullPerm) (qpRange23 o_3@@15)))) (= (U_2_real (MapType1Select QPMask@22 o_3@@15 car)) (U_2_real (MapType1Select QPMask@15 o_3@@15 car))))))
 :qid |stdinbpl.1999:34|
 :skolemid |246|
 :pattern ( (MapType1Select QPMask@22 o_3@@15 car))
)) (forall ((o_3@@16 T@U) (f_5@@4 T@U) ) (! (let ((B@@16 (FieldTypeInv1 (type f_5@@4))))
(let ((A@@17 (FieldTypeInv0 (type f_5@@4))))
 (=> (and (and (= (type o_3@@16) RefType) (= (type f_5@@4) (FieldType A@@17 B@@16))) (not (= f_5@@4 car))) (= (U_2_real (MapType1Select QPMask@15 o_3@@16 f_5@@4)) (U_2_real (MapType1Select QPMask@22 o_3@@16 f_5@@4))))))
 :qid |stdinbpl.2005:41|
 :skolemid |247|
 :pattern ( (MapType1Select QPMask@22 o_3@@16 f_5@@4))
)))) (and (=> (= (ControlFlow 0 216) (- 0 217)) (forall ((n$0_7 T@U) (n$0_7_1 T@U) ) (!  (=> (and (= (type n$0_7) RefType) (= (type n$0_7_1) RefType)) (=> (and (and (and (and (not (= n$0_7 n$0_7_1)) (U_2_bool (MapType2Select g n$0_7))) (U_2_bool (MapType2Select g n$0_7_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$0_7 n$0_7_1))))
 :qid |stdinbpl.2017:29|
 :skolemid |248|
 :pattern ( (neverTriggered24 n$0_7) (neverTriggered24 n$0_7_1))
))) (=> (forall ((n$0_7@@0 T@U) (n$0_7_1@@0 T@U) ) (!  (=> (and (= (type n$0_7@@0) RefType) (= (type n$0_7_1@@0) RefType)) (=> (and (and (and (and (not (= n$0_7@@0 n$0_7_1@@0)) (U_2_bool (MapType2Select g n$0_7@@0))) (U_2_bool (MapType2Select g n$0_7_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$0_7@@0 n$0_7_1@@0))))
 :qid |stdinbpl.2017:29|
 :skolemid |248|
 :pattern ( (neverTriggered24 n$0_7@@0) (neverTriggered24 n$0_7_1@@0))
)) (=> (= (ControlFlow 0 216) (- 0 215)) (forall ((n$0_7@@1 T@U) ) (!  (=> (and (= (type n$0_7@@1) RefType) (U_2_bool (MapType2Select g n$0_7@@1))) (>= (U_2_real (MapType1Select QPMask@22 n$0_7@@1 cdr)) FullPerm))
 :qid |stdinbpl.2024:29|
 :skolemid |249|
 :pattern ( (MapType0Select ExhaleHeap@0 n$0_7@@1 cdr))
 :pattern ( (MapType1Select QPMask@23 n$0_7@@1 cdr))
 :pattern ( (MapType0Select ExhaleHeap@0 n$0_7@@1 cdr))
))))))))))))
(let ((anon211_Then_correct  (and (=> (= (ControlFlow 0 210) (- 0 213)) (forall ((n_10 T@U) (n_10_1 T@U) ) (!  (=> (and (= (type n_10) RefType) (= (type n_10_1) RefType)) (=> (and (and (and (and (not (= n_10 n_10_1)) (U_2_bool (MapType2Select g n_10))) (U_2_bool (MapType2Select g n_10_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_10 n_10_1))))
 :qid |stdinbpl.1780:27|
 :skolemid |218|
 :pattern ( (neverTriggered19 n_10) (neverTriggered19 n_10_1))
))) (=> (forall ((n_10@@0 T@U) (n_10_1@@0 T@U) ) (!  (=> (and (= (type n_10@@0) RefType) (= (type n_10_1@@0) RefType)) (=> (and (and (and (and (not (= n_10@@0 n_10_1@@0)) (U_2_bool (MapType2Select g n_10@@0))) (U_2_bool (MapType2Select g n_10_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_10@@0 n_10_1@@0))))
 :qid |stdinbpl.1780:27|
 :skolemid |218|
 :pattern ( (neverTriggered19 n_10@@0) (neverTriggered19 n_10_1@@0))
)) (and (=> (= (ControlFlow 0 210) (- 0 212)) (forall ((n_10@@1 T@U) ) (!  (=> (and (= (type n_10@@1) RefType) (U_2_bool (MapType2Select g n_10@@1))) (>= (U_2_real (MapType1Select QPMask@15 n_10@@1 car)) FullPerm))
 :qid |stdinbpl.1787:27|
 :skolemid |219|
 :pattern ( (MapType0Select ExhaleHeap@0 n_10@@1 car))
 :pattern ( (MapType1Select QPMask@18 n_10@@1 car))
 :pattern ( (MapType0Select ExhaleHeap@0 n_10@@1 car))
))) (=> (forall ((n_10@@2 T@U) ) (!  (=> (and (= (type n_10@@2) RefType) (U_2_bool (MapType2Select g n_10@@2))) (>= (U_2_real (MapType1Select QPMask@15 n_10@@2 car)) FullPerm))
 :qid |stdinbpl.1787:27|
 :skolemid |219|
 :pattern ( (MapType0Select ExhaleHeap@0 n_10@@2 car))
 :pattern ( (MapType1Select QPMask@18 n_10@@2 car))
 :pattern ( (MapType0Select ExhaleHeap@0 n_10@@2 car))
)) (=> (and (and (forall ((n_10@@3 T@U) ) (!  (=> (= (type n_10@@3) RefType) (=> (and (U_2_bool (MapType2Select g n_10@@3)) (< NoPerm FullPerm)) (and (qpRange19 n_10@@3) (= (invRecv19 n_10@@3) n_10@@3))))
 :qid |stdinbpl.1793:32|
 :skolemid |220|
 :pattern ( (MapType0Select ExhaleHeap@0 n_10@@3 car))
 :pattern ( (MapType1Select QPMask@18 n_10@@3 car))
 :pattern ( (MapType0Select ExhaleHeap@0 n_10@@3 car))
)) (forall ((o_3@@17 T@U) ) (!  (=> (= (type o_3@@17) RefType) (=> (and (U_2_bool (MapType2Select g (invRecv19 o_3@@17))) (and (< NoPerm FullPerm) (qpRange19 o_3@@17))) (= (invRecv19 o_3@@17) o_3@@17)))
 :qid |stdinbpl.1797:32|
 :skolemid |221|
 :pattern ( (invRecv19 o_3@@17))
))) (and (forall ((o_3@@18 T@U) ) (!  (=> (= (type o_3@@18) RefType) (and (=> (and (U_2_bool (MapType2Select g (invRecv19 o_3@@18))) (and (< NoPerm FullPerm) (qpRange19 o_3@@18))) (and (= (invRecv19 o_3@@18) o_3@@18) (= (U_2_real (MapType1Select QPMask@18 o_3@@18 car)) (- (U_2_real (MapType1Select QPMask@15 o_3@@18 car)) FullPerm)))) (=> (not (and (U_2_bool (MapType2Select g (invRecv19 o_3@@18))) (and (< NoPerm FullPerm) (qpRange19 o_3@@18)))) (= (U_2_real (MapType1Select QPMask@18 o_3@@18 car)) (U_2_real (MapType1Select QPMask@15 o_3@@18 car))))))
 :qid |stdinbpl.1803:32|
 :skolemid |222|
 :pattern ( (MapType1Select QPMask@18 o_3@@18 car))
)) (forall ((o_3@@19 T@U) (f_5@@5 T@U) ) (! (let ((B@@17 (FieldTypeInv1 (type f_5@@5))))
(let ((A@@18 (FieldTypeInv0 (type f_5@@5))))
 (=> (and (and (= (type o_3@@19) RefType) (= (type f_5@@5) (FieldType A@@18 B@@17))) (not (= f_5@@5 car))) (= (U_2_real (MapType1Select QPMask@15 o_3@@19 f_5@@5)) (U_2_real (MapType1Select QPMask@18 o_3@@19 f_5@@5))))))
 :qid |stdinbpl.1809:39|
 :skolemid |223|
 :pattern ( (MapType1Select QPMask@18 o_3@@19 f_5@@5))
)))) (and (=> (= (ControlFlow 0 210) (- 0 211)) (forall ((n$0_5 T@U) (n$0_5_1 T@U) ) (!  (=> (and (= (type n$0_5) RefType) (= (type n$0_5_1) RefType)) (=> (and (and (and (and (not (= n$0_5 n$0_5_1)) (U_2_bool (MapType2Select g n$0_5))) (U_2_bool (MapType2Select g n$0_5_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$0_5 n$0_5_1))))
 :qid |stdinbpl.1821:27|
 :skolemid |224|
 :pattern ( (neverTriggered20 n$0_5) (neverTriggered20 n$0_5_1))
))) (=> (forall ((n$0_5@@0 T@U) (n$0_5_1@@0 T@U) ) (!  (=> (and (= (type n$0_5@@0) RefType) (= (type n$0_5_1@@0) RefType)) (=> (and (and (and (and (not (= n$0_5@@0 n$0_5_1@@0)) (U_2_bool (MapType2Select g n$0_5@@0))) (U_2_bool (MapType2Select g n$0_5_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$0_5@@0 n$0_5_1@@0))))
 :qid |stdinbpl.1821:27|
 :skolemid |224|
 :pattern ( (neverTriggered20 n$0_5@@0) (neverTriggered20 n$0_5_1@@0))
)) (=> (= (ControlFlow 0 210) (- 0 209)) (forall ((n$0_5@@1 T@U) ) (!  (=> (and (= (type n$0_5@@1) RefType) (U_2_bool (MapType2Select g n$0_5@@1))) (>= (U_2_real (MapType1Select QPMask@18 n$0_5@@1 cdr)) FullPerm))
 :qid |stdinbpl.1828:27|
 :skolemid |225|
 :pattern ( (MapType0Select ExhaleHeap@0 n$0_5@@1 cdr))
 :pattern ( (MapType1Select QPMask@19 n$0_5@@1 cdr))
 :pattern ( (MapType0Select ExhaleHeap@0 n$0_5@@1 cdr))
))))))))))))
(let ((anon219_Then_correct  (and (=> (= (ControlFlow 0 196) (- 0 199)) (forall ((n_14 T@U) (n_14_1 T@U) ) (!  (=> (and (= (type n_14) RefType) (= (type n_14_1) RefType)) (=> (and (and (and (and (not (= n_14 n_14_1)) (U_2_bool (MapType2Select g n_14))) (U_2_bool (MapType2Select g n_14_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_14 n_14_1))))
 :qid |stdinbpl.2177:29|
 :skolemid |266|
 :pattern ( (neverTriggered27 n_14) (neverTriggered27 n_14_1))
))) (=> (forall ((n_14@@0 T@U) (n_14_1@@0 T@U) ) (!  (=> (and (= (type n_14@@0) RefType) (= (type n_14_1@@0) RefType)) (=> (and (and (and (and (not (= n_14@@0 n_14_1@@0)) (U_2_bool (MapType2Select g n_14@@0))) (U_2_bool (MapType2Select g n_14_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_14@@0 n_14_1@@0))))
 :qid |stdinbpl.2177:29|
 :skolemid |266|
 :pattern ( (neverTriggered27 n_14@@0) (neverTriggered27 n_14_1@@0))
)) (and (=> (= (ControlFlow 0 196) (- 0 198)) (forall ((n_14@@1 T@U) ) (!  (=> (and (= (type n_14@@1) RefType) (U_2_bool (MapType2Select g n_14@@1))) (>= (U_2_real (MapType1Select QPMask@15 n_14@@1 car)) FullPerm))
 :qid |stdinbpl.2184:29|
 :skolemid |267|
 :pattern ( (MapType0Select ExhaleHeap@0 n_14@@1 car))
 :pattern ( (MapType1Select QPMask@26 n_14@@1 car))
 :pattern ( (MapType0Select ExhaleHeap@0 n_14@@1 car))
))) (=> (forall ((n_14@@2 T@U) ) (!  (=> (and (= (type n_14@@2) RefType) (U_2_bool (MapType2Select g n_14@@2))) (>= (U_2_real (MapType1Select QPMask@15 n_14@@2 car)) FullPerm))
 :qid |stdinbpl.2184:29|
 :skolemid |267|
 :pattern ( (MapType0Select ExhaleHeap@0 n_14@@2 car))
 :pattern ( (MapType1Select QPMask@26 n_14@@2 car))
 :pattern ( (MapType0Select ExhaleHeap@0 n_14@@2 car))
)) (=> (and (and (forall ((n_14@@3 T@U) ) (!  (=> (= (type n_14@@3) RefType) (=> (and (U_2_bool (MapType2Select g n_14@@3)) (< NoPerm FullPerm)) (and (qpRange27 n_14@@3) (= (invRecv27 n_14@@3) n_14@@3))))
 :qid |stdinbpl.2190:34|
 :skolemid |268|
 :pattern ( (MapType0Select ExhaleHeap@0 n_14@@3 car))
 :pattern ( (MapType1Select QPMask@26 n_14@@3 car))
 :pattern ( (MapType0Select ExhaleHeap@0 n_14@@3 car))
)) (forall ((o_3@@20 T@U) ) (!  (=> (= (type o_3@@20) RefType) (=> (and (U_2_bool (MapType2Select g (invRecv27 o_3@@20))) (and (< NoPerm FullPerm) (qpRange27 o_3@@20))) (= (invRecv27 o_3@@20) o_3@@20)))
 :qid |stdinbpl.2194:34|
 :skolemid |269|
 :pattern ( (invRecv27 o_3@@20))
))) (and (forall ((o_3@@21 T@U) ) (!  (=> (= (type o_3@@21) RefType) (and (=> (and (U_2_bool (MapType2Select g (invRecv27 o_3@@21))) (and (< NoPerm FullPerm) (qpRange27 o_3@@21))) (and (= (invRecv27 o_3@@21) o_3@@21) (= (U_2_real (MapType1Select QPMask@26 o_3@@21 car)) (- (U_2_real (MapType1Select QPMask@15 o_3@@21 car)) FullPerm)))) (=> (not (and (U_2_bool (MapType2Select g (invRecv27 o_3@@21))) (and (< NoPerm FullPerm) (qpRange27 o_3@@21)))) (= (U_2_real (MapType1Select QPMask@26 o_3@@21 car)) (U_2_real (MapType1Select QPMask@15 o_3@@21 car))))))
 :qid |stdinbpl.2200:34|
 :skolemid |270|
 :pattern ( (MapType1Select QPMask@26 o_3@@21 car))
)) (forall ((o_3@@22 T@U) (f_5@@6 T@U) ) (! (let ((B@@18 (FieldTypeInv1 (type f_5@@6))))
(let ((A@@19 (FieldTypeInv0 (type f_5@@6))))
 (=> (and (and (= (type o_3@@22) RefType) (= (type f_5@@6) (FieldType A@@19 B@@18))) (not (= f_5@@6 car))) (= (U_2_real (MapType1Select QPMask@15 o_3@@22 f_5@@6)) (U_2_real (MapType1Select QPMask@26 o_3@@22 f_5@@6))))))
 :qid |stdinbpl.2206:41|
 :skolemid |271|
 :pattern ( (MapType1Select QPMask@26 o_3@@22 f_5@@6))
)))) (and (=> (= (ControlFlow 0 196) (- 0 197)) (forall ((n$0_9 T@U) (n$0_9_1 T@U) ) (!  (=> (and (= (type n$0_9) RefType) (= (type n$0_9_1) RefType)) (=> (and (and (and (and (not (= n$0_9 n$0_9_1)) (U_2_bool (MapType2Select g n$0_9))) (U_2_bool (MapType2Select g n$0_9_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$0_9 n$0_9_1))))
 :qid |stdinbpl.2218:29|
 :skolemid |272|
 :pattern ( (neverTriggered28 n$0_9) (neverTriggered28 n$0_9_1))
))) (=> (forall ((n$0_9@@0 T@U) (n$0_9_1@@0 T@U) ) (!  (=> (and (= (type n$0_9@@0) RefType) (= (type n$0_9_1@@0) RefType)) (=> (and (and (and (and (not (= n$0_9@@0 n$0_9_1@@0)) (U_2_bool (MapType2Select g n$0_9@@0))) (U_2_bool (MapType2Select g n$0_9_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$0_9@@0 n$0_9_1@@0))))
 :qid |stdinbpl.2218:29|
 :skolemid |272|
 :pattern ( (neverTriggered28 n$0_9@@0) (neverTriggered28 n$0_9_1@@0))
)) (=> (= (ControlFlow 0 196) (- 0 195)) (forall ((n$0_9@@1 T@U) ) (!  (=> (and (= (type n$0_9@@1) RefType) (U_2_bool (MapType2Select g n$0_9@@1))) (>= (U_2_real (MapType1Select QPMask@26 n$0_9@@1 cdr)) FullPerm))
 :qid |stdinbpl.2225:29|
 :skolemid |273|
 :pattern ( (MapType0Select ExhaleHeap@0 n$0_9@@1 cdr))
 :pattern ( (MapType1Select QPMask@27 n$0_9@@1 cdr))
 :pattern ( (MapType0Select ExhaleHeap@0 n$0_9@@1 cdr))
))))))))))))
(let ((anon221_Then_correct  (and (=> (= (ControlFlow 0 187) (- 0 190)) (forall ((n_15 T@U) (n_15_1 T@U) ) (!  (=> (and (= (type n_15) RefType) (= (type n_15_1) RefType)) (=> (and (and (and (and (not (= n_15 n_15_1)) (U_2_bool (MapType2Select g n_15))) (U_2_bool (MapType2Select g n_15_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_15 n_15_1))))
 :qid |stdinbpl.2279:29|
 :skolemid |278|
 :pattern ( (neverTriggered29 n_15) (neverTriggered29 n_15_1))
))) (=> (forall ((n_15@@0 T@U) (n_15_1@@0 T@U) ) (!  (=> (and (= (type n_15@@0) RefType) (= (type n_15_1@@0) RefType)) (=> (and (and (and (and (not (= n_15@@0 n_15_1@@0)) (U_2_bool (MapType2Select g n_15@@0))) (U_2_bool (MapType2Select g n_15_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_15@@0 n_15_1@@0))))
 :qid |stdinbpl.2279:29|
 :skolemid |278|
 :pattern ( (neverTriggered29 n_15@@0) (neverTriggered29 n_15_1@@0))
)) (and (=> (= (ControlFlow 0 187) (- 0 189)) (forall ((n_15@@1 T@U) ) (!  (=> (and (= (type n_15@@1) RefType) (U_2_bool (MapType2Select g n_15@@1))) (>= (U_2_real (MapType1Select QPMask@15 n_15@@1 car)) FullPerm))
 :qid |stdinbpl.2286:29|
 :skolemid |279|
 :pattern ( (MapType0Select ExhaleHeap@0 n_15@@1 car))
 :pattern ( (MapType1Select QPMask@28 n_15@@1 car))
 :pattern ( (MapType0Select ExhaleHeap@0 n_15@@1 car))
))) (=> (forall ((n_15@@2 T@U) ) (!  (=> (and (= (type n_15@@2) RefType) (U_2_bool (MapType2Select g n_15@@2))) (>= (U_2_real (MapType1Select QPMask@15 n_15@@2 car)) FullPerm))
 :qid |stdinbpl.2286:29|
 :skolemid |279|
 :pattern ( (MapType0Select ExhaleHeap@0 n_15@@2 car))
 :pattern ( (MapType1Select QPMask@28 n_15@@2 car))
 :pattern ( (MapType0Select ExhaleHeap@0 n_15@@2 car))
)) (=> (and (and (forall ((n_15@@3 T@U) ) (!  (=> (= (type n_15@@3) RefType) (=> (and (U_2_bool (MapType2Select g n_15@@3)) (< NoPerm FullPerm)) (and (qpRange29 n_15@@3) (= (invRecv29 n_15@@3) n_15@@3))))
 :qid |stdinbpl.2292:34|
 :skolemid |280|
 :pattern ( (MapType0Select ExhaleHeap@0 n_15@@3 car))
 :pattern ( (MapType1Select QPMask@28 n_15@@3 car))
 :pattern ( (MapType0Select ExhaleHeap@0 n_15@@3 car))
)) (forall ((o_3@@23 T@U) ) (!  (=> (= (type o_3@@23) RefType) (=> (and (U_2_bool (MapType2Select g (invRecv29 o_3@@23))) (and (< NoPerm FullPerm) (qpRange29 o_3@@23))) (= (invRecv29 o_3@@23) o_3@@23)))
 :qid |stdinbpl.2296:34|
 :skolemid |281|
 :pattern ( (invRecv29 o_3@@23))
))) (and (forall ((o_3@@24 T@U) ) (!  (=> (= (type o_3@@24) RefType) (and (=> (and (U_2_bool (MapType2Select g (invRecv29 o_3@@24))) (and (< NoPerm FullPerm) (qpRange29 o_3@@24))) (and (= (invRecv29 o_3@@24) o_3@@24) (= (U_2_real (MapType1Select QPMask@28 o_3@@24 car)) (- (U_2_real (MapType1Select QPMask@15 o_3@@24 car)) FullPerm)))) (=> (not (and (U_2_bool (MapType2Select g (invRecv29 o_3@@24))) (and (< NoPerm FullPerm) (qpRange29 o_3@@24)))) (= (U_2_real (MapType1Select QPMask@28 o_3@@24 car)) (U_2_real (MapType1Select QPMask@15 o_3@@24 car))))))
 :qid |stdinbpl.2302:34|
 :skolemid |282|
 :pattern ( (MapType1Select QPMask@28 o_3@@24 car))
)) (forall ((o_3@@25 T@U) (f_5@@7 T@U) ) (! (let ((B@@19 (FieldTypeInv1 (type f_5@@7))))
(let ((A@@20 (FieldTypeInv0 (type f_5@@7))))
 (=> (and (and (= (type o_3@@25) RefType) (= (type f_5@@7) (FieldType A@@20 B@@19))) (not (= f_5@@7 car))) (= (U_2_real (MapType1Select QPMask@15 o_3@@25 f_5@@7)) (U_2_real (MapType1Select QPMask@28 o_3@@25 f_5@@7))))))
 :qid |stdinbpl.2308:41|
 :skolemid |283|
 :pattern ( (MapType1Select QPMask@28 o_3@@25 f_5@@7))
)))) (and (=> (= (ControlFlow 0 187) (- 0 188)) (forall ((n$0_10 T@U) (n$0_10_1 T@U) ) (!  (=> (and (= (type n$0_10) RefType) (= (type n$0_10_1) RefType)) (=> (and (and (and (and (not (= n$0_10 n$0_10_1)) (U_2_bool (MapType2Select g n$0_10))) (U_2_bool (MapType2Select g n$0_10_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$0_10 n$0_10_1))))
 :qid |stdinbpl.2320:29|
 :skolemid |284|
 :pattern ( (neverTriggered30 n$0_10) (neverTriggered30 n$0_10_1))
))) (=> (forall ((n$0_10@@0 T@U) (n$0_10_1@@0 T@U) ) (!  (=> (and (= (type n$0_10@@0) RefType) (= (type n$0_10_1@@0) RefType)) (=> (and (and (and (and (not (= n$0_10@@0 n$0_10_1@@0)) (U_2_bool (MapType2Select g n$0_10@@0))) (U_2_bool (MapType2Select g n$0_10_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$0_10@@0 n$0_10_1@@0))))
 :qid |stdinbpl.2320:29|
 :skolemid |284|
 :pattern ( (neverTriggered30 n$0_10@@0) (neverTriggered30 n$0_10_1@@0))
)) (=> (= (ControlFlow 0 187) (- 0 186)) (forall ((n$0_10@@1 T@U) ) (!  (=> (and (= (type n$0_10@@1) RefType) (U_2_bool (MapType2Select g n$0_10@@1))) (>= (U_2_real (MapType1Select QPMask@28 n$0_10@@1 cdr)) FullPerm))
 :qid |stdinbpl.2327:29|
 :skolemid |285|
 :pattern ( (MapType0Select ExhaleHeap@0 n$0_10@@1 cdr))
 :pattern ( (MapType1Select QPMask@29 n$0_10@@1 cdr))
 :pattern ( (MapType0Select ExhaleHeap@0 n$0_10@@1 cdr))
))))))))))))
(let ((anon217_Then_correct  (and (=> (= (ControlFlow 0 181) (- 0 184)) (forall ((n_13 T@U) (n_13_1 T@U) ) (!  (=> (and (= (type n_13) RefType) (= (type n_13_1) RefType)) (=> (and (and (and (and (not (= n_13 n_13_1)) (U_2_bool (MapType2Select g n_13))) (U_2_bool (MapType2Select g n_13_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_13 n_13_1))))
 :qid |stdinbpl.2083:27|
 :skolemid |254|
 :pattern ( (neverTriggered25 n_13) (neverTriggered25 n_13_1))
))) (=> (forall ((n_13@@0 T@U) (n_13_1@@0 T@U) ) (!  (=> (and (= (type n_13@@0) RefType) (= (type n_13_1@@0) RefType)) (=> (and (and (and (and (not (= n_13@@0 n_13_1@@0)) (U_2_bool (MapType2Select g n_13@@0))) (U_2_bool (MapType2Select g n_13_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_13@@0 n_13_1@@0))))
 :qid |stdinbpl.2083:27|
 :skolemid |254|
 :pattern ( (neverTriggered25 n_13@@0) (neverTriggered25 n_13_1@@0))
)) (and (=> (= (ControlFlow 0 181) (- 0 183)) (forall ((n_13@@1 T@U) ) (!  (=> (and (= (type n_13@@1) RefType) (U_2_bool (MapType2Select g n_13@@1))) (>= (U_2_real (MapType1Select QPMask@15 n_13@@1 car)) FullPerm))
 :qid |stdinbpl.2090:27|
 :skolemid |255|
 :pattern ( (MapType0Select ExhaleHeap@0 n_13@@1 car))
 :pattern ( (MapType1Select QPMask@24 n_13@@1 car))
 :pattern ( (MapType0Select ExhaleHeap@0 n_13@@1 car))
))) (=> (forall ((n_13@@2 T@U) ) (!  (=> (and (= (type n_13@@2) RefType) (U_2_bool (MapType2Select g n_13@@2))) (>= (U_2_real (MapType1Select QPMask@15 n_13@@2 car)) FullPerm))
 :qid |stdinbpl.2090:27|
 :skolemid |255|
 :pattern ( (MapType0Select ExhaleHeap@0 n_13@@2 car))
 :pattern ( (MapType1Select QPMask@24 n_13@@2 car))
 :pattern ( (MapType0Select ExhaleHeap@0 n_13@@2 car))
)) (=> (and (and (forall ((n_13@@3 T@U) ) (!  (=> (= (type n_13@@3) RefType) (=> (and (U_2_bool (MapType2Select g n_13@@3)) (< NoPerm FullPerm)) (and (qpRange25 n_13@@3) (= (invRecv25 n_13@@3) n_13@@3))))
 :qid |stdinbpl.2096:32|
 :skolemid |256|
 :pattern ( (MapType0Select ExhaleHeap@0 n_13@@3 car))
 :pattern ( (MapType1Select QPMask@24 n_13@@3 car))
 :pattern ( (MapType0Select ExhaleHeap@0 n_13@@3 car))
)) (forall ((o_3@@26 T@U) ) (!  (=> (= (type o_3@@26) RefType) (=> (and (U_2_bool (MapType2Select g (invRecv25 o_3@@26))) (and (< NoPerm FullPerm) (qpRange25 o_3@@26))) (= (invRecv25 o_3@@26) o_3@@26)))
 :qid |stdinbpl.2100:32|
 :skolemid |257|
 :pattern ( (invRecv25 o_3@@26))
))) (and (forall ((o_3@@27 T@U) ) (!  (=> (= (type o_3@@27) RefType) (and (=> (and (U_2_bool (MapType2Select g (invRecv25 o_3@@27))) (and (< NoPerm FullPerm) (qpRange25 o_3@@27))) (and (= (invRecv25 o_3@@27) o_3@@27) (= (U_2_real (MapType1Select QPMask@24 o_3@@27 car)) (- (U_2_real (MapType1Select QPMask@15 o_3@@27 car)) FullPerm)))) (=> (not (and (U_2_bool (MapType2Select g (invRecv25 o_3@@27))) (and (< NoPerm FullPerm) (qpRange25 o_3@@27)))) (= (U_2_real (MapType1Select QPMask@24 o_3@@27 car)) (U_2_real (MapType1Select QPMask@15 o_3@@27 car))))))
 :qid |stdinbpl.2106:32|
 :skolemid |258|
 :pattern ( (MapType1Select QPMask@24 o_3@@27 car))
)) (forall ((o_3@@28 T@U) (f_5@@8 T@U) ) (! (let ((B@@20 (FieldTypeInv1 (type f_5@@8))))
(let ((A@@21 (FieldTypeInv0 (type f_5@@8))))
 (=> (and (and (= (type o_3@@28) RefType) (= (type f_5@@8) (FieldType A@@21 B@@20))) (not (= f_5@@8 car))) (= (U_2_real (MapType1Select QPMask@15 o_3@@28 f_5@@8)) (U_2_real (MapType1Select QPMask@24 o_3@@28 f_5@@8))))))
 :qid |stdinbpl.2112:39|
 :skolemid |259|
 :pattern ( (MapType1Select QPMask@24 o_3@@28 f_5@@8))
)))) (and (=> (= (ControlFlow 0 181) (- 0 182)) (forall ((n$0_8 T@U) (n$0_8_1 T@U) ) (!  (=> (and (= (type n$0_8) RefType) (= (type n$0_8_1) RefType)) (=> (and (and (and (and (not (= n$0_8 n$0_8_1)) (U_2_bool (MapType2Select g n$0_8))) (U_2_bool (MapType2Select g n$0_8_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$0_8 n$0_8_1))))
 :qid |stdinbpl.2124:27|
 :skolemid |260|
 :pattern ( (neverTriggered26 n$0_8) (neverTriggered26 n$0_8_1))
))) (=> (forall ((n$0_8@@0 T@U) (n$0_8_1@@0 T@U) ) (!  (=> (and (= (type n$0_8@@0) RefType) (= (type n$0_8_1@@0) RefType)) (=> (and (and (and (and (not (= n$0_8@@0 n$0_8_1@@0)) (U_2_bool (MapType2Select g n$0_8@@0))) (U_2_bool (MapType2Select g n$0_8_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$0_8@@0 n$0_8_1@@0))))
 :qid |stdinbpl.2124:27|
 :skolemid |260|
 :pattern ( (neverTriggered26 n$0_8@@0) (neverTriggered26 n$0_8_1@@0))
)) (=> (= (ControlFlow 0 181) (- 0 180)) (forall ((n$0_8@@1 T@U) ) (!  (=> (and (= (type n$0_8@@1) RefType) (U_2_bool (MapType2Select g n$0_8@@1))) (>= (U_2_real (MapType1Select QPMask@24 n$0_8@@1 cdr)) FullPerm))
 :qid |stdinbpl.2131:27|
 :skolemid |261|
 :pattern ( (MapType0Select ExhaleHeap@0 n$0_8@@1 cdr))
 :pattern ( (MapType1Select QPMask@25 n$0_8@@1 cdr))
 :pattern ( (MapType0Select ExhaleHeap@0 n$0_8@@1 cdr))
))))))))))))
(let ((anon224_Then_correct true))
(let ((anon236_Then_correct  (and (=> (= (ControlFlow 0 166) (- 0 169)) (forall ((n_27 T@U) (n_27_1 T@U) ) (!  (=> (and (= (type n_27) RefType) (= (type n_27_1) RefType)) (=> (and (and (and (and (not (= n_27 n_27_1)) (U_2_bool (MapType2Select g n_27))) (U_2_bool (MapType2Select g n_27_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_27 n_27_1))))
 :qid |stdinbpl.2517:37|
 :skolemid |308|
 :pattern ( (neverTriggered33 n_27) (neverTriggered33 n_27_1))
))) (=> (forall ((n_27@@0 T@U) (n_27_1@@0 T@U) ) (!  (=> (and (= (type n_27@@0) RefType) (= (type n_27_1@@0) RefType)) (=> (and (and (and (and (not (= n_27@@0 n_27_1@@0)) (U_2_bool (MapType2Select g n_27@@0))) (U_2_bool (MapType2Select g n_27_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_27@@0 n_27_1@@0))))
 :qid |stdinbpl.2517:37|
 :skolemid |308|
 :pattern ( (neverTriggered33 n_27@@0) (neverTriggered33 n_27_1@@0))
)) (and (=> (= (ControlFlow 0 166) (- 0 168)) (forall ((n_27@@1 T@U) ) (!  (=> (and (= (type n_27@@1) RefType) (U_2_bool (MapType2Select g n_27@@1))) (>= (U_2_real (MapType1Select QPMask@15 n_27@@1 car)) FullPerm))
 :qid |stdinbpl.2524:37|
 :skolemid |309|
 :pattern ( (MapType0Select ExhaleHeap@0 n_27@@1 car))
 :pattern ( (MapType1Select QPMask@30 n_27@@1 car))
 :pattern ( (MapType0Select ExhaleHeap@0 n_27@@1 car))
))) (=> (forall ((n_27@@2 T@U) ) (!  (=> (and (= (type n_27@@2) RefType) (U_2_bool (MapType2Select g n_27@@2))) (>= (U_2_real (MapType1Select QPMask@15 n_27@@2 car)) FullPerm))
 :qid |stdinbpl.2524:37|
 :skolemid |309|
 :pattern ( (MapType0Select ExhaleHeap@0 n_27@@2 car))
 :pattern ( (MapType1Select QPMask@30 n_27@@2 car))
 :pattern ( (MapType0Select ExhaleHeap@0 n_27@@2 car))
)) (=> (and (and (forall ((n_27@@3 T@U) ) (!  (=> (= (type n_27@@3) RefType) (=> (and (U_2_bool (MapType2Select g n_27@@3)) (< NoPerm FullPerm)) (and (qpRange33 n_27@@3) (= (invRecv33 n_27@@3) n_27@@3))))
 :qid |stdinbpl.2530:42|
 :skolemid |310|
 :pattern ( (MapType0Select ExhaleHeap@0 n_27@@3 car))
 :pattern ( (MapType1Select QPMask@30 n_27@@3 car))
 :pattern ( (MapType0Select ExhaleHeap@0 n_27@@3 car))
)) (forall ((o_3@@29 T@U) ) (!  (=> (= (type o_3@@29) RefType) (=> (and (U_2_bool (MapType2Select g (invRecv33 o_3@@29))) (and (< NoPerm FullPerm) (qpRange33 o_3@@29))) (= (invRecv33 o_3@@29) o_3@@29)))
 :qid |stdinbpl.2534:42|
 :skolemid |311|
 :pattern ( (invRecv33 o_3@@29))
))) (and (forall ((o_3@@30 T@U) ) (!  (=> (= (type o_3@@30) RefType) (and (=> (and (U_2_bool (MapType2Select g (invRecv33 o_3@@30))) (and (< NoPerm FullPerm) (qpRange33 o_3@@30))) (and (= (invRecv33 o_3@@30) o_3@@30) (= (U_2_real (MapType1Select QPMask@30 o_3@@30 car)) (- (U_2_real (MapType1Select QPMask@15 o_3@@30 car)) FullPerm)))) (=> (not (and (U_2_bool (MapType2Select g (invRecv33 o_3@@30))) (and (< NoPerm FullPerm) (qpRange33 o_3@@30)))) (= (U_2_real (MapType1Select QPMask@30 o_3@@30 car)) (U_2_real (MapType1Select QPMask@15 o_3@@30 car))))))
 :qid |stdinbpl.2540:42|
 :skolemid |312|
 :pattern ( (MapType1Select QPMask@30 o_3@@30 car))
)) (forall ((o_3@@31 T@U) (f_5@@9 T@U) ) (! (let ((B@@21 (FieldTypeInv1 (type f_5@@9))))
(let ((A@@22 (FieldTypeInv0 (type f_5@@9))))
 (=> (and (and (= (type o_3@@31) RefType) (= (type f_5@@9) (FieldType A@@22 B@@21))) (not (= f_5@@9 car))) (= (U_2_real (MapType1Select QPMask@15 o_3@@31 f_5@@9)) (U_2_real (MapType1Select QPMask@30 o_3@@31 f_5@@9))))))
 :qid |stdinbpl.2546:49|
 :skolemid |313|
 :pattern ( (MapType1Select QPMask@30 o_3@@31 f_5@@9))
)))) (and (=> (= (ControlFlow 0 166) (- 0 167)) (forall ((n$0_13 T@U) (n$0_13_1 T@U) ) (!  (=> (and (= (type n$0_13) RefType) (= (type n$0_13_1) RefType)) (=> (and (and (and (and (not (= n$0_13 n$0_13_1)) (U_2_bool (MapType2Select g n$0_13))) (U_2_bool (MapType2Select g n$0_13_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$0_13 n$0_13_1))))
 :qid |stdinbpl.2558:37|
 :skolemid |314|
 :pattern ( (neverTriggered34 n$0_13) (neverTriggered34 n$0_13_1))
))) (=> (forall ((n$0_13@@0 T@U) (n$0_13_1@@0 T@U) ) (!  (=> (and (= (type n$0_13@@0) RefType) (= (type n$0_13_1@@0) RefType)) (=> (and (and (and (and (not (= n$0_13@@0 n$0_13_1@@0)) (U_2_bool (MapType2Select g n$0_13@@0))) (U_2_bool (MapType2Select g n$0_13_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$0_13@@0 n$0_13_1@@0))))
 :qid |stdinbpl.2558:37|
 :skolemid |314|
 :pattern ( (neverTriggered34 n$0_13@@0) (neverTriggered34 n$0_13_1@@0))
)) (=> (= (ControlFlow 0 166) (- 0 165)) (forall ((n$0_13@@1 T@U) ) (!  (=> (and (= (type n$0_13@@1) RefType) (U_2_bool (MapType2Select g n$0_13@@1))) (>= (U_2_real (MapType1Select QPMask@30 n$0_13@@1 cdr)) FullPerm))
 :qid |stdinbpl.2565:37|
 :skolemid |315|
 :pattern ( (MapType0Select ExhaleHeap@0 n$0_13@@1 cdr))
 :pattern ( (MapType1Select QPMask@31 n$0_13@@1 cdr))
 :pattern ( (MapType0Select ExhaleHeap@0 n$0_13@@1 cdr))
))))))))))))
(let ((anon112_correct true))
(let ((anon235_Then_correct  (=> (and (U_2_bool (MapType2Select marked@1 n1_1)) (and (U_2_bool (MapType2Select g n2_1)) (and (not (U_2_bool (MapType2Select marked@1 n2_1))) (not (U_2_bool (MapType2Select pending@0 n2_1)))))) (and (=> (= (ControlFlow 0 170) 166) anon236_Then_correct) (=> (= (ControlFlow 0 170) 163) anon112_correct)))))
(let ((anon235_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select marked@1 n1_1)) (and (U_2_bool (MapType2Select g n2_1)) (and (not (U_2_bool (MapType2Select marked@1 n2_1))) (not (U_2_bool (MapType2Select pending@0 n2_1))))))) (= (ControlFlow 0 164) 163)) anon112_correct)))
(let ((anon232_Then_correct  (and (=> (= (ControlFlow 0 158) (- 0 161)) (forall ((n$0_11 T@U) (n$0_11_1 T@U) ) (!  (=> (and (= (type n$0_11) RefType) (= (type n$0_11_1) RefType)) (=> (and (and (and (and (not (= n$0_11 n$0_11_1)) (U_2_bool (MapType2Select g n$0_11))) (U_2_bool (MapType2Select g n$0_11_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$0_11 n$0_11_1))))
 :qid |stdinbpl.2415:35|
 :skolemid |295|
 :pattern ( (neverTriggered31 n$0_11) (neverTriggered31 n$0_11_1))
))) (=> (forall ((n$0_11@@0 T@U) (n$0_11_1@@0 T@U) ) (!  (=> (and (= (type n$0_11@@0) RefType) (= (type n$0_11_1@@0) RefType)) (=> (and (and (and (and (not (= n$0_11@@0 n$0_11_1@@0)) (U_2_bool (MapType2Select g n$0_11@@0))) (U_2_bool (MapType2Select g n$0_11_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$0_11@@0 n$0_11_1@@0))))
 :qid |stdinbpl.2415:35|
 :skolemid |295|
 :pattern ( (neverTriggered31 n$0_11@@0) (neverTriggered31 n$0_11_1@@0))
)) (and (=> (= (ControlFlow 0 158) (- 0 160)) (forall ((n$0_11@@1 T@U) ) (!  (=> (and (= (type n$0_11@@1) RefType) (U_2_bool (MapType2Select g n$0_11@@1))) (>= (U_2_real (MapType1Select QPMask@15 n$0_11@@1 car)) FullPerm))
 :qid |stdinbpl.2422:35|
 :skolemid |296|
 :pattern ( (MapType0Select ExhaleHeap@0 n$0_11@@1 car))
 :pattern ( (MapType1Select QPMask@32 n$0_11@@1 car))
 :pattern ( (MapType0Select ExhaleHeap@0 n$0_11@@1 car))
))) (=> (forall ((n$0_11@@2 T@U) ) (!  (=> (and (= (type n$0_11@@2) RefType) (U_2_bool (MapType2Select g n$0_11@@2))) (>= (U_2_real (MapType1Select QPMask@15 n$0_11@@2 car)) FullPerm))
 :qid |stdinbpl.2422:35|
 :skolemid |296|
 :pattern ( (MapType0Select ExhaleHeap@0 n$0_11@@2 car))
 :pattern ( (MapType1Select QPMask@32 n$0_11@@2 car))
 :pattern ( (MapType0Select ExhaleHeap@0 n$0_11@@2 car))
)) (=> (and (and (forall ((n$0_11@@3 T@U) ) (!  (=> (= (type n$0_11@@3) RefType) (=> (and (U_2_bool (MapType2Select g n$0_11@@3)) (< NoPerm FullPerm)) (and (qpRange31 n$0_11@@3) (= (invRecv31 n$0_11@@3) n$0_11@@3))))
 :qid |stdinbpl.2428:40|
 :skolemid |297|
 :pattern ( (MapType0Select ExhaleHeap@0 n$0_11@@3 car))
 :pattern ( (MapType1Select QPMask@32 n$0_11@@3 car))
 :pattern ( (MapType0Select ExhaleHeap@0 n$0_11@@3 car))
)) (forall ((o_3@@32 T@U) ) (!  (=> (= (type o_3@@32) RefType) (=> (and (U_2_bool (MapType2Select g (invRecv31 o_3@@32))) (and (< NoPerm FullPerm) (qpRange31 o_3@@32))) (= (invRecv31 o_3@@32) o_3@@32)))
 :qid |stdinbpl.2432:40|
 :skolemid |298|
 :pattern ( (invRecv31 o_3@@32))
))) (and (forall ((o_3@@33 T@U) ) (!  (=> (= (type o_3@@33) RefType) (and (=> (and (U_2_bool (MapType2Select g (invRecv31 o_3@@33))) (and (< NoPerm FullPerm) (qpRange31 o_3@@33))) (and (= (invRecv31 o_3@@33) o_3@@33) (= (U_2_real (MapType1Select QPMask@32 o_3@@33 car)) (- (U_2_real (MapType1Select QPMask@15 o_3@@33 car)) FullPerm)))) (=> (not (and (U_2_bool (MapType2Select g (invRecv31 o_3@@33))) (and (< NoPerm FullPerm) (qpRange31 o_3@@33)))) (= (U_2_real (MapType1Select QPMask@32 o_3@@33 car)) (U_2_real (MapType1Select QPMask@15 o_3@@33 car))))))
 :qid |stdinbpl.2438:40|
 :skolemid |299|
 :pattern ( (MapType1Select QPMask@32 o_3@@33 car))
)) (forall ((o_3@@34 T@U) (f_5@@10 T@U) ) (! (let ((B@@22 (FieldTypeInv1 (type f_5@@10))))
(let ((A@@23 (FieldTypeInv0 (type f_5@@10))))
 (=> (and (and (= (type o_3@@34) RefType) (= (type f_5@@10) (FieldType A@@23 B@@22))) (not (= f_5@@10 car))) (= (U_2_real (MapType1Select QPMask@15 o_3@@34 f_5@@10)) (U_2_real (MapType1Select QPMask@32 o_3@@34 f_5@@10))))))
 :qid |stdinbpl.2444:47|
 :skolemid |300|
 :pattern ( (MapType1Select QPMask@32 o_3@@34 f_5@@10))
)))) (and (=> (= (ControlFlow 0 158) (- 0 159)) (forall ((n$0_12 T@U) (n$0_12_1 T@U) ) (!  (=> (and (= (type n$0_12) RefType) (= (type n$0_12_1) RefType)) (=> (and (and (and (and (not (= n$0_12 n$0_12_1)) (U_2_bool (MapType2Select g n$0_12))) (U_2_bool (MapType2Select g n$0_12_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$0_12 n$0_12_1))))
 :qid |stdinbpl.2456:35|
 :skolemid |301|
 :pattern ( (neverTriggered32 n$0_12) (neverTriggered32 n$0_12_1))
))) (=> (forall ((n$0_12@@0 T@U) (n$0_12_1@@0 T@U) ) (!  (=> (and (= (type n$0_12@@0) RefType) (= (type n$0_12_1@@0) RefType)) (=> (and (and (and (and (not (= n$0_12@@0 n$0_12_1@@0)) (U_2_bool (MapType2Select g n$0_12@@0))) (U_2_bool (MapType2Select g n$0_12_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$0_12@@0 n$0_12_1@@0))))
 :qid |stdinbpl.2456:35|
 :skolemid |301|
 :pattern ( (neverTriggered32 n$0_12@@0) (neverTriggered32 n$0_12_1@@0))
)) (=> (= (ControlFlow 0 158) (- 0 157)) (forall ((n$0_12@@1 T@U) ) (!  (=> (and (= (type n$0_12@@1) RefType) (U_2_bool (MapType2Select g n$0_12@@1))) (>= (U_2_real (MapType1Select QPMask@32 n$0_12@@1 cdr)) FullPerm))
 :qid |stdinbpl.2463:35|
 :skolemid |302|
 :pattern ( (MapType0Select ExhaleHeap@0 n$0_12@@1 cdr))
 :pattern ( (MapType1Select QPMask@33 n$0_12@@1 cdr))
 :pattern ( (MapType0Select ExhaleHeap@0 n$0_12@@1 cdr))
))))))))))))
(let ((anon106_correct true))
(let ((anon231_Then_correct  (=> (or (U_2_bool (MapType2Select pending@0 n_16)) (U_2_bool (MapType2Select marked@1 n_16))) (and (=> (= (ControlFlow 0 162) 158) anon232_Then_correct) (=> (= (ControlFlow 0 162) 155) anon106_correct)))))
(let ((anon231_Else_correct  (=> (and (not (or (U_2_bool (MapType2Select pending@0 n_16)) (U_2_bool (MapType2Select marked@1 n_16)))) (= (ControlFlow 0 156) 155)) anon106_correct)))
(let ((anon228_Then_correct true))
(let ((anon226_Then_correct true))
(let ((anon113_correct true))
(let ((anon233_Then_correct  (=> (forall ((n_26 T@U) ) (!  (=> (and (= (type n_26) RefType) (or (U_2_bool (MapType2Select pending@0 n_26)) (U_2_bool (MapType2Select marked@1 n_26)))) (exists_spath ($$ ExhaleHeap@0 g) roots n_26))
 :qid |stdinbpl.2500:29|
 :skolemid |307|
 :pattern ( (exists_spath (|$$#frame| (CombineFrames (FrameFragment (int_2_U (|$$#condqp1| ExhaleHeap@0 g))) (FrameFragment (int_2_U (|$$#condqp2| ExhaleHeap@0 g)))) g) roots n_26))
)) (and (and (=> (= (ControlFlow 0 171) 148) anon113_correct) (=> (= (ControlFlow 0 171) 170) anon235_Then_correct)) (=> (= (ControlFlow 0 171) 164) anon235_Else_correct)))))
(let ((anon233_Else_correct  (=> (and (not (forall ((n_26@@0 T@U) ) (!  (=> (and (= (type n_26@@0) RefType) (or (U_2_bool (MapType2Select pending@0 n_26@@0)) (U_2_bool (MapType2Select marked@1 n_26@@0)))) (exists_spath ($$ ExhaleHeap@0 g) roots n_26@@0))
 :qid |stdinbpl.2500:29|
 :skolemid |307|
 :pattern ( (exists_spath (|$$#frame| (CombineFrames (FrameFragment (int_2_U (|$$#condqp1| ExhaleHeap@0 g))) (FrameFragment (int_2_U (|$$#condqp2| ExhaleHeap@0 g)))) g) roots n_26@@0))
))) (= (ControlFlow 0 154) 148)) anon113_correct)))
(let ((anon229_Then_correct  (=> (forall ((n_24 T@U) ) (!  (=> (and (= (type n_24) RefType) (U_2_bool (MapType2Select g n_24))) (not (and (U_2_bool (MapType2Select marked@1 n_24)) (U_2_bool (MapType2Select pending@0 n_24)))))
 :qid |stdinbpl.2398:27|
 :skolemid |294|
 :pattern ( (MapType2Select pending@0 n_24))
)) (and (and (and (=> (= (ControlFlow 0 172) 171) anon233_Then_correct) (=> (= (ControlFlow 0 172) 154) anon233_Else_correct)) (=> (= (ControlFlow 0 172) 162) anon231_Then_correct)) (=> (= (ControlFlow 0 172) 156) anon231_Else_correct)))))
(let ((anon229_Else_correct  (=> (and (not (forall ((n_24@@0 T@U) ) (!  (=> (and (= (type n_24@@0) RefType) (U_2_bool (MapType2Select g n_24@@0))) (not (and (U_2_bool (MapType2Select marked@1 n_24@@0)) (U_2_bool (MapType2Select pending@0 n_24@@0)))))
 :qid |stdinbpl.2398:27|
 :skolemid |294|
 :pattern ( (MapType2Select pending@0 n_24@@0))
))) (= (ControlFlow 0 153) 148)) anon113_correct)))
(let ((anon227_Then_correct  (=> (forall ((n_22 T@U) ) (!  (=> (and (= (type n_22) RefType) (U_2_bool (MapType2Select roots n_22))) (or (U_2_bool (MapType2Select marked@1 n_22)) (U_2_bool (MapType2Select pending@0 n_22))))
 :qid |stdinbpl.2391:25|
 :skolemid |293|
 :pattern ( (MapType2Select pending@0 n_22))
 :pattern ( (MapType2Select marked@1 n_22))
)) (and (and (=> (= (ControlFlow 0 173) 152) anon228_Then_correct) (=> (= (ControlFlow 0 173) 172) anon229_Then_correct)) (=> (= (ControlFlow 0 173) 153) anon229_Else_correct)))))
(let ((anon227_Else_correct  (=> (and (not (forall ((n_22@@0 T@U) ) (!  (=> (and (= (type n_22@@0) RefType) (U_2_bool (MapType2Select roots n_22@@0))) (or (U_2_bool (MapType2Select marked@1 n_22@@0)) (U_2_bool (MapType2Select pending@0 n_22@@0))))
 :qid |stdinbpl.2391:25|
 :skolemid |293|
 :pattern ( (MapType2Select pending@0 n_22@@0))
 :pattern ( (MapType2Select marked@1 n_22@@0))
))) (= (ControlFlow 0 151) 148)) anon113_correct)))
(let ((anon225_Then_correct  (=> (not (and (forall ((n_19 T@U) ) (!  (=> (= (type n_19) RefType) (= (U_2_bool (MapType2Select roots n_19)) (U_2_bool (MapType2Select pending@0 n_19))))
 :qid |stdinbpl.2381:25|
 :skolemid |291|
 :pattern ( (MapType2Select pending@0 n_19))
 :pattern ( (MapType2Select roots n_19))
)) (forall ((n_20 T@U) ) (!  (=> (and (= (type n_20) RefType) (U_2_bool (MapType2Select g n_20))) (not (U_2_bool (MapType2Select marked@1 n_20))))
 :qid |stdinbpl.2384:24|
 :skolemid |292|
 :pattern ( (MapType2Select marked@1 n_20))
)))) (and (and (=> (= (ControlFlow 0 174) 150) anon226_Then_correct) (=> (= (ControlFlow 0 174) 173) anon227_Then_correct)) (=> (= (ControlFlow 0 174) 151) anon227_Else_correct)))))
(let ((anon225_Else_correct  (=> (and (and (forall ((n_19@@0 T@U) ) (!  (=> (= (type n_19@@0) RefType) (= (U_2_bool (MapType2Select roots n_19@@0)) (U_2_bool (MapType2Select pending@0 n_19@@0))))
 :qid |stdinbpl.2381:25|
 :skolemid |291|
 :pattern ( (MapType2Select pending@0 n_19@@0))
 :pattern ( (MapType2Select roots n_19@@0))
)) (forall ((n_20@@0 T@U) ) (!  (=> (and (= (type n_20@@0) RefType) (U_2_bool (MapType2Select g n_20@@0))) (not (U_2_bool (MapType2Select marked@1 n_20@@0))))
 :qid |stdinbpl.2384:24|
 :skolemid |292|
 :pattern ( (MapType2Select marked@1 n_20@@0))
))) (= (ControlFlow 0 149) 148)) anon113_correct)))
(let ((anon223_Then_correct  (=> (forall ((n_17 T@U) ) (!  (=> (= (type n_17) RefType) (= (U_2_bool (MapType2Select roots n_17)) (U_2_bool (MapType2Select pending@0 n_17))))
 :qid |stdinbpl.2373:23|
 :skolemid |290|
 :pattern ( (MapType2Select pending@0 n_17))
 :pattern ( (MapType2Select roots n_17))
)) (and (and (=> (= (ControlFlow 0 177) 176) anon224_Then_correct) (=> (= (ControlFlow 0 177) 174) anon225_Then_correct)) (=> (= (ControlFlow 0 177) 149) anon225_Else_correct)))))
(let ((anon223_Else_correct  (=> (not (forall ((n_17@@0 T@U) ) (!  (=> (= (type n_17@@0) RefType) (= (U_2_bool (MapType2Select roots n_17@@0)) (U_2_bool (MapType2Select pending@0 n_17@@0))))
 :qid |stdinbpl.2373:23|
 :skolemid |290|
 :pattern ( (MapType2Select pending@0 n_17@@0))
 :pattern ( (MapType2Select roots n_17@@0))
))) (and (=> (= (ControlFlow 0 175) 174) anon225_Then_correct) (=> (= (ControlFlow 0 175) 149) anon225_Else_correct)))))
(let ((anon222_Then_correct true))
(let ((anon90_correct  (=> (and (state ExhaleHeap@0 QPMask@15) (state ExhaleHeap@0 QPMask@15)) (and (and (=> (= (ControlFlow 0 178) 147) anon222_Then_correct) (=> (= (ControlFlow 0 178) 177) anon223_Then_correct)) (=> (= (ControlFlow 0 178) 175) anon223_Else_correct)))))
(let ((anon221_Else_correct  (and (=> (= (ControlFlow 0 191) (- 0 192)) (HasDirectPerm QPMask@15 x_1@1 car)) (=> (HasDirectPerm QPMask@15 x_1@1 car) (=> (and (exists_path ($$ ExhaleHeap@0 g) x_1@1 (MapType0Select ExhaleHeap@0 x_1@1 car)) (= (ControlFlow 0 191) 178)) anon90_correct)))))
(let ((anon220_Then_correct  (=> (and (and (U_2_bool (MapType2Select ($$ ExhaleHeap@0 g) (create_edge x_1@1 (MapType0Select ExhaleHeap@0 x_1@1 car)))) (exists_path ($$ ExhaleHeap@0 g) (MapType0Select ExhaleHeap@0 x_1@1 car) (MapType0Select ExhaleHeap@0 x_1@1 car))) (state ExhaleHeap@0 QPMask@15)) (and (=> (= (ControlFlow 0 193) 187) anon221_Then_correct) (=> (= (ControlFlow 0 193) 191) anon221_Else_correct)))))
(let ((anon220_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select ($$ ExhaleHeap@0 g) (create_edge x_1@1 (MapType0Select ExhaleHeap@0 x_1@1 car)))) (exists_path ($$ ExhaleHeap@0 g) (MapType0Select ExhaleHeap@0 x_1@1 car) (MapType0Select ExhaleHeap@0 x_1@1 car)))) (= (ControlFlow 0 185) 178)) anon90_correct)))
(let ((anon219_Else_correct  (and (=> (= (ControlFlow 0 200) (- 0 202)) (HasDirectPerm QPMask@15 x_1@1 car)) (=> (HasDirectPerm QPMask@15 x_1@1 car) (and (=> (= (ControlFlow 0 200) (- 0 201)) (HasDirectPerm QPMask@15 x_1@1 car)) (=> (HasDirectPerm QPMask@15 x_1@1 car) (and (=> (= (ControlFlow 0 200) 193) anon220_Then_correct) (=> (= (ControlFlow 0 200) 185) anon220_Else_correct))))))))
(let ((anon218_Then_correct  (=> (U_2_bool (MapType2Select ($$ ExhaleHeap@0 g) (create_edge x_1@1 (MapType0Select ExhaleHeap@0 x_1@1 car)))) (and (=> (= (ControlFlow 0 203) 196) anon219_Then_correct) (=> (= (ControlFlow 0 203) 200) anon219_Else_correct)))))
(let ((anon218_Else_correct  (=> (not (U_2_bool (MapType2Select ($$ ExhaleHeap@0 g) (create_edge x_1@1 (MapType0Select ExhaleHeap@0 x_1@1 car))))) (and (=> (= (ControlFlow 0 194) 193) anon220_Then_correct) (=> (= (ControlFlow 0 194) 185) anon220_Else_correct)))))
(let ((anon216_Then_correct  (=> (not (= (MapType0Select ExhaleHeap@0 x_1@1 car) null)) (and (=> (= (ControlFlow 0 204) (- 0 205)) (HasDirectPerm QPMask@15 x_1@1 car)) (=> (HasDirectPerm QPMask@15 x_1@1 car) (and (and (=> (= (ControlFlow 0 204) 181) anon217_Then_correct) (=> (= (ControlFlow 0 204) 203) anon218_Then_correct)) (=> (= (ControlFlow 0 204) 194) anon218_Else_correct)))))))
(let ((anon216_Else_correct  (=> (and (= (MapType0Select ExhaleHeap@0 x_1@1 car) null) (= (ControlFlow 0 179) 178)) anon90_correct)))
(let ((anon79_correct  (and (=> (= (ControlFlow 0 206) (- 0 207)) (HasDirectPerm QPMask@15 x_1@1 car)) (=> (HasDirectPerm QPMask@15 x_1@1 car) (and (=> (= (ControlFlow 0 206) 204) anon216_Then_correct) (=> (= (ControlFlow 0 206) 179) anon216_Else_correct))))))
(let ((anon215_Else_correct  (and (=> (= (ControlFlow 0 220) (- 0 221)) (HasDirectPerm QPMask@15 x_1@1 cdr)) (=> (HasDirectPerm QPMask@15 x_1@1 cdr) (=> (and (exists_path ($$ ExhaleHeap@0 g) x_1@1 (MapType0Select ExhaleHeap@0 x_1@1 cdr)) (= (ControlFlow 0 220) 206)) anon79_correct)))))
(let ((anon214_Then_correct  (=> (and (and (U_2_bool (MapType2Select ($$ ExhaleHeap@0 g) (create_edge x_1@1 (MapType0Select ExhaleHeap@0 x_1@1 cdr)))) (exists_path ($$ ExhaleHeap@0 g) (MapType0Select ExhaleHeap@0 x_1@1 cdr) (MapType0Select ExhaleHeap@0 x_1@1 cdr))) (state ExhaleHeap@0 QPMask@15)) (and (=> (= (ControlFlow 0 222) 216) anon215_Then_correct) (=> (= (ControlFlow 0 222) 220) anon215_Else_correct)))))
(let ((anon214_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select ($$ ExhaleHeap@0 g) (create_edge x_1@1 (MapType0Select ExhaleHeap@0 x_1@1 cdr)))) (exists_path ($$ ExhaleHeap@0 g) (MapType0Select ExhaleHeap@0 x_1@1 cdr) (MapType0Select ExhaleHeap@0 x_1@1 cdr)))) (= (ControlFlow 0 214) 206)) anon79_correct)))
(let ((anon213_Else_correct  (and (=> (= (ControlFlow 0 229) (- 0 231)) (HasDirectPerm QPMask@15 x_1@1 cdr)) (=> (HasDirectPerm QPMask@15 x_1@1 cdr) (and (=> (= (ControlFlow 0 229) (- 0 230)) (HasDirectPerm QPMask@15 x_1@1 cdr)) (=> (HasDirectPerm QPMask@15 x_1@1 cdr) (and (=> (= (ControlFlow 0 229) 222) anon214_Then_correct) (=> (= (ControlFlow 0 229) 214) anon214_Else_correct))))))))
(let ((anon212_Then_correct  (=> (U_2_bool (MapType2Select ($$ ExhaleHeap@0 g) (create_edge x_1@1 (MapType0Select ExhaleHeap@0 x_1@1 cdr)))) (and (=> (= (ControlFlow 0 232) 225) anon213_Then_correct) (=> (= (ControlFlow 0 232) 229) anon213_Else_correct)))))
(let ((anon212_Else_correct  (=> (not (U_2_bool (MapType2Select ($$ ExhaleHeap@0 g) (create_edge x_1@1 (MapType0Select ExhaleHeap@0 x_1@1 cdr))))) (and (=> (= (ControlFlow 0 223) 222) anon214_Then_correct) (=> (= (ControlFlow 0 223) 214) anon214_Else_correct)))))
(let ((anon210_Then_correct  (=> (not (= (MapType0Select ExhaleHeap@0 x_1@1 cdr) null)) (and (=> (= (ControlFlow 0 233) (- 0 234)) (HasDirectPerm QPMask@15 x_1@1 cdr)) (=> (HasDirectPerm QPMask@15 x_1@1 cdr) (and (and (=> (= (ControlFlow 0 233) 210) anon211_Then_correct) (=> (= (ControlFlow 0 233) 232) anon212_Then_correct)) (=> (= (ControlFlow 0 233) 223) anon212_Else_correct)))))))
(let ((anon210_Else_correct  (=> (and (= (MapType0Select ExhaleHeap@0 x_1@1 cdr) null) (= (ControlFlow 0 208) 206)) anon79_correct)))
(let ((anon209_Else_correct  (=> (exists_spath ($$ ExhaleHeap@0 g) roots x_1@1) (and (=> (= (ControlFlow 0 235) (- 0 236)) (HasDirectPerm QPMask@15 x_1@1 cdr)) (=> (HasDirectPerm QPMask@15 x_1@1 cdr) (and (=> (= (ControlFlow 0 235) 233) anon210_Then_correct) (=> (= (ControlFlow 0 235) 208) anon210_Else_correct)))))))
(let ((anon209_Then_correct  (and (=> (= (ControlFlow 0 143) (- 0 146)) (forall ((n_9 T@U) (n_9_1 T@U) ) (!  (=> (and (= (type n_9) RefType) (= (type n_9_1) RefType)) (=> (and (and (and (and (not (= n_9 n_9_1)) (U_2_bool (MapType2Select g n_9))) (U_2_bool (MapType2Select g n_9_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_9 n_9_1))))
 :qid |stdinbpl.1677:25|
 :skolemid |206|
 :pattern ( (neverTriggered17 n_9) (neverTriggered17 n_9_1))
))) (=> (forall ((n_9@@0 T@U) (n_9_1@@0 T@U) ) (!  (=> (and (= (type n_9@@0) RefType) (= (type n_9_1@@0) RefType)) (=> (and (and (and (and (not (= n_9@@0 n_9_1@@0)) (U_2_bool (MapType2Select g n_9@@0))) (U_2_bool (MapType2Select g n_9_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_9@@0 n_9_1@@0))))
 :qid |stdinbpl.1677:25|
 :skolemid |206|
 :pattern ( (neverTriggered17 n_9@@0) (neverTriggered17 n_9_1@@0))
)) (and (=> (= (ControlFlow 0 143) (- 0 145)) (forall ((n_9@@1 T@U) ) (!  (=> (and (= (type n_9@@1) RefType) (U_2_bool (MapType2Select g n_9@@1))) (>= (U_2_real (MapType1Select QPMask@15 n_9@@1 car)) FullPerm))
 :qid |stdinbpl.1684:25|
 :skolemid |207|
 :pattern ( (MapType0Select ExhaleHeap@0 n_9@@1 car))
 :pattern ( (MapType1Select QPMask@16 n_9@@1 car))
 :pattern ( (MapType0Select ExhaleHeap@0 n_9@@1 car))
))) (=> (forall ((n_9@@2 T@U) ) (!  (=> (and (= (type n_9@@2) RefType) (U_2_bool (MapType2Select g n_9@@2))) (>= (U_2_real (MapType1Select QPMask@15 n_9@@2 car)) FullPerm))
 :qid |stdinbpl.1684:25|
 :skolemid |207|
 :pattern ( (MapType0Select ExhaleHeap@0 n_9@@2 car))
 :pattern ( (MapType1Select QPMask@16 n_9@@2 car))
 :pattern ( (MapType0Select ExhaleHeap@0 n_9@@2 car))
)) (=> (and (and (forall ((n_9@@3 T@U) ) (!  (=> (= (type n_9@@3) RefType) (=> (and (U_2_bool (MapType2Select g n_9@@3)) (< NoPerm FullPerm)) (and (qpRange17 n_9@@3) (= (invRecv17 n_9@@3) n_9@@3))))
 :qid |stdinbpl.1690:30|
 :skolemid |208|
 :pattern ( (MapType0Select ExhaleHeap@0 n_9@@3 car))
 :pattern ( (MapType1Select QPMask@16 n_9@@3 car))
 :pattern ( (MapType0Select ExhaleHeap@0 n_9@@3 car))
)) (forall ((o_3@@35 T@U) ) (!  (=> (= (type o_3@@35) RefType) (=> (and (U_2_bool (MapType2Select g (invRecv17 o_3@@35))) (and (< NoPerm FullPerm) (qpRange17 o_3@@35))) (= (invRecv17 o_3@@35) o_3@@35)))
 :qid |stdinbpl.1694:30|
 :skolemid |209|
 :pattern ( (invRecv17 o_3@@35))
))) (and (forall ((o_3@@36 T@U) ) (!  (=> (= (type o_3@@36) RefType) (and (=> (and (U_2_bool (MapType2Select g (invRecv17 o_3@@36))) (and (< NoPerm FullPerm) (qpRange17 o_3@@36))) (and (= (invRecv17 o_3@@36) o_3@@36) (= (U_2_real (MapType1Select QPMask@16 o_3@@36 car)) (- (U_2_real (MapType1Select QPMask@15 o_3@@36 car)) FullPerm)))) (=> (not (and (U_2_bool (MapType2Select g (invRecv17 o_3@@36))) (and (< NoPerm FullPerm) (qpRange17 o_3@@36)))) (= (U_2_real (MapType1Select QPMask@16 o_3@@36 car)) (U_2_real (MapType1Select QPMask@15 o_3@@36 car))))))
 :qid |stdinbpl.1700:30|
 :skolemid |210|
 :pattern ( (MapType1Select QPMask@16 o_3@@36 car))
)) (forall ((o_3@@37 T@U) (f_5@@11 T@U) ) (! (let ((B@@23 (FieldTypeInv1 (type f_5@@11))))
(let ((A@@24 (FieldTypeInv0 (type f_5@@11))))
 (=> (and (and (= (type o_3@@37) RefType) (= (type f_5@@11) (FieldType A@@24 B@@23))) (not (= f_5@@11 car))) (= (U_2_real (MapType1Select QPMask@15 o_3@@37 f_5@@11)) (U_2_real (MapType1Select QPMask@16 o_3@@37 f_5@@11))))))
 :qid |stdinbpl.1706:37|
 :skolemid |211|
 :pattern ( (MapType1Select QPMask@16 o_3@@37 f_5@@11))
)))) (and (=> (= (ControlFlow 0 143) (- 0 144)) (forall ((n$0_4 T@U) (n$0_4_1 T@U) ) (!  (=> (and (= (type n$0_4) RefType) (= (type n$0_4_1) RefType)) (=> (and (and (and (and (not (= n$0_4 n$0_4_1)) (U_2_bool (MapType2Select g n$0_4))) (U_2_bool (MapType2Select g n$0_4_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$0_4 n$0_4_1))))
 :qid |stdinbpl.1718:25|
 :skolemid |212|
 :pattern ( (neverTriggered18 n$0_4) (neverTriggered18 n$0_4_1))
))) (=> (forall ((n$0_4@@0 T@U) (n$0_4_1@@0 T@U) ) (!  (=> (and (= (type n$0_4@@0) RefType) (= (type n$0_4_1@@0) RefType)) (=> (and (and (and (and (not (= n$0_4@@0 n$0_4_1@@0)) (U_2_bool (MapType2Select g n$0_4@@0))) (U_2_bool (MapType2Select g n$0_4_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$0_4@@0 n$0_4_1@@0))))
 :qid |stdinbpl.1718:25|
 :skolemid |212|
 :pattern ( (neverTriggered18 n$0_4@@0) (neverTriggered18 n$0_4_1@@0))
)) (=> (= (ControlFlow 0 143) (- 0 142)) (forall ((n$0_4@@1 T@U) ) (!  (=> (and (= (type n$0_4@@1) RefType) (U_2_bool (MapType2Select g n$0_4@@1))) (>= (U_2_real (MapType1Select QPMask@16 n$0_4@@1 cdr)) FullPerm))
 :qid |stdinbpl.1725:25|
 :skolemid |213|
 :pattern ( (MapType0Select ExhaleHeap@0 n$0_4@@1 cdr))
 :pattern ( (MapType1Select QPMask@17 n$0_4@@1 cdr))
 :pattern ( (MapType0Select ExhaleHeap@0 n$0_4@@1 cdr))
))))))))))))
(let ((anon207_Else_correct  (=> (forall ((n$8_3 T@U) ) (!  (=> (and (= (type n$8_3) RefType) (U_2_bool (MapType2Select g n$8_3))) (U_2_bool (MapType2Select g (MapType0Select ExhaleHeap@0 n$8_3 cdr))))
 :qid |stdinbpl.1652:24|
 :skolemid |205|
 :pattern ( (MapType2Select g (MapType0Select ExhaleHeap@0 n$8_3 cdr)))
 :pattern ( (MapType2Select g n$8_3) (MapType0Select ExhaleHeap@0 n$8_3 cdr))
)) (=> (and (and (and (state ExhaleHeap@0 QPMask@15) (U_2_bool (MapType2Select g x_1@1))) (and (state ExhaleHeap@0 QPMask@15) (|Set#Subset| pending@0 g))) (and (and (state ExhaleHeap@0 QPMask@15) (|Set#Subset| marked@1 g)) (and (state ExhaleHeap@0 QPMask@15) (state ExhaleHeap@0 QPMask@15)))) (and (=> (= (ControlFlow 0 237) 143) anon209_Then_correct) (=> (= (ControlFlow 0 237) 235) anon209_Else_correct))))))
(let ((anon65_correct true))
(let ((anon208_Else_correct  (=> (and (not (U_2_bool (MapType2Select g n$8_1))) (= (ControlFlow 0 141) 138)) anon65_correct)))
(let ((anon208_Then_correct  (=> (U_2_bool (MapType2Select g n$8_1)) (and (=> (= (ControlFlow 0 139) (- 0 140)) (HasDirectPerm QPMask@15 n$8_1 cdr)) (=> (HasDirectPerm QPMask@15 n$8_1 cdr) (=> (= (ControlFlow 0 139) 138) anon65_correct))))))
(let ((anon205_Else_correct  (=> (forall ((n$7_3 T@U) ) (!  (=> (and (= (type n$7_3) RefType) (U_2_bool (MapType2Select g n$7_3))) (U_2_bool (MapType2Select g (MapType0Select ExhaleHeap@0 n$7_3 car))))
 :qid |stdinbpl.1639:24|
 :skolemid |204|
 :pattern ( (MapType2Select g (MapType0Select ExhaleHeap@0 n$7_3 car)))
 :pattern ( (MapType2Select g n$7_3) (MapType0Select ExhaleHeap@0 n$7_3 car))
)) (and (and (=> (= (ControlFlow 0 238) 237) anon207_Else_correct) (=> (= (ControlFlow 0 238) 139) anon208_Then_correct)) (=> (= (ControlFlow 0 238) 141) anon208_Else_correct)))))
(let ((anon61_correct true))
(let ((anon206_Else_correct  (=> (and (not (U_2_bool (MapType2Select g n$7_1))) (= (ControlFlow 0 137) 134)) anon61_correct)))
(let ((anon206_Then_correct  (=> (U_2_bool (MapType2Select g n$7_1)) (and (=> (= (ControlFlow 0 135) (- 0 136)) (HasDirectPerm QPMask@15 n$7_1 car)) (=> (HasDirectPerm QPMask@15 n$7_1 car) (=> (= (ControlFlow 0 135) 134) anon61_correct))))))
(let ((anon204_Else_correct  (and (=> (= (ControlFlow 0 239) (- 0 240)) (forall ((n$10_2 T@U) (n$10_2_1 T@U) ) (!  (=> (and (= (type n$10_2) RefType) (= (type n$10_2_1) RefType)) (=> (and (and (and (and (not (= n$10_2 n$10_2_1)) (U_2_bool (MapType2Select g n$10_2))) (U_2_bool (MapType2Select g n$10_2_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$10_2 n$10_2_1))))
 :qid |stdinbpl.1598:19|
 :skolemid |198|
 :no-pattern (type n$10_2)
 :no-pattern (type n$10_2_1)
 :no-pattern (U_2_int n$10_2)
 :no-pattern (U_2_bool n$10_2)
 :no-pattern (U_2_int n$10_2_1)
 :no-pattern (U_2_bool n$10_2_1)
))) (=> (forall ((n$10_2@@0 T@U) (n$10_2_1@@0 T@U) ) (!  (=> (and (= (type n$10_2@@0) RefType) (= (type n$10_2_1@@0) RefType)) (=> (and (and (and (and (not (= n$10_2@@0 n$10_2_1@@0)) (U_2_bool (MapType2Select g n$10_2@@0))) (U_2_bool (MapType2Select g n$10_2_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$10_2@@0 n$10_2_1@@0))))
 :qid |stdinbpl.1598:19|
 :skolemid |198|
 :no-pattern (type n$10_2@@0)
 :no-pattern (type n$10_2_1@@0)
 :no-pattern (U_2_int n$10_2@@0)
 :no-pattern (U_2_bool n$10_2@@0)
 :no-pattern (U_2_int n$10_2_1@@0)
 :no-pattern (U_2_bool n$10_2_1@@0)
)) (=> (and (forall ((n$10_2@@1 T@U) ) (!  (=> (= (type n$10_2@@1) RefType) (=> (and (U_2_bool (MapType2Select g n$10_2@@1)) (< NoPerm FullPerm)) (and (qpRange16 n$10_2@@1) (= (invRecv16 n$10_2@@1) n$10_2@@1))))
 :qid |stdinbpl.1604:26|
 :skolemid |199|
 :pattern ( (MapType0Select ExhaleHeap@0 n$10_2@@1 cdr))
 :pattern ( (MapType1Select QPMask@15 n$10_2@@1 cdr))
 :pattern ( (MapType0Select ExhaleHeap@0 n$10_2@@1 cdr))
)) (forall ((o_3@@38 T@U) ) (!  (=> (= (type o_3@@38) RefType) (=> (and (and (U_2_bool (MapType2Select g (invRecv16 o_3@@38))) (< NoPerm FullPerm)) (qpRange16 o_3@@38)) (= (invRecv16 o_3@@38) o_3@@38)))
 :qid |stdinbpl.1608:26|
 :skolemid |200|
 :pattern ( (invRecv16 o_3@@38))
))) (=> (and (and (forall ((n$10_2@@2 T@U) ) (!  (=> (and (= (type n$10_2@@2) RefType) (U_2_bool (MapType2Select g n$10_2@@2))) (not (= n$10_2@@2 null)))
 :qid |stdinbpl.1614:26|
 :skolemid |201|
 :pattern ( (MapType0Select ExhaleHeap@0 n$10_2@@2 cdr))
 :pattern ( (MapType1Select QPMask@15 n$10_2@@2 cdr))
 :pattern ( (MapType0Select ExhaleHeap@0 n$10_2@@2 cdr))
)) (forall ((o_3@@39 T@U) ) (!  (=> (= (type o_3@@39) RefType) (and (=> (and (and (U_2_bool (MapType2Select g (invRecv16 o_3@@39))) (< NoPerm FullPerm)) (qpRange16 o_3@@39)) (and (=> (< NoPerm FullPerm) (= (invRecv16 o_3@@39) o_3@@39)) (= (U_2_real (MapType1Select QPMask@15 o_3@@39 cdr)) (+ (U_2_real (MapType1Select QPMask@14 o_3@@39 cdr)) FullPerm)))) (=> (not (and (and (U_2_bool (MapType2Select g (invRecv16 o_3@@39))) (< NoPerm FullPerm)) (qpRange16 o_3@@39))) (= (U_2_real (MapType1Select QPMask@15 o_3@@39 cdr)) (U_2_real (MapType1Select QPMask@14 o_3@@39 cdr))))))
 :qid |stdinbpl.1620:26|
 :skolemid |202|
 :pattern ( (MapType1Select QPMask@15 o_3@@39 cdr))
))) (and (forall ((o_3@@40 T@U) (f_5@@12 T@U) ) (! (let ((B@@24 (FieldTypeInv1 (type f_5@@12))))
(let ((A@@25 (FieldTypeInv0 (type f_5@@12))))
 (=> (and (and (= (type o_3@@40) RefType) (= (type f_5@@12) (FieldType A@@25 B@@24))) (not (= f_5@@12 cdr))) (= (U_2_real (MapType1Select QPMask@14 o_3@@40 f_5@@12)) (U_2_real (MapType1Select QPMask@15 o_3@@40 f_5@@12))))))
 :qid |stdinbpl.1624:33|
 :skolemid |203|
 :pattern ( (MapType1Select QPMask@14 o_3@@40 f_5@@12))
 :pattern ( (MapType1Select QPMask@15 o_3@@40 f_5@@12))
)) (state ExhaleHeap@0 QPMask@15))) (and (and (=> (= (ControlFlow 0 239) 238) anon205_Else_correct) (=> (= (ControlFlow 0 239) 135) anon206_Then_correct)) (=> (= (ControlFlow 0 239) 137) anon206_Else_correct))))))))
(let ((anon204_Then_correct true))
(let ((anon203_Else_correct  (and (=> (= (ControlFlow 0 241) (- 0 242)) (forall ((n$9_2 T@U) (n$9_2_1 T@U) ) (!  (=> (and (= (type n$9_2) RefType) (= (type n$9_2_1) RefType)) (=> (and (and (and (and (not (= n$9_2 n$9_2_1)) (U_2_bool (MapType2Select g n$9_2))) (U_2_bool (MapType2Select g n$9_2_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$9_2 n$9_2_1))))
 :qid |stdinbpl.1559:19|
 :skolemid |192|
 :no-pattern (type n$9_2)
 :no-pattern (type n$9_2_1)
 :no-pattern (U_2_int n$9_2)
 :no-pattern (U_2_bool n$9_2)
 :no-pattern (U_2_int n$9_2_1)
 :no-pattern (U_2_bool n$9_2_1)
))) (=> (forall ((n$9_2@@0 T@U) (n$9_2_1@@0 T@U) ) (!  (=> (and (= (type n$9_2@@0) RefType) (= (type n$9_2_1@@0) RefType)) (=> (and (and (and (and (not (= n$9_2@@0 n$9_2_1@@0)) (U_2_bool (MapType2Select g n$9_2@@0))) (U_2_bool (MapType2Select g n$9_2_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$9_2@@0 n$9_2_1@@0))))
 :qid |stdinbpl.1559:19|
 :skolemid |192|
 :no-pattern (type n$9_2@@0)
 :no-pattern (type n$9_2_1@@0)
 :no-pattern (U_2_int n$9_2@@0)
 :no-pattern (U_2_bool n$9_2@@0)
 :no-pattern (U_2_int n$9_2_1@@0)
 :no-pattern (U_2_bool n$9_2_1@@0)
)) (=> (and (forall ((n$9_2@@1 T@U) ) (!  (=> (= (type n$9_2@@1) RefType) (=> (and (U_2_bool (MapType2Select g n$9_2@@1)) (< NoPerm FullPerm)) (and (qpRange15 n$9_2@@1) (= (invRecv15 n$9_2@@1) n$9_2@@1))))
 :qid |stdinbpl.1565:26|
 :skolemid |193|
 :pattern ( (MapType0Select ExhaleHeap@0 n$9_2@@1 car))
 :pattern ( (MapType1Select QPMask@14 n$9_2@@1 car))
 :pattern ( (MapType0Select ExhaleHeap@0 n$9_2@@1 car))
)) (forall ((o_3@@41 T@U) ) (!  (=> (= (type o_3@@41) RefType) (=> (and (and (U_2_bool (MapType2Select g (invRecv15 o_3@@41))) (< NoPerm FullPerm)) (qpRange15 o_3@@41)) (= (invRecv15 o_3@@41) o_3@@41)))
 :qid |stdinbpl.1569:26|
 :skolemid |194|
 :pattern ( (invRecv15 o_3@@41))
))) (=> (and (and (forall ((n$9_2@@2 T@U) ) (!  (=> (and (= (type n$9_2@@2) RefType) (U_2_bool (MapType2Select g n$9_2@@2))) (not (= n$9_2@@2 null)))
 :qid |stdinbpl.1575:26|
 :skolemid |195|
 :pattern ( (MapType0Select ExhaleHeap@0 n$9_2@@2 car))
 :pattern ( (MapType1Select QPMask@14 n$9_2@@2 car))
 :pattern ( (MapType0Select ExhaleHeap@0 n$9_2@@2 car))
)) (forall ((o_3@@42 T@U) ) (!  (=> (= (type o_3@@42) RefType) (and (=> (and (and (U_2_bool (MapType2Select g (invRecv15 o_3@@42))) (< NoPerm FullPerm)) (qpRange15 o_3@@42)) (and (=> (< NoPerm FullPerm) (= (invRecv15 o_3@@42) o_3@@42)) (= (U_2_real (MapType1Select QPMask@14 o_3@@42 car)) (+ (U_2_real (MapType1Select QPMask@3 o_3@@42 car)) FullPerm)))) (=> (not (and (and (U_2_bool (MapType2Select g (invRecv15 o_3@@42))) (< NoPerm FullPerm)) (qpRange15 o_3@@42))) (= (U_2_real (MapType1Select QPMask@14 o_3@@42 car)) (U_2_real (MapType1Select QPMask@3 o_3@@42 car))))))
 :qid |stdinbpl.1581:26|
 :skolemid |196|
 :pattern ( (MapType1Select QPMask@14 o_3@@42 car))
))) (and (forall ((o_3@@43 T@U) (f_5@@13 T@U) ) (! (let ((B@@25 (FieldTypeInv1 (type f_5@@13))))
(let ((A@@26 (FieldTypeInv0 (type f_5@@13))))
 (=> (and (and (= (type o_3@@43) RefType) (= (type f_5@@13) (FieldType A@@26 B@@25))) (not (= f_5@@13 car))) (= (U_2_real (MapType1Select QPMask@3 o_3@@43 f_5@@13)) (U_2_real (MapType1Select QPMask@14 o_3@@43 f_5@@13))))))
 :qid |stdinbpl.1585:33|
 :skolemid |197|
 :pattern ( (MapType1Select QPMask@3 o_3@@43 f_5@@13))
 :pattern ( (MapType1Select QPMask@14 o_3@@43 f_5@@13))
)) (state ExhaleHeap@0 QPMask@14))) (and (=> (= (ControlFlow 0 241) 133) anon204_Then_correct) (=> (= (ControlFlow 0 241) 239) anon204_Else_correct))))))))
(let ((anon203_Then_correct true))
(let ((anon202_Then_correct  (=> (not (U_2_bool (MapType2Select g null))) (and (=> (= (ControlFlow 0 243) 132) anon203_Then_correct) (=> (= (ControlFlow 0 243) 241) anon203_Else_correct)))))
(let ((anon145_correct  (=> (= (ControlFlow 0 81) (- 0 80)) (or (and (forall ((n_38 T@U) ) (!  (=> (= (type n_38) RefType) (= (U_2_bool (MapType2Select roots n_38)) (U_2_bool (MapType2Select pending@5 n_38))))
 :qid |stdinbpl.2952:20|
 :skolemid |360|
 :pattern ( (MapType2Select pending@5 n_38))
 :pattern ( (MapType2Select roots n_38))
)) (forall ((n_39 T@U) ) (!  (=> (and (= (type n_39) RefType) (U_2_bool (MapType2Select g n_39))) (not (U_2_bool (MapType2Select marked@2 n_39))))
 :qid |stdinbpl.2955:22|
 :skolemid |361|
 :pattern ( (MapType2Select marked@2 n_39))
))) (and (forall ((n_40 T@U) ) (!  (=> (and (= (type n_40) RefType) (U_2_bool (MapType2Select roots n_40))) (or (U_2_bool (MapType2Select marked@2 n_40)) (U_2_bool (MapType2Select pending@5 n_40))))
 :qid |stdinbpl.2958:24|
 :skolemid |362|
 :pattern ( (MapType2Select pending@5 n_40))
 :pattern ( (MapType2Select marked@2 n_40))
)) (and (forall ((n_41 T@U) ) (!  (=> (and (= (type n_41) RefType) (U_2_bool (MapType2Select g n_41))) (not (and (U_2_bool (MapType2Select marked@2 n_41)) (U_2_bool (MapType2Select pending@5 n_41)))))
 :qid |stdinbpl.2961:23|
 :skolemid |363|
 :pattern ( (MapType2Select pending@5 n_41))
)) (and (forall ((n_42 T@U) ) (!  (=> (and (= (type n_42) RefType) (or (U_2_bool (MapType2Select pending@5 n_42)) (U_2_bool (MapType2Select marked@2 n_42)))) (exists_spath ($$ ExhaleHeap@0 g) roots n_42))
 :qid |stdinbpl.2964:23|
 :skolemid |364|
 :pattern ( (exists_spath (|$$#frame| (CombineFrames (FrameFragment (int_2_U (|$$#condqp1| ExhaleHeap@0 g))) (FrameFragment (int_2_U (|$$#condqp2| ExhaleHeap@0 g)))) g) roots n_42))
)) (forall ((n1_4 T@U) (n2_4 T@U) ) (!  (=> (and (and (= (type n1_4) RefType) (= (type n2_4) RefType)) (and (U_2_bool (MapType2Select marked@2 n1_4)) (and (U_2_bool (MapType2Select g n2_4)) (and (not (U_2_bool (MapType2Select marked@2 n2_4))) (not (U_2_bool (MapType2Select pending@5 n2_4))))))) (not (U_2_bool (MapType2Select ($$ ExhaleHeap@0 g) (create_edge n1_4 n2_4)))))
 :qid |stdinbpl.2967:22|
 :skolemid |365|
 :pattern ( (MapType2Select marked@2 n1_4) (MapType2Select marked@2 n2_4))
)))))))))
(let ((anon254_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select ($$ ExhaleHeap@0 g) (create_edge x_1@2 (MapType0Select ExhaleHeap@0 x_1@2 car)))) (exists_path ($$ ExhaleHeap@0 g) (MapType0Select ExhaleHeap@0 x_1@2 car) (MapType0Select ExhaleHeap@0 x_1@2 car)))) (= (ControlFlow 0 85) 81)) anon145_correct)))
(let ((anon254_Then_correct  (=> (and (U_2_bool (MapType2Select ($$ ExhaleHeap@0 g) (create_edge x_1@2 (MapType0Select ExhaleHeap@0 x_1@2 car)))) (exists_path ($$ ExhaleHeap@0 g) (MapType0Select ExhaleHeap@0 x_1@2 car) (MapType0Select ExhaleHeap@0 x_1@2 car))) (and (=> (= (ControlFlow 0 83) (- 0 84)) (exists_path ($$ ExhaleHeap@0 g) x_1@2 (MapType0Select ExhaleHeap@0 x_1@2 car))) (=> (exists_path ($$ ExhaleHeap@0 g) x_1@2 (MapType0Select ExhaleHeap@0 x_1@2 car)) (=> (= (ControlFlow 0 83) 81) anon145_correct))))))
(let ((anon253_Then_correct  (=> (not (= (MapType0Select ExhaleHeap@0 x_1@2 car) null)) (and (=> (= (ControlFlow 0 86) 83) anon254_Then_correct) (=> (= (ControlFlow 0 86) 85) anon254_Else_correct)))))
(let ((anon253_Else_correct  (=> (and (= (MapType0Select ExhaleHeap@0 x_1@2 car) null) (= (ControlFlow 0 82) 81)) anon145_correct)))
(let ((anon252_Else_correct  (=> (not (and (U_2_bool (MapType2Select ($$ ExhaleHeap@0 g) (create_edge x_1@2 (MapType0Select ExhaleHeap@0 x_1@2 cdr)))) (exists_path ($$ ExhaleHeap@0 g) (MapType0Select ExhaleHeap@0 x_1@2 cdr) (MapType0Select ExhaleHeap@0 x_1@2 cdr)))) (and (=> (= (ControlFlow 0 90) 86) anon253_Then_correct) (=> (= (ControlFlow 0 90) 82) anon253_Else_correct)))))
(let ((anon252_Then_correct  (=> (and (U_2_bool (MapType2Select ($$ ExhaleHeap@0 g) (create_edge x_1@2 (MapType0Select ExhaleHeap@0 x_1@2 cdr)))) (exists_path ($$ ExhaleHeap@0 g) (MapType0Select ExhaleHeap@0 x_1@2 cdr) (MapType0Select ExhaleHeap@0 x_1@2 cdr))) (and (=> (= (ControlFlow 0 88) (- 0 89)) (exists_path ($$ ExhaleHeap@0 g) x_1@2 (MapType0Select ExhaleHeap@0 x_1@2 cdr))) (=> (exists_path ($$ ExhaleHeap@0 g) x_1@2 (MapType0Select ExhaleHeap@0 x_1@2 cdr)) (and (=> (= (ControlFlow 0 88) 86) anon253_Then_correct) (=> (= (ControlFlow 0 88) 82) anon253_Else_correct)))))))
(let ((anon251_Then_correct  (=> (not (= (MapType0Select ExhaleHeap@0 x_1@2 cdr) null)) (and (=> (= (ControlFlow 0 91) 88) anon252_Then_correct) (=> (= (ControlFlow 0 91) 90) anon252_Else_correct)))))
(let ((anon251_Else_correct  (=> (= (MapType0Select ExhaleHeap@0 x_1@2 cdr) null) (and (=> (= (ControlFlow 0 87) 86) anon253_Then_correct) (=> (= (ControlFlow 0 87) 82) anon253_Else_correct)))))
(let ((anon249_Else_correct  (=> (forall ((n$8_6_1 T@U) ) (!  (=> (and (= (type n$8_6_1) RefType) (U_2_bool (MapType2Select g n$8_6_1))) (U_2_bool (MapType2Select g (MapType0Select ExhaleHeap@0 n$8_6_1 cdr))))
 :qid |stdinbpl.2927:24|
 :skolemid |359|
 :pattern ( (MapType2Select g (MapType0Select ExhaleHeap@0 n$8_6_1 cdr)))
 :pattern ( (MapType2Select g n$8_6_1) (MapType0Select ExhaleHeap@0 n$8_6_1 cdr))
)) (and (=> (= (ControlFlow 0 92) (- 0 96)) (U_2_bool (MapType2Select g x_1@2))) (=> (U_2_bool (MapType2Select g x_1@2)) (and (=> (= (ControlFlow 0 92) (- 0 95)) (|Set#Subset| pending@5 g)) (=> (|Set#Subset| pending@5 g) (and (=> (= (ControlFlow 0 92) (- 0 94)) (|Set#Subset| marked@2 g)) (=> (|Set#Subset| marked@2 g) (and (=> (= (ControlFlow 0 92) (- 0 93)) (exists_spath ($$ ExhaleHeap@0 g) roots x_1@2)) (=> (exists_spath ($$ ExhaleHeap@0 g) roots x_1@2) (and (=> (= (ControlFlow 0 92) 91) anon251_Then_correct) (=> (= (ControlFlow 0 92) 87) anon251_Else_correct)))))))))))))
(let ((anon138_correct true))
(let ((anon250_Else_correct  (=> (and (not (U_2_bool (MapType2Select g n$8_5))) (= (ControlFlow 0 79) 76)) anon138_correct)))
(let ((anon250_Then_correct  (=> (U_2_bool (MapType2Select g n$8_5)) (and (=> (= (ControlFlow 0 77) (- 0 78)) (U_2_bool (MapType2Select g (MapType0Select ExhaleHeap@0 n$8_5 cdr)))) (=> (U_2_bool (MapType2Select g (MapType0Select ExhaleHeap@0 n$8_5 cdr))) (=> (= (ControlFlow 0 77) 76) anon138_correct))))))
(let ((anon247_Else_correct  (=> (forall ((n$7_6_1 T@U) ) (!  (=> (and (= (type n$7_6_1) RefType) (U_2_bool (MapType2Select g n$7_6_1))) (U_2_bool (MapType2Select g (MapType0Select ExhaleHeap@0 n$7_6_1 car))))
 :qid |stdinbpl.2916:24|
 :skolemid |358|
 :pattern ( (MapType2Select g (MapType0Select ExhaleHeap@0 n$7_6_1 car)))
 :pattern ( (MapType2Select g n$7_6_1) (MapType0Select ExhaleHeap@0 n$7_6_1 car))
)) (and (and (=> (= (ControlFlow 0 97) 92) anon249_Else_correct) (=> (= (ControlFlow 0 97) 77) anon250_Then_correct)) (=> (= (ControlFlow 0 97) 79) anon250_Else_correct)))))
(let ((anon134_correct true))
(let ((anon248_Else_correct  (=> (and (not (U_2_bool (MapType2Select g n$7_5))) (= (ControlFlow 0 75) 72)) anon134_correct)))
(let ((anon248_Then_correct  (=> (U_2_bool (MapType2Select g n$7_5)) (and (=> (= (ControlFlow 0 73) (- 0 74)) (U_2_bool (MapType2Select g (MapType0Select ExhaleHeap@0 n$7_5 car)))) (=> (U_2_bool (MapType2Select g (MapType0Select ExhaleHeap@0 n$7_5 car))) (=> (= (ControlFlow 0 73) 72) anon134_correct))))))
(let ((anon131_correct  (=> (state ExhaleHeap@0 QPMask@5) (and (=> (= (ControlFlow 0 98) (- 0 103)) (not (U_2_bool (MapType2Select g null)))) (=> (not (U_2_bool (MapType2Select g null))) (and (=> (= (ControlFlow 0 98) (- 0 102)) (forall ((n$9_4 T@U) (n$9_4_1 T@U) ) (!  (=> (and (= (type n$9_4) RefType) (= (type n$9_4_1) RefType)) (=> (and (and (and (and (not (= n$9_4 n$9_4_1)) (U_2_bool (MapType2Select g n$9_4))) (U_2_bool (MapType2Select g n$9_4_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$9_4 n$9_4_1))))
 :qid |stdinbpl.2834:21|
 :skolemid |346|
 :pattern ( (neverTriggered37 n$9_4) (neverTriggered37 n$9_4_1))
))) (=> (forall ((n$9_4@@0 T@U) (n$9_4_1@@0 T@U) ) (!  (=> (and (= (type n$9_4@@0) RefType) (= (type n$9_4_1@@0) RefType)) (=> (and (and (and (and (not (= n$9_4@@0 n$9_4_1@@0)) (U_2_bool (MapType2Select g n$9_4@@0))) (U_2_bool (MapType2Select g n$9_4_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$9_4@@0 n$9_4_1@@0))))
 :qid |stdinbpl.2834:21|
 :skolemid |346|
 :pattern ( (neverTriggered37 n$9_4@@0) (neverTriggered37 n$9_4_1@@0))
)) (and (=> (= (ControlFlow 0 98) (- 0 101)) (forall ((n$9_4@@1 T@U) ) (!  (=> (and (= (type n$9_4@@1) RefType) (U_2_bool (MapType2Select g n$9_4@@1))) (>= (U_2_real (MapType1Select QPMask@5 n$9_4@@1 car)) FullPerm))
 :qid |stdinbpl.2841:21|
 :skolemid |347|
 :pattern ( (MapType0Select ExhaleHeap@0 n$9_4@@1 car))
 :pattern ( (MapType1Select QPMask@12 n$9_4@@1 car))
 :pattern ( (MapType0Select ExhaleHeap@0 n$9_4@@1 car))
))) (=> (forall ((n$9_4@@2 T@U) ) (!  (=> (and (= (type n$9_4@@2) RefType) (U_2_bool (MapType2Select g n$9_4@@2))) (>= (U_2_real (MapType1Select QPMask@5 n$9_4@@2 car)) FullPerm))
 :qid |stdinbpl.2841:21|
 :skolemid |347|
 :pattern ( (MapType0Select ExhaleHeap@0 n$9_4@@2 car))
 :pattern ( (MapType1Select QPMask@12 n$9_4@@2 car))
 :pattern ( (MapType0Select ExhaleHeap@0 n$9_4@@2 car))
)) (=> (and (and (forall ((n$9_4@@3 T@U) ) (!  (=> (= (type n$9_4@@3) RefType) (=> (and (U_2_bool (MapType2Select g n$9_4@@3)) (< NoPerm FullPerm)) (and (qpRange37 n$9_4@@3) (= (invRecv37 n$9_4@@3) n$9_4@@3))))
 :qid |stdinbpl.2847:26|
 :skolemid |348|
 :pattern ( (MapType0Select ExhaleHeap@0 n$9_4@@3 car))
 :pattern ( (MapType1Select QPMask@12 n$9_4@@3 car))
 :pattern ( (MapType0Select ExhaleHeap@0 n$9_4@@3 car))
)) (forall ((o_3@@44 T@U) ) (!  (=> (= (type o_3@@44) RefType) (=> (and (U_2_bool (MapType2Select g (invRecv37 o_3@@44))) (and (< NoPerm FullPerm) (qpRange37 o_3@@44))) (= (invRecv37 o_3@@44) o_3@@44)))
 :qid |stdinbpl.2851:26|
 :skolemid |349|
 :pattern ( (invRecv37 o_3@@44))
))) (and (forall ((o_3@@45 T@U) ) (!  (=> (= (type o_3@@45) RefType) (and (=> (and (U_2_bool (MapType2Select g (invRecv37 o_3@@45))) (and (< NoPerm FullPerm) (qpRange37 o_3@@45))) (and (= (invRecv37 o_3@@45) o_3@@45) (= (U_2_real (MapType1Select QPMask@12 o_3@@45 car)) (- (U_2_real (MapType1Select QPMask@5 o_3@@45 car)) FullPerm)))) (=> (not (and (U_2_bool (MapType2Select g (invRecv37 o_3@@45))) (and (< NoPerm FullPerm) (qpRange37 o_3@@45)))) (= (U_2_real (MapType1Select QPMask@12 o_3@@45 car)) (U_2_real (MapType1Select QPMask@5 o_3@@45 car))))))
 :qid |stdinbpl.2857:26|
 :skolemid |350|
 :pattern ( (MapType1Select QPMask@12 o_3@@45 car))
)) (forall ((o_3@@46 T@U) (f_5@@14 T@U) ) (! (let ((B@@26 (FieldTypeInv1 (type f_5@@14))))
(let ((A@@27 (FieldTypeInv0 (type f_5@@14))))
 (=> (and (and (= (type o_3@@46) RefType) (= (type f_5@@14) (FieldType A@@27 B@@26))) (not (= f_5@@14 car))) (= (U_2_real (MapType1Select QPMask@5 o_3@@46 f_5@@14)) (U_2_real (MapType1Select QPMask@12 o_3@@46 f_5@@14))))))
 :qid |stdinbpl.2863:33|
 :skolemid |351|
 :pattern ( (MapType1Select QPMask@12 o_3@@46 f_5@@14))
)))) (and (=> (= (ControlFlow 0 98) (- 0 100)) (forall ((n$10_4 T@U) (n$10_4_1 T@U) ) (!  (=> (and (= (type n$10_4) RefType) (= (type n$10_4_1) RefType)) (=> (and (and (and (and (not (= n$10_4 n$10_4_1)) (U_2_bool (MapType2Select g n$10_4))) (U_2_bool (MapType2Select g n$10_4_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$10_4 n$10_4_1))))
 :qid |stdinbpl.2875:21|
 :skolemid |352|
 :pattern ( (neverTriggered38 n$10_4) (neverTriggered38 n$10_4_1))
))) (=> (forall ((n$10_4@@0 T@U) (n$10_4_1@@0 T@U) ) (!  (=> (and (= (type n$10_4@@0) RefType) (= (type n$10_4_1@@0) RefType)) (=> (and (and (and (and (not (= n$10_4@@0 n$10_4_1@@0)) (U_2_bool (MapType2Select g n$10_4@@0))) (U_2_bool (MapType2Select g n$10_4_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$10_4@@0 n$10_4_1@@0))))
 :qid |stdinbpl.2875:21|
 :skolemid |352|
 :pattern ( (neverTriggered38 n$10_4@@0) (neverTriggered38 n$10_4_1@@0))
)) (and (=> (= (ControlFlow 0 98) (- 0 99)) (forall ((n$10_4@@1 T@U) ) (!  (=> (and (= (type n$10_4@@1) RefType) (U_2_bool (MapType2Select g n$10_4@@1))) (>= (U_2_real (MapType1Select QPMask@12 n$10_4@@1 cdr)) FullPerm))
 :qid |stdinbpl.2882:21|
 :skolemid |353|
 :pattern ( (MapType0Select ExhaleHeap@0 n$10_4@@1 cdr))
 :pattern ( (MapType1Select QPMask@13 n$10_4@@1 cdr))
 :pattern ( (MapType0Select ExhaleHeap@0 n$10_4@@1 cdr))
))) (=> (forall ((n$10_4@@2 T@U) ) (!  (=> (and (= (type n$10_4@@2) RefType) (U_2_bool (MapType2Select g n$10_4@@2))) (>= (U_2_real (MapType1Select QPMask@12 n$10_4@@2 cdr)) FullPerm))
 :qid |stdinbpl.2882:21|
 :skolemid |353|
 :pattern ( (MapType0Select ExhaleHeap@0 n$10_4@@2 cdr))
 :pattern ( (MapType1Select QPMask@13 n$10_4@@2 cdr))
 :pattern ( (MapType0Select ExhaleHeap@0 n$10_4@@2 cdr))
)) (=> (and (and (forall ((n$10_4@@3 T@U) ) (!  (=> (= (type n$10_4@@3) RefType) (=> (and (U_2_bool (MapType2Select g n$10_4@@3)) (< NoPerm FullPerm)) (and (qpRange38 n$10_4@@3) (= (invRecv38 n$10_4@@3) n$10_4@@3))))
 :qid |stdinbpl.2888:26|
 :skolemid |354|
 :pattern ( (MapType0Select ExhaleHeap@0 n$10_4@@3 cdr))
 :pattern ( (MapType1Select QPMask@13 n$10_4@@3 cdr))
 :pattern ( (MapType0Select ExhaleHeap@0 n$10_4@@3 cdr))
)) (forall ((o_3@@47 T@U) ) (!  (=> (= (type o_3@@47) RefType) (=> (and (U_2_bool (MapType2Select g (invRecv38 o_3@@47))) (and (< NoPerm FullPerm) (qpRange38 o_3@@47))) (= (invRecv38 o_3@@47) o_3@@47)))
 :qid |stdinbpl.2892:26|
 :skolemid |355|
 :pattern ( (invRecv38 o_3@@47))
))) (and (forall ((o_3@@48 T@U) ) (!  (=> (= (type o_3@@48) RefType) (and (=> (and (U_2_bool (MapType2Select g (invRecv38 o_3@@48))) (and (< NoPerm FullPerm) (qpRange38 o_3@@48))) (and (= (invRecv38 o_3@@48) o_3@@48) (= (U_2_real (MapType1Select QPMask@13 o_3@@48 cdr)) (- (U_2_real (MapType1Select QPMask@12 o_3@@48 cdr)) FullPerm)))) (=> (not (and (U_2_bool (MapType2Select g (invRecv38 o_3@@48))) (and (< NoPerm FullPerm) (qpRange38 o_3@@48)))) (= (U_2_real (MapType1Select QPMask@13 o_3@@48 cdr)) (U_2_real (MapType1Select QPMask@12 o_3@@48 cdr))))))
 :qid |stdinbpl.2898:26|
 :skolemid |356|
 :pattern ( (MapType1Select QPMask@13 o_3@@48 cdr))
)) (forall ((o_3@@49 T@U) (f_5@@15 T@U) ) (! (let ((B@@27 (FieldTypeInv1 (type f_5@@15))))
(let ((A@@28 (FieldTypeInv0 (type f_5@@15))))
 (=> (and (and (= (type o_3@@49) RefType) (= (type f_5@@15) (FieldType A@@28 B@@27))) (not (= f_5@@15 cdr))) (= (U_2_real (MapType1Select QPMask@12 o_3@@49 f_5@@15)) (U_2_real (MapType1Select QPMask@13 o_3@@49 f_5@@15))))))
 :qid |stdinbpl.2904:33|
 :skolemid |357|
 :pattern ( (MapType1Select QPMask@13 o_3@@49 f_5@@15))
)))) (and (and (=> (= (ControlFlow 0 98) 97) anon247_Else_correct) (=> (= (ControlFlow 0 98) 73) anon248_Then_correct)) (=> (= (ControlFlow 0 98) 75) anon248_Else_correct)))))))))))))))))
(let ((anon246_Else_correct  (=> (not (and (not (= (MapType0Select ExhaleHeap@0 x_1@2 cdr) null)) (not (U_2_bool (MapType2Select marked@2 (MapType0Select ExhaleHeap@0 x_1@2 cdr)))))) (=> (and (= pending@5 pending@3) (= (ControlFlow 0 106) 98)) anon131_correct))))
(let ((anon246_Then_correct  (=> (and (not (= (MapType0Select ExhaleHeap@0 x_1@2 cdr) null)) (not (U_2_bool (MapType2Select marked@2 (MapType0Select ExhaleHeap@0 x_1@2 cdr))))) (and (=> (= (ControlFlow 0 104) (- 0 105)) (HasDirectPerm QPMask@5 x_1@2 cdr)) (=> (HasDirectPerm QPMask@5 x_1@2 cdr) (=> (and (and (= pending@4 (|Set#Union| pending@3 (|Set#Singleton| (MapType0Select ExhaleHeap@0 x_1@2 cdr)))) (state ExhaleHeap@0 QPMask@5)) (and (= pending@5 pending@4) (= (ControlFlow 0 104) 98))) anon131_correct))))))
(let ((anon245_Else_correct  (=> (= (MapType0Select ExhaleHeap@0 x_1@2 cdr) null) (and (=> (= (ControlFlow 0 109) 104) anon246_Then_correct) (=> (= (ControlFlow 0 109) 106) anon246_Else_correct)))))
(let ((anon245_Then_correct  (=> (not (= (MapType0Select ExhaleHeap@0 x_1@2 cdr) null)) (and (=> (= (ControlFlow 0 107) (- 0 108)) (HasDirectPerm QPMask@5 x_1@2 cdr)) (=> (HasDirectPerm QPMask@5 x_1@2 cdr) (and (=> (= (ControlFlow 0 107) 104) anon246_Then_correct) (=> (= (ControlFlow 0 107) 106) anon246_Else_correct)))))))
(let ((anon127_correct  (=> (state ExhaleHeap@0 QPMask@5) (and (=> (= (ControlFlow 0 110) (- 0 111)) (HasDirectPerm QPMask@5 x_1@2 cdr)) (=> (HasDirectPerm QPMask@5 x_1@2 cdr) (and (=> (= (ControlFlow 0 110) 107) anon245_Then_correct) (=> (= (ControlFlow 0 110) 109) anon245_Else_correct)))))))
(let ((anon244_Else_correct  (=> (not (and (not (= (MapType0Select ExhaleHeap@0 x_1@2 car) null)) (not (U_2_bool (MapType2Select marked@2 (MapType0Select ExhaleHeap@0 x_1@2 car)))))) (=> (and (= pending@3 pending@1) (= (ControlFlow 0 114) 110)) anon127_correct))))
(let ((anon244_Then_correct  (=> (and (not (= (MapType0Select ExhaleHeap@0 x_1@2 car) null)) (not (U_2_bool (MapType2Select marked@2 (MapType0Select ExhaleHeap@0 x_1@2 car))))) (and (=> (= (ControlFlow 0 112) (- 0 113)) (HasDirectPerm QPMask@5 x_1@2 car)) (=> (HasDirectPerm QPMask@5 x_1@2 car) (=> (and (and (= pending@2 (|Set#Union| pending@1 (|Set#Singleton| (MapType0Select ExhaleHeap@0 x_1@2 car)))) (state ExhaleHeap@0 QPMask@5)) (and (= pending@3 pending@2) (= (ControlFlow 0 112) 110))) anon127_correct))))))
(let ((anon243_Else_correct  (=> (= (MapType0Select ExhaleHeap@0 x_1@2 car) null) (and (=> (= (ControlFlow 0 117) 112) anon244_Then_correct) (=> (= (ControlFlow 0 117) 114) anon244_Else_correct)))))
(let ((anon243_Then_correct  (=> (not (= (MapType0Select ExhaleHeap@0 x_1@2 car) null)) (and (=> (= (ControlFlow 0 115) (- 0 116)) (HasDirectPerm QPMask@5 x_1@2 car)) (=> (HasDirectPerm QPMask@5 x_1@2 car) (and (=> (= (ControlFlow 0 115) 112) anon244_Then_correct) (=> (= (ControlFlow 0 115) 114) anon244_Else_correct)))))))
(let ((anon242_Else_correct  (=> (and (= x_1@2 (get ExhaleHeap@0 pending@0)) (state ExhaleHeap@0 QPMask@5)) (=> (and (and (= pending@1 (|Set#Difference| pending@0 (|Set#Singleton| x_1@2))) (state ExhaleHeap@0 QPMask@5)) (and (= marked@2 (|Set#Union| marked@1 (|Set#Singleton| x_1@2))) (state ExhaleHeap@0 QPMask@5))) (and (=> (= (ControlFlow 0 118) (- 0 119)) (HasDirectPerm QPMask@5 x_1@2 car)) (=> (HasDirectPerm QPMask@5 x_1@2 car) (and (=> (= (ControlFlow 0 118) 115) anon243_Then_correct) (=> (= (ControlFlow 0 118) 117) anon243_Else_correct))))))))
(let ((anon242_Then_correct  (=> (= (ControlFlow 0 71) (- 0 70)) (> (|Set#Card| pending@0) 0))))
(let ((anon121_correct  (=> (state ExhaleHeap@0 QPMask@5) (=> (and (and (or (and (forall ((n_33 T@U) ) (!  (=> (= (type n_33) RefType) (= (U_2_bool (MapType2Select roots n_33)) (U_2_bool (MapType2Select pending@0 n_33))))
 :qid |stdinbpl.2732:25|
 :skolemid |340|
 :pattern ( (MapType2Select pending@0 n_33))
 :pattern ( (MapType2Select roots n_33))
)) (forall ((n_34 T@U) ) (!  (=> (and (= (type n_34) RefType) (U_2_bool (MapType2Select g n_34))) (not (U_2_bool (MapType2Select marked@1 n_34))))
 :qid |stdinbpl.2735:22|
 :skolemid |341|
 :pattern ( (MapType2Select marked@1 n_34))
))) (and (forall ((n_35 T@U) ) (!  (=> (and (= (type n_35) RefType) (U_2_bool (MapType2Select roots n_35))) (or (U_2_bool (MapType2Select marked@1 n_35)) (U_2_bool (MapType2Select pending@0 n_35))))
 :qid |stdinbpl.2738:24|
 :skolemid |342|
 :pattern ( (MapType2Select pending@0 n_35))
 :pattern ( (MapType2Select marked@1 n_35))
)) (and (forall ((n_36 T@U) ) (!  (=> (and (= (type n_36) RefType) (U_2_bool (MapType2Select g n_36))) (not (and (U_2_bool (MapType2Select marked@1 n_36)) (U_2_bool (MapType2Select pending@0 n_36)))))
 :qid |stdinbpl.2741:23|
 :skolemid |343|
 :pattern ( (MapType2Select pending@0 n_36))
)) (and (forall ((n_37 T@U) ) (!  (=> (and (= (type n_37) RefType) (or (U_2_bool (MapType2Select pending@0 n_37)) (U_2_bool (MapType2Select marked@1 n_37)))) (exists_spath ($$ ExhaleHeap@0 g) roots n_37))
 :qid |stdinbpl.2744:23|
 :skolemid |344|
 :pattern ( (exists_spath (|$$#frame| (CombineFrames (FrameFragment (int_2_U (|$$#condqp1| ExhaleHeap@0 g))) (FrameFragment (int_2_U (|$$#condqp2| ExhaleHeap@0 g)))) g) roots n_37))
)) (forall ((n1_3 T@U) (n2_3 T@U) ) (!  (=> (and (and (= (type n1_3) RefType) (= (type n2_3) RefType)) (and (U_2_bool (MapType2Select marked@1 n1_3)) (and (U_2_bool (MapType2Select g n2_3)) (and (not (U_2_bool (MapType2Select marked@1 n2_3))) (not (U_2_bool (MapType2Select pending@0 n2_3))))))) (not (U_2_bool (MapType2Select ($$ ExhaleHeap@0 g) (create_edge n1_3 n2_3)))))
 :qid |stdinbpl.2747:22|
 :skolemid |345|
 :pattern ( (MapType2Select marked@1 n1_3) (MapType2Select marked@1 n2_3))
)))))) (state ExhaleHeap@0 QPMask@5)) (and (> (|Set#Card| pending@0) 0) (state ExhaleHeap@0 QPMask@5))) (and (=> (= (ControlFlow 0 120) 71) anon242_Then_correct) (=> (= (ControlFlow 0 120) 118) anon242_Else_correct))))))
(let ((anon241_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select ($$ ExhaleHeap@0 g) (create_edge x_1@1 (MapType0Select ExhaleHeap@0 x_1@1 car)))) (exists_path ($$ ExhaleHeap@0 g) (MapType0Select ExhaleHeap@0 x_1@1 car) (MapType0Select ExhaleHeap@0 x_1@1 car)))) (= (ControlFlow 0 123) 120)) anon121_correct)))
(let ((anon241_Then_correct  (=> (and (and (and (U_2_bool (MapType2Select ($$ ExhaleHeap@0 g) (create_edge x_1@1 (MapType0Select ExhaleHeap@0 x_1@1 car)))) (exists_path ($$ ExhaleHeap@0 g) (MapType0Select ExhaleHeap@0 x_1@1 car) (MapType0Select ExhaleHeap@0 x_1@1 car))) (state ExhaleHeap@0 QPMask@5)) (and (exists_path ($$ ExhaleHeap@0 g) x_1@1 (MapType0Select ExhaleHeap@0 x_1@1 car)) (= (ControlFlow 0 122) 120))) anon121_correct)))
(let ((anon240_Then_correct  (=> (not (= (MapType0Select ExhaleHeap@0 x_1@1 car) null)) (and (=> (= (ControlFlow 0 124) 122) anon241_Then_correct) (=> (= (ControlFlow 0 124) 123) anon241_Else_correct)))))
(let ((anon240_Else_correct  (=> (and (= (MapType0Select ExhaleHeap@0 x_1@1 car) null) (= (ControlFlow 0 121) 120)) anon121_correct)))
(let ((anon239_Else_correct  (=> (not (and (U_2_bool (MapType2Select ($$ ExhaleHeap@0 g) (create_edge x_1@1 (MapType0Select ExhaleHeap@0 x_1@1 cdr)))) (exists_path ($$ ExhaleHeap@0 g) (MapType0Select ExhaleHeap@0 x_1@1 cdr) (MapType0Select ExhaleHeap@0 x_1@1 cdr)))) (and (=> (= (ControlFlow 0 127) 124) anon240_Then_correct) (=> (= (ControlFlow 0 127) 121) anon240_Else_correct)))))
(let ((anon239_Then_correct  (=> (and (and (U_2_bool (MapType2Select ($$ ExhaleHeap@0 g) (create_edge x_1@1 (MapType0Select ExhaleHeap@0 x_1@1 cdr)))) (exists_path ($$ ExhaleHeap@0 g) (MapType0Select ExhaleHeap@0 x_1@1 cdr) (MapType0Select ExhaleHeap@0 x_1@1 cdr))) (and (state ExhaleHeap@0 QPMask@5) (exists_path ($$ ExhaleHeap@0 g) x_1@1 (MapType0Select ExhaleHeap@0 x_1@1 cdr)))) (and (=> (= (ControlFlow 0 126) 124) anon240_Then_correct) (=> (= (ControlFlow 0 126) 121) anon240_Else_correct)))))
(let ((anon238_Then_correct  (=> (not (= (MapType0Select ExhaleHeap@0 x_1@1 cdr) null)) (and (=> (= (ControlFlow 0 128) 126) anon239_Then_correct) (=> (= (ControlFlow 0 128) 127) anon239_Else_correct)))))
(let ((anon238_Else_correct  (=> (= (MapType0Select ExhaleHeap@0 x_1@1 cdr) null) (and (=> (= (ControlFlow 0 125) 124) anon240_Then_correct) (=> (= (ControlFlow 0 125) 121) anon240_Else_correct)))))
(let ((anon237_Then_correct  (=> (and (state ExhaleHeap@0 ZeroMask) (not (U_2_bool (MapType2Select g null)))) (and (=> (= (ControlFlow 0 129) (- 0 131)) (forall ((n$9_3 T@U) (n$9_3_1 T@U) ) (!  (=> (and (= (type n$9_3) RefType) (= (type n$9_3_1) RefType)) (=> (and (and (and (and (not (= n$9_3 n$9_3_1)) (U_2_bool (MapType2Select g n$9_3))) (U_2_bool (MapType2Select g n$9_3_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$9_3 n$9_3_1))))
 :qid |stdinbpl.2640:19|
 :skolemid |326|
 :no-pattern (type n$9_3)
 :no-pattern (type n$9_3_1)
 :no-pattern (U_2_int n$9_3)
 :no-pattern (U_2_bool n$9_3)
 :no-pattern (U_2_int n$9_3_1)
 :no-pattern (U_2_bool n$9_3_1)
))) (=> (forall ((n$9_3@@0 T@U) (n$9_3_1@@0 T@U) ) (!  (=> (and (= (type n$9_3@@0) RefType) (= (type n$9_3_1@@0) RefType)) (=> (and (and (and (and (not (= n$9_3@@0 n$9_3_1@@0)) (U_2_bool (MapType2Select g n$9_3@@0))) (U_2_bool (MapType2Select g n$9_3_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$9_3@@0 n$9_3_1@@0))))
 :qid |stdinbpl.2640:19|
 :skolemid |326|
 :no-pattern (type n$9_3@@0)
 :no-pattern (type n$9_3_1@@0)
 :no-pattern (U_2_int n$9_3@@0)
 :no-pattern (U_2_bool n$9_3@@0)
 :no-pattern (U_2_int n$9_3_1@@0)
 :no-pattern (U_2_bool n$9_3_1@@0)
)) (=> (and (forall ((n$9_3@@1 T@U) ) (!  (=> (= (type n$9_3@@1) RefType) (=> (and (U_2_bool (MapType2Select g n$9_3@@1)) (< NoPerm FullPerm)) (and (qpRange35 n$9_3@@1) (= (invRecv35 n$9_3@@1) n$9_3@@1))))
 :qid |stdinbpl.2646:26|
 :skolemid |327|
 :pattern ( (MapType0Select ExhaleHeap@0 n$9_3@@1 car))
 :pattern ( (MapType1Select QPMask@4 n$9_3@@1 car))
 :pattern ( (MapType0Select ExhaleHeap@0 n$9_3@@1 car))
)) (forall ((o_3@@50 T@U) ) (!  (=> (= (type o_3@@50) RefType) (=> (and (and (U_2_bool (MapType2Select g (invRecv35 o_3@@50))) (< NoPerm FullPerm)) (qpRange35 o_3@@50)) (= (invRecv35 o_3@@50) o_3@@50)))
 :qid |stdinbpl.2650:26|
 :skolemid |328|
 :pattern ( (invRecv35 o_3@@50))
))) (=> (and (and (forall ((n$9_3@@2 T@U) ) (!  (=> (and (= (type n$9_3@@2) RefType) (U_2_bool (MapType2Select g n$9_3@@2))) (not (= n$9_3@@2 null)))
 :qid |stdinbpl.2656:26|
 :skolemid |329|
 :pattern ( (MapType0Select ExhaleHeap@0 n$9_3@@2 car))
 :pattern ( (MapType1Select QPMask@4 n$9_3@@2 car))
 :pattern ( (MapType0Select ExhaleHeap@0 n$9_3@@2 car))
)) (forall ((o_3@@51 T@U) ) (!  (=> (= (type o_3@@51) RefType) (and (=> (and (and (U_2_bool (MapType2Select g (invRecv35 o_3@@51))) (< NoPerm FullPerm)) (qpRange35 o_3@@51)) (and (=> (< NoPerm FullPerm) (= (invRecv35 o_3@@51) o_3@@51)) (= (U_2_real (MapType1Select QPMask@4 o_3@@51 car)) (+ (U_2_real (MapType1Select ZeroMask o_3@@51 car)) FullPerm)))) (=> (not (and (and (U_2_bool (MapType2Select g (invRecv35 o_3@@51))) (< NoPerm FullPerm)) (qpRange35 o_3@@51))) (= (U_2_real (MapType1Select QPMask@4 o_3@@51 car)) (U_2_real (MapType1Select ZeroMask o_3@@51 car))))))
 :qid |stdinbpl.2662:26|
 :skolemid |330|
 :pattern ( (MapType1Select QPMask@4 o_3@@51 car))
))) (and (forall ((o_3@@52 T@U) (f_5@@16 T@U) ) (! (let ((B@@28 (FieldTypeInv1 (type f_5@@16))))
(let ((A@@29 (FieldTypeInv0 (type f_5@@16))))
 (=> (and (and (= (type o_3@@52) RefType) (= (type f_5@@16) (FieldType A@@29 B@@28))) (not (= f_5@@16 car))) (= (U_2_real (MapType1Select ZeroMask o_3@@52 f_5@@16)) (U_2_real (MapType1Select QPMask@4 o_3@@52 f_5@@16))))))
 :qid |stdinbpl.2666:33|
 :skolemid |331|
 :pattern ( (MapType1Select ZeroMask o_3@@52 f_5@@16))
 :pattern ( (MapType1Select QPMask@4 o_3@@52 f_5@@16))
)) (state ExhaleHeap@0 QPMask@4))) (and (=> (= (ControlFlow 0 129) (- 0 130)) (forall ((n$10_3 T@U) (n$10_3_1 T@U) ) (!  (=> (and (= (type n$10_3) RefType) (= (type n$10_3_1) RefType)) (=> (and (and (and (and (not (= n$10_3 n$10_3_1)) (U_2_bool (MapType2Select g n$10_3))) (U_2_bool (MapType2Select g n$10_3_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$10_3 n$10_3_1))))
 :qid |stdinbpl.2674:19|
 :skolemid |332|
 :no-pattern (type n$10_3)
 :no-pattern (type n$10_3_1)
 :no-pattern (U_2_int n$10_3)
 :no-pattern (U_2_bool n$10_3)
 :no-pattern (U_2_int n$10_3_1)
 :no-pattern (U_2_bool n$10_3_1)
))) (=> (forall ((n$10_3@@0 T@U) (n$10_3_1@@0 T@U) ) (!  (=> (and (= (type n$10_3@@0) RefType) (= (type n$10_3_1@@0) RefType)) (=> (and (and (and (and (not (= n$10_3@@0 n$10_3_1@@0)) (U_2_bool (MapType2Select g n$10_3@@0))) (U_2_bool (MapType2Select g n$10_3_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$10_3@@0 n$10_3_1@@0))))
 :qid |stdinbpl.2674:19|
 :skolemid |332|
 :no-pattern (type n$10_3@@0)
 :no-pattern (type n$10_3_1@@0)
 :no-pattern (U_2_int n$10_3@@0)
 :no-pattern (U_2_bool n$10_3@@0)
 :no-pattern (U_2_int n$10_3_1@@0)
 :no-pattern (U_2_bool n$10_3_1@@0)
)) (=> (forall ((n$10_3@@1 T@U) ) (!  (=> (= (type n$10_3@@1) RefType) (=> (and (U_2_bool (MapType2Select g n$10_3@@1)) (< NoPerm FullPerm)) (and (qpRange36 n$10_3@@1) (= (invRecv36 n$10_3@@1) n$10_3@@1))))
 :qid |stdinbpl.2680:26|
 :skolemid |333|
 :pattern ( (MapType0Select ExhaleHeap@0 n$10_3@@1 cdr))
 :pattern ( (MapType1Select QPMask@5 n$10_3@@1 cdr))
 :pattern ( (MapType0Select ExhaleHeap@0 n$10_3@@1 cdr))
)) (=> (and (and (forall ((o_3@@53 T@U) ) (!  (=> (= (type o_3@@53) RefType) (=> (and (and (U_2_bool (MapType2Select g (invRecv36 o_3@@53))) (< NoPerm FullPerm)) (qpRange36 o_3@@53)) (= (invRecv36 o_3@@53) o_3@@53)))
 :qid |stdinbpl.2684:26|
 :skolemid |334|
 :pattern ( (invRecv36 o_3@@53))
)) (forall ((n$10_3@@2 T@U) ) (!  (=> (and (= (type n$10_3@@2) RefType) (U_2_bool (MapType2Select g n$10_3@@2))) (not (= n$10_3@@2 null)))
 :qid |stdinbpl.2690:26|
 :skolemid |335|
 :pattern ( (MapType0Select ExhaleHeap@0 n$10_3@@2 cdr))
 :pattern ( (MapType1Select QPMask@5 n$10_3@@2 cdr))
 :pattern ( (MapType0Select ExhaleHeap@0 n$10_3@@2 cdr))
))) (and (forall ((o_3@@54 T@U) ) (!  (=> (= (type o_3@@54) RefType) (and (=> (and (and (U_2_bool (MapType2Select g (invRecv36 o_3@@54))) (< NoPerm FullPerm)) (qpRange36 o_3@@54)) (and (=> (< NoPerm FullPerm) (= (invRecv36 o_3@@54) o_3@@54)) (= (U_2_real (MapType1Select QPMask@5 o_3@@54 cdr)) (+ (U_2_real (MapType1Select QPMask@4 o_3@@54 cdr)) FullPerm)))) (=> (not (and (and (U_2_bool (MapType2Select g (invRecv36 o_3@@54))) (< NoPerm FullPerm)) (qpRange36 o_3@@54))) (= (U_2_real (MapType1Select QPMask@5 o_3@@54 cdr)) (U_2_real (MapType1Select QPMask@4 o_3@@54 cdr))))))
 :qid |stdinbpl.2696:26|
 :skolemid |336|
 :pattern ( (MapType1Select QPMask@5 o_3@@54 cdr))
)) (forall ((o_3@@55 T@U) (f_5@@17 T@U) ) (! (let ((B@@29 (FieldTypeInv1 (type f_5@@17))))
(let ((A@@30 (FieldTypeInv0 (type f_5@@17))))
 (=> (and (and (= (type o_3@@55) RefType) (= (type f_5@@17) (FieldType A@@30 B@@29))) (not (= f_5@@17 cdr))) (= (U_2_real (MapType1Select QPMask@4 o_3@@55 f_5@@17)) (U_2_real (MapType1Select QPMask@5 o_3@@55 f_5@@17))))))
 :qid |stdinbpl.2700:33|
 :skolemid |337|
 :pattern ( (MapType1Select QPMask@4 o_3@@55 f_5@@17))
 :pattern ( (MapType1Select QPMask@5 o_3@@55 f_5@@17))
)))) (=> (and (and (and (state ExhaleHeap@0 QPMask@5) (forall ((n$7_4 T@U) ) (!  (=> (and (= (type n$7_4) RefType) (U_2_bool (MapType2Select g n$7_4))) (U_2_bool (MapType2Select g (MapType0Select ExhaleHeap@0 n$7_4 car))))
 :qid |stdinbpl.2706:24|
 :skolemid |338|
 :pattern ( (MapType2Select g (MapType0Select ExhaleHeap@0 n$7_4 car)))
 :pattern ( (MapType2Select g n$7_4) (MapType0Select ExhaleHeap@0 n$7_4 car))
))) (and (forall ((n$8_4 T@U) ) (!  (=> (and (= (type n$8_4) RefType) (U_2_bool (MapType2Select g n$8_4))) (U_2_bool (MapType2Select g (MapType0Select ExhaleHeap@0 n$8_4 cdr))))
 :qid |stdinbpl.2710:24|
 :skolemid |339|
 :pattern ( (MapType2Select g (MapType0Select ExhaleHeap@0 n$8_4 cdr)))
 :pattern ( (MapType2Select g n$8_4) (MapType0Select ExhaleHeap@0 n$8_4 cdr))
)) (U_2_bool (MapType2Select g x_1@1)))) (and (and (|Set#Subset| pending@0 g) (|Set#Subset| marked@1 g)) (and (state ExhaleHeap@0 QPMask@5) (exists_spath ($$ ExhaleHeap@0 g) roots x_1@1)))) (and (=> (= (ControlFlow 0 129) 128) anon238_Then_correct) (=> (= (ControlFlow 0 129) 125) anon238_Else_correct))))))))))))))
(let ((anon171_correct true))
(let ((anon269_Else_correct  (=> (and (not (exists_spath ($$ ExhaleHeap@0 g) roots v_6)) (= (ControlFlow 0 45) 41)) anon171_correct)))
(let ((anon269_Then_correct  (=> (exists_spath ($$ ExhaleHeap@0 g) roots v_6) (and (=> (= (ControlFlow 0 43) (- 0 44)) (U_2_bool (MapType2Select marked@1 v_6))) (=> (U_2_bool (MapType2Select marked@1 v_6)) (=> (= (ControlFlow 0 43) 41) anon171_correct))))))
(let ((anon268_Then_correct  (=> (U_2_bool (MapType2Select g v_6)) (and (=> (= (ControlFlow 0 46) 43) anon269_Then_correct) (=> (= (ControlFlow 0 46) 45) anon269_Else_correct)))))
(let ((anon268_Else_correct  (=> (and (not (U_2_bool (MapType2Select g v_6))) (= (ControlFlow 0 42) 41)) anon171_correct)))
(let ((anon267_Else_correct true))
(let ((anon264_Else_correct  (=> (forall ((v_5_1 T@U) ) (!  (=> (and (and (= (type v_5_1) RefType) (U_2_bool (MapType2Select g v_5_1))) (U_2_bool (MapType2Select marked@1 v_5_1))) (exists_spath ($$ ExhaleHeap@0 g) roots v_5_1))
 :qid |stdinbpl.3322:20|
 :skolemid |412|
 :pattern ( (MapType2Select marked@1 v_5_1))
 :pattern ( (exists_spath (|$$#frame| (CombineFrames (FrameFragment (int_2_U (|$$#condqp1| ExhaleHeap@0 g))) (FrameFragment (int_2_U (|$$#condqp2| ExhaleHeap@0 g)))) g) roots v_5_1))
)) (and (and (=> (= (ControlFlow 0 47) 40) anon267_Else_correct) (=> (= (ControlFlow 0 47) 46) anon268_Then_correct)) (=> (= (ControlFlow 0 47) 42) anon268_Else_correct)))))
(let ((anon166_correct true))
(let ((anon266_Else_correct  (=> (and (not (U_2_bool (MapType2Select marked@1 v_4_1))) (= (ControlFlow 0 38) 34)) anon166_correct)))
(let ((anon266_Then_correct  (=> (U_2_bool (MapType2Select marked@1 v_4_1)) (and (=> (= (ControlFlow 0 36) (- 0 37)) (exists_spath ($$ ExhaleHeap@0 g) roots v_4_1)) (=> (exists_spath ($$ ExhaleHeap@0 g) roots v_4_1) (=> (= (ControlFlow 0 36) 34) anon166_correct))))))
(let ((anon265_Then_correct  (=> (U_2_bool (MapType2Select g v_4_1)) (and (=> (= (ControlFlow 0 39) 36) anon266_Then_correct) (=> (= (ControlFlow 0 39) 38) anon266_Else_correct)))))
(let ((anon265_Else_correct  (=> (and (not (U_2_bool (MapType2Select g v_4_1))) (= (ControlFlow 0 35) 34)) anon166_correct)))
(let ((anon262_Else_correct  (=> (forall ((n$4_3_1 T@U) ) (!  (=> (and (= (type n$4_3_1) RefType) (U_2_bool (MapType2Select g n$4_3_1))) (U_2_bool (MapType2Select g (MapType0Select ExhaleHeap@0 n$4_3_1 cdr))))
 :qid |stdinbpl.3309:20|
 :skolemid |411|
 :pattern ( (MapType2Select g (MapType0Select ExhaleHeap@0 n$4_3_1 cdr)))
 :pattern ( (MapType2Select g n$4_3_1) (MapType0Select ExhaleHeap@0 n$4_3_1 cdr))
)) (and (and (=> (= (ControlFlow 0 48) 47) anon264_Else_correct) (=> (= (ControlFlow 0 48) 39) anon265_Then_correct)) (=> (= (ControlFlow 0 48) 35) anon265_Else_correct)))))
(let ((anon161_correct true))
(let ((anon263_Else_correct  (=> (and (not (U_2_bool (MapType2Select g n$4_2))) (= (ControlFlow 0 33) 30)) anon161_correct)))
(let ((anon263_Then_correct  (=> (U_2_bool (MapType2Select g n$4_2)) (and (=> (= (ControlFlow 0 31) (- 0 32)) (U_2_bool (MapType2Select g (MapType0Select ExhaleHeap@0 n$4_2 cdr)))) (=> (U_2_bool (MapType2Select g (MapType0Select ExhaleHeap@0 n$4_2 cdr))) (=> (= (ControlFlow 0 31) 30) anon161_correct))))))
(let ((anon260_Else_correct  (=> (forall ((n$3_3_1 T@U) ) (!  (=> (and (= (type n$3_3_1) RefType) (U_2_bool (MapType2Select g n$3_3_1))) (U_2_bool (MapType2Select g (MapType0Select ExhaleHeap@0 n$3_3_1 car))))
 :qid |stdinbpl.3298:20|
 :skolemid |410|
 :pattern ( (MapType2Select g (MapType0Select ExhaleHeap@0 n$3_3_1 car)))
 :pattern ( (MapType2Select g n$3_3_1) (MapType0Select ExhaleHeap@0 n$3_3_1 car))
)) (and (and (=> (= (ControlFlow 0 49) 48) anon262_Else_correct) (=> (= (ControlFlow 0 49) 31) anon263_Then_correct)) (=> (= (ControlFlow 0 49) 33) anon263_Else_correct)))))
(let ((anon157_correct true))
(let ((anon261_Else_correct  (=> (and (not (U_2_bool (MapType2Select g n$3_2))) (= (ControlFlow 0 29) 26)) anon157_correct)))
(let ((anon261_Then_correct  (=> (U_2_bool (MapType2Select g n$3_2)) (and (=> (= (ControlFlow 0 27) (- 0 28)) (U_2_bool (MapType2Select g (MapType0Select ExhaleHeap@0 n$3_2 car)))) (=> (U_2_bool (MapType2Select g (MapType0Select ExhaleHeap@0 n$3_2 car))) (=> (= (ControlFlow 0 27) 26) anon157_correct))))))
(let ((anon259_Else_correct  (=> (apply_noExit ($$ ExhaleHeap@0 g) g marked@1) (=> (and (state ExhaleHeap@0 QPMask@7) (state ExhaleHeap@0 QPMask@7)) (and (=> (= (ControlFlow 0 50) (- 0 57)) (|Set#Subset| roots marked@1)) (=> (|Set#Subset| roots marked@1) (and (=> (= (ControlFlow 0 50) (- 0 56)) (|Set#Subset| marked@1 g)) (=> (|Set#Subset| marked@1 g) (and (=> (= (ControlFlow 0 50) (- 0 55)) (not (U_2_bool (MapType2Select g null)))) (=> (not (U_2_bool (MapType2Select g null))) (and (=> (= (ControlFlow 0 50) (- 0 54)) (forall ((n$5_2 T@U) (n$5_2_1 T@U) ) (!  (=> (and (= (type n$5_2) RefType) (= (type n$5_2_1) RefType)) (=> (and (and (and (and (not (= n$5_2 n$5_2_1)) (U_2_bool (MapType2Select g n$5_2))) (U_2_bool (MapType2Select g n$5_2_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$5_2 n$5_2_1))))
 :qid |stdinbpl.3216:17|
 :skolemid |398|
 :pattern ( (neverTriggered11 n$5_2) (neverTriggered11 n$5_2_1))
))) (=> (forall ((n$5_2@@0 T@U) (n$5_2_1@@0 T@U) ) (!  (=> (and (= (type n$5_2@@0) RefType) (= (type n$5_2_1@@0) RefType)) (=> (and (and (and (and (not (= n$5_2@@0 n$5_2_1@@0)) (U_2_bool (MapType2Select g n$5_2@@0))) (U_2_bool (MapType2Select g n$5_2_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$5_2@@0 n$5_2_1@@0))))
 :qid |stdinbpl.3216:17|
 :skolemid |398|
 :pattern ( (neverTriggered11 n$5_2@@0) (neverTriggered11 n$5_2_1@@0))
)) (and (=> (= (ControlFlow 0 50) (- 0 53)) (forall ((n$5_2@@1 T@U) ) (!  (=> (and (= (type n$5_2@@1) RefType) (U_2_bool (MapType2Select g n$5_2@@1))) (>= (U_2_real (MapType1Select QPMask@7 n$5_2@@1 car)) FullPerm))
 :qid |stdinbpl.3223:17|
 :skolemid |399|
 :pattern ( (MapType0Select ExhaleHeap@0 n$5_2@@1 car))
 :pattern ( (MapType1Select QPMask@10 n$5_2@@1 car))
 :pattern ( (MapType0Select ExhaleHeap@0 n$5_2@@1 car))
))) (=> (forall ((n$5_2@@2 T@U) ) (!  (=> (and (= (type n$5_2@@2) RefType) (U_2_bool (MapType2Select g n$5_2@@2))) (>= (U_2_real (MapType1Select QPMask@7 n$5_2@@2 car)) FullPerm))
 :qid |stdinbpl.3223:17|
 :skolemid |399|
 :pattern ( (MapType0Select ExhaleHeap@0 n$5_2@@2 car))
 :pattern ( (MapType1Select QPMask@10 n$5_2@@2 car))
 :pattern ( (MapType0Select ExhaleHeap@0 n$5_2@@2 car))
)) (=> (and (and (forall ((n$5_2@@3 T@U) ) (!  (=> (= (type n$5_2@@3) RefType) (=> (and (U_2_bool (MapType2Select g n$5_2@@3)) (< NoPerm FullPerm)) (and (qpRange11 n$5_2@@3) (= (invRecv11 n$5_2@@3) n$5_2@@3))))
 :qid |stdinbpl.3229:22|
 :skolemid |400|
 :pattern ( (MapType0Select ExhaleHeap@0 n$5_2@@3 car))
 :pattern ( (MapType1Select QPMask@10 n$5_2@@3 car))
 :pattern ( (MapType0Select ExhaleHeap@0 n$5_2@@3 car))
)) (forall ((o_3@@56 T@U) ) (!  (=> (= (type o_3@@56) RefType) (=> (and (U_2_bool (MapType2Select g (invRecv11 o_3@@56))) (and (< NoPerm FullPerm) (qpRange11 o_3@@56))) (= (invRecv11 o_3@@56) o_3@@56)))
 :qid |stdinbpl.3233:22|
 :skolemid |401|
 :pattern ( (invRecv11 o_3@@56))
))) (and (forall ((o_3@@57 T@U) ) (!  (=> (= (type o_3@@57) RefType) (and (=> (and (U_2_bool (MapType2Select g (invRecv11 o_3@@57))) (and (< NoPerm FullPerm) (qpRange11 o_3@@57))) (and (= (invRecv11 o_3@@57) o_3@@57) (= (U_2_real (MapType1Select QPMask@10 o_3@@57 car)) (- (U_2_real (MapType1Select QPMask@7 o_3@@57 car)) FullPerm)))) (=> (not (and (U_2_bool (MapType2Select g (invRecv11 o_3@@57))) (and (< NoPerm FullPerm) (qpRange11 o_3@@57)))) (= (U_2_real (MapType1Select QPMask@10 o_3@@57 car)) (U_2_real (MapType1Select QPMask@7 o_3@@57 car))))))
 :qid |stdinbpl.3239:22|
 :skolemid |402|
 :pattern ( (MapType1Select QPMask@10 o_3@@57 car))
)) (forall ((o_3@@58 T@U) (f_5@@18 T@U) ) (! (let ((B@@30 (FieldTypeInv1 (type f_5@@18))))
(let ((A@@31 (FieldTypeInv0 (type f_5@@18))))
 (=> (and (and (= (type o_3@@58) RefType) (= (type f_5@@18) (FieldType A@@31 B@@30))) (not (= f_5@@18 car))) (= (U_2_real (MapType1Select QPMask@7 o_3@@58 f_5@@18)) (U_2_real (MapType1Select QPMask@10 o_3@@58 f_5@@18))))))
 :qid |stdinbpl.3245:29|
 :skolemid |403|
 :pattern ( (MapType1Select QPMask@10 o_3@@58 f_5@@18))
)))) (and (=> (= (ControlFlow 0 50) (- 0 52)) (forall ((n$6_2 T@U) (n$6_2_1 T@U) ) (!  (=> (and (= (type n$6_2) RefType) (= (type n$6_2_1) RefType)) (=> (and (and (and (and (not (= n$6_2 n$6_2_1)) (U_2_bool (MapType2Select g n$6_2))) (U_2_bool (MapType2Select g n$6_2_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$6_2 n$6_2_1))))
 :qid |stdinbpl.3257:17|
 :skolemid |404|
 :pattern ( (neverTriggered12 n$6_2) (neverTriggered12 n$6_2_1))
))) (=> (forall ((n$6_2@@0 T@U) (n$6_2_1@@0 T@U) ) (!  (=> (and (= (type n$6_2@@0) RefType) (= (type n$6_2_1@@0) RefType)) (=> (and (and (and (and (not (= n$6_2@@0 n$6_2_1@@0)) (U_2_bool (MapType2Select g n$6_2@@0))) (U_2_bool (MapType2Select g n$6_2_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$6_2@@0 n$6_2_1@@0))))
 :qid |stdinbpl.3257:17|
 :skolemid |404|
 :pattern ( (neverTriggered12 n$6_2@@0) (neverTriggered12 n$6_2_1@@0))
)) (and (=> (= (ControlFlow 0 50) (- 0 51)) (forall ((n$6_2@@1 T@U) ) (!  (=> (and (= (type n$6_2@@1) RefType) (U_2_bool (MapType2Select g n$6_2@@1))) (>= (U_2_real (MapType1Select QPMask@10 n$6_2@@1 cdr)) FullPerm))
 :qid |stdinbpl.3264:17|
 :skolemid |405|
 :pattern ( (MapType0Select ExhaleHeap@0 n$6_2@@1 cdr))
 :pattern ( (MapType1Select QPMask@11 n$6_2@@1 cdr))
 :pattern ( (MapType0Select ExhaleHeap@0 n$6_2@@1 cdr))
))) (=> (forall ((n$6_2@@2 T@U) ) (!  (=> (and (= (type n$6_2@@2) RefType) (U_2_bool (MapType2Select g n$6_2@@2))) (>= (U_2_real (MapType1Select QPMask@10 n$6_2@@2 cdr)) FullPerm))
 :qid |stdinbpl.3264:17|
 :skolemid |405|
 :pattern ( (MapType0Select ExhaleHeap@0 n$6_2@@2 cdr))
 :pattern ( (MapType1Select QPMask@11 n$6_2@@2 cdr))
 :pattern ( (MapType0Select ExhaleHeap@0 n$6_2@@2 cdr))
)) (=> (and (and (forall ((n$6_2@@3 T@U) ) (!  (=> (= (type n$6_2@@3) RefType) (=> (and (U_2_bool (MapType2Select g n$6_2@@3)) (< NoPerm FullPerm)) (and (qpRange12 n$6_2@@3) (= (invRecv12 n$6_2@@3) n$6_2@@3))))
 :qid |stdinbpl.3270:22|
 :skolemid |406|
 :pattern ( (MapType0Select ExhaleHeap@0 n$6_2@@3 cdr))
 :pattern ( (MapType1Select QPMask@11 n$6_2@@3 cdr))
 :pattern ( (MapType0Select ExhaleHeap@0 n$6_2@@3 cdr))
)) (forall ((o_3@@59 T@U) ) (!  (=> (= (type o_3@@59) RefType) (=> (and (U_2_bool (MapType2Select g (invRecv12 o_3@@59))) (and (< NoPerm FullPerm) (qpRange12 o_3@@59))) (= (invRecv12 o_3@@59) o_3@@59)))
 :qid |stdinbpl.3274:22|
 :skolemid |407|
 :pattern ( (invRecv12 o_3@@59))
))) (and (forall ((o_3@@60 T@U) ) (!  (=> (= (type o_3@@60) RefType) (and (=> (and (U_2_bool (MapType2Select g (invRecv12 o_3@@60))) (and (< NoPerm FullPerm) (qpRange12 o_3@@60))) (and (= (invRecv12 o_3@@60) o_3@@60) (= (U_2_real (MapType1Select QPMask@11 o_3@@60 cdr)) (- (U_2_real (MapType1Select QPMask@10 o_3@@60 cdr)) FullPerm)))) (=> (not (and (U_2_bool (MapType2Select g (invRecv12 o_3@@60))) (and (< NoPerm FullPerm) (qpRange12 o_3@@60)))) (= (U_2_real (MapType1Select QPMask@11 o_3@@60 cdr)) (U_2_real (MapType1Select QPMask@10 o_3@@60 cdr))))))
 :qid |stdinbpl.3280:22|
 :skolemid |408|
 :pattern ( (MapType1Select QPMask@11 o_3@@60 cdr))
)) (forall ((o_3@@61 T@U) (f_5@@19 T@U) ) (! (let ((B@@31 (FieldTypeInv1 (type f_5@@19))))
(let ((A@@32 (FieldTypeInv0 (type f_5@@19))))
 (=> (and (and (= (type o_3@@61) RefType) (= (type f_5@@19) (FieldType A@@32 B@@31))) (not (= f_5@@19 cdr))) (= (U_2_real (MapType1Select QPMask@10 o_3@@61 f_5@@19)) (U_2_real (MapType1Select QPMask@11 o_3@@61 f_5@@19))))))
 :qid |stdinbpl.3286:29|
 :skolemid |409|
 :pattern ( (MapType1Select QPMask@11 o_3@@61 f_5@@19))
)))) (and (and (=> (= (ControlFlow 0 50) 49) anon260_Else_correct) (=> (= (ControlFlow 0 50) 27) anon261_Then_correct)) (=> (= (ControlFlow 0 50) 29) anon261_Else_correct))))))))))))))))))))))
(let ((anon259_Then_correct  (and (=> (= (ControlFlow 0 22) (- 0 25)) (forall ((n_48 T@U) (n_48_1 T@U) ) (!  (=> (and (= (type n_48) RefType) (= (type n_48_1) RefType)) (=> (and (and (and (and (not (= n_48 n_48_1)) (U_2_bool (MapType2Select g n_48))) (U_2_bool (MapType2Select g n_48_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_48 n_48_1))))
 :qid |stdinbpl.3114:21|
 :skolemid |386|
 :pattern ( (neverTriggered41 n_48) (neverTriggered41 n_48_1))
))) (=> (forall ((n_48@@0 T@U) (n_48_1@@0 T@U) ) (!  (=> (and (= (type n_48@@0) RefType) (= (type n_48_1@@0) RefType)) (=> (and (and (and (and (not (= n_48@@0 n_48_1@@0)) (U_2_bool (MapType2Select g n_48@@0))) (U_2_bool (MapType2Select g n_48_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_48@@0 n_48_1@@0))))
 :qid |stdinbpl.3114:21|
 :skolemid |386|
 :pattern ( (neverTriggered41 n_48@@0) (neverTriggered41 n_48_1@@0))
)) (and (=> (= (ControlFlow 0 22) (- 0 24)) (forall ((n_48@@1 T@U) ) (!  (=> (and (= (type n_48@@1) RefType) (U_2_bool (MapType2Select g n_48@@1))) (>= (U_2_real (MapType1Select QPMask@7 n_48@@1 car)) FullPerm))
 :qid |stdinbpl.3121:21|
 :skolemid |387|
 :pattern ( (MapType0Select ExhaleHeap@0 n_48@@1 car))
 :pattern ( (MapType1Select QPMask@8 n_48@@1 car))
 :pattern ( (MapType0Select ExhaleHeap@0 n_48@@1 car))
))) (=> (forall ((n_48@@2 T@U) ) (!  (=> (and (= (type n_48@@2) RefType) (U_2_bool (MapType2Select g n_48@@2))) (>= (U_2_real (MapType1Select QPMask@7 n_48@@2 car)) FullPerm))
 :qid |stdinbpl.3121:21|
 :skolemid |387|
 :pattern ( (MapType0Select ExhaleHeap@0 n_48@@2 car))
 :pattern ( (MapType1Select QPMask@8 n_48@@2 car))
 :pattern ( (MapType0Select ExhaleHeap@0 n_48@@2 car))
)) (=> (and (and (forall ((n_48@@3 T@U) ) (!  (=> (= (type n_48@@3) RefType) (=> (and (U_2_bool (MapType2Select g n_48@@3)) (< NoPerm FullPerm)) (and (qpRange41 n_48@@3) (= (invRecv41 n_48@@3) n_48@@3))))
 :qid |stdinbpl.3127:26|
 :skolemid |388|
 :pattern ( (MapType0Select ExhaleHeap@0 n_48@@3 car))
 :pattern ( (MapType1Select QPMask@8 n_48@@3 car))
 :pattern ( (MapType0Select ExhaleHeap@0 n_48@@3 car))
)) (forall ((o_3@@62 T@U) ) (!  (=> (= (type o_3@@62) RefType) (=> (and (U_2_bool (MapType2Select g (invRecv41 o_3@@62))) (and (< NoPerm FullPerm) (qpRange41 o_3@@62))) (= (invRecv41 o_3@@62) o_3@@62)))
 :qid |stdinbpl.3131:26|
 :skolemid |389|
 :pattern ( (invRecv41 o_3@@62))
))) (and (forall ((o_3@@63 T@U) ) (!  (=> (= (type o_3@@63) RefType) (and (=> (and (U_2_bool (MapType2Select g (invRecv41 o_3@@63))) (and (< NoPerm FullPerm) (qpRange41 o_3@@63))) (and (= (invRecv41 o_3@@63) o_3@@63) (= (U_2_real (MapType1Select QPMask@8 o_3@@63 car)) (- (U_2_real (MapType1Select QPMask@7 o_3@@63 car)) FullPerm)))) (=> (not (and (U_2_bool (MapType2Select g (invRecv41 o_3@@63))) (and (< NoPerm FullPerm) (qpRange41 o_3@@63)))) (= (U_2_real (MapType1Select QPMask@8 o_3@@63 car)) (U_2_real (MapType1Select QPMask@7 o_3@@63 car))))))
 :qid |stdinbpl.3137:26|
 :skolemid |390|
 :pattern ( (MapType1Select QPMask@8 o_3@@63 car))
)) (forall ((o_3@@64 T@U) (f_5@@20 T@U) ) (! (let ((B@@32 (FieldTypeInv1 (type f_5@@20))))
(let ((A@@33 (FieldTypeInv0 (type f_5@@20))))
 (=> (and (and (= (type o_3@@64) RefType) (= (type f_5@@20) (FieldType A@@33 B@@32))) (not (= f_5@@20 car))) (= (U_2_real (MapType1Select QPMask@7 o_3@@64 f_5@@20)) (U_2_real (MapType1Select QPMask@8 o_3@@64 f_5@@20))))))
 :qid |stdinbpl.3143:33|
 :skolemid |391|
 :pattern ( (MapType1Select QPMask@8 o_3@@64 f_5@@20))
)))) (and (=> (= (ControlFlow 0 22) (- 0 23)) (forall ((n$0_14 T@U) (n$0_14_1 T@U) ) (!  (=> (and (= (type n$0_14) RefType) (= (type n$0_14_1) RefType)) (=> (and (and (and (and (not (= n$0_14 n$0_14_1)) (U_2_bool (MapType2Select g n$0_14))) (U_2_bool (MapType2Select g n$0_14_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$0_14 n$0_14_1))))
 :qid |stdinbpl.3155:21|
 :skolemid |392|
 :pattern ( (neverTriggered42 n$0_14) (neverTriggered42 n$0_14_1))
))) (=> (forall ((n$0_14@@0 T@U) (n$0_14_1@@0 T@U) ) (!  (=> (and (= (type n$0_14@@0) RefType) (= (type n$0_14_1@@0) RefType)) (=> (and (and (and (and (not (= n$0_14@@0 n$0_14_1@@0)) (U_2_bool (MapType2Select g n$0_14@@0))) (U_2_bool (MapType2Select g n$0_14_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$0_14@@0 n$0_14_1@@0))))
 :qid |stdinbpl.3155:21|
 :skolemid |392|
 :pattern ( (neverTriggered42 n$0_14@@0) (neverTriggered42 n$0_14_1@@0))
)) (=> (= (ControlFlow 0 22) (- 0 21)) (forall ((n$0_14@@1 T@U) ) (!  (=> (and (= (type n$0_14@@1) RefType) (U_2_bool (MapType2Select g n$0_14@@1))) (>= (U_2_real (MapType1Select QPMask@8 n$0_14@@1 cdr)) FullPerm))
 :qid |stdinbpl.3162:21|
 :skolemid |393|
 :pattern ( (MapType0Select ExhaleHeap@0 n$0_14@@1 cdr))
 :pattern ( (MapType1Select QPMask@9 n$0_14@@1 cdr))
 :pattern ( (MapType0Select ExhaleHeap@0 n$0_14@@1 cdr))
))))))))))))
(let ((anon152_correct  (=> (state ExhaleHeap@0 QPMask@7) (=> (and (and (or (and (forall ((n_43 T@U) ) (!  (=> (= (type n_43) RefType) (= (U_2_bool (MapType2Select roots n_43)) (U_2_bool (MapType2Select pending@0 n_43))))
 :qid |stdinbpl.3077:23|
 :skolemid |380|
 :pattern ( (MapType2Select pending@0 n_43))
 :pattern ( (MapType2Select roots n_43))
)) (forall ((n_44 T@U) ) (!  (=> (and (= (type n_44) RefType) (U_2_bool (MapType2Select g n_44))) (not (U_2_bool (MapType2Select marked@1 n_44))))
 :qid |stdinbpl.3080:20|
 :skolemid |381|
 :pattern ( (MapType2Select marked@1 n_44))
))) (and (forall ((n_45 T@U) ) (!  (=> (and (= (type n_45) RefType) (U_2_bool (MapType2Select roots n_45))) (or (U_2_bool (MapType2Select marked@1 n_45)) (U_2_bool (MapType2Select pending@0 n_45))))
 :qid |stdinbpl.3083:22|
 :skolemid |382|
 :pattern ( (MapType2Select pending@0 n_45))
 :pattern ( (MapType2Select marked@1 n_45))
)) (and (forall ((n_46 T@U) ) (!  (=> (and (= (type n_46) RefType) (U_2_bool (MapType2Select g n_46))) (not (and (U_2_bool (MapType2Select marked@1 n_46)) (U_2_bool (MapType2Select pending@0 n_46)))))
 :qid |stdinbpl.3086:21|
 :skolemid |383|
 :pattern ( (MapType2Select pending@0 n_46))
)) (and (forall ((n_47 T@U) ) (!  (=> (and (= (type n_47) RefType) (or (U_2_bool (MapType2Select pending@0 n_47)) (U_2_bool (MapType2Select marked@1 n_47)))) (exists_spath ($$ ExhaleHeap@0 g) roots n_47))
 :qid |stdinbpl.3089:21|
 :skolemid |384|
 :pattern ( (exists_spath (|$$#frame| (CombineFrames (FrameFragment (int_2_U (|$$#condqp1| ExhaleHeap@0 g))) (FrameFragment (int_2_U (|$$#condqp2| ExhaleHeap@0 g)))) g) roots n_47))
)) (forall ((n1_5 T@U) (n2_5 T@U) ) (!  (=> (and (and (= (type n1_5) RefType) (= (type n2_5) RefType)) (and (U_2_bool (MapType2Select marked@1 n1_5)) (and (U_2_bool (MapType2Select g n2_5)) (and (not (U_2_bool (MapType2Select marked@1 n2_5))) (not (U_2_bool (MapType2Select pending@0 n2_5))))))) (not (U_2_bool (MapType2Select ($$ ExhaleHeap@0 g) (create_edge n1_5 n2_5)))))
 :qid |stdinbpl.3092:20|
 :skolemid |385|
 :pattern ( (MapType2Select marked@1 n1_5) (MapType2Select marked@1 n2_5))
)))))) (state ExhaleHeap@0 QPMask@7)) (and (state ExhaleHeap@0 QPMask@7) (state ExhaleHeap@0 QPMask@7))) (and (=> (= (ControlFlow 0 58) 22) anon259_Then_correct) (=> (= (ControlFlow 0 58) 50) anon259_Else_correct))))))
(let ((anon258_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select ($$ ExhaleHeap@0 g) (create_edge x_1@1 (MapType0Select ExhaleHeap@0 x_1@1 car)))) (exists_path ($$ ExhaleHeap@0 g) (MapType0Select ExhaleHeap@0 x_1@1 car) (MapType0Select ExhaleHeap@0 x_1@1 car)))) (= (ControlFlow 0 61) 58)) anon152_correct)))
(let ((anon258_Then_correct  (=> (and (and (and (U_2_bool (MapType2Select ($$ ExhaleHeap@0 g) (create_edge x_1@1 (MapType0Select ExhaleHeap@0 x_1@1 car)))) (exists_path ($$ ExhaleHeap@0 g) (MapType0Select ExhaleHeap@0 x_1@1 car) (MapType0Select ExhaleHeap@0 x_1@1 car))) (state ExhaleHeap@0 QPMask@7)) (and (exists_path ($$ ExhaleHeap@0 g) x_1@1 (MapType0Select ExhaleHeap@0 x_1@1 car)) (= (ControlFlow 0 60) 58))) anon152_correct)))
(let ((anon257_Then_correct  (=> (not (= (MapType0Select ExhaleHeap@0 x_1@1 car) null)) (and (=> (= (ControlFlow 0 62) 60) anon258_Then_correct) (=> (= (ControlFlow 0 62) 61) anon258_Else_correct)))))
(let ((anon257_Else_correct  (=> (and (= (MapType0Select ExhaleHeap@0 x_1@1 car) null) (= (ControlFlow 0 59) 58)) anon152_correct)))
(let ((anon256_Else_correct  (=> (not (and (U_2_bool (MapType2Select ($$ ExhaleHeap@0 g) (create_edge x_1@1 (MapType0Select ExhaleHeap@0 x_1@1 cdr)))) (exists_path ($$ ExhaleHeap@0 g) (MapType0Select ExhaleHeap@0 x_1@1 cdr) (MapType0Select ExhaleHeap@0 x_1@1 cdr)))) (and (=> (= (ControlFlow 0 65) 62) anon257_Then_correct) (=> (= (ControlFlow 0 65) 59) anon257_Else_correct)))))
(let ((anon256_Then_correct  (=> (and (and (U_2_bool (MapType2Select ($$ ExhaleHeap@0 g) (create_edge x_1@1 (MapType0Select ExhaleHeap@0 x_1@1 cdr)))) (exists_path ($$ ExhaleHeap@0 g) (MapType0Select ExhaleHeap@0 x_1@1 cdr) (MapType0Select ExhaleHeap@0 x_1@1 cdr))) (and (state ExhaleHeap@0 QPMask@7) (exists_path ($$ ExhaleHeap@0 g) x_1@1 (MapType0Select ExhaleHeap@0 x_1@1 cdr)))) (and (=> (= (ControlFlow 0 64) 62) anon257_Then_correct) (=> (= (ControlFlow 0 64) 59) anon257_Else_correct)))))
(let ((anon255_Then_correct  (=> (not (= (MapType0Select ExhaleHeap@0 x_1@1 cdr) null)) (and (=> (= (ControlFlow 0 66) 64) anon256_Then_correct) (=> (= (ControlFlow 0 66) 65) anon256_Else_correct)))))
(let ((anon255_Else_correct  (=> (= (MapType0Select ExhaleHeap@0 x_1@1 cdr) null) (and (=> (= (ControlFlow 0 63) 62) anon257_Then_correct) (=> (= (ControlFlow 0 63) 59) anon257_Else_correct)))))
(let ((anon237_Else_correct  (=> (not (> (|Set#Card| pending@0) 0)) (=> (and (state ExhaleHeap@0 QPMask@3) (not (U_2_bool (MapType2Select g null)))) (and (=> (= (ControlFlow 0 67) (- 0 69)) (forall ((n$9_5 T@U) (n$9_5_1 T@U) ) (!  (=> (and (= (type n$9_5) RefType) (= (type n$9_5_1) RefType)) (=> (and (and (and (and (not (= n$9_5 n$9_5_1)) (U_2_bool (MapType2Select g n$9_5))) (U_2_bool (MapType2Select g n$9_5_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$9_5 n$9_5_1))))
 :qid |stdinbpl.2985:17|
 :skolemid |366|
 :no-pattern (type n$9_5)
 :no-pattern (type n$9_5_1)
 :no-pattern (U_2_int n$9_5)
 :no-pattern (U_2_bool n$9_5)
 :no-pattern (U_2_int n$9_5_1)
 :no-pattern (U_2_bool n$9_5_1)
))) (=> (forall ((n$9_5@@0 T@U) (n$9_5_1@@0 T@U) ) (!  (=> (and (= (type n$9_5@@0) RefType) (= (type n$9_5_1@@0) RefType)) (=> (and (and (and (and (not (= n$9_5@@0 n$9_5_1@@0)) (U_2_bool (MapType2Select g n$9_5@@0))) (U_2_bool (MapType2Select g n$9_5_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$9_5@@0 n$9_5_1@@0))))
 :qid |stdinbpl.2985:17|
 :skolemid |366|
 :no-pattern (type n$9_5@@0)
 :no-pattern (type n$9_5_1@@0)
 :no-pattern (U_2_int n$9_5@@0)
 :no-pattern (U_2_bool n$9_5@@0)
 :no-pattern (U_2_int n$9_5_1@@0)
 :no-pattern (U_2_bool n$9_5_1@@0)
)) (=> (and (forall ((n$9_5@@1 T@U) ) (!  (=> (= (type n$9_5@@1) RefType) (=> (and (U_2_bool (MapType2Select g n$9_5@@1)) (< NoPerm FullPerm)) (and (qpRange39 n$9_5@@1) (= (invRecv39 n$9_5@@1) n$9_5@@1))))
 :qid |stdinbpl.2991:24|
 :skolemid |367|
 :pattern ( (MapType0Select ExhaleHeap@0 n$9_5@@1 car))
 :pattern ( (MapType1Select QPMask@6 n$9_5@@1 car))
 :pattern ( (MapType0Select ExhaleHeap@0 n$9_5@@1 car))
)) (forall ((o_3@@65 T@U) ) (!  (=> (= (type o_3@@65) RefType) (=> (and (and (U_2_bool (MapType2Select g (invRecv39 o_3@@65))) (< NoPerm FullPerm)) (qpRange39 o_3@@65)) (= (invRecv39 o_3@@65) o_3@@65)))
 :qid |stdinbpl.2995:24|
 :skolemid |368|
 :pattern ( (invRecv39 o_3@@65))
))) (=> (and (and (forall ((n$9_5@@2 T@U) ) (!  (=> (and (= (type n$9_5@@2) RefType) (U_2_bool (MapType2Select g n$9_5@@2))) (not (= n$9_5@@2 null)))
 :qid |stdinbpl.3001:24|
 :skolemid |369|
 :pattern ( (MapType0Select ExhaleHeap@0 n$9_5@@2 car))
 :pattern ( (MapType1Select QPMask@6 n$9_5@@2 car))
 :pattern ( (MapType0Select ExhaleHeap@0 n$9_5@@2 car))
)) (forall ((o_3@@66 T@U) ) (!  (=> (= (type o_3@@66) RefType) (and (=> (and (and (U_2_bool (MapType2Select g (invRecv39 o_3@@66))) (< NoPerm FullPerm)) (qpRange39 o_3@@66)) (and (=> (< NoPerm FullPerm) (= (invRecv39 o_3@@66) o_3@@66)) (= (U_2_real (MapType1Select QPMask@6 o_3@@66 car)) (+ (U_2_real (MapType1Select QPMask@3 o_3@@66 car)) FullPerm)))) (=> (not (and (and (U_2_bool (MapType2Select g (invRecv39 o_3@@66))) (< NoPerm FullPerm)) (qpRange39 o_3@@66))) (= (U_2_real (MapType1Select QPMask@6 o_3@@66 car)) (U_2_real (MapType1Select QPMask@3 o_3@@66 car))))))
 :qid |stdinbpl.3007:24|
 :skolemid |370|
 :pattern ( (MapType1Select QPMask@6 o_3@@66 car))
))) (and (forall ((o_3@@67 T@U) (f_5@@21 T@U) ) (! (let ((B@@33 (FieldTypeInv1 (type f_5@@21))))
(let ((A@@34 (FieldTypeInv0 (type f_5@@21))))
 (=> (and (and (= (type o_3@@67) RefType) (= (type f_5@@21) (FieldType A@@34 B@@33))) (not (= f_5@@21 car))) (= (U_2_real (MapType1Select QPMask@3 o_3@@67 f_5@@21)) (U_2_real (MapType1Select QPMask@6 o_3@@67 f_5@@21))))))
 :qid |stdinbpl.3011:31|
 :skolemid |371|
 :pattern ( (MapType1Select QPMask@3 o_3@@67 f_5@@21))
 :pattern ( (MapType1Select QPMask@6 o_3@@67 f_5@@21))
)) (state ExhaleHeap@0 QPMask@6))) (and (=> (= (ControlFlow 0 67) (- 0 68)) (forall ((n$10_5 T@U) (n$10_5_1 T@U) ) (!  (=> (and (= (type n$10_5) RefType) (= (type n$10_5_1) RefType)) (=> (and (and (and (and (not (= n$10_5 n$10_5_1)) (U_2_bool (MapType2Select g n$10_5))) (U_2_bool (MapType2Select g n$10_5_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$10_5 n$10_5_1))))
 :qid |stdinbpl.3019:17|
 :skolemid |372|
 :no-pattern (type n$10_5)
 :no-pattern (type n$10_5_1)
 :no-pattern (U_2_int n$10_5)
 :no-pattern (U_2_bool n$10_5)
 :no-pattern (U_2_int n$10_5_1)
 :no-pattern (U_2_bool n$10_5_1)
))) (=> (forall ((n$10_5@@0 T@U) (n$10_5_1@@0 T@U) ) (!  (=> (and (= (type n$10_5@@0) RefType) (= (type n$10_5_1@@0) RefType)) (=> (and (and (and (and (not (= n$10_5@@0 n$10_5_1@@0)) (U_2_bool (MapType2Select g n$10_5@@0))) (U_2_bool (MapType2Select g n$10_5_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$10_5@@0 n$10_5_1@@0))))
 :qid |stdinbpl.3019:17|
 :skolemid |372|
 :no-pattern (type n$10_5@@0)
 :no-pattern (type n$10_5_1@@0)
 :no-pattern (U_2_int n$10_5@@0)
 :no-pattern (U_2_bool n$10_5@@0)
 :no-pattern (U_2_int n$10_5_1@@0)
 :no-pattern (U_2_bool n$10_5_1@@0)
)) (=> (forall ((n$10_5@@1 T@U) ) (!  (=> (= (type n$10_5@@1) RefType) (=> (and (U_2_bool (MapType2Select g n$10_5@@1)) (< NoPerm FullPerm)) (and (qpRange40 n$10_5@@1) (= (invRecv40 n$10_5@@1) n$10_5@@1))))
 :qid |stdinbpl.3025:24|
 :skolemid |373|
 :pattern ( (MapType0Select ExhaleHeap@0 n$10_5@@1 cdr))
 :pattern ( (MapType1Select QPMask@7 n$10_5@@1 cdr))
 :pattern ( (MapType0Select ExhaleHeap@0 n$10_5@@1 cdr))
)) (=> (and (and (forall ((o_3@@68 T@U) ) (!  (=> (= (type o_3@@68) RefType) (=> (and (and (U_2_bool (MapType2Select g (invRecv40 o_3@@68))) (< NoPerm FullPerm)) (qpRange40 o_3@@68)) (= (invRecv40 o_3@@68) o_3@@68)))
 :qid |stdinbpl.3029:24|
 :skolemid |374|
 :pattern ( (invRecv40 o_3@@68))
)) (forall ((n$10_5@@2 T@U) ) (!  (=> (and (= (type n$10_5@@2) RefType) (U_2_bool (MapType2Select g n$10_5@@2))) (not (= n$10_5@@2 null)))
 :qid |stdinbpl.3035:24|
 :skolemid |375|
 :pattern ( (MapType0Select ExhaleHeap@0 n$10_5@@2 cdr))
 :pattern ( (MapType1Select QPMask@7 n$10_5@@2 cdr))
 :pattern ( (MapType0Select ExhaleHeap@0 n$10_5@@2 cdr))
))) (and (forall ((o_3@@69 T@U) ) (!  (=> (= (type o_3@@69) RefType) (and (=> (and (and (U_2_bool (MapType2Select g (invRecv40 o_3@@69))) (< NoPerm FullPerm)) (qpRange40 o_3@@69)) (and (=> (< NoPerm FullPerm) (= (invRecv40 o_3@@69) o_3@@69)) (= (U_2_real (MapType1Select QPMask@7 o_3@@69 cdr)) (+ (U_2_real (MapType1Select QPMask@6 o_3@@69 cdr)) FullPerm)))) (=> (not (and (and (U_2_bool (MapType2Select g (invRecv40 o_3@@69))) (< NoPerm FullPerm)) (qpRange40 o_3@@69))) (= (U_2_real (MapType1Select QPMask@7 o_3@@69 cdr)) (U_2_real (MapType1Select QPMask@6 o_3@@69 cdr))))))
 :qid |stdinbpl.3041:24|
 :skolemid |376|
 :pattern ( (MapType1Select QPMask@7 o_3@@69 cdr))
)) (forall ((o_3@@70 T@U) (f_5@@22 T@U) ) (! (let ((B@@34 (FieldTypeInv1 (type f_5@@22))))
(let ((A@@35 (FieldTypeInv0 (type f_5@@22))))
 (=> (and (and (= (type o_3@@70) RefType) (= (type f_5@@22) (FieldType A@@35 B@@34))) (not (= f_5@@22 cdr))) (= (U_2_real (MapType1Select QPMask@6 o_3@@70 f_5@@22)) (U_2_real (MapType1Select QPMask@7 o_3@@70 f_5@@22))))))
 :qid |stdinbpl.3045:31|
 :skolemid |377|
 :pattern ( (MapType1Select QPMask@6 o_3@@70 f_5@@22))
 :pattern ( (MapType1Select QPMask@7 o_3@@70 f_5@@22))
)))) (=> (and (and (and (state ExhaleHeap@0 QPMask@7) (forall ((n$7_7 T@U) ) (!  (=> (and (= (type n$7_7) RefType) (U_2_bool (MapType2Select g n$7_7))) (U_2_bool (MapType2Select g (MapType0Select ExhaleHeap@0 n$7_7 car))))
 :qid |stdinbpl.3051:22|
 :skolemid |378|
 :pattern ( (MapType2Select g (MapType0Select ExhaleHeap@0 n$7_7 car)))
 :pattern ( (MapType2Select g n$7_7) (MapType0Select ExhaleHeap@0 n$7_7 car))
))) (and (forall ((n$8_7 T@U) ) (!  (=> (and (= (type n$8_7) RefType) (U_2_bool (MapType2Select g n$8_7))) (U_2_bool (MapType2Select g (MapType0Select ExhaleHeap@0 n$8_7 cdr))))
 :qid |stdinbpl.3055:22|
 :skolemid |379|
 :pattern ( (MapType2Select g (MapType0Select ExhaleHeap@0 n$8_7 cdr)))
 :pattern ( (MapType2Select g n$8_7) (MapType0Select ExhaleHeap@0 n$8_7 cdr))
)) (U_2_bool (MapType2Select g x_1@1)))) (and (and (|Set#Subset| pending@0 g) (|Set#Subset| marked@1 g)) (and (state ExhaleHeap@0 QPMask@7) (exists_spath ($$ ExhaleHeap@0 g) roots x_1@1)))) (and (=> (= (ControlFlow 0 67) 66) anon255_Then_correct) (=> (= (ControlFlow 0 67) 63) anon255_Else_correct)))))))))))))))
(let ((anon53_correct  (and (=> (= (ControlFlow 0 244) (- 0 245)) (or (and (forall ((n_4 T@U) ) (!  (=> (= (type n_4) RefType) (= (U_2_bool (MapType2Select roots n_4)) (U_2_bool (MapType2Select roots n_4))))
 :qid |stdinbpl.1521:20|
 :skolemid |186|
 :pattern ( (MapType2Select roots n_4))
 :pattern ( (MapType2Select roots n_4))
)) (forall ((n_5 T@U) ) (!  (=> (and (= (type n_5) RefType) (U_2_bool (MapType2Select g n_5))) (not (U_2_bool (MapType2Select marked@0 n_5))))
 :qid |stdinbpl.1524:22|
 :skolemid |187|
 :pattern ( (MapType2Select marked@0 n_5))
))) (and (forall ((n_6 T@U) ) (!  (=> (and (= (type n_6) RefType) (U_2_bool (MapType2Select roots n_6))) (or (U_2_bool (MapType2Select marked@0 n_6)) (U_2_bool (MapType2Select roots n_6))))
 :qid |stdinbpl.1527:24|
 :skolemid |188|
 :pattern ( (MapType2Select roots n_6))
 :pattern ( (MapType2Select marked@0 n_6))
)) (and (forall ((n_7 T@U) ) (!  (=> (and (= (type n_7) RefType) (U_2_bool (MapType2Select g n_7))) (not (and (U_2_bool (MapType2Select marked@0 n_7)) (U_2_bool (MapType2Select roots n_7)))))
 :qid |stdinbpl.1530:23|
 :skolemid |189|
 :pattern ( (MapType2Select roots n_7))
)) (and (forall ((n_8 T@U) ) (!  (=> (and (= (type n_8) RefType) (or (U_2_bool (MapType2Select roots n_8)) (U_2_bool (MapType2Select marked@0 n_8)))) (exists_spath ($$ Heap@@17 g) roots n_8))
 :qid |stdinbpl.1533:23|
 :skolemid |190|
 :pattern ( (exists_spath (|$$#frame| (CombineFrames (FrameFragment (int_2_U (|$$#condqp1| Heap@@17 g))) (FrameFragment (int_2_U (|$$#condqp2| Heap@@17 g)))) g) roots n_8))
)) (forall ((n1 T@U) (n2 T@U) ) (!  (=> (and (and (= (type n1) RefType) (= (type n2) RefType)) (and (U_2_bool (MapType2Select marked@0 n1)) (and (U_2_bool (MapType2Select g n2)) (and (not (U_2_bool (MapType2Select marked@0 n2))) (not (U_2_bool (MapType2Select roots n2))))))) (not (U_2_bool (MapType2Select ($$ Heap@@17 g) (create_edge n1 n2)))))
 :qid |stdinbpl.1536:22|
 :skolemid |191|
 :pattern ( (MapType2Select marked@0 n1) (MapType2Select marked@0 n2))
))))))) (=> (or (and (forall ((n_4@@0 T@U) ) (!  (=> (= (type n_4@@0) RefType) (= (U_2_bool (MapType2Select roots n_4@@0)) (U_2_bool (MapType2Select roots n_4@@0))))
 :qid |stdinbpl.1521:20|
 :skolemid |186|
 :pattern ( (MapType2Select roots n_4@@0))
 :pattern ( (MapType2Select roots n_4@@0))
)) (forall ((n_5@@0 T@U) ) (!  (=> (and (= (type n_5@@0) RefType) (U_2_bool (MapType2Select g n_5@@0))) (not (U_2_bool (MapType2Select marked@0 n_5@@0))))
 :qid |stdinbpl.1524:22|
 :skolemid |187|
 :pattern ( (MapType2Select marked@0 n_5@@0))
))) (and (forall ((n_6@@0 T@U) ) (!  (=> (and (= (type n_6@@0) RefType) (U_2_bool (MapType2Select roots n_6@@0))) (or (U_2_bool (MapType2Select marked@0 n_6@@0)) (U_2_bool (MapType2Select roots n_6@@0))))
 :qid |stdinbpl.1527:24|
 :skolemid |188|
 :pattern ( (MapType2Select roots n_6@@0))
 :pattern ( (MapType2Select marked@0 n_6@@0))
)) (and (forall ((n_7@@0 T@U) ) (!  (=> (and (= (type n_7@@0) RefType) (U_2_bool (MapType2Select g n_7@@0))) (not (and (U_2_bool (MapType2Select marked@0 n_7@@0)) (U_2_bool (MapType2Select roots n_7@@0)))))
 :qid |stdinbpl.1530:23|
 :skolemid |189|
 :pattern ( (MapType2Select roots n_7@@0))
)) (and (forall ((n_8@@0 T@U) ) (!  (=> (and (= (type n_8@@0) RefType) (or (U_2_bool (MapType2Select roots n_8@@0)) (U_2_bool (MapType2Select marked@0 n_8@@0)))) (exists_spath ($$ Heap@@17 g) roots n_8@@0))
 :qid |stdinbpl.1533:23|
 :skolemid |190|
 :pattern ( (exists_spath (|$$#frame| (CombineFrames (FrameFragment (int_2_U (|$$#condqp1| Heap@@17 g))) (FrameFragment (int_2_U (|$$#condqp2| Heap@@17 g)))) g) roots n_8@@0))
)) (forall ((n1@@0 T@U) (n2@@0 T@U) ) (!  (=> (and (and (= (type n1@@0) RefType) (= (type n2@@0) RefType)) (and (U_2_bool (MapType2Select marked@0 n1@@0)) (and (U_2_bool (MapType2Select g n2@@0)) (and (not (U_2_bool (MapType2Select marked@0 n2@@0))) (not (U_2_bool (MapType2Select roots n2@@0))))))) (not (U_2_bool (MapType2Select ($$ Heap@@17 g) (create_edge n1@@0 n2@@0)))))
 :qid |stdinbpl.1536:22|
 :skolemid |191|
 :pattern ( (MapType2Select marked@0 n1@@0) (MapType2Select marked@0 n2@@0))
)))))) (=> (and (IdenticalOnKnownLocations Heap@@17 ExhaleHeap@0 QPMask@3) (U_2_bool (MapType0Select ExhaleHeap@0 x_1@1 $allocated))) (and (and (=> (= (ControlFlow 0 244) 243) anon202_Then_correct) (=> (= (ControlFlow 0 244) 129) anon237_Then_correct)) (=> (= (ControlFlow 0 244) 67) anon237_Else_correct)))))))
(let ((anon201_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select ($$ Heap@@17 g) (create_edge x_1@0 (MapType0Select Heap@@17 x_1@0 car)))) (exists_path ($$ Heap@@17 g) (MapType0Select Heap@@17 x_1@0 car) (MapType0Select Heap@@17 x_1@0 car)))) (= (ControlFlow 0 249) 244)) anon53_correct)))
(let ((anon201_Then_correct  (=> (and (U_2_bool (MapType2Select ($$ Heap@@17 g) (create_edge x_1@0 (MapType0Select Heap@@17 x_1@0 car)))) (exists_path ($$ Heap@@17 g) (MapType0Select Heap@@17 x_1@0 car) (MapType0Select Heap@@17 x_1@0 car))) (and (=> (= (ControlFlow 0 247) (- 0 248)) (exists_path ($$ Heap@@17 g) x_1@0 (MapType0Select Heap@@17 x_1@0 car))) (=> (exists_path ($$ Heap@@17 g) x_1@0 (MapType0Select Heap@@17 x_1@0 car)) (=> (= (ControlFlow 0 247) 244) anon53_correct))))))
(let ((anon200_Then_correct  (=> (not (= (MapType0Select Heap@@17 x_1@0 car) null)) (and (=> (= (ControlFlow 0 250) 247) anon201_Then_correct) (=> (= (ControlFlow 0 250) 249) anon201_Else_correct)))))
(let ((anon200_Else_correct  (=> (and (= (MapType0Select Heap@@17 x_1@0 car) null) (= (ControlFlow 0 246) 244)) anon53_correct)))
(let ((anon199_Else_correct  (=> (not (and (U_2_bool (MapType2Select ($$ Heap@@17 g) (create_edge x_1@0 (MapType0Select Heap@@17 x_1@0 cdr)))) (exists_path ($$ Heap@@17 g) (MapType0Select Heap@@17 x_1@0 cdr) (MapType0Select Heap@@17 x_1@0 cdr)))) (and (=> (= (ControlFlow 0 254) 250) anon200_Then_correct) (=> (= (ControlFlow 0 254) 246) anon200_Else_correct)))))
(let ((anon199_Then_correct  (=> (and (U_2_bool (MapType2Select ($$ Heap@@17 g) (create_edge x_1@0 (MapType0Select Heap@@17 x_1@0 cdr)))) (exists_path ($$ Heap@@17 g) (MapType0Select Heap@@17 x_1@0 cdr) (MapType0Select Heap@@17 x_1@0 cdr))) (and (=> (= (ControlFlow 0 252) (- 0 253)) (exists_path ($$ Heap@@17 g) x_1@0 (MapType0Select Heap@@17 x_1@0 cdr))) (=> (exists_path ($$ Heap@@17 g) x_1@0 (MapType0Select Heap@@17 x_1@0 cdr)) (and (=> (= (ControlFlow 0 252) 250) anon200_Then_correct) (=> (= (ControlFlow 0 252) 246) anon200_Else_correct)))))))
(let ((anon198_Then_correct  (=> (not (= (MapType0Select Heap@@17 x_1@0 cdr) null)) (and (=> (= (ControlFlow 0 255) 252) anon199_Then_correct) (=> (= (ControlFlow 0 255) 254) anon199_Else_correct)))))
(let ((anon198_Else_correct  (=> (= (MapType0Select Heap@@17 x_1@0 cdr) null) (and (=> (= (ControlFlow 0 251) 250) anon200_Then_correct) (=> (= (ControlFlow 0 251) 246) anon200_Else_correct)))))
(let ((anon196_Else_correct  (=> (forall ((n$8_1_1 T@U) ) (!  (=> (and (= (type n$8_1_1) RefType) (U_2_bool (MapType2Select g n$8_1_1))) (U_2_bool (MapType2Select g (MapType0Select Heap@@17 n$8_1_1 cdr))))
 :qid |stdinbpl.1496:24|
 :skolemid |185|
 :pattern ( (MapType2Select g (MapType0Select Heap@@17 n$8_1_1 cdr)))
 :pattern ( (MapType2Select g n$8_1_1) (MapType0Select Heap@@17 n$8_1_1 cdr))
)) (and (=> (= (ControlFlow 0 256) (- 0 260)) (U_2_bool (MapType2Select g x_1@0))) (=> (U_2_bool (MapType2Select g x_1@0)) (and (=> (= (ControlFlow 0 256) (- 0 259)) (|Set#Subset| roots g)) (=> (|Set#Subset| roots g) (and (=> (= (ControlFlow 0 256) (- 0 258)) (|Set#Subset| marked@0 g)) (=> (|Set#Subset| marked@0 g) (and (=> (= (ControlFlow 0 256) (- 0 257)) (exists_spath ($$ Heap@@17 g) roots x_1@0)) (=> (exists_spath ($$ Heap@@17 g) roots x_1@0) (and (=> (= (ControlFlow 0 256) 255) anon198_Then_correct) (=> (= (ControlFlow 0 256) 251) anon198_Else_correct)))))))))))))
(let ((anon46_correct true))
(let ((anon197_Else_correct  (=> (and (not (U_2_bool (MapType2Select g n$8))) (= (ControlFlow 0 20) 17)) anon46_correct)))
(let ((anon197_Then_correct  (=> (U_2_bool (MapType2Select g n$8)) (and (=> (= (ControlFlow 0 18) (- 0 19)) (U_2_bool (MapType2Select g (MapType0Select Heap@@17 n$8 cdr)))) (=> (U_2_bool (MapType2Select g (MapType0Select Heap@@17 n$8 cdr))) (=> (= (ControlFlow 0 18) 17) anon46_correct))))))
(let ((anon194_Else_correct  (=> (forall ((n$7_1_1 T@U) ) (!  (=> (and (= (type n$7_1_1) RefType) (U_2_bool (MapType2Select g n$7_1_1))) (U_2_bool (MapType2Select g (MapType0Select Heap@@17 n$7_1_1 car))))
 :qid |stdinbpl.1485:24|
 :skolemid |184|
 :pattern ( (MapType2Select g (MapType0Select Heap@@17 n$7_1_1 car)))
 :pattern ( (MapType2Select g n$7_1_1) (MapType0Select Heap@@17 n$7_1_1 car))
)) (and (and (=> (= (ControlFlow 0 261) 256) anon196_Else_correct) (=> (= (ControlFlow 0 261) 18) anon197_Then_correct)) (=> (= (ControlFlow 0 261) 20) anon197_Else_correct)))))
(let ((anon42_correct true))
(let ((anon195_Else_correct  (=> (and (not (U_2_bool (MapType2Select g n$7))) (= (ControlFlow 0 16) 13)) anon42_correct)))
(let ((anon195_Then_correct  (=> (U_2_bool (MapType2Select g n$7)) (and (=> (= (ControlFlow 0 14) (- 0 15)) (U_2_bool (MapType2Select g (MapType0Select Heap@@17 n$7 car)))) (=> (U_2_bool (MapType2Select g (MapType0Select Heap@@17 n$7 car))) (=> (= (ControlFlow 0 14) 13) anon42_correct))))))
(let ((anon193_Else_correct  (=> (= x_1@0 (get Heap@@17 roots)) (=> (and (and (state Heap@@17 QPMask@1) (state Heap@@17 QPMask@1)) (and (= marked@0 (|Set#Empty| RefType)) (state Heap@@17 QPMask@1))) (and (=> (= (ControlFlow 0 262) (- 0 267)) (not (U_2_bool (MapType2Select g null)))) (=> (not (U_2_bool (MapType2Select g null))) (and (=> (= (ControlFlow 0 262) (- 0 266)) (forall ((n$9 T@U) (n$9_1 T@U) ) (!  (=> (and (= (type n$9) RefType) (= (type n$9_1) RefType)) (=> (and (and (and (and (not (= n$9 n$9_1)) (U_2_bool (MapType2Select g n$9))) (U_2_bool (MapType2Select g n$9_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$9 n$9_1))))
 :qid |stdinbpl.1403:21|
 :skolemid |172|
 :pattern ( (neverTriggered13 n$9) (neverTriggered13 n$9_1))
))) (=> (forall ((n$9@@0 T@U) (n$9_1@@0 T@U) ) (!  (=> (and (= (type n$9@@0) RefType) (= (type n$9_1@@0) RefType)) (=> (and (and (and (and (not (= n$9@@0 n$9_1@@0)) (U_2_bool (MapType2Select g n$9@@0))) (U_2_bool (MapType2Select g n$9_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$9@@0 n$9_1@@0))))
 :qid |stdinbpl.1403:21|
 :skolemid |172|
 :pattern ( (neverTriggered13 n$9@@0) (neverTriggered13 n$9_1@@0))
)) (and (=> (= (ControlFlow 0 262) (- 0 265)) (forall ((n$9@@1 T@U) ) (!  (=> (and (= (type n$9@@1) RefType) (U_2_bool (MapType2Select g n$9@@1))) (>= (U_2_real (MapType1Select QPMask@1 n$9@@1 car)) FullPerm))
 :qid |stdinbpl.1410:21|
 :skolemid |173|
 :pattern ( (MapType0Select Heap@@17 n$9@@1 car))
 :pattern ( (MapType1Select QPMask@2 n$9@@1 car))
 :pattern ( (MapType0Select Heap@@17 n$9@@1 car))
))) (=> (forall ((n$9@@2 T@U) ) (!  (=> (and (= (type n$9@@2) RefType) (U_2_bool (MapType2Select g n$9@@2))) (>= (U_2_real (MapType1Select QPMask@1 n$9@@2 car)) FullPerm))
 :qid |stdinbpl.1410:21|
 :skolemid |173|
 :pattern ( (MapType0Select Heap@@17 n$9@@2 car))
 :pattern ( (MapType1Select QPMask@2 n$9@@2 car))
 :pattern ( (MapType0Select Heap@@17 n$9@@2 car))
)) (=> (and (and (forall ((n$9@@3 T@U) ) (!  (=> (= (type n$9@@3) RefType) (=> (and (U_2_bool (MapType2Select g n$9@@3)) (< NoPerm FullPerm)) (and (qpRange13 n$9@@3) (= (invRecv13 n$9@@3) n$9@@3))))
 :qid |stdinbpl.1416:26|
 :skolemid |174|
 :pattern ( (MapType0Select Heap@@17 n$9@@3 car))
 :pattern ( (MapType1Select QPMask@2 n$9@@3 car))
 :pattern ( (MapType0Select Heap@@17 n$9@@3 car))
)) (forall ((o_3@@71 T@U) ) (!  (=> (= (type o_3@@71) RefType) (=> (and (U_2_bool (MapType2Select g (invRecv13 o_3@@71))) (and (< NoPerm FullPerm) (qpRange13 o_3@@71))) (= (invRecv13 o_3@@71) o_3@@71)))
 :qid |stdinbpl.1420:26|
 :skolemid |175|
 :pattern ( (invRecv13 o_3@@71))
))) (and (forall ((o_3@@72 T@U) ) (!  (=> (= (type o_3@@72) RefType) (and (=> (and (U_2_bool (MapType2Select g (invRecv13 o_3@@72))) (and (< NoPerm FullPerm) (qpRange13 o_3@@72))) (and (= (invRecv13 o_3@@72) o_3@@72) (= (U_2_real (MapType1Select QPMask@2 o_3@@72 car)) (- (U_2_real (MapType1Select QPMask@1 o_3@@72 car)) FullPerm)))) (=> (not (and (U_2_bool (MapType2Select g (invRecv13 o_3@@72))) (and (< NoPerm FullPerm) (qpRange13 o_3@@72)))) (= (U_2_real (MapType1Select QPMask@2 o_3@@72 car)) (U_2_real (MapType1Select QPMask@1 o_3@@72 car))))))
 :qid |stdinbpl.1426:26|
 :skolemid |176|
 :pattern ( (MapType1Select QPMask@2 o_3@@72 car))
)) (forall ((o_3@@73 T@U) (f_5@@23 T@U) ) (! (let ((B@@35 (FieldTypeInv1 (type f_5@@23))))
(let ((A@@36 (FieldTypeInv0 (type f_5@@23))))
 (=> (and (and (= (type o_3@@73) RefType) (= (type f_5@@23) (FieldType A@@36 B@@35))) (not (= f_5@@23 car))) (= (U_2_real (MapType1Select QPMask@1 o_3@@73 f_5@@23)) (U_2_real (MapType1Select QPMask@2 o_3@@73 f_5@@23))))))
 :qid |stdinbpl.1432:33|
 :skolemid |177|
 :pattern ( (MapType1Select QPMask@2 o_3@@73 f_5@@23))
)))) (and (=> (= (ControlFlow 0 262) (- 0 264)) (forall ((n$10 T@U) (n$10_1 T@U) ) (!  (=> (and (= (type n$10) RefType) (= (type n$10_1) RefType)) (=> (and (and (and (and (not (= n$10 n$10_1)) (U_2_bool (MapType2Select g n$10))) (U_2_bool (MapType2Select g n$10_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$10 n$10_1))))
 :qid |stdinbpl.1444:21|
 :skolemid |178|
 :pattern ( (neverTriggered14 n$10) (neverTriggered14 n$10_1))
))) (=> (forall ((n$10@@0 T@U) (n$10_1@@0 T@U) ) (!  (=> (and (= (type n$10@@0) RefType) (= (type n$10_1@@0) RefType)) (=> (and (and (and (and (not (= n$10@@0 n$10_1@@0)) (U_2_bool (MapType2Select g n$10@@0))) (U_2_bool (MapType2Select g n$10_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$10@@0 n$10_1@@0))))
 :qid |stdinbpl.1444:21|
 :skolemid |178|
 :pattern ( (neverTriggered14 n$10@@0) (neverTriggered14 n$10_1@@0))
)) (and (=> (= (ControlFlow 0 262) (- 0 263)) (forall ((n$10@@1 T@U) ) (!  (=> (and (= (type n$10@@1) RefType) (U_2_bool (MapType2Select g n$10@@1))) (>= (U_2_real (MapType1Select QPMask@2 n$10@@1 cdr)) FullPerm))
 :qid |stdinbpl.1451:21|
 :skolemid |179|
 :pattern ( (MapType0Select Heap@@17 n$10@@1 cdr))
 :pattern ( (MapType1Select QPMask@3 n$10@@1 cdr))
 :pattern ( (MapType0Select Heap@@17 n$10@@1 cdr))
))) (=> (forall ((n$10@@2 T@U) ) (!  (=> (and (= (type n$10@@2) RefType) (U_2_bool (MapType2Select g n$10@@2))) (>= (U_2_real (MapType1Select QPMask@2 n$10@@2 cdr)) FullPerm))
 :qid |stdinbpl.1451:21|
 :skolemid |179|
 :pattern ( (MapType0Select Heap@@17 n$10@@2 cdr))
 :pattern ( (MapType1Select QPMask@3 n$10@@2 cdr))
 :pattern ( (MapType0Select Heap@@17 n$10@@2 cdr))
)) (=> (and (and (forall ((n$10@@3 T@U) ) (!  (=> (= (type n$10@@3) RefType) (=> (and (U_2_bool (MapType2Select g n$10@@3)) (< NoPerm FullPerm)) (and (qpRange14 n$10@@3) (= (invRecv14 n$10@@3) n$10@@3))))
 :qid |stdinbpl.1457:26|
 :skolemid |180|
 :pattern ( (MapType0Select Heap@@17 n$10@@3 cdr))
 :pattern ( (MapType1Select QPMask@3 n$10@@3 cdr))
 :pattern ( (MapType0Select Heap@@17 n$10@@3 cdr))
)) (forall ((o_3@@74 T@U) ) (!  (=> (= (type o_3@@74) RefType) (=> (and (U_2_bool (MapType2Select g (invRecv14 o_3@@74))) (and (< NoPerm FullPerm) (qpRange14 o_3@@74))) (= (invRecv14 o_3@@74) o_3@@74)))
 :qid |stdinbpl.1461:26|
 :skolemid |181|
 :pattern ( (invRecv14 o_3@@74))
))) (and (forall ((o_3@@75 T@U) ) (!  (=> (= (type o_3@@75) RefType) (and (=> (and (U_2_bool (MapType2Select g (invRecv14 o_3@@75))) (and (< NoPerm FullPerm) (qpRange14 o_3@@75))) (and (= (invRecv14 o_3@@75) o_3@@75) (= (U_2_real (MapType1Select QPMask@3 o_3@@75 cdr)) (- (U_2_real (MapType1Select QPMask@2 o_3@@75 cdr)) FullPerm)))) (=> (not (and (U_2_bool (MapType2Select g (invRecv14 o_3@@75))) (and (< NoPerm FullPerm) (qpRange14 o_3@@75)))) (= (U_2_real (MapType1Select QPMask@3 o_3@@75 cdr)) (U_2_real (MapType1Select QPMask@2 o_3@@75 cdr))))))
 :qid |stdinbpl.1467:26|
 :skolemid |182|
 :pattern ( (MapType1Select QPMask@3 o_3@@75 cdr))
)) (forall ((o_3@@76 T@U) (f_5@@24 T@U) ) (! (let ((B@@36 (FieldTypeInv1 (type f_5@@24))))
(let ((A@@37 (FieldTypeInv0 (type f_5@@24))))
 (=> (and (and (= (type o_3@@76) RefType) (= (type f_5@@24) (FieldType A@@37 B@@36))) (not (= f_5@@24 cdr))) (= (U_2_real (MapType1Select QPMask@2 o_3@@76 f_5@@24)) (U_2_real (MapType1Select QPMask@3 o_3@@76 f_5@@24))))))
 :qid |stdinbpl.1473:33|
 :skolemid |183|
 :pattern ( (MapType1Select QPMask@3 o_3@@76 f_5@@24))
)))) (and (and (=> (= (ControlFlow 0 262) 261) anon194_Else_correct) (=> (= (ControlFlow 0 262) 14) anon195_Then_correct)) (=> (= (ControlFlow 0 262) 16) anon195_Else_correct))))))))))))))))))
(let ((anon193_Then_correct  (=> (= (ControlFlow 0 12) (- 0 11)) (> (|Set#Card| roots) 0))))
(let ((anon179_Else_correct  (=> (U_2_bool (MapType0Select Heap@@17 x_1@@0 $allocated)) (and (=> (= (ControlFlow 0 268) 12) anon193_Then_correct) (=> (= (ControlFlow 0 268) 262) anon193_Else_correct)))))
(let ((anon177_Else_correct  (=> (and (and (forall ((n$0_1 T@U) ) (!  (=> (and (= (type n$0_1) RefType) (U_2_bool (MapType2Select g n$0_1))) (U_2_bool (MapType2Select g (MapType0Select Heap@@17 n$0_1 cdr))))
 :qid |stdinbpl.1015:20|
 :skolemid |131|
 :pattern ( (MapType2Select g (MapType0Select Heap@@17 n$0_1 cdr)))
 :pattern ( (MapType2Select g n$0_1) (MapType0Select Heap@@17 n$0_1 cdr))
)) (state Heap@@17 QPMask@1)) (and (|Set#Subset| roots g) (state Heap@@17 QPMask@1))) (and (=> (= (ControlFlow 0 306) 305) anon179_Then_correct) (=> (= (ControlFlow 0 306) 268) anon179_Else_correct)))))
(let ((anon11_correct true))
(let ((anon178_Else_correct  (=> (and (not (U_2_bool (MapType2Select g n$0))) (= (ControlFlow 0 10) 7)) anon11_correct)))
(let ((anon178_Then_correct  (=> (U_2_bool (MapType2Select g n$0)) (and (=> (= (ControlFlow 0 8) (- 0 9)) (HasDirectPerm QPMask@1 n$0 cdr)) (=> (HasDirectPerm QPMask@1 n$0 cdr) (=> (= (ControlFlow 0 8) 7) anon11_correct))))))
(let ((anon175_Else_correct  (=> (forall ((n_1 T@U) ) (!  (=> (and (= (type n_1) RefType) (U_2_bool (MapType2Select g n_1))) (U_2_bool (MapType2Select g (MapType0Select Heap@@17 n_1 car))))
 :qid |stdinbpl.1002:20|
 :skolemid |130|
 :pattern ( (MapType2Select g (MapType0Select Heap@@17 n_1 car)))
 :pattern ( (MapType2Select g n_1) (MapType0Select Heap@@17 n_1 car))
)) (and (and (=> (= (ControlFlow 0 307) 306) anon177_Else_correct) (=> (= (ControlFlow 0 307) 8) anon178_Then_correct)) (=> (= (ControlFlow 0 307) 10) anon178_Else_correct)))))
(let ((anon7_correct true))
(let ((anon176_Else_correct  (=> (and (not (U_2_bool (MapType2Select g n))) (= (ControlFlow 0 6) 3)) anon7_correct)))
(let ((anon176_Then_correct  (=> (U_2_bool (MapType2Select g n)) (and (=> (= (ControlFlow 0 4) (- 0 5)) (HasDirectPerm QPMask@1 n car)) (=> (HasDirectPerm QPMask@1 n car) (=> (= (ControlFlow 0 4) 3) anon7_correct))))))
(let ((anon174_Else_correct  (and (=> (= (ControlFlow 0 308) (- 0 309)) (forall ((n$2_1 T@U) (n$2_1_1 T@U) ) (!  (=> (and (= (type n$2_1) RefType) (= (type n$2_1_1) RefType)) (=> (and (and (and (and (not (= n$2_1 n$2_1_1)) (U_2_bool (MapType2Select g n$2_1))) (U_2_bool (MapType2Select g n$2_1_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$2_1 n$2_1_1))))
 :qid |stdinbpl.961:15|
 :skolemid |124|
 :no-pattern (type n$2_1)
 :no-pattern (type n$2_1_1)
 :no-pattern (U_2_int n$2_1)
 :no-pattern (U_2_bool n$2_1)
 :no-pattern (U_2_int n$2_1_1)
 :no-pattern (U_2_bool n$2_1_1)
))) (=> (forall ((n$2_1@@0 T@U) (n$2_1_1@@0 T@U) ) (!  (=> (and (= (type n$2_1@@0) RefType) (= (type n$2_1_1@@0) RefType)) (=> (and (and (and (and (not (= n$2_1@@0 n$2_1_1@@0)) (U_2_bool (MapType2Select g n$2_1@@0))) (U_2_bool (MapType2Select g n$2_1_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$2_1@@0 n$2_1_1@@0))))
 :qid |stdinbpl.961:15|
 :skolemid |124|
 :no-pattern (type n$2_1@@0)
 :no-pattern (type n$2_1_1@@0)
 :no-pattern (U_2_int n$2_1@@0)
 :no-pattern (U_2_bool n$2_1@@0)
 :no-pattern (U_2_int n$2_1_1@@0)
 :no-pattern (U_2_bool n$2_1_1@@0)
)) (=> (and (forall ((n$2_1@@1 T@U) ) (!  (=> (= (type n$2_1@@1) RefType) (=> (and (U_2_bool (MapType2Select g n$2_1@@1)) (< NoPerm FullPerm)) (and (qpRange4 n$2_1@@1) (= (invRecv4 n$2_1@@1) n$2_1@@1))))
 :qid |stdinbpl.967:22|
 :skolemid |125|
 :pattern ( (MapType0Select Heap@@17 n$2_1@@1 cdr))
 :pattern ( (MapType1Select QPMask@1 n$2_1@@1 cdr))
 :pattern ( (MapType0Select Heap@@17 n$2_1@@1 cdr))
)) (forall ((o_3@@77 T@U) ) (!  (=> (= (type o_3@@77) RefType) (=> (and (and (U_2_bool (MapType2Select g (invRecv4 o_3@@77))) (< NoPerm FullPerm)) (qpRange4 o_3@@77)) (= (invRecv4 o_3@@77) o_3@@77)))
 :qid |stdinbpl.971:22|
 :skolemid |126|
 :pattern ( (invRecv4 o_3@@77))
))) (=> (and (and (forall ((n$2_1@@2 T@U) ) (!  (=> (and (= (type n$2_1@@2) RefType) (U_2_bool (MapType2Select g n$2_1@@2))) (not (= n$2_1@@2 null)))
 :qid |stdinbpl.977:22|
 :skolemid |127|
 :pattern ( (MapType0Select Heap@@17 n$2_1@@2 cdr))
 :pattern ( (MapType1Select QPMask@1 n$2_1@@2 cdr))
 :pattern ( (MapType0Select Heap@@17 n$2_1@@2 cdr))
)) (forall ((o_3@@78 T@U) ) (!  (=> (= (type o_3@@78) RefType) (and (=> (and (and (U_2_bool (MapType2Select g (invRecv4 o_3@@78))) (< NoPerm FullPerm)) (qpRange4 o_3@@78)) (and (=> (< NoPerm FullPerm) (= (invRecv4 o_3@@78) o_3@@78)) (= (U_2_real (MapType1Select QPMask@1 o_3@@78 cdr)) (+ (U_2_real (MapType1Select QPMask@0 o_3@@78 cdr)) FullPerm)))) (=> (not (and (and (U_2_bool (MapType2Select g (invRecv4 o_3@@78))) (< NoPerm FullPerm)) (qpRange4 o_3@@78))) (= (U_2_real (MapType1Select QPMask@1 o_3@@78 cdr)) (U_2_real (MapType1Select QPMask@0 o_3@@78 cdr))))))
 :qid |stdinbpl.983:22|
 :skolemid |128|
 :pattern ( (MapType1Select QPMask@1 o_3@@78 cdr))
))) (and (forall ((o_3@@79 T@U) (f_5@@25 T@U) ) (! (let ((B@@37 (FieldTypeInv1 (type f_5@@25))))
(let ((A@@38 (FieldTypeInv0 (type f_5@@25))))
 (=> (and (and (= (type o_3@@79) RefType) (= (type f_5@@25) (FieldType A@@38 B@@37))) (not (= f_5@@25 cdr))) (= (U_2_real (MapType1Select QPMask@0 o_3@@79 f_5@@25)) (U_2_real (MapType1Select QPMask@1 o_3@@79 f_5@@25))))))
 :qid |stdinbpl.987:29|
 :skolemid |129|
 :pattern ( (MapType1Select QPMask@0 o_3@@79 f_5@@25))
 :pattern ( (MapType1Select QPMask@1 o_3@@79 f_5@@25))
)) (state Heap@@17 QPMask@1))) (and (and (=> (= (ControlFlow 0 308) 307) anon175_Else_correct) (=> (= (ControlFlow 0 308) 4) anon176_Then_correct)) (=> (= (ControlFlow 0 308) 6) anon176_Else_correct))))))))
(let ((anon174_Then_correct true))
(let ((anon173_Else_correct  (and (=> (= (ControlFlow 0 310) (- 0 311)) (forall ((n$1_1 T@U) (n$1_1_1 T@U) ) (!  (=> (and (= (type n$1_1) RefType) (= (type n$1_1_1) RefType)) (=> (and (and (and (and (not (= n$1_1 n$1_1_1)) (U_2_bool (MapType2Select g n$1_1))) (U_2_bool (MapType2Select g n$1_1_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$1_1 n$1_1_1))))
 :qid |stdinbpl.922:15|
 :skolemid |118|
 :no-pattern (type n$1_1)
 :no-pattern (type n$1_1_1)
 :no-pattern (U_2_int n$1_1)
 :no-pattern (U_2_bool n$1_1)
 :no-pattern (U_2_int n$1_1_1)
 :no-pattern (U_2_bool n$1_1_1)
))) (=> (forall ((n$1_1@@0 T@U) (n$1_1_1@@0 T@U) ) (!  (=> (and (= (type n$1_1@@0) RefType) (= (type n$1_1_1@@0) RefType)) (=> (and (and (and (and (not (= n$1_1@@0 n$1_1_1@@0)) (U_2_bool (MapType2Select g n$1_1@@0))) (U_2_bool (MapType2Select g n$1_1_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$1_1@@0 n$1_1_1@@0))))
 :qid |stdinbpl.922:15|
 :skolemid |118|
 :no-pattern (type n$1_1@@0)
 :no-pattern (type n$1_1_1@@0)
 :no-pattern (U_2_int n$1_1@@0)
 :no-pattern (U_2_bool n$1_1@@0)
 :no-pattern (U_2_int n$1_1_1@@0)
 :no-pattern (U_2_bool n$1_1_1@@0)
)) (=> (and (forall ((n$1_1@@1 T@U) ) (!  (=> (= (type n$1_1@@1) RefType) (=> (and (U_2_bool (MapType2Select g n$1_1@@1)) (< NoPerm FullPerm)) (and (qpRange3 n$1_1@@1) (= (invRecv3 n$1_1@@1) n$1_1@@1))))
 :qid |stdinbpl.928:22|
 :skolemid |119|
 :pattern ( (MapType0Select Heap@@17 n$1_1@@1 car))
 :pattern ( (MapType1Select QPMask@0 n$1_1@@1 car))
 :pattern ( (MapType0Select Heap@@17 n$1_1@@1 car))
)) (forall ((o_3@@80 T@U) ) (!  (=> (= (type o_3@@80) RefType) (=> (and (and (U_2_bool (MapType2Select g (invRecv3 o_3@@80))) (< NoPerm FullPerm)) (qpRange3 o_3@@80)) (= (invRecv3 o_3@@80) o_3@@80)))
 :qid |stdinbpl.932:22|
 :skolemid |120|
 :pattern ( (invRecv3 o_3@@80))
))) (=> (and (and (forall ((n$1_1@@2 T@U) ) (!  (=> (and (= (type n$1_1@@2) RefType) (U_2_bool (MapType2Select g n$1_1@@2))) (not (= n$1_1@@2 null)))
 :qid |stdinbpl.938:22|
 :skolemid |121|
 :pattern ( (MapType0Select Heap@@17 n$1_1@@2 car))
 :pattern ( (MapType1Select QPMask@0 n$1_1@@2 car))
 :pattern ( (MapType0Select Heap@@17 n$1_1@@2 car))
)) (forall ((o_3@@81 T@U) ) (!  (=> (= (type o_3@@81) RefType) (and (=> (and (and (U_2_bool (MapType2Select g (invRecv3 o_3@@81))) (< NoPerm FullPerm)) (qpRange3 o_3@@81)) (and (=> (< NoPerm FullPerm) (= (invRecv3 o_3@@81) o_3@@81)) (= (U_2_real (MapType1Select QPMask@0 o_3@@81 car)) (+ (U_2_real (MapType1Select ZeroMask o_3@@81 car)) FullPerm)))) (=> (not (and (and (U_2_bool (MapType2Select g (invRecv3 o_3@@81))) (< NoPerm FullPerm)) (qpRange3 o_3@@81))) (= (U_2_real (MapType1Select QPMask@0 o_3@@81 car)) (U_2_real (MapType1Select ZeroMask o_3@@81 car))))))
 :qid |stdinbpl.944:22|
 :skolemid |122|
 :pattern ( (MapType1Select QPMask@0 o_3@@81 car))
))) (and (forall ((o_3@@82 T@U) (f_5@@26 T@U) ) (! (let ((B@@38 (FieldTypeInv1 (type f_5@@26))))
(let ((A@@39 (FieldTypeInv0 (type f_5@@26))))
 (=> (and (and (= (type o_3@@82) RefType) (= (type f_5@@26) (FieldType A@@39 B@@38))) (not (= f_5@@26 car))) (= (U_2_real (MapType1Select ZeroMask o_3@@82 f_5@@26)) (U_2_real (MapType1Select QPMask@0 o_3@@82 f_5@@26))))))
 :qid |stdinbpl.948:29|
 :skolemid |123|
 :pattern ( (MapType1Select ZeroMask o_3@@82 f_5@@26))
 :pattern ( (MapType1Select QPMask@0 o_3@@82 f_5@@26))
)) (state Heap@@17 QPMask@0))) (and (=> (= (ControlFlow 0 310) 2) anon174_Then_correct) (=> (= (ControlFlow 0 310) 308) anon174_Else_correct))))))))
(let ((anon173_Then_correct true))
(let ((anon0_correct  (=> (state Heap@@17 ZeroMask) (=> (and (and (= AssumeFunctionsAbove (- 0 1)) (> (|Set#Card| roots) 0)) (and (state Heap@@17 ZeroMask) (not (U_2_bool (MapType2Select g null))))) (and (=> (= (ControlFlow 0 312) 1) anon173_Then_correct) (=> (= (ControlFlow 0 312) 310) anon173_Else_correct))))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 313) 312) anon0_correct)))
PreconditionGeneratedEntry_correct)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
))
(check-sat)
(pop 1)
; Valid
(get-info :rlimit)
