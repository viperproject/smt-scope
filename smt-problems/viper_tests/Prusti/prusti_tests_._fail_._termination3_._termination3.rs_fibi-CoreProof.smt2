(get-info :version)
; (:version "4.12.1")
; Started: 2023-10-31 14:16:58
; Silicon.version: 1.1-SNAPSHOT (46944a65@dspil_symbenchmarking)
; Input file: /home/pcorrect/repos/benchmarking_general/silicon_tests/prusti_tests_._fail_._termination3_._termination3.rs_fibi-CoreProof.vpr
; Verifier id: 00
; ------------------------------------------------------------
; Begin preamble
; ////////// Static preamble
; 
; ; /z3config.smt2
(set-option :print-success true) ; Boogie: false
(set-option :global-decls true) ; Necessary for push pop mode
(set-option :auto_config false)
(set-option :smt.case_split 3)
(set-option :smt.delay_units true)
(set-option :type_check true)
(set-option :smt.mbqi false)
(set-option :pp.bv_literals false)
(set-option :smt.qi.eager_threshold 100)
(set-option :smt.arith.solver 2)
(set-option :model.v2 true)
(set-option :smt.qi.max_multi_patterns 1000)
; 
; ; /preamble.smt2
(declare-datatypes (($Snap 0)) ((
    ($Snap.unit)
    ($Snap.combine ($Snap.first $Snap) ($Snap.second $Snap)))))
(declare-sort $Ref 0)
(declare-const $Ref.null $Ref)
(declare-sort $FPM 0)
(declare-sort $PPM 0)
(define-sort $Perm () Real)
(define-const $Perm.Write $Perm 1.0)
(define-const $Perm.No $Perm 0.0)
(define-fun $Perm.isValidVar ((p $Perm)) Bool
	(<= $Perm.No p))
(define-fun $Perm.isReadVar ((p $Perm)) Bool
    (and ($Perm.isValidVar p)
         (not (= p $Perm.No))))
(define-fun $Perm.min ((p1 $Perm) (p2 $Perm)) Real
    (ite (<= p1 p2) p1 p2))
(define-fun $Math.min ((a Int) (b Int)) Int
    (ite (<= a b) a b))
(define-fun $Math.clip ((a Int)) Int
    (ite (< a 0) 0 a))
; ////////// Sorts
(declare-sort Set<Lifetime> 0)
(declare-sort Snap$Usize 0)
(declare-sort Snap$Tuple$$$ 0)
(declare-sort FunctionGas 0)
(declare-sort Bytes 0)
(declare-sort Snap$Unbounded 0)
(declare-sort Functions 0)
(declare-sort Snap$I64 0)
(declare-sort MarkerCalls 0)
(declare-sort Snap$Bool 0)
(declare-sort Lifetime 0)
(declare-sort Snap$Tuple$$I64$Bool$$I64$Bool$ 0)
(declare-sort Size 0)
(declare-sort Address 0)
(declare-sort ComputeAddress 0)
(declare-sort Place 0)
; ////////// Sort wrappers
; Declaring additional sort wrappers
(declare-fun $SortWrappers.IntTo$Snap (Int) $Snap)
(declare-fun $SortWrappers.$SnapToInt ($Snap) Int)
(assert (forall ((x Int)) (!
    (= x ($SortWrappers.$SnapToInt($SortWrappers.IntTo$Snap x)))
    :pattern (($SortWrappers.IntTo$Snap x))
    :qid |$Snap.$SnapToIntTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.IntTo$Snap($SortWrappers.$SnapToInt x)))
    :pattern (($SortWrappers.$SnapToInt x))
    :qid |$Snap.IntTo$SnapToInt|
    )))
(declare-fun $SortWrappers.BoolTo$Snap (Bool) $Snap)
(declare-fun $SortWrappers.$SnapToBool ($Snap) Bool)
(assert (forall ((x Bool)) (!
    (= x ($SortWrappers.$SnapToBool($SortWrappers.BoolTo$Snap x)))
    :pattern (($SortWrappers.BoolTo$Snap x))
    :qid |$Snap.$SnapToBoolTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.BoolTo$Snap($SortWrappers.$SnapToBool x)))
    :pattern (($SortWrappers.$SnapToBool x))
    :qid |$Snap.BoolTo$SnapToBool|
    )))
(declare-fun $SortWrappers.$RefTo$Snap ($Ref) $Snap)
(declare-fun $SortWrappers.$SnapTo$Ref ($Snap) $Ref)
(assert (forall ((x $Ref)) (!
    (= x ($SortWrappers.$SnapTo$Ref($SortWrappers.$RefTo$Snap x)))
    :pattern (($SortWrappers.$RefTo$Snap x))
    :qid |$Snap.$SnapTo$RefTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$RefTo$Snap($SortWrappers.$SnapTo$Ref x)))
    :pattern (($SortWrappers.$SnapTo$Ref x))
    :qid |$Snap.$RefTo$SnapTo$Ref|
    )))
(declare-fun $SortWrappers.$PermTo$Snap ($Perm) $Snap)
(declare-fun $SortWrappers.$SnapTo$Perm ($Snap) $Perm)
(assert (forall ((x $Perm)) (!
    (= x ($SortWrappers.$SnapTo$Perm($SortWrappers.$PermTo$Snap x)))
    :pattern (($SortWrappers.$PermTo$Snap x))
    :qid |$Snap.$SnapTo$PermTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$PermTo$Snap($SortWrappers.$SnapTo$Perm x)))
    :pattern (($SortWrappers.$SnapTo$Perm x))
    :qid |$Snap.$PermTo$SnapTo$Perm|
    )))
; Declaring additional sort wrappers
(declare-fun $SortWrappers.Set<Lifetime>To$Snap (Set<Lifetime>) $Snap)
(declare-fun $SortWrappers.$SnapToSet<Lifetime> ($Snap) Set<Lifetime>)
(assert (forall ((x Set<Lifetime>)) (!
    (= x ($SortWrappers.$SnapToSet<Lifetime>($SortWrappers.Set<Lifetime>To$Snap x)))
    :pattern (($SortWrappers.Set<Lifetime>To$Snap x))
    :qid |$Snap.$SnapToSet<Lifetime>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Set<Lifetime>To$Snap($SortWrappers.$SnapToSet<Lifetime> x)))
    :pattern (($SortWrappers.$SnapToSet<Lifetime> x))
    :qid |$Snap.Set<Lifetime>To$SnapToSet<Lifetime>|
    )))
; Declaring additional sort wrappers
(declare-fun $SortWrappers.Snap$UsizeTo$Snap (Snap$Usize) $Snap)
(declare-fun $SortWrappers.$SnapToSnap$Usize ($Snap) Snap$Usize)
(assert (forall ((x Snap$Usize)) (!
    (= x ($SortWrappers.$SnapToSnap$Usize($SortWrappers.Snap$UsizeTo$Snap x)))
    :pattern (($SortWrappers.Snap$UsizeTo$Snap x))
    :qid |$Snap.$SnapToSnap$UsizeTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Snap$UsizeTo$Snap($SortWrappers.$SnapToSnap$Usize x)))
    :pattern (($SortWrappers.$SnapToSnap$Usize x))
    :qid |$Snap.Snap$UsizeTo$SnapToSnap$Usize|
    )))
(declare-fun $SortWrappers.Snap$Tuple$$$To$Snap (Snap$Tuple$$$) $Snap)
(declare-fun $SortWrappers.$SnapToSnap$Tuple$$$ ($Snap) Snap$Tuple$$$)
(assert (forall ((x Snap$Tuple$$$)) (!
    (= x ($SortWrappers.$SnapToSnap$Tuple$$$($SortWrappers.Snap$Tuple$$$To$Snap x)))
    :pattern (($SortWrappers.Snap$Tuple$$$To$Snap x))
    :qid |$Snap.$SnapToSnap$Tuple$$$To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Snap$Tuple$$$To$Snap($SortWrappers.$SnapToSnap$Tuple$$$ x)))
    :pattern (($SortWrappers.$SnapToSnap$Tuple$$$ x))
    :qid |$Snap.Snap$Tuple$$$To$SnapToSnap$Tuple$$$|
    )))
(declare-fun $SortWrappers.FunctionGasTo$Snap (FunctionGas) $Snap)
(declare-fun $SortWrappers.$SnapToFunctionGas ($Snap) FunctionGas)
(assert (forall ((x FunctionGas)) (!
    (= x ($SortWrappers.$SnapToFunctionGas($SortWrappers.FunctionGasTo$Snap x)))
    :pattern (($SortWrappers.FunctionGasTo$Snap x))
    :qid |$Snap.$SnapToFunctionGasTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.FunctionGasTo$Snap($SortWrappers.$SnapToFunctionGas x)))
    :pattern (($SortWrappers.$SnapToFunctionGas x))
    :qid |$Snap.FunctionGasTo$SnapToFunctionGas|
    )))
(declare-fun $SortWrappers.BytesTo$Snap (Bytes) $Snap)
(declare-fun $SortWrappers.$SnapToBytes ($Snap) Bytes)
(assert (forall ((x Bytes)) (!
    (= x ($SortWrappers.$SnapToBytes($SortWrappers.BytesTo$Snap x)))
    :pattern (($SortWrappers.BytesTo$Snap x))
    :qid |$Snap.$SnapToBytesTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.BytesTo$Snap($SortWrappers.$SnapToBytes x)))
    :pattern (($SortWrappers.$SnapToBytes x))
    :qid |$Snap.BytesTo$SnapToBytes|
    )))
(declare-fun $SortWrappers.Snap$UnboundedTo$Snap (Snap$Unbounded) $Snap)
(declare-fun $SortWrappers.$SnapToSnap$Unbounded ($Snap) Snap$Unbounded)
(assert (forall ((x Snap$Unbounded)) (!
    (= x ($SortWrappers.$SnapToSnap$Unbounded($SortWrappers.Snap$UnboundedTo$Snap x)))
    :pattern (($SortWrappers.Snap$UnboundedTo$Snap x))
    :qid |$Snap.$SnapToSnap$UnboundedTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Snap$UnboundedTo$Snap($SortWrappers.$SnapToSnap$Unbounded x)))
    :pattern (($SortWrappers.$SnapToSnap$Unbounded x))
    :qid |$Snap.Snap$UnboundedTo$SnapToSnap$Unbounded|
    )))
(declare-fun $SortWrappers.FunctionsTo$Snap (Functions) $Snap)
(declare-fun $SortWrappers.$SnapToFunctions ($Snap) Functions)
(assert (forall ((x Functions)) (!
    (= x ($SortWrappers.$SnapToFunctions($SortWrappers.FunctionsTo$Snap x)))
    :pattern (($SortWrappers.FunctionsTo$Snap x))
    :qid |$Snap.$SnapToFunctionsTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.FunctionsTo$Snap($SortWrappers.$SnapToFunctions x)))
    :pattern (($SortWrappers.$SnapToFunctions x))
    :qid |$Snap.FunctionsTo$SnapToFunctions|
    )))
(declare-fun $SortWrappers.Snap$I64To$Snap (Snap$I64) $Snap)
(declare-fun $SortWrappers.$SnapToSnap$I64 ($Snap) Snap$I64)
(assert (forall ((x Snap$I64)) (!
    (= x ($SortWrappers.$SnapToSnap$I64($SortWrappers.Snap$I64To$Snap x)))
    :pattern (($SortWrappers.Snap$I64To$Snap x))
    :qid |$Snap.$SnapToSnap$I64To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Snap$I64To$Snap($SortWrappers.$SnapToSnap$I64 x)))
    :pattern (($SortWrappers.$SnapToSnap$I64 x))
    :qid |$Snap.Snap$I64To$SnapToSnap$I64|
    )))
(declare-fun $SortWrappers.MarkerCallsTo$Snap (MarkerCalls) $Snap)
(declare-fun $SortWrappers.$SnapToMarkerCalls ($Snap) MarkerCalls)
(assert (forall ((x MarkerCalls)) (!
    (= x ($SortWrappers.$SnapToMarkerCalls($SortWrappers.MarkerCallsTo$Snap x)))
    :pattern (($SortWrappers.MarkerCallsTo$Snap x))
    :qid |$Snap.$SnapToMarkerCallsTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.MarkerCallsTo$Snap($SortWrappers.$SnapToMarkerCalls x)))
    :pattern (($SortWrappers.$SnapToMarkerCalls x))
    :qid |$Snap.MarkerCallsTo$SnapToMarkerCalls|
    )))
(declare-fun $SortWrappers.Snap$BoolTo$Snap (Snap$Bool) $Snap)
(declare-fun $SortWrappers.$SnapToSnap$Bool ($Snap) Snap$Bool)
(assert (forall ((x Snap$Bool)) (!
    (= x ($SortWrappers.$SnapToSnap$Bool($SortWrappers.Snap$BoolTo$Snap x)))
    :pattern (($SortWrappers.Snap$BoolTo$Snap x))
    :qid |$Snap.$SnapToSnap$BoolTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Snap$BoolTo$Snap($SortWrappers.$SnapToSnap$Bool x)))
    :pattern (($SortWrappers.$SnapToSnap$Bool x))
    :qid |$Snap.Snap$BoolTo$SnapToSnap$Bool|
    )))
(declare-fun $SortWrappers.LifetimeTo$Snap (Lifetime) $Snap)
(declare-fun $SortWrappers.$SnapToLifetime ($Snap) Lifetime)
(assert (forall ((x Lifetime)) (!
    (= x ($SortWrappers.$SnapToLifetime($SortWrappers.LifetimeTo$Snap x)))
    :pattern (($SortWrappers.LifetimeTo$Snap x))
    :qid |$Snap.$SnapToLifetimeTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.LifetimeTo$Snap($SortWrappers.$SnapToLifetime x)))
    :pattern (($SortWrappers.$SnapToLifetime x))
    :qid |$Snap.LifetimeTo$SnapToLifetime|
    )))
(declare-fun $SortWrappers.Snap$Tuple$$I64$Bool$$I64$Bool$To$Snap (Snap$Tuple$$I64$Bool$$I64$Bool$) $Snap)
(declare-fun $SortWrappers.$SnapToSnap$Tuple$$I64$Bool$$I64$Bool$ ($Snap) Snap$Tuple$$I64$Bool$$I64$Bool$)
(assert (forall ((x Snap$Tuple$$I64$Bool$$I64$Bool$)) (!
    (= x ($SortWrappers.$SnapToSnap$Tuple$$I64$Bool$$I64$Bool$($SortWrappers.Snap$Tuple$$I64$Bool$$I64$Bool$To$Snap x)))
    :pattern (($SortWrappers.Snap$Tuple$$I64$Bool$$I64$Bool$To$Snap x))
    :qid |$Snap.$SnapToSnap$Tuple$$I64$Bool$$I64$Bool$To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Snap$Tuple$$I64$Bool$$I64$Bool$To$Snap($SortWrappers.$SnapToSnap$Tuple$$I64$Bool$$I64$Bool$ x)))
    :pattern (($SortWrappers.$SnapToSnap$Tuple$$I64$Bool$$I64$Bool$ x))
    :qid |$Snap.Snap$Tuple$$I64$Bool$$I64$Bool$To$SnapToSnap$Tuple$$I64$Bool$$I64$Bool$|
    )))
(declare-fun $SortWrappers.SizeTo$Snap (Size) $Snap)
(declare-fun $SortWrappers.$SnapToSize ($Snap) Size)
(assert (forall ((x Size)) (!
    (= x ($SortWrappers.$SnapToSize($SortWrappers.SizeTo$Snap x)))
    :pattern (($SortWrappers.SizeTo$Snap x))
    :qid |$Snap.$SnapToSizeTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.SizeTo$Snap($SortWrappers.$SnapToSize x)))
    :pattern (($SortWrappers.$SnapToSize x))
    :qid |$Snap.SizeTo$SnapToSize|
    )))
(declare-fun $SortWrappers.AddressTo$Snap (Address) $Snap)
(declare-fun $SortWrappers.$SnapToAddress ($Snap) Address)
(assert (forall ((x Address)) (!
    (= x ($SortWrappers.$SnapToAddress($SortWrappers.AddressTo$Snap x)))
    :pattern (($SortWrappers.AddressTo$Snap x))
    :qid |$Snap.$SnapToAddressTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.AddressTo$Snap($SortWrappers.$SnapToAddress x)))
    :pattern (($SortWrappers.$SnapToAddress x))
    :qid |$Snap.AddressTo$SnapToAddress|
    )))
(declare-fun $SortWrappers.ComputeAddressTo$Snap (ComputeAddress) $Snap)
(declare-fun $SortWrappers.$SnapToComputeAddress ($Snap) ComputeAddress)
(assert (forall ((x ComputeAddress)) (!
    (= x ($SortWrappers.$SnapToComputeAddress($SortWrappers.ComputeAddressTo$Snap x)))
    :pattern (($SortWrappers.ComputeAddressTo$Snap x))
    :qid |$Snap.$SnapToComputeAddressTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.ComputeAddressTo$Snap($SortWrappers.$SnapToComputeAddress x)))
    :pattern (($SortWrappers.$SnapToComputeAddress x))
    :qid |$Snap.ComputeAddressTo$SnapToComputeAddress|
    )))
(declare-fun $SortWrappers.PlaceTo$Snap (Place) $Snap)
(declare-fun $SortWrappers.$SnapToPlace ($Snap) Place)
(assert (forall ((x Place)) (!
    (= x ($SortWrappers.$SnapToPlace($SortWrappers.PlaceTo$Snap x)))
    :pattern (($SortWrappers.PlaceTo$Snap x))
    :qid |$Snap.$SnapToPlaceTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.PlaceTo$Snap($SortWrappers.$SnapToPlace x)))
    :pattern (($SortWrappers.$SnapToPlace x))
    :qid |$Snap.PlaceTo$SnapToPlace|
    )))
; ////////// Symbols
(declare-fun Set_in (Lifetime Set<Lifetime>) Bool)
(declare-fun Set_card (Set<Lifetime>) Int)
(declare-const Set_empty Set<Lifetime>)
(declare-fun Set_singleton (Lifetime) Set<Lifetime>)
(declare-fun Set_unionone (Set<Lifetime> Lifetime) Set<Lifetime>)
(declare-fun Set_union (Set<Lifetime> Set<Lifetime>) Set<Lifetime>)
(declare-fun Set_disjoint (Set<Lifetime> Set<Lifetime>) Bool)
(declare-fun Set_difference (Set<Lifetime> Set<Lifetime>) Set<Lifetime>)
(declare-fun Set_intersection (Set<Lifetime> Set<Lifetime>) Set<Lifetime>)
(declare-fun Set_subset (Set<Lifetime> Set<Lifetime>) Bool)
(declare-fun Set_equal (Set<Lifetime> Set<Lifetime>) Bool)
(declare-fun m_fib$<Snap$I64> (Snap$I64 FunctionGas) Snap$I64)
(declare-fun builtin$unreach$I64$<Snap$I64> (FunctionGas) Snap$I64)
(declare-fun compute_address<Address> (Place Address) Address)
(declare-const _1$place<Place> Place)
(declare-const _2$place<Place> Place)
(declare-const _3$place<Place> Place)
(declare-const _4$place<Place> Place)
(declare-const _8$place<Place> Place)
(declare-const _9$place<Place> Place)
(declare-const _7$place<Place> Place)
(declare-const _11$place<Place> Place)
(declare-const _10$place<Place> Place)
(declare-const _16$place<Place> Place)
(declare-const _15$place<Place> Place)
(declare-const _21$place<Place> Place)
(declare-const _20$place<Place> Place)
(declare-const _25$place<Place> Place)
(declare-const _24$place<Place> Place)
(declare-const _30$place<Place> Place)
(declare-const _29$place<Place> Place)
(declare-const _35$place<Place> Place)
(declare-const _36$place<Place> Place)
(declare-fun field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (Place) Place)
(declare-fun field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (Place) Place)
(declare-const _37$place<Place> Place)
(declare-const _34$place<Place> Place)
(declare-const _39$place<Place> Place)
(declare-const _38$place<Place> Place)
(declare-const _43$place<Place> Place)
(declare-const _44$place<Place> Place)
(declare-const _45$place<Place> Place)
(declare-const _6$place<Place> Place)
(declare-const _5$place<Place> Place)
(declare-const _50$place<Place> Place)
(declare-const _49$place<Place> Place)
(declare-const _55$place<Place> Place)
(declare-const _54$place<Place> Place)
(declare-const _0$place<Place> Place)
(declare-const constructor$Snap$Tuple$$$$<Snap$Tuple$$$> Snap$Tuple$$$)
(declare-fun valid$Snap$Tuple$$$<Bool> (Snap$Tuple$$$) Bool)
(declare-fun to_bytes$Tuple$$$<Bytes> (Snap$Tuple$$$) Bytes)
(declare-fun constructor$Snap$Bool$<Snap$Bool> (Bool) Snap$Bool)
(declare-fun destructor$Snap$Bool$$value<Bool> (Snap$Bool) Bool)
(declare-fun valid$Snap$Bool<Bool> (Snap$Bool) Bool)
(declare-fun constructor$Snap$Bool$LtCmp_I64<Snap$Bool> (Snap$I64 Snap$I64) Snap$Bool)
(declare-fun destructor$Snap$Bool$LtCmp_I64$left<Snap$I64> (Snap$Bool) Snap$I64)
(declare-fun destructor$Snap$Bool$LtCmp_I64$right<Snap$I64> (Snap$Bool) Snap$I64)
(declare-fun to_bytes$Bool<Bytes> (Snap$Bool) Bytes)
(declare-fun constructor$Snap$Bool$GeCmp_I64<Snap$Bool> (Snap$I64 Snap$I64) Snap$Bool)
(declare-fun destructor$Snap$Bool$GeCmp_I64$left<Snap$I64> (Snap$Bool) Snap$I64)
(declare-fun destructor$Snap$Bool$GeCmp_I64$right<Snap$I64> (Snap$Bool) Snap$I64)
(declare-fun constructor$Snap$Bool$LeCmp_I64<Snap$Bool> (Snap$I64 Snap$I64) Snap$Bool)
(declare-fun destructor$Snap$Bool$LeCmp_I64$left<Snap$I64> (Snap$Bool) Snap$I64)
(declare-fun destructor$Snap$Bool$LeCmp_I64$right<Snap$I64> (Snap$Bool) Snap$I64)
(declare-fun constructor$Snap$Bool$EqCmp_I64<Snap$Bool> (Snap$I64 Snap$I64) Snap$Bool)
(declare-fun destructor$Snap$Bool$EqCmp_I64$left<Snap$I64> (Snap$Bool) Snap$I64)
(declare-fun destructor$Snap$Bool$EqCmp_I64$right<Snap$I64> (Snap$Bool) Snap$I64)
(declare-fun constructor$Snap$Bool$EqCmp_Lifetime<Snap$Bool> (Lifetime Lifetime) Snap$Bool)
(declare-fun destructor$Snap$Bool$EqCmp_Lifetime$left<Lifetime> (Snap$Bool) Lifetime)
(declare-fun destructor$Snap$Bool$EqCmp_Lifetime$right<Lifetime> (Snap$Bool) Lifetime)
(declare-fun constructor$Snap$Bool$GtCmp_Unbounded<Snap$Bool> (Snap$Unbounded Snap$Unbounded) Snap$Bool)
(declare-fun destructor$Snap$Bool$GtCmp_Unbounded$left<Snap$Unbounded> (Snap$Bool) Snap$Unbounded)
(declare-fun destructor$Snap$Bool$GtCmp_Unbounded$right<Snap$Unbounded> (Snap$Bool) Snap$Unbounded)
(declare-fun constructor$Snap$Bool$EqCmp_Unbounded<Snap$Bool> (Snap$Unbounded Snap$Unbounded) Snap$Bool)
(declare-fun destructor$Snap$Bool$EqCmp_Unbounded$left<Snap$Unbounded> (Snap$Bool) Snap$Unbounded)
(declare-fun destructor$Snap$Bool$EqCmp_Unbounded$right<Snap$Unbounded> (Snap$Bool) Snap$Unbounded)
(declare-fun constructor$Snap$Bool$LtCmp_Unbounded<Snap$Bool> (Snap$Unbounded Snap$Unbounded) Snap$Bool)
(declare-fun destructor$Snap$Bool$LtCmp_Unbounded$left<Snap$Unbounded> (Snap$Bool) Snap$Unbounded)
(declare-fun destructor$Snap$Bool$LtCmp_Unbounded$right<Snap$Unbounded> (Snap$Bool) Snap$Unbounded)
(declare-fun constructor$Snap$Bool$GeCmp_Unbounded<Snap$Bool> (Snap$Unbounded Snap$Unbounded) Snap$Bool)
(declare-fun destructor$Snap$Bool$GeCmp_Unbounded$left<Snap$Unbounded> (Snap$Bool) Snap$Unbounded)
(declare-fun destructor$Snap$Bool$GeCmp_Unbounded$right<Snap$Unbounded> (Snap$Bool) Snap$Unbounded)
(declare-fun field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (Address) Address)
(declare-fun field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> (Address) Address)
(declare-fun constructor$Snap$I64$<Snap$I64> (Int) Snap$I64)
(declare-fun destructor$Snap$I64$$value<Int> (Snap$I64) Int)
(declare-fun valid$Snap$I64<Bool> (Snap$I64) Bool)
(declare-fun to_bytes$I64<Bytes> (Snap$I64) Bytes)
(declare-fun constructor$Snap$I64$Sub_I64<Snap$I64> (Snap$I64 Snap$I64) Snap$I64)
(declare-fun destructor$Snap$I64$Sub_I64$left<Snap$I64> (Snap$I64) Snap$I64)
(declare-fun destructor$Snap$I64$Sub_I64$right<Snap$I64> (Snap$I64) Snap$I64)
(declare-fun constructor$Snap$I64$Add_I64<Snap$I64> (Snap$I64 Snap$I64) Snap$I64)
(declare-fun destructor$Snap$I64$Add_I64$left<Snap$I64> (Snap$I64) Snap$I64)
(declare-fun destructor$Snap$I64$Add_I64$right<Snap$I64> (Snap$I64) Snap$I64)
(declare-fun included<Bool> (Lifetime Lifetime) Bool)
(declare-fun intersect<Lifetime> (Set<Lifetime>) Lifetime)
(declare-const function_no_gas$<FunctionGas> FunctionGas)
(declare-fun function_gas_level$<FunctionGas> (FunctionGas) FunctionGas)
(declare-fun constructor$Snap$Unbounded$<Snap$Unbounded> (Int) Snap$Unbounded)
(declare-fun destructor$Snap$Unbounded$$value<Int> (Snap$Unbounded) Int)
(declare-fun valid$Snap$Unbounded<Bool> (Snap$Unbounded) Bool)
(declare-fun constructor$Snap$Unbounded$Sub_Unbounded<Snap$Unbounded> (Snap$Unbounded Snap$Unbounded) Snap$Unbounded)
(declare-fun destructor$Snap$Unbounded$Sub_Unbounded$left<Snap$Unbounded> (Snap$Unbounded) Snap$Unbounded)
(declare-fun destructor$Snap$Unbounded$Sub_Unbounded$right<Snap$Unbounded> (Snap$Unbounded) Snap$Unbounded)
(declare-fun constructor$Snap$Tuple$$I64$Bool$$I64$Bool$$<Snap$Tuple$$I64$Bool$$I64$Bool$> (Snap$I64 Snap$Bool) Snap$Tuple$$I64$Bool$$I64$Bool$)
(declare-fun destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> (Snap$Tuple$$I64$Bool$$I64$Bool$) Snap$I64)
(declare-fun destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> (Snap$Tuple$$I64$Bool$$I64$Bool$) Snap$Bool)
(declare-fun valid$Snap$Tuple$$I64$Bool$$I64$Bool$<Bool> (Snap$Tuple$$I64$Bool$$I64$Bool$) Bool)
(declare-fun to_bytes$Tuple$$I64$Bool$$I64$Bool$<Bytes> (Snap$Tuple$$I64$Bool$$I64$Bool$) Bytes)
(declare-const Size$I64$<Snap$Usize> Snap$Usize)
(declare-const Size$Tuple$$$$<Snap$Usize> Snap$Usize)
(declare-const Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize> Snap$Usize)
(declare-const Size$Bool$<Snap$Usize> Snap$Usize)
(declare-const PaddingSize$Tuple$$$$<Snap$Usize> Snap$Usize)
(declare-const PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize> Snap$Usize)
(declare-fun constructor$Snap$Usize$<Snap$Usize> (Int) Snap$Usize)
(declare-fun destructor$Snap$Usize$$value<Int> (Snap$Usize) Int)
(declare-fun valid$Snap$Usize<Bool> (Snap$Usize) Bool)
(declare-const basic_block_marker$start_label$marker<Bool> Bool)
(declare-const basic_block_marker$label_entry$marker<Bool> Bool)
(declare-const basic_block_marker$label_bb0$marker<Bool> Bool)
(declare-const basic_block_marker$label_bb1$marker<Bool> Bool)
(declare-const basic_block_marker$label_bb2$marker<Bool> Bool)
(declare-const basic_block_marker$label_3_custom$marker<Bool> Bool)
(declare-const basic_block_marker$label_bb3$marker<Bool> Bool)
(declare-const basic_block_marker$label_bb5$marker<Bool> Bool)
(declare-const basic_block_marker$label_bb6$marker<Bool> Bool)
(declare-const basic_block_marker$label_bb8$marker<Bool> Bool)
(declare-const basic_block_marker$label_bb9$marker<Bool> Bool)
(declare-const basic_block_marker$label_bb11$marker<Bool> Bool)
(declare-const basic_block_marker$label_bb12$marker<Bool> Bool)
(declare-const basic_block_marker$label_bb14$marker<Bool> Bool)
(declare-const basic_block_marker$label_bb15$marker<Bool> Bool)
(declare-const basic_block_marker$label_bb17$marker<Bool> Bool)
(declare-const basic_block_marker$label_bb18$marker<Bool> Bool)
(declare-const basic_block_marker$label_bb19$marker<Bool> Bool)
(declare-const basic_block_marker$label_bb21$marker<Bool> Bool)
(declare-const basic_block_marker$label_bb22$marker<Bool> Bool)
(declare-const basic_block_marker$label_bb31$marker<Bool> Bool)
(declare-const basic_block_marker$resume_panic_label$marker<Bool> Bool)
(declare-const basic_block_marker$label_bb23$marker<Bool> Bool)
(declare-const basic_block_marker$loop__label_bb1__label_bb1$marker<Bool> Bool)
(declare-const basic_block_marker$loop__label_bb1__label_bb2$marker<Bool> Bool)
(declare-const basic_block_marker$loop__label_bb1__label_3_custom$marker<Bool> Bool)
(declare-const basic_block_marker$loop__label_bb1__label_bb3$marker<Bool> Bool)
(declare-const basic_block_marker$magic_label$marker<Bool> Bool)
(declare-const basic_block_marker$label_2_custom$marker<Bool> Bool)
(declare-const basic_block_marker$label_bb24$marker<Bool> Bool)
(declare-const basic_block_marker$label_bb26$marker<Bool> Bool)
(declare-const basic_block_marker$label_bb27$marker<Bool> Bool)
(declare-const basic_block_marker$label_bb29$marker<Bool> Bool)
(declare-const basic_block_marker$label_bb30$marker<Bool> Bool)
(declare-const basic_block_marker$return_label$marker<Bool> Bool)
(declare-const basic_block_marker$end_label$marker<Bool> Bool)
; Declaring symbols related to program functions (from program analysis)
(declare-fun MemoryBlock$bytes ($Snap Address Snap$Usize) Bytes)
(declare-fun MemoryBlock$bytes%limited ($Snap Address Snap$Usize) Bytes)
(declare-fun MemoryBlock$bytes%stateless (Address Snap$Usize) Bool)
(declare-fun MemoryBlock$bytes%precondition ($Snap Address Snap$Usize) Bool)
(declare-fun caller_for$m_fib$ ($Snap Snap$I64) Snap$I64)
(declare-fun caller_for$m_fib$%limited ($Snap Snap$I64) Snap$I64)
(declare-fun caller_for$m_fib$%stateless (Snap$I64) Bool)
(declare-fun caller_for$m_fib$%precondition ($Snap Snap$I64) Bool)
(declare-fun caller_for$builtin$unreach$I64$ ($Snap) Snap$I64)
(declare-fun caller_for$builtin$unreach$I64$%limited ($Snap) Snap$I64)
(declare-const caller_for$builtin$unreach$I64$%stateless Bool)
(declare-fun caller_for$builtin$unreach$I64$%precondition ($Snap) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun OwnedNonAliased$Tuple$$$%trigger ($Snap Place Address Snap$Tuple$$$) Bool)
(declare-fun OwnedNonAliased$Tuple$$I64$Bool$$I64$Bool$%trigger ($Snap Place Address Snap$Tuple$$I64$Bool$$I64$Bool$) Bool)
(declare-fun OwnedNonAliased$I64%trigger ($Snap Place Address Snap$I64) Bool)
(declare-fun OwnedNonAliased$Bool%trigger ($Snap Place Address Snap$Bool) Bool)
(declare-fun DeadLifetimeToken%trigger ($Snap Lifetime) Bool)
(declare-fun LifetimeToken%trigger ($Snap Lifetime) Bool)
(declare-fun MemoryBlock%trigger ($Snap Address Snap$Usize) Bool)
(declare-fun MemoryBlockStackDrop%trigger ($Snap Address Snap$Usize) Bool)
; ////////// Uniqueness assumptions from domains
(assert (distinct _38$place<Place> _35$place<Place> _25$place<Place> _1$place<Place> _21$place<Place> _11$place<Place> _5$place<Place> _10$place<Place> _2$place<Place> _45$place<Place> _20$place<Place> _54$place<Place> _55$place<Place> _3$place<Place> _34$place<Place> _49$place<Place> _50$place<Place> _9$place<Place> _16$place<Place> _8$place<Place> _36$place<Place> _43$place<Place> _0$place<Place> _44$place<Place> _15$place<Place> _37$place<Place> _4$place<Place> _29$place<Place> _30$place<Place> _6$place<Place> _24$place<Place> _7$place<Place> _39$place<Place>))
; ////////// Axioms
(assert (forall ((s Set<Lifetime>)) (!
  (<= 0 (Set_card s))
  :pattern ((Set_card s))
  :qid |$Set[Lifetime]_prog.card_non_negative|)))
(assert (forall ((e Lifetime)) (!
  (not (Set_in e (as Set_empty  Set<Lifetime>)))
  :pattern ((Set_in e (as Set_empty  Set<Lifetime>)))
  :qid |$Set[Lifetime]_prog.in_empty_set|)))
(assert (forall ((s Set<Lifetime>)) (!
  (and
    (= (= (Set_card s) 0) (= s (as Set_empty  Set<Lifetime>)))
    (=>
      (not (= (Set_card s) 0))
      (exists ((e Lifetime)) (!
        (Set_in e s)
        :pattern ((Set_in e s))
        ))))
  :pattern ((Set_card s))
  :qid |$Set[Lifetime]_prog.empty_set_cardinality|)))
(assert (forall ((e Lifetime)) (!
  (Set_in e (Set_singleton e))
  :pattern ((Set_singleton e))
  :qid |$Set[Lifetime]_prog.in_singleton_set|)))
(assert (forall ((e1 Lifetime) (e2 Lifetime)) (!
  (= (Set_in e1 (Set_singleton e2)) (= e1 e2))
  :pattern ((Set_in e1 (Set_singleton e2)))
  :qid |$Set[Lifetime]_prog.in_singleton_set_equality|)))
(assert (forall ((e Lifetime)) (!
  (= (Set_card (Set_singleton e)) 1)
  :pattern ((Set_card (Set_singleton e)))
  :qid |$Set[Lifetime]_prog.singleton_set_cardinality|)))
(assert (forall ((s Set<Lifetime>) (e Lifetime)) (!
  (Set_in e (Set_unionone s e))
  :pattern ((Set_unionone s e))
  :qid |$Set[Lifetime]_prog.in_unionone_same|)))
(assert (forall ((s Set<Lifetime>) (e1 Lifetime) (e2 Lifetime)) (!
  (= (Set_in e1 (Set_unionone s e2)) (or (= e1 e2) (Set_in e1 s)))
  :pattern ((Set_in e1 (Set_unionone s e2)))
  :qid |$Set[Lifetime]_prog.in_unionone_other|)))
(assert (forall ((s Set<Lifetime>) (e1 Lifetime) (e2 Lifetime)) (!
  (=> (Set_in e1 s) (Set_in e1 (Set_unionone s e2)))
  :pattern ((Set_in e1 s) (Set_unionone s e2))
  :qid |$Set[Lifetime]_prog.invariance_in_unionone|)))
(assert (forall ((s Set<Lifetime>) (e Lifetime)) (!
  (=> (Set_in e s) (= (Set_card (Set_unionone s e)) (Set_card s)))
  :pattern ((Set_card (Set_unionone s e)))
  :qid |$Set[Lifetime]_prog.unionone_cardinality_invariant|)))
(assert (forall ((s Set<Lifetime>) (e Lifetime)) (!
  (=> (not (Set_in e s)) (= (Set_card (Set_unionone s e)) (+ (Set_card s) 1)))
  :pattern ((Set_card (Set_unionone s e)))
  :qid |$Set[Lifetime]_prog.unionone_cardinality_changed|)))
(assert (forall ((s1 Set<Lifetime>) (s2 Set<Lifetime>) (e Lifetime)) (!
  (= (Set_in e (Set_union s1 s2)) (or (Set_in e s1) (Set_in e s2)))
  :pattern ((Set_in e (Set_union s1 s2)))
  :qid |$Set[Lifetime]_prog.in_union_in_one|)))
(assert (forall ((s1 Set<Lifetime>) (s2 Set<Lifetime>) (e Lifetime)) (!
  (=> (Set_in e s1) (Set_in e (Set_union s1 s2)))
  :pattern ((Set_in e s1) (Set_union s1 s2))
  :qid |$Set[Lifetime]_prog.in_left_in_union|)))
(assert (forall ((s1 Set<Lifetime>) (s2 Set<Lifetime>) (e Lifetime)) (!
  (=> (Set_in e s2) (Set_in e (Set_union s1 s2)))
  :pattern ((Set_in e s2) (Set_union s1 s2))
  :qid |$Set[Lifetime]_prog.in_right_in_union|)))
(assert (forall ((s1 Set<Lifetime>) (s2 Set<Lifetime>) (e Lifetime)) (!
  (= (Set_in e (Set_intersection s1 s2)) (and (Set_in e s1) (Set_in e s2)))
  :pattern ((Set_in e (Set_intersection s1 s2)))
  :pattern ((Set_intersection s1 s2) (Set_in e s1))
  :pattern ((Set_intersection s1 s2) (Set_in e s2))
  :qid |$Set[Lifetime]_prog.in_intersection_in_both|)))
(assert (forall ((s1 Set<Lifetime>) (s2 Set<Lifetime>)) (!
  (= (Set_union s1 (Set_union s1 s2)) (Set_union s1 s2))
  :pattern ((Set_union s1 (Set_union s1 s2)))
  :qid |$Set[Lifetime]_prog.union_left_idempotency|)))
(assert (forall ((s1 Set<Lifetime>) (s2 Set<Lifetime>)) (!
  (= (Set_union (Set_union s1 s2) s2) (Set_union s1 s2))
  :pattern ((Set_union (Set_union s1 s2) s2))
  :qid |$Set[Lifetime]_prog.union_right_idempotency|)))
(assert (forall ((s1 Set<Lifetime>) (s2 Set<Lifetime>)) (!
  (= (Set_intersection s1 (Set_intersection s1 s2)) (Set_intersection s1 s2))
  :pattern ((Set_intersection s1 (Set_intersection s1 s2)))
  :qid |$Set[Lifetime]_prog.intersection_left_idempotency|)))
(assert (forall ((s1 Set<Lifetime>) (s2 Set<Lifetime>)) (!
  (= (Set_intersection (Set_intersection s1 s2) s2) (Set_intersection s1 s2))
  :pattern ((Set_intersection (Set_intersection s1 s2) s2))
  :qid |$Set[Lifetime]_prog.intersection_right_idempotency|)))
(assert (forall ((s1 Set<Lifetime>) (s2 Set<Lifetime>)) (!
  (=
    (+ (Set_card (Set_union s1 s2)) (Set_card (Set_intersection s1 s2)))
    (+ (Set_card s1) (Set_card s2)))
  :pattern ((Set_card (Set_union s1 s2)))
  :pattern ((Set_card (Set_intersection s1 s2)))
  :qid |$Set[Lifetime]_prog.cardinality_sums|)))
(assert (forall ((s1 Set<Lifetime>) (s2 Set<Lifetime>) (e Lifetime)) (!
  (= (Set_in e (Set_difference s1 s2)) (and (Set_in e s1) (not (Set_in e s2))))
  :pattern ((Set_in e (Set_difference s1 s2)))
  :qid |$Set[Lifetime]_prog.in_difference|)))
(assert (forall ((s1 Set<Lifetime>) (s2 Set<Lifetime>) (e Lifetime)) (!
  (=> (Set_in e s2) (not (Set_in e (Set_difference s1 s2))))
  :pattern ((Set_difference s1 s2) (Set_in e s2))
  :qid |$Set[Lifetime]_prog.not_in_difference|)))
(assert (forall ((s1 Set<Lifetime>) (s2 Set<Lifetime>)) (!
  (=
    (Set_subset s1 s2)
    (forall ((e Lifetime)) (!
      (=> (Set_in e s1) (Set_in e s2))
      :pattern ((Set_in e s1))
      :pattern ((Set_in e s2))
      )))
  :pattern ((Set_subset s1 s2))
  :qid |$Set[Lifetime]_prog.subset_definition|)))
(assert (forall ((s1 Set<Lifetime>) (s2 Set<Lifetime>)) (!
  (=
    (Set_equal s1 s2)
    (forall ((e Lifetime)) (!
      (= (Set_in e s1) (Set_in e s2))
      :pattern ((Set_in e s1))
      :pattern ((Set_in e s2))
      )))
  :pattern ((Set_equal s1 s2))
  :qid |$Set[Lifetime]_prog.equality_definition|)))
(assert (forall ((s1 Set<Lifetime>) (s2 Set<Lifetime>)) (!
  (=> (Set_equal s1 s2) (= s1 s2))
  :pattern ((Set_equal s1 s2))
  :qid |$Set[Lifetime]_prog.native_equality|)))
(assert (forall ((s1 Set<Lifetime>) (s2 Set<Lifetime>)) (!
  (=
    (Set_disjoint s1 s2)
    (forall ((e Lifetime)) (!
      (or (not (Set_in e s1)) (not (Set_in e s2)))
      :pattern ((Set_in e s1))
      :pattern ((Set_in e s2))
      )))
  :pattern ((Set_disjoint s1 s2))
  :qid |$Set[Lifetime]_prog.disjointness_definition|)))
(assert (forall ((s1 Set<Lifetime>) (s2 Set<Lifetime>)) (!
  (and
    (=
      (+
        (+ (Set_card (Set_difference s1 s2)) (Set_card (Set_difference s2 s1)))
        (Set_card (Set_intersection s1 s2)))
      (Set_card (Set_union s1 s2)))
    (=
      (Set_card (Set_difference s1 s2))
      (- (Set_card s1) (Set_card (Set_intersection s1 s2)))))
  :pattern ((Set_card (Set_difference s1 s2)))
  :qid |$Set[Lifetime]_prog.cardinality_difference|)))
(assert (forall ((gas$ FunctionGas)) (!
  (=
    (builtin$unreach$I64$<Snap$I64> (function_gas_level$<FunctionGas> gas$))
    (builtin$unreach$I64$<Snap$I64> gas$))
  :pattern ((builtin$unreach$I64$<Snap$I64> (function_gas_level$<FunctionGas> gas$)))
  :qid |prog.builtin$unreach$I64$$definitional_axiom|)))
(assert (forall ((_1 Snap$I64) (gas$ FunctionGas)) (!
  (and
    (=>
      (and
        (destructor$Snap$Bool$$value<Bool> (constructor$Snap$Bool$GeCmp_I64<Snap$Bool> _1 (constructor$Snap$I64$<Snap$I64> 0)))
        (valid$Snap$I64<Bool> _1))
      (and
        (=
          (m_fib$<Snap$I64> _1 (function_gas_level$<FunctionGas> gas$))
          (ite
            (not
              (destructor$Snap$Bool$$value<Bool> (constructor$Snap$Bool$LeCmp_I64<Snap$Bool> _1 (constructor$Snap$I64$<Snap$I64> 1))))
            (constructor$Snap$I64$Add_I64<Snap$I64> (m_fib$<Snap$I64> (constructor$Snap$I64$Sub_I64<Snap$I64> _1 (constructor$Snap$I64$<Snap$I64> 1)) gas$) (m_fib$<Snap$I64> (constructor$Snap$I64$Sub_I64<Snap$I64> _1 (constructor$Snap$I64$<Snap$I64> 2)) gas$))
            _1))
        (valid$Snap$I64<Bool> (m_fib$<Snap$I64> _1 (function_gas_level$<FunctionGas> gas$)))))
    (=
      (m_fib$<Snap$I64> _1 (function_gas_level$<FunctionGas> gas$))
      (m_fib$<Snap$I64> _1 gas$)))
  :pattern ((m_fib$<Snap$I64> _1 (function_gas_level$<FunctionGas> gas$)))
  :qid |prog.m_fib$$definitional_axiom|)))
(assert (forall ((address Address)) (!
  (= (compute_address<Address> (as _1$place<Place>  Place) address) address)
  :pattern ((compute_address<Address> (as _1$place<Place>  Place) address))
  :qid |prog.root$1$compute_address_axiom|)))
(assert (forall ((address Address)) (!
  (= (compute_address<Address> (as _2$place<Place>  Place) address) address)
  :pattern ((compute_address<Address> (as _2$place<Place>  Place) address))
  :qid |prog.root$2$compute_address_axiom|)))
(assert (forall ((address Address)) (!
  (= (compute_address<Address> (as _3$place<Place>  Place) address) address)
  :pattern ((compute_address<Address> (as _3$place<Place>  Place) address))
  :qid |prog.root$3$compute_address_axiom|)))
(assert (forall ((address Address)) (!
  (= (compute_address<Address> (as _4$place<Place>  Place) address) address)
  :pattern ((compute_address<Address> (as _4$place<Place>  Place) address))
  :qid |prog.root$4$compute_address_axiom|)))
(assert (forall ((address Address)) (!
  (= (compute_address<Address> (as _8$place<Place>  Place) address) address)
  :pattern ((compute_address<Address> (as _8$place<Place>  Place) address))
  :qid |prog.root$5$compute_address_axiom|)))
(assert (forall ((address Address)) (!
  (= (compute_address<Address> (as _9$place<Place>  Place) address) address)
  :pattern ((compute_address<Address> (as _9$place<Place>  Place) address))
  :qid |prog.root$6$compute_address_axiom|)))
(assert (forall ((address Address)) (!
  (= (compute_address<Address> (as _7$place<Place>  Place) address) address)
  :pattern ((compute_address<Address> (as _7$place<Place>  Place) address))
  :qid |prog.root$7$compute_address_axiom|)))
(assert (forall ((address Address)) (!
  (= (compute_address<Address> (as _11$place<Place>  Place) address) address)
  :pattern ((compute_address<Address> (as _11$place<Place>  Place) address))
  :qid |prog.root$8$compute_address_axiom|)))
(assert (forall ((address Address)) (!
  (= (compute_address<Address> (as _10$place<Place>  Place) address) address)
  :pattern ((compute_address<Address> (as _10$place<Place>  Place) address))
  :qid |prog.root$9$compute_address_axiom|)))
(assert (forall ((address Address)) (!
  (= (compute_address<Address> (as _16$place<Place>  Place) address) address)
  :pattern ((compute_address<Address> (as _16$place<Place>  Place) address))
  :qid |prog.root$10$compute_address_axiom|)))
(assert (forall ((address Address)) (!
  (= (compute_address<Address> (as _15$place<Place>  Place) address) address)
  :pattern ((compute_address<Address> (as _15$place<Place>  Place) address))
  :qid |prog.root$11$compute_address_axiom|)))
(assert (forall ((address Address)) (!
  (= (compute_address<Address> (as _21$place<Place>  Place) address) address)
  :pattern ((compute_address<Address> (as _21$place<Place>  Place) address))
  :qid |prog.root$12$compute_address_axiom|)))
(assert (forall ((address Address)) (!
  (= (compute_address<Address> (as _20$place<Place>  Place) address) address)
  :pattern ((compute_address<Address> (as _20$place<Place>  Place) address))
  :qid |prog.root$13$compute_address_axiom|)))
(assert (forall ((address Address)) (!
  (= (compute_address<Address> (as _25$place<Place>  Place) address) address)
  :pattern ((compute_address<Address> (as _25$place<Place>  Place) address))
  :qid |prog.root$14$compute_address_axiom|)))
(assert (forall ((address Address)) (!
  (= (compute_address<Address> (as _24$place<Place>  Place) address) address)
  :pattern ((compute_address<Address> (as _24$place<Place>  Place) address))
  :qid |prog.root$15$compute_address_axiom|)))
(assert (forall ((address Address)) (!
  (= (compute_address<Address> (as _30$place<Place>  Place) address) address)
  :pattern ((compute_address<Address> (as _30$place<Place>  Place) address))
  :qid |prog.root$16$compute_address_axiom|)))
(assert (forall ((address Address)) (!
  (= (compute_address<Address> (as _29$place<Place>  Place) address) address)
  :pattern ((compute_address<Address> (as _29$place<Place>  Place) address))
  :qid |prog.root$17$compute_address_axiom|)))
(assert (forall ((address Address)) (!
  (= (compute_address<Address> (as _35$place<Place>  Place) address) address)
  :pattern ((compute_address<Address> (as _35$place<Place>  Place) address))
  :qid |prog.root$18$compute_address_axiom|)))
(assert (forall ((address Address)) (!
  (= (compute_address<Address> (as _36$place<Place>  Place) address) address)
  :pattern ((compute_address<Address> (as _36$place<Place>  Place) address))
  :qid |prog.root$19$compute_address_axiom|)))
(assert (forall ((place Place) (address Address)) (!
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> place) address)
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> place address)))
  :pattern ((compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> place) address))
  :qid |prog.Tuple$$I64$Bool$$I64$Bool$$tuple_0$compute_address_axiom|)))
(assert (forall ((place Place) (address Address)) (!
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> place) address)
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> (compute_address<Address> place address)))
  :pattern ((compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> place) address))
  :qid |prog.Tuple$$I64$Bool$$I64$Bool$$tuple_1$compute_address_axiom|)))
(assert (forall ((address Address)) (!
  (= (compute_address<Address> (as _37$place<Place>  Place) address) address)
  :pattern ((compute_address<Address> (as _37$place<Place>  Place) address))
  :qid |prog.root$20$compute_address_axiom|)))
(assert (forall ((address Address)) (!
  (= (compute_address<Address> (as _34$place<Place>  Place) address) address)
  :pattern ((compute_address<Address> (as _34$place<Place>  Place) address))
  :qid |prog.root$21$compute_address_axiom|)))
(assert (forall ((address Address)) (!
  (= (compute_address<Address> (as _39$place<Place>  Place) address) address)
  :pattern ((compute_address<Address> (as _39$place<Place>  Place) address))
  :qid |prog.root$22$compute_address_axiom|)))
(assert (forall ((address Address)) (!
  (= (compute_address<Address> (as _38$place<Place>  Place) address) address)
  :pattern ((compute_address<Address> (as _38$place<Place>  Place) address))
  :qid |prog.root$23$compute_address_axiom|)))
(assert (forall ((address Address)) (!
  (= (compute_address<Address> (as _43$place<Place>  Place) address) address)
  :pattern ((compute_address<Address> (as _43$place<Place>  Place) address))
  :qid |prog.root$24$compute_address_axiom|)))
(assert (forall ((address Address)) (!
  (= (compute_address<Address> (as _44$place<Place>  Place) address) address)
  :pattern ((compute_address<Address> (as _44$place<Place>  Place) address))
  :qid |prog.root$25$compute_address_axiom|)))
(assert (forall ((address Address)) (!
  (= (compute_address<Address> (as _45$place<Place>  Place) address) address)
  :pattern ((compute_address<Address> (as _45$place<Place>  Place) address))
  :qid |prog.root$26$compute_address_axiom|)))
(assert (forall ((address Address)) (!
  (= (compute_address<Address> (as _6$place<Place>  Place) address) address)
  :pattern ((compute_address<Address> (as _6$place<Place>  Place) address))
  :qid |prog.root$27$compute_address_axiom|)))
(assert (forall ((address Address)) (!
  (= (compute_address<Address> (as _5$place<Place>  Place) address) address)
  :pattern ((compute_address<Address> (as _5$place<Place>  Place) address))
  :qid |prog.root$28$compute_address_axiom|)))
(assert (forall ((address Address)) (!
  (= (compute_address<Address> (as _50$place<Place>  Place) address) address)
  :pattern ((compute_address<Address> (as _50$place<Place>  Place) address))
  :qid |prog.root$29$compute_address_axiom|)))
(assert (forall ((address Address)) (!
  (= (compute_address<Address> (as _49$place<Place>  Place) address) address)
  :pattern ((compute_address<Address> (as _49$place<Place>  Place) address))
  :qid |prog.root$30$compute_address_axiom|)))
(assert (forall ((address Address)) (!
  (= (compute_address<Address> (as _55$place<Place>  Place) address) address)
  :pattern ((compute_address<Address> (as _55$place<Place>  Place) address))
  :qid |prog.root$31$compute_address_axiom|)))
(assert (forall ((address Address)) (!
  (= (compute_address<Address> (as _54$place<Place>  Place) address) address)
  :pattern ((compute_address<Address> (as _54$place<Place>  Place) address))
  :qid |prog.root$32$compute_address_axiom|)))
(assert (forall ((address Address)) (!
  (= (compute_address<Address> (as _0$place<Place>  Place) address) address)
  :pattern ((compute_address<Address> (as _0$place<Place>  Place) address))
  :qid |prog.root$33$compute_address_axiom|)))
(assert (valid$Snap$Tuple$$$<Bool> (as constructor$Snap$Tuple$$$$<Snap$Tuple$$$>  Snap$Tuple$$$)))
(assert (forall ((value Bool)) (!
  (=
    (destructor$Snap$Bool$$value<Bool> (constructor$Snap$Bool$<Snap$Bool> value))
    value)
  :pattern ((constructor$Snap$Bool$<Snap$Bool> value))
  :qid |prog.constructor$Snap$Bool$$bottom_up_injectivity_axiom|)))
(assert (forall ((value Snap$Bool)) (!
  (=>
    (valid$Snap$Bool<Bool> value)
    (=
      value
      (constructor$Snap$Bool$<Snap$Bool> (destructor$Snap$Bool$$value<Bool> value))))
  :pattern ((valid$Snap$Bool<Bool> value))
  :qid |prog.constructor$Snap$Bool$$top_down_injectivity_axiom|)))
(assert (forall ((value Bool)) (!
  (valid$Snap$Bool<Bool> (constructor$Snap$Bool$<Snap$Bool> value))
  :pattern ((valid$Snap$Bool<Bool> (constructor$Snap$Bool$<Snap$Bool> value)))
  :qid |prog.Snap$Bool$$validity_axiom_bottom_up_alternative|)))
(assert (forall ((left Int) (right Int)) (!
  (=>
    (and
      (valid$Snap$I64<Bool> (constructor$Snap$I64$<Snap$I64> left))
      (valid$Snap$I64<Bool> (constructor$Snap$I64$<Snap$I64> right)))
    (=
      (constructor$Snap$Bool$LtCmp_I64<Snap$Bool> (constructor$Snap$I64$<Snap$I64> left) (constructor$Snap$I64$<Snap$I64> right))
      (constructor$Snap$Bool$<Snap$Bool> (< left right))))
  :pattern ((constructor$Snap$Bool$LtCmp_I64<Snap$Bool> (constructor$Snap$I64$<Snap$I64> left) (constructor$Snap$I64$<Snap$I64> right)))
  :qid |prog.LtCmp_I64$simplification_axiom|)))
(assert (forall ((left Snap$I64) (right Snap$I64)) (!
  (=
    (destructor$Snap$Bool$$value<Bool> (constructor$Snap$Bool$LtCmp_I64<Snap$Bool> left right))
    (<
      (destructor$Snap$I64$$value<Int> left)
      (destructor$Snap$I64$$value<Int> right)))
  :pattern ((destructor$Snap$Bool$$value<Bool> (constructor$Snap$Bool$LtCmp_I64<Snap$Bool> left right)))
  :qid |prog.LtCmp_I64$eval_axiom|)))
(assert (forall ((left Int) (right Int)) (!
  (=>
    (and
      (valid$Snap$I64<Bool> (constructor$Snap$I64$<Snap$I64> left))
      (valid$Snap$I64<Bool> (constructor$Snap$I64$<Snap$I64> right)))
    (=
      (constructor$Snap$Bool$GeCmp_I64<Snap$Bool> (constructor$Snap$I64$<Snap$I64> left) (constructor$Snap$I64$<Snap$I64> right))
      (constructor$Snap$Bool$<Snap$Bool> (>= left right))))
  :pattern ((constructor$Snap$Bool$GeCmp_I64<Snap$Bool> (constructor$Snap$I64$<Snap$I64> left) (constructor$Snap$I64$<Snap$I64> right)))
  :qid |prog.GeCmp_I64$simplification_axiom|)))
(assert (forall ((left Snap$I64) (right Snap$I64)) (!
  (=
    (destructor$Snap$Bool$$value<Bool> (constructor$Snap$Bool$GeCmp_I64<Snap$Bool> left right))
    (>=
      (destructor$Snap$I64$$value<Int> left)
      (destructor$Snap$I64$$value<Int> right)))
  :pattern ((destructor$Snap$Bool$$value<Bool> (constructor$Snap$Bool$GeCmp_I64<Snap$Bool> left right)))
  :qid |prog.GeCmp_I64$eval_axiom|)))
(assert (forall ((left Int) (right Int)) (!
  (=>
    (and
      (valid$Snap$I64<Bool> (constructor$Snap$I64$<Snap$I64> left))
      (valid$Snap$I64<Bool> (constructor$Snap$I64$<Snap$I64> right)))
    (=
      (constructor$Snap$Bool$LeCmp_I64<Snap$Bool> (constructor$Snap$I64$<Snap$I64> left) (constructor$Snap$I64$<Snap$I64> right))
      (constructor$Snap$Bool$<Snap$Bool> (<= left right))))
  :pattern ((constructor$Snap$Bool$LeCmp_I64<Snap$Bool> (constructor$Snap$I64$<Snap$I64> left) (constructor$Snap$I64$<Snap$I64> right)))
  :qid |prog.LeCmp_I64$simplification_axiom|)))
(assert (forall ((left Snap$I64) (right Snap$I64)) (!
  (=
    (destructor$Snap$Bool$$value<Bool> (constructor$Snap$Bool$LeCmp_I64<Snap$Bool> left right))
    (<=
      (destructor$Snap$I64$$value<Int> left)
      (destructor$Snap$I64$$value<Int> right)))
  :pattern ((destructor$Snap$Bool$$value<Bool> (constructor$Snap$Bool$LeCmp_I64<Snap$Bool> left right)))
  :qid |prog.LeCmp_I64$eval_axiom|)))
(assert (forall ((left Int) (right Int)) (!
  (=>
    (and
      (valid$Snap$I64<Bool> (constructor$Snap$I64$<Snap$I64> left))
      (valid$Snap$I64<Bool> (constructor$Snap$I64$<Snap$I64> right)))
    (=
      (constructor$Snap$Bool$EqCmp_I64<Snap$Bool> (constructor$Snap$I64$<Snap$I64> left) (constructor$Snap$I64$<Snap$I64> right))
      (constructor$Snap$Bool$<Snap$Bool> (= left right))))
  :pattern ((constructor$Snap$Bool$EqCmp_I64<Snap$Bool> (constructor$Snap$I64$<Snap$I64> left) (constructor$Snap$I64$<Snap$I64> right)))
  :qid |prog.EqCmp_I64$simplification_axiom|)))
(assert (forall ((left Snap$I64) (right Snap$I64)) (!
  (=
    (destructor$Snap$Bool$$value<Bool> (constructor$Snap$Bool$EqCmp_I64<Snap$Bool> left right))
    (=
      (destructor$Snap$I64$$value<Int> left)
      (destructor$Snap$I64$$value<Int> right)))
  :pattern ((destructor$Snap$Bool$$value<Bool> (constructor$Snap$Bool$EqCmp_I64<Snap$Bool> left right)))
  :qid |prog.EqCmp_I64$eval_axiom|)))
(assert (forall ((left Lifetime) (right Lifetime)) (!
  (=
    (constructor$Snap$Bool$EqCmp_Lifetime<Snap$Bool> left right)
    (constructor$Snap$Bool$<Snap$Bool> (= left right)))
  :pattern ((constructor$Snap$Bool$EqCmp_Lifetime<Snap$Bool> left right))
  :qid |prog.EqCmp_Lifetime$simplification_axiom|)))
(assert (forall ((left Int) (right Int)) (!
  (=>
    (and
      (valid$Snap$Unbounded<Bool> (constructor$Snap$Unbounded$<Snap$Unbounded> left))
      (valid$Snap$Unbounded<Bool> (constructor$Snap$Unbounded$<Snap$Unbounded> right)))
    (=
      (constructor$Snap$Bool$GtCmp_Unbounded<Snap$Bool> (constructor$Snap$Unbounded$<Snap$Unbounded> left) (constructor$Snap$Unbounded$<Snap$Unbounded> right))
      (constructor$Snap$Bool$<Snap$Bool> (> left right))))
  :pattern ((constructor$Snap$Bool$GtCmp_Unbounded<Snap$Bool> (constructor$Snap$Unbounded$<Snap$Unbounded> left) (constructor$Snap$Unbounded$<Snap$Unbounded> right)))
  :qid |prog.GtCmp_Unbounded$simplification_axiom|)))
(assert (forall ((left Snap$Unbounded) (right Snap$Unbounded)) (!
  (=
    (destructor$Snap$Bool$$value<Bool> (constructor$Snap$Bool$GtCmp_Unbounded<Snap$Bool> left right))
    (>
      (destructor$Snap$Unbounded$$value<Int> left)
      (destructor$Snap$Unbounded$$value<Int> right)))
  :pattern ((destructor$Snap$Bool$$value<Bool> (constructor$Snap$Bool$GtCmp_Unbounded<Snap$Bool> left right)))
  :qid |prog.GtCmp_Unbounded$eval_axiom|)))
(assert (forall ((left Int) (right Int)) (!
  (=>
    (and
      (valid$Snap$Unbounded<Bool> (constructor$Snap$Unbounded$<Snap$Unbounded> left))
      (valid$Snap$Unbounded<Bool> (constructor$Snap$Unbounded$<Snap$Unbounded> right)))
    (=
      (constructor$Snap$Bool$EqCmp_Unbounded<Snap$Bool> (constructor$Snap$Unbounded$<Snap$Unbounded> left) (constructor$Snap$Unbounded$<Snap$Unbounded> right))
      (constructor$Snap$Bool$<Snap$Bool> (= left right))))
  :pattern ((constructor$Snap$Bool$EqCmp_Unbounded<Snap$Bool> (constructor$Snap$Unbounded$<Snap$Unbounded> left) (constructor$Snap$Unbounded$<Snap$Unbounded> right)))
  :qid |prog.EqCmp_Unbounded$simplification_axiom|)))
(assert (forall ((left Snap$Unbounded) (right Snap$Unbounded)) (!
  (=
    (destructor$Snap$Bool$$value<Bool> (constructor$Snap$Bool$EqCmp_Unbounded<Snap$Bool> left right))
    (=
      (destructor$Snap$Unbounded$$value<Int> left)
      (destructor$Snap$Unbounded$$value<Int> right)))
  :pattern ((destructor$Snap$Bool$$value<Bool> (constructor$Snap$Bool$EqCmp_Unbounded<Snap$Bool> left right)))
  :qid |prog.EqCmp_Unbounded$eval_axiom|)))
(assert (forall ((left Int) (right Int)) (!
  (=>
    (and
      (valid$Snap$Unbounded<Bool> (constructor$Snap$Unbounded$<Snap$Unbounded> left))
      (valid$Snap$Unbounded<Bool> (constructor$Snap$Unbounded$<Snap$Unbounded> right)))
    (=
      (constructor$Snap$Bool$LtCmp_Unbounded<Snap$Bool> (constructor$Snap$Unbounded$<Snap$Unbounded> left) (constructor$Snap$Unbounded$<Snap$Unbounded> right))
      (constructor$Snap$Bool$<Snap$Bool> (< left right))))
  :pattern ((constructor$Snap$Bool$LtCmp_Unbounded<Snap$Bool> (constructor$Snap$Unbounded$<Snap$Unbounded> left) (constructor$Snap$Unbounded$<Snap$Unbounded> right)))
  :qid |prog.LtCmp_Unbounded$simplification_axiom|)))
(assert (forall ((left Snap$Unbounded) (right Snap$Unbounded)) (!
  (=
    (destructor$Snap$Bool$$value<Bool> (constructor$Snap$Bool$LtCmp_Unbounded<Snap$Bool> left right))
    (<
      (destructor$Snap$Unbounded$$value<Int> left)
      (destructor$Snap$Unbounded$$value<Int> right)))
  :pattern ((destructor$Snap$Bool$$value<Bool> (constructor$Snap$Bool$LtCmp_Unbounded<Snap$Bool> left right)))
  :qid |prog.LtCmp_Unbounded$eval_axiom|)))
(assert (forall ((left Int) (right Int)) (!
  (=>
    (and
      (valid$Snap$Unbounded<Bool> (constructor$Snap$Unbounded$<Snap$Unbounded> left))
      (valid$Snap$Unbounded<Bool> (constructor$Snap$Unbounded$<Snap$Unbounded> right)))
    (=
      (constructor$Snap$Bool$GeCmp_Unbounded<Snap$Bool> (constructor$Snap$Unbounded$<Snap$Unbounded> left) (constructor$Snap$Unbounded$<Snap$Unbounded> right))
      (constructor$Snap$Bool$<Snap$Bool> (>= left right))))
  :pattern ((constructor$Snap$Bool$GeCmp_Unbounded<Snap$Bool> (constructor$Snap$Unbounded$<Snap$Unbounded> left) (constructor$Snap$Unbounded$<Snap$Unbounded> right)))
  :qid |prog.GeCmp_Unbounded$simplification_axiom|)))
(assert (forall ((left Snap$Unbounded) (right Snap$Unbounded)) (!
  (=
    (destructor$Snap$Bool$$value<Bool> (constructor$Snap$Bool$GeCmp_Unbounded<Snap$Bool> left right))
    (>=
      (destructor$Snap$Unbounded$$value<Int> left)
      (destructor$Snap$Unbounded$$value<Int> right)))
  :pattern ((destructor$Snap$Bool$$value<Bool> (constructor$Snap$Bool$GeCmp_Unbounded<Snap$Bool> left right)))
  :qid |prog.GeCmp_Unbounded$eval_axiom|)))
(assert (forall ((value Int)) (!
  (=
    (destructor$Snap$I64$$value<Int> (constructor$Snap$I64$<Snap$I64> value))
    value)
  :pattern ((constructor$Snap$I64$<Snap$I64> value))
  :qid |prog.constructor$Snap$I64$$bottom_up_injectivity_axiom|)))
(assert (forall ((value Snap$I64)) (!
  (=>
    (valid$Snap$I64<Bool> value)
    (=
      value
      (constructor$Snap$I64$<Snap$I64> (destructor$Snap$I64$$value<Int> value))))
  :pattern ((valid$Snap$I64<Bool> value))
  :qid |prog.constructor$Snap$I64$$top_down_injectivity_axiom|)))
(assert (forall ((value Int)) (!
  (valid$Snap$I64<Bool> (constructor$Snap$I64$<Snap$I64> value))
  :pattern ((valid$Snap$I64<Bool> (constructor$Snap$I64$<Snap$I64> value)))
  :qid |prog.Snap$I64$$validity_axiom_bottom_up_alternative|)))
(assert (forall ((left Int) (right Int)) (!
  (=>
    (and
      (valid$Snap$I64<Bool> (constructor$Snap$I64$<Snap$I64> left))
      (valid$Snap$I64<Bool> (constructor$Snap$I64$<Snap$I64> right)))
    (=
      (constructor$Snap$I64$Sub_I64<Snap$I64> (constructor$Snap$I64$<Snap$I64> left) (constructor$Snap$I64$<Snap$I64> right))
      (constructor$Snap$I64$<Snap$I64> (- left right))))
  :pattern ((constructor$Snap$I64$Sub_I64<Snap$I64> (constructor$Snap$I64$<Snap$I64> left) (constructor$Snap$I64$<Snap$I64> right)))
  :qid |prog.Sub_I64$simplification_axiom|)))
(assert (forall ((left Snap$I64) (right Snap$I64)) (!
  (=
    (destructor$Snap$I64$$value<Int> (constructor$Snap$I64$Sub_I64<Snap$I64> left right))
    (-
      (destructor$Snap$I64$$value<Int> left)
      (destructor$Snap$I64$$value<Int> right)))
  :pattern ((destructor$Snap$I64$$value<Int> (constructor$Snap$I64$Sub_I64<Snap$I64> left right)))
  :qid |prog.Sub_I64$eval_axiom|)))
(assert (forall ((left Int) (right Int)) (!
  (=>
    (and
      (valid$Snap$I64<Bool> (constructor$Snap$I64$<Snap$I64> left))
      (valid$Snap$I64<Bool> (constructor$Snap$I64$<Snap$I64> right)))
    (=
      (constructor$Snap$I64$Add_I64<Snap$I64> (constructor$Snap$I64$<Snap$I64> left) (constructor$Snap$I64$<Snap$I64> right))
      (constructor$Snap$I64$<Snap$I64> (+ left right))))
  :pattern ((constructor$Snap$I64$Add_I64<Snap$I64> (constructor$Snap$I64$<Snap$I64> left) (constructor$Snap$I64$<Snap$I64> right)))
  :qid |prog.Add_I64$simplification_axiom|)))
(assert (forall ((left Snap$I64) (right Snap$I64)) (!
  (=
    (destructor$Snap$I64$$value<Int> (constructor$Snap$I64$Add_I64<Snap$I64> left right))
    (+
      (destructor$Snap$I64$$value<Int> left)
      (destructor$Snap$I64$$value<Int> right)))
  :pattern ((destructor$Snap$I64$$value<Int> (constructor$Snap$I64$Add_I64<Snap$I64> left right)))
  :qid |prog.Add_I64$eval_axiom|)))
(assert (forall ((lft Lifetime)) (!
  (included<Bool> lft lft)
  :pattern ((included<Bool> lft lft))
  :qid |prog.included_in_itself$|)))
(assert (forall ((lft_1 Set<Lifetime>) (lft_2 Set<Lifetime>)) (!
  (=
    (included<Bool> (intersect<Lifetime> lft_1) (intersect<Lifetime> lft_2))
    (Set_subset lft_2 lft_1))
  :pattern ((included<Bool> (intersect<Lifetime> lft_1) (intersect<Lifetime> lft_2)))
  :qid |prog.included_intersect$1|)))
(assert (forall ((lft_1 Set<Lifetime>) (lft_2 Lifetime)) (!
  (= (included<Bool> (intersect<Lifetime> lft_1) lft_2) (Set_in lft_2 lft_1))
  :pattern ((included<Bool> (intersect<Lifetime> lft_1) lft_2))
  :qid |prog.included_intersect$2|)))
(assert (forall ((lft Lifetime)) (!
  (= (intersect<Lifetime> (Set_singleton lft)) lft)
  :pattern ((intersect<Lifetime> (Set_singleton lft)))
  :qid |prog.intersect_singleton$|)))
(assert (forall ((value Int)) (!
  (=
    (destructor$Snap$Unbounded$$value<Int> (constructor$Snap$Unbounded$<Snap$Unbounded> value))
    value)
  :pattern ((constructor$Snap$Unbounded$<Snap$Unbounded> value))
  :qid |prog.constructor$Snap$Unbounded$$bottom_up_injectivity_axiom|)))
(assert (forall ((value Snap$Unbounded)) (!
  (=>
    (valid$Snap$Unbounded<Bool> value)
    (=
      value
      (constructor$Snap$Unbounded$<Snap$Unbounded> (destructor$Snap$Unbounded$$value<Int> value))))
  :pattern ((valid$Snap$Unbounded<Bool> value))
  :qid |prog.constructor$Snap$Unbounded$$top_down_injectivity_axiom|)))
(assert (forall ((value Int)) (!
  (valid$Snap$Unbounded<Bool> (constructor$Snap$Unbounded$<Snap$Unbounded> value))
  :pattern ((valid$Snap$Unbounded<Bool> (constructor$Snap$Unbounded$<Snap$Unbounded> value)))
  :qid |prog.Snap$Unbounded$$validity_axiom_bottom_up_alternative|)))
(assert (forall ((left Int) (right Int)) (!
  (=>
    (and
      (valid$Snap$Unbounded<Bool> (constructor$Snap$Unbounded$<Snap$Unbounded> left))
      (valid$Snap$Unbounded<Bool> (constructor$Snap$Unbounded$<Snap$Unbounded> right)))
    (=
      (constructor$Snap$Unbounded$Sub_Unbounded<Snap$Unbounded> (constructor$Snap$Unbounded$<Snap$Unbounded> left) (constructor$Snap$Unbounded$<Snap$Unbounded> right))
      (constructor$Snap$Unbounded$<Snap$Unbounded> (- left right))))
  :pattern ((constructor$Snap$Unbounded$Sub_Unbounded<Snap$Unbounded> (constructor$Snap$Unbounded$<Snap$Unbounded> left) (constructor$Snap$Unbounded$<Snap$Unbounded> right)))
  :qid |prog.Sub_Unbounded$simplification_axiom|)))
(assert (forall ((left Snap$Unbounded) (right Snap$Unbounded)) (!
  (=
    (destructor$Snap$Unbounded$$value<Int> (constructor$Snap$Unbounded$Sub_Unbounded<Snap$Unbounded> left right))
    (-
      (destructor$Snap$Unbounded$$value<Int> left)
      (destructor$Snap$Unbounded$$value<Int> right)))
  :pattern ((destructor$Snap$Unbounded$$value<Int> (constructor$Snap$Unbounded$Sub_Unbounded<Snap$Unbounded> left right)))
  :qid |prog.Sub_Unbounded$eval_axiom|)))
(assert (forall ((tuple_0 Snap$I64) (tuple_1 Snap$Bool)) (!
  (and
    (=
      (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> (constructor$Snap$Tuple$$I64$Bool$$I64$Bool$$<Snap$Tuple$$I64$Bool$$I64$Bool$> tuple_0 tuple_1))
      tuple_0)
    (=
      (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> (constructor$Snap$Tuple$$I64$Bool$$I64$Bool$$<Snap$Tuple$$I64$Bool$$I64$Bool$> tuple_0 tuple_1))
      tuple_1))
  :pattern ((constructor$Snap$Tuple$$I64$Bool$$I64$Bool$$<Snap$Tuple$$I64$Bool$$I64$Bool$> tuple_0 tuple_1))
  :pattern ((constructor$Snap$Tuple$$I64$Bool$$I64$Bool$$<Snap$Tuple$$I64$Bool$$I64$Bool$> tuple_0 tuple_1))
  :qid |prog.constructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$bottom_up_injectivity_axiom|)))
(assert (forall ((value Snap$Tuple$$I64$Bool$$I64$Bool$)) (!
  (=>
    (valid$Snap$Tuple$$I64$Bool$$I64$Bool$<Bool> value)
    (=
      value
      (constructor$Snap$Tuple$$I64$Bool$$I64$Bool$$<Snap$Tuple$$I64$Bool$$I64$Bool$> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> value) (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> value))))
  :pattern ((valid$Snap$Tuple$$I64$Bool$$I64$Bool$<Bool> value) (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> value))
  :pattern ((valid$Snap$Tuple$$I64$Bool$$I64$Bool$<Bool> value) (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> value))
  :qid |prog.constructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$top_down_injectivity_axiom|)))
(assert (forall ((snapshot Snap$Tuple$$I64$Bool$$I64$Bool$)) (!
  (=
    (valid$Snap$Tuple$$I64$Bool$$I64$Bool$<Bool> snapshot)
    (and
      (valid$Snap$I64<Bool> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot))
      (valid$Snap$Bool<Bool> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot))))
  :pattern ((valid$Snap$Tuple$$I64$Bool$$I64$Bool$<Bool> snapshot) (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot))
  :pattern ((valid$Snap$Tuple$$I64$Bool$$I64$Bool$<Bool> snapshot) (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot))
  :qid |prog.Snap$Tuple$$I64$Bool$$I64$Bool$$$validity_axiom_top_down_alternative|)))
(assert (forall ((tuple_0 Snap$I64) (tuple_1 Snap$Bool)) (!
  (=
    (valid$Snap$Tuple$$I64$Bool$$I64$Bool$<Bool> (constructor$Snap$Tuple$$I64$Bool$$I64$Bool$$<Snap$Tuple$$I64$Bool$$I64$Bool$> tuple_0 tuple_1))
    (and (valid$Snap$I64<Bool> tuple_0) (valid$Snap$Bool<Bool> tuple_1)))
  :pattern ((valid$Snap$Tuple$$I64$Bool$$I64$Bool$<Bool> (constructor$Snap$Tuple$$I64$Bool$$I64$Bool$$<Snap$Tuple$$I64$Bool$$I64$Bool$> tuple_0 tuple_1)) (valid$Snap$I64<Bool> tuple_0) (valid$Snap$Bool<Bool> tuple_1))
  :qid |prog.Snap$Tuple$$I64$Bool$$I64$Bool$$$validity_axiom_bottom_up_alternative|)))
(assert (forall ((value Int)) (!
  (=
    (destructor$Snap$Usize$$value<Int> (constructor$Snap$Usize$<Snap$Usize> value))
    value)
  :pattern ((constructor$Snap$Usize$<Snap$Usize> value))
  :qid |prog.constructor$Snap$Usize$$bottom_up_injectivity_axiom|)))
(assert (forall ((value Snap$Usize)) (!
  (=>
    (valid$Snap$Usize<Bool> value)
    (=
      value
      (constructor$Snap$Usize$<Snap$Usize> (destructor$Snap$Usize$$value<Int> value))))
  :pattern ((valid$Snap$Usize<Bool> value))
  :qid |prog.constructor$Snap$Usize$$top_down_injectivity_axiom|)))
(assert (forall ((value Int)) (!
  (=
    (valid$Snap$Usize<Bool> (constructor$Snap$Usize$<Snap$Usize> value))
    (<= 0 value))
  :pattern ((valid$Snap$Usize<Bool> (constructor$Snap$Usize$<Snap$Usize> value)))
  :qid |prog.Snap$Usize$$validity_axiom_bottom_up_alternative|)))
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ------------------------------------------------------------
; Begin function- and predicate-related preamble
; Declaring symbols related to program functions (from verification)
(declare-fun $k@6@00 () $Perm)
(assert (forall ((s@$ $Snap) (address@0@00 Address) (size@1@00 Snap$Usize)) (!
  (=
    (MemoryBlock$bytes%limited s@$ address@0@00 size@1@00)
    (MemoryBlock$bytes s@$ address@0@00 size@1@00))
  :pattern ((MemoryBlock$bytes s@$ address@0@00 size@1@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (address@0@00 Address) (size@1@00 Snap$Usize)) (!
  (MemoryBlock$bytes%stateless address@0@00 size@1@00)
  :pattern ((MemoryBlock$bytes%limited s@$ address@0@00 size@1@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (_1@3@00 Snap$I64)) (!
  (= (caller_for$m_fib$%limited s@$ _1@3@00) (caller_for$m_fib$ s@$ _1@3@00))
  :pattern ((caller_for$m_fib$ s@$ _1@3@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (_1@3@00 Snap$I64)) (!
  (caller_for$m_fib$%stateless _1@3@00)
  :pattern ((caller_for$m_fib$%limited s@$ _1@3@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (_1@3@00 Snap$I64)) (!
  (let ((result@4@00 (caller_for$m_fib$%limited s@$ _1@3@00))) (=>
    (caller_for$m_fib$%precondition s@$ _1@3@00)
    (valid$Snap$I64<Bool> result@4@00)))
  :pattern ((caller_for$m_fib$%limited s@$ _1@3@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (_1@3@00 Snap$I64)) (!
  (let ((result@4@00 (caller_for$m_fib$%limited s@$ _1@3@00))) true)
  :pattern ((caller_for$m_fib$%limited s@$ _1@3@00))
  :qid |quant-u-7|)))
(assert (forall ((s@$ $Snap) (_1@3@00 Snap$I64)) (!
  (let ((result@4@00 (caller_for$m_fib$%limited s@$ _1@3@00))) true)
  :pattern ((caller_for$m_fib$%limited s@$ _1@3@00))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap) (_1@3@00 Snap$I64)) (!
  (=>
    (caller_for$m_fib$%precondition s@$ _1@3@00)
    (=
      (caller_for$m_fib$ s@$ _1@3@00)
      (m_fib$<Snap$I64> _1@3@00 (function_gas_level$<FunctionGas> (function_gas_level$<FunctionGas> (as function_no_gas$<FunctionGas>  FunctionGas))))))
  :pattern ((caller_for$m_fib$ s@$ _1@3@00))
  :qid |quant-u-9|)))
(assert (forall ((s@$ $Snap) (_1@3@00 Snap$I64)) (!
  true
  :pattern ((caller_for$m_fib$ s@$ _1@3@00))
  :qid |quant-u-10|)))
(assert (forall ((s@$ $Snap)) (!
  (=
    (caller_for$builtin$unreach$I64$%limited s@$)
    (caller_for$builtin$unreach$I64$ s@$))
  :pattern ((caller_for$builtin$unreach$I64$ s@$))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap)) (!
  (as caller_for$builtin$unreach$I64$%stateless  Bool)
  :pattern ((caller_for$builtin$unreach$I64$%limited s@$))
  :qid |quant-u-5|)))
(assert (forall ((s@$ $Snap)) (!
  (let ((result@5@00 (caller_for$builtin$unreach$I64$%limited s@$))) (=>
    (caller_for$builtin$unreach$I64$%precondition s@$)
    (valid$Snap$I64<Bool> result@5@00)))
  :pattern ((caller_for$builtin$unreach$I64$%limited s@$))
  :qid |quant-u-11|)))
(assert (forall ((s@$ $Snap)) (!
  (let ((result@5@00 (caller_for$builtin$unreach$I64$%limited s@$))) true)
  :pattern ((caller_for$builtin$unreach$I64$%limited s@$))
  :qid |quant-u-12|)))
(assert (forall ((s@$ $Snap)) (!
  (=>
    (caller_for$builtin$unreach$I64$%precondition s@$)
    (=
      (caller_for$builtin$unreach$I64$ s@$)
      (builtin$unreach$I64$<Snap$I64> (function_gas_level$<FunctionGas> (function_gas_level$<FunctionGas> (as function_no_gas$<FunctionGas>  FunctionGas))))))
  :pattern ((caller_for$builtin$unreach$I64$ s@$))
  :qid |quant-u-13|)))
(assert (forall ((s@$ $Snap)) (!
  true
  :pattern ((caller_for$builtin$unreach$I64$ s@$))
  :qid |quant-u-14|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- m_fibi$CoreProof ----------
(set-option :timeout 0)
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var _0$address: Address
(declare-const _0$address@0@01 Address)
; [exec]
; var _0$snapshot$0: Snap$I64
(declare-const _0$snapshot$0@1@01 Snap$I64)
; [exec]
; var _0$snapshot$1: Snap$I64
(declare-const _0$snapshot$1@2@01 Snap$I64)
; [exec]
; var _0$snapshot$2: Snap$I64
(declare-const _0$snapshot$2@3@01 Snap$I64)
; [exec]
; var _1$address: Address
(declare-const _1$address@4@01 Address)
; [exec]
; var _1$snapshot$0: Snap$I64
(declare-const _1$snapshot$0@5@01 Snap$I64)
; [exec]
; var _10$address: Address
(declare-const _10$address@6@01 Address)
; [exec]
; var _10$snapshot$0: Snap$Tuple$$$
(declare-const _10$snapshot$0@7@01 Snap$Tuple$$$)
; [exec]
; var _10$snapshot$1: Snap$Tuple$$$
(declare-const _10$snapshot$1@8@01 Snap$Tuple$$$)
; [exec]
; var _10$snapshot$2: Snap$Tuple$$$
(declare-const _10$snapshot$2@9@01 Snap$Tuple$$$)
; [exec]
; var _10$snapshot$3: Snap$Tuple$$$
(declare-const _10$snapshot$3@10@01 Snap$Tuple$$$)
; [exec]
; var _11$address: Address
(declare-const _11$address@11@01 Address)
; [exec]
; var _11$snapshot$0: Snap$Bool
(declare-const _11$snapshot$0@12@01 Snap$Bool)
; [exec]
; var _11$snapshot$1: Snap$Bool
(declare-const _11$snapshot$1@13@01 Snap$Bool)
; [exec]
; var _11$snapshot$2: Snap$Bool
(declare-const _11$snapshot$2@14@01 Snap$Bool)
; [exec]
; var _11$snapshot$3: Snap$Bool
(declare-const _11$snapshot$3@15@01 Snap$Bool)
; [exec]
; var _11$snapshot$4: Snap$Bool
(declare-const _11$snapshot$4@16@01 Snap$Bool)
; [exec]
; var _15$address: Address
(declare-const _15$address@17@01 Address)
; [exec]
; var _15$snapshot$0: Snap$Tuple$$$
(declare-const _15$snapshot$0@18@01 Snap$Tuple$$$)
; [exec]
; var _15$snapshot$1: Snap$Tuple$$$
(declare-const _15$snapshot$1@19@01 Snap$Tuple$$$)
; [exec]
; var _15$snapshot$2: Snap$Tuple$$$
(declare-const _15$snapshot$2@20@01 Snap$Tuple$$$)
; [exec]
; var _15$snapshot$3: Snap$Tuple$$$
(declare-const _15$snapshot$3@21@01 Snap$Tuple$$$)
; [exec]
; var _16$address: Address
(declare-const _16$address@22@01 Address)
; [exec]
; var _16$snapshot$0: Snap$Bool
(declare-const _16$snapshot$0@23@01 Snap$Bool)
; [exec]
; var _16$snapshot$1: Snap$Bool
(declare-const _16$snapshot$1@24@01 Snap$Bool)
; [exec]
; var _16$snapshot$2: Snap$Bool
(declare-const _16$snapshot$2@25@01 Snap$Bool)
; [exec]
; var _16$snapshot$3: Snap$Bool
(declare-const _16$snapshot$3@26@01 Snap$Bool)
; [exec]
; var _2$address: Address
(declare-const _2$address@27@01 Address)
; [exec]
; var _2$snapshot$0: Snap$I64
(declare-const _2$snapshot$0@28@01 Snap$I64)
; [exec]
; var _2$snapshot$1: Snap$I64
(declare-const _2$snapshot$1@29@01 Snap$I64)
; [exec]
; var _2$snapshot$2: Snap$I64
(declare-const _2$snapshot$2@30@01 Snap$I64)
; [exec]
; var _2$snapshot$3: Snap$I64
(declare-const _2$snapshot$3@31@01 Snap$I64)
; [exec]
; var _2$snapshot$4: Snap$I64
(declare-const _2$snapshot$4@32@01 Snap$I64)
; [exec]
; var _2$snapshot$5: Snap$I64
(declare-const _2$snapshot$5@33@01 Snap$I64)
; [exec]
; var _20$address: Address
(declare-const _20$address@34@01 Address)
; [exec]
; var _20$snapshot$0: Snap$Tuple$$$
(declare-const _20$snapshot$0@35@01 Snap$Tuple$$$)
; [exec]
; var _20$snapshot$1: Snap$Tuple$$$
(declare-const _20$snapshot$1@36@01 Snap$Tuple$$$)
; [exec]
; var _20$snapshot$2: Snap$Tuple$$$
(declare-const _20$snapshot$2@37@01 Snap$Tuple$$$)
; [exec]
; var _20$snapshot$3: Snap$Tuple$$$
(declare-const _20$snapshot$3@38@01 Snap$Tuple$$$)
; [exec]
; var _21$address: Address
(declare-const _21$address@39@01 Address)
; [exec]
; var _21$snapshot$0: Snap$Bool
(declare-const _21$snapshot$0@40@01 Snap$Bool)
; [exec]
; var _21$snapshot$1: Snap$Bool
(declare-const _21$snapshot$1@41@01 Snap$Bool)
; [exec]
; var _21$snapshot$2: Snap$Bool
(declare-const _21$snapshot$2@42@01 Snap$Bool)
; [exec]
; var _21$snapshot$3: Snap$Bool
(declare-const _21$snapshot$3@43@01 Snap$Bool)
; [exec]
; var _24$address: Address
(declare-const _24$address@44@01 Address)
; [exec]
; var _24$snapshot$0: Snap$Tuple$$$
(declare-const _24$snapshot$0@45@01 Snap$Tuple$$$)
; [exec]
; var _24$snapshot$1: Snap$Tuple$$$
(declare-const _24$snapshot$1@46@01 Snap$Tuple$$$)
; [exec]
; var _24$snapshot$2: Snap$Tuple$$$
(declare-const _24$snapshot$2@47@01 Snap$Tuple$$$)
; [exec]
; var _24$snapshot$3: Snap$Tuple$$$
(declare-const _24$snapshot$3@48@01 Snap$Tuple$$$)
; [exec]
; var _25$address: Address
(declare-const _25$address@49@01 Address)
; [exec]
; var _25$snapshot$0: Snap$Bool
(declare-const _25$snapshot$0@50@01 Snap$Bool)
; [exec]
; var _25$snapshot$1: Snap$Bool
(declare-const _25$snapshot$1@51@01 Snap$Bool)
; [exec]
; var _25$snapshot$2: Snap$Bool
(declare-const _25$snapshot$2@52@01 Snap$Bool)
; [exec]
; var _25$snapshot$3: Snap$Bool
(declare-const _25$snapshot$3@53@01 Snap$Bool)
; [exec]
; var _29$address: Address
(declare-const _29$address@54@01 Address)
; [exec]
; var _29$snapshot$0: Snap$Tuple$$$
(declare-const _29$snapshot$0@55@01 Snap$Tuple$$$)
; [exec]
; var _29$snapshot$1: Snap$Tuple$$$
(declare-const _29$snapshot$1@56@01 Snap$Tuple$$$)
; [exec]
; var _29$snapshot$2: Snap$Tuple$$$
(declare-const _29$snapshot$2@57@01 Snap$Tuple$$$)
; [exec]
; var _29$snapshot$3: Snap$Tuple$$$
(declare-const _29$snapshot$3@58@01 Snap$Tuple$$$)
; [exec]
; var _3$address: Address
(declare-const _3$address@59@01 Address)
; [exec]
; var _3$snapshot$0: Snap$I64
(declare-const _3$snapshot$0@60@01 Snap$I64)
; [exec]
; var _3$snapshot$1: Snap$I64
(declare-const _3$snapshot$1@61@01 Snap$I64)
; [exec]
; var _3$snapshot$2: Snap$I64
(declare-const _3$snapshot$2@62@01 Snap$I64)
; [exec]
; var _3$snapshot$3: Snap$I64
(declare-const _3$snapshot$3@63@01 Snap$I64)
; [exec]
; var _3$snapshot$4: Snap$I64
(declare-const _3$snapshot$4@64@01 Snap$I64)
; [exec]
; var _3$snapshot$5: Snap$I64
(declare-const _3$snapshot$5@65@01 Snap$I64)
; [exec]
; var _3$snapshot$6: Snap$I64
(declare-const _3$snapshot$6@66@01 Snap$I64)
; [exec]
; var _30$address: Address
(declare-const _30$address@67@01 Address)
; [exec]
; var _30$snapshot$0: Snap$Bool
(declare-const _30$snapshot$0@68@01 Snap$Bool)
; [exec]
; var _30$snapshot$1: Snap$Bool
(declare-const _30$snapshot$1@69@01 Snap$Bool)
; [exec]
; var _30$snapshot$2: Snap$Bool
(declare-const _30$snapshot$2@70@01 Snap$Bool)
; [exec]
; var _30$snapshot$3: Snap$Bool
(declare-const _30$snapshot$3@71@01 Snap$Bool)
; [exec]
; var _34$address: Address
(declare-const _34$address@72@01 Address)
; [exec]
; var _34$snapshot$0: Snap$I64
(declare-const _34$snapshot$0@73@01 Snap$I64)
; [exec]
; var _34$snapshot$1: Snap$I64
(declare-const _34$snapshot$1@74@01 Snap$I64)
; [exec]
; var _34$snapshot$2: Snap$I64
(declare-const _34$snapshot$2@75@01 Snap$I64)
; [exec]
; var _34$snapshot$3: Snap$I64
(declare-const _34$snapshot$3@76@01 Snap$I64)
; [exec]
; var _34$snapshot$4: Snap$I64
(declare-const _34$snapshot$4@77@01 Snap$I64)
; [exec]
; var _35$address: Address
(declare-const _35$address@78@01 Address)
; [exec]
; var _35$snapshot$0: Snap$I64
(declare-const _35$snapshot$0@79@01 Snap$I64)
; [exec]
; var _35$snapshot$1: Snap$I64
(declare-const _35$snapshot$1@80@01 Snap$I64)
; [exec]
; var _35$snapshot$2: Snap$I64
(declare-const _35$snapshot$2@81@01 Snap$I64)
; [exec]
; var _35$snapshot$3: Snap$I64
(declare-const _35$snapshot$3@82@01 Snap$I64)
; [exec]
; var _36$address: Address
(declare-const _36$address@83@01 Address)
; [exec]
; var _36$snapshot$0: Snap$I64
(declare-const _36$snapshot$0@84@01 Snap$I64)
; [exec]
; var _36$snapshot$1: Snap$I64
(declare-const _36$snapshot$1@85@01 Snap$I64)
; [exec]
; var _36$snapshot$2: Snap$I64
(declare-const _36$snapshot$2@86@01 Snap$I64)
; [exec]
; var _36$snapshot$3: Snap$I64
(declare-const _36$snapshot$3@87@01 Snap$I64)
; [exec]
; var _37$address: Address
(declare-const _37$address@88@01 Address)
; [exec]
; var _37$snapshot$0: Snap$Tuple$$I64$Bool$$I64$Bool$
(declare-const _37$snapshot$0@89@01 Snap$Tuple$$I64$Bool$$I64$Bool$)
; [exec]
; var _37$snapshot$1: Snap$Tuple$$I64$Bool$$I64$Bool$
(declare-const _37$snapshot$1@90@01 Snap$Tuple$$I64$Bool$$I64$Bool$)
; [exec]
; var _37$snapshot$2: Snap$Tuple$$I64$Bool$$I64$Bool$
(declare-const _37$snapshot$2@91@01 Snap$Tuple$$I64$Bool$$I64$Bool$)
; [exec]
; var _37$snapshot$3: Snap$Tuple$$I64$Bool$$I64$Bool$
(declare-const _37$snapshot$3@92@01 Snap$Tuple$$I64$Bool$$I64$Bool$)
; [exec]
; var _38$address: Address
(declare-const _38$address@93@01 Address)
; [exec]
; var _38$snapshot$0: Snap$Tuple$$$
(declare-const _38$snapshot$0@94@01 Snap$Tuple$$$)
; [exec]
; var _38$snapshot$1: Snap$Tuple$$$
(declare-const _38$snapshot$1@95@01 Snap$Tuple$$$)
; [exec]
; var _38$snapshot$2: Snap$Tuple$$$
(declare-const _38$snapshot$2@96@01 Snap$Tuple$$$)
; [exec]
; var _38$snapshot$3: Snap$Tuple$$$
(declare-const _38$snapshot$3@97@01 Snap$Tuple$$$)
; [exec]
; var _38$snapshot$4: Snap$Tuple$$$
(declare-const _38$snapshot$4@98@01 Snap$Tuple$$$)
; [exec]
; var _39$address: Address
(declare-const _39$address@99@01 Address)
; [exec]
; var _39$snapshot$0: Snap$Bool
(declare-const _39$snapshot$0@100@01 Snap$Bool)
; [exec]
; var _39$snapshot$1: Snap$Bool
(declare-const _39$snapshot$1@101@01 Snap$Bool)
; [exec]
; var _39$snapshot$2: Snap$Bool
(declare-const _39$snapshot$2@102@01 Snap$Bool)
; [exec]
; var _39$snapshot$3: Snap$Bool
(declare-const _39$snapshot$3@103@01 Snap$Bool)
; [exec]
; var _39$snapshot$4: Snap$Bool
(declare-const _39$snapshot$4@104@01 Snap$Bool)
; [exec]
; var _4$address: Address
(declare-const _4$address@105@01 Address)
; [exec]
; var _4$snapshot$0: Snap$I64
(declare-const _4$snapshot$0@106@01 Snap$I64)
; [exec]
; var _4$snapshot$1: Snap$I64
(declare-const _4$snapshot$1@107@01 Snap$I64)
; [exec]
; var _4$snapshot$2: Snap$I64
(declare-const _4$snapshot$2@108@01 Snap$I64)
; [exec]
; var _4$snapshot$3: Snap$I64
(declare-const _4$snapshot$3@109@01 Snap$I64)
; [exec]
; var _4$snapshot$4: Snap$I64
(declare-const _4$snapshot$4@110@01 Snap$I64)
; [exec]
; var _4$snapshot$5: Snap$I64
(declare-const _4$snapshot$5@111@01 Snap$I64)
; [exec]
; var _4$snapshot$6: Snap$I64
(declare-const _4$snapshot$6@112@01 Snap$I64)
; [exec]
; var _43$address: Address
(declare-const _43$address@113@01 Address)
; [exec]
; var _43$snapshot$0: Snap$I64
(declare-const _43$snapshot$0@114@01 Snap$I64)
; [exec]
; var _43$snapshot$1: Snap$I64
(declare-const _43$snapshot$1@115@01 Snap$I64)
; [exec]
; var _43$snapshot$2: Snap$I64
(declare-const _43$snapshot$2@116@01 Snap$I64)
; [exec]
; var _43$snapshot$3: Snap$I64
(declare-const _43$snapshot$3@117@01 Snap$I64)
; [exec]
; var _43$snapshot$4: Snap$I64
(declare-const _43$snapshot$4@118@01 Snap$I64)
; [exec]
; var _44$address: Address
(declare-const _44$address@119@01 Address)
; [exec]
; var _44$snapshot$0: Snap$I64
(declare-const _44$snapshot$0@120@01 Snap$I64)
; [exec]
; var _44$snapshot$1: Snap$I64
(declare-const _44$snapshot$1@121@01 Snap$I64)
; [exec]
; var _44$snapshot$2: Snap$I64
(declare-const _44$snapshot$2@122@01 Snap$I64)
; [exec]
; var _44$snapshot$3: Snap$I64
(declare-const _44$snapshot$3@123@01 Snap$I64)
; [exec]
; var _44$snapshot$4: Snap$I64
(declare-const _44$snapshot$4@124@01 Snap$I64)
; [exec]
; var _45$address: Address
(declare-const _45$address@125@01 Address)
; [exec]
; var _45$snapshot$0: Snap$Tuple$$I64$Bool$$I64$Bool$
(declare-const _45$snapshot$0@126@01 Snap$Tuple$$I64$Bool$$I64$Bool$)
; [exec]
; var _45$snapshot$1: Snap$Tuple$$I64$Bool$$I64$Bool$
(declare-const _45$snapshot$1@127@01 Snap$Tuple$$I64$Bool$$I64$Bool$)
; [exec]
; var _45$snapshot$2: Snap$Tuple$$I64$Bool$$I64$Bool$
(declare-const _45$snapshot$2@128@01 Snap$Tuple$$I64$Bool$$I64$Bool$)
; [exec]
; var _45$snapshot$3: Snap$Tuple$$I64$Bool$$I64$Bool$
(declare-const _45$snapshot$3@129@01 Snap$Tuple$$I64$Bool$$I64$Bool$)
; [exec]
; var _45$snapshot$4: Snap$Tuple$$I64$Bool$$I64$Bool$
(declare-const _45$snapshot$4@130@01 Snap$Tuple$$I64$Bool$$I64$Bool$)
; [exec]
; var _47$address: Address
(declare-const _47$address@131@01 Address)
; [exec]
; var _49$address: Address
(declare-const _49$address@132@01 Address)
; [exec]
; var _49$snapshot$0: Snap$Tuple$$$
(declare-const _49$snapshot$0@133@01 Snap$Tuple$$$)
; [exec]
; var _49$snapshot$1: Snap$Tuple$$$
(declare-const _49$snapshot$1@134@01 Snap$Tuple$$$)
; [exec]
; var _49$snapshot$2: Snap$Tuple$$$
(declare-const _49$snapshot$2@135@01 Snap$Tuple$$$)
; [exec]
; var _5$address: Address
(declare-const _5$address@136@01 Address)
; [exec]
; var _5$snapshot$0: Snap$Tuple$$$
(declare-const _5$snapshot$0@137@01 Snap$Tuple$$$)
; [exec]
; var _5$snapshot$1: Snap$Tuple$$$
(declare-const _5$snapshot$1@138@01 Snap$Tuple$$$)
; [exec]
; var _5$snapshot$2: Snap$Tuple$$$
(declare-const _5$snapshot$2@139@01 Snap$Tuple$$$)
; [exec]
; var _50$address: Address
(declare-const _50$address@140@01 Address)
; [exec]
; var _50$snapshot$0: Snap$Bool
(declare-const _50$snapshot$0@141@01 Snap$Bool)
; [exec]
; var _50$snapshot$1: Snap$Bool
(declare-const _50$snapshot$1@142@01 Snap$Bool)
; [exec]
; var _50$snapshot$2: Snap$Bool
(declare-const _50$snapshot$2@143@01 Snap$Bool)
; [exec]
; var _54$address: Address
(declare-const _54$address@144@01 Address)
; [exec]
; var _54$snapshot$0: Snap$Tuple$$$
(declare-const _54$snapshot$0@145@01 Snap$Tuple$$$)
; [exec]
; var _54$snapshot$1: Snap$Tuple$$$
(declare-const _54$snapshot$1@146@01 Snap$Tuple$$$)
; [exec]
; var _54$snapshot$2: Snap$Tuple$$$
(declare-const _54$snapshot$2@147@01 Snap$Tuple$$$)
; [exec]
; var _55$address: Address
(declare-const _55$address@148@01 Address)
; [exec]
; var _55$snapshot$0: Snap$Bool
(declare-const _55$snapshot$0@149@01 Snap$Bool)
; [exec]
; var _55$snapshot$1: Snap$Bool
(declare-const _55$snapshot$1@150@01 Snap$Bool)
; [exec]
; var _55$snapshot$2: Snap$Bool
(declare-const _55$snapshot$2@151@01 Snap$Bool)
; [exec]
; var _6$address: Address
(declare-const _6$address@152@01 Address)
; [exec]
; var _6$snapshot$0: Snap$Tuple$$$
(declare-const _6$snapshot$0@153@01 Snap$Tuple$$$)
; [exec]
; var _6$snapshot$1: Snap$Tuple$$$
(declare-const _6$snapshot$1@154@01 Snap$Tuple$$$)
; [exec]
; var _6$snapshot$2: Snap$Tuple$$$
(declare-const _6$snapshot$2@155@01 Snap$Tuple$$$)
; [exec]
; var _6$snapshot$3: Snap$Tuple$$$
(declare-const _6$snapshot$3@156@01 Snap$Tuple$$$)
; [exec]
; var _7$address: Address
(declare-const _7$address@157@01 Address)
; [exec]
; var _7$snapshot$0: Snap$Bool
(declare-const _7$snapshot$0@158@01 Snap$Bool)
; [exec]
; var _7$snapshot$1: Snap$Bool
(declare-const _7$snapshot$1@159@01 Snap$Bool)
; [exec]
; var _7$snapshot$2: Snap$Bool
(declare-const _7$snapshot$2@160@01 Snap$Bool)
; [exec]
; var _7$snapshot$3: Snap$Bool
(declare-const _7$snapshot$3@161@01 Snap$Bool)
; [exec]
; var _7$snapshot$4: Snap$Bool
(declare-const _7$snapshot$4@162@01 Snap$Bool)
; [exec]
; var _8$address: Address
(declare-const _8$address@163@01 Address)
; [exec]
; var _8$snapshot$0: Snap$I64
(declare-const _8$snapshot$0@164@01 Snap$I64)
; [exec]
; var _8$snapshot$1: Snap$I64
(declare-const _8$snapshot$1@165@01 Snap$I64)
; [exec]
; var _8$snapshot$2: Snap$I64
(declare-const _8$snapshot$2@166@01 Snap$I64)
; [exec]
; var _8$snapshot$3: Snap$I64
(declare-const _8$snapshot$3@167@01 Snap$I64)
; [exec]
; var _8$snapshot$4: Snap$I64
(declare-const _8$snapshot$4@168@01 Snap$I64)
; [exec]
; var _9$address: Address
(declare-const _9$address@169@01 Address)
; [exec]
; var _9$snapshot$0: Snap$I64
(declare-const _9$snapshot$0@170@01 Snap$I64)
; [exec]
; var _9$snapshot$1: Snap$I64
(declare-const _9$snapshot$1@171@01 Snap$I64)
; [exec]
; var _9$snapshot$2: Snap$I64
(declare-const _9$snapshot$2@172@01 Snap$I64)
; [exec]
; var _9$snapshot$3: Snap$I64
(declare-const _9$snapshot$3@173@01 Snap$I64)
; [exec]
; var _9$snapshot$4: Snap$I64
(declare-const _9$snapshot$4@174@01 Snap$I64)
; [exec]
; var bw15$snapshot$0: Lifetime
(declare-const bw15$snapshot$0@175@01 Lifetime)
; [exec]
; var bw16$snapshot$0: Lifetime
(declare-const bw16$snapshot$0@176@01 Lifetime)
; [exec]
; var end_label$marker: Bool
(declare-const end_label$marker@177@01 Bool)
; [exec]
; var label_2_custom$marker: Bool
(declare-const label_2_custom$marker@178@01 Bool)
; [exec]
; var label_3_custom$marker: Bool
(declare-const label_3_custom$marker@179@01 Bool)
; [exec]
; var label_bb0$marker: Bool
(declare-const label_bb0$marker@180@01 Bool)
; [exec]
; var label_bb1$marker: Bool
(declare-const label_bb1$marker@181@01 Bool)
; [exec]
; var label_bb11$marker: Bool
(declare-const label_bb11$marker@182@01 Bool)
; [exec]
; var label_bb12$marker: Bool
(declare-const label_bb12$marker@183@01 Bool)
; [exec]
; var label_bb14$marker: Bool
(declare-const label_bb14$marker@184@01 Bool)
; [exec]
; var label_bb15$marker: Bool
(declare-const label_bb15$marker@185@01 Bool)
; [exec]
; var label_bb17$marker: Bool
(declare-const label_bb17$marker@186@01 Bool)
; [exec]
; var label_bb18$marker: Bool
(declare-const label_bb18$marker@187@01 Bool)
; [exec]
; var label_bb19$marker: Bool
(declare-const label_bb19$marker@188@01 Bool)
; [exec]
; var label_bb2$marker: Bool
(declare-const label_bb2$marker@189@01 Bool)
; [exec]
; var label_bb21$marker: Bool
(declare-const label_bb21$marker@190@01 Bool)
; [exec]
; var label_bb22$marker: Bool
(declare-const label_bb22$marker@191@01 Bool)
; [exec]
; var label_bb23$marker: Bool
(declare-const label_bb23$marker@192@01 Bool)
; [exec]
; var label_bb24$marker: Bool
(declare-const label_bb24$marker@193@01 Bool)
; [exec]
; var label_bb26$marker: Bool
(declare-const label_bb26$marker@194@01 Bool)
; [exec]
; var label_bb27$marker: Bool
(declare-const label_bb27$marker@195@01 Bool)
; [exec]
; var label_bb29$marker: Bool
(declare-const label_bb29$marker@196@01 Bool)
; [exec]
; var label_bb3$marker: Bool
(declare-const label_bb3$marker@197@01 Bool)
; [exec]
; var label_bb30$marker: Bool
(declare-const label_bb30$marker@198@01 Bool)
; [exec]
; var label_bb31$marker: Bool
(declare-const label_bb31$marker@199@01 Bool)
; [exec]
; var label_bb5$marker: Bool
(declare-const label_bb5$marker@200@01 Bool)
; [exec]
; var label_bb6$marker: Bool
(declare-const label_bb6$marker@201@01 Bool)
; [exec]
; var label_bb8$marker: Bool
(declare-const label_bb8$marker@202@01 Bool)
; [exec]
; var label_bb9$marker: Bool
(declare-const label_bb9$marker@203@01 Bool)
; [exec]
; var label_entry$marker: Bool
(declare-const label_entry$marker@204@01 Bool)
; [exec]
; var lft_0$snapshot$1: Lifetime
(declare-const lft_0$snapshot$1@205@01 Lifetime)
; [exec]
; var lft_1$snapshot$1: Lifetime
(declare-const lft_1$snapshot$1@206@01 Lifetime)
; [exec]
; var lifetime_token_perm_amount$0$snapshot$0: Perm
(declare-const lifetime_token_perm_amount$0$snapshot$0@207@01 $Perm)
; [exec]
; var loop__label_bb1__label_3_custom$marker: Bool
(declare-const loop__label_bb1__label_3_custom$marker@208@01 Bool)
; [exec]
; var loop__label_bb1__label_bb1$marker: Bool
(declare-const loop__label_bb1__label_bb1$marker@209@01 Bool)
; [exec]
; var loop__label_bb1__label_bb2$marker: Bool
(declare-const loop__label_bb1__label_bb2$marker@210@01 Bool)
; [exec]
; var loop__label_bb1__label_bb3$marker: Bool
(declare-const loop__label_bb1__label_bb3$marker@211@01 Bool)
; [exec]
; var loop_variant$1$snapshot$0: Snap$Unbounded
(declare-const loop_variant$1$snapshot$0@212@01 Snap$Unbounded)
; [exec]
; var loop_variant$1$snapshot$1: Snap$Unbounded
(declare-const loop_variant$1$snapshot$1@213@01 Snap$Unbounded)
; [exec]
; var loop_variant$1$snapshot$2: Snap$Unbounded
(declare-const loop_variant$1$snapshot$2@214@01 Snap$Unbounded)
; [exec]
; var loop_variant$1$snapshot$3: Snap$Unbounded
(declare-const loop_variant$1$snapshot$3@215@01 Snap$Unbounded)
; [exec]
; var loop_variant$1$snapshot$4: Snap$Unbounded
(declare-const loop_variant$1$snapshot$4@216@01 Snap$Unbounded)
; [exec]
; var magic_label$marker: Bool
(declare-const magic_label$marker@217@01 Bool)
; [exec]
; var resume_panic_label$marker: Bool
(declare-const resume_panic_label$marker@218@01 Bool)
; [exec]
; var return_label$marker: Bool
(declare-const return_label$marker@219@01 Bool)
; [exec]
; var start_label$marker: Bool
(declare-const start_label$marker@220@01 Bool)
; [exec]
; var tmp$0: Snap$Bool
(declare-const tmp$0@221@01 Snap$Bool)
; [exec]
; var tmp$1: Snap$I64
(declare-const tmp$1@222@01 Snap$I64)
; [exec]
; var tmp$2: Snap$I64
(declare-const tmp$2@223@01 Snap$I64)
; [exec]
; var tmp$3: Snap$I64
(declare-const tmp$3@224@01 Snap$I64)
; [exec]
; var tmp$4: Snap$Unbounded
(declare-const tmp$4@225@01 Snap$Unbounded)
; [exec]
; var tmp$5: Snap$Tuple$$I64$Bool$$I64$Bool$
(declare-const tmp$5@226@01 Snap$Tuple$$I64$Bool$$I64$Bool$)
; [exec]
; var tmp$6: Snap$Tuple$$I64$Bool$$I64$Bool$
(declare-const tmp$6@227@01 Snap$Tuple$$I64$Bool$$I64$Bool$)
; [exec]
; var tmp$7: Snap$Bool
(declare-const tmp$7@228@01 Snap$Bool)
; [exec]
; label start_label
; [exec]
; start_label$marker := false
; [exec]
; label_entry$marker := false
; [exec]
; label_bb0$marker := false
; [exec]
; label_bb1$marker := false
; [exec]
; label_bb2$marker := false
; [exec]
; label_3_custom$marker := false
; [exec]
; label_bb3$marker := false
; [exec]
; label_bb5$marker := false
; [exec]
; label_bb6$marker := false
; [exec]
; label_bb8$marker := false
; [exec]
; label_bb9$marker := false
; [exec]
; label_bb11$marker := false
; [exec]
; label_bb12$marker := false
; [exec]
; label_bb14$marker := false
; [exec]
; label_bb15$marker := false
; [exec]
; label_bb17$marker := false
; [exec]
; label_bb18$marker := false
; [exec]
; label_bb19$marker := false
; [exec]
; label_bb21$marker := false
; [exec]
; label_bb22$marker := false
; [exec]
; label_bb31$marker := false
; [exec]
; resume_panic_label$marker := false
; [exec]
; label_bb23$marker := false
; [exec]
; loop__label_bb1__label_bb1$marker := false
; [exec]
; loop__label_bb1__label_bb2$marker := false
; [exec]
; loop__label_bb1__label_3_custom$marker := false
; [exec]
; loop__label_bb1__label_bb3$marker := false
; [exec]
; magic_label$marker := false
; [exec]
; label_2_custom$marker := false
; [exec]
; label_bb24$marker := false
; [exec]
; label_bb26$marker := false
; [exec]
; label_bb27$marker := false
; [exec]
; label_bb29$marker := false
; [exec]
; label_bb30$marker := false
; [exec]
; return_label$marker := false
; [exec]
; end_label$marker := false
; [exec]
; start_label$marker := true
; [exec]
; inhale basic_block_marker$start_label$marker()
(declare-const $t@229@01 $Snap)
(assert (= $t@229@01 $Snap.unit))
; [eval] basic_block_marker$start_label$marker()
(assert (as basic_block_marker$start_label$marker<Bool>  Bool))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale lifetime_token_perm_amount$0$snapshot$0 > none
(declare-const $t@230@01 $Snap)
(assert (= $t@230@01 $Snap.unit))
; [eval] lifetime_token_perm_amount$0$snapshot$0 > none
(assert (> lifetime_token_perm_amount$0$snapshot$0@207@01 $Perm.No))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale lifetime_token_perm_amount$0$snapshot$0 < write
(declare-const $t@231@01 $Snap)
(assert (= $t@231@01 $Snap.unit))
; [eval] lifetime_token_perm_amount$0$snapshot$0 < write
(assert (< lifetime_token_perm_amount$0$snapshot$0@207@01 $Perm.Write))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale acc(LifetimeToken(bw15$snapshot$0), lifetime_token_perm_amount$0$snapshot$0)
(set-option :timeout 0)
(push) ; 3
(assert (not (or
  (= lifetime_token_perm_amount$0$snapshot$0@207@01 $Perm.No)
  (< $Perm.No lifetime_token_perm_amount$0$snapshot$0@207@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(declare-const $t@232@01 $Snap)
(assert (<= $Perm.No lifetime_token_perm_amount$0$snapshot$0@207@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(LifetimeToken(bw16$snapshot$0), lifetime_token_perm_amount$0$snapshot$0)
(set-option :timeout 0)
(push) ; 3
(assert (not (or
  (= lifetime_token_perm_amount$0$snapshot$0@207@01 $Perm.No)
  (< $Perm.No lifetime_token_perm_amount$0$snapshot$0@207@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(declare-const $t@233@01 $Snap)
(push) ; 3
(set-option :timeout 10)
(assert (not (= bw15$snapshot$0@175@01 bw16$snapshot$0@176@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; lft_0$snapshot$1 := bw15$snapshot$0
; [exec]
; lft_1$snapshot$1 := lft_tok_sep_take$2(bw15$snapshot$0, bw16$snapshot$0, lifetime_token_perm_amount$0$snapshot$0 /
;   81)
; [eval] lifetime_token_perm_amount$0$snapshot$0 / 81
; [eval] none < rd_perm
(set-option :timeout 0)
(push) ; 3
(assert (not (< $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@207@01 (to_real 81)))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (< $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@207@01 (to_real 81))))
(push) ; 3
(assert (not (or
  (= (/ lifetime_token_perm_amount$0$snapshot$0@207@01 (to_real 81)) $Perm.No)
  (< $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@207@01 (to_real 81))))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  (-
    lifetime_token_perm_amount$0$snapshot$0@207@01
    ($Perm.min
      lifetime_token_perm_amount$0$snapshot$0@207@01
      (/ lifetime_token_perm_amount$0$snapshot$0@207@01 (to_real 81))))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (<=
  $Perm.No
  (-
    lifetime_token_perm_amount$0$snapshot$0@207@01
    ($Perm.min
      lifetime_token_perm_amount$0$snapshot$0@207@01
      (/ lifetime_token_perm_amount$0$snapshot$0@207@01 (to_real 81))))))
(set-option :timeout 0)
(push) ; 3
(assert (not (or
  (=
    (-
      (/ lifetime_token_perm_amount$0$snapshot$0@207@01 (to_real 81))
      ($Perm.min
        lifetime_token_perm_amount$0$snapshot$0@207@01
        (/ lifetime_token_perm_amount$0$snapshot$0@207@01 (to_real 81))))
    $Perm.No)
  (<
    (-
      (/ lifetime_token_perm_amount$0$snapshot$0@207@01 (to_real 81))
      ($Perm.min
        lifetime_token_perm_amount$0$snapshot$0@207@01
        (/ lifetime_token_perm_amount$0$snapshot$0@207@01 (to_real 81))))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@207@01 (to_real 81)))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(assert (not (or
  (= (/ lifetime_token_perm_amount$0$snapshot$0@207@01 (to_real 81)) $Perm.No)
  (< $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@207@01 (to_real 81))))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  (-
    lifetime_token_perm_amount$0$snapshot$0@207@01
    ($Perm.min
      lifetime_token_perm_amount$0$snapshot$0@207@01
      (/ lifetime_token_perm_amount$0$snapshot$0@207@01 (to_real 81))))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(assert (not (or
  (=
    (-
      (/ lifetime_token_perm_amount$0$snapshot$0@207@01 (to_real 81))
      ($Perm.min
        lifetime_token_perm_amount$0$snapshot$0@207@01
        (/ lifetime_token_perm_amount$0$snapshot$0@207@01 (to_real 81))))
    $Perm.No)
  (<
    (-
      (/ lifetime_token_perm_amount$0$snapshot$0@207@01 (to_real 81))
      ($Perm.min
        lifetime_token_perm_amount$0$snapshot$0@207@01
        (/ lifetime_token_perm_amount$0$snapshot$0@207@01 (to_real 81))))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@207@01 (to_real 81)))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(declare-const lft@234@01 Lifetime)
(declare-const $t@235@01 $Snap)
(assert (= $t@235@01 ($Snap.combine ($Snap.first $t@235@01) ($Snap.second $t@235@01))))
(set-option :timeout 0)
(push) ; 3
(assert (not (or
  (= (/ lifetime_token_perm_amount$0$snapshot$0@207@01 (to_real 81)) $Perm.No)
  (< $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@207@01 (to_real 81))))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(push) ; 3
(set-option :timeout 10)
(assert (not (= bw16$snapshot$0@176@01 lft@234@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= bw15$snapshot$0@175@01 lft@234@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (<= $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@207@01 (to_real 81))))
(assert (= ($Snap.second $t@235@01) $Snap.unit))
; [eval] lft == intersect(Set(lft_1, lft_2))
; [eval] intersect(Set(lft_1, lft_2))
; [eval] Set(lft_1, lft_2)
(assert (=
  lft@234@01
  (intersect<Lifetime> (Set_unionone (Set_singleton bw15$snapshot$0@175@01) bw16$snapshot$0@176@01))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(OwnedNonAliased$I64(_1$place(), _1$address, _1$snapshot$0), write) &&
;   valid$Snap$I64(_1$snapshot$0)
(declare-const $t@236@01 $Snap)
(assert (= $t@236@01 ($Snap.combine ($Snap.first $t@236@01) ($Snap.second $t@236@01))))
; [eval] _1$place()
(assert (= ($Snap.second $t@236@01) $Snap.unit))
; [eval] valid$Snap$I64(_1$snapshot$0)
(assert (valid$Snap$I64<Bool> _1$snapshot$0@5@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlock(_0$address, Size$I64$()), write)
; [eval] Size$I64$()
(declare-const $t@237@01 $Snap)
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlock(_6$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
(declare-const $t@238@01 $Snap)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (= _0$address@0@01 _6$address@152@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlock(_37$address, Size$Tuple$$I64$Bool$$I64$Bool$$()), write)
; [eval] Size$Tuple$$I64$Bool$$I64$Bool$$()
(declare-const $t@239@01 $Snap)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (= _0$address@0@01 _37$address@88@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (= _6$address@152@01 _37$address@88@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlock(_45$address, Size$Tuple$$I64$Bool$$I64$Bool$$()), write)
; [eval] Size$Tuple$$I64$Bool$$I64$Bool$$()
(declare-const $t@240@01 $Snap)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (= _6$address@152@01 _45$address@125@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (= _0$address@0@01 _45$address@125@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= _37$address@88@01 _45$address@125@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; label label_entry
; [exec]
; label_entry$marker := true
; [exec]
; inhale basic_block_marker$label_entry$marker()
(declare-const $t@241@01 $Snap)
(assert (= $t@241@01 $Snap.unit))
; [eval] basic_block_marker$label_entry$marker()
(assert (as basic_block_marker$label_entry$marker<Bool>  Bool))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; label label_bb0
; [exec]
; label_bb0$marker := true
; [exec]
; inhale basic_block_marker$label_bb0$marker()
(declare-const $t@242@01 $Snap)
(assert (= $t@242@01 $Snap.unit))
; [eval] basic_block_marker$label_bb0$marker()
(assert (as basic_block_marker$label_bb0$marker<Bool>  Bool))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlock(_2$address, Size$I64$()), write)
; [eval] Size$I64$()
(declare-const $t@243@01 $Snap)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (= _37$address@88@01 _2$address@27@01)
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= _0$address@0@01 _2$address@27@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (= _6$address@152@01 _2$address@27@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (= _45$address@125@01 _2$address@27@01)
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlockStackDrop(_2$address, Size$I64$()), write)
; [eval] Size$I64$()
(declare-const $t@244@01 $Snap)
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; write_place_constant$I64(_2$place(), _2$address, constructor$Snap$I64$(0))
; [eval] _2$place()
; [eval] constructor$Snap$I64$(0)
; [eval] compute_address(target_place, target_root_address)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (=
    _45$address@125@01
    (compute_address<Address> (as _2$place<Place>  Place) _2$address@27@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (=
    _6$address@152@01
    (compute_address<Address> (as _2$place<Place>  Place) _2$address@27@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  _0$address@0@01
  (compute_address<Address> (as _2$place<Place>  Place) _2$address@27@01))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (=
    _37$address@88@01
    (compute_address<Address> (as _2$place<Place>  Place) _2$address@27@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  _2$address@27@01
  (compute_address<Address> (as _2$place<Place>  Place) _2$address@27@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; [eval] valid$Snap$I64(source_snapshot)
(set-option :timeout 0)
(push) ; 3
(assert (not (valid$Snap$I64<Bool> (constructor$Snap$I64$<Snap$I64> 0))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (valid$Snap$I64<Bool> (constructor$Snap$I64$<Snap$I64> 0)))
(declare-const $t@245@01 $Snap)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (= (as _1$place<Place>  Place) (as _2$place<Place>  Place))
  (= _1$address@4@01 _2$address@27@01)
  (= _1$snapshot$0@5@01 (constructor$Snap$I64$<Snap$I64> 0)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _2$snapshot$1 == constructor$Snap$I64$(0)
(declare-const $t@246@01 $Snap)
(assert (= $t@246@01 $Snap.unit))
; [eval] _2$snapshot$1 == constructor$Snap$I64$(0)
; [eval] constructor$Snap$I64$(0)
(assert (= _2$snapshot$1@29@01 (constructor$Snap$I64$<Snap$I64> 0)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlock(_3$address, Size$I64$()), write)
; [eval] Size$I64$()
(declare-const $t@247@01 $Snap)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (= _45$address@125@01 _3$address@59@01)
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (= _6$address@152@01 _3$address@59@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= _0$address@0@01 _3$address@59@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (= _37$address@88@01 _3$address@59@01)
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlockStackDrop(_3$address, Size$I64$()), write)
; [eval] Size$I64$()
(declare-const $t@248@01 $Snap)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= _2$address@27@01 _3$address@59@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; write_place_constant$I64(_3$place(), _3$address, constructor$Snap$I64$(0))
; [eval] _3$place()
; [eval] constructor$Snap$I64$(0)
; [eval] compute_address(target_place, target_root_address)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (=
    _37$address@88@01
    (compute_address<Address> (as _3$place<Place>  Place) _3$address@59@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  _0$address@0@01
  (compute_address<Address> (as _3$place<Place>  Place) _3$address@59@01))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (=
    _6$address@152@01
    (compute_address<Address> (as _3$place<Place>  Place) _3$address@59@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (=
    _45$address@125@01
    (compute_address<Address> (as _3$place<Place>  Place) _3$address@59@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  _3$address@59@01
  (compute_address<Address> (as _3$place<Place>  Place) _3$address@59@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; [eval] valid$Snap$I64(source_snapshot)
(declare-const $t@249@01 $Snap)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (= (as _1$place<Place>  Place) (as _3$place<Place>  Place))
  (= _1$address@4@01 _3$address@59@01)
  (= _1$snapshot$0@5@01 (constructor$Snap$I64$<Snap$I64> 0)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (= (as _2$place<Place>  Place) (as _3$place<Place>  Place))
  (= _2$address@27@01 _3$address@59@01))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _3$snapshot$1 == constructor$Snap$I64$(0)
(declare-const $t@250@01 $Snap)
(assert (= $t@250@01 $Snap.unit))
; [eval] _3$snapshot$1 == constructor$Snap$I64$(0)
; [eval] constructor$Snap$I64$(0)
(assert (= _3$snapshot$1@61@01 (constructor$Snap$I64$<Snap$I64> 0)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlock(_4$address, Size$I64$()), write)
; [eval] Size$I64$()
(declare-const $t@251@01 $Snap)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (= _37$address@88@01 _4$address@105@01)
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= _0$address@0@01 _4$address@105@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (= _6$address@152@01 _4$address@105@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (= _45$address@125@01 _4$address@105@01)
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlockStackDrop(_4$address, Size$I64$()), write)
; [eval] Size$I64$()
(declare-const $t@252@01 $Snap)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= _2$address@27@01 _4$address@105@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= _3$address@59@01 _4$address@105@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; write_place_constant$I64(_4$place(), _4$address, constructor$Snap$I64$(1))
; [eval] _4$place()
; [eval] constructor$Snap$I64$(1)
; [eval] compute_address(target_place, target_root_address)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (=
    _45$address@125@01
    (compute_address<Address> (as _4$place<Place>  Place) _4$address@105@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (=
    _6$address@152@01
    (compute_address<Address> (as _4$place<Place>  Place) _4$address@105@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  _0$address@0@01
  (compute_address<Address> (as _4$place<Place>  Place) _4$address@105@01))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (=
    _37$address@88@01
    (compute_address<Address> (as _4$place<Place>  Place) _4$address@105@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  _4$address@105@01
  (compute_address<Address> (as _4$place<Place>  Place) _4$address@105@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; [eval] valid$Snap$I64(source_snapshot)
(set-option :timeout 0)
(push) ; 3
(assert (not (valid$Snap$I64<Bool> (constructor$Snap$I64$<Snap$I64> 1))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (valid$Snap$I64<Bool> (constructor$Snap$I64$<Snap$I64> 1)))
(declare-const $t@253@01 $Snap)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (= (as _2$place<Place>  Place) (as _4$place<Place>  Place))
  (= _2$address@27@01 _4$address@105@01)
  (= (constructor$Snap$I64$<Snap$I64> 0) (constructor$Snap$I64$<Snap$I64> 1)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (= (as _1$place<Place>  Place) (as _4$place<Place>  Place))
  (= _1$address@4@01 _4$address@105@01)
  (= _1$snapshot$0@5@01 (constructor$Snap$I64$<Snap$I64> 1)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (= (as _3$place<Place>  Place) (as _4$place<Place>  Place))
  (= _3$address@59@01 _4$address@105@01)
  (= (constructor$Snap$I64$<Snap$I64> 0) (constructor$Snap$I64$<Snap$I64> 1)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _4$snapshot$1 == constructor$Snap$I64$(1)
(declare-const $t@254@01 $Snap)
(assert (= $t@254@01 $Snap.unit))
; [eval] _4$snapshot$1 == constructor$Snap$I64$(1)
; [eval] constructor$Snap$I64$(1)
(assert (= _4$snapshot$1@107@01 (constructor$Snap$I64$<Snap$I64> 1)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlock(_5$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
(declare-const $t@255@01 $Snap)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (= _45$address@125@01 _5$address@136@01)
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= _6$address@152@01 _5$address@136@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (= _0$address@0@01 _5$address@136@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (= _37$address@88@01 _5$address@136@01)
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlockStackDrop(_5$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
(declare-const $t@256@01 $Snap)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (= _3$address@59@01 _5$address@136@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (= _2$address@27@01 _5$address@136@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (= _4$address@105@01 _5$address@136@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; label label_bb1
; [exec]
; label_bb1$marker := true
; [exec]
; inhale basic_block_marker$label_bb1$marker()
(declare-const $t@257@01 $Snap)
(assert (= $t@257@01 $Snap.unit))
; [eval] basic_block_marker$label_bb1$marker()
(assert (as basic_block_marker$label_bb1$marker<Bool>  Bool))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; label label_bb2
; [exec]
; label_bb2$marker := true
; [exec]
; inhale basic_block_marker$label_bb2$marker()
(declare-const $t@258@01 $Snap)
(assert (= $t@258@01 $Snap.unit))
; [eval] basic_block_marker$label_bb2$marker()
(assert (as basic_block_marker$label_bb2$marker<Bool>  Bool))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlock(_7$address, Size$Bool$()), write)
; [eval] Size$Bool$()
(declare-const $t@259@01 $Snap)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (= _5$address@136@01 _7$address@157@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (= _45$address@125@01 _7$address@157@01)
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (= _6$address@152@01 _7$address@157@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (= _0$address@0@01 _7$address@157@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (= _37$address@88@01 _7$address@157@01)
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlockStackDrop(_7$address, Size$Bool$()), write)
; [eval] Size$Bool$()
(declare-const $t@260@01 $Snap)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (= _5$address@136@01 _7$address@157@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (= _3$address@59@01 _7$address@157@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (= _2$address@27@01 _7$address@157@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (= _4$address@105@01 _7$address@157@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlock(_8$address, Size$I64$()), write)
; [eval] Size$I64$()
(declare-const $t@261@01 $Snap)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (= _7$address@157@01 _8$address@163@01)
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (= _5$address@136@01 _8$address@163@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (= _45$address@125@01 _8$address@163@01)
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (= _6$address@152@01 _8$address@163@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= _0$address@0@01 _8$address@163@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (= _37$address@88@01 _8$address@163@01)
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlockStackDrop(_8$address, Size$I64$()), write)
; [eval] Size$I64$()
(declare-const $t@262@01 $Snap)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (= _7$address@157@01 _8$address@163@01)
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (= _5$address@136@01 _8$address@163@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= _3$address@59@01 _8$address@163@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= _2$address@27@01 _8$address@163@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= _4$address@105@01 _8$address@163@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; copy_place$I64(_8$place(), _8$address, _2$place(), _2$address, _2$snapshot$1,
;   write)
; [eval] _8$place()
; [eval] _2$place()
; [eval] none < source_permission_amount
; [eval] compute_address(target_place, target_root_address)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (=
    _37$address@88@01
    (compute_address<Address> (as _8$place<Place>  Place) _8$address@163@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  _0$address@0@01
  (compute_address<Address> (as _8$place<Place>  Place) _8$address@163@01))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (=
    _6$address@152@01
    (compute_address<Address> (as _8$place<Place>  Place) _8$address@163@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (=
    _45$address@125@01
    (compute_address<Address> (as _8$place<Place>  Place) _8$address@163@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (=
    _5$address@136@01
    (compute_address<Address> (as _8$place<Place>  Place) _8$address@163@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (=
    _7$address@157@01
    (compute_address<Address> (as _8$place<Place>  Place) _8$address@163@01))
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  _8$address@163@01
  (compute_address<Address> (as _8$place<Place>  Place) _8$address@163@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (= (as _4$place<Place>  Place) (as _2$place<Place>  Place))
  (= _4$address@105@01 _2$address@27@01)
  (= (constructor$Snap$I64$<Snap$I64> 1) _2$snapshot$1@29@01))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= (constructor$Snap$I64$<Snap$I64> 0) _2$snapshot$1@29@01)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(declare-const $t@263@01 $Snap)
(assert (= $t@263@01 ($Snap.combine ($Snap.first $t@263@01) ($Snap.second $t@263@01))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (= (as _3$place<Place>  Place) (as _2$place<Place>  Place))
  (= _3$address@59@01 _2$address@27@01)
  (= (constructor$Snap$I64$<Snap$I64> 0) _2$snapshot$1@29@01))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (= (as _1$place<Place>  Place) (as _2$place<Place>  Place))
  (= _1$address@4@01 _2$address@27@01)
  (= _1$snapshot$0@5@01 _2$snapshot$1@29@01))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (= (as _4$place<Place>  Place) (as _2$place<Place>  Place))
  (= _4$address@105@01 _2$address@27@01)
  (= (constructor$Snap$I64$<Snap$I64> 1) _2$snapshot$1@29@01))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second $t@263@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@263@01))
    ($Snap.second ($Snap.second $t@263@01)))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (= (as _4$place<Place>  Place) (as _8$place<Place>  Place))
  (= _4$address@105@01 _8$address@163@01)
  (= (constructor$Snap$I64$<Snap$I64> 1) _2$snapshot$1@29@01))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (= (as _1$place<Place>  Place) (as _8$place<Place>  Place))
  (= _1$address@4@01 _8$address@163@01)
  (= _1$snapshot$0@5@01 _2$snapshot$1@29@01))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (= (as _3$place<Place>  Place) (as _8$place<Place>  Place))
  (= _3$address@59@01 _8$address@163@01)
  (= (constructor$Snap$I64$<Snap$I64> 0) _2$snapshot$1@29@01))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (= (as _2$place<Place>  Place) (as _8$place<Place>  Place))
  (= _2$address@27@01 _8$address@163@01))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (= ($Snap.second ($Snap.second $t@263@01)) $Snap.unit))
; [eval] valid$Snap$I64(source_snapshot)
(assert (valid$Snap$I64<Bool> _2$snapshot$1@29@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _8$snapshot$1 == _2$snapshot$1
(declare-const $t@264@01 $Snap)
(assert (= $t@264@01 $Snap.unit))
; [eval] _8$snapshot$1 == _2$snapshot$1
(assert (= _8$snapshot$1@165@01 _2$snapshot$1@29@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlock(_9$address, Size$I64$()), write)
; [eval] Size$I64$()
(declare-const $t@265@01 $Snap)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (= _7$address@157@01 _9$address@169@01)
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (= _5$address@136@01 _9$address@169@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (= _45$address@125@01 _9$address@169@01)
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (= _6$address@152@01 _9$address@169@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= _0$address@0@01 _9$address@169@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (= _37$address@88@01 _9$address@169@01)
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlockStackDrop(_9$address, Size$I64$()), write)
; [eval] Size$I64$()
(declare-const $t@266@01 $Snap)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= _8$address@163@01 _9$address@169@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (= _7$address@157@01 _9$address@169@01)
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (= _5$address@136@01 _9$address@169@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= _3$address@59@01 _9$address@169@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= _2$address@27@01 _9$address@169@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= _4$address@105@01 _9$address@169@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; copy_place$I64(_9$place(), _9$address, _1$place(), _1$address, _1$snapshot$0,
;   write)
; [eval] _9$place()
; [eval] _1$place()
; [eval] none < source_permission_amount
; [eval] compute_address(target_place, target_root_address)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (=
    _37$address@88@01
    (compute_address<Address> (as _9$place<Place>  Place) _9$address@169@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  _0$address@0@01
  (compute_address<Address> (as _9$place<Place>  Place) _9$address@169@01))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (=
    _6$address@152@01
    (compute_address<Address> (as _9$place<Place>  Place) _9$address@169@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (=
    _45$address@125@01
    (compute_address<Address> (as _9$place<Place>  Place) _9$address@169@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (=
    _5$address@136@01
    (compute_address<Address> (as _9$place<Place>  Place) _9$address@169@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (=
    _7$address@157@01
    (compute_address<Address> (as _9$place<Place>  Place) _9$address@169@01))
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  _9$address@169@01
  (compute_address<Address> (as _9$place<Place>  Place) _9$address@169@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(declare-const $t@267@01 $Snap)
(assert (= $t@267@01 ($Snap.combine ($Snap.first $t@267@01) ($Snap.second $t@267@01))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (= (as _2$place<Place>  Place) (as _1$place<Place>  Place))
  (= _2$address@27@01 _1$address@4@01)
  (= _2$snapshot$1@29@01 _1$snapshot$0@5@01))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (= (as _3$place<Place>  Place) (as _1$place<Place>  Place))
  (= _3$address@59@01 _1$address@4@01)
  (= (constructor$Snap$I64$<Snap$I64> 0) _1$snapshot$0@5@01))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (= (as _4$place<Place>  Place) (as _1$place<Place>  Place))
  (= _4$address@105@01 _1$address@4@01)
  (= (constructor$Snap$I64$<Snap$I64> 1) _1$snapshot$0@5@01))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (= (as _8$place<Place>  Place) (as _1$place<Place>  Place))
  (= _8$address@163@01 _1$address@4@01)
  (= _2$snapshot$1@29@01 _1$snapshot$0@5@01))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second $t@267@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@267@01))
    ($Snap.second ($Snap.second $t@267@01)))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (= (as _8$place<Place>  Place) (as _9$place<Place>  Place))
  (= _8$address@163@01 _9$address@169@01)
  (= _2$snapshot$1@29@01 _1$snapshot$0@5@01))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (= (as _4$place<Place>  Place) (as _9$place<Place>  Place))
  (= _4$address@105@01 _9$address@169@01)
  (= (constructor$Snap$I64$<Snap$I64> 1) _1$snapshot$0@5@01))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (= (as _3$place<Place>  Place) (as _9$place<Place>  Place))
  (= _3$address@59@01 _9$address@169@01)
  (= (constructor$Snap$I64$<Snap$I64> 0) _1$snapshot$0@5@01))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (= (as _2$place<Place>  Place) (as _9$place<Place>  Place))
  (= _2$address@27@01 _9$address@169@01)
  (= _2$snapshot$1@29@01 _1$snapshot$0@5@01))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (= (as _1$place<Place>  Place) (as _9$place<Place>  Place))
  (= _1$address@4@01 _9$address@169@01))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (= ($Snap.second ($Snap.second $t@267@01)) $Snap.unit))
; [eval] valid$Snap$I64(source_snapshot)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _9$snapshot$1 == _1$snapshot$0
(declare-const $t@268@01 $Snap)
(assert (= $t@268@01 $Snap.unit))
; [eval] _9$snapshot$1 == _1$snapshot$0
(assert (= _9$snapshot$1@171@01 _1$snapshot$0@5@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; tmp$0 := assign$Bool$BinaryOp$LtCmp$Move$I64$Move$I64$$$$(_7$place(), _7$address,
;   _8$place(), _8$address, _8$snapshot$1, _9$place(), _9$address, _9$snapshot$1)
; [eval] _7$place()
; [eval] _8$place()
; [eval] _9$place()
; [eval] compute_address(target_place, target_address)
; [eval] Size$Bool$()
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (=
    _37$address@88@01
    (compute_address<Address> (as _7$place<Place>  Place) _7$address@157@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (=
    _0$address@0@01
    (compute_address<Address> (as _7$place<Place>  Place) _7$address@157@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (=
    _6$address@152@01
    (compute_address<Address> (as _7$place<Place>  Place) _7$address@157@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (=
    _45$address@125@01
    (compute_address<Address> (as _7$place<Place>  Place) _7$address@157@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (=
    _5$address@136@01
    (compute_address<Address> (as _7$place<Place>  Place) _7$address@157@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  _7$address@157@01
  (compute_address<Address> (as _7$place<Place>  Place) _7$address@157@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (= (as _9$place<Place>  Place) (as _8$place<Place>  Place))
  (= _9$address@169@01 _8$address@163@01)
  (= _1$snapshot$0@5@01 _8$snapshot$1@165@01))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= _2$snapshot$1@29@01 _8$snapshot$1@165@01)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; [eval] valid$Snap$I64(operand1_value)
(set-option :timeout 0)
(push) ; 3
(assert (not (valid$Snap$I64<Bool> _8$snapshot$1@165@01)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (valid$Snap$I64<Bool> _8$snapshot$1@165@01))
(push) ; 3
(set-option :timeout 10)
(assert (not (= _1$snapshot$0@5@01 _9$snapshot$1@171@01)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; [eval] valid$Snap$I64(operand2_value)
(set-option :timeout 0)
(push) ; 3
(assert (not (valid$Snap$I64<Bool> _9$snapshot$1@171@01)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (valid$Snap$I64<Bool> _9$snapshot$1@171@01))
(declare-const result_value@269@01 Snap$Bool)
(declare-const $t@270@01 $Snap)
(assert (= $t@270@01 ($Snap.combine ($Snap.first $t@270@01) ($Snap.second $t@270@01))))
(assert (=
  ($Snap.second $t@270@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@270@01))
    ($Snap.second ($Snap.second $t@270@01)))))
; [eval] compute_address(operand1_place, operand1_root_address)
; [eval] Size$I64$()
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (=
    _37$address@88@01
    (compute_address<Address> (as _8$place<Place>  Place) _8$address@163@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  _0$address@0@01
  (compute_address<Address> (as _8$place<Place>  Place) _8$address@163@01))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (=
    _6$address@152@01
    (compute_address<Address> (as _8$place<Place>  Place) _8$address@163@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (=
    _45$address@125@01
    (compute_address<Address> (as _8$place<Place>  Place) _8$address@163@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (=
    _5$address@136@01
    (compute_address<Address> (as _8$place<Place>  Place) _8$address@163@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second $t@270@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@270@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@270@01))))))
; [eval] compute_address(operand2_place, operand2_root_address)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (=
    _5$address@136@01
    (compute_address<Address> (as _9$place<Place>  Place) _9$address@169@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (=
    _45$address@125@01
    (compute_address<Address> (as _9$place<Place>  Place) _9$address@169@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (=
    _6$address@152@01
    (compute_address<Address> (as _9$place<Place>  Place) _9$address@169@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  _0$address@0@01
  (compute_address<Address> (as _9$place<Place>  Place) _9$address@169@01))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (=
    _37$address@88@01
    (compute_address<Address> (as _9$place<Place>  Place) _9$address@169@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _8$place<Place>  Place) _8$address@163@01)
  (compute_address<Address> (as _9$place<Place>  Place) _9$address@169@01))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@270@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@270@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@270@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@270@01))))
  $Snap.unit))
; [eval] result_value == constructor$Snap$Bool$LtCmp_I64(operand1_value, operand2_value)
; [eval] constructor$Snap$Bool$LtCmp_I64(operand1_value, operand2_value)
(assert (=
  result_value@269@01
  (constructor$Snap$Bool$LtCmp_I64<Snap$Bool> _8$snapshot$1@165@01 _9$snapshot$1@171@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@270@01))))
  $Snap.unit))
; [eval] valid$Snap$Bool(result_value)
(assert (valid$Snap$Bool<Bool> result_value@269@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _7$snapshot$1 == tmp$0
(declare-const $t@271@01 $Snap)
(assert (= $t@271@01 $Snap.unit))
; [eval] _7$snapshot$1 == tmp$0
(assert (= _7$snapshot$1@159@01 result_value@269@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; exhale acc(MemoryBlock(_9$address, Size$I64$()), write)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _9$place<Place>  Place) _9$address@169@01)
  _9$address@169@01)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(MemoryBlockStackDrop(_9$address, Size$I64$()), write)
; [eval] Size$I64$()
; [exec]
; exhale acc(MemoryBlock(_8$address, Size$I64$()), write)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (= _5$address@136@01 _8$address@163@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (= _45$address@125@01 _8$address@163@01)
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (= _6$address@152@01 _8$address@163@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= _0$address@0@01 _8$address@163@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (= _37$address@88@01 _8$address@163@01)
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _8$place<Place>  Place) _8$address@163@01)
  _8$address@163@01)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(MemoryBlockStackDrop(_8$address, Size$I64$()), write)
; [eval] Size$I64$()
; [eval] !destructor$Snap$Bool$$value(_7$snapshot$1)
; [eval] destructor$Snap$Bool$$value(_7$snapshot$1)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (destructor$Snap$Bool$$value<Bool> _7$snapshot$1@159@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (destructor$Snap$Bool$$value<Bool> _7$snapshot$1@159@01))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; [then-branch: 0 | !(destructor$Snap$Bool$$value[Bool](_7$snapshot$1@159@01)) | live]
; [else-branch: 0 | destructor$Snap$Bool$$value[Bool](_7$snapshot$1@159@01) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 0 | !(destructor$Snap$Bool$$value[Bool](_7$snapshot$1@159@01))]
(assert (not (destructor$Snap$Bool$$value<Bool> _7$snapshot$1@159@01)))
; [exec]
; label label__from__label_bb2__to__label_2_custom
; [exec]
; inhale _10$snapshot$2 == _10$snapshot$0
(declare-const $t@272@01 $Snap)
(assert (= $t@272@01 $Snap.unit))
; [eval] _10$snapshot$2 == _10$snapshot$0
(assert (= _10$snapshot$2@9@01 _10$snapshot$0@7@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale _11$snapshot$3 == _11$snapshot$0
(declare-const $t@273@01 $Snap)
(assert (= $t@273@01 $Snap.unit))
; [eval] _11$snapshot$3 == _11$snapshot$0
(assert (= _11$snapshot$3@15@01 _11$snapshot$0@12@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _15$snapshot$2 == _15$snapshot$0
(declare-const $t@274@01 $Snap)
(assert (= $t@274@01 $Snap.unit))
; [eval] _15$snapshot$2 == _15$snapshot$0
(assert (= _15$snapshot$2@20@01 _15$snapshot$0@18@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _16$snapshot$2 == _16$snapshot$0
(declare-const $t@275@01 $Snap)
(assert (= $t@275@01 $Snap.unit))
; [eval] _16$snapshot$2 == _16$snapshot$0
(assert (= _16$snapshot$2@25@01 _16$snapshot$0@23@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _2$snapshot$4 == _2$snapshot$1
(declare-const $t@276@01 $Snap)
(assert (= $t@276@01 $Snap.unit))
; [eval] _2$snapshot$4 == _2$snapshot$1
(assert (= _2$snapshot$4@32@01 _2$snapshot$1@29@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _20$snapshot$2 == _20$snapshot$0
(declare-const $t@277@01 $Snap)
(assert (= $t@277@01 $Snap.unit))
; [eval] _20$snapshot$2 == _20$snapshot$0
(assert (= _20$snapshot$2@37@01 _20$snapshot$0@35@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _21$snapshot$2 == _21$snapshot$0
(declare-const $t@278@01 $Snap)
(assert (= $t@278@01 $Snap.unit))
; [eval] _21$snapshot$2 == _21$snapshot$0
(assert (= _21$snapshot$2@42@01 _21$snapshot$0@40@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _24$snapshot$2 == _24$snapshot$0
(declare-const $t@279@01 $Snap)
(assert (= $t@279@01 $Snap.unit))
; [eval] _24$snapshot$2 == _24$snapshot$0
(assert (= _24$snapshot$2@47@01 _24$snapshot$0@45@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _25$snapshot$2 == _25$snapshot$0
(declare-const $t@280@01 $Snap)
(assert (= $t@280@01 $Snap.unit))
; [eval] _25$snapshot$2 == _25$snapshot$0
(assert (= _25$snapshot$2@52@01 _25$snapshot$0@50@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _29$snapshot$2 == _29$snapshot$0
(declare-const $t@281@01 $Snap)
(assert (= $t@281@01 $Snap.unit))
; [eval] _29$snapshot$2 == _29$snapshot$0
(assert (= _29$snapshot$2@57@01 _29$snapshot$0@55@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _3$snapshot$5 == _3$snapshot$1
(declare-const $t@282@01 $Snap)
(assert (= $t@282@01 $Snap.unit))
; [eval] _3$snapshot$5 == _3$snapshot$1
(assert (= _3$snapshot$5@65@01 _3$snapshot$1@61@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _30$snapshot$2 == _30$snapshot$0
(declare-const $t@283@01 $Snap)
(assert (= $t@283@01 $Snap.unit))
; [eval] _30$snapshot$2 == _30$snapshot$0
(assert (= _30$snapshot$2@70@01 _30$snapshot$0@68@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _34$snapshot$3 == _34$snapshot$0
(declare-const $t@284@01 $Snap)
(assert (= $t@284@01 $Snap.unit))
; [eval] _34$snapshot$3 == _34$snapshot$0
(assert (= _34$snapshot$3@76@01 _34$snapshot$0@73@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _35$snapshot$2 == _35$snapshot$0
(declare-const $t@285@01 $Snap)
(assert (= $t@285@01 $Snap.unit))
; [eval] _35$snapshot$2 == _35$snapshot$0
(assert (= _35$snapshot$2@81@01 _35$snapshot$0@79@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _36$snapshot$2 == _36$snapshot$0
(declare-const $t@286@01 $Snap)
(assert (= $t@286@01 $Snap.unit))
; [eval] _36$snapshot$2 == _36$snapshot$0
(assert (= _36$snapshot$2@86@01 _36$snapshot$0@84@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _37$snapshot$2 == _37$snapshot$0
(declare-const $t@287@01 $Snap)
(assert (= $t@287@01 $Snap.unit))
; [eval] _37$snapshot$2 == _37$snapshot$0
(assert (= _37$snapshot$2@91@01 _37$snapshot$0@89@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _38$snapshot$3 == _38$snapshot$0
(declare-const $t@288@01 $Snap)
(assert (= $t@288@01 $Snap.unit))
; [eval] _38$snapshot$3 == _38$snapshot$0
(assert (= _38$snapshot$3@97@01 _38$snapshot$0@94@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _39$snapshot$3 == _39$snapshot$0
(declare-const $t@289@01 $Snap)
(assert (= $t@289@01 $Snap.unit))
; [eval] _39$snapshot$3 == _39$snapshot$0
(assert (= _39$snapshot$3@103@01 _39$snapshot$0@100@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _4$snapshot$5 == _4$snapshot$1
(declare-const $t@290@01 $Snap)
(assert (= $t@290@01 $Snap.unit))
; [eval] _4$snapshot$5 == _4$snapshot$1
(assert (= _4$snapshot$5@111@01 _4$snapshot$1@107@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _43$snapshot$3 == _43$snapshot$0
(declare-const $t@291@01 $Snap)
(assert (= $t@291@01 $Snap.unit))
; [eval] _43$snapshot$3 == _43$snapshot$0
(assert (= _43$snapshot$3@117@01 _43$snapshot$0@114@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _44$snapshot$3 == _44$snapshot$0
(declare-const $t@292@01 $Snap)
(assert (= $t@292@01 $Snap.unit))
; [eval] _44$snapshot$3 == _44$snapshot$0
(assert (= _44$snapshot$3@123@01 _44$snapshot$0@120@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _45$snapshot$3 == _45$snapshot$0
(declare-const $t@293@01 $Snap)
(assert (= $t@293@01 $Snap.unit))
; [eval] _45$snapshot$3 == _45$snapshot$0
(assert (= _45$snapshot$3@129@01 _45$snapshot$0@126@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _6$snapshot$2 == _6$snapshot$0
(declare-const $t@294@01 $Snap)
(assert (= $t@294@01 $Snap.unit))
; [eval] _6$snapshot$2 == _6$snapshot$0
(assert (= _6$snapshot$2@155@01 _6$snapshot$0@153@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _7$snapshot$3 == _7$snapshot$1
(declare-const $t@295@01 $Snap)
(assert (= $t@295@01 $Snap.unit))
; [eval] _7$snapshot$3 == _7$snapshot$1
(assert (= _7$snapshot$3@161@01 _7$snapshot$1@159@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _8$snapshot$3 == _8$snapshot$1
(declare-const $t@296@01 $Snap)
(assert (= $t@296@01 $Snap.unit))
; [eval] _8$snapshot$3 == _8$snapshot$1
(assert (= _8$snapshot$3@167@01 _8$snapshot$1@165@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _9$snapshot$3 == _9$snapshot$1
(declare-const $t@297@01 $Snap)
(assert (= $t@297@01 $Snap.unit))
; [eval] _9$snapshot$3 == _9$snapshot$1
(assert (= _9$snapshot$3@173@01 _9$snapshot$1@171@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale loop_variant$1$snapshot$3 == loop_variant$1$snapshot$0
(declare-const $t@298@01 $Snap)
(assert (= $t@298@01 $Snap.unit))
; [eval] loop_variant$1$snapshot$3 == loop_variant$1$snapshot$0
(assert (= loop_variant$1$snapshot$3@215@01 loop_variant$1$snapshot$0@212@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; label label_2_custom
; [exec]
; label_2_custom$marker := true
; [exec]
; inhale basic_block_marker$label_2_custom$marker()
(declare-const $t@299@01 $Snap)
(assert (= $t@299@01 $Snap.unit))
; [eval] basic_block_marker$label_2_custom$marker()
(assert (as basic_block_marker$label_2_custom$marker<Bool>  Bool))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; label label_bb24
; [exec]
; label_bb24$marker := true
; [exec]
; inhale basic_block_marker$label_bb24$marker()
(declare-const $t@300@01 $Snap)
(assert (= $t@300@01 $Snap.unit))
; [eval] basic_block_marker$label_bb24$marker()
(assert (as basic_block_marker$label_bb24$marker<Bool>  Bool))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlock(_47$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
(declare-const $t@301@01 $Snap)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (= _37$address@88@01 _47$address@131@01)
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (= _0$address@0@01 _47$address@131@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= _6$address@152@01 _47$address@131@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (= _45$address@125@01 _47$address@131@01)
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= _5$address@136@01 _47$address@131@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlockStackDrop(_47$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
(declare-const $t@302@01 $Snap)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (= _4$address@105@01 _47$address@131@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (= _2$address@27@01 _47$address@131@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (= _3$address@59@01 _47$address@131@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= _5$address@136@01 _47$address@131@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (= _7$address@157@01 _47$address@131@01)
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; write_place_constant$Tuple$$$(_5$place(), _5$address, constructor$Snap$Tuple$$$$())
; [eval] _5$place()
; [eval] constructor$Snap$Tuple$$$$()
; [eval] compute_address(target_place, target_root_address)
; [eval] Size$Tuple$$$$()
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  _5$address@136@01
  (compute_address<Address> (as _5$place<Place>  Place) _5$address@136@01))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [eval] valid$Snap$Tuple$$$(source_snapshot)
(set-option :timeout 0)
(push) ; 4
(assert (not (valid$Snap$Tuple$$$<Bool> (as constructor$Snap$Tuple$$$$<Snap$Tuple$$$>  Snap$Tuple$$$))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (valid$Snap$Tuple$$$<Bool> (as constructor$Snap$Tuple$$$$<Snap$Tuple$$$>  Snap$Tuple$$$)))
(declare-const $t@303@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _5$snapshot$1 == constructor$Snap$Tuple$$$$()
(declare-const $t@304@01 $Snap)
(assert (= $t@304@01 $Snap.unit))
; [eval] _5$snapshot$1 == constructor$Snap$Tuple$$$$()
; [eval] constructor$Snap$Tuple$$$$()
(assert (=
  _5$snapshot$1@138@01
  (as constructor$Snap$Tuple$$$$<Snap$Tuple$$$>  Snap$Tuple$$$)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; exhale acc(MemoryBlock(_47$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
; [exec]
; exhale acc(MemoryBlockStackDrop(_47$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
; [exec]
; into_memory_block$Bool(_7$place(), _7$address, _7$snapshot$3)
; [eval] _7$place()
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= result_value@269@01 _7$snapshot$3@161@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [eval] compute_address(place, root_address)
; [eval] Size$Bool$()
(declare-const $t@305@01 $Snap)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (=
    _45$address@125@01
    (compute_address<Address> (as _7$place<Place>  Place) _7$address@157@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (=
    _6$address@152@01
    (compute_address<Address> (as _7$place<Place>  Place) _7$address@157@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (=
    _0$address@0@01
    (compute_address<Address> (as _7$place<Place>  Place) _7$address@157@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (=
    _37$address@88@01
    (compute_address<Address> (as _7$place<Place>  Place) _7$address@157@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; exhale acc(MemoryBlock(_7$address, Size$Bool$()), write)
; [eval] Size$Bool$()
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _7$place<Place>  Place) _7$address@157@01)
  _7$address@157@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(MemoryBlockStackDrop(_7$address, Size$Bool$()), write)
; [eval] Size$Bool$()
; [exec]
; into_memory_block$Tuple$$$(_5$place(), _5$address, _5$snapshot$1)
; [eval] _5$place()
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  (as constructor$Snap$Tuple$$$$<Snap$Tuple$$$>  Snap$Tuple$$$)
  _5$snapshot$1@138@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [eval] compute_address(place, root_address)
; [eval] Size$Tuple$$$$()
(declare-const $t@306@01 $Snap)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (=
    _37$address@88@01
    (compute_address<Address> (as _5$place<Place>  Place) _5$address@136@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (=
    _0$address@0@01
    (compute_address<Address> (as _5$place<Place>  Place) _5$address@136@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  _6$address@152@01
  (compute_address<Address> (as _5$place<Place>  Place) _5$address@136@01))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (=
    _45$address@125@01
    (compute_address<Address> (as _5$place<Place>  Place) _5$address@136@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; exhale acc(MemoryBlock(_5$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _5$place<Place>  Place) _5$address@136@01)
  _5$address@136@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(MemoryBlockStackDrop(_5$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
; [exec]
; inhale acc(MemoryBlock(_49$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
(declare-const $t@307@01 $Snap)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (= _45$address@125@01 _49$address@132@01)
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= _6$address@152@01 _49$address@132@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (= _0$address@0@01 _49$address@132@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (= _37$address@88@01 _49$address@132@01)
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlockStackDrop(_49$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
(declare-const $t@308@01 $Snap)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (= _3$address@59@01 _49$address@132@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (= _2$address@27@01 _49$address@132@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (= _4$address@105@01 _49$address@132@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlock(_50$address, Size$Bool$()), write)
; [eval] Size$Bool$()
(declare-const $t@309@01 $Snap)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (= _49$address@132@01 _50$address@140@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (= _45$address@125@01 _50$address@140@01)
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (= _6$address@152@01 _50$address@140@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (= _0$address@0@01 _50$address@140@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (= _37$address@88@01 _50$address@140@01)
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlockStackDrop(_50$address, Size$Bool$()), write)
; [eval] Size$Bool$()
(declare-const $t@310@01 $Snap)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (= _49$address@132@01 _50$address@140@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (= _3$address@59@01 _50$address@140@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (= _2$address@27@01 _50$address@140@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (= _4$address@105@01 _50$address@140@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; write_place_constant$Bool(_50$place(), _50$address, constructor$Snap$Bool$(false))
; [eval] _50$place()
; [eval] constructor$Snap$Bool$(false)
; [eval] compute_address(target_place, target_root_address)
; [eval] Size$Bool$()
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (=
    _37$address@88@01
    (compute_address<Address> (as _50$place<Place>  Place) _50$address@140@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (=
    _0$address@0@01
    (compute_address<Address> (as _50$place<Place>  Place) _50$address@140@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (=
    _6$address@152@01
    (compute_address<Address> (as _50$place<Place>  Place) _50$address@140@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (=
    _45$address@125@01
    (compute_address<Address> (as _50$place<Place>  Place) _50$address@140@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (=
    _49$address@132@01
    (compute_address<Address> (as _50$place<Place>  Place) _50$address@140@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  _50$address@140@01
  (compute_address<Address> (as _50$place<Place>  Place) _50$address@140@01))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [eval] valid$Snap$Bool(source_snapshot)
(set-option :timeout 0)
(push) ; 4
(assert (not (valid$Snap$Bool<Bool> (constructor$Snap$Bool$<Snap$Bool> false))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (valid$Snap$Bool<Bool> (constructor$Snap$Bool$<Snap$Bool> false)))
(declare-const $t@311@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _50$snapshot$1 == constructor$Snap$Bool$(false)
(declare-const $t@312@01 $Snap)
(assert (= $t@312@01 $Snap.unit))
; [eval] _50$snapshot$1 == constructor$Snap$Bool$(false)
; [eval] constructor$Snap$Bool$(false)
(assert (= _50$snapshot$1@142@01 (constructor$Snap$Bool$<Snap$Bool> false)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; label label_bb26
; [exec]
; label_bb26$marker := true
; [exec]
; inhale basic_block_marker$label_bb26$marker()
(declare-const $t@313@01 $Snap)
(assert (= $t@313@01 $Snap.unit))
; [eval] basic_block_marker$label_bb26$marker()
(assert (as basic_block_marker$label_bb26$marker<Bool>  Bool))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; write_place_constant$Tuple$$$(_49$place(), _49$address, constructor$Snap$Tuple$$$$())
; [eval] _49$place()
; [eval] constructor$Snap$Tuple$$$$()
; [eval] compute_address(target_place, target_root_address)
; [eval] Size$Tuple$$$$()
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  _49$address@132@01
  (compute_address<Address> (as _49$place<Place>  Place) _49$address@132@01))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [eval] valid$Snap$Tuple$$$(source_snapshot)
(declare-const $t@314@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _49$snapshot$1 == constructor$Snap$Tuple$$$$()
(declare-const $t@315@01 $Snap)
(assert (= $t@315@01 $Snap.unit))
; [eval] _49$snapshot$1 == constructor$Snap$Tuple$$$$()
; [eval] constructor$Snap$Tuple$$$$()
(assert (=
  _49$snapshot$1@134@01
  (as constructor$Snap$Tuple$$$$<Snap$Tuple$$$>  Snap$Tuple$$$)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; label label_bb27
; [exec]
; label_bb27$marker := true
; [exec]
; inhale basic_block_marker$label_bb27$marker()
(declare-const $t@316@01 $Snap)
(assert (= $t@316@01 $Snap.unit))
; [eval] basic_block_marker$label_bb27$marker()
(assert (as basic_block_marker$label_bb27$marker<Bool>  Bool))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; into_memory_block$Bool(_50$place(), _50$address, _50$snapshot$1)
; [eval] _50$place()
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= (constructor$Snap$Bool$<Snap$Bool> false) _50$snapshot$1@142@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [eval] compute_address(place, root_address)
; [eval] Size$Bool$()
(declare-const $t@317@01 $Snap)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (=
    _45$address@125@01
    (compute_address<Address> (as _50$place<Place>  Place) _50$address@140@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (=
    _6$address@152@01
    (compute_address<Address> (as _50$place<Place>  Place) _50$address@140@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (=
    _0$address@0@01
    (compute_address<Address> (as _50$place<Place>  Place) _50$address@140@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (=
    _37$address@88@01
    (compute_address<Address> (as _50$place<Place>  Place) _50$address@140@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; exhale acc(MemoryBlock(_50$address, Size$Bool$()), write)
; [eval] Size$Bool$()
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _50$place<Place>  Place) _50$address@140@01)
  _50$address@140@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(MemoryBlockStackDrop(_50$address, Size$Bool$()), write)
; [eval] Size$Bool$()
; [exec]
; into_memory_block$Tuple$$$(_49$place(), _49$address, _49$snapshot$1)
; [eval] _49$place()
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  (as constructor$Snap$Tuple$$$$<Snap$Tuple$$$>  Snap$Tuple$$$)
  _49$snapshot$1@134@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [eval] compute_address(place, root_address)
; [eval] Size$Tuple$$$$()
(declare-const $t@318@01 $Snap)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (=
    _37$address@88@01
    (compute_address<Address> (as _49$place<Place>  Place) _49$address@132@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (=
    _0$address@0@01
    (compute_address<Address> (as _49$place<Place>  Place) _49$address@132@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  _6$address@152@01
  (compute_address<Address> (as _49$place<Place>  Place) _49$address@132@01))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (=
    _45$address@125@01
    (compute_address<Address> (as _49$place<Place>  Place) _49$address@132@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; exhale acc(MemoryBlock(_49$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _49$place<Place>  Place) _49$address@132@01)
  _49$address@132@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(MemoryBlockStackDrop(_49$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
; [exec]
; inhale acc(MemoryBlock(_54$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
(declare-const $t@319@01 $Snap)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (= _45$address@125@01 _54$address@144@01)
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= _6$address@152@01 _54$address@144@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (= _0$address@0@01 _54$address@144@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (= _37$address@88@01 _54$address@144@01)
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlockStackDrop(_54$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
(declare-const $t@320@01 $Snap)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (= _3$address@59@01 _54$address@144@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (= _2$address@27@01 _54$address@144@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (= _4$address@105@01 _54$address@144@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlock(_55$address, Size$Bool$()), write)
; [eval] Size$Bool$()
(declare-const $t@321@01 $Snap)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (= _54$address@144@01 _55$address@148@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (= _45$address@125@01 _55$address@148@01)
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (= _6$address@152@01 _55$address@148@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (= _0$address@0@01 _55$address@148@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (= _37$address@88@01 _55$address@148@01)
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlockStackDrop(_55$address, Size$Bool$()), write)
; [eval] Size$Bool$()
(declare-const $t@322@01 $Snap)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (= _54$address@144@01 _55$address@148@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (= _3$address@59@01 _55$address@148@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (= _2$address@27@01 _55$address@148@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (= _4$address@105@01 _55$address@148@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; write_place_constant$Bool(_55$place(), _55$address, constructor$Snap$Bool$(false))
; [eval] _55$place()
; [eval] constructor$Snap$Bool$(false)
; [eval] compute_address(target_place, target_root_address)
; [eval] Size$Bool$()
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (=
    _37$address@88@01
    (compute_address<Address> (as _55$place<Place>  Place) _55$address@148@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (=
    _0$address@0@01
    (compute_address<Address> (as _55$place<Place>  Place) _55$address@148@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (=
    _6$address@152@01
    (compute_address<Address> (as _55$place<Place>  Place) _55$address@148@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (=
    _45$address@125@01
    (compute_address<Address> (as _55$place<Place>  Place) _55$address@148@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (=
    _54$address@144@01
    (compute_address<Address> (as _55$place<Place>  Place) _55$address@148@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  _55$address@148@01
  (compute_address<Address> (as _55$place<Place>  Place) _55$address@148@01))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [eval] valid$Snap$Bool(source_snapshot)
(declare-const $t@323@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _55$snapshot$1 == constructor$Snap$Bool$(false)
(declare-const $t@324@01 $Snap)
(assert (= $t@324@01 $Snap.unit))
; [eval] _55$snapshot$1 == constructor$Snap$Bool$(false)
; [eval] constructor$Snap$Bool$(false)
(assert (= _55$snapshot$1@150@01 (constructor$Snap$Bool$<Snap$Bool> false)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; label label_bb29
; [exec]
; label_bb29$marker := true
; [exec]
; inhale basic_block_marker$label_bb29$marker()
(declare-const $t@325@01 $Snap)
(assert (= $t@325@01 $Snap.unit))
; [eval] basic_block_marker$label_bb29$marker()
(assert (as basic_block_marker$label_bb29$marker<Bool>  Bool))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; write_place_constant$Tuple$$$(_54$place(), _54$address, constructor$Snap$Tuple$$$$())
; [eval] _54$place()
; [eval] constructor$Snap$Tuple$$$$()
; [eval] compute_address(target_place, target_root_address)
; [eval] Size$Tuple$$$$()
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  _54$address@144@01
  (compute_address<Address> (as _54$place<Place>  Place) _54$address@144@01))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [eval] valid$Snap$Tuple$$$(source_snapshot)
(declare-const $t@326@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _54$snapshot$1 == constructor$Snap$Tuple$$$$()
(declare-const $t@327@01 $Snap)
(assert (= $t@327@01 $Snap.unit))
; [eval] _54$snapshot$1 == constructor$Snap$Tuple$$$$()
; [eval] constructor$Snap$Tuple$$$$()
(assert (=
  _54$snapshot$1@146@01
  (as constructor$Snap$Tuple$$$$<Snap$Tuple$$$>  Snap$Tuple$$$)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; label label_bb30
; [exec]
; label_bb30$marker := true
; [exec]
; inhale basic_block_marker$label_bb30$marker()
(declare-const $t@328@01 $Snap)
(assert (= $t@328@01 $Snap.unit))
; [eval] basic_block_marker$label_bb30$marker()
(assert (as basic_block_marker$label_bb30$marker<Bool>  Bool))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; into_memory_block$Bool(_55$place(), _55$address, _55$snapshot$1)
; [eval] _55$place()
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= (constructor$Snap$Bool$<Snap$Bool> false) _55$snapshot$1@150@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [eval] compute_address(place, root_address)
; [eval] Size$Bool$()
(declare-const $t@329@01 $Snap)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (=
    _45$address@125@01
    (compute_address<Address> (as _55$place<Place>  Place) _55$address@148@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (=
    _6$address@152@01
    (compute_address<Address> (as _55$place<Place>  Place) _55$address@148@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (=
    _0$address@0@01
    (compute_address<Address> (as _55$place<Place>  Place) _55$address@148@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (=
    _37$address@88@01
    (compute_address<Address> (as _55$place<Place>  Place) _55$address@148@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; exhale acc(MemoryBlock(_55$address, Size$Bool$()), write)
; [eval] Size$Bool$()
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _55$place<Place>  Place) _55$address@148@01)
  _55$address@148@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(MemoryBlockStackDrop(_55$address, Size$Bool$()), write)
; [eval] Size$Bool$()
; [exec]
; into_memory_block$Tuple$$$(_54$place(), _54$address, _54$snapshot$1)
; [eval] _54$place()
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  (as constructor$Snap$Tuple$$$$<Snap$Tuple$$$>  Snap$Tuple$$$)
  _54$snapshot$1@146@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [eval] compute_address(place, root_address)
; [eval] Size$Tuple$$$$()
(declare-const $t@330@01 $Snap)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (=
    _37$address@88@01
    (compute_address<Address> (as _54$place<Place>  Place) _54$address@144@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (=
    _0$address@0@01
    (compute_address<Address> (as _54$place<Place>  Place) _54$address@144@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  _6$address@152@01
  (compute_address<Address> (as _54$place<Place>  Place) _54$address@144@01))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (=
    _45$address@125@01
    (compute_address<Address> (as _54$place<Place>  Place) _54$address@144@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; exhale acc(MemoryBlock(_54$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _54$place<Place>  Place) _54$address@144@01)
  _54$address@144@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(MemoryBlockStackDrop(_54$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
; [exec]
; copy_place$I64(_0$place(), _0$address, _3$place(), _3$address, _3$snapshot$5,
;   write)
; [eval] _0$place()
; [eval] _3$place()
; [eval] none < source_permission_amount
; [eval] compute_address(target_place, target_root_address)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (=
    _37$address@88@01
    (compute_address<Address> (as _0$place<Place>  Place) _0$address@0@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  _0$address@0@01
  (compute_address<Address> (as _0$place<Place>  Place) _0$address@0@01))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (= (as _4$place<Place>  Place) (as _3$place<Place>  Place))
  (= _4$address@105@01 _3$address@59@01)
  (= (constructor$Snap$I64$<Snap$I64> 1) _3$snapshot$5@65@01))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= (constructor$Snap$I64$<Snap$I64> 0) _3$snapshot$5@65@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(declare-const $t@331@01 $Snap)
(assert (= $t@331@01 ($Snap.combine ($Snap.first $t@331@01) ($Snap.second $t@331@01))))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (= (as _1$place<Place>  Place) (as _3$place<Place>  Place))
  (= _1$address@4@01 _3$address@59@01)
  (= _1$snapshot$0@5@01 _3$snapshot$5@65@01))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (= (as _2$place<Place>  Place) (as _3$place<Place>  Place))
  (= _2$address@27@01 _3$address@59@01)
  (= _2$snapshot$1@29@01 _3$snapshot$5@65@01))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (= (as _4$place<Place>  Place) (as _3$place<Place>  Place))
  (= _4$address@105@01 _3$address@59@01)
  (= (constructor$Snap$I64$<Snap$I64> 1) _3$snapshot$5@65@01))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second $t@331@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@331@01))
    ($Snap.second ($Snap.second $t@331@01)))))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (= (as _4$place<Place>  Place) (as _0$place<Place>  Place))
  (= _4$address@105@01 _0$address@0@01)
  (= (constructor$Snap$I64$<Snap$I64> 1) _3$snapshot$5@65@01))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (= (as _2$place<Place>  Place) (as _0$place<Place>  Place))
  (= _2$address@27@01 _0$address@0@01)
  (= _2$snapshot$1@29@01 _3$snapshot$5@65@01))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (= (as _1$place<Place>  Place) (as _0$place<Place>  Place))
  (= _1$address@4@01 _0$address@0@01)
  (= _1$snapshot$0@5@01 _3$snapshot$5@65@01))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (= (as _3$place<Place>  Place) (as _0$place<Place>  Place))
  (= _3$address@59@01 _0$address@0@01))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (= ($Snap.second ($Snap.second $t@331@01)) $Snap.unit))
; [eval] valid$Snap$I64(source_snapshot)
(assert (valid$Snap$I64<Bool> _3$snapshot$5@65@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _0$snapshot$1 == _3$snapshot$5
(declare-const $t@332@01 $Snap)
(assert (= $t@332@01 $Snap.unit))
; [eval] _0$snapshot$1 == _3$snapshot$5
(assert (= _0$snapshot$1@2@01 _3$snapshot$5@65@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; into_memory_block$I64(_4$place(), _4$address, _4$snapshot$5)
; [eval] _4$place()
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (= (as _0$place<Place>  Place) (as _4$place<Place>  Place))
  (= _0$address@0@01 _4$address@105@01)
  (= _3$snapshot$5@65@01 _4$snapshot$5@111@01))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= (constructor$Snap$I64$<Snap$I64> 1) _4$snapshot$5@111@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [eval] compute_address(place, root_address)
; [eval] Size$I64$()
(declare-const $t@333@01 $Snap)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (=
    _45$address@125@01
    (compute_address<Address> (as _4$place<Place>  Place) _4$address@105@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (=
    _6$address@152@01
    (compute_address<Address> (as _4$place<Place>  Place) _4$address@105@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (=
    _37$address@88@01
    (compute_address<Address> (as _4$place<Place>  Place) _4$address@105@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; exhale acc(MemoryBlock(_4$address, Size$I64$()), write)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _4$place<Place>  Place) _4$address@105@01)
  _4$address@105@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(MemoryBlockStackDrop(_4$address, Size$I64$()), write)
; [eval] Size$I64$()
; [exec]
; into_memory_block$I64(_3$place(), _3$address, _3$snapshot$5)
; [eval] _3$place()
; [eval] compute_address(place, root_address)
; [eval] Size$I64$()
(declare-const $t@334@01 $Snap)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (=
    _37$address@88@01
    (compute_address<Address> (as _3$place<Place>  Place) _3$address@59@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (=
    _6$address@152@01
    (compute_address<Address> (as _3$place<Place>  Place) _3$address@59@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (=
    _45$address@125@01
    (compute_address<Address> (as _3$place<Place>  Place) _3$address@59@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; exhale acc(MemoryBlock(_3$address, Size$I64$()), write)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _3$place<Place>  Place) _3$address@59@01)
  _3$address@59@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(MemoryBlockStackDrop(_3$address, Size$I64$()), write)
; [eval] Size$I64$()
; [exec]
; into_memory_block$I64(_2$place(), _2$address, _2$snapshot$4)
; [eval] _2$place()
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (= (as _0$place<Place>  Place) (as _2$place<Place>  Place))
  (= _0$address@0@01 _2$address@27@01)
  (= _3$snapshot$5@65@01 _2$snapshot$4@32@01))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= _2$snapshot$1@29@01 _2$snapshot$4@32@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [eval] compute_address(place, root_address)
; [eval] Size$I64$()
(declare-const $t@335@01 $Snap)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (=
    _45$address@125@01
    (compute_address<Address> (as _2$place<Place>  Place) _2$address@27@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (=
    _6$address@152@01
    (compute_address<Address> (as _2$place<Place>  Place) _2$address@27@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (=
    _37$address@88@01
    (compute_address<Address> (as _2$place<Place>  Place) _2$address@27@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; exhale acc(MemoryBlock(_2$address, Size$I64$()), write)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _2$place<Place>  Place) _2$address@27@01)
  _2$address@27@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(MemoryBlockStackDrop(_2$address, Size$I64$()), write)
; [eval] Size$I64$()
; [exec]
; label return_label
; [exec]
; return_label$marker := true
; [exec]
; inhale basic_block_marker$return_label$marker()
(declare-const $t@336@01 $Snap)
(assert (= $t@336@01 $Snap.unit))
; [eval] basic_block_marker$return_label$marker()
(assert (as basic_block_marker$return_label$marker<Bool>  Bool))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; into_memory_block$I64(_1$place(), _1$address, _1$snapshot$0)
; [eval] _1$place()
; [eval] compute_address(place, root_address)
; [eval] Size$I64$()
(declare-const $t@337@01 $Snap)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (=
    _37$address@88@01
    (compute_address<Address> (as _1$place<Place>  Place) _1$address@4@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (=
    _6$address@152@01
    (compute_address<Address> (as _1$place<Place>  Place) _1$address@4@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (=
    _45$address@125@01
    (compute_address<Address> (as _1$place<Place>  Place) _1$address@4@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; exhale acc(MemoryBlock(_1$address, Size$I64$()), write)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _1$place<Place>  Place) _1$address@4@01)
  _1$address@4@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(OwnedNonAliased$I64(_0$place(), _0$address, _0$snapshot$1), write) &&
;   valid$Snap$I64(_0$snapshot$1)
; [eval] _0$place()
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= _3$snapshot$5@65@01 _0$snapshot$1@2@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [eval] valid$Snap$I64(_0$snapshot$1)
(set-option :timeout 0)
(push) ; 4
(assert (not (valid$Snap$I64<Bool> _0$snapshot$1@2@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (valid$Snap$I64<Bool> _0$snapshot$1@2@01))
; [exec]
; lft_tok_sep_return$2(lft_1$snapshot$1, bw15$snapshot$0, bw16$snapshot$0, lifetime_token_perm_amount$0$snapshot$0 /
;   81)
; [eval] lifetime_token_perm_amount$0$snapshot$0 / 81
; [eval] none < rd_perm
(push) ; 4
(assert (not (or
  (= (/ lifetime_token_perm_amount$0$snapshot$0@207@01 (to_real 81)) $Perm.No)
  (< $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@207@01 (to_real 81))))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@207@01 (to_real 81)))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [eval] lft == intersect(Set(lft_1, lft_2))
; [eval] intersect(Set(lft_1, lft_2))
; [eval] Set(lft_1, lft_2)
(declare-const $t@338@01 $Snap)
(assert (= $t@338@01 ($Snap.combine ($Snap.first $t@338@01) ($Snap.second $t@338@01))))
(set-option :timeout 0)
(push) ; 4
(assert (not (or
  (= (/ lifetime_token_perm_amount$0$snapshot$0@207@01 (to_real 81)) $Perm.No)
  (< $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@207@01 (to_real 81))))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(declare-const $t@339@01 $Snap)
(assert (and
  (=>
    (<
      $Perm.No
      (-
        lifetime_token_perm_amount$0$snapshot$0@207@01
        ($Perm.min
          lifetime_token_perm_amount$0$snapshot$0@207@01
          (/ lifetime_token_perm_amount$0$snapshot$0@207@01 (to_real 81)))))
    (= $t@339@01 $t@232@01))
  (=>
    (< $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@207@01 (to_real 81)))
    (= $t@339@01 ($Snap.first $t@338@01)))))
(assert (<=
  $Perm.No
  (+
    (-
      lifetime_token_perm_amount$0$snapshot$0@207@01
      ($Perm.min
        lifetime_token_perm_amount$0$snapshot$0@207@01
        (/ lifetime_token_perm_amount$0$snapshot$0@207@01 (to_real 81))))
    (/ lifetime_token_perm_amount$0$snapshot$0@207@01 (to_real 81)))))
(push) ; 4
(assert (not (or
  (= (/ lifetime_token_perm_amount$0$snapshot$0@207@01 (to_real 81)) $Perm.No)
  (< $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@207@01 (to_real 81))))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(declare-const $t@340@01 $Snap)
(assert (and
  (=>
    (<
      $Perm.No
      (-
        lifetime_token_perm_amount$0$snapshot$0@207@01
        ($Perm.min
          lifetime_token_perm_amount$0$snapshot$0@207@01
          (/ lifetime_token_perm_amount$0$snapshot$0@207@01 (to_real 81)))))
    (= $t@340@01 $t@233@01))
  (=>
    (< $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@207@01 (to_real 81)))
    (= $t@340@01 ($Snap.second $t@338@01)))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; exhale acc(LifetimeToken(bw15$snapshot$0), lifetime_token_perm_amount$0$snapshot$0)
(set-option :timeout 0)
(push) ; 4
(assert (not (or
  (= lifetime_token_perm_amount$0$snapshot$0@207@01 $Perm.No)
  (< $Perm.No lifetime_token_perm_amount$0$snapshot$0@207@01))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  (-
    (+
      (-
        lifetime_token_perm_amount$0$snapshot$0@207@01
        ($Perm.min
          lifetime_token_perm_amount$0$snapshot$0@207@01
          (/ lifetime_token_perm_amount$0$snapshot$0@207@01 (to_real 81))))
      (/ lifetime_token_perm_amount$0$snapshot$0@207@01 (to_real 81)))
    ($Perm.min
      (+
        (-
          lifetime_token_perm_amount$0$snapshot$0@207@01
          ($Perm.min
            lifetime_token_perm_amount$0$snapshot$0@207@01
            (/ lifetime_token_perm_amount$0$snapshot$0@207@01 (to_real 81))))
        (/ lifetime_token_perm_amount$0$snapshot$0@207@01 (to_real 81)))
      lifetime_token_perm_amount$0$snapshot$0@207@01))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(assert (not (or
  (=
    (-
      lifetime_token_perm_amount$0$snapshot$0@207@01
      ($Perm.min
        (+
          (-
            lifetime_token_perm_amount$0$snapshot$0@207@01
            ($Perm.min
              lifetime_token_perm_amount$0$snapshot$0@207@01
              (/ lifetime_token_perm_amount$0$snapshot$0@207@01 (to_real 81))))
          (/ lifetime_token_perm_amount$0$snapshot$0@207@01 (to_real 81)))
        lifetime_token_perm_amount$0$snapshot$0@207@01))
    $Perm.No)
  (<
    (-
      lifetime_token_perm_amount$0$snapshot$0@207@01
      ($Perm.min
        (+
          (-
            lifetime_token_perm_amount$0$snapshot$0@207@01
            ($Perm.min
              lifetime_token_perm_amount$0$snapshot$0@207@01
              (/ lifetime_token_perm_amount$0$snapshot$0@207@01 (to_real 81))))
          (/ lifetime_token_perm_amount$0$snapshot$0@207@01 (to_real 81)))
        lifetime_token_perm_amount$0$snapshot$0@207@01))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No lifetime_token_perm_amount$0$snapshot$0@207@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(LifetimeToken(bw16$snapshot$0), lifetime_token_perm_amount$0$snapshot$0)
(set-option :timeout 0)
(push) ; 4
(assert (not (or
  (= lifetime_token_perm_amount$0$snapshot$0@207@01 $Perm.No)
  (< $Perm.No lifetime_token_perm_amount$0$snapshot$0@207@01))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  (-
    (+
      (-
        lifetime_token_perm_amount$0$snapshot$0@207@01
        ($Perm.min
          lifetime_token_perm_amount$0$snapshot$0@207@01
          (/ lifetime_token_perm_amount$0$snapshot$0@207@01 (to_real 81))))
      (/ lifetime_token_perm_amount$0$snapshot$0@207@01 (to_real 81)))
    ($Perm.min
      (+
        (-
          lifetime_token_perm_amount$0$snapshot$0@207@01
          ($Perm.min
            lifetime_token_perm_amount$0$snapshot$0@207@01
            (/ lifetime_token_perm_amount$0$snapshot$0@207@01 (to_real 81))))
        (/ lifetime_token_perm_amount$0$snapshot$0@207@01 (to_real 81)))
      lifetime_token_perm_amount$0$snapshot$0@207@01))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(assert (not (or
  (=
    (-
      lifetime_token_perm_amount$0$snapshot$0@207@01
      ($Perm.min
        (+
          (-
            lifetime_token_perm_amount$0$snapshot$0@207@01
            ($Perm.min
              lifetime_token_perm_amount$0$snapshot$0@207@01
              (/ lifetime_token_perm_amount$0$snapshot$0@207@01 (to_real 81))))
          (/ lifetime_token_perm_amount$0$snapshot$0@207@01 (to_real 81)))
        lifetime_token_perm_amount$0$snapshot$0@207@01))
    $Perm.No)
  (<
    (-
      lifetime_token_perm_amount$0$snapshot$0@207@01
      ($Perm.min
        (+
          (-
            lifetime_token_perm_amount$0$snapshot$0@207@01
            ($Perm.min
              lifetime_token_perm_amount$0$snapshot$0@207@01
              (/ lifetime_token_perm_amount$0$snapshot$0@207@01 (to_real 81))))
          (/ lifetime_token_perm_amount$0$snapshot$0@207@01 (to_real 81)))
        lifetime_token_perm_amount$0$snapshot$0@207@01))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No lifetime_token_perm_amount$0$snapshot$0@207@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [eval] loop__label_bb1__label_bb2$marker && (label_2_custom$marker && (label_bb24$marker && (label_bb26$marker && (label_bb27$marker && (label_bb29$marker && label_bb30$marker)))))
; [then-branch: 1 | False | dead]
; [else-branch: 1 | True | live]
(set-option :timeout 0)
(push) ; 4
; [else-branch: 1 | True]
(pop) ; 4
; [eval] !(loop__label_bb1__label_bb2$marker && (label_2_custom$marker && (label_bb24$marker && (label_bb26$marker && (label_bb27$marker && (label_bb29$marker && label_bb30$marker))))))
; [eval] loop__label_bb1__label_bb2$marker && (label_2_custom$marker && (label_bb24$marker && (label_bb26$marker && (label_bb27$marker && (label_bb29$marker && label_bb30$marker)))))
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [then-branch: 2 | True | live]
; [else-branch: 2 | False | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 2 | True]
; [exec]
; exhale acc(MemoryBlock(_6$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
; [eval] loop__label_bb1__label_bb2$marker && (label_2_custom$marker && (label_bb24$marker && (label_bb26$marker && (label_bb27$marker && (label_bb29$marker && label_bb30$marker)))))
; [then-branch: 3 | False | dead]
; [else-branch: 3 | True | live]
(push) ; 5
; [else-branch: 3 | True]
(pop) ; 5
; [eval] !(loop__label_bb1__label_bb2$marker && (label_2_custom$marker && (label_bb24$marker && (label_bb26$marker && (label_bb27$marker && (label_bb29$marker && label_bb30$marker))))))
; [eval] loop__label_bb1__label_bb2$marker && (label_2_custom$marker && (label_bb24$marker && (label_bb26$marker && (label_bb27$marker && (label_bb29$marker && label_bb30$marker)))))
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [then-branch: 4 | True | live]
; [else-branch: 4 | False | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 4 | True]
; [eval] loop__label_bb1__label_bb2$marker && (label_2_custom$marker && (label_bb24$marker && (label_bb26$marker && (label_bb27$marker && (label_bb29$marker && label_bb30$marker)))))
; [then-branch: 5 | False | dead]
; [else-branch: 5 | True | live]
(push) ; 6
; [else-branch: 5 | True]
(pop) ; 6
; [eval] !(loop__label_bb1__label_bb2$marker && (label_2_custom$marker && (label_bb24$marker && (label_bb26$marker && (label_bb27$marker && (label_bb29$marker && label_bb30$marker))))))
; [eval] loop__label_bb1__label_bb2$marker && (label_2_custom$marker && (label_bb24$marker && (label_bb26$marker && (label_bb27$marker && (label_bb29$marker && label_bb30$marker)))))
(push) ; 6
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [then-branch: 6 | True | live]
; [else-branch: 6 | False | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 6 | True]
; [exec]
; exhale acc(MemoryBlock(_37$address, Size$Tuple$$I64$Bool$$I64$Bool$$()), write)
; [eval] Size$Tuple$$I64$Bool$$I64$Bool$$()
; [eval] loop__label_bb1__label_bb2$marker && (label_2_custom$marker && (label_bb24$marker && (label_bb26$marker && (label_bb27$marker && (label_bb29$marker && label_bb30$marker)))))
; [then-branch: 7 | False | dead]
; [else-branch: 7 | True | live]
(push) ; 7
; [else-branch: 7 | True]
(pop) ; 7
; [eval] !(loop__label_bb1__label_bb2$marker && (label_2_custom$marker && (label_bb24$marker && (label_bb26$marker && (label_bb27$marker && (label_bb29$marker && label_bb30$marker))))))
; [eval] loop__label_bb1__label_bb2$marker && (label_2_custom$marker && (label_bb24$marker && (label_bb26$marker && (label_bb27$marker && (label_bb29$marker && label_bb30$marker)))))
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [then-branch: 8 | True | live]
; [else-branch: 8 | False | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 8 | True]
; [eval] loop__label_bb1__label_bb2$marker && (label_2_custom$marker && (label_bb24$marker && (label_bb26$marker && (label_bb27$marker && (label_bb29$marker && label_bb30$marker)))))
; [then-branch: 9 | False | dead]
; [else-branch: 9 | True | live]
(push) ; 8
; [else-branch: 9 | True]
(pop) ; 8
; [eval] !(loop__label_bb1__label_bb2$marker && (label_2_custom$marker && (label_bb24$marker && (label_bb26$marker && (label_bb27$marker && (label_bb29$marker && label_bb30$marker))))))
; [eval] loop__label_bb1__label_bb2$marker && (label_2_custom$marker && (label_bb24$marker && (label_bb26$marker && (label_bb27$marker && (label_bb29$marker && label_bb30$marker)))))
(push) ; 8
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [then-branch: 10 | True | live]
; [else-branch: 10 | False | dead]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 10 | True]
; [exec]
; exhale acc(MemoryBlock(_45$address, Size$Tuple$$I64$Bool$$I64$Bool$$()), write)
; [eval] Size$Tuple$$I64$Bool$$I64$Bool$$()
; [exec]
; label label__from__return_label__to__end_label
; [exec]
; inhale _0$snapshot$2 == _0$snapshot$1
(declare-const $t@341@01 $Snap)
(assert (= $t@341@01 $Snap.unit))
; [eval] _0$snapshot$2 == _0$snapshot$1
(assert (= _0$snapshot$2@3@01 _0$snapshot$1@2@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale _10$snapshot$3 == _10$snapshot$2
(declare-const $t@342@01 $Snap)
(assert (= $t@342@01 $Snap.unit))
; [eval] _10$snapshot$3 == _10$snapshot$2
(assert (= _10$snapshot$3@10@01 _10$snapshot$2@9@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _11$snapshot$4 == _11$snapshot$3
(declare-const $t@343@01 $Snap)
(assert (= $t@343@01 $Snap.unit))
; [eval] _11$snapshot$4 == _11$snapshot$3
(assert (= _11$snapshot$4@16@01 _11$snapshot$3@15@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _15$snapshot$3 == _15$snapshot$2
(declare-const $t@344@01 $Snap)
(assert (= $t@344@01 $Snap.unit))
; [eval] _15$snapshot$3 == _15$snapshot$2
(assert (= _15$snapshot$3@21@01 _15$snapshot$2@20@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _16$snapshot$3 == _16$snapshot$2
(declare-const $t@345@01 $Snap)
(assert (= $t@345@01 $Snap.unit))
; [eval] _16$snapshot$3 == _16$snapshot$2
(assert (= _16$snapshot$3@26@01 _16$snapshot$2@25@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _2$snapshot$5 == _2$snapshot$4
(declare-const $t@346@01 $Snap)
(assert (= $t@346@01 $Snap.unit))
; [eval] _2$snapshot$5 == _2$snapshot$4
(assert (= _2$snapshot$5@33@01 _2$snapshot$4@32@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _20$snapshot$3 == _20$snapshot$2
(declare-const $t@347@01 $Snap)
(assert (= $t@347@01 $Snap.unit))
; [eval] _20$snapshot$3 == _20$snapshot$2
(assert (= _20$snapshot$3@38@01 _20$snapshot$2@37@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _21$snapshot$3 == _21$snapshot$2
(declare-const $t@348@01 $Snap)
(assert (= $t@348@01 $Snap.unit))
; [eval] _21$snapshot$3 == _21$snapshot$2
(assert (= _21$snapshot$3@43@01 _21$snapshot$2@42@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _24$snapshot$3 == _24$snapshot$2
(declare-const $t@349@01 $Snap)
(assert (= $t@349@01 $Snap.unit))
; [eval] _24$snapshot$3 == _24$snapshot$2
(assert (= _24$snapshot$3@48@01 _24$snapshot$2@47@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _25$snapshot$3 == _25$snapshot$2
(declare-const $t@350@01 $Snap)
(assert (= $t@350@01 $Snap.unit))
; [eval] _25$snapshot$3 == _25$snapshot$2
(assert (= _25$snapshot$3@53@01 _25$snapshot$2@52@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _29$snapshot$3 == _29$snapshot$2
(declare-const $t@351@01 $Snap)
(assert (= $t@351@01 $Snap.unit))
; [eval] _29$snapshot$3 == _29$snapshot$2
(assert (= _29$snapshot$3@58@01 _29$snapshot$2@57@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _3$snapshot$6 == _3$snapshot$5
(declare-const $t@352@01 $Snap)
(assert (= $t@352@01 $Snap.unit))
; [eval] _3$snapshot$6 == _3$snapshot$5
(assert (= _3$snapshot$6@66@01 _3$snapshot$5@65@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _30$snapshot$3 == _30$snapshot$2
(declare-const $t@353@01 $Snap)
(assert (= $t@353@01 $Snap.unit))
; [eval] _30$snapshot$3 == _30$snapshot$2
(assert (= _30$snapshot$3@71@01 _30$snapshot$2@70@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _34$snapshot$4 == _34$snapshot$3
(declare-const $t@354@01 $Snap)
(assert (= $t@354@01 $Snap.unit))
; [eval] _34$snapshot$4 == _34$snapshot$3
(assert (= _34$snapshot$4@77@01 _34$snapshot$3@76@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _35$snapshot$3 == _35$snapshot$2
(declare-const $t@355@01 $Snap)
(assert (= $t@355@01 $Snap.unit))
; [eval] _35$snapshot$3 == _35$snapshot$2
(assert (= _35$snapshot$3@82@01 _35$snapshot$2@81@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _36$snapshot$3 == _36$snapshot$2
(declare-const $t@356@01 $Snap)
(assert (= $t@356@01 $Snap.unit))
; [eval] _36$snapshot$3 == _36$snapshot$2
(assert (= _36$snapshot$3@87@01 _36$snapshot$2@86@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _37$snapshot$3 == _37$snapshot$2
(declare-const $t@357@01 $Snap)
(assert (= $t@357@01 $Snap.unit))
; [eval] _37$snapshot$3 == _37$snapshot$2
(assert (= _37$snapshot$3@92@01 _37$snapshot$2@91@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _38$snapshot$4 == _38$snapshot$3
(declare-const $t@358@01 $Snap)
(assert (= $t@358@01 $Snap.unit))
; [eval] _38$snapshot$4 == _38$snapshot$3
(assert (= _38$snapshot$4@98@01 _38$snapshot$3@97@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _39$snapshot$4 == _39$snapshot$3
(declare-const $t@359@01 $Snap)
(assert (= $t@359@01 $Snap.unit))
; [eval] _39$snapshot$4 == _39$snapshot$3
(assert (= _39$snapshot$4@104@01 _39$snapshot$3@103@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _4$snapshot$6 == _4$snapshot$5
(declare-const $t@360@01 $Snap)
(assert (= $t@360@01 $Snap.unit))
; [eval] _4$snapshot$6 == _4$snapshot$5
(assert (= _4$snapshot$6@112@01 _4$snapshot$5@111@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _43$snapshot$4 == _43$snapshot$3
(declare-const $t@361@01 $Snap)
(assert (= $t@361@01 $Snap.unit))
; [eval] _43$snapshot$4 == _43$snapshot$3
(assert (= _43$snapshot$4@118@01 _43$snapshot$3@117@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _44$snapshot$4 == _44$snapshot$3
(declare-const $t@362@01 $Snap)
(assert (= $t@362@01 $Snap.unit))
; [eval] _44$snapshot$4 == _44$snapshot$3
(assert (= _44$snapshot$4@124@01 _44$snapshot$3@123@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _45$snapshot$4 == _45$snapshot$3
(declare-const $t@363@01 $Snap)
(assert (= $t@363@01 $Snap.unit))
; [eval] _45$snapshot$4 == _45$snapshot$3
(assert (= _45$snapshot$4@130@01 _45$snapshot$3@129@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _49$snapshot$2 == _49$snapshot$1
(declare-const $t@364@01 $Snap)
(assert (= $t@364@01 $Snap.unit))
; [eval] _49$snapshot$2 == _49$snapshot$1
(assert (= _49$snapshot$2@135@01 _49$snapshot$1@134@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _5$snapshot$2 == _5$snapshot$1
(declare-const $t@365@01 $Snap)
(assert (= $t@365@01 $Snap.unit))
; [eval] _5$snapshot$2 == _5$snapshot$1
(assert (= _5$snapshot$2@139@01 _5$snapshot$1@138@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _50$snapshot$2 == _50$snapshot$1
(declare-const $t@366@01 $Snap)
(assert (= $t@366@01 $Snap.unit))
; [eval] _50$snapshot$2 == _50$snapshot$1
(assert (= _50$snapshot$2@143@01 _50$snapshot$1@142@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _54$snapshot$2 == _54$snapshot$1
(declare-const $t@367@01 $Snap)
(assert (= $t@367@01 $Snap.unit))
; [eval] _54$snapshot$2 == _54$snapshot$1
(assert (= _54$snapshot$2@147@01 _54$snapshot$1@146@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _55$snapshot$2 == _55$snapshot$1
(declare-const $t@368@01 $Snap)
(assert (= $t@368@01 $Snap.unit))
; [eval] _55$snapshot$2 == _55$snapshot$1
(assert (= _55$snapshot$2@151@01 _55$snapshot$1@150@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _6$snapshot$3 == _6$snapshot$2
(declare-const $t@369@01 $Snap)
(assert (= $t@369@01 $Snap.unit))
; [eval] _6$snapshot$3 == _6$snapshot$2
(assert (= _6$snapshot$3@156@01 _6$snapshot$2@155@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _7$snapshot$4 == _7$snapshot$3
(declare-const $t@370@01 $Snap)
(assert (= $t@370@01 $Snap.unit))
; [eval] _7$snapshot$4 == _7$snapshot$3
(assert (= _7$snapshot$4@162@01 _7$snapshot$3@161@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _8$snapshot$4 == _8$snapshot$3
(declare-const $t@371@01 $Snap)
(assert (= $t@371@01 $Snap.unit))
; [eval] _8$snapshot$4 == _8$snapshot$3
(assert (= _8$snapshot$4@168@01 _8$snapshot$3@167@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _9$snapshot$4 == _9$snapshot$3
(declare-const $t@372@01 $Snap)
(assert (= $t@372@01 $Snap.unit))
; [eval] _9$snapshot$4 == _9$snapshot$3
(assert (= _9$snapshot$4@174@01 _9$snapshot$3@173@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale loop_variant$1$snapshot$4 == loop_variant$1$snapshot$3
(declare-const $t@373@01 $Snap)
(assert (= $t@373@01 $Snap.unit))
; [eval] loop_variant$1$snapshot$4 == loop_variant$1$snapshot$3
(assert (= loop_variant$1$snapshot$4@216@01 loop_variant$1$snapshot$3@215@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; label end_label
; [exec]
; end_label$marker := true
; [exec]
; inhale basic_block_marker$end_label$marker()
(declare-const $t@374@01 $Snap)
(assert (= $t@374@01 $Snap.unit))
; [eval] basic_block_marker$end_label$marker()
(assert (as basic_block_marker$end_label$marker<Bool>  Bool))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; label end_of_method
(pop) ; 8
(pop) ; 7
(pop) ; 6
(pop) ; 5
(pop) ; 4
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
; [else-branch: 0 | destructor$Snap$Bool$$value[Bool](_7$snapshot$1@159@01)]
(assert (destructor$Snap$Bool$$value<Bool> _7$snapshot$1@159@01))
(pop) ; 3
; [eval] !!destructor$Snap$Bool$$value(_7$snapshot$1)
; [eval] !destructor$Snap$Bool$$value(_7$snapshot$1)
; [eval] destructor$Snap$Bool$$value(_7$snapshot$1)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (destructor$Snap$Bool$$value<Bool> _7$snapshot$1@159@01))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (destructor$Snap$Bool$$value<Bool> _7$snapshot$1@159@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; [then-branch: 11 | destructor$Snap$Bool$$value[Bool](_7$snapshot$1@159@01) | live]
; [else-branch: 11 | !(destructor$Snap$Bool$$value[Bool](_7$snapshot$1@159@01)) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 11 | destructor$Snap$Bool$$value[Bool](_7$snapshot$1@159@01)]
(assert (destructor$Snap$Bool$$value<Bool> _7$snapshot$1@159@01))
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [then-branch: 12 | True | live]
; [else-branch: 12 | False | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 12 | True]
; [exec]
; label label_3_custom
; [exec]
; label_3_custom$marker := true
; [exec]
; inhale basic_block_marker$label_3_custom$marker()
(declare-const $t@375@01 $Snap)
(assert (= $t@375@01 $Snap.unit))
; [eval] basic_block_marker$label_3_custom$marker()
(assert (as basic_block_marker$label_3_custom$marker<Bool>  Bool))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; label label_bb3
; [exec]
; label_bb3$marker := true
; [exec]
; inhale basic_block_marker$label_bb3$marker()
(declare-const $t@376@01 $Snap)
(assert (= $t@376@01 $Snap.unit))
; [eval] basic_block_marker$label_bb3$marker()
(assert (as basic_block_marker$label_bb3$marker<Bool>  Bool))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlock(_10$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
(declare-const $t@377@01 $Snap)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _37$address@88@01 _10$address@6@01)
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _0$address@0@01 _10$address@6@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= _6$address@152@01 _10$address@6@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _45$address@125@01 _10$address@6@01)
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= _5$address@136@01 _10$address@6@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlockStackDrop(_10$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
(declare-const $t@378@01 $Snap)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _4$address@105@01 _10$address@6@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _2$address@27@01 _10$address@6@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _3$address@59@01 _10$address@6@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= _5$address@136@01 _10$address@6@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _7$address@157@01 _10$address@6@01)
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlock(_11$address, Size$Bool$()), write)
; [eval] Size$Bool$()
(declare-const $t@379@01 $Snap)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _10$address@6@01 _11$address@11@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _37$address@88@01 _11$address@11@01)
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _0$address@0@01 _11$address@11@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _6$address@152@01 _11$address@11@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _45$address@125@01 _11$address@11@01)
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _5$address@136@01 _11$address@11@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlockStackDrop(_11$address, Size$Bool$()), write)
; [eval] Size$Bool$()
(declare-const $t@380@01 $Snap)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _10$address@6@01 _11$address@11@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _4$address@105@01 _11$address@11@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _2$address@27@01 _11$address@11@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _3$address@59@01 _11$address@11@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _5$address@136@01 _11$address@11@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= _7$address@157@01 _11$address@11@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; write_place_constant$Bool(_11$place(), _11$address, constructor$Snap$Bool$(false))
; [eval] _11$place()
; [eval] constructor$Snap$Bool$(false)
; [eval] compute_address(target_place, target_root_address)
; [eval] Size$Bool$()
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _5$address@136@01
    (compute_address<Address> (as _11$place<Place>  Place) _11$address@11@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _45$address@125@01
    (compute_address<Address> (as _11$place<Place>  Place) _11$address@11@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _6$address@152@01
    (compute_address<Address> (as _11$place<Place>  Place) _11$address@11@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _0$address@0@01
    (compute_address<Address> (as _11$place<Place>  Place) _11$address@11@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _37$address@88@01
    (compute_address<Address> (as _11$place<Place>  Place) _11$address@11@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _10$address@6@01
    (compute_address<Address> (as _11$place<Place>  Place) _11$address@11@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  _11$address@11@01
  (compute_address<Address> (as _11$place<Place>  Place) _11$address@11@01))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [eval] valid$Snap$Bool(source_snapshot)
(set-option :timeout 0)
(push) ; 5
(assert (not (valid$Snap$Bool<Bool> (constructor$Snap$Bool$<Snap$Bool> false))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (valid$Snap$Bool<Bool> (constructor$Snap$Bool$<Snap$Bool> false)))
(declare-const $t@381@01 $Snap)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= (as _7$place<Place>  Place) (as _11$place<Place>  Place))
  (= _7$address@157@01 _11$address@11@01)
  (= result_value@269@01 (constructor$Snap$Bool$<Snap$Bool> false)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _11$snapshot$1 == constructor$Snap$Bool$(false)
(declare-const $t@382@01 $Snap)
(assert (= $t@382@01 $Snap.unit))
; [eval] _11$snapshot$1 == constructor$Snap$Bool$(false)
; [eval] constructor$Snap$Bool$(false)
(assert (= _11$snapshot$1@13@01 (constructor$Snap$Bool$<Snap$Bool> false)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale loop_variant$1$snapshot$1 ==
;   constructor$Snap$Unbounded$Sub_Unbounded(constructor$Snap$Unbounded$(destructor$Snap$I64$$value(_1$snapshot$0)),
;   constructor$Snap$Unbounded$(destructor$Snap$I64$$value(_2$snapshot$1)))
(declare-const $t@383@01 $Snap)
(assert (= $t@383@01 $Snap.unit))
; [eval] loop_variant$1$snapshot$1 == constructor$Snap$Unbounded$Sub_Unbounded(constructor$Snap$Unbounded$(destructor$Snap$I64$$value(_1$snapshot$0)), constructor$Snap$Unbounded$(destructor$Snap$I64$$value(_2$snapshot$1)))
; [eval] constructor$Snap$Unbounded$Sub_Unbounded(constructor$Snap$Unbounded$(destructor$Snap$I64$$value(_1$snapshot$0)), constructor$Snap$Unbounded$(destructor$Snap$I64$$value(_2$snapshot$1)))
; [eval] constructor$Snap$Unbounded$(destructor$Snap$I64$$value(_1$snapshot$0))
; [eval] destructor$Snap$I64$$value(_1$snapshot$0)
; [eval] constructor$Snap$Unbounded$(destructor$Snap$I64$$value(_2$snapshot$1))
; [eval] destructor$Snap$I64$$value(_2$snapshot$1)
(assert (=
  loop_variant$1$snapshot$1@213@01
  (constructor$Snap$Unbounded$Sub_Unbounded<Snap$Unbounded> (constructor$Snap$Unbounded$<Snap$Unbounded> (destructor$Snap$I64$$value<Int> _1$snapshot$0@5@01)) (constructor$Snap$Unbounded$<Snap$Unbounded> (destructor$Snap$I64$$value<Int> _2$snapshot$1@29@01)))))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; assert destructor$Snap$Bool$$value(constructor$Snap$Bool$LtCmp_I64(_2$snapshot$1,
;   _1$snapshot$0))
; [eval] destructor$Snap$Bool$$value(constructor$Snap$Bool$LtCmp_I64(_2$snapshot$1, _1$snapshot$0))
; [eval] constructor$Snap$Bool$LtCmp_I64(_2$snapshot$1, _1$snapshot$0)
(set-option :timeout 0)
(push) ; 5
(assert (not (destructor$Snap$Bool$$value<Bool> (constructor$Snap$Bool$LtCmp_I64<Snap$Bool> _2$snapshot$1@29@01 _1$snapshot$0@5@01))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (destructor$Snap$Bool$$value<Bool> (constructor$Snap$Bool$LtCmp_I64<Snap$Bool> _2$snapshot$1@29@01 _1$snapshot$0@5@01)))
; [exec]
; assert destructor$Snap$Bool$$value(constructor$Snap$Bool$GeCmp_I64(_2$snapshot$1,
;   constructor$Snap$I64$(0)))
; [eval] destructor$Snap$Bool$$value(constructor$Snap$Bool$GeCmp_I64(_2$snapshot$1, constructor$Snap$I64$(0)))
; [eval] constructor$Snap$Bool$GeCmp_I64(_2$snapshot$1, constructor$Snap$I64$(0))
; [eval] constructor$Snap$I64$(0)
(push) ; 5
(assert (not (destructor$Snap$Bool$$value<Bool> (constructor$Snap$Bool$GeCmp_I64<Snap$Bool> _2$snapshot$1@29@01 (constructor$Snap$I64$<Snap$I64> 0)))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (destructor$Snap$Bool$$value<Bool> (constructor$Snap$Bool$GeCmp_I64<Snap$Bool> _2$snapshot$1@29@01 (constructor$Snap$I64$<Snap$I64> 0))))
; [exec]
; assert destructor$Snap$Bool$$value(constructor$Snap$Bool$EqCmp_I64(_3$snapshot$1,
;   caller_for$m_fib$(_2$snapshot$1)))
; [eval] destructor$Snap$Bool$$value(constructor$Snap$Bool$EqCmp_I64(_3$snapshot$1, caller_for$m_fib$(_2$snapshot$1)))
; [eval] constructor$Snap$Bool$EqCmp_I64(_3$snapshot$1, caller_for$m_fib$(_2$snapshot$1))
; [eval] caller_for$m_fib$(_2$snapshot$1)
(push) ; 5
; [eval] destructor$Snap$Bool$$value(constructor$Snap$Bool$GeCmp_I64(_1, constructor$Snap$I64$(0)))
; [eval] constructor$Snap$Bool$GeCmp_I64(_1, constructor$Snap$I64$(0))
; [eval] constructor$Snap$I64$(0)
; [eval] valid$Snap$I64(_1)
(assert (caller_for$m_fib$%precondition ($Snap.combine $Snap.unit $Snap.unit) _2$snapshot$1@29@01))
(pop) ; 5
; Joined path conditions
(assert (caller_for$m_fib$%precondition ($Snap.combine $Snap.unit $Snap.unit) _2$snapshot$1@29@01))
(push) ; 5
(assert (not (destructor$Snap$Bool$$value<Bool> (constructor$Snap$Bool$EqCmp_I64<Snap$Bool> _3$snapshot$1@61@01 (caller_for$m_fib$ ($Snap.combine
  $Snap.unit
  $Snap.unit) _2$snapshot$1@29@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (destructor$Snap$Bool$$value<Bool> (constructor$Snap$Bool$EqCmp_I64<Snap$Bool> _3$snapshot$1@61@01 (caller_for$m_fib$ ($Snap.combine
  $Snap.unit
  $Snap.unit) _2$snapshot$1@29@01))))
; [exec]
; assert destructor$Snap$Bool$$value(constructor$Snap$Bool$EqCmp_I64(_4$snapshot$1,
;   caller_for$m_fib$(constructor$Snap$I64$Add_I64(_2$snapshot$1, constructor$Snap$I64$(1)))))
; [eval] destructor$Snap$Bool$$value(constructor$Snap$Bool$EqCmp_I64(_4$snapshot$1, caller_for$m_fib$(constructor$Snap$I64$Add_I64(_2$snapshot$1, constructor$Snap$I64$(1)))))
; [eval] constructor$Snap$Bool$EqCmp_I64(_4$snapshot$1, caller_for$m_fib$(constructor$Snap$I64$Add_I64(_2$snapshot$1, constructor$Snap$I64$(1))))
; [eval] caller_for$m_fib$(constructor$Snap$I64$Add_I64(_2$snapshot$1, constructor$Snap$I64$(1)))
; [eval] constructor$Snap$I64$Add_I64(_2$snapshot$1, constructor$Snap$I64$(1))
; [eval] constructor$Snap$I64$(1)
(push) ; 5
; [eval] destructor$Snap$Bool$$value(constructor$Snap$Bool$GeCmp_I64(_1, constructor$Snap$I64$(0)))
; [eval] constructor$Snap$Bool$GeCmp_I64(_1, constructor$Snap$I64$(0))
; [eval] constructor$Snap$I64$(0)
(push) ; 6
(assert (not (destructor$Snap$Bool$$value<Bool> (constructor$Snap$Bool$GeCmp_I64<Snap$Bool> (constructor$Snap$I64$Add_I64<Snap$I64> _2$snapshot$1@29@01 (constructor$Snap$I64$<Snap$I64> 1)) (constructor$Snap$I64$<Snap$I64> 0)))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (destructor$Snap$Bool$$value<Bool> (constructor$Snap$Bool$GeCmp_I64<Snap$Bool> (constructor$Snap$I64$Add_I64<Snap$I64> _2$snapshot$1@29@01 (constructor$Snap$I64$<Snap$I64> 1)) (constructor$Snap$I64$<Snap$I64> 0))))
; [eval] valid$Snap$I64(_1)
(push) ; 6
(assert (not (valid$Snap$I64<Bool> (constructor$Snap$I64$Add_I64<Snap$I64> _2$snapshot$1@29@01 (constructor$Snap$I64$<Snap$I64> 1)))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (valid$Snap$I64<Bool> (constructor$Snap$I64$Add_I64<Snap$I64> _2$snapshot$1@29@01 (constructor$Snap$I64$<Snap$I64> 1))))
(assert (caller_for$m_fib$%precondition ($Snap.combine $Snap.unit $Snap.unit) (constructor$Snap$I64$Add_I64<Snap$I64> _2$snapshot$1@29@01 (constructor$Snap$I64$<Snap$I64> 1))))
(pop) ; 5
; Joined path conditions
(assert (and
  (destructor$Snap$Bool$$value<Bool> (constructor$Snap$Bool$GeCmp_I64<Snap$Bool> (constructor$Snap$I64$Add_I64<Snap$I64> _2$snapshot$1@29@01 (constructor$Snap$I64$<Snap$I64> 1)) (constructor$Snap$I64$<Snap$I64> 0)))
  (valid$Snap$I64<Bool> (constructor$Snap$I64$Add_I64<Snap$I64> _2$snapshot$1@29@01 (constructor$Snap$I64$<Snap$I64> 1)))
  (caller_for$m_fib$%precondition ($Snap.combine $Snap.unit $Snap.unit) (constructor$Snap$I64$Add_I64<Snap$I64> _2$snapshot$1@29@01 (constructor$Snap$I64$<Snap$I64> 1)))))
(push) ; 5
(assert (not (destructor$Snap$Bool$$value<Bool> (constructor$Snap$Bool$EqCmp_I64<Snap$Bool> _4$snapshot$1@107@01 (caller_for$m_fib$ ($Snap.combine
  $Snap.unit
  $Snap.unit) (constructor$Snap$I64$Add_I64<Snap$I64> _2$snapshot$1@29@01 (constructor$Snap$I64$<Snap$I64> 1)))))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (destructor$Snap$Bool$$value<Bool> (constructor$Snap$Bool$EqCmp_I64<Snap$Bool> _4$snapshot$1@107@01 (caller_for$m_fib$ ($Snap.combine
  $Snap.unit
  $Snap.unit) (constructor$Snap$I64$Add_I64<Snap$I64> _2$snapshot$1@29@01 (constructor$Snap$I64$<Snap$I64> 1))))))
; [exec]
; assert destructor$Snap$Bool$$value(constructor$Snap$Bool$EqCmp_Lifetime(lft_0$snapshot$1,
;   intersect(Set(bw15$snapshot$0))))
; [eval] destructor$Snap$Bool$$value(constructor$Snap$Bool$EqCmp_Lifetime(lft_0$snapshot$1, intersect(Set(bw15$snapshot$0))))
; [eval] constructor$Snap$Bool$EqCmp_Lifetime(lft_0$snapshot$1, intersect(Set(bw15$snapshot$0)))
; [eval] intersect(Set(bw15$snapshot$0))
; [eval] Set(bw15$snapshot$0)
(push) ; 5
(assert (not (destructor$Snap$Bool$$value<Bool> (constructor$Snap$Bool$EqCmp_Lifetime<Snap$Bool> bw15$snapshot$0@175@01 (intersect<Lifetime> (Set_singleton bw15$snapshot$0@175@01))))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (destructor$Snap$Bool$$value<Bool> (constructor$Snap$Bool$EqCmp_Lifetime<Snap$Bool> bw15$snapshot$0@175@01 (intersect<Lifetime> (Set_singleton bw15$snapshot$0@175@01)))))
; [exec]
; assert destructor$Snap$Bool$$value(constructor$Snap$Bool$EqCmp_Lifetime(lft_1$snapshot$1,
;   intersect(Set(bw15$snapshot$0, bw16$snapshot$0))))
; [eval] destructor$Snap$Bool$$value(constructor$Snap$Bool$EqCmp_Lifetime(lft_1$snapshot$1, intersect(Set(bw15$snapshot$0, bw16$snapshot$0))))
; [eval] constructor$Snap$Bool$EqCmp_Lifetime(lft_1$snapshot$1, intersect(Set(bw15$snapshot$0, bw16$snapshot$0)))
; [eval] intersect(Set(bw15$snapshot$0, bw16$snapshot$0))
; [eval] Set(bw15$snapshot$0, bw16$snapshot$0)
(push) ; 5
(assert (not (destructor$Snap$Bool$$value<Bool> (constructor$Snap$Bool$EqCmp_Lifetime<Snap$Bool> lft@234@01 (intersect<Lifetime> (Set_unionone (Set_singleton bw15$snapshot$0@175@01) bw16$snapshot$0@176@01))))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (destructor$Snap$Bool$$value<Bool> (constructor$Snap$Bool$EqCmp_Lifetime<Snap$Bool> lft@234@01 (intersect<Lifetime> (Set_unionone (Set_singleton bw15$snapshot$0@175@01) bw16$snapshot$0@176@01)))))
; [exec]
; assert destructor$Snap$Bool$$value(constructor$Snap$Bool$GtCmp_Unbounded(loop_variant$1$snapshot$1,
;   constructor$Snap$Unbounded$(0)))
; [eval] destructor$Snap$Bool$$value(constructor$Snap$Bool$GtCmp_Unbounded(loop_variant$1$snapshot$1, constructor$Snap$Unbounded$(0)))
; [eval] constructor$Snap$Bool$GtCmp_Unbounded(loop_variant$1$snapshot$1, constructor$Snap$Unbounded$(0))
; [eval] constructor$Snap$Unbounded$(0)
(push) ; 5
(assert (not (destructor$Snap$Bool$$value<Bool> (constructor$Snap$Bool$GtCmp_Unbounded<Snap$Bool> loop_variant$1$snapshot$1@213@01 (constructor$Snap$Unbounded$<Snap$Unbounded> 0)))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (destructor$Snap$Bool$$value<Bool> (constructor$Snap$Bool$GtCmp_Unbounded<Snap$Bool> loop_variant$1$snapshot$1@213@01 (constructor$Snap$Unbounded$<Snap$Unbounded> 0))))
; [exec]
; into_memory_block$Bool(_7$place(), _7$address, _7$snapshot$1)
; [eval] _7$place()
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= (as _11$place<Place>  Place) (as _7$place<Place>  Place))
  (= _11$address@11@01 _7$address@157@01)
  (= (constructor$Snap$Bool$<Snap$Bool> false) _7$snapshot$1@159@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= result_value@269@01 _7$snapshot$1@159@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [eval] compute_address(place, root_address)
; [eval] Size$Bool$()
(declare-const $t@384@01 $Snap)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _5$address@136@01
    (compute_address<Address> (as _7$place<Place>  Place) _7$address@157@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _45$address@125@01
    (compute_address<Address> (as _7$place<Place>  Place) _7$address@157@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _6$address@152@01
    (compute_address<Address> (as _7$place<Place>  Place) _7$address@157@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _0$address@0@01
    (compute_address<Address> (as _7$place<Place>  Place) _7$address@157@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _37$address@88@01
    (compute_address<Address> (as _7$place<Place>  Place) _7$address@157@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _10$address@6@01
    (compute_address<Address> (as _7$place<Place>  Place) _7$address@157@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; havoc_memory_block$Bool$$(_7$address)
; [eval] Size$Bool$()
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _7$place<Place>  Place) _7$address@157@01)
  _7$address@157@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [eval] Size$Bool$()
(declare-const $t@385@01 $Snap)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _10$address@6@01 _7$address@157@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _37$address@88@01 _7$address@157@01)
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _0$address@0@01 _7$address@157@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _6$address@152@01 _7$address@157@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _45$address@125@01 _7$address@157@01)
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _5$address@136@01 _7$address@157@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; into_memory_block$Bool(_11$place(), _11$address, _11$snapshot$1)
; [eval] _11$place()
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (constructor$Snap$Bool$<Snap$Bool> false) _11$snapshot$1@13@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [eval] compute_address(place, root_address)
; [eval] Size$Bool$()
(declare-const $t@386@01 $Snap)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _5$address@136@01
    (compute_address<Address> (as _11$place<Place>  Place) _11$address@11@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _45$address@125@01
    (compute_address<Address> (as _11$place<Place>  Place) _11$address@11@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _6$address@152@01
    (compute_address<Address> (as _11$place<Place>  Place) _11$address@11@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _0$address@0@01
    (compute_address<Address> (as _11$place<Place>  Place) _11$address@11@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _37$address@88@01
    (compute_address<Address> (as _11$place<Place>  Place) _11$address@11@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _10$address@6@01
    (compute_address<Address> (as _11$place<Place>  Place) _11$address@11@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  _7$address@157@01
  (compute_address<Address> (as _11$place<Place>  Place) _11$address@11@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; havoc_memory_block$Bool$$(_11$address)
; [eval] Size$Bool$()
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _11$place<Place>  Place) _11$address@11@01)
  _11$address@11@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [eval] Size$Bool$()
(declare-const $t@387@01 $Snap)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= _7$address@157@01 _11$address@11@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _10$address@6@01 _11$address@11@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _37$address@88@01 _11$address@11@01)
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _0$address@0@01 _11$address@11@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _6$address@152@01 _11$address@11@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _45$address@125@01 _11$address@11@01)
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _5$address@136@01 _11$address@11@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; havoc_memory_block$Tuple$$$$$(_10$address)
; [eval] Size$Tuple$$$$()
; [eval] Size$Tuple$$$$()
(declare-const $t@388@01 $Snap)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= _5$address@136@01 _10$address@6@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _45$address@125@01 _10$address@6@01)
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= _6$address@152@01 _10$address@6@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _0$address@0@01 _10$address@6@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _37$address@88@01 _10$address@6@01)
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _7$address@157@01 _10$address@6@01)
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _11$address@11@01 _10$address@6@01)
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; havoc_memory_block$Tuple$$I64$Bool$$I64$Bool$$$(_37$address)
; [eval] Size$Tuple$$I64$Bool$$I64$Bool$$()
; [eval] Size$Tuple$$I64$Bool$$I64$Bool$$()
(declare-const $t@389@01 $Snap)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _11$address@11@01 _37$address@88@01)
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _7$address@157@01 _37$address@88@01)
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _0$address@0@01 _37$address@88@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _6$address@152@01 _37$address@88@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= _45$address@125@01 _37$address@88@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _5$address@136@01 _37$address@88@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _10$address@6@01 _37$address@88@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; tmp$1 := havoc_owned$I64(_3$place(), _3$address, _3$snapshot$1)
; [eval] _3$place()
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= (as _4$place<Place>  Place) (as _3$place<Place>  Place))
  (= _4$address@105@01 _3$address@59@01)
  (= (constructor$Snap$I64$<Snap$I64> 1) _3$snapshot$1@61@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (constructor$Snap$I64$<Snap$I64> 0) _3$snapshot$1@61@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(declare-const fresh_snapshot@390@01 Snap$I64)
(declare-const $t@391@01 $Snap)
(assert (= $t@391@01 ($Snap.combine ($Snap.first $t@391@01) ($Snap.second $t@391@01))))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= (as _1$place<Place>  Place) (as _3$place<Place>  Place))
  (= _1$address@4@01 _3$address@59@01)
  (= _1$snapshot$0@5@01 fresh_snapshot@390@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= (as _2$place<Place>  Place) (as _3$place<Place>  Place))
  (= _2$address@27@01 _3$address@59@01)
  (= _2$snapshot$1@29@01 fresh_snapshot@390@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= (as _4$place<Place>  Place) (as _3$place<Place>  Place))
  (= _4$address@105@01 _3$address@59@01)
  (= (constructor$Snap$I64$<Snap$I64> 1) fresh_snapshot@390@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (= ($Snap.second $t@391@01) $Snap.unit))
; [eval] valid$Snap$I64(fresh_snapshot)
(assert (valid$Snap$I64<Bool> fresh_snapshot@390@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _3$snapshot$2 == tmp$1
(declare-const $t@392@01 $Snap)
(assert (= $t@392@01 $Snap.unit))
; [eval] _3$snapshot$2 == tmp$1
(assert (= _3$snapshot$2@62@01 fresh_snapshot@390@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; tmp$2 := havoc_owned$I64(_4$place(), _4$address, _4$snapshot$1)
; [eval] _4$place()
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= (as _3$place<Place>  Place) (as _4$place<Place>  Place))
  (= _3$address@59@01 _4$address@105@01)
  (= fresh_snapshot@390@01 _4$snapshot$1@107@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= (as _1$place<Place>  Place) (as _4$place<Place>  Place))
  (= _1$address@4@01 _4$address@105@01)
  (= _1$snapshot$0@5@01 _4$snapshot$1@107@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= (as _2$place<Place>  Place) (as _4$place<Place>  Place))
  (= _2$address@27@01 _4$address@105@01)
  (= _2$snapshot$1@29@01 _4$snapshot$1@107@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (constructor$Snap$I64$<Snap$I64> 1) _4$snapshot$1@107@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(declare-const fresh_snapshot@393@01 Snap$I64)
(declare-const $t@394@01 $Snap)
(assert (= $t@394@01 ($Snap.combine ($Snap.first $t@394@01) ($Snap.second $t@394@01))))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= (as _2$place<Place>  Place) (as _4$place<Place>  Place))
  (= _2$address@27@01 _4$address@105@01)
  (= _2$snapshot$1@29@01 fresh_snapshot@393@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= (as _1$place<Place>  Place) (as _4$place<Place>  Place))
  (= _1$address@4@01 _4$address@105@01)
  (= _1$snapshot$0@5@01 fresh_snapshot@393@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= (as _3$place<Place>  Place) (as _4$place<Place>  Place))
  (= _3$address@59@01 _4$address@105@01)
  (= fresh_snapshot@390@01 fresh_snapshot@393@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (= ($Snap.second $t@394@01) $Snap.unit))
; [eval] valid$Snap$I64(fresh_snapshot)
(assert (valid$Snap$I64<Bool> fresh_snapshot@393@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _4$snapshot$2 == tmp$2
(declare-const $t@395@01 $Snap)
(assert (= $t@395@01 $Snap.unit))
; [eval] _4$snapshot$2 == tmp$2
(assert (= _4$snapshot$2@108@01 fresh_snapshot@393@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; havoc_memory_block$Tuple$$I64$Bool$$I64$Bool$$$(_45$address)
; [eval] Size$Tuple$$I64$Bool$$I64$Bool$$()
; [eval] Size$Tuple$$I64$Bool$$I64$Bool$$()
(declare-const $t@396@01 $Snap)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _10$address@6@01 _45$address@125@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _5$address@136@01 _45$address@125@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _6$address@152@01 _45$address@125@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _0$address@0@01 _45$address@125@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _7$address@157@01 _45$address@125@01)
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _11$address@11@01 _45$address@125@01)
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= _37$address@88@01 _45$address@125@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; tmp$3 := havoc_owned$I64(_2$place(), _2$address, _2$snapshot$1)
; [eval] _2$place()
(declare-const fresh_snapshot@397@01 Snap$I64)
(declare-const $t@398@01 $Snap)
(assert (= $t@398@01 ($Snap.combine ($Snap.first $t@398@01) ($Snap.second $t@398@01))))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= (as _4$place<Place>  Place) (as _2$place<Place>  Place))
  (= _4$address@105@01 _2$address@27@01)
  (= fresh_snapshot@393@01 fresh_snapshot@397@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= (as _1$place<Place>  Place) (as _2$place<Place>  Place))
  (= _1$address@4@01 _2$address@27@01)
  (= _1$snapshot$0@5@01 fresh_snapshot@397@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= (as _3$place<Place>  Place) (as _2$place<Place>  Place))
  (= _3$address@59@01 _2$address@27@01)
  (= fresh_snapshot@390@01 fresh_snapshot@397@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (= ($Snap.second $t@398@01) $Snap.unit))
; [eval] valid$Snap$I64(fresh_snapshot)
(assert (valid$Snap$I64<Bool> fresh_snapshot@397@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _2$snapshot$2 == tmp$3
(declare-const $t@399@01 $Snap)
(assert (= $t@399@01 $Snap.unit))
; [eval] _2$snapshot$2 == tmp$3
(assert (= _2$snapshot$2@30@01 fresh_snapshot@397@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; havoc_memory_block$Tuple$$$$$(_6$address)
; [eval] Size$Tuple$$$$()
; [eval] Size$Tuple$$$$()
(declare-const $t@400@01 $Snap)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _45$address@125@01 _6$address@152@01)
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= _10$address@6@01 _6$address@152@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= _5$address@136@01 _6$address@152@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _0$address@0@01 _6$address@152@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _7$address@157@01 _6$address@152@01)
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _11$address@11@01 _6$address@152@01)
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _37$address@88@01 _6$address@152@01)
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale loop_variant$1$snapshot$2 == tmp$4
(declare-const $t@401@01 $Snap)
(assert (= $t@401@01 $Snap.unit))
; [eval] loop_variant$1$snapshot$2 == tmp$4
(assert (= loop_variant$1$snapshot$2@214@01 tmp$4@225@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale destructor$Snap$Bool$$value(constructor$Snap$Bool$LtCmp_I64(_2$snapshot$2,
;   _1$snapshot$0))
(declare-const $t@402@01 $Snap)
(assert (= $t@402@01 $Snap.unit))
; [eval] destructor$Snap$Bool$$value(constructor$Snap$Bool$LtCmp_I64(_2$snapshot$2, _1$snapshot$0))
; [eval] constructor$Snap$Bool$LtCmp_I64(_2$snapshot$2, _1$snapshot$0)
(assert (destructor$Snap$Bool$$value<Bool> (constructor$Snap$Bool$LtCmp_I64<Snap$Bool> _2$snapshot$2@30@01 _1$snapshot$0@5@01)))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale destructor$Snap$Bool$$value(constructor$Snap$Bool$GeCmp_I64(_2$snapshot$2,
;   constructor$Snap$I64$(0)))
(declare-const $t@403@01 $Snap)
(assert (= $t@403@01 $Snap.unit))
; [eval] destructor$Snap$Bool$$value(constructor$Snap$Bool$GeCmp_I64(_2$snapshot$2, constructor$Snap$I64$(0)))
; [eval] constructor$Snap$Bool$GeCmp_I64(_2$snapshot$2, constructor$Snap$I64$(0))
; [eval] constructor$Snap$I64$(0)
(assert (destructor$Snap$Bool$$value<Bool> (constructor$Snap$Bool$GeCmp_I64<Snap$Bool> _2$snapshot$2@30@01 (constructor$Snap$I64$<Snap$I64> 0))))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale destructor$Snap$Bool$$value(constructor$Snap$Bool$EqCmp_I64(_3$snapshot$2,
;   caller_for$m_fib$(_2$snapshot$2)))
(declare-const $t@404@01 $Snap)
(assert (= $t@404@01 $Snap.unit))
; [eval] destructor$Snap$Bool$$value(constructor$Snap$Bool$EqCmp_I64(_3$snapshot$2, caller_for$m_fib$(_2$snapshot$2)))
; [eval] constructor$Snap$Bool$EqCmp_I64(_3$snapshot$2, caller_for$m_fib$(_2$snapshot$2))
; [eval] caller_for$m_fib$(_2$snapshot$2)
(set-option :timeout 0)
(push) ; 5
; [eval] destructor$Snap$Bool$$value(constructor$Snap$Bool$GeCmp_I64(_1, constructor$Snap$I64$(0)))
; [eval] constructor$Snap$Bool$GeCmp_I64(_1, constructor$Snap$I64$(0))
; [eval] constructor$Snap$I64$(0)
; [eval] valid$Snap$I64(_1)
(push) ; 6
(assert (not (valid$Snap$I64<Bool> _2$snapshot$2@30@01)))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (valid$Snap$I64<Bool> _2$snapshot$2@30@01))
(assert (caller_for$m_fib$%precondition ($Snap.combine $Snap.unit $Snap.unit) _2$snapshot$2@30@01))
(pop) ; 5
; Joined path conditions
(assert (and
  (valid$Snap$I64<Bool> _2$snapshot$2@30@01)
  (caller_for$m_fib$%precondition ($Snap.combine $Snap.unit $Snap.unit) _2$snapshot$2@30@01)))
(assert (destructor$Snap$Bool$$value<Bool> (constructor$Snap$Bool$EqCmp_I64<Snap$Bool> _3$snapshot$2@62@01 (caller_for$m_fib$ ($Snap.combine
  $Snap.unit
  $Snap.unit) _2$snapshot$2@30@01))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale destructor$Snap$Bool$$value(constructor$Snap$Bool$EqCmp_I64(_4$snapshot$2,
;   caller_for$m_fib$(constructor$Snap$I64$Add_I64(_2$snapshot$2, constructor$Snap$I64$(1)))))
(declare-const $t@405@01 $Snap)
(assert (= $t@405@01 $Snap.unit))
; [eval] destructor$Snap$Bool$$value(constructor$Snap$Bool$EqCmp_I64(_4$snapshot$2, caller_for$m_fib$(constructor$Snap$I64$Add_I64(_2$snapshot$2, constructor$Snap$I64$(1)))))
; [eval] constructor$Snap$Bool$EqCmp_I64(_4$snapshot$2, caller_for$m_fib$(constructor$Snap$I64$Add_I64(_2$snapshot$2, constructor$Snap$I64$(1))))
; [eval] caller_for$m_fib$(constructor$Snap$I64$Add_I64(_2$snapshot$2, constructor$Snap$I64$(1)))
; [eval] constructor$Snap$I64$Add_I64(_2$snapshot$2, constructor$Snap$I64$(1))
; [eval] constructor$Snap$I64$(1)
(set-option :timeout 0)
(push) ; 5
; [eval] destructor$Snap$Bool$$value(constructor$Snap$Bool$GeCmp_I64(_1, constructor$Snap$I64$(0)))
; [eval] constructor$Snap$Bool$GeCmp_I64(_1, constructor$Snap$I64$(0))
; [eval] constructor$Snap$I64$(0)
(push) ; 6
(assert (not (destructor$Snap$Bool$$value<Bool> (constructor$Snap$Bool$GeCmp_I64<Snap$Bool> (constructor$Snap$I64$Add_I64<Snap$I64> _2$snapshot$2@30@01 (constructor$Snap$I64$<Snap$I64> 1)) (constructor$Snap$I64$<Snap$I64> 0)))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (destructor$Snap$Bool$$value<Bool> (constructor$Snap$Bool$GeCmp_I64<Snap$Bool> (constructor$Snap$I64$Add_I64<Snap$I64> _2$snapshot$2@30@01 (constructor$Snap$I64$<Snap$I64> 1)) (constructor$Snap$I64$<Snap$I64> 0))))
; [eval] valid$Snap$I64(_1)
(push) ; 6
(assert (not (valid$Snap$I64<Bool> (constructor$Snap$I64$Add_I64<Snap$I64> _2$snapshot$2@30@01 (constructor$Snap$I64$<Snap$I64> 1)))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (valid$Snap$I64<Bool> (constructor$Snap$I64$Add_I64<Snap$I64> _2$snapshot$2@30@01 (constructor$Snap$I64$<Snap$I64> 1))))
(assert (caller_for$m_fib$%precondition ($Snap.combine $Snap.unit $Snap.unit) (constructor$Snap$I64$Add_I64<Snap$I64> _2$snapshot$2@30@01 (constructor$Snap$I64$<Snap$I64> 1))))
(pop) ; 5
; Joined path conditions
(assert (and
  (destructor$Snap$Bool$$value<Bool> (constructor$Snap$Bool$GeCmp_I64<Snap$Bool> (constructor$Snap$I64$Add_I64<Snap$I64> _2$snapshot$2@30@01 (constructor$Snap$I64$<Snap$I64> 1)) (constructor$Snap$I64$<Snap$I64> 0)))
  (valid$Snap$I64<Bool> (constructor$Snap$I64$Add_I64<Snap$I64> _2$snapshot$2@30@01 (constructor$Snap$I64$<Snap$I64> 1)))
  (caller_for$m_fib$%precondition ($Snap.combine $Snap.unit $Snap.unit) (constructor$Snap$I64$Add_I64<Snap$I64> _2$snapshot$2@30@01 (constructor$Snap$I64$<Snap$I64> 1)))))
(assert (destructor$Snap$Bool$$value<Bool> (constructor$Snap$Bool$EqCmp_I64<Snap$Bool> _4$snapshot$2@108@01 (caller_for$m_fib$ ($Snap.combine
  $Snap.unit
  $Snap.unit) (constructor$Snap$I64$Add_I64<Snap$I64> _2$snapshot$2@30@01 (constructor$Snap$I64$<Snap$I64> 1))))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale destructor$Snap$Bool$$value(constructor$Snap$Bool$EqCmp_Lifetime(lft_0$snapshot$1,
;   intersect(Set(bw15$snapshot$0))))
(declare-const $t@406@01 $Snap)
(assert (= $t@406@01 $Snap.unit))
; [eval] destructor$Snap$Bool$$value(constructor$Snap$Bool$EqCmp_Lifetime(lft_0$snapshot$1, intersect(Set(bw15$snapshot$0))))
; [eval] constructor$Snap$Bool$EqCmp_Lifetime(lft_0$snapshot$1, intersect(Set(bw15$snapshot$0)))
; [eval] intersect(Set(bw15$snapshot$0))
; [eval] Set(bw15$snapshot$0)
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale destructor$Snap$Bool$$value(constructor$Snap$Bool$EqCmp_Lifetime(lft_1$snapshot$1,
;   intersect(Set(bw15$snapshot$0, bw16$snapshot$0))))
(declare-const $t@407@01 $Snap)
(assert (= $t@407@01 $Snap.unit))
; [eval] destructor$Snap$Bool$$value(constructor$Snap$Bool$EqCmp_Lifetime(lft_1$snapshot$1, intersect(Set(bw15$snapshot$0, bw16$snapshot$0))))
; [eval] constructor$Snap$Bool$EqCmp_Lifetime(lft_1$snapshot$1, intersect(Set(bw15$snapshot$0, bw16$snapshot$0)))
; [eval] intersect(Set(bw15$snapshot$0, bw16$snapshot$0))
; [eval] Set(bw15$snapshot$0, bw16$snapshot$0)
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale destructor$Snap$Bool$$value(constructor$Snap$Bool$EqCmp_Unbounded(loop_variant$1$snapshot$2,
;   constructor$Snap$Unbounded$Sub_Unbounded(constructor$Snap$Unbounded$(destructor$Snap$I64$$value(_1$snapshot$0)),
;   constructor$Snap$Unbounded$(destructor$Snap$I64$$value(_2$snapshot$2)))))
(declare-const $t@408@01 $Snap)
(assert (= $t@408@01 $Snap.unit))
; [eval] destructor$Snap$Bool$$value(constructor$Snap$Bool$EqCmp_Unbounded(loop_variant$1$snapshot$2, constructor$Snap$Unbounded$Sub_Unbounded(constructor$Snap$Unbounded$(destructor$Snap$I64$$value(_1$snapshot$0)), constructor$Snap$Unbounded$(destructor$Snap$I64$$value(_2$snapshot$2)))))
; [eval] constructor$Snap$Bool$EqCmp_Unbounded(loop_variant$1$snapshot$2, constructor$Snap$Unbounded$Sub_Unbounded(constructor$Snap$Unbounded$(destructor$Snap$I64$$value(_1$snapshot$0)), constructor$Snap$Unbounded$(destructor$Snap$I64$$value(_2$snapshot$2))))
; [eval] constructor$Snap$Unbounded$Sub_Unbounded(constructor$Snap$Unbounded$(destructor$Snap$I64$$value(_1$snapshot$0)), constructor$Snap$Unbounded$(destructor$Snap$I64$$value(_2$snapshot$2)))
; [eval] constructor$Snap$Unbounded$(destructor$Snap$I64$$value(_1$snapshot$0))
; [eval] destructor$Snap$I64$$value(_1$snapshot$0)
; [eval] constructor$Snap$Unbounded$(destructor$Snap$I64$$value(_2$snapshot$2))
; [eval] destructor$Snap$I64$$value(_2$snapshot$2)
(assert (destructor$Snap$Bool$$value<Bool> (constructor$Snap$Bool$EqCmp_Unbounded<Snap$Bool> loop_variant$1$snapshot$2@214@01 (constructor$Snap$Unbounded$Sub_Unbounded<Snap$Unbounded> (constructor$Snap$Unbounded$<Snap$Unbounded> (destructor$Snap$I64$$value<Int> _1$snapshot$0@5@01)) (constructor$Snap$Unbounded$<Snap$Unbounded> (destructor$Snap$I64$$value<Int> _2$snapshot$2@30@01))))))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; label label_bb5
; [exec]
; label_bb5$marker := true
; [exec]
; inhale basic_block_marker$label_bb5$marker()
(declare-const $t@409@01 $Snap)
(assert (= $t@409@01 $Snap.unit))
; [eval] basic_block_marker$label_bb5$marker()
(assert (as basic_block_marker$label_bb5$marker<Bool>  Bool))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; write_place_constant$Tuple$$$(_10$place(), _10$address, constructor$Snap$Tuple$$$$())
; [eval] _10$place()
; [eval] constructor$Snap$Tuple$$$$()
; [eval] compute_address(target_place, target_root_address)
; [eval] Size$Tuple$$$$()
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  _6$address@152@01
  (compute_address<Address> (as _10$place<Place>  Place) _10$address@6@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _45$address@125@01
    (compute_address<Address> (as _10$place<Place>  Place) _10$address@6@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  _10$address@6@01
  (compute_address<Address> (as _10$place<Place>  Place) _10$address@6@01))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [eval] valid$Snap$Tuple$$$(source_snapshot)
(set-option :timeout 0)
(push) ; 5
(assert (not (valid$Snap$Tuple$$$<Bool> (as constructor$Snap$Tuple$$$$<Snap$Tuple$$$>  Snap$Tuple$$$))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (valid$Snap$Tuple$$$<Bool> (as constructor$Snap$Tuple$$$$<Snap$Tuple$$$>  Snap$Tuple$$$)))
(declare-const $t@410@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _10$snapshot$1 == constructor$Snap$Tuple$$$$()
(declare-const $t@411@01 $Snap)
(assert (= $t@411@01 $Snap.unit))
; [eval] _10$snapshot$1 == constructor$Snap$Tuple$$$$()
; [eval] constructor$Snap$Tuple$$$$()
(assert (=
  _10$snapshot$1@8@01
  (as constructor$Snap$Tuple$$$$<Snap$Tuple$$$>  Snap$Tuple$$$)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; label label_bb6
; [exec]
; label_bb6$marker := true
; [exec]
; inhale basic_block_marker$label_bb6$marker()
(declare-const $t@412@01 $Snap)
(assert (= $t@412@01 $Snap.unit))
; [eval] basic_block_marker$label_bb6$marker()
(assert (as basic_block_marker$label_bb6$marker<Bool>  Bool))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; exhale acc(MemoryBlock(_11$address, Size$Bool$()), write)
; [eval] Size$Bool$()
; [exec]
; exhale acc(MemoryBlockStackDrop(_11$address, Size$Bool$()), write)
; [eval] Size$Bool$()
; [exec]
; into_memory_block$Tuple$$$(_10$place(), _10$address, _10$snapshot$1)
; [eval] _10$place()
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  (as constructor$Snap$Tuple$$$$<Snap$Tuple$$$>  Snap$Tuple$$$)
  _10$snapshot$1@8@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [eval] compute_address(place, root_address)
; [eval] Size$Tuple$$$$()
(declare-const $t@413@01 $Snap)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  _6$address@152@01
  (compute_address<Address> (as _10$place<Place>  Place) _10$address@6@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _45$address@125@01
    (compute_address<Address> (as _10$place<Place>  Place) _10$address@6@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  _5$address@136@01
  (compute_address<Address> (as _10$place<Place>  Place) _10$address@6@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _0$address@0@01
    (compute_address<Address> (as _10$place<Place>  Place) _10$address@6@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _7$address@157@01
    (compute_address<Address> (as _10$place<Place>  Place) _10$address@6@01))
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _37$address@88@01
    (compute_address<Address> (as _10$place<Place>  Place) _10$address@6@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; exhale acc(MemoryBlock(_10$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _10$place<Place>  Place) _10$address@6@01)
  _10$address@6@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(MemoryBlockStackDrop(_10$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
; [exec]
; inhale acc(MemoryBlock(_15$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
(declare-const $t@414@01 $Snap)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _37$address@88@01 _15$address@17@01)
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _7$address@157@01 _15$address@17@01)
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _0$address@0@01 _15$address@17@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= _5$address@136@01 _15$address@17@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _45$address@125@01 _15$address@17@01)
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= _6$address@152@01 _15$address@17@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlockStackDrop(_15$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
(declare-const $t@415@01 $Snap)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _4$address@105@01 _15$address@17@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _2$address@27@01 _15$address@17@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _3$address@59@01 _15$address@17@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= _5$address@136@01 _15$address@17@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _7$address@157@01 _15$address@17@01)
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlock(_16$address, Size$Bool$()), write)
; [eval] Size$Bool$()
(declare-const $t@416@01 $Snap)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _15$address@17@01 _16$address@22@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _37$address@88@01 _16$address@22@01)
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= _7$address@157@01 _16$address@22@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _0$address@0@01 _16$address@22@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _5$address@136@01 _16$address@22@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _45$address@125@01 _16$address@22@01)
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _6$address@152@01 _16$address@22@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlockStackDrop(_16$address, Size$Bool$()), write)
; [eval] Size$Bool$()
(declare-const $t@417@01 $Snap)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _15$address@17@01 _16$address@22@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _4$address@105@01 _16$address@22@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _2$address@27@01 _16$address@22@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _3$address@59@01 _16$address@22@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _5$address@136@01 _16$address@22@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= _7$address@157@01 _16$address@22@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; write_place_constant$Bool(_16$place(), _16$address, constructor$Snap$Bool$(false))
; [eval] _16$place()
; [eval] constructor$Snap$Bool$(false)
; [eval] compute_address(target_place, target_root_address)
; [eval] Size$Bool$()
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _6$address@152@01
    (compute_address<Address> (as _16$place<Place>  Place) _16$address@22@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _45$address@125@01
    (compute_address<Address> (as _16$place<Place>  Place) _16$address@22@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _5$address@136@01
    (compute_address<Address> (as _16$place<Place>  Place) _16$address@22@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _0$address@0@01
    (compute_address<Address> (as _16$place<Place>  Place) _16$address@22@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  _7$address@157@01
  (compute_address<Address> (as _16$place<Place>  Place) _16$address@22@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _37$address@88@01
    (compute_address<Address> (as _16$place<Place>  Place) _16$address@22@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _15$address@17@01
    (compute_address<Address> (as _16$place<Place>  Place) _16$address@22@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  _16$address@22@01
  (compute_address<Address> (as _16$place<Place>  Place) _16$address@22@01))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [eval] valid$Snap$Bool(source_snapshot)
(declare-const $t@418@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _16$snapshot$1 == constructor$Snap$Bool$(false)
(declare-const $t@419@01 $Snap)
(assert (= $t@419@01 $Snap.unit))
; [eval] _16$snapshot$1 == constructor$Snap$Bool$(false)
; [eval] constructor$Snap$Bool$(false)
(assert (= _16$snapshot$1@24@01 (constructor$Snap$Bool$<Snap$Bool> false)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; label label_bb8
; [exec]
; label_bb8$marker := true
; [exec]
; inhale basic_block_marker$label_bb8$marker()
(declare-const $t@420@01 $Snap)
(assert (= $t@420@01 $Snap.unit))
; [eval] basic_block_marker$label_bb8$marker()
(assert (as basic_block_marker$label_bb8$marker<Bool>  Bool))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; write_place_constant$Tuple$$$(_15$place(), _15$address, constructor$Snap$Tuple$$$$())
; [eval] _15$place()
; [eval] constructor$Snap$Tuple$$$$()
; [eval] compute_address(target_place, target_root_address)
; [eval] Size$Tuple$$$$()
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  _15$address@17@01
  (compute_address<Address> (as _15$place<Place>  Place) _15$address@17@01))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [eval] valid$Snap$Tuple$$$(source_snapshot)
(declare-const $t@421@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _15$snapshot$1 == constructor$Snap$Tuple$$$$()
(declare-const $t@422@01 $Snap)
(assert (= $t@422@01 $Snap.unit))
; [eval] _15$snapshot$1 == constructor$Snap$Tuple$$$$()
; [eval] constructor$Snap$Tuple$$$$()
(assert (=
  _15$snapshot$1@19@01
  (as constructor$Snap$Tuple$$$$<Snap$Tuple$$$>  Snap$Tuple$$$)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; label label_bb9
; [exec]
; label_bb9$marker := true
; [exec]
; inhale basic_block_marker$label_bb9$marker()
(declare-const $t@423@01 $Snap)
(assert (= $t@423@01 $Snap.unit))
; [eval] basic_block_marker$label_bb9$marker()
(assert (as basic_block_marker$label_bb9$marker<Bool>  Bool))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; into_memory_block$Bool(_16$place(), _16$address, _16$snapshot$1)
; [eval] _16$place()
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (constructor$Snap$Bool$<Snap$Bool> false) _16$snapshot$1@24@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [eval] compute_address(place, root_address)
; [eval] Size$Bool$()
(declare-const $t@424@01 $Snap)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _37$address@88@01
    (compute_address<Address> (as _16$place<Place>  Place) _16$address@22@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  _7$address@157@01
  (compute_address<Address> (as _16$place<Place>  Place) _16$address@22@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _0$address@0@01
    (compute_address<Address> (as _16$place<Place>  Place) _16$address@22@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _5$address@136@01
    (compute_address<Address> (as _16$place<Place>  Place) _16$address@22@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _45$address@125@01
    (compute_address<Address> (as _16$place<Place>  Place) _16$address@22@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _6$address@152@01
    (compute_address<Address> (as _16$place<Place>  Place) _16$address@22@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; exhale acc(MemoryBlock(_16$address, Size$Bool$()), write)
; [eval] Size$Bool$()
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _16$place<Place>  Place) _16$address@22@01)
  _16$address@22@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(MemoryBlockStackDrop(_16$address, Size$Bool$()), write)
; [eval] Size$Bool$()
; [exec]
; into_memory_block$Tuple$$$(_15$place(), _15$address, _15$snapshot$1)
; [eval] _15$place()
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  (as constructor$Snap$Tuple$$$$<Snap$Tuple$$$>  Snap$Tuple$$$)
  _15$snapshot$1@19@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [eval] compute_address(place, root_address)
; [eval] Size$Tuple$$$$()
(declare-const $t@425@01 $Snap)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  _6$address@152@01
  (compute_address<Address> (as _15$place<Place>  Place) _15$address@17@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _45$address@125@01
    (compute_address<Address> (as _15$place<Place>  Place) _15$address@17@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  _5$address@136@01
  (compute_address<Address> (as _15$place<Place>  Place) _15$address@17@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _0$address@0@01
    (compute_address<Address> (as _15$place<Place>  Place) _15$address@17@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _7$address@157@01
    (compute_address<Address> (as _15$place<Place>  Place) _15$address@17@01))
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _37$address@88@01
    (compute_address<Address> (as _15$place<Place>  Place) _15$address@17@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; exhale acc(MemoryBlock(_15$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _15$place<Place>  Place) _15$address@17@01)
  _15$address@17@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(MemoryBlockStackDrop(_15$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
; [exec]
; inhale acc(MemoryBlock(_20$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
(declare-const $t@426@01 $Snap)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _37$address@88@01 _20$address@34@01)
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _7$address@157@01 _20$address@34@01)
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _0$address@0@01 _20$address@34@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= _5$address@136@01 _20$address@34@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _45$address@125@01 _20$address@34@01)
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= _6$address@152@01 _20$address@34@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlockStackDrop(_20$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
(declare-const $t@427@01 $Snap)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _4$address@105@01 _20$address@34@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _2$address@27@01 _20$address@34@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _3$address@59@01 _20$address@34@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= _5$address@136@01 _20$address@34@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _7$address@157@01 _20$address@34@01)
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlock(_21$address, Size$Bool$()), write)
; [eval] Size$Bool$()
(declare-const $t@428@01 $Snap)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _20$address@34@01 _21$address@39@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _37$address@88@01 _21$address@39@01)
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= _7$address@157@01 _21$address@39@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _0$address@0@01 _21$address@39@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _5$address@136@01 _21$address@39@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _45$address@125@01 _21$address@39@01)
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _6$address@152@01 _21$address@39@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlockStackDrop(_21$address, Size$Bool$()), write)
; [eval] Size$Bool$()
(declare-const $t@429@01 $Snap)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _20$address@34@01 _21$address@39@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _4$address@105@01 _21$address@39@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _2$address@27@01 _21$address@39@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _3$address@59@01 _21$address@39@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _5$address@136@01 _21$address@39@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= _7$address@157@01 _21$address@39@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; write_place_constant$Bool(_21$place(), _21$address, constructor$Snap$Bool$(false))
; [eval] _21$place()
; [eval] constructor$Snap$Bool$(false)
; [eval] compute_address(target_place, target_root_address)
; [eval] Size$Bool$()
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _6$address@152@01
    (compute_address<Address> (as _21$place<Place>  Place) _21$address@39@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _45$address@125@01
    (compute_address<Address> (as _21$place<Place>  Place) _21$address@39@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _5$address@136@01
    (compute_address<Address> (as _21$place<Place>  Place) _21$address@39@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _0$address@0@01
    (compute_address<Address> (as _21$place<Place>  Place) _21$address@39@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  _7$address@157@01
  (compute_address<Address> (as _21$place<Place>  Place) _21$address@39@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _37$address@88@01
    (compute_address<Address> (as _21$place<Place>  Place) _21$address@39@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _20$address@34@01
    (compute_address<Address> (as _21$place<Place>  Place) _21$address@39@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  _21$address@39@01
  (compute_address<Address> (as _21$place<Place>  Place) _21$address@39@01))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [eval] valid$Snap$Bool(source_snapshot)
(declare-const $t@430@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _21$snapshot$1 == constructor$Snap$Bool$(false)
(declare-const $t@431@01 $Snap)
(assert (= $t@431@01 $Snap.unit))
; [eval] _21$snapshot$1 == constructor$Snap$Bool$(false)
; [eval] constructor$Snap$Bool$(false)
(assert (= _21$snapshot$1@41@01 (constructor$Snap$Bool$<Snap$Bool> false)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; label label_bb11
; [exec]
; label_bb11$marker := true
; [exec]
; inhale basic_block_marker$label_bb11$marker()
(declare-const $t@432@01 $Snap)
(assert (= $t@432@01 $Snap.unit))
; [eval] basic_block_marker$label_bb11$marker()
(assert (as basic_block_marker$label_bb11$marker<Bool>  Bool))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; write_place_constant$Tuple$$$(_20$place(), _20$address, constructor$Snap$Tuple$$$$())
; [eval] _20$place()
; [eval] constructor$Snap$Tuple$$$$()
; [eval] compute_address(target_place, target_root_address)
; [eval] Size$Tuple$$$$()
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  _20$address@34@01
  (compute_address<Address> (as _20$place<Place>  Place) _20$address@34@01))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [eval] valid$Snap$Tuple$$$(source_snapshot)
(declare-const $t@433@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _20$snapshot$1 == constructor$Snap$Tuple$$$$()
(declare-const $t@434@01 $Snap)
(assert (= $t@434@01 $Snap.unit))
; [eval] _20$snapshot$1 == constructor$Snap$Tuple$$$$()
; [eval] constructor$Snap$Tuple$$$$()
(assert (=
  _20$snapshot$1@36@01
  (as constructor$Snap$Tuple$$$$<Snap$Tuple$$$>  Snap$Tuple$$$)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; label label_bb12
; [exec]
; label_bb12$marker := true
; [exec]
; inhale basic_block_marker$label_bb12$marker()
(declare-const $t@435@01 $Snap)
(assert (= $t@435@01 $Snap.unit))
; [eval] basic_block_marker$label_bb12$marker()
(assert (as basic_block_marker$label_bb12$marker<Bool>  Bool))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; into_memory_block$Bool(_21$place(), _21$address, _21$snapshot$1)
; [eval] _21$place()
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (constructor$Snap$Bool$<Snap$Bool> false) _21$snapshot$1@41@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [eval] compute_address(place, root_address)
; [eval] Size$Bool$()
(declare-const $t@436@01 $Snap)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _37$address@88@01
    (compute_address<Address> (as _21$place<Place>  Place) _21$address@39@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  _7$address@157@01
  (compute_address<Address> (as _21$place<Place>  Place) _21$address@39@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _0$address@0@01
    (compute_address<Address> (as _21$place<Place>  Place) _21$address@39@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _5$address@136@01
    (compute_address<Address> (as _21$place<Place>  Place) _21$address@39@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _45$address@125@01
    (compute_address<Address> (as _21$place<Place>  Place) _21$address@39@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _6$address@152@01
    (compute_address<Address> (as _21$place<Place>  Place) _21$address@39@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; exhale acc(MemoryBlock(_21$address, Size$Bool$()), write)
; [eval] Size$Bool$()
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _21$place<Place>  Place) _21$address@39@01)
  _21$address@39@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(MemoryBlockStackDrop(_21$address, Size$Bool$()), write)
; [eval] Size$Bool$()
; [exec]
; into_memory_block$Tuple$$$(_20$place(), _20$address, _20$snapshot$1)
; [eval] _20$place()
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  (as constructor$Snap$Tuple$$$$<Snap$Tuple$$$>  Snap$Tuple$$$)
  _20$snapshot$1@36@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [eval] compute_address(place, root_address)
; [eval] Size$Tuple$$$$()
(declare-const $t@437@01 $Snap)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  _6$address@152@01
  (compute_address<Address> (as _20$place<Place>  Place) _20$address@34@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _45$address@125@01
    (compute_address<Address> (as _20$place<Place>  Place) _20$address@34@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  _5$address@136@01
  (compute_address<Address> (as _20$place<Place>  Place) _20$address@34@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _0$address@0@01
    (compute_address<Address> (as _20$place<Place>  Place) _20$address@34@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _7$address@157@01
    (compute_address<Address> (as _20$place<Place>  Place) _20$address@34@01))
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _37$address@88@01
    (compute_address<Address> (as _20$place<Place>  Place) _20$address@34@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; exhale acc(MemoryBlock(_20$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _20$place<Place>  Place) _20$address@34@01)
  _20$address@34@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(MemoryBlockStackDrop(_20$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
; [exec]
; inhale acc(MemoryBlock(_24$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
(declare-const $t@438@01 $Snap)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _37$address@88@01 _24$address@44@01)
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _7$address@157@01 _24$address@44@01)
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _0$address@0@01 _24$address@44@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= _5$address@136@01 _24$address@44@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _45$address@125@01 _24$address@44@01)
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= _6$address@152@01 _24$address@44@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlockStackDrop(_24$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
(declare-const $t@439@01 $Snap)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _4$address@105@01 _24$address@44@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _2$address@27@01 _24$address@44@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _3$address@59@01 _24$address@44@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= _5$address@136@01 _24$address@44@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _7$address@157@01 _24$address@44@01)
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlock(_25$address, Size$Bool$()), write)
; [eval] Size$Bool$()
(declare-const $t@440@01 $Snap)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _24$address@44@01 _25$address@49@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _37$address@88@01 _25$address@49@01)
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= _7$address@157@01 _25$address@49@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _0$address@0@01 _25$address@49@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _5$address@136@01 _25$address@49@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _45$address@125@01 _25$address@49@01)
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _6$address@152@01 _25$address@49@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlockStackDrop(_25$address, Size$Bool$()), write)
; [eval] Size$Bool$()
(declare-const $t@441@01 $Snap)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _24$address@44@01 _25$address@49@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _4$address@105@01 _25$address@49@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _2$address@27@01 _25$address@49@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _3$address@59@01 _25$address@49@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _5$address@136@01 _25$address@49@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= _7$address@157@01 _25$address@49@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; write_place_constant$Bool(_25$place(), _25$address, constructor$Snap$Bool$(false))
; [eval] _25$place()
; [eval] constructor$Snap$Bool$(false)
; [eval] compute_address(target_place, target_root_address)
; [eval] Size$Bool$()
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _6$address@152@01
    (compute_address<Address> (as _25$place<Place>  Place) _25$address@49@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _45$address@125@01
    (compute_address<Address> (as _25$place<Place>  Place) _25$address@49@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _5$address@136@01
    (compute_address<Address> (as _25$place<Place>  Place) _25$address@49@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _0$address@0@01
    (compute_address<Address> (as _25$place<Place>  Place) _25$address@49@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  _7$address@157@01
  (compute_address<Address> (as _25$place<Place>  Place) _25$address@49@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _37$address@88@01
    (compute_address<Address> (as _25$place<Place>  Place) _25$address@49@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _24$address@44@01
    (compute_address<Address> (as _25$place<Place>  Place) _25$address@49@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  _25$address@49@01
  (compute_address<Address> (as _25$place<Place>  Place) _25$address@49@01))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [eval] valid$Snap$Bool(source_snapshot)
(declare-const $t@442@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _25$snapshot$1 == constructor$Snap$Bool$(false)
(declare-const $t@443@01 $Snap)
(assert (= $t@443@01 $Snap.unit))
; [eval] _25$snapshot$1 == constructor$Snap$Bool$(false)
; [eval] constructor$Snap$Bool$(false)
(assert (= _25$snapshot$1@51@01 (constructor$Snap$Bool$<Snap$Bool> false)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; label label_bb14
; [exec]
; label_bb14$marker := true
; [exec]
; inhale basic_block_marker$label_bb14$marker()
(declare-const $t@444@01 $Snap)
(assert (= $t@444@01 $Snap.unit))
; [eval] basic_block_marker$label_bb14$marker()
(assert (as basic_block_marker$label_bb14$marker<Bool>  Bool))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; write_place_constant$Tuple$$$(_24$place(), _24$address, constructor$Snap$Tuple$$$$())
; [eval] _24$place()
; [eval] constructor$Snap$Tuple$$$$()
; [eval] compute_address(target_place, target_root_address)
; [eval] Size$Tuple$$$$()
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  _24$address@44@01
  (compute_address<Address> (as _24$place<Place>  Place) _24$address@44@01))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [eval] valid$Snap$Tuple$$$(source_snapshot)
(declare-const $t@445@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _24$snapshot$1 == constructor$Snap$Tuple$$$$()
(declare-const $t@446@01 $Snap)
(assert (= $t@446@01 $Snap.unit))
; [eval] _24$snapshot$1 == constructor$Snap$Tuple$$$$()
; [eval] constructor$Snap$Tuple$$$$()
(assert (=
  _24$snapshot$1@46@01
  (as constructor$Snap$Tuple$$$$<Snap$Tuple$$$>  Snap$Tuple$$$)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; label label_bb15
; [exec]
; label_bb15$marker := true
; [exec]
; inhale basic_block_marker$label_bb15$marker()
(declare-const $t@447@01 $Snap)
(assert (= $t@447@01 $Snap.unit))
; [eval] basic_block_marker$label_bb15$marker()
(assert (as basic_block_marker$label_bb15$marker<Bool>  Bool))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; into_memory_block$Bool(_25$place(), _25$address, _25$snapshot$1)
; [eval] _25$place()
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (constructor$Snap$Bool$<Snap$Bool> false) _25$snapshot$1@51@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [eval] compute_address(place, root_address)
; [eval] Size$Bool$()
(declare-const $t@448@01 $Snap)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _37$address@88@01
    (compute_address<Address> (as _25$place<Place>  Place) _25$address@49@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  _7$address@157@01
  (compute_address<Address> (as _25$place<Place>  Place) _25$address@49@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _0$address@0@01
    (compute_address<Address> (as _25$place<Place>  Place) _25$address@49@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _5$address@136@01
    (compute_address<Address> (as _25$place<Place>  Place) _25$address@49@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _45$address@125@01
    (compute_address<Address> (as _25$place<Place>  Place) _25$address@49@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _6$address@152@01
    (compute_address<Address> (as _25$place<Place>  Place) _25$address@49@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; exhale acc(MemoryBlock(_25$address, Size$Bool$()), write)
; [eval] Size$Bool$()
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _25$place<Place>  Place) _25$address@49@01)
  _25$address@49@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(MemoryBlockStackDrop(_25$address, Size$Bool$()), write)
; [eval] Size$Bool$()
; [exec]
; into_memory_block$Tuple$$$(_24$place(), _24$address, _24$snapshot$1)
; [eval] _24$place()
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  (as constructor$Snap$Tuple$$$$<Snap$Tuple$$$>  Snap$Tuple$$$)
  _24$snapshot$1@46@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [eval] compute_address(place, root_address)
; [eval] Size$Tuple$$$$()
(declare-const $t@449@01 $Snap)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  _6$address@152@01
  (compute_address<Address> (as _24$place<Place>  Place) _24$address@44@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _45$address@125@01
    (compute_address<Address> (as _24$place<Place>  Place) _24$address@44@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  _5$address@136@01
  (compute_address<Address> (as _24$place<Place>  Place) _24$address@44@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _0$address@0@01
    (compute_address<Address> (as _24$place<Place>  Place) _24$address@44@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _7$address@157@01
    (compute_address<Address> (as _24$place<Place>  Place) _24$address@44@01))
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _37$address@88@01
    (compute_address<Address> (as _24$place<Place>  Place) _24$address@44@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; exhale acc(MemoryBlock(_24$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _24$place<Place>  Place) _24$address@44@01)
  _24$address@44@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(MemoryBlockStackDrop(_24$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
; [exec]
; inhale acc(MemoryBlock(_29$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
(declare-const $t@450@01 $Snap)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _37$address@88@01 _29$address@54@01)
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _7$address@157@01 _29$address@54@01)
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _0$address@0@01 _29$address@54@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= _5$address@136@01 _29$address@54@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _45$address@125@01 _29$address@54@01)
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= _6$address@152@01 _29$address@54@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlockStackDrop(_29$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
(declare-const $t@451@01 $Snap)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _4$address@105@01 _29$address@54@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _2$address@27@01 _29$address@54@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _3$address@59@01 _29$address@54@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= _5$address@136@01 _29$address@54@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _7$address@157@01 _29$address@54@01)
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlock(_30$address, Size$Bool$()), write)
; [eval] Size$Bool$()
(declare-const $t@452@01 $Snap)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _29$address@54@01 _30$address@67@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _37$address@88@01 _30$address@67@01)
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= _7$address@157@01 _30$address@67@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _0$address@0@01 _30$address@67@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _5$address@136@01 _30$address@67@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _45$address@125@01 _30$address@67@01)
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _6$address@152@01 _30$address@67@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlockStackDrop(_30$address, Size$Bool$()), write)
; [eval] Size$Bool$()
(declare-const $t@453@01 $Snap)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _29$address@54@01 _30$address@67@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _4$address@105@01 _30$address@67@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _2$address@27@01 _30$address@67@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _3$address@59@01 _30$address@67@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _5$address@136@01 _30$address@67@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= _7$address@157@01 _30$address@67@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; write_place_constant$Bool(_30$place(), _30$address, constructor$Snap$Bool$(false))
; [eval] _30$place()
; [eval] constructor$Snap$Bool$(false)
; [eval] compute_address(target_place, target_root_address)
; [eval] Size$Bool$()
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _6$address@152@01
    (compute_address<Address> (as _30$place<Place>  Place) _30$address@67@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _45$address@125@01
    (compute_address<Address> (as _30$place<Place>  Place) _30$address@67@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _5$address@136@01
    (compute_address<Address> (as _30$place<Place>  Place) _30$address@67@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _0$address@0@01
    (compute_address<Address> (as _30$place<Place>  Place) _30$address@67@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  _7$address@157@01
  (compute_address<Address> (as _30$place<Place>  Place) _30$address@67@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _37$address@88@01
    (compute_address<Address> (as _30$place<Place>  Place) _30$address@67@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _29$address@54@01
    (compute_address<Address> (as _30$place<Place>  Place) _30$address@67@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  _30$address@67@01
  (compute_address<Address> (as _30$place<Place>  Place) _30$address@67@01))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [eval] valid$Snap$Bool(source_snapshot)
(declare-const $t@454@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _30$snapshot$1 == constructor$Snap$Bool$(false)
(declare-const $t@455@01 $Snap)
(assert (= $t@455@01 $Snap.unit))
; [eval] _30$snapshot$1 == constructor$Snap$Bool$(false)
; [eval] constructor$Snap$Bool$(false)
(assert (= _30$snapshot$1@69@01 (constructor$Snap$Bool$<Snap$Bool> false)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; label label_bb17
; [exec]
; label_bb17$marker := true
; [exec]
; inhale basic_block_marker$label_bb17$marker()
(declare-const $t@456@01 $Snap)
(assert (= $t@456@01 $Snap.unit))
; [eval] basic_block_marker$label_bb17$marker()
(assert (as basic_block_marker$label_bb17$marker<Bool>  Bool))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; write_place_constant$Tuple$$$(_29$place(), _29$address, constructor$Snap$Tuple$$$$())
; [eval] _29$place()
; [eval] constructor$Snap$Tuple$$$$()
; [eval] compute_address(target_place, target_root_address)
; [eval] Size$Tuple$$$$()
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  _29$address@54@01
  (compute_address<Address> (as _29$place<Place>  Place) _29$address@54@01))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [eval] valid$Snap$Tuple$$$(source_snapshot)
(declare-const $t@457@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _29$snapshot$1 == constructor$Snap$Tuple$$$$()
(declare-const $t@458@01 $Snap)
(assert (= $t@458@01 $Snap.unit))
; [eval] _29$snapshot$1 == constructor$Snap$Tuple$$$$()
; [eval] constructor$Snap$Tuple$$$$()
(assert (=
  _29$snapshot$1@56@01
  (as constructor$Snap$Tuple$$$$<Snap$Tuple$$$>  Snap$Tuple$$$)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; label label_bb18
; [exec]
; label_bb18$marker := true
; [exec]
; inhale basic_block_marker$label_bb18$marker()
(declare-const $t@459@01 $Snap)
(assert (= $t@459@01 $Snap.unit))
; [eval] basic_block_marker$label_bb18$marker()
(assert (as basic_block_marker$label_bb18$marker<Bool>  Bool))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; into_memory_block$Bool(_30$place(), _30$address, _30$snapshot$1)
; [eval] _30$place()
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (constructor$Snap$Bool$<Snap$Bool> false) _30$snapshot$1@69@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [eval] compute_address(place, root_address)
; [eval] Size$Bool$()
(declare-const $t@460@01 $Snap)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _37$address@88@01
    (compute_address<Address> (as _30$place<Place>  Place) _30$address@67@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  _7$address@157@01
  (compute_address<Address> (as _30$place<Place>  Place) _30$address@67@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _0$address@0@01
    (compute_address<Address> (as _30$place<Place>  Place) _30$address@67@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _5$address@136@01
    (compute_address<Address> (as _30$place<Place>  Place) _30$address@67@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _45$address@125@01
    (compute_address<Address> (as _30$place<Place>  Place) _30$address@67@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _6$address@152@01
    (compute_address<Address> (as _30$place<Place>  Place) _30$address@67@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; exhale acc(MemoryBlock(_30$address, Size$Bool$()), write)
; [eval] Size$Bool$()
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _30$place<Place>  Place) _30$address@67@01)
  _30$address@67@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(MemoryBlockStackDrop(_30$address, Size$Bool$()), write)
; [eval] Size$Bool$()
; [exec]
; into_memory_block$Tuple$$$(_29$place(), _29$address, _29$snapshot$1)
; [eval] _29$place()
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  (as constructor$Snap$Tuple$$$$<Snap$Tuple$$$>  Snap$Tuple$$$)
  _29$snapshot$1@56@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [eval] compute_address(place, root_address)
; [eval] Size$Tuple$$$$()
(declare-const $t@461@01 $Snap)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  _6$address@152@01
  (compute_address<Address> (as _29$place<Place>  Place) _29$address@54@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _45$address@125@01
    (compute_address<Address> (as _29$place<Place>  Place) _29$address@54@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  _5$address@136@01
  (compute_address<Address> (as _29$place<Place>  Place) _29$address@54@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _0$address@0@01
    (compute_address<Address> (as _29$place<Place>  Place) _29$address@54@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _7$address@157@01
    (compute_address<Address> (as _29$place<Place>  Place) _29$address@54@01))
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _37$address@88@01
    (compute_address<Address> (as _29$place<Place>  Place) _29$address@54@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; exhale acc(MemoryBlock(_29$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _29$place<Place>  Place) _29$address@54@01)
  _29$address@54@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(MemoryBlockStackDrop(_29$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
; [exec]
; inhale acc(MemoryBlock(_34$address, Size$I64$()), write)
; [eval] Size$I64$()
(declare-const $t@462@01 $Snap)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _37$address@88@01 _34$address@72@01)
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _7$address@157@01 _34$address@72@01)
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= _0$address@0@01 _34$address@72@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _5$address@136@01 _34$address@72@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _45$address@125@01 _34$address@72@01)
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _6$address@152@01 _34$address@72@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlockStackDrop(_34$address, Size$I64$()), write)
; [eval] Size$I64$()
(declare-const $t@463@01 $Snap)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= _4$address@105@01 _34$address@72@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= _2$address@27@01 _34$address@72@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= _3$address@59@01 _34$address@72@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _5$address@136@01 _34$address@72@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _7$address@157@01 _34$address@72@01)
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlock(_35$address, Size$I64$()), write)
; [eval] Size$I64$()
(declare-const $t@464@01 $Snap)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= _34$address@72@01 _35$address@78@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _37$address@88@01 _35$address@78@01)
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _7$address@157@01 _35$address@78@01)
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= _0$address@0@01 _35$address@78@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _5$address@136@01 _35$address@78@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _45$address@125@01 _35$address@78@01)
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _6$address@152@01 _35$address@78@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlockStackDrop(_35$address, Size$I64$()), write)
; [eval] Size$I64$()
(declare-const $t@465@01 $Snap)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= _34$address@72@01 _35$address@78@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= _4$address@105@01 _35$address@78@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= _2$address@27@01 _35$address@78@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= _3$address@59@01 _35$address@78@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _5$address@136@01 _35$address@78@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _7$address@157@01 _35$address@78@01)
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; copy_place$I64(_35$place(), _35$address, _3$place(), _3$address, _3$snapshot$2,
;   write)
; [eval] _35$place()
; [eval] _3$place()
; [eval] none < source_permission_amount
; [eval] compute_address(target_place, target_root_address)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _6$address@152@01
    (compute_address<Address> (as _35$place<Place>  Place) _35$address@78@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _45$address@125@01
    (compute_address<Address> (as _35$place<Place>  Place) _35$address@78@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _5$address@136@01
    (compute_address<Address> (as _35$place<Place>  Place) _35$address@78@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  _0$address@0@01
  (compute_address<Address> (as _35$place<Place>  Place) _35$address@78@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _7$address@157@01
    (compute_address<Address> (as _35$place<Place>  Place) _35$address@78@01))
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _37$address@88@01
    (compute_address<Address> (as _35$place<Place>  Place) _35$address@78@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  _34$address@72@01
  (compute_address<Address> (as _35$place<Place>  Place) _35$address@78@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  _35$address@78@01
  (compute_address<Address> (as _35$place<Place>  Place) _35$address@78@01))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= fresh_snapshot@390@01 _3$snapshot$2@62@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(declare-const $t@466@01 $Snap)
(assert (= $t@466@01 ($Snap.combine ($Snap.first $t@466@01) ($Snap.second $t@466@01))))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= (as _2$place<Place>  Place) (as _3$place<Place>  Place))
  (= _2$address@27@01 _3$address@59@01)
  (= fresh_snapshot@397@01 _3$snapshot$2@62@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= (as _4$place<Place>  Place) (as _3$place<Place>  Place))
  (= _4$address@105@01 _3$address@59@01)
  (= fresh_snapshot@393@01 _3$snapshot$2@62@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= (as _1$place<Place>  Place) (as _3$place<Place>  Place))
  (= _1$address@4@01 _3$address@59@01)
  (= _1$snapshot$0@5@01 _3$snapshot$2@62@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second $t@466@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@466@01))
    ($Snap.second ($Snap.second $t@466@01)))))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= (as _1$place<Place>  Place) (as _35$place<Place>  Place))
  (= _1$address@4@01 _35$address@78@01)
  (= _1$snapshot$0@5@01 _3$snapshot$2@62@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= (as _4$place<Place>  Place) (as _35$place<Place>  Place))
  (= _4$address@105@01 _35$address@78@01)
  (= fresh_snapshot@393@01 _3$snapshot$2@62@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= (as _2$place<Place>  Place) (as _35$place<Place>  Place))
  (= _2$address@27@01 _35$address@78@01)
  (= fresh_snapshot@397@01 _3$snapshot$2@62@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= (as _3$place<Place>  Place) (as _35$place<Place>  Place))
  (= _3$address@59@01 _35$address@78@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (= ($Snap.second ($Snap.second $t@466@01)) $Snap.unit))
; [eval] valid$Snap$I64(source_snapshot)
(assert (valid$Snap$I64<Bool> _3$snapshot$2@62@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _35$snapshot$1 == _3$snapshot$2
(declare-const $t@467@01 $Snap)
(assert (= $t@467@01 $Snap.unit))
; [eval] _35$snapshot$1 == _3$snapshot$2
(assert (= _35$snapshot$1@80@01 _3$snapshot$2@62@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlock(_36$address, Size$I64$()), write)
; [eval] Size$I64$()
(declare-const $t@468@01 $Snap)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= _34$address@72@01 _36$address@83@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _37$address@88@01 _36$address@83@01)
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _7$address@157@01 _36$address@83@01)
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= _0$address@0@01 _36$address@83@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _5$address@136@01 _36$address@83@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _45$address@125@01 _36$address@83@01)
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _6$address@152@01 _36$address@83@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlockStackDrop(_36$address, Size$I64$()), write)
; [eval] Size$I64$()
(declare-const $t@469@01 $Snap)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= _35$address@78@01 _36$address@83@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= _34$address@72@01 _36$address@83@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= _4$address@105@01 _36$address@83@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= _2$address@27@01 _36$address@83@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= _3$address@59@01 _36$address@83@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _5$address@136@01 _36$address@83@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _7$address@157@01 _36$address@83@01)
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; copy_place$I64(_36$place(), _36$address, _4$place(), _4$address, _4$snapshot$2,
;   write)
; [eval] _36$place()
; [eval] _4$place()
; [eval] none < source_permission_amount
; [eval] compute_address(target_place, target_root_address)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _6$address@152@01
    (compute_address<Address> (as _36$place<Place>  Place) _36$address@83@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _45$address@125@01
    (compute_address<Address> (as _36$place<Place>  Place) _36$address@83@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _5$address@136@01
    (compute_address<Address> (as _36$place<Place>  Place) _36$address@83@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  _0$address@0@01
  (compute_address<Address> (as _36$place<Place>  Place) _36$address@83@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _7$address@157@01
    (compute_address<Address> (as _36$place<Place>  Place) _36$address@83@01))
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _37$address@88@01
    (compute_address<Address> (as _36$place<Place>  Place) _36$address@83@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  _34$address@72@01
  (compute_address<Address> (as _36$place<Place>  Place) _36$address@83@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  _36$address@83@01
  (compute_address<Address> (as _36$place<Place>  Place) _36$address@83@01))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= (as _35$place<Place>  Place) (as _4$place<Place>  Place))
  (= _35$address@78@01 _4$address@105@01)
  (= _3$snapshot$2@62@01 _4$snapshot$2@108@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= (as _1$place<Place>  Place) (as _4$place<Place>  Place))
  (= _1$address@4@01 _4$address@105@01)
  (= _1$snapshot$0@5@01 _4$snapshot$2@108@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= fresh_snapshot@393@01 _4$snapshot$2@108@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(declare-const $t@470@01 $Snap)
(assert (= $t@470@01 ($Snap.combine ($Snap.first $t@470@01) ($Snap.second $t@470@01))))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= (as _3$place<Place>  Place) (as _4$place<Place>  Place))
  (= _3$address@59@01 _4$address@105@01)
  (= _3$snapshot$2@62@01 _4$snapshot$2@108@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= (as _2$place<Place>  Place) (as _4$place<Place>  Place))
  (= _2$address@27@01 _4$address@105@01)
  (= fresh_snapshot@397@01 _4$snapshot$2@108@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= (as _1$place<Place>  Place) (as _4$place<Place>  Place))
  (= _1$address@4@01 _4$address@105@01)
  (= _1$snapshot$0@5@01 _4$snapshot$2@108@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= (as _35$place<Place>  Place) (as _4$place<Place>  Place))
  (= _35$address@78@01 _4$address@105@01)
  (= _3$snapshot$2@62@01 _4$snapshot$2@108@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second $t@470@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@470@01))
    ($Snap.second ($Snap.second $t@470@01)))))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= (as _35$place<Place>  Place) (as _36$place<Place>  Place))
  (= _35$address@78@01 _36$address@83@01)
  (= _3$snapshot$2@62@01 _4$snapshot$2@108@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= (as _1$place<Place>  Place) (as _36$place<Place>  Place))
  (= _1$address@4@01 _36$address@83@01)
  (= _1$snapshot$0@5@01 _4$snapshot$2@108@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= (as _2$place<Place>  Place) (as _36$place<Place>  Place))
  (= _2$address@27@01 _36$address@83@01)
  (= fresh_snapshot@397@01 _4$snapshot$2@108@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= (as _3$place<Place>  Place) (as _36$place<Place>  Place))
  (= _3$address@59@01 _36$address@83@01)
  (= _3$snapshot$2@62@01 _4$snapshot$2@108@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= (as _4$place<Place>  Place) (as _36$place<Place>  Place))
  (= _4$address@105@01 _36$address@83@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (= ($Snap.second ($Snap.second $t@470@01)) $Snap.unit))
; [eval] valid$Snap$I64(source_snapshot)
(assert (valid$Snap$I64<Bool> _4$snapshot$2@108@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _36$snapshot$1 == _4$snapshot$2
(declare-const $t@471@01 $Snap)
(assert (= $t@471@01 $Snap.unit))
; [eval] _36$snapshot$1 == _4$snapshot$2
(assert (= _36$snapshot$1@85@01 _4$snapshot$2@108@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; tmp$5 := assign$Tuple$$I64$Bool$$I64$Bool$$CheckedBinaryOp$Add$Copy$I64$Copy$I64$$$$(_37$place(),
;   _37$address, _35$place(), _35$address, _35$snapshot$1, _36$place(), _36$address,
;   _36$snapshot$1)
; [eval] _37$place()
; [eval] _35$place()
; [eval] _36$place()
; [eval] compute_address(target_place, target_address)
; [eval] Size$Tuple$$I64$Bool$$I64$Bool$$()
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _6$address@152@01
    (compute_address<Address> (as _37$place<Place>  Place) _37$address@88@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  _45$address@125@01
  (compute_address<Address> (as _37$place<Place>  Place) _37$address@88@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _5$address@136@01
    (compute_address<Address> (as _37$place<Place>  Place) _37$address@88@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _0$address@0@01
    (compute_address<Address> (as _37$place<Place>  Place) _37$address@88@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _7$address@157@01
    (compute_address<Address> (as _37$place<Place>  Place) _37$address@88@01))
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  _37$address@88@01
  (compute_address<Address> (as _37$place<Place>  Place) _37$address@88@01))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= (as _36$place<Place>  Place) (as _35$place<Place>  Place))
  (= _36$address@83@01 _35$address@78@01)
  (= _4$snapshot$2@108@01 _35$snapshot$1@80@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= _3$snapshot$2@62@01 _35$snapshot$1@80@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [eval] valid$Snap$I64(operand1_value)
(set-option :timeout 0)
(push) ; 5
(assert (not (valid$Snap$I64<Bool> _35$snapshot$1@80@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (valid$Snap$I64<Bool> _35$snapshot$1@80@01))
(push) ; 5
(set-option :timeout 10)
(assert (not (= _4$snapshot$2@108@01 _36$snapshot$1@85@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [eval] valid$Snap$I64(operand2_value)
(set-option :timeout 0)
(push) ; 5
(assert (not (valid$Snap$I64<Bool> _36$snapshot$1@85@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (valid$Snap$I64<Bool> _36$snapshot$1@85@01))
(declare-const result_value@472@01 Snap$Tuple$$I64$Bool$$I64$Bool$)
(declare-const $t@473@01 $Snap)
(assert (= $t@473@01 ($Snap.combine ($Snap.first $t@473@01) ($Snap.second $t@473@01))))
; [eval] compute_address(target_place, target_address)
; [eval] PaddingSize$Tuple$$I64$Bool$$I64$Bool$$()
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _34$address@72@01
    (compute_address<Address> (as _37$place<Place>  Place) _37$address@88@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _7$address@157@01
    (compute_address<Address> (as _37$place<Place>  Place) _37$address@88@01))
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _0$address@0@01
    (compute_address<Address> (as _37$place<Place>  Place) _37$address@88@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _5$address@136@01
    (compute_address<Address> (as _37$place<Place>  Place) _37$address@88@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _45$address@125@01
    (compute_address<Address> (as _37$place<Place>  Place) _37$address@88@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _6$address@152@01
    (compute_address<Address> (as _37$place<Place>  Place) _37$address@88@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second $t@473@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@473@01))
    ($Snap.second ($Snap.second $t@473@01)))))
; [eval] field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(compute_address(target_place, target_address))
; [eval] compute_address(target_place, target_address)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _6$address@152@01
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _37$place<Place>  Place) _37$address@88@01)))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _45$address@125@01
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _37$place<Place>  Place) _37$address@88@01)))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _5$address@136@01
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _37$place<Place>  Place) _37$address@88@01)))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  _0$address@0@01
  (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _37$place<Place>  Place) _37$address@88@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _7$address@157@01
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _37$place<Place>  Place) _37$address@88@01)))
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  _34$address@72@01
  (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _37$place<Place>  Place) _37$address@88@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _37$place<Place>  Place) _37$address@88@01)
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _37$place<Place>  Place) _37$address@88@01)))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second $t@473@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@473@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@473@01))))))
; [eval] field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(target_place)
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(result_value)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@473@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@473@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@473@01)))))))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= (as _1$place<Place>  Place) (as _35$place<Place>  Place))
  (= _1$address@4@01 _35$address@78@01)
  (= _1$snapshot$0@5@01 _35$snapshot$1@80@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= (as _2$place<Place>  Place) (as _35$place<Place>  Place))
  (= _2$address@27@01 _35$address@78@01)
  (= fresh_snapshot@397@01 _35$snapshot$1@80@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= (as _3$place<Place>  Place) (as _35$place<Place>  Place))
  (= _3$address@59@01 _35$address@78@01)
  (= _3$snapshot$2@62@01 _35$snapshot$1@80@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= (as _4$place<Place>  Place) (as _35$place<Place>  Place))
  (= _4$address@105@01 _35$address@78@01)
  (= _4$snapshot$2@108@01 _35$snapshot$1@80@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@473@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@473@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@473@01))))))))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= (as _4$place<Place>  Place) (as _36$place<Place>  Place))
  (= _4$address@105@01 _36$address@83@01)
  (= _4$snapshot$2@108@01 _36$snapshot$1@85@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= (as _3$place<Place>  Place) (as _36$place<Place>  Place))
  (= _3$address@59@01 _36$address@83@01)
  (= _3$snapshot$2@62@01 _36$snapshot$1@85@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= (as _2$place<Place>  Place) (as _36$place<Place>  Place))
  (= _2$address@27@01 _36$address@83@01)
  (= fresh_snapshot@397@01 _36$snapshot$1@85@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= (as _1$place<Place>  Place) (as _36$place<Place>  Place))
  (= _1$address@4@01 _36$address@83@01)
  (= _1$snapshot$0@5@01 _36$snapshot$1@85@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= (as _35$place<Place>  Place) (as _36$place<Place>  Place))
  (= _35$address@78@01 _36$address@83@01)
  (= _35$snapshot$1@80@01 _36$snapshot$1@85@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@473@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@473@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@473@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@473@01))))))
  $Snap.unit))
; [eval] valid$Snap$I64(constructor$Snap$I64$Add_I64(operand1_value, operand2_value)) ==> destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(result_value) == constructor$Snap$I64$Add_I64(operand1_value, operand2_value)
; [eval] valid$Snap$I64(constructor$Snap$I64$Add_I64(operand1_value, operand2_value))
; [eval] constructor$Snap$I64$Add_I64(operand1_value, operand2_value)
(set-option :timeout 0)
(push) ; 5
(push) ; 6
(set-option :timeout 10)
(assert (not (not
  (valid$Snap$I64<Bool> (constructor$Snap$I64$Add_I64<Snap$I64> _35$snapshot$1@80@01 _36$snapshot$1@85@01)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (valid$Snap$I64<Bool> (constructor$Snap$I64$Add_I64<Snap$I64> _35$snapshot$1@80@01 _36$snapshot$1@85@01))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [then-branch: 13 | valid$Snap$I64[Bool](constructor$Snap$I64$Add_I64[Snap$I64](_35$snapshot$1@80@01, _36$snapshot$1@85@01)) | live]
; [else-branch: 13 | !(valid$Snap$I64[Bool](constructor$Snap$I64$Add_I64[Snap$I64](_35$snapshot$1@80@01, _36$snapshot$1@85@01))) | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 13 | valid$Snap$I64[Bool](constructor$Snap$I64$Add_I64[Snap$I64](_35$snapshot$1@80@01, _36$snapshot$1@85@01))]
(assert (valid$Snap$I64<Bool> (constructor$Snap$I64$Add_I64<Snap$I64> _35$snapshot$1@80@01 _36$snapshot$1@85@01)))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(result_value) == constructor$Snap$I64$Add_I64(operand1_value, operand2_value)
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(result_value)
; [eval] constructor$Snap$I64$Add_I64(operand1_value, operand2_value)
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (valid$Snap$I64<Bool> (constructor$Snap$I64$Add_I64<Snap$I64> _35$snapshot$1@80@01 _36$snapshot$1@85@01)))
(assert (=>
  (valid$Snap$I64<Bool> (constructor$Snap$I64$Add_I64<Snap$I64> _35$snapshot$1@80@01 _36$snapshot$1@85@01))
  (=
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> result_value@472@01)
    (constructor$Snap$I64$Add_I64<Snap$I64> _35$snapshot$1@80@01 _36$snapshot$1@85@01))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@473@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@473@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@473@01))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@473@01)))))))
  $Snap.unit))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(result_value) == constructor$Snap$Bool$(!valid$Snap$I64(constructor$Snap$I64$Add_I64(operand1_value, operand2_value)))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(result_value)
; [eval] constructor$Snap$Bool$(!valid$Snap$I64(constructor$Snap$I64$Add_I64(operand1_value, operand2_value)))
; [eval] !valid$Snap$I64(constructor$Snap$I64$Add_I64(operand1_value, operand2_value))
; [eval] valid$Snap$I64(constructor$Snap$I64$Add_I64(operand1_value, operand2_value))
; [eval] constructor$Snap$I64$Add_I64(operand1_value, operand2_value)
(assert (=
  (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> result_value@472@01)
  (constructor$Snap$Bool$<Snap$Bool> (not
    (valid$Snap$I64<Bool> (constructor$Snap$I64$Add_I64<Snap$I64> _35$snapshot$1@80@01 _36$snapshot$1@85@01))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@473@01)))))))
  $Snap.unit))
; [eval] MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(compute_address(target_place, target_address)), Size$I64$()) == to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(result_value))
; [eval] MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(compute_address(target_place, target_address)), Size$I64$())
; [eval] field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(compute_address(target_place, target_address))
; [eval] compute_address(target_place, target_address)
; [eval] Size$I64$()
(push) ; 5
(declare-const $k@474@01 $Perm)
(assert ($Perm.isReadVar $k@474@01))
(assert (< $k@474@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@474@01)))
(push) ; 6
(set-option :timeout 10)
(assert (not (< $Perm.No $k@474@01)))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@473@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _37$place<Place>  Place) _37$address@88@01)) (as Size$I64$<Snap$Usize>  Snap$Usize)))
(pop) ; 5
; Joined path conditions
(assert ($Perm.isReadVar $k@474@01))
(assert (and
  (< $k@474@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@474@01))
  (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@473@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _37$place<Place>  Place) _37$address@88@01)) (as Size$I64$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(result_value))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(result_value)
(assert (=
  (MemoryBlock$bytes ($Snap.first ($Snap.second $t@473@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _37$place<Place>  Place) _37$address@88@01)) (as Size$I64$<Snap$Usize>  Snap$Usize))
  (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> result_value@472@01))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _37$snapshot$1 == tmp$5
(declare-const $t@475@01 $Snap)
(assert (= $t@475@01 $Snap.unit))
; [eval] _37$snapshot$1 == tmp$5
(assert (= _37$snapshot$1@90@01 result_value@472@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [eval] !destructor$Snap$Bool$$value(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(_37$snapshot$1))
; [eval] destructor$Snap$Bool$$value(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(_37$snapshot$1))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(_37$snapshot$1)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (destructor$Snap$Bool$$value<Bool> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> _37$snapshot$1@90@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  (destructor$Snap$Bool$$value<Bool> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> _37$snapshot$1@90@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [then-branch: 14 | !(destructor$Snap$Bool$$value[Bool](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](_37$snapshot$1@90@01))) | live]
; [else-branch: 14 | destructor$Snap$Bool$$value[Bool](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](_37$snapshot$1@90@01)) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 14 | !(destructor$Snap$Bool$$value[Bool](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](_37$snapshot$1@90@01)))]
(assert (not
  (destructor$Snap$Bool$$value<Bool> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> _37$snapshot$1@90@01))))
; [exec]
; label label_bb19
; [exec]
; label_bb19$marker := true
; [exec]
; inhale basic_block_marker$label_bb19$marker()
(declare-const $t@476@01 $Snap)
(assert (= $t@476@01 $Snap.unit))
; [eval] basic_block_marker$label_bb19$marker()
(assert (as basic_block_marker$label_bb19$marker<Bool>  Bool))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; fold acc(OwnedNonAliased$I64(field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(_37$place()),
;   _37$address, destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(_37$snapshot$1)), write)
; [eval] field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(_37$place())
; [eval] _37$place()
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(_37$snapshot$1)
; [eval] valid$Snap$I64(snapshot)
(set-option :timeout 0)
(push) ; 6
(assert (not (valid$Snap$I64<Bool> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _37$snapshot$1@90@01))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (valid$Snap$I64<Bool> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _37$snapshot$1@90@01)))
; [eval] compute_address(place, root_address)
; [eval] Size$I64$()
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _37$place<Place>  Place) _37$address@88@01)
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _37$place<Place>  Place)) _37$address@88@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  _34$address@72@01
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _37$place<Place>  Place)) _37$address@88@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    _7$address@157@01
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _37$place<Place>  Place)) _37$address@88@01))
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  _0$address@0@01
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _37$place<Place>  Place)) _37$address@88@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    _5$address@136@01
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _37$place<Place>  Place)) _37$address@88@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    _45$address@125@01
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _37$place<Place>  Place)) _37$address@88@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    _6$address@152@01
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _37$place<Place>  Place)) _37$address@88@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _37$place<Place>  Place) _37$address@88@01))
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _37$place<Place>  Place)) _37$address@88@01))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [eval] MemoryBlock$bytes(compute_address(place, root_address), Size$I64$()) == to_bytes$I64(snapshot)
; [eval] MemoryBlock$bytes(compute_address(place, root_address), Size$I64$())
; [eval] compute_address(place, root_address)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 6
(declare-const $k@477@01 $Perm)
(assert ($Perm.isReadVar $k@477@01))
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _37$place<Place>  Place) _37$address@88@01)
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _37$place<Place>  Place)) _37$address@88@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  _34$address@72@01
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _37$place<Place>  Place)) _37$address@88@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (=
    _7$address@157@01
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _37$place<Place>  Place)) _37$address@88@01))
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  _0$address@0@01
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _37$place<Place>  Place)) _37$address@88@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (=
    _5$address@136@01
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _37$place<Place>  Place)) _37$address@88@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (=
    _45$address@125@01
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _37$place<Place>  Place)) _37$address@88@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (=
    _6$address@152@01
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _37$place<Place>  Place)) _37$address@88@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _37$place<Place>  Place) _37$address@88@01))
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _37$place<Place>  Place)) _37$address@88@01))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (< $k@477@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@477@01)))
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.No $k@477@01)))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@473@01)) (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _37$place<Place>  Place)) _37$address@88@01) (as Size$I64$<Snap$Usize>  Snap$Usize)))
(pop) ; 6
; Joined path conditions
(assert ($Perm.isReadVar $k@477@01))
(assert (and
  (< $k@477@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@477@01))
  (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@473@01)) (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _37$place<Place>  Place)) _37$address@88@01) (as Size$I64$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$I64(snapshot)
(set-option :timeout 0)
(push) ; 6
(assert (not (=
  (MemoryBlock$bytes ($Snap.first ($Snap.second $t@473@01)) (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _37$place<Place>  Place)) _37$address@88@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
  (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _37$snapshot$1@90@01)))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (=
  (MemoryBlock$bytes ($Snap.first ($Snap.second $t@473@01)) (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _37$place<Place>  Place)) _37$address@88@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
  (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _37$snapshot$1@90@01))))
(assert (OwnedNonAliased$I64%trigger ($Snap.combine
  $Snap.unit
  ($Snap.combine ($Snap.first ($Snap.second $t@473@01)) $Snap.unit)) (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _37$place<Place>  Place)) _37$address@88@01 (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _37$snapshot$1@90@01)))
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    (as _35$place<Place>  Place)
    (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _37$place<Place>  Place)))
  (= _35$address@78@01 _37$address@88@01)
  (=
    _35$snapshot$1@80@01
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _37$snapshot$1@90@01)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    (as _1$place<Place>  Place)
    (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _37$place<Place>  Place)))
  (= _1$address@4@01 _37$address@88@01)
  (=
    _1$snapshot$0@5@01
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _37$snapshot$1@90@01)))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    (as _2$place<Place>  Place)
    (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _37$place<Place>  Place)))
  (= _2$address@27@01 _37$address@88@01)
  (=
    fresh_snapshot@397@01
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _37$snapshot$1@90@01)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    (as _3$place<Place>  Place)
    (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _37$place<Place>  Place)))
  (= _3$address@59@01 _37$address@88@01)
  (=
    _3$snapshot$2@62@01
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _37$snapshot$1@90@01)))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    (as _4$place<Place>  Place)
    (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _37$place<Place>  Place)))
  (= _4$address@105@01 _37$address@88@01)
  (=
    _4$snapshot$2@108@01
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _37$snapshot$1@90@01)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    (as _36$place<Place>  Place)
    (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _37$place<Place>  Place)))
  (= _36$address@83@01 _37$address@88@01)
  (=
    _36$snapshot$1@85@01
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _37$snapshot$1@90@01)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [exec]
; move_place$I64(_34$place(), _34$address, field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(_37$place()),
;   _37$address, destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(_37$snapshot$1))
; [eval] _34$place()
; [eval] field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(_37$place())
; [eval] _37$place()
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(_37$snapshot$1)
; [eval] compute_address(target_place, target_root_address)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    _6$address@152@01
    (compute_address<Address> (as _34$place<Place>  Place) _34$address@72@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    _45$address@125@01
    (compute_address<Address> (as _34$place<Place>  Place) _34$address@72@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    _5$address@136@01
    (compute_address<Address> (as _34$place<Place>  Place) _34$address@72@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  _0$address@0@01
  (compute_address<Address> (as _34$place<Place>  Place) _34$address@72@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    _7$address@157@01
    (compute_address<Address> (as _34$place<Place>  Place) _34$address@72@01))
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  _34$address@72@01
  (compute_address<Address> (as _34$place<Place>  Place) _34$address@72@01))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(declare-const $t@478@01 $Snap)
(assert (= $t@478@01 ($Snap.combine ($Snap.first $t@478@01) ($Snap.second $t@478@01))))
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= (as _36$place<Place>  Place) (as _34$place<Place>  Place))
  (= _36$address@83@01 _34$address@72@01)
  (=
    _36$snapshot$1@85@01
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _37$snapshot$1@90@01)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= (as _4$place<Place>  Place) (as _34$place<Place>  Place))
  (= _4$address@105@01 _34$address@72@01)
  (=
    _4$snapshot$2@108@01
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _37$snapshot$1@90@01)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= (as _3$place<Place>  Place) (as _34$place<Place>  Place))
  (= _3$address@59@01 _34$address@72@01)
  (=
    _3$snapshot$2@62@01
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _37$snapshot$1@90@01)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= (as _2$place<Place>  Place) (as _34$place<Place>  Place))
  (= _2$address@27@01 _34$address@72@01)
  (=
    fresh_snapshot@397@01
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _37$snapshot$1@90@01)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= (as _1$place<Place>  Place) (as _34$place<Place>  Place))
  (= _1$address@4@01 _34$address@72@01)
  (=
    _1$snapshot$0@5@01
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _37$snapshot$1@90@01)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= (as _35$place<Place>  Place) (as _34$place<Place>  Place))
  (= _35$address@78@01 _34$address@72@01)
  (=
    _35$snapshot$1@80@01
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _37$snapshot$1@90@01)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second $t@478@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@478@01))
    ($Snap.second ($Snap.second $t@478@01)))))
; [eval] compute_address(source_place, source_root_address)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    _6$address@152@01
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _37$place<Place>  Place)) _37$address@88@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    _45$address@125@01
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _37$place<Place>  Place)) _37$address@88@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    _5$address@136@01
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _37$place<Place>  Place)) _37$address@88@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  _0$address@0@01
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _37$place<Place>  Place)) _37$address@88@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    _7$address@157@01
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _37$place<Place>  Place)) _37$address@88@01))
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _37$place<Place>  Place) _37$address@88@01)
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _37$place<Place>  Place)) _37$address@88@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (= ($Snap.second ($Snap.second $t@478@01)) $Snap.unit))
; [eval] valid$Snap$I64(source_snapshot)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _34$snapshot$1 ==
;   destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(_37$snapshot$1)
(declare-const $t@479@01 $Snap)
(assert (= $t@479@01 $Snap.unit))
; [eval] _34$snapshot$1 == destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(_37$snapshot$1)
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(_37$snapshot$1)
(assert (=
  _34$snapshot$1@74@01
  (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _37$snapshot$1@90@01)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; into_memory_block$I64(_36$place(), _36$address, _36$snapshot$1)
; [eval] _36$place()
; [eval] compute_address(place, root_address)
; [eval] Size$I64$()
(declare-const $t@480@01 $Snap)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _37$place<Place>  Place) _37$address@88@01)
    (compute_address<Address> (as _36$place<Place>  Place) _36$address@83@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    _7$address@157@01
    (compute_address<Address> (as _36$place<Place>  Place) _36$address@83@01))
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  _0$address@0@01
  (compute_address<Address> (as _36$place<Place>  Place) _36$address@83@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    _5$address@136@01
    (compute_address<Address> (as _36$place<Place>  Place) _36$address@83@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    _45$address@125@01
    (compute_address<Address> (as _36$place<Place>  Place) _36$address@83@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    _6$address@152@01
    (compute_address<Address> (as _36$place<Place>  Place) _36$address@83@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _37$place<Place>  Place)) _37$address@88@01)
  (compute_address<Address> (as _36$place<Place>  Place) _36$address@83@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; exhale acc(MemoryBlock(_36$address, Size$I64$()), write)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _36$place<Place>  Place) _36$address@83@01)
  _36$address@83@01)))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(MemoryBlockStackDrop(_36$address, Size$I64$()), write)
; [eval] Size$I64$()
; [exec]
; into_memory_block$I64(_35$place(), _35$address, _35$snapshot$1)
; [eval] _35$place()
; [eval] compute_address(place, root_address)
; [eval] Size$I64$()
(declare-const $t@481@01 $Snap)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _37$place<Place>  Place)) _37$address@88@01)
  (compute_address<Address> (as _35$place<Place>  Place) _35$address@78@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    _6$address@152@01
    (compute_address<Address> (as _35$place<Place>  Place) _35$address@78@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    _45$address@125@01
    (compute_address<Address> (as _35$place<Place>  Place) _35$address@78@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    _5$address@136@01
    (compute_address<Address> (as _35$place<Place>  Place) _35$address@78@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  _0$address@0@01
  (compute_address<Address> (as _35$place<Place>  Place) _35$address@78@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    _7$address@157@01
    (compute_address<Address> (as _35$place<Place>  Place) _35$address@78@01))
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _37$place<Place>  Place) _37$address@88@01)
    (compute_address<Address> (as _35$place<Place>  Place) _35$address@78@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; exhale acc(MemoryBlock(_35$address, Size$I64$()), write)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _35$place<Place>  Place) _35$address@78@01)
  _35$address@78@01)))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(MemoryBlockStackDrop(_35$address, Size$I64$()), write)
; [eval] Size$I64$()
; [exec]
; inhale acc(MemoryBlock(_38$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
(declare-const $t@482@01 $Snap)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _37$place<Place>  Place) _37$address@88@01)
    _38$address@93@01)
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= _7$address@157@01 _38$address@93@01)
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= _0$address@0@01 _38$address@93@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= _5$address@136@01 _38$address@93@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= _45$address@125@01 _38$address@93@01)
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= _6$address@152@01 _38$address@93@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _37$place<Place>  Place)) _37$address@88@01)
    _38$address@93@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlockStackDrop(_38$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
(declare-const $t@483@01 $Snap)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= _34$address@72@01 _38$address@93@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= _4$address@105@01 _38$address@93@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= _2$address@27@01 _38$address@93@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= _3$address@59@01 _38$address@93@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= _5$address@136@01 _38$address@93@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= _7$address@157@01 _38$address@93@01)
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlock(_39$address, Size$Bool$()), write)
; [eval] Size$Bool$()
(declare-const $t@484@01 $Snap)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= _38$address@93@01 _39$address@99@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _37$place<Place>  Place) _37$address@88@01)
    _39$address@99@01)
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= _7$address@157@01 _39$address@99@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= _0$address@0@01 _39$address@99@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= _5$address@136@01 _39$address@99@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= _45$address@125@01 _39$address@99@01)
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= _6$address@152@01 _39$address@99@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _37$place<Place>  Place)) _37$address@88@01)
    _39$address@99@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlockStackDrop(_39$address, Size$Bool$()), write)
; [eval] Size$Bool$()
(declare-const $t@485@01 $Snap)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= _38$address@93@01 _39$address@99@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= _34$address@72@01 _39$address@99@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= _4$address@105@01 _39$address@99@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= _2$address@27@01 _39$address@99@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= _3$address@59@01 _39$address@99@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= _5$address@136@01 _39$address@99@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= _7$address@157@01 _39$address@99@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; write_place_constant$Bool(_39$place(), _39$address, constructor$Snap$Bool$(false))
; [eval] _39$place()
; [eval] constructor$Snap$Bool$(false)
; [eval] compute_address(target_place, target_root_address)
; [eval] Size$Bool$()
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _37$place<Place>  Place)) _37$address@88@01)
    (compute_address<Address> (as _39$place<Place>  Place) _39$address@99@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    _6$address@152@01
    (compute_address<Address> (as _39$place<Place>  Place) _39$address@99@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    _45$address@125@01
    (compute_address<Address> (as _39$place<Place>  Place) _39$address@99@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    _5$address@136@01
    (compute_address<Address> (as _39$place<Place>  Place) _39$address@99@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    _0$address@0@01
    (compute_address<Address> (as _39$place<Place>  Place) _39$address@99@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  _7$address@157@01
  (compute_address<Address> (as _39$place<Place>  Place) _39$address@99@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _37$place<Place>  Place) _37$address@88@01)
    (compute_address<Address> (as _39$place<Place>  Place) _39$address@99@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    _38$address@93@01
    (compute_address<Address> (as _39$place<Place>  Place) _39$address@99@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  _39$address@99@01
  (compute_address<Address> (as _39$place<Place>  Place) _39$address@99@01))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [eval] valid$Snap$Bool(source_snapshot)
(declare-const $t@486@01 $Snap)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _37$place<Place>  Place))
    (as _39$place<Place>  Place))
  (= _37$address@88@01 _39$address@99@01)
  (=
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> result_value@472@01)
    (constructor$Snap$Bool$<Snap$Bool> false)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _39$snapshot$1 == constructor$Snap$Bool$(false)
(declare-const $t@487@01 $Snap)
(assert (= $t@487@01 $Snap.unit))
; [eval] _39$snapshot$1 == constructor$Snap$Bool$(false)
; [eval] constructor$Snap$Bool$(false)
(assert (= _39$snapshot$1@101@01 (constructor$Snap$Bool$<Snap$Bool> false)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; label label_bb21
; [exec]
; label_bb21$marker := true
; [exec]
; inhale basic_block_marker$label_bb21$marker()
(declare-const $t@488@01 $Snap)
(assert (= $t@488@01 $Snap.unit))
; [eval] basic_block_marker$label_bb21$marker()
(assert (as basic_block_marker$label_bb21$marker<Bool>  Bool))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; write_place_constant$Tuple$$$(_38$place(), _38$address, constructor$Snap$Tuple$$$$())
; [eval] _38$place()
; [eval] constructor$Snap$Tuple$$$$()
; [eval] compute_address(target_place, target_root_address)
; [eval] Size$Tuple$$$$()
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  _38$address@93@01
  (compute_address<Address> (as _38$place<Place>  Place) _38$address@93@01))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [eval] valid$Snap$Tuple$$$(source_snapshot)
(declare-const $t@489@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _38$snapshot$1 == constructor$Snap$Tuple$$$$()
(declare-const $t@490@01 $Snap)
(assert (= $t@490@01 $Snap.unit))
; [eval] _38$snapshot$1 == constructor$Snap$Tuple$$$$()
; [eval] constructor$Snap$Tuple$$$$()
(assert (=
  _38$snapshot$1@95@01
  (as constructor$Snap$Tuple$$$$<Snap$Tuple$$$>  Snap$Tuple$$$)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; label label_bb22
; [exec]
; label_bb22$marker := true
; [exec]
; inhale basic_block_marker$label_bb22$marker()
(declare-const $t@491@01 $Snap)
(assert (= $t@491@01 $Snap.unit))
; [eval] basic_block_marker$label_bb22$marker()
(assert (as basic_block_marker$label_bb22$marker<Bool>  Bool))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; into_memory_block$Bool(_39$place(), _39$address, _39$snapshot$1)
; [eval] _39$place()
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _37$place<Place>  Place))
    (as _39$place<Place>  Place))
  (= _37$address@88@01 _39$address@99@01)
  (=
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> result_value@472@01)
    _39$snapshot$1@101@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= (constructor$Snap$Bool$<Snap$Bool> false) _39$snapshot$1@101@01)))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [eval] compute_address(place, root_address)
; [eval] Size$Bool$()
(declare-const $t@492@01 $Snap)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _37$place<Place>  Place) _37$address@88@01)
    (compute_address<Address> (as _39$place<Place>  Place) _39$address@99@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  _7$address@157@01
  (compute_address<Address> (as _39$place<Place>  Place) _39$address@99@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    _0$address@0@01
    (compute_address<Address> (as _39$place<Place>  Place) _39$address@99@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    _5$address@136@01
    (compute_address<Address> (as _39$place<Place>  Place) _39$address@99@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    _45$address@125@01
    (compute_address<Address> (as _39$place<Place>  Place) _39$address@99@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    _6$address@152@01
    (compute_address<Address> (as _39$place<Place>  Place) _39$address@99@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _37$place<Place>  Place)) _37$address@88@01)
    (compute_address<Address> (as _39$place<Place>  Place) _39$address@99@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; exhale acc(MemoryBlock(_39$address, Size$Bool$()), write)
; [eval] Size$Bool$()
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _39$place<Place>  Place) _39$address@99@01)
  _39$address@99@01)))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(MemoryBlockStackDrop(_39$address, Size$Bool$()), write)
; [eval] Size$Bool$()
; [exec]
; into_memory_block$Tuple$$$(_38$place(), _38$address, _38$snapshot$1)
; [eval] _38$place()
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  (as constructor$Snap$Tuple$$$$<Snap$Tuple$$$>  Snap$Tuple$$$)
  _38$snapshot$1@95@01)))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [eval] compute_address(place, root_address)
; [eval] Size$Tuple$$$$()
(declare-const $t@493@01 $Snap)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _37$place<Place>  Place)) _37$address@88@01)
    (compute_address<Address> (as _38$place<Place>  Place) _38$address@93@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  _6$address@152@01
  (compute_address<Address> (as _38$place<Place>  Place) _38$address@93@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    _45$address@125@01
    (compute_address<Address> (as _38$place<Place>  Place) _38$address@93@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  _5$address@136@01
  (compute_address<Address> (as _38$place<Place>  Place) _38$address@93@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    _0$address@0@01
    (compute_address<Address> (as _38$place<Place>  Place) _38$address@93@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    _7$address@157@01
    (compute_address<Address> (as _38$place<Place>  Place) _38$address@93@01))
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _37$place<Place>  Place) _37$address@88@01)
    (compute_address<Address> (as _38$place<Place>  Place) _38$address@93@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; exhale acc(MemoryBlock(_38$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _38$place<Place>  Place) _38$address@93@01)
  _38$address@93@01)))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(MemoryBlockStackDrop(_38$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
; [exec]
; inhale acc(MemoryBlock(_43$address, Size$I64$()), write)
; [eval] Size$I64$()
(declare-const $t@494@01 $Snap)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _37$place<Place>  Place) _37$address@88@01)
    _43$address@113@01)
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= _7$address@157@01 _43$address@113@01)
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= _0$address@0@01 _43$address@113@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= _5$address@136@01 _43$address@113@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= _45$address@125@01 _43$address@113@01)
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= _6$address@152@01 _43$address@113@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _37$place<Place>  Place)) _37$address@88@01)
  _43$address@113@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlockStackDrop(_43$address, Size$I64$()), write)
; [eval] Size$I64$()
(declare-const $t@495@01 $Snap)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= _34$address@72@01 _43$address@113@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= _4$address@105@01 _43$address@113@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= _2$address@27@01 _43$address@113@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= _3$address@59@01 _43$address@113@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= _5$address@136@01 _43$address@113@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= _7$address@157@01 _43$address@113@01)
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; copy_place$I64(_43$place(), _43$address, _4$place(), _4$address, _4$snapshot$2,
;   write)
; [eval] _43$place()
; [eval] _4$place()
; [eval] none < source_permission_amount
; [eval] compute_address(target_place, target_root_address)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _37$place<Place>  Place)) _37$address@88@01)
  (compute_address<Address> (as _43$place<Place>  Place) _43$address@113@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    _6$address@152@01
    (compute_address<Address> (as _43$place<Place>  Place) _43$address@113@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    _45$address@125@01
    (compute_address<Address> (as _43$place<Place>  Place) _43$address@113@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    _5$address@136@01
    (compute_address<Address> (as _43$place<Place>  Place) _43$address@113@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  _0$address@0@01
  (compute_address<Address> (as _43$place<Place>  Place) _43$address@113@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    _7$address@157@01
    (compute_address<Address> (as _43$place<Place>  Place) _43$address@113@01))
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _37$place<Place>  Place) _37$address@88@01)
    (compute_address<Address> (as _43$place<Place>  Place) _43$address@113@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  _43$address@113@01
  (compute_address<Address> (as _43$place<Place>  Place) _43$address@113@01))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(declare-const $t@496@01 $Snap)
(assert (= $t@496@01 ($Snap.combine ($Snap.first $t@496@01) ($Snap.second $t@496@01))))
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= (as _34$place<Place>  Place) (as _4$place<Place>  Place))
  (= _34$address@72@01 _4$address@105@01)
  (=
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _37$snapshot$1@90@01)
    _4$snapshot$2@108@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= (as _3$place<Place>  Place) (as _4$place<Place>  Place))
  (= _3$address@59@01 _4$address@105@01)
  (= _3$snapshot$2@62@01 _4$snapshot$2@108@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= (as _2$place<Place>  Place) (as _4$place<Place>  Place))
  (= _2$address@27@01 _4$address@105@01)
  (= fresh_snapshot@397@01 _4$snapshot$2@108@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= (as _1$place<Place>  Place) (as _4$place<Place>  Place))
  (= _1$address@4@01 _4$address@105@01)
  (= _1$snapshot$0@5@01 _4$snapshot$2@108@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second $t@496@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@496@01))
    ($Snap.second ($Snap.second $t@496@01)))))
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= (as _1$place<Place>  Place) (as _43$place<Place>  Place))
  (= _1$address@4@01 _43$address@113@01)
  (= _1$snapshot$0@5@01 _4$snapshot$2@108@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= (as _2$place<Place>  Place) (as _43$place<Place>  Place))
  (= _2$address@27@01 _43$address@113@01)
  (= fresh_snapshot@397@01 _4$snapshot$2@108@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= (as _3$place<Place>  Place) (as _43$place<Place>  Place))
  (= _3$address@59@01 _43$address@113@01)
  (= _3$snapshot$2@62@01 _4$snapshot$2@108@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= (as _34$place<Place>  Place) (as _43$place<Place>  Place))
  (= _34$address@72@01 _43$address@113@01)
  (=
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _37$snapshot$1@90@01)
    _4$snapshot$2@108@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= (as _4$place<Place>  Place) (as _43$place<Place>  Place))
  (= _4$address@105@01 _43$address@113@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (= ($Snap.second ($Snap.second $t@496@01)) $Snap.unit))
; [eval] valid$Snap$I64(source_snapshot)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _43$snapshot$1 == _4$snapshot$2
(declare-const $t@497@01 $Snap)
(assert (= $t@497@01 $Snap.unit))
; [eval] _43$snapshot$1 == _4$snapshot$2
(assert (= _43$snapshot$1@115@01 _4$snapshot$2@108@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; into_memory_block$I64(_3$place(), _3$address, _3$snapshot$2)
; [eval] _3$place()
; [eval] compute_address(place, root_address)
; [eval] Size$I64$()
(declare-const $t@498@01 $Snap)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _37$place<Place>  Place) _37$address@88@01)
    (compute_address<Address> (as _3$place<Place>  Place) _3$address@59@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    _7$address@157@01
    (compute_address<Address> (as _3$place<Place>  Place) _3$address@59@01))
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  _0$address@0@01
  (compute_address<Address> (as _3$place<Place>  Place) _3$address@59@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    _5$address@136@01
    (compute_address<Address> (as _3$place<Place>  Place) _3$address@59@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    _45$address@125@01
    (compute_address<Address> (as _3$place<Place>  Place) _3$address@59@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    _6$address@152@01
    (compute_address<Address> (as _3$place<Place>  Place) _3$address@59@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _37$place<Place>  Place)) _37$address@88@01)
  (compute_address<Address> (as _3$place<Place>  Place) _3$address@59@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; move_place$I64(_3$place(), _3$address, _43$place(), _43$address, _43$snapshot$1)
; [eval] _3$place()
; [eval] _43$place()
; [eval] compute_address(target_place, target_root_address)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= (as _4$place<Place>  Place) (as _43$place<Place>  Place))
  (= _4$address@105@01 _43$address@113@01)
  (= _4$snapshot$2@108@01 _43$snapshot$1@115@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= (as _34$place<Place>  Place) (as _43$place<Place>  Place))
  (= _34$address@72@01 _43$address@113@01)
  (=
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _37$snapshot$1@90@01)
    _43$snapshot$1@115@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= (as _2$place<Place>  Place) (as _43$place<Place>  Place))
  (= _2$address@27@01 _43$address@113@01)
  (= fresh_snapshot@397@01 _43$snapshot$1@115@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= (as _1$place<Place>  Place) (as _43$place<Place>  Place))
  (= _1$address@4@01 _43$address@113@01)
  (= _1$snapshot$0@5@01 _43$snapshot$1@115@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= _4$snapshot$2@108@01 _43$snapshot$1@115@01)))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(declare-const $t@499@01 $Snap)
(assert (= $t@499@01 ($Snap.combine ($Snap.first $t@499@01) ($Snap.second $t@499@01))))
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= (as _1$place<Place>  Place) (as _3$place<Place>  Place))
  (= _1$address@4@01 _3$address@59@01)
  (= _1$snapshot$0@5@01 _43$snapshot$1@115@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= (as _2$place<Place>  Place) (as _3$place<Place>  Place))
  (= _2$address@27@01 _3$address@59@01)
  (= fresh_snapshot@397@01 _43$snapshot$1@115@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= (as _34$place<Place>  Place) (as _3$place<Place>  Place))
  (= _34$address@72@01 _3$address@59@01)
  (=
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _37$snapshot$1@90@01)
    _43$snapshot$1@115@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= (as _4$place<Place>  Place) (as _3$place<Place>  Place))
  (= _4$address@105@01 _3$address@59@01)
  (= _4$snapshot$2@108@01 _43$snapshot$1@115@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second $t@499@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@499@01))
    ($Snap.second ($Snap.second $t@499@01)))))
; [eval] compute_address(source_place, source_root_address)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _37$place<Place>  Place) _37$address@88@01)
    (compute_address<Address> (as _43$place<Place>  Place) _43$address@113@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    _7$address@157@01
    (compute_address<Address> (as _43$place<Place>  Place) _43$address@113@01))
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  _0$address@0@01
  (compute_address<Address> (as _43$place<Place>  Place) _43$address@113@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    _5$address@136@01
    (compute_address<Address> (as _43$place<Place>  Place) _43$address@113@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    _45$address@125@01
    (compute_address<Address> (as _43$place<Place>  Place) _43$address@113@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    _6$address@152@01
    (compute_address<Address> (as _43$place<Place>  Place) _43$address@113@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _37$place<Place>  Place)) _37$address@88@01)
  (compute_address<Address> (as _43$place<Place>  Place) _43$address@113@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (= ($Snap.second ($Snap.second $t@499@01)) $Snap.unit))
; [eval] valid$Snap$I64(source_snapshot)
(assert (valid$Snap$I64<Bool> _43$snapshot$1@115@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _3$snapshot$3 == _43$snapshot$1
(declare-const $t@500@01 $Snap)
(assert (= $t@500@01 $Snap.unit))
; [eval] _3$snapshot$3 == _43$snapshot$1
(assert (= _3$snapshot$3@63@01 _43$snapshot$1@115@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; exhale acc(MemoryBlock(_43$address, Size$I64$()), write)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _43$place<Place>  Place) _43$address@113@01)
  _43$address@113@01)))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(MemoryBlockStackDrop(_43$address, Size$I64$()), write)
; [eval] Size$I64$()
; [exec]
; inhale acc(MemoryBlock(_44$address, Size$I64$()), write)
; [eval] Size$I64$()
(declare-const $t@501@01 $Snap)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _37$place<Place>  Place)) _37$address@88@01)
  _44$address@119@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= _6$address@152@01 _44$address@119@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= _45$address@125@01 _44$address@119@01)
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= _5$address@136@01 _44$address@119@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= _0$address@0@01 _44$address@119@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= _7$address@157@01 _44$address@119@01)
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _37$place<Place>  Place) _37$address@88@01)
    _44$address@119@01)
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlockStackDrop(_44$address, Size$I64$()), write)
; [eval] Size$I64$()
(declare-const $t@502@01 $Snap)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= _7$address@157@01 _44$address@119@01)
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= _5$address@136@01 _44$address@119@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= _3$address@59@01 _44$address@119@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= _2$address@27@01 _44$address@119@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= _4$address@105@01 _44$address@119@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= _34$address@72@01 _44$address@119@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; copy_place$I64(_44$place(), _44$address, _34$place(), _34$address, _34$snapshot$1,
;   write)
; [eval] _44$place()
; [eval] _34$place()
; [eval] none < source_permission_amount
; [eval] compute_address(target_place, target_root_address)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _37$place<Place>  Place) _37$address@88@01)
    (compute_address<Address> (as _44$place<Place>  Place) _44$address@119@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    _7$address@157@01
    (compute_address<Address> (as _44$place<Place>  Place) _44$address@119@01))
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  _0$address@0@01
  (compute_address<Address> (as _44$place<Place>  Place) _44$address@119@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    _5$address@136@01
    (compute_address<Address> (as _44$place<Place>  Place) _44$address@119@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    _45$address@125@01
    (compute_address<Address> (as _44$place<Place>  Place) _44$address@119@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    _6$address@152@01
    (compute_address<Address> (as _44$place<Place>  Place) _44$address@119@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _37$place<Place>  Place)) _37$address@88@01)
  (compute_address<Address> (as _44$place<Place>  Place) _44$address@119@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  _44$address@119@01
  (compute_address<Address> (as _44$place<Place>  Place) _44$address@119@01))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= (as _4$place<Place>  Place) (as _34$place<Place>  Place))
  (= _4$address@105@01 _34$address@72@01)
  (= _4$snapshot$2@108@01 _34$snapshot$1@74@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _37$snapshot$1@90@01)
  _34$snapshot$1@74@01)))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(declare-const $t@503@01 $Snap)
(assert (= $t@503@01 ($Snap.combine ($Snap.first $t@503@01) ($Snap.second $t@503@01))))
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= (as _3$place<Place>  Place) (as _34$place<Place>  Place))
  (= _3$address@59@01 _34$address@72@01)
  (= _43$snapshot$1@115@01 _34$snapshot$1@74@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= (as _1$place<Place>  Place) (as _34$place<Place>  Place))
  (= _1$address@4@01 _34$address@72@01)
  (= _1$snapshot$0@5@01 _34$snapshot$1@74@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= (as _2$place<Place>  Place) (as _34$place<Place>  Place))
  (= _2$address@27@01 _34$address@72@01)
  (= fresh_snapshot@397@01 _34$snapshot$1@74@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= (as _4$place<Place>  Place) (as _34$place<Place>  Place))
  (= _4$address@105@01 _34$address@72@01)
  (= _4$snapshot$2@108@01 _34$snapshot$1@74@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second $t@503@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@503@01))
    ($Snap.second ($Snap.second $t@503@01)))))
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= (as _4$place<Place>  Place) (as _44$place<Place>  Place))
  (= _4$address@105@01 _44$address@119@01)
  (= _4$snapshot$2@108@01 _34$snapshot$1@74@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= (as _2$place<Place>  Place) (as _44$place<Place>  Place))
  (= _2$address@27@01 _44$address@119@01)
  (= fresh_snapshot@397@01 _34$snapshot$1@74@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= (as _1$place<Place>  Place) (as _44$place<Place>  Place))
  (= _1$address@4@01 _44$address@119@01)
  (= _1$snapshot$0@5@01 _34$snapshot$1@74@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= (as _3$place<Place>  Place) (as _44$place<Place>  Place))
  (= _3$address@59@01 _44$address@119@01)
  (= _43$snapshot$1@115@01 _34$snapshot$1@74@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= (as _34$place<Place>  Place) (as _44$place<Place>  Place))
  (= _34$address@72@01 _44$address@119@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (= ($Snap.second ($Snap.second $t@503@01)) $Snap.unit))
; [eval] valid$Snap$I64(source_snapshot)
(assert (valid$Snap$I64<Bool> _34$snapshot$1@74@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _44$snapshot$1 == _34$snapshot$1
(declare-const $t@504@01 $Snap)
(assert (= $t@504@01 $Snap.unit))
; [eval] _44$snapshot$1 == _34$snapshot$1
(assert (= _44$snapshot$1@121@01 _34$snapshot$1@74@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; into_memory_block$I64(_4$place(), _4$address, _4$snapshot$2)
; [eval] _4$place()
; [eval] compute_address(place, root_address)
; [eval] Size$I64$()
(declare-const $t@505@01 $Snap)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _37$place<Place>  Place)) _37$address@88@01)
  (compute_address<Address> (as _4$place<Place>  Place) _4$address@105@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    _6$address@152@01
    (compute_address<Address> (as _4$place<Place>  Place) _4$address@105@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    _45$address@125@01
    (compute_address<Address> (as _4$place<Place>  Place) _4$address@105@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    _5$address@136@01
    (compute_address<Address> (as _4$place<Place>  Place) _4$address@105@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  _0$address@0@01
  (compute_address<Address> (as _4$place<Place>  Place) _4$address@105@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    _7$address@157@01
    (compute_address<Address> (as _4$place<Place>  Place) _4$address@105@01))
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _37$place<Place>  Place) _37$address@88@01)
    (compute_address<Address> (as _4$place<Place>  Place) _4$address@105@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; move_place$I64(_4$place(), _4$address, _44$place(), _44$address, _44$snapshot$1)
; [eval] _4$place()
; [eval] _44$place()
; [eval] compute_address(target_place, target_root_address)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= (as _34$place<Place>  Place) (as _44$place<Place>  Place))
  (= _34$address@72@01 _44$address@119@01)
  (= _34$snapshot$1@74@01 _44$snapshot$1@121@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= (as _3$place<Place>  Place) (as _44$place<Place>  Place))
  (= _3$address@59@01 _44$address@119@01)
  (= _43$snapshot$1@115@01 _44$snapshot$1@121@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= (as _1$place<Place>  Place) (as _44$place<Place>  Place))
  (= _1$address@4@01 _44$address@119@01)
  (= _1$snapshot$0@5@01 _44$snapshot$1@121@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= (as _2$place<Place>  Place) (as _44$place<Place>  Place))
  (= _2$address@27@01 _44$address@119@01)
  (= fresh_snapshot@397@01 _44$snapshot$1@121@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= _34$snapshot$1@74@01 _44$snapshot$1@121@01)))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(declare-const $t@506@01 $Snap)
(assert (= $t@506@01 ($Snap.combine ($Snap.first $t@506@01) ($Snap.second $t@506@01))))
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= (as _2$place<Place>  Place) (as _4$place<Place>  Place))
  (= _2$address@27@01 _4$address@105@01)
  (= fresh_snapshot@397@01 _44$snapshot$1@121@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= (as _1$place<Place>  Place) (as _4$place<Place>  Place))
  (= _1$address@4@01 _4$address@105@01)
  (= _1$snapshot$0@5@01 _44$snapshot$1@121@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= (as _3$place<Place>  Place) (as _4$place<Place>  Place))
  (= _3$address@59@01 _4$address@105@01)
  (= _43$snapshot$1@115@01 _44$snapshot$1@121@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= (as _34$place<Place>  Place) (as _4$place<Place>  Place))
  (= _34$address@72@01 _4$address@105@01)
  (= _34$snapshot$1@74@01 _44$snapshot$1@121@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second $t@506@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@506@01))
    ($Snap.second ($Snap.second $t@506@01)))))
; [eval] compute_address(source_place, source_root_address)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _37$place<Place>  Place)) _37$address@88@01)
  (compute_address<Address> (as _44$place<Place>  Place) _44$address@119@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    _6$address@152@01
    (compute_address<Address> (as _44$place<Place>  Place) _44$address@119@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    _45$address@125@01
    (compute_address<Address> (as _44$place<Place>  Place) _44$address@119@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    _5$address@136@01
    (compute_address<Address> (as _44$place<Place>  Place) _44$address@119@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  _0$address@0@01
  (compute_address<Address> (as _44$place<Place>  Place) _44$address@119@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    _7$address@157@01
    (compute_address<Address> (as _44$place<Place>  Place) _44$address@119@01))
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _37$place<Place>  Place) _37$address@88@01)
    (compute_address<Address> (as _44$place<Place>  Place) _44$address@119@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (= ($Snap.second ($Snap.second $t@506@01)) $Snap.unit))
; [eval] valid$Snap$I64(source_snapshot)
(assert (valid$Snap$I64<Bool> _44$snapshot$1@121@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _4$snapshot$3 == _44$snapshot$1
(declare-const $t@507@01 $Snap)
(assert (= $t@507@01 $Snap.unit))
; [eval] _4$snapshot$3 == _44$snapshot$1
(assert (= _4$snapshot$3@109@01 _44$snapshot$1@121@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; exhale acc(MemoryBlock(_44$address, Size$I64$()), write)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _44$place<Place>  Place) _44$address@119@01)
  _44$address@119@01)))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(MemoryBlockStackDrop(_44$address, Size$I64$()), write)
; [eval] Size$I64$()
; [exec]
; tmp$6 := assign$Tuple$$I64$Bool$$I64$Bool$$CheckedBinaryOp$Add$Copy$I64$Constant$I64$$$$(_45$place(),
;   _45$address, _2$place(), _2$address, _2$snapshot$2, constructor$Snap$I64$(1))
; [eval] _45$place()
; [eval] _2$place()
; [eval] constructor$Snap$I64$(1)
; [eval] compute_address(target_place, target_address)
; [eval] Size$Tuple$$I64$Bool$$I64$Bool$$()
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _37$place<Place>  Place)) _37$address@88@01)
    (compute_address<Address> (as _45$place<Place>  Place) _45$address@125@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    _6$address@152@01
    (compute_address<Address> (as _45$place<Place>  Place) _45$address@125@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  _45$address@125@01
  (compute_address<Address> (as _45$place<Place>  Place) _45$address@125@01))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= (as _34$place<Place>  Place) (as _2$place<Place>  Place))
  (= _34$address@72@01 _2$address@27@01)
  (= _34$snapshot$1@74@01 _2$snapshot$2@30@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= (as _3$place<Place>  Place) (as _2$place<Place>  Place))
  (= _3$address@59@01 _2$address@27@01)
  (= _43$snapshot$1@115@01 _2$snapshot$2@30@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= (as _1$place<Place>  Place) (as _2$place<Place>  Place))
  (= _1$address@4@01 _2$address@27@01)
  (= _1$snapshot$0@5@01 _2$snapshot$2@30@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= fresh_snapshot@397@01 _2$snapshot$2@30@01)))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [eval] valid$Snap$I64(operand1_value)
; [eval] valid$Snap$I64(operand2_value)
(declare-const result_value@508@01 Snap$Tuple$$I64$Bool$$I64$Bool$)
(declare-const $t@509@01 $Snap)
(assert (= $t@509@01 ($Snap.combine ($Snap.first $t@509@01) ($Snap.second $t@509@01))))
; [eval] compute_address(target_place, target_address)
; [eval] PaddingSize$Tuple$$I64$Bool$$I64$Bool$$()
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _37$place<Place>  Place) _37$address@88@01)
  (compute_address<Address> (as _45$place<Place>  Place) _45$address@125@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    _7$address@157@01
    (compute_address<Address> (as _45$place<Place>  Place) _45$address@125@01))
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    _0$address@0@01
    (compute_address<Address> (as _45$place<Place>  Place) _45$address@125@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    _5$address@136@01
    (compute_address<Address> (as _45$place<Place>  Place) _45$address@125@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    _6$address@152@01
    (compute_address<Address> (as _45$place<Place>  Place) _45$address@125@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _37$place<Place>  Place)) _37$address@88@01)
    (compute_address<Address> (as _45$place<Place>  Place) _45$address@125@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second $t@509@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@509@01))
    ($Snap.second ($Snap.second $t@509@01)))))
; [eval] field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(compute_address(target_place, target_address))
; [eval] compute_address(target_place, target_address)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _37$place<Place>  Place)) _37$address@88@01)
  (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _45$place<Place>  Place) _45$address@125@01)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    _6$address@152@01
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _45$place<Place>  Place) _45$address@125@01)))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    _5$address@136@01
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _45$place<Place>  Place) _45$address@125@01)))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  _0$address@0@01
  (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _45$place<Place>  Place) _45$address@125@01)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    _7$address@157@01
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _45$place<Place>  Place) _45$address@125@01)))
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _37$place<Place>  Place) _37$address@88@01)
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _45$place<Place>  Place) _45$address@125@01)))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _45$place<Place>  Place) _45$address@125@01)
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _45$place<Place>  Place) _45$address@125@01)))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second $t@509@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@509@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@509@01))))))
; [eval] field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(target_place)
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(result_value)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _37$place<Place>  Place))
    (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _45$place<Place>  Place)))
  (= _37$address@88@01 _45$address@125@01)
  (=
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> result_value@472@01)
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> result_value@508@01)))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@509@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@509@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@509@01)))))))
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= (as _34$place<Place>  Place) (as _2$place<Place>  Place))
  (= _34$address@72@01 _2$address@27@01)
  (= _34$snapshot$1@74@01 _2$snapshot$2@30@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= (as _3$place<Place>  Place) (as _2$place<Place>  Place))
  (= _3$address@59@01 _2$address@27@01)
  (= _43$snapshot$1@115@01 _2$snapshot$2@30@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= (as _1$place<Place>  Place) (as _2$place<Place>  Place))
  (= _1$address@4@01 _2$address@27@01)
  (= _1$snapshot$0@5@01 _2$snapshot$2@30@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= (as _4$place<Place>  Place) (as _2$place<Place>  Place))
  (= _4$address@105@01 _2$address@27@01)
  (= _44$snapshot$1@121@01 _2$snapshot$2@30@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@509@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@509@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@509@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@509@01)))))
  $Snap.unit))
; [eval] valid$Snap$I64(constructor$Snap$I64$Add_I64(operand1_value, operand2_value)) ==> destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(result_value) == constructor$Snap$I64$Add_I64(operand1_value, operand2_value)
; [eval] valid$Snap$I64(constructor$Snap$I64$Add_I64(operand1_value, operand2_value))
; [eval] constructor$Snap$I64$Add_I64(operand1_value, operand2_value)
(set-option :timeout 0)
(push) ; 6
(push) ; 7
(set-option :timeout 10)
(assert (not (not
  (valid$Snap$I64<Bool> (constructor$Snap$I64$Add_I64<Snap$I64> _2$snapshot$2@30@01 (constructor$Snap$I64$<Snap$I64> 1))))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [then-branch: 15 | valid$Snap$I64[Bool](constructor$Snap$I64$Add_I64[Snap$I64](_2$snapshot$2@30@01, constructor$Snap$I64$[Snap$I64](1))) | live]
; [else-branch: 15 | !(valid$Snap$I64[Bool](constructor$Snap$I64$Add_I64[Snap$I64](_2$snapshot$2@30@01, constructor$Snap$I64$[Snap$I64](1)))) | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 15 | valid$Snap$I64[Bool](constructor$Snap$I64$Add_I64[Snap$I64](_2$snapshot$2@30@01, constructor$Snap$I64$[Snap$I64](1)))]
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(result_value) == constructor$Snap$I64$Add_I64(operand1_value, operand2_value)
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(result_value)
; [eval] constructor$Snap$I64$Add_I64(operand1_value, operand2_value)
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (=>
  (valid$Snap$I64<Bool> (constructor$Snap$I64$Add_I64<Snap$I64> _2$snapshot$2@30@01 (constructor$Snap$I64$<Snap$I64> 1)))
  (=
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> result_value@508@01)
    (constructor$Snap$I64$Add_I64<Snap$I64> _2$snapshot$2@30@01 (constructor$Snap$I64$<Snap$I64> 1)))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@509@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@509@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@509@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@509@01))))))
  $Snap.unit))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(result_value) == constructor$Snap$Bool$(!valid$Snap$I64(constructor$Snap$I64$Add_I64(operand1_value, operand2_value)))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(result_value)
; [eval] constructor$Snap$Bool$(!valid$Snap$I64(constructor$Snap$I64$Add_I64(operand1_value, operand2_value)))
; [eval] !valid$Snap$I64(constructor$Snap$I64$Add_I64(operand1_value, operand2_value))
; [eval] valid$Snap$I64(constructor$Snap$I64$Add_I64(operand1_value, operand2_value))
; [eval] constructor$Snap$I64$Add_I64(operand1_value, operand2_value)
(assert (=
  (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> result_value@508@01)
  (constructor$Snap$Bool$<Snap$Bool> (not
    (valid$Snap$I64<Bool> (constructor$Snap$I64$Add_I64<Snap$I64> _2$snapshot$2@30@01 (constructor$Snap$I64$<Snap$I64> 1)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@509@01))))))
  $Snap.unit))
; [eval] MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(compute_address(target_place, target_address)), Size$I64$()) == to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(result_value))
; [eval] MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(compute_address(target_place, target_address)), Size$I64$())
; [eval] field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(compute_address(target_place, target_address))
; [eval] compute_address(target_place, target_address)
; [eval] Size$I64$()
(push) ; 6
(declare-const $k@510@01 $Perm)
(assert ($Perm.isReadVar $k@510@01))
(assert (< $k@510@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@510@01)))
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.No $k@510@01)))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@509@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _45$place<Place>  Place) _45$address@125@01)) (as Size$I64$<Snap$Usize>  Snap$Usize)))
(pop) ; 6
; Joined path conditions
(assert ($Perm.isReadVar $k@510@01))
(assert (and
  (< $k@510@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@510@01))
  (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@509@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _45$place<Place>  Place) _45$address@125@01)) (as Size$I64$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(result_value))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(result_value)
(assert (=
  (MemoryBlock$bytes ($Snap.first ($Snap.second $t@509@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _45$place<Place>  Place) _45$address@125@01)) (as Size$I64$<Snap$Usize>  Snap$Usize))
  (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> result_value@508@01))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _45$snapshot$1 == tmp$6
(declare-const $t@511@01 $Snap)
(assert (= $t@511@01 $Snap.unit))
; [eval] _45$snapshot$1 == tmp$6
(assert (= _45$snapshot$1@127@01 result_value@508@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [eval] !destructor$Snap$Bool$$value(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(_45$snapshot$1))
; [eval] destructor$Snap$Bool$$value(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(_45$snapshot$1))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(_45$snapshot$1)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (destructor$Snap$Bool$$value<Bool> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> _45$snapshot$1@127@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not
  (destructor$Snap$Bool$$value<Bool> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> _45$snapshot$1@127@01)))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [then-branch: 16 | !(destructor$Snap$Bool$$value[Bool](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](_45$snapshot$1@127@01))) | live]
; [else-branch: 16 | destructor$Snap$Bool$$value[Bool](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](_45$snapshot$1@127@01)) | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 16 | !(destructor$Snap$Bool$$value[Bool](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](_45$snapshot$1@127@01)))]
(assert (not
  (destructor$Snap$Bool$$value<Bool> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> _45$snapshot$1@127@01))))
; [exec]
; label label_bb23
; [exec]
; label_bb23$marker := true
; [exec]
; inhale basic_block_marker$label_bb23$marker()
(declare-const $t@512@01 $Snap)
(assert (= $t@512@01 $Snap.unit))
; [eval] basic_block_marker$label_bb23$marker()
(assert (as basic_block_marker$label_bb23$marker<Bool>  Bool))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; into_memory_block$I64(_2$place(), _2$address, _2$snapshot$2)
; [eval] _2$place()
; [eval] compute_address(place, root_address)
; [eval] Size$I64$()
(declare-const $t@513@01 $Snap)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _45$place<Place>  Place) _45$address@125@01)
    (compute_address<Address> (as _2$place<Place>  Place) _2$address@27@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _37$place<Place>  Place) _37$address@88@01)
    (compute_address<Address> (as _2$place<Place>  Place) _2$address@27@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (=
    _7$address@157@01
    (compute_address<Address> (as _2$place<Place>  Place) _2$address@27@01))
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  _0$address@0@01
  (compute_address<Address> (as _2$place<Place>  Place) _2$address@27@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (=
    _5$address@136@01
    (compute_address<Address> (as _2$place<Place>  Place) _2$address@27@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (=
    _6$address@152@01
    (compute_address<Address> (as _2$place<Place>  Place) _2$address@27@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _37$place<Place>  Place)) _37$address@88@01)
  (compute_address<Address> (as _2$place<Place>  Place) _2$address@27@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _45$place<Place>  Place) _45$address@125@01))
  (compute_address<Address> (as _2$place<Place>  Place) _2$address@27@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; fold acc(OwnedNonAliased$I64(field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(_45$place()),
;   _45$address, destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(_45$snapshot$1)), write)
; [eval] field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(_45$place())
; [eval] _45$place()
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(_45$snapshot$1)
; [eval] valid$Snap$I64(snapshot)
(set-option :timeout 0)
(push) ; 7
(assert (not (valid$Snap$I64<Bool> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _45$snapshot$1@127@01))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (valid$Snap$I64<Bool> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _45$snapshot$1@127@01)))
; [eval] compute_address(place, root_address)
; [eval] Size$I64$()
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _2$place<Place>  Place) _2$address@27@01)
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _45$place<Place>  Place)) _45$address@125@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _45$place<Place>  Place) _45$address@125@01)
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _45$place<Place>  Place)) _45$address@125@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _37$place<Place>  Place) _37$address@88@01)
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _45$place<Place>  Place)) _45$address@125@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (=
    _7$address@157@01
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _45$place<Place>  Place)) _45$address@125@01))
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  _0$address@0@01
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _45$place<Place>  Place)) _45$address@125@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (=
    _5$address@136@01
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _45$place<Place>  Place)) _45$address@125@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (=
    _6$address@152@01
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _45$place<Place>  Place)) _45$address@125@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _37$place<Place>  Place)) _37$address@88@01)
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _45$place<Place>  Place)) _45$address@125@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _45$place<Place>  Place) _45$address@125@01))
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _45$place<Place>  Place)) _45$address@125@01))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [eval] MemoryBlock$bytes(compute_address(place, root_address), Size$I64$()) == to_bytes$I64(snapshot)
; [eval] MemoryBlock$bytes(compute_address(place, root_address), Size$I64$())
; [eval] compute_address(place, root_address)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 7
(declare-const $k@514@01 $Perm)
(assert ($Perm.isReadVar $k@514@01))
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _2$place<Place>  Place) _2$address@27@01)
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _45$place<Place>  Place)) _45$address@125@01))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _45$place<Place>  Place) _45$address@125@01)
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _45$place<Place>  Place)) _45$address@125@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _37$place<Place>  Place) _37$address@88@01)
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _45$place<Place>  Place)) _45$address@125@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    _7$address@157@01
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _45$place<Place>  Place)) _45$address@125@01))
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  _0$address@0@01
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _45$place<Place>  Place)) _45$address@125@01))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    _5$address@136@01
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _45$place<Place>  Place)) _45$address@125@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    _6$address@152@01
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _45$place<Place>  Place)) _45$address@125@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _37$place<Place>  Place)) _37$address@88@01)
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _45$place<Place>  Place)) _45$address@125@01))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _45$place<Place>  Place) _45$address@125@01))
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _45$place<Place>  Place)) _45$address@125@01))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (< $k@514@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@514@01)))
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (< $Perm.No $k@514@01)))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@509@01)) (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _45$place<Place>  Place)) _45$address@125@01) (as Size$I64$<Snap$Usize>  Snap$Usize)))
(pop) ; 7
; Joined path conditions
(assert ($Perm.isReadVar $k@514@01))
(assert (and
  (< $k@514@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@514@01))
  (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@509@01)) (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _45$place<Place>  Place)) _45$address@125@01) (as Size$I64$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$I64(snapshot)
(set-option :timeout 0)
(push) ; 7
(assert (not (=
  (MemoryBlock$bytes ($Snap.first ($Snap.second $t@509@01)) (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _45$place<Place>  Place)) _45$address@125@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
  (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _45$snapshot$1@127@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (=
  (MemoryBlock$bytes ($Snap.first ($Snap.second $t@509@01)) (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _45$place<Place>  Place)) _45$address@125@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
  (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _45$snapshot$1@127@01))))
(assert (OwnedNonAliased$I64%trigger ($Snap.combine
  $Snap.unit
  ($Snap.combine ($Snap.first ($Snap.second $t@509@01)) $Snap.unit)) (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _45$place<Place>  Place)) _45$address@125@01 (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _45$snapshot$1@127@01)))
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (=
    (as _34$place<Place>  Place)
    (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _45$place<Place>  Place)))
  (= _34$address@72@01 _45$address@125@01)
  (=
    _34$snapshot$1@74@01
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _45$snapshot$1@127@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (=
    (as _3$place<Place>  Place)
    (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _45$place<Place>  Place)))
  (= _3$address@59@01 _45$address@125@01)
  (=
    _43$snapshot$1@115@01
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _45$snapshot$1@127@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (=
    (as _1$place<Place>  Place)
    (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _45$place<Place>  Place)))
  (= _1$address@4@01 _45$address@125@01)
  (=
    _1$snapshot$0@5@01
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _45$snapshot$1@127@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (=
    (as _4$place<Place>  Place)
    (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _45$place<Place>  Place)))
  (= _4$address@105@01 _45$address@125@01)
  (=
    _44$snapshot$1@121@01
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _45$snapshot$1@127@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [exec]
; move_place$I64(_2$place(), _2$address, field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(_45$place()),
;   _45$address, destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(_45$snapshot$1))
; [eval] _2$place()
; [eval] field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(_45$place())
; [eval] _45$place()
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(_45$snapshot$1)
; [eval] compute_address(target_place, target_root_address)
; [eval] Size$I64$()
(declare-const $t@515@01 $Snap)
(assert (= $t@515@01 ($Snap.combine ($Snap.first $t@515@01) ($Snap.second $t@515@01))))
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (= (as _4$place<Place>  Place) (as _2$place<Place>  Place))
  (= _4$address@105@01 _2$address@27@01)
  (=
    _44$snapshot$1@121@01
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _45$snapshot$1@127@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (= (as _1$place<Place>  Place) (as _2$place<Place>  Place))
  (= _1$address@4@01 _2$address@27@01)
  (=
    _1$snapshot$0@5@01
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _45$snapshot$1@127@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (= (as _3$place<Place>  Place) (as _2$place<Place>  Place))
  (= _3$address@59@01 _2$address@27@01)
  (=
    _43$snapshot$1@115@01
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _45$snapshot$1@127@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (= (as _34$place<Place>  Place) (as _2$place<Place>  Place))
  (= _34$address@72@01 _2$address@27@01)
  (=
    _34$snapshot$1@74@01
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _45$snapshot$1@127@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second $t@515@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@515@01))
    ($Snap.second ($Snap.second $t@515@01)))))
; [eval] compute_address(source_place, source_root_address)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _37$place<Place>  Place)) _37$address@88@01)
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _45$place<Place>  Place)) _45$address@125@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (=
    _6$address@152@01
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _45$place<Place>  Place)) _45$address@125@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (=
    _5$address@136@01
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _45$place<Place>  Place)) _45$address@125@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  _0$address@0@01
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _45$place<Place>  Place)) _45$address@125@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (=
    _7$address@157@01
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _45$place<Place>  Place)) _45$address@125@01))
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _37$place<Place>  Place) _37$address@88@01)
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _45$place<Place>  Place)) _45$address@125@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _45$place<Place>  Place) _45$address@125@01)
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _45$place<Place>  Place)) _45$address@125@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (= ($Snap.second ($Snap.second $t@515@01)) $Snap.unit))
; [eval] valid$Snap$I64(source_snapshot)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _2$snapshot$3 ==
;   destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(_45$snapshot$1)
(declare-const $t@516@01 $Snap)
(assert (= $t@516@01 $Snap.unit))
; [eval] _2$snapshot$3 == destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(_45$snapshot$1)
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(_45$snapshot$1)
(assert (=
  _2$snapshot$3@31@01
  (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _45$snapshot$1@127@01)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; write_place_constant$Tuple$$$(_6$place(), _6$address, constructor$Snap$Tuple$$$$())
; [eval] _6$place()
; [eval] constructor$Snap$Tuple$$$$()
; [eval] compute_address(target_place, target_root_address)
; [eval] Size$Tuple$$$$()
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _45$place<Place>  Place)) _45$address@125@01)
    (compute_address<Address> (as _6$place<Place>  Place) _6$address@152@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _37$place<Place>  Place)) _37$address@88@01)
    (compute_address<Address> (as _6$place<Place>  Place) _6$address@152@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  _6$address@152@01
  (compute_address<Address> (as _6$place<Place>  Place) _6$address@152@01))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [eval] valid$Snap$Tuple$$$(source_snapshot)
(declare-const $t@517@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _6$snapshot$1 == constructor$Snap$Tuple$$$$()
(declare-const $t@518@01 $Snap)
(assert (= $t@518@01 $Snap.unit))
; [eval] _6$snapshot$1 == constructor$Snap$Tuple$$$$()
; [eval] constructor$Snap$Tuple$$$$()
(assert (=
  _6$snapshot$1@154@01
  (as constructor$Snap$Tuple$$$$<Snap$Tuple$$$>  Snap$Tuple$$$)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; into_memory_block$I64(_34$place(), _34$address, _34$snapshot$1)
; [eval] _34$place()
; [eval] compute_address(place, root_address)
; [eval] Size$I64$()
(declare-const $t@519@01 $Snap)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _45$place<Place>  Place)) _45$address@125@01)
  (compute_address<Address> (as _34$place<Place>  Place) _34$address@72@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _37$place<Place>  Place)) _37$address@88@01)
  (compute_address<Address> (as _34$place<Place>  Place) _34$address@72@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (=
    _5$address@136@01
    (compute_address<Address> (as _34$place<Place>  Place) _34$address@72@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  _0$address@0@01
  (compute_address<Address> (as _34$place<Place>  Place) _34$address@72@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (=
    _7$address@157@01
    (compute_address<Address> (as _34$place<Place>  Place) _34$address@72@01))
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _37$place<Place>  Place) _37$address@88@01)
    (compute_address<Address> (as _34$place<Place>  Place) _34$address@72@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _45$place<Place>  Place) _45$address@125@01)
    (compute_address<Address> (as _34$place<Place>  Place) _34$address@72@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; exhale acc(MemoryBlock(_34$address, Size$I64$()), write)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _34$place<Place>  Place) _34$address@72@01)
  _34$address@72@01)))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(MemoryBlockStackDrop(_34$address, Size$I64$()), write)
; [eval] Size$I64$()
; [exec]
; exhale acc(MemoryBlock(_7$address, Size$Bool$()), write)
; [eval] Size$Bool$()
; [exec]
; exhale acc(MemoryBlockStackDrop(_7$address, Size$Bool$()), write)
; [eval] Size$Bool$()
; [exec]
; label loop__label_bb1__label_bb1
; [exec]
; loop__label_bb1__label_bb1$marker := true
; [exec]
; inhale basic_block_marker$loop__label_bb1__label_bb1$marker()
(declare-const $t@520@01 $Snap)
(assert (= $t@520@01 $Snap.unit))
; [eval] basic_block_marker$loop__label_bb1__label_bb1$marker()
(assert (as basic_block_marker$loop__label_bb1__label_bb1$marker<Bool>  Bool))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; label loop__label_bb1__label_bb2
; [exec]
; loop__label_bb1__label_bb2$marker := true
; [exec]
; inhale basic_block_marker$loop__label_bb1__label_bb2$marker()
(declare-const $t@521@01 $Snap)
(assert (= $t@521@01 $Snap.unit))
; [eval] basic_block_marker$loop__label_bb1__label_bb2$marker()
(assert (as basic_block_marker$loop__label_bb1__label_bb2$marker<Bool>  Bool))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlock(_7$address, Size$Bool$()), write)
; [eval] Size$Bool$()
(declare-const $t@522@01 $Snap)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _45$place<Place>  Place) _45$address@125@01)
    _7$address@157@01)
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _37$place<Place>  Place) _37$address@88@01)
    _7$address@157@01)
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (= _0$address@0@01 _7$address@157@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (= _5$address@136@01 _7$address@157@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _37$place<Place>  Place)) _37$address@88@01)
    _7$address@157@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _45$place<Place>  Place)) _45$address@125@01)
    _7$address@157@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlockStackDrop(_7$address, Size$Bool$()), write)
; [eval] Size$Bool$()
(declare-const $t@523@01 $Snap)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (= _4$address@105@01 _7$address@157@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (= _2$address@27@01 _7$address@157@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (= _3$address@59@01 _7$address@157@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (= _5$address@136@01 _7$address@157@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlock(_8$address, Size$I64$()), write)
; [eval] Size$I64$()
(declare-const $t@524@01 $Snap)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (= _7$address@157@01 _8$address@163@01)
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _45$place<Place>  Place) _45$address@125@01)
    _8$address@163@01)
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _37$place<Place>  Place) _37$address@88@01)
    _8$address@163@01)
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= _0$address@0@01 _8$address@163@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (= _5$address@136@01 _8$address@163@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _37$place<Place>  Place)) _37$address@88@01)
  _8$address@163@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _45$place<Place>  Place)) _45$address@125@01)
  _8$address@163@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlockStackDrop(_8$address, Size$I64$()), write)
; [eval] Size$I64$()
(declare-const $t@525@01 $Snap)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (= _7$address@157@01 _8$address@163@01)
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= _4$address@105@01 _8$address@163@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= _2$address@27@01 _8$address@163@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= _3$address@59@01 _8$address@163@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (= _5$address@136@01 _8$address@163@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; copy_place$I64(_8$place(), _8$address, _2$place(), _2$address, _2$snapshot$3,
;   write)
; [eval] _8$place()
; [eval] _2$place()
; [eval] none < source_permission_amount
; [eval] compute_address(target_place, target_root_address)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _45$place<Place>  Place)) _45$address@125@01)
  (compute_address<Address> (as _8$place<Place>  Place) _8$address@163@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _37$place<Place>  Place)) _37$address@88@01)
  (compute_address<Address> (as _8$place<Place>  Place) _8$address@163@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (=
    _5$address@136@01
    (compute_address<Address> (as _8$place<Place>  Place) _8$address@163@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  _0$address@0@01
  (compute_address<Address> (as _8$place<Place>  Place) _8$address@163@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _37$place<Place>  Place) _37$address@88@01)
    (compute_address<Address> (as _8$place<Place>  Place) _8$address@163@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _45$place<Place>  Place) _45$address@125@01)
    (compute_address<Address> (as _8$place<Place>  Place) _8$address@163@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (=
    _7$address@157@01
    (compute_address<Address> (as _8$place<Place>  Place) _8$address@163@01))
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  _8$address@163@01
  (compute_address<Address> (as _8$place<Place>  Place) _8$address@163@01))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (= (as _3$place<Place>  Place) (as _2$place<Place>  Place))
  (= _3$address@59@01 _2$address@27@01)
  (= _43$snapshot$1@115@01 _2$snapshot$3@31@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (= (as _1$place<Place>  Place) (as _2$place<Place>  Place))
  (= _1$address@4@01 _2$address@27@01)
  (= _1$snapshot$0@5@01 _2$snapshot$3@31@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (= (as _4$place<Place>  Place) (as _2$place<Place>  Place))
  (= _4$address@105@01 _2$address@27@01)
  (= _44$snapshot$1@121@01 _2$snapshot$3@31@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _45$snapshot$1@127@01)
  _2$snapshot$3@31@01)))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(declare-const $t@526@01 $Snap)
(assert (= $t@526@01 ($Snap.combine ($Snap.first $t@526@01) ($Snap.second $t@526@01))))
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (= (as _4$place<Place>  Place) (as _2$place<Place>  Place))
  (= _4$address@105@01 _2$address@27@01)
  (= _44$snapshot$1@121@01 _2$snapshot$3@31@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (= (as _1$place<Place>  Place) (as _2$place<Place>  Place))
  (= _1$address@4@01 _2$address@27@01)
  (= _1$snapshot$0@5@01 _2$snapshot$3@31@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (= (as _3$place<Place>  Place) (as _2$place<Place>  Place))
  (= _3$address@59@01 _2$address@27@01)
  (= _43$snapshot$1@115@01 _2$snapshot$3@31@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second $t@526@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@526@01))
    ($Snap.second ($Snap.second $t@526@01)))))
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (= (as _3$place<Place>  Place) (as _8$place<Place>  Place))
  (= _3$address@59@01 _8$address@163@01)
  (= _43$snapshot$1@115@01 _2$snapshot$3@31@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (= (as _1$place<Place>  Place) (as _8$place<Place>  Place))
  (= _1$address@4@01 _8$address@163@01)
  (= _1$snapshot$0@5@01 _2$snapshot$3@31@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (= (as _4$place<Place>  Place) (as _8$place<Place>  Place))
  (= _4$address@105@01 _8$address@163@01)
  (= _44$snapshot$1@121@01 _2$snapshot$3@31@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (= (as _2$place<Place>  Place) (as _8$place<Place>  Place))
  (= _2$address@27@01 _8$address@163@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (= ($Snap.second ($Snap.second $t@526@01)) $Snap.unit))
; [eval] valid$Snap$I64(source_snapshot)
(assert (valid$Snap$I64<Bool> _2$snapshot$3@31@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _8$snapshot$2 == _2$snapshot$3
(declare-const $t@527@01 $Snap)
(assert (= $t@527@01 $Snap.unit))
; [eval] _8$snapshot$2 == _2$snapshot$3
(assert (= _8$snapshot$2@166@01 _2$snapshot$3@31@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlock(_9$address, Size$I64$()), write)
; [eval] Size$I64$()
(declare-const $t@528@01 $Snap)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (= _7$address@157@01 _9$address@169@01)
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _45$place<Place>  Place) _45$address@125@01)
    _9$address@169@01)
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _37$place<Place>  Place) _37$address@88@01)
    _9$address@169@01)
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= _0$address@0@01 _9$address@169@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (= _5$address@136@01 _9$address@169@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _37$place<Place>  Place)) _37$address@88@01)
  _9$address@169@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _45$place<Place>  Place)) _45$address@125@01)
  _9$address@169@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlockStackDrop(_9$address, Size$I64$()), write)
; [eval] Size$I64$()
(declare-const $t@529@01 $Snap)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= _8$address@163@01 _9$address@169@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (= _7$address@157@01 _9$address@169@01)
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= _4$address@105@01 _9$address@169@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= _2$address@27@01 _9$address@169@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= _3$address@59@01 _9$address@169@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (= _5$address@136@01 _9$address@169@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; copy_place$I64(_9$place(), _9$address, _1$place(), _1$address, _1$snapshot$0,
;   write)
; [eval] _9$place()
; [eval] _1$place()
; [eval] none < source_permission_amount
; [eval] compute_address(target_place, target_root_address)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _45$place<Place>  Place)) _45$address@125@01)
  (compute_address<Address> (as _9$place<Place>  Place) _9$address@169@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _37$place<Place>  Place)) _37$address@88@01)
  (compute_address<Address> (as _9$place<Place>  Place) _9$address@169@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (=
    _5$address@136@01
    (compute_address<Address> (as _9$place<Place>  Place) _9$address@169@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  _0$address@0@01
  (compute_address<Address> (as _9$place<Place>  Place) _9$address@169@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _37$place<Place>  Place) _37$address@88@01)
    (compute_address<Address> (as _9$place<Place>  Place) _9$address@169@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _45$place<Place>  Place) _45$address@125@01)
    (compute_address<Address> (as _9$place<Place>  Place) _9$address@169@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (=
    _7$address@157@01
    (compute_address<Address> (as _9$place<Place>  Place) _9$address@169@01))
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  _9$address@169@01
  (compute_address<Address> (as _9$place<Place>  Place) _9$address@169@01))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(declare-const $t@530@01 $Snap)
(assert (= $t@530@01 ($Snap.combine ($Snap.first $t@530@01) ($Snap.second $t@530@01))))
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (= (as _2$place<Place>  Place) (as _1$place<Place>  Place))
  (= _2$address@27@01 _1$address@4@01)
  (= _2$snapshot$3@31@01 _1$snapshot$0@5@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (= (as _4$place<Place>  Place) (as _1$place<Place>  Place))
  (= _4$address@105@01 _1$address@4@01)
  (= _44$snapshot$1@121@01 _1$snapshot$0@5@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (= (as _3$place<Place>  Place) (as _1$place<Place>  Place))
  (= _3$address@59@01 _1$address@4@01)
  (= _43$snapshot$1@115@01 _1$snapshot$0@5@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (= (as _8$place<Place>  Place) (as _1$place<Place>  Place))
  (= _8$address@163@01 _1$address@4@01)
  (= _2$snapshot$3@31@01 _1$snapshot$0@5@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second $t@530@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@530@01))
    ($Snap.second ($Snap.second $t@530@01)))))
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (= (as _8$place<Place>  Place) (as _9$place<Place>  Place))
  (= _8$address@163@01 _9$address@169@01)
  (= _2$snapshot$3@31@01 _1$snapshot$0@5@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (= (as _3$place<Place>  Place) (as _9$place<Place>  Place))
  (= _3$address@59@01 _9$address@169@01)
  (= _43$snapshot$1@115@01 _1$snapshot$0@5@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (= (as _4$place<Place>  Place) (as _9$place<Place>  Place))
  (= _4$address@105@01 _9$address@169@01)
  (= _44$snapshot$1@121@01 _1$snapshot$0@5@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (= (as _2$place<Place>  Place) (as _9$place<Place>  Place))
  (= _2$address@27@01 _9$address@169@01)
  (= _2$snapshot$3@31@01 _1$snapshot$0@5@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (= (as _1$place<Place>  Place) (as _9$place<Place>  Place))
  (= _1$address@4@01 _9$address@169@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (= ($Snap.second ($Snap.second $t@530@01)) $Snap.unit))
; [eval] valid$Snap$I64(source_snapshot)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _9$snapshot$2 == _1$snapshot$0
(declare-const $t@531@01 $Snap)
(assert (= $t@531@01 $Snap.unit))
; [eval] _9$snapshot$2 == _1$snapshot$0
(assert (= _9$snapshot$2@172@01 _1$snapshot$0@5@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; tmp$7 := assign$Bool$BinaryOp$LtCmp$Move$I64$Move$I64$$$$(_7$place(), _7$address,
;   _8$place(), _8$address, _8$snapshot$2, _9$place(), _9$address, _9$snapshot$2)
; [eval] _7$place()
; [eval] _8$place()
; [eval] _9$place()
; [eval] compute_address(target_place, target_address)
; [eval] Size$Bool$()
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _45$place<Place>  Place)) _45$address@125@01)
    (compute_address<Address> (as _7$place<Place>  Place) _7$address@157@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _37$place<Place>  Place)) _37$address@88@01)
    (compute_address<Address> (as _7$place<Place>  Place) _7$address@157@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (=
    _5$address@136@01
    (compute_address<Address> (as _7$place<Place>  Place) _7$address@157@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (=
    _0$address@0@01
    (compute_address<Address> (as _7$place<Place>  Place) _7$address@157@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _37$place<Place>  Place) _37$address@88@01)
    (compute_address<Address> (as _7$place<Place>  Place) _7$address@157@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _45$place<Place>  Place) _45$address@125@01)
    (compute_address<Address> (as _7$place<Place>  Place) _7$address@157@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  _7$address@157@01
  (compute_address<Address> (as _7$place<Place>  Place) _7$address@157@01))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (= (as _9$place<Place>  Place) (as _8$place<Place>  Place))
  (= _9$address@169@01 _8$address@163@01)
  (= _1$snapshot$0@5@01 _8$snapshot$2@166@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= _2$snapshot$3@31@01 _8$snapshot$2@166@01)))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [eval] valid$Snap$I64(operand1_value)
(set-option :timeout 0)
(push) ; 7
(assert (not (valid$Snap$I64<Bool> _8$snapshot$2@166@01)))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (valid$Snap$I64<Bool> _8$snapshot$2@166@01))
(push) ; 7
(set-option :timeout 10)
(assert (not (= _1$snapshot$0@5@01 _9$snapshot$2@172@01)))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [eval] valid$Snap$I64(operand2_value)
(set-option :timeout 0)
(push) ; 7
(assert (not (valid$Snap$I64<Bool> _9$snapshot$2@172@01)))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (valid$Snap$I64<Bool> _9$snapshot$2@172@01))
(declare-const result_value@532@01 Snap$Bool)
(declare-const $t@533@01 $Snap)
(assert (= $t@533@01 ($Snap.combine ($Snap.first $t@533@01) ($Snap.second $t@533@01))))
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (=
    (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _45$place<Place>  Place))
    (as _7$place<Place>  Place))
  (= _45$address@125@01 _7$address@157@01)
  (=
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> result_value@508@01)
    result_value@532@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (=
    (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _37$place<Place>  Place))
    (as _7$place<Place>  Place))
  (= _37$address@88@01 _7$address@157@01)
  (=
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> result_value@472@01)
    result_value@532@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second $t@533@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@533@01))
    ($Snap.second ($Snap.second $t@533@01)))))
; [eval] compute_address(operand1_place, operand1_root_address)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _45$place<Place>  Place)) _45$address@125@01)
  (compute_address<Address> (as _8$place<Place>  Place) _8$address@163@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _37$place<Place>  Place)) _37$address@88@01)
  (compute_address<Address> (as _8$place<Place>  Place) _8$address@163@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (=
    _5$address@136@01
    (compute_address<Address> (as _8$place<Place>  Place) _8$address@163@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  _0$address@0@01
  (compute_address<Address> (as _8$place<Place>  Place) _8$address@163@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _37$place<Place>  Place) _37$address@88@01)
    (compute_address<Address> (as _8$place<Place>  Place) _8$address@163@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _45$place<Place>  Place) _45$address@125@01)
    (compute_address<Address> (as _8$place<Place>  Place) _8$address@163@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second $t@533@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@533@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@533@01))))))
; [eval] compute_address(operand2_place, operand2_root_address)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _45$place<Place>  Place) _45$address@125@01)
    (compute_address<Address> (as _9$place<Place>  Place) _9$address@169@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _37$place<Place>  Place) _37$address@88@01)
    (compute_address<Address> (as _9$place<Place>  Place) _9$address@169@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  _0$address@0@01
  (compute_address<Address> (as _9$place<Place>  Place) _9$address@169@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (=
    _5$address@136@01
    (compute_address<Address> (as _9$place<Place>  Place) _9$address@169@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _37$place<Place>  Place)) _37$address@88@01)
  (compute_address<Address> (as _9$place<Place>  Place) _9$address@169@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _45$place<Place>  Place)) _45$address@125@01)
  (compute_address<Address> (as _9$place<Place>  Place) _9$address@169@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _8$place<Place>  Place) _8$address@163@01)
  (compute_address<Address> (as _9$place<Place>  Place) _9$address@169@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@533@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@533@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@533@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@533@01))))
  $Snap.unit))
; [eval] result_value == constructor$Snap$Bool$LtCmp_I64(operand1_value, operand2_value)
; [eval] constructor$Snap$Bool$LtCmp_I64(operand1_value, operand2_value)
(assert (=
  result_value@532@01
  (constructor$Snap$Bool$LtCmp_I64<Snap$Bool> _8$snapshot$2@166@01 _9$snapshot$2@172@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@533@01))))
  $Snap.unit))
; [eval] valid$Snap$Bool(result_value)
(assert (valid$Snap$Bool<Bool> result_value@532@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _7$snapshot$2 == tmp$7
(declare-const $t@534@01 $Snap)
(assert (= $t@534@01 $Snap.unit))
; [eval] _7$snapshot$2 == tmp$7
(assert (= _7$snapshot$2@160@01 result_value@532@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; exhale acc(MemoryBlock(_9$address, Size$I64$()), write)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _9$place<Place>  Place) _9$address@169@01)
  _9$address@169@01)))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(MemoryBlockStackDrop(_9$address, Size$I64$()), write)
; [eval] Size$I64$()
; [exec]
; exhale acc(MemoryBlock(_8$address, Size$I64$()), write)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _45$place<Place>  Place) _45$address@125@01)
    _8$address@163@01)
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _37$place<Place>  Place) _37$address@88@01)
    _8$address@163@01)
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= _0$address@0@01 _8$address@163@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (= _5$address@136@01 _8$address@163@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _37$place<Place>  Place)) _37$address@88@01)
  _8$address@163@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _45$place<Place>  Place)) _45$address@125@01)
  _8$address@163@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _8$place<Place>  Place) _8$address@163@01)
  _8$address@163@01)))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(MemoryBlockStackDrop(_8$address, Size$I64$()), write)
; [eval] Size$I64$()
; [eval] !destructor$Snap$Bool$$value(_7$snapshot$2)
; [eval] destructor$Snap$Bool$$value(_7$snapshot$2)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (destructor$Snap$Bool$$value<Bool> _7$snapshot$2@160@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (destructor$Snap$Bool$$value<Bool> _7$snapshot$2@160@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [then-branch: 17 | !(destructor$Snap$Bool$$value[Bool](_7$snapshot$2@160@01)) | live]
; [else-branch: 17 | destructor$Snap$Bool$$value[Bool](_7$snapshot$2@160@01) | live]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 17 | !(destructor$Snap$Bool$$value[Bool](_7$snapshot$2@160@01))]
(assert (not (destructor$Snap$Bool$$value<Bool> _7$snapshot$2@160@01)))
; [exec]
; label label__from__loop__label_bb1__label_bb2__to__label_2_custom
; [exec]
; inhale _10$snapshot$2 == _10$snapshot$1
(declare-const $t@535@01 $Snap)
(assert (= $t@535@01 $Snap.unit))
; [eval] _10$snapshot$2 == _10$snapshot$1
(assert (= _10$snapshot$2@9@01 _10$snapshot$1@8@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale _11$snapshot$3 == _11$snapshot$1
(declare-const $t@536@01 $Snap)
(assert (= $t@536@01 $Snap.unit))
; [eval] _11$snapshot$3 == _11$snapshot$1
(assert (= _11$snapshot$3@15@01 _11$snapshot$1@13@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _15$snapshot$2 == _15$snapshot$1
(declare-const $t@537@01 $Snap)
(assert (= $t@537@01 $Snap.unit))
; [eval] _15$snapshot$2 == _15$snapshot$1
(assert (= _15$snapshot$2@20@01 _15$snapshot$1@19@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _16$snapshot$2 == _16$snapshot$1
(declare-const $t@538@01 $Snap)
(assert (= $t@538@01 $Snap.unit))
; [eval] _16$snapshot$2 == _16$snapshot$1
(assert (= _16$snapshot$2@25@01 _16$snapshot$1@24@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _2$snapshot$4 == _2$snapshot$3
(declare-const $t@539@01 $Snap)
(assert (= $t@539@01 $Snap.unit))
; [eval] _2$snapshot$4 == _2$snapshot$3
(assert (= _2$snapshot$4@32@01 _2$snapshot$3@31@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _20$snapshot$2 == _20$snapshot$1
(declare-const $t@540@01 $Snap)
(assert (= $t@540@01 $Snap.unit))
; [eval] _20$snapshot$2 == _20$snapshot$1
(assert (= _20$snapshot$2@37@01 _20$snapshot$1@36@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _21$snapshot$2 == _21$snapshot$1
(declare-const $t@541@01 $Snap)
(assert (= $t@541@01 $Snap.unit))
; [eval] _21$snapshot$2 == _21$snapshot$1
(assert (= _21$snapshot$2@42@01 _21$snapshot$1@41@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _24$snapshot$2 == _24$snapshot$1
(declare-const $t@542@01 $Snap)
(assert (= $t@542@01 $Snap.unit))
; [eval] _24$snapshot$2 == _24$snapshot$1
(assert (= _24$snapshot$2@47@01 _24$snapshot$1@46@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _25$snapshot$2 == _25$snapshot$1
(declare-const $t@543@01 $Snap)
(assert (= $t@543@01 $Snap.unit))
; [eval] _25$snapshot$2 == _25$snapshot$1
(assert (= _25$snapshot$2@52@01 _25$snapshot$1@51@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _29$snapshot$2 == _29$snapshot$1
(declare-const $t@544@01 $Snap)
(assert (= $t@544@01 $Snap.unit))
; [eval] _29$snapshot$2 == _29$snapshot$1
(assert (= _29$snapshot$2@57@01 _29$snapshot$1@56@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _3$snapshot$5 == _3$snapshot$3
(declare-const $t@545@01 $Snap)
(assert (= $t@545@01 $Snap.unit))
; [eval] _3$snapshot$5 == _3$snapshot$3
(assert (= _3$snapshot$5@65@01 _3$snapshot$3@63@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _30$snapshot$2 == _30$snapshot$1
(declare-const $t@546@01 $Snap)
(assert (= $t@546@01 $Snap.unit))
; [eval] _30$snapshot$2 == _30$snapshot$1
(assert (= _30$snapshot$2@70@01 _30$snapshot$1@69@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _34$snapshot$3 == _34$snapshot$1
(declare-const $t@547@01 $Snap)
(assert (= $t@547@01 $Snap.unit))
; [eval] _34$snapshot$3 == _34$snapshot$1
(assert (= _34$snapshot$3@76@01 _34$snapshot$1@74@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _35$snapshot$2 == _35$snapshot$1
(declare-const $t@548@01 $Snap)
(assert (= $t@548@01 $Snap.unit))
; [eval] _35$snapshot$2 == _35$snapshot$1
(assert (= _35$snapshot$2@81@01 _35$snapshot$1@80@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _36$snapshot$2 == _36$snapshot$1
(declare-const $t@549@01 $Snap)
(assert (= $t@549@01 $Snap.unit))
; [eval] _36$snapshot$2 == _36$snapshot$1
(assert (= _36$snapshot$2@86@01 _36$snapshot$1@85@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _37$snapshot$2 == _37$snapshot$1
(declare-const $t@550@01 $Snap)
(assert (= $t@550@01 $Snap.unit))
; [eval] _37$snapshot$2 == _37$snapshot$1
(assert (= _37$snapshot$2@91@01 _37$snapshot$1@90@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _38$snapshot$3 == _38$snapshot$1
(declare-const $t@551@01 $Snap)
(assert (= $t@551@01 $Snap.unit))
; [eval] _38$snapshot$3 == _38$snapshot$1
(assert (= _38$snapshot$3@97@01 _38$snapshot$1@95@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _39$snapshot$3 == _39$snapshot$1
(declare-const $t@552@01 $Snap)
(assert (= $t@552@01 $Snap.unit))
; [eval] _39$snapshot$3 == _39$snapshot$1
(assert (= _39$snapshot$3@103@01 _39$snapshot$1@101@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _4$snapshot$5 == _4$snapshot$3
(declare-const $t@553@01 $Snap)
(assert (= $t@553@01 $Snap.unit))
; [eval] _4$snapshot$5 == _4$snapshot$3
(assert (= _4$snapshot$5@111@01 _4$snapshot$3@109@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _43$snapshot$3 == _43$snapshot$1
(declare-const $t@554@01 $Snap)
(assert (= $t@554@01 $Snap.unit))
; [eval] _43$snapshot$3 == _43$snapshot$1
(assert (= _43$snapshot$3@117@01 _43$snapshot$1@115@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _44$snapshot$3 == _44$snapshot$1
(declare-const $t@555@01 $Snap)
(assert (= $t@555@01 $Snap.unit))
; [eval] _44$snapshot$3 == _44$snapshot$1
(assert (= _44$snapshot$3@123@01 _44$snapshot$1@121@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _45$snapshot$3 == _45$snapshot$1
(declare-const $t@556@01 $Snap)
(assert (= $t@556@01 $Snap.unit))
; [eval] _45$snapshot$3 == _45$snapshot$1
(assert (= _45$snapshot$3@129@01 _45$snapshot$1@127@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _6$snapshot$2 == _6$snapshot$1
(declare-const $t@557@01 $Snap)
(assert (= $t@557@01 $Snap.unit))
; [eval] _6$snapshot$2 == _6$snapshot$1
(assert (= _6$snapshot$2@155@01 _6$snapshot$1@154@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _7$snapshot$3 == _7$snapshot$2
(declare-const $t@558@01 $Snap)
(assert (= $t@558@01 $Snap.unit))
; [eval] _7$snapshot$3 == _7$snapshot$2
(assert (= _7$snapshot$3@161@01 _7$snapshot$2@160@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _8$snapshot$3 == _8$snapshot$2
(declare-const $t@559@01 $Snap)
(assert (= $t@559@01 $Snap.unit))
; [eval] _8$snapshot$3 == _8$snapshot$2
(assert (= _8$snapshot$3@167@01 _8$snapshot$2@166@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _9$snapshot$3 == _9$snapshot$2
(declare-const $t@560@01 $Snap)
(assert (= $t@560@01 $Snap.unit))
; [eval] _9$snapshot$3 == _9$snapshot$2
(assert (= _9$snapshot$3@173@01 _9$snapshot$2@172@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale loop_variant$1$snapshot$3 == loop_variant$1$snapshot$2
(declare-const $t@561@01 $Snap)
(assert (= $t@561@01 $Snap.unit))
; [eval] loop_variant$1$snapshot$3 == loop_variant$1$snapshot$2
(assert (= loop_variant$1$snapshot$3@215@01 loop_variant$1$snapshot$2@214@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; label label_2_custom
; [exec]
; label_2_custom$marker := true
; [exec]
; inhale basic_block_marker$label_2_custom$marker()
(declare-const $t@562@01 $Snap)
(assert (= $t@562@01 $Snap.unit))
; [eval] basic_block_marker$label_2_custom$marker()
(assert (as basic_block_marker$label_2_custom$marker<Bool>  Bool))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; label label_bb24
; [exec]
; label_bb24$marker := true
; [exec]
; inhale basic_block_marker$label_bb24$marker()
(declare-const $t@563@01 $Snap)
(assert (= $t@563@01 $Snap.unit))
; [eval] basic_block_marker$label_bb24$marker()
(assert (as basic_block_marker$label_bb24$marker<Bool>  Bool))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlock(_47$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
(declare-const $t@564@01 $Snap)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _45$place<Place>  Place)) _45$address@125@01)
    _47$address@131@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _37$place<Place>  Place)) _37$address@88@01)
    _47$address@131@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= _5$address@136@01 _47$address@131@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (= _0$address@0@01 _47$address@131@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _37$place<Place>  Place) _37$address@88@01)
    _47$address@131@01)
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _45$place<Place>  Place) _45$address@125@01)
    _47$address@131@01)
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlockStackDrop(_47$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
(declare-const $t@565@01 $Snap)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= _5$address@136@01 _47$address@131@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (= _3$address@59@01 _47$address@131@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (= _2$address@27@01 _47$address@131@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (= _4$address@105@01 _47$address@131@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (= _7$address@157@01 _47$address@131@01)
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; write_place_constant$Tuple$$$(_5$place(), _5$address, constructor$Snap$Tuple$$$$())
; [eval] _5$place()
; [eval] constructor$Snap$Tuple$$$$()
; [eval] compute_address(target_place, target_root_address)
; [eval] Size$Tuple$$$$()
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _45$place<Place>  Place) _45$address@125@01)
    (compute_address<Address> (as _5$place<Place>  Place) _5$address@136@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _37$place<Place>  Place) _37$address@88@01)
    (compute_address<Address> (as _5$place<Place>  Place) _5$address@136@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    _0$address@0@01
    (compute_address<Address> (as _5$place<Place>  Place) _5$address@136@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  _5$address@136@01
  (compute_address<Address> (as _5$place<Place>  Place) _5$address@136@01))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [eval] valid$Snap$Tuple$$$(source_snapshot)
(declare-const $t@566@01 $Snap)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (= (as _6$place<Place>  Place) (as _5$place<Place>  Place))
  (= _6$address@152@01 _5$address@136@01))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _5$snapshot$1 == constructor$Snap$Tuple$$$$()
(declare-const $t@567@01 $Snap)
(assert (= $t@567@01 $Snap.unit))
; [eval] _5$snapshot$1 == constructor$Snap$Tuple$$$$()
; [eval] constructor$Snap$Tuple$$$$()
(assert (=
  _5$snapshot$1@138@01
  (as constructor$Snap$Tuple$$$$<Snap$Tuple$$$>  Snap$Tuple$$$)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; exhale acc(MemoryBlock(_47$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
; [exec]
; exhale acc(MemoryBlockStackDrop(_47$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
; [exec]
; into_memory_block$Bool(_7$place(), _7$address, _7$snapshot$3)
; [eval] _7$place()
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _37$place<Place>  Place))
    (as _7$place<Place>  Place))
  (= _37$address@88@01 _7$address@157@01)
  (=
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> result_value@472@01)
    _7$snapshot$3@161@01))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _45$place<Place>  Place))
    (as _7$place<Place>  Place))
  (= _45$address@125@01 _7$address@157@01)
  (=
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> result_value@508@01)
    _7$snapshot$3@161@01))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= result_value@532@01 _7$snapshot$3@161@01)))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [eval] compute_address(place, root_address)
; [eval] Size$Bool$()
(declare-const $t@568@01 $Snap)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _45$place<Place>  Place) _45$address@125@01)
    (compute_address<Address> (as _7$place<Place>  Place) _7$address@157@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _37$place<Place>  Place) _37$address@88@01)
    (compute_address<Address> (as _7$place<Place>  Place) _7$address@157@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    _0$address@0@01
    (compute_address<Address> (as _7$place<Place>  Place) _7$address@157@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _37$place<Place>  Place)) _37$address@88@01)
    (compute_address<Address> (as _7$place<Place>  Place) _7$address@157@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 8
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _45$place<Place>  Place)) _45$address@125@01)
    (compute_address<Address> (as _7$place<Place>  Place) _7$address@157@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; exhale acc(MemoryBlock(_7$address, Size$Bool$()), write)
; [eval] Size$Bool$()
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _7$place<Place>  Place) _7$address@157@01)
  _7$address@157@01)))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(MemoryBlockStackDrop(_7$address, Size$Bool$()), write)
; [eval] Size$Bool$()
; [exec]
; into_memory_block$Tuple$$$(_5$place(), _5$address, _5$snapshot$1)
; [eval] _5$place()
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (= (as _6$place<Place>  Place) (as _5$place<Place>  Place))
  (= _6$address@152@01 _5$address@136@01)
  (=
    (as constructor$Snap$Tuple$$$$<Snap$Tuple$$$>  Snap$Tuple$$$)
    _5$snapshot$1@138@01))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  (as constructor$Snap$Tuple$$$$<Snap$Tuple$$$>  Snap$Tuple$$$)
  _5$snapshot$1@138@01)))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [eval] compute_address(place, root_address)
; [eval] Size$Tuple$$$$()
(declare-const $t@569@01 $Snap)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _45$place<Place>  Place)) _45$address@125@01)
    (compute_address<Address> (as _5$place<Place>  Place) _5$address@136@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _37$place<Place>  Place)) _37$address@88@01)
    (compute_address<Address> (as _5$place<Place>  Place) _5$address@136@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    _0$address@0@01
    (compute_address<Address> (as _5$place<Place>  Place) _5$address@136@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _37$place<Place>  Place) _37$address@88@01)
    (compute_address<Address> (as _5$place<Place>  Place) _5$address@136@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _45$place<Place>  Place) _45$address@125@01)
    (compute_address<Address> (as _5$place<Place>  Place) _5$address@136@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; exhale acc(MemoryBlock(_5$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _5$place<Place>  Place) _5$address@136@01)
  _5$address@136@01)))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(MemoryBlockStackDrop(_5$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
; [exec]
; inhale acc(MemoryBlock(_49$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
(declare-const $t@570@01 $Snap)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _45$place<Place>  Place) _45$address@125@01)
    _49$address@132@01)
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _37$place<Place>  Place) _37$address@88@01)
    _49$address@132@01)
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (= _0$address@0@01 _49$address@132@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _37$place<Place>  Place)) _37$address@88@01)
    _49$address@132@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _45$place<Place>  Place)) _45$address@125@01)
    _49$address@132@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlockStackDrop(_49$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
(declare-const $t@571@01 $Snap)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (= _4$address@105@01 _49$address@132@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (= _2$address@27@01 _49$address@132@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (= _3$address@59@01 _49$address@132@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlock(_50$address, Size$Bool$()), write)
; [eval] Size$Bool$()
(declare-const $t@572@01 $Snap)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (= _49$address@132@01 _50$address@140@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _45$place<Place>  Place) _45$address@125@01)
    _50$address@140@01)
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _37$place<Place>  Place) _37$address@88@01)
    _50$address@140@01)
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (= _0$address@0@01 _50$address@140@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _37$place<Place>  Place)) _37$address@88@01)
    _50$address@140@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _45$place<Place>  Place)) _45$address@125@01)
    _50$address@140@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlockStackDrop(_50$address, Size$Bool$()), write)
; [eval] Size$Bool$()
(declare-const $t@573@01 $Snap)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (= _49$address@132@01 _50$address@140@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (= _4$address@105@01 _50$address@140@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (= _2$address@27@01 _50$address@140@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (= _3$address@59@01 _50$address@140@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; write_place_constant$Bool(_50$place(), _50$address, constructor$Snap$Bool$(false))
; [eval] _50$place()
; [eval] constructor$Snap$Bool$(false)
; [eval] compute_address(target_place, target_root_address)
; [eval] Size$Bool$()
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _45$place<Place>  Place)) _45$address@125@01)
    (compute_address<Address> (as _50$place<Place>  Place) _50$address@140@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _37$place<Place>  Place)) _37$address@88@01)
    (compute_address<Address> (as _50$place<Place>  Place) _50$address@140@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    _0$address@0@01
    (compute_address<Address> (as _50$place<Place>  Place) _50$address@140@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _37$place<Place>  Place) _37$address@88@01)
    (compute_address<Address> (as _50$place<Place>  Place) _50$address@140@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 8
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _45$place<Place>  Place) _45$address@125@01)
    (compute_address<Address> (as _50$place<Place>  Place) _50$address@140@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    _49$address@132@01
    (compute_address<Address> (as _50$place<Place>  Place) _50$address@140@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  _50$address@140@01
  (compute_address<Address> (as _50$place<Place>  Place) _50$address@140@01))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [eval] valid$Snap$Bool(source_snapshot)
(declare-const $t@574@01 $Snap)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _45$place<Place>  Place))
    (as _50$place<Place>  Place))
  (= _45$address@125@01 _50$address@140@01)
  (=
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> result_value@508@01)
    (constructor$Snap$Bool$<Snap$Bool> false)))))
(check-sat)
; unknown
(pop) ; 8
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _37$place<Place>  Place))
    (as _50$place<Place>  Place))
  (= _37$address@88@01 _50$address@140@01)
  (=
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> result_value@472@01)
    (constructor$Snap$Bool$<Snap$Bool> false)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _50$snapshot$1 == constructor$Snap$Bool$(false)
(declare-const $t@575@01 $Snap)
(assert (= $t@575@01 $Snap.unit))
; [eval] _50$snapshot$1 == constructor$Snap$Bool$(false)
; [eval] constructor$Snap$Bool$(false)
(assert (= _50$snapshot$1@142@01 (constructor$Snap$Bool$<Snap$Bool> false)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; label label_bb26
; [exec]
; label_bb26$marker := true
; [exec]
; inhale basic_block_marker$label_bb26$marker()
(declare-const $t@576@01 $Snap)
(assert (= $t@576@01 $Snap.unit))
; [eval] basic_block_marker$label_bb26$marker()
(assert (as basic_block_marker$label_bb26$marker<Bool>  Bool))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; write_place_constant$Tuple$$$(_49$place(), _49$address, constructor$Snap$Tuple$$$$())
; [eval] _49$place()
; [eval] constructor$Snap$Tuple$$$$()
; [eval] compute_address(target_place, target_root_address)
; [eval] Size$Tuple$$$$()
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  _49$address@132@01
  (compute_address<Address> (as _49$place<Place>  Place) _49$address@132@01))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [eval] valid$Snap$Tuple$$$(source_snapshot)
(declare-const $t@577@01 $Snap)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (= (as _6$place<Place>  Place) (as _49$place<Place>  Place))
  (= _6$address@152@01 _49$address@132@01))))
(check-sat)
; unknown
(pop) ; 8
; 0.01s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _49$snapshot$1 == constructor$Snap$Tuple$$$$()
(declare-const $t@578@01 $Snap)
(assert (= $t@578@01 $Snap.unit))
; [eval] _49$snapshot$1 == constructor$Snap$Tuple$$$$()
; [eval] constructor$Snap$Tuple$$$$()
(assert (=
  _49$snapshot$1@134@01
  (as constructor$Snap$Tuple$$$$<Snap$Tuple$$$>  Snap$Tuple$$$)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; label label_bb27
; [exec]
; label_bb27$marker := true
; [exec]
; inhale basic_block_marker$label_bb27$marker()
(declare-const $t@579@01 $Snap)
(assert (= $t@579@01 $Snap.unit))
; [eval] basic_block_marker$label_bb27$marker()
(assert (as basic_block_marker$label_bb27$marker<Bool>  Bool))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; into_memory_block$Bool(_50$place(), _50$address, _50$snapshot$1)
; [eval] _50$place()
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _37$place<Place>  Place))
    (as _50$place<Place>  Place))
  (= _37$address@88@01 _50$address@140@01)
  (=
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> result_value@472@01)
    _50$snapshot$1@142@01))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _45$place<Place>  Place))
    (as _50$place<Place>  Place))
  (= _45$address@125@01 _50$address@140@01)
  (=
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> result_value@508@01)
    _50$snapshot$1@142@01))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= (constructor$Snap$Bool$<Snap$Bool> false) _50$snapshot$1@142@01)))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [eval] compute_address(place, root_address)
; [eval] Size$Bool$()
(declare-const $t@580@01 $Snap)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _45$place<Place>  Place) _45$address@125@01)
    (compute_address<Address> (as _50$place<Place>  Place) _50$address@140@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _37$place<Place>  Place) _37$address@88@01)
    (compute_address<Address> (as _50$place<Place>  Place) _50$address@140@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    _0$address@0@01
    (compute_address<Address> (as _50$place<Place>  Place) _50$address@140@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _37$place<Place>  Place)) _37$address@88@01)
    (compute_address<Address> (as _50$place<Place>  Place) _50$address@140@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _45$place<Place>  Place)) _45$address@125@01)
    (compute_address<Address> (as _50$place<Place>  Place) _50$address@140@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; exhale acc(MemoryBlock(_50$address, Size$Bool$()), write)
; [eval] Size$Bool$()
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _50$place<Place>  Place) _50$address@140@01)
  _50$address@140@01)))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(MemoryBlockStackDrop(_50$address, Size$Bool$()), write)
; [eval] Size$Bool$()
; [exec]
; into_memory_block$Tuple$$$(_49$place(), _49$address, _49$snapshot$1)
; [eval] _49$place()
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (= (as _6$place<Place>  Place) (as _49$place<Place>  Place))
  (= _6$address@152@01 _49$address@132@01)
  (=
    (as constructor$Snap$Tuple$$$$<Snap$Tuple$$$>  Snap$Tuple$$$)
    _49$snapshot$1@134@01))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  (as constructor$Snap$Tuple$$$$<Snap$Tuple$$$>  Snap$Tuple$$$)
  _49$snapshot$1@134@01)))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [eval] compute_address(place, root_address)
; [eval] Size$Tuple$$$$()
(declare-const $t@581@01 $Snap)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _45$place<Place>  Place)) _45$address@125@01)
    (compute_address<Address> (as _49$place<Place>  Place) _49$address@132@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _37$place<Place>  Place)) _37$address@88@01)
    (compute_address<Address> (as _49$place<Place>  Place) _49$address@132@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    _0$address@0@01
    (compute_address<Address> (as _49$place<Place>  Place) _49$address@132@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _37$place<Place>  Place) _37$address@88@01)
    (compute_address<Address> (as _49$place<Place>  Place) _49$address@132@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _45$place<Place>  Place) _45$address@125@01)
    (compute_address<Address> (as _49$place<Place>  Place) _49$address@132@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; exhale acc(MemoryBlock(_49$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _49$place<Place>  Place) _49$address@132@01)
  _49$address@132@01)))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(MemoryBlockStackDrop(_49$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
; [exec]
; inhale acc(MemoryBlock(_54$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
(declare-const $t@582@01 $Snap)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _45$place<Place>  Place) _45$address@125@01)
    _54$address@144@01)
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _37$place<Place>  Place) _37$address@88@01)
    _54$address@144@01)
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (= _0$address@0@01 _54$address@144@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _37$place<Place>  Place)) _37$address@88@01)
    _54$address@144@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _45$place<Place>  Place)) _45$address@125@01)
    _54$address@144@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlockStackDrop(_54$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
(declare-const $t@583@01 $Snap)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (= _4$address@105@01 _54$address@144@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (= _2$address@27@01 _54$address@144@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (= _3$address@59@01 _54$address@144@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlock(_55$address, Size$Bool$()), write)
; [eval] Size$Bool$()
(declare-const $t@584@01 $Snap)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (= _54$address@144@01 _55$address@148@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _45$place<Place>  Place) _45$address@125@01)
    _55$address@148@01)
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _37$place<Place>  Place) _37$address@88@01)
    _55$address@148@01)
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (= _0$address@0@01 _55$address@148@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _37$place<Place>  Place)) _37$address@88@01)
    _55$address@148@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _45$place<Place>  Place)) _45$address@125@01)
    _55$address@148@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlockStackDrop(_55$address, Size$Bool$()), write)
; [eval] Size$Bool$()
(declare-const $t@585@01 $Snap)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (= _54$address@144@01 _55$address@148@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (= _4$address@105@01 _55$address@148@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (= _2$address@27@01 _55$address@148@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (= _3$address@59@01 _55$address@148@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; write_place_constant$Bool(_55$place(), _55$address, constructor$Snap$Bool$(false))
; [eval] _55$place()
; [eval] constructor$Snap$Bool$(false)
; [eval] compute_address(target_place, target_root_address)
; [eval] Size$Bool$()
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _45$place<Place>  Place)) _45$address@125@01)
    (compute_address<Address> (as _55$place<Place>  Place) _55$address@148@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _37$place<Place>  Place)) _37$address@88@01)
    (compute_address<Address> (as _55$place<Place>  Place) _55$address@148@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    _0$address@0@01
    (compute_address<Address> (as _55$place<Place>  Place) _55$address@148@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _37$place<Place>  Place) _37$address@88@01)
    (compute_address<Address> (as _55$place<Place>  Place) _55$address@148@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _45$place<Place>  Place) _45$address@125@01)
    (compute_address<Address> (as _55$place<Place>  Place) _55$address@148@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    _54$address@144@01
    (compute_address<Address> (as _55$place<Place>  Place) _55$address@148@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  _55$address@148@01
  (compute_address<Address> (as _55$place<Place>  Place) _55$address@148@01))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [eval] valid$Snap$Bool(source_snapshot)
(declare-const $t@586@01 $Snap)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _45$place<Place>  Place))
    (as _55$place<Place>  Place))
  (= _45$address@125@01 _55$address@148@01)
  (=
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> result_value@508@01)
    (constructor$Snap$Bool$<Snap$Bool> false)))))
(check-sat)
; unknown
(pop) ; 8
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _37$place<Place>  Place))
    (as _55$place<Place>  Place))
  (= _37$address@88@01 _55$address@148@01)
  (=
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> result_value@472@01)
    (constructor$Snap$Bool$<Snap$Bool> false)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _55$snapshot$1 == constructor$Snap$Bool$(false)
(declare-const $t@587@01 $Snap)
(assert (= $t@587@01 $Snap.unit))
; [eval] _55$snapshot$1 == constructor$Snap$Bool$(false)
; [eval] constructor$Snap$Bool$(false)
(assert (= _55$snapshot$1@150@01 (constructor$Snap$Bool$<Snap$Bool> false)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; label label_bb29
; [exec]
; label_bb29$marker := true
; [exec]
; inhale basic_block_marker$label_bb29$marker()
(declare-const $t@588@01 $Snap)
(assert (= $t@588@01 $Snap.unit))
; [eval] basic_block_marker$label_bb29$marker()
(assert (as basic_block_marker$label_bb29$marker<Bool>  Bool))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; write_place_constant$Tuple$$$(_54$place(), _54$address, constructor$Snap$Tuple$$$$())
; [eval] _54$place()
; [eval] constructor$Snap$Tuple$$$$()
; [eval] compute_address(target_place, target_root_address)
; [eval] Size$Tuple$$$$()
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  _54$address@144@01
  (compute_address<Address> (as _54$place<Place>  Place) _54$address@144@01))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [eval] valid$Snap$Tuple$$$(source_snapshot)
(declare-const $t@589@01 $Snap)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (= (as _6$place<Place>  Place) (as _54$place<Place>  Place))
  (= _6$address@152@01 _54$address@144@01))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _54$snapshot$1 == constructor$Snap$Tuple$$$$()
(declare-const $t@590@01 $Snap)
(assert (= $t@590@01 $Snap.unit))
; [eval] _54$snapshot$1 == constructor$Snap$Tuple$$$$()
; [eval] constructor$Snap$Tuple$$$$()
(assert (=
  _54$snapshot$1@146@01
  (as constructor$Snap$Tuple$$$$<Snap$Tuple$$$>  Snap$Tuple$$$)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; label label_bb30
; [exec]
; label_bb30$marker := true
; [exec]
; inhale basic_block_marker$label_bb30$marker()
(declare-const $t@591@01 $Snap)
(assert (= $t@591@01 $Snap.unit))
; [eval] basic_block_marker$label_bb30$marker()
(assert (as basic_block_marker$label_bb30$marker<Bool>  Bool))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; into_memory_block$Bool(_55$place(), _55$address, _55$snapshot$1)
; [eval] _55$place()
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _37$place<Place>  Place))
    (as _55$place<Place>  Place))
  (= _37$address@88@01 _55$address@148@01)
  (=
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> result_value@472@01)
    _55$snapshot$1@150@01))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _45$place<Place>  Place))
    (as _55$place<Place>  Place))
  (= _45$address@125@01 _55$address@148@01)
  (=
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> result_value@508@01)
    _55$snapshot$1@150@01))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= (constructor$Snap$Bool$<Snap$Bool> false) _55$snapshot$1@150@01)))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [eval] compute_address(place, root_address)
; [eval] Size$Bool$()
(declare-const $t@592@01 $Snap)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _45$place<Place>  Place) _45$address@125@01)
    (compute_address<Address> (as _55$place<Place>  Place) _55$address@148@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _37$place<Place>  Place) _37$address@88@01)
    (compute_address<Address> (as _55$place<Place>  Place) _55$address@148@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    _0$address@0@01
    (compute_address<Address> (as _55$place<Place>  Place) _55$address@148@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _37$place<Place>  Place)) _37$address@88@01)
    (compute_address<Address> (as _55$place<Place>  Place) _55$address@148@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _45$place<Place>  Place)) _45$address@125@01)
    (compute_address<Address> (as _55$place<Place>  Place) _55$address@148@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; exhale acc(MemoryBlock(_55$address, Size$Bool$()), write)
; [eval] Size$Bool$()
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _55$place<Place>  Place) _55$address@148@01)
  _55$address@148@01)))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(MemoryBlockStackDrop(_55$address, Size$Bool$()), write)
; [eval] Size$Bool$()
; [exec]
; into_memory_block$Tuple$$$(_54$place(), _54$address, _54$snapshot$1)
; [eval] _54$place()
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (= (as _6$place<Place>  Place) (as _54$place<Place>  Place))
  (= _6$address@152@01 _54$address@144@01)
  (=
    (as constructor$Snap$Tuple$$$$<Snap$Tuple$$$>  Snap$Tuple$$$)
    _54$snapshot$1@146@01))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  (as constructor$Snap$Tuple$$$$<Snap$Tuple$$$>  Snap$Tuple$$$)
  _54$snapshot$1@146@01)))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [eval] compute_address(place, root_address)
; [eval] Size$Tuple$$$$()
(declare-const $t@593@01 $Snap)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _45$place<Place>  Place)) _45$address@125@01)
    (compute_address<Address> (as _54$place<Place>  Place) _54$address@144@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _37$place<Place>  Place)) _37$address@88@01)
    (compute_address<Address> (as _54$place<Place>  Place) _54$address@144@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    _0$address@0@01
    (compute_address<Address> (as _54$place<Place>  Place) _54$address@144@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _37$place<Place>  Place) _37$address@88@01)
    (compute_address<Address> (as _54$place<Place>  Place) _54$address@144@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _45$place<Place>  Place) _45$address@125@01)
    (compute_address<Address> (as _54$place<Place>  Place) _54$address@144@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; exhale acc(MemoryBlock(_54$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _54$place<Place>  Place) _54$address@144@01)
  _54$address@144@01)))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(MemoryBlockStackDrop(_54$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
; [exec]
; copy_place$I64(_0$place(), _0$address, _3$place(), _3$address, _3$snapshot$5,
;   write)
; [eval] _0$place()
; [eval] _3$place()
; [eval] none < source_permission_amount
; [eval] compute_address(target_place, target_root_address)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _45$place<Place>  Place)) _45$address@125@01)
  (compute_address<Address> (as _0$place<Place>  Place) _0$address@0@01))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _37$place<Place>  Place)) _37$address@88@01)
  (compute_address<Address> (as _0$place<Place>  Place) _0$address@0@01))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  _0$address@0@01
  (compute_address<Address> (as _0$place<Place>  Place) _0$address@0@01))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= _43$snapshot$1@115@01 _3$snapshot$5@65@01)))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(declare-const $t@594@01 $Snap)
(assert (= $t@594@01 ($Snap.combine ($Snap.first $t@594@01) ($Snap.second $t@594@01))))
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (= (as _1$place<Place>  Place) (as _3$place<Place>  Place))
  (= _1$address@4@01 _3$address@59@01)
  (= _1$snapshot$0@5@01 _3$snapshot$5@65@01))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (= (as _2$place<Place>  Place) (as _3$place<Place>  Place))
  (= _2$address@27@01 _3$address@59@01)
  (= _2$snapshot$3@31@01 _3$snapshot$5@65@01))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (= (as _4$place<Place>  Place) (as _3$place<Place>  Place))
  (= _4$address@105@01 _3$address@59@01)
  (= _44$snapshot$1@121@01 _3$snapshot$5@65@01))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second $t@594@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@594@01))
    ($Snap.second ($Snap.second $t@594@01)))))
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (= (as _4$place<Place>  Place) (as _0$place<Place>  Place))
  (= _4$address@105@01 _0$address@0@01)
  (= _44$snapshot$1@121@01 _3$snapshot$5@65@01))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (= (as _2$place<Place>  Place) (as _0$place<Place>  Place))
  (= _2$address@27@01 _0$address@0@01)
  (= _2$snapshot$3@31@01 _3$snapshot$5@65@01))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (= (as _1$place<Place>  Place) (as _0$place<Place>  Place))
  (= _1$address@4@01 _0$address@0@01)
  (= _1$snapshot$0@5@01 _3$snapshot$5@65@01))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (= (as _3$place<Place>  Place) (as _0$place<Place>  Place))
  (= _3$address@59@01 _0$address@0@01))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (= ($Snap.second ($Snap.second $t@594@01)) $Snap.unit))
; [eval] valid$Snap$I64(source_snapshot)
(assert (valid$Snap$I64<Bool> _3$snapshot$5@65@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _0$snapshot$1 == _3$snapshot$5
(declare-const $t@595@01 $Snap)
(assert (= $t@595@01 $Snap.unit))
; [eval] _0$snapshot$1 == _3$snapshot$5
(assert (= _0$snapshot$1@2@01 _3$snapshot$5@65@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; into_memory_block$I64(_4$place(), _4$address, _4$snapshot$5)
; [eval] _4$place()
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (= (as _0$place<Place>  Place) (as _4$place<Place>  Place))
  (= _0$address@0@01 _4$address@105@01)
  (= _3$snapshot$5@65@01 _4$snapshot$5@111@01))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= _44$snapshot$1@121@01 _4$snapshot$5@111@01)))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [eval] compute_address(place, root_address)
; [eval] Size$I64$()
(declare-const $t@596@01 $Snap)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _45$place<Place>  Place) _45$address@125@01)
    (compute_address<Address> (as _4$place<Place>  Place) _4$address@105@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _37$place<Place>  Place) _37$address@88@01)
    (compute_address<Address> (as _4$place<Place>  Place) _4$address@105@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _37$place<Place>  Place)) _37$address@88@01)
  (compute_address<Address> (as _4$place<Place>  Place) _4$address@105@01))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _45$place<Place>  Place)) _45$address@125@01)
  (compute_address<Address> (as _4$place<Place>  Place) _4$address@105@01))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; exhale acc(MemoryBlock(_4$address, Size$I64$()), write)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _4$place<Place>  Place) _4$address@105@01)
  _4$address@105@01)))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(MemoryBlockStackDrop(_4$address, Size$I64$()), write)
; [eval] Size$I64$()
; [exec]
; into_memory_block$I64(_3$place(), _3$address, _3$snapshot$5)
; [eval] _3$place()
; [eval] compute_address(place, root_address)
; [eval] Size$I64$()
(declare-const $t@597@01 $Snap)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _45$place<Place>  Place)) _45$address@125@01)
  (compute_address<Address> (as _3$place<Place>  Place) _3$address@59@01))))
(check-sat)
; unknown
(pop) ; 8
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _37$place<Place>  Place)) _37$address@88@01)
  (compute_address<Address> (as _3$place<Place>  Place) _3$address@59@01))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _37$place<Place>  Place) _37$address@88@01)
    (compute_address<Address> (as _3$place<Place>  Place) _3$address@59@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _45$place<Place>  Place) _45$address@125@01)
    (compute_address<Address> (as _3$place<Place>  Place) _3$address@59@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; exhale acc(MemoryBlock(_3$address, Size$I64$()), write)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _3$place<Place>  Place) _3$address@59@01)
  _3$address@59@01)))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(MemoryBlockStackDrop(_3$address, Size$I64$()), write)
; [eval] Size$I64$()
; [exec]
; into_memory_block$I64(_2$place(), _2$address, _2$snapshot$4)
; [eval] _2$place()
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (= (as _0$place<Place>  Place) (as _2$place<Place>  Place))
  (= _0$address@0@01 _2$address@27@01)
  (= _3$snapshot$5@65@01 _2$snapshot$4@32@01))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= _2$snapshot$3@31@01 _2$snapshot$4@32@01)))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [eval] compute_address(place, root_address)
; [eval] Size$I64$()
(declare-const $t@598@01 $Snap)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _45$place<Place>  Place) _45$address@125@01)
    (compute_address<Address> (as _2$place<Place>  Place) _2$address@27@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _37$place<Place>  Place) _37$address@88@01)
    (compute_address<Address> (as _2$place<Place>  Place) _2$address@27@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _37$place<Place>  Place)) _37$address@88@01)
  (compute_address<Address> (as _2$place<Place>  Place) _2$address@27@01))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _45$place<Place>  Place)) _45$address@125@01)
  (compute_address<Address> (as _2$place<Place>  Place) _2$address@27@01))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; exhale acc(MemoryBlock(_2$address, Size$I64$()), write)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _2$place<Place>  Place) _2$address@27@01)
  _2$address@27@01)))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(MemoryBlockStackDrop(_2$address, Size$I64$()), write)
; [eval] Size$I64$()
; [exec]
; label return_label
; [exec]
; return_label$marker := true
; [exec]
; inhale basic_block_marker$return_label$marker()
(declare-const $t@599@01 $Snap)
(assert (= $t@599@01 $Snap.unit))
; [eval] basic_block_marker$return_label$marker()
(assert (as basic_block_marker$return_label$marker<Bool>  Bool))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; into_memory_block$I64(_1$place(), _1$address, _1$snapshot$0)
; [eval] _1$place()
; [eval] compute_address(place, root_address)
; [eval] Size$I64$()
(declare-const $t@600@01 $Snap)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _45$place<Place>  Place)) _45$address@125@01)
  (compute_address<Address> (as _1$place<Place>  Place) _1$address@4@01))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _37$place<Place>  Place)) _37$address@88@01)
  (compute_address<Address> (as _1$place<Place>  Place) _1$address@4@01))))
(check-sat)
; unknown
(pop) ; 8
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _37$place<Place>  Place) _37$address@88@01)
    (compute_address<Address> (as _1$place<Place>  Place) _1$address@4@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 8
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _45$place<Place>  Place) _45$address@125@01)
    (compute_address<Address> (as _1$place<Place>  Place) _1$address@4@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; exhale acc(MemoryBlock(_1$address, Size$I64$()), write)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _1$place<Place>  Place) _1$address@4@01)
  _1$address@4@01)))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(OwnedNonAliased$I64(_0$place(), _0$address, _0$snapshot$1), write) &&
;   valid$Snap$I64(_0$snapshot$1)
; [eval] _0$place()
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= _3$snapshot$5@65@01 _0$snapshot$1@2@01)))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [eval] valid$Snap$I64(_0$snapshot$1)
(set-option :timeout 0)
(push) ; 8
(assert (not (valid$Snap$I64<Bool> _0$snapshot$1@2@01)))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (valid$Snap$I64<Bool> _0$snapshot$1@2@01))
; [exec]
; lft_tok_sep_return$2(lft_1$snapshot$1, bw15$snapshot$0, bw16$snapshot$0, lifetime_token_perm_amount$0$snapshot$0 /
;   81)
; [eval] lifetime_token_perm_amount$0$snapshot$0 / 81
; [eval] none < rd_perm
(push) ; 8
(assert (not (or
  (= (/ lifetime_token_perm_amount$0$snapshot$0@207@01 (to_real 81)) $Perm.No)
  (< $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@207@01 (to_real 81))))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(push) ; 8
(set-option :timeout 10)
(assert (not (< $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@207@01 (to_real 81)))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [eval] lft == intersect(Set(lft_1, lft_2))
; [eval] intersect(Set(lft_1, lft_2))
; [eval] Set(lft_1, lft_2)
(declare-const $t@601@01 $Snap)
(assert (= $t@601@01 ($Snap.combine ($Snap.first $t@601@01) ($Snap.second $t@601@01))))
(set-option :timeout 0)
(push) ; 8
(assert (not (or
  (= (/ lifetime_token_perm_amount$0$snapshot$0@207@01 (to_real 81)) $Perm.No)
  (< $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@207@01 (to_real 81))))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(declare-const $t@602@01 $Snap)
(assert (and
  (=>
    (<
      $Perm.No
      (-
        lifetime_token_perm_amount$0$snapshot$0@207@01
        ($Perm.min
          lifetime_token_perm_amount$0$snapshot$0@207@01
          (/ lifetime_token_perm_amount$0$snapshot$0@207@01 (to_real 81)))))
    (= $t@602@01 $t@232@01))
  (=>
    (< $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@207@01 (to_real 81)))
    (= $t@602@01 ($Snap.first $t@601@01)))))
(assert (<=
  $Perm.No
  (+
    (-
      lifetime_token_perm_amount$0$snapshot$0@207@01
      ($Perm.min
        lifetime_token_perm_amount$0$snapshot$0@207@01
        (/ lifetime_token_perm_amount$0$snapshot$0@207@01 (to_real 81))))
    (/ lifetime_token_perm_amount$0$snapshot$0@207@01 (to_real 81)))))
(push) ; 8
(assert (not (or
  (= (/ lifetime_token_perm_amount$0$snapshot$0@207@01 (to_real 81)) $Perm.No)
  (< $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@207@01 (to_real 81))))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(declare-const $t@603@01 $Snap)
(assert (and
  (=>
    (<
      $Perm.No
      (-
        lifetime_token_perm_amount$0$snapshot$0@207@01
        ($Perm.min
          lifetime_token_perm_amount$0$snapshot$0@207@01
          (/ lifetime_token_perm_amount$0$snapshot$0@207@01 (to_real 81)))))
    (= $t@603@01 $t@233@01))
  (=>
    (< $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@207@01 (to_real 81)))
    (= $t@603@01 ($Snap.second $t@601@01)))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; exhale acc(LifetimeToken(bw15$snapshot$0), lifetime_token_perm_amount$0$snapshot$0)
(set-option :timeout 0)
(push) ; 8
(assert (not (or
  (= lifetime_token_perm_amount$0$snapshot$0@207@01 $Perm.No)
  (< $Perm.No lifetime_token_perm_amount$0$snapshot$0@207@01))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  (-
    (+
      (-
        lifetime_token_perm_amount$0$snapshot$0@207@01
        ($Perm.min
          lifetime_token_perm_amount$0$snapshot$0@207@01
          (/ lifetime_token_perm_amount$0$snapshot$0@207@01 (to_real 81))))
      (/ lifetime_token_perm_amount$0$snapshot$0@207@01 (to_real 81)))
    ($Perm.min
      (+
        (-
          lifetime_token_perm_amount$0$snapshot$0@207@01
          ($Perm.min
            lifetime_token_perm_amount$0$snapshot$0@207@01
            (/ lifetime_token_perm_amount$0$snapshot$0@207@01 (to_real 81))))
        (/ lifetime_token_perm_amount$0$snapshot$0@207@01 (to_real 81)))
      lifetime_token_perm_amount$0$snapshot$0@207@01))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(assert (not (or
  (=
    (-
      lifetime_token_perm_amount$0$snapshot$0@207@01
      ($Perm.min
        (+
          (-
            lifetime_token_perm_amount$0$snapshot$0@207@01
            ($Perm.min
              lifetime_token_perm_amount$0$snapshot$0@207@01
              (/ lifetime_token_perm_amount$0$snapshot$0@207@01 (to_real 81))))
          (/ lifetime_token_perm_amount$0$snapshot$0@207@01 (to_real 81)))
        lifetime_token_perm_amount$0$snapshot$0@207@01))
    $Perm.No)
  (<
    (-
      lifetime_token_perm_amount$0$snapshot$0@207@01
      ($Perm.min
        (+
          (-
            lifetime_token_perm_amount$0$snapshot$0@207@01
            ($Perm.min
              lifetime_token_perm_amount$0$snapshot$0@207@01
              (/ lifetime_token_perm_amount$0$snapshot$0@207@01 (to_real 81))))
          (/ lifetime_token_perm_amount$0$snapshot$0@207@01 (to_real 81)))
        lifetime_token_perm_amount$0$snapshot$0@207@01))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(push) ; 8
(set-option :timeout 10)
(assert (not (< $Perm.No lifetime_token_perm_amount$0$snapshot$0@207@01)))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(LifetimeToken(bw16$snapshot$0), lifetime_token_perm_amount$0$snapshot$0)
(set-option :timeout 0)
(push) ; 8
(assert (not (or
  (= lifetime_token_perm_amount$0$snapshot$0@207@01 $Perm.No)
  (< $Perm.No lifetime_token_perm_amount$0$snapshot$0@207@01))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  (-
    (+
      (-
        lifetime_token_perm_amount$0$snapshot$0@207@01
        ($Perm.min
          lifetime_token_perm_amount$0$snapshot$0@207@01
          (/ lifetime_token_perm_amount$0$snapshot$0@207@01 (to_real 81))))
      (/ lifetime_token_perm_amount$0$snapshot$0@207@01 (to_real 81)))
    ($Perm.min
      (+
        (-
          lifetime_token_perm_amount$0$snapshot$0@207@01
          ($Perm.min
            lifetime_token_perm_amount$0$snapshot$0@207@01
            (/ lifetime_token_perm_amount$0$snapshot$0@207@01 (to_real 81))))
        (/ lifetime_token_perm_amount$0$snapshot$0@207@01 (to_real 81)))
      lifetime_token_perm_amount$0$snapshot$0@207@01))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(assert (not (or
  (=
    (-
      lifetime_token_perm_amount$0$snapshot$0@207@01
      ($Perm.min
        (+
          (-
            lifetime_token_perm_amount$0$snapshot$0@207@01
            ($Perm.min
              lifetime_token_perm_amount$0$snapshot$0@207@01
              (/ lifetime_token_perm_amount$0$snapshot$0@207@01 (to_real 81))))
          (/ lifetime_token_perm_amount$0$snapshot$0@207@01 (to_real 81)))
        lifetime_token_perm_amount$0$snapshot$0@207@01))
    $Perm.No)
  (<
    (-
      lifetime_token_perm_amount$0$snapshot$0@207@01
      ($Perm.min
        (+
          (-
            lifetime_token_perm_amount$0$snapshot$0@207@01
            ($Perm.min
              lifetime_token_perm_amount$0$snapshot$0@207@01
              (/ lifetime_token_perm_amount$0$snapshot$0@207@01 (to_real 81))))
          (/ lifetime_token_perm_amount$0$snapshot$0@207@01 (to_real 81)))
        lifetime_token_perm_amount$0$snapshot$0@207@01))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(push) ; 8
(set-option :timeout 10)
(assert (not (< $Perm.No lifetime_token_perm_amount$0$snapshot$0@207@01)))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [eval] loop__label_bb1__label_bb2$marker && (label_2_custom$marker && (label_bb24$marker && (label_bb26$marker && (label_bb27$marker && (label_bb29$marker && label_bb30$marker)))))
(set-option :timeout 0)
(push) ; 8
; [then-branch: 18 | True | live]
; [else-branch: 18 | False | live]
(push) ; 9
; [then-branch: 18 | True]
(push) ; 10
; [then-branch: 19 | True | live]
; [else-branch: 19 | False | live]
(push) ; 11
; [then-branch: 19 | True]
(push) ; 12
; [then-branch: 20 | True | live]
; [else-branch: 20 | False | live]
(push) ; 13
; [then-branch: 20 | True]
(push) ; 14
; [then-branch: 21 | True | live]
; [else-branch: 21 | False | live]
(push) ; 15
; [then-branch: 21 | True]
(push) ; 16
; [then-branch: 22 | True | live]
; [else-branch: 22 | False | live]
(push) ; 17
; [then-branch: 22 | True]
(push) ; 18
; [then-branch: 23 | True | live]
; [else-branch: 23 | False | live]
(push) ; 19
; [then-branch: 23 | True]
(pop) ; 19
(push) ; 19
; [else-branch: 23 | False]
(assert false)
(pop) ; 19
(pop) ; 18
; Joined path conditions
; Joined path conditions
(pop) ; 17
(push) ; 17
; [else-branch: 22 | False]
(assert false)
(pop) ; 17
(pop) ; 16
; Joined path conditions
; Joined path conditions
(pop) ; 15
(push) ; 15
; [else-branch: 21 | False]
(assert false)
(pop) ; 15
(pop) ; 14
; Joined path conditions
; Joined path conditions
(pop) ; 13
(push) ; 13
; [else-branch: 20 | False]
(assert false)
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(pop) ; 11
(push) ; 11
; [else-branch: 19 | False]
(assert false)
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(pop) ; 9
(push) ; 9
; [else-branch: 18 | False]
(assert false)
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(push) ; 8
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 8
; 0.01s
; (get-info :all-statistics)
; [then-branch: 24 | True | live]
; [else-branch: 24 | False | dead]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 24 | True]
; [exec]
; into_memory_block$Tuple$$$(_6$place(), _6$address, _6$snapshot$2)
; [eval] _6$place()
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  (as constructor$Snap$Tuple$$$$<Snap$Tuple$$$>  Snap$Tuple$$$)
  _6$snapshot$2@155@01)))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [eval] compute_address(place, root_address)
; [eval] Size$Tuple$$$$()
(declare-const $t@604@01 $Snap)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _45$place<Place>  Place) _45$address@125@01)
    (compute_address<Address> (as _6$place<Place>  Place) _6$address@152@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _37$place<Place>  Place) _37$address@88@01)
    (compute_address<Address> (as _6$place<Place>  Place) _6$address@152@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _37$place<Place>  Place)) _37$address@88@01)
    (compute_address<Address> (as _6$place<Place>  Place) _6$address@152@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 9
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _45$place<Place>  Place)) _45$address@125@01)
    (compute_address<Address> (as _6$place<Place>  Place) _6$address@152@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 9
; 0.01s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; exhale acc(MemoryBlock(_6$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _6$place<Place>  Place) _6$address@152@01)
  _6$address@152@01)))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [eval] loop__label_bb1__label_bb2$marker && (label_2_custom$marker && (label_bb24$marker && (label_bb26$marker && (label_bb27$marker && (label_bb29$marker && label_bb30$marker)))))
(set-option :timeout 0)
(push) ; 9
; [then-branch: 25 | True | live]
; [else-branch: 25 | False | live]
(push) ; 10
; [then-branch: 25 | True]
(push) ; 11
; [then-branch: 26 | True | live]
; [else-branch: 26 | False | live]
(push) ; 12
; [then-branch: 26 | True]
(push) ; 13
; [then-branch: 27 | True | live]
; [else-branch: 27 | False | live]
(push) ; 14
; [then-branch: 27 | True]
(push) ; 15
; [then-branch: 28 | True | live]
; [else-branch: 28 | False | live]
(push) ; 16
; [then-branch: 28 | True]
(push) ; 17
; [then-branch: 29 | True | live]
; [else-branch: 29 | False | live]
(push) ; 18
; [then-branch: 29 | True]
(push) ; 19
; [then-branch: 30 | True | live]
; [else-branch: 30 | False | live]
(push) ; 20
; [then-branch: 30 | True]
(pop) ; 20
(push) ; 20
; [else-branch: 30 | False]
(assert false)
(pop) ; 20
(pop) ; 19
; Joined path conditions
; Joined path conditions
(pop) ; 18
(push) ; 18
; [else-branch: 29 | False]
(assert false)
(pop) ; 18
(pop) ; 17
; Joined path conditions
; Joined path conditions
(pop) ; 16
(push) ; 16
; [else-branch: 28 | False]
(assert false)
(pop) ; 16
(pop) ; 15
; Joined path conditions
; Joined path conditions
(pop) ; 14
(push) ; 14
; [else-branch: 27 | False]
(assert false)
(pop) ; 14
(pop) ; 13
; Joined path conditions
; Joined path conditions
(pop) ; 12
(push) ; 12
; [else-branch: 26 | False]
(assert false)
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(pop) ; 10
(push) ; 10
; [else-branch: 25 | False]
(assert false)
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(push) ; 9
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 9
; 0.01s
; (get-info :all-statistics)
; [then-branch: 31 | True | live]
; [else-branch: 31 | False | dead]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 31 | True]
; [exec]
; into_memory_block$Bool(field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(_37$place()),
;   _37$address, destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(_37$snapshot$2))
; [eval] field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(_37$place())
; [eval] _37$place()
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(_37$snapshot$2)
(push) ; 10
(set-option :timeout 10)
(assert (not (and
  (=
    (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _45$place<Place>  Place))
    (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _37$place<Place>  Place)))
  (= _45$address@125@01 _37$address@88@01)
  (=
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> result_value@508@01)
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> _37$snapshot$2@91@01)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> result_value@472@01)
  (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> _37$snapshot$2@91@01))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [eval] compute_address(place, root_address)
; [eval] Size$Bool$()
(declare-const $t@605@01 $Snap)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _45$place<Place>  Place)) _45$address@125@01)
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _37$place<Place>  Place)) _37$address@88@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 10
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _37$place<Place>  Place)) _37$address@88@01)
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _37$place<Place>  Place)) _37$address@88@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _37$place<Place>  Place) _37$address@88@01)
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _37$place<Place>  Place)) _37$address@88@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 10
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _45$place<Place>  Place) _45$address@125@01)
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _37$place<Place>  Place)) _37$address@88@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] loop__label_bb1__label_bb2$marker && (label_2_custom$marker && (label_bb24$marker && (label_bb26$marker && (label_bb27$marker && (label_bb29$marker && label_bb30$marker)))))
(set-option :timeout 0)
(push) ; 10
; [then-branch: 32 | True | live]
; [else-branch: 32 | False | live]
(push) ; 11
; [then-branch: 32 | True]
(push) ; 12
; [then-branch: 33 | True | live]
; [else-branch: 33 | False | live]
(push) ; 13
; [then-branch: 33 | True]
(push) ; 14
; [then-branch: 34 | True | live]
; [else-branch: 34 | False | live]
(push) ; 15
; [then-branch: 34 | True]
(push) ; 16
; [then-branch: 35 | True | live]
; [else-branch: 35 | False | live]
(push) ; 17
; [then-branch: 35 | True]
(push) ; 18
; [then-branch: 36 | True | live]
; [else-branch: 36 | False | live]
(push) ; 19
; [then-branch: 36 | True]
(push) ; 20
; [then-branch: 37 | True | live]
; [else-branch: 37 | False | live]
(push) ; 21
; [then-branch: 37 | True]
(pop) ; 21
(push) ; 21
; [else-branch: 37 | False]
(assert false)
(pop) ; 21
(pop) ; 20
; Joined path conditions
; Joined path conditions
(pop) ; 19
(push) ; 19
; [else-branch: 36 | False]
(assert false)
(pop) ; 19
(pop) ; 18
; Joined path conditions
; Joined path conditions
(pop) ; 17
(push) ; 17
; [else-branch: 35 | False]
(assert false)
(pop) ; 17
(pop) ; 16
; Joined path conditions
; Joined path conditions
(pop) ; 15
(push) ; 15
; [else-branch: 34 | False]
(assert false)
(pop) ; 15
(pop) ; 14
; Joined path conditions
; Joined path conditions
(pop) ; 13
(push) ; 13
; [else-branch: 33 | False]
(assert false)
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(pop) ; 11
(push) ; 11
; [else-branch: 32 | False]
(assert false)
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(push) ; 10
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [then-branch: 38 | True | live]
; [else-branch: 38 | False | dead]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 38 | True]
; [exec]
; memory_block_join$Tuple$$I64$Bool$$I64$Bool$(_37$address, write)
; [eval] none < permission_amount
; [eval] PaddingSize$Tuple$$I64$Bool$$I64$Bool$$()
(push) ; 11
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _37$place<Place>  Place)) _37$address@88@01)
    _37$address@88@01)
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 11
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _45$place<Place>  Place)) _45$address@125@01)
    _37$address@88@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _37$place<Place>  Place)) _37$address@88@01)
    _37$address@88@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _37$place<Place>  Place) _37$address@88@01)
  _37$address@88@01)))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [eval] field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _37$place<Place>  Place)) _37$address@88@01)
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _37$address@88@01))
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _45$place<Place>  Place)) _45$address@125@01)
  (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _37$address@88@01))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _37$place<Place>  Place)) _37$address@88@01)
  (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _37$address@88@01))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [eval] field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address)
; [eval] Size$Bool$()
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _37$place<Place>  Place)) _37$address@88@01)
  (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _37$address@88@01))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(declare-const $t@606@01 $Snap)
(assert (= $t@606@01 ($Snap.combine ($Snap.first $t@606@01) ($Snap.second $t@606@01))))
; [eval] Size$Tuple$$I64$Bool$$I64$Bool$$()
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _45$place<Place>  Place) _45$address@125@01)
    _37$address@88@01)
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _45$place<Place>  Place)) _45$address@125@01)
    _37$address@88@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(assert (= ($Snap.second $t@606@01) $Snap.unit))
; [eval] (forall snapshot: Snap$Tuple$$I64$Bool$$I64$Bool$ :: { to_bytes$Tuple$$I64$Bool$$I64$Bool$(snapshot) } old(MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address), Size$I64$()) == to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot))) && old(MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address), Size$Bool$()) == to_bytes$Bool(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot))) ==> MemoryBlock$bytes(address, Size$Tuple$$I64$Bool$$I64$Bool$$()) == to_bytes$Tuple$$I64$Bool$$I64$Bool$(snapshot))
(declare-const snapshot@607@01 Snap$Tuple$$I64$Bool$$I64$Bool$)
(set-option :timeout 0)
(push) ; 11
; [eval] old(MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address), Size$I64$()) == to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot))) && old(MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address), Size$Bool$()) == to_bytes$Bool(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot))) ==> MemoryBlock$bytes(address, Size$Tuple$$I64$Bool$$I64$Bool$$()) == to_bytes$Tuple$$I64$Bool$$I64$Bool$(snapshot)
; [eval] old(MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address), Size$I64$()) == to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot))) && old(MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address), Size$Bool$()) == to_bytes$Bool(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot)))
; [eval] old(MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address), Size$I64$()) == to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot)))
; [eval] MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address), Size$I64$()) == to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot))
; [eval] MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address), Size$I64$())
; [eval] field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address)
; [eval] Size$I64$()
(push) ; 12
(declare-const $k@608@01 $Perm)
(assert ($Perm.isReadVar $k@608@01))
(push) ; 13
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _37$place<Place>  Place)) _37$address@88@01)
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _37$address@88@01))
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _45$place<Place>  Place)) _45$address@125@01)
  (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _37$address@88@01))))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _37$place<Place>  Place)) _37$address@88@01)
  (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _37$address@88@01))))
(check-sat)
; unsat
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(assert (< $k@608@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@608@01)))
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (< $Perm.No $k@608@01)))
(check-sat)
; unsat
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@478@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _37$address@88@01) (as Size$I64$<Snap$Usize>  Snap$Usize)))
(pop) ; 12
; Joined path conditions
(assert ($Perm.isReadVar $k@608@01))
(assert (and
  (< $k@608@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@608@01))
  (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@478@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _37$address@88@01) (as Size$I64$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot)
(set-option :timeout 0)
(push) ; 12
; [then-branch: 39 | MemoryBlock$bytes(First:(Second:($t@478@01)), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](_37$address@88@01), Size$I64$[Snap$Usize]) == to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@607@01)) | live]
; [else-branch: 39 | MemoryBlock$bytes(First:(Second:($t@478@01)), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](_37$address@88@01), Size$I64$[Snap$Usize]) != to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@607@01)) | live]
(push) ; 13
; [then-branch: 39 | MemoryBlock$bytes(First:(Second:($t@478@01)), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](_37$address@88@01), Size$I64$[Snap$Usize]) == to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@607@01))]
(assert (=
  (MemoryBlock$bytes ($Snap.first ($Snap.second $t@478@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _37$address@88@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
  (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@607@01))))
; [eval] old(MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address), Size$Bool$()) == to_bytes$Bool(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot)))
; [eval] MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address), Size$Bool$()) == to_bytes$Bool(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot))
; [eval] MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address), Size$Bool$())
; [eval] field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address)
; [eval] Size$Bool$()
(push) ; 14
(declare-const $k@609@01 $Perm)
(assert ($Perm.isReadVar $k@609@01))
(push) ; 15
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _37$place<Place>  Place)) _37$address@88@01)
  (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _37$address@88@01))))
(check-sat)
; unsat
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(assert (< $k@609@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@609@01)))
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (< $Perm.No $k@609@01)))
(check-sat)
; unsat
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition $t@605@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _37$address@88@01) (as Size$Bool$<Snap$Usize>  Snap$Usize)))
(pop) ; 14
; Joined path conditions
(assert ($Perm.isReadVar $k@609@01))
(assert (and
  (< $k@609@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@609@01))
  (MemoryBlock$bytes%precondition $t@605@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _37$address@88@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$Bool(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot)
(pop) ; 13
(set-option :timeout 0)
(push) ; 13
; [else-branch: 39 | MemoryBlock$bytes(First:(Second:($t@478@01)), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](_37$address@88@01), Size$I64$[Snap$Usize]) != to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@607@01))]
(assert (not
  (=
    (MemoryBlock$bytes ($Snap.first ($Snap.second $t@478@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _37$address@88@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
    (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@607@01)))))
(pop) ; 13
(pop) ; 12
; Joined path conditions
(assert ($Perm.isReadVar $k@609@01))
(assert (=>
  (=
    (MemoryBlock$bytes ($Snap.first ($Snap.second $t@478@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _37$address@88@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
    (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@607@01)))
  (and
    (=
      (MemoryBlock$bytes ($Snap.first ($Snap.second $t@478@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _37$address@88@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
      (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@607@01)))
    (< $k@609@01 $Perm.Write)
    (<= $Perm.No (- $Perm.Write $k@609@01))
    (MemoryBlock$bytes%precondition $t@605@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _37$address@88@01) (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
; Joined path conditions
(assert (or
  (not
    (=
      (MemoryBlock$bytes ($Snap.first ($Snap.second $t@478@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _37$address@88@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
      (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@607@01))))
  (=
    (MemoryBlock$bytes ($Snap.first ($Snap.second $t@478@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _37$address@88@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
    (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@607@01)))))
(push) ; 12
; [then-branch: 40 | MemoryBlock$bytes($t@605@01, field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Address](_37$address@88@01), Size$Bool$[Snap$Usize]) == to_bytes$Bool[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](snapshot@607@01)) && MemoryBlock$bytes(First:(Second:($t@478@01)), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](_37$address@88@01), Size$I64$[Snap$Usize]) == to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@607@01)) | live]
; [else-branch: 40 | !(MemoryBlock$bytes($t@605@01, field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Address](_37$address@88@01), Size$Bool$[Snap$Usize]) == to_bytes$Bool[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](snapshot@607@01)) && MemoryBlock$bytes(First:(Second:($t@478@01)), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](_37$address@88@01), Size$I64$[Snap$Usize]) == to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@607@01))) | live]
(push) ; 13
; [then-branch: 40 | MemoryBlock$bytes($t@605@01, field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Address](_37$address@88@01), Size$Bool$[Snap$Usize]) == to_bytes$Bool[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](snapshot@607@01)) && MemoryBlock$bytes(First:(Second:($t@478@01)), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](_37$address@88@01), Size$I64$[Snap$Usize]) == to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@607@01))]
(assert (and
  (=
    (MemoryBlock$bytes $t@605@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _37$address@88@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
    (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@607@01)))
  (=
    (MemoryBlock$bytes ($Snap.first ($Snap.second $t@478@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _37$address@88@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
    (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@607@01)))))
; [eval] MemoryBlock$bytes(address, Size$Tuple$$I64$Bool$$I64$Bool$$()) == to_bytes$Tuple$$I64$Bool$$I64$Bool$(snapshot)
; [eval] MemoryBlock$bytes(address, Size$Tuple$$I64$Bool$$I64$Bool$$())
; [eval] Size$Tuple$$I64$Bool$$I64$Bool$$()
(push) ; 14
(declare-const $k@610@01 $Perm)
(assert ($Perm.isReadVar $k@610@01))
(assert (< $k@610@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@610@01)))
(push) ; 15
(set-option :timeout 10)
(assert (not (< $Perm.No $k@610@01)))
(check-sat)
; unsat
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first $t@606@01) _37$address@88@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))
(pop) ; 14
; Joined path conditions
(assert ($Perm.isReadVar $k@610@01))
(assert (and
  (< $k@610@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@610@01))
  (MemoryBlock$bytes%precondition ($Snap.first $t@606@01) _37$address@88@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$Tuple$$I64$Bool$$I64$Bool$(snapshot)
(pop) ; 13
(set-option :timeout 0)
(push) ; 13
; [else-branch: 40 | !(MemoryBlock$bytes($t@605@01, field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Address](_37$address@88@01), Size$Bool$[Snap$Usize]) == to_bytes$Bool[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](snapshot@607@01)) && MemoryBlock$bytes(First:(Second:($t@478@01)), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](_37$address@88@01), Size$I64$[Snap$Usize]) == to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@607@01)))]
(assert (not
  (and
    (=
      (MemoryBlock$bytes $t@605@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _37$address@88@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
      (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@607@01)))
    (=
      (MemoryBlock$bytes ($Snap.first ($Snap.second $t@478@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _37$address@88@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
      (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@607@01))))))
(pop) ; 13
(pop) ; 12
; Joined path conditions
(assert ($Perm.isReadVar $k@610@01))
(assert (=>
  (and
    (=
      (MemoryBlock$bytes $t@605@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _37$address@88@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
      (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@607@01)))
    (=
      (MemoryBlock$bytes ($Snap.first ($Snap.second $t@478@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _37$address@88@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
      (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@607@01))))
  (and
    (=
      (MemoryBlock$bytes $t@605@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _37$address@88@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
      (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@607@01)))
    (=
      (MemoryBlock$bytes ($Snap.first ($Snap.second $t@478@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _37$address@88@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
      (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@607@01)))
    (< $k@610@01 $Perm.Write)
    (<= $Perm.No (- $Perm.Write $k@610@01))
    (MemoryBlock$bytes%precondition ($Snap.first $t@606@01) _37$address@88@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
; Joined path conditions
(assert (or
  (not
    (and
      (=
        (MemoryBlock$bytes $t@605@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _37$address@88@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
        (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@607@01)))
      (=
        (MemoryBlock$bytes ($Snap.first ($Snap.second $t@478@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _37$address@88@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
        (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@607@01)))))
  (and
    (=
      (MemoryBlock$bytes $t@605@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _37$address@88@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
      (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@607@01)))
    (=
      (MemoryBlock$bytes ($Snap.first ($Snap.second $t@478@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _37$address@88@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
      (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@607@01))))))
(pop) ; 11
; Nested auxiliary terms: globals (aux)
(assert ($Perm.isReadVar $k@608@01))
(assert ($Perm.isReadVar $k@609@01))
(assert ($Perm.isReadVar $k@610@01))
(assert (< $k@608@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@608@01)))
(assert (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@478@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _37$address@88@01) (as Size$I64$<Snap$Usize>  Snap$Usize)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((snapshot@607@01 Snap$Tuple$$I64$Bool$$I64$Bool$)) (!
  (and
    (=>
      (=
        (MemoryBlock$bytes ($Snap.first ($Snap.second $t@478@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _37$address@88@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
        (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@607@01)))
      (and
        (=
          (MemoryBlock$bytes ($Snap.first ($Snap.second $t@478@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _37$address@88@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
          (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@607@01)))
        (< $k@609@01 $Perm.Write)
        (<= $Perm.No (- $Perm.Write $k@609@01))
        (MemoryBlock$bytes%precondition $t@605@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _37$address@88@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))))
    (or
      (not
        (=
          (MemoryBlock$bytes ($Snap.first ($Snap.second $t@478@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _37$address@88@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
          (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@607@01))))
      (=
        (MemoryBlock$bytes ($Snap.first ($Snap.second $t@478@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _37$address@88@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
        (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@607@01))))
    (=>
      (and
        (=
          (MemoryBlock$bytes $t@605@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _37$address@88@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
          (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@607@01)))
        (=
          (MemoryBlock$bytes ($Snap.first ($Snap.second $t@478@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _37$address@88@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
          (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@607@01))))
      (and
        (=
          (MemoryBlock$bytes $t@605@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _37$address@88@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
          (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@607@01)))
        (=
          (MemoryBlock$bytes ($Snap.first ($Snap.second $t@478@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _37$address@88@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
          (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@607@01)))
        (< $k@610@01 $Perm.Write)
        (<= $Perm.No (- $Perm.Write $k@610@01))
        (MemoryBlock$bytes%precondition ($Snap.first $t@606@01) _37$address@88@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize))))
    (or
      (not
        (and
          (=
            (MemoryBlock$bytes $t@605@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _37$address@88@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
            (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@607@01)))
          (=
            (MemoryBlock$bytes ($Snap.first ($Snap.second $t@478@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _37$address@88@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
            (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@607@01)))))
      (and
        (=
          (MemoryBlock$bytes $t@605@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _37$address@88@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
          (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@607@01)))
        (=
          (MemoryBlock$bytes ($Snap.first ($Snap.second $t@478@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _37$address@88@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
          (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@607@01))))))
  :pattern ((to_bytes$Tuple$$I64$Bool$$I64$Bool$<Bytes> snapshot@607@01))
  :qid |prog.l2572-aux|)))
(assert (forall ((snapshot@607@01 Snap$Tuple$$I64$Bool$$I64$Bool$)) (!
  (=>
    (and
      (=
        (MemoryBlock$bytes $t@605@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _37$address@88@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
        (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@607@01)))
      (=
        (MemoryBlock$bytes ($Snap.first ($Snap.second $t@478@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _37$address@88@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
        (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@607@01))))
    (=
      (MemoryBlock$bytes ($Snap.first $t@606@01) _37$address@88@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize))
      (to_bytes$Tuple$$I64$Bool$$I64$Bool$<Bytes> snapshot@607@01)))
  :pattern ((to_bytes$Tuple$$I64$Bool$$I64$Bool$<Bytes> snapshot@607@01))
  :qid |prog.l2572|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; exhale acc(MemoryBlock(_37$address, Size$Tuple$$I64$Bool$$I64$Bool$$()), write)
; [eval] Size$Tuple$$I64$Bool$$I64$Bool$$()
; [eval] loop__label_bb1__label_bb2$marker && (label_2_custom$marker && (label_bb24$marker && (label_bb26$marker && (label_bb27$marker && (label_bb29$marker && label_bb30$marker)))))
(set-option :timeout 0)
(push) ; 11
; [then-branch: 41 | True | live]
; [else-branch: 41 | False | live]
(push) ; 12
; [then-branch: 41 | True]
(push) ; 13
; [then-branch: 42 | True | live]
; [else-branch: 42 | False | live]
(push) ; 14
; [then-branch: 42 | True]
(push) ; 15
; [then-branch: 43 | True | live]
; [else-branch: 43 | False | live]
(push) ; 16
; [then-branch: 43 | True]
(push) ; 17
; [then-branch: 44 | True | live]
; [else-branch: 44 | False | live]
(push) ; 18
; [then-branch: 44 | True]
(push) ; 19
; [then-branch: 45 | True | live]
; [else-branch: 45 | False | live]
(push) ; 20
; [then-branch: 45 | True]
(push) ; 21
; [then-branch: 46 | True | live]
; [else-branch: 46 | False | live]
(push) ; 22
; [then-branch: 46 | True]
(pop) ; 22
(push) ; 22
; [else-branch: 46 | False]
(assert false)
(pop) ; 22
(pop) ; 21
; Joined path conditions
; Joined path conditions
(pop) ; 20
(push) ; 20
; [else-branch: 45 | False]
(assert false)
(pop) ; 20
(pop) ; 19
; Joined path conditions
; Joined path conditions
(pop) ; 18
(push) ; 18
; [else-branch: 44 | False]
(assert false)
(pop) ; 18
(pop) ; 17
; Joined path conditions
; Joined path conditions
(pop) ; 16
(push) ; 16
; [else-branch: 43 | False]
(assert false)
(pop) ; 16
(pop) ; 15
; Joined path conditions
; Joined path conditions
(pop) ; 14
(push) ; 14
; [else-branch: 42 | False]
(assert false)
(pop) ; 14
(pop) ; 13
; Joined path conditions
; Joined path conditions
(pop) ; 12
(push) ; 12
; [else-branch: 41 | False]
(assert false)
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(push) ; 11
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [then-branch: 47 | True | live]
; [else-branch: 47 | False | dead]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 47 | True]
; [exec]
; into_memory_block$Bool(field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(_45$place()),
;   _45$address, destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(_45$snapshot$3))
; [eval] field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(_45$place())
; [eval] _45$place()
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(_45$snapshot$3)
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> result_value@508@01)
  (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> _45$snapshot$3@129@01))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [eval] compute_address(place, root_address)
; [eval] Size$Bool$()
(declare-const $t@611@01 $Snap)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _45$place<Place>  Place)) _45$address@125@01)
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _45$place<Place>  Place)) _45$address@125@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _45$place<Place>  Place) _45$address@125@01)
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _45$place<Place>  Place)) _45$address@125@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] loop__label_bb1__label_bb2$marker && (label_2_custom$marker && (label_bb24$marker && (label_bb26$marker && (label_bb27$marker && (label_bb29$marker && label_bb30$marker)))))
(set-option :timeout 0)
(push) ; 12
; [then-branch: 48 | True | live]
; [else-branch: 48 | False | live]
(push) ; 13
; [then-branch: 48 | True]
(push) ; 14
; [then-branch: 49 | True | live]
; [else-branch: 49 | False | live]
(push) ; 15
; [then-branch: 49 | True]
(push) ; 16
; [then-branch: 50 | True | live]
; [else-branch: 50 | False | live]
(push) ; 17
; [then-branch: 50 | True]
(push) ; 18
; [then-branch: 51 | True | live]
; [else-branch: 51 | False | live]
(push) ; 19
; [then-branch: 51 | True]
(push) ; 20
; [then-branch: 52 | True | live]
; [else-branch: 52 | False | live]
(push) ; 21
; [then-branch: 52 | True]
(push) ; 22
; [then-branch: 53 | True | live]
; [else-branch: 53 | False | live]
(push) ; 23
; [then-branch: 53 | True]
(pop) ; 23
(push) ; 23
; [else-branch: 53 | False]
(assert false)
(pop) ; 23
(pop) ; 22
; Joined path conditions
; Joined path conditions
(pop) ; 21
(push) ; 21
; [else-branch: 52 | False]
(assert false)
(pop) ; 21
(pop) ; 20
; Joined path conditions
; Joined path conditions
(pop) ; 19
(push) ; 19
; [else-branch: 51 | False]
(assert false)
(pop) ; 19
(pop) ; 18
; Joined path conditions
; Joined path conditions
(pop) ; 17
(push) ; 17
; [else-branch: 50 | False]
(assert false)
(pop) ; 17
(pop) ; 16
; Joined path conditions
; Joined path conditions
(pop) ; 15
(push) ; 15
; [else-branch: 49 | False]
(assert false)
(pop) ; 15
(pop) ; 14
; Joined path conditions
; Joined path conditions
(pop) ; 13
(push) ; 13
; [else-branch: 48 | False]
(assert false)
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(push) ; 12
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [then-branch: 54 | True | live]
; [else-branch: 54 | False | dead]
(set-option :timeout 0)
(push) ; 12
; [then-branch: 54 | True]
; [exec]
; memory_block_join$Tuple$$I64$Bool$$I64$Bool$(_45$address, write)
; [eval] none < permission_amount
; [eval] PaddingSize$Tuple$$I64$Bool$$I64$Bool$$()
(push) ; 13
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _45$place<Place>  Place)) _45$address@125@01)
    _45$address@125@01)
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _45$place<Place>  Place)) _45$address@125@01)
    _45$address@125@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _45$place<Place>  Place) _45$address@125@01)
  _45$address@125@01)))
(check-sat)
; unsat
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
; [eval] field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _45$place<Place>  Place)) _45$address@125@01)
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _45$address@125@01))
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _45$place<Place>  Place)) _45$address@125@01)
  (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _45$address@125@01))))
(check-sat)
; unsat
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
; [eval] field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address)
; [eval] Size$Bool$()
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _45$place<Place>  Place)) _45$address@125@01)
  (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _45$address@125@01))))
(check-sat)
; unsat
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(declare-const $t@612@01 $Snap)
(assert (= $t@612@01 ($Snap.combine ($Snap.first $t@612@01) ($Snap.second $t@612@01))))
; [eval] Size$Tuple$$I64$Bool$$I64$Bool$$()
(assert (= ($Snap.second $t@612@01) $Snap.unit))
; [eval] (forall snapshot: Snap$Tuple$$I64$Bool$$I64$Bool$ :: { to_bytes$Tuple$$I64$Bool$$I64$Bool$(snapshot) } old(MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address), Size$I64$()) == to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot))) && old(MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address), Size$Bool$()) == to_bytes$Bool(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot))) ==> MemoryBlock$bytes(address, Size$Tuple$$I64$Bool$$I64$Bool$$()) == to_bytes$Tuple$$I64$Bool$$I64$Bool$(snapshot))
(declare-const snapshot@613@01 Snap$Tuple$$I64$Bool$$I64$Bool$)
(set-option :timeout 0)
(push) ; 13
; [eval] old(MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address), Size$I64$()) == to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot))) && old(MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address), Size$Bool$()) == to_bytes$Bool(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot))) ==> MemoryBlock$bytes(address, Size$Tuple$$I64$Bool$$I64$Bool$$()) == to_bytes$Tuple$$I64$Bool$$I64$Bool$(snapshot)
; [eval] old(MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address), Size$I64$()) == to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot))) && old(MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address), Size$Bool$()) == to_bytes$Bool(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot)))
; [eval] old(MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address), Size$I64$()) == to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot)))
; [eval] MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address), Size$I64$()) == to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot))
; [eval] MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address), Size$I64$())
; [eval] field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address)
; [eval] Size$I64$()
(push) ; 14
(declare-const $k@614@01 $Perm)
(assert ($Perm.isReadVar $k@614@01))
(push) ; 15
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _45$place<Place>  Place)) _45$address@125@01)
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _45$address@125@01))
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _45$place<Place>  Place)) _45$address@125@01)
  (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _45$address@125@01))))
(check-sat)
; unsat
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(assert (< $k@614@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@614@01)))
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (< $Perm.No $k@614@01)))
(check-sat)
; unsat
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@515@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _45$address@125@01) (as Size$I64$<Snap$Usize>  Snap$Usize)))
(pop) ; 14
; Joined path conditions
(assert ($Perm.isReadVar $k@614@01))
(assert (and
  (< $k@614@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@614@01))
  (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@515@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _45$address@125@01) (as Size$I64$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot)
(set-option :timeout 0)
(push) ; 14
; [then-branch: 55 | MemoryBlock$bytes(First:(Second:($t@515@01)), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](_45$address@125@01), Size$I64$[Snap$Usize]) == to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@613@01)) | live]
; [else-branch: 55 | MemoryBlock$bytes(First:(Second:($t@515@01)), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](_45$address@125@01), Size$I64$[Snap$Usize]) != to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@613@01)) | live]
(push) ; 15
; [then-branch: 55 | MemoryBlock$bytes(First:(Second:($t@515@01)), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](_45$address@125@01), Size$I64$[Snap$Usize]) == to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@613@01))]
(assert (=
  (MemoryBlock$bytes ($Snap.first ($Snap.second $t@515@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _45$address@125@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
  (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@613@01))))
; [eval] old(MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address), Size$Bool$()) == to_bytes$Bool(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot)))
; [eval] MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address), Size$Bool$()) == to_bytes$Bool(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot))
; [eval] MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address), Size$Bool$())
; [eval] field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address)
; [eval] Size$Bool$()
(push) ; 16
(declare-const $k@615@01 $Perm)
(assert ($Perm.isReadVar $k@615@01))
(push) ; 17
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _45$place<Place>  Place)) _45$address@125@01)
  (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _45$address@125@01))))
(check-sat)
; unsat
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(assert (< $k@615@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@615@01)))
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (< $Perm.No $k@615@01)))
(check-sat)
; unsat
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition $t@611@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _45$address@125@01) (as Size$Bool$<Snap$Usize>  Snap$Usize)))
(pop) ; 16
; Joined path conditions
(assert ($Perm.isReadVar $k@615@01))
(assert (and
  (< $k@615@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@615@01))
  (MemoryBlock$bytes%precondition $t@611@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _45$address@125@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$Bool(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot)
(pop) ; 15
(set-option :timeout 0)
(push) ; 15
; [else-branch: 55 | MemoryBlock$bytes(First:(Second:($t@515@01)), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](_45$address@125@01), Size$I64$[Snap$Usize]) != to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@613@01))]
(assert (not
  (=
    (MemoryBlock$bytes ($Snap.first ($Snap.second $t@515@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _45$address@125@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
    (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@613@01)))))
(pop) ; 15
(pop) ; 14
; Joined path conditions
(assert ($Perm.isReadVar $k@615@01))
(assert (=>
  (=
    (MemoryBlock$bytes ($Snap.first ($Snap.second $t@515@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _45$address@125@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
    (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@613@01)))
  (and
    (=
      (MemoryBlock$bytes ($Snap.first ($Snap.second $t@515@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _45$address@125@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
      (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@613@01)))
    (< $k@615@01 $Perm.Write)
    (<= $Perm.No (- $Perm.Write $k@615@01))
    (MemoryBlock$bytes%precondition $t@611@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _45$address@125@01) (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
; Joined path conditions
(assert (or
  (not
    (=
      (MemoryBlock$bytes ($Snap.first ($Snap.second $t@515@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _45$address@125@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
      (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@613@01))))
  (=
    (MemoryBlock$bytes ($Snap.first ($Snap.second $t@515@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _45$address@125@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
    (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@613@01)))))
(push) ; 14
; [then-branch: 56 | MemoryBlock$bytes($t@611@01, field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Address](_45$address@125@01), Size$Bool$[Snap$Usize]) == to_bytes$Bool[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](snapshot@613@01)) && MemoryBlock$bytes(First:(Second:($t@515@01)), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](_45$address@125@01), Size$I64$[Snap$Usize]) == to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@613@01)) | live]
; [else-branch: 56 | !(MemoryBlock$bytes($t@611@01, field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Address](_45$address@125@01), Size$Bool$[Snap$Usize]) == to_bytes$Bool[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](snapshot@613@01)) && MemoryBlock$bytes(First:(Second:($t@515@01)), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](_45$address@125@01), Size$I64$[Snap$Usize]) == to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@613@01))) | live]
(push) ; 15
; [then-branch: 56 | MemoryBlock$bytes($t@611@01, field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Address](_45$address@125@01), Size$Bool$[Snap$Usize]) == to_bytes$Bool[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](snapshot@613@01)) && MemoryBlock$bytes(First:(Second:($t@515@01)), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](_45$address@125@01), Size$I64$[Snap$Usize]) == to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@613@01))]
(assert (and
  (=
    (MemoryBlock$bytes $t@611@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _45$address@125@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
    (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@613@01)))
  (=
    (MemoryBlock$bytes ($Snap.first ($Snap.second $t@515@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _45$address@125@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
    (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@613@01)))))
; [eval] MemoryBlock$bytes(address, Size$Tuple$$I64$Bool$$I64$Bool$$()) == to_bytes$Tuple$$I64$Bool$$I64$Bool$(snapshot)
; [eval] MemoryBlock$bytes(address, Size$Tuple$$I64$Bool$$I64$Bool$$())
; [eval] Size$Tuple$$I64$Bool$$I64$Bool$$()
(push) ; 16
(declare-const $k@616@01 $Perm)
(assert ($Perm.isReadVar $k@616@01))
(assert (< $k@616@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@616@01)))
(push) ; 17
(set-option :timeout 10)
(assert (not (< $Perm.No $k@616@01)))
(check-sat)
; unsat
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first $t@612@01) _45$address@125@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))
(pop) ; 16
; Joined path conditions
(assert ($Perm.isReadVar $k@616@01))
(assert (and
  (< $k@616@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@616@01))
  (MemoryBlock$bytes%precondition ($Snap.first $t@612@01) _45$address@125@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$Tuple$$I64$Bool$$I64$Bool$(snapshot)
(pop) ; 15
(set-option :timeout 0)
(push) ; 15
; [else-branch: 56 | !(MemoryBlock$bytes($t@611@01, field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Address](_45$address@125@01), Size$Bool$[Snap$Usize]) == to_bytes$Bool[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](snapshot@613@01)) && MemoryBlock$bytes(First:(Second:($t@515@01)), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](_45$address@125@01), Size$I64$[Snap$Usize]) == to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@613@01)))]
(assert (not
  (and
    (=
      (MemoryBlock$bytes $t@611@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _45$address@125@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
      (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@613@01)))
    (=
      (MemoryBlock$bytes ($Snap.first ($Snap.second $t@515@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _45$address@125@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
      (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@613@01))))))
(pop) ; 15
(pop) ; 14
; Joined path conditions
(assert ($Perm.isReadVar $k@616@01))
(assert (=>
  (and
    (=
      (MemoryBlock$bytes $t@611@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _45$address@125@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
      (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@613@01)))
    (=
      (MemoryBlock$bytes ($Snap.first ($Snap.second $t@515@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _45$address@125@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
      (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@613@01))))
  (and
    (=
      (MemoryBlock$bytes $t@611@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _45$address@125@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
      (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@613@01)))
    (=
      (MemoryBlock$bytes ($Snap.first ($Snap.second $t@515@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _45$address@125@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
      (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@613@01)))
    (< $k@616@01 $Perm.Write)
    (<= $Perm.No (- $Perm.Write $k@616@01))
    (MemoryBlock$bytes%precondition ($Snap.first $t@612@01) _45$address@125@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
; Joined path conditions
(assert (or
  (not
    (and
      (=
        (MemoryBlock$bytes $t@611@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _45$address@125@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
        (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@613@01)))
      (=
        (MemoryBlock$bytes ($Snap.first ($Snap.second $t@515@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _45$address@125@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
        (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@613@01)))))
  (and
    (=
      (MemoryBlock$bytes $t@611@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _45$address@125@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
      (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@613@01)))
    (=
      (MemoryBlock$bytes ($Snap.first ($Snap.second $t@515@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _45$address@125@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
      (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@613@01))))))
(pop) ; 13
; Nested auxiliary terms: globals (aux)
(assert ($Perm.isReadVar $k@614@01))
(assert ($Perm.isReadVar $k@615@01))
(assert ($Perm.isReadVar $k@616@01))
(assert (< $k@614@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@614@01)))
(assert (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@515@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _45$address@125@01) (as Size$I64$<Snap$Usize>  Snap$Usize)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((snapshot@613@01 Snap$Tuple$$I64$Bool$$I64$Bool$)) (!
  (and
    (=>
      (=
        (MemoryBlock$bytes ($Snap.first ($Snap.second $t@515@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _45$address@125@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
        (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@613@01)))
      (and
        (=
          (MemoryBlock$bytes ($Snap.first ($Snap.second $t@515@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _45$address@125@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
          (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@613@01)))
        (< $k@615@01 $Perm.Write)
        (<= $Perm.No (- $Perm.Write $k@615@01))
        (MemoryBlock$bytes%precondition $t@611@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _45$address@125@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))))
    (or
      (not
        (=
          (MemoryBlock$bytes ($Snap.first ($Snap.second $t@515@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _45$address@125@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
          (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@613@01))))
      (=
        (MemoryBlock$bytes ($Snap.first ($Snap.second $t@515@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _45$address@125@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
        (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@613@01))))
    (=>
      (and
        (=
          (MemoryBlock$bytes $t@611@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _45$address@125@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
          (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@613@01)))
        (=
          (MemoryBlock$bytes ($Snap.first ($Snap.second $t@515@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _45$address@125@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
          (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@613@01))))
      (and
        (=
          (MemoryBlock$bytes $t@611@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _45$address@125@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
          (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@613@01)))
        (=
          (MemoryBlock$bytes ($Snap.first ($Snap.second $t@515@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _45$address@125@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
          (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@613@01)))
        (< $k@616@01 $Perm.Write)
        (<= $Perm.No (- $Perm.Write $k@616@01))
        (MemoryBlock$bytes%precondition ($Snap.first $t@612@01) _45$address@125@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize))))
    (or
      (not
        (and
          (=
            (MemoryBlock$bytes $t@611@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _45$address@125@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
            (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@613@01)))
          (=
            (MemoryBlock$bytes ($Snap.first ($Snap.second $t@515@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _45$address@125@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
            (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@613@01)))))
      (and
        (=
          (MemoryBlock$bytes $t@611@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _45$address@125@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
          (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@613@01)))
        (=
          (MemoryBlock$bytes ($Snap.first ($Snap.second $t@515@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _45$address@125@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
          (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@613@01))))))
  :pattern ((to_bytes$Tuple$$I64$Bool$$I64$Bool$<Bytes> snapshot@613@01))
  :qid |prog.l2572-aux|)))
(assert (forall ((snapshot@613@01 Snap$Tuple$$I64$Bool$$I64$Bool$)) (!
  (=>
    (and
      (=
        (MemoryBlock$bytes $t@611@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _45$address@125@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
        (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@613@01)))
      (=
        (MemoryBlock$bytes ($Snap.first ($Snap.second $t@515@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _45$address@125@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
        (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@613@01))))
    (=
      (MemoryBlock$bytes ($Snap.first $t@612@01) _45$address@125@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize))
      (to_bytes$Tuple$$I64$Bool$$I64$Bool$<Bytes> snapshot@613@01)))
  :pattern ((to_bytes$Tuple$$I64$Bool$$I64$Bool$<Bytes> snapshot@613@01))
  :qid |prog.l2572|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; exhale acc(MemoryBlock(_45$address, Size$Tuple$$I64$Bool$$I64$Bool$$()), write)
; [eval] Size$Tuple$$I64$Bool$$I64$Bool$$()
; [exec]
; label label__from__return_label__to__end_label
; [exec]
; inhale _0$snapshot$2 == _0$snapshot$1
(declare-const $t@617@01 $Snap)
(assert (= $t@617@01 $Snap.unit))
; [eval] _0$snapshot$2 == _0$snapshot$1
(assert (= _0$snapshot$2@3@01 _0$snapshot$1@2@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale _10$snapshot$3 == _10$snapshot$2
(declare-const $t@618@01 $Snap)
(assert (= $t@618@01 $Snap.unit))
; [eval] _10$snapshot$3 == _10$snapshot$2
(assert (= _10$snapshot$3@10@01 _10$snapshot$2@9@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _11$snapshot$4 == _11$snapshot$3
(declare-const $t@619@01 $Snap)
(assert (= $t@619@01 $Snap.unit))
; [eval] _11$snapshot$4 == _11$snapshot$3
(assert (= _11$snapshot$4@16@01 _11$snapshot$3@15@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _15$snapshot$3 == _15$snapshot$2
(declare-const $t@620@01 $Snap)
(assert (= $t@620@01 $Snap.unit))
; [eval] _15$snapshot$3 == _15$snapshot$2
(assert (= _15$snapshot$3@21@01 _15$snapshot$2@20@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _16$snapshot$3 == _16$snapshot$2
(declare-const $t@621@01 $Snap)
(assert (= $t@621@01 $Snap.unit))
; [eval] _16$snapshot$3 == _16$snapshot$2
(assert (= _16$snapshot$3@26@01 _16$snapshot$2@25@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _2$snapshot$5 == _2$snapshot$4
(declare-const $t@622@01 $Snap)
(assert (= $t@622@01 $Snap.unit))
; [eval] _2$snapshot$5 == _2$snapshot$4
(assert (= _2$snapshot$5@33@01 _2$snapshot$4@32@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _20$snapshot$3 == _20$snapshot$2
(declare-const $t@623@01 $Snap)
(assert (= $t@623@01 $Snap.unit))
; [eval] _20$snapshot$3 == _20$snapshot$2
(assert (= _20$snapshot$3@38@01 _20$snapshot$2@37@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _21$snapshot$3 == _21$snapshot$2
(declare-const $t@624@01 $Snap)
(assert (= $t@624@01 $Snap.unit))
; [eval] _21$snapshot$3 == _21$snapshot$2
(assert (= _21$snapshot$3@43@01 _21$snapshot$2@42@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _24$snapshot$3 == _24$snapshot$2
(declare-const $t@625@01 $Snap)
(assert (= $t@625@01 $Snap.unit))
; [eval] _24$snapshot$3 == _24$snapshot$2
(assert (= _24$snapshot$3@48@01 _24$snapshot$2@47@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _25$snapshot$3 == _25$snapshot$2
(declare-const $t@626@01 $Snap)
(assert (= $t@626@01 $Snap.unit))
; [eval] _25$snapshot$3 == _25$snapshot$2
(assert (= _25$snapshot$3@53@01 _25$snapshot$2@52@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _29$snapshot$3 == _29$snapshot$2
(declare-const $t@627@01 $Snap)
(assert (= $t@627@01 $Snap.unit))
; [eval] _29$snapshot$3 == _29$snapshot$2
(assert (= _29$snapshot$3@58@01 _29$snapshot$2@57@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _3$snapshot$6 == _3$snapshot$5
(declare-const $t@628@01 $Snap)
(assert (= $t@628@01 $Snap.unit))
; [eval] _3$snapshot$6 == _3$snapshot$5
(assert (= _3$snapshot$6@66@01 _3$snapshot$5@65@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _30$snapshot$3 == _30$snapshot$2
(declare-const $t@629@01 $Snap)
(assert (= $t@629@01 $Snap.unit))
; [eval] _30$snapshot$3 == _30$snapshot$2
(assert (= _30$snapshot$3@71@01 _30$snapshot$2@70@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _34$snapshot$4 == _34$snapshot$3
(declare-const $t@630@01 $Snap)
(assert (= $t@630@01 $Snap.unit))
; [eval] _34$snapshot$4 == _34$snapshot$3
(assert (= _34$snapshot$4@77@01 _34$snapshot$3@76@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _35$snapshot$3 == _35$snapshot$2
(declare-const $t@631@01 $Snap)
(assert (= $t@631@01 $Snap.unit))
; [eval] _35$snapshot$3 == _35$snapshot$2
(assert (= _35$snapshot$3@82@01 _35$snapshot$2@81@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _36$snapshot$3 == _36$snapshot$2
(declare-const $t@632@01 $Snap)
(assert (= $t@632@01 $Snap.unit))
; [eval] _36$snapshot$3 == _36$snapshot$2
(assert (= _36$snapshot$3@87@01 _36$snapshot$2@86@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _37$snapshot$3 == _37$snapshot$2
(declare-const $t@633@01 $Snap)
(assert (= $t@633@01 $Snap.unit))
; [eval] _37$snapshot$3 == _37$snapshot$2
(assert (= _37$snapshot$3@92@01 _37$snapshot$2@91@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _38$snapshot$4 == _38$snapshot$3
(declare-const $t@634@01 $Snap)
(assert (= $t@634@01 $Snap.unit))
; [eval] _38$snapshot$4 == _38$snapshot$3
(assert (= _38$snapshot$4@98@01 _38$snapshot$3@97@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _39$snapshot$4 == _39$snapshot$3
(declare-const $t@635@01 $Snap)
(assert (= $t@635@01 $Snap.unit))
; [eval] _39$snapshot$4 == _39$snapshot$3
(assert (= _39$snapshot$4@104@01 _39$snapshot$3@103@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _4$snapshot$6 == _4$snapshot$5
(declare-const $t@636@01 $Snap)
(assert (= $t@636@01 $Snap.unit))
; [eval] _4$snapshot$6 == _4$snapshot$5
(assert (= _4$snapshot$6@112@01 _4$snapshot$5@111@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _43$snapshot$4 == _43$snapshot$3
(declare-const $t@637@01 $Snap)
(assert (= $t@637@01 $Snap.unit))
; [eval] _43$snapshot$4 == _43$snapshot$3
(assert (= _43$snapshot$4@118@01 _43$snapshot$3@117@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _44$snapshot$4 == _44$snapshot$3
(declare-const $t@638@01 $Snap)
(assert (= $t@638@01 $Snap.unit))
; [eval] _44$snapshot$4 == _44$snapshot$3
(assert (= _44$snapshot$4@124@01 _44$snapshot$3@123@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _45$snapshot$4 == _45$snapshot$3
(declare-const $t@639@01 $Snap)
(assert (= $t@639@01 $Snap.unit))
; [eval] _45$snapshot$4 == _45$snapshot$3
(assert (= _45$snapshot$4@130@01 _45$snapshot$3@129@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _49$snapshot$2 == _49$snapshot$1
(declare-const $t@640@01 $Snap)
(assert (= $t@640@01 $Snap.unit))
; [eval] _49$snapshot$2 == _49$snapshot$1
(assert (= _49$snapshot$2@135@01 _49$snapshot$1@134@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _5$snapshot$2 == _5$snapshot$1
(declare-const $t@641@01 $Snap)
(assert (= $t@641@01 $Snap.unit))
; [eval] _5$snapshot$2 == _5$snapshot$1
(assert (= _5$snapshot$2@139@01 _5$snapshot$1@138@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _50$snapshot$2 == _50$snapshot$1
(declare-const $t@642@01 $Snap)
(assert (= $t@642@01 $Snap.unit))
; [eval] _50$snapshot$2 == _50$snapshot$1
(assert (= _50$snapshot$2@143@01 _50$snapshot$1@142@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _54$snapshot$2 == _54$snapshot$1
(declare-const $t@643@01 $Snap)
(assert (= $t@643@01 $Snap.unit))
; [eval] _54$snapshot$2 == _54$snapshot$1
(assert (= _54$snapshot$2@147@01 _54$snapshot$1@146@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _55$snapshot$2 == _55$snapshot$1
(declare-const $t@644@01 $Snap)
(assert (= $t@644@01 $Snap.unit))
; [eval] _55$snapshot$2 == _55$snapshot$1
(assert (= _55$snapshot$2@151@01 _55$snapshot$1@150@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _6$snapshot$3 == _6$snapshot$2
(declare-const $t@645@01 $Snap)
(assert (= $t@645@01 $Snap.unit))
; [eval] _6$snapshot$3 == _6$snapshot$2
(assert (= _6$snapshot$3@156@01 _6$snapshot$2@155@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _7$snapshot$4 == _7$snapshot$3
(declare-const $t@646@01 $Snap)
(assert (= $t@646@01 $Snap.unit))
; [eval] _7$snapshot$4 == _7$snapshot$3
(assert (= _7$snapshot$4@162@01 _7$snapshot$3@161@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _8$snapshot$4 == _8$snapshot$3
(declare-const $t@647@01 $Snap)
(assert (= $t@647@01 $Snap.unit))
; [eval] _8$snapshot$4 == _8$snapshot$3
(assert (= _8$snapshot$4@168@01 _8$snapshot$3@167@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _9$snapshot$4 == _9$snapshot$3
(declare-const $t@648@01 $Snap)
(assert (= $t@648@01 $Snap.unit))
; [eval] _9$snapshot$4 == _9$snapshot$3
(assert (= _9$snapshot$4@174@01 _9$snapshot$3@173@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale loop_variant$1$snapshot$4 == loop_variant$1$snapshot$3
(declare-const $t@649@01 $Snap)
(assert (= $t@649@01 $Snap.unit))
; [eval] loop_variant$1$snapshot$4 == loop_variant$1$snapshot$3
(assert (= loop_variant$1$snapshot$4@216@01 loop_variant$1$snapshot$3@215@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; label end_label
; [exec]
; end_label$marker := true
; [exec]
; inhale basic_block_marker$end_label$marker()
(declare-const $t@650@01 $Snap)
(assert (= $t@650@01 $Snap.unit))
; [eval] basic_block_marker$end_label$marker()
(assert (as basic_block_marker$end_label$marker<Bool>  Bool))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; label end_of_method
(pop) ; 12
; [eval] !(loop__label_bb1__label_bb2$marker && (label_2_custom$marker && (label_bb24$marker && (label_bb26$marker && (label_bb27$marker && (label_bb29$marker && label_bb30$marker))))))
; [eval] loop__label_bb1__label_bb2$marker && (label_2_custom$marker && (label_bb24$marker && (label_bb26$marker && (label_bb27$marker && (label_bb29$marker && label_bb30$marker)))))
(set-option :timeout 0)
(push) ; 12
; [then-branch: 57 | True | live]
; [else-branch: 57 | False | live]
(push) ; 13
; [then-branch: 57 | True]
(push) ; 14
; [then-branch: 58 | True | live]
; [else-branch: 58 | False | live]
(push) ; 15
; [then-branch: 58 | True]
(push) ; 16
; [then-branch: 59 | True | live]
; [else-branch: 59 | False | live]
(push) ; 17
; [then-branch: 59 | True]
(push) ; 18
; [then-branch: 60 | True | live]
; [else-branch: 60 | False | live]
(push) ; 19
; [then-branch: 60 | True]
(push) ; 20
; [then-branch: 61 | True | live]
; [else-branch: 61 | False | live]
(push) ; 21
; [then-branch: 61 | True]
(push) ; 22
; [then-branch: 62 | True | live]
; [else-branch: 62 | False | live]
(push) ; 23
; [then-branch: 62 | True]
(pop) ; 23
(push) ; 23
; [else-branch: 62 | False]
(assert false)
(pop) ; 23
(pop) ; 22
; Joined path conditions
; Joined path conditions
(pop) ; 21
(push) ; 21
; [else-branch: 61 | False]
(assert false)
(pop) ; 21
(pop) ; 20
; Joined path conditions
; Joined path conditions
(pop) ; 19
(push) ; 19
; [else-branch: 60 | False]
(assert false)
(pop) ; 19
(pop) ; 18
; Joined path conditions
; Joined path conditions
(pop) ; 17
(push) ; 17
; [else-branch: 59 | False]
(assert false)
(pop) ; 17
(pop) ; 16
; Joined path conditions
; Joined path conditions
(pop) ; 15
(push) ; 15
; [else-branch: 58 | False]
(assert false)
(pop) ; 15
(pop) ; 14
; Joined path conditions
; Joined path conditions
(pop) ; 13
(push) ; 13
; [else-branch: 57 | False]
(assert false)
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
; [then-branch: 63 | False | dead]
; [else-branch: 63 | True | live]
(push) ; 12
; [else-branch: 63 | True]
(pop) ; 12
(pop) ; 11
; [eval] !(loop__label_bb1__label_bb2$marker && (label_2_custom$marker && (label_bb24$marker && (label_bb26$marker && (label_bb27$marker && (label_bb29$marker && label_bb30$marker))))))
; [eval] loop__label_bb1__label_bb2$marker && (label_2_custom$marker && (label_bb24$marker && (label_bb26$marker && (label_bb27$marker && (label_bb29$marker && label_bb30$marker)))))
(push) ; 11
; [then-branch: 64 | True | live]
; [else-branch: 64 | False | live]
(push) ; 12
; [then-branch: 64 | True]
(push) ; 13
; [then-branch: 65 | True | live]
; [else-branch: 65 | False | live]
(push) ; 14
; [then-branch: 65 | True]
(push) ; 15
; [then-branch: 66 | True | live]
; [else-branch: 66 | False | live]
(push) ; 16
; [then-branch: 66 | True]
(push) ; 17
; [then-branch: 67 | True | live]
; [else-branch: 67 | False | live]
(push) ; 18
; [then-branch: 67 | True]
(push) ; 19
; [then-branch: 68 | True | live]
; [else-branch: 68 | False | live]
(push) ; 20
; [then-branch: 68 | True]
(push) ; 21
; [then-branch: 69 | True | live]
; [else-branch: 69 | False | live]
(push) ; 22
; [then-branch: 69 | True]
(pop) ; 22
(push) ; 22
; [else-branch: 69 | False]
(assert false)
(pop) ; 22
(pop) ; 21
; Joined path conditions
; Joined path conditions
(pop) ; 20
(push) ; 20
; [else-branch: 68 | False]
(assert false)
(pop) ; 20
(pop) ; 19
; Joined path conditions
; Joined path conditions
(pop) ; 18
(push) ; 18
; [else-branch: 67 | False]
(assert false)
(pop) ; 18
(pop) ; 17
; Joined path conditions
; Joined path conditions
(pop) ; 16
(push) ; 16
; [else-branch: 66 | False]
(assert false)
(pop) ; 16
(pop) ; 15
; Joined path conditions
; Joined path conditions
(pop) ; 14
(push) ; 14
; [else-branch: 65 | False]
(assert false)
(pop) ; 14
(pop) ; 13
; Joined path conditions
; Joined path conditions
(pop) ; 12
(push) ; 12
; [else-branch: 64 | False]
(assert false)
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
; [then-branch: 70 | False | dead]
; [else-branch: 70 | True | live]
(push) ; 11
; [else-branch: 70 | True]
(pop) ; 11
(pop) ; 10
; [eval] !(loop__label_bb1__label_bb2$marker && (label_2_custom$marker && (label_bb24$marker && (label_bb26$marker && (label_bb27$marker && (label_bb29$marker && label_bb30$marker))))))
; [eval] loop__label_bb1__label_bb2$marker && (label_2_custom$marker && (label_bb24$marker && (label_bb26$marker && (label_bb27$marker && (label_bb29$marker && label_bb30$marker)))))
(push) ; 10
; [then-branch: 71 | True | live]
; [else-branch: 71 | False | live]
(push) ; 11
; [then-branch: 71 | True]
(push) ; 12
; [then-branch: 72 | True | live]
; [else-branch: 72 | False | live]
(push) ; 13
; [then-branch: 72 | True]
(push) ; 14
; [then-branch: 73 | True | live]
; [else-branch: 73 | False | live]
(push) ; 15
; [then-branch: 73 | True]
(push) ; 16
; [then-branch: 74 | True | live]
; [else-branch: 74 | False | live]
(push) ; 17
; [then-branch: 74 | True]
(push) ; 18
; [then-branch: 75 | True | live]
; [else-branch: 75 | False | live]
(push) ; 19
; [then-branch: 75 | True]
(push) ; 20
; [then-branch: 76 | True | live]
; [else-branch: 76 | False | live]
(push) ; 21
; [then-branch: 76 | True]
(pop) ; 21
(push) ; 21
; [else-branch: 76 | False]
(assert false)
(pop) ; 21
(pop) ; 20
; Joined path conditions
; Joined path conditions
(pop) ; 19
(push) ; 19
; [else-branch: 75 | False]
(assert false)
(pop) ; 19
(pop) ; 18
; Joined path conditions
; Joined path conditions
(pop) ; 17
(push) ; 17
; [else-branch: 74 | False]
(assert false)
(pop) ; 17
(pop) ; 16
; Joined path conditions
; Joined path conditions
(pop) ; 15
(push) ; 15
; [else-branch: 73 | False]
(assert false)
(pop) ; 15
(pop) ; 14
; Joined path conditions
; Joined path conditions
(pop) ; 13
(push) ; 13
; [else-branch: 72 | False]
(assert false)
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(pop) ; 11
(push) ; 11
; [else-branch: 71 | False]
(assert false)
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
; [then-branch: 77 | False | dead]
; [else-branch: 77 | True | live]
(push) ; 10
; [else-branch: 77 | True]
(pop) ; 10
(pop) ; 9
; [eval] !(loop__label_bb1__label_bb2$marker && (label_2_custom$marker && (label_bb24$marker && (label_bb26$marker && (label_bb27$marker && (label_bb29$marker && label_bb30$marker))))))
; [eval] loop__label_bb1__label_bb2$marker && (label_2_custom$marker && (label_bb24$marker && (label_bb26$marker && (label_bb27$marker && (label_bb29$marker && label_bb30$marker)))))
(push) ; 9
; [then-branch: 78 | True | live]
; [else-branch: 78 | False | live]
(push) ; 10
; [then-branch: 78 | True]
(push) ; 11
; [then-branch: 79 | True | live]
; [else-branch: 79 | False | live]
(push) ; 12
; [then-branch: 79 | True]
(push) ; 13
; [then-branch: 80 | True | live]
; [else-branch: 80 | False | live]
(push) ; 14
; [then-branch: 80 | True]
(push) ; 15
; [then-branch: 81 | True | live]
; [else-branch: 81 | False | live]
(push) ; 16
; [then-branch: 81 | True]
(push) ; 17
; [then-branch: 82 | True | live]
; [else-branch: 82 | False | live]
(push) ; 18
; [then-branch: 82 | True]
(push) ; 19
; [then-branch: 83 | True | live]
; [else-branch: 83 | False | live]
(push) ; 20
; [then-branch: 83 | True]
(pop) ; 20
(push) ; 20
; [else-branch: 83 | False]
(assert false)
(pop) ; 20
(pop) ; 19
; Joined path conditions
; Joined path conditions
(pop) ; 18
(push) ; 18
; [else-branch: 82 | False]
(assert false)
(pop) ; 18
(pop) ; 17
; Joined path conditions
; Joined path conditions
(pop) ; 16
(push) ; 16
; [else-branch: 81 | False]
(assert false)
(pop) ; 16
(pop) ; 15
; Joined path conditions
; Joined path conditions
(pop) ; 14
(push) ; 14
; [else-branch: 80 | False]
(assert false)
(pop) ; 14
(pop) ; 13
; Joined path conditions
; Joined path conditions
(pop) ; 12
(push) ; 12
; [else-branch: 79 | False]
(assert false)
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(pop) ; 10
(push) ; 10
; [else-branch: 78 | False]
(assert false)
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
; [then-branch: 84 | False | dead]
; [else-branch: 84 | True | live]
(push) ; 9
; [else-branch: 84 | True]
(pop) ; 9
(pop) ; 8
; [eval] !(loop__label_bb1__label_bb2$marker && (label_2_custom$marker && (label_bb24$marker && (label_bb26$marker && (label_bb27$marker && (label_bb29$marker && label_bb30$marker))))))
; [eval] loop__label_bb1__label_bb2$marker && (label_2_custom$marker && (label_bb24$marker && (label_bb26$marker && (label_bb27$marker && (label_bb29$marker && label_bb30$marker)))))
(push) ; 8
; [then-branch: 85 | True | live]
; [else-branch: 85 | False | live]
(push) ; 9
; [then-branch: 85 | True]
(push) ; 10
; [then-branch: 86 | True | live]
; [else-branch: 86 | False | live]
(push) ; 11
; [then-branch: 86 | True]
(push) ; 12
; [then-branch: 87 | True | live]
; [else-branch: 87 | False | live]
(push) ; 13
; [then-branch: 87 | True]
(push) ; 14
; [then-branch: 88 | True | live]
; [else-branch: 88 | False | live]
(push) ; 15
; [then-branch: 88 | True]
(push) ; 16
; [then-branch: 89 | True | live]
; [else-branch: 89 | False | live]
(push) ; 17
; [then-branch: 89 | True]
(push) ; 18
; [then-branch: 90 | True | live]
; [else-branch: 90 | False | live]
(push) ; 19
; [then-branch: 90 | True]
(pop) ; 19
(push) ; 19
; [else-branch: 90 | False]
(assert false)
(pop) ; 19
(pop) ; 18
; Joined path conditions
; Joined path conditions
(pop) ; 17
(push) ; 17
; [else-branch: 89 | False]
(assert false)
(pop) ; 17
(pop) ; 16
; Joined path conditions
; Joined path conditions
(pop) ; 15
(push) ; 15
; [else-branch: 88 | False]
(assert false)
(pop) ; 15
(pop) ; 14
; Joined path conditions
; Joined path conditions
(pop) ; 13
(push) ; 13
; [else-branch: 87 | False]
(assert false)
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(pop) ; 11
(push) ; 11
; [else-branch: 86 | False]
(assert false)
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(pop) ; 9
(push) ; 9
; [else-branch: 85 | False]
(assert false)
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
; [then-branch: 91 | False | dead]
; [else-branch: 91 | True | live]
(push) ; 8
; [else-branch: 91 | True]
(pop) ; 8
(pop) ; 7
(push) ; 7
; [else-branch: 17 | destructor$Snap$Bool$$value[Bool](_7$snapshot$2@160@01)]
(assert (destructor$Snap$Bool$$value<Bool> _7$snapshot$2@160@01))
(pop) ; 7
; [eval] !!destructor$Snap$Bool$$value(_7$snapshot$2)
; [eval] !destructor$Snap$Bool$$value(_7$snapshot$2)
; [eval] destructor$Snap$Bool$$value(_7$snapshot$2)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (destructor$Snap$Bool$$value<Bool> _7$snapshot$2@160@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (destructor$Snap$Bool$$value<Bool> _7$snapshot$2@160@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [then-branch: 92 | destructor$Snap$Bool$$value[Bool](_7$snapshot$2@160@01) | live]
; [else-branch: 92 | !(destructor$Snap$Bool$$value[Bool](_7$snapshot$2@160@01)) | live]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 92 | destructor$Snap$Bool$$value[Bool](_7$snapshot$2@160@01)]
(assert (destructor$Snap$Bool$$value<Bool> _7$snapshot$2@160@01))
(push) ; 8
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [then-branch: 93 | True | live]
; [else-branch: 93 | False | dead]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 93 | True]
; [exec]
; label loop__label_bb1__label_3_custom
; [exec]
; loop__label_bb1__label_3_custom$marker := true
; [exec]
; inhale basic_block_marker$loop__label_bb1__label_3_custom$marker()
(declare-const $t@651@01 $Snap)
(assert (= $t@651@01 $Snap.unit))
; [eval] basic_block_marker$loop__label_bb1__label_3_custom$marker()
(assert (as basic_block_marker$loop__label_bb1__label_3_custom$marker<Bool>  Bool))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; label loop__label_bb1__label_bb3
; [exec]
; loop__label_bb1__label_bb3$marker := true
; [exec]
; inhale basic_block_marker$loop__label_bb1__label_bb3$marker()
(declare-const $t@652@01 $Snap)
(assert (= $t@652@01 $Snap.unit))
; [eval] basic_block_marker$loop__label_bb1__label_bb3$marker()
(assert (as basic_block_marker$loop__label_bb1__label_bb3$marker<Bool>  Bool))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlock(_10$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
(declare-const $t@653@01 $Snap)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _45$place<Place>  Place)) _45$address@125@01)
    _10$address@6@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 9
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _37$place<Place>  Place)) _37$address@88@01)
    _10$address@6@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 9
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= _5$address@136@01 _10$address@6@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (= _0$address@0@01 _10$address@6@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _37$place<Place>  Place) _37$address@88@01)
    _10$address@6@01)
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 9
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _45$place<Place>  Place) _45$address@125@01)
    _10$address@6@01)
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlockStackDrop(_10$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
(declare-const $t@654@01 $Snap)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= _5$address@136@01 _10$address@6@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (= _3$address@59@01 _10$address@6@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 9
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (= _2$address@27@01 _10$address@6@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (= _4$address@105@01 _10$address@6@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 9
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (= _7$address@157@01 _10$address@6@01)
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlock(_11$address, Size$Bool$()), write)
; [eval] Size$Bool$()
(declare-const $t@655@01 $Snap)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (= _10$address@6@01 _11$address@11@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 9
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _45$place<Place>  Place)) _45$address@125@01)
    _11$address@11@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 9
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _37$place<Place>  Place)) _37$address@88@01)
    _11$address@11@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 9
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (= _5$address@136@01 _11$address@11@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 9
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (= _0$address@0@01 _11$address@11@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 9
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _37$place<Place>  Place) _37$address@88@01)
    _11$address@11@01)
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 9
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _45$place<Place>  Place) _45$address@125@01)
    _11$address@11@01)
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 9
; 0.01s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlockStackDrop(_11$address, Size$Bool$()), write)
; [eval] Size$Bool$()
(declare-const $t@656@01 $Snap)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (= _10$address@6@01 _11$address@11@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 9
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (= _5$address@136@01 _11$address@11@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (= _3$address@59@01 _11$address@11@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 9
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (= _2$address@27@01 _11$address@11@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (= _4$address@105@01 _11$address@11@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 9
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= _7$address@157@01 _11$address@11@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; write_place_constant$Bool(_11$place(), _11$address, constructor$Snap$Bool$(false))
; [eval] _11$place()
; [eval] constructor$Snap$Bool$(false)
; [eval] compute_address(target_place, target_root_address)
; [eval] Size$Bool$()
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _45$place<Place>  Place) _45$address@125@01)
    (compute_address<Address> (as _11$place<Place>  Place) _11$address@11@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _37$place<Place>  Place) _37$address@88@01)
    (compute_address<Address> (as _11$place<Place>  Place) _11$address@11@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 9
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (=
    _0$address@0@01
    (compute_address<Address> (as _11$place<Place>  Place) _11$address@11@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (=
    _5$address@136@01
    (compute_address<Address> (as _11$place<Place>  Place) _11$address@11@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _37$place<Place>  Place)) _37$address@88@01)
    (compute_address<Address> (as _11$place<Place>  Place) _11$address@11@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 9
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _45$place<Place>  Place)) _45$address@125@01)
    (compute_address<Address> (as _11$place<Place>  Place) _11$address@11@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 9
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (=
    _10$address@6@01
    (compute_address<Address> (as _11$place<Place>  Place) _11$address@11@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  _11$address@11@01
  (compute_address<Address> (as _11$place<Place>  Place) _11$address@11@01))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [eval] valid$Snap$Bool(source_snapshot)
(declare-const $t@657@01 $Snap)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (=
    (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _37$place<Place>  Place))
    (as _11$place<Place>  Place))
  (= _37$address@88@01 _11$address@11@01)
  (=
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> result_value@472@01)
    (constructor$Snap$Bool$<Snap$Bool> false)))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (=
    (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _45$place<Place>  Place))
    (as _11$place<Place>  Place))
  (= _45$address@125@01 _11$address@11@01)
  (=
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> result_value@508@01)
    (constructor$Snap$Bool$<Snap$Bool> false)))))
(check-sat)
; unknown
(pop) ; 9
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (= (as _7$place<Place>  Place) (as _11$place<Place>  Place))
  (= _7$address@157@01 _11$address@11@01)
  (= result_value@532@01 (constructor$Snap$Bool$<Snap$Bool> false)))))
(check-sat)
; unknown
(pop) ; 9
; 0.01s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _11$snapshot$2 == constructor$Snap$Bool$(false)
(declare-const $t@658@01 $Snap)
(assert (= $t@658@01 $Snap.unit))
; [eval] _11$snapshot$2 == constructor$Snap$Bool$(false)
; [eval] constructor$Snap$Bool$(false)
(assert (= _11$snapshot$2@14@01 (constructor$Snap$Bool$<Snap$Bool> false)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert destructor$Snap$Bool$$value(constructor$Snap$Bool$LtCmp_I64(_2$snapshot$3,
;   _1$snapshot$0))
; [eval] destructor$Snap$Bool$$value(constructor$Snap$Bool$LtCmp_I64(_2$snapshot$3, _1$snapshot$0))
; [eval] constructor$Snap$Bool$LtCmp_I64(_2$snapshot$3, _1$snapshot$0)
(set-option :timeout 0)
(push) ; 9
(assert (not (destructor$Snap$Bool$$value<Bool> (constructor$Snap$Bool$LtCmp_I64<Snap$Bool> _2$snapshot$3@31@01 _1$snapshot$0@5@01))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (destructor$Snap$Bool$$value<Bool> (constructor$Snap$Bool$LtCmp_I64<Snap$Bool> _2$snapshot$3@31@01 _1$snapshot$0@5@01)))
; [exec]
; assert destructor$Snap$Bool$$value(constructor$Snap$Bool$GeCmp_I64(_2$snapshot$3,
;   constructor$Snap$I64$(0)))
; [eval] destructor$Snap$Bool$$value(constructor$Snap$Bool$GeCmp_I64(_2$snapshot$3, constructor$Snap$I64$(0)))
; [eval] constructor$Snap$Bool$GeCmp_I64(_2$snapshot$3, constructor$Snap$I64$(0))
; [eval] constructor$Snap$I64$(0)
(push) ; 9
(assert (not (destructor$Snap$Bool$$value<Bool> (constructor$Snap$Bool$GeCmp_I64<Snap$Bool> _2$snapshot$3@31@01 (constructor$Snap$I64$<Snap$I64> 0)))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (destructor$Snap$Bool$$value<Bool> (constructor$Snap$Bool$GeCmp_I64<Snap$Bool> _2$snapshot$3@31@01 (constructor$Snap$I64$<Snap$I64> 0))))
; [exec]
; assert destructor$Snap$Bool$$value(constructor$Snap$Bool$EqCmp_I64(_3$snapshot$3,
;   caller_for$m_fib$(_2$snapshot$3)))
; [eval] destructor$Snap$Bool$$value(constructor$Snap$Bool$EqCmp_I64(_3$snapshot$3, caller_for$m_fib$(_2$snapshot$3)))
; [eval] constructor$Snap$Bool$EqCmp_I64(_3$snapshot$3, caller_for$m_fib$(_2$snapshot$3))
; [eval] caller_for$m_fib$(_2$snapshot$3)
(push) ; 9
; [eval] destructor$Snap$Bool$$value(constructor$Snap$Bool$GeCmp_I64(_1, constructor$Snap$I64$(0)))
; [eval] constructor$Snap$Bool$GeCmp_I64(_1, constructor$Snap$I64$(0))
; [eval] constructor$Snap$I64$(0)
; [eval] valid$Snap$I64(_1)
(assert (caller_for$m_fib$%precondition ($Snap.combine $Snap.unit $Snap.unit) _2$snapshot$3@31@01))
(pop) ; 9
; Joined path conditions
(assert (caller_for$m_fib$%precondition ($Snap.combine $Snap.unit $Snap.unit) _2$snapshot$3@31@01))
(push) ; 9
(assert (not (destructor$Snap$Bool$$value<Bool> (constructor$Snap$Bool$EqCmp_I64<Snap$Bool> _3$snapshot$3@63@01 (caller_for$m_fib$ ($Snap.combine
  $Snap.unit
  $Snap.unit) _2$snapshot$3@31@01)))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (destructor$Snap$Bool$$value<Bool> (constructor$Snap$Bool$EqCmp_I64<Snap$Bool> _3$snapshot$3@63@01 (caller_for$m_fib$ ($Snap.combine
  $Snap.unit
  $Snap.unit) _2$snapshot$3@31@01))))
; [exec]
; assert destructor$Snap$Bool$$value(constructor$Snap$Bool$EqCmp_I64(_4$snapshot$3,
;   caller_for$m_fib$(constructor$Snap$I64$Add_I64(_2$snapshot$3, constructor$Snap$I64$(1)))))
; [eval] destructor$Snap$Bool$$value(constructor$Snap$Bool$EqCmp_I64(_4$snapshot$3, caller_for$m_fib$(constructor$Snap$I64$Add_I64(_2$snapshot$3, constructor$Snap$I64$(1)))))
; [eval] constructor$Snap$Bool$EqCmp_I64(_4$snapshot$3, caller_for$m_fib$(constructor$Snap$I64$Add_I64(_2$snapshot$3, constructor$Snap$I64$(1))))
; [eval] caller_for$m_fib$(constructor$Snap$I64$Add_I64(_2$snapshot$3, constructor$Snap$I64$(1)))
; [eval] constructor$Snap$I64$Add_I64(_2$snapshot$3, constructor$Snap$I64$(1))
; [eval] constructor$Snap$I64$(1)
(push) ; 9
; [eval] destructor$Snap$Bool$$value(constructor$Snap$Bool$GeCmp_I64(_1, constructor$Snap$I64$(0)))
; [eval] constructor$Snap$Bool$GeCmp_I64(_1, constructor$Snap$I64$(0))
; [eval] constructor$Snap$I64$(0)
(push) ; 10
(assert (not (destructor$Snap$Bool$$value<Bool> (constructor$Snap$Bool$GeCmp_I64<Snap$Bool> (constructor$Snap$I64$Add_I64<Snap$I64> _2$snapshot$3@31@01 (constructor$Snap$I64$<Snap$I64> 1)) (constructor$Snap$I64$<Snap$I64> 0)))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(assert (destructor$Snap$Bool$$value<Bool> (constructor$Snap$Bool$GeCmp_I64<Snap$Bool> (constructor$Snap$I64$Add_I64<Snap$I64> _2$snapshot$3@31@01 (constructor$Snap$I64$<Snap$I64> 1)) (constructor$Snap$I64$<Snap$I64> 0))))
; [eval] valid$Snap$I64(_1)
(push) ; 10
(assert (not (valid$Snap$I64<Bool> (constructor$Snap$I64$Add_I64<Snap$I64> _2$snapshot$3@31@01 (constructor$Snap$I64$<Snap$I64> 1)))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(assert (valid$Snap$I64<Bool> (constructor$Snap$I64$Add_I64<Snap$I64> _2$snapshot$3@31@01 (constructor$Snap$I64$<Snap$I64> 1))))
(assert (caller_for$m_fib$%precondition ($Snap.combine $Snap.unit $Snap.unit) (constructor$Snap$I64$Add_I64<Snap$I64> _2$snapshot$3@31@01 (constructor$Snap$I64$<Snap$I64> 1))))
(pop) ; 9
; Joined path conditions
(assert (and
  (destructor$Snap$Bool$$value<Bool> (constructor$Snap$Bool$GeCmp_I64<Snap$Bool> (constructor$Snap$I64$Add_I64<Snap$I64> _2$snapshot$3@31@01 (constructor$Snap$I64$<Snap$I64> 1)) (constructor$Snap$I64$<Snap$I64> 0)))
  (valid$Snap$I64<Bool> (constructor$Snap$I64$Add_I64<Snap$I64> _2$snapshot$3@31@01 (constructor$Snap$I64$<Snap$I64> 1)))
  (caller_for$m_fib$%precondition ($Snap.combine $Snap.unit $Snap.unit) (constructor$Snap$I64$Add_I64<Snap$I64> _2$snapshot$3@31@01 (constructor$Snap$I64$<Snap$I64> 1)))))
(push) ; 9
(assert (not (destructor$Snap$Bool$$value<Bool> (constructor$Snap$Bool$EqCmp_I64<Snap$Bool> _4$snapshot$3@109@01 (caller_for$m_fib$ ($Snap.combine
  $Snap.unit
  $Snap.unit) (constructor$Snap$I64$Add_I64<Snap$I64> _2$snapshot$3@31@01 (constructor$Snap$I64$<Snap$I64> 1)))))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (destructor$Snap$Bool$$value<Bool> (constructor$Snap$Bool$EqCmp_I64<Snap$Bool> _4$snapshot$3@109@01 (caller_for$m_fib$ ($Snap.combine
  $Snap.unit
  $Snap.unit) (constructor$Snap$I64$Add_I64<Snap$I64> _2$snapshot$3@31@01 (constructor$Snap$I64$<Snap$I64> 1))))))
; [exec]
; assert destructor$Snap$Bool$$value(constructor$Snap$Bool$EqCmp_Lifetime(lft_0$snapshot$1,
;   intersect(Set(bw15$snapshot$0))))
; [eval] destructor$Snap$Bool$$value(constructor$Snap$Bool$EqCmp_Lifetime(lft_0$snapshot$1, intersect(Set(bw15$snapshot$0))))
; [eval] constructor$Snap$Bool$EqCmp_Lifetime(lft_0$snapshot$1, intersect(Set(bw15$snapshot$0)))
; [eval] intersect(Set(bw15$snapshot$0))
; [eval] Set(bw15$snapshot$0)
; [exec]
; assert destructor$Snap$Bool$$value(constructor$Snap$Bool$EqCmp_Lifetime(lft_1$snapshot$1,
;   intersect(Set(bw15$snapshot$0, bw16$snapshot$0))))
; [eval] destructor$Snap$Bool$$value(constructor$Snap$Bool$EqCmp_Lifetime(lft_1$snapshot$1, intersect(Set(bw15$snapshot$0, bw16$snapshot$0))))
; [eval] constructor$Snap$Bool$EqCmp_Lifetime(lft_1$snapshot$1, intersect(Set(bw15$snapshot$0, bw16$snapshot$0)))
; [eval] intersect(Set(bw15$snapshot$0, bw16$snapshot$0))
; [eval] Set(bw15$snapshot$0, bw16$snapshot$0)
; [exec]
; assert destructor$Snap$Bool$$value(constructor$Snap$Bool$LtCmp_Unbounded(constructor$Snap$Unbounded$Sub_Unbounded(constructor$Snap$Unbounded$(destructor$Snap$I64$$value(_1$snapshot$0)),
;   constructor$Snap$Unbounded$(destructor$Snap$I64$$value(_2$snapshot$3))), loop_variant$1$snapshot$2))
; [eval] destructor$Snap$Bool$$value(constructor$Snap$Bool$LtCmp_Unbounded(constructor$Snap$Unbounded$Sub_Unbounded(constructor$Snap$Unbounded$(destructor$Snap$I64$$value(_1$snapshot$0)), constructor$Snap$Unbounded$(destructor$Snap$I64$$value(_2$snapshot$3))), loop_variant$1$snapshot$2))
; [eval] constructor$Snap$Bool$LtCmp_Unbounded(constructor$Snap$Unbounded$Sub_Unbounded(constructor$Snap$Unbounded$(destructor$Snap$I64$$value(_1$snapshot$0)), constructor$Snap$Unbounded$(destructor$Snap$I64$$value(_2$snapshot$3))), loop_variant$1$snapshot$2)
; [eval] constructor$Snap$Unbounded$Sub_Unbounded(constructor$Snap$Unbounded$(destructor$Snap$I64$$value(_1$snapshot$0)), constructor$Snap$Unbounded$(destructor$Snap$I64$$value(_2$snapshot$3)))
; [eval] constructor$Snap$Unbounded$(destructor$Snap$I64$$value(_1$snapshot$0))
; [eval] destructor$Snap$I64$$value(_1$snapshot$0)
; [eval] constructor$Snap$Unbounded$(destructor$Snap$I64$$value(_2$snapshot$3))
; [eval] destructor$Snap$I64$$value(_2$snapshot$3)
(push) ; 9
(assert (not (destructor$Snap$Bool$$value<Bool> (constructor$Snap$Bool$LtCmp_Unbounded<Snap$Bool> (constructor$Snap$Unbounded$Sub_Unbounded<Snap$Unbounded> (constructor$Snap$Unbounded$<Snap$Unbounded> (destructor$Snap$I64$$value<Int> _1$snapshot$0@5@01)) (constructor$Snap$Unbounded$<Snap$Unbounded> (destructor$Snap$I64$$value<Int> _2$snapshot$3@31@01))) loop_variant$1$snapshot$2@214@01))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (destructor$Snap$Bool$$value<Bool> (constructor$Snap$Bool$LtCmp_Unbounded<Snap$Bool> (constructor$Snap$Unbounded$Sub_Unbounded<Snap$Unbounded> (constructor$Snap$Unbounded$<Snap$Unbounded> (destructor$Snap$I64$$value<Int> _1$snapshot$0@5@01)) (constructor$Snap$Unbounded$<Snap$Unbounded> (destructor$Snap$I64$$value<Int> _2$snapshot$3@31@01))) loop_variant$1$snapshot$2@214@01)))
; [exec]
; assert destructor$Snap$Bool$$value(constructor$Snap$Bool$GeCmp_Unbounded(constructor$Snap$Unbounded$Sub_Unbounded(constructor$Snap$Unbounded$(destructor$Snap$I64$$value(_1$snapshot$0)),
;   constructor$Snap$Unbounded$(destructor$Snap$I64$$value(_2$snapshot$3))), constructor$Snap$Unbounded$(0)))
; [eval] destructor$Snap$Bool$$value(constructor$Snap$Bool$GeCmp_Unbounded(constructor$Snap$Unbounded$Sub_Unbounded(constructor$Snap$Unbounded$(destructor$Snap$I64$$value(_1$snapshot$0)), constructor$Snap$Unbounded$(destructor$Snap$I64$$value(_2$snapshot$3))), constructor$Snap$Unbounded$(0)))
; [eval] constructor$Snap$Bool$GeCmp_Unbounded(constructor$Snap$Unbounded$Sub_Unbounded(constructor$Snap$Unbounded$(destructor$Snap$I64$$value(_1$snapshot$0)), constructor$Snap$Unbounded$(destructor$Snap$I64$$value(_2$snapshot$3))), constructor$Snap$Unbounded$(0))
; [eval] constructor$Snap$Unbounded$Sub_Unbounded(constructor$Snap$Unbounded$(destructor$Snap$I64$$value(_1$snapshot$0)), constructor$Snap$Unbounded$(destructor$Snap$I64$$value(_2$snapshot$3)))
; [eval] constructor$Snap$Unbounded$(destructor$Snap$I64$$value(_1$snapshot$0))
; [eval] destructor$Snap$I64$$value(_1$snapshot$0)
; [eval] constructor$Snap$Unbounded$(destructor$Snap$I64$$value(_2$snapshot$3))
; [eval] destructor$Snap$I64$$value(_2$snapshot$3)
; [eval] constructor$Snap$Unbounded$(0)
(push) ; 9
(assert (not (destructor$Snap$Bool$$value<Bool> (constructor$Snap$Bool$GeCmp_Unbounded<Snap$Bool> (constructor$Snap$Unbounded$Sub_Unbounded<Snap$Unbounded> (constructor$Snap$Unbounded$<Snap$Unbounded> (destructor$Snap$I64$$value<Int> _1$snapshot$0@5@01)) (constructor$Snap$Unbounded$<Snap$Unbounded> (destructor$Snap$I64$$value<Int> _2$snapshot$3@31@01))) (constructor$Snap$Unbounded$<Snap$Unbounded> 0)))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (destructor$Snap$Bool$$value<Bool> (constructor$Snap$Bool$GeCmp_Unbounded<Snap$Bool> (constructor$Snap$Unbounded$Sub_Unbounded<Snap$Unbounded> (constructor$Snap$Unbounded$<Snap$Unbounded> (destructor$Snap$I64$$value<Int> _1$snapshot$0@5@01)) (constructor$Snap$Unbounded$<Snap$Unbounded> (destructor$Snap$I64$$value<Int> _2$snapshot$3@31@01))) (constructor$Snap$Unbounded$<Snap$Unbounded> 0))))
; [exec]
; inhale false
(pop) ; 8
; [eval] !true
; [then-branch: 94 | False | dead]
; [else-branch: 94 | True | live]
(push) ; 8
; [else-branch: 94 | True]
(pop) ; 8
(pop) ; 7
(push) ; 7
; [else-branch: 92 | !(destructor$Snap$Bool$$value[Bool](_7$snapshot$2@160@01))]
(assert (not (destructor$Snap$Bool$$value<Bool> _7$snapshot$2@160@01)))
(pop) ; 7
(pop) ; 6
; [eval] !!destructor$Snap$Bool$$value(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(_45$snapshot$1))
; [eval] !destructor$Snap$Bool$$value(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(_45$snapshot$1))
; [eval] destructor$Snap$Bool$$value(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(_45$snapshot$1))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(_45$snapshot$1)
(push) ; 6
(set-option :timeout 10)
(assert (not (not
  (destructor$Snap$Bool$$value<Bool> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> _45$snapshot$1@127@01)))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [then-branch: 95 | destructor$Snap$Bool$$value[Bool](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](_45$snapshot$1@127@01)) | dead]
; [else-branch: 95 | !(destructor$Snap$Bool$$value[Bool](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](_45$snapshot$1@127@01))) | live]
(set-option :timeout 0)
(push) ; 6
; [else-branch: 95 | !(destructor$Snap$Bool$$value[Bool](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](_45$snapshot$1@127@01)))]
(assert (not
  (destructor$Snap$Bool$$value<Bool> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> _45$snapshot$1@127@01))))
(pop) ; 6
(pop) ; 5
; [eval] !!destructor$Snap$Bool$$value(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(_37$snapshot$1))
; [eval] !destructor$Snap$Bool$$value(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(_37$snapshot$1))
; [eval] destructor$Snap$Bool$$value(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(_37$snapshot$1))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(_37$snapshot$1)
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  (destructor$Snap$Bool$$value<Bool> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> _37$snapshot$1@90@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [then-branch: 96 | destructor$Snap$Bool$$value[Bool](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](_37$snapshot$1@90@01)) | dead]
; [else-branch: 96 | !(destructor$Snap$Bool$$value[Bool](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](_37$snapshot$1@90@01))) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 96 | !(destructor$Snap$Bool$$value[Bool](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](_37$snapshot$1@90@01)))]
(assert (not
  (destructor$Snap$Bool$$value<Bool> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> _37$snapshot$1@90@01))))
(pop) ; 5
(pop) ; 4
; [eval] !true
; [then-branch: 97 | False | dead]
; [else-branch: 97 | True | live]
(push) ; 4
; [else-branch: 97 | True]
(pop) ; 4
(pop) ; 3
(push) ; 3
; [else-branch: 11 | !(destructor$Snap$Bool$$value[Bool](_7$snapshot$1@159@01))]
(assert (not (destructor$Snap$Bool$$value<Bool> _7$snapshot$1@159@01)))
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- assign$Bool$BinaryOp$LtCmp$Move$I64$Move$I64$$$$ ----------
(declare-const target_place@659@01 Place)
(declare-const target_address@660@01 Address)
(declare-const operand1_place@661@01 Place)
(declare-const operand1_root_address@662@01 Address)
(declare-const operand1_value@663@01 Snap$I64)
(declare-const operand2_place@664@01 Place)
(declare-const operand2_root_address@665@01 Address)
(declare-const operand2_value@666@01 Snap$I64)
(declare-const result_value@667@01 Snap$Bool)
(declare-const target_place@668@01 Place)
(declare-const target_address@669@01 Address)
(declare-const operand1_place@670@01 Place)
(declare-const operand1_root_address@671@01 Address)
(declare-const operand1_value@672@01 Snap$I64)
(declare-const operand2_place@673@01 Place)
(declare-const operand2_root_address@674@01 Address)
(declare-const operand2_value@675@01 Snap$I64)
(declare-const result_value@676@01 Snap$Bool)
(push) ; 1
(declare-const $t@677@01 $Snap)
(assert (= $t@677@01 ($Snap.combine ($Snap.first $t@677@01) ($Snap.second $t@677@01))))
; [eval] compute_address(target_place, target_address)
; [eval] Size$Bool$()
(assert (=
  ($Snap.second $t@677@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@677@01))
    ($Snap.second ($Snap.second $t@677@01)))))
(assert (=
  ($Snap.second ($Snap.second $t@677@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@677@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@677@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@677@01))) $Snap.unit))
; [eval] valid$Snap$I64(operand1_value)
(assert (valid$Snap$I64<Bool> operand1_value@672@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@677@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@677@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@677@01)))))))
(push) ; 2
(set-option :timeout 10)
(assert (not (and
  (= operand1_place@670@01 operand2_place@673@01)
  (= operand1_root_address@671@01 operand2_root_address@674@01)
  (= operand1_value@672@01 operand2_value@675@01))))
(check-sat)
; unknown
(pop) ; 2
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@677@01))))
  $Snap.unit))
; [eval] valid$Snap$I64(operand2_value)
(assert (valid$Snap$I64<Bool> operand2_value@675@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@678@01 $Snap)
(assert (= $t@678@01 ($Snap.combine ($Snap.first $t@678@01) ($Snap.second $t@678@01))))
(assert (=
  ($Snap.second $t@678@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@678@01))
    ($Snap.second ($Snap.second $t@678@01)))))
; [eval] compute_address(operand1_place, operand1_root_address)
; [eval] Size$I64$()
(assert (=
  ($Snap.second ($Snap.second $t@678@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@678@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@678@01))))))
; [eval] compute_address(operand2_place, operand2_root_address)
; [eval] Size$I64$()
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> operand1_place@670@01 operand1_root_address@671@01)
  (compute_address<Address> operand2_place@673@01 operand2_root_address@674@01))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@678@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@678@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@678@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@678@01))))
  $Snap.unit))
; [eval] result_value == constructor$Snap$Bool$LtCmp_I64(operand1_value, operand2_value)
; [eval] constructor$Snap$Bool$LtCmp_I64(operand1_value, operand2_value)
(assert (=
  result_value@676@01
  (constructor$Snap$Bool$LtCmp_I64<Snap$Bool> operand1_value@672@01 operand2_value@675@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@678@01))))
  $Snap.unit))
; [eval] valid$Snap$Bool(result_value)
(assert (valid$Snap$Bool<Bool> result_value@676@01))
(pop) ; 2
(set-option :timeout 0)
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- assign$Tuple$$I64$Bool$$I64$Bool$$CheckedBinaryOp$Add$Copy$I64$Constant$I64$$$$ ----------
(declare-const target_place@679@01 Place)
(declare-const target_address@680@01 Address)
(declare-const operand1_place@681@01 Place)
(declare-const operand1_root_address@682@01 Address)
(declare-const operand1_value@683@01 Snap$I64)
(declare-const operand2_value@684@01 Snap$I64)
(declare-const result_value@685@01 Snap$Tuple$$I64$Bool$$I64$Bool$)
(declare-const target_place@686@01 Place)
(declare-const target_address@687@01 Address)
(declare-const operand1_place@688@01 Place)
(declare-const operand1_root_address@689@01 Address)
(declare-const operand1_value@690@01 Snap$I64)
(declare-const operand2_value@691@01 Snap$I64)
(declare-const result_value@692@01 Snap$Tuple$$I64$Bool$$I64$Bool$)
(push) ; 1
(declare-const $t@693@01 $Snap)
(assert (= $t@693@01 ($Snap.combine ($Snap.first $t@693@01) ($Snap.second $t@693@01))))
; [eval] compute_address(target_place, target_address)
; [eval] Size$Tuple$$I64$Bool$$I64$Bool$$()
(assert (=
  ($Snap.second $t@693@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@693@01))
    ($Snap.second ($Snap.second $t@693@01)))))
(assert (=
  ($Snap.second ($Snap.second $t@693@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@693@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@693@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@693@01))) $Snap.unit))
; [eval] valid$Snap$I64(operand1_value)
(assert (valid$Snap$I64<Bool> operand1_value@690@01))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@693@01))) $Snap.unit))
; [eval] valid$Snap$I64(operand2_value)
(assert (valid$Snap$I64<Bool> operand2_value@691@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@694@01 $Snap)
(assert (= $t@694@01 ($Snap.combine ($Snap.first $t@694@01) ($Snap.second $t@694@01))))
; [eval] compute_address(target_place, target_address)
; [eval] PaddingSize$Tuple$$I64$Bool$$I64$Bool$$()
(assert (=
  ($Snap.second $t@694@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@694@01))
    ($Snap.second ($Snap.second $t@694@01)))))
; [eval] field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(compute_address(target_place, target_address))
; [eval] compute_address(target_place, target_address)
; [eval] Size$I64$()
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> target_place@686@01 target_address@687@01)
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> target_place@686@01 target_address@687@01)))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second $t@694@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@694@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@694@01))))))
; [eval] field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(target_place)
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(result_value)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@694@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@694@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@694@01)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@694@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@694@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@694@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@694@01)))))
  $Snap.unit))
; [eval] valid$Snap$I64(constructor$Snap$I64$Add_I64(operand1_value, operand2_value)) ==> destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(result_value) == constructor$Snap$I64$Add_I64(operand1_value, operand2_value)
; [eval] valid$Snap$I64(constructor$Snap$I64$Add_I64(operand1_value, operand2_value))
; [eval] constructor$Snap$I64$Add_I64(operand1_value, operand2_value)
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (valid$Snap$I64<Bool> (constructor$Snap$I64$Add_I64<Snap$I64> operand1_value@690@01 operand2_value@691@01)))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (valid$Snap$I64<Bool> (constructor$Snap$I64$Add_I64<Snap$I64> operand1_value@690@01 operand2_value@691@01))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [then-branch: 98 | valid$Snap$I64[Bool](constructor$Snap$I64$Add_I64[Snap$I64](operand1_value@690@01, operand2_value@691@01)) | live]
; [else-branch: 98 | !(valid$Snap$I64[Bool](constructor$Snap$I64$Add_I64[Snap$I64](operand1_value@690@01, operand2_value@691@01))) | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 98 | valid$Snap$I64[Bool](constructor$Snap$I64$Add_I64[Snap$I64](operand1_value@690@01, operand2_value@691@01))]
(assert (valid$Snap$I64<Bool> (constructor$Snap$I64$Add_I64<Snap$I64> operand1_value@690@01 operand2_value@691@01)))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(result_value) == constructor$Snap$I64$Add_I64(operand1_value, operand2_value)
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(result_value)
; [eval] constructor$Snap$I64$Add_I64(operand1_value, operand2_value)
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (valid$Snap$I64<Bool> (constructor$Snap$I64$Add_I64<Snap$I64> operand1_value@690@01 operand2_value@691@01)))
(assert (=>
  (valid$Snap$I64<Bool> (constructor$Snap$I64$Add_I64<Snap$I64> operand1_value@690@01 operand2_value@691@01))
  (=
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> result_value@692@01)
    (constructor$Snap$I64$Add_I64<Snap$I64> operand1_value@690@01 operand2_value@691@01))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@694@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@694@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@694@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@694@01))))))
  $Snap.unit))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(result_value) == constructor$Snap$Bool$(!valid$Snap$I64(constructor$Snap$I64$Add_I64(operand1_value, operand2_value)))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(result_value)
; [eval] constructor$Snap$Bool$(!valid$Snap$I64(constructor$Snap$I64$Add_I64(operand1_value, operand2_value)))
; [eval] !valid$Snap$I64(constructor$Snap$I64$Add_I64(operand1_value, operand2_value))
; [eval] valid$Snap$I64(constructor$Snap$I64$Add_I64(operand1_value, operand2_value))
; [eval] constructor$Snap$I64$Add_I64(operand1_value, operand2_value)
(assert (=
  (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> result_value@692@01)
  (constructor$Snap$Bool$<Snap$Bool> (not
    (valid$Snap$I64<Bool> (constructor$Snap$I64$Add_I64<Snap$I64> operand1_value@690@01 operand2_value@691@01))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@694@01))))))
  $Snap.unit))
; [eval] MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(compute_address(target_place, target_address)), Size$I64$()) == to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(result_value))
; [eval] MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(compute_address(target_place, target_address)), Size$I64$())
; [eval] field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(compute_address(target_place, target_address))
; [eval] compute_address(target_place, target_address)
; [eval] Size$I64$()
(push) ; 3
(declare-const $k@695@01 $Perm)
(assert ($Perm.isReadVar $k@695@01))
(assert (< $k@695@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@695@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@695@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@694@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> target_place@686@01 target_address@687@01)) (as Size$I64$<Snap$Usize>  Snap$Usize)))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@695@01))
(assert (and
  (< $k@695@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@695@01))
  (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@694@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> target_place@686@01 target_address@687@01)) (as Size$I64$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(result_value))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(result_value)
(assert (=
  (MemoryBlock$bytes ($Snap.first ($Snap.second $t@694@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> target_place@686@01 target_address@687@01)) (as Size$I64$<Snap$Usize>  Snap$Usize))
  (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> result_value@692@01))))
(pop) ; 2
(set-option :timeout 0)
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- assign$Tuple$$I64$Bool$$I64$Bool$$CheckedBinaryOp$Add$Copy$I64$Copy$I64$$$$ ----------
(declare-const target_place@696@01 Place)
(declare-const target_address@697@01 Address)
(declare-const operand1_place@698@01 Place)
(declare-const operand1_root_address@699@01 Address)
(declare-const operand1_value@700@01 Snap$I64)
(declare-const operand2_place@701@01 Place)
(declare-const operand2_root_address@702@01 Address)
(declare-const operand2_value@703@01 Snap$I64)
(declare-const result_value@704@01 Snap$Tuple$$I64$Bool$$I64$Bool$)
(declare-const target_place@705@01 Place)
(declare-const target_address@706@01 Address)
(declare-const operand1_place@707@01 Place)
(declare-const operand1_root_address@708@01 Address)
(declare-const operand1_value@709@01 Snap$I64)
(declare-const operand2_place@710@01 Place)
(declare-const operand2_root_address@711@01 Address)
(declare-const operand2_value@712@01 Snap$I64)
(declare-const result_value@713@01 Snap$Tuple$$I64$Bool$$I64$Bool$)
(push) ; 1
(declare-const $t@714@01 $Snap)
(assert (= $t@714@01 ($Snap.combine ($Snap.first $t@714@01) ($Snap.second $t@714@01))))
; [eval] compute_address(target_place, target_address)
; [eval] Size$Tuple$$I64$Bool$$I64$Bool$$()
(assert (=
  ($Snap.second $t@714@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@714@01))
    ($Snap.second ($Snap.second $t@714@01)))))
(assert (=
  ($Snap.second ($Snap.second $t@714@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@714@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@714@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@714@01))) $Snap.unit))
; [eval] valid$Snap$I64(operand1_value)
(assert (valid$Snap$I64<Bool> operand1_value@709@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@714@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@714@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@714@01)))))))
(push) ; 2
(set-option :timeout 10)
(assert (not (and
  (= operand1_place@707@01 operand2_place@710@01)
  (= operand1_root_address@708@01 operand2_root_address@711@01)
  (= operand1_value@709@01 operand2_value@712@01))))
(check-sat)
; unknown
(pop) ; 2
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@714@01))))
  $Snap.unit))
; [eval] valid$Snap$I64(operand2_value)
(assert (valid$Snap$I64<Bool> operand2_value@712@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@715@01 $Snap)
(assert (= $t@715@01 ($Snap.combine ($Snap.first $t@715@01) ($Snap.second $t@715@01))))
; [eval] compute_address(target_place, target_address)
; [eval] PaddingSize$Tuple$$I64$Bool$$I64$Bool$$()
(assert (=
  ($Snap.second $t@715@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@715@01))
    ($Snap.second ($Snap.second $t@715@01)))))
; [eval] field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(compute_address(target_place, target_address))
; [eval] compute_address(target_place, target_address)
; [eval] Size$I64$()
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> target_place@705@01 target_address@706@01)
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> target_place@705@01 target_address@706@01)))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second $t@715@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@715@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@715@01))))))
; [eval] field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(target_place)
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(result_value)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@715@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@715@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@715@01)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@715@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@715@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@715@01))))))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (= operand1_place@707@01 operand2_place@710@01)
  (= operand1_root_address@708@01 operand2_root_address@711@01)
  (= operand1_value@709@01 operand2_value@712@01))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@715@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@715@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@715@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@715@01))))))
  $Snap.unit))
; [eval] valid$Snap$I64(constructor$Snap$I64$Add_I64(operand1_value, operand2_value)) ==> destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(result_value) == constructor$Snap$I64$Add_I64(operand1_value, operand2_value)
; [eval] valid$Snap$I64(constructor$Snap$I64$Add_I64(operand1_value, operand2_value))
; [eval] constructor$Snap$I64$Add_I64(operand1_value, operand2_value)
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (valid$Snap$I64<Bool> (constructor$Snap$I64$Add_I64<Snap$I64> operand1_value@709@01 operand2_value@712@01)))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (valid$Snap$I64<Bool> (constructor$Snap$I64$Add_I64<Snap$I64> operand1_value@709@01 operand2_value@712@01))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [then-branch: 99 | valid$Snap$I64[Bool](constructor$Snap$I64$Add_I64[Snap$I64](operand1_value@709@01, operand2_value@712@01)) | live]
; [else-branch: 99 | !(valid$Snap$I64[Bool](constructor$Snap$I64$Add_I64[Snap$I64](operand1_value@709@01, operand2_value@712@01))) | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 99 | valid$Snap$I64[Bool](constructor$Snap$I64$Add_I64[Snap$I64](operand1_value@709@01, operand2_value@712@01))]
(assert (valid$Snap$I64<Bool> (constructor$Snap$I64$Add_I64<Snap$I64> operand1_value@709@01 operand2_value@712@01)))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(result_value) == constructor$Snap$I64$Add_I64(operand1_value, operand2_value)
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(result_value)
; [eval] constructor$Snap$I64$Add_I64(operand1_value, operand2_value)
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (valid$Snap$I64<Bool> (constructor$Snap$I64$Add_I64<Snap$I64> operand1_value@709@01 operand2_value@712@01)))
(assert (=>
  (valid$Snap$I64<Bool> (constructor$Snap$I64$Add_I64<Snap$I64> operand1_value@709@01 operand2_value@712@01))
  (=
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> result_value@713@01)
    (constructor$Snap$I64$Add_I64<Snap$I64> operand1_value@709@01 operand2_value@712@01))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@715@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@715@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@715@01))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@715@01)))))))
  $Snap.unit))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(result_value) == constructor$Snap$Bool$(!valid$Snap$I64(constructor$Snap$I64$Add_I64(operand1_value, operand2_value)))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(result_value)
; [eval] constructor$Snap$Bool$(!valid$Snap$I64(constructor$Snap$I64$Add_I64(operand1_value, operand2_value)))
; [eval] !valid$Snap$I64(constructor$Snap$I64$Add_I64(operand1_value, operand2_value))
; [eval] valid$Snap$I64(constructor$Snap$I64$Add_I64(operand1_value, operand2_value))
; [eval] constructor$Snap$I64$Add_I64(operand1_value, operand2_value)
(assert (=
  (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> result_value@713@01)
  (constructor$Snap$Bool$<Snap$Bool> (not
    (valid$Snap$I64<Bool> (constructor$Snap$I64$Add_I64<Snap$I64> operand1_value@709@01 operand2_value@712@01))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@715@01)))))))
  $Snap.unit))
; [eval] MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(compute_address(target_place, target_address)), Size$I64$()) == to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(result_value))
; [eval] MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(compute_address(target_place, target_address)), Size$I64$())
; [eval] field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(compute_address(target_place, target_address))
; [eval] compute_address(target_place, target_address)
; [eval] Size$I64$()
(push) ; 3
(declare-const $k@716@01 $Perm)
(assert ($Perm.isReadVar $k@716@01))
(assert (< $k@716@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@716@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@716@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@715@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> target_place@705@01 target_address@706@01)) (as Size$I64$<Snap$Usize>  Snap$Usize)))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@716@01))
(assert (and
  (< $k@716@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@716@01))
  (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@715@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> target_place@705@01 target_address@706@01)) (as Size$I64$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(result_value))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(result_value)
(assert (=
  (MemoryBlock$bytes ($Snap.first ($Snap.second $t@715@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> target_place@705@01 target_address@706@01)) (as Size$I64$<Snap$Usize>  Snap$Usize))
  (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> result_value@713@01))))
(pop) ; 2
(set-option :timeout 0)
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- copy_place$I64 ----------
(declare-const target_place@717@01 Place)
(declare-const target_root_address@718@01 Address)
(declare-const source_place@719@01 Place)
(declare-const source_root_address@720@01 Address)
(declare-const source_snapshot@721@01 Snap$I64)
(declare-const source_permission_amount@722@01 $Perm)
(declare-const target_place@723@01 Place)
(declare-const target_root_address@724@01 Address)
(declare-const source_place@725@01 Place)
(declare-const source_root_address@726@01 Address)
(declare-const source_snapshot@727@01 Snap$I64)
(declare-const source_permission_amount@728@01 $Perm)
(push) ; 1
(declare-const $t@729@01 $Snap)
(assert (= $t@729@01 ($Snap.combine ($Snap.first $t@729@01) ($Snap.second $t@729@01))))
(assert (= ($Snap.first $t@729@01) $Snap.unit))
; [eval] none < source_permission_amount
(assert (< $Perm.No source_permission_amount@728@01))
(assert (=
  ($Snap.second $t@729@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@729@01))
    ($Snap.second ($Snap.second $t@729@01)))))
; [eval] compute_address(target_place, target_root_address)
; [eval] Size$I64$()
(push) ; 2
(assert (not (or
  (= source_permission_amount@728@01 $Perm.No)
  (< $Perm.No source_permission_amount@728@01))))
(check-sat)
; unsat
(pop) ; 2
; 0.00s
; (get-info :all-statistics)
(assert (<= $Perm.No source_permission_amount@728@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@730@01 $Snap)
(assert (= $t@730@01 ($Snap.combine ($Snap.first $t@730@01) ($Snap.second $t@730@01))))
(push) ; 3
(assert (not (or
  (= source_permission_amount@728@01 $Perm.No)
  (< $Perm.No source_permission_amount@728@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second $t@730@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@730@01))
    ($Snap.second ($Snap.second $t@730@01)))))
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (= source_place@725@01 target_place@723@01)
  (= source_root_address@726@01 target_root_address@724@01))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (= ($Snap.second ($Snap.second $t@730@01)) $Snap.unit))
; [eval] valid$Snap$I64(source_snapshot)
(assert (valid$Snap$I64<Bool> source_snapshot@727@01))
(pop) ; 2
(set-option :timeout 0)
(push) ; 2
; [exec]
; unfold acc(OwnedNonAliased$I64(source_place, source_root_address, source_snapshot), source_permission_amount)
(push) ; 3
(assert (not (< $Perm.No source_permission_amount@728@01)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No source_permission_amount@728@01)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second $t@729@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@729@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@729@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@729@01))) $Snap.unit))
; [eval] valid$Snap$I64(snapshot)
(assert (valid$Snap$I64<Bool> source_snapshot@727@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@729@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@729@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@729@01)))))))
; [eval] compute_address(place, root_address)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> target_place@723@01 target_root_address@724@01)
  (compute_address<Address> source_place@725@01 source_root_address@726@01))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@729@01))))
  $Snap.unit))
; [eval] MemoryBlock$bytes(compute_address(place, root_address), Size$I64$()) == to_bytes$I64(snapshot)
; [eval] MemoryBlock$bytes(compute_address(place, root_address), Size$I64$())
; [eval] compute_address(place, root_address)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 3
(declare-const $k@731@01 $Perm)
(assert ($Perm.isReadVar $k@731@01))
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= source_permission_amount@728@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (< (* $k@731@01 source_permission_amount@728@01) source_permission_amount@728@01))
(assert (<=
  $Perm.No
  (-
    source_permission_amount@728@01
    (* $k@731@01 source_permission_amount@728@01))))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (* $k@731@01 source_permission_amount@728@01))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@729@01)))) (compute_address<Address> source_place@725@01 source_root_address@726@01) (as Size$I64$<Snap$Usize>  Snap$Usize)))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@731@01))
(assert (and
  (<
    (* $k@731@01 source_permission_amount@728@01)
    source_permission_amount@728@01)
  (<=
    $Perm.No
    (-
      source_permission_amount@728@01
      (* $k@731@01 source_permission_amount@728@01)))
  (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@729@01)))) (compute_address<Address> source_place@725@01 source_root_address@726@01) (as Size$I64$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$I64(snapshot)
(assert (=
  (MemoryBlock$bytes ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@729@01)))) (compute_address<Address> source_place@725@01 source_root_address@726@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
  (to_bytes$I64<Bytes> source_snapshot@727@01)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (OwnedNonAliased$I64%trigger ($Snap.second ($Snap.second $t@729@01)) source_place@725@01 source_root_address@726@01 source_snapshot@727@01))
; [exec]
; memory_copy$I64(compute_address(source_place, source_root_address), compute_address(target_place,
;   target_root_address), source_permission_amount)
; [eval] compute_address(source_place, source_root_address)
; [eval] compute_address(target_place, target_root_address)
; [eval] none < permission_amount
; [eval] Size$I64$()
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 3
(assert (not (or
  (= source_permission_amount@728@01 $Perm.No)
  (< $Perm.No source_permission_amount@728@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No source_permission_amount@728@01)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(declare-const $t@732@01 $Snap)
(assert (= $t@732@01 ($Snap.combine ($Snap.first $t@732@01) ($Snap.second $t@732@01))))
; [eval] Size$I64$()
(assert (=
  ($Snap.second $t@732@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@732@01))
    ($Snap.second ($Snap.second $t@732@01)))))
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 3
(assert (not (or
  (= source_permission_amount@728@01 $Perm.No)
  (< $Perm.No source_permission_amount@728@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> target_place@723@01 target_root_address@724@01)
  (compute_address<Address> source_place@725@01 source_root_address@726@01))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second $t@732@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@732@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@732@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@732@01))) $Snap.unit))
; [eval] MemoryBlock$bytes(source_address, Size$I64$()) == old(MemoryBlock$bytes(source_address, Size$I64$()))
; [eval] MemoryBlock$bytes(source_address, Size$I64$())
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 3
(declare-const $k@733@01 $Perm)
(assert ($Perm.isReadVar $k@733@01))
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= source_permission_amount@728@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (< $k@733@01 source_permission_amount@728@01))
(assert (<= $Perm.No (- source_permission_amount@728@01 $k@733@01)))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@733@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@732@01)) (compute_address<Address> source_place@725@01 source_root_address@726@01) (as Size$I64$<Snap$Usize>  Snap$Usize)))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@733@01))
(assert (and
  (< $k@733@01 source_permission_amount@728@01)
  (<= $Perm.No (- source_permission_amount@728@01 $k@733@01))
  (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@732@01)) (compute_address<Address> source_place@725@01 source_root_address@726@01) (as Size$I64$<Snap$Usize>  Snap$Usize))))
; [eval] old(MemoryBlock$bytes(source_address, Size$I64$()))
; [eval] MemoryBlock$bytes(source_address, Size$I64$())
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 3
(declare-const $k@734@01 $Perm)
(assert ($Perm.isReadVar $k@734@01))
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= source_permission_amount@728@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (< $k@734@01 source_permission_amount@728@01))
(assert (<= $Perm.No (- source_permission_amount@728@01 $k@734@01)))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@734@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@734@01))
(assert (and
  (< $k@734@01 source_permission_amount@728@01)
  (<= $Perm.No (- source_permission_amount@728@01 $k@734@01))))
(assert (=
  (MemoryBlock$bytes ($Snap.first ($Snap.second $t@732@01)) (compute_address<Address> source_place@725@01 source_root_address@726@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
  (MemoryBlock$bytes ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@729@01)))) (compute_address<Address> source_place@725@01 source_root_address@726@01) (as Size$I64$<Snap$Usize>  Snap$Usize))))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@732@01))) $Snap.unit))
; [eval] MemoryBlock$bytes(target_address, Size$I64$()) == MemoryBlock$bytes(source_address, Size$I64$())
; [eval] MemoryBlock$bytes(target_address, Size$I64$())
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 3
(declare-const $k@735@01 $Perm)
(assert ($Perm.isReadVar $k@735@01))
(assert (< $k@735@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@735@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@735@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first $t@732@01) (compute_address<Address> target_place@723@01 target_root_address@724@01) (as Size$I64$<Snap$Usize>  Snap$Usize)))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@735@01))
(assert (and
  (< $k@735@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@735@01))
  (MemoryBlock$bytes%precondition ($Snap.first $t@732@01) (compute_address<Address> target_place@723@01 target_root_address@724@01) (as Size$I64$<Snap$Usize>  Snap$Usize))))
; [eval] MemoryBlock$bytes(source_address, Size$I64$())
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 3
(declare-const $k@736@01 $Perm)
(assert ($Perm.isReadVar $k@736@01))
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= source_permission_amount@728@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (< $k@736@01 source_permission_amount@728@01))
(assert (<= $Perm.No (- source_permission_amount@728@01 $k@736@01)))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@736@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@736@01))
(assert (and
  (< $k@736@01 source_permission_amount@728@01)
  (<= $Perm.No (- source_permission_amount@728@01 $k@736@01))))
(assert (=
  (MemoryBlock$bytes ($Snap.first $t@732@01) (compute_address<Address> target_place@723@01 target_root_address@724@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
  (MemoryBlock$bytes ($Snap.first ($Snap.second $t@732@01)) (compute_address<Address> source_place@725@01 source_root_address@726@01) (as Size$I64$<Snap$Usize>  Snap$Usize))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; fold acc(OwnedNonAliased$I64(target_place, target_root_address, source_snapshot), write)
; [eval] valid$Snap$I64(snapshot)
; [eval] compute_address(place, root_address)
; [eval] Size$I64$()
; [eval] MemoryBlock$bytes(compute_address(place, root_address), Size$I64$()) == to_bytes$I64(snapshot)
; [eval] MemoryBlock$bytes(compute_address(place, root_address), Size$I64$())
; [eval] compute_address(place, root_address)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 3
(declare-const $k@737@01 $Perm)
(assert ($Perm.isReadVar $k@737@01))
(assert (< $k@737@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@737@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@737@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@737@01))
(assert (and (< $k@737@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@737@01))))
; [eval] to_bytes$I64(snapshot)
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  (MemoryBlock$bytes ($Snap.first $t@732@01) (compute_address<Address> target_place@723@01 target_root_address@724@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
  (to_bytes$I64<Bytes> source_snapshot@727@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (=
  (MemoryBlock$bytes ($Snap.first $t@732@01) (compute_address<Address> target_place@723@01 target_root_address@724@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
  (to_bytes$I64<Bytes> source_snapshot@727@01)))
(assert (OwnedNonAliased$I64%trigger ($Snap.combine
  $Snap.unit
  ($Snap.combine ($Snap.first $t@732@01) $Snap.unit)) target_place@723@01 target_root_address@724@01 source_snapshot@727@01))
; [exec]
; fold acc(OwnedNonAliased$I64(source_place, source_root_address, source_snapshot), source_permission_amount)
(push) ; 3
(assert (not (< $Perm.No source_permission_amount@728@01)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; [eval] valid$Snap$I64(snapshot)
; [eval] compute_address(place, root_address)
; [eval] Size$I64$()
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No source_permission_amount@728@01)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; [eval] MemoryBlock$bytes(compute_address(place, root_address), Size$I64$()) == to_bytes$I64(snapshot)
; [eval] MemoryBlock$bytes(compute_address(place, root_address), Size$I64$())
; [eval] compute_address(place, root_address)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 3
(declare-const $k@738@01 $Perm)
(assert ($Perm.isReadVar $k@738@01))
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= source_permission_amount@728@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (< (* $k@738@01 source_permission_amount@728@01) source_permission_amount@728@01))
(assert (<=
  $Perm.No
  (-
    source_permission_amount@728@01
    (* $k@738@01 source_permission_amount@728@01))))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (* $k@738@01 source_permission_amount@728@01))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@738@01))
(assert (and
  (<
    (* $k@738@01 source_permission_amount@728@01)
    source_permission_amount@728@01)
  (<=
    $Perm.No
    (-
      source_permission_amount@728@01
      (* $k@738@01 source_permission_amount@728@01)))))
; [eval] to_bytes$I64(snapshot)
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  (MemoryBlock$bytes ($Snap.first ($Snap.second $t@732@01)) (compute_address<Address> source_place@725@01 source_root_address@726@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
  (to_bytes$I64<Bytes> source_snapshot@727@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (=
  (MemoryBlock$bytes ($Snap.first ($Snap.second $t@732@01)) (compute_address<Address> source_place@725@01 source_root_address@726@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
  (to_bytes$I64<Bytes> source_snapshot@727@01)))
(assert (OwnedNonAliased$I64%trigger ($Snap.combine
  $Snap.unit
  ($Snap.combine ($Snap.first ($Snap.second $t@732@01)) $Snap.unit)) source_place@725@01 source_root_address@726@01 source_snapshot@727@01))
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (= target_place@723@01 source_place@725@01)
  (= target_root_address@724@01 source_root_address@726@01))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(assert (not (or
  (= source_permission_amount@728@01 $Perm.No)
  (< $Perm.No source_permission_amount@728@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No source_permission_amount@728@01)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; [eval] valid$Snap$I64(source_snapshot)
(pop) ; 2
(pop) ; 1
; ---------- havoc_memory_block$Bool$$ ----------
(declare-const address@739@01 Address)
(declare-const address@740@01 Address)
(set-option :timeout 0)
(push) ; 1
; [eval] Size$Bool$()
(declare-const $t@741@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
; [eval] Size$Bool$()
(declare-const $t@742@01 $Snap)
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- havoc_memory_block$Tuple$$$$$ ----------
(declare-const address@743@01 Address)
(declare-const address@744@01 Address)
(push) ; 1
; [eval] Size$Tuple$$$$()
(declare-const $t@745@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
; [eval] Size$Tuple$$$$()
(declare-const $t@746@01 $Snap)
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- havoc_memory_block$Tuple$$I64$Bool$$I64$Bool$$$ ----------
(declare-const address@747@01 Address)
(declare-const address@748@01 Address)
(push) ; 1
; [eval] Size$Tuple$$I64$Bool$$I64$Bool$$()
(declare-const $t@749@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
; [eval] Size$Tuple$$I64$Bool$$I64$Bool$$()
(declare-const $t@750@01 $Snap)
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- havoc_owned$I64 ----------
(declare-const place@751@01 Place)
(declare-const root_address@752@01 Address)
(declare-const old_snapshot@753@01 Snap$I64)
(declare-const fresh_snapshot@754@01 Snap$I64)
(declare-const place@755@01 Place)
(declare-const root_address@756@01 Address)
(declare-const old_snapshot@757@01 Snap$I64)
(declare-const fresh_snapshot@758@01 Snap$I64)
(push) ; 1
(declare-const $t@759@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@760@01 $Snap)
(assert (= $t@760@01 ($Snap.combine ($Snap.first $t@760@01) ($Snap.second $t@760@01))))
(assert (= ($Snap.second $t@760@01) $Snap.unit))
; [eval] valid$Snap$I64(fresh_snapshot)
(assert (valid$Snap$I64<Bool> fresh_snapshot@758@01))
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- into_memory_block$Bool ----------
(declare-const place@761@01 Place)
(declare-const root_address@762@01 Address)
(declare-const snapshot@763@01 Snap$Bool)
(declare-const place@764@01 Place)
(declare-const root_address@765@01 Address)
(declare-const snapshot@766@01 Snap$Bool)
(push) ; 1
(declare-const $t@767@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
; [eval] compute_address(place, root_address)
; [eval] Size$Bool$()
(declare-const $t@768@01 $Snap)
(pop) ; 2
(push) ; 2
; [exec]
; unfold acc(OwnedNonAliased$Bool(place, root_address, snapshot), write)
(assert (= $t@767@01 ($Snap.combine ($Snap.first $t@767@01) ($Snap.second $t@767@01))))
(assert (= ($Snap.first $t@767@01) $Snap.unit))
; [eval] valid$Snap$Bool(snapshot)
(assert (valid$Snap$Bool<Bool> snapshot@766@01))
(assert (=
  ($Snap.second $t@767@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@767@01))
    ($Snap.second ($Snap.second $t@767@01)))))
; [eval] compute_address(place, root_address)
; [eval] Size$Bool$()
(assert (= ($Snap.second ($Snap.second $t@767@01)) $Snap.unit))
; [eval] MemoryBlock$bytes(compute_address(place, root_address), Size$Bool$()) == to_bytes$Bool(snapshot)
; [eval] MemoryBlock$bytes(compute_address(place, root_address), Size$Bool$())
; [eval] compute_address(place, root_address)
; [eval] Size$Bool$()
(push) ; 3
(declare-const $k@769@01 $Perm)
(assert ($Perm.isReadVar $k@769@01))
(assert (< $k@769@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@769@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@769@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@767@01)) (compute_address<Address> place@764@01 root_address@765@01) (as Size$Bool$<Snap$Usize>  Snap$Usize)))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@769@01))
(assert (and
  (< $k@769@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@769@01))
  (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@767@01)) (compute_address<Address> place@764@01 root_address@765@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$Bool(snapshot)
(assert (=
  (MemoryBlock$bytes ($Snap.first ($Snap.second $t@767@01)) (compute_address<Address> place@764@01 root_address@765@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
  (to_bytes$Bool<Bytes> snapshot@766@01)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (OwnedNonAliased$Bool%trigger $t@767@01 place@764@01 root_address@765@01 snapshot@766@01))
; [eval] compute_address(place, root_address)
; [eval] Size$Bool$()
(pop) ; 2
(pop) ; 1
; ---------- into_memory_block$I64 ----------
(declare-const place@770@01 Place)
(declare-const root_address@771@01 Address)
(declare-const snapshot@772@01 Snap$I64)
(declare-const place@773@01 Place)
(declare-const root_address@774@01 Address)
(declare-const snapshot@775@01 Snap$I64)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@776@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
; [eval] compute_address(place, root_address)
; [eval] Size$I64$()
(declare-const $t@777@01 $Snap)
(pop) ; 2
(push) ; 2
; [exec]
; unfold acc(OwnedNonAliased$I64(place, root_address, snapshot), write)
(assert (= $t@776@01 ($Snap.combine ($Snap.first $t@776@01) ($Snap.second $t@776@01))))
(assert (= ($Snap.first $t@776@01) $Snap.unit))
; [eval] valid$Snap$I64(snapshot)
(assert (valid$Snap$I64<Bool> snapshot@775@01))
(assert (=
  ($Snap.second $t@776@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@776@01))
    ($Snap.second ($Snap.second $t@776@01)))))
; [eval] compute_address(place, root_address)
; [eval] Size$I64$()
(assert (= ($Snap.second ($Snap.second $t@776@01)) $Snap.unit))
; [eval] MemoryBlock$bytes(compute_address(place, root_address), Size$I64$()) == to_bytes$I64(snapshot)
; [eval] MemoryBlock$bytes(compute_address(place, root_address), Size$I64$())
; [eval] compute_address(place, root_address)
; [eval] Size$I64$()
(push) ; 3
(declare-const $k@778@01 $Perm)
(assert ($Perm.isReadVar $k@778@01))
(assert (< $k@778@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@778@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@778@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@776@01)) (compute_address<Address> place@773@01 root_address@774@01) (as Size$I64$<Snap$Usize>  Snap$Usize)))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@778@01))
(assert (and
  (< $k@778@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@778@01))
  (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@776@01)) (compute_address<Address> place@773@01 root_address@774@01) (as Size$I64$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$I64(snapshot)
(assert (=
  (MemoryBlock$bytes ($Snap.first ($Snap.second $t@776@01)) (compute_address<Address> place@773@01 root_address@774@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
  (to_bytes$I64<Bytes> snapshot@775@01)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (OwnedNonAliased$I64%trigger $t@776@01 place@773@01 root_address@774@01 snapshot@775@01))
; [eval] compute_address(place, root_address)
; [eval] Size$I64$()
(pop) ; 2
(pop) ; 1
; ---------- into_memory_block$Tuple$$$ ----------
(declare-const place@779@01 Place)
(declare-const root_address@780@01 Address)
(declare-const snapshot@781@01 Snap$Tuple$$$)
(declare-const place@782@01 Place)
(declare-const root_address@783@01 Address)
(declare-const snapshot@784@01 Snap$Tuple$$$)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@785@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
; [eval] compute_address(place, root_address)
; [eval] Size$Tuple$$$$()
(declare-const $t@786@01 $Snap)
(pop) ; 2
(push) ; 2
; [exec]
; unfold acc(OwnedNonAliased$Tuple$$$(place, root_address, snapshot), write)
(assert (= $t@785@01 ($Snap.combine ($Snap.first $t@785@01) ($Snap.second $t@785@01))))
(assert (= ($Snap.first $t@785@01) $Snap.unit))
; [eval] valid$Snap$Tuple$$$(snapshot)
(assert (valid$Snap$Tuple$$$<Bool> snapshot@784@01))
; [eval] compute_address(place, root_address)
; [eval] PaddingSize$Tuple$$$$()
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (OwnedNonAliased$Tuple$$$%trigger $t@785@01 place@782@01 root_address@783@01 snapshot@784@01))
; [exec]
; memory_block_join$Tuple$$$(compute_address(place, root_address), write)
; [eval] compute_address(place, root_address)
; [eval] none < permission_amount
; [eval] PaddingSize$Tuple$$$$()
(declare-const $t@787@01 $Snap)
(assert (= $t@787@01 ($Snap.combine ($Snap.first $t@787@01) ($Snap.second $t@787@01))))
; [eval] Size$Tuple$$$$()
(assert (= ($Snap.second $t@787@01) $Snap.unit))
; [eval] (forall snapshot: Snap$Tuple$$$ :: { to_bytes$Tuple$$$(snapshot) } MemoryBlock$bytes(address, Size$Tuple$$$$()) == to_bytes$Tuple$$$(snapshot))
(declare-const snapshot@788@01 Snap$Tuple$$$)
(set-option :timeout 0)
(push) ; 3
; [eval] MemoryBlock$bytes(address, Size$Tuple$$$$()) == to_bytes$Tuple$$$(snapshot)
; [eval] MemoryBlock$bytes(address, Size$Tuple$$$$())
; [eval] Size$Tuple$$$$()
(push) ; 4
(declare-const $k@789@01 $Perm)
(assert ($Perm.isReadVar $k@789@01))
(assert (< $k@789@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@789@01)))
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@789@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first $t@787@01) (compute_address<Address> place@782@01 root_address@783@01) (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))
(pop) ; 4
; Joined path conditions
(assert ($Perm.isReadVar $k@789@01))
(assert (and
  (< $k@789@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@789@01))
  (MemoryBlock$bytes%precondition ($Snap.first $t@787@01) (compute_address<Address> place@782@01 root_address@783@01) (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$Tuple$$$(snapshot)
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert ($Perm.isReadVar $k@789@01))
(assert (< $k@789@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@789@01)))
(assert (MemoryBlock$bytes%precondition ($Snap.first $t@787@01) (compute_address<Address> place@782@01 root_address@783@01) (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((snapshot@788@01 Snap$Tuple$$$)) (!
  (=
    (MemoryBlock$bytes ($Snap.first $t@787@01) (compute_address<Address> place@782@01 root_address@783@01) (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize))
    (to_bytes$Tuple$$$<Bytes> snapshot@788@01))
  :pattern ((to_bytes$Tuple$$$<Bytes> snapshot@788@01))
  :qid |prog.l2558|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] compute_address(place, root_address)
; [eval] Size$Tuple$$$$()
(pop) ; 2
(pop) ; 1
; ---------- lft_tok_sep_return$2 ----------
(declare-const lft@790@01 Lifetime)
(declare-const lft_1@791@01 Lifetime)
(declare-const lft_2@792@01 Lifetime)
(declare-const rd_perm@793@01 $Perm)
(declare-const lft@794@01 Lifetime)
(declare-const lft_1@795@01 Lifetime)
(declare-const lft_2@796@01 Lifetime)
(declare-const rd_perm@797@01 $Perm)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@798@01 $Snap)
(assert (= $t@798@01 ($Snap.combine ($Snap.first $t@798@01) ($Snap.second $t@798@01))))
(assert (= ($Snap.first $t@798@01) $Snap.unit))
; [eval] none < rd_perm
(assert (< $Perm.No rd_perm@797@01))
(assert (=
  ($Snap.second $t@798@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@798@01))
    ($Snap.second ($Snap.second $t@798@01)))))
(push) ; 2
(assert (not (or (= rd_perm@797@01 $Perm.No) (< $Perm.No rd_perm@797@01))))
(check-sat)
; unsat
(pop) ; 2
; 0.00s
; (get-info :all-statistics)
(assert (<= $Perm.No rd_perm@797@01))
(assert (= ($Snap.second ($Snap.second $t@798@01)) $Snap.unit))
; [eval] lft == intersect(Set(lft_1, lft_2))
; [eval] intersect(Set(lft_1, lft_2))
; [eval] Set(lft_1, lft_2)
(assert (=
  lft@794@01
  (intersect<Lifetime> (Set_unionone (Set_singleton lft_1@795@01) lft_2@796@01))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@799@01 $Snap)
(assert (= $t@799@01 ($Snap.combine ($Snap.first $t@799@01) ($Snap.second $t@799@01))))
(push) ; 3
(assert (not (or (= rd_perm@797@01 $Perm.No) (< $Perm.No rd_perm@797@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (or (= rd_perm@797@01 $Perm.No) (< $Perm.No rd_perm@797@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(push) ; 3
(set-option :timeout 10)
(assert (not (= lft_1@795@01 lft_2@796@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(pop) ; 2
(set-option :timeout 0)
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- lft_tok_sep_take$2 ----------
(declare-const lft_1@800@01 Lifetime)
(declare-const lft_2@801@01 Lifetime)
(declare-const rd_perm@802@01 $Perm)
(declare-const lft@803@01 Lifetime)
(declare-const lft_1@804@01 Lifetime)
(declare-const lft_2@805@01 Lifetime)
(declare-const rd_perm@806@01 $Perm)
(declare-const lft@807@01 Lifetime)
(push) ; 1
(declare-const $t@808@01 $Snap)
(assert (= $t@808@01 ($Snap.combine ($Snap.first $t@808@01) ($Snap.second $t@808@01))))
(assert (= ($Snap.first $t@808@01) $Snap.unit))
; [eval] none < rd_perm
(assert (< $Perm.No rd_perm@806@01))
(assert (=
  ($Snap.second $t@808@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@808@01))
    ($Snap.second ($Snap.second $t@808@01)))))
(push) ; 2
(assert (not (or (= rd_perm@806@01 $Perm.No) (< $Perm.No rd_perm@806@01))))
(check-sat)
; unsat
(pop) ; 2
; 0.00s
; (get-info :all-statistics)
(assert (<= $Perm.No rd_perm@806@01))
(push) ; 2
(assert (not (or (= rd_perm@806@01 $Perm.No) (< $Perm.No rd_perm@806@01))))
(check-sat)
; unsat
(pop) ; 2
; 0.00s
; (get-info :all-statistics)
(push) ; 2
(set-option :timeout 10)
(assert (not (= lft_1@804@01 lft_2@805@01)))
(check-sat)
; unknown
(pop) ; 2
; 0.00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@809@01 $Snap)
(assert (= $t@809@01 ($Snap.combine ($Snap.first $t@809@01) ($Snap.second $t@809@01))))
(push) ; 3
(assert (not (or (= rd_perm@806@01 $Perm.No) (< $Perm.No rd_perm@806@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (= ($Snap.second $t@809@01) $Snap.unit))
; [eval] lft == intersect(Set(lft_1, lft_2))
; [eval] intersect(Set(lft_1, lft_2))
; [eval] Set(lft_1, lft_2)
(assert (=
  lft@807@01
  (intersect<Lifetime> (Set_unionone (Set_singleton lft_1@804@01) lft_2@805@01))))
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- memory_block_join$Tuple$$$ ----------
(declare-const address@810@01 Address)
(declare-const permission_amount@811@01 $Perm)
(declare-const address@812@01 Address)
(declare-const permission_amount@813@01 $Perm)
(push) ; 1
(declare-const $t@814@01 $Snap)
(assert (= $t@814@01 ($Snap.combine ($Snap.first $t@814@01) ($Snap.second $t@814@01))))
(assert (= ($Snap.first $t@814@01) $Snap.unit))
; [eval] none < permission_amount
(assert (< $Perm.No permission_amount@813@01))
; [eval] PaddingSize$Tuple$$$$()
(push) ; 2
(assert (not (or (= permission_amount@813@01 $Perm.No) (< $Perm.No permission_amount@813@01))))
(check-sat)
; unsat
(pop) ; 2
; 0.00s
; (get-info :all-statistics)
(assert (<= $Perm.No permission_amount@813@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@815@01 $Snap)
(assert (= $t@815@01 ($Snap.combine ($Snap.first $t@815@01) ($Snap.second $t@815@01))))
; [eval] Size$Tuple$$$$()
(assert (= ($Snap.second $t@815@01) $Snap.unit))
; [eval] (forall snapshot: Snap$Tuple$$$ :: { to_bytes$Tuple$$$(snapshot) } MemoryBlock$bytes(address, Size$Tuple$$$$()) == to_bytes$Tuple$$$(snapshot))
(declare-const snapshot@816@01 Snap$Tuple$$$)
(push) ; 3
; [eval] MemoryBlock$bytes(address, Size$Tuple$$$$()) == to_bytes$Tuple$$$(snapshot)
; [eval] MemoryBlock$bytes(address, Size$Tuple$$$$())
; [eval] Size$Tuple$$$$()
(push) ; 4
(declare-const $k@817@01 $Perm)
(assert ($Perm.isReadVar $k@817@01))
(assert (< $k@817@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@817@01)))
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@817@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first $t@815@01) address@812@01 (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))
(pop) ; 4
; Joined path conditions
(assert ($Perm.isReadVar $k@817@01))
(assert (and
  (< $k@817@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@817@01))
  (MemoryBlock$bytes%precondition ($Snap.first $t@815@01) address@812@01 (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$Tuple$$$(snapshot)
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert ($Perm.isReadVar $k@817@01))
(assert (< $k@817@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@817@01)))
(assert (MemoryBlock$bytes%precondition ($Snap.first $t@815@01) address@812@01 (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((snapshot@816@01 Snap$Tuple$$$)) (!
  (=
    (MemoryBlock$bytes ($Snap.first $t@815@01) address@812@01 (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize))
    (to_bytes$Tuple$$$<Bytes> snapshot@816@01))
  :pattern ((to_bytes$Tuple$$$<Bytes> snapshot@816@01))
  :qid |prog.l2558|)))
(pop) ; 2
(set-option :timeout 0)
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- memory_block_join$Tuple$$I64$Bool$$I64$Bool$ ----------
(declare-const address@818@01 Address)
(declare-const permission_amount@819@01 $Perm)
(declare-const address@820@01 Address)
(declare-const permission_amount@821@01 $Perm)
(push) ; 1
(declare-const $t@822@01 $Snap)
(assert (= $t@822@01 ($Snap.combine ($Snap.first $t@822@01) ($Snap.second $t@822@01))))
(assert (= ($Snap.first $t@822@01) $Snap.unit))
; [eval] none < permission_amount
(assert (< $Perm.No permission_amount@821@01))
(assert (=
  ($Snap.second $t@822@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@822@01))
    ($Snap.second ($Snap.second $t@822@01)))))
; [eval] PaddingSize$Tuple$$I64$Bool$$I64$Bool$$()
(push) ; 2
(assert (not (or (= permission_amount@821@01 $Perm.No) (< $Perm.No permission_amount@821@01))))
(check-sat)
; unsat
(pop) ; 2
; 0.00s
; (get-info :all-statistics)
(assert (<= $Perm.No permission_amount@821@01))
(assert (=
  ($Snap.second ($Snap.second $t@822@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@822@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@822@01))))))
; [eval] field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address)
; [eval] Size$I64$()
(push) ; 2
(assert (not (or (= permission_amount@821@01 $Perm.No) (< $Perm.No permission_amount@821@01))))
(check-sat)
; unsat
(pop) ; 2
; 0.00s
; (get-info :all-statistics)
(push) ; 2
(set-option :timeout 10)
(assert (not (and
  (=
    address@820@01
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@820@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 2
; 0.00s
; (get-info :all-statistics)
; [eval] field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address)
; [eval] Size$Bool$()
(set-option :timeout 0)
(push) ; 2
(assert (not (or (= permission_amount@821@01 $Perm.No) (< $Perm.No permission_amount@821@01))))
(check-sat)
; unsat
(pop) ; 2
; 0.00s
; (get-info :all-statistics)
(push) ; 2
(set-option :timeout 10)
(assert (not (and
  (=
    address@820@01
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> address@820@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 2
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (and
  (=
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@820@01)
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> address@820@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 2
; 0.00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@823@01 $Snap)
(assert (= $t@823@01 ($Snap.combine ($Snap.first $t@823@01) ($Snap.second $t@823@01))))
; [eval] Size$Tuple$$I64$Bool$$I64$Bool$$()
(assert (= ($Snap.second $t@823@01) $Snap.unit))
; [eval] (forall snapshot: Snap$Tuple$$I64$Bool$$I64$Bool$ :: { to_bytes$Tuple$$I64$Bool$$I64$Bool$(snapshot) } old(MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address), Size$I64$()) == to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot))) && old(MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address), Size$Bool$()) == to_bytes$Bool(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot))) ==> MemoryBlock$bytes(address, Size$Tuple$$I64$Bool$$I64$Bool$$()) == to_bytes$Tuple$$I64$Bool$$I64$Bool$(snapshot))
(declare-const snapshot@824@01 Snap$Tuple$$I64$Bool$$I64$Bool$)
(push) ; 3
; [eval] old(MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address), Size$I64$()) == to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot))) && old(MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address), Size$Bool$()) == to_bytes$Bool(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot))) ==> MemoryBlock$bytes(address, Size$Tuple$$I64$Bool$$I64$Bool$$()) == to_bytes$Tuple$$I64$Bool$$I64$Bool$(snapshot)
; [eval] old(MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address), Size$I64$()) == to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot))) && old(MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address), Size$Bool$()) == to_bytes$Bool(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot)))
; [eval] old(MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address), Size$I64$()) == to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot)))
; [eval] MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address), Size$I64$()) == to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot))
; [eval] MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address), Size$I64$())
; [eval] field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address)
; [eval] Size$I64$()
(push) ; 4
(declare-const $k@825@01 $Perm)
(assert ($Perm.isReadVar $k@825@01))
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= permission_amount@821@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (< $k@825@01 permission_amount@821@01))
(assert (<= $Perm.No (- permission_amount@821@01 $k@825@01)))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@825@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second ($Snap.second $t@822@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@820@01) (as Size$I64$<Snap$Usize>  Snap$Usize)))
(pop) ; 4
; Joined path conditions
(assert ($Perm.isReadVar $k@825@01))
(assert (and
  (< $k@825@01 permission_amount@821@01)
  (<= $Perm.No (- permission_amount@821@01 $k@825@01))
  (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second ($Snap.second $t@822@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@820@01) (as Size$I64$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot)
(set-option :timeout 0)
(push) ; 4
; [then-branch: 100 | MemoryBlock$bytes(First:(Second:(Second:($t@822@01))), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](address@820@01), Size$I64$[Snap$Usize]) == to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@824@01)) | live]
; [else-branch: 100 | MemoryBlock$bytes(First:(Second:(Second:($t@822@01))), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](address@820@01), Size$I64$[Snap$Usize]) != to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@824@01)) | live]
(push) ; 5
; [then-branch: 100 | MemoryBlock$bytes(First:(Second:(Second:($t@822@01))), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](address@820@01), Size$I64$[Snap$Usize]) == to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@824@01))]
(assert (=
  (MemoryBlock$bytes ($Snap.first ($Snap.second ($Snap.second $t@822@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@820@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
  (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@824@01))))
; [eval] old(MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address), Size$Bool$()) == to_bytes$Bool(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot)))
; [eval] MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address), Size$Bool$()) == to_bytes$Bool(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot))
; [eval] MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address), Size$Bool$())
; [eval] field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address)
; [eval] Size$Bool$()
(push) ; 6
(declare-const $k@826@01 $Perm)
(assert ($Perm.isReadVar $k@826@01))
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= permission_amount@821@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (< $k@826@01 permission_amount@821@01))
(assert (<= $Perm.No (- permission_amount@821@01 $k@826@01)))
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.No $k@826@01)))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.second ($Snap.second ($Snap.second $t@822@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> address@820@01) (as Size$Bool$<Snap$Usize>  Snap$Usize)))
(pop) ; 6
; Joined path conditions
(assert ($Perm.isReadVar $k@826@01))
(assert (and
  (< $k@826@01 permission_amount@821@01)
  (<= $Perm.No (- permission_amount@821@01 $k@826@01))
  (MemoryBlock$bytes%precondition ($Snap.second ($Snap.second ($Snap.second $t@822@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> address@820@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$Bool(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot)
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 100 | MemoryBlock$bytes(First:(Second:(Second:($t@822@01))), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](address@820@01), Size$I64$[Snap$Usize]) != to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@824@01))]
(assert (not
  (=
    (MemoryBlock$bytes ($Snap.first ($Snap.second ($Snap.second $t@822@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@820@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
    (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@824@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert ($Perm.isReadVar $k@826@01))
(assert (=>
  (=
    (MemoryBlock$bytes ($Snap.first ($Snap.second ($Snap.second $t@822@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@820@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
    (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@824@01)))
  (and
    (=
      (MemoryBlock$bytes ($Snap.first ($Snap.second ($Snap.second $t@822@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@820@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
      (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@824@01)))
    (< $k@826@01 permission_amount@821@01)
    (<= $Perm.No (- permission_amount@821@01 $k@826@01))
    (MemoryBlock$bytes%precondition ($Snap.second ($Snap.second ($Snap.second $t@822@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> address@820@01) (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
; Joined path conditions
(assert (or
  (not
    (=
      (MemoryBlock$bytes ($Snap.first ($Snap.second ($Snap.second $t@822@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@820@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
      (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@824@01))))
  (=
    (MemoryBlock$bytes ($Snap.first ($Snap.second ($Snap.second $t@822@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@820@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
    (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@824@01)))))
(push) ; 4
; [then-branch: 101 | MemoryBlock$bytes(Second:(Second:(Second:($t@822@01))), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Address](address@820@01), Size$Bool$[Snap$Usize]) == to_bytes$Bool[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](snapshot@824@01)) && MemoryBlock$bytes(First:(Second:(Second:($t@822@01))), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](address@820@01), Size$I64$[Snap$Usize]) == to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@824@01)) | live]
; [else-branch: 101 | !(MemoryBlock$bytes(Second:(Second:(Second:($t@822@01))), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Address](address@820@01), Size$Bool$[Snap$Usize]) == to_bytes$Bool[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](snapshot@824@01)) && MemoryBlock$bytes(First:(Second:(Second:($t@822@01))), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](address@820@01), Size$I64$[Snap$Usize]) == to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@824@01))) | live]
(push) ; 5
; [then-branch: 101 | MemoryBlock$bytes(Second:(Second:(Second:($t@822@01))), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Address](address@820@01), Size$Bool$[Snap$Usize]) == to_bytes$Bool[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](snapshot@824@01)) && MemoryBlock$bytes(First:(Second:(Second:($t@822@01))), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](address@820@01), Size$I64$[Snap$Usize]) == to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@824@01))]
(assert (and
  (=
    (MemoryBlock$bytes ($Snap.second ($Snap.second ($Snap.second $t@822@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> address@820@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
    (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@824@01)))
  (=
    (MemoryBlock$bytes ($Snap.first ($Snap.second ($Snap.second $t@822@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@820@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
    (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@824@01)))))
; [eval] MemoryBlock$bytes(address, Size$Tuple$$I64$Bool$$I64$Bool$$()) == to_bytes$Tuple$$I64$Bool$$I64$Bool$(snapshot)
; [eval] MemoryBlock$bytes(address, Size$Tuple$$I64$Bool$$I64$Bool$$())
; [eval] Size$Tuple$$I64$Bool$$I64$Bool$$()
(push) ; 6
(declare-const $k@827@01 $Perm)
(assert ($Perm.isReadVar $k@827@01))
(assert (< $k@827@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@827@01)))
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.No $k@827@01)))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first $t@823@01) address@820@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))
(pop) ; 6
; Joined path conditions
(assert ($Perm.isReadVar $k@827@01))
(assert (and
  (< $k@827@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@827@01))
  (MemoryBlock$bytes%precondition ($Snap.first $t@823@01) address@820@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$Tuple$$I64$Bool$$I64$Bool$(snapshot)
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 101 | !(MemoryBlock$bytes(Second:(Second:(Second:($t@822@01))), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Address](address@820@01), Size$Bool$[Snap$Usize]) == to_bytes$Bool[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](snapshot@824@01)) && MemoryBlock$bytes(First:(Second:(Second:($t@822@01))), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](address@820@01), Size$I64$[Snap$Usize]) == to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@824@01)))]
(assert (not
  (and
    (=
      (MemoryBlock$bytes ($Snap.second ($Snap.second ($Snap.second $t@822@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> address@820@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
      (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@824@01)))
    (=
      (MemoryBlock$bytes ($Snap.first ($Snap.second ($Snap.second $t@822@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@820@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
      (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@824@01))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert ($Perm.isReadVar $k@827@01))
(assert (=>
  (and
    (=
      (MemoryBlock$bytes ($Snap.second ($Snap.second ($Snap.second $t@822@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> address@820@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
      (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@824@01)))
    (=
      (MemoryBlock$bytes ($Snap.first ($Snap.second ($Snap.second $t@822@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@820@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
      (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@824@01))))
  (and
    (=
      (MemoryBlock$bytes ($Snap.second ($Snap.second ($Snap.second $t@822@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> address@820@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
      (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@824@01)))
    (=
      (MemoryBlock$bytes ($Snap.first ($Snap.second ($Snap.second $t@822@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@820@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
      (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@824@01)))
    (< $k@827@01 $Perm.Write)
    (<= $Perm.No (- $Perm.Write $k@827@01))
    (MemoryBlock$bytes%precondition ($Snap.first $t@823@01) address@820@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
; Joined path conditions
(assert (or
  (not
    (and
      (=
        (MemoryBlock$bytes ($Snap.second ($Snap.second ($Snap.second $t@822@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> address@820@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
        (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@824@01)))
      (=
        (MemoryBlock$bytes ($Snap.first ($Snap.second ($Snap.second $t@822@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@820@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
        (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@824@01)))))
  (and
    (=
      (MemoryBlock$bytes ($Snap.second ($Snap.second ($Snap.second $t@822@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> address@820@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
      (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@824@01)))
    (=
      (MemoryBlock$bytes ($Snap.first ($Snap.second ($Snap.second $t@822@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@820@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
      (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@824@01))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert ($Perm.isReadVar $k@825@01))
(assert ($Perm.isReadVar $k@826@01))
(assert ($Perm.isReadVar $k@827@01))
(assert (< $k@825@01 permission_amount@821@01))
(assert (<= $Perm.No (- permission_amount@821@01 $k@825@01)))
(assert (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second ($Snap.second $t@822@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@820@01) (as Size$I64$<Snap$Usize>  Snap$Usize)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((snapshot@824@01 Snap$Tuple$$I64$Bool$$I64$Bool$)) (!
  (and
    (=>
      (=
        (MemoryBlock$bytes ($Snap.first ($Snap.second ($Snap.second $t@822@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@820@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
        (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@824@01)))
      (and
        (=
          (MemoryBlock$bytes ($Snap.first ($Snap.second ($Snap.second $t@822@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@820@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
          (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@824@01)))
        (< $k@826@01 permission_amount@821@01)
        (<= $Perm.No (- permission_amount@821@01 $k@826@01))
        (MemoryBlock$bytes%precondition ($Snap.second ($Snap.second ($Snap.second $t@822@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> address@820@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))))
    (or
      (not
        (=
          (MemoryBlock$bytes ($Snap.first ($Snap.second ($Snap.second $t@822@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@820@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
          (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@824@01))))
      (=
        (MemoryBlock$bytes ($Snap.first ($Snap.second ($Snap.second $t@822@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@820@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
        (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@824@01))))
    (=>
      (and
        (=
          (MemoryBlock$bytes ($Snap.second ($Snap.second ($Snap.second $t@822@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> address@820@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
          (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@824@01)))
        (=
          (MemoryBlock$bytes ($Snap.first ($Snap.second ($Snap.second $t@822@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@820@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
          (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@824@01))))
      (and
        (=
          (MemoryBlock$bytes ($Snap.second ($Snap.second ($Snap.second $t@822@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> address@820@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
          (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@824@01)))
        (=
          (MemoryBlock$bytes ($Snap.first ($Snap.second ($Snap.second $t@822@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@820@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
          (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@824@01)))
        (< $k@827@01 $Perm.Write)
        (<= $Perm.No (- $Perm.Write $k@827@01))
        (MemoryBlock$bytes%precondition ($Snap.first $t@823@01) address@820@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize))))
    (or
      (not
        (and
          (=
            (MemoryBlock$bytes ($Snap.second ($Snap.second ($Snap.second $t@822@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> address@820@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
            (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@824@01)))
          (=
            (MemoryBlock$bytes ($Snap.first ($Snap.second ($Snap.second $t@822@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@820@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
            (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@824@01)))))
      (and
        (=
          (MemoryBlock$bytes ($Snap.second ($Snap.second ($Snap.second $t@822@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> address@820@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
          (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@824@01)))
        (=
          (MemoryBlock$bytes ($Snap.first ($Snap.second ($Snap.second $t@822@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@820@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
          (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@824@01))))))
  :pattern ((to_bytes$Tuple$$I64$Bool$$I64$Bool$<Bytes> snapshot@824@01))
  :qid |prog.l2572-aux|)))
(assert (forall ((snapshot@824@01 Snap$Tuple$$I64$Bool$$I64$Bool$)) (!
  (=>
    (and
      (=
        (MemoryBlock$bytes ($Snap.second ($Snap.second ($Snap.second $t@822@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> address@820@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
        (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@824@01)))
      (=
        (MemoryBlock$bytes ($Snap.first ($Snap.second ($Snap.second $t@822@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@820@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
        (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@824@01))))
    (=
      (MemoryBlock$bytes ($Snap.first $t@823@01) address@820@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize))
      (to_bytes$Tuple$$I64$Bool$$I64$Bool$<Bytes> snapshot@824@01)))
  :pattern ((to_bytes$Tuple$$I64$Bool$$I64$Bool$<Bytes> snapshot@824@01))
  :qid |prog.l2572|)))
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- memory_block_split$Tuple$$$ ----------
(declare-const address@828@01 Address)
(declare-const permission_amount@829@01 $Perm)
(declare-const address@830@01 Address)
(declare-const permission_amount@831@01 $Perm)
(push) ; 1
(declare-const $t@832@01 $Snap)
(assert (= $t@832@01 ($Snap.combine ($Snap.first $t@832@01) ($Snap.second $t@832@01))))
(assert (= ($Snap.first $t@832@01) $Snap.unit))
; [eval] none < permission_amount
(assert (< $Perm.No permission_amount@831@01))
; [eval] Size$Tuple$$$$()
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@833@01 $Snap)
(assert (= $t@833@01 ($Snap.combine ($Snap.first $t@833@01) ($Snap.second $t@833@01))))
; [eval] PaddingSize$Tuple$$$$()
(push) ; 3
(assert (not (or (= permission_amount@831@01 $Perm.No) (< $Perm.No permission_amount@831@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (<= $Perm.No permission_amount@831@01))
(assert (= ($Snap.second $t@833@01) $Snap.unit))
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- memory_block_split$Tuple$$I64$Bool$$I64$Bool$ ----------
(declare-const address@834@01 Address)
(declare-const permission_amount@835@01 $Perm)
(declare-const address@836@01 Address)
(declare-const permission_amount@837@01 $Perm)
(push) ; 1
(declare-const $t@838@01 $Snap)
(assert (= $t@838@01 ($Snap.combine ($Snap.first $t@838@01) ($Snap.second $t@838@01))))
(assert (= ($Snap.first $t@838@01) $Snap.unit))
; [eval] none < permission_amount
(assert (< $Perm.No permission_amount@837@01))
; [eval] Size$Tuple$$I64$Bool$$I64$Bool$$()
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@839@01 $Snap)
(assert (= $t@839@01 ($Snap.combine ($Snap.first $t@839@01) ($Snap.second $t@839@01))))
; [eval] PaddingSize$Tuple$$I64$Bool$$I64$Bool$$()
(push) ; 3
(assert (not (or (= permission_amount@837@01 $Perm.No) (< $Perm.No permission_amount@837@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (<= $Perm.No permission_amount@837@01))
(assert (=
  ($Snap.second $t@839@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@839@01))
    ($Snap.second ($Snap.second $t@839@01)))))
; [eval] field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address)
; [eval] Size$I64$()
(push) ; 3
(assert (not (or (= permission_amount@837@01 $Perm.No) (< $Perm.No permission_amount@837@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (=
    address@836@01
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@836@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second $t@839@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@839@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@839@01))))))
; [eval] field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address)
; [eval] Size$Bool$()
(set-option :timeout 0)
(push) ; 3
(assert (not (or (= permission_amount@837@01 $Perm.No) (< $Perm.No permission_amount@837@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (=
    address@836@01
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> address@836@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (=
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@836@01)
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> address@836@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@839@01))) $Snap.unit))
; [eval] (forall snapshot: Snap$Tuple$$I64$Bool$$I64$Bool$ :: { to_bytes$Tuple$$I64$Bool$$I64$Bool$(snapshot) } old(MemoryBlock$bytes(address, Size$Tuple$$I64$Bool$$I64$Bool$$())) == to_bytes$Tuple$$I64$Bool$$I64$Bool$(snapshot) ==> MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address), Size$I64$()) == to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot)) && MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address), Size$Bool$()) == to_bytes$Bool(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot)))
(declare-const snapshot@840@01 Snap$Tuple$$I64$Bool$$I64$Bool$)
(set-option :timeout 0)
(push) ; 3
; [eval] old(MemoryBlock$bytes(address, Size$Tuple$$I64$Bool$$I64$Bool$$())) == to_bytes$Tuple$$I64$Bool$$I64$Bool$(snapshot) ==> MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address), Size$I64$()) == to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot)) && MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address), Size$Bool$()) == to_bytes$Bool(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot))
; [eval] old(MemoryBlock$bytes(address, Size$Tuple$$I64$Bool$$I64$Bool$$())) == to_bytes$Tuple$$I64$Bool$$I64$Bool$(snapshot)
; [eval] old(MemoryBlock$bytes(address, Size$Tuple$$I64$Bool$$I64$Bool$$()))
; [eval] MemoryBlock$bytes(address, Size$Tuple$$I64$Bool$$I64$Bool$$())
; [eval] Size$Tuple$$I64$Bool$$I64$Bool$$()
(push) ; 4
(declare-const $k@841@01 $Perm)
(assert ($Perm.isReadVar $k@841@01))
(assert (< $k@841@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@841@01)))
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@841@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.second $t@838@01) address@836@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))
(pop) ; 4
; Joined path conditions
(assert ($Perm.isReadVar $k@841@01))
(assert (and
  (< $k@841@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@841@01))
  (MemoryBlock$bytes%precondition ($Snap.second $t@838@01) address@836@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$Tuple$$I64$Bool$$I64$Bool$(snapshot)
(set-option :timeout 0)
(push) ; 4
; [then-branch: 102 | MemoryBlock$bytes(Second:($t@838@01), address@836@01, Size$Tuple$$I64$Bool$$I64$Bool$$[Snap$Usize]) == to_bytes$Tuple$$I64$Bool$$I64$Bool$[Bytes](snapshot@840@01) | live]
; [else-branch: 102 | MemoryBlock$bytes(Second:($t@838@01), address@836@01, Size$Tuple$$I64$Bool$$I64$Bool$$[Snap$Usize]) != to_bytes$Tuple$$I64$Bool$$I64$Bool$[Bytes](snapshot@840@01) | live]
(push) ; 5
; [then-branch: 102 | MemoryBlock$bytes(Second:($t@838@01), address@836@01, Size$Tuple$$I64$Bool$$I64$Bool$$[Snap$Usize]) == to_bytes$Tuple$$I64$Bool$$I64$Bool$[Bytes](snapshot@840@01)]
(assert (=
  (MemoryBlock$bytes ($Snap.second $t@838@01) address@836@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize))
  (to_bytes$Tuple$$I64$Bool$$I64$Bool$<Bytes> snapshot@840@01)))
; [eval] MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address), Size$I64$()) == to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot)) && MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address), Size$Bool$()) == to_bytes$Bool(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot))
; [eval] MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address), Size$I64$()) == to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot))
; [eval] MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address), Size$I64$())
; [eval] field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address)
; [eval] Size$I64$()
(push) ; 6
(declare-const $k@842@01 $Perm)
(assert ($Perm.isReadVar $k@842@01))
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= permission_amount@837@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (< $k@842@01 permission_amount@837@01))
(assert (<= $Perm.No (- permission_amount@837@01 $k@842@01)))
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.No $k@842@01)))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@839@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@836@01) (as Size$I64$<Snap$Usize>  Snap$Usize)))
(pop) ; 6
; Joined path conditions
(assert ($Perm.isReadVar $k@842@01))
(assert (and
  (< $k@842@01 permission_amount@837@01)
  (<= $Perm.No (- permission_amount@837@01 $k@842@01))
  (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@839@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@836@01) (as Size$I64$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot)
(set-option :timeout 0)
(push) ; 6
; [then-branch: 103 | MemoryBlock$bytes(First:(Second:($t@839@01)), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](address@836@01), Size$I64$[Snap$Usize]) == to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@840@01)) | live]
; [else-branch: 103 | MemoryBlock$bytes(First:(Second:($t@839@01)), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](address@836@01), Size$I64$[Snap$Usize]) != to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@840@01)) | live]
(push) ; 7
; [then-branch: 103 | MemoryBlock$bytes(First:(Second:($t@839@01)), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](address@836@01), Size$I64$[Snap$Usize]) == to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@840@01))]
(assert (=
  (MemoryBlock$bytes ($Snap.first ($Snap.second $t@839@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@836@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
  (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@840@01))))
; [eval] MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address), Size$Bool$()) == to_bytes$Bool(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot))
; [eval] MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address), Size$Bool$())
; [eval] field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address)
; [eval] Size$Bool$()
(push) ; 8
(declare-const $k@843@01 $Perm)
(assert ($Perm.isReadVar $k@843@01))
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= permission_amount@837@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (< $k@843@01 permission_amount@837@01))
(assert (<= $Perm.No (- permission_amount@837@01 $k@843@01)))
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (< $Perm.No $k@843@01)))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second ($Snap.second $t@839@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> address@836@01) (as Size$Bool$<Snap$Usize>  Snap$Usize)))
(pop) ; 8
; Joined path conditions
(assert ($Perm.isReadVar $k@843@01))
(assert (and
  (< $k@843@01 permission_amount@837@01)
  (<= $Perm.No (- permission_amount@837@01 $k@843@01))
  (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second ($Snap.second $t@839@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> address@836@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$Bool(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot)
(pop) ; 7
(set-option :timeout 0)
(push) ; 7
; [else-branch: 103 | MemoryBlock$bytes(First:(Second:($t@839@01)), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](address@836@01), Size$I64$[Snap$Usize]) != to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@840@01))]
(assert (not
  (=
    (MemoryBlock$bytes ($Snap.first ($Snap.second $t@839@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@836@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
    (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@840@01)))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert ($Perm.isReadVar $k@843@01))
(assert (=>
  (=
    (MemoryBlock$bytes ($Snap.first ($Snap.second $t@839@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@836@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
    (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@840@01)))
  (and
    (=
      (MemoryBlock$bytes ($Snap.first ($Snap.second $t@839@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@836@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
      (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@840@01)))
    (< $k@843@01 permission_amount@837@01)
    (<= $Perm.No (- permission_amount@837@01 $k@843@01))
    (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second ($Snap.second $t@839@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> address@836@01) (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
; Joined path conditions
(assert (or
  (not
    (=
      (MemoryBlock$bytes ($Snap.first ($Snap.second $t@839@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@836@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
      (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@840@01))))
  (=
    (MemoryBlock$bytes ($Snap.first ($Snap.second $t@839@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@836@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
    (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@840@01)))))
(pop) ; 5
(push) ; 5
; [else-branch: 102 | MemoryBlock$bytes(Second:($t@838@01), address@836@01, Size$Tuple$$I64$Bool$$I64$Bool$$[Snap$Usize]) != to_bytes$Tuple$$I64$Bool$$I64$Bool$[Bytes](snapshot@840@01)]
(assert (not
  (=
    (MemoryBlock$bytes ($Snap.second $t@838@01) address@836@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize))
    (to_bytes$Tuple$$I64$Bool$$I64$Bool$<Bytes> snapshot@840@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert ($Perm.isReadVar $k@842@01))
(assert ($Perm.isReadVar $k@843@01))
(assert (=>
  (=
    (MemoryBlock$bytes ($Snap.second $t@838@01) address@836@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize))
    (to_bytes$Tuple$$I64$Bool$$I64$Bool$<Bytes> snapshot@840@01))
  (and
    (=
      (MemoryBlock$bytes ($Snap.second $t@838@01) address@836@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize))
      (to_bytes$Tuple$$I64$Bool$$I64$Bool$<Bytes> snapshot@840@01))
    (< $k@842@01 permission_amount@837@01)
    (<= $Perm.No (- permission_amount@837@01 $k@842@01))
    (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@839@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@836@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
    (=>
      (=
        (MemoryBlock$bytes ($Snap.first ($Snap.second $t@839@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@836@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
        (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@840@01)))
      (and
        (=
          (MemoryBlock$bytes ($Snap.first ($Snap.second $t@839@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@836@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
          (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@840@01)))
        (< $k@843@01 permission_amount@837@01)
        (<= $Perm.No (- permission_amount@837@01 $k@843@01))
        (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second ($Snap.second $t@839@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> address@836@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))))
    (or
      (not
        (=
          (MemoryBlock$bytes ($Snap.first ($Snap.second $t@839@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@836@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
          (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@840@01))))
      (=
        (MemoryBlock$bytes ($Snap.first ($Snap.second $t@839@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@836@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
        (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@840@01)))))))
; Joined path conditions
(assert (or
  (not
    (=
      (MemoryBlock$bytes ($Snap.second $t@838@01) address@836@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize))
      (to_bytes$Tuple$$I64$Bool$$I64$Bool$<Bytes> snapshot@840@01)))
  (=
    (MemoryBlock$bytes ($Snap.second $t@838@01) address@836@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize))
    (to_bytes$Tuple$$I64$Bool$$I64$Bool$<Bytes> snapshot@840@01))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert ($Perm.isReadVar $k@841@01))
(assert ($Perm.isReadVar $k@842@01))
(assert ($Perm.isReadVar $k@843@01))
(assert (< $k@841@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@841@01)))
(assert (MemoryBlock$bytes%precondition ($Snap.second $t@838@01) address@836@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((snapshot@840@01 Snap$Tuple$$I64$Bool$$I64$Bool$)) (!
  (and
    (=>
      (=
        (MemoryBlock$bytes ($Snap.second $t@838@01) address@836@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize))
        (to_bytes$Tuple$$I64$Bool$$I64$Bool$<Bytes> snapshot@840@01))
      (and
        (=
          (MemoryBlock$bytes ($Snap.second $t@838@01) address@836@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize))
          (to_bytes$Tuple$$I64$Bool$$I64$Bool$<Bytes> snapshot@840@01))
        (< $k@842@01 permission_amount@837@01)
        (<= $Perm.No (- permission_amount@837@01 $k@842@01))
        (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@839@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@836@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
        (=>
          (=
            (MemoryBlock$bytes ($Snap.first ($Snap.second $t@839@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@836@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
            (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@840@01)))
          (and
            (=
              (MemoryBlock$bytes ($Snap.first ($Snap.second $t@839@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@836@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
              (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@840@01)))
            (< $k@843@01 permission_amount@837@01)
            (<= $Perm.No (- permission_amount@837@01 $k@843@01))
            (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second ($Snap.second $t@839@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> address@836@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))))
        (or
          (not
            (=
              (MemoryBlock$bytes ($Snap.first ($Snap.second $t@839@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@836@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
              (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@840@01))))
          (=
            (MemoryBlock$bytes ($Snap.first ($Snap.second $t@839@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@836@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
            (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@840@01))))))
    (or
      (not
        (=
          (MemoryBlock$bytes ($Snap.second $t@838@01) address@836@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize))
          (to_bytes$Tuple$$I64$Bool$$I64$Bool$<Bytes> snapshot@840@01)))
      (=
        (MemoryBlock$bytes ($Snap.second $t@838@01) address@836@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize))
        (to_bytes$Tuple$$I64$Bool$$I64$Bool$<Bytes> snapshot@840@01))))
  :pattern ((to_bytes$Tuple$$I64$Bool$$I64$Bool$<Bytes> snapshot@840@01))
  :qid |prog.l2599-aux|)))
(assert (forall ((snapshot@840@01 Snap$Tuple$$I64$Bool$$I64$Bool$)) (!
  (=>
    (=
      (MemoryBlock$bytes ($Snap.second $t@838@01) address@836@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize))
      (to_bytes$Tuple$$I64$Bool$$I64$Bool$<Bytes> snapshot@840@01))
    (and
      (=
        (MemoryBlock$bytes ($Snap.first ($Snap.second ($Snap.second $t@839@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> address@836@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
        (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@840@01)))
      (=
        (MemoryBlock$bytes ($Snap.first ($Snap.second $t@839@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@836@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
        (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@840@01)))))
  :pattern ((to_bytes$Tuple$$I64$Bool$$I64$Bool$<Bytes> snapshot@840@01))
  :qid |prog.l2599|)))
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- memory_copy$I64 ----------
(declare-const source_address@844@01 Address)
(declare-const target_address@845@01 Address)
(declare-const permission_amount@846@01 $Perm)
(declare-const source_address@847@01 Address)
(declare-const target_address@848@01 Address)
(declare-const permission_amount@849@01 $Perm)
(push) ; 1
(declare-const $t@850@01 $Snap)
(assert (= $t@850@01 ($Snap.combine ($Snap.first $t@850@01) ($Snap.second $t@850@01))))
(assert (= ($Snap.first $t@850@01) $Snap.unit))
; [eval] none < permission_amount
(assert (< $Perm.No permission_amount@849@01))
(assert (=
  ($Snap.second $t@850@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@850@01))
    ($Snap.second ($Snap.second $t@850@01)))))
; [eval] Size$I64$()
; [eval] Size$I64$()
(push) ; 2
(assert (not (or (= permission_amount@849@01 $Perm.No) (< $Perm.No permission_amount@849@01))))
(check-sat)
; unsat
(pop) ; 2
; 0.00s
; (get-info :all-statistics)
(push) ; 2
(set-option :timeout 10)
(assert (not (= target_address@848@01 source_address@847@01)))
(check-sat)
; unknown
(pop) ; 2
; 0.00s
; (get-info :all-statistics)
(assert (<= $Perm.No permission_amount@849@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@851@01 $Snap)
(assert (= $t@851@01 ($Snap.combine ($Snap.first $t@851@01) ($Snap.second $t@851@01))))
; [eval] Size$I64$()
(assert (=
  ($Snap.second $t@851@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@851@01))
    ($Snap.second ($Snap.second $t@851@01)))))
; [eval] Size$I64$()
(push) ; 3
(assert (not (or (= permission_amount@849@01 $Perm.No) (< $Perm.No permission_amount@849@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(push) ; 3
(set-option :timeout 10)
(assert (not (= target_address@848@01 source_address@847@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second $t@851@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@851@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@851@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@851@01))) $Snap.unit))
; [eval] MemoryBlock$bytes(source_address, Size$I64$()) == old(MemoryBlock$bytes(source_address, Size$I64$()))
; [eval] MemoryBlock$bytes(source_address, Size$I64$())
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 3
(declare-const $k@852@01 $Perm)
(assert ($Perm.isReadVar $k@852@01))
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= permission_amount@849@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (< $k@852@01 permission_amount@849@01))
(assert (<= $Perm.No (- permission_amount@849@01 $k@852@01)))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@852@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@851@01)) source_address@847@01 (as Size$I64$<Snap$Usize>  Snap$Usize)))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@852@01))
(assert (and
  (< $k@852@01 permission_amount@849@01)
  (<= $Perm.No (- permission_amount@849@01 $k@852@01))
  (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@851@01)) source_address@847@01 (as Size$I64$<Snap$Usize>  Snap$Usize))))
; [eval] old(MemoryBlock$bytes(source_address, Size$I64$()))
; [eval] MemoryBlock$bytes(source_address, Size$I64$())
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 3
(declare-const $k@853@01 $Perm)
(assert ($Perm.isReadVar $k@853@01))
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= permission_amount@849@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (< $k@853@01 permission_amount@849@01))
(assert (<= $Perm.No (- permission_amount@849@01 $k@853@01)))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@853@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.second ($Snap.second $t@850@01)) source_address@847@01 (as Size$I64$<Snap$Usize>  Snap$Usize)))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@853@01))
(assert (and
  (< $k@853@01 permission_amount@849@01)
  (<= $Perm.No (- permission_amount@849@01 $k@853@01))
  (MemoryBlock$bytes%precondition ($Snap.second ($Snap.second $t@850@01)) source_address@847@01 (as Size$I64$<Snap$Usize>  Snap$Usize))))
(assert (=
  (MemoryBlock$bytes ($Snap.first ($Snap.second $t@851@01)) source_address@847@01 (as Size$I64$<Snap$Usize>  Snap$Usize))
  (MemoryBlock$bytes ($Snap.second ($Snap.second $t@850@01)) source_address@847@01 (as Size$I64$<Snap$Usize>  Snap$Usize))))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@851@01))) $Snap.unit))
; [eval] MemoryBlock$bytes(target_address, Size$I64$()) == MemoryBlock$bytes(source_address, Size$I64$())
; [eval] MemoryBlock$bytes(target_address, Size$I64$())
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 3
(declare-const $k@854@01 $Perm)
(assert ($Perm.isReadVar $k@854@01))
(assert (< $k@854@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@854@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@854@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first $t@851@01) target_address@848@01 (as Size$I64$<Snap$Usize>  Snap$Usize)))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@854@01))
(assert (and
  (< $k@854@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@854@01))
  (MemoryBlock$bytes%precondition ($Snap.first $t@851@01) target_address@848@01 (as Size$I64$<Snap$Usize>  Snap$Usize))))
; [eval] MemoryBlock$bytes(source_address, Size$I64$())
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 3
(declare-const $k@855@01 $Perm)
(assert ($Perm.isReadVar $k@855@01))
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= permission_amount@849@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (< $k@855@01 permission_amount@849@01))
(assert (<= $Perm.No (- permission_amount@849@01 $k@855@01)))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@855@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@855@01))
(assert (and
  (< $k@855@01 permission_amount@849@01)
  (<= $Perm.No (- permission_amount@849@01 $k@855@01))))
(assert (=
  (MemoryBlock$bytes ($Snap.first $t@851@01) target_address@848@01 (as Size$I64$<Snap$Usize>  Snap$Usize))
  (MemoryBlock$bytes ($Snap.first ($Snap.second $t@851@01)) source_address@847@01 (as Size$I64$<Snap$Usize>  Snap$Usize))))
(pop) ; 2
(set-option :timeout 0)
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- move_place$I64 ----------
(declare-const target_place@856@01 Place)
(declare-const target_root_address@857@01 Address)
(declare-const source_place@858@01 Place)
(declare-const source_root_address@859@01 Address)
(declare-const source_snapshot@860@01 Snap$I64)
(declare-const target_place@861@01 Place)
(declare-const target_root_address@862@01 Address)
(declare-const source_place@863@01 Place)
(declare-const source_root_address@864@01 Address)
(declare-const source_snapshot@865@01 Snap$I64)
(push) ; 1
(declare-const $t@866@01 $Snap)
(assert (= $t@866@01 ($Snap.combine ($Snap.first $t@866@01) ($Snap.second $t@866@01))))
; [eval] compute_address(target_place, target_root_address)
; [eval] Size$I64$()
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@867@01 $Snap)
(assert (= $t@867@01 ($Snap.combine ($Snap.first $t@867@01) ($Snap.second $t@867@01))))
(assert (=
  ($Snap.second $t@867@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@867@01))
    ($Snap.second ($Snap.second $t@867@01)))))
; [eval] compute_address(source_place, source_root_address)
; [eval] Size$I64$()
(assert (= ($Snap.second ($Snap.second $t@867@01)) $Snap.unit))
; [eval] valid$Snap$I64(source_snapshot)
(assert (valid$Snap$I64<Bool> source_snapshot@865@01))
(pop) ; 2
(push) ; 2
; [exec]
; unfold acc(OwnedNonAliased$I64(source_place, source_root_address, source_snapshot), write)
(assert (=
  ($Snap.second $t@866@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@866@01))
    ($Snap.second ($Snap.second $t@866@01)))))
(assert (= ($Snap.first ($Snap.second $t@866@01)) $Snap.unit))
; [eval] valid$Snap$I64(snapshot)
(assert (valid$Snap$I64<Bool> source_snapshot@865@01))
(assert (=
  ($Snap.second ($Snap.second $t@866@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@866@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@866@01))))))
; [eval] compute_address(place, root_address)
; [eval] Size$I64$()
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> target_place@861@01 target_root_address@862@01)
  (compute_address<Address> source_place@863@01 source_root_address@864@01))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@866@01))) $Snap.unit))
; [eval] MemoryBlock$bytes(compute_address(place, root_address), Size$I64$()) == to_bytes$I64(snapshot)
; [eval] MemoryBlock$bytes(compute_address(place, root_address), Size$I64$())
; [eval] compute_address(place, root_address)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 3
(declare-const $k@868@01 $Perm)
(assert ($Perm.isReadVar $k@868@01))
(assert (< $k@868@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@868@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@868@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second ($Snap.second $t@866@01))) (compute_address<Address> source_place@863@01 source_root_address@864@01) (as Size$I64$<Snap$Usize>  Snap$Usize)))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@868@01))
(assert (and
  (< $k@868@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@868@01))
  (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second ($Snap.second $t@866@01))) (compute_address<Address> source_place@863@01 source_root_address@864@01) (as Size$I64$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$I64(snapshot)
(assert (=
  (MemoryBlock$bytes ($Snap.first ($Snap.second ($Snap.second $t@866@01))) (compute_address<Address> source_place@863@01 source_root_address@864@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
  (to_bytes$I64<Bytes> source_snapshot@865@01)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (OwnedNonAliased$I64%trigger ($Snap.second $t@866@01) source_place@863@01 source_root_address@864@01 source_snapshot@865@01))
; [exec]
; memory_copy$I64(compute_address(source_place, source_root_address), compute_address(target_place,
;   target_root_address), write)
; [eval] compute_address(source_place, source_root_address)
; [eval] compute_address(target_place, target_root_address)
; [eval] none < permission_amount
; [eval] Size$I64$()
; [eval] Size$I64$()
(declare-const $t@869@01 $Snap)
(assert (= $t@869@01 ($Snap.combine ($Snap.first $t@869@01) ($Snap.second $t@869@01))))
; [eval] Size$I64$()
(assert (=
  ($Snap.second $t@869@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@869@01))
    ($Snap.second ($Snap.second $t@869@01)))))
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> target_place@861@01 target_root_address@862@01)
  (compute_address<Address> source_place@863@01 source_root_address@864@01))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second $t@869@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@869@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@869@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@869@01))) $Snap.unit))
; [eval] MemoryBlock$bytes(source_address, Size$I64$()) == old(MemoryBlock$bytes(source_address, Size$I64$()))
; [eval] MemoryBlock$bytes(source_address, Size$I64$())
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 3
(declare-const $k@870@01 $Perm)
(assert ($Perm.isReadVar $k@870@01))
(assert (< $k@870@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@870@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@870@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@869@01)) (compute_address<Address> source_place@863@01 source_root_address@864@01) (as Size$I64$<Snap$Usize>  Snap$Usize)))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@870@01))
(assert (and
  (< $k@870@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@870@01))
  (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@869@01)) (compute_address<Address> source_place@863@01 source_root_address@864@01) (as Size$I64$<Snap$Usize>  Snap$Usize))))
; [eval] old(MemoryBlock$bytes(source_address, Size$I64$()))
; [eval] MemoryBlock$bytes(source_address, Size$I64$())
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 3
(declare-const $k@871@01 $Perm)
(assert ($Perm.isReadVar $k@871@01))
(assert (< $k@871@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@871@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@871@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@871@01))
(assert (and (< $k@871@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@871@01))))
(assert (=
  (MemoryBlock$bytes ($Snap.first ($Snap.second $t@869@01)) (compute_address<Address> source_place@863@01 source_root_address@864@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
  (MemoryBlock$bytes ($Snap.first ($Snap.second ($Snap.second $t@866@01))) (compute_address<Address> source_place@863@01 source_root_address@864@01) (as Size$I64$<Snap$Usize>  Snap$Usize))))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@869@01))) $Snap.unit))
; [eval] MemoryBlock$bytes(target_address, Size$I64$()) == MemoryBlock$bytes(source_address, Size$I64$())
; [eval] MemoryBlock$bytes(target_address, Size$I64$())
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 3
(declare-const $k@872@01 $Perm)
(assert ($Perm.isReadVar $k@872@01))
(assert (< $k@872@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@872@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@872@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first $t@869@01) (compute_address<Address> target_place@861@01 target_root_address@862@01) (as Size$I64$<Snap$Usize>  Snap$Usize)))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@872@01))
(assert (and
  (< $k@872@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@872@01))
  (MemoryBlock$bytes%precondition ($Snap.first $t@869@01) (compute_address<Address> target_place@861@01 target_root_address@862@01) (as Size$I64$<Snap$Usize>  Snap$Usize))))
; [eval] MemoryBlock$bytes(source_address, Size$I64$())
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 3
(declare-const $k@873@01 $Perm)
(assert ($Perm.isReadVar $k@873@01))
(assert (< $k@873@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@873@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@873@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@873@01))
(assert (and (< $k@873@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@873@01))))
(assert (=
  (MemoryBlock$bytes ($Snap.first $t@869@01) (compute_address<Address> target_place@861@01 target_root_address@862@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
  (MemoryBlock$bytes ($Snap.first ($Snap.second $t@869@01)) (compute_address<Address> source_place@863@01 source_root_address@864@01) (as Size$I64$<Snap$Usize>  Snap$Usize))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; fold acc(OwnedNonAliased$I64(target_place, target_root_address, source_snapshot), write)
; [eval] valid$Snap$I64(snapshot)
; [eval] compute_address(place, root_address)
; [eval] Size$I64$()
; [eval] MemoryBlock$bytes(compute_address(place, root_address), Size$I64$()) == to_bytes$I64(snapshot)
; [eval] MemoryBlock$bytes(compute_address(place, root_address), Size$I64$())
; [eval] compute_address(place, root_address)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 3
(declare-const $k@874@01 $Perm)
(assert ($Perm.isReadVar $k@874@01))
(assert (< $k@874@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@874@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@874@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@874@01))
(assert (and (< $k@874@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@874@01))))
; [eval] to_bytes$I64(snapshot)
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  (MemoryBlock$bytes ($Snap.first $t@869@01) (compute_address<Address> target_place@861@01 target_root_address@862@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
  (to_bytes$I64<Bytes> source_snapshot@865@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (=
  (MemoryBlock$bytes ($Snap.first $t@869@01) (compute_address<Address> target_place@861@01 target_root_address@862@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
  (to_bytes$I64<Bytes> source_snapshot@865@01)))
(assert (OwnedNonAliased$I64%trigger ($Snap.combine
  $Snap.unit
  ($Snap.combine ($Snap.first $t@869@01) $Snap.unit)) target_place@861@01 target_root_address@862@01 source_snapshot@865@01))
; [eval] compute_address(source_place, source_root_address)
; [eval] Size$I64$()
; [eval] valid$Snap$I64(source_snapshot)
(pop) ; 2
(pop) ; 1
; ---------- write_address_constant$Bool ----------
(declare-const target_address@875@01 Address)
(declare-const source_snapshot@876@01 Snap$Bool)
(declare-const target_address@877@01 Address)
(declare-const source_snapshot@878@01 Snap$Bool)
(push) ; 1
; [eval] Size$Bool$()
(declare-const $t@879@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@880@01 $Snap)
(assert (= $t@880@01 ($Snap.combine ($Snap.first $t@880@01) ($Snap.second $t@880@01))))
; [eval] Size$Bool$()
(assert (= ($Snap.second $t@880@01) $Snap.unit))
; [eval] MemoryBlock$bytes(target_address, Size$Bool$()) == to_bytes$Bool(source_snapshot)
; [eval] MemoryBlock$bytes(target_address, Size$Bool$())
; [eval] Size$Bool$()
(push) ; 3
(declare-const $k@881@01 $Perm)
(assert ($Perm.isReadVar $k@881@01))
(assert (< $k@881@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@881@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@881@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first $t@880@01) target_address@877@01 (as Size$Bool$<Snap$Usize>  Snap$Usize)))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@881@01))
(assert (and
  (< $k@881@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@881@01))
  (MemoryBlock$bytes%precondition ($Snap.first $t@880@01) target_address@877@01 (as Size$Bool$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$Bool(source_snapshot)
(assert (=
  (MemoryBlock$bytes ($Snap.first $t@880@01) target_address@877@01 (as Size$Bool$<Snap$Usize>  Snap$Usize))
  (to_bytes$Bool<Bytes> source_snapshot@878@01)))
(pop) ; 2
(set-option :timeout 0)
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- write_address_constant$I64 ----------
(declare-const target_address@882@01 Address)
(declare-const source_snapshot@883@01 Snap$I64)
(declare-const target_address@884@01 Address)
(declare-const source_snapshot@885@01 Snap$I64)
(push) ; 1
; [eval] Size$I64$()
(declare-const $t@886@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@887@01 $Snap)
(assert (= $t@887@01 ($Snap.combine ($Snap.first $t@887@01) ($Snap.second $t@887@01))))
; [eval] Size$I64$()
(assert (= ($Snap.second $t@887@01) $Snap.unit))
; [eval] MemoryBlock$bytes(target_address, Size$I64$()) == to_bytes$I64(source_snapshot)
; [eval] MemoryBlock$bytes(target_address, Size$I64$())
; [eval] Size$I64$()
(push) ; 3
(declare-const $k@888@01 $Perm)
(assert ($Perm.isReadVar $k@888@01))
(assert (< $k@888@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@888@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@888@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first $t@887@01) target_address@884@01 (as Size$I64$<Snap$Usize>  Snap$Usize)))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@888@01))
(assert (and
  (< $k@888@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@888@01))
  (MemoryBlock$bytes%precondition ($Snap.first $t@887@01) target_address@884@01 (as Size$I64$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$I64(source_snapshot)
(assert (=
  (MemoryBlock$bytes ($Snap.first $t@887@01) target_address@884@01 (as Size$I64$<Snap$Usize>  Snap$Usize))
  (to_bytes$I64<Bytes> source_snapshot@885@01)))
(pop) ; 2
(set-option :timeout 0)
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- write_place_constant$Bool ----------
(declare-const target_place@889@01 Place)
(declare-const target_root_address@890@01 Address)
(declare-const source_snapshot@891@01 Snap$Bool)
(declare-const target_place@892@01 Place)
(declare-const target_root_address@893@01 Address)
(declare-const source_snapshot@894@01 Snap$Bool)
(push) ; 1
(declare-const $t@895@01 $Snap)
(assert (= $t@895@01 ($Snap.combine ($Snap.first $t@895@01) ($Snap.second $t@895@01))))
; [eval] compute_address(target_place, target_root_address)
; [eval] Size$Bool$()
(assert (= ($Snap.second $t@895@01) $Snap.unit))
; [eval] valid$Snap$Bool(source_snapshot)
(assert (valid$Snap$Bool<Bool> source_snapshot@894@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@896@01 $Snap)
(pop) ; 2
(push) ; 2
; [exec]
; write_address_constant$Bool(compute_address(target_place, target_root_address),
;   source_snapshot)
; [eval] compute_address(target_place, target_root_address)
; [eval] Size$Bool$()
(declare-const $t@897@01 $Snap)
(assert (= $t@897@01 ($Snap.combine ($Snap.first $t@897@01) ($Snap.second $t@897@01))))
; [eval] Size$Bool$()
(assert (= ($Snap.second $t@897@01) $Snap.unit))
; [eval] MemoryBlock$bytes(target_address, Size$Bool$()) == to_bytes$Bool(source_snapshot)
; [eval] MemoryBlock$bytes(target_address, Size$Bool$())
; [eval] Size$Bool$()
(push) ; 3
(declare-const $k@898@01 $Perm)
(assert ($Perm.isReadVar $k@898@01))
(assert (< $k@898@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@898@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@898@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first $t@897@01) (compute_address<Address> target_place@892@01 target_root_address@893@01) (as Size$Bool$<Snap$Usize>  Snap$Usize)))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@898@01))
(assert (and
  (< $k@898@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@898@01))
  (MemoryBlock$bytes%precondition ($Snap.first $t@897@01) (compute_address<Address> target_place@892@01 target_root_address@893@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$Bool(source_snapshot)
(assert (=
  (MemoryBlock$bytes ($Snap.first $t@897@01) (compute_address<Address> target_place@892@01 target_root_address@893@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
  (to_bytes$Bool<Bytes> source_snapshot@894@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; fold acc(OwnedNonAliased$Bool(target_place, target_root_address, source_snapshot), write)
; [eval] valid$Snap$Bool(snapshot)
; [eval] compute_address(place, root_address)
; [eval] Size$Bool$()
; [eval] MemoryBlock$bytes(compute_address(place, root_address), Size$Bool$()) == to_bytes$Bool(snapshot)
; [eval] MemoryBlock$bytes(compute_address(place, root_address), Size$Bool$())
; [eval] compute_address(place, root_address)
; [eval] Size$Bool$()
(set-option :timeout 0)
(push) ; 3
(declare-const $k@899@01 $Perm)
(assert ($Perm.isReadVar $k@899@01))
(assert (< $k@899@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@899@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@899@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@899@01))
(assert (and (< $k@899@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@899@01))))
; [eval] to_bytes$Bool(snapshot)
(assert (OwnedNonAliased$Bool%trigger ($Snap.combine
  $Snap.unit
  ($Snap.combine ($Snap.first $t@897@01) $Snap.unit)) target_place@892@01 target_root_address@893@01 source_snapshot@894@01))
(pop) ; 2
(pop) ; 1
; ---------- write_place_constant$I64 ----------
(declare-const target_place@900@01 Place)
(declare-const target_root_address@901@01 Address)
(declare-const source_snapshot@902@01 Snap$I64)
(declare-const target_place@903@01 Place)
(declare-const target_root_address@904@01 Address)
(declare-const source_snapshot@905@01 Snap$I64)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@906@01 $Snap)
(assert (= $t@906@01 ($Snap.combine ($Snap.first $t@906@01) ($Snap.second $t@906@01))))
; [eval] compute_address(target_place, target_root_address)
; [eval] Size$I64$()
(assert (= ($Snap.second $t@906@01) $Snap.unit))
; [eval] valid$Snap$I64(source_snapshot)
(assert (valid$Snap$I64<Bool> source_snapshot@905@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@907@01 $Snap)
(pop) ; 2
(push) ; 2
; [exec]
; write_address_constant$I64(compute_address(target_place, target_root_address),
;   source_snapshot)
; [eval] compute_address(target_place, target_root_address)
; [eval] Size$I64$()
(declare-const $t@908@01 $Snap)
(assert (= $t@908@01 ($Snap.combine ($Snap.first $t@908@01) ($Snap.second $t@908@01))))
; [eval] Size$I64$()
(assert (= ($Snap.second $t@908@01) $Snap.unit))
; [eval] MemoryBlock$bytes(target_address, Size$I64$()) == to_bytes$I64(source_snapshot)
; [eval] MemoryBlock$bytes(target_address, Size$I64$())
; [eval] Size$I64$()
(push) ; 3
(declare-const $k@909@01 $Perm)
(assert ($Perm.isReadVar $k@909@01))
(assert (< $k@909@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@909@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@909@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first $t@908@01) (compute_address<Address> target_place@903@01 target_root_address@904@01) (as Size$I64$<Snap$Usize>  Snap$Usize)))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@909@01))
(assert (and
  (< $k@909@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@909@01))
  (MemoryBlock$bytes%precondition ($Snap.first $t@908@01) (compute_address<Address> target_place@903@01 target_root_address@904@01) (as Size$I64$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$I64(source_snapshot)
(assert (=
  (MemoryBlock$bytes ($Snap.first $t@908@01) (compute_address<Address> target_place@903@01 target_root_address@904@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
  (to_bytes$I64<Bytes> source_snapshot@905@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; fold acc(OwnedNonAliased$I64(target_place, target_root_address, source_snapshot), write)
; [eval] valid$Snap$I64(snapshot)
; [eval] compute_address(place, root_address)
; [eval] Size$I64$()
; [eval] MemoryBlock$bytes(compute_address(place, root_address), Size$I64$()) == to_bytes$I64(snapshot)
; [eval] MemoryBlock$bytes(compute_address(place, root_address), Size$I64$())
; [eval] compute_address(place, root_address)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 3
(declare-const $k@910@01 $Perm)
(assert ($Perm.isReadVar $k@910@01))
(assert (< $k@910@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@910@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@910@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@910@01))
(assert (and (< $k@910@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@910@01))))
; [eval] to_bytes$I64(snapshot)
(assert (OwnedNonAliased$I64%trigger ($Snap.combine
  $Snap.unit
  ($Snap.combine ($Snap.first $t@908@01) $Snap.unit)) target_place@903@01 target_root_address@904@01 source_snapshot@905@01))
(pop) ; 2
(pop) ; 1
; ---------- write_place_constant$Tuple$$$ ----------
(declare-const target_place@911@01 Place)
(declare-const target_root_address@912@01 Address)
(declare-const source_snapshot@913@01 Snap$Tuple$$$)
(declare-const target_place@914@01 Place)
(declare-const target_root_address@915@01 Address)
(declare-const source_snapshot@916@01 Snap$Tuple$$$)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@917@01 $Snap)
(assert (= $t@917@01 ($Snap.combine ($Snap.first $t@917@01) ($Snap.second $t@917@01))))
; [eval] compute_address(target_place, target_root_address)
; [eval] Size$Tuple$$$$()
(assert (= ($Snap.second $t@917@01) $Snap.unit))
; [eval] valid$Snap$Tuple$$$(source_snapshot)
(assert (valid$Snap$Tuple$$$<Bool> source_snapshot@916@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@918@01 $Snap)
(pop) ; 2
(push) ; 2
; [exec]
; memory_block_split$Tuple$$$(compute_address(target_place, target_root_address),
;   write)
; [eval] compute_address(target_place, target_root_address)
; [eval] none < permission_amount
; [eval] Size$Tuple$$$$()
(declare-const $t@919@01 $Snap)
(assert (= $t@919@01 ($Snap.combine ($Snap.first $t@919@01) ($Snap.second $t@919@01))))
; [eval] PaddingSize$Tuple$$$$()
(assert (= ($Snap.second $t@919@01) $Snap.unit))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; fold acc(OwnedNonAliased$Tuple$$$(target_place, target_root_address, source_snapshot), write)
; [eval] valid$Snap$Tuple$$$(snapshot)
; [eval] compute_address(place, root_address)
; [eval] PaddingSize$Tuple$$$$()
(assert (OwnedNonAliased$Tuple$$$%trigger ($Snap.combine
  $Snap.unit
  ($Snap.first $t@919@01)) target_place@914@01 target_root_address@915@01 source_snapshot@916@01))
(pop) ; 2
(pop) ; 1
