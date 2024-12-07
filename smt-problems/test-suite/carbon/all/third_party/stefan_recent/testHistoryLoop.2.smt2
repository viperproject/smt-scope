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
(declare-fun History__x_hist_value () T@U)
(declare-fun History__x_hist_mode () T@U)
(declare-fun History__x_hist_init () T@U)
(declare-fun History__x_hist_act () T@U)
(declare-fun FieldType (T@T T@T) T@T)
(declare-fun FieldTypeInv0 (T@T) T@T)
(declare-fun FieldTypeInv1 (T@T) T@T)
(declare-fun NormalFieldType () T@T)
(declare-fun p_single (Int) T@U)
(declare-fun p_seq (T@U T@U) T@U)
(declare-fun p_incr () T@U)
(declare-fun p_empty () T@U)
(declare-fun ProcessDomainTypeType () T@T)
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
(declare-fun History__hist_do_incr (T@U Real T@U) T@U)
(declare-fun IsPredicateField (T@U) Bool)
(declare-fun PredicateType_History__hist_do_incrType () T@T)
(declare-fun FrameTypeType () T@T)
(declare-fun History__hist_idle (T@U Real T@U) T@U)
(declare-fun PredicateType_History__hist_idleType () T@T)
(declare-fun |History__hist_do_incr#trigger| (T@U T@U) Bool)
(declare-fun |History__hist_do_incr#everUsed| (T@U) Bool)
(declare-fun |History__hist_idle#trigger| (T@U T@U) Bool)
(declare-fun |History__hist_idle#everUsed| (T@U) Bool)
(declare-fun getPredWandId (T@U) Int)
(declare-fun IdenticalOnKnownLocations (T@U T@U T@U) Bool)
(declare-fun null () T@U)
(declare-fun PredicateMaskField (T@U) T@U)
(declare-fun HasDirectPerm (T@U T@U T@U) Bool)
(declare-fun IsWandField (T@U) Bool)
(declare-fun WandMaskField (T@U) T@U)
(declare-fun |History__free_get_x'| (T@U T@U) Int)
(declare-fun dummyFunction (T@U) Bool)
(declare-fun |History__free_get_x#triggerStateless| (T@U) Int)
(declare-fun |History__hist_get_x'| (T@U T@U) Int)
(declare-fun |History__hist_get_x#triggerStateless| (T@U) Int)
(declare-fun |History__hist_do_incr#sm| (T@U Real T@U) T@U)
(declare-fun |History__hist_idle#sm| (T@U Real T@U) T@U)
(declare-fun History__free_get_x (T@U T@U) Int)
(declare-fun History__hist_get_x (T@U T@U) Int)
(declare-fun p_dual (Int Int) T@U)
(declare-fun p_merge (T@U T@U) T@U)
(declare-fun dummyHeap () T@U)
(declare-fun ZeroMask () T@U)
(declare-fun InsidePredicate (T@U T@U T@U T@U) Bool)
(declare-fun AssumeFunctionsAbove () Int)
(declare-fun sumMask (T@U T@U T@U) Bool)
(declare-fun ConditionalFrame (Real T@U) T@U)
(declare-fun EmptyFrame () T@U)
(declare-fun NoPerm () Real)
(declare-fun FullPerm () Real)
(declare-fun |History__free_get_x#frame| (T@U T@U) Int)
(declare-fun FrameFragment (T@U) T@U)
(declare-fun |History__hist_get_x#frame| (T@U T@U) Int)
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
(assert  (and (and (and (and (and (and (and (and (forall ((arg0@@11 T@T) (arg1 T@T) ) (! (= (Ctor (FieldType arg0@@11 arg1)) 6)
 :qid |ctor:FieldType|
)) (forall ((arg0@@12 T@T) (arg1@@0 T@T) ) (! (= (FieldTypeInv0 (FieldType arg0@@12 arg1@@0)) arg0@@12)
 :qid |typeInv:FieldTypeInv0|
 :pattern ( (FieldType arg0@@12 arg1@@0))
))) (forall ((arg0@@13 T@T) (arg1@@1 T@T) ) (! (= (FieldTypeInv1 (FieldType arg0@@13 arg1@@1)) arg1@@1)
 :qid |typeInv:FieldTypeInv1|
 :pattern ( (FieldType arg0@@13 arg1@@1))
))) (= (Ctor NormalFieldType) 7)) (= (type $allocated) (FieldType NormalFieldType boolType))) (= (type History__x_hist_value) (FieldType NormalFieldType intType))) (= (type History__x_hist_mode) (FieldType NormalFieldType intType))) (= (type History__x_hist_init) (FieldType NormalFieldType intType))) (= (type History__x_hist_act) (FieldType NormalFieldType intType))))
(assert (distinct $allocated History__x_hist_value History__x_hist_mode History__x_hist_init History__x_hist_act)
)
(assert  (and (and (and (and (= (Ctor ProcessDomainTypeType) 8) (forall ((arg0@@14 Int) ) (! (= (type (p_single arg0@@14)) ProcessDomainTypeType)
 :qid |funType:p_single|
 :pattern ( (p_single arg0@@14))
))) (forall ((arg0@@15 T@U) (arg1@@2 T@U) ) (! (= (type (p_seq arg0@@15 arg1@@2)) ProcessDomainTypeType)
 :qid |funType:p_seq|
 :pattern ( (p_seq arg0@@15 arg1@@2))
))) (= (type p_incr) ProcessDomainTypeType)) (= (type p_empty) ProcessDomainTypeType)))
(assert (forall ((n_1 Int) ) (! (= (ite (> n_1 0) (p_seq p_incr (p_single (- n_1 1))) p_empty) (p_single n_1))
 :qid |stdinbpl.235:15|
 :skolemid |28|
 :pattern ( (p_single n_1))
)))
(assert  (and (and (and (and (and (and (forall ((arg0@@16 T@T) ) (! (= (Ctor (MapType0Type arg0@@16)) 9)
 :qid |ctor:MapType0Type|
)) (forall ((arg0@@17 T@T) ) (! (= (MapType0TypeInv0 (MapType0Type arg0@@17)) arg0@@17)
 :qid |typeInv:MapType0TypeInv0|
 :pattern ( (MapType0Type arg0@@17))
))) (forall ((arg0@@18 T@U) (arg1@@3 T@U) (arg2 T@U) ) (! (let ((B (FieldTypeInv1 (type arg2))))
(= (type (MapType0Select arg0@@18 arg1@@3 arg2)) B))
 :qid |funType:MapType0Select|
 :pattern ( (MapType0Select arg0@@18 arg1@@3 arg2))
))) (forall ((arg0@@19 T@U) (arg1@@4 T@U) (arg2@@0 T@U) (arg3 T@U) ) (! (let ((aVar0 (type arg1@@4)))
(= (type (MapType0Store arg0@@19 arg1@@4 arg2@@0 arg3)) (MapType0Type aVar0)))
 :qid |funType:MapType0Store|
 :pattern ( (MapType0Store arg0@@19 arg1@@4 arg2@@0 arg3))
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
)))) (= (Ctor RefType) 10)))
(assert (forall ((Heap0 T@U) (Heap1 T@U) ) (!  (=> (and (and (= (type Heap0) (MapType0Type RefType)) (= (type Heap1) (MapType0Type RefType))) (succHeap Heap0 Heap1)) (succHeapTrans Heap0 Heap1))
 :qid |stdinbpl.88:15|
 :skolemid |11|
 :pattern ( (succHeap Heap0 Heap1))
)))
(assert  (and (and (and (and (and (and (forall ((arg0@@20 T@T) (arg1@@5 T@T) ) (! (= (Ctor (MapType1Type arg0@@20 arg1@@5)) 11)
 :qid |ctor:MapType1Type|
)) (forall ((arg0@@21 T@T) (arg1@@6 T@T) ) (! (= (MapType1TypeInv0 (MapType1Type arg0@@21 arg1@@6)) arg0@@21)
 :qid |typeInv:MapType1TypeInv0|
 :pattern ( (MapType1Type arg0@@21 arg1@@6))
))) (forall ((arg0@@22 T@T) (arg1@@7 T@T) ) (! (= (MapType1TypeInv1 (MapType1Type arg0@@22 arg1@@7)) arg1@@7)
 :qid |typeInv:MapType1TypeInv1|
 :pattern ( (MapType1Type arg0@@22 arg1@@7))
))) (forall ((arg0@@23 T@U) (arg1@@8 T@U) (arg2@@1 T@U) ) (! (let ((aVar1 (MapType1TypeInv1 (type arg0@@23))))
(= (type (MapType1Select arg0@@23 arg1@@8 arg2@@1)) aVar1))
 :qid |funType:MapType1Select|
 :pattern ( (MapType1Select arg0@@23 arg1@@8 arg2@@1))
))) (forall ((arg0@@24 T@U) (arg1@@9 T@U) (arg2@@2 T@U) (arg3@@0 T@U) ) (! (let ((aVar1@@0 (type arg3@@0)))
(let ((aVar0@@0 (type arg1@@9)))
(= (type (MapType1Store arg0@@24 arg1@@9 arg2@@2 arg3@@0)) (MapType1Type aVar0@@0 aVar1@@0))))
 :qid |funType:MapType1Store|
 :pattern ( (MapType1Store arg0@@24 arg1@@9 arg2@@2 arg3@@0))
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
(assert  (and (and (= (Ctor PredicateType_History__hist_do_incrType) 12) (= (Ctor FrameTypeType) 13)) (forall ((arg0@@25 T@U) (arg1@@10 Real) (arg2@@3 T@U) ) (! (= (type (History__hist_do_incr arg0@@25 arg1@@10 arg2@@3)) (FieldType PredicateType_History__hist_do_incrType FrameTypeType))
 :qid |funType:History__hist_do_incr|
 :pattern ( (History__hist_do_incr arg0@@25 arg1@@10 arg2@@3))
))))
(assert (forall ((diz T@U) (frac Real) (proc T@U) ) (!  (=> (and (= (type diz) RefType) (= (type proc) ProcessDomainTypeType)) (IsPredicateField (History__hist_do_incr diz frac proc)))
 :qid |stdinbpl.422:15|
 :skolemid |41|
 :pattern ( (History__hist_do_incr diz frac proc))
)))
(assert  (and (= (Ctor PredicateType_History__hist_idleType) 14) (forall ((arg0@@26 T@U) (arg1@@11 Real) (arg2@@4 T@U) ) (! (= (type (History__hist_idle arg0@@26 arg1@@11 arg2@@4)) (FieldType PredicateType_History__hist_idleType FrameTypeType))
 :qid |funType:History__hist_idle|
 :pattern ( (History__hist_idle arg0@@26 arg1@@11 arg2@@4))
))))
(assert (forall ((diz@@0 T@U) (frac@@0 Real) (proc@@0 T@U) ) (!  (=> (and (= (type diz@@0) RefType) (= (type proc@@0) ProcessDomainTypeType)) (IsPredicateField (History__hist_idle diz@@0 frac@@0 proc@@0)))
 :qid |stdinbpl.457:15|
 :skolemid |47|
 :pattern ( (History__hist_idle diz@@0 frac@@0 proc@@0))
)))
(assert (forall ((Heap@@0 T@U) (diz@@1 T@U) (frac@@1 Real) (proc@@1 T@U) ) (!  (=> (and (and (= (type Heap@@0) (MapType0Type RefType)) (= (type diz@@1) RefType)) (= (type proc@@1) ProcessDomainTypeType)) (|History__hist_do_incr#everUsed| (History__hist_do_incr diz@@1 frac@@1 proc@@1)))
 :qid |stdinbpl.441:15|
 :skolemid |45|
 :pattern ( (|History__hist_do_incr#trigger| Heap@@0 (History__hist_do_incr diz@@1 frac@@1 proc@@1)))
)))
(assert (forall ((Heap@@1 T@U) (diz@@2 T@U) (frac@@2 Real) (proc@@2 T@U) ) (!  (=> (and (and (= (type Heap@@1) (MapType0Type RefType)) (= (type diz@@2) RefType)) (= (type proc@@2) ProcessDomainTypeType)) (|History__hist_idle#everUsed| (History__hist_idle diz@@2 frac@@2 proc@@2)))
 :qid |stdinbpl.476:15|
 :skolemid |51|
 :pattern ( (|History__hist_idle#trigger| Heap@@1 (History__hist_idle diz@@2 frac@@2 proc@@2)))
)))
(assert (forall ((diz@@3 T@U) (frac@@3 Real) (proc@@3 T@U) ) (!  (=> (and (= (type diz@@3) RefType) (= (type proc@@3) ProcessDomainTypeType)) (= (getPredWandId (History__hist_do_incr diz@@3 frac@@3 proc@@3)) 0))
 :qid |stdinbpl.426:15|
 :skolemid |42|
 :pattern ( (History__hist_do_incr diz@@3 frac@@3 proc@@3))
)))
(assert (forall ((diz@@4 T@U) (frac@@4 Real) (proc@@4 T@U) ) (!  (=> (and (= (type diz@@4) RefType) (= (type proc@@4) ProcessDomainTypeType)) (= (getPredWandId (History__hist_idle diz@@4 frac@@4 proc@@4)) 1))
 :qid |stdinbpl.461:15|
 :skolemid |48|
 :pattern ( (History__hist_idle diz@@4 frac@@4 proc@@4))
)))
(assert  (and (= (type null) RefType) (forall ((arg0@@27 T@U) ) (! (let ((A (FieldTypeInv0 (type arg0@@27))))
(= (type (PredicateMaskField arg0@@27)) (FieldType A (MapType1Type RefType boolType))))
 :qid |funType:PredicateMaskField|
 :pattern ( (PredicateMaskField arg0@@27))
))))
(assert (forall ((Heap@@2 T@U) (ExhaleHeap T@U) (Mask@@0 T@U) (pm_f T@U) ) (! (let ((C (FieldTypeInv0 (type pm_f))))
 (=> (and (and (and (and (and (= (type Heap@@2) (MapType0Type RefType)) (= (type ExhaleHeap) (MapType0Type RefType))) (= (type Mask@@0) (MapType1Type RefType realType))) (= (type pm_f) (FieldType C FrameTypeType))) (IdenticalOnKnownLocations Heap@@2 ExhaleHeap Mask@@0)) (and (HasDirectPerm Mask@@0 null pm_f) (IsPredicateField pm_f))) (= (MapType0Select Heap@@2 null (PredicateMaskField pm_f)) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))))
 :qid |stdinbpl.47:19|
 :skolemid |2|
 :pattern ( (IdenticalOnKnownLocations Heap@@2 ExhaleHeap Mask@@0) (IsPredicateField pm_f) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))
)))
(assert (forall ((arg0@@28 T@U) ) (! (let ((A@@0 (FieldTypeInv0 (type arg0@@28))))
(= (type (WandMaskField arg0@@28)) (FieldType A@@0 (MapType1Type RefType boolType))))
 :qid |funType:WandMaskField|
 :pattern ( (WandMaskField arg0@@28))
)))
(assert (forall ((Heap@@3 T@U) (ExhaleHeap@@0 T@U) (Mask@@1 T@U) (pm_f@@0 T@U) ) (! (let ((C@@0 (FieldTypeInv0 (type pm_f@@0))))
 (=> (and (and (and (and (and (= (type Heap@@3) (MapType0Type RefType)) (= (type ExhaleHeap@@0) (MapType0Type RefType))) (= (type Mask@@1) (MapType1Type RefType realType))) (= (type pm_f@@0) (FieldType C@@0 FrameTypeType))) (IdenticalOnKnownLocations Heap@@3 ExhaleHeap@@0 Mask@@1)) (and (HasDirectPerm Mask@@1 null pm_f@@0) (IsWandField pm_f@@0))) (= (MapType0Select Heap@@3 null (WandMaskField pm_f@@0)) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))))
 :qid |stdinbpl.60:19|
 :skolemid |5|
 :pattern ( (IdenticalOnKnownLocations Heap@@3 ExhaleHeap@@0 Mask@@1) (IsWandField pm_f@@0) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))
)))
(assert (forall ((Heap@@4 T@U) (diz@@5 T@U) ) (!  (=> (and (= (type Heap@@4) (MapType0Type RefType)) (= (type diz@@5) RefType)) (dummyFunction (int_2_U (|History__free_get_x#triggerStateless| diz@@5))))
 :qid |stdinbpl.286:15|
 :skolemid |33|
 :pattern ( (|History__free_get_x'| Heap@@4 diz@@5))
)))
(assert (forall ((Heap@@5 T@U) (diz@@6 T@U) ) (!  (=> (and (= (type Heap@@5) (MapType0Type RefType)) (= (type diz@@6) RefType)) (dummyFunction (int_2_U (|History__hist_get_x#triggerStateless| diz@@6))))
 :qid |stdinbpl.354:15|
 :skolemid |37|
 :pattern ( (|History__hist_get_x'| Heap@@5 diz@@6))
)))
(assert (forall ((arg0@@29 T@U) (arg1@@12 Real) (arg2@@5 T@U) ) (! (= (type (|History__hist_do_incr#sm| arg0@@29 arg1@@12 arg2@@5)) (FieldType PredicateType_History__hist_do_incrType (MapType1Type RefType boolType)))
 :qid |funType:History__hist_do_incr#sm|
 :pattern ( (|History__hist_do_incr#sm| arg0@@29 arg1@@12 arg2@@5))
)))
(assert (forall ((diz@@7 T@U) (frac@@5 Real) (proc@@5 T@U) ) (!  (=> (and (= (type diz@@7) RefType) (= (type proc@@5) ProcessDomainTypeType)) (= (PredicateMaskField (History__hist_do_incr diz@@7 frac@@5 proc@@5)) (|History__hist_do_incr#sm| diz@@7 frac@@5 proc@@5)))
 :qid |stdinbpl.418:15|
 :skolemid |40|
 :pattern ( (PredicateMaskField (History__hist_do_incr diz@@7 frac@@5 proc@@5)))
)))
(assert (forall ((arg0@@30 T@U) (arg1@@13 Real) (arg2@@6 T@U) ) (! (= (type (|History__hist_idle#sm| arg0@@30 arg1@@13 arg2@@6)) (FieldType PredicateType_History__hist_idleType (MapType1Type RefType boolType)))
 :qid |funType:History__hist_idle#sm|
 :pattern ( (|History__hist_idle#sm| arg0@@30 arg1@@13 arg2@@6))
)))
(assert (forall ((diz@@8 T@U) (frac@@6 Real) (proc@@6 T@U) ) (!  (=> (and (= (type diz@@8) RefType) (= (type proc@@6) ProcessDomainTypeType)) (= (PredicateMaskField (History__hist_idle diz@@8 frac@@6 proc@@6)) (|History__hist_idle#sm| diz@@8 frac@@6 proc@@6)))
 :qid |stdinbpl.453:15|
 :skolemid |46|
 :pattern ( (PredicateMaskField (History__hist_idle diz@@8 frac@@6 proc@@6)))
)))
(assert (forall ((Heap@@6 T@U) (ExhaleHeap@@1 T@U) (Mask@@2 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@6) (MapType0Type RefType)) (= (type ExhaleHeap@@1) (MapType0Type RefType))) (= (type Mask@@2) (MapType1Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@6 ExhaleHeap@@1 Mask@@2)) (U_2_bool (MapType0Select Heap@@6 o_1 $allocated))) (U_2_bool (MapType0Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.73:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@6 ExhaleHeap@@1 Mask@@2) (MapType0Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert (forall ((Heap@@7 T@U) (diz@@9 T@U) ) (!  (=> (and (= (type Heap@@7) (MapType0Type RefType)) (= (type diz@@9) RefType)) (and (= (History__free_get_x Heap@@7 diz@@9) (|History__free_get_x'| Heap@@7 diz@@9)) (dummyFunction (int_2_U (|History__free_get_x#triggerStateless| diz@@9)))))
 :qid |stdinbpl.282:15|
 :skolemid |32|
 :pattern ( (History__free_get_x Heap@@7 diz@@9))
)))
(assert (forall ((Heap@@8 T@U) (diz@@10 T@U) ) (!  (=> (and (= (type Heap@@8) (MapType0Type RefType)) (= (type diz@@10) RefType)) (and (= (History__hist_get_x Heap@@8 diz@@10) (|History__hist_get_x'| Heap@@8 diz@@10)) (dummyFunction (int_2_U (|History__hist_get_x#triggerStateless| diz@@10)))))
 :qid |stdinbpl.350:15|
 :skolemid |36|
 :pattern ( (History__hist_get_x Heap@@8 diz@@10))
)))
(assert (forall ((diz@@11 T@U) (frac@@7 Real) (proc@@7 T@U) (diz2 T@U) (frac2 Real) (proc2 T@U) ) (!  (=> (and (and (and (and (= (type diz@@11) RefType) (= (type proc@@7) ProcessDomainTypeType)) (= (type diz2) RefType)) (= (type proc2) ProcessDomainTypeType)) (= (History__hist_do_incr diz@@11 frac@@7 proc@@7) (History__hist_do_incr diz2 frac2 proc2))) (and (= diz@@11 diz2) (and (= frac@@7 frac2) (= proc@@7 proc2))))
 :qid |stdinbpl.432:15|
 :skolemid |43|
 :pattern ( (History__hist_do_incr diz@@11 frac@@7 proc@@7) (History__hist_do_incr diz2 frac2 proc2))
)))
(assert (forall ((diz@@12 T@U) (frac@@8 Real) (proc@@8 T@U) (diz2@@0 T@U) (frac2@@0 Real) (proc2@@0 T@U) ) (!  (=> (and (and (and (and (= (type diz@@12) RefType) (= (type proc@@8) ProcessDomainTypeType)) (= (type diz2@@0) RefType)) (= (type proc2@@0) ProcessDomainTypeType)) (= (|History__hist_do_incr#sm| diz@@12 frac@@8 proc@@8) (|History__hist_do_incr#sm| diz2@@0 frac2@@0 proc2@@0))) (and (= diz@@12 diz2@@0) (and (= frac@@8 frac2@@0) (= proc@@8 proc2@@0))))
 :qid |stdinbpl.436:15|
 :skolemid |44|
 :pattern ( (|History__hist_do_incr#sm| diz@@12 frac@@8 proc@@8) (|History__hist_do_incr#sm| diz2@@0 frac2@@0 proc2@@0))
)))
(assert (forall ((diz@@13 T@U) (frac@@9 Real) (proc@@9 T@U) (diz2@@1 T@U) (frac2@@1 Real) (proc2@@1 T@U) ) (!  (=> (and (and (and (and (= (type diz@@13) RefType) (= (type proc@@9) ProcessDomainTypeType)) (= (type diz2@@1) RefType)) (= (type proc2@@1) ProcessDomainTypeType)) (= (History__hist_idle diz@@13 frac@@9 proc@@9) (History__hist_idle diz2@@1 frac2@@1 proc2@@1))) (and (= diz@@13 diz2@@1) (and (= frac@@9 frac2@@1) (= proc@@9 proc2@@1))))
 :qid |stdinbpl.467:15|
 :skolemid |49|
 :pattern ( (History__hist_idle diz@@13 frac@@9 proc@@9) (History__hist_idle diz2@@1 frac2@@1 proc2@@1))
)))
(assert (forall ((diz@@14 T@U) (frac@@10 Real) (proc@@10 T@U) (diz2@@2 T@U) (frac2@@2 Real) (proc2@@2 T@U) ) (!  (=> (and (and (and (and (= (type diz@@14) RefType) (= (type proc@@10) ProcessDomainTypeType)) (= (type diz2@@2) RefType)) (= (type proc2@@2) ProcessDomainTypeType)) (= (|History__hist_idle#sm| diz@@14 frac@@10 proc@@10) (|History__hist_idle#sm| diz2@@2 frac2@@2 proc2@@2))) (and (= diz@@14 diz2@@2) (and (= frac@@10 frac2@@2) (= proc@@10 proc2@@2))))
 :qid |stdinbpl.471:15|
 :skolemid |50|
 :pattern ( (|History__hist_idle#sm| diz@@14 frac@@10 proc@@10) (|History__hist_idle#sm| diz2@@2 frac2@@2 proc2@@2))
)))
(assert  (and (forall ((arg0@@31 Int) (arg1@@14 Int) ) (! (= (type (p_dual arg0@@31 arg1@@14)) ProcessDomainTypeType)
 :qid |funType:p_dual|
 :pattern ( (p_dual arg0@@31 arg1@@14))
)) (forall ((arg0@@32 T@U) (arg1@@15 T@U) ) (! (= (type (p_merge arg0@@32 arg1@@15)) ProcessDomainTypeType)
 :qid |funType:p_merge|
 :pattern ( (p_merge arg0@@32 arg1@@15))
))))
(assert (forall ((n_1@@0 Int) (m_1 Int) ) (! (= (p_merge (p_single n_1@@0) (p_single m_1)) (p_dual n_1@@0 m_1))
 :qid |stdinbpl.241:15|
 :skolemid |29|
 :pattern ( (p_dual n_1@@0 m_1))
)))
(assert (forall ((Heap@@9 T@U) (ExhaleHeap@@2 T@U) (Mask@@3 T@U) (o_1@@0 T@U) (f_2 T@U) ) (! (let ((B@@1 (FieldTypeInv1 (type f_2))))
(let ((A@@1 (FieldTypeInv0 (type f_2))))
 (=> (and (and (and (and (and (and (= (type Heap@@9) (MapType0Type RefType)) (= (type ExhaleHeap@@2) (MapType0Type RefType))) (= (type Mask@@3) (MapType1Type RefType realType))) (= (type o_1@@0) RefType)) (= (type f_2) (FieldType A@@1 B@@1))) (IdenticalOnKnownLocations Heap@@9 ExhaleHeap@@2 Mask@@3)) (HasDirectPerm Mask@@3 o_1@@0 f_2)) (= (MapType0Select Heap@@9 o_1@@0 f_2) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2)))))
 :qid |stdinbpl.42:22|
 :skolemid |1|
 :pattern ( (IdenticalOnKnownLocations Heap@@9 ExhaleHeap@@2 Mask@@3) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2))
)))
(assert  (and (= (type dummyHeap) (MapType0Type RefType)) (= (type ZeroMask) (MapType1Type RefType realType))))
(assert (state dummyHeap ZeroMask))
(assert (forall ((p1_1 T@U) ) (!  (=> (= (type p1_1) ProcessDomainTypeType) (forall ((p2_1 T@U) ) (!  (=> (= (type p2_1) ProcessDomainTypeType) (forall ((p3 T@U) ) (!  (=> (= (type p3) ProcessDomainTypeType) (= (p_seq (p_seq p1_1 p2_1) p3) (p_seq p1_1 (p_seq p2_1 p3))))
 :qid |stdinbpl.227:13|
 :skolemid |25|
 :pattern ( (p_seq (p_seq p1_1 p2_1) p3))
 :pattern ( (p_seq p1_1 (p_seq p2_1 p3)))
)))
 :qid |stdinbpl.225:11|
 :skolemid |26|
 :pattern ( (p_seq p1_1 p2_1))
)))
 :qid |stdinbpl.223:15|
 :skolemid |27|
 :no-pattern (type p1_1)
 :no-pattern (U_2_int p1_1)
 :no-pattern (U_2_bool p1_1)
)))
(assert (forall ((p T@U) (v_1 T@U) (w T@U) ) (! (let ((A@@2 (FieldTypeInv0 (type p))))
 (=> (and (and (= (type p) (FieldType A@@2 FrameTypeType)) (= (type v_1) FrameTypeType)) (= (type w) FrameTypeType)) (not (InsidePredicate p v_1 p w))))
 :qid |stdinbpl.174:19|
 :skolemid |21|
 :pattern ( (InsidePredicate p v_1 p w))
)))
(assert  (not (IsPredicateField History__x_hist_value)))
(assert  (not (IsWandField History__x_hist_value)))
(assert  (not (IsPredicateField History__x_hist_mode)))
(assert  (not (IsWandField History__x_hist_mode)))
(assert  (not (IsPredicateField History__x_hist_init)))
(assert  (not (IsWandField History__x_hist_init)))
(assert  (not (IsPredicateField History__x_hist_act)))
(assert  (not (IsWandField History__x_hist_act)))
(assert (forall ((Heap@@10 T@U) (ExhaleHeap@@3 T@U) (Mask@@4 T@U) ) (!  (=> (and (and (and (= (type Heap@@10) (MapType0Type RefType)) (= (type ExhaleHeap@@3) (MapType0Type RefType))) (= (type Mask@@4) (MapType1Type RefType realType))) (IdenticalOnKnownLocations Heap@@10 ExhaleHeap@@3 Mask@@4)) (succHeap Heap@@10 ExhaleHeap@@3))
 :qid |stdinbpl.83:15|
 :skolemid |10|
 :pattern ( (IdenticalOnKnownLocations Heap@@10 ExhaleHeap@@3 Mask@@4))
)))
(assert (forall ((Heap@@11 T@U) (Mask@@5 T@U) (diz@@15 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@11) (MapType0Type RefType)) (= (type Mask@@5) (MapType1Type RefType realType))) (= (type diz@@15) RefType)) (and (state Heap@@11 Mask@@5) (< AssumeFunctionsAbove 0))) (not (= diz@@15 null))) (= (History__free_get_x Heap@@11 diz@@15) (U_2_int (MapType0Select Heap@@11 diz@@15 History__x_hist_value))))
 :qid |stdinbpl.292:15|
 :skolemid |34|
 :pattern ( (state Heap@@11 Mask@@5) (History__free_get_x Heap@@11 diz@@15))
)))
(assert (forall ((Heap@@12 T@U) (Mask@@6 T@U) (diz@@16 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@12) (MapType0Type RefType)) (= (type Mask@@6) (MapType1Type RefType realType))) (= (type diz@@16) RefType)) (and (state Heap@@12 Mask@@6) (< AssumeFunctionsAbove 1))) (not (= diz@@16 null))) (= (History__hist_get_x Heap@@12 diz@@16) (U_2_int (MapType0Select Heap@@12 diz@@16 History__x_hist_value))))
 :qid |stdinbpl.360:15|
 :skolemid |38|
 :pattern ( (state Heap@@12 Mask@@6) (History__hist_get_x Heap@@12 diz@@16))
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
(assert  (and (forall ((arg0@@33 Real) (arg1@@16 T@U) ) (! (= (type (ConditionalFrame arg0@@33 arg1@@16)) FrameTypeType)
 :qid |funType:ConditionalFrame|
 :pattern ( (ConditionalFrame arg0@@33 arg1@@16))
)) (= (type EmptyFrame) FrameTypeType)))
(assert (forall ((p@@0 Real) (f_6 T@U) ) (!  (=> (= (type f_6) FrameTypeType) (= (ConditionalFrame p@@0 f_6) (ite (> p@@0 0.0) f_6 EmptyFrame)))
 :qid |stdinbpl.162:15|
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
(assert (forall ((p_1 T@U) ) (!  (=> (= (type p_1) ProcessDomainTypeType) (= (p_merge p_empty p_1) p_1))
 :qid |stdinbpl.205:15|
 :skolemid |22|
 :pattern ( (p_merge p_empty p_1))
)))
(assert (forall ((p_1@@0 T@U) ) (!  (=> (= (type p_1@@0) ProcessDomainTypeType) (= (p_seq p_empty p_1@@0) p_1@@0))
 :qid |stdinbpl.211:15|
 :skolemid |23|
 :pattern ( (p_seq p_empty p_1@@0))
)))
(assert (forall ((Heap@@13 T@U) (ExhaleHeap@@4 T@U) (Mask@@8 T@U) (pm_f@@1 T@U) ) (! (let ((C@@1 (FieldTypeInv0 (type pm_f@@1))))
 (=> (and (and (and (and (and (= (type Heap@@13) (MapType0Type RefType)) (= (type ExhaleHeap@@4) (MapType0Type RefType))) (= (type Mask@@8) (MapType1Type RefType realType))) (= (type pm_f@@1) (FieldType C@@1 FrameTypeType))) (IdenticalOnKnownLocations Heap@@13 ExhaleHeap@@4 Mask@@8)) (and (HasDirectPerm Mask@@8 null pm_f@@1) (IsPredicateField pm_f@@1))) (forall ((o2 T@U) (f_2@@0 T@U) ) (! (let ((B@@5 (FieldTypeInv1 (type f_2@@0))))
(let ((A@@6 (FieldTypeInv0 (type f_2@@0))))
 (=> (and (and (= (type o2) RefType) (= (type f_2@@0) (FieldType A@@6 B@@5))) (U_2_bool (MapType1Select (MapType0Select Heap@@13 null (PredicateMaskField pm_f@@1)) o2 f_2@@0))) (= (MapType0Select Heap@@13 o2 f_2@@0) (MapType0Select ExhaleHeap@@4 o2 f_2@@0)))))
 :qid |stdinbpl.54:134|
 :skolemid |3|
 :pattern ( (MapType0Select ExhaleHeap@@4 o2 f_2@@0))
))))
 :qid |stdinbpl.52:19|
 :skolemid |4|
 :pattern ( (IdenticalOnKnownLocations Heap@@13 ExhaleHeap@@4 Mask@@8) (IsPredicateField pm_f@@1))
)))
(assert (forall ((Heap@@14 T@U) (ExhaleHeap@@5 T@U) (Mask@@9 T@U) (pm_f@@2 T@U) ) (! (let ((C@@2 (FieldTypeInv0 (type pm_f@@2))))
 (=> (and (and (and (and (and (= (type Heap@@14) (MapType0Type RefType)) (= (type ExhaleHeap@@5) (MapType0Type RefType))) (= (type Mask@@9) (MapType1Type RefType realType))) (= (type pm_f@@2) (FieldType C@@2 FrameTypeType))) (IdenticalOnKnownLocations Heap@@14 ExhaleHeap@@5 Mask@@9)) (and (HasDirectPerm Mask@@9 null pm_f@@2) (IsWandField pm_f@@2))) (forall ((o2@@0 T@U) (f_2@@1 T@U) ) (! (let ((B@@6 (FieldTypeInv1 (type f_2@@1))))
(let ((A@@7 (FieldTypeInv0 (type f_2@@1))))
 (=> (and (and (= (type o2@@0) RefType) (= (type f_2@@1) (FieldType A@@7 B@@6))) (U_2_bool (MapType1Select (MapType0Select Heap@@14 null (WandMaskField pm_f@@2)) o2@@0 f_2@@1))) (= (MapType0Select Heap@@14 o2@@0 f_2@@1) (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1)))))
 :qid |stdinbpl.67:129|
 :skolemid |6|
 :pattern ( (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1))
))))
 :qid |stdinbpl.65:19|
 :skolemid |7|
 :pattern ( (IdenticalOnKnownLocations Heap@@14 ExhaleHeap@@5 Mask@@9) (IsWandField pm_f@@2))
)))
(assert (forall ((Mask@@10 T@U) (o_2@@2 T@U) (f_4@@2 T@U) ) (! (let ((B@@7 (FieldTypeInv1 (type f_4@@2))))
(let ((A@@8 (FieldTypeInv0 (type f_4@@2))))
 (=> (and (and (and (= (type Mask@@10) (MapType1Type RefType realType)) (= (type o_2@@2) RefType)) (= (type f_4@@2) (FieldType A@@8 B@@7))) (GoodMask Mask@@10)) (and (>= (U_2_real (MapType1Select Mask@@10 o_2@@2 f_4@@2)) NoPerm) (=> (and (and (GoodMask Mask@@10) (not (IsPredicateField f_4@@2))) (not (IsWandField f_4@@2))) (<= (U_2_real (MapType1Select Mask@@10 o_2@@2 f_4@@2)) FullPerm))))))
 :qid |stdinbpl.128:22|
 :skolemid |16|
 :pattern ( (GoodMask Mask@@10) (MapType1Select Mask@@10 o_2@@2 f_4@@2))
)))
(assert (forall ((arg0@@34 T@U) ) (! (= (type (FrameFragment arg0@@34)) FrameTypeType)
 :qid |funType:FrameFragment|
 :pattern ( (FrameFragment arg0@@34))
)))
(assert (forall ((Heap@@15 T@U) (Mask@@11 T@U) (diz@@17 T@U) ) (!  (=> (and (and (and (= (type Heap@@15) (MapType0Type RefType)) (= (type Mask@@11) (MapType1Type RefType realType))) (= (type diz@@17) RefType)) (state Heap@@15 Mask@@11)) (= (|History__free_get_x'| Heap@@15 diz@@17) (|History__free_get_x#frame| (FrameFragment (MapType0Select Heap@@15 diz@@17 History__x_hist_value)) diz@@17)))
 :qid |stdinbpl.299:15|
 :skolemid |35|
 :pattern ( (state Heap@@15 Mask@@11) (|History__free_get_x'| Heap@@15 diz@@17))
)))
(assert (forall ((Heap@@16 T@U) (Mask@@12 T@U) (diz@@18 T@U) ) (!  (=> (and (and (and (= (type Heap@@16) (MapType0Type RefType)) (= (type Mask@@12) (MapType1Type RefType realType))) (= (type diz@@18) RefType)) (state Heap@@16 Mask@@12)) (= (|History__hist_get_x'| Heap@@16 diz@@18) (|History__hist_get_x#frame| (FrameFragment (MapType0Select Heap@@16 diz@@18 History__x_hist_value)) diz@@18)))
 :qid |stdinbpl.367:15|
 :skolemid |39|
 :pattern ( (state Heap@@16 Mask@@12) (|History__hist_get_x'| Heap@@16 diz@@18))
)))
(assert (forall ((o T@U) (f T@U) (Heap@@17 T@U) ) (!  (=> (and (and (and (= (type o) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap@@17) (MapType0Type RefType))) (U_2_bool (MapType0Select Heap@@17 o $allocated))) (U_2_bool (MapType0Select Heap@@17 (MapType0Select Heap@@17 o f) $allocated)))
 :qid |stdinbpl.31:15|
 :skolemid |0|
 :pattern ( (MapType0Select Heap@@17 o f))
)))
(assert (forall ((n_1@@1 Int) ) (! (= (p_single n_1@@1) (ite (> n_1@@1 0) (p_seq (p_single (- n_1@@1 1)) p_incr) p_empty))
 :qid |stdinbpl.247:15|
 :skolemid |30|
 :pattern ( (p_single n_1@@1))
)))
(assert (forall ((Heap@@18 T@U) (o@@0 T@U) (f_3 T@U) (v T@U) ) (! (let ((B@@8 (type v)))
(let ((A@@9 (FieldTypeInv0 (type f_3))))
 (=> (and (and (= (type Heap@@18) (MapType0Type RefType)) (= (type o@@0) RefType)) (= (type f_3) (FieldType A@@9 B@@8))) (succHeap Heap@@18 (MapType0Store Heap@@18 o@@0 f_3 v)))))
 :qid |stdinbpl.78:22|
 :skolemid |9|
 :pattern ( (MapType0Store Heap@@18 o@@0 f_3 v))
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
 :qid |stdinbpl.169:25|
 :skolemid |20|
 :pattern ( (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))
)))
(assert (forall ((m_1@@0 Int) (n_1@@2 Int) ) (! (= (p_seq (p_single m_1@@0) (p_single n_1@@2)) (p_single (+ m_1@@0 n_1@@2)))
 :qid |stdinbpl.253:15|
 :skolemid |31|
 :pattern ( (p_seq (p_single m_1@@0) (p_single n_1@@2)))
)))
(assert (forall ((p_1@@1 T@U) ) (!  (=> (= (type p_1@@1) ProcessDomainTypeType) (= (p_seq p_1@@1 p_empty) p_1@@1))
 :qid |stdinbpl.217:15|
 :skolemid |24|
 :pattern ( (p_seq p_1@@1 p_empty))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun PostHeap@0 () T@U)
(declare-fun diz@@19 () T@U)
(declare-fun PostMask@0 () T@U)
(declare-fun PostMask@1 () T@U)
(declare-fun PostMask@2 () T@U)
(declare-fun Mask@3 () T@U)
(declare-fun Heap@@19 () T@U)
(declare-fun current_thread_id () Int)
(declare-fun Mask@0 () T@U)
(declare-fun Mask@1 () T@U)
(declare-fun Mask@2 () T@U)
(assert  (and (and (and (and (and (and (and (and (and (= (type PostHeap@0) (MapType0Type RefType)) (= (type diz@@19) RefType)) (= (type PostMask@0) (MapType1Type RefType realType))) (= (type PostMask@1) (MapType1Type RefType realType))) (= (type PostMask@2) (MapType1Type RefType realType))) (= (type Mask@3) (MapType1Type RefType realType))) (= (type Heap@@19) (MapType0Type RefType))) (= (type Mask@0) (MapType1Type RefType realType))) (= (type Mask@1) (MapType1Type RefType realType))) (= (type Mask@2) (MapType1Type RefType realType))))
(set-info :boogie-vc-id History__begin_hist)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 10) (let ((anon11_Else_correct true))
(let ((anon11_Then_correct  (=> (and (and (and (state PostHeap@0 ZeroMask) (not (= diz@@19 null))) (and (= PostMask@0 (MapType1Store ZeroMask diz@@19 History__x_hist_value (real_2_U (+ (U_2_real (MapType1Select ZeroMask diz@@19 History__x_hist_value)) FullPerm)))) (state PostHeap@0 PostMask@0))) (and (and (state PostHeap@0 PostMask@0) (not (= diz@@19 null))) (and (= PostMask@1 (MapType1Store PostMask@0 diz@@19 History__x_hist_mode (real_2_U (+ (U_2_real (MapType1Select PostMask@0 diz@@19 History__x_hist_mode)) FullPerm)))) (state PostHeap@0 PostMask@1)))) (and (=> (= (ControlFlow 0 2) (- 0 6)) (HasDirectPerm PostMask@1 diz@@19 History__x_hist_mode)) (=> (HasDirectPerm PostMask@1 diz@@19 History__x_hist_mode) (=> (and (= (U_2_int (MapType0Select PostHeap@0 diz@@19 History__x_hist_mode)) 1) (state PostHeap@0 PostMask@1)) (=> (and (and (not (= diz@@19 null)) (= PostMask@2 (MapType1Store PostMask@1 diz@@19 History__x_hist_init (real_2_U (+ (U_2_real (MapType1Select PostMask@1 diz@@19 History__x_hist_init)) FullPerm))))) (and (state PostHeap@0 PostMask@2) (state PostHeap@0 PostMask@2))) (and (=> (= (ControlFlow 0 2) (- 0 5)) (HasDirectPerm PostMask@2 diz@@19 History__x_hist_value)) (=> (HasDirectPerm PostMask@2 diz@@19 History__x_hist_value) (and (=> (= (ControlFlow 0 2) (- 0 4)) (HasDirectPerm Mask@3 diz@@19 History__x_hist_value)) (=> (HasDirectPerm Mask@3 diz@@19 History__x_hist_value) (=> (and (= (U_2_int (MapType0Select PostHeap@0 diz@@19 History__x_hist_value)) (U_2_int (MapType0Select Heap@@19 diz@@19 History__x_hist_value))) (state PostHeap@0 PostMask@2)) (and (=> (= (ControlFlow 0 2) (- 0 3)) (HasDirectPerm PostMask@2 diz@@19 History__x_hist_init)) (=> (HasDirectPerm PostMask@2 diz@@19 History__x_hist_init) (=> (= (ControlFlow 0 2) (- 0 1)) (HasDirectPerm Mask@3 diz@@19 History__x_hist_value))))))))))))))))
(let ((anon0_correct  (=> (and (state Heap@@19 ZeroMask) (= AssumeFunctionsAbove (- 0 1))) (=> (and (and (U_2_bool (MapType0Select Heap@@19 diz@@19 $allocated)) (not (= diz@@19 null))) (and (state Heap@@19 ZeroMask) (>= current_thread_id 0))) (=> (and (and (and (state Heap@@19 ZeroMask) (not (= diz@@19 null))) (and (= Mask@0 (MapType1Store ZeroMask diz@@19 History__x_hist_value (real_2_U (+ (U_2_real (MapType1Select ZeroMask diz@@19 History__x_hist_value)) FullPerm)))) (state Heap@@19 Mask@0))) (and (and (state Heap@@19 Mask@0) (not (= diz@@19 null))) (and (= Mask@1 (MapType1Store Mask@0 diz@@19 History__x_hist_mode (real_2_U (+ (U_2_real (MapType1Select Mask@0 diz@@19 History__x_hist_mode)) FullPerm)))) (state Heap@@19 Mask@1)))) (and (=> (= (ControlFlow 0 8) (- 0 9)) (HasDirectPerm Mask@1 diz@@19 History__x_hist_mode)) (=> (HasDirectPerm Mask@1 diz@@19 History__x_hist_mode) (=> (and (= (U_2_int (MapType0Select Heap@@19 diz@@19 History__x_hist_mode)) 0) (state Heap@@19 Mask@1)) (=> (and (and (and (not (= diz@@19 null)) (= Mask@2 (MapType1Store Mask@1 diz@@19 History__x_hist_init (real_2_U (+ (U_2_real (MapType1Select Mask@1 diz@@19 History__x_hist_init)) FullPerm))))) (and (state Heap@@19 Mask@2) (state Heap@@19 Mask@2))) (and (and (not (= diz@@19 null)) (= Mask@3 (MapType1Store Mask@2 diz@@19 History__x_hist_act (real_2_U (+ (U_2_real (MapType1Select Mask@2 diz@@19 History__x_hist_act)) FullPerm))))) (and (state Heap@@19 Mask@3) (state Heap@@19 Mask@3)))) (and (=> (= (ControlFlow 0 8) 2) anon11_Then_correct) (=> (= (ControlFlow 0 8) 7) anon11_Else_correct)))))))))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 10) 8) anon0_correct)))
PreconditionGeneratedEntry_correct)))))
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
(declare-fun History__x_hist_value () T@U)
(declare-fun History__x_hist_mode () T@U)
(declare-fun History__x_hist_init () T@U)
(declare-fun History__x_hist_act () T@U)
(declare-fun FieldType (T@T T@T) T@T)
(declare-fun FieldTypeInv0 (T@T) T@T)
(declare-fun FieldTypeInv1 (T@T) T@T)
(declare-fun NormalFieldType () T@T)
(declare-fun p_single (Int) T@U)
(declare-fun p_seq (T@U T@U) T@U)
(declare-fun p_incr () T@U)
(declare-fun p_empty () T@U)
(declare-fun ProcessDomainTypeType () T@T)
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
(declare-fun History__hist_do_incr (T@U Real T@U) T@U)
(declare-fun IsPredicateField (T@U) Bool)
(declare-fun PredicateType_History__hist_do_incrType () T@T)
(declare-fun FrameTypeType () T@T)
(declare-fun History__hist_idle (T@U Real T@U) T@U)
(declare-fun PredicateType_History__hist_idleType () T@T)
(declare-fun |History__hist_do_incr#trigger| (T@U T@U) Bool)
(declare-fun |History__hist_do_incr#everUsed| (T@U) Bool)
(declare-fun |History__hist_idle#trigger| (T@U T@U) Bool)
(declare-fun |History__hist_idle#everUsed| (T@U) Bool)
(declare-fun getPredWandId (T@U) Int)
(declare-fun IdenticalOnKnownLocations (T@U T@U T@U) Bool)
(declare-fun null () T@U)
(declare-fun PredicateMaskField (T@U) T@U)
(declare-fun HasDirectPerm (T@U T@U T@U) Bool)
(declare-fun IsWandField (T@U) Bool)
(declare-fun WandMaskField (T@U) T@U)
(declare-fun |History__free_get_x'| (T@U T@U) Int)
(declare-fun dummyFunction (T@U) Bool)
(declare-fun |History__free_get_x#triggerStateless| (T@U) Int)
(declare-fun |History__hist_get_x'| (T@U T@U) Int)
(declare-fun |History__hist_get_x#triggerStateless| (T@U) Int)
(declare-fun |History__hist_do_incr#sm| (T@U Real T@U) T@U)
(declare-fun |History__hist_idle#sm| (T@U Real T@U) T@U)
(declare-fun History__free_get_x (T@U T@U) Int)
(declare-fun History__hist_get_x (T@U T@U) Int)
(declare-fun p_dual (Int Int) T@U)
(declare-fun p_merge (T@U T@U) T@U)
(declare-fun dummyHeap () T@U)
(declare-fun ZeroMask () T@U)
(declare-fun InsidePredicate (T@U T@U T@U T@U) Bool)
(declare-fun AssumeFunctionsAbove () Int)
(declare-fun sumMask (T@U T@U T@U) Bool)
(declare-fun ConditionalFrame (Real T@U) T@U)
(declare-fun EmptyFrame () T@U)
(declare-fun NoPerm () Real)
(declare-fun FullPerm () Real)
(declare-fun |History__free_get_x#frame| (T@U T@U) Int)
(declare-fun FrameFragment (T@U) T@U)
(declare-fun |History__hist_get_x#frame| (T@U T@U) Int)
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
(assert  (and (and (and (and (and (and (and (and (forall ((arg0@@11 T@T) (arg1 T@T) ) (! (= (Ctor (FieldType arg0@@11 arg1)) 6)
 :qid |ctor:FieldType|
)) (forall ((arg0@@12 T@T) (arg1@@0 T@T) ) (! (= (FieldTypeInv0 (FieldType arg0@@12 arg1@@0)) arg0@@12)
 :qid |typeInv:FieldTypeInv0|
 :pattern ( (FieldType arg0@@12 arg1@@0))
))) (forall ((arg0@@13 T@T) (arg1@@1 T@T) ) (! (= (FieldTypeInv1 (FieldType arg0@@13 arg1@@1)) arg1@@1)
 :qid |typeInv:FieldTypeInv1|
 :pattern ( (FieldType arg0@@13 arg1@@1))
))) (= (Ctor NormalFieldType) 7)) (= (type $allocated) (FieldType NormalFieldType boolType))) (= (type History__x_hist_value) (FieldType NormalFieldType intType))) (= (type History__x_hist_mode) (FieldType NormalFieldType intType))) (= (type History__x_hist_init) (FieldType NormalFieldType intType))) (= (type History__x_hist_act) (FieldType NormalFieldType intType))))
(assert (distinct $allocated History__x_hist_value History__x_hist_mode History__x_hist_init History__x_hist_act)
)
(assert  (and (and (and (and (= (Ctor ProcessDomainTypeType) 8) (forall ((arg0@@14 Int) ) (! (= (type (p_single arg0@@14)) ProcessDomainTypeType)
 :qid |funType:p_single|
 :pattern ( (p_single arg0@@14))
))) (forall ((arg0@@15 T@U) (arg1@@2 T@U) ) (! (= (type (p_seq arg0@@15 arg1@@2)) ProcessDomainTypeType)
 :qid |funType:p_seq|
 :pattern ( (p_seq arg0@@15 arg1@@2))
))) (= (type p_incr) ProcessDomainTypeType)) (= (type p_empty) ProcessDomainTypeType)))
(assert (forall ((n_1 Int) ) (! (= (ite (> n_1 0) (p_seq p_incr (p_single (- n_1 1))) p_empty) (p_single n_1))
 :qid |stdinbpl.235:15|
 :skolemid |28|
 :pattern ( (p_single n_1))
)))
(assert  (and (and (and (and (and (and (forall ((arg0@@16 T@T) ) (! (= (Ctor (MapType0Type arg0@@16)) 9)
 :qid |ctor:MapType0Type|
)) (forall ((arg0@@17 T@T) ) (! (= (MapType0TypeInv0 (MapType0Type arg0@@17)) arg0@@17)
 :qid |typeInv:MapType0TypeInv0|
 :pattern ( (MapType0Type arg0@@17))
))) (forall ((arg0@@18 T@U) (arg1@@3 T@U) (arg2 T@U) ) (! (let ((B (FieldTypeInv1 (type arg2))))
(= (type (MapType0Select arg0@@18 arg1@@3 arg2)) B))
 :qid |funType:MapType0Select|
 :pattern ( (MapType0Select arg0@@18 arg1@@3 arg2))
))) (forall ((arg0@@19 T@U) (arg1@@4 T@U) (arg2@@0 T@U) (arg3 T@U) ) (! (let ((aVar0 (type arg1@@4)))
(= (type (MapType0Store arg0@@19 arg1@@4 arg2@@0 arg3)) (MapType0Type aVar0)))
 :qid |funType:MapType0Store|
 :pattern ( (MapType0Store arg0@@19 arg1@@4 arg2@@0 arg3))
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
)))) (= (Ctor RefType) 10)))
(assert (forall ((Heap0 T@U) (Heap1 T@U) ) (!  (=> (and (and (= (type Heap0) (MapType0Type RefType)) (= (type Heap1) (MapType0Type RefType))) (succHeap Heap0 Heap1)) (succHeapTrans Heap0 Heap1))
 :qid |stdinbpl.88:15|
 :skolemid |11|
 :pattern ( (succHeap Heap0 Heap1))
)))
(assert  (and (and (and (and (and (and (forall ((arg0@@20 T@T) (arg1@@5 T@T) ) (! (= (Ctor (MapType1Type arg0@@20 arg1@@5)) 11)
 :qid |ctor:MapType1Type|
)) (forall ((arg0@@21 T@T) (arg1@@6 T@T) ) (! (= (MapType1TypeInv0 (MapType1Type arg0@@21 arg1@@6)) arg0@@21)
 :qid |typeInv:MapType1TypeInv0|
 :pattern ( (MapType1Type arg0@@21 arg1@@6))
))) (forall ((arg0@@22 T@T) (arg1@@7 T@T) ) (! (= (MapType1TypeInv1 (MapType1Type arg0@@22 arg1@@7)) arg1@@7)
 :qid |typeInv:MapType1TypeInv1|
 :pattern ( (MapType1Type arg0@@22 arg1@@7))
))) (forall ((arg0@@23 T@U) (arg1@@8 T@U) (arg2@@1 T@U) ) (! (let ((aVar1 (MapType1TypeInv1 (type arg0@@23))))
(= (type (MapType1Select arg0@@23 arg1@@8 arg2@@1)) aVar1))
 :qid |funType:MapType1Select|
 :pattern ( (MapType1Select arg0@@23 arg1@@8 arg2@@1))
))) (forall ((arg0@@24 T@U) (arg1@@9 T@U) (arg2@@2 T@U) (arg3@@0 T@U) ) (! (let ((aVar1@@0 (type arg3@@0)))
(let ((aVar0@@0 (type arg1@@9)))
(= (type (MapType1Store arg0@@24 arg1@@9 arg2@@2 arg3@@0)) (MapType1Type aVar0@@0 aVar1@@0))))
 :qid |funType:MapType1Store|
 :pattern ( (MapType1Store arg0@@24 arg1@@9 arg2@@2 arg3@@0))
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
(assert  (and (and (= (Ctor PredicateType_History__hist_do_incrType) 12) (= (Ctor FrameTypeType) 13)) (forall ((arg0@@25 T@U) (arg1@@10 Real) (arg2@@3 T@U) ) (! (= (type (History__hist_do_incr arg0@@25 arg1@@10 arg2@@3)) (FieldType PredicateType_History__hist_do_incrType FrameTypeType))
 :qid |funType:History__hist_do_incr|
 :pattern ( (History__hist_do_incr arg0@@25 arg1@@10 arg2@@3))
))))
(assert (forall ((diz T@U) (frac Real) (proc T@U) ) (!  (=> (and (= (type diz) RefType) (= (type proc) ProcessDomainTypeType)) (IsPredicateField (History__hist_do_incr diz frac proc)))
 :qid |stdinbpl.422:15|
 :skolemid |41|
 :pattern ( (History__hist_do_incr diz frac proc))
)))
(assert  (and (= (Ctor PredicateType_History__hist_idleType) 14) (forall ((arg0@@26 T@U) (arg1@@11 Real) (arg2@@4 T@U) ) (! (= (type (History__hist_idle arg0@@26 arg1@@11 arg2@@4)) (FieldType PredicateType_History__hist_idleType FrameTypeType))
 :qid |funType:History__hist_idle|
 :pattern ( (History__hist_idle arg0@@26 arg1@@11 arg2@@4))
))))
(assert (forall ((diz@@0 T@U) (frac@@0 Real) (proc@@0 T@U) ) (!  (=> (and (= (type diz@@0) RefType) (= (type proc@@0) ProcessDomainTypeType)) (IsPredicateField (History__hist_idle diz@@0 frac@@0 proc@@0)))
 :qid |stdinbpl.457:15|
 :skolemid |47|
 :pattern ( (History__hist_idle diz@@0 frac@@0 proc@@0))
)))
(assert (forall ((Heap@@0 T@U) (diz@@1 T@U) (frac@@1 Real) (proc@@1 T@U) ) (!  (=> (and (and (= (type Heap@@0) (MapType0Type RefType)) (= (type diz@@1) RefType)) (= (type proc@@1) ProcessDomainTypeType)) (|History__hist_do_incr#everUsed| (History__hist_do_incr diz@@1 frac@@1 proc@@1)))
 :qid |stdinbpl.441:15|
 :skolemid |45|
 :pattern ( (|History__hist_do_incr#trigger| Heap@@0 (History__hist_do_incr diz@@1 frac@@1 proc@@1)))
)))
(assert (forall ((Heap@@1 T@U) (diz@@2 T@U) (frac@@2 Real) (proc@@2 T@U) ) (!  (=> (and (and (= (type Heap@@1) (MapType0Type RefType)) (= (type diz@@2) RefType)) (= (type proc@@2) ProcessDomainTypeType)) (|History__hist_idle#everUsed| (History__hist_idle diz@@2 frac@@2 proc@@2)))
 :qid |stdinbpl.476:15|
 :skolemid |51|
 :pattern ( (|History__hist_idle#trigger| Heap@@1 (History__hist_idle diz@@2 frac@@2 proc@@2)))
)))
(assert (forall ((diz@@3 T@U) (frac@@3 Real) (proc@@3 T@U) ) (!  (=> (and (= (type diz@@3) RefType) (= (type proc@@3) ProcessDomainTypeType)) (= (getPredWandId (History__hist_do_incr diz@@3 frac@@3 proc@@3)) 0))
 :qid |stdinbpl.426:15|
 :skolemid |42|
 :pattern ( (History__hist_do_incr diz@@3 frac@@3 proc@@3))
)))
(assert (forall ((diz@@4 T@U) (frac@@4 Real) (proc@@4 T@U) ) (!  (=> (and (= (type diz@@4) RefType) (= (type proc@@4) ProcessDomainTypeType)) (= (getPredWandId (History__hist_idle diz@@4 frac@@4 proc@@4)) 1))
 :qid |stdinbpl.461:15|
 :skolemid |48|
 :pattern ( (History__hist_idle diz@@4 frac@@4 proc@@4))
)))
(assert  (and (= (type null) RefType) (forall ((arg0@@27 T@U) ) (! (let ((A (FieldTypeInv0 (type arg0@@27))))
(= (type (PredicateMaskField arg0@@27)) (FieldType A (MapType1Type RefType boolType))))
 :qid |funType:PredicateMaskField|
 :pattern ( (PredicateMaskField arg0@@27))
))))
(assert (forall ((Heap@@2 T@U) (ExhaleHeap T@U) (Mask@@0 T@U) (pm_f T@U) ) (! (let ((C (FieldTypeInv0 (type pm_f))))
 (=> (and (and (and (and (and (= (type Heap@@2) (MapType0Type RefType)) (= (type ExhaleHeap) (MapType0Type RefType))) (= (type Mask@@0) (MapType1Type RefType realType))) (= (type pm_f) (FieldType C FrameTypeType))) (IdenticalOnKnownLocations Heap@@2 ExhaleHeap Mask@@0)) (and (HasDirectPerm Mask@@0 null pm_f) (IsPredicateField pm_f))) (= (MapType0Select Heap@@2 null (PredicateMaskField pm_f)) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))))
 :qid |stdinbpl.47:19|
 :skolemid |2|
 :pattern ( (IdenticalOnKnownLocations Heap@@2 ExhaleHeap Mask@@0) (IsPredicateField pm_f) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))
)))
(assert (forall ((arg0@@28 T@U) ) (! (let ((A@@0 (FieldTypeInv0 (type arg0@@28))))
(= (type (WandMaskField arg0@@28)) (FieldType A@@0 (MapType1Type RefType boolType))))
 :qid |funType:WandMaskField|
 :pattern ( (WandMaskField arg0@@28))
)))
(assert (forall ((Heap@@3 T@U) (ExhaleHeap@@0 T@U) (Mask@@1 T@U) (pm_f@@0 T@U) ) (! (let ((C@@0 (FieldTypeInv0 (type pm_f@@0))))
 (=> (and (and (and (and (and (= (type Heap@@3) (MapType0Type RefType)) (= (type ExhaleHeap@@0) (MapType0Type RefType))) (= (type Mask@@1) (MapType1Type RefType realType))) (= (type pm_f@@0) (FieldType C@@0 FrameTypeType))) (IdenticalOnKnownLocations Heap@@3 ExhaleHeap@@0 Mask@@1)) (and (HasDirectPerm Mask@@1 null pm_f@@0) (IsWandField pm_f@@0))) (= (MapType0Select Heap@@3 null (WandMaskField pm_f@@0)) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))))
 :qid |stdinbpl.60:19|
 :skolemid |5|
 :pattern ( (IdenticalOnKnownLocations Heap@@3 ExhaleHeap@@0 Mask@@1) (IsWandField pm_f@@0) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))
)))
(assert (forall ((Heap@@4 T@U) (diz@@5 T@U) ) (!  (=> (and (= (type Heap@@4) (MapType0Type RefType)) (= (type diz@@5) RefType)) (dummyFunction (int_2_U (|History__free_get_x#triggerStateless| diz@@5))))
 :qid |stdinbpl.286:15|
 :skolemid |33|
 :pattern ( (|History__free_get_x'| Heap@@4 diz@@5))
)))
(assert (forall ((Heap@@5 T@U) (diz@@6 T@U) ) (!  (=> (and (= (type Heap@@5) (MapType0Type RefType)) (= (type diz@@6) RefType)) (dummyFunction (int_2_U (|History__hist_get_x#triggerStateless| diz@@6))))
 :qid |stdinbpl.354:15|
 :skolemid |37|
 :pattern ( (|History__hist_get_x'| Heap@@5 diz@@6))
)))
(assert (forall ((arg0@@29 T@U) (arg1@@12 Real) (arg2@@5 T@U) ) (! (= (type (|History__hist_do_incr#sm| arg0@@29 arg1@@12 arg2@@5)) (FieldType PredicateType_History__hist_do_incrType (MapType1Type RefType boolType)))
 :qid |funType:History__hist_do_incr#sm|
 :pattern ( (|History__hist_do_incr#sm| arg0@@29 arg1@@12 arg2@@5))
)))
(assert (forall ((diz@@7 T@U) (frac@@5 Real) (proc@@5 T@U) ) (!  (=> (and (= (type diz@@7) RefType) (= (type proc@@5) ProcessDomainTypeType)) (= (PredicateMaskField (History__hist_do_incr diz@@7 frac@@5 proc@@5)) (|History__hist_do_incr#sm| diz@@7 frac@@5 proc@@5)))
 :qid |stdinbpl.418:15|
 :skolemid |40|
 :pattern ( (PredicateMaskField (History__hist_do_incr diz@@7 frac@@5 proc@@5)))
)))
(assert (forall ((arg0@@30 T@U) (arg1@@13 Real) (arg2@@6 T@U) ) (! (= (type (|History__hist_idle#sm| arg0@@30 arg1@@13 arg2@@6)) (FieldType PredicateType_History__hist_idleType (MapType1Type RefType boolType)))
 :qid |funType:History__hist_idle#sm|
 :pattern ( (|History__hist_idle#sm| arg0@@30 arg1@@13 arg2@@6))
)))
(assert (forall ((diz@@8 T@U) (frac@@6 Real) (proc@@6 T@U) ) (!  (=> (and (= (type diz@@8) RefType) (= (type proc@@6) ProcessDomainTypeType)) (= (PredicateMaskField (History__hist_idle diz@@8 frac@@6 proc@@6)) (|History__hist_idle#sm| diz@@8 frac@@6 proc@@6)))
 :qid |stdinbpl.453:15|
 :skolemid |46|
 :pattern ( (PredicateMaskField (History__hist_idle diz@@8 frac@@6 proc@@6)))
)))
(assert (forall ((Heap@@6 T@U) (ExhaleHeap@@1 T@U) (Mask@@2 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@6) (MapType0Type RefType)) (= (type ExhaleHeap@@1) (MapType0Type RefType))) (= (type Mask@@2) (MapType1Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@6 ExhaleHeap@@1 Mask@@2)) (U_2_bool (MapType0Select Heap@@6 o_1 $allocated))) (U_2_bool (MapType0Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.73:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@6 ExhaleHeap@@1 Mask@@2) (MapType0Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert (forall ((Heap@@7 T@U) (diz@@9 T@U) ) (!  (=> (and (= (type Heap@@7) (MapType0Type RefType)) (= (type diz@@9) RefType)) (and (= (History__free_get_x Heap@@7 diz@@9) (|History__free_get_x'| Heap@@7 diz@@9)) (dummyFunction (int_2_U (|History__free_get_x#triggerStateless| diz@@9)))))
 :qid |stdinbpl.282:15|
 :skolemid |32|
 :pattern ( (History__free_get_x Heap@@7 diz@@9))
)))
(assert (forall ((Heap@@8 T@U) (diz@@10 T@U) ) (!  (=> (and (= (type Heap@@8) (MapType0Type RefType)) (= (type diz@@10) RefType)) (and (= (History__hist_get_x Heap@@8 diz@@10) (|History__hist_get_x'| Heap@@8 diz@@10)) (dummyFunction (int_2_U (|History__hist_get_x#triggerStateless| diz@@10)))))
 :qid |stdinbpl.350:15|
 :skolemid |36|
 :pattern ( (History__hist_get_x Heap@@8 diz@@10))
)))
(assert (forall ((diz@@11 T@U) (frac@@7 Real) (proc@@7 T@U) (diz2 T@U) (frac2 Real) (proc2 T@U) ) (!  (=> (and (and (and (and (= (type diz@@11) RefType) (= (type proc@@7) ProcessDomainTypeType)) (= (type diz2) RefType)) (= (type proc2) ProcessDomainTypeType)) (= (History__hist_do_incr diz@@11 frac@@7 proc@@7) (History__hist_do_incr diz2 frac2 proc2))) (and (= diz@@11 diz2) (and (= frac@@7 frac2) (= proc@@7 proc2))))
 :qid |stdinbpl.432:15|
 :skolemid |43|
 :pattern ( (History__hist_do_incr diz@@11 frac@@7 proc@@7) (History__hist_do_incr diz2 frac2 proc2))
)))
(assert (forall ((diz@@12 T@U) (frac@@8 Real) (proc@@8 T@U) (diz2@@0 T@U) (frac2@@0 Real) (proc2@@0 T@U) ) (!  (=> (and (and (and (and (= (type diz@@12) RefType) (= (type proc@@8) ProcessDomainTypeType)) (= (type diz2@@0) RefType)) (= (type proc2@@0) ProcessDomainTypeType)) (= (|History__hist_do_incr#sm| diz@@12 frac@@8 proc@@8) (|History__hist_do_incr#sm| diz2@@0 frac2@@0 proc2@@0))) (and (= diz@@12 diz2@@0) (and (= frac@@8 frac2@@0) (= proc@@8 proc2@@0))))
 :qid |stdinbpl.436:15|
 :skolemid |44|
 :pattern ( (|History__hist_do_incr#sm| diz@@12 frac@@8 proc@@8) (|History__hist_do_incr#sm| diz2@@0 frac2@@0 proc2@@0))
)))
(assert (forall ((diz@@13 T@U) (frac@@9 Real) (proc@@9 T@U) (diz2@@1 T@U) (frac2@@1 Real) (proc2@@1 T@U) ) (!  (=> (and (and (and (and (= (type diz@@13) RefType) (= (type proc@@9) ProcessDomainTypeType)) (= (type diz2@@1) RefType)) (= (type proc2@@1) ProcessDomainTypeType)) (= (History__hist_idle diz@@13 frac@@9 proc@@9) (History__hist_idle diz2@@1 frac2@@1 proc2@@1))) (and (= diz@@13 diz2@@1) (and (= frac@@9 frac2@@1) (= proc@@9 proc2@@1))))
 :qid |stdinbpl.467:15|
 :skolemid |49|
 :pattern ( (History__hist_idle diz@@13 frac@@9 proc@@9) (History__hist_idle diz2@@1 frac2@@1 proc2@@1))
)))
(assert (forall ((diz@@14 T@U) (frac@@10 Real) (proc@@10 T@U) (diz2@@2 T@U) (frac2@@2 Real) (proc2@@2 T@U) ) (!  (=> (and (and (and (and (= (type diz@@14) RefType) (= (type proc@@10) ProcessDomainTypeType)) (= (type diz2@@2) RefType)) (= (type proc2@@2) ProcessDomainTypeType)) (= (|History__hist_idle#sm| diz@@14 frac@@10 proc@@10) (|History__hist_idle#sm| diz2@@2 frac2@@2 proc2@@2))) (and (= diz@@14 diz2@@2) (and (= frac@@10 frac2@@2) (= proc@@10 proc2@@2))))
 :qid |stdinbpl.471:15|
 :skolemid |50|
 :pattern ( (|History__hist_idle#sm| diz@@14 frac@@10 proc@@10) (|History__hist_idle#sm| diz2@@2 frac2@@2 proc2@@2))
)))
(assert  (and (forall ((arg0@@31 Int) (arg1@@14 Int) ) (! (= (type (p_dual arg0@@31 arg1@@14)) ProcessDomainTypeType)
 :qid |funType:p_dual|
 :pattern ( (p_dual arg0@@31 arg1@@14))
)) (forall ((arg0@@32 T@U) (arg1@@15 T@U) ) (! (= (type (p_merge arg0@@32 arg1@@15)) ProcessDomainTypeType)
 :qid |funType:p_merge|
 :pattern ( (p_merge arg0@@32 arg1@@15))
))))
(assert (forall ((n_1@@0 Int) (m_1 Int) ) (! (= (p_merge (p_single n_1@@0) (p_single m_1)) (p_dual n_1@@0 m_1))
 :qid |stdinbpl.241:15|
 :skolemid |29|
 :pattern ( (p_dual n_1@@0 m_1))
)))
(assert (forall ((Heap@@9 T@U) (ExhaleHeap@@2 T@U) (Mask@@3 T@U) (o_1@@0 T@U) (f_2 T@U) ) (! (let ((B@@1 (FieldTypeInv1 (type f_2))))
(let ((A@@1 (FieldTypeInv0 (type f_2))))
 (=> (and (and (and (and (and (and (= (type Heap@@9) (MapType0Type RefType)) (= (type ExhaleHeap@@2) (MapType0Type RefType))) (= (type Mask@@3) (MapType1Type RefType realType))) (= (type o_1@@0) RefType)) (= (type f_2) (FieldType A@@1 B@@1))) (IdenticalOnKnownLocations Heap@@9 ExhaleHeap@@2 Mask@@3)) (HasDirectPerm Mask@@3 o_1@@0 f_2)) (= (MapType0Select Heap@@9 o_1@@0 f_2) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2)))))
 :qid |stdinbpl.42:22|
 :skolemid |1|
 :pattern ( (IdenticalOnKnownLocations Heap@@9 ExhaleHeap@@2 Mask@@3) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2))
)))
(assert  (and (= (type dummyHeap) (MapType0Type RefType)) (= (type ZeroMask) (MapType1Type RefType realType))))
(assert (state dummyHeap ZeroMask))
(assert (forall ((p1_1 T@U) ) (!  (=> (= (type p1_1) ProcessDomainTypeType) (forall ((p2_1 T@U) ) (!  (=> (= (type p2_1) ProcessDomainTypeType) (forall ((p3 T@U) ) (!  (=> (= (type p3) ProcessDomainTypeType) (= (p_seq (p_seq p1_1 p2_1) p3) (p_seq p1_1 (p_seq p2_1 p3))))
 :qid |stdinbpl.227:13|
 :skolemid |25|
 :pattern ( (p_seq (p_seq p1_1 p2_1) p3))
 :pattern ( (p_seq p1_1 (p_seq p2_1 p3)))
)))
 :qid |stdinbpl.225:11|
 :skolemid |26|
 :pattern ( (p_seq p1_1 p2_1))
)))
 :qid |stdinbpl.223:15|
 :skolemid |27|
 :no-pattern (type p1_1)
 :no-pattern (U_2_int p1_1)
 :no-pattern (U_2_bool p1_1)
)))
(assert (forall ((p T@U) (v_1 T@U) (w T@U) ) (! (let ((A@@2 (FieldTypeInv0 (type p))))
 (=> (and (and (= (type p) (FieldType A@@2 FrameTypeType)) (= (type v_1) FrameTypeType)) (= (type w) FrameTypeType)) (not (InsidePredicate p v_1 p w))))
 :qid |stdinbpl.174:19|
 :skolemid |21|
 :pattern ( (InsidePredicate p v_1 p w))
)))
(assert  (not (IsPredicateField History__x_hist_value)))
(assert  (not (IsWandField History__x_hist_value)))
(assert  (not (IsPredicateField History__x_hist_mode)))
(assert  (not (IsWandField History__x_hist_mode)))
(assert  (not (IsPredicateField History__x_hist_init)))
(assert  (not (IsWandField History__x_hist_init)))
(assert  (not (IsPredicateField History__x_hist_act)))
(assert  (not (IsWandField History__x_hist_act)))
(assert (forall ((Heap@@10 T@U) (ExhaleHeap@@3 T@U) (Mask@@4 T@U) ) (!  (=> (and (and (and (= (type Heap@@10) (MapType0Type RefType)) (= (type ExhaleHeap@@3) (MapType0Type RefType))) (= (type Mask@@4) (MapType1Type RefType realType))) (IdenticalOnKnownLocations Heap@@10 ExhaleHeap@@3 Mask@@4)) (succHeap Heap@@10 ExhaleHeap@@3))
 :qid |stdinbpl.83:15|
 :skolemid |10|
 :pattern ( (IdenticalOnKnownLocations Heap@@10 ExhaleHeap@@3 Mask@@4))
)))
(assert (forall ((Heap@@11 T@U) (Mask@@5 T@U) (diz@@15 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@11) (MapType0Type RefType)) (= (type Mask@@5) (MapType1Type RefType realType))) (= (type diz@@15) RefType)) (and (state Heap@@11 Mask@@5) (< AssumeFunctionsAbove 0))) (not (= diz@@15 null))) (= (History__free_get_x Heap@@11 diz@@15) (U_2_int (MapType0Select Heap@@11 diz@@15 History__x_hist_value))))
 :qid |stdinbpl.292:15|
 :skolemid |34|
 :pattern ( (state Heap@@11 Mask@@5) (History__free_get_x Heap@@11 diz@@15))
)))
(assert (forall ((Heap@@12 T@U) (Mask@@6 T@U) (diz@@16 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@12) (MapType0Type RefType)) (= (type Mask@@6) (MapType1Type RefType realType))) (= (type diz@@16) RefType)) (and (state Heap@@12 Mask@@6) (< AssumeFunctionsAbove 1))) (not (= diz@@16 null))) (= (History__hist_get_x Heap@@12 diz@@16) (U_2_int (MapType0Select Heap@@12 diz@@16 History__x_hist_value))))
 :qid |stdinbpl.360:15|
 :skolemid |38|
 :pattern ( (state Heap@@12 Mask@@6) (History__hist_get_x Heap@@12 diz@@16))
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
(assert  (and (forall ((arg0@@33 Real) (arg1@@16 T@U) ) (! (= (type (ConditionalFrame arg0@@33 arg1@@16)) FrameTypeType)
 :qid |funType:ConditionalFrame|
 :pattern ( (ConditionalFrame arg0@@33 arg1@@16))
)) (= (type EmptyFrame) FrameTypeType)))
(assert (forall ((p@@0 Real) (f_6 T@U) ) (!  (=> (= (type f_6) FrameTypeType) (= (ConditionalFrame p@@0 f_6) (ite (> p@@0 0.0) f_6 EmptyFrame)))
 :qid |stdinbpl.162:15|
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
(assert (forall ((p_1 T@U) ) (!  (=> (= (type p_1) ProcessDomainTypeType) (= (p_merge p_empty p_1) p_1))
 :qid |stdinbpl.205:15|
 :skolemid |22|
 :pattern ( (p_merge p_empty p_1))
)))
(assert (forall ((p_1@@0 T@U) ) (!  (=> (= (type p_1@@0) ProcessDomainTypeType) (= (p_seq p_empty p_1@@0) p_1@@0))
 :qid |stdinbpl.211:15|
 :skolemid |23|
 :pattern ( (p_seq p_empty p_1@@0))
)))
(assert (forall ((Heap@@13 T@U) (ExhaleHeap@@4 T@U) (Mask@@8 T@U) (pm_f@@1 T@U) ) (! (let ((C@@1 (FieldTypeInv0 (type pm_f@@1))))
 (=> (and (and (and (and (and (= (type Heap@@13) (MapType0Type RefType)) (= (type ExhaleHeap@@4) (MapType0Type RefType))) (= (type Mask@@8) (MapType1Type RefType realType))) (= (type pm_f@@1) (FieldType C@@1 FrameTypeType))) (IdenticalOnKnownLocations Heap@@13 ExhaleHeap@@4 Mask@@8)) (and (HasDirectPerm Mask@@8 null pm_f@@1) (IsPredicateField pm_f@@1))) (forall ((o2 T@U) (f_2@@0 T@U) ) (! (let ((B@@5 (FieldTypeInv1 (type f_2@@0))))
(let ((A@@6 (FieldTypeInv0 (type f_2@@0))))
 (=> (and (and (= (type o2) RefType) (= (type f_2@@0) (FieldType A@@6 B@@5))) (U_2_bool (MapType1Select (MapType0Select Heap@@13 null (PredicateMaskField pm_f@@1)) o2 f_2@@0))) (= (MapType0Select Heap@@13 o2 f_2@@0) (MapType0Select ExhaleHeap@@4 o2 f_2@@0)))))
 :qid |stdinbpl.54:134|
 :skolemid |3|
 :pattern ( (MapType0Select ExhaleHeap@@4 o2 f_2@@0))
))))
 :qid |stdinbpl.52:19|
 :skolemid |4|
 :pattern ( (IdenticalOnKnownLocations Heap@@13 ExhaleHeap@@4 Mask@@8) (IsPredicateField pm_f@@1))
)))
(assert (forall ((Heap@@14 T@U) (ExhaleHeap@@5 T@U) (Mask@@9 T@U) (pm_f@@2 T@U) ) (! (let ((C@@2 (FieldTypeInv0 (type pm_f@@2))))
 (=> (and (and (and (and (and (= (type Heap@@14) (MapType0Type RefType)) (= (type ExhaleHeap@@5) (MapType0Type RefType))) (= (type Mask@@9) (MapType1Type RefType realType))) (= (type pm_f@@2) (FieldType C@@2 FrameTypeType))) (IdenticalOnKnownLocations Heap@@14 ExhaleHeap@@5 Mask@@9)) (and (HasDirectPerm Mask@@9 null pm_f@@2) (IsWandField pm_f@@2))) (forall ((o2@@0 T@U) (f_2@@1 T@U) ) (! (let ((B@@6 (FieldTypeInv1 (type f_2@@1))))
(let ((A@@7 (FieldTypeInv0 (type f_2@@1))))
 (=> (and (and (= (type o2@@0) RefType) (= (type f_2@@1) (FieldType A@@7 B@@6))) (U_2_bool (MapType1Select (MapType0Select Heap@@14 null (WandMaskField pm_f@@2)) o2@@0 f_2@@1))) (= (MapType0Select Heap@@14 o2@@0 f_2@@1) (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1)))))
 :qid |stdinbpl.67:129|
 :skolemid |6|
 :pattern ( (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1))
))))
 :qid |stdinbpl.65:19|
 :skolemid |7|
 :pattern ( (IdenticalOnKnownLocations Heap@@14 ExhaleHeap@@5 Mask@@9) (IsWandField pm_f@@2))
)))
(assert (forall ((Mask@@10 T@U) (o_2@@2 T@U) (f_4@@2 T@U) ) (! (let ((B@@7 (FieldTypeInv1 (type f_4@@2))))
(let ((A@@8 (FieldTypeInv0 (type f_4@@2))))
 (=> (and (and (and (= (type Mask@@10) (MapType1Type RefType realType)) (= (type o_2@@2) RefType)) (= (type f_4@@2) (FieldType A@@8 B@@7))) (GoodMask Mask@@10)) (and (>= (U_2_real (MapType1Select Mask@@10 o_2@@2 f_4@@2)) NoPerm) (=> (and (and (GoodMask Mask@@10) (not (IsPredicateField f_4@@2))) (not (IsWandField f_4@@2))) (<= (U_2_real (MapType1Select Mask@@10 o_2@@2 f_4@@2)) FullPerm))))))
 :qid |stdinbpl.128:22|
 :skolemid |16|
 :pattern ( (GoodMask Mask@@10) (MapType1Select Mask@@10 o_2@@2 f_4@@2))
)))
(assert (forall ((arg0@@34 T@U) ) (! (= (type (FrameFragment arg0@@34)) FrameTypeType)
 :qid |funType:FrameFragment|
 :pattern ( (FrameFragment arg0@@34))
)))
(assert (forall ((Heap@@15 T@U) (Mask@@11 T@U) (diz@@17 T@U) ) (!  (=> (and (and (and (= (type Heap@@15) (MapType0Type RefType)) (= (type Mask@@11) (MapType1Type RefType realType))) (= (type diz@@17) RefType)) (state Heap@@15 Mask@@11)) (= (|History__free_get_x'| Heap@@15 diz@@17) (|History__free_get_x#frame| (FrameFragment (MapType0Select Heap@@15 diz@@17 History__x_hist_value)) diz@@17)))
 :qid |stdinbpl.299:15|
 :skolemid |35|
 :pattern ( (state Heap@@15 Mask@@11) (|History__free_get_x'| Heap@@15 diz@@17))
)))
(assert (forall ((Heap@@16 T@U) (Mask@@12 T@U) (diz@@18 T@U) ) (!  (=> (and (and (and (= (type Heap@@16) (MapType0Type RefType)) (= (type Mask@@12) (MapType1Type RefType realType))) (= (type diz@@18) RefType)) (state Heap@@16 Mask@@12)) (= (|History__hist_get_x'| Heap@@16 diz@@18) (|History__hist_get_x#frame| (FrameFragment (MapType0Select Heap@@16 diz@@18 History__x_hist_value)) diz@@18)))
 :qid |stdinbpl.367:15|
 :skolemid |39|
 :pattern ( (state Heap@@16 Mask@@12) (|History__hist_get_x'| Heap@@16 diz@@18))
)))
(assert (forall ((o T@U) (f T@U) (Heap@@17 T@U) ) (!  (=> (and (and (and (= (type o) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap@@17) (MapType0Type RefType))) (U_2_bool (MapType0Select Heap@@17 o $allocated))) (U_2_bool (MapType0Select Heap@@17 (MapType0Select Heap@@17 o f) $allocated)))
 :qid |stdinbpl.31:15|
 :skolemid |0|
 :pattern ( (MapType0Select Heap@@17 o f))
)))
(assert (forall ((n_1@@1 Int) ) (! (= (p_single n_1@@1) (ite (> n_1@@1 0) (p_seq (p_single (- n_1@@1 1)) p_incr) p_empty))
 :qid |stdinbpl.247:15|
 :skolemid |30|
 :pattern ( (p_single n_1@@1))
)))
(assert (forall ((Heap@@18 T@U) (o@@0 T@U) (f_3 T@U) (v T@U) ) (! (let ((B@@8 (type v)))
(let ((A@@9 (FieldTypeInv0 (type f_3))))
 (=> (and (and (= (type Heap@@18) (MapType0Type RefType)) (= (type o@@0) RefType)) (= (type f_3) (FieldType A@@9 B@@8))) (succHeap Heap@@18 (MapType0Store Heap@@18 o@@0 f_3 v)))))
 :qid |stdinbpl.78:22|
 :skolemid |9|
 :pattern ( (MapType0Store Heap@@18 o@@0 f_3 v))
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
 :qid |stdinbpl.169:25|
 :skolemid |20|
 :pattern ( (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))
)))
(assert (forall ((m_1@@0 Int) (n_1@@2 Int) ) (! (= (p_seq (p_single m_1@@0) (p_single n_1@@2)) (p_single (+ m_1@@0 n_1@@2)))
 :qid |stdinbpl.253:15|
 :skolemid |31|
 :pattern ( (p_seq (p_single m_1@@0) (p_single n_1@@2)))
)))
(assert (forall ((p_1@@1 T@U) ) (!  (=> (= (type p_1@@1) ProcessDomainTypeType) (= (p_seq p_1@@1 p_empty) p_1@@1))
 :qid |stdinbpl.217:15|
 :skolemid |24|
 :pattern ( (p_seq p_1@@1 p_empty))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
; Valid

(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun Heap@@19 () T@U)
(declare-fun diz@@19 () T@U)
(declare-fun freshObj@0 () T@U)
(declare-fun Heap@0 () T@U)
(declare-fun current_thread_id () Int)
(assert  (and (and (and (= (type Heap@@19) (MapType0Type RefType)) (= (type diz@@19) RefType)) (= (type freshObj@0) RefType)) (= (type Heap@0) (MapType0Type RefType))))
(set-info :boogie-vc-id Application__Application)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 6) (let ((anon3_Else_correct  (=> (U_2_bool (MapType0Select Heap@@19 diz@@19 $allocated)) (=> (and (not (= freshObj@0 null)) (not (U_2_bool (MapType0Select Heap@@19 freshObj@0 $allocated)))) (=> (and (and (= Heap@0 (MapType0Store Heap@@19 freshObj@0 $allocated (bool_2_U true))) (state Heap@0 ZeroMask)) (and (state Heap@0 ZeroMask) (= (ControlFlow 0 3) (- 0 4)))) (not (= freshObj@0 null)))))))
(let ((anon3_Then_correct true))
(let ((anon0_correct  (=> (and (and (state Heap@@19 ZeroMask) (= AssumeFunctionsAbove (- 0 1))) (and (>= current_thread_id 0) (state Heap@@19 ZeroMask))) (and (=> (= (ControlFlow 0 5) 1) anon3_Then_correct) (=> (= (ControlFlow 0 5) 3) anon3_Else_correct)))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 6) 5) anon0_correct)))
PreconditionGeneratedEntry_correct)))))
))
(check-sat)
(pop 1)
; Valid
(get-info :rlimit)
