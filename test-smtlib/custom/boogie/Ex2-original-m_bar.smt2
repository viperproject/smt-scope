(set-option :print-success false)
(set-info :smt-lib-version 2.6)
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
(declare-fun tuple_0 () T@U)
(declare-fun tuple_1 () T@U)
(declare-fun val_bool () T@U)
(declare-fun val_int () T@U)
(declare-fun val_ref () T@U)
(declare-fun FieldType (T@T T@T) T@T)
(declare-fun FieldTypeInv0 (T@T) T@T)
(declare-fun FieldTypeInv1 (T@T) T@T)
(declare-fun NormalFieldType () T@T)
(declare-fun RefType () T@T)
(declare-fun |Seq#Length| (T@U) Int)
(declare-fun |Seq#Drop| (T@U Int) T@U)
(declare-fun SeqTypeInv0 (T@T) T@T)
(declare-fun SeqType (T@T) T@T)
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
(declare-fun |lookup_pure__$TY$__Array$3$usize$usize$Array$3$usize$$int$$$int$'| (T@U T@U Int) Int)
(declare-fun dummyFunction (T@U) Bool)
(declare-fun |lookup_pure__$TY$__Array$3$usize$usize$Array$3$usize$$int$$$int$#triggerStateless| (T@U Int) Int)
(declare-fun |seq_collect$Array$3$usize$__$TY$__Array$3$usize$$int$$Seq$$int$'| (T@U T@U Int) T@U)
(declare-fun |seq_collect$Array$3$usize$__$TY$__Array$3$usize$$int$$Seq$$int$#triggerStateless| (T@U Int) T@U)
(declare-fun snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize (T@U T@U) T@U)
(declare-fun AssumeFunctionsAbove () Int)
(declare-fun cons$Snap$Array$3$usize$__$TY$__Seq$$int$$Snap$Array$3$usize (T@U) T@U)
(declare-fun seq_collect$Array$3$usize$__$TY$__Array$3$usize$$int$$Seq$$int$ (T@U T@U Int) T@U)
(declare-fun Snap$Array$3$usizeDomainTypeType () T@T)
(declare-fun |Seq#Index| (T@U Int) T@U)
(declare-fun |Seq#Sub| (Int Int) Int)
(declare-fun |Seq#Add| (Int Int) Int)
(declare-fun IdenticalOnKnownLocations (T@U T@U T@U) Bool)
(declare-fun IsPredicateField (T@U) Bool)
(declare-fun null () T@U)
(declare-fun PredicateMaskField (T@U) T@U)
(declare-fun FrameTypeType () T@T)
(declare-fun HasDirectPerm (T@U T@U T@U) Bool)
(declare-fun IsWandField (T@U) Bool)
(declare-fun WandMaskField (T@U) T@U)
(declare-fun Array$3$usize (T@U) T@U)
(declare-fun PredicateType_Array$3$usizeType () T@T)
(declare-fun DeadBorrowToken$ (Int) T@U)
(declare-fun PredicateType_DeadBorrowToken$Type () T@T)
(declare-fun tuple0$ (T@U) T@U)
(declare-fun PredicateType_tuple0$Type () T@T)
(declare-fun usize (T@U) T@U)
(declare-fun PredicateType_usizeType () T@T)
(declare-fun |snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize'| (T@U T@U) T@U)
(declare-fun |snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize#triggerStateless| (T@U) T@U)
(declare-fun |Array$3$usize#trigger| (T@U T@U) Bool)
(declare-fun |Array$3$usize#everUsed| (T@U) Bool)
(declare-fun |DeadBorrowToken$#trigger| (T@U T@U) Bool)
(declare-fun |DeadBorrowToken$#everUsed| (T@U) Bool)
(declare-fun |tuple0$#trigger| (T@U T@U) Bool)
(declare-fun |tuple0$#everUsed| (T@U) Bool)
(declare-fun |usize#trigger| (T@U T@U) Bool)
(declare-fun |usize#everUsed| (T@U) Bool)
(declare-fun |Seq#Update| (T@U Int T@U) T@U)
(declare-fun |snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize#trigger| (T@U T@U) Bool)
(declare-fun ConditionalFrame (Real T@U) T@U)
(declare-fun read$ (T@U) Real)
(declare-fun read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$ (T@U Int) Int)
(declare-fun |lookup_pure__$TY$__Array$3$usize$usize$Array$3$usize$$int$$$int$#frame| (T@U T@U Int) Int)
(declare-fun lookup_pure__$TY$__Array$3$usize$usize$Array$3$usize$$int$$$int$ (T@U T@U Int) Int)
(declare-fun |Seq#Take| (T@U Int) T@U)
(declare-fun |read$'| (T@U) Real)
(declare-fun |read$#trigger| (T@U) Bool)
(declare-fun EmptyFrame () T@U)
(declare-fun FullPerm () Real)
(declare-fun |Seq#Contains| (T@U T@U) Bool)
(declare-fun |Seq#Range| (Int Int) T@U)
(declare-fun NoPerm () Real)
(declare-fun |Seq#Skolem| (T@U T@U) Int)
(declare-fun IdenticalOnKnownLocationsLiberal (T@U T@U T@U) Bool)
(declare-fun |seq_collect$Array$3$usize$__$TY$__Array$3$usize$$int$$Seq$$int$#trigger| (T@U T@U Int) Bool)
(declare-fun |Seq#Equal| (T@U T@U) Bool)
(declare-fun |Seq#Empty| (T@T) T@U)
(declare-fun |Seq#Singleton| (T@U) T@U)
(declare-fun |Array$3$usize#sm| (T@U) T@U)
(declare-fun |DeadBorrowToken$#sm| (Int) T@U)
(declare-fun |tuple0$#sm| (T@U) T@U)
(declare-fun |usize#sm| (T@U) T@U)
(declare-fun uncons$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$Seq$$int$ (T@U) T@U)
(declare-fun dummyHeap () T@U)
(declare-fun ZeroMask () T@U)
(declare-fun InsidePredicate (T@U T@U T@U T@U) Bool)
(declare-fun |Seq#Append| (T@U T@U) T@U)
(declare-fun sumMask (T@U T@U T@U) Bool)
(declare-fun |read$#triggerStateless| () Real)
(declare-fun SumHeap (T@U T@U T@U T@U T@U) Bool)
(declare-fun |Seq#ContainsTrigger| (T@U T@U) Bool)
(declare-fun getPredWandId (T@U) Int)
(declare-fun |seq_collect$Array$3$usize$__$TY$__Array$3$usize$$int$$Seq$$int$#frame| (T@U T@U Int) T@U)
(declare-fun |read$#frame| (T@U) Real)
(declare-fun |snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize#frame| (T@U T@U) T@U)
(declare-fun ZeroPMask () T@U)
(declare-fun |Seq#SkolemDiff| (T@U T@U) Int)
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
(assert  (and (and (and (and (and (and (and (and (and (and (forall ((arg0@@11 T@T) (arg1 T@T) ) (! (= (Ctor (FieldType arg0@@11 arg1)) 6)
 :qid |ctor:FieldType|
)) (forall ((arg0@@12 T@T) (arg1@@0 T@T) ) (! (= (FieldTypeInv0 (FieldType arg0@@12 arg1@@0)) arg0@@12)
 :qid |typeInv:FieldTypeInv0|
 :pattern ( (FieldType arg0@@12 arg1@@0))
))) (forall ((arg0@@13 T@T) (arg1@@1 T@T) ) (! (= (FieldTypeInv1 (FieldType arg0@@13 arg1@@1)) arg1@@1)
 :qid |typeInv:FieldTypeInv1|
 :pattern ( (FieldType arg0@@13 arg1@@1))
))) (= (Ctor NormalFieldType) 7)) (= (type $allocated) (FieldType NormalFieldType boolType))) (= (Ctor RefType) 8)) (= (type tuple_0) (FieldType NormalFieldType RefType))) (= (type tuple_1) (FieldType NormalFieldType RefType))) (= (type val_bool) (FieldType NormalFieldType boolType))) (= (type val_int) (FieldType NormalFieldType intType))) (= (type val_ref) (FieldType NormalFieldType RefType))))
(assert (distinct $allocated tuple_0 tuple_1 val_bool val_int val_ref)
)
(assert  (and (and (forall ((arg0@@14 T@T) ) (! (= (Ctor (SeqType arg0@@14)) 9)
 :qid |ctor:SeqType|
)) (forall ((arg0@@15 T@T) ) (! (= (SeqTypeInv0 (SeqType arg0@@15)) arg0@@15)
 :qid |typeInv:SeqTypeInv0|
 :pattern ( (SeqType arg0@@15))
))) (forall ((arg0@@16 T@U) (arg1@@2 Int) ) (! (let ((T (SeqTypeInv0 (type arg0@@16))))
(= (type (|Seq#Drop| arg0@@16 arg1@@2)) (SeqType T)))
 :qid |funType:Seq#Drop|
 :pattern ( (|Seq#Drop| arg0@@16 arg1@@2))
))))
(assert (forall ((s T@U) (n Int) ) (! (let ((T@@0 (SeqTypeInv0 (type s))))
 (=> (= (type s) (SeqType T@@0)) (and (=> (<= 0 n) (and (=> (<= n (|Seq#Length| s)) (= (|Seq#Length| (|Seq#Drop| s n)) (- (|Seq#Length| s) n))) (=> (< (|Seq#Length| s) n) (= (|Seq#Length| (|Seq#Drop| s n)) 0)))) (=> (< n 0) (= (|Seq#Length| (|Seq#Drop| s n)) (|Seq#Length| s))))))
 :qid |Ex2originalbpl.334:18|
 :skolemid |50|
 :pattern ( (|Seq#Length| (|Seq#Drop| s n)))
 :pattern ( (|Seq#Length| s) (|Seq#Drop| s n))
)))
(assert  (and (and (and (and (and (forall ((arg0@@17 T@T) ) (! (= (Ctor (MapType0Type arg0@@17)) 10)
 :qid |ctor:MapType0Type|
)) (forall ((arg0@@18 T@T) ) (! (= (MapType0TypeInv0 (MapType0Type arg0@@18)) arg0@@18)
 :qid |typeInv:MapType0TypeInv0|
 :pattern ( (MapType0Type arg0@@18))
))) (forall ((arg0@@19 T@U) (arg1@@3 T@U) (arg2 T@U) ) (! (let ((B (FieldTypeInv1 (type arg2))))
(= (type (MapType0Select arg0@@19 arg1@@3 arg2)) B))
 :qid |funType:MapType0Select|
 :pattern ( (MapType0Select arg0@@19 arg1@@3 arg2))
))) (forall ((arg0@@20 T@U) (arg1@@4 T@U) (arg2@@0 T@U) (arg3 T@U) ) (! (let ((aVar0 (type arg1@@4)))
(= (type (MapType0Store arg0@@20 arg1@@4 arg2@@0 arg3)) (MapType0Type aVar0)))
 :qid |funType:MapType0Store|
 :pattern ( (MapType0Store arg0@@20 arg1@@4 arg2@@0 arg3))
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
 :qid |Ex2originalbpl.95:15|
 :skolemid |12|
 :pattern ( (succHeap Heap0 Heap1))
)))
(assert  (and (and (and (and (and (and (forall ((arg0@@21 T@T) (arg1@@5 T@T) ) (! (= (Ctor (MapType1Type arg0@@21 arg1@@5)) 11)
 :qid |ctor:MapType1Type|
)) (forall ((arg0@@22 T@T) (arg1@@6 T@T) ) (! (= (MapType1TypeInv0 (MapType1Type arg0@@22 arg1@@6)) arg0@@22)
 :qid |typeInv:MapType1TypeInv0|
 :pattern ( (MapType1Type arg0@@22 arg1@@6))
))) (forall ((arg0@@23 T@T) (arg1@@7 T@T) ) (! (= (MapType1TypeInv1 (MapType1Type arg0@@23 arg1@@7)) arg1@@7)
 :qid |typeInv:MapType1TypeInv1|
 :pattern ( (MapType1Type arg0@@23 arg1@@7))
))) (forall ((arg0@@24 T@U) (arg1@@8 T@U) (arg2@@1 T@U) ) (! (let ((aVar1 (MapType1TypeInv1 (type arg0@@24))))
(= (type (MapType1Select arg0@@24 arg1@@8 arg2@@1)) aVar1))
 :qid |funType:MapType1Select|
 :pattern ( (MapType1Select arg0@@24 arg1@@8 arg2@@1))
))) (forall ((arg0@@25 T@U) (arg1@@9 T@U) (arg2@@2 T@U) (arg3@@0 T@U) ) (! (let ((aVar1@@0 (type arg3@@0)))
(let ((aVar0@@0 (type arg1@@9)))
(= (type (MapType1Store arg0@@25 arg1@@9 arg2@@2 arg3@@0)) (MapType1Type aVar0@@0 aVar1@@0))))
 :qid |funType:MapType1Store|
 :pattern ( (MapType1Store arg0@@25 arg1@@9 arg2@@2 arg3@@0))
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
 :qid |Ex2originalbpl.181:15|
 :skolemid |27|
 :pattern ( (state Heap Mask))
)))
(assert (forall ((Heap0@@0 T@U) (Heap1@@0 T@U) (Heap2 T@U) ) (!  (=> (and (and (and (= (type Heap0@@0) (MapType0Type RefType)) (= (type Heap1@@0) (MapType0Type RefType))) (= (type Heap2) (MapType0Type RefType))) (and (succHeapTrans Heap0@@0 Heap1@@0) (succHeap Heap1@@0 Heap2))) (succHeapTrans Heap0@@0 Heap2))
 :qid |Ex2originalbpl.100:15|
 :skolemid |13|
 :pattern ( (succHeapTrans Heap0@@0 Heap1@@0) (succHeap Heap1@@0 Heap2))
)))
(assert (forall ((Heap@@0 T@U) (self T@U) (idx_1 Int) ) (!  (=> (and (= (type Heap@@0) (MapType0Type RefType)) (= (type self) RefType)) (dummyFunction (int_2_U (|lookup_pure__$TY$__Array$3$usize$usize$Array$3$usize$$int$$$int$#triggerStateless| self idx_1))))
 :qid |Ex2originalbpl.726:15|
 :skolemid |76|
 :pattern ( (|lookup_pure__$TY$__Array$3$usize$usize$Array$3$usize$$int$$$int$'| Heap@@0 self idx_1))
)))
(assert  (and (forall ((arg0@@26 T@U) (arg1@@10 T@U) (arg2@@3 Int) ) (! (= (type (|seq_collect$Array$3$usize$__$TY$__Array$3$usize$$int$$Seq$$int$'| arg0@@26 arg1@@10 arg2@@3)) (SeqType intType))
 :qid |funType:seq_collect$Array$3$usize$__$TY$__Array$3$usize$$int$$Seq$$int$'|
 :pattern ( (|seq_collect$Array$3$usize$__$TY$__Array$3$usize$$int$$Seq$$int$'| arg0@@26 arg1@@10 arg2@@3))
)) (forall ((arg0@@27 T@U) (arg1@@11 Int) ) (! (= (type (|seq_collect$Array$3$usize$__$TY$__Array$3$usize$$int$$Seq$$int$#triggerStateless| arg0@@27 arg1@@11)) (SeqType intType))
 :qid |funType:seq_collect$Array$3$usize$__$TY$__Array$3$usize$$int$$Seq$$int$#triggerStateless|
 :pattern ( (|seq_collect$Array$3$usize$__$TY$__Array$3$usize$$int$$Seq$$int$#triggerStateless| arg0@@27 arg1@@11))
))))
(assert (forall ((Heap@@1 T@U) (self@@0 T@U) (start Int) ) (!  (=> (and (= (type Heap@@1) (MapType0Type RefType)) (= (type self@@0) RefType)) (dummyFunction (|seq_collect$Array$3$usize$__$TY$__Array$3$usize$$int$$Seq$$int$#triggerStateless| self@@0 start)))
 :qid |Ex2originalbpl.757:15|
 :skolemid |79|
 :pattern ( (|seq_collect$Array$3$usize$__$TY$__Array$3$usize$$int$$Seq$$int$'| Heap@@1 self@@0 start))
)))
(assert  (and (and (and (= (Ctor Snap$Array$3$usizeDomainTypeType) 12) (forall ((arg0@@28 T@U) (arg1@@12 T@U) ) (! (= (type (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize arg0@@28 arg1@@12)) Snap$Array$3$usizeDomainTypeType)
 :qid |funType:snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize|
 :pattern ( (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize arg0@@28 arg1@@12))
))) (forall ((arg0@@29 T@U) ) (! (= (type (cons$Snap$Array$3$usize$__$TY$__Seq$$int$$Snap$Array$3$usize arg0@@29)) Snap$Array$3$usizeDomainTypeType)
 :qid |funType:cons$Snap$Array$3$usize$__$TY$__Seq$$int$$Snap$Array$3$usize|
 :pattern ( (cons$Snap$Array$3$usize$__$TY$__Seq$$int$$Snap$Array$3$usize arg0@@29))
))) (forall ((arg0@@30 T@U) (arg1@@13 T@U) (arg2@@4 Int) ) (! (= (type (seq_collect$Array$3$usize$__$TY$__Array$3$usize$$int$$Seq$$int$ arg0@@30 arg1@@13 arg2@@4)) (SeqType intType))
 :qid |funType:seq_collect$Array$3$usize$__$TY$__Array$3$usize$$int$$Seq$$int$|
 :pattern ( (seq_collect$Array$3$usize$__$TY$__Array$3$usize$$int$$Seq$$int$ arg0@@30 arg1@@13 arg2@@4))
))))
(assert (forall ((Heap@@2 T@U) (Mask@@0 T@U) (self@@1 T@U) ) (!  (=> (and (and (and (= (type Heap@@2) (MapType0Type RefType)) (= (type Mask@@0) (MapType1Type RefType realType))) (= (type self@@1) RefType)) (and (state Heap@@2 Mask@@0) (< AssumeFunctionsAbove 0))) (= (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize Heap@@2 self@@1) (cons$Snap$Array$3$usize$__$TY$__Seq$$int$$Snap$Array$3$usize (seq_collect$Array$3$usize$__$TY$__Array$3$usize$$int$$Seq$$int$ Heap@@2 self@@1 0))))
 :qid |Ex2originalbpl.821:15|
 :skolemid |89|
 :pattern ( (state Heap@@2 Mask@@0) (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize Heap@@2 self@@1))
)))
(assert (forall ((arg0@@31 T@U) (arg1@@14 Int) ) (! (let ((T@@1 (SeqTypeInv0 (type arg0@@31))))
(= (type (|Seq#Index| arg0@@31 arg1@@14)) T@@1))
 :qid |funType:Seq#Index|
 :pattern ( (|Seq#Index| arg0@@31 arg1@@14))
)))
(assert (forall ((s@@0 T@U) (n@@0 Int) (j Int) ) (! (let ((T@@2 (SeqTypeInv0 (type s@@0))))
 (=> (= (type s@@0) (SeqType T@@2)) (=> (and (and (< 0 n@@0) (<= 0 j)) (< j (- (|Seq#Length| s@@0) n@@0))) (and (= (|Seq#Sub| (|Seq#Add| j n@@0) n@@0) j) (= (|Seq#Index| (|Seq#Drop| s@@0 n@@0) j) (|Seq#Index| s@@0 (|Seq#Add| j n@@0)))))))
 :qid |Ex2originalbpl.355:18|
 :skolemid |51|
 :pattern ( (|Seq#Index| (|Seq#Drop| s@@0 n@@0) j))
)))
(assert  (and (and (= (Ctor FrameTypeType) 13) (= (type null) RefType)) (forall ((arg0@@32 T@U) ) (! (let ((A (FieldTypeInv0 (type arg0@@32))))
(= (type (PredicateMaskField arg0@@32)) (FieldType A (MapType1Type RefType boolType))))
 :qid |funType:PredicateMaskField|
 :pattern ( (PredicateMaskField arg0@@32))
))))
(assert (forall ((Heap@@3 T@U) (ExhaleHeap T@U) (Mask@@1 T@U) (pm_f T@U) ) (! (let ((C (FieldTypeInv0 (type pm_f))))
 (=> (and (and (and (and (and (= (type Heap@@3) (MapType0Type RefType)) (= (type ExhaleHeap) (MapType0Type RefType))) (= (type Mask@@1) (MapType1Type RefType realType))) (= (type pm_f) (FieldType C FrameTypeType))) (IdenticalOnKnownLocations Heap@@3 ExhaleHeap Mask@@1)) (and (HasDirectPerm Mask@@1 null pm_f) (IsPredicateField pm_f))) (= (MapType0Select Heap@@3 null (PredicateMaskField pm_f)) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))))
 :qid |Ex2originalbpl.49:19|
 :skolemid |2|
 :pattern ( (IdenticalOnKnownLocations Heap@@3 ExhaleHeap Mask@@1) (IsPredicateField pm_f) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))
)))
(assert (forall ((arg0@@33 T@U) ) (! (let ((A@@0 (FieldTypeInv0 (type arg0@@33))))
(= (type (WandMaskField arg0@@33)) (FieldType A@@0 (MapType1Type RefType boolType))))
 :qid |funType:WandMaskField|
 :pattern ( (WandMaskField arg0@@33))
)))
(assert (forall ((Heap@@4 T@U) (ExhaleHeap@@0 T@U) (Mask@@2 T@U) (pm_f@@0 T@U) ) (! (let ((C@@0 (FieldTypeInv0 (type pm_f@@0))))
 (=> (and (and (and (and (and (= (type Heap@@4) (MapType0Type RefType)) (= (type ExhaleHeap@@0) (MapType0Type RefType))) (= (type Mask@@2) (MapType1Type RefType realType))) (= (type pm_f@@0) (FieldType C@@0 FrameTypeType))) (IdenticalOnKnownLocations Heap@@4 ExhaleHeap@@0 Mask@@2)) (and (HasDirectPerm Mask@@2 null pm_f@@0) (IsWandField pm_f@@0))) (= (MapType0Select Heap@@4 null (WandMaskField pm_f@@0)) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))))
 :qid |Ex2originalbpl.62:19|
 :skolemid |5|
 :pattern ( (IdenticalOnKnownLocations Heap@@4 ExhaleHeap@@0 Mask@@2) (IsWandField pm_f@@0) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))
)))
(assert  (and (= (Ctor PredicateType_Array$3$usizeType) 14) (forall ((arg0@@34 T@U) ) (! (= (type (Array$3$usize arg0@@34)) (FieldType PredicateType_Array$3$usizeType FrameTypeType))
 :qid |funType:Array$3$usize|
 :pattern ( (Array$3$usize arg0@@34))
))))
(assert (forall ((self@@2 T@U) ) (!  (=> (= (type self@@2) RefType) (IsPredicateField (Array$3$usize self@@2)))
 :qid |Ex2originalbpl.902:15|
 :skolemid |99|
 :pattern ( (Array$3$usize self@@2))
)))
(assert  (and (= (Ctor PredicateType_DeadBorrowToken$Type) 15) (forall ((arg0@@35 Int) ) (! (= (type (DeadBorrowToken$ arg0@@35)) (FieldType PredicateType_DeadBorrowToken$Type FrameTypeType))
 :qid |funType:DeadBorrowToken$|
 :pattern ( (DeadBorrowToken$ arg0@@35))
))))
(assert (forall ((borrow Int) ) (! (IsPredicateField (DeadBorrowToken$ borrow))
 :qid |Ex2originalbpl.937:15|
 :skolemid |105|
 :pattern ( (DeadBorrowToken$ borrow))
)))
(assert  (and (= (Ctor PredicateType_tuple0$Type) 16) (forall ((arg0@@36 T@U) ) (! (= (type (tuple0$ arg0@@36)) (FieldType PredicateType_tuple0$Type FrameTypeType))
 :qid |funType:tuple0$|
 :pattern ( (tuple0$ arg0@@36))
))))
(assert (forall ((self@@3 T@U) ) (!  (=> (= (type self@@3) RefType) (IsPredicateField (tuple0$ self@@3)))
 :qid |Ex2originalbpl.972:15|
 :skolemid |111|
 :pattern ( (tuple0$ self@@3))
)))
(assert  (and (= (Ctor PredicateType_usizeType) 17) (forall ((arg0@@37 T@U) ) (! (= (type (usize arg0@@37)) (FieldType PredicateType_usizeType FrameTypeType))
 :qid |funType:usize|
 :pattern ( (usize arg0@@37))
))))
(assert (forall ((self@@4 T@U) ) (!  (=> (= (type self@@4) RefType) (IsPredicateField (usize self@@4)))
 :qid |Ex2originalbpl.1007:15|
 :skolemid |117|
 :pattern ( (usize self@@4))
)))
(assert  (and (forall ((arg0@@38 T@U) (arg1@@15 T@U) ) (! (= (type (|snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize'| arg0@@38 arg1@@15)) Snap$Array$3$usizeDomainTypeType)
 :qid |funType:snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize'|
 :pattern ( (|snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize'| arg0@@38 arg1@@15))
)) (forall ((arg0@@39 T@U) ) (! (= (type (|snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize#triggerStateless| arg0@@39)) Snap$Array$3$usizeDomainTypeType)
 :qid |funType:snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize#triggerStateless|
 :pattern ( (|snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize#triggerStateless| arg0@@39))
))))
(assert (forall ((Heap@@5 T@U) (self@@5 T@U) ) (!  (=> (and (= (type Heap@@5) (MapType0Type RefType)) (= (type self@@5) RefType)) (dummyFunction (|snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize#triggerStateless| self@@5)))
 :qid |Ex2originalbpl.815:15|
 :skolemid |88|
 :pattern ( (|snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize'| Heap@@5 self@@5))
)))
(assert (forall ((Heap@@6 T@U) (self@@6 T@U) ) (!  (=> (and (= (type Heap@@6) (MapType0Type RefType)) (= (type self@@6) RefType)) (|Array$3$usize#everUsed| (Array$3$usize self@@6)))
 :qid |Ex2originalbpl.921:15|
 :skolemid |103|
 :pattern ( (|Array$3$usize#trigger| Heap@@6 (Array$3$usize self@@6)))
)))
(assert (forall ((Heap@@7 T@U) (borrow@@0 Int) ) (!  (=> (= (type Heap@@7) (MapType0Type RefType)) (|DeadBorrowToken$#everUsed| (DeadBorrowToken$ borrow@@0)))
 :qid |Ex2originalbpl.956:15|
 :skolemid |109|
 :pattern ( (|DeadBorrowToken$#trigger| Heap@@7 (DeadBorrowToken$ borrow@@0)))
)))
(assert (forall ((Heap@@8 T@U) (self@@7 T@U) ) (!  (=> (and (= (type Heap@@8) (MapType0Type RefType)) (= (type self@@7) RefType)) (|tuple0$#everUsed| (tuple0$ self@@7)))
 :qid |Ex2originalbpl.991:15|
 :skolemid |115|
 :pattern ( (|tuple0$#trigger| Heap@@8 (tuple0$ self@@7)))
)))
(assert (forall ((Heap@@9 T@U) (self@@8 T@U) ) (!  (=> (and (= (type Heap@@9) (MapType0Type RefType)) (= (type self@@8) RefType)) (|usize#everUsed| (usize self@@8)))
 :qid |Ex2originalbpl.1026:15|
 :skolemid |121|
 :pattern ( (|usize#trigger| Heap@@9 (usize self@@8)))
)))
(assert (forall ((arg0@@40 T@U) (arg1@@16 Int) (arg2@@5 T@U) ) (! (let ((T@@3 (type arg2@@5)))
(= (type (|Seq#Update| arg0@@40 arg1@@16 arg2@@5)) (SeqType T@@3)))
 :qid |funType:Seq#Update|
 :pattern ( (|Seq#Update| arg0@@40 arg1@@16 arg2@@5))
)))
(assert (forall ((s@@1 T@U) (i Int) (v T@U) (n@@1 Int) ) (! (let ((T@@4 (type v)))
 (=> (= (type s@@1) (SeqType T@@4)) (=> (and (<= 0 n@@1) (< n@@1 (|Seq#Length| s@@1))) (and (=> (= i n@@1) (= (|Seq#Index| (|Seq#Update| s@@1 i v) n@@1) v)) (=> (not (= i n@@1)) (= (|Seq#Index| (|Seq#Update| s@@1 i v) n@@1) (|Seq#Index| s@@1 n@@1)))))))
 :qid |Ex2originalbpl.310:18|
 :skolemid |47|
 :pattern ( (|Seq#Index| (|Seq#Update| s@@1 i v) n@@1))
 :pattern ( (|Seq#Index| s@@1 n@@1) (|Seq#Update| s@@1 i v))
)))
(assert (forall ((arg0@@41 Real) (arg1@@17 T@U) ) (! (= (type (ConditionalFrame arg0@@41 arg1@@17)) FrameTypeType)
 :qid |funType:ConditionalFrame|
 :pattern ( (ConditionalFrame arg0@@41 arg1@@17))
)))
(assert (forall ((Heap@@10 T@U) (Mask@@3 T@U) (self@@9 T@U) ) (!  (=> (and (and (and (= (type Heap@@10) (MapType0Type RefType)) (= (type Mask@@3) (MapType1Type RefType realType))) (= (type self@@9) RefType)) (and (state Heap@@10 Mask@@3) (or (< AssumeFunctionsAbove 0) (|snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize#trigger| (ConditionalFrame (read$ Heap@@10) (MapType0Select Heap@@10 null (Array$3$usize self@@9))) self@@9)))) (forall ((i@@0 Int) ) (!  (=> (and (<= 0 i@@0) (< i@@0 3)) (= (read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$ (|snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize'| Heap@@10 self@@9) i@@0) (lookup_pure__$TY$__Array$3$usize$usize$Array$3$usize$$int$$$int$ Heap@@10 self@@9 i@@0)))
 :qid |Ex2originalbpl.836:209|
 :skolemid |91|
 :pattern ( (read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$ (|snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize'| Heap@@10 self@@9) i@@0))
 :pattern ( (|lookup_pure__$TY$__Array$3$usize$usize$Array$3$usize$$int$$$int$#frame| (ConditionalFrame (read$ Heap@@10) (MapType0Select Heap@@10 null (Array$3$usize self@@9))) self@@9 i@@0))
)))
 :qid |Ex2originalbpl.834:15|
 :skolemid |92|
 :pattern ( (state Heap@@10 Mask@@3) (|snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize'| Heap@@10 self@@9))
)))
(assert (forall ((arg0@@42 T@U) (arg1@@18 Int) ) (! (let ((T@@5 (SeqTypeInv0 (type arg0@@42))))
(= (type (|Seq#Take| arg0@@42 arg1@@18)) (SeqType T@@5)))
 :qid |funType:Seq#Take|
 :pattern ( (|Seq#Take| arg0@@42 arg1@@18))
)))
(assert (forall ((s@@2 T@U) (n@@2 Int) ) (! (let ((T@@6 (SeqTypeInv0 (type s@@2))))
 (=> (= (type s@@2) (SeqType T@@6)) (and (=> (<= 0 n@@2) (and (=> (<= n@@2 (|Seq#Length| s@@2)) (= (|Seq#Length| (|Seq#Take| s@@2 n@@2)) n@@2)) (=> (< (|Seq#Length| s@@2) n@@2) (= (|Seq#Length| (|Seq#Take| s@@2 n@@2)) (|Seq#Length| s@@2))))) (=> (< n@@2 0) (= (|Seq#Length| (|Seq#Take| s@@2 n@@2)) 0)))))
 :qid |Ex2originalbpl.321:18|
 :skolemid |48|
 :pattern ( (|Seq#Length| (|Seq#Take| s@@2 n@@2)))
 :pattern ( (|Seq#Take| s@@2 n@@2) (|Seq#Length| s@@2))
)))
(assert (= (type EmptyFrame) FrameTypeType))
(assert (forall ((Heap@@11 T@U) (Mask@@4 T@U) ) (!  (=> (and (and (= (type Heap@@11) (MapType0Type RefType)) (= (type Mask@@4) (MapType1Type RefType realType))) (and (state Heap@@11 Mask@@4) (or (< AssumeFunctionsAbove 3) (|read$#trigger| EmptyFrame)))) (< (|read$'| Heap@@11) FullPerm))
 :qid |Ex2originalbpl.878:15|
 :skolemid |97|
 :pattern ( (state Heap@@11 Mask@@4) (|read$'| Heap@@11))
)))
(assert (forall ((arg0@@43 Int) (arg1@@19 Int) ) (! (= (type (|Seq#Range| arg0@@43 arg1@@19)) (SeqType intType))
 :qid |funType:Seq#Range|
 :pattern ( (|Seq#Range| arg0@@43 arg1@@19))
)))
(assert (forall ((q@min Int) (q@max Int) (v@@0 T@U) ) (!  (=> (= (type v@@0) intType) (= (|Seq#Contains| (|Seq#Range| q@min q@max) v@@0)  (and (<= q@min (U_2_int v@@0)) (< (U_2_int v@@0) q@max))))
 :qid |Ex2originalbpl.594:15|
 :skolemid |69|
 :pattern ( (|Seq#Contains| (|Seq#Range| q@min q@max) v@@0))
)))
(assert (forall ((Heap@@12 T@U) (Mask@@5 T@U) ) (!  (=> (and (and (= (type Heap@@12) (MapType0Type RefType)) (= (type Mask@@5) (MapType1Type RefType realType))) (and (state Heap@@12 Mask@@5) (or (< AssumeFunctionsAbove 3) (|read$#trigger| EmptyFrame)))) (< NoPerm (|read$'| Heap@@12)))
 :qid |Ex2originalbpl.874:15|
 :skolemid |96|
 :pattern ( (state Heap@@12 Mask@@5) (|read$'| Heap@@12))
)))
(assert (forall ((s@@3 T@U) (x@@8 T@U) ) (! (let ((T@@7 (type x@@8)))
 (=> (and (= (type s@@3) (SeqType T@@7)) (|Seq#Contains| s@@3 x@@8)) (and (and (<= 0 (|Seq#Skolem| s@@3 x@@8)) (< (|Seq#Skolem| s@@3 x@@8) (|Seq#Length| s@@3))) (= (|Seq#Index| s@@3 (|Seq#Skolem| s@@3 x@@8)) x@@8))))
 :qid |Ex2originalbpl.452:18|
 :skolemid |59|
 :pattern ( (|Seq#Contains| s@@3 x@@8))
)))
(assert (forall ((Heap@@13 T@U) (ExhaleHeap@@1 T@U) (Mask@@6 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@13) (MapType0Type RefType)) (= (type ExhaleHeap@@1) (MapType0Type RefType))) (= (type Mask@@6) (MapType1Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@13 ExhaleHeap@@1 Mask@@6)) (U_2_bool (MapType0Select Heap@@13 o_1 $allocated))) (U_2_bool (MapType0Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |Ex2originalbpl.75:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@13 ExhaleHeap@@1 Mask@@6) (MapType0Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert (forall ((Heap@@14 T@U) (ExhaleHeap@@2 T@U) (Mask@@7 T@U) (o_2 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@14) (MapType0Type RefType)) (= (type ExhaleHeap@@2) (MapType0Type RefType))) (= (type Mask@@7) (MapType1Type RefType realType))) (= (type o_2) RefType)) (IdenticalOnKnownLocationsLiberal Heap@@14 ExhaleHeap@@2 Mask@@7)) (U_2_bool (MapType0Select Heap@@14 o_2 $allocated))) (U_2_bool (MapType0Select ExhaleHeap@@2 o_2 $allocated)))
 :qid |Ex2originalbpl.142:15|
 :skolemid |23|
 :pattern ( (IdenticalOnKnownLocationsLiberal Heap@@14 ExhaleHeap@@2 Mask@@7) (MapType0Select ExhaleHeap@@2 o_2 $allocated))
)))
(assert (forall ((Heap@@15 T@U) (self@@10 T@U) ) (!  (=> (and (= (type Heap@@15) (MapType0Type RefType)) (= (type self@@10) RefType)) (and (= (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize Heap@@15 self@@10) (|snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize'| Heap@@15 self@@10)) (dummyFunction (|snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize#triggerStateless| self@@10))))
 :qid |Ex2originalbpl.811:15|
 :skolemid |87|
 :pattern ( (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize Heap@@15 self@@10))
)))
(assert (forall ((s@@4 T@U) (n@@3 Int) ) (! (let ((T@@8 (SeqTypeInv0 (type s@@4))))
 (=> (and (= (type s@@4) (SeqType T@@8)) (<= n@@3 0)) (= (|Seq#Drop| s@@4 n@@3) s@@4)))
 :qid |Ex2originalbpl.436:18|
 :skolemid |57|
 :pattern ( (|Seq#Drop| s@@4 n@@3))
)))
(assert (forall ((i@@1 Int) (j@@0 Int) ) (! (= (|Seq#Sub| i@@1 j@@0) (- i@@1 j@@0))
 :qid |Ex2originalbpl.290:15|
 :skolemid |42|
 :pattern ( (|Seq#Sub| i@@1 j@@0))
)))
(assert (forall ((i@@2 Int) (j@@1 Int) ) (! (= (|Seq#Add| i@@2 j@@1) (+ i@@2 j@@1))
 :qid |Ex2originalbpl.288:15|
 :skolemid |41|
 :pattern ( (|Seq#Add| i@@2 j@@1))
)))
(assert (forall ((T@@9 T@T) ) (! (= (type (|Seq#Empty| T@@9)) (SeqType T@@9))
 :qid |funType:Seq#Empty|
 :pattern ( (|Seq#Empty| T@@9))
)))
(assert (forall ((Heap@@16 T@U) (Mask@@8 T@U) (self@@11 T@U) (start@@0 Int) ) (!  (=> (and (and (and (and (and (= (type Heap@@16) (MapType0Type RefType)) (= (type Mask@@8) (MapType1Type RefType realType))) (= (type self@@11) RefType)) (and (state Heap@@16 Mask@@8) (or (< AssumeFunctionsAbove 1) (|seq_collect$Array$3$usize$__$TY$__Array$3$usize$$int$$Seq$$int$#trigger| (ConditionalFrame (read$ Heap@@16) (MapType0Select Heap@@16 null (Array$3$usize self@@11))) self@@11 start@@0)))) (<= 0 start@@0)) (>= start@@0 3)) (|Seq#Equal| (|seq_collect$Array$3$usize$__$TY$__Array$3$usize$$int$$Seq$$int$'| Heap@@16 self@@11 start@@0) (|Seq#Empty| intType)))
 :qid |Ex2originalbpl.776:15|
 :skolemid |82|
 :pattern ( (state Heap@@16 Mask@@8) (|seq_collect$Array$3$usize$__$TY$__Array$3$usize$$int$$Seq$$int$'| Heap@@16 self@@11 start@@0))
)))
(assert (forall ((arg0@@44 T@U) ) (! (let ((T@@10 (type arg0@@44)))
(= (type (|Seq#Singleton| arg0@@44)) (SeqType T@@10)))
 :qid |funType:Seq#Singleton|
 :pattern ( (|Seq#Singleton| arg0@@44))
)))
(assert (forall ((x@@9 T@U) (y@@1 T@U) ) (! (let ((T@@11 (type x@@9)))
 (=> (= (type y@@1) T@@11) (= (|Seq#Contains| (|Seq#Singleton| x@@9) y@@1) (= x@@9 y@@1))))
 :qid |Ex2originalbpl.577:18|
 :skolemid |66|
 :pattern ( (|Seq#Contains| (|Seq#Singleton| x@@9) y@@1))
)))
(assert (forall ((s@@5 T@U) (n@@4 Int) (j@@2 Int) ) (! (let ((T@@12 (SeqTypeInv0 (type s@@5))))
 (=> (= (type s@@5) (SeqType T@@12)) (=> (and (and (<= 0 j@@2) (< j@@2 n@@4)) (< j@@2 (|Seq#Length| s@@5))) (= (|Seq#Index| (|Seq#Take| s@@5 n@@4) j@@2) (|Seq#Index| s@@5 j@@2)))))
 :qid |Ex2originalbpl.329:18|
 :skolemid |49|
 :pattern ( (|Seq#Index| (|Seq#Take| s@@5 n@@4) j@@2))
 :pattern ( (|Seq#Index| s@@5 j@@2) (|Seq#Take| s@@5 n@@4))
)))
(assert (forall ((self@@12 T@U) (self2 T@U) ) (!  (=> (and (and (= (type self@@12) RefType) (= (type self2) RefType)) (= (Array$3$usize self@@12) (Array$3$usize self2))) (= self@@12 self2))
 :qid |Ex2originalbpl.912:15|
 :skolemid |101|
 :pattern ( (Array$3$usize self@@12) (Array$3$usize self2))
)))
(assert (forall ((arg0@@45 T@U) ) (! (= (type (|Array$3$usize#sm| arg0@@45)) (FieldType PredicateType_Array$3$usizeType (MapType1Type RefType boolType)))
 :qid |funType:Array$3$usize#sm|
 :pattern ( (|Array$3$usize#sm| arg0@@45))
)))
(assert (forall ((self@@13 T@U) (self2@@0 T@U) ) (!  (=> (and (and (= (type self@@13) RefType) (= (type self2@@0) RefType)) (= (|Array$3$usize#sm| self@@13) (|Array$3$usize#sm| self2@@0))) (= self@@13 self2@@0))
 :qid |Ex2originalbpl.916:15|
 :skolemid |102|
 :pattern ( (|Array$3$usize#sm| self@@13) (|Array$3$usize#sm| self2@@0))
)))
(assert (forall ((borrow@@1 Int) (borrow2 Int) ) (!  (=> (= (DeadBorrowToken$ borrow@@1) (DeadBorrowToken$ borrow2)) (= borrow@@1 borrow2))
 :qid |Ex2originalbpl.947:15|
 :skolemid |107|
 :pattern ( (DeadBorrowToken$ borrow@@1) (DeadBorrowToken$ borrow2))
)))
(assert (forall ((arg0@@46 Int) ) (! (= (type (|DeadBorrowToken$#sm| arg0@@46)) (FieldType PredicateType_DeadBorrowToken$Type (MapType1Type RefType boolType)))
 :qid |funType:DeadBorrowToken$#sm|
 :pattern ( (|DeadBorrowToken$#sm| arg0@@46))
)))
(assert (forall ((borrow@@2 Int) (borrow2@@0 Int) ) (!  (=> (= (|DeadBorrowToken$#sm| borrow@@2) (|DeadBorrowToken$#sm| borrow2@@0)) (= borrow@@2 borrow2@@0))
 :qid |Ex2originalbpl.951:15|
 :skolemid |108|
 :pattern ( (|DeadBorrowToken$#sm| borrow@@2) (|DeadBorrowToken$#sm| borrow2@@0))
)))
(assert (forall ((self@@14 T@U) (self2@@1 T@U) ) (!  (=> (and (and (= (type self@@14) RefType) (= (type self2@@1) RefType)) (= (tuple0$ self@@14) (tuple0$ self2@@1))) (= self@@14 self2@@1))
 :qid |Ex2originalbpl.982:15|
 :skolemid |113|
 :pattern ( (tuple0$ self@@14) (tuple0$ self2@@1))
)))
(assert (forall ((arg0@@47 T@U) ) (! (= (type (|tuple0$#sm| arg0@@47)) (FieldType PredicateType_tuple0$Type (MapType1Type RefType boolType)))
 :qid |funType:tuple0$#sm|
 :pattern ( (|tuple0$#sm| arg0@@47))
)))
(assert (forall ((self@@15 T@U) (self2@@2 T@U) ) (!  (=> (and (and (= (type self@@15) RefType) (= (type self2@@2) RefType)) (= (|tuple0$#sm| self@@15) (|tuple0$#sm| self2@@2))) (= self@@15 self2@@2))
 :qid |Ex2originalbpl.986:15|
 :skolemid |114|
 :pattern ( (|tuple0$#sm| self@@15) (|tuple0$#sm| self2@@2))
)))
(assert (forall ((self@@16 T@U) (self2@@3 T@U) ) (!  (=> (and (and (= (type self@@16) RefType) (= (type self2@@3) RefType)) (= (usize self@@16) (usize self2@@3))) (= self@@16 self2@@3))
 :qid |Ex2originalbpl.1017:15|
 :skolemid |119|
 :pattern ( (usize self@@16) (usize self2@@3))
)))
(assert (forall ((arg0@@48 T@U) ) (! (= (type (|usize#sm| arg0@@48)) (FieldType PredicateType_usizeType (MapType1Type RefType boolType)))
 :qid |funType:usize#sm|
 :pattern ( (|usize#sm| arg0@@48))
)))
(assert (forall ((self@@17 T@U) (self2@@4 T@U) ) (!  (=> (and (and (= (type self@@17) RefType) (= (type self2@@4) RefType)) (= (|usize#sm| self@@17) (|usize#sm| self2@@4))) (= self@@17 self2@@4))
 :qid |Ex2originalbpl.1021:15|
 :skolemid |120|
 :pattern ( (|usize#sm| self@@17) (|usize#sm| self2@@4))
)))
(assert (forall ((arg0@@49 T@U) ) (! (= (type (uncons$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$Seq$$int$ arg0@@49)) (SeqType intType))
 :qid |funType:uncons$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$Seq$$int$|
 :pattern ( (uncons$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$Seq$$int$ arg0@@49))
)))
(assert (forall ((data_1 T@U) ) (!  (=> (= (type data_1) (SeqType intType)) (|Seq#Equal| (uncons$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$Seq$$int$ (cons$Snap$Array$3$usize$__$TY$__Seq$$int$$Snap$Array$3$usize data_1)) data_1))
 :qid |Ex2originalbpl.617:15|
 :skolemid |70|
 :pattern ( (cons$Snap$Array$3$usize$__$TY$__Seq$$int$$Snap$Array$3$usize data_1))
)))
(assert (forall ((Heap@@17 T@U) (ExhaleHeap@@3 T@U) (Mask@@9 T@U) (o_1@@0 T@U) (f_2 T@U) ) (! (let ((B@@1 (FieldTypeInv1 (type f_2))))
(let ((A@@1 (FieldTypeInv0 (type f_2))))
 (=> (and (and (and (and (and (and (= (type Heap@@17) (MapType0Type RefType)) (= (type ExhaleHeap@@3) (MapType0Type RefType))) (= (type Mask@@9) (MapType1Type RefType realType))) (= (type o_1@@0) RefType)) (= (type f_2) (FieldType A@@1 B@@1))) (IdenticalOnKnownLocations Heap@@17 ExhaleHeap@@3 Mask@@9)) (HasDirectPerm Mask@@9 o_1@@0 f_2)) (= (MapType0Select Heap@@17 o_1@@0 f_2) (MapType0Select ExhaleHeap@@3 o_1@@0 f_2)))))
 :qid |Ex2originalbpl.44:22|
 :skolemid |1|
 :pattern ( (IdenticalOnKnownLocations Heap@@17 ExhaleHeap@@3 Mask@@9) (MapType0Select ExhaleHeap@@3 o_1@@0 f_2))
)))
(assert (forall ((Heap@@18 T@U) (ExhaleHeap@@4 T@U) (Mask@@10 T@U) (o_2@@0 T@U) (f_4 T@U) ) (! (let ((B@@2 (FieldTypeInv1 (type f_4))))
(let ((A@@2 (FieldTypeInv0 (type f_4))))
 (=> (and (and (and (and (and (and (= (type Heap@@18) (MapType0Type RefType)) (= (type ExhaleHeap@@4) (MapType0Type RefType))) (= (type Mask@@10) (MapType1Type RefType realType))) (= (type o_2@@0) RefType)) (= (type f_4) (FieldType A@@2 B@@2))) (IdenticalOnKnownLocationsLiberal Heap@@18 ExhaleHeap@@4 Mask@@10)) (HasDirectPerm Mask@@10 o_2@@0 f_4)) (= (MapType0Select Heap@@18 o_2@@0 f_4) (MapType0Select ExhaleHeap@@4 o_2@@0 f_4)))))
 :qid |Ex2originalbpl.105:22|
 :skolemid |14|
 :pattern ( (IdenticalOnKnownLocationsLiberal Heap@@18 ExhaleHeap@@4 Mask@@10) (MapType0Select ExhaleHeap@@4 o_2@@0 f_4))
)))
(assert (forall ((T@@13 T@T) ) (! (= (|Seq#Length| (|Seq#Empty| T@@13)) 0)
 :skolemid |35|
)))
(assert  (and (= (type dummyHeap) (MapType0Type RefType)) (= (type ZeroMask) (MapType1Type RefType realType))))
(assert (state dummyHeap ZeroMask))
(assert (forall ((p T@U) (v_1 T@U) (w T@U) ) (! (let ((A@@3 (FieldTypeInv0 (type p))))
 (=> (and (and (= (type p) (FieldType A@@3 FrameTypeType)) (= (type v_1) FrameTypeType)) (= (type w) FrameTypeType)) (not (InsidePredicate p v_1 p w))))
 :qid |Ex2originalbpl.233:19|
 :skolemid |33|
 :pattern ( (InsidePredicate p v_1 p w))
)))
(assert (forall ((arg0@@50 T@U) (arg1@@20 T@U) ) (! (let ((T@@14 (SeqTypeInv0 (type arg0@@50))))
(= (type (|Seq#Append| arg0@@50 arg1@@20)) (SeqType T@@14)))
 :qid |funType:Seq#Append|
 :pattern ( (|Seq#Append| arg0@@50 arg1@@20))
)))
(assert (forall ((s0 T@U) (s1 T@U) (n@@5 Int) ) (! (let ((T@@15 (SeqTypeInv0 (type s0))))
 (=> (and (= (type s0) (SeqType T@@15)) (= (type s1) (SeqType T@@15))) (=> (and (and (and (not (= s0 (|Seq#Empty| T@@15))) (not (= s1 (|Seq#Empty| T@@15)))) (<= (|Seq#Length| s0) n@@5)) (< n@@5 (|Seq#Length| (|Seq#Append| s0 s1)))) (and (= (|Seq#Add| (|Seq#Sub| n@@5 (|Seq#Length| s0)) (|Seq#Length| s0)) n@@5) (= (|Seq#Index| (|Seq#Append| s0 s1) n@@5) (|Seq#Index| s1 (|Seq#Sub| n@@5 (|Seq#Length| s0))))))))
 :qid |Ex2originalbpl.301:18|
 :skolemid |44|
 :pattern ( (|Seq#Index| (|Seq#Append| s0 s1) n@@5))
)))
(assert (forall ((_l_data T@U) (_r_data T@U) ) (!  (=> (and (and (= (type _l_data) (SeqType intType)) (= (type _r_data) (SeqType intType))) (|Seq#Equal| _l_data _r_data)) (= (cons$Snap$Array$3$usize$__$TY$__Seq$$int$$Snap$Array$3$usize _l_data) (cons$Snap$Array$3$usize$__$TY$__Seq$$int$$Snap$Array$3$usize _r_data)))
 :qid |Ex2originalbpl.629:15|
 :skolemid |72|
 :pattern ( (cons$Snap$Array$3$usize$__$TY$__Seq$$int$$Snap$Array$3$usize _l_data) (cons$Snap$Array$3$usize$__$TY$__Seq$$int$$Snap$Array$3$usize _r_data))
)))
(assert  (not (IsPredicateField tuple_0)))
(assert  (not (IsWandField tuple_0)))
(assert  (not (IsPredicateField tuple_1)))
(assert  (not (IsWandField tuple_1)))
(assert  (not (IsPredicateField val_bool)))
(assert  (not (IsWandField val_bool)))
(assert  (not (IsPredicateField val_int)))
(assert  (not (IsWandField val_int)))
(assert  (not (IsPredicateField val_ref)))
(assert  (not (IsWandField val_ref)))
(assert (forall ((Heap@@19 T@U) (ExhaleHeap@@5 T@U) (Mask@@11 T@U) ) (!  (=> (and (and (and (= (type Heap@@19) (MapType0Type RefType)) (= (type ExhaleHeap@@5) (MapType0Type RefType))) (= (type Mask@@11) (MapType1Type RefType realType))) (IdenticalOnKnownLocations Heap@@19 ExhaleHeap@@5 Mask@@11)) (succHeap Heap@@19 ExhaleHeap@@5))
 :qid |Ex2originalbpl.85:15|
 :skolemid |10|
 :pattern ( (IdenticalOnKnownLocations Heap@@19 ExhaleHeap@@5 Mask@@11))
)))
(assert (forall ((Heap@@20 T@U) (ExhaleHeap@@6 T@U) (Mask@@12 T@U) ) (!  (=> (and (and (and (= (type Heap@@20) (MapType0Type RefType)) (= (type ExhaleHeap@@6) (MapType0Type RefType))) (= (type Mask@@12) (MapType1Type RefType realType))) (IdenticalOnKnownLocationsLiberal Heap@@20 ExhaleHeap@@6 Mask@@12)) (succHeap Heap@@20 ExhaleHeap@@6))
 :qid |Ex2originalbpl.90:15|
 :skolemid |11|
 :pattern ( (IdenticalOnKnownLocationsLiberal Heap@@20 ExhaleHeap@@6 Mask@@12))
)))
(assert (forall ((Heap@@21 T@U) (Mask@@13 T@U) (self@@18 T@U) (start@@1 Int) ) (!  (=> (and (and (and (and (and (= (type Heap@@21) (MapType0Type RefType)) (= (type Mask@@13) (MapType1Type RefType realType))) (= (type self@@18) RefType)) (and (state Heap@@21 Mask@@13) (or (< AssumeFunctionsAbove 1) (|seq_collect$Array$3$usize$__$TY$__Array$3$usize$$int$$Seq$$int$#trigger| (ConditionalFrame (read$ Heap@@21) (MapType0Select Heap@@21 null (Array$3$usize self@@18))) self@@18 start@@1)))) (<= 0 start@@1)) (< start@@1 3)) (= (|Seq#Length| (|seq_collect$Array$3$usize$__$TY$__Array$3$usize$$int$$Seq$$int$'| Heap@@21 self@@18 start@@1)) (- 3 start@@1)))
 :qid |Ex2originalbpl.780:15|
 :skolemid |83|
 :pattern ( (state Heap@@21 Mask@@13) (|seq_collect$Array$3$usize$__$TY$__Array$3$usize$$int$$Seq$$int$'| Heap@@21 self@@18 start@@1))
)))
(assert (forall ((ResultMask T@U) (SummandMask1 T@U) (SummandMask2 T@U) (o_3 T@U) (f_5 T@U) ) (! (let ((B@@3 (FieldTypeInv1 (type f_5))))
(let ((A@@4 (FieldTypeInv0 (type f_5))))
 (=> (and (and (and (and (and (= (type ResultMask) (MapType1Type RefType realType)) (= (type SummandMask1) (MapType1Type RefType realType))) (= (type SummandMask2) (MapType1Type RefType realType))) (= (type o_3) RefType)) (= (type f_5) (FieldType A@@4 B@@3))) (sumMask ResultMask SummandMask1 SummandMask2)) (= (U_2_real (MapType1Select ResultMask o_3 f_5)) (+ (U_2_real (MapType1Select SummandMask1 o_3 f_5)) (U_2_real (MapType1Select SummandMask2 o_3 f_5)))))))
 :qid |Ex2originalbpl.195:22|
 :skolemid |30|
 :pattern ( (sumMask ResultMask SummandMask1 SummandMask2) (MapType1Select ResultMask o_3 f_5))
 :pattern ( (sumMask ResultMask SummandMask1 SummandMask2) (MapType1Select SummandMask1 o_3 f_5))
 :pattern ( (sumMask ResultMask SummandMask1 SummandMask2) (MapType1Select SummandMask2 o_3 f_5))
)))
(assert (forall ((p@@0 Real) (f_7 T@U) ) (!  (=> (= (type f_7) FrameTypeType) (= (ConditionalFrame p@@0 f_7) (ite (> p@@0 0.0) f_7 EmptyFrame)))
 :qid |Ex2originalbpl.221:15|
 :skolemid |31|
 :pattern ( (ConditionalFrame p@@0 f_7))
)))
(assert (forall ((q@min@@0 Int) (q@max@@0 Int) (j@@3 Int) ) (!  (=> (and (<= 0 j@@3) (< j@@3 (- q@max@@0 q@min@@0))) (= (U_2_int (|Seq#Index| (|Seq#Range| q@min@@0 q@max@@0) j@@3)) (+ q@min@@0 j@@3)))
 :qid |Ex2originalbpl.592:15|
 :skolemid |68|
 :pattern ( (|Seq#Index| (|Seq#Range| q@min@@0 q@max@@0) j@@3))
)))
(assert (forall ((Heap@@22 T@U) ) (!  (=> (= (type Heap@@22) (MapType0Type RefType)) (and (= (read$ Heap@@22) (|read$'| Heap@@22)) (dummyFunction (real_2_U |read$#triggerStateless|))))
 :qid |Ex2originalbpl.857:15|
 :skolemid |93|
 :pattern ( (read$ Heap@@22))
)))
(assert (forall ((self@@19 T@U) (idx_1@@0 Int) ) (!  (=> (= (type self@@19) Snap$Array$3$usizeDomainTypeType) (and (<= 0 (read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$ self@@19 idx_1@@0)) (<= (read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$ self@@19 idx_1@@0) 18446744073709551615)))
 :qid |Ex2originalbpl.641:15|
 :skolemid |74|
 :pattern ( (read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$ self@@19 idx_1@@0))
)))
(assert (forall ((Mask@@14 T@U) (o_3@@0 T@U) (f_5@@0 T@U) ) (! (let ((B@@4 (FieldTypeInv1 (type f_5@@0))))
(let ((A@@5 (FieldTypeInv0 (type f_5@@0))))
 (=> (and (and (= (type Mask@@14) (MapType1Type RefType realType)) (= (type o_3@@0) RefType)) (= (type f_5@@0) (FieldType A@@5 B@@4))) (= (HasDirectPerm Mask@@14 o_3@@0 f_5@@0) (> (U_2_real (MapType1Select Mask@@14 o_3@@0 f_5@@0)) NoPerm)))))
 :qid |Ex2originalbpl.190:22|
 :skolemid |29|
 :pattern ( (HasDirectPerm Mask@@14 o_3@@0 f_5@@0))
)))
(assert (forall ((s0@@0 T@U) (s1@@0 T@U) ) (! (let ((T@@16 (SeqTypeInv0 (type s0@@0))))
 (=> (and (and (= (type s0@@0) (SeqType T@@16)) (= (type s1@@0) (SeqType T@@16))) (and (not (= s0@@0 (|Seq#Empty| T@@16))) (not (= s1@@0 (|Seq#Empty| T@@16))))) (= (|Seq#Length| (|Seq#Append| s0@@0 s1@@0)) (+ (|Seq#Length| s0@@0) (|Seq#Length| s1@@0)))))
 :qid |Ex2originalbpl.270:18|
 :skolemid |38|
 :pattern ( (|Seq#Length| (|Seq#Append| s0@@0 s1@@0)))
)))
(assert (forall ((s@@6 T@U) (t T@U) (n@@6 Int) ) (! (let ((T@@17 (SeqTypeInv0 (type s@@6))))
 (=> (and (and (= (type s@@6) (SeqType T@@17)) (= (type t) (SeqType T@@17))) (and (> n@@6 0) (> n@@6 (|Seq#Length| s@@6)))) (and (= (|Seq#Add| (|Seq#Sub| n@@6 (|Seq#Length| s@@6)) (|Seq#Length| s@@6)) n@@6) (= (|Seq#Drop| (|Seq#Append| s@@6 t) n@@6) (|Seq#Drop| t (|Seq#Sub| n@@6 (|Seq#Length| s@@6)))))))
 :qid |Ex2originalbpl.426:18|
 :skolemid |56|
 :pattern ( (|Seq#Drop| (|Seq#Append| s@@6 t) n@@6))
)))
(assert (forall ((Heap@@23 T@U) (self@@20 T@U) (idx_1@@1 Int) ) (!  (=> (and (= (type Heap@@23) (MapType0Type RefType)) (= (type self@@20) RefType)) (and (= (lookup_pure__$TY$__Array$3$usize$usize$Array$3$usize$$int$$$int$ Heap@@23 self@@20 idx_1@@1) (|lookup_pure__$TY$__Array$3$usize$usize$Array$3$usize$$int$$$int$'| Heap@@23 self@@20 idx_1@@1)) (dummyFunction (int_2_U (|lookup_pure__$TY$__Array$3$usize$usize$Array$3$usize$$int$$$int$#triggerStateless| self@@20 idx_1@@1)))))
 :qid |Ex2originalbpl.722:15|
 :skolemid |75|
 :pattern ( (lookup_pure__$TY$__Array$3$usize$usize$Array$3$usize$$int$$$int$ Heap@@23 self@@20 idx_1@@1))
)))
(assert (forall ((Heap@@24 T@U) (self@@21 T@U) (start@@2 Int) ) (!  (=> (and (= (type Heap@@24) (MapType0Type RefType)) (= (type self@@21) RefType)) (and (= (seq_collect$Array$3$usize$__$TY$__Array$3$usize$$int$$Seq$$int$ Heap@@24 self@@21 start@@2) (|seq_collect$Array$3$usize$__$TY$__Array$3$usize$$int$$Seq$$int$'| Heap@@24 self@@21 start@@2)) (dummyFunction (|seq_collect$Array$3$usize$__$TY$__Array$3$usize$$int$$Seq$$int$#triggerStateless| self@@21 start@@2))))
 :qid |Ex2originalbpl.753:15|
 :skolemid |78|
 :pattern ( (seq_collect$Array$3$usize$__$TY$__Array$3$usize$$int$$Seq$$int$ Heap@@24 self@@21 start@@2))
)))
(assert (forall ((o_3@@1 T@U) (f_5@@1 T@U) ) (! (let ((B@@5 (FieldTypeInv1 (type f_5@@1))))
(let ((A@@6 (FieldTypeInv0 (type f_5@@1))))
 (=> (and (= (type o_3@@1) RefType) (= (type f_5@@1) (FieldType A@@6 B@@5))) (= (U_2_real (MapType1Select ZeroMask o_3@@1 f_5@@1)) NoPerm))))
 :qid |Ex2originalbpl.163:22|
 :skolemid |25|
 :pattern ( (MapType1Select ZeroMask o_3@@1 f_5@@1))
)))
(assert (forall ((s@@7 T@U) (t@@0 T@U) (n@@7 Int) ) (! (let ((T@@18 (SeqTypeInv0 (type s@@7))))
 (=> (and (and (= (type s@@7) (SeqType T@@18)) (= (type t@@0) (SeqType T@@18))) (and (> n@@7 0) (> n@@7 (|Seq#Length| s@@7)))) (and (= (|Seq#Add| (|Seq#Sub| n@@7 (|Seq#Length| s@@7)) (|Seq#Length| s@@7)) n@@7) (= (|Seq#Take| (|Seq#Append| s@@7 t@@0) n@@7) (|Seq#Append| s@@7 (|Seq#Take| t@@0 (|Seq#Sub| n@@7 (|Seq#Length| s@@7))))))))
 :qid |Ex2originalbpl.413:18|
 :skolemid |54|
 :pattern ( (|Seq#Take| (|Seq#Append| s@@7 t@@0) n@@7))
)))
(assert (forall ((Heap@@25 T@U) (Heap1@@1 T@U) (Mask1 T@U) (Heap2@@0 T@U) (Mask2 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@25) (MapType0Type RefType)) (= (type Heap1@@1) (MapType0Type RefType))) (= (type Mask1) (MapType1Type RefType realType))) (= (type Heap2@@0) (MapType0Type RefType))) (= (type Mask2) (MapType1Type RefType realType))) (= (SumHeap Heap@@25 Heap1@@1 Mask1 Heap2@@0 Mask2)  (and (IdenticalOnKnownLocationsLiberal Heap1@@1 Heap@@25 Mask1) (IdenticalOnKnownLocationsLiberal Heap2@@0 Heap@@25 Mask2))))
 :qid |Ex2originalbpl.150:15|
 :skolemid |24|
 :pattern ( (SumHeap Heap@@25 Heap1@@1 Mask1 Heap2@@0 Mask2))
)))
(assert (forall ((q@min@@1 Int) (q@max@@1 Int) ) (!  (and (=> (< q@min@@1 q@max@@1) (= (|Seq#Length| (|Seq#Range| q@min@@1 q@max@@1)) (- q@max@@1 q@min@@1))) (=> (<= q@max@@1 q@min@@1) (= (|Seq#Length| (|Seq#Range| q@min@@1 q@max@@1)) 0)))
 :qid |Ex2originalbpl.591:15|
 :skolemid |67|
 :pattern ( (|Seq#Length| (|Seq#Range| q@min@@1 q@max@@1)))
)))
(assert (forall ((data_1@@0 T@U) (idx_1@@2 Int) ) (!  (=> (= (type data_1@@0) (SeqType intType)) (= (read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$ (cons$Snap$Array$3$usize$__$TY$__Seq$$int$$Snap$Array$3$usize data_1@@0) idx_1@@2) (U_2_int (|Seq#Index| data_1@@0 idx_1@@2))))
 :qid |Ex2originalbpl.635:15|
 :skolemid |73|
 :pattern ( (read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$ (cons$Snap$Array$3$usize$__$TY$__Seq$$int$$Snap$Array$3$usize data_1@@0) idx_1@@2))
 :pattern ( (|Seq#Index| data_1@@0 idx_1@@2))
)))
(assert (forall ((a T@U) (b T@U) ) (! (let ((T@@19 (SeqTypeInv0 (type a))))
 (=> (and (and (= (type a) (SeqType T@@19)) (= (type b) (SeqType T@@19))) (|Seq#Equal| a b)) (= a b)))
 :qid |Ex2originalbpl.564:18|
 :skolemid |65|
 :pattern ( (|Seq#Equal| a b))
)))
(assert (forall ((s@@8 T@U) (i@@3 Int) ) (! (let ((T@@20 (SeqTypeInv0 (type s@@8))))
 (=> (= (type s@@8) (SeqType T@@20)) (=> (and (<= 0 i@@3) (< i@@3 (|Seq#Length| s@@8))) (|Seq#ContainsTrigger| s@@8 (|Seq#Index| s@@8 i@@3)))))
 :qid |Ex2originalbpl.457:18|
 :skolemid |61|
 :pattern ( (|Seq#Index| s@@8 i@@3))
)))
(assert (forall ((s0@@1 T@U) (s1@@1 T@U) ) (! (let ((T@@21 (SeqTypeInv0 (type s0@@1))))
 (=> (and (= (type s0@@1) (SeqType T@@21)) (= (type s1@@1) (SeqType T@@21))) (and (=> (= s0@@1 (|Seq#Empty| T@@21)) (= (|Seq#Append| s0@@1 s1@@1) s1@@1)) (=> (= s1@@1 (|Seq#Empty| T@@21)) (= (|Seq#Append| s0@@1 s1@@1) s0@@1)))))
 :qid |Ex2originalbpl.276:18|
 :skolemid |39|
 :pattern ( (|Seq#Append| s0@@1 s1@@1))
)))
(assert (forall ((t@@1 T@U) ) (! (= (|Seq#Index| (|Seq#Singleton| t@@1) 0) t@@1)
 :qid |Ex2originalbpl.280:18|
 :skolemid |40|
 :pattern ( (|Seq#Singleton| t@@1))
)))
(assert (forall ((s@@9 T@U) ) (! (let ((T@@22 (SeqTypeInv0 (type s@@9))))
 (=> (= (type s@@9) (SeqType T@@22)) (<= 0 (|Seq#Length| s@@9))))
 :qid |Ex2originalbpl.259:18|
 :skolemid |34|
 :pattern ( (|Seq#Length| s@@9))
)))
(assert (forall ((Heap@@26 T@U) (Mask@@15 T@U) (self@@22 T@U) (start@@3 Int) ) (!  (=> (and (and (and (and (and (= (type Heap@@26) (MapType0Type RefType)) (= (type Mask@@15) (MapType1Type RefType realType))) (= (type self@@22) RefType)) (and (state Heap@@26 Mask@@15) (or (< AssumeFunctionsAbove 1) (|seq_collect$Array$3$usize$__$TY$__Array$3$usize$$int$$Seq$$int$#trigger| (ConditionalFrame (read$ Heap@@26) (MapType0Select Heap@@26 null (Array$3$usize self@@22))) self@@22 start@@3)))) (<= 0 start@@3)) (< start@@3 3)) (forall ((i@@4 Int) (j@@4 Int) ) (!  (=> (and (<= start@@3 i@@4) (and (< i@@4 3) (and (<= 0 j@@4) (and (< j@@4 (- 3 start@@3)) (= i@@4 (+ j@@4 start@@3)))))) (= (lookup_pure__$TY$__Array$3$usize$usize$Array$3$usize$$int$$$int$ Heap@@26 self@@22 i@@4) (U_2_int (|Seq#Index| (|seq_collect$Array$3$usize$__$TY$__Array$3$usize$$int$$Seq$$int$'| Heap@@26 self@@22 start@@3) j@@4))))
 :qid |Ex2originalbpl.790:244|
 :skolemid |85|
 :pattern ( (|lookup_pure__$TY$__Array$3$usize$usize$Array$3$usize$$int$$$int$#frame| (ConditionalFrame (read$ Heap@@26) (MapType0Select Heap@@26 null (Array$3$usize self@@22))) self@@22 i@@4) (|Seq#Index| (|seq_collect$Array$3$usize$__$TY$__Array$3$usize$$int$$Seq$$int$'| Heap@@26 self@@22 start@@3) j@@4))
)))
 :qid |Ex2originalbpl.788:15|
 :skolemid |86|
 :pattern ( (state Heap@@26 Mask@@15) (|seq_collect$Array$3$usize$__$TY$__Array$3$usize$$int$$Seq$$int$'| Heap@@26 self@@22 start@@3))
)))
(assert (forall ((s0@@2 T@U) (s1@@2 T@U) ) (! (let ((T@@23 (SeqTypeInv0 (type s0@@2))))
 (=> (and (and (= (type s0@@2) (SeqType T@@23)) (= (type s1@@2) (SeqType T@@23))) (|Seq#Equal| s0@@2 s1@@2)) (and (= (|Seq#Length| s0@@2) (|Seq#Length| s1@@2)) (forall ((j@@5 Int) ) (!  (=> (and (<= 0 j@@5) (< j@@5 (|Seq#Length| s0@@2))) (= (|Seq#Index| s0@@2 j@@5) (|Seq#Index| s1@@2 j@@5)))
 :qid |Ex2originalbpl.554:13|
 :skolemid |62|
 :pattern ( (|Seq#Index| s0@@2 j@@5))
 :pattern ( (|Seq#Index| s1@@2 j@@5))
)))))
 :qid |Ex2originalbpl.551:18|
 :skolemid |63|
 :pattern ( (|Seq#Equal| s0@@2 s1@@2))
)))
(assert (forall ((Heap@@27 T@U) (ExhaleHeap@@7 T@U) (Mask@@16 T@U) (pm_f@@1 T@U) ) (! (let ((C@@1 (FieldTypeInv0 (type pm_f@@1))))
 (=> (and (and (and (and (and (= (type Heap@@27) (MapType0Type RefType)) (= (type ExhaleHeap@@7) (MapType0Type RefType))) (= (type Mask@@16) (MapType1Type RefType realType))) (= (type pm_f@@1) (FieldType C@@1 FrameTypeType))) (IdenticalOnKnownLocations Heap@@27 ExhaleHeap@@7 Mask@@16)) (and (HasDirectPerm Mask@@16 null pm_f@@1) (IsPredicateField pm_f@@1))) (forall ((o2 T@U) (f_2@@0 T@U) ) (! (let ((B@@6 (FieldTypeInv1 (type f_2@@0))))
(let ((A@@7 (FieldTypeInv0 (type f_2@@0))))
 (=> (and (and (= (type o2) RefType) (= (type f_2@@0) (FieldType A@@7 B@@6))) (U_2_bool (MapType1Select (MapType0Select Heap@@27 null (PredicateMaskField pm_f@@1)) o2 f_2@@0))) (= (MapType0Select Heap@@27 o2 f_2@@0) (MapType0Select ExhaleHeap@@7 o2 f_2@@0)))))
 :qid |Ex2originalbpl.56:134|
 :skolemid |3|
 :pattern ( (MapType0Select ExhaleHeap@@7 o2 f_2@@0))
))))
 :qid |Ex2originalbpl.54:19|
 :skolemid |4|
 :pattern ( (IdenticalOnKnownLocations Heap@@27 ExhaleHeap@@7 Mask@@16) (IsPredicateField pm_f@@1))
)))
(assert (forall ((Heap@@28 T@U) (ExhaleHeap@@8 T@U) (Mask@@17 T@U) (pm_f@@2 T@U) ) (! (let ((C@@2 (FieldTypeInv0 (type pm_f@@2))))
 (=> (and (and (and (and (and (= (type Heap@@28) (MapType0Type RefType)) (= (type ExhaleHeap@@8) (MapType0Type RefType))) (= (type Mask@@17) (MapType1Type RefType realType))) (= (type pm_f@@2) (FieldType C@@2 FrameTypeType))) (IdenticalOnKnownLocations Heap@@28 ExhaleHeap@@8 Mask@@17)) (and (HasDirectPerm Mask@@17 null pm_f@@2) (IsWandField pm_f@@2))) (forall ((o2@@0 T@U) (f_2@@1 T@U) ) (! (let ((B@@7 (FieldTypeInv1 (type f_2@@1))))
(let ((A@@8 (FieldTypeInv0 (type f_2@@1))))
 (=> (and (and (= (type o2@@0) RefType) (= (type f_2@@1) (FieldType A@@8 B@@7))) (U_2_bool (MapType1Select (MapType0Select Heap@@28 null (WandMaskField pm_f@@2)) o2@@0 f_2@@1))) (= (MapType0Select Heap@@28 o2@@0 f_2@@1) (MapType0Select ExhaleHeap@@8 o2@@0 f_2@@1)))))
 :qid |Ex2originalbpl.69:129|
 :skolemid |6|
 :pattern ( (MapType0Select ExhaleHeap@@8 o2@@0 f_2@@1))
))))
 :qid |Ex2originalbpl.67:19|
 :skolemid |7|
 :pattern ( (IdenticalOnKnownLocations Heap@@28 ExhaleHeap@@8 Mask@@17) (IsWandField pm_f@@2))
)))
(assert (forall ((Heap@@29 T@U) (ExhaleHeap@@9 T@U) (Mask@@18 T@U) (pm_f_1 T@U) ) (! (let ((C@@3 (FieldTypeInv0 (type pm_f_1))))
 (=> (and (and (and (and (and (= (type Heap@@29) (MapType0Type RefType)) (= (type ExhaleHeap@@9) (MapType0Type RefType))) (= (type Mask@@18) (MapType1Type RefType realType))) (= (type pm_f_1) (FieldType C@@3 FrameTypeType))) (IdenticalOnKnownLocationsLiberal Heap@@29 ExhaleHeap@@9 Mask@@18)) (and (HasDirectPerm Mask@@18 null pm_f_1) (IsPredicateField pm_f_1))) (forall ((o2_1 T@U) (f_4@@0 T@U) ) (! (let ((B@@8 (FieldTypeInv1 (type f_4@@0))))
(let ((A@@9 (FieldTypeInv0 (type f_4@@0))))
 (=> (and (and (= (type o2_1) RefType) (= (type f_4@@0) (FieldType A@@9 B@@8))) (U_2_bool (MapType1Select (MapType0Select Heap@@29 null (PredicateMaskField pm_f_1)) o2_1 f_4@@0))) (= (MapType0Select Heap@@29 o2_1 f_4@@0) (MapType0Select ExhaleHeap@@9 o2_1 f_4@@0)))))
 :qid |Ex2originalbpl.120:145|
 :skolemid |17|
 :pattern ( (MapType0Select ExhaleHeap@@9 o2_1 f_4@@0))
))))
 :qid |Ex2originalbpl.118:19|
 :skolemid |18|
 :pattern ( (IdenticalOnKnownLocationsLiberal Heap@@29 ExhaleHeap@@9 Mask@@18) (IsPredicateField pm_f_1))
)))
(assert (forall ((Heap@@30 T@U) (ExhaleHeap@@10 T@U) (Mask@@19 T@U) (pm_f_1@@0 T@U) ) (! (let ((C@@4 (FieldTypeInv0 (type pm_f_1@@0))))
 (=> (and (and (and (and (and (= (type Heap@@30) (MapType0Type RefType)) (= (type ExhaleHeap@@10) (MapType0Type RefType))) (= (type Mask@@19) (MapType1Type RefType realType))) (= (type pm_f_1@@0) (FieldType C@@4 FrameTypeType))) (IdenticalOnKnownLocationsLiberal Heap@@30 ExhaleHeap@@10 Mask@@19)) (and (HasDirectPerm Mask@@19 null pm_f_1@@0) (IsWandField pm_f_1@@0))) (forall ((o2_1@@0 T@U) (f_4@@1 T@U) ) (! (let ((B@@9 (FieldTypeInv1 (type f_4@@1))))
(let ((A@@10 (FieldTypeInv0 (type f_4@@1))))
 (=> (and (and (= (type o2_1@@0) RefType) (= (type f_4@@1) (FieldType A@@10 B@@9))) (U_2_bool (MapType1Select (MapType0Select Heap@@30 null (WandMaskField pm_f_1@@0)) o2_1@@0 f_4@@1))) (= (MapType0Select Heap@@30 o2_1@@0 f_4@@1) (MapType0Select ExhaleHeap@@10 o2_1@@0 f_4@@1)))))
 :qid |Ex2originalbpl.136:140|
 :skolemid |21|
 :pattern ( (MapType0Select ExhaleHeap@@10 o2_1@@0 f_4@@1))
))))
 :qid |Ex2originalbpl.134:19|
 :skolemid |22|
 :pattern ( (IdenticalOnKnownLocationsLiberal Heap@@30 ExhaleHeap@@10 Mask@@19) (IsWandField pm_f_1@@0))
)))
(assert (forall ((self@@23 T@U) ) (!  (=> (= (type self@@23) RefType) (= (getPredWandId (Array$3$usize self@@23)) 0))
 :qid |Ex2originalbpl.906:15|
 :skolemid |100|
 :pattern ( (Array$3$usize self@@23))
)))
(assert (forall ((borrow@@3 Int) ) (! (= (getPredWandId (DeadBorrowToken$ borrow@@3)) 1)
 :qid |Ex2originalbpl.941:15|
 :skolemid |106|
 :pattern ( (DeadBorrowToken$ borrow@@3))
)))
(assert (forall ((self@@24 T@U) ) (!  (=> (= (type self@@24) RefType) (= (getPredWandId (tuple0$ self@@24)) 2))
 :qid |Ex2originalbpl.976:15|
 :skolemid |112|
 :pattern ( (tuple0$ self@@24))
)))
(assert (forall ((self@@25 T@U) ) (!  (=> (= (type self@@25) RefType) (= (getPredWandId (usize self@@25)) 3))
 :qid |Ex2originalbpl.1011:15|
 :skolemid |118|
 :pattern ( (usize self@@25))
)))
(assert (forall ((t@@2 T@U) ) (! (= (|Seq#Length| (|Seq#Singleton| t@@2)) 1)
 :qid |Ex2originalbpl.267:18|
 :skolemid |37|
 :pattern ( (|Seq#Singleton| t@@2))
)))
(assert (forall ((Mask@@20 T@U) (o_3@@2 T@U) (f_5@@2 T@U) ) (! (let ((B@@10 (FieldTypeInv1 (type f_5@@2))))
(let ((A@@11 (FieldTypeInv0 (type f_5@@2))))
 (=> (and (and (and (= (type Mask@@20) (MapType1Type RefType realType)) (= (type o_3@@2) RefType)) (= (type f_5@@2) (FieldType A@@11 B@@10))) (GoodMask Mask@@20)) (and (>= (U_2_real (MapType1Select Mask@@20 o_3@@2 f_5@@2)) NoPerm) (=> (and (and (GoodMask Mask@@20) (not (IsPredicateField f_5@@2))) (not (IsWandField f_5@@2))) (<= (U_2_real (MapType1Select Mask@@20 o_3@@2 f_5@@2)) FullPerm))))))
 :qid |Ex2originalbpl.185:22|
 :skolemid |28|
 :pattern ( (GoodMask Mask@@20) (MapType1Select Mask@@20 o_3@@2 f_5@@2))
)))
(assert (forall ((Heap@@31 T@U) ) (!  (=> (= (type Heap@@31) (MapType0Type RefType)) (dummyFunction (real_2_U |read$#triggerStateless|)))
 :qid |Ex2originalbpl.861:15|
 :skolemid |94|
 :pattern ( (|read$'| Heap@@31))
)))
(assert (forall ((o T@U) (f T@U) (Heap@@32 T@U) ) (!  (=> (and (and (and (= (type o) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap@@32) (MapType0Type RefType))) (U_2_bool (MapType0Select Heap@@32 o $allocated))) (U_2_bool (MapType0Select Heap@@32 (MapType0Select Heap@@32 o f) $allocated)))
 :qid |Ex2originalbpl.31:15|
 :skolemid |0|
 :pattern ( (MapType0Select Heap@@32 o f))
)))
(assert (forall ((s@@10 T@U) (t@@3 T@U) (n@@8 Int) ) (! (let ((T@@24 (SeqTypeInv0 (type s@@10))))
 (=> (and (and (= (type s@@10) (SeqType T@@24)) (= (type t@@3) (SeqType T@@24))) (and (< 0 n@@8) (<= n@@8 (|Seq#Length| s@@10)))) (= (|Seq#Take| (|Seq#Append| s@@10 t@@3) n@@8) (|Seq#Take| s@@10 n@@8))))
 :qid |Ex2originalbpl.409:18|
 :skolemid |53|
 :pattern ( (|Seq#Take| (|Seq#Append| s@@10 t@@3) n@@8))
)))
(assert (forall ((Heap@@33 T@U) (Mask@@21 T@U) (self@@26 T@U) (idx_1@@3 Int) ) (!  (=> (and (and (and (= (type Heap@@33) (MapType0Type RefType)) (= (type Mask@@21) (MapType1Type RefType realType))) (= (type self@@26) RefType)) (state Heap@@33 Mask@@21)) (= (|lookup_pure__$TY$__Array$3$usize$usize$Array$3$usize$$int$$$int$'| Heap@@33 self@@26 idx_1@@3) (|lookup_pure__$TY$__Array$3$usize$usize$Array$3$usize$$int$$$int$#frame| (ConditionalFrame (read$ Heap@@33) (MapType0Select Heap@@33 null (Array$3$usize self@@26))) self@@26 idx_1@@3)))
 :qid |Ex2originalbpl.733:15|
 :skolemid |77|
 :pattern ( (state Heap@@33 Mask@@21) (|lookup_pure__$TY$__Array$3$usize$usize$Array$3$usize$$int$$$int$'| Heap@@33 self@@26 idx_1@@3))
)))
(assert (forall ((arg0@@51 T@U) (arg1@@21 T@U) (arg2@@6 Int) ) (! (= (type (|seq_collect$Array$3$usize$__$TY$__Array$3$usize$$int$$Seq$$int$#frame| arg0@@51 arg1@@21 arg2@@6)) (SeqType intType))
 :qid |funType:seq_collect$Array$3$usize$__$TY$__Array$3$usize$$int$$Seq$$int$#frame|
 :pattern ( (|seq_collect$Array$3$usize$__$TY$__Array$3$usize$$int$$Seq$$int$#frame| arg0@@51 arg1@@21 arg2@@6))
)))
(assert (forall ((Heap@@34 T@U) (Mask@@22 T@U) (self@@27 T@U) (start@@4 Int) ) (!  (=> (and (and (and (= (type Heap@@34) (MapType0Type RefType)) (= (type Mask@@22) (MapType1Type RefType realType))) (= (type self@@27) RefType)) (state Heap@@34 Mask@@22)) (= (|seq_collect$Array$3$usize$__$TY$__Array$3$usize$$int$$Seq$$int$'| Heap@@34 self@@27 start@@4) (|seq_collect$Array$3$usize$__$TY$__Array$3$usize$$int$$Seq$$int$#frame| (ConditionalFrame (read$ Heap@@34) (MapType0Select Heap@@34 null (Array$3$usize self@@27))) self@@27 start@@4)))
 :qid |Ex2originalbpl.770:15|
 :skolemid |81|
 :pattern ( (state Heap@@34 Mask@@22) (|seq_collect$Array$3$usize$__$TY$__Array$3$usize$$int$$Seq$$int$'| Heap@@34 self@@27 start@@4))
)))
(assert (forall ((Heap@@35 T@U) (Mask@@23 T@U) ) (!  (=> (and (and (= (type Heap@@35) (MapType0Type RefType)) (= (type Mask@@23) (MapType1Type RefType realType))) (state Heap@@35 Mask@@23)) (= (|read$'| Heap@@35) (|read$#frame| EmptyFrame)))
 :qid |Ex2originalbpl.868:15|
 :skolemid |95|
 :pattern ( (state Heap@@35 Mask@@23) (|read$'| Heap@@35))
)))
(assert (forall ((s@@11 T@U) (i@@5 Int) (v@@1 T@U) ) (! (let ((T@@25 (type v@@1)))
 (=> (= (type s@@11) (SeqType T@@25)) (=> (and (<= 0 i@@5) (< i@@5 (|Seq#Length| s@@11))) (= (|Seq#Length| (|Seq#Update| s@@11 i@@5 v@@1)) (|Seq#Length| s@@11)))))
 :qid |Ex2originalbpl.308:18|
 :skolemid |46|
 :pattern ( (|Seq#Length| (|Seq#Update| s@@11 i@@5 v@@1)))
 :pattern ( (|Seq#Length| s@@11) (|Seq#Update| s@@11 i@@5 v@@1))
)))
(assert (forall ((Heap@@36 T@U) (Mask@@24 T@U) (self@@28 T@U) (start@@5 Int) ) (!  (=> (and (and (and (and (and (= (type Heap@@36) (MapType0Type RefType)) (= (type Mask@@24) (MapType1Type RefType realType))) (= (type self@@28) RefType)) (and (state Heap@@36 Mask@@24) (or (< AssumeFunctionsAbove 1) (|seq_collect$Array$3$usize$__$TY$__Array$3$usize$$int$$Seq$$int$#trigger| (ConditionalFrame (read$ Heap@@36) (MapType0Select Heap@@36 null (Array$3$usize self@@28))) self@@28 start@@5)))) (<= 0 start@@5)) (< start@@5 3)) (= (U_2_int (|Seq#Index| (|seq_collect$Array$3$usize$__$TY$__Array$3$usize$$int$$Seq$$int$'| Heap@@36 self@@28 start@@5) 0)) (lookup_pure__$TY$__Array$3$usize$usize$Array$3$usize$$int$$$int$ Heap@@36 self@@28 start@@5)))
 :qid |Ex2originalbpl.784:15|
 :skolemid |84|
 :pattern ( (state Heap@@36 Mask@@24) (|seq_collect$Array$3$usize$__$TY$__Array$3$usize$$int$$Seq$$int$'| Heap@@36 self@@28 start@@5))
)))
(assert (forall ((self@@29 T@U) ) (!  (=> (= (type self@@29) RefType) (= (PredicateMaskField (Array$3$usize self@@29)) (|Array$3$usize#sm| self@@29)))
 :qid |Ex2originalbpl.898:15|
 :skolemid |98|
 :pattern ( (PredicateMaskField (Array$3$usize self@@29)))
)))
(assert (forall ((borrow@@4 Int) ) (! (= (PredicateMaskField (DeadBorrowToken$ borrow@@4)) (|DeadBorrowToken$#sm| borrow@@4))
 :qid |Ex2originalbpl.933:15|
 :skolemid |104|
 :pattern ( (PredicateMaskField (DeadBorrowToken$ borrow@@4)))
)))
(assert (forall ((self@@30 T@U) ) (!  (=> (= (type self@@30) RefType) (= (PredicateMaskField (tuple0$ self@@30)) (|tuple0$#sm| self@@30)))
 :qid |Ex2originalbpl.968:15|
 :skolemid |110|
 :pattern ( (PredicateMaskField (tuple0$ self@@30)))
)))
(assert (forall ((self@@31 T@U) ) (!  (=> (= (type self@@31) RefType) (= (PredicateMaskField (usize self@@31)) (|usize#sm| self@@31)))
 :qid |Ex2originalbpl.1003:15|
 :skolemid |116|
 :pattern ( (PredicateMaskField (usize self@@31)))
)))
(assert (forall ((s@@12 T@U) (t@@4 T@U) (n@@9 Int) ) (! (let ((T@@26 (SeqTypeInv0 (type s@@12))))
 (=> (and (and (= (type s@@12) (SeqType T@@26)) (= (type t@@4) (SeqType T@@26))) (and (< 0 n@@9) (<= n@@9 (|Seq#Length| s@@12)))) (= (|Seq#Drop| (|Seq#Append| s@@12 t@@4) n@@9) (|Seq#Append| (|Seq#Drop| s@@12 n@@9) t@@4))))
 :qid |Ex2originalbpl.422:18|
 :skolemid |55|
 :pattern ( (|Seq#Drop| (|Seq#Append| s@@12 t@@4) n@@9))
)))
(assert (forall ((s@@13 T@U) (n@@10 Int) (i@@6 Int) ) (! (let ((T@@27 (SeqTypeInv0 (type s@@13))))
 (=> (= (type s@@13) (SeqType T@@27)) (=> (and (and (< 0 n@@10) (<= n@@10 i@@6)) (< i@@6 (|Seq#Length| s@@13))) (and (= (|Seq#Add| (|Seq#Sub| i@@6 n@@10) n@@10) i@@6) (= (|Seq#Index| (|Seq#Drop| s@@13 n@@10) (|Seq#Sub| i@@6 n@@10)) (|Seq#Index| s@@13 i@@6))))))
 :qid |Ex2originalbpl.359:18|
 :skolemid |52|
 :pattern ( (|Seq#Drop| s@@13 n@@10) (|Seq#Index| s@@13 i@@6))
)))
(assert (forall ((s0@@3 T@U) (s1@@3 T@U) (n@@11 Int) ) (! (let ((T@@28 (SeqTypeInv0 (type s0@@3))))
 (=> (and (= (type s0@@3) (SeqType T@@28)) (= (type s1@@3) (SeqType T@@28))) (=> (and (and (and (not (= s0@@3 (|Seq#Empty| T@@28))) (not (= s1@@3 (|Seq#Empty| T@@28)))) (<= 0 n@@11)) (< n@@11 (|Seq#Length| s0@@3))) (= (|Seq#Index| (|Seq#Append| s0@@3 s1@@3) n@@11) (|Seq#Index| s0@@3 n@@11)))))
 :qid |Ex2originalbpl.299:18|
 :skolemid |43|
 :pattern ( (|Seq#Index| (|Seq#Append| s0@@3 s1@@3) n@@11))
 :pattern ( (|Seq#Index| s0@@3 n@@11) (|Seq#Append| s0@@3 s1@@3))
)))
(assert (forall ((Heap@@37 T@U) (o@@0 T@U) (f_3 T@U) (v@@2 T@U) ) (! (let ((B@@11 (type v@@2)))
(let ((A@@12 (FieldTypeInv0 (type f_3))))
 (=> (and (and (= (type Heap@@37) (MapType0Type RefType)) (= (type o@@0) RefType)) (= (type f_3) (FieldType A@@12 B@@11))) (succHeap Heap@@37 (MapType0Store Heap@@37 o@@0 f_3 v@@2)))))
 :qid |Ex2originalbpl.80:22|
 :skolemid |9|
 :pattern ( (MapType0Store Heap@@37 o@@0 f_3 v@@2))
)))
(assert (forall ((arg0@@52 T@U) (arg1@@22 T@U) ) (! (= (type (|snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize#frame| arg0@@52 arg1@@22)) Snap$Array$3$usizeDomainTypeType)
 :qid |funType:snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize#frame|
 :pattern ( (|snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize#frame| arg0@@52 arg1@@22))
)))
(assert (forall ((Heap@@38 T@U) (Mask@@25 T@U) (self@@32 T@U) ) (!  (=> (and (and (and (= (type Heap@@38) (MapType0Type RefType)) (= (type Mask@@25) (MapType1Type RefType realType))) (= (type self@@32) RefType)) (state Heap@@38 Mask@@25)) (= (|snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize'| Heap@@38 self@@32) (|snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize#frame| (ConditionalFrame (read$ Heap@@38) (MapType0Select Heap@@38 null (Array$3$usize self@@32))) self@@32)))
 :qid |Ex2originalbpl.828:15|
 :skolemid |90|
 :pattern ( (state Heap@@38 Mask@@25) (|snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize'| Heap@@38 self@@32))
)))
(assert (forall ((s0@@4 T@U) (s1@@4 T@U) (m@@7 Int) ) (! (let ((T@@29 (SeqTypeInv0 (type s0@@4))))
 (=> (and (= (type s0@@4) (SeqType T@@29)) (= (type s1@@4) (SeqType T@@29))) (=> (and (and (and (not (= s0@@4 (|Seq#Empty| T@@29))) (not (= s1@@4 (|Seq#Empty| T@@29)))) (<= 0 m@@7)) (< m@@7 (|Seq#Length| s1@@4))) (and (= (|Seq#Sub| (|Seq#Add| m@@7 (|Seq#Length| s0@@4)) (|Seq#Length| s0@@4)) m@@7) (= (|Seq#Index| (|Seq#Append| s0@@4 s1@@4) (|Seq#Add| m@@7 (|Seq#Length| s0@@4))) (|Seq#Index| s1@@4 m@@7))))))
 :qid |Ex2originalbpl.304:18|
 :skolemid |45|
 :pattern ( (|Seq#Index| s1@@4 m@@7) (|Seq#Append| s0@@4 s1@@4))
)))
(assert (= (type ZeroPMask) (MapType1Type RefType boolType)))
(assert (forall ((o_3@@3 T@U) (f_5@@3 T@U) ) (! (let ((B@@12 (FieldTypeInv1 (type f_5@@3))))
(let ((A@@13 (FieldTypeInv0 (type f_5@@3))))
 (=> (and (= (type o_3@@3) RefType) (= (type f_5@@3) (FieldType A@@13 B@@12))) (not (U_2_bool (MapType1Select ZeroPMask o_3@@3 f_5@@3))))))
 :qid |Ex2originalbpl.169:22|
 :skolemid |26|
 :pattern ( (MapType1Select ZeroPMask o_3@@3 f_5@@3))
)))
(assert (forall ((s@@14 T@U) (x@@10 T@U) (i@@7 Int) ) (! (let ((T@@30 (type x@@10)))
 (=> (= (type s@@14) (SeqType T@@30)) (=> (and (and (<= 0 i@@7) (< i@@7 (|Seq#Length| s@@14))) (= (|Seq#Index| s@@14 i@@7) x@@10)) (|Seq#Contains| s@@14 x@@10))))
 :qid |Ex2originalbpl.455:18|
 :skolemid |60|
 :pattern ( (|Seq#Contains| s@@14 x@@10) (|Seq#Index| s@@14 i@@7))
)))
(assert (forall ((s0@@5 T@U) (s1@@5 T@U) ) (! (let ((T@@31 (SeqTypeInv0 (type s0@@5))))
 (=> (and (= (type s0@@5) (SeqType T@@31)) (= (type s1@@5) (SeqType T@@31))) (or (or (and (= s0@@5 s1@@5) (|Seq#Equal| s0@@5 s1@@5)) (and (and (not (= s0@@5 s1@@5)) (not (|Seq#Equal| s0@@5 s1@@5))) (not (= (|Seq#Length| s0@@5) (|Seq#Length| s1@@5))))) (and (and (and (and (and (and (not (= s0@@5 s1@@5)) (not (|Seq#Equal| s0@@5 s1@@5))) (= (|Seq#Length| s0@@5) (|Seq#Length| s1@@5))) (= (|Seq#SkolemDiff| s0@@5 s1@@5) (|Seq#SkolemDiff| s1@@5 s0@@5))) (<= 0 (|Seq#SkolemDiff| s0@@5 s1@@5))) (< (|Seq#SkolemDiff| s0@@5 s1@@5) (|Seq#Length| s0@@5))) (not (= (|Seq#Index| s0@@5 (|Seq#SkolemDiff| s0@@5 s1@@5)) (|Seq#Index| s1@@5 (|Seq#SkolemDiff| s0@@5 s1@@5))))))))
 :qid |Ex2originalbpl.559:18|
 :skolemid |64|
 :pattern ( (|Seq#Equal| s0@@5 s1@@5))
)))
(assert (forall ((p@@1 T@U) (v_1@@0 T@U) (q T@U) (w@@0 T@U) (r T@U) (u T@U) ) (! (let ((C@@5 (FieldTypeInv0 (type r))))
(let ((B@@13 (FieldTypeInv0 (type q))))
(let ((A@@14 (FieldTypeInv0 (type p@@1))))
 (=> (and (and (and (and (and (and (= (type p@@1) (FieldType A@@14 FrameTypeType)) (= (type v_1@@0) FrameTypeType)) (= (type q) (FieldType B@@13 FrameTypeType))) (= (type w@@0) FrameTypeType)) (= (type r) (FieldType C@@5 FrameTypeType))) (= (type u) FrameTypeType)) (and (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))) (InsidePredicate p@@1 v_1@@0 r u)))))
 :qid |Ex2originalbpl.228:25|
 :skolemid |32|
 :pattern ( (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))
)))
(assert (forall ((data_1@@1 T@U) ) (!  (=> (= (type data_1@@1) Snap$Array$3$usizeDomainTypeType) (= (cons$Snap$Array$3$usize$__$TY$__Seq$$int$$Snap$Array$3$usize (uncons$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$Seq$$int$ data_1@@1)) data_1@@1))
 :qid |Ex2originalbpl.623:15|
 :skolemid |71|
 :pattern ( (uncons$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$Seq$$int$ data_1@@1))
)))
(assert (forall ((Heap@@39 T@U) (ExhaleHeap@@11 T@U) (Mask@@26 T@U) (pm_f_1@@1 T@U) ) (! (let ((C@@6 (FieldTypeInv0 (type pm_f_1@@1))))
 (=> (and (and (and (and (and (= (type Heap@@39) (MapType0Type RefType)) (= (type ExhaleHeap@@11) (MapType0Type RefType))) (= (type Mask@@26) (MapType1Type RefType realType))) (= (type pm_f_1@@1) (FieldType C@@6 FrameTypeType))) (IdenticalOnKnownLocationsLiberal Heap@@39 ExhaleHeap@@11 Mask@@26)) (and (HasDirectPerm Mask@@26 null pm_f_1@@1) (IsPredicateField pm_f_1@@1))) (forall ((o2_1@@1 T@U) (f_4@@2 T@U) ) (! (let ((B@@14 (FieldTypeInv1 (type f_4@@2))))
(let ((A@@15 (FieldTypeInv0 (type f_4@@2))))
 (=> (and (and (= (type o2_1@@1) RefType) (= (type f_4@@2) (FieldType A@@15 B@@14))) (U_2_bool (MapType1Select (MapType0Select Heap@@39 null (PredicateMaskField pm_f_1@@1)) o2_1@@1 f_4@@2))) (U_2_bool (MapType1Select (MapType0Select ExhaleHeap@@11 null (PredicateMaskField pm_f_1@@1)) o2_1@@1 f_4@@2)))))
 :qid |Ex2originalbpl.112:145|
 :skolemid |15|
 :pattern ( (MapType1Select (MapType0Select ExhaleHeap@@11 null (PredicateMaskField pm_f_1@@1)) o2_1@@1 f_4@@2))
))))
 :qid |Ex2originalbpl.110:19|
 :skolemid |16|
 :pattern ( (IdenticalOnKnownLocationsLiberal Heap@@39 ExhaleHeap@@11 Mask@@26) (IsPredicateField pm_f_1@@1) (MapType0Select ExhaleHeap@@11 null (PredicateMaskField pm_f_1@@1)))
)))
(assert (forall ((Heap@@40 T@U) (ExhaleHeap@@12 T@U) (Mask@@27 T@U) (pm_f_1@@2 T@U) ) (! (let ((C@@7 (FieldTypeInv0 (type pm_f_1@@2))))
 (=> (and (and (and (and (and (= (type Heap@@40) (MapType0Type RefType)) (= (type ExhaleHeap@@12) (MapType0Type RefType))) (= (type Mask@@27) (MapType1Type RefType realType))) (= (type pm_f_1@@2) (FieldType C@@7 FrameTypeType))) (IdenticalOnKnownLocationsLiberal Heap@@40 ExhaleHeap@@12 Mask@@27)) (and (HasDirectPerm Mask@@27 null pm_f_1@@2) (IsWandField pm_f_1@@2))) (forall ((o2_1@@2 T@U) (f_4@@3 T@U) ) (! (let ((B@@15 (FieldTypeInv1 (type f_4@@3))))
(let ((A@@16 (FieldTypeInv0 (type f_4@@3))))
 (=> (and (and (= (type o2_1@@2) RefType) (= (type f_4@@3) (FieldType A@@16 B@@15))) (U_2_bool (MapType1Select (MapType0Select Heap@@40 null (WandMaskField pm_f_1@@2)) o2_1@@2 f_4@@3))) (U_2_bool (MapType1Select (MapType0Select ExhaleHeap@@12 null (WandMaskField pm_f_1@@2)) o2_1@@2 f_4@@3)))))
 :qid |Ex2originalbpl.128:140|
 :skolemid |19|
 :pattern ( (MapType1Select (MapType0Select ExhaleHeap@@12 null (WandMaskField pm_f_1@@2)) o2_1@@2 f_4@@3))
))))
 :qid |Ex2originalbpl.126:19|
 :skolemid |20|
 :pattern ( (IdenticalOnKnownLocationsLiberal Heap@@40 ExhaleHeap@@12 Mask@@27) (IsWandField pm_f_1@@2) (MapType0Select ExhaleHeap@@12 null (WandMaskField pm_f_1@@2)))
)))
(assert (forall ((Heap@@41 T@U) (Mask@@28 T@U) (self@@33 T@U) (start@@6 Int) ) (!  (=> (and (and (and (and (= (type Heap@@41) (MapType0Type RefType)) (= (type Mask@@28) (MapType1Type RefType realType))) (= (type self@@33) RefType)) (and (state Heap@@41 Mask@@28) (< AssumeFunctionsAbove 1))) (<= 0 start@@6)) (= (seq_collect$Array$3$usize$__$TY$__Array$3$usize$$int$$Seq$$int$ Heap@@41 self@@33 start@@6) (ite (>= start@@6 3) (|Seq#Empty| intType) (|Seq#Append| (|Seq#Singleton| (int_2_U (lookup_pure__$TY$__Array$3$usize$usize$Array$3$usize$$int$$$int$ Heap@@41 self@@33 start@@6))) (|seq_collect$Array$3$usize$__$TY$__Array$3$usize$$int$$Seq$$int$'| Heap@@41 self@@33 (+ start@@6 1))))))
 :qid |Ex2originalbpl.763:15|
 :skolemid |80|
 :pattern ( (state Heap@@41 Mask@@28) (seq_collect$Array$3$usize$__$TY$__Array$3$usize$$int$$Seq$$int$ Heap@@41 self@@33 start@@6))
)))
(assert (forall ((s@@15 T@U) ) (! (let ((T@@32 (SeqTypeInv0 (type s@@15))))
 (=> (and (= (type s@@15) (SeqType T@@32)) (= (|Seq#Length| s@@15) 0)) (= s@@15 (|Seq#Empty| T@@32))))
 :qid |Ex2originalbpl.263:18|
 :skolemid |36|
 :pattern ( (|Seq#Length| s@@15))
)))
(assert (forall ((s@@16 T@U) (n@@12 Int) ) (! (let ((T@@33 (SeqTypeInv0 (type s@@16))))
 (=> (and (= (type s@@16) (SeqType T@@33)) (<= n@@12 0)) (= (|Seq#Take| s@@16 n@@12) (|Seq#Empty| T@@33))))
 :qid |Ex2originalbpl.438:18|
 :skolemid |58|
 :pattern ( (|Seq#Take| s@@16 n@@12))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun perm@0 () Real)
(declare-fun Mask@0 () T@U)
(declare-fun _1@0 () T@U)
(declare-fun Heap@@42 () T@U)
(declare-fun perm@1 () Real)
(declare-fun perm@2 () Real)
(declare-fun perm@3 () Real)
(declare-fun Mask@5 () T@U)
(declare-fun Heap@6 () T@U)
(declare-fun perm@4 () Real)
(declare-fun Mask@13 () T@U)
(declare-fun Heap@28 () T@U)
(declare-fun Mask@48 () T@U)
(declare-fun Mask@17 () T@U)
(declare-fun perm@7 () Real)
(declare-fun _28@2 () Int)
(declare-fun Heap@32 () T@U)
(declare-fun perm@8 () Real)
(declare-fun Mask@27 () T@U)
(declare-fun Heap@36 () T@U)
(declare-fun _33@1 () T@U)
(declare-fun ExhaleHeap@1 () T@U)
(declare-fun perm@12 () Real)
(declare-fun Mask@43 () T@U)
(declare-fun Heap@54 () T@U)
(declare-fun Mask@44 () T@U)
(declare-fun _2@2 () T@U)
(declare-fun UnfoldingMask@24 () T@U)
(declare-fun UnfoldingMask@25 () T@U)
(declare-fun Heap@63 () T@U)
(declare-fun Heap@62 () T@U)
(declare-fun Heap@64 () T@U)
(declare-fun Heap@65 () T@U)
(declare-fun Heap@66 () T@U)
(declare-fun Heap@67 () T@U)
(declare-fun Heap@68 () T@U)
(declare-fun Heap@69 () T@U)
(declare-fun _LET_2_3@0 () Int)
(declare-fun Heap@70 () T@U)
(declare-fun Heap@71 () T@U)
(declare-fun Heap@72 () T@U)
(declare-fun UnfoldingMask@22 () T@U)
(declare-fun UnfoldingMask@23 () T@U)
(declare-fun Heap@61 () T@U)
(declare-fun Heap@60 () T@U)
(declare-fun FrameFragment (T@U) T@U)
(declare-fun UnfoldingMask@20 () T@U)
(declare-fun UnfoldingMask@21 () T@U)
(declare-fun Heap@59 () T@U)
(declare-fun Heap@58 () T@U)
(declare-fun Heap@57 () T@U)
(declare-fun _LET_2_1@0 () Int)
(declare-fun perm@13 () Real)
(declare-fun UnfoldingMask@19 () T@U)
(declare-fun _0_quant_0_5 () Int)
(declare-fun _LET_2@0 () Int)
(declare-fun UnfoldingMask@18 () T@U)
(declare-fun _0_quant_0_6 () Int)
(declare-fun Heap@56 () T@U)
(declare-fun perm@14 () Real)
(declare-fun UnfoldingMask@17 () T@U)
(declare-fun _0_quant_0_3 () Int)
(declare-fun UnfoldingMask@16 () T@U)
(declare-fun UnfoldingMask@14 () T@U)
(declare-fun UnfoldingMask@15 () T@U)
(declare-fun Heap@55 () T@U)
(declare-fun Heap@53 () T@U)
(declare-fun Heap@40 () T@U)
(declare-fun Heap@51 () T@U)
(declare-fun Heap@52 () T@U)
(declare-fun freshVersion@2 () T@U)
(declare-fun Mask@42 () T@U)
(declare-fun Mask@33 () T@U)
(declare-fun __t29@1 () Bool)
(declare-fun Heap@39 () T@U)
(declare-fun Mask@32 () T@U)
(declare-fun _8@3 () T@U)
(declare-fun __t30@1 () Bool)
(declare-fun perm@15 () Real)
(declare-fun perm@16 () Real)
(declare-fun Mask@23 () T@U)
(declare-fun _0_quant_0_10 () Int)
(declare-fun _35@2 () Int)
(declare-fun perm@17 () Real)
(declare-fun _0_quant_0_8 () Int)
(declare-fun _LET_1@0 () Int)
(declare-fun perm@18 () Real)
(declare-fun _0_quant_0_7 () Int)
(declare-fun _2@1 () T@U)
(declare-fun perm@19 () Real)
(declare-fun UnfoldingMask@5 () T@U)
(declare-fun _0_quant_0_2 () Int)
(declare-fun _LET_0@0 () Int)
(declare-fun _0_quant_0_1 () Int)
(declare-fun Heap@9 () T@U)
(declare-fun _2@0 () T@U)
(declare-fun perm@20 () Real)
(declare-fun UnfoldingMask@3 () T@U)
(declare-fun _0_quant_0 () Int)
(declare-fun Heap@8 () T@U)
(declare-fun Mask@41 () T@U)
(declare-fun Mask@35 () T@U)
(declare-fun perm@11 () Real)
(declare-fun Heap@42 () T@U)
(declare-fun __t20@1 () Bool)
(declare-fun Heap@27 () T@U)
(declare-fun Mask@12 () T@U)
(declare-fun Mask@40 () T@U)
(declare-fun Heap@50 () T@U)
(declare-fun Mask@39 () T@U)
(declare-fun Mask@38 () T@U)
(declare-fun _0@0 () T@U)
(declare-fun Heap@49 () T@U)
(declare-fun ExhaleHeap@2 () T@U)
(declare-fun UnfoldingMask@12 () T@U)
(declare-fun UnfoldingMask@13 () T@U)
(declare-fun Heap@47 () T@U)
(declare-fun Heap@48 () T@U)
(declare-fun Heap@46 () T@U)
(declare-fun Heap@43 () T@U)
(declare-fun Heap@44 () T@U)
(declare-fun Heap@45 () T@U)
(declare-fun freshVersion@1 () T@U)
(declare-fun Mask@37 () T@U)
(declare-fun Mask@36 () T@U)
(declare-fun __t32@0 () Int)
(declare-fun AssertMask@3 () T@U)
(declare-fun perm@10 () Real)
(declare-fun AssertMask@2 () T@U)
(declare-fun Mask@34 () T@U)
(declare-fun perm@9 () Real)
(declare-fun Heap@41 () T@U)
(declare-fun _43@0 () T@U)
(declare-fun __t31@0 () Bool)
(declare-fun _36@2 () Int)
(declare-fun _37@1 () T@U)
(declare-fun Mask@28 () T@U)
(declare-fun Mask@29 () T@U)
(declare-fun Mask@30 () T@U)
(declare-fun Mask@31 () T@U)
(declare-fun Heap@37 () T@U)
(declare-fun Heap@38 () T@U)
(declare-fun __t28@1 () Bool)
(declare-fun _6@6 () Int)
(declare-fun _5@3 () T@U)
(declare-fun Mask@25 () T@U)
(declare-fun Mask@24 () T@U)
(declare-fun _32@1 () T@U)
(declare-fun Mask@26 () T@U)
(declare-fun __t26@1 () Int)
(declare-fun _31@1 () T@U)
(declare-fun Mask@18 () T@U)
(declare-fun Mask@19 () T@U)
(declare-fun Mask@20 () T@U)
(declare-fun Mask@21 () T@U)
(declare-fun Heap@33 () T@U)
(declare-fun Heap@34 () T@U)
(declare-fun __t27@1 () Bool)
(declare-fun _26@1 () T@U)
(declare-fun _34@1 () T@U)
(declare-fun Mask@22 () T@U)
(declare-fun Heap@35 () T@U)
(declare-fun AssertMask@1 () T@U)
(declare-fun perm@6 () Real)
(declare-fun AssertMask@0 () T@U)
(declare-fun Mask@16 () T@U)
(declare-fun perm@5 () Real)
(declare-fun Heap@31 () T@U)
(declare-fun _30@1 () T@U)
(declare-fun __t25@1 () Bool)
(declare-fun _12@1 () T@U)
(declare-fun Mask@14 () T@U)
(declare-fun Heap@29 () T@U)
(declare-fun __t22@1 () Bool)
(declare-fun _17@1 () T@U)
(declare-fun Mask@15 () T@U)
(declare-fun Heap@30 () T@U)
(declare-fun __t23@1 () Bool)
(declare-fun _22@1 () T@U)
(declare-fun __t24@1 () Bool)
(declare-fun _8@2 () T@U)
(declare-fun __t21@1 () Bool)
(declare-fun Mask@11 () T@U)
(declare-fun Mask@10 () T@U)
(declare-fun Heap@26 () T@U)
(declare-fun _6@4 () Int)
(declare-fun _5@2 () T@U)
(declare-fun ExhaleHeap@0 () T@U)
(declare-fun Heap@25 () T@U)
(declare-fun newVersion@0 () T@U)
(declare-fun Mask@9 () T@U)
(declare-fun Mask@7 () T@U)
(declare-fun Mask@6 () T@U)
(declare-fun Heap@24 () T@U)
(declare-fun _12@0 () T@U)
(declare-fun _17@0 () T@U)
(declare-fun _22@0 () T@U)
(declare-fun _26@0 () T@U)
(declare-fun _30@0 () T@U)
(declare-fun _31@0 () T@U)
(declare-fun _32@0 () T@U)
(declare-fun _33@0 () T@U)
(declare-fun _34@0 () T@U)
(declare-fun _37@0 () T@U)
(declare-fun _5@1 () T@U)
(declare-fun _8@1 () T@U)
(declare-fun Mask@8 () T@U)
(declare-fun UnfoldingMask@10 () T@U)
(declare-fun UnfoldingMask@11 () T@U)
(declare-fun Heap@15 () T@U)
(declare-fun Heap@14 () T@U)
(declare-fun Heap@16 () T@U)
(declare-fun Heap@17 () T@U)
(declare-fun Heap@18 () T@U)
(declare-fun Heap@19 () T@U)
(declare-fun Heap@20 () T@U)
(declare-fun Heap@21 () T@U)
(declare-fun _LET_0_3@0 () Int)
(declare-fun Heap@22 () T@U)
(declare-fun Heap@23 () T@U)
(declare-fun UnfoldingMask@8 () T@U)
(declare-fun UnfoldingMask@9 () T@U)
(declare-fun Heap@13 () T@U)
(declare-fun Heap@12 () T@U)
(declare-fun UnfoldingMask@6 () T@U)
(declare-fun UnfoldingMask@7 () T@U)
(declare-fun Heap@11 () T@U)
(declare-fun Heap@10 () T@U)
(declare-fun _LET_0_1@0 () Int)
(declare-fun UnfoldingMask@4 () T@U)
(declare-fun UnfoldingMask@2 () T@U)
(declare-fun UnfoldingMask@0 () T@U)
(declare-fun UnfoldingMask@1 () T@U)
(declare-fun Heap@7 () T@U)
(declare-fun Heap@5 () T@U)
(declare-fun Heap@2 () T@U)
(declare-fun Heap@3 () T@U)
(declare-fun Heap@4 () T@U)
(declare-fun freshVersion@0 () T@U)
(declare-fun Mask@4 () T@U)
(declare-fun Mask@3 () T@U)
(declare-fun __t18@0 () Bool)
(declare-fun Heap@1 () T@U)
(declare-fun Mask@2 () T@U)
(declare-fun _8@0 () T@U)
(declare-fun __t19@0 () Bool)
(declare-fun Mask@1 () T@U)
(declare-fun Heap@0 () T@U)
(declare-fun _6@1 () Int)
(declare-fun _5@0 () T@U)
(declare-fun _1 () T@U)
(declare-fun _2 () T@U)
(declare-fun _5 () T@U)
(declare-fun _8 () T@U)
(declare-fun _12 () T@U)
(declare-fun _17 () T@U)
(declare-fun _22 () T@U)
(declare-fun _26 () T@U)
(declare-fun _30 () T@U)
(declare-fun _31 () T@U)
(declare-fun _32 () T@U)
(declare-fun _33 () T@U)
(declare-fun _34 () T@U)
(declare-fun _37 () T@U)
(declare-fun _43 () T@U)
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (= (type Mask@39) (MapType1Type RefType realType)) (= (type Mask@38) (MapType1Type RefType realType))) (= (type _0@0) RefType)) (= (type Heap@49) (MapType0Type RefType))) (= (type ExhaleHeap@2) (MapType0Type RefType))) (= (type Mask@40) (MapType1Type RefType realType))) (= (type Heap@50) (MapType0Type RefType))) (= (type UnfoldingMask@12) (MapType1Type RefType realType))) (= (type UnfoldingMask@13) (MapType1Type RefType realType))) (= (type Heap@47) (MapType0Type RefType))) (= (type Heap@48) (MapType0Type RefType))) (= (type Heap@46) (MapType0Type RefType))) (forall ((arg0@@53 T@U) ) (! (= (type (FrameFragment arg0@@53)) FrameTypeType)
 :qid |funType:FrameFragment|
 :pattern ( (FrameFragment arg0@@53))
))) (= (type Heap@44) (MapType0Type RefType))) (= (type Heap@43) (MapType0Type RefType))) (= (type Heap@45) (MapType0Type RefType))) (= (type freshVersion@1) FrameTypeType)) (= (type Mask@37) (MapType1Type RefType realType))) (= (type Mask@36) (MapType1Type RefType realType))) (= (type Heap@42) (MapType0Type RefType))) (= (type _1@0) RefType)) (= (type Mask@35) (MapType1Type RefType realType))) (= (type Mask@41) (MapType1Type RefType realType))) (= (type AssertMask@3) (MapType1Type RefType realType))) (= (type AssertMask@2) (MapType1Type RefType realType))) (= (type Mask@34) (MapType1Type RefType realType))) (= (type Heap@41) (MapType0Type RefType))) (= (type _43@0) RefType)) (= (type Heap@1) (MapType0Type RefType))) (= (type Mask@2) (MapType1Type RefType realType))) (= (type Heap@8) (MapType0Type RefType))) (= (type _2@0) RefType)) (= (type UnfoldingMask@3) (MapType1Type RefType realType))) (= (type Heap@6) (MapType0Type RefType))) (= (type Heap@9) (MapType0Type RefType))) (= (type UnfoldingMask@5) (MapType1Type RefType realType))) (= (type Heap@27) (MapType0Type RefType))) (= (type Mask@12) (MapType1Type RefType realType))) (= (type Heap@28) (MapType0Type RefType))) (= (type _2@1) RefType)) (= (type Mask@13) (MapType1Type RefType realType))) (= (type Mask@23) (MapType1Type RefType realType))) (= (type Heap@36) (MapType0Type RefType))) (= (type _33@1) RefType)) (= (type Mask@27) (MapType1Type RefType realType))) (= (type ExhaleHeap@1) (MapType0Type RefType))) (= (type Heap@39) (MapType0Type RefType))) (= (type Mask@32) (MapType1Type RefType realType))) (= (type Heap@56) (MapType0Type RefType))) (= (type _2@2) RefType)) (= (type UnfoldingMask@17) (MapType1Type RefType realType))) (= (type Heap@54) (MapType0Type RefType))) (= (type Heap@57) (MapType0Type RefType))) (= (type UnfoldingMask@19) (MapType1Type RefType realType))) (= (type Mask@44) (MapType1Type RefType realType))) (= (type Mask@43) (MapType1Type RefType realType))) (= (type UnfoldingMask@24) (MapType1Type RefType realType))) (= (type UnfoldingMask@25) (MapType1Type RefType realType))) (= (type Heap@63) (MapType0Type RefType))) (= (type Heap@62) (MapType0Type RefType))) (= (type Heap@64) (MapType0Type RefType))) (= (type Heap@65) (MapType0Type RefType))) (= (type Heap@66) (MapType0Type RefType))) (= (type Heap@67) (MapType0Type RefType))) (= (type Heap@68) (MapType0Type RefType))) (= (type Heap@69) (MapType0Type RefType))) (= (type Heap@70) (MapType0Type RefType))) (= (type Heap@71) (MapType0Type RefType))) (= (type Heap@72) (MapType0Type RefType))) (= (type UnfoldingMask@22) (MapType1Type RefType realType))) (= (type UnfoldingMask@23) (MapType1Type RefType realType))) (= (type Heap@61) (MapType0Type RefType))) (= (type Heap@60) (MapType0Type RefType))) (= (type UnfoldingMask@20) (MapType1Type RefType realType))) (= (type UnfoldingMask@21) (MapType1Type RefType realType))) (= (type Heap@59) (MapType0Type RefType))) (= (type Heap@58) (MapType0Type RefType))) (= (type UnfoldingMask@18) (MapType1Type RefType realType))) (= (type UnfoldingMask@16) (MapType1Type RefType realType))) (= (type UnfoldingMask@14) (MapType1Type RefType realType))) (= (type UnfoldingMask@15) (MapType1Type RefType realType))) (= (type Heap@55) (MapType0Type RefType))) (= (type Heap@53) (MapType0Type RefType))) (= (type Heap@51) (MapType0Type RefType))) (= (type Heap@40) (MapType0Type RefType))) (= (type Heap@52) (MapType0Type RefType))) (= (type freshVersion@2) FrameTypeType)) (= (type Mask@42) (MapType1Type RefType realType))) (= (type Mask@33) (MapType1Type RefType realType))) (= (type _8@3) RefType)) (= (type _37@1) RefType)) (= (type Mask@28) (MapType1Type RefType realType))) (= (type Mask@29) (MapType1Type RefType realType))) (= (type Mask@30) (MapType1Type RefType realType))) (= (type Mask@31) (MapType1Type RefType realType))) (= (type Heap@37) (MapType0Type RefType))) (= (type Heap@38) (MapType0Type RefType))) (= (type _5@3) RefType)) (= (type Mask@25) (MapType1Type RefType realType))) (= (type Mask@24) (MapType1Type RefType realType))) (= (type _32@1) RefType)) (= (type Mask@26) (MapType1Type RefType realType))) (= (type Heap@32) (MapType0Type RefType))) (= (type Mask@17) (MapType1Type RefType realType))) (= (type _31@1) RefType)) (= (type Mask@18) (MapType1Type RefType realType))) (= (type Mask@19) (MapType1Type RefType realType))) (= (type Mask@20) (MapType1Type RefType realType))) (= (type Mask@21) (MapType1Type RefType realType))) (= (type Heap@33) (MapType0Type RefType))) (= (type Heap@34) (MapType0Type RefType))) (= (type _26@1) RefType)) (= (type _34@1) RefType)) (= (type Mask@22) (MapType1Type RefType realType))) (= (type Heap@35) (MapType0Type RefType))) (= (type Mask@48) (MapType1Type RefType realType))) (= (type AssertMask@1) (MapType1Type RefType realType))) (= (type AssertMask@0) (MapType1Type RefType realType))) (= (type Mask@16) (MapType1Type RefType realType))) (= (type Heap@31) (MapType0Type RefType))) (= (type _30@1) RefType)) (= (type _12@1) RefType)) (= (type Mask@14) (MapType1Type RefType realType))) (= (type Heap@29) (MapType0Type RefType))) (= (type _17@1) RefType)) (= (type Mask@15) (MapType1Type RefType realType))) (= (type Heap@30) (MapType0Type RefType))) (= (type _22@1) RefType)) (= (type _8@2) RefType)) (= (type Mask@11) (MapType1Type RefType realType))) (= (type Mask@10) (MapType1Type RefType realType))) (= (type Heap@26) (MapType0Type RefType))) (= (type _5@2) RefType)) (= (type Heap@25) (MapType0Type RefType))) (= (type ExhaleHeap@0) (MapType0Type RefType))) (= (type newVersion@0) FrameTypeType)) (= (type Mask@9) (MapType1Type RefType realType))) (= (type Mask@7) (MapType1Type RefType realType))) (= (type Mask@6) (MapType1Type RefType realType))) (= (type Heap@24) (MapType0Type RefType))) (= (type _12@0) RefType)) (= (type _17@0) RefType)) (= (type _22@0) RefType)) (= (type _26@0) RefType)) (= (type _30@0) RefType)) (= (type _31@0) RefType)) (= (type _32@0) RefType)) (= (type _33@0) RefType)) (= (type _34@0) RefType)) (= (type _37@0) RefType)) (= (type _5@1) RefType)) (= (type _8@1) RefType)) (= (type Mask@8) (MapType1Type RefType realType))) (= (type Mask@5) (MapType1Type RefType realType))) (= (type UnfoldingMask@10) (MapType1Type RefType realType))) (= (type UnfoldingMask@11) (MapType1Type RefType realType))) (= (type Heap@15) (MapType0Type RefType))) (= (type Heap@14) (MapType0Type RefType))) (= (type Heap@16) (MapType0Type RefType))) (= (type Heap@17) (MapType0Type RefType))) (= (type Heap@18) (MapType0Type RefType))) (= (type Heap@19) (MapType0Type RefType))) (= (type Heap@20) (MapType0Type RefType))) (= (type Heap@21) (MapType0Type RefType))) (= (type Heap@22) (MapType0Type RefType))) (= (type Heap@23) (MapType0Type RefType))) (= (type UnfoldingMask@8) (MapType1Type RefType realType))) (= (type UnfoldingMask@9) (MapType1Type RefType realType))) (= (type Heap@13) (MapType0Type RefType))) (= (type Heap@12) (MapType0Type RefType))) (= (type UnfoldingMask@6) (MapType1Type RefType realType))) (= (type UnfoldingMask@7) (MapType1Type RefType realType))) (= (type Heap@11) (MapType0Type RefType))) (= (type Heap@10) (MapType0Type RefType))) (= (type UnfoldingMask@4) (MapType1Type RefType realType))) (= (type UnfoldingMask@2) (MapType1Type RefType realType))) (= (type UnfoldingMask@0) (MapType1Type RefType realType))) (= (type UnfoldingMask@1) (MapType1Type RefType realType))) (= (type Heap@7) (MapType0Type RefType))) (= (type Heap@5) (MapType0Type RefType))) (= (type Heap@3) (MapType0Type RefType))) (= (type Heap@2) (MapType0Type RefType))) (= (type Heap@4) (MapType0Type RefType))) (= (type freshVersion@0) FrameTypeType)) (= (type Mask@4) (MapType1Type RefType realType))) (= (type Mask@3) (MapType1Type RefType realType))) (= (type _8@0) RefType)) (= (type Heap@@42) (MapType0Type RefType))) (= (type Mask@0) (MapType1Type RefType realType))) (= (type Mask@1) (MapType1Type RefType realType))) (= (type Heap@0) (MapType0Type RefType))) (= (type _5@0) RefType)) (= (type _1) RefType)) (= (type _2) RefType)) (= (type _5) RefType)) (= (type _8) RefType)) (= (type _12) RefType)) (= (type _17) RefType)) (= (type _22) RefType)) (= (type _26) RefType)) (= (type _30) RefType)) (= (type _31) RefType)) (= (type _32) RefType)) (= (type _33) RefType)) (= (type _34) RefType)) (= (type _37) RefType)) (= (type _43) RefType)))
(set-info :boogie-vc-id m_bar)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 452) (let ((anon3_correct true))
(let ((anon214_Else_correct  (=> (and (= perm@0 NoPerm) (= (ControlFlow 0 448) 445)) anon3_correct)))
(let ((anon214_Then_correct  (=> (not (= perm@0 NoPerm)) (and (=> (= (ControlFlow 0 446) (- 0 447)) (<= perm@0 (U_2_real (MapType1Select Mask@0 null (Array$3$usize _1@0))))) (=> (<= perm@0 (U_2_real (MapType1Select Mask@0 null (Array$3$usize _1@0)))) (=> (= (ControlFlow 0 446) 445) anon3_correct))))))
(let ((anon213_Then_correct  (=> (= perm@0 (read$ Heap@@42)) (and (=> (= (ControlFlow 0 449) (- 0 450)) (>= perm@0 NoPerm)) (=> (>= perm@0 NoPerm) (and (=> (= (ControlFlow 0 449) 446) anon214_Then_correct) (=> (= (ControlFlow 0 449) 448) anon214_Else_correct)))))))
(let ((anon7_correct true))
(let ((anon216_Else_correct  (=> (and (= perm@1 NoPerm) (= (ControlFlow 0 441) 438)) anon7_correct)))
(let ((anon216_Then_correct  (=> (not (= perm@1 NoPerm)) (and (=> (= (ControlFlow 0 439) (- 0 440)) (<= perm@1 (U_2_real (MapType1Select Mask@0 null (Array$3$usize _1@0))))) (=> (<= perm@1 (U_2_real (MapType1Select Mask@0 null (Array$3$usize _1@0)))) (=> (= (ControlFlow 0 439) 438) anon7_correct))))))
(let ((anon215_Then_correct  (=> (= perm@1 (read$ Heap@@42)) (and (=> (= (ControlFlow 0 442) (- 0 443)) (>= perm@1 NoPerm)) (=> (>= perm@1 NoPerm) (and (=> (= (ControlFlow 0 442) 439) anon216_Then_correct) (=> (= (ControlFlow 0 442) 441) anon216_Else_correct)))))))
(let ((anon11_correct true))
(let ((anon218_Else_correct  (=> (and (= perm@2 NoPerm) (= (ControlFlow 0 434) 431)) anon11_correct)))
(let ((anon218_Then_correct  (=> (not (= perm@2 NoPerm)) (and (=> (= (ControlFlow 0 432) (- 0 433)) (<= perm@2 (U_2_real (MapType1Select Mask@0 null (Array$3$usize _1@0))))) (=> (<= perm@2 (U_2_real (MapType1Select Mask@0 null (Array$3$usize _1@0)))) (=> (= (ControlFlow 0 432) 431) anon11_correct))))))
(let ((anon217_Then_correct  (=> (= perm@2 (read$ Heap@@42)) (and (=> (= (ControlFlow 0 435) (- 0 436)) (>= perm@2 NoPerm)) (=> (>= perm@2 NoPerm) (and (=> (= (ControlFlow 0 435) 432) anon218_Then_correct) (=> (= (ControlFlow 0 435) 434) anon218_Else_correct)))))))
(let ((anon56_correct true))
(let ((anon243_Else_correct  (=> (and (= perm@3 NoPerm) (= (ControlFlow 0 387) 384)) anon56_correct)))
(let ((anon243_Then_correct  (=> (not (= perm@3 NoPerm)) (and (=> (= (ControlFlow 0 385) (- 0 386)) (<= perm@3 (U_2_real (MapType1Select Mask@5 null (Array$3$usize _1@0))))) (=> (<= perm@3 (U_2_real (MapType1Select Mask@5 null (Array$3$usize _1@0)))) (=> (= (ControlFlow 0 385) 384) anon56_correct))))))
(let ((anon242_Then_correct  (=> (= perm@3 (read$ Heap@6)) (and (=> (= (ControlFlow 0 388) (- 0 389)) (>= perm@3 NoPerm)) (=> (>= perm@3 NoPerm) (and (=> (= (ControlFlow 0 388) 385) anon243_Then_correct) (=> (= (ControlFlow 0 388) 387) anon243_Else_correct)))))))
(let ((anon167_correct true))
(let ((anon304_Else_correct  (=> (and (= perm@4 NoPerm) (= (ControlFlow 0 343) 340)) anon167_correct)))
(let ((anon304_Then_correct  (=> (not (= perm@4 NoPerm)) (and (=> (= (ControlFlow 0 341) (- 0 342)) (<= perm@4 (U_2_real (MapType1Select Mask@13 null (Array$3$usize _1@0))))) (=> (<= perm@4 (U_2_real (MapType1Select Mask@13 null (Array$3$usize _1@0)))) (=> (= (ControlFlow 0 341) 340) anon167_correct))))))
(let ((anon303_Then_correct  (=> (= perm@4 (read$ Heap@28)) (and (=> (= (ControlFlow 0 344) (- 0 345)) (>= perm@4 NoPerm)) (=> (>= perm@4 NoPerm) (and (=> (= (ControlFlow 0 344) 341) anon304_Then_correct) (=> (= (ControlFlow 0 344) 343) anon304_Else_correct)))))))
(let ((anon179_correct  (=> (= Mask@48 (MapType1Store Mask@17 null (Array$3$usize _1@0) (real_2_U (- (U_2_real (MapType1Select Mask@17 null (Array$3$usize _1@0))) perm@7)))) (and (=> (= (ControlFlow 0 308) (- 0 309)) (<= 0 _28@2)) (=> (<= 0 _28@2) (=> (= (ControlFlow 0 308) (- 0 307)) (< _28@2 3)))))))
(let ((anon310_Else_correct  (=> (and (= perm@7 NoPerm) (= (ControlFlow 0 312) 308)) anon179_correct)))
(let ((anon310_Then_correct  (=> (not (= perm@7 NoPerm)) (and (=> (= (ControlFlow 0 310) (- 0 311)) (<= perm@7 (U_2_real (MapType1Select Mask@17 null (Array$3$usize _1@0))))) (=> (<= perm@7 (U_2_real (MapType1Select Mask@17 null (Array$3$usize _1@0)))) (=> (= (ControlFlow 0 310) 308) anon179_correct))))))
(let ((anon309_Then_correct  (=> (= perm@7 (read$ Heap@32)) (and (=> (= (ControlFlow 0 313) (- 0 314)) (>= perm@7 NoPerm)) (=> (>= perm@7 NoPerm) (and (=> (= (ControlFlow 0 313) 310) anon310_Then_correct) (=> (= (ControlFlow 0 313) 312) anon310_Else_correct)))))))
(let ((anon203_correct true))
(let ((anon325_Else_correct  (=> (and (= perm@8 NoPerm) (= (ControlFlow 0 267) 264)) anon203_correct)))
(let ((anon325_Then_correct  (=> (not (= perm@8 NoPerm)) (and (=> (= (ControlFlow 0 265) (- 0 266)) (<= perm@8 (U_2_real (MapType1Select Mask@27 null (Array$3$usize (MapType0Select Heap@36 _33@1 val_ref)))))) (=> (<= perm@8 (U_2_real (MapType1Select Mask@27 null (Array$3$usize (MapType0Select Heap@36 _33@1 val_ref))))) (=> (= (ControlFlow 0 265) 264) anon203_correct))))))
(let ((anon324_Then_correct  (=> (= perm@8 (read$ ExhaleHeap@1)) (and (=> (= (ControlFlow 0 268) (- 0 269)) (>= perm@8 NoPerm)) (=> (>= perm@8 NoPerm) (and (=> (= (ControlFlow 0 268) 265) anon325_Then_correct) (=> (= (ControlFlow 0 268) 267) anon325_Else_correct)))))))
(let ((anon134_correct true))
(let ((anon284_Else_correct  (=> (and (= perm@12 NoPerm) (= (ControlFlow 0 208) 205)) anon134_correct)))
(let ((anon284_Then_correct  (=> (not (= perm@12 NoPerm)) (and (=> (= (ControlFlow 0 206) (- 0 207)) (<= perm@12 (U_2_real (MapType1Select Mask@43 null (Array$3$usize _1@0))))) (=> (<= perm@12 (U_2_real (MapType1Select Mask@43 null (Array$3$usize _1@0)))) (=> (= (ControlFlow 0 206) 205) anon134_correct))))))
(let ((anon283_Then_correct  (=> (= perm@12 (read$ Heap@54)) (and (=> (= (ControlFlow 0 209) (- 0 210)) (>= perm@12 NoPerm)) (=> (>= perm@12 NoPerm) (and (=> (= (ControlFlow 0 209) 206) anon284_Then_correct) (=> (= (ControlFlow 0 209) 208) anon284_Else_correct)))))))
(let ((anon143_correct true))
(let ((anon288_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 188) 185)) anon143_correct)))
(let ((anon288_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 186) (- 0 187)) (<= FullPerm (U_2_real (MapType1Select Mask@44 null (Array$3$usize _1@0))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@44 null (Array$3$usize _1@0)))) (=> (= (ControlFlow 0 186) 185) anon143_correct))))))
(let ((anon141_correct  (=> (= Mask@44 (MapType1Store Mask@43 null (usize _2@2) (real_2_U (- (U_2_real (MapType1Select Mask@43 null (usize _2@2))) FullPerm)))) (and (=> (= (ControlFlow 0 189) 186) anon288_Then_correct) (=> (= (ControlFlow 0 189) 188) anon288_Else_correct)))))
(let ((anon287_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 192) 189)) anon141_correct)))
(let ((anon287_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 190) (- 0 191)) (<= FullPerm (U_2_real (MapType1Select Mask@43 null (usize _2@2))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@43 null (usize _2@2)))) (=> (= (ControlFlow 0 190) 189) anon141_correct))))))
(let ((anon139_correct  (=> (and (= UnfoldingMask@24 (MapType1Store Mask@43 null (usize _2@2) (real_2_U (- (U_2_real (MapType1Select Mask@43 null (usize _2@2))) FullPerm)))) (not (= _2@2 null))) (=> (and (and (= UnfoldingMask@25 (MapType1Store UnfoldingMask@24 _2@2 val_int (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@24 _2@2 val_int)) FullPerm)))) (state Heap@54 UnfoldingMask@25)) (and (<= 0 (U_2_int (MapType0Select Heap@54 _2@2 val_int))) (state Heap@54 UnfoldingMask@25))) (and (=> (= (ControlFlow 0 193) (- 0 195)) (HasDirectPerm UnfoldingMask@25 _2@2 val_int)) (=> (HasDirectPerm UnfoldingMask@25 _2@2 val_int) (=> (and (and (and (= Heap@63 (MapType0Store Heap@62 null (|usize#sm| _2@2) (MapType1Store (MapType0Select Heap@62 null (|usize#sm| _2@2)) _2@2 val_int (bool_2_U true)))) (state Heap@63 Mask@43)) (and (= Heap@64 (MapType0Store Heap@63 null (|usize#sm| _2@2) (MapType1Store (MapType0Select Heap@63 null (|usize#sm| _2@2)) _2@2 val_int (bool_2_U true)))) (state Heap@64 Mask@43))) (and (and (= Heap@65 (MapType0Store Heap@64 null (|usize#sm| _2@2) (MapType1Store (MapType0Select Heap@64 null (|usize#sm| _2@2)) _2@2 val_int (bool_2_U true)))) (state Heap@65 Mask@43)) (and (= Heap@66 (MapType0Store Heap@65 null (|usize#sm| _2@2) (MapType1Store (MapType0Select Heap@65 null (|usize#sm| _2@2)) _2@2 val_int (bool_2_U true)))) (state Heap@66 Mask@43)))) (and (=> (= (ControlFlow 0 193) (- 0 194)) (<= (read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$ (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize Heap@66 _1@0) (U_2_int (MapType0Select Heap@66 _2@2 val_int))) (+ (U_2_int (MapType0Select Heap@66 _2@2 val_int)) 1))) (=> (<= (read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$ (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize Heap@66 _1@0) (U_2_int (MapType0Select Heap@66 _2@2 val_int))) (+ (U_2_int (MapType0Select Heap@66 _2@2 val_int)) 1)) (=> (= Heap@67 (MapType0Store Heap@66 null (|usize#sm| _2@2) (MapType1Store (MapType0Select Heap@66 null (|usize#sm| _2@2)) _2@2 val_int (bool_2_U true)))) (=> (and (state Heap@67 Mask@43) (= Heap@68 (MapType0Store Heap@67 null (|usize#sm| _2@2) (MapType1Store (MapType0Select Heap@67 null (|usize#sm| _2@2)) _2@2 val_int (bool_2_U true))))) (=> (and (and (state Heap@68 Mask@43) (= Heap@69 (MapType0Store Heap@68 null (|usize#sm| _2@2) (MapType1Store (MapType0Select Heap@68 null (|usize#sm| _2@2)) _2@2 val_int (bool_2_U true))))) (and (state Heap@69 Mask@43) (= _LET_2_3@0 (U_2_int (MapType0Select Heap@69 _2@2 val_int))))) (=> (and (and (and (= Heap@70 (MapType0Store Heap@69 null (|usize#sm| _2@2) (MapType1Store (MapType0Select Heap@69 null (|usize#sm| _2@2)) _2@2 val_int (bool_2_U true)))) (state Heap@70 Mask@43)) (and (= Heap@71 (MapType0Store Heap@70 null (|usize#sm| _2@2) (MapType1Store (MapType0Select Heap@70 null (|usize#sm| _2@2)) _2@2 val_int (bool_2_U true)))) (state Heap@71 Mask@43))) (and (and (= Heap@72 (MapType0Store Heap@71 null (|usize#sm| _2@2) (MapType1Store (MapType0Select Heap@71 null (|usize#sm| _2@2)) _2@2 val_int (bool_2_U true)))) (state Heap@72 Mask@43)) (and (state Heap@72 Mask@43) (state Heap@72 Mask@43)))) (and (=> (= (ControlFlow 0 193) 190) anon287_Then_correct) (=> (= (ControlFlow 0 193) 192) anon287_Else_correct)))))))))))))))
(let ((anon286_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 198) 193)) anon139_correct)))
(let ((anon286_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 196) (- 0 197)) (<= FullPerm (U_2_real (MapType1Select Mask@43 null (usize _2@2))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@43 null (usize _2@2)))) (=> (= (ControlFlow 0 196) 193) anon139_correct))))))
(let ((anon137_correct  (=> (and (= UnfoldingMask@22 (MapType1Store Mask@43 null (usize _2@2) (real_2_U (- (U_2_real (MapType1Select Mask@43 null (usize _2@2))) FullPerm)))) (not (= _2@2 null))) (=> (and (and (= UnfoldingMask@23 (MapType1Store UnfoldingMask@22 _2@2 val_int (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@22 _2@2 val_int)) FullPerm)))) (state Heap@54 UnfoldingMask@23)) (and (<= 0 (U_2_int (MapType0Select Heap@54 _2@2 val_int))) (state Heap@54 UnfoldingMask@23))) (and (=> (= (ControlFlow 0 199) (- 0 200)) (HasDirectPerm UnfoldingMask@23 _2@2 val_int)) (=> (HasDirectPerm UnfoldingMask@23 _2@2 val_int) (=> (and (= Heap@61 (MapType0Store Heap@60 null (|usize#sm| _2@2) (MapType1Store (MapType0Select Heap@60 null (|usize#sm| _2@2)) _2@2 val_int (bool_2_U true)))) (state Heap@61 Mask@43)) (=> (and (and (= Heap@62 (MapType0Store Heap@61 null (|usize#sm| _2@2) (MapType1Store (MapType0Select Heap@61 null (|usize#sm| _2@2)) _2@2 val_int (bool_2_U true)))) (state Heap@62 Mask@43)) (and (|usize#trigger| Heap@54 (usize _2@2)) (= (MapType0Select Heap@54 null (usize _2@2)) (FrameFragment (MapType0Select Heap@54 _2@2 val_int))))) (and (=> (= (ControlFlow 0 199) 196) anon286_Then_correct) (=> (= (ControlFlow 0 199) 198) anon286_Else_correct))))))))))
(let ((anon285_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 203) 199)) anon137_correct)))
(let ((anon285_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 201) (- 0 202)) (<= FullPerm (U_2_real (MapType1Select Mask@43 null (usize _2@2))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@43 null (usize _2@2)))) (=> (= (ControlFlow 0 201) 199) anon137_correct))))))
(let ((anon283_Else_correct  (=> (and (|usize#trigger| Heap@54 (usize _2@2)) (= (MapType0Select Heap@54 null (usize _2@2)) (FrameFragment (MapType0Select Heap@54 _2@2 val_int)))) (and (=> (= (ControlFlow 0 204) 201) anon285_Then_correct) (=> (= (ControlFlow 0 204) 203) anon285_Else_correct)))))
(let ((anon131_correct  (=> (and (= UnfoldingMask@20 (MapType1Store Mask@43 null (usize _2@2) (real_2_U (- (U_2_real (MapType1Select Mask@43 null (usize _2@2))) FullPerm)))) (not (= _2@2 null))) (=> (and (and (= UnfoldingMask@21 (MapType1Store UnfoldingMask@20 _2@2 val_int (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@20 _2@2 val_int)) FullPerm)))) (state Heap@54 UnfoldingMask@21)) (and (<= 0 (U_2_int (MapType0Select Heap@54 _2@2 val_int))) (state Heap@54 UnfoldingMask@21))) (and (=> (= (ControlFlow 0 211) (- 0 213)) (HasDirectPerm UnfoldingMask@21 _2@2 val_int)) (=> (HasDirectPerm UnfoldingMask@21 _2@2 val_int) (=> (and (and (= Heap@59 (MapType0Store Heap@58 null (|usize#sm| _2@2) (MapType1Store (MapType0Select Heap@58 null (|usize#sm| _2@2)) _2@2 val_int (bool_2_U true)))) (state Heap@59 Mask@43)) (and (= Heap@60 (MapType0Store Heap@59 null (|usize#sm| _2@2) (MapType1Store (MapType0Select Heap@59 null (|usize#sm| _2@2)) _2@2 val_int (bool_2_U true)))) (state Heap@60 Mask@43))) (and (=> (= (ControlFlow 0 211) (- 0 212)) (< (U_2_int (MapType0Select Heap@60 _2@2 val_int)) 3)) (=> (< (U_2_int (MapType0Select Heap@60 _2@2 val_int)) 3) (and (=> (= (ControlFlow 0 211) 209) anon283_Then_correct) (=> (= (ControlFlow 0 211) 204) anon283_Else_correct)))))))))))
(let ((anon282_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 216) 211)) anon131_correct)))
(let ((anon282_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 214) (- 0 215)) (<= FullPerm (U_2_real (MapType1Select Mask@43 null (usize _2@2))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@43 null (usize _2@2)))) (=> (= (ControlFlow 0 214) 211) anon131_correct))))))
(let ((anon275_Else_correct  (=> (= Heap@58 (MapType0Store Heap@57 null (|usize#sm| _2@2) (MapType1Store (MapType0Select Heap@57 null (|usize#sm| _2@2)) _2@2 val_int (bool_2_U true)))) (=> (and (state Heap@58 Mask@43) (= _LET_2_1@0 (U_2_int (MapType0Select Heap@58 _2@2 val_int)))) (and (=> (= (ControlFlow 0 217) (- 0 218)) (forall ((_0_quant_0_9 Int) ) (!  (=> (<= 0 _0_quant_0_9) (or (not (<= (U_2_int (MapType0Select Heap@58 _2@2 val_int)) _0_quant_0_9)) (or (not (< _0_quant_0_9 3)) (and (< _0_quant_0_9 3) (<= (read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$ (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize Heap@58 _1@0) _0_quant_0_9) (+ _0_quant_0_9 1))))))
 :qid |Ex2originalbpl.4233:15|
 :skolemid |125|
 :pattern ( (read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$ (|snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize#frame| (ConditionalFrame (read$ Heap@58) (MapType0Select Heap@58 null (Array$3$usize _1@0))) _1@0) _0_quant_0_9))
))) (=> (forall ((_0_quant_0_9@@0 Int) ) (!  (=> (<= 0 _0_quant_0_9@@0) (or (not (<= (U_2_int (MapType0Select Heap@58 _2@2 val_int)) _0_quant_0_9@@0)) (or (not (< _0_quant_0_9@@0 3)) (and (< _0_quant_0_9@@0 3) (<= (read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$ (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize Heap@58 _1@0) _0_quant_0_9@@0) (+ _0_quant_0_9@@0 1))))))
 :qid |Ex2originalbpl.4233:15|
 :skolemid |125|
 :pattern ( (read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$ (|snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize#frame| (ConditionalFrame (read$ Heap@58) (MapType0Select Heap@58 null (Array$3$usize _1@0))) _1@0) _0_quant_0_9@@0))
)) (=> (and (|usize#trigger| Heap@54 (usize _2@2)) (= (MapType0Select Heap@54 null (usize _2@2)) (FrameFragment (MapType0Select Heap@54 _2@2 val_int)))) (and (=> (= (ControlFlow 0 217) 214) anon282_Then_correct) (=> (= (ControlFlow 0 217) 216) anon282_Else_correct)))))))))
(let ((anon127_correct true))
(let ((anon281_Else_correct  (=> (and (= perm@13 NoPerm) (= (ControlFlow 0 178) 175)) anon127_correct)))
(let ((anon281_Then_correct  (=> (not (= perm@13 NoPerm)) (and (=> (= (ControlFlow 0 176) (- 0 177)) (<= perm@13 (U_2_real (MapType1Select UnfoldingMask@19 null (Array$3$usize _1@0))))) (=> (<= perm@13 (U_2_real (MapType1Select UnfoldingMask@19 null (Array$3$usize _1@0)))) (=> (= (ControlFlow 0 176) 175) anon127_correct))))))
(let ((anon280_Then_correct  (=> (= perm@13 (read$ Heap@54)) (and (=> (= (ControlFlow 0 179) (- 0 180)) (>= perm@13 NoPerm)) (=> (>= perm@13 NoPerm) (and (=> (= (ControlFlow 0 179) 176) anon281_Then_correct) (=> (= (ControlFlow 0 179) 178) anon281_Else_correct)))))))
(let ((anon128_correct true))
(let ((anon279_Then_correct  (=> (< _0_quant_0_5 3) (and (=> (= (ControlFlow 0 181) 179) anon280_Then_correct) (=> (= (ControlFlow 0 181) 170) anon128_correct)))))
(let ((anon279_Else_correct  (=> (and (<= 3 _0_quant_0_5) (= (ControlFlow 0 174) 170)) anon128_correct)))
(let ((anon278_Then_correct  (=> (< _0_quant_0_5 3) (and (=> (= (ControlFlow 0 182) 181) anon279_Then_correct) (=> (= (ControlFlow 0 182) 174) anon279_Else_correct)))))
(let ((anon278_Else_correct  (=> (and (<= 3 _0_quant_0_5) (= (ControlFlow 0 173) 170)) anon128_correct)))
(let ((anon277_Then_correct  (=> (<= _LET_2@0 _0_quant_0_5) (and (=> (= (ControlFlow 0 183) 182) anon278_Then_correct) (=> (= (ControlFlow 0 183) 173) anon278_Else_correct)))))
(let ((anon277_Else_correct  (=> (and (< _0_quant_0_5 _LET_2@0) (= (ControlFlow 0 172) 170)) anon128_correct)))
(let ((anon276_Then_correct  (=> (<= 0 _0_quant_0_5) (and (=> (= (ControlFlow 0 184) 183) anon277_Then_correct) (=> (= (ControlFlow 0 184) 172) anon277_Else_correct)))))
(let ((anon276_Else_correct  (=> (and (< _0_quant_0_5 0) (= (ControlFlow 0 171) 170)) anon128_correct)))
(let ((anon119_correct  (=> (and (= UnfoldingMask@18 (MapType1Store Mask@43 null (usize _2@2) (real_2_U (- (U_2_real (MapType1Select Mask@43 null (usize _2@2))) FullPerm)))) (not (= _2@2 null))) (=> (and (and (= UnfoldingMask@19 (MapType1Store UnfoldingMask@18 _2@2 val_int (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@18 _2@2 val_int)) FullPerm)))) (state Heap@54 UnfoldingMask@19)) (and (<= 0 (U_2_int (MapType0Select Heap@54 _2@2 val_int))) (state Heap@54 UnfoldingMask@19))) (and (=> (= (ControlFlow 0 219) (- 0 220)) (HasDirectPerm UnfoldingMask@19 _2@2 val_int)) (=> (HasDirectPerm UnfoldingMask@19 _2@2 val_int) (=> (= _LET_2@0 (U_2_int (MapType0Select Heap@57 _2@2 val_int))) (and (and (=> (= (ControlFlow 0 219) 217) anon275_Else_correct) (=> (= (ControlFlow 0 219) 184) anon276_Then_correct)) (=> (= (ControlFlow 0 219) 171) anon276_Else_correct)))))))))
(let ((anon274_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 223) 219)) anon119_correct)))
(let ((anon274_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 221) (- 0 222)) (<= FullPerm (U_2_real (MapType1Select Mask@43 null (usize _2@2))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@43 null (usize _2@2)))) (=> (= (ControlFlow 0 221) 219) anon119_correct))))))
(let ((anon272_Else_correct  (=> (forall ((_0_quant_0_7_1 Int) ) (!  (=> (<= 0 _0_quant_0_7_1) (or (not (<= 0 _0_quant_0_7_1)) (or (not (< _0_quant_0_7_1 (U_2_int (MapType0Select Heap@57 _2@2 val_int)))) (and (< _0_quant_0_7_1 3) (<= (read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$ (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize Heap@57 _1@0) _0_quant_0_7_1) (+ _0_quant_0_7_1 2))))))
 :qid |Ex2originalbpl.4170:20|
 :skolemid |124|
 :pattern ( (read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$ (|snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize#frame| (ConditionalFrame (read$ Heap@57) (MapType0Select Heap@57 null (Array$3$usize _1@0))) _1@0) _0_quant_0_7_1))
)) (=> (and (|usize#trigger| Heap@54 (usize _2@2)) (= (MapType0Select Heap@54 null (usize _2@2)) (FrameFragment (MapType0Select Heap@54 _2@2 val_int)))) (and (=> (= (ControlFlow 0 224) 221) anon274_Then_correct) (=> (= (ControlFlow 0 224) 223) anon274_Else_correct))))))
(let ((anon116_correct true))
(let ((anon273_Else_correct  (=> (and (< _0_quant_0_6 0) (= (ControlFlow 0 169) 166)) anon116_correct)))
(let ((anon273_Then_correct  (=> (<= 0 _0_quant_0_6) (and (=> (= (ControlFlow 0 167) (- 0 168)) (or (not (<= 0 _0_quant_0_6)) (or (not (< _0_quant_0_6 (U_2_int (MapType0Select Heap@57 _2@2 val_int)))) (and (< _0_quant_0_6 3) (<= (read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$ (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize Heap@57 _1@0) _0_quant_0_6) (+ _0_quant_0_6 2)))))) (=> (or (not (<= 0 _0_quant_0_6)) (or (not (< _0_quant_0_6 (U_2_int (MapType0Select Heap@57 _2@2 val_int)))) (and (< _0_quant_0_6 3) (<= (read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$ (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize Heap@57 _1@0) _0_quant_0_6) (+ _0_quant_0_6 2))))) (=> (= (ControlFlow 0 167) 166) anon116_correct))))))
(let ((anon265_Else_correct  (=> (and (= Heap@57 (MapType0Store Heap@56 null (|usize#sm| _2@2) (MapType1Store (MapType0Select Heap@56 null (|usize#sm| _2@2)) _2@2 val_int (bool_2_U true)))) (state Heap@57 Mask@43)) (and (and (=> (= (ControlFlow 0 225) 224) anon272_Else_correct) (=> (= (ControlFlow 0 225) 167) anon273_Then_correct)) (=> (= (ControlFlow 0 225) 169) anon273_Else_correct)))))
(let ((anon111_correct true))
(let ((anon271_Else_correct  (=> (and (= perm@14 NoPerm) (= (ControlFlow 0 158) 155)) anon111_correct)))
(let ((anon271_Then_correct  (=> (not (= perm@14 NoPerm)) (and (=> (= (ControlFlow 0 156) (- 0 157)) (<= perm@14 (U_2_real (MapType1Select UnfoldingMask@17 null (Array$3$usize _1@0))))) (=> (<= perm@14 (U_2_real (MapType1Select UnfoldingMask@17 null (Array$3$usize _1@0)))) (=> (= (ControlFlow 0 156) 155) anon111_correct))))))
(let ((anon270_Then_correct  (=> (= perm@14 (read$ Heap@54)) (and (=> (= (ControlFlow 0 159) (- 0 160)) (>= perm@14 NoPerm)) (=> (>= perm@14 NoPerm) (and (=> (= (ControlFlow 0 159) 156) anon271_Then_correct) (=> (= (ControlFlow 0 159) 158) anon271_Else_correct)))))))
(let ((anon112_correct true))
(let ((anon269_Then_correct  (=> (< _0_quant_0_3 3) (and (=> (= (ControlFlow 0 161) 159) anon270_Then_correct) (=> (= (ControlFlow 0 161) 150) anon112_correct)))))
(let ((anon269_Else_correct  (=> (and (<= 3 _0_quant_0_3) (= (ControlFlow 0 154) 150)) anon112_correct)))
(let ((anon268_Then_correct  (=> (< _0_quant_0_3 (U_2_int (MapType0Select Heap@56 _2@2 val_int))) (and (=> (= (ControlFlow 0 162) 161) anon269_Then_correct) (=> (= (ControlFlow 0 162) 154) anon269_Else_correct)))))
(let ((anon268_Else_correct  (=> (and (<= (U_2_int (MapType0Select Heap@56 _2@2 val_int)) _0_quant_0_3) (= (ControlFlow 0 153) 150)) anon112_correct)))
(let ((anon267_Then_correct  (=> (<= 0 _0_quant_0_3) (and (=> (= (ControlFlow 0 163) (- 0 164)) (HasDirectPerm UnfoldingMask@17 _2@2 val_int)) (=> (HasDirectPerm UnfoldingMask@17 _2@2 val_int) (and (=> (= (ControlFlow 0 163) 162) anon268_Then_correct) (=> (= (ControlFlow 0 163) 153) anon268_Else_correct)))))))
(let ((anon267_Else_correct  (=> (and (< _0_quant_0_3 0) (= (ControlFlow 0 152) 150)) anon112_correct)))
(let ((anon266_Then_correct  (=> (<= 0 _0_quant_0_3) (and (=> (= (ControlFlow 0 165) 163) anon267_Then_correct) (=> (= (ControlFlow 0 165) 152) anon267_Else_correct)))))
(let ((anon266_Else_correct  (=> (and (< _0_quant_0_3 0) (= (ControlFlow 0 151) 150)) anon112_correct)))
(let ((anon103_correct  (=> (and (= UnfoldingMask@16 (MapType1Store Mask@43 null (usize _2@2) (real_2_U (- (U_2_real (MapType1Select Mask@43 null (usize _2@2))) FullPerm)))) (not (= _2@2 null))) (=> (and (and (= UnfoldingMask@17 (MapType1Store UnfoldingMask@16 _2@2 val_int (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@16 _2@2 val_int)) FullPerm)))) (state Heap@54 UnfoldingMask@17)) (and (<= 0 (U_2_int (MapType0Select Heap@54 _2@2 val_int))) (state Heap@54 UnfoldingMask@17))) (and (and (=> (= (ControlFlow 0 226) 225) anon265_Else_correct) (=> (= (ControlFlow 0 226) 165) anon266_Then_correct)) (=> (= (ControlFlow 0 226) 151) anon266_Else_correct))))))
(let ((anon264_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 229) 226)) anon103_correct)))
(let ((anon264_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 227) (- 0 228)) (<= FullPerm (U_2_real (MapType1Select Mask@43 null (usize _2@2))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@43 null (usize _2@2)))) (=> (= (ControlFlow 0 227) 226) anon103_correct))))))
(let ((anon101_correct  (=> (and (= UnfoldingMask@14 (MapType1Store Mask@43 null (usize _2@2) (real_2_U (- (U_2_real (MapType1Select Mask@43 null (usize _2@2))) FullPerm)))) (not (= _2@2 null))) (=> (and (and (= UnfoldingMask@15 (MapType1Store UnfoldingMask@14 _2@2 val_int (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@14 _2@2 val_int)) FullPerm)))) (state Heap@54 UnfoldingMask@15)) (and (<= 0 (U_2_int (MapType0Select Heap@54 _2@2 val_int))) (state Heap@54 UnfoldingMask@15))) (and (=> (= (ControlFlow 0 230) (- 0 232)) (HasDirectPerm UnfoldingMask@15 _2@2 val_int)) (=> (HasDirectPerm UnfoldingMask@15 _2@2 val_int) (=> (and (and (= Heap@55 (MapType0Store Heap@54 null (|usize#sm| _2@2) (MapType1Store (MapType0Select Heap@54 null (|usize#sm| _2@2)) _2@2 val_int (bool_2_U true)))) (state Heap@55 Mask@43)) (and (= Heap@56 (MapType0Store Heap@55 null (|usize#sm| _2@2) (MapType1Store (MapType0Select Heap@55 null (|usize#sm| _2@2)) _2@2 val_int (bool_2_U true)))) (state Heap@56 Mask@43))) (and (=> (= (ControlFlow 0 230) (- 0 231)) (< (U_2_int (MapType0Select Heap@56 _2@2 val_int)) 3)) (=> (< (U_2_int (MapType0Select Heap@56 _2@2 val_int)) 3) (=> (and (|usize#trigger| Heap@54 (usize _2@2)) (= (MapType0Select Heap@54 null (usize _2@2)) (FrameFragment (MapType0Select Heap@54 _2@2 val_int)))) (and (=> (= (ControlFlow 0 230) 227) anon264_Then_correct) (=> (= (ControlFlow 0 230) 229) anon264_Else_correct))))))))))))
(let ((anon263_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 235) 230)) anon101_correct)))
(let ((anon263_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 233) (- 0 234)) (<= FullPerm (U_2_real (MapType1Select Mask@43 null (usize _2@2))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@43 null (usize _2@2)))) (=> (= (ControlFlow 0 233) 230) anon101_correct))))))
(let ((anon99_correct  (=> (= Heap@54 (MapType0Store Heap@53 null (|usize#sm| _2@2) (MapType1Store (MapType0Select Heap@53 null (|usize#sm| _2@2)) _2@2 val_int (bool_2_U true)))) (=> (and (and (state Heap@54 Mask@43) (state Heap@54 Mask@43)) (and (|usize#trigger| Heap@54 (usize _2@2)) (= (MapType0Select Heap@54 null (usize _2@2)) (FrameFragment (MapType0Select Heap@54 _2@2 val_int))))) (and (=> (= (ControlFlow 0 236) 233) anon263_Then_correct) (=> (= (ControlFlow 0 236) 235) anon263_Else_correct))))))
(let ((anon262_Else_correct  (=> (HasDirectPerm Mask@43 null (usize _2@2)) (=> (and (= Heap@53 Heap@40) (= (ControlFlow 0 238) 236)) anon99_correct))))
(let ((anon262_Then_correct  (=> (not (HasDirectPerm Mask@43 null (usize _2@2))) (=> (and (and (= Heap@51 (MapType0Store Heap@40 null (|usize#sm| _2@2) ZeroPMask)) (= Heap@52 (MapType0Store Heap@51 null (usize _2@2) freshVersion@2))) (and (= Heap@53 Heap@52) (= (ControlFlow 0 237) 236))) anon99_correct))))
(let ((anon97_correct  (=> (= Mask@42 (MapType1Store Mask@33 _2@2 val_int (real_2_U (- (U_2_real (MapType1Select Mask@33 _2@2 val_int)) FullPerm)))) (and (=> (= (ControlFlow 0 239) (- 0 240)) (<= 0 (U_2_int (MapType0Select Heap@40 _2@2 val_int)))) (=> (<= 0 (U_2_int (MapType0Select Heap@40 _2@2 val_int))) (=> (= Mask@43 (MapType1Store Mask@42 null (usize _2@2) (real_2_U (+ (U_2_real (MapType1Select Mask@42 null (usize _2@2))) FullPerm)))) (=> (and (and (state Heap@40 Mask@43) (state Heap@40 Mask@43)) (and (|usize#trigger| Heap@40 (usize _2@2)) (= (MapType0Select Heap@40 null (usize _2@2)) (FrameFragment (MapType0Select Heap@40 _2@2 val_int))))) (and (=> (= (ControlFlow 0 239) 237) anon262_Then_correct) (=> (= (ControlFlow 0 239) 238) anon262_Else_correct)))))))))
(let ((anon261_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 243) 239)) anon97_correct)))
(let ((anon261_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 241) (- 0 242)) (<= FullPerm (U_2_real (MapType1Select Mask@33 _2@2 val_int)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@33 _2@2 val_int))) (=> (= (ControlFlow 0 241) 239) anon97_correct))))))
(let ((anon326_Then_correct  (=> __t29@1 (=> (and (state Heap@39 Mask@32) (state Heap@39 Mask@32)) (=> (and (and (and (state Heap@39 Mask@32) (U_2_bool (MapType0Select Heap@39 _8@3 $allocated))) (and (state Heap@39 Mask@32) (not (= _8@3 null)))) (and (and (= Mask@33 (MapType1Store Mask@32 _8@3 val_bool (real_2_U (+ (U_2_real (MapType1Select Mask@32 _8@3 val_bool)) FullPerm)))) (state Heap@39 Mask@33)) (and (state Heap@39 Mask@33) (state Heap@39 Mask@33)))) (and (=> (= (ControlFlow 0 244) (- 0 246)) (= FullPerm (U_2_real (MapType1Select Mask@33 _8@3 val_bool)))) (=> (= FullPerm (U_2_real (MapType1Select Mask@33 _8@3 val_bool))) (=> (and (= Heap@40 (MapType0Store Heap@39 _8@3 val_bool (bool_2_U false))) (state Heap@40 Mask@33)) (and (=> (= (ControlFlow 0 244) (- 0 245)) (HasDirectPerm Mask@33 _8@3 val_bool)) (=> (HasDirectPerm Mask@33 _8@3 val_bool) (=> (and (= __t30@1 (U_2_bool (MapType0Select Heap@40 _8@3 val_bool))) (state Heap@40 Mask@33)) (and (=> (= (ControlFlow 0 244) 241) anon261_Then_correct) (=> (= (ControlFlow 0 244) 243) anon261_Else_correct)))))))))))))
(let ((anon194_correct true))
(let ((anon321_Else_correct  (=> (and (= perm@15 NoPerm) (= (ControlFlow 0 137) 134)) anon194_correct)))
(let ((anon321_Then_correct  (=> (not (= perm@15 NoPerm)) (and (=> (= (ControlFlow 0 135) (- 0 136)) (<= perm@15 (U_2_real (MapType1Select Mask@27 null (Array$3$usize (MapType0Select Heap@36 _33@1 val_ref)))))) (=> (<= perm@15 (U_2_real (MapType1Select Mask@27 null (Array$3$usize (MapType0Select Heap@36 _33@1 val_ref))))) (=> (= (ControlFlow 0 135) 134) anon194_correct))))))
(let ((anon320_Then_correct  (=> (= perm@15 (read$ ExhaleHeap@1)) (and (=> (= (ControlFlow 0 138) (- 0 139)) (>= perm@15 NoPerm)) (=> (>= perm@15 NoPerm) (and (=> (= (ControlFlow 0 138) 135) anon321_Then_correct) (=> (= (ControlFlow 0 138) 137) anon321_Else_correct)))))))
(let ((anon198_correct true))
(let ((anon323_Else_correct  (=> (and (= perm@16 NoPerm) (= (ControlFlow 0 128) 125)) anon198_correct)))
(let ((anon323_Then_correct  (=> (not (= perm@16 NoPerm)) (and (=> (= (ControlFlow 0 126) (- 0 127)) (<= perm@16 (U_2_real (MapType1Select Mask@23 null (Array$3$usize (MapType0Select Heap@36 _33@1 val_ref)))))) (=> (<= perm@16 (U_2_real (MapType1Select Mask@23 null (Array$3$usize (MapType0Select Heap@36 _33@1 val_ref))))) (=> (= (ControlFlow 0 126) 125) anon198_correct))))))
(let ((anon322_Then_correct  (=> (= perm@16 (read$ Heap@36)) (and (=> (= (ControlFlow 0 129) (- 0 130)) (>= perm@16 NoPerm)) (=> (>= perm@16 NoPerm) (and (=> (= (ControlFlow 0 129) 126) anon323_Then_correct) (=> (= (ControlFlow 0 129) 128) anon323_Else_correct)))))))
(let ((anon199_correct true))
(let ((anon320_Else_correct  (and (=> (= (ControlFlow 0 131) (- 0 133)) true) (and (=> (= (ControlFlow 0 131) (- 0 132)) (HasDirectPerm Mask@23 _33@1 val_ref)) (=> (HasDirectPerm Mask@23 _33@1 val_ref) (and (=> (= (ControlFlow 0 131) 129) anon322_Then_correct) (=> (= (ControlFlow 0 131) 118) anon199_correct)))))))
(let ((anon319_Then_correct  (=> (< _0_quant_0_10 3) (and (=> (= (ControlFlow 0 140) (- 0 142)) true) (and (=> (= (ControlFlow 0 140) (- 0 141)) (HasDirectPerm Mask@23 _33@1 val_ref)) (=> (HasDirectPerm Mask@23 _33@1 val_ref) (and (=> (= (ControlFlow 0 140) 138) anon320_Then_correct) (=> (= (ControlFlow 0 140) 131) anon320_Else_correct))))))))
(let ((anon319_Else_correct  (=> (and (<= 3 _0_quant_0_10) (= (ControlFlow 0 124) 118)) anon199_correct)))
(let ((anon318_Then_correct  (=> (< _0_quant_0_10 3) (and (=> (= (ControlFlow 0 143) 140) anon319_Then_correct) (=> (= (ControlFlow 0 143) 124) anon319_Else_correct)))))
(let ((anon318_Else_correct  (=> (and (<= 3 _0_quant_0_10) (= (ControlFlow 0 123) 118)) anon199_correct)))
(let ((anon317_Then_correct  (=> (not (= _0_quant_0_10 _35@2)) (and (=> (= (ControlFlow 0 144) 143) anon318_Then_correct) (=> (= (ControlFlow 0 144) 123) anon318_Else_correct)))))
(let ((anon317_Else_correct  (=> (and (= _0_quant_0_10 _35@2) (= (ControlFlow 0 122) 118)) anon199_correct)))
(let ((anon316_Then_correct  (=> (< _0_quant_0_10 3) (and (=> (= (ControlFlow 0 145) (- 0 146)) true) (and (=> (= (ControlFlow 0 145) 144) anon317_Then_correct) (=> (= (ControlFlow 0 145) 122) anon317_Else_correct))))))
(let ((anon316_Else_correct  (=> (and (<= 3 _0_quant_0_10) (= (ControlFlow 0 121) 118)) anon199_correct)))
(let ((anon315_Then_correct  (=> (<= 0 _0_quant_0_10) (and (=> (= (ControlFlow 0 147) 145) anon316_Then_correct) (=> (= (ControlFlow 0 147) 121) anon316_Else_correct)))))
(let ((anon315_Else_correct  (=> (and (< _0_quant_0_10 0) (= (ControlFlow 0 120) 118)) anon199_correct)))
(let ((anon314_Then_correct  (=> (<= 0 _0_quant_0_10) (and (=> (= (ControlFlow 0 148) 147) anon315_Then_correct) (=> (= (ControlFlow 0 148) 120) anon315_Else_correct)))))
(let ((anon314_Else_correct  (=> (and (< _0_quant_0_10 0) (= (ControlFlow 0 119) 118)) anon199_correct)))
(let ((anon307_Then_correct true))
(let ((anon305_Then_correct true))
(let ((anon162_correct true))
(let ((anon302_Else_correct  (=> (and (= perm@17 NoPerm) (= (ControlFlow 0 109) 106)) anon162_correct)))
(let ((anon302_Then_correct  (=> (not (= perm@17 NoPerm)) (and (=> (= (ControlFlow 0 107) (- 0 108)) (<= perm@17 (U_2_real (MapType1Select Mask@13 null (Array$3$usize _1@0))))) (=> (<= perm@17 (U_2_real (MapType1Select Mask@13 null (Array$3$usize _1@0)))) (=> (= (ControlFlow 0 107) 106) anon162_correct))))))
(let ((anon301_Then_correct  (=> (= perm@17 (read$ Heap@28)) (and (=> (= (ControlFlow 0 110) (- 0 111)) (>= perm@17 NoPerm)) (=> (>= perm@17 NoPerm) (and (=> (= (ControlFlow 0 110) 107) anon302_Then_correct) (=> (= (ControlFlow 0 110) 109) anon302_Else_correct)))))))
(let ((anon163_correct true))
(let ((anon300_Then_correct  (=> (< _0_quant_0_8 3) (and (=> (= (ControlFlow 0 112) 110) anon301_Then_correct) (=> (= (ControlFlow 0 112) 101) anon163_correct)))))
(let ((anon300_Else_correct  (=> (and (<= 3 _0_quant_0_8) (= (ControlFlow 0 105) 101)) anon163_correct)))
(let ((anon299_Then_correct  (=> (< _0_quant_0_8 3) (and (=> (= (ControlFlow 0 113) 112) anon300_Then_correct) (=> (= (ControlFlow 0 113) 105) anon300_Else_correct)))))
(let ((anon299_Else_correct  (=> (and (<= 3 _0_quant_0_8) (= (ControlFlow 0 104) 101)) anon163_correct)))
(let ((anon298_Then_correct  (=> (<= _LET_1@0 _0_quant_0_8) (and (=> (= (ControlFlow 0 114) 113) anon299_Then_correct) (=> (= (ControlFlow 0 114) 104) anon299_Else_correct)))))
(let ((anon298_Else_correct  (=> (and (< _0_quant_0_8 _LET_1@0) (= (ControlFlow 0 103) 101)) anon163_correct)))
(let ((anon297_Then_correct  (=> (<= 0 _0_quant_0_8) (and (=> (= (ControlFlow 0 115) 114) anon298_Then_correct) (=> (= (ControlFlow 0 115) 103) anon298_Else_correct)))))
(let ((anon297_Else_correct  (=> (and (< _0_quant_0_8 0) (= (ControlFlow 0 102) 101)) anon163_correct)))
(let ((anon152_correct true))
(let ((anon295_Else_correct  (=> (and (= perm@18 NoPerm) (= (ControlFlow 0 93) 90)) anon152_correct)))
(let ((anon295_Then_correct  (=> (not (= perm@18 NoPerm)) (and (=> (= (ControlFlow 0 91) (- 0 92)) (<= perm@18 (U_2_real (MapType1Select Mask@13 null (Array$3$usize _1@0))))) (=> (<= perm@18 (U_2_real (MapType1Select Mask@13 null (Array$3$usize _1@0)))) (=> (= (ControlFlow 0 91) 90) anon152_correct))))))
(let ((anon294_Then_correct  (=> (= perm@18 (read$ Heap@28)) (and (=> (= (ControlFlow 0 94) (- 0 95)) (>= perm@18 NoPerm)) (=> (>= perm@18 NoPerm) (and (=> (= (ControlFlow 0 94) 91) anon295_Then_correct) (=> (= (ControlFlow 0 94) 93) anon295_Else_correct)))))))
(let ((anon153_correct true))
(let ((anon293_Then_correct  (=> (< _0_quant_0_7 3) (and (=> (= (ControlFlow 0 96) 94) anon294_Then_correct) (=> (= (ControlFlow 0 96) 85) anon153_correct)))))
(let ((anon293_Else_correct  (=> (and (<= 3 _0_quant_0_7) (= (ControlFlow 0 89) 85)) anon153_correct)))
(let ((anon292_Then_correct  (=> (< _0_quant_0_7 (U_2_int (MapType0Select Heap@28 _2@1 val_int))) (and (=> (= (ControlFlow 0 97) 96) anon293_Then_correct) (=> (= (ControlFlow 0 97) 89) anon293_Else_correct)))))
(let ((anon292_Else_correct  (=> (and (<= (U_2_int (MapType0Select Heap@28 _2@1 val_int)) _0_quant_0_7) (= (ControlFlow 0 88) 85)) anon153_correct)))
(let ((anon291_Then_correct  (=> (<= 0 _0_quant_0_7) (and (=> (= (ControlFlow 0 98) (- 0 99)) (HasDirectPerm Mask@13 _2@1 val_int)) (=> (HasDirectPerm Mask@13 _2@1 val_int) (and (=> (= (ControlFlow 0 98) 97) anon292_Then_correct) (=> (= (ControlFlow 0 98) 88) anon292_Else_correct)))))))
(let ((anon291_Else_correct  (=> (and (< _0_quant_0_7 0) (= (ControlFlow 0 87) 85)) anon153_correct)))
(let ((anon290_Then_correct  (=> (<= 0 _0_quant_0_7) (and (=> (= (ControlFlow 0 100) 98) anon291_Then_correct) (=> (= (ControlFlow 0 100) 87) anon291_Else_correct)))))
(let ((anon290_Else_correct  (=> (and (< _0_quant_0_7 0) (= (ControlFlow 0 86) 85)) anon153_correct)))
(let ((anon49_correct true))
(let ((anon240_Else_correct  (=> (and (= perm@19 NoPerm) (= (ControlFlow 0 77) 74)) anon49_correct)))
(let ((anon240_Then_correct  (=> (not (= perm@19 NoPerm)) (and (=> (= (ControlFlow 0 75) (- 0 76)) (<= perm@19 (U_2_real (MapType1Select UnfoldingMask@5 null (Array$3$usize _1@0))))) (=> (<= perm@19 (U_2_real (MapType1Select UnfoldingMask@5 null (Array$3$usize _1@0)))) (=> (= (ControlFlow 0 75) 74) anon49_correct))))))
(let ((anon239_Then_correct  (=> (= perm@19 (read$ Heap@6)) (and (=> (= (ControlFlow 0 78) (- 0 79)) (>= perm@19 NoPerm)) (=> (>= perm@19 NoPerm) (and (=> (= (ControlFlow 0 78) 75) anon240_Then_correct) (=> (= (ControlFlow 0 78) 77) anon240_Else_correct)))))))
(let ((anon50_correct true))
(let ((anon238_Then_correct  (=> (< _0_quant_0_2 3) (and (=> (= (ControlFlow 0 80) 78) anon239_Then_correct) (=> (= (ControlFlow 0 80) 69) anon50_correct)))))
(let ((anon238_Else_correct  (=> (and (<= 3 _0_quant_0_2) (= (ControlFlow 0 73) 69)) anon50_correct)))
(let ((anon237_Then_correct  (=> (< _0_quant_0_2 3) (and (=> (= (ControlFlow 0 81) 80) anon238_Then_correct) (=> (= (ControlFlow 0 81) 73) anon238_Else_correct)))))
(let ((anon237_Else_correct  (=> (and (<= 3 _0_quant_0_2) (= (ControlFlow 0 72) 69)) anon50_correct)))
(let ((anon236_Then_correct  (=> (<= _LET_0@0 _0_quant_0_2) (and (=> (= (ControlFlow 0 82) 81) anon237_Then_correct) (=> (= (ControlFlow 0 82) 72) anon237_Else_correct)))))
(let ((anon236_Else_correct  (=> (and (< _0_quant_0_2 _LET_0@0) (= (ControlFlow 0 71) 69)) anon50_correct)))
(let ((anon235_Then_correct  (=> (<= 0 _0_quant_0_2) (and (=> (= (ControlFlow 0 83) 82) anon236_Then_correct) (=> (= (ControlFlow 0 83) 71) anon236_Else_correct)))))
(let ((anon235_Else_correct  (=> (and (< _0_quant_0_2 0) (= (ControlFlow 0 70) 69)) anon50_correct)))
(let ((anon38_correct true))
(let ((anon232_Else_correct  (=> (and (< _0_quant_0_1 0) (= (ControlFlow 0 68) 65)) anon38_correct)))
(let ((anon232_Then_correct  (=> (<= 0 _0_quant_0_1) (and (=> (= (ControlFlow 0 66) (- 0 67)) (or (not (<= 0 _0_quant_0_1)) (or (not (< _0_quant_0_1 (U_2_int (MapType0Select Heap@9 _2@0 val_int)))) (and (< _0_quant_0_1 3) (<= (read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$ (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize Heap@9 _1@0) _0_quant_0_1) (+ _0_quant_0_1 2)))))) (=> (or (not (<= 0 _0_quant_0_1)) (or (not (< _0_quant_0_1 (U_2_int (MapType0Select Heap@9 _2@0 val_int)))) (and (< _0_quant_0_1 3) (<= (read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$ (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize Heap@9 _1@0) _0_quant_0_1) (+ _0_quant_0_1 2))))) (=> (= (ControlFlow 0 66) 65) anon38_correct))))))
(let ((anon33_correct true))
(let ((anon230_Else_correct  (=> (and (= perm@20 NoPerm) (= (ControlFlow 0 57) 54)) anon33_correct)))
(let ((anon230_Then_correct  (=> (not (= perm@20 NoPerm)) (and (=> (= (ControlFlow 0 55) (- 0 56)) (<= perm@20 (U_2_real (MapType1Select UnfoldingMask@3 null (Array$3$usize _1@0))))) (=> (<= perm@20 (U_2_real (MapType1Select UnfoldingMask@3 null (Array$3$usize _1@0)))) (=> (= (ControlFlow 0 55) 54) anon33_correct))))))
(let ((anon229_Then_correct  (=> (= perm@20 (read$ Heap@6)) (and (=> (= (ControlFlow 0 58) (- 0 59)) (>= perm@20 NoPerm)) (=> (>= perm@20 NoPerm) (and (=> (= (ControlFlow 0 58) 55) anon230_Then_correct) (=> (= (ControlFlow 0 58) 57) anon230_Else_correct)))))))
(let ((anon34_correct true))
(let ((anon228_Then_correct  (=> (< _0_quant_0 3) (and (=> (= (ControlFlow 0 60) 58) anon229_Then_correct) (=> (= (ControlFlow 0 60) 49) anon34_correct)))))
(let ((anon228_Else_correct  (=> (and (<= 3 _0_quant_0) (= (ControlFlow 0 53) 49)) anon34_correct)))
(let ((anon227_Then_correct  (=> (< _0_quant_0 (U_2_int (MapType0Select Heap@8 _2@0 val_int))) (and (=> (= (ControlFlow 0 61) 60) anon228_Then_correct) (=> (= (ControlFlow 0 61) 53) anon228_Else_correct)))))
(let ((anon227_Else_correct  (=> (and (<= (U_2_int (MapType0Select Heap@8 _2@0 val_int)) _0_quant_0) (= (ControlFlow 0 52) 49)) anon34_correct)))
(let ((anon226_Then_correct  (=> (<= 0 _0_quant_0) (and (=> (= (ControlFlow 0 62) (- 0 63)) (HasDirectPerm UnfoldingMask@3 _2@0 val_int)) (=> (HasDirectPerm UnfoldingMask@3 _2@0 val_int) (and (=> (= (ControlFlow 0 62) 61) anon227_Then_correct) (=> (= (ControlFlow 0 62) 52) anon227_Else_correct)))))))
(let ((anon226_Else_correct  (=> (and (< _0_quant_0 0) (= (ControlFlow 0 51) 49)) anon34_correct)))
(let ((anon225_Then_correct  (=> (<= 0 _0_quant_0) (and (=> (= (ControlFlow 0 64) 62) anon226_Then_correct) (=> (= (ControlFlow 0 64) 51) anon226_Else_correct)))))
(let ((anon225_Else_correct  (=> (and (< _0_quant_0 0) (= (ControlFlow 0 50) 49)) anon34_correct)))
(let ((anon85_correct  (=> (= Mask@41 (MapType1Store Mask@35 null (Array$3$usize _1@0) (real_2_U (- (U_2_real (MapType1Select Mask@35 null (Array$3$usize _1@0))) perm@11)))) (and (=> (= (ControlFlow 0 25) (- 0 26)) (<= 0 1)) (=> (<= 0 1) (=> (= (ControlFlow 0 25) (- 0 24)) (< 1 3)))))))
(let ((anon256_Else_correct  (=> (and (= perm@11 NoPerm) (= (ControlFlow 0 29) 25)) anon85_correct)))
(let ((anon256_Then_correct  (=> (not (= perm@11 NoPerm)) (and (=> (= (ControlFlow 0 27) (- 0 28)) (<= perm@11 (U_2_real (MapType1Select Mask@35 null (Array$3$usize _1@0))))) (=> (<= perm@11 (U_2_real (MapType1Select Mask@35 null (Array$3$usize _1@0)))) (=> (= (ControlFlow 0 27) 25) anon85_correct))))))
(let ((anon255_Then_correct  (=> (= perm@11 (read$ Heap@42)) (and (=> (= (ControlFlow 0 30) (- 0 31)) (>= perm@11 NoPerm)) (=> (>= perm@11 NoPerm) (and (=> (= (ControlFlow 0 30) 27) anon256_Then_correct) (=> (= (ControlFlow 0 30) 29) anon256_Else_correct)))))))
(let ((end_of_method_correct true))
(let ((anon250_Else_correct  (=> (not __t20@1) (=> (and (state Heap@27 Mask@12) (state Heap@27 Mask@12)) (=> (and (and (state Heap@27 Mask@12) (= Mask@40 Mask@12)) (and (= Heap@50 Heap@27) (= (ControlFlow 0 84) 3))) end_of_method_correct)))))
(let ((anon94_correct  (=> (and (= Mask@39 (MapType1Store Mask@38 null (usize _0@0) (real_2_U (- (U_2_real (MapType1Select Mask@38 null (usize _0@0))) FullPerm)))) (IdenticalOnKnownLocations Heap@49 ExhaleHeap@2 Mask@39)) (=> (and (and (state ExhaleHeap@2 Mask@39) (= Mask@40 Mask@39)) (and (= Heap@50 ExhaleHeap@2) (= (ControlFlow 0 4) 3))) end_of_method_correct))))
(let ((anon260_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 7) 4)) anon94_correct)))
(let ((anon260_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 5) (- 0 6)) (<= FullPerm (U_2_real (MapType1Select Mask@38 null (usize _0@0))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@38 null (usize _0@0)))) (=> (= (ControlFlow 0 5) 4) anon94_correct))))))
(let ((anon92_correct  (=> (and (= UnfoldingMask@12 (MapType1Store Mask@38 null (usize _0@0) (real_2_U (- (U_2_real (MapType1Select Mask@38 null (usize _0@0))) FullPerm)))) (not (= _0@0 null))) (=> (and (and (= UnfoldingMask@13 (MapType1Store UnfoldingMask@12 _0@0 val_int (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@12 _0@0 val_int)) FullPerm)))) (state Heap@47 UnfoldingMask@13)) (and (<= 0 (U_2_int (MapType0Select Heap@47 _0@0 val_int))) (state Heap@47 UnfoldingMask@13))) (and (=> (= (ControlFlow 0 8) (- 0 10)) (HasDirectPerm UnfoldingMask@13 _0@0 val_int)) (=> (HasDirectPerm UnfoldingMask@13 _0@0 val_int) (=> (and (= Heap@48 (MapType0Store Heap@47 null (|usize#sm| _0@0) (MapType1Store (MapType0Select Heap@47 null (|usize#sm| _0@0)) _0@0 val_int (bool_2_U true)))) (state Heap@48 Mask@38)) (and (=> (= (ControlFlow 0 8) (- 0 9)) (<= (U_2_int (MapType0Select Heap@48 _0@0 val_int)) 3)) (=> (<= (U_2_int (MapType0Select Heap@48 _0@0 val_int)) 3) (=> (and (and (= Heap@49 (MapType0Store Heap@48 null (|usize#sm| _0@0) (MapType1Store (MapType0Select Heap@48 null (|usize#sm| _0@0)) _0@0 val_int (bool_2_U true)))) (state Heap@49 Mask@38)) (and (state Heap@49 Mask@38) (state Heap@49 Mask@38))) (and (=> (= (ControlFlow 0 8) 5) anon260_Then_correct) (=> (= (ControlFlow 0 8) 7) anon260_Else_correct))))))))))))
(let ((anon259_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 13) 8)) anon92_correct)))
(let ((anon259_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 11) (- 0 12)) (<= FullPerm (U_2_real (MapType1Select Mask@38 null (usize _0@0))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@38 null (usize _0@0)))) (=> (= (ControlFlow 0 11) 8) anon92_correct))))))
(let ((anon90_correct  (=> (= Heap@47 (MapType0Store Heap@46 null (|usize#sm| _0@0) (MapType1Store (MapType0Select Heap@46 null (|usize#sm| _0@0)) _0@0 val_int (bool_2_U true)))) (=> (and (and (state Heap@47 Mask@38) (state Heap@47 Mask@38)) (and (|usize#trigger| Heap@47 (usize _0@0)) (= (MapType0Select Heap@47 null (usize _0@0)) (FrameFragment (MapType0Select Heap@47 _0@0 val_int))))) (and (=> (= (ControlFlow 0 14) 11) anon259_Then_correct) (=> (= (ControlFlow 0 14) 13) anon259_Else_correct))))))
(let ((anon258_Else_correct  (=> (HasDirectPerm Mask@38 null (usize _0@0)) (=> (and (= Heap@46 Heap@43) (= (ControlFlow 0 16) 14)) anon90_correct))))
(let ((anon258_Then_correct  (=> (not (HasDirectPerm Mask@38 null (usize _0@0))) (=> (and (and (= Heap@44 (MapType0Store Heap@43 null (|usize#sm| _0@0) ZeroPMask)) (= Heap@45 (MapType0Store Heap@44 null (usize _0@0) freshVersion@1))) (and (= Heap@46 Heap@45) (= (ControlFlow 0 15) 14))) anon90_correct))))
(let ((anon88_correct  (=> (= Mask@37 (MapType1Store Mask@36 _0@0 val_int (real_2_U (- (U_2_real (MapType1Select Mask@36 _0@0 val_int)) FullPerm)))) (and (=> (= (ControlFlow 0 17) (- 0 18)) (<= 0 (U_2_int (MapType0Select Heap@43 _0@0 val_int)))) (=> (<= 0 (U_2_int (MapType0Select Heap@43 _0@0 val_int))) (=> (= Mask@38 (MapType1Store Mask@37 null (usize _0@0) (real_2_U (+ (U_2_real (MapType1Select Mask@37 null (usize _0@0))) FullPerm)))) (=> (and (and (state Heap@43 Mask@38) (state Heap@43 Mask@38)) (and (|usize#trigger| Heap@43 (usize _0@0)) (= (MapType0Select Heap@43 null (usize _0@0)) (FrameFragment (MapType0Select Heap@43 _0@0 val_int))))) (and (=> (= (ControlFlow 0 17) 15) anon258_Then_correct) (=> (= (ControlFlow 0 17) 16) anon258_Else_correct)))))))))
(let ((anon257_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 21) 17)) anon88_correct)))
(let ((anon257_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 19) (- 0 20)) (<= FullPerm (U_2_real (MapType1Select Mask@36 _0@0 val_int)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@36 _0@0 val_int))) (=> (= (ControlFlow 0 19) 17) anon88_correct))))))
(let ((anon255_Else_correct  (=> (and (= (lookup_pure__$TY$__Array$3$usize$usize$Array$3$usize$$int$$$int$ Heap@42 _1@0 1) __t32@0) (state Heap@42 Mask@35)) (=> (and (and (state Heap@42 Mask@35) (state Heap@42 Mask@35)) (and (U_2_bool (MapType0Select Heap@42 _0@0 $allocated)) (state Heap@42 Mask@35))) (=> (and (and (and (not (= _0@0 null)) (= Mask@36 (MapType1Store Mask@35 _0@0 val_int (real_2_U (+ (U_2_real (MapType1Select Mask@35 _0@0 val_int)) FullPerm))))) (and (state Heap@42 Mask@36) (state Heap@42 Mask@36))) (and (and (state Heap@42 Mask@36) (>= __t32@0 0)) (and (state Heap@42 Mask@36) (state Heap@42 Mask@36)))) (and (=> (= (ControlFlow 0 22) (- 0 23)) (= FullPerm (U_2_real (MapType1Select Mask@36 _0@0 val_int)))) (=> (= FullPerm (U_2_real (MapType1Select Mask@36 _0@0 val_int))) (=> (and (and (= Heap@43 (MapType0Store Heap@42 _0@0 val_int (int_2_U __t32@0))) (state Heap@43 Mask@36)) (and (state Heap@43 Mask@36) (state Heap@43 Mask@36))) (and (=> (= (ControlFlow 0 22) 19) anon257_Then_correct) (=> (= (ControlFlow 0 22) 21) anon257_Else_correct))))))))))
(let ((anon82_correct  (=> (= AssertMask@3 (MapType1Store Mask@35 null (Array$3$usize _1@0) (real_2_U (- (U_2_real (MapType1Select Mask@35 null (Array$3$usize _1@0))) perm@10)))) (=> (and (state Heap@42 Mask@35) (state Heap@42 Mask@35)) (and (=> (= (ControlFlow 0 32) 30) anon255_Then_correct) (=> (= (ControlFlow 0 32) 22) anon255_Else_correct))))))
(let ((anon254_Else_correct  (=> (and (= perm@10 NoPerm) (= (ControlFlow 0 35) 32)) anon82_correct)))
(let ((anon254_Then_correct  (=> (not (= perm@10 NoPerm)) (and (=> (= (ControlFlow 0 33) (- 0 34)) (<= perm@10 (U_2_real (MapType1Select Mask@35 null (Array$3$usize _1@0))))) (=> (<= perm@10 (U_2_real (MapType1Select Mask@35 null (Array$3$usize _1@0)))) (=> (= (ControlFlow 0 33) 32) anon82_correct))))))
(let ((anon253_Else_correct  (=> (= perm@10 (read$ Heap@42)) (and (=> (= (ControlFlow 0 36) (- 0 37)) (>= perm@10 NoPerm)) (=> (>= perm@10 NoPerm) (and (=> (= (ControlFlow 0 36) 33) anon254_Then_correct) (=> (= (ControlFlow 0 36) 35) anon254_Else_correct)))))))
(let ((anon253_Then_correct true))
(let ((anon78_correct  (=> (= AssertMask@2 (MapType1Store Mask@34 null (Array$3$usize _1@0) (real_2_U (- (U_2_real (MapType1Select Mask@34 null (Array$3$usize _1@0))) perm@9)))) (=> (and (and (state Heap@41 Mask@34) (state Heap@41 Mask@34)) (and (state Heap@41 Mask@34) (state Heap@41 Mask@34))) (=> (and (and (and (state Heap@41 Mask@34) (U_2_bool (MapType0Select Heap@41 _43@0 $allocated))) (and (state Heap@41 Mask@34) (not (= _43@0 null)))) (and (and (= Mask@35 (MapType1Store Mask@34 _43@0 val_bool (real_2_U (+ (U_2_real (MapType1Select Mask@34 _43@0 val_bool)) FullPerm)))) (state Heap@41 Mask@35)) (and (state Heap@41 Mask@35) (state Heap@41 Mask@35)))) (and (=> (= (ControlFlow 0 38) (- 0 41)) (= FullPerm (U_2_real (MapType1Select Mask@35 _43@0 val_bool)))) (=> (= FullPerm (U_2_real (MapType1Select Mask@35 _43@0 val_bool))) (=> (and (= Heap@42 (MapType0Store Heap@41 _43@0 val_bool (bool_2_U (< 1 3)))) (state Heap@42 Mask@35)) (and (=> (= (ControlFlow 0 38) (- 0 40)) (HasDirectPerm Mask@35 _43@0 val_bool)) (=> (HasDirectPerm Mask@35 _43@0 val_bool) (=> (and (= __t31@0 (U_2_bool (MapType0Select Heap@42 _43@0 val_bool))) (state Heap@42 Mask@35)) (and (=> (= (ControlFlow 0 38) (- 0 39)) __t31@0) (=> __t31@0 (=> (state Heap@42 Mask@35) (=> (and (state Heap@42 Mask@35) (state Heap@42 Mask@35)) (=> (and (and (state Heap@42 Mask@35) (>= __t32@0 0)) (and (state Heap@42 Mask@35) (state Heap@42 Mask@35))) (and (=> (= (ControlFlow 0 38) 2) anon253_Then_correct) (=> (= (ControlFlow 0 38) 36) anon253_Else_correct))))))))))))))))))
(let ((anon252_Else_correct  (=> (and (= perm@9 NoPerm) (= (ControlFlow 0 44) 38)) anon78_correct)))
(let ((anon252_Then_correct  (=> (not (= perm@9 NoPerm)) (and (=> (= (ControlFlow 0 42) (- 0 43)) (<= perm@9 (U_2_real (MapType1Select Mask@34 null (Array$3$usize _1@0))))) (=> (<= perm@9 (U_2_real (MapType1Select Mask@34 null (Array$3$usize _1@0)))) (=> (= (ControlFlow 0 42) 38) anon78_correct))))))
(let ((anon251_Else_correct  (=> (= perm@9 (read$ Heap@41)) (and (=> (= (ControlFlow 0 45) (- 0 46)) (>= perm@9 NoPerm)) (=> (>= perm@9 NoPerm) (and (=> (= (ControlFlow 0 45) 42) anon252_Then_correct) (=> (= (ControlFlow 0 45) 44) anon252_Else_correct)))))))
(let ((anon251_Then_correct true))
(let ((l1_correct  (=> (state Heap@41 Mask@34) (=> (and (and (state Heap@41 Mask@34) (state Heap@41 Mask@34)) (and (state Heap@41 Mask@34) (state Heap@41 Mask@34))) (and (=> (= (ControlFlow 0 47) 1) anon251_Then_correct) (=> (= (ControlFlow 0 47) 45) anon251_Else_correct))))))
(let ((anon326_Else_correct  (=> (not __t29@1) (=> (and (state Heap@39 Mask@32) (state Heap@39 Mask@32)) (=> (and (and (state Heap@39 Mask@32) (= Mask@34 Mask@32)) (and (= Heap@41 Heap@39) (= (ControlFlow 0 149) 47))) l1_correct)))))
(let ((anon324_Else_correct  (and (=> (= (ControlFlow 0 247) (- 0 263)) true) (and (=> (= (ControlFlow 0 247) (- 0 262)) true) (=> (= (read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$ (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize ExhaleHeap@1 (MapType0Select Heap@36 _33@1 val_ref)) _35@2) _36@2) (=> (and (and (state ExhaleHeap@1 Mask@27) (state ExhaleHeap@1 Mask@27)) (and (state ExhaleHeap@1 Mask@27) (state ExhaleHeap@1 Mask@27))) (=> (and (and (and (state ExhaleHeap@1 Mask@27) (U_2_bool (MapType0Select ExhaleHeap@1 _37@1 $allocated))) (and (state ExhaleHeap@1 Mask@27) (not (= _37@1 null)))) (and (and (= Mask@28 (MapType1Store Mask@27 _37@1 tuple_0 (real_2_U (+ (U_2_real (MapType1Select Mask@27 _37@1 tuple_0)) FullPerm)))) (state ExhaleHeap@1 Mask@28)) (and (state ExhaleHeap@1 Mask@28) (state ExhaleHeap@1 Mask@28)))) (and (=> (= (ControlFlow 0 247) (- 0 261)) (HasDirectPerm Mask@28 _37@1 tuple_0)) (=> (HasDirectPerm Mask@28 _37@1 tuple_0) (=> (and (not (= (MapType0Select ExhaleHeap@1 _37@1 tuple_0) null)) (= Mask@29 (MapType1Store Mask@28 (MapType0Select ExhaleHeap@1 _37@1 tuple_0) val_int (real_2_U (+ (U_2_real (MapType1Select Mask@28 (MapType0Select ExhaleHeap@1 _37@1 tuple_0) val_int)) FullPerm))))) (=> (and (and (and (state ExhaleHeap@1 Mask@29) (state ExhaleHeap@1 Mask@29)) (and (state ExhaleHeap@1 Mask@29) (not (= _37@1 null)))) (and (and (= Mask@30 (MapType1Store Mask@29 _37@1 tuple_1 (real_2_U (+ (U_2_real (MapType1Select Mask@29 _37@1 tuple_1)) FullPerm)))) (state ExhaleHeap@1 Mask@30)) (and (state ExhaleHeap@1 Mask@30) (state ExhaleHeap@1 Mask@30)))) (and (=> (= (ControlFlow 0 247) (- 0 260)) (HasDirectPerm Mask@30 _37@1 tuple_1)) (=> (HasDirectPerm Mask@30 _37@1 tuple_1) (=> (not (= (MapType0Select ExhaleHeap@1 _37@1 tuple_1) null)) (=> (and (and (= Mask@31 (MapType1Store Mask@30 (MapType0Select ExhaleHeap@1 _37@1 tuple_1) val_bool (real_2_U (+ (U_2_real (MapType1Select Mask@30 (MapType0Select ExhaleHeap@1 _37@1 tuple_1) val_bool)) FullPerm)))) (state ExhaleHeap@1 Mask@31)) (and (state ExhaleHeap@1 Mask@31) (state ExhaleHeap@1 Mask@31))) (and (=> (= (ControlFlow 0 247) (- 0 259)) (HasDirectPerm Mask@31 _37@1 tuple_0)) (=> (HasDirectPerm Mask@31 _37@1 tuple_0) (and (=> (= (ControlFlow 0 247) (- 0 258)) (HasDirectPerm Mask@31 _2@1 val_int)) (=> (HasDirectPerm Mask@31 _2@1 val_int) (and (=> (= (ControlFlow 0 247) (- 0 257)) (= FullPerm (U_2_real (MapType1Select Mask@31 (MapType0Select ExhaleHeap@1 _37@1 tuple_0) val_int)))) (=> (= FullPerm (U_2_real (MapType1Select Mask@31 (MapType0Select ExhaleHeap@1 _37@1 tuple_0) val_int))) (=> (and (= Heap@37 (MapType0Store ExhaleHeap@1 (MapType0Select ExhaleHeap@1 _37@1 tuple_0) val_int (int_2_U (+ (U_2_int (MapType0Select ExhaleHeap@1 _2@1 val_int)) 1)))) (state Heap@37 Mask@31)) (and (=> (= (ControlFlow 0 247) (- 0 256)) (HasDirectPerm Mask@31 _37@1 tuple_1)) (=> (HasDirectPerm Mask@31 _37@1 tuple_1) (and (=> (= (ControlFlow 0 247) (- 0 255)) (= FullPerm (U_2_real (MapType1Select Mask@31 (MapType0Select Heap@37 _37@1 tuple_1) val_bool)))) (=> (= FullPerm (U_2_real (MapType1Select Mask@31 (MapType0Select Heap@37 _37@1 tuple_1) val_bool))) (=> (and (= Heap@38 (MapType0Store Heap@37 (MapType0Select Heap@37 _37@1 tuple_1) val_bool (bool_2_U false))) (state Heap@38 Mask@31)) (and (=> (= (ControlFlow 0 247) (- 0 254)) (HasDirectPerm Mask@31 _37@1 tuple_1)) (=> (HasDirectPerm Mask@31 _37@1 tuple_1) (and (=> (= (ControlFlow 0 247) (- 0 253)) (HasDirectPerm Mask@31 (MapType0Select Heap@38 _37@1 tuple_1) val_bool)) (=> (HasDirectPerm Mask@31 (MapType0Select Heap@38 _37@1 tuple_1) val_bool) (=> (and (= __t28@1 (U_2_bool (MapType0Select Heap@38 (MapType0Select Heap@38 _37@1 tuple_1) val_bool))) (state Heap@38 Mask@31)) (and (=> (= (ControlFlow 0 247) (- 0 252)) (not __t28@1)) (=> (not __t28@1) (=> (and (state Heap@38 Mask@31) (state Heap@38 Mask@31)) (and (=> (= (ControlFlow 0 247) (- 0 251)) (HasDirectPerm Mask@31 _37@1 tuple_0)) (=> (HasDirectPerm Mask@31 _37@1 tuple_0) (=> (= _2@2 (MapType0Select Heap@38 _37@1 tuple_0)) (=> (and (state Heap@38 Mask@31) (state Heap@38 Mask@31)) (=> (and (and (state Heap@38 Mask@31) (state Heap@38 Mask@31)) (and (state Heap@38 Mask@31) (state Heap@38 Mask@31))) (and (=> (= (ControlFlow 0 247) (- 0 250)) (HasDirectPerm Mask@31 _2@2 val_int)) (=> (HasDirectPerm Mask@31 _2@2 val_int) (=> (= _6@6 (U_2_int (MapType0Select Heap@38 _2@2 val_int))) (=> (and (state Heap@38 Mask@31) (state Heap@38 Mask@31)) (=> (and (and (and (state Heap@38 Mask@31) (U_2_bool (MapType0Select Heap@38 _5@3 $allocated))) (and (state Heap@38 Mask@31) (not (= _5@3 null)))) (and (and (= Mask@32 (MapType1Store Mask@31 _5@3 val_bool (real_2_U (+ (U_2_real (MapType1Select Mask@31 _5@3 val_bool)) FullPerm)))) (state Heap@38 Mask@32)) (and (state Heap@38 Mask@32) (state Heap@38 Mask@32)))) (and (=> (= (ControlFlow 0 247) (- 0 249)) (= FullPerm (U_2_real (MapType1Select Mask@32 _5@3 val_bool)))) (=> (= FullPerm (U_2_real (MapType1Select Mask@32 _5@3 val_bool))) (=> (and (= Heap@39 (MapType0Store Heap@38 _5@3 val_bool (bool_2_U (< _6@6 3)))) (state Heap@39 Mask@32)) (and (=> (= (ControlFlow 0 247) (- 0 248)) (HasDirectPerm Mask@32 _5@3 val_bool)) (=> (HasDirectPerm Mask@32 _5@3 val_bool) (=> (and (= __t29@1 (U_2_bool (MapType0Select Heap@39 _5@3 val_bool))) (state Heap@39 Mask@32)) (and (=> (= (ControlFlow 0 247) 244) anon326_Then_correct) (=> (= (ControlFlow 0 247) 149) anon326_Else_correct)))))))))))))))))))))))))))))))))))))))))))))))))))))
(let ((anon313_Else_correct  (=> (forall ((_0_quant_0_15 Int) ) (!  (=> (<= 0 _0_quant_0_15) (or (not (<= 0 _0_quant_0_15)) (or (not (< _0_quant_0_15 3)) (or (= _0_quant_0_15 _35@2) (and (< _0_quant_0_15 3) (and (< _0_quant_0_15 3) (= (read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$ (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize ExhaleHeap@1 (MapType0Select Heap@36 _33@1 val_ref)) _0_quant_0_15) (read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$ (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize Heap@36 (MapType0Select Heap@36 _33@1 val_ref)) _0_quant_0_15))))))))
 :qid |Ex2originalbpl.5439:20|
 :skolemid |128|
 :pattern ( (read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$ (|snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize#frame| (ConditionalFrame (read$ ExhaleHeap@1) (MapType0Select ExhaleHeap@1 null (Array$3$usize (MapType0Select Heap@36 _33@1 val_ref)))) (MapType0Select Heap@36 _33@1 val_ref)) _0_quant_0_15))
)) (and (=> (= (ControlFlow 0 270) (- 0 273)) true) (=> (and (< _35@2 3) (state ExhaleHeap@1 Mask@27)) (and (=> (= (ControlFlow 0 270) (- 0 272)) true) (and (=> (= (ControlFlow 0 270) (- 0 271)) (HasDirectPerm Mask@23 _33@1 val_ref)) (=> (HasDirectPerm Mask@23 _33@1 val_ref) (and (=> (= (ControlFlow 0 270) 268) anon324_Then_correct) (=> (= (ControlFlow 0 270) 247) anon324_Else_correct))))))))))
(let ((anon184_correct  (=> (= Mask@25 (MapType1Store Mask@24 null (Array$3$usize (MapType0Select Heap@36 _33@1 val_ref)) (real_2_U (- (U_2_real (MapType1Select Mask@24 null (Array$3$usize (MapType0Select Heap@36 _33@1 val_ref)))) FullPerm)))) (and (=> (= (ControlFlow 0 274) (- 0 278)) (>= _35@2 0)) (=> (>= _35@2 0) (and (=> (= (ControlFlow 0 274) (- 0 277)) (>= _36@2 0)) (=> (>= _36@2 0) (=> (IdenticalOnKnownLocations Heap@36 ExhaleHeap@1 Mask@25) (=> (and (and (state ExhaleHeap@1 Mask@25) (state ExhaleHeap@1 Mask@25)) (and (U_2_bool (MapType0Select ExhaleHeap@1 _32@1 $allocated)) (state ExhaleHeap@1 Mask@25))) (and (=> (= (ControlFlow 0 274) (- 0 276)) true) (and (=> (= (ControlFlow 0 274) (- 0 275)) (HasDirectPerm Mask@23 _33@1 val_ref)) (=> (HasDirectPerm Mask@23 _33@1 val_ref) (=> (= Mask@26 (MapType1Store Mask@25 null (Array$3$usize (MapType0Select Heap@36 _33@1 val_ref)) (real_2_U (+ (U_2_real (MapType1Select Mask@25 null (Array$3$usize (MapType0Select Heap@36 _33@1 val_ref)))) FullPerm)))) (=> (and (state ExhaleHeap@1 Mask@26) (state ExhaleHeap@1 Mask@26)) (=> (and (and (and (state ExhaleHeap@1 Mask@26) (= Mask@27 (MapType1Store Mask@26 null (tuple0$ _32@1) (real_2_U (+ (U_2_real (MapType1Select Mask@26 null (tuple0$ _32@1))) FullPerm))))) (and (state ExhaleHeap@1 Mask@27) (state ExhaleHeap@1 Mask@27))) (and (and (state ExhaleHeap@1 Mask@27) (state ExhaleHeap@1 Mask@27)) (and (state ExhaleHeap@1 Mask@27) (state ExhaleHeap@1 Mask@27)))) (and (and (=> (= (ControlFlow 0 274) 270) anon313_Else_correct) (=> (= (ControlFlow 0 274) 148) anon314_Then_correct)) (=> (= (ControlFlow 0 274) 119) anon314_Else_correct)))))))))))))))))
(let ((anon312_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 281) 274)) anon184_correct)))
(let ((anon312_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 279) (- 0 280)) (<= FullPerm (U_2_real (MapType1Select Mask@24 null (Array$3$usize (MapType0Select Heap@36 _33@1 val_ref)))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@24 null (Array$3$usize (MapType0Select Heap@36 _33@1 val_ref))))) (=> (= (ControlFlow 0 279) 274) anon184_correct))))))
(let ((anon182_correct  (=> (= Mask@24 (MapType1Store Mask@23 _33@1 val_ref (real_2_U (- (U_2_real (MapType1Select Mask@23 _33@1 val_ref)) FullPerm)))) (and (=> (= (ControlFlow 0 282) (- 0 283)) (HasDirectPerm Mask@23 _33@1 val_ref)) (=> (HasDirectPerm Mask@23 _33@1 val_ref) (and (=> (= (ControlFlow 0 282) 279) anon312_Then_correct) (=> (= (ControlFlow 0 282) 281) anon312_Else_correct)))))))
(let ((anon311_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 286) 282)) anon182_correct)))
(let ((anon311_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 284) (- 0 285)) (<= FullPerm (U_2_real (MapType1Select Mask@23 _33@1 val_ref)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@23 _33@1 val_ref))) (=> (= (ControlFlow 0 284) 282) anon182_correct))))))
(let ((anon309_Else_correct  (=> (and (= (lookup_pure__$TY$__Array$3$usize$usize$Array$3$usize$$int$$$int$ Heap@32 _1@0 _28@2) __t26@1) (state Heap@32 Mask@17)) (=> (and (and (and (and (state Heap@32 Mask@17) (state Heap@32 Mask@17)) (and (state Heap@32 Mask@17) (>= __t26@1 0))) (and (and (state Heap@32 Mask@17) (state Heap@32 Mask@17)) (and (state Heap@32 Mask@17) (state Heap@32 Mask@17)))) (and (and (and (state Heap@32 Mask@17) (U_2_bool (MapType0Select Heap@32 _31@1 $allocated))) (and (state Heap@32 Mask@17) (not (= _31@1 null)))) (and (and (= Mask@18 (MapType1Store Mask@17 _31@1 tuple_0 (real_2_U (+ (U_2_real (MapType1Select Mask@17 _31@1 tuple_0)) FullPerm)))) (state Heap@32 Mask@18)) (and (state Heap@32 Mask@18) (state Heap@32 Mask@18))))) (and (=> (= (ControlFlow 0 287) (- 0 306)) (HasDirectPerm Mask@18 _31@1 tuple_0)) (=> (HasDirectPerm Mask@18 _31@1 tuple_0) (=> (and (not (= (MapType0Select Heap@32 _31@1 tuple_0) null)) (= Mask@19 (MapType1Store Mask@18 (MapType0Select Heap@32 _31@1 tuple_0) val_int (real_2_U (+ (U_2_real (MapType1Select Mask@18 (MapType0Select Heap@32 _31@1 tuple_0) val_int)) FullPerm))))) (=> (and (and (and (state Heap@32 Mask@19) (state Heap@32 Mask@19)) (and (state Heap@32 Mask@19) (not (= _31@1 null)))) (and (and (= Mask@20 (MapType1Store Mask@19 _31@1 tuple_1 (real_2_U (+ (U_2_real (MapType1Select Mask@19 _31@1 tuple_1)) FullPerm)))) (state Heap@32 Mask@20)) (and (state Heap@32 Mask@20) (state Heap@32 Mask@20)))) (and (=> (= (ControlFlow 0 287) (- 0 305)) (HasDirectPerm Mask@20 _31@1 tuple_1)) (=> (HasDirectPerm Mask@20 _31@1 tuple_1) (=> (not (= (MapType0Select Heap@32 _31@1 tuple_1) null)) (=> (and (and (= Mask@21 (MapType1Store Mask@20 (MapType0Select Heap@32 _31@1 tuple_1) val_bool (real_2_U (+ (U_2_real (MapType1Select Mask@20 (MapType0Select Heap@32 _31@1 tuple_1) val_bool)) FullPerm)))) (state Heap@32 Mask@21)) (and (state Heap@32 Mask@21) (state Heap@32 Mask@21))) (and (=> (= (ControlFlow 0 287) (- 0 304)) (HasDirectPerm Mask@21 _31@1 tuple_0)) (=> (HasDirectPerm Mask@21 _31@1 tuple_0) (and (=> (= (ControlFlow 0 287) (- 0 303)) (= FullPerm (U_2_real (MapType1Select Mask@21 (MapType0Select Heap@32 _31@1 tuple_0) val_int)))) (=> (= FullPerm (U_2_real (MapType1Select Mask@21 (MapType0Select Heap@32 _31@1 tuple_0) val_int))) (=> (and (= Heap@33 (MapType0Store Heap@32 (MapType0Select Heap@32 _31@1 tuple_0) val_int (int_2_U (+ __t26@1 1)))) (state Heap@33 Mask@21)) (and (=> (= (ControlFlow 0 287) (- 0 302)) (HasDirectPerm Mask@21 _31@1 tuple_1)) (=> (HasDirectPerm Mask@21 _31@1 tuple_1) (and (=> (= (ControlFlow 0 287) (- 0 301)) (= FullPerm (U_2_real (MapType1Select Mask@21 (MapType0Select Heap@33 _31@1 tuple_1) val_bool)))) (=> (= FullPerm (U_2_real (MapType1Select Mask@21 (MapType0Select Heap@33 _31@1 tuple_1) val_bool))) (=> (and (= Heap@34 (MapType0Store Heap@33 (MapType0Select Heap@33 _31@1 tuple_1) val_bool (bool_2_U false))) (state Heap@34 Mask@21)) (and (=> (= (ControlFlow 0 287) (- 0 300)) (HasDirectPerm Mask@21 _31@1 tuple_1)) (=> (HasDirectPerm Mask@21 _31@1 tuple_1) (and (=> (= (ControlFlow 0 287) (- 0 299)) (HasDirectPerm Mask@21 (MapType0Select Heap@34 _31@1 tuple_1) val_bool)) (=> (HasDirectPerm Mask@21 (MapType0Select Heap@34 _31@1 tuple_1) val_bool) (=> (and (= __t27@1 (U_2_bool (MapType0Select Heap@34 (MapType0Select Heap@34 _31@1 tuple_1) val_bool))) (state Heap@34 Mask@21)) (and (=> (= (ControlFlow 0 287) (- 0 298)) (not __t27@1)) (=> (not __t27@1) (=> (and (state Heap@34 Mask@21) (state Heap@34 Mask@21)) (and (=> (= (ControlFlow 0 287) (- 0 297)) (HasDirectPerm Mask@21 _31@1 tuple_0)) (=> (HasDirectPerm Mask@21 _31@1 tuple_0) (=> (= _26@1 (MapType0Select Heap@34 _31@1 tuple_0)) (=> (and (state Heap@34 Mask@21) (state Heap@34 Mask@21)) (=> (and (and (and (state Heap@34 Mask@21) (U_2_bool (MapType0Select Heap@34 _34@1 $allocated))) (and (state Heap@34 Mask@21) (not (= _34@1 null)))) (and (and (= Mask@22 (MapType1Store Mask@21 _34@1 val_ref (real_2_U (+ (U_2_real (MapType1Select Mask@21 _34@1 val_ref)) FullPerm)))) (state Heap@34 Mask@22)) (and (state Heap@34 Mask@22) (state Heap@34 Mask@22)))) (and (=> (= (ControlFlow 0 287) (- 0 296)) (= FullPerm (U_2_real (MapType1Select Mask@22 _34@1 val_ref)))) (=> (= FullPerm (U_2_real (MapType1Select Mask@22 _34@1 val_ref))) (=> (= Heap@35 (MapType0Store Heap@34 _34@1 val_ref _1@0)) (=> (and (state Heap@35 Mask@22) (state Heap@35 Mask@22)) (=> (and (and (and (state Heap@35 Mask@22) (U_2_bool (MapType0Select Heap@35 _33@1 $allocated))) (and (state Heap@35 Mask@22) (not (= _33@1 null)))) (and (and (= Mask@23 (MapType1Store Mask@22 _33@1 val_ref (real_2_U (+ (U_2_real (MapType1Select Mask@22 _33@1 val_ref)) FullPerm)))) (state Heap@35 Mask@23)) (and (state Heap@35 Mask@23) (state Heap@35 Mask@23)))) (and (=> (= (ControlFlow 0 287) (- 0 295)) (HasDirectPerm Mask@23 _34@1 val_ref)) (=> (HasDirectPerm Mask@23 _34@1 val_ref) (and (=> (= (ControlFlow 0 287) (- 0 294)) (= FullPerm (U_2_real (MapType1Select Mask@23 _33@1 val_ref)))) (=> (= FullPerm (U_2_real (MapType1Select Mask@23 _33@1 val_ref))) (=> (= Heap@36 (MapType0Store Heap@35 _33@1 val_ref (MapType0Select Heap@35 _34@1 val_ref))) (=> (and (and (state Heap@36 Mask@23) (state Heap@36 Mask@23)) (and (state Heap@36 Mask@23) (state Heap@36 Mask@23))) (and (=> (= (ControlFlow 0 287) (- 0 293)) (HasDirectPerm Mask@23 _2@1 val_int)) (=> (HasDirectPerm Mask@23 _2@1 val_int) (=> (= _35@2 (U_2_int (MapType0Select Heap@36 _2@1 val_int))) (=> (and (and (state Heap@36 Mask@23) (state Heap@36 Mask@23)) (and (state Heap@36 Mask@23) (state Heap@36 Mask@23))) (and (=> (= (ControlFlow 0 287) (- 0 292)) (HasDirectPerm Mask@23 _26@1 val_int)) (=> (HasDirectPerm Mask@23 _26@1 val_int) (=> (and (and (= _36@2 (U_2_int (MapType0Select Heap@36 _26@1 val_int))) (state Heap@36 Mask@23)) (and (state Heap@36 Mask@23) (state Heap@36 Mask@23))) (and (=> (= (ControlFlow 0 287) (- 0 291)) (<= 0 _35@2)) (=> (<= 0 _35@2) (and (=> (= (ControlFlow 0 287) (- 0 290)) (< _35@2 3)) (=> (< _35@2 3) (=> (and (state Heap@36 Mask@23) (state Heap@36 Mask@23)) (and (=> (= (ControlFlow 0 287) (- 0 289)) (>= _35@2 0)) (=> (>= _35@2 0) (=> (state Heap@36 Mask@23) (and (=> (= (ControlFlow 0 287) (- 0 288)) (>= _36@2 0)) (=> (>= _36@2 0) (=> (state Heap@36 Mask@23) (and (=> (= (ControlFlow 0 287) 284) anon311_Then_correct) (=> (= (ControlFlow 0 287) 286) anon311_Else_correct))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
(let ((anon176_correct  (=> (= AssertMask@1 (MapType1Store Mask@17 null (Array$3$usize _1@0) (real_2_U (- (U_2_real (MapType1Select Mask@17 null (Array$3$usize _1@0))) perm@6)))) (=> (and (state Heap@32 Mask@17) (state Heap@32 Mask@17)) (and (=> (= (ControlFlow 0 315) 313) anon309_Then_correct) (=> (= (ControlFlow 0 315) 287) anon309_Else_correct))))))
(let ((anon308_Else_correct  (=> (and (= perm@6 NoPerm) (= (ControlFlow 0 318) 315)) anon176_correct)))
(let ((anon308_Then_correct  (=> (not (= perm@6 NoPerm)) (and (=> (= (ControlFlow 0 316) (- 0 317)) (<= perm@6 (U_2_real (MapType1Select Mask@17 null (Array$3$usize _1@0))))) (=> (<= perm@6 (U_2_real (MapType1Select Mask@17 null (Array$3$usize _1@0)))) (=> (= (ControlFlow 0 316) 315) anon176_correct))))))
(let ((anon307_Else_correct  (=> (= perm@6 (read$ Heap@32)) (and (=> (= (ControlFlow 0 319) (- 0 320)) (>= perm@6 NoPerm)) (=> (>= perm@6 NoPerm) (and (=> (= (ControlFlow 0 319) 316) anon308_Then_correct) (=> (= (ControlFlow 0 319) 318) anon308_Else_correct)))))))
(let ((anon172_correct  (=> (= AssertMask@0 (MapType1Store Mask@16 null (Array$3$usize _1@0) (real_2_U (- (U_2_real (MapType1Select Mask@16 null (Array$3$usize _1@0))) perm@5)))) (=> (and (and (state Heap@31 Mask@16) (state Heap@31 Mask@16)) (and (state Heap@31 Mask@16) (state Heap@31 Mask@16))) (=> (and (and (and (state Heap@31 Mask@16) (U_2_bool (MapType0Select Heap@31 _30@1 $allocated))) (and (state Heap@31 Mask@16) (not (= _30@1 null)))) (and (and (= Mask@17 (MapType1Store Mask@16 _30@1 val_bool (real_2_U (+ (U_2_real (MapType1Select Mask@16 _30@1 val_bool)) FullPerm)))) (state Heap@31 Mask@17)) (and (state Heap@31 Mask@17) (state Heap@31 Mask@17)))) (and (=> (= (ControlFlow 0 321) (- 0 324)) (= FullPerm (U_2_real (MapType1Select Mask@17 _30@1 val_bool)))) (=> (= FullPerm (U_2_real (MapType1Select Mask@17 _30@1 val_bool))) (=> (and (= Heap@32 (MapType0Store Heap@31 _30@1 val_bool (bool_2_U (< _28@2 3)))) (state Heap@32 Mask@17)) (and (=> (= (ControlFlow 0 321) (- 0 323)) (HasDirectPerm Mask@17 _30@1 val_bool)) (=> (HasDirectPerm Mask@17 _30@1 val_bool) (=> (and (= __t25@1 (U_2_bool (MapType0Select Heap@32 _30@1 val_bool))) (state Heap@32 Mask@17)) (and (=> (= (ControlFlow 0 321) (- 0 322)) __t25@1) (=> __t25@1 (=> (state Heap@32 Mask@17) (=> (and (state Heap@32 Mask@17) (state Heap@32 Mask@17)) (=> (and (and (state Heap@32 Mask@17) (>= __t26@1 0)) (and (state Heap@32 Mask@17) (state Heap@32 Mask@17))) (and (=> (= (ControlFlow 0 321) 117) anon307_Then_correct) (=> (= (ControlFlow 0 321) 319) anon307_Else_correct))))))))))))))))))
(let ((anon306_Else_correct  (=> (and (= perm@5 NoPerm) (= (ControlFlow 0 327) 321)) anon172_correct)))
(let ((anon306_Then_correct  (=> (not (= perm@5 NoPerm)) (and (=> (= (ControlFlow 0 325) (- 0 326)) (<= perm@5 (U_2_real (MapType1Select Mask@16 null (Array$3$usize _1@0))))) (=> (<= perm@5 (U_2_real (MapType1Select Mask@16 null (Array$3$usize _1@0)))) (=> (= (ControlFlow 0 325) 321) anon172_correct))))))
(let ((anon305_Else_correct  (=> (= perm@5 (read$ Heap@31)) (and (=> (= (ControlFlow 0 328) (- 0 329)) (>= perm@5 NoPerm)) (=> (>= perm@5 NoPerm) (and (=> (= (ControlFlow 0 328) 325) anon306_Then_correct) (=> (= (ControlFlow 0 328) 327) anon306_Else_correct)))))))
(let ((anon303_Else_correct  (and (=> (= (ControlFlow 0 330) (- 0 339)) (HasDirectPerm Mask@13 _2@1 val_int)) (=> (HasDirectPerm Mask@13 _2@1 val_int) (and (=> (= (ControlFlow 0 330) (- 0 338)) (HasDirectPerm Mask@13 _2@1 val_int)) (=> (HasDirectPerm Mask@13 _2@1 val_int) (=> (<= (read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$ (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize Heap@28 _1@0) (U_2_int (MapType0Select Heap@28 _2@1 val_int))) (+ (U_2_int (MapType0Select Heap@28 _2@1 val_int)) 1)) (=> (and (and (state Heap@28 Mask@13) (state Heap@28 Mask@13)) (and (state Heap@28 Mask@13) (state Heap@28 Mask@13))) (=> (and (and (and (state Heap@28 Mask@13) (U_2_bool (MapType0Select Heap@28 _12@1 $allocated))) (and (state Heap@28 Mask@13) (not (= _12@1 null)))) (and (and (= Mask@14 (MapType1Store Mask@13 _12@1 val_bool (real_2_U (+ (U_2_real (MapType1Select Mask@13 _12@1 val_bool)) FullPerm)))) (state Heap@28 Mask@14)) (and (state Heap@28 Mask@14) (state Heap@28 Mask@14)))) (and (=> (= (ControlFlow 0 330) (- 0 337)) (= FullPerm (U_2_real (MapType1Select Mask@14 _12@1 val_bool)))) (=> (= FullPerm (U_2_real (MapType1Select Mask@14 _12@1 val_bool))) (=> (and (= Heap@29 (MapType0Store Heap@28 _12@1 val_bool (bool_2_U false))) (state Heap@29 Mask@14)) (and (=> (= (ControlFlow 0 330) (- 0 336)) (HasDirectPerm Mask@14 _12@1 val_bool)) (=> (HasDirectPerm Mask@14 _12@1 val_bool) (=> (and (and (= __t22@1 (U_2_bool (MapType0Select Heap@29 _12@1 val_bool))) (state Heap@29 Mask@14)) (and (state Heap@29 Mask@14) (state Heap@29 Mask@14))) (=> (and (and (and (state Heap@29 Mask@14) (U_2_bool (MapType0Select Heap@29 _17@1 $allocated))) (and (state Heap@29 Mask@14) (not (= _17@1 null)))) (and (and (= Mask@15 (MapType1Store Mask@14 _17@1 val_bool (real_2_U (+ (U_2_real (MapType1Select Mask@14 _17@1 val_bool)) FullPerm)))) (state Heap@29 Mask@15)) (and (state Heap@29 Mask@15) (state Heap@29 Mask@15)))) (and (=> (= (ControlFlow 0 330) (- 0 335)) (= FullPerm (U_2_real (MapType1Select Mask@15 _17@1 val_bool)))) (=> (= FullPerm (U_2_real (MapType1Select Mask@15 _17@1 val_bool))) (=> (and (= Heap@30 (MapType0Store Heap@29 _17@1 val_bool (bool_2_U false))) (state Heap@30 Mask@15)) (and (=> (= (ControlFlow 0 330) (- 0 334)) (HasDirectPerm Mask@15 _17@1 val_bool)) (=> (HasDirectPerm Mask@15 _17@1 val_bool) (=> (and (and (= __t23@1 (U_2_bool (MapType0Select Heap@30 _17@1 val_bool))) (state Heap@30 Mask@15)) (and (state Heap@30 Mask@15) (state Heap@30 Mask@15))) (=> (and (and (and (state Heap@30 Mask@15) (U_2_bool (MapType0Select Heap@30 _22@1 $allocated))) (and (state Heap@30 Mask@15) (not (= _22@1 null)))) (and (and (= Mask@16 (MapType1Store Mask@15 _22@1 val_bool (real_2_U (+ (U_2_real (MapType1Select Mask@15 _22@1 val_bool)) FullPerm)))) (state Heap@30 Mask@16)) (and (state Heap@30 Mask@16) (state Heap@30 Mask@16)))) (and (=> (= (ControlFlow 0 330) (- 0 333)) (= FullPerm (U_2_real (MapType1Select Mask@16 _22@1 val_bool)))) (=> (= FullPerm (U_2_real (MapType1Select Mask@16 _22@1 val_bool))) (=> (and (= Heap@31 (MapType0Store Heap@30 _22@1 val_bool (bool_2_U false))) (state Heap@31 Mask@16)) (and (=> (= (ControlFlow 0 330) (- 0 332)) (HasDirectPerm Mask@16 _22@1 val_bool)) (=> (HasDirectPerm Mask@16 _22@1 val_bool) (=> (and (= __t24@1 (U_2_bool (MapType0Select Heap@31 _22@1 val_bool))) (state Heap@31 Mask@16)) (=> (and (and (state Heap@31 Mask@16) (state Heap@31 Mask@16)) (and (state Heap@31 Mask@16) (state Heap@31 Mask@16))) (and (=> (= (ControlFlow 0 330) (- 0 331)) (HasDirectPerm Mask@16 _2@1 val_int)) (=> (HasDirectPerm Mask@16 _2@1 val_int) (=> (= _28@2 (U_2_int (MapType0Select Heap@31 _2@1 val_int))) (=> (and (state Heap@31 Mask@16) (state Heap@31 Mask@16)) (and (=> (= (ControlFlow 0 330) 116) anon305_Then_correct) (=> (= (ControlFlow 0 330) 328) anon305_Else_correct))))))))))))))))))))))))))))))))))))
(let ((anon296_Else_correct  (=> (forall ((_0_quant_0_13 Int) ) (!  (=> (<= 0 _0_quant_0_13) (or (not (<= _LET_1@0 _0_quant_0_13)) (or (not (< _0_quant_0_13 3)) (and (< _0_quant_0_13 3) (<= (read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$ (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize Heap@28 _1@0) _0_quant_0_13) (+ _0_quant_0_13 1))))))
 :qid |Ex2originalbpl.4571:20|
 :skolemid |127|
 :pattern ( (read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$ (|snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize#frame| (ConditionalFrame (read$ Heap@28) (MapType0Select Heap@28 null (Array$3$usize _1@0))) _1@0) _0_quant_0_13))
)) (and (=> (= (ControlFlow 0 346) (- 0 347)) (HasDirectPerm Mask@13 _2@1 val_int)) (=> (HasDirectPerm Mask@13 _2@1 val_int) (=> (and (< (U_2_int (MapType0Select Heap@28 _2@1 val_int)) 3) (state Heap@28 Mask@13)) (and (=> (= (ControlFlow 0 346) 344) anon303_Then_correct) (=> (= (ControlFlow 0 346) 330) anon303_Else_correct))))))))
(let ((anon289_Else_correct  (=> (forall ((_0_quant_0_11 Int) ) (!  (=> (<= 0 _0_quant_0_11) (or (not (<= 0 _0_quant_0_11)) (or (not (< _0_quant_0_11 (U_2_int (MapType0Select Heap@28 _2@1 val_int)))) (and (< _0_quant_0_11 3) (<= (read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$ (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize Heap@28 _1@0) _0_quant_0_11) (+ _0_quant_0_11 2))))))
 :qid |Ex2originalbpl.4529:20|
 :skolemid |126|
 :pattern ( (read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$ (|snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize#frame| (ConditionalFrame (read$ Heap@28) (MapType0Select Heap@28 null (Array$3$usize _1@0))) _1@0) _0_quant_0_11))
)) (and (=> (= (ControlFlow 0 348) (- 0 349)) (HasDirectPerm Mask@13 _2@1 val_int)) (=> (HasDirectPerm Mask@13 _2@1 val_int) (=> (and (= _LET_1@0 (U_2_int (MapType0Select Heap@28 _2@1 val_int))) (state Heap@28 Mask@13)) (and (and (=> (= (ControlFlow 0 348) 346) anon296_Else_correct) (=> (= (ControlFlow 0 348) 115) anon297_Then_correct)) (=> (= (ControlFlow 0 348) 102) anon297_Else_correct))))))))
(let ((anon250_Then_correct  (=> __t20@1 (=> (and (state Heap@27 Mask@12) (state Heap@27 Mask@12)) (=> (and (and (and (state Heap@27 Mask@12) (U_2_bool (MapType0Select Heap@27 _8@2 $allocated))) (and (state Heap@27 Mask@12) (not (= _8@2 null)))) (and (and (= Mask@13 (MapType1Store Mask@12 _8@2 val_bool (real_2_U (+ (U_2_real (MapType1Select Mask@12 _8@2 val_bool)) FullPerm)))) (state Heap@27 Mask@13)) (and (state Heap@27 Mask@13) (state Heap@27 Mask@13)))) (and (=> (= (ControlFlow 0 350) (- 0 353)) (= FullPerm (U_2_real (MapType1Select Mask@13 _8@2 val_bool)))) (=> (= FullPerm (U_2_real (MapType1Select Mask@13 _8@2 val_bool))) (=> (and (= Heap@28 (MapType0Store Heap@27 _8@2 val_bool (bool_2_U false))) (state Heap@28 Mask@13)) (and (=> (= (ControlFlow 0 350) (- 0 352)) (HasDirectPerm Mask@13 _8@2 val_bool)) (=> (HasDirectPerm Mask@13 _8@2 val_bool) (=> (and (= __t21@1 (U_2_bool (MapType0Select Heap@28 _8@2 val_bool))) (state Heap@28 Mask@13)) (and (=> (= (ControlFlow 0 350) (- 0 351)) (HasDirectPerm Mask@13 _2@1 val_int)) (=> (HasDirectPerm Mask@13 _2@1 val_int) (=> (and (< (U_2_int (MapType0Select Heap@28 _2@1 val_int)) 3) (state Heap@28 Mask@13)) (and (and (=> (= (ControlFlow 0 350) 348) anon289_Else_correct) (=> (= (ControlFlow 0 350) 100) anon290_Then_correct)) (=> (= (ControlFlow 0 350) 86) anon290_Else_correct))))))))))))))))
(let ((anon69_correct  (=> (and (not (= _2@1 null)) (= Mask@11 (MapType1Store Mask@10 _2@1 val_int (real_2_U (+ (U_2_real (MapType1Select Mask@10 _2@1 val_int)) FullPerm))))) (=> (and (and (state Heap@26 Mask@11) (<= 0 (U_2_int (MapType0Select Heap@26 _2@1 val_int)))) (and (state Heap@26 Mask@11) (state Heap@26 Mask@11))) (and (=> (= (ControlFlow 0 354) (- 0 357)) (HasDirectPerm Mask@11 _2@1 val_int)) (=> (HasDirectPerm Mask@11 _2@1 val_int) (=> (= _6@4 (U_2_int (MapType0Select Heap@26 _2@1 val_int))) (=> (and (state Heap@26 Mask@11) (state Heap@26 Mask@11)) (=> (and (and (and (state Heap@26 Mask@11) (U_2_bool (MapType0Select Heap@26 _5@2 $allocated))) (and (state Heap@26 Mask@11) (not (= _5@2 null)))) (and (and (= Mask@12 (MapType1Store Mask@11 _5@2 val_bool (real_2_U (+ (U_2_real (MapType1Select Mask@11 _5@2 val_bool)) FullPerm)))) (state Heap@26 Mask@12)) (and (state Heap@26 Mask@12) (state Heap@26 Mask@12)))) (and (=> (= (ControlFlow 0 354) (- 0 356)) (= FullPerm (U_2_real (MapType1Select Mask@12 _5@2 val_bool)))) (=> (= FullPerm (U_2_real (MapType1Select Mask@12 _5@2 val_bool))) (=> (and (= Heap@27 (MapType0Store Heap@26 _5@2 val_bool (bool_2_U (< _6@4 3)))) (state Heap@27 Mask@12)) (and (=> (= (ControlFlow 0 354) (- 0 355)) (HasDirectPerm Mask@12 _5@2 val_bool)) (=> (HasDirectPerm Mask@12 _5@2 val_bool) (=> (and (= __t20@1 (U_2_bool (MapType0Select Heap@27 _5@2 val_bool))) (state Heap@27 Mask@12)) (and (=> (= (ControlFlow 0 354) 350) anon250_Then_correct) (=> (= (ControlFlow 0 354) 84) anon250_Else_correct)))))))))))))))))
(let ((anon249_Else_correct  (=> (HasDirectPerm Mask@10 null (usize _2@1)) (=> (and (= Heap@26 ExhaleHeap@0) (= (ControlFlow 0 359) 354)) anon69_correct))))
(let ((anon249_Then_correct  (=> (and (and (not (HasDirectPerm Mask@10 null (usize _2@1))) (= Heap@25 (MapType0Store ExhaleHeap@0 null (usize _2@1) newVersion@0))) (and (= Heap@26 Heap@25) (= (ControlFlow 0 358) 354))) anon69_correct)))
(let ((anon67_correct  (=> (= Mask@10 (MapType1Store Mask@9 null (usize _2@1) (real_2_U (- (U_2_real (MapType1Select Mask@9 null (usize _2@1))) FullPerm)))) (and (=> (= (ControlFlow 0 360) 358) anon249_Then_correct) (=> (= (ControlFlow 0 360) 359) anon249_Else_correct)))))
(let ((anon248_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 363) 360)) anon67_correct)))
(let ((anon248_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 361) (- 0 362)) (<= FullPerm (U_2_real (MapType1Select Mask@9 null (usize _2@1))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@9 null (usize _2@1)))) (=> (= (ControlFlow 0 361) 360) anon67_correct))))))
(let ((anon65_correct  (=> (and (and (and (= Mask@7 (MapType1Store Mask@6 null (Array$3$usize _1@0) (real_2_U (- (U_2_real (MapType1Select Mask@6 null (Array$3$usize _1@0))) FullPerm)))) (IdenticalOnKnownLocations Heap@24 ExhaleHeap@0 Mask@7)) (and (state ExhaleHeap@0 Mask@7) (state ExhaleHeap@0 Mask@7))) (and (and (U_2_bool (MapType0Select ExhaleHeap@0 _12@0 $allocated)) (state ExhaleHeap@0 Mask@7)) (and (state ExhaleHeap@0 Mask@7) (U_2_bool (MapType0Select ExhaleHeap@0 _17@0 $allocated))))) (=> (and (and (and (and (state ExhaleHeap@0 Mask@7) (state ExhaleHeap@0 Mask@7)) (and (U_2_bool (MapType0Select ExhaleHeap@0 _2@1 $allocated)) (state ExhaleHeap@0 Mask@7))) (and (and (state ExhaleHeap@0 Mask@7) (U_2_bool (MapType0Select ExhaleHeap@0 _22@0 $allocated))) (and (state ExhaleHeap@0 Mask@7) (state ExhaleHeap@0 Mask@7)))) (and (and (and (U_2_bool (MapType0Select ExhaleHeap@0 _26@0 $allocated)) (state ExhaleHeap@0 Mask@7)) (and (state ExhaleHeap@0 Mask@7) (state ExhaleHeap@0 Mask@7))) (and (and (state ExhaleHeap@0 Mask@7) (state ExhaleHeap@0 Mask@7)) (and (state ExhaleHeap@0 Mask@7) (state ExhaleHeap@0 Mask@7))))) (=> (and (and (and (and (and (state ExhaleHeap@0 Mask@7) (U_2_bool (MapType0Select ExhaleHeap@0 _30@0 $allocated))) (and (state ExhaleHeap@0 Mask@7) (state ExhaleHeap@0 Mask@7))) (and (and (U_2_bool (MapType0Select ExhaleHeap@0 _31@0 $allocated)) (state ExhaleHeap@0 Mask@7)) (and (state ExhaleHeap@0 Mask@7) (U_2_bool (MapType0Select ExhaleHeap@0 _32@0 $allocated))))) (and (and (and (state ExhaleHeap@0 Mask@7) (state ExhaleHeap@0 Mask@7)) (and (U_2_bool (MapType0Select ExhaleHeap@0 _33@0 $allocated)) (state ExhaleHeap@0 Mask@7))) (and (and (state ExhaleHeap@0 Mask@7) (U_2_bool (MapType0Select ExhaleHeap@0 _34@0 $allocated))) (and (state ExhaleHeap@0 Mask@7) (state ExhaleHeap@0 Mask@7))))) (and (and (and (and (state ExhaleHeap@0 Mask@7) (state ExhaleHeap@0 Mask@7)) (and (state ExhaleHeap@0 Mask@7) (state ExhaleHeap@0 Mask@7))) (and (and (U_2_bool (MapType0Select ExhaleHeap@0 _37@0 $allocated)) (state ExhaleHeap@0 Mask@7)) (and (state ExhaleHeap@0 Mask@7) (U_2_bool (MapType0Select ExhaleHeap@0 _5@1 $allocated))))) (and (and (and (state ExhaleHeap@0 Mask@7) (state ExhaleHeap@0 Mask@7)) (and (state ExhaleHeap@0 Mask@7) (state ExhaleHeap@0 Mask@7))) (and (and (U_2_bool (MapType0Select ExhaleHeap@0 _8@1 $allocated)) (state ExhaleHeap@0 Mask@7)) (and (state ExhaleHeap@0 Mask@7) (state ExhaleHeap@0 Mask@7)))))) (=> (and (and (and (and (and (and (state ExhaleHeap@0 Mask@7) (state ExhaleHeap@0 Mask@7)) (and (state ExhaleHeap@0 Mask@7) (state ExhaleHeap@0 Mask@7))) (and (and (state ExhaleHeap@0 Mask@7) (state ExhaleHeap@0 Mask@7)) (and (state ExhaleHeap@0 Mask@7) (state ExhaleHeap@0 Mask@7)))) (and (and (and (state ExhaleHeap@0 Mask@7) (state ExhaleHeap@0 Mask@7)) (and (state ExhaleHeap@0 Mask@7) (state ExhaleHeap@0 Mask@7))) (and (and (state ExhaleHeap@0 Mask@7) (state ExhaleHeap@0 Mask@7)) (and (state ExhaleHeap@0 Mask@7) (state ExhaleHeap@0 Mask@7))))) (and (and (and (and (state ExhaleHeap@0 Mask@7) (state ExhaleHeap@0 Mask@7)) (and (state ExhaleHeap@0 Mask@7) (state ExhaleHeap@0 Mask@7))) (and (and (state ExhaleHeap@0 Mask@7) (state ExhaleHeap@0 Mask@7)) (and (state ExhaleHeap@0 Mask@7) (state ExhaleHeap@0 Mask@7)))) (and (and (and (state ExhaleHeap@0 Mask@7) (state ExhaleHeap@0 Mask@7)) (and (state ExhaleHeap@0 Mask@7) (state ExhaleHeap@0 Mask@7))) (and (and (state ExhaleHeap@0 Mask@7) (state ExhaleHeap@0 Mask@7)) (and (state ExhaleHeap@0 Mask@7) (state ExhaleHeap@0 Mask@7)))))) (and (and (and (and (and (state ExhaleHeap@0 Mask@7) (state ExhaleHeap@0 Mask@7)) (and (state ExhaleHeap@0 Mask@7) (state ExhaleHeap@0 Mask@7))) (and (and (state ExhaleHeap@0 Mask@7) (state ExhaleHeap@0 Mask@7)) (and (state ExhaleHeap@0 Mask@7) (state ExhaleHeap@0 Mask@7)))) (and (and (and (state ExhaleHeap@0 Mask@7) (state ExhaleHeap@0 Mask@7)) (and (state ExhaleHeap@0 Mask@7) (state ExhaleHeap@0 Mask@7))) (and (and (state ExhaleHeap@0 Mask@7) (state ExhaleHeap@0 Mask@7)) (and (state ExhaleHeap@0 Mask@7) (state ExhaleHeap@0 Mask@7))))) (and (and (and (and (state ExhaleHeap@0 Mask@7) (state ExhaleHeap@0 Mask@7)) (and (= Mask@8 (MapType1Store Mask@7 null (usize _2@1) (real_2_U (+ (U_2_real (MapType1Select Mask@7 null (usize _2@1))) FullPerm)))) (state ExhaleHeap@0 Mask@8))) (and (and (= Mask@9 (MapType1Store Mask@8 null (Array$3$usize _1@0) (real_2_U (+ (U_2_real (MapType1Select Mask@8 null (Array$3$usize _1@0))) FullPerm)))) (state ExhaleHeap@0 Mask@9)) (and (state ExhaleHeap@0 Mask@9) (state ExhaleHeap@0 Mask@9)))) (and (and (and (state ExhaleHeap@0 Mask@9) (state ExhaleHeap@0 Mask@9)) (and (state ExhaleHeap@0 Mask@9) (state ExhaleHeap@0 Mask@9))) (and (and (state ExhaleHeap@0 Mask@9) (state ExhaleHeap@0 Mask@9)) (and (|usize#trigger| ExhaleHeap@0 (usize _2@1)) (= (MapType0Select ExhaleHeap@0 null (usize _2@1)) (FrameFragment (MapType0Select ExhaleHeap@0 _2@1 val_int))))))))) (and (=> (= (ControlFlow 0 364) 361) anon248_Then_correct) (=> (= (ControlFlow 0 364) 363) anon248_Else_correct))))))))
(let ((anon247_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 367) 364)) anon65_correct)))
(let ((anon247_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 365) (- 0 366)) (<= FullPerm (U_2_real (MapType1Select Mask@6 null (Array$3$usize _1@0))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@6 null (Array$3$usize _1@0)))) (=> (= (ControlFlow 0 365) 364) anon65_correct))))))
(let ((anon63_correct  (=> (= Mask@6 (MapType1Store Mask@5 null (usize _2@0) (real_2_U (- (U_2_real (MapType1Select Mask@5 null (usize _2@0))) FullPerm)))) (and (=> (= (ControlFlow 0 368) 365) anon247_Then_correct) (=> (= (ControlFlow 0 368) 367) anon247_Else_correct)))))
(let ((anon246_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 371) 368)) anon63_correct)))
(let ((anon246_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 369) (- 0 370)) (<= FullPerm (U_2_real (MapType1Select Mask@5 null (usize _2@0))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@5 null (usize _2@0)))) (=> (= (ControlFlow 0 369) 368) anon63_correct))))))
(let ((anon61_correct  (=> (and (= UnfoldingMask@10 (MapType1Store Mask@5 null (usize _2@0) (real_2_U (- (U_2_real (MapType1Select Mask@5 null (usize _2@0))) FullPerm)))) (not (= _2@0 null))) (=> (and (and (= UnfoldingMask@11 (MapType1Store UnfoldingMask@10 _2@0 val_int (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@10 _2@0 val_int)) FullPerm)))) (state Heap@6 UnfoldingMask@11)) (and (<= 0 (U_2_int (MapType0Select Heap@6 _2@0 val_int))) (state Heap@6 UnfoldingMask@11))) (and (=> (= (ControlFlow 0 372) (- 0 374)) (HasDirectPerm UnfoldingMask@11 _2@0 val_int)) (=> (HasDirectPerm UnfoldingMask@11 _2@0 val_int) (=> (and (and (and (= Heap@15 (MapType0Store Heap@14 null (|usize#sm| _2@0) (MapType1Store (MapType0Select Heap@14 null (|usize#sm| _2@0)) _2@0 val_int (bool_2_U true)))) (state Heap@15 Mask@5)) (and (= Heap@16 (MapType0Store Heap@15 null (|usize#sm| _2@0) (MapType1Store (MapType0Select Heap@15 null (|usize#sm| _2@0)) _2@0 val_int (bool_2_U true)))) (state Heap@16 Mask@5))) (and (and (= Heap@17 (MapType0Store Heap@16 null (|usize#sm| _2@0) (MapType1Store (MapType0Select Heap@16 null (|usize#sm| _2@0)) _2@0 val_int (bool_2_U true)))) (state Heap@17 Mask@5)) (and (= Heap@18 (MapType0Store Heap@17 null (|usize#sm| _2@0) (MapType1Store (MapType0Select Heap@17 null (|usize#sm| _2@0)) _2@0 val_int (bool_2_U true)))) (state Heap@18 Mask@5)))) (and (=> (= (ControlFlow 0 372) (- 0 373)) (<= (read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$ (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize Heap@18 _1@0) (U_2_int (MapType0Select Heap@18 _2@0 val_int))) (+ (U_2_int (MapType0Select Heap@18 _2@0 val_int)) 1))) (=> (<= (read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$ (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize Heap@18 _1@0) (U_2_int (MapType0Select Heap@18 _2@0 val_int))) (+ (U_2_int (MapType0Select Heap@18 _2@0 val_int)) 1)) (=> (= Heap@19 (MapType0Store Heap@18 null (|usize#sm| _2@0) (MapType1Store (MapType0Select Heap@18 null (|usize#sm| _2@0)) _2@0 val_int (bool_2_U true)))) (=> (and (state Heap@19 Mask@5) (= Heap@20 (MapType0Store Heap@19 null (|usize#sm| _2@0) (MapType1Store (MapType0Select Heap@19 null (|usize#sm| _2@0)) _2@0 val_int (bool_2_U true))))) (=> (and (and (state Heap@20 Mask@5) (= Heap@21 (MapType0Store Heap@20 null (|usize#sm| _2@0) (MapType1Store (MapType0Select Heap@20 null (|usize#sm| _2@0)) _2@0 val_int (bool_2_U true))))) (and (state Heap@21 Mask@5) (= _LET_0_3@0 (U_2_int (MapType0Select Heap@21 _2@0 val_int))))) (=> (and (and (and (= Heap@22 (MapType0Store Heap@21 null (|usize#sm| _2@0) (MapType1Store (MapType0Select Heap@21 null (|usize#sm| _2@0)) _2@0 val_int (bool_2_U true)))) (state Heap@22 Mask@5)) (and (= Heap@23 (MapType0Store Heap@22 null (|usize#sm| _2@0) (MapType1Store (MapType0Select Heap@22 null (|usize#sm| _2@0)) _2@0 val_int (bool_2_U true)))) (state Heap@23 Mask@5))) (and (and (= Heap@24 (MapType0Store Heap@23 null (|usize#sm| _2@0) (MapType1Store (MapType0Select Heap@23 null (|usize#sm| _2@0)) _2@0 val_int (bool_2_U true)))) (state Heap@24 Mask@5)) (and (state Heap@24 Mask@5) (state Heap@24 Mask@5)))) (and (=> (= (ControlFlow 0 372) 369) anon246_Then_correct) (=> (= (ControlFlow 0 372) 371) anon246_Else_correct)))))))))))))))
(let ((anon245_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 377) 372)) anon61_correct)))
(let ((anon245_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 375) (- 0 376)) (<= FullPerm (U_2_real (MapType1Select Mask@5 null (usize _2@0))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@5 null (usize _2@0)))) (=> (= (ControlFlow 0 375) 372) anon61_correct))))))
(let ((anon59_correct  (=> (and (= UnfoldingMask@8 (MapType1Store Mask@5 null (usize _2@0) (real_2_U (- (U_2_real (MapType1Select Mask@5 null (usize _2@0))) FullPerm)))) (not (= _2@0 null))) (=> (and (and (= UnfoldingMask@9 (MapType1Store UnfoldingMask@8 _2@0 val_int (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@8 _2@0 val_int)) FullPerm)))) (state Heap@6 UnfoldingMask@9)) (and (<= 0 (U_2_int (MapType0Select Heap@6 _2@0 val_int))) (state Heap@6 UnfoldingMask@9))) (and (=> (= (ControlFlow 0 378) (- 0 379)) (HasDirectPerm UnfoldingMask@9 _2@0 val_int)) (=> (HasDirectPerm UnfoldingMask@9 _2@0 val_int) (=> (and (= Heap@13 (MapType0Store Heap@12 null (|usize#sm| _2@0) (MapType1Store (MapType0Select Heap@12 null (|usize#sm| _2@0)) _2@0 val_int (bool_2_U true)))) (state Heap@13 Mask@5)) (=> (and (and (= Heap@14 (MapType0Store Heap@13 null (|usize#sm| _2@0) (MapType1Store (MapType0Select Heap@13 null (|usize#sm| _2@0)) _2@0 val_int (bool_2_U true)))) (state Heap@14 Mask@5)) (and (|usize#trigger| Heap@6 (usize _2@0)) (= (MapType0Select Heap@6 null (usize _2@0)) (FrameFragment (MapType0Select Heap@6 _2@0 val_int))))) (and (=> (= (ControlFlow 0 378) 375) anon245_Then_correct) (=> (= (ControlFlow 0 378) 377) anon245_Else_correct))))))))))
(let ((anon244_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 382) 378)) anon59_correct)))
(let ((anon244_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 380) (- 0 381)) (<= FullPerm (U_2_real (MapType1Select Mask@5 null (usize _2@0))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@5 null (usize _2@0)))) (=> (= (ControlFlow 0 380) 378) anon59_correct))))))
(let ((anon242_Else_correct  (=> (and (|usize#trigger| Heap@6 (usize _2@0)) (= (MapType0Select Heap@6 null (usize _2@0)) (FrameFragment (MapType0Select Heap@6 _2@0 val_int)))) (and (=> (= (ControlFlow 0 383) 380) anon244_Then_correct) (=> (= (ControlFlow 0 383) 382) anon244_Else_correct)))))
(let ((anon53_correct  (=> (and (= UnfoldingMask@6 (MapType1Store Mask@5 null (usize _2@0) (real_2_U (- (U_2_real (MapType1Select Mask@5 null (usize _2@0))) FullPerm)))) (not (= _2@0 null))) (=> (and (and (= UnfoldingMask@7 (MapType1Store UnfoldingMask@6 _2@0 val_int (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@6 _2@0 val_int)) FullPerm)))) (state Heap@6 UnfoldingMask@7)) (and (<= 0 (U_2_int (MapType0Select Heap@6 _2@0 val_int))) (state Heap@6 UnfoldingMask@7))) (and (=> (= (ControlFlow 0 390) (- 0 392)) (HasDirectPerm UnfoldingMask@7 _2@0 val_int)) (=> (HasDirectPerm UnfoldingMask@7 _2@0 val_int) (=> (and (and (= Heap@11 (MapType0Store Heap@10 null (|usize#sm| _2@0) (MapType1Store (MapType0Select Heap@10 null (|usize#sm| _2@0)) _2@0 val_int (bool_2_U true)))) (state Heap@11 Mask@5)) (and (= Heap@12 (MapType0Store Heap@11 null (|usize#sm| _2@0) (MapType1Store (MapType0Select Heap@11 null (|usize#sm| _2@0)) _2@0 val_int (bool_2_U true)))) (state Heap@12 Mask@5))) (and (=> (= (ControlFlow 0 390) (- 0 391)) (< (U_2_int (MapType0Select Heap@12 _2@0 val_int)) 3)) (=> (< (U_2_int (MapType0Select Heap@12 _2@0 val_int)) 3) (and (=> (= (ControlFlow 0 390) 388) anon242_Then_correct) (=> (= (ControlFlow 0 390) 383) anon242_Else_correct)))))))))))
(let ((anon241_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 395) 390)) anon53_correct)))
(let ((anon241_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 393) (- 0 394)) (<= FullPerm (U_2_real (MapType1Select Mask@5 null (usize _2@0))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@5 null (usize _2@0)))) (=> (= (ControlFlow 0 393) 390) anon53_correct))))))
(let ((anon234_Else_correct  (=> (= Heap@10 (MapType0Store Heap@9 null (|usize#sm| _2@0) (MapType1Store (MapType0Select Heap@9 null (|usize#sm| _2@0)) _2@0 val_int (bool_2_U true)))) (=> (and (state Heap@10 Mask@5) (= _LET_0_1@0 (U_2_int (MapType0Select Heap@10 _2@0 val_int)))) (and (=> (= (ControlFlow 0 396) (- 0 397)) (forall ((_0_quant_0_4 Int) ) (!  (=> (<= 0 _0_quant_0_4) (or (not (<= (U_2_int (MapType0Select Heap@10 _2@0 val_int)) _0_quant_0_4)) (or (not (< _0_quant_0_4 3)) (and (< _0_quant_0_4 3) (<= (read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$ (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize Heap@10 _1@0) _0_quant_0_4) (+ _0_quant_0_4 1))))))
 :qid |Ex2originalbpl.2769:15|
 :skolemid |123|
 :pattern ( (read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$ (|snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize#frame| (ConditionalFrame (read$ Heap@10) (MapType0Select Heap@10 null (Array$3$usize _1@0))) _1@0) _0_quant_0_4))
))) (=> (forall ((_0_quant_0_4@@0 Int) ) (!  (=> (<= 0 _0_quant_0_4@@0) (or (not (<= (U_2_int (MapType0Select Heap@10 _2@0 val_int)) _0_quant_0_4@@0)) (or (not (< _0_quant_0_4@@0 3)) (and (< _0_quant_0_4@@0 3) (<= (read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$ (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize Heap@10 _1@0) _0_quant_0_4@@0) (+ _0_quant_0_4@@0 1))))))
 :qid |Ex2originalbpl.2769:15|
 :skolemid |123|
 :pattern ( (read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$ (|snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize#frame| (ConditionalFrame (read$ Heap@10) (MapType0Select Heap@10 null (Array$3$usize _1@0))) _1@0) _0_quant_0_4@@0))
)) (=> (and (|usize#trigger| Heap@6 (usize _2@0)) (= (MapType0Select Heap@6 null (usize _2@0)) (FrameFragment (MapType0Select Heap@6 _2@0 val_int)))) (and (=> (= (ControlFlow 0 396) 393) anon241_Then_correct) (=> (= (ControlFlow 0 396) 395) anon241_Else_correct)))))))))
(let ((anon41_correct  (=> (and (= UnfoldingMask@4 (MapType1Store Mask@5 null (usize _2@0) (real_2_U (- (U_2_real (MapType1Select Mask@5 null (usize _2@0))) FullPerm)))) (not (= _2@0 null))) (=> (and (and (= UnfoldingMask@5 (MapType1Store UnfoldingMask@4 _2@0 val_int (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@4 _2@0 val_int)) FullPerm)))) (state Heap@6 UnfoldingMask@5)) (and (<= 0 (U_2_int (MapType0Select Heap@6 _2@0 val_int))) (state Heap@6 UnfoldingMask@5))) (and (=> (= (ControlFlow 0 398) (- 0 399)) (HasDirectPerm UnfoldingMask@5 _2@0 val_int)) (=> (HasDirectPerm UnfoldingMask@5 _2@0 val_int) (=> (= _LET_0@0 (U_2_int (MapType0Select Heap@9 _2@0 val_int))) (and (and (=> (= (ControlFlow 0 398) 396) anon234_Else_correct) (=> (= (ControlFlow 0 398) 83) anon235_Then_correct)) (=> (= (ControlFlow 0 398) 70) anon235_Else_correct)))))))))
(let ((anon233_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 402) 398)) anon41_correct)))
(let ((anon233_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 400) (- 0 401)) (<= FullPerm (U_2_real (MapType1Select Mask@5 null (usize _2@0))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@5 null (usize _2@0)))) (=> (= (ControlFlow 0 400) 398) anon41_correct))))))
(let ((anon231_Else_correct  (=> (forall ((_0_quant_0_2_1 Int) ) (!  (=> (<= 0 _0_quant_0_2_1) (or (not (<= 0 _0_quant_0_2_1)) (or (not (< _0_quant_0_2_1 (U_2_int (MapType0Select Heap@9 _2@0 val_int)))) (and (< _0_quant_0_2_1 3) (<= (read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$ (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize Heap@9 _1@0) _0_quant_0_2_1) (+ _0_quant_0_2_1 2))))))
 :qid |Ex2originalbpl.2706:20|
 :skolemid |122|
 :pattern ( (read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$ (|snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize#frame| (ConditionalFrame (read$ Heap@9) (MapType0Select Heap@9 null (Array$3$usize _1@0))) _1@0) _0_quant_0_2_1))
)) (=> (and (|usize#trigger| Heap@6 (usize _2@0)) (= (MapType0Select Heap@6 null (usize _2@0)) (FrameFragment (MapType0Select Heap@6 _2@0 val_int)))) (and (=> (= (ControlFlow 0 403) 400) anon233_Then_correct) (=> (= (ControlFlow 0 403) 402) anon233_Else_correct))))))
(let ((anon224_Else_correct  (=> (and (= Heap@9 (MapType0Store Heap@8 null (|usize#sm| _2@0) (MapType1Store (MapType0Select Heap@8 null (|usize#sm| _2@0)) _2@0 val_int (bool_2_U true)))) (state Heap@9 Mask@5)) (and (and (=> (= (ControlFlow 0 404) 403) anon231_Else_correct) (=> (= (ControlFlow 0 404) 66) anon232_Then_correct)) (=> (= (ControlFlow 0 404) 68) anon232_Else_correct)))))
(let ((anon25_correct  (=> (and (= UnfoldingMask@2 (MapType1Store Mask@5 null (usize _2@0) (real_2_U (- (U_2_real (MapType1Select Mask@5 null (usize _2@0))) FullPerm)))) (not (= _2@0 null))) (=> (and (and (= UnfoldingMask@3 (MapType1Store UnfoldingMask@2 _2@0 val_int (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@2 _2@0 val_int)) FullPerm)))) (state Heap@6 UnfoldingMask@3)) (and (<= 0 (U_2_int (MapType0Select Heap@6 _2@0 val_int))) (state Heap@6 UnfoldingMask@3))) (and (and (=> (= (ControlFlow 0 405) 404) anon224_Else_correct) (=> (= (ControlFlow 0 405) 64) anon225_Then_correct)) (=> (= (ControlFlow 0 405) 50) anon225_Else_correct))))))
(let ((anon223_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 408) 405)) anon25_correct)))
(let ((anon223_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 406) (- 0 407)) (<= FullPerm (U_2_real (MapType1Select Mask@5 null (usize _2@0))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@5 null (usize _2@0)))) (=> (= (ControlFlow 0 406) 405) anon25_correct))))))
(let ((anon23_correct  (=> (and (= UnfoldingMask@0 (MapType1Store Mask@5 null (usize _2@0) (real_2_U (- (U_2_real (MapType1Select Mask@5 null (usize _2@0))) FullPerm)))) (not (= _2@0 null))) (=> (and (and (= UnfoldingMask@1 (MapType1Store UnfoldingMask@0 _2@0 val_int (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@0 _2@0 val_int)) FullPerm)))) (state Heap@6 UnfoldingMask@1)) (and (<= 0 (U_2_int (MapType0Select Heap@6 _2@0 val_int))) (state Heap@6 UnfoldingMask@1))) (and (=> (= (ControlFlow 0 409) (- 0 411)) (HasDirectPerm UnfoldingMask@1 _2@0 val_int)) (=> (HasDirectPerm UnfoldingMask@1 _2@0 val_int) (=> (and (and (= Heap@7 (MapType0Store Heap@6 null (|usize#sm| _2@0) (MapType1Store (MapType0Select Heap@6 null (|usize#sm| _2@0)) _2@0 val_int (bool_2_U true)))) (state Heap@7 Mask@5)) (and (= Heap@8 (MapType0Store Heap@7 null (|usize#sm| _2@0) (MapType1Store (MapType0Select Heap@7 null (|usize#sm| _2@0)) _2@0 val_int (bool_2_U true)))) (state Heap@8 Mask@5))) (and (=> (= (ControlFlow 0 409) (- 0 410)) (< (U_2_int (MapType0Select Heap@8 _2@0 val_int)) 3)) (=> (< (U_2_int (MapType0Select Heap@8 _2@0 val_int)) 3) (=> (and (|usize#trigger| Heap@6 (usize _2@0)) (= (MapType0Select Heap@6 null (usize _2@0)) (FrameFragment (MapType0Select Heap@6 _2@0 val_int)))) (and (=> (= (ControlFlow 0 409) 406) anon223_Then_correct) (=> (= (ControlFlow 0 409) 408) anon223_Else_correct))))))))))))
(let ((anon222_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 414) 409)) anon23_correct)))
(let ((anon222_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 412) (- 0 413)) (<= FullPerm (U_2_real (MapType1Select Mask@5 null (usize _2@0))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@5 null (usize _2@0)))) (=> (= (ControlFlow 0 412) 409) anon23_correct))))))
(let ((anon21_correct  (=> (= Heap@6 (MapType0Store Heap@5 null (|usize#sm| _2@0) (MapType1Store (MapType0Select Heap@5 null (|usize#sm| _2@0)) _2@0 val_int (bool_2_U true)))) (=> (and (and (state Heap@6 Mask@5) (state Heap@6 Mask@5)) (and (|usize#trigger| Heap@6 (usize _2@0)) (= (MapType0Select Heap@6 null (usize _2@0)) (FrameFragment (MapType0Select Heap@6 _2@0 val_int))))) (and (=> (= (ControlFlow 0 415) 412) anon222_Then_correct) (=> (= (ControlFlow 0 415) 414) anon222_Else_correct))))))
(let ((anon221_Else_correct  (=> (HasDirectPerm Mask@5 null (usize _2@0)) (=> (and (= Heap@5 Heap@2) (= (ControlFlow 0 417) 415)) anon21_correct))))
(let ((anon221_Then_correct  (=> (not (HasDirectPerm Mask@5 null (usize _2@0))) (=> (and (and (= Heap@3 (MapType0Store Heap@2 null (|usize#sm| _2@0) ZeroPMask)) (= Heap@4 (MapType0Store Heap@3 null (usize _2@0) freshVersion@0))) (and (= Heap@5 Heap@4) (= (ControlFlow 0 416) 415))) anon21_correct))))
(let ((anon19_correct  (=> (= Mask@4 (MapType1Store Mask@3 _2@0 val_int (real_2_U (- (U_2_real (MapType1Select Mask@3 _2@0 val_int)) FullPerm)))) (and (=> (= (ControlFlow 0 418) (- 0 419)) (<= 0 (U_2_int (MapType0Select Heap@2 _2@0 val_int)))) (=> (<= 0 (U_2_int (MapType0Select Heap@2 _2@0 val_int))) (=> (= Mask@5 (MapType1Store Mask@4 null (usize _2@0) (real_2_U (+ (U_2_real (MapType1Select Mask@4 null (usize _2@0))) FullPerm)))) (=> (and (and (state Heap@2 Mask@5) (state Heap@2 Mask@5)) (and (|usize#trigger| Heap@2 (usize _2@0)) (= (MapType0Select Heap@2 null (usize _2@0)) (FrameFragment (MapType0Select Heap@2 _2@0 val_int))))) (and (=> (= (ControlFlow 0 418) 416) anon221_Then_correct) (=> (= (ControlFlow 0 418) 417) anon221_Else_correct)))))))))
(let ((anon220_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 422) 418)) anon19_correct)))
(let ((anon220_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 420) (- 0 421)) (<= FullPerm (U_2_real (MapType1Select Mask@3 _2@0 val_int)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@3 _2@0 val_int))) (=> (= (ControlFlow 0 420) 418) anon19_correct))))))
(let ((anon219_Then_correct  (=> __t18@0 (=> (and (state Heap@1 Mask@2) (state Heap@1 Mask@2)) (=> (and (and (and (state Heap@1 Mask@2) (U_2_bool (MapType0Select Heap@1 _8@0 $allocated))) (and (state Heap@1 Mask@2) (not (= _8@0 null)))) (and (and (= Mask@3 (MapType1Store Mask@2 _8@0 val_bool (real_2_U (+ (U_2_real (MapType1Select Mask@2 _8@0 val_bool)) FullPerm)))) (state Heap@1 Mask@3)) (and (state Heap@1 Mask@3) (state Heap@1 Mask@3)))) (and (=> (= (ControlFlow 0 423) (- 0 425)) (= FullPerm (U_2_real (MapType1Select Mask@3 _8@0 val_bool)))) (=> (= FullPerm (U_2_real (MapType1Select Mask@3 _8@0 val_bool))) (=> (and (= Heap@2 (MapType0Store Heap@1 _8@0 val_bool (bool_2_U false))) (state Heap@2 Mask@3)) (and (=> (= (ControlFlow 0 423) (- 0 424)) (HasDirectPerm Mask@3 _8@0 val_bool)) (=> (HasDirectPerm Mask@3 _8@0 val_bool) (=> (and (= __t19@0 (U_2_bool (MapType0Select Heap@2 _8@0 val_bool))) (state Heap@2 Mask@3)) (and (=> (= (ControlFlow 0 423) 420) anon220_Then_correct) (=> (= (ControlFlow 0 423) 422) anon220_Else_correct)))))))))))))
(let ((anon219_Else_correct  (=> (not __t18@0) (=> (and (state Heap@1 Mask@2) (state Heap@1 Mask@2)) (=> (and (and (state Heap@1 Mask@2) (= Mask@34 Mask@2)) (and (= Heap@41 Heap@1) (= (ControlFlow 0 48) 47))) l1_correct)))))
(let ((anon217_Else_correct  (=> (= (lookup_pure__$TY$__Array$3$usize$usize$Array$3$usize$$int$$$int$ Heap@@42 _1@0 2) 3) (=> (and (state Heap@@42 Mask@0) (state Heap@@42 Mask@0)) (=> (and (and (and (state Heap@@42 Mask@0) (U_2_bool (MapType0Select Heap@@42 _2@0 $allocated))) (and (state Heap@@42 Mask@0) (not (= _2@0 null)))) (and (and (= Mask@1 (MapType1Store Mask@0 _2@0 val_int (real_2_U (+ (U_2_real (MapType1Select Mask@0 _2@0 val_int)) FullPerm)))) (state Heap@@42 Mask@1)) (and (state Heap@@42 Mask@1) (state Heap@@42 Mask@1)))) (and (=> (= (ControlFlow 0 426) (- 0 430)) (= FullPerm (U_2_real (MapType1Select Mask@1 _2@0 val_int)))) (=> (= FullPerm (U_2_real (MapType1Select Mask@1 _2@0 val_int))) (=> (and (= Heap@0 (MapType0Store Heap@@42 _2@0 val_int (int_2_U 0))) (state Heap@0 Mask@1)) (=> (and (and (state Heap@0 Mask@1) (state Heap@0 Mask@1)) (and (state Heap@0 Mask@1) (state Heap@0 Mask@1))) (and (=> (= (ControlFlow 0 426) (- 0 429)) (HasDirectPerm Mask@1 _2@0 val_int)) (=> (HasDirectPerm Mask@1 _2@0 val_int) (=> (= _6@1 (U_2_int (MapType0Select Heap@0 _2@0 val_int))) (=> (and (state Heap@0 Mask@1) (state Heap@0 Mask@1)) (=> (and (and (and (state Heap@0 Mask@1) (U_2_bool (MapType0Select Heap@0 _5@0 $allocated))) (and (state Heap@0 Mask@1) (not (= _5@0 null)))) (and (and (= Mask@2 (MapType1Store Mask@1 _5@0 val_bool (real_2_U (+ (U_2_real (MapType1Select Mask@1 _5@0 val_bool)) FullPerm)))) (state Heap@0 Mask@2)) (and (state Heap@0 Mask@2) (state Heap@0 Mask@2)))) (and (=> (= (ControlFlow 0 426) (- 0 428)) (= FullPerm (U_2_real (MapType1Select Mask@2 _5@0 val_bool)))) (=> (= FullPerm (U_2_real (MapType1Select Mask@2 _5@0 val_bool))) (=> (and (= Heap@1 (MapType0Store Heap@0 _5@0 val_bool (bool_2_U (< _6@1 3)))) (state Heap@1 Mask@2)) (and (=> (= (ControlFlow 0 426) (- 0 427)) (HasDirectPerm Mask@2 _5@0 val_bool)) (=> (HasDirectPerm Mask@2 _5@0 val_bool) (=> (and (= __t18@0 (U_2_bool (MapType0Select Heap@1 _5@0 val_bool))) (state Heap@1 Mask@2)) (and (=> (= (ControlFlow 0 426) 423) anon219_Then_correct) (=> (= (ControlFlow 0 426) 48) anon219_Else_correct))))))))))))))))))))))
(let ((anon215_Else_correct  (=> (and (and (= (lookup_pure__$TY$__Array$3$usize$usize$Array$3$usize$$int$$$int$ Heap@@42 _1@0 1) 2) (state Heap@@42 Mask@0)) (and (state Heap@@42 Mask@0) (state Heap@@42 Mask@0))) (and (=> (= (ControlFlow 0 437) 435) anon217_Then_correct) (=> (= (ControlFlow 0 437) 426) anon217_Else_correct)))))
(let ((anon213_Else_correct  (=> (and (and (= (lookup_pure__$TY$__Array$3$usize$usize$Array$3$usize$$int$$$int$ Heap@@42 _1@0 0) 1) (state Heap@@42 Mask@0)) (and (state Heap@@42 Mask@0) (state Heap@@42 Mask@0))) (and (=> (= (ControlFlow 0 444) 442) anon215_Then_correct) (=> (= (ControlFlow 0 444) 437) anon215_Else_correct)))))
(let ((anon0_correct  (=> (state Heap@@42 ZeroMask) (=> (and (and (= AssumeFunctionsAbove (- 0 1)) (U_2_bool (MapType0Select Heap@@42 _1 $allocated))) (and (U_2_bool (MapType0Select Heap@@42 _2 $allocated)) (U_2_bool (MapType0Select Heap@@42 _5 $allocated)))) (=> (and (and (and (U_2_bool (MapType0Select Heap@@42 _8 $allocated)) (U_2_bool (MapType0Select Heap@@42 _12 $allocated))) (and (U_2_bool (MapType0Select Heap@@42 _17 $allocated)) (U_2_bool (MapType0Select Heap@@42 _22 $allocated)))) (and (and (U_2_bool (MapType0Select Heap@@42 _26 $allocated)) (U_2_bool (MapType0Select Heap@@42 _30 $allocated))) (and (U_2_bool (MapType0Select Heap@@42 _31 $allocated)) (U_2_bool (MapType0Select Heap@@42 _32 $allocated))))) (=> (and (and (and (and (U_2_bool (MapType0Select Heap@@42 _33 $allocated)) (U_2_bool (MapType0Select Heap@@42 _34 $allocated))) (and (U_2_bool (MapType0Select Heap@@42 _37 $allocated)) (U_2_bool (MapType0Select Heap@@42 _43 $allocated)))) (and (and (state Heap@@42 ZeroMask) (state Heap@@42 ZeroMask)) (and (state Heap@@42 ZeroMask) (state Heap@@42 ZeroMask)))) (and (and (and (state Heap@@42 ZeroMask) (state Heap@@42 ZeroMask)) (and (state Heap@@42 ZeroMask) (state Heap@@42 ZeroMask))) (and (and (state Heap@@42 ZeroMask) (state Heap@@42 ZeroMask)) (and (state Heap@@42 ZeroMask) (state Heap@@42 ZeroMask))))) (=> (and (and (and (and (and (and (and (state Heap@@42 ZeroMask) (state Heap@@42 ZeroMask)) (and (state Heap@@42 ZeroMask) (state Heap@@42 ZeroMask))) (and (and (state Heap@@42 ZeroMask) (state Heap@@42 ZeroMask)) (and (state Heap@@42 ZeroMask) (state Heap@@42 ZeroMask)))) (and (and (and (state Heap@@42 ZeroMask) (state Heap@@42 ZeroMask)) (and (state Heap@@42 ZeroMask) (state Heap@@42 ZeroMask))) (and (and (state Heap@@42 ZeroMask) (state Heap@@42 ZeroMask)) (and (state Heap@@42 ZeroMask) (state Heap@@42 ZeroMask))))) (and (and (and (and (state Heap@@42 ZeroMask) (state Heap@@42 ZeroMask)) (and (state Heap@@42 ZeroMask) (state Heap@@42 ZeroMask))) (and (and (state Heap@@42 ZeroMask) (state Heap@@42 ZeroMask)) (and (state Heap@@42 ZeroMask) (state Heap@@42 ZeroMask)))) (and (and (and (state Heap@@42 ZeroMask) (state Heap@@42 ZeroMask)) (and (state Heap@@42 ZeroMask) (state Heap@@42 ZeroMask))) (and (and (state Heap@@42 ZeroMask) (state Heap@@42 ZeroMask)) (and (state Heap@@42 ZeroMask) (state Heap@@42 ZeroMask)))))) (and (and (and (and (and (state Heap@@42 ZeroMask) (state Heap@@42 ZeroMask)) (and (state Heap@@42 ZeroMask) (state Heap@@42 ZeroMask))) (and (and (state Heap@@42 ZeroMask) (state Heap@@42 ZeroMask)) (and (state Heap@@42 ZeroMask) (state Heap@@42 ZeroMask)))) (and (and (and (state Heap@@42 ZeroMask) (state Heap@@42 ZeroMask)) (and (state Heap@@42 ZeroMask) (state Heap@@42 ZeroMask))) (and (and (state Heap@@42 ZeroMask) (state Heap@@42 ZeroMask)) (and (state Heap@@42 ZeroMask) (state Heap@@42 ZeroMask))))) (and (and (and (and (state Heap@@42 ZeroMask) (state Heap@@42 ZeroMask)) (and (state Heap@@42 ZeroMask) (state Heap@@42 ZeroMask))) (and (and (state Heap@@42 ZeroMask) (state Heap@@42 ZeroMask)) (and (state Heap@@42 ZeroMask) (state Heap@@42 ZeroMask)))) (and (and (and (state Heap@@42 ZeroMask) (state Heap@@42 ZeroMask)) (and (state Heap@@42 ZeroMask) (state Heap@@42 ZeroMask))) (and (and (state Heap@@42 ZeroMask) (state Heap@@42 ZeroMask)) (and (state Heap@@42 ZeroMask) (state Heap@@42 ZeroMask))))))) (and (and (and (and (and (and (state Heap@@42 ZeroMask) (state Heap@@42 ZeroMask)) (and (state Heap@@42 ZeroMask) (state Heap@@42 ZeroMask))) (and (and (state Heap@@42 ZeroMask) (state Heap@@42 ZeroMask)) (and (state Heap@@42 ZeroMask) (state Heap@@42 ZeroMask)))) (and (and (and (state Heap@@42 ZeroMask) (state Heap@@42 ZeroMask)) (and (state Heap@@42 ZeroMask) (state Heap@@42 ZeroMask))) (and (and (state Heap@@42 ZeroMask) (state Heap@@42 ZeroMask)) (and (state Heap@@42 ZeroMask) (state Heap@@42 ZeroMask))))) (and (and (and (and (state Heap@@42 ZeroMask) (state Heap@@42 ZeroMask)) (and (state Heap@@42 ZeroMask) (state Heap@@42 ZeroMask))) (and (and (state Heap@@42 ZeroMask) (state Heap@@42 ZeroMask)) (and (state Heap@@42 ZeroMask) (state Heap@@42 ZeroMask)))) (and (and (and (state Heap@@42 ZeroMask) (state Heap@@42 ZeroMask)) (and (state Heap@@42 ZeroMask) (state Heap@@42 ZeroMask))) (and (and (state Heap@@42 ZeroMask) (state Heap@@42 ZeroMask)) (and (state Heap@@42 ZeroMask) (state Heap@@42 ZeroMask)))))) (and (and (and (and (and (state Heap@@42 ZeroMask) (state Heap@@42 ZeroMask)) (and (state Heap@@42 ZeroMask) (state Heap@@42 ZeroMask))) (and (and (state Heap@@42 ZeroMask) (state Heap@@42 ZeroMask)) (and (state Heap@@42 ZeroMask) (state Heap@@42 ZeroMask)))) (and (and (and (state Heap@@42 ZeroMask) (state Heap@@42 ZeroMask)) (and (state Heap@@42 ZeroMask) (state Heap@@42 ZeroMask))) (and (and (state Heap@@42 ZeroMask) (state Heap@@42 ZeroMask)) (and (state Heap@@42 ZeroMask) (state Heap@@42 ZeroMask))))) (and (and (and (and (state Heap@@42 ZeroMask) (state Heap@@42 ZeroMask)) (and (state Heap@@42 ZeroMask) (state Heap@@42 ZeroMask))) (and (and (state Heap@@42 ZeroMask) (state Heap@@42 ZeroMask)) (and (state Heap@@42 ZeroMask) (state Heap@@42 ZeroMask)))) (and (and (and (state Heap@@42 ZeroMask) (U_2_bool (MapType0Select Heap@@42 _1@0 $allocated))) (and (state Heap@@42 ZeroMask) (= Mask@0 (MapType1Store ZeroMask null (Array$3$usize _1@0) (real_2_U (+ (U_2_real (MapType1Select ZeroMask null (Array$3$usize _1@0))) FullPerm)))))) (and (and (state Heap@@42 Mask@0) (state Heap@@42 Mask@0)) (and (state Heap@@42 Mask@0) (state Heap@@42 Mask@0)))))))) (and (=> (= (ControlFlow 0 451) 449) anon213_Then_correct) (=> (= (ControlFlow 0 451) 444) anon213_Else_correct)))))))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 452) 451) anon0_correct)))
PreconditionGeneratedEntry_correct)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
))
(check-sat)
(pop 1)
; Valid
(get-info :rlimit)
