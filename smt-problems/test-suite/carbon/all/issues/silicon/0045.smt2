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
(declare-fun delete (T@U T@U) T@U)
(declare-fun nil (T@U) T@U)
(declare-fun NaturalDomainTypeType () T@T)
(declare-fun ListDomainTypeType (T@T) T@T)
(declare-fun ListDomainTypeTypeInv0 (T@T) T@T)
(declare-fun drop (T@U T@U) T@U)
(declare-fun take (T@U T@U) T@U)
(declare-fun sort (T@U) T@U)
(declare-fun reverse (T@U) T@U)
(declare-fun butLast (T@U) T@U)
(declare-fun mirror (T@U) T@U)
(declare-fun leaf (T@U) T@U)
(declare-fun TreeDomainTypeType (T@T) T@T)
(declare-fun TreeDomainTypeTypeInv0 (T@T) T@T)
(declare-fun succHeap (T@U T@U) Bool)
(declare-fun MapType0Type (T@T) T@T)
(declare-fun RefType () T@T)
(declare-fun succHeapTrans (T@U T@U) Bool)
(declare-fun MapType0TypeInv0 (T@T) T@T)
(declare-fun FieldType (T@T T@T) T@T)
(declare-fun FieldTypeInv0 (T@T) T@T)
(declare-fun FieldTypeInv1 (T@T) T@T)
(declare-fun MapType0Select (T@U T@U T@U) T@U)
(declare-fun MapType0Store (T@U T@U T@U T@U) T@U)
(declare-fun isZeroOrSuccessor (T@U) Bool)
(declare-fun isNilOrCons (T@U) Bool)
(declare-fun isLeafOrNode (T@U) Bool)
(declare-fun state (T@U T@U) Bool)
(declare-fun MapType1Type (T@T T@T) T@T)
(declare-fun GoodMask (T@U) Bool)
(declare-fun MapType1TypeInv0 (T@T) T@T)
(declare-fun MapType1TypeInv1 (T@T) T@T)
(declare-fun MapType1Select (T@U T@U T@U) T@U)
(declare-fun MapType1Store (T@U T@U T@U T@U) T@U)
(declare-fun insertSorting (T@U T@U) T@U)
(declare-fun cons (T@U T@U) T@U)
(declare-fun insert (T@U T@U) T@U)
(declare-fun insertUnlessPresent (T@U T@U) T@U)
(declare-fun sum (T@U) T@U)
(declare-fun plus (T@U T@U) T@U)
(declare-fun IdenticalOnKnownLocations (T@U T@U T@U) Bool)
(declare-fun IsPredicateField (T@U) Bool)
(declare-fun null () T@U)
(declare-fun PredicateMaskField (T@U) T@U)
(declare-fun FrameTypeType () T@T)
(declare-fun HasDirectPerm (T@U T@U T@U) Bool)
(declare-fun IsWandField (T@U) Bool)
(declare-fun WandMaskField (T@U) T@U)
(declare-fun concatenate (T@U T@U) T@U)
(declare-fun length (T@U) T@U)
(declare-fun successor (T@U) T@U)
(declare-fun element (T@U T@U) Bool)
(declare-fun empty (T@U) Bool)
(declare-fun sorted (T@U) Bool)
(declare-fun hasMultiple (T@U) Bool)
(declare-fun lessEqual (T@U T@U) Bool)
(declare-fun less (T@U T@U) Bool)
(declare-fun $allocated () T@U)
(declare-fun NormalFieldType () T@T)
(declare-fun height (T@U) T@U)
(declare-fun node (T@U T@U T@U) T@U)
(declare-fun maximum (T@U T@U) T@U)
(declare-fun minus (T@U T@U) T@U)
(declare-fun zero () T@U)
(declare-fun times (T@U T@U) T@U)
(declare-fun minimum (T@U T@U) T@U)
(declare-fun dummyHeap () T@U)
(declare-fun ZeroMask () T@U)
(declare-fun count (T@U T@U) T@U)
(declare-fun InsidePredicate (T@U T@U T@U T@U) Bool)
(declare-fun sumMask (T@U T@U T@U) Bool)
(declare-fun ConditionalFrame (Real T@U) T@U)
(declare-fun EmptyFrame () T@U)
(declare-fun NoPerm () Real)
(declare-fun last (T@U) T@U)
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
(assert  (and (and (and (and (= (Ctor NaturalDomainTypeType) 6) (forall ((arg0@@11 T@T) ) (! (= (Ctor (ListDomainTypeType arg0@@11)) 7)
 :qid |ctor:ListDomainTypeType|
))) (forall ((arg0@@12 T@T) ) (! (= (ListDomainTypeTypeInv0 (ListDomainTypeType arg0@@12)) arg0@@12)
 :qid |typeInv:ListDomainTypeTypeInv0|
 :pattern ( (ListDomainTypeType arg0@@12))
))) (forall ((arg0@@13 T@U) (arg1 T@U) ) (! (= (type (delete arg0@@13 arg1)) (ListDomainTypeType NaturalDomainTypeType))
 :qid |funType:delete|
 :pattern ( (delete arg0@@13 arg1))
))) (forall ((arg0@@14 T@U) ) (! (let ((A (type arg0@@14)))
(= (type (nil arg0@@14)) (ListDomainTypeType A)))
 :qid |funType:nil|
 :pattern ( (nil arg0@@14))
))))
(assert (forall ((n_1 T@U) (t_2 T@U) ) (!  (=> (and (= (type n_1) NaturalDomainTypeType) (= (type t_2) NaturalDomainTypeType)) (= (delete n_1 (nil t_2)) (nil t_2)))
 :qid |stdinbpl.511:15|
 :skolemid |61|
 :pattern ( (delete n_1 (nil t_2)))
)))
(assert (forall ((arg0@@15 T@U) (arg1@@0 T@U) ) (! (let ((A@@0 (ListDomainTypeTypeInv0 (type arg1@@0))))
(= (type (drop arg0@@15 arg1@@0)) (ListDomainTypeType A@@0)))
 :qid |funType:drop|
 :pattern ( (drop arg0@@15 arg1@@0))
)))
(assert (forall ((n_1@@0 T@U) (t_2@@0 T@U) ) (!  (=> (= (type n_1@@0) NaturalDomainTypeType) (= (drop n_1@@0 (nil t_2@@0)) (nil t_2@@0)))
 :qid |stdinbpl.553:19|
 :skolemid |68|
 :pattern ( (drop n_1@@0 (nil t_2@@0)))
)))
(assert (forall ((arg0@@16 T@U) (arg1@@1 T@U) ) (! (let ((A@@1 (ListDomainTypeTypeInv0 (type arg1@@1))))
(= (type (take arg0@@16 arg1@@1)) (ListDomainTypeType A@@1)))
 :qid |funType:take|
 :pattern ( (take arg0@@16 arg1@@1))
)))
(assert (forall ((n_1@@1 T@U) (t_2@@1 T@U) ) (!  (=> (= (type n_1@@1) NaturalDomainTypeType) (= (take n_1@@1 (nil t_2@@1)) (nil t_2@@1)))
 :qid |stdinbpl.574:19|
 :skolemid |72|
 :pattern ( (take n_1@@1 (nil t_2@@1)))
)))
(assert (forall ((arg0@@17 T@U) ) (! (= (type (sort arg0@@17)) (ListDomainTypeType NaturalDomainTypeType))
 :qid |funType:sort|
 :pattern ( (sort arg0@@17))
)))
(assert (forall ((t_2@@2 T@U) ) (!  (=> (= (type t_2@@2) NaturalDomainTypeType) (= (sort (nil t_2@@2)) (nil t_2@@2)))
 :qid |stdinbpl.688:15|
 :skolemid |91|
 :pattern ( (sort (nil t_2@@2)))
)))
(assert (forall ((arg0@@18 T@U) ) (! (let ((A@@2 (ListDomainTypeTypeInv0 (type arg0@@18))))
(= (type (reverse arg0@@18)) (ListDomainTypeType A@@2)))
 :qid |funType:reverse|
 :pattern ( (reverse arg0@@18))
)))
(assert (forall ((t_2@@3 T@U) ) (! (= (reverse (nil t_2@@3)) (nil t_2@@3))
 :qid |stdinbpl.499:19|
 :skolemid |59|
 :pattern ( (reverse (nil t_2@@3)))
)))
(assert (forall ((arg0@@19 T@U) ) (! (let ((A@@3 (ListDomainTypeTypeInv0 (type arg0@@19))))
(= (type (butLast arg0@@19)) (ListDomainTypeType A@@3)))
 :qid |funType:butLast|
 :pattern ( (butLast arg0@@19))
)))
(assert (forall ((t_2@@4 T@U) ) (! (= (butLast (nil t_2@@4)) (nil t_2@@4))
 :qid |stdinbpl.598:19|
 :skolemid |76|
 :pattern ( (butLast (nil t_2@@4)))
)))
(assert  (and (and (and (forall ((arg0@@20 T@T) ) (! (= (Ctor (TreeDomainTypeType arg0@@20)) 8)
 :qid |ctor:TreeDomainTypeType|
)) (forall ((arg0@@21 T@T) ) (! (= (TreeDomainTypeTypeInv0 (TreeDomainTypeType arg0@@21)) arg0@@21)
 :qid |typeInv:TreeDomainTypeTypeInv0|
 :pattern ( (TreeDomainTypeType arg0@@21))
))) (forall ((arg0@@22 T@U) ) (! (let ((A@@4 (TreeDomainTypeTypeInv0 (type arg0@@22))))
(= (type (mirror arg0@@22)) (TreeDomainTypeType A@@4)))
 :qid |funType:mirror|
 :pattern ( (mirror arg0@@22))
))) (forall ((arg0@@23 T@U) ) (! (let ((A@@5 (type arg0@@23)))
(= (type (leaf arg0@@23)) (TreeDomainTypeType A@@5)))
 :qid |funType:leaf|
 :pattern ( (leaf arg0@@23))
))))
(assert (forall ((t_2@@5 T@U) ) (! (= (mirror (leaf t_2@@5)) (leaf t_2@@5))
 :qid |stdinbpl.776:19|
 :skolemid |103|
 :pattern ( (mirror (leaf t_2@@5)))
)))
(assert  (and (and (and (and (and (and (and (and (and (forall ((arg0@@24 T@T) ) (! (= (Ctor (MapType0Type arg0@@24)) 9)
 :qid |ctor:MapType0Type|
)) (forall ((arg0@@25 T@T) ) (! (= (MapType0TypeInv0 (MapType0Type arg0@@25)) arg0@@25)
 :qid |typeInv:MapType0TypeInv0|
 :pattern ( (MapType0Type arg0@@25))
))) (forall ((arg0@@26 T@T) (arg1@@2 T@T) ) (! (= (Ctor (FieldType arg0@@26 arg1@@2)) 10)
 :qid |ctor:FieldType|
))) (forall ((arg0@@27 T@T) (arg1@@3 T@T) ) (! (= (FieldTypeInv0 (FieldType arg0@@27 arg1@@3)) arg0@@27)
 :qid |typeInv:FieldTypeInv0|
 :pattern ( (FieldType arg0@@27 arg1@@3))
))) (forall ((arg0@@28 T@T) (arg1@@4 T@T) ) (! (= (FieldTypeInv1 (FieldType arg0@@28 arg1@@4)) arg1@@4)
 :qid |typeInv:FieldTypeInv1|
 :pattern ( (FieldType arg0@@28 arg1@@4))
))) (forall ((arg0@@29 T@U) (arg1@@5 T@U) (arg2 T@U) ) (! (let ((B (FieldTypeInv1 (type arg2))))
(= (type (MapType0Select arg0@@29 arg1@@5 arg2)) B))
 :qid |funType:MapType0Select|
 :pattern ( (MapType0Select arg0@@29 arg1@@5 arg2))
))) (forall ((arg0@@30 T@U) (arg1@@6 T@U) (arg2@@0 T@U) (arg3 T@U) ) (! (let ((aVar0 (type arg1@@6)))
(= (type (MapType0Store arg0@@30 arg1@@6 arg2@@0 arg3)) (MapType0Type aVar0)))
 :qid |funType:MapType0Store|
 :pattern ( (MapType0Store arg0@@30 arg1@@6 arg2@@0 arg3))
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
)))) (= (Ctor RefType) 11)))
(assert (forall ((Heap0 T@U) (Heap1 T@U) ) (!  (=> (and (and (= (type Heap0) (MapType0Type RefType)) (= (type Heap1) (MapType0Type RefType))) (succHeap Heap0 Heap1)) (succHeapTrans Heap0 Heap1))
 :qid |stdinbpl.88:15|
 :skolemid |11|
 :pattern ( (succHeap Heap0 Heap1))
)))
(assert (forall ((n_1@@2 T@U) ) (!  (=> (= (type n_1@@2) NaturalDomainTypeType) (isZeroOrSuccessor n_1@@2))
 :qid |stdinbpl.213:15|
 :skolemid |22|
 :pattern ( (isZeroOrSuccessor n_1@@2))
)))
(assert (forall ((l_1 T@U) ) (! (let ((A@@6 (ListDomainTypeTypeInv0 (type l_1))))
 (=> (= (type l_1) (ListDomainTypeType A@@6)) (isNilOrCons l_1)))
 :qid |stdinbpl.433:19|
 :skolemid |47|
 :pattern ( (isNilOrCons l_1))
)))
(assert (forall ((t_2@@6 T@U) ) (! (let ((A@@7 (TreeDomainTypeTypeInv0 (type t_2@@6))))
 (=> (= (type t_2@@6) (TreeDomainTypeType A@@7)) (isLeafOrNode t_2@@6)))
 :qid |stdinbpl.746:19|
 :skolemid |97|
 :pattern ( (isLeafOrNode t_2@@6))
)))
(assert  (and (and (and (and (and (and (forall ((arg0@@31 T@T) (arg1@@7 T@T) ) (! (= (Ctor (MapType1Type arg0@@31 arg1@@7)) 12)
 :qid |ctor:MapType1Type|
)) (forall ((arg0@@32 T@T) (arg1@@8 T@T) ) (! (= (MapType1TypeInv0 (MapType1Type arg0@@32 arg1@@8)) arg0@@32)
 :qid |typeInv:MapType1TypeInv0|
 :pattern ( (MapType1Type arg0@@32 arg1@@8))
))) (forall ((arg0@@33 T@T) (arg1@@9 T@T) ) (! (= (MapType1TypeInv1 (MapType1Type arg0@@33 arg1@@9)) arg1@@9)
 :qid |typeInv:MapType1TypeInv1|
 :pattern ( (MapType1Type arg0@@33 arg1@@9))
))) (forall ((arg0@@34 T@U) (arg1@@10 T@U) (arg2@@1 T@U) ) (! (let ((aVar1 (MapType1TypeInv1 (type arg0@@34))))
(= (type (MapType1Select arg0@@34 arg1@@10 arg2@@1)) aVar1))
 :qid |funType:MapType1Select|
 :pattern ( (MapType1Select arg0@@34 arg1@@10 arg2@@1))
))) (forall ((arg0@@35 T@U) (arg1@@11 T@U) (arg2@@2 T@U) (arg3@@0 T@U) ) (! (let ((aVar1@@0 (type arg3@@0)))
(let ((aVar0@@0 (type arg1@@11)))
(= (type (MapType1Store arg0@@35 arg1@@11 arg2@@2 arg3@@0)) (MapType1Type aVar0@@0 aVar1@@0))))
 :qid |funType:MapType1Store|
 :pattern ( (MapType1Store arg0@@35 arg1@@11 arg2@@2 arg3@@0))
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
(assert  (and (forall ((arg0@@36 T@U) (arg1@@12 T@U) ) (! (= (type (insertSorting arg0@@36 arg1@@12)) (ListDomainTypeType NaturalDomainTypeType))
 :qid |funType:insertSorting|
 :pattern ( (insertSorting arg0@@36 arg1@@12))
)) (forall ((arg0@@37 T@U) (arg1@@13 T@U) ) (! (let ((A@@8 (type arg0@@37)))
(= (type (cons arg0@@37 arg1@@13)) (ListDomainTypeType A@@8)))
 :qid |funType:cons|
 :pattern ( (cons arg0@@37 arg1@@13))
))))
(assert (forall ((n_1@@3 T@U) (t_2@@7 T@U) ) (!  (=> (and (= (type n_1@@3) NaturalDomainTypeType) (= (type t_2@@7) NaturalDomainTypeType)) (= (insertSorting n_1@@3 (nil t_2@@7)) (cons n_1@@3 (nil t_2@@7))))
 :qid |stdinbpl.652:15|
 :skolemid |85|
 :pattern ( (insertSorting n_1@@3 (nil t_2@@7)))
 :pattern ( (cons n_1@@3 (nil t_2@@7)))
)))
(assert (forall ((arg0@@38 T@U) (arg1@@14 T@U) ) (! (= (type (insert arg0@@38 arg1@@14)) (ListDomainTypeType NaturalDomainTypeType))
 :qid |funType:insert|
 :pattern ( (insert arg0@@38 arg1@@14))
)))
(assert (forall ((n_1@@4 T@U) (t_2@@8 T@U) ) (!  (=> (and (= (type n_1@@4) NaturalDomainTypeType) (= (type t_2@@8) NaturalDomainTypeType)) (= (insert n_1@@4 (nil t_2@@8)) (cons n_1@@4 (nil t_2@@8))))
 :qid |stdinbpl.664:15|
 :skolemid |87|
 :pattern ( (insert n_1@@4 (nil t_2@@8)))
 :pattern ( (cons n_1@@4 (nil t_2@@8)))
)))
(assert (forall ((arg0@@39 T@U) (arg1@@15 T@U) ) (! (= (type (insertUnlessPresent arg0@@39 arg1@@15)) (ListDomainTypeType NaturalDomainTypeType))
 :qid |funType:insertUnlessPresent|
 :pattern ( (insertUnlessPresent arg0@@39 arg1@@15))
)))
(assert (forall ((n_1@@5 T@U) (t_2@@9 T@U) ) (!  (=> (and (= (type n_1@@5) NaturalDomainTypeType) (= (type t_2@@9) NaturalDomainTypeType)) (= (insertUnlessPresent n_1@@5 (nil t_2@@9)) (cons n_1@@5 (nil t_2@@9))))
 :qid |stdinbpl.676:15|
 :skolemid |89|
 :pattern ( (insertUnlessPresent n_1@@5 (nil t_2@@9)))
 :pattern ( (cons n_1@@5 (nil t_2@@9)))
)))
(assert (forall ((x@@8 T@U) (xs T@U) ) (!  (=> (and (= (type x@@8) NaturalDomainTypeType) (= (type xs) (ListDomainTypeType NaturalDomainTypeType))) (= (sort (cons x@@8 xs)) (insertSorting x@@8 (sort xs))))
 :qid |stdinbpl.694:15|
 :skolemid |92|
 :pattern ( (sort (cons x@@8 xs)))
 :pattern ( (insertSorting x@@8 (sort xs)))
)))
(assert  (and (forall ((arg0@@40 T@U) ) (! (= (type (sum arg0@@40)) NaturalDomainTypeType)
 :qid |funType:sum|
 :pattern ( (sum arg0@@40))
)) (forall ((arg0@@41 T@U) (arg1@@16 T@U) ) (! (= (type (plus arg0@@41 arg1@@16)) NaturalDomainTypeType)
 :qid |funType:plus|
 :pattern ( (plus arg0@@41 arg1@@16))
))))
(assert (forall ((n_1@@6 T@U) (l_1@@0 T@U) ) (!  (=> (and (= (type n_1@@6) NaturalDomainTypeType) (= (type l_1@@0) (ListDomainTypeType NaturalDomainTypeType))) (= (sum (cons n_1@@6 l_1@@0)) (plus n_1@@6 (sum l_1@@0))))
 :qid |stdinbpl.706:15|
 :skolemid |94|
 :pattern ( (sum (cons n_1@@6 l_1@@0)))
 :pattern ( (plus n_1@@6 (sum l_1@@0)))
)))
(assert  (and (and (= (Ctor FrameTypeType) 13) (= (type null) RefType)) (forall ((arg0@@42 T@U) ) (! (let ((A@@9 (FieldTypeInv0 (type arg0@@42))))
(= (type (PredicateMaskField arg0@@42)) (FieldType A@@9 (MapType1Type RefType boolType))))
 :qid |funType:PredicateMaskField|
 :pattern ( (PredicateMaskField arg0@@42))
))))
(assert (forall ((Heap@@0 T@U) (ExhaleHeap T@U) (Mask@@0 T@U) (pm_f T@U) ) (! (let ((C (FieldTypeInv0 (type pm_f))))
 (=> (and (and (and (and (and (= (type Heap@@0) (MapType0Type RefType)) (= (type ExhaleHeap) (MapType0Type RefType))) (= (type Mask@@0) (MapType1Type RefType realType))) (= (type pm_f) (FieldType C FrameTypeType))) (IdenticalOnKnownLocations Heap@@0 ExhaleHeap Mask@@0)) (and (HasDirectPerm Mask@@0 null pm_f) (IsPredicateField pm_f))) (= (MapType0Select Heap@@0 null (PredicateMaskField pm_f)) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))))
 :qid |stdinbpl.47:19|
 :skolemid |2|
 :pattern ( (IdenticalOnKnownLocations Heap@@0 ExhaleHeap Mask@@0) (IsPredicateField pm_f) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))
)))
(assert (forall ((arg0@@43 T@U) ) (! (let ((A@@10 (FieldTypeInv0 (type arg0@@43))))
(= (type (WandMaskField arg0@@43)) (FieldType A@@10 (MapType1Type RefType boolType))))
 :qid |funType:WandMaskField|
 :pattern ( (WandMaskField arg0@@43))
)))
(assert (forall ((Heap@@1 T@U) (ExhaleHeap@@0 T@U) (Mask@@1 T@U) (pm_f@@0 T@U) ) (! (let ((C@@0 (FieldTypeInv0 (type pm_f@@0))))
 (=> (and (and (and (and (and (= (type Heap@@1) (MapType0Type RefType)) (= (type ExhaleHeap@@0) (MapType0Type RefType))) (= (type Mask@@1) (MapType1Type RefType realType))) (= (type pm_f@@0) (FieldType C@@0 FrameTypeType))) (IdenticalOnKnownLocations Heap@@1 ExhaleHeap@@0 Mask@@1)) (and (HasDirectPerm Mask@@1 null pm_f@@0) (IsWandField pm_f@@0))) (= (MapType0Select Heap@@1 null (WandMaskField pm_f@@0)) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))))
 :qid |stdinbpl.60:19|
 :skolemid |5|
 :pattern ( (IdenticalOnKnownLocations Heap@@1 ExhaleHeap@@0 Mask@@1) (IsWandField pm_f@@0) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))
)))
(assert (forall ((arg0@@44 T@U) (arg1@@17 T@U) ) (! (let ((A@@11 (ListDomainTypeTypeInv0 (type arg0@@44))))
(= (type (concatenate arg0@@44 arg1@@17)) (ListDomainTypeType A@@11)))
 :qid |funType:concatenate|
 :pattern ( (concatenate arg0@@44 arg1@@17))
)))
(assert (forall ((x@@9 T@U) (xs@@0 T@U) (ys T@U) ) (! (let ((A@@12 (type x@@9)))
 (=> (and (= (type xs@@0) (ListDomainTypeType A@@12)) (= (type ys) (ListDomainTypeType A@@12))) (= (concatenate (cons x@@9 xs@@0) ys) (cons x@@9 (concatenate xs@@0 ys)))))
 :qid |stdinbpl.493:19|
 :skolemid |58|
 :pattern ( (cons x@@9 xs@@0) (concatenate xs@@0 ys))
 :pattern ( (cons x@@9 xs@@0) (cons x@@9 (concatenate xs@@0 ys)))
 :pattern ( (concatenate (cons x@@9 xs@@0) ys))
 :pattern ( (cons x@@9 (concatenate xs@@0 ys)))
)))
(assert  (and (forall ((arg0@@45 T@U) ) (! (= (type (length arg0@@45)) NaturalDomainTypeType)
 :qid |funType:length|
 :pattern ( (length arg0@@45))
)) (forall ((arg0@@46 T@U) ) (! (= (type (successor arg0@@46)) NaturalDomainTypeType)
 :qid |funType:successor|
 :pattern ( (successor arg0@@46))
))))
(assert (forall ((e_1 T@U) (xs@@1 T@U) ) (! (let ((A@@13 (type e_1)))
 (=> (= (type xs@@1) (ListDomainTypeType A@@13)) (= (length (cons e_1 xs@@1)) (successor (length xs@@1)))))
 :qid |stdinbpl.529:19|
 :skolemid |64|
 :pattern ( (length (cons e_1 xs@@1)))
)))
(assert (forall ((n_1@@7 T@U) (t_2@@10 T@U) ) (!  (=> (and (= (type n_1@@7) NaturalDomainTypeType) (= (type t_2@@10) NaturalDomainTypeType)) (not (element n_1@@7 (nil t_2@@10))))
 :qid |stdinbpl.535:15|
 :skolemid |65|
 :pattern ( (element n_1@@7 (nil t_2@@10)))
)))
(assert (forall ((e_1@@0 T@U) (l_1@@1 T@U) ) (! (let ((A@@14 (type e_1@@0)))
 (=> (= (type l_1@@1) (ListDomainTypeType A@@14)) (not (empty (cons e_1@@0 l_1@@1)))))
 :qid |stdinbpl.481:19|
 :skolemid |56|
 :pattern ( (empty (cons e_1@@0 l_1@@1)))
)))
(assert (forall ((x@@10 T@U) (e_1@@1 T@U) (l_1@@2 T@U) ) (! (let ((A@@15 (type x@@10)))
 (=> (and (= (type e_1@@1) A@@15) (= (type l_1@@2) (ListDomainTypeType A@@15))) (= (cons x@@10 (cons e_1@@1 l_1@@2)) (cons x@@10 (butLast (cons e_1@@1 l_1@@2))))))
 :qid |stdinbpl.610:19|
 :skolemid |78|
 :pattern ( (cons x@@10 (cons e_1@@1 l_1@@2)))
 :pattern ( (cons x@@10 (butLast (cons e_1@@1 l_1@@2))))
)))
(assert (forall ((t_2@@11 T@U) ) (!  (=> (= (type t_2@@11) NaturalDomainTypeType) (sorted (nil t_2@@11)))
 :qid |stdinbpl.634:15|
 :skolemid |82|
 :pattern ( (sorted (nil t_2@@11)))
)))
(assert (forall ((t_2@@12 T@U) ) (! (empty (nil t_2@@12))
 :qid |stdinbpl.475:19|
 :skolemid |55|
 :pattern ( (empty (nil t_2@@12)))
)))
(assert (forall ((t_2@@13 T@U) ) (!  (=> (= (type t_2@@13) NaturalDomainTypeType) (not (hasMultiple (nil t_2@@13))))
 :qid |stdinbpl.712:15|
 :skolemid |95|
 :pattern ( (hasMultiple (nil t_2@@13)))
)))
(assert (forall ((x@@11 T@U) (y@@1 T@U) ) (!  (=> (and (= (type x@@11) NaturalDomainTypeType) (= (type y@@1) NaturalDomainTypeType)) (= (lessEqual (successor x@@11) (successor y@@1)) (lessEqual x@@11 y@@1)))
 :qid |stdinbpl.261:15|
 :skolemid |30|
 :pattern ( (successor x@@11) (lessEqual x@@11 y@@1))
 :pattern ( (successor y@@1) (lessEqual x@@11 y@@1))
 :pattern ( (lessEqual (successor x@@11) (successor y@@1)))
 :pattern ( (lessEqual x@@11 y@@1))
)))
(assert (forall ((x@@12 T@U) (y@@2 T@U) ) (!  (=> (and (= (type x@@12) NaturalDomainTypeType) (= (type y@@2) NaturalDomainTypeType)) (= (less (successor x@@12) (successor y@@2)) (less x@@12 y@@2)))
 :qid |stdinbpl.279:15|
 :skolemid |33|
 :pattern ( (successor x@@12) (less x@@12 y@@2))
 :pattern ( (successor y@@2) (less x@@12 y@@2))
 :pattern ( (less (successor x@@12) (successor y@@2)))
 :pattern ( (less x@@12 y@@2))
)))
(assert  (and (= (Ctor NormalFieldType) 14) (= (type $allocated) (FieldType NormalFieldType boolType))))
(assert (forall ((Heap@@2 T@U) (ExhaleHeap@@1 T@U) (Mask@@2 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@2) (MapType0Type RefType)) (= (type ExhaleHeap@@1) (MapType0Type RefType))) (= (type Mask@@2) (MapType1Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@2 ExhaleHeap@@1 Mask@@2)) (U_2_bool (MapType0Select Heap@@2 o_1 $allocated))) (U_2_bool (MapType0Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.73:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@2 ExhaleHeap@@1 Mask@@2) (MapType0Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert  (and (and (forall ((arg0@@47 T@U) ) (! (= (type (height arg0@@47)) NaturalDomainTypeType)
 :qid |funType:height|
 :pattern ( (height arg0@@47))
)) (forall ((arg0@@48 T@U) (arg1@@18 T@U) (arg2@@3 T@U) ) (! (let ((A@@16 (type arg1@@18)))
(= (type (node arg0@@48 arg1@@18 arg2@@3)) (TreeDomainTypeType A@@16)))
 :qid |funType:node|
 :pattern ( (node arg0@@48 arg1@@18 arg2@@3))
))) (forall ((arg0@@49 T@U) (arg1@@19 T@U) ) (! (= (type (maximum arg0@@49 arg1@@19)) NaturalDomainTypeType)
 :qid |funType:maximum|
 :pattern ( (maximum arg0@@49 arg1@@19))
))))
(assert (forall ((l_1@@3 T@U) (x@@13 T@U) (r_2 T@U) ) (! (let ((A@@17 (type x@@13)))
 (=> (and (= (type l_1@@3) (TreeDomainTypeType A@@17)) (= (type r_2) (TreeDomainTypeType A@@17))) (= (height (node l_1@@3 x@@13 r_2)) (successor (maximum (height l_1@@3) (height r_2))))))
 :qid |stdinbpl.770:19|
 :skolemid |102|
 :pattern ( (height (node l_1@@3 x@@13 r_2)))
)))
(assert (forall ((x@@14 T@U) (t_2@@14 T@U) ) (!  (=> (and (= (type x@@14) NaturalDomainTypeType) (= (type t_2@@14) NaturalDomainTypeType)) (sorted (cons x@@14 (nil t_2@@14))))
 :qid |stdinbpl.640:15|
 :skolemid |83|
 :pattern ( (sorted (cons x@@14 (nil t_2@@14))))
)))
(assert (forall ((x@@15 T@U) (e_1@@2 T@U) (xs@@2 T@U) ) (! (let ((A@@18 (type e_1@@2)))
 (=> (and (= (type x@@15) NaturalDomainTypeType) (= (type xs@@2) (ListDomainTypeType A@@18))) (= (drop (successor x@@15) (cons e_1@@2 xs@@2)) (drop x@@15 xs@@2))))
 :qid |stdinbpl.559:19|
 :skolemid |69|
 :pattern ( (cons e_1@@2 xs@@2) (drop x@@15 xs@@2))
 :pattern ( (drop (successor x@@15) (cons e_1@@2 xs@@2)))
)))
(assert (forall ((arg0@@50 T@U) (arg1@@20 T@U) ) (! (= (type (minus arg0@@50 arg1@@20)) NaturalDomainTypeType)
 :qid |funType:minus|
 :pattern ( (minus arg0@@50 arg1@@20))
)))
(assert (forall ((x@@16 T@U) (y@@3 T@U) ) (!  (=> (and (= (type x@@16) NaturalDomainTypeType) (= (type y@@3) NaturalDomainTypeType)) (= (minus (successor x@@16) (successor y@@3)) (minus x@@16 y@@3)))
 :qid |stdinbpl.309:15|
 :skolemid |38|
 :pattern ( (successor x@@16) (minus x@@16 y@@3))
 :pattern ( (successor y@@3) (minus x@@16 y@@3))
 :pattern ( (minus (successor x@@16) (successor y@@3)))
 :pattern ( (minus x@@16 y@@3))
)))
(assert (forall ((x@@17 T@U) (y@@4 T@U) (ys@@0 T@U) ) (!  (=> (and (and (= (type x@@17) NaturalDomainTypeType) (= (type y@@4) NaturalDomainTypeType)) (= (type ys@@0) (ListDomainTypeType NaturalDomainTypeType))) (= (sorted (cons x@@17 (cons y@@4 ys@@0)))  (and (lessEqual x@@17 y@@4) (sorted (cons y@@4 ys@@0)))))
 :qid |stdinbpl.646:15|
 :skolemid |84|
 :pattern ( (cons y@@4 ys@@0) (lessEqual x@@17 y@@4))
 :pattern ( (sorted (cons x@@17 (cons y@@4 ys@@0))))
 :pattern ( (lessEqual x@@17 y@@4) (cons y@@4 ys@@0))
 :pattern ( (lessEqual x@@17 y@@4) (sorted (cons y@@4 ys@@0)))
)))
(assert (= (type zero) NaturalDomainTypeType))
(assert (forall ((n_1@@8 T@U) ) (!  (=> (= (type n_1@@8) NaturalDomainTypeType) (= (minus zero n_1@@8) zero))
 :qid |stdinbpl.297:15|
 :skolemid |36|
 :pattern ( (minus zero n_1@@8))
)))
(assert (forall ((arg0@@51 T@U) (arg1@@21 T@U) ) (! (= (type (times arg0@@51 arg1@@21)) NaturalDomainTypeType)
 :qid |funType:times|
 :pattern ( (times arg0@@51 arg1@@21))
)))
(assert (forall ((n_1@@9 T@U) ) (!  (=> (= (type n_1@@9) NaturalDomainTypeType) (= (times zero n_1@@9) zero))
 :qid |stdinbpl.315:15|
 :skolemid |39|
 :pattern ( (times zero n_1@@9))
)))
(assert (forall ((arg0@@52 T@U) (arg1@@22 T@U) ) (! (= (type (minimum arg0@@52 arg1@@22)) NaturalDomainTypeType)
 :qid |funType:minimum|
 :pattern ( (minimum arg0@@52 arg1@@22))
)))
(assert (forall ((y@@5 T@U) ) (!  (=> (= (type y@@5) NaturalDomainTypeType) (= (minimum zero y@@5) zero))
 :qid |stdinbpl.327:15|
 :skolemid |41|
 :pattern ( (minimum zero y@@5))
)))
(assert (forall ((n_1@@10 T@U) ) (!  (=> (= (type n_1@@10) NaturalDomainTypeType) (= (isZeroOrSuccessor n_1@@10)  (or (= n_1@@10 zero) (exists ((p_1 T@U) ) (!  (and (= (type p_1) NaturalDomainTypeType) (= n_1@@10 (successor p_1)))
 :qid |stdinbpl.221:84|
 :skolemid |23|
 :pattern ( (successor p_1))
)))))
 :qid |stdinbpl.219:15|
 :skolemid |24|
 :pattern ( (isZeroOrSuccessor n_1@@10))
)))
(assert (forall ((l_1@@4 T@U) ) (! (let ((A@@19 (ListDomainTypeTypeInv0 (type l_1@@4))))
 (=> (= (type l_1@@4) (ListDomainTypeType A@@19)) (exists ((t_2@@15 T@U) ) (!  (and (= (type t_2@@15) A@@19) (= (take zero l_1@@4) (nil t_2@@15)))
 :qid |stdinbpl.567:11|
 :skolemid |70|
 :pattern ( (nil t_2@@15))
))))
 :qid |stdinbpl.565:19|
 :skolemid |71|
 :pattern ( (take zero l_1@@4))
)))
(assert (forall ((Heap@@3 T@U) (ExhaleHeap@@2 T@U) (Mask@@3 T@U) (o_1@@0 T@U) (f_2 T@U) ) (! (let ((B@@1 (FieldTypeInv1 (type f_2))))
(let ((A@@20 (FieldTypeInv0 (type f_2))))
 (=> (and (and (and (and (and (and (= (type Heap@@3) (MapType0Type RefType)) (= (type ExhaleHeap@@2) (MapType0Type RefType))) (= (type Mask@@3) (MapType1Type RefType realType))) (= (type o_1@@0) RefType)) (= (type f_2) (FieldType A@@20 B@@1))) (IdenticalOnKnownLocations Heap@@3 ExhaleHeap@@2 Mask@@3)) (HasDirectPerm Mask@@3 o_1@@0 f_2)) (= (MapType0Select Heap@@3 o_1@@0 f_2) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2)))))
 :qid |stdinbpl.42:22|
 :skolemid |1|
 :pattern ( (IdenticalOnKnownLocations Heap@@3 ExhaleHeap@@2 Mask@@3) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2))
)))
(assert (forall ((t_2@@16 T@U) (y@@6 T@U) (ys@@1 T@U) ) (!  (=> (and (and (= (type t_2@@16) NaturalDomainTypeType) (= (type y@@6) NaturalDomainTypeType)) (= (type ys@@1) (ListDomainTypeType NaturalDomainTypeType))) (not (= (nil t_2@@16) (cons y@@6 ys@@1))))
 :qid |stdinbpl.463:15|
 :skolemid |53|
 :pattern ( (nil t_2@@16) (cons y@@6 ys@@1))
)))
(assert (forall ((x@@18 T@U) (xs@@3 T@U) (t_2@@17 T@U) ) (!  (=> (and (and (= (type x@@18) NaturalDomainTypeType) (= (type xs@@3) (ListDomainTypeType NaturalDomainTypeType))) (= (type t_2@@17) NaturalDomainTypeType)) (not (= (cons x@@18 xs@@3) (nil t_2@@17))))
 :qid |stdinbpl.457:15|
 :skolemid |52|
 :pattern ( (cons x@@18 xs@@3) (nil t_2@@17))
)))
(assert (forall ((x@@19 T@U) (y@@7 T@U) (ys@@2 T@U) ) (! (let ((A@@21 (type y@@7)))
 (=> (and (= (type x@@19) NaturalDomainTypeType) (= (type ys@@2) (ListDomainTypeType A@@21))) (= (take (successor x@@19) (cons y@@7 ys@@2)) (cons y@@7 (take x@@19 ys@@2)))))
 :qid |stdinbpl.580:19|
 :skolemid |73|
 :pattern ( (successor x@@19) (cons y@@7 (take x@@19 ys@@2)))
 :pattern ( (cons y@@7 ys@@2) (take x@@19 ys@@2))
 :pattern ( (cons y@@7 ys@@2) (cons y@@7 (take x@@19 ys@@2)))
 :pattern ( (take (successor x@@19) (cons y@@7 ys@@2)))
 :pattern ( (cons y@@7 (take x@@19 ys@@2)))
)))
(assert  (and (= (type dummyHeap) (MapType0Type RefType)) (= (type ZeroMask) (MapType1Type RefType realType))))
(assert (state dummyHeap ZeroMask))
(assert (forall ((l_1@@5 T@U) (r_2@@0 T@U) ) (!  (=> (and (= (type l_1@@5) NaturalDomainTypeType) (= (type r_2@@0) NaturalDomainTypeType)) (= (nil l_1@@5) (nil r_2@@0)))
 :qid |stdinbpl.451:15|
 :skolemid |51|
 :pattern ( (nil l_1@@5) (nil r_2@@0))
)))
(assert (forall ((arg0@@53 T@U) (arg1@@23 T@U) ) (! (= (type (count arg0@@53 arg1@@23)) NaturalDomainTypeType)
 :qid |funType:count|
 :pattern ( (count arg0@@53 arg1@@23))
)))
(assert (forall ((x@@20 T@U) (y@@8 T@U) (ys@@3 T@U) ) (!  (=> (and (and (= (type x@@20) NaturalDomainTypeType) (= (type y@@8) NaturalDomainTypeType)) (= (type ys@@3) (ListDomainTypeType NaturalDomainTypeType))) (= (count x@@20 (cons y@@8 ys@@3)) (ite (= x@@20 y@@8) (successor (count x@@20 ys@@3)) (count x@@20 ys@@3))))
 :qid |stdinbpl.592:15|
 :skolemid |75|
 :pattern ( (cons y@@8 ys@@3) (count x@@20 ys@@3))
 :pattern ( (cons y@@8 ys@@3) (successor (count x@@20 ys@@3)))
 :pattern ( (count x@@20 (cons y@@8 ys@@3)))
)))
(assert (= zero zero))
(assert (forall ((p T@U) (v_1 T@U) (w T@U) ) (! (let ((A@@22 (FieldTypeInv0 (type p))))
 (=> (and (and (= (type p) (FieldType A@@22 FrameTypeType)) (= (type v_1) FrameTypeType)) (= (type w) FrameTypeType)) (not (InsidePredicate p v_1 p w))))
 :qid |stdinbpl.170:19|
 :skolemid |21|
 :pattern ( (InsidePredicate p v_1 p w))
)))
(assert (forall ((n_1@@11 T@U) ) (!  (=> (= (type n_1@@11) NaturalDomainTypeType) (not (= zero (successor n_1@@11))))
 :qid |stdinbpl.231:15|
 :skolemid |25|
 :pattern ( (successor n_1@@11))
)))
(assert (forall ((x@@21 T@U) (y@@9 T@U) ) (!  (=> (and (= (type x@@21) NaturalDomainTypeType) (= (type y@@9) NaturalDomainTypeType)) (= (minimum (successor x@@21) (successor y@@9)) (successor (minimum x@@21 y@@9))))
 :qid |stdinbpl.339:15|
 :skolemid |43|
 :pattern ( (successor x@@21) (minimum x@@21 y@@9))
 :pattern ( (successor x@@21) (successor (minimum x@@21 y@@9)))
 :pattern ( (successor y@@9) (minimum x@@21 y@@9))
 :pattern ( (successor y@@9) (successor (minimum x@@21 y@@9)))
 :pattern ( (minimum (successor x@@21) (successor y@@9)))
 :pattern ( (successor (minimum x@@21 y@@9)))
)))
(assert (forall ((x@@22 T@U) (y@@10 T@U) ) (!  (=> (and (= (type x@@22) NaturalDomainTypeType) (= (type y@@10) NaturalDomainTypeType)) (= (maximum (successor x@@22) (successor y@@10)) (successor (maximum x@@22 y@@10))))
 :qid |stdinbpl.357:15|
 :skolemid |46|
 :pattern ( (successor x@@22) (maximum x@@22 y@@10))
 :pattern ( (successor x@@22) (successor (maximum x@@22 y@@10)))
 :pattern ( (successor y@@10) (maximum x@@22 y@@10))
 :pattern ( (successor y@@10) (successor (maximum x@@22 y@@10)))
 :pattern ( (maximum (successor x@@22) (successor y@@10)))
 :pattern ( (successor (maximum x@@22 y@@10)))
)))
(assert (forall ((Heap@@4 T@U) (ExhaleHeap@@3 T@U) (Mask@@4 T@U) ) (!  (=> (and (and (and (= (type Heap@@4) (MapType0Type RefType)) (= (type ExhaleHeap@@3) (MapType0Type RefType))) (= (type Mask@@4) (MapType1Type RefType realType))) (IdenticalOnKnownLocations Heap@@4 ExhaleHeap@@3 Mask@@4)) (succHeap Heap@@4 ExhaleHeap@@3))
 :qid |stdinbpl.83:15|
 :skolemid |10|
 :pattern ( (IdenticalOnKnownLocations Heap@@4 ExhaleHeap@@3 Mask@@4))
)))
(assert (forall ((n_1@@12 T@U) ) (!  (=> (= (type n_1@@12) NaturalDomainTypeType) (not (lessEqual (successor n_1@@12) zero)))
 :qid |stdinbpl.255:15|
 :skolemid |29|
 :pattern ( (lessEqual (successor n_1@@12) zero))
)))
(assert (forall ((ResultMask T@U) (SummandMask1 T@U) (SummandMask2 T@U) (o_2 T@U) (f_4 T@U) ) (! (let ((B@@2 (FieldTypeInv1 (type f_4))))
(let ((A@@23 (FieldTypeInv0 (type f_4))))
 (=> (and (and (and (and (and (= (type ResultMask) (MapType1Type RefType realType)) (= (type SummandMask1) (MapType1Type RefType realType))) (= (type SummandMask2) (MapType1Type RefType realType))) (= (type o_2) RefType)) (= (type f_4) (FieldType A@@23 B@@2))) (sumMask ResultMask SummandMask1 SummandMask2)) (= (U_2_real (MapType1Select ResultMask o_2 f_4)) (+ (U_2_real (MapType1Select SummandMask1 o_2 f_4)) (U_2_real (MapType1Select SummandMask2 o_2 f_4)))))))
 :qid |stdinbpl.138:22|
 :skolemid |18|
 :pattern ( (sumMask ResultMask SummandMask1 SummandMask2) (MapType1Select ResultMask o_2 f_4))
 :pattern ( (sumMask ResultMask SummandMask1 SummandMask2) (MapType1Select SummandMask1 o_2 f_4))
 :pattern ( (sumMask ResultMask SummandMask1 SummandMask2) (MapType1Select SummandMask2 o_2 f_4))
)))
(assert (forall ((n_1@@13 T@U) (x@@23 T@U) (xs@@4 T@U) ) (!  (=> (and (and (= (type n_1@@13) NaturalDomainTypeType) (= (type x@@23) NaturalDomainTypeType)) (= (type xs@@4) (ListDomainTypeType NaturalDomainTypeType))) (= (insertSorting n_1@@13 (cons x@@23 xs@@4)) (ite (lessEqual n_1@@13 x@@23) (cons n_1@@13 (cons x@@23 xs@@4)) (cons x@@23 (insertSorting n_1@@13 xs@@4)))))
 :qid |stdinbpl.658:15|
 :skolemid |86|
 :pattern ( (cons x@@23 xs@@4) (lessEqual n_1@@13 x@@23))
 :pattern ( (cons x@@23 xs@@4) (insertSorting n_1@@13 xs@@4))
 :pattern ( (cons x@@23 xs@@4) (cons x@@23 (insertSorting n_1@@13 xs@@4)))
 :pattern ( (insertSorting n_1@@13 (cons x@@23 xs@@4)))
 :pattern ( (lessEqual n_1@@13 x@@23) (cons x@@23 xs@@4))
 :pattern ( (lessEqual n_1@@13 x@@23) (cons n_1@@13 (cons x@@23 xs@@4)))
 :pattern ( (lessEqual n_1@@13 x@@23) (insertSorting n_1@@13 xs@@4))
 :pattern ( (lessEqual n_1@@13 x@@23) (cons x@@23 (insertSorting n_1@@13 xs@@4)))
 :pattern ( (cons n_1@@13 (cons x@@23 xs@@4)))
 :pattern ( (cons x@@23 (insertSorting n_1@@13 xs@@4)))
)))
(assert (forall ((n_1@@14 T@U) (x@@24 T@U) (xs@@5 T@U) ) (!  (=> (and (and (= (type n_1@@14) NaturalDomainTypeType) (= (type x@@24) NaturalDomainTypeType)) (= (type xs@@5) (ListDomainTypeType NaturalDomainTypeType))) (= (insert n_1@@14 (cons x@@24 xs@@5)) (ite (less n_1@@14 x@@24) (cons n_1@@14 (cons x@@24 xs@@5)) (cons x@@24 (insert n_1@@14 xs@@5)))))
 :qid |stdinbpl.670:15|
 :skolemid |88|
 :pattern ( (cons x@@24 xs@@5) (less n_1@@14 x@@24))
 :pattern ( (cons x@@24 xs@@5) (insert n_1@@14 xs@@5))
 :pattern ( (cons x@@24 xs@@5) (cons x@@24 (insert n_1@@14 xs@@5)))
 :pattern ( (insert n_1@@14 (cons x@@24 xs@@5)))
 :pattern ( (less n_1@@14 x@@24) (cons x@@24 xs@@5))
 :pattern ( (less n_1@@14 x@@24) (cons n_1@@14 (cons x@@24 xs@@5)))
 :pattern ( (less n_1@@14 x@@24) (insert n_1@@14 xs@@5))
 :pattern ( (less n_1@@14 x@@24) (cons x@@24 (insert n_1@@14 xs@@5)))
 :pattern ( (cons n_1@@14 (cons x@@24 xs@@5)))
 :pattern ( (cons x@@24 (insert n_1@@14 xs@@5)))
)))
(assert  (and (forall ((arg0@@54 Real) (arg1@@24 T@U) ) (! (= (type (ConditionalFrame arg0@@54 arg1@@24)) FrameTypeType)
 :qid |funType:ConditionalFrame|
 :pattern ( (ConditionalFrame arg0@@54 arg1@@24))
)) (= (type EmptyFrame) FrameTypeType)))
(assert (forall ((p@@0 Real) (f_6 T@U) ) (!  (=> (= (type f_6) FrameTypeType) (= (ConditionalFrame p@@0 f_6) (ite (> p@@0 0.0) f_6 EmptyFrame)))
 :qid |stdinbpl.158:15|
 :skolemid |19|
 :pattern ( (ConditionalFrame p@@0 f_6))
)))
(assert (forall ((Mask@@5 T@U) (o_2@@0 T@U) (f_4@@0 T@U) ) (! (let ((B@@3 (FieldTypeInv1 (type f_4@@0))))
(let ((A@@24 (FieldTypeInv0 (type f_4@@0))))
 (=> (and (and (= (type Mask@@5) (MapType1Type RefType realType)) (= (type o_2@@0) RefType)) (= (type f_4@@0) (FieldType A@@24 B@@3))) (= (HasDirectPerm Mask@@5 o_2@@0 f_4@@0) (> (U_2_real (MapType1Select Mask@@5 o_2@@0 f_4@@0)) NoPerm)))))
 :qid |stdinbpl.133:22|
 :skolemid |17|
 :pattern ( (HasDirectPerm Mask@@5 o_2@@0 f_4@@0))
)))
(assert (forall ((arg0@@55 T@U) ) (! (= (type (last arg0@@55)) NaturalDomainTypeType)
 :qid |funType:last|
 :pattern ( (last arg0@@55))
)))
(assert (forall ((x@@25 T@U) (t_2@@18 T@U) ) (!  (=> (and (= (type x@@25) NaturalDomainTypeType) (= (type t_2@@18) NaturalDomainTypeType)) (= (last (cons x@@25 (nil t_2@@18))) x@@25))
 :qid |stdinbpl.622:15|
 :skolemid |80|
 :pattern ( (last (cons x@@25 (nil t_2@@18))))
)))
(assert (forall ((t_2@@19 T@U) (ys@@4 T@U) ) (! (let ((A@@25 (type t_2@@19)))
 (=> (= (type ys@@4) (ListDomainTypeType A@@25)) (= (concatenate (nil t_2@@19) ys@@4) ys@@4)))
 :qid |stdinbpl.487:19|
 :skolemid |57|
 :pattern ( (concatenate (nil t_2@@19) ys@@4))
)))
(assert (forall ((o_2@@1 T@U) (f_4@@1 T@U) ) (! (let ((B@@4 (FieldTypeInv1 (type f_4@@1))))
(let ((A@@26 (FieldTypeInv0 (type f_4@@1))))
 (=> (and (= (type o_2@@1) RefType) (= (type f_4@@1) (FieldType A@@26 B@@4))) (= (U_2_real (MapType1Select ZeroMask o_2@@1 f_4@@1)) NoPerm))))
 :qid |stdinbpl.106:22|
 :skolemid |13|
 :pattern ( (MapType1Select ZeroMask o_2@@1 f_4@@1))
)))
(assert (forall ((y@@11 T@U) ) (!  (=> (= (type y@@11) NaturalDomainTypeType) (= (plus zero y@@11) y@@11))
 :qid |stdinbpl.285:15|
 :skolemid |34|
 :pattern ( (plus zero y@@11))
)))
(assert (forall ((y@@12 T@U) ) (!  (=> (= (type y@@12) NaturalDomainTypeType) (= (maximum zero y@@12) y@@12))
 :qid |stdinbpl.345:15|
 :skolemid |44|
 :pattern ( (maximum zero y@@12))
)))
(assert (forall ((xs@@6 T@U) ) (! (let ((A@@27 (ListDomainTypeTypeInv0 (type xs@@6))))
 (=> (= (type xs@@6) (ListDomainTypeType A@@27)) (= (drop zero xs@@6) xs@@6)))
 :qid |stdinbpl.547:19|
 :skolemid |67|
 :pattern ( (drop zero xs@@6))
)))
(assert (forall ((x@@26 T@U) (t_2@@20 T@U) ) (!  (=> (and (= (type x@@26) NaturalDomainTypeType) (= (type t_2@@20) NaturalDomainTypeType)) (= (count x@@26 (nil t_2@@20)) zero))
 :qid |stdinbpl.586:15|
 :skolemid |74|
 :pattern ( (count x@@26 (nil t_2@@20)))
)))
(assert (forall ((n_1@@15 T@U) (l_1@@6 T@U) ) (!  (=> (and (= (type n_1@@15) NaturalDomainTypeType) (= (type l_1@@6) (ListDomainTypeType NaturalDomainTypeType))) (= (hasMultiple (cons n_1@@15 l_1@@6))  (or (less (successor zero) n_1@@15) (hasMultiple l_1@@6))))
 :qid |stdinbpl.718:15|
 :skolemid |96|
 :pattern ( (hasMultiple (cons n_1@@15 l_1@@6)))
 :pattern ( (less (successor zero) n_1@@15) (hasMultiple l_1@@6))
)))
(assert (forall ((t_2@@21 T@U) ) (!  (=> (= (type t_2@@21) NaturalDomainTypeType) (= (last (nil t_2@@21)) zero))
 :qid |stdinbpl.616:15|
 :skolemid |79|
 :pattern ( (last (nil t_2@@21)))
)))
(assert (forall ((t_2@@22 T@U) ) (!  (=> (= (type t_2@@22) NaturalDomainTypeType) (= (sum (nil t_2@@22)) zero))
 :qid |stdinbpl.700:15|
 :skolemid |93|
 :pattern ( (sum (nil t_2@@22)))
)))
(assert (forall ((t_2@@23 T@U) ) (! (= (length (nil t_2@@23)) zero)
 :qid |stdinbpl.523:19|
 :skolemid |63|
 :pattern ( (length (nil t_2@@23)))
)))
(assert (forall ((t_2@@24 T@U) ) (! (= (height (leaf t_2@@24)) zero)
 :qid |stdinbpl.764:19|
 :skolemid |101|
 :pattern ( (height (leaf t_2@@24)))
)))
(assert (forall ((x@@27 T@U) ) (!  (=> (= (type x@@27) NaturalDomainTypeType) (= (minimum x@@27 zero) zero))
 :qid |stdinbpl.333:15|
 :skolemid |42|
 :pattern ( (minimum x@@27 zero))
)))
(assert (forall ((x@@28 T@U) (t_2@@25 T@U) ) (! (let ((A@@28 (type x@@28)))
 (=> (= (type t_2@@25) A@@28) (= (butLast (cons x@@28 (nil t_2@@25))) (nil t_2@@25))))
 :qid |stdinbpl.604:19|
 :skolemid |77|
 :pattern ( (butLast (cons x@@28 (nil t_2@@25))))
)))
(assert (forall ((n_1@@16 T@U) ) (!  (=> (= (type n_1@@16) NaturalDomainTypeType) (lessEqual zero n_1@@16))
 :qid |stdinbpl.249:15|
 :skolemid |28|
 :pattern ( (lessEqual zero n_1@@16))
)))
(assert (forall ((x@@29 T@U) (y@@13 T@U) ) (!  (=> (and (= (type x@@29) NaturalDomainTypeType) (= (type y@@13) NaturalDomainTypeType)) (= (times (successor x@@29) y@@13) (plus y@@13 (times x@@29 y@@13))))
 :qid |stdinbpl.321:15|
 :skolemid |40|
 :pattern ( (successor x@@29) (times x@@29 y@@13))
 :pattern ( (successor x@@29) (plus y@@13 (times x@@29 y@@13)))
 :pattern ( (times (successor x@@29) y@@13))
 :pattern ( (plus y@@13 (times x@@29 y@@13)))
)))
(assert (forall ((x@@30 T@U) (n_1@@17 T@U) (l_1@@7 T@U) ) (!  (=> (and (and (= (type x@@30) NaturalDomainTypeType) (= (type n_1@@17) NaturalDomainTypeType)) (= (type l_1@@7) (ListDomainTypeType NaturalDomainTypeType))) (= (last (cons x@@30 (cons n_1@@17 l_1@@7))) (last (cons n_1@@17 l_1@@7))))
 :qid |stdinbpl.628:15|
 :skolemid |81|
 :pattern ( (last (cons x@@30 (cons n_1@@17 l_1@@7))))
)))
(assert (forall ((Heap@@5 T@U) (ExhaleHeap@@4 T@U) (Mask@@6 T@U) (pm_f@@1 T@U) ) (! (let ((C@@1 (FieldTypeInv0 (type pm_f@@1))))
 (=> (and (and (and (and (and (= (type Heap@@5) (MapType0Type RefType)) (= (type ExhaleHeap@@4) (MapType0Type RefType))) (= (type Mask@@6) (MapType1Type RefType realType))) (= (type pm_f@@1) (FieldType C@@1 FrameTypeType))) (IdenticalOnKnownLocations Heap@@5 ExhaleHeap@@4 Mask@@6)) (and (HasDirectPerm Mask@@6 null pm_f@@1) (IsPredicateField pm_f@@1))) (forall ((o2 T@U) (f_2@@0 T@U) ) (! (let ((B@@5 (FieldTypeInv1 (type f_2@@0))))
(let ((A@@29 (FieldTypeInv0 (type f_2@@0))))
 (=> (and (and (= (type o2) RefType) (= (type f_2@@0) (FieldType A@@29 B@@5))) (U_2_bool (MapType1Select (MapType0Select Heap@@5 null (PredicateMaskField pm_f@@1)) o2 f_2@@0))) (= (MapType0Select Heap@@5 o2 f_2@@0) (MapType0Select ExhaleHeap@@4 o2 f_2@@0)))))
 :qid |stdinbpl.54:134|
 :skolemid |3|
 :pattern ( (MapType0Select ExhaleHeap@@4 o2 f_2@@0))
))))
 :qid |stdinbpl.52:19|
 :skolemid |4|
 :pattern ( (IdenticalOnKnownLocations Heap@@5 ExhaleHeap@@4 Mask@@6) (IsPredicateField pm_f@@1))
)))
(assert (forall ((Heap@@6 T@U) (ExhaleHeap@@5 T@U) (Mask@@7 T@U) (pm_f@@2 T@U) ) (! (let ((C@@2 (FieldTypeInv0 (type pm_f@@2))))
 (=> (and (and (and (and (and (= (type Heap@@6) (MapType0Type RefType)) (= (type ExhaleHeap@@5) (MapType0Type RefType))) (= (type Mask@@7) (MapType1Type RefType realType))) (= (type pm_f@@2) (FieldType C@@2 FrameTypeType))) (IdenticalOnKnownLocations Heap@@6 ExhaleHeap@@5 Mask@@7)) (and (HasDirectPerm Mask@@7 null pm_f@@2) (IsWandField pm_f@@2))) (forall ((o2@@0 T@U) (f_2@@1 T@U) ) (! (let ((B@@6 (FieldTypeInv1 (type f_2@@1))))
(let ((A@@30 (FieldTypeInv0 (type f_2@@1))))
 (=> (and (and (= (type o2@@0) RefType) (= (type f_2@@1) (FieldType A@@30 B@@6))) (U_2_bool (MapType1Select (MapType0Select Heap@@6 null (WandMaskField pm_f@@2)) o2@@0 f_2@@1))) (= (MapType0Select Heap@@6 o2@@0 f_2@@1) (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1)))))
 :qid |stdinbpl.67:129|
 :skolemid |6|
 :pattern ( (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1))
))))
 :qid |stdinbpl.65:19|
 :skolemid |7|
 :pattern ( (IdenticalOnKnownLocations Heap@@6 ExhaleHeap@@5 Mask@@7) (IsWandField pm_f@@2))
)))
(assert (forall ((Mask@@8 T@U) (o_2@@2 T@U) (f_4@@2 T@U) ) (! (let ((B@@7 (FieldTypeInv1 (type f_4@@2))))
(let ((A@@31 (FieldTypeInv0 (type f_4@@2))))
 (=> (and (and (and (= (type Mask@@8) (MapType1Type RefType realType)) (= (type o_2@@2) RefType)) (= (type f_4@@2) (FieldType A@@31 B@@7))) (GoodMask Mask@@8)) (and (>= (U_2_real (MapType1Select Mask@@8 o_2@@2 f_4@@2)) NoPerm) (=> (and (and (GoodMask Mask@@8) (not (IsPredicateField f_4@@2))) (not (IsWandField f_4@@2))) (<= (U_2_real (MapType1Select Mask@@8 o_2@@2 f_4@@2)) FullPerm))))))
 :qid |stdinbpl.128:22|
 :skolemid |16|
 :pattern ( (GoodMask Mask@@8) (MapType1Select Mask@@8 o_2@@2 f_4@@2))
)))
(assert (forall ((x@@31 T@U) (xs@@7 T@U) (y@@14 T@U) (ys@@5 T@U) ) (!  (=> (and (and (and (= (type x@@31) NaturalDomainTypeType) (= (type xs@@7) (ListDomainTypeType NaturalDomainTypeType))) (= (type y@@14) NaturalDomainTypeType)) (= (type ys@@5) (ListDomainTypeType NaturalDomainTypeType))) (= (= (cons x@@31 xs@@7) (cons y@@14 ys@@5))  (and (= x@@31 y@@14) (= xs@@7 ys@@5))))
 :qid |stdinbpl.469:15|
 :skolemid |54|
 :pattern ( (cons x@@31 xs@@7) (cons y@@14 ys@@5))
)))
(assert (forall ((x@@32 T@U) (y@@15 T@U) ) (!  (=> (and (= (type x@@32) NaturalDomainTypeType) (= (type y@@15) NaturalDomainTypeType)) (= (plus (successor x@@32) y@@15) (successor (plus x@@32 y@@15))))
 :qid |stdinbpl.291:15|
 :skolemid |35|
 :pattern ( (successor x@@32) (plus x@@32 y@@15))
 :pattern ( (successor x@@32) (successor (plus x@@32 y@@15)))
 :pattern ( (plus (successor x@@32) y@@15))
 :pattern ( (successor (plus x@@32 y@@15)))
)))
(assert (forall ((x@@33 T@U) (y@@16 T@U) ) (!  (=> (and (= (type x@@33) NaturalDomainTypeType) (= (type y@@16) NaturalDomainTypeType)) (= (= (successor x@@33) (successor y@@16)) (= x@@33 y@@16)))
 :qid |stdinbpl.243:15|
 :skolemid |27|
 :pattern ( (successor x@@33) (successor y@@16))
)))
(assert (forall ((n_1@@18 T@U) ) (!  (=> (= (type n_1@@18) NaturalDomainTypeType) (not (less n_1@@18 zero)))
 :qid |stdinbpl.267:15|
 :skolemid |31|
 :pattern ( (less n_1@@18 zero))
)))
(assert (forall ((o T@U) (f T@U) (Heap@@7 T@U) ) (!  (=> (and (and (and (= (type o) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap@@7) (MapType0Type RefType))) (U_2_bool (MapType0Select Heap@@7 o $allocated))) (U_2_bool (MapType0Select Heap@@7 (MapType0Select Heap@@7 o f) $allocated)))
 :qid |stdinbpl.31:15|
 :skolemid |0|
 :pattern ( (MapType0Select Heap@@7 o f))
)))
(assert (forall ((l_1@@8 T@U) (x@@34 T@U) (r_2@@1 T@U) ) (! (let ((A@@32 (type x@@34)))
 (=> (and (= (type l_1@@8) (TreeDomainTypeType A@@32)) (= (type r_2@@1) (TreeDomainTypeType A@@32))) (= (mirror (node l_1@@8 x@@34 r_2@@1)) (node (mirror r_2@@1) x@@34 (mirror l_1@@8)))))
 :qid |stdinbpl.782:19|
 :skolemid |104|
 :pattern ( (mirror (node l_1@@8 x@@34 r_2@@1)))
 :pattern ( (node (mirror r_2@@1) x@@34 (mirror l_1@@8)))
)))
(assert (forall ((n_1@@19 T@U) (x@@35 T@U) (xs@@8 T@U) ) (!  (=> (and (and (= (type n_1@@19) NaturalDomainTypeType) (= (type x@@35) NaturalDomainTypeType)) (= (type xs@@8) (ListDomainTypeType NaturalDomainTypeType))) (= (delete n_1@@19 (cons x@@35 xs@@8)) (ite (= n_1@@19 x@@35) (delete n_1@@19 xs@@8) (cons x@@35 (delete n_1@@19 xs@@8)))))
 :qid |stdinbpl.517:15|
 :skolemid |62|
 :pattern ( (cons x@@35 xs@@8) (delete n_1@@19 xs@@8))
 :pattern ( (cons x@@35 xs@@8) (cons x@@35 (delete n_1@@19 xs@@8)))
 :pattern ( (delete n_1@@19 (cons x@@35 xs@@8)))
 :pattern ( (cons x@@35 (delete n_1@@19 xs@@8)))
)))
(assert (forall ((n_1@@20 T@U) (x@@36 T@U) (xs@@9 T@U) ) (!  (=> (and (and (= (type n_1@@20) NaturalDomainTypeType) (= (type x@@36) NaturalDomainTypeType)) (= (type xs@@9) (ListDomainTypeType NaturalDomainTypeType))) (= (insertUnlessPresent n_1@@20 (cons x@@36 xs@@9)) (ite (= n_1@@20 x@@36) (cons x@@36 xs@@9) (cons x@@36 (insertUnlessPresent n_1@@20 xs@@9)))))
 :qid |stdinbpl.682:15|
 :skolemid |90|
 :pattern ( (cons x@@36 xs@@9) (insertUnlessPresent n_1@@20 xs@@9))
 :pattern ( (cons x@@36 xs@@9) (cons x@@36 (insertUnlessPresent n_1@@20 xs@@9)))
 :pattern ( (insertUnlessPresent n_1@@20 (cons x@@36 xs@@9)))
 :pattern ( (cons x@@36 (insertUnlessPresent n_1@@20 xs@@9)))
)))
(assert (forall ((n_1@@21 T@U) ) (!  (=> (= (type n_1@@21) NaturalDomainTypeType) (less zero (successor n_1@@21)))
 :qid |stdinbpl.273:15|
 :skolemid |32|
 :pattern ( (less zero (successor n_1@@21)))
)))
(assert (forall ((x@@37 T@U) (xs@@10 T@U) (t_2@@26 T@U) ) (! (let ((A@@33 (type x@@37)))
 (=> (and (= (type xs@@10) (ListDomainTypeType A@@33)) (= (type t_2@@26) A@@33)) (= (reverse (cons x@@37 xs@@10)) (concatenate (reverse xs@@10) (cons x@@37 (nil t_2@@26))))))
 :qid |stdinbpl.505:19|
 :skolemid |60|
 :pattern ( (cons x@@37 xs@@10) (concatenate (reverse xs@@10) (cons x@@37 (nil t_2@@26))))
 :pattern ( (reverse (cons x@@37 xs@@10)) (nil t_2@@26))
 :pattern ( (reverse (cons x@@37 xs@@10)) (cons x@@37 (nil t_2@@26)))
 :pattern ( (reverse (cons x@@37 xs@@10)) (concatenate (reverse xs@@10) (cons x@@37 (nil t_2@@26))))
 :pattern ( (concatenate (reverse xs@@10) (cons x@@37 (nil t_2@@26))))
)))
(assert (forall ((Heap@@8 T@U) (o@@0 T@U) (f_3 T@U) (v T@U) ) (! (let ((B@@8 (type v)))
(let ((A@@34 (FieldTypeInv0 (type f_3))))
 (=> (and (and (= (type Heap@@8) (MapType0Type RefType)) (= (type o@@0) RefType)) (= (type f_3) (FieldType A@@34 B@@8))) (succHeap Heap@@8 (MapType0Store Heap@@8 o@@0 f_3 v)))))
 :qid |stdinbpl.78:22|
 :skolemid |9|
 :pattern ( (MapType0Store Heap@@8 o@@0 f_3 v))
)))
(assert (= (type ZeroPMask) (MapType1Type RefType boolType)))
(assert (forall ((o_2@@3 T@U) (f_4@@3 T@U) ) (! (let ((B@@9 (FieldTypeInv1 (type f_4@@3))))
(let ((A@@35 (FieldTypeInv0 (type f_4@@3))))
 (=> (and (= (type o_2@@3) RefType) (= (type f_4@@3) (FieldType A@@35 B@@9))) (not (U_2_bool (MapType1Select ZeroPMask o_2@@3 f_4@@3))))))
 :qid |stdinbpl.112:22|
 :skolemid |14|
 :pattern ( (MapType1Select ZeroPMask o_2@@3 f_4@@3))
)))
(assert (forall ((n_1@@22 T@U) (x@@38 T@U) (xs@@11 T@U) ) (!  (=> (and (and (= (type n_1@@22) NaturalDomainTypeType) (= (type x@@38) NaturalDomainTypeType)) (= (type xs@@11) (ListDomainTypeType NaturalDomainTypeType))) (= (element n_1@@22 (cons x@@38 xs@@11))  (or (= n_1@@22 x@@38) (element n_1@@22 xs@@11))))
 :qid |stdinbpl.541:15|
 :skolemid |66|
 :pattern ( (cons x@@38 xs@@11) (element n_1@@22 xs@@11))
 :pattern ( (element n_1@@22 (cons x@@38 xs@@11)))
)))
(assert (forall ((p@@1 T@U) (v_1@@0 T@U) (q T@U) (w@@0 T@U) (r T@U) (u T@U) ) (! (let ((C@@3 (FieldTypeInv0 (type r))))
(let ((B@@10 (FieldTypeInv0 (type q))))
(let ((A@@36 (FieldTypeInv0 (type p@@1))))
 (=> (and (and (and (and (and (and (= (type p@@1) (FieldType A@@36 FrameTypeType)) (= (type v_1@@0) FrameTypeType)) (= (type q) (FieldType B@@10 FrameTypeType))) (= (type w@@0) FrameTypeType)) (= (type r) (FieldType C@@3 FrameTypeType))) (= (type u) FrameTypeType)) (and (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))) (InsidePredicate p@@1 v_1@@0 r u)))))
 :qid |stdinbpl.165:25|
 :skolemid |20|
 :pattern ( (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))
)))
(assert (forall ((x@@39 T@U) ) (!  (=> (= (type x@@39) NaturalDomainTypeType) (= (minus x@@39 zero) x@@39))
 :qid |stdinbpl.303:15|
 :skolemid |37|
 :pattern ( (minus x@@39 zero))
)))
(assert (forall ((x@@40 T@U) ) (!  (=> (= (type x@@40) NaturalDomainTypeType) (= (maximum x@@40 zero) x@@40))
 :qid |stdinbpl.351:15|
 :skolemid |45|
 :pattern ( (maximum x@@40 zero))
)))
(assert (forall ((t_2@@27 T@U) ) (! (let ((A@@37 (TreeDomainTypeTypeInv0 (type t_2@@27))))
 (=> (= (type t_2@@27) (TreeDomainTypeType A@@37)) (= (isLeafOrNode t_2@@27)  (or (exists ((a_2 T@U) ) (!  (and (= (type a_2) A@@37) (= t_2@@27 (leaf a_2)))
 :qid |stdinbpl.754:41|
 :skolemid |98|
 :pattern ( (leaf a_2))
)) (exists ((l_1@@9 T@U) (e_1@@3 T@U) (r_2@@2 T@U) ) (!  (and (and (and (= (type l_1@@9) (TreeDomainTypeType A@@37)) (= (type e_1@@3) A@@37)) (= (type r_2@@2) (TreeDomainTypeType A@@37))) (= t_2@@27 (node l_1@@9 e_1@@3 r_2@@2)))
 :qid |stdinbpl.757:16|
 :skolemid |99|
 :pattern ( (node l_1@@9 e_1@@3 r_2@@2))
))))))
 :qid |stdinbpl.752:19|
 :skolemid |100|
 :pattern ( (isLeafOrNode t_2@@27))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
(assert (forall ((l_1@@10 T@U) ) (! (let ((A@@38 (ListDomainTypeTypeInv0 (type l_1@@10))))
 (=> (= (type l_1@@10) (ListDomainTypeType A@@38)) (= (isNilOrCons l_1@@10)  (or (exists ((t_2@@28 T@U) ) (!  (and (= (type t_2@@28) A@@38) (= l_1@@10 (nil t_2@@28)))
 :qid |stdinbpl.441:40|
 :skolemid |48|
 :pattern ( (nil t_2@@28))
)) (exists ((e_1@@4 T@U) (r_2@@3 T@U) ) (!  (and (and (= (type e_1@@4) A@@38) (= (type r_2@@3) (ListDomainTypeType A@@38))) (= l_1@@10 (cons e_1@@4 r_2@@3)))
 :qid |stdinbpl.444:16|
 :skolemid |49|
 :pattern ( (cons e_1@@4 r_2@@3))
))))))
 :qid |stdinbpl.439:19|
 :skolemid |50|
 :pattern ( (isNilOrCons l_1@@10))
)))
(assert (forall ((n_1@@23 T@U) ) (!  (=> (= (type n_1@@23) NaturalDomainTypeType) (not (= (successor n_1@@23) zero)))
 :qid |stdinbpl.237:15|
 :skolemid |26|
 :pattern ( (successor n_1@@23))
)))
(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun e_0 () T@U)
(declare-fun l_0 () T@U)
(declare-fun PostHeap@0 () T@U)
(declare-fun n_5_2 () T@U)
(declare-fun e_0_2 () T@U)
(declare-fun l_0_2 () T@U)
(declare-fun n_3_2 () T@U)
(declare-fun t_0_2 () T@U)
(declare-fun Heap@@9 () T@U)
(assert  (and (and (and (and (and (and (and (and (= (type n_3_2) NaturalDomainTypeType) (= (type t_0_2) NaturalDomainTypeType)) (= (type l_0_2) (ListDomainTypeType NaturalDomainTypeType))) (= (type e_0_2) NaturalDomainTypeType)) (= (type n_5_2) NaturalDomainTypeType)) (= (type l_0) (ListDomainTypeType NaturalDomainTypeType))) (= (type e_0) NaturalDomainTypeType)) (= (type PostHeap@0) (MapType0Type RefType))) (= (type Heap@@9) (MapType0Type RefType))))
(set-info :boogie-vc-id property01)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 38) (let ((anon50_Then_correct true))
(let ((anon18_correct true))
(let ((anon49_Then_correct  (=> (isZeroOrSuccessor e_0) (and (=> (= (ControlFlow 0 32) 31) anon50_Then_correct) (=> (= (ControlFlow 0 32) 29) anon18_correct)))))
(let ((anon49_Else_correct  (=> (and (not (isZeroOrSuccessor e_0)) (= (ControlFlow 0 30) 29)) anon18_correct)))
(let ((anon46_Then_correct true))
(let ((anon19_correct true))
(let ((anon47_Then_correct  (=> (forall ((n_4_1 T@U) ) (!  (=> (= (type n_4_1) NaturalDomainTypeType) (= (concatenate (take n_4_1 l_0) (drop n_4_1 l_0)) l_0))
 :qid |stdinbpl.868:25|
 :skolemid |108|
 :pattern ( (concatenate (take n_4_1 l_0) (drop n_4_1 l_0)))
)) (and (and (=> (= (ControlFlow 0 33) 25) anon19_correct) (=> (= (ControlFlow 0 33) 32) anon49_Then_correct)) (=> (= (ControlFlow 0 33) 30) anon49_Else_correct)))))
(let ((anon47_Else_correct  (=> (and (not (forall ((n_4_1@@0 T@U) ) (!  (=> (= (type n_4_1@@0) NaturalDomainTypeType) (= (concatenate (take n_4_1@@0 l_0) (drop n_4_1@@0 l_0)) l_0))
 :qid |stdinbpl.868:25|
 :skolemid |108|
 :pattern ( (concatenate (take n_4_1@@0 l_0) (drop n_4_1@@0 l_0)))
))) (= (ControlFlow 0 28) 25)) anon19_correct)))
(let ((anon45_Then_correct  (=> (isNilOrCons l_0) (and (and (=> (= (ControlFlow 0 34) 27) anon46_Then_correct) (=> (= (ControlFlow 0 34) 33) anon47_Then_correct)) (=> (= (ControlFlow 0 34) 28) anon47_Else_correct)))))
(let ((anon45_Else_correct  (=> (and (not (isNilOrCons l_0)) (= (ControlFlow 0 26) 25)) anon19_correct)))
(let ((anon44_Else_correct true))
(let ((anon42_Else_correct  (=> (forall ((t_0_1 T@U) ) (!  (=> (= (type t_0_1) NaturalDomainTypeType) (forall ((n_3_1 T@U) ) (!  (=> (= (type n_3_1) NaturalDomainTypeType) (= (concatenate (take n_3_1 (nil t_0_1)) (drop n_3_1 (nil t_0_1))) (nil t_0_1)))
 :qid |stdinbpl.856:17|
 :skolemid |106|
 :pattern ( (concatenate (take n_3_1 (nil t_0_1)) (drop n_3_1 (nil t_0_1))))
)))
 :qid |stdinbpl.854:22|
 :skolemid |107|
 :pattern ( (nil t_0_1))
)) (and (and (=> (= (ControlFlow 0 35) 24) anon44_Else_correct) (=> (= (ControlFlow 0 35) 34) anon45_Then_correct)) (=> (= (ControlFlow 0 35) 26) anon45_Else_correct)))))
(let ((anon41_Else_correct true))
(let ((anon41_Then_correct true))
(let ((anon43_Else_correct true))
(let ((anon43_Then_correct true))
(let ((anon39_Then_correct  (=> (state PostHeap@0 ZeroMask) (and (and (and (and (=> (= (ControlFlow 0 36) 35) anon42_Else_correct) (=> (= (ControlFlow 0 36) 20) anon43_Then_correct)) (=> (= (ControlFlow 0 36) 21) anon43_Else_correct)) (=> (= (ControlFlow 0 36) 22) anon41_Then_correct)) (=> (= (ControlFlow 0 36) 23) anon41_Else_correct)))))
(let ((anon33_correct true))
(let ((anon59_Else_correct  (=> (and (not (isZeroOrSuccessor n_5_2)) (= (ControlFlow 0 15) 12)) anon33_correct)))
(let ((anon59_Then_correct  (=> (isZeroOrSuccessor n_5_2) (and (=> (= (ControlFlow 0 13) (- 0 14)) (= (concatenate (take n_5_2 (cons e_0_2 l_0_2)) (drop n_5_2 (cons e_0_2 l_0_2))) (cons e_0_2 l_0_2))) (=> (= (concatenate (take n_5_2 (cons e_0_2 l_0_2)) (drop n_5_2 (cons e_0_2 l_0_2))) (cons e_0_2 l_0_2)) (=> (= (ControlFlow 0 13) 12) anon33_correct))))))
(let ((anon35_correct true))
(let ((anon58_Else_correct  (=> (and (forall ((n_5_3_1 T@U) ) (!  (=> (and (= (type n_5_3_1) NaturalDomainTypeType) (isZeroOrSuccessor n_5_3_1)) (= (concatenate (take n_5_3_1 (cons e_0_2 l_0_2)) (drop n_5_3_1 (cons e_0_2 l_0_2))) (cons e_0_2 l_0_2)))
 :qid |stdinbpl.939:30|
 :skolemid |117|
 :pattern ( (isZeroOrSuccessor n_5_3_1))
 :pattern ( (concatenate (take n_5_3_1 (cons e_0_2 l_0_2)) (drop n_5_3_1 (cons e_0_2 l_0_2))))
)) (= (ControlFlow 0 11) 9)) anon35_correct)))
(let ((anon57_Then_correct  (=> (isZeroOrSuccessor e_0_2) (and (and (=> (= (ControlFlow 0 16) 11) anon58_Else_correct) (=> (= (ControlFlow 0 16) 13) anon59_Then_correct)) (=> (= (ControlFlow 0 16) 15) anon59_Else_correct)))))
(let ((anon57_Else_correct  (=> (and (not (isZeroOrSuccessor e_0_2)) (= (ControlFlow 0 10) 9)) anon35_correct)))
(let ((anon37_correct true))
(let ((anon56_Else_correct  (=> (and (forall ((e_0_3_1 T@U) ) (!  (=> (and (= (type e_0_3_1) NaturalDomainTypeType) (isZeroOrSuccessor e_0_3_1)) (forall ((n_5_4 T@U) ) (!  (=> (and (= (type n_5_4) NaturalDomainTypeType) (isZeroOrSuccessor n_5_4)) (= (concatenate (take n_5_4 (cons e_0_3_1 l_0_2)) (drop n_5_4 (cons e_0_3_1 l_0_2))) (cons e_0_3_1 l_0_2)))
 :qid |stdinbpl.948:60|
 :skolemid |118|
 :pattern ( (isZeroOrSuccessor n_5_4))
 :pattern ( (concatenate (take n_5_4 (cons e_0_3_1 l_0_2)) (drop n_5_4 (cons e_0_3_1 l_0_2))))
)))
 :qid |stdinbpl.946:26|
 :skolemid |119|
 :pattern ( (isZeroOrSuccessor e_0_3_1))
 :pattern ( (cons e_0_3_1 l_0_2))
)) (= (ControlFlow 0 8) 5)) anon37_correct)))
(let ((anon55_Then_correct  (=> (forall ((n_4_3 T@U) ) (!  (=> (= (type n_4_3) NaturalDomainTypeType) (= (concatenate (take n_4_3 l_0_2) (drop n_4_3 l_0_2)) l_0_2))
 :qid |stdinbpl.926:21|
 :skolemid |116|
 :pattern ( (concatenate (take n_4_3 l_0_2) (drop n_4_3 l_0_2)))
)) (and (and (=> (= (ControlFlow 0 17) 8) anon56_Else_correct) (=> (= (ControlFlow 0 17) 16) anon57_Then_correct)) (=> (= (ControlFlow 0 17) 10) anon57_Else_correct)))))
(let ((anon55_Else_correct  (=> (and (not (forall ((n_4_3@@0 T@U) ) (!  (=> (= (type n_4_3@@0) NaturalDomainTypeType) (= (concatenate (take n_4_3@@0 l_0_2) (drop n_4_3@@0 l_0_2)) l_0_2))
 :qid |stdinbpl.926:21|
 :skolemid |116|
 :pattern ( (concatenate (take n_4_3@@0 l_0_2) (drop n_4_3@@0 l_0_2)))
))) (= (ControlFlow 0 7) 5)) anon37_correct)))
(let ((anon54_Then_correct  (=> (isNilOrCons l_0_2) (and (=> (= (ControlFlow 0 18) 17) anon55_Then_correct) (=> (= (ControlFlow 0 18) 7) anon55_Else_correct)))))
(let ((anon54_Else_correct  (=> (and (not (isNilOrCons l_0_2)) (= (ControlFlow 0 6) 5)) anon37_correct)))
(let ((anon53_Else_correct true))
(let ((anon51_Else_correct  (=> (forall ((t_0_3_1 T@U) ) (!  (=> (= (type t_0_3_1) NaturalDomainTypeType) (forall ((n_3_4 T@U) ) (!  (=> (= (type n_3_4) NaturalDomainTypeType) (= (concatenate (take n_3_4 (nil t_0_3_1)) (drop n_3_4 (nil t_0_3_1))) (nil t_0_3_1)))
 :qid |stdinbpl.919:15|
 :skolemid |114|
 :pattern ( (concatenate (take n_3_4 (nil t_0_3_1)) (drop n_3_4 (nil t_0_3_1))))
)))
 :qid |stdinbpl.917:20|
 :skolemid |115|
 :pattern ( (nil t_0_3_1))
)) (and (and (=> (= (ControlFlow 0 19) 4) anon53_Else_correct) (=> (= (ControlFlow 0 19) 18) anon54_Then_correct)) (=> (= (ControlFlow 0 19) 6) anon54_Else_correct)))))
(let ((anon52_Else_correct true))
(let ((anon52_Then_correct  (=> (= (ControlFlow 0 2) (- 0 1)) (= (concatenate (take n_3_2 (nil t_0_2)) (drop n_3_2 (nil t_0_2))) (nil t_0_2)))))
(let ((anon0_correct  (=> (state Heap@@9 ZeroMask) (and (and (and (=> (= (ControlFlow 0 37) 36) anon39_Then_correct) (=> (= (ControlFlow 0 37) 19) anon51_Else_correct)) (=> (= (ControlFlow 0 37) 2) anon52_Then_correct)) (=> (= (ControlFlow 0 37) 3) anon52_Else_correct)))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 38) 37) anon0_correct)))
PreconditionGeneratedEntry_correct)))))))))))))))))))))))))))))))))))))
))
(check-sat)
(pop 1)
; Valid
(get-info :rlimit)
