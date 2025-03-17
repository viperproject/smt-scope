(get-info :version)
; (:version "4.12.1")
; Started: 2023-10-31 14:07:53
; Silicon.version: 1.1-SNAPSHOT (46944a65@dspil_symbenchmarking)
; Input file: /home/pcorrect/repos/benchmarking_general/silicon_tests/prusti_tests_._pass_._lemma_._lemma.rs_add_3-CoreProof.vpr
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
(declare-sort Snap$Never 0)
(declare-sort Bytes 0)
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
(declare-fun $SortWrappers.Snap$NeverTo$Snap (Snap$Never) $Snap)
(declare-fun $SortWrappers.$SnapToSnap$Never ($Snap) Snap$Never)
(assert (forall ((x Snap$Never)) (!
    (= x ($SortWrappers.$SnapToSnap$Never($SortWrappers.Snap$NeverTo$Snap x)))
    :pattern (($SortWrappers.Snap$NeverTo$Snap x))
    :qid |$Snap.$SnapToSnap$NeverTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Snap$NeverTo$Snap($SortWrappers.$SnapToSnap$Never x)))
    :pattern (($SortWrappers.$SnapToSnap$Never x))
    :qid |$Snap.Snap$NeverTo$SnapToSnap$Never|
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
(declare-const Size$I64$<Snap$Usize> Snap$Usize)
(declare-const Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize> Snap$Usize)
(declare-const Size$Bool$<Snap$Usize> Snap$Usize)
(declare-const Size$Tuple$$$$<Snap$Usize> Snap$Usize)
(declare-const PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize> Snap$Usize)
(declare-const Size$Never$<Snap$Usize> Snap$Usize)
(declare-const PaddingSize$Tuple$$$$<Snap$Usize> Snap$Usize)
(declare-const _1$place<Place> Place)
(declare-const _3$place<Place> Place)
(declare-const _2$place<Place> Place)
(declare-const _0$place<Place> Place)
(declare-const _9$place<Place> Place)
(declare-fun field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (Place) Place)
(declare-fun field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (Place) Place)
(declare-const _10$place<Place> Place)
(declare-const _8$place<Place> Place)
(declare-const _11$place<Place> Place)
(declare-const _7$place<Place> Place)
(declare-const _14$place<Place> Place)
(declare-const _15$place<Place> Place)
(declare-const _13$place<Place> Place)
(declare-const _12$place<Place> Place)
(declare-const _6$place<Place> Place)
(declare-const _5$place<Place> Place)
(declare-const _4$place<Place> Place)
(declare-const _19$place<Place> Place)
(declare-const _20$place<Place> Place)
(declare-const _18$place<Place> Place)
(declare-const _17$place<Place> Place)
(declare-const _21$place<Place> Place)
(declare-const constructor$Snap$Tuple$$$$<Snap$Tuple$$$> Snap$Tuple$$$)
(declare-fun valid$Snap$Tuple$$$<Bool> (Snap$Tuple$$$) Bool)
(declare-fun to_bytes$Tuple$$$<Bytes> (Snap$Tuple$$$) Bytes)
(declare-fun constructor$Snap$Tuple$$I64$Bool$$I64$Bool$$<Snap$Tuple$$I64$Bool$$I64$Bool$> (Snap$I64 Snap$Bool) Snap$Tuple$$I64$Bool$$I64$Bool$)
(declare-fun destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> (Snap$Tuple$$I64$Bool$$I64$Bool$) Snap$I64)
(declare-fun destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> (Snap$Tuple$$I64$Bool$$I64$Bool$) Snap$Bool)
(declare-fun valid$Snap$Tuple$$I64$Bool$$I64$Bool$<Bool> (Snap$Tuple$$I64$Bool$$I64$Bool$) Bool)
(declare-fun to_bytes$Tuple$$I64$Bool$$I64$Bool$<Bytes> (Snap$Tuple$$I64$Bool$$I64$Bool$) Bytes)
(declare-const constructor$Snap$Never$<Snap$Never> Snap$Never)
(declare-fun valid$Snap$Never<Bool> (Snap$Never) Bool)
(declare-fun constructor$Snap$Usize$<Snap$Usize> (Int) Snap$Usize)
(declare-fun destructor$Snap$Usize$$value<Int> (Snap$Usize) Int)
(declare-fun valid$Snap$Usize<Bool> (Snap$Usize) Bool)
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
(declare-fun constructor$Snap$Bool$<Snap$Bool> (Bool) Snap$Bool)
(declare-fun destructor$Snap$Bool$$value<Bool> (Snap$Bool) Bool)
(declare-fun valid$Snap$Bool<Bool> (Snap$Bool) Bool)
(declare-fun constructor$Snap$Bool$EqCmp_I64<Snap$Bool> (Snap$I64 Snap$I64) Snap$Bool)
(declare-fun destructor$Snap$Bool$EqCmp_I64$left<Snap$I64> (Snap$Bool) Snap$I64)
(declare-fun destructor$Snap$Bool$EqCmp_I64$right<Snap$I64> (Snap$Bool) Snap$I64)
(declare-fun to_bytes$Bool<Bytes> (Snap$Bool) Bytes)
(declare-fun constructor$Snap$Bool$LtCmp_I64<Snap$Bool> (Snap$I64 Snap$I64) Snap$Bool)
(declare-fun destructor$Snap$Bool$LtCmp_I64$left<Snap$I64> (Snap$Bool) Snap$I64)
(declare-fun destructor$Snap$Bool$LtCmp_I64$right<Snap$I64> (Snap$Bool) Snap$I64)
(declare-fun constructor$Snap$Bool$GeCmp_I64<Snap$Bool> (Snap$I64 Snap$I64) Snap$Bool)
(declare-fun destructor$Snap$Bool$GeCmp_I64$left<Snap$I64> (Snap$Bool) Snap$I64)
(declare-fun destructor$Snap$Bool$GeCmp_I64$right<Snap$I64> (Snap$Bool) Snap$I64)
(declare-fun constructor$Snap$Bool$Not_Bool<Snap$Bool> (Snap$Bool) Snap$Bool)
(declare-fun destructor$Snap$Bool$Not_Bool$argument<Snap$Bool> (Snap$Bool) Snap$Bool)
(declare-const basic_block_marker$start_label$marker<Bool> Bool)
(declare-const basic_block_marker$label_entry$marker<Bool> Bool)
(declare-const basic_block_marker$label_bb0$marker<Bool> Bool)
(declare-const basic_block_marker$label_2_custom$marker<Bool> Bool)
(declare-const basic_block_marker$label_bb1$marker<Bool> Bool)
(declare-const basic_block_marker$label_1_custom$marker<Bool> Bool)
(declare-const basic_block_marker$label_bb2$marker<Bool> Bool)
(declare-const basic_block_marker$label_bb6$marker<Bool> Bool)
(declare-const basic_block_marker$label_4_custom$marker<Bool> Bool)
(declare-const basic_block_marker$label_bb4$marker<Bool> Bool)
(declare-const basic_block_marker$label_bb7$marker<Bool> Bool)
(declare-const basic_block_marker$label_3_custom$marker<Bool> Bool)
(declare-const basic_block_marker$label_bb3$marker<Bool> Bool)
(declare-const basic_block_marker$label_bb5$marker<Bool> Bool)
(declare-const basic_block_marker$label_6_custom$marker<Bool> Bool)
(declare-const basic_block_marker$label_bb8$marker<Bool> Bool)
(declare-const basic_block_marker$label_5_custom$marker<Bool> Bool)
(declare-const basic_block_marker$label_bb9$marker<Bool> Bool)
(declare-const basic_block_marker$label_bb10$marker<Bool> Bool)
(declare-const basic_block_marker$label_9_custom$marker<Bool> Bool)
(declare-const basic_block_marker$label_8_custom$marker<Bool> Bool)
(declare-const basic_block_marker$label_bb11$marker<Bool> Bool)
(declare-const basic_block_marker$label_bb14$marker<Bool> Bool)
(declare-const basic_block_marker$resume_panic_label$marker<Bool> Bool)
(declare-const basic_block_marker$label_bb12$marker<Bool> Bool)
(declare-const basic_block_marker$label_bb13$marker<Bool> Bool)
(declare-const basic_block_marker$return_label$marker<Bool> Bool)
(declare-const basic_block_marker$end_label$marker<Bool> Bool)
(declare-fun included<Bool> (Lifetime Lifetime) Bool)
(declare-fun intersect<Lifetime> (Set<Lifetime>) Lifetime)
(declare-fun compute_address<Address> (Place Address) Address)
; Declaring symbols related to program functions (from program analysis)
(declare-fun MemoryBlock$bytes ($Snap Address Snap$Usize) Bytes)
(declare-fun MemoryBlock$bytes%limited ($Snap Address Snap$Usize) Bytes)
(declare-fun MemoryBlock$bytes%stateless (Address Snap$Usize) Bool)
(declare-fun MemoryBlock$bytes%precondition ($Snap Address Snap$Usize) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun OwnedNonAliased$Tuple$$I64$Bool$$I64$Bool$%trigger ($Snap Place Address Snap$Tuple$$I64$Bool$$I64$Bool$) Bool)
(declare-fun OwnedNonAliased$Tuple$$$%trigger ($Snap Place Address Snap$Tuple$$$) Bool)
(declare-fun OwnedNonAliased$I64%trigger ($Snap Place Address Snap$I64) Bool)
(declare-fun OwnedNonAliased$Bool%trigger ($Snap Place Address Snap$Bool) Bool)
(declare-fun DeadLifetimeToken%trigger ($Snap Lifetime) Bool)
(declare-fun LifetimeToken%trigger ($Snap Lifetime) Bool)
(declare-fun MemoryBlock%trigger ($Snap Address Snap$Usize) Bool)
(declare-fun MemoryBlockStackDrop%trigger ($Snap Address Snap$Usize) Bool)
; ////////// Uniqueness assumptions from domains
(assert (distinct _3$place<Place> _9$place<Place> _0$place<Place> _17$place<Place> _5$place<Place> _10$place<Place> _2$place<Place> _15$place<Place> _4$place<Place> _20$place<Place> _7$place<Place> _14$place<Place> _1$place<Place> _13$place<Place> _21$place<Place> _8$place<Place> _19$place<Place> _11$place<Place> _12$place<Place> _18$place<Place> _6$place<Place>))
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
(assert (valid$Snap$Tuple$$$<Bool> (as constructor$Snap$Tuple$$$$<Snap$Tuple$$$>  Snap$Tuple$$$)))
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
(assert (not
  (valid$Snap$Never<Bool> (as constructor$Snap$Never$<Snap$Never>  Snap$Never))))
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
(assert (forall ((constant Bool)) (!
  (=>
    (valid$Snap$Bool<Bool> (constructor$Snap$Bool$<Snap$Bool> constant))
    (=
      (constructor$Snap$Bool$Not_Bool<Snap$Bool> (constructor$Snap$Bool$<Snap$Bool> constant))
      (constructor$Snap$Bool$<Snap$Bool> (not constant))))
  :pattern ((constructor$Snap$Bool$Not_Bool<Snap$Bool> (constructor$Snap$Bool$<Snap$Bool> constant)))
  :qid |prog.Not_Bool$simplification_axiom|)))
(assert (forall ((value Snap$Bool)) (!
  (=
    (destructor$Snap$Bool$$value<Bool> (constructor$Snap$Bool$Not_Bool<Snap$Bool> value))
    (not (destructor$Snap$Bool$$value<Bool> value)))
  :pattern ((destructor$Snap$Bool$$value<Bool> (constructor$Snap$Bool$Not_Bool<Snap$Bool> value)))
  :qid |prog.Not_Bool$eval_axiom|)))
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
(assert (forall ((address Address)) (!
  (= (compute_address<Address> (as _1$place<Place>  Place) address) address)
  :pattern ((compute_address<Address> (as _1$place<Place>  Place) address))
  :qid |prog.root$1$compute_address_axiom|)))
(assert (forall ((address Address)) (!
  (= (compute_address<Address> (as _3$place<Place>  Place) address) address)
  :pattern ((compute_address<Address> (as _3$place<Place>  Place) address))
  :qid |prog.root$2$compute_address_axiom|)))
(assert (forall ((address Address)) (!
  (= (compute_address<Address> (as _2$place<Place>  Place) address) address)
  :pattern ((compute_address<Address> (as _2$place<Place>  Place) address))
  :qid |prog.root$3$compute_address_axiom|)))
(assert (forall ((address Address)) (!
  (= (compute_address<Address> (as _0$place<Place>  Place) address) address)
  :pattern ((compute_address<Address> (as _0$place<Place>  Place) address))
  :qid |prog.root$4$compute_address_axiom|)))
(assert (forall ((address Address)) (!
  (= (compute_address<Address> (as _9$place<Place>  Place) address) address)
  :pattern ((compute_address<Address> (as _9$place<Place>  Place) address))
  :qid |prog.root$5$compute_address_axiom|)))
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
  (= (compute_address<Address> (as _10$place<Place>  Place) address) address)
  :pattern ((compute_address<Address> (as _10$place<Place>  Place) address))
  :qid |prog.root$6$compute_address_axiom|)))
(assert (forall ((address Address)) (!
  (= (compute_address<Address> (as _8$place<Place>  Place) address) address)
  :pattern ((compute_address<Address> (as _8$place<Place>  Place) address))
  :qid |prog.root$7$compute_address_axiom|)))
(assert (forall ((address Address)) (!
  (= (compute_address<Address> (as _11$place<Place>  Place) address) address)
  :pattern ((compute_address<Address> (as _11$place<Place>  Place) address))
  :qid |prog.root$8$compute_address_axiom|)))
(assert (forall ((address Address)) (!
  (= (compute_address<Address> (as _7$place<Place>  Place) address) address)
  :pattern ((compute_address<Address> (as _7$place<Place>  Place) address))
  :qid |prog.root$9$compute_address_axiom|)))
(assert (forall ((address Address)) (!
  (= (compute_address<Address> (as _14$place<Place>  Place) address) address)
  :pattern ((compute_address<Address> (as _14$place<Place>  Place) address))
  :qid |prog.root$10$compute_address_axiom|)))
(assert (forall ((address Address)) (!
  (= (compute_address<Address> (as _15$place<Place>  Place) address) address)
  :pattern ((compute_address<Address> (as _15$place<Place>  Place) address))
  :qid |prog.root$11$compute_address_axiom|)))
(assert (forall ((address Address)) (!
  (= (compute_address<Address> (as _13$place<Place>  Place) address) address)
  :pattern ((compute_address<Address> (as _13$place<Place>  Place) address))
  :qid |prog.root$12$compute_address_axiom|)))
(assert (forall ((address Address)) (!
  (= (compute_address<Address> (as _12$place<Place>  Place) address) address)
  :pattern ((compute_address<Address> (as _12$place<Place>  Place) address))
  :qid |prog.root$13$compute_address_axiom|)))
(assert (forall ((address Address)) (!
  (= (compute_address<Address> (as _6$place<Place>  Place) address) address)
  :pattern ((compute_address<Address> (as _6$place<Place>  Place) address))
  :qid |prog.root$14$compute_address_axiom|)))
(assert (forall ((address Address)) (!
  (= (compute_address<Address> (as _5$place<Place>  Place) address) address)
  :pattern ((compute_address<Address> (as _5$place<Place>  Place) address))
  :qid |prog.root$15$compute_address_axiom|)))
(assert (forall ((address Address)) (!
  (= (compute_address<Address> (as _4$place<Place>  Place) address) address)
  :pattern ((compute_address<Address> (as _4$place<Place>  Place) address))
  :qid |prog.root$16$compute_address_axiom|)))
(assert (forall ((address Address)) (!
  (= (compute_address<Address> (as _19$place<Place>  Place) address) address)
  :pattern ((compute_address<Address> (as _19$place<Place>  Place) address))
  :qid |prog.root$17$compute_address_axiom|)))
(assert (forall ((address Address)) (!
  (= (compute_address<Address> (as _20$place<Place>  Place) address) address)
  :pattern ((compute_address<Address> (as _20$place<Place>  Place) address))
  :qid |prog.root$18$compute_address_axiom|)))
(assert (forall ((address Address)) (!
  (= (compute_address<Address> (as _18$place<Place>  Place) address) address)
  :pattern ((compute_address<Address> (as _18$place<Place>  Place) address))
  :qid |prog.root$19$compute_address_axiom|)))
(assert (forall ((address Address)) (!
  (= (compute_address<Address> (as _17$place<Place>  Place) address) address)
  :pattern ((compute_address<Address> (as _17$place<Place>  Place) address))
  :qid |prog.root$20$compute_address_axiom|)))
(assert (forall ((address Address)) (!
  (= (compute_address<Address> (as _21$place<Place>  Place) address) address)
  :pattern ((compute_address<Address> (as _21$place<Place>  Place) address))
  :qid |prog.root$21$compute_address_axiom|)))
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
; ---------- m_add_3$CoreProof ----------
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
; var _0$snapshot$3: Snap$I64
(declare-const _0$snapshot$3@4@01 Snap$I64)
; [exec]
; var _0$snapshot$4: Snap$I64
(declare-const _0$snapshot$4@5@01 Snap$I64)
; [exec]
; var _1$address: Address
(declare-const _1$address@6@01 Address)
; [exec]
; var _1$snapshot$0: Snap$I64
(declare-const _1$snapshot$0@7@01 Snap$I64)
; [exec]
; var _10$address: Address
(declare-const _10$address@8@01 Address)
; [exec]
; var _10$snapshot$0: Snap$Tuple$$I64$Bool$$I64$Bool$
(declare-const _10$snapshot$0@9@01 Snap$Tuple$$I64$Bool$$I64$Bool$)
; [exec]
; var _10$snapshot$1: Snap$Tuple$$I64$Bool$$I64$Bool$
(declare-const _10$snapshot$1@10@01 Snap$Tuple$$I64$Bool$$I64$Bool$)
; [exec]
; var _10$snapshot$2: Snap$Tuple$$I64$Bool$$I64$Bool$
(declare-const _10$snapshot$2@11@01 Snap$Tuple$$I64$Bool$$I64$Bool$)
; [exec]
; var _10$snapshot$3: Snap$Tuple$$I64$Bool$$I64$Bool$
(declare-const _10$snapshot$3@12@01 Snap$Tuple$$I64$Bool$$I64$Bool$)
; [exec]
; var _11$address: Address
(declare-const _11$address@13@01 Address)
; [exec]
; var _11$snapshot$0: Snap$I64
(declare-const _11$snapshot$0@14@01 Snap$I64)
; [exec]
; var _11$snapshot$1: Snap$I64
(declare-const _11$snapshot$1@15@01 Snap$I64)
; [exec]
; var _11$snapshot$2: Snap$I64
(declare-const _11$snapshot$2@16@01 Snap$I64)
; [exec]
; var _11$snapshot$3: Snap$I64
(declare-const _11$snapshot$3@17@01 Snap$I64)
; [exec]
; var _11$snapshot$4: Snap$I64
(declare-const _11$snapshot$4@18@01 Snap$I64)
; [exec]
; var _12$address: Address
(declare-const _12$address@19@01 Address)
; [exec]
; var _12$snapshot$0: Snap$Bool
(declare-const _12$snapshot$0@20@01 Snap$Bool)
; [exec]
; var _12$snapshot$1: Snap$Bool
(declare-const _12$snapshot$1@21@01 Snap$Bool)
; [exec]
; var _12$snapshot$2: Snap$Bool
(declare-const _12$snapshot$2@22@01 Snap$Bool)
; [exec]
; var _12$snapshot$3: Snap$Bool
(declare-const _12$snapshot$3@23@01 Snap$Bool)
; [exec]
; var _12$snapshot$4: Snap$Bool
(declare-const _12$snapshot$4@24@01 Snap$Bool)
; [exec]
; var _12$snapshot$5: Snap$Bool
(declare-const _12$snapshot$5@25@01 Snap$Bool)
; [exec]
; var _13$address: Address
(declare-const _13$address@26@01 Address)
; [exec]
; var _13$snapshot$0: Snap$I64
(declare-const _13$snapshot$0@27@01 Snap$I64)
; [exec]
; var _13$snapshot$1: Snap$I64
(declare-const _13$snapshot$1@28@01 Snap$I64)
; [exec]
; var _13$snapshot$2: Snap$I64
(declare-const _13$snapshot$2@29@01 Snap$I64)
; [exec]
; var _13$snapshot$3: Snap$I64
(declare-const _13$snapshot$3@30@01 Snap$I64)
; [exec]
; var _13$snapshot$4: Snap$I64
(declare-const _13$snapshot$4@31@01 Snap$I64)
; [exec]
; var _13$snapshot$5: Snap$I64
(declare-const _13$snapshot$5@32@01 Snap$I64)
; [exec]
; var _14$address: Address
(declare-const _14$address@33@01 Address)
; [exec]
; var _14$snapshot$0: Snap$I64
(declare-const _14$snapshot$0@34@01 Snap$I64)
; [exec]
; var _14$snapshot$1: Snap$I64
(declare-const _14$snapshot$1@35@01 Snap$I64)
; [exec]
; var _14$snapshot$2: Snap$I64
(declare-const _14$snapshot$2@36@01 Snap$I64)
; [exec]
; var _14$snapshot$3: Snap$I64
(declare-const _14$snapshot$3@37@01 Snap$I64)
; [exec]
; var _14$snapshot$4: Snap$I64
(declare-const _14$snapshot$4@38@01 Snap$I64)
; [exec]
; var _14$snapshot$5: Snap$I64
(declare-const _14$snapshot$5@39@01 Snap$I64)
; [exec]
; var _15$address: Address
(declare-const _15$address@40@01 Address)
; [exec]
; var _15$snapshot$0: Snap$Tuple$$I64$Bool$$I64$Bool$
(declare-const _15$snapshot$0@41@01 Snap$Tuple$$I64$Bool$$I64$Bool$)
; [exec]
; var _15$snapshot$1: Snap$Tuple$$I64$Bool$$I64$Bool$
(declare-const _15$snapshot$1@42@01 Snap$Tuple$$I64$Bool$$I64$Bool$)
; [exec]
; var _15$snapshot$2: Snap$Tuple$$I64$Bool$$I64$Bool$
(declare-const _15$snapshot$2@43@01 Snap$Tuple$$I64$Bool$$I64$Bool$)
; [exec]
; var _15$snapshot$3: Snap$Tuple$$I64$Bool$$I64$Bool$
(declare-const _15$snapshot$3@44@01 Snap$Tuple$$I64$Bool$$I64$Bool$)
; [exec]
; var _15$snapshot$4: Snap$Tuple$$I64$Bool$$I64$Bool$
(declare-const _15$snapshot$4@45@01 Snap$Tuple$$I64$Bool$$I64$Bool$)
; [exec]
; var _15$snapshot$5: Snap$Tuple$$I64$Bool$$I64$Bool$
(declare-const _15$snapshot$5@46@01 Snap$Tuple$$I64$Bool$$I64$Bool$)
; [exec]
; var _16$address: Address
(declare-const _16$address@47@01 Address)
; [exec]
; var _17$address: Address
(declare-const _17$address@48@01 Address)
; [exec]
; var _17$snapshot$0: Snap$I64
(declare-const _17$snapshot$0@49@01 Snap$I64)
; [exec]
; var _18$address: Address
(declare-const _18$address@50@01 Address)
; [exec]
; var _18$snapshot$0: Snap$I64
(declare-const _18$snapshot$0@51@01 Snap$I64)
; [exec]
; var _18$snapshot$1: Snap$I64
(declare-const _18$snapshot$1@52@01 Snap$I64)
; [exec]
; var _18$snapshot$2: Snap$I64
(declare-const _18$snapshot$2@53@01 Snap$I64)
; [exec]
; var _18$snapshot$3: Snap$I64
(declare-const _18$snapshot$3@54@01 Snap$I64)
; [exec]
; var _18$snapshot$4: Snap$I64
(declare-const _18$snapshot$4@55@01 Snap$I64)
; [exec]
; var _19$address: Address
(declare-const _19$address@56@01 Address)
; [exec]
; var _19$snapshot$0: Snap$I64
(declare-const _19$snapshot$0@57@01 Snap$I64)
; [exec]
; var _19$snapshot$1: Snap$I64
(declare-const _19$snapshot$1@58@01 Snap$I64)
; [exec]
; var _19$snapshot$2: Snap$I64
(declare-const _19$snapshot$2@59@01 Snap$I64)
; [exec]
; var _19$snapshot$3: Snap$I64
(declare-const _19$snapshot$3@60@01 Snap$I64)
; [exec]
; var _19$snapshot$4: Snap$I64
(declare-const _19$snapshot$4@61@01 Snap$I64)
; [exec]
; var _2$address: Address
(declare-const _2$address@62@01 Address)
; [exec]
; var _2$snapshot$0: Snap$Bool
(declare-const _2$snapshot$0@63@01 Snap$Bool)
; [exec]
; var _2$snapshot$1: Snap$Bool
(declare-const _2$snapshot$1@64@01 Snap$Bool)
; [exec]
; var _20$address: Address
(declare-const _20$address@65@01 Address)
; [exec]
; var _20$snapshot$0: Snap$Tuple$$I64$Bool$$I64$Bool$
(declare-const _20$snapshot$0@66@01 Snap$Tuple$$I64$Bool$$I64$Bool$)
; [exec]
; var _20$snapshot$1: Snap$Tuple$$I64$Bool$$I64$Bool$
(declare-const _20$snapshot$1@67@01 Snap$Tuple$$I64$Bool$$I64$Bool$)
; [exec]
; var _20$snapshot$2: Snap$Tuple$$I64$Bool$$I64$Bool$
(declare-const _20$snapshot$2@68@01 Snap$Tuple$$I64$Bool$$I64$Bool$)
; [exec]
; var _20$snapshot$3: Snap$Tuple$$I64$Bool$$I64$Bool$
(declare-const _20$snapshot$3@69@01 Snap$Tuple$$I64$Bool$$I64$Bool$)
; [exec]
; var _20$snapshot$4: Snap$Tuple$$I64$Bool$$I64$Bool$
(declare-const _20$snapshot$4@70@01 Snap$Tuple$$I64$Bool$$I64$Bool$)
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
; var _3$address: Address
(declare-const _3$address@77@01 Address)
; [exec]
; var _3$snapshot$0: Snap$I64
(declare-const _3$snapshot$0@78@01 Snap$I64)
; [exec]
; var _3$snapshot$1: Snap$I64
(declare-const _3$snapshot$1@79@01 Snap$I64)
; [exec]
; var _4$address: Address
(declare-const _4$address@80@01 Address)
; [exec]
; var _4$snapshot$0: Snap$Tuple$$$
(declare-const _4$snapshot$0@81@01 Snap$Tuple$$$)
; [exec]
; var _4$snapshot$1: Snap$Tuple$$$
(declare-const _4$snapshot$1@82@01 Snap$Tuple$$$)
; [exec]
; var _4$snapshot$2: Snap$Tuple$$$
(declare-const _4$snapshot$2@83@01 Snap$Tuple$$$)
; [exec]
; var _4$snapshot$3: Snap$Tuple$$$
(declare-const _4$snapshot$3@84@01 Snap$Tuple$$$)
; [exec]
; var _4$snapshot$4: Snap$Tuple$$$
(declare-const _4$snapshot$4@85@01 Snap$Tuple$$$)
; [exec]
; var _5$address: Address
(declare-const _5$address@86@01 Address)
; [exec]
; var _5$snapshot$0: Snap$Bool
(declare-const _5$snapshot$0@87@01 Snap$Bool)
; [exec]
; var _5$snapshot$1: Snap$Bool
(declare-const _5$snapshot$1@88@01 Snap$Bool)
; [exec]
; var _5$snapshot$2: Snap$Bool
(declare-const _5$snapshot$2@89@01 Snap$Bool)
; [exec]
; var _5$snapshot$3: Snap$Bool
(declare-const _5$snapshot$3@90@01 Snap$Bool)
; [exec]
; var _5$snapshot$4: Snap$Bool
(declare-const _5$snapshot$4@91@01 Snap$Bool)
; [exec]
; var _6$address: Address
(declare-const _6$address@92@01 Address)
; [exec]
; var _6$snapshot$0: Snap$Bool
(declare-const _6$snapshot$0@93@01 Snap$Bool)
; [exec]
; var _6$snapshot$1: Snap$Bool
(declare-const _6$snapshot$1@94@01 Snap$Bool)
; [exec]
; var _6$snapshot$2: Snap$Bool
(declare-const _6$snapshot$2@95@01 Snap$Bool)
; [exec]
; var _6$snapshot$3: Snap$Bool
(declare-const _6$snapshot$3@96@01 Snap$Bool)
; [exec]
; var _6$snapshot$4: Snap$Bool
(declare-const _6$snapshot$4@97@01 Snap$Bool)
; [exec]
; var _6$snapshot$5: Snap$Bool
(declare-const _6$snapshot$5@98@01 Snap$Bool)
; [exec]
; var _6$snapshot$6: Snap$Bool
(declare-const _6$snapshot$6@99@01 Snap$Bool)
; [exec]
; var _7$address: Address
(declare-const _7$address@100@01 Address)
; [exec]
; var _7$snapshot$0: Snap$Bool
(declare-const _7$snapshot$0@101@01 Snap$Bool)
; [exec]
; var _7$snapshot$1: Snap$Bool
(declare-const _7$snapshot$1@102@01 Snap$Bool)
; [exec]
; var _7$snapshot$2: Snap$Bool
(declare-const _7$snapshot$2@103@01 Snap$Bool)
; [exec]
; var _7$snapshot$3: Snap$Bool
(declare-const _7$snapshot$3@104@01 Snap$Bool)
; [exec]
; var _7$snapshot$4: Snap$Bool
(declare-const _7$snapshot$4@105@01 Snap$Bool)
; [exec]
; var _8$address: Address
(declare-const _8$address@106@01 Address)
; [exec]
; var _8$snapshot$0: Snap$I64
(declare-const _8$snapshot$0@107@01 Snap$I64)
; [exec]
; var _8$snapshot$1: Snap$I64
(declare-const _8$snapshot$1@108@01 Snap$I64)
; [exec]
; var _8$snapshot$2: Snap$I64
(declare-const _8$snapshot$2@109@01 Snap$I64)
; [exec]
; var _8$snapshot$3: Snap$I64
(declare-const _8$snapshot$3@110@01 Snap$I64)
; [exec]
; var _8$snapshot$4: Snap$I64
(declare-const _8$snapshot$4@111@01 Snap$I64)
; [exec]
; var _9$address: Address
(declare-const _9$address@112@01 Address)
; [exec]
; var _9$snapshot$0: Snap$I64
(declare-const _9$snapshot$0@113@01 Snap$I64)
; [exec]
; var _9$snapshot$1: Snap$I64
(declare-const _9$snapshot$1@114@01 Snap$I64)
; [exec]
; var _9$snapshot$2: Snap$I64
(declare-const _9$snapshot$2@115@01 Snap$I64)
; [exec]
; var _9$snapshot$3: Snap$I64
(declare-const _9$snapshot$3@116@01 Snap$I64)
; [exec]
; var bw0$snapshot$0: Lifetime
(declare-const bw0$snapshot$0@117@01 Lifetime)
; [exec]
; var bw1$snapshot$0: Lifetime
(declare-const bw1$snapshot$0@118@01 Lifetime)
; [exec]
; var end_label$marker: Bool
(declare-const end_label$marker@119@01 Bool)
; [exec]
; var label_1_custom$marker: Bool
(declare-const label_1_custom$marker@120@01 Bool)
; [exec]
; var label_2_custom$marker: Bool
(declare-const label_2_custom$marker@121@01 Bool)
; [exec]
; var label_3_custom$marker: Bool
(declare-const label_3_custom$marker@122@01 Bool)
; [exec]
; var label_4_custom$marker: Bool
(declare-const label_4_custom$marker@123@01 Bool)
; [exec]
; var label_5_custom$marker: Bool
(declare-const label_5_custom$marker@124@01 Bool)
; [exec]
; var label_6_custom$marker: Bool
(declare-const label_6_custom$marker@125@01 Bool)
; [exec]
; var label_8_custom$marker: Bool
(declare-const label_8_custom$marker@126@01 Bool)
; [exec]
; var label_9_custom$marker: Bool
(declare-const label_9_custom$marker@127@01 Bool)
; [exec]
; var label_bb0$marker: Bool
(declare-const label_bb0$marker@128@01 Bool)
; [exec]
; var label_bb1$marker: Bool
(declare-const label_bb1$marker@129@01 Bool)
; [exec]
; var label_bb10$marker: Bool
(declare-const label_bb10$marker@130@01 Bool)
; [exec]
; var label_bb11$marker: Bool
(declare-const label_bb11$marker@131@01 Bool)
; [exec]
; var label_bb12$marker: Bool
(declare-const label_bb12$marker@132@01 Bool)
; [exec]
; var label_bb13$marker: Bool
(declare-const label_bb13$marker@133@01 Bool)
; [exec]
; var label_bb14$marker: Bool
(declare-const label_bb14$marker@134@01 Bool)
; [exec]
; var label_bb2$marker: Bool
(declare-const label_bb2$marker@135@01 Bool)
; [exec]
; var label_bb3$marker: Bool
(declare-const label_bb3$marker@136@01 Bool)
; [exec]
; var label_bb4$marker: Bool
(declare-const label_bb4$marker@137@01 Bool)
; [exec]
; var label_bb5$marker: Bool
(declare-const label_bb5$marker@138@01 Bool)
; [exec]
; var label_bb6$marker: Bool
(declare-const label_bb6$marker@139@01 Bool)
; [exec]
; var label_bb7$marker: Bool
(declare-const label_bb7$marker@140@01 Bool)
; [exec]
; var label_bb8$marker: Bool
(declare-const label_bb8$marker@141@01 Bool)
; [exec]
; var label_bb9$marker: Bool
(declare-const label_bb9$marker@142@01 Bool)
; [exec]
; var label_entry$marker: Bool
(declare-const label_entry$marker@143@01 Bool)
; [exec]
; var lft_0$snapshot$1: Lifetime
(declare-const lft_0$snapshot$1@144@01 Lifetime)
; [exec]
; var lft_1$snapshot$1: Lifetime
(declare-const lft_1$snapshot$1@145@01 Lifetime)
; [exec]
; var lft_function_call_1$snapshot$0: Lifetime
(declare-const lft_function_call_1$snapshot$0@146@01 Lifetime)
; [exec]
; var lft_function_call_1$snapshot$1: Lifetime
(declare-const lft_function_call_1$snapshot$1@147@01 Lifetime)
; [exec]
; var lft_function_call_1$snapshot$2: Lifetime
(declare-const lft_function_call_1$snapshot$2@148@01 Lifetime)
; [exec]
; var lft_function_call_1$snapshot$3: Lifetime
(declare-const lft_function_call_1$snapshot$3@149@01 Lifetime)
; [exec]
; var lft_function_call_1$snapshot$4: Lifetime
(declare-const lft_function_call_1$snapshot$4@150@01 Lifetime)
; [exec]
; var lifetime_token_perm_amount$0$snapshot$0: Perm
(declare-const lifetime_token_perm_amount$0$snapshot$0@151@01 $Perm)
; [exec]
; var resume_panic_label$marker: Bool
(declare-const resume_panic_label$marker@152@01 Bool)
; [exec]
; var return_label$marker: Bool
(declare-const return_label$marker@153@01 Bool)
; [exec]
; var start_label$marker: Bool
(declare-const start_label$marker@154@01 Bool)
; [exec]
; var tmp$0: Snap$Bool
(declare-const tmp$0@155@01 Snap$Bool)
; [exec]
; var tmp$1: Snap$Tuple$$I64$Bool$$I64$Bool$
(declare-const tmp$1@156@01 Snap$Tuple$$I64$Bool$$I64$Bool$)
; [exec]
; var tmp$2: Snap$Bool
(declare-const tmp$2@157@01 Snap$Bool)
; [exec]
; var tmp$3: Snap$Tuple$$I64$Bool$$I64$Bool$
(declare-const tmp$3@158@01 Snap$Tuple$$I64$Bool$$I64$Bool$)
; [exec]
; var tmp$4: Snap$Bool
(declare-const tmp$4@159@01 Snap$Bool)
; [exec]
; var tmp$5: Snap$Bool
(declare-const tmp$5@160@01 Snap$Bool)
; [exec]
; var tmp$6: Snap$Tuple$$I64$Bool$$I64$Bool$
(declare-const tmp$6@161@01 Snap$Tuple$$I64$Bool$$I64$Bool$)
; [exec]
; var tmp$7: Bool
(declare-const tmp$7@162@01 Bool)
; [exec]
; var tmp$8: Snap$Tuple$$I64$Bool$$I64$Bool$
(declare-const tmp$8@163@01 Snap$Tuple$$I64$Bool$$I64$Bool$)
; [exec]
; label start_label
; [exec]
; start_label$marker := false
; [exec]
; label_entry$marker := false
; [exec]
; label_bb0$marker := false
; [exec]
; label_2_custom$marker := false
; [exec]
; label_bb1$marker := false
; [exec]
; label_1_custom$marker := false
; [exec]
; label_bb2$marker := false
; [exec]
; label_bb6$marker := false
; [exec]
; label_4_custom$marker := false
; [exec]
; label_bb4$marker := false
; [exec]
; label_bb7$marker := false
; [exec]
; label_3_custom$marker := false
; [exec]
; label_bb3$marker := false
; [exec]
; label_bb5$marker := false
; [exec]
; label_6_custom$marker := false
; [exec]
; label_bb8$marker := false
; [exec]
; label_5_custom$marker := false
; [exec]
; label_bb9$marker := false
; [exec]
; label_bb10$marker := false
; [exec]
; label_9_custom$marker := false
; [exec]
; label_8_custom$marker := false
; [exec]
; label_bb11$marker := false
; [exec]
; label_bb14$marker := false
; [exec]
; resume_panic_label$marker := false
; [exec]
; label_bb12$marker := false
; [exec]
; label_bb13$marker := false
; [exec]
; return_label$marker := false
; [exec]
; end_label$marker := false
; [exec]
; start_label$marker := true
; [exec]
; inhale basic_block_marker$start_label$marker()
(declare-const $t@164@01 $Snap)
(assert (= $t@164@01 $Snap.unit))
; [eval] basic_block_marker$start_label$marker()
(assert (as basic_block_marker$start_label$marker<Bool>  Bool))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale lifetime_token_perm_amount$0$snapshot$0 > none
(declare-const $t@165@01 $Snap)
(assert (= $t@165@01 $Snap.unit))
; [eval] lifetime_token_perm_amount$0$snapshot$0 > none
(assert (> lifetime_token_perm_amount$0$snapshot$0@151@01 $Perm.No))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale lifetime_token_perm_amount$0$snapshot$0 < write
(declare-const $t@166@01 $Snap)
(assert (= $t@166@01 $Snap.unit))
; [eval] lifetime_token_perm_amount$0$snapshot$0 < write
(assert (< lifetime_token_perm_amount$0$snapshot$0@151@01 $Perm.Write))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale acc(LifetimeToken(bw0$snapshot$0), lifetime_token_perm_amount$0$snapshot$0)
(set-option :timeout 0)
(push) ; 3
(assert (not (or
  (= lifetime_token_perm_amount$0$snapshot$0@151@01 $Perm.No)
  (< $Perm.No lifetime_token_perm_amount$0$snapshot$0@151@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(declare-const $t@167@01 $Snap)
(assert (<= $Perm.No lifetime_token_perm_amount$0$snapshot$0@151@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(LifetimeToken(bw1$snapshot$0), lifetime_token_perm_amount$0$snapshot$0)
(set-option :timeout 0)
(push) ; 3
(assert (not (or
  (= lifetime_token_perm_amount$0$snapshot$0@151@01 $Perm.No)
  (< $Perm.No lifetime_token_perm_amount$0$snapshot$0@151@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(declare-const $t@168@01 $Snap)
(push) ; 3
(set-option :timeout 10)
(assert (not (= bw0$snapshot$0@117@01 bw1$snapshot$0@118@01)))
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
; lft_0$snapshot$1 := bw0$snapshot$0
; [exec]
; lft_1$snapshot$1 := lft_tok_sep_take$2(bw0$snapshot$0, bw1$snapshot$0, lifetime_token_perm_amount$0$snapshot$0 /
;   7)
; [eval] lifetime_token_perm_amount$0$snapshot$0 / 7
; [eval] none < rd_perm
(set-option :timeout 0)
(push) ; 3
(assert (not (< $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7)))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (< $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7))))
(push) ; 3
(assert (not (or
  (= (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7)) $Perm.No)
  (< $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7))))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  (-
    lifetime_token_perm_amount$0$snapshot$0@151@01
    ($Perm.min
      lifetime_token_perm_amount$0$snapshot$0@151@01
      (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7))))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (<=
  $Perm.No
  (-
    lifetime_token_perm_amount$0$snapshot$0@151@01
    ($Perm.min
      lifetime_token_perm_amount$0$snapshot$0@151@01
      (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7))))))
(set-option :timeout 0)
(push) ; 3
(assert (not (or
  (=
    (-
      (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7))
      ($Perm.min
        lifetime_token_perm_amount$0$snapshot$0@151@01
        (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7))))
    $Perm.No)
  (<
    (-
      (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7))
      ($Perm.min
        lifetime_token_perm_amount$0$snapshot$0@151@01
        (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7))))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7)))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(assert (not (or
  (= (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7)) $Perm.No)
  (< $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7))))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  (-
    lifetime_token_perm_amount$0$snapshot$0@151@01
    ($Perm.min
      lifetime_token_perm_amount$0$snapshot$0@151@01
      (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7))))
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
      (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7))
      ($Perm.min
        lifetime_token_perm_amount$0$snapshot$0@151@01
        (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7))))
    $Perm.No)
  (<
    (-
      (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7))
      ($Perm.min
        lifetime_token_perm_amount$0$snapshot$0@151@01
        (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7))))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7)))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(declare-const lft@169@01 Lifetime)
(declare-const $t@170@01 $Snap)
(assert (= $t@170@01 ($Snap.combine ($Snap.first $t@170@01) ($Snap.second $t@170@01))))
(set-option :timeout 0)
(push) ; 3
(assert (not (or
  (= (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7)) $Perm.No)
  (< $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7))))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(push) ; 3
(set-option :timeout 10)
(assert (not (= bw1$snapshot$0@118@01 lft@169@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= bw0$snapshot$0@117@01 lft@169@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (<= $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7))))
(assert (= ($Snap.second $t@170@01) $Snap.unit))
; [eval] lft == intersect(Set(lft_1, lft_2))
; [eval] intersect(Set(lft_1, lft_2))
; [eval] Set(lft_1, lft_2)
(assert (=
  lft@169@01
  (intersect<Lifetime> (Set_unionone (Set_singleton bw0$snapshot$0@117@01) bw1$snapshot$0@118@01))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(OwnedNonAliased$I64(_1$place(), _1$address, _1$snapshot$0), write) &&
;   valid$Snap$I64(_1$snapshot$0)
(declare-const $t@171@01 $Snap)
(assert (= $t@171@01 ($Snap.combine ($Snap.first $t@171@01) ($Snap.second $t@171@01))))
; [eval] _1$place()
(assert (= ($Snap.second $t@171@01) $Snap.unit))
; [eval] valid$Snap$I64(_1$snapshot$0)
(assert (valid$Snap$I64<Bool> _1$snapshot$0@7@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlock(_0$address, Size$I64$()), write)
; [eval] Size$I64$()
(declare-const $t@172@01 $Snap)
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlock(_10$address, Size$Tuple$$I64$Bool$$I64$Bool$$()), write)
; [eval] Size$Tuple$$I64$Bool$$I64$Bool$$()
(declare-const $t@173@01 $Snap)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (= _0$address@0@01 _10$address@8@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
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
; inhale acc(MemoryBlock(_15$address, Size$Tuple$$I64$Bool$$I64$Bool$$()), write)
; [eval] Size$Tuple$$I64$Bool$$I64$Bool$$()
(declare-const $t@174@01 $Snap)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (= _0$address@0@01 _15$address@40@01)
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
(assert (not (= _10$address@8@01 _15$address@40@01)))
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
; inhale acc(MemoryBlock(_20$address, Size$Tuple$$I64$Bool$$I64$Bool$$()), write)
; [eval] Size$Tuple$$I64$Bool$$I64$Bool$$()
(declare-const $t@175@01 $Snap)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= _10$address@8@01 _20$address@65@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (= _0$address@0@01 _20$address@65@01)
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
(assert (not (= _15$address@40@01 _20$address@65@01)))
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
(declare-const $t@176@01 $Snap)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= _15$address@40@01 _21$address@71@01)))
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
(assert (not (= _10$address@8@01 _21$address@71@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= _20$address@65@01 _21$address@71@01)))
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
(declare-const $t@177@01 $Snap)
(assert (= $t@177@01 $Snap.unit))
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
(declare-const $t@178@01 $Snap)
(assert (= $t@178@01 $Snap.unit))
; [eval] basic_block_marker$label_bb0$marker()
(assert (as basic_block_marker$label_bb0$marker<Bool>  Bool))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlock(_2$address, Size$Bool$()), write)
; [eval] Size$Bool$()
(declare-const $t@179@01 $Snap)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (= _20$address@65@01 _2$address@62@01)
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
  (= _10$address@8@01 _2$address@62@01)
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
  (= _0$address@0@01 _2$address@62@01)
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
  (= _15$address@40@01 _2$address@62@01)
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
  (= _21$address@71@01 _2$address@62@01)
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
; inhale acc(MemoryBlockStackDrop(_2$address, Size$Bool$()), write)
; [eval] Size$Bool$()
(declare-const $t@180@01 $Snap)
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlock(_3$address, Size$I64$()), write)
; [eval] Size$I64$()
(declare-const $t@181@01 $Snap)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (= _2$address@62@01 _3$address@77@01)
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
  (= _20$address@65@01 _3$address@77@01)
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
  (= _10$address@8@01 _3$address@77@01)
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
(assert (not (= _0$address@0@01 _3$address@77@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (= _15$address@40@01 _3$address@77@01)
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
  (= _21$address@71@01 _3$address@77@01)
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
(declare-const $t@182@01 $Snap)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (= _2$address@62@01 _3$address@77@01)
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
; copy_place$I64(_3$place(), _3$address, _1$place(), _1$address, _1$snapshot$0,
;   write)
; [eval] _3$place()
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
    (compute_address<Address> (as _3$place<Place>  Place) _3$address@77@01))
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
    _15$address@40@01
    (compute_address<Address> (as _3$place<Place>  Place) _3$address@77@01))
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
  (compute_address<Address> (as _3$place<Place>  Place) _3$address@77@01))))
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
    _10$address@8@01
    (compute_address<Address> (as _3$place<Place>  Place) _3$address@77@01))
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
    _20$address@65@01
    (compute_address<Address> (as _3$place<Place>  Place) _3$address@77@01))
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
    (compute_address<Address> (as _3$place<Place>  Place) _3$address@77@01))
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
  _3$address@77@01
  (compute_address<Address> (as _3$place<Place>  Place) _3$address@77@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(declare-const $t@183@01 $Snap)
(assert (= $t@183@01 ($Snap.combine ($Snap.first $t@183@01) ($Snap.second $t@183@01))))
(assert (=
  ($Snap.second $t@183@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@183@01))
    ($Snap.second ($Snap.second $t@183@01)))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (= (as _1$place<Place>  Place) (as _3$place<Place>  Place))
  (= _1$address@6@01 _3$address@77@01))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (= ($Snap.second ($Snap.second $t@183@01)) $Snap.unit))
; [eval] valid$Snap$I64(source_snapshot)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _3$snapshot$1 == _1$snapshot$0
(declare-const $t@184@01 $Snap)
(assert (= $t@184@01 $Snap.unit))
; [eval] _3$snapshot$1 == _1$snapshot$0
(assert (= _3$snapshot$1@79@01 _1$snapshot$0@7@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; tmp$0 := assign$Bool$BinaryOp$EqCmp$Move$I64$Constant$I64$$$$(_2$place(), _2$address,
;   _3$place(), _3$address, _3$snapshot$1, constructor$Snap$I64$(0))
; [eval] _2$place()
; [eval] _3$place()
; [eval] constructor$Snap$I64$(0)
; [eval] compute_address(target_place, target_address)
; [eval] Size$Bool$()
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (=
    _21$address@71@01
    (compute_address<Address> (as _2$place<Place>  Place) _2$address@62@01))
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
    _15$address@40@01
    (compute_address<Address> (as _2$place<Place>  Place) _2$address@62@01))
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
    (compute_address<Address> (as _2$place<Place>  Place) _2$address@62@01))
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
    _10$address@8@01
    (compute_address<Address> (as _2$place<Place>  Place) _2$address@62@01))
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
    _20$address@65@01
    (compute_address<Address> (as _2$place<Place>  Place) _2$address@62@01))
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
  _2$address@62@01
  (compute_address<Address> (as _2$place<Place>  Place) _2$address@62@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= _1$snapshot$0@7@01 _3$snapshot$1@79@01)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; [eval] valid$Snap$I64(operand1_value)
(set-option :timeout 0)
(push) ; 3
(assert (not (valid$Snap$I64<Bool> _3$snapshot$1@79@01)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (valid$Snap$I64<Bool> _3$snapshot$1@79@01))
; [eval] valid$Snap$I64(operand2_value)
(push) ; 3
(assert (not (valid$Snap$I64<Bool> (constructor$Snap$I64$<Snap$I64> 0))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (valid$Snap$I64<Bool> (constructor$Snap$I64$<Snap$I64> 0)))
(declare-const result_value@185@01 Snap$Bool)
(declare-const $t@186@01 $Snap)
(assert (= $t@186@01 ($Snap.combine ($Snap.first $t@186@01) ($Snap.second $t@186@01))))
(assert (=
  ($Snap.second $t@186@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@186@01))
    ($Snap.second ($Snap.second $t@186@01)))))
; [eval] compute_address(operand1_place, operand1_root_address)
; [eval] Size$I64$()
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (=
    _21$address@71@01
    (compute_address<Address> (as _3$place<Place>  Place) _3$address@77@01))
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
    _15$address@40@01
    (compute_address<Address> (as _3$place<Place>  Place) _3$address@77@01))
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
  (compute_address<Address> (as _3$place<Place>  Place) _3$address@77@01))))
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
    _10$address@8@01
    (compute_address<Address> (as _3$place<Place>  Place) _3$address@77@01))
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
    _20$address@65@01
    (compute_address<Address> (as _3$place<Place>  Place) _3$address@77@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second $t@186@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@186@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@186@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@186@01))) $Snap.unit))
; [eval] result_value == constructor$Snap$Bool$EqCmp_I64(operand1_value, operand2_value)
; [eval] constructor$Snap$Bool$EqCmp_I64(operand1_value, operand2_value)
(assert (=
  result_value@185@01
  (constructor$Snap$Bool$EqCmp_I64<Snap$Bool> _3$snapshot$1@79@01 (constructor$Snap$I64$<Snap$I64> 0))))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@186@01))) $Snap.unit))
; [eval] valid$Snap$Bool(result_value)
(assert (valid$Snap$Bool<Bool> result_value@185@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _2$snapshot$1 == tmp$0
(declare-const $t@187@01 $Snap)
(assert (= $t@187@01 $Snap.unit))
; [eval] _2$snapshot$1 == tmp$0
(assert (= _2$snapshot$1@64@01 result_value@185@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; exhale acc(MemoryBlock(_3$address, Size$I64$()), write)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _3$place<Place>  Place) _3$address@77@01)
  _3$address@77@01)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(MemoryBlockStackDrop(_3$address, Size$I64$()), write)
; [eval] Size$I64$()
; [eval] !destructor$Snap$Bool$$value(_2$snapshot$1)
; [eval] destructor$Snap$Bool$$value(_2$snapshot$1)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (destructor$Snap$Bool$$value<Bool> _2$snapshot$1@64@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (destructor$Snap$Bool$$value<Bool> _2$snapshot$1@64@01))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; [then-branch: 0 | !(destructor$Snap$Bool$$value[Bool](_2$snapshot$1@64@01)) | live]
; [else-branch: 0 | destructor$Snap$Bool$$value[Bool](_2$snapshot$1@64@01) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 0 | !(destructor$Snap$Bool$$value[Bool](_2$snapshot$1@64@01))]
(assert (not (destructor$Snap$Bool$$value<Bool> _2$snapshot$1@64@01)))
; [exec]
; label label_1_custom
; [exec]
; label_1_custom$marker := true
; [exec]
; inhale basic_block_marker$label_1_custom$marker()
(declare-const $t@188@01 $Snap)
(assert (= $t@188@01 $Snap.unit))
; [eval] basic_block_marker$label_1_custom$marker()
(assert (as basic_block_marker$label_1_custom$marker<Bool>  Bool))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; label label_bb2
; [exec]
; label_bb2$marker := true
; [exec]
; inhale basic_block_marker$label_bb2$marker()
(declare-const $t@189@01 $Snap)
(assert (= $t@189@01 $Snap.unit))
; [eval] basic_block_marker$label_bb2$marker()
(assert (as basic_block_marker$label_bb2$marker<Bool>  Bool))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlock(_4$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
(declare-const $t@190@01 $Snap)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (= _20$address@65@01 _4$address@80@01)
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
  (= _10$address@8@01 _4$address@80@01)
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
  (= _0$address@0@01 _4$address@80@01)
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
  (= _15$address@40@01 _4$address@80@01)
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
  (= _21$address@71@01 _4$address@80@01)
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
; inhale acc(MemoryBlockStackDrop(_4$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
(declare-const $t@191@01 $Snap)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (= _2$address@62@01 _4$address@80@01)
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
; inhale acc(MemoryBlock(_5$address, Size$Bool$()), write)
; [eval] Size$Bool$()
(declare-const $t@192@01 $Snap)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (= _4$address@80@01 _5$address@86@01)
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
  (= _20$address@65@01 _5$address@86@01)
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
  (= _10$address@8@01 _5$address@86@01)
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
  (= _0$address@0@01 _5$address@86@01)
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
  (= _15$address@40@01 _5$address@86@01)
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
  (= _21$address@71@01 _5$address@86@01)
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
; inhale acc(MemoryBlockStackDrop(_5$address, Size$Bool$()), write)
; [eval] Size$Bool$()
(declare-const $t@193@01 $Snap)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (= _4$address@80@01 _5$address@86@01)
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
(assert (not (= _2$address@62@01 _5$address@86@01)))
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
; inhale acc(MemoryBlock(_6$address, Size$Bool$()), write)
; [eval] Size$Bool$()
(declare-const $t@194@01 $Snap)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= _5$address@86@01 _6$address@92@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (= _4$address@80@01 _6$address@92@01)
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
  (= _20$address@65@01 _6$address@92@01)
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
  (= _10$address@8@01 _6$address@92@01)
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
  (= _0$address@0@01 _6$address@92@01)
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
  (= _15$address@40@01 _6$address@92@01)
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
  (= _21$address@71@01 _6$address@92@01)
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
; inhale acc(MemoryBlockStackDrop(_6$address, Size$Bool$()), write)
; [eval] Size$Bool$()
(declare-const $t@195@01 $Snap)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= _5$address@86@01 _6$address@92@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (= _4$address@80@01 _6$address@92@01)
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
(assert (not (= _2$address@62@01 _6$address@92@01)))
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
; inhale acc(MemoryBlock(_7$address, Size$Bool$()), write)
; [eval] Size$Bool$()
(declare-const $t@196@01 $Snap)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= _6$address@92@01 _7$address@100@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= _5$address@86@01 _7$address@100@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (= _4$address@80@01 _7$address@100@01)
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
  (= _20$address@65@01 _7$address@100@01)
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
  (= _10$address@8@01 _7$address@100@01)
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
  (= _0$address@0@01 _7$address@100@01)
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
  (= _15$address@40@01 _7$address@100@01)
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
  (= _21$address@71@01 _7$address@100@01)
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
; inhale acc(MemoryBlockStackDrop(_7$address, Size$Bool$()), write)
; [eval] Size$Bool$()
(declare-const $t@197@01 $Snap)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= _6$address@92@01 _7$address@100@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= _5$address@86@01 _7$address@100@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (= _4$address@80@01 _7$address@100@01)
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
(assert (not (= _2$address@62@01 _7$address@100@01)))
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
; inhale acc(MemoryBlock(_8$address, Size$I64$()), write)
; [eval] Size$I64$()
(declare-const $t@198@01 $Snap)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (= _7$address@100@01 _8$address@106@01)
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
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
  (= _6$address@92@01 _8$address@106@01)
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
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
  (= _5$address@86@01 _8$address@106@01)
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
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
  (= _4$address@80@01 _8$address@106@01)
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
  (= _20$address@65@01 _8$address@106@01)
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
  (= _10$address@8@01 _8$address@106@01)
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
(assert (not (= _0$address@0@01 _8$address@106@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (= _15$address@40@01 _8$address@106@01)
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
  (= _21$address@71@01 _8$address@106@01)
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
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
; inhale acc(MemoryBlockStackDrop(_8$address, Size$I64$()), write)
; [eval] Size$I64$()
(declare-const $t@199@01 $Snap)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (= _7$address@100@01 _8$address@106@01)
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
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
  (= _6$address@92@01 _8$address@106@01)
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
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
  (= _5$address@86@01 _8$address@106@01)
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
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
  (= _4$address@80@01 _8$address@106@01)
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
  (= _2$address@62@01 _8$address@106@01)
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
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
; inhale acc(MemoryBlock(_9$address, Size$I64$()), write)
; [eval] Size$I64$()
(declare-const $t@200@01 $Snap)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= _8$address@106@01 _9$address@112@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (= _7$address@100@01 _9$address@112@01)
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
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
  (= _6$address@92@01 _9$address@112@01)
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
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
  (= _5$address@86@01 _9$address@112@01)
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
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
  (= _4$address@80@01 _9$address@112@01)
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
  (= _20$address@65@01 _9$address@112@01)
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
  (= _10$address@8@01 _9$address@112@01)
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
(assert (not (= _0$address@0@01 _9$address@112@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (= _15$address@40@01 _9$address@112@01)
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
  (= _21$address@71@01 _9$address@112@01)
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
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
; inhale acc(MemoryBlockStackDrop(_9$address, Size$I64$()), write)
; [eval] Size$I64$()
(declare-const $t@201@01 $Snap)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= _8$address@106@01 _9$address@112@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (= _7$address@100@01 _9$address@112@01)
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
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
  (= _6$address@92@01 _9$address@112@01)
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
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
  (= _5$address@86@01 _9$address@112@01)
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
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
  (= _4$address@80@01 _9$address@112@01)
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
  (= _2$address@62@01 _9$address@112@01)
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
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
; copy_place$I64(_9$place(), _9$address, _1$place(), _1$address, _1$snapshot$0,
;   write)
; [eval] _9$place()
; [eval] _1$place()
; [eval] none < source_permission_amount
; [eval] compute_address(target_place, target_root_address)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (=
    _21$address@71@01
    (compute_address<Address> (as _9$place<Place>  Place) _9$address@112@01))
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
    _15$address@40@01
    (compute_address<Address> (as _9$place<Place>  Place) _9$address@112@01))
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
  (compute_address<Address> (as _9$place<Place>  Place) _9$address@112@01))))
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
    _10$address@8@01
    (compute_address<Address> (as _9$place<Place>  Place) _9$address@112@01))
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
    _20$address@65@01
    (compute_address<Address> (as _9$place<Place>  Place) _9$address@112@01))
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
    _4$address@80@01
    (compute_address<Address> (as _9$place<Place>  Place) _9$address@112@01))
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
    _5$address@86@01
    (compute_address<Address> (as _9$place<Place>  Place) _9$address@112@01))
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
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
    _6$address@92@01
    (compute_address<Address> (as _9$place<Place>  Place) _9$address@112@01))
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
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
    _7$address@100@01
    (compute_address<Address> (as _9$place<Place>  Place) _9$address@112@01))
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
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
  _8$address@106@01
  (compute_address<Address> (as _9$place<Place>  Place) _9$address@112@01))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  _9$address@112@01
  (compute_address<Address> (as _9$place<Place>  Place) _9$address@112@01))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(declare-const $t@202@01 $Snap)
(assert (= $t@202@01 ($Snap.combine ($Snap.first $t@202@01) ($Snap.second $t@202@01))))
(assert (=
  ($Snap.second $t@202@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@202@01))
    ($Snap.second ($Snap.second $t@202@01)))))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (= (as _1$place<Place>  Place) (as _9$place<Place>  Place))
  (= _1$address@6@01 _9$address@112@01))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (= ($Snap.second ($Snap.second $t@202@01)) $Snap.unit))
; [eval] valid$Snap$I64(source_snapshot)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _9$snapshot$1 == _1$snapshot$0
(declare-const $t@203@01 $Snap)
(assert (= $t@203@01 $Snap.unit))
; [eval] _9$snapshot$1 == _1$snapshot$0
(assert (= _9$snapshot$1@114@01 _1$snapshot$0@7@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; tmp$1 := assign$Tuple$$I64$Bool$$I64$Bool$$CheckedBinaryOp$Sub$Copy$I64$Constant$I64$$$$(_10$place(),
;   _10$address, _9$place(), _9$address, _9$snapshot$1, constructor$Snap$I64$(1))
; [eval] _10$place()
; [eval] _9$place()
; [eval] constructor$Snap$I64$(1)
; [eval] compute_address(target_place, target_address)
; [eval] Size$Tuple$$I64$Bool$$I64$Bool$$()
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  _21$address@71@01
  (compute_address<Address> (as _10$place<Place>  Place) _10$address@8@01))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  _15$address@40@01
  (compute_address<Address> (as _10$place<Place>  Place) _10$address@8@01))))
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
    (compute_address<Address> (as _10$place<Place>  Place) _10$address@8@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  _10$address@8@01
  (compute_address<Address> (as _10$place<Place>  Place) _10$address@8@01))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= _1$snapshot$0@7@01 _9$snapshot$1@114@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [eval] valid$Snap$I64(operand1_value)
(set-option :timeout 0)
(push) ; 4
(assert (not (valid$Snap$I64<Bool> _9$snapshot$1@114@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (valid$Snap$I64<Bool> _9$snapshot$1@114@01))
; [eval] valid$Snap$I64(operand2_value)
(push) ; 4
(assert (not (valid$Snap$I64<Bool> (constructor$Snap$I64$<Snap$I64> 1))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (valid$Snap$I64<Bool> (constructor$Snap$I64$<Snap$I64> 1)))
(declare-const result_value@204@01 Snap$Tuple$$I64$Bool$$I64$Bool$)
(declare-const $t@205@01 $Snap)
(assert (= $t@205@01 ($Snap.combine ($Snap.first $t@205@01) ($Snap.second $t@205@01))))
; [eval] compute_address(target_place, target_address)
; [eval] PaddingSize$Tuple$$I64$Bool$$I64$Bool$$()
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (=
    _8$address@106@01
    (compute_address<Address> (as _10$place<Place>  Place) _10$address@8@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
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
    _7$address@100@01
    (compute_address<Address> (as _10$place<Place>  Place) _10$address@8@01))
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
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
    _6$address@92@01
    (compute_address<Address> (as _10$place<Place>  Place) _10$address@8@01))
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
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
    _5$address@86@01
    (compute_address<Address> (as _10$place<Place>  Place) _10$address@8@01))
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
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
    _4$address@80@01
    (compute_address<Address> (as _10$place<Place>  Place) _10$address@8@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
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
    _20$address@65@01
    (compute_address<Address> (as _10$place<Place>  Place) _10$address@8@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
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
    (compute_address<Address> (as _10$place<Place>  Place) _10$address@8@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
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
    _15$address@40@01
    (compute_address<Address> (as _10$place<Place>  Place) _10$address@8@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
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
    (compute_address<Address> (as _10$place<Place>  Place) _10$address@8@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second $t@205@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@205@01))
    ($Snap.second ($Snap.second $t@205@01)))))
; [eval] field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(compute_address(target_place, target_address))
; [eval] compute_address(target_place, target_address)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (=
    _21$address@71@01
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _10$place<Place>  Place) _10$address@8@01)))
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
    _15$address@40@01
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _10$place<Place>  Place) _10$address@8@01)))
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
  (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _10$place<Place>  Place) _10$address@8@01)))))
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
    _20$address@65@01
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _10$place<Place>  Place) _10$address@8@01)))
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
    _4$address@80@01
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _10$place<Place>  Place) _10$address@8@01)))
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
    _5$address@86@01
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _10$place<Place>  Place) _10$address@8@01)))
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
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
    _6$address@92@01
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _10$place<Place>  Place) _10$address@8@01)))
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
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
    _7$address@100@01
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _10$place<Place>  Place) _10$address@8@01)))
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
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
  _8$address@106@01
  (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _10$place<Place>  Place) _10$address@8@01)))))
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
    (compute_address<Address> (as _10$place<Place>  Place) _10$address@8@01)
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _10$place<Place>  Place) _10$address@8@01)))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second $t@205@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@205@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@205@01))))))
; [eval] field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(target_place)
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(result_value)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (=
    (as _2$place<Place>  Place)
    (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _10$place<Place>  Place)))
  (= _2$address@62@01 _10$address@8@01)
  (=
    result_value@185@01
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> result_value@204@01)))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@205@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@205@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@205@01)))))))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (= (as _1$place<Place>  Place) (as _9$place<Place>  Place))
  (= _1$address@6@01 _9$address@112@01)
  (= _1$snapshot$0@7@01 _9$snapshot$1@114@01))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@205@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@205@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@205@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@205@01)))))
  $Snap.unit))
; [eval] valid$Snap$I64(constructor$Snap$I64$Sub_I64(operand1_value, operand2_value)) ==> destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(result_value) == constructor$Snap$I64$Sub_I64(operand1_value, operand2_value)
; [eval] valid$Snap$I64(constructor$Snap$I64$Sub_I64(operand1_value, operand2_value))
; [eval] constructor$Snap$I64$Sub_I64(operand1_value, operand2_value)
(set-option :timeout 0)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  (valid$Snap$I64<Bool> (constructor$Snap$I64$Sub_I64<Snap$I64> _9$snapshot$1@114@01 (constructor$Snap$I64$<Snap$I64> 1))))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (valid$Snap$I64<Bool> (constructor$Snap$I64$Sub_I64<Snap$I64> _9$snapshot$1@114@01 (constructor$Snap$I64$<Snap$I64> 1)))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [then-branch: 1 | valid$Snap$I64[Bool](constructor$Snap$I64$Sub_I64[Snap$I64](_9$snapshot$1@114@01, constructor$Snap$I64$[Snap$I64](1))) | live]
; [else-branch: 1 | !(valid$Snap$I64[Bool](constructor$Snap$I64$Sub_I64[Snap$I64](_9$snapshot$1@114@01, constructor$Snap$I64$[Snap$I64](1)))) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 1 | valid$Snap$I64[Bool](constructor$Snap$I64$Sub_I64[Snap$I64](_9$snapshot$1@114@01, constructor$Snap$I64$[Snap$I64](1)))]
(assert (valid$Snap$I64<Bool> (constructor$Snap$I64$Sub_I64<Snap$I64> _9$snapshot$1@114@01 (constructor$Snap$I64$<Snap$I64> 1))))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(result_value) == constructor$Snap$I64$Sub_I64(operand1_value, operand2_value)
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(result_value)
; [eval] constructor$Snap$I64$Sub_I64(operand1_value, operand2_value)
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (valid$Snap$I64<Bool> (constructor$Snap$I64$Sub_I64<Snap$I64> _9$snapshot$1@114@01 (constructor$Snap$I64$<Snap$I64> 1))))
(assert (=>
  (valid$Snap$I64<Bool> (constructor$Snap$I64$Sub_I64<Snap$I64> _9$snapshot$1@114@01 (constructor$Snap$I64$<Snap$I64> 1)))
  (=
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> result_value@204@01)
    (constructor$Snap$I64$Sub_I64<Snap$I64> _9$snapshot$1@114@01 (constructor$Snap$I64$<Snap$I64> 1)))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@205@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@205@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@205@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@205@01))))))
  $Snap.unit))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(result_value) == constructor$Snap$Bool$(!valid$Snap$I64(constructor$Snap$I64$Sub_I64(operand1_value, operand2_value)))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(result_value)
; [eval] constructor$Snap$Bool$(!valid$Snap$I64(constructor$Snap$I64$Sub_I64(operand1_value, operand2_value)))
; [eval] !valid$Snap$I64(constructor$Snap$I64$Sub_I64(operand1_value, operand2_value))
; [eval] valid$Snap$I64(constructor$Snap$I64$Sub_I64(operand1_value, operand2_value))
; [eval] constructor$Snap$I64$Sub_I64(operand1_value, operand2_value)
(assert (=
  (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> result_value@204@01)
  (constructor$Snap$Bool$<Snap$Bool> (not
    (valid$Snap$I64<Bool> (constructor$Snap$I64$Sub_I64<Snap$I64> _9$snapshot$1@114@01 (constructor$Snap$I64$<Snap$I64> 1)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@205@01))))))
  $Snap.unit))
; [eval] MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(compute_address(target_place, target_address)), Size$I64$()) == to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(result_value))
; [eval] MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(compute_address(target_place, target_address)), Size$I64$())
; [eval] field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(compute_address(target_place, target_address))
; [eval] compute_address(target_place, target_address)
; [eval] Size$I64$()
(push) ; 4
(declare-const $k@206@01 $Perm)
(assert ($Perm.isReadVar $k@206@01))
(assert (< $k@206@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@206@01)))
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@206@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@205@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _10$place<Place>  Place) _10$address@8@01)) (as Size$I64$<Snap$Usize>  Snap$Usize)))
(pop) ; 4
; Joined path conditions
(assert ($Perm.isReadVar $k@206@01))
(assert (and
  (< $k@206@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@206@01))
  (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@205@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _10$place<Place>  Place) _10$address@8@01)) (as Size$I64$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(result_value))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(result_value)
(assert (=
  (MemoryBlock$bytes ($Snap.first ($Snap.second $t@205@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _10$place<Place>  Place) _10$address@8@01)) (as Size$I64$<Snap$Usize>  Snap$Usize))
  (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> result_value@204@01))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _10$snapshot$1 == tmp$1
(declare-const $t@207@01 $Snap)
(assert (= $t@207@01 $Snap.unit))
; [eval] _10$snapshot$1 == tmp$1
(assert (= _10$snapshot$1@10@01 result_value@204@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [eval] !destructor$Snap$Bool$$value(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(_10$snapshot$1))
; [eval] destructor$Snap$Bool$$value(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(_10$snapshot$1))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(_10$snapshot$1)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (destructor$Snap$Bool$$value<Bool> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> _10$snapshot$1@10@01))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (destructor$Snap$Bool$$value<Bool> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> _10$snapshot$1@10@01)))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [then-branch: 2 | !(destructor$Snap$Bool$$value[Bool](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](_10$snapshot$1@10@01))) | live]
; [else-branch: 2 | destructor$Snap$Bool$$value[Bool](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](_10$snapshot$1@10@01)) | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 2 | !(destructor$Snap$Bool$$value[Bool](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](_10$snapshot$1@10@01)))]
(assert (not
  (destructor$Snap$Bool$$value<Bool> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> _10$snapshot$1@10@01))))
; [exec]
; label label_bb6
; [exec]
; label_bb6$marker := true
; [exec]
; inhale basic_block_marker$label_bb6$marker()
(declare-const $t@208@01 $Snap)
(assert (= $t@208@01 $Snap.unit))
; [eval] basic_block_marker$label_bb6$marker()
(assert (as basic_block_marker$label_bb6$marker<Bool>  Bool))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; fold acc(OwnedNonAliased$I64(field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(_10$place()),
;   _10$address, destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(_10$snapshot$1)), write)
; [eval] field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(_10$place())
; [eval] _10$place()
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(_10$snapshot$1)
; [eval] valid$Snap$I64(snapshot)
(set-option :timeout 0)
(push) ; 5
(assert (not (valid$Snap$I64<Bool> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _10$snapshot$1@10@01))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (valid$Snap$I64<Bool> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _10$snapshot$1@10@01)))
; [eval] compute_address(place, root_address)
; [eval] Size$I64$()
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _10$place<Place>  Place) _10$address@8@01))
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _10$place<Place>  Place)) _10$address@8@01))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [eval] MemoryBlock$bytes(compute_address(place, root_address), Size$I64$()) == to_bytes$I64(snapshot)
; [eval] MemoryBlock$bytes(compute_address(place, root_address), Size$I64$())
; [eval] compute_address(place, root_address)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 5
(declare-const $k@209@01 $Perm)
(assert ($Perm.isReadVar $k@209@01))
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _10$place<Place>  Place) _10$address@8@01))
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _10$place<Place>  Place)) _10$address@8@01))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (< $k@209@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@209@01)))
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (< $Perm.No $k@209@01)))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@205@01)) (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _10$place<Place>  Place)) _10$address@8@01) (as Size$I64$<Snap$Usize>  Snap$Usize)))
(pop) ; 5
; Joined path conditions
(assert ($Perm.isReadVar $k@209@01))
(assert (and
  (< $k@209@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@209@01))
  (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@205@01)) (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _10$place<Place>  Place)) _10$address@8@01) (as Size$I64$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$I64(snapshot)
(set-option :timeout 0)
(push) ; 5
(assert (not (=
  (MemoryBlock$bytes ($Snap.first ($Snap.second $t@205@01)) (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _10$place<Place>  Place)) _10$address@8@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
  (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _10$snapshot$1@10@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (=
  (MemoryBlock$bytes ($Snap.first ($Snap.second $t@205@01)) (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _10$place<Place>  Place)) _10$address@8@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
  (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _10$snapshot$1@10@01))))
(assert (OwnedNonAliased$I64%trigger ($Snap.combine
  $Snap.unit
  ($Snap.combine ($Snap.first ($Snap.second $t@205@01)) $Snap.unit)) (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _10$place<Place>  Place)) _10$address@8@01 (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _10$snapshot$1@10@01)))
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    (as _1$place<Place>  Place)
    (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _10$place<Place>  Place)))
  (= _1$address@6@01 _10$address@8@01)
  (=
    _1$snapshot$0@7@01
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _10$snapshot$1@10@01)))))
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
    (as _9$place<Place>  Place)
    (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _10$place<Place>  Place)))
  (= _9$address@112@01 _10$address@8@01)
  (=
    _9$snapshot$1@114@01
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _10$snapshot$1@10@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [exec]
; move_place$I64(_8$place(), _8$address, field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(_10$place()),
;   _10$address, destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(_10$snapshot$1))
; [eval] _8$place()
; [eval] field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(_10$place())
; [eval] _10$place()
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(_10$snapshot$1)
; [eval] compute_address(target_place, target_root_address)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _10$place<Place>  Place) _10$address@8@01)
    (compute_address<Address> (as _8$place<Place>  Place) _8$address@106@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
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
  _8$address@106@01
  (compute_address<Address> (as _8$place<Place>  Place) _8$address@106@01))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(declare-const $t@210@01 $Snap)
(assert (= $t@210@01 ($Snap.combine ($Snap.first $t@210@01) ($Snap.second $t@210@01))))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= (as _9$place<Place>  Place) (as _8$place<Place>  Place))
  (= _9$address@112@01 _8$address@106@01)
  (=
    _9$snapshot$1@114@01
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _10$snapshot$1@10@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= (as _1$place<Place>  Place) (as _8$place<Place>  Place))
  (= _1$address@6@01 _8$address@106@01)
  (=
    _1$snapshot$0@7@01
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _10$snapshot$1@10@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second $t@210@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@210@01))
    ($Snap.second ($Snap.second $t@210@01)))))
; [eval] compute_address(source_place, source_root_address)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _10$place<Place>  Place) _10$address@8@01)
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _10$place<Place>  Place)) _10$address@8@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
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
    _7$address@100@01
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _10$place<Place>  Place)) _10$address@8@01))
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
    _6$address@92@01
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _10$place<Place>  Place)) _10$address@8@01))
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
    _5$address@86@01
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _10$place<Place>  Place)) _10$address@8@01))
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
    _4$address@80@01
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _10$place<Place>  Place)) _10$address@8@01))
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
    _20$address@65@01
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _10$place<Place>  Place)) _10$address@8@01))
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
  _0$address@0@01
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _10$place<Place>  Place)) _10$address@8@01))))
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
    _15$address@40@01
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _10$place<Place>  Place)) _10$address@8@01))
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
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _10$place<Place>  Place)) _10$address@8@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (= ($Snap.second ($Snap.second $t@210@01)) $Snap.unit))
; [eval] valid$Snap$I64(source_snapshot)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _8$snapshot$1 ==
;   destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(_10$snapshot$1)
(declare-const $t@211@01 $Snap)
(assert (= $t@211@01 $Snap.unit))
; [eval] _8$snapshot$1 == destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(_10$snapshot$1)
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(_10$snapshot$1)
(assert (=
  _8$snapshot$1@108@01
  (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _10$snapshot$1@10@01)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; into_memory_block$I64(_9$place(), _9$address, _9$snapshot$1)
; [eval] _9$place()
; [eval] compute_address(place, root_address)
; [eval] Size$I64$()
(declare-const $t@212@01 $Snap)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _21$address@71@01
    (compute_address<Address> (as _9$place<Place>  Place) _9$address@112@01))
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
    _15$address@40@01
    (compute_address<Address> (as _9$place<Place>  Place) _9$address@112@01))
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
  _0$address@0@01
  (compute_address<Address> (as _9$place<Place>  Place) _9$address@112@01))))
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
    _20$address@65@01
    (compute_address<Address> (as _9$place<Place>  Place) _9$address@112@01))
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
    _4$address@80@01
    (compute_address<Address> (as _9$place<Place>  Place) _9$address@112@01))
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
    _5$address@86@01
    (compute_address<Address> (as _9$place<Place>  Place) _9$address@112@01))
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
    _6$address@92@01
    (compute_address<Address> (as _9$place<Place>  Place) _9$address@112@01))
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
    _7$address@100@01
    (compute_address<Address> (as _9$place<Place>  Place) _9$address@112@01))
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
    (compute_address<Address> (as _10$place<Place>  Place) _10$address@8@01)
    (compute_address<Address> (as _9$place<Place>  Place) _9$address@112@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
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
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _10$place<Place>  Place)) _10$address@8@01)
  (compute_address<Address> (as _9$place<Place>  Place) _9$address@112@01))))
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
; exhale acc(MemoryBlock(_9$address, Size$I64$()), write)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _9$place<Place>  Place) _9$address@112@01)
  _9$address@112@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(MemoryBlockStackDrop(_9$address, Size$I64$()), write)
; [eval] Size$I64$()
; [exec]
; inhale acc(MemoryBlock(_11$address, Size$I64$()), write)
; [eval] Size$I64$()
(declare-const $t@213@01 $Snap)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _10$place<Place>  Place)) _10$address@8@01)
  _11$address@13@01)))
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
    (compute_address<Address> (as _10$place<Place>  Place) _10$address@8@01)
    _11$address@13@01)
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
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
  (= _7$address@100@01 _11$address@13@01)
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
  (= _6$address@92@01 _11$address@13@01)
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
  (= _5$address@86@01 _11$address@13@01)
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
  (= _4$address@80@01 _11$address@13@01)
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
  (= _20$address@65@01 _11$address@13@01)
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
(assert (not (= _0$address@0@01 _11$address@13@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _15$address@40@01 _11$address@13@01)
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
  (= _21$address@71@01 _11$address@13@01)
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
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
; inhale acc(MemoryBlockStackDrop(_11$address, Size$I64$()), write)
; [eval] Size$I64$()
(declare-const $t@214@01 $Snap)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= _8$address@106@01 _11$address@13@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _7$address@100@01 _11$address@13@01)
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
  (= _6$address@92@01 _11$address@13@01)
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
  (= _5$address@86@01 _11$address@13@01)
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
  (= _4$address@80@01 _11$address@13@01)
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
  (= _2$address@62@01 _11$address@13@01)
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
; copy_place$I64(_11$place(), _11$address, _1$place(), _1$address, _1$snapshot$0,
;   write)
; [eval] _11$place()
; [eval] _1$place()
; [eval] none < source_permission_amount
; [eval] compute_address(target_place, target_root_address)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _21$address@71@01
    (compute_address<Address> (as _11$place<Place>  Place) _11$address@13@01))
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
    _15$address@40@01
    (compute_address<Address> (as _11$place<Place>  Place) _11$address@13@01))
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
  _0$address@0@01
  (compute_address<Address> (as _11$place<Place>  Place) _11$address@13@01))))
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
    _20$address@65@01
    (compute_address<Address> (as _11$place<Place>  Place) _11$address@13@01))
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
    _4$address@80@01
    (compute_address<Address> (as _11$place<Place>  Place) _11$address@13@01))
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
    _5$address@86@01
    (compute_address<Address> (as _11$place<Place>  Place) _11$address@13@01))
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
    _6$address@92@01
    (compute_address<Address> (as _11$place<Place>  Place) _11$address@13@01))
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
    _7$address@100@01
    (compute_address<Address> (as _11$place<Place>  Place) _11$address@13@01))
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
    (compute_address<Address> (as _10$place<Place>  Place) _10$address@8@01)
    (compute_address<Address> (as _11$place<Place>  Place) _11$address@13@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
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
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _10$place<Place>  Place)) _10$address@8@01)
  (compute_address<Address> (as _11$place<Place>  Place) _11$address@13@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  _11$address@13@01
  (compute_address<Address> (as _11$place<Place>  Place) _11$address@13@01))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(declare-const $t@215@01 $Snap)
(assert (= $t@215@01 ($Snap.combine ($Snap.first $t@215@01) ($Snap.second $t@215@01))))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= (as _8$place<Place>  Place) (as _1$place<Place>  Place))
  (= _8$address@106@01 _1$address@6@01)
  (=
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _10$snapshot$1@10@01)
    _1$snapshot$0@7@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second $t@215@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@215@01))
    ($Snap.second ($Snap.second $t@215@01)))))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= (as _8$place<Place>  Place) (as _11$place<Place>  Place))
  (= _8$address@106@01 _11$address@13@01)
  (=
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _10$snapshot$1@10@01)
    _1$snapshot$0@7@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= (as _1$place<Place>  Place) (as _11$place<Place>  Place))
  (= _1$address@6@01 _11$address@13@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (= ($Snap.second ($Snap.second $t@215@01)) $Snap.unit))
; [eval] valid$Snap$I64(source_snapshot)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _11$snapshot$1 == _1$snapshot$0
(declare-const $t@216@01 $Snap)
(assert (= $t@216@01 $Snap.unit))
; [eval] _11$snapshot$1 == _1$snapshot$0
(assert (= _11$snapshot$1@15@01 _1$snapshot$0@7@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; tmp$2 := assign$Bool$BinaryOp$LtCmp$Move$I64$Move$I64$$$$(_7$place(), _7$address,
;   _8$place(), _8$address, _8$snapshot$1, _11$place(), _11$address, _11$snapshot$1)
; [eval] _7$place()
; [eval] _8$place()
; [eval] _11$place()
; [eval] compute_address(target_place, target_address)
; [eval] Size$Bool$()
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _21$address@71@01
    (compute_address<Address> (as _7$place<Place>  Place) _7$address@100@01))
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
    _15$address@40@01
    (compute_address<Address> (as _7$place<Place>  Place) _7$address@100@01))
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
    _0$address@0@01
    (compute_address<Address> (as _7$place<Place>  Place) _7$address@100@01))
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
    _20$address@65@01
    (compute_address<Address> (as _7$place<Place>  Place) _7$address@100@01))
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
    _4$address@80@01
    (compute_address<Address> (as _7$place<Place>  Place) _7$address@100@01))
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
  _5$address@86@01
  (compute_address<Address> (as _7$place<Place>  Place) _7$address@100@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  _6$address@92@01
  (compute_address<Address> (as _7$place<Place>  Place) _7$address@100@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  _7$address@100@01
  (compute_address<Address> (as _7$place<Place>  Place) _7$address@100@01))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= (as _11$place<Place>  Place) (as _8$place<Place>  Place))
  (= _11$address@13@01 _8$address@106@01)
  (= _1$snapshot$0@7@01 _8$snapshot$1@108@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _10$snapshot$1@10@01)
  _8$snapshot$1@108@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [eval] valid$Snap$I64(operand1_value)
(set-option :timeout 0)
(push) ; 5
(assert (not (valid$Snap$I64<Bool> _8$snapshot$1@108@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (valid$Snap$I64<Bool> _8$snapshot$1@108@01))
(push) ; 5
(set-option :timeout 10)
(assert (not (= _1$snapshot$0@7@01 _11$snapshot$1@15@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [eval] valid$Snap$I64(operand2_value)
(set-option :timeout 0)
(push) ; 5
(assert (not (valid$Snap$I64<Bool> _11$snapshot$1@15@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (valid$Snap$I64<Bool> _11$snapshot$1@15@01))
(declare-const result_value@217@01 Snap$Bool)
(declare-const $t@218@01 $Snap)
(assert (= $t@218@01 ($Snap.combine ($Snap.first $t@218@01) ($Snap.second $t@218@01))))
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _10$place<Place>  Place))
    (as _7$place<Place>  Place))
  (= _10$address@8@01 _7$address@100@01)
  (=
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> result_value@204@01)
    result_value@217@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= (as _2$place<Place>  Place) (as _7$place<Place>  Place))
  (= _2$address@62@01 _7$address@100@01)
  (= result_value@185@01 result_value@217@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second $t@218@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@218@01))
    ($Snap.second ($Snap.second $t@218@01)))))
; [eval] compute_address(operand1_place, operand1_root_address)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _21$address@71@01
    (compute_address<Address> (as _8$place<Place>  Place) _8$address@106@01))
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
    _15$address@40@01
    (compute_address<Address> (as _8$place<Place>  Place) _8$address@106@01))
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
  _0$address@0@01
  (compute_address<Address> (as _8$place<Place>  Place) _8$address@106@01))))
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
    _20$address@65@01
    (compute_address<Address> (as _8$place<Place>  Place) _8$address@106@01))
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
    _4$address@80@01
    (compute_address<Address> (as _8$place<Place>  Place) _8$address@106@01))
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
    _5$address@86@01
    (compute_address<Address> (as _8$place<Place>  Place) _8$address@106@01))
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
    _6$address@92@01
    (compute_address<Address> (as _8$place<Place>  Place) _8$address@106@01))
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
    (compute_address<Address> (as _10$place<Place>  Place) _10$address@8@01)
    (compute_address<Address> (as _8$place<Place>  Place) _8$address@106@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
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
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _10$place<Place>  Place)) _10$address@8@01)
  (compute_address<Address> (as _8$place<Place>  Place) _8$address@106@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second $t@218@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@218@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@218@01))))))
; [eval] compute_address(operand2_place, operand2_root_address)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _10$place<Place>  Place)) _10$address@8@01)
  (compute_address<Address> (as _11$place<Place>  Place) _11$address@13@01))))
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
    (compute_address<Address> (as _10$place<Place>  Place) _10$address@8@01)
    (compute_address<Address> (as _11$place<Place>  Place) _11$address@13@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
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
    _6$address@92@01
    (compute_address<Address> (as _11$place<Place>  Place) _11$address@13@01))
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
    _5$address@86@01
    (compute_address<Address> (as _11$place<Place>  Place) _11$address@13@01))
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
    _4$address@80@01
    (compute_address<Address> (as _11$place<Place>  Place) _11$address@13@01))
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
    _20$address@65@01
    (compute_address<Address> (as _11$place<Place>  Place) _11$address@13@01))
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
  _0$address@0@01
  (compute_address<Address> (as _11$place<Place>  Place) _11$address@13@01))))
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
    _15$address@40@01
    (compute_address<Address> (as _11$place<Place>  Place) _11$address@13@01))
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
    (compute_address<Address> (as _11$place<Place>  Place) _11$address@13@01))
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
  (compute_address<Address> (as _8$place<Place>  Place) _8$address@106@01)
  (compute_address<Address> (as _11$place<Place>  Place) _11$address@13@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@218@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@218@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@218@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@218@01))))
  $Snap.unit))
; [eval] result_value == constructor$Snap$Bool$LtCmp_I64(operand1_value, operand2_value)
; [eval] constructor$Snap$Bool$LtCmp_I64(operand1_value, operand2_value)
(assert (=
  result_value@217@01
  (constructor$Snap$Bool$LtCmp_I64<Snap$Bool> _8$snapshot$1@108@01 _11$snapshot$1@15@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@218@01))))
  $Snap.unit))
; [eval] valid$Snap$Bool(result_value)
(assert (valid$Snap$Bool<Bool> result_value@217@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _7$snapshot$1 == tmp$2
(declare-const $t@219@01 $Snap)
(assert (= $t@219@01 $Snap.unit))
; [eval] _7$snapshot$1 == tmp$2
(assert (= _7$snapshot$1@102@01 result_value@217@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; exhale acc(MemoryBlock(_11$address, Size$I64$()), write)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _11$place<Place>  Place) _11$address@13@01)
  _11$address@13@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(MemoryBlockStackDrop(_11$address, Size$I64$()), write)
; [eval] Size$I64$()
; [exec]
; exhale acc(MemoryBlock(_8$address, Size$I64$()), write)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _10$place<Place>  Place)) _10$address@8@01)
  _8$address@106@01)))
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
    (compute_address<Address> (as _10$place<Place>  Place) _10$address@8@01)
    _8$address@106@01)
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
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
  (= _6$address@92@01 _8$address@106@01)
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
  (= _5$address@86@01 _8$address@106@01)
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
  (= _4$address@80@01 _8$address@106@01)
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
  (= _20$address@65@01 _8$address@106@01)
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
(assert (not (= _0$address@0@01 _8$address@106@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _15$address@40@01 _8$address@106@01)
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
  (= _21$address@71@01 _8$address@106@01)
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
  (compute_address<Address> (as _8$place<Place>  Place) _8$address@106@01)
  _8$address@106@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(MemoryBlockStackDrop(_8$address, Size$I64$()), write)
; [eval] Size$I64$()
; [eval] !destructor$Snap$Bool$$value(_7$snapshot$1)
; [eval] destructor$Snap$Bool$$value(_7$snapshot$1)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (destructor$Snap$Bool$$value<Bool> _7$snapshot$1@102@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [then-branch: 3 | !(destructor$Snap$Bool$$value[Bool](_7$snapshot$1@102@01)) | dead]
; [else-branch: 3 | destructor$Snap$Bool$$value[Bool](_7$snapshot$1@102@01) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 3 | destructor$Snap$Bool$$value[Bool](_7$snapshot$1@102@01)]
(assert (destructor$Snap$Bool$$value<Bool> _7$snapshot$1@102@01))
(pop) ; 5
; [eval] !!destructor$Snap$Bool$$value(_7$snapshot$1)
; [eval] !destructor$Snap$Bool$$value(_7$snapshot$1)
; [eval] destructor$Snap$Bool$$value(_7$snapshot$1)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (destructor$Snap$Bool$$value<Bool> _7$snapshot$1@102@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (destructor$Snap$Bool$$value<Bool> _7$snapshot$1@102@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [then-branch: 4 | destructor$Snap$Bool$$value[Bool](_7$snapshot$1@102@01) | live]
; [else-branch: 4 | !(destructor$Snap$Bool$$value[Bool](_7$snapshot$1@102@01)) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 4 | destructor$Snap$Bool$$value[Bool](_7$snapshot$1@102@01)]
(assert (destructor$Snap$Bool$$value<Bool> _7$snapshot$1@102@01))
(push) ; 6
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [then-branch: 5 | True | live]
; [else-branch: 5 | False | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 5 | True]
; [exec]
; label label_4_custom
; [exec]
; label_4_custom$marker := true
; [exec]
; inhale basic_block_marker$label_4_custom$marker()
(declare-const $t@220@01 $Snap)
(assert (= $t@220@01 $Snap.unit))
; [eval] basic_block_marker$label_4_custom$marker()
(assert (as basic_block_marker$label_4_custom$marker<Bool>  Bool))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; label label_bb4
; [exec]
; label_bb4$marker := true
; [exec]
; inhale basic_block_marker$label_bb4$marker()
(declare-const $t@221@01 $Snap)
(assert (= $t@221@01 $Snap.unit))
; [eval] basic_block_marker$label_bb4$marker()
(assert (as basic_block_marker$label_bb4$marker<Bool>  Bool))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlock(_12$address, Size$Bool$()), write)
; [eval] Size$Bool$()
(declare-const $t@222@01 $Snap)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (= _21$address@71@01 _12$address@19@01)
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
  (= _15$address@40@01 _12$address@19@01)
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
  (= _0$address@0@01 _12$address@19@01)
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
  (= _20$address@65@01 _12$address@19@01)
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
  (= _4$address@80@01 _12$address@19@01)
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
(assert (not (= _5$address@86@01 _12$address@19@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= _6$address@92@01 _12$address@19@01)))
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
    (compute_address<Address> (as _10$place<Place>  Place) _10$address@8@01)
    _12$address@19@01)
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
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _10$place<Place>  Place)) _10$address@8@01)
    _12$address@19@01)
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
; inhale acc(MemoryBlockStackDrop(_12$address, Size$Bool$()), write)
; [eval] Size$Bool$()
(declare-const $t@223@01 $Snap)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= _2$address@62@01 _12$address@19@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (= _4$address@80@01 _12$address@19@01)
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
(assert (not (= _5$address@86@01 _12$address@19@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= _6$address@92@01 _12$address@19@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= _7$address@100@01 _12$address@19@01)))
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
; inhale acc(MemoryBlock(_13$address, Size$I64$()), write)
; [eval] Size$I64$()
(declare-const $t@224@01 $Snap)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (= _12$address@19@01 _13$address@26@01)
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
  (= _21$address@71@01 _13$address@26@01)
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
  (= _15$address@40@01 _13$address@26@01)
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
(assert (not (= _0$address@0@01 _13$address@26@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (= _20$address@65@01 _13$address@26@01)
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
  (= _4$address@80@01 _13$address@26@01)
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
  (= _5$address@86@01 _13$address@26@01)
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
  (= _6$address@92@01 _13$address@26@01)
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
    (compute_address<Address> (as _10$place<Place>  Place) _10$address@8@01)
    _13$address@26@01)
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
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _10$place<Place>  Place)) _10$address@8@01)
  _13$address@26@01)))
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
; inhale acc(MemoryBlockStackDrop(_13$address, Size$I64$()), write)
; [eval] Size$I64$()
(declare-const $t@225@01 $Snap)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (= _12$address@19@01 _13$address@26@01)
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
  (= _2$address@62@01 _13$address@26@01)
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
  (= _4$address@80@01 _13$address@26@01)
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
  (= _5$address@86@01 _13$address@26@01)
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
  (= _6$address@92@01 _13$address@26@01)
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
  (= _7$address@100@01 _13$address@26@01)
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
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
; inhale acc(MemoryBlock(_14$address, Size$I64$()), write)
; [eval] Size$I64$()
(declare-const $t@226@01 $Snap)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= _13$address@26@01 _14$address@33@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (= _12$address@19@01 _14$address@33@01)
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
  (= _21$address@71@01 _14$address@33@01)
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
  (= _15$address@40@01 _14$address@33@01)
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
(assert (not (= _0$address@0@01 _14$address@33@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (= _20$address@65@01 _14$address@33@01)
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
  (= _4$address@80@01 _14$address@33@01)
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
  (= _5$address@86@01 _14$address@33@01)
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
  (= _6$address@92@01 _14$address@33@01)
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
    (compute_address<Address> (as _10$place<Place>  Place) _10$address@8@01)
    _14$address@33@01)
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
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _10$place<Place>  Place)) _10$address@8@01)
  _14$address@33@01)))
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
; inhale acc(MemoryBlockStackDrop(_14$address, Size$I64$()), write)
; [eval] Size$I64$()
(declare-const $t@227@01 $Snap)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= _13$address@26@01 _14$address@33@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (= _12$address@19@01 _14$address@33@01)
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
  (= _2$address@62@01 _14$address@33@01)
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
  (= _4$address@80@01 _14$address@33@01)
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
  (= _5$address@86@01 _14$address@33@01)
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
  (= _6$address@92@01 _14$address@33@01)
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
  (= _7$address@100@01 _14$address@33@01)
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
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
; copy_place$I64(_14$place(), _14$address, _1$place(), _1$address, _1$snapshot$0,
;   write)
; [eval] _14$place()
; [eval] _1$place()
; [eval] none < source_permission_amount
; [eval] compute_address(target_place, target_root_address)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _10$place<Place>  Place)) _10$address@8@01)
  (compute_address<Address> (as _14$place<Place>  Place) _14$address@33@01))))
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
    (compute_address<Address> (as _10$place<Place>  Place) _10$address@8@01)
    (compute_address<Address> (as _14$place<Place>  Place) _14$address@33@01))
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
    _6$address@92@01
    (compute_address<Address> (as _14$place<Place>  Place) _14$address@33@01))
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
    _5$address@86@01
    (compute_address<Address> (as _14$place<Place>  Place) _14$address@33@01))
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
    _4$address@80@01
    (compute_address<Address> (as _14$place<Place>  Place) _14$address@33@01))
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
    _20$address@65@01
    (compute_address<Address> (as _14$place<Place>  Place) _14$address@33@01))
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
  _0$address@0@01
  (compute_address<Address> (as _14$place<Place>  Place) _14$address@33@01))))
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
    _15$address@40@01
    (compute_address<Address> (as _14$place<Place>  Place) _14$address@33@01))
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
    _21$address@71@01
    (compute_address<Address> (as _14$place<Place>  Place) _14$address@33@01))
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
    _12$address@19@01
    (compute_address<Address> (as _14$place<Place>  Place) _14$address@33@01))
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
  _13$address@26@01
  (compute_address<Address> (as _14$place<Place>  Place) _14$address@33@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  _14$address@33@01
  (compute_address<Address> (as _14$place<Place>  Place) _14$address@33@01))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(declare-const $t@228@01 $Snap)
(assert (= $t@228@01 ($Snap.combine ($Snap.first $t@228@01) ($Snap.second $t@228@01))))
(assert (=
  ($Snap.second $t@228@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@228@01))
    ($Snap.second ($Snap.second $t@228@01)))))
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (= (as _1$place<Place>  Place) (as _14$place<Place>  Place))
  (= _1$address@6@01 _14$address@33@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (= ($Snap.second ($Snap.second $t@228@01)) $Snap.unit))
; [eval] valid$Snap$I64(source_snapshot)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _14$snapshot$1 == _1$snapshot$0
(declare-const $t@229@01 $Snap)
(assert (= $t@229@01 $Snap.unit))
; [eval] _14$snapshot$1 == _1$snapshot$0
(assert (= _14$snapshot$1@35@01 _1$snapshot$0@7@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; tmp$3 := assign$Tuple$$I64$Bool$$I64$Bool$$CheckedBinaryOp$Sub$Copy$I64$Constant$I64$$$$(_15$place(),
;   _15$address, _14$place(), _14$address, _14$snapshot$1, constructor$Snap$I64$(1))
; [eval] _15$place()
; [eval] _14$place()
; [eval] constructor$Snap$I64$(1)
; [eval] compute_address(target_place, target_address)
; [eval] Size$Tuple$$I64$Bool$$I64$Bool$$()
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _10$place<Place>  Place)) _10$address@8@01)
    (compute_address<Address> (as _15$place<Place>  Place) _15$address@40@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
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
  (=
    (compute_address<Address> (as _10$place<Place>  Place) _10$address@8@01)
    (compute_address<Address> (as _15$place<Place>  Place) _15$address@40@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
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
  (=
    _6$address@92@01
    (compute_address<Address> (as _15$place<Place>  Place) _15$address@40@01))
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
  (=
    _5$address@86@01
    (compute_address<Address> (as _15$place<Place>  Place) _15$address@40@01))
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
  (=
    _4$address@80@01
    (compute_address<Address> (as _15$place<Place>  Place) _15$address@40@01))
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
  _20$address@65@01
  (compute_address<Address> (as _15$place<Place>  Place) _15$address@40@01))))
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
    (compute_address<Address> (as _15$place<Place>  Place) _15$address@40@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
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
  _15$address@40@01
  (compute_address<Address> (as _15$place<Place>  Place) _15$address@40@01))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= _1$snapshot$0@7@01 _14$snapshot$1@35@01)))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [eval] valid$Snap$I64(operand1_value)
(set-option :timeout 0)
(push) ; 7
(assert (not (valid$Snap$I64<Bool> _14$snapshot$1@35@01)))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (valid$Snap$I64<Bool> _14$snapshot$1@35@01))
; [eval] valid$Snap$I64(operand2_value)
(declare-const result_value@230@01 Snap$Tuple$$I64$Bool$$I64$Bool$)
(declare-const $t@231@01 $Snap)
(assert (= $t@231@01 ($Snap.combine ($Snap.first $t@231@01) ($Snap.second $t@231@01))))
; [eval] compute_address(target_place, target_address)
; [eval] PaddingSize$Tuple$$I64$Bool$$I64$Bool$$()
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (=
    _13$address@26@01
    (compute_address<Address> (as _15$place<Place>  Place) _15$address@40@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
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
    _12$address@19@01
    (compute_address<Address> (as _15$place<Place>  Place) _15$address@40@01))
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
    (compute_address<Address> (as _15$place<Place>  Place) _15$address@40@01))
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
    _0$address@0@01
    (compute_address<Address> (as _15$place<Place>  Place) _15$address@40@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
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
    _20$address@65@01
    (compute_address<Address> (as _15$place<Place>  Place) _15$address@40@01))
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
    _4$address@80@01
    (compute_address<Address> (as _15$place<Place>  Place) _15$address@40@01))
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
    _5$address@86@01
    (compute_address<Address> (as _15$place<Place>  Place) _15$address@40@01))
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
    _6$address@92@01
    (compute_address<Address> (as _15$place<Place>  Place) _15$address@40@01))
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
(assert (not (=
  (compute_address<Address> (as _10$place<Place>  Place) _10$address@8@01)
  (compute_address<Address> (as _15$place<Place>  Place) _15$address@40@01))))
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
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _10$place<Place>  Place)) _10$address@8@01)
    (compute_address<Address> (as _15$place<Place>  Place) _15$address@40@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second $t@231@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@231@01))
    ($Snap.second ($Snap.second $t@231@01)))))
; [eval] field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(compute_address(target_place, target_address))
; [eval] compute_address(target_place, target_address)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _10$place<Place>  Place)) _10$address@8@01)
  (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _15$place<Place>  Place) _15$address@40@01)))))
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
    (compute_address<Address> (as _10$place<Place>  Place) _10$address@8@01)
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _15$place<Place>  Place) _15$address@40@01)))
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
    _6$address@92@01
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _15$place<Place>  Place) _15$address@40@01)))
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
    _5$address@86@01
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _15$place<Place>  Place) _15$address@40@01)))
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
    _4$address@80@01
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _15$place<Place>  Place) _15$address@40@01)))
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
    _20$address@65@01
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _15$place<Place>  Place) _15$address@40@01)))
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
  _0$address@0@01
  (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _15$place<Place>  Place) _15$address@40@01)))))
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
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _15$place<Place>  Place) _15$address@40@01)))
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
    _12$address@19@01
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _15$place<Place>  Place) _15$address@40@01)))
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
  _13$address@26@01
  (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _15$place<Place>  Place) _15$address@40@01)))))
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
    (compute_address<Address> (as _15$place<Place>  Place) _15$address@40@01)
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _15$place<Place>  Place) _15$address@40@01)))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second $t@231@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@231@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@231@01))))))
; [eval] field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(target_place)
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(result_value)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (=
    (as _2$place<Place>  Place)
    (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _15$place<Place>  Place)))
  (= _2$address@62@01 _15$address@40@01)
  (=
    result_value@185@01
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> result_value@230@01)))))
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
    (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _10$place<Place>  Place))
    (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _15$place<Place>  Place)))
  (= _10$address@8@01 _15$address@40@01)
  (=
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> result_value@204@01)
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> result_value@230@01)))))
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
    (as _7$place<Place>  Place)
    (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _15$place<Place>  Place)))
  (= _7$address@100@01 _15$address@40@01)
  (=
    result_value@217@01
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> result_value@230@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@231@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@231@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@231@01)))))))
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (= (as _1$place<Place>  Place) (as _14$place<Place>  Place))
  (= _1$address@6@01 _14$address@33@01)
  (= _1$snapshot$0@7@01 _14$snapshot$1@35@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@231@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@231@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@231@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@231@01)))))
  $Snap.unit))
; [eval] valid$Snap$I64(constructor$Snap$I64$Sub_I64(operand1_value, operand2_value)) ==> destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(result_value) == constructor$Snap$I64$Sub_I64(operand1_value, operand2_value)
; [eval] valid$Snap$I64(constructor$Snap$I64$Sub_I64(operand1_value, operand2_value))
; [eval] constructor$Snap$I64$Sub_I64(operand1_value, operand2_value)
(set-option :timeout 0)
(push) ; 7
(push) ; 8
(set-option :timeout 10)
(assert (not (not
  (valid$Snap$I64<Bool> (constructor$Snap$I64$Sub_I64<Snap$I64> _14$snapshot$1@35@01 (constructor$Snap$I64$<Snap$I64> 1))))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (valid$Snap$I64<Bool> (constructor$Snap$I64$Sub_I64<Snap$I64> _14$snapshot$1@35@01 (constructor$Snap$I64$<Snap$I64> 1)))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [then-branch: 6 | valid$Snap$I64[Bool](constructor$Snap$I64$Sub_I64[Snap$I64](_14$snapshot$1@35@01, constructor$Snap$I64$[Snap$I64](1))) | live]
; [else-branch: 6 | !(valid$Snap$I64[Bool](constructor$Snap$I64$Sub_I64[Snap$I64](_14$snapshot$1@35@01, constructor$Snap$I64$[Snap$I64](1)))) | dead]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 6 | valid$Snap$I64[Bool](constructor$Snap$I64$Sub_I64[Snap$I64](_14$snapshot$1@35@01, constructor$Snap$I64$[Snap$I64](1)))]
(assert (valid$Snap$I64<Bool> (constructor$Snap$I64$Sub_I64<Snap$I64> _14$snapshot$1@35@01 (constructor$Snap$I64$<Snap$I64> 1))))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(result_value) == constructor$Snap$I64$Sub_I64(operand1_value, operand2_value)
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(result_value)
; [eval] constructor$Snap$I64$Sub_I64(operand1_value, operand2_value)
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (valid$Snap$I64<Bool> (constructor$Snap$I64$Sub_I64<Snap$I64> _14$snapshot$1@35@01 (constructor$Snap$I64$<Snap$I64> 1))))
(assert (=>
  (valid$Snap$I64<Bool> (constructor$Snap$I64$Sub_I64<Snap$I64> _14$snapshot$1@35@01 (constructor$Snap$I64$<Snap$I64> 1)))
  (=
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> result_value@230@01)
    (constructor$Snap$I64$Sub_I64<Snap$I64> _14$snapshot$1@35@01 (constructor$Snap$I64$<Snap$I64> 1)))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@231@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@231@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@231@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@231@01))))))
  $Snap.unit))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(result_value) == constructor$Snap$Bool$(!valid$Snap$I64(constructor$Snap$I64$Sub_I64(operand1_value, operand2_value)))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(result_value)
; [eval] constructor$Snap$Bool$(!valid$Snap$I64(constructor$Snap$I64$Sub_I64(operand1_value, operand2_value)))
; [eval] !valid$Snap$I64(constructor$Snap$I64$Sub_I64(operand1_value, operand2_value))
; [eval] valid$Snap$I64(constructor$Snap$I64$Sub_I64(operand1_value, operand2_value))
; [eval] constructor$Snap$I64$Sub_I64(operand1_value, operand2_value)
(assert (=
  (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> result_value@230@01)
  (constructor$Snap$Bool$<Snap$Bool> (not
    (valid$Snap$I64<Bool> (constructor$Snap$I64$Sub_I64<Snap$I64> _14$snapshot$1@35@01 (constructor$Snap$I64$<Snap$I64> 1)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@231@01))))))
  $Snap.unit))
; [eval] MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(compute_address(target_place, target_address)), Size$I64$()) == to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(result_value))
; [eval] MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(compute_address(target_place, target_address)), Size$I64$())
; [eval] field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(compute_address(target_place, target_address))
; [eval] compute_address(target_place, target_address)
; [eval] Size$I64$()
(push) ; 7
(declare-const $k@232@01 $Perm)
(assert ($Perm.isReadVar $k@232@01))
(assert (< $k@232@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@232@01)))
(push) ; 8
(set-option :timeout 10)
(assert (not (< $Perm.No $k@232@01)))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@231@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _15$place<Place>  Place) _15$address@40@01)) (as Size$I64$<Snap$Usize>  Snap$Usize)))
(pop) ; 7
; Joined path conditions
(assert ($Perm.isReadVar $k@232@01))
(assert (and
  (< $k@232@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@232@01))
  (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@231@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _15$place<Place>  Place) _15$address@40@01)) (as Size$I64$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(result_value))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(result_value)
(assert (=
  (MemoryBlock$bytes ($Snap.first ($Snap.second $t@231@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _15$place<Place>  Place) _15$address@40@01)) (as Size$I64$<Snap$Usize>  Snap$Usize))
  (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> result_value@230@01))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _15$snapshot$1 == tmp$3
(declare-const $t@233@01 $Snap)
(assert (= $t@233@01 $Snap.unit))
; [eval] _15$snapshot$1 == tmp$3
(assert (= _15$snapshot$1@42@01 result_value@230@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [eval] !destructor$Snap$Bool$$value(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(_15$snapshot$1))
; [eval] destructor$Snap$Bool$$value(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(_15$snapshot$1))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(_15$snapshot$1)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (destructor$Snap$Bool$$value<Bool> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> _15$snapshot$1@42@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not
  (destructor$Snap$Bool$$value<Bool> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> _15$snapshot$1@42@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [then-branch: 7 | !(destructor$Snap$Bool$$value[Bool](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](_15$snapshot$1@42@01))) | live]
; [else-branch: 7 | destructor$Snap$Bool$$value[Bool](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](_15$snapshot$1@42@01)) | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 7 | !(destructor$Snap$Bool$$value[Bool](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](_15$snapshot$1@42@01)))]
(assert (not
  (destructor$Snap$Bool$$value<Bool> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> _15$snapshot$1@42@01))))
; [exec]
; label label_bb7
; [exec]
; label_bb7$marker := true
; [exec]
; inhale basic_block_marker$label_bb7$marker()
(declare-const $t@234@01 $Snap)
(assert (= $t@234@01 $Snap.unit))
; [eval] basic_block_marker$label_bb7$marker()
(assert (as basic_block_marker$label_bb7$marker<Bool>  Bool))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; fold acc(OwnedNonAliased$I64(field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(_15$place()),
;   _15$address, destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(_15$snapshot$1)), write)
; [eval] field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(_15$place())
; [eval] _15$place()
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(_15$snapshot$1)
; [eval] valid$Snap$I64(snapshot)
(set-option :timeout 0)
(push) ; 8
(assert (not (valid$Snap$I64<Bool> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _15$snapshot$1@42@01))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (valid$Snap$I64<Bool> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _15$snapshot$1@42@01)))
; [eval] compute_address(place, root_address)
; [eval] Size$I64$()
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _15$place<Place>  Place) _15$address@40@01))
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _15$place<Place>  Place)) _15$address@40@01))))
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
(declare-const $k@235@01 $Perm)
(assert ($Perm.isReadVar $k@235@01))
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _15$place<Place>  Place) _15$address@40@01))
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _15$place<Place>  Place)) _15$address@40@01))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (< $k@235@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@235@01)))
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (< $Perm.No $k@235@01)))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@231@01)) (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _15$place<Place>  Place)) _15$address@40@01) (as Size$I64$<Snap$Usize>  Snap$Usize)))
(pop) ; 8
; Joined path conditions
(assert ($Perm.isReadVar $k@235@01))
(assert (and
  (< $k@235@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@235@01))
  (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@231@01)) (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _15$place<Place>  Place)) _15$address@40@01) (as Size$I64$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$I64(snapshot)
(set-option :timeout 0)
(push) ; 8
(assert (not (=
  (MemoryBlock$bytes ($Snap.first ($Snap.second $t@231@01)) (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _15$place<Place>  Place)) _15$address@40@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
  (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _15$snapshot$1@42@01)))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (=
  (MemoryBlock$bytes ($Snap.first ($Snap.second $t@231@01)) (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _15$place<Place>  Place)) _15$address@40@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
  (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _15$snapshot$1@42@01))))
(assert (OwnedNonAliased$I64%trigger ($Snap.combine
  $Snap.unit
  ($Snap.combine ($Snap.first ($Snap.second $t@231@01)) $Snap.unit)) (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _15$place<Place>  Place)) _15$address@40@01 (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _15$snapshot$1@42@01)))
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    (as _1$place<Place>  Place)
    (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _15$place<Place>  Place)))
  (= _1$address@6@01 _15$address@40@01)
  (=
    _1$snapshot$0@7@01
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _15$snapshot$1@42@01)))))
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
    (as _14$place<Place>  Place)
    (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _15$place<Place>  Place)))
  (= _14$address@33@01 _15$address@40@01)
  (=
    _14$snapshot$1@35@01
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _15$snapshot$1@42@01)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [exec]
; move_place$I64(_13$place(), _13$address, field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(_15$place()),
;   _15$address, destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(_15$snapshot$1))
; [eval] _13$place()
; [eval] field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(_15$place())
; [eval] _15$place()
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(_15$snapshot$1)
; [eval] compute_address(target_place, target_root_address)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _15$place<Place>  Place) _15$address@40@01)
    (compute_address<Address> (as _13$place<Place>  Place) _13$address@26@01))
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
  _13$address@26@01
  (compute_address<Address> (as _13$place<Place>  Place) _13$address@26@01))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(declare-const $t@236@01 $Snap)
(assert (= $t@236@01 ($Snap.combine ($Snap.first $t@236@01) ($Snap.second $t@236@01))))
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (= (as _14$place<Place>  Place) (as _13$place<Place>  Place))
  (= _14$address@33@01 _13$address@26@01)
  (=
    _14$snapshot$1@35@01
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _15$snapshot$1@42@01)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (= (as _1$place<Place>  Place) (as _13$place<Place>  Place))
  (= _1$address@6@01 _13$address@26@01)
  (=
    _1$snapshot$0@7@01
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _15$snapshot$1@42@01)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second $t@236@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@236@01))
    ($Snap.second ($Snap.second $t@236@01)))))
; [eval] compute_address(source_place, source_root_address)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _15$place<Place>  Place) _15$address@40@01)
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _15$place<Place>  Place)) _15$address@40@01))
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
    _12$address@19@01
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _15$place<Place>  Place)) _15$address@40@01))
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
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _15$place<Place>  Place)) _15$address@40@01))
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
  _0$address@0@01
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _15$place<Place>  Place)) _15$address@40@01))))
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
    _20$address@65@01
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _15$place<Place>  Place)) _15$address@40@01))
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
    _4$address@80@01
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _15$place<Place>  Place)) _15$address@40@01))
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
    _5$address@86@01
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _15$place<Place>  Place)) _15$address@40@01))
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
    _6$address@92@01
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _15$place<Place>  Place)) _15$address@40@01))
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
    (compute_address<Address> (as _10$place<Place>  Place) _10$address@8@01)
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _15$place<Place>  Place)) _15$address@40@01))
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
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _10$place<Place>  Place)) _10$address@8@01)
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _15$place<Place>  Place)) _15$address@40@01))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (= ($Snap.second ($Snap.second $t@236@01)) $Snap.unit))
; [eval] valid$Snap$I64(source_snapshot)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _13$snapshot$1 ==
;   destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(_15$snapshot$1)
(declare-const $t@237@01 $Snap)
(assert (= $t@237@01 $Snap.unit))
; [eval] _13$snapshot$1 == destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(_15$snapshot$1)
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(_15$snapshot$1)
(assert (=
  _13$snapshot$1@28@01
  (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _15$snapshot$1@42@01)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; into_memory_block$I64(_14$place(), _14$address, _14$snapshot$1)
; [eval] _14$place()
; [eval] compute_address(place, root_address)
; [eval] Size$I64$()
(declare-const $t@238@01 $Snap)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _10$place<Place>  Place)) _10$address@8@01)
  (compute_address<Address> (as _14$place<Place>  Place) _14$address@33@01))))
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
    (compute_address<Address> (as _10$place<Place>  Place) _10$address@8@01)
    (compute_address<Address> (as _14$place<Place>  Place) _14$address@33@01))
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
    _6$address@92@01
    (compute_address<Address> (as _14$place<Place>  Place) _14$address@33@01))
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
    _5$address@86@01
    (compute_address<Address> (as _14$place<Place>  Place) _14$address@33@01))
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
    _4$address@80@01
    (compute_address<Address> (as _14$place<Place>  Place) _14$address@33@01))
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
    _20$address@65@01
    (compute_address<Address> (as _14$place<Place>  Place) _14$address@33@01))
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
  _0$address@0@01
  (compute_address<Address> (as _14$place<Place>  Place) _14$address@33@01))))
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
    (compute_address<Address> (as _14$place<Place>  Place) _14$address@33@01))
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
    _12$address@19@01
    (compute_address<Address> (as _14$place<Place>  Place) _14$address@33@01))
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
    (compute_address<Address> (as _15$place<Place>  Place) _15$address@40@01)
    (compute_address<Address> (as _14$place<Place>  Place) _14$address@33@01))
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
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _15$place<Place>  Place)) _15$address@40@01)
  (compute_address<Address> (as _14$place<Place>  Place) _14$address@33@01))))
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
; exhale acc(MemoryBlock(_14$address, Size$I64$()), write)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _14$place<Place>  Place) _14$address@33@01)
  _14$address@33@01)))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(MemoryBlockStackDrop(_14$address, Size$I64$()), write)
; [eval] Size$I64$()
; [exec]
; tmp$4 := assign$Bool$BinaryOp$GeCmp$Move$I64$Constant$I64$$$$(_12$place(), _12$address,
;   _13$place(), _13$address, _13$snapshot$1, constructor$Snap$I64$(0))
; [eval] _12$place()
; [eval] _13$place()
; [eval] constructor$Snap$I64$(0)
; [eval] compute_address(target_place, target_address)
; [eval] Size$Bool$()
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _10$place<Place>  Place)) _10$address@8@01)
    (compute_address<Address> (as _12$place<Place>  Place) _12$address@19@01))
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
    (compute_address<Address> (as _10$place<Place>  Place) _10$address@8@01)
    (compute_address<Address> (as _12$place<Place>  Place) _12$address@19@01))
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
  _6$address@92@01
  (compute_address<Address> (as _12$place<Place>  Place) _12$address@19@01))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  _5$address@86@01
  (compute_address<Address> (as _12$place<Place>  Place) _12$address@19@01))))
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
    _4$address@80@01
    (compute_address<Address> (as _12$place<Place>  Place) _12$address@19@01))
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
    _20$address@65@01
    (compute_address<Address> (as _12$place<Place>  Place) _12$address@19@01))
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
    (compute_address<Address> (as _12$place<Place>  Place) _12$address@19@01))
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
    _21$address@71@01
    (compute_address<Address> (as _12$place<Place>  Place) _12$address@19@01))
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
(assert (not (=
  _12$address@19@01
  (compute_address<Address> (as _12$place<Place>  Place) _12$address@19@01))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _15$snapshot$1@42@01)
  _13$snapshot$1@28@01)))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [eval] valid$Snap$I64(operand1_value)
(set-option :timeout 0)
(push) ; 8
(assert (not (valid$Snap$I64<Bool> _13$snapshot$1@28@01)))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (valid$Snap$I64<Bool> _13$snapshot$1@28@01))
; [eval] valid$Snap$I64(operand2_value)
(declare-const result_value@239@01 Snap$Bool)
(declare-const $t@240@01 $Snap)
(assert (= $t@240@01 ($Snap.combine ($Snap.first $t@240@01) ($Snap.second $t@240@01))))
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _15$place<Place>  Place))
    (as _12$place<Place>  Place))
  (= _15$address@40@01 _12$address@19@01)
  (=
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> result_value@230@01)
    result_value@239@01))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (= (as _2$place<Place>  Place) (as _12$place<Place>  Place))
  (= _2$address@62@01 _12$address@19@01)
  (= result_value@185@01 result_value@239@01))))
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
    (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _10$place<Place>  Place))
    (as _12$place<Place>  Place))
  (= _10$address@8@01 _12$address@19@01)
  (=
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> result_value@204@01)
    result_value@239@01))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (= (as _7$place<Place>  Place) (as _12$place<Place>  Place))
  (= _7$address@100@01 _12$address@19@01)
  (= result_value@217@01 result_value@239@01))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second $t@240@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@240@01))
    ($Snap.second ($Snap.second $t@240@01)))))
; [eval] compute_address(operand1_place, operand1_root_address)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _10$place<Place>  Place)) _10$address@8@01)
  (compute_address<Address> (as _13$place<Place>  Place) _13$address@26@01))))
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
    (compute_address<Address> (as _10$place<Place>  Place) _10$address@8@01)
    (compute_address<Address> (as _13$place<Place>  Place) _13$address@26@01))
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
    _6$address@92@01
    (compute_address<Address> (as _13$place<Place>  Place) _13$address@26@01))
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
    _5$address@86@01
    (compute_address<Address> (as _13$place<Place>  Place) _13$address@26@01))
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
    _4$address@80@01
    (compute_address<Address> (as _13$place<Place>  Place) _13$address@26@01))
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
    _20$address@65@01
    (compute_address<Address> (as _13$place<Place>  Place) _13$address@26@01))
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
  _0$address@0@01
  (compute_address<Address> (as _13$place<Place>  Place) _13$address@26@01))))
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
    (compute_address<Address> (as _13$place<Place>  Place) _13$address@26@01))
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
    (compute_address<Address> (as _15$place<Place>  Place) _15$address@40@01)
    (compute_address<Address> (as _13$place<Place>  Place) _13$address@26@01))
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
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _15$place<Place>  Place)) _15$address@40@01)
  (compute_address<Address> (as _13$place<Place>  Place) _13$address@26@01))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second $t@240@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@240@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@240@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@240@01))) $Snap.unit))
; [eval] result_value == constructor$Snap$Bool$GeCmp_I64(operand1_value, operand2_value)
; [eval] constructor$Snap$Bool$GeCmp_I64(operand1_value, operand2_value)
(assert (=
  result_value@239@01
  (constructor$Snap$Bool$GeCmp_I64<Snap$Bool> _13$snapshot$1@28@01 (constructor$Snap$I64$<Snap$I64> 0))))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@240@01))) $Snap.unit))
; [eval] valid$Snap$Bool(result_value)
(assert (valid$Snap$Bool<Bool> result_value@239@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _12$snapshot$1 == tmp$4
(declare-const $t@241@01 $Snap)
(assert (= $t@241@01 $Snap.unit))
; [eval] _12$snapshot$1 == tmp$4
(assert (= _12$snapshot$1@21@01 result_value@239@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; exhale acc(MemoryBlock(_13$address, Size$I64$()), write)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _13$place<Place>  Place) _13$address@26@01)
  _13$address@26@01)))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(MemoryBlockStackDrop(_13$address, Size$I64$()), write)
; [eval] Size$I64$()
; [exec]
; move_place$Bool(_6$place(), _6$address, _12$place(), _12$address, _12$snapshot$1)
; [eval] _6$place()
; [eval] _12$place()
; [eval] compute_address(target_place, target_root_address)
; [eval] Size$Bool$()
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _10$place<Place>  Place)) _10$address@8@01)
    (compute_address<Address> (as _6$place<Place>  Place) _6$address@92@01))
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
    (compute_address<Address> (as _10$place<Place>  Place) _10$address@8@01)
    (compute_address<Address> (as _6$place<Place>  Place) _6$address@92@01))
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
  _6$address@92@01
  (compute_address<Address> (as _6$place<Place>  Place) _6$address@92@01))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (= (as _7$place<Place>  Place) (as _12$place<Place>  Place))
  (= _7$address@100@01 _12$address@19@01)
  (= result_value@217@01 _12$snapshot$1@21@01))))
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
    (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _10$place<Place>  Place))
    (as _12$place<Place>  Place))
  (= _10$address@8@01 _12$address@19@01)
  (=
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> result_value@204@01)
    _12$snapshot$1@21@01))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (= (as _2$place<Place>  Place) (as _12$place<Place>  Place))
  (= _2$address@62@01 _12$address@19@01)
  (= result_value@185@01 _12$snapshot$1@21@01))))
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
    (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _15$place<Place>  Place))
    (as _12$place<Place>  Place))
  (= _15$address@40@01 _12$address@19@01)
  (=
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> result_value@230@01)
    _12$snapshot$1@21@01))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= result_value@239@01 _12$snapshot$1@21@01)))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(declare-const $t@242@01 $Snap)
(assert (= $t@242@01 ($Snap.combine ($Snap.first $t@242@01) ($Snap.second $t@242@01))))
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _15$place<Place>  Place))
    (as _6$place<Place>  Place))
  (= _15$address@40@01 _6$address@92@01)
  (=
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> result_value@230@01)
    _12$snapshot$1@21@01))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (= (as _2$place<Place>  Place) (as _6$place<Place>  Place))
  (= _2$address@62@01 _6$address@92@01)
  (= result_value@185@01 _12$snapshot$1@21@01))))
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
    (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _10$place<Place>  Place))
    (as _6$place<Place>  Place))
  (= _10$address@8@01 _6$address@92@01)
  (=
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> result_value@204@01)
    _12$snapshot$1@21@01))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (= (as _7$place<Place>  Place) (as _6$place<Place>  Place))
  (= _7$address@100@01 _6$address@92@01)
  (= result_value@217@01 _12$snapshot$1@21@01))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second $t@242@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@242@01))
    ($Snap.second ($Snap.second $t@242@01)))))
; [eval] compute_address(source_place, source_root_address)
; [eval] Size$Bool$()
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _10$place<Place>  Place)) _10$address@8@01)
    (compute_address<Address> (as _12$place<Place>  Place) _12$address@19@01))
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
    (compute_address<Address> (as _10$place<Place>  Place) _10$address@8@01)
    (compute_address<Address> (as _12$place<Place>  Place) _12$address@19@01))
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
  _5$address@86@01
  (compute_address<Address> (as _12$place<Place>  Place) _12$address@19@01))))
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
    _4$address@80@01
    (compute_address<Address> (as _12$place<Place>  Place) _12$address@19@01))
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
    _20$address@65@01
    (compute_address<Address> (as _12$place<Place>  Place) _12$address@19@01))
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
    (compute_address<Address> (as _12$place<Place>  Place) _12$address@19@01))
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
    _21$address@71@01
    (compute_address<Address> (as _12$place<Place>  Place) _12$address@19@01))
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
    (compute_address<Address> (as _15$place<Place>  Place) _15$address@40@01)
    (compute_address<Address> (as _12$place<Place>  Place) _12$address@19@01))
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
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _15$place<Place>  Place)) _15$address@40@01)
    (compute_address<Address> (as _12$place<Place>  Place) _12$address@19@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (= ($Snap.second ($Snap.second $t@242@01)) $Snap.unit))
; [eval] valid$Snap$Bool(source_snapshot)
(assert (valid$Snap$Bool<Bool> _12$snapshot$1@21@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _6$snapshot$1 == _12$snapshot$1
(declare-const $t@243@01 $Snap)
(assert (= $t@243@01 $Snap.unit))
; [eval] _6$snapshot$1 == _12$snapshot$1
(assert (= _6$snapshot$1@94@01 _12$snapshot$1@21@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; label label__from__label_bb7__to__label_bb5
; [exec]
; inhale _12$snapshot$2 == _12$snapshot$1
(declare-const $t@244@01 $Snap)
(assert (= $t@244@01 $Snap.unit))
; [eval] _12$snapshot$2 == _12$snapshot$1
(assert (= _12$snapshot$2@22@01 _12$snapshot$1@21@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _13$snapshot$2 == _13$snapshot$1
(declare-const $t@245@01 $Snap)
(assert (= $t@245@01 $Snap.unit))
; [eval] _13$snapshot$2 == _13$snapshot$1
(assert (= _13$snapshot$2@29@01 _13$snapshot$1@28@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _14$snapshot$2 == _14$snapshot$1
(declare-const $t@246@01 $Snap)
(assert (= $t@246@01 $Snap.unit))
; [eval] _14$snapshot$2 == _14$snapshot$1
(assert (= _14$snapshot$2@36@01 _14$snapshot$1@35@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _15$snapshot$2 == _15$snapshot$1
(declare-const $t@247@01 $Snap)
(assert (= $t@247@01 $Snap.unit))
; [eval] _15$snapshot$2 == _15$snapshot$1
(assert (= _15$snapshot$2@43@01 _15$snapshot$1@42@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _6$snapshot$3 == _6$snapshot$1
(declare-const $t@248@01 $Snap)
(assert (= $t@248@01 $Snap.unit))
; [eval] _6$snapshot$3 == _6$snapshot$1
(assert (= _6$snapshot$3@96@01 _6$snapshot$1@94@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; label label_bb5
; [exec]
; label_bb5$marker := true
; [exec]
; inhale basic_block_marker$label_bb5$marker()
(declare-const $t@249@01 $Snap)
(assert (= $t@249@01 $Snap.unit))
; [eval] basic_block_marker$label_bb5$marker()
(assert (as basic_block_marker$label_bb5$marker<Bool>  Bool))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; exhale acc(MemoryBlock(_12$address, Size$Bool$()), write)
; [eval] Size$Bool$()
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _12$place<Place>  Place) _12$address@19@01)
  _12$address@19@01)))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(MemoryBlockStackDrop(_12$address, Size$Bool$()), write)
; [eval] Size$Bool$()
; [exec]
; into_memory_block$Bool(_7$place(), _7$address, _7$snapshot$1)
; [eval] _7$place()
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= result_value@217@01 _7$snapshot$1@102@01)))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [eval] compute_address(place, root_address)
; [eval] Size$Bool$()
(declare-const $t@250@01 $Snap)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _15$place<Place>  Place)) _15$address@40@01)
    (compute_address<Address> (as _7$place<Place>  Place) _7$address@100@01))
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
    (compute_address<Address> (as _15$place<Place>  Place) _15$address@40@01)
    (compute_address<Address> (as _7$place<Place>  Place) _7$address@100@01))
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
    _21$address@71@01
    (compute_address<Address> (as _7$place<Place>  Place) _7$address@100@01))
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
    (compute_address<Address> (as _7$place<Place>  Place) _7$address@100@01))
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
    _20$address@65@01
    (compute_address<Address> (as _7$place<Place>  Place) _7$address@100@01))
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
    _4$address@80@01
    (compute_address<Address> (as _7$place<Place>  Place) _7$address@100@01))
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
  _5$address@86@01
  (compute_address<Address> (as _7$place<Place>  Place) _7$address@100@01))))
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
    (compute_address<Address> (as _10$place<Place>  Place) _10$address@8@01)
    (compute_address<Address> (as _7$place<Place>  Place) _7$address@100@01))
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
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _10$place<Place>  Place)) _10$address@8@01)
    (compute_address<Address> (as _7$place<Place>  Place) _7$address@100@01))
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
  (compute_address<Address> (as _7$place<Place>  Place) _7$address@100@01)
  _7$address@100@01)))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(MemoryBlockStackDrop(_7$address, Size$Bool$()), write)
; [eval] Size$Bool$()
; [exec]
; tmp$5 := assign$Bool$UnaryOp$Not$Move$Bool$$$$(_5$place(), _5$address, _6$place(),
;   _6$address, _6$snapshot$3)
; [eval] _5$place()
; [eval] _6$place()
; [eval] compute_address(target_place, target_address)
; [eval] Size$Bool$()
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _15$place<Place>  Place)) _15$address@40@01)
    (compute_address<Address> (as _5$place<Place>  Place) _5$address@86@01))
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
    (compute_address<Address> (as _15$place<Place>  Place) _15$address@40@01)
    (compute_address<Address> (as _5$place<Place>  Place) _5$address@86@01))
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
    _21$address@71@01
    (compute_address<Address> (as _5$place<Place>  Place) _5$address@86@01))
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
    (compute_address<Address> (as _5$place<Place>  Place) _5$address@86@01))
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
    _20$address@65@01
    (compute_address<Address> (as _5$place<Place>  Place) _5$address@86@01))
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
    _4$address@80@01
    (compute_address<Address> (as _5$place<Place>  Place) _5$address@86@01))
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
  _5$address@86@01
  (compute_address<Address> (as _5$place<Place>  Place) _5$address@86@01))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= _12$snapshot$1@21@01 _6$snapshot$3@96@01)))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [eval] valid$Snap$Bool(operand1_value)
(set-option :timeout 0)
(push) ; 8
(assert (not (valid$Snap$Bool<Bool> _6$snapshot$3@96@01)))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (valid$Snap$Bool<Bool> _6$snapshot$3@96@01))
(declare-const result_value@251@01 Snap$Bool)
(declare-const $t@252@01 $Snap)
(assert (= $t@252@01 ($Snap.combine ($Snap.first $t@252@01) ($Snap.second $t@252@01))))
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _10$place<Place>  Place))
    (as _5$place<Place>  Place))
  (= _10$address@8@01 _5$address@86@01)
  (=
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> result_value@204@01)
    result_value@251@01))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (= (as _2$place<Place>  Place) (as _5$place<Place>  Place))
  (= _2$address@62@01 _5$address@86@01)
  (= result_value@185@01 result_value@251@01))))
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
    (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _15$place<Place>  Place))
    (as _5$place<Place>  Place))
  (= _15$address@40@01 _5$address@86@01)
  (=
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> result_value@230@01)
    result_value@251@01))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second $t@252@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@252@01))
    ($Snap.second ($Snap.second $t@252@01)))))
; [eval] compute_address(operand1_place, operand1_root_address)
; [eval] Size$Bool$()
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _15$place<Place>  Place)) _15$address@40@01)
    (compute_address<Address> (as _6$place<Place>  Place) _6$address@92@01))
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
    (compute_address<Address> (as _15$place<Place>  Place) _15$address@40@01)
    (compute_address<Address> (as _6$place<Place>  Place) _6$address@92@01))
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
    _21$address@71@01
    (compute_address<Address> (as _6$place<Place>  Place) _6$address@92@01))
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
    (compute_address<Address> (as _6$place<Place>  Place) _6$address@92@01))
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
    _20$address@65@01
    (compute_address<Address> (as _6$place<Place>  Place) _6$address@92@01))
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
    _4$address@80@01
    (compute_address<Address> (as _6$place<Place>  Place) _6$address@92@01))
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
    (compute_address<Address> (as _10$place<Place>  Place) _10$address@8@01)
    (compute_address<Address> (as _6$place<Place>  Place) _6$address@92@01))
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
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _10$place<Place>  Place)) _10$address@8@01)
    (compute_address<Address> (as _6$place<Place>  Place) _6$address@92@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second $t@252@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@252@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@252@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@252@01))) $Snap.unit))
; [eval] result_value == constructor$Snap$Bool$Not_Bool(operand1_value)
; [eval] constructor$Snap$Bool$Not_Bool(operand1_value)
(assert (=
  result_value@251@01
  (constructor$Snap$Bool$Not_Bool<Snap$Bool> _6$snapshot$3@96@01)))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@252@01))) $Snap.unit))
; [eval] valid$Snap$Bool(result_value)
(assert (valid$Snap$Bool<Bool> result_value@251@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _5$snapshot$1 == tmp$5
(declare-const $t@253@01 $Snap)
(assert (= $t@253@01 $Snap.unit))
; [eval] _5$snapshot$1 == tmp$5
(assert (= _5$snapshot$1@88@01 result_value@251@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; exhale acc(MemoryBlock(_6$address, Size$Bool$()), write)
; [eval] Size$Bool$()
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _6$place<Place>  Place) _6$address@92@01)
  _6$address@92@01)))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(MemoryBlockStackDrop(_6$address, Size$Bool$()), write)
; [eval] Size$Bool$()
; [eval] !destructor$Snap$Bool$$value(_5$snapshot$1)
; [eval] destructor$Snap$Bool$$value(_5$snapshot$1)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (destructor$Snap$Bool$$value<Bool> _5$snapshot$1@88@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (not (destructor$Snap$Bool$$value<Bool> _5$snapshot$1@88@01))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [then-branch: 8 | !(destructor$Snap$Bool$$value[Bool](_5$snapshot$1@88@01)) | live]
; [else-branch: 8 | destructor$Snap$Bool$$value[Bool](_5$snapshot$1@88@01) | live]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 8 | !(destructor$Snap$Bool$$value[Bool](_5$snapshot$1@88@01))]
(assert (not (destructor$Snap$Bool$$value<Bool> _5$snapshot$1@88@01)))
; [exec]
; label label_5_custom
; [exec]
; label_5_custom$marker := true
; [exec]
; inhale basic_block_marker$label_5_custom$marker()
(declare-const $t@254@01 $Snap)
(assert (= $t@254@01 $Snap.unit))
; [eval] basic_block_marker$label_5_custom$marker()
(assert (as basic_block_marker$label_5_custom$marker<Bool>  Bool))
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
(declare-const $t@255@01 $Snap)
(assert (= $t@255@01 $Snap.unit))
; [eval] basic_block_marker$label_bb9$marker()
(assert (as basic_block_marker$label_bb9$marker<Bool>  Bool))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; write_place_constant$Tuple$$$(_4$place(), _4$address, constructor$Snap$Tuple$$$$())
; [eval] _4$place()
; [eval] constructor$Snap$Tuple$$$$()
; [eval] compute_address(target_place, target_root_address)
; [eval] Size$Tuple$$$$()
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _15$place<Place>  Place)) _15$address@40@01)
    (compute_address<Address> (as _4$place<Place>  Place) _4$address@80@01))
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
    (compute_address<Address> (as _15$place<Place>  Place) _15$address@40@01)
    (compute_address<Address> (as _4$place<Place>  Place) _4$address@80@01))
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
    _21$address@71@01
    (compute_address<Address> (as _4$place<Place>  Place) _4$address@80@01))
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
    _0$address@0@01
    (compute_address<Address> (as _4$place<Place>  Place) _4$address@80@01))
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
    _20$address@65@01
    (compute_address<Address> (as _4$place<Place>  Place) _4$address@80@01))
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
  _4$address@80@01
  (compute_address<Address> (as _4$place<Place>  Place) _4$address@80@01))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [eval] valid$Snap$Tuple$$$(source_snapshot)
(set-option :timeout 0)
(push) ; 9
(assert (not (valid$Snap$Tuple$$$<Bool> (as constructor$Snap$Tuple$$$$<Snap$Tuple$$$>  Snap$Tuple$$$))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (valid$Snap$Tuple$$$<Bool> (as constructor$Snap$Tuple$$$$<Snap$Tuple$$$>  Snap$Tuple$$$)))
(declare-const $t@256@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _4$snapshot$1 == constructor$Snap$Tuple$$$$()
(declare-const $t@257@01 $Snap)
(assert (= $t@257@01 $Snap.unit))
; [eval] _4$snapshot$1 == constructor$Snap$Tuple$$$$()
; [eval] constructor$Snap$Tuple$$$$()
(assert (=
  _4$snapshot$1@82@01
  (as constructor$Snap$Tuple$$$$<Snap$Tuple$$$>  Snap$Tuple$$$)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; into_memory_block$Bool(_5$place(), _5$address, _5$snapshot$1)
; [eval] _5$place()
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= result_value@251@01 _5$snapshot$1@88@01)))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [eval] compute_address(place, root_address)
; [eval] Size$Bool$()
(declare-const $t@258@01 $Snap)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _15$place<Place>  Place)) _15$address@40@01)
    (compute_address<Address> (as _5$place<Place>  Place) _5$address@86@01))
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
    (compute_address<Address> (as _15$place<Place>  Place) _15$address@40@01)
    (compute_address<Address> (as _5$place<Place>  Place) _5$address@86@01))
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
    _21$address@71@01
    (compute_address<Address> (as _5$place<Place>  Place) _5$address@86@01))
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
    _0$address@0@01
    (compute_address<Address> (as _5$place<Place>  Place) _5$address@86@01))
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
    _20$address@65@01
    (compute_address<Address> (as _5$place<Place>  Place) _5$address@86@01))
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
    (compute_address<Address> (as _10$place<Place>  Place) _10$address@8@01)
    (compute_address<Address> (as _5$place<Place>  Place) _5$address@86@01))
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
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _10$place<Place>  Place)) _10$address@8@01)
    (compute_address<Address> (as _5$place<Place>  Place) _5$address@86@01))
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
; exhale acc(MemoryBlock(_5$address, Size$Bool$()), write)
; [eval] Size$Bool$()
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _5$place<Place>  Place) _5$address@86@01)
  _5$address@86@01)))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(MemoryBlockStackDrop(_5$address, Size$Bool$()), write)
; [eval] Size$Bool$()
; [exec]
; into_memory_block$Tuple$$$(_4$place(), _4$address, _4$snapshot$1)
; [eval] _4$place()
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  (as constructor$Snap$Tuple$$$$<Snap$Tuple$$$>  Snap$Tuple$$$)
  _4$snapshot$1@82@01)))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [eval] compute_address(place, root_address)
; [eval] Size$Tuple$$$$()
(declare-const $t@259@01 $Snap)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _10$place<Place>  Place)) _10$address@8@01)
    (compute_address<Address> (as _4$place<Place>  Place) _4$address@80@01))
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
    (compute_address<Address> (as _10$place<Place>  Place) _10$address@8@01)
    (compute_address<Address> (as _4$place<Place>  Place) _4$address@80@01))
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
    _20$address@65@01
    (compute_address<Address> (as _4$place<Place>  Place) _4$address@80@01))
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
    _0$address@0@01
    (compute_address<Address> (as _4$place<Place>  Place) _4$address@80@01))
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
    (compute_address<Address> (as _4$place<Place>  Place) _4$address@80@01))
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
    (compute_address<Address> (as _15$place<Place>  Place) _15$address@40@01)
    (compute_address<Address> (as _4$place<Place>  Place) _4$address@80@01))
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
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _15$place<Place>  Place)) _15$address@40@01)
    (compute_address<Address> (as _4$place<Place>  Place) _4$address@80@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
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
; exhale acc(MemoryBlock(_4$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _4$place<Place>  Place) _4$address@80@01)
  _4$address@80@01)))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(MemoryBlockStackDrop(_4$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
; [exec]
; inhale acc(MemoryBlock(_17$address, Size$I64$()), write)
; [eval] Size$I64$()
(declare-const $t@260@01 $Snap)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _15$place<Place>  Place)) _15$address@40@01)
  _17$address@48@01)))
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
    (compute_address<Address> (as _15$place<Place>  Place) _15$address@40@01)
    _17$address@48@01)
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
  (= _21$address@71@01 _17$address@48@01)
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
(assert (not (= _0$address@0@01 _17$address@48@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (= _20$address@65@01 _17$address@48@01)
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
    (compute_address<Address> (as _10$place<Place>  Place) _10$address@8@01)
    _17$address@48@01)
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
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _10$place<Place>  Place)) _10$address@8@01)
  _17$address@48@01)))
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
; inhale acc(MemoryBlockStackDrop(_17$address, Size$I64$()), write)
; [eval] Size$I64$()
(declare-const $t@261@01 $Snap)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (= _2$address@62@01 _17$address@48@01)
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
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
; inhale acc(MemoryBlock(_18$address, Size$I64$()), write)
; [eval] Size$I64$()
(declare-const $t@262@01 $Snap)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= _17$address@48@01 _18$address@50@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _15$place<Place>  Place)) _15$address@40@01)
  _18$address@50@01)))
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
    (compute_address<Address> (as _15$place<Place>  Place) _15$address@40@01)
    _18$address@50@01)
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
  (= _21$address@71@01 _18$address@50@01)
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
(assert (not (= _0$address@0@01 _18$address@50@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (= _20$address@65@01 _18$address@50@01)
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
    (compute_address<Address> (as _10$place<Place>  Place) _10$address@8@01)
    _18$address@50@01)
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
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _10$place<Place>  Place)) _10$address@8@01)
  _18$address@50@01)))
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
; inhale acc(MemoryBlockStackDrop(_18$address, Size$I64$()), write)
; [eval] Size$I64$()
(declare-const $t@263@01 $Snap)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= _17$address@48@01 _18$address@50@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (= _2$address@62@01 _18$address@50@01)
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
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
; inhale acc(MemoryBlock(_19$address, Size$I64$()), write)
; [eval] Size$I64$()
(declare-const $t@264@01 $Snap)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= _18$address@50@01 _19$address@56@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= _17$address@48@01 _19$address@56@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _15$place<Place>  Place)) _15$address@40@01)
  _19$address@56@01)))
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
    (compute_address<Address> (as _15$place<Place>  Place) _15$address@40@01)
    _19$address@56@01)
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
  (= _21$address@71@01 _19$address@56@01)
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
(assert (not (= _0$address@0@01 _19$address@56@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (= _20$address@65@01 _19$address@56@01)
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
    (compute_address<Address> (as _10$place<Place>  Place) _10$address@8@01)
    _19$address@56@01)
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
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _10$place<Place>  Place)) _10$address@8@01)
  _19$address@56@01)))
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
; inhale acc(MemoryBlockStackDrop(_19$address, Size$I64$()), write)
; [eval] Size$I64$()
(declare-const $t@265@01 $Snap)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= _18$address@50@01 _19$address@56@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= _17$address@48@01 _19$address@56@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (= _2$address@62@01 _19$address@56@01)
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
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
; copy_place$I64(_19$place(), _19$address, _1$place(), _1$address, _1$snapshot$0,
;   write)
; [eval] _19$place()
; [eval] _1$place()
; [eval] none < source_permission_amount
; [eval] compute_address(target_place, target_root_address)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _10$place<Place>  Place)) _10$address@8@01)
  (compute_address<Address> (as _19$place<Place>  Place) _19$address@56@01))))
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
    (compute_address<Address> (as _10$place<Place>  Place) _10$address@8@01)
    (compute_address<Address> (as _19$place<Place>  Place) _19$address@56@01))
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
    _20$address@65@01
    (compute_address<Address> (as _19$place<Place>  Place) _19$address@56@01))
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
  _0$address@0@01
  (compute_address<Address> (as _19$place<Place>  Place) _19$address@56@01))))
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
    (compute_address<Address> (as _19$place<Place>  Place) _19$address@56@01))
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
    (compute_address<Address> (as _15$place<Place>  Place) _15$address@40@01)
    (compute_address<Address> (as _19$place<Place>  Place) _19$address@56@01))
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
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _15$place<Place>  Place)) _15$address@40@01)
  (compute_address<Address> (as _19$place<Place>  Place) _19$address@56@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  _17$address@48@01
  (compute_address<Address> (as _19$place<Place>  Place) _19$address@56@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  _18$address@50@01
  (compute_address<Address> (as _19$place<Place>  Place) _19$address@56@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  _19$address@56@01
  (compute_address<Address> (as _19$place<Place>  Place) _19$address@56@01))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(declare-const $t@266@01 $Snap)
(assert (= $t@266@01 ($Snap.combine ($Snap.first $t@266@01) ($Snap.second $t@266@01))))
(assert (=
  ($Snap.second $t@266@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@266@01))
    ($Snap.second ($Snap.second $t@266@01)))))
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (= (as _1$place<Place>  Place) (as _19$place<Place>  Place))
  (= _1$address@6@01 _19$address@56@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (= ($Snap.second ($Snap.second $t@266@01)) $Snap.unit))
; [eval] valid$Snap$I64(source_snapshot)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _19$snapshot$1 == _1$snapshot$0
(declare-const $t@267@01 $Snap)
(assert (= $t@267@01 $Snap.unit))
; [eval] _19$snapshot$1 == _1$snapshot$0
(assert (= _19$snapshot$1@58@01 _1$snapshot$0@7@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; tmp$6 := assign$Tuple$$I64$Bool$$I64$Bool$$CheckedBinaryOp$Sub$Copy$I64$Constant$I64$$$$(_20$place(),
;   _20$address, _19$place(), _19$address, _19$snapshot$1, constructor$Snap$I64$(1))
; [eval] _20$place()
; [eval] _19$place()
; [eval] constructor$Snap$I64$(1)
; [eval] compute_address(target_place, target_address)
; [eval] Size$Tuple$$I64$Bool$$I64$Bool$$()
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _10$place<Place>  Place)) _10$address@8@01)
    (compute_address<Address> (as _20$place<Place>  Place) _20$address@65@01))
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
(assert (not (and
  (=
    (compute_address<Address> (as _10$place<Place>  Place) _10$address@8@01)
    (compute_address<Address> (as _20$place<Place>  Place) _20$address@65@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
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
  _20$address@65@01
  (compute_address<Address> (as _20$place<Place>  Place) _20$address@65@01))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= _1$snapshot$0@7@01 _19$snapshot$1@58@01)))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [eval] valid$Snap$I64(operand1_value)
(set-option :timeout 0)
(push) ; 9
(assert (not (valid$Snap$I64<Bool> _19$snapshot$1@58@01)))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (valid$Snap$I64<Bool> _19$snapshot$1@58@01))
; [eval] valid$Snap$I64(operand2_value)
(declare-const result_value@268@01 Snap$Tuple$$I64$Bool$$I64$Bool$)
(declare-const $t@269@01 $Snap)
(assert (= $t@269@01 ($Snap.combine ($Snap.first $t@269@01) ($Snap.second $t@269@01))))
; [eval] compute_address(target_place, target_address)
; [eval] PaddingSize$Tuple$$I64$Bool$$I64$Bool$$()
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (=
    _18$address@50@01
    (compute_address<Address> (as _20$place<Place>  Place) _20$address@65@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
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
    _17$address@48@01
    (compute_address<Address> (as _20$place<Place>  Place) _20$address@65@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
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
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _15$place<Place>  Place)) _15$address@40@01)
    (compute_address<Address> (as _20$place<Place>  Place) _20$address@65@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _15$place<Place>  Place) _15$address@40@01)
  (compute_address<Address> (as _20$place<Place>  Place) _20$address@65@01))))
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
    (compute_address<Address> (as _20$place<Place>  Place) _20$address@65@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
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
    _0$address@0@01
    (compute_address<Address> (as _20$place<Place>  Place) _20$address@65@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _10$place<Place>  Place) _10$address@8@01)
  (compute_address<Address> (as _20$place<Place>  Place) _20$address@65@01))))
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
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _10$place<Place>  Place)) _10$address@8@01)
    (compute_address<Address> (as _20$place<Place>  Place) _20$address@65@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second $t@269@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@269@01))
    ($Snap.second ($Snap.second $t@269@01)))))
; [eval] field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(compute_address(target_place, target_address))
; [eval] compute_address(target_place, target_address)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _10$place<Place>  Place)) _10$address@8@01)
  (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _20$place<Place>  Place) _20$address@65@01)))))
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
    (compute_address<Address> (as _10$place<Place>  Place) _10$address@8@01)
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _20$place<Place>  Place) _20$address@65@01)))
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
(assert (not (=
  _0$address@0@01
  (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _20$place<Place>  Place) _20$address@65@01)))))
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
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _20$place<Place>  Place) _20$address@65@01)))
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
    (compute_address<Address> (as _15$place<Place>  Place) _15$address@40@01)
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _20$place<Place>  Place) _20$address@65@01)))
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
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _15$place<Place>  Place)) _15$address@40@01)
  (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _20$place<Place>  Place) _20$address@65@01)))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  _17$address@48@01
  (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _20$place<Place>  Place) _20$address@65@01)))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  _18$address@50@01
  (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _20$place<Place>  Place) _20$address@65@01)))))
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
    (compute_address<Address> (as _20$place<Place>  Place) _20$address@65@01)
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _20$place<Place>  Place) _20$address@65@01)))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second $t@269@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@269@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@269@01))))))
; [eval] field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(target_place)
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(result_value)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (=
    (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _15$place<Place>  Place))
    (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _20$place<Place>  Place)))
  (= _15$address@40@01 _20$address@65@01)
  (=
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> result_value@230@01)
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> result_value@268@01)))))
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
    (as _2$place<Place>  Place)
    (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _20$place<Place>  Place)))
  (= _2$address@62@01 _20$address@65@01)
  (=
    result_value@185@01
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> result_value@268@01)))))
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
    (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _10$place<Place>  Place))
    (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _20$place<Place>  Place)))
  (= _10$address@8@01 _20$address@65@01)
  (=
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> result_value@204@01)
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> result_value@268@01)))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@269@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@269@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@269@01)))))))
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (= (as _1$place<Place>  Place) (as _19$place<Place>  Place))
  (= _1$address@6@01 _19$address@56@01)
  (= _1$snapshot$0@7@01 _19$snapshot$1@58@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@269@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@269@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@269@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@269@01)))))
  $Snap.unit))
; [eval] valid$Snap$I64(constructor$Snap$I64$Sub_I64(operand1_value, operand2_value)) ==> destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(result_value) == constructor$Snap$I64$Sub_I64(operand1_value, operand2_value)
; [eval] valid$Snap$I64(constructor$Snap$I64$Sub_I64(operand1_value, operand2_value))
; [eval] constructor$Snap$I64$Sub_I64(operand1_value, operand2_value)
(set-option :timeout 0)
(push) ; 9
(push) ; 10
(set-option :timeout 10)
(assert (not (not
  (valid$Snap$I64<Bool> (constructor$Snap$I64$Sub_I64<Snap$I64> _19$snapshot$1@58@01 (constructor$Snap$I64$<Snap$I64> 1))))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (valid$Snap$I64<Bool> (constructor$Snap$I64$Sub_I64<Snap$I64> _19$snapshot$1@58@01 (constructor$Snap$I64$<Snap$I64> 1)))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [then-branch: 9 | valid$Snap$I64[Bool](constructor$Snap$I64$Sub_I64[Snap$I64](_19$snapshot$1@58@01, constructor$Snap$I64$[Snap$I64](1))) | live]
; [else-branch: 9 | !(valid$Snap$I64[Bool](constructor$Snap$I64$Sub_I64[Snap$I64](_19$snapshot$1@58@01, constructor$Snap$I64$[Snap$I64](1)))) | dead]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 9 | valid$Snap$I64[Bool](constructor$Snap$I64$Sub_I64[Snap$I64](_19$snapshot$1@58@01, constructor$Snap$I64$[Snap$I64](1)))]
(assert (valid$Snap$I64<Bool> (constructor$Snap$I64$Sub_I64<Snap$I64> _19$snapshot$1@58@01 (constructor$Snap$I64$<Snap$I64> 1))))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(result_value) == constructor$Snap$I64$Sub_I64(operand1_value, operand2_value)
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(result_value)
; [eval] constructor$Snap$I64$Sub_I64(operand1_value, operand2_value)
(pop) ; 10
(pop) ; 9
; Joined path conditions
(assert (valid$Snap$I64<Bool> (constructor$Snap$I64$Sub_I64<Snap$I64> _19$snapshot$1@58@01 (constructor$Snap$I64$<Snap$I64> 1))))
(assert (=>
  (valid$Snap$I64<Bool> (constructor$Snap$I64$Sub_I64<Snap$I64> _19$snapshot$1@58@01 (constructor$Snap$I64$<Snap$I64> 1)))
  (=
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> result_value@268@01)
    (constructor$Snap$I64$Sub_I64<Snap$I64> _19$snapshot$1@58@01 (constructor$Snap$I64$<Snap$I64> 1)))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@269@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@269@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@269@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@269@01))))))
  $Snap.unit))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(result_value) == constructor$Snap$Bool$(!valid$Snap$I64(constructor$Snap$I64$Sub_I64(operand1_value, operand2_value)))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(result_value)
; [eval] constructor$Snap$Bool$(!valid$Snap$I64(constructor$Snap$I64$Sub_I64(operand1_value, operand2_value)))
; [eval] !valid$Snap$I64(constructor$Snap$I64$Sub_I64(operand1_value, operand2_value))
; [eval] valid$Snap$I64(constructor$Snap$I64$Sub_I64(operand1_value, operand2_value))
; [eval] constructor$Snap$I64$Sub_I64(operand1_value, operand2_value)
(assert (=
  (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> result_value@268@01)
  (constructor$Snap$Bool$<Snap$Bool> (not
    (valid$Snap$I64<Bool> (constructor$Snap$I64$Sub_I64<Snap$I64> _19$snapshot$1@58@01 (constructor$Snap$I64$<Snap$I64> 1)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@269@01))))))
  $Snap.unit))
; [eval] MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(compute_address(target_place, target_address)), Size$I64$()) == to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(result_value))
; [eval] MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(compute_address(target_place, target_address)), Size$I64$())
; [eval] field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(compute_address(target_place, target_address))
; [eval] compute_address(target_place, target_address)
; [eval] Size$I64$()
(push) ; 9
(declare-const $k@270@01 $Perm)
(assert ($Perm.isReadVar $k@270@01))
(assert (< $k@270@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@270@01)))
(push) ; 10
(set-option :timeout 10)
(assert (not (< $Perm.No $k@270@01)))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@269@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _20$place<Place>  Place) _20$address@65@01)) (as Size$I64$<Snap$Usize>  Snap$Usize)))
(pop) ; 9
; Joined path conditions
(assert ($Perm.isReadVar $k@270@01))
(assert (and
  (< $k@270@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@270@01))
  (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@269@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _20$place<Place>  Place) _20$address@65@01)) (as Size$I64$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(result_value))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(result_value)
(assert (=
  (MemoryBlock$bytes ($Snap.first ($Snap.second $t@269@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _20$place<Place>  Place) _20$address@65@01)) (as Size$I64$<Snap$Usize>  Snap$Usize))
  (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> result_value@268@01))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _20$snapshot$1 == tmp$6
(declare-const $t@271@01 $Snap)
(assert (= $t@271@01 $Snap.unit))
; [eval] _20$snapshot$1 == tmp$6
(assert (= _20$snapshot$1@67@01 result_value@268@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [eval] !destructor$Snap$Bool$$value(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(_20$snapshot$1))
; [eval] destructor$Snap$Bool$$value(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(_20$snapshot$1))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(_20$snapshot$1)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (destructor$Snap$Bool$$value<Bool> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> _20$snapshot$1@67@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not
  (destructor$Snap$Bool$$value<Bool> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> _20$snapshot$1@67@01)))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [then-branch: 10 | !(destructor$Snap$Bool$$value[Bool](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](_20$snapshot$1@67@01))) | live]
; [else-branch: 10 | destructor$Snap$Bool$$value[Bool](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](_20$snapshot$1@67@01)) | dead]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 10 | !(destructor$Snap$Bool$$value[Bool](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](_20$snapshot$1@67@01)))]
(assert (not
  (destructor$Snap$Bool$$value<Bool> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> _20$snapshot$1@67@01))))
; [exec]
; label label_bb10
; [exec]
; label_bb10$marker := true
; [exec]
; inhale basic_block_marker$label_bb10$marker()
(declare-const $t@272@01 $Snap)
(assert (= $t@272@01 $Snap.unit))
; [eval] basic_block_marker$label_bb10$marker()
(assert (as basic_block_marker$label_bb10$marker<Bool>  Bool))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; fold acc(OwnedNonAliased$I64(field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(_20$place()),
;   _20$address, destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(_20$snapshot$1)), write)
; [eval] field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(_20$place())
; [eval] _20$place()
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(_20$snapshot$1)
; [eval] valid$Snap$I64(snapshot)
(set-option :timeout 0)
(push) ; 10
(assert (not (valid$Snap$I64<Bool> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _20$snapshot$1@67@01))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(assert (valid$Snap$I64<Bool> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _20$snapshot$1@67@01)))
; [eval] compute_address(place, root_address)
; [eval] Size$I64$()
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _20$place<Place>  Place) _20$address@65@01))
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _20$place<Place>  Place)) _20$address@65@01))))
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
(declare-const $k@273@01 $Perm)
(assert ($Perm.isReadVar $k@273@01))
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _20$place<Place>  Place) _20$address@65@01))
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _20$place<Place>  Place)) _20$address@65@01))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(assert (< $k@273@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@273@01)))
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (< $Perm.No $k@273@01)))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@269@01)) (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _20$place<Place>  Place)) _20$address@65@01) (as Size$I64$<Snap$Usize>  Snap$Usize)))
(pop) ; 10
; Joined path conditions
(assert ($Perm.isReadVar $k@273@01))
(assert (and
  (< $k@273@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@273@01))
  (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@269@01)) (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _20$place<Place>  Place)) _20$address@65@01) (as Size$I64$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$I64(snapshot)
(set-option :timeout 0)
(push) ; 10
(assert (not (=
  (MemoryBlock$bytes ($Snap.first ($Snap.second $t@269@01)) (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _20$place<Place>  Place)) _20$address@65@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
  (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _20$snapshot$1@67@01)))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(assert (=
  (MemoryBlock$bytes ($Snap.first ($Snap.second $t@269@01)) (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _20$place<Place>  Place)) _20$address@65@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
  (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _20$snapshot$1@67@01))))
(assert (OwnedNonAliased$I64%trigger ($Snap.combine
  $Snap.unit
  ($Snap.combine ($Snap.first ($Snap.second $t@269@01)) $Snap.unit)) (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _20$place<Place>  Place)) _20$address@65@01 (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _20$snapshot$1@67@01)))
(push) ; 10
(set-option :timeout 10)
(assert (not (and
  (=
    (as _1$place<Place>  Place)
    (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _20$place<Place>  Place)))
  (= _1$address@6@01 _20$address@65@01)
  (=
    _1$snapshot$0@7@01
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _20$snapshot$1@67@01)))))
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
    (as _19$place<Place>  Place)
    (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _20$place<Place>  Place)))
  (= _19$address@56@01 _20$address@65@01)
  (=
    _19$snapshot$1@58@01
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _20$snapshot$1@67@01)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [exec]
; move_place$I64(_18$place(), _18$address, field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(_20$place()),
;   _20$address, destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(_20$snapshot$1))
; [eval] _18$place()
; [eval] field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(_20$place())
; [eval] _20$place()
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(_20$snapshot$1)
; [eval] compute_address(target_place, target_root_address)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _20$place<Place>  Place) _20$address@65@01)
    (compute_address<Address> (as _18$place<Place>  Place) _18$address@50@01))
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
(assert (not (=
  _18$address@50@01
  (compute_address<Address> (as _18$place<Place>  Place) _18$address@50@01))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(declare-const $t@274@01 $Snap)
(assert (= $t@274@01 ($Snap.combine ($Snap.first $t@274@01) ($Snap.second $t@274@01))))
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and
  (= (as _19$place<Place>  Place) (as _18$place<Place>  Place))
  (= _19$address@56@01 _18$address@50@01)
  (=
    _19$snapshot$1@58@01
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _20$snapshot$1@67@01)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and
  (= (as _1$place<Place>  Place) (as _18$place<Place>  Place))
  (= _1$address@6@01 _18$address@50@01)
  (=
    _1$snapshot$0@7@01
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _20$snapshot$1@67@01)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second $t@274@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@274@01))
    ($Snap.second ($Snap.second $t@274@01)))))
; [eval] compute_address(source_place, source_root_address)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _20$place<Place>  Place) _20$address@65@01)
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _20$place<Place>  Place)) _20$address@65@01))
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
(assert (not (=
  _17$address@48@01
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _20$place<Place>  Place)) _20$address@65@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _15$place<Place>  Place)) _15$address@40@01)
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _20$place<Place>  Place)) _20$address@65@01))))
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
    (compute_address<Address> (as _15$place<Place>  Place) _15$address@40@01)
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _20$place<Place>  Place)) _20$address@65@01))
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
    _21$address@71@01
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _20$place<Place>  Place)) _20$address@65@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
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
  _0$address@0@01
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _20$place<Place>  Place)) _20$address@65@01))))
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
    (compute_address<Address> (as _10$place<Place>  Place) _10$address@8@01)
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _20$place<Place>  Place)) _20$address@65@01))
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
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _10$place<Place>  Place)) _10$address@8@01)
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _20$place<Place>  Place)) _20$address@65@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(assert (= ($Snap.second ($Snap.second $t@274@01)) $Snap.unit))
; [eval] valid$Snap$I64(source_snapshot)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _18$snapshot$1 ==
;   destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(_20$snapshot$1)
(declare-const $t@275@01 $Snap)
(assert (= $t@275@01 $Snap.unit))
; [eval] _18$snapshot$1 == destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(_20$snapshot$1)
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(_20$snapshot$1)
(assert (=
  _18$snapshot$1@52@01
  (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _20$snapshot$1@67@01)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; into_memory_block$I64(_19$place(), _19$address, _19$snapshot$1)
; [eval] _19$place()
; [eval] compute_address(place, root_address)
; [eval] Size$I64$()
(declare-const $t@276@01 $Snap)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _10$place<Place>  Place)) _10$address@8@01)
  (compute_address<Address> (as _19$place<Place>  Place) _19$address@56@01))))
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
    (compute_address<Address> (as _10$place<Place>  Place) _10$address@8@01)
    (compute_address<Address> (as _19$place<Place>  Place) _19$address@56@01))
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
(assert (not (=
  _0$address@0@01
  (compute_address<Address> (as _19$place<Place>  Place) _19$address@56@01))))
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
    (compute_address<Address> (as _19$place<Place>  Place) _19$address@56@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
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
    (compute_address<Address> (as _15$place<Place>  Place) _15$address@40@01)
    (compute_address<Address> (as _19$place<Place>  Place) _19$address@56@01))
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
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _15$place<Place>  Place)) _15$address@40@01)
  (compute_address<Address> (as _19$place<Place>  Place) _19$address@56@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  _17$address@48@01
  (compute_address<Address> (as _19$place<Place>  Place) _19$address@56@01))))
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
    (compute_address<Address> (as _20$place<Place>  Place) _20$address@65@01)
    (compute_address<Address> (as _19$place<Place>  Place) _19$address@56@01))
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
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _20$place<Place>  Place)) _20$address@65@01)
  (compute_address<Address> (as _19$place<Place>  Place) _19$address@56@01))))
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
; exhale acc(MemoryBlock(_19$address, Size$I64$()), write)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _19$place<Place>  Place) _19$address@56@01)
  _19$address@56@01)))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(MemoryBlockStackDrop(_19$address, Size$I64$()), write)
; [eval] Size$I64$()
; [exec]
; lft_function_call_1$snapshot$1 := lft_1$snapshot$1
; [exec]
; consume$Move$I64(_18$place(), _18$address, _18$snapshot$1)
; [eval] _18$place()
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _20$snapshot$1@67@01)
  _18$snapshot$1@52@01)))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [eval] valid$Snap$I64(operand1_value)
(set-option :timeout 0)
(push) ; 10
(assert (not (valid$Snap$I64<Bool> _18$snapshot$1@52@01)))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(assert (valid$Snap$I64<Bool> _18$snapshot$1@52@01))
; [eval] compute_address(operand1_place, operand1_root_address)
; [eval] Size$I64$()
(declare-const $t@277@01 $Snap)
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _20$place<Place>  Place)) _20$address@65@01)
  (compute_address<Address> (as _18$place<Place>  Place) _18$address@50@01))))
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
    (compute_address<Address> (as _20$place<Place>  Place) _20$address@65@01)
    (compute_address<Address> (as _18$place<Place>  Place) _18$address@50@01))
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
(assert (not (=
  _17$address@48@01
  (compute_address<Address> (as _18$place<Place>  Place) _18$address@50@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _15$place<Place>  Place)) _15$address@40@01)
  (compute_address<Address> (as _18$place<Place>  Place) _18$address@50@01))))
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
    (compute_address<Address> (as _15$place<Place>  Place) _15$address@40@01)
    (compute_address<Address> (as _18$place<Place>  Place) _18$address@50@01))
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
    _21$address@71@01
    (compute_address<Address> (as _18$place<Place>  Place) _18$address@50@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
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
  _0$address@0@01
  (compute_address<Address> (as _18$place<Place>  Place) _18$address@50@01))))
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
    (compute_address<Address> (as _10$place<Place>  Place) _10$address@8@01)
    (compute_address<Address> (as _18$place<Place>  Place) _18$address@50@01))
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
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _10$place<Place>  Place)) _10$address@8@01)
  (compute_address<Address> (as _18$place<Place>  Place) _18$address@50@01))))
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
; exhale acc(LifetimeToken(lft_1$snapshot$1), lifetime_token_perm_amount$0$snapshot$0 /
;   14)
; [eval] lifetime_token_perm_amount$0$snapshot$0 / 14
(set-option :timeout 0)
(push) ; 10
(assert (not (or
  (= (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 14)) $Perm.No)
  (< $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 14))))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  (-
    (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7))
    ($Perm.min
      (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7))
      (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 14))))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(assert (<=
  $Perm.No
  (-
    (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7))
    ($Perm.min
      (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7))
      (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 14))))))
(set-option :timeout 0)
(push) ; 10
(assert (not (or
  (=
    (-
      (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 14))
      ($Perm.min
        (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7))
        (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 14))))
    $Perm.No)
  (<
    (-
      (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 14))
      ($Perm.min
        (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7))
        (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 14))))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(push) ; 10
(set-option :timeout 10)
(assert (not (< $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 14)))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(LifetimeToken(lft_function_call_1$snapshot$1), lifetime_token_perm_amount$0$snapshot$0 /
;   14)
; [eval] lifetime_token_perm_amount$0$snapshot$0 / 14
(set-option :timeout 0)
(push) ; 10
(assert (not (or
  (= (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 14)) $Perm.No)
  (< $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 14))))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  (-
    (-
      (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7))
      ($Perm.min
        (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7))
        (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 14))))
    ($Perm.min
      (-
        (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7))
        ($Perm.min
          (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7))
          (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 14))))
      (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 14))))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(assert (not (or
  (=
    (-
      (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 14))
      ($Perm.min
        (-
          (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7))
          ($Perm.min
            (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7))
            (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 14))))
        (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 14))))
    $Perm.No)
  (<
    (-
      (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 14))
      ($Perm.min
        (-
          (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7))
          ($Perm.min
            (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7))
            (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 14))))
        (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 14))))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(push) ; 10
(set-option :timeout 10)
(assert (not (< $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 14)))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(MemoryBlock(_17$address, Size$I64$()), write)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not tmp$7@162@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not tmp$7@162@01))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [then-branch: 11 | tmp$7@162@01 | live]
; [else-branch: 11 | !(tmp$7@162@01) | live]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 11 | tmp$7@162@01]
(assert tmp$7@162@01)
; [exec]
; label label_8_custom
; [exec]
; label_8_custom$marker := true
; [exec]
; inhale basic_block_marker$label_8_custom$marker()
(declare-const $t@278@01 $Snap)
(assert (= $t@278@01 $Snap.unit))
; [eval] basic_block_marker$label_8_custom$marker()
(assert (as basic_block_marker$label_8_custom$marker<Bool>  Bool))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(OwnedNonAliased$I64(_17$place(), _17$address, _17$snapshot$0), write) &&
;   valid$Snap$I64(_17$snapshot$0)
(declare-const $t@279@01 $Snap)
(assert (= $t@279@01 ($Snap.combine ($Snap.first $t@279@01) ($Snap.second $t@279@01))))
; [eval] _17$place()
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (and
  (= (as _1$place<Place>  Place) (as _17$place<Place>  Place))
  (= _1$address@6@01 _17$address@48@01)
  (= _1$snapshot$0@7@01 _17$snapshot$0@49@01))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(assert (= ($Snap.second $t@279@01) $Snap.unit))
; [eval] valid$Snap$I64(_17$snapshot$0)
(assert (valid$Snap$I64<Bool> _17$snapshot$0@49@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(LifetimeToken(lft_1$snapshot$1), lifetime_token_perm_amount$0$snapshot$0 /
;   7)
; [eval] lifetime_token_perm_amount$0$snapshot$0 / 7
(set-option :timeout 0)
(push) ; 11
(assert (not (or
  (= (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7)) $Perm.No)
  (< $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7))))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(declare-const $t@280@01 $Snap)
(push) ; 11
(set-option :timeout 10)
(assert (not (= bw1$snapshot$0@118@01 lft@169@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= bw0$snapshot$0@117@01 lft@169@01)))
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
; inhale acc(LifetimeToken(lft_function_call_1$snapshot$1), lifetime_token_perm_amount$0$snapshot$0 /
;   7)
; [eval] lifetime_token_perm_amount$0$snapshot$0 / 7
(set-option :timeout 0)
(push) ; 11
(assert (not (or
  (= (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7)) $Perm.No)
  (< $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7))))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(declare-const $t@281@01 $Snap)
(declare-const $t@282@01 $Snap)
(assert (and
  (=>
    (< $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7)))
    (= $t@282@01 $t@280@01))
  (=>
    (< $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7)))
    (= $t@282@01 $t@281@01))))
(assert (<=
  $Perm.No
  (+
    (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7))
    (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7)))))
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
(declare-const $t@283@01 $Snap)
(assert (= $t@283@01 $Snap.unit))
; [eval] basic_block_marker$label_bb11$marker()
(assert (as basic_block_marker$label_bb11$marker<Bool>  Bool))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; exhale acc(MemoryBlock(_18$address, Size$I64$()), write)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _10$place<Place>  Place)) _10$address@8@01)
  _18$address@50@01)))
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
    (compute_address<Address> (as _10$place<Place>  Place) _10$address@8@01)
    _18$address@50@01)
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
(assert (not (= _0$address@0@01 _18$address@50@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (and
  (= _21$address@71@01 _18$address@50@01)
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
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
    (compute_address<Address> (as _15$place<Place>  Place) _15$address@40@01)
    _18$address@50@01)
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
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _15$place<Place>  Place)) _15$address@40@01)
  _18$address@50@01)))
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
    (compute_address<Address> (as _20$place<Place>  Place) _20$address@65@01)
    _18$address@50@01)
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
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _20$place<Place>  Place)) _20$address@65@01)
  _18$address@50@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _18$place<Place>  Place) _18$address@50@01)
  _18$address@50@01)))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(MemoryBlockStackDrop(_18$address, Size$I64$()), write)
; [eval] Size$I64$()
; [exec]
; tmp$8 := assign$Tuple$$I64$Bool$$I64$Bool$$CheckedBinaryOp$Add$Constant$I64$Copy$I64$$$$(_21$place(),
;   _21$address, constructor$Snap$I64$(3), _17$place(), _17$address, _17$snapshot$0)
; [eval] _21$place()
; [eval] constructor$Snap$I64$(3)
; [eval] _17$place()
; [eval] compute_address(target_place, target_address)
; [eval] Size$Tuple$$I64$Bool$$I64$Bool$$()
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _10$place<Place>  Place)) _10$address@8@01)
    (compute_address<Address> (as _21$place<Place>  Place) _21$address@71@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
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
    (compute_address<Address> (as _10$place<Place>  Place) _10$address@8@01)
    (compute_address<Address> (as _21$place<Place>  Place) _21$address@71@01))
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
    _0$address@0@01
    (compute_address<Address> (as _21$place<Place>  Place) _21$address@71@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  _21$address@71@01
  (compute_address<Address> (as _21$place<Place>  Place) _21$address@71@01))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [eval] valid$Snap$I64(operand1_value)
(set-option :timeout 0)
(push) ; 11
(assert (not (valid$Snap$I64<Bool> (constructor$Snap$I64$<Snap$I64> 3))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(assert (valid$Snap$I64<Bool> (constructor$Snap$I64$<Snap$I64> 3)))
; [eval] valid$Snap$I64(operand2_value)
(declare-const result_value@284@01 Snap$Tuple$$I64$Bool$$I64$Bool$)
(declare-const $t@285@01 $Snap)
(assert (= $t@285@01 ($Snap.combine ($Snap.first $t@285@01) ($Snap.second $t@285@01))))
; [eval] compute_address(target_place, target_address)
; [eval] PaddingSize$Tuple$$I64$Bool$$I64$Bool$$()
(push) ; 11
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _20$place<Place>  Place)) _20$address@65@01)
    (compute_address<Address> (as _21$place<Place>  Place) _21$address@71@01))
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
  (compute_address<Address> (as _20$place<Place>  Place) _20$address@65@01)
  (compute_address<Address> (as _21$place<Place>  Place) _21$address@71@01))))
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
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _15$place<Place>  Place)) _15$address@40@01)
    (compute_address<Address> (as _21$place<Place>  Place) _21$address@71@01))
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
  (compute_address<Address> (as _15$place<Place>  Place) _15$address@40@01)
  (compute_address<Address> (as _21$place<Place>  Place) _21$address@71@01))))
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
    (compute_address<Address> (as _21$place<Place>  Place) _21$address@71@01))
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
  (compute_address<Address> (as _10$place<Place>  Place) _10$address@8@01)
  (compute_address<Address> (as _21$place<Place>  Place) _21$address@71@01))))
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
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _10$place<Place>  Place)) _10$address@8@01)
    (compute_address<Address> (as _21$place<Place>  Place) _21$address@71@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second $t@285@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@285@01))
    ($Snap.second ($Snap.second $t@285@01)))))
; [eval] field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(compute_address(target_place, target_address))
; [eval] compute_address(target_place, target_address)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _10$place<Place>  Place)) _10$address@8@01)
  (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _21$place<Place>  Place) _21$address@71@01)))))
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
    (compute_address<Address> (as _10$place<Place>  Place) _10$address@8@01)
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _21$place<Place>  Place) _21$address@71@01)))
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
(assert (not (=
  _0$address@0@01
  (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _21$place<Place>  Place) _21$address@71@01)))))
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
    (compute_address<Address> (as _15$place<Place>  Place) _15$address@40@01)
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _21$place<Place>  Place) _21$address@71@01)))
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
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _15$place<Place>  Place)) _15$address@40@01)
  (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _21$place<Place>  Place) _21$address@71@01)))))
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
    (compute_address<Address> (as _20$place<Place>  Place) _20$address@65@01)
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _21$place<Place>  Place) _21$address@71@01)))
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
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _20$place<Place>  Place)) _20$address@65@01)
  (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _21$place<Place>  Place) _21$address@71@01)))))
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
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _21$place<Place>  Place) _21$address@71@01)))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second $t@285@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@285@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@285@01))))))
; [eval] field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(target_place)
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(result_value)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (and
  (=
    (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _20$place<Place>  Place))
    (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _21$place<Place>  Place)))
  (= _20$address@65@01 _21$address@71@01)
  (=
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> result_value@268@01)
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> result_value@284@01)))))
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
    (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _15$place<Place>  Place))
    (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _21$place<Place>  Place)))
  (= _15$address@40@01 _21$address@71@01)
  (=
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> result_value@230@01)
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> result_value@284@01)))))
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
    (as _2$place<Place>  Place)
    (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _21$place<Place>  Place)))
  (= _2$address@62@01 _21$address@71@01)
  (=
    result_value@185@01
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> result_value@284@01)))))
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
    (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _10$place<Place>  Place))
    (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _21$place<Place>  Place)))
  (= _10$address@8@01 _21$address@71@01)
  (=
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> result_value@204@01)
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> result_value@284@01)))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@285@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@285@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@285@01)))))))
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (and
  (= (as _1$place<Place>  Place) (as _17$place<Place>  Place))
  (= _1$address@6@01 _17$address@48@01)
  (= _1$snapshot$0@7@01 _17$snapshot$0@49@01))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@285@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@285@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@285@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@285@01)))))
  $Snap.unit))
; [eval] valid$Snap$I64(constructor$Snap$I64$Add_I64(operand1_value, operand2_value)) ==> destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(result_value) == constructor$Snap$I64$Add_I64(operand1_value, operand2_value)
; [eval] valid$Snap$I64(constructor$Snap$I64$Add_I64(operand1_value, operand2_value))
; [eval] constructor$Snap$I64$Add_I64(operand1_value, operand2_value)
(set-option :timeout 0)
(push) ; 11
(push) ; 12
(set-option :timeout 10)
(assert (not (not
  (valid$Snap$I64<Bool> (constructor$Snap$I64$Add_I64<Snap$I64> (constructor$Snap$I64$<Snap$I64> 3) _17$snapshot$0@49@01)))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (valid$Snap$I64<Bool> (constructor$Snap$I64$Add_I64<Snap$I64> (constructor$Snap$I64$<Snap$I64> 3) _17$snapshot$0@49@01))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [then-branch: 12 | valid$Snap$I64[Bool](constructor$Snap$I64$Add_I64[Snap$I64](constructor$Snap$I64$[Snap$I64](3), _17$snapshot$0@49@01)) | live]
; [else-branch: 12 | !(valid$Snap$I64[Bool](constructor$Snap$I64$Add_I64[Snap$I64](constructor$Snap$I64$[Snap$I64](3), _17$snapshot$0@49@01))) | dead]
(set-option :timeout 0)
(push) ; 12
; [then-branch: 12 | valid$Snap$I64[Bool](constructor$Snap$I64$Add_I64[Snap$I64](constructor$Snap$I64$[Snap$I64](3), _17$snapshot$0@49@01))]
(assert (valid$Snap$I64<Bool> (constructor$Snap$I64$Add_I64<Snap$I64> (constructor$Snap$I64$<Snap$I64> 3) _17$snapshot$0@49@01)))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(result_value) == constructor$Snap$I64$Add_I64(operand1_value, operand2_value)
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(result_value)
; [eval] constructor$Snap$I64$Add_I64(operand1_value, operand2_value)
(pop) ; 12
(pop) ; 11
; Joined path conditions
(assert (valid$Snap$I64<Bool> (constructor$Snap$I64$Add_I64<Snap$I64> (constructor$Snap$I64$<Snap$I64> 3) _17$snapshot$0@49@01)))
(assert (=>
  (valid$Snap$I64<Bool> (constructor$Snap$I64$Add_I64<Snap$I64> (constructor$Snap$I64$<Snap$I64> 3) _17$snapshot$0@49@01))
  (=
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> result_value@284@01)
    (constructor$Snap$I64$Add_I64<Snap$I64> (constructor$Snap$I64$<Snap$I64> 3) _17$snapshot$0@49@01))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@285@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@285@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@285@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@285@01))))))
  $Snap.unit))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(result_value) == constructor$Snap$Bool$(!valid$Snap$I64(constructor$Snap$I64$Add_I64(operand1_value, operand2_value)))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(result_value)
; [eval] constructor$Snap$Bool$(!valid$Snap$I64(constructor$Snap$I64$Add_I64(operand1_value, operand2_value)))
; [eval] !valid$Snap$I64(constructor$Snap$I64$Add_I64(operand1_value, operand2_value))
; [eval] valid$Snap$I64(constructor$Snap$I64$Add_I64(operand1_value, operand2_value))
; [eval] constructor$Snap$I64$Add_I64(operand1_value, operand2_value)
(assert (=
  (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> result_value@284@01)
  (constructor$Snap$Bool$<Snap$Bool> (not
    (valid$Snap$I64<Bool> (constructor$Snap$I64$Add_I64<Snap$I64> (constructor$Snap$I64$<Snap$I64> 3) _17$snapshot$0@49@01))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@285@01))))))
  $Snap.unit))
; [eval] MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(compute_address(target_place, target_address)), Size$I64$()) == to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(result_value))
; [eval] MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(compute_address(target_place, target_address)), Size$I64$())
; [eval] field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(compute_address(target_place, target_address))
; [eval] compute_address(target_place, target_address)
; [eval] Size$I64$()
(push) ; 11
(declare-const $k@286@01 $Perm)
(assert ($Perm.isReadVar $k@286@01))
(assert (< $k@286@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@286@01)))
(push) ; 12
(set-option :timeout 10)
(assert (not (< $Perm.No $k@286@01)))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@285@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _21$place<Place>  Place) _21$address@71@01)) (as Size$I64$<Snap$Usize>  Snap$Usize)))
(pop) ; 11
; Joined path conditions
(assert ($Perm.isReadVar $k@286@01))
(assert (and
  (< $k@286@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@286@01))
  (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@285@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _21$place<Place>  Place) _21$address@71@01)) (as Size$I64$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(result_value))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(result_value)
(assert (=
  (MemoryBlock$bytes ($Snap.first ($Snap.second $t@285@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _21$place<Place>  Place) _21$address@71@01)) (as Size$I64$<Snap$Usize>  Snap$Usize))
  (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> result_value@284@01))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _21$snapshot$1 == tmp$8
(declare-const $t@287@01 $Snap)
(assert (= $t@287@01 $Snap.unit))
; [eval] _21$snapshot$1 == tmp$8
(assert (= _21$snapshot$1@73@01 result_value@284@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [eval] !destructor$Snap$Bool$$value(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(_21$snapshot$1))
; [eval] destructor$Snap$Bool$$value(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(_21$snapshot$1))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(_21$snapshot$1)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (destructor$Snap$Bool$$value<Bool> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> _21$snapshot$1@73@01))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (not
  (destructor$Snap$Bool$$value<Bool> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> _21$snapshot$1@73@01)))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [then-branch: 13 | !(destructor$Snap$Bool$$value[Bool](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](_21$snapshot$1@73@01))) | live]
; [else-branch: 13 | destructor$Snap$Bool$$value[Bool](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](_21$snapshot$1@73@01)) | dead]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 13 | !(destructor$Snap$Bool$$value[Bool](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](_21$snapshot$1@73@01)))]
(assert (not
  (destructor$Snap$Bool$$value<Bool> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> _21$snapshot$1@73@01))))
; [exec]
; label label_bb12
; [exec]
; label_bb12$marker := true
; [exec]
; inhale basic_block_marker$label_bb12$marker()
(declare-const $t@288@01 $Snap)
(assert (= $t@288@01 $Snap.unit))
; [eval] basic_block_marker$label_bb12$marker()
(assert (as basic_block_marker$label_bb12$marker<Bool>  Bool))
; State saturation: after inhale
(set-option :timeout 20)
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
(push) ; 12
(assert (not (valid$Snap$I64<Bool> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _21$snapshot$1@73@01))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(assert (valid$Snap$I64<Bool> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _21$snapshot$1@73@01)))
; [eval] compute_address(place, root_address)
; [eval] Size$I64$()
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _21$place<Place>  Place) _21$address@71@01))
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [eval] MemoryBlock$bytes(compute_address(place, root_address), Size$I64$()) == to_bytes$I64(snapshot)
; [eval] MemoryBlock$bytes(compute_address(place, root_address), Size$I64$())
; [eval] compute_address(place, root_address)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 12
(declare-const $k@289@01 $Perm)
(assert ($Perm.isReadVar $k@289@01))
(push) ; 13
(set-option :timeout 10)
(assert (not (=
  (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _21$place<Place>  Place) _21$address@71@01))
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01))))
(check-sat)
; unsat
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(assert (< $k@289@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@289@01)))
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (< $Perm.No $k@289@01)))
(check-sat)
; unsat
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@285@01)) (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01) (as Size$I64$<Snap$Usize>  Snap$Usize)))
(pop) ; 12
; Joined path conditions
(assert ($Perm.isReadVar $k@289@01))
(assert (and
  (< $k@289@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@289@01))
  (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@285@01)) (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01) (as Size$I64$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$I64(snapshot)
(set-option :timeout 0)
(push) ; 12
(assert (not (=
  (MemoryBlock$bytes ($Snap.first ($Snap.second $t@285@01)) (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
  (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _21$snapshot$1@73@01)))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(assert (=
  (MemoryBlock$bytes ($Snap.first ($Snap.second $t@285@01)) (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
  (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _21$snapshot$1@73@01))))
(assert (OwnedNonAliased$I64%trigger ($Snap.combine
  $Snap.unit
  ($Snap.combine ($Snap.first ($Snap.second $t@285@01)) $Snap.unit)) (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01 (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _21$snapshot$1@73@01)))
(push) ; 12
(set-option :timeout 10)
(assert (not (and
  (=
    (as _1$place<Place>  Place)
    (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)))
  (= _1$address@6@01 _21$address@71@01)
  (=
    _1$snapshot$0@7@01
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _21$snapshot$1@73@01)))))
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
    (as _17$place<Place>  Place)
    (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)))
  (= _17$address@48@01 _21$address@71@01)
  (=
    _17$snapshot$0@49@01
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _21$snapshot$1@73@01)))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [exec]
; move_place$I64(_0$place(), _0$address, field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(_21$place()),
;   _21$address, destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(_21$snapshot$1))
; [eval] _0$place()
; [eval] field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(_21$place())
; [eval] _21$place()
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(_21$snapshot$1)
; [eval] compute_address(target_place, target_root_address)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _21$place<Place>  Place) _21$address@71@01)
    (compute_address<Address> (as _0$place<Place>  Place) _0$address@0@01))
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
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _20$place<Place>  Place)) _20$address@65@01)
  (compute_address<Address> (as _0$place<Place>  Place) _0$address@0@01))))
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
    (compute_address<Address> (as _20$place<Place>  Place) _20$address@65@01)
    (compute_address<Address> (as _0$place<Place>  Place) _0$address@0@01))
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
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _15$place<Place>  Place)) _15$address@40@01)
  (compute_address<Address> (as _0$place<Place>  Place) _0$address@0@01))))
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
    (compute_address<Address> (as _15$place<Place>  Place) _15$address@40@01)
    (compute_address<Address> (as _0$place<Place>  Place) _0$address@0@01))
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
(assert (not (=
  _0$address@0@01
  (compute_address<Address> (as _0$place<Place>  Place) _0$address@0@01))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(declare-const $t@290@01 $Snap)
(assert (= $t@290@01 ($Snap.combine ($Snap.first $t@290@01) ($Snap.second $t@290@01))))
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (and
  (= (as _17$place<Place>  Place) (as _0$place<Place>  Place))
  (= _17$address@48@01 _0$address@0@01)
  (=
    _17$snapshot$0@49@01
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _21$snapshot$1@73@01)))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (and
  (= (as _1$place<Place>  Place) (as _0$place<Place>  Place))
  (= _1$address@6@01 _0$address@0@01)
  (=
    _1$snapshot$0@7@01
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _21$snapshot$1@73@01)))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second $t@290@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@290@01))
    ($Snap.second ($Snap.second $t@290@01)))))
; [eval] compute_address(source_place, source_root_address)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 12
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
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _20$place<Place>  Place)) _20$address@65@01)
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01))))
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
    (compute_address<Address> (as _20$place<Place>  Place) _20$address@65@01)
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01))
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
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _15$place<Place>  Place)) _15$address@40@01)
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01))))
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
    (compute_address<Address> (as _15$place<Place>  Place) _15$address@40@01)
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01))
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
    (compute_address<Address> (as _10$place<Place>  Place) _10$address@8@01)
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01))
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
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _10$place<Place>  Place)) _10$address@8@01)
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(assert (= ($Snap.second ($Snap.second $t@290@01)) $Snap.unit))
; [eval] valid$Snap$I64(source_snapshot)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _0$snapshot$2 ==
;   destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(_21$snapshot$1)
(declare-const $t@291@01 $Snap)
(assert (= $t@291@01 $Snap.unit))
; [eval] _0$snapshot$2 == destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(_21$snapshot$1)
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(_21$snapshot$1)
(assert (=
  _0$snapshot$2@3@01
  (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _21$snapshot$1@73@01)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; into_memory_block$I64(_17$place(), _17$address, _17$snapshot$0)
; [eval] _17$place()
; [eval] compute_address(place, root_address)
; [eval] Size$I64$()
(declare-const $t@292@01 $Snap)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _10$place<Place>  Place)) _10$address@8@01)
  (compute_address<Address> (as _17$place<Place>  Place) _17$address@48@01))))
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
    (compute_address<Address> (as _10$place<Place>  Place) _10$address@8@01)
    (compute_address<Address> (as _17$place<Place>  Place) _17$address@48@01))
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
    (compute_address<Address> (as _15$place<Place>  Place) _15$address@40@01)
    (compute_address<Address> (as _17$place<Place>  Place) _17$address@48@01))
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
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _15$place<Place>  Place)) _15$address@40@01)
  (compute_address<Address> (as _17$place<Place>  Place) _17$address@48@01))))
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
    (compute_address<Address> (as _20$place<Place>  Place) _20$address@65@01)
    (compute_address<Address> (as _17$place<Place>  Place) _17$address@48@01))
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
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _20$place<Place>  Place)) _20$address@65@01)
  (compute_address<Address> (as _17$place<Place>  Place) _17$address@48@01))))
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
    (compute_address<Address> (as _17$place<Place>  Place) _17$address@48@01))
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
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01)
  (compute_address<Address> (as _17$place<Place>  Place) _17$address@48@01))))
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
; exhale acc(MemoryBlock(_17$address, Size$I64$()), write)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _17$place<Place>  Place) _17$address@48@01)
  _17$address@48@01)))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(MemoryBlockStackDrop(_17$address, Size$I64$()), write)
; [eval] Size$I64$()
; [exec]
; label label__from__label_bb12__to__label_bb13
; [exec]
; inhale _0$snapshot$3 == _0$snapshot$2
(declare-const $t@293@01 $Snap)
(assert (= $t@293@01 $Snap.unit))
; [eval] _0$snapshot$3 == _0$snapshot$2
(assert (= _0$snapshot$3@4@01 _0$snapshot$2@3@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale _10$snapshot$2 == _10$snapshot$1
(declare-const $t@294@01 $Snap)
(assert (= $t@294@01 $Snap.unit))
; [eval] _10$snapshot$2 == _10$snapshot$1
(assert (= _10$snapshot$2@11@01 _10$snapshot$1@10@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _11$snapshot$3 == _11$snapshot$1
(declare-const $t@295@01 $Snap)
(assert (= $t@295@01 $Snap.unit))
; [eval] _11$snapshot$3 == _11$snapshot$1
(assert (= _11$snapshot$3@17@01 _11$snapshot$1@15@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _12$snapshot$4 == _12$snapshot$2
(declare-const $t@296@01 $Snap)
(assert (= $t@296@01 $Snap.unit))
; [eval] _12$snapshot$4 == _12$snapshot$2
(assert (= _12$snapshot$4@24@01 _12$snapshot$2@22@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _13$snapshot$4 == _13$snapshot$2
(declare-const $t@297@01 $Snap)
(assert (= $t@297@01 $Snap.unit))
; [eval] _13$snapshot$4 == _13$snapshot$2
(assert (= _13$snapshot$4@31@01 _13$snapshot$2@29@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _14$snapshot$4 == _14$snapshot$2
(declare-const $t@298@01 $Snap)
(assert (= $t@298@01 $Snap.unit))
; [eval] _14$snapshot$4 == _14$snapshot$2
(assert (= _14$snapshot$4@38@01 _14$snapshot$2@36@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _15$snapshot$4 == _15$snapshot$2
(declare-const $t@299@01 $Snap)
(assert (= $t@299@01 $Snap.unit))
; [eval] _15$snapshot$4 == _15$snapshot$2
(assert (= _15$snapshot$4@45@01 _15$snapshot$2@43@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _18$snapshot$3 == _18$snapshot$1
(declare-const $t@300@01 $Snap)
(assert (= $t@300@01 $Snap.unit))
; [eval] _18$snapshot$3 == _18$snapshot$1
(assert (= _18$snapshot$3@54@01 _18$snapshot$1@52@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _19$snapshot$3 == _19$snapshot$1
(declare-const $t@301@01 $Snap)
(assert (= $t@301@01 $Snap.unit))
; [eval] _19$snapshot$3 == _19$snapshot$1
(assert (= _19$snapshot$3@60@01 _19$snapshot$1@58@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _20$snapshot$3 == _20$snapshot$1
(declare-const $t@302@01 $Snap)
(assert (= $t@302@01 $Snap.unit))
; [eval] _20$snapshot$3 == _20$snapshot$1
(assert (= _20$snapshot$3@69@01 _20$snapshot$1@67@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _21$snapshot$3 == _21$snapshot$1
(declare-const $t@303@01 $Snap)
(assert (= $t@303@01 $Snap.unit))
; [eval] _21$snapshot$3 == _21$snapshot$1
(assert (= _21$snapshot$3@75@01 _21$snapshot$1@73@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _4$snapshot$3 == _4$snapshot$1
(declare-const $t@304@01 $Snap)
(assert (= $t@304@01 $Snap.unit))
; [eval] _4$snapshot$3 == _4$snapshot$1
(assert (= _4$snapshot$3@84@01 _4$snapshot$1@82@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _5$snapshot$3 == _5$snapshot$1
(declare-const $t@305@01 $Snap)
(assert (= $t@305@01 $Snap.unit))
; [eval] _5$snapshot$3 == _5$snapshot$1
(assert (= _5$snapshot$3@90@01 _5$snapshot$1@88@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _6$snapshot$5 == _6$snapshot$3
(declare-const $t@306@01 $Snap)
(assert (= $t@306@01 $Snap.unit))
; [eval] _6$snapshot$5 == _6$snapshot$3
(assert (= _6$snapshot$5@98@01 _6$snapshot$3@96@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _7$snapshot$3 == _7$snapshot$1
(declare-const $t@307@01 $Snap)
(assert (= $t@307@01 $Snap.unit))
; [eval] _7$snapshot$3 == _7$snapshot$1
(assert (= _7$snapshot$3@104@01 _7$snapshot$1@102@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _8$snapshot$3 == _8$snapshot$1
(declare-const $t@308@01 $Snap)
(assert (= $t@308@01 $Snap.unit))
; [eval] _8$snapshot$3 == _8$snapshot$1
(assert (= _8$snapshot$3@110@01 _8$snapshot$1@108@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _9$snapshot$2 == _9$snapshot$1
(declare-const $t@309@01 $Snap)
(assert (= $t@309@01 $Snap.unit))
; [eval] _9$snapshot$2 == _9$snapshot$1
(assert (= _9$snapshot$2@115@01 _9$snapshot$1@114@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale lft_function_call_1$snapshot$3 == lft_function_call_1$snapshot$1
(declare-const $t@310@01 $Snap)
(assert (= $t@310@01 $Snap.unit))
; [eval] lft_function_call_1$snapshot$3 == lft_function_call_1$snapshot$1
(assert (= lft_function_call_1$snapshot$3@149@01 lft@169@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; label label_bb13
; [exec]
; label_bb13$marker := true
; [exec]
; inhale basic_block_marker$label_bb13$marker()
(declare-const $t@311@01 $Snap)
(assert (= $t@311@01 $Snap.unit))
; [eval] basic_block_marker$label_bb13$marker()
(assert (as basic_block_marker$label_bb13$marker<Bool>  Bool))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; into_memory_block$Bool(_2$place(), _2$address, _2$snapshot$1)
; [eval] _2$place()
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (and
  (=
    (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _10$place<Place>  Place))
    (as _2$place<Place>  Place))
  (= _10$address@8@01 _2$address@62@01)
  (=
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> result_value@204@01)
    _2$snapshot$1@64@01))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= result_value@185@01 _2$snapshot$1@64@01)))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [eval] compute_address(place, root_address)
; [eval] Size$Bool$()
(declare-const $t@312@01 $Snap)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01)
    (compute_address<Address> (as _2$place<Place>  Place) _2$address@62@01))
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
    (compute_address<Address> (as _21$place<Place>  Place) _21$address@71@01)
    (compute_address<Address> (as _2$place<Place>  Place) _2$address@62@01))
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
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _20$place<Place>  Place)) _20$address@65@01)
    (compute_address<Address> (as _2$place<Place>  Place) _2$address@62@01))
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
    (compute_address<Address> (as _20$place<Place>  Place) _20$address@65@01)
    (compute_address<Address> (as _2$place<Place>  Place) _2$address@62@01))
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
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _15$place<Place>  Place)) _15$address@40@01)
    (compute_address<Address> (as _2$place<Place>  Place) _2$address@62@01))
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
    (compute_address<Address> (as _15$place<Place>  Place) _15$address@40@01)
    (compute_address<Address> (as _2$place<Place>  Place) _2$address@62@01))
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
    (compute_address<Address> (as _10$place<Place>  Place) _10$address@8@01)
    (compute_address<Address> (as _2$place<Place>  Place) _2$address@62@01))
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
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _10$place<Place>  Place)) _10$address@8@01)
    (compute_address<Address> (as _2$place<Place>  Place) _2$address@62@01))
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
; exhale acc(MemoryBlock(_2$address, Size$Bool$()), write)
; [eval] Size$Bool$()
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _2$place<Place>  Place) _2$address@62@01)
  _2$address@62@01)))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(MemoryBlockStackDrop(_2$address, Size$Bool$()), write)
; [eval] Size$Bool$()
; [exec]
; label return_label
; [exec]
; return_label$marker := true
; [exec]
; inhale basic_block_marker$return_label$marker()
(declare-const $t@313@01 $Snap)
(assert (= $t@313@01 $Snap.unit))
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
(declare-const $t@314@01 $Snap)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _10$place<Place>  Place)) _10$address@8@01)
  (compute_address<Address> (as _1$place<Place>  Place) _1$address@6@01))))
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
    (compute_address<Address> (as _10$place<Place>  Place) _10$address@8@01)
    (compute_address<Address> (as _1$place<Place>  Place) _1$address@6@01))
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
    (compute_address<Address> (as _15$place<Place>  Place) _15$address@40@01)
    (compute_address<Address> (as _1$place<Place>  Place) _1$address@6@01))
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
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _15$place<Place>  Place)) _15$address@40@01)
  (compute_address<Address> (as _1$place<Place>  Place) _1$address@6@01))))
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
    (compute_address<Address> (as _20$place<Place>  Place) _20$address@65@01)
    (compute_address<Address> (as _1$place<Place>  Place) _1$address@6@01))
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
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _20$place<Place>  Place)) _20$address@65@01)
  (compute_address<Address> (as _1$place<Place>  Place) _1$address@6@01))))
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
    (compute_address<Address> (as _1$place<Place>  Place) _1$address@6@01))
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
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01)
  (compute_address<Address> (as _1$place<Place>  Place) _1$address@6@01))))
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
  (compute_address<Address> (as _1$place<Place>  Place) _1$address@6@01)
  _1$address@6@01)))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(OwnedNonAliased$I64(_0$place(), _0$address, _0$snapshot$3), write) &&
;   valid$Snap$I64(_0$snapshot$3)
; [eval] _0$place()
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _21$snapshot$1@73@01)
  _0$snapshot$3@4@01)))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [eval] valid$Snap$I64(_0$snapshot$3)
(set-option :timeout 0)
(push) ; 12
(assert (not (valid$Snap$I64<Bool> _0$snapshot$3@4@01)))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(assert (valid$Snap$I64<Bool> _0$snapshot$3@4@01))
; [exec]
; lft_tok_sep_return$2(lft_1$snapshot$1, bw0$snapshot$0, bw1$snapshot$0, lifetime_token_perm_amount$0$snapshot$0 /
;   7)
; [eval] lifetime_token_perm_amount$0$snapshot$0 / 7
; [eval] none < rd_perm
(push) ; 12
(assert (not (or
  (= (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7)) $Perm.No)
  (< $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7))))))
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
      (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7))
      (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7)))
    ($Perm.min
      (+
        (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7))
        (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7)))
      (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7))))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(assert (<=
  $Perm.No
  (-
    (+
      (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7))
      (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7)))
    ($Perm.min
      (+
        (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7))
        (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7)))
      (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7))))))
(set-option :timeout 0)
(push) ; 12
(assert (not (or
  (=
    (-
      (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7))
      ($Perm.min
        (+
          (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7))
          (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7)))
        (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7))))
    $Perm.No)
  (<
    (-
      (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7))
      ($Perm.min
        (+
          (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7))
          (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7)))
        (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7))))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(push) ; 12
(set-option :timeout 10)
(assert (not (< $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7)))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [eval] lft == intersect(Set(lft_1, lft_2))
; [eval] intersect(Set(lft_1, lft_2))
; [eval] Set(lft_1, lft_2)
(declare-const $t@315@01 $Snap)
(assert (= $t@315@01 ($Snap.combine ($Snap.first $t@315@01) ($Snap.second $t@315@01))))
(set-option :timeout 0)
(push) ; 12
(assert (not (or
  (= (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7)) $Perm.No)
  (< $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7))))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(declare-const $t@316@01 $Snap)
(assert (and
  (=>
    (<
      $Perm.No
      (-
        lifetime_token_perm_amount$0$snapshot$0@151@01
        ($Perm.min
          lifetime_token_perm_amount$0$snapshot$0@151@01
          (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7)))))
    (= $t@316@01 $t@167@01))
  (=>
    (< $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7)))
    (= $t@316@01 ($Snap.first $t@315@01)))))
(assert (<=
  $Perm.No
  (+
    (-
      lifetime_token_perm_amount$0$snapshot$0@151@01
      ($Perm.min
        lifetime_token_perm_amount$0$snapshot$0@151@01
        (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7))))
    (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7)))))
(push) ; 12
(assert (not (or
  (= (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7)) $Perm.No)
  (< $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7))))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(declare-const $t@317@01 $Snap)
(assert (and
  (=>
    (<
      $Perm.No
      (-
        lifetime_token_perm_amount$0$snapshot$0@151@01
        ($Perm.min
          lifetime_token_perm_amount$0$snapshot$0@151@01
          (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7)))))
    (= $t@317@01 $t@168@01))
  (=>
    (< $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7)))
    (= $t@317@01 ($Snap.second $t@315@01)))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; exhale acc(LifetimeToken(bw0$snapshot$0), lifetime_token_perm_amount$0$snapshot$0)
(set-option :timeout 0)
(push) ; 12
(assert (not (or
  (= lifetime_token_perm_amount$0$snapshot$0@151@01 $Perm.No)
  (< $Perm.No lifetime_token_perm_amount$0$snapshot$0@151@01))))
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
        lifetime_token_perm_amount$0$snapshot$0@151@01
        ($Perm.min
          lifetime_token_perm_amount$0$snapshot$0@151@01
          (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7))))
      (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7)))
    ($Perm.min
      (+
        (-
          lifetime_token_perm_amount$0$snapshot$0@151@01
          ($Perm.min
            lifetime_token_perm_amount$0$snapshot$0@151@01
            (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7))))
        (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7)))
      lifetime_token_perm_amount$0$snapshot$0@151@01))
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
      lifetime_token_perm_amount$0$snapshot$0@151@01
      ($Perm.min
        (+
          (-
            lifetime_token_perm_amount$0$snapshot$0@151@01
            ($Perm.min
              lifetime_token_perm_amount$0$snapshot$0@151@01
              (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7))))
          (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7)))
        lifetime_token_perm_amount$0$snapshot$0@151@01))
    $Perm.No)
  (<
    (-
      lifetime_token_perm_amount$0$snapshot$0@151@01
      ($Perm.min
        (+
          (-
            lifetime_token_perm_amount$0$snapshot$0@151@01
            ($Perm.min
              lifetime_token_perm_amount$0$snapshot$0@151@01
              (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7))))
          (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7)))
        lifetime_token_perm_amount$0$snapshot$0@151@01))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(push) ; 12
(set-option :timeout 10)
(assert (not (< $Perm.No lifetime_token_perm_amount$0$snapshot$0@151@01)))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(LifetimeToken(bw1$snapshot$0), lifetime_token_perm_amount$0$snapshot$0)
(set-option :timeout 0)
(push) ; 12
(assert (not (or
  (= lifetime_token_perm_amount$0$snapshot$0@151@01 $Perm.No)
  (< $Perm.No lifetime_token_perm_amount$0$snapshot$0@151@01))))
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
        lifetime_token_perm_amount$0$snapshot$0@151@01
        ($Perm.min
          lifetime_token_perm_amount$0$snapshot$0@151@01
          (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7))))
      (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7)))
    ($Perm.min
      (+
        (-
          lifetime_token_perm_amount$0$snapshot$0@151@01
          ($Perm.min
            lifetime_token_perm_amount$0$snapshot$0@151@01
            (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7))))
        (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7)))
      lifetime_token_perm_amount$0$snapshot$0@151@01))
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
      lifetime_token_perm_amount$0$snapshot$0@151@01
      ($Perm.min
        (+
          (-
            lifetime_token_perm_amount$0$snapshot$0@151@01
            ($Perm.min
              lifetime_token_perm_amount$0$snapshot$0@151@01
              (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7))))
          (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7)))
        lifetime_token_perm_amount$0$snapshot$0@151@01))
    $Perm.No)
  (<
    (-
      lifetime_token_perm_amount$0$snapshot$0@151@01
      ($Perm.min
        (+
          (-
            lifetime_token_perm_amount$0$snapshot$0@151@01
            ($Perm.min
              lifetime_token_perm_amount$0$snapshot$0@151@01
              (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7))))
          (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7)))
        lifetime_token_perm_amount$0$snapshot$0@151@01))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(push) ; 12
(set-option :timeout 10)
(assert (not (< $Perm.No lifetime_token_perm_amount$0$snapshot$0@151@01)))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [eval] label_bb12$marker && label_bb13$marker
(set-option :timeout 0)
(push) ; 12
; [then-branch: 14 | True | live]
; [else-branch: 14 | False | live]
(push) ; 13
; [then-branch: 14 | True]
(pop) ; 13
(push) ; 13
; [else-branch: 14 | False]
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
; [then-branch: 15 | True | live]
; [else-branch: 15 | False | dead]
(set-option :timeout 0)
(push) ; 12
; [then-branch: 15 | True]
; [exec]
; into_memory_block$Bool(field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(_10$place()),
;   _10$address, destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(_10$snapshot$2))
; [eval] field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(_10$place())
; [eval] _10$place()
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(_10$snapshot$2)
(push) ; 13
(set-option :timeout 10)
(assert (not (=
  (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> result_value@204@01)
  (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> _10$snapshot$2@11@01))))
(check-sat)
; unsat
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
; [eval] compute_address(place, root_address)
; [eval] Size$Bool$()
(declare-const $t@318@01 $Snap)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01)
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _10$place<Place>  Place)) _10$address@8@01))
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
    (compute_address<Address> (as _21$place<Place>  Place) _21$address@71@01)
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _10$place<Place>  Place)) _10$address@8@01))
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
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _20$place<Place>  Place)) _20$address@65@01)
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _10$place<Place>  Place)) _10$address@8@01))
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
    (compute_address<Address> (as _20$place<Place>  Place) _20$address@65@01)
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _10$place<Place>  Place)) _10$address@8@01))
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
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _15$place<Place>  Place)) _15$address@40@01)
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _10$place<Place>  Place)) _10$address@8@01))
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
    (compute_address<Address> (as _15$place<Place>  Place) _15$address@40@01)
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _10$place<Place>  Place)) _10$address@8@01))
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
    (compute_address<Address> (as _10$place<Place>  Place) _10$address@8@01)
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _10$place<Place>  Place)) _10$address@8@01))
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
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _10$place<Place>  Place)) _10$address@8@01)
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _10$place<Place>  Place)) _10$address@8@01))
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
; [eval] label_bb12$marker && label_bb13$marker
(set-option :timeout 0)
(push) ; 13
; [then-branch: 16 | True | live]
; [else-branch: 16 | False | live]
(push) ; 14
; [then-branch: 16 | True]
(pop) ; 14
(push) ; 14
; [else-branch: 16 | False]
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
; [then-branch: 17 | True | live]
; [else-branch: 17 | False | dead]
(set-option :timeout 0)
(push) ; 13
; [then-branch: 17 | True]
; [exec]
; memory_block_join$Tuple$$I64$Bool$$I64$Bool$(_10$address, write)
; [eval] none < permission_amount
; [eval] PaddingSize$Tuple$$I64$Bool$$I64$Bool$$()
(push) ; 14
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _10$place<Place>  Place)) _10$address@8@01)
    _10$address@8@01)
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
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01)
    _10$address@8@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
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
  _10$address@8@01)))
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
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _20$place<Place>  Place)) _20$address@65@01)
    _10$address@8@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
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
  (compute_address<Address> (as _20$place<Place>  Place) _20$address@65@01)
  _10$address@8@01)))
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
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _15$place<Place>  Place)) _15$address@40@01)
    _10$address@8@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
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
  (compute_address<Address> (as _15$place<Place>  Place) _15$address@40@01)
  _10$address@8@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _10$place<Place>  Place) _10$address@8@01)
  _10$address@8@01)))
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
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _10$place<Place>  Place)) _10$address@8@01)
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _10$address@8@01))
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
  (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _10$address@8@01))))
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
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _10$address@8@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
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
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _20$place<Place>  Place)) _20$address@65@01)
  (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _10$address@8@01))))
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
    (compute_address<Address> (as _20$place<Place>  Place) _20$address@65@01)
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _10$address@8@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
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
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _15$place<Place>  Place)) _15$address@40@01)
  (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _10$address@8@01))))
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
    (compute_address<Address> (as _15$place<Place>  Place) _15$address@40@01)
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _10$address@8@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
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
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _10$place<Place>  Place)) _10$address@8@01)
  (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _10$address@8@01))))
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
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _10$place<Place>  Place)) _10$address@8@01)
  (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _10$address@8@01))))
(check-sat)
; unsat
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(declare-const $t@319@01 $Snap)
(assert (= $t@319@01 ($Snap.combine ($Snap.first $t@319@01) ($Snap.second $t@319@01))))
; [eval] Size$Tuple$$I64$Bool$$I64$Bool$$()
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _15$place<Place>  Place) _15$address@40@01)
    _10$address@8@01)
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
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
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _15$place<Place>  Place)) _15$address@40@01)
    _10$address@8@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
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
    (compute_address<Address> (as _20$place<Place>  Place) _20$address@65@01)
    _10$address@8@01)
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
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
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _20$place<Place>  Place)) _20$address@65@01)
    _10$address@8@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
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
    _10$address@8@01)
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
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
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01)
    _10$address@8@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(assert (= ($Snap.second $t@319@01) $Snap.unit))
; [eval] (forall snapshot: Snap$Tuple$$I64$Bool$$I64$Bool$ :: { to_bytes$Tuple$$I64$Bool$$I64$Bool$(snapshot) } old(MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address), Size$I64$()) == to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot))) && old(MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address), Size$Bool$()) == to_bytes$Bool(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot))) ==> MemoryBlock$bytes(address, Size$Tuple$$I64$Bool$$I64$Bool$$()) == to_bytes$Tuple$$I64$Bool$$I64$Bool$(snapshot))
(declare-const snapshot@320@01 Snap$Tuple$$I64$Bool$$I64$Bool$)
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
(declare-const $k@321@01 $Perm)
(assert ($Perm.isReadVar $k@321@01))
(push) ; 16
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _10$place<Place>  Place)) _10$address@8@01)
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _10$address@8@01))
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
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01)
  (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _10$address@8@01))))
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
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _10$address@8@01))
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
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _20$place<Place>  Place)) _20$address@65@01)
  (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _10$address@8@01))))
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
    (compute_address<Address> (as _20$place<Place>  Place) _20$address@65@01)
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _10$address@8@01))
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
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _15$place<Place>  Place)) _15$address@40@01)
  (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _10$address@8@01))))
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
    (compute_address<Address> (as _15$place<Place>  Place) _15$address@40@01)
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _10$address@8@01))
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
(assert (not (and
  (=
    (compute_address<Address> (as _10$place<Place>  Place) _10$address@8@01)
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _10$address@8@01))
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
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _10$place<Place>  Place)) _10$address@8@01)
  (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _10$address@8@01))))
(check-sat)
; unsat
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(assert (< $k@321@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@321@01)))
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (< $Perm.No $k@321@01)))
(check-sat)
; unsat
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@210@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _10$address@8@01) (as Size$I64$<Snap$Usize>  Snap$Usize)))
(pop) ; 15
; Joined path conditions
(assert ($Perm.isReadVar $k@321@01))
(assert (and
  (< $k@321@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@321@01))
  (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@210@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _10$address@8@01) (as Size$I64$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot)
(set-option :timeout 0)
(push) ; 15
; [then-branch: 18 | MemoryBlock$bytes(First:(Second:($t@210@01)), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](_10$address@8@01), Size$I64$[Snap$Usize]) == to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@320@01)) | live]
; [else-branch: 18 | MemoryBlock$bytes(First:(Second:($t@210@01)), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](_10$address@8@01), Size$I64$[Snap$Usize]) != to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@320@01)) | live]
(push) ; 16
; [then-branch: 18 | MemoryBlock$bytes(First:(Second:($t@210@01)), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](_10$address@8@01), Size$I64$[Snap$Usize]) == to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@320@01))]
(assert (=
  (MemoryBlock$bytes ($Snap.first ($Snap.second $t@210@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _10$address@8@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
  (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@320@01))))
; [eval] old(MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address), Size$Bool$()) == to_bytes$Bool(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot)))
; [eval] MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address), Size$Bool$()) == to_bytes$Bool(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot))
; [eval] MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address), Size$Bool$())
; [eval] field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address)
; [eval] Size$Bool$()
(push) ; 17
(declare-const $k@322@01 $Perm)
(assert ($Perm.isReadVar $k@322@01))
(push) ; 18
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _10$place<Place>  Place)) _10$address@8@01)
  (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _10$address@8@01))))
(check-sat)
; unsat
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(assert (< $k@322@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@322@01)))
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (< $Perm.No $k@322@01)))
(check-sat)
; unsat
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition $t@318@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _10$address@8@01) (as Size$Bool$<Snap$Usize>  Snap$Usize)))
(pop) ; 17
; Joined path conditions
(assert ($Perm.isReadVar $k@322@01))
(assert (and
  (< $k@322@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@322@01))
  (MemoryBlock$bytes%precondition $t@318@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _10$address@8@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$Bool(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot)
(pop) ; 16
(set-option :timeout 0)
(push) ; 16
; [else-branch: 18 | MemoryBlock$bytes(First:(Second:($t@210@01)), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](_10$address@8@01), Size$I64$[Snap$Usize]) != to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@320@01))]
(assert (not
  (=
    (MemoryBlock$bytes ($Snap.first ($Snap.second $t@210@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _10$address@8@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
    (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@320@01)))))
(pop) ; 16
(pop) ; 15
; Joined path conditions
(assert ($Perm.isReadVar $k@322@01))
(assert (=>
  (=
    (MemoryBlock$bytes ($Snap.first ($Snap.second $t@210@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _10$address@8@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
    (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@320@01)))
  (and
    (=
      (MemoryBlock$bytes ($Snap.first ($Snap.second $t@210@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _10$address@8@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
      (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@320@01)))
    (< $k@322@01 $Perm.Write)
    (<= $Perm.No (- $Perm.Write $k@322@01))
    (MemoryBlock$bytes%precondition $t@318@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _10$address@8@01) (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
; Joined path conditions
(assert (or
  (not
    (=
      (MemoryBlock$bytes ($Snap.first ($Snap.second $t@210@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _10$address@8@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
      (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@320@01))))
  (=
    (MemoryBlock$bytes ($Snap.first ($Snap.second $t@210@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _10$address@8@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
    (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@320@01)))))
(push) ; 15
; [then-branch: 19 | MemoryBlock$bytes($t@318@01, field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Address](_10$address@8@01), Size$Bool$[Snap$Usize]) == to_bytes$Bool[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](snapshot@320@01)) && MemoryBlock$bytes(First:(Second:($t@210@01)), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](_10$address@8@01), Size$I64$[Snap$Usize]) == to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@320@01)) | live]
; [else-branch: 19 | !(MemoryBlock$bytes($t@318@01, field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Address](_10$address@8@01), Size$Bool$[Snap$Usize]) == to_bytes$Bool[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](snapshot@320@01)) && MemoryBlock$bytes(First:(Second:($t@210@01)), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](_10$address@8@01), Size$I64$[Snap$Usize]) == to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@320@01))) | live]
(push) ; 16
; [then-branch: 19 | MemoryBlock$bytes($t@318@01, field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Address](_10$address@8@01), Size$Bool$[Snap$Usize]) == to_bytes$Bool[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](snapshot@320@01)) && MemoryBlock$bytes(First:(Second:($t@210@01)), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](_10$address@8@01), Size$I64$[Snap$Usize]) == to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@320@01))]
(assert (and
  (=
    (MemoryBlock$bytes $t@318@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _10$address@8@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
    (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@320@01)))
  (=
    (MemoryBlock$bytes ($Snap.first ($Snap.second $t@210@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _10$address@8@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
    (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@320@01)))))
; [eval] MemoryBlock$bytes(address, Size$Tuple$$I64$Bool$$I64$Bool$$()) == to_bytes$Tuple$$I64$Bool$$I64$Bool$(snapshot)
; [eval] MemoryBlock$bytes(address, Size$Tuple$$I64$Bool$$I64$Bool$$())
; [eval] Size$Tuple$$I64$Bool$$I64$Bool$$()
(push) ; 17
(declare-const $k@323@01 $Perm)
(assert ($Perm.isReadVar $k@323@01))
(assert (< $k@323@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@323@01)))
(push) ; 18
(set-option :timeout 10)
(assert (not (< $Perm.No $k@323@01)))
(check-sat)
; unsat
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first $t@319@01) _10$address@8@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))
(pop) ; 17
; Joined path conditions
(assert ($Perm.isReadVar $k@323@01))
(assert (and
  (< $k@323@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@323@01))
  (MemoryBlock$bytes%precondition ($Snap.first $t@319@01) _10$address@8@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$Tuple$$I64$Bool$$I64$Bool$(snapshot)
(pop) ; 16
(set-option :timeout 0)
(push) ; 16
; [else-branch: 19 | !(MemoryBlock$bytes($t@318@01, field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Address](_10$address@8@01), Size$Bool$[Snap$Usize]) == to_bytes$Bool[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](snapshot@320@01)) && MemoryBlock$bytes(First:(Second:($t@210@01)), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](_10$address@8@01), Size$I64$[Snap$Usize]) == to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@320@01)))]
(assert (not
  (and
    (=
      (MemoryBlock$bytes $t@318@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _10$address@8@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
      (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@320@01)))
    (=
      (MemoryBlock$bytes ($Snap.first ($Snap.second $t@210@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _10$address@8@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
      (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@320@01))))))
(pop) ; 16
(pop) ; 15
; Joined path conditions
(assert ($Perm.isReadVar $k@323@01))
(assert (=>
  (and
    (=
      (MemoryBlock$bytes $t@318@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _10$address@8@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
      (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@320@01)))
    (=
      (MemoryBlock$bytes ($Snap.first ($Snap.second $t@210@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _10$address@8@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
      (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@320@01))))
  (and
    (=
      (MemoryBlock$bytes $t@318@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _10$address@8@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
      (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@320@01)))
    (=
      (MemoryBlock$bytes ($Snap.first ($Snap.second $t@210@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _10$address@8@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
      (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@320@01)))
    (< $k@323@01 $Perm.Write)
    (<= $Perm.No (- $Perm.Write $k@323@01))
    (MemoryBlock$bytes%precondition ($Snap.first $t@319@01) _10$address@8@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
; Joined path conditions
(assert (or
  (not
    (and
      (=
        (MemoryBlock$bytes $t@318@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _10$address@8@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
        (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@320@01)))
      (=
        (MemoryBlock$bytes ($Snap.first ($Snap.second $t@210@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _10$address@8@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
        (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@320@01)))))
  (and
    (=
      (MemoryBlock$bytes $t@318@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _10$address@8@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
      (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@320@01)))
    (=
      (MemoryBlock$bytes ($Snap.first ($Snap.second $t@210@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _10$address@8@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
      (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@320@01))))))
(pop) ; 14
; Nested auxiliary terms: globals (aux)
(assert ($Perm.isReadVar $k@321@01))
(assert ($Perm.isReadVar $k@322@01))
(assert ($Perm.isReadVar $k@323@01))
(assert (< $k@321@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@321@01)))
(assert (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@210@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _10$address@8@01) (as Size$I64$<Snap$Usize>  Snap$Usize)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((snapshot@320@01 Snap$Tuple$$I64$Bool$$I64$Bool$)) (!
  (and
    (=>
      (=
        (MemoryBlock$bytes ($Snap.first ($Snap.second $t@210@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _10$address@8@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
        (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@320@01)))
      (and
        (=
          (MemoryBlock$bytes ($Snap.first ($Snap.second $t@210@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _10$address@8@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
          (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@320@01)))
        (< $k@322@01 $Perm.Write)
        (<= $Perm.No (- $Perm.Write $k@322@01))
        (MemoryBlock$bytes%precondition $t@318@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _10$address@8@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))))
    (or
      (not
        (=
          (MemoryBlock$bytes ($Snap.first ($Snap.second $t@210@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _10$address@8@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
          (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@320@01))))
      (=
        (MemoryBlock$bytes ($Snap.first ($Snap.second $t@210@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _10$address@8@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
        (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@320@01))))
    (=>
      (and
        (=
          (MemoryBlock$bytes $t@318@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _10$address@8@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
          (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@320@01)))
        (=
          (MemoryBlock$bytes ($Snap.first ($Snap.second $t@210@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _10$address@8@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
          (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@320@01))))
      (and
        (=
          (MemoryBlock$bytes $t@318@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _10$address@8@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
          (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@320@01)))
        (=
          (MemoryBlock$bytes ($Snap.first ($Snap.second $t@210@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _10$address@8@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
          (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@320@01)))
        (< $k@323@01 $Perm.Write)
        (<= $Perm.No (- $Perm.Write $k@323@01))
        (MemoryBlock$bytes%precondition ($Snap.first $t@319@01) _10$address@8@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize))))
    (or
      (not
        (and
          (=
            (MemoryBlock$bytes $t@318@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _10$address@8@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
            (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@320@01)))
          (=
            (MemoryBlock$bytes ($Snap.first ($Snap.second $t@210@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _10$address@8@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
            (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@320@01)))))
      (and
        (=
          (MemoryBlock$bytes $t@318@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _10$address@8@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
          (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@320@01)))
        (=
          (MemoryBlock$bytes ($Snap.first ($Snap.second $t@210@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _10$address@8@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
          (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@320@01))))))
  :pattern ((to_bytes$Tuple$$I64$Bool$$I64$Bool$<Bytes> snapshot@320@01))
  :qid |prog.l1825-aux|)))
(assert (forall ((snapshot@320@01 Snap$Tuple$$I64$Bool$$I64$Bool$)) (!
  (=>
    (and
      (=
        (MemoryBlock$bytes $t@318@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _10$address@8@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
        (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@320@01)))
      (=
        (MemoryBlock$bytes ($Snap.first ($Snap.second $t@210@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _10$address@8@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
        (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@320@01))))
    (=
      (MemoryBlock$bytes ($Snap.first $t@319@01) _10$address@8@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize))
      (to_bytes$Tuple$$I64$Bool$$I64$Bool$<Bytes> snapshot@320@01)))
  :pattern ((to_bytes$Tuple$$I64$Bool$$I64$Bool$<Bytes> snapshot@320@01))
  :qid |prog.l1825|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; exhale acc(MemoryBlock(_10$address, Size$Tuple$$I64$Bool$$I64$Bool$$()), write)
; [eval] Size$Tuple$$I64$Bool$$I64$Bool$$()
; [eval] label_bb7$marker && (label_bb5$marker && (label_5_custom$marker && (label_bb9$marker && (label_bb10$marker && (label_8_custom$marker && (label_bb11$marker && (label_bb12$marker && label_bb13$marker)))))))
(set-option :timeout 0)
(push) ; 14
; [then-branch: 20 | True | live]
; [else-branch: 20 | False | live]
(push) ; 15
; [then-branch: 20 | True]
(push) ; 16
; [then-branch: 21 | True | live]
; [else-branch: 21 | False | live]
(push) ; 17
; [then-branch: 21 | True]
(push) ; 18
; [then-branch: 22 | True | live]
; [else-branch: 22 | False | live]
(push) ; 19
; [then-branch: 22 | True]
(push) ; 20
; [then-branch: 23 | True | live]
; [else-branch: 23 | False | live]
(push) ; 21
; [then-branch: 23 | True]
(push) ; 22
; [then-branch: 24 | True | live]
; [else-branch: 24 | False | live]
(push) ; 23
; [then-branch: 24 | True]
(push) ; 24
; [then-branch: 25 | True | live]
; [else-branch: 25 | False | live]
(push) ; 25
; [then-branch: 25 | True]
(push) ; 26
; [then-branch: 26 | True | live]
; [else-branch: 26 | False | live]
(push) ; 27
; [then-branch: 26 | True]
(push) ; 28
; [then-branch: 27 | True | live]
; [else-branch: 27 | False | live]
(push) ; 29
; [then-branch: 27 | True]
(pop) ; 29
(push) ; 29
; [else-branch: 27 | False]
(assert false)
(pop) ; 29
(pop) ; 28
; Joined path conditions
; Joined path conditions
(pop) ; 27
(push) ; 27
; [else-branch: 26 | False]
(assert false)
(pop) ; 27
(pop) ; 26
; Joined path conditions
; Joined path conditions
(pop) ; 25
(push) ; 25
; [else-branch: 25 | False]
(assert false)
(pop) ; 25
(pop) ; 24
; Joined path conditions
; Joined path conditions
(pop) ; 23
(push) ; 23
; [else-branch: 24 | False]
(assert false)
(pop) ; 23
(pop) ; 22
; Joined path conditions
; Joined path conditions
(pop) ; 21
(push) ; 21
; [else-branch: 23 | False]
(assert false)
(pop) ; 21
(pop) ; 20
; Joined path conditions
; Joined path conditions
(pop) ; 19
(push) ; 19
; [else-branch: 22 | False]
(assert false)
(pop) ; 19
(pop) ; 18
; Joined path conditions
; Joined path conditions
(pop) ; 17
(push) ; 17
; [else-branch: 21 | False]
(assert false)
(pop) ; 17
(pop) ; 16
; Joined path conditions
; Joined path conditions
(pop) ; 15
(push) ; 15
; [else-branch: 20 | False]
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
; [then-branch: 28 | True | live]
; [else-branch: 28 | False | dead]
(set-option :timeout 0)
(push) ; 14
; [then-branch: 28 | True]
; [exec]
; into_memory_block$Bool(field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(_15$place()),
;   _15$address, destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(_15$snapshot$4))
; [eval] field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(_15$place())
; [eval] _15$place()
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(_15$snapshot$4)
(push) ; 15
(set-option :timeout 10)
(assert (not (=
  (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> result_value@230@01)
  (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> _15$snapshot$4@45@01))))
(check-sat)
; unsat
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
; [eval] compute_address(place, root_address)
; [eval] Size$Bool$()
(declare-const $t@324@01 $Snap)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01)
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _15$place<Place>  Place)) _15$address@40@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
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
    (compute_address<Address> (as _21$place<Place>  Place) _21$address@71@01)
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _15$place<Place>  Place)) _15$address@40@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
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
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _20$place<Place>  Place)) _20$address@65@01)
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _15$place<Place>  Place)) _15$address@40@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
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
    (compute_address<Address> (as _20$place<Place>  Place) _20$address@65@01)
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _15$place<Place>  Place)) _15$address@40@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
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
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _15$place<Place>  Place)) _15$address@40@01)
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _15$place<Place>  Place)) _15$address@40@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
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
    (compute_address<Address> (as _15$place<Place>  Place) _15$address@40@01)
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _15$place<Place>  Place)) _15$address@40@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] label_bb7$marker && (label_bb5$marker && (label_5_custom$marker && (label_bb9$marker && (label_bb10$marker && (label_8_custom$marker && (label_bb11$marker && (label_bb12$marker && label_bb13$marker)))))))
(set-option :timeout 0)
(push) ; 15
; [then-branch: 29 | True | live]
; [else-branch: 29 | False | live]
(push) ; 16
; [then-branch: 29 | True]
(push) ; 17
; [then-branch: 30 | True | live]
; [else-branch: 30 | False | live]
(push) ; 18
; [then-branch: 30 | True]
(push) ; 19
; [then-branch: 31 | True | live]
; [else-branch: 31 | False | live]
(push) ; 20
; [then-branch: 31 | True]
(push) ; 21
; [then-branch: 32 | True | live]
; [else-branch: 32 | False | live]
(push) ; 22
; [then-branch: 32 | True]
(push) ; 23
; [then-branch: 33 | True | live]
; [else-branch: 33 | False | live]
(push) ; 24
; [then-branch: 33 | True]
(push) ; 25
; [then-branch: 34 | True | live]
; [else-branch: 34 | False | live]
(push) ; 26
; [then-branch: 34 | True]
(push) ; 27
; [then-branch: 35 | True | live]
; [else-branch: 35 | False | live]
(push) ; 28
; [then-branch: 35 | True]
(push) ; 29
; [then-branch: 36 | True | live]
; [else-branch: 36 | False | live]
(push) ; 30
; [then-branch: 36 | True]
(pop) ; 30
(push) ; 30
; [else-branch: 36 | False]
(assert false)
(pop) ; 30
(pop) ; 29
; Joined path conditions
; Joined path conditions
(pop) ; 28
(push) ; 28
; [else-branch: 35 | False]
(assert false)
(pop) ; 28
(pop) ; 27
; Joined path conditions
; Joined path conditions
(pop) ; 26
(push) ; 26
; [else-branch: 34 | False]
(assert false)
(pop) ; 26
(pop) ; 25
; Joined path conditions
; Joined path conditions
(pop) ; 24
(push) ; 24
; [else-branch: 33 | False]
(assert false)
(pop) ; 24
(pop) ; 23
; Joined path conditions
; Joined path conditions
(pop) ; 22
(push) ; 22
; [else-branch: 32 | False]
(assert false)
(pop) ; 22
(pop) ; 21
; Joined path conditions
; Joined path conditions
(pop) ; 20
(push) ; 20
; [else-branch: 31 | False]
(assert false)
(pop) ; 20
(pop) ; 19
; Joined path conditions
; Joined path conditions
(pop) ; 18
(push) ; 18
; [else-branch: 30 | False]
(assert false)
(pop) ; 18
(pop) ; 17
; Joined path conditions
; Joined path conditions
(pop) ; 16
(push) ; 16
; [else-branch: 29 | False]
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
; [then-branch: 37 | True | live]
; [else-branch: 37 | False | dead]
(set-option :timeout 0)
(push) ; 15
; [then-branch: 37 | True]
; [exec]
; memory_block_join$Tuple$$I64$Bool$$I64$Bool$(_15$address, write)
; [eval] none < permission_amount
; [eval] PaddingSize$Tuple$$I64$Bool$$I64$Bool$$()
(push) ; 16
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _15$place<Place>  Place)) _15$address@40@01)
    _15$address@40@01)
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
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
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01)
    _15$address@40@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _21$place<Place>  Place) _21$address@71@01)
  _15$address@40@01)))
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
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _20$place<Place>  Place)) _20$address@65@01)
    _15$address@40@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _20$place<Place>  Place) _20$address@65@01)
  _15$address@40@01)))
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
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _15$place<Place>  Place)) _15$address@40@01)
    _15$address@40@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _15$place<Place>  Place) _15$address@40@01)
  _15$address@40@01)))
(check-sat)
; unsat
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
; [eval] field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _15$place<Place>  Place)) _15$address@40@01)
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _15$address@40@01))
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
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01)
  (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _15$address@40@01))))
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
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _15$address@40@01))
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
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _20$place<Place>  Place)) _20$address@65@01)
  (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _15$address@40@01))))
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
    (compute_address<Address> (as _20$place<Place>  Place) _20$address@65@01)
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _15$address@40@01))
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
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _15$place<Place>  Place)) _15$address@40@01)
  (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _15$address@40@01))))
(check-sat)
; unsat
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
; [eval] field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address)
; [eval] Size$Bool$()
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _15$place<Place>  Place)) _15$address@40@01)
  (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _15$address@40@01))))
(check-sat)
; unsat
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(declare-const $t@325@01 $Snap)
(assert (= $t@325@01 ($Snap.combine ($Snap.first $t@325@01) ($Snap.second $t@325@01))))
; [eval] Size$Tuple$$I64$Bool$$I64$Bool$$()
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _20$place<Place>  Place) _20$address@65@01)
    _15$address@40@01)
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
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
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _20$place<Place>  Place)) _20$address@65@01)
    _15$address@40@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
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
    _15$address@40@01)
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
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
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01)
    _15$address@40@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(assert (= ($Snap.second $t@325@01) $Snap.unit))
; [eval] (forall snapshot: Snap$Tuple$$I64$Bool$$I64$Bool$ :: { to_bytes$Tuple$$I64$Bool$$I64$Bool$(snapshot) } old(MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address), Size$I64$()) == to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot))) && old(MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address), Size$Bool$()) == to_bytes$Bool(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot))) ==> MemoryBlock$bytes(address, Size$Tuple$$I64$Bool$$I64$Bool$$()) == to_bytes$Tuple$$I64$Bool$$I64$Bool$(snapshot))
(declare-const snapshot@326@01 Snap$Tuple$$I64$Bool$$I64$Bool$)
(set-option :timeout 0)
(push) ; 16
; [eval] old(MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address), Size$I64$()) == to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot))) && old(MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address), Size$Bool$()) == to_bytes$Bool(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot))) ==> MemoryBlock$bytes(address, Size$Tuple$$I64$Bool$$I64$Bool$$()) == to_bytes$Tuple$$I64$Bool$$I64$Bool$(snapshot)
; [eval] old(MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address), Size$I64$()) == to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot))) && old(MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address), Size$Bool$()) == to_bytes$Bool(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot)))
; [eval] old(MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address), Size$I64$()) == to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot)))
; [eval] MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address), Size$I64$()) == to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot))
; [eval] MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address), Size$I64$())
; [eval] field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address)
; [eval] Size$I64$()
(push) ; 17
(declare-const $k@327@01 $Perm)
(assert ($Perm.isReadVar $k@327@01))
(push) ; 18
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _15$place<Place>  Place)) _15$address@40@01)
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _15$address@40@01))
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01)
  (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _15$address@40@01))))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _21$place<Place>  Place) _21$address@71@01)
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _15$address@40@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _20$place<Place>  Place)) _20$address@65@01)
  (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _15$address@40@01))))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _20$place<Place>  Place) _20$address@65@01)
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _15$address@40@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _15$place<Place>  Place)) _15$address@40@01)
  (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _15$address@40@01))))
(check-sat)
; unsat
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(assert (< $k@327@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@327@01)))
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (< $Perm.No $k@327@01)))
(check-sat)
; unsat
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@236@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _15$address@40@01) (as Size$I64$<Snap$Usize>  Snap$Usize)))
(pop) ; 17
; Joined path conditions
(assert ($Perm.isReadVar $k@327@01))
(assert (and
  (< $k@327@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@327@01))
  (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@236@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _15$address@40@01) (as Size$I64$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot)
(set-option :timeout 0)
(push) ; 17
; [then-branch: 38 | MemoryBlock$bytes(First:(Second:($t@236@01)), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](_15$address@40@01), Size$I64$[Snap$Usize]) == to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@326@01)) | live]
; [else-branch: 38 | MemoryBlock$bytes(First:(Second:($t@236@01)), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](_15$address@40@01), Size$I64$[Snap$Usize]) != to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@326@01)) | live]
(push) ; 18
; [then-branch: 38 | MemoryBlock$bytes(First:(Second:($t@236@01)), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](_15$address@40@01), Size$I64$[Snap$Usize]) == to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@326@01))]
(assert (=
  (MemoryBlock$bytes ($Snap.first ($Snap.second $t@236@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _15$address@40@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
  (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@326@01))))
; [eval] old(MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address), Size$Bool$()) == to_bytes$Bool(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot)))
; [eval] MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address), Size$Bool$()) == to_bytes$Bool(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot))
; [eval] MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address), Size$Bool$())
; [eval] field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address)
; [eval] Size$Bool$()
(push) ; 19
(declare-const $k@328@01 $Perm)
(assert ($Perm.isReadVar $k@328@01))
(push) ; 20
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _15$place<Place>  Place)) _15$address@40@01)
  (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _15$address@40@01))))
(check-sat)
; unsat
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(assert (< $k@328@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@328@01)))
(set-option :timeout 0)
(push) ; 20
(set-option :timeout 10)
(assert (not (< $Perm.No $k@328@01)))
(check-sat)
; unsat
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition $t@324@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _15$address@40@01) (as Size$Bool$<Snap$Usize>  Snap$Usize)))
(pop) ; 19
; Joined path conditions
(assert ($Perm.isReadVar $k@328@01))
(assert (and
  (< $k@328@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@328@01))
  (MemoryBlock$bytes%precondition $t@324@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _15$address@40@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$Bool(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot)
(pop) ; 18
(set-option :timeout 0)
(push) ; 18
; [else-branch: 38 | MemoryBlock$bytes(First:(Second:($t@236@01)), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](_15$address@40@01), Size$I64$[Snap$Usize]) != to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@326@01))]
(assert (not
  (=
    (MemoryBlock$bytes ($Snap.first ($Snap.second $t@236@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _15$address@40@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
    (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@326@01)))))
(pop) ; 18
(pop) ; 17
; Joined path conditions
(assert ($Perm.isReadVar $k@328@01))
(assert (=>
  (=
    (MemoryBlock$bytes ($Snap.first ($Snap.second $t@236@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _15$address@40@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
    (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@326@01)))
  (and
    (=
      (MemoryBlock$bytes ($Snap.first ($Snap.second $t@236@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _15$address@40@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
      (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@326@01)))
    (< $k@328@01 $Perm.Write)
    (<= $Perm.No (- $Perm.Write $k@328@01))
    (MemoryBlock$bytes%precondition $t@324@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _15$address@40@01) (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
; Joined path conditions
(assert (or
  (not
    (=
      (MemoryBlock$bytes ($Snap.first ($Snap.second $t@236@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _15$address@40@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
      (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@326@01))))
  (=
    (MemoryBlock$bytes ($Snap.first ($Snap.second $t@236@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _15$address@40@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
    (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@326@01)))))
(push) ; 17
; [then-branch: 39 | MemoryBlock$bytes($t@324@01, field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Address](_15$address@40@01), Size$Bool$[Snap$Usize]) == to_bytes$Bool[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](snapshot@326@01)) && MemoryBlock$bytes(First:(Second:($t@236@01)), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](_15$address@40@01), Size$I64$[Snap$Usize]) == to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@326@01)) | live]
; [else-branch: 39 | !(MemoryBlock$bytes($t@324@01, field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Address](_15$address@40@01), Size$Bool$[Snap$Usize]) == to_bytes$Bool[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](snapshot@326@01)) && MemoryBlock$bytes(First:(Second:($t@236@01)), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](_15$address@40@01), Size$I64$[Snap$Usize]) == to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@326@01))) | live]
(push) ; 18
; [then-branch: 39 | MemoryBlock$bytes($t@324@01, field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Address](_15$address@40@01), Size$Bool$[Snap$Usize]) == to_bytes$Bool[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](snapshot@326@01)) && MemoryBlock$bytes(First:(Second:($t@236@01)), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](_15$address@40@01), Size$I64$[Snap$Usize]) == to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@326@01))]
(assert (and
  (=
    (MemoryBlock$bytes $t@324@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _15$address@40@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
    (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@326@01)))
  (=
    (MemoryBlock$bytes ($Snap.first ($Snap.second $t@236@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _15$address@40@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
    (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@326@01)))))
; [eval] MemoryBlock$bytes(address, Size$Tuple$$I64$Bool$$I64$Bool$$()) == to_bytes$Tuple$$I64$Bool$$I64$Bool$(snapshot)
; [eval] MemoryBlock$bytes(address, Size$Tuple$$I64$Bool$$I64$Bool$$())
; [eval] Size$Tuple$$I64$Bool$$I64$Bool$$()
(push) ; 19
(declare-const $k@329@01 $Perm)
(assert ($Perm.isReadVar $k@329@01))
(assert (< $k@329@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@329@01)))
(push) ; 20
(set-option :timeout 10)
(assert (not (< $Perm.No $k@329@01)))
(check-sat)
; unsat
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first $t@325@01) _15$address@40@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))
(pop) ; 19
; Joined path conditions
(assert ($Perm.isReadVar $k@329@01))
(assert (and
  (< $k@329@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@329@01))
  (MemoryBlock$bytes%precondition ($Snap.first $t@325@01) _15$address@40@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$Tuple$$I64$Bool$$I64$Bool$(snapshot)
(pop) ; 18
(set-option :timeout 0)
(push) ; 18
; [else-branch: 39 | !(MemoryBlock$bytes($t@324@01, field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Address](_15$address@40@01), Size$Bool$[Snap$Usize]) == to_bytes$Bool[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](snapshot@326@01)) && MemoryBlock$bytes(First:(Second:($t@236@01)), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](_15$address@40@01), Size$I64$[Snap$Usize]) == to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@326@01)))]
(assert (not
  (and
    (=
      (MemoryBlock$bytes $t@324@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _15$address@40@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
      (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@326@01)))
    (=
      (MemoryBlock$bytes ($Snap.first ($Snap.second $t@236@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _15$address@40@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
      (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@326@01))))))
(pop) ; 18
(pop) ; 17
; Joined path conditions
(assert ($Perm.isReadVar $k@329@01))
(assert (=>
  (and
    (=
      (MemoryBlock$bytes $t@324@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _15$address@40@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
      (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@326@01)))
    (=
      (MemoryBlock$bytes ($Snap.first ($Snap.second $t@236@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _15$address@40@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
      (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@326@01))))
  (and
    (=
      (MemoryBlock$bytes $t@324@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _15$address@40@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
      (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@326@01)))
    (=
      (MemoryBlock$bytes ($Snap.first ($Snap.second $t@236@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _15$address@40@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
      (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@326@01)))
    (< $k@329@01 $Perm.Write)
    (<= $Perm.No (- $Perm.Write $k@329@01))
    (MemoryBlock$bytes%precondition ($Snap.first $t@325@01) _15$address@40@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
; Joined path conditions
(assert (or
  (not
    (and
      (=
        (MemoryBlock$bytes $t@324@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _15$address@40@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
        (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@326@01)))
      (=
        (MemoryBlock$bytes ($Snap.first ($Snap.second $t@236@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _15$address@40@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
        (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@326@01)))))
  (and
    (=
      (MemoryBlock$bytes $t@324@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _15$address@40@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
      (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@326@01)))
    (=
      (MemoryBlock$bytes ($Snap.first ($Snap.second $t@236@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _15$address@40@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
      (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@326@01))))))
(pop) ; 16
; Nested auxiliary terms: globals (aux)
(assert ($Perm.isReadVar $k@327@01))
(assert ($Perm.isReadVar $k@328@01))
(assert ($Perm.isReadVar $k@329@01))
(assert (< $k@327@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@327@01)))
(assert (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@236@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _15$address@40@01) (as Size$I64$<Snap$Usize>  Snap$Usize)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((snapshot@326@01 Snap$Tuple$$I64$Bool$$I64$Bool$)) (!
  (and
    (=>
      (=
        (MemoryBlock$bytes ($Snap.first ($Snap.second $t@236@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _15$address@40@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
        (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@326@01)))
      (and
        (=
          (MemoryBlock$bytes ($Snap.first ($Snap.second $t@236@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _15$address@40@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
          (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@326@01)))
        (< $k@328@01 $Perm.Write)
        (<= $Perm.No (- $Perm.Write $k@328@01))
        (MemoryBlock$bytes%precondition $t@324@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _15$address@40@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))))
    (or
      (not
        (=
          (MemoryBlock$bytes ($Snap.first ($Snap.second $t@236@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _15$address@40@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
          (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@326@01))))
      (=
        (MemoryBlock$bytes ($Snap.first ($Snap.second $t@236@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _15$address@40@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
        (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@326@01))))
    (=>
      (and
        (=
          (MemoryBlock$bytes $t@324@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _15$address@40@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
          (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@326@01)))
        (=
          (MemoryBlock$bytes ($Snap.first ($Snap.second $t@236@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _15$address@40@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
          (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@326@01))))
      (and
        (=
          (MemoryBlock$bytes $t@324@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _15$address@40@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
          (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@326@01)))
        (=
          (MemoryBlock$bytes ($Snap.first ($Snap.second $t@236@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _15$address@40@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
          (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@326@01)))
        (< $k@329@01 $Perm.Write)
        (<= $Perm.No (- $Perm.Write $k@329@01))
        (MemoryBlock$bytes%precondition ($Snap.first $t@325@01) _15$address@40@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize))))
    (or
      (not
        (and
          (=
            (MemoryBlock$bytes $t@324@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _15$address@40@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
            (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@326@01)))
          (=
            (MemoryBlock$bytes ($Snap.first ($Snap.second $t@236@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _15$address@40@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
            (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@326@01)))))
      (and
        (=
          (MemoryBlock$bytes $t@324@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _15$address@40@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
          (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@326@01)))
        (=
          (MemoryBlock$bytes ($Snap.first ($Snap.second $t@236@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _15$address@40@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
          (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@326@01))))))
  :pattern ((to_bytes$Tuple$$I64$Bool$$I64$Bool$<Bytes> snapshot@326@01))
  :qid |prog.l1825-aux|)))
(assert (forall ((snapshot@326@01 Snap$Tuple$$I64$Bool$$I64$Bool$)) (!
  (=>
    (and
      (=
        (MemoryBlock$bytes $t@324@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _15$address@40@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
        (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@326@01)))
      (=
        (MemoryBlock$bytes ($Snap.first ($Snap.second $t@236@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _15$address@40@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
        (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@326@01))))
    (=
      (MemoryBlock$bytes ($Snap.first $t@325@01) _15$address@40@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize))
      (to_bytes$Tuple$$I64$Bool$$I64$Bool$<Bytes> snapshot@326@01)))
  :pattern ((to_bytes$Tuple$$I64$Bool$$I64$Bool$<Bytes> snapshot@326@01))
  :qid |prog.l1825|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; exhale acc(MemoryBlock(_15$address, Size$Tuple$$I64$Bool$$I64$Bool$$()), write)
; [eval] Size$Tuple$$I64$Bool$$I64$Bool$$()
; [eval] label_bb12$marker && label_bb13$marker
(set-option :timeout 0)
(push) ; 16
; [then-branch: 40 | True | live]
; [else-branch: 40 | False | live]
(push) ; 17
; [then-branch: 40 | True]
(pop) ; 17
(push) ; 17
; [else-branch: 40 | False]
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
; [then-branch: 41 | True | live]
; [else-branch: 41 | False | dead]
(set-option :timeout 0)
(push) ; 16
; [then-branch: 41 | True]
; [exec]
; into_memory_block$Bool(field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(_20$place()),
;   _20$address, destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(_20$snapshot$3))
; [eval] field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(_20$place())
; [eval] _20$place()
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(_20$snapshot$3)
(push) ; 17
(set-option :timeout 10)
(assert (not (=
  (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> result_value@268@01)
  (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> _20$snapshot$3@69@01))))
(check-sat)
; unsat
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
; [eval] compute_address(place, root_address)
; [eval] Size$Bool$()
(declare-const $t@330@01 $Snap)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01)
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _20$place<Place>  Place)) _20$address@65@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
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
    (compute_address<Address> (as _21$place<Place>  Place) _21$address@71@01)
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _20$place<Place>  Place)) _20$address@65@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
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
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _20$place<Place>  Place)) _20$address@65@01)
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _20$place<Place>  Place)) _20$address@65@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
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
    (compute_address<Address> (as _20$place<Place>  Place) _20$address@65@01)
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _20$place<Place>  Place)) _20$address@65@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] label_bb12$marker && label_bb13$marker
(set-option :timeout 0)
(push) ; 17
; [then-branch: 42 | True | live]
; [else-branch: 42 | False | live]
(push) ; 18
; [then-branch: 42 | True]
(pop) ; 18
(push) ; 18
; [else-branch: 42 | False]
(assert false)
(pop) ; 18
(pop) ; 17
; Joined path conditions
; Joined path conditions
(push) ; 17
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
; [then-branch: 43 | True | live]
; [else-branch: 43 | False | dead]
(set-option :timeout 0)
(push) ; 17
; [then-branch: 43 | True]
; [exec]
; memory_block_join$Tuple$$I64$Bool$$I64$Bool$(_20$address, write)
; [eval] none < permission_amount
; [eval] PaddingSize$Tuple$$I64$Bool$$I64$Bool$$()
(push) ; 18
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _20$place<Place>  Place)) _20$address@65@01)
    _20$address@65@01)
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01)
    _20$address@65@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _21$place<Place>  Place) _21$address@71@01)
  _20$address@65@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _20$place<Place>  Place)) _20$address@65@01)
    _20$address@65@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _20$place<Place>  Place) _20$address@65@01)
  _20$address@65@01)))
(check-sat)
; unsat
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
; [eval] field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _20$place<Place>  Place)) _20$address@65@01)
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _20$address@65@01))
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01)
  (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _20$address@65@01))))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _21$place<Place>  Place) _21$address@71@01)
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _20$address@65@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _20$place<Place>  Place)) _20$address@65@01)
  (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _20$address@65@01))))
(check-sat)
; unsat
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
; [eval] field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address)
; [eval] Size$Bool$()
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _20$place<Place>  Place)) _20$address@65@01)
  (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _20$address@65@01))))
(check-sat)
; unsat
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(declare-const $t@331@01 $Snap)
(assert (= $t@331@01 ($Snap.combine ($Snap.first $t@331@01) ($Snap.second $t@331@01))))
; [eval] Size$Tuple$$I64$Bool$$I64$Bool$$()
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _21$place<Place>  Place) _21$address@71@01)
    _20$address@65@01)
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01)
    _20$address@65@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(assert (= ($Snap.second $t@331@01) $Snap.unit))
; [eval] (forall snapshot: Snap$Tuple$$I64$Bool$$I64$Bool$ :: { to_bytes$Tuple$$I64$Bool$$I64$Bool$(snapshot) } old(MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address), Size$I64$()) == to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot))) && old(MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address), Size$Bool$()) == to_bytes$Bool(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot))) ==> MemoryBlock$bytes(address, Size$Tuple$$I64$Bool$$I64$Bool$$()) == to_bytes$Tuple$$I64$Bool$$I64$Bool$(snapshot))
(declare-const snapshot@332@01 Snap$Tuple$$I64$Bool$$I64$Bool$)
(set-option :timeout 0)
(push) ; 18
; [eval] old(MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address), Size$I64$()) == to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot))) && old(MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address), Size$Bool$()) == to_bytes$Bool(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot))) ==> MemoryBlock$bytes(address, Size$Tuple$$I64$Bool$$I64$Bool$$()) == to_bytes$Tuple$$I64$Bool$$I64$Bool$(snapshot)
; [eval] old(MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address), Size$I64$()) == to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot))) && old(MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address), Size$Bool$()) == to_bytes$Bool(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot)))
; [eval] old(MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address), Size$I64$()) == to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot)))
; [eval] MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address), Size$I64$()) == to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot))
; [eval] MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address), Size$I64$())
; [eval] field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address)
; [eval] Size$I64$()
(push) ; 19
(declare-const $k@333@01 $Perm)
(assert ($Perm.isReadVar $k@333@01))
(push) ; 20
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _20$place<Place>  Place)) _20$address@65@01)
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _20$address@65@01))
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 20
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01)
  (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _20$address@65@01))))
(check-sat)
; unknown
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 20
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _21$place<Place>  Place) _21$address@71@01)
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _20$address@65@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 20
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _20$place<Place>  Place)) _20$address@65@01)
  (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _20$address@65@01))))
(check-sat)
; unsat
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(assert (< $k@333@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@333@01)))
(set-option :timeout 0)
(push) ; 20
(set-option :timeout 10)
(assert (not (< $Perm.No $k@333@01)))
(check-sat)
; unsat
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@274@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _20$address@65@01) (as Size$I64$<Snap$Usize>  Snap$Usize)))
(pop) ; 19
; Joined path conditions
(assert ($Perm.isReadVar $k@333@01))
(assert (and
  (< $k@333@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@333@01))
  (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@274@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _20$address@65@01) (as Size$I64$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot)
(set-option :timeout 0)
(push) ; 19
; [then-branch: 44 | MemoryBlock$bytes(First:(Second:($t@274@01)), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](_20$address@65@01), Size$I64$[Snap$Usize]) == to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@332@01)) | live]
; [else-branch: 44 | MemoryBlock$bytes(First:(Second:($t@274@01)), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](_20$address@65@01), Size$I64$[Snap$Usize]) != to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@332@01)) | live]
(push) ; 20
; [then-branch: 44 | MemoryBlock$bytes(First:(Second:($t@274@01)), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](_20$address@65@01), Size$I64$[Snap$Usize]) == to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@332@01))]
(assert (=
  (MemoryBlock$bytes ($Snap.first ($Snap.second $t@274@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _20$address@65@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
  (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@332@01))))
; [eval] old(MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address), Size$Bool$()) == to_bytes$Bool(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot)))
; [eval] MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address), Size$Bool$()) == to_bytes$Bool(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot))
; [eval] MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address), Size$Bool$())
; [eval] field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address)
; [eval] Size$Bool$()
(push) ; 21
(declare-const $k@334@01 $Perm)
(assert ($Perm.isReadVar $k@334@01))
(push) ; 22
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _20$place<Place>  Place)) _20$address@65@01)
  (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _20$address@65@01))))
(check-sat)
; unsat
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(assert (< $k@334@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@334@01)))
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (< $Perm.No $k@334@01)))
(check-sat)
; unsat
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition $t@330@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _20$address@65@01) (as Size$Bool$<Snap$Usize>  Snap$Usize)))
(pop) ; 21
; Joined path conditions
(assert ($Perm.isReadVar $k@334@01))
(assert (and
  (< $k@334@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@334@01))
  (MemoryBlock$bytes%precondition $t@330@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _20$address@65@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$Bool(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot)
(pop) ; 20
(set-option :timeout 0)
(push) ; 20
; [else-branch: 44 | MemoryBlock$bytes(First:(Second:($t@274@01)), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](_20$address@65@01), Size$I64$[Snap$Usize]) != to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@332@01))]
(assert (not
  (=
    (MemoryBlock$bytes ($Snap.first ($Snap.second $t@274@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _20$address@65@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
    (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@332@01)))))
(pop) ; 20
(pop) ; 19
; Joined path conditions
(assert ($Perm.isReadVar $k@334@01))
(assert (=>
  (=
    (MemoryBlock$bytes ($Snap.first ($Snap.second $t@274@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _20$address@65@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
    (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@332@01)))
  (and
    (=
      (MemoryBlock$bytes ($Snap.first ($Snap.second $t@274@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _20$address@65@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
      (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@332@01)))
    (< $k@334@01 $Perm.Write)
    (<= $Perm.No (- $Perm.Write $k@334@01))
    (MemoryBlock$bytes%precondition $t@330@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _20$address@65@01) (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
; Joined path conditions
(assert (or
  (not
    (=
      (MemoryBlock$bytes ($Snap.first ($Snap.second $t@274@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _20$address@65@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
      (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@332@01))))
  (=
    (MemoryBlock$bytes ($Snap.first ($Snap.second $t@274@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _20$address@65@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
    (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@332@01)))))
(push) ; 19
; [then-branch: 45 | MemoryBlock$bytes($t@330@01, field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Address](_20$address@65@01), Size$Bool$[Snap$Usize]) == to_bytes$Bool[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](snapshot@332@01)) && MemoryBlock$bytes(First:(Second:($t@274@01)), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](_20$address@65@01), Size$I64$[Snap$Usize]) == to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@332@01)) | live]
; [else-branch: 45 | !(MemoryBlock$bytes($t@330@01, field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Address](_20$address@65@01), Size$Bool$[Snap$Usize]) == to_bytes$Bool[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](snapshot@332@01)) && MemoryBlock$bytes(First:(Second:($t@274@01)), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](_20$address@65@01), Size$I64$[Snap$Usize]) == to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@332@01))) | live]
(push) ; 20
; [then-branch: 45 | MemoryBlock$bytes($t@330@01, field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Address](_20$address@65@01), Size$Bool$[Snap$Usize]) == to_bytes$Bool[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](snapshot@332@01)) && MemoryBlock$bytes(First:(Second:($t@274@01)), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](_20$address@65@01), Size$I64$[Snap$Usize]) == to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@332@01))]
(assert (and
  (=
    (MemoryBlock$bytes $t@330@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _20$address@65@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
    (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@332@01)))
  (=
    (MemoryBlock$bytes ($Snap.first ($Snap.second $t@274@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _20$address@65@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
    (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@332@01)))))
; [eval] MemoryBlock$bytes(address, Size$Tuple$$I64$Bool$$I64$Bool$$()) == to_bytes$Tuple$$I64$Bool$$I64$Bool$(snapshot)
; [eval] MemoryBlock$bytes(address, Size$Tuple$$I64$Bool$$I64$Bool$$())
; [eval] Size$Tuple$$I64$Bool$$I64$Bool$$()
(push) ; 21
(declare-const $k@335@01 $Perm)
(assert ($Perm.isReadVar $k@335@01))
(assert (< $k@335@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@335@01)))
(push) ; 22
(set-option :timeout 10)
(assert (not (< $Perm.No $k@335@01)))
(check-sat)
; unsat
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first $t@331@01) _20$address@65@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))
(pop) ; 21
; Joined path conditions
(assert ($Perm.isReadVar $k@335@01))
(assert (and
  (< $k@335@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@335@01))
  (MemoryBlock$bytes%precondition ($Snap.first $t@331@01) _20$address@65@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$Tuple$$I64$Bool$$I64$Bool$(snapshot)
(pop) ; 20
(set-option :timeout 0)
(push) ; 20
; [else-branch: 45 | !(MemoryBlock$bytes($t@330@01, field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Address](_20$address@65@01), Size$Bool$[Snap$Usize]) == to_bytes$Bool[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](snapshot@332@01)) && MemoryBlock$bytes(First:(Second:($t@274@01)), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](_20$address@65@01), Size$I64$[Snap$Usize]) == to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@332@01)))]
(assert (not
  (and
    (=
      (MemoryBlock$bytes $t@330@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _20$address@65@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
      (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@332@01)))
    (=
      (MemoryBlock$bytes ($Snap.first ($Snap.second $t@274@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _20$address@65@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
      (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@332@01))))))
(pop) ; 20
(pop) ; 19
; Joined path conditions
(assert ($Perm.isReadVar $k@335@01))
(assert (=>
  (and
    (=
      (MemoryBlock$bytes $t@330@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _20$address@65@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
      (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@332@01)))
    (=
      (MemoryBlock$bytes ($Snap.first ($Snap.second $t@274@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _20$address@65@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
      (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@332@01))))
  (and
    (=
      (MemoryBlock$bytes $t@330@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _20$address@65@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
      (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@332@01)))
    (=
      (MemoryBlock$bytes ($Snap.first ($Snap.second $t@274@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _20$address@65@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
      (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@332@01)))
    (< $k@335@01 $Perm.Write)
    (<= $Perm.No (- $Perm.Write $k@335@01))
    (MemoryBlock$bytes%precondition ($Snap.first $t@331@01) _20$address@65@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
; Joined path conditions
(assert (or
  (not
    (and
      (=
        (MemoryBlock$bytes $t@330@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _20$address@65@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
        (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@332@01)))
      (=
        (MemoryBlock$bytes ($Snap.first ($Snap.second $t@274@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _20$address@65@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
        (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@332@01)))))
  (and
    (=
      (MemoryBlock$bytes $t@330@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _20$address@65@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
      (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@332@01)))
    (=
      (MemoryBlock$bytes ($Snap.first ($Snap.second $t@274@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _20$address@65@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
      (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@332@01))))))
(pop) ; 18
; Nested auxiliary terms: globals (aux)
(assert ($Perm.isReadVar $k@333@01))
(assert ($Perm.isReadVar $k@334@01))
(assert ($Perm.isReadVar $k@335@01))
(assert (< $k@333@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@333@01)))
(assert (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@274@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _20$address@65@01) (as Size$I64$<Snap$Usize>  Snap$Usize)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((snapshot@332@01 Snap$Tuple$$I64$Bool$$I64$Bool$)) (!
  (and
    (=>
      (=
        (MemoryBlock$bytes ($Snap.first ($Snap.second $t@274@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _20$address@65@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
        (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@332@01)))
      (and
        (=
          (MemoryBlock$bytes ($Snap.first ($Snap.second $t@274@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _20$address@65@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
          (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@332@01)))
        (< $k@334@01 $Perm.Write)
        (<= $Perm.No (- $Perm.Write $k@334@01))
        (MemoryBlock$bytes%precondition $t@330@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _20$address@65@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))))
    (or
      (not
        (=
          (MemoryBlock$bytes ($Snap.first ($Snap.second $t@274@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _20$address@65@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
          (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@332@01))))
      (=
        (MemoryBlock$bytes ($Snap.first ($Snap.second $t@274@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _20$address@65@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
        (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@332@01))))
    (=>
      (and
        (=
          (MemoryBlock$bytes $t@330@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _20$address@65@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
          (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@332@01)))
        (=
          (MemoryBlock$bytes ($Snap.first ($Snap.second $t@274@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _20$address@65@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
          (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@332@01))))
      (and
        (=
          (MemoryBlock$bytes $t@330@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _20$address@65@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
          (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@332@01)))
        (=
          (MemoryBlock$bytes ($Snap.first ($Snap.second $t@274@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _20$address@65@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
          (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@332@01)))
        (< $k@335@01 $Perm.Write)
        (<= $Perm.No (- $Perm.Write $k@335@01))
        (MemoryBlock$bytes%precondition ($Snap.first $t@331@01) _20$address@65@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize))))
    (or
      (not
        (and
          (=
            (MemoryBlock$bytes $t@330@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _20$address@65@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
            (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@332@01)))
          (=
            (MemoryBlock$bytes ($Snap.first ($Snap.second $t@274@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _20$address@65@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
            (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@332@01)))))
      (and
        (=
          (MemoryBlock$bytes $t@330@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _20$address@65@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
          (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@332@01)))
        (=
          (MemoryBlock$bytes ($Snap.first ($Snap.second $t@274@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _20$address@65@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
          (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@332@01))))))
  :pattern ((to_bytes$Tuple$$I64$Bool$$I64$Bool$<Bytes> snapshot@332@01))
  :qid |prog.l1825-aux|)))
(assert (forall ((snapshot@332@01 Snap$Tuple$$I64$Bool$$I64$Bool$)) (!
  (=>
    (and
      (=
        (MemoryBlock$bytes $t@330@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _20$address@65@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
        (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@332@01)))
      (=
        (MemoryBlock$bytes ($Snap.first ($Snap.second $t@274@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _20$address@65@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
        (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@332@01))))
    (=
      (MemoryBlock$bytes ($Snap.first $t@331@01) _20$address@65@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize))
      (to_bytes$Tuple$$I64$Bool$$I64$Bool$<Bytes> snapshot@332@01)))
  :pattern ((to_bytes$Tuple$$I64$Bool$$I64$Bool$<Bytes> snapshot@332@01))
  :qid |prog.l1825|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; exhale acc(MemoryBlock(_20$address, Size$Tuple$$I64$Bool$$I64$Bool$$()), write)
; [eval] Size$Tuple$$I64$Bool$$I64$Bool$$()
; [eval] label_bb12$marker && label_bb13$marker
(set-option :timeout 0)
(push) ; 18
; [then-branch: 46 | True | live]
; [else-branch: 46 | False | live]
(push) ; 19
; [then-branch: 46 | True]
(pop) ; 19
(push) ; 19
; [else-branch: 46 | False]
(assert false)
(pop) ; 19
(pop) ; 18
; Joined path conditions
; Joined path conditions
(push) ; 18
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
; [then-branch: 47 | True | live]
; [else-branch: 47 | False | dead]
(set-option :timeout 0)
(push) ; 18
; [then-branch: 47 | True]
; [exec]
; into_memory_block$Bool(field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(_21$place()),
;   _21$address, destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(_21$snapshot$3))
; [eval] field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(_21$place())
; [eval] _21$place()
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(_21$snapshot$3)
(push) ; 19
(set-option :timeout 10)
(assert (not (=
  (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> result_value@284@01)
  (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> _21$snapshot$3@75@01))))
(check-sat)
; unsat
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
; [eval] compute_address(place, root_address)
; [eval] Size$Bool$()
(declare-const $t@336@01 $Snap)
(set-option :timeout 0)
(push) ; 19
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
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
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
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] label_bb12$marker && label_bb13$marker
(set-option :timeout 0)
(push) ; 19
; [then-branch: 48 | True | live]
; [else-branch: 48 | False | live]
(push) ; 20
; [then-branch: 48 | True]
(pop) ; 20
(push) ; 20
; [else-branch: 48 | False]
(assert false)
(pop) ; 20
(pop) ; 19
; Joined path conditions
; Joined path conditions
(push) ; 19
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
; [then-branch: 49 | True | live]
; [else-branch: 49 | False | dead]
(set-option :timeout 0)
(push) ; 19
; [then-branch: 49 | True]
; [exec]
; memory_block_join$Tuple$$I64$Bool$$I64$Bool$(_21$address, write)
; [eval] none < permission_amount
; [eval] PaddingSize$Tuple$$I64$Bool$$I64$Bool$$()
(push) ; 20
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
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 20
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
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 20
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _21$place<Place>  Place) _21$address@71@01)
  _21$address@71@01)))
(check-sat)
; unsat
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
; [eval] field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 20
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
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 20
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01)
  (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _21$address@71@01))))
(check-sat)
; unsat
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
; [eval] field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address)
; [eval] Size$Bool$()
(set-option :timeout 0)
(push) ; 20
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _21$place<Place>  Place)) _21$address@71@01)
  (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _21$address@71@01))))
(check-sat)
; unsat
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(declare-const $t@337@01 $Snap)
(assert (= $t@337@01 ($Snap.combine ($Snap.first $t@337@01) ($Snap.second $t@337@01))))
; [eval] Size$Tuple$$I64$Bool$$I64$Bool$$()
(assert (= ($Snap.second $t@337@01) $Snap.unit))
; [eval] (forall snapshot: Snap$Tuple$$I64$Bool$$I64$Bool$ :: { to_bytes$Tuple$$I64$Bool$$I64$Bool$(snapshot) } old(MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address), Size$I64$()) == to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot))) && old(MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address), Size$Bool$()) == to_bytes$Bool(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot))) ==> MemoryBlock$bytes(address, Size$Tuple$$I64$Bool$$I64$Bool$$()) == to_bytes$Tuple$$I64$Bool$$I64$Bool$(snapshot))
(declare-const snapshot@338@01 Snap$Tuple$$I64$Bool$$I64$Bool$)
(set-option :timeout 0)
(push) ; 20
; [eval] old(MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address), Size$I64$()) == to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot))) && old(MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address), Size$Bool$()) == to_bytes$Bool(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot))) ==> MemoryBlock$bytes(address, Size$Tuple$$I64$Bool$$I64$Bool$$()) == to_bytes$Tuple$$I64$Bool$$I64$Bool$(snapshot)
; [eval] old(MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address), Size$I64$()) == to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot))) && old(MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address), Size$Bool$()) == to_bytes$Bool(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot)))
; [eval] old(MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address), Size$I64$()) == to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot)))
; [eval] MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address), Size$I64$()) == to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot))
; [eval] MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address), Size$I64$())
; [eval] field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address)
; [eval] Size$I64$()
(push) ; 21
(declare-const $k@339@01 $Perm)
(assert ($Perm.isReadVar $k@339@01))
(push) ; 22
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
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _21$place<Place>  Place)) _21$address@71@01)
  (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _21$address@71@01))))
(check-sat)
; unsat
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(assert (< $k@339@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@339@01)))
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (< $Perm.No $k@339@01)))
(check-sat)
; unsat
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@290@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _21$address@71@01) (as Size$I64$<Snap$Usize>  Snap$Usize)))
(pop) ; 21
; Joined path conditions
(assert ($Perm.isReadVar $k@339@01))
(assert (and
  (< $k@339@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@339@01))
  (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@290@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _21$address@71@01) (as Size$I64$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot)
(set-option :timeout 0)
(push) ; 21
; [then-branch: 50 | MemoryBlock$bytes(First:(Second:($t@290@01)), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](_21$address@71@01), Size$I64$[Snap$Usize]) == to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@338@01)) | live]
; [else-branch: 50 | MemoryBlock$bytes(First:(Second:($t@290@01)), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](_21$address@71@01), Size$I64$[Snap$Usize]) != to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@338@01)) | live]
(push) ; 22
; [then-branch: 50 | MemoryBlock$bytes(First:(Second:($t@290@01)), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](_21$address@71@01), Size$I64$[Snap$Usize]) == to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@338@01))]
(assert (=
  (MemoryBlock$bytes ($Snap.first ($Snap.second $t@290@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _21$address@71@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
  (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@338@01))))
; [eval] old(MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address), Size$Bool$()) == to_bytes$Bool(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot)))
; [eval] MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address), Size$Bool$()) == to_bytes$Bool(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot))
; [eval] MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address), Size$Bool$())
; [eval] field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address)
; [eval] Size$Bool$()
(push) ; 23
(declare-const $k@340@01 $Perm)
(assert ($Perm.isReadVar $k@340@01))
(push) ; 24
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _21$place<Place>  Place)) _21$address@71@01)
  (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _21$address@71@01))))
(check-sat)
; unsat
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(assert (< $k@340@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@340@01)))
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (< $Perm.No $k@340@01)))
(check-sat)
; unsat
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition $t@336@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _21$address@71@01) (as Size$Bool$<Snap$Usize>  Snap$Usize)))
(pop) ; 23
; Joined path conditions
(assert ($Perm.isReadVar $k@340@01))
(assert (and
  (< $k@340@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@340@01))
  (MemoryBlock$bytes%precondition $t@336@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _21$address@71@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$Bool(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot)
(pop) ; 22
(set-option :timeout 0)
(push) ; 22
; [else-branch: 50 | MemoryBlock$bytes(First:(Second:($t@290@01)), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](_21$address@71@01), Size$I64$[Snap$Usize]) != to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@338@01))]
(assert (not
  (=
    (MemoryBlock$bytes ($Snap.first ($Snap.second $t@290@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _21$address@71@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
    (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@338@01)))))
(pop) ; 22
(pop) ; 21
; Joined path conditions
(assert ($Perm.isReadVar $k@340@01))
(assert (=>
  (=
    (MemoryBlock$bytes ($Snap.first ($Snap.second $t@290@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _21$address@71@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
    (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@338@01)))
  (and
    (=
      (MemoryBlock$bytes ($Snap.first ($Snap.second $t@290@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _21$address@71@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
      (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@338@01)))
    (< $k@340@01 $Perm.Write)
    (<= $Perm.No (- $Perm.Write $k@340@01))
    (MemoryBlock$bytes%precondition $t@336@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _21$address@71@01) (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
; Joined path conditions
(assert (or
  (not
    (=
      (MemoryBlock$bytes ($Snap.first ($Snap.second $t@290@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _21$address@71@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
      (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@338@01))))
  (=
    (MemoryBlock$bytes ($Snap.first ($Snap.second $t@290@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _21$address@71@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
    (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@338@01)))))
(push) ; 21
; [then-branch: 51 | MemoryBlock$bytes($t@336@01, field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Address](_21$address@71@01), Size$Bool$[Snap$Usize]) == to_bytes$Bool[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](snapshot@338@01)) && MemoryBlock$bytes(First:(Second:($t@290@01)), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](_21$address@71@01), Size$I64$[Snap$Usize]) == to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@338@01)) | live]
; [else-branch: 51 | !(MemoryBlock$bytes($t@336@01, field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Address](_21$address@71@01), Size$Bool$[Snap$Usize]) == to_bytes$Bool[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](snapshot@338@01)) && MemoryBlock$bytes(First:(Second:($t@290@01)), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](_21$address@71@01), Size$I64$[Snap$Usize]) == to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@338@01))) | live]
(push) ; 22
; [then-branch: 51 | MemoryBlock$bytes($t@336@01, field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Address](_21$address@71@01), Size$Bool$[Snap$Usize]) == to_bytes$Bool[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](snapshot@338@01)) && MemoryBlock$bytes(First:(Second:($t@290@01)), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](_21$address@71@01), Size$I64$[Snap$Usize]) == to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@338@01))]
(assert (and
  (=
    (MemoryBlock$bytes $t@336@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _21$address@71@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
    (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@338@01)))
  (=
    (MemoryBlock$bytes ($Snap.first ($Snap.second $t@290@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _21$address@71@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
    (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@338@01)))))
; [eval] MemoryBlock$bytes(address, Size$Tuple$$I64$Bool$$I64$Bool$$()) == to_bytes$Tuple$$I64$Bool$$I64$Bool$(snapshot)
; [eval] MemoryBlock$bytes(address, Size$Tuple$$I64$Bool$$I64$Bool$$())
; [eval] Size$Tuple$$I64$Bool$$I64$Bool$$()
(push) ; 23
(declare-const $k@341@01 $Perm)
(assert ($Perm.isReadVar $k@341@01))
(assert (< $k@341@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@341@01)))
(push) ; 24
(set-option :timeout 10)
(assert (not (< $Perm.No $k@341@01)))
(check-sat)
; unsat
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first $t@337@01) _21$address@71@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))
(pop) ; 23
; Joined path conditions
(assert ($Perm.isReadVar $k@341@01))
(assert (and
  (< $k@341@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@341@01))
  (MemoryBlock$bytes%precondition ($Snap.first $t@337@01) _21$address@71@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$Tuple$$I64$Bool$$I64$Bool$(snapshot)
(pop) ; 22
(set-option :timeout 0)
(push) ; 22
; [else-branch: 51 | !(MemoryBlock$bytes($t@336@01, field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Address](_21$address@71@01), Size$Bool$[Snap$Usize]) == to_bytes$Bool[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](snapshot@338@01)) && MemoryBlock$bytes(First:(Second:($t@290@01)), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](_21$address@71@01), Size$I64$[Snap$Usize]) == to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@338@01)))]
(assert (not
  (and
    (=
      (MemoryBlock$bytes $t@336@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _21$address@71@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
      (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@338@01)))
    (=
      (MemoryBlock$bytes ($Snap.first ($Snap.second $t@290@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _21$address@71@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
      (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@338@01))))))
(pop) ; 22
(pop) ; 21
; Joined path conditions
(assert ($Perm.isReadVar $k@341@01))
(assert (=>
  (and
    (=
      (MemoryBlock$bytes $t@336@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _21$address@71@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
      (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@338@01)))
    (=
      (MemoryBlock$bytes ($Snap.first ($Snap.second $t@290@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _21$address@71@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
      (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@338@01))))
  (and
    (=
      (MemoryBlock$bytes $t@336@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _21$address@71@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
      (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@338@01)))
    (=
      (MemoryBlock$bytes ($Snap.first ($Snap.second $t@290@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _21$address@71@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
      (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@338@01)))
    (< $k@341@01 $Perm.Write)
    (<= $Perm.No (- $Perm.Write $k@341@01))
    (MemoryBlock$bytes%precondition ($Snap.first $t@337@01) _21$address@71@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
; Joined path conditions
(assert (or
  (not
    (and
      (=
        (MemoryBlock$bytes $t@336@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _21$address@71@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
        (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@338@01)))
      (=
        (MemoryBlock$bytes ($Snap.first ($Snap.second $t@290@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _21$address@71@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
        (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@338@01)))))
  (and
    (=
      (MemoryBlock$bytes $t@336@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _21$address@71@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
      (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@338@01)))
    (=
      (MemoryBlock$bytes ($Snap.first ($Snap.second $t@290@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _21$address@71@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
      (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@338@01))))))
(pop) ; 20
; Nested auxiliary terms: globals (aux)
(assert ($Perm.isReadVar $k@339@01))
(assert ($Perm.isReadVar $k@340@01))
(assert ($Perm.isReadVar $k@341@01))
(assert (< $k@339@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@339@01)))
(assert (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@290@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _21$address@71@01) (as Size$I64$<Snap$Usize>  Snap$Usize)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((snapshot@338@01 Snap$Tuple$$I64$Bool$$I64$Bool$)) (!
  (and
    (=>
      (=
        (MemoryBlock$bytes ($Snap.first ($Snap.second $t@290@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _21$address@71@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
        (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@338@01)))
      (and
        (=
          (MemoryBlock$bytes ($Snap.first ($Snap.second $t@290@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _21$address@71@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
          (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@338@01)))
        (< $k@340@01 $Perm.Write)
        (<= $Perm.No (- $Perm.Write $k@340@01))
        (MemoryBlock$bytes%precondition $t@336@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _21$address@71@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))))
    (or
      (not
        (=
          (MemoryBlock$bytes ($Snap.first ($Snap.second $t@290@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _21$address@71@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
          (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@338@01))))
      (=
        (MemoryBlock$bytes ($Snap.first ($Snap.second $t@290@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _21$address@71@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
        (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@338@01))))
    (=>
      (and
        (=
          (MemoryBlock$bytes $t@336@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _21$address@71@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
          (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@338@01)))
        (=
          (MemoryBlock$bytes ($Snap.first ($Snap.second $t@290@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _21$address@71@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
          (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@338@01))))
      (and
        (=
          (MemoryBlock$bytes $t@336@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _21$address@71@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
          (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@338@01)))
        (=
          (MemoryBlock$bytes ($Snap.first ($Snap.second $t@290@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _21$address@71@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
          (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@338@01)))
        (< $k@341@01 $Perm.Write)
        (<= $Perm.No (- $Perm.Write $k@341@01))
        (MemoryBlock$bytes%precondition ($Snap.first $t@337@01) _21$address@71@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize))))
    (or
      (not
        (and
          (=
            (MemoryBlock$bytes $t@336@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _21$address@71@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
            (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@338@01)))
          (=
            (MemoryBlock$bytes ($Snap.first ($Snap.second $t@290@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _21$address@71@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
            (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@338@01)))))
      (and
        (=
          (MemoryBlock$bytes $t@336@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _21$address@71@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
          (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@338@01)))
        (=
          (MemoryBlock$bytes ($Snap.first ($Snap.second $t@290@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _21$address@71@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
          (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@338@01))))))
  :pattern ((to_bytes$Tuple$$I64$Bool$$I64$Bool$<Bytes> snapshot@338@01))
  :qid |prog.l1825-aux|)))
(assert (forall ((snapshot@338@01 Snap$Tuple$$I64$Bool$$I64$Bool$)) (!
  (=>
    (and
      (=
        (MemoryBlock$bytes $t@336@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _21$address@71@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
        (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@338@01)))
      (=
        (MemoryBlock$bytes ($Snap.first ($Snap.second $t@290@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _21$address@71@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
        (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@338@01))))
    (=
      (MemoryBlock$bytes ($Snap.first $t@337@01) _21$address@71@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize))
      (to_bytes$Tuple$$I64$Bool$$I64$Bool$<Bytes> snapshot@338@01)))
  :pattern ((to_bytes$Tuple$$I64$Bool$$I64$Bool$<Bytes> snapshot@338@01))
  :qid |prog.l1825|)))
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
; inhale _0$snapshot$4 == _0$snapshot$3
(declare-const $t@342@01 $Snap)
(assert (= $t@342@01 $Snap.unit))
; [eval] _0$snapshot$4 == _0$snapshot$3
(assert (= _0$snapshot$4@5@01 _0$snapshot$3@4@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale _10$snapshot$3 == _10$snapshot$2
(declare-const $t@343@01 $Snap)
(assert (= $t@343@01 $Snap.unit))
; [eval] _10$snapshot$3 == _10$snapshot$2
(assert (= _10$snapshot$3@12@01 _10$snapshot$2@11@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _11$snapshot$4 == _11$snapshot$3
(declare-const $t@344@01 $Snap)
(assert (= $t@344@01 $Snap.unit))
; [eval] _11$snapshot$4 == _11$snapshot$3
(assert (= _11$snapshot$4@18@01 _11$snapshot$3@17@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _12$snapshot$5 == _12$snapshot$4
(declare-const $t@345@01 $Snap)
(assert (= $t@345@01 $Snap.unit))
; [eval] _12$snapshot$5 == _12$snapshot$4
(assert (= _12$snapshot$5@25@01 _12$snapshot$4@24@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _13$snapshot$5 == _13$snapshot$4
(declare-const $t@346@01 $Snap)
(assert (= $t@346@01 $Snap.unit))
; [eval] _13$snapshot$5 == _13$snapshot$4
(assert (= _13$snapshot$5@32@01 _13$snapshot$4@31@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _14$snapshot$5 == _14$snapshot$4
(declare-const $t@347@01 $Snap)
(assert (= $t@347@01 $Snap.unit))
; [eval] _14$snapshot$5 == _14$snapshot$4
(assert (= _14$snapshot$5@39@01 _14$snapshot$4@38@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _15$snapshot$5 == _15$snapshot$4
(declare-const $t@348@01 $Snap)
(assert (= $t@348@01 $Snap.unit))
; [eval] _15$snapshot$5 == _15$snapshot$4
(assert (= _15$snapshot$5@46@01 _15$snapshot$4@45@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _18$snapshot$4 == _18$snapshot$3
(declare-const $t@349@01 $Snap)
(assert (= $t@349@01 $Snap.unit))
; [eval] _18$snapshot$4 == _18$snapshot$3
(assert (= _18$snapshot$4@55@01 _18$snapshot$3@54@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _19$snapshot$4 == _19$snapshot$3
(declare-const $t@350@01 $Snap)
(assert (= $t@350@01 $Snap.unit))
; [eval] _19$snapshot$4 == _19$snapshot$3
(assert (= _19$snapshot$4@61@01 _19$snapshot$3@60@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _20$snapshot$4 == _20$snapshot$3
(declare-const $t@351@01 $Snap)
(assert (= $t@351@01 $Snap.unit))
; [eval] _20$snapshot$4 == _20$snapshot$3
(assert (= _20$snapshot$4@70@01 _20$snapshot$3@69@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _21$snapshot$4 == _21$snapshot$3
(declare-const $t@352@01 $Snap)
(assert (= $t@352@01 $Snap.unit))
; [eval] _21$snapshot$4 == _21$snapshot$3
(assert (= _21$snapshot$4@76@01 _21$snapshot$3@75@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _4$snapshot$4 == _4$snapshot$3
(declare-const $t@353@01 $Snap)
(assert (= $t@353@01 $Snap.unit))
; [eval] _4$snapshot$4 == _4$snapshot$3
(assert (= _4$snapshot$4@85@01 _4$snapshot$3@84@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _5$snapshot$4 == _5$snapshot$3
(declare-const $t@354@01 $Snap)
(assert (= $t@354@01 $Snap.unit))
; [eval] _5$snapshot$4 == _5$snapshot$3
(assert (= _5$snapshot$4@91@01 _5$snapshot$3@90@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _6$snapshot$6 == _6$snapshot$5
(declare-const $t@355@01 $Snap)
(assert (= $t@355@01 $Snap.unit))
; [eval] _6$snapshot$6 == _6$snapshot$5
(assert (= _6$snapshot$6@99@01 _6$snapshot$5@98@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _7$snapshot$4 == _7$snapshot$3
(declare-const $t@356@01 $Snap)
(assert (= $t@356@01 $Snap.unit))
; [eval] _7$snapshot$4 == _7$snapshot$3
(assert (= _7$snapshot$4@105@01 _7$snapshot$3@104@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _8$snapshot$4 == _8$snapshot$3
(declare-const $t@357@01 $Snap)
(assert (= $t@357@01 $Snap.unit))
; [eval] _8$snapshot$4 == _8$snapshot$3
(assert (= _8$snapshot$4@111@01 _8$snapshot$3@110@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _9$snapshot$3 == _9$snapshot$2
(declare-const $t@358@01 $Snap)
(assert (= $t@358@01 $Snap.unit))
; [eval] _9$snapshot$3 == _9$snapshot$2
(assert (= _9$snapshot$3@116@01 _9$snapshot$2@115@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale lft_function_call_1$snapshot$4 == lft_function_call_1$snapshot$3
(declare-const $t@359@01 $Snap)
(assert (= $t@359@01 $Snap.unit))
; [eval] lft_function_call_1$snapshot$4 == lft_function_call_1$snapshot$3
(assert (= lft_function_call_1$snapshot$4@150@01 lft_function_call_1$snapshot$3@149@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; label end_label
; [exec]
; end_label$marker := true
; [exec]
; inhale basic_block_marker$end_label$marker()
(declare-const $t@360@01 $Snap)
(assert (= $t@360@01 $Snap.unit))
; [eval] basic_block_marker$end_label$marker()
(assert (as basic_block_marker$end_label$marker<Bool>  Bool))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; label end_of_method
(pop) ; 19
; [eval] !(label_bb12$marker && label_bb13$marker)
; [eval] label_bb12$marker && label_bb13$marker
(set-option :timeout 0)
(push) ; 19
; [then-branch: 52 | True | live]
; [else-branch: 52 | False | live]
(push) ; 20
; [then-branch: 52 | True]
(pop) ; 20
(push) ; 20
; [else-branch: 52 | False]
(assert false)
(pop) ; 20
(pop) ; 19
; Joined path conditions
; Joined path conditions
; [then-branch: 53 | False | dead]
; [else-branch: 53 | True | live]
(push) ; 19
; [else-branch: 53 | True]
(pop) ; 19
(pop) ; 18
; [eval] !(label_bb12$marker && label_bb13$marker)
; [eval] label_bb12$marker && label_bb13$marker
(push) ; 18
; [then-branch: 54 | True | live]
; [else-branch: 54 | False | live]
(push) ; 19
; [then-branch: 54 | True]
(pop) ; 19
(push) ; 19
; [else-branch: 54 | False]
(assert false)
(pop) ; 19
(pop) ; 18
; Joined path conditions
; Joined path conditions
; [then-branch: 55 | False | dead]
; [else-branch: 55 | True | live]
(push) ; 18
; [else-branch: 55 | True]
(pop) ; 18
(pop) ; 17
; [eval] !(label_bb12$marker && label_bb13$marker)
; [eval] label_bb12$marker && label_bb13$marker
(push) ; 17
; [then-branch: 56 | True | live]
; [else-branch: 56 | False | live]
(push) ; 18
; [then-branch: 56 | True]
(pop) ; 18
(push) ; 18
; [else-branch: 56 | False]
(assert false)
(pop) ; 18
(pop) ; 17
; Joined path conditions
; Joined path conditions
; [then-branch: 57 | False | dead]
; [else-branch: 57 | True | live]
(push) ; 17
; [else-branch: 57 | True]
(pop) ; 17
(pop) ; 16
; [eval] !(label_bb12$marker && label_bb13$marker)
; [eval] label_bb12$marker && label_bb13$marker
(push) ; 16
; [then-branch: 58 | True | live]
; [else-branch: 58 | False | live]
(push) ; 17
; [then-branch: 58 | True]
(pop) ; 17
(push) ; 17
; [else-branch: 58 | False]
(assert false)
(pop) ; 17
(pop) ; 16
; Joined path conditions
; Joined path conditions
; [then-branch: 59 | False | dead]
; [else-branch: 59 | True | live]
(push) ; 16
; [else-branch: 59 | True]
(pop) ; 16
(pop) ; 15
; [eval] !(label_bb7$marker && (label_bb5$marker && (label_5_custom$marker && (label_bb9$marker && (label_bb10$marker && (label_8_custom$marker && (label_bb11$marker && (label_bb12$marker && label_bb13$marker))))))))
; [eval] label_bb7$marker && (label_bb5$marker && (label_5_custom$marker && (label_bb9$marker && (label_bb10$marker && (label_8_custom$marker && (label_bb11$marker && (label_bb12$marker && label_bb13$marker)))))))
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
(push) ; 27
; [then-branch: 66 | True | live]
; [else-branch: 66 | False | live]
(push) ; 28
; [then-branch: 66 | True]
(push) ; 29
; [then-branch: 67 | True | live]
; [else-branch: 67 | False | live]
(push) ; 30
; [then-branch: 67 | True]
(pop) ; 30
(push) ; 30
; [else-branch: 67 | False]
(assert false)
(pop) ; 30
(pop) ; 29
; Joined path conditions
; Joined path conditions
(pop) ; 28
(push) ; 28
; [else-branch: 66 | False]
(assert false)
(pop) ; 28
(pop) ; 27
; Joined path conditions
; Joined path conditions
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
; [then-branch: 68 | False | dead]
; [else-branch: 68 | True | live]
(push) ; 15
; [else-branch: 68 | True]
(pop) ; 15
(pop) ; 14
; [eval] !(label_bb7$marker && (label_bb5$marker && (label_5_custom$marker && (label_bb9$marker && (label_bb10$marker && (label_8_custom$marker && (label_bb11$marker && (label_bb12$marker && label_bb13$marker))))))))
; [eval] label_bb7$marker && (label_bb5$marker && (label_5_custom$marker && (label_bb9$marker && (label_bb10$marker && (label_8_custom$marker && (label_bb11$marker && (label_bb12$marker && label_bb13$marker)))))))
(push) ; 14
; [then-branch: 69 | True | live]
; [else-branch: 69 | False | live]
(push) ; 15
; [then-branch: 69 | True]
(push) ; 16
; [then-branch: 70 | True | live]
; [else-branch: 70 | False | live]
(push) ; 17
; [then-branch: 70 | True]
(push) ; 18
; [then-branch: 71 | True | live]
; [else-branch: 71 | False | live]
(push) ; 19
; [then-branch: 71 | True]
(push) ; 20
; [then-branch: 72 | True | live]
; [else-branch: 72 | False | live]
(push) ; 21
; [then-branch: 72 | True]
(push) ; 22
; [then-branch: 73 | True | live]
; [else-branch: 73 | False | live]
(push) ; 23
; [then-branch: 73 | True]
(push) ; 24
; [then-branch: 74 | True | live]
; [else-branch: 74 | False | live]
(push) ; 25
; [then-branch: 74 | True]
(push) ; 26
; [then-branch: 75 | True | live]
; [else-branch: 75 | False | live]
(push) ; 27
; [then-branch: 75 | True]
(push) ; 28
; [then-branch: 76 | True | live]
; [else-branch: 76 | False | live]
(push) ; 29
; [then-branch: 76 | True]
(pop) ; 29
(push) ; 29
; [else-branch: 76 | False]
(assert false)
(pop) ; 29
(pop) ; 28
; Joined path conditions
; Joined path conditions
(pop) ; 27
(push) ; 27
; [else-branch: 75 | False]
(assert false)
(pop) ; 27
(pop) ; 26
; Joined path conditions
; Joined path conditions
(pop) ; 25
(push) ; 25
; [else-branch: 74 | False]
(assert false)
(pop) ; 25
(pop) ; 24
; Joined path conditions
; Joined path conditions
(pop) ; 23
(push) ; 23
; [else-branch: 73 | False]
(assert false)
(pop) ; 23
(pop) ; 22
; Joined path conditions
; Joined path conditions
(pop) ; 21
(push) ; 21
; [else-branch: 72 | False]
(assert false)
(pop) ; 21
(pop) ; 20
; Joined path conditions
; Joined path conditions
(pop) ; 19
(push) ; 19
; [else-branch: 71 | False]
(assert false)
(pop) ; 19
(pop) ; 18
; Joined path conditions
; Joined path conditions
(pop) ; 17
(push) ; 17
; [else-branch: 70 | False]
(assert false)
(pop) ; 17
(pop) ; 16
; Joined path conditions
; Joined path conditions
(pop) ; 15
(push) ; 15
; [else-branch: 69 | False]
(assert false)
(pop) ; 15
(pop) ; 14
; Joined path conditions
; Joined path conditions
; [then-branch: 77 | False | dead]
; [else-branch: 77 | True | live]
(push) ; 14
; [else-branch: 77 | True]
(pop) ; 14
(pop) ; 13
; [eval] !(label_bb12$marker && label_bb13$marker)
; [eval] label_bb12$marker && label_bb13$marker
(push) ; 13
; [then-branch: 78 | True | live]
; [else-branch: 78 | False | live]
(push) ; 14
; [then-branch: 78 | True]
(pop) ; 14
(push) ; 14
; [else-branch: 78 | False]
(assert false)
(pop) ; 14
(pop) ; 13
; Joined path conditions
; Joined path conditions
; [then-branch: 79 | False | dead]
; [else-branch: 79 | True | live]
(push) ; 13
; [else-branch: 79 | True]
(pop) ; 13
(pop) ; 12
; [eval] !(label_bb12$marker && label_bb13$marker)
; [eval] label_bb12$marker && label_bb13$marker
(push) ; 12
; [then-branch: 80 | True | live]
; [else-branch: 80 | False | live]
(push) ; 13
; [then-branch: 80 | True]
(pop) ; 13
(push) ; 13
; [else-branch: 80 | False]
(assert false)
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
; [then-branch: 81 | False | dead]
; [else-branch: 81 | True | live]
(push) ; 12
; [else-branch: 81 | True]
(pop) ; 12
(pop) ; 11
; [eval] !!destructor$Snap$Bool$$value(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(_21$snapshot$1))
; [eval] !destructor$Snap$Bool$$value(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(_21$snapshot$1))
; [eval] destructor$Snap$Bool$$value(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(_21$snapshot$1))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(_21$snapshot$1)
(push) ; 11
(set-option :timeout 10)
(assert (not (not
  (destructor$Snap$Bool$$value<Bool> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> _21$snapshot$1@73@01)))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [then-branch: 82 | destructor$Snap$Bool$$value[Bool](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](_21$snapshot$1@73@01)) | dead]
; [else-branch: 82 | !(destructor$Snap$Bool$$value[Bool](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](_21$snapshot$1@73@01))) | live]
(set-option :timeout 0)
(push) ; 11
; [else-branch: 82 | !(destructor$Snap$Bool$$value[Bool](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](_21$snapshot$1@73@01)))]
(assert (not
  (destructor$Snap$Bool$$value<Bool> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> _21$snapshot$1@73@01))))
(pop) ; 11
(pop) ; 10
(push) ; 10
; [else-branch: 11 | !(tmp$7@162@01)]
(assert (not tmp$7@162@01))
(pop) ; 10
; [eval] !tmp$7
(push) ; 10
(set-option :timeout 10)
(assert (not tmp$7@162@01))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not tmp$7@162@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [then-branch: 83 | !(tmp$7@162@01) | live]
; [else-branch: 83 | tmp$7@162@01 | live]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 83 | !(tmp$7@162@01)]
(assert (not tmp$7@162@01))
; [eval] !tmp$7
(push) ; 11
(set-option :timeout 10)
(assert (not tmp$7@162@01))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [then-branch: 84 | !(tmp$7@162@01) | live]
; [else-branch: 84 | tmp$7@162@01 | dead]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 84 | !(tmp$7@162@01)]
; [exec]
; label label_9_custom
; [exec]
; label_9_custom$marker := true
; [exec]
; inhale basic_block_marker$label_9_custom$marker()
(declare-const $t@361@01 $Snap)
(assert (= $t@361@01 $Snap.unit))
; [eval] basic_block_marker$label_9_custom$marker()
(assert (as basic_block_marker$label_9_custom$marker<Bool>  Bool))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlock(_17$address, Size$I64$()), write)
; [eval] Size$I64$()
(declare-const $t@362@01 $Snap)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _10$place<Place>  Place)) _10$address@8@01)
  _17$address@48@01)))
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
    (compute_address<Address> (as _10$place<Place>  Place) _10$address@8@01)
    _17$address@48@01)
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
(assert (not (= _0$address@0@01 _17$address@48@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (and
  (= _21$address@71@01 _17$address@48@01)
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
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
    (compute_address<Address> (as _15$place<Place>  Place) _15$address@40@01)
    _17$address@48@01)
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
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _15$place<Place>  Place)) _15$address@40@01)
  _17$address@48@01)))
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
    (compute_address<Address> (as _20$place<Place>  Place) _20$address@65@01)
    _17$address@48@01)
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
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _20$place<Place>  Place)) _20$address@65@01)
  _17$address@48@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _18$place<Place>  Place) _18$address@50@01)
  _17$address@48@01)))
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
; inhale acc(LifetimeToken(lft_1$snapshot$1), lifetime_token_perm_amount$0$snapshot$0 /
;   7)
; [eval] lifetime_token_perm_amount$0$snapshot$0 / 7
(set-option :timeout 0)
(push) ; 12
(assert (not (or
  (= (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7)) $Perm.No)
  (< $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7))))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(declare-const $t@363@01 $Snap)
(push) ; 12
(set-option :timeout 10)
(assert (not (= bw1$snapshot$0@118@01 lft@169@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= bw0$snapshot$0@117@01 lft@169@01)))
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
; inhale acc(LifetimeToken(lft_function_call_1$snapshot$1), lifetime_token_perm_amount$0$snapshot$0 /
;   7)
; [eval] lifetime_token_perm_amount$0$snapshot$0 / 7
(set-option :timeout 0)
(push) ; 12
(assert (not (or
  (= (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7)) $Perm.No)
  (< $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7))))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(declare-const $t@364@01 $Snap)
(declare-const $t@365@01 $Snap)
(assert (and
  (=>
    (< $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7)))
    (= $t@365@01 $t@363@01))
  (=>
    (< $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7)))
    (= $t@365@01 $t@364@01))))
(assert (<=
  $Perm.No
  (+
    (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7))
    (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7)))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; label label__from__label_9_custom__to__label_bb14
; [exec]
; inhale _11$snapshot$2 == _11$snapshot$1
(declare-const $t@366@01 $Snap)
(assert (= $t@366@01 $Snap.unit))
; [eval] _11$snapshot$2 == _11$snapshot$1
(assert (= _11$snapshot$2@16@01 _11$snapshot$1@15@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _12$snapshot$3 == _12$snapshot$2
(declare-const $t@367@01 $Snap)
(assert (= $t@367@01 $Snap.unit))
; [eval] _12$snapshot$3 == _12$snapshot$2
(assert (= _12$snapshot$3@23@01 _12$snapshot$2@22@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _13$snapshot$3 == _13$snapshot$2
(declare-const $t@368@01 $Snap)
(assert (= $t@368@01 $Snap.unit))
; [eval] _13$snapshot$3 == _13$snapshot$2
(assert (= _13$snapshot$3@30@01 _13$snapshot$2@29@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _14$snapshot$3 == _14$snapshot$2
(declare-const $t@369@01 $Snap)
(assert (= $t@369@01 $Snap.unit))
; [eval] _14$snapshot$3 == _14$snapshot$2
(assert (= _14$snapshot$3@37@01 _14$snapshot$2@36@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _15$snapshot$3 == _15$snapshot$2
(declare-const $t@370@01 $Snap)
(assert (= $t@370@01 $Snap.unit))
; [eval] _15$snapshot$3 == _15$snapshot$2
(assert (= _15$snapshot$3@44@01 _15$snapshot$2@43@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _18$snapshot$2 == _18$snapshot$1
(declare-const $t@371@01 $Snap)
(assert (= $t@371@01 $Snap.unit))
; [eval] _18$snapshot$2 == _18$snapshot$1
(assert (= _18$snapshot$2@53@01 _18$snapshot$1@52@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _19$snapshot$2 == _19$snapshot$1
(declare-const $t@372@01 $Snap)
(assert (= $t@372@01 $Snap.unit))
; [eval] _19$snapshot$2 == _19$snapshot$1
(assert (= _19$snapshot$2@59@01 _19$snapshot$1@58@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _20$snapshot$2 == _20$snapshot$1
(declare-const $t@373@01 $Snap)
(assert (= $t@373@01 $Snap.unit))
; [eval] _20$snapshot$2 == _20$snapshot$1
(assert (= _20$snapshot$2@68@01 _20$snapshot$1@67@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _21$snapshot$2 == _21$snapshot$0
(declare-const $t@374@01 $Snap)
(assert (= $t@374@01 $Snap.unit))
; [eval] _21$snapshot$2 == _21$snapshot$0
(assert (= _21$snapshot$2@74@01 _21$snapshot$0@72@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _4$snapshot$2 == _4$snapshot$1
(declare-const $t@375@01 $Snap)
(assert (= $t@375@01 $Snap.unit))
; [eval] _4$snapshot$2 == _4$snapshot$1
(assert (= _4$snapshot$2@83@01 _4$snapshot$1@82@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _5$snapshot$2 == _5$snapshot$1
(declare-const $t@376@01 $Snap)
(assert (= $t@376@01 $Snap.unit))
; [eval] _5$snapshot$2 == _5$snapshot$1
(assert (= _5$snapshot$2@89@01 _5$snapshot$1@88@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _6$snapshot$4 == _6$snapshot$3
(declare-const $t@377@01 $Snap)
(assert (= $t@377@01 $Snap.unit))
; [eval] _6$snapshot$4 == _6$snapshot$3
(assert (= _6$snapshot$4@97@01 _6$snapshot$3@96@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _7$snapshot$2 == _7$snapshot$1
(declare-const $t@378@01 $Snap)
(assert (= $t@378@01 $Snap.unit))
; [eval] _7$snapshot$2 == _7$snapshot$1
(assert (= _7$snapshot$2@103@01 _7$snapshot$1@102@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _8$snapshot$2 == _8$snapshot$1
(declare-const $t@379@01 $Snap)
(assert (= $t@379@01 $Snap.unit))
; [eval] _8$snapshot$2 == _8$snapshot$1
(assert (= _8$snapshot$2@109@01 _8$snapshot$1@108@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale lft_function_call_1$snapshot$2 == lft_function_call_1$snapshot$1
(declare-const $t@380@01 $Snap)
(assert (= $t@380@01 $Snap.unit))
; [eval] lft_function_call_1$snapshot$2 == lft_function_call_1$snapshot$1
(assert (= lft_function_call_1$snapshot$2@148@01 lft@169@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; label label_bb14
; [exec]
; label_bb14$marker := true
; [exec]
; inhale basic_block_marker$label_bb14$marker()
(declare-const $t@381@01 $Snap)
(assert (= $t@381@01 $Snap.unit))
; [eval] basic_block_marker$label_bb14$marker()
(assert (as basic_block_marker$label_bb14$marker<Bool>  Bool))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; label resume_panic_label
; [exec]
; resume_panic_label$marker := true
; [exec]
; inhale basic_block_marker$resume_panic_label$marker()
(declare-const $t@382@01 $Snap)
(assert (= $t@382@01 $Snap.unit))
; [eval] basic_block_marker$resume_panic_label$marker()
(assert (as basic_block_marker$resume_panic_label$marker<Bool>  Bool))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; label label__from__resume_panic_label__to__end_label
; [exec]
; inhale _0$snapshot$4 == _0$snapshot$0
(declare-const $t@383@01 $Snap)
(assert (= $t@383@01 $Snap.unit))
; [eval] _0$snapshot$4 == _0$snapshot$0
(assert (= _0$snapshot$4@5@01 _0$snapshot$0@1@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _10$snapshot$3 == _10$snapshot$1
(declare-const $t@384@01 $Snap)
(assert (= $t@384@01 $Snap.unit))
; [eval] _10$snapshot$3 == _10$snapshot$1
(assert (= _10$snapshot$3@12@01 _10$snapshot$1@10@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _11$snapshot$4 == _11$snapshot$2
(declare-const $t@385@01 $Snap)
(assert (= $t@385@01 $Snap.unit))
; [eval] _11$snapshot$4 == _11$snapshot$2
(assert (= _11$snapshot$4@18@01 _11$snapshot$2@16@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _12$snapshot$5 == _12$snapshot$3
(declare-const $t@386@01 $Snap)
(assert (= $t@386@01 $Snap.unit))
; [eval] _12$snapshot$5 == _12$snapshot$3
(assert (= _12$snapshot$5@25@01 _12$snapshot$3@23@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _13$snapshot$5 == _13$snapshot$3
(declare-const $t@387@01 $Snap)
(assert (= $t@387@01 $Snap.unit))
; [eval] _13$snapshot$5 == _13$snapshot$3
(assert (= _13$snapshot$5@32@01 _13$snapshot$3@30@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _14$snapshot$5 == _14$snapshot$3
(declare-const $t@388@01 $Snap)
(assert (= $t@388@01 $Snap.unit))
; [eval] _14$snapshot$5 == _14$snapshot$3
(assert (= _14$snapshot$5@39@01 _14$snapshot$3@37@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _15$snapshot$5 == _15$snapshot$3
(declare-const $t@389@01 $Snap)
(assert (= $t@389@01 $Snap.unit))
; [eval] _15$snapshot$5 == _15$snapshot$3
(assert (= _15$snapshot$5@46@01 _15$snapshot$3@44@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _18$snapshot$4 == _18$snapshot$2
(declare-const $t@390@01 $Snap)
(assert (= $t@390@01 $Snap.unit))
; [eval] _18$snapshot$4 == _18$snapshot$2
(assert (= _18$snapshot$4@55@01 _18$snapshot$2@53@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _19$snapshot$4 == _19$snapshot$2
(declare-const $t@391@01 $Snap)
(assert (= $t@391@01 $Snap.unit))
; [eval] _19$snapshot$4 == _19$snapshot$2
(assert (= _19$snapshot$4@61@01 _19$snapshot$2@59@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _20$snapshot$4 == _20$snapshot$2
(declare-const $t@392@01 $Snap)
(assert (= $t@392@01 $Snap.unit))
; [eval] _20$snapshot$4 == _20$snapshot$2
(assert (= _20$snapshot$4@70@01 _20$snapshot$2@68@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _21$snapshot$4 == _21$snapshot$2
(declare-const $t@393@01 $Snap)
(assert (= $t@393@01 $Snap.unit))
; [eval] _21$snapshot$4 == _21$snapshot$2
(assert (= _21$snapshot$4@76@01 _21$snapshot$2@74@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _4$snapshot$4 == _4$snapshot$2
(declare-const $t@394@01 $Snap)
(assert (= $t@394@01 $Snap.unit))
; [eval] _4$snapshot$4 == _4$snapshot$2
(assert (= _4$snapshot$4@85@01 _4$snapshot$2@83@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _5$snapshot$4 == _5$snapshot$2
(declare-const $t@395@01 $Snap)
(assert (= $t@395@01 $Snap.unit))
; [eval] _5$snapshot$4 == _5$snapshot$2
(assert (= _5$snapshot$4@91@01 _5$snapshot$2@89@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _6$snapshot$6 == _6$snapshot$4
(declare-const $t@396@01 $Snap)
(assert (= $t@396@01 $Snap.unit))
; [eval] _6$snapshot$6 == _6$snapshot$4
(assert (= _6$snapshot$6@99@01 _6$snapshot$4@97@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _7$snapshot$4 == _7$snapshot$2
(declare-const $t@397@01 $Snap)
(assert (= $t@397@01 $Snap.unit))
; [eval] _7$snapshot$4 == _7$snapshot$2
(assert (= _7$snapshot$4@105@01 _7$snapshot$2@103@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _8$snapshot$4 == _8$snapshot$2
(declare-const $t@398@01 $Snap)
(assert (= $t@398@01 $Snap.unit))
; [eval] _8$snapshot$4 == _8$snapshot$2
(assert (= _8$snapshot$4@111@01 _8$snapshot$2@109@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _9$snapshot$3 == _9$snapshot$1
(declare-const $t@399@01 $Snap)
(assert (= $t@399@01 $Snap.unit))
; [eval] _9$snapshot$3 == _9$snapshot$1
(assert (= _9$snapshot$3@116@01 _9$snapshot$1@114@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale lft_function_call_1$snapshot$4 == lft_function_call_1$snapshot$2
(declare-const $t@400@01 $Snap)
(assert (= $t@400@01 $Snap.unit))
; [eval] lft_function_call_1$snapshot$4 == lft_function_call_1$snapshot$2
(assert (= lft_function_call_1$snapshot$4@150@01 lft_function_call_1$snapshot$2@148@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; label end_label
; [exec]
; end_label$marker := true
; [exec]
; inhale basic_block_marker$end_label$marker()
(declare-const $t@401@01 $Snap)
(assert (= $t@401@01 $Snap.unit))
; [eval] basic_block_marker$end_label$marker()
(assert (as basic_block_marker$end_label$marker<Bool>  Bool))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; label end_of_method
(pop) ; 11
; [eval] !!tmp$7
; [eval] !tmp$7
; [then-branch: 85 | tmp$7@162@01 | dead]
; [else-branch: 85 | !(tmp$7@162@01) | live]
(set-option :timeout 0)
(push) ; 11
; [else-branch: 85 | !(tmp$7@162@01)]
(pop) ; 11
(pop) ; 10
(push) ; 10
; [else-branch: 83 | tmp$7@162@01]
(assert tmp$7@162@01)
(pop) ; 10
(pop) ; 9
; [eval] !!destructor$Snap$Bool$$value(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(_20$snapshot$1))
; [eval] !destructor$Snap$Bool$$value(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(_20$snapshot$1))
; [eval] destructor$Snap$Bool$$value(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(_20$snapshot$1))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(_20$snapshot$1)
(push) ; 9
(set-option :timeout 10)
(assert (not (not
  (destructor$Snap$Bool$$value<Bool> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> _20$snapshot$1@67@01)))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [then-branch: 86 | destructor$Snap$Bool$$value[Bool](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](_20$snapshot$1@67@01)) | dead]
; [else-branch: 86 | !(destructor$Snap$Bool$$value[Bool](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](_20$snapshot$1@67@01))) | live]
(set-option :timeout 0)
(push) ; 9
; [else-branch: 86 | !(destructor$Snap$Bool$$value[Bool](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](_20$snapshot$1@67@01)))]
(assert (not
  (destructor$Snap$Bool$$value<Bool> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> _20$snapshot$1@67@01))))
(pop) ; 9
(pop) ; 8
(push) ; 8
; [else-branch: 8 | destructor$Snap$Bool$$value[Bool](_5$snapshot$1@88@01)]
(assert (destructor$Snap$Bool$$value<Bool> _5$snapshot$1@88@01))
(pop) ; 8
; [eval] !!destructor$Snap$Bool$$value(_5$snapshot$1)
; [eval] !destructor$Snap$Bool$$value(_5$snapshot$1)
; [eval] destructor$Snap$Bool$$value(_5$snapshot$1)
(push) ; 8
(set-option :timeout 10)
(assert (not (not (destructor$Snap$Bool$$value<Bool> _5$snapshot$1@88@01))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (destructor$Snap$Bool$$value<Bool> _5$snapshot$1@88@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [then-branch: 87 | destructor$Snap$Bool$$value[Bool](_5$snapshot$1@88@01) | live]
; [else-branch: 87 | !(destructor$Snap$Bool$$value[Bool](_5$snapshot$1@88@01)) | live]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 87 | destructor$Snap$Bool$$value[Bool](_5$snapshot$1@88@01)]
(assert (destructor$Snap$Bool$$value<Bool> _5$snapshot$1@88@01))
(push) ; 9
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [then-branch: 88 | True | live]
; [else-branch: 88 | False | dead]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 88 | True]
; [exec]
; label label_6_custom
; [exec]
; label_6_custom$marker := true
; [exec]
; inhale basic_block_marker$label_6_custom$marker()
(declare-const $t@402@01 $Snap)
(assert (= $t@402@01 $Snap.unit))
; [eval] basic_block_marker$label_6_custom$marker()
(assert (as basic_block_marker$label_6_custom$marker<Bool>  Bool))
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
(declare-const $t@403@01 $Snap)
(assert (= $t@403@01 $Snap.unit))
; [eval] basic_block_marker$label_bb8$marker()
(assert (as basic_block_marker$label_bb8$marker<Bool>  Bool))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlock(_16$address, Size$Never$()), write)
; [eval] Size$Never$()
(declare-const $t@404@01 $Snap)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _10$place<Place>  Place)) _10$address@8@01)
    _16$address@47@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Never$<Snap$Usize>  Snap$Usize)))))
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
    (compute_address<Address> (as _10$place<Place>  Place) _10$address@8@01)
    _16$address@47@01)
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Never$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and
  (= _4$address@80@01 _16$address@47@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Never$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and
  (= _20$address@65@01 _16$address@47@01)
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Never$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and
  (= _0$address@0@01 _16$address@47@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Never$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and
  (= _21$address@71@01 _16$address@47@01)
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Never$<Snap$Usize>  Snap$Usize)))))
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
    (compute_address<Address> (as _15$place<Place>  Place) _15$address@40@01)
    _16$address@47@01)
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Never$<Snap$Usize>  Snap$Usize)))))
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
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _15$place<Place>  Place)) _15$address@40@01)
    _16$address@47@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Never$<Snap$Usize>  Snap$Usize)))))
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
; inhale acc(MemoryBlockStackDrop(_16$address, Size$Never$()), write)
; [eval] Size$Never$()
(declare-const $t@405@01 $Snap)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and
  (= _5$address@86@01 _16$address@47@01)
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$Never$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and
  (= _4$address@80@01 _16$address@47@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Never$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and
  (= _2$address@62@01 _16$address@47@01)
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$Never$<Snap$Usize>  Snap$Usize)))))
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
; label label__from__label_bb8__to__label_bb14
; [exec]
; inhale _11$snapshot$2 == _11$snapshot$1
(declare-const $t@406@01 $Snap)
(assert (= $t@406@01 $Snap.unit))
; [eval] _11$snapshot$2 == _11$snapshot$1
(assert (= _11$snapshot$2@16@01 _11$snapshot$1@15@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _12$snapshot$3 == _12$snapshot$2
(declare-const $t@407@01 $Snap)
(assert (= $t@407@01 $Snap.unit))
; [eval] _12$snapshot$3 == _12$snapshot$2
(assert (= _12$snapshot$3@23@01 _12$snapshot$2@22@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _13$snapshot$3 == _13$snapshot$2
(declare-const $t@408@01 $Snap)
(assert (= $t@408@01 $Snap.unit))
; [eval] _13$snapshot$3 == _13$snapshot$2
(assert (= _13$snapshot$3@30@01 _13$snapshot$2@29@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _14$snapshot$3 == _14$snapshot$2
(declare-const $t@409@01 $Snap)
(assert (= $t@409@01 $Snap.unit))
; [eval] _14$snapshot$3 == _14$snapshot$2
(assert (= _14$snapshot$3@37@01 _14$snapshot$2@36@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _15$snapshot$3 == _15$snapshot$2
(declare-const $t@410@01 $Snap)
(assert (= $t@410@01 $Snap.unit))
; [eval] _15$snapshot$3 == _15$snapshot$2
(assert (= _15$snapshot$3@44@01 _15$snapshot$2@43@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _18$snapshot$2 == _18$snapshot$0
(declare-const $t@411@01 $Snap)
(assert (= $t@411@01 $Snap.unit))
; [eval] _18$snapshot$2 == _18$snapshot$0
(assert (= _18$snapshot$2@53@01 _18$snapshot$0@51@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _19$snapshot$2 == _19$snapshot$0
(declare-const $t@412@01 $Snap)
(assert (= $t@412@01 $Snap.unit))
; [eval] _19$snapshot$2 == _19$snapshot$0
(assert (= _19$snapshot$2@59@01 _19$snapshot$0@57@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _20$snapshot$2 == _20$snapshot$0
(declare-const $t@413@01 $Snap)
(assert (= $t@413@01 $Snap.unit))
; [eval] _20$snapshot$2 == _20$snapshot$0
(assert (= _20$snapshot$2@68@01 _20$snapshot$0@66@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _21$snapshot$2 == _21$snapshot$0
(declare-const $t@414@01 $Snap)
(assert (= $t@414@01 $Snap.unit))
; [eval] _21$snapshot$2 == _21$snapshot$0
(assert (= _21$snapshot$2@74@01 _21$snapshot$0@72@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _4$snapshot$2 == _4$snapshot$0
(declare-const $t@415@01 $Snap)
(assert (= $t@415@01 $Snap.unit))
; [eval] _4$snapshot$2 == _4$snapshot$0
(assert (= _4$snapshot$2@83@01 _4$snapshot$0@81@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _5$snapshot$2 == _5$snapshot$1
(declare-const $t@416@01 $Snap)
(assert (= $t@416@01 $Snap.unit))
; [eval] _5$snapshot$2 == _5$snapshot$1
(assert (= _5$snapshot$2@89@01 _5$snapshot$1@88@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _6$snapshot$4 == _6$snapshot$3
(declare-const $t@417@01 $Snap)
(assert (= $t@417@01 $Snap.unit))
; [eval] _6$snapshot$4 == _6$snapshot$3
(assert (= _6$snapshot$4@97@01 _6$snapshot$3@96@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _7$snapshot$2 == _7$snapshot$1
(declare-const $t@418@01 $Snap)
(assert (= $t@418@01 $Snap.unit))
; [eval] _7$snapshot$2 == _7$snapshot$1
(assert (= _7$snapshot$2@103@01 _7$snapshot$1@102@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _8$snapshot$2 == _8$snapshot$1
(declare-const $t@419@01 $Snap)
(assert (= $t@419@01 $Snap.unit))
; [eval] _8$snapshot$2 == _8$snapshot$1
(assert (= _8$snapshot$2@109@01 _8$snapshot$1@108@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale lft_function_call_1$snapshot$2 == lft_function_call_1$snapshot$0
(declare-const $t@420@01 $Snap)
(assert (= $t@420@01 $Snap.unit))
; [eval] lft_function_call_1$snapshot$2 == lft_function_call_1$snapshot$0
(assert (= lft_function_call_1$snapshot$2@148@01 lft_function_call_1$snapshot$0@146@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; label label_bb14
; [exec]
; label_bb14$marker := true
; [exec]
; inhale basic_block_marker$label_bb14$marker()
(declare-const $t@421@01 $Snap)
(assert (= $t@421@01 $Snap.unit))
; [eval] basic_block_marker$label_bb14$marker()
(assert (as basic_block_marker$label_bb14$marker<Bool>  Bool))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; label resume_panic_label
; [exec]
; resume_panic_label$marker := true
; [exec]
; inhale basic_block_marker$resume_panic_label$marker()
(declare-const $t@422@01 $Snap)
(assert (= $t@422@01 $Snap.unit))
; [eval] basic_block_marker$resume_panic_label$marker()
(assert (as basic_block_marker$resume_panic_label$marker<Bool>  Bool))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; label label__from__resume_panic_label__to__end_label
; [exec]
; inhale _0$snapshot$4 == _0$snapshot$0
(declare-const $t@423@01 $Snap)
(assert (= $t@423@01 $Snap.unit))
; [eval] _0$snapshot$4 == _0$snapshot$0
(assert (= _0$snapshot$4@5@01 _0$snapshot$0@1@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _10$snapshot$3 == _10$snapshot$1
(declare-const $t@424@01 $Snap)
(assert (= $t@424@01 $Snap.unit))
; [eval] _10$snapshot$3 == _10$snapshot$1
(assert (= _10$snapshot$3@12@01 _10$snapshot$1@10@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _11$snapshot$4 == _11$snapshot$2
(declare-const $t@425@01 $Snap)
(assert (= $t@425@01 $Snap.unit))
; [eval] _11$snapshot$4 == _11$snapshot$2
(assert (= _11$snapshot$4@18@01 _11$snapshot$2@16@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _12$snapshot$5 == _12$snapshot$3
(declare-const $t@426@01 $Snap)
(assert (= $t@426@01 $Snap.unit))
; [eval] _12$snapshot$5 == _12$snapshot$3
(assert (= _12$snapshot$5@25@01 _12$snapshot$3@23@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _13$snapshot$5 == _13$snapshot$3
(declare-const $t@427@01 $Snap)
(assert (= $t@427@01 $Snap.unit))
; [eval] _13$snapshot$5 == _13$snapshot$3
(assert (= _13$snapshot$5@32@01 _13$snapshot$3@30@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _14$snapshot$5 == _14$snapshot$3
(declare-const $t@428@01 $Snap)
(assert (= $t@428@01 $Snap.unit))
; [eval] _14$snapshot$5 == _14$snapshot$3
(assert (= _14$snapshot$5@39@01 _14$snapshot$3@37@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _15$snapshot$5 == _15$snapshot$3
(declare-const $t@429@01 $Snap)
(assert (= $t@429@01 $Snap.unit))
; [eval] _15$snapshot$5 == _15$snapshot$3
(assert (= _15$snapshot$5@46@01 _15$snapshot$3@44@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _18$snapshot$4 == _18$snapshot$2
(declare-const $t@430@01 $Snap)
(assert (= $t@430@01 $Snap.unit))
; [eval] _18$snapshot$4 == _18$snapshot$2
(assert (= _18$snapshot$4@55@01 _18$snapshot$2@53@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _19$snapshot$4 == _19$snapshot$2
(declare-const $t@431@01 $Snap)
(assert (= $t@431@01 $Snap.unit))
; [eval] _19$snapshot$4 == _19$snapshot$2
(assert (= _19$snapshot$4@61@01 _19$snapshot$2@59@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _20$snapshot$4 == _20$snapshot$2
(declare-const $t@432@01 $Snap)
(assert (= $t@432@01 $Snap.unit))
; [eval] _20$snapshot$4 == _20$snapshot$2
(assert (= _20$snapshot$4@70@01 _20$snapshot$2@68@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _21$snapshot$4 == _21$snapshot$2
(declare-const $t@433@01 $Snap)
(assert (= $t@433@01 $Snap.unit))
; [eval] _21$snapshot$4 == _21$snapshot$2
(assert (= _21$snapshot$4@76@01 _21$snapshot$2@74@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _4$snapshot$4 == _4$snapshot$2
(declare-const $t@434@01 $Snap)
(assert (= $t@434@01 $Snap.unit))
; [eval] _4$snapshot$4 == _4$snapshot$2
(assert (= _4$snapshot$4@85@01 _4$snapshot$2@83@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _5$snapshot$4 == _5$snapshot$2
(declare-const $t@435@01 $Snap)
(assert (= $t@435@01 $Snap.unit))
; [eval] _5$snapshot$4 == _5$snapshot$2
(assert (= _5$snapshot$4@91@01 _5$snapshot$2@89@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _6$snapshot$6 == _6$snapshot$4
(declare-const $t@436@01 $Snap)
(assert (= $t@436@01 $Snap.unit))
; [eval] _6$snapshot$6 == _6$snapshot$4
(assert (= _6$snapshot$6@99@01 _6$snapshot$4@97@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _7$snapshot$4 == _7$snapshot$2
(declare-const $t@437@01 $Snap)
(assert (= $t@437@01 $Snap.unit))
; [eval] _7$snapshot$4 == _7$snapshot$2
(assert (= _7$snapshot$4@105@01 _7$snapshot$2@103@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _8$snapshot$4 == _8$snapshot$2
(declare-const $t@438@01 $Snap)
(assert (= $t@438@01 $Snap.unit))
; [eval] _8$snapshot$4 == _8$snapshot$2
(assert (= _8$snapshot$4@111@01 _8$snapshot$2@109@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _9$snapshot$3 == _9$snapshot$1
(declare-const $t@439@01 $Snap)
(assert (= $t@439@01 $Snap.unit))
; [eval] _9$snapshot$3 == _9$snapshot$1
(assert (= _9$snapshot$3@116@01 _9$snapshot$1@114@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale lft_function_call_1$snapshot$4 == lft_function_call_1$snapshot$2
(declare-const $t@440@01 $Snap)
(assert (= $t@440@01 $Snap.unit))
; [eval] lft_function_call_1$snapshot$4 == lft_function_call_1$snapshot$2
(assert (= lft_function_call_1$snapshot$4@150@01 lft_function_call_1$snapshot$2@148@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; label end_label
; [exec]
; end_label$marker := true
; [exec]
; inhale basic_block_marker$end_label$marker()
(declare-const $t@441@01 $Snap)
(assert (= $t@441@01 $Snap.unit))
; [eval] basic_block_marker$end_label$marker()
(assert (as basic_block_marker$end_label$marker<Bool>  Bool))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; label end_of_method
(pop) ; 9
; [eval] !true
; [then-branch: 89 | False | dead]
; [else-branch: 89 | True | live]
(set-option :timeout 0)
(push) ; 9
; [else-branch: 89 | True]
(pop) ; 9
(pop) ; 8
(push) ; 8
; [else-branch: 87 | !(destructor$Snap$Bool$$value[Bool](_5$snapshot$1@88@01))]
(assert (not (destructor$Snap$Bool$$value<Bool> _5$snapshot$1@88@01)))
(pop) ; 8
(pop) ; 7
; [eval] !!destructor$Snap$Bool$$value(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(_15$snapshot$1))
; [eval] !destructor$Snap$Bool$$value(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(_15$snapshot$1))
; [eval] destructor$Snap$Bool$$value(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(_15$snapshot$1))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(_15$snapshot$1)
(push) ; 7
(set-option :timeout 10)
(assert (not (not
  (destructor$Snap$Bool$$value<Bool> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> _15$snapshot$1@42@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [then-branch: 90 | destructor$Snap$Bool$$value[Bool](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](_15$snapshot$1@42@01)) | dead]
; [else-branch: 90 | !(destructor$Snap$Bool$$value[Bool](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](_15$snapshot$1@42@01))) | live]
(set-option :timeout 0)
(push) ; 7
; [else-branch: 90 | !(destructor$Snap$Bool$$value[Bool](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](_15$snapshot$1@42@01)))]
(assert (not
  (destructor$Snap$Bool$$value<Bool> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> _15$snapshot$1@42@01))))
(pop) ; 7
(pop) ; 6
; [eval] !true
; [then-branch: 91 | False | dead]
; [else-branch: 91 | True | live]
(push) ; 6
; [else-branch: 91 | True]
(pop) ; 6
(pop) ; 5
(pop) ; 4
; [eval] !!destructor$Snap$Bool$$value(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(_10$snapshot$1))
; [eval] !destructor$Snap$Bool$$value(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(_10$snapshot$1))
; [eval] destructor$Snap$Bool$$value(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(_10$snapshot$1))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(_10$snapshot$1)
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (destructor$Snap$Bool$$value<Bool> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> _10$snapshot$1@10@01)))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [then-branch: 92 | destructor$Snap$Bool$$value[Bool](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](_10$snapshot$1@10@01)) | dead]
; [else-branch: 92 | !(destructor$Snap$Bool$$value[Bool](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](_10$snapshot$1@10@01))) | live]
(set-option :timeout 0)
(push) ; 4
; [else-branch: 92 | !(destructor$Snap$Bool$$value[Bool](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](_10$snapshot$1@10@01)))]
(assert (not
  (destructor$Snap$Bool$$value<Bool> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> _10$snapshot$1@10@01))))
(pop) ; 4
(pop) ; 3
(push) ; 3
; [else-branch: 0 | destructor$Snap$Bool$$value[Bool](_2$snapshot$1@64@01)]
(assert (destructor$Snap$Bool$$value<Bool> _2$snapshot$1@64@01))
(pop) ; 3
; [eval] !!destructor$Snap$Bool$$value(_2$snapshot$1)
; [eval] !destructor$Snap$Bool$$value(_2$snapshot$1)
; [eval] destructor$Snap$Bool$$value(_2$snapshot$1)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (destructor$Snap$Bool$$value<Bool> _2$snapshot$1@64@01))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (destructor$Snap$Bool$$value<Bool> _2$snapshot$1@64@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; [then-branch: 93 | destructor$Snap$Bool$$value[Bool](_2$snapshot$1@64@01) | live]
; [else-branch: 93 | !(destructor$Snap$Bool$$value[Bool](_2$snapshot$1@64@01)) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 93 | destructor$Snap$Bool$$value[Bool](_2$snapshot$1@64@01)]
(assert (destructor$Snap$Bool$$value<Bool> _2$snapshot$1@64@01))
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [then-branch: 94 | True | live]
; [else-branch: 94 | False | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 94 | True]
; [exec]
; label label_2_custom
; [exec]
; label_2_custom$marker := true
; [exec]
; inhale basic_block_marker$label_2_custom$marker()
(declare-const $t@442@01 $Snap)
(assert (= $t@442@01 $Snap.unit))
; [eval] basic_block_marker$label_2_custom$marker()
(assert (as basic_block_marker$label_2_custom$marker<Bool>  Bool))
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
(declare-const $t@443@01 $Snap)
(assert (= $t@443@01 $Snap.unit))
; [eval] basic_block_marker$label_bb1$marker()
(assert (as basic_block_marker$label_bb1$marker<Bool>  Bool))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; write_place_constant$I64(_0$place(), _0$address, constructor$Snap$I64$(0))
; [eval] _0$place()
; [eval] constructor$Snap$I64$(0)
; [eval] compute_address(target_place, target_root_address)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _21$address@71@01
    (compute_address<Address> (as _0$place<Place>  Place) _0$address@0@01))
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
    _15$address@40@01
    (compute_address<Address> (as _0$place<Place>  Place) _0$address@0@01))
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
  _0$address@0@01
  (compute_address<Address> (as _0$place<Place>  Place) _0$address@0@01))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [eval] valid$Snap$I64(source_snapshot)
(declare-const $t@444@01 $Snap)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= (as _1$place<Place>  Place) (as _0$place<Place>  Place))
  (= _1$address@6@01 _0$address@0@01)
  (= _1$snapshot$0@7@01 (constructor$Snap$I64$<Snap$I64> 0)))))
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
; inhale _0$snapshot$1 == constructor$Snap$I64$(0)
(declare-const $t@445@01 $Snap)
(assert (= $t@445@01 $Snap.unit))
; [eval] _0$snapshot$1 == constructor$Snap$I64$(0)
; [eval] constructor$Snap$I64$(0)
(assert (= _0$snapshot$1@2@01 (constructor$Snap$I64$<Snap$I64> 0)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; label label__from__label_bb1__to__label_bb13
; [exec]
; inhale _0$snapshot$3 == _0$snapshot$1
(declare-const $t@446@01 $Snap)
(assert (= $t@446@01 $Snap.unit))
; [eval] _0$snapshot$3 == _0$snapshot$1
(assert (= _0$snapshot$3@4@01 _0$snapshot$1@2@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _10$snapshot$2 == _10$snapshot$0
(declare-const $t@447@01 $Snap)
(assert (= $t@447@01 $Snap.unit))
; [eval] _10$snapshot$2 == _10$snapshot$0
(assert (= _10$snapshot$2@11@01 _10$snapshot$0@9@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _11$snapshot$3 == _11$snapshot$0
(declare-const $t@448@01 $Snap)
(assert (= $t@448@01 $Snap.unit))
; [eval] _11$snapshot$3 == _11$snapshot$0
(assert (= _11$snapshot$3@17@01 _11$snapshot$0@14@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _12$snapshot$4 == _12$snapshot$0
(declare-const $t@449@01 $Snap)
(assert (= $t@449@01 $Snap.unit))
; [eval] _12$snapshot$4 == _12$snapshot$0
(assert (= _12$snapshot$4@24@01 _12$snapshot$0@20@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _13$snapshot$4 == _13$snapshot$0
(declare-const $t@450@01 $Snap)
(assert (= $t@450@01 $Snap.unit))
; [eval] _13$snapshot$4 == _13$snapshot$0
(assert (= _13$snapshot$4@31@01 _13$snapshot$0@27@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _14$snapshot$4 == _14$snapshot$0
(declare-const $t@451@01 $Snap)
(assert (= $t@451@01 $Snap.unit))
; [eval] _14$snapshot$4 == _14$snapshot$0
(assert (= _14$snapshot$4@38@01 _14$snapshot$0@34@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _15$snapshot$4 == _15$snapshot$0
(declare-const $t@452@01 $Snap)
(assert (= $t@452@01 $Snap.unit))
; [eval] _15$snapshot$4 == _15$snapshot$0
(assert (= _15$snapshot$4@45@01 _15$snapshot$0@41@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _18$snapshot$3 == _18$snapshot$0
(declare-const $t@453@01 $Snap)
(assert (= $t@453@01 $Snap.unit))
; [eval] _18$snapshot$3 == _18$snapshot$0
(assert (= _18$snapshot$3@54@01 _18$snapshot$0@51@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _19$snapshot$3 == _19$snapshot$0
(declare-const $t@454@01 $Snap)
(assert (= $t@454@01 $Snap.unit))
; [eval] _19$snapshot$3 == _19$snapshot$0
(assert (= _19$snapshot$3@60@01 _19$snapshot$0@57@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _20$snapshot$3 == _20$snapshot$0
(declare-const $t@455@01 $Snap)
(assert (= $t@455@01 $Snap.unit))
; [eval] _20$snapshot$3 == _20$snapshot$0
(assert (= _20$snapshot$3@69@01 _20$snapshot$0@66@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _21$snapshot$3 == _21$snapshot$0
(declare-const $t@456@01 $Snap)
(assert (= $t@456@01 $Snap.unit))
; [eval] _21$snapshot$3 == _21$snapshot$0
(assert (= _21$snapshot$3@75@01 _21$snapshot$0@72@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _4$snapshot$3 == _4$snapshot$0
(declare-const $t@457@01 $Snap)
(assert (= $t@457@01 $Snap.unit))
; [eval] _4$snapshot$3 == _4$snapshot$0
(assert (= _4$snapshot$3@84@01 _4$snapshot$0@81@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _5$snapshot$3 == _5$snapshot$0
(declare-const $t@458@01 $Snap)
(assert (= $t@458@01 $Snap.unit))
; [eval] _5$snapshot$3 == _5$snapshot$0
(assert (= _5$snapshot$3@90@01 _5$snapshot$0@87@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _6$snapshot$5 == _6$snapshot$0
(declare-const $t@459@01 $Snap)
(assert (= $t@459@01 $Snap.unit))
; [eval] _6$snapshot$5 == _6$snapshot$0
(assert (= _6$snapshot$5@98@01 _6$snapshot$0@93@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _7$snapshot$3 == _7$snapshot$0
(declare-const $t@460@01 $Snap)
(assert (= $t@460@01 $Snap.unit))
; [eval] _7$snapshot$3 == _7$snapshot$0
(assert (= _7$snapshot$3@104@01 _7$snapshot$0@101@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _8$snapshot$3 == _8$snapshot$0
(declare-const $t@461@01 $Snap)
(assert (= $t@461@01 $Snap.unit))
; [eval] _8$snapshot$3 == _8$snapshot$0
(assert (= _8$snapshot$3@110@01 _8$snapshot$0@107@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _9$snapshot$2 == _9$snapshot$0
(declare-const $t@462@01 $Snap)
(assert (= $t@462@01 $Snap.unit))
; [eval] _9$snapshot$2 == _9$snapshot$0
(assert (= _9$snapshot$2@115@01 _9$snapshot$0@113@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale lft_function_call_1$snapshot$3 == lft_function_call_1$snapshot$0
(declare-const $t@463@01 $Snap)
(assert (= $t@463@01 $Snap.unit))
; [eval] lft_function_call_1$snapshot$3 == lft_function_call_1$snapshot$0
(assert (= lft_function_call_1$snapshot$3@149@01 lft_function_call_1$snapshot$0@146@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; label label_bb13
; [exec]
; label_bb13$marker := true
; [exec]
; inhale basic_block_marker$label_bb13$marker()
(declare-const $t@464@01 $Snap)
(assert (= $t@464@01 $Snap.unit))
; [eval] basic_block_marker$label_bb13$marker()
(assert (as basic_block_marker$label_bb13$marker<Bool>  Bool))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; into_memory_block$Bool(_2$place(), _2$address, _2$snapshot$1)
; [eval] _2$place()
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= result_value@185@01 _2$snapshot$1@64@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [eval] compute_address(place, root_address)
; [eval] Size$Bool$()
(declare-const $t@465@01 $Snap)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _21$address@71@01
    (compute_address<Address> (as _2$place<Place>  Place) _2$address@62@01))
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
    _15$address@40@01
    (compute_address<Address> (as _2$place<Place>  Place) _2$address@62@01))
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
    _10$address@8@01
    (compute_address<Address> (as _2$place<Place>  Place) _2$address@62@01))
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
    _20$address@65@01
    (compute_address<Address> (as _2$place<Place>  Place) _2$address@62@01))
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
; exhale acc(MemoryBlock(_2$address, Size$Bool$()), write)
; [eval] Size$Bool$()
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _2$place<Place>  Place) _2$address@62@01)
  _2$address@62@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(MemoryBlockStackDrop(_2$address, Size$Bool$()), write)
; [eval] Size$Bool$()
; [exec]
; label return_label
; [exec]
; return_label$marker := true
; [exec]
; inhale basic_block_marker$return_label$marker()
(declare-const $t@466@01 $Snap)
(assert (= $t@466@01 $Snap.unit))
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
(declare-const $t@467@01 $Snap)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _20$address@65@01
    (compute_address<Address> (as _1$place<Place>  Place) _1$address@6@01))
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
    _10$address@8@01
    (compute_address<Address> (as _1$place<Place>  Place) _1$address@6@01))
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
    _15$address@40@01
    (compute_address<Address> (as _1$place<Place>  Place) _1$address@6@01))
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
    (compute_address<Address> (as _1$place<Place>  Place) _1$address@6@01))
  (=
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
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
; exhale acc(MemoryBlock(_1$address, Size$I64$()), write)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _1$place<Place>  Place) _1$address@6@01)
  _1$address@6@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(OwnedNonAliased$I64(_0$place(), _0$address, _0$snapshot$3), write) &&
;   valid$Snap$I64(_0$snapshot$3)
; [eval] _0$place()
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (constructor$Snap$I64$<Snap$I64> 0) _0$snapshot$3@4@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [eval] valid$Snap$I64(_0$snapshot$3)
(set-option :timeout 0)
(push) ; 5
(assert (not (valid$Snap$I64<Bool> _0$snapshot$3@4@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (valid$Snap$I64<Bool> _0$snapshot$3@4@01))
; [exec]
; lft_tok_sep_return$2(lft_1$snapshot$1, bw0$snapshot$0, bw1$snapshot$0, lifetime_token_perm_amount$0$snapshot$0 /
;   7)
; [eval] lifetime_token_perm_amount$0$snapshot$0 / 7
; [eval] none < rd_perm
(push) ; 5
(assert (not (or
  (= (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7)) $Perm.No)
  (< $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7))))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7)))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [eval] lft == intersect(Set(lft_1, lft_2))
; [eval] intersect(Set(lft_1, lft_2))
; [eval] Set(lft_1, lft_2)
(declare-const $t@468@01 $Snap)
(assert (= $t@468@01 ($Snap.combine ($Snap.first $t@468@01) ($Snap.second $t@468@01))))
(set-option :timeout 0)
(push) ; 5
(assert (not (or
  (= (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7)) $Perm.No)
  (< $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7))))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(declare-const $t@469@01 $Snap)
(assert (and
  (=>
    (<
      $Perm.No
      (-
        lifetime_token_perm_amount$0$snapshot$0@151@01
        ($Perm.min
          lifetime_token_perm_amount$0$snapshot$0@151@01
          (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7)))))
    (= $t@469@01 $t@167@01))
  (=>
    (< $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7)))
    (= $t@469@01 ($Snap.first $t@468@01)))))
(assert (<=
  $Perm.No
  (+
    (-
      lifetime_token_perm_amount$0$snapshot$0@151@01
      ($Perm.min
        lifetime_token_perm_amount$0$snapshot$0@151@01
        (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7))))
    (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7)))))
(push) ; 5
(assert (not (or
  (= (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7)) $Perm.No)
  (< $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7))))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(declare-const $t@470@01 $Snap)
(assert (and
  (=>
    (<
      $Perm.No
      (-
        lifetime_token_perm_amount$0$snapshot$0@151@01
        ($Perm.min
          lifetime_token_perm_amount$0$snapshot$0@151@01
          (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7)))))
    (= $t@470@01 $t@168@01))
  (=>
    (< $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7)))
    (= $t@470@01 ($Snap.second $t@468@01)))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; exhale acc(LifetimeToken(bw0$snapshot$0), lifetime_token_perm_amount$0$snapshot$0)
(set-option :timeout 0)
(push) ; 5
(assert (not (or
  (= lifetime_token_perm_amount$0$snapshot$0@151@01 $Perm.No)
  (< $Perm.No lifetime_token_perm_amount$0$snapshot$0@151@01))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  (-
    (+
      (-
        lifetime_token_perm_amount$0$snapshot$0@151@01
        ($Perm.min
          lifetime_token_perm_amount$0$snapshot$0@151@01
          (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7))))
      (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7)))
    ($Perm.min
      (+
        (-
          lifetime_token_perm_amount$0$snapshot$0@151@01
          ($Perm.min
            lifetime_token_perm_amount$0$snapshot$0@151@01
            (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7))))
        (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7)))
      lifetime_token_perm_amount$0$snapshot$0@151@01))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(assert (not (or
  (=
    (-
      lifetime_token_perm_amount$0$snapshot$0@151@01
      ($Perm.min
        (+
          (-
            lifetime_token_perm_amount$0$snapshot$0@151@01
            ($Perm.min
              lifetime_token_perm_amount$0$snapshot$0@151@01
              (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7))))
          (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7)))
        lifetime_token_perm_amount$0$snapshot$0@151@01))
    $Perm.No)
  (<
    (-
      lifetime_token_perm_amount$0$snapshot$0@151@01
      ($Perm.min
        (+
          (-
            lifetime_token_perm_amount$0$snapshot$0@151@01
            ($Perm.min
              lifetime_token_perm_amount$0$snapshot$0@151@01
              (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7))))
          (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7)))
        lifetime_token_perm_amount$0$snapshot$0@151@01))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No lifetime_token_perm_amount$0$snapshot$0@151@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(LifetimeToken(bw1$snapshot$0), lifetime_token_perm_amount$0$snapshot$0)
(set-option :timeout 0)
(push) ; 5
(assert (not (or
  (= lifetime_token_perm_amount$0$snapshot$0@151@01 $Perm.No)
  (< $Perm.No lifetime_token_perm_amount$0$snapshot$0@151@01))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  (-
    (+
      (-
        lifetime_token_perm_amount$0$snapshot$0@151@01
        ($Perm.min
          lifetime_token_perm_amount$0$snapshot$0@151@01
          (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7))))
      (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7)))
    ($Perm.min
      (+
        (-
          lifetime_token_perm_amount$0$snapshot$0@151@01
          ($Perm.min
            lifetime_token_perm_amount$0$snapshot$0@151@01
            (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7))))
        (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7)))
      lifetime_token_perm_amount$0$snapshot$0@151@01))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(assert (not (or
  (=
    (-
      lifetime_token_perm_amount$0$snapshot$0@151@01
      ($Perm.min
        (+
          (-
            lifetime_token_perm_amount$0$snapshot$0@151@01
            ($Perm.min
              lifetime_token_perm_amount$0$snapshot$0@151@01
              (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7))))
          (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7)))
        lifetime_token_perm_amount$0$snapshot$0@151@01))
    $Perm.No)
  (<
    (-
      lifetime_token_perm_amount$0$snapshot$0@151@01
      ($Perm.min
        (+
          (-
            lifetime_token_perm_amount$0$snapshot$0@151@01
            ($Perm.min
              lifetime_token_perm_amount$0$snapshot$0@151@01
              (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7))))
          (/ lifetime_token_perm_amount$0$snapshot$0@151@01 (to_real 7)))
        lifetime_token_perm_amount$0$snapshot$0@151@01))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No lifetime_token_perm_amount$0$snapshot$0@151@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [eval] label_bb12$marker && label_bb13$marker
; [then-branch: 95 | False | dead]
; [else-branch: 95 | True | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 95 | True]
(pop) ; 5
; [eval] !(label_bb12$marker && label_bb13$marker)
; [eval] label_bb12$marker && label_bb13$marker
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [then-branch: 96 | True | live]
; [else-branch: 96 | False | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 96 | True]
; [eval] label_bb12$marker && label_bb13$marker
; [then-branch: 97 | False | dead]
; [else-branch: 97 | True | live]
(push) ; 6
; [else-branch: 97 | True]
(pop) ; 6
; [eval] !(label_bb12$marker && label_bb13$marker)
; [eval] label_bb12$marker && label_bb13$marker
(push) ; 6
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [then-branch: 98 | True | live]
; [else-branch: 98 | False | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 98 | True]
; [exec]
; exhale acc(MemoryBlock(_10$address, Size$Tuple$$I64$Bool$$I64$Bool$$()), write)
; [eval] Size$Tuple$$I64$Bool$$I64$Bool$$()
; [eval] label_bb7$marker && (label_bb5$marker && (label_5_custom$marker && (label_bb9$marker && (label_bb10$marker && (label_8_custom$marker && (label_bb11$marker && (label_bb12$marker && label_bb13$marker)))))))
; [then-branch: 99 | False | dead]
; [else-branch: 99 | True | live]
(push) ; 7
; [else-branch: 99 | True]
(pop) ; 7
; [eval] !(label_bb7$marker && (label_bb5$marker && (label_5_custom$marker && (label_bb9$marker && (label_bb10$marker && (label_8_custom$marker && (label_bb11$marker && (label_bb12$marker && label_bb13$marker))))))))
; [eval] label_bb7$marker && (label_bb5$marker && (label_5_custom$marker && (label_bb9$marker && (label_bb10$marker && (label_8_custom$marker && (label_bb11$marker && (label_bb12$marker && label_bb13$marker)))))))
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [then-branch: 100 | True | live]
; [else-branch: 100 | False | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 100 | True]
; [eval] label_bb7$marker && (label_bb5$marker && (label_5_custom$marker && (label_bb9$marker && (label_bb10$marker && (label_8_custom$marker && (label_bb11$marker && (label_bb12$marker && label_bb13$marker)))))))
; [then-branch: 101 | False | dead]
; [else-branch: 101 | True | live]
(push) ; 8
; [else-branch: 101 | True]
(pop) ; 8
; [eval] !(label_bb7$marker && (label_bb5$marker && (label_5_custom$marker && (label_bb9$marker && (label_bb10$marker && (label_8_custom$marker && (label_bb11$marker && (label_bb12$marker && label_bb13$marker))))))))
; [eval] label_bb7$marker && (label_bb5$marker && (label_5_custom$marker && (label_bb9$marker && (label_bb10$marker && (label_8_custom$marker && (label_bb11$marker && (label_bb12$marker && label_bb13$marker)))))))
(push) ; 8
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [then-branch: 102 | True | live]
; [else-branch: 102 | False | dead]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 102 | True]
; [exec]
; exhale acc(MemoryBlock(_15$address, Size$Tuple$$I64$Bool$$I64$Bool$$()), write)
; [eval] Size$Tuple$$I64$Bool$$I64$Bool$$()
; [eval] label_bb12$marker && label_bb13$marker
; [then-branch: 103 | False | dead]
; [else-branch: 103 | True | live]
(push) ; 9
; [else-branch: 103 | True]
(pop) ; 9
; [eval] !(label_bb12$marker && label_bb13$marker)
; [eval] label_bb12$marker && label_bb13$marker
(push) ; 9
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [then-branch: 104 | True | live]
; [else-branch: 104 | False | dead]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 104 | True]
; [eval] label_bb12$marker && label_bb13$marker
; [then-branch: 105 | False | dead]
; [else-branch: 105 | True | live]
(push) ; 10
; [else-branch: 105 | True]
(pop) ; 10
; [eval] !(label_bb12$marker && label_bb13$marker)
; [eval] label_bb12$marker && label_bb13$marker
(push) ; 10
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [then-branch: 106 | True | live]
; [else-branch: 106 | False | dead]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 106 | True]
; [exec]
; exhale acc(MemoryBlock(_20$address, Size$Tuple$$I64$Bool$$I64$Bool$$()), write)
; [eval] Size$Tuple$$I64$Bool$$I64$Bool$$()
; [eval] label_bb12$marker && label_bb13$marker
; [then-branch: 107 | False | dead]
; [else-branch: 107 | True | live]
(push) ; 11
; [else-branch: 107 | True]
(pop) ; 11
; [eval] !(label_bb12$marker && label_bb13$marker)
; [eval] label_bb12$marker && label_bb13$marker
(push) ; 11
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [then-branch: 108 | True | live]
; [else-branch: 108 | False | dead]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 108 | True]
; [eval] label_bb12$marker && label_bb13$marker
; [then-branch: 109 | False | dead]
; [else-branch: 109 | True | live]
(push) ; 12
; [else-branch: 109 | True]
(pop) ; 12
; [eval] !(label_bb12$marker && label_bb13$marker)
; [eval] label_bb12$marker && label_bb13$marker
(push) ; 12
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [then-branch: 110 | True | live]
; [else-branch: 110 | False | dead]
(set-option :timeout 0)
(push) ; 12
; [then-branch: 110 | True]
; [exec]
; exhale acc(MemoryBlock(_21$address, Size$Tuple$$I64$Bool$$I64$Bool$$()), write)
; [eval] Size$Tuple$$I64$Bool$$I64$Bool$$()
; [exec]
; label label__from__return_label__to__end_label
; [exec]
; inhale _0$snapshot$4 == _0$snapshot$3
(declare-const $t@471@01 $Snap)
(assert (= $t@471@01 $Snap.unit))
; [eval] _0$snapshot$4 == _0$snapshot$3
(assert (= _0$snapshot$4@5@01 _0$snapshot$3@4@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale _10$snapshot$3 == _10$snapshot$2
(declare-const $t@472@01 $Snap)
(assert (= $t@472@01 $Snap.unit))
; [eval] _10$snapshot$3 == _10$snapshot$2
(assert (= _10$snapshot$3@12@01 _10$snapshot$2@11@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _11$snapshot$4 == _11$snapshot$3
(declare-const $t@473@01 $Snap)
(assert (= $t@473@01 $Snap.unit))
; [eval] _11$snapshot$4 == _11$snapshot$3
(assert (= _11$snapshot$4@18@01 _11$snapshot$3@17@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _12$snapshot$5 == _12$snapshot$4
(declare-const $t@474@01 $Snap)
(assert (= $t@474@01 $Snap.unit))
; [eval] _12$snapshot$5 == _12$snapshot$4
(assert (= _12$snapshot$5@25@01 _12$snapshot$4@24@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _13$snapshot$5 == _13$snapshot$4
(declare-const $t@475@01 $Snap)
(assert (= $t@475@01 $Snap.unit))
; [eval] _13$snapshot$5 == _13$snapshot$4
(assert (= _13$snapshot$5@32@01 _13$snapshot$4@31@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _14$snapshot$5 == _14$snapshot$4
(declare-const $t@476@01 $Snap)
(assert (= $t@476@01 $Snap.unit))
; [eval] _14$snapshot$5 == _14$snapshot$4
(assert (= _14$snapshot$5@39@01 _14$snapshot$4@38@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _15$snapshot$5 == _15$snapshot$4
(declare-const $t@477@01 $Snap)
(assert (= $t@477@01 $Snap.unit))
; [eval] _15$snapshot$5 == _15$snapshot$4
(assert (= _15$snapshot$5@46@01 _15$snapshot$4@45@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _18$snapshot$4 == _18$snapshot$3
(declare-const $t@478@01 $Snap)
(assert (= $t@478@01 $Snap.unit))
; [eval] _18$snapshot$4 == _18$snapshot$3
(assert (= _18$snapshot$4@55@01 _18$snapshot$3@54@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _19$snapshot$4 == _19$snapshot$3
(declare-const $t@479@01 $Snap)
(assert (= $t@479@01 $Snap.unit))
; [eval] _19$snapshot$4 == _19$snapshot$3
(assert (= _19$snapshot$4@61@01 _19$snapshot$3@60@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _20$snapshot$4 == _20$snapshot$3
(declare-const $t@480@01 $Snap)
(assert (= $t@480@01 $Snap.unit))
; [eval] _20$snapshot$4 == _20$snapshot$3
(assert (= _20$snapshot$4@70@01 _20$snapshot$3@69@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _21$snapshot$4 == _21$snapshot$3
(declare-const $t@481@01 $Snap)
(assert (= $t@481@01 $Snap.unit))
; [eval] _21$snapshot$4 == _21$snapshot$3
(assert (= _21$snapshot$4@76@01 _21$snapshot$3@75@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _4$snapshot$4 == _4$snapshot$3
(declare-const $t@482@01 $Snap)
(assert (= $t@482@01 $Snap.unit))
; [eval] _4$snapshot$4 == _4$snapshot$3
(assert (= _4$snapshot$4@85@01 _4$snapshot$3@84@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _5$snapshot$4 == _5$snapshot$3
(declare-const $t@483@01 $Snap)
(assert (= $t@483@01 $Snap.unit))
; [eval] _5$snapshot$4 == _5$snapshot$3
(assert (= _5$snapshot$4@91@01 _5$snapshot$3@90@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _6$snapshot$6 == _6$snapshot$5
(declare-const $t@484@01 $Snap)
(assert (= $t@484@01 $Snap.unit))
; [eval] _6$snapshot$6 == _6$snapshot$5
(assert (= _6$snapshot$6@99@01 _6$snapshot$5@98@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _7$snapshot$4 == _7$snapshot$3
(declare-const $t@485@01 $Snap)
(assert (= $t@485@01 $Snap.unit))
; [eval] _7$snapshot$4 == _7$snapshot$3
(assert (= _7$snapshot$4@105@01 _7$snapshot$3@104@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _8$snapshot$4 == _8$snapshot$3
(declare-const $t@486@01 $Snap)
(assert (= $t@486@01 $Snap.unit))
; [eval] _8$snapshot$4 == _8$snapshot$3
(assert (= _8$snapshot$4@111@01 _8$snapshot$3@110@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _9$snapshot$3 == _9$snapshot$2
(declare-const $t@487@01 $Snap)
(assert (= $t@487@01 $Snap.unit))
; [eval] _9$snapshot$3 == _9$snapshot$2
(assert (= _9$snapshot$3@116@01 _9$snapshot$2@115@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale lft_function_call_1$snapshot$4 == lft_function_call_1$snapshot$3
(declare-const $t@488@01 $Snap)
(assert (= $t@488@01 $Snap.unit))
; [eval] lft_function_call_1$snapshot$4 == lft_function_call_1$snapshot$3
(assert (= lft_function_call_1$snapshot$4@150@01 lft_function_call_1$snapshot$3@149@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; label end_label
; [exec]
; end_label$marker := true
; [exec]
; inhale basic_block_marker$end_label$marker()
(declare-const $t@489@01 $Snap)
(assert (= $t@489@01 $Snap.unit))
; [eval] basic_block_marker$end_label$marker()
(assert (as basic_block_marker$end_label$marker<Bool>  Bool))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; label end_of_method
(pop) ; 12
(pop) ; 11
(pop) ; 10
(pop) ; 9
(pop) ; 8
(pop) ; 7
(pop) ; 6
(pop) ; 5
(pop) ; 4
; [eval] !true
; [then-branch: 111 | False | dead]
; [else-branch: 111 | True | live]
(set-option :timeout 0)
(push) ; 4
; [else-branch: 111 | True]
(pop) ; 4
(pop) ; 3
(push) ; 3
; [else-branch: 93 | !(destructor$Snap$Bool$$value[Bool](_2$snapshot$1@64@01))]
(assert (not (destructor$Snap$Bool$$value<Bool> _2$snapshot$1@64@01)))
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- assign$Bool$BinaryOp$EqCmp$Move$I64$Constant$I64$$$$ ----------
(declare-const target_place@490@01 Place)
(declare-const target_address@491@01 Address)
(declare-const operand1_place@492@01 Place)
(declare-const operand1_root_address@493@01 Address)
(declare-const operand1_value@494@01 Snap$I64)
(declare-const operand2_value@495@01 Snap$I64)
(declare-const result_value@496@01 Snap$Bool)
(declare-const target_place@497@01 Place)
(declare-const target_address@498@01 Address)
(declare-const operand1_place@499@01 Place)
(declare-const operand1_root_address@500@01 Address)
(declare-const operand1_value@501@01 Snap$I64)
(declare-const operand2_value@502@01 Snap$I64)
(declare-const result_value@503@01 Snap$Bool)
(push) ; 1
(declare-const $t@504@01 $Snap)
(assert (= $t@504@01 ($Snap.combine ($Snap.first $t@504@01) ($Snap.second $t@504@01))))
; [eval] compute_address(target_place, target_address)
; [eval] Size$Bool$()
(assert (=
  ($Snap.second $t@504@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@504@01))
    ($Snap.second ($Snap.second $t@504@01)))))
(assert (=
  ($Snap.second ($Snap.second $t@504@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@504@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@504@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@504@01))) $Snap.unit))
; [eval] valid$Snap$I64(operand1_value)
(assert (valid$Snap$I64<Bool> operand1_value@501@01))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@504@01))) $Snap.unit))
; [eval] valid$Snap$I64(operand2_value)
(assert (valid$Snap$I64<Bool> operand2_value@502@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@505@01 $Snap)
(assert (= $t@505@01 ($Snap.combine ($Snap.first $t@505@01) ($Snap.second $t@505@01))))
(assert (=
  ($Snap.second $t@505@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@505@01))
    ($Snap.second ($Snap.second $t@505@01)))))
; [eval] compute_address(operand1_place, operand1_root_address)
; [eval] Size$I64$()
(assert (=
  ($Snap.second ($Snap.second $t@505@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@505@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@505@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@505@01))) $Snap.unit))
; [eval] result_value == constructor$Snap$Bool$EqCmp_I64(operand1_value, operand2_value)
; [eval] constructor$Snap$Bool$EqCmp_I64(operand1_value, operand2_value)
(assert (=
  result_value@503@01
  (constructor$Snap$Bool$EqCmp_I64<Snap$Bool> operand1_value@501@01 operand2_value@502@01)))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@505@01))) $Snap.unit))
; [eval] valid$Snap$Bool(result_value)
(assert (valid$Snap$Bool<Bool> result_value@503@01))
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- assign$Bool$BinaryOp$GeCmp$Move$I64$Constant$I64$$$$ ----------
(declare-const target_place@506@01 Place)
(declare-const target_address@507@01 Address)
(declare-const operand1_place@508@01 Place)
(declare-const operand1_root_address@509@01 Address)
(declare-const operand1_value@510@01 Snap$I64)
(declare-const operand2_value@511@01 Snap$I64)
(declare-const result_value@512@01 Snap$Bool)
(declare-const target_place@513@01 Place)
(declare-const target_address@514@01 Address)
(declare-const operand1_place@515@01 Place)
(declare-const operand1_root_address@516@01 Address)
(declare-const operand1_value@517@01 Snap$I64)
(declare-const operand2_value@518@01 Snap$I64)
(declare-const result_value@519@01 Snap$Bool)
(push) ; 1
(declare-const $t@520@01 $Snap)
(assert (= $t@520@01 ($Snap.combine ($Snap.first $t@520@01) ($Snap.second $t@520@01))))
; [eval] compute_address(target_place, target_address)
; [eval] Size$Bool$()
(assert (=
  ($Snap.second $t@520@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@520@01))
    ($Snap.second ($Snap.second $t@520@01)))))
(assert (=
  ($Snap.second ($Snap.second $t@520@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@520@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@520@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@520@01))) $Snap.unit))
; [eval] valid$Snap$I64(operand1_value)
(assert (valid$Snap$I64<Bool> operand1_value@517@01))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@520@01))) $Snap.unit))
; [eval] valid$Snap$I64(operand2_value)
(assert (valid$Snap$I64<Bool> operand2_value@518@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@521@01 $Snap)
(assert (= $t@521@01 ($Snap.combine ($Snap.first $t@521@01) ($Snap.second $t@521@01))))
(assert (=
  ($Snap.second $t@521@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@521@01))
    ($Snap.second ($Snap.second $t@521@01)))))
; [eval] compute_address(operand1_place, operand1_root_address)
; [eval] Size$I64$()
(assert (=
  ($Snap.second ($Snap.second $t@521@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@521@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@521@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@521@01))) $Snap.unit))
; [eval] result_value == constructor$Snap$Bool$GeCmp_I64(operand1_value, operand2_value)
; [eval] constructor$Snap$Bool$GeCmp_I64(operand1_value, operand2_value)
(assert (=
  result_value@519@01
  (constructor$Snap$Bool$GeCmp_I64<Snap$Bool> operand1_value@517@01 operand2_value@518@01)))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@521@01))) $Snap.unit))
; [eval] valid$Snap$Bool(result_value)
(assert (valid$Snap$Bool<Bool> result_value@519@01))
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- assign$Bool$BinaryOp$LtCmp$Move$I64$Move$I64$$$$ ----------
(declare-const target_place@522@01 Place)
(declare-const target_address@523@01 Address)
(declare-const operand1_place@524@01 Place)
(declare-const operand1_root_address@525@01 Address)
(declare-const operand1_value@526@01 Snap$I64)
(declare-const operand2_place@527@01 Place)
(declare-const operand2_root_address@528@01 Address)
(declare-const operand2_value@529@01 Snap$I64)
(declare-const result_value@530@01 Snap$Bool)
(declare-const target_place@531@01 Place)
(declare-const target_address@532@01 Address)
(declare-const operand1_place@533@01 Place)
(declare-const operand1_root_address@534@01 Address)
(declare-const operand1_value@535@01 Snap$I64)
(declare-const operand2_place@536@01 Place)
(declare-const operand2_root_address@537@01 Address)
(declare-const operand2_value@538@01 Snap$I64)
(declare-const result_value@539@01 Snap$Bool)
(push) ; 1
(declare-const $t@540@01 $Snap)
(assert (= $t@540@01 ($Snap.combine ($Snap.first $t@540@01) ($Snap.second $t@540@01))))
; [eval] compute_address(target_place, target_address)
; [eval] Size$Bool$()
(assert (=
  ($Snap.second $t@540@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@540@01))
    ($Snap.second ($Snap.second $t@540@01)))))
(assert (=
  ($Snap.second ($Snap.second $t@540@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@540@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@540@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@540@01))) $Snap.unit))
; [eval] valid$Snap$I64(operand1_value)
(assert (valid$Snap$I64<Bool> operand1_value@535@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@540@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@540@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@540@01)))))))
(push) ; 2
(set-option :timeout 10)
(assert (not (and
  (= operand1_place@533@01 operand2_place@536@01)
  (= operand1_root_address@534@01 operand2_root_address@537@01)
  (= operand1_value@535@01 operand2_value@538@01))))
(check-sat)
; unknown
(pop) ; 2
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@540@01))))
  $Snap.unit))
; [eval] valid$Snap$I64(operand2_value)
(assert (valid$Snap$I64<Bool> operand2_value@538@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@541@01 $Snap)
(assert (= $t@541@01 ($Snap.combine ($Snap.first $t@541@01) ($Snap.second $t@541@01))))
(assert (=
  ($Snap.second $t@541@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@541@01))
    ($Snap.second ($Snap.second $t@541@01)))))
; [eval] compute_address(operand1_place, operand1_root_address)
; [eval] Size$I64$()
(assert (=
  ($Snap.second ($Snap.second $t@541@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@541@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@541@01))))))
; [eval] compute_address(operand2_place, operand2_root_address)
; [eval] Size$I64$()
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> operand1_place@533@01 operand1_root_address@534@01)
  (compute_address<Address> operand2_place@536@01 operand2_root_address@537@01))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@541@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@541@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@541@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@541@01))))
  $Snap.unit))
; [eval] result_value == constructor$Snap$Bool$LtCmp_I64(operand1_value, operand2_value)
; [eval] constructor$Snap$Bool$LtCmp_I64(operand1_value, operand2_value)
(assert (=
  result_value@539@01
  (constructor$Snap$Bool$LtCmp_I64<Snap$Bool> operand1_value@535@01 operand2_value@538@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@541@01))))
  $Snap.unit))
; [eval] valid$Snap$Bool(result_value)
(assert (valid$Snap$Bool<Bool> result_value@539@01))
(pop) ; 2
(set-option :timeout 0)
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- assign$Bool$UnaryOp$Not$Move$Bool$$$$ ----------
(declare-const target_place@542@01 Place)
(declare-const target_address@543@01 Address)
(declare-const operand1_place@544@01 Place)
(declare-const operand1_root_address@545@01 Address)
(declare-const operand1_value@546@01 Snap$Bool)
(declare-const result_value@547@01 Snap$Bool)
(declare-const target_place@548@01 Place)
(declare-const target_address@549@01 Address)
(declare-const operand1_place@550@01 Place)
(declare-const operand1_root_address@551@01 Address)
(declare-const operand1_value@552@01 Snap$Bool)
(declare-const result_value@553@01 Snap$Bool)
(push) ; 1
(declare-const $t@554@01 $Snap)
(assert (= $t@554@01 ($Snap.combine ($Snap.first $t@554@01) ($Snap.second $t@554@01))))
; [eval] compute_address(target_place, target_address)
; [eval] Size$Bool$()
(assert (=
  ($Snap.second $t@554@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@554@01))
    ($Snap.second ($Snap.second $t@554@01)))))
(assert (= ($Snap.second ($Snap.second $t@554@01)) $Snap.unit))
; [eval] valid$Snap$Bool(operand1_value)
(assert (valid$Snap$Bool<Bool> operand1_value@552@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@555@01 $Snap)
(assert (= $t@555@01 ($Snap.combine ($Snap.first $t@555@01) ($Snap.second $t@555@01))))
(assert (=
  ($Snap.second $t@555@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@555@01))
    ($Snap.second ($Snap.second $t@555@01)))))
; [eval] compute_address(operand1_place, operand1_root_address)
; [eval] Size$Bool$()
(assert (=
  ($Snap.second ($Snap.second $t@555@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@555@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@555@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@555@01))) $Snap.unit))
; [eval] result_value == constructor$Snap$Bool$Not_Bool(operand1_value)
; [eval] constructor$Snap$Bool$Not_Bool(operand1_value)
(assert (=
  result_value@553@01
  (constructor$Snap$Bool$Not_Bool<Snap$Bool> operand1_value@552@01)))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@555@01))) $Snap.unit))
; [eval] valid$Snap$Bool(result_value)
(assert (valid$Snap$Bool<Bool> result_value@553@01))
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- assign$Tuple$$I64$Bool$$I64$Bool$$CheckedBinaryOp$Add$Constant$I64$Copy$I64$$$$ ----------
(declare-const target_place@556@01 Place)
(declare-const target_address@557@01 Address)
(declare-const operand1_value@558@01 Snap$I64)
(declare-const operand2_place@559@01 Place)
(declare-const operand2_root_address@560@01 Address)
(declare-const operand2_value@561@01 Snap$I64)
(declare-const result_value@562@01 Snap$Tuple$$I64$Bool$$I64$Bool$)
(declare-const target_place@563@01 Place)
(declare-const target_address@564@01 Address)
(declare-const operand1_value@565@01 Snap$I64)
(declare-const operand2_place@566@01 Place)
(declare-const operand2_root_address@567@01 Address)
(declare-const operand2_value@568@01 Snap$I64)
(declare-const result_value@569@01 Snap$Tuple$$I64$Bool$$I64$Bool$)
(push) ; 1
(declare-const $t@570@01 $Snap)
(assert (= $t@570@01 ($Snap.combine ($Snap.first $t@570@01) ($Snap.second $t@570@01))))
; [eval] compute_address(target_place, target_address)
; [eval] Size$Tuple$$I64$Bool$$I64$Bool$$()
(assert (=
  ($Snap.second $t@570@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@570@01))
    ($Snap.second ($Snap.second $t@570@01)))))
(assert (= ($Snap.first ($Snap.second $t@570@01)) $Snap.unit))
; [eval] valid$Snap$I64(operand1_value)
(assert (valid$Snap$I64<Bool> operand1_value@565@01))
(assert (=
  ($Snap.second ($Snap.second $t@570@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@570@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@570@01))))))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@570@01))) $Snap.unit))
; [eval] valid$Snap$I64(operand2_value)
(assert (valid$Snap$I64<Bool> operand2_value@568@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@571@01 $Snap)
(assert (= $t@571@01 ($Snap.combine ($Snap.first $t@571@01) ($Snap.second $t@571@01))))
; [eval] compute_address(target_place, target_address)
; [eval] PaddingSize$Tuple$$I64$Bool$$I64$Bool$$()
(assert (=
  ($Snap.second $t@571@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@571@01))
    ($Snap.second ($Snap.second $t@571@01)))))
; [eval] field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(compute_address(target_place, target_address))
; [eval] compute_address(target_place, target_address)
; [eval] Size$I64$()
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> target_place@563@01 target_address@564@01)
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> target_place@563@01 target_address@564@01)))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second $t@571@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@571@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@571@01))))))
; [eval] field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(target_place)
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(result_value)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@571@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@571@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@571@01)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@571@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@571@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@571@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@571@01)))))
  $Snap.unit))
; [eval] valid$Snap$I64(constructor$Snap$I64$Add_I64(operand1_value, operand2_value)) ==> destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(result_value) == constructor$Snap$I64$Add_I64(operand1_value, operand2_value)
; [eval] valid$Snap$I64(constructor$Snap$I64$Add_I64(operand1_value, operand2_value))
; [eval] constructor$Snap$I64$Add_I64(operand1_value, operand2_value)
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (valid$Snap$I64<Bool> (constructor$Snap$I64$Add_I64<Snap$I64> operand1_value@565@01 operand2_value@568@01)))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (valid$Snap$I64<Bool> (constructor$Snap$I64$Add_I64<Snap$I64> operand1_value@565@01 operand2_value@568@01))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [then-branch: 112 | valid$Snap$I64[Bool](constructor$Snap$I64$Add_I64[Snap$I64](operand1_value@565@01, operand2_value@568@01)) | live]
; [else-branch: 112 | !(valid$Snap$I64[Bool](constructor$Snap$I64$Add_I64[Snap$I64](operand1_value@565@01, operand2_value@568@01))) | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 112 | valid$Snap$I64[Bool](constructor$Snap$I64$Add_I64[Snap$I64](operand1_value@565@01, operand2_value@568@01))]
(assert (valid$Snap$I64<Bool> (constructor$Snap$I64$Add_I64<Snap$I64> operand1_value@565@01 operand2_value@568@01)))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(result_value) == constructor$Snap$I64$Add_I64(operand1_value, operand2_value)
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(result_value)
; [eval] constructor$Snap$I64$Add_I64(operand1_value, operand2_value)
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (valid$Snap$I64<Bool> (constructor$Snap$I64$Add_I64<Snap$I64> operand1_value@565@01 operand2_value@568@01)))
(assert (=>
  (valid$Snap$I64<Bool> (constructor$Snap$I64$Add_I64<Snap$I64> operand1_value@565@01 operand2_value@568@01))
  (=
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> result_value@569@01)
    (constructor$Snap$I64$Add_I64<Snap$I64> operand1_value@565@01 operand2_value@568@01))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@571@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@571@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@571@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@571@01))))))
  $Snap.unit))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(result_value) == constructor$Snap$Bool$(!valid$Snap$I64(constructor$Snap$I64$Add_I64(operand1_value, operand2_value)))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(result_value)
; [eval] constructor$Snap$Bool$(!valid$Snap$I64(constructor$Snap$I64$Add_I64(operand1_value, operand2_value)))
; [eval] !valid$Snap$I64(constructor$Snap$I64$Add_I64(operand1_value, operand2_value))
; [eval] valid$Snap$I64(constructor$Snap$I64$Add_I64(operand1_value, operand2_value))
; [eval] constructor$Snap$I64$Add_I64(operand1_value, operand2_value)
(assert (=
  (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> result_value@569@01)
  (constructor$Snap$Bool$<Snap$Bool> (not
    (valid$Snap$I64<Bool> (constructor$Snap$I64$Add_I64<Snap$I64> operand1_value@565@01 operand2_value@568@01))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@571@01))))))
  $Snap.unit))
; [eval] MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(compute_address(target_place, target_address)), Size$I64$()) == to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(result_value))
; [eval] MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(compute_address(target_place, target_address)), Size$I64$())
; [eval] field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(compute_address(target_place, target_address))
; [eval] compute_address(target_place, target_address)
; [eval] Size$I64$()
(push) ; 3
(declare-const $k@572@01 $Perm)
(assert ($Perm.isReadVar $k@572@01))
(assert (< $k@572@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@572@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@572@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@571@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> target_place@563@01 target_address@564@01)) (as Size$I64$<Snap$Usize>  Snap$Usize)))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@572@01))
(assert (and
  (< $k@572@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@572@01))
  (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@571@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> target_place@563@01 target_address@564@01)) (as Size$I64$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(result_value))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(result_value)
(assert (=
  (MemoryBlock$bytes ($Snap.first ($Snap.second $t@571@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> target_place@563@01 target_address@564@01)) (as Size$I64$<Snap$Usize>  Snap$Usize))
  (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> result_value@569@01))))
(pop) ; 2
(set-option :timeout 0)
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- assign$Tuple$$I64$Bool$$I64$Bool$$CheckedBinaryOp$Sub$Copy$I64$Constant$I64$$$$ ----------
(declare-const target_place@573@01 Place)
(declare-const target_address@574@01 Address)
(declare-const operand1_place@575@01 Place)
(declare-const operand1_root_address@576@01 Address)
(declare-const operand1_value@577@01 Snap$I64)
(declare-const operand2_value@578@01 Snap$I64)
(declare-const result_value@579@01 Snap$Tuple$$I64$Bool$$I64$Bool$)
(declare-const target_place@580@01 Place)
(declare-const target_address@581@01 Address)
(declare-const operand1_place@582@01 Place)
(declare-const operand1_root_address@583@01 Address)
(declare-const operand1_value@584@01 Snap$I64)
(declare-const operand2_value@585@01 Snap$I64)
(declare-const result_value@586@01 Snap$Tuple$$I64$Bool$$I64$Bool$)
(push) ; 1
(declare-const $t@587@01 $Snap)
(assert (= $t@587@01 ($Snap.combine ($Snap.first $t@587@01) ($Snap.second $t@587@01))))
; [eval] compute_address(target_place, target_address)
; [eval] Size$Tuple$$I64$Bool$$I64$Bool$$()
(assert (=
  ($Snap.second $t@587@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@587@01))
    ($Snap.second ($Snap.second $t@587@01)))))
(assert (=
  ($Snap.second ($Snap.second $t@587@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@587@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@587@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@587@01))) $Snap.unit))
; [eval] valid$Snap$I64(operand1_value)
(assert (valid$Snap$I64<Bool> operand1_value@584@01))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@587@01))) $Snap.unit))
; [eval] valid$Snap$I64(operand2_value)
(assert (valid$Snap$I64<Bool> operand2_value@585@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@588@01 $Snap)
(assert (= $t@588@01 ($Snap.combine ($Snap.first $t@588@01) ($Snap.second $t@588@01))))
; [eval] compute_address(target_place, target_address)
; [eval] PaddingSize$Tuple$$I64$Bool$$I64$Bool$$()
(assert (=
  ($Snap.second $t@588@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@588@01))
    ($Snap.second ($Snap.second $t@588@01)))))
; [eval] field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(compute_address(target_place, target_address))
; [eval] compute_address(target_place, target_address)
; [eval] Size$I64$()
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> target_place@580@01 target_address@581@01)
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> target_place@580@01 target_address@581@01)))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second $t@588@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@588@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@588@01))))))
; [eval] field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(target_place)
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(result_value)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@588@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@588@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@588@01)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@588@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@588@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@588@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@588@01)))))
  $Snap.unit))
; [eval] valid$Snap$I64(constructor$Snap$I64$Sub_I64(operand1_value, operand2_value)) ==> destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(result_value) == constructor$Snap$I64$Sub_I64(operand1_value, operand2_value)
; [eval] valid$Snap$I64(constructor$Snap$I64$Sub_I64(operand1_value, operand2_value))
; [eval] constructor$Snap$I64$Sub_I64(operand1_value, operand2_value)
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (valid$Snap$I64<Bool> (constructor$Snap$I64$Sub_I64<Snap$I64> operand1_value@584@01 operand2_value@585@01)))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (valid$Snap$I64<Bool> (constructor$Snap$I64$Sub_I64<Snap$I64> operand1_value@584@01 operand2_value@585@01))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [then-branch: 113 | valid$Snap$I64[Bool](constructor$Snap$I64$Sub_I64[Snap$I64](operand1_value@584@01, operand2_value@585@01)) | live]
; [else-branch: 113 | !(valid$Snap$I64[Bool](constructor$Snap$I64$Sub_I64[Snap$I64](operand1_value@584@01, operand2_value@585@01))) | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 113 | valid$Snap$I64[Bool](constructor$Snap$I64$Sub_I64[Snap$I64](operand1_value@584@01, operand2_value@585@01))]
(assert (valid$Snap$I64<Bool> (constructor$Snap$I64$Sub_I64<Snap$I64> operand1_value@584@01 operand2_value@585@01)))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(result_value) == constructor$Snap$I64$Sub_I64(operand1_value, operand2_value)
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(result_value)
; [eval] constructor$Snap$I64$Sub_I64(operand1_value, operand2_value)
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (valid$Snap$I64<Bool> (constructor$Snap$I64$Sub_I64<Snap$I64> operand1_value@584@01 operand2_value@585@01)))
(assert (=>
  (valid$Snap$I64<Bool> (constructor$Snap$I64$Sub_I64<Snap$I64> operand1_value@584@01 operand2_value@585@01))
  (=
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> result_value@586@01)
    (constructor$Snap$I64$Sub_I64<Snap$I64> operand1_value@584@01 operand2_value@585@01))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@588@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@588@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@588@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@588@01))))))
  $Snap.unit))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(result_value) == constructor$Snap$Bool$(!valid$Snap$I64(constructor$Snap$I64$Sub_I64(operand1_value, operand2_value)))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(result_value)
; [eval] constructor$Snap$Bool$(!valid$Snap$I64(constructor$Snap$I64$Sub_I64(operand1_value, operand2_value)))
; [eval] !valid$Snap$I64(constructor$Snap$I64$Sub_I64(operand1_value, operand2_value))
; [eval] valid$Snap$I64(constructor$Snap$I64$Sub_I64(operand1_value, operand2_value))
; [eval] constructor$Snap$I64$Sub_I64(operand1_value, operand2_value)
(assert (=
  (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> result_value@586@01)
  (constructor$Snap$Bool$<Snap$Bool> (not
    (valid$Snap$I64<Bool> (constructor$Snap$I64$Sub_I64<Snap$I64> operand1_value@584@01 operand2_value@585@01))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@588@01))))))
  $Snap.unit))
; [eval] MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(compute_address(target_place, target_address)), Size$I64$()) == to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(result_value))
; [eval] MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(compute_address(target_place, target_address)), Size$I64$())
; [eval] field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(compute_address(target_place, target_address))
; [eval] compute_address(target_place, target_address)
; [eval] Size$I64$()
(push) ; 3
(declare-const $k@589@01 $Perm)
(assert ($Perm.isReadVar $k@589@01))
(assert (< $k@589@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@589@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@589@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@588@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> target_place@580@01 target_address@581@01)) (as Size$I64$<Snap$Usize>  Snap$Usize)))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@589@01))
(assert (and
  (< $k@589@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@589@01))
  (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@588@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> target_place@580@01 target_address@581@01)) (as Size$I64$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(result_value))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(result_value)
(assert (=
  (MemoryBlock$bytes ($Snap.first ($Snap.second $t@588@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> target_place@580@01 target_address@581@01)) (as Size$I64$<Snap$Usize>  Snap$Usize))
  (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> result_value@586@01))))
(pop) ; 2
(set-option :timeout 0)
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- consume$Move$I64 ----------
(declare-const operand1_place@590@01 Place)
(declare-const operand1_root_address@591@01 Address)
(declare-const operand1_value@592@01 Snap$I64)
(declare-const operand1_place@593@01 Place)
(declare-const operand1_root_address@594@01 Address)
(declare-const operand1_value@595@01 Snap$I64)
(push) ; 1
(declare-const $t@596@01 $Snap)
(assert (= $t@596@01 ($Snap.combine ($Snap.first $t@596@01) ($Snap.second $t@596@01))))
(assert (= ($Snap.second $t@596@01) $Snap.unit))
; [eval] valid$Snap$I64(operand1_value)
(assert (valid$Snap$I64<Bool> operand1_value@595@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
; [eval] compute_address(operand1_place, operand1_root_address)
; [eval] Size$I64$()
(declare-const $t@597@01 $Snap)
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- copy_place$I64 ----------
(declare-const target_place@598@01 Place)
(declare-const target_root_address@599@01 Address)
(declare-const source_place@600@01 Place)
(declare-const source_root_address@601@01 Address)
(declare-const source_snapshot@602@01 Snap$I64)
(declare-const source_permission_amount@603@01 $Perm)
(declare-const target_place@604@01 Place)
(declare-const target_root_address@605@01 Address)
(declare-const source_place@606@01 Place)
(declare-const source_root_address@607@01 Address)
(declare-const source_snapshot@608@01 Snap$I64)
(declare-const source_permission_amount@609@01 $Perm)
(push) ; 1
(declare-const $t@610@01 $Snap)
(assert (= $t@610@01 ($Snap.combine ($Snap.first $t@610@01) ($Snap.second $t@610@01))))
(assert (= ($Snap.first $t@610@01) $Snap.unit))
; [eval] none < source_permission_amount
(assert (< $Perm.No source_permission_amount@609@01))
(assert (=
  ($Snap.second $t@610@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@610@01))
    ($Snap.second ($Snap.second $t@610@01)))))
; [eval] compute_address(target_place, target_root_address)
; [eval] Size$I64$()
(push) ; 2
(assert (not (or
  (= source_permission_amount@609@01 $Perm.No)
  (< $Perm.No source_permission_amount@609@01))))
(check-sat)
; unsat
(pop) ; 2
; 0.00s
; (get-info :all-statistics)
(assert (<= $Perm.No source_permission_amount@609@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@611@01 $Snap)
(assert (= $t@611@01 ($Snap.combine ($Snap.first $t@611@01) ($Snap.second $t@611@01))))
(push) ; 3
(assert (not (or
  (= source_permission_amount@609@01 $Perm.No)
  (< $Perm.No source_permission_amount@609@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second $t@611@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@611@01))
    ($Snap.second ($Snap.second $t@611@01)))))
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (= source_place@606@01 target_place@604@01)
  (= source_root_address@607@01 target_root_address@605@01))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (= ($Snap.second ($Snap.second $t@611@01)) $Snap.unit))
; [eval] valid$Snap$I64(source_snapshot)
(assert (valid$Snap$I64<Bool> source_snapshot@608@01))
(pop) ; 2
(set-option :timeout 0)
(push) ; 2
; [exec]
; unfold acc(OwnedNonAliased$I64(source_place, source_root_address, source_snapshot), source_permission_amount)
(push) ; 3
(assert (not (< $Perm.No source_permission_amount@609@01)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No source_permission_amount@609@01)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second $t@610@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@610@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@610@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@610@01))) $Snap.unit))
; [eval] valid$Snap$I64(snapshot)
(assert (valid$Snap$I64<Bool> source_snapshot@608@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@610@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@610@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@610@01)))))))
; [eval] compute_address(place, root_address)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> target_place@604@01 target_root_address@605@01)
  (compute_address<Address> source_place@606@01 source_root_address@607@01))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@610@01))))
  $Snap.unit))
; [eval] MemoryBlock$bytes(compute_address(place, root_address), Size$I64$()) == to_bytes$I64(snapshot)
; [eval] MemoryBlock$bytes(compute_address(place, root_address), Size$I64$())
; [eval] compute_address(place, root_address)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 3
(declare-const $k@612@01 $Perm)
(assert ($Perm.isReadVar $k@612@01))
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= source_permission_amount@609@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (< (* $k@612@01 source_permission_amount@609@01) source_permission_amount@609@01))
(assert (<=
  $Perm.No
  (-
    source_permission_amount@609@01
    (* $k@612@01 source_permission_amount@609@01))))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (* $k@612@01 source_permission_amount@609@01))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@610@01)))) (compute_address<Address> source_place@606@01 source_root_address@607@01) (as Size$I64$<Snap$Usize>  Snap$Usize)))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@612@01))
(assert (and
  (<
    (* $k@612@01 source_permission_amount@609@01)
    source_permission_amount@609@01)
  (<=
    $Perm.No
    (-
      source_permission_amount@609@01
      (* $k@612@01 source_permission_amount@609@01)))
  (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@610@01)))) (compute_address<Address> source_place@606@01 source_root_address@607@01) (as Size$I64$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$I64(snapshot)
(assert (=
  (MemoryBlock$bytes ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@610@01)))) (compute_address<Address> source_place@606@01 source_root_address@607@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
  (to_bytes$I64<Bytes> source_snapshot@608@01)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (OwnedNonAliased$I64%trigger ($Snap.second ($Snap.second $t@610@01)) source_place@606@01 source_root_address@607@01 source_snapshot@608@01))
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
  (= source_permission_amount@609@01 $Perm.No)
  (< $Perm.No source_permission_amount@609@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No source_permission_amount@609@01)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(declare-const $t@613@01 $Snap)
(assert (= $t@613@01 ($Snap.combine ($Snap.first $t@613@01) ($Snap.second $t@613@01))))
; [eval] Size$I64$()
(assert (=
  ($Snap.second $t@613@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@613@01))
    ($Snap.second ($Snap.second $t@613@01)))))
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 3
(assert (not (or
  (= source_permission_amount@609@01 $Perm.No)
  (< $Perm.No source_permission_amount@609@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> target_place@604@01 target_root_address@605@01)
  (compute_address<Address> source_place@606@01 source_root_address@607@01))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second $t@613@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@613@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@613@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@613@01))) $Snap.unit))
; [eval] MemoryBlock$bytes(source_address, Size$I64$()) == old(MemoryBlock$bytes(source_address, Size$I64$()))
; [eval] MemoryBlock$bytes(source_address, Size$I64$())
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 3
(declare-const $k@614@01 $Perm)
(assert ($Perm.isReadVar $k@614@01))
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= source_permission_amount@609@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (< $k@614@01 source_permission_amount@609@01))
(assert (<= $Perm.No (- source_permission_amount@609@01 $k@614@01)))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@614@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@613@01)) (compute_address<Address> source_place@606@01 source_root_address@607@01) (as Size$I64$<Snap$Usize>  Snap$Usize)))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@614@01))
(assert (and
  (< $k@614@01 source_permission_amount@609@01)
  (<= $Perm.No (- source_permission_amount@609@01 $k@614@01))
  (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@613@01)) (compute_address<Address> source_place@606@01 source_root_address@607@01) (as Size$I64$<Snap$Usize>  Snap$Usize))))
; [eval] old(MemoryBlock$bytes(source_address, Size$I64$()))
; [eval] MemoryBlock$bytes(source_address, Size$I64$())
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 3
(declare-const $k@615@01 $Perm)
(assert ($Perm.isReadVar $k@615@01))
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= source_permission_amount@609@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (< $k@615@01 source_permission_amount@609@01))
(assert (<= $Perm.No (- source_permission_amount@609@01 $k@615@01)))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@615@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@615@01))
(assert (and
  (< $k@615@01 source_permission_amount@609@01)
  (<= $Perm.No (- source_permission_amount@609@01 $k@615@01))))
(assert (=
  (MemoryBlock$bytes ($Snap.first ($Snap.second $t@613@01)) (compute_address<Address> source_place@606@01 source_root_address@607@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
  (MemoryBlock$bytes ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@610@01)))) (compute_address<Address> source_place@606@01 source_root_address@607@01) (as Size$I64$<Snap$Usize>  Snap$Usize))))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@613@01))) $Snap.unit))
; [eval] MemoryBlock$bytes(target_address, Size$I64$()) == MemoryBlock$bytes(source_address, Size$I64$())
; [eval] MemoryBlock$bytes(target_address, Size$I64$())
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 3
(declare-const $k@616@01 $Perm)
(assert ($Perm.isReadVar $k@616@01))
(assert (< $k@616@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@616@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@616@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first $t@613@01) (compute_address<Address> target_place@604@01 target_root_address@605@01) (as Size$I64$<Snap$Usize>  Snap$Usize)))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@616@01))
(assert (and
  (< $k@616@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@616@01))
  (MemoryBlock$bytes%precondition ($Snap.first $t@613@01) (compute_address<Address> target_place@604@01 target_root_address@605@01) (as Size$I64$<Snap$Usize>  Snap$Usize))))
; [eval] MemoryBlock$bytes(source_address, Size$I64$())
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 3
(declare-const $k@617@01 $Perm)
(assert ($Perm.isReadVar $k@617@01))
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= source_permission_amount@609@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (< $k@617@01 source_permission_amount@609@01))
(assert (<= $Perm.No (- source_permission_amount@609@01 $k@617@01)))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@617@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@617@01))
(assert (and
  (< $k@617@01 source_permission_amount@609@01)
  (<= $Perm.No (- source_permission_amount@609@01 $k@617@01))))
(assert (=
  (MemoryBlock$bytes ($Snap.first $t@613@01) (compute_address<Address> target_place@604@01 target_root_address@605@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
  (MemoryBlock$bytes ($Snap.first ($Snap.second $t@613@01)) (compute_address<Address> source_place@606@01 source_root_address@607@01) (as Size$I64$<Snap$Usize>  Snap$Usize))))
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
(declare-const $k@618@01 $Perm)
(assert ($Perm.isReadVar $k@618@01))
(assert (< $k@618@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@618@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@618@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@618@01))
(assert (and (< $k@618@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@618@01))))
; [eval] to_bytes$I64(snapshot)
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  (MemoryBlock$bytes ($Snap.first $t@613@01) (compute_address<Address> target_place@604@01 target_root_address@605@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
  (to_bytes$I64<Bytes> source_snapshot@608@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (=
  (MemoryBlock$bytes ($Snap.first $t@613@01) (compute_address<Address> target_place@604@01 target_root_address@605@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
  (to_bytes$I64<Bytes> source_snapshot@608@01)))
(assert (OwnedNonAliased$I64%trigger ($Snap.combine
  $Snap.unit
  ($Snap.combine ($Snap.first $t@613@01) $Snap.unit)) target_place@604@01 target_root_address@605@01 source_snapshot@608@01))
; [exec]
; fold acc(OwnedNonAliased$I64(source_place, source_root_address, source_snapshot), source_permission_amount)
(push) ; 3
(assert (not (< $Perm.No source_permission_amount@609@01)))
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
(assert (not (< $Perm.No source_permission_amount@609@01)))
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
(declare-const $k@619@01 $Perm)
(assert ($Perm.isReadVar $k@619@01))
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= source_permission_amount@609@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (< (* $k@619@01 source_permission_amount@609@01) source_permission_amount@609@01))
(assert (<=
  $Perm.No
  (-
    source_permission_amount@609@01
    (* $k@619@01 source_permission_amount@609@01))))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (* $k@619@01 source_permission_amount@609@01))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@619@01))
(assert (and
  (<
    (* $k@619@01 source_permission_amount@609@01)
    source_permission_amount@609@01)
  (<=
    $Perm.No
    (-
      source_permission_amount@609@01
      (* $k@619@01 source_permission_amount@609@01)))))
; [eval] to_bytes$I64(snapshot)
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  (MemoryBlock$bytes ($Snap.first ($Snap.second $t@613@01)) (compute_address<Address> source_place@606@01 source_root_address@607@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
  (to_bytes$I64<Bytes> source_snapshot@608@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (=
  (MemoryBlock$bytes ($Snap.first ($Snap.second $t@613@01)) (compute_address<Address> source_place@606@01 source_root_address@607@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
  (to_bytes$I64<Bytes> source_snapshot@608@01)))
(assert (OwnedNonAliased$I64%trigger ($Snap.combine
  $Snap.unit
  ($Snap.combine ($Snap.first ($Snap.second $t@613@01)) $Snap.unit)) source_place@606@01 source_root_address@607@01 source_snapshot@608@01))
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (= target_place@604@01 source_place@606@01)
  (= target_root_address@605@01 source_root_address@607@01))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(assert (not (or
  (= source_permission_amount@609@01 $Perm.No)
  (< $Perm.No source_permission_amount@609@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No source_permission_amount@609@01)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; [eval] valid$Snap$I64(source_snapshot)
(pop) ; 2
(pop) ; 1
; ---------- into_memory_block$Bool ----------
(declare-const place@620@01 Place)
(declare-const root_address@621@01 Address)
(declare-const snapshot@622@01 Snap$Bool)
(declare-const place@623@01 Place)
(declare-const root_address@624@01 Address)
(declare-const snapshot@625@01 Snap$Bool)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@626@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
; [eval] compute_address(place, root_address)
; [eval] Size$Bool$()
(declare-const $t@627@01 $Snap)
(pop) ; 2
(push) ; 2
; [exec]
; unfold acc(OwnedNonAliased$Bool(place, root_address, snapshot), write)
(assert (= $t@626@01 ($Snap.combine ($Snap.first $t@626@01) ($Snap.second $t@626@01))))
(assert (= ($Snap.first $t@626@01) $Snap.unit))
; [eval] valid$Snap$Bool(snapshot)
(assert (valid$Snap$Bool<Bool> snapshot@625@01))
(assert (=
  ($Snap.second $t@626@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@626@01))
    ($Snap.second ($Snap.second $t@626@01)))))
; [eval] compute_address(place, root_address)
; [eval] Size$Bool$()
(assert (= ($Snap.second ($Snap.second $t@626@01)) $Snap.unit))
; [eval] MemoryBlock$bytes(compute_address(place, root_address), Size$Bool$()) == to_bytes$Bool(snapshot)
; [eval] MemoryBlock$bytes(compute_address(place, root_address), Size$Bool$())
; [eval] compute_address(place, root_address)
; [eval] Size$Bool$()
(push) ; 3
(declare-const $k@628@01 $Perm)
(assert ($Perm.isReadVar $k@628@01))
(assert (< $k@628@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@628@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@628@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@626@01)) (compute_address<Address> place@623@01 root_address@624@01) (as Size$Bool$<Snap$Usize>  Snap$Usize)))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@628@01))
(assert (and
  (< $k@628@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@628@01))
  (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@626@01)) (compute_address<Address> place@623@01 root_address@624@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$Bool(snapshot)
(assert (=
  (MemoryBlock$bytes ($Snap.first ($Snap.second $t@626@01)) (compute_address<Address> place@623@01 root_address@624@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
  (to_bytes$Bool<Bytes> snapshot@625@01)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (OwnedNonAliased$Bool%trigger $t@626@01 place@623@01 root_address@624@01 snapshot@625@01))
; [eval] compute_address(place, root_address)
; [eval] Size$Bool$()
(pop) ; 2
(pop) ; 1
; ---------- into_memory_block$I64 ----------
(declare-const place@629@01 Place)
(declare-const root_address@630@01 Address)
(declare-const snapshot@631@01 Snap$I64)
(declare-const place@632@01 Place)
(declare-const root_address@633@01 Address)
(declare-const snapshot@634@01 Snap$I64)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@635@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
; [eval] compute_address(place, root_address)
; [eval] Size$I64$()
(declare-const $t@636@01 $Snap)
(pop) ; 2
(push) ; 2
; [exec]
; unfold acc(OwnedNonAliased$I64(place, root_address, snapshot), write)
(assert (= $t@635@01 ($Snap.combine ($Snap.first $t@635@01) ($Snap.second $t@635@01))))
(assert (= ($Snap.first $t@635@01) $Snap.unit))
; [eval] valid$Snap$I64(snapshot)
(assert (valid$Snap$I64<Bool> snapshot@634@01))
(assert (=
  ($Snap.second $t@635@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@635@01))
    ($Snap.second ($Snap.second $t@635@01)))))
; [eval] compute_address(place, root_address)
; [eval] Size$I64$()
(assert (= ($Snap.second ($Snap.second $t@635@01)) $Snap.unit))
; [eval] MemoryBlock$bytes(compute_address(place, root_address), Size$I64$()) == to_bytes$I64(snapshot)
; [eval] MemoryBlock$bytes(compute_address(place, root_address), Size$I64$())
; [eval] compute_address(place, root_address)
; [eval] Size$I64$()
(push) ; 3
(declare-const $k@637@01 $Perm)
(assert ($Perm.isReadVar $k@637@01))
(assert (< $k@637@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@637@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@637@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@635@01)) (compute_address<Address> place@632@01 root_address@633@01) (as Size$I64$<Snap$Usize>  Snap$Usize)))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@637@01))
(assert (and
  (< $k@637@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@637@01))
  (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@635@01)) (compute_address<Address> place@632@01 root_address@633@01) (as Size$I64$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$I64(snapshot)
(assert (=
  (MemoryBlock$bytes ($Snap.first ($Snap.second $t@635@01)) (compute_address<Address> place@632@01 root_address@633@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
  (to_bytes$I64<Bytes> snapshot@634@01)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (OwnedNonAliased$I64%trigger $t@635@01 place@632@01 root_address@633@01 snapshot@634@01))
; [eval] compute_address(place, root_address)
; [eval] Size$I64$()
(pop) ; 2
(pop) ; 1
; ---------- into_memory_block$Tuple$$$ ----------
(declare-const place@638@01 Place)
(declare-const root_address@639@01 Address)
(declare-const snapshot@640@01 Snap$Tuple$$$)
(declare-const place@641@01 Place)
(declare-const root_address@642@01 Address)
(declare-const snapshot@643@01 Snap$Tuple$$$)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@644@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
; [eval] compute_address(place, root_address)
; [eval] Size$Tuple$$$$()
(declare-const $t@645@01 $Snap)
(pop) ; 2
(push) ; 2
; [exec]
; unfold acc(OwnedNonAliased$Tuple$$$(place, root_address, snapshot), write)
(assert (= $t@644@01 ($Snap.combine ($Snap.first $t@644@01) ($Snap.second $t@644@01))))
(assert (= ($Snap.first $t@644@01) $Snap.unit))
; [eval] valid$Snap$Tuple$$$(snapshot)
(assert (valid$Snap$Tuple$$$<Bool> snapshot@643@01))
; [eval] compute_address(place, root_address)
; [eval] PaddingSize$Tuple$$$$()
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (OwnedNonAliased$Tuple$$$%trigger $t@644@01 place@641@01 root_address@642@01 snapshot@643@01))
; [exec]
; memory_block_join$Tuple$$$(compute_address(place, root_address), write)
; [eval] compute_address(place, root_address)
; [eval] none < permission_amount
; [eval] PaddingSize$Tuple$$$$()
(declare-const $t@646@01 $Snap)
(assert (= $t@646@01 ($Snap.combine ($Snap.first $t@646@01) ($Snap.second $t@646@01))))
; [eval] Size$Tuple$$$$()
(assert (= ($Snap.second $t@646@01) $Snap.unit))
; [eval] (forall snapshot: Snap$Tuple$$$ :: { to_bytes$Tuple$$$(snapshot) } MemoryBlock$bytes(address, Size$Tuple$$$$()) == to_bytes$Tuple$$$(snapshot))
(declare-const snapshot@647@01 Snap$Tuple$$$)
(set-option :timeout 0)
(push) ; 3
; [eval] MemoryBlock$bytes(address, Size$Tuple$$$$()) == to_bytes$Tuple$$$(snapshot)
; [eval] MemoryBlock$bytes(address, Size$Tuple$$$$())
; [eval] Size$Tuple$$$$()
(push) ; 4
(declare-const $k@648@01 $Perm)
(assert ($Perm.isReadVar $k@648@01))
(assert (< $k@648@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@648@01)))
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@648@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first $t@646@01) (compute_address<Address> place@641@01 root_address@642@01) (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))
(pop) ; 4
; Joined path conditions
(assert ($Perm.isReadVar $k@648@01))
(assert (and
  (< $k@648@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@648@01))
  (MemoryBlock$bytes%precondition ($Snap.first $t@646@01) (compute_address<Address> place@641@01 root_address@642@01) (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$Tuple$$$(snapshot)
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert ($Perm.isReadVar $k@648@01))
(assert (< $k@648@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@648@01)))
(assert (MemoryBlock$bytes%precondition ($Snap.first $t@646@01) (compute_address<Address> place@641@01 root_address@642@01) (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((snapshot@647@01 Snap$Tuple$$$)) (!
  (=
    (MemoryBlock$bytes ($Snap.first $t@646@01) (compute_address<Address> place@641@01 root_address@642@01) (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize))
    (to_bytes$Tuple$$$<Bytes> snapshot@647@01))
  :pattern ((to_bytes$Tuple$$$<Bytes> snapshot@647@01))
  :qid |prog.l1811|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] compute_address(place, root_address)
; [eval] Size$Tuple$$$$()
(pop) ; 2
(pop) ; 1
; ---------- lft_tok_sep_return$2 ----------
(declare-const lft@649@01 Lifetime)
(declare-const lft_1@650@01 Lifetime)
(declare-const lft_2@651@01 Lifetime)
(declare-const rd_perm@652@01 $Perm)
(declare-const lft@653@01 Lifetime)
(declare-const lft_1@654@01 Lifetime)
(declare-const lft_2@655@01 Lifetime)
(declare-const rd_perm@656@01 $Perm)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@657@01 $Snap)
(assert (= $t@657@01 ($Snap.combine ($Snap.first $t@657@01) ($Snap.second $t@657@01))))
(assert (= ($Snap.first $t@657@01) $Snap.unit))
; [eval] none < rd_perm
(assert (< $Perm.No rd_perm@656@01))
(assert (=
  ($Snap.second $t@657@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@657@01))
    ($Snap.second ($Snap.second $t@657@01)))))
(push) ; 2
(assert (not (or (= rd_perm@656@01 $Perm.No) (< $Perm.No rd_perm@656@01))))
(check-sat)
; unsat
(pop) ; 2
; 0.00s
; (get-info :all-statistics)
(assert (<= $Perm.No rd_perm@656@01))
(assert (= ($Snap.second ($Snap.second $t@657@01)) $Snap.unit))
; [eval] lft == intersect(Set(lft_1, lft_2))
; [eval] intersect(Set(lft_1, lft_2))
; [eval] Set(lft_1, lft_2)
(assert (=
  lft@653@01
  (intersect<Lifetime> (Set_unionone (Set_singleton lft_1@654@01) lft_2@655@01))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@658@01 $Snap)
(assert (= $t@658@01 ($Snap.combine ($Snap.first $t@658@01) ($Snap.second $t@658@01))))
(push) ; 3
(assert (not (or (= rd_perm@656@01 $Perm.No) (< $Perm.No rd_perm@656@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (or (= rd_perm@656@01 $Perm.No) (< $Perm.No rd_perm@656@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(push) ; 3
(set-option :timeout 10)
(assert (not (= lft_1@654@01 lft_2@655@01)))
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
(declare-const lft_1@659@01 Lifetime)
(declare-const lft_2@660@01 Lifetime)
(declare-const rd_perm@661@01 $Perm)
(declare-const lft@662@01 Lifetime)
(declare-const lft_1@663@01 Lifetime)
(declare-const lft_2@664@01 Lifetime)
(declare-const rd_perm@665@01 $Perm)
(declare-const lft@666@01 Lifetime)
(push) ; 1
(declare-const $t@667@01 $Snap)
(assert (= $t@667@01 ($Snap.combine ($Snap.first $t@667@01) ($Snap.second $t@667@01))))
(assert (= ($Snap.first $t@667@01) $Snap.unit))
; [eval] none < rd_perm
(assert (< $Perm.No rd_perm@665@01))
(assert (=
  ($Snap.second $t@667@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@667@01))
    ($Snap.second ($Snap.second $t@667@01)))))
(push) ; 2
(assert (not (or (= rd_perm@665@01 $Perm.No) (< $Perm.No rd_perm@665@01))))
(check-sat)
; unsat
(pop) ; 2
; 0.00s
; (get-info :all-statistics)
(assert (<= $Perm.No rd_perm@665@01))
(push) ; 2
(assert (not (or (= rd_perm@665@01 $Perm.No) (< $Perm.No rd_perm@665@01))))
(check-sat)
; unsat
(pop) ; 2
; 0.00s
; (get-info :all-statistics)
(push) ; 2
(set-option :timeout 10)
(assert (not (= lft_1@663@01 lft_2@664@01)))
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
(declare-const $t@668@01 $Snap)
(assert (= $t@668@01 ($Snap.combine ($Snap.first $t@668@01) ($Snap.second $t@668@01))))
(push) ; 3
(assert (not (or (= rd_perm@665@01 $Perm.No) (< $Perm.No rd_perm@665@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (= ($Snap.second $t@668@01) $Snap.unit))
; [eval] lft == intersect(Set(lft_1, lft_2))
; [eval] intersect(Set(lft_1, lft_2))
; [eval] Set(lft_1, lft_2)
(assert (=
  lft@666@01
  (intersect<Lifetime> (Set_unionone (Set_singleton lft_1@663@01) lft_2@664@01))))
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- memory_block_join$Tuple$$$ ----------
(declare-const address@669@01 Address)
(declare-const permission_amount@670@01 $Perm)
(declare-const address@671@01 Address)
(declare-const permission_amount@672@01 $Perm)
(push) ; 1
(declare-const $t@673@01 $Snap)
(assert (= $t@673@01 ($Snap.combine ($Snap.first $t@673@01) ($Snap.second $t@673@01))))
(assert (= ($Snap.first $t@673@01) $Snap.unit))
; [eval] none < permission_amount
(assert (< $Perm.No permission_amount@672@01))
; [eval] PaddingSize$Tuple$$$$()
(push) ; 2
(assert (not (or (= permission_amount@672@01 $Perm.No) (< $Perm.No permission_amount@672@01))))
(check-sat)
; unsat
(pop) ; 2
; 0.00s
; (get-info :all-statistics)
(assert (<= $Perm.No permission_amount@672@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@674@01 $Snap)
(assert (= $t@674@01 ($Snap.combine ($Snap.first $t@674@01) ($Snap.second $t@674@01))))
; [eval] Size$Tuple$$$$()
(assert (= ($Snap.second $t@674@01) $Snap.unit))
; [eval] (forall snapshot: Snap$Tuple$$$ :: { to_bytes$Tuple$$$(snapshot) } MemoryBlock$bytes(address, Size$Tuple$$$$()) == to_bytes$Tuple$$$(snapshot))
(declare-const snapshot@675@01 Snap$Tuple$$$)
(push) ; 3
; [eval] MemoryBlock$bytes(address, Size$Tuple$$$$()) == to_bytes$Tuple$$$(snapshot)
; [eval] MemoryBlock$bytes(address, Size$Tuple$$$$())
; [eval] Size$Tuple$$$$()
(push) ; 4
(declare-const $k@676@01 $Perm)
(assert ($Perm.isReadVar $k@676@01))
(assert (< $k@676@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@676@01)))
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@676@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first $t@674@01) address@671@01 (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))
(pop) ; 4
; Joined path conditions
(assert ($Perm.isReadVar $k@676@01))
(assert (and
  (< $k@676@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@676@01))
  (MemoryBlock$bytes%precondition ($Snap.first $t@674@01) address@671@01 (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$Tuple$$$(snapshot)
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert ($Perm.isReadVar $k@676@01))
(assert (< $k@676@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@676@01)))
(assert (MemoryBlock$bytes%precondition ($Snap.first $t@674@01) address@671@01 (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((snapshot@675@01 Snap$Tuple$$$)) (!
  (=
    (MemoryBlock$bytes ($Snap.first $t@674@01) address@671@01 (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize))
    (to_bytes$Tuple$$$<Bytes> snapshot@675@01))
  :pattern ((to_bytes$Tuple$$$<Bytes> snapshot@675@01))
  :qid |prog.l1811|)))
(pop) ; 2
(set-option :timeout 0)
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- memory_block_join$Tuple$$I64$Bool$$I64$Bool$ ----------
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
(assert (=
  ($Snap.second $t@681@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@681@01))
    ($Snap.second ($Snap.second $t@681@01)))))
; [eval] PaddingSize$Tuple$$I64$Bool$$I64$Bool$$()
(push) ; 2
(assert (not (or (= permission_amount@680@01 $Perm.No) (< $Perm.No permission_amount@680@01))))
(check-sat)
; unsat
(pop) ; 2
; 0.00s
; (get-info :all-statistics)
(assert (<= $Perm.No permission_amount@680@01))
(assert (=
  ($Snap.second ($Snap.second $t@681@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@681@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@681@01))))))
; [eval] field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address)
; [eval] Size$I64$()
(push) ; 2
(assert (not (or (= permission_amount@680@01 $Perm.No) (< $Perm.No permission_amount@680@01))))
(check-sat)
; unsat
(pop) ; 2
; 0.00s
; (get-info :all-statistics)
(push) ; 2
(set-option :timeout 10)
(assert (not (and
  (=
    address@679@01
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@679@01))
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
(assert (not (or (= permission_amount@680@01 $Perm.No) (< $Perm.No permission_amount@680@01))))
(check-sat)
; unsat
(pop) ; 2
; 0.00s
; (get-info :all-statistics)
(push) ; 2
(set-option :timeout 10)
(assert (not (and
  (=
    address@679@01
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> address@679@01))
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
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@679@01)
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> address@679@01))
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
(declare-const $t@682@01 $Snap)
(assert (= $t@682@01 ($Snap.combine ($Snap.first $t@682@01) ($Snap.second $t@682@01))))
; [eval] Size$Tuple$$I64$Bool$$I64$Bool$$()
(assert (= ($Snap.second $t@682@01) $Snap.unit))
; [eval] (forall snapshot: Snap$Tuple$$I64$Bool$$I64$Bool$ :: { to_bytes$Tuple$$I64$Bool$$I64$Bool$(snapshot) } old(MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address), Size$I64$()) == to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot))) && old(MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address), Size$Bool$()) == to_bytes$Bool(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot))) ==> MemoryBlock$bytes(address, Size$Tuple$$I64$Bool$$I64$Bool$$()) == to_bytes$Tuple$$I64$Bool$$I64$Bool$(snapshot))
(declare-const snapshot@683@01 Snap$Tuple$$I64$Bool$$I64$Bool$)
(push) ; 3
; [eval] old(MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address), Size$I64$()) == to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot))) && old(MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address), Size$Bool$()) == to_bytes$Bool(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot))) ==> MemoryBlock$bytes(address, Size$Tuple$$I64$Bool$$I64$Bool$$()) == to_bytes$Tuple$$I64$Bool$$I64$Bool$(snapshot)
; [eval] old(MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address), Size$I64$()) == to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot))) && old(MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address), Size$Bool$()) == to_bytes$Bool(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot)))
; [eval] old(MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address), Size$I64$()) == to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot)))
; [eval] MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address), Size$I64$()) == to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot))
; [eval] MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address), Size$I64$())
; [eval] field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address)
; [eval] Size$I64$()
(push) ; 4
(declare-const $k@684@01 $Perm)
(assert ($Perm.isReadVar $k@684@01))
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= permission_amount@680@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (< $k@684@01 permission_amount@680@01))
(assert (<= $Perm.No (- permission_amount@680@01 $k@684@01)))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@684@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second ($Snap.second $t@681@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@679@01) (as Size$I64$<Snap$Usize>  Snap$Usize)))
(pop) ; 4
; Joined path conditions
(assert ($Perm.isReadVar $k@684@01))
(assert (and
  (< $k@684@01 permission_amount@680@01)
  (<= $Perm.No (- permission_amount@680@01 $k@684@01))
  (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second ($Snap.second $t@681@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@679@01) (as Size$I64$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot)
(set-option :timeout 0)
(push) ; 4
; [then-branch: 114 | MemoryBlock$bytes(First:(Second:(Second:($t@681@01))), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](address@679@01), Size$I64$[Snap$Usize]) == to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@683@01)) | live]
; [else-branch: 114 | MemoryBlock$bytes(First:(Second:(Second:($t@681@01))), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](address@679@01), Size$I64$[Snap$Usize]) != to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@683@01)) | live]
(push) ; 5
; [then-branch: 114 | MemoryBlock$bytes(First:(Second:(Second:($t@681@01))), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](address@679@01), Size$I64$[Snap$Usize]) == to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@683@01))]
(assert (=
  (MemoryBlock$bytes ($Snap.first ($Snap.second ($Snap.second $t@681@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@679@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
  (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@683@01))))
; [eval] old(MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address), Size$Bool$()) == to_bytes$Bool(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot)))
; [eval] MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address), Size$Bool$()) == to_bytes$Bool(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot))
; [eval] MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address), Size$Bool$())
; [eval] field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address)
; [eval] Size$Bool$()
(push) ; 6
(declare-const $k@685@01 $Perm)
(assert ($Perm.isReadVar $k@685@01))
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= permission_amount@680@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (< $k@685@01 permission_amount@680@01))
(assert (<= $Perm.No (- permission_amount@680@01 $k@685@01)))
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.No $k@685@01)))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.second ($Snap.second ($Snap.second $t@681@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> address@679@01) (as Size$Bool$<Snap$Usize>  Snap$Usize)))
(pop) ; 6
; Joined path conditions
(assert ($Perm.isReadVar $k@685@01))
(assert (and
  (< $k@685@01 permission_amount@680@01)
  (<= $Perm.No (- permission_amount@680@01 $k@685@01))
  (MemoryBlock$bytes%precondition ($Snap.second ($Snap.second ($Snap.second $t@681@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> address@679@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$Bool(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot)
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 114 | MemoryBlock$bytes(First:(Second:(Second:($t@681@01))), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](address@679@01), Size$I64$[Snap$Usize]) != to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@683@01))]
(assert (not
  (=
    (MemoryBlock$bytes ($Snap.first ($Snap.second ($Snap.second $t@681@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@679@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
    (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@683@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert ($Perm.isReadVar $k@685@01))
(assert (=>
  (=
    (MemoryBlock$bytes ($Snap.first ($Snap.second ($Snap.second $t@681@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@679@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
    (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@683@01)))
  (and
    (=
      (MemoryBlock$bytes ($Snap.first ($Snap.second ($Snap.second $t@681@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@679@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
      (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@683@01)))
    (< $k@685@01 permission_amount@680@01)
    (<= $Perm.No (- permission_amount@680@01 $k@685@01))
    (MemoryBlock$bytes%precondition ($Snap.second ($Snap.second ($Snap.second $t@681@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> address@679@01) (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
; Joined path conditions
(assert (or
  (not
    (=
      (MemoryBlock$bytes ($Snap.first ($Snap.second ($Snap.second $t@681@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@679@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
      (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@683@01))))
  (=
    (MemoryBlock$bytes ($Snap.first ($Snap.second ($Snap.second $t@681@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@679@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
    (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@683@01)))))
(push) ; 4
; [then-branch: 115 | MemoryBlock$bytes(Second:(Second:(Second:($t@681@01))), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Address](address@679@01), Size$Bool$[Snap$Usize]) == to_bytes$Bool[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](snapshot@683@01)) && MemoryBlock$bytes(First:(Second:(Second:($t@681@01))), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](address@679@01), Size$I64$[Snap$Usize]) == to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@683@01)) | live]
; [else-branch: 115 | !(MemoryBlock$bytes(Second:(Second:(Second:($t@681@01))), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Address](address@679@01), Size$Bool$[Snap$Usize]) == to_bytes$Bool[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](snapshot@683@01)) && MemoryBlock$bytes(First:(Second:(Second:($t@681@01))), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](address@679@01), Size$I64$[Snap$Usize]) == to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@683@01))) | live]
(push) ; 5
; [then-branch: 115 | MemoryBlock$bytes(Second:(Second:(Second:($t@681@01))), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Address](address@679@01), Size$Bool$[Snap$Usize]) == to_bytes$Bool[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](snapshot@683@01)) && MemoryBlock$bytes(First:(Second:(Second:($t@681@01))), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](address@679@01), Size$I64$[Snap$Usize]) == to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@683@01))]
(assert (and
  (=
    (MemoryBlock$bytes ($Snap.second ($Snap.second ($Snap.second $t@681@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> address@679@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
    (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@683@01)))
  (=
    (MemoryBlock$bytes ($Snap.first ($Snap.second ($Snap.second $t@681@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@679@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
    (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@683@01)))))
; [eval] MemoryBlock$bytes(address, Size$Tuple$$I64$Bool$$I64$Bool$$()) == to_bytes$Tuple$$I64$Bool$$I64$Bool$(snapshot)
; [eval] MemoryBlock$bytes(address, Size$Tuple$$I64$Bool$$I64$Bool$$())
; [eval] Size$Tuple$$I64$Bool$$I64$Bool$$()
(push) ; 6
(declare-const $k@686@01 $Perm)
(assert ($Perm.isReadVar $k@686@01))
(assert (< $k@686@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@686@01)))
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.No $k@686@01)))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first $t@682@01) address@679@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))
(pop) ; 6
; Joined path conditions
(assert ($Perm.isReadVar $k@686@01))
(assert (and
  (< $k@686@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@686@01))
  (MemoryBlock$bytes%precondition ($Snap.first $t@682@01) address@679@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$Tuple$$I64$Bool$$I64$Bool$(snapshot)
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 115 | !(MemoryBlock$bytes(Second:(Second:(Second:($t@681@01))), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Address](address@679@01), Size$Bool$[Snap$Usize]) == to_bytes$Bool[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](snapshot@683@01)) && MemoryBlock$bytes(First:(Second:(Second:($t@681@01))), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](address@679@01), Size$I64$[Snap$Usize]) == to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@683@01)))]
(assert (not
  (and
    (=
      (MemoryBlock$bytes ($Snap.second ($Snap.second ($Snap.second $t@681@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> address@679@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
      (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@683@01)))
    (=
      (MemoryBlock$bytes ($Snap.first ($Snap.second ($Snap.second $t@681@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@679@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
      (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@683@01))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert ($Perm.isReadVar $k@686@01))
(assert (=>
  (and
    (=
      (MemoryBlock$bytes ($Snap.second ($Snap.second ($Snap.second $t@681@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> address@679@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
      (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@683@01)))
    (=
      (MemoryBlock$bytes ($Snap.first ($Snap.second ($Snap.second $t@681@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@679@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
      (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@683@01))))
  (and
    (=
      (MemoryBlock$bytes ($Snap.second ($Snap.second ($Snap.second $t@681@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> address@679@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
      (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@683@01)))
    (=
      (MemoryBlock$bytes ($Snap.first ($Snap.second ($Snap.second $t@681@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@679@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
      (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@683@01)))
    (< $k@686@01 $Perm.Write)
    (<= $Perm.No (- $Perm.Write $k@686@01))
    (MemoryBlock$bytes%precondition ($Snap.first $t@682@01) address@679@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
; Joined path conditions
(assert (or
  (not
    (and
      (=
        (MemoryBlock$bytes ($Snap.second ($Snap.second ($Snap.second $t@681@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> address@679@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
        (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@683@01)))
      (=
        (MemoryBlock$bytes ($Snap.first ($Snap.second ($Snap.second $t@681@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@679@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
        (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@683@01)))))
  (and
    (=
      (MemoryBlock$bytes ($Snap.second ($Snap.second ($Snap.second $t@681@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> address@679@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
      (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@683@01)))
    (=
      (MemoryBlock$bytes ($Snap.first ($Snap.second ($Snap.second $t@681@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@679@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
      (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@683@01))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert ($Perm.isReadVar $k@684@01))
(assert ($Perm.isReadVar $k@685@01))
(assert ($Perm.isReadVar $k@686@01))
(assert (< $k@684@01 permission_amount@680@01))
(assert (<= $Perm.No (- permission_amount@680@01 $k@684@01)))
(assert (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second ($Snap.second $t@681@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@679@01) (as Size$I64$<Snap$Usize>  Snap$Usize)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((snapshot@683@01 Snap$Tuple$$I64$Bool$$I64$Bool$)) (!
  (and
    (=>
      (=
        (MemoryBlock$bytes ($Snap.first ($Snap.second ($Snap.second $t@681@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@679@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
        (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@683@01)))
      (and
        (=
          (MemoryBlock$bytes ($Snap.first ($Snap.second ($Snap.second $t@681@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@679@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
          (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@683@01)))
        (< $k@685@01 permission_amount@680@01)
        (<= $Perm.No (- permission_amount@680@01 $k@685@01))
        (MemoryBlock$bytes%precondition ($Snap.second ($Snap.second ($Snap.second $t@681@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> address@679@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))))
    (or
      (not
        (=
          (MemoryBlock$bytes ($Snap.first ($Snap.second ($Snap.second $t@681@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@679@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
          (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@683@01))))
      (=
        (MemoryBlock$bytes ($Snap.first ($Snap.second ($Snap.second $t@681@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@679@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
        (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@683@01))))
    (=>
      (and
        (=
          (MemoryBlock$bytes ($Snap.second ($Snap.second ($Snap.second $t@681@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> address@679@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
          (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@683@01)))
        (=
          (MemoryBlock$bytes ($Snap.first ($Snap.second ($Snap.second $t@681@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@679@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
          (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@683@01))))
      (and
        (=
          (MemoryBlock$bytes ($Snap.second ($Snap.second ($Snap.second $t@681@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> address@679@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
          (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@683@01)))
        (=
          (MemoryBlock$bytes ($Snap.first ($Snap.second ($Snap.second $t@681@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@679@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
          (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@683@01)))
        (< $k@686@01 $Perm.Write)
        (<= $Perm.No (- $Perm.Write $k@686@01))
        (MemoryBlock$bytes%precondition ($Snap.first $t@682@01) address@679@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize))))
    (or
      (not
        (and
          (=
            (MemoryBlock$bytes ($Snap.second ($Snap.second ($Snap.second $t@681@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> address@679@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
            (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@683@01)))
          (=
            (MemoryBlock$bytes ($Snap.first ($Snap.second ($Snap.second $t@681@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@679@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
            (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@683@01)))))
      (and
        (=
          (MemoryBlock$bytes ($Snap.second ($Snap.second ($Snap.second $t@681@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> address@679@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
          (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@683@01)))
        (=
          (MemoryBlock$bytes ($Snap.first ($Snap.second ($Snap.second $t@681@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@679@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
          (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@683@01))))))
  :pattern ((to_bytes$Tuple$$I64$Bool$$I64$Bool$<Bytes> snapshot@683@01))
  :qid |prog.l1825-aux|)))
(assert (forall ((snapshot@683@01 Snap$Tuple$$I64$Bool$$I64$Bool$)) (!
  (=>
    (and
      (=
        (MemoryBlock$bytes ($Snap.second ($Snap.second ($Snap.second $t@681@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> address@679@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
        (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@683@01)))
      (=
        (MemoryBlock$bytes ($Snap.first ($Snap.second ($Snap.second $t@681@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@679@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
        (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@683@01))))
    (=
      (MemoryBlock$bytes ($Snap.first $t@682@01) address@679@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize))
      (to_bytes$Tuple$$I64$Bool$$I64$Bool$<Bytes> snapshot@683@01)))
  :pattern ((to_bytes$Tuple$$I64$Bool$$I64$Bool$<Bytes> snapshot@683@01))
  :qid |prog.l1825|)))
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- memory_block_split$Tuple$$$ ----------
(declare-const address@687@01 Address)
(declare-const permission_amount@688@01 $Perm)
(declare-const address@689@01 Address)
(declare-const permission_amount@690@01 $Perm)
(push) ; 1
(declare-const $t@691@01 $Snap)
(assert (= $t@691@01 ($Snap.combine ($Snap.first $t@691@01) ($Snap.second $t@691@01))))
(assert (= ($Snap.first $t@691@01) $Snap.unit))
; [eval] none < permission_amount
(assert (< $Perm.No permission_amount@690@01))
; [eval] Size$Tuple$$$$()
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@692@01 $Snap)
(assert (= $t@692@01 ($Snap.combine ($Snap.first $t@692@01) ($Snap.second $t@692@01))))
; [eval] PaddingSize$Tuple$$$$()
(push) ; 3
(assert (not (or (= permission_amount@690@01 $Perm.No) (< $Perm.No permission_amount@690@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (<= $Perm.No permission_amount@690@01))
(assert (= ($Snap.second $t@692@01) $Snap.unit))
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- memory_block_split$Tuple$$I64$Bool$$I64$Bool$ ----------
(declare-const address@693@01 Address)
(declare-const permission_amount@694@01 $Perm)
(declare-const address@695@01 Address)
(declare-const permission_amount@696@01 $Perm)
(push) ; 1
(declare-const $t@697@01 $Snap)
(assert (= $t@697@01 ($Snap.combine ($Snap.first $t@697@01) ($Snap.second $t@697@01))))
(assert (= ($Snap.first $t@697@01) $Snap.unit))
; [eval] none < permission_amount
(assert (< $Perm.No permission_amount@696@01))
; [eval] Size$Tuple$$I64$Bool$$I64$Bool$$()
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@698@01 $Snap)
(assert (= $t@698@01 ($Snap.combine ($Snap.first $t@698@01) ($Snap.second $t@698@01))))
; [eval] PaddingSize$Tuple$$I64$Bool$$I64$Bool$$()
(push) ; 3
(assert (not (or (= permission_amount@696@01 $Perm.No) (< $Perm.No permission_amount@696@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (<= $Perm.No permission_amount@696@01))
(assert (=
  ($Snap.second $t@698@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@698@01))
    ($Snap.second ($Snap.second $t@698@01)))))
; [eval] field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address)
; [eval] Size$I64$()
(push) ; 3
(assert (not (or (= permission_amount@696@01 $Perm.No) (< $Perm.No permission_amount@696@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (=
    address@695@01
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@695@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second $t@698@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@698@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@698@01))))))
; [eval] field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address)
; [eval] Size$Bool$()
(set-option :timeout 0)
(push) ; 3
(assert (not (or (= permission_amount@696@01 $Perm.No) (< $Perm.No permission_amount@696@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (=
    address@695@01
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> address@695@01))
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
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@695@01)
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> address@695@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@698@01))) $Snap.unit))
; [eval] (forall snapshot: Snap$Tuple$$I64$Bool$$I64$Bool$ :: { to_bytes$Tuple$$I64$Bool$$I64$Bool$(snapshot) } old(MemoryBlock$bytes(address, Size$Tuple$$I64$Bool$$I64$Bool$$())) == to_bytes$Tuple$$I64$Bool$$I64$Bool$(snapshot) ==> MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address), Size$I64$()) == to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot)) && MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address), Size$Bool$()) == to_bytes$Bool(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot)))
(declare-const snapshot@699@01 Snap$Tuple$$I64$Bool$$I64$Bool$)
(set-option :timeout 0)
(push) ; 3
; [eval] old(MemoryBlock$bytes(address, Size$Tuple$$I64$Bool$$I64$Bool$$())) == to_bytes$Tuple$$I64$Bool$$I64$Bool$(snapshot) ==> MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address), Size$I64$()) == to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot)) && MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address), Size$Bool$()) == to_bytes$Bool(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot))
; [eval] old(MemoryBlock$bytes(address, Size$Tuple$$I64$Bool$$I64$Bool$$())) == to_bytes$Tuple$$I64$Bool$$I64$Bool$(snapshot)
; [eval] old(MemoryBlock$bytes(address, Size$Tuple$$I64$Bool$$I64$Bool$$()))
; [eval] MemoryBlock$bytes(address, Size$Tuple$$I64$Bool$$I64$Bool$$())
; [eval] Size$Tuple$$I64$Bool$$I64$Bool$$()
(push) ; 4
(declare-const $k@700@01 $Perm)
(assert ($Perm.isReadVar $k@700@01))
(assert (< $k@700@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@700@01)))
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@700@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.second $t@697@01) address@695@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))
(pop) ; 4
; Joined path conditions
(assert ($Perm.isReadVar $k@700@01))
(assert (and
  (< $k@700@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@700@01))
  (MemoryBlock$bytes%precondition ($Snap.second $t@697@01) address@695@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$Tuple$$I64$Bool$$I64$Bool$(snapshot)
(set-option :timeout 0)
(push) ; 4
; [then-branch: 116 | MemoryBlock$bytes(Second:($t@697@01), address@695@01, Size$Tuple$$I64$Bool$$I64$Bool$$[Snap$Usize]) == to_bytes$Tuple$$I64$Bool$$I64$Bool$[Bytes](snapshot@699@01) | live]
; [else-branch: 116 | MemoryBlock$bytes(Second:($t@697@01), address@695@01, Size$Tuple$$I64$Bool$$I64$Bool$$[Snap$Usize]) != to_bytes$Tuple$$I64$Bool$$I64$Bool$[Bytes](snapshot@699@01) | live]
(push) ; 5
; [then-branch: 116 | MemoryBlock$bytes(Second:($t@697@01), address@695@01, Size$Tuple$$I64$Bool$$I64$Bool$$[Snap$Usize]) == to_bytes$Tuple$$I64$Bool$$I64$Bool$[Bytes](snapshot@699@01)]
(assert (=
  (MemoryBlock$bytes ($Snap.second $t@697@01) address@695@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize))
  (to_bytes$Tuple$$I64$Bool$$I64$Bool$<Bytes> snapshot@699@01)))
; [eval] MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address), Size$I64$()) == to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot)) && MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address), Size$Bool$()) == to_bytes$Bool(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot))
; [eval] MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address), Size$I64$()) == to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot))
; [eval] MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address), Size$I64$())
; [eval] field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address)
; [eval] Size$I64$()
(push) ; 6
(declare-const $k@701@01 $Perm)
(assert ($Perm.isReadVar $k@701@01))
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= permission_amount@696@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (< $k@701@01 permission_amount@696@01))
(assert (<= $Perm.No (- permission_amount@696@01 $k@701@01)))
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.No $k@701@01)))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@698@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@695@01) (as Size$I64$<Snap$Usize>  Snap$Usize)))
(pop) ; 6
; Joined path conditions
(assert ($Perm.isReadVar $k@701@01))
(assert (and
  (< $k@701@01 permission_amount@696@01)
  (<= $Perm.No (- permission_amount@696@01 $k@701@01))
  (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@698@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@695@01) (as Size$I64$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot)
(set-option :timeout 0)
(push) ; 6
; [then-branch: 117 | MemoryBlock$bytes(First:(Second:($t@698@01)), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](address@695@01), Size$I64$[Snap$Usize]) == to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@699@01)) | live]
; [else-branch: 117 | MemoryBlock$bytes(First:(Second:($t@698@01)), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](address@695@01), Size$I64$[Snap$Usize]) != to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@699@01)) | live]
(push) ; 7
; [then-branch: 117 | MemoryBlock$bytes(First:(Second:($t@698@01)), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](address@695@01), Size$I64$[Snap$Usize]) == to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@699@01))]
(assert (=
  (MemoryBlock$bytes ($Snap.first ($Snap.second $t@698@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@695@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
  (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@699@01))))
; [eval] MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address), Size$Bool$()) == to_bytes$Bool(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot))
; [eval] MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address), Size$Bool$())
; [eval] field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address)
; [eval] Size$Bool$()
(push) ; 8
(declare-const $k@702@01 $Perm)
(assert ($Perm.isReadVar $k@702@01))
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= permission_amount@696@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (< $k@702@01 permission_amount@696@01))
(assert (<= $Perm.No (- permission_amount@696@01 $k@702@01)))
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (< $Perm.No $k@702@01)))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second ($Snap.second $t@698@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> address@695@01) (as Size$Bool$<Snap$Usize>  Snap$Usize)))
(pop) ; 8
; Joined path conditions
(assert ($Perm.isReadVar $k@702@01))
(assert (and
  (< $k@702@01 permission_amount@696@01)
  (<= $Perm.No (- permission_amount@696@01 $k@702@01))
  (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second ($Snap.second $t@698@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> address@695@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$Bool(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot)
(pop) ; 7
(set-option :timeout 0)
(push) ; 7
; [else-branch: 117 | MemoryBlock$bytes(First:(Second:($t@698@01)), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](address@695@01), Size$I64$[Snap$Usize]) != to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@699@01))]
(assert (not
  (=
    (MemoryBlock$bytes ($Snap.first ($Snap.second $t@698@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@695@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
    (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@699@01)))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert ($Perm.isReadVar $k@702@01))
(assert (=>
  (=
    (MemoryBlock$bytes ($Snap.first ($Snap.second $t@698@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@695@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
    (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@699@01)))
  (and
    (=
      (MemoryBlock$bytes ($Snap.first ($Snap.second $t@698@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@695@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
      (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@699@01)))
    (< $k@702@01 permission_amount@696@01)
    (<= $Perm.No (- permission_amount@696@01 $k@702@01))
    (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second ($Snap.second $t@698@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> address@695@01) (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
; Joined path conditions
(assert (or
  (not
    (=
      (MemoryBlock$bytes ($Snap.first ($Snap.second $t@698@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@695@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
      (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@699@01))))
  (=
    (MemoryBlock$bytes ($Snap.first ($Snap.second $t@698@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@695@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
    (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@699@01)))))
(pop) ; 5
(push) ; 5
; [else-branch: 116 | MemoryBlock$bytes(Second:($t@697@01), address@695@01, Size$Tuple$$I64$Bool$$I64$Bool$$[Snap$Usize]) != to_bytes$Tuple$$I64$Bool$$I64$Bool$[Bytes](snapshot@699@01)]
(assert (not
  (=
    (MemoryBlock$bytes ($Snap.second $t@697@01) address@695@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize))
    (to_bytes$Tuple$$I64$Bool$$I64$Bool$<Bytes> snapshot@699@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert ($Perm.isReadVar $k@701@01))
(assert ($Perm.isReadVar $k@702@01))
(assert (=>
  (=
    (MemoryBlock$bytes ($Snap.second $t@697@01) address@695@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize))
    (to_bytes$Tuple$$I64$Bool$$I64$Bool$<Bytes> snapshot@699@01))
  (and
    (=
      (MemoryBlock$bytes ($Snap.second $t@697@01) address@695@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize))
      (to_bytes$Tuple$$I64$Bool$$I64$Bool$<Bytes> snapshot@699@01))
    (< $k@701@01 permission_amount@696@01)
    (<= $Perm.No (- permission_amount@696@01 $k@701@01))
    (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@698@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@695@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
    (=>
      (=
        (MemoryBlock$bytes ($Snap.first ($Snap.second $t@698@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@695@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
        (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@699@01)))
      (and
        (=
          (MemoryBlock$bytes ($Snap.first ($Snap.second $t@698@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@695@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
          (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@699@01)))
        (< $k@702@01 permission_amount@696@01)
        (<= $Perm.No (- permission_amount@696@01 $k@702@01))
        (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second ($Snap.second $t@698@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> address@695@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))))
    (or
      (not
        (=
          (MemoryBlock$bytes ($Snap.first ($Snap.second $t@698@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@695@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
          (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@699@01))))
      (=
        (MemoryBlock$bytes ($Snap.first ($Snap.second $t@698@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@695@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
        (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@699@01)))))))
; Joined path conditions
(assert (or
  (not
    (=
      (MemoryBlock$bytes ($Snap.second $t@697@01) address@695@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize))
      (to_bytes$Tuple$$I64$Bool$$I64$Bool$<Bytes> snapshot@699@01)))
  (=
    (MemoryBlock$bytes ($Snap.second $t@697@01) address@695@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize))
    (to_bytes$Tuple$$I64$Bool$$I64$Bool$<Bytes> snapshot@699@01))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert ($Perm.isReadVar $k@700@01))
(assert ($Perm.isReadVar $k@701@01))
(assert ($Perm.isReadVar $k@702@01))
(assert (< $k@700@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@700@01)))
(assert (MemoryBlock$bytes%precondition ($Snap.second $t@697@01) address@695@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((snapshot@699@01 Snap$Tuple$$I64$Bool$$I64$Bool$)) (!
  (and
    (=>
      (=
        (MemoryBlock$bytes ($Snap.second $t@697@01) address@695@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize))
        (to_bytes$Tuple$$I64$Bool$$I64$Bool$<Bytes> snapshot@699@01))
      (and
        (=
          (MemoryBlock$bytes ($Snap.second $t@697@01) address@695@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize))
          (to_bytes$Tuple$$I64$Bool$$I64$Bool$<Bytes> snapshot@699@01))
        (< $k@701@01 permission_amount@696@01)
        (<= $Perm.No (- permission_amount@696@01 $k@701@01))
        (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@698@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@695@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
        (=>
          (=
            (MemoryBlock$bytes ($Snap.first ($Snap.second $t@698@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@695@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
            (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@699@01)))
          (and
            (=
              (MemoryBlock$bytes ($Snap.first ($Snap.second $t@698@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@695@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
              (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@699@01)))
            (< $k@702@01 permission_amount@696@01)
            (<= $Perm.No (- permission_amount@696@01 $k@702@01))
            (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second ($Snap.second $t@698@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> address@695@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))))
        (or
          (not
            (=
              (MemoryBlock$bytes ($Snap.first ($Snap.second $t@698@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@695@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
              (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@699@01))))
          (=
            (MemoryBlock$bytes ($Snap.first ($Snap.second $t@698@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@695@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
            (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@699@01))))))
    (or
      (not
        (=
          (MemoryBlock$bytes ($Snap.second $t@697@01) address@695@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize))
          (to_bytes$Tuple$$I64$Bool$$I64$Bool$<Bytes> snapshot@699@01)))
      (=
        (MemoryBlock$bytes ($Snap.second $t@697@01) address@695@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize))
        (to_bytes$Tuple$$I64$Bool$$I64$Bool$<Bytes> snapshot@699@01))))
  :pattern ((to_bytes$Tuple$$I64$Bool$$I64$Bool$<Bytes> snapshot@699@01))
  :qid |prog.l1852-aux|)))
(assert (forall ((snapshot@699@01 Snap$Tuple$$I64$Bool$$I64$Bool$)) (!
  (=>
    (=
      (MemoryBlock$bytes ($Snap.second $t@697@01) address@695@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize))
      (to_bytes$Tuple$$I64$Bool$$I64$Bool$<Bytes> snapshot@699@01))
    (and
      (=
        (MemoryBlock$bytes ($Snap.first ($Snap.second ($Snap.second $t@698@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> address@695@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
        (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@699@01)))
      (=
        (MemoryBlock$bytes ($Snap.first ($Snap.second $t@698@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@695@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
        (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@699@01)))))
  :pattern ((to_bytes$Tuple$$I64$Bool$$I64$Bool$<Bytes> snapshot@699@01))
  :qid |prog.l1852|)))
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- memory_copy$Bool ----------
(declare-const source_address@703@01 Address)
(declare-const target_address@704@01 Address)
(declare-const permission_amount@705@01 $Perm)
(declare-const source_address@706@01 Address)
(declare-const target_address@707@01 Address)
(declare-const permission_amount@708@01 $Perm)
(push) ; 1
(declare-const $t@709@01 $Snap)
(assert (= $t@709@01 ($Snap.combine ($Snap.first $t@709@01) ($Snap.second $t@709@01))))
(assert (= ($Snap.first $t@709@01) $Snap.unit))
; [eval] none < permission_amount
(assert (< $Perm.No permission_amount@708@01))
(assert (=
  ($Snap.second $t@709@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@709@01))
    ($Snap.second ($Snap.second $t@709@01)))))
; [eval] Size$Bool$()
; [eval] Size$Bool$()
(push) ; 2
(assert (not (or (= permission_amount@708@01 $Perm.No) (< $Perm.No permission_amount@708@01))))
(check-sat)
; unsat
(pop) ; 2
; 0.00s
; (get-info :all-statistics)
(push) ; 2
(set-option :timeout 10)
(assert (not (= target_address@707@01 source_address@706@01)))
(check-sat)
; unknown
(pop) ; 2
; 0.00s
; (get-info :all-statistics)
(assert (<= $Perm.No permission_amount@708@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@710@01 $Snap)
(assert (= $t@710@01 ($Snap.combine ($Snap.first $t@710@01) ($Snap.second $t@710@01))))
; [eval] Size$Bool$()
(assert (=
  ($Snap.second $t@710@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@710@01))
    ($Snap.second ($Snap.second $t@710@01)))))
; [eval] Size$Bool$()
(push) ; 3
(assert (not (or (= permission_amount@708@01 $Perm.No) (< $Perm.No permission_amount@708@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(push) ; 3
(set-option :timeout 10)
(assert (not (= target_address@707@01 source_address@706@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second $t@710@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@710@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@710@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@710@01))) $Snap.unit))
; [eval] MemoryBlock$bytes(source_address, Size$Bool$()) == old(MemoryBlock$bytes(source_address, Size$Bool$()))
; [eval] MemoryBlock$bytes(source_address, Size$Bool$())
; [eval] Size$Bool$()
(set-option :timeout 0)
(push) ; 3
(declare-const $k@711@01 $Perm)
(assert ($Perm.isReadVar $k@711@01))
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= permission_amount@708@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (< $k@711@01 permission_amount@708@01))
(assert (<= $Perm.No (- permission_amount@708@01 $k@711@01)))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@711@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@710@01)) source_address@706@01 (as Size$Bool$<Snap$Usize>  Snap$Usize)))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@711@01))
(assert (and
  (< $k@711@01 permission_amount@708@01)
  (<= $Perm.No (- permission_amount@708@01 $k@711@01))
  (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@710@01)) source_address@706@01 (as Size$Bool$<Snap$Usize>  Snap$Usize))))
; [eval] old(MemoryBlock$bytes(source_address, Size$Bool$()))
; [eval] MemoryBlock$bytes(source_address, Size$Bool$())
; [eval] Size$Bool$()
(set-option :timeout 0)
(push) ; 3
(declare-const $k@712@01 $Perm)
(assert ($Perm.isReadVar $k@712@01))
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= permission_amount@708@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (< $k@712@01 permission_amount@708@01))
(assert (<= $Perm.No (- permission_amount@708@01 $k@712@01)))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@712@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.second ($Snap.second $t@709@01)) source_address@706@01 (as Size$Bool$<Snap$Usize>  Snap$Usize)))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@712@01))
(assert (and
  (< $k@712@01 permission_amount@708@01)
  (<= $Perm.No (- permission_amount@708@01 $k@712@01))
  (MemoryBlock$bytes%precondition ($Snap.second ($Snap.second $t@709@01)) source_address@706@01 (as Size$Bool$<Snap$Usize>  Snap$Usize))))
(assert (=
  (MemoryBlock$bytes ($Snap.first ($Snap.second $t@710@01)) source_address@706@01 (as Size$Bool$<Snap$Usize>  Snap$Usize))
  (MemoryBlock$bytes ($Snap.second ($Snap.second $t@709@01)) source_address@706@01 (as Size$Bool$<Snap$Usize>  Snap$Usize))))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@710@01))) $Snap.unit))
; [eval] MemoryBlock$bytes(target_address, Size$Bool$()) == MemoryBlock$bytes(source_address, Size$Bool$())
; [eval] MemoryBlock$bytes(target_address, Size$Bool$())
; [eval] Size$Bool$()
(set-option :timeout 0)
(push) ; 3
(declare-const $k@713@01 $Perm)
(assert ($Perm.isReadVar $k@713@01))
(assert (< $k@713@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@713@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@713@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first $t@710@01) target_address@707@01 (as Size$Bool$<Snap$Usize>  Snap$Usize)))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@713@01))
(assert (and
  (< $k@713@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@713@01))
  (MemoryBlock$bytes%precondition ($Snap.first $t@710@01) target_address@707@01 (as Size$Bool$<Snap$Usize>  Snap$Usize))))
; [eval] MemoryBlock$bytes(source_address, Size$Bool$())
; [eval] Size$Bool$()
(set-option :timeout 0)
(push) ; 3
(declare-const $k@714@01 $Perm)
(assert ($Perm.isReadVar $k@714@01))
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= permission_amount@708@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (< $k@714@01 permission_amount@708@01))
(assert (<= $Perm.No (- permission_amount@708@01 $k@714@01)))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@714@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@714@01))
(assert (and
  (< $k@714@01 permission_amount@708@01)
  (<= $Perm.No (- permission_amount@708@01 $k@714@01))))
(assert (=
  (MemoryBlock$bytes ($Snap.first $t@710@01) target_address@707@01 (as Size$Bool$<Snap$Usize>  Snap$Usize))
  (MemoryBlock$bytes ($Snap.first ($Snap.second $t@710@01)) source_address@706@01 (as Size$Bool$<Snap$Usize>  Snap$Usize))))
(pop) ; 2
(set-option :timeout 0)
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- memory_copy$I64 ----------
(declare-const source_address@715@01 Address)
(declare-const target_address@716@01 Address)
(declare-const permission_amount@717@01 $Perm)
(declare-const source_address@718@01 Address)
(declare-const target_address@719@01 Address)
(declare-const permission_amount@720@01 $Perm)
(push) ; 1
(declare-const $t@721@01 $Snap)
(assert (= $t@721@01 ($Snap.combine ($Snap.first $t@721@01) ($Snap.second $t@721@01))))
(assert (= ($Snap.first $t@721@01) $Snap.unit))
; [eval] none < permission_amount
(assert (< $Perm.No permission_amount@720@01))
(assert (=
  ($Snap.second $t@721@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@721@01))
    ($Snap.second ($Snap.second $t@721@01)))))
; [eval] Size$I64$()
; [eval] Size$I64$()
(push) ; 2
(assert (not (or (= permission_amount@720@01 $Perm.No) (< $Perm.No permission_amount@720@01))))
(check-sat)
; unsat
(pop) ; 2
; 0.00s
; (get-info :all-statistics)
(push) ; 2
(set-option :timeout 10)
(assert (not (= target_address@719@01 source_address@718@01)))
(check-sat)
; unknown
(pop) ; 2
; 0.00s
; (get-info :all-statistics)
(assert (<= $Perm.No permission_amount@720@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@722@01 $Snap)
(assert (= $t@722@01 ($Snap.combine ($Snap.first $t@722@01) ($Snap.second $t@722@01))))
; [eval] Size$I64$()
(assert (=
  ($Snap.second $t@722@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@722@01))
    ($Snap.second ($Snap.second $t@722@01)))))
; [eval] Size$I64$()
(push) ; 3
(assert (not (or (= permission_amount@720@01 $Perm.No) (< $Perm.No permission_amount@720@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(push) ; 3
(set-option :timeout 10)
(assert (not (= target_address@719@01 source_address@718@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second $t@722@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@722@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@722@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@722@01))) $Snap.unit))
; [eval] MemoryBlock$bytes(source_address, Size$I64$()) == old(MemoryBlock$bytes(source_address, Size$I64$()))
; [eval] MemoryBlock$bytes(source_address, Size$I64$())
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 3
(declare-const $k@723@01 $Perm)
(assert ($Perm.isReadVar $k@723@01))
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= permission_amount@720@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (< $k@723@01 permission_amount@720@01))
(assert (<= $Perm.No (- permission_amount@720@01 $k@723@01)))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@723@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@722@01)) source_address@718@01 (as Size$I64$<Snap$Usize>  Snap$Usize)))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@723@01))
(assert (and
  (< $k@723@01 permission_amount@720@01)
  (<= $Perm.No (- permission_amount@720@01 $k@723@01))
  (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@722@01)) source_address@718@01 (as Size$I64$<Snap$Usize>  Snap$Usize))))
; [eval] old(MemoryBlock$bytes(source_address, Size$I64$()))
; [eval] MemoryBlock$bytes(source_address, Size$I64$())
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 3
(declare-const $k@724@01 $Perm)
(assert ($Perm.isReadVar $k@724@01))
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= permission_amount@720@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (< $k@724@01 permission_amount@720@01))
(assert (<= $Perm.No (- permission_amount@720@01 $k@724@01)))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@724@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.second ($Snap.second $t@721@01)) source_address@718@01 (as Size$I64$<Snap$Usize>  Snap$Usize)))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@724@01))
(assert (and
  (< $k@724@01 permission_amount@720@01)
  (<= $Perm.No (- permission_amount@720@01 $k@724@01))
  (MemoryBlock$bytes%precondition ($Snap.second ($Snap.second $t@721@01)) source_address@718@01 (as Size$I64$<Snap$Usize>  Snap$Usize))))
(assert (=
  (MemoryBlock$bytes ($Snap.first ($Snap.second $t@722@01)) source_address@718@01 (as Size$I64$<Snap$Usize>  Snap$Usize))
  (MemoryBlock$bytes ($Snap.second ($Snap.second $t@721@01)) source_address@718@01 (as Size$I64$<Snap$Usize>  Snap$Usize))))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@722@01))) $Snap.unit))
; [eval] MemoryBlock$bytes(target_address, Size$I64$()) == MemoryBlock$bytes(source_address, Size$I64$())
; [eval] MemoryBlock$bytes(target_address, Size$I64$())
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 3
(declare-const $k@725@01 $Perm)
(assert ($Perm.isReadVar $k@725@01))
(assert (< $k@725@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@725@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@725@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first $t@722@01) target_address@719@01 (as Size$I64$<Snap$Usize>  Snap$Usize)))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@725@01))
(assert (and
  (< $k@725@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@725@01))
  (MemoryBlock$bytes%precondition ($Snap.first $t@722@01) target_address@719@01 (as Size$I64$<Snap$Usize>  Snap$Usize))))
; [eval] MemoryBlock$bytes(source_address, Size$I64$())
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 3
(declare-const $k@726@01 $Perm)
(assert ($Perm.isReadVar $k@726@01))
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= permission_amount@720@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (< $k@726@01 permission_amount@720@01))
(assert (<= $Perm.No (- permission_amount@720@01 $k@726@01)))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@726@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@726@01))
(assert (and
  (< $k@726@01 permission_amount@720@01)
  (<= $Perm.No (- permission_amount@720@01 $k@726@01))))
(assert (=
  (MemoryBlock$bytes ($Snap.first $t@722@01) target_address@719@01 (as Size$I64$<Snap$Usize>  Snap$Usize))
  (MemoryBlock$bytes ($Snap.first ($Snap.second $t@722@01)) source_address@718@01 (as Size$I64$<Snap$Usize>  Snap$Usize))))
(pop) ; 2
(set-option :timeout 0)
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- move_place$Bool ----------
(declare-const target_place@727@01 Place)
(declare-const target_root_address@728@01 Address)
(declare-const source_place@729@01 Place)
(declare-const source_root_address@730@01 Address)
(declare-const source_snapshot@731@01 Snap$Bool)
(declare-const target_place@732@01 Place)
(declare-const target_root_address@733@01 Address)
(declare-const source_place@734@01 Place)
(declare-const source_root_address@735@01 Address)
(declare-const source_snapshot@736@01 Snap$Bool)
(push) ; 1
(declare-const $t@737@01 $Snap)
(assert (= $t@737@01 ($Snap.combine ($Snap.first $t@737@01) ($Snap.second $t@737@01))))
; [eval] compute_address(target_place, target_root_address)
; [eval] Size$Bool$()
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@738@01 $Snap)
(assert (= $t@738@01 ($Snap.combine ($Snap.first $t@738@01) ($Snap.second $t@738@01))))
(assert (=
  ($Snap.second $t@738@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@738@01))
    ($Snap.second ($Snap.second $t@738@01)))))
; [eval] compute_address(source_place, source_root_address)
; [eval] Size$Bool$()
(assert (= ($Snap.second ($Snap.second $t@738@01)) $Snap.unit))
; [eval] valid$Snap$Bool(source_snapshot)
(assert (valid$Snap$Bool<Bool> source_snapshot@736@01))
(pop) ; 2
(push) ; 2
; [exec]
; unfold acc(OwnedNonAliased$Bool(source_place, source_root_address, source_snapshot), write)
(assert (=
  ($Snap.second $t@737@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@737@01))
    ($Snap.second ($Snap.second $t@737@01)))))
(assert (= ($Snap.first ($Snap.second $t@737@01)) $Snap.unit))
; [eval] valid$Snap$Bool(snapshot)
(assert (valid$Snap$Bool<Bool> source_snapshot@736@01))
(assert (=
  ($Snap.second ($Snap.second $t@737@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@737@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@737@01))))))
; [eval] compute_address(place, root_address)
; [eval] Size$Bool$()
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> target_place@732@01 target_root_address@733@01)
  (compute_address<Address> source_place@734@01 source_root_address@735@01))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@737@01))) $Snap.unit))
; [eval] MemoryBlock$bytes(compute_address(place, root_address), Size$Bool$()) == to_bytes$Bool(snapshot)
; [eval] MemoryBlock$bytes(compute_address(place, root_address), Size$Bool$())
; [eval] compute_address(place, root_address)
; [eval] Size$Bool$()
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
(assert (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second ($Snap.second $t@737@01))) (compute_address<Address> source_place@734@01 source_root_address@735@01) (as Size$Bool$<Snap$Usize>  Snap$Usize)))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@739@01))
(assert (and
  (< $k@739@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@739@01))
  (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second ($Snap.second $t@737@01))) (compute_address<Address> source_place@734@01 source_root_address@735@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$Bool(snapshot)
(assert (=
  (MemoryBlock$bytes ($Snap.first ($Snap.second ($Snap.second $t@737@01))) (compute_address<Address> source_place@734@01 source_root_address@735@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
  (to_bytes$Bool<Bytes> source_snapshot@736@01)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (OwnedNonAliased$Bool%trigger ($Snap.second $t@737@01) source_place@734@01 source_root_address@735@01 source_snapshot@736@01))
; [exec]
; memory_copy$Bool(compute_address(source_place, source_root_address), compute_address(target_place,
;   target_root_address), write)
; [eval] compute_address(source_place, source_root_address)
; [eval] compute_address(target_place, target_root_address)
; [eval] none < permission_amount
; [eval] Size$Bool$()
; [eval] Size$Bool$()
(declare-const $t@740@01 $Snap)
(assert (= $t@740@01 ($Snap.combine ($Snap.first $t@740@01) ($Snap.second $t@740@01))))
; [eval] Size$Bool$()
(assert (=
  ($Snap.second $t@740@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@740@01))
    ($Snap.second ($Snap.second $t@740@01)))))
; [eval] Size$Bool$()
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> target_place@732@01 target_root_address@733@01)
  (compute_address<Address> source_place@734@01 source_root_address@735@01))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second $t@740@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@740@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@740@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@740@01))) $Snap.unit))
; [eval] MemoryBlock$bytes(source_address, Size$Bool$()) == old(MemoryBlock$bytes(source_address, Size$Bool$()))
; [eval] MemoryBlock$bytes(source_address, Size$Bool$())
; [eval] Size$Bool$()
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
(assert (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@740@01)) (compute_address<Address> source_place@734@01 source_root_address@735@01) (as Size$Bool$<Snap$Usize>  Snap$Usize)))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@741@01))
(assert (and
  (< $k@741@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@741@01))
  (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@740@01)) (compute_address<Address> source_place@734@01 source_root_address@735@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))))
; [eval] old(MemoryBlock$bytes(source_address, Size$Bool$()))
; [eval] MemoryBlock$bytes(source_address, Size$Bool$())
; [eval] Size$Bool$()
(set-option :timeout 0)
(push) ; 3
(declare-const $k@742@01 $Perm)
(assert ($Perm.isReadVar $k@742@01))
(assert (< $k@742@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@742@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@742@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@742@01))
(assert (and (< $k@742@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@742@01))))
(assert (=
  (MemoryBlock$bytes ($Snap.first ($Snap.second $t@740@01)) (compute_address<Address> source_place@734@01 source_root_address@735@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
  (MemoryBlock$bytes ($Snap.first ($Snap.second ($Snap.second $t@737@01))) (compute_address<Address> source_place@734@01 source_root_address@735@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@740@01))) $Snap.unit))
; [eval] MemoryBlock$bytes(target_address, Size$Bool$()) == MemoryBlock$bytes(source_address, Size$Bool$())
; [eval] MemoryBlock$bytes(target_address, Size$Bool$())
; [eval] Size$Bool$()
(set-option :timeout 0)
(push) ; 3
(declare-const $k@743@01 $Perm)
(assert ($Perm.isReadVar $k@743@01))
(assert (< $k@743@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@743@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@743@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first $t@740@01) (compute_address<Address> target_place@732@01 target_root_address@733@01) (as Size$Bool$<Snap$Usize>  Snap$Usize)))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@743@01))
(assert (and
  (< $k@743@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@743@01))
  (MemoryBlock$bytes%precondition ($Snap.first $t@740@01) (compute_address<Address> target_place@732@01 target_root_address@733@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))))
; [eval] MemoryBlock$bytes(source_address, Size$Bool$())
; [eval] Size$Bool$()
(set-option :timeout 0)
(push) ; 3
(declare-const $k@744@01 $Perm)
(assert ($Perm.isReadVar $k@744@01))
(assert (< $k@744@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@744@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@744@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@744@01))
(assert (and (< $k@744@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@744@01))))
(assert (=
  (MemoryBlock$bytes ($Snap.first $t@740@01) (compute_address<Address> target_place@732@01 target_root_address@733@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
  (MemoryBlock$bytes ($Snap.first ($Snap.second $t@740@01)) (compute_address<Address> source_place@734@01 source_root_address@735@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))))
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
(declare-const $k@745@01 $Perm)
(assert ($Perm.isReadVar $k@745@01))
(assert (< $k@745@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@745@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@745@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@745@01))
(assert (and (< $k@745@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@745@01))))
; [eval] to_bytes$Bool(snapshot)
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  (MemoryBlock$bytes ($Snap.first $t@740@01) (compute_address<Address> target_place@732@01 target_root_address@733@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
  (to_bytes$Bool<Bytes> source_snapshot@736@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (=
  (MemoryBlock$bytes ($Snap.first $t@740@01) (compute_address<Address> target_place@732@01 target_root_address@733@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
  (to_bytes$Bool<Bytes> source_snapshot@736@01)))
(assert (OwnedNonAliased$Bool%trigger ($Snap.combine
  $Snap.unit
  ($Snap.combine ($Snap.first $t@740@01) $Snap.unit)) target_place@732@01 target_root_address@733@01 source_snapshot@736@01))
; [eval] compute_address(source_place, source_root_address)
; [eval] Size$Bool$()
; [eval] valid$Snap$Bool(source_snapshot)
(pop) ; 2
(pop) ; 1
; ---------- move_place$I64 ----------
(declare-const target_place@746@01 Place)
(declare-const target_root_address@747@01 Address)
(declare-const source_place@748@01 Place)
(declare-const source_root_address@749@01 Address)
(declare-const source_snapshot@750@01 Snap$I64)
(declare-const target_place@751@01 Place)
(declare-const target_root_address@752@01 Address)
(declare-const source_place@753@01 Place)
(declare-const source_root_address@754@01 Address)
(declare-const source_snapshot@755@01 Snap$I64)
(push) ; 1
(declare-const $t@756@01 $Snap)
(assert (= $t@756@01 ($Snap.combine ($Snap.first $t@756@01) ($Snap.second $t@756@01))))
; [eval] compute_address(target_place, target_root_address)
; [eval] Size$I64$()
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@757@01 $Snap)
(assert (= $t@757@01 ($Snap.combine ($Snap.first $t@757@01) ($Snap.second $t@757@01))))
(assert (=
  ($Snap.second $t@757@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@757@01))
    ($Snap.second ($Snap.second $t@757@01)))))
; [eval] compute_address(source_place, source_root_address)
; [eval] Size$I64$()
(assert (= ($Snap.second ($Snap.second $t@757@01)) $Snap.unit))
; [eval] valid$Snap$I64(source_snapshot)
(assert (valid$Snap$I64<Bool> source_snapshot@755@01))
(pop) ; 2
(push) ; 2
; [exec]
; unfold acc(OwnedNonAliased$I64(source_place, source_root_address, source_snapshot), write)
(assert (=
  ($Snap.second $t@756@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@756@01))
    ($Snap.second ($Snap.second $t@756@01)))))
(assert (= ($Snap.first ($Snap.second $t@756@01)) $Snap.unit))
; [eval] valid$Snap$I64(snapshot)
(assert (valid$Snap$I64<Bool> source_snapshot@755@01))
(assert (=
  ($Snap.second ($Snap.second $t@756@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@756@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@756@01))))))
; [eval] compute_address(place, root_address)
; [eval] Size$I64$()
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> target_place@751@01 target_root_address@752@01)
  (compute_address<Address> source_place@753@01 source_root_address@754@01))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@756@01))) $Snap.unit))
; [eval] MemoryBlock$bytes(compute_address(place, root_address), Size$I64$()) == to_bytes$I64(snapshot)
; [eval] MemoryBlock$bytes(compute_address(place, root_address), Size$I64$())
; [eval] compute_address(place, root_address)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 3
(declare-const $k@758@01 $Perm)
(assert ($Perm.isReadVar $k@758@01))
(assert (< $k@758@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@758@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@758@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second ($Snap.second $t@756@01))) (compute_address<Address> source_place@753@01 source_root_address@754@01) (as Size$I64$<Snap$Usize>  Snap$Usize)))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@758@01))
(assert (and
  (< $k@758@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@758@01))
  (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second ($Snap.second $t@756@01))) (compute_address<Address> source_place@753@01 source_root_address@754@01) (as Size$I64$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$I64(snapshot)
(assert (=
  (MemoryBlock$bytes ($Snap.first ($Snap.second ($Snap.second $t@756@01))) (compute_address<Address> source_place@753@01 source_root_address@754@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
  (to_bytes$I64<Bytes> source_snapshot@755@01)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (OwnedNonAliased$I64%trigger ($Snap.second $t@756@01) source_place@753@01 source_root_address@754@01 source_snapshot@755@01))
; [exec]
; memory_copy$I64(compute_address(source_place, source_root_address), compute_address(target_place,
;   target_root_address), write)
; [eval] compute_address(source_place, source_root_address)
; [eval] compute_address(target_place, target_root_address)
; [eval] none < permission_amount
; [eval] Size$I64$()
; [eval] Size$I64$()
(declare-const $t@759@01 $Snap)
(assert (= $t@759@01 ($Snap.combine ($Snap.first $t@759@01) ($Snap.second $t@759@01))))
; [eval] Size$I64$()
(assert (=
  ($Snap.second $t@759@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@759@01))
    ($Snap.second ($Snap.second $t@759@01)))))
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> target_place@751@01 target_root_address@752@01)
  (compute_address<Address> source_place@753@01 source_root_address@754@01))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second $t@759@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@759@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@759@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@759@01))) $Snap.unit))
; [eval] MemoryBlock$bytes(source_address, Size$I64$()) == old(MemoryBlock$bytes(source_address, Size$I64$()))
; [eval] MemoryBlock$bytes(source_address, Size$I64$())
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 3
(declare-const $k@760@01 $Perm)
(assert ($Perm.isReadVar $k@760@01))
(assert (< $k@760@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@760@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@760@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@759@01)) (compute_address<Address> source_place@753@01 source_root_address@754@01) (as Size$I64$<Snap$Usize>  Snap$Usize)))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@760@01))
(assert (and
  (< $k@760@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@760@01))
  (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@759@01)) (compute_address<Address> source_place@753@01 source_root_address@754@01) (as Size$I64$<Snap$Usize>  Snap$Usize))))
; [eval] old(MemoryBlock$bytes(source_address, Size$I64$()))
; [eval] MemoryBlock$bytes(source_address, Size$I64$())
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 3
(declare-const $k@761@01 $Perm)
(assert ($Perm.isReadVar $k@761@01))
(assert (< $k@761@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@761@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@761@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@761@01))
(assert (and (< $k@761@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@761@01))))
(assert (=
  (MemoryBlock$bytes ($Snap.first ($Snap.second $t@759@01)) (compute_address<Address> source_place@753@01 source_root_address@754@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
  (MemoryBlock$bytes ($Snap.first ($Snap.second ($Snap.second $t@756@01))) (compute_address<Address> source_place@753@01 source_root_address@754@01) (as Size$I64$<Snap$Usize>  Snap$Usize))))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@759@01))) $Snap.unit))
; [eval] MemoryBlock$bytes(target_address, Size$I64$()) == MemoryBlock$bytes(source_address, Size$I64$())
; [eval] MemoryBlock$bytes(target_address, Size$I64$())
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 3
(declare-const $k@762@01 $Perm)
(assert ($Perm.isReadVar $k@762@01))
(assert (< $k@762@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@762@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@762@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first $t@759@01) (compute_address<Address> target_place@751@01 target_root_address@752@01) (as Size$I64$<Snap$Usize>  Snap$Usize)))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@762@01))
(assert (and
  (< $k@762@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@762@01))
  (MemoryBlock$bytes%precondition ($Snap.first $t@759@01) (compute_address<Address> target_place@751@01 target_root_address@752@01) (as Size$I64$<Snap$Usize>  Snap$Usize))))
; [eval] MemoryBlock$bytes(source_address, Size$I64$())
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 3
(declare-const $k@763@01 $Perm)
(assert ($Perm.isReadVar $k@763@01))
(assert (< $k@763@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@763@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@763@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@763@01))
(assert (and (< $k@763@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@763@01))))
(assert (=
  (MemoryBlock$bytes ($Snap.first $t@759@01) (compute_address<Address> target_place@751@01 target_root_address@752@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
  (MemoryBlock$bytes ($Snap.first ($Snap.second $t@759@01)) (compute_address<Address> source_place@753@01 source_root_address@754@01) (as Size$I64$<Snap$Usize>  Snap$Usize))))
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
(declare-const $k@764@01 $Perm)
(assert ($Perm.isReadVar $k@764@01))
(assert (< $k@764@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@764@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@764@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@764@01))
(assert (and (< $k@764@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@764@01))))
; [eval] to_bytes$I64(snapshot)
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  (MemoryBlock$bytes ($Snap.first $t@759@01) (compute_address<Address> target_place@751@01 target_root_address@752@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
  (to_bytes$I64<Bytes> source_snapshot@755@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (=
  (MemoryBlock$bytes ($Snap.first $t@759@01) (compute_address<Address> target_place@751@01 target_root_address@752@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
  (to_bytes$I64<Bytes> source_snapshot@755@01)))
(assert (OwnedNonAliased$I64%trigger ($Snap.combine
  $Snap.unit
  ($Snap.combine ($Snap.first $t@759@01) $Snap.unit)) target_place@751@01 target_root_address@752@01 source_snapshot@755@01))
; [eval] compute_address(source_place, source_root_address)
; [eval] Size$I64$()
; [eval] valid$Snap$I64(source_snapshot)
(pop) ; 2
(pop) ; 1
; ---------- write_address_constant$Bool ----------
(declare-const target_address@765@01 Address)
(declare-const source_snapshot@766@01 Snap$Bool)
(declare-const target_address@767@01 Address)
(declare-const source_snapshot@768@01 Snap$Bool)
(push) ; 1
; [eval] Size$Bool$()
(declare-const $t@769@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@770@01 $Snap)
(assert (= $t@770@01 ($Snap.combine ($Snap.first $t@770@01) ($Snap.second $t@770@01))))
; [eval] Size$Bool$()
(assert (= ($Snap.second $t@770@01) $Snap.unit))
; [eval] MemoryBlock$bytes(target_address, Size$Bool$()) == to_bytes$Bool(source_snapshot)
; [eval] MemoryBlock$bytes(target_address, Size$Bool$())
; [eval] Size$Bool$()
(push) ; 3
(declare-const $k@771@01 $Perm)
(assert ($Perm.isReadVar $k@771@01))
(assert (< $k@771@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@771@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@771@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first $t@770@01) target_address@767@01 (as Size$Bool$<Snap$Usize>  Snap$Usize)))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@771@01))
(assert (and
  (< $k@771@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@771@01))
  (MemoryBlock$bytes%precondition ($Snap.first $t@770@01) target_address@767@01 (as Size$Bool$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$Bool(source_snapshot)
(assert (=
  (MemoryBlock$bytes ($Snap.first $t@770@01) target_address@767@01 (as Size$Bool$<Snap$Usize>  Snap$Usize))
  (to_bytes$Bool<Bytes> source_snapshot@768@01)))
(pop) ; 2
(set-option :timeout 0)
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- write_address_constant$I64 ----------
(declare-const target_address@772@01 Address)
(declare-const source_snapshot@773@01 Snap$I64)
(declare-const target_address@774@01 Address)
(declare-const source_snapshot@775@01 Snap$I64)
(push) ; 1
; [eval] Size$I64$()
(declare-const $t@776@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@777@01 $Snap)
(assert (= $t@777@01 ($Snap.combine ($Snap.first $t@777@01) ($Snap.second $t@777@01))))
; [eval] Size$I64$()
(assert (= ($Snap.second $t@777@01) $Snap.unit))
; [eval] MemoryBlock$bytes(target_address, Size$I64$()) == to_bytes$I64(source_snapshot)
; [eval] MemoryBlock$bytes(target_address, Size$I64$())
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
(assert (MemoryBlock$bytes%precondition ($Snap.first $t@777@01) target_address@774@01 (as Size$I64$<Snap$Usize>  Snap$Usize)))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@778@01))
(assert (and
  (< $k@778@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@778@01))
  (MemoryBlock$bytes%precondition ($Snap.first $t@777@01) target_address@774@01 (as Size$I64$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$I64(source_snapshot)
(assert (=
  (MemoryBlock$bytes ($Snap.first $t@777@01) target_address@774@01 (as Size$I64$<Snap$Usize>  Snap$Usize))
  (to_bytes$I64<Bytes> source_snapshot@775@01)))
(pop) ; 2
(set-option :timeout 0)
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- write_place_constant$Bool ----------
(declare-const target_place@779@01 Place)
(declare-const target_root_address@780@01 Address)
(declare-const source_snapshot@781@01 Snap$Bool)
(declare-const target_place@782@01 Place)
(declare-const target_root_address@783@01 Address)
(declare-const source_snapshot@784@01 Snap$Bool)
(push) ; 1
(declare-const $t@785@01 $Snap)
(assert (= $t@785@01 ($Snap.combine ($Snap.first $t@785@01) ($Snap.second $t@785@01))))
; [eval] compute_address(target_place, target_root_address)
; [eval] Size$Bool$()
(assert (= ($Snap.second $t@785@01) $Snap.unit))
; [eval] valid$Snap$Bool(source_snapshot)
(assert (valid$Snap$Bool<Bool> source_snapshot@784@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@786@01 $Snap)
(pop) ; 2
(push) ; 2
; [exec]
; write_address_constant$Bool(compute_address(target_place, target_root_address),
;   source_snapshot)
; [eval] compute_address(target_place, target_root_address)
; [eval] Size$Bool$()
(declare-const $t@787@01 $Snap)
(assert (= $t@787@01 ($Snap.combine ($Snap.first $t@787@01) ($Snap.second $t@787@01))))
; [eval] Size$Bool$()
(assert (= ($Snap.second $t@787@01) $Snap.unit))
; [eval] MemoryBlock$bytes(target_address, Size$Bool$()) == to_bytes$Bool(source_snapshot)
; [eval] MemoryBlock$bytes(target_address, Size$Bool$())
; [eval] Size$Bool$()
(push) ; 3
(declare-const $k@788@01 $Perm)
(assert ($Perm.isReadVar $k@788@01))
(assert (< $k@788@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@788@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@788@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first $t@787@01) (compute_address<Address> target_place@782@01 target_root_address@783@01) (as Size$Bool$<Snap$Usize>  Snap$Usize)))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@788@01))
(assert (and
  (< $k@788@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@788@01))
  (MemoryBlock$bytes%precondition ($Snap.first $t@787@01) (compute_address<Address> target_place@782@01 target_root_address@783@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$Bool(source_snapshot)
(assert (=
  (MemoryBlock$bytes ($Snap.first $t@787@01) (compute_address<Address> target_place@782@01 target_root_address@783@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
  (to_bytes$Bool<Bytes> source_snapshot@784@01)))
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
(declare-const $k@789@01 $Perm)
(assert ($Perm.isReadVar $k@789@01))
(assert (< $k@789@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@789@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@789@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@789@01))
(assert (and (< $k@789@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@789@01))))
; [eval] to_bytes$Bool(snapshot)
(assert (OwnedNonAliased$Bool%trigger ($Snap.combine
  $Snap.unit
  ($Snap.combine ($Snap.first $t@787@01) $Snap.unit)) target_place@782@01 target_root_address@783@01 source_snapshot@784@01))
(pop) ; 2
(pop) ; 1
; ---------- write_place_constant$I64 ----------
(declare-const target_place@790@01 Place)
(declare-const target_root_address@791@01 Address)
(declare-const source_snapshot@792@01 Snap$I64)
(declare-const target_place@793@01 Place)
(declare-const target_root_address@794@01 Address)
(declare-const source_snapshot@795@01 Snap$I64)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@796@01 $Snap)
(assert (= $t@796@01 ($Snap.combine ($Snap.first $t@796@01) ($Snap.second $t@796@01))))
; [eval] compute_address(target_place, target_root_address)
; [eval] Size$I64$()
(assert (= ($Snap.second $t@796@01) $Snap.unit))
; [eval] valid$Snap$I64(source_snapshot)
(assert (valid$Snap$I64<Bool> source_snapshot@795@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@797@01 $Snap)
(pop) ; 2
(push) ; 2
; [exec]
; write_address_constant$I64(compute_address(target_place, target_root_address),
;   source_snapshot)
; [eval] compute_address(target_place, target_root_address)
; [eval] Size$I64$()
(declare-const $t@798@01 $Snap)
(assert (= $t@798@01 ($Snap.combine ($Snap.first $t@798@01) ($Snap.second $t@798@01))))
; [eval] Size$I64$()
(assert (= ($Snap.second $t@798@01) $Snap.unit))
; [eval] MemoryBlock$bytes(target_address, Size$I64$()) == to_bytes$I64(source_snapshot)
; [eval] MemoryBlock$bytes(target_address, Size$I64$())
; [eval] Size$I64$()
(push) ; 3
(declare-const $k@799@01 $Perm)
(assert ($Perm.isReadVar $k@799@01))
(assert (< $k@799@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@799@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@799@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first $t@798@01) (compute_address<Address> target_place@793@01 target_root_address@794@01) (as Size$I64$<Snap$Usize>  Snap$Usize)))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@799@01))
(assert (and
  (< $k@799@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@799@01))
  (MemoryBlock$bytes%precondition ($Snap.first $t@798@01) (compute_address<Address> target_place@793@01 target_root_address@794@01) (as Size$I64$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$I64(source_snapshot)
(assert (=
  (MemoryBlock$bytes ($Snap.first $t@798@01) (compute_address<Address> target_place@793@01 target_root_address@794@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
  (to_bytes$I64<Bytes> source_snapshot@795@01)))
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
(declare-const $k@800@01 $Perm)
(assert ($Perm.isReadVar $k@800@01))
(assert (< $k@800@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@800@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@800@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@800@01))
(assert (and (< $k@800@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@800@01))))
; [eval] to_bytes$I64(snapshot)
(assert (OwnedNonAliased$I64%trigger ($Snap.combine
  $Snap.unit
  ($Snap.combine ($Snap.first $t@798@01) $Snap.unit)) target_place@793@01 target_root_address@794@01 source_snapshot@795@01))
(pop) ; 2
(pop) ; 1
; ---------- write_place_constant$Tuple$$$ ----------
(declare-const target_place@801@01 Place)
(declare-const target_root_address@802@01 Address)
(declare-const source_snapshot@803@01 Snap$Tuple$$$)
(declare-const target_place@804@01 Place)
(declare-const target_root_address@805@01 Address)
(declare-const source_snapshot@806@01 Snap$Tuple$$$)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@807@01 $Snap)
(assert (= $t@807@01 ($Snap.combine ($Snap.first $t@807@01) ($Snap.second $t@807@01))))
; [eval] compute_address(target_place, target_root_address)
; [eval] Size$Tuple$$$$()
(assert (= ($Snap.second $t@807@01) $Snap.unit))
; [eval] valid$Snap$Tuple$$$(source_snapshot)
(assert (valid$Snap$Tuple$$$<Bool> source_snapshot@806@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@808@01 $Snap)
(pop) ; 2
(push) ; 2
; [exec]
; memory_block_split$Tuple$$$(compute_address(target_place, target_root_address),
;   write)
; [eval] compute_address(target_place, target_root_address)
; [eval] none < permission_amount
; [eval] Size$Tuple$$$$()
(declare-const $t@809@01 $Snap)
(assert (= $t@809@01 ($Snap.combine ($Snap.first $t@809@01) ($Snap.second $t@809@01))))
; [eval] PaddingSize$Tuple$$$$()
(assert (= ($Snap.second $t@809@01) $Snap.unit))
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
  ($Snap.first $t@809@01)) target_place@804@01 target_root_address@805@01 source_snapshot@806@01))
(pop) ; 2
(pop) ; 1
