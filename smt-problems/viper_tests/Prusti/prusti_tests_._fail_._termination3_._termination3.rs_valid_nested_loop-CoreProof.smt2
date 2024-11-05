(get-info :version)
; (:version "4.12.1")
; Started: 2023-10-31 14:03:21
; Silicon.version: 1.1-SNAPSHOT (46944a65@dspil_symbenchmarking)
; Input file: /home/pcorrect/repos/benchmarking_general/silicon_tests/prusti_tests_._fail_._termination3_._termination3.rs_valid_nested_loop-CoreProof.vpr
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
(declare-sort Bytes 0)
(declare-sort Snap$Unbounded 0)
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
(declare-fun compute_address<Address> (Place Address) Address)
(declare-fun constructor$Snap$Unbounded$<Snap$Unbounded> (Int) Snap$Unbounded)
(declare-fun destructor$Snap$Unbounded$$value<Int> (Snap$Unbounded) Int)
(declare-fun valid$Snap$Unbounded<Bool> (Snap$Unbounded) Bool)
(declare-const basic_block_marker$start_label$marker<Bool> Bool)
(declare-const basic_block_marker$label_entry$marker<Bool> Bool)
(declare-const basic_block_marker$label_bb0$marker<Bool> Bool)
(declare-const basic_block_marker$label_bb1$marker<Bool> Bool)
(declare-const basic_block_marker$label_bb2$marker<Bool> Bool)
(declare-const basic_block_marker$label_4_custom$marker<Bool> Bool)
(declare-const basic_block_marker$label_bb3$marker<Bool> Bool)
(declare-const basic_block_marker$label_bb5$marker<Bool> Bool)
(declare-const basic_block_marker$label_bb6$marker<Bool> Bool)
(declare-const basic_block_marker$label_bb7$marker<Bool> Bool)
(declare-const basic_block_marker$label_bb8$marker<Bool> Bool)
(declare-const basic_block_marker$label_6_custom$marker<Bool> Bool)
(declare-const basic_block_marker$label_bb9$marker<Bool> Bool)
(declare-const basic_block_marker$label_bb11$marker<Bool> Bool)
(declare-const basic_block_marker$label_bb12$marker<Bool> Bool)
(declare-const basic_block_marker$label_bb13$marker<Bool> Bool)
(declare-const basic_block_marker$loop__label_bb7__label_bb7$marker<Bool> Bool)
(declare-const basic_block_marker$loop__label_bb7__label_bb8$marker<Bool> Bool)
(declare-const basic_block_marker$loop__label_bb7__label_6_custom$marker<Bool> Bool)
(declare-const basic_block_marker$loop__label_bb7__label_bb9$marker<Bool> Bool)
(declare-const basic_block_marker$label_5_custom$marker<Bool> Bool)
(declare-const basic_block_marker$label_bb14$marker<Bool> Bool)
(declare-const basic_block_marker$label_bb17$marker<Bool> Bool)
(declare-const basic_block_marker$resume_panic_label$marker<Bool> Bool)
(declare-const basic_block_marker$label_bb15$marker<Bool> Bool)
(declare-const basic_block_marker$loop__label_bb1__label_bb1$marker<Bool> Bool)
(declare-const basic_block_marker$loop__label_bb1__label_bb2$marker<Bool> Bool)
(declare-const basic_block_marker$loop__label_bb1__label_4_custom$marker<Bool> Bool)
(declare-const basic_block_marker$loop__label_bb1__label_bb3$marker<Bool> Bool)
(declare-const basic_block_marker$magic_label$marker<Bool> Bool)
(declare-const basic_block_marker$label_3_custom$marker<Bool> Bool)
(declare-const basic_block_marker$label_bb16$marker<Bool> Bool)
(declare-const basic_block_marker$return_label$marker<Bool> Bool)
(declare-const basic_block_marker$end_label$marker<Bool> Bool)
(declare-const constructor$Snap$Tuple$$$$<Snap$Tuple$$$> Snap$Tuple$$$)
(declare-fun valid$Snap$Tuple$$$<Bool> (Snap$Tuple$$$) Bool)
(declare-fun to_bytes$Tuple$$$<Bytes> (Snap$Tuple$$$) Bytes)
(declare-const _1$place<Place> Place)
(declare-const _4$place<Place> Place)
(declare-const _3$place<Place> Place)
(declare-const _6$place<Place> Place)
(declare-const _5$place<Place> Place)
(declare-const _9$place<Place> Place)
(declare-const _12$place<Place> Place)
(declare-const _11$place<Place> Place)
(declare-const _14$place<Place> Place)
(declare-const _13$place<Place> Place)
(declare-fun field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (Place) Place)
(declare-fun field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (Place) Place)
(declare-const _17$place<Place> Place)
(declare-const _2$place<Place> Place)
(declare-const _10$place<Place> Place)
(declare-const _21$place<Place> Place)
(declare-const _0$place<Place> Place)
(declare-fun constructor$Snap$Bool$<Snap$Bool> (Bool) Snap$Bool)
(declare-fun destructor$Snap$Bool$$value<Bool> (Snap$Bool) Bool)
(declare-fun valid$Snap$Bool<Bool> (Snap$Bool) Bool)
(declare-fun constructor$Snap$Bool$GtCmp_I64<Snap$Bool> (Snap$I64 Snap$I64) Snap$Bool)
(declare-fun destructor$Snap$Bool$GtCmp_I64$left<Snap$I64> (Snap$Bool) Snap$I64)
(declare-fun destructor$Snap$Bool$GtCmp_I64$right<Snap$I64> (Snap$Bool) Snap$I64)
(declare-fun to_bytes$Bool<Bytes> (Snap$Bool) Bytes)
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
(declare-fun constructor$Snap$I64$<Snap$I64> (Int) Snap$I64)
(declare-fun destructor$Snap$I64$$value<Int> (Snap$I64) Int)
(declare-fun valid$Snap$I64<Bool> (Snap$I64) Bool)
(declare-fun to_bytes$I64<Bytes> (Snap$I64) Bytes)
(declare-fun constructor$Snap$I64$Sub_I64<Snap$I64> (Snap$I64 Snap$I64) Snap$I64)
(declare-fun destructor$Snap$I64$Sub_I64$left<Snap$I64> (Snap$I64) Snap$I64)
(declare-fun destructor$Snap$I64$Sub_I64$right<Snap$I64> (Snap$I64) Snap$I64)
(declare-fun constructor$Snap$Tuple$$I64$Bool$$I64$Bool$$<Snap$Tuple$$I64$Bool$$I64$Bool$> (Snap$I64 Snap$Bool) Snap$Tuple$$I64$Bool$$I64$Bool$)
(declare-fun destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> (Snap$Tuple$$I64$Bool$$I64$Bool$) Snap$I64)
(declare-fun destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> (Snap$Tuple$$I64$Bool$$I64$Bool$) Snap$Bool)
(declare-fun valid$Snap$Tuple$$I64$Bool$$I64$Bool$<Bool> (Snap$Tuple$$I64$Bool$$I64$Bool$) Bool)
(declare-fun to_bytes$Tuple$$I64$Bool$$I64$Bool$<Bytes> (Snap$Tuple$$I64$Bool$$I64$Bool$) Bytes)
(declare-fun constructor$Snap$Usize$<Snap$Usize> (Int) Snap$Usize)
(declare-fun destructor$Snap$Usize$$value<Int> (Snap$Usize) Int)
(declare-fun valid$Snap$Usize<Bool> (Snap$Usize) Bool)
(declare-fun field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (Address) Address)
(declare-fun field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> (Address) Address)
(declare-const Size$Tuple$$$$<Snap$Usize> Snap$Usize)
(declare-const Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize> Snap$Usize)
(declare-const Size$Bool$<Snap$Usize> Snap$Usize)
(declare-const Size$I64$<Snap$Usize> Snap$Usize)
(declare-const PaddingSize$Tuple$$$$<Snap$Usize> Snap$Usize)
(declare-const PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize> Snap$Usize)
(declare-fun included<Bool> (Lifetime Lifetime) Bool)
(declare-fun intersect<Lifetime> (Set<Lifetime>) Lifetime)
; Declaring symbols related to program functions (from program analysis)
(declare-fun MemoryBlock$bytes ($Snap Address Snap$Usize) Bytes)
(declare-fun MemoryBlock$bytes%limited ($Snap Address Snap$Usize) Bytes)
(declare-fun MemoryBlock$bytes%stateless (Address Snap$Usize) Bool)
(declare-fun MemoryBlock$bytes%precondition ($Snap Address Snap$Usize) Bool)
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
(assert (distinct _3$place<Place> _9$place<Place> _0$place<Place> _17$place<Place> _5$place<Place> _10$place<Place> _2$place<Place> _4$place<Place> _6$place<Place> _14$place<Place> _1$place<Place> _13$place<Place> _21$place<Place> _11$place<Place> _12$place<Place>))
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
(assert (forall ((address Address)) (!
  (= (compute_address<Address> (as _1$place<Place>  Place) address) address)
  :pattern ((compute_address<Address> (as _1$place<Place>  Place) address))
  :qid |prog.root$1$compute_address_axiom|)))
(assert (forall ((address Address)) (!
  (= (compute_address<Address> (as _4$place<Place>  Place) address) address)
  :pattern ((compute_address<Address> (as _4$place<Place>  Place) address))
  :qid |prog.root$2$compute_address_axiom|)))
(assert (forall ((address Address)) (!
  (= (compute_address<Address> (as _3$place<Place>  Place) address) address)
  :pattern ((compute_address<Address> (as _3$place<Place>  Place) address))
  :qid |prog.root$3$compute_address_axiom|)))
(assert (forall ((address Address)) (!
  (= (compute_address<Address> (as _6$place<Place>  Place) address) address)
  :pattern ((compute_address<Address> (as _6$place<Place>  Place) address))
  :qid |prog.root$4$compute_address_axiom|)))
(assert (forall ((address Address)) (!
  (= (compute_address<Address> (as _5$place<Place>  Place) address) address)
  :pattern ((compute_address<Address> (as _5$place<Place>  Place) address))
  :qid |prog.root$5$compute_address_axiom|)))
(assert (forall ((address Address)) (!
  (= (compute_address<Address> (as _9$place<Place>  Place) address) address)
  :pattern ((compute_address<Address> (as _9$place<Place>  Place) address))
  :qid |prog.root$6$compute_address_axiom|)))
(assert (forall ((address Address)) (!
  (= (compute_address<Address> (as _12$place<Place>  Place) address) address)
  :pattern ((compute_address<Address> (as _12$place<Place>  Place) address))
  :qid |prog.root$7$compute_address_axiom|)))
(assert (forall ((address Address)) (!
  (= (compute_address<Address> (as _11$place<Place>  Place) address) address)
  :pattern ((compute_address<Address> (as _11$place<Place>  Place) address))
  :qid |prog.root$8$compute_address_axiom|)))
(assert (forall ((address Address)) (!
  (= (compute_address<Address> (as _14$place<Place>  Place) address) address)
  :pattern ((compute_address<Address> (as _14$place<Place>  Place) address))
  :qid |prog.root$9$compute_address_axiom|)))
(assert (forall ((address Address)) (!
  (= (compute_address<Address> (as _13$place<Place>  Place) address) address)
  :pattern ((compute_address<Address> (as _13$place<Place>  Place) address))
  :qid |prog.root$10$compute_address_axiom|)))
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
  (= (compute_address<Address> (as _17$place<Place>  Place) address) address)
  :pattern ((compute_address<Address> (as _17$place<Place>  Place) address))
  :qid |prog.root$11$compute_address_axiom|)))
(assert (forall ((address Address)) (!
  (= (compute_address<Address> (as _2$place<Place>  Place) address) address)
  :pattern ((compute_address<Address> (as _2$place<Place>  Place) address))
  :qid |prog.root$12$compute_address_axiom|)))
(assert (forall ((address Address)) (!
  (= (compute_address<Address> (as _10$place<Place>  Place) address) address)
  :pattern ((compute_address<Address> (as _10$place<Place>  Place) address))
  :qid |prog.root$13$compute_address_axiom|)))
(assert (forall ((address Address)) (!
  (= (compute_address<Address> (as _21$place<Place>  Place) address) address)
  :pattern ((compute_address<Address> (as _21$place<Place>  Place) address))
  :qid |prog.root$14$compute_address_axiom|)))
(assert (forall ((address Address)) (!
  (= (compute_address<Address> (as _0$place<Place>  Place) address) address)
  :pattern ((compute_address<Address> (as _0$place<Place>  Place) address))
  :qid |prog.root$15$compute_address_axiom|)))
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
      (constructor$Snap$Bool$GtCmp_I64<Snap$Bool> (constructor$Snap$I64$<Snap$I64> left) (constructor$Snap$I64$<Snap$I64> right))
      (constructor$Snap$Bool$<Snap$Bool> (> left right))))
  :pattern ((constructor$Snap$Bool$GtCmp_I64<Snap$Bool> (constructor$Snap$I64$<Snap$I64> left) (constructor$Snap$I64$<Snap$I64> right)))
  :qid |prog.GtCmp_I64$simplification_axiom|)))
(assert (forall ((left Snap$I64) (right Snap$I64)) (!
  (=
    (destructor$Snap$Bool$$value<Bool> (constructor$Snap$Bool$GtCmp_I64<Snap$Bool> left right))
    (>
      (destructor$Snap$I64$$value<Int> left)
      (destructor$Snap$I64$$value<Int> right)))
  :pattern ((destructor$Snap$Bool$$value<Bool> (constructor$Snap$Bool$GtCmp_I64<Snap$Bool> left right)))
  :qid |prog.GtCmp_I64$eval_axiom|)))
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
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ------------------------------------------------------------
; Begin function- and predicate-related preamble
; Declaring symbols related to program functions (from verification)
(declare-fun $k@3@00 () $Perm)
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
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- m_valid_nested_loop$CoreProof ----------
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
; var _0$snapshot$0: Snap$Tuple$$$
(declare-const _0$snapshot$0@1@01 Snap$Tuple$$$)
; [exec]
; var _0$snapshot$1: Snap$Tuple$$$
(declare-const _0$snapshot$1@2@01 Snap$Tuple$$$)
; [exec]
; var _0$snapshot$2: Snap$Tuple$$$
(declare-const _0$snapshot$2@3@01 Snap$Tuple$$$)
; [exec]
; var _1$address: Address
(declare-const _1$address@4@01 Address)
; [exec]
; var _1$snapshot$0: Snap$I64
(declare-const _1$snapshot$0@5@01 Snap$I64)
; [exec]
; var _1$snapshot$1: Snap$I64
(declare-const _1$snapshot$1@6@01 Snap$I64)
; [exec]
; var _1$snapshot$2: Snap$I64
(declare-const _1$snapshot$2@7@01 Snap$I64)
; [exec]
; var _1$snapshot$3: Snap$I64
(declare-const _1$snapshot$3@8@01 Snap$I64)
; [exec]
; var _1$snapshot$4: Snap$I64
(declare-const _1$snapshot$4@9@01 Snap$I64)
; [exec]
; var _1$snapshot$5: Snap$I64
(declare-const _1$snapshot$5@10@01 Snap$I64)
; [exec]
; var _10$address: Address
(declare-const _10$address@11@01 Address)
; [exec]
; var _10$snapshot$0: Snap$Tuple$$$
(declare-const _10$snapshot$0@12@01 Snap$Tuple$$$)
; [exec]
; var _10$snapshot$1: Snap$Tuple$$$
(declare-const _10$snapshot$1@13@01 Snap$Tuple$$$)
; [exec]
; var _10$snapshot$2: Snap$Tuple$$$
(declare-const _10$snapshot$2@14@01 Snap$Tuple$$$)
; [exec]
; var _10$snapshot$3: Snap$Tuple$$$
(declare-const _10$snapshot$3@15@01 Snap$Tuple$$$)
; [exec]
; var _10$snapshot$4: Snap$Tuple$$$
(declare-const _10$snapshot$4@16@01 Snap$Tuple$$$)
; [exec]
; var _10$snapshot$5: Snap$Tuple$$$
(declare-const _10$snapshot$5@17@01 Snap$Tuple$$$)
; [exec]
; var _11$address: Address
(declare-const _11$address@18@01 Address)
; [exec]
; var _11$snapshot$0: Snap$Bool
(declare-const _11$snapshot$0@19@01 Snap$Bool)
; [exec]
; var _11$snapshot$1: Snap$Bool
(declare-const _11$snapshot$1@20@01 Snap$Bool)
; [exec]
; var _11$snapshot$2: Snap$Bool
(declare-const _11$snapshot$2@21@01 Snap$Bool)
; [exec]
; var _11$snapshot$3: Snap$Bool
(declare-const _11$snapshot$3@22@01 Snap$Bool)
; [exec]
; var _11$snapshot$4: Snap$Bool
(declare-const _11$snapshot$4@23@01 Snap$Bool)
; [exec]
; var _11$snapshot$5: Snap$Bool
(declare-const _11$snapshot$5@24@01 Snap$Bool)
; [exec]
; var _11$snapshot$6: Snap$Bool
(declare-const _11$snapshot$6@25@01 Snap$Bool)
; [exec]
; var _11$snapshot$7: Snap$Bool
(declare-const _11$snapshot$7@26@01 Snap$Bool)
; [exec]
; var _12$address: Address
(declare-const _12$address@27@01 Address)
; [exec]
; var _12$snapshot$0: Snap$I64
(declare-const _12$snapshot$0@28@01 Snap$I64)
; [exec]
; var _12$snapshot$1: Snap$I64
(declare-const _12$snapshot$1@29@01 Snap$I64)
; [exec]
; var _12$snapshot$2: Snap$I64
(declare-const _12$snapshot$2@30@01 Snap$I64)
; [exec]
; var _12$snapshot$3: Snap$I64
(declare-const _12$snapshot$3@31@01 Snap$I64)
; [exec]
; var _12$snapshot$4: Snap$I64
(declare-const _12$snapshot$4@32@01 Snap$I64)
; [exec]
; var _12$snapshot$5: Snap$I64
(declare-const _12$snapshot$5@33@01 Snap$I64)
; [exec]
; var _12$snapshot$6: Snap$I64
(declare-const _12$snapshot$6@34@01 Snap$I64)
; [exec]
; var _12$snapshot$7: Snap$I64
(declare-const _12$snapshot$7@35@01 Snap$I64)
; [exec]
; var _13$address: Address
(declare-const _13$address@36@01 Address)
; [exec]
; var _13$snapshot$0: Snap$Tuple$$$
(declare-const _13$snapshot$0@37@01 Snap$Tuple$$$)
; [exec]
; var _13$snapshot$1: Snap$Tuple$$$
(declare-const _13$snapshot$1@38@01 Snap$Tuple$$$)
; [exec]
; var _13$snapshot$2: Snap$Tuple$$$
(declare-const _13$snapshot$2@39@01 Snap$Tuple$$$)
; [exec]
; var _13$snapshot$3: Snap$Tuple$$$
(declare-const _13$snapshot$3@40@01 Snap$Tuple$$$)
; [exec]
; var _13$snapshot$4: Snap$Tuple$$$
(declare-const _13$snapshot$4@41@01 Snap$Tuple$$$)
; [exec]
; var _13$snapshot$5: Snap$Tuple$$$
(declare-const _13$snapshot$5@42@01 Snap$Tuple$$$)
; [exec]
; var _13$snapshot$6: Snap$Tuple$$$
(declare-const _13$snapshot$6@43@01 Snap$Tuple$$$)
; [exec]
; var _14$address: Address
(declare-const _14$address@44@01 Address)
; [exec]
; var _14$snapshot$0: Snap$Bool
(declare-const _14$snapshot$0@45@01 Snap$Bool)
; [exec]
; var _14$snapshot$1: Snap$Bool
(declare-const _14$snapshot$1@46@01 Snap$Bool)
; [exec]
; var _14$snapshot$2: Snap$Bool
(declare-const _14$snapshot$2@47@01 Snap$Bool)
; [exec]
; var _14$snapshot$3: Snap$Bool
(declare-const _14$snapshot$3@48@01 Snap$Bool)
; [exec]
; var _14$snapshot$4: Snap$Bool
(declare-const _14$snapshot$4@49@01 Snap$Bool)
; [exec]
; var _14$snapshot$5: Snap$Bool
(declare-const _14$snapshot$5@50@01 Snap$Bool)
; [exec]
; var _14$snapshot$6: Snap$Bool
(declare-const _14$snapshot$6@51@01 Snap$Bool)
; [exec]
; var _14$snapshot$7: Snap$Bool
(declare-const _14$snapshot$7@52@01 Snap$Bool)
; [exec]
; var _17$address: Address
(declare-const _17$address@53@01 Address)
; [exec]
; var _17$snapshot$0: Snap$Tuple$$I64$Bool$$I64$Bool$
(declare-const _17$snapshot$0@54@01 Snap$Tuple$$I64$Bool$$I64$Bool$)
; [exec]
; var _17$snapshot$1: Snap$Tuple$$I64$Bool$$I64$Bool$
(declare-const _17$snapshot$1@55@01 Snap$Tuple$$I64$Bool$$I64$Bool$)
; [exec]
; var _17$snapshot$2: Snap$Tuple$$I64$Bool$$I64$Bool$
(declare-const _17$snapshot$2@56@01 Snap$Tuple$$I64$Bool$$I64$Bool$)
; [exec]
; var _17$snapshot$3: Snap$Tuple$$I64$Bool$$I64$Bool$
(declare-const _17$snapshot$3@57@01 Snap$Tuple$$I64$Bool$$I64$Bool$)
; [exec]
; var _17$snapshot$4: Snap$Tuple$$I64$Bool$$I64$Bool$
(declare-const _17$snapshot$4@58@01 Snap$Tuple$$I64$Bool$$I64$Bool$)
; [exec]
; var _17$snapshot$5: Snap$Tuple$$I64$Bool$$I64$Bool$
(declare-const _17$snapshot$5@59@01 Snap$Tuple$$I64$Bool$$I64$Bool$)
; [exec]
; var _17$snapshot$6: Snap$Tuple$$I64$Bool$$I64$Bool$
(declare-const _17$snapshot$6@60@01 Snap$Tuple$$I64$Bool$$I64$Bool$)
; [exec]
; var _19$address: Address
(declare-const _19$address@61@01 Address)
; [exec]
; var _2$address: Address
(declare-const _2$address@62@01 Address)
; [exec]
; var _2$snapshot$0: Snap$Tuple$$$
(declare-const _2$snapshot$0@63@01 Snap$Tuple$$$)
; [exec]
; var _2$snapshot$1: Snap$Tuple$$$
(declare-const _2$snapshot$1@64@01 Snap$Tuple$$$)
; [exec]
; var _2$snapshot$2: Snap$Tuple$$$
(declare-const _2$snapshot$2@65@01 Snap$Tuple$$$)
; [exec]
; var _2$snapshot$3: Snap$Tuple$$$
(declare-const _2$snapshot$3@66@01 Snap$Tuple$$$)
; [exec]
; var _2$snapshot$4: Snap$Tuple$$$
(declare-const _2$snapshot$4@67@01 Snap$Tuple$$$)
; [exec]
; var _2$snapshot$5: Snap$Tuple$$$
(declare-const _2$snapshot$5@68@01 Snap$Tuple$$$)
; [exec]
; var _2$snapshot$6: Snap$Tuple$$$
(declare-const _2$snapshot$6@69@01 Snap$Tuple$$$)
; [exec]
; var _2$snapshot$7: Snap$Tuple$$$
(declare-const _2$snapshot$7@70@01 Snap$Tuple$$$)
; [exec]
; var _21$address: Address
(declare-const _21$address@71@01 Address)
; [exec]
; var _21$snapshot$0: Snap$Tuple$$I64$Bool$$I64$Bool$
(declare-const _21$snapshot$0@72@01 Snap$Tuple$$I64$Bool$$I64$Bool$)
; [exec]
; var _21$snapshot$1: Snap$Tuple$$I64$Bool$$I64$Bool$
(declare-const _21$snapshot$1@73@01 Snap$Tuple$$I64$Bool$$I64$Bool$)
; [exec]
; var _21$snapshot$2: Snap$Tuple$$I64$Bool$$I64$Bool$
(declare-const _21$snapshot$2@74@01 Snap$Tuple$$I64$Bool$$I64$Bool$)
; [exec]
; var _21$snapshot$3: Snap$Tuple$$I64$Bool$$I64$Bool$
(declare-const _21$snapshot$3@75@01 Snap$Tuple$$I64$Bool$$I64$Bool$)
; [exec]
; var _21$snapshot$4: Snap$Tuple$$I64$Bool$$I64$Bool$
(declare-const _21$snapshot$4@76@01 Snap$Tuple$$I64$Bool$$I64$Bool$)
; [exec]
; var _21$snapshot$5: Snap$Tuple$$I64$Bool$$I64$Bool$
(declare-const _21$snapshot$5@77@01 Snap$Tuple$$I64$Bool$$I64$Bool$)
; [exec]
; var _23$address: Address
(declare-const _23$address@78@01 Address)
; [exec]
; var _3$address: Address
(declare-const _3$address@79@01 Address)
; [exec]
; var _3$snapshot$0: Snap$Bool
(declare-const _3$snapshot$0@80@01 Snap$Bool)
; [exec]
; var _3$snapshot$1: Snap$Bool
(declare-const _3$snapshot$1@81@01 Snap$Bool)
; [exec]
; var _3$snapshot$2: Snap$Bool
(declare-const _3$snapshot$2@82@01 Snap$Bool)
; [exec]
; var _3$snapshot$3: Snap$Bool
(declare-const _3$snapshot$3@83@01 Snap$Bool)
; [exec]
; var _3$snapshot$4: Snap$Bool
(declare-const _3$snapshot$4@84@01 Snap$Bool)
; [exec]
; var _3$snapshot$5: Snap$Bool
(declare-const _3$snapshot$5@85@01 Snap$Bool)
; [exec]
; var _4$address: Address
(declare-const _4$address@86@01 Address)
; [exec]
; var _4$snapshot$0: Snap$I64
(declare-const _4$snapshot$0@87@01 Snap$I64)
; [exec]
; var _4$snapshot$1: Snap$I64
(declare-const _4$snapshot$1@88@01 Snap$I64)
; [exec]
; var _4$snapshot$2: Snap$I64
(declare-const _4$snapshot$2@89@01 Snap$I64)
; [exec]
; var _4$snapshot$3: Snap$I64
(declare-const _4$snapshot$3@90@01 Snap$I64)
; [exec]
; var _4$snapshot$4: Snap$I64
(declare-const _4$snapshot$4@91@01 Snap$I64)
; [exec]
; var _4$snapshot$5: Snap$I64
(declare-const _4$snapshot$5@92@01 Snap$I64)
; [exec]
; var _5$address: Address
(declare-const _5$address@93@01 Address)
; [exec]
; var _5$snapshot$0: Snap$Tuple$$$
(declare-const _5$snapshot$0@94@01 Snap$Tuple$$$)
; [exec]
; var _5$snapshot$1: Snap$Tuple$$$
(declare-const _5$snapshot$1@95@01 Snap$Tuple$$$)
; [exec]
; var _5$snapshot$2: Snap$Tuple$$$
(declare-const _5$snapshot$2@96@01 Snap$Tuple$$$)
; [exec]
; var _5$snapshot$3: Snap$Tuple$$$
(declare-const _5$snapshot$3@97@01 Snap$Tuple$$$)
; [exec]
; var _6$address: Address
(declare-const _6$address@98@01 Address)
; [exec]
; var _6$snapshot$0: Snap$Bool
(declare-const _6$snapshot$0@99@01 Snap$Bool)
; [exec]
; var _6$snapshot$1: Snap$Bool
(declare-const _6$snapshot$1@100@01 Snap$Bool)
; [exec]
; var _6$snapshot$2: Snap$Bool
(declare-const _6$snapshot$2@101@01 Snap$Bool)
; [exec]
; var _6$snapshot$3: Snap$Bool
(declare-const _6$snapshot$3@102@01 Snap$Bool)
; [exec]
; var _6$snapshot$4: Snap$Bool
(declare-const _6$snapshot$4@103@01 Snap$Bool)
; [exec]
; var _6$snapshot$5: Snap$Bool
(declare-const _6$snapshot$5@104@01 Snap$Bool)
; [exec]
; var _9$address: Address
(declare-const _9$address@105@01 Address)
; [exec]
; var _9$snapshot$0: Snap$I64
(declare-const _9$snapshot$0@106@01 Snap$I64)
; [exec]
; var _9$snapshot$1: Snap$I64
(declare-const _9$snapshot$1@107@01 Snap$I64)
; [exec]
; var _9$snapshot$2: Snap$I64
(declare-const _9$snapshot$2@108@01 Snap$I64)
; [exec]
; var _9$snapshot$3: Snap$I64
(declare-const _9$snapshot$3@109@01 Snap$I64)
; [exec]
; var _9$snapshot$4: Snap$I64
(declare-const _9$snapshot$4@110@01 Snap$I64)
; [exec]
; var _9$snapshot$5: Snap$I64
(declare-const _9$snapshot$5@111@01 Snap$I64)
; [exec]
; var _9$snapshot$6: Snap$I64
(declare-const _9$snapshot$6@112@01 Snap$I64)
; [exec]
; var _9$snapshot$7: Snap$I64
(declare-const _9$snapshot$7@113@01 Snap$I64)
; [exec]
; var _9$snapshot$8: Snap$I64
(declare-const _9$snapshot$8@114@01 Snap$I64)
; [exec]
; var bw2$snapshot$0: Lifetime
(declare-const bw2$snapshot$0@115@01 Lifetime)
; [exec]
; var bw3$snapshot$0: Lifetime
(declare-const bw3$snapshot$0@116@01 Lifetime)
; [exec]
; var end_label$marker: Bool
(declare-const end_label$marker@117@01 Bool)
; [exec]
; var label_3_custom$marker: Bool
(declare-const label_3_custom$marker@118@01 Bool)
; [exec]
; var label_4_custom$marker: Bool
(declare-const label_4_custom$marker@119@01 Bool)
; [exec]
; var label_5_custom$marker: Bool
(declare-const label_5_custom$marker@120@01 Bool)
; [exec]
; var label_6_custom$marker: Bool
(declare-const label_6_custom$marker@121@01 Bool)
; [exec]
; var label_bb0$marker: Bool
(declare-const label_bb0$marker@122@01 Bool)
; [exec]
; var label_bb1$marker: Bool
(declare-const label_bb1$marker@123@01 Bool)
; [exec]
; var label_bb11$marker: Bool
(declare-const label_bb11$marker@124@01 Bool)
; [exec]
; var label_bb12$marker: Bool
(declare-const label_bb12$marker@125@01 Bool)
; [exec]
; var label_bb13$marker: Bool
(declare-const label_bb13$marker@126@01 Bool)
; [exec]
; var label_bb14$marker: Bool
(declare-const label_bb14$marker@127@01 Bool)
; [exec]
; var label_bb15$marker: Bool
(declare-const label_bb15$marker@128@01 Bool)
; [exec]
; var label_bb16$marker: Bool
(declare-const label_bb16$marker@129@01 Bool)
; [exec]
; var label_bb17$marker: Bool
(declare-const label_bb17$marker@130@01 Bool)
; [exec]
; var label_bb2$marker: Bool
(declare-const label_bb2$marker@131@01 Bool)
; [exec]
; var label_bb3$marker: Bool
(declare-const label_bb3$marker@132@01 Bool)
; [exec]
; var label_bb5$marker: Bool
(declare-const label_bb5$marker@133@01 Bool)
; [exec]
; var label_bb6$marker: Bool
(declare-const label_bb6$marker@134@01 Bool)
; [exec]
; var label_bb7$marker: Bool
(declare-const label_bb7$marker@135@01 Bool)
; [exec]
; var label_bb8$marker: Bool
(declare-const label_bb8$marker@136@01 Bool)
; [exec]
; var label_bb9$marker: Bool
(declare-const label_bb9$marker@137@01 Bool)
; [exec]
; var label_entry$marker: Bool
(declare-const label_entry$marker@138@01 Bool)
; [exec]
; var lft_0$snapshot$1: Lifetime
(declare-const lft_0$snapshot$1@139@01 Lifetime)
; [exec]
; var lft_1$snapshot$1: Lifetime
(declare-const lft_1$snapshot$1@140@01 Lifetime)
; [exec]
; var lifetime_token_perm_amount$0$snapshot$0: Perm
(declare-const lifetime_token_perm_amount$0$snapshot$0@141@01 $Perm)
; [exec]
; var loop__label_bb1__label_4_custom$marker: Bool
(declare-const loop__label_bb1__label_4_custom$marker@142@01 Bool)
; [exec]
; var loop__label_bb1__label_bb1$marker: Bool
(declare-const loop__label_bb1__label_bb1$marker@143@01 Bool)
; [exec]
; var loop__label_bb1__label_bb2$marker: Bool
(declare-const loop__label_bb1__label_bb2$marker@144@01 Bool)
; [exec]
; var loop__label_bb1__label_bb3$marker: Bool
(declare-const loop__label_bb1__label_bb3$marker@145@01 Bool)
; [exec]
; var loop__label_bb7__label_6_custom$marker: Bool
(declare-const loop__label_bb7__label_6_custom$marker@146@01 Bool)
; [exec]
; var loop__label_bb7__label_bb7$marker: Bool
(declare-const loop__label_bb7__label_bb7$marker@147@01 Bool)
; [exec]
; var loop__label_bb7__label_bb8$marker: Bool
(declare-const loop__label_bb7__label_bb8$marker@148@01 Bool)
; [exec]
; var loop__label_bb7__label_bb9$marker: Bool
(declare-const loop__label_bb7__label_bb9$marker@149@01 Bool)
; [exec]
; var loop_variant$1$snapshot$0: Snap$Unbounded
(declare-const loop_variant$1$snapshot$0@150@01 Snap$Unbounded)
; [exec]
; var loop_variant$1$snapshot$1: Snap$Unbounded
(declare-const loop_variant$1$snapshot$1@151@01 Snap$Unbounded)
; [exec]
; var loop_variant$1$snapshot$2: Snap$Unbounded
(declare-const loop_variant$1$snapshot$2@152@01 Snap$Unbounded)
; [exec]
; var loop_variant$1$snapshot$3: Snap$Unbounded
(declare-const loop_variant$1$snapshot$3@153@01 Snap$Unbounded)
; [exec]
; var loop_variant$1$snapshot$4: Snap$Unbounded
(declare-const loop_variant$1$snapshot$4@154@01 Snap$Unbounded)
; [exec]
; var loop_variant$2$snapshot$0: Snap$Unbounded
(declare-const loop_variant$2$snapshot$0@155@01 Snap$Unbounded)
; [exec]
; var loop_variant$2$snapshot$1: Snap$Unbounded
(declare-const loop_variant$2$snapshot$1@156@01 Snap$Unbounded)
; [exec]
; var loop_variant$2$snapshot$2: Snap$Unbounded
(declare-const loop_variant$2$snapshot$2@157@01 Snap$Unbounded)
; [exec]
; var loop_variant$2$snapshot$3: Snap$Unbounded
(declare-const loop_variant$2$snapshot$3@158@01 Snap$Unbounded)
; [exec]
; var loop_variant$2$snapshot$4: Snap$Unbounded
(declare-const loop_variant$2$snapshot$4@159@01 Snap$Unbounded)
; [exec]
; var loop_variant$2$snapshot$5: Snap$Unbounded
(declare-const loop_variant$2$snapshot$5@160@01 Snap$Unbounded)
; [exec]
; var loop_variant$2$snapshot$6: Snap$Unbounded
(declare-const loop_variant$2$snapshot$6@161@01 Snap$Unbounded)
; [exec]
; var loop_variant$2$snapshot$7: Snap$Unbounded
(declare-const loop_variant$2$snapshot$7@162@01 Snap$Unbounded)
; [exec]
; var magic_label$marker: Bool
(declare-const magic_label$marker@163@01 Bool)
; [exec]
; var resume_panic_label$marker: Bool
(declare-const resume_panic_label$marker@164@01 Bool)
; [exec]
; var return_label$marker: Bool
(declare-const return_label$marker@165@01 Bool)
; [exec]
; var start_label$marker: Bool
(declare-const start_label$marker@166@01 Bool)
; [exec]
; var tmp$0: Snap$Bool
(declare-const tmp$0@167@01 Snap$Bool)
; [exec]
; var tmp$1: Snap$I64
(declare-const tmp$1@168@01 Snap$I64)
; [exec]
; var tmp$2: Snap$Unbounded
(declare-const tmp$2@169@01 Snap$Unbounded)
; [exec]
; var tmp$3: Snap$Bool
(declare-const tmp$3@170@01 Snap$Bool)
; [exec]
; var tmp$4: Snap$I64
(declare-const tmp$4@171@01 Snap$I64)
; [exec]
; var tmp$5: Snap$Unbounded
(declare-const tmp$5@172@01 Snap$Unbounded)
; [exec]
; var tmp$6: Snap$Tuple$$I64$Bool$$I64$Bool$
(declare-const tmp$6@173@01 Snap$Tuple$$I64$Bool$$I64$Bool$)
; [exec]
; var tmp$7: Snap$Bool
(declare-const tmp$7@174@01 Snap$Bool)
; [exec]
; var tmp$8: Snap$Tuple$$I64$Bool$$I64$Bool$
(declare-const tmp$8@175@01 Snap$Tuple$$I64$Bool$$I64$Bool$)
; [exec]
; var tmp$9: Snap$Bool
(declare-const tmp$9@176@01 Snap$Bool)
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
; label_4_custom$marker := false
; [exec]
; label_bb3$marker := false
; [exec]
; label_bb5$marker := false
; [exec]
; label_bb6$marker := false
; [exec]
; label_bb7$marker := false
; [exec]
; label_bb8$marker := false
; [exec]
; label_6_custom$marker := false
; [exec]
; label_bb9$marker := false
; [exec]
; label_bb11$marker := false
; [exec]
; label_bb12$marker := false
; [exec]
; label_bb13$marker := false
; [exec]
; loop__label_bb7__label_bb7$marker := false
; [exec]
; loop__label_bb7__label_bb8$marker := false
; [exec]
; loop__label_bb7__label_6_custom$marker := false
; [exec]
; loop__label_bb7__label_bb9$marker := false
; [exec]
; label_5_custom$marker := false
; [exec]
; label_bb14$marker := false
; [exec]
; label_bb17$marker := false
; [exec]
; resume_panic_label$marker := false
; [exec]
; label_bb15$marker := false
; [exec]
; loop__label_bb1__label_bb1$marker := false
; [exec]
; loop__label_bb1__label_bb2$marker := false
; [exec]
; loop__label_bb1__label_4_custom$marker := false
; [exec]
; loop__label_bb1__label_bb3$marker := false
; [exec]
; magic_label$marker := false
; [exec]
; label_3_custom$marker := false
; [exec]
; label_bb16$marker := false
; [exec]
; return_label$marker := false
; [exec]
; end_label$marker := false
; [exec]
; start_label$marker := true
; [exec]
; inhale basic_block_marker$start_label$marker()
(declare-const $t@177@01 $Snap)
(assert (= $t@177@01 $Snap.unit))
; [eval] basic_block_marker$start_label$marker()
(assert (as basic_block_marker$start_label$marker<Bool>  Bool))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale lifetime_token_perm_amount$0$snapshot$0 > none
(declare-const $t@178@01 $Snap)
(assert (= $t@178@01 $Snap.unit))
; [eval] lifetime_token_perm_amount$0$snapshot$0 > none
(assert (> lifetime_token_perm_amount$0$snapshot$0@141@01 $Perm.No))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale lifetime_token_perm_amount$0$snapshot$0 < write
(declare-const $t@179@01 $Snap)
(assert (= $t@179@01 $Snap.unit))
; [eval] lifetime_token_perm_amount$0$snapshot$0 < write
(assert (< lifetime_token_perm_amount$0$snapshot$0@141@01 $Perm.Write))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale acc(LifetimeToken(bw2$snapshot$0), lifetime_token_perm_amount$0$snapshot$0)
(set-option :timeout 0)
(push) ; 3
(assert (not (or
  (= lifetime_token_perm_amount$0$snapshot$0@141@01 $Perm.No)
  (< $Perm.No lifetime_token_perm_amount$0$snapshot$0@141@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(declare-const $t@180@01 $Snap)
(assert (<= $Perm.No lifetime_token_perm_amount$0$snapshot$0@141@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(LifetimeToken(bw3$snapshot$0), lifetime_token_perm_amount$0$snapshot$0)
(set-option :timeout 0)
(push) ; 3
(assert (not (or
  (= lifetime_token_perm_amount$0$snapshot$0@141@01 $Perm.No)
  (< $Perm.No lifetime_token_perm_amount$0$snapshot$0@141@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(declare-const $t@181@01 $Snap)
(push) ; 3
(set-option :timeout 10)
(assert (not (= bw2$snapshot$0@115@01 bw3$snapshot$0@116@01)))
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
; lft_0$snapshot$1 := bw2$snapshot$0
; [exec]
; lft_1$snapshot$1 := lft_tok_sep_take$2(bw2$snapshot$0, bw3$snapshot$0, lifetime_token_perm_amount$0$snapshot$0 /
;   16)
; [eval] lifetime_token_perm_amount$0$snapshot$0 / 16
; [eval] none < rd_perm
(set-option :timeout 0)
(push) ; 3
(assert (not (< $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@141@01 (to_real 16)))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (< $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@141@01 (to_real 16))))
(push) ; 3
(assert (not (or
  (= (/ lifetime_token_perm_amount$0$snapshot$0@141@01 (to_real 16)) $Perm.No)
  (< $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@141@01 (to_real 16))))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  (-
    lifetime_token_perm_amount$0$snapshot$0@141@01
    ($Perm.min
      lifetime_token_perm_amount$0$snapshot$0@141@01
      (/ lifetime_token_perm_amount$0$snapshot$0@141@01 (to_real 16))))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (<=
  $Perm.No
  (-
    lifetime_token_perm_amount$0$snapshot$0@141@01
    ($Perm.min
      lifetime_token_perm_amount$0$snapshot$0@141@01
      (/ lifetime_token_perm_amount$0$snapshot$0@141@01 (to_real 16))))))
(set-option :timeout 0)
(push) ; 3
(assert (not (or
  (=
    (-
      (/ lifetime_token_perm_amount$0$snapshot$0@141@01 (to_real 16))
      ($Perm.min
        lifetime_token_perm_amount$0$snapshot$0@141@01
        (/ lifetime_token_perm_amount$0$snapshot$0@141@01 (to_real 16))))
    $Perm.No)
  (<
    (-
      (/ lifetime_token_perm_amount$0$snapshot$0@141@01 (to_real 16))
      ($Perm.min
        lifetime_token_perm_amount$0$snapshot$0@141@01
        (/ lifetime_token_perm_amount$0$snapshot$0@141@01 (to_real 16))))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@141@01 (to_real 16)))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(assert (not (or
  (= (/ lifetime_token_perm_amount$0$snapshot$0@141@01 (to_real 16)) $Perm.No)
  (< $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@141@01 (to_real 16))))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  (-
    lifetime_token_perm_amount$0$snapshot$0@141@01
    ($Perm.min
      lifetime_token_perm_amount$0$snapshot$0@141@01
      (/ lifetime_token_perm_amount$0$snapshot$0@141@01 (to_real 16))))
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
      (/ lifetime_token_perm_amount$0$snapshot$0@141@01 (to_real 16))
      ($Perm.min
        lifetime_token_perm_amount$0$snapshot$0@141@01
        (/ lifetime_token_perm_amount$0$snapshot$0@141@01 (to_real 16))))
    $Perm.No)
  (<
    (-
      (/ lifetime_token_perm_amount$0$snapshot$0@141@01 (to_real 16))
      ($Perm.min
        lifetime_token_perm_amount$0$snapshot$0@141@01
        (/ lifetime_token_perm_amount$0$snapshot$0@141@01 (to_real 16))))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@141@01 (to_real 16)))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(declare-const lft@182@01 Lifetime)
(declare-const $t@183@01 $Snap)
(assert (= $t@183@01 ($Snap.combine ($Snap.first $t@183@01) ($Snap.second $t@183@01))))
(set-option :timeout 0)
(push) ; 3
(assert (not (or
  (= (/ lifetime_token_perm_amount$0$snapshot$0@141@01 (to_real 16)) $Perm.No)
  (< $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@141@01 (to_real 16))))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(push) ; 3
(set-option :timeout 10)
(assert (not (= bw3$snapshot$0@116@01 lft@182@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= bw2$snapshot$0@115@01 lft@182@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (<= $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@141@01 (to_real 16))))
(assert (= ($Snap.second $t@183@01) $Snap.unit))
; [eval] lft == intersect(Set(lft_1, lft_2))
; [eval] intersect(Set(lft_1, lft_2))
; [eval] Set(lft_1, lft_2)
(assert (=
  lft@182@01
  (intersect<Lifetime> (Set_unionone (Set_singleton bw2$snapshot$0@115@01) bw3$snapshot$0@116@01))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(OwnedNonAliased$I64(_1$place(), _1$address, _1$snapshot$0), write) &&
;   valid$Snap$I64(_1$snapshot$0)
(declare-const $t@184@01 $Snap)
(assert (= $t@184@01 ($Snap.combine ($Snap.first $t@184@01) ($Snap.second $t@184@01))))
; [eval] _1$place()
(assert (= ($Snap.second $t@184@01) $Snap.unit))
; [eval] valid$Snap$I64(_1$snapshot$0)
(assert (valid$Snap$I64<Bool> _1$snapshot$0@5@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlock(_0$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
(declare-const $t@185@01 $Snap)
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlock(_2$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
(declare-const $t@186@01 $Snap)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= _0$address@0@01 _2$address@62@01)))
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
; inhale acc(MemoryBlock(_17$address, Size$Tuple$$I64$Bool$$I64$Bool$$()), write)
; [eval] Size$Tuple$$I64$Bool$$I64$Bool$$()
(declare-const $t@187@01 $Snap)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (= _0$address@0@01 _17$address@53@01)
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
  (= _2$address@62@01 _17$address@53@01)
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
; inhale acc(MemoryBlock(_21$address, Size$Tuple$$I64$Bool$$I64$Bool$$()), write)
; [eval] Size$Tuple$$I64$Bool$$I64$Bool$$()
(declare-const $t@188@01 $Snap)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (= _2$address@62@01 _21$address@71@01)
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
  (= _0$address@0@01 _21$address@71@01)
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
(assert (not (= _17$address@53@01 _21$address@71@01)))
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
(declare-const $t@189@01 $Snap)
(assert (= $t@189@01 $Snap.unit))
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
(declare-const $t@190@01 $Snap)
(assert (= $t@190@01 $Snap.unit))
; [eval] basic_block_marker$label_bb0$marker()
(assert (as basic_block_marker$label_bb0$marker<Bool>  Bool))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; label label_bb1
; [exec]
; label_bb1$marker := true
; [exec]
; inhale basic_block_marker$label_bb1$marker()
(declare-const $t@191@01 $Snap)
(assert (= $t@191@01 $Snap.unit))
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
(declare-const $t@192@01 $Snap)
(assert (= $t@192@01 $Snap.unit))
; [eval] basic_block_marker$label_bb2$marker()
(assert (as basic_block_marker$label_bb2$marker<Bool>  Bool))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlock(_3$address, Size$Bool$()), write)
; [eval] Size$Bool$()
(declare-const $t@193@01 $Snap)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (= _17$address@53@01 _3$address@79@01)
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
  (= _0$address@0@01 _3$address@79@01)
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
  (= _2$address@62@01 _3$address@79@01)
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
  (= _21$address@71@01 _3$address@79@01)
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
; inhale acc(MemoryBlockStackDrop(_3$address, Size$Bool$()), write)
; [eval] Size$Bool$()
(declare-const $t@194@01 $Snap)
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlock(_4$address, Size$I64$()), write)
; [eval] Size$I64$()
(declare-const $t@195@01 $Snap)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (= _3$address@79@01 _4$address@86@01)
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
  (= _17$address@53@01 _4$address@86@01)
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
  (= _0$address@0@01 _4$address@86@01)
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
  (= _2$address@62@01 _4$address@86@01)
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
  (= _21$address@71@01 _4$address@86@01)
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
(declare-const $t@196@01 $Snap)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (= _3$address@79@01 _4$address@86@01)
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
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
; copy_place$I64(_4$place(), _4$address, _1$place(), _1$address, _1$snapshot$0,
;   write)
; [eval] _4$place()
; [eval] _1$place()
; [eval] none < source_permission_amount
; [eval] compute_address(target_place, target_root_address)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (=
    _21$address@71@01
    (compute_address<Address> (as _4$place<Place>  Place) _4$address@86@01))
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
    _2$address@62@01
    (compute_address<Address> (as _4$place<Place>  Place) _4$address@86@01))
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
    _0$address@0@01
    (compute_address<Address> (as _4$place<Place>  Place) _4$address@86@01))
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
    _17$address@53@01
    (compute_address<Address> (as _4$place<Place>  Place) _4$address@86@01))
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
    _3$address@79@01
    (compute_address<Address> (as _4$place<Place>  Place) _4$address@86@01))
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
  _4$address@86@01
  (compute_address<Address> (as _4$place<Place>  Place) _4$address@86@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(declare-const $t@197@01 $Snap)
(assert (= $t@197@01 ($Snap.combine ($Snap.first $t@197@01) ($Snap.second $t@197@01))))
(assert (=
  ($Snap.second $t@197@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@197@01))
    ($Snap.second ($Snap.second $t@197@01)))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (= (as _1$place<Place>  Place) (as _4$place<Place>  Place))
  (= _1$address@4@01 _4$address@86@01))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (= ($Snap.second ($Snap.second $t@197@01)) $Snap.unit))
; [eval] valid$Snap$I64(source_snapshot)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _4$snapshot$1 == _1$snapshot$0
(declare-const $t@198@01 $Snap)
(assert (= $t@198@01 $Snap.unit))
; [eval] _4$snapshot$1 == _1$snapshot$0
(assert (= _4$snapshot$1@88@01 _1$snapshot$0@5@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; tmp$0 := assign$Bool$BinaryOp$GtCmp$Move$I64$Constant$I64$$$$(_3$place(), _3$address,
;   _4$place(), _4$address, _4$snapshot$1, constructor$Snap$I64$(0))
; [eval] _3$place()
; [eval] _4$place()
; [eval] constructor$Snap$I64$(0)
; [eval] compute_address(target_place, target_address)
; [eval] Size$Bool$()
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (=
    _21$address@71@01
    (compute_address<Address> (as _3$place<Place>  Place) _3$address@79@01))
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
    _2$address@62@01
    (compute_address<Address> (as _3$place<Place>  Place) _3$address@79@01))
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
    _0$address@0@01
    (compute_address<Address> (as _3$place<Place>  Place) _3$address@79@01))
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
    _17$address@53@01
    (compute_address<Address> (as _3$place<Place>  Place) _3$address@79@01))
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
(assert (not (=
  _3$address@79@01
  (compute_address<Address> (as _3$place<Place>  Place) _3$address@79@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= _1$snapshot$0@5@01 _4$snapshot$1@88@01)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; [eval] valid$Snap$I64(operand1_value)
(set-option :timeout 0)
(push) ; 3
(assert (not (valid$Snap$I64<Bool> _4$snapshot$1@88@01)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (valid$Snap$I64<Bool> _4$snapshot$1@88@01))
; [eval] valid$Snap$I64(operand2_value)
(push) ; 3
(assert (not (valid$Snap$I64<Bool> (constructor$Snap$I64$<Snap$I64> 0))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (valid$Snap$I64<Bool> (constructor$Snap$I64$<Snap$I64> 0)))
(declare-const result_value@199@01 Snap$Bool)
(declare-const $t@200@01 $Snap)
(assert (= $t@200@01 ($Snap.combine ($Snap.first $t@200@01) ($Snap.second $t@200@01))))
(assert (=
  ($Snap.second $t@200@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@200@01))
    ($Snap.second ($Snap.second $t@200@01)))))
; [eval] compute_address(operand1_place, operand1_root_address)
; [eval] Size$I64$()
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (=
    _21$address@71@01
    (compute_address<Address> (as _4$place<Place>  Place) _4$address@86@01))
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
    _2$address@62@01
    (compute_address<Address> (as _4$place<Place>  Place) _4$address@86@01))
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
    _0$address@0@01
    (compute_address<Address> (as _4$place<Place>  Place) _4$address@86@01))
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
    _17$address@53@01
    (compute_address<Address> (as _4$place<Place>  Place) _4$address@86@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second $t@200@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@200@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@200@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@200@01))) $Snap.unit))
; [eval] result_value == constructor$Snap$Bool$GtCmp_I64(operand1_value, operand2_value)
; [eval] constructor$Snap$Bool$GtCmp_I64(operand1_value, operand2_value)
(assert (=
  result_value@199@01
  (constructor$Snap$Bool$GtCmp_I64<Snap$Bool> _4$snapshot$1@88@01 (constructor$Snap$I64$<Snap$I64> 0))))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@200@01))) $Snap.unit))
; [eval] valid$Snap$Bool(result_value)
(assert (valid$Snap$Bool<Bool> result_value@199@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _3$snapshot$1 == tmp$0
(declare-const $t@201@01 $Snap)
(assert (= $t@201@01 $Snap.unit))
; [eval] _3$snapshot$1 == tmp$0
(assert (= _3$snapshot$1@81@01 result_value@199@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; exhale acc(MemoryBlock(_4$address, Size$I64$()), write)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _4$place<Place>  Place) _4$address@86@01)
  _4$address@86@01)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(MemoryBlockStackDrop(_4$address, Size$I64$()), write)
; [eval] Size$I64$()
; [eval] !destructor$Snap$Bool$$value(_3$snapshot$1)
; [eval] destructor$Snap$Bool$$value(_3$snapshot$1)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (destructor$Snap$Bool$$value<Bool> _3$snapshot$1@81@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (destructor$Snap$Bool$$value<Bool> _3$snapshot$1@81@01))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; [then-branch: 0 | !(destructor$Snap$Bool$$value[Bool](_3$snapshot$1@81@01)) | live]
; [else-branch: 0 | destructor$Snap$Bool$$value[Bool](_3$snapshot$1@81@01) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 0 | !(destructor$Snap$Bool$$value[Bool](_3$snapshot$1@81@01))]
(assert (not (destructor$Snap$Bool$$value<Bool> _3$snapshot$1@81@01)))
; [exec]
; label label__from__label_bb2__to__label_3_custom
; [exec]
; inhale _1$snapshot$4 == _1$snapshot$0
(declare-const $t@202@01 $Snap)
(assert (= $t@202@01 $Snap.unit))
; [eval] _1$snapshot$4 == _1$snapshot$0
(assert (= _1$snapshot$4@9@01 _1$snapshot$0@5@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale _10$snapshot$4 == _10$snapshot$0
(declare-const $t@203@01 $Snap)
(assert (= $t@203@01 $Snap.unit))
; [eval] _10$snapshot$4 == _10$snapshot$0
(assert (= _10$snapshot$4@16@01 _10$snapshot$0@12@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _11$snapshot$6 == _11$snapshot$0
(declare-const $t@204@01 $Snap)
(assert (= $t@204@01 $Snap.unit))
; [eval] _11$snapshot$6 == _11$snapshot$0
(assert (= _11$snapshot$6@25@01 _11$snapshot$0@19@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _12$snapshot$6 == _12$snapshot$0
(declare-const $t@205@01 $Snap)
(assert (= $t@205@01 $Snap.unit))
; [eval] _12$snapshot$6 == _12$snapshot$0
(assert (= _12$snapshot$6@34@01 _12$snapshot$0@28@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _13$snapshot$5 == _13$snapshot$0
(declare-const $t@206@01 $Snap)
(assert (= $t@206@01 $Snap.unit))
; [eval] _13$snapshot$5 == _13$snapshot$0
(assert (= _13$snapshot$5@42@01 _13$snapshot$0@37@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _14$snapshot$6 == _14$snapshot$0
(declare-const $t@207@01 $Snap)
(assert (= $t@207@01 $Snap.unit))
; [eval] _14$snapshot$6 == _14$snapshot$0
(assert (= _14$snapshot$6@51@01 _14$snapshot$0@45@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _17$snapshot$5 == _17$snapshot$0
(declare-const $t@208@01 $Snap)
(assert (= $t@208@01 $Snap.unit))
; [eval] _17$snapshot$5 == _17$snapshot$0
(assert (= _17$snapshot$5@59@01 _17$snapshot$0@54@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _2$snapshot$6 == _2$snapshot$0
(declare-const $t@209@01 $Snap)
(assert (= $t@209@01 $Snap.unit))
; [eval] _2$snapshot$6 == _2$snapshot$0
(assert (= _2$snapshot$6@69@01 _2$snapshot$0@63@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _21$snapshot$4 == _21$snapshot$0
(declare-const $t@210@01 $Snap)
(assert (= $t@210@01 $Snap.unit))
; [eval] _21$snapshot$4 == _21$snapshot$0
(assert (= _21$snapshot$4@76@01 _21$snapshot$0@72@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _3$snapshot$4 == _3$snapshot$1
(declare-const $t@211@01 $Snap)
(assert (= $t@211@01 $Snap.unit))
; [eval] _3$snapshot$4 == _3$snapshot$1
(assert (= _3$snapshot$4@84@01 _3$snapshot$1@81@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _4$snapshot$4 == _4$snapshot$1
(declare-const $t@212@01 $Snap)
(assert (= $t@212@01 $Snap.unit))
; [eval] _4$snapshot$4 == _4$snapshot$1
(assert (= _4$snapshot$4@91@01 _4$snapshot$1@88@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _5$snapshot$2 == _5$snapshot$0
(declare-const $t@213@01 $Snap)
(assert (= $t@213@01 $Snap.unit))
; [eval] _5$snapshot$2 == _5$snapshot$0
(assert (= _5$snapshot$2@96@01 _5$snapshot$0@94@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _6$snapshot$4 == _6$snapshot$0
(declare-const $t@214@01 $Snap)
(assert (= $t@214@01 $Snap.unit))
; [eval] _6$snapshot$4 == _6$snapshot$0
(assert (= _6$snapshot$4@103@01 _6$snapshot$0@99@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _9$snapshot$7 == _9$snapshot$0
(declare-const $t@215@01 $Snap)
(assert (= $t@215@01 $Snap.unit))
; [eval] _9$snapshot$7 == _9$snapshot$0
(assert (= _9$snapshot$7@113@01 _9$snapshot$0@106@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale loop_variant$1$snapshot$3 == loop_variant$1$snapshot$0
(declare-const $t@216@01 $Snap)
(assert (= $t@216@01 $Snap.unit))
; [eval] loop_variant$1$snapshot$3 == loop_variant$1$snapshot$0
(assert (= loop_variant$1$snapshot$3@153@01 loop_variant$1$snapshot$0@150@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale loop_variant$2$snapshot$6 == loop_variant$2$snapshot$0
(declare-const $t@217@01 $Snap)
(assert (= $t@217@01 $Snap.unit))
; [eval] loop_variant$2$snapshot$6 == loop_variant$2$snapshot$0
(assert (= loop_variant$2$snapshot$6@161@01 loop_variant$2$snapshot$0@155@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; label label_3_custom
; [exec]
; label_3_custom$marker := true
; [exec]
; inhale basic_block_marker$label_3_custom$marker()
(declare-const $t@218@01 $Snap)
(assert (= $t@218@01 $Snap.unit))
; [eval] basic_block_marker$label_3_custom$marker()
(assert (as basic_block_marker$label_3_custom$marker<Bool>  Bool))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; label label_bb16
; [exec]
; label_bb16$marker := true
; [exec]
; inhale basic_block_marker$label_bb16$marker()
(declare-const $t@219@01 $Snap)
(assert (= $t@219@01 $Snap.unit))
; [eval] basic_block_marker$label_bb16$marker()
(assert (as basic_block_marker$label_bb16$marker<Bool>  Bool))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlock(_23$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
(declare-const $t@220@01 $Snap)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (= _17$address@53@01 _23$address@78@01)
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
(assert (not (= _0$address@0@01 _23$address@78@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= _2$address@62@01 _23$address@78@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (= _21$address@71@01 _23$address@78@01)
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
; inhale acc(MemoryBlockStackDrop(_23$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
(declare-const $t@221@01 $Snap)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (= _3$address@79@01 _23$address@78@01)
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
; write_place_constant$Tuple$$$(_0$place(), _0$address, constructor$Snap$Tuple$$$$())
; [eval] _0$place()
; [eval] constructor$Snap$Tuple$$$$()
; [eval] compute_address(target_place, target_root_address)
; [eval] Size$Tuple$$$$()
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (=
    _21$address@71@01
    (compute_address<Address> (as _0$place<Place>  Place) _0$address@0@01))
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
(assert (not (=
  _2$address@62@01
  (compute_address<Address> (as _0$place<Place>  Place) _0$address@0@01))))
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
(declare-const $t@222@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _0$snapshot$1 == constructor$Snap$Tuple$$$$()
(declare-const $t@223@01 $Snap)
(assert (= $t@223@01 $Snap.unit))
; [eval] _0$snapshot$1 == constructor$Snap$Tuple$$$$()
; [eval] constructor$Snap$Tuple$$$$()
(assert (=
  _0$snapshot$1@2@01
  (as constructor$Snap$Tuple$$$$<Snap$Tuple$$$>  Snap$Tuple$$$)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; exhale acc(MemoryBlock(_23$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
; [exec]
; exhale acc(MemoryBlockStackDrop(_23$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
; [exec]
; into_memory_block$Bool(_3$place(), _3$address, _3$snapshot$4)
; [eval] _3$place()
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= result_value@199@01 _3$snapshot$4@84@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [eval] compute_address(place, root_address)
; [eval] Size$Bool$()
(declare-const $t@224@01 $Snap)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (=
    _21$address@71@01
    (compute_address<Address> (as _3$place<Place>  Place) _3$address@79@01))
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
    _2$address@62@01
    (compute_address<Address> (as _3$place<Place>  Place) _3$address@79@01))
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
    _17$address@53@01
    (compute_address<Address> (as _3$place<Place>  Place) _3$address@79@01))
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
; exhale acc(MemoryBlock(_3$address, Size$Bool$()), write)
; [eval] Size$Bool$()
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _3$place<Place>  Place) _3$address@79@01)
  _3$address@79@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(MemoryBlockStackDrop(_3$address, Size$Bool$()), write)
; [eval] Size$Bool$()
; [exec]
; label return_label
; [exec]
; return_label$marker := true
; [exec]
; inhale basic_block_marker$return_label$marker()
(declare-const $t@225@01 $Snap)
(assert (= $t@225@01 $Snap.unit))
; [eval] basic_block_marker$return_label$marker()
(assert (as basic_block_marker$return_label$marker<Bool>  Bool))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; into_memory_block$I64(_1$place(), _1$address, _1$snapshot$4)
; [eval] _1$place()
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= _1$snapshot$0@5@01 _1$snapshot$4@9@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [eval] compute_address(place, root_address)
; [eval] Size$I64$()
(declare-const $t@226@01 $Snap)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (=
    _17$address@53@01
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
    _2$address@62@01
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
    _21$address@71@01
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
; exhale acc(OwnedNonAliased$Tuple$$$(_0$place(), _0$address, _0$snapshot$1), write) &&
;   valid$Snap$Tuple$$$(_0$snapshot$1)
; [eval] _0$place()
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  (as constructor$Snap$Tuple$$$$<Snap$Tuple$$$>  Snap$Tuple$$$)
  _0$snapshot$1@2@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [eval] valid$Snap$Tuple$$$(_0$snapshot$1)
(set-option :timeout 0)
(push) ; 4
(assert (not (valid$Snap$Tuple$$$<Bool> _0$snapshot$1@2@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (valid$Snap$Tuple$$$<Bool> _0$snapshot$1@2@01))
; [exec]
; lft_tok_sep_return$2(lft_1$snapshot$1, bw2$snapshot$0, bw3$snapshot$0, lifetime_token_perm_amount$0$snapshot$0 /
;   16)
; [eval] lifetime_token_perm_amount$0$snapshot$0 / 16
; [eval] none < rd_perm
(push) ; 4
(assert (not (or
  (= (/ lifetime_token_perm_amount$0$snapshot$0@141@01 (to_real 16)) $Perm.No)
  (< $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@141@01 (to_real 16))))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@141@01 (to_real 16)))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [eval] lft == intersect(Set(lft_1, lft_2))
; [eval] intersect(Set(lft_1, lft_2))
; [eval] Set(lft_1, lft_2)
(declare-const $t@227@01 $Snap)
(assert (= $t@227@01 ($Snap.combine ($Snap.first $t@227@01) ($Snap.second $t@227@01))))
(set-option :timeout 0)
(push) ; 4
(assert (not (or
  (= (/ lifetime_token_perm_amount$0$snapshot$0@141@01 (to_real 16)) $Perm.No)
  (< $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@141@01 (to_real 16))))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(declare-const $t@228@01 $Snap)
(assert (and
  (=>
    (<
      $Perm.No
      (-
        lifetime_token_perm_amount$0$snapshot$0@141@01
        ($Perm.min
          lifetime_token_perm_amount$0$snapshot$0@141@01
          (/ lifetime_token_perm_amount$0$snapshot$0@141@01 (to_real 16)))))
    (= $t@228@01 $t@180@01))
  (=>
    (< $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@141@01 (to_real 16)))
    (= $t@228@01 ($Snap.first $t@227@01)))))
(assert (<=
  $Perm.No
  (+
    (-
      lifetime_token_perm_amount$0$snapshot$0@141@01
      ($Perm.min
        lifetime_token_perm_amount$0$snapshot$0@141@01
        (/ lifetime_token_perm_amount$0$snapshot$0@141@01 (to_real 16))))
    (/ lifetime_token_perm_amount$0$snapshot$0@141@01 (to_real 16)))))
(push) ; 4
(assert (not (or
  (= (/ lifetime_token_perm_amount$0$snapshot$0@141@01 (to_real 16)) $Perm.No)
  (< $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@141@01 (to_real 16))))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(declare-const $t@229@01 $Snap)
(assert (and
  (=>
    (<
      $Perm.No
      (-
        lifetime_token_perm_amount$0$snapshot$0@141@01
        ($Perm.min
          lifetime_token_perm_amount$0$snapshot$0@141@01
          (/ lifetime_token_perm_amount$0$snapshot$0@141@01 (to_real 16)))))
    (= $t@229@01 $t@181@01))
  (=>
    (< $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@141@01 (to_real 16)))
    (= $t@229@01 ($Snap.second $t@227@01)))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; exhale acc(LifetimeToken(bw2$snapshot$0), lifetime_token_perm_amount$0$snapshot$0)
(set-option :timeout 0)
(push) ; 4
(assert (not (or
  (= lifetime_token_perm_amount$0$snapshot$0@141@01 $Perm.No)
  (< $Perm.No lifetime_token_perm_amount$0$snapshot$0@141@01))))
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
        lifetime_token_perm_amount$0$snapshot$0@141@01
        ($Perm.min
          lifetime_token_perm_amount$0$snapshot$0@141@01
          (/ lifetime_token_perm_amount$0$snapshot$0@141@01 (to_real 16))))
      (/ lifetime_token_perm_amount$0$snapshot$0@141@01 (to_real 16)))
    ($Perm.min
      (+
        (-
          lifetime_token_perm_amount$0$snapshot$0@141@01
          ($Perm.min
            lifetime_token_perm_amount$0$snapshot$0@141@01
            (/ lifetime_token_perm_amount$0$snapshot$0@141@01 (to_real 16))))
        (/ lifetime_token_perm_amount$0$snapshot$0@141@01 (to_real 16)))
      lifetime_token_perm_amount$0$snapshot$0@141@01))
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
      lifetime_token_perm_amount$0$snapshot$0@141@01
      ($Perm.min
        (+
          (-
            lifetime_token_perm_amount$0$snapshot$0@141@01
            ($Perm.min
              lifetime_token_perm_amount$0$snapshot$0@141@01
              (/ lifetime_token_perm_amount$0$snapshot$0@141@01 (to_real 16))))
          (/ lifetime_token_perm_amount$0$snapshot$0@141@01 (to_real 16)))
        lifetime_token_perm_amount$0$snapshot$0@141@01))
    $Perm.No)
  (<
    (-
      lifetime_token_perm_amount$0$snapshot$0@141@01
      ($Perm.min
        (+
          (-
            lifetime_token_perm_amount$0$snapshot$0@141@01
            ($Perm.min
              lifetime_token_perm_amount$0$snapshot$0@141@01
              (/ lifetime_token_perm_amount$0$snapshot$0@141@01 (to_real 16))))
          (/ lifetime_token_perm_amount$0$snapshot$0@141@01 (to_real 16)))
        lifetime_token_perm_amount$0$snapshot$0@141@01))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No lifetime_token_perm_amount$0$snapshot$0@141@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(LifetimeToken(bw3$snapshot$0), lifetime_token_perm_amount$0$snapshot$0)
(set-option :timeout 0)
(push) ; 4
(assert (not (or
  (= lifetime_token_perm_amount$0$snapshot$0@141@01 $Perm.No)
  (< $Perm.No lifetime_token_perm_amount$0$snapshot$0@141@01))))
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
        lifetime_token_perm_amount$0$snapshot$0@141@01
        ($Perm.min
          lifetime_token_perm_amount$0$snapshot$0@141@01
          (/ lifetime_token_perm_amount$0$snapshot$0@141@01 (to_real 16))))
      (/ lifetime_token_perm_amount$0$snapshot$0@141@01 (to_real 16)))
    ($Perm.min
      (+
        (-
          lifetime_token_perm_amount$0$snapshot$0@141@01
          ($Perm.min
            lifetime_token_perm_amount$0$snapshot$0@141@01
            (/ lifetime_token_perm_amount$0$snapshot$0@141@01 (to_real 16))))
        (/ lifetime_token_perm_amount$0$snapshot$0@141@01 (to_real 16)))
      lifetime_token_perm_amount$0$snapshot$0@141@01))
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
      lifetime_token_perm_amount$0$snapshot$0@141@01
      ($Perm.min
        (+
          (-
            lifetime_token_perm_amount$0$snapshot$0@141@01
            ($Perm.min
              lifetime_token_perm_amount$0$snapshot$0@141@01
              (/ lifetime_token_perm_amount$0$snapshot$0@141@01 (to_real 16))))
          (/ lifetime_token_perm_amount$0$snapshot$0@141@01 (to_real 16)))
        lifetime_token_perm_amount$0$snapshot$0@141@01))
    $Perm.No)
  (<
    (-
      lifetime_token_perm_amount$0$snapshot$0@141@01
      ($Perm.min
        (+
          (-
            lifetime_token_perm_amount$0$snapshot$0@141@01
            ($Perm.min
              lifetime_token_perm_amount$0$snapshot$0@141@01
              (/ lifetime_token_perm_amount$0$snapshot$0@141@01 (to_real 16))))
          (/ lifetime_token_perm_amount$0$snapshot$0@141@01 (to_real 16)))
        lifetime_token_perm_amount$0$snapshot$0@141@01))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No lifetime_token_perm_amount$0$snapshot$0@141@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [eval] loop__label_bb1__label_bb2$marker && (label_3_custom$marker && label_bb16$marker)
; [then-branch: 1 | False | dead]
; [else-branch: 1 | True | live]
(set-option :timeout 0)
(push) ; 4
; [else-branch: 1 | True]
(pop) ; 4
; [eval] !(loop__label_bb1__label_bb2$marker && (label_3_custom$marker && label_bb16$marker))
; [eval] loop__label_bb1__label_bb2$marker && (label_3_custom$marker && label_bb16$marker)
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
; exhale acc(MemoryBlock(_2$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
; [eval] loop__label_bb7__label_bb8$marker && (label_5_custom$marker && (label_bb14$marker && (label_bb15$marker && (loop__label_bb1__label_bb1$marker && (loop__label_bb1__label_bb2$marker && (label_3_custom$marker && label_bb16$marker))))))
; [then-branch: 3 | False | dead]
; [else-branch: 3 | True | live]
(push) ; 5
; [else-branch: 3 | True]
(pop) ; 5
; [eval] !(loop__label_bb7__label_bb8$marker && (label_5_custom$marker && (label_bb14$marker && (label_bb15$marker && (loop__label_bb1__label_bb1$marker && (loop__label_bb1__label_bb2$marker && (label_3_custom$marker && label_bb16$marker)))))))
; [eval] loop__label_bb7__label_bb8$marker && (label_5_custom$marker && (label_bb14$marker && (label_bb15$marker && (loop__label_bb1__label_bb1$marker && (loop__label_bb1__label_bb2$marker && (label_3_custom$marker && label_bb16$marker))))))
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
; [eval] loop__label_bb7__label_bb8$marker && (label_5_custom$marker && (label_bb14$marker && (label_bb15$marker && (loop__label_bb1__label_bb1$marker && (loop__label_bb1__label_bb2$marker && (label_3_custom$marker && label_bb16$marker))))))
; [then-branch: 5 | False | dead]
; [else-branch: 5 | True | live]
(push) ; 6
; [else-branch: 5 | True]
(pop) ; 6
; [eval] !(loop__label_bb7__label_bb8$marker && (label_5_custom$marker && (label_bb14$marker && (label_bb15$marker && (loop__label_bb1__label_bb1$marker && (loop__label_bb1__label_bb2$marker && (label_3_custom$marker && label_bb16$marker)))))))
; [eval] loop__label_bb7__label_bb8$marker && (label_5_custom$marker && (label_bb14$marker && (label_bb15$marker && (loop__label_bb1__label_bb1$marker && (loop__label_bb1__label_bb2$marker && (label_3_custom$marker && label_bb16$marker))))))
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
; exhale acc(MemoryBlock(_17$address, Size$Tuple$$I64$Bool$$I64$Bool$$()), write)
; [eval] Size$Tuple$$I64$Bool$$I64$Bool$$()
; [eval] loop__label_bb1__label_bb2$marker && (label_3_custom$marker && label_bb16$marker)
; [then-branch: 7 | False | dead]
; [else-branch: 7 | True | live]
(push) ; 7
; [else-branch: 7 | True]
(pop) ; 7
; [eval] !(loop__label_bb1__label_bb2$marker && (label_3_custom$marker && label_bb16$marker))
; [eval] loop__label_bb1__label_bb2$marker && (label_3_custom$marker && label_bb16$marker)
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
; [eval] loop__label_bb1__label_bb2$marker && (label_3_custom$marker && label_bb16$marker)
; [then-branch: 9 | False | dead]
; [else-branch: 9 | True | live]
(push) ; 8
; [else-branch: 9 | True]
(pop) ; 8
; [eval] !(loop__label_bb1__label_bb2$marker && (label_3_custom$marker && label_bb16$marker))
; [eval] loop__label_bb1__label_bb2$marker && (label_3_custom$marker && label_bb16$marker)
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
; exhale acc(MemoryBlock(_21$address, Size$Tuple$$I64$Bool$$I64$Bool$$()), write)
; [eval] Size$Tuple$$I64$Bool$$I64$Bool$$()
; [exec]
; label label__from__return_label__to__end_label
; [exec]
; inhale _0$snapshot$2 == _0$snapshot$1
(declare-const $t@230@01 $Snap)
(assert (= $t@230@01 $Snap.unit))
; [eval] _0$snapshot$2 == _0$snapshot$1
(assert (= _0$snapshot$2@3@01 _0$snapshot$1@2@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale _1$snapshot$5 == _1$snapshot$4
(declare-const $t@231@01 $Snap)
(assert (= $t@231@01 $Snap.unit))
; [eval] _1$snapshot$5 == _1$snapshot$4
(assert (= _1$snapshot$5@10@01 _1$snapshot$4@9@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _10$snapshot$5 == _10$snapshot$4
(declare-const $t@232@01 $Snap)
(assert (= $t@232@01 $Snap.unit))
; [eval] _10$snapshot$5 == _10$snapshot$4
(assert (= _10$snapshot$5@17@01 _10$snapshot$4@16@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _11$snapshot$7 == _11$snapshot$6
(declare-const $t@233@01 $Snap)
(assert (= $t@233@01 $Snap.unit))
; [eval] _11$snapshot$7 == _11$snapshot$6
(assert (= _11$snapshot$7@26@01 _11$snapshot$6@25@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _12$snapshot$7 == _12$snapshot$6
(declare-const $t@234@01 $Snap)
(assert (= $t@234@01 $Snap.unit))
; [eval] _12$snapshot$7 == _12$snapshot$6
(assert (= _12$snapshot$7@35@01 _12$snapshot$6@34@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _13$snapshot$6 == _13$snapshot$5
(declare-const $t@235@01 $Snap)
(assert (= $t@235@01 $Snap.unit))
; [eval] _13$snapshot$6 == _13$snapshot$5
(assert (= _13$snapshot$6@43@01 _13$snapshot$5@42@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _14$snapshot$7 == _14$snapshot$6
(declare-const $t@236@01 $Snap)
(assert (= $t@236@01 $Snap.unit))
; [eval] _14$snapshot$7 == _14$snapshot$6
(assert (= _14$snapshot$7@52@01 _14$snapshot$6@51@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _17$snapshot$6 == _17$snapshot$5
(declare-const $t@237@01 $Snap)
(assert (= $t@237@01 $Snap.unit))
; [eval] _17$snapshot$6 == _17$snapshot$5
(assert (= _17$snapshot$6@60@01 _17$snapshot$5@59@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _2$snapshot$7 == _2$snapshot$6
(declare-const $t@238@01 $Snap)
(assert (= $t@238@01 $Snap.unit))
; [eval] _2$snapshot$7 == _2$snapshot$6
(assert (= _2$snapshot$7@70@01 _2$snapshot$6@69@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _21$snapshot$5 == _21$snapshot$4
(declare-const $t@239@01 $Snap)
(assert (= $t@239@01 $Snap.unit))
; [eval] _21$snapshot$5 == _21$snapshot$4
(assert (= _21$snapshot$5@77@01 _21$snapshot$4@76@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _3$snapshot$5 == _3$snapshot$4
(declare-const $t@240@01 $Snap)
(assert (= $t@240@01 $Snap.unit))
; [eval] _3$snapshot$5 == _3$snapshot$4
(assert (= _3$snapshot$5@85@01 _3$snapshot$4@84@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _4$snapshot$5 == _4$snapshot$4
(declare-const $t@241@01 $Snap)
(assert (= $t@241@01 $Snap.unit))
; [eval] _4$snapshot$5 == _4$snapshot$4
(assert (= _4$snapshot$5@92@01 _4$snapshot$4@91@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _5$snapshot$3 == _5$snapshot$2
(declare-const $t@242@01 $Snap)
(assert (= $t@242@01 $Snap.unit))
; [eval] _5$snapshot$3 == _5$snapshot$2
(assert (= _5$snapshot$3@97@01 _5$snapshot$2@96@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _6$snapshot$5 == _6$snapshot$4
(declare-const $t@243@01 $Snap)
(assert (= $t@243@01 $Snap.unit))
; [eval] _6$snapshot$5 == _6$snapshot$4
(assert (= _6$snapshot$5@104@01 _6$snapshot$4@103@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _9$snapshot$8 == _9$snapshot$7
(declare-const $t@244@01 $Snap)
(assert (= $t@244@01 $Snap.unit))
; [eval] _9$snapshot$8 == _9$snapshot$7
(assert (= _9$snapshot$8@114@01 _9$snapshot$7@113@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale loop_variant$1$snapshot$4 == loop_variant$1$snapshot$3
(declare-const $t@245@01 $Snap)
(assert (= $t@245@01 $Snap.unit))
; [eval] loop_variant$1$snapshot$4 == loop_variant$1$snapshot$3
(assert (= loop_variant$1$snapshot$4@154@01 loop_variant$1$snapshot$3@153@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale loop_variant$2$snapshot$7 == loop_variant$2$snapshot$6
(declare-const $t@246@01 $Snap)
(assert (= $t@246@01 $Snap.unit))
; [eval] loop_variant$2$snapshot$7 == loop_variant$2$snapshot$6
(assert (= loop_variant$2$snapshot$7@162@01 loop_variant$2$snapshot$6@161@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; label end_label
; [exec]
; end_label$marker := true
; [exec]
; inhale basic_block_marker$end_label$marker()
(declare-const $t@247@01 $Snap)
(assert (= $t@247@01 $Snap.unit))
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
; [else-branch: 0 | destructor$Snap$Bool$$value[Bool](_3$snapshot$1@81@01)]
(assert (destructor$Snap$Bool$$value<Bool> _3$snapshot$1@81@01))
(pop) ; 3
; [eval] !!destructor$Snap$Bool$$value(_3$snapshot$1)
; [eval] !destructor$Snap$Bool$$value(_3$snapshot$1)
; [eval] destructor$Snap$Bool$$value(_3$snapshot$1)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (destructor$Snap$Bool$$value<Bool> _3$snapshot$1@81@01))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (destructor$Snap$Bool$$value<Bool> _3$snapshot$1@81@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; [then-branch: 11 | destructor$Snap$Bool$$value[Bool](_3$snapshot$1@81@01) | live]
; [else-branch: 11 | !(destructor$Snap$Bool$$value[Bool](_3$snapshot$1@81@01)) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 11 | destructor$Snap$Bool$$value[Bool](_3$snapshot$1@81@01)]
(assert (destructor$Snap$Bool$$value<Bool> _3$snapshot$1@81@01))
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
; label label_4_custom
; [exec]
; label_4_custom$marker := true
; [exec]
; inhale basic_block_marker$label_4_custom$marker()
(declare-const $t@248@01 $Snap)
(assert (= $t@248@01 $Snap.unit))
; [eval] basic_block_marker$label_4_custom$marker()
(assert (as basic_block_marker$label_4_custom$marker<Bool>  Bool))
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
(declare-const $t@249@01 $Snap)
(assert (= $t@249@01 $Snap.unit))
; [eval] basic_block_marker$label_bb3$marker()
(assert (as basic_block_marker$label_bb3$marker<Bool>  Bool))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlock(_5$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
(declare-const $t@250@01 $Snap)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _17$address@53@01 _5$address@93@01)
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
(assert (not (= _0$address@0@01 _5$address@93@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= _2$address@62@01 _5$address@93@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _21$address@71@01 _5$address@93@01)
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
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
; inhale acc(MemoryBlockStackDrop(_5$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
(declare-const $t@251@01 $Snap)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _3$address@79@01 _5$address@93@01)
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
; inhale acc(MemoryBlock(_6$address, Size$Bool$()), write)
; [eval] Size$Bool$()
(declare-const $t@252@01 $Snap)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _5$address@93@01 _6$address@98@01)
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
  (= _17$address@53@01 _6$address@98@01)
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
  (= _0$address@0@01 _6$address@98@01)
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
  (= _2$address@62@01 _6$address@98@01)
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
  (= _21$address@71@01 _6$address@98@01)
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
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
; inhale acc(MemoryBlockStackDrop(_6$address, Size$Bool$()), write)
; [eval] Size$Bool$()
(declare-const $t@253@01 $Snap)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _5$address@93@01 _6$address@98@01)
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
(assert (not (= _3$address@79@01 _6$address@98@01)))
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
; write_place_constant$Bool(_6$place(), _6$address, constructor$Snap$Bool$(false))
; [eval] _6$place()
; [eval] constructor$Snap$Bool$(false)
; [eval] compute_address(target_place, target_root_address)
; [eval] Size$Bool$()
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _21$address@71@01
    (compute_address<Address> (as _6$place<Place>  Place) _6$address@98@01))
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
    _2$address@62@01
    (compute_address<Address> (as _6$place<Place>  Place) _6$address@98@01))
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
    (compute_address<Address> (as _6$place<Place>  Place) _6$address@98@01))
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
    _17$address@53@01
    (compute_address<Address> (as _6$place<Place>  Place) _6$address@98@01))
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
    _5$address@93@01
    (compute_address<Address> (as _6$place<Place>  Place) _6$address@98@01))
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
  _6$address@98@01
  (compute_address<Address> (as _6$place<Place>  Place) _6$address@98@01))))
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
(declare-const $t@254@01 $Snap)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= (as _3$place<Place>  Place) (as _6$place<Place>  Place))
  (= _3$address@79@01 _6$address@98@01)
  (= result_value@199@01 (constructor$Snap$Bool$<Snap$Bool> false)))))
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
; inhale _6$snapshot$1 == constructor$Snap$Bool$(false)
(declare-const $t@255@01 $Snap)
(assert (= $t@255@01 $Snap.unit))
; [eval] _6$snapshot$1 == constructor$Snap$Bool$(false)
; [eval] constructor$Snap$Bool$(false)
(assert (= _6$snapshot$1@100@01 (constructor$Snap$Bool$<Snap$Bool> false)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale loop_variant$1$snapshot$1 ==
;   constructor$Snap$Unbounded$(destructor$Snap$I64$$value(_1$snapshot$0))
(declare-const $t@256@01 $Snap)
(assert (= $t@256@01 $Snap.unit))
; [eval] loop_variant$1$snapshot$1 == constructor$Snap$Unbounded$(destructor$Snap$I64$$value(_1$snapshot$0))
; [eval] constructor$Snap$Unbounded$(destructor$Snap$I64$$value(_1$snapshot$0))
; [eval] destructor$Snap$I64$$value(_1$snapshot$0)
(assert (=
  loop_variant$1$snapshot$1@151@01
  (constructor$Snap$Unbounded$<Snap$Unbounded> (destructor$Snap$I64$$value<Int> _1$snapshot$0@5@01))))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; assert destructor$Snap$Bool$$value(constructor$Snap$Bool$EqCmp_Lifetime(lft_0$snapshot$1,
;   intersect(Set(bw2$snapshot$0))))
; [eval] destructor$Snap$Bool$$value(constructor$Snap$Bool$EqCmp_Lifetime(lft_0$snapshot$1, intersect(Set(bw2$snapshot$0))))
; [eval] constructor$Snap$Bool$EqCmp_Lifetime(lft_0$snapshot$1, intersect(Set(bw2$snapshot$0)))
; [eval] intersect(Set(bw2$snapshot$0))
; [eval] Set(bw2$snapshot$0)
(set-option :timeout 0)
(push) ; 5
(assert (not (destructor$Snap$Bool$$value<Bool> (constructor$Snap$Bool$EqCmp_Lifetime<Snap$Bool> bw2$snapshot$0@115@01 (intersect<Lifetime> (Set_singleton bw2$snapshot$0@115@01))))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (destructor$Snap$Bool$$value<Bool> (constructor$Snap$Bool$EqCmp_Lifetime<Snap$Bool> bw2$snapshot$0@115@01 (intersect<Lifetime> (Set_singleton bw2$snapshot$0@115@01)))))
; [exec]
; assert destructor$Snap$Bool$$value(constructor$Snap$Bool$EqCmp_Lifetime(lft_1$snapshot$1,
;   intersect(Set(bw2$snapshot$0, bw3$snapshot$0))))
; [eval] destructor$Snap$Bool$$value(constructor$Snap$Bool$EqCmp_Lifetime(lft_1$snapshot$1, intersect(Set(bw2$snapshot$0, bw3$snapshot$0))))
; [eval] constructor$Snap$Bool$EqCmp_Lifetime(lft_1$snapshot$1, intersect(Set(bw2$snapshot$0, bw3$snapshot$0)))
; [eval] intersect(Set(bw2$snapshot$0, bw3$snapshot$0))
; [eval] Set(bw2$snapshot$0, bw3$snapshot$0)
(push) ; 5
(assert (not (destructor$Snap$Bool$$value<Bool> (constructor$Snap$Bool$EqCmp_Lifetime<Snap$Bool> lft@182@01 (intersect<Lifetime> (Set_unionone (Set_singleton bw2$snapshot$0@115@01) bw3$snapshot$0@116@01))))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (destructor$Snap$Bool$$value<Bool> (constructor$Snap$Bool$EqCmp_Lifetime<Snap$Bool> lft@182@01 (intersect<Lifetime> (Set_unionone (Set_singleton bw2$snapshot$0@115@01) bw3$snapshot$0@116@01)))))
; [exec]
; assert destructor$Snap$Bool$$value(constructor$Snap$Bool$GtCmp_Unbounded(loop_variant$1$snapshot$1,
;   constructor$Snap$Unbounded$(0)))
; [eval] destructor$Snap$Bool$$value(constructor$Snap$Bool$GtCmp_Unbounded(loop_variant$1$snapshot$1, constructor$Snap$Unbounded$(0)))
; [eval] constructor$Snap$Bool$GtCmp_Unbounded(loop_variant$1$snapshot$1, constructor$Snap$Unbounded$(0))
; [eval] constructor$Snap$Unbounded$(0)
(push) ; 5
(assert (not (destructor$Snap$Bool$$value<Bool> (constructor$Snap$Bool$GtCmp_Unbounded<Snap$Bool> loop_variant$1$snapshot$1@151@01 (constructor$Snap$Unbounded$<Snap$Unbounded> 0)))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (destructor$Snap$Bool$$value<Bool> (constructor$Snap$Bool$GtCmp_Unbounded<Snap$Bool> loop_variant$1$snapshot$1@151@01 (constructor$Snap$Unbounded$<Snap$Unbounded> 0))))
; [exec]
; into_memory_block$Bool(_3$place(), _3$address, _3$snapshot$1)
; [eval] _3$place()
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= (as _6$place<Place>  Place) (as _3$place<Place>  Place))
  (= _6$address@98@01 _3$address@79@01)
  (= (constructor$Snap$Bool$<Snap$Bool> false) _3$snapshot$1@81@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= result_value@199@01 _3$snapshot$1@81@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [eval] compute_address(place, root_address)
; [eval] Size$Bool$()
(declare-const $t@257@01 $Snap)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _21$address@71@01
    (compute_address<Address> (as _3$place<Place>  Place) _3$address@79@01))
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
    _2$address@62@01
    (compute_address<Address> (as _3$place<Place>  Place) _3$address@79@01))
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
    (compute_address<Address> (as _3$place<Place>  Place) _3$address@79@01))
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
    _17$address@53@01
    (compute_address<Address> (as _3$place<Place>  Place) _3$address@79@01))
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
    _5$address@93@01
    (compute_address<Address> (as _3$place<Place>  Place) _3$address@79@01))
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
; havoc_memory_block$Bool$$(_3$address)
; [eval] Size$Bool$()
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _3$place<Place>  Place) _3$address@79@01)
  _3$address@79@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [eval] Size$Bool$()
(declare-const $t@258@01 $Snap)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _5$address@93@01 _3$address@79@01)
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
  (= _17$address@53@01 _3$address@79@01)
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
  (= _0$address@0@01 _3$address@79@01)
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
  (= _2$address@62@01 _3$address@79@01)
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
  (= _21$address@71@01 _3$address@79@01)
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
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
; into_memory_block$Bool(_6$place(), _6$address, _6$snapshot$1)
; [eval] _6$place()
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (constructor$Snap$Bool$<Snap$Bool> false) _6$snapshot$1@100@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [eval] compute_address(place, root_address)
; [eval] Size$Bool$()
(declare-const $t@259@01 $Snap)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _21$address@71@01
    (compute_address<Address> (as _6$place<Place>  Place) _6$address@98@01))
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
    _2$address@62@01
    (compute_address<Address> (as _6$place<Place>  Place) _6$address@98@01))
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
    (compute_address<Address> (as _6$place<Place>  Place) _6$address@98@01))
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
    _17$address@53@01
    (compute_address<Address> (as _6$place<Place>  Place) _6$address@98@01))
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
    _5$address@93@01
    (compute_address<Address> (as _6$place<Place>  Place) _6$address@98@01))
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
  _3$address@79@01
  (compute_address<Address> (as _6$place<Place>  Place) _6$address@98@01))))
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
; havoc_memory_block$Bool$$(_6$address)
; [eval] Size$Bool$()
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _6$place<Place>  Place) _6$address@98@01)
  _6$address@98@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [eval] Size$Bool$()
(declare-const $t@260@01 $Snap)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= _3$address@79@01 _6$address@98@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _5$address@93@01 _6$address@98@01)
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
  (= _17$address@53@01 _6$address@98@01)
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
  (= _0$address@0@01 _6$address@98@01)
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
  (= _2$address@62@01 _6$address@98@01)
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
  (= _21$address@71@01 _6$address@98@01)
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
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
; havoc_memory_block$Tuple$$$$$(_5$address)
; [eval] Size$Tuple$$$$()
; [eval] Size$Tuple$$$$()
(declare-const $t@261@01 $Snap)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _21$address@71@01 _5$address@93@01)
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
(assert (not (= _2$address@62@01 _5$address@93@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= _0$address@0@01 _5$address@93@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _17$address@53@01 _5$address@93@01)
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
  (= _3$address@79@01 _5$address@93@01)
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
  (= _6$address@98@01 _5$address@93@01)
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
; havoc_memory_block$Tuple$$I64$Bool$$I64$Bool$$$(_17$address)
; [eval] Size$Tuple$$I64$Bool$$I64$Bool$$()
; [eval] Size$Tuple$$I64$Bool$$I64$Bool$$()
(declare-const $t@262@01 $Snap)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _6$address@98@01 _17$address@53@01)
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
  (= _3$address@79@01 _17$address@53@01)
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
  (= _0$address@0@01 _17$address@53@01)
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
  (= _2$address@62@01 _17$address@53@01)
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
(assert (not (= _21$address@71@01 _17$address@53@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _5$address@93@01 _17$address@53@01)
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
; havoc_memory_block$Tuple$$$$$(_2$address)
; [eval] Size$Tuple$$$$()
; [eval] Size$Tuple$$$$()
(declare-const $t@263@01 $Snap)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= _5$address@93@01 _2$address@62@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _21$address@71@01 _2$address@62@01)
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
(assert (not (= _0$address@0@01 _2$address@62@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _3$address@79@01 _2$address@62@01)
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
  (= _6$address@98@01 _2$address@62@01)
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
  (= _17$address@53@01 _2$address@62@01)
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
; havoc_memory_block$Tuple$$I64$Bool$$I64$Bool$$$(_21$address)
; [eval] Size$Tuple$$I64$Bool$$I64$Bool$$()
; [eval] Size$Tuple$$I64$Bool$$I64$Bool$$()
(declare-const $t@264@01 $Snap)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= _17$address@53@01 _21$address@71@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _6$address@98@01 _21$address@71@01)
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
  (= _3$address@79@01 _21$address@71@01)
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
  (= _0$address@0@01 _21$address@71@01)
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
  (= _5$address@93@01 _21$address@71@01)
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
  (= _2$address@62@01 _21$address@71@01)
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
; tmp$1 := havoc_owned$I64(_1$place(), _1$address, _1$snapshot$0)
; [eval] _1$place()
(declare-const fresh_snapshot@265@01 Snap$I64)
(declare-const $t@266@01 $Snap)
(assert (= $t@266@01 ($Snap.combine ($Snap.first $t@266@01) ($Snap.second $t@266@01))))
(assert (= ($Snap.second $t@266@01) $Snap.unit))
; [eval] valid$Snap$I64(fresh_snapshot)
(assert (valid$Snap$I64<Bool> fresh_snapshot@265@01))
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; inhale _1$snapshot$1 == tmp$1
(declare-const $t@267@01 $Snap)
(assert (= $t@267@01 $Snap.unit))
; [eval] _1$snapshot$1 == tmp$1
(assert (= _1$snapshot$1@6@01 fresh_snapshot@265@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale loop_variant$1$snapshot$2 == tmp$2
(declare-const $t@268@01 $Snap)
(assert (= $t@268@01 $Snap.unit))
; [eval] loop_variant$1$snapshot$2 == tmp$2
(assert (= loop_variant$1$snapshot$2@152@01 tmp$2@169@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale destructor$Snap$Bool$$value(constructor$Snap$Bool$EqCmp_Lifetime(lft_0$snapshot$1,
;   intersect(Set(bw2$snapshot$0))))
(declare-const $t@269@01 $Snap)
(assert (= $t@269@01 $Snap.unit))
; [eval] destructor$Snap$Bool$$value(constructor$Snap$Bool$EqCmp_Lifetime(lft_0$snapshot$1, intersect(Set(bw2$snapshot$0))))
; [eval] constructor$Snap$Bool$EqCmp_Lifetime(lft_0$snapshot$1, intersect(Set(bw2$snapshot$0)))
; [eval] intersect(Set(bw2$snapshot$0))
; [eval] Set(bw2$snapshot$0)
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale destructor$Snap$Bool$$value(constructor$Snap$Bool$EqCmp_Lifetime(lft_1$snapshot$1,
;   intersect(Set(bw2$snapshot$0, bw3$snapshot$0))))
(declare-const $t@270@01 $Snap)
(assert (= $t@270@01 $Snap.unit))
; [eval] destructor$Snap$Bool$$value(constructor$Snap$Bool$EqCmp_Lifetime(lft_1$snapshot$1, intersect(Set(bw2$snapshot$0, bw3$snapshot$0))))
; [eval] constructor$Snap$Bool$EqCmp_Lifetime(lft_1$snapshot$1, intersect(Set(bw2$snapshot$0, bw3$snapshot$0)))
; [eval] intersect(Set(bw2$snapshot$0, bw3$snapshot$0))
; [eval] Set(bw2$snapshot$0, bw3$snapshot$0)
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale destructor$Snap$Bool$$value(constructor$Snap$Bool$EqCmp_Unbounded(loop_variant$1$snapshot$2,
;   constructor$Snap$Unbounded$(destructor$Snap$I64$$value(_1$snapshot$1))))
(declare-const $t@271@01 $Snap)
(assert (= $t@271@01 $Snap.unit))
; [eval] destructor$Snap$Bool$$value(constructor$Snap$Bool$EqCmp_Unbounded(loop_variant$1$snapshot$2, constructor$Snap$Unbounded$(destructor$Snap$I64$$value(_1$snapshot$1))))
; [eval] constructor$Snap$Bool$EqCmp_Unbounded(loop_variant$1$snapshot$2, constructor$Snap$Unbounded$(destructor$Snap$I64$$value(_1$snapshot$1)))
; [eval] constructor$Snap$Unbounded$(destructor$Snap$I64$$value(_1$snapshot$1))
; [eval] destructor$Snap$I64$$value(_1$snapshot$1)
(assert (destructor$Snap$Bool$$value<Bool> (constructor$Snap$Bool$EqCmp_Unbounded<Snap$Bool> loop_variant$1$snapshot$2@152@01 (constructor$Snap$Unbounded$<Snap$Unbounded> (destructor$Snap$I64$$value<Int> _1$snapshot$1@6@01)))))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; label label_bb5
; [exec]
; label_bb5$marker := true
; [exec]
; inhale basic_block_marker$label_bb5$marker()
(declare-const $t@272@01 $Snap)
(assert (= $t@272@01 $Snap.unit))
; [eval] basic_block_marker$label_bb5$marker()
(assert (as basic_block_marker$label_bb5$marker<Bool>  Bool))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; write_place_constant$Tuple$$$(_5$place(), _5$address, constructor$Snap$Tuple$$$$())
; [eval] _5$place()
; [eval] constructor$Snap$Tuple$$$$()
; [eval] compute_address(target_place, target_root_address)
; [eval] Size$Tuple$$$$()
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  _2$address@62@01
  (compute_address<Address> (as _5$place<Place>  Place) _5$address@93@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  _5$address@93@01
  (compute_address<Address> (as _5$place<Place>  Place) _5$address@93@01))))
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
(declare-const $t@273@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _5$snapshot$1 == constructor$Snap$Tuple$$$$()
(declare-const $t@274@01 $Snap)
(assert (= $t@274@01 $Snap.unit))
; [eval] _5$snapshot$1 == constructor$Snap$Tuple$$$$()
; [eval] constructor$Snap$Tuple$$$$()
(assert (=
  _5$snapshot$1@95@01
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
(declare-const $t@275@01 $Snap)
(assert (= $t@275@01 $Snap.unit))
; [eval] basic_block_marker$label_bb6$marker()
(assert (as basic_block_marker$label_bb6$marker<Bool>  Bool))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; exhale acc(MemoryBlock(_6$address, Size$Bool$()), write)
; [eval] Size$Bool$()
; [exec]
; exhale acc(MemoryBlockStackDrop(_6$address, Size$Bool$()), write)
; [eval] Size$Bool$()
; [exec]
; into_memory_block$Tuple$$$(_5$place(), _5$address, _5$snapshot$1)
; [eval] _5$place()
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  (as constructor$Snap$Tuple$$$$<Snap$Tuple$$$>  Snap$Tuple$$$)
  _5$snapshot$1@95@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [eval] compute_address(place, root_address)
; [eval] Size$Tuple$$$$()
(declare-const $t@276@01 $Snap)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  _2$address@62@01
  (compute_address<Address> (as _5$place<Place>  Place) _5$address@93@01))))
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
  (compute_address<Address> (as _5$place<Place>  Place) _5$address@93@01))))
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
    _3$address@79@01
    (compute_address<Address> (as _5$place<Place>  Place) _5$address@93@01))
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
    _17$address@53@01
    (compute_address<Address> (as _5$place<Place>  Place) _5$address@93@01))
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
  (=
    _21$address@71@01
    (compute_address<Address> (as _5$place<Place>  Place) _5$address@93@01))
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
; exhale acc(MemoryBlock(_5$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _5$place<Place>  Place) _5$address@93@01)
  _5$address@93@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(MemoryBlockStackDrop(_5$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
; [exec]
; inhale acc(MemoryBlock(_9$address, Size$I64$()), write)
; [eval] Size$I64$()
(declare-const $t@277@01 $Snap)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _21$address@71@01 _9$address@105@01)
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
  (= _17$address@53@01 _9$address@105@01)
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
  (= _3$address@79@01 _9$address@105@01)
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
  (= _0$address@0@01 _9$address@105@01)
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
  (= _2$address@62@01 _9$address@105@01)
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
; inhale acc(MemoryBlockStackDrop(_9$address, Size$I64$()), write)
; [eval] Size$I64$()
(declare-const $t@278@01 $Snap)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _3$address@79@01 _9$address@105@01)
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
; copy_place$I64(_9$place(), _9$address, _1$place(), _1$address, _1$snapshot$1,
;   write)
; [eval] _9$place()
; [eval] _1$place()
; [eval] none < source_permission_amount
; [eval] compute_address(target_place, target_root_address)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _2$address@62@01
    (compute_address<Address> (as _9$place<Place>  Place) _9$address@105@01))
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
    _0$address@0@01
    (compute_address<Address> (as _9$place<Place>  Place) _9$address@105@01))
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
    _3$address@79@01
    (compute_address<Address> (as _9$place<Place>  Place) _9$address@105@01))
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
    _17$address@53@01
    (compute_address<Address> (as _9$place<Place>  Place) _9$address@105@01))
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
    _21$address@71@01
    (compute_address<Address> (as _9$place<Place>  Place) _9$address@105@01))
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
  _9$address@105@01
  (compute_address<Address> (as _9$place<Place>  Place) _9$address@105@01))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= fresh_snapshot@265@01 _1$snapshot$1@6@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(declare-const $t@279@01 $Snap)
(assert (= $t@279@01 ($Snap.combine ($Snap.first $t@279@01) ($Snap.second $t@279@01))))
(assert (=
  ($Snap.second $t@279@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@279@01))
    ($Snap.second ($Snap.second $t@279@01)))))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= (as _1$place<Place>  Place) (as _9$place<Place>  Place))
  (= _1$address@4@01 _9$address@105@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (= ($Snap.second ($Snap.second $t@279@01)) $Snap.unit))
; [eval] valid$Snap$I64(source_snapshot)
(assert (valid$Snap$I64<Bool> _1$snapshot$1@6@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _9$snapshot$1 == _1$snapshot$1
(declare-const $t@280@01 $Snap)
(assert (= $t@280@01 $Snap.unit))
; [eval] _9$snapshot$1 == _1$snapshot$1
(assert (= _9$snapshot$1@107@01 _1$snapshot$1@6@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlock(_10$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
(declare-const $t@281@01 $Snap)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _21$address@71@01 _10$address@11@01)
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
  (= _17$address@53@01 _10$address@11@01)
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
  (= _3$address@79@01 _10$address@11@01)
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
(assert (not (= _0$address@0@01 _10$address@11@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= _2$address@62@01 _10$address@11@01)))
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
(declare-const $t@282@01 $Snap)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _9$address@105@01 _10$address@11@01)
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
  (= _3$address@79@01 _10$address@11@01)
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
; label label_bb7
; [exec]
; label_bb7$marker := true
; [exec]
; inhale basic_block_marker$label_bb7$marker()
(declare-const $t@283@01 $Snap)
(assert (= $t@283@01 $Snap.unit))
; [eval] basic_block_marker$label_bb7$marker()
(assert (as basic_block_marker$label_bb7$marker<Bool>  Bool))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; label label_bb8
; [exec]
; label_bb8$marker := true
; [exec]
; inhale basic_block_marker$label_bb8$marker()
(declare-const $t@284@01 $Snap)
(assert (= $t@284@01 $Snap.unit))
; [eval] basic_block_marker$label_bb8$marker()
(assert (as basic_block_marker$label_bb8$marker<Bool>  Bool))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlock(_11$address, Size$Bool$()), write)
; [eval] Size$Bool$()
(declare-const $t@285@01 $Snap)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _10$address@11@01 _11$address@18@01)
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
  (= _21$address@71@01 _11$address@18@01)
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
  (= _17$address@53@01 _11$address@18@01)
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
(assert (not (= _3$address@79@01 _11$address@18@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _0$address@0@01 _11$address@18@01)
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
  (= _2$address@62@01 _11$address@18@01)
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
(declare-const $t@286@01 $Snap)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _10$address@11@01 _11$address@18@01)
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
  (= _9$address@105@01 _11$address@18@01)
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
(assert (not (= _3$address@79@01 _11$address@18@01)))
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
; inhale acc(MemoryBlock(_12$address, Size$I64$()), write)
; [eval] Size$I64$()
(declare-const $t@287@01 $Snap)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _11$address@18@01 _12$address@27@01)
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
  (= _10$address@11@01 _12$address@27@01)
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
  (= _21$address@71@01 _12$address@27@01)
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
  (= _17$address@53@01 _12$address@27@01)
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
  (= _3$address@79@01 _12$address@27@01)
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
  (= _0$address@0@01 _12$address@27@01)
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
  (= _2$address@62@01 _12$address@27@01)
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
; inhale acc(MemoryBlockStackDrop(_12$address, Size$I64$()), write)
; [eval] Size$I64$()
(declare-const $t@288@01 $Snap)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _11$address@18@01 _12$address@27@01)
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
  (= _10$address@11@01 _12$address@27@01)
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
(assert (not (= _9$address@105@01 _12$address@27@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _3$address@79@01 _12$address@27@01)
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
; copy_place$I64(_12$place(), _12$address, _9$place(), _9$address, _9$snapshot$1,
;   write)
; [eval] _12$place()
; [eval] _9$place()
; [eval] none < source_permission_amount
; [eval] compute_address(target_place, target_root_address)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _2$address@62@01
    (compute_address<Address> (as _12$place<Place>  Place) _12$address@27@01))
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
    _0$address@0@01
    (compute_address<Address> (as _12$place<Place>  Place) _12$address@27@01))
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
    _3$address@79@01
    (compute_address<Address> (as _12$place<Place>  Place) _12$address@27@01))
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
    _17$address@53@01
    (compute_address<Address> (as _12$place<Place>  Place) _12$address@27@01))
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
    _21$address@71@01
    (compute_address<Address> (as _12$place<Place>  Place) _12$address@27@01))
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
    _10$address@11@01
    (compute_address<Address> (as _12$place<Place>  Place) _12$address@27@01))
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
    _11$address@18@01
    (compute_address<Address> (as _12$place<Place>  Place) _12$address@27@01))
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
  _12$address@27@01
  (compute_address<Address> (as _12$place<Place>  Place) _12$address@27@01))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= _1$snapshot$1@6@01 _9$snapshot$1@107@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(declare-const $t@289@01 $Snap)
(assert (= $t@289@01 ($Snap.combine ($Snap.first $t@289@01) ($Snap.second $t@289@01))))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= (as _1$place<Place>  Place) (as _9$place<Place>  Place))
  (= _1$address@4@01 _9$address@105@01)
  (= _1$snapshot$1@6@01 _9$snapshot$1@107@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second $t@289@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@289@01))
    ($Snap.second ($Snap.second $t@289@01)))))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= (as _1$place<Place>  Place) (as _12$place<Place>  Place))
  (= _1$address@4@01 _12$address@27@01)
  (= _1$snapshot$1@6@01 _9$snapshot$1@107@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= (as _9$place<Place>  Place) (as _12$place<Place>  Place))
  (= _9$address@105@01 _12$address@27@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (= ($Snap.second ($Snap.second $t@289@01)) $Snap.unit))
; [eval] valid$Snap$I64(source_snapshot)
(assert (valid$Snap$I64<Bool> _9$snapshot$1@107@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _12$snapshot$1 == _9$snapshot$1
(declare-const $t@290@01 $Snap)
(assert (= $t@290@01 $Snap.unit))
; [eval] _12$snapshot$1 == _9$snapshot$1
(assert (= _12$snapshot$1@29@01 _9$snapshot$1@107@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; tmp$3 := assign$Bool$BinaryOp$GtCmp$Move$I64$Constant$I64$$$$(_11$place(), _11$address,
;   _12$place(), _12$address, _12$snapshot$1, constructor$Snap$I64$(0))
; [eval] _11$place()
; [eval] _12$place()
; [eval] constructor$Snap$I64$(0)
; [eval] compute_address(target_place, target_address)
; [eval] Size$Bool$()
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _2$address@62@01
    (compute_address<Address> (as _11$place<Place>  Place) _11$address@18@01))
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
    (compute_address<Address> (as _11$place<Place>  Place) _11$address@18@01))
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
  _3$address@79@01
  (compute_address<Address> (as _11$place<Place>  Place) _11$address@18@01))))
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
    _17$address@53@01
    (compute_address<Address> (as _11$place<Place>  Place) _11$address@18@01))
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
    _21$address@71@01
    (compute_address<Address> (as _11$place<Place>  Place) _11$address@18@01))
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
    _10$address@11@01
    (compute_address<Address> (as _11$place<Place>  Place) _11$address@18@01))
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
  _11$address@18@01
  (compute_address<Address> (as _11$place<Place>  Place) _11$address@18@01))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= _9$snapshot$1@107@01 _12$snapshot$1@29@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [eval] valid$Snap$I64(operand1_value)
(set-option :timeout 0)
(push) ; 5
(assert (not (valid$Snap$I64<Bool> _12$snapshot$1@29@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (valid$Snap$I64<Bool> _12$snapshot$1@29@01))
; [eval] valid$Snap$I64(operand2_value)
(declare-const result_value@291@01 Snap$Bool)
(declare-const $t@292@01 $Snap)
(assert (= $t@292@01 ($Snap.combine ($Snap.first $t@292@01) ($Snap.second $t@292@01))))
(assert (=
  ($Snap.second $t@292@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@292@01))
    ($Snap.second ($Snap.second $t@292@01)))))
; [eval] compute_address(operand1_place, operand1_root_address)
; [eval] Size$I64$()
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _2$address@62@01
    (compute_address<Address> (as _12$place<Place>  Place) _12$address@27@01))
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
    _0$address@0@01
    (compute_address<Address> (as _12$place<Place>  Place) _12$address@27@01))
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
    _3$address@79@01
    (compute_address<Address> (as _12$place<Place>  Place) _12$address@27@01))
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
    _17$address@53@01
    (compute_address<Address> (as _12$place<Place>  Place) _12$address@27@01))
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
    _21$address@71@01
    (compute_address<Address> (as _12$place<Place>  Place) _12$address@27@01))
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
    _10$address@11@01
    (compute_address<Address> (as _12$place<Place>  Place) _12$address@27@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second $t@292@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@292@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@292@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@292@01))) $Snap.unit))
; [eval] result_value == constructor$Snap$Bool$GtCmp_I64(operand1_value, operand2_value)
; [eval] constructor$Snap$Bool$GtCmp_I64(operand1_value, operand2_value)
(assert (=
  result_value@291@01
  (constructor$Snap$Bool$GtCmp_I64<Snap$Bool> _12$snapshot$1@29@01 (constructor$Snap$I64$<Snap$I64> 0))))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@292@01))) $Snap.unit))
; [eval] valid$Snap$Bool(result_value)
(assert (valid$Snap$Bool<Bool> result_value@291@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _11$snapshot$1 == tmp$3
(declare-const $t@293@01 $Snap)
(assert (= $t@293@01 $Snap.unit))
; [eval] _11$snapshot$1 == tmp$3
(assert (= _11$snapshot$1@20@01 result_value@291@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; exhale acc(MemoryBlock(_12$address, Size$I64$()), write)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _12$place<Place>  Place) _12$address@27@01)
  _12$address@27@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(MemoryBlockStackDrop(_12$address, Size$I64$()), write)
; [eval] Size$I64$()
; [eval] !destructor$Snap$Bool$$value(_11$snapshot$1)
; [eval] destructor$Snap$Bool$$value(_11$snapshot$1)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (destructor$Snap$Bool$$value<Bool> _11$snapshot$1@20@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (destructor$Snap$Bool$$value<Bool> _11$snapshot$1@20@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [then-branch: 13 | !(destructor$Snap$Bool$$value[Bool](_11$snapshot$1@20@01)) | live]
; [else-branch: 13 | destructor$Snap$Bool$$value[Bool](_11$snapshot$1@20@01) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 13 | !(destructor$Snap$Bool$$value[Bool](_11$snapshot$1@20@01))]
(assert (not (destructor$Snap$Bool$$value<Bool> _11$snapshot$1@20@01)))
; [exec]
; label label__from__label_bb8__to__label_5_custom
; [exec]
; inhale _11$snapshot$3 == _11$snapshot$1
(declare-const $t@294@01 $Snap)
(assert (= $t@294@01 $Snap.unit))
; [eval] _11$snapshot$3 == _11$snapshot$1
(assert (= _11$snapshot$3@22@01 _11$snapshot$1@20@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale _12$snapshot$3 == _12$snapshot$1
(declare-const $t@295@01 $Snap)
(assert (= $t@295@01 $Snap.unit))
; [eval] _12$snapshot$3 == _12$snapshot$1
(assert (= _12$snapshot$3@31@01 _12$snapshot$1@29@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _13$snapshot$2 == _13$snapshot$0
(declare-const $t@296@01 $Snap)
(assert (= $t@296@01 $Snap.unit))
; [eval] _13$snapshot$2 == _13$snapshot$0
(assert (= _13$snapshot$2@39@01 _13$snapshot$0@37@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _14$snapshot$3 == _14$snapshot$0
(declare-const $t@297@01 $Snap)
(assert (= $t@297@01 $Snap.unit))
; [eval] _14$snapshot$3 == _14$snapshot$0
(assert (= _14$snapshot$3@48@01 _14$snapshot$0@45@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _17$snapshot$2 == _17$snapshot$0
(declare-const $t@298@01 $Snap)
(assert (= $t@298@01 $Snap.unit))
; [eval] _17$snapshot$2 == _17$snapshot$0
(assert (= _17$snapshot$2@56@01 _17$snapshot$0@54@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _2$snapshot$2 == _2$snapshot$0
(declare-const $t@299@01 $Snap)
(assert (= $t@299@01 $Snap.unit))
; [eval] _2$snapshot$2 == _2$snapshot$0
(assert (= _2$snapshot$2@65@01 _2$snapshot$0@63@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _9$snapshot$4 == _9$snapshot$1
(declare-const $t@300@01 $Snap)
(assert (= $t@300@01 $Snap.unit))
; [eval] _9$snapshot$4 == _9$snapshot$1
(assert (= _9$snapshot$4@110@01 _9$snapshot$1@107@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale loop_variant$2$snapshot$3 == loop_variant$2$snapshot$0
(declare-const $t@301@01 $Snap)
(assert (= $t@301@01 $Snap.unit))
; [eval] loop_variant$2$snapshot$3 == loop_variant$2$snapshot$0
(assert (= loop_variant$2$snapshot$3@158@01 loop_variant$2$snapshot$0@155@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; label label_5_custom
; [exec]
; label_5_custom$marker := true
; [exec]
; inhale basic_block_marker$label_5_custom$marker()
(declare-const $t@302@01 $Snap)
(assert (= $t@302@01 $Snap.unit))
; [eval] basic_block_marker$label_5_custom$marker()
(assert (as basic_block_marker$label_5_custom$marker<Bool>  Bool))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; label label_bb14
; [exec]
; label_bb14$marker := true
; [exec]
; inhale basic_block_marker$label_bb14$marker()
(declare-const $t@303@01 $Snap)
(assert (= $t@303@01 $Snap.unit))
; [eval] basic_block_marker$label_bb14$marker()
(assert (as basic_block_marker$label_bb14$marker<Bool>  Bool))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlock(_19$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
(declare-const $t@304@01 $Snap)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= _10$address@11@01 _19$address@61@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= _21$address@71@01 _19$address@61@01)
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
(assert (not (and
  (= _17$address@53@01 _19$address@61@01)
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
(assert (not (and
  (= _3$address@79@01 _19$address@61@01)
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
(assert (not (= _0$address@0@01 _19$address@61@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= _2$address@62@01 _19$address@61@01)))
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
; inhale acc(MemoryBlockStackDrop(_19$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
(declare-const $t@305@01 $Snap)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= _11$address@18@01 _19$address@61@01)
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
(assert (not (= _10$address@11@01 _19$address@61@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= _9$address@105@01 _19$address@61@01)
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
  (= _3$address@79@01 _19$address@61@01)
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
; write_place_constant$Tuple$$$(_10$place(), _10$address, constructor$Snap$Tuple$$$$())
; [eval] _10$place()
; [eval] constructor$Snap$Tuple$$$$()
; [eval] compute_address(target_place, target_root_address)
; [eval] Size$Tuple$$$$()
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  _2$address@62@01
  (compute_address<Address> (as _10$place<Place>  Place) _10$address@11@01))))
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
  (compute_address<Address> (as _10$place<Place>  Place) _10$address@11@01))))
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
    _3$address@79@01
    (compute_address<Address> (as _10$place<Place>  Place) _10$address@11@01))
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
    _17$address@53@01
    (compute_address<Address> (as _10$place<Place>  Place) _10$address@11@01))
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
(assert (not (and
  (=
    _21$address@71@01
    (compute_address<Address> (as _10$place<Place>  Place) _10$address@11@01))
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
  _10$address@11@01
  (compute_address<Address> (as _10$place<Place>  Place) _10$address@11@01))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [eval] valid$Snap$Tuple$$$(source_snapshot)
(declare-const $t@306@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _10$snapshot$1 == constructor$Snap$Tuple$$$$()
(declare-const $t@307@01 $Snap)
(assert (= $t@307@01 $Snap.unit))
; [eval] _10$snapshot$1 == constructor$Snap$Tuple$$$$()
; [eval] constructor$Snap$Tuple$$$$()
(assert (=
  _10$snapshot$1@13@01
  (as constructor$Snap$Tuple$$$$<Snap$Tuple$$$>  Snap$Tuple$$$)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; exhale acc(MemoryBlock(_19$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
; [exec]
; exhale acc(MemoryBlockStackDrop(_19$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
; [exec]
; into_memory_block$Bool(_11$place(), _11$address, _11$snapshot$3)
; [eval] _11$place()
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= result_value@291@01 _11$snapshot$3@22@01)))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [eval] compute_address(place, root_address)
; [eval] Size$Bool$()
(declare-const $t@308@01 $Snap)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    _2$address@62@01
    (compute_address<Address> (as _11$place<Place>  Place) _11$address@18@01))
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
    (compute_address<Address> (as _11$place<Place>  Place) _11$address@18@01))
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
  _3$address@79@01
  (compute_address<Address> (as _11$place<Place>  Place) _11$address@18@01))))
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
    _17$address@53@01
    (compute_address<Address> (as _11$place<Place>  Place) _11$address@18@01))
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
    _21$address@71@01
    (compute_address<Address> (as _11$place<Place>  Place) _11$address@18@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
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
; exhale acc(MemoryBlock(_11$address, Size$Bool$()), write)
; [eval] Size$Bool$()
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _11$place<Place>  Place) _11$address@18@01)
  _11$address@18@01)))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(MemoryBlockStackDrop(_11$address, Size$Bool$()), write)
; [eval] Size$Bool$()
; [exec]
; into_memory_block$Tuple$$$(_10$place(), _10$address, _10$snapshot$1)
; [eval] _10$place()
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  (as constructor$Snap$Tuple$$$$<Snap$Tuple$$$>  Snap$Tuple$$$)
  _10$snapshot$1@13@01)))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [eval] compute_address(place, root_address)
; [eval] Size$Tuple$$$$()
(declare-const $t@309@01 $Snap)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    _21$address@71@01
    (compute_address<Address> (as _10$place<Place>  Place) _10$address@11@01))
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
(assert (not (and
  (=
    _17$address@53@01
    (compute_address<Address> (as _10$place<Place>  Place) _10$address@11@01))
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
(assert (not (and
  (=
    _3$address@79@01
    (compute_address<Address> (as _10$place<Place>  Place) _10$address@11@01))
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
(assert (not (=
  _0$address@0@01
  (compute_address<Address> (as _10$place<Place>  Place) _10$address@11@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  _2$address@62@01
  (compute_address<Address> (as _10$place<Place>  Place) _10$address@11@01))))
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
; exhale acc(MemoryBlock(_10$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _10$place<Place>  Place) _10$address@11@01)
  _10$address@11@01)))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(MemoryBlockStackDrop(_10$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
; [exec]
; tmp$8 := assign$Tuple$$I64$Bool$$I64$Bool$$CheckedBinaryOp$Sub$Copy$I64$Constant$I64$$$$(_21$place(),
;   _21$address, _1$place(), _1$address, _1$snapshot$1, constructor$Snap$I64$(1))
; [eval] _21$place()
; [eval] _1$place()
; [eval] constructor$Snap$I64$(1)
; [eval] compute_address(target_place, target_address)
; [eval] Size$Tuple$$I64$Bool$$I64$Bool$$()
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  _21$address@71@01
  (compute_address<Address> (as _21$place<Place>  Place) _21$address@71@01))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [eval] valid$Snap$I64(operand1_value)
; [eval] valid$Snap$I64(operand2_value)
(set-option :timeout 0)
(push) ; 6
(assert (not (valid$Snap$I64<Bool> (constructor$Snap$I64$<Snap$I64> 1))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (valid$Snap$I64<Bool> (constructor$Snap$I64$<Snap$I64> 1)))
(declare-const result_value@310@01 Snap$Tuple$$I64$Bool$$I64$Bool$)
(declare-const $t@311@01 $Snap)
(assert (= $t@311@01 ($Snap.combine ($Snap.first $t@311@01) ($Snap.second $t@311@01))))
; [eval] compute_address(target_place, target_address)
; [eval] PaddingSize$Tuple$$I64$Bool$$I64$Bool$$()
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    _2$address@62@01
    (compute_address<Address> (as _21$place<Place>  Place) _21$address@71@01))
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
    _0$address@0@01
    (compute_address<Address> (as _21$place<Place>  Place) _21$address@71@01))
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
    _3$address@79@01
    (compute_address<Address> (as _21$place<Place>  Place) _21$address@71@01))
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
    _17$address@53@01
    (compute_address<Address> (as _21$place<Place>  Place) _21$address@71@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second $t@311@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@311@01))
    ($Snap.second ($Snap.second $t@311@01)))))
; [eval] field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(compute_address(target_place, target_address))
; [eval] compute_address(target_place, target_address)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    _17$address@53@01
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _21$place<Place>  Place) _21$address@71@01)))
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
    _3$address@79@01
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _21$place<Place>  Place) _21$address@71@01)))
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
    _0$address@0@01
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _21$place<Place>  Place) _21$address@71@01)))
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
    _2$address@62@01
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _21$place<Place>  Place) _21$address@71@01)))
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
    (compute_address<Address> (as _21$place<Place>  Place) _21$address@71@01)
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _21$place<Place>  Place) _21$address@71@01)))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second $t@311@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@311@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@311@01))))))
; [eval] field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(target_place)
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(result_value)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@311@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@311@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@311@01)))))))
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= (as _9$place<Place>  Place) (as _1$place<Place>  Place))
  (= _9$address@105@01 _1$address@4@01)
  (= _9$snapshot$1@107@01 _1$snapshot$1@6@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@311@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@311@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@311@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@311@01)))))
  $Snap.unit))
; [eval] valid$Snap$I64(constructor$Snap$I64$Sub_I64(operand1_value, operand2_value)) ==> destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(result_value) == constructor$Snap$I64$Sub_I64(operand1_value, operand2_value)
; [eval] valid$Snap$I64(constructor$Snap$I64$Sub_I64(operand1_value, operand2_value))
; [eval] constructor$Snap$I64$Sub_I64(operand1_value, operand2_value)
(set-option :timeout 0)
(push) ; 6
(push) ; 7
(set-option :timeout 10)
(assert (not (not
  (valid$Snap$I64<Bool> (constructor$Snap$I64$Sub_I64<Snap$I64> _1$snapshot$1@6@01 (constructor$Snap$I64$<Snap$I64> 1))))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (valid$Snap$I64<Bool> (constructor$Snap$I64$Sub_I64<Snap$I64> _1$snapshot$1@6@01 (constructor$Snap$I64$<Snap$I64> 1)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [then-branch: 14 | valid$Snap$I64[Bool](constructor$Snap$I64$Sub_I64[Snap$I64](_1$snapshot$1@6@01, constructor$Snap$I64$[Snap$I64](1))) | live]
; [else-branch: 14 | !(valid$Snap$I64[Bool](constructor$Snap$I64$Sub_I64[Snap$I64](_1$snapshot$1@6@01, constructor$Snap$I64$[Snap$I64](1)))) | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 14 | valid$Snap$I64[Bool](constructor$Snap$I64$Sub_I64[Snap$I64](_1$snapshot$1@6@01, constructor$Snap$I64$[Snap$I64](1)))]
(assert (valid$Snap$I64<Bool> (constructor$Snap$I64$Sub_I64<Snap$I64> _1$snapshot$1@6@01 (constructor$Snap$I64$<Snap$I64> 1))))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(result_value) == constructor$Snap$I64$Sub_I64(operand1_value, operand2_value)
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(result_value)
; [eval] constructor$Snap$I64$Sub_I64(operand1_value, operand2_value)
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (valid$Snap$I64<Bool> (constructor$Snap$I64$Sub_I64<Snap$I64> _1$snapshot$1@6@01 (constructor$Snap$I64$<Snap$I64> 1))))
(assert (=>
  (valid$Snap$I64<Bool> (constructor$Snap$I64$Sub_I64<Snap$I64> _1$snapshot$1@6@01 (constructor$Snap$I64$<Snap$I64> 1)))
  (=
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> result_value@310@01)
    (constructor$Snap$I64$Sub_I64<Snap$I64> _1$snapshot$1@6@01 (constructor$Snap$I64$<Snap$I64> 1)))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@311@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@311@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@311@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@311@01))))))
  $Snap.unit))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(result_value) == constructor$Snap$Bool$(!valid$Snap$I64(constructor$Snap$I64$Sub_I64(operand1_value, operand2_value)))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(result_value)
; [eval] constructor$Snap$Bool$(!valid$Snap$I64(constructor$Snap$I64$Sub_I64(operand1_value, operand2_value)))
; [eval] !valid$Snap$I64(constructor$Snap$I64$Sub_I64(operand1_value, operand2_value))
; [eval] valid$Snap$I64(constructor$Snap$I64$Sub_I64(operand1_value, operand2_value))
; [eval] constructor$Snap$I64$Sub_I64(operand1_value, operand2_value)
(assert (=
  (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> result_value@310@01)
  (constructor$Snap$Bool$<Snap$Bool> (not
    (valid$Snap$I64<Bool> (constructor$Snap$I64$Sub_I64<Snap$I64> _1$snapshot$1@6@01 (constructor$Snap$I64$<Snap$I64> 1)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@311@01))))))
  $Snap.unit))
; [eval] MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(compute_address(target_place, target_address)), Size$I64$()) == to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(result_value))
; [eval] MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(compute_address(target_place, target_address)), Size$I64$())
; [eval] field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(compute_address(target_place, target_address))
; [eval] compute_address(target_place, target_address)
; [eval] Size$I64$()
(push) ; 6
(declare-const $k@312@01 $Perm)
(assert ($Perm.isReadVar $k@312@01))
(assert (< $k@312@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@312@01)))
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.No $k@312@01)))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@311@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _21$place<Place>  Place) _21$address@71@01)) (as Size$I64$<Snap$Usize>  Snap$Usize)))
(pop) ; 6
; Joined path conditions
(assert ($Perm.isReadVar $k@312@01))
(assert (and
  (< $k@312@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@312@01))
  (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@311@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _21$place<Place>  Place) _21$address@71@01)) (as Size$I64$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(result_value))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(result_value)
(assert (=
  (MemoryBlock$bytes ($Snap.first ($Snap.second $t@311@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _21$place<Place>  Place) _21$address@71@01)) (as Size$I64$<Snap$Usize>  Snap$Usize))
  (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> result_value@310@01))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _21$snapshot$1 == tmp$8
(declare-const $t@313@01 $Snap)
(assert (= $t@313@01 $Snap.unit))
; [eval] _21$snapshot$1 == tmp$8
(assert (= _21$snapshot$1@73@01 result_value@310@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [eval] !destructor$Snap$Bool$$value(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(_21$snapshot$1))
; [eval] destructor$Snap$Bool$$value(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(_21$snapshot$1))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(_21$snapshot$1)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (destructor$Snap$Bool$$value<Bool> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> _21$snapshot$1@73@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not
  (destructor$Snap$Bool$$value<Bool> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> _21$snapshot$1@73@01)))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [then-branch: 15 | !(destructor$Snap$Bool$$value[Bool](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](_21$snapshot$1@73@01))) | live]
; [else-branch: 15 | destructor$Snap$Bool$$value[Bool](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](_21$snapshot$1@73@01)) | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 15 | !(destructor$Snap$Bool$$value[Bool](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](_21$snapshot$1@73@01)))]
(assert (not
  (destructor$Snap$Bool$$value<Bool> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> _21$snapshot$1@73@01))))
; [exec]
; label label_bb15
; [exec]
; label_bb15$marker := true
; [exec]
; inhale basic_block_marker$label_bb15$marker()
(declare-const $t@314@01 $Snap)
(assert (= $t@314@01 $Snap.unit))
; [eval] basic_block_marker$label_bb15$marker()
(assert (as basic_block_marker$label_bb15$marker<Bool>  Bool))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; into_memory_block$I64(_1$place(), _1$address, _1$snapshot$1)
; [eval] _1$place()
; [eval] compute_address(place, root_address)
; [eval] Size$I64$()
(declare-const $t@315@01 $Snap)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _21$place<Place>  Place) _21$address@71@01)
    (compute_address<Address> (as _1$place<Place>  Place) _1$address@4@01))
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
    _2$address@62@01
    (compute_address<Address> (as _1$place<Place>  Place) _1$address@4@01))
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
    _0$address@0@01
    (compute_address<Address> (as _1$place<Place>  Place) _1$address@4@01))
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
    _3$address@79@01
    (compute_address<Address> (as _1$place<Place>  Place) _1$address@4@01))
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
    _17$address@53@01
    (compute_address<Address> (as _1$place<Place>  Place) _1$address@4@01))
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
(assert (not (=
  (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _21$place<Place>  Place) _21$address@71@01))
  (compute_address<Address> (as _1$place<Place>  Place) _1$address@4@01))))
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
; fold acc(OwnedNonAliased$I64(field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(_21$place()),
;   _21$address, destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(_21$snapshot$1)), write)
; [eval] field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(_21$place())
; [eval] _21$place()
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(_21$snapshot$1)
; [eval] valid$Snap$I64(snapshot)
(set-option :timeout 0)
(push) ; 7
(assert (not (valid$Snap$I64<Bool> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _21$snapshot$1@73@01))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (valid$Snap$I64<Bool> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _21$snapshot$1@73@01)))
; [eval] compute_address(place, root_address)
; [eval] Size$I64$()
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _1$place<Place>  Place) _1$address@4@01)
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01))))
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
    (compute_address<Address> (as _21$place<Place>  Place) _21$address@71@01)
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01))
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
    _2$address@62@01
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01))
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
    _0$address@0@01
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01))
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
    _3$address@79@01
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01))
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
    _17$address@53@01
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01))
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
(assert (not (=
  (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _21$place<Place>  Place) _21$address@71@01))
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01))))
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
(declare-const $k@316@01 $Perm)
(assert ($Perm.isReadVar $k@316@01))
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _1$place<Place>  Place) _1$address@4@01)
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01))))
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
    (compute_address<Address> (as _21$place<Place>  Place) _21$address@71@01)
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01))
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
    _2$address@62@01
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01))
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
    _0$address@0@01
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01))
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
    _3$address@79@01
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01))
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
(assert (not (and
  (=
    _17$address@53@01
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
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
  (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _21$place<Place>  Place) _21$address@71@01))
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (< $k@316@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@316@01)))
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (< $Perm.No $k@316@01)))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@311@01)) (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01) (as Size$I64$<Snap$Usize>  Snap$Usize)))
(pop) ; 7
; Joined path conditions
(assert ($Perm.isReadVar $k@316@01))
(assert (and
  (< $k@316@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@316@01))
  (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@311@01)) (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01) (as Size$I64$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$I64(snapshot)
(set-option :timeout 0)
(push) ; 7
(assert (not (=
  (MemoryBlock$bytes ($Snap.first ($Snap.second $t@311@01)) (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
  (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _21$snapshot$1@73@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (=
  (MemoryBlock$bytes ($Snap.first ($Snap.second $t@311@01)) (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
  (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _21$snapshot$1@73@01))))
(assert (OwnedNonAliased$I64%trigger ($Snap.combine
  $Snap.unit
  ($Snap.combine ($Snap.first ($Snap.second $t@311@01)) $Snap.unit)) (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01 (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _21$snapshot$1@73@01)))
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (=
    (as _9$place<Place>  Place)
    (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)))
  (= _9$address@105@01 _21$address@71@01)
  (=
    _9$snapshot$1@107@01
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _21$snapshot$1@73@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [exec]
; move_place$I64(_1$place(), _1$address, field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(_21$place()),
;   _21$address, destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(_21$snapshot$1))
; [eval] _1$place()
; [eval] field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(_21$place())
; [eval] _21$place()
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(_21$snapshot$1)
; [eval] compute_address(target_place, target_root_address)
; [eval] Size$I64$()
(declare-const $t@317@01 $Snap)
(assert (= $t@317@01 ($Snap.combine ($Snap.first $t@317@01) ($Snap.second $t@317@01))))
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (= (as _9$place<Place>  Place) (as _1$place<Place>  Place))
  (= _9$address@105@01 _1$address@4@01)
  (=
    _9$snapshot$1@107@01
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _21$snapshot$1@73@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second $t@317@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@317@01))
    ($Snap.second ($Snap.second $t@317@01)))))
; [eval] compute_address(source_place, source_root_address)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (=
    _17$address@53@01
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01))
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
    _3$address@79@01
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01))
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
    _0$address@0@01
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01))
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
    _2$address@62@01
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01))
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
    (compute_address<Address> (as _21$place<Place>  Place) _21$address@71@01)
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (= ($Snap.second ($Snap.second $t@317@01)) $Snap.unit))
; [eval] valid$Snap$I64(source_snapshot)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _1$snapshot$2 ==
;   destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(_21$snapshot$1)
(declare-const $t@318@01 $Snap)
(assert (= $t@318@01 $Snap.unit))
; [eval] _1$snapshot$2 == destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(_21$snapshot$1)
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(_21$snapshot$1)
(assert (=
  _1$snapshot$2@7@01
  (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _21$snapshot$1@73@01)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [eval] loop__label_bb7__label_bb8$marker && (label_5_custom$marker && label_bb14$marker)
; [then-branch: 16 | False | dead]
; [else-branch: 16 | True | live]
(set-option :timeout 0)
(push) ; 7
; [else-branch: 16 | True]
(pop) ; 7
; [eval] !(loop__label_bb7__label_bb8$marker && (label_5_custom$marker && label_bb14$marker))
; [eval] loop__label_bb7__label_bb8$marker && (label_5_custom$marker && label_bb14$marker)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [then-branch: 17 | True | live]
; [else-branch: 17 | False | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 17 | True]
; [exec]
; write_place_constant$Tuple$$$(_2$place(), _2$address, constructor$Snap$Tuple$$$$())
; [eval] _2$place()
; [eval] constructor$Snap$Tuple$$$$()
; [eval] compute_address(target_place, target_root_address)
; [eval] Size$Tuple$$$$()
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01)
    (compute_address<Address> (as _2$place<Place>  Place) _2$address@62@01))
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
    _17$address@53@01
    (compute_address<Address> (as _2$place<Place>  Place) _2$address@62@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
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
    _3$address@79@01
    (compute_address<Address> (as _2$place<Place>  Place) _2$address@62@01))
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
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
  _0$address@0@01
  (compute_address<Address> (as _2$place<Place>  Place) _2$address@62@01))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  _2$address@62@01
  (compute_address<Address> (as _2$place<Place>  Place) _2$address@62@01))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [eval] valid$Snap$Tuple$$$(source_snapshot)
(declare-const $t@319@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _2$snapshot$4 == constructor$Snap$Tuple$$$$()
(declare-const $t@320@01 $Snap)
(assert (= $t@320@01 $Snap.unit))
; [eval] _2$snapshot$4 == constructor$Snap$Tuple$$$$()
; [eval] constructor$Snap$Tuple$$$$()
(assert (=
  _2$snapshot$4@67@01
  (as constructor$Snap$Tuple$$$$<Snap$Tuple$$$>  Snap$Tuple$$$)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; into_memory_block$I64(_9$place(), _9$address, _9$snapshot$4)
; [eval] _9$place()
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (= (as _1$place<Place>  Place) (as _9$place<Place>  Place))
  (= _1$address@4@01 _9$address@105@01)
  (=
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _21$snapshot$1@73@01)
    _9$snapshot$4@110@01))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= _9$snapshot$1@107@01 _9$snapshot$4@110@01)))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [eval] compute_address(place, root_address)
; [eval] Size$I64$()
(declare-const $t@321@01 $Snap)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01)
  (compute_address<Address> (as _9$place<Place>  Place) _9$address@105@01))))
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
    _17$address@53@01
    (compute_address<Address> (as _9$place<Place>  Place) _9$address@105@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
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
    _3$address@79@01
    (compute_address<Address> (as _9$place<Place>  Place) _9$address@105@01))
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
(assert (not (and
  (=
    _0$address@0@01
    (compute_address<Address> (as _9$place<Place>  Place) _9$address@105@01))
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
    (compute_address<Address> (as _21$place<Place>  Place) _21$address@71@01)
    (compute_address<Address> (as _9$place<Place>  Place) _9$address@105@01))
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
; exhale acc(MemoryBlock(_9$address, Size$I64$()), write)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _9$place<Place>  Place) _9$address@105@01)
  _9$address@105@01)))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(MemoryBlockStackDrop(_9$address, Size$I64$()), write)
; [eval] Size$I64$()
; [exec]
; exhale acc(MemoryBlock(_3$address, Size$Bool$()), write)
; [eval] Size$Bool$()
; [exec]
; exhale acc(MemoryBlockStackDrop(_3$address, Size$Bool$()), write)
; [eval] Size$Bool$()
; [exec]
; label loop__label_bb1__label_bb1
; [exec]
; loop__label_bb1__label_bb1$marker := true
; [exec]
; inhale basic_block_marker$loop__label_bb1__label_bb1$marker()
(declare-const $t@322@01 $Snap)
(assert (= $t@322@01 $Snap.unit))
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
(declare-const $t@323@01 $Snap)
(assert (= $t@323@01 $Snap.unit))
; [eval] basic_block_marker$loop__label_bb1__label_bb2$marker()
(assert (as basic_block_marker$loop__label_bb1__label_bb2$marker<Bool>  Bool))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlock(_3$address, Size$Bool$()), write)
; [eval] Size$Bool$()
(declare-const $t@324@01 $Snap)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _21$place<Place>  Place) _21$address@71@01)
    _3$address@79@01)
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
  (= _0$address@0@01 _3$address@79@01)
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
  (= _17$address@53@01 _3$address@79@01)
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
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
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01)
    _3$address@79@01)
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
; inhale acc(MemoryBlockStackDrop(_3$address, Size$Bool$()), write)
; [eval] Size$Bool$()
(declare-const $t@325@01 $Snap)
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlock(_4$address, Size$I64$()), write)
; [eval] Size$I64$()
(declare-const $t@326@01 $Snap)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (= _3$address@79@01 _4$address@86@01)
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
(assert (not (and
  (=
    (compute_address<Address> (as _21$place<Place>  Place) _21$address@71@01)
    _4$address@86@01)
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
  (= _0$address@0@01 _4$address@86@01)
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
  (= _17$address@53@01 _4$address@86@01)
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
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
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01)
  _4$address@86@01)))
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
; inhale acc(MemoryBlockStackDrop(_4$address, Size$I64$()), write)
; [eval] Size$I64$()
(declare-const $t@327@01 $Snap)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (= _3$address@79@01 _4$address@86@01)
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
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
; copy_place$I64(_4$place(), _4$address, _1$place(), _1$address, _1$snapshot$2,
;   write)
; [eval] _4$place()
; [eval] _1$place()
; [eval] none < source_permission_amount
; [eval] compute_address(target_place, target_root_address)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01)
  (compute_address<Address> (as _4$place<Place>  Place) _4$address@86@01))))
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
    _17$address@53@01
    (compute_address<Address> (as _4$place<Place>  Place) _4$address@86@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
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
    _0$address@0@01
    (compute_address<Address> (as _4$place<Place>  Place) _4$address@86@01))
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
    (compute_address<Address> (as _21$place<Place>  Place) _21$address@71@01)
    (compute_address<Address> (as _4$place<Place>  Place) _4$address@86@01))
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
    _3$address@79@01
    (compute_address<Address> (as _4$place<Place>  Place) _4$address@86@01))
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
  _4$address@86@01
  (compute_address<Address> (as _4$place<Place>  Place) _4$address@86@01))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _21$snapshot$1@73@01)
  _1$snapshot$2@7@01)))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(declare-const $t@328@01 $Snap)
(assert (= $t@328@01 ($Snap.combine ($Snap.first $t@328@01) ($Snap.second $t@328@01))))
(assert (=
  ($Snap.second $t@328@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@328@01))
    ($Snap.second ($Snap.second $t@328@01)))))
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (= (as _1$place<Place>  Place) (as _4$place<Place>  Place))
  (= _1$address@4@01 _4$address@86@01))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (= ($Snap.second ($Snap.second $t@328@01)) $Snap.unit))
; [eval] valid$Snap$I64(source_snapshot)
(assert (valid$Snap$I64<Bool> _1$snapshot$2@7@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _4$snapshot$2 == _1$snapshot$2
(declare-const $t@329@01 $Snap)
(assert (= $t@329@01 $Snap.unit))
; [eval] _4$snapshot$2 == _1$snapshot$2
(assert (= _4$snapshot$2@89@01 _1$snapshot$2@7@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; tmp$9 := assign$Bool$BinaryOp$GtCmp$Move$I64$Constant$I64$$$$(_3$place(), _3$address,
;   _4$place(), _4$address, _4$snapshot$2, constructor$Snap$I64$(0))
; [eval] _3$place()
; [eval] _4$place()
; [eval] constructor$Snap$I64$(0)
; [eval] compute_address(target_place, target_address)
; [eval] Size$Bool$()
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01)
    (compute_address<Address> (as _3$place<Place>  Place) _3$address@79@01))
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
    _17$address@53@01
    (compute_address<Address> (as _3$place<Place>  Place) _3$address@79@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
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
    (compute_address<Address> (as _3$place<Place>  Place) _3$address@79@01))
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
    (compute_address<Address> (as _21$place<Place>  Place) _21$address@71@01)
    (compute_address<Address> (as _3$place<Place>  Place) _3$address@79@01))
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
(assert (not (=
  _3$address@79@01
  (compute_address<Address> (as _3$place<Place>  Place) _3$address@79@01))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= _1$snapshot$2@7@01 _4$snapshot$2@89@01)))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [eval] valid$Snap$I64(operand1_value)
(set-option :timeout 0)
(push) ; 8
(assert (not (valid$Snap$I64<Bool> _4$snapshot$2@89@01)))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (valid$Snap$I64<Bool> _4$snapshot$2@89@01))
; [eval] valid$Snap$I64(operand2_value)
(declare-const result_value@330@01 Snap$Bool)
(declare-const $t@331@01 $Snap)
(assert (= $t@331@01 ($Snap.combine ($Snap.first $t@331@01) ($Snap.second $t@331@01))))
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _21$place<Place>  Place))
    (as _3$place<Place>  Place))
  (= _21$address@71@01 _3$address@79@01)
  (=
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> result_value@310@01)
    result_value@330@01))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second $t@331@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@331@01))
    ($Snap.second ($Snap.second $t@331@01)))))
; [eval] compute_address(operand1_place, operand1_root_address)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01)
  (compute_address<Address> (as _4$place<Place>  Place) _4$address@86@01))))
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
    _17$address@53@01
    (compute_address<Address> (as _4$place<Place>  Place) _4$address@86@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
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
    _0$address@0@01
    (compute_address<Address> (as _4$place<Place>  Place) _4$address@86@01))
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
    (compute_address<Address> (as _21$place<Place>  Place) _21$address@71@01)
    (compute_address<Address> (as _4$place<Place>  Place) _4$address@86@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second $t@331@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@331@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@331@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@331@01))) $Snap.unit))
; [eval] result_value == constructor$Snap$Bool$GtCmp_I64(operand1_value, operand2_value)
; [eval] constructor$Snap$Bool$GtCmp_I64(operand1_value, operand2_value)
(assert (=
  result_value@330@01
  (constructor$Snap$Bool$GtCmp_I64<Snap$Bool> _4$snapshot$2@89@01 (constructor$Snap$I64$<Snap$I64> 0))))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@331@01))) $Snap.unit))
; [eval] valid$Snap$Bool(result_value)
(assert (valid$Snap$Bool<Bool> result_value@330@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _3$snapshot$2 == tmp$9
(declare-const $t@332@01 $Snap)
(assert (= $t@332@01 $Snap.unit))
; [eval] _3$snapshot$2 == tmp$9
(assert (= _3$snapshot$2@82@01 result_value@330@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; exhale acc(MemoryBlock(_4$address, Size$I64$()), write)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _4$place<Place>  Place) _4$address@86@01)
  _4$address@86@01)))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(MemoryBlockStackDrop(_4$address, Size$I64$()), write)
; [eval] Size$I64$()
; [eval] !destructor$Snap$Bool$$value(_3$snapshot$2)
; [eval] destructor$Snap$Bool$$value(_3$snapshot$2)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (destructor$Snap$Bool$$value<Bool> _3$snapshot$2@82@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (not (destructor$Snap$Bool$$value<Bool> _3$snapshot$2@82@01))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [then-branch: 18 | !(destructor$Snap$Bool$$value[Bool](_3$snapshot$2@82@01)) | live]
; [else-branch: 18 | destructor$Snap$Bool$$value[Bool](_3$snapshot$2@82@01) | dead]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 18 | !(destructor$Snap$Bool$$value[Bool](_3$snapshot$2@82@01))]
(assert (not (destructor$Snap$Bool$$value<Bool> _3$snapshot$2@82@01)))
; [exec]
; label label__from__loop__label_bb1__label_bb2__to__label_3_custom
; [exec]
; inhale _1$snapshot$4 == _1$snapshot$2
(declare-const $t@333@01 $Snap)
(assert (= $t@333@01 $Snap.unit))
; [eval] _1$snapshot$4 == _1$snapshot$2
(assert (= _1$snapshot$4@9@01 _1$snapshot$2@7@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale _10$snapshot$4 == _10$snapshot$1
(declare-const $t@334@01 $Snap)
(assert (= $t@334@01 $Snap.unit))
; [eval] _10$snapshot$4 == _10$snapshot$1
(assert (= _10$snapshot$4@16@01 _10$snapshot$1@13@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _11$snapshot$6 == _11$snapshot$3
(declare-const $t@335@01 $Snap)
(assert (= $t@335@01 $Snap.unit))
; [eval] _11$snapshot$6 == _11$snapshot$3
(assert (= _11$snapshot$6@25@01 _11$snapshot$3@22@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _12$snapshot$6 == _12$snapshot$3
(declare-const $t@336@01 $Snap)
(assert (= $t@336@01 $Snap.unit))
; [eval] _12$snapshot$6 == _12$snapshot$3
(assert (= _12$snapshot$6@34@01 _12$snapshot$3@31@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _13$snapshot$5 == _13$snapshot$2
(declare-const $t@337@01 $Snap)
(assert (= $t@337@01 $Snap.unit))
; [eval] _13$snapshot$5 == _13$snapshot$2
(assert (= _13$snapshot$5@42@01 _13$snapshot$2@39@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _14$snapshot$6 == _14$snapshot$3
(declare-const $t@338@01 $Snap)
(assert (= $t@338@01 $Snap.unit))
; [eval] _14$snapshot$6 == _14$snapshot$3
(assert (= _14$snapshot$6@51@01 _14$snapshot$3@48@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _17$snapshot$5 == _17$snapshot$2
(declare-const $t@339@01 $Snap)
(assert (= $t@339@01 $Snap.unit))
; [eval] _17$snapshot$5 == _17$snapshot$2
(assert (= _17$snapshot$5@59@01 _17$snapshot$2@56@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _2$snapshot$6 == _2$snapshot$4
(declare-const $t@340@01 $Snap)
(assert (= $t@340@01 $Snap.unit))
; [eval] _2$snapshot$6 == _2$snapshot$4
(assert (= _2$snapshot$6@69@01 _2$snapshot$4@67@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _21$snapshot$4 == _21$snapshot$1
(declare-const $t@341@01 $Snap)
(assert (= $t@341@01 $Snap.unit))
; [eval] _21$snapshot$4 == _21$snapshot$1
(assert (= _21$snapshot$4@76@01 _21$snapshot$1@73@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _3$snapshot$4 == _3$snapshot$2
(declare-const $t@342@01 $Snap)
(assert (= $t@342@01 $Snap.unit))
; [eval] _3$snapshot$4 == _3$snapshot$2
(assert (= _3$snapshot$4@84@01 _3$snapshot$2@82@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _4$snapshot$4 == _4$snapshot$2
(declare-const $t@343@01 $Snap)
(assert (= $t@343@01 $Snap.unit))
; [eval] _4$snapshot$4 == _4$snapshot$2
(assert (= _4$snapshot$4@91@01 _4$snapshot$2@89@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _5$snapshot$2 == _5$snapshot$1
(declare-const $t@344@01 $Snap)
(assert (= $t@344@01 $Snap.unit))
; [eval] _5$snapshot$2 == _5$snapshot$1
(assert (= _5$snapshot$2@96@01 _5$snapshot$1@95@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _6$snapshot$4 == _6$snapshot$1
(declare-const $t@345@01 $Snap)
(assert (= $t@345@01 $Snap.unit))
; [eval] _6$snapshot$4 == _6$snapshot$1
(assert (= _6$snapshot$4@103@01 _6$snapshot$1@100@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _9$snapshot$7 == _9$snapshot$4
(declare-const $t@346@01 $Snap)
(assert (= $t@346@01 $Snap.unit))
; [eval] _9$snapshot$7 == _9$snapshot$4
(assert (= _9$snapshot$7@113@01 _9$snapshot$4@110@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale loop_variant$1$snapshot$3 == loop_variant$1$snapshot$2
(declare-const $t@347@01 $Snap)
(assert (= $t@347@01 $Snap.unit))
; [eval] loop_variant$1$snapshot$3 == loop_variant$1$snapshot$2
(assert (= loop_variant$1$snapshot$3@153@01 loop_variant$1$snapshot$2@152@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale loop_variant$2$snapshot$6 == loop_variant$2$snapshot$3
(declare-const $t@348@01 $Snap)
(assert (= $t@348@01 $Snap.unit))
; [eval] loop_variant$2$snapshot$6 == loop_variant$2$snapshot$3
(assert (= loop_variant$2$snapshot$6@161@01 loop_variant$2$snapshot$3@158@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; label label_3_custom
; [exec]
; label_3_custom$marker := true
; [exec]
; inhale basic_block_marker$label_3_custom$marker()
(declare-const $t@349@01 $Snap)
(assert (= $t@349@01 $Snap.unit))
; [eval] basic_block_marker$label_3_custom$marker()
(assert (as basic_block_marker$label_3_custom$marker<Bool>  Bool))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; label label_bb16
; [exec]
; label_bb16$marker := true
; [exec]
; inhale basic_block_marker$label_bb16$marker()
(declare-const $t@350@01 $Snap)
(assert (= $t@350@01 $Snap.unit))
; [eval] basic_block_marker$label_bb16$marker()
(assert (as basic_block_marker$label_bb16$marker<Bool>  Bool))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlock(_23$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
(declare-const $t@351@01 $Snap)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _21$place<Place>  Place) _21$address@71@01)
    _23$address@78@01)
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
(assert (not (= _0$address@0@01 _23$address@78@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (= _17$address@53@01 _23$address@78@01)
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
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
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01)
    _23$address@78@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
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
; inhale acc(MemoryBlockStackDrop(_23$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
(declare-const $t@352@01 $Snap)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (= _3$address@79@01 _23$address@78@01)
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
; write_place_constant$Tuple$$$(_0$place(), _0$address, constructor$Snap$Tuple$$$$())
; [eval] _0$place()
; [eval] constructor$Snap$Tuple$$$$()
; [eval] compute_address(target_place, target_root_address)
; [eval] Size$Tuple$$$$()
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01)
    (compute_address<Address> (as _0$place<Place>  Place) _0$address@0@01))
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
    _17$address@53@01
    (compute_address<Address> (as _0$place<Place>  Place) _0$address@0@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  _0$address@0@01
  (compute_address<Address> (as _0$place<Place>  Place) _0$address@0@01))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [eval] valid$Snap$Tuple$$$(source_snapshot)
(declare-const $t@353@01 $Snap)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (= (as _2$place<Place>  Place) (as _0$place<Place>  Place))
  (= _2$address@62@01 _0$address@0@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _0$snapshot$1 == constructor$Snap$Tuple$$$$()
(declare-const $t@354@01 $Snap)
(assert (= $t@354@01 $Snap.unit))
; [eval] _0$snapshot$1 == constructor$Snap$Tuple$$$$()
; [eval] constructor$Snap$Tuple$$$$()
(assert (=
  _0$snapshot$1@2@01
  (as constructor$Snap$Tuple$$$$<Snap$Tuple$$$>  Snap$Tuple$$$)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; exhale acc(MemoryBlock(_23$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
; [exec]
; exhale acc(MemoryBlockStackDrop(_23$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
; [exec]
; into_memory_block$Bool(_3$place(), _3$address, _3$snapshot$4)
; [eval] _3$place()
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= result_value@330@01 _3$snapshot$4@84@01)))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [eval] compute_address(place, root_address)
; [eval] Size$Bool$()
(declare-const $t@355@01 $Snap)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01)
    (compute_address<Address> (as _3$place<Place>  Place) _3$address@79@01))
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
    _17$address@53@01
    (compute_address<Address> (as _3$place<Place>  Place) _3$address@79@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
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
    (compute_address<Address> (as _21$place<Place>  Place) _21$address@71@01)
    (compute_address<Address> (as _3$place<Place>  Place) _3$address@79@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; exhale acc(MemoryBlock(_3$address, Size$Bool$()), write)
; [eval] Size$Bool$()
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _3$place<Place>  Place) _3$address@79@01)
  _3$address@79@01)))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(MemoryBlockStackDrop(_3$address, Size$Bool$()), write)
; [eval] Size$Bool$()
; [exec]
; label return_label
; [exec]
; return_label$marker := true
; [exec]
; inhale basic_block_marker$return_label$marker()
(declare-const $t@356@01 $Snap)
(assert (= $t@356@01 $Snap.unit))
; [eval] basic_block_marker$return_label$marker()
(assert (as basic_block_marker$return_label$marker<Bool>  Bool))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; into_memory_block$I64(_1$place(), _1$address, _1$snapshot$4)
; [eval] _1$place()
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= _1$snapshot$2@7@01 _1$snapshot$4@9@01)))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [eval] compute_address(place, root_address)
; [eval] Size$I64$()
(declare-const $t@357@01 $Snap)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _21$place<Place>  Place) _21$address@71@01)
    (compute_address<Address> (as _1$place<Place>  Place) _1$address@4@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
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
    _17$address@53@01
    (compute_address<Address> (as _1$place<Place>  Place) _1$address@4@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01)
  (compute_address<Address> (as _1$place<Place>  Place) _1$address@4@01))))
(check-sat)
; unknown
(pop) ; 9
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
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _1$place<Place>  Place) _1$address@4@01)
  _1$address@4@01)))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(OwnedNonAliased$Tuple$$$(_0$place(), _0$address, _0$snapshot$1), write) &&
;   valid$Snap$Tuple$$$(_0$snapshot$1)
; [eval] _0$place()
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  (as constructor$Snap$Tuple$$$$<Snap$Tuple$$$>  Snap$Tuple$$$)
  _0$snapshot$1@2@01)))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [eval] valid$Snap$Tuple$$$(_0$snapshot$1)
(set-option :timeout 0)
(push) ; 9
(assert (not (valid$Snap$Tuple$$$<Bool> _0$snapshot$1@2@01)))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (valid$Snap$Tuple$$$<Bool> _0$snapshot$1@2@01))
; [exec]
; lft_tok_sep_return$2(lft_1$snapshot$1, bw2$snapshot$0, bw3$snapshot$0, lifetime_token_perm_amount$0$snapshot$0 /
;   16)
; [eval] lifetime_token_perm_amount$0$snapshot$0 / 16
; [eval] none < rd_perm
(push) ; 9
(assert (not (or
  (= (/ lifetime_token_perm_amount$0$snapshot$0@141@01 (to_real 16)) $Perm.No)
  (< $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@141@01 (to_real 16))))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(push) ; 9
(set-option :timeout 10)
(assert (not (< $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@141@01 (to_real 16)))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [eval] lft == intersect(Set(lft_1, lft_2))
; [eval] intersect(Set(lft_1, lft_2))
; [eval] Set(lft_1, lft_2)
(declare-const $t@358@01 $Snap)
(assert (= $t@358@01 ($Snap.combine ($Snap.first $t@358@01) ($Snap.second $t@358@01))))
(set-option :timeout 0)
(push) ; 9
(assert (not (or
  (= (/ lifetime_token_perm_amount$0$snapshot$0@141@01 (to_real 16)) $Perm.No)
  (< $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@141@01 (to_real 16))))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(declare-const $t@359@01 $Snap)
(assert (and
  (=>
    (<
      $Perm.No
      (-
        lifetime_token_perm_amount$0$snapshot$0@141@01
        ($Perm.min
          lifetime_token_perm_amount$0$snapshot$0@141@01
          (/ lifetime_token_perm_amount$0$snapshot$0@141@01 (to_real 16)))))
    (= $t@359@01 $t@180@01))
  (=>
    (< $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@141@01 (to_real 16)))
    (= $t@359@01 ($Snap.first $t@358@01)))))
(assert (<=
  $Perm.No
  (+
    (-
      lifetime_token_perm_amount$0$snapshot$0@141@01
      ($Perm.min
        lifetime_token_perm_amount$0$snapshot$0@141@01
        (/ lifetime_token_perm_amount$0$snapshot$0@141@01 (to_real 16))))
    (/ lifetime_token_perm_amount$0$snapshot$0@141@01 (to_real 16)))))
(push) ; 9
(assert (not (or
  (= (/ lifetime_token_perm_amount$0$snapshot$0@141@01 (to_real 16)) $Perm.No)
  (< $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@141@01 (to_real 16))))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(declare-const $t@360@01 $Snap)
(assert (and
  (=>
    (<
      $Perm.No
      (-
        lifetime_token_perm_amount$0$snapshot$0@141@01
        ($Perm.min
          lifetime_token_perm_amount$0$snapshot$0@141@01
          (/ lifetime_token_perm_amount$0$snapshot$0@141@01 (to_real 16)))))
    (= $t@360@01 $t@181@01))
  (=>
    (< $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@141@01 (to_real 16)))
    (= $t@360@01 ($Snap.second $t@358@01)))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; exhale acc(LifetimeToken(bw2$snapshot$0), lifetime_token_perm_amount$0$snapshot$0)
(set-option :timeout 0)
(push) ; 9
(assert (not (or
  (= lifetime_token_perm_amount$0$snapshot$0@141@01 $Perm.No)
  (< $Perm.No lifetime_token_perm_amount$0$snapshot$0@141@01))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  (-
    (+
      (-
        lifetime_token_perm_amount$0$snapshot$0@141@01
        ($Perm.min
          lifetime_token_perm_amount$0$snapshot$0@141@01
          (/ lifetime_token_perm_amount$0$snapshot$0@141@01 (to_real 16))))
      (/ lifetime_token_perm_amount$0$snapshot$0@141@01 (to_real 16)))
    ($Perm.min
      (+
        (-
          lifetime_token_perm_amount$0$snapshot$0@141@01
          ($Perm.min
            lifetime_token_perm_amount$0$snapshot$0@141@01
            (/ lifetime_token_perm_amount$0$snapshot$0@141@01 (to_real 16))))
        (/ lifetime_token_perm_amount$0$snapshot$0@141@01 (to_real 16)))
      lifetime_token_perm_amount$0$snapshot$0@141@01))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(assert (not (or
  (=
    (-
      lifetime_token_perm_amount$0$snapshot$0@141@01
      ($Perm.min
        (+
          (-
            lifetime_token_perm_amount$0$snapshot$0@141@01
            ($Perm.min
              lifetime_token_perm_amount$0$snapshot$0@141@01
              (/ lifetime_token_perm_amount$0$snapshot$0@141@01 (to_real 16))))
          (/ lifetime_token_perm_amount$0$snapshot$0@141@01 (to_real 16)))
        lifetime_token_perm_amount$0$snapshot$0@141@01))
    $Perm.No)
  (<
    (-
      lifetime_token_perm_amount$0$snapshot$0@141@01
      ($Perm.min
        (+
          (-
            lifetime_token_perm_amount$0$snapshot$0@141@01
            ($Perm.min
              lifetime_token_perm_amount$0$snapshot$0@141@01
              (/ lifetime_token_perm_amount$0$snapshot$0@141@01 (to_real 16))))
          (/ lifetime_token_perm_amount$0$snapshot$0@141@01 (to_real 16)))
        lifetime_token_perm_amount$0$snapshot$0@141@01))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(push) ; 9
(set-option :timeout 10)
(assert (not (< $Perm.No lifetime_token_perm_amount$0$snapshot$0@141@01)))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(LifetimeToken(bw3$snapshot$0), lifetime_token_perm_amount$0$snapshot$0)
(set-option :timeout 0)
(push) ; 9
(assert (not (or
  (= lifetime_token_perm_amount$0$snapshot$0@141@01 $Perm.No)
  (< $Perm.No lifetime_token_perm_amount$0$snapshot$0@141@01))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  (-
    (+
      (-
        lifetime_token_perm_amount$0$snapshot$0@141@01
        ($Perm.min
          lifetime_token_perm_amount$0$snapshot$0@141@01
          (/ lifetime_token_perm_amount$0$snapshot$0@141@01 (to_real 16))))
      (/ lifetime_token_perm_amount$0$snapshot$0@141@01 (to_real 16)))
    ($Perm.min
      (+
        (-
          lifetime_token_perm_amount$0$snapshot$0@141@01
          ($Perm.min
            lifetime_token_perm_amount$0$snapshot$0@141@01
            (/ lifetime_token_perm_amount$0$snapshot$0@141@01 (to_real 16))))
        (/ lifetime_token_perm_amount$0$snapshot$0@141@01 (to_real 16)))
      lifetime_token_perm_amount$0$snapshot$0@141@01))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(assert (not (or
  (=
    (-
      lifetime_token_perm_amount$0$snapshot$0@141@01
      ($Perm.min
        (+
          (-
            lifetime_token_perm_amount$0$snapshot$0@141@01
            ($Perm.min
              lifetime_token_perm_amount$0$snapshot$0@141@01
              (/ lifetime_token_perm_amount$0$snapshot$0@141@01 (to_real 16))))
          (/ lifetime_token_perm_amount$0$snapshot$0@141@01 (to_real 16)))
        lifetime_token_perm_amount$0$snapshot$0@141@01))
    $Perm.No)
  (<
    (-
      lifetime_token_perm_amount$0$snapshot$0@141@01
      ($Perm.min
        (+
          (-
            lifetime_token_perm_amount$0$snapshot$0@141@01
            ($Perm.min
              lifetime_token_perm_amount$0$snapshot$0@141@01
              (/ lifetime_token_perm_amount$0$snapshot$0@141@01 (to_real 16))))
          (/ lifetime_token_perm_amount$0$snapshot$0@141@01 (to_real 16)))
        lifetime_token_perm_amount$0$snapshot$0@141@01))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(push) ; 9
(set-option :timeout 10)
(assert (not (< $Perm.No lifetime_token_perm_amount$0$snapshot$0@141@01)))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [eval] loop__label_bb1__label_bb2$marker && (label_3_custom$marker && label_bb16$marker)
(set-option :timeout 0)
(push) ; 9
; [then-branch: 19 | True | live]
; [else-branch: 19 | False | live]
(push) ; 10
; [then-branch: 19 | True]
(push) ; 11
; [then-branch: 20 | True | live]
; [else-branch: 20 | False | live]
(push) ; 12
; [then-branch: 20 | True]
(pop) ; 12
(push) ; 12
; [else-branch: 20 | False]
(assert false)
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(pop) ; 10
(push) ; 10
; [else-branch: 19 | False]
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
; 0.00s
; (get-info :all-statistics)
; [then-branch: 21 | True | live]
; [else-branch: 21 | False | dead]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 21 | True]
; [exec]
; into_memory_block$Tuple$$$(_2$place(), _2$address, _2$snapshot$6)
; [eval] _2$place()
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  (as constructor$Snap$Tuple$$$$<Snap$Tuple$$$>  Snap$Tuple$$$)
  _2$snapshot$6@69@01)))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [eval] compute_address(place, root_address)
; [eval] Size$Tuple$$$$()
(declare-const $t@361@01 $Snap)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01)
    (compute_address<Address> (as _2$place<Place>  Place) _2$address@62@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
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
    _17$address@53@01
    (compute_address<Address> (as _2$place<Place>  Place) _2$address@62@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
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
    (compute_address<Address> (as _21$place<Place>  Place) _21$address@71@01)
    (compute_address<Address> (as _2$place<Place>  Place) _2$address@62@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; exhale acc(MemoryBlock(_2$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _2$place<Place>  Place) _2$address@62@01)
  _2$address@62@01)))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [eval] loop__label_bb7__label_bb8$marker && (label_5_custom$marker && (label_bb14$marker && (label_bb15$marker && (loop__label_bb1__label_bb1$marker && (loop__label_bb1__label_bb2$marker && (label_3_custom$marker && label_bb16$marker))))))
; [then-branch: 22 | False | dead]
; [else-branch: 22 | True | live]
(set-option :timeout 0)
(push) ; 10
; [else-branch: 22 | True]
(pop) ; 10
; [eval] !(loop__label_bb7__label_bb8$marker && (label_5_custom$marker && (label_bb14$marker && (label_bb15$marker && (loop__label_bb1__label_bb1$marker && (loop__label_bb1__label_bb2$marker && (label_3_custom$marker && label_bb16$marker)))))))
; [eval] loop__label_bb7__label_bb8$marker && (label_5_custom$marker && (label_bb14$marker && (label_bb15$marker && (loop__label_bb1__label_bb1$marker && (loop__label_bb1__label_bb2$marker && (label_3_custom$marker && label_bb16$marker))))))
(push) ; 10
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [then-branch: 23 | True | live]
; [else-branch: 23 | False | dead]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 23 | True]
; [eval] loop__label_bb7__label_bb8$marker && (label_5_custom$marker && (label_bb14$marker && (label_bb15$marker && (loop__label_bb1__label_bb1$marker && (loop__label_bb1__label_bb2$marker && (label_3_custom$marker && label_bb16$marker))))))
; [then-branch: 24 | False | dead]
; [else-branch: 24 | True | live]
(push) ; 11
; [else-branch: 24 | True]
(pop) ; 11
; [eval] !(loop__label_bb7__label_bb8$marker && (label_5_custom$marker && (label_bb14$marker && (label_bb15$marker && (loop__label_bb1__label_bb1$marker && (loop__label_bb1__label_bb2$marker && (label_3_custom$marker && label_bb16$marker)))))))
; [eval] loop__label_bb7__label_bb8$marker && (label_5_custom$marker && (label_bb14$marker && (label_bb15$marker && (loop__label_bb1__label_bb1$marker && (loop__label_bb1__label_bb2$marker && (label_3_custom$marker && label_bb16$marker))))))
(push) ; 11
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [then-branch: 25 | True | live]
; [else-branch: 25 | False | dead]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 25 | True]
; [exec]
; exhale acc(MemoryBlock(_17$address, Size$Tuple$$I64$Bool$$I64$Bool$$()), write)
; [eval] Size$Tuple$$I64$Bool$$I64$Bool$$()
; [eval] loop__label_bb1__label_bb2$marker && (label_3_custom$marker && label_bb16$marker)
(push) ; 12
; [then-branch: 26 | True | live]
; [else-branch: 26 | False | live]
(push) ; 13
; [then-branch: 26 | True]
(push) ; 14
; [then-branch: 27 | True | live]
; [else-branch: 27 | False | live]
(push) ; 15
; [then-branch: 27 | True]
(pop) ; 15
(push) ; 15
; [else-branch: 27 | False]
(assert false)
(pop) ; 15
(pop) ; 14
; Joined path conditions
; Joined path conditions
(pop) ; 13
(push) ; 13
; [else-branch: 26 | False]
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
; [then-branch: 28 | True | live]
; [else-branch: 28 | False | dead]
(set-option :timeout 0)
(push) ; 12
; [then-branch: 28 | True]
; [exec]
; into_memory_block$Bool(field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(_21$place()),
;   _21$address, destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(_21$snapshot$4))
; [eval] field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(_21$place())
; [eval] _21$place()
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(_21$snapshot$4)
(push) ; 13
(set-option :timeout 10)
(assert (not (=
  (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> result_value@310@01)
  (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> _21$snapshot$4@76@01))))
(check-sat)
; unsat
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
; [eval] compute_address(place, root_address)
; [eval] Size$Bool$()
(declare-const $t@362@01 $Snap)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _21$place<Place>  Place) _21$address@71@01)
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _21$place<Place>  Place)) _21$address@71@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
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
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01)
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _21$place<Place>  Place)) _21$address@71@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] loop__label_bb1__label_bb2$marker && (label_3_custom$marker && label_bb16$marker)
(set-option :timeout 0)
(push) ; 13
; [then-branch: 29 | True | live]
; [else-branch: 29 | False | live]
(push) ; 14
; [then-branch: 29 | True]
(push) ; 15
; [then-branch: 30 | True | live]
; [else-branch: 30 | False | live]
(push) ; 16
; [then-branch: 30 | True]
(pop) ; 16
(push) ; 16
; [else-branch: 30 | False]
(assert false)
(pop) ; 16
(pop) ; 15
; Joined path conditions
; Joined path conditions
(pop) ; 14
(push) ; 14
; [else-branch: 29 | False]
(assert false)
(pop) ; 14
(pop) ; 13
; Joined path conditions
; Joined path conditions
(push) ; 13
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
; [then-branch: 31 | True | live]
; [else-branch: 31 | False | dead]
(set-option :timeout 0)
(push) ; 13
; [then-branch: 31 | True]
; [exec]
; memory_block_join$Tuple$$I64$Bool$$I64$Bool$(_21$address, write)
; [eval] none < permission_amount
; [eval] PaddingSize$Tuple$$I64$Bool$$I64$Bool$$()
(push) ; 14
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _21$place<Place>  Place)) _21$address@71@01)
    _21$address@71@01)
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _21$place<Place>  Place) _21$address@71@01)
  _21$address@71@01)))
(check-sat)
; unsat
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
; [eval] field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _21$place<Place>  Place)) _21$address@71@01)
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _21$address@71@01))
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01)
  (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _21$address@71@01))))
(check-sat)
; unsat
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
; [eval] field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address)
; [eval] Size$Bool$()
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _21$place<Place>  Place)) _21$address@71@01)
  (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _21$address@71@01))))
(check-sat)
; unsat
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(declare-const $t@363@01 $Snap)
(assert (= $t@363@01 ($Snap.combine ($Snap.first $t@363@01) ($Snap.second $t@363@01))))
; [eval] Size$Tuple$$I64$Bool$$I64$Bool$$()
(assert (= ($Snap.second $t@363@01) $Snap.unit))
; [eval] (forall snapshot: Snap$Tuple$$I64$Bool$$I64$Bool$ :: { to_bytes$Tuple$$I64$Bool$$I64$Bool$(snapshot) } old(MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address), Size$I64$()) == to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot))) && old(MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address), Size$Bool$()) == to_bytes$Bool(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot))) ==> MemoryBlock$bytes(address, Size$Tuple$$I64$Bool$$I64$Bool$$()) == to_bytes$Tuple$$I64$Bool$$I64$Bool$(snapshot))
(declare-const snapshot@364@01 Snap$Tuple$$I64$Bool$$I64$Bool$)
(set-option :timeout 0)
(push) ; 14
; [eval] old(MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address), Size$I64$()) == to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot))) && old(MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address), Size$Bool$()) == to_bytes$Bool(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot))) ==> MemoryBlock$bytes(address, Size$Tuple$$I64$Bool$$I64$Bool$$()) == to_bytes$Tuple$$I64$Bool$$I64$Bool$(snapshot)
; [eval] old(MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address), Size$I64$()) == to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot))) && old(MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address), Size$Bool$()) == to_bytes$Bool(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot)))
; [eval] old(MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address), Size$I64$()) == to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot)))
; [eval] MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address), Size$I64$()) == to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot))
; [eval] MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address), Size$I64$())
; [eval] field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address)
; [eval] Size$I64$()
(push) ; 15
(declare-const $k@365@01 $Perm)
(assert ($Perm.isReadVar $k@365@01))
(push) ; 16
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _21$place<Place>  Place)) _21$address@71@01)
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _21$address@71@01))
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _21$place<Place>  Place) _21$address@71@01)
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _21$address@71@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01)
  (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _21$address@71@01))))
(check-sat)
; unsat
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(assert (< $k@365@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@365@01)))
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (< $Perm.No $k@365@01)))
(check-sat)
; unsat
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@317@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _21$address@71@01) (as Size$I64$<Snap$Usize>  Snap$Usize)))
(pop) ; 15
; Joined path conditions
(assert ($Perm.isReadVar $k@365@01))
(assert (and
  (< $k@365@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@365@01))
  (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@317@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _21$address@71@01) (as Size$I64$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot)
(set-option :timeout 0)
(push) ; 15
; [then-branch: 32 | MemoryBlock$bytes(First:(Second:($t@317@01)), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](_21$address@71@01), Size$I64$[Snap$Usize]) == to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@364@01)) | live]
; [else-branch: 32 | MemoryBlock$bytes(First:(Second:($t@317@01)), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](_21$address@71@01), Size$I64$[Snap$Usize]) != to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@364@01)) | live]
(push) ; 16
; [then-branch: 32 | MemoryBlock$bytes(First:(Second:($t@317@01)), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](_21$address@71@01), Size$I64$[Snap$Usize]) == to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@364@01))]
(assert (=
  (MemoryBlock$bytes ($Snap.first ($Snap.second $t@317@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _21$address@71@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
  (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@364@01))))
; [eval] old(MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address), Size$Bool$()) == to_bytes$Bool(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot)))
; [eval] MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address), Size$Bool$()) == to_bytes$Bool(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot))
; [eval] MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address), Size$Bool$())
; [eval] field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address)
; [eval] Size$Bool$()
(push) ; 17
(declare-const $k@366@01 $Perm)
(assert ($Perm.isReadVar $k@366@01))
(push) ; 18
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _21$place<Place>  Place)) _21$address@71@01)
  (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _21$address@71@01))))
(check-sat)
; unsat
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(assert (< $k@366@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@366@01)))
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (< $Perm.No $k@366@01)))
(check-sat)
; unsat
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition $t@362@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _21$address@71@01) (as Size$Bool$<Snap$Usize>  Snap$Usize)))
(pop) ; 17
; Joined path conditions
(assert ($Perm.isReadVar $k@366@01))
(assert (and
  (< $k@366@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@366@01))
  (MemoryBlock$bytes%precondition $t@362@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _21$address@71@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$Bool(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot)
(pop) ; 16
(set-option :timeout 0)
(push) ; 16
; [else-branch: 32 | MemoryBlock$bytes(First:(Second:($t@317@01)), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](_21$address@71@01), Size$I64$[Snap$Usize]) != to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@364@01))]
(assert (not
  (=
    (MemoryBlock$bytes ($Snap.first ($Snap.second $t@317@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _21$address@71@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
    (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@364@01)))))
(pop) ; 16
(pop) ; 15
; Joined path conditions
(assert ($Perm.isReadVar $k@366@01))
(assert (=>
  (=
    (MemoryBlock$bytes ($Snap.first ($Snap.second $t@317@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _21$address@71@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
    (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@364@01)))
  (and
    (=
      (MemoryBlock$bytes ($Snap.first ($Snap.second $t@317@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _21$address@71@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
      (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@364@01)))
    (< $k@366@01 $Perm.Write)
    (<= $Perm.No (- $Perm.Write $k@366@01))
    (MemoryBlock$bytes%precondition $t@362@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _21$address@71@01) (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
; Joined path conditions
(assert (or
  (not
    (=
      (MemoryBlock$bytes ($Snap.first ($Snap.second $t@317@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _21$address@71@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
      (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@364@01))))
  (=
    (MemoryBlock$bytes ($Snap.first ($Snap.second $t@317@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _21$address@71@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
    (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@364@01)))))
(push) ; 15
; [then-branch: 33 | MemoryBlock$bytes($t@362@01, field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Address](_21$address@71@01), Size$Bool$[Snap$Usize]) == to_bytes$Bool[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](snapshot@364@01)) && MemoryBlock$bytes(First:(Second:($t@317@01)), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](_21$address@71@01), Size$I64$[Snap$Usize]) == to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@364@01)) | live]
; [else-branch: 33 | !(MemoryBlock$bytes($t@362@01, field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Address](_21$address@71@01), Size$Bool$[Snap$Usize]) == to_bytes$Bool[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](snapshot@364@01)) && MemoryBlock$bytes(First:(Second:($t@317@01)), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](_21$address@71@01), Size$I64$[Snap$Usize]) == to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@364@01))) | live]
(push) ; 16
; [then-branch: 33 | MemoryBlock$bytes($t@362@01, field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Address](_21$address@71@01), Size$Bool$[Snap$Usize]) == to_bytes$Bool[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](snapshot@364@01)) && MemoryBlock$bytes(First:(Second:($t@317@01)), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](_21$address@71@01), Size$I64$[Snap$Usize]) == to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@364@01))]
(assert (and
  (=
    (MemoryBlock$bytes $t@362@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _21$address@71@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
    (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@364@01)))
  (=
    (MemoryBlock$bytes ($Snap.first ($Snap.second $t@317@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _21$address@71@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
    (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@364@01)))))
; [eval] MemoryBlock$bytes(address, Size$Tuple$$I64$Bool$$I64$Bool$$()) == to_bytes$Tuple$$I64$Bool$$I64$Bool$(snapshot)
; [eval] MemoryBlock$bytes(address, Size$Tuple$$I64$Bool$$I64$Bool$$())
; [eval] Size$Tuple$$I64$Bool$$I64$Bool$$()
(push) ; 17
(declare-const $k@367@01 $Perm)
(assert ($Perm.isReadVar $k@367@01))
(assert (< $k@367@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@367@01)))
(push) ; 18
(set-option :timeout 10)
(assert (not (< $Perm.No $k@367@01)))
(check-sat)
; unsat
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first $t@363@01) _21$address@71@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))
(pop) ; 17
; Joined path conditions
(assert ($Perm.isReadVar $k@367@01))
(assert (and
  (< $k@367@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@367@01))
  (MemoryBlock$bytes%precondition ($Snap.first $t@363@01) _21$address@71@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$Tuple$$I64$Bool$$I64$Bool$(snapshot)
(pop) ; 16
(set-option :timeout 0)
(push) ; 16
; [else-branch: 33 | !(MemoryBlock$bytes($t@362@01, field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Address](_21$address@71@01), Size$Bool$[Snap$Usize]) == to_bytes$Bool[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](snapshot@364@01)) && MemoryBlock$bytes(First:(Second:($t@317@01)), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](_21$address@71@01), Size$I64$[Snap$Usize]) == to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@364@01)))]
(assert (not
  (and
    (=
      (MemoryBlock$bytes $t@362@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _21$address@71@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
      (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@364@01)))
    (=
      (MemoryBlock$bytes ($Snap.first ($Snap.second $t@317@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _21$address@71@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
      (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@364@01))))))
(pop) ; 16
(pop) ; 15
; Joined path conditions
(assert ($Perm.isReadVar $k@367@01))
(assert (=>
  (and
    (=
      (MemoryBlock$bytes $t@362@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _21$address@71@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
      (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@364@01)))
    (=
      (MemoryBlock$bytes ($Snap.first ($Snap.second $t@317@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _21$address@71@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
      (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@364@01))))
  (and
    (=
      (MemoryBlock$bytes $t@362@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _21$address@71@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
      (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@364@01)))
    (=
      (MemoryBlock$bytes ($Snap.first ($Snap.second $t@317@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _21$address@71@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
      (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@364@01)))
    (< $k@367@01 $Perm.Write)
    (<= $Perm.No (- $Perm.Write $k@367@01))
    (MemoryBlock$bytes%precondition ($Snap.first $t@363@01) _21$address@71@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
; Joined path conditions
(assert (or
  (not
    (and
      (=
        (MemoryBlock$bytes $t@362@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _21$address@71@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
        (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@364@01)))
      (=
        (MemoryBlock$bytes ($Snap.first ($Snap.second $t@317@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _21$address@71@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
        (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@364@01)))))
  (and
    (=
      (MemoryBlock$bytes $t@362@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _21$address@71@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
      (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@364@01)))
    (=
      (MemoryBlock$bytes ($Snap.first ($Snap.second $t@317@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _21$address@71@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
      (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@364@01))))))
(pop) ; 14
; Nested auxiliary terms: globals (aux)
(assert ($Perm.isReadVar $k@365@01))
(assert ($Perm.isReadVar $k@366@01))
(assert ($Perm.isReadVar $k@367@01))
(assert (< $k@365@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@365@01)))
(assert (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@317@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _21$address@71@01) (as Size$I64$<Snap$Usize>  Snap$Usize)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((snapshot@364@01 Snap$Tuple$$I64$Bool$$I64$Bool$)) (!
  (and
    (=>
      (=
        (MemoryBlock$bytes ($Snap.first ($Snap.second $t@317@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _21$address@71@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
        (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@364@01)))
      (and
        (=
          (MemoryBlock$bytes ($Snap.first ($Snap.second $t@317@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _21$address@71@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
          (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@364@01)))
        (< $k@366@01 $Perm.Write)
        (<= $Perm.No (- $Perm.Write $k@366@01))
        (MemoryBlock$bytes%precondition $t@362@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _21$address@71@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))))
    (or
      (not
        (=
          (MemoryBlock$bytes ($Snap.first ($Snap.second $t@317@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _21$address@71@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
          (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@364@01))))
      (=
        (MemoryBlock$bytes ($Snap.first ($Snap.second $t@317@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _21$address@71@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
        (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@364@01))))
    (=>
      (and
        (=
          (MemoryBlock$bytes $t@362@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _21$address@71@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
          (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@364@01)))
        (=
          (MemoryBlock$bytes ($Snap.first ($Snap.second $t@317@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _21$address@71@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
          (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@364@01))))
      (and
        (=
          (MemoryBlock$bytes $t@362@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _21$address@71@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
          (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@364@01)))
        (=
          (MemoryBlock$bytes ($Snap.first ($Snap.second $t@317@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _21$address@71@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
          (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@364@01)))
        (< $k@367@01 $Perm.Write)
        (<= $Perm.No (- $Perm.Write $k@367@01))
        (MemoryBlock$bytes%precondition ($Snap.first $t@363@01) _21$address@71@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize))))
    (or
      (not
        (and
          (=
            (MemoryBlock$bytes $t@362@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _21$address@71@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
            (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@364@01)))
          (=
            (MemoryBlock$bytes ($Snap.first ($Snap.second $t@317@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _21$address@71@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
            (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@364@01)))))
      (and
        (=
          (MemoryBlock$bytes $t@362@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _21$address@71@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
          (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@364@01)))
        (=
          (MemoryBlock$bytes ($Snap.first ($Snap.second $t@317@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _21$address@71@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
          (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@364@01))))))
  :pattern ((to_bytes$Tuple$$I64$Bool$$I64$Bool$<Bytes> snapshot@364@01))
  :qid |prog.l1883-aux|)))
(assert (forall ((snapshot@364@01 Snap$Tuple$$I64$Bool$$I64$Bool$)) (!
  (=>
    (and
      (=
        (MemoryBlock$bytes $t@362@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _21$address@71@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
        (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@364@01)))
      (=
        (MemoryBlock$bytes ($Snap.first ($Snap.second $t@317@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _21$address@71@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
        (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@364@01))))
    (=
      (MemoryBlock$bytes ($Snap.first $t@363@01) _21$address@71@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize))
      (to_bytes$Tuple$$I64$Bool$$I64$Bool$<Bytes> snapshot@364@01)))
  :pattern ((to_bytes$Tuple$$I64$Bool$$I64$Bool$<Bytes> snapshot@364@01))
  :qid |prog.l1883|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; exhale acc(MemoryBlock(_21$address, Size$Tuple$$I64$Bool$$I64$Bool$$()), write)
; [eval] Size$Tuple$$I64$Bool$$I64$Bool$$()
; [exec]
; label label__from__return_label__to__end_label
; [exec]
; inhale _0$snapshot$2 == _0$snapshot$1
(declare-const $t@368@01 $Snap)
(assert (= $t@368@01 $Snap.unit))
; [eval] _0$snapshot$2 == _0$snapshot$1
(assert (= _0$snapshot$2@3@01 _0$snapshot$1@2@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale _1$snapshot$5 == _1$snapshot$4
(declare-const $t@369@01 $Snap)
(assert (= $t@369@01 $Snap.unit))
; [eval] _1$snapshot$5 == _1$snapshot$4
(assert (= _1$snapshot$5@10@01 _1$snapshot$4@9@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _10$snapshot$5 == _10$snapshot$4
(declare-const $t@370@01 $Snap)
(assert (= $t@370@01 $Snap.unit))
; [eval] _10$snapshot$5 == _10$snapshot$4
(assert (= _10$snapshot$5@17@01 _10$snapshot$4@16@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _11$snapshot$7 == _11$snapshot$6
(declare-const $t@371@01 $Snap)
(assert (= $t@371@01 $Snap.unit))
; [eval] _11$snapshot$7 == _11$snapshot$6
(assert (= _11$snapshot$7@26@01 _11$snapshot$6@25@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _12$snapshot$7 == _12$snapshot$6
(declare-const $t@372@01 $Snap)
(assert (= $t@372@01 $Snap.unit))
; [eval] _12$snapshot$7 == _12$snapshot$6
(assert (= _12$snapshot$7@35@01 _12$snapshot$6@34@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _13$snapshot$6 == _13$snapshot$5
(declare-const $t@373@01 $Snap)
(assert (= $t@373@01 $Snap.unit))
; [eval] _13$snapshot$6 == _13$snapshot$5
(assert (= _13$snapshot$6@43@01 _13$snapshot$5@42@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _14$snapshot$7 == _14$snapshot$6
(declare-const $t@374@01 $Snap)
(assert (= $t@374@01 $Snap.unit))
; [eval] _14$snapshot$7 == _14$snapshot$6
(assert (= _14$snapshot$7@52@01 _14$snapshot$6@51@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _17$snapshot$6 == _17$snapshot$5
(declare-const $t@375@01 $Snap)
(assert (= $t@375@01 $Snap.unit))
; [eval] _17$snapshot$6 == _17$snapshot$5
(assert (= _17$snapshot$6@60@01 _17$snapshot$5@59@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _2$snapshot$7 == _2$snapshot$6
(declare-const $t@376@01 $Snap)
(assert (= $t@376@01 $Snap.unit))
; [eval] _2$snapshot$7 == _2$snapshot$6
(assert (= _2$snapshot$7@70@01 _2$snapshot$6@69@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _21$snapshot$5 == _21$snapshot$4
(declare-const $t@377@01 $Snap)
(assert (= $t@377@01 $Snap.unit))
; [eval] _21$snapshot$5 == _21$snapshot$4
(assert (= _21$snapshot$5@77@01 _21$snapshot$4@76@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _3$snapshot$5 == _3$snapshot$4
(declare-const $t@378@01 $Snap)
(assert (= $t@378@01 $Snap.unit))
; [eval] _3$snapshot$5 == _3$snapshot$4
(assert (= _3$snapshot$5@85@01 _3$snapshot$4@84@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _4$snapshot$5 == _4$snapshot$4
(declare-const $t@379@01 $Snap)
(assert (= $t@379@01 $Snap.unit))
; [eval] _4$snapshot$5 == _4$snapshot$4
(assert (= _4$snapshot$5@92@01 _4$snapshot$4@91@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _5$snapshot$3 == _5$snapshot$2
(declare-const $t@380@01 $Snap)
(assert (= $t@380@01 $Snap.unit))
; [eval] _5$snapshot$3 == _5$snapshot$2
(assert (= _5$snapshot$3@97@01 _5$snapshot$2@96@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _6$snapshot$5 == _6$snapshot$4
(declare-const $t@381@01 $Snap)
(assert (= $t@381@01 $Snap.unit))
; [eval] _6$snapshot$5 == _6$snapshot$4
(assert (= _6$snapshot$5@104@01 _6$snapshot$4@103@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _9$snapshot$8 == _9$snapshot$7
(declare-const $t@382@01 $Snap)
(assert (= $t@382@01 $Snap.unit))
; [eval] _9$snapshot$8 == _9$snapshot$7
(assert (= _9$snapshot$8@114@01 _9$snapshot$7@113@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale loop_variant$1$snapshot$4 == loop_variant$1$snapshot$3
(declare-const $t@383@01 $Snap)
(assert (= $t@383@01 $Snap.unit))
; [eval] loop_variant$1$snapshot$4 == loop_variant$1$snapshot$3
(assert (= loop_variant$1$snapshot$4@154@01 loop_variant$1$snapshot$3@153@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale loop_variant$2$snapshot$7 == loop_variant$2$snapshot$6
(declare-const $t@384@01 $Snap)
(assert (= $t@384@01 $Snap.unit))
; [eval] loop_variant$2$snapshot$7 == loop_variant$2$snapshot$6
(assert (= loop_variant$2$snapshot$7@162@01 loop_variant$2$snapshot$6@161@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; label end_label
; [exec]
; end_label$marker := true
; [exec]
; inhale basic_block_marker$end_label$marker()
(declare-const $t@385@01 $Snap)
(assert (= $t@385@01 $Snap.unit))
; [eval] basic_block_marker$end_label$marker()
(assert (as basic_block_marker$end_label$marker<Bool>  Bool))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; label end_of_method
(pop) ; 13
; [eval] !(loop__label_bb1__label_bb2$marker && (label_3_custom$marker && label_bb16$marker))
; [eval] loop__label_bb1__label_bb2$marker && (label_3_custom$marker && label_bb16$marker)
(set-option :timeout 0)
(push) ; 13
; [then-branch: 34 | True | live]
; [else-branch: 34 | False | live]
(push) ; 14
; [then-branch: 34 | True]
(push) ; 15
; [then-branch: 35 | True | live]
; [else-branch: 35 | False | live]
(push) ; 16
; [then-branch: 35 | True]
(pop) ; 16
(push) ; 16
; [else-branch: 35 | False]
(assert false)
(pop) ; 16
(pop) ; 15
; Joined path conditions
; Joined path conditions
(pop) ; 14
(push) ; 14
; [else-branch: 34 | False]
(assert false)
(pop) ; 14
(pop) ; 13
; Joined path conditions
; Joined path conditions
; [then-branch: 36 | False | dead]
; [else-branch: 36 | True | live]
(push) ; 13
; [else-branch: 36 | True]
(pop) ; 13
(pop) ; 12
; [eval] !(loop__label_bb1__label_bb2$marker && (label_3_custom$marker && label_bb16$marker))
; [eval] loop__label_bb1__label_bb2$marker && (label_3_custom$marker && label_bb16$marker)
(push) ; 12
; [then-branch: 37 | True | live]
; [else-branch: 37 | False | live]
(push) ; 13
; [then-branch: 37 | True]
(push) ; 14
; [then-branch: 38 | True | live]
; [else-branch: 38 | False | live]
(push) ; 15
; [then-branch: 38 | True]
(pop) ; 15
(push) ; 15
; [else-branch: 38 | False]
(assert false)
(pop) ; 15
(pop) ; 14
; Joined path conditions
; Joined path conditions
(pop) ; 13
(push) ; 13
; [else-branch: 37 | False]
(assert false)
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
; [then-branch: 39 | False | dead]
; [else-branch: 39 | True | live]
(push) ; 12
; [else-branch: 39 | True]
(pop) ; 12
(pop) ; 11
(pop) ; 10
(pop) ; 9
; [eval] !(loop__label_bb1__label_bb2$marker && (label_3_custom$marker && label_bb16$marker))
; [eval] loop__label_bb1__label_bb2$marker && (label_3_custom$marker && label_bb16$marker)
(push) ; 9
; [then-branch: 40 | True | live]
; [else-branch: 40 | False | live]
(push) ; 10
; [then-branch: 40 | True]
(push) ; 11
; [then-branch: 41 | True | live]
; [else-branch: 41 | False | live]
(push) ; 12
; [then-branch: 41 | True]
(pop) ; 12
(push) ; 12
; [else-branch: 41 | False]
(assert false)
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(pop) ; 10
(push) ; 10
; [else-branch: 40 | False]
(assert false)
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
; [then-branch: 42 | False | dead]
; [else-branch: 42 | True | live]
(push) ; 9
; [else-branch: 42 | True]
(pop) ; 9
(pop) ; 8
; [eval] !!destructor$Snap$Bool$$value(_3$snapshot$2)
; [eval] !destructor$Snap$Bool$$value(_3$snapshot$2)
; [eval] destructor$Snap$Bool$$value(_3$snapshot$2)
(push) ; 8
(set-option :timeout 10)
(assert (not (not (destructor$Snap$Bool$$value<Bool> _3$snapshot$2@82@01))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [then-branch: 43 | destructor$Snap$Bool$$value[Bool](_3$snapshot$2@82@01) | dead]
; [else-branch: 43 | !(destructor$Snap$Bool$$value[Bool](_3$snapshot$2@82@01)) | live]
(set-option :timeout 0)
(push) ; 8
; [else-branch: 43 | !(destructor$Snap$Bool$$value[Bool](_3$snapshot$2@82@01))]
(assert (not (destructor$Snap$Bool$$value<Bool> _3$snapshot$2@82@01)))
(pop) ; 8
(pop) ; 7
(pop) ; 6
; [eval] !!destructor$Snap$Bool$$value(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(_21$snapshot$1))
; [eval] !destructor$Snap$Bool$$value(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(_21$snapshot$1))
; [eval] destructor$Snap$Bool$$value(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(_21$snapshot$1))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(_21$snapshot$1)
(push) ; 6
(set-option :timeout 10)
(assert (not (not
  (destructor$Snap$Bool$$value<Bool> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> _21$snapshot$1@73@01)))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [then-branch: 44 | destructor$Snap$Bool$$value[Bool](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](_21$snapshot$1@73@01)) | dead]
; [else-branch: 44 | !(destructor$Snap$Bool$$value[Bool](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](_21$snapshot$1@73@01))) | live]
(set-option :timeout 0)
(push) ; 6
; [else-branch: 44 | !(destructor$Snap$Bool$$value[Bool](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](_21$snapshot$1@73@01)))]
(assert (not
  (destructor$Snap$Bool$$value<Bool> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> _21$snapshot$1@73@01))))
(pop) ; 6
(pop) ; 5
(push) ; 5
; [else-branch: 13 | destructor$Snap$Bool$$value[Bool](_11$snapshot$1@20@01)]
(assert (destructor$Snap$Bool$$value<Bool> _11$snapshot$1@20@01))
(pop) ; 5
; [eval] !!destructor$Snap$Bool$$value(_11$snapshot$1)
; [eval] !destructor$Snap$Bool$$value(_11$snapshot$1)
; [eval] destructor$Snap$Bool$$value(_11$snapshot$1)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (destructor$Snap$Bool$$value<Bool> _11$snapshot$1@20@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (destructor$Snap$Bool$$value<Bool> _11$snapshot$1@20@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [then-branch: 45 | destructor$Snap$Bool$$value[Bool](_11$snapshot$1@20@01) | live]
; [else-branch: 45 | !(destructor$Snap$Bool$$value[Bool](_11$snapshot$1@20@01)) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 45 | destructor$Snap$Bool$$value[Bool](_11$snapshot$1@20@01)]
(assert (destructor$Snap$Bool$$value<Bool> _11$snapshot$1@20@01))
(push) ; 6
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [then-branch: 46 | True | live]
; [else-branch: 46 | False | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 46 | True]
; [exec]
; label label_6_custom
; [exec]
; label_6_custom$marker := true
; [exec]
; inhale basic_block_marker$label_6_custom$marker()
(declare-const $t@386@01 $Snap)
(assert (= $t@386@01 $Snap.unit))
; [eval] basic_block_marker$label_6_custom$marker()
(assert (as basic_block_marker$label_6_custom$marker<Bool>  Bool))
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
(declare-const $t@387@01 $Snap)
(assert (= $t@387@01 $Snap.unit))
; [eval] basic_block_marker$label_bb9$marker()
(assert (as basic_block_marker$label_bb9$marker<Bool>  Bool))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlock(_13$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
(declare-const $t@388@01 $Snap)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= _10$address@11@01 _13$address@36@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (= _21$address@71@01 _13$address@36@01)
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
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
  (= _17$address@53@01 _13$address@36@01)
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
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
  (= _3$address@79@01 _13$address@36@01)
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= _0$address@0@01 _13$address@36@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= _2$address@62@01 _13$address@36@01)))
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
; inhale acc(MemoryBlockStackDrop(_13$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
(declare-const $t@389@01 $Snap)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (= _11$address@18@01 _13$address@36@01)
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= _10$address@11@01 _13$address@36@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (= _9$address@105@01 _13$address@36@01)
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
  (= _3$address@79@01 _13$address@36@01)
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
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
; inhale acc(MemoryBlock(_14$address, Size$Bool$()), write)
; [eval] Size$Bool$()
(declare-const $t@390@01 $Snap)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (= _13$address@36@01 _14$address@44@01)
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
  (= _10$address@11@01 _14$address@44@01)
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
  (= _21$address@71@01 _14$address@44@01)
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
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
  (= _17$address@53@01 _14$address@44@01)
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= _3$address@79@01 _14$address@44@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (= _0$address@0@01 _14$address@44@01)
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
  (= _2$address@62@01 _14$address@44@01)
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
; inhale acc(MemoryBlockStackDrop(_14$address, Size$Bool$()), write)
; [eval] Size$Bool$()
(declare-const $t@391@01 $Snap)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (= _13$address@36@01 _14$address@44@01)
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
(assert (not (= _11$address@18@01 _14$address@44@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (= _10$address@11@01 _14$address@44@01)
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
  (= _9$address@105@01 _14$address@44@01)
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
(assert (not (= _3$address@79@01 _14$address@44@01)))
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
; write_place_constant$Bool(_14$place(), _14$address, constructor$Snap$Bool$(false))
; [eval] _14$place()
; [eval] constructor$Snap$Bool$(false)
; [eval] compute_address(target_place, target_root_address)
; [eval] Size$Bool$()
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (=
    _2$address@62@01
    (compute_address<Address> (as _14$place<Place>  Place) _14$address@44@01))
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
    (compute_address<Address> (as _14$place<Place>  Place) _14$address@44@01))
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
(assert (not (=
  _3$address@79@01
  (compute_address<Address> (as _14$place<Place>  Place) _14$address@44@01))))
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
    _17$address@53@01
    (compute_address<Address> (as _14$place<Place>  Place) _14$address@44@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
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
    _21$address@71@01
    (compute_address<Address> (as _14$place<Place>  Place) _14$address@44@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
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
    _10$address@11@01
    (compute_address<Address> (as _14$place<Place>  Place) _14$address@44@01))
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
    _13$address@36@01
    (compute_address<Address> (as _14$place<Place>  Place) _14$address@44@01))
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
(assert (not (=
  _14$address@44@01
  (compute_address<Address> (as _14$place<Place>  Place) _14$address@44@01))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [eval] valid$Snap$Bool(source_snapshot)
(declare-const $t@392@01 $Snap)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (= (as _11$place<Place>  Place) (as _14$place<Place>  Place))
  (= _11$address@18@01 _14$address@44@01)
  (= result_value@291@01 (constructor$Snap$Bool$<Snap$Bool> false)))))
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
; inhale _14$snapshot$1 == constructor$Snap$Bool$(false)
(declare-const $t@393@01 $Snap)
(assert (= $t@393@01 $Snap.unit))
; [eval] _14$snapshot$1 == constructor$Snap$Bool$(false)
; [eval] constructor$Snap$Bool$(false)
(assert (= _14$snapshot$1@46@01 (constructor$Snap$Bool$<Snap$Bool> false)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale loop_variant$2$snapshot$1 ==
;   constructor$Snap$Unbounded$(destructor$Snap$I64$$value(_9$snapshot$1))
(declare-const $t@394@01 $Snap)
(assert (= $t@394@01 $Snap.unit))
; [eval] loop_variant$2$snapshot$1 == constructor$Snap$Unbounded$(destructor$Snap$I64$$value(_9$snapshot$1))
; [eval] constructor$Snap$Unbounded$(destructor$Snap$I64$$value(_9$snapshot$1))
; [eval] destructor$Snap$I64$$value(_9$snapshot$1)
(assert (=
  loop_variant$2$snapshot$1@156@01
  (constructor$Snap$Unbounded$<Snap$Unbounded> (destructor$Snap$I64$$value<Int> _9$snapshot$1@107@01))))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; assert destructor$Snap$Bool$$value(constructor$Snap$Bool$EqCmp_Lifetime(lft_0$snapshot$1,
;   intersect(Set(bw2$snapshot$0))))
; [eval] destructor$Snap$Bool$$value(constructor$Snap$Bool$EqCmp_Lifetime(lft_0$snapshot$1, intersect(Set(bw2$snapshot$0))))
; [eval] constructor$Snap$Bool$EqCmp_Lifetime(lft_0$snapshot$1, intersect(Set(bw2$snapshot$0)))
; [eval] intersect(Set(bw2$snapshot$0))
; [eval] Set(bw2$snapshot$0)
; [exec]
; assert destructor$Snap$Bool$$value(constructor$Snap$Bool$EqCmp_Lifetime(lft_1$snapshot$1,
;   intersect(Set(bw2$snapshot$0, bw3$snapshot$0))))
; [eval] destructor$Snap$Bool$$value(constructor$Snap$Bool$EqCmp_Lifetime(lft_1$snapshot$1, intersect(Set(bw2$snapshot$0, bw3$snapshot$0))))
; [eval] constructor$Snap$Bool$EqCmp_Lifetime(lft_1$snapshot$1, intersect(Set(bw2$snapshot$0, bw3$snapshot$0)))
; [eval] intersect(Set(bw2$snapshot$0, bw3$snapshot$0))
; [eval] Set(bw2$snapshot$0, bw3$snapshot$0)
; [exec]
; assert destructor$Snap$Bool$$value(constructor$Snap$Bool$GtCmp_Unbounded(loop_variant$2$snapshot$1,
;   constructor$Snap$Unbounded$(0)))
; [eval] destructor$Snap$Bool$$value(constructor$Snap$Bool$GtCmp_Unbounded(loop_variant$2$snapshot$1, constructor$Snap$Unbounded$(0)))
; [eval] constructor$Snap$Bool$GtCmp_Unbounded(loop_variant$2$snapshot$1, constructor$Snap$Unbounded$(0))
; [eval] constructor$Snap$Unbounded$(0)
(set-option :timeout 0)
(push) ; 7
(assert (not (destructor$Snap$Bool$$value<Bool> (constructor$Snap$Bool$GtCmp_Unbounded<Snap$Bool> loop_variant$2$snapshot$1@156@01 (constructor$Snap$Unbounded$<Snap$Unbounded> 0)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (destructor$Snap$Bool$$value<Bool> (constructor$Snap$Bool$GtCmp_Unbounded<Snap$Bool> loop_variant$2$snapshot$1@156@01 (constructor$Snap$Unbounded$<Snap$Unbounded> 0))))
; [exec]
; into_memory_block$Bool(_11$place(), _11$address, _11$snapshot$1)
; [eval] _11$place()
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (= (as _14$place<Place>  Place) (as _11$place<Place>  Place))
  (= _14$address@44@01 _11$address@18@01)
  (= (constructor$Snap$Bool$<Snap$Bool> false) _11$snapshot$1@20@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= result_value@291@01 _11$snapshot$1@20@01)))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [eval] compute_address(place, root_address)
; [eval] Size$Bool$()
(declare-const $t@395@01 $Snap)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (=
    _2$address@62@01
    (compute_address<Address> (as _11$place<Place>  Place) _11$address@18@01))
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
    (compute_address<Address> (as _11$place<Place>  Place) _11$address@18@01))
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
(assert (not (=
  _3$address@79@01
  (compute_address<Address> (as _11$place<Place>  Place) _11$address@18@01))))
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
    _17$address@53@01
    (compute_address<Address> (as _11$place<Place>  Place) _11$address@18@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
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
    _21$address@71@01
    (compute_address<Address> (as _11$place<Place>  Place) _11$address@18@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
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
    _10$address@11@01
    (compute_address<Address> (as _11$place<Place>  Place) _11$address@18@01))
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
    _13$address@36@01
    (compute_address<Address> (as _11$place<Place>  Place) _11$address@18@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
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
; havoc_memory_block$Bool$$(_11$address)
; [eval] Size$Bool$()
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _11$place<Place>  Place) _11$address@18@01)
  _11$address@18@01)))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [eval] Size$Bool$()
(declare-const $t@396@01 $Snap)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (= _13$address@36@01 _11$address@18@01)
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
  (= _10$address@11@01 _11$address@18@01)
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
  (= _21$address@71@01 _11$address@18@01)
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
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
  (= _17$address@53@01 _11$address@18@01)
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= _3$address@79@01 _11$address@18@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (= _0$address@0@01 _11$address@18@01)
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
  (= _2$address@62@01 _11$address@18@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
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
; into_memory_block$Bool(_14$place(), _14$address, _14$snapshot$1)
; [eval] _14$place()
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= (constructor$Snap$Bool$<Snap$Bool> false) _14$snapshot$1@46@01)))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [eval] compute_address(place, root_address)
; [eval] Size$Bool$()
(declare-const $t@397@01 $Snap)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (=
    _2$address@62@01
    (compute_address<Address> (as _14$place<Place>  Place) _14$address@44@01))
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
    (compute_address<Address> (as _14$place<Place>  Place) _14$address@44@01))
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
(assert (not (=
  _3$address@79@01
  (compute_address<Address> (as _14$place<Place>  Place) _14$address@44@01))))
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
    _17$address@53@01
    (compute_address<Address> (as _14$place<Place>  Place) _14$address@44@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
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
    _21$address@71@01
    (compute_address<Address> (as _14$place<Place>  Place) _14$address@44@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
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
    _10$address@11@01
    (compute_address<Address> (as _14$place<Place>  Place) _14$address@44@01))
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
    _13$address@36@01
    (compute_address<Address> (as _14$place<Place>  Place) _14$address@44@01))
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
(assert (not (=
  _11$address@18@01
  (compute_address<Address> (as _14$place<Place>  Place) _14$address@44@01))))
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
; havoc_memory_block$Bool$$(_14$address)
; [eval] Size$Bool$()
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _14$place<Place>  Place) _14$address@44@01)
  _14$address@44@01)))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [eval] Size$Bool$()
(declare-const $t@398@01 $Snap)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= _11$address@18@01 _14$address@44@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (= _13$address@36@01 _14$address@44@01)
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
  (= _10$address@11@01 _14$address@44@01)
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
  (= _21$address@71@01 _14$address@44@01)
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
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
  (= _17$address@53@01 _14$address@44@01)
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= _3$address@79@01 _14$address@44@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (= _0$address@0@01 _14$address@44@01)
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
  (= _2$address@62@01 _14$address@44@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
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
; havoc_memory_block$Tuple$$$$$(_13$address)
; [eval] Size$Tuple$$$$()
; [eval] Size$Tuple$$$$()
(declare-const $t@399@01 $Snap)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= _2$address@62@01 _13$address@36@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= _0$address@0@01 _13$address@36@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (= _3$address@79@01 _13$address@36@01)
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
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
  (= _17$address@53@01 _13$address@36@01)
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
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
  (= _21$address@71@01 _13$address@36@01)
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= _10$address@11@01 _13$address@36@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (= _11$address@18@01 _13$address@36@01)
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
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
  (= _14$address@44@01 _13$address@36@01)
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
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
; havoc_memory_block$Tuple$$I64$Bool$$I64$Bool$$$(_17$address)
; [eval] Size$Tuple$$I64$Bool$$I64$Bool$$()
; [eval] Size$Tuple$$I64$Bool$$I64$Bool$$()
(declare-const $t@400@01 $Snap)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (= _14$address@44@01 _17$address@53@01)
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (= _11$address@18@01 _17$address@53@01)
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (= _10$address@11@01 _17$address@53@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= _21$address@71@01 _17$address@53@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (= _3$address@79@01 _17$address@53@01)
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (= _0$address@0@01 _17$address@53@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (= _2$address@62@01 _17$address@53@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (= _13$address@36@01 _17$address@53@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
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
; tmp$4 := havoc_owned$I64(_9$place(), _9$address, _9$snapshot$1)
; [eval] _9$place()
(declare-const fresh_snapshot@401@01 Snap$I64)
(declare-const $t@402@01 $Snap)
(assert (= $t@402@01 ($Snap.combine ($Snap.first $t@402@01) ($Snap.second $t@402@01))))
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (= (as _1$place<Place>  Place) (as _9$place<Place>  Place))
  (= _1$address@4@01 _9$address@105@01)
  (= _1$snapshot$1@6@01 fresh_snapshot@401@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (= ($Snap.second $t@402@01) $Snap.unit))
; [eval] valid$Snap$I64(fresh_snapshot)
(assert (valid$Snap$I64<Bool> fresh_snapshot@401@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _9$snapshot$2 == tmp$4
(declare-const $t@403@01 $Snap)
(assert (= $t@403@01 $Snap.unit))
; [eval] _9$snapshot$2 == tmp$4
(assert (= _9$snapshot$2@108@01 fresh_snapshot@401@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; havoc_memory_block$Tuple$$$$$(_2$address)
; [eval] Size$Tuple$$$$()
; [eval] Size$Tuple$$$$()
(declare-const $t@404@01 $Snap)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (= _17$address@53@01 _2$address@62@01)
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
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
  (= _14$address@44@01 _2$address@62@01)
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
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
  (= _11$address@18@01 _2$address@62@01)
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= _10$address@11@01 _2$address@62@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (= _21$address@71@01 _2$address@62@01)
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
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
  (= _3$address@79@01 _2$address@62@01)
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= _0$address@0@01 _2$address@62@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= _13$address@36@01 _2$address@62@01)))
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
; inhale loop_variant$2$snapshot$2 == tmp$5
(declare-const $t@405@01 $Snap)
(assert (= $t@405@01 $Snap.unit))
; [eval] loop_variant$2$snapshot$2 == tmp$5
(assert (= loop_variant$2$snapshot$2@157@01 tmp$5@172@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale destructor$Snap$Bool$$value(constructor$Snap$Bool$EqCmp_Lifetime(lft_0$snapshot$1,
;   intersect(Set(bw2$snapshot$0))))
(declare-const $t@406@01 $Snap)
(assert (= $t@406@01 $Snap.unit))
; [eval] destructor$Snap$Bool$$value(constructor$Snap$Bool$EqCmp_Lifetime(lft_0$snapshot$1, intersect(Set(bw2$snapshot$0))))
; [eval] constructor$Snap$Bool$EqCmp_Lifetime(lft_0$snapshot$1, intersect(Set(bw2$snapshot$0)))
; [eval] intersect(Set(bw2$snapshot$0))
; [eval] Set(bw2$snapshot$0)
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale destructor$Snap$Bool$$value(constructor$Snap$Bool$EqCmp_Lifetime(lft_1$snapshot$1,
;   intersect(Set(bw2$snapshot$0, bw3$snapshot$0))))
(declare-const $t@407@01 $Snap)
(assert (= $t@407@01 $Snap.unit))
; [eval] destructor$Snap$Bool$$value(constructor$Snap$Bool$EqCmp_Lifetime(lft_1$snapshot$1, intersect(Set(bw2$snapshot$0, bw3$snapshot$0))))
; [eval] constructor$Snap$Bool$EqCmp_Lifetime(lft_1$snapshot$1, intersect(Set(bw2$snapshot$0, bw3$snapshot$0)))
; [eval] intersect(Set(bw2$snapshot$0, bw3$snapshot$0))
; [eval] Set(bw2$snapshot$0, bw3$snapshot$0)
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale destructor$Snap$Bool$$value(constructor$Snap$Bool$EqCmp_Unbounded(loop_variant$2$snapshot$2,
;   constructor$Snap$Unbounded$(destructor$Snap$I64$$value(_9$snapshot$2))))
(declare-const $t@408@01 $Snap)
(assert (= $t@408@01 $Snap.unit))
; [eval] destructor$Snap$Bool$$value(constructor$Snap$Bool$EqCmp_Unbounded(loop_variant$2$snapshot$2, constructor$Snap$Unbounded$(destructor$Snap$I64$$value(_9$snapshot$2))))
; [eval] constructor$Snap$Bool$EqCmp_Unbounded(loop_variant$2$snapshot$2, constructor$Snap$Unbounded$(destructor$Snap$I64$$value(_9$snapshot$2)))
; [eval] constructor$Snap$Unbounded$(destructor$Snap$I64$$value(_9$snapshot$2))
; [eval] destructor$Snap$I64$$value(_9$snapshot$2)
(assert (destructor$Snap$Bool$$value<Bool> (constructor$Snap$Bool$EqCmp_Unbounded<Snap$Bool> loop_variant$2$snapshot$2@157@01 (constructor$Snap$Unbounded$<Snap$Unbounded> (destructor$Snap$I64$$value<Int> _9$snapshot$2@108@01)))))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; label label_bb11
; [exec]
; label_bb11$marker := true
; [exec]
; inhale basic_block_marker$label_bb11$marker()
(declare-const $t@409@01 $Snap)
(assert (= $t@409@01 $Snap.unit))
; [eval] basic_block_marker$label_bb11$marker()
(assert (as basic_block_marker$label_bb11$marker<Bool>  Bool))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; write_place_constant$Tuple$$$(_13$place(), _13$address, constructor$Snap$Tuple$$$$())
; [eval] _13$place()
; [eval] constructor$Snap$Tuple$$$$()
; [eval] compute_address(target_place, target_root_address)
; [eval] Size$Tuple$$$$()
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  _2$address@62@01
  (compute_address<Address> (as _13$place<Place>  Place) _13$address@36@01))))
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
    _17$address@53@01
    (compute_address<Address> (as _13$place<Place>  Place) _13$address@36@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
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
    _14$address@44@01
    (compute_address<Address> (as _13$place<Place>  Place) _13$address@36@01))
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
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
    _11$address@18@01
    (compute_address<Address> (as _13$place<Place>  Place) _13$address@36@01))
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
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
  _10$address@11@01
  (compute_address<Address> (as _13$place<Place>  Place) _13$address@36@01))))
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
    _21$address@71@01
    (compute_address<Address> (as _13$place<Place>  Place) _13$address@36@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
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
    _3$address@79@01
    (compute_address<Address> (as _13$place<Place>  Place) _13$address@36@01))
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
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
  _0$address@0@01
  (compute_address<Address> (as _13$place<Place>  Place) _13$address@36@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  _13$address@36@01
  (compute_address<Address> (as _13$place<Place>  Place) _13$address@36@01))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [eval] valid$Snap$Tuple$$$(source_snapshot)
(declare-const $t@410@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _13$snapshot$1 == constructor$Snap$Tuple$$$$()
(declare-const $t@411@01 $Snap)
(assert (= $t@411@01 $Snap.unit))
; [eval] _13$snapshot$1 == constructor$Snap$Tuple$$$$()
; [eval] constructor$Snap$Tuple$$$$()
(assert (=
  _13$snapshot$1@38@01
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
(declare-const $t@412@01 $Snap)
(assert (= $t@412@01 $Snap.unit))
; [eval] basic_block_marker$label_bb12$marker()
(assert (as basic_block_marker$label_bb12$marker<Bool>  Bool))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; exhale acc(MemoryBlock(_14$address, Size$Bool$()), write)
; [eval] Size$Bool$()
; [exec]
; exhale acc(MemoryBlockStackDrop(_14$address, Size$Bool$()), write)
; [eval] Size$Bool$()
; [exec]
; into_memory_block$Tuple$$$(_13$place(), _13$address, _13$snapshot$1)
; [eval] _13$place()
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  (as constructor$Snap$Tuple$$$$<Snap$Tuple$$$>  Snap$Tuple$$$)
  _13$snapshot$1@38@01)))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [eval] compute_address(place, root_address)
; [eval] Size$Tuple$$$$()
(declare-const $t@413@01 $Snap)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  _2$address@62@01
  (compute_address<Address> (as _13$place<Place>  Place) _13$address@36@01))))
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
    _17$address@53@01
    (compute_address<Address> (as _13$place<Place>  Place) _13$address@36@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
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
    _11$address@18@01
    (compute_address<Address> (as _13$place<Place>  Place) _13$address@36@01))
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
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
  _10$address@11@01
  (compute_address<Address> (as _13$place<Place>  Place) _13$address@36@01))))
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
    _21$address@71@01
    (compute_address<Address> (as _13$place<Place>  Place) _13$address@36@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
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
    _3$address@79@01
    (compute_address<Address> (as _13$place<Place>  Place) _13$address@36@01))
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
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
  _0$address@0@01
  (compute_address<Address> (as _13$place<Place>  Place) _13$address@36@01))))
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
; exhale acc(MemoryBlock(_13$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _13$place<Place>  Place) _13$address@36@01)
  _13$address@36@01)))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(MemoryBlockStackDrop(_13$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
; [exec]
; tmp$6 := assign$Tuple$$I64$Bool$$I64$Bool$$CheckedBinaryOp$Sub$Copy$I64$Constant$I64$$$$(_17$place(),
;   _17$address, _9$place(), _9$address, _9$snapshot$2, constructor$Snap$I64$(1))
; [eval] _17$place()
; [eval] _9$place()
; [eval] constructor$Snap$I64$(1)
; [eval] compute_address(target_place, target_address)
; [eval] Size$Tuple$$I64$Bool$$I64$Bool$$()
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (=
    _2$address@62@01
    (compute_address<Address> (as _17$place<Place>  Place) _17$address@53@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  _17$address@53@01
  (compute_address<Address> (as _17$place<Place>  Place) _17$address@53@01))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (= (as _1$place<Place>  Place) (as _9$place<Place>  Place))
  (= _1$address@4@01 _9$address@105@01)
  (= _1$snapshot$1@6@01 _9$snapshot$2@108@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= fresh_snapshot@401@01 _9$snapshot$2@108@01)))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [eval] valid$Snap$I64(operand1_value)
(set-option :timeout 0)
(push) ; 7
(assert (not (valid$Snap$I64<Bool> _9$snapshot$2@108@01)))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (valid$Snap$I64<Bool> _9$snapshot$2@108@01))
; [eval] valid$Snap$I64(operand2_value)
(push) ; 7
(assert (not (valid$Snap$I64<Bool> (constructor$Snap$I64$<Snap$I64> 1))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (valid$Snap$I64<Bool> (constructor$Snap$I64$<Snap$I64> 1)))
(declare-const result_value@414@01 Snap$Tuple$$I64$Bool$$I64$Bool$)
(declare-const $t@415@01 $Snap)
(assert (= $t@415@01 ($Snap.combine ($Snap.first $t@415@01) ($Snap.second $t@415@01))))
; [eval] compute_address(target_place, target_address)
; [eval] PaddingSize$Tuple$$I64$Bool$$I64$Bool$$()
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (=
    _0$address@0@01
    (compute_address<Address> (as _17$place<Place>  Place) _17$address@53@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
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
    _3$address@79@01
    (compute_address<Address> (as _17$place<Place>  Place) _17$address@53@01))
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
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
    _21$address@71@01
    (compute_address<Address> (as _17$place<Place>  Place) _17$address@53@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
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
    _10$address@11@01
    (compute_address<Address> (as _17$place<Place>  Place) _17$address@53@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
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
    _11$address@18@01
    (compute_address<Address> (as _17$place<Place>  Place) _17$address@53@01))
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
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
    _2$address@62@01
    (compute_address<Address> (as _17$place<Place>  Place) _17$address@53@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second $t@415@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@415@01))
    ($Snap.second ($Snap.second $t@415@01)))))
; [eval] field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(compute_address(target_place, target_address))
; [eval] compute_address(target_place, target_address)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (=
    _2$address@62@01
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _17$place<Place>  Place) _17$address@53@01)))
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
    _11$address@18@01
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _17$place<Place>  Place) _17$address@53@01)))
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
    _10$address@11@01
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _17$place<Place>  Place) _17$address@53@01)))
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
    _21$address@71@01
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _17$place<Place>  Place) _17$address@53@01)))
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
    _3$address@79@01
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _17$place<Place>  Place) _17$address@53@01)))
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
    _0$address@0@01
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _17$place<Place>  Place) _17$address@53@01)))
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
    (compute_address<Address> (as _17$place<Place>  Place) _17$address@53@01)
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _17$place<Place>  Place) _17$address@53@01)))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second $t@415@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@415@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@415@01))))))
; [eval] field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(target_place)
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(result_value)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@415@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@415@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@415@01)))))))
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (= (as _1$place<Place>  Place) (as _9$place<Place>  Place))
  (= _1$address@4@01 _9$address@105@01)
  (= _1$snapshot$1@6@01 _9$snapshot$2@108@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@415@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@415@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@415@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@415@01)))))
  $Snap.unit))
; [eval] valid$Snap$I64(constructor$Snap$I64$Sub_I64(operand1_value, operand2_value)) ==> destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(result_value) == constructor$Snap$I64$Sub_I64(operand1_value, operand2_value)
; [eval] valid$Snap$I64(constructor$Snap$I64$Sub_I64(operand1_value, operand2_value))
; [eval] constructor$Snap$I64$Sub_I64(operand1_value, operand2_value)
(set-option :timeout 0)
(push) ; 7
(push) ; 8
(set-option :timeout 10)
(assert (not (not
  (valid$Snap$I64<Bool> (constructor$Snap$I64$Sub_I64<Snap$I64> _9$snapshot$2@108@01 (constructor$Snap$I64$<Snap$I64> 1))))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (valid$Snap$I64<Bool> (constructor$Snap$I64$Sub_I64<Snap$I64> _9$snapshot$2@108@01 (constructor$Snap$I64$<Snap$I64> 1)))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [then-branch: 47 | valid$Snap$I64[Bool](constructor$Snap$I64$Sub_I64[Snap$I64](_9$snapshot$2@108@01, constructor$Snap$I64$[Snap$I64](1))) | live]
; [else-branch: 47 | !(valid$Snap$I64[Bool](constructor$Snap$I64$Sub_I64[Snap$I64](_9$snapshot$2@108@01, constructor$Snap$I64$[Snap$I64](1)))) | dead]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 47 | valid$Snap$I64[Bool](constructor$Snap$I64$Sub_I64[Snap$I64](_9$snapshot$2@108@01, constructor$Snap$I64$[Snap$I64](1)))]
(assert (valid$Snap$I64<Bool> (constructor$Snap$I64$Sub_I64<Snap$I64> _9$snapshot$2@108@01 (constructor$Snap$I64$<Snap$I64> 1))))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(result_value) == constructor$Snap$I64$Sub_I64(operand1_value, operand2_value)
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(result_value)
; [eval] constructor$Snap$I64$Sub_I64(operand1_value, operand2_value)
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (valid$Snap$I64<Bool> (constructor$Snap$I64$Sub_I64<Snap$I64> _9$snapshot$2@108@01 (constructor$Snap$I64$<Snap$I64> 1))))
(assert (=>
  (valid$Snap$I64<Bool> (constructor$Snap$I64$Sub_I64<Snap$I64> _9$snapshot$2@108@01 (constructor$Snap$I64$<Snap$I64> 1)))
  (=
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> result_value@414@01)
    (constructor$Snap$I64$Sub_I64<Snap$I64> _9$snapshot$2@108@01 (constructor$Snap$I64$<Snap$I64> 1)))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@415@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@415@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@415@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@415@01))))))
  $Snap.unit))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(result_value) == constructor$Snap$Bool$(!valid$Snap$I64(constructor$Snap$I64$Sub_I64(operand1_value, operand2_value)))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(result_value)
; [eval] constructor$Snap$Bool$(!valid$Snap$I64(constructor$Snap$I64$Sub_I64(operand1_value, operand2_value)))
; [eval] !valid$Snap$I64(constructor$Snap$I64$Sub_I64(operand1_value, operand2_value))
; [eval] valid$Snap$I64(constructor$Snap$I64$Sub_I64(operand1_value, operand2_value))
; [eval] constructor$Snap$I64$Sub_I64(operand1_value, operand2_value)
(assert (=
  (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> result_value@414@01)
  (constructor$Snap$Bool$<Snap$Bool> (not
    (valid$Snap$I64<Bool> (constructor$Snap$I64$Sub_I64<Snap$I64> _9$snapshot$2@108@01 (constructor$Snap$I64$<Snap$I64> 1)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@415@01))))))
  $Snap.unit))
; [eval] MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(compute_address(target_place, target_address)), Size$I64$()) == to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(result_value))
; [eval] MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(compute_address(target_place, target_address)), Size$I64$())
; [eval] field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(compute_address(target_place, target_address))
; [eval] compute_address(target_place, target_address)
; [eval] Size$I64$()
(push) ; 7
(declare-const $k@416@01 $Perm)
(assert ($Perm.isReadVar $k@416@01))
(assert (< $k@416@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@416@01)))
(push) ; 8
(set-option :timeout 10)
(assert (not (< $Perm.No $k@416@01)))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@415@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _17$place<Place>  Place) _17$address@53@01)) (as Size$I64$<Snap$Usize>  Snap$Usize)))
(pop) ; 7
; Joined path conditions
(assert ($Perm.isReadVar $k@416@01))
(assert (and
  (< $k@416@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@416@01))
  (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@415@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _17$place<Place>  Place) _17$address@53@01)) (as Size$I64$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(result_value))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(result_value)
(assert (=
  (MemoryBlock$bytes ($Snap.first ($Snap.second $t@415@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _17$place<Place>  Place) _17$address@53@01)) (as Size$I64$<Snap$Usize>  Snap$Usize))
  (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> result_value@414@01))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _17$snapshot$1 == tmp$6
(declare-const $t@417@01 $Snap)
(assert (= $t@417@01 $Snap.unit))
; [eval] _17$snapshot$1 == tmp$6
(assert (= _17$snapshot$1@55@01 result_value@414@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [eval] !destructor$Snap$Bool$$value(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(_17$snapshot$1))
; [eval] destructor$Snap$Bool$$value(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(_17$snapshot$1))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(_17$snapshot$1)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (destructor$Snap$Bool$$value<Bool> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> _17$snapshot$1@55@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not
  (destructor$Snap$Bool$$value<Bool> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> _17$snapshot$1@55@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [then-branch: 48 | !(destructor$Snap$Bool$$value[Bool](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](_17$snapshot$1@55@01))) | live]
; [else-branch: 48 | destructor$Snap$Bool$$value[Bool](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](_17$snapshot$1@55@01)) | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 48 | !(destructor$Snap$Bool$$value[Bool](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](_17$snapshot$1@55@01)))]
(assert (not
  (destructor$Snap$Bool$$value<Bool> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> _17$snapshot$1@55@01))))
; [exec]
; label label_bb13
; [exec]
; label_bb13$marker := true
; [exec]
; inhale basic_block_marker$label_bb13$marker()
(declare-const $t@418@01 $Snap)
(assert (= $t@418@01 $Snap.unit))
; [eval] basic_block_marker$label_bb13$marker()
(assert (as basic_block_marker$label_bb13$marker<Bool>  Bool))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; into_memory_block$I64(_9$place(), _9$address, _9$snapshot$2)
; [eval] _9$place()
; [eval] compute_address(place, root_address)
; [eval] Size$I64$()
(declare-const $t@419@01 $Snap)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _17$place<Place>  Place) _17$address@53@01)
    (compute_address<Address> (as _9$place<Place>  Place) _9$address@105@01))
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
    _0$address@0@01
    (compute_address<Address> (as _9$place<Place>  Place) _9$address@105@01))
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
    _3$address@79@01
    (compute_address<Address> (as _9$place<Place>  Place) _9$address@105@01))
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
(assert (not (and
  (=
    _21$address@71@01
    (compute_address<Address> (as _9$place<Place>  Place) _9$address@105@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
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
    _10$address@11@01
    (compute_address<Address> (as _9$place<Place>  Place) _9$address@105@01))
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
    _11$address@18@01
    (compute_address<Address> (as _9$place<Place>  Place) _9$address@105@01))
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
(assert (not (and
  (=
    _2$address@62@01
    (compute_address<Address> (as _9$place<Place>  Place) _9$address@105@01))
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
  (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _17$place<Place>  Place) _17$address@53@01))
  (compute_address<Address> (as _9$place<Place>  Place) _9$address@105@01))))
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
; fold acc(OwnedNonAliased$I64(field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(_17$place()),
;   _17$address, destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(_17$snapshot$1)), write)
; [eval] field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(_17$place())
; [eval] _17$place()
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(_17$snapshot$1)
; [eval] valid$Snap$I64(snapshot)
(set-option :timeout 0)
(push) ; 8
(assert (not (valid$Snap$I64<Bool> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _17$snapshot$1@55@01))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (valid$Snap$I64<Bool> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _17$snapshot$1@55@01)))
; [eval] compute_address(place, root_address)
; [eval] Size$I64$()
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _9$place<Place>  Place) _9$address@105@01)
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _17$place<Place>  Place)) _17$address@53@01))))
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
    (compute_address<Address> (as _17$place<Place>  Place) _17$address@53@01)
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _17$place<Place>  Place)) _17$address@53@01))
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
    _0$address@0@01
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _17$place<Place>  Place)) _17$address@53@01))
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
    _3$address@79@01
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _17$place<Place>  Place)) _17$address@53@01))
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
(assert (not (and
  (=
    _21$address@71@01
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _17$place<Place>  Place)) _17$address@53@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
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
    _10$address@11@01
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _17$place<Place>  Place)) _17$address@53@01))
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
    _11$address@18@01
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _17$place<Place>  Place)) _17$address@53@01))
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
(assert (not (and
  (=
    _2$address@62@01
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _17$place<Place>  Place)) _17$address@53@01))
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
  (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _17$place<Place>  Place) _17$address@53@01))
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _17$place<Place>  Place)) _17$address@53@01))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [eval] MemoryBlock$bytes(compute_address(place, root_address), Size$I64$()) == to_bytes$I64(snapshot)
; [eval] MemoryBlock$bytes(compute_address(place, root_address), Size$I64$())
; [eval] compute_address(place, root_address)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 8
(declare-const $k@420@01 $Perm)
(assert ($Perm.isReadVar $k@420@01))
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _9$place<Place>  Place) _9$address@105@01)
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _17$place<Place>  Place)) _17$address@53@01))))
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
    (compute_address<Address> (as _17$place<Place>  Place) _17$address@53@01)
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _17$place<Place>  Place)) _17$address@53@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
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
    _0$address@0@01
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _17$place<Place>  Place)) _17$address@53@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
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
    _3$address@79@01
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _17$place<Place>  Place)) _17$address@53@01))
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
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
    _21$address@71@01
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _17$place<Place>  Place)) _17$address@53@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
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
    _10$address@11@01
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _17$place<Place>  Place)) _17$address@53@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
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
    _11$address@18@01
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _17$place<Place>  Place)) _17$address@53@01))
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
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
    _2$address@62@01
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _17$place<Place>  Place)) _17$address@53@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _17$place<Place>  Place) _17$address@53@01))
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _17$place<Place>  Place)) _17$address@53@01))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (< $k@420@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@420@01)))
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (< $Perm.No $k@420@01)))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@415@01)) (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _17$place<Place>  Place)) _17$address@53@01) (as Size$I64$<Snap$Usize>  Snap$Usize)))
(pop) ; 8
; Joined path conditions
(assert ($Perm.isReadVar $k@420@01))
(assert (and
  (< $k@420@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@420@01))
  (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@415@01)) (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _17$place<Place>  Place)) _17$address@53@01) (as Size$I64$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$I64(snapshot)
(set-option :timeout 0)
(push) ; 8
(assert (not (=
  (MemoryBlock$bytes ($Snap.first ($Snap.second $t@415@01)) (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _17$place<Place>  Place)) _17$address@53@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
  (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _17$snapshot$1@55@01)))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (=
  (MemoryBlock$bytes ($Snap.first ($Snap.second $t@415@01)) (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _17$place<Place>  Place)) _17$address@53@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
  (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _17$snapshot$1@55@01))))
(assert (OwnedNonAliased$I64%trigger ($Snap.combine
  $Snap.unit
  ($Snap.combine ($Snap.first ($Snap.second $t@415@01)) $Snap.unit)) (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _17$place<Place>  Place)) _17$address@53@01 (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _17$snapshot$1@55@01)))
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    (as _1$place<Place>  Place)
    (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _17$place<Place>  Place)))
  (= _1$address@4@01 _17$address@53@01)
  (=
    _1$snapshot$1@6@01
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _17$snapshot$1@55@01)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [exec]
; move_place$I64(_9$place(), _9$address, field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(_17$place()),
;   _17$address, destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(_17$snapshot$1))
; [eval] _9$place()
; [eval] field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(_17$place())
; [eval] _17$place()
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(_17$snapshot$1)
; [eval] compute_address(target_place, target_root_address)
; [eval] Size$I64$()
(declare-const $t@421@01 $Snap)
(assert (= $t@421@01 ($Snap.combine ($Snap.first $t@421@01) ($Snap.second $t@421@01))))
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (= (as _1$place<Place>  Place) (as _9$place<Place>  Place))
  (= _1$address@4@01 _9$address@105@01)
  (=
    _1$snapshot$1@6@01
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _17$snapshot$1@55@01)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second $t@421@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@421@01))
    ($Snap.second ($Snap.second $t@421@01)))))
; [eval] compute_address(source_place, source_root_address)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    _2$address@62@01
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _17$place<Place>  Place)) _17$address@53@01))
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
    _11$address@18@01
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _17$place<Place>  Place)) _17$address@53@01))
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
(assert (not (and
  (=
    _10$address@11@01
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _17$place<Place>  Place)) _17$address@53@01))
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
    _21$address@71@01
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _17$place<Place>  Place)) _17$address@53@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
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
    _3$address@79@01
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _17$place<Place>  Place)) _17$address@53@01))
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
(assert (not (and
  (=
    _0$address@0@01
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _17$place<Place>  Place)) _17$address@53@01))
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
    (compute_address<Address> (as _17$place<Place>  Place) _17$address@53@01)
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _17$place<Place>  Place)) _17$address@53@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (= ($Snap.second ($Snap.second $t@421@01)) $Snap.unit))
; [eval] valid$Snap$I64(source_snapshot)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _9$snapshot$3 ==
;   destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(_17$snapshot$1)
(declare-const $t@422@01 $Snap)
(assert (= $t@422@01 $Snap.unit))
; [eval] _9$snapshot$3 == destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(_17$snapshot$1)
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(_17$snapshot$1)
(assert (=
  _9$snapshot$3@109@01
  (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _17$snapshot$1@55@01)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; write_place_constant$Tuple$$$(_2$place(), _2$address, constructor$Snap$Tuple$$$$())
; [eval] _2$place()
; [eval] constructor$Snap$Tuple$$$$()
; [eval] compute_address(target_place, target_root_address)
; [eval] Size$Tuple$$$$()
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _17$place<Place>  Place)) _17$address@53@01)
    (compute_address<Address> (as _2$place<Place>  Place) _2$address@62@01))
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
  _2$address@62@01
  (compute_address<Address> (as _2$place<Place>  Place) _2$address@62@01))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [eval] valid$Snap$Tuple$$$(source_snapshot)
(declare-const $t@423@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _2$snapshot$1 == constructor$Snap$Tuple$$$$()
(declare-const $t@424@01 $Snap)
(assert (= $t@424@01 $Snap.unit))
; [eval] _2$snapshot$1 == constructor$Snap$Tuple$$$$()
; [eval] constructor$Snap$Tuple$$$$()
(assert (=
  _2$snapshot$1@64@01
  (as constructor$Snap$Tuple$$$$<Snap$Tuple$$$>  Snap$Tuple$$$)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; exhale acc(MemoryBlock(_11$address, Size$Bool$()), write)
; [eval] Size$Bool$()
; [exec]
; exhale acc(MemoryBlockStackDrop(_11$address, Size$Bool$()), write)
; [eval] Size$Bool$()
; [exec]
; label loop__label_bb7__label_bb7
; [exec]
; loop__label_bb7__label_bb7$marker := true
; [exec]
; inhale basic_block_marker$loop__label_bb7__label_bb7$marker()
(declare-const $t@425@01 $Snap)
(assert (= $t@425@01 $Snap.unit))
; [eval] basic_block_marker$loop__label_bb7__label_bb7$marker()
(assert (as basic_block_marker$loop__label_bb7__label_bb7$marker<Bool>  Bool))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; label loop__label_bb7__label_bb8
; [exec]
; loop__label_bb7__label_bb8$marker := true
; [exec]
; inhale basic_block_marker$loop__label_bb7__label_bb8$marker()
(declare-const $t@426@01 $Snap)
(assert (= $t@426@01 $Snap.unit))
; [eval] basic_block_marker$loop__label_bb7__label_bb8$marker()
(assert (as basic_block_marker$loop__label_bb7__label_bb8$marker<Bool>  Bool))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlock(_11$address, Size$Bool$()), write)
; [eval] Size$Bool$()
(declare-const $t@427@01 $Snap)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _17$place<Place>  Place)) _17$address@53@01)
    _11$address@18@01)
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
  (= _10$address@11@01 _11$address@18@01)
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
  (= _21$address@71@01 _11$address@18@01)
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= _3$address@79@01 _11$address@18@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (= _0$address@0@01 _11$address@18@01)
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
    (compute_address<Address> (as _17$place<Place>  Place) _17$address@53@01)
    _11$address@18@01)
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
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
; inhale acc(MemoryBlockStackDrop(_11$address, Size$Bool$()), write)
; [eval] Size$Bool$()
(declare-const $t@428@01 $Snap)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (= _10$address@11@01 _11$address@18@01)
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
  (= _9$address@105@01 _11$address@18@01)
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
(assert (not (= _3$address@79@01 _11$address@18@01)))
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
; inhale acc(MemoryBlock(_12$address, Size$I64$()), write)
; [eval] Size$I64$()
(declare-const $t@429@01 $Snap)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (= _11$address@18@01 _12$address@27@01)
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
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _17$place<Place>  Place)) _17$address@53@01)
  _12$address@27@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (= _10$address@11@01 _12$address@27@01)
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
  (= _21$address@71@01 _12$address@27@01)
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
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
  (= _3$address@79@01 _12$address@27@01)
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
(assert (not (and
  (= _0$address@0@01 _12$address@27@01)
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
    (compute_address<Address> (as _17$place<Place>  Place) _17$address@53@01)
    _12$address@27@01)
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
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
; inhale acc(MemoryBlockStackDrop(_12$address, Size$I64$()), write)
; [eval] Size$I64$()
(declare-const $t@430@01 $Snap)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (= _11$address@18@01 _12$address@27@01)
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
(assert (not (and
  (= _10$address@11@01 _12$address@27@01)
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
(assert (not (= _9$address@105@01 _12$address@27@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (= _3$address@79@01 _12$address@27@01)
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
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
; copy_place$I64(_12$place(), _12$address, _9$place(), _9$address, _9$snapshot$3,
;   write)
; [eval] _12$place()
; [eval] _9$place()
; [eval] none < source_permission_amount
; [eval] compute_address(target_place, target_root_address)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _17$place<Place>  Place) _17$address@53@01)
    (compute_address<Address> (as _12$place<Place>  Place) _12$address@27@01))
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
    _0$address@0@01
    (compute_address<Address> (as _12$place<Place>  Place) _12$address@27@01))
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
    _3$address@79@01
    (compute_address<Address> (as _12$place<Place>  Place) _12$address@27@01))
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
(assert (not (and
  (=
    _21$address@71@01
    (compute_address<Address> (as _12$place<Place>  Place) _12$address@27@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
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
    _10$address@11@01
    (compute_address<Address> (as _12$place<Place>  Place) _12$address@27@01))
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
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _17$place<Place>  Place)) _17$address@53@01)
  (compute_address<Address> (as _12$place<Place>  Place) _12$address@27@01))))
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
    _11$address@18@01
    (compute_address<Address> (as _12$place<Place>  Place) _12$address@27@01))
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
  _12$address@27@01
  (compute_address<Address> (as _12$place<Place>  Place) _12$address@27@01))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _17$snapshot$1@55@01)
  _9$snapshot$3@109@01)))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(declare-const $t@431@01 $Snap)
(assert (= $t@431@01 ($Snap.combine ($Snap.first $t@431@01) ($Snap.second $t@431@01))))
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (= (as _1$place<Place>  Place) (as _9$place<Place>  Place))
  (= _1$address@4@01 _9$address@105@01)
  (= _1$snapshot$1@6@01 _9$snapshot$3@109@01))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second $t@431@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@431@01))
    ($Snap.second ($Snap.second $t@431@01)))))
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (= (as _1$place<Place>  Place) (as _12$place<Place>  Place))
  (= _1$address@4@01 _12$address@27@01)
  (= _1$snapshot$1@6@01 _9$snapshot$3@109@01))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (= (as _9$place<Place>  Place) (as _12$place<Place>  Place))
  (= _9$address@105@01 _12$address@27@01))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (= ($Snap.second ($Snap.second $t@431@01)) $Snap.unit))
; [eval] valid$Snap$I64(source_snapshot)
(assert (valid$Snap$I64<Bool> _9$snapshot$3@109@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _12$snapshot$2 == _9$snapshot$3
(declare-const $t@432@01 $Snap)
(assert (= $t@432@01 $Snap.unit))
; [eval] _12$snapshot$2 == _9$snapshot$3
(assert (= _12$snapshot$2@30@01 _9$snapshot$3@109@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; tmp$7 := assign$Bool$BinaryOp$GtCmp$Move$I64$Constant$I64$$$$(_11$place(), _11$address,
;   _12$place(), _12$address, _12$snapshot$2, constructor$Snap$I64$(0))
; [eval] _11$place()
; [eval] _12$place()
; [eval] constructor$Snap$I64$(0)
; [eval] compute_address(target_place, target_address)
; [eval] Size$Bool$()
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _17$place<Place>  Place) _17$address@53@01)
    (compute_address<Address> (as _11$place<Place>  Place) _11$address@18@01))
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
    (compute_address<Address> (as _11$place<Place>  Place) _11$address@18@01))
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
  _3$address@79@01
  (compute_address<Address> (as _11$place<Place>  Place) _11$address@18@01))))
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
    _21$address@71@01
    (compute_address<Address> (as _11$place<Place>  Place) _11$address@18@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
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
    _10$address@11@01
    (compute_address<Address> (as _11$place<Place>  Place) _11$address@18@01))
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
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _17$place<Place>  Place)) _17$address@53@01)
    (compute_address<Address> (as _11$place<Place>  Place) _11$address@18@01))
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
(assert (not (=
  _11$address@18@01
  (compute_address<Address> (as _11$place<Place>  Place) _11$address@18@01))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= _9$snapshot$3@109@01 _12$snapshot$2@30@01)))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [eval] valid$Snap$I64(operand1_value)
(set-option :timeout 0)
(push) ; 8
(assert (not (valid$Snap$I64<Bool> _12$snapshot$2@30@01)))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (valid$Snap$I64<Bool> _12$snapshot$2@30@01))
; [eval] valid$Snap$I64(operand2_value)
(declare-const result_value@433@01 Snap$Bool)
(declare-const $t@434@01 $Snap)
(assert (= $t@434@01 ($Snap.combine ($Snap.first $t@434@01) ($Snap.second $t@434@01))))
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _17$place<Place>  Place))
    (as _11$place<Place>  Place))
  (= _17$address@53@01 _11$address@18@01)
  (=
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> result_value@414@01)
    result_value@433@01))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second $t@434@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@434@01))
    ($Snap.second ($Snap.second $t@434@01)))))
; [eval] compute_address(operand1_place, operand1_root_address)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _17$place<Place>  Place) _17$address@53@01)
    (compute_address<Address> (as _12$place<Place>  Place) _12$address@27@01))
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
    _0$address@0@01
    (compute_address<Address> (as _12$place<Place>  Place) _12$address@27@01))
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
    _3$address@79@01
    (compute_address<Address> (as _12$place<Place>  Place) _12$address@27@01))
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
(assert (not (and
  (=
    _21$address@71@01
    (compute_address<Address> (as _12$place<Place>  Place) _12$address@27@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
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
    _10$address@11@01
    (compute_address<Address> (as _12$place<Place>  Place) _12$address@27@01))
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
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _17$place<Place>  Place)) _17$address@53@01)
  (compute_address<Address> (as _12$place<Place>  Place) _12$address@27@01))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second $t@434@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@434@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@434@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@434@01))) $Snap.unit))
; [eval] result_value == constructor$Snap$Bool$GtCmp_I64(operand1_value, operand2_value)
; [eval] constructor$Snap$Bool$GtCmp_I64(operand1_value, operand2_value)
(assert (=
  result_value@433@01
  (constructor$Snap$Bool$GtCmp_I64<Snap$Bool> _12$snapshot$2@30@01 (constructor$Snap$I64$<Snap$I64> 0))))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@434@01))) $Snap.unit))
; [eval] valid$Snap$Bool(result_value)
(assert (valid$Snap$Bool<Bool> result_value@433@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _11$snapshot$2 == tmp$7
(declare-const $t@435@01 $Snap)
(assert (= $t@435@01 $Snap.unit))
; [eval] _11$snapshot$2 == tmp$7
(assert (= _11$snapshot$2@21@01 result_value@433@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; exhale acc(MemoryBlock(_12$address, Size$I64$()), write)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _12$place<Place>  Place) _12$address@27@01)
  _12$address@27@01)))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(MemoryBlockStackDrop(_12$address, Size$I64$()), write)
; [eval] Size$I64$()
; [eval] !destructor$Snap$Bool$$value(_11$snapshot$2)
; [eval] destructor$Snap$Bool$$value(_11$snapshot$2)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (destructor$Snap$Bool$$value<Bool> _11$snapshot$2@21@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (not (destructor$Snap$Bool$$value<Bool> _11$snapshot$2@21@01))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [then-branch: 49 | !(destructor$Snap$Bool$$value[Bool](_11$snapshot$2@21@01)) | live]
; [else-branch: 49 | destructor$Snap$Bool$$value[Bool](_11$snapshot$2@21@01) | live]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 49 | !(destructor$Snap$Bool$$value[Bool](_11$snapshot$2@21@01))]
(assert (not (destructor$Snap$Bool$$value<Bool> _11$snapshot$2@21@01)))
; [exec]
; label label__from__loop__label_bb7__label_bb8__to__label_5_custom
; [exec]
; inhale _11$snapshot$3 == _11$snapshot$2
(declare-const $t@436@01 $Snap)
(assert (= $t@436@01 $Snap.unit))
; [eval] _11$snapshot$3 == _11$snapshot$2
(assert (= _11$snapshot$3@22@01 _11$snapshot$2@21@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale _12$snapshot$3 == _12$snapshot$2
(declare-const $t@437@01 $Snap)
(assert (= $t@437@01 $Snap.unit))
; [eval] _12$snapshot$3 == _12$snapshot$2
(assert (= _12$snapshot$3@31@01 _12$snapshot$2@30@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _13$snapshot$2 == _13$snapshot$1
(declare-const $t@438@01 $Snap)
(assert (= $t@438@01 $Snap.unit))
; [eval] _13$snapshot$2 == _13$snapshot$1
(assert (= _13$snapshot$2@39@01 _13$snapshot$1@38@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _14$snapshot$3 == _14$snapshot$1
(declare-const $t@439@01 $Snap)
(assert (= $t@439@01 $Snap.unit))
; [eval] _14$snapshot$3 == _14$snapshot$1
(assert (= _14$snapshot$3@48@01 _14$snapshot$1@46@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _17$snapshot$2 == _17$snapshot$1
(declare-const $t@440@01 $Snap)
(assert (= $t@440@01 $Snap.unit))
; [eval] _17$snapshot$2 == _17$snapshot$1
(assert (= _17$snapshot$2@56@01 _17$snapshot$1@55@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _2$snapshot$2 == _2$snapshot$1
(declare-const $t@441@01 $Snap)
(assert (= $t@441@01 $Snap.unit))
; [eval] _2$snapshot$2 == _2$snapshot$1
(assert (= _2$snapshot$2@65@01 _2$snapshot$1@64@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _9$snapshot$4 == _9$snapshot$3
(declare-const $t@442@01 $Snap)
(assert (= $t@442@01 $Snap.unit))
; [eval] _9$snapshot$4 == _9$snapshot$3
(assert (= _9$snapshot$4@110@01 _9$snapshot$3@109@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale loop_variant$2$snapshot$3 == loop_variant$2$snapshot$2
(declare-const $t@443@01 $Snap)
(assert (= $t@443@01 $Snap.unit))
; [eval] loop_variant$2$snapshot$3 == loop_variant$2$snapshot$2
(assert (= loop_variant$2$snapshot$3@158@01 loop_variant$2$snapshot$2@157@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; label label_5_custom
; [exec]
; label_5_custom$marker := true
; [exec]
; inhale basic_block_marker$label_5_custom$marker()
(declare-const $t@444@01 $Snap)
(assert (= $t@444@01 $Snap.unit))
; [eval] basic_block_marker$label_5_custom$marker()
(assert (as basic_block_marker$label_5_custom$marker<Bool>  Bool))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; label label_bb14
; [exec]
; label_bb14$marker := true
; [exec]
; inhale basic_block_marker$label_bb14$marker()
(declare-const $t@445@01 $Snap)
(assert (= $t@445@01 $Snap.unit))
; [eval] basic_block_marker$label_bb14$marker()
(assert (as basic_block_marker$label_bb14$marker<Bool>  Bool))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlock(_19$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
(declare-const $t@446@01 $Snap)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _17$place<Place>  Place)) _17$address@53@01)
    _19$address@61@01)
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
(assert (not (= _10$address@11@01 _19$address@61@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (= _21$address@71@01 _19$address@61@01)
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
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
  (= _3$address@79@01 _19$address@61@01)
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= _0$address@0@01 _19$address@61@01)))
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
    (compute_address<Address> (as _17$place<Place>  Place) _17$address@53@01)
    _19$address@61@01)
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
; inhale acc(MemoryBlockStackDrop(_19$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
(declare-const $t@447@01 $Snap)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (= _11$address@18@01 _19$address@61@01)
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= _10$address@11@01 _19$address@61@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (= _9$address@105@01 _19$address@61@01)
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
  (= _3$address@79@01 _19$address@61@01)
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
; write_place_constant$Tuple$$$(_10$place(), _10$address, constructor$Snap$Tuple$$$$())
; [eval] _10$place()
; [eval] constructor$Snap$Tuple$$$$()
; [eval] compute_address(target_place, target_root_address)
; [eval] Size$Tuple$$$$()
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _17$place<Place>  Place) _17$address@53@01)
    (compute_address<Address> (as _10$place<Place>  Place) _10$address@11@01))
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
(assert (not (=
  _0$address@0@01
  (compute_address<Address> (as _10$place<Place>  Place) _10$address@11@01))))
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
    _3$address@79@01
    (compute_address<Address> (as _10$place<Place>  Place) _10$address@11@01))
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
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
    _21$address@71@01
    (compute_address<Address> (as _10$place<Place>  Place) _10$address@11@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  _10$address@11@01
  (compute_address<Address> (as _10$place<Place>  Place) _10$address@11@01))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [eval] valid$Snap$Tuple$$$(source_snapshot)
(declare-const $t@448@01 $Snap)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (= (as _2$place<Place>  Place) (as _10$place<Place>  Place))
  (= _2$address@62@01 _10$address@11@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _10$snapshot$1 == constructor$Snap$Tuple$$$$()
(declare-const $t@449@01 $Snap)
(assert (= $t@449@01 $Snap.unit))
; [eval] _10$snapshot$1 == constructor$Snap$Tuple$$$$()
; [eval] constructor$Snap$Tuple$$$$()
(assert (=
  _10$snapshot$1@13@01
  (as constructor$Snap$Tuple$$$$<Snap$Tuple$$$>  Snap$Tuple$$$)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; exhale acc(MemoryBlock(_19$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
; [exec]
; exhale acc(MemoryBlockStackDrop(_19$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
; [exec]
; into_memory_block$Bool(_11$place(), _11$address, _11$snapshot$3)
; [eval] _11$place()
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= result_value@433@01 _11$snapshot$3@22@01)))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [eval] compute_address(place, root_address)
; [eval] Size$Bool$()
(declare-const $t@450@01 $Snap)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _17$place<Place>  Place) _17$address@53@01)
    (compute_address<Address> (as _11$place<Place>  Place) _11$address@18@01))
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
    _0$address@0@01
    (compute_address<Address> (as _11$place<Place>  Place) _11$address@18@01))
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
  _3$address@79@01
  (compute_address<Address> (as _11$place<Place>  Place) _11$address@18@01))))
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
    _21$address@71@01
    (compute_address<Address> (as _11$place<Place>  Place) _11$address@18@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
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
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _17$place<Place>  Place)) _17$address@53@01)
    (compute_address<Address> (as _11$place<Place>  Place) _11$address@18@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; exhale acc(MemoryBlock(_11$address, Size$Bool$()), write)
; [eval] Size$Bool$()
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _11$place<Place>  Place) _11$address@18@01)
  _11$address@18@01)))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(MemoryBlockStackDrop(_11$address, Size$Bool$()), write)
; [eval] Size$Bool$()
; [exec]
; into_memory_block$Tuple$$$(_10$place(), _10$address, _10$snapshot$1)
; [eval] _10$place()
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (= (as _2$place<Place>  Place) (as _10$place<Place>  Place))
  (= _2$address@62@01 _10$address@11@01)
  (=
    (as constructor$Snap$Tuple$$$$<Snap$Tuple$$$>  Snap$Tuple$$$)
    _10$snapshot$1@13@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  (as constructor$Snap$Tuple$$$$<Snap$Tuple$$$>  Snap$Tuple$$$)
  _10$snapshot$1@13@01)))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [eval] compute_address(place, root_address)
; [eval] Size$Tuple$$$$()
(declare-const $t@451@01 $Snap)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _17$place<Place>  Place)) _17$address@53@01)
    (compute_address<Address> (as _10$place<Place>  Place) _10$address@11@01))
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
    _21$address@71@01
    (compute_address<Address> (as _10$place<Place>  Place) _10$address@11@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
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
    _3$address@79@01
    (compute_address<Address> (as _10$place<Place>  Place) _10$address@11@01))
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  _0$address@0@01
  (compute_address<Address> (as _10$place<Place>  Place) _10$address@11@01))))
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
    (compute_address<Address> (as _17$place<Place>  Place) _17$address@53@01)
    (compute_address<Address> (as _10$place<Place>  Place) _10$address@11@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 9
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
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _10$place<Place>  Place) _10$address@11@01)
  _10$address@11@01)))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(MemoryBlockStackDrop(_10$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
; [exec]
; tmp$8 := assign$Tuple$$I64$Bool$$I64$Bool$$CheckedBinaryOp$Sub$Copy$I64$Constant$I64$$$$(_21$place(),
;   _21$address, _1$place(), _1$address, _1$snapshot$1, constructor$Snap$I64$(1))
; [eval] _21$place()
; [eval] _1$place()
; [eval] constructor$Snap$I64$(1)
; [eval] compute_address(target_place, target_address)
; [eval] Size$Tuple$$I64$Bool$$I64$Bool$$()
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _17$place<Place>  Place)) _17$address@53@01)
    (compute_address<Address> (as _21$place<Place>  Place) _21$address@71@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  _21$address@71@01
  (compute_address<Address> (as _21$place<Place>  Place) _21$address@71@01))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [eval] valid$Snap$I64(operand1_value)
; [eval] valid$Snap$I64(operand2_value)
(declare-const result_value@452@01 Snap$Tuple$$I64$Bool$$I64$Bool$)
(declare-const $t@453@01 $Snap)
(assert (= $t@453@01 ($Snap.combine ($Snap.first $t@453@01) ($Snap.second $t@453@01))))
; [eval] compute_address(target_place, target_address)
; [eval] PaddingSize$Tuple$$I64$Bool$$I64$Bool$$()
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _17$place<Place>  Place) _17$address@53@01)
  (compute_address<Address> (as _21$place<Place>  Place) _21$address@71@01))))
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
    _0$address@0@01
    (compute_address<Address> (as _21$place<Place>  Place) _21$address@71@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
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
    _3$address@79@01
    (compute_address<Address> (as _21$place<Place>  Place) _21$address@71@01))
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
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
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _17$place<Place>  Place)) _17$address@53@01)
    (compute_address<Address> (as _21$place<Place>  Place) _21$address@71@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second $t@453@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@453@01))
    ($Snap.second ($Snap.second $t@453@01)))))
; [eval] field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(compute_address(target_place, target_address))
; [eval] compute_address(target_place, target_address)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _17$place<Place>  Place)) _17$address@53@01)
  (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _21$place<Place>  Place) _21$address@71@01)))))
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
    _3$address@79@01
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _21$place<Place>  Place) _21$address@71@01)))
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
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
    _0$address@0@01
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _21$place<Place>  Place) _21$address@71@01)))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
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
    (compute_address<Address> (as _17$place<Place>  Place) _17$address@53@01)
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _21$place<Place>  Place) _21$address@71@01)))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
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
    (compute_address<Address> (as _21$place<Place>  Place) _21$address@71@01)
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _21$place<Place>  Place) _21$address@71@01)))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second $t@453@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@453@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@453@01))))))
; [eval] field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(target_place)
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(result_value)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (=
    (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _17$place<Place>  Place))
    (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _21$place<Place>  Place)))
  (= _17$address@53@01 _21$address@71@01)
  (=
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> result_value@414@01)
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> result_value@452@01)))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@453@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@453@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@453@01)))))))
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (= (as _9$place<Place>  Place) (as _1$place<Place>  Place))
  (= _9$address@105@01 _1$address@4@01)
  (= _9$snapshot$3@109@01 _1$snapshot$1@6@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@453@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@453@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@453@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@453@01)))))
  $Snap.unit))
; [eval] valid$Snap$I64(constructor$Snap$I64$Sub_I64(operand1_value, operand2_value)) ==> destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(result_value) == constructor$Snap$I64$Sub_I64(operand1_value, operand2_value)
; [eval] valid$Snap$I64(constructor$Snap$I64$Sub_I64(operand1_value, operand2_value))
; [eval] constructor$Snap$I64$Sub_I64(operand1_value, operand2_value)
(set-option :timeout 0)
(push) ; 9
(push) ; 10
(set-option :timeout 10)
(assert (not (not
  (valid$Snap$I64<Bool> (constructor$Snap$I64$Sub_I64<Snap$I64> _1$snapshot$1@6@01 (constructor$Snap$I64$<Snap$I64> 1))))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (valid$Snap$I64<Bool> (constructor$Snap$I64$Sub_I64<Snap$I64> _1$snapshot$1@6@01 (constructor$Snap$I64$<Snap$I64> 1)))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [then-branch: 50 | valid$Snap$I64[Bool](constructor$Snap$I64$Sub_I64[Snap$I64](_1$snapshot$1@6@01, constructor$Snap$I64$[Snap$I64](1))) | live]
; [else-branch: 50 | !(valid$Snap$I64[Bool](constructor$Snap$I64$Sub_I64[Snap$I64](_1$snapshot$1@6@01, constructor$Snap$I64$[Snap$I64](1)))) | dead]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 50 | valid$Snap$I64[Bool](constructor$Snap$I64$Sub_I64[Snap$I64](_1$snapshot$1@6@01, constructor$Snap$I64$[Snap$I64](1)))]
(assert (valid$Snap$I64<Bool> (constructor$Snap$I64$Sub_I64<Snap$I64> _1$snapshot$1@6@01 (constructor$Snap$I64$<Snap$I64> 1))))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(result_value) == constructor$Snap$I64$Sub_I64(operand1_value, operand2_value)
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(result_value)
; [eval] constructor$Snap$I64$Sub_I64(operand1_value, operand2_value)
(pop) ; 10
(pop) ; 9
; Joined path conditions
(assert (valid$Snap$I64<Bool> (constructor$Snap$I64$Sub_I64<Snap$I64> _1$snapshot$1@6@01 (constructor$Snap$I64$<Snap$I64> 1))))
(assert (=>
  (valid$Snap$I64<Bool> (constructor$Snap$I64$Sub_I64<Snap$I64> _1$snapshot$1@6@01 (constructor$Snap$I64$<Snap$I64> 1)))
  (=
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> result_value@452@01)
    (constructor$Snap$I64$Sub_I64<Snap$I64> _1$snapshot$1@6@01 (constructor$Snap$I64$<Snap$I64> 1)))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@453@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@453@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@453@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@453@01))))))
  $Snap.unit))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(result_value) == constructor$Snap$Bool$(!valid$Snap$I64(constructor$Snap$I64$Sub_I64(operand1_value, operand2_value)))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(result_value)
; [eval] constructor$Snap$Bool$(!valid$Snap$I64(constructor$Snap$I64$Sub_I64(operand1_value, operand2_value)))
; [eval] !valid$Snap$I64(constructor$Snap$I64$Sub_I64(operand1_value, operand2_value))
; [eval] valid$Snap$I64(constructor$Snap$I64$Sub_I64(operand1_value, operand2_value))
; [eval] constructor$Snap$I64$Sub_I64(operand1_value, operand2_value)
(assert (=
  (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> result_value@452@01)
  (constructor$Snap$Bool$<Snap$Bool> (not
    (valid$Snap$I64<Bool> (constructor$Snap$I64$Sub_I64<Snap$I64> _1$snapshot$1@6@01 (constructor$Snap$I64$<Snap$I64> 1)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@453@01))))))
  $Snap.unit))
; [eval] MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(compute_address(target_place, target_address)), Size$I64$()) == to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(result_value))
; [eval] MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(compute_address(target_place, target_address)), Size$I64$())
; [eval] field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(compute_address(target_place, target_address))
; [eval] compute_address(target_place, target_address)
; [eval] Size$I64$()
(push) ; 9
(declare-const $k@454@01 $Perm)
(assert ($Perm.isReadVar $k@454@01))
(assert (< $k@454@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@454@01)))
(push) ; 10
(set-option :timeout 10)
(assert (not (< $Perm.No $k@454@01)))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@453@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _21$place<Place>  Place) _21$address@71@01)) (as Size$I64$<Snap$Usize>  Snap$Usize)))
(pop) ; 9
; Joined path conditions
(assert ($Perm.isReadVar $k@454@01))
(assert (and
  (< $k@454@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@454@01))
  (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@453@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _21$place<Place>  Place) _21$address@71@01)) (as Size$I64$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(result_value))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(result_value)
(assert (=
  (MemoryBlock$bytes ($Snap.first ($Snap.second $t@453@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _21$place<Place>  Place) _21$address@71@01)) (as Size$I64$<Snap$Usize>  Snap$Usize))
  (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> result_value@452@01))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _21$snapshot$1 == tmp$8
(declare-const $t@455@01 $Snap)
(assert (= $t@455@01 $Snap.unit))
; [eval] _21$snapshot$1 == tmp$8
(assert (= _21$snapshot$1@73@01 result_value@452@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [eval] !destructor$Snap$Bool$$value(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(_21$snapshot$1))
; [eval] destructor$Snap$Bool$$value(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(_21$snapshot$1))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(_21$snapshot$1)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (destructor$Snap$Bool$$value<Bool> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> _21$snapshot$1@73@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not
  (destructor$Snap$Bool$$value<Bool> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> _21$snapshot$1@73@01)))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [then-branch: 51 | !(destructor$Snap$Bool$$value[Bool](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](_21$snapshot$1@73@01))) | live]
; [else-branch: 51 | destructor$Snap$Bool$$value[Bool](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](_21$snapshot$1@73@01)) | dead]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 51 | !(destructor$Snap$Bool$$value[Bool](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](_21$snapshot$1@73@01)))]
(assert (not
  (destructor$Snap$Bool$$value<Bool> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> _21$snapshot$1@73@01))))
; [exec]
; label label_bb15
; [exec]
; label_bb15$marker := true
; [exec]
; inhale basic_block_marker$label_bb15$marker()
(declare-const $t@456@01 $Snap)
(assert (= $t@456@01 $Snap.unit))
; [eval] basic_block_marker$label_bb15$marker()
(assert (as basic_block_marker$label_bb15$marker<Bool>  Bool))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; into_memory_block$I64(_1$place(), _1$address, _1$snapshot$1)
; [eval] _1$place()
; [eval] compute_address(place, root_address)
; [eval] Size$I64$()
(declare-const $t@457@01 $Snap)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _21$place<Place>  Place) _21$address@71@01)
    (compute_address<Address> (as _1$place<Place>  Place) _1$address@4@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
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
    (compute_address<Address> (as _17$place<Place>  Place) _17$address@53@01)
    (compute_address<Address> (as _1$place<Place>  Place) _1$address@4@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
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
    _0$address@0@01
    (compute_address<Address> (as _1$place<Place>  Place) _1$address@4@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
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
    _3$address@79@01
    (compute_address<Address> (as _1$place<Place>  Place) _1$address@4@01))
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _17$place<Place>  Place)) _17$address@53@01)
  (compute_address<Address> (as _1$place<Place>  Place) _1$address@4@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _21$place<Place>  Place) _21$address@71@01))
  (compute_address<Address> (as _1$place<Place>  Place) _1$address@4@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; fold acc(OwnedNonAliased$I64(field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(_21$place()),
;   _21$address, destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(_21$snapshot$1)), write)
; [eval] field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(_21$place())
; [eval] _21$place()
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(_21$snapshot$1)
; [eval] valid$Snap$I64(snapshot)
(set-option :timeout 0)
(push) ; 10
(assert (not (valid$Snap$I64<Bool> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _21$snapshot$1@73@01))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(assert (valid$Snap$I64<Bool> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _21$snapshot$1@73@01)))
; [eval] compute_address(place, root_address)
; [eval] Size$I64$()
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _1$place<Place>  Place) _1$address@4@01)
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01))))
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
    (compute_address<Address> (as _21$place<Place>  Place) _21$address@71@01)
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
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
    (compute_address<Address> (as _17$place<Place>  Place) _17$address@53@01)
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
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
    _0$address@0@01
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
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
    _3$address@79@01
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01))
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _17$place<Place>  Place)) _17$address@53@01)
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _21$place<Place>  Place) _21$address@71@01))
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [eval] MemoryBlock$bytes(compute_address(place, root_address), Size$I64$()) == to_bytes$I64(snapshot)
; [eval] MemoryBlock$bytes(compute_address(place, root_address), Size$I64$())
; [eval] compute_address(place, root_address)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 10
(declare-const $k@458@01 $Perm)
(assert ($Perm.isReadVar $k@458@01))
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _1$place<Place>  Place) _1$address@4@01)
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01))))
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
    (compute_address<Address> (as _21$place<Place>  Place) _21$address@71@01)
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
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
    (compute_address<Address> (as _17$place<Place>  Place) _17$address@53@01)
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
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
    _0$address@0@01
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
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
    _3$address@79@01
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01))
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
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _17$place<Place>  Place)) _17$address@53@01)
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _21$place<Place>  Place) _21$address@71@01))
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(assert (< $k@458@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@458@01)))
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (< $Perm.No $k@458@01)))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@453@01)) (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01) (as Size$I64$<Snap$Usize>  Snap$Usize)))
(pop) ; 10
; Joined path conditions
(assert ($Perm.isReadVar $k@458@01))
(assert (and
  (< $k@458@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@458@01))
  (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@453@01)) (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01) (as Size$I64$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$I64(snapshot)
(set-option :timeout 0)
(push) ; 10
(assert (not (=
  (MemoryBlock$bytes ($Snap.first ($Snap.second $t@453@01)) (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
  (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _21$snapshot$1@73@01)))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(assert (=
  (MemoryBlock$bytes ($Snap.first ($Snap.second $t@453@01)) (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
  (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _21$snapshot$1@73@01))))
(assert (OwnedNonAliased$I64%trigger ($Snap.combine
  $Snap.unit
  ($Snap.combine ($Snap.first ($Snap.second $t@453@01)) $Snap.unit)) (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01 (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _21$snapshot$1@73@01)))
(push) ; 10
(set-option :timeout 10)
(assert (not (and
  (=
    (as _9$place<Place>  Place)
    (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)))
  (= _9$address@105@01 _21$address@71@01)
  (=
    _9$snapshot$3@109@01
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _21$snapshot$1@73@01)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [exec]
; move_place$I64(_1$place(), _1$address, field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(_21$place()),
;   _21$address, destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(_21$snapshot$1))
; [eval] _1$place()
; [eval] field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(_21$place())
; [eval] _21$place()
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(_21$snapshot$1)
; [eval] compute_address(target_place, target_root_address)
; [eval] Size$I64$()
(declare-const $t@459@01 $Snap)
(assert (= $t@459@01 ($Snap.combine ($Snap.first $t@459@01) ($Snap.second $t@459@01))))
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and
  (= (as _9$place<Place>  Place) (as _1$place<Place>  Place))
  (= _9$address@105@01 _1$address@4@01)
  (=
    _9$snapshot$3@109@01
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _21$snapshot$1@73@01)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second $t@459@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@459@01))
    ($Snap.second ($Snap.second $t@459@01)))))
; [eval] compute_address(source_place, source_root_address)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _17$place<Place>  Place)) _17$address@53@01)
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01))))
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
    _3$address@79@01
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01))
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
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
    _0$address@0@01
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
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
    (compute_address<Address> (as _17$place<Place>  Place) _17$address@53@01)
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
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
    (compute_address<Address> (as _21$place<Place>  Place) _21$address@71@01)
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(assert (= ($Snap.second ($Snap.second $t@459@01)) $Snap.unit))
; [eval] valid$Snap$I64(source_snapshot)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _1$snapshot$2 ==
;   destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(_21$snapshot$1)
(declare-const $t@460@01 $Snap)
(assert (= $t@460@01 $Snap.unit))
; [eval] _1$snapshot$2 == destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(_21$snapshot$1)
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(_21$snapshot$1)
(assert (=
  _1$snapshot$2@7@01
  (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _21$snapshot$1@73@01)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [eval] loop__label_bb7__label_bb8$marker && (label_5_custom$marker && label_bb14$marker)
(set-option :timeout 0)
(push) ; 10
; [then-branch: 52 | True | live]
; [else-branch: 52 | False | live]
(push) ; 11
; [then-branch: 52 | True]
(push) ; 12
; [then-branch: 53 | True | live]
; [else-branch: 53 | False | live]
(push) ; 13
; [then-branch: 53 | True]
(pop) ; 13
(push) ; 13
; [else-branch: 53 | False]
(assert false)
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(pop) ; 11
(push) ; 11
; [else-branch: 52 | False]
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
; [then-branch: 54 | True | live]
; [else-branch: 54 | False | dead]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 54 | True]
; [exec]
; into_memory_block$Tuple$$$(_2$place(), _2$address, _2$snapshot$2)
; [eval] _2$place()
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  (as constructor$Snap$Tuple$$$$<Snap$Tuple$$$>  Snap$Tuple$$$)
  _2$snapshot$2@65@01)))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [eval] compute_address(place, root_address)
; [eval] Size$Tuple$$$$()
(declare-const $t@461@01 $Snap)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _21$place<Place>  Place) _21$address@71@01)
    (compute_address<Address> (as _2$place<Place>  Place) _2$address@62@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
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
    (compute_address<Address> (as _17$place<Place>  Place) _17$address@53@01)
    (compute_address<Address> (as _2$place<Place>  Place) _2$address@62@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  _0$address@0@01
  (compute_address<Address> (as _2$place<Place>  Place) _2$address@62@01))))
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
    _3$address@79@01
    (compute_address<Address> (as _2$place<Place>  Place) _2$address@62@01))
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
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
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _17$place<Place>  Place)) _17$address@53@01)
    (compute_address<Address> (as _2$place<Place>  Place) _2$address@62@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
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
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01)
    (compute_address<Address> (as _2$place<Place>  Place) _2$address@62@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; write_place_constant$Tuple$$$(_2$place(), _2$address, constructor$Snap$Tuple$$$$())
; [eval] _2$place()
; [eval] constructor$Snap$Tuple$$$$()
; [eval] compute_address(target_place, target_root_address)
; [eval] Size$Tuple$$$$()
; [eval] valid$Snap$Tuple$$$(source_snapshot)
(declare-const $t@462@01 $Snap)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; inhale _2$snapshot$4 == constructor$Snap$Tuple$$$$()
(declare-const $t@463@01 $Snap)
(assert (= $t@463@01 $Snap.unit))
; [eval] _2$snapshot$4 == constructor$Snap$Tuple$$$$()
; [eval] constructor$Snap$Tuple$$$$()
(assert (=
  _2$snapshot$4@67@01
  (as constructor$Snap$Tuple$$$$<Snap$Tuple$$$>  Snap$Tuple$$$)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; into_memory_block$I64(_9$place(), _9$address, _9$snapshot$4)
; [eval] _9$place()
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= _9$snapshot$3@109@01 _9$snapshot$4@110@01)))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [eval] compute_address(place, root_address)
; [eval] Size$I64$()
(declare-const $t@464@01 $Snap)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _21$place<Place>  Place) _21$address@71@01)
    (compute_address<Address> (as _9$place<Place>  Place) _9$address@105@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
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
    (compute_address<Address> (as _17$place<Place>  Place) _17$address@53@01)
    (compute_address<Address> (as _9$place<Place>  Place) _9$address@105@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
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
    _0$address@0@01
    (compute_address<Address> (as _9$place<Place>  Place) _9$address@105@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
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
    _3$address@79@01
    (compute_address<Address> (as _9$place<Place>  Place) _9$address@105@01))
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
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _17$place<Place>  Place)) _17$address@53@01)
  (compute_address<Address> (as _9$place<Place>  Place) _9$address@105@01))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01)
  (compute_address<Address> (as _9$place<Place>  Place) _9$address@105@01))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; exhale acc(MemoryBlock(_9$address, Size$I64$()), write)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _9$place<Place>  Place) _9$address@105@01)
  _9$address@105@01)))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(MemoryBlockStackDrop(_9$address, Size$I64$()), write)
; [eval] Size$I64$()
; [exec]
; exhale acc(MemoryBlock(_3$address, Size$Bool$()), write)
; [eval] Size$Bool$()
; [exec]
; exhale acc(MemoryBlockStackDrop(_3$address, Size$Bool$()), write)
; [eval] Size$Bool$()
; [exec]
; label loop__label_bb1__label_bb1
; [exec]
; loop__label_bb1__label_bb1$marker := true
; [exec]
; inhale basic_block_marker$loop__label_bb1__label_bb1$marker()
(declare-const $t@465@01 $Snap)
(assert (= $t@465@01 $Snap.unit))
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
(declare-const $t@466@01 $Snap)
(assert (= $t@466@01 $Snap.unit))
; [eval] basic_block_marker$loop__label_bb1__label_bb2$marker()
(assert (as basic_block_marker$loop__label_bb1__label_bb2$marker<Bool>  Bool))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlock(_3$address, Size$Bool$()), write)
; [eval] Size$Bool$()
(declare-const $t@467@01 $Snap)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01)
    _3$address@79@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
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
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _17$place<Place>  Place)) _17$address@53@01)
    _3$address@79@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (and
  (= _0$address@0@01 _3$address@79@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
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
    (compute_address<Address> (as _17$place<Place>  Place) _17$address@53@01)
    _3$address@79@01)
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
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
    (compute_address<Address> (as _21$place<Place>  Place) _21$address@71@01)
    _3$address@79@01)
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlockStackDrop(_3$address, Size$Bool$()), write)
; [eval] Size$Bool$()
(declare-const $t@468@01 $Snap)
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlock(_4$address, Size$I64$()), write)
; [eval] Size$I64$()
(declare-const $t@469@01 $Snap)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (and
  (= _3$address@79@01 _4$address@86@01)
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
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01)
  _4$address@86@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _17$place<Place>  Place)) _17$address@53@01)
  _4$address@86@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (and
  (= _0$address@0@01 _4$address@86@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
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
    (compute_address<Address> (as _17$place<Place>  Place) _17$address@53@01)
    _4$address@86@01)
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
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
    (compute_address<Address> (as _21$place<Place>  Place) _21$address@71@01)
    _4$address@86@01)
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlockStackDrop(_4$address, Size$I64$()), write)
; [eval] Size$I64$()
(declare-const $t@470@01 $Snap)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (and
  (= _3$address@79@01 _4$address@86@01)
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; copy_place$I64(_4$place(), _4$address, _1$place(), _1$address, _1$snapshot$2,
;   write)
; [eval] _4$place()
; [eval] _1$place()
; [eval] none < source_permission_amount
; [eval] compute_address(target_place, target_root_address)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _21$place<Place>  Place) _21$address@71@01)
    (compute_address<Address> (as _4$place<Place>  Place) _4$address@86@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
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
    (compute_address<Address> (as _17$place<Place>  Place) _17$address@53@01)
    (compute_address<Address> (as _4$place<Place>  Place) _4$address@86@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
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
    _0$address@0@01
    (compute_address<Address> (as _4$place<Place>  Place) _4$address@86@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
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
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _17$place<Place>  Place)) _17$address@53@01)
  (compute_address<Address> (as _4$place<Place>  Place) _4$address@86@01))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01)
  (compute_address<Address> (as _4$place<Place>  Place) _4$address@86@01))))
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
    _3$address@79@01
    (compute_address<Address> (as _4$place<Place>  Place) _4$address@86@01))
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
  _4$address@86@01
  (compute_address<Address> (as _4$place<Place>  Place) _4$address@86@01))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _21$snapshot$1@73@01)
  _1$snapshot$2@7@01)))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(declare-const $t@471@01 $Snap)
(assert (= $t@471@01 ($Snap.combine ($Snap.first $t@471@01) ($Snap.second $t@471@01))))
(assert (=
  ($Snap.second $t@471@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@471@01))
    ($Snap.second ($Snap.second $t@471@01)))))
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (and
  (= (as _1$place<Place>  Place) (as _4$place<Place>  Place))
  (= _1$address@4@01 _4$address@86@01))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(assert (= ($Snap.second ($Snap.second $t@471@01)) $Snap.unit))
; [eval] valid$Snap$I64(source_snapshot)
(assert (valid$Snap$I64<Bool> _1$snapshot$2@7@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _4$snapshot$2 == _1$snapshot$2
(declare-const $t@472@01 $Snap)
(assert (= $t@472@01 $Snap.unit))
; [eval] _4$snapshot$2 == _1$snapshot$2
(assert (= _4$snapshot$2@89@01 _1$snapshot$2@7@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; tmp$9 := assign$Bool$BinaryOp$GtCmp$Move$I64$Constant$I64$$$$(_3$place(), _3$address,
;   _4$place(), _4$address, _4$snapshot$2, constructor$Snap$I64$(0))
; [eval] _3$place()
; [eval] _4$place()
; [eval] constructor$Snap$I64$(0)
; [eval] compute_address(target_place, target_address)
; [eval] Size$Bool$()
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _21$place<Place>  Place) _21$address@71@01)
    (compute_address<Address> (as _3$place<Place>  Place) _3$address@79@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
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
    (compute_address<Address> (as _17$place<Place>  Place) _17$address@53@01)
    (compute_address<Address> (as _3$place<Place>  Place) _3$address@79@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
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
    _0$address@0@01
    (compute_address<Address> (as _3$place<Place>  Place) _3$address@79@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
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
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _17$place<Place>  Place)) _17$address@53@01)
    (compute_address<Address> (as _3$place<Place>  Place) _3$address@79@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
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
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01)
    (compute_address<Address> (as _3$place<Place>  Place) _3$address@79@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  _3$address@79@01
  (compute_address<Address> (as _3$place<Place>  Place) _3$address@79@01))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= _1$snapshot$2@7@01 _4$snapshot$2@89@01)))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [eval] valid$Snap$I64(operand1_value)
(set-option :timeout 0)
(push) ; 11
(assert (not (valid$Snap$I64<Bool> _4$snapshot$2@89@01)))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(assert (valid$Snap$I64<Bool> _4$snapshot$2@89@01))
; [eval] valid$Snap$I64(operand2_value)
(declare-const result_value@473@01 Snap$Bool)
(declare-const $t@474@01 $Snap)
(assert (= $t@474@01 ($Snap.combine ($Snap.first $t@474@01) ($Snap.second $t@474@01))))
(push) ; 11
(set-option :timeout 10)
(assert (not (and
  (=
    (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _17$place<Place>  Place))
    (as _3$place<Place>  Place))
  (= _17$address@53@01 _3$address@79@01)
  (=
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> result_value@414@01)
    result_value@473@01))))
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
    (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _21$place<Place>  Place))
    (as _3$place<Place>  Place))
  (= _21$address@71@01 _3$address@79@01)
  (=
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> result_value@452@01)
    result_value@473@01))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second $t@474@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@474@01))
    ($Snap.second ($Snap.second $t@474@01)))))
; [eval] compute_address(operand1_place, operand1_root_address)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _21$place<Place>  Place) _21$address@71@01)
    (compute_address<Address> (as _4$place<Place>  Place) _4$address@86@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
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
    (compute_address<Address> (as _17$place<Place>  Place) _17$address@53@01)
    (compute_address<Address> (as _4$place<Place>  Place) _4$address@86@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
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
    _0$address@0@01
    (compute_address<Address> (as _4$place<Place>  Place) _4$address@86@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
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
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _17$place<Place>  Place)) _17$address@53@01)
  (compute_address<Address> (as _4$place<Place>  Place) _4$address@86@01))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01)
  (compute_address<Address> (as _4$place<Place>  Place) _4$address@86@01))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second $t@474@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@474@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@474@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@474@01))) $Snap.unit))
; [eval] result_value == constructor$Snap$Bool$GtCmp_I64(operand1_value, operand2_value)
; [eval] constructor$Snap$Bool$GtCmp_I64(operand1_value, operand2_value)
(assert (=
  result_value@473@01
  (constructor$Snap$Bool$GtCmp_I64<Snap$Bool> _4$snapshot$2@89@01 (constructor$Snap$I64$<Snap$I64> 0))))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@474@01))) $Snap.unit))
; [eval] valid$Snap$Bool(result_value)
(assert (valid$Snap$Bool<Bool> result_value@473@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _3$snapshot$2 == tmp$9
(declare-const $t@475@01 $Snap)
(assert (= $t@475@01 $Snap.unit))
; [eval] _3$snapshot$2 == tmp$9
(assert (= _3$snapshot$2@82@01 result_value@473@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; exhale acc(MemoryBlock(_4$address, Size$I64$()), write)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _4$place<Place>  Place) _4$address@86@01)
  _4$address@86@01)))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(MemoryBlockStackDrop(_4$address, Size$I64$()), write)
; [eval] Size$I64$()
; [eval] !destructor$Snap$Bool$$value(_3$snapshot$2)
; [eval] destructor$Snap$Bool$$value(_3$snapshot$2)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (destructor$Snap$Bool$$value<Bool> _3$snapshot$2@82@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (not (destructor$Snap$Bool$$value<Bool> _3$snapshot$2@82@01))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [then-branch: 55 | !(destructor$Snap$Bool$$value[Bool](_3$snapshot$2@82@01)) | live]
; [else-branch: 55 | destructor$Snap$Bool$$value[Bool](_3$snapshot$2@82@01) | live]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 55 | !(destructor$Snap$Bool$$value[Bool](_3$snapshot$2@82@01))]
(assert (not (destructor$Snap$Bool$$value<Bool> _3$snapshot$2@82@01)))
; [exec]
; label label__from__loop__label_bb1__label_bb2__to__label_3_custom
; [exec]
; inhale _1$snapshot$4 == _1$snapshot$2
(declare-const $t@476@01 $Snap)
(assert (= $t@476@01 $Snap.unit))
; [eval] _1$snapshot$4 == _1$snapshot$2
(assert (= _1$snapshot$4@9@01 _1$snapshot$2@7@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale _10$snapshot$4 == _10$snapshot$1
(declare-const $t@477@01 $Snap)
(assert (= $t@477@01 $Snap.unit))
; [eval] _10$snapshot$4 == _10$snapshot$1
(assert (= _10$snapshot$4@16@01 _10$snapshot$1@13@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _11$snapshot$6 == _11$snapshot$3
(declare-const $t@478@01 $Snap)
(assert (= $t@478@01 $Snap.unit))
; [eval] _11$snapshot$6 == _11$snapshot$3
(assert (= _11$snapshot$6@25@01 _11$snapshot$3@22@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _12$snapshot$6 == _12$snapshot$3
(declare-const $t@479@01 $Snap)
(assert (= $t@479@01 $Snap.unit))
; [eval] _12$snapshot$6 == _12$snapshot$3
(assert (= _12$snapshot$6@34@01 _12$snapshot$3@31@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _13$snapshot$5 == _13$snapshot$2
(declare-const $t@480@01 $Snap)
(assert (= $t@480@01 $Snap.unit))
; [eval] _13$snapshot$5 == _13$snapshot$2
(assert (= _13$snapshot$5@42@01 _13$snapshot$2@39@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _14$snapshot$6 == _14$snapshot$3
(declare-const $t@481@01 $Snap)
(assert (= $t@481@01 $Snap.unit))
; [eval] _14$snapshot$6 == _14$snapshot$3
(assert (= _14$snapshot$6@51@01 _14$snapshot$3@48@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _17$snapshot$5 == _17$snapshot$2
(declare-const $t@482@01 $Snap)
(assert (= $t@482@01 $Snap.unit))
; [eval] _17$snapshot$5 == _17$snapshot$2
(assert (= _17$snapshot$5@59@01 _17$snapshot$2@56@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _2$snapshot$6 == _2$snapshot$4
(declare-const $t@483@01 $Snap)
(assert (= $t@483@01 $Snap.unit))
; [eval] _2$snapshot$6 == _2$snapshot$4
(assert (= _2$snapshot$6@69@01 _2$snapshot$4@67@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _21$snapshot$4 == _21$snapshot$1
(declare-const $t@484@01 $Snap)
(assert (= $t@484@01 $Snap.unit))
; [eval] _21$snapshot$4 == _21$snapshot$1
(assert (= _21$snapshot$4@76@01 _21$snapshot$1@73@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _3$snapshot$4 == _3$snapshot$2
(declare-const $t@485@01 $Snap)
(assert (= $t@485@01 $Snap.unit))
; [eval] _3$snapshot$4 == _3$snapshot$2
(assert (= _3$snapshot$4@84@01 _3$snapshot$2@82@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _4$snapshot$4 == _4$snapshot$2
(declare-const $t@486@01 $Snap)
(assert (= $t@486@01 $Snap.unit))
; [eval] _4$snapshot$4 == _4$snapshot$2
(assert (= _4$snapshot$4@91@01 _4$snapshot$2@89@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _5$snapshot$2 == _5$snapshot$1
(declare-const $t@487@01 $Snap)
(assert (= $t@487@01 $Snap.unit))
; [eval] _5$snapshot$2 == _5$snapshot$1
(assert (= _5$snapshot$2@96@01 _5$snapshot$1@95@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _6$snapshot$4 == _6$snapshot$1
(declare-const $t@488@01 $Snap)
(assert (= $t@488@01 $Snap.unit))
; [eval] _6$snapshot$4 == _6$snapshot$1
(assert (= _6$snapshot$4@103@01 _6$snapshot$1@100@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _9$snapshot$7 == _9$snapshot$4
(declare-const $t@489@01 $Snap)
(assert (= $t@489@01 $Snap.unit))
; [eval] _9$snapshot$7 == _9$snapshot$4
(assert (= _9$snapshot$7@113@01 _9$snapshot$4@110@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale loop_variant$1$snapshot$3 == loop_variant$1$snapshot$2
(declare-const $t@490@01 $Snap)
(assert (= $t@490@01 $Snap.unit))
; [eval] loop_variant$1$snapshot$3 == loop_variant$1$snapshot$2
(assert (= loop_variant$1$snapshot$3@153@01 loop_variant$1$snapshot$2@152@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale loop_variant$2$snapshot$6 == loop_variant$2$snapshot$3
(declare-const $t@491@01 $Snap)
(assert (= $t@491@01 $Snap.unit))
; [eval] loop_variant$2$snapshot$6 == loop_variant$2$snapshot$3
(assert (= loop_variant$2$snapshot$6@161@01 loop_variant$2$snapshot$3@158@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; label label_3_custom
; [exec]
; label_3_custom$marker := true
; [exec]
; inhale basic_block_marker$label_3_custom$marker()
(declare-const $t@492@01 $Snap)
(assert (= $t@492@01 $Snap.unit))
; [eval] basic_block_marker$label_3_custom$marker()
(assert (as basic_block_marker$label_3_custom$marker<Bool>  Bool))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; label label_bb16
; [exec]
; label_bb16$marker := true
; [exec]
; inhale basic_block_marker$label_bb16$marker()
(declare-const $t@493@01 $Snap)
(assert (= $t@493@01 $Snap.unit))
; [eval] basic_block_marker$label_bb16$marker()
(assert (as basic_block_marker$label_bb16$marker<Bool>  Bool))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlock(_23$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
(declare-const $t@494@01 $Snap)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01)
    _23$address@78@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
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
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _17$place<Place>  Place)) _17$address@53@01)
    _23$address@78@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= _0$address@0@01 _23$address@78@01)))
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
    (compute_address<Address> (as _17$place<Place>  Place) _17$address@53@01)
    _23$address@78@01)
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
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
    (compute_address<Address> (as _21$place<Place>  Place) _21$address@71@01)
    _23$address@78@01)
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlockStackDrop(_23$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
(declare-const $t@495@01 $Snap)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (and
  (= _3$address@79@01 _23$address@78@01)
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; write_place_constant$Tuple$$$(_0$place(), _0$address, constructor$Snap$Tuple$$$$())
; [eval] _0$place()
; [eval] constructor$Snap$Tuple$$$$()
; [eval] compute_address(target_place, target_root_address)
; [eval] Size$Tuple$$$$()
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _21$place<Place>  Place) _21$address@71@01)
    (compute_address<Address> (as _0$place<Place>  Place) _0$address@0@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
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
    (compute_address<Address> (as _17$place<Place>  Place) _17$address@53@01)
    (compute_address<Address> (as _0$place<Place>  Place) _0$address@0@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  _0$address@0@01
  (compute_address<Address> (as _0$place<Place>  Place) _0$address@0@01))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [eval] valid$Snap$Tuple$$$(source_snapshot)
(declare-const $t@496@01 $Snap)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (and
  (= (as _2$place<Place>  Place) (as _0$place<Place>  Place))
  (= _2$address@62@01 _0$address@0@01))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _0$snapshot$1 == constructor$Snap$Tuple$$$$()
(declare-const $t@497@01 $Snap)
(assert (= $t@497@01 $Snap.unit))
; [eval] _0$snapshot$1 == constructor$Snap$Tuple$$$$()
; [eval] constructor$Snap$Tuple$$$$()
(assert (=
  _0$snapshot$1@2@01
  (as constructor$Snap$Tuple$$$$<Snap$Tuple$$$>  Snap$Tuple$$$)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; exhale acc(MemoryBlock(_23$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
; [exec]
; exhale acc(MemoryBlockStackDrop(_23$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
; [exec]
; into_memory_block$Bool(_3$place(), _3$address, _3$snapshot$4)
; [eval] _3$place()
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= result_value@473@01 _3$snapshot$4@84@01)))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [eval] compute_address(place, root_address)
; [eval] Size$Bool$()
(declare-const $t@498@01 $Snap)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _21$place<Place>  Place) _21$address@71@01)
    (compute_address<Address> (as _3$place<Place>  Place) _3$address@79@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
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
    (compute_address<Address> (as _17$place<Place>  Place) _17$address@53@01)
    (compute_address<Address> (as _3$place<Place>  Place) _3$address@79@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
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
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _17$place<Place>  Place)) _17$address@53@01)
    (compute_address<Address> (as _3$place<Place>  Place) _3$address@79@01))
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
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01)
    (compute_address<Address> (as _3$place<Place>  Place) _3$address@79@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
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
; [exec]
; exhale acc(MemoryBlock(_3$address, Size$Bool$()), write)
; [eval] Size$Bool$()
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _3$place<Place>  Place) _3$address@79@01)
  _3$address@79@01)))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(MemoryBlockStackDrop(_3$address, Size$Bool$()), write)
; [eval] Size$Bool$()
; [exec]
; label return_label
; [exec]
; return_label$marker := true
; [exec]
; inhale basic_block_marker$return_label$marker()
(declare-const $t@499@01 $Snap)
(assert (= $t@499@01 $Snap.unit))
; [eval] basic_block_marker$return_label$marker()
(assert (as basic_block_marker$return_label$marker<Bool>  Bool))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; into_memory_block$I64(_1$place(), _1$address, _1$snapshot$4)
; [eval] _1$place()
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= _1$snapshot$2@7@01 _1$snapshot$4@9@01)))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [eval] compute_address(place, root_address)
; [eval] Size$I64$()
(declare-const $t@500@01 $Snap)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01)
  (compute_address<Address> (as _1$place<Place>  Place) _1$address@4@01))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _17$place<Place>  Place)) _17$address@53@01)
  (compute_address<Address> (as _1$place<Place>  Place) _1$address@4@01))))
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
    (compute_address<Address> (as _17$place<Place>  Place) _17$address@53@01)
    (compute_address<Address> (as _1$place<Place>  Place) _1$address@4@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
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
    (compute_address<Address> (as _21$place<Place>  Place) _21$address@71@01)
    (compute_address<Address> (as _1$place<Place>  Place) _1$address@4@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 12
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
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _1$place<Place>  Place) _1$address@4@01)
  _1$address@4@01)))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(OwnedNonAliased$Tuple$$$(_0$place(), _0$address, _0$snapshot$1), write) &&
;   valid$Snap$Tuple$$$(_0$snapshot$1)
; [eval] _0$place()
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  (as constructor$Snap$Tuple$$$$<Snap$Tuple$$$>  Snap$Tuple$$$)
  _0$snapshot$1@2@01)))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [eval] valid$Snap$Tuple$$$(_0$snapshot$1)
(set-option :timeout 0)
(push) ; 12
(assert (not (valid$Snap$Tuple$$$<Bool> _0$snapshot$1@2@01)))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(assert (valid$Snap$Tuple$$$<Bool> _0$snapshot$1@2@01))
; [exec]
; lft_tok_sep_return$2(lft_1$snapshot$1, bw2$snapshot$0, bw3$snapshot$0, lifetime_token_perm_amount$0$snapshot$0 /
;   16)
; [eval] lifetime_token_perm_amount$0$snapshot$0 / 16
; [eval] none < rd_perm
(push) ; 12
(assert (not (or
  (= (/ lifetime_token_perm_amount$0$snapshot$0@141@01 (to_real 16)) $Perm.No)
  (< $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@141@01 (to_real 16))))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(push) ; 12
(set-option :timeout 10)
(assert (not (< $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@141@01 (to_real 16)))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [eval] lft == intersect(Set(lft_1, lft_2))
; [eval] intersect(Set(lft_1, lft_2))
; [eval] Set(lft_1, lft_2)
(declare-const $t@501@01 $Snap)
(assert (= $t@501@01 ($Snap.combine ($Snap.first $t@501@01) ($Snap.second $t@501@01))))
(set-option :timeout 0)
(push) ; 12
(assert (not (or
  (= (/ lifetime_token_perm_amount$0$snapshot$0@141@01 (to_real 16)) $Perm.No)
  (< $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@141@01 (to_real 16))))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(declare-const $t@502@01 $Snap)
(assert (and
  (=>
    (<
      $Perm.No
      (-
        lifetime_token_perm_amount$0$snapshot$0@141@01
        ($Perm.min
          lifetime_token_perm_amount$0$snapshot$0@141@01
          (/ lifetime_token_perm_amount$0$snapshot$0@141@01 (to_real 16)))))
    (= $t@502@01 $t@180@01))
  (=>
    (< $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@141@01 (to_real 16)))
    (= $t@502@01 ($Snap.first $t@501@01)))))
(assert (<=
  $Perm.No
  (+
    (-
      lifetime_token_perm_amount$0$snapshot$0@141@01
      ($Perm.min
        lifetime_token_perm_amount$0$snapshot$0@141@01
        (/ lifetime_token_perm_amount$0$snapshot$0@141@01 (to_real 16))))
    (/ lifetime_token_perm_amount$0$snapshot$0@141@01 (to_real 16)))))
(push) ; 12
(assert (not (or
  (= (/ lifetime_token_perm_amount$0$snapshot$0@141@01 (to_real 16)) $Perm.No)
  (< $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@141@01 (to_real 16))))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(declare-const $t@503@01 $Snap)
(assert (and
  (=>
    (<
      $Perm.No
      (-
        lifetime_token_perm_amount$0$snapshot$0@141@01
        ($Perm.min
          lifetime_token_perm_amount$0$snapshot$0@141@01
          (/ lifetime_token_perm_amount$0$snapshot$0@141@01 (to_real 16)))))
    (= $t@503@01 $t@181@01))
  (=>
    (< $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@141@01 (to_real 16)))
    (= $t@503@01 ($Snap.second $t@501@01)))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; exhale acc(LifetimeToken(bw2$snapshot$0), lifetime_token_perm_amount$0$snapshot$0)
(set-option :timeout 0)
(push) ; 12
(assert (not (or
  (= lifetime_token_perm_amount$0$snapshot$0@141@01 $Perm.No)
  (< $Perm.No lifetime_token_perm_amount$0$snapshot$0@141@01))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  (-
    (+
      (-
        lifetime_token_perm_amount$0$snapshot$0@141@01
        ($Perm.min
          lifetime_token_perm_amount$0$snapshot$0@141@01
          (/ lifetime_token_perm_amount$0$snapshot$0@141@01 (to_real 16))))
      (/ lifetime_token_perm_amount$0$snapshot$0@141@01 (to_real 16)))
    ($Perm.min
      (+
        (-
          lifetime_token_perm_amount$0$snapshot$0@141@01
          ($Perm.min
            lifetime_token_perm_amount$0$snapshot$0@141@01
            (/ lifetime_token_perm_amount$0$snapshot$0@141@01 (to_real 16))))
        (/ lifetime_token_perm_amount$0$snapshot$0@141@01 (to_real 16)))
      lifetime_token_perm_amount$0$snapshot$0@141@01))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(assert (not (or
  (=
    (-
      lifetime_token_perm_amount$0$snapshot$0@141@01
      ($Perm.min
        (+
          (-
            lifetime_token_perm_amount$0$snapshot$0@141@01
            ($Perm.min
              lifetime_token_perm_amount$0$snapshot$0@141@01
              (/ lifetime_token_perm_amount$0$snapshot$0@141@01 (to_real 16))))
          (/ lifetime_token_perm_amount$0$snapshot$0@141@01 (to_real 16)))
        lifetime_token_perm_amount$0$snapshot$0@141@01))
    $Perm.No)
  (<
    (-
      lifetime_token_perm_amount$0$snapshot$0@141@01
      ($Perm.min
        (+
          (-
            lifetime_token_perm_amount$0$snapshot$0@141@01
            ($Perm.min
              lifetime_token_perm_amount$0$snapshot$0@141@01
              (/ lifetime_token_perm_amount$0$snapshot$0@141@01 (to_real 16))))
          (/ lifetime_token_perm_amount$0$snapshot$0@141@01 (to_real 16)))
        lifetime_token_perm_amount$0$snapshot$0@141@01))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(push) ; 12
(set-option :timeout 10)
(assert (not (< $Perm.No lifetime_token_perm_amount$0$snapshot$0@141@01)))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(LifetimeToken(bw3$snapshot$0), lifetime_token_perm_amount$0$snapshot$0)
(set-option :timeout 0)
(push) ; 12
(assert (not (or
  (= lifetime_token_perm_amount$0$snapshot$0@141@01 $Perm.No)
  (< $Perm.No lifetime_token_perm_amount$0$snapshot$0@141@01))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  (-
    (+
      (-
        lifetime_token_perm_amount$0$snapshot$0@141@01
        ($Perm.min
          lifetime_token_perm_amount$0$snapshot$0@141@01
          (/ lifetime_token_perm_amount$0$snapshot$0@141@01 (to_real 16))))
      (/ lifetime_token_perm_amount$0$snapshot$0@141@01 (to_real 16)))
    ($Perm.min
      (+
        (-
          lifetime_token_perm_amount$0$snapshot$0@141@01
          ($Perm.min
            lifetime_token_perm_amount$0$snapshot$0@141@01
            (/ lifetime_token_perm_amount$0$snapshot$0@141@01 (to_real 16))))
        (/ lifetime_token_perm_amount$0$snapshot$0@141@01 (to_real 16)))
      lifetime_token_perm_amount$0$snapshot$0@141@01))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(assert (not (or
  (=
    (-
      lifetime_token_perm_amount$0$snapshot$0@141@01
      ($Perm.min
        (+
          (-
            lifetime_token_perm_amount$0$snapshot$0@141@01
            ($Perm.min
              lifetime_token_perm_amount$0$snapshot$0@141@01
              (/ lifetime_token_perm_amount$0$snapshot$0@141@01 (to_real 16))))
          (/ lifetime_token_perm_amount$0$snapshot$0@141@01 (to_real 16)))
        lifetime_token_perm_amount$0$snapshot$0@141@01))
    $Perm.No)
  (<
    (-
      lifetime_token_perm_amount$0$snapshot$0@141@01
      ($Perm.min
        (+
          (-
            lifetime_token_perm_amount$0$snapshot$0@141@01
            ($Perm.min
              lifetime_token_perm_amount$0$snapshot$0@141@01
              (/ lifetime_token_perm_amount$0$snapshot$0@141@01 (to_real 16))))
          (/ lifetime_token_perm_amount$0$snapshot$0@141@01 (to_real 16)))
        lifetime_token_perm_amount$0$snapshot$0@141@01))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(push) ; 12
(set-option :timeout 10)
(assert (not (< $Perm.No lifetime_token_perm_amount$0$snapshot$0@141@01)))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [eval] loop__label_bb1__label_bb2$marker && (label_3_custom$marker && label_bb16$marker)
(set-option :timeout 0)
(push) ; 12
; [then-branch: 56 | True | live]
; [else-branch: 56 | False | live]
(push) ; 13
; [then-branch: 56 | True]
(push) ; 14
; [then-branch: 57 | True | live]
; [else-branch: 57 | False | live]
(push) ; 15
; [then-branch: 57 | True]
(pop) ; 15
(push) ; 15
; [else-branch: 57 | False]
(assert false)
(pop) ; 15
(pop) ; 14
; Joined path conditions
; Joined path conditions
(pop) ; 13
(push) ; 13
; [else-branch: 56 | False]
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
; [then-branch: 58 | True | live]
; [else-branch: 58 | False | dead]
(set-option :timeout 0)
(push) ; 12
; [then-branch: 58 | True]
; [exec]
; into_memory_block$Tuple$$$(_2$place(), _2$address, _2$snapshot$6)
; [eval] _2$place()
(push) ; 13
(set-option :timeout 10)
(assert (not (=
  (as constructor$Snap$Tuple$$$$<Snap$Tuple$$$>  Snap$Tuple$$$)
  _2$snapshot$6@69@01)))
(check-sat)
; unsat
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
; [eval] compute_address(place, root_address)
; [eval] Size$Tuple$$$$()
(declare-const $t@504@01 $Snap)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _21$place<Place>  Place) _21$address@71@01)
    (compute_address<Address> (as _2$place<Place>  Place) _2$address@62@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
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
    (compute_address<Address> (as _17$place<Place>  Place) _17$address@53@01)
    (compute_address<Address> (as _2$place<Place>  Place) _2$address@62@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
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
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _17$place<Place>  Place)) _17$address@53@01)
    (compute_address<Address> (as _2$place<Place>  Place) _2$address@62@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
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
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01)
    (compute_address<Address> (as _2$place<Place>  Place) _2$address@62@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; exhale acc(MemoryBlock(_2$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _2$place<Place>  Place) _2$address@62@01)
  _2$address@62@01)))
(check-sat)
; unsat
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
; [eval] loop__label_bb7__label_bb8$marker && (label_5_custom$marker && (label_bb14$marker && (label_bb15$marker && (loop__label_bb1__label_bb1$marker && (loop__label_bb1__label_bb2$marker && (label_3_custom$marker && label_bb16$marker))))))
(set-option :timeout 0)
(push) ; 13
; [then-branch: 59 | True | live]
; [else-branch: 59 | False | live]
(push) ; 14
; [then-branch: 59 | True]
(push) ; 15
; [then-branch: 60 | True | live]
; [else-branch: 60 | False | live]
(push) ; 16
; [then-branch: 60 | True]
(push) ; 17
; [then-branch: 61 | True | live]
; [else-branch: 61 | False | live]
(push) ; 18
; [then-branch: 61 | True]
(push) ; 19
; [then-branch: 62 | True | live]
; [else-branch: 62 | False | live]
(push) ; 20
; [then-branch: 62 | True]
(push) ; 21
; [then-branch: 63 | True | live]
; [else-branch: 63 | False | live]
(push) ; 22
; [then-branch: 63 | True]
(push) ; 23
; [then-branch: 64 | True | live]
; [else-branch: 64 | False | live]
(push) ; 24
; [then-branch: 64 | True]
(push) ; 25
; [then-branch: 65 | True | live]
; [else-branch: 65 | False | live]
(push) ; 26
; [then-branch: 65 | True]
(pop) ; 26
(push) ; 26
; [else-branch: 65 | False]
(assert false)
(pop) ; 26
(pop) ; 25
; Joined path conditions
; Joined path conditions
(pop) ; 24
(push) ; 24
; [else-branch: 64 | False]
(assert false)
(pop) ; 24
(pop) ; 23
; Joined path conditions
; Joined path conditions
(pop) ; 22
(push) ; 22
; [else-branch: 63 | False]
(assert false)
(pop) ; 22
(pop) ; 21
; Joined path conditions
; Joined path conditions
(pop) ; 20
(push) ; 20
; [else-branch: 62 | False]
(assert false)
(pop) ; 20
(pop) ; 19
; Joined path conditions
; Joined path conditions
(pop) ; 18
(push) ; 18
; [else-branch: 61 | False]
(assert false)
(pop) ; 18
(pop) ; 17
; Joined path conditions
; Joined path conditions
(pop) ; 16
(push) ; 16
; [else-branch: 60 | False]
(assert false)
(pop) ; 16
(pop) ; 15
; Joined path conditions
; Joined path conditions
(pop) ; 14
(push) ; 14
; [else-branch: 59 | False]
(assert false)
(pop) ; 14
(pop) ; 13
; Joined path conditions
; Joined path conditions
(push) ; 13
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
; [then-branch: 66 | True | live]
; [else-branch: 66 | False | dead]
(set-option :timeout 0)
(push) ; 13
; [then-branch: 66 | True]
; [exec]
; into_memory_block$Bool(field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(_17$place()),
;   _17$address, destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(_17$snapshot$5))
; [eval] field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(_17$place())
; [eval] _17$place()
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(_17$snapshot$5)
(push) ; 14
(set-option :timeout 10)
(assert (not (and
  (=
    (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _21$place<Place>  Place))
    (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _17$place<Place>  Place)))
  (= _21$address@71@01 _17$address@53@01)
  (=
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> result_value@452@01)
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> _17$snapshot$5@59@01)))))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (=
  (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> result_value@414@01)
  (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> _17$snapshot$5@59@01))))
(check-sat)
; unsat
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
; [eval] compute_address(place, root_address)
; [eval] Size$Bool$()
(declare-const $t@505@01 $Snap)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01)
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _17$place<Place>  Place)) _17$address@53@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _17$place<Place>  Place)) _17$address@53@01)
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _17$place<Place>  Place)) _17$address@53@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _17$place<Place>  Place) _17$address@53@01)
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _17$place<Place>  Place)) _17$address@53@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _21$place<Place>  Place) _21$address@71@01)
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _17$place<Place>  Place)) _17$address@53@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] loop__label_bb7__label_bb8$marker && (label_5_custom$marker && (label_bb14$marker && (label_bb15$marker && (loop__label_bb1__label_bb1$marker && (loop__label_bb1__label_bb2$marker && (label_3_custom$marker && label_bb16$marker))))))
(set-option :timeout 0)
(push) ; 14
; [then-branch: 67 | True | live]
; [else-branch: 67 | False | live]
(push) ; 15
; [then-branch: 67 | True]
(push) ; 16
; [then-branch: 68 | True | live]
; [else-branch: 68 | False | live]
(push) ; 17
; [then-branch: 68 | True]
(push) ; 18
; [then-branch: 69 | True | live]
; [else-branch: 69 | False | live]
(push) ; 19
; [then-branch: 69 | True]
(push) ; 20
; [then-branch: 70 | True | live]
; [else-branch: 70 | False | live]
(push) ; 21
; [then-branch: 70 | True]
(push) ; 22
; [then-branch: 71 | True | live]
; [else-branch: 71 | False | live]
(push) ; 23
; [then-branch: 71 | True]
(push) ; 24
; [then-branch: 72 | True | live]
; [else-branch: 72 | False | live]
(push) ; 25
; [then-branch: 72 | True]
(push) ; 26
; [then-branch: 73 | True | live]
; [else-branch: 73 | False | live]
(push) ; 27
; [then-branch: 73 | True]
(pop) ; 27
(push) ; 27
; [else-branch: 73 | False]
(assert false)
(pop) ; 27
(pop) ; 26
; Joined path conditions
; Joined path conditions
(pop) ; 25
(push) ; 25
; [else-branch: 72 | False]
(assert false)
(pop) ; 25
(pop) ; 24
; Joined path conditions
; Joined path conditions
(pop) ; 23
(push) ; 23
; [else-branch: 71 | False]
(assert false)
(pop) ; 23
(pop) ; 22
; Joined path conditions
; Joined path conditions
(pop) ; 21
(push) ; 21
; [else-branch: 70 | False]
(assert false)
(pop) ; 21
(pop) ; 20
; Joined path conditions
; Joined path conditions
(pop) ; 19
(push) ; 19
; [else-branch: 69 | False]
(assert false)
(pop) ; 19
(pop) ; 18
; Joined path conditions
; Joined path conditions
(pop) ; 17
(push) ; 17
; [else-branch: 68 | False]
(assert false)
(pop) ; 17
(pop) ; 16
; Joined path conditions
; Joined path conditions
(pop) ; 15
(push) ; 15
; [else-branch: 67 | False]
(assert false)
(pop) ; 15
(pop) ; 14
; Joined path conditions
; Joined path conditions
(push) ; 14
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
; [then-branch: 74 | True | live]
; [else-branch: 74 | False | dead]
(set-option :timeout 0)
(push) ; 14
; [then-branch: 74 | True]
; [exec]
; memory_block_join$Tuple$$I64$Bool$$I64$Bool$(_17$address, write)
; [eval] none < permission_amount
; [eval] PaddingSize$Tuple$$I64$Bool$$I64$Bool$$()
(push) ; 15
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _17$place<Place>  Place)) _17$address@53@01)
    _17$address@53@01)
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01)
    _17$address@53@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _17$place<Place>  Place)) _17$address@53@01)
    _17$address@53@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _17$place<Place>  Place) _17$address@53@01)
  _17$address@53@01)))
(check-sat)
; unsat
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
; [eval] field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _17$place<Place>  Place)) _17$address@53@01)
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _17$address@53@01))
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
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01)
  (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _17$address@53@01))))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _17$place<Place>  Place)) _17$address@53@01)
  (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _17$address@53@01))))
(check-sat)
; unsat
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
; [eval] field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address)
; [eval] Size$Bool$()
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _17$place<Place>  Place)) _17$address@53@01)
  (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _17$address@53@01))))
(check-sat)
; unsat
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(declare-const $t@506@01 $Snap)
(assert (= $t@506@01 ($Snap.combine ($Snap.first $t@506@01) ($Snap.second $t@506@01))))
; [eval] Size$Tuple$$I64$Bool$$I64$Bool$$()
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _21$place<Place>  Place) _21$address@71@01)
    _17$address@53@01)
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01)
    _17$address@53@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(assert (= ($Snap.second $t@506@01) $Snap.unit))
; [eval] (forall snapshot: Snap$Tuple$$I64$Bool$$I64$Bool$ :: { to_bytes$Tuple$$I64$Bool$$I64$Bool$(snapshot) } old(MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address), Size$I64$()) == to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot))) && old(MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address), Size$Bool$()) == to_bytes$Bool(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot))) ==> MemoryBlock$bytes(address, Size$Tuple$$I64$Bool$$I64$Bool$$()) == to_bytes$Tuple$$I64$Bool$$I64$Bool$(snapshot))
(declare-const snapshot@507@01 Snap$Tuple$$I64$Bool$$I64$Bool$)
(set-option :timeout 0)
(push) ; 15
; [eval] old(MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address), Size$I64$()) == to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot))) && old(MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address), Size$Bool$()) == to_bytes$Bool(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot))) ==> MemoryBlock$bytes(address, Size$Tuple$$I64$Bool$$I64$Bool$$()) == to_bytes$Tuple$$I64$Bool$$I64$Bool$(snapshot)
; [eval] old(MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address), Size$I64$()) == to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot))) && old(MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address), Size$Bool$()) == to_bytes$Bool(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot)))
; [eval] old(MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address), Size$I64$()) == to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot)))
; [eval] MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address), Size$I64$()) == to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot))
; [eval] MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address), Size$I64$())
; [eval] field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address)
; [eval] Size$I64$()
(push) ; 16
(declare-const $k@508@01 $Perm)
(assert ($Perm.isReadVar $k@508@01))
(push) ; 17
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _17$place<Place>  Place)) _17$address@53@01)
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _17$address@53@01))
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01)
  (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _17$address@53@01))))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _17$place<Place>  Place)) _17$address@53@01)
  (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _17$address@53@01))))
(check-sat)
; unsat
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(assert (< $k@508@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@508@01)))
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (< $Perm.No $k@508@01)))
(check-sat)
; unsat
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@421@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _17$address@53@01) (as Size$I64$<Snap$Usize>  Snap$Usize)))
(pop) ; 16
; Joined path conditions
(assert ($Perm.isReadVar $k@508@01))
(assert (and
  (< $k@508@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@508@01))
  (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@421@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _17$address@53@01) (as Size$I64$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot)
(set-option :timeout 0)
(push) ; 16
; [then-branch: 75 | MemoryBlock$bytes(First:(Second:($t@421@01)), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](_17$address@53@01), Size$I64$[Snap$Usize]) == to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@507@01)) | live]
; [else-branch: 75 | MemoryBlock$bytes(First:(Second:($t@421@01)), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](_17$address@53@01), Size$I64$[Snap$Usize]) != to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@507@01)) | live]
(push) ; 17
; [then-branch: 75 | MemoryBlock$bytes(First:(Second:($t@421@01)), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](_17$address@53@01), Size$I64$[Snap$Usize]) == to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@507@01))]
(assert (=
  (MemoryBlock$bytes ($Snap.first ($Snap.second $t@421@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _17$address@53@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
  (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@507@01))))
; [eval] old(MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address), Size$Bool$()) == to_bytes$Bool(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot)))
; [eval] MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address), Size$Bool$()) == to_bytes$Bool(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot))
; [eval] MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address), Size$Bool$())
; [eval] field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address)
; [eval] Size$Bool$()
(push) ; 18
(declare-const $k@509@01 $Perm)
(assert ($Perm.isReadVar $k@509@01))
(push) ; 19
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _17$place<Place>  Place)) _17$address@53@01)
  (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _17$address@53@01))))
(check-sat)
; unsat
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(assert (< $k@509@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@509@01)))
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (< $Perm.No $k@509@01)))
(check-sat)
; unsat
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition $t@505@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _17$address@53@01) (as Size$Bool$<Snap$Usize>  Snap$Usize)))
(pop) ; 18
; Joined path conditions
(assert ($Perm.isReadVar $k@509@01))
(assert (and
  (< $k@509@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@509@01))
  (MemoryBlock$bytes%precondition $t@505@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _17$address@53@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$Bool(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot)
(pop) ; 17
(set-option :timeout 0)
(push) ; 17
; [else-branch: 75 | MemoryBlock$bytes(First:(Second:($t@421@01)), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](_17$address@53@01), Size$I64$[Snap$Usize]) != to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@507@01))]
(assert (not
  (=
    (MemoryBlock$bytes ($Snap.first ($Snap.second $t@421@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _17$address@53@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
    (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@507@01)))))
(pop) ; 17
(pop) ; 16
; Joined path conditions
(assert ($Perm.isReadVar $k@509@01))
(assert (=>
  (=
    (MemoryBlock$bytes ($Snap.first ($Snap.second $t@421@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _17$address@53@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
    (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@507@01)))
  (and
    (=
      (MemoryBlock$bytes ($Snap.first ($Snap.second $t@421@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _17$address@53@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
      (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@507@01)))
    (< $k@509@01 $Perm.Write)
    (<= $Perm.No (- $Perm.Write $k@509@01))
    (MemoryBlock$bytes%precondition $t@505@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _17$address@53@01) (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
; Joined path conditions
(assert (or
  (not
    (=
      (MemoryBlock$bytes ($Snap.first ($Snap.second $t@421@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _17$address@53@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
      (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@507@01))))
  (=
    (MemoryBlock$bytes ($Snap.first ($Snap.second $t@421@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _17$address@53@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
    (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@507@01)))))
(push) ; 16
; [then-branch: 76 | MemoryBlock$bytes($t@505@01, field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Address](_17$address@53@01), Size$Bool$[Snap$Usize]) == to_bytes$Bool[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](snapshot@507@01)) && MemoryBlock$bytes(First:(Second:($t@421@01)), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](_17$address@53@01), Size$I64$[Snap$Usize]) == to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@507@01)) | live]
; [else-branch: 76 | !(MemoryBlock$bytes($t@505@01, field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Address](_17$address@53@01), Size$Bool$[Snap$Usize]) == to_bytes$Bool[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](snapshot@507@01)) && MemoryBlock$bytes(First:(Second:($t@421@01)), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](_17$address@53@01), Size$I64$[Snap$Usize]) == to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@507@01))) | live]
(push) ; 17
; [then-branch: 76 | MemoryBlock$bytes($t@505@01, field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Address](_17$address@53@01), Size$Bool$[Snap$Usize]) == to_bytes$Bool[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](snapshot@507@01)) && MemoryBlock$bytes(First:(Second:($t@421@01)), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](_17$address@53@01), Size$I64$[Snap$Usize]) == to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@507@01))]
(assert (and
  (=
    (MemoryBlock$bytes $t@505@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _17$address@53@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
    (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@507@01)))
  (=
    (MemoryBlock$bytes ($Snap.first ($Snap.second $t@421@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _17$address@53@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
    (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@507@01)))))
; [eval] MemoryBlock$bytes(address, Size$Tuple$$I64$Bool$$I64$Bool$$()) == to_bytes$Tuple$$I64$Bool$$I64$Bool$(snapshot)
; [eval] MemoryBlock$bytes(address, Size$Tuple$$I64$Bool$$I64$Bool$$())
; [eval] Size$Tuple$$I64$Bool$$I64$Bool$$()
(push) ; 18
(declare-const $k@510@01 $Perm)
(assert ($Perm.isReadVar $k@510@01))
(assert (< $k@510@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@510@01)))
(push) ; 19
(set-option :timeout 10)
(assert (not (< $Perm.No $k@510@01)))
(check-sat)
; unsat
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first $t@506@01) _17$address@53@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))
(pop) ; 18
; Joined path conditions
(assert ($Perm.isReadVar $k@510@01))
(assert (and
  (< $k@510@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@510@01))
  (MemoryBlock$bytes%precondition ($Snap.first $t@506@01) _17$address@53@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$Tuple$$I64$Bool$$I64$Bool$(snapshot)
(pop) ; 17
(set-option :timeout 0)
(push) ; 17
; [else-branch: 76 | !(MemoryBlock$bytes($t@505@01, field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Address](_17$address@53@01), Size$Bool$[Snap$Usize]) == to_bytes$Bool[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](snapshot@507@01)) && MemoryBlock$bytes(First:(Second:($t@421@01)), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](_17$address@53@01), Size$I64$[Snap$Usize]) == to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@507@01)))]
(assert (not
  (and
    (=
      (MemoryBlock$bytes $t@505@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _17$address@53@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
      (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@507@01)))
    (=
      (MemoryBlock$bytes ($Snap.first ($Snap.second $t@421@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _17$address@53@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
      (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@507@01))))))
(pop) ; 17
(pop) ; 16
; Joined path conditions
(assert ($Perm.isReadVar $k@510@01))
(assert (=>
  (and
    (=
      (MemoryBlock$bytes $t@505@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _17$address@53@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
      (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@507@01)))
    (=
      (MemoryBlock$bytes ($Snap.first ($Snap.second $t@421@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _17$address@53@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
      (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@507@01))))
  (and
    (=
      (MemoryBlock$bytes $t@505@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _17$address@53@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
      (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@507@01)))
    (=
      (MemoryBlock$bytes ($Snap.first ($Snap.second $t@421@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _17$address@53@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
      (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@507@01)))
    (< $k@510@01 $Perm.Write)
    (<= $Perm.No (- $Perm.Write $k@510@01))
    (MemoryBlock$bytes%precondition ($Snap.first $t@506@01) _17$address@53@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
; Joined path conditions
(assert (or
  (not
    (and
      (=
        (MemoryBlock$bytes $t@505@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _17$address@53@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
        (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@507@01)))
      (=
        (MemoryBlock$bytes ($Snap.first ($Snap.second $t@421@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _17$address@53@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
        (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@507@01)))))
  (and
    (=
      (MemoryBlock$bytes $t@505@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _17$address@53@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
      (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@507@01)))
    (=
      (MemoryBlock$bytes ($Snap.first ($Snap.second $t@421@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _17$address@53@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
      (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@507@01))))))
(pop) ; 15
; Nested auxiliary terms: globals (aux)
(assert ($Perm.isReadVar $k@508@01))
(assert ($Perm.isReadVar $k@509@01))
(assert ($Perm.isReadVar $k@510@01))
(assert (< $k@508@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@508@01)))
(assert (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@421@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _17$address@53@01) (as Size$I64$<Snap$Usize>  Snap$Usize)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((snapshot@507@01 Snap$Tuple$$I64$Bool$$I64$Bool$)) (!
  (and
    (=>
      (=
        (MemoryBlock$bytes ($Snap.first ($Snap.second $t@421@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _17$address@53@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
        (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@507@01)))
      (and
        (=
          (MemoryBlock$bytes ($Snap.first ($Snap.second $t@421@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _17$address@53@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
          (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@507@01)))
        (< $k@509@01 $Perm.Write)
        (<= $Perm.No (- $Perm.Write $k@509@01))
        (MemoryBlock$bytes%precondition $t@505@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _17$address@53@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))))
    (or
      (not
        (=
          (MemoryBlock$bytes ($Snap.first ($Snap.second $t@421@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _17$address@53@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
          (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@507@01))))
      (=
        (MemoryBlock$bytes ($Snap.first ($Snap.second $t@421@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _17$address@53@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
        (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@507@01))))
    (=>
      (and
        (=
          (MemoryBlock$bytes $t@505@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _17$address@53@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
          (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@507@01)))
        (=
          (MemoryBlock$bytes ($Snap.first ($Snap.second $t@421@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _17$address@53@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
          (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@507@01))))
      (and
        (=
          (MemoryBlock$bytes $t@505@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _17$address@53@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
          (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@507@01)))
        (=
          (MemoryBlock$bytes ($Snap.first ($Snap.second $t@421@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _17$address@53@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
          (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@507@01)))
        (< $k@510@01 $Perm.Write)
        (<= $Perm.No (- $Perm.Write $k@510@01))
        (MemoryBlock$bytes%precondition ($Snap.first $t@506@01) _17$address@53@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize))))
    (or
      (not
        (and
          (=
            (MemoryBlock$bytes $t@505@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _17$address@53@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
            (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@507@01)))
          (=
            (MemoryBlock$bytes ($Snap.first ($Snap.second $t@421@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _17$address@53@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
            (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@507@01)))))
      (and
        (=
          (MemoryBlock$bytes $t@505@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _17$address@53@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
          (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@507@01)))
        (=
          (MemoryBlock$bytes ($Snap.first ($Snap.second $t@421@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _17$address@53@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
          (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@507@01))))))
  :pattern ((to_bytes$Tuple$$I64$Bool$$I64$Bool$<Bytes> snapshot@507@01))
  :qid |prog.l1883-aux|)))
(assert (forall ((snapshot@507@01 Snap$Tuple$$I64$Bool$$I64$Bool$)) (!
  (=>
    (and
      (=
        (MemoryBlock$bytes $t@505@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _17$address@53@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
        (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@507@01)))
      (=
        (MemoryBlock$bytes ($Snap.first ($Snap.second $t@421@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _17$address@53@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
        (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@507@01))))
    (=
      (MemoryBlock$bytes ($Snap.first $t@506@01) _17$address@53@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize))
      (to_bytes$Tuple$$I64$Bool$$I64$Bool$<Bytes> snapshot@507@01)))
  :pattern ((to_bytes$Tuple$$I64$Bool$$I64$Bool$<Bytes> snapshot@507@01))
  :qid |prog.l1883|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; exhale acc(MemoryBlock(_17$address, Size$Tuple$$I64$Bool$$I64$Bool$$()), write)
; [eval] Size$Tuple$$I64$Bool$$I64$Bool$$()
; [eval] loop__label_bb1__label_bb2$marker && (label_3_custom$marker && label_bb16$marker)
(set-option :timeout 0)
(push) ; 15
; [then-branch: 77 | True | live]
; [else-branch: 77 | False | live]
(push) ; 16
; [then-branch: 77 | True]
(push) ; 17
; [then-branch: 78 | True | live]
; [else-branch: 78 | False | live]
(push) ; 18
; [then-branch: 78 | True]
(pop) ; 18
(push) ; 18
; [else-branch: 78 | False]
(assert false)
(pop) ; 18
(pop) ; 17
; Joined path conditions
; Joined path conditions
(pop) ; 16
(push) ; 16
; [else-branch: 77 | False]
(assert false)
(pop) ; 16
(pop) ; 15
; Joined path conditions
; Joined path conditions
(push) ; 15
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
; [then-branch: 79 | True | live]
; [else-branch: 79 | False | dead]
(set-option :timeout 0)
(push) ; 15
; [then-branch: 79 | True]
; [exec]
; into_memory_block$Bool(field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(_21$place()),
;   _21$address, destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(_21$snapshot$4))
; [eval] field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(_21$place())
; [eval] _21$place()
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(_21$snapshot$4)
(push) ; 16
(set-option :timeout 10)
(assert (not (=
  (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> result_value@452@01)
  (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> _21$snapshot$4@76@01))))
(check-sat)
; unsat
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
; [eval] compute_address(place, root_address)
; [eval] Size$Bool$()
(declare-const $t@511@01 $Snap)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01)
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _21$place<Place>  Place)) _21$address@71@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _21$place<Place>  Place) _21$address@71@01)
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _21$place<Place>  Place)) _21$address@71@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] loop__label_bb1__label_bb2$marker && (label_3_custom$marker && label_bb16$marker)
(set-option :timeout 0)
(push) ; 16
; [then-branch: 80 | True | live]
; [else-branch: 80 | False | live]
(push) ; 17
; [then-branch: 80 | True]
(push) ; 18
; [then-branch: 81 | True | live]
; [else-branch: 81 | False | live]
(push) ; 19
; [then-branch: 81 | True]
(pop) ; 19
(push) ; 19
; [else-branch: 81 | False]
(assert false)
(pop) ; 19
(pop) ; 18
; Joined path conditions
; Joined path conditions
(pop) ; 17
(push) ; 17
; [else-branch: 80 | False]
(assert false)
(pop) ; 17
(pop) ; 16
; Joined path conditions
; Joined path conditions
(push) ; 16
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
; [then-branch: 82 | True | live]
; [else-branch: 82 | False | dead]
(set-option :timeout 0)
(push) ; 16
; [then-branch: 82 | True]
; [exec]
; memory_block_join$Tuple$$I64$Bool$$I64$Bool$(_21$address, write)
; [eval] none < permission_amount
; [eval] PaddingSize$Tuple$$I64$Bool$$I64$Bool$$()
(push) ; 17
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _21$place<Place>  Place)) _21$address@71@01)
    _21$address@71@01)
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01)
    _21$address@71@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _21$place<Place>  Place) _21$address@71@01)
  _21$address@71@01)))
(check-sat)
; unsat
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
; [eval] field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _21$place<Place>  Place)) _21$address@71@01)
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _21$address@71@01))
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01)
  (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _21$address@71@01))))
(check-sat)
; unsat
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
; [eval] field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address)
; [eval] Size$Bool$()
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _21$place<Place>  Place)) _21$address@71@01)
  (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _21$address@71@01))))
(check-sat)
; unsat
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(declare-const $t@512@01 $Snap)
(assert (= $t@512@01 ($Snap.combine ($Snap.first $t@512@01) ($Snap.second $t@512@01))))
; [eval] Size$Tuple$$I64$Bool$$I64$Bool$$()
(assert (= ($Snap.second $t@512@01) $Snap.unit))
; [eval] (forall snapshot: Snap$Tuple$$I64$Bool$$I64$Bool$ :: { to_bytes$Tuple$$I64$Bool$$I64$Bool$(snapshot) } old(MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address), Size$I64$()) == to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot))) && old(MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address), Size$Bool$()) == to_bytes$Bool(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot))) ==> MemoryBlock$bytes(address, Size$Tuple$$I64$Bool$$I64$Bool$$()) == to_bytes$Tuple$$I64$Bool$$I64$Bool$(snapshot))
(declare-const snapshot@513@01 Snap$Tuple$$I64$Bool$$I64$Bool$)
(set-option :timeout 0)
(push) ; 17
; [eval] old(MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address), Size$I64$()) == to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot))) && old(MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address), Size$Bool$()) == to_bytes$Bool(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot))) ==> MemoryBlock$bytes(address, Size$Tuple$$I64$Bool$$I64$Bool$$()) == to_bytes$Tuple$$I64$Bool$$I64$Bool$(snapshot)
; [eval] old(MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address), Size$I64$()) == to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot))) && old(MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address), Size$Bool$()) == to_bytes$Bool(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot)))
; [eval] old(MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address), Size$I64$()) == to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot)))
; [eval] MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address), Size$I64$()) == to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot))
; [eval] MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address), Size$I64$())
; [eval] field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address)
; [eval] Size$I64$()
(push) ; 18
(declare-const $k@514@01 $Perm)
(assert ($Perm.isReadVar $k@514@01))
(push) ; 19
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _21$place<Place>  Place)) _21$address@71@01)
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _21$address@71@01))
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01)
  (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _21$address@71@01))))
(check-sat)
; unsat
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(assert (< $k@514@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@514@01)))
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (< $Perm.No $k@514@01)))
(check-sat)
; unsat
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@459@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _21$address@71@01) (as Size$I64$<Snap$Usize>  Snap$Usize)))
(pop) ; 18
; Joined path conditions
(assert ($Perm.isReadVar $k@514@01))
(assert (and
  (< $k@514@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@514@01))
  (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@459@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _21$address@71@01) (as Size$I64$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot)
(set-option :timeout 0)
(push) ; 18
; [then-branch: 83 | MemoryBlock$bytes(First:(Second:($t@459@01)), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](_21$address@71@01), Size$I64$[Snap$Usize]) == to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@513@01)) | live]
; [else-branch: 83 | MemoryBlock$bytes(First:(Second:($t@459@01)), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](_21$address@71@01), Size$I64$[Snap$Usize]) != to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@513@01)) | live]
(push) ; 19
; [then-branch: 83 | MemoryBlock$bytes(First:(Second:($t@459@01)), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](_21$address@71@01), Size$I64$[Snap$Usize]) == to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@513@01))]
(assert (=
  (MemoryBlock$bytes ($Snap.first ($Snap.second $t@459@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _21$address@71@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
  (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@513@01))))
; [eval] old(MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address), Size$Bool$()) == to_bytes$Bool(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot)))
; [eval] MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address), Size$Bool$()) == to_bytes$Bool(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot))
; [eval] MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address), Size$Bool$())
; [eval] field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address)
; [eval] Size$Bool$()
(push) ; 20
(declare-const $k@515@01 $Perm)
(assert ($Perm.isReadVar $k@515@01))
(push) ; 21
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _21$place<Place>  Place)) _21$address@71@01)
  (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _21$address@71@01))))
(check-sat)
; unsat
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(assert (< $k@515@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@515@01)))
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (< $Perm.No $k@515@01)))
(check-sat)
; unsat
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition $t@511@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _21$address@71@01) (as Size$Bool$<Snap$Usize>  Snap$Usize)))
(pop) ; 20
; Joined path conditions
(assert ($Perm.isReadVar $k@515@01))
(assert (and
  (< $k@515@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@515@01))
  (MemoryBlock$bytes%precondition $t@511@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _21$address@71@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$Bool(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot)
(pop) ; 19
(set-option :timeout 0)
(push) ; 19
; [else-branch: 83 | MemoryBlock$bytes(First:(Second:($t@459@01)), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](_21$address@71@01), Size$I64$[Snap$Usize]) != to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@513@01))]
(assert (not
  (=
    (MemoryBlock$bytes ($Snap.first ($Snap.second $t@459@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _21$address@71@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
    (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@513@01)))))
(pop) ; 19
(pop) ; 18
; Joined path conditions
(assert ($Perm.isReadVar $k@515@01))
(assert (=>
  (=
    (MemoryBlock$bytes ($Snap.first ($Snap.second $t@459@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _21$address@71@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
    (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@513@01)))
  (and
    (=
      (MemoryBlock$bytes ($Snap.first ($Snap.second $t@459@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _21$address@71@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
      (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@513@01)))
    (< $k@515@01 $Perm.Write)
    (<= $Perm.No (- $Perm.Write $k@515@01))
    (MemoryBlock$bytes%precondition $t@511@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _21$address@71@01) (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
; Joined path conditions
(assert (or
  (not
    (=
      (MemoryBlock$bytes ($Snap.first ($Snap.second $t@459@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _21$address@71@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
      (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@513@01))))
  (=
    (MemoryBlock$bytes ($Snap.first ($Snap.second $t@459@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _21$address@71@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
    (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@513@01)))))
(push) ; 18
; [then-branch: 84 | MemoryBlock$bytes($t@511@01, field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Address](_21$address@71@01), Size$Bool$[Snap$Usize]) == to_bytes$Bool[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](snapshot@513@01)) && MemoryBlock$bytes(First:(Second:($t@459@01)), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](_21$address@71@01), Size$I64$[Snap$Usize]) == to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@513@01)) | live]
; [else-branch: 84 | !(MemoryBlock$bytes($t@511@01, field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Address](_21$address@71@01), Size$Bool$[Snap$Usize]) == to_bytes$Bool[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](snapshot@513@01)) && MemoryBlock$bytes(First:(Second:($t@459@01)), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](_21$address@71@01), Size$I64$[Snap$Usize]) == to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@513@01))) | live]
(push) ; 19
; [then-branch: 84 | MemoryBlock$bytes($t@511@01, field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Address](_21$address@71@01), Size$Bool$[Snap$Usize]) == to_bytes$Bool[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](snapshot@513@01)) && MemoryBlock$bytes(First:(Second:($t@459@01)), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](_21$address@71@01), Size$I64$[Snap$Usize]) == to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@513@01))]
(assert (and
  (=
    (MemoryBlock$bytes $t@511@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _21$address@71@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
    (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@513@01)))
  (=
    (MemoryBlock$bytes ($Snap.first ($Snap.second $t@459@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _21$address@71@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
    (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@513@01)))))
; [eval] MemoryBlock$bytes(address, Size$Tuple$$I64$Bool$$I64$Bool$$()) == to_bytes$Tuple$$I64$Bool$$I64$Bool$(snapshot)
; [eval] MemoryBlock$bytes(address, Size$Tuple$$I64$Bool$$I64$Bool$$())
; [eval] Size$Tuple$$I64$Bool$$I64$Bool$$()
(push) ; 20
(declare-const $k@516@01 $Perm)
(assert ($Perm.isReadVar $k@516@01))
(assert (< $k@516@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@516@01)))
(push) ; 21
(set-option :timeout 10)
(assert (not (< $Perm.No $k@516@01)))
(check-sat)
; unsat
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first $t@512@01) _21$address@71@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))
(pop) ; 20
; Joined path conditions
(assert ($Perm.isReadVar $k@516@01))
(assert (and
  (< $k@516@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@516@01))
  (MemoryBlock$bytes%precondition ($Snap.first $t@512@01) _21$address@71@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$Tuple$$I64$Bool$$I64$Bool$(snapshot)
(pop) ; 19
(set-option :timeout 0)
(push) ; 19
; [else-branch: 84 | !(MemoryBlock$bytes($t@511@01, field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Address](_21$address@71@01), Size$Bool$[Snap$Usize]) == to_bytes$Bool[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](snapshot@513@01)) && MemoryBlock$bytes(First:(Second:($t@459@01)), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](_21$address@71@01), Size$I64$[Snap$Usize]) == to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@513@01)))]
(assert (not
  (and
    (=
      (MemoryBlock$bytes $t@511@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _21$address@71@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
      (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@513@01)))
    (=
      (MemoryBlock$bytes ($Snap.first ($Snap.second $t@459@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _21$address@71@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
      (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@513@01))))))
(pop) ; 19
(pop) ; 18
; Joined path conditions
(assert ($Perm.isReadVar $k@516@01))
(assert (=>
  (and
    (=
      (MemoryBlock$bytes $t@511@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _21$address@71@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
      (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@513@01)))
    (=
      (MemoryBlock$bytes ($Snap.first ($Snap.second $t@459@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _21$address@71@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
      (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@513@01))))
  (and
    (=
      (MemoryBlock$bytes $t@511@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _21$address@71@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
      (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@513@01)))
    (=
      (MemoryBlock$bytes ($Snap.first ($Snap.second $t@459@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _21$address@71@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
      (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@513@01)))
    (< $k@516@01 $Perm.Write)
    (<= $Perm.No (- $Perm.Write $k@516@01))
    (MemoryBlock$bytes%precondition ($Snap.first $t@512@01) _21$address@71@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
; Joined path conditions
(assert (or
  (not
    (and
      (=
        (MemoryBlock$bytes $t@511@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _21$address@71@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
        (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@513@01)))
      (=
        (MemoryBlock$bytes ($Snap.first ($Snap.second $t@459@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _21$address@71@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
        (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@513@01)))))
  (and
    (=
      (MemoryBlock$bytes $t@511@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _21$address@71@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
      (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@513@01)))
    (=
      (MemoryBlock$bytes ($Snap.first ($Snap.second $t@459@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _21$address@71@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
      (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@513@01))))))
(pop) ; 17
; Nested auxiliary terms: globals (aux)
(assert ($Perm.isReadVar $k@514@01))
(assert ($Perm.isReadVar $k@515@01))
(assert ($Perm.isReadVar $k@516@01))
(assert (< $k@514@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@514@01)))
(assert (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@459@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _21$address@71@01) (as Size$I64$<Snap$Usize>  Snap$Usize)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((snapshot@513@01 Snap$Tuple$$I64$Bool$$I64$Bool$)) (!
  (and
    (=>
      (=
        (MemoryBlock$bytes ($Snap.first ($Snap.second $t@459@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _21$address@71@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
        (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@513@01)))
      (and
        (=
          (MemoryBlock$bytes ($Snap.first ($Snap.second $t@459@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _21$address@71@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
          (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@513@01)))
        (< $k@515@01 $Perm.Write)
        (<= $Perm.No (- $Perm.Write $k@515@01))
        (MemoryBlock$bytes%precondition $t@511@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _21$address@71@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))))
    (or
      (not
        (=
          (MemoryBlock$bytes ($Snap.first ($Snap.second $t@459@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _21$address@71@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
          (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@513@01))))
      (=
        (MemoryBlock$bytes ($Snap.first ($Snap.second $t@459@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _21$address@71@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
        (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@513@01))))
    (=>
      (and
        (=
          (MemoryBlock$bytes $t@511@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _21$address@71@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
          (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@513@01)))
        (=
          (MemoryBlock$bytes ($Snap.first ($Snap.second $t@459@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _21$address@71@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
          (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@513@01))))
      (and
        (=
          (MemoryBlock$bytes $t@511@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _21$address@71@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
          (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@513@01)))
        (=
          (MemoryBlock$bytes ($Snap.first ($Snap.second $t@459@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _21$address@71@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
          (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@513@01)))
        (< $k@516@01 $Perm.Write)
        (<= $Perm.No (- $Perm.Write $k@516@01))
        (MemoryBlock$bytes%precondition ($Snap.first $t@512@01) _21$address@71@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize))))
    (or
      (not
        (and
          (=
            (MemoryBlock$bytes $t@511@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _21$address@71@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
            (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@513@01)))
          (=
            (MemoryBlock$bytes ($Snap.first ($Snap.second $t@459@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _21$address@71@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
            (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@513@01)))))
      (and
        (=
          (MemoryBlock$bytes $t@511@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _21$address@71@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
          (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@513@01)))
        (=
          (MemoryBlock$bytes ($Snap.first ($Snap.second $t@459@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _21$address@71@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
          (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@513@01))))))
  :pattern ((to_bytes$Tuple$$I64$Bool$$I64$Bool$<Bytes> snapshot@513@01))
  :qid |prog.l1883-aux|)))
(assert (forall ((snapshot@513@01 Snap$Tuple$$I64$Bool$$I64$Bool$)) (!
  (=>
    (and
      (=
        (MemoryBlock$bytes $t@511@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _21$address@71@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
        (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@513@01)))
      (=
        (MemoryBlock$bytes ($Snap.first ($Snap.second $t@459@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _21$address@71@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
        (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@513@01))))
    (=
      (MemoryBlock$bytes ($Snap.first $t@512@01) _21$address@71@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize))
      (to_bytes$Tuple$$I64$Bool$$I64$Bool$<Bytes> snapshot@513@01)))
  :pattern ((to_bytes$Tuple$$I64$Bool$$I64$Bool$<Bytes> snapshot@513@01))
  :qid |prog.l1883|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; exhale acc(MemoryBlock(_21$address, Size$Tuple$$I64$Bool$$I64$Bool$$()), write)
; [eval] Size$Tuple$$I64$Bool$$I64$Bool$$()
; [exec]
; label label__from__return_label__to__end_label
; [exec]
; inhale _0$snapshot$2 == _0$snapshot$1
(declare-const $t@517@01 $Snap)
(assert (= $t@517@01 $Snap.unit))
; [eval] _0$snapshot$2 == _0$snapshot$1
(assert (= _0$snapshot$2@3@01 _0$snapshot$1@2@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale _1$snapshot$5 == _1$snapshot$4
(declare-const $t@518@01 $Snap)
(assert (= $t@518@01 $Snap.unit))
; [eval] _1$snapshot$5 == _1$snapshot$4
(assert (= _1$snapshot$5@10@01 _1$snapshot$4@9@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _10$snapshot$5 == _10$snapshot$4
(declare-const $t@519@01 $Snap)
(assert (= $t@519@01 $Snap.unit))
; [eval] _10$snapshot$5 == _10$snapshot$4
(assert (= _10$snapshot$5@17@01 _10$snapshot$4@16@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _11$snapshot$7 == _11$snapshot$6
(declare-const $t@520@01 $Snap)
(assert (= $t@520@01 $Snap.unit))
; [eval] _11$snapshot$7 == _11$snapshot$6
(assert (= _11$snapshot$7@26@01 _11$snapshot$6@25@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _12$snapshot$7 == _12$snapshot$6
(declare-const $t@521@01 $Snap)
(assert (= $t@521@01 $Snap.unit))
; [eval] _12$snapshot$7 == _12$snapshot$6
(assert (= _12$snapshot$7@35@01 _12$snapshot$6@34@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _13$snapshot$6 == _13$snapshot$5
(declare-const $t@522@01 $Snap)
(assert (= $t@522@01 $Snap.unit))
; [eval] _13$snapshot$6 == _13$snapshot$5
(assert (= _13$snapshot$6@43@01 _13$snapshot$5@42@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _14$snapshot$7 == _14$snapshot$6
(declare-const $t@523@01 $Snap)
(assert (= $t@523@01 $Snap.unit))
; [eval] _14$snapshot$7 == _14$snapshot$6
(assert (= _14$snapshot$7@52@01 _14$snapshot$6@51@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _17$snapshot$6 == _17$snapshot$5
(declare-const $t@524@01 $Snap)
(assert (= $t@524@01 $Snap.unit))
; [eval] _17$snapshot$6 == _17$snapshot$5
(assert (= _17$snapshot$6@60@01 _17$snapshot$5@59@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _2$snapshot$7 == _2$snapshot$6
(declare-const $t@525@01 $Snap)
(assert (= $t@525@01 $Snap.unit))
; [eval] _2$snapshot$7 == _2$snapshot$6
(assert (= _2$snapshot$7@70@01 _2$snapshot$6@69@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _21$snapshot$5 == _21$snapshot$4
(declare-const $t@526@01 $Snap)
(assert (= $t@526@01 $Snap.unit))
; [eval] _21$snapshot$5 == _21$snapshot$4
(assert (= _21$snapshot$5@77@01 _21$snapshot$4@76@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _3$snapshot$5 == _3$snapshot$4
(declare-const $t@527@01 $Snap)
(assert (= $t@527@01 $Snap.unit))
; [eval] _3$snapshot$5 == _3$snapshot$4
(assert (= _3$snapshot$5@85@01 _3$snapshot$4@84@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _4$snapshot$5 == _4$snapshot$4
(declare-const $t@528@01 $Snap)
(assert (= $t@528@01 $Snap.unit))
; [eval] _4$snapshot$5 == _4$snapshot$4
(assert (= _4$snapshot$5@92@01 _4$snapshot$4@91@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _5$snapshot$3 == _5$snapshot$2
(declare-const $t@529@01 $Snap)
(assert (= $t@529@01 $Snap.unit))
; [eval] _5$snapshot$3 == _5$snapshot$2
(assert (= _5$snapshot$3@97@01 _5$snapshot$2@96@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _6$snapshot$5 == _6$snapshot$4
(declare-const $t@530@01 $Snap)
(assert (= $t@530@01 $Snap.unit))
; [eval] _6$snapshot$5 == _6$snapshot$4
(assert (= _6$snapshot$5@104@01 _6$snapshot$4@103@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _9$snapshot$8 == _9$snapshot$7
(declare-const $t@531@01 $Snap)
(assert (= $t@531@01 $Snap.unit))
; [eval] _9$snapshot$8 == _9$snapshot$7
(assert (= _9$snapshot$8@114@01 _9$snapshot$7@113@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale loop_variant$1$snapshot$4 == loop_variant$1$snapshot$3
(declare-const $t@532@01 $Snap)
(assert (= $t@532@01 $Snap.unit))
; [eval] loop_variant$1$snapshot$4 == loop_variant$1$snapshot$3
(assert (= loop_variant$1$snapshot$4@154@01 loop_variant$1$snapshot$3@153@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale loop_variant$2$snapshot$7 == loop_variant$2$snapshot$6
(declare-const $t@533@01 $Snap)
(assert (= $t@533@01 $Snap.unit))
; [eval] loop_variant$2$snapshot$7 == loop_variant$2$snapshot$6
(assert (= loop_variant$2$snapshot$7@162@01 loop_variant$2$snapshot$6@161@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; label end_label
; [exec]
; end_label$marker := true
; [exec]
; inhale basic_block_marker$end_label$marker()
(declare-const $t@534@01 $Snap)
(assert (= $t@534@01 $Snap.unit))
; [eval] basic_block_marker$end_label$marker()
(assert (as basic_block_marker$end_label$marker<Bool>  Bool))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; label end_of_method
(pop) ; 16
; [eval] !(loop__label_bb1__label_bb2$marker && (label_3_custom$marker && label_bb16$marker))
; [eval] loop__label_bb1__label_bb2$marker && (label_3_custom$marker && label_bb16$marker)
(set-option :timeout 0)
(push) ; 16
; [then-branch: 85 | True | live]
; [else-branch: 85 | False | live]
(push) ; 17
; [then-branch: 85 | True]
(push) ; 18
; [then-branch: 86 | True | live]
; [else-branch: 86 | False | live]
(push) ; 19
; [then-branch: 86 | True]
(pop) ; 19
(push) ; 19
; [else-branch: 86 | False]
(assert false)
(pop) ; 19
(pop) ; 18
; Joined path conditions
; Joined path conditions
(pop) ; 17
(push) ; 17
; [else-branch: 85 | False]
(assert false)
(pop) ; 17
(pop) ; 16
; Joined path conditions
; Joined path conditions
; [then-branch: 87 | False | dead]
; [else-branch: 87 | True | live]
(push) ; 16
; [else-branch: 87 | True]
(pop) ; 16
(pop) ; 15
; [eval] !(loop__label_bb1__label_bb2$marker && (label_3_custom$marker && label_bb16$marker))
; [eval] loop__label_bb1__label_bb2$marker && (label_3_custom$marker && label_bb16$marker)
(push) ; 15
; [then-branch: 88 | True | live]
; [else-branch: 88 | False | live]
(push) ; 16
; [then-branch: 88 | True]
(push) ; 17
; [then-branch: 89 | True | live]
; [else-branch: 89 | False | live]
(push) ; 18
; [then-branch: 89 | True]
(pop) ; 18
(push) ; 18
; [else-branch: 89 | False]
(assert false)
(pop) ; 18
(pop) ; 17
; Joined path conditions
; Joined path conditions
(pop) ; 16
(push) ; 16
; [else-branch: 88 | False]
(assert false)
(pop) ; 16
(pop) ; 15
; Joined path conditions
; Joined path conditions
; [then-branch: 90 | False | dead]
; [else-branch: 90 | True | live]
(push) ; 15
; [else-branch: 90 | True]
(pop) ; 15
(pop) ; 14
; [eval] !(loop__label_bb7__label_bb8$marker && (label_5_custom$marker && (label_bb14$marker && (label_bb15$marker && (loop__label_bb1__label_bb1$marker && (loop__label_bb1__label_bb2$marker && (label_3_custom$marker && label_bb16$marker)))))))
; [eval] loop__label_bb7__label_bb8$marker && (label_5_custom$marker && (label_bb14$marker && (label_bb15$marker && (loop__label_bb1__label_bb1$marker && (loop__label_bb1__label_bb2$marker && (label_3_custom$marker && label_bb16$marker))))))
(push) ; 14
; [then-branch: 91 | True | live]
; [else-branch: 91 | False | live]
(push) ; 15
; [then-branch: 91 | True]
(push) ; 16
; [then-branch: 92 | True | live]
; [else-branch: 92 | False | live]
(push) ; 17
; [then-branch: 92 | True]
(push) ; 18
; [then-branch: 93 | True | live]
; [else-branch: 93 | False | live]
(push) ; 19
; [then-branch: 93 | True]
(push) ; 20
; [then-branch: 94 | True | live]
; [else-branch: 94 | False | live]
(push) ; 21
; [then-branch: 94 | True]
(push) ; 22
; [then-branch: 95 | True | live]
; [else-branch: 95 | False | live]
(push) ; 23
; [then-branch: 95 | True]
(push) ; 24
; [then-branch: 96 | True | live]
; [else-branch: 96 | False | live]
(push) ; 25
; [then-branch: 96 | True]
(push) ; 26
; [then-branch: 97 | True | live]
; [else-branch: 97 | False | live]
(push) ; 27
; [then-branch: 97 | True]
(pop) ; 27
(push) ; 27
; [else-branch: 97 | False]
(assert false)
(pop) ; 27
(pop) ; 26
; Joined path conditions
; Joined path conditions
(pop) ; 25
(push) ; 25
; [else-branch: 96 | False]
(assert false)
(pop) ; 25
(pop) ; 24
; Joined path conditions
; Joined path conditions
(pop) ; 23
(push) ; 23
; [else-branch: 95 | False]
(assert false)
(pop) ; 23
(pop) ; 22
; Joined path conditions
; Joined path conditions
(pop) ; 21
(push) ; 21
; [else-branch: 94 | False]
(assert false)
(pop) ; 21
(pop) ; 20
; Joined path conditions
; Joined path conditions
(pop) ; 19
(push) ; 19
; [else-branch: 93 | False]
(assert false)
(pop) ; 19
(pop) ; 18
; Joined path conditions
; Joined path conditions
(pop) ; 17
(push) ; 17
; [else-branch: 92 | False]
(assert false)
(pop) ; 17
(pop) ; 16
; Joined path conditions
; Joined path conditions
(pop) ; 15
(push) ; 15
; [else-branch: 91 | False]
(assert false)
(pop) ; 15
(pop) ; 14
; Joined path conditions
; Joined path conditions
; [then-branch: 98 | False | dead]
; [else-branch: 98 | True | live]
(push) ; 14
; [else-branch: 98 | True]
(pop) ; 14
(pop) ; 13
; [eval] !(loop__label_bb7__label_bb8$marker && (label_5_custom$marker && (label_bb14$marker && (label_bb15$marker && (loop__label_bb1__label_bb1$marker && (loop__label_bb1__label_bb2$marker && (label_3_custom$marker && label_bb16$marker)))))))
; [eval] loop__label_bb7__label_bb8$marker && (label_5_custom$marker && (label_bb14$marker && (label_bb15$marker && (loop__label_bb1__label_bb1$marker && (loop__label_bb1__label_bb2$marker && (label_3_custom$marker && label_bb16$marker))))))
(push) ; 13
; [then-branch: 99 | True | live]
; [else-branch: 99 | False | live]
(push) ; 14
; [then-branch: 99 | True]
(push) ; 15
; [then-branch: 100 | True | live]
; [else-branch: 100 | False | live]
(push) ; 16
; [then-branch: 100 | True]
(push) ; 17
; [then-branch: 101 | True | live]
; [else-branch: 101 | False | live]
(push) ; 18
; [then-branch: 101 | True]
(push) ; 19
; [then-branch: 102 | True | live]
; [else-branch: 102 | False | live]
(push) ; 20
; [then-branch: 102 | True]
(push) ; 21
; [then-branch: 103 | True | live]
; [else-branch: 103 | False | live]
(push) ; 22
; [then-branch: 103 | True]
(push) ; 23
; [then-branch: 104 | True | live]
; [else-branch: 104 | False | live]
(push) ; 24
; [then-branch: 104 | True]
(push) ; 25
; [then-branch: 105 | True | live]
; [else-branch: 105 | False | live]
(push) ; 26
; [then-branch: 105 | True]
(pop) ; 26
(push) ; 26
; [else-branch: 105 | False]
(assert false)
(pop) ; 26
(pop) ; 25
; Joined path conditions
; Joined path conditions
(pop) ; 24
(push) ; 24
; [else-branch: 104 | False]
(assert false)
(pop) ; 24
(pop) ; 23
; Joined path conditions
; Joined path conditions
(pop) ; 22
(push) ; 22
; [else-branch: 103 | False]
(assert false)
(pop) ; 22
(pop) ; 21
; Joined path conditions
; Joined path conditions
(pop) ; 20
(push) ; 20
; [else-branch: 102 | False]
(assert false)
(pop) ; 20
(pop) ; 19
; Joined path conditions
; Joined path conditions
(pop) ; 18
(push) ; 18
; [else-branch: 101 | False]
(assert false)
(pop) ; 18
(pop) ; 17
; Joined path conditions
; Joined path conditions
(pop) ; 16
(push) ; 16
; [else-branch: 100 | False]
(assert false)
(pop) ; 16
(pop) ; 15
; Joined path conditions
; Joined path conditions
(pop) ; 14
(push) ; 14
; [else-branch: 99 | False]
(assert false)
(pop) ; 14
(pop) ; 13
; Joined path conditions
; Joined path conditions
; [then-branch: 106 | False | dead]
; [else-branch: 106 | True | live]
(push) ; 13
; [else-branch: 106 | True]
(pop) ; 13
(pop) ; 12
; [eval] !(loop__label_bb1__label_bb2$marker && (label_3_custom$marker && label_bb16$marker))
; [eval] loop__label_bb1__label_bb2$marker && (label_3_custom$marker && label_bb16$marker)
(push) ; 12
; [then-branch: 107 | True | live]
; [else-branch: 107 | False | live]
(push) ; 13
; [then-branch: 107 | True]
(push) ; 14
; [then-branch: 108 | True | live]
; [else-branch: 108 | False | live]
(push) ; 15
; [then-branch: 108 | True]
(pop) ; 15
(push) ; 15
; [else-branch: 108 | False]
(assert false)
(pop) ; 15
(pop) ; 14
; Joined path conditions
; Joined path conditions
(pop) ; 13
(push) ; 13
; [else-branch: 107 | False]
(assert false)
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
; [then-branch: 109 | False | dead]
; [else-branch: 109 | True | live]
(push) ; 12
; [else-branch: 109 | True]
(pop) ; 12
(pop) ; 11
(push) ; 11
; [else-branch: 55 | destructor$Snap$Bool$$value[Bool](_3$snapshot$2@82@01)]
(assert (destructor$Snap$Bool$$value<Bool> _3$snapshot$2@82@01))
(pop) ; 11
; [eval] !!destructor$Snap$Bool$$value(_3$snapshot$2)
; [eval] !destructor$Snap$Bool$$value(_3$snapshot$2)
; [eval] destructor$Snap$Bool$$value(_3$snapshot$2)
(push) ; 11
(set-option :timeout 10)
(assert (not (not (destructor$Snap$Bool$$value<Bool> _3$snapshot$2@82@01))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (destructor$Snap$Bool$$value<Bool> _3$snapshot$2@82@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [then-branch: 110 | destructor$Snap$Bool$$value[Bool](_3$snapshot$2@82@01) | live]
; [else-branch: 110 | !(destructor$Snap$Bool$$value[Bool](_3$snapshot$2@82@01)) | live]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 110 | destructor$Snap$Bool$$value[Bool](_3$snapshot$2@82@01)]
(assert (destructor$Snap$Bool$$value<Bool> _3$snapshot$2@82@01))
(push) ; 12
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [then-branch: 111 | True | live]
; [else-branch: 111 | False | dead]
(set-option :timeout 0)
(push) ; 12
; [then-branch: 111 | True]
; [exec]
; label loop__label_bb1__label_4_custom
; [exec]
; loop__label_bb1__label_4_custom$marker := true
; [exec]
; inhale basic_block_marker$loop__label_bb1__label_4_custom$marker()
(declare-const $t@535@01 $Snap)
(assert (= $t@535@01 $Snap.unit))
; [eval] basic_block_marker$loop__label_bb1__label_4_custom$marker()
(assert (as basic_block_marker$loop__label_bb1__label_4_custom$marker<Bool>  Bool))
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
(declare-const $t@536@01 $Snap)
(assert (= $t@536@01 $Snap.unit))
; [eval] basic_block_marker$loop__label_bb1__label_bb3$marker()
(assert (as basic_block_marker$loop__label_bb1__label_bb3$marker<Bool>  Bool))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlock(_5$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
(declare-const $t@537@01 $Snap)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01)
    _5$address@93@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
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
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _17$place<Place>  Place)) _17$address@53@01)
    _5$address@93@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= _0$address@0@01 _5$address@93@01)))
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
    (compute_address<Address> (as _17$place<Place>  Place) _17$address@53@01)
    _5$address@93@01)
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
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
    (compute_address<Address> (as _21$place<Place>  Place) _21$address@71@01)
    _5$address@93@01)
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlockStackDrop(_5$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
(declare-const $t@538@01 $Snap)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (and
  (= _3$address@79@01 _5$address@93@01)
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlock(_6$address, Size$Bool$()), write)
; [eval] Size$Bool$()
(declare-const $t@539@01 $Snap)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (and
  (= _5$address@93@01 _6$address@98@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
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
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01)
    _6$address@98@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
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
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _17$place<Place>  Place)) _17$address@53@01)
    _6$address@98@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (and
  (= _0$address@0@01 _6$address@98@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
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
    (compute_address<Address> (as _17$place<Place>  Place) _17$address@53@01)
    _6$address@98@01)
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
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
    (compute_address<Address> (as _21$place<Place>  Place) _21$address@71@01)
    _6$address@98@01)
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlockStackDrop(_6$address, Size$Bool$()), write)
; [eval] Size$Bool$()
(declare-const $t@540@01 $Snap)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (and
  (= _5$address@93@01 _6$address@98@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= _3$address@79@01 _6$address@98@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; write_place_constant$Bool(_6$place(), _6$address, constructor$Snap$Bool$(false))
; [eval] _6$place()
; [eval] constructor$Snap$Bool$(false)
; [eval] compute_address(target_place, target_root_address)
; [eval] Size$Bool$()
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _21$place<Place>  Place) _21$address@71@01)
    (compute_address<Address> (as _6$place<Place>  Place) _6$address@98@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
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
    (compute_address<Address> (as _17$place<Place>  Place) _17$address@53@01)
    (compute_address<Address> (as _6$place<Place>  Place) _6$address@98@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
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
    _0$address@0@01
    (compute_address<Address> (as _6$place<Place>  Place) _6$address@98@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
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
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _17$place<Place>  Place)) _17$address@53@01)
    (compute_address<Address> (as _6$place<Place>  Place) _6$address@98@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
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
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01)
    (compute_address<Address> (as _6$place<Place>  Place) _6$address@98@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
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
    _5$address@93@01
    (compute_address<Address> (as _6$place<Place>  Place) _6$address@98@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (=
  _6$address@98@01
  (compute_address<Address> (as _6$place<Place>  Place) _6$address@98@01))))
(check-sat)
; unsat
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
; [eval] valid$Snap$Bool(source_snapshot)
(declare-const $t@541@01 $Snap)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (and
  (= (as _3$place<Place>  Place) (as _6$place<Place>  Place))
  (= _3$address@79@01 _6$address@98@01)
  (= result_value@473@01 (constructor$Snap$Bool$<Snap$Bool> false)))))
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
    (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _17$place<Place>  Place))
    (as _6$place<Place>  Place))
  (= _17$address@53@01 _6$address@98@01)
  (=
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> result_value@414@01)
    (constructor$Snap$Bool$<Snap$Bool> false)))))
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
    (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _21$place<Place>  Place))
    (as _6$place<Place>  Place))
  (= _21$address@71@01 _6$address@98@01)
  (=
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> result_value@452@01)
    (constructor$Snap$Bool$<Snap$Bool> false)))))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _6$snapshot$2 == constructor$Snap$Bool$(false)
(declare-const $t@542@01 $Snap)
(assert (= $t@542@01 $Snap.unit))
; [eval] _6$snapshot$2 == constructor$Snap$Bool$(false)
; [eval] constructor$Snap$Bool$(false)
(assert (= _6$snapshot$2@101@01 (constructor$Snap$Bool$<Snap$Bool> false)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert destructor$Snap$Bool$$value(constructor$Snap$Bool$EqCmp_Lifetime(lft_0$snapshot$1,
;   intersect(Set(bw2$snapshot$0))))
; [eval] destructor$Snap$Bool$$value(constructor$Snap$Bool$EqCmp_Lifetime(lft_0$snapshot$1, intersect(Set(bw2$snapshot$0))))
; [eval] constructor$Snap$Bool$EqCmp_Lifetime(lft_0$snapshot$1, intersect(Set(bw2$snapshot$0)))
; [eval] intersect(Set(bw2$snapshot$0))
; [eval] Set(bw2$snapshot$0)
; [exec]
; assert destructor$Snap$Bool$$value(constructor$Snap$Bool$EqCmp_Lifetime(lft_1$snapshot$1,
;   intersect(Set(bw2$snapshot$0, bw3$snapshot$0))))
; [eval] destructor$Snap$Bool$$value(constructor$Snap$Bool$EqCmp_Lifetime(lft_1$snapshot$1, intersect(Set(bw2$snapshot$0, bw3$snapshot$0))))
; [eval] constructor$Snap$Bool$EqCmp_Lifetime(lft_1$snapshot$1, intersect(Set(bw2$snapshot$0, bw3$snapshot$0)))
; [eval] intersect(Set(bw2$snapshot$0, bw3$snapshot$0))
; [eval] Set(bw2$snapshot$0, bw3$snapshot$0)
; [exec]
; assert destructor$Snap$Bool$$value(constructor$Snap$Bool$LtCmp_Unbounded(constructor$Snap$Unbounded$(destructor$Snap$I64$$value(_1$snapshot$2)),
;   loop_variant$1$snapshot$2))
; [eval] destructor$Snap$Bool$$value(constructor$Snap$Bool$LtCmp_Unbounded(constructor$Snap$Unbounded$(destructor$Snap$I64$$value(_1$snapshot$2)), loop_variant$1$snapshot$2))
; [eval] constructor$Snap$Bool$LtCmp_Unbounded(constructor$Snap$Unbounded$(destructor$Snap$I64$$value(_1$snapshot$2)), loop_variant$1$snapshot$2)
; [eval] constructor$Snap$Unbounded$(destructor$Snap$I64$$value(_1$snapshot$2))
; [eval] destructor$Snap$I64$$value(_1$snapshot$2)
(set-option :timeout 0)
(push) ; 13
(assert (not (destructor$Snap$Bool$$value<Bool> (constructor$Snap$Bool$LtCmp_Unbounded<Snap$Bool> (constructor$Snap$Unbounded$<Snap$Unbounded> (destructor$Snap$I64$$value<Int> _1$snapshot$2@7@01)) loop_variant$1$snapshot$2@152@01))))
(check-sat)
; unsat
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(assert (destructor$Snap$Bool$$value<Bool> (constructor$Snap$Bool$LtCmp_Unbounded<Snap$Bool> (constructor$Snap$Unbounded$<Snap$Unbounded> (destructor$Snap$I64$$value<Int> _1$snapshot$2@7@01)) loop_variant$1$snapshot$2@152@01)))
; [exec]
; assert destructor$Snap$Bool$$value(constructor$Snap$Bool$GeCmp_Unbounded(constructor$Snap$Unbounded$(destructor$Snap$I64$$value(_1$snapshot$2)),
;   constructor$Snap$Unbounded$(0)))
; [eval] destructor$Snap$Bool$$value(constructor$Snap$Bool$GeCmp_Unbounded(constructor$Snap$Unbounded$(destructor$Snap$I64$$value(_1$snapshot$2)), constructor$Snap$Unbounded$(0)))
; [eval] constructor$Snap$Bool$GeCmp_Unbounded(constructor$Snap$Unbounded$(destructor$Snap$I64$$value(_1$snapshot$2)), constructor$Snap$Unbounded$(0))
; [eval] constructor$Snap$Unbounded$(destructor$Snap$I64$$value(_1$snapshot$2))
; [eval] destructor$Snap$I64$$value(_1$snapshot$2)
; [eval] constructor$Snap$Unbounded$(0)
(push) ; 13
(assert (not (destructor$Snap$Bool$$value<Bool> (constructor$Snap$Bool$GeCmp_Unbounded<Snap$Bool> (constructor$Snap$Unbounded$<Snap$Unbounded> (destructor$Snap$I64$$value<Int> _1$snapshot$2@7@01)) (constructor$Snap$Unbounded$<Snap$Unbounded> 0)))))
(check-sat)
; unsat
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(assert (destructor$Snap$Bool$$value<Bool> (constructor$Snap$Bool$GeCmp_Unbounded<Snap$Bool> (constructor$Snap$Unbounded$<Snap$Unbounded> (destructor$Snap$I64$$value<Int> _1$snapshot$2@7@01)) (constructor$Snap$Unbounded$<Snap$Unbounded> 0))))
; [exec]
; inhale false
(pop) ; 12
; [eval] !true
; [then-branch: 112 | False | dead]
; [else-branch: 112 | True | live]
(push) ; 12
; [else-branch: 112 | True]
(pop) ; 12
(pop) ; 11
(push) ; 11
; [else-branch: 110 | !(destructor$Snap$Bool$$value[Bool](_3$snapshot$2@82@01))]
(assert (not (destructor$Snap$Bool$$value<Bool> _3$snapshot$2@82@01)))
(pop) ; 11
(pop) ; 10
; [eval] !(loop__label_bb7__label_bb8$marker && (label_5_custom$marker && label_bb14$marker))
; [eval] loop__label_bb7__label_bb8$marker && (label_5_custom$marker && label_bb14$marker)
(push) ; 10
; [then-branch: 113 | True | live]
; [else-branch: 113 | False | live]
(push) ; 11
; [then-branch: 113 | True]
(push) ; 12
; [then-branch: 114 | True | live]
; [else-branch: 114 | False | live]
(push) ; 13
; [then-branch: 114 | True]
(pop) ; 13
(push) ; 13
; [else-branch: 114 | False]
(assert false)
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(pop) ; 11
(push) ; 11
; [else-branch: 113 | False]
(assert false)
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
; [then-branch: 115 | False | dead]
; [else-branch: 115 | True | live]
(push) ; 10
; [else-branch: 115 | True]
(pop) ; 10
(pop) ; 9
; [eval] !!destructor$Snap$Bool$$value(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(_21$snapshot$1))
; [eval] !destructor$Snap$Bool$$value(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(_21$snapshot$1))
; [eval] destructor$Snap$Bool$$value(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(_21$snapshot$1))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(_21$snapshot$1)
(push) ; 9
(set-option :timeout 10)
(assert (not (not
  (destructor$Snap$Bool$$value<Bool> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> _21$snapshot$1@73@01)))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [then-branch: 116 | destructor$Snap$Bool$$value[Bool](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](_21$snapshot$1@73@01)) | dead]
; [else-branch: 116 | !(destructor$Snap$Bool$$value[Bool](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](_21$snapshot$1@73@01))) | live]
(set-option :timeout 0)
(push) ; 9
; [else-branch: 116 | !(destructor$Snap$Bool$$value[Bool](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](_21$snapshot$1@73@01)))]
(assert (not
  (destructor$Snap$Bool$$value<Bool> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> _21$snapshot$1@73@01))))
(pop) ; 9
(pop) ; 8
(push) ; 8
; [else-branch: 49 | destructor$Snap$Bool$$value[Bool](_11$snapshot$2@21@01)]
(assert (destructor$Snap$Bool$$value<Bool> _11$snapshot$2@21@01))
(pop) ; 8
; [eval] !!destructor$Snap$Bool$$value(_11$snapshot$2)
; [eval] !destructor$Snap$Bool$$value(_11$snapshot$2)
; [eval] destructor$Snap$Bool$$value(_11$snapshot$2)
(push) ; 8
(set-option :timeout 10)
(assert (not (not (destructor$Snap$Bool$$value<Bool> _11$snapshot$2@21@01))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (destructor$Snap$Bool$$value<Bool> _11$snapshot$2@21@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [then-branch: 117 | destructor$Snap$Bool$$value[Bool](_11$snapshot$2@21@01) | live]
; [else-branch: 117 | !(destructor$Snap$Bool$$value[Bool](_11$snapshot$2@21@01)) | live]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 117 | destructor$Snap$Bool$$value[Bool](_11$snapshot$2@21@01)]
(assert (destructor$Snap$Bool$$value<Bool> _11$snapshot$2@21@01))
(push) ; 9
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [then-branch: 118 | True | live]
; [else-branch: 118 | False | dead]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 118 | True]
; [exec]
; label loop__label_bb7__label_6_custom
; [exec]
; loop__label_bb7__label_6_custom$marker := true
; [exec]
; inhale basic_block_marker$loop__label_bb7__label_6_custom$marker()
(declare-const $t@543@01 $Snap)
(assert (= $t@543@01 $Snap.unit))
; [eval] basic_block_marker$loop__label_bb7__label_6_custom$marker()
(assert (as basic_block_marker$loop__label_bb7__label_6_custom$marker<Bool>  Bool))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; label loop__label_bb7__label_bb9
; [exec]
; loop__label_bb7__label_bb9$marker := true
; [exec]
; inhale basic_block_marker$loop__label_bb7__label_bb9$marker()
(declare-const $t@544@01 $Snap)
(assert (= $t@544@01 $Snap.unit))
; [eval] basic_block_marker$loop__label_bb7__label_bb9$marker()
(assert (as basic_block_marker$loop__label_bb7__label_bb9$marker<Bool>  Bool))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlock(_13$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
(declare-const $t@545@01 $Snap)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _17$place<Place>  Place)) _17$address@53@01)
    _13$address@36@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= _10$address@11@01 _13$address@36@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and
  (= _21$address@71@01 _13$address@36@01)
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and
  (= _3$address@79@01 _13$address@36@01)
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= _0$address@0@01 _13$address@36@01)))
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
    (compute_address<Address> (as _17$place<Place>  Place) _17$address@53@01)
    _13$address@36@01)
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlockStackDrop(_13$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
(declare-const $t@546@01 $Snap)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and
  (= _11$address@18@01 _13$address@36@01)
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= _10$address@11@01 _13$address@36@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and
  (= _9$address@105@01 _13$address@36@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and
  (= _3$address@79@01 _13$address@36@01)
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlock(_14$address, Size$Bool$()), write)
; [eval] Size$Bool$()
(declare-const $t@547@01 $Snap)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and
  (= _13$address@36@01 _14$address@44@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
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
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _17$place<Place>  Place)) _17$address@53@01)
    _14$address@44@01)
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
  (= _10$address@11@01 _14$address@44@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
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
  (= _21$address@71@01 _14$address@44@01)
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= _3$address@79@01 _14$address@44@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and
  (= _0$address@0@01 _14$address@44@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
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
    (compute_address<Address> (as _17$place<Place>  Place) _17$address@53@01)
    _14$address@44@01)
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlockStackDrop(_14$address, Size$Bool$()), write)
; [eval] Size$Bool$()
(declare-const $t@548@01 $Snap)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and
  (= _13$address@36@01 _14$address@44@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= _11$address@18@01 _14$address@44@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and
  (= _10$address@11@01 _14$address@44@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
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
  (= _9$address@105@01 _14$address@44@01)
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
(assert (not (= _3$address@79@01 _14$address@44@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; write_place_constant$Bool(_14$place(), _14$address, constructor$Snap$Bool$(false))
; [eval] _14$place()
; [eval] constructor$Snap$Bool$(false)
; [eval] compute_address(target_place, target_root_address)
; [eval] Size$Bool$()
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _17$place<Place>  Place) _17$address@53@01)
    (compute_address<Address> (as _14$place<Place>  Place) _14$address@44@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
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
    _0$address@0@01
    (compute_address<Address> (as _14$place<Place>  Place) _14$address@44@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  _3$address@79@01
  (compute_address<Address> (as _14$place<Place>  Place) _14$address@44@01))))
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
    _21$address@71@01
    (compute_address<Address> (as _14$place<Place>  Place) _14$address@44@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
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
    _10$address@11@01
    (compute_address<Address> (as _14$place<Place>  Place) _14$address@44@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
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
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _17$place<Place>  Place)) _17$address@53@01)
    (compute_address<Address> (as _14$place<Place>  Place) _14$address@44@01))
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
    _13$address@36@01
    (compute_address<Address> (as _14$place<Place>  Place) _14$address@44@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  _14$address@44@01
  (compute_address<Address> (as _14$place<Place>  Place) _14$address@44@01))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [eval] valid$Snap$Bool(source_snapshot)
(declare-const $t@549@01 $Snap)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and
  (= (as _11$place<Place>  Place) (as _14$place<Place>  Place))
  (= _11$address@18@01 _14$address@44@01)
  (= result_value@433@01 (constructor$Snap$Bool$<Snap$Bool> false)))))
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
    (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _17$place<Place>  Place))
    (as _14$place<Place>  Place))
  (= _17$address@53@01 _14$address@44@01)
  (=
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> result_value@414@01)
    (constructor$Snap$Bool$<Snap$Bool> false)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _14$snapshot$2 == constructor$Snap$Bool$(false)
(declare-const $t@550@01 $Snap)
(assert (= $t@550@01 $Snap.unit))
; [eval] _14$snapshot$2 == constructor$Snap$Bool$(false)
; [eval] constructor$Snap$Bool$(false)
(assert (= _14$snapshot$2@47@01 (constructor$Snap$Bool$<Snap$Bool> false)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert destructor$Snap$Bool$$value(constructor$Snap$Bool$EqCmp_Lifetime(lft_0$snapshot$1,
;   intersect(Set(bw2$snapshot$0))))
; [eval] destructor$Snap$Bool$$value(constructor$Snap$Bool$EqCmp_Lifetime(lft_0$snapshot$1, intersect(Set(bw2$snapshot$0))))
; [eval] constructor$Snap$Bool$EqCmp_Lifetime(lft_0$snapshot$1, intersect(Set(bw2$snapshot$0)))
; [eval] intersect(Set(bw2$snapshot$0))
; [eval] Set(bw2$snapshot$0)
; [exec]
; assert destructor$Snap$Bool$$value(constructor$Snap$Bool$EqCmp_Lifetime(lft_1$snapshot$1,
;   intersect(Set(bw2$snapshot$0, bw3$snapshot$0))))
; [eval] destructor$Snap$Bool$$value(constructor$Snap$Bool$EqCmp_Lifetime(lft_1$snapshot$1, intersect(Set(bw2$snapshot$0, bw3$snapshot$0))))
; [eval] constructor$Snap$Bool$EqCmp_Lifetime(lft_1$snapshot$1, intersect(Set(bw2$snapshot$0, bw3$snapshot$0)))
; [eval] intersect(Set(bw2$snapshot$0, bw3$snapshot$0))
; [eval] Set(bw2$snapshot$0, bw3$snapshot$0)
; [exec]
; assert destructor$Snap$Bool$$value(constructor$Snap$Bool$LtCmp_Unbounded(constructor$Snap$Unbounded$(destructor$Snap$I64$$value(_9$snapshot$3)),
;   loop_variant$2$snapshot$2))
; [eval] destructor$Snap$Bool$$value(constructor$Snap$Bool$LtCmp_Unbounded(constructor$Snap$Unbounded$(destructor$Snap$I64$$value(_9$snapshot$3)), loop_variant$2$snapshot$2))
; [eval] constructor$Snap$Bool$LtCmp_Unbounded(constructor$Snap$Unbounded$(destructor$Snap$I64$$value(_9$snapshot$3)), loop_variant$2$snapshot$2)
; [eval] constructor$Snap$Unbounded$(destructor$Snap$I64$$value(_9$snapshot$3))
; [eval] destructor$Snap$I64$$value(_9$snapshot$3)
(set-option :timeout 0)
(push) ; 10
(assert (not (destructor$Snap$Bool$$value<Bool> (constructor$Snap$Bool$LtCmp_Unbounded<Snap$Bool> (constructor$Snap$Unbounded$<Snap$Unbounded> (destructor$Snap$I64$$value<Int> _9$snapshot$3@109@01)) loop_variant$2$snapshot$2@157@01))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(assert (destructor$Snap$Bool$$value<Bool> (constructor$Snap$Bool$LtCmp_Unbounded<Snap$Bool> (constructor$Snap$Unbounded$<Snap$Unbounded> (destructor$Snap$I64$$value<Int> _9$snapshot$3@109@01)) loop_variant$2$snapshot$2@157@01)))
; [exec]
; assert destructor$Snap$Bool$$value(constructor$Snap$Bool$GeCmp_Unbounded(constructor$Snap$Unbounded$(destructor$Snap$I64$$value(_9$snapshot$3)),
;   constructor$Snap$Unbounded$(0)))
; [eval] destructor$Snap$Bool$$value(constructor$Snap$Bool$GeCmp_Unbounded(constructor$Snap$Unbounded$(destructor$Snap$I64$$value(_9$snapshot$3)), constructor$Snap$Unbounded$(0)))
; [eval] constructor$Snap$Bool$GeCmp_Unbounded(constructor$Snap$Unbounded$(destructor$Snap$I64$$value(_9$snapshot$3)), constructor$Snap$Unbounded$(0))
; [eval] constructor$Snap$Unbounded$(destructor$Snap$I64$$value(_9$snapshot$3))
; [eval] destructor$Snap$I64$$value(_9$snapshot$3)
; [eval] constructor$Snap$Unbounded$(0)
(push) ; 10
(assert (not (destructor$Snap$Bool$$value<Bool> (constructor$Snap$Bool$GeCmp_Unbounded<Snap$Bool> (constructor$Snap$Unbounded$<Snap$Unbounded> (destructor$Snap$I64$$value<Int> _9$snapshot$3@109@01)) (constructor$Snap$Unbounded$<Snap$Unbounded> 0)))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(assert (destructor$Snap$Bool$$value<Bool> (constructor$Snap$Bool$GeCmp_Unbounded<Snap$Bool> (constructor$Snap$Unbounded$<Snap$Unbounded> (destructor$Snap$I64$$value<Int> _9$snapshot$3@109@01)) (constructor$Snap$Unbounded$<Snap$Unbounded> 0))))
; [exec]
; inhale false
(pop) ; 9
; [eval] !true
; [then-branch: 119 | False | dead]
; [else-branch: 119 | True | live]
(push) ; 9
; [else-branch: 119 | True]
(pop) ; 9
(pop) ; 8
(push) ; 8
; [else-branch: 117 | !(destructor$Snap$Bool$$value[Bool](_11$snapshot$2@21@01))]
(assert (not (destructor$Snap$Bool$$value<Bool> _11$snapshot$2@21@01)))
(pop) ; 8
(pop) ; 7
; [eval] !!destructor$Snap$Bool$$value(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(_17$snapshot$1))
; [eval] !destructor$Snap$Bool$$value(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(_17$snapshot$1))
; [eval] destructor$Snap$Bool$$value(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(_17$snapshot$1))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(_17$snapshot$1)
(push) ; 7
(set-option :timeout 10)
(assert (not (not
  (destructor$Snap$Bool$$value<Bool> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> _17$snapshot$1@55@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [then-branch: 120 | destructor$Snap$Bool$$value[Bool](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](_17$snapshot$1@55@01)) | dead]
; [else-branch: 120 | !(destructor$Snap$Bool$$value[Bool](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](_17$snapshot$1@55@01))) | live]
(set-option :timeout 0)
(push) ; 7
; [else-branch: 120 | !(destructor$Snap$Bool$$value[Bool](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](_17$snapshot$1@55@01)))]
(assert (not
  (destructor$Snap$Bool$$value<Bool> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> _17$snapshot$1@55@01))))
(pop) ; 7
(pop) ; 6
; [eval] !true
; [then-branch: 121 | False | dead]
; [else-branch: 121 | True | live]
(push) ; 6
; [else-branch: 121 | True]
(pop) ; 6
(pop) ; 5
(push) ; 5
; [else-branch: 45 | !(destructor$Snap$Bool$$value[Bool](_11$snapshot$1@20@01))]
(assert (not (destructor$Snap$Bool$$value<Bool> _11$snapshot$1@20@01)))
(pop) ; 5
(pop) ; 4
; [eval] !true
; [then-branch: 122 | False | dead]
; [else-branch: 122 | True | live]
(push) ; 4
; [else-branch: 122 | True]
(pop) ; 4
(pop) ; 3
(push) ; 3
; [else-branch: 11 | !(destructor$Snap$Bool$$value[Bool](_3$snapshot$1@81@01))]
(assert (not (destructor$Snap$Bool$$value<Bool> _3$snapshot$1@81@01)))
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- assign$Bool$BinaryOp$GtCmp$Move$I64$Constant$I64$$$$ ----------
(declare-const target_place@551@01 Place)
(declare-const target_address@552@01 Address)
(declare-const operand1_place@553@01 Place)
(declare-const operand1_root_address@554@01 Address)
(declare-const operand1_value@555@01 Snap$I64)
(declare-const operand2_value@556@01 Snap$I64)
(declare-const result_value@557@01 Snap$Bool)
(declare-const target_place@558@01 Place)
(declare-const target_address@559@01 Address)
(declare-const operand1_place@560@01 Place)
(declare-const operand1_root_address@561@01 Address)
(declare-const operand1_value@562@01 Snap$I64)
(declare-const operand2_value@563@01 Snap$I64)
(declare-const result_value@564@01 Snap$Bool)
(push) ; 1
(declare-const $t@565@01 $Snap)
(assert (= $t@565@01 ($Snap.combine ($Snap.first $t@565@01) ($Snap.second $t@565@01))))
; [eval] compute_address(target_place, target_address)
; [eval] Size$Bool$()
(assert (=
  ($Snap.second $t@565@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@565@01))
    ($Snap.second ($Snap.second $t@565@01)))))
(assert (=
  ($Snap.second ($Snap.second $t@565@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@565@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@565@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@565@01))) $Snap.unit))
; [eval] valid$Snap$I64(operand1_value)
(assert (valid$Snap$I64<Bool> operand1_value@562@01))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@565@01))) $Snap.unit))
; [eval] valid$Snap$I64(operand2_value)
(assert (valid$Snap$I64<Bool> operand2_value@563@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@566@01 $Snap)
(assert (= $t@566@01 ($Snap.combine ($Snap.first $t@566@01) ($Snap.second $t@566@01))))
(assert (=
  ($Snap.second $t@566@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@566@01))
    ($Snap.second ($Snap.second $t@566@01)))))
; [eval] compute_address(operand1_place, operand1_root_address)
; [eval] Size$I64$()
(assert (=
  ($Snap.second ($Snap.second $t@566@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@566@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@566@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@566@01))) $Snap.unit))
; [eval] result_value == constructor$Snap$Bool$GtCmp_I64(operand1_value, operand2_value)
; [eval] constructor$Snap$Bool$GtCmp_I64(operand1_value, operand2_value)
(assert (=
  result_value@564@01
  (constructor$Snap$Bool$GtCmp_I64<Snap$Bool> operand1_value@562@01 operand2_value@563@01)))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@566@01))) $Snap.unit))
; [eval] valid$Snap$Bool(result_value)
(assert (valid$Snap$Bool<Bool> result_value@564@01))
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- assign$Tuple$$I64$Bool$$I64$Bool$$CheckedBinaryOp$Sub$Copy$I64$Constant$I64$$$$ ----------
(declare-const target_place@567@01 Place)
(declare-const target_address@568@01 Address)
(declare-const operand1_place@569@01 Place)
(declare-const operand1_root_address@570@01 Address)
(declare-const operand1_value@571@01 Snap$I64)
(declare-const operand2_value@572@01 Snap$I64)
(declare-const result_value@573@01 Snap$Tuple$$I64$Bool$$I64$Bool$)
(declare-const target_place@574@01 Place)
(declare-const target_address@575@01 Address)
(declare-const operand1_place@576@01 Place)
(declare-const operand1_root_address@577@01 Address)
(declare-const operand1_value@578@01 Snap$I64)
(declare-const operand2_value@579@01 Snap$I64)
(declare-const result_value@580@01 Snap$Tuple$$I64$Bool$$I64$Bool$)
(push) ; 1
(declare-const $t@581@01 $Snap)
(assert (= $t@581@01 ($Snap.combine ($Snap.first $t@581@01) ($Snap.second $t@581@01))))
; [eval] compute_address(target_place, target_address)
; [eval] Size$Tuple$$I64$Bool$$I64$Bool$$()
(assert (=
  ($Snap.second $t@581@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@581@01))
    ($Snap.second ($Snap.second $t@581@01)))))
(assert (=
  ($Snap.second ($Snap.second $t@581@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@581@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@581@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@581@01))) $Snap.unit))
; [eval] valid$Snap$I64(operand1_value)
(assert (valid$Snap$I64<Bool> operand1_value@578@01))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@581@01))) $Snap.unit))
; [eval] valid$Snap$I64(operand2_value)
(assert (valid$Snap$I64<Bool> operand2_value@579@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@582@01 $Snap)
(assert (= $t@582@01 ($Snap.combine ($Snap.first $t@582@01) ($Snap.second $t@582@01))))
; [eval] compute_address(target_place, target_address)
; [eval] PaddingSize$Tuple$$I64$Bool$$I64$Bool$$()
(assert (=
  ($Snap.second $t@582@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@582@01))
    ($Snap.second ($Snap.second $t@582@01)))))
; [eval] field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(compute_address(target_place, target_address))
; [eval] compute_address(target_place, target_address)
; [eval] Size$I64$()
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> target_place@574@01 target_address@575@01)
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> target_place@574@01 target_address@575@01)))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second $t@582@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@582@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@582@01))))))
; [eval] field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(target_place)
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(result_value)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@582@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@582@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@582@01)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@582@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@582@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@582@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@582@01)))))
  $Snap.unit))
; [eval] valid$Snap$I64(constructor$Snap$I64$Sub_I64(operand1_value, operand2_value)) ==> destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(result_value) == constructor$Snap$I64$Sub_I64(operand1_value, operand2_value)
; [eval] valid$Snap$I64(constructor$Snap$I64$Sub_I64(operand1_value, operand2_value))
; [eval] constructor$Snap$I64$Sub_I64(operand1_value, operand2_value)
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (valid$Snap$I64<Bool> (constructor$Snap$I64$Sub_I64<Snap$I64> operand1_value@578@01 operand2_value@579@01)))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (valid$Snap$I64<Bool> (constructor$Snap$I64$Sub_I64<Snap$I64> operand1_value@578@01 operand2_value@579@01))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [then-branch: 123 | valid$Snap$I64[Bool](constructor$Snap$I64$Sub_I64[Snap$I64](operand1_value@578@01, operand2_value@579@01)) | live]
; [else-branch: 123 | !(valid$Snap$I64[Bool](constructor$Snap$I64$Sub_I64[Snap$I64](operand1_value@578@01, operand2_value@579@01))) | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 123 | valid$Snap$I64[Bool](constructor$Snap$I64$Sub_I64[Snap$I64](operand1_value@578@01, operand2_value@579@01))]
(assert (valid$Snap$I64<Bool> (constructor$Snap$I64$Sub_I64<Snap$I64> operand1_value@578@01 operand2_value@579@01)))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(result_value) == constructor$Snap$I64$Sub_I64(operand1_value, operand2_value)
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(result_value)
; [eval] constructor$Snap$I64$Sub_I64(operand1_value, operand2_value)
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (valid$Snap$I64<Bool> (constructor$Snap$I64$Sub_I64<Snap$I64> operand1_value@578@01 operand2_value@579@01)))
(assert (=>
  (valid$Snap$I64<Bool> (constructor$Snap$I64$Sub_I64<Snap$I64> operand1_value@578@01 operand2_value@579@01))
  (=
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> result_value@580@01)
    (constructor$Snap$I64$Sub_I64<Snap$I64> operand1_value@578@01 operand2_value@579@01))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@582@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@582@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@582@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@582@01))))))
  $Snap.unit))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(result_value) == constructor$Snap$Bool$(!valid$Snap$I64(constructor$Snap$I64$Sub_I64(operand1_value, operand2_value)))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(result_value)
; [eval] constructor$Snap$Bool$(!valid$Snap$I64(constructor$Snap$I64$Sub_I64(operand1_value, operand2_value)))
; [eval] !valid$Snap$I64(constructor$Snap$I64$Sub_I64(operand1_value, operand2_value))
; [eval] valid$Snap$I64(constructor$Snap$I64$Sub_I64(operand1_value, operand2_value))
; [eval] constructor$Snap$I64$Sub_I64(operand1_value, operand2_value)
(assert (=
  (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> result_value@580@01)
  (constructor$Snap$Bool$<Snap$Bool> (not
    (valid$Snap$I64<Bool> (constructor$Snap$I64$Sub_I64<Snap$I64> operand1_value@578@01 operand2_value@579@01))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@582@01))))))
  $Snap.unit))
; [eval] MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(compute_address(target_place, target_address)), Size$I64$()) == to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(result_value))
; [eval] MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(compute_address(target_place, target_address)), Size$I64$())
; [eval] field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(compute_address(target_place, target_address))
; [eval] compute_address(target_place, target_address)
; [eval] Size$I64$()
(push) ; 3
(declare-const $k@583@01 $Perm)
(assert ($Perm.isReadVar $k@583@01))
(assert (< $k@583@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@583@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@583@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@582@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> target_place@574@01 target_address@575@01)) (as Size$I64$<Snap$Usize>  Snap$Usize)))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@583@01))
(assert (and
  (< $k@583@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@583@01))
  (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@582@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> target_place@574@01 target_address@575@01)) (as Size$I64$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(result_value))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(result_value)
(assert (=
  (MemoryBlock$bytes ($Snap.first ($Snap.second $t@582@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> target_place@574@01 target_address@575@01)) (as Size$I64$<Snap$Usize>  Snap$Usize))
  (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> result_value@580@01))))
(pop) ; 2
(set-option :timeout 0)
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- copy_place$I64 ----------
(declare-const target_place@584@01 Place)
(declare-const target_root_address@585@01 Address)
(declare-const source_place@586@01 Place)
(declare-const source_root_address@587@01 Address)
(declare-const source_snapshot@588@01 Snap$I64)
(declare-const source_permission_amount@589@01 $Perm)
(declare-const target_place@590@01 Place)
(declare-const target_root_address@591@01 Address)
(declare-const source_place@592@01 Place)
(declare-const source_root_address@593@01 Address)
(declare-const source_snapshot@594@01 Snap$I64)
(declare-const source_permission_amount@595@01 $Perm)
(push) ; 1
(declare-const $t@596@01 $Snap)
(assert (= $t@596@01 ($Snap.combine ($Snap.first $t@596@01) ($Snap.second $t@596@01))))
(assert (= ($Snap.first $t@596@01) $Snap.unit))
; [eval] none < source_permission_amount
(assert (< $Perm.No source_permission_amount@595@01))
(assert (=
  ($Snap.second $t@596@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@596@01))
    ($Snap.second ($Snap.second $t@596@01)))))
; [eval] compute_address(target_place, target_root_address)
; [eval] Size$I64$()
(push) ; 2
(assert (not (or
  (= source_permission_amount@595@01 $Perm.No)
  (< $Perm.No source_permission_amount@595@01))))
(check-sat)
; unsat
(pop) ; 2
; 0.00s
; (get-info :all-statistics)
(assert (<= $Perm.No source_permission_amount@595@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@597@01 $Snap)
(assert (= $t@597@01 ($Snap.combine ($Snap.first $t@597@01) ($Snap.second $t@597@01))))
(push) ; 3
(assert (not (or
  (= source_permission_amount@595@01 $Perm.No)
  (< $Perm.No source_permission_amount@595@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second $t@597@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@597@01))
    ($Snap.second ($Snap.second $t@597@01)))))
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (= source_place@592@01 target_place@590@01)
  (= source_root_address@593@01 target_root_address@591@01))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (= ($Snap.second ($Snap.second $t@597@01)) $Snap.unit))
; [eval] valid$Snap$I64(source_snapshot)
(assert (valid$Snap$I64<Bool> source_snapshot@594@01))
(pop) ; 2
(set-option :timeout 0)
(push) ; 2
; [exec]
; unfold acc(OwnedNonAliased$I64(source_place, source_root_address, source_snapshot), source_permission_amount)
(push) ; 3
(assert (not (< $Perm.No source_permission_amount@595@01)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No source_permission_amount@595@01)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second $t@596@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@596@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@596@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@596@01))) $Snap.unit))
; [eval] valid$Snap$I64(snapshot)
(assert (valid$Snap$I64<Bool> source_snapshot@594@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@596@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@596@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@596@01)))))))
; [eval] compute_address(place, root_address)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> target_place@590@01 target_root_address@591@01)
  (compute_address<Address> source_place@592@01 source_root_address@593@01))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@596@01))))
  $Snap.unit))
; [eval] MemoryBlock$bytes(compute_address(place, root_address), Size$I64$()) == to_bytes$I64(snapshot)
; [eval] MemoryBlock$bytes(compute_address(place, root_address), Size$I64$())
; [eval] compute_address(place, root_address)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 3
(declare-const $k@598@01 $Perm)
(assert ($Perm.isReadVar $k@598@01))
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= source_permission_amount@595@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (< (* $k@598@01 source_permission_amount@595@01) source_permission_amount@595@01))
(assert (<=
  $Perm.No
  (-
    source_permission_amount@595@01
    (* $k@598@01 source_permission_amount@595@01))))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (* $k@598@01 source_permission_amount@595@01))))
(check-sat)
; unsat
(pop) ; 4
; 0.01s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@596@01)))) (compute_address<Address> source_place@592@01 source_root_address@593@01) (as Size$I64$<Snap$Usize>  Snap$Usize)))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@598@01))
(assert (and
  (<
    (* $k@598@01 source_permission_amount@595@01)
    source_permission_amount@595@01)
  (<=
    $Perm.No
    (-
      source_permission_amount@595@01
      (* $k@598@01 source_permission_amount@595@01)))
  (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@596@01)))) (compute_address<Address> source_place@592@01 source_root_address@593@01) (as Size$I64$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$I64(snapshot)
(assert (=
  (MemoryBlock$bytes ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@596@01)))) (compute_address<Address> source_place@592@01 source_root_address@593@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
  (to_bytes$I64<Bytes> source_snapshot@594@01)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (OwnedNonAliased$I64%trigger ($Snap.second ($Snap.second $t@596@01)) source_place@592@01 source_root_address@593@01 source_snapshot@594@01))
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
  (= source_permission_amount@595@01 $Perm.No)
  (< $Perm.No source_permission_amount@595@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No source_permission_amount@595@01)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(declare-const $t@599@01 $Snap)
(assert (= $t@599@01 ($Snap.combine ($Snap.first $t@599@01) ($Snap.second $t@599@01))))
; [eval] Size$I64$()
(assert (=
  ($Snap.second $t@599@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@599@01))
    ($Snap.second ($Snap.second $t@599@01)))))
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 3
(assert (not (or
  (= source_permission_amount@595@01 $Perm.No)
  (< $Perm.No source_permission_amount@595@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> target_place@590@01 target_root_address@591@01)
  (compute_address<Address> source_place@592@01 source_root_address@593@01))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second $t@599@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@599@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@599@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@599@01))) $Snap.unit))
; [eval] MemoryBlock$bytes(source_address, Size$I64$()) == old(MemoryBlock$bytes(source_address, Size$I64$()))
; [eval] MemoryBlock$bytes(source_address, Size$I64$())
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 3
(declare-const $k@600@01 $Perm)
(assert ($Perm.isReadVar $k@600@01))
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= source_permission_amount@595@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (< $k@600@01 source_permission_amount@595@01))
(assert (<= $Perm.No (- source_permission_amount@595@01 $k@600@01)))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@600@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@599@01)) (compute_address<Address> source_place@592@01 source_root_address@593@01) (as Size$I64$<Snap$Usize>  Snap$Usize)))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@600@01))
(assert (and
  (< $k@600@01 source_permission_amount@595@01)
  (<= $Perm.No (- source_permission_amount@595@01 $k@600@01))
  (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@599@01)) (compute_address<Address> source_place@592@01 source_root_address@593@01) (as Size$I64$<Snap$Usize>  Snap$Usize))))
; [eval] old(MemoryBlock$bytes(source_address, Size$I64$()))
; [eval] MemoryBlock$bytes(source_address, Size$I64$())
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 3
(declare-const $k@601@01 $Perm)
(assert ($Perm.isReadVar $k@601@01))
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= source_permission_amount@595@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (< $k@601@01 source_permission_amount@595@01))
(assert (<= $Perm.No (- source_permission_amount@595@01 $k@601@01)))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@601@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@601@01))
(assert (and
  (< $k@601@01 source_permission_amount@595@01)
  (<= $Perm.No (- source_permission_amount@595@01 $k@601@01))))
(assert (=
  (MemoryBlock$bytes ($Snap.first ($Snap.second $t@599@01)) (compute_address<Address> source_place@592@01 source_root_address@593@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
  (MemoryBlock$bytes ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@596@01)))) (compute_address<Address> source_place@592@01 source_root_address@593@01) (as Size$I64$<Snap$Usize>  Snap$Usize))))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@599@01))) $Snap.unit))
; [eval] MemoryBlock$bytes(target_address, Size$I64$()) == MemoryBlock$bytes(source_address, Size$I64$())
; [eval] MemoryBlock$bytes(target_address, Size$I64$())
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 3
(declare-const $k@602@01 $Perm)
(assert ($Perm.isReadVar $k@602@01))
(assert (< $k@602@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@602@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@602@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first $t@599@01) (compute_address<Address> target_place@590@01 target_root_address@591@01) (as Size$I64$<Snap$Usize>  Snap$Usize)))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@602@01))
(assert (and
  (< $k@602@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@602@01))
  (MemoryBlock$bytes%precondition ($Snap.first $t@599@01) (compute_address<Address> target_place@590@01 target_root_address@591@01) (as Size$I64$<Snap$Usize>  Snap$Usize))))
; [eval] MemoryBlock$bytes(source_address, Size$I64$())
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 3
(declare-const $k@603@01 $Perm)
(assert ($Perm.isReadVar $k@603@01))
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= source_permission_amount@595@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (< $k@603@01 source_permission_amount@595@01))
(assert (<= $Perm.No (- source_permission_amount@595@01 $k@603@01)))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@603@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@603@01))
(assert (and
  (< $k@603@01 source_permission_amount@595@01)
  (<= $Perm.No (- source_permission_amount@595@01 $k@603@01))))
(assert (=
  (MemoryBlock$bytes ($Snap.first $t@599@01) (compute_address<Address> target_place@590@01 target_root_address@591@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
  (MemoryBlock$bytes ($Snap.first ($Snap.second $t@599@01)) (compute_address<Address> source_place@592@01 source_root_address@593@01) (as Size$I64$<Snap$Usize>  Snap$Usize))))
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
(declare-const $k@604@01 $Perm)
(assert ($Perm.isReadVar $k@604@01))
(assert (< $k@604@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@604@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@604@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@604@01))
(assert (and (< $k@604@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@604@01))))
; [eval] to_bytes$I64(snapshot)
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  (MemoryBlock$bytes ($Snap.first $t@599@01) (compute_address<Address> target_place@590@01 target_root_address@591@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
  (to_bytes$I64<Bytes> source_snapshot@594@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (=
  (MemoryBlock$bytes ($Snap.first $t@599@01) (compute_address<Address> target_place@590@01 target_root_address@591@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
  (to_bytes$I64<Bytes> source_snapshot@594@01)))
(assert (OwnedNonAliased$I64%trigger ($Snap.combine
  $Snap.unit
  ($Snap.combine ($Snap.first $t@599@01) $Snap.unit)) target_place@590@01 target_root_address@591@01 source_snapshot@594@01))
; [exec]
; fold acc(OwnedNonAliased$I64(source_place, source_root_address, source_snapshot), source_permission_amount)
(push) ; 3
(assert (not (< $Perm.No source_permission_amount@595@01)))
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
(assert (not (< $Perm.No source_permission_amount@595@01)))
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
(declare-const $k@605@01 $Perm)
(assert ($Perm.isReadVar $k@605@01))
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= source_permission_amount@595@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (< (* $k@605@01 source_permission_amount@595@01) source_permission_amount@595@01))
(assert (<=
  $Perm.No
  (-
    source_permission_amount@595@01
    (* $k@605@01 source_permission_amount@595@01))))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (* $k@605@01 source_permission_amount@595@01))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@605@01))
(assert (and
  (<
    (* $k@605@01 source_permission_amount@595@01)
    source_permission_amount@595@01)
  (<=
    $Perm.No
    (-
      source_permission_amount@595@01
      (* $k@605@01 source_permission_amount@595@01)))))
; [eval] to_bytes$I64(snapshot)
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  (MemoryBlock$bytes ($Snap.first ($Snap.second $t@599@01)) (compute_address<Address> source_place@592@01 source_root_address@593@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
  (to_bytes$I64<Bytes> source_snapshot@594@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (=
  (MemoryBlock$bytes ($Snap.first ($Snap.second $t@599@01)) (compute_address<Address> source_place@592@01 source_root_address@593@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
  (to_bytes$I64<Bytes> source_snapshot@594@01)))
(assert (OwnedNonAliased$I64%trigger ($Snap.combine
  $Snap.unit
  ($Snap.combine ($Snap.first ($Snap.second $t@599@01)) $Snap.unit)) source_place@592@01 source_root_address@593@01 source_snapshot@594@01))
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (= target_place@590@01 source_place@592@01)
  (= target_root_address@591@01 source_root_address@593@01))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(assert (not (or
  (= source_permission_amount@595@01 $Perm.No)
  (< $Perm.No source_permission_amount@595@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No source_permission_amount@595@01)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; [eval] valid$Snap$I64(source_snapshot)
(pop) ; 2
(pop) ; 1
; ---------- havoc_memory_block$Bool$$ ----------
(declare-const address@606@01 Address)
(declare-const address@607@01 Address)
(set-option :timeout 0)
(push) ; 1
; [eval] Size$Bool$()
(declare-const $t@608@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
; [eval] Size$Bool$()
(declare-const $t@609@01 $Snap)
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- havoc_memory_block$Tuple$$$$$ ----------
(declare-const address@610@01 Address)
(declare-const address@611@01 Address)
(push) ; 1
; [eval] Size$Tuple$$$$()
(declare-const $t@612@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
; [eval] Size$Tuple$$$$()
(declare-const $t@613@01 $Snap)
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- havoc_memory_block$Tuple$$I64$Bool$$I64$Bool$$$ ----------
(declare-const address@614@01 Address)
(declare-const address@615@01 Address)
(push) ; 1
; [eval] Size$Tuple$$I64$Bool$$I64$Bool$$()
(declare-const $t@616@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
; [eval] Size$Tuple$$I64$Bool$$I64$Bool$$()
(declare-const $t@617@01 $Snap)
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- havoc_owned$I64 ----------
(declare-const place@618@01 Place)
(declare-const root_address@619@01 Address)
(declare-const old_snapshot@620@01 Snap$I64)
(declare-const fresh_snapshot@621@01 Snap$I64)
(declare-const place@622@01 Place)
(declare-const root_address@623@01 Address)
(declare-const old_snapshot@624@01 Snap$I64)
(declare-const fresh_snapshot@625@01 Snap$I64)
(push) ; 1
(declare-const $t@626@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@627@01 $Snap)
(assert (= $t@627@01 ($Snap.combine ($Snap.first $t@627@01) ($Snap.second $t@627@01))))
(assert (= ($Snap.second $t@627@01) $Snap.unit))
; [eval] valid$Snap$I64(fresh_snapshot)
(assert (valid$Snap$I64<Bool> fresh_snapshot@625@01))
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- into_memory_block$Bool ----------
(declare-const place@628@01 Place)
(declare-const root_address@629@01 Address)
(declare-const snapshot@630@01 Snap$Bool)
(declare-const place@631@01 Place)
(declare-const root_address@632@01 Address)
(declare-const snapshot@633@01 Snap$Bool)
(push) ; 1
(declare-const $t@634@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
; [eval] compute_address(place, root_address)
; [eval] Size$Bool$()
(declare-const $t@635@01 $Snap)
(pop) ; 2
(push) ; 2
; [exec]
; unfold acc(OwnedNonAliased$Bool(place, root_address, snapshot), write)
(assert (= $t@634@01 ($Snap.combine ($Snap.first $t@634@01) ($Snap.second $t@634@01))))
(assert (= ($Snap.first $t@634@01) $Snap.unit))
; [eval] valid$Snap$Bool(snapshot)
(assert (valid$Snap$Bool<Bool> snapshot@633@01))
(assert (=
  ($Snap.second $t@634@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@634@01))
    ($Snap.second ($Snap.second $t@634@01)))))
; [eval] compute_address(place, root_address)
; [eval] Size$Bool$()
(assert (= ($Snap.second ($Snap.second $t@634@01)) $Snap.unit))
; [eval] MemoryBlock$bytes(compute_address(place, root_address), Size$Bool$()) == to_bytes$Bool(snapshot)
; [eval] MemoryBlock$bytes(compute_address(place, root_address), Size$Bool$())
; [eval] compute_address(place, root_address)
; [eval] Size$Bool$()
(push) ; 3
(declare-const $k@636@01 $Perm)
(assert ($Perm.isReadVar $k@636@01))
(assert (< $k@636@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@636@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@636@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@634@01)) (compute_address<Address> place@631@01 root_address@632@01) (as Size$Bool$<Snap$Usize>  Snap$Usize)))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@636@01))
(assert (and
  (< $k@636@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@636@01))
  (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@634@01)) (compute_address<Address> place@631@01 root_address@632@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$Bool(snapshot)
(assert (=
  (MemoryBlock$bytes ($Snap.first ($Snap.second $t@634@01)) (compute_address<Address> place@631@01 root_address@632@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
  (to_bytes$Bool<Bytes> snapshot@633@01)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (OwnedNonAliased$Bool%trigger $t@634@01 place@631@01 root_address@632@01 snapshot@633@01))
; [eval] compute_address(place, root_address)
; [eval] Size$Bool$()
(pop) ; 2
(pop) ; 1
; ---------- into_memory_block$I64 ----------
(declare-const place@637@01 Place)
(declare-const root_address@638@01 Address)
(declare-const snapshot@639@01 Snap$I64)
(declare-const place@640@01 Place)
(declare-const root_address@641@01 Address)
(declare-const snapshot@642@01 Snap$I64)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@643@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
; [eval] compute_address(place, root_address)
; [eval] Size$I64$()
(declare-const $t@644@01 $Snap)
(pop) ; 2
(push) ; 2
; [exec]
; unfold acc(OwnedNonAliased$I64(place, root_address, snapshot), write)
(assert (= $t@643@01 ($Snap.combine ($Snap.first $t@643@01) ($Snap.second $t@643@01))))
(assert (= ($Snap.first $t@643@01) $Snap.unit))
; [eval] valid$Snap$I64(snapshot)
(assert (valid$Snap$I64<Bool> snapshot@642@01))
(assert (=
  ($Snap.second $t@643@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@643@01))
    ($Snap.second ($Snap.second $t@643@01)))))
; [eval] compute_address(place, root_address)
; [eval] Size$I64$()
(assert (= ($Snap.second ($Snap.second $t@643@01)) $Snap.unit))
; [eval] MemoryBlock$bytes(compute_address(place, root_address), Size$I64$()) == to_bytes$I64(snapshot)
; [eval] MemoryBlock$bytes(compute_address(place, root_address), Size$I64$())
; [eval] compute_address(place, root_address)
; [eval] Size$I64$()
(push) ; 3
(declare-const $k@645@01 $Perm)
(assert ($Perm.isReadVar $k@645@01))
(assert (< $k@645@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@645@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@645@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@643@01)) (compute_address<Address> place@640@01 root_address@641@01) (as Size$I64$<Snap$Usize>  Snap$Usize)))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@645@01))
(assert (and
  (< $k@645@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@645@01))
  (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@643@01)) (compute_address<Address> place@640@01 root_address@641@01) (as Size$I64$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$I64(snapshot)
(assert (=
  (MemoryBlock$bytes ($Snap.first ($Snap.second $t@643@01)) (compute_address<Address> place@640@01 root_address@641@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
  (to_bytes$I64<Bytes> snapshot@642@01)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (OwnedNonAliased$I64%trigger $t@643@01 place@640@01 root_address@641@01 snapshot@642@01))
; [eval] compute_address(place, root_address)
; [eval] Size$I64$()
(pop) ; 2
(pop) ; 1
; ---------- into_memory_block$Tuple$$$ ----------
(declare-const place@646@01 Place)
(declare-const root_address@647@01 Address)
(declare-const snapshot@648@01 Snap$Tuple$$$)
(declare-const place@649@01 Place)
(declare-const root_address@650@01 Address)
(declare-const snapshot@651@01 Snap$Tuple$$$)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@652@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
; [eval] compute_address(place, root_address)
; [eval] Size$Tuple$$$$()
(declare-const $t@653@01 $Snap)
(pop) ; 2
(push) ; 2
; [exec]
; unfold acc(OwnedNonAliased$Tuple$$$(place, root_address, snapshot), write)
(assert (= $t@652@01 ($Snap.combine ($Snap.first $t@652@01) ($Snap.second $t@652@01))))
(assert (= ($Snap.first $t@652@01) $Snap.unit))
; [eval] valid$Snap$Tuple$$$(snapshot)
(assert (valid$Snap$Tuple$$$<Bool> snapshot@651@01))
; [eval] compute_address(place, root_address)
; [eval] PaddingSize$Tuple$$$$()
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (OwnedNonAliased$Tuple$$$%trigger $t@652@01 place@649@01 root_address@650@01 snapshot@651@01))
; [exec]
; memory_block_join$Tuple$$$(compute_address(place, root_address), write)
; [eval] compute_address(place, root_address)
; [eval] none < permission_amount
; [eval] PaddingSize$Tuple$$$$()
(declare-const $t@654@01 $Snap)
(assert (= $t@654@01 ($Snap.combine ($Snap.first $t@654@01) ($Snap.second $t@654@01))))
; [eval] Size$Tuple$$$$()
(assert (= ($Snap.second $t@654@01) $Snap.unit))
; [eval] (forall snapshot: Snap$Tuple$$$ :: { to_bytes$Tuple$$$(snapshot) } MemoryBlock$bytes(address, Size$Tuple$$$$()) == to_bytes$Tuple$$$(snapshot))
(declare-const snapshot@655@01 Snap$Tuple$$$)
(set-option :timeout 0)
(push) ; 3
; [eval] MemoryBlock$bytes(address, Size$Tuple$$$$()) == to_bytes$Tuple$$$(snapshot)
; [eval] MemoryBlock$bytes(address, Size$Tuple$$$$())
; [eval] Size$Tuple$$$$()
(push) ; 4
(declare-const $k@656@01 $Perm)
(assert ($Perm.isReadVar $k@656@01))
(assert (< $k@656@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@656@01)))
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@656@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first $t@654@01) (compute_address<Address> place@649@01 root_address@650@01) (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))
(pop) ; 4
; Joined path conditions
(assert ($Perm.isReadVar $k@656@01))
(assert (and
  (< $k@656@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@656@01))
  (MemoryBlock$bytes%precondition ($Snap.first $t@654@01) (compute_address<Address> place@649@01 root_address@650@01) (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$Tuple$$$(snapshot)
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert ($Perm.isReadVar $k@656@01))
(assert (< $k@656@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@656@01)))
(assert (MemoryBlock$bytes%precondition ($Snap.first $t@654@01) (compute_address<Address> place@649@01 root_address@650@01) (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((snapshot@655@01 Snap$Tuple$$$)) (!
  (=
    (MemoryBlock$bytes ($Snap.first $t@654@01) (compute_address<Address> place@649@01 root_address@650@01) (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize))
    (to_bytes$Tuple$$$<Bytes> snapshot@655@01))
  :pattern ((to_bytes$Tuple$$$<Bytes> snapshot@655@01))
  :qid |prog.l1869|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] compute_address(place, root_address)
; [eval] Size$Tuple$$$$()
(pop) ; 2
(pop) ; 1
; ---------- lft_tok_sep_return$2 ----------
(declare-const lft@657@01 Lifetime)
(declare-const lft_1@658@01 Lifetime)
(declare-const lft_2@659@01 Lifetime)
(declare-const rd_perm@660@01 $Perm)
(declare-const lft@661@01 Lifetime)
(declare-const lft_1@662@01 Lifetime)
(declare-const lft_2@663@01 Lifetime)
(declare-const rd_perm@664@01 $Perm)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@665@01 $Snap)
(assert (= $t@665@01 ($Snap.combine ($Snap.first $t@665@01) ($Snap.second $t@665@01))))
(assert (= ($Snap.first $t@665@01) $Snap.unit))
; [eval] none < rd_perm
(assert (< $Perm.No rd_perm@664@01))
(assert (=
  ($Snap.second $t@665@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@665@01))
    ($Snap.second ($Snap.second $t@665@01)))))
(push) ; 2
(assert (not (or (= rd_perm@664@01 $Perm.No) (< $Perm.No rd_perm@664@01))))
(check-sat)
; unsat
(pop) ; 2
; 0.00s
; (get-info :all-statistics)
(assert (<= $Perm.No rd_perm@664@01))
(assert (= ($Snap.second ($Snap.second $t@665@01)) $Snap.unit))
; [eval] lft == intersect(Set(lft_1, lft_2))
; [eval] intersect(Set(lft_1, lft_2))
; [eval] Set(lft_1, lft_2)
(assert (=
  lft@661@01
  (intersect<Lifetime> (Set_unionone (Set_singleton lft_1@662@01) lft_2@663@01))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@666@01 $Snap)
(assert (= $t@666@01 ($Snap.combine ($Snap.first $t@666@01) ($Snap.second $t@666@01))))
(push) ; 3
(assert (not (or (= rd_perm@664@01 $Perm.No) (< $Perm.No rd_perm@664@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (or (= rd_perm@664@01 $Perm.No) (< $Perm.No rd_perm@664@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(push) ; 3
(set-option :timeout 10)
(assert (not (= lft_1@662@01 lft_2@663@01)))
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
(declare-const lft_1@667@01 Lifetime)
(declare-const lft_2@668@01 Lifetime)
(declare-const rd_perm@669@01 $Perm)
(declare-const lft@670@01 Lifetime)
(declare-const lft_1@671@01 Lifetime)
(declare-const lft_2@672@01 Lifetime)
(declare-const rd_perm@673@01 $Perm)
(declare-const lft@674@01 Lifetime)
(push) ; 1
(declare-const $t@675@01 $Snap)
(assert (= $t@675@01 ($Snap.combine ($Snap.first $t@675@01) ($Snap.second $t@675@01))))
(assert (= ($Snap.first $t@675@01) $Snap.unit))
; [eval] none < rd_perm
(assert (< $Perm.No rd_perm@673@01))
(assert (=
  ($Snap.second $t@675@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@675@01))
    ($Snap.second ($Snap.second $t@675@01)))))
(push) ; 2
(assert (not (or (= rd_perm@673@01 $Perm.No) (< $Perm.No rd_perm@673@01))))
(check-sat)
; unsat
(pop) ; 2
; 0.00s
; (get-info :all-statistics)
(assert (<= $Perm.No rd_perm@673@01))
(push) ; 2
(assert (not (or (= rd_perm@673@01 $Perm.No) (< $Perm.No rd_perm@673@01))))
(check-sat)
; unsat
(pop) ; 2
; 0.00s
; (get-info :all-statistics)
(push) ; 2
(set-option :timeout 10)
(assert (not (= lft_1@671@01 lft_2@672@01)))
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
(declare-const $t@676@01 $Snap)
(assert (= $t@676@01 ($Snap.combine ($Snap.first $t@676@01) ($Snap.second $t@676@01))))
(push) ; 3
(assert (not (or (= rd_perm@673@01 $Perm.No) (< $Perm.No rd_perm@673@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (= ($Snap.second $t@676@01) $Snap.unit))
; [eval] lft == intersect(Set(lft_1, lft_2))
; [eval] intersect(Set(lft_1, lft_2))
; [eval] Set(lft_1, lft_2)
(assert (=
  lft@674@01
  (intersect<Lifetime> (Set_unionone (Set_singleton lft_1@671@01) lft_2@672@01))))
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- memory_block_join$Tuple$$$ ----------
(declare-const address@677@01 Address)
(declare-const permission_amount@678@01 $Perm)
(declare-const address@679@01 Address)
(declare-const permission_amount@680@01 $Perm)
(push) ; 1
(declare-const $t@681@01 $Snap)
(assert (= $t@681@01 ($Snap.combine ($Snap.first $t@681@01) ($Snap.second $t@681@01))))
(assert (= ($Snap.first $t@681@01) $Snap.unit))
; [eval] none < permission_amount
(assert (< $Perm.No permission_amount@680@01))
; [eval] PaddingSize$Tuple$$$$()
(push) ; 2
(assert (not (or (= permission_amount@680@01 $Perm.No) (< $Perm.No permission_amount@680@01))))
(check-sat)
; unsat
(pop) ; 2
; 0.00s
; (get-info :all-statistics)
(assert (<= $Perm.No permission_amount@680@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@682@01 $Snap)
(assert (= $t@682@01 ($Snap.combine ($Snap.first $t@682@01) ($Snap.second $t@682@01))))
; [eval] Size$Tuple$$$$()
(assert (= ($Snap.second $t@682@01) $Snap.unit))
; [eval] (forall snapshot: Snap$Tuple$$$ :: { to_bytes$Tuple$$$(snapshot) } MemoryBlock$bytes(address, Size$Tuple$$$$()) == to_bytes$Tuple$$$(snapshot))
(declare-const snapshot@683@01 Snap$Tuple$$$)
(push) ; 3
; [eval] MemoryBlock$bytes(address, Size$Tuple$$$$()) == to_bytes$Tuple$$$(snapshot)
; [eval] MemoryBlock$bytes(address, Size$Tuple$$$$())
; [eval] Size$Tuple$$$$()
(push) ; 4
(declare-const $k@684@01 $Perm)
(assert ($Perm.isReadVar $k@684@01))
(assert (< $k@684@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@684@01)))
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@684@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first $t@682@01) address@679@01 (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))
(pop) ; 4
; Joined path conditions
(assert ($Perm.isReadVar $k@684@01))
(assert (and
  (< $k@684@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@684@01))
  (MemoryBlock$bytes%precondition ($Snap.first $t@682@01) address@679@01 (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$Tuple$$$(snapshot)
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert ($Perm.isReadVar $k@684@01))
(assert (< $k@684@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@684@01)))
(assert (MemoryBlock$bytes%precondition ($Snap.first $t@682@01) address@679@01 (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((snapshot@683@01 Snap$Tuple$$$)) (!
  (=
    (MemoryBlock$bytes ($Snap.first $t@682@01) address@679@01 (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize))
    (to_bytes$Tuple$$$<Bytes> snapshot@683@01))
  :pattern ((to_bytes$Tuple$$$<Bytes> snapshot@683@01))
  :qid |prog.l1869|)))
(pop) ; 2
(set-option :timeout 0)
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- memory_block_join$Tuple$$I64$Bool$$I64$Bool$ ----------
(declare-const address@685@01 Address)
(declare-const permission_amount@686@01 $Perm)
(declare-const address@687@01 Address)
(declare-const permission_amount@688@01 $Perm)
(push) ; 1
(declare-const $t@689@01 $Snap)
(assert (= $t@689@01 ($Snap.combine ($Snap.first $t@689@01) ($Snap.second $t@689@01))))
(assert (= ($Snap.first $t@689@01) $Snap.unit))
; [eval] none < permission_amount
(assert (< $Perm.No permission_amount@688@01))
(assert (=
  ($Snap.second $t@689@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@689@01))
    ($Snap.second ($Snap.second $t@689@01)))))
; [eval] PaddingSize$Tuple$$I64$Bool$$I64$Bool$$()
(push) ; 2
(assert (not (or (= permission_amount@688@01 $Perm.No) (< $Perm.No permission_amount@688@01))))
(check-sat)
; unsat
(pop) ; 2
; 0.00s
; (get-info :all-statistics)
(assert (<= $Perm.No permission_amount@688@01))
(assert (=
  ($Snap.second ($Snap.second $t@689@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@689@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@689@01))))))
; [eval] field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address)
; [eval] Size$I64$()
(push) ; 2
(assert (not (or (= permission_amount@688@01 $Perm.No) (< $Perm.No permission_amount@688@01))))
(check-sat)
; unsat
(pop) ; 2
; 0.00s
; (get-info :all-statistics)
(push) ; 2
(set-option :timeout 10)
(assert (not (and
  (=
    address@687@01
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@687@01))
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
(assert (not (or (= permission_amount@688@01 $Perm.No) (< $Perm.No permission_amount@688@01))))
(check-sat)
; unsat
(pop) ; 2
; 0.00s
; (get-info :all-statistics)
(push) ; 2
(set-option :timeout 10)
(assert (not (and
  (=
    address@687@01
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> address@687@01))
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
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@687@01)
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> address@687@01))
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
(declare-const $t@690@01 $Snap)
(assert (= $t@690@01 ($Snap.combine ($Snap.first $t@690@01) ($Snap.second $t@690@01))))
; [eval] Size$Tuple$$I64$Bool$$I64$Bool$$()
(assert (= ($Snap.second $t@690@01) $Snap.unit))
; [eval] (forall snapshot: Snap$Tuple$$I64$Bool$$I64$Bool$ :: { to_bytes$Tuple$$I64$Bool$$I64$Bool$(snapshot) } old(MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address), Size$I64$()) == to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot))) && old(MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address), Size$Bool$()) == to_bytes$Bool(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot))) ==> MemoryBlock$bytes(address, Size$Tuple$$I64$Bool$$I64$Bool$$()) == to_bytes$Tuple$$I64$Bool$$I64$Bool$(snapshot))
(declare-const snapshot@691@01 Snap$Tuple$$I64$Bool$$I64$Bool$)
(push) ; 3
; [eval] old(MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address), Size$I64$()) == to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot))) && old(MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address), Size$Bool$()) == to_bytes$Bool(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot))) ==> MemoryBlock$bytes(address, Size$Tuple$$I64$Bool$$I64$Bool$$()) == to_bytes$Tuple$$I64$Bool$$I64$Bool$(snapshot)
; [eval] old(MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address), Size$I64$()) == to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot))) && old(MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address), Size$Bool$()) == to_bytes$Bool(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot)))
; [eval] old(MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address), Size$I64$()) == to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot)))
; [eval] MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address), Size$I64$()) == to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot))
; [eval] MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address), Size$I64$())
; [eval] field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address)
; [eval] Size$I64$()
(push) ; 4
(declare-const $k@692@01 $Perm)
(assert ($Perm.isReadVar $k@692@01))
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= permission_amount@688@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (< $k@692@01 permission_amount@688@01))
(assert (<= $Perm.No (- permission_amount@688@01 $k@692@01)))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@692@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second ($Snap.second $t@689@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@687@01) (as Size$I64$<Snap$Usize>  Snap$Usize)))
(pop) ; 4
; Joined path conditions
(assert ($Perm.isReadVar $k@692@01))
(assert (and
  (< $k@692@01 permission_amount@688@01)
  (<= $Perm.No (- permission_amount@688@01 $k@692@01))
  (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second ($Snap.second $t@689@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@687@01) (as Size$I64$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot)
(set-option :timeout 0)
(push) ; 4
; [then-branch: 124 | MemoryBlock$bytes(First:(Second:(Second:($t@689@01))), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](address@687@01), Size$I64$[Snap$Usize]) == to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@691@01)) | live]
; [else-branch: 124 | MemoryBlock$bytes(First:(Second:(Second:($t@689@01))), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](address@687@01), Size$I64$[Snap$Usize]) != to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@691@01)) | live]
(push) ; 5
; [then-branch: 124 | MemoryBlock$bytes(First:(Second:(Second:($t@689@01))), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](address@687@01), Size$I64$[Snap$Usize]) == to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@691@01))]
(assert (=
  (MemoryBlock$bytes ($Snap.first ($Snap.second ($Snap.second $t@689@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@687@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
  (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@691@01))))
; [eval] old(MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address), Size$Bool$()) == to_bytes$Bool(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot)))
; [eval] MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address), Size$Bool$()) == to_bytes$Bool(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot))
; [eval] MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address), Size$Bool$())
; [eval] field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address)
; [eval] Size$Bool$()
(push) ; 6
(declare-const $k@693@01 $Perm)
(assert ($Perm.isReadVar $k@693@01))
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= permission_amount@688@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (< $k@693@01 permission_amount@688@01))
(assert (<= $Perm.No (- permission_amount@688@01 $k@693@01)))
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.No $k@693@01)))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.second ($Snap.second ($Snap.second $t@689@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> address@687@01) (as Size$Bool$<Snap$Usize>  Snap$Usize)))
(pop) ; 6
; Joined path conditions
(assert ($Perm.isReadVar $k@693@01))
(assert (and
  (< $k@693@01 permission_amount@688@01)
  (<= $Perm.No (- permission_amount@688@01 $k@693@01))
  (MemoryBlock$bytes%precondition ($Snap.second ($Snap.second ($Snap.second $t@689@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> address@687@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$Bool(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot)
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 124 | MemoryBlock$bytes(First:(Second:(Second:($t@689@01))), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](address@687@01), Size$I64$[Snap$Usize]) != to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@691@01))]
(assert (not
  (=
    (MemoryBlock$bytes ($Snap.first ($Snap.second ($Snap.second $t@689@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@687@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
    (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@691@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert ($Perm.isReadVar $k@693@01))
(assert (=>
  (=
    (MemoryBlock$bytes ($Snap.first ($Snap.second ($Snap.second $t@689@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@687@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
    (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@691@01)))
  (and
    (=
      (MemoryBlock$bytes ($Snap.first ($Snap.second ($Snap.second $t@689@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@687@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
      (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@691@01)))
    (< $k@693@01 permission_amount@688@01)
    (<= $Perm.No (- permission_amount@688@01 $k@693@01))
    (MemoryBlock$bytes%precondition ($Snap.second ($Snap.second ($Snap.second $t@689@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> address@687@01) (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
; Joined path conditions
(assert (or
  (not
    (=
      (MemoryBlock$bytes ($Snap.first ($Snap.second ($Snap.second $t@689@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@687@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
      (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@691@01))))
  (=
    (MemoryBlock$bytes ($Snap.first ($Snap.second ($Snap.second $t@689@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@687@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
    (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@691@01)))))
(push) ; 4
; [then-branch: 125 | MemoryBlock$bytes(Second:(Second:(Second:($t@689@01))), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Address](address@687@01), Size$Bool$[Snap$Usize]) == to_bytes$Bool[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](snapshot@691@01)) && MemoryBlock$bytes(First:(Second:(Second:($t@689@01))), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](address@687@01), Size$I64$[Snap$Usize]) == to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@691@01)) | live]
; [else-branch: 125 | !(MemoryBlock$bytes(Second:(Second:(Second:($t@689@01))), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Address](address@687@01), Size$Bool$[Snap$Usize]) == to_bytes$Bool[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](snapshot@691@01)) && MemoryBlock$bytes(First:(Second:(Second:($t@689@01))), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](address@687@01), Size$I64$[Snap$Usize]) == to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@691@01))) | live]
(push) ; 5
; [then-branch: 125 | MemoryBlock$bytes(Second:(Second:(Second:($t@689@01))), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Address](address@687@01), Size$Bool$[Snap$Usize]) == to_bytes$Bool[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](snapshot@691@01)) && MemoryBlock$bytes(First:(Second:(Second:($t@689@01))), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](address@687@01), Size$I64$[Snap$Usize]) == to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@691@01))]
(assert (and
  (=
    (MemoryBlock$bytes ($Snap.second ($Snap.second ($Snap.second $t@689@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> address@687@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
    (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@691@01)))
  (=
    (MemoryBlock$bytes ($Snap.first ($Snap.second ($Snap.second $t@689@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@687@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
    (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@691@01)))))
; [eval] MemoryBlock$bytes(address, Size$Tuple$$I64$Bool$$I64$Bool$$()) == to_bytes$Tuple$$I64$Bool$$I64$Bool$(snapshot)
; [eval] MemoryBlock$bytes(address, Size$Tuple$$I64$Bool$$I64$Bool$$())
; [eval] Size$Tuple$$I64$Bool$$I64$Bool$$()
(push) ; 6
(declare-const $k@694@01 $Perm)
(assert ($Perm.isReadVar $k@694@01))
(assert (< $k@694@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@694@01)))
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.No $k@694@01)))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first $t@690@01) address@687@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))
(pop) ; 6
; Joined path conditions
(assert ($Perm.isReadVar $k@694@01))
(assert (and
  (< $k@694@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@694@01))
  (MemoryBlock$bytes%precondition ($Snap.first $t@690@01) address@687@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$Tuple$$I64$Bool$$I64$Bool$(snapshot)
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 125 | !(MemoryBlock$bytes(Second:(Second:(Second:($t@689@01))), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Address](address@687@01), Size$Bool$[Snap$Usize]) == to_bytes$Bool[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](snapshot@691@01)) && MemoryBlock$bytes(First:(Second:(Second:($t@689@01))), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](address@687@01), Size$I64$[Snap$Usize]) == to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@691@01)))]
(assert (not
  (and
    (=
      (MemoryBlock$bytes ($Snap.second ($Snap.second ($Snap.second $t@689@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> address@687@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
      (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@691@01)))
    (=
      (MemoryBlock$bytes ($Snap.first ($Snap.second ($Snap.second $t@689@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@687@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
      (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@691@01))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert ($Perm.isReadVar $k@694@01))
(assert (=>
  (and
    (=
      (MemoryBlock$bytes ($Snap.second ($Snap.second ($Snap.second $t@689@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> address@687@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
      (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@691@01)))
    (=
      (MemoryBlock$bytes ($Snap.first ($Snap.second ($Snap.second $t@689@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@687@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
      (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@691@01))))
  (and
    (=
      (MemoryBlock$bytes ($Snap.second ($Snap.second ($Snap.second $t@689@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> address@687@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
      (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@691@01)))
    (=
      (MemoryBlock$bytes ($Snap.first ($Snap.second ($Snap.second $t@689@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@687@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
      (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@691@01)))
    (< $k@694@01 $Perm.Write)
    (<= $Perm.No (- $Perm.Write $k@694@01))
    (MemoryBlock$bytes%precondition ($Snap.first $t@690@01) address@687@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
; Joined path conditions
(assert (or
  (not
    (and
      (=
        (MemoryBlock$bytes ($Snap.second ($Snap.second ($Snap.second $t@689@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> address@687@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
        (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@691@01)))
      (=
        (MemoryBlock$bytes ($Snap.first ($Snap.second ($Snap.second $t@689@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@687@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
        (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@691@01)))))
  (and
    (=
      (MemoryBlock$bytes ($Snap.second ($Snap.second ($Snap.second $t@689@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> address@687@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
      (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@691@01)))
    (=
      (MemoryBlock$bytes ($Snap.first ($Snap.second ($Snap.second $t@689@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@687@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
      (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@691@01))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert ($Perm.isReadVar $k@692@01))
(assert ($Perm.isReadVar $k@693@01))
(assert ($Perm.isReadVar $k@694@01))
(assert (< $k@692@01 permission_amount@688@01))
(assert (<= $Perm.No (- permission_amount@688@01 $k@692@01)))
(assert (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second ($Snap.second $t@689@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@687@01) (as Size$I64$<Snap$Usize>  Snap$Usize)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((snapshot@691@01 Snap$Tuple$$I64$Bool$$I64$Bool$)) (!
  (and
    (=>
      (=
        (MemoryBlock$bytes ($Snap.first ($Snap.second ($Snap.second $t@689@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@687@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
        (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@691@01)))
      (and
        (=
          (MemoryBlock$bytes ($Snap.first ($Snap.second ($Snap.second $t@689@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@687@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
          (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@691@01)))
        (< $k@693@01 permission_amount@688@01)
        (<= $Perm.No (- permission_amount@688@01 $k@693@01))
        (MemoryBlock$bytes%precondition ($Snap.second ($Snap.second ($Snap.second $t@689@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> address@687@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))))
    (or
      (not
        (=
          (MemoryBlock$bytes ($Snap.first ($Snap.second ($Snap.second $t@689@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@687@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
          (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@691@01))))
      (=
        (MemoryBlock$bytes ($Snap.first ($Snap.second ($Snap.second $t@689@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@687@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
        (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@691@01))))
    (=>
      (and
        (=
          (MemoryBlock$bytes ($Snap.second ($Snap.second ($Snap.second $t@689@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> address@687@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
          (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@691@01)))
        (=
          (MemoryBlock$bytes ($Snap.first ($Snap.second ($Snap.second $t@689@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@687@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
          (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@691@01))))
      (and
        (=
          (MemoryBlock$bytes ($Snap.second ($Snap.second ($Snap.second $t@689@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> address@687@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
          (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@691@01)))
        (=
          (MemoryBlock$bytes ($Snap.first ($Snap.second ($Snap.second $t@689@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@687@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
          (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@691@01)))
        (< $k@694@01 $Perm.Write)
        (<= $Perm.No (- $Perm.Write $k@694@01))
        (MemoryBlock$bytes%precondition ($Snap.first $t@690@01) address@687@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize))))
    (or
      (not
        (and
          (=
            (MemoryBlock$bytes ($Snap.second ($Snap.second ($Snap.second $t@689@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> address@687@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
            (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@691@01)))
          (=
            (MemoryBlock$bytes ($Snap.first ($Snap.second ($Snap.second $t@689@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@687@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
            (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@691@01)))))
      (and
        (=
          (MemoryBlock$bytes ($Snap.second ($Snap.second ($Snap.second $t@689@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> address@687@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
          (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@691@01)))
        (=
          (MemoryBlock$bytes ($Snap.first ($Snap.second ($Snap.second $t@689@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@687@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
          (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@691@01))))))
  :pattern ((to_bytes$Tuple$$I64$Bool$$I64$Bool$<Bytes> snapshot@691@01))
  :qid |prog.l1883-aux|)))
(assert (forall ((snapshot@691@01 Snap$Tuple$$I64$Bool$$I64$Bool$)) (!
  (=>
    (and
      (=
        (MemoryBlock$bytes ($Snap.second ($Snap.second ($Snap.second $t@689@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> address@687@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
        (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@691@01)))
      (=
        (MemoryBlock$bytes ($Snap.first ($Snap.second ($Snap.second $t@689@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@687@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
        (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@691@01))))
    (=
      (MemoryBlock$bytes ($Snap.first $t@690@01) address@687@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize))
      (to_bytes$Tuple$$I64$Bool$$I64$Bool$<Bytes> snapshot@691@01)))
  :pattern ((to_bytes$Tuple$$I64$Bool$$I64$Bool$<Bytes> snapshot@691@01))
  :qid |prog.l1883|)))
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- memory_block_split$Tuple$$$ ----------
(declare-const address@695@01 Address)
(declare-const permission_amount@696@01 $Perm)
(declare-const address@697@01 Address)
(declare-const permission_amount@698@01 $Perm)
(push) ; 1
(declare-const $t@699@01 $Snap)
(assert (= $t@699@01 ($Snap.combine ($Snap.first $t@699@01) ($Snap.second $t@699@01))))
(assert (= ($Snap.first $t@699@01) $Snap.unit))
; [eval] none < permission_amount
(assert (< $Perm.No permission_amount@698@01))
; [eval] Size$Tuple$$$$()
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@700@01 $Snap)
(assert (= $t@700@01 ($Snap.combine ($Snap.first $t@700@01) ($Snap.second $t@700@01))))
; [eval] PaddingSize$Tuple$$$$()
(push) ; 3
(assert (not (or (= permission_amount@698@01 $Perm.No) (< $Perm.No permission_amount@698@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (<= $Perm.No permission_amount@698@01))
(assert (= ($Snap.second $t@700@01) $Snap.unit))
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- memory_block_split$Tuple$$I64$Bool$$I64$Bool$ ----------
(declare-const address@701@01 Address)
(declare-const permission_amount@702@01 $Perm)
(declare-const address@703@01 Address)
(declare-const permission_amount@704@01 $Perm)
(push) ; 1
(declare-const $t@705@01 $Snap)
(assert (= $t@705@01 ($Snap.combine ($Snap.first $t@705@01) ($Snap.second $t@705@01))))
(assert (= ($Snap.first $t@705@01) $Snap.unit))
; [eval] none < permission_amount
(assert (< $Perm.No permission_amount@704@01))
; [eval] Size$Tuple$$I64$Bool$$I64$Bool$$()
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@706@01 $Snap)
(assert (= $t@706@01 ($Snap.combine ($Snap.first $t@706@01) ($Snap.second $t@706@01))))
; [eval] PaddingSize$Tuple$$I64$Bool$$I64$Bool$$()
(push) ; 3
(assert (not (or (= permission_amount@704@01 $Perm.No) (< $Perm.No permission_amount@704@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (<= $Perm.No permission_amount@704@01))
(assert (=
  ($Snap.second $t@706@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@706@01))
    ($Snap.second ($Snap.second $t@706@01)))))
; [eval] field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address)
; [eval] Size$I64$()
(push) ; 3
(assert (not (or (= permission_amount@704@01 $Perm.No) (< $Perm.No permission_amount@704@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (=
    address@703@01
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@703@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second $t@706@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@706@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@706@01))))))
; [eval] field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address)
; [eval] Size$Bool$()
(set-option :timeout 0)
(push) ; 3
(assert (not (or (= permission_amount@704@01 $Perm.No) (< $Perm.No permission_amount@704@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (=
    address@703@01
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> address@703@01))
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
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@703@01)
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> address@703@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@706@01))) $Snap.unit))
; [eval] (forall snapshot: Snap$Tuple$$I64$Bool$$I64$Bool$ :: { to_bytes$Tuple$$I64$Bool$$I64$Bool$(snapshot) } old(MemoryBlock$bytes(address, Size$Tuple$$I64$Bool$$I64$Bool$$())) == to_bytes$Tuple$$I64$Bool$$I64$Bool$(snapshot) ==> MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address), Size$I64$()) == to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot)) && MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address), Size$Bool$()) == to_bytes$Bool(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot)))
(declare-const snapshot@707@01 Snap$Tuple$$I64$Bool$$I64$Bool$)
(set-option :timeout 0)
(push) ; 3
; [eval] old(MemoryBlock$bytes(address, Size$Tuple$$I64$Bool$$I64$Bool$$())) == to_bytes$Tuple$$I64$Bool$$I64$Bool$(snapshot) ==> MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address), Size$I64$()) == to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot)) && MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address), Size$Bool$()) == to_bytes$Bool(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot))
; [eval] old(MemoryBlock$bytes(address, Size$Tuple$$I64$Bool$$I64$Bool$$())) == to_bytes$Tuple$$I64$Bool$$I64$Bool$(snapshot)
; [eval] old(MemoryBlock$bytes(address, Size$Tuple$$I64$Bool$$I64$Bool$$()))
; [eval] MemoryBlock$bytes(address, Size$Tuple$$I64$Bool$$I64$Bool$$())
; [eval] Size$Tuple$$I64$Bool$$I64$Bool$$()
(push) ; 4
(declare-const $k@708@01 $Perm)
(assert ($Perm.isReadVar $k@708@01))
(assert (< $k@708@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@708@01)))
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@708@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.second $t@705@01) address@703@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))
(pop) ; 4
; Joined path conditions
(assert ($Perm.isReadVar $k@708@01))
(assert (and
  (< $k@708@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@708@01))
  (MemoryBlock$bytes%precondition ($Snap.second $t@705@01) address@703@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$Tuple$$I64$Bool$$I64$Bool$(snapshot)
(set-option :timeout 0)
(push) ; 4
; [then-branch: 126 | MemoryBlock$bytes(Second:($t@705@01), address@703@01, Size$Tuple$$I64$Bool$$I64$Bool$$[Snap$Usize]) == to_bytes$Tuple$$I64$Bool$$I64$Bool$[Bytes](snapshot@707@01) | live]
; [else-branch: 126 | MemoryBlock$bytes(Second:($t@705@01), address@703@01, Size$Tuple$$I64$Bool$$I64$Bool$$[Snap$Usize]) != to_bytes$Tuple$$I64$Bool$$I64$Bool$[Bytes](snapshot@707@01) | live]
(push) ; 5
; [then-branch: 126 | MemoryBlock$bytes(Second:($t@705@01), address@703@01, Size$Tuple$$I64$Bool$$I64$Bool$$[Snap$Usize]) == to_bytes$Tuple$$I64$Bool$$I64$Bool$[Bytes](snapshot@707@01)]
(assert (=
  (MemoryBlock$bytes ($Snap.second $t@705@01) address@703@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize))
  (to_bytes$Tuple$$I64$Bool$$I64$Bool$<Bytes> snapshot@707@01)))
; [eval] MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address), Size$I64$()) == to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot)) && MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address), Size$Bool$()) == to_bytes$Bool(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot))
; [eval] MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address), Size$I64$()) == to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot))
; [eval] MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address), Size$I64$())
; [eval] field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address)
; [eval] Size$I64$()
(push) ; 6
(declare-const $k@709@01 $Perm)
(assert ($Perm.isReadVar $k@709@01))
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= permission_amount@704@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (< $k@709@01 permission_amount@704@01))
(assert (<= $Perm.No (- permission_amount@704@01 $k@709@01)))
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.No $k@709@01)))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@706@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@703@01) (as Size$I64$<Snap$Usize>  Snap$Usize)))
(pop) ; 6
; Joined path conditions
(assert ($Perm.isReadVar $k@709@01))
(assert (and
  (< $k@709@01 permission_amount@704@01)
  (<= $Perm.No (- permission_amount@704@01 $k@709@01))
  (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@706@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@703@01) (as Size$I64$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot)
(set-option :timeout 0)
(push) ; 6
; [then-branch: 127 | MemoryBlock$bytes(First:(Second:($t@706@01)), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](address@703@01), Size$I64$[Snap$Usize]) == to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@707@01)) | live]
; [else-branch: 127 | MemoryBlock$bytes(First:(Second:($t@706@01)), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](address@703@01), Size$I64$[Snap$Usize]) != to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@707@01)) | live]
(push) ; 7
; [then-branch: 127 | MemoryBlock$bytes(First:(Second:($t@706@01)), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](address@703@01), Size$I64$[Snap$Usize]) == to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@707@01))]
(assert (=
  (MemoryBlock$bytes ($Snap.first ($Snap.second $t@706@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@703@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
  (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@707@01))))
; [eval] MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address), Size$Bool$()) == to_bytes$Bool(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot))
; [eval] MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address), Size$Bool$())
; [eval] field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address)
; [eval] Size$Bool$()
(push) ; 8
(declare-const $k@710@01 $Perm)
(assert ($Perm.isReadVar $k@710@01))
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= permission_amount@704@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (< $k@710@01 permission_amount@704@01))
(assert (<= $Perm.No (- permission_amount@704@01 $k@710@01)))
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (< $Perm.No $k@710@01)))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second ($Snap.second $t@706@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> address@703@01) (as Size$Bool$<Snap$Usize>  Snap$Usize)))
(pop) ; 8
; Joined path conditions
(assert ($Perm.isReadVar $k@710@01))
(assert (and
  (< $k@710@01 permission_amount@704@01)
  (<= $Perm.No (- permission_amount@704@01 $k@710@01))
  (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second ($Snap.second $t@706@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> address@703@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$Bool(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot)
(pop) ; 7
(set-option :timeout 0)
(push) ; 7
; [else-branch: 127 | MemoryBlock$bytes(First:(Second:($t@706@01)), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](address@703@01), Size$I64$[Snap$Usize]) != to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@707@01))]
(assert (not
  (=
    (MemoryBlock$bytes ($Snap.first ($Snap.second $t@706@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@703@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
    (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@707@01)))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert ($Perm.isReadVar $k@710@01))
(assert (=>
  (=
    (MemoryBlock$bytes ($Snap.first ($Snap.second $t@706@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@703@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
    (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@707@01)))
  (and
    (=
      (MemoryBlock$bytes ($Snap.first ($Snap.second $t@706@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@703@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
      (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@707@01)))
    (< $k@710@01 permission_amount@704@01)
    (<= $Perm.No (- permission_amount@704@01 $k@710@01))
    (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second ($Snap.second $t@706@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> address@703@01) (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
; Joined path conditions
(assert (or
  (not
    (=
      (MemoryBlock$bytes ($Snap.first ($Snap.second $t@706@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@703@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
      (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@707@01))))
  (=
    (MemoryBlock$bytes ($Snap.first ($Snap.second $t@706@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@703@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
    (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@707@01)))))
(pop) ; 5
(push) ; 5
; [else-branch: 126 | MemoryBlock$bytes(Second:($t@705@01), address@703@01, Size$Tuple$$I64$Bool$$I64$Bool$$[Snap$Usize]) != to_bytes$Tuple$$I64$Bool$$I64$Bool$[Bytes](snapshot@707@01)]
(assert (not
  (=
    (MemoryBlock$bytes ($Snap.second $t@705@01) address@703@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize))
    (to_bytes$Tuple$$I64$Bool$$I64$Bool$<Bytes> snapshot@707@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert ($Perm.isReadVar $k@709@01))
(assert ($Perm.isReadVar $k@710@01))
(assert (=>
  (=
    (MemoryBlock$bytes ($Snap.second $t@705@01) address@703@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize))
    (to_bytes$Tuple$$I64$Bool$$I64$Bool$<Bytes> snapshot@707@01))
  (and
    (=
      (MemoryBlock$bytes ($Snap.second $t@705@01) address@703@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize))
      (to_bytes$Tuple$$I64$Bool$$I64$Bool$<Bytes> snapshot@707@01))
    (< $k@709@01 permission_amount@704@01)
    (<= $Perm.No (- permission_amount@704@01 $k@709@01))
    (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@706@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@703@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
    (=>
      (=
        (MemoryBlock$bytes ($Snap.first ($Snap.second $t@706@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@703@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
        (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@707@01)))
      (and
        (=
          (MemoryBlock$bytes ($Snap.first ($Snap.second $t@706@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@703@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
          (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@707@01)))
        (< $k@710@01 permission_amount@704@01)
        (<= $Perm.No (- permission_amount@704@01 $k@710@01))
        (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second ($Snap.second $t@706@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> address@703@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))))
    (or
      (not
        (=
          (MemoryBlock$bytes ($Snap.first ($Snap.second $t@706@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@703@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
          (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@707@01))))
      (=
        (MemoryBlock$bytes ($Snap.first ($Snap.second $t@706@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@703@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
        (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@707@01)))))))
; Joined path conditions
(assert (or
  (not
    (=
      (MemoryBlock$bytes ($Snap.second $t@705@01) address@703@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize))
      (to_bytes$Tuple$$I64$Bool$$I64$Bool$<Bytes> snapshot@707@01)))
  (=
    (MemoryBlock$bytes ($Snap.second $t@705@01) address@703@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize))
    (to_bytes$Tuple$$I64$Bool$$I64$Bool$<Bytes> snapshot@707@01))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert ($Perm.isReadVar $k@708@01))
(assert ($Perm.isReadVar $k@709@01))
(assert ($Perm.isReadVar $k@710@01))
(assert (< $k@708@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@708@01)))
(assert (MemoryBlock$bytes%precondition ($Snap.second $t@705@01) address@703@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((snapshot@707@01 Snap$Tuple$$I64$Bool$$I64$Bool$)) (!
  (and
    (=>
      (=
        (MemoryBlock$bytes ($Snap.second $t@705@01) address@703@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize))
        (to_bytes$Tuple$$I64$Bool$$I64$Bool$<Bytes> snapshot@707@01))
      (and
        (=
          (MemoryBlock$bytes ($Snap.second $t@705@01) address@703@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize))
          (to_bytes$Tuple$$I64$Bool$$I64$Bool$<Bytes> snapshot@707@01))
        (< $k@709@01 permission_amount@704@01)
        (<= $Perm.No (- permission_amount@704@01 $k@709@01))
        (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@706@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@703@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
        (=>
          (=
            (MemoryBlock$bytes ($Snap.first ($Snap.second $t@706@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@703@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
            (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@707@01)))
          (and
            (=
              (MemoryBlock$bytes ($Snap.first ($Snap.second $t@706@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@703@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
              (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@707@01)))
            (< $k@710@01 permission_amount@704@01)
            (<= $Perm.No (- permission_amount@704@01 $k@710@01))
            (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second ($Snap.second $t@706@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> address@703@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))))
        (or
          (not
            (=
              (MemoryBlock$bytes ($Snap.first ($Snap.second $t@706@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@703@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
              (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@707@01))))
          (=
            (MemoryBlock$bytes ($Snap.first ($Snap.second $t@706@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@703@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
            (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@707@01))))))
    (or
      (not
        (=
          (MemoryBlock$bytes ($Snap.second $t@705@01) address@703@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize))
          (to_bytes$Tuple$$I64$Bool$$I64$Bool$<Bytes> snapshot@707@01)))
      (=
        (MemoryBlock$bytes ($Snap.second $t@705@01) address@703@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize))
        (to_bytes$Tuple$$I64$Bool$$I64$Bool$<Bytes> snapshot@707@01))))
  :pattern ((to_bytes$Tuple$$I64$Bool$$I64$Bool$<Bytes> snapshot@707@01))
  :qid |prog.l1910-aux|)))
(assert (forall ((snapshot@707@01 Snap$Tuple$$I64$Bool$$I64$Bool$)) (!
  (=>
    (=
      (MemoryBlock$bytes ($Snap.second $t@705@01) address@703@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize))
      (to_bytes$Tuple$$I64$Bool$$I64$Bool$<Bytes> snapshot@707@01))
    (and
      (=
        (MemoryBlock$bytes ($Snap.first ($Snap.second ($Snap.second $t@706@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> address@703@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
        (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@707@01)))
      (=
        (MemoryBlock$bytes ($Snap.first ($Snap.second $t@706@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@703@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
        (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@707@01)))))
  :pattern ((to_bytes$Tuple$$I64$Bool$$I64$Bool$<Bytes> snapshot@707@01))
  :qid |prog.l1910|)))
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- memory_copy$I64 ----------
(declare-const source_address@711@01 Address)
(declare-const target_address@712@01 Address)
(declare-const permission_amount@713@01 $Perm)
(declare-const source_address@714@01 Address)
(declare-const target_address@715@01 Address)
(declare-const permission_amount@716@01 $Perm)
(push) ; 1
(declare-const $t@717@01 $Snap)
(assert (= $t@717@01 ($Snap.combine ($Snap.first $t@717@01) ($Snap.second $t@717@01))))
(assert (= ($Snap.first $t@717@01) $Snap.unit))
; [eval] none < permission_amount
(assert (< $Perm.No permission_amount@716@01))
(assert (=
  ($Snap.second $t@717@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@717@01))
    ($Snap.second ($Snap.second $t@717@01)))))
; [eval] Size$I64$()
; [eval] Size$I64$()
(push) ; 2
(assert (not (or (= permission_amount@716@01 $Perm.No) (< $Perm.No permission_amount@716@01))))
(check-sat)
; unsat
(pop) ; 2
; 0.00s
; (get-info :all-statistics)
(push) ; 2
(set-option :timeout 10)
(assert (not (= target_address@715@01 source_address@714@01)))
(check-sat)
; unknown
(pop) ; 2
; 0.00s
; (get-info :all-statistics)
(assert (<= $Perm.No permission_amount@716@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@718@01 $Snap)
(assert (= $t@718@01 ($Snap.combine ($Snap.first $t@718@01) ($Snap.second $t@718@01))))
; [eval] Size$I64$()
(assert (=
  ($Snap.second $t@718@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@718@01))
    ($Snap.second ($Snap.second $t@718@01)))))
; [eval] Size$I64$()
(push) ; 3
(assert (not (or (= permission_amount@716@01 $Perm.No) (< $Perm.No permission_amount@716@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(push) ; 3
(set-option :timeout 10)
(assert (not (= target_address@715@01 source_address@714@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second $t@718@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@718@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@718@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@718@01))) $Snap.unit))
; [eval] MemoryBlock$bytes(source_address, Size$I64$()) == old(MemoryBlock$bytes(source_address, Size$I64$()))
; [eval] MemoryBlock$bytes(source_address, Size$I64$())
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 3
(declare-const $k@719@01 $Perm)
(assert ($Perm.isReadVar $k@719@01))
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= permission_amount@716@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (< $k@719@01 permission_amount@716@01))
(assert (<= $Perm.No (- permission_amount@716@01 $k@719@01)))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@719@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@718@01)) source_address@714@01 (as Size$I64$<Snap$Usize>  Snap$Usize)))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@719@01))
(assert (and
  (< $k@719@01 permission_amount@716@01)
  (<= $Perm.No (- permission_amount@716@01 $k@719@01))
  (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@718@01)) source_address@714@01 (as Size$I64$<Snap$Usize>  Snap$Usize))))
; [eval] old(MemoryBlock$bytes(source_address, Size$I64$()))
; [eval] MemoryBlock$bytes(source_address, Size$I64$())
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 3
(declare-const $k@720@01 $Perm)
(assert ($Perm.isReadVar $k@720@01))
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= permission_amount@716@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (< $k@720@01 permission_amount@716@01))
(assert (<= $Perm.No (- permission_amount@716@01 $k@720@01)))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@720@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.second ($Snap.second $t@717@01)) source_address@714@01 (as Size$I64$<Snap$Usize>  Snap$Usize)))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@720@01))
(assert (and
  (< $k@720@01 permission_amount@716@01)
  (<= $Perm.No (- permission_amount@716@01 $k@720@01))
  (MemoryBlock$bytes%precondition ($Snap.second ($Snap.second $t@717@01)) source_address@714@01 (as Size$I64$<Snap$Usize>  Snap$Usize))))
(assert (=
  (MemoryBlock$bytes ($Snap.first ($Snap.second $t@718@01)) source_address@714@01 (as Size$I64$<Snap$Usize>  Snap$Usize))
  (MemoryBlock$bytes ($Snap.second ($Snap.second $t@717@01)) source_address@714@01 (as Size$I64$<Snap$Usize>  Snap$Usize))))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@718@01))) $Snap.unit))
; [eval] MemoryBlock$bytes(target_address, Size$I64$()) == MemoryBlock$bytes(source_address, Size$I64$())
; [eval] MemoryBlock$bytes(target_address, Size$I64$())
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 3
(declare-const $k@721@01 $Perm)
(assert ($Perm.isReadVar $k@721@01))
(assert (< $k@721@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@721@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@721@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first $t@718@01) target_address@715@01 (as Size$I64$<Snap$Usize>  Snap$Usize)))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@721@01))
(assert (and
  (< $k@721@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@721@01))
  (MemoryBlock$bytes%precondition ($Snap.first $t@718@01) target_address@715@01 (as Size$I64$<Snap$Usize>  Snap$Usize))))
; [eval] MemoryBlock$bytes(source_address, Size$I64$())
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 3
(declare-const $k@722@01 $Perm)
(assert ($Perm.isReadVar $k@722@01))
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= permission_amount@716@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (< $k@722@01 permission_amount@716@01))
(assert (<= $Perm.No (- permission_amount@716@01 $k@722@01)))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@722@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@722@01))
(assert (and
  (< $k@722@01 permission_amount@716@01)
  (<= $Perm.No (- permission_amount@716@01 $k@722@01))))
(assert (=
  (MemoryBlock$bytes ($Snap.first $t@718@01) target_address@715@01 (as Size$I64$<Snap$Usize>  Snap$Usize))
  (MemoryBlock$bytes ($Snap.first ($Snap.second $t@718@01)) source_address@714@01 (as Size$I64$<Snap$Usize>  Snap$Usize))))
(pop) ; 2
(set-option :timeout 0)
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- move_place$I64 ----------
(declare-const target_place@723@01 Place)
(declare-const target_root_address@724@01 Address)
(declare-const source_place@725@01 Place)
(declare-const source_root_address@726@01 Address)
(declare-const source_snapshot@727@01 Snap$I64)
(declare-const target_place@728@01 Place)
(declare-const target_root_address@729@01 Address)
(declare-const source_place@730@01 Place)
(declare-const source_root_address@731@01 Address)
(declare-const source_snapshot@732@01 Snap$I64)
(push) ; 1
(declare-const $t@733@01 $Snap)
(assert (= $t@733@01 ($Snap.combine ($Snap.first $t@733@01) ($Snap.second $t@733@01))))
; [eval] compute_address(target_place, target_root_address)
; [eval] Size$I64$()
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@734@01 $Snap)
(assert (= $t@734@01 ($Snap.combine ($Snap.first $t@734@01) ($Snap.second $t@734@01))))
(assert (=
  ($Snap.second $t@734@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@734@01))
    ($Snap.second ($Snap.second $t@734@01)))))
; [eval] compute_address(source_place, source_root_address)
; [eval] Size$I64$()
(assert (= ($Snap.second ($Snap.second $t@734@01)) $Snap.unit))
; [eval] valid$Snap$I64(source_snapshot)
(assert (valid$Snap$I64<Bool> source_snapshot@732@01))
(pop) ; 2
(push) ; 2
; [exec]
; unfold acc(OwnedNonAliased$I64(source_place, source_root_address, source_snapshot), write)
(assert (=
  ($Snap.second $t@733@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@733@01))
    ($Snap.second ($Snap.second $t@733@01)))))
(assert (= ($Snap.first ($Snap.second $t@733@01)) $Snap.unit))
; [eval] valid$Snap$I64(snapshot)
(assert (valid$Snap$I64<Bool> source_snapshot@732@01))
(assert (=
  ($Snap.second ($Snap.second $t@733@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@733@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@733@01))))))
; [eval] compute_address(place, root_address)
; [eval] Size$I64$()
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> target_place@728@01 target_root_address@729@01)
  (compute_address<Address> source_place@730@01 source_root_address@731@01))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@733@01))) $Snap.unit))
; [eval] MemoryBlock$bytes(compute_address(place, root_address), Size$I64$()) == to_bytes$I64(snapshot)
; [eval] MemoryBlock$bytes(compute_address(place, root_address), Size$I64$())
; [eval] compute_address(place, root_address)
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
(assert (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second ($Snap.second $t@733@01))) (compute_address<Address> source_place@730@01 source_root_address@731@01) (as Size$I64$<Snap$Usize>  Snap$Usize)))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@735@01))
(assert (and
  (< $k@735@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@735@01))
  (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second ($Snap.second $t@733@01))) (compute_address<Address> source_place@730@01 source_root_address@731@01) (as Size$I64$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$I64(snapshot)
(assert (=
  (MemoryBlock$bytes ($Snap.first ($Snap.second ($Snap.second $t@733@01))) (compute_address<Address> source_place@730@01 source_root_address@731@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
  (to_bytes$I64<Bytes> source_snapshot@732@01)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (OwnedNonAliased$I64%trigger ($Snap.second $t@733@01) source_place@730@01 source_root_address@731@01 source_snapshot@732@01))
; [exec]
; memory_copy$I64(compute_address(source_place, source_root_address), compute_address(target_place,
;   target_root_address), write)
; [eval] compute_address(source_place, source_root_address)
; [eval] compute_address(target_place, target_root_address)
; [eval] none < permission_amount
; [eval] Size$I64$()
; [eval] Size$I64$()
(declare-const $t@736@01 $Snap)
(assert (= $t@736@01 ($Snap.combine ($Snap.first $t@736@01) ($Snap.second $t@736@01))))
; [eval] Size$I64$()
(assert (=
  ($Snap.second $t@736@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@736@01))
    ($Snap.second ($Snap.second $t@736@01)))))
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> target_place@728@01 target_root_address@729@01)
  (compute_address<Address> source_place@730@01 source_root_address@731@01))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second $t@736@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@736@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@736@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@736@01))) $Snap.unit))
; [eval] MemoryBlock$bytes(source_address, Size$I64$()) == old(MemoryBlock$bytes(source_address, Size$I64$()))
; [eval] MemoryBlock$bytes(source_address, Size$I64$())
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
(assert (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@736@01)) (compute_address<Address> source_place@730@01 source_root_address@731@01) (as Size$I64$<Snap$Usize>  Snap$Usize)))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@737@01))
(assert (and
  (< $k@737@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@737@01))
  (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@736@01)) (compute_address<Address> source_place@730@01 source_root_address@731@01) (as Size$I64$<Snap$Usize>  Snap$Usize))))
; [eval] old(MemoryBlock$bytes(source_address, Size$I64$()))
; [eval] MemoryBlock$bytes(source_address, Size$I64$())
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 3
(declare-const $k@738@01 $Perm)
(assert ($Perm.isReadVar $k@738@01))
(assert (< $k@738@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@738@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@738@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@738@01))
(assert (and (< $k@738@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@738@01))))
(assert (=
  (MemoryBlock$bytes ($Snap.first ($Snap.second $t@736@01)) (compute_address<Address> source_place@730@01 source_root_address@731@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
  (MemoryBlock$bytes ($Snap.first ($Snap.second ($Snap.second $t@733@01))) (compute_address<Address> source_place@730@01 source_root_address@731@01) (as Size$I64$<Snap$Usize>  Snap$Usize))))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@736@01))) $Snap.unit))
; [eval] MemoryBlock$bytes(target_address, Size$I64$()) == MemoryBlock$bytes(source_address, Size$I64$())
; [eval] MemoryBlock$bytes(target_address, Size$I64$())
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 3
(declare-const $k@739@01 $Perm)
(assert ($Perm.isReadVar $k@739@01))
(assert (< $k@739@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@739@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@739@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first $t@736@01) (compute_address<Address> target_place@728@01 target_root_address@729@01) (as Size$I64$<Snap$Usize>  Snap$Usize)))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@739@01))
(assert (and
  (< $k@739@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@739@01))
  (MemoryBlock$bytes%precondition ($Snap.first $t@736@01) (compute_address<Address> target_place@728@01 target_root_address@729@01) (as Size$I64$<Snap$Usize>  Snap$Usize))))
; [eval] MemoryBlock$bytes(source_address, Size$I64$())
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 3
(declare-const $k@740@01 $Perm)
(assert ($Perm.isReadVar $k@740@01))
(assert (< $k@740@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@740@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@740@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@740@01))
(assert (and (< $k@740@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@740@01))))
(assert (=
  (MemoryBlock$bytes ($Snap.first $t@736@01) (compute_address<Address> target_place@728@01 target_root_address@729@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
  (MemoryBlock$bytes ($Snap.first ($Snap.second $t@736@01)) (compute_address<Address> source_place@730@01 source_root_address@731@01) (as Size$I64$<Snap$Usize>  Snap$Usize))))
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
(declare-const $k@741@01 $Perm)
(assert ($Perm.isReadVar $k@741@01))
(assert (< $k@741@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@741@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@741@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@741@01))
(assert (and (< $k@741@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@741@01))))
; [eval] to_bytes$I64(snapshot)
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  (MemoryBlock$bytes ($Snap.first $t@736@01) (compute_address<Address> target_place@728@01 target_root_address@729@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
  (to_bytes$I64<Bytes> source_snapshot@732@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (=
  (MemoryBlock$bytes ($Snap.first $t@736@01) (compute_address<Address> target_place@728@01 target_root_address@729@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
  (to_bytes$I64<Bytes> source_snapshot@732@01)))
(assert (OwnedNonAliased$I64%trigger ($Snap.combine
  $Snap.unit
  ($Snap.combine ($Snap.first $t@736@01) $Snap.unit)) target_place@728@01 target_root_address@729@01 source_snapshot@732@01))
; [eval] compute_address(source_place, source_root_address)
; [eval] Size$I64$()
; [eval] valid$Snap$I64(source_snapshot)
(pop) ; 2
(pop) ; 1
; ---------- write_address_constant$Bool ----------
(declare-const target_address@742@01 Address)
(declare-const source_snapshot@743@01 Snap$Bool)
(declare-const target_address@744@01 Address)
(declare-const source_snapshot@745@01 Snap$Bool)
(push) ; 1
; [eval] Size$Bool$()
(declare-const $t@746@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@747@01 $Snap)
(assert (= $t@747@01 ($Snap.combine ($Snap.first $t@747@01) ($Snap.second $t@747@01))))
; [eval] Size$Bool$()
(assert (= ($Snap.second $t@747@01) $Snap.unit))
; [eval] MemoryBlock$bytes(target_address, Size$Bool$()) == to_bytes$Bool(source_snapshot)
; [eval] MemoryBlock$bytes(target_address, Size$Bool$())
; [eval] Size$Bool$()
(push) ; 3
(declare-const $k@748@01 $Perm)
(assert ($Perm.isReadVar $k@748@01))
(assert (< $k@748@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@748@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@748@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first $t@747@01) target_address@744@01 (as Size$Bool$<Snap$Usize>  Snap$Usize)))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@748@01))
(assert (and
  (< $k@748@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@748@01))
  (MemoryBlock$bytes%precondition ($Snap.first $t@747@01) target_address@744@01 (as Size$Bool$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$Bool(source_snapshot)
(assert (=
  (MemoryBlock$bytes ($Snap.first $t@747@01) target_address@744@01 (as Size$Bool$<Snap$Usize>  Snap$Usize))
  (to_bytes$Bool<Bytes> source_snapshot@745@01)))
(pop) ; 2
(set-option :timeout 0)
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- write_address_constant$I64 ----------
(declare-const target_address@749@01 Address)
(declare-const source_snapshot@750@01 Snap$I64)
(declare-const target_address@751@01 Address)
(declare-const source_snapshot@752@01 Snap$I64)
(push) ; 1
; [eval] Size$I64$()
(declare-const $t@753@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@754@01 $Snap)
(assert (= $t@754@01 ($Snap.combine ($Snap.first $t@754@01) ($Snap.second $t@754@01))))
; [eval] Size$I64$()
(assert (= ($Snap.second $t@754@01) $Snap.unit))
; [eval] MemoryBlock$bytes(target_address, Size$I64$()) == to_bytes$I64(source_snapshot)
; [eval] MemoryBlock$bytes(target_address, Size$I64$())
; [eval] Size$I64$()
(push) ; 3
(declare-const $k@755@01 $Perm)
(assert ($Perm.isReadVar $k@755@01))
(assert (< $k@755@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@755@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@755@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first $t@754@01) target_address@751@01 (as Size$I64$<Snap$Usize>  Snap$Usize)))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@755@01))
(assert (and
  (< $k@755@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@755@01))
  (MemoryBlock$bytes%precondition ($Snap.first $t@754@01) target_address@751@01 (as Size$I64$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$I64(source_snapshot)
(assert (=
  (MemoryBlock$bytes ($Snap.first $t@754@01) target_address@751@01 (as Size$I64$<Snap$Usize>  Snap$Usize))
  (to_bytes$I64<Bytes> source_snapshot@752@01)))
(pop) ; 2
(set-option :timeout 0)
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- write_place_constant$Bool ----------
(declare-const target_place@756@01 Place)
(declare-const target_root_address@757@01 Address)
(declare-const source_snapshot@758@01 Snap$Bool)
(declare-const target_place@759@01 Place)
(declare-const target_root_address@760@01 Address)
(declare-const source_snapshot@761@01 Snap$Bool)
(push) ; 1
(declare-const $t@762@01 $Snap)
(assert (= $t@762@01 ($Snap.combine ($Snap.first $t@762@01) ($Snap.second $t@762@01))))
; [eval] compute_address(target_place, target_root_address)
; [eval] Size$Bool$()
(assert (= ($Snap.second $t@762@01) $Snap.unit))
; [eval] valid$Snap$Bool(source_snapshot)
(assert (valid$Snap$Bool<Bool> source_snapshot@761@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@763@01 $Snap)
(pop) ; 2
(push) ; 2
; [exec]
; write_address_constant$Bool(compute_address(target_place, target_root_address),
;   source_snapshot)
; [eval] compute_address(target_place, target_root_address)
; [eval] Size$Bool$()
(declare-const $t@764@01 $Snap)
(assert (= $t@764@01 ($Snap.combine ($Snap.first $t@764@01) ($Snap.second $t@764@01))))
; [eval] Size$Bool$()
(assert (= ($Snap.second $t@764@01) $Snap.unit))
; [eval] MemoryBlock$bytes(target_address, Size$Bool$()) == to_bytes$Bool(source_snapshot)
; [eval] MemoryBlock$bytes(target_address, Size$Bool$())
; [eval] Size$Bool$()
(push) ; 3
(declare-const $k@765@01 $Perm)
(assert ($Perm.isReadVar $k@765@01))
(assert (< $k@765@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@765@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@765@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first $t@764@01) (compute_address<Address> target_place@759@01 target_root_address@760@01) (as Size$Bool$<Snap$Usize>  Snap$Usize)))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@765@01))
(assert (and
  (< $k@765@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@765@01))
  (MemoryBlock$bytes%precondition ($Snap.first $t@764@01) (compute_address<Address> target_place@759@01 target_root_address@760@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$Bool(source_snapshot)
(assert (=
  (MemoryBlock$bytes ($Snap.first $t@764@01) (compute_address<Address> target_place@759@01 target_root_address@760@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
  (to_bytes$Bool<Bytes> source_snapshot@761@01)))
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
(declare-const $k@766@01 $Perm)
(assert ($Perm.isReadVar $k@766@01))
(assert (< $k@766@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@766@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@766@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@766@01))
(assert (and (< $k@766@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@766@01))))
; [eval] to_bytes$Bool(snapshot)
(assert (OwnedNonAliased$Bool%trigger ($Snap.combine
  $Snap.unit
  ($Snap.combine ($Snap.first $t@764@01) $Snap.unit)) target_place@759@01 target_root_address@760@01 source_snapshot@761@01))
(pop) ; 2
(pop) ; 1
; ---------- write_place_constant$Tuple$$$ ----------
(declare-const target_place@767@01 Place)
(declare-const target_root_address@768@01 Address)
(declare-const source_snapshot@769@01 Snap$Tuple$$$)
(declare-const target_place@770@01 Place)
(declare-const target_root_address@771@01 Address)
(declare-const source_snapshot@772@01 Snap$Tuple$$$)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@773@01 $Snap)
(assert (= $t@773@01 ($Snap.combine ($Snap.first $t@773@01) ($Snap.second $t@773@01))))
; [eval] compute_address(target_place, target_root_address)
; [eval] Size$Tuple$$$$()
(assert (= ($Snap.second $t@773@01) $Snap.unit))
; [eval] valid$Snap$Tuple$$$(source_snapshot)
(assert (valid$Snap$Tuple$$$<Bool> source_snapshot@772@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@774@01 $Snap)
(pop) ; 2
(push) ; 2
; [exec]
; memory_block_split$Tuple$$$(compute_address(target_place, target_root_address),
;   write)
; [eval] compute_address(target_place, target_root_address)
; [eval] none < permission_amount
; [eval] Size$Tuple$$$$()
(declare-const $t@775@01 $Snap)
(assert (= $t@775@01 ($Snap.combine ($Snap.first $t@775@01) ($Snap.second $t@775@01))))
; [eval] PaddingSize$Tuple$$$$()
(assert (= ($Snap.second $t@775@01) $Snap.unit))
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
  ($Snap.first $t@775@01)) target_place@770@01 target_root_address@771@01 source_snapshot@772@01))
(pop) ; 2
(pop) ; 1
