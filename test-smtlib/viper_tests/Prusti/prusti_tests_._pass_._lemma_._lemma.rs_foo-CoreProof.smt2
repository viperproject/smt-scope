(get-info :version)
; (:version "4.12.1")
; Started: 2023-10-31 14:07:36
; Silicon.version: 1.1-SNAPSHOT (46944a65@dspil_symbenchmarking)
; Input file: /home/pcorrect/repos/benchmarking_general/silicon_tests/prusti_tests_._pass_._lemma_._lemma.rs_foo-CoreProof.vpr
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
(declare-fun constructor$Snap$I64$<Snap$I64> (Int) Snap$I64)
(declare-fun destructor$Snap$I64$$value<Int> (Snap$I64) Int)
(declare-fun valid$Snap$I64<Bool> (Snap$I64) Bool)
(declare-fun to_bytes$I64<Bytes> (Snap$I64) Bytes)
(declare-fun constructor$Snap$I64$Mul_I64<Snap$I64> (Snap$I64 Snap$I64) Snap$I64)
(declare-fun destructor$Snap$I64$Mul_I64$left<Snap$I64> (Snap$I64) Snap$I64)
(declare-fun destructor$Snap$I64$Mul_I64$right<Snap$I64> (Snap$I64) Snap$I64)
(declare-fun constructor$Snap$I64$Mod_I64<Snap$I64> (Snap$I64 Snap$I64) Snap$I64)
(declare-fun destructor$Snap$I64$Mod_I64$left<Snap$I64> (Snap$I64) Snap$I64)
(declare-fun destructor$Snap$I64$Mod_I64$right<Snap$I64> (Snap$I64) Snap$I64)
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
(declare-fun included<Bool> (Lifetime Lifetime) Bool)
(declare-fun intersect<Lifetime> (Set<Lifetime>) Lifetime)
(declare-const constructor$Snap$Tuple$$$$<Snap$Tuple$$$> Snap$Tuple$$$)
(declare-fun valid$Snap$Tuple$$$<Bool> (Snap$Tuple$$$) Bool)
(declare-fun to_bytes$Tuple$$$<Bytes> (Snap$Tuple$$$) Bytes)
(declare-fun compute_address<Address> (Place Address) Address)
(declare-const constructor$Snap$Never$<Snap$Never> Snap$Never)
(declare-fun valid$Snap$Never<Bool> (Snap$Never) Bool)
(declare-fun constructor$Snap$Bool$<Snap$Bool> (Bool) Snap$Bool)
(declare-fun destructor$Snap$Bool$$value<Bool> (Snap$Bool) Bool)
(declare-fun valid$Snap$Bool<Bool> (Snap$Bool) Bool)
(declare-fun to_bytes$Bool<Bytes> (Snap$Bool) Bytes)
(declare-fun constructor$Snap$Bool$EqCmp_Tuple$$$<Snap$Bool> (Snap$Tuple$$$ Snap$Tuple$$$) Snap$Bool)
(declare-fun destructor$Snap$Bool$EqCmp_Tuple$$$$left<Snap$Tuple$$$> (Snap$Bool) Snap$Tuple$$$)
(declare-fun destructor$Snap$Bool$EqCmp_Tuple$$$$right<Snap$Tuple$$$> (Snap$Bool) Snap$Tuple$$$)
(declare-fun constructor$Snap$Bool$EqCmp_I64<Snap$Bool> (Snap$I64 Snap$I64) Snap$Bool)
(declare-fun destructor$Snap$Bool$EqCmp_I64$left<Snap$I64> (Snap$Bool) Snap$I64)
(declare-fun destructor$Snap$Bool$EqCmp_I64$right<Snap$I64> (Snap$Bool) Snap$I64)
(declare-fun constructor$Snap$Bool$And_Bool<Snap$Bool> (Snap$Bool Snap$Bool) Snap$Bool)
(declare-fun destructor$Snap$Bool$And_Bool$left<Snap$Bool> (Snap$Bool) Snap$Bool)
(declare-fun destructor$Snap$Bool$And_Bool$right<Snap$Bool> (Snap$Bool) Snap$Bool)
(declare-fun constructor$Snap$Bool$Not_Bool<Snap$Bool> (Snap$Bool) Snap$Bool)
(declare-fun destructor$Snap$Bool$Not_Bool$argument<Snap$Bool> (Snap$Bool) Snap$Bool)
(declare-const basic_block_marker$start_label$marker<Bool> Bool)
(declare-const basic_block_marker$label_entry$marker<Bool> Bool)
(declare-const basic_block_marker$label_bb0$marker<Bool> Bool)
(declare-const basic_block_marker$label_bb1$marker<Bool> Bool)
(declare-const basic_block_marker$label_3_custom$marker<Bool> Bool)
(declare-const basic_block_marker$label_2_custom$marker<Bool> Bool)
(declare-const basic_block_marker$label_bb2$marker<Bool> Bool)
(declare-const basic_block_marker$label_bb4$marker<Bool> Bool)
(declare-const basic_block_marker$label_bb5$marker<Bool> Bool)
(declare-const basic_block_marker$label_6_custom$marker<Bool> Bool)
(declare-const basic_block_marker$label_5_custom$marker<Bool> Bool)
(declare-const basic_block_marker$label_bb6$marker<Bool> Bool)
(declare-const basic_block_marker$label_bb7$marker<Bool> Bool)
(declare-const basic_block_marker$label_bb9$marker<Bool> Bool)
(declare-const basic_block_marker$label_bb10$marker<Bool> Bool)
(declare-const basic_block_marker$label_bb11$marker<Bool> Bool)
(declare-const basic_block_marker$label_bb12$marker<Bool> Bool)
(declare-const basic_block_marker$label_8_custom$marker<Bool> Bool)
(declare-const basic_block_marker$label_bb13$marker<Bool> Bool)
(declare-const basic_block_marker$label_bb15$marker<Bool> Bool)
(declare-const basic_block_marker$resume_panic_label$marker<Bool> Bool)
(declare-const basic_block_marker$label_7_custom$marker<Bool> Bool)
(declare-const basic_block_marker$label_bb14$marker<Bool> Bool)
(declare-const basic_block_marker$return_label$marker<Bool> Bool)
(declare-const basic_block_marker$end_label$marker<Bool> Bool)
(declare-const _1$place<Place> Place)
(declare-const _3$place<Place> Place)
(declare-fun field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (Place) Place)
(declare-fun field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (Place) Place)
(declare-const _4$place<Place> Place)
(declare-const _2$place<Place> Place)
(declare-const _6$place<Place> Place)
(declare-const _5$place<Place> Place)
(declare-const _9$place<Place> Place)
(declare-const _8$place<Place> Place)
(declare-const _14$place<Place> Place)
(declare-const _13$place<Place> Place)
(declare-const _12$place<Place> Place)
(declare-const _11$place<Place> Place)
(declare-const _16$place<Place> Place)
(declare-const _15$place<Place> Place)
(declare-const _7$place<Place> Place)
(declare-const _22$place<Place> Place)
(declare-const _23$place<Place> Place)
(declare-const _24$place<Place> Place)
(declare-const _25$place<Place> Place)
(declare-const _26$place<Place> Place)
(declare-const _21$place<Place> Place)
(declare-const _20$place<Place> Place)
(declare-const _19$place<Place> Place)
(declare-const _18$place<Place> Place)
(declare-const _0$place<Place> Place)
(declare-const Size$Tuple$$$$<Snap$Usize> Snap$Usize)
(declare-const Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize> Snap$Usize)
(declare-const Size$Bool$<Snap$Usize> Snap$Usize)
(declare-const Size$I64$<Snap$Usize> Snap$Usize)
(declare-const PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize> Snap$Usize)
(declare-const PaddingSize$Tuple$$$$<Snap$Usize> Snap$Usize)
(declare-const Size$Never$<Snap$Usize> Snap$Usize)
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
(assert (distinct _3$place<Place> _22$place<Place> _23$place<Place> _0$place<Place> _5$place<Place> _2$place<Place> _15$place<Place> _4$place<Place> _20$place<Place> _7$place<Place> _25$place<Place> _26$place<Place> _14$place<Place> _1$place<Place> _9$place<Place> _16$place<Place> _13$place<Place> _21$place<Place> _8$place<Place> _19$place<Place> _11$place<Place> _12$place<Place> _18$place<Place> _6$place<Place> _24$place<Place>))
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
      (constructor$Snap$I64$Mul_I64<Snap$I64> (constructor$Snap$I64$<Snap$I64> left) (constructor$Snap$I64$<Snap$I64> right))
      (constructor$Snap$I64$<Snap$I64> (* left right))))
  :pattern ((constructor$Snap$I64$Mul_I64<Snap$I64> (constructor$Snap$I64$<Snap$I64> left) (constructor$Snap$I64$<Snap$I64> right)))
  :qid |prog.Mul_I64$simplification_axiom|)))
(assert (forall ((left Snap$I64) (right Snap$I64)) (!
  (=
    (destructor$Snap$I64$$value<Int> (constructor$Snap$I64$Mul_I64<Snap$I64> left right))
    (*
      (destructor$Snap$I64$$value<Int> left)
      (destructor$Snap$I64$$value<Int> right)))
  :pattern ((destructor$Snap$I64$$value<Int> (constructor$Snap$I64$Mul_I64<Snap$I64> left right)))
  :qid |prog.Mul_I64$eval_axiom|)))
(assert (forall ((left Int) (right Int)) (!
  (=>
    (and
      (valid$Snap$I64<Bool> (constructor$Snap$I64$<Snap$I64> left))
      (valid$Snap$I64<Bool> (constructor$Snap$I64$<Snap$I64> right)))
    (=
      (constructor$Snap$I64$Mod_I64<Snap$I64> (constructor$Snap$I64$<Snap$I64> left) (constructor$Snap$I64$<Snap$I64> right))
      (constructor$Snap$I64$<Snap$I64> (mod left right))))
  :pattern ((constructor$Snap$I64$Mod_I64<Snap$I64> (constructor$Snap$I64$<Snap$I64> left) (constructor$Snap$I64$<Snap$I64> right)))
  :qid |prog.Mod_I64$simplification_axiom|)))
(assert (forall ((left Snap$I64) (right Snap$I64)) (!
  (=
    (destructor$Snap$I64$$value<Int> (constructor$Snap$I64$Mod_I64<Snap$I64> left right))
    (mod
      (destructor$Snap$I64$$value<Int> left)
      (destructor$Snap$I64$$value<Int> right)))
  :pattern ((destructor$Snap$I64$$value<Int> (constructor$Snap$I64$Mod_I64<Snap$I64> left right)))
  :qid |prog.Mod_I64$eval_axiom|)))
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
(assert (valid$Snap$Tuple$$$<Bool> (as constructor$Snap$Tuple$$$$<Snap$Tuple$$$>  Snap$Tuple$$$)))
(assert (forall ((address Address)) (!
  (= (compute_address<Address> (as _1$place<Place>  Place) address) address)
  :pattern ((compute_address<Address> (as _1$place<Place>  Place) address))
  :qid |prog.root$1$compute_address_axiom|)))
(assert (forall ((address Address)) (!
  (= (compute_address<Address> (as _3$place<Place>  Place) address) address)
  :pattern ((compute_address<Address> (as _3$place<Place>  Place) address))
  :qid |prog.root$2$compute_address_axiom|)))
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
  (= (compute_address<Address> (as _4$place<Place>  Place) address) address)
  :pattern ((compute_address<Address> (as _4$place<Place>  Place) address))
  :qid |prog.root$3$compute_address_axiom|)))
(assert (forall ((address Address)) (!
  (= (compute_address<Address> (as _2$place<Place>  Place) address) address)
  :pattern ((compute_address<Address> (as _2$place<Place>  Place) address))
  :qid |prog.root$4$compute_address_axiom|)))
(assert (forall ((address Address)) (!
  (= (compute_address<Address> (as _6$place<Place>  Place) address) address)
  :pattern ((compute_address<Address> (as _6$place<Place>  Place) address))
  :qid |prog.root$5$compute_address_axiom|)))
(assert (forall ((address Address)) (!
  (= (compute_address<Address> (as _5$place<Place>  Place) address) address)
  :pattern ((compute_address<Address> (as _5$place<Place>  Place) address))
  :qid |prog.root$6$compute_address_axiom|)))
(assert (forall ((address Address)) (!
  (= (compute_address<Address> (as _9$place<Place>  Place) address) address)
  :pattern ((compute_address<Address> (as _9$place<Place>  Place) address))
  :qid |prog.root$7$compute_address_axiom|)))
(assert (forall ((address Address)) (!
  (= (compute_address<Address> (as _8$place<Place>  Place) address) address)
  :pattern ((compute_address<Address> (as _8$place<Place>  Place) address))
  :qid |prog.root$8$compute_address_axiom|)))
(assert (forall ((address Address)) (!
  (= (compute_address<Address> (as _14$place<Place>  Place) address) address)
  :pattern ((compute_address<Address> (as _14$place<Place>  Place) address))
  :qid |prog.root$9$compute_address_axiom|)))
(assert (forall ((address Address)) (!
  (= (compute_address<Address> (as _13$place<Place>  Place) address) address)
  :pattern ((compute_address<Address> (as _13$place<Place>  Place) address))
  :qid |prog.root$10$compute_address_axiom|)))
(assert (forall ((address Address)) (!
  (= (compute_address<Address> (as _12$place<Place>  Place) address) address)
  :pattern ((compute_address<Address> (as _12$place<Place>  Place) address))
  :qid |prog.root$11$compute_address_axiom|)))
(assert (forall ((address Address)) (!
  (= (compute_address<Address> (as _11$place<Place>  Place) address) address)
  :pattern ((compute_address<Address> (as _11$place<Place>  Place) address))
  :qid |prog.root$12$compute_address_axiom|)))
(assert (forall ((address Address)) (!
  (= (compute_address<Address> (as _16$place<Place>  Place) address) address)
  :pattern ((compute_address<Address> (as _16$place<Place>  Place) address))
  :qid |prog.root$13$compute_address_axiom|)))
(assert (forall ((address Address)) (!
  (= (compute_address<Address> (as _15$place<Place>  Place) address) address)
  :pattern ((compute_address<Address> (as _15$place<Place>  Place) address))
  :qid |prog.root$14$compute_address_axiom|)))
(assert (forall ((address Address)) (!
  (= (compute_address<Address> (as _7$place<Place>  Place) address) address)
  :pattern ((compute_address<Address> (as _7$place<Place>  Place) address))
  :qid |prog.root$15$compute_address_axiom|)))
(assert (forall ((address Address)) (!
  (= (compute_address<Address> (as _22$place<Place>  Place) address) address)
  :pattern ((compute_address<Address> (as _22$place<Place>  Place) address))
  :qid |prog.root$16$compute_address_axiom|)))
(assert (forall ((address Address)) (!
  (= (compute_address<Address> (as _23$place<Place>  Place) address) address)
  :pattern ((compute_address<Address> (as _23$place<Place>  Place) address))
  :qid |prog.root$17$compute_address_axiom|)))
(assert (forall ((address Address)) (!
  (= (compute_address<Address> (as _24$place<Place>  Place) address) address)
  :pattern ((compute_address<Address> (as _24$place<Place>  Place) address))
  :qid |prog.root$18$compute_address_axiom|)))
(assert (forall ((address Address)) (!
  (= (compute_address<Address> (as _25$place<Place>  Place) address) address)
  :pattern ((compute_address<Address> (as _25$place<Place>  Place) address))
  :qid |prog.root$19$compute_address_axiom|)))
(assert (forall ((address Address)) (!
  (= (compute_address<Address> (as _26$place<Place>  Place) address) address)
  :pattern ((compute_address<Address> (as _26$place<Place>  Place) address))
  :qid |prog.root$20$compute_address_axiom|)))
(assert (forall ((address Address)) (!
  (= (compute_address<Address> (as _21$place<Place>  Place) address) address)
  :pattern ((compute_address<Address> (as _21$place<Place>  Place) address))
  :qid |prog.root$21$compute_address_axiom|)))
(assert (forall ((address Address)) (!
  (= (compute_address<Address> (as _20$place<Place>  Place) address) address)
  :pattern ((compute_address<Address> (as _20$place<Place>  Place) address))
  :qid |prog.root$22$compute_address_axiom|)))
(assert (forall ((address Address)) (!
  (= (compute_address<Address> (as _19$place<Place>  Place) address) address)
  :pattern ((compute_address<Address> (as _19$place<Place>  Place) address))
  :qid |prog.root$23$compute_address_axiom|)))
(assert (forall ((address Address)) (!
  (= (compute_address<Address> (as _18$place<Place>  Place) address) address)
  :pattern ((compute_address<Address> (as _18$place<Place>  Place) address))
  :qid |prog.root$24$compute_address_axiom|)))
(assert (forall ((address Address)) (!
  (= (compute_address<Address> (as _0$place<Place>  Place) address) address)
  :pattern ((compute_address<Address> (as _0$place<Place>  Place) address))
  :qid |prog.root$25$compute_address_axiom|)))
(assert (not
  (valid$Snap$Never<Bool> (as constructor$Snap$Never$<Snap$Never>  Snap$Never))))
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
(assert (forall ((left Snap$Tuple$$$) (right Snap$Tuple$$$)) (!
  (=
    (constructor$Snap$Bool$EqCmp_Tuple$$$<Snap$Bool> left right)
    (constructor$Snap$Bool$<Snap$Bool> (= left right)))
  :pattern ((constructor$Snap$Bool$EqCmp_Tuple$$$<Snap$Bool> left right))
  :qid |prog.EqCmp_Tuple$$$$simplification_axiom|)))
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
(assert (forall ((left Bool) (right Bool)) (!
  (=>
    (and
      (valid$Snap$Bool<Bool> (constructor$Snap$Bool$<Snap$Bool> left))
      (valid$Snap$Bool<Bool> (constructor$Snap$Bool$<Snap$Bool> right)))
    (=
      (constructor$Snap$Bool$And_Bool<Snap$Bool> (constructor$Snap$Bool$<Snap$Bool> left) (constructor$Snap$Bool$<Snap$Bool> right))
      (constructor$Snap$Bool$<Snap$Bool> (and left right))))
  :pattern ((constructor$Snap$Bool$And_Bool<Snap$Bool> (constructor$Snap$Bool$<Snap$Bool> left) (constructor$Snap$Bool$<Snap$Bool> right)))
  :qid |prog.And_Bool$simplification_axiom|)))
(assert (forall ((left Snap$Bool) (right Snap$Bool)) (!
  (=
    (destructor$Snap$Bool$$value<Bool> (constructor$Snap$Bool$And_Bool<Snap$Bool> left right))
    (and
      (destructor$Snap$Bool$$value<Bool> left)
      (destructor$Snap$Bool$$value<Bool> right)))
  :pattern ((destructor$Snap$Bool$$value<Bool> (constructor$Snap$Bool$And_Bool<Snap$Bool> left right)))
  :qid |prog.And_Bool$eval_axiom|)))
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
; ---------- m_foo$CoreProof ----------
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
; var _11$address: Address
(declare-const _11$address@6@01 Address)
; [exec]
; var _11$snapshot$0: Snap$Tuple$$$
(declare-const _11$snapshot$0@7@01 Snap$Tuple$$$)
; [exec]
; var _12$address: Address
(declare-const _12$address@8@01 Address)
; [exec]
; var _12$snapshot$0: Snap$Tuple$$$
(declare-const _12$snapshot$0@9@01 Snap$Tuple$$$)
; [exec]
; var _12$snapshot$1: Snap$Tuple$$$
(declare-const _12$snapshot$1@10@01 Snap$Tuple$$$)
; [exec]
; var _12$snapshot$2: Snap$Tuple$$$
(declare-const _12$snapshot$2@11@01 Snap$Tuple$$$)
; [exec]
; var _12$snapshot$3: Snap$Tuple$$$
(declare-const _12$snapshot$3@12@01 Snap$Tuple$$$)
; [exec]
; var _13$address: Address
(declare-const _13$address@13@01 Address)
; [exec]
; var _13$snapshot$0: Snap$Bool
(declare-const _13$snapshot$0@14@01 Snap$Bool)
; [exec]
; var _14$address: Address
(declare-const _14$address@15@01 Address)
; [exec]
; var _14$snapshot$0: Snap$I64
(declare-const _14$snapshot$0@16@01 Snap$I64)
; [exec]
; var _14$snapshot$1: Snap$I64
(declare-const _14$snapshot$1@17@01 Snap$I64)
; [exec]
; var _14$snapshot$2: Snap$I64
(declare-const _14$snapshot$2@18@01 Snap$I64)
; [exec]
; var _14$snapshot$3: Snap$I64
(declare-const _14$snapshot$3@19@01 Snap$I64)
; [exec]
; var _15$address: Address
(declare-const _15$address@20@01 Address)
; [exec]
; var _15$snapshot$0: Snap$Tuple$$$
(declare-const _15$snapshot$0@21@01 Snap$Tuple$$$)
; [exec]
; var _15$snapshot$1: Snap$Tuple$$$
(declare-const _15$snapshot$1@22@01 Snap$Tuple$$$)
; [exec]
; var _15$snapshot$2: Snap$Tuple$$$
(declare-const _15$snapshot$2@23@01 Snap$Tuple$$$)
; [exec]
; var _15$snapshot$3: Snap$Tuple$$$
(declare-const _15$snapshot$3@24@01 Snap$Tuple$$$)
; [exec]
; var _16$address: Address
(declare-const _16$address@25@01 Address)
; [exec]
; var _16$snapshot$0: Snap$Bool
(declare-const _16$snapshot$0@26@01 Snap$Bool)
; [exec]
; var _16$snapshot$1: Snap$Bool
(declare-const _16$snapshot$1@27@01 Snap$Bool)
; [exec]
; var _16$snapshot$2: Snap$Bool
(declare-const _16$snapshot$2@28@01 Snap$Bool)
; [exec]
; var _16$snapshot$3: Snap$Bool
(declare-const _16$snapshot$3@29@01 Snap$Bool)
; [exec]
; var _18$address: Address
(declare-const _18$address@30@01 Address)
; [exec]
; var _18$snapshot$0: Snap$Tuple$$$
(declare-const _18$snapshot$0@31@01 Snap$Tuple$$$)
; [exec]
; var _18$snapshot$1: Snap$Tuple$$$
(declare-const _18$snapshot$1@32@01 Snap$Tuple$$$)
; [exec]
; var _18$snapshot$2: Snap$Tuple$$$
(declare-const _18$snapshot$2@33@01 Snap$Tuple$$$)
; [exec]
; var _19$address: Address
(declare-const _19$address@34@01 Address)
; [exec]
; var _19$snapshot$0: Snap$Bool
(declare-const _19$snapshot$0@35@01 Snap$Bool)
; [exec]
; var _19$snapshot$1: Snap$Bool
(declare-const _19$snapshot$1@36@01 Snap$Bool)
; [exec]
; var _19$snapshot$2: Snap$Bool
(declare-const _19$snapshot$2@37@01 Snap$Bool)
; [exec]
; var _19$snapshot$3: Snap$Bool
(declare-const _19$snapshot$3@38@01 Snap$Bool)
; [exec]
; var _2$address: Address
(declare-const _2$address@39@01 Address)
; [exec]
; var _2$snapshot$0: Snap$I64
(declare-const _2$snapshot$0@40@01 Snap$I64)
; [exec]
; var _2$snapshot$1: Snap$I64
(declare-const _2$snapshot$1@41@01 Snap$I64)
; [exec]
; var _2$snapshot$2: Snap$I64
(declare-const _2$snapshot$2@42@01 Snap$I64)
; [exec]
; var _2$snapshot$3: Snap$I64
(declare-const _2$snapshot$3@43@01 Snap$I64)
; [exec]
; var _20$address: Address
(declare-const _20$address@44@01 Address)
; [exec]
; var _20$snapshot$0: Snap$Bool
(declare-const _20$snapshot$0@45@01 Snap$Bool)
; [exec]
; var _20$snapshot$1: Snap$Bool
(declare-const _20$snapshot$1@46@01 Snap$Bool)
; [exec]
; var _20$snapshot$2: Snap$Bool
(declare-const _20$snapshot$2@47@01 Snap$Bool)
; [exec]
; var _20$snapshot$3: Snap$Bool
(declare-const _20$snapshot$3@48@01 Snap$Bool)
; [exec]
; var _21$address: Address
(declare-const _21$address@49@01 Address)
; [exec]
; var _21$snapshot$0: Snap$I64
(declare-const _21$snapshot$0@50@01 Snap$I64)
; [exec]
; var _21$snapshot$1: Snap$I64
(declare-const _21$snapshot$1@51@01 Snap$I64)
; [exec]
; var _21$snapshot$2: Snap$I64
(declare-const _21$snapshot$2@52@01 Snap$I64)
; [exec]
; var _21$snapshot$3: Snap$I64
(declare-const _21$snapshot$3@53@01 Snap$I64)
; [exec]
; var _22$address: Address
(declare-const _22$address@54@01 Address)
; [exec]
; var _22$snapshot$0: Snap$I64
(declare-const _22$snapshot$0@55@01 Snap$I64)
; [exec]
; var _22$snapshot$1: Snap$I64
(declare-const _22$snapshot$1@56@01 Snap$I64)
; [exec]
; var _22$snapshot$2: Snap$I64
(declare-const _22$snapshot$2@57@01 Snap$I64)
; [exec]
; var _22$snapshot$3: Snap$I64
(declare-const _22$snapshot$3@58@01 Snap$I64)
; [exec]
; var _23$address: Address
(declare-const _23$address@59@01 Address)
; [exec]
; var _23$snapshot$0: Snap$Bool
(declare-const _23$snapshot$0@60@01 Snap$Bool)
; [exec]
; var _23$snapshot$1: Snap$Bool
(declare-const _23$snapshot$1@61@01 Snap$Bool)
; [exec]
; var _23$snapshot$2: Snap$Bool
(declare-const _23$snapshot$2@62@01 Snap$Bool)
; [exec]
; var _23$snapshot$3: Snap$Bool
(declare-const _23$snapshot$3@63@01 Snap$Bool)
; [exec]
; var _24$address: Address
(declare-const _24$address@64@01 Address)
; [exec]
; var _24$snapshot$0: Snap$Bool
(declare-const _24$snapshot$0@65@01 Snap$Bool)
; [exec]
; var _24$snapshot$1: Snap$Bool
(declare-const _24$snapshot$1@66@01 Snap$Bool)
; [exec]
; var _24$snapshot$2: Snap$Bool
(declare-const _24$snapshot$2@67@01 Snap$Bool)
; [exec]
; var _24$snapshot$3: Snap$Bool
(declare-const _24$snapshot$3@68@01 Snap$Bool)
; [exec]
; var _25$address: Address
(declare-const _25$address@69@01 Address)
; [exec]
; var _25$snapshot$0: Snap$Bool
(declare-const _25$snapshot$0@70@01 Snap$Bool)
; [exec]
; var _25$snapshot$1: Snap$Bool
(declare-const _25$snapshot$1@71@01 Snap$Bool)
; [exec]
; var _25$snapshot$2: Snap$Bool
(declare-const _25$snapshot$2@72@01 Snap$Bool)
; [exec]
; var _25$snapshot$3: Snap$Bool
(declare-const _25$snapshot$3@73@01 Snap$Bool)
; [exec]
; var _26$address: Address
(declare-const _26$address@74@01 Address)
; [exec]
; var _26$snapshot$0: Snap$Bool
(declare-const _26$snapshot$0@75@01 Snap$Bool)
; [exec]
; var _26$snapshot$1: Snap$Bool
(declare-const _26$snapshot$1@76@01 Snap$Bool)
; [exec]
; var _26$snapshot$2: Snap$Bool
(declare-const _26$snapshot$2@77@01 Snap$Bool)
; [exec]
; var _26$snapshot$3: Snap$Bool
(declare-const _26$snapshot$3@78@01 Snap$Bool)
; [exec]
; var _27$address: Address
(declare-const _27$address@79@01 Address)
; [exec]
; var _3$address: Address
(declare-const _3$address@80@01 Address)
; [exec]
; var _3$snapshot$0: Snap$I64
(declare-const _3$snapshot$0@81@01 Snap$I64)
; [exec]
; var _3$snapshot$1: Snap$I64
(declare-const _3$snapshot$1@82@01 Snap$I64)
; [exec]
; var _4$address: Address
(declare-const _4$address@83@01 Address)
; [exec]
; var _4$snapshot$0: Snap$Tuple$$I64$Bool$$I64$Bool$
(declare-const _4$snapshot$0@84@01 Snap$Tuple$$I64$Bool$$I64$Bool$)
; [exec]
; var _4$snapshot$1: Snap$Tuple$$I64$Bool$$I64$Bool$
(declare-const _4$snapshot$1@85@01 Snap$Tuple$$I64$Bool$$I64$Bool$)
; [exec]
; var _5$address: Address
(declare-const _5$address@86@01 Address)
; [exec]
; var _5$snapshot$0: Snap$I64
(declare-const _5$snapshot$0@87@01 Snap$I64)
; [exec]
; var _6$address: Address
(declare-const _6$address@88@01 Address)
; [exec]
; var _6$snapshot$0: Snap$I64
(declare-const _6$snapshot$0@89@01 Snap$I64)
; [exec]
; var _6$snapshot$1: Snap$I64
(declare-const _6$snapshot$1@90@01 Snap$I64)
; [exec]
; var _6$snapshot$2: Snap$I64
(declare-const _6$snapshot$2@91@01 Snap$I64)
; [exec]
; var _6$snapshot$3: Snap$I64
(declare-const _6$snapshot$3@92@01 Snap$I64)
; [exec]
; var _7$address: Address
(declare-const _7$address@93@01 Address)
; [exec]
; var _7$snapshot$0: Snap$Tuple$$$
(declare-const _7$snapshot$0@94@01 Snap$Tuple$$$)
; [exec]
; var _7$snapshot$1: Snap$Tuple$$$
(declare-const _7$snapshot$1@95@01 Snap$Tuple$$$)
; [exec]
; var _7$snapshot$2: Snap$Tuple$$$
(declare-const _7$snapshot$2@96@01 Snap$Tuple$$$)
; [exec]
; var _7$snapshot$3: Snap$Tuple$$$
(declare-const _7$snapshot$3@97@01 Snap$Tuple$$$)
; [exec]
; var _8$address: Address
(declare-const _8$address@98@01 Address)
; [exec]
; var _8$snapshot$0: Snap$Tuple$$$
(declare-const _8$snapshot$0@99@01 Snap$Tuple$$$)
; [exec]
; var _8$snapshot$1: Snap$Tuple$$$
(declare-const _8$snapshot$1@100@01 Snap$Tuple$$$)
; [exec]
; var _8$snapshot$2: Snap$Tuple$$$
(declare-const _8$snapshot$2@101@01 Snap$Tuple$$$)
; [exec]
; var _8$snapshot$3: Snap$Tuple$$$
(declare-const _8$snapshot$3@102@01 Snap$Tuple$$$)
; [exec]
; var _9$address: Address
(declare-const _9$address@103@01 Address)
; [exec]
; var _9$snapshot$0: Snap$Bool
(declare-const _9$snapshot$0@104@01 Snap$Bool)
; [exec]
; var _9$snapshot$1: Snap$Bool
(declare-const _9$snapshot$1@105@01 Snap$Bool)
; [exec]
; var _9$snapshot$2: Snap$Bool
(declare-const _9$snapshot$2@106@01 Snap$Bool)
; [exec]
; var _9$snapshot$3: Snap$Bool
(declare-const _9$snapshot$3@107@01 Snap$Bool)
; [exec]
; var bw0$snapshot$0: Lifetime
(declare-const bw0$snapshot$0@108@01 Lifetime)
; [exec]
; var bw1$snapshot$0: Lifetime
(declare-const bw1$snapshot$0@109@01 Lifetime)
; [exec]
; var end_label$marker: Bool
(declare-const end_label$marker@110@01 Bool)
; [exec]
; var label_2_custom$marker: Bool
(declare-const label_2_custom$marker@111@01 Bool)
; [exec]
; var label_3_custom$marker: Bool
(declare-const label_3_custom$marker@112@01 Bool)
; [exec]
; var label_5_custom$marker: Bool
(declare-const label_5_custom$marker@113@01 Bool)
; [exec]
; var label_6_custom$marker: Bool
(declare-const label_6_custom$marker@114@01 Bool)
; [exec]
; var label_7_custom$marker: Bool
(declare-const label_7_custom$marker@115@01 Bool)
; [exec]
; var label_8_custom$marker: Bool
(declare-const label_8_custom$marker@116@01 Bool)
; [exec]
; var label_bb0$marker: Bool
(declare-const label_bb0$marker@117@01 Bool)
; [exec]
; var label_bb1$marker: Bool
(declare-const label_bb1$marker@118@01 Bool)
; [exec]
; var label_bb10$marker: Bool
(declare-const label_bb10$marker@119@01 Bool)
; [exec]
; var label_bb11$marker: Bool
(declare-const label_bb11$marker@120@01 Bool)
; [exec]
; var label_bb12$marker: Bool
(declare-const label_bb12$marker@121@01 Bool)
; [exec]
; var label_bb13$marker: Bool
(declare-const label_bb13$marker@122@01 Bool)
; [exec]
; var label_bb14$marker: Bool
(declare-const label_bb14$marker@123@01 Bool)
; [exec]
; var label_bb15$marker: Bool
(declare-const label_bb15$marker@124@01 Bool)
; [exec]
; var label_bb2$marker: Bool
(declare-const label_bb2$marker@125@01 Bool)
; [exec]
; var label_bb4$marker: Bool
(declare-const label_bb4$marker@126@01 Bool)
; [exec]
; var label_bb5$marker: Bool
(declare-const label_bb5$marker@127@01 Bool)
; [exec]
; var label_bb6$marker: Bool
(declare-const label_bb6$marker@128@01 Bool)
; [exec]
; var label_bb7$marker: Bool
(declare-const label_bb7$marker@129@01 Bool)
; [exec]
; var label_bb9$marker: Bool
(declare-const label_bb9$marker@130@01 Bool)
; [exec]
; var label_entry$marker: Bool
(declare-const label_entry$marker@131@01 Bool)
; [exec]
; var lft_0$snapshot$1: Lifetime
(declare-const lft_0$snapshot$1@132@01 Lifetime)
; [exec]
; var lft_1$snapshot$1: Lifetime
(declare-const lft_1$snapshot$1@133@01 Lifetime)
; [exec]
; var lft_function_call_1$snapshot$0: Lifetime
(declare-const lft_function_call_1$snapshot$0@134@01 Lifetime)
; [exec]
; var lft_function_call_1$snapshot$1: Lifetime
(declare-const lft_function_call_1$snapshot$1@135@01 Lifetime)
; [exec]
; var lft_function_call_1$snapshot$2: Lifetime
(declare-const lft_function_call_1$snapshot$2@136@01 Lifetime)
; [exec]
; var lft_function_call_1$snapshot$3: Lifetime
(declare-const lft_function_call_1$snapshot$3@137@01 Lifetime)
; [exec]
; var lft_function_call_2$snapshot$0: Lifetime
(declare-const lft_function_call_2$snapshot$0@138@01 Lifetime)
; [exec]
; var lft_function_call_2$snapshot$1: Lifetime
(declare-const lft_function_call_2$snapshot$1@139@01 Lifetime)
; [exec]
; var lft_function_call_2$snapshot$2: Lifetime
(declare-const lft_function_call_2$snapshot$2@140@01 Lifetime)
; [exec]
; var lft_function_call_2$snapshot$3: Lifetime
(declare-const lft_function_call_2$snapshot$3@141@01 Lifetime)
; [exec]
; var lifetime_token_perm_amount$0$snapshot$0: Perm
(declare-const lifetime_token_perm_amount$0$snapshot$0@142@01 $Perm)
; [exec]
; var resume_panic_label$marker: Bool
(declare-const resume_panic_label$marker@143@01 Bool)
; [exec]
; var return_label$marker: Bool
(declare-const return_label$marker@144@01 Bool)
; [exec]
; var start_label$marker: Bool
(declare-const start_label$marker@145@01 Bool)
; [exec]
; var tmp$0: Snap$Tuple$$I64$Bool$$I64$Bool$
(declare-const tmp$0@146@01 Snap$Tuple$$I64$Bool$$I64$Bool$)
; [exec]
; var tmp$1: Bool
(declare-const tmp$1@147@01 Bool)
; [exec]
; var tmp$2: Bool
(declare-const tmp$2@148@01 Bool)
; [exec]
; var tmp$3: Snap$Bool
(declare-const tmp$3@149@01 Snap$Bool)
; [exec]
; var tmp$4: Snap$Bool
(declare-const tmp$4@150@01 Snap$Bool)
; [exec]
; var tmp$5: Snap$Bool
(declare-const tmp$5@151@01 Snap$Bool)
; [exec]
; var tmp$6: Snap$Bool
(declare-const tmp$6@152@01 Snap$Bool)
; [exec]
; var tmp$7: Snap$I64
(declare-const tmp$7@153@01 Snap$I64)
; [exec]
; var tmp$8: Snap$Bool
(declare-const tmp$8@154@01 Snap$Bool)
; [exec]
; var tmp$9: Snap$Bool
(declare-const tmp$9@155@01 Snap$Bool)
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
; label_3_custom$marker := false
; [exec]
; label_2_custom$marker := false
; [exec]
; label_bb2$marker := false
; [exec]
; label_bb4$marker := false
; [exec]
; label_bb5$marker := false
; [exec]
; label_6_custom$marker := false
; [exec]
; label_5_custom$marker := false
; [exec]
; label_bb6$marker := false
; [exec]
; label_bb7$marker := false
; [exec]
; label_bb9$marker := false
; [exec]
; label_bb10$marker := false
; [exec]
; label_bb11$marker := false
; [exec]
; label_bb12$marker := false
; [exec]
; label_8_custom$marker := false
; [exec]
; label_bb13$marker := false
; [exec]
; label_bb15$marker := false
; [exec]
; resume_panic_label$marker := false
; [exec]
; label_7_custom$marker := false
; [exec]
; label_bb14$marker := false
; [exec]
; return_label$marker := false
; [exec]
; end_label$marker := false
; [exec]
; start_label$marker := true
; [exec]
; inhale basic_block_marker$start_label$marker()
(declare-const $t@156@01 $Snap)
(assert (= $t@156@01 $Snap.unit))
; [eval] basic_block_marker$start_label$marker()
(assert (as basic_block_marker$start_label$marker<Bool>  Bool))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale lifetime_token_perm_amount$0$snapshot$0 > none
(declare-const $t@157@01 $Snap)
(assert (= $t@157@01 $Snap.unit))
; [eval] lifetime_token_perm_amount$0$snapshot$0 > none
(assert (> lifetime_token_perm_amount$0$snapshot$0@142@01 $Perm.No))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale lifetime_token_perm_amount$0$snapshot$0 < write
(declare-const $t@158@01 $Snap)
(assert (= $t@158@01 $Snap.unit))
; [eval] lifetime_token_perm_amount$0$snapshot$0 < write
(assert (< lifetime_token_perm_amount$0$snapshot$0@142@01 $Perm.Write))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale acc(LifetimeToken(bw0$snapshot$0), lifetime_token_perm_amount$0$snapshot$0)
(set-option :timeout 0)
(push) ; 3
(assert (not (or
  (= lifetime_token_perm_amount$0$snapshot$0@142@01 $Perm.No)
  (< $Perm.No lifetime_token_perm_amount$0$snapshot$0@142@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(declare-const $t@159@01 $Snap)
(assert (<= $Perm.No lifetime_token_perm_amount$0$snapshot$0@142@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(LifetimeToken(bw1$snapshot$0), lifetime_token_perm_amount$0$snapshot$0)
(set-option :timeout 0)
(push) ; 3
(assert (not (or
  (= lifetime_token_perm_amount$0$snapshot$0@142@01 $Perm.No)
  (< $Perm.No lifetime_token_perm_amount$0$snapshot$0@142@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(declare-const $t@160@01 $Snap)
(push) ; 3
(set-option :timeout 10)
(assert (not (= bw0$snapshot$0@108@01 bw1$snapshot$0@109@01)))
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
(assert (not (< $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (< $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))))
(push) ; 3
(assert (not (or
  (= (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)) $Perm.No)
  (< $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  (-
    lifetime_token_perm_amount$0$snapshot$0@142@01
    ($Perm.min
      lifetime_token_perm_amount$0$snapshot$0@142@01
      (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (<=
  $Perm.No
  (-
    lifetime_token_perm_amount$0$snapshot$0@142@01
    ($Perm.min
      lifetime_token_perm_amount$0$snapshot$0@142@01
      (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))))))
(set-option :timeout 0)
(push) ; 3
(assert (not (or
  (=
    (-
      (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))
      ($Perm.min
        lifetime_token_perm_amount$0$snapshot$0@142@01
        (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))))
    $Perm.No)
  (<
    (-
      (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))
      ($Perm.min
        lifetime_token_perm_amount$0$snapshot$0@142@01
        (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(assert (not (or
  (= (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)) $Perm.No)
  (< $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  (-
    lifetime_token_perm_amount$0$snapshot$0@142@01
    ($Perm.min
      lifetime_token_perm_amount$0$snapshot$0@142@01
      (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))))
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
      (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))
      ($Perm.min
        lifetime_token_perm_amount$0$snapshot$0@142@01
        (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))))
    $Perm.No)
  (<
    (-
      (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))
      ($Perm.min
        lifetime_token_perm_amount$0$snapshot$0@142@01
        (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(declare-const lft@161@01 Lifetime)
(declare-const $t@162@01 $Snap)
(assert (= $t@162@01 ($Snap.combine ($Snap.first $t@162@01) ($Snap.second $t@162@01))))
(set-option :timeout 0)
(push) ; 3
(assert (not (or
  (= (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)) $Perm.No)
  (< $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(push) ; 3
(set-option :timeout 10)
(assert (not (= bw1$snapshot$0@109@01 lft@161@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= bw0$snapshot$0@108@01 lft@161@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (<= $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))))
(assert (= ($Snap.second $t@162@01) $Snap.unit))
; [eval] lft == intersect(Set(lft_1, lft_2))
; [eval] intersect(Set(lft_1, lft_2))
; [eval] Set(lft_1, lft_2)
(assert (=
  lft@161@01
  (intersect<Lifetime> (Set_unionone (Set_singleton bw0$snapshot$0@108@01) bw1$snapshot$0@109@01))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(OwnedNonAliased$I64(_1$place(), _1$address, _1$snapshot$0), write) &&
;   valid$Snap$I64(_1$snapshot$0)
(declare-const $t@163@01 $Snap)
(assert (= $t@163@01 ($Snap.combine ($Snap.first $t@163@01) ($Snap.second $t@163@01))))
; [eval] _1$place()
(assert (= ($Snap.second $t@163@01) $Snap.unit))
; [eval] valid$Snap$I64(_1$snapshot$0)
(assert (valid$Snap$I64<Bool> _1$snapshot$0@5@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlock(_0$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
(declare-const $t@164@01 $Snap)
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlock(_4$address, Size$Tuple$$I64$Bool$$I64$Bool$$()), write)
; [eval] Size$Tuple$$I64$Bool$$I64$Bool$$()
(declare-const $t@165@01 $Snap)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (= _0$address@0@01 _4$address@83@01)
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
; inhale acc(MemoryBlock(_23$address, Size$Bool$()), write)
; [eval] Size$Bool$()
(declare-const $t@166@01 $Snap)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (= _0$address@0@01 _23$address@59@01)
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
  (= _4$address@83@01 _23$address@59@01)
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
; inhale acc(MemoryBlock(_24$address, Size$Bool$()), write)
; [eval] Size$Bool$()
(declare-const $t@167@01 $Snap)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (= _4$address@83@01 _24$address@64@01)
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
  (= _0$address@0@01 _24$address@64@01)
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
(assert (not (= _23$address@59@01 _24$address@64@01)))
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
; inhale acc(MemoryBlock(_25$address, Size$Bool$()), write)
; [eval] Size$Bool$()
(declare-const $t@168@01 $Snap)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= _23$address@59@01 _25$address@69@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (= _0$address@0@01 _25$address@69@01)
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
  (= _4$address@83@01 _25$address@69@01)
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
(assert (not (= _24$address@64@01 _25$address@69@01)))
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
; inhale acc(MemoryBlock(_26$address, Size$Bool$()), write)
; [eval] Size$Bool$()
(declare-const $t@169@01 $Snap)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= _24$address@64@01 _26$address@74@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (= _4$address@83@01 _26$address@74@01)
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
  (= _0$address@0@01 _26$address@74@01)
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
(assert (not (= _23$address@59@01 _26$address@74@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= _25$address@69@01 _26$address@74@01)))
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
(declare-const $t@170@01 $Snap)
(assert (= $t@170@01 $Snap.unit))
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
(declare-const $t@171@01 $Snap)
(assert (= $t@171@01 $Snap.unit))
; [eval] basic_block_marker$label_bb0$marker()
(assert (as basic_block_marker$label_bb0$marker<Bool>  Bool))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlock(_2$address, Size$I64$()), write)
; [eval] Size$I64$()
(declare-const $t@172@01 $Snap)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (= _25$address@69@01 _2$address@39@01)
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
  (= _23$address@59@01 _2$address@39@01)
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
  (= _0$address@0@01 _2$address@39@01)
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
  (= _4$address@83@01 _2$address@39@01)
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
  (= _24$address@64@01 _2$address@39@01)
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
  (= _26$address@74@01 _2$address@39@01)
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
; inhale acc(MemoryBlockStackDrop(_2$address, Size$I64$()), write)
; [eval] Size$I64$()
(declare-const $t@173@01 $Snap)
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlock(_3$address, Size$I64$()), write)
; [eval] Size$I64$()
(declare-const $t@174@01 $Snap)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= _2$address@39@01 _3$address@80@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (= _25$address@69@01 _3$address@80@01)
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
  (= _23$address@59@01 _3$address@80@01)
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
  (= _0$address@0@01 _3$address@80@01)
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
  (= _4$address@83@01 _3$address@80@01)
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
  (= _24$address@64@01 _3$address@80@01)
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
  (= _26$address@74@01 _3$address@80@01)
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
; inhale acc(MemoryBlockStackDrop(_3$address, Size$I64$()), write)
; [eval] Size$I64$()
(declare-const $t@175@01 $Snap)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= _2$address@39@01 _3$address@80@01)))
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
    _26$address@74@01
    (compute_address<Address> (as _3$place<Place>  Place) _3$address@80@01))
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
  (=
    _24$address@64@01
    (compute_address<Address> (as _3$place<Place>  Place) _3$address@80@01))
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
  (=
    _4$address@83@01
    (compute_address<Address> (as _3$place<Place>  Place) _3$address@80@01))
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
    _0$address@0@01
    (compute_address<Address> (as _3$place<Place>  Place) _3$address@80@01))
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
    _23$address@59@01
    (compute_address<Address> (as _3$place<Place>  Place) _3$address@80@01))
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
  (=
    _25$address@69@01
    (compute_address<Address> (as _3$place<Place>  Place) _3$address@80@01))
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
  _2$address@39@01
  (compute_address<Address> (as _3$place<Place>  Place) _3$address@80@01))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  _3$address@80@01
  (compute_address<Address> (as _3$place<Place>  Place) _3$address@80@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(declare-const $t@176@01 $Snap)
(assert (= $t@176@01 ($Snap.combine ($Snap.first $t@176@01) ($Snap.second $t@176@01))))
(assert (=
  ($Snap.second $t@176@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@176@01))
    ($Snap.second ($Snap.second $t@176@01)))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (= (as _1$place<Place>  Place) (as _3$place<Place>  Place))
  (= _1$address@4@01 _3$address@80@01))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (= ($Snap.second ($Snap.second $t@176@01)) $Snap.unit))
; [eval] valid$Snap$I64(source_snapshot)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _3$snapshot$1 == _1$snapshot$0
(declare-const $t@177@01 $Snap)
(assert (= $t@177@01 $Snap.unit))
; [eval] _3$snapshot$1 == _1$snapshot$0
(assert (= _3$snapshot$1@82@01 _1$snapshot$0@5@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; tmp$0 := assign$Tuple$$I64$Bool$$I64$Bool$$CheckedBinaryOp$Mul$Constant$I64$Copy$I64$$$$(_4$place(),
;   _4$address, constructor$Snap$I64$(2), _3$place(), _3$address, _3$snapshot$1)
; [eval] _4$place()
; [eval] constructor$Snap$I64$(2)
; [eval] _3$place()
; [eval] compute_address(target_place, target_address)
; [eval] Size$Tuple$$I64$Bool$$I64$Bool$$()
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (=
    _26$address@74@01
    (compute_address<Address> (as _4$place<Place>  Place) _4$address@83@01))
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
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
  (=
    _24$address@64@01
    (compute_address<Address> (as _4$place<Place>  Place) _4$address@83@01))
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  _4$address@83@01
  (compute_address<Address> (as _4$place<Place>  Place) _4$address@83@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; [eval] valid$Snap$I64(operand1_value)
(set-option :timeout 0)
(push) ; 3
(assert (not (valid$Snap$I64<Bool> (constructor$Snap$I64$<Snap$I64> 2))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (valid$Snap$I64<Bool> (constructor$Snap$I64$<Snap$I64> 2)))
(push) ; 3
(set-option :timeout 10)
(assert (not (= _1$snapshot$0@5@01 _3$snapshot$1@82@01)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; [eval] valid$Snap$I64(operand2_value)
(set-option :timeout 0)
(push) ; 3
(assert (not (valid$Snap$I64<Bool> _3$snapshot$1@82@01)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (valid$Snap$I64<Bool> _3$snapshot$1@82@01))
(declare-const result_value@178@01 Snap$Tuple$$I64$Bool$$I64$Bool$)
(declare-const $t@179@01 $Snap)
(assert (= $t@179@01 ($Snap.combine ($Snap.first $t@179@01) ($Snap.second $t@179@01))))
; [eval] compute_address(target_place, target_address)
; [eval] PaddingSize$Tuple$$I64$Bool$$I64$Bool$$()
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (=
    _2$address@39@01
    (compute_address<Address> (as _4$place<Place>  Place) _4$address@83@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
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
    _25$address@69@01
    (compute_address<Address> (as _4$place<Place>  Place) _4$address@83@01))
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
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
    _23$address@59@01
    (compute_address<Address> (as _4$place<Place>  Place) _4$address@83@01))
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
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
    (compute_address<Address> (as _4$place<Place>  Place) _4$address@83@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
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
    _24$address@64@01
    (compute_address<Address> (as _4$place<Place>  Place) _4$address@83@01))
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
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
    _26$address@74@01
    (compute_address<Address> (as _4$place<Place>  Place) _4$address@83@01))
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second $t@179@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@179@01))
    ($Snap.second ($Snap.second $t@179@01)))))
; [eval] field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(compute_address(target_place, target_address))
; [eval] compute_address(target_place, target_address)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (=
    _26$address@74@01
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _4$place<Place>  Place) _4$address@83@01)))
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
  (=
    _24$address@64@01
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _4$place<Place>  Place) _4$address@83@01)))
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
  (=
    _0$address@0@01
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _4$place<Place>  Place) _4$address@83@01)))
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
    _23$address@59@01
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _4$place<Place>  Place) _4$address@83@01)))
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
  (=
    _25$address@69@01
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _4$place<Place>  Place) _4$address@83@01)))
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
  _2$address@39@01
  (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _4$place<Place>  Place) _4$address@83@01)))))
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
    (compute_address<Address> (as _4$place<Place>  Place) _4$address@83@01)
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _4$place<Place>  Place) _4$address@83@01)))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second $t@179@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@179@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@179@01))))))
; [eval] field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(target_place)
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(result_value)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@179@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@179@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@179@01)))))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (= (as _1$place<Place>  Place) (as _3$place<Place>  Place))
  (= _1$address@4@01 _3$address@80@01)
  (= _1$snapshot$0@5@01 _3$snapshot$1@82@01))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@179@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@179@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@179@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@179@01)))))
  $Snap.unit))
; [eval] valid$Snap$I64(constructor$Snap$I64$Mul_I64(operand1_value, operand2_value)) ==> destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(result_value) == constructor$Snap$I64$Mul_I64(operand1_value, operand2_value)
; [eval] valid$Snap$I64(constructor$Snap$I64$Mul_I64(operand1_value, operand2_value))
; [eval] constructor$Snap$I64$Mul_I64(operand1_value, operand2_value)
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (valid$Snap$I64<Bool> (constructor$Snap$I64$Mul_I64<Snap$I64> (constructor$Snap$I64$<Snap$I64> 2) _3$snapshot$1@82@01)))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (valid$Snap$I64<Bool> (constructor$Snap$I64$Mul_I64<Snap$I64> (constructor$Snap$I64$<Snap$I64> 2) _3$snapshot$1@82@01))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [then-branch: 0 | valid$Snap$I64[Bool](constructor$Snap$I64$Mul_I64[Snap$I64](constructor$Snap$I64$[Snap$I64](2), _3$snapshot$1@82@01)) | live]
; [else-branch: 0 | !(valid$Snap$I64[Bool](constructor$Snap$I64$Mul_I64[Snap$I64](constructor$Snap$I64$[Snap$I64](2), _3$snapshot$1@82@01))) | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 0 | valid$Snap$I64[Bool](constructor$Snap$I64$Mul_I64[Snap$I64](constructor$Snap$I64$[Snap$I64](2), _3$snapshot$1@82@01))]
(assert (valid$Snap$I64<Bool> (constructor$Snap$I64$Mul_I64<Snap$I64> (constructor$Snap$I64$<Snap$I64> 2) _3$snapshot$1@82@01)))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(result_value) == constructor$Snap$I64$Mul_I64(operand1_value, operand2_value)
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(result_value)
; [eval] constructor$Snap$I64$Mul_I64(operand1_value, operand2_value)
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (valid$Snap$I64<Bool> (constructor$Snap$I64$Mul_I64<Snap$I64> (constructor$Snap$I64$<Snap$I64> 2) _3$snapshot$1@82@01)))
(assert (=>
  (valid$Snap$I64<Bool> (constructor$Snap$I64$Mul_I64<Snap$I64> (constructor$Snap$I64$<Snap$I64> 2) _3$snapshot$1@82@01))
  (=
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> result_value@178@01)
    (constructor$Snap$I64$Mul_I64<Snap$I64> (constructor$Snap$I64$<Snap$I64> 2) _3$snapshot$1@82@01))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@179@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@179@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@179@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@179@01))))))
  $Snap.unit))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(result_value) == constructor$Snap$Bool$(!valid$Snap$I64(constructor$Snap$I64$Mul_I64(operand1_value, operand2_value)))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(result_value)
; [eval] constructor$Snap$Bool$(!valid$Snap$I64(constructor$Snap$I64$Mul_I64(operand1_value, operand2_value)))
; [eval] !valid$Snap$I64(constructor$Snap$I64$Mul_I64(operand1_value, operand2_value))
; [eval] valid$Snap$I64(constructor$Snap$I64$Mul_I64(operand1_value, operand2_value))
; [eval] constructor$Snap$I64$Mul_I64(operand1_value, operand2_value)
(assert (=
  (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> result_value@178@01)
  (constructor$Snap$Bool$<Snap$Bool> (not
    (valid$Snap$I64<Bool> (constructor$Snap$I64$Mul_I64<Snap$I64> (constructor$Snap$I64$<Snap$I64> 2) _3$snapshot$1@82@01))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@179@01))))))
  $Snap.unit))
; [eval] MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(compute_address(target_place, target_address)), Size$I64$()) == to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(result_value))
; [eval] MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(compute_address(target_place, target_address)), Size$I64$())
; [eval] field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(compute_address(target_place, target_address))
; [eval] compute_address(target_place, target_address)
; [eval] Size$I64$()
(push) ; 3
(declare-const $k@180@01 $Perm)
(assert ($Perm.isReadVar $k@180@01))
(assert (< $k@180@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@180@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@180@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@179@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _4$place<Place>  Place) _4$address@83@01)) (as Size$I64$<Snap$Usize>  Snap$Usize)))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@180@01))
(assert (and
  (< $k@180@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@180@01))
  (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@179@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _4$place<Place>  Place) _4$address@83@01)) (as Size$I64$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(result_value))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(result_value)
(assert (=
  (MemoryBlock$bytes ($Snap.first ($Snap.second $t@179@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _4$place<Place>  Place) _4$address@83@01)) (as Size$I64$<Snap$Usize>  Snap$Usize))
  (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> result_value@178@01))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _4$snapshot$1 == tmp$0
(declare-const $t@181@01 $Snap)
(assert (= $t@181@01 $Snap.unit))
; [eval] _4$snapshot$1 == tmp$0
(assert (= _4$snapshot$1@85@01 result_value@178@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [eval] !destructor$Snap$Bool$$value(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(_4$snapshot$1))
; [eval] destructor$Snap$Bool$$value(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(_4$snapshot$1))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(_4$snapshot$1)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (destructor$Snap$Bool$$value<Bool> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> _4$snapshot$1@85@01))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (destructor$Snap$Bool$$value<Bool> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> _4$snapshot$1@85@01)))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; [then-branch: 1 | !(destructor$Snap$Bool$$value[Bool](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](_4$snapshot$1@85@01))) | live]
; [else-branch: 1 | destructor$Snap$Bool$$value[Bool](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](_4$snapshot$1@85@01)) | dead]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 1 | !(destructor$Snap$Bool$$value[Bool](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](_4$snapshot$1@85@01)))]
(assert (not
  (destructor$Snap$Bool$$value<Bool> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> _4$snapshot$1@85@01))))
; [exec]
; label label_bb1
; [exec]
; label_bb1$marker := true
; [exec]
; inhale basic_block_marker$label_bb1$marker()
(declare-const $t@182@01 $Snap)
(assert (= $t@182@01 $Snap.unit))
; [eval] basic_block_marker$label_bb1$marker()
(assert (as basic_block_marker$label_bb1$marker<Bool>  Bool))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; fold acc(OwnedNonAliased$I64(field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(_4$place()),
;   _4$address, destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(_4$snapshot$1)), write)
; [eval] field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(_4$place())
; [eval] _4$place()
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(_4$snapshot$1)
; [eval] valid$Snap$I64(snapshot)
(set-option :timeout 0)
(push) ; 4
(assert (not (valid$Snap$I64<Bool> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _4$snapshot$1@85@01))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (valid$Snap$I64<Bool> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _4$snapshot$1@85@01)))
; [eval] compute_address(place, root_address)
; [eval] Size$I64$()
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _4$place<Place>  Place) _4$address@83@01))
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _4$place<Place>  Place)) _4$address@83@01))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [eval] MemoryBlock$bytes(compute_address(place, root_address), Size$I64$()) == to_bytes$I64(snapshot)
; [eval] MemoryBlock$bytes(compute_address(place, root_address), Size$I64$())
; [eval] compute_address(place, root_address)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 4
(declare-const $k@183@01 $Perm)
(assert ($Perm.isReadVar $k@183@01))
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> (compute_address<Address> (as _4$place<Place>  Place) _4$address@83@01))
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _4$place<Place>  Place)) _4$address@83@01))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (< $k@183@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@183@01)))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@183@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@179@01)) (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _4$place<Place>  Place)) _4$address@83@01) (as Size$I64$<Snap$Usize>  Snap$Usize)))
(pop) ; 4
; Joined path conditions
(assert ($Perm.isReadVar $k@183@01))
(assert (and
  (< $k@183@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@183@01))
  (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@179@01)) (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _4$place<Place>  Place)) _4$address@83@01) (as Size$I64$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$I64(snapshot)
(set-option :timeout 0)
(push) ; 4
(assert (not (=
  (MemoryBlock$bytes ($Snap.first ($Snap.second $t@179@01)) (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _4$place<Place>  Place)) _4$address@83@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
  (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _4$snapshot$1@85@01)))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (=
  (MemoryBlock$bytes ($Snap.first ($Snap.second $t@179@01)) (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _4$place<Place>  Place)) _4$address@83@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
  (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _4$snapshot$1@85@01))))
(assert (OwnedNonAliased$I64%trigger ($Snap.combine
  $Snap.unit
  ($Snap.combine ($Snap.first ($Snap.second $t@179@01)) $Snap.unit)) (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _4$place<Place>  Place)) _4$address@83@01 (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _4$snapshot$1@85@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (=
    (as _1$place<Place>  Place)
    (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _4$place<Place>  Place)))
  (= _1$address@4@01 _4$address@83@01)
  (=
    _1$snapshot$0@5@01
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _4$snapshot$1@85@01)))))
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
    (as _3$place<Place>  Place)
    (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _4$place<Place>  Place)))
  (= _3$address@80@01 _4$address@83@01)
  (=
    _3$snapshot$1@82@01
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _4$snapshot$1@85@01)))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [exec]
; move_place$I64(_2$place(), _2$address, field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(_4$place()),
;   _4$address, destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(_4$snapshot$1))
; [eval] _2$place()
; [eval] field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(_4$place())
; [eval] _4$place()
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(_4$snapshot$1)
; [eval] compute_address(target_place, target_root_address)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _4$place<Place>  Place) _4$address@83@01)
    (compute_address<Address> (as _2$place<Place>  Place) _2$address@39@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
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
  _2$address@39@01
  (compute_address<Address> (as _2$place<Place>  Place) _2$address@39@01))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(declare-const $t@184@01 $Snap)
(assert (= $t@184@01 ($Snap.combine ($Snap.first $t@184@01) ($Snap.second $t@184@01))))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (= (as _3$place<Place>  Place) (as _2$place<Place>  Place))
  (= _3$address@80@01 _2$address@39@01)
  (=
    _3$snapshot$1@82@01
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _4$snapshot$1@85@01)))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (= (as _1$place<Place>  Place) (as _2$place<Place>  Place))
  (= _1$address@4@01 _2$address@39@01)
  (=
    _1$snapshot$0@5@01
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _4$snapshot$1@85@01)))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second $t@184@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@184@01))
    ($Snap.second ($Snap.second $t@184@01)))))
; [eval] compute_address(source_place, source_root_address)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _4$place<Place>  Place) _4$address@83@01)
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _4$place<Place>  Place)) _4$address@83@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
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
    _25$address@69@01
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _4$place<Place>  Place)) _4$address@83@01))
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
    _23$address@59@01
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _4$place<Place>  Place)) _4$address@83@01))
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
    _0$address@0@01
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _4$place<Place>  Place)) _4$address@83@01))
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
    _24$address@64@01
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _4$place<Place>  Place)) _4$address@83@01))
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
    _26$address@74@01
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _4$place<Place>  Place)) _4$address@83@01))
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (= ($Snap.second ($Snap.second $t@184@01)) $Snap.unit))
; [eval] valid$Snap$I64(source_snapshot)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _2$snapshot$1 ==
;   destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(_4$snapshot$1)
(declare-const $t@185@01 $Snap)
(assert (= $t@185@01 $Snap.unit))
; [eval] _2$snapshot$1 == destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(_4$snapshot$1)
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(_4$snapshot$1)
(assert (=
  _2$snapshot$1@41@01
  (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _4$snapshot$1@85@01)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; into_memory_block$I64(_3$place(), _3$address, _3$snapshot$1)
; [eval] _3$place()
; [eval] compute_address(place, root_address)
; [eval] Size$I64$()
(declare-const $t@186@01 $Snap)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (=
    _26$address@74@01
    (compute_address<Address> (as _3$place<Place>  Place) _3$address@80@01))
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
    _24$address@64@01
    (compute_address<Address> (as _3$place<Place>  Place) _3$address@80@01))
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
    _0$address@0@01
    (compute_address<Address> (as _3$place<Place>  Place) _3$address@80@01))
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
    _23$address@59@01
    (compute_address<Address> (as _3$place<Place>  Place) _3$address@80@01))
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
    _25$address@69@01
    (compute_address<Address> (as _3$place<Place>  Place) _3$address@80@01))
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
    (compute_address<Address> (as _4$place<Place>  Place) _4$address@83@01)
    (compute_address<Address> (as _3$place<Place>  Place) _3$address@80@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
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
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _4$place<Place>  Place)) _4$address@83@01)
  (compute_address<Address> (as _3$place<Place>  Place) _3$address@80@01))))
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
  (compute_address<Address> (as _3$place<Place>  Place) _3$address@80@01)
  _3$address@80@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(MemoryBlockStackDrop(_3$address, Size$I64$()), write)
; [eval] Size$I64$()
; [exec]
; inhale acc(MemoryBlock(_5$address, Size$I64$()), write)
; [eval] Size$I64$()
(declare-const $t@187@01 $Snap)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _4$place<Place>  Place)) _4$address@83@01)
  _5$address@86@01)))
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
    (compute_address<Address> (as _4$place<Place>  Place) _4$address@83@01)
    _5$address@86@01)
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
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
  (= _25$address@69@01 _5$address@86@01)
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
  (= _23$address@59@01 _5$address@86@01)
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
  (= _0$address@0@01 _5$address@86@01)
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
  (= _24$address@64@01 _5$address@86@01)
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
  (= _26$address@74@01 _5$address@86@01)
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
; inhale acc(MemoryBlockStackDrop(_5$address, Size$I64$()), write)
; [eval] Size$I64$()
(declare-const $t@188@01 $Snap)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= _2$address@39@01 _5$address@86@01)))
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
; inhale acc(MemoryBlock(_6$address, Size$I64$()), write)
; [eval] Size$I64$()
(declare-const $t@189@01 $Snap)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= _5$address@86@01 _6$address@88@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _4$place<Place>  Place)) _4$address@83@01)
  _6$address@88@01)))
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
    (compute_address<Address> (as _4$place<Place>  Place) _4$address@83@01)
    _6$address@88@01)
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
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
  (= _25$address@69@01 _6$address@88@01)
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
  (= _23$address@59@01 _6$address@88@01)
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
  (= _0$address@0@01 _6$address@88@01)
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
  (= _24$address@64@01 _6$address@88@01)
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
  (= _26$address@74@01 _6$address@88@01)
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
; inhale acc(MemoryBlockStackDrop(_6$address, Size$I64$()), write)
; [eval] Size$I64$()
(declare-const $t@190@01 $Snap)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= _5$address@86@01 _6$address@88@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= _2$address@39@01 _6$address@88@01)))
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
; copy_place$I64(_6$place(), _6$address, _2$place(), _2$address, _2$snapshot$1,
;   write)
; [eval] _6$place()
; [eval] _2$place()
; [eval] none < source_permission_amount
; [eval] compute_address(target_place, target_root_address)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (=
    _26$address@74@01
    (compute_address<Address> (as _6$place<Place>  Place) _6$address@88@01))
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
    _24$address@64@01
    (compute_address<Address> (as _6$place<Place>  Place) _6$address@88@01))
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
    _0$address@0@01
    (compute_address<Address> (as _6$place<Place>  Place) _6$address@88@01))
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
    _23$address@59@01
    (compute_address<Address> (as _6$place<Place>  Place) _6$address@88@01))
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
    _25$address@69@01
    (compute_address<Address> (as _6$place<Place>  Place) _6$address@88@01))
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
    (compute_address<Address> (as _4$place<Place>  Place) _4$address@83@01)
    (compute_address<Address> (as _6$place<Place>  Place) _6$address@88@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
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
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _4$place<Place>  Place)) _4$address@83@01)
  (compute_address<Address> (as _6$place<Place>  Place) _6$address@88@01))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  _5$address@86@01
  (compute_address<Address> (as _6$place<Place>  Place) _6$address@88@01))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  _6$address@88@01
  (compute_address<Address> (as _6$place<Place>  Place) _6$address@88@01))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> _4$snapshot$1@85@01)
  _2$snapshot$1@41@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(declare-const $t@191@01 $Snap)
(assert (= $t@191@01 ($Snap.combine ($Snap.first $t@191@01) ($Snap.second $t@191@01))))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (= (as _1$place<Place>  Place) (as _2$place<Place>  Place))
  (= _1$address@4@01 _2$address@39@01)
  (= _1$snapshot$0@5@01 _2$snapshot$1@41@01))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second $t@191@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@191@01))
    ($Snap.second ($Snap.second $t@191@01)))))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (= (as _1$place<Place>  Place) (as _6$place<Place>  Place))
  (= _1$address@4@01 _6$address@88@01)
  (= _1$snapshot$0@5@01 _2$snapshot$1@41@01))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (= (as _2$place<Place>  Place) (as _6$place<Place>  Place))
  (= _2$address@39@01 _6$address@88@01))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (= ($Snap.second ($Snap.second $t@191@01)) $Snap.unit))
; [eval] valid$Snap$I64(source_snapshot)
(assert (valid$Snap$I64<Bool> _2$snapshot$1@41@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _6$snapshot$1 == _2$snapshot$1
(declare-const $t@192@01 $Snap)
(assert (= $t@192@01 $Snap.unit))
; [eval] _6$snapshot$1 == _2$snapshot$1
(assert (= _6$snapshot$1@90@01 _2$snapshot$1@41@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; lft_function_call_1$snapshot$1 := lft_1$snapshot$1
; [exec]
; consume$Move$I64(_6$place(), _6$address, _6$snapshot$1)
; [eval] _6$place()
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= _2$snapshot$1@41@01 _6$snapshot$1@90@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [eval] valid$Snap$I64(operand1_value)
(set-option :timeout 0)
(push) ; 4
(assert (not (valid$Snap$I64<Bool> _6$snapshot$1@90@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (valid$Snap$I64<Bool> _6$snapshot$1@90@01))
; [eval] compute_address(operand1_place, operand1_root_address)
; [eval] Size$I64$()
(declare-const $t@193@01 $Snap)
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  _5$address@86@01
  (compute_address<Address> (as _6$place<Place>  Place) _6$address@88@01))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _4$place<Place>  Place)) _4$address@83@01)
  (compute_address<Address> (as _6$place<Place>  Place) _6$address@88@01))))
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
    (compute_address<Address> (as _4$place<Place>  Place) _4$address@83@01)
    (compute_address<Address> (as _6$place<Place>  Place) _6$address@88@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
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
    _25$address@69@01
    (compute_address<Address> (as _6$place<Place>  Place) _6$address@88@01))
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
    _23$address@59@01
    (compute_address<Address> (as _6$place<Place>  Place) _6$address@88@01))
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
    _0$address@0@01
    (compute_address<Address> (as _6$place<Place>  Place) _6$address@88@01))
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
    _24$address@64@01
    (compute_address<Address> (as _6$place<Place>  Place) _6$address@88@01))
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
    _26$address@74@01
    (compute_address<Address> (as _6$place<Place>  Place) _6$address@88@01))
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
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
; exhale acc(LifetimeToken(lft_1$snapshot$1), lifetime_token_perm_amount$0$snapshot$0 /
;   14)
; [eval] lifetime_token_perm_amount$0$snapshot$0 / 14
(set-option :timeout 0)
(push) ; 4
(assert (not (or
  (= (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 14)) $Perm.No)
  (< $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 14))))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  (-
    (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))
    ($Perm.min
      (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))
      (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 14))))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (<=
  $Perm.No
  (-
    (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))
    ($Perm.min
      (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))
      (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 14))))))
(set-option :timeout 0)
(push) ; 4
(assert (not (or
  (=
    (-
      (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 14))
      ($Perm.min
        (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))
        (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 14))))
    $Perm.No)
  (<
    (-
      (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 14))
      ($Perm.min
        (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))
        (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 14))))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 14)))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(LifetimeToken(lft_function_call_1$snapshot$1), lifetime_token_perm_amount$0$snapshot$0 /
;   14)
; [eval] lifetime_token_perm_amount$0$snapshot$0 / 14
(set-option :timeout 0)
(push) ; 4
(assert (not (or
  (= (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 14)) $Perm.No)
  (< $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 14))))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  (-
    (-
      (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))
      ($Perm.min
        (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))
        (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 14))))
    ($Perm.min
      (-
        (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))
        ($Perm.min
          (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))
          (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 14))))
      (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 14))))
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
      (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 14))
      ($Perm.min
        (-
          (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))
          ($Perm.min
            (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))
            (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 14))))
        (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 14))))
    $Perm.No)
  (<
    (-
      (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 14))
      ($Perm.min
        (-
          (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))
          ($Perm.min
            (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))
            (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 14))))
        (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 14))))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 14)))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(MemoryBlock(_5$address, Size$I64$()), write)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not tmp$1@147@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not tmp$1@147@01))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [then-branch: 2 | tmp$1@147@01 | live]
; [else-branch: 2 | !(tmp$1@147@01) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 2 | tmp$1@147@01]
(assert tmp$1@147@01)
; [exec]
; label label_2_custom
; [exec]
; label_2_custom$marker := true
; [exec]
; inhale basic_block_marker$label_2_custom$marker()
(declare-const $t@194@01 $Snap)
(assert (= $t@194@01 $Snap.unit))
; [eval] basic_block_marker$label_2_custom$marker()
(assert (as basic_block_marker$label_2_custom$marker<Bool>  Bool))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(OwnedNonAliased$I64(_5$place(), _5$address, _5$snapshot$0), write) &&
;   valid$Snap$I64(_5$snapshot$0)
(declare-const $t@195@01 $Snap)
(assert (= $t@195@01 ($Snap.combine ($Snap.first $t@195@01) ($Snap.second $t@195@01))))
; [eval] _5$place()
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= (as _1$place<Place>  Place) (as _5$place<Place>  Place))
  (= _1$address@4@01 _5$address@86@01)
  (= _1$snapshot$0@5@01 _5$snapshot$0@87@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= (as _2$place<Place>  Place) (as _5$place<Place>  Place))
  (= _2$address@39@01 _5$address@86@01)
  (= _2$snapshot$1@41@01 _5$snapshot$0@87@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (= ($Snap.second $t@195@01) $Snap.unit))
; [eval] valid$Snap$I64(_5$snapshot$0)
(assert (valid$Snap$I64<Bool> _5$snapshot$0@87@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(LifetimeToken(lft_1$snapshot$1), lifetime_token_perm_amount$0$snapshot$0 /
;   7)
; [eval] lifetime_token_perm_amount$0$snapshot$0 / 7
(set-option :timeout 0)
(push) ; 5
(assert (not (or
  (= (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)) $Perm.No)
  (< $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(declare-const $t@196@01 $Snap)
(push) ; 5
(set-option :timeout 10)
(assert (not (= bw1$snapshot$0@109@01 lft@161@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= bw0$snapshot$0@108@01 lft@161@01)))
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
; inhale acc(LifetimeToken(lft_function_call_1$snapshot$1), lifetime_token_perm_amount$0$snapshot$0 /
;   7)
; [eval] lifetime_token_perm_amount$0$snapshot$0 / 7
(set-option :timeout 0)
(push) ; 5
(assert (not (or
  (= (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)) $Perm.No)
  (< $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(declare-const $t@197@01 $Snap)
(declare-const $t@198@01 $Snap)
(assert (and
  (=>
    (< $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)))
    (= $t@198@01 $t@196@01))
  (=>
    (< $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)))
    (= $t@198@01 $t@197@01))))
(assert (<=
  $Perm.No
  (+
    (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))
    (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)))))
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
(declare-const $t@199@01 $Snap)
(assert (= $t@199@01 $Snap.unit))
; [eval] basic_block_marker$label_bb2$marker()
(assert (as basic_block_marker$label_bb2$marker<Bool>  Bool))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; exhale acc(MemoryBlock(_6$address, Size$I64$()), write)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _26$address@74@01 _6$address@88@01)
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
  (= _24$address@64@01 _6$address@88@01)
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
  (= _0$address@0@01 _6$address@88@01)
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
  (= _23$address@59@01 _6$address@88@01)
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
  (= _25$address@69@01 _6$address@88@01)
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
    (compute_address<Address> (as _4$place<Place>  Place) _4$address@83@01)
    _6$address@88@01)
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
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _4$place<Place>  Place)) _4$address@83@01)
  _6$address@88@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _6$place<Place>  Place) _6$address@88@01)
  _6$address@88@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(MemoryBlockStackDrop(_6$address, Size$I64$()), write)
; [eval] Size$I64$()
; [exec]
; inhale acc(MemoryBlock(_7$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
(declare-const $t@200@01 $Snap)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _4$place<Place>  Place)) _4$address@83@01)
    _7$address@93@01)
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
    (compute_address<Address> (as _4$place<Place>  Place) _4$address@83@01)
    _7$address@93@01)
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
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
  (= _25$address@69@01 _7$address@93@01)
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
  (= _23$address@59@01 _7$address@93@01)
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
(assert (not (= _0$address@0@01 _7$address@93@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _24$address@64@01 _7$address@93@01)
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
  (= _26$address@74@01 _7$address@93@01)
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
; inhale acc(MemoryBlockStackDrop(_7$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
(declare-const $t@201@01 $Snap)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _5$address@86@01 _7$address@93@01)
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
  (= _2$address@39@01 _7$address@93@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
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
; inhale acc(MemoryBlock(_8$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
(declare-const $t@202@01 $Snap)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= _7$address@93@01 _8$address@98@01)))
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
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _4$place<Place>  Place)) _4$address@83@01)
    _8$address@98@01)
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
    (compute_address<Address> (as _4$place<Place>  Place) _4$address@83@01)
    _8$address@98@01)
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
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
  (= _25$address@69@01 _8$address@98@01)
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
  (= _23$address@59@01 _8$address@98@01)
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
(assert (not (= _0$address@0@01 _8$address@98@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _24$address@64@01 _8$address@98@01)
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
  (= _26$address@74@01 _8$address@98@01)
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
; inhale acc(MemoryBlockStackDrop(_8$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
(declare-const $t@203@01 $Snap)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= _7$address@93@01 _8$address@98@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _5$address@86@01 _8$address@98@01)
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
  (= _2$address@39@01 _8$address@98@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
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
; inhale acc(MemoryBlock(_9$address, Size$Bool$()), write)
; [eval] Size$Bool$()
(declare-const $t@204@01 $Snap)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _8$address@98@01 _9$address@103@01)
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
  (= _7$address@93@01 _9$address@103@01)
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
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _4$place<Place>  Place)) _4$address@83@01)
    _9$address@103@01)
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
    (compute_address<Address> (as _4$place<Place>  Place) _4$address@83@01)
    _9$address@103@01)
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= _25$address@69@01 _9$address@103@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= _23$address@59@01 _9$address@103@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _0$address@0@01 _9$address@103@01)
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
(assert (not (= _24$address@64@01 _9$address@103@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= _26$address@74@01 _9$address@103@01)))
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
; inhale acc(MemoryBlockStackDrop(_9$address, Size$Bool$()), write)
; [eval] Size$Bool$()
(declare-const $t@205@01 $Snap)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _8$address@98@01 _9$address@103@01)
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
  (= _7$address@93@01 _9$address@103@01)
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
  (= _5$address@86@01 _9$address@103@01)
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
  (= _2$address@39@01 _9$address@103@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
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
; write_place_constant$Bool(_9$place(), _9$address, constructor$Snap$Bool$(false))
; [eval] _9$place()
; [eval] constructor$Snap$Bool$(false)
; [eval] compute_address(target_place, target_root_address)
; [eval] Size$Bool$()
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  _26$address@74@01
  (compute_address<Address> (as _9$place<Place>  Place) _9$address@103@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  _24$address@64@01
  (compute_address<Address> (as _9$place<Place>  Place) _9$address@103@01))))
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
    (compute_address<Address> (as _9$place<Place>  Place) _9$address@103@01))
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
  _23$address@59@01
  (compute_address<Address> (as _9$place<Place>  Place) _9$address@103@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  _25$address@69@01
  (compute_address<Address> (as _9$place<Place>  Place) _9$address@103@01))))
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
    (compute_address<Address> (as _4$place<Place>  Place) _4$address@83@01)
    (compute_address<Address> (as _9$place<Place>  Place) _9$address@103@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
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
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _4$place<Place>  Place)) _4$address@83@01)
    (compute_address<Address> (as _9$place<Place>  Place) _9$address@103@01))
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
    _7$address@93@01
    (compute_address<Address> (as _9$place<Place>  Place) _9$address@103@01))
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
    _8$address@98@01
    (compute_address<Address> (as _9$place<Place>  Place) _9$address@103@01))
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
  _9$address@103@01
  (compute_address<Address> (as _9$place<Place>  Place) _9$address@103@01))))
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
(declare-const $t@206@01 $Snap)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _4$place<Place>  Place))
    (as _9$place<Place>  Place))
  (= _4$address@83@01 _9$address@103@01)
  (=
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> result_value@178@01)
    (constructor$Snap$Bool$<Snap$Bool> false)))))
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
; inhale _9$snapshot$1 == constructor$Snap$Bool$(false)
(declare-const $t@207@01 $Snap)
(assert (= $t@207@01 $Snap.unit))
; [eval] _9$snapshot$1 == constructor$Snap$Bool$(false)
; [eval] constructor$Snap$Bool$(false)
(assert (= _9$snapshot$1@105@01 (constructor$Snap$Bool$<Snap$Bool> false)))
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
(declare-const $t@208@01 $Snap)
(assert (= $t@208@01 $Snap.unit))
; [eval] basic_block_marker$label_bb4$marker()
(assert (as basic_block_marker$label_bb4$marker<Bool>  Bool))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; write_place_constant$Tuple$$$(_8$place(), _8$address, constructor$Snap$Tuple$$$$())
; [eval] _8$place()
; [eval] constructor$Snap$Tuple$$$$()
; [eval] compute_address(target_place, target_root_address)
; [eval] Size$Tuple$$$$()
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  _8$address@98@01
  (compute_address<Address> (as _8$place<Place>  Place) _8$address@98@01))))
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
(declare-const $t@209@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _8$snapshot$1 == constructor$Snap$Tuple$$$$()
(declare-const $t@210@01 $Snap)
(assert (= $t@210@01 $Snap.unit))
; [eval] _8$snapshot$1 == constructor$Snap$Tuple$$$$()
; [eval] constructor$Snap$Tuple$$$$()
(assert (=
  _8$snapshot$1@100@01
  (as constructor$Snap$Tuple$$$$<Snap$Tuple$$$>  Snap$Tuple$$$)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; label label_bb5
; [exec]
; label_bb5$marker := true
; [exec]
; inhale basic_block_marker$label_bb5$marker()
(declare-const $t@211@01 $Snap)
(assert (= $t@211@01 $Snap.unit))
; [eval] basic_block_marker$label_bb5$marker()
(assert (as basic_block_marker$label_bb5$marker<Bool>  Bool))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; into_memory_block$Bool(_9$place(), _9$address, _9$snapshot$1)
; [eval] _9$place()
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _4$place<Place>  Place))
    (as _9$place<Place>  Place))
  (= _4$address@83@01 _9$address@103@01)
  (=
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> result_value@178@01)
    _9$snapshot$1@105@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (constructor$Snap$Bool$<Snap$Bool> false) _9$snapshot$1@105@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [eval] compute_address(place, root_address)
; [eval] Size$Bool$()
(declare-const $t@212@01 $Snap)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _7$address@93@01
    (compute_address<Address> (as _9$place<Place>  Place) _9$address@103@01))
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
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _4$place<Place>  Place)) _4$address@83@01)
    (compute_address<Address> (as _9$place<Place>  Place) _9$address@103@01))
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
    (compute_address<Address> (as _4$place<Place>  Place) _4$address@83@01)
    (compute_address<Address> (as _9$place<Place>  Place) _9$address@103@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
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
  _25$address@69@01
  (compute_address<Address> (as _9$place<Place>  Place) _9$address@103@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  _23$address@59@01
  (compute_address<Address> (as _9$place<Place>  Place) _9$address@103@01))))
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
    (compute_address<Address> (as _9$place<Place>  Place) _9$address@103@01))
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
  _24$address@64@01
  (compute_address<Address> (as _9$place<Place>  Place) _9$address@103@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  _26$address@74@01
  (compute_address<Address> (as _9$place<Place>  Place) _9$address@103@01))))
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
; exhale acc(MemoryBlock(_9$address, Size$Bool$()), write)
; [eval] Size$Bool$()
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _9$place<Place>  Place) _9$address@103@01)
  _9$address@103@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(MemoryBlockStackDrop(_9$address, Size$Bool$()), write)
; [eval] Size$Bool$()
; [exec]
; into_memory_block$Tuple$$$(_8$place(), _8$address, _8$snapshot$1)
; [eval] _8$place()
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  (as constructor$Snap$Tuple$$$$<Snap$Tuple$$$>  Snap$Tuple$$$)
  _8$snapshot$1@100@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [eval] compute_address(place, root_address)
; [eval] Size$Tuple$$$$()
(declare-const $t@213@01 $Snap)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _26$address@74@01
    (compute_address<Address> (as _8$place<Place>  Place) _8$address@98@01))
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
    _24$address@64@01
    (compute_address<Address> (as _8$place<Place>  Place) _8$address@98@01))
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
(assert (not (=
  _0$address@0@01
  (compute_address<Address> (as _8$place<Place>  Place) _8$address@98@01))))
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
    _23$address@59@01
    (compute_address<Address> (as _8$place<Place>  Place) _8$address@98@01))
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
    _25$address@69@01
    (compute_address<Address> (as _8$place<Place>  Place) _8$address@98@01))
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
    (compute_address<Address> (as _4$place<Place>  Place) _4$address@83@01)
    (compute_address<Address> (as _8$place<Place>  Place) _8$address@98@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
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
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _4$place<Place>  Place)) _4$address@83@01)
    (compute_address<Address> (as _8$place<Place>  Place) _8$address@98@01))
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
(assert (not (=
  _7$address@93@01
  (compute_address<Address> (as _8$place<Place>  Place) _8$address@98@01))))
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
; exhale acc(MemoryBlock(_8$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _8$place<Place>  Place) _8$address@98@01)
  _8$address@98@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(MemoryBlockStackDrop(_8$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
; [exec]
; inhale acc(MemoryBlock(_11$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
(declare-const $t@214@01 $Snap)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= _7$address@93@01 _11$address@6@01)))
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
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _4$place<Place>  Place)) _4$address@83@01)
    _11$address@6@01)
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
    (compute_address<Address> (as _4$place<Place>  Place) _4$address@83@01)
    _11$address@6@01)
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
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
  (= _25$address@69@01 _11$address@6@01)
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
  (= _23$address@59@01 _11$address@6@01)
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
(assert (not (= _0$address@0@01 _11$address@6@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _24$address@64@01 _11$address@6@01)
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
  (= _26$address@74@01 _11$address@6@01)
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
; inhale acc(MemoryBlockStackDrop(_11$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
(declare-const $t@215@01 $Snap)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= _7$address@93@01 _11$address@6@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _5$address@86@01 _11$address@6@01)
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
  (= _2$address@39@01 _11$address@6@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
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
; inhale acc(MemoryBlock(_12$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
(declare-const $t@216@01 $Snap)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= _11$address@6@01 _12$address@8@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= _7$address@93@01 _12$address@8@01)))
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
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _4$place<Place>  Place)) _4$address@83@01)
    _12$address@8@01)
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
    (compute_address<Address> (as _4$place<Place>  Place) _4$address@83@01)
    _12$address@8@01)
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
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
  (= _25$address@69@01 _12$address@8@01)
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
  (= _23$address@59@01 _12$address@8@01)
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
(assert (not (= _0$address@0@01 _12$address@8@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _24$address@64@01 _12$address@8@01)
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
  (= _26$address@74@01 _12$address@8@01)
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
; inhale acc(MemoryBlockStackDrop(_12$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
(declare-const $t@217@01 $Snap)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= _11$address@6@01 _12$address@8@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= _7$address@93@01 _12$address@8@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _5$address@86@01 _12$address@8@01)
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
  (= _2$address@39@01 _12$address@8@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
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
; inhale acc(MemoryBlock(_13$address, Size$Bool$()), write)
; [eval] Size$Bool$()
(declare-const $t@218@01 $Snap)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _12$address@8@01 _13$address@13@01)
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
  (= _11$address@6@01 _13$address@13@01)
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
  (= _7$address@93@01 _13$address@13@01)
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
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _4$place<Place>  Place)) _4$address@83@01)
    _13$address@13@01)
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
    (compute_address<Address> (as _4$place<Place>  Place) _4$address@83@01)
    _13$address@13@01)
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= _25$address@69@01 _13$address@13@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= _23$address@59@01 _13$address@13@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _0$address@0@01 _13$address@13@01)
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
(assert (not (= _24$address@64@01 _13$address@13@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= _26$address@74@01 _13$address@13@01)))
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
; inhale acc(MemoryBlockStackDrop(_13$address, Size$Bool$()), write)
; [eval] Size$Bool$()
(declare-const $t@219@01 $Snap)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _12$address@8@01 _13$address@13@01)
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
  (= _11$address@6@01 _13$address@13@01)
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
  (= _7$address@93@01 _13$address@13@01)
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
  (= _5$address@86@01 _13$address@13@01)
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
  (= _2$address@39@01 _13$address@13@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
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
; inhale acc(MemoryBlock(_14$address, Size$I64$()), write)
; [eval] Size$I64$()
(declare-const $t@220@01 $Snap)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _13$address@13@01 _14$address@15@01)
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
  (= _12$address@8@01 _14$address@15@01)
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
  (= _11$address@6@01 _14$address@15@01)
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
  (= _7$address@93@01 _14$address@15@01)
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
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _4$place<Place>  Place)) _4$address@83@01)
  _14$address@15@01)))
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
    (compute_address<Address> (as _4$place<Place>  Place) _4$address@83@01)
    _14$address@15@01)
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
  (= _25$address@69@01 _14$address@15@01)
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
  (= _23$address@59@01 _14$address@15@01)
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
  (= _0$address@0@01 _14$address@15@01)
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
  (= _24$address@64@01 _14$address@15@01)
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
  (= _26$address@74@01 _14$address@15@01)
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
; inhale acc(MemoryBlockStackDrop(_14$address, Size$I64$()), write)
; [eval] Size$I64$()
(declare-const $t@221@01 $Snap)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= _13$address@13@01 _14$address@15@01)
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
  (= _12$address@8@01 _14$address@15@01)
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
  (= _11$address@6@01 _14$address@15@01)
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
  (= _7$address@93@01 _14$address@15@01)
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
(assert (not (= _5$address@86@01 _14$address@15@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= _2$address@39@01 _14$address@15@01)))
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
; copy_place$I64(_14$place(), _14$address, _2$place(), _2$address, _2$snapshot$1,
;   write)
; [eval] _14$place()
; [eval] _2$place()
; [eval] none < source_permission_amount
; [eval] compute_address(target_place, target_root_address)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _26$address@74@01
    (compute_address<Address> (as _14$place<Place>  Place) _14$address@15@01))
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
    _24$address@64@01
    (compute_address<Address> (as _14$place<Place>  Place) _14$address@15@01))
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
    _0$address@0@01
    (compute_address<Address> (as _14$place<Place>  Place) _14$address@15@01))
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
    _23$address@59@01
    (compute_address<Address> (as _14$place<Place>  Place) _14$address@15@01))
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
    _25$address@69@01
    (compute_address<Address> (as _14$place<Place>  Place) _14$address@15@01))
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
    (compute_address<Address> (as _4$place<Place>  Place) _4$address@83@01)
    (compute_address<Address> (as _14$place<Place>  Place) _14$address@15@01))
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
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _4$place<Place>  Place)) _4$address@83@01)
  (compute_address<Address> (as _14$place<Place>  Place) _14$address@15@01))))
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
    _7$address@93@01
    (compute_address<Address> (as _14$place<Place>  Place) _14$address@15@01))
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
    _11$address@6@01
    (compute_address<Address> (as _14$place<Place>  Place) _14$address@15@01))
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
    _12$address@8@01
    (compute_address<Address> (as _14$place<Place>  Place) _14$address@15@01))
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
    _13$address@13@01
    (compute_address<Address> (as _14$place<Place>  Place) _14$address@15@01))
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
  _14$address@15@01
  (compute_address<Address> (as _14$place<Place>  Place) _14$address@15@01))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(declare-const $t@222@01 $Snap)
(assert (= $t@222@01 ($Snap.combine ($Snap.first $t@222@01) ($Snap.second $t@222@01))))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= (as _1$place<Place>  Place) (as _2$place<Place>  Place))
  (= _1$address@4@01 _2$address@39@01)
  (= _1$snapshot$0@5@01 _2$snapshot$1@41@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= (as _5$place<Place>  Place) (as _2$place<Place>  Place))
  (= _5$address@86@01 _2$address@39@01)
  (= _5$snapshot$0@87@01 _2$snapshot$1@41@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second $t@222@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@222@01))
    ($Snap.second ($Snap.second $t@222@01)))))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= (as _5$place<Place>  Place) (as _14$place<Place>  Place))
  (= _5$address@86@01 _14$address@15@01)
  (= _5$snapshot$0@87@01 _2$snapshot$1@41@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= (as _1$place<Place>  Place) (as _14$place<Place>  Place))
  (= _1$address@4@01 _14$address@15@01)
  (= _1$snapshot$0@5@01 _2$snapshot$1@41@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= (as _2$place<Place>  Place) (as _14$place<Place>  Place))
  (= _2$address@39@01 _14$address@15@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (= ($Snap.second ($Snap.second $t@222@01)) $Snap.unit))
; [eval] valid$Snap$I64(source_snapshot)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _14$snapshot$1 == _2$snapshot$1
(declare-const $t@223@01 $Snap)
(assert (= $t@223@01 $Snap.unit))
; [eval] _14$snapshot$1 == _2$snapshot$1
(assert (= _14$snapshot$1@17@01 _2$snapshot$1@41@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; lft_function_call_2$snapshot$1 := lft_1$snapshot$1
; [exec]
; consume$Move$I64(_14$place(), _14$address, _14$snapshot$1)
; [eval] _14$place()
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= _2$snapshot$1@41@01 _14$snapshot$1@17@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [eval] valid$Snap$I64(operand1_value)
(set-option :timeout 0)
(push) ; 5
(assert (not (valid$Snap$I64<Bool> _14$snapshot$1@17@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (valid$Snap$I64<Bool> _14$snapshot$1@17@01))
; [eval] compute_address(operand1_place, operand1_root_address)
; [eval] Size$I64$()
(declare-const $t@224@01 $Snap)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    _13$address@13@01
    (compute_address<Address> (as _14$place<Place>  Place) _14$address@15@01))
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
    _12$address@8@01
    (compute_address<Address> (as _14$place<Place>  Place) _14$address@15@01))
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
    _11$address@6@01
    (compute_address<Address> (as _14$place<Place>  Place) _14$address@15@01))
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
    _7$address@93@01
    (compute_address<Address> (as _14$place<Place>  Place) _14$address@15@01))
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
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _4$place<Place>  Place)) _4$address@83@01)
  (compute_address<Address> (as _14$place<Place>  Place) _14$address@15@01))))
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
    (compute_address<Address> (as _4$place<Place>  Place) _4$address@83@01)
    (compute_address<Address> (as _14$place<Place>  Place) _14$address@15@01))
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
    _25$address@69@01
    (compute_address<Address> (as _14$place<Place>  Place) _14$address@15@01))
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
    _23$address@59@01
    (compute_address<Address> (as _14$place<Place>  Place) _14$address@15@01))
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
    _0$address@0@01
    (compute_address<Address> (as _14$place<Place>  Place) _14$address@15@01))
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
    _24$address@64@01
    (compute_address<Address> (as _14$place<Place>  Place) _14$address@15@01))
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
    _26$address@74@01
    (compute_address<Address> (as _14$place<Place>  Place) _14$address@15@01))
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
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
; exhale acc(LifetimeToken(lft_1$snapshot$1), lifetime_token_perm_amount$0$snapshot$0 /
;   14)
; [eval] lifetime_token_perm_amount$0$snapshot$0 / 14
(set-option :timeout 0)
(push) ; 5
(assert (not (or
  (= (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 14)) $Perm.No)
  (< $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 14))))))
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
      (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))
      (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)))
    ($Perm.min
      (+
        (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))
        (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)))
      (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 14))))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (<=
  $Perm.No
  (-
    (+
      (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))
      (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)))
    ($Perm.min
      (+
        (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))
        (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)))
      (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 14))))))
(set-option :timeout 0)
(push) ; 5
(assert (not (or
  (=
    (-
      (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 14))
      ($Perm.min
        (+
          (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))
          (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)))
        (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 14))))
    $Perm.No)
  (<
    (-
      (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 14))
      ($Perm.min
        (+
          (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))
          (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)))
        (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 14))))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 14)))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(LifetimeToken(lft_function_call_2$snapshot$1), lifetime_token_perm_amount$0$snapshot$0 /
;   14)
; [eval] lifetime_token_perm_amount$0$snapshot$0 / 14
(set-option :timeout 0)
(push) ; 5
(assert (not (or
  (= (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 14)) $Perm.No)
  (< $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 14))))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  (-
    (-
      (+
        (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))
        (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)))
      ($Perm.min
        (+
          (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))
          (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)))
        (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 14))))
    ($Perm.min
      (-
        (+
          (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))
          (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)))
        ($Perm.min
          (+
            (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))
            (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)))
          (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 14))))
      (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 14))))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (<=
  $Perm.No
  (-
    (-
      (+
        (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))
        (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)))
      ($Perm.min
        (+
          (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))
          (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)))
        (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 14))))
    ($Perm.min
      (-
        (+
          (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))
          (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)))
        ($Perm.min
          (+
            (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))
            (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)))
          (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 14))))
      (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 14))))))
(set-option :timeout 0)
(push) ; 5
(assert (not (or
  (=
    (-
      (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 14))
      ($Perm.min
        (-
          (+
            (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))
            (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)))
          ($Perm.min
            (+
              (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))
              (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)))
            (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 14))))
        (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 14))))
    $Perm.No)
  (<
    (-
      (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 14))
      ($Perm.min
        (-
          (+
            (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))
            (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)))
          ($Perm.min
            (+
              (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))
              (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)))
            (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 14))))
        (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 14))))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 14)))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(MemoryBlock(_13$address, Size$Bool$()), write)
; [eval] Size$Bool$()
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not tmp$2@148@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not tmp$2@148@01))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [then-branch: 3 | tmp$2@148@01 | live]
; [else-branch: 3 | !(tmp$2@148@01) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 3 | tmp$2@148@01]
(assert tmp$2@148@01)
; [exec]
; label label_5_custom
; [exec]
; label_5_custom$marker := true
; [exec]
; inhale basic_block_marker$label_5_custom$marker()
(declare-const $t@225@01 $Snap)
(assert (= $t@225@01 $Snap.unit))
; [eval] basic_block_marker$label_5_custom$marker()
(assert (as basic_block_marker$label_5_custom$marker<Bool>  Bool))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(OwnedNonAliased$Bool(_13$place(), _13$address, _13$snapshot$0), write) &&
;   valid$Snap$Bool(_13$snapshot$0)
(declare-const $t@226@01 $Snap)
(assert (= $t@226@01 ($Snap.combine ($Snap.first $t@226@01) ($Snap.second $t@226@01))))
; [eval] _13$place()
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _4$place<Place>  Place))
    (as _13$place<Place>  Place))
  (= _4$address@83@01 _13$address@13@01)
  (=
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> result_value@178@01)
    _13$snapshot$0@14@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (= ($Snap.second $t@226@01) $Snap.unit))
; [eval] valid$Snap$Bool(_13$snapshot$0)
(assert (valid$Snap$Bool<Bool> _13$snapshot$0@14@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(LifetimeToken(lft_1$snapshot$1), lifetime_token_perm_amount$0$snapshot$0 /
;   7)
; [eval] lifetime_token_perm_amount$0$snapshot$0 / 7
(set-option :timeout 0)
(push) ; 6
(assert (not (or
  (= (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)) $Perm.No)
  (< $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(declare-const $t@227@01 $Snap)
(declare-const $t@228@01 $Snap)
(assert (and
  (=>
    (<
      $Perm.No
      (-
        (-
          (+
            (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))
            (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)))
          ($Perm.min
            (+
              (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))
              (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)))
            (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 14))))
        ($Perm.min
          (-
            (+
              (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))
              (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)))
            ($Perm.min
              (+
                (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))
                (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)))
              (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 14))))
          (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 14)))))
    (= $t@228@01 $t@198@01))
  (=>
    (< $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)))
    (= $t@228@01 $t@227@01))))
(assert (<=
  $Perm.No
  (+
    (-
      (-
        (+
          (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))
          (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)))
        ($Perm.min
          (+
            (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))
            (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)))
          (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 14))))
      ($Perm.min
        (-
          (+
            (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))
            (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)))
          ($Perm.min
            (+
              (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))
              (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)))
            (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 14))))
        (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 14))))
    (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(LifetimeToken(lft_function_call_2$snapshot$1), lifetime_token_perm_amount$0$snapshot$0 /
;   7)
; [eval] lifetime_token_perm_amount$0$snapshot$0 / 7
(set-option :timeout 0)
(push) ; 6
(assert (not (or
  (= (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)) $Perm.No)
  (< $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(declare-const $t@229@01 $Snap)
(declare-const $t@230@01 $Snap)
(assert (and
  (=>
    (<
      $Perm.No
      (+
        (-
          (-
            (+
              (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))
              (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)))
            ($Perm.min
              (+
                (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))
                (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)))
              (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 14))))
          ($Perm.min
            (-
              (+
                (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))
                (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)))
              ($Perm.min
                (+
                  (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))
                  (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)))
                (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 14))))
            (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 14))))
        (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))))
    (= $t@230@01 $t@228@01))
  (=>
    (< $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)))
    (= $t@230@01 $t@229@01))))
(assert (<=
  $Perm.No
  (+
    (+
      (-
        (-
          (+
            (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))
            (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)))
          ($Perm.min
            (+
              (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))
              (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)))
            (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 14))))
        ($Perm.min
          (-
            (+
              (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))
              (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)))
            ($Perm.min
              (+
                (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))
                (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)))
              (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 14))))
          (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 14))))
      (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)))
    (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)))))
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
(declare-const $t@231@01 $Snap)
(assert (= $t@231@01 $Snap.unit))
; [eval] basic_block_marker$label_bb6$marker()
(assert (as basic_block_marker$label_bb6$marker<Bool>  Bool))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; exhale acc(MemoryBlock(_14$address, Size$I64$()), write)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= _26$address@74@01 _14$address@15@01)
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
  (= _24$address@64@01 _14$address@15@01)
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
  (= _0$address@0@01 _14$address@15@01)
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
  (= _23$address@59@01 _14$address@15@01)
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
  (= _25$address@69@01 _14$address@15@01)
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
    (compute_address<Address> (as _4$place<Place>  Place) _4$address@83@01)
    _14$address@15@01)
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
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _4$place<Place>  Place)) _4$address@83@01)
  _14$address@15@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= _7$address@93@01 _14$address@15@01)
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
  (= _11$address@6@01 _14$address@15@01)
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
  (= _12$address@8@01 _14$address@15@01)
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
  (compute_address<Address> (as _14$place<Place>  Place) _14$address@15@01)
  _14$address@15@01)))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(MemoryBlockStackDrop(_14$address, Size$I64$()), write)
; [eval] Size$I64$()
; [exec]
; into_memory_block$Bool(_13$place(), _13$address, _13$snapshot$0)
; [eval] _13$place()
; [eval] compute_address(place, root_address)
; [eval] Size$Bool$()
(declare-const $t@232@01 $Snap)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    _12$address@8@01
    (compute_address<Address> (as _13$place<Place>  Place) _13$address@13@01))
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
    _11$address@6@01
    (compute_address<Address> (as _13$place<Place>  Place) _13$address@13@01))
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
    _7$address@93@01
    (compute_address<Address> (as _13$place<Place>  Place) _13$address@13@01))
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
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _4$place<Place>  Place)) _4$address@83@01)
    (compute_address<Address> (as _13$place<Place>  Place) _13$address@13@01))
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
    (compute_address<Address> (as _4$place<Place>  Place) _4$address@83@01)
    (compute_address<Address> (as _13$place<Place>  Place) _13$address@13@01))
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
  _25$address@69@01
  (compute_address<Address> (as _13$place<Place>  Place) _13$address@13@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  _23$address@59@01
  (compute_address<Address> (as _13$place<Place>  Place) _13$address@13@01))))
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
    (compute_address<Address> (as _13$place<Place>  Place) _13$address@13@01))
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
  _24$address@64@01
  (compute_address<Address> (as _13$place<Place>  Place) _13$address@13@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  _26$address@74@01
  (compute_address<Address> (as _13$place<Place>  Place) _13$address@13@01))))
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
; exhale acc(MemoryBlock(_13$address, Size$Bool$()), write)
; [eval] Size$Bool$()
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _13$place<Place>  Place) _13$address@13@01)
  _13$address@13@01)))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(MemoryBlockStackDrop(_13$address, Size$Bool$()), write)
; [eval] Size$Bool$()
; [exec]
; write_place_constant$Tuple$$$(_12$place(), _12$address, constructor$Snap$Tuple$$$$())
; [eval] _12$place()
; [eval] constructor$Snap$Tuple$$$$()
; [eval] compute_address(target_place, target_root_address)
; [eval] Size$Tuple$$$$()
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  _12$address@8@01
  (compute_address<Address> (as _12$place<Place>  Place) _12$address@8@01))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [eval] valid$Snap$Tuple$$$(source_snapshot)
(declare-const $t@233@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _12$snapshot$1 == constructor$Snap$Tuple$$$$()
(declare-const $t@234@01 $Snap)
(assert (= $t@234@01 $Snap.unit))
; [eval] _12$snapshot$1 == constructor$Snap$Tuple$$$$()
; [eval] constructor$Snap$Tuple$$$$()
(assert (=
  _12$snapshot$1@10@01
  (as constructor$Snap$Tuple$$$$<Snap$Tuple$$$>  Snap$Tuple$$$)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; consume$Move$Tuple$$$(_12$place(), _12$address, _12$snapshot$1)
; [eval] _12$place()
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  (as constructor$Snap$Tuple$$$$<Snap$Tuple$$$>  Snap$Tuple$$$)
  _12$snapshot$1@10@01)))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [eval] valid$Snap$Tuple$$$(operand1_value)
(set-option :timeout 0)
(push) ; 6
(assert (not (valid$Snap$Tuple$$$<Bool> _12$snapshot$1@10@01)))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (valid$Snap$Tuple$$$<Bool> _12$snapshot$1@10@01))
; [eval] compute_address(operand1_place, operand1_root_address)
; [eval] Size$Tuple$$$$()
(declare-const $t@235@01 $Snap)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  _11$address@6@01
  (compute_address<Address> (as _12$place<Place>  Place) _12$address@8@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  _7$address@93@01
  (compute_address<Address> (as _12$place<Place>  Place) _12$address@8@01))))
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
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _4$place<Place>  Place)) _4$address@83@01)
    (compute_address<Address> (as _12$place<Place>  Place) _12$address@8@01))
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
    (compute_address<Address> (as _4$place<Place>  Place) _4$address@83@01)
    (compute_address<Address> (as _12$place<Place>  Place) _12$address@8@01))
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
  (=
    _25$address@69@01
    (compute_address<Address> (as _12$place<Place>  Place) _12$address@8@01))
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
    _23$address@59@01
    (compute_address<Address> (as _12$place<Place>  Place) _12$address@8@01))
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
  (compute_address<Address> (as _12$place<Place>  Place) _12$address@8@01))))
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
    _24$address@64@01
    (compute_address<Address> (as _12$place<Place>  Place) _12$address@8@01))
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
    _26$address@74@01
    (compute_address<Address> (as _12$place<Place>  Place) _12$address@8@01))
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
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
; exhale acc(MemoryBlock(_11$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
; [exec]
; inhale acc(OwnedNonAliased$Tuple$$$(_11$place(), _11$address, _11$snapshot$0), write) &&
;   valid$Snap$Tuple$$$(_11$snapshot$0)
(declare-const $t@236@01 $Snap)
(assert (= $t@236@01 ($Snap.combine ($Snap.first $t@236@01) ($Snap.second $t@236@01))))
; [eval] _11$place()
(assert (= ($Snap.second $t@236@01) $Snap.unit))
; [eval] valid$Snap$Tuple$$$(_11$snapshot$0)
(assert (valid$Snap$Tuple$$$<Bool> _11$snapshot$0@7@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale destructor$Snap$Bool$$value(constructor$Snap$Bool$EqCmp_Tuple$$$(_11$snapshot$0,
;   _12$snapshot$1))
(declare-const $t@237@01 $Snap)
(assert (= $t@237@01 $Snap.unit))
; [eval] destructor$Snap$Bool$$value(constructor$Snap$Bool$EqCmp_Tuple$$$(_11$snapshot$0, _12$snapshot$1))
; [eval] constructor$Snap$Bool$EqCmp_Tuple$$$(_11$snapshot$0, _12$snapshot$1)
(assert (destructor$Snap$Bool$$value<Bool> (constructor$Snap$Bool$EqCmp_Tuple$$$<Snap$Bool> _11$snapshot$0@7@01 _12$snapshot$1@10@01)))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; label label_bb7
; [exec]
; label_bb7$marker := true
; [exec]
; inhale basic_block_marker$label_bb7$marker()
(declare-const $t@238@01 $Snap)
(assert (= $t@238@01 $Snap.unit))
; [eval] basic_block_marker$label_bb7$marker()
(assert (as basic_block_marker$label_bb7$marker<Bool>  Bool))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; exhale acc(MemoryBlock(_12$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= _26$address@74@01 _12$address@8@01)
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
  (= _24$address@64@01 _12$address@8@01)
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
(assert (not (= _0$address@0@01 _12$address@8@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= _23$address@59@01 _12$address@8@01)
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
  (= _25$address@69@01 _12$address@8@01)
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
    (compute_address<Address> (as _4$place<Place>  Place) _4$address@83@01)
    _12$address@8@01)
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
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
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _4$place<Place>  Place)) _4$address@83@01)
    _12$address@8@01)
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
(assert (not (= _7$address@93@01 _12$address@8@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _12$place<Place>  Place) _12$address@8@01)
  _12$address@8@01)))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(MemoryBlockStackDrop(_12$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
; [exec]
; inhale acc(MemoryBlock(_15$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
(declare-const $t@239@01 $Snap)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= _7$address@93@01 _15$address@20@01)))
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
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _4$place<Place>  Place)) _4$address@83@01)
    _15$address@20@01)
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
    (compute_address<Address> (as _4$place<Place>  Place) _4$address@83@01)
    _15$address@20@01)
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
  (= _25$address@69@01 _15$address@20@01)
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
  (= _23$address@59@01 _15$address@20@01)
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
(assert (not (= _0$address@0@01 _15$address@20@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= _24$address@64@01 _15$address@20@01)
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
  (= _26$address@74@01 _15$address@20@01)
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
; inhale acc(MemoryBlockStackDrop(_15$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
(declare-const $t@240@01 $Snap)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= _11$address@6@01 _15$address@20@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= _7$address@93@01 _15$address@20@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= _5$address@86@01 _15$address@20@01)
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
  (= _2$address@39@01 _15$address@20@01)
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
; inhale acc(MemoryBlock(_16$address, Size$Bool$()), write)
; [eval] Size$Bool$()
(declare-const $t@241@01 $Snap)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= _15$address@20@01 _16$address@25@01)
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
  (= _7$address@93@01 _16$address@25@01)
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
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _4$place<Place>  Place)) _4$address@83@01)
    _16$address@25@01)
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
    (compute_address<Address> (as _4$place<Place>  Place) _4$address@83@01)
    _16$address@25@01)
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
(assert (not (= _25$address@69@01 _16$address@25@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= _23$address@59@01 _16$address@25@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= _0$address@0@01 _16$address@25@01)
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
(assert (not (= _24$address@64@01 _16$address@25@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= _26$address@74@01 _16$address@25@01)))
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
; inhale acc(MemoryBlockStackDrop(_16$address, Size$Bool$()), write)
; [eval] Size$Bool$()
(declare-const $t@242@01 $Snap)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= _15$address@20@01 _16$address@25@01)
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
  (= _11$address@6@01 _16$address@25@01)
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
  (= _7$address@93@01 _16$address@25@01)
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
  (= _5$address@86@01 _16$address@25@01)
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
  (= _2$address@39@01 _16$address@25@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
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
; write_place_constant$Bool(_16$place(), _16$address, constructor$Snap$Bool$(false))
; [eval] _16$place()
; [eval] constructor$Snap$Bool$(false)
; [eval] compute_address(target_place, target_root_address)
; [eval] Size$Bool$()
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  _26$address@74@01
  (compute_address<Address> (as _16$place<Place>  Place) _16$address@25@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  _24$address@64@01
  (compute_address<Address> (as _16$place<Place>  Place) _16$address@25@01))))
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
    (compute_address<Address> (as _16$place<Place>  Place) _16$address@25@01))
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
  _23$address@59@01
  (compute_address<Address> (as _16$place<Place>  Place) _16$address@25@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  _25$address@69@01
  (compute_address<Address> (as _16$place<Place>  Place) _16$address@25@01))))
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
    (compute_address<Address> (as _4$place<Place>  Place) _4$address@83@01)
    (compute_address<Address> (as _16$place<Place>  Place) _16$address@25@01))
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
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _4$place<Place>  Place)) _4$address@83@01)
    (compute_address<Address> (as _16$place<Place>  Place) _16$address@25@01))
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
    _7$address@93@01
    (compute_address<Address> (as _16$place<Place>  Place) _16$address@25@01))
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
    _15$address@20@01
    (compute_address<Address> (as _16$place<Place>  Place) _16$address@25@01))
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
  _16$address@25@01
  (compute_address<Address> (as _16$place<Place>  Place) _16$address@25@01))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [eval] valid$Snap$Bool(source_snapshot)
(declare-const $t@243@01 $Snap)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _4$place<Place>  Place))
    (as _16$place<Place>  Place))
  (= _4$address@83@01 _16$address@25@01)
  (=
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> result_value@178@01)
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
; inhale _16$snapshot$1 == constructor$Snap$Bool$(false)
(declare-const $t@244@01 $Snap)
(assert (= $t@244@01 $Snap.unit))
; [eval] _16$snapshot$1 == constructor$Snap$Bool$(false)
; [eval] constructor$Snap$Bool$(false)
(assert (= _16$snapshot$1@27@01 (constructor$Snap$Bool$<Snap$Bool> false)))
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
(declare-const $t@245@01 $Snap)
(assert (= $t@245@01 $Snap.unit))
; [eval] basic_block_marker$label_bb9$marker()
(assert (as basic_block_marker$label_bb9$marker<Bool>  Bool))
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
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  _15$address@20@01
  (compute_address<Address> (as _15$place<Place>  Place) _15$address@20@01))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [eval] valid$Snap$Tuple$$$(source_snapshot)
(declare-const $t@246@01 $Snap)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= (as _11$place<Place>  Place) (as _15$place<Place>  Place))
  (= _11$address@6@01 _15$address@20@01)
  (=
    _11$snapshot$0@7@01
    (as constructor$Snap$Tuple$$$$<Snap$Tuple$$$>  Snap$Tuple$$$)))))
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
; inhale _15$snapshot$1 == constructor$Snap$Tuple$$$$()
(declare-const $t@247@01 $Snap)
(assert (= $t@247@01 $Snap.unit))
; [eval] _15$snapshot$1 == constructor$Snap$Tuple$$$$()
; [eval] constructor$Snap$Tuple$$$$()
(assert (=
  _15$snapshot$1@22@01
  (as constructor$Snap$Tuple$$$$<Snap$Tuple$$$>  Snap$Tuple$$$)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; label label_bb10
; [exec]
; label_bb10$marker := true
; [exec]
; inhale basic_block_marker$label_bb10$marker()
(declare-const $t@248@01 $Snap)
(assert (= $t@248@01 $Snap.unit))
; [eval] basic_block_marker$label_bb10$marker()
(assert (as basic_block_marker$label_bb10$marker<Bool>  Bool))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; into_memory_block$Bool(_16$place(), _16$address, _16$snapshot$1)
; [eval] _16$place()
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _4$place<Place>  Place))
    (as _16$place<Place>  Place))
  (= _4$address@83@01 _16$address@25@01)
  (=
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> result_value@178@01)
    _16$snapshot$1@27@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= (constructor$Snap$Bool$<Snap$Bool> false) _16$snapshot$1@27@01)))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [eval] compute_address(place, root_address)
; [eval] Size$Bool$()
(declare-const $t@249@01 $Snap)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    _7$address@93@01
    (compute_address<Address> (as _16$place<Place>  Place) _16$address@25@01))
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
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _4$place<Place>  Place)) _4$address@83@01)
    (compute_address<Address> (as _16$place<Place>  Place) _16$address@25@01))
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
    (compute_address<Address> (as _4$place<Place>  Place) _4$address@83@01)
    (compute_address<Address> (as _16$place<Place>  Place) _16$address@25@01))
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
  _25$address@69@01
  (compute_address<Address> (as _16$place<Place>  Place) _16$address@25@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  _23$address@59@01
  (compute_address<Address> (as _16$place<Place>  Place) _16$address@25@01))))
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
    (compute_address<Address> (as _16$place<Place>  Place) _16$address@25@01))
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
  _24$address@64@01
  (compute_address<Address> (as _16$place<Place>  Place) _16$address@25@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  _26$address@74@01
  (compute_address<Address> (as _16$place<Place>  Place) _16$address@25@01))))
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
; exhale acc(MemoryBlock(_16$address, Size$Bool$()), write)
; [eval] Size$Bool$()
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _16$place<Place>  Place) _16$address@25@01)
  _16$address@25@01)))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(MemoryBlockStackDrop(_16$address, Size$Bool$()), write)
; [eval] Size$Bool$()
; [exec]
; into_memory_block$Tuple$$$(_15$place(), _15$address, _15$snapshot$1)
; [eval] _15$place()
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= (as _11$place<Place>  Place) (as _15$place<Place>  Place))
  (= _11$address@6@01 _15$address@20@01)
  (= _11$snapshot$0@7@01 _15$snapshot$1@22@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  (as constructor$Snap$Tuple$$$$<Snap$Tuple$$$>  Snap$Tuple$$$)
  _15$snapshot$1@22@01)))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [eval] compute_address(place, root_address)
; [eval] Size$Tuple$$$$()
(declare-const $t@250@01 $Snap)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    _26$address@74@01
    (compute_address<Address> (as _15$place<Place>  Place) _15$address@20@01))
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
    _24$address@64@01
    (compute_address<Address> (as _15$place<Place>  Place) _15$address@20@01))
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
  (compute_address<Address> (as _15$place<Place>  Place) _15$address@20@01))))
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
    _23$address@59@01
    (compute_address<Address> (as _15$place<Place>  Place) _15$address@20@01))
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
    _25$address@69@01
    (compute_address<Address> (as _15$place<Place>  Place) _15$address@20@01))
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
    (compute_address<Address> (as _4$place<Place>  Place) _4$address@83@01)
    (compute_address<Address> (as _15$place<Place>  Place) _15$address@20@01))
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
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _4$place<Place>  Place)) _4$address@83@01)
    (compute_address<Address> (as _15$place<Place>  Place) _15$address@20@01))
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
  _7$address@93@01
  (compute_address<Address> (as _15$place<Place>  Place) _15$address@20@01))))
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
; exhale acc(MemoryBlock(_15$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _15$place<Place>  Place) _15$address@20@01)
  _15$address@20@01)))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(MemoryBlockStackDrop(_15$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
; [exec]
; copy_place$Tuple$$$(_7$place(), _7$address, _11$place(), _11$address, _11$snapshot$0,
;   write)
; [eval] _7$place()
; [eval] _11$place()
; [eval] none < source_permission_amount
; [eval] compute_address(target_place, target_root_address)
; [eval] Size$Tuple$$$$()
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    _26$address@74@01
    (compute_address<Address> (as _7$place<Place>  Place) _7$address@93@01))
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
    _24$address@64@01
    (compute_address<Address> (as _7$place<Place>  Place) _7$address@93@01))
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
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
  (compute_address<Address> (as _7$place<Place>  Place) _7$address@93@01))))
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
    _23$address@59@01
    (compute_address<Address> (as _7$place<Place>  Place) _7$address@93@01))
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
    _25$address@69@01
    (compute_address<Address> (as _7$place<Place>  Place) _7$address@93@01))
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
    (compute_address<Address> (as _4$place<Place>  Place) _4$address@83@01)
    (compute_address<Address> (as _7$place<Place>  Place) _7$address@93@01))
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
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _4$place<Place>  Place)) _4$address@83@01)
    (compute_address<Address> (as _7$place<Place>  Place) _7$address@93@01))
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
  _7$address@93@01
  (compute_address<Address> (as _7$place<Place>  Place) _7$address@93@01))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(declare-const $t@251@01 $Snap)
(assert (= $t@251@01 ($Snap.combine ($Snap.first $t@251@01) ($Snap.second $t@251@01))))
(assert (=
  ($Snap.second $t@251@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@251@01))
    ($Snap.second ($Snap.second $t@251@01)))))
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= (as _11$place<Place>  Place) (as _7$place<Place>  Place))
  (= _11$address@6@01 _7$address@93@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (= ($Snap.second ($Snap.second $t@251@01)) $Snap.unit))
; [eval] valid$Snap$Tuple$$$(source_snapshot)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _7$snapshot$1 == _11$snapshot$0
(declare-const $t@252@01 $Snap)
(assert (= $t@252@01 $Snap.unit))
; [eval] _7$snapshot$1 == _11$snapshot$0
(assert (= _7$snapshot$1@95@01 _11$snapshot$0@7@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; into_memory_block$Tuple$$$(_11$place(), _11$address, _11$snapshot$0)
; [eval] _11$place()
; [eval] compute_address(place, root_address)
; [eval] Size$Tuple$$$$()
(declare-const $t@253@01 $Snap)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _4$place<Place>  Place)) _4$address@83@01)
    (compute_address<Address> (as _11$place<Place>  Place) _11$address@6@01))
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
    (compute_address<Address> (as _4$place<Place>  Place) _4$address@83@01)
    (compute_address<Address> (as _11$place<Place>  Place) _11$address@6@01))
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
  (=
    _25$address@69@01
    (compute_address<Address> (as _11$place<Place>  Place) _11$address@6@01))
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
    _23$address@59@01
    (compute_address<Address> (as _11$place<Place>  Place) _11$address@6@01))
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
  (compute_address<Address> (as _11$place<Place>  Place) _11$address@6@01))))
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
    _24$address@64@01
    (compute_address<Address> (as _11$place<Place>  Place) _11$address@6@01))
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
    _26$address@74@01
    (compute_address<Address> (as _11$place<Place>  Place) _11$address@6@01))
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
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
; exhale acc(MemoryBlock(_11$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _11$place<Place>  Place) _11$address@6@01)
  _11$address@6@01)))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(MemoryBlockStackDrop(_11$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
; [exec]
; into_memory_block$Tuple$$$(_7$place(), _7$address, _7$snapshot$1)
; [eval] _7$place()
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= _11$snapshot$0@7@01 _7$snapshot$1@95@01)))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [eval] compute_address(place, root_address)
; [eval] Size$Tuple$$$$()
(declare-const $t@254@01 $Snap)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    _26$address@74@01
    (compute_address<Address> (as _7$place<Place>  Place) _7$address@93@01))
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
    _24$address@64@01
    (compute_address<Address> (as _7$place<Place>  Place) _7$address@93@01))
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
  (compute_address<Address> (as _7$place<Place>  Place) _7$address@93@01))))
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
    _23$address@59@01
    (compute_address<Address> (as _7$place<Place>  Place) _7$address@93@01))
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
    _25$address@69@01
    (compute_address<Address> (as _7$place<Place>  Place) _7$address@93@01))
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
    (compute_address<Address> (as _4$place<Place>  Place) _4$address@83@01)
    (compute_address<Address> (as _7$place<Place>  Place) _7$address@93@01))
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
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _4$place<Place>  Place)) _4$address@83@01)
    (compute_address<Address> (as _7$place<Place>  Place) _7$address@93@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
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
; exhale acc(MemoryBlock(_7$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _7$place<Place>  Place) _7$address@93@01)
  _7$address@93@01)))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(MemoryBlockStackDrop(_7$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
; [exec]
; inhale acc(MemoryBlock(_18$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
(declare-const $t@255@01 $Snap)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _4$place<Place>  Place)) _4$address@83@01)
    _18$address@30@01)
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
    (compute_address<Address> (as _4$place<Place>  Place) _4$address@83@01)
    _18$address@30@01)
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
  (= _25$address@69@01 _18$address@30@01)
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
  (= _23$address@59@01 _18$address@30@01)
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
(assert (not (= _0$address@0@01 _18$address@30@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= _24$address@64@01 _18$address@30@01)
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
  (= _26$address@74@01 _18$address@30@01)
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
; inhale acc(MemoryBlockStackDrop(_18$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
(declare-const $t@256@01 $Snap)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= _5$address@86@01 _18$address@30@01)
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
  (= _2$address@39@01 _18$address@30@01)
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
; inhale acc(MemoryBlock(_19$address, Size$Bool$()), write)
; [eval] Size$Bool$()
(declare-const $t@257@01 $Snap)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= _18$address@30@01 _19$address@34@01)
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
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _4$place<Place>  Place)) _4$address@83@01)
    _19$address@34@01)
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
    (compute_address<Address> (as _4$place<Place>  Place) _4$address@83@01)
    _19$address@34@01)
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
(assert (not (= _25$address@69@01 _19$address@34@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= _23$address@59@01 _19$address@34@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= _0$address@0@01 _19$address@34@01)
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
(assert (not (= _24$address@64@01 _19$address@34@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= _26$address@74@01 _19$address@34@01)))
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
; inhale acc(MemoryBlockStackDrop(_19$address, Size$Bool$()), write)
; [eval] Size$Bool$()
(declare-const $t@258@01 $Snap)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= _18$address@30@01 _19$address@34@01)
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
  (= _5$address@86@01 _19$address@34@01)
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
  (= _2$address@39@01 _19$address@34@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
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
; inhale acc(MemoryBlock(_20$address, Size$Bool$()), write)
; [eval] Size$Bool$()
(declare-const $t@259@01 $Snap)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= _19$address@34@01 _20$address@44@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= _18$address@30@01 _20$address@44@01)
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
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _4$place<Place>  Place)) _4$address@83@01)
    _20$address@44@01)
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
    (compute_address<Address> (as _4$place<Place>  Place) _4$address@83@01)
    _20$address@44@01)
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
(assert (not (= _25$address@69@01 _20$address@44@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= _23$address@59@01 _20$address@44@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= _0$address@0@01 _20$address@44@01)
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
(assert (not (= _24$address@64@01 _20$address@44@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= _26$address@74@01 _20$address@44@01)))
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
; inhale acc(MemoryBlockStackDrop(_20$address, Size$Bool$()), write)
; [eval] Size$Bool$()
(declare-const $t@260@01 $Snap)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= _19$address@34@01 _20$address@44@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= _18$address@30@01 _20$address@44@01)
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
  (= _5$address@86@01 _20$address@44@01)
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
  (= _2$address@39@01 _20$address@44@01)
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
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
; inhale acc(MemoryBlock(_21$address, Size$I64$()), write)
; [eval] Size$I64$()
(declare-const $t@261@01 $Snap)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= _20$address@44@01 _21$address@49@01)
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
  (= _19$address@34@01 _21$address@49@01)
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
  (= _18$address@30@01 _21$address@49@01)
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
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _4$place<Place>  Place)) _4$address@83@01)
  _21$address@49@01)))
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
    (compute_address<Address> (as _4$place<Place>  Place) _4$address@83@01)
    _21$address@49@01)
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
  (= _25$address@69@01 _21$address@49@01)
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
  (= _23$address@59@01 _21$address@49@01)
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
  (= _0$address@0@01 _21$address@49@01)
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
  (= _24$address@64@01 _21$address@49@01)
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
  (= _26$address@74@01 _21$address@49@01)
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
; inhale acc(MemoryBlockStackDrop(_21$address, Size$I64$()), write)
; [eval] Size$I64$()
(declare-const $t@262@01 $Snap)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= _20$address@44@01 _21$address@49@01)
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
  (= _19$address@34@01 _21$address@49@01)
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
  (= _18$address@30@01 _21$address@49@01)
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
(assert (not (= _5$address@86@01 _21$address@49@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= _2$address@39@01 _21$address@49@01)))
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
; inhale acc(MemoryBlock(_22$address, Size$I64$()), write)
; [eval] Size$I64$()
(declare-const $t@263@01 $Snap)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= _21$address@49@01 _22$address@54@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= _20$address@44@01 _22$address@54@01)
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
  (= _19$address@34@01 _22$address@54@01)
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
  (= _18$address@30@01 _22$address@54@01)
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
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _4$place<Place>  Place)) _4$address@83@01)
  _22$address@54@01)))
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
    (compute_address<Address> (as _4$place<Place>  Place) _4$address@83@01)
    _22$address@54@01)
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
  (= _25$address@69@01 _22$address@54@01)
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
  (= _23$address@59@01 _22$address@54@01)
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
  (= _0$address@0@01 _22$address@54@01)
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
  (= _24$address@64@01 _22$address@54@01)
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
  (= _26$address@74@01 _22$address@54@01)
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
; inhale acc(MemoryBlockStackDrop(_22$address, Size$I64$()), write)
; [eval] Size$I64$()
(declare-const $t@264@01 $Snap)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= _21$address@49@01 _22$address@54@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= _20$address@44@01 _22$address@54@01)
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
  (= _19$address@34@01 _22$address@54@01)
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
  (= _18$address@30@01 _22$address@54@01)
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
(assert (not (= _5$address@86@01 _22$address@54@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= _2$address@39@01 _22$address@54@01)))
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
; copy_place$I64(_22$place(), _22$address, _5$place(), _5$address, _5$snapshot$0,
;   write)
; [eval] _22$place()
; [eval] _5$place()
; [eval] none < source_permission_amount
; [eval] compute_address(target_place, target_root_address)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    _26$address@74@01
    (compute_address<Address> (as _22$place<Place>  Place) _22$address@54@01))
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
    _24$address@64@01
    (compute_address<Address> (as _22$place<Place>  Place) _22$address@54@01))
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
    (compute_address<Address> (as _22$place<Place>  Place) _22$address@54@01))
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
    _23$address@59@01
    (compute_address<Address> (as _22$place<Place>  Place) _22$address@54@01))
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
    _25$address@69@01
    (compute_address<Address> (as _22$place<Place>  Place) _22$address@54@01))
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
    (compute_address<Address> (as _4$place<Place>  Place) _4$address@83@01)
    (compute_address<Address> (as _22$place<Place>  Place) _22$address@54@01))
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
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _4$place<Place>  Place)) _4$address@83@01)
  (compute_address<Address> (as _22$place<Place>  Place) _22$address@54@01))))
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
    _18$address@30@01
    (compute_address<Address> (as _22$place<Place>  Place) _22$address@54@01))
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
    _19$address@34@01
    (compute_address<Address> (as _22$place<Place>  Place) _22$address@54@01))
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
    _20$address@44@01
    (compute_address<Address> (as _22$place<Place>  Place) _22$address@54@01))
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
  _21$address@49@01
  (compute_address<Address> (as _22$place<Place>  Place) _22$address@54@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  _22$address@54@01
  (compute_address<Address> (as _22$place<Place>  Place) _22$address@54@01))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(declare-const $t@265@01 $Snap)
(assert (= $t@265@01 ($Snap.combine ($Snap.first $t@265@01) ($Snap.second $t@265@01))))
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= (as _2$place<Place>  Place) (as _5$place<Place>  Place))
  (= _2$address@39@01 _5$address@86@01)
  (= _2$snapshot$1@41@01 _5$snapshot$0@87@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= (as _1$place<Place>  Place) (as _5$place<Place>  Place))
  (= _1$address@4@01 _5$address@86@01)
  (= _1$snapshot$0@5@01 _5$snapshot$0@87@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second $t@265@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@265@01))
    ($Snap.second ($Snap.second $t@265@01)))))
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= (as _1$place<Place>  Place) (as _22$place<Place>  Place))
  (= _1$address@4@01 _22$address@54@01)
  (= _1$snapshot$0@5@01 _5$snapshot$0@87@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= (as _2$place<Place>  Place) (as _22$place<Place>  Place))
  (= _2$address@39@01 _22$address@54@01)
  (= _2$snapshot$1@41@01 _5$snapshot$0@87@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= (as _5$place<Place>  Place) (as _22$place<Place>  Place))
  (= _5$address@86@01 _22$address@54@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (= ($Snap.second ($Snap.second $t@265@01)) $Snap.unit))
; [eval] valid$Snap$I64(source_snapshot)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _22$snapshot$1 == _5$snapshot$0
(declare-const $t@266@01 $Snap)
(assert (= $t@266@01 $Snap.unit))
; [eval] _22$snapshot$1 == _5$snapshot$0
(assert (= _22$snapshot$1@56@01 _5$snapshot$0@87@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; tmp$3 := assign$Bool$BinaryOp$EqCmp$Constant$I64$Constant$I64$$$$(_23$place(),
;   _23$address, constructor$Snap$I64$(2), constructor$Snap$I64$(0))
; [eval] _23$place()
; [eval] constructor$Snap$I64$(2)
; [eval] constructor$Snap$I64$(0)
; [eval] compute_address(target_place, target_address)
; [eval] Size$Bool$()
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  _26$address@74@01
  (compute_address<Address> (as _23$place<Place>  Place) _23$address@59@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  _24$address@64@01
  (compute_address<Address> (as _23$place<Place>  Place) _23$address@59@01))))
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
    (compute_address<Address> (as _23$place<Place>  Place) _23$address@59@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  _23$address@59@01
  (compute_address<Address> (as _23$place<Place>  Place) _23$address@59@01))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [eval] valid$Snap$I64(operand1_value)
; [eval] valid$Snap$I64(operand2_value)
(set-option :timeout 0)
(push) ; 6
(assert (not (valid$Snap$I64<Bool> (constructor$Snap$I64$<Snap$I64> 0))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (valid$Snap$I64<Bool> (constructor$Snap$I64$<Snap$I64> 0)))
(declare-const result_value@267@01 Snap$Bool)
(declare-const $t@268@01 $Snap)
(assert (= $t@268@01 ($Snap.combine ($Snap.first $t@268@01) ($Snap.second $t@268@01))))
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _4$place<Place>  Place))
    (as _23$place<Place>  Place))
  (= _4$address@83@01 _23$address@59@01)
  (=
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> result_value@178@01)
    result_value@267@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second $t@268@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@268@01))
    ($Snap.second ($Snap.second $t@268@01)))))
(assert (= ($Snap.first ($Snap.second $t@268@01)) $Snap.unit))
; [eval] result_value == constructor$Snap$Bool$EqCmp_I64(operand1_value, operand2_value)
; [eval] constructor$Snap$Bool$EqCmp_I64(operand1_value, operand2_value)
(assert (=
  result_value@267@01
  (constructor$Snap$Bool$EqCmp_I64<Snap$Bool> (constructor$Snap$I64$<Snap$I64> 2) (constructor$Snap$I64$<Snap$I64> 0))))
(assert (= ($Snap.second ($Snap.second $t@268@01)) $Snap.unit))
; [eval] valid$Snap$Bool(result_value)
(assert (valid$Snap$Bool<Bool> result_value@267@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _23$snapshot$1 == tmp$3
(declare-const $t@269@01 $Snap)
(assert (= $t@269@01 $Snap.unit))
; [eval] _23$snapshot$1 == tmp$3
(assert (= _23$snapshot$1@61@01 result_value@267@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [eval] !destructor$Snap$Bool$$value(_23$snapshot$1)
; [eval] destructor$Snap$Bool$$value(_23$snapshot$1)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (destructor$Snap$Bool$$value<Bool> _23$snapshot$1@61@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (destructor$Snap$Bool$$value<Bool> _23$snapshot$1@61@01))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [then-branch: 4 | !(destructor$Snap$Bool$$value[Bool](_23$snapshot$1@61@01)) | live]
; [else-branch: 4 | destructor$Snap$Bool$$value[Bool](_23$snapshot$1@61@01) | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 4 | !(destructor$Snap$Bool$$value[Bool](_23$snapshot$1@61@01))]
(assert (not (destructor$Snap$Bool$$value<Bool> _23$snapshot$1@61@01)))
; [exec]
; label label_bb11
; [exec]
; label_bb11$marker := true
; [exec]
; inhale basic_block_marker$label_bb11$marker()
(declare-const $t@270@01 $Snap)
(assert (= $t@270@01 $Snap.unit))
; [eval] basic_block_marker$label_bb11$marker()
(assert (as basic_block_marker$label_bb11$marker<Bool>  Bool))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; tmp$4 := assign$Bool$BinaryOp$EqCmp$Constant$I64$Constant$I64$$$$(_24$place(),
;   _24$address, constructor$Snap$I64$(2), constructor$Snap$I64$(-1))
; [eval] _24$place()
; [eval] constructor$Snap$I64$(2)
; [eval] constructor$Snap$I64$(-1)
; [eval] -1
; [eval] compute_address(target_place, target_address)
; [eval] Size$Bool$()
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (=
    _21$address@49@01
    (compute_address<Address> (as _24$place<Place>  Place) _24$address@64@01))
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
(assert (not (=
  _20$address@44@01
  (compute_address<Address> (as _24$place<Place>  Place) _24$address@64@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  _19$address@34@01
  (compute_address<Address> (as _24$place<Place>  Place) _24$address@64@01))))
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
    _18$address@30@01
    (compute_address<Address> (as _24$place<Place>  Place) _24$address@64@01))
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
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _4$place<Place>  Place)) _4$address@83@01)
    (compute_address<Address> (as _24$place<Place>  Place) _24$address@64@01))
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
    (compute_address<Address> (as _4$place<Place>  Place) _4$address@83@01)
    (compute_address<Address> (as _24$place<Place>  Place) _24$address@64@01))
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
  _25$address@69@01
  (compute_address<Address> (as _24$place<Place>  Place) _24$address@64@01))))
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
    (compute_address<Address> (as _24$place<Place>  Place) _24$address@64@01))
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
  _24$address@64@01
  (compute_address<Address> (as _24$place<Place>  Place) _24$address@64@01))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [eval] valid$Snap$I64(operand1_value)
; [eval] valid$Snap$I64(operand2_value)
(set-option :timeout 0)
(push) ; 7
(assert (not (valid$Snap$I64<Bool> (constructor$Snap$I64$<Snap$I64> (- 0 1)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (valid$Snap$I64<Bool> (constructor$Snap$I64$<Snap$I64> (- 0 1))))
(declare-const result_value@271@01 Snap$Bool)
(declare-const $t@272@01 $Snap)
(assert (= $t@272@01 ($Snap.combine ($Snap.first $t@272@01) ($Snap.second $t@272@01))))
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (=
    (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _4$place<Place>  Place))
    (as _24$place<Place>  Place))
  (= _4$address@83@01 _24$address@64@01)
  (=
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> result_value@178@01)
    result_value@271@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (= (as _23$place<Place>  Place) (as _24$place<Place>  Place))
  (= _23$address@59@01 _24$address@64@01)
  (= result_value@267@01 result_value@271@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second $t@272@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@272@01))
    ($Snap.second ($Snap.second $t@272@01)))))
(assert (= ($Snap.first ($Snap.second $t@272@01)) $Snap.unit))
; [eval] result_value == constructor$Snap$Bool$EqCmp_I64(operand1_value, operand2_value)
; [eval] constructor$Snap$Bool$EqCmp_I64(operand1_value, operand2_value)
(assert (=
  result_value@271@01
  (constructor$Snap$Bool$EqCmp_I64<Snap$Bool> (constructor$Snap$I64$<Snap$I64> 2) (constructor$Snap$I64$<Snap$I64> (- 0 1)))))
(assert (= ($Snap.second ($Snap.second $t@272@01)) $Snap.unit))
; [eval] valid$Snap$Bool(result_value)
(assert (valid$Snap$Bool<Bool> result_value@271@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _24$snapshot$1 == tmp$4
(declare-const $t@273@01 $Snap)
(assert (= $t@273@01 $Snap.unit))
; [eval] _24$snapshot$1 == tmp$4
(assert (= _24$snapshot$1@66@01 result_value@271@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; tmp$5 := assign$Bool$BinaryOp$EqCmp$Copy$I64$Constant$I64$$$$(_25$place(), _25$address,
;   _22$place(), _22$address, _22$snapshot$1, constructor$Snap$I64$(-9223372036854775808))
; [eval] _25$place()
; [eval] _22$place()
; [eval] constructor$Snap$I64$(-9223372036854775808)
; [eval] -9223372036854775808
; [eval] compute_address(target_place, target_address)
; [eval] Size$Bool$()
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  _26$address@74@01
  (compute_address<Address> (as _25$place<Place>  Place) _25$address@69@01))))
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
    (compute_address<Address> (as _25$place<Place>  Place) _25$address@69@01))
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
  _25$address@69@01
  (compute_address<Address> (as _25$place<Place>  Place) _25$address@69@01))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= _5$snapshot$0@87@01 _22$snapshot$1@56@01)))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [eval] valid$Snap$I64(operand1_value)
(set-option :timeout 0)
(push) ; 7
(assert (not (valid$Snap$I64<Bool> _22$snapshot$1@56@01)))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (valid$Snap$I64<Bool> _22$snapshot$1@56@01))
; [eval] valid$Snap$I64(operand2_value)
(push) ; 7
(assert (not (valid$Snap$I64<Bool> (constructor$Snap$I64$<Snap$I64> (- 0 9223372036854775808)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (valid$Snap$I64<Bool> (constructor$Snap$I64$<Snap$I64> (- 0 9223372036854775808))))
(declare-const result_value@274@01 Snap$Bool)
(declare-const $t@275@01 $Snap)
(assert (= $t@275@01 ($Snap.combine ($Snap.first $t@275@01) ($Snap.second $t@275@01))))
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (= (as _23$place<Place>  Place) (as _25$place<Place>  Place))
  (= _23$address@59@01 _25$address@69@01)
  (= result_value@267@01 result_value@274@01))))
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
    (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _4$place<Place>  Place))
    (as _25$place<Place>  Place))
  (= _4$address@83@01 _25$address@69@01)
  (=
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> result_value@178@01)
    result_value@274@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (= (as _24$place<Place>  Place) (as _25$place<Place>  Place))
  (= _24$address@64@01 _25$address@69@01)
  (= result_value@271@01 result_value@274@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second $t@275@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@275@01))
    ($Snap.second ($Snap.second $t@275@01)))))
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (= (as _1$place<Place>  Place) (as _22$place<Place>  Place))
  (= _1$address@4@01 _22$address@54@01)
  (= _1$snapshot$0@5@01 _22$snapshot$1@56@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (= (as _2$place<Place>  Place) (as _22$place<Place>  Place))
  (= _2$address@39@01 _22$address@54@01)
  (= _2$snapshot$1@41@01 _22$snapshot$1@56@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (= (as _5$place<Place>  Place) (as _22$place<Place>  Place))
  (= _5$address@86@01 _22$address@54@01)
  (= _5$snapshot$0@87@01 _22$snapshot$1@56@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second $t@275@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@275@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@275@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@275@01))) $Snap.unit))
; [eval] result_value == constructor$Snap$Bool$EqCmp_I64(operand1_value, operand2_value)
; [eval] constructor$Snap$Bool$EqCmp_I64(operand1_value, operand2_value)
(assert (=
  result_value@274@01
  (constructor$Snap$Bool$EqCmp_I64<Snap$Bool> _22$snapshot$1@56@01 (constructor$Snap$I64$<Snap$I64> (- 0 9223372036854775808)))))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@275@01))) $Snap.unit))
; [eval] valid$Snap$Bool(result_value)
(assert (valid$Snap$Bool<Bool> result_value@274@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _25$snapshot$1 == tmp$5
(declare-const $t@276@01 $Snap)
(assert (= $t@276@01 $Snap.unit))
; [eval] _25$snapshot$1 == tmp$5
(assert (= _25$snapshot$1@71@01 result_value@274@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; tmp$6 := assign$Bool$BinaryOp$And$Move$Bool$Move$Bool$$$$(_26$place(), _26$address,
;   _24$place(), _24$address, _24$snapshot$1, _25$place(), _25$address, _25$snapshot$1)
; [eval] _26$place()
; [eval] _24$place()
; [eval] _25$place()
; [eval] compute_address(target_place, target_address)
; [eval] Size$Bool$()
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  _26$address@74@01
  (compute_address<Address> (as _26$place<Place>  Place) _26$address@74@01))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= result_value@271@01 _24$snapshot$1@66@01)))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [eval] valid$Snap$Bool(operand1_value)
(set-option :timeout 0)
(push) ; 7
(assert (not (valid$Snap$Bool<Bool> _24$snapshot$1@66@01)))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (valid$Snap$Bool<Bool> _24$snapshot$1@66@01))
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (=
    (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _4$place<Place>  Place))
    (as _25$place<Place>  Place))
  (= _4$address@83@01 _25$address@69@01)
  (=
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> result_value@178@01)
    _25$snapshot$1@71@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (= (as _23$place<Place>  Place) (as _25$place<Place>  Place))
  (= _23$address@59@01 _25$address@69@01)
  (= result_value@267@01 _25$snapshot$1@71@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= result_value@274@01 _25$snapshot$1@71@01)))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [eval] valid$Snap$Bool(operand2_value)
(set-option :timeout 0)
(push) ; 7
(assert (not (valid$Snap$Bool<Bool> _25$snapshot$1@71@01)))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (valid$Snap$Bool<Bool> _25$snapshot$1@71@01))
(declare-const result_value@277@01 Snap$Bool)
(declare-const $t@278@01 $Snap)
(assert (= $t@278@01 ($Snap.combine ($Snap.first $t@278@01) ($Snap.second $t@278@01))))
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (= (as _23$place<Place>  Place) (as _26$place<Place>  Place))
  (= _23$address@59@01 _26$address@74@01)
  (= result_value@267@01 result_value@277@01))))
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
    (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _4$place<Place>  Place))
    (as _26$place<Place>  Place))
  (= _4$address@83@01 _26$address@74@01)
  (=
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> result_value@178@01)
    result_value@277@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second $t@278@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@278@01))
    ($Snap.second ($Snap.second $t@278@01)))))
; [eval] compute_address(operand1_place, operand1_root_address)
; [eval] Size$Bool$()
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (=
    _0$address@0@01
    (compute_address<Address> (as _24$place<Place>  Place) _24$address@64@01))
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
    (compute_address<Address> (as _4$place<Place>  Place) _4$address@83@01)
    (compute_address<Address> (as _24$place<Place>  Place) _24$address@64@01))
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
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _4$place<Place>  Place)) _4$address@83@01)
    (compute_address<Address> (as _24$place<Place>  Place) _24$address@64@01))
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
    _18$address@30@01
    (compute_address<Address> (as _24$place<Place>  Place) _24$address@64@01))
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
  _19$address@34@01
  (compute_address<Address> (as _24$place<Place>  Place) _24$address@64@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  _20$address@44@01
  (compute_address<Address> (as _24$place<Place>  Place) _24$address@64@01))))
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
    _21$address@49@01
    (compute_address<Address> (as _24$place<Place>  Place) _24$address@64@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second $t@278@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@278@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@278@01))))))
; [eval] compute_address(operand2_place, operand2_root_address)
; [eval] Size$Bool$()
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (=
    _21$address@49@01
    (compute_address<Address> (as _25$place<Place>  Place) _25$address@69@01))
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
(assert (not (=
  _20$address@44@01
  (compute_address<Address> (as _25$place<Place>  Place) _25$address@69@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  _19$address@34@01
  (compute_address<Address> (as _25$place<Place>  Place) _25$address@69@01))))
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
    _18$address@30@01
    (compute_address<Address> (as _25$place<Place>  Place) _25$address@69@01))
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
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _4$place<Place>  Place)) _4$address@83@01)
    (compute_address<Address> (as _25$place<Place>  Place) _25$address@69@01))
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
    (compute_address<Address> (as _4$place<Place>  Place) _4$address@83@01)
    (compute_address<Address> (as _25$place<Place>  Place) _25$address@69@01))
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
    _0$address@0@01
    (compute_address<Address> (as _25$place<Place>  Place) _25$address@69@01))
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
  (compute_address<Address> (as _24$place<Place>  Place) _24$address@64@01)
  (compute_address<Address> (as _25$place<Place>  Place) _25$address@69@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@278@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@278@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@278@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@278@01))))
  $Snap.unit))
; [eval] result_value == constructor$Snap$Bool$And_Bool(operand1_value, operand2_value)
; [eval] constructor$Snap$Bool$And_Bool(operand1_value, operand2_value)
(assert (=
  result_value@277@01
  (constructor$Snap$Bool$And_Bool<Snap$Bool> _24$snapshot$1@66@01 _25$snapshot$1@71@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@278@01))))
  $Snap.unit))
; [eval] valid$Snap$Bool(result_value)
(assert (valid$Snap$Bool<Bool> result_value@277@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _26$snapshot$1 == tmp$6
(declare-const $t@279@01 $Snap)
(assert (= $t@279@01 $Snap.unit))
; [eval] _26$snapshot$1 == tmp$6
(assert (= _26$snapshot$1@76@01 result_value@277@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [eval] !destructor$Snap$Bool$$value(_26$snapshot$1)
; [eval] destructor$Snap$Bool$$value(_26$snapshot$1)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (destructor$Snap$Bool$$value<Bool> _26$snapshot$1@76@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (destructor$Snap$Bool$$value<Bool> _26$snapshot$1@76@01))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [then-branch: 5 | !(destructor$Snap$Bool$$value[Bool](_26$snapshot$1@76@01)) | live]
; [else-branch: 5 | destructor$Snap$Bool$$value[Bool](_26$snapshot$1@76@01) | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 5 | !(destructor$Snap$Bool$$value[Bool](_26$snapshot$1@76@01))]
(assert (not (destructor$Snap$Bool$$value<Bool> _26$snapshot$1@76@01)))
; [exec]
; label label_bb12
; [exec]
; label_bb12$marker := true
; [exec]
; inhale basic_block_marker$label_bb12$marker()
(declare-const $t@280@01 $Snap)
(assert (= $t@280@01 $Snap.unit))
; [eval] basic_block_marker$label_bb12$marker()
(assert (as basic_block_marker$label_bb12$marker<Bool>  Bool))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; tmp$7 := assign$I64$BinaryOp$Mod$Move$I64$Constant$I64$$$$(_21$place(), _21$address,
;   _22$place(), _22$address, _22$snapshot$1, constructor$Snap$I64$(2))
; [eval] _21$place()
; [eval] _22$place()
; [eval] constructor$Snap$I64$(2)
; [eval] compute_address(target_place, target_address)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _25$place<Place>  Place) _25$address@69@01)
    (compute_address<Address> (as _21$place<Place>  Place) _21$address@49@01))
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
  _21$address@49@01
  (compute_address<Address> (as _21$place<Place>  Place) _21$address@49@01))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [eval] valid$Snap$I64(operand1_value)
; [eval] valid$Snap$I64(operand2_value)
(declare-const result_value@281@01 Snap$I64)
(declare-const $t@282@01 $Snap)
(assert (= $t@282@01 ($Snap.combine ($Snap.first $t@282@01) ($Snap.second $t@282@01))))
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (= (as _1$place<Place>  Place) (as _21$place<Place>  Place))
  (= _1$address@4@01 _21$address@49@01)
  (= _1$snapshot$0@5@01 result_value@281@01))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (= (as _2$place<Place>  Place) (as _21$place<Place>  Place))
  (= _2$address@39@01 _21$address@49@01)
  (= _2$snapshot$1@41@01 result_value@281@01))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (= (as _5$place<Place>  Place) (as _21$place<Place>  Place))
  (= _5$address@86@01 _21$address@49@01)
  (= _5$snapshot$0@87@01 result_value@281@01))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second $t@282@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@282@01))
    ($Snap.second ($Snap.second $t@282@01)))))
; [eval] compute_address(operand1_place, operand1_root_address)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _25$place<Place>  Place) _25$address@69@01)
    (compute_address<Address> (as _22$place<Place>  Place) _22$address@54@01))
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
    _20$address@44@01
    (compute_address<Address> (as _22$place<Place>  Place) _22$address@54@01))
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
    _19$address@34@01
    (compute_address<Address> (as _22$place<Place>  Place) _22$address@54@01))
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
    _18$address@30@01
    (compute_address<Address> (as _22$place<Place>  Place) _22$address@54@01))
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
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _4$place<Place>  Place)) _4$address@83@01)
  (compute_address<Address> (as _22$place<Place>  Place) _22$address@54@01))))
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
    (compute_address<Address> (as _4$place<Place>  Place) _4$address@83@01)
    (compute_address<Address> (as _22$place<Place>  Place) _22$address@54@01))
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
    (compute_address<Address> (as _22$place<Place>  Place) _22$address@54@01))
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
    (compute_address<Address> (as _24$place<Place>  Place) _24$address@64@01)
    (compute_address<Address> (as _22$place<Place>  Place) _22$address@54@01))
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second $t@282@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@282@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@282@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@282@01))) $Snap.unit))
; [eval] result_value == constructor$Snap$I64$Mod_I64(operand1_value, operand2_value)
; [eval] constructor$Snap$I64$Mod_I64(operand1_value, operand2_value)
(assert (=
  result_value@281@01
  (constructor$Snap$I64$Mod_I64<Snap$I64> _22$snapshot$1@56@01 (constructor$Snap$I64$<Snap$I64> 2))))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@282@01))) $Snap.unit))
; [eval] valid$Snap$I64(result_value)
(assert (valid$Snap$I64<Bool> result_value@281@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _21$snapshot$1 == tmp$7
(declare-const $t@283@01 $Snap)
(assert (= $t@283@01 $Snap.unit))
; [eval] _21$snapshot$1 == tmp$7
(assert (= _21$snapshot$1@51@01 result_value@281@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; exhale acc(MemoryBlock(_22$address, Size$I64$()), write)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _22$place<Place>  Place) _22$address@54@01)
  _22$address@54@01)))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(MemoryBlockStackDrop(_22$address, Size$I64$()), write)
; [eval] Size$I64$()
; [exec]
; tmp$8 := assign$Bool$BinaryOp$EqCmp$Move$I64$Constant$I64$$$$(_20$place(), _20$address,
;   _21$place(), _21$address, _21$snapshot$1, constructor$Snap$I64$(0))
; [eval] _20$place()
; [eval] _21$place()
; [eval] constructor$Snap$I64$(0)
; [eval] compute_address(target_place, target_address)
; [eval] Size$Bool$()
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _25$place<Place>  Place) _25$address@69@01)
  (compute_address<Address> (as _20$place<Place>  Place) _20$address@44@01))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  _20$address@44@01
  (compute_address<Address> (as _20$place<Place>  Place) _20$address@44@01))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (= (as _5$place<Place>  Place) (as _21$place<Place>  Place))
  (= _5$address@86@01 _21$address@49@01)
  (= _5$snapshot$0@87@01 _21$snapshot$1@51@01))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (= (as _2$place<Place>  Place) (as _21$place<Place>  Place))
  (= _2$address@39@01 _21$address@49@01)
  (= _2$snapshot$1@41@01 _21$snapshot$1@51@01))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (= (as _1$place<Place>  Place) (as _21$place<Place>  Place))
  (= _1$address@4@01 _21$address@49@01)
  (= _1$snapshot$0@5@01 _21$snapshot$1@51@01))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= result_value@281@01 _21$snapshot$1@51@01)))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [eval] valid$Snap$I64(operand1_value)
(set-option :timeout 0)
(push) ; 8
(assert (not (valid$Snap$I64<Bool> _21$snapshot$1@51@01)))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (valid$Snap$I64<Bool> _21$snapshot$1@51@01))
; [eval] valid$Snap$I64(operand2_value)
(declare-const result_value@284@01 Snap$Bool)
(declare-const $t@285@01 $Snap)
(assert (= $t@285@01 ($Snap.combine ($Snap.first $t@285@01) ($Snap.second $t@285@01))))
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _4$place<Place>  Place))
    (as _20$place<Place>  Place))
  (= _4$address@83@01 _20$address@44@01)
  (=
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> result_value@178@01)
    result_value@284@01))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (= (as _23$place<Place>  Place) (as _20$place<Place>  Place))
  (= _23$address@59@01 _20$address@44@01)
  (= result_value@267@01 result_value@284@01))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (= (as _26$place<Place>  Place) (as _20$place<Place>  Place))
  (= _26$address@74@01 _20$address@44@01)
  (= result_value@277@01 result_value@284@01))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second $t@285@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@285@01))
    ($Snap.second ($Snap.second $t@285@01)))))
; [eval] compute_address(operand1_place, operand1_root_address)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _25$place<Place>  Place) _25$address@69@01)
    (compute_address<Address> (as _21$place<Place>  Place) _21$address@49@01))
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
    _19$address@34@01
    (compute_address<Address> (as _21$place<Place>  Place) _21$address@49@01))
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
    _18$address@30@01
    (compute_address<Address> (as _21$place<Place>  Place) _21$address@49@01))
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
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _4$place<Place>  Place)) _4$address@83@01)
  (compute_address<Address> (as _21$place<Place>  Place) _21$address@49@01))))
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
    (compute_address<Address> (as _4$place<Place>  Place) _4$address@83@01)
    (compute_address<Address> (as _21$place<Place>  Place) _21$address@49@01))
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
    (compute_address<Address> (as _21$place<Place>  Place) _21$address@49@01))
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
    (compute_address<Address> (as _24$place<Place>  Place) _24$address@64@01)
    (compute_address<Address> (as _21$place<Place>  Place) _21$address@49@01))
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second $t@285@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@285@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@285@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@285@01))) $Snap.unit))
; [eval] result_value == constructor$Snap$Bool$EqCmp_I64(operand1_value, operand2_value)
; [eval] constructor$Snap$Bool$EqCmp_I64(operand1_value, operand2_value)
(assert (=
  result_value@284@01
  (constructor$Snap$Bool$EqCmp_I64<Snap$Bool> _21$snapshot$1@51@01 (constructor$Snap$I64$<Snap$I64> 0))))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@285@01))) $Snap.unit))
; [eval] valid$Snap$Bool(result_value)
(assert (valid$Snap$Bool<Bool> result_value@284@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _20$snapshot$1 == tmp$8
(declare-const $t@286@01 $Snap)
(assert (= $t@286@01 $Snap.unit))
; [eval] _20$snapshot$1 == tmp$8
(assert (= _20$snapshot$1@46@01 result_value@284@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; exhale acc(MemoryBlock(_21$address, Size$I64$()), write)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _21$place<Place>  Place) _21$address@49@01)
  _21$address@49@01)))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(MemoryBlockStackDrop(_21$address, Size$I64$()), write)
; [eval] Size$I64$()
; [exec]
; tmp$9 := assign$Bool$UnaryOp$Not$Move$Bool$$$$(_19$place(), _19$address, _20$place(),
;   _20$address, _20$snapshot$1)
; [eval] _19$place()
; [eval] _20$place()
; [eval] compute_address(target_place, target_address)
; [eval] Size$Bool$()
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _25$place<Place>  Place) _25$address@69@01)
  (compute_address<Address> (as _19$place<Place>  Place) _19$address@34@01))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  _19$address@34@01
  (compute_address<Address> (as _19$place<Place>  Place) _19$address@34@01))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (= (as _26$place<Place>  Place) (as _20$place<Place>  Place))
  (= _26$address@74@01 _20$address@44@01)
  (= result_value@277@01 _20$snapshot$1@46@01))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (= (as _23$place<Place>  Place) (as _20$place<Place>  Place))
  (= _23$address@59@01 _20$address@44@01)
  (= result_value@267@01 _20$snapshot$1@46@01))))
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
    (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _4$place<Place>  Place))
    (as _20$place<Place>  Place))
  (= _4$address@83@01 _20$address@44@01)
  (=
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> result_value@178@01)
    _20$snapshot$1@46@01))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= result_value@284@01 _20$snapshot$1@46@01)))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [eval] valid$Snap$Bool(operand1_value)
(set-option :timeout 0)
(push) ; 8
(assert (not (valid$Snap$Bool<Bool> _20$snapshot$1@46@01)))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (valid$Snap$Bool<Bool> _20$snapshot$1@46@01))
(declare-const result_value@287@01 Snap$Bool)
(declare-const $t@288@01 $Snap)
(assert (= $t@288@01 ($Snap.combine ($Snap.first $t@288@01) ($Snap.second $t@288@01))))
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _4$place<Place>  Place))
    (as _19$place<Place>  Place))
  (= _4$address@83@01 _19$address@34@01)
  (=
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> result_value@178@01)
    result_value@287@01))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (= (as _23$place<Place>  Place) (as _19$place<Place>  Place))
  (= _23$address@59@01 _19$address@34@01)
  (= result_value@267@01 result_value@287@01))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (= (as _26$place<Place>  Place) (as _19$place<Place>  Place))
  (= _26$address@74@01 _19$address@34@01)
  (= result_value@277@01 result_value@287@01))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second $t@288@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@288@01))
    ($Snap.second ($Snap.second $t@288@01)))))
; [eval] compute_address(operand1_place, operand1_root_address)
; [eval] Size$Bool$()
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _25$place<Place>  Place) _25$address@69@01)
  (compute_address<Address> (as _20$place<Place>  Place) _20$address@44@01))))
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
    _18$address@30@01
    (compute_address<Address> (as _20$place<Place>  Place) _20$address@44@01))
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
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _4$place<Place>  Place)) _4$address@83@01)
    (compute_address<Address> (as _20$place<Place>  Place) _20$address@44@01))
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
    (compute_address<Address> (as _4$place<Place>  Place) _4$address@83@01)
    (compute_address<Address> (as _20$place<Place>  Place) _20$address@44@01))
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
    (compute_address<Address> (as _20$place<Place>  Place) _20$address@44@01))
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
  (compute_address<Address> (as _24$place<Place>  Place) _24$address@64@01)
  (compute_address<Address> (as _20$place<Place>  Place) _20$address@44@01))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second $t@288@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@288@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@288@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@288@01))) $Snap.unit))
; [eval] result_value == constructor$Snap$Bool$Not_Bool(operand1_value)
; [eval] constructor$Snap$Bool$Not_Bool(operand1_value)
(assert (=
  result_value@287@01
  (constructor$Snap$Bool$Not_Bool<Snap$Bool> _20$snapshot$1@46@01)))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@288@01))) $Snap.unit))
; [eval] valid$Snap$Bool(result_value)
(assert (valid$Snap$Bool<Bool> result_value@287@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _19$snapshot$1 == tmp$9
(declare-const $t@289@01 $Snap)
(assert (= $t@289@01 $Snap.unit))
; [eval] _19$snapshot$1 == tmp$9
(assert (= _19$snapshot$1@36@01 result_value@287@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; exhale acc(MemoryBlock(_20$address, Size$Bool$()), write)
; [eval] Size$Bool$()
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _20$place<Place>  Place) _20$address@44@01)
  _20$address@44@01)))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(MemoryBlockStackDrop(_20$address, Size$Bool$()), write)
; [eval] Size$Bool$()
; [eval] !destructor$Snap$Bool$$value(_19$snapshot$1)
; [eval] destructor$Snap$Bool$$value(_19$snapshot$1)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (destructor$Snap$Bool$$value<Bool> _19$snapshot$1@36@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (not (destructor$Snap$Bool$$value<Bool> _19$snapshot$1@36@01))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [then-branch: 6 | !(destructor$Snap$Bool$$value[Bool](_19$snapshot$1@36@01)) | live]
; [else-branch: 6 | destructor$Snap$Bool$$value[Bool](_19$snapshot$1@36@01) | live]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 6 | !(destructor$Snap$Bool$$value[Bool](_19$snapshot$1@36@01))]
(assert (not (destructor$Snap$Bool$$value<Bool> _19$snapshot$1@36@01)))
; [exec]
; label label_7_custom
; [exec]
; label_7_custom$marker := true
; [exec]
; inhale basic_block_marker$label_7_custom$marker()
(declare-const $t@290@01 $Snap)
(assert (= $t@290@01 $Snap.unit))
; [eval] basic_block_marker$label_7_custom$marker()
(assert (as basic_block_marker$label_7_custom$marker<Bool>  Bool))
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
(declare-const $t@291@01 $Snap)
(assert (= $t@291@01 $Snap.unit))
; [eval] basic_block_marker$label_bb14$marker()
(assert (as basic_block_marker$label_bb14$marker<Bool>  Bool))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; write_place_constant$Tuple$$$(_18$place(), _18$address, constructor$Snap$Tuple$$$$())
; [eval] _18$place()
; [eval] constructor$Snap$Tuple$$$$()
; [eval] compute_address(target_place, target_root_address)
; [eval] Size$Tuple$$$$()
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _25$place<Place>  Place) _25$address@69@01)
    (compute_address<Address> (as _18$place<Place>  Place) _18$address@30@01))
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
  _18$address@30@01
  (compute_address<Address> (as _18$place<Place>  Place) _18$address@30@01))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [eval] valid$Snap$Tuple$$$(source_snapshot)
(declare-const $t@292@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _18$snapshot$1 == constructor$Snap$Tuple$$$$()
(declare-const $t@293@01 $Snap)
(assert (= $t@293@01 $Snap.unit))
; [eval] _18$snapshot$1 == constructor$Snap$Tuple$$$$()
; [eval] constructor$Snap$Tuple$$$$()
(assert (=
  _18$snapshot$1@32@01
  (as constructor$Snap$Tuple$$$$<Snap$Tuple$$$>  Snap$Tuple$$$)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; into_memory_block$Bool(_19$place(), _19$address, _19$snapshot$1)
; [eval] _19$place()
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= result_value@287@01 _19$snapshot$1@36@01)))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [eval] compute_address(place, root_address)
; [eval] Size$Bool$()
(declare-const $t@294@01 $Snap)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _25$place<Place>  Place) _25$address@69@01)
  (compute_address<Address> (as _19$place<Place>  Place) _19$address@34@01))))
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
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _4$place<Place>  Place)) _4$address@83@01)
    (compute_address<Address> (as _19$place<Place>  Place) _19$address@34@01))
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
    (compute_address<Address> (as _4$place<Place>  Place) _4$address@83@01)
    (compute_address<Address> (as _19$place<Place>  Place) _19$address@34@01))
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
    (compute_address<Address> (as _19$place<Place>  Place) _19$address@34@01))
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
  (compute_address<Address> (as _24$place<Place>  Place) _24$address@64@01)
  (compute_address<Address> (as _19$place<Place>  Place) _19$address@34@01))))
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
; exhale acc(MemoryBlock(_19$address, Size$Bool$()), write)
; [eval] Size$Bool$()
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _19$place<Place>  Place) _19$address@34@01)
  _19$address@34@01)))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(MemoryBlockStackDrop(_19$address, Size$Bool$()), write)
; [eval] Size$Bool$()
; [exec]
; into_memory_block$Tuple$$$(_18$place(), _18$address, _18$snapshot$1)
; [eval] _18$place()
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  (as constructor$Snap$Tuple$$$$<Snap$Tuple$$$>  Snap$Tuple$$$)
  _18$snapshot$1@32@01)))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [eval] compute_address(place, root_address)
; [eval] Size$Tuple$$$$()
(declare-const $t@295@01 $Snap)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _24$place<Place>  Place) _24$address@64@01)
    (compute_address<Address> (as _18$place<Place>  Place) _18$address@30@01))
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
  (compute_address<Address> (as _18$place<Place>  Place) _18$address@30@01))))
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
    (compute_address<Address> (as _4$place<Place>  Place) _4$address@83@01)
    (compute_address<Address> (as _18$place<Place>  Place) _18$address@30@01))
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
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _4$place<Place>  Place)) _4$address@83@01)
    (compute_address<Address> (as _18$place<Place>  Place) _18$address@30@01))
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
    (compute_address<Address> (as _25$place<Place>  Place) _25$address@69@01)
    (compute_address<Address> (as _18$place<Place>  Place) _18$address@30@01))
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
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
; exhale acc(MemoryBlock(_18$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _18$place<Place>  Place) _18$address@30@01)
  _18$address@30@01)))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(MemoryBlockStackDrop(_18$address, Size$Tuple$$$$()), write)
; [eval] Size$Tuple$$$$()
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
    (compute_address<Address> (as _24$place<Place>  Place) _24$address@64@01)
    (compute_address<Address> (as _0$place<Place>  Place) _0$address@0@01))
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
  (compute_address<Address> (as _0$place<Place>  Place) _0$address@0@01))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [eval] valid$Snap$Tuple$$$(source_snapshot)
(declare-const $t@296@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _0$snapshot$1 == constructor$Snap$Tuple$$$$()
(declare-const $t@297@01 $Snap)
(assert (= $t@297@01 $Snap.unit))
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
; into_memory_block$I64(_5$place(), _5$address, _5$snapshot$0)
; [eval] _5$place()
; [eval] compute_address(place, root_address)
; [eval] Size$I64$()
(declare-const $t@298@01 $Snap)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _24$place<Place>  Place) _24$address@64@01)
    (compute_address<Address> (as _5$place<Place>  Place) _5$address@86@01))
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
    (compute_address<Address> (as _4$place<Place>  Place) _4$address@83@01)
    (compute_address<Address> (as _5$place<Place>  Place) _5$address@86@01))
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
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _4$place<Place>  Place)) _4$address@83@01)
  (compute_address<Address> (as _5$place<Place>  Place) _5$address@86@01))))
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
    (compute_address<Address> (as _25$place<Place>  Place) _25$address@69@01)
    (compute_address<Address> (as _5$place<Place>  Place) _5$address@86@01))
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
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
; exhale acc(MemoryBlock(_5$address, Size$I64$()), write)
; [eval] Size$I64$()
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
; exhale acc(MemoryBlockStackDrop(_5$address, Size$I64$()), write)
; [eval] Size$I64$()
; [exec]
; into_memory_block$I64(_2$place(), _2$address, _2$snapshot$1)
; [eval] _2$place()
; [eval] compute_address(place, root_address)
; [eval] Size$I64$()
(declare-const $t@299@01 $Snap)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _25$place<Place>  Place) _25$address@69@01)
    (compute_address<Address> (as _2$place<Place>  Place) _2$address@39@01))
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
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _4$place<Place>  Place)) _4$address@83@01)
  (compute_address<Address> (as _2$place<Place>  Place) _2$address@39@01))))
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
    (compute_address<Address> (as _4$place<Place>  Place) _4$address@83@01)
    (compute_address<Address> (as _2$place<Place>  Place) _2$address@39@01))
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
    (compute_address<Address> (as _24$place<Place>  Place) _24$address@64@01)
    (compute_address<Address> (as _2$place<Place>  Place) _2$address@39@01))
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
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
; exhale acc(MemoryBlock(_2$address, Size$I64$()), write)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _2$place<Place>  Place) _2$address@39@01)
  _2$address@39@01)))
(check-sat)
; unsat
(pop) ; 9
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
(declare-const $t@300@01 $Snap)
(assert (= $t@300@01 $Snap.unit))
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
(declare-const $t@301@01 $Snap)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _24$place<Place>  Place) _24$address@64@01)
    (compute_address<Address> (as _1$place<Place>  Place) _1$address@4@01))
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
    (compute_address<Address> (as _4$place<Place>  Place) _4$address@83@01)
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
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _4$place<Place>  Place)) _4$address@83@01)
  (compute_address<Address> (as _1$place<Place>  Place) _1$address@4@01))))
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
    (compute_address<Address> (as _25$place<Place>  Place) _25$address@69@01)
    (compute_address<Address> (as _1$place<Place>  Place) _1$address@4@01))
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
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
; lft_tok_sep_return$2(lft_1$snapshot$1, bw0$snapshot$0, bw1$snapshot$0, lifetime_token_perm_amount$0$snapshot$0 /
;   7)
; [eval] lifetime_token_perm_amount$0$snapshot$0 / 7
; [eval] none < rd_perm
(push) ; 9
(assert (not (or
  (= (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)) $Perm.No)
  (< $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))))))
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
      (+
        (-
          (-
            (+
              (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))
              (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)))
            ($Perm.min
              (+
                (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))
                (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)))
              (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 14))))
          ($Perm.min
            (-
              (+
                (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))
                (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)))
              ($Perm.min
                (+
                  (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))
                  (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)))
                (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 14))))
            (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 14))))
        (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)))
      (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)))
    ($Perm.min
      (+
        (+
          (-
            (-
              (+
                (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))
                (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)))
              ($Perm.min
                (+
                  (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))
                  (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)))
                (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 14))))
            ($Perm.min
              (-
                (+
                  (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))
                  (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)))
                ($Perm.min
                  (+
                    (/
                      lifetime_token_perm_amount$0$snapshot$0@142@01
                      (to_real 7))
                    (/
                      lifetime_token_perm_amount$0$snapshot$0@142@01
                      (to_real 7)))
                  (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 14))))
              (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 14))))
          (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)))
        (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)))
      (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (<=
  $Perm.No
  (-
    (+
      (+
        (-
          (-
            (+
              (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))
              (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)))
            ($Perm.min
              (+
                (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))
                (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)))
              (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 14))))
          ($Perm.min
            (-
              (+
                (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))
                (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)))
              ($Perm.min
                (+
                  (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))
                  (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)))
                (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 14))))
            (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 14))))
        (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)))
      (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)))
    ($Perm.min
      (+
        (+
          (-
            (-
              (+
                (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))
                (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)))
              ($Perm.min
                (+
                  (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))
                  (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)))
                (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 14))))
            ($Perm.min
              (-
                (+
                  (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))
                  (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)))
                ($Perm.min
                  (+
                    (/
                      lifetime_token_perm_amount$0$snapshot$0@142@01
                      (to_real 7))
                    (/
                      lifetime_token_perm_amount$0$snapshot$0@142@01
                      (to_real 7)))
                  (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 14))))
              (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 14))))
          (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)))
        (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)))
      (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))))))
(set-option :timeout 0)
(push) ; 9
(assert (not (or
  (=
    (-
      (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))
      ($Perm.min
        (+
          (+
            (-
              (-
                (+
                  (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))
                  (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)))
                ($Perm.min
                  (+
                    (/
                      lifetime_token_perm_amount$0$snapshot$0@142@01
                      (to_real 7))
                    (/
                      lifetime_token_perm_amount$0$snapshot$0@142@01
                      (to_real 7)))
                  (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 14))))
              ($Perm.min
                (-
                  (+
                    (/
                      lifetime_token_perm_amount$0$snapshot$0@142@01
                      (to_real 7))
                    (/
                      lifetime_token_perm_amount$0$snapshot$0@142@01
                      (to_real 7)))
                  ($Perm.min
                    (+
                      (/
                        lifetime_token_perm_amount$0$snapshot$0@142@01
                        (to_real 7))
                      (/
                        lifetime_token_perm_amount$0$snapshot$0@142@01
                        (to_real 7)))
                    (/
                      lifetime_token_perm_amount$0$snapshot$0@142@01
                      (to_real 14))))
                (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 14))))
            (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)))
          (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)))
        (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))))
    $Perm.No)
  (<
    (-
      (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))
      ($Perm.min
        (+
          (+
            (-
              (-
                (+
                  (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))
                  (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)))
                ($Perm.min
                  (+
                    (/
                      lifetime_token_perm_amount$0$snapshot$0@142@01
                      (to_real 7))
                    (/
                      lifetime_token_perm_amount$0$snapshot$0@142@01
                      (to_real 7)))
                  (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 14))))
              ($Perm.min
                (-
                  (+
                    (/
                      lifetime_token_perm_amount$0$snapshot$0@142@01
                      (to_real 7))
                    (/
                      lifetime_token_perm_amount$0$snapshot$0@142@01
                      (to_real 7)))
                  ($Perm.min
                    (+
                      (/
                        lifetime_token_perm_amount$0$snapshot$0@142@01
                        (to_real 7))
                      (/
                        lifetime_token_perm_amount$0$snapshot$0@142@01
                        (to_real 7)))
                    (/
                      lifetime_token_perm_amount$0$snapshot$0@142@01
                      (to_real 14))))
                (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 14))))
            (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)))
          (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)))
        (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(push) ; 9
(set-option :timeout 10)
(assert (not (< $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [eval] lft == intersect(Set(lft_1, lft_2))
; [eval] intersect(Set(lft_1, lft_2))
; [eval] Set(lft_1, lft_2)
(declare-const $t@302@01 $Snap)
(assert (= $t@302@01 ($Snap.combine ($Snap.first $t@302@01) ($Snap.second $t@302@01))))
(set-option :timeout 0)
(push) ; 9
(assert (not (or
  (= (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)) $Perm.No)
  (< $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(declare-const $t@303@01 $Snap)
(assert (and
  (=>
    (<
      $Perm.No
      (-
        lifetime_token_perm_amount$0$snapshot$0@142@01
        ($Perm.min
          lifetime_token_perm_amount$0$snapshot$0@142@01
          (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)))))
    (= $t@303@01 $t@159@01))
  (=>
    (< $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)))
    (= $t@303@01 ($Snap.first $t@302@01)))))
(assert (<=
  $Perm.No
  (+
    (-
      lifetime_token_perm_amount$0$snapshot$0@142@01
      ($Perm.min
        lifetime_token_perm_amount$0$snapshot$0@142@01
        (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))))
    (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)))))
(push) ; 9
(assert (not (or
  (= (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)) $Perm.No)
  (< $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(declare-const $t@304@01 $Snap)
(assert (and
  (=>
    (<
      $Perm.No
      (-
        lifetime_token_perm_amount$0$snapshot$0@142@01
        ($Perm.min
          lifetime_token_perm_amount$0$snapshot$0@142@01
          (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)))))
    (= $t@304@01 $t@160@01))
  (=>
    (< $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)))
    (= $t@304@01 ($Snap.second $t@302@01)))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; exhale acc(LifetimeToken(bw0$snapshot$0), lifetime_token_perm_amount$0$snapshot$0)
(set-option :timeout 0)
(push) ; 9
(assert (not (or
  (= lifetime_token_perm_amount$0$snapshot$0@142@01 $Perm.No)
  (< $Perm.No lifetime_token_perm_amount$0$snapshot$0@142@01))))
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
        lifetime_token_perm_amount$0$snapshot$0@142@01
        ($Perm.min
          lifetime_token_perm_amount$0$snapshot$0@142@01
          (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))))
      (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)))
    ($Perm.min
      (+
        (-
          lifetime_token_perm_amount$0$snapshot$0@142@01
          ($Perm.min
            lifetime_token_perm_amount$0$snapshot$0@142@01
            (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))))
        (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)))
      lifetime_token_perm_amount$0$snapshot$0@142@01))
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
      lifetime_token_perm_amount$0$snapshot$0@142@01
      ($Perm.min
        (+
          (-
            lifetime_token_perm_amount$0$snapshot$0@142@01
            ($Perm.min
              lifetime_token_perm_amount$0$snapshot$0@142@01
              (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))))
          (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)))
        lifetime_token_perm_amount$0$snapshot$0@142@01))
    $Perm.No)
  (<
    (-
      lifetime_token_perm_amount$0$snapshot$0@142@01
      ($Perm.min
        (+
          (-
            lifetime_token_perm_amount$0$snapshot$0@142@01
            ($Perm.min
              lifetime_token_perm_amount$0$snapshot$0@142@01
              (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))))
          (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)))
        lifetime_token_perm_amount$0$snapshot$0@142@01))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(push) ; 9
(set-option :timeout 10)
(assert (not (< $Perm.No lifetime_token_perm_amount$0$snapshot$0@142@01)))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(LifetimeToken(bw1$snapshot$0), lifetime_token_perm_amount$0$snapshot$0)
(set-option :timeout 0)
(push) ; 9
(assert (not (or
  (= lifetime_token_perm_amount$0$snapshot$0@142@01 $Perm.No)
  (< $Perm.No lifetime_token_perm_amount$0$snapshot$0@142@01))))
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
        lifetime_token_perm_amount$0$snapshot$0@142@01
        ($Perm.min
          lifetime_token_perm_amount$0$snapshot$0@142@01
          (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))))
      (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)))
    ($Perm.min
      (+
        (-
          lifetime_token_perm_amount$0$snapshot$0@142@01
          ($Perm.min
            lifetime_token_perm_amount$0$snapshot$0@142@01
            (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))))
        (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)))
      lifetime_token_perm_amount$0$snapshot$0@142@01))
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
      lifetime_token_perm_amount$0$snapshot$0@142@01
      ($Perm.min
        (+
          (-
            lifetime_token_perm_amount$0$snapshot$0@142@01
            ($Perm.min
              lifetime_token_perm_amount$0$snapshot$0@142@01
              (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))))
          (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)))
        lifetime_token_perm_amount$0$snapshot$0@142@01))
    $Perm.No)
  (<
    (-
      lifetime_token_perm_amount$0$snapshot$0@142@01
      ($Perm.min
        (+
          (-
            lifetime_token_perm_amount$0$snapshot$0@142@01
            ($Perm.min
              lifetime_token_perm_amount$0$snapshot$0@142@01
              (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))))
          (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)))
        lifetime_token_perm_amount$0$snapshot$0@142@01))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(push) ; 9
(set-option :timeout 10)
(assert (not (< $Perm.No lifetime_token_perm_amount$0$snapshot$0@142@01)))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [exec]
; into_memory_block$Bool(field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(_4$place()),
;   _4$address, destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(_4$snapshot$1))
; [eval] field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(_4$place())
; [eval] _4$place()
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(_4$snapshot$1)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> result_value@178@01)
  (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> _4$snapshot$1@85@01))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [eval] compute_address(place, root_address)
; [eval] Size$Bool$()
(declare-const $t@305@01 $Snap)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _25$place<Place>  Place) _25$address@69@01)
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _4$place<Place>  Place)) _4$address@83@01))))
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
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _4$place<Place>  Place)) _4$address@83@01)
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _4$place<Place>  Place)) _4$address@83@01))
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
    (compute_address<Address> (as _4$place<Place>  Place) _4$address@83@01)
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _4$place<Place>  Place)) _4$address@83@01))
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
(assert (not (=
  (compute_address<Address> (as _24$place<Place>  Place) _24$address@64@01)
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _4$place<Place>  Place)) _4$address@83@01))))
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
; memory_block_join$Tuple$$I64$Bool$$I64$Bool$(_4$address, write)
; [eval] none < permission_amount
; [eval] PaddingSize$Tuple$$I64$Bool$$I64$Bool$$()
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _4$place<Place>  Place)) _4$address@83@01)
    _4$address@83@01)
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
    (compute_address<Address> (as _25$place<Place>  Place) _25$address@69@01)
    _4$address@83@01)
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
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _4$place<Place>  Place)) _4$address@83@01)
    _4$address@83@01)
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
  (compute_address<Address> (as _4$place<Place>  Place) _4$address@83@01)
  _4$address@83@01)))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [eval] field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _4$place<Place>  Place)) _4$address@83@01)
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _4$address@83@01))
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
    (compute_address<Address> (as _25$place<Place>  Place) _25$address@69@01)
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _4$address@83@01))
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
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _4$place<Place>  Place)) _4$address@83@01)
  (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _4$address@83@01))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [eval] field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address)
; [eval] Size$Bool$()
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _4$place<Place>  Place)) _4$address@83@01)
  (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _4$address@83@01))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(declare-const $t@306@01 $Snap)
(assert (= $t@306@01 ($Snap.combine ($Snap.first $t@306@01) ($Snap.second $t@306@01))))
; [eval] Size$Tuple$$I64$Bool$$I64$Bool$$()
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _24$place<Place>  Place) _24$address@64@01)
    _4$address@83@01)
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
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
    (compute_address<Address> (as _25$place<Place>  Place) _25$address@69@01)
    _4$address@83@01)
  (=
    (as Size$Bool$<Snap$Usize>  Snap$Usize)
    (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (= ($Snap.second $t@306@01) $Snap.unit))
; [eval] (forall snapshot: Snap$Tuple$$I64$Bool$$I64$Bool$ :: { to_bytes$Tuple$$I64$Bool$$I64$Bool$(snapshot) } old(MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address), Size$I64$()) == to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot))) && old(MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address), Size$Bool$()) == to_bytes$Bool(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot))) ==> MemoryBlock$bytes(address, Size$Tuple$$I64$Bool$$I64$Bool$$()) == to_bytes$Tuple$$I64$Bool$$I64$Bool$(snapshot))
(declare-const snapshot@307@01 Snap$Tuple$$I64$Bool$$I64$Bool$)
(set-option :timeout 0)
(push) ; 9
; [eval] old(MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address), Size$I64$()) == to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot))) && old(MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address), Size$Bool$()) == to_bytes$Bool(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot))) ==> MemoryBlock$bytes(address, Size$Tuple$$I64$Bool$$I64$Bool$$()) == to_bytes$Tuple$$I64$Bool$$I64$Bool$(snapshot)
; [eval] old(MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address), Size$I64$()) == to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot))) && old(MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address), Size$Bool$()) == to_bytes$Bool(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot)))
; [eval] old(MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address), Size$I64$()) == to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot)))
; [eval] MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address), Size$I64$()) == to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot))
; [eval] MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address), Size$I64$())
; [eval] field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address)
; [eval] Size$I64$()
(push) ; 10
(declare-const $k@308@01 $Perm)
(assert ($Perm.isReadVar $k@308@01))
(push) ; 11
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _4$place<Place>  Place)) _4$address@83@01)
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _4$address@83@01))
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
(assert (not (and
  (=
    (compute_address<Address> (as _25$place<Place>  Place) _25$address@69@01)
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _4$address@83@01))
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
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _4$place<Place>  Place)) _4$address@83@01)
  (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _4$address@83@01))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(assert (< $k@308@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@308@01)))
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (< $Perm.No $k@308@01)))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@184@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _4$address@83@01) (as Size$I64$<Snap$Usize>  Snap$Usize)))
(pop) ; 10
; Joined path conditions
(assert ($Perm.isReadVar $k@308@01))
(assert (and
  (< $k@308@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@308@01))
  (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@184@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _4$address@83@01) (as Size$I64$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot)
(set-option :timeout 0)
(push) ; 10
; [then-branch: 7 | MemoryBlock$bytes(First:(Second:($t@184@01)), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](_4$address@83@01), Size$I64$[Snap$Usize]) == to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@307@01)) | live]
; [else-branch: 7 | MemoryBlock$bytes(First:(Second:($t@184@01)), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](_4$address@83@01), Size$I64$[Snap$Usize]) != to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@307@01)) | live]
(push) ; 11
; [then-branch: 7 | MemoryBlock$bytes(First:(Second:($t@184@01)), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](_4$address@83@01), Size$I64$[Snap$Usize]) == to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@307@01))]
(assert (=
  (MemoryBlock$bytes ($Snap.first ($Snap.second $t@184@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _4$address@83@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
  (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@307@01))))
; [eval] old(MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address), Size$Bool$()) == to_bytes$Bool(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot)))
; [eval] MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address), Size$Bool$()) == to_bytes$Bool(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot))
; [eval] MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address), Size$Bool$())
; [eval] field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address)
; [eval] Size$Bool$()
(push) ; 12
(declare-const $k@309@01 $Perm)
(assert ($Perm.isReadVar $k@309@01))
(push) ; 13
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Place> (as _4$place<Place>  Place)) _4$address@83@01)
  (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _4$address@83@01))))
(check-sat)
; unsat
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(assert (< $k@309@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@309@01)))
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (< $Perm.No $k@309@01)))
(check-sat)
; unsat
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition $t@305@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _4$address@83@01) (as Size$Bool$<Snap$Usize>  Snap$Usize)))
(pop) ; 12
; Joined path conditions
(assert ($Perm.isReadVar $k@309@01))
(assert (and
  (< $k@309@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@309@01))
  (MemoryBlock$bytes%precondition $t@305@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _4$address@83@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$Bool(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot)
(pop) ; 11
(set-option :timeout 0)
(push) ; 11
; [else-branch: 7 | MemoryBlock$bytes(First:(Second:($t@184@01)), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](_4$address@83@01), Size$I64$[Snap$Usize]) != to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@307@01))]
(assert (not
  (=
    (MemoryBlock$bytes ($Snap.first ($Snap.second $t@184@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _4$address@83@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
    (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@307@01)))))
(pop) ; 11
(pop) ; 10
; Joined path conditions
(assert ($Perm.isReadVar $k@309@01))
(assert (=>
  (=
    (MemoryBlock$bytes ($Snap.first ($Snap.second $t@184@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _4$address@83@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
    (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@307@01)))
  (and
    (=
      (MemoryBlock$bytes ($Snap.first ($Snap.second $t@184@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _4$address@83@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
      (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@307@01)))
    (< $k@309@01 $Perm.Write)
    (<= $Perm.No (- $Perm.Write $k@309@01))
    (MemoryBlock$bytes%precondition $t@305@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _4$address@83@01) (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
; Joined path conditions
(assert (or
  (not
    (=
      (MemoryBlock$bytes ($Snap.first ($Snap.second $t@184@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _4$address@83@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
      (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@307@01))))
  (=
    (MemoryBlock$bytes ($Snap.first ($Snap.second $t@184@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _4$address@83@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
    (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@307@01)))))
(push) ; 10
; [then-branch: 8 | MemoryBlock$bytes($t@305@01, field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Address](_4$address@83@01), Size$Bool$[Snap$Usize]) == to_bytes$Bool[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](snapshot@307@01)) && MemoryBlock$bytes(First:(Second:($t@184@01)), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](_4$address@83@01), Size$I64$[Snap$Usize]) == to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@307@01)) | live]
; [else-branch: 8 | !(MemoryBlock$bytes($t@305@01, field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Address](_4$address@83@01), Size$Bool$[Snap$Usize]) == to_bytes$Bool[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](snapshot@307@01)) && MemoryBlock$bytes(First:(Second:($t@184@01)), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](_4$address@83@01), Size$I64$[Snap$Usize]) == to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@307@01))) | live]
(push) ; 11
; [then-branch: 8 | MemoryBlock$bytes($t@305@01, field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Address](_4$address@83@01), Size$Bool$[Snap$Usize]) == to_bytes$Bool[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](snapshot@307@01)) && MemoryBlock$bytes(First:(Second:($t@184@01)), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](_4$address@83@01), Size$I64$[Snap$Usize]) == to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@307@01))]
(assert (and
  (=
    (MemoryBlock$bytes $t@305@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _4$address@83@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
    (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@307@01)))
  (=
    (MemoryBlock$bytes ($Snap.first ($Snap.second $t@184@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _4$address@83@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
    (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@307@01)))))
; [eval] MemoryBlock$bytes(address, Size$Tuple$$I64$Bool$$I64$Bool$$()) == to_bytes$Tuple$$I64$Bool$$I64$Bool$(snapshot)
; [eval] MemoryBlock$bytes(address, Size$Tuple$$I64$Bool$$I64$Bool$$())
; [eval] Size$Tuple$$I64$Bool$$I64$Bool$$()
(push) ; 12
(declare-const $k@310@01 $Perm)
(assert ($Perm.isReadVar $k@310@01))
(assert (< $k@310@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@310@01)))
(push) ; 13
(set-option :timeout 10)
(assert (not (< $Perm.No $k@310@01)))
(check-sat)
; unsat
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first $t@306@01) _4$address@83@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))
(pop) ; 12
; Joined path conditions
(assert ($Perm.isReadVar $k@310@01))
(assert (and
  (< $k@310@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@310@01))
  (MemoryBlock$bytes%precondition ($Snap.first $t@306@01) _4$address@83@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$Tuple$$I64$Bool$$I64$Bool$(snapshot)
(pop) ; 11
(set-option :timeout 0)
(push) ; 11
; [else-branch: 8 | !(MemoryBlock$bytes($t@305@01, field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Address](_4$address@83@01), Size$Bool$[Snap$Usize]) == to_bytes$Bool[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](snapshot@307@01)) && MemoryBlock$bytes(First:(Second:($t@184@01)), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](_4$address@83@01), Size$I64$[Snap$Usize]) == to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@307@01)))]
(assert (not
  (and
    (=
      (MemoryBlock$bytes $t@305@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _4$address@83@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
      (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@307@01)))
    (=
      (MemoryBlock$bytes ($Snap.first ($Snap.second $t@184@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _4$address@83@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
      (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@307@01))))))
(pop) ; 11
(pop) ; 10
; Joined path conditions
(assert ($Perm.isReadVar $k@310@01))
(assert (=>
  (and
    (=
      (MemoryBlock$bytes $t@305@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _4$address@83@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
      (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@307@01)))
    (=
      (MemoryBlock$bytes ($Snap.first ($Snap.second $t@184@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _4$address@83@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
      (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@307@01))))
  (and
    (=
      (MemoryBlock$bytes $t@305@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _4$address@83@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
      (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@307@01)))
    (=
      (MemoryBlock$bytes ($Snap.first ($Snap.second $t@184@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _4$address@83@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
      (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@307@01)))
    (< $k@310@01 $Perm.Write)
    (<= $Perm.No (- $Perm.Write $k@310@01))
    (MemoryBlock$bytes%precondition ($Snap.first $t@306@01) _4$address@83@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
; Joined path conditions
(assert (or
  (not
    (and
      (=
        (MemoryBlock$bytes $t@305@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _4$address@83@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
        (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@307@01)))
      (=
        (MemoryBlock$bytes ($Snap.first ($Snap.second $t@184@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _4$address@83@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
        (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@307@01)))))
  (and
    (=
      (MemoryBlock$bytes $t@305@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _4$address@83@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
      (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@307@01)))
    (=
      (MemoryBlock$bytes ($Snap.first ($Snap.second $t@184@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _4$address@83@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
      (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@307@01))))))
(pop) ; 9
; Nested auxiliary terms: globals (aux)
(assert ($Perm.isReadVar $k@308@01))
(assert ($Perm.isReadVar $k@309@01))
(assert ($Perm.isReadVar $k@310@01))
(assert (< $k@308@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@308@01)))
(assert (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@184@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _4$address@83@01) (as Size$I64$<Snap$Usize>  Snap$Usize)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((snapshot@307@01 Snap$Tuple$$I64$Bool$$I64$Bool$)) (!
  (and
    (=>
      (=
        (MemoryBlock$bytes ($Snap.first ($Snap.second $t@184@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _4$address@83@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
        (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@307@01)))
      (and
        (=
          (MemoryBlock$bytes ($Snap.first ($Snap.second $t@184@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _4$address@83@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
          (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@307@01)))
        (< $k@309@01 $Perm.Write)
        (<= $Perm.No (- $Perm.Write $k@309@01))
        (MemoryBlock$bytes%precondition $t@305@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _4$address@83@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))))
    (or
      (not
        (=
          (MemoryBlock$bytes ($Snap.first ($Snap.second $t@184@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _4$address@83@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
          (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@307@01))))
      (=
        (MemoryBlock$bytes ($Snap.first ($Snap.second $t@184@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _4$address@83@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
        (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@307@01))))
    (=>
      (and
        (=
          (MemoryBlock$bytes $t@305@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _4$address@83@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
          (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@307@01)))
        (=
          (MemoryBlock$bytes ($Snap.first ($Snap.second $t@184@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _4$address@83@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
          (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@307@01))))
      (and
        (=
          (MemoryBlock$bytes $t@305@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _4$address@83@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
          (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@307@01)))
        (=
          (MemoryBlock$bytes ($Snap.first ($Snap.second $t@184@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _4$address@83@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
          (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@307@01)))
        (< $k@310@01 $Perm.Write)
        (<= $Perm.No (- $Perm.Write $k@310@01))
        (MemoryBlock$bytes%precondition ($Snap.first $t@306@01) _4$address@83@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize))))
    (or
      (not
        (and
          (=
            (MemoryBlock$bytes $t@305@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _4$address@83@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
            (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@307@01)))
          (=
            (MemoryBlock$bytes ($Snap.first ($Snap.second $t@184@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _4$address@83@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
            (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@307@01)))))
      (and
        (=
          (MemoryBlock$bytes $t@305@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _4$address@83@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
          (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@307@01)))
        (=
          (MemoryBlock$bytes ($Snap.first ($Snap.second $t@184@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _4$address@83@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
          (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@307@01))))))
  :pattern ((to_bytes$Tuple$$I64$Bool$$I64$Bool$<Bytes> snapshot@307@01))
  :qid |prog.l1837-aux|)))
(assert (forall ((snapshot@307@01 Snap$Tuple$$I64$Bool$$I64$Bool$)) (!
  (=>
    (and
      (=
        (MemoryBlock$bytes $t@305@01 (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> _4$address@83@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
        (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@307@01)))
      (=
        (MemoryBlock$bytes ($Snap.first ($Snap.second $t@184@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> _4$address@83@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
        (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@307@01))))
    (=
      (MemoryBlock$bytes ($Snap.first $t@306@01) _4$address@83@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize))
      (to_bytes$Tuple$$I64$Bool$$I64$Bool$<Bytes> snapshot@307@01)))
  :pattern ((to_bytes$Tuple$$I64$Bool$$I64$Bool$<Bytes> snapshot@307@01))
  :qid |prog.l1837|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; exhale acc(MemoryBlock(_4$address, Size$Tuple$$I64$Bool$$I64$Bool$$()), write)
; [eval] Size$Tuple$$I64$Bool$$I64$Bool$$()
; [exec]
; into_memory_block$Bool(_23$place(), _23$address, _23$snapshot$1)
; [eval] _23$place()
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= result_value@267@01 _23$snapshot$1@61@01)))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [eval] compute_address(place, root_address)
; [eval] Size$Bool$()
(declare-const $t@311@01 $Snap)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _25$place<Place>  Place) _25$address@69@01)
  (compute_address<Address> (as _23$place<Place>  Place) _23$address@59@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _24$place<Place>  Place) _24$address@64@01)
  (compute_address<Address> (as _23$place<Place>  Place) _23$address@59@01))))
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
; exhale acc(MemoryBlock(_23$address, Size$Bool$()), write)
; [eval] Size$Bool$()
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _23$place<Place>  Place) _23$address@59@01)
  _23$address@59@01)))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(MemoryBlock(_24$address, Size$Bool$()), write)
; [eval] Size$Bool$()
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _25$place<Place>  Place) _25$address@69@01)
  _24$address@64@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _24$place<Place>  Place) _24$address@64@01)
  _24$address@64@01)))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(MemoryBlock(_25$address, Size$Bool$()), write)
; [eval] Size$Bool$()
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _25$place<Place>  Place) _25$address@69@01)
  _25$address@69@01)))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [exec]
; into_memory_block$Bool(_26$place(), _26$address, _26$snapshot$1)
; [eval] _26$place()
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= result_value@277@01 _26$snapshot$1@76@01)))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [eval] compute_address(place, root_address)
; [eval] Size$Bool$()
(declare-const $t@312@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; exhale acc(MemoryBlock(_26$address, Size$Bool$()), write)
; [eval] Size$Bool$()
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _26$place<Place>  Place) _26$address@74@01)
  _26$address@74@01)))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [exec]
; label label__from__return_label__to__end_label
; [exec]
; inhale _0$snapshot$2 == _0$snapshot$1
(declare-const $t@313@01 $Snap)
(assert (= $t@313@01 $Snap.unit))
; [eval] _0$snapshot$2 == _0$snapshot$1
(assert (= _0$snapshot$2@3@01 _0$snapshot$1@2@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale _12$snapshot$3 == _12$snapshot$1
(declare-const $t@314@01 $Snap)
(assert (= $t@314@01 $Snap.unit))
; [eval] _12$snapshot$3 == _12$snapshot$1
(assert (= _12$snapshot$3@12@01 _12$snapshot$1@10@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _14$snapshot$3 == _14$snapshot$1
(declare-const $t@315@01 $Snap)
(assert (= $t@315@01 $Snap.unit))
; [eval] _14$snapshot$3 == _14$snapshot$1
(assert (= _14$snapshot$3@19@01 _14$snapshot$1@17@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _15$snapshot$3 == _15$snapshot$1
(declare-const $t@316@01 $Snap)
(assert (= $t@316@01 $Snap.unit))
; [eval] _15$snapshot$3 == _15$snapshot$1
(assert (= _15$snapshot$3@24@01 _15$snapshot$1@22@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _16$snapshot$3 == _16$snapshot$1
(declare-const $t@317@01 $Snap)
(assert (= $t@317@01 $Snap.unit))
; [eval] _16$snapshot$3 == _16$snapshot$1
(assert (= _16$snapshot$3@29@01 _16$snapshot$1@27@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _18$snapshot$2 == _18$snapshot$1
(declare-const $t@318@01 $Snap)
(assert (= $t@318@01 $Snap.unit))
; [eval] _18$snapshot$2 == _18$snapshot$1
(assert (= _18$snapshot$2@33@01 _18$snapshot$1@32@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _19$snapshot$3 == _19$snapshot$1
(declare-const $t@319@01 $Snap)
(assert (= $t@319@01 $Snap.unit))
; [eval] _19$snapshot$3 == _19$snapshot$1
(assert (= _19$snapshot$3@38@01 _19$snapshot$1@36@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _2$snapshot$3 == _2$snapshot$1
(declare-const $t@320@01 $Snap)
(assert (= $t@320@01 $Snap.unit))
; [eval] _2$snapshot$3 == _2$snapshot$1
(assert (= _2$snapshot$3@43@01 _2$snapshot$1@41@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _20$snapshot$3 == _20$snapshot$1
(declare-const $t@321@01 $Snap)
(assert (= $t@321@01 $Snap.unit))
; [eval] _20$snapshot$3 == _20$snapshot$1
(assert (= _20$snapshot$3@48@01 _20$snapshot$1@46@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _21$snapshot$3 == _21$snapshot$1
(declare-const $t@322@01 $Snap)
(assert (= $t@322@01 $Snap.unit))
; [eval] _21$snapshot$3 == _21$snapshot$1
(assert (= _21$snapshot$3@53@01 _21$snapshot$1@51@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _22$snapshot$3 == _22$snapshot$1
(declare-const $t@323@01 $Snap)
(assert (= $t@323@01 $Snap.unit))
; [eval] _22$snapshot$3 == _22$snapshot$1
(assert (= _22$snapshot$3@58@01 _22$snapshot$1@56@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _23$snapshot$3 == _23$snapshot$1
(declare-const $t@324@01 $Snap)
(assert (= $t@324@01 $Snap.unit))
; [eval] _23$snapshot$3 == _23$snapshot$1
(assert (= _23$snapshot$3@63@01 _23$snapshot$1@61@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _24$snapshot$3 == _24$snapshot$1
(declare-const $t@325@01 $Snap)
(assert (= $t@325@01 $Snap.unit))
; [eval] _24$snapshot$3 == _24$snapshot$1
(assert (= _24$snapshot$3@68@01 _24$snapshot$1@66@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _25$snapshot$3 == _25$snapshot$1
(declare-const $t@326@01 $Snap)
(assert (= $t@326@01 $Snap.unit))
; [eval] _25$snapshot$3 == _25$snapshot$1
(assert (= _25$snapshot$3@73@01 _25$snapshot$1@71@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _26$snapshot$3 == _26$snapshot$1
(declare-const $t@327@01 $Snap)
(assert (= $t@327@01 $Snap.unit))
; [eval] _26$snapshot$3 == _26$snapshot$1
(assert (= _26$snapshot$3@78@01 _26$snapshot$1@76@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _6$snapshot$3 == _6$snapshot$1
(declare-const $t@328@01 $Snap)
(assert (= $t@328@01 $Snap.unit))
; [eval] _6$snapshot$3 == _6$snapshot$1
(assert (= _6$snapshot$3@92@01 _6$snapshot$1@90@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _7$snapshot$3 == _7$snapshot$1
(declare-const $t@329@01 $Snap)
(assert (= $t@329@01 $Snap.unit))
; [eval] _7$snapshot$3 == _7$snapshot$1
(assert (= _7$snapshot$3@97@01 _7$snapshot$1@95@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _8$snapshot$3 == _8$snapshot$1
(declare-const $t@330@01 $Snap)
(assert (= $t@330@01 $Snap.unit))
; [eval] _8$snapshot$3 == _8$snapshot$1
(assert (= _8$snapshot$3@102@01 _8$snapshot$1@100@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _9$snapshot$3 == _9$snapshot$1
(declare-const $t@331@01 $Snap)
(assert (= $t@331@01 $Snap.unit))
; [eval] _9$snapshot$3 == _9$snapshot$1
(assert (= _9$snapshot$3@107@01 _9$snapshot$1@105@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale lft_function_call_1$snapshot$3 == lft_function_call_1$snapshot$1
(declare-const $t@332@01 $Snap)
(assert (= $t@332@01 $Snap.unit))
; [eval] lft_function_call_1$snapshot$3 == lft_function_call_1$snapshot$1
(assert (= lft_function_call_1$snapshot$3@137@01 lft@161@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale lft_function_call_2$snapshot$3 == lft_function_call_2$snapshot$1
(declare-const $t@333@01 $Snap)
(assert (= $t@333@01 $Snap.unit))
; [eval] lft_function_call_2$snapshot$3 == lft_function_call_2$snapshot$1
(assert (= lft_function_call_2$snapshot$3@141@01 lft@161@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; label end_label
; [exec]
; end_label$marker := true
; [exec]
; inhale basic_block_marker$end_label$marker()
(declare-const $t@334@01 $Snap)
(assert (= $t@334@01 $Snap.unit))
; [eval] basic_block_marker$end_label$marker()
(assert (as basic_block_marker$end_label$marker<Bool>  Bool))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; label end_of_method
(pop) ; 8
(set-option :timeout 0)
(push) ; 8
; [else-branch: 6 | destructor$Snap$Bool$$value[Bool](_19$snapshot$1@36@01)]
(assert (destructor$Snap$Bool$$value<Bool> _19$snapshot$1@36@01))
(pop) ; 8
; [eval] !!destructor$Snap$Bool$$value(_19$snapshot$1)
; [eval] !destructor$Snap$Bool$$value(_19$snapshot$1)
; [eval] destructor$Snap$Bool$$value(_19$snapshot$1)
(push) ; 8
(set-option :timeout 10)
(assert (not (not (destructor$Snap$Bool$$value<Bool> _19$snapshot$1@36@01))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (destructor$Snap$Bool$$value<Bool> _19$snapshot$1@36@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [then-branch: 9 | destructor$Snap$Bool$$value[Bool](_19$snapshot$1@36@01) | live]
; [else-branch: 9 | !(destructor$Snap$Bool$$value[Bool](_19$snapshot$1@36@01)) | live]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 9 | destructor$Snap$Bool$$value[Bool](_19$snapshot$1@36@01)]
(assert (destructor$Snap$Bool$$value<Bool> _19$snapshot$1@36@01))
(push) ; 9
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [then-branch: 10 | True | live]
; [else-branch: 10 | False | dead]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 10 | True]
; [exec]
; label label_8_custom
; [exec]
; label_8_custom$marker := true
; [exec]
; inhale basic_block_marker$label_8_custom$marker()
(declare-const $t@335@01 $Snap)
(assert (= $t@335@01 $Snap.unit))
; [eval] basic_block_marker$label_8_custom$marker()
(assert (as basic_block_marker$label_8_custom$marker<Bool>  Bool))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; label label_bb13
; [exec]
; label_bb13$marker := true
; [exec]
; inhale basic_block_marker$label_bb13$marker()
(declare-const $t@336@01 $Snap)
(assert (= $t@336@01 $Snap.unit))
; [eval] basic_block_marker$label_bb13$marker()
(assert (as basic_block_marker$label_bb13$marker<Bool>  Bool))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlock(_27$address, Size$Never$()), write)
; [eval] Size$Never$()
(declare-const $t@337@01 $Snap)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> (as _24$place<Place>  Place) _24$address@64@01)
    _27$address@79@01)
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
  (= _0$address@0@01 _27$address@79@01)
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as Size$Never$<Snap$Usize>  Snap$Usize)))))
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
    (compute_address<Address> (as _4$place<Place>  Place) _4$address@83@01)
    _27$address@79@01)
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
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _4$place<Place>  Place)) _4$address@83@01)
    _27$address@79@01)
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
  (= _18$address@30@01 _27$address@79@01)
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
  (=
    (compute_address<Address> (as _25$place<Place>  Place) _25$address@69@01)
    _27$address@79@01)
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
; inhale acc(MemoryBlockStackDrop(_27$address, Size$Never$()), write)
; [eval] Size$Never$()
(declare-const $t@338@01 $Snap)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and
  (= _2$address@39@01 _27$address@79@01)
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
  (= _5$address@86@01 _27$address@79@01)
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
  (= _18$address@30@01 _27$address@79@01)
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
  (= _19$address@34@01 _27$address@79@01)
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
; label label__from__label_bb13__to__label_bb15
; [exec]
; inhale _12$snapshot$2 == _12$snapshot$1
(declare-const $t@339@01 $Snap)
(assert (= $t@339@01 $Snap.unit))
; [eval] _12$snapshot$2 == _12$snapshot$1
(assert (= _12$snapshot$2@11@01 _12$snapshot$1@10@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _14$snapshot$2 == _14$snapshot$1
(declare-const $t@340@01 $Snap)
(assert (= $t@340@01 $Snap.unit))
; [eval] _14$snapshot$2 == _14$snapshot$1
(assert (= _14$snapshot$2@18@01 _14$snapshot$1@17@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _15$snapshot$2 == _15$snapshot$1
(declare-const $t@341@01 $Snap)
(assert (= $t@341@01 $Snap.unit))
; [eval] _15$snapshot$2 == _15$snapshot$1
(assert (= _15$snapshot$2@23@01 _15$snapshot$1@22@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _16$snapshot$2 == _16$snapshot$1
(declare-const $t@342@01 $Snap)
(assert (= $t@342@01 $Snap.unit))
; [eval] _16$snapshot$2 == _16$snapshot$1
(assert (= _16$snapshot$2@28@01 _16$snapshot$1@27@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _19$snapshot$2 == _19$snapshot$1
(declare-const $t@343@01 $Snap)
(assert (= $t@343@01 $Snap.unit))
; [eval] _19$snapshot$2 == _19$snapshot$1
(assert (= _19$snapshot$2@37@01 _19$snapshot$1@36@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _2$snapshot$2 == _2$snapshot$1
(declare-const $t@344@01 $Snap)
(assert (= $t@344@01 $Snap.unit))
; [eval] _2$snapshot$2 == _2$snapshot$1
(assert (= _2$snapshot$2@42@01 _2$snapshot$1@41@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _20$snapshot$2 == _20$snapshot$1
(declare-const $t@345@01 $Snap)
(assert (= $t@345@01 $Snap.unit))
; [eval] _20$snapshot$2 == _20$snapshot$1
(assert (= _20$snapshot$2@47@01 _20$snapshot$1@46@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _21$snapshot$2 == _21$snapshot$1
(declare-const $t@346@01 $Snap)
(assert (= $t@346@01 $Snap.unit))
; [eval] _21$snapshot$2 == _21$snapshot$1
(assert (= _21$snapshot$2@52@01 _21$snapshot$1@51@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _22$snapshot$2 == _22$snapshot$1
(declare-const $t@347@01 $Snap)
(assert (= $t@347@01 $Snap.unit))
; [eval] _22$snapshot$2 == _22$snapshot$1
(assert (= _22$snapshot$2@57@01 _22$snapshot$1@56@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _23$snapshot$2 == _23$snapshot$1
(declare-const $t@348@01 $Snap)
(assert (= $t@348@01 $Snap.unit))
; [eval] _23$snapshot$2 == _23$snapshot$1
(assert (= _23$snapshot$2@62@01 _23$snapshot$1@61@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _24$snapshot$2 == _24$snapshot$1
(declare-const $t@349@01 $Snap)
(assert (= $t@349@01 $Snap.unit))
; [eval] _24$snapshot$2 == _24$snapshot$1
(assert (= _24$snapshot$2@67@01 _24$snapshot$1@66@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _25$snapshot$2 == _25$snapshot$1
(declare-const $t@350@01 $Snap)
(assert (= $t@350@01 $Snap.unit))
; [eval] _25$snapshot$2 == _25$snapshot$1
(assert (= _25$snapshot$2@72@01 _25$snapshot$1@71@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _26$snapshot$2 == _26$snapshot$1
(declare-const $t@351@01 $Snap)
(assert (= $t@351@01 $Snap.unit))
; [eval] _26$snapshot$2 == _26$snapshot$1
(assert (= _26$snapshot$2@77@01 _26$snapshot$1@76@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _6$snapshot$2 == _6$snapshot$1
(declare-const $t@352@01 $Snap)
(assert (= $t@352@01 $Snap.unit))
; [eval] _6$snapshot$2 == _6$snapshot$1
(assert (= _6$snapshot$2@91@01 _6$snapshot$1@90@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _7$snapshot$2 == _7$snapshot$1
(declare-const $t@353@01 $Snap)
(assert (= $t@353@01 $Snap.unit))
; [eval] _7$snapshot$2 == _7$snapshot$1
(assert (= _7$snapshot$2@96@01 _7$snapshot$1@95@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _8$snapshot$2 == _8$snapshot$1
(declare-const $t@354@01 $Snap)
(assert (= $t@354@01 $Snap.unit))
; [eval] _8$snapshot$2 == _8$snapshot$1
(assert (= _8$snapshot$2@101@01 _8$snapshot$1@100@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _9$snapshot$2 == _9$snapshot$1
(declare-const $t@355@01 $Snap)
(assert (= $t@355@01 $Snap.unit))
; [eval] _9$snapshot$2 == _9$snapshot$1
(assert (= _9$snapshot$2@106@01 _9$snapshot$1@105@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale lft_function_call_1$snapshot$2 == lft_function_call_1$snapshot$1
(declare-const $t@356@01 $Snap)
(assert (= $t@356@01 $Snap.unit))
; [eval] lft_function_call_1$snapshot$2 == lft_function_call_1$snapshot$1
(assert (= lft_function_call_1$snapshot$2@136@01 lft@161@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale lft_function_call_2$snapshot$2 == lft_function_call_2$snapshot$1
(declare-const $t@357@01 $Snap)
(assert (= $t@357@01 $Snap.unit))
; [eval] lft_function_call_2$snapshot$2 == lft_function_call_2$snapshot$1
(assert (= lft_function_call_2$snapshot$2@140@01 lft@161@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; label label_bb15
; [exec]
; label_bb15$marker := true
; [exec]
; inhale basic_block_marker$label_bb15$marker()
(declare-const $t@358@01 $Snap)
(assert (= $t@358@01 $Snap.unit))
; [eval] basic_block_marker$label_bb15$marker()
(assert (as basic_block_marker$label_bb15$marker<Bool>  Bool))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; label resume_panic_label
; [exec]
; resume_panic_label$marker := true
; [exec]
; inhale basic_block_marker$resume_panic_label$marker()
(declare-const $t@359@01 $Snap)
(assert (= $t@359@01 $Snap.unit))
; [eval] basic_block_marker$resume_panic_label$marker()
(assert (as basic_block_marker$resume_panic_label$marker<Bool>  Bool))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; label label__from__resume_panic_label__to__end_label
; [exec]
; inhale _0$snapshot$2 == _0$snapshot$0
(declare-const $t@360@01 $Snap)
(assert (= $t@360@01 $Snap.unit))
; [eval] _0$snapshot$2 == _0$snapshot$0
(assert (= _0$snapshot$2@3@01 _0$snapshot$0@1@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _12$snapshot$3 == _12$snapshot$2
(declare-const $t@361@01 $Snap)
(assert (= $t@361@01 $Snap.unit))
; [eval] _12$snapshot$3 == _12$snapshot$2
(assert (= _12$snapshot$3@12@01 _12$snapshot$2@11@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _14$snapshot$3 == _14$snapshot$2
(declare-const $t@362@01 $Snap)
(assert (= $t@362@01 $Snap.unit))
; [eval] _14$snapshot$3 == _14$snapshot$2
(assert (= _14$snapshot$3@19@01 _14$snapshot$2@18@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _15$snapshot$3 == _15$snapshot$2
(declare-const $t@363@01 $Snap)
(assert (= $t@363@01 $Snap.unit))
; [eval] _15$snapshot$3 == _15$snapshot$2
(assert (= _15$snapshot$3@24@01 _15$snapshot$2@23@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _16$snapshot$3 == _16$snapshot$2
(declare-const $t@364@01 $Snap)
(assert (= $t@364@01 $Snap.unit))
; [eval] _16$snapshot$3 == _16$snapshot$2
(assert (= _16$snapshot$3@29@01 _16$snapshot$2@28@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _18$snapshot$2 == _18$snapshot$0
(declare-const $t@365@01 $Snap)
(assert (= $t@365@01 $Snap.unit))
; [eval] _18$snapshot$2 == _18$snapshot$0
(assert (= _18$snapshot$2@33@01 _18$snapshot$0@31@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _19$snapshot$3 == _19$snapshot$2
(declare-const $t@366@01 $Snap)
(assert (= $t@366@01 $Snap.unit))
; [eval] _19$snapshot$3 == _19$snapshot$2
(assert (= _19$snapshot$3@38@01 _19$snapshot$2@37@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _2$snapshot$3 == _2$snapshot$2
(declare-const $t@367@01 $Snap)
(assert (= $t@367@01 $Snap.unit))
; [eval] _2$snapshot$3 == _2$snapshot$2
(assert (= _2$snapshot$3@43@01 _2$snapshot$2@42@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _20$snapshot$3 == _20$snapshot$2
(declare-const $t@368@01 $Snap)
(assert (= $t@368@01 $Snap.unit))
; [eval] _20$snapshot$3 == _20$snapshot$2
(assert (= _20$snapshot$3@48@01 _20$snapshot$2@47@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _21$snapshot$3 == _21$snapshot$2
(declare-const $t@369@01 $Snap)
(assert (= $t@369@01 $Snap.unit))
; [eval] _21$snapshot$3 == _21$snapshot$2
(assert (= _21$snapshot$3@53@01 _21$snapshot$2@52@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _22$snapshot$3 == _22$snapshot$2
(declare-const $t@370@01 $Snap)
(assert (= $t@370@01 $Snap.unit))
; [eval] _22$snapshot$3 == _22$snapshot$2
(assert (= _22$snapshot$3@58@01 _22$snapshot$2@57@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _23$snapshot$3 == _23$snapshot$2
(declare-const $t@371@01 $Snap)
(assert (= $t@371@01 $Snap.unit))
; [eval] _23$snapshot$3 == _23$snapshot$2
(assert (= _23$snapshot$3@63@01 _23$snapshot$2@62@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _24$snapshot$3 == _24$snapshot$2
(declare-const $t@372@01 $Snap)
(assert (= $t@372@01 $Snap.unit))
; [eval] _24$snapshot$3 == _24$snapshot$2
(assert (= _24$snapshot$3@68@01 _24$snapshot$2@67@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _25$snapshot$3 == _25$snapshot$2
(declare-const $t@373@01 $Snap)
(assert (= $t@373@01 $Snap.unit))
; [eval] _25$snapshot$3 == _25$snapshot$2
(assert (= _25$snapshot$3@73@01 _25$snapshot$2@72@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _26$snapshot$3 == _26$snapshot$2
(declare-const $t@374@01 $Snap)
(assert (= $t@374@01 $Snap.unit))
; [eval] _26$snapshot$3 == _26$snapshot$2
(assert (= _26$snapshot$3@78@01 _26$snapshot$2@77@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _6$snapshot$3 == _6$snapshot$2
(declare-const $t@375@01 $Snap)
(assert (= $t@375@01 $Snap.unit))
; [eval] _6$snapshot$3 == _6$snapshot$2
(assert (= _6$snapshot$3@92@01 _6$snapshot$2@91@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _7$snapshot$3 == _7$snapshot$2
(declare-const $t@376@01 $Snap)
(assert (= $t@376@01 $Snap.unit))
; [eval] _7$snapshot$3 == _7$snapshot$2
(assert (= _7$snapshot$3@97@01 _7$snapshot$2@96@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _8$snapshot$3 == _8$snapshot$2
(declare-const $t@377@01 $Snap)
(assert (= $t@377@01 $Snap.unit))
; [eval] _8$snapshot$3 == _8$snapshot$2
(assert (= _8$snapshot$3@102@01 _8$snapshot$2@101@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _9$snapshot$3 == _9$snapshot$2
(declare-const $t@378@01 $Snap)
(assert (= $t@378@01 $Snap.unit))
; [eval] _9$snapshot$3 == _9$snapshot$2
(assert (= _9$snapshot$3@107@01 _9$snapshot$2@106@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale lft_function_call_1$snapshot$3 == lft_function_call_1$snapshot$2
(declare-const $t@379@01 $Snap)
(assert (= $t@379@01 $Snap.unit))
; [eval] lft_function_call_1$snapshot$3 == lft_function_call_1$snapshot$2
(assert (= lft_function_call_1$snapshot$3@137@01 lft_function_call_1$snapshot$2@136@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale lft_function_call_2$snapshot$3 == lft_function_call_2$snapshot$2
(declare-const $t@380@01 $Snap)
(assert (= $t@380@01 $Snap.unit))
; [eval] lft_function_call_2$snapshot$3 == lft_function_call_2$snapshot$2
(assert (= lft_function_call_2$snapshot$3@141@01 lft_function_call_2$snapshot$2@140@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; label end_label
; [exec]
; end_label$marker := true
; [exec]
; inhale basic_block_marker$end_label$marker()
(declare-const $t@381@01 $Snap)
(assert (= $t@381@01 $Snap.unit))
; [eval] basic_block_marker$end_label$marker()
(assert (as basic_block_marker$end_label$marker<Bool>  Bool))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; label end_of_method
(pop) ; 9
; [eval] !true
; [then-branch: 11 | False | dead]
; [else-branch: 11 | True | live]
(set-option :timeout 0)
(push) ; 9
; [else-branch: 11 | True]
(pop) ; 9
(pop) ; 8
(push) ; 8
; [else-branch: 9 | !(destructor$Snap$Bool$$value[Bool](_19$snapshot$1@36@01))]
(assert (not (destructor$Snap$Bool$$value<Bool> _19$snapshot$1@36@01)))
(pop) ; 8
(pop) ; 7
; [eval] !!destructor$Snap$Bool$$value(_26$snapshot$1)
; [eval] !destructor$Snap$Bool$$value(_26$snapshot$1)
; [eval] destructor$Snap$Bool$$value(_26$snapshot$1)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (destructor$Snap$Bool$$value<Bool> _26$snapshot$1@76@01))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [then-branch: 12 | destructor$Snap$Bool$$value[Bool](_26$snapshot$1@76@01) | dead]
; [else-branch: 12 | !(destructor$Snap$Bool$$value[Bool](_26$snapshot$1@76@01)) | live]
(set-option :timeout 0)
(push) ; 7
; [else-branch: 12 | !(destructor$Snap$Bool$$value[Bool](_26$snapshot$1@76@01))]
(assert (not (destructor$Snap$Bool$$value<Bool> _26$snapshot$1@76@01)))
(pop) ; 7
(pop) ; 6
; [eval] !!destructor$Snap$Bool$$value(_23$snapshot$1)
; [eval] !destructor$Snap$Bool$$value(_23$snapshot$1)
; [eval] destructor$Snap$Bool$$value(_23$snapshot$1)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (destructor$Snap$Bool$$value<Bool> _23$snapshot$1@61@01))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [then-branch: 13 | destructor$Snap$Bool$$value[Bool](_23$snapshot$1@61@01) | dead]
; [else-branch: 13 | !(destructor$Snap$Bool$$value[Bool](_23$snapshot$1@61@01)) | live]
(set-option :timeout 0)
(push) ; 6
; [else-branch: 13 | !(destructor$Snap$Bool$$value[Bool](_23$snapshot$1@61@01))]
(assert (not (destructor$Snap$Bool$$value<Bool> _23$snapshot$1@61@01)))
(pop) ; 6
(pop) ; 5
(push) ; 5
; [else-branch: 3 | !(tmp$2@148@01)]
(assert (not tmp$2@148@01))
(pop) ; 5
; [eval] !tmp$2
(push) ; 5
(set-option :timeout 10)
(assert (not tmp$2@148@01))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not tmp$2@148@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [then-branch: 14 | !(tmp$2@148@01) | live]
; [else-branch: 14 | tmp$2@148@01 | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 14 | !(tmp$2@148@01)]
(assert (not tmp$2@148@01))
; [eval] !tmp$2
(push) ; 6
(set-option :timeout 10)
(assert (not tmp$2@148@01))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [then-branch: 15 | !(tmp$2@148@01) | live]
; [else-branch: 15 | tmp$2@148@01 | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 15 | !(tmp$2@148@01)]
; [exec]
; label label_6_custom
; [exec]
; label_6_custom$marker := true
; [exec]
; inhale basic_block_marker$label_6_custom$marker()
(declare-const $t@382@01 $Snap)
(assert (= $t@382@01 $Snap.unit))
; [eval] basic_block_marker$label_6_custom$marker()
(assert (as basic_block_marker$label_6_custom$marker<Bool>  Bool))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlock(_13$address, Size$Bool$()), write)
; [eval] Size$Bool$()
(declare-const $t@383@01 $Snap)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= _26$address@74@01 _13$address@13@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= _24$address@64@01 _13$address@13@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (= _0$address@0@01 _13$address@13@01)
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
(assert (not (= _23$address@59@01 _13$address@13@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= _25$address@69@01 _13$address@13@01)))
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
    (compute_address<Address> (as _4$place<Place>  Place) _4$address@83@01)
    _13$address@13@01)
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
    (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _4$place<Place>  Place)) _4$address@83@01)
    _13$address@13@01)
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
  (= _7$address@93@01 _13$address@13@01)
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
  (= _11$address@6@01 _13$address@13@01)
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
  (= _12$address@8@01 _13$address@13@01)
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
    (compute_address<Address> (as _14$place<Place>  Place) _14$address@15@01)
    _13$address@13@01)
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
; inhale acc(LifetimeToken(lft_1$snapshot$1), lifetime_token_perm_amount$0$snapshot$0 /
;   7)
; [eval] lifetime_token_perm_amount$0$snapshot$0 / 7
(set-option :timeout 0)
(push) ; 7
(assert (not (or
  (= (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)) $Perm.No)
  (< $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(declare-const $t@384@01 $Snap)
(declare-const $t@385@01 $Snap)
(assert (and
  (=>
    (<
      $Perm.No
      (-
        (-
          (+
            (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))
            (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)))
          ($Perm.min
            (+
              (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))
              (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)))
            (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 14))))
        ($Perm.min
          (-
            (+
              (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))
              (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)))
            ($Perm.min
              (+
                (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))
                (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)))
              (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 14))))
          (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 14)))))
    (= $t@385@01 $t@198@01))
  (=>
    (< $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)))
    (= $t@385@01 $t@384@01))))
(assert (<=
  $Perm.No
  (+
    (-
      (-
        (+
          (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))
          (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)))
        ($Perm.min
          (+
            (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))
            (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)))
          (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 14))))
      ($Perm.min
        (-
          (+
            (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))
            (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)))
          ($Perm.min
            (+
              (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))
              (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)))
            (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 14))))
        (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 14))))
    (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(LifetimeToken(lft_function_call_2$snapshot$1), lifetime_token_perm_amount$0$snapshot$0 /
;   7)
; [eval] lifetime_token_perm_amount$0$snapshot$0 / 7
(set-option :timeout 0)
(push) ; 7
(assert (not (or
  (= (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)) $Perm.No)
  (< $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(declare-const $t@386@01 $Snap)
(declare-const $t@387@01 $Snap)
(assert (and
  (=>
    (<
      $Perm.No
      (+
        (-
          (-
            (+
              (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))
              (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)))
            ($Perm.min
              (+
                (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))
                (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)))
              (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 14))))
          ($Perm.min
            (-
              (+
                (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))
                (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)))
              ($Perm.min
                (+
                  (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))
                  (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)))
                (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 14))))
            (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 14))))
        (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))))
    (= $t@387@01 $t@385@01))
  (=>
    (< $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)))
    (= $t@387@01 $t@386@01))))
(assert (<=
  $Perm.No
  (+
    (+
      (-
        (-
          (+
            (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))
            (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)))
          ($Perm.min
            (+
              (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))
              (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)))
            (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 14))))
        ($Perm.min
          (-
            (+
              (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))
              (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)))
            ($Perm.min
              (+
                (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))
                (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)))
              (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 14))))
          (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 14))))
      (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)))
    (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; label label__from__label_6_custom__to__label_bb15
; [exec]
; inhale _12$snapshot$2 == _12$snapshot$0
(declare-const $t@388@01 $Snap)
(assert (= $t@388@01 $Snap.unit))
; [eval] _12$snapshot$2 == _12$snapshot$0
(assert (= _12$snapshot$2@11@01 _12$snapshot$0@9@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _14$snapshot$2 == _14$snapshot$1
(declare-const $t@389@01 $Snap)
(assert (= $t@389@01 $Snap.unit))
; [eval] _14$snapshot$2 == _14$snapshot$1
(assert (= _14$snapshot$2@18@01 _14$snapshot$1@17@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _15$snapshot$2 == _15$snapshot$0
(declare-const $t@390@01 $Snap)
(assert (= $t@390@01 $Snap.unit))
; [eval] _15$snapshot$2 == _15$snapshot$0
(assert (= _15$snapshot$2@23@01 _15$snapshot$0@21@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _16$snapshot$2 == _16$snapshot$0
(declare-const $t@391@01 $Snap)
(assert (= $t@391@01 $Snap.unit))
; [eval] _16$snapshot$2 == _16$snapshot$0
(assert (= _16$snapshot$2@28@01 _16$snapshot$0@26@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _19$snapshot$2 == _19$snapshot$0
(declare-const $t@392@01 $Snap)
(assert (= $t@392@01 $Snap.unit))
; [eval] _19$snapshot$2 == _19$snapshot$0
(assert (= _19$snapshot$2@37@01 _19$snapshot$0@35@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _2$snapshot$2 == _2$snapshot$1
(declare-const $t@393@01 $Snap)
(assert (= $t@393@01 $Snap.unit))
; [eval] _2$snapshot$2 == _2$snapshot$1
(assert (= _2$snapshot$2@42@01 _2$snapshot$1@41@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _20$snapshot$2 == _20$snapshot$0
(declare-const $t@394@01 $Snap)
(assert (= $t@394@01 $Snap.unit))
; [eval] _20$snapshot$2 == _20$snapshot$0
(assert (= _20$snapshot$2@47@01 _20$snapshot$0@45@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _21$snapshot$2 == _21$snapshot$0
(declare-const $t@395@01 $Snap)
(assert (= $t@395@01 $Snap.unit))
; [eval] _21$snapshot$2 == _21$snapshot$0
(assert (= _21$snapshot$2@52@01 _21$snapshot$0@50@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _22$snapshot$2 == _22$snapshot$0
(declare-const $t@396@01 $Snap)
(assert (= $t@396@01 $Snap.unit))
; [eval] _22$snapshot$2 == _22$snapshot$0
(assert (= _22$snapshot$2@57@01 _22$snapshot$0@55@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _23$snapshot$2 == _23$snapshot$0
(declare-const $t@397@01 $Snap)
(assert (= $t@397@01 $Snap.unit))
; [eval] _23$snapshot$2 == _23$snapshot$0
(assert (= _23$snapshot$2@62@01 _23$snapshot$0@60@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _24$snapshot$2 == _24$snapshot$0
(declare-const $t@398@01 $Snap)
(assert (= $t@398@01 $Snap.unit))
; [eval] _24$snapshot$2 == _24$snapshot$0
(assert (= _24$snapshot$2@67@01 _24$snapshot$0@65@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _25$snapshot$2 == _25$snapshot$0
(declare-const $t@399@01 $Snap)
(assert (= $t@399@01 $Snap.unit))
; [eval] _25$snapshot$2 == _25$snapshot$0
(assert (= _25$snapshot$2@72@01 _25$snapshot$0@70@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _26$snapshot$2 == _26$snapshot$0
(declare-const $t@400@01 $Snap)
(assert (= $t@400@01 $Snap.unit))
; [eval] _26$snapshot$2 == _26$snapshot$0
(assert (= _26$snapshot$2@77@01 _26$snapshot$0@75@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _6$snapshot$2 == _6$snapshot$1
(declare-const $t@401@01 $Snap)
(assert (= $t@401@01 $Snap.unit))
; [eval] _6$snapshot$2 == _6$snapshot$1
(assert (= _6$snapshot$2@91@01 _6$snapshot$1@90@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _7$snapshot$2 == _7$snapshot$0
(declare-const $t@402@01 $Snap)
(assert (= $t@402@01 $Snap.unit))
; [eval] _7$snapshot$2 == _7$snapshot$0
(assert (= _7$snapshot$2@96@01 _7$snapshot$0@94@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _8$snapshot$2 == _8$snapshot$1
(declare-const $t@403@01 $Snap)
(assert (= $t@403@01 $Snap.unit))
; [eval] _8$snapshot$2 == _8$snapshot$1
(assert (= _8$snapshot$2@101@01 _8$snapshot$1@100@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _9$snapshot$2 == _9$snapshot$1
(declare-const $t@404@01 $Snap)
(assert (= $t@404@01 $Snap.unit))
; [eval] _9$snapshot$2 == _9$snapshot$1
(assert (= _9$snapshot$2@106@01 _9$snapshot$1@105@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale lft_function_call_1$snapshot$2 == lft_function_call_1$snapshot$1
(declare-const $t@405@01 $Snap)
(assert (= $t@405@01 $Snap.unit))
; [eval] lft_function_call_1$snapshot$2 == lft_function_call_1$snapshot$1
(assert (= lft_function_call_1$snapshot$2@136@01 lft@161@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale lft_function_call_2$snapshot$2 == lft_function_call_2$snapshot$1
(declare-const $t@406@01 $Snap)
(assert (= $t@406@01 $Snap.unit))
; [eval] lft_function_call_2$snapshot$2 == lft_function_call_2$snapshot$1
(assert (= lft_function_call_2$snapshot$2@140@01 lft@161@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; label label_bb15
; [exec]
; label_bb15$marker := true
; [exec]
; inhale basic_block_marker$label_bb15$marker()
(declare-const $t@407@01 $Snap)
(assert (= $t@407@01 $Snap.unit))
; [eval] basic_block_marker$label_bb15$marker()
(assert (as basic_block_marker$label_bb15$marker<Bool>  Bool))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; label resume_panic_label
; [exec]
; resume_panic_label$marker := true
; [exec]
; inhale basic_block_marker$resume_panic_label$marker()
(declare-const $t@408@01 $Snap)
(assert (= $t@408@01 $Snap.unit))
; [eval] basic_block_marker$resume_panic_label$marker()
(assert (as basic_block_marker$resume_panic_label$marker<Bool>  Bool))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; label label__from__resume_panic_label__to__end_label
; [exec]
; inhale _0$snapshot$2 == _0$snapshot$0
(declare-const $t@409@01 $Snap)
(assert (= $t@409@01 $Snap.unit))
; [eval] _0$snapshot$2 == _0$snapshot$0
(assert (= _0$snapshot$2@3@01 _0$snapshot$0@1@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _12$snapshot$3 == _12$snapshot$2
(declare-const $t@410@01 $Snap)
(assert (= $t@410@01 $Snap.unit))
; [eval] _12$snapshot$3 == _12$snapshot$2
(assert (= _12$snapshot$3@12@01 _12$snapshot$2@11@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _14$snapshot$3 == _14$snapshot$2
(declare-const $t@411@01 $Snap)
(assert (= $t@411@01 $Snap.unit))
; [eval] _14$snapshot$3 == _14$snapshot$2
(assert (= _14$snapshot$3@19@01 _14$snapshot$2@18@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _15$snapshot$3 == _15$snapshot$2
(declare-const $t@412@01 $Snap)
(assert (= $t@412@01 $Snap.unit))
; [eval] _15$snapshot$3 == _15$snapshot$2
(assert (= _15$snapshot$3@24@01 _15$snapshot$2@23@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _16$snapshot$3 == _16$snapshot$2
(declare-const $t@413@01 $Snap)
(assert (= $t@413@01 $Snap.unit))
; [eval] _16$snapshot$3 == _16$snapshot$2
(assert (= _16$snapshot$3@29@01 _16$snapshot$2@28@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _18$snapshot$2 == _18$snapshot$0
(declare-const $t@414@01 $Snap)
(assert (= $t@414@01 $Snap.unit))
; [eval] _18$snapshot$2 == _18$snapshot$0
(assert (= _18$snapshot$2@33@01 _18$snapshot$0@31@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _19$snapshot$3 == _19$snapshot$2
(declare-const $t@415@01 $Snap)
(assert (= $t@415@01 $Snap.unit))
; [eval] _19$snapshot$3 == _19$snapshot$2
(assert (= _19$snapshot$3@38@01 _19$snapshot$2@37@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _2$snapshot$3 == _2$snapshot$2
(declare-const $t@416@01 $Snap)
(assert (= $t@416@01 $Snap.unit))
; [eval] _2$snapshot$3 == _2$snapshot$2
(assert (= _2$snapshot$3@43@01 _2$snapshot$2@42@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _20$snapshot$3 == _20$snapshot$2
(declare-const $t@417@01 $Snap)
(assert (= $t@417@01 $Snap.unit))
; [eval] _20$snapshot$3 == _20$snapshot$2
(assert (= _20$snapshot$3@48@01 _20$snapshot$2@47@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _21$snapshot$3 == _21$snapshot$2
(declare-const $t@418@01 $Snap)
(assert (= $t@418@01 $Snap.unit))
; [eval] _21$snapshot$3 == _21$snapshot$2
(assert (= _21$snapshot$3@53@01 _21$snapshot$2@52@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _22$snapshot$3 == _22$snapshot$2
(declare-const $t@419@01 $Snap)
(assert (= $t@419@01 $Snap.unit))
; [eval] _22$snapshot$3 == _22$snapshot$2
(assert (= _22$snapshot$3@58@01 _22$snapshot$2@57@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _23$snapshot$3 == _23$snapshot$2
(declare-const $t@420@01 $Snap)
(assert (= $t@420@01 $Snap.unit))
; [eval] _23$snapshot$3 == _23$snapshot$2
(assert (= _23$snapshot$3@63@01 _23$snapshot$2@62@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _24$snapshot$3 == _24$snapshot$2
(declare-const $t@421@01 $Snap)
(assert (= $t@421@01 $Snap.unit))
; [eval] _24$snapshot$3 == _24$snapshot$2
(assert (= _24$snapshot$3@68@01 _24$snapshot$2@67@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _25$snapshot$3 == _25$snapshot$2
(declare-const $t@422@01 $Snap)
(assert (= $t@422@01 $Snap.unit))
; [eval] _25$snapshot$3 == _25$snapshot$2
(assert (= _25$snapshot$3@73@01 _25$snapshot$2@72@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _26$snapshot$3 == _26$snapshot$2
(declare-const $t@423@01 $Snap)
(assert (= $t@423@01 $Snap.unit))
; [eval] _26$snapshot$3 == _26$snapshot$2
(assert (= _26$snapshot$3@78@01 _26$snapshot$2@77@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _6$snapshot$3 == _6$snapshot$2
(declare-const $t@424@01 $Snap)
(assert (= $t@424@01 $Snap.unit))
; [eval] _6$snapshot$3 == _6$snapshot$2
(assert (= _6$snapshot$3@92@01 _6$snapshot$2@91@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _7$snapshot$3 == _7$snapshot$2
(declare-const $t@425@01 $Snap)
(assert (= $t@425@01 $Snap.unit))
; [eval] _7$snapshot$3 == _7$snapshot$2
(assert (= _7$snapshot$3@97@01 _7$snapshot$2@96@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _8$snapshot$3 == _8$snapshot$2
(declare-const $t@426@01 $Snap)
(assert (= $t@426@01 $Snap.unit))
; [eval] _8$snapshot$3 == _8$snapshot$2
(assert (= _8$snapshot$3@102@01 _8$snapshot$2@101@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _9$snapshot$3 == _9$snapshot$2
(declare-const $t@427@01 $Snap)
(assert (= $t@427@01 $Snap.unit))
; [eval] _9$snapshot$3 == _9$snapshot$2
(assert (= _9$snapshot$3@107@01 _9$snapshot$2@106@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale lft_function_call_1$snapshot$3 == lft_function_call_1$snapshot$2
(declare-const $t@428@01 $Snap)
(assert (= $t@428@01 $Snap.unit))
; [eval] lft_function_call_1$snapshot$3 == lft_function_call_1$snapshot$2
(assert (= lft_function_call_1$snapshot$3@137@01 lft_function_call_1$snapshot$2@136@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale lft_function_call_2$snapshot$3 == lft_function_call_2$snapshot$2
(declare-const $t@429@01 $Snap)
(assert (= $t@429@01 $Snap.unit))
; [eval] lft_function_call_2$snapshot$3 == lft_function_call_2$snapshot$2
(assert (= lft_function_call_2$snapshot$3@141@01 lft_function_call_2$snapshot$2@140@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; label end_label
; [exec]
; end_label$marker := true
; [exec]
; inhale basic_block_marker$end_label$marker()
(declare-const $t@430@01 $Snap)
(assert (= $t@430@01 $Snap.unit))
; [eval] basic_block_marker$end_label$marker()
(assert (as basic_block_marker$end_label$marker<Bool>  Bool))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; label end_of_method
(pop) ; 6
; [eval] !!tmp$2
; [eval] !tmp$2
; [then-branch: 16 | tmp$2@148@01 | dead]
; [else-branch: 16 | !(tmp$2@148@01) | live]
(set-option :timeout 0)
(push) ; 6
; [else-branch: 16 | !(tmp$2@148@01)]
(pop) ; 6
(pop) ; 5
(push) ; 5
; [else-branch: 14 | tmp$2@148@01]
(assert tmp$2@148@01)
(pop) ; 5
(pop) ; 4
(push) ; 4
; [else-branch: 2 | !(tmp$1@147@01)]
(assert (not tmp$1@147@01))
(pop) ; 4
; [eval] !tmp$1
(push) ; 4
(set-option :timeout 10)
(assert (not tmp$1@147@01))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not tmp$1@147@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [then-branch: 17 | !(tmp$1@147@01) | live]
; [else-branch: 17 | tmp$1@147@01 | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 17 | !(tmp$1@147@01)]
(assert (not tmp$1@147@01))
; [eval] !tmp$1
(push) ; 5
(set-option :timeout 10)
(assert (not tmp$1@147@01))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [then-branch: 18 | !(tmp$1@147@01) | live]
; [else-branch: 18 | tmp$1@147@01 | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 18 | !(tmp$1@147@01)]
; [exec]
; label label_3_custom
; [exec]
; label_3_custom$marker := true
; [exec]
; inhale basic_block_marker$label_3_custom$marker()
(declare-const $t@431@01 $Snap)
(assert (= $t@431@01 $Snap.unit))
; [eval] basic_block_marker$label_3_custom$marker()
(assert (as basic_block_marker$label_3_custom$marker<Bool>  Bool))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(MemoryBlock(_5$address, Size$I64$()), write)
; [eval] Size$I64$()
(declare-const $t@432@01 $Snap)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (= _26$address@74@01 _5$address@86@01)
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
  (= _24$address@64@01 _5$address@86@01)
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
(assert (not (and
  (= _0$address@0@01 _5$address@86@01)
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
  (= _23$address@59@01 _5$address@86@01)
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
  (= _25$address@69@01 _5$address@86@01)
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
    (compute_address<Address> (as _4$place<Place>  Place) _4$address@83@01)
    _5$address@86@01)
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
  (compute_address<Address> (field_place$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Place> (as _4$place<Place>  Place)) _4$address@83@01)
  _5$address@86@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> (as _6$place<Place>  Place) _6$address@88@01)
  _5$address@86@01)))
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
; inhale acc(LifetimeToken(lft_1$snapshot$1), lifetime_token_perm_amount$0$snapshot$0 /
;   7)
; [eval] lifetime_token_perm_amount$0$snapshot$0 / 7
(set-option :timeout 0)
(push) ; 6
(assert (not (or
  (= (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)) $Perm.No)
  (< $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(declare-const $t@433@01 $Snap)
(push) ; 6
(set-option :timeout 10)
(assert (not (= bw1$snapshot$0@109@01 lft@161@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= bw0$snapshot$0@108@01 lft@161@01)))
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
; inhale acc(LifetimeToken(lft_function_call_1$snapshot$1), lifetime_token_perm_amount$0$snapshot$0 /
;   7)
; [eval] lifetime_token_perm_amount$0$snapshot$0 / 7
(set-option :timeout 0)
(push) ; 6
(assert (not (or
  (= (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)) $Perm.No)
  (< $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(declare-const $t@434@01 $Snap)
(declare-const $t@435@01 $Snap)
(assert (and
  (=>
    (< $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)))
    (= $t@435@01 $t@433@01))
  (=>
    (< $Perm.No (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)))
    (= $t@435@01 $t@434@01))))
(assert (<=
  $Perm.No
  (+
    (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7))
    (/ lifetime_token_perm_amount$0$snapshot$0@142@01 (to_real 7)))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; label label__from__label_3_custom__to__label_bb15
; [exec]
; inhale _12$snapshot$2 == _12$snapshot$0
(declare-const $t@436@01 $Snap)
(assert (= $t@436@01 $Snap.unit))
; [eval] _12$snapshot$2 == _12$snapshot$0
(assert (= _12$snapshot$2@11@01 _12$snapshot$0@9@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _14$snapshot$2 == _14$snapshot$0
(declare-const $t@437@01 $Snap)
(assert (= $t@437@01 $Snap.unit))
; [eval] _14$snapshot$2 == _14$snapshot$0
(assert (= _14$snapshot$2@18@01 _14$snapshot$0@16@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _15$snapshot$2 == _15$snapshot$0
(declare-const $t@438@01 $Snap)
(assert (= $t@438@01 $Snap.unit))
; [eval] _15$snapshot$2 == _15$snapshot$0
(assert (= _15$snapshot$2@23@01 _15$snapshot$0@21@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _16$snapshot$2 == _16$snapshot$0
(declare-const $t@439@01 $Snap)
(assert (= $t@439@01 $Snap.unit))
; [eval] _16$snapshot$2 == _16$snapshot$0
(assert (= _16$snapshot$2@28@01 _16$snapshot$0@26@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _19$snapshot$2 == _19$snapshot$0
(declare-const $t@440@01 $Snap)
(assert (= $t@440@01 $Snap.unit))
; [eval] _19$snapshot$2 == _19$snapshot$0
(assert (= _19$snapshot$2@37@01 _19$snapshot$0@35@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _2$snapshot$2 == _2$snapshot$1
(declare-const $t@441@01 $Snap)
(assert (= $t@441@01 $Snap.unit))
; [eval] _2$snapshot$2 == _2$snapshot$1
(assert (= _2$snapshot$2@42@01 _2$snapshot$1@41@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _20$snapshot$2 == _20$snapshot$0
(declare-const $t@442@01 $Snap)
(assert (= $t@442@01 $Snap.unit))
; [eval] _20$snapshot$2 == _20$snapshot$0
(assert (= _20$snapshot$2@47@01 _20$snapshot$0@45@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _21$snapshot$2 == _21$snapshot$0
(declare-const $t@443@01 $Snap)
(assert (= $t@443@01 $Snap.unit))
; [eval] _21$snapshot$2 == _21$snapshot$0
(assert (= _21$snapshot$2@52@01 _21$snapshot$0@50@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _22$snapshot$2 == _22$snapshot$0
(declare-const $t@444@01 $Snap)
(assert (= $t@444@01 $Snap.unit))
; [eval] _22$snapshot$2 == _22$snapshot$0
(assert (= _22$snapshot$2@57@01 _22$snapshot$0@55@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _23$snapshot$2 == _23$snapshot$0
(declare-const $t@445@01 $Snap)
(assert (= $t@445@01 $Snap.unit))
; [eval] _23$snapshot$2 == _23$snapshot$0
(assert (= _23$snapshot$2@62@01 _23$snapshot$0@60@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _24$snapshot$2 == _24$snapshot$0
(declare-const $t@446@01 $Snap)
(assert (= $t@446@01 $Snap.unit))
; [eval] _24$snapshot$2 == _24$snapshot$0
(assert (= _24$snapshot$2@67@01 _24$snapshot$0@65@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _25$snapshot$2 == _25$snapshot$0
(declare-const $t@447@01 $Snap)
(assert (= $t@447@01 $Snap.unit))
; [eval] _25$snapshot$2 == _25$snapshot$0
(assert (= _25$snapshot$2@72@01 _25$snapshot$0@70@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _26$snapshot$2 == _26$snapshot$0
(declare-const $t@448@01 $Snap)
(assert (= $t@448@01 $Snap.unit))
; [eval] _26$snapshot$2 == _26$snapshot$0
(assert (= _26$snapshot$2@77@01 _26$snapshot$0@75@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _6$snapshot$2 == _6$snapshot$1
(declare-const $t@449@01 $Snap)
(assert (= $t@449@01 $Snap.unit))
; [eval] _6$snapshot$2 == _6$snapshot$1
(assert (= _6$snapshot$2@91@01 _6$snapshot$1@90@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _7$snapshot$2 == _7$snapshot$0
(declare-const $t@450@01 $Snap)
(assert (= $t@450@01 $Snap.unit))
; [eval] _7$snapshot$2 == _7$snapshot$0
(assert (= _7$snapshot$2@96@01 _7$snapshot$0@94@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _8$snapshot$2 == _8$snapshot$0
(declare-const $t@451@01 $Snap)
(assert (= $t@451@01 $Snap.unit))
; [eval] _8$snapshot$2 == _8$snapshot$0
(assert (= _8$snapshot$2@101@01 _8$snapshot$0@99@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _9$snapshot$2 == _9$snapshot$0
(declare-const $t@452@01 $Snap)
(assert (= $t@452@01 $Snap.unit))
; [eval] _9$snapshot$2 == _9$snapshot$0
(assert (= _9$snapshot$2@106@01 _9$snapshot$0@104@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale lft_function_call_1$snapshot$2 == lft_function_call_1$snapshot$1
(declare-const $t@453@01 $Snap)
(assert (= $t@453@01 $Snap.unit))
; [eval] lft_function_call_1$snapshot$2 == lft_function_call_1$snapshot$1
(assert (= lft_function_call_1$snapshot$2@136@01 lft@161@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale lft_function_call_2$snapshot$2 == lft_function_call_2$snapshot$0
(declare-const $t@454@01 $Snap)
(assert (= $t@454@01 $Snap.unit))
; [eval] lft_function_call_2$snapshot$2 == lft_function_call_2$snapshot$0
(assert (= lft_function_call_2$snapshot$2@140@01 lft_function_call_2$snapshot$0@138@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; label label_bb15
; [exec]
; label_bb15$marker := true
; [exec]
; inhale basic_block_marker$label_bb15$marker()
(declare-const $t@455@01 $Snap)
(assert (= $t@455@01 $Snap.unit))
; [eval] basic_block_marker$label_bb15$marker()
(assert (as basic_block_marker$label_bb15$marker<Bool>  Bool))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; label resume_panic_label
; [exec]
; resume_panic_label$marker := true
; [exec]
; inhale basic_block_marker$resume_panic_label$marker()
(declare-const $t@456@01 $Snap)
(assert (= $t@456@01 $Snap.unit))
; [eval] basic_block_marker$resume_panic_label$marker()
(assert (as basic_block_marker$resume_panic_label$marker<Bool>  Bool))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; label label__from__resume_panic_label__to__end_label
; [exec]
; inhale _0$snapshot$2 == _0$snapshot$0
(declare-const $t@457@01 $Snap)
(assert (= $t@457@01 $Snap.unit))
; [eval] _0$snapshot$2 == _0$snapshot$0
(assert (= _0$snapshot$2@3@01 _0$snapshot$0@1@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _12$snapshot$3 == _12$snapshot$2
(declare-const $t@458@01 $Snap)
(assert (= $t@458@01 $Snap.unit))
; [eval] _12$snapshot$3 == _12$snapshot$2
(assert (= _12$snapshot$3@12@01 _12$snapshot$2@11@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _14$snapshot$3 == _14$snapshot$2
(declare-const $t@459@01 $Snap)
(assert (= $t@459@01 $Snap.unit))
; [eval] _14$snapshot$3 == _14$snapshot$2
(assert (= _14$snapshot$3@19@01 _14$snapshot$2@18@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _15$snapshot$3 == _15$snapshot$2
(declare-const $t@460@01 $Snap)
(assert (= $t@460@01 $Snap.unit))
; [eval] _15$snapshot$3 == _15$snapshot$2
(assert (= _15$snapshot$3@24@01 _15$snapshot$2@23@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _16$snapshot$3 == _16$snapshot$2
(declare-const $t@461@01 $Snap)
(assert (= $t@461@01 $Snap.unit))
; [eval] _16$snapshot$3 == _16$snapshot$2
(assert (= _16$snapshot$3@29@01 _16$snapshot$2@28@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _18$snapshot$2 == _18$snapshot$0
(declare-const $t@462@01 $Snap)
(assert (= $t@462@01 $Snap.unit))
; [eval] _18$snapshot$2 == _18$snapshot$0
(assert (= _18$snapshot$2@33@01 _18$snapshot$0@31@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _19$snapshot$3 == _19$snapshot$2
(declare-const $t@463@01 $Snap)
(assert (= $t@463@01 $Snap.unit))
; [eval] _19$snapshot$3 == _19$snapshot$2
(assert (= _19$snapshot$3@38@01 _19$snapshot$2@37@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _2$snapshot$3 == _2$snapshot$2
(declare-const $t@464@01 $Snap)
(assert (= $t@464@01 $Snap.unit))
; [eval] _2$snapshot$3 == _2$snapshot$2
(assert (= _2$snapshot$3@43@01 _2$snapshot$2@42@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _20$snapshot$3 == _20$snapshot$2
(declare-const $t@465@01 $Snap)
(assert (= $t@465@01 $Snap.unit))
; [eval] _20$snapshot$3 == _20$snapshot$2
(assert (= _20$snapshot$3@48@01 _20$snapshot$2@47@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _21$snapshot$3 == _21$snapshot$2
(declare-const $t@466@01 $Snap)
(assert (= $t@466@01 $Snap.unit))
; [eval] _21$snapshot$3 == _21$snapshot$2
(assert (= _21$snapshot$3@53@01 _21$snapshot$2@52@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _22$snapshot$3 == _22$snapshot$2
(declare-const $t@467@01 $Snap)
(assert (= $t@467@01 $Snap.unit))
; [eval] _22$snapshot$3 == _22$snapshot$2
(assert (= _22$snapshot$3@58@01 _22$snapshot$2@57@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _23$snapshot$3 == _23$snapshot$2
(declare-const $t@468@01 $Snap)
(assert (= $t@468@01 $Snap.unit))
; [eval] _23$snapshot$3 == _23$snapshot$2
(assert (= _23$snapshot$3@63@01 _23$snapshot$2@62@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _24$snapshot$3 == _24$snapshot$2
(declare-const $t@469@01 $Snap)
(assert (= $t@469@01 $Snap.unit))
; [eval] _24$snapshot$3 == _24$snapshot$2
(assert (= _24$snapshot$3@68@01 _24$snapshot$2@67@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _25$snapshot$3 == _25$snapshot$2
(declare-const $t@470@01 $Snap)
(assert (= $t@470@01 $Snap.unit))
; [eval] _25$snapshot$3 == _25$snapshot$2
(assert (= _25$snapshot$3@73@01 _25$snapshot$2@72@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _26$snapshot$3 == _26$snapshot$2
(declare-const $t@471@01 $Snap)
(assert (= $t@471@01 $Snap.unit))
; [eval] _26$snapshot$3 == _26$snapshot$2
(assert (= _26$snapshot$3@78@01 _26$snapshot$2@77@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _6$snapshot$3 == _6$snapshot$2
(declare-const $t@472@01 $Snap)
(assert (= $t@472@01 $Snap.unit))
; [eval] _6$snapshot$3 == _6$snapshot$2
(assert (= _6$snapshot$3@92@01 _6$snapshot$2@91@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _7$snapshot$3 == _7$snapshot$2
(declare-const $t@473@01 $Snap)
(assert (= $t@473@01 $Snap.unit))
; [eval] _7$snapshot$3 == _7$snapshot$2
(assert (= _7$snapshot$3@97@01 _7$snapshot$2@96@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _8$snapshot$3 == _8$snapshot$2
(declare-const $t@474@01 $Snap)
(assert (= $t@474@01 $Snap.unit))
; [eval] _8$snapshot$3 == _8$snapshot$2
(assert (= _8$snapshot$3@102@01 _8$snapshot$2@101@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale _9$snapshot$3 == _9$snapshot$2
(declare-const $t@475@01 $Snap)
(assert (= $t@475@01 $Snap.unit))
; [eval] _9$snapshot$3 == _9$snapshot$2
(assert (= _9$snapshot$3@107@01 _9$snapshot$2@106@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale lft_function_call_1$snapshot$3 == lft_function_call_1$snapshot$2
(declare-const $t@476@01 $Snap)
(assert (= $t@476@01 $Snap.unit))
; [eval] lft_function_call_1$snapshot$3 == lft_function_call_1$snapshot$2
(assert (= lft_function_call_1$snapshot$3@137@01 lft_function_call_1$snapshot$2@136@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale lft_function_call_2$snapshot$3 == lft_function_call_2$snapshot$2
(declare-const $t@477@01 $Snap)
(assert (= $t@477@01 $Snap.unit))
; [eval] lft_function_call_2$snapshot$3 == lft_function_call_2$snapshot$2
(assert (= lft_function_call_2$snapshot$3@141@01 lft_function_call_2$snapshot$2@140@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; label end_label
; [exec]
; end_label$marker := true
; [exec]
; inhale basic_block_marker$end_label$marker()
(declare-const $t@478@01 $Snap)
(assert (= $t@478@01 $Snap.unit))
; [eval] basic_block_marker$end_label$marker()
(assert (as basic_block_marker$end_label$marker<Bool>  Bool))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; label end_of_method
(pop) ; 5
; [eval] !!tmp$1
; [eval] !tmp$1
; [then-branch: 19 | tmp$1@147@01 | dead]
; [else-branch: 19 | !(tmp$1@147@01) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 19 | !(tmp$1@147@01)]
(pop) ; 5
(pop) ; 4
(push) ; 4
; [else-branch: 17 | tmp$1@147@01]
(assert tmp$1@147@01)
(pop) ; 4
(pop) ; 3
; [eval] !!destructor$Snap$Bool$$value(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(_4$snapshot$1))
; [eval] !destructor$Snap$Bool$$value(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(_4$snapshot$1))
; [eval] destructor$Snap$Bool$$value(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(_4$snapshot$1))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(_4$snapshot$1)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (destructor$Snap$Bool$$value<Bool> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> _4$snapshot$1@85@01)))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; [then-branch: 20 | destructor$Snap$Bool$$value[Bool](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](_4$snapshot$1@85@01)) | dead]
; [else-branch: 20 | !(destructor$Snap$Bool$$value[Bool](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](_4$snapshot$1@85@01))) | live]
(set-option :timeout 0)
(push) ; 3
; [else-branch: 20 | !(destructor$Snap$Bool$$value[Bool](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](_4$snapshot$1@85@01)))]
(assert (not
  (destructor$Snap$Bool$$value<Bool> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> _4$snapshot$1@85@01))))
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- assign$Bool$BinaryOp$And$Move$Bool$Move$Bool$$$$ ----------
(declare-const target_place@479@01 Place)
(declare-const target_address@480@01 Address)
(declare-const operand1_place@481@01 Place)
(declare-const operand1_root_address@482@01 Address)
(declare-const operand1_value@483@01 Snap$Bool)
(declare-const operand2_place@484@01 Place)
(declare-const operand2_root_address@485@01 Address)
(declare-const operand2_value@486@01 Snap$Bool)
(declare-const result_value@487@01 Snap$Bool)
(declare-const target_place@488@01 Place)
(declare-const target_address@489@01 Address)
(declare-const operand1_place@490@01 Place)
(declare-const operand1_root_address@491@01 Address)
(declare-const operand1_value@492@01 Snap$Bool)
(declare-const operand2_place@493@01 Place)
(declare-const operand2_root_address@494@01 Address)
(declare-const operand2_value@495@01 Snap$Bool)
(declare-const result_value@496@01 Snap$Bool)
(push) ; 1
(declare-const $t@497@01 $Snap)
(assert (= $t@497@01 ($Snap.combine ($Snap.first $t@497@01) ($Snap.second $t@497@01))))
; [eval] compute_address(target_place, target_address)
; [eval] Size$Bool$()
(assert (=
  ($Snap.second $t@497@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@497@01))
    ($Snap.second ($Snap.second $t@497@01)))))
(assert (=
  ($Snap.second ($Snap.second $t@497@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@497@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@497@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@497@01))) $Snap.unit))
; [eval] valid$Snap$Bool(operand1_value)
(assert (valid$Snap$Bool<Bool> operand1_value@492@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@497@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@497@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@497@01)))))))
(push) ; 2
(set-option :timeout 10)
(assert (not (and
  (= operand1_place@490@01 operand2_place@493@01)
  (= operand1_root_address@491@01 operand2_root_address@494@01)
  (= operand1_value@492@01 operand2_value@495@01))))
(check-sat)
; unknown
(pop) ; 2
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@497@01))))
  $Snap.unit))
; [eval] valid$Snap$Bool(operand2_value)
(assert (valid$Snap$Bool<Bool> operand2_value@495@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@498@01 $Snap)
(assert (= $t@498@01 ($Snap.combine ($Snap.first $t@498@01) ($Snap.second $t@498@01))))
(assert (=
  ($Snap.second $t@498@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@498@01))
    ($Snap.second ($Snap.second $t@498@01)))))
; [eval] compute_address(operand1_place, operand1_root_address)
; [eval] Size$Bool$()
(assert (=
  ($Snap.second ($Snap.second $t@498@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@498@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@498@01))))))
; [eval] compute_address(operand2_place, operand2_root_address)
; [eval] Size$Bool$()
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> operand1_place@490@01 operand1_root_address@491@01)
  (compute_address<Address> operand2_place@493@01 operand2_root_address@494@01))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@498@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@498@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@498@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@498@01))))
  $Snap.unit))
; [eval] result_value == constructor$Snap$Bool$And_Bool(operand1_value, operand2_value)
; [eval] constructor$Snap$Bool$And_Bool(operand1_value, operand2_value)
(assert (=
  result_value@496@01
  (constructor$Snap$Bool$And_Bool<Snap$Bool> operand1_value@492@01 operand2_value@495@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@498@01))))
  $Snap.unit))
; [eval] valid$Snap$Bool(result_value)
(assert (valid$Snap$Bool<Bool> result_value@496@01))
(pop) ; 2
(set-option :timeout 0)
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- assign$Bool$BinaryOp$EqCmp$Constant$I64$Constant$I64$$$$ ----------
(declare-const target_place@499@01 Place)
(declare-const target_address@500@01 Address)
(declare-const operand1_value@501@01 Snap$I64)
(declare-const operand2_value@502@01 Snap$I64)
(declare-const result_value@503@01 Snap$Bool)
(declare-const target_place@504@01 Place)
(declare-const target_address@505@01 Address)
(declare-const operand1_value@506@01 Snap$I64)
(declare-const operand2_value@507@01 Snap$I64)
(declare-const result_value@508@01 Snap$Bool)
(push) ; 1
(declare-const $t@509@01 $Snap)
(assert (= $t@509@01 ($Snap.combine ($Snap.first $t@509@01) ($Snap.second $t@509@01))))
; [eval] compute_address(target_place, target_address)
; [eval] Size$Bool$()
(assert (=
  ($Snap.second $t@509@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@509@01))
    ($Snap.second ($Snap.second $t@509@01)))))
(assert (= ($Snap.first ($Snap.second $t@509@01)) $Snap.unit))
; [eval] valid$Snap$I64(operand1_value)
(assert (valid$Snap$I64<Bool> operand1_value@506@01))
(assert (= ($Snap.second ($Snap.second $t@509@01)) $Snap.unit))
; [eval] valid$Snap$I64(operand2_value)
(assert (valid$Snap$I64<Bool> operand2_value@507@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@510@01 $Snap)
(assert (= $t@510@01 ($Snap.combine ($Snap.first $t@510@01) ($Snap.second $t@510@01))))
(assert (=
  ($Snap.second $t@510@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@510@01))
    ($Snap.second ($Snap.second $t@510@01)))))
(assert (= ($Snap.first ($Snap.second $t@510@01)) $Snap.unit))
; [eval] result_value == constructor$Snap$Bool$EqCmp_I64(operand1_value, operand2_value)
; [eval] constructor$Snap$Bool$EqCmp_I64(operand1_value, operand2_value)
(assert (=
  result_value@508@01
  (constructor$Snap$Bool$EqCmp_I64<Snap$Bool> operand1_value@506@01 operand2_value@507@01)))
(assert (= ($Snap.second ($Snap.second $t@510@01)) $Snap.unit))
; [eval] valid$Snap$Bool(result_value)
(assert (valid$Snap$Bool<Bool> result_value@508@01))
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- assign$Bool$BinaryOp$EqCmp$Copy$I64$Constant$I64$$$$ ----------
(declare-const target_place@511@01 Place)
(declare-const target_address@512@01 Address)
(declare-const operand1_place@513@01 Place)
(declare-const operand1_root_address@514@01 Address)
(declare-const operand1_value@515@01 Snap$I64)
(declare-const operand2_value@516@01 Snap$I64)
(declare-const result_value@517@01 Snap$Bool)
(declare-const target_place@518@01 Place)
(declare-const target_address@519@01 Address)
(declare-const operand1_place@520@01 Place)
(declare-const operand1_root_address@521@01 Address)
(declare-const operand1_value@522@01 Snap$I64)
(declare-const operand2_value@523@01 Snap$I64)
(declare-const result_value@524@01 Snap$Bool)
(push) ; 1
(declare-const $t@525@01 $Snap)
(assert (= $t@525@01 ($Snap.combine ($Snap.first $t@525@01) ($Snap.second $t@525@01))))
; [eval] compute_address(target_place, target_address)
; [eval] Size$Bool$()
(assert (=
  ($Snap.second $t@525@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@525@01))
    ($Snap.second ($Snap.second $t@525@01)))))
(assert (=
  ($Snap.second ($Snap.second $t@525@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@525@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@525@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@525@01))) $Snap.unit))
; [eval] valid$Snap$I64(operand1_value)
(assert (valid$Snap$I64<Bool> operand1_value@522@01))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@525@01))) $Snap.unit))
; [eval] valid$Snap$I64(operand2_value)
(assert (valid$Snap$I64<Bool> operand2_value@523@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@526@01 $Snap)
(assert (= $t@526@01 ($Snap.combine ($Snap.first $t@526@01) ($Snap.second $t@526@01))))
(assert (=
  ($Snap.second $t@526@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@526@01))
    ($Snap.second ($Snap.second $t@526@01)))))
(assert (=
  ($Snap.second ($Snap.second $t@526@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@526@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@526@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@526@01))) $Snap.unit))
; [eval] result_value == constructor$Snap$Bool$EqCmp_I64(operand1_value, operand2_value)
; [eval] constructor$Snap$Bool$EqCmp_I64(operand1_value, operand2_value)
(assert (=
  result_value@524@01
  (constructor$Snap$Bool$EqCmp_I64<Snap$Bool> operand1_value@522@01 operand2_value@523@01)))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@526@01))) $Snap.unit))
; [eval] valid$Snap$Bool(result_value)
(assert (valid$Snap$Bool<Bool> result_value@524@01))
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- assign$Bool$BinaryOp$EqCmp$Move$I64$Constant$I64$$$$ ----------
(declare-const target_place@527@01 Place)
(declare-const target_address@528@01 Address)
(declare-const operand1_place@529@01 Place)
(declare-const operand1_root_address@530@01 Address)
(declare-const operand1_value@531@01 Snap$I64)
(declare-const operand2_value@532@01 Snap$I64)
(declare-const result_value@533@01 Snap$Bool)
(declare-const target_place@534@01 Place)
(declare-const target_address@535@01 Address)
(declare-const operand1_place@536@01 Place)
(declare-const operand1_root_address@537@01 Address)
(declare-const operand1_value@538@01 Snap$I64)
(declare-const operand2_value@539@01 Snap$I64)
(declare-const result_value@540@01 Snap$Bool)
(push) ; 1
(declare-const $t@541@01 $Snap)
(assert (= $t@541@01 ($Snap.combine ($Snap.first $t@541@01) ($Snap.second $t@541@01))))
; [eval] compute_address(target_place, target_address)
; [eval] Size$Bool$()
(assert (=
  ($Snap.second $t@541@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@541@01))
    ($Snap.second ($Snap.second $t@541@01)))))
(assert (=
  ($Snap.second ($Snap.second $t@541@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@541@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@541@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@541@01))) $Snap.unit))
; [eval] valid$Snap$I64(operand1_value)
(assert (valid$Snap$I64<Bool> operand1_value@538@01))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@541@01))) $Snap.unit))
; [eval] valid$Snap$I64(operand2_value)
(assert (valid$Snap$I64<Bool> operand2_value@539@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@542@01 $Snap)
(assert (= $t@542@01 ($Snap.combine ($Snap.first $t@542@01) ($Snap.second $t@542@01))))
(assert (=
  ($Snap.second $t@542@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@542@01))
    ($Snap.second ($Snap.second $t@542@01)))))
; [eval] compute_address(operand1_place, operand1_root_address)
; [eval] Size$I64$()
(assert (=
  ($Snap.second ($Snap.second $t@542@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@542@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@542@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@542@01))) $Snap.unit))
; [eval] result_value == constructor$Snap$Bool$EqCmp_I64(operand1_value, operand2_value)
; [eval] constructor$Snap$Bool$EqCmp_I64(operand1_value, operand2_value)
(assert (=
  result_value@540@01
  (constructor$Snap$Bool$EqCmp_I64<Snap$Bool> operand1_value@538@01 operand2_value@539@01)))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@542@01))) $Snap.unit))
; [eval] valid$Snap$Bool(result_value)
(assert (valid$Snap$Bool<Bool> result_value@540@01))
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- assign$Bool$UnaryOp$Not$Move$Bool$$$$ ----------
(declare-const target_place@543@01 Place)
(declare-const target_address@544@01 Address)
(declare-const operand1_place@545@01 Place)
(declare-const operand1_root_address@546@01 Address)
(declare-const operand1_value@547@01 Snap$Bool)
(declare-const result_value@548@01 Snap$Bool)
(declare-const target_place@549@01 Place)
(declare-const target_address@550@01 Address)
(declare-const operand1_place@551@01 Place)
(declare-const operand1_root_address@552@01 Address)
(declare-const operand1_value@553@01 Snap$Bool)
(declare-const result_value@554@01 Snap$Bool)
(push) ; 1
(declare-const $t@555@01 $Snap)
(assert (= $t@555@01 ($Snap.combine ($Snap.first $t@555@01) ($Snap.second $t@555@01))))
; [eval] compute_address(target_place, target_address)
; [eval] Size$Bool$()
(assert (=
  ($Snap.second $t@555@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@555@01))
    ($Snap.second ($Snap.second $t@555@01)))))
(assert (= ($Snap.second ($Snap.second $t@555@01)) $Snap.unit))
; [eval] valid$Snap$Bool(operand1_value)
(assert (valid$Snap$Bool<Bool> operand1_value@553@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@556@01 $Snap)
(assert (= $t@556@01 ($Snap.combine ($Snap.first $t@556@01) ($Snap.second $t@556@01))))
(assert (=
  ($Snap.second $t@556@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@556@01))
    ($Snap.second ($Snap.second $t@556@01)))))
; [eval] compute_address(operand1_place, operand1_root_address)
; [eval] Size$Bool$()
(assert (=
  ($Snap.second ($Snap.second $t@556@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@556@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@556@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@556@01))) $Snap.unit))
; [eval] result_value == constructor$Snap$Bool$Not_Bool(operand1_value)
; [eval] constructor$Snap$Bool$Not_Bool(operand1_value)
(assert (=
  result_value@554@01
  (constructor$Snap$Bool$Not_Bool<Snap$Bool> operand1_value@553@01)))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@556@01))) $Snap.unit))
; [eval] valid$Snap$Bool(result_value)
(assert (valid$Snap$Bool<Bool> result_value@554@01))
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- assign$I64$BinaryOp$Mod$Move$I64$Constant$I64$$$$ ----------
(declare-const target_place@557@01 Place)
(declare-const target_address@558@01 Address)
(declare-const operand1_place@559@01 Place)
(declare-const operand1_root_address@560@01 Address)
(declare-const operand1_value@561@01 Snap$I64)
(declare-const operand2_value@562@01 Snap$I64)
(declare-const result_value@563@01 Snap$I64)
(declare-const target_place@564@01 Place)
(declare-const target_address@565@01 Address)
(declare-const operand1_place@566@01 Place)
(declare-const operand1_root_address@567@01 Address)
(declare-const operand1_value@568@01 Snap$I64)
(declare-const operand2_value@569@01 Snap$I64)
(declare-const result_value@570@01 Snap$I64)
(push) ; 1
(declare-const $t@571@01 $Snap)
(assert (= $t@571@01 ($Snap.combine ($Snap.first $t@571@01) ($Snap.second $t@571@01))))
; [eval] compute_address(target_place, target_address)
; [eval] Size$I64$()
(assert (=
  ($Snap.second $t@571@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@571@01))
    ($Snap.second ($Snap.second $t@571@01)))))
(assert (=
  ($Snap.second ($Snap.second $t@571@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@571@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@571@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@571@01))) $Snap.unit))
; [eval] valid$Snap$I64(operand1_value)
(assert (valid$Snap$I64<Bool> operand1_value@568@01))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@571@01))) $Snap.unit))
; [eval] valid$Snap$I64(operand2_value)
(assert (valid$Snap$I64<Bool> operand2_value@569@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@572@01 $Snap)
(assert (= $t@572@01 ($Snap.combine ($Snap.first $t@572@01) ($Snap.second $t@572@01))))
(assert (=
  ($Snap.second $t@572@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@572@01))
    ($Snap.second ($Snap.second $t@572@01)))))
; [eval] compute_address(operand1_place, operand1_root_address)
; [eval] Size$I64$()
(assert (=
  ($Snap.second ($Snap.second $t@572@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@572@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@572@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@572@01))) $Snap.unit))
; [eval] result_value == constructor$Snap$I64$Mod_I64(operand1_value, operand2_value)
; [eval] constructor$Snap$I64$Mod_I64(operand1_value, operand2_value)
(assert (=
  result_value@570@01
  (constructor$Snap$I64$Mod_I64<Snap$I64> operand1_value@568@01 operand2_value@569@01)))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@572@01))) $Snap.unit))
; [eval] valid$Snap$I64(result_value)
(assert (valid$Snap$I64<Bool> result_value@570@01))
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- assign$Tuple$$I64$Bool$$I64$Bool$$CheckedBinaryOp$Mul$Constant$I64$Copy$I64$$$$ ----------
(declare-const target_place@573@01 Place)
(declare-const target_address@574@01 Address)
(declare-const operand1_value@575@01 Snap$I64)
(declare-const operand2_place@576@01 Place)
(declare-const operand2_root_address@577@01 Address)
(declare-const operand2_value@578@01 Snap$I64)
(declare-const result_value@579@01 Snap$Tuple$$I64$Bool$$I64$Bool$)
(declare-const target_place@580@01 Place)
(declare-const target_address@581@01 Address)
(declare-const operand1_value@582@01 Snap$I64)
(declare-const operand2_place@583@01 Place)
(declare-const operand2_root_address@584@01 Address)
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
(assert (= ($Snap.first ($Snap.second $t@587@01)) $Snap.unit))
; [eval] valid$Snap$I64(operand1_value)
(assert (valid$Snap$I64<Bool> operand1_value@582@01))
(assert (=
  ($Snap.second ($Snap.second $t@587@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@587@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@587@01))))))
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
; [eval] valid$Snap$I64(constructor$Snap$I64$Mul_I64(operand1_value, operand2_value)) ==> destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(result_value) == constructor$Snap$I64$Mul_I64(operand1_value, operand2_value)
; [eval] valid$Snap$I64(constructor$Snap$I64$Mul_I64(operand1_value, operand2_value))
; [eval] constructor$Snap$I64$Mul_I64(operand1_value, operand2_value)
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (valid$Snap$I64<Bool> (constructor$Snap$I64$Mul_I64<Snap$I64> operand1_value@582@01 operand2_value@585@01)))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (valid$Snap$I64<Bool> (constructor$Snap$I64$Mul_I64<Snap$I64> operand1_value@582@01 operand2_value@585@01))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [then-branch: 21 | valid$Snap$I64[Bool](constructor$Snap$I64$Mul_I64[Snap$I64](operand1_value@582@01, operand2_value@585@01)) | live]
; [else-branch: 21 | !(valid$Snap$I64[Bool](constructor$Snap$I64$Mul_I64[Snap$I64](operand1_value@582@01, operand2_value@585@01))) | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 21 | valid$Snap$I64[Bool](constructor$Snap$I64$Mul_I64[Snap$I64](operand1_value@582@01, operand2_value@585@01))]
(assert (valid$Snap$I64<Bool> (constructor$Snap$I64$Mul_I64<Snap$I64> operand1_value@582@01 operand2_value@585@01)))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(result_value) == constructor$Snap$I64$Mul_I64(operand1_value, operand2_value)
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(result_value)
; [eval] constructor$Snap$I64$Mul_I64(operand1_value, operand2_value)
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (valid$Snap$I64<Bool> (constructor$Snap$I64$Mul_I64<Snap$I64> operand1_value@582@01 operand2_value@585@01)))
(assert (=>
  (valid$Snap$I64<Bool> (constructor$Snap$I64$Mul_I64<Snap$I64> operand1_value@582@01 operand2_value@585@01))
  (=
    (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> result_value@586@01)
    (constructor$Snap$I64$Mul_I64<Snap$I64> operand1_value@582@01 operand2_value@585@01))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@588@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@588@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@588@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@588@01))))))
  $Snap.unit))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(result_value) == constructor$Snap$Bool$(!valid$Snap$I64(constructor$Snap$I64$Mul_I64(operand1_value, operand2_value)))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(result_value)
; [eval] constructor$Snap$Bool$(!valid$Snap$I64(constructor$Snap$I64$Mul_I64(operand1_value, operand2_value)))
; [eval] !valid$Snap$I64(constructor$Snap$I64$Mul_I64(operand1_value, operand2_value))
; [eval] valid$Snap$I64(constructor$Snap$I64$Mul_I64(operand1_value, operand2_value))
; [eval] constructor$Snap$I64$Mul_I64(operand1_value, operand2_value)
(assert (=
  (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> result_value@586@01)
  (constructor$Snap$Bool$<Snap$Bool> (not
    (valid$Snap$I64<Bool> (constructor$Snap$I64$Mul_I64<Snap$I64> operand1_value@582@01 operand2_value@585@01))))))
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
; ---------- consume$Move$Tuple$$$ ----------
(declare-const operand1_place@598@01 Place)
(declare-const operand1_root_address@599@01 Address)
(declare-const operand1_value@600@01 Snap$Tuple$$$)
(declare-const operand1_place@601@01 Place)
(declare-const operand1_root_address@602@01 Address)
(declare-const operand1_value@603@01 Snap$Tuple$$$)
(push) ; 1
(declare-const $t@604@01 $Snap)
(assert (= $t@604@01 ($Snap.combine ($Snap.first $t@604@01) ($Snap.second $t@604@01))))
(assert (= ($Snap.second $t@604@01) $Snap.unit))
; [eval] valid$Snap$Tuple$$$(operand1_value)
(assert (valid$Snap$Tuple$$$<Bool> operand1_value@603@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
; [eval] compute_address(operand1_place, operand1_root_address)
; [eval] Size$Tuple$$$$()
(declare-const $t@605@01 $Snap)
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- copy_place$I64 ----------
(declare-const target_place@606@01 Place)
(declare-const target_root_address@607@01 Address)
(declare-const source_place@608@01 Place)
(declare-const source_root_address@609@01 Address)
(declare-const source_snapshot@610@01 Snap$I64)
(declare-const source_permission_amount@611@01 $Perm)
(declare-const target_place@612@01 Place)
(declare-const target_root_address@613@01 Address)
(declare-const source_place@614@01 Place)
(declare-const source_root_address@615@01 Address)
(declare-const source_snapshot@616@01 Snap$I64)
(declare-const source_permission_amount@617@01 $Perm)
(push) ; 1
(declare-const $t@618@01 $Snap)
(assert (= $t@618@01 ($Snap.combine ($Snap.first $t@618@01) ($Snap.second $t@618@01))))
(assert (= ($Snap.first $t@618@01) $Snap.unit))
; [eval] none < source_permission_amount
(assert (< $Perm.No source_permission_amount@617@01))
(assert (=
  ($Snap.second $t@618@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@618@01))
    ($Snap.second ($Snap.second $t@618@01)))))
; [eval] compute_address(target_place, target_root_address)
; [eval] Size$I64$()
(push) ; 2
(assert (not (or
  (= source_permission_amount@617@01 $Perm.No)
  (< $Perm.No source_permission_amount@617@01))))
(check-sat)
; unsat
(pop) ; 2
; 0.00s
; (get-info :all-statistics)
(assert (<= $Perm.No source_permission_amount@617@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@619@01 $Snap)
(assert (= $t@619@01 ($Snap.combine ($Snap.first $t@619@01) ($Snap.second $t@619@01))))
(push) ; 3
(assert (not (or
  (= source_permission_amount@617@01 $Perm.No)
  (< $Perm.No source_permission_amount@617@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second $t@619@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@619@01))
    ($Snap.second ($Snap.second $t@619@01)))))
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (= source_place@614@01 target_place@612@01)
  (= source_root_address@615@01 target_root_address@613@01))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (= ($Snap.second ($Snap.second $t@619@01)) $Snap.unit))
; [eval] valid$Snap$I64(source_snapshot)
(assert (valid$Snap$I64<Bool> source_snapshot@616@01))
(pop) ; 2
(set-option :timeout 0)
(push) ; 2
; [exec]
; unfold acc(OwnedNonAliased$I64(source_place, source_root_address, source_snapshot), source_permission_amount)
(push) ; 3
(assert (not (< $Perm.No source_permission_amount@617@01)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No source_permission_amount@617@01)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second $t@618@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@618@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@618@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@618@01))) $Snap.unit))
; [eval] valid$Snap$I64(snapshot)
(assert (valid$Snap$I64<Bool> source_snapshot@616@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@618@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@618@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@618@01)))))))
; [eval] compute_address(place, root_address)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> target_place@612@01 target_root_address@613@01)
  (compute_address<Address> source_place@614@01 source_root_address@615@01))))
(check-sat)
; unknown
(pop) ; 3
; 0.01s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@618@01))))
  $Snap.unit))
; [eval] MemoryBlock$bytes(compute_address(place, root_address), Size$I64$()) == to_bytes$I64(snapshot)
; [eval] MemoryBlock$bytes(compute_address(place, root_address), Size$I64$())
; [eval] compute_address(place, root_address)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 3
(declare-const $k@620@01 $Perm)
(assert ($Perm.isReadVar $k@620@01))
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= source_permission_amount@617@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (< (* $k@620@01 source_permission_amount@617@01) source_permission_amount@617@01))
(assert (<=
  $Perm.No
  (-
    source_permission_amount@617@01
    (* $k@620@01 source_permission_amount@617@01))))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (* $k@620@01 source_permission_amount@617@01))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@618@01)))) (compute_address<Address> source_place@614@01 source_root_address@615@01) (as Size$I64$<Snap$Usize>  Snap$Usize)))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@620@01))
(assert (and
  (<
    (* $k@620@01 source_permission_amount@617@01)
    source_permission_amount@617@01)
  (<=
    $Perm.No
    (-
      source_permission_amount@617@01
      (* $k@620@01 source_permission_amount@617@01)))
  (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@618@01)))) (compute_address<Address> source_place@614@01 source_root_address@615@01) (as Size$I64$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$I64(snapshot)
(assert (=
  (MemoryBlock$bytes ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@618@01)))) (compute_address<Address> source_place@614@01 source_root_address@615@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
  (to_bytes$I64<Bytes> source_snapshot@616@01)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (OwnedNonAliased$I64%trigger ($Snap.second ($Snap.second $t@618@01)) source_place@614@01 source_root_address@615@01 source_snapshot@616@01))
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
  (= source_permission_amount@617@01 $Perm.No)
  (< $Perm.No source_permission_amount@617@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No source_permission_amount@617@01)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(declare-const $t@621@01 $Snap)
(assert (= $t@621@01 ($Snap.combine ($Snap.first $t@621@01) ($Snap.second $t@621@01))))
; [eval] Size$I64$()
(assert (=
  ($Snap.second $t@621@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@621@01))
    ($Snap.second ($Snap.second $t@621@01)))))
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 3
(assert (not (or
  (= source_permission_amount@617@01 $Perm.No)
  (< $Perm.No source_permission_amount@617@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> target_place@612@01 target_root_address@613@01)
  (compute_address<Address> source_place@614@01 source_root_address@615@01))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second $t@621@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@621@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@621@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@621@01))) $Snap.unit))
; [eval] MemoryBlock$bytes(source_address, Size$I64$()) == old(MemoryBlock$bytes(source_address, Size$I64$()))
; [eval] MemoryBlock$bytes(source_address, Size$I64$())
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 3
(declare-const $k@622@01 $Perm)
(assert ($Perm.isReadVar $k@622@01))
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= source_permission_amount@617@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (< $k@622@01 source_permission_amount@617@01))
(assert (<= $Perm.No (- source_permission_amount@617@01 $k@622@01)))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@622@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@621@01)) (compute_address<Address> source_place@614@01 source_root_address@615@01) (as Size$I64$<Snap$Usize>  Snap$Usize)))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@622@01))
(assert (and
  (< $k@622@01 source_permission_amount@617@01)
  (<= $Perm.No (- source_permission_amount@617@01 $k@622@01))
  (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@621@01)) (compute_address<Address> source_place@614@01 source_root_address@615@01) (as Size$I64$<Snap$Usize>  Snap$Usize))))
; [eval] old(MemoryBlock$bytes(source_address, Size$I64$()))
; [eval] MemoryBlock$bytes(source_address, Size$I64$())
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 3
(declare-const $k@623@01 $Perm)
(assert ($Perm.isReadVar $k@623@01))
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= source_permission_amount@617@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (< $k@623@01 source_permission_amount@617@01))
(assert (<= $Perm.No (- source_permission_amount@617@01 $k@623@01)))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@623@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@623@01))
(assert (and
  (< $k@623@01 source_permission_amount@617@01)
  (<= $Perm.No (- source_permission_amount@617@01 $k@623@01))))
(assert (=
  (MemoryBlock$bytes ($Snap.first ($Snap.second $t@621@01)) (compute_address<Address> source_place@614@01 source_root_address@615@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
  (MemoryBlock$bytes ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@618@01)))) (compute_address<Address> source_place@614@01 source_root_address@615@01) (as Size$I64$<Snap$Usize>  Snap$Usize))))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@621@01))) $Snap.unit))
; [eval] MemoryBlock$bytes(target_address, Size$I64$()) == MemoryBlock$bytes(source_address, Size$I64$())
; [eval] MemoryBlock$bytes(target_address, Size$I64$())
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 3
(declare-const $k@624@01 $Perm)
(assert ($Perm.isReadVar $k@624@01))
(assert (< $k@624@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@624@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@624@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first $t@621@01) (compute_address<Address> target_place@612@01 target_root_address@613@01) (as Size$I64$<Snap$Usize>  Snap$Usize)))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@624@01))
(assert (and
  (< $k@624@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@624@01))
  (MemoryBlock$bytes%precondition ($Snap.first $t@621@01) (compute_address<Address> target_place@612@01 target_root_address@613@01) (as Size$I64$<Snap$Usize>  Snap$Usize))))
; [eval] MemoryBlock$bytes(source_address, Size$I64$())
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 3
(declare-const $k@625@01 $Perm)
(assert ($Perm.isReadVar $k@625@01))
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= source_permission_amount@617@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (< $k@625@01 source_permission_amount@617@01))
(assert (<= $Perm.No (- source_permission_amount@617@01 $k@625@01)))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@625@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@625@01))
(assert (and
  (< $k@625@01 source_permission_amount@617@01)
  (<= $Perm.No (- source_permission_amount@617@01 $k@625@01))))
(assert (=
  (MemoryBlock$bytes ($Snap.first $t@621@01) (compute_address<Address> target_place@612@01 target_root_address@613@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
  (MemoryBlock$bytes ($Snap.first ($Snap.second $t@621@01)) (compute_address<Address> source_place@614@01 source_root_address@615@01) (as Size$I64$<Snap$Usize>  Snap$Usize))))
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
(declare-const $k@626@01 $Perm)
(assert ($Perm.isReadVar $k@626@01))
(assert (< $k@626@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@626@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@626@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@626@01))
(assert (and (< $k@626@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@626@01))))
; [eval] to_bytes$I64(snapshot)
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  (MemoryBlock$bytes ($Snap.first $t@621@01) (compute_address<Address> target_place@612@01 target_root_address@613@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
  (to_bytes$I64<Bytes> source_snapshot@616@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (=
  (MemoryBlock$bytes ($Snap.first $t@621@01) (compute_address<Address> target_place@612@01 target_root_address@613@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
  (to_bytes$I64<Bytes> source_snapshot@616@01)))
(assert (OwnedNonAliased$I64%trigger ($Snap.combine
  $Snap.unit
  ($Snap.combine ($Snap.first $t@621@01) $Snap.unit)) target_place@612@01 target_root_address@613@01 source_snapshot@616@01))
; [exec]
; fold acc(OwnedNonAliased$I64(source_place, source_root_address, source_snapshot), source_permission_amount)
(push) ; 3
(assert (not (< $Perm.No source_permission_amount@617@01)))
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
(assert (not (< $Perm.No source_permission_amount@617@01)))
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
(declare-const $k@627@01 $Perm)
(assert ($Perm.isReadVar $k@627@01))
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= source_permission_amount@617@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 4
; 0.01s
; (get-info :all-statistics)
(assert (< (* $k@627@01 source_permission_amount@617@01) source_permission_amount@617@01))
(assert (<=
  $Perm.No
  (-
    source_permission_amount@617@01
    (* $k@627@01 source_permission_amount@617@01))))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (* $k@627@01 source_permission_amount@617@01))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@627@01))
(assert (and
  (<
    (* $k@627@01 source_permission_amount@617@01)
    source_permission_amount@617@01)
  (<=
    $Perm.No
    (-
      source_permission_amount@617@01
      (* $k@627@01 source_permission_amount@617@01)))))
; [eval] to_bytes$I64(snapshot)
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  (MemoryBlock$bytes ($Snap.first ($Snap.second $t@621@01)) (compute_address<Address> source_place@614@01 source_root_address@615@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
  (to_bytes$I64<Bytes> source_snapshot@616@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (=
  (MemoryBlock$bytes ($Snap.first ($Snap.second $t@621@01)) (compute_address<Address> source_place@614@01 source_root_address@615@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
  (to_bytes$I64<Bytes> source_snapshot@616@01)))
(assert (OwnedNonAliased$I64%trigger ($Snap.combine
  $Snap.unit
  ($Snap.combine ($Snap.first ($Snap.second $t@621@01)) $Snap.unit)) source_place@614@01 source_root_address@615@01 source_snapshot@616@01))
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (= target_place@612@01 source_place@614@01)
  (= target_root_address@613@01 source_root_address@615@01))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(assert (not (or
  (= source_permission_amount@617@01 $Perm.No)
  (< $Perm.No source_permission_amount@617@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No source_permission_amount@617@01)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; [eval] valid$Snap$I64(source_snapshot)
(pop) ; 2
(pop) ; 1
; ---------- copy_place$Tuple$$$ ----------
(declare-const target_place@628@01 Place)
(declare-const target_root_address@629@01 Address)
(declare-const source_place@630@01 Place)
(declare-const source_root_address@631@01 Address)
(declare-const source_snapshot@632@01 Snap$Tuple$$$)
(declare-const source_permission_amount@633@01 $Perm)
(declare-const target_place@634@01 Place)
(declare-const target_root_address@635@01 Address)
(declare-const source_place@636@01 Place)
(declare-const source_root_address@637@01 Address)
(declare-const source_snapshot@638@01 Snap$Tuple$$$)
(declare-const source_permission_amount@639@01 $Perm)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@640@01 $Snap)
(assert (= $t@640@01 ($Snap.combine ($Snap.first $t@640@01) ($Snap.second $t@640@01))))
(assert (= ($Snap.first $t@640@01) $Snap.unit))
; [eval] none < source_permission_amount
(assert (< $Perm.No source_permission_amount@639@01))
(assert (=
  ($Snap.second $t@640@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@640@01))
    ($Snap.second ($Snap.second $t@640@01)))))
; [eval] compute_address(target_place, target_root_address)
; [eval] Size$Tuple$$$$()
(push) ; 2
(assert (not (or
  (= source_permission_amount@639@01 $Perm.No)
  (< $Perm.No source_permission_amount@639@01))))
(check-sat)
; unsat
(pop) ; 2
; 0.00s
; (get-info :all-statistics)
(assert (<= $Perm.No source_permission_amount@639@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@641@01 $Snap)
(assert (= $t@641@01 ($Snap.combine ($Snap.first $t@641@01) ($Snap.second $t@641@01))))
(push) ; 3
(assert (not (or
  (= source_permission_amount@639@01 $Perm.No)
  (< $Perm.No source_permission_amount@639@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second $t@641@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@641@01))
    ($Snap.second ($Snap.second $t@641@01)))))
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (= source_place@636@01 target_place@634@01)
  (= source_root_address@637@01 target_root_address@635@01))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (= ($Snap.second ($Snap.second $t@641@01)) $Snap.unit))
; [eval] valid$Snap$Tuple$$$(source_snapshot)
(assert (valid$Snap$Tuple$$$<Bool> source_snapshot@638@01))
(pop) ; 2
(set-option :timeout 0)
(push) ; 2
; [exec]
; unfold acc(OwnedNonAliased$Tuple$$$(source_place, source_root_address, source_snapshot), source_permission_amount)
(push) ; 3
(assert (not (< $Perm.No source_permission_amount@639@01)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No source_permission_amount@639@01)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second $t@640@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@640@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@640@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@640@01))) $Snap.unit))
; [eval] valid$Snap$Tuple$$$(snapshot)
(assert (valid$Snap$Tuple$$$<Bool> source_snapshot@638@01))
; [eval] compute_address(place, root_address)
; [eval] PaddingSize$Tuple$$$$()
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (=
    (compute_address<Address> target_place@634@01 target_root_address@635@01)
    (compute_address<Address> source_place@636@01 source_root_address@637@01))
  (=
    (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)
    (as PaddingSize$Tuple$$$$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (OwnedNonAliased$Tuple$$$%trigger ($Snap.second ($Snap.second $t@640@01)) source_place@636@01 source_root_address@637@01 source_snapshot@638@01))
; [exec]
; memory_block_split$Tuple$$$(compute_address(target_place, target_root_address),
;   write)
; [eval] compute_address(target_place, target_root_address)
; [eval] none < permission_amount
; [eval] Size$Tuple$$$$()
(declare-const $t@642@01 $Snap)
(assert (= $t@642@01 ($Snap.combine ($Snap.first $t@642@01) ($Snap.second $t@642@01))))
; [eval] PaddingSize$Tuple$$$$()
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> source_place@636@01 source_root_address@637@01)
  (compute_address<Address> target_place@634@01 target_root_address@635@01))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (= ($Snap.second $t@642@01) $Snap.unit))
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
  ($Snap.first $t@642@01)) target_place@634@01 target_root_address@635@01 source_snapshot@638@01))
; [exec]
; fold acc(OwnedNonAliased$Tuple$$$(source_place, source_root_address, source_snapshot), source_permission_amount)
(set-option :timeout 0)
(push) ; 3
(assert (not (< $Perm.No source_permission_amount@639@01)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; [eval] valid$Snap$Tuple$$$(snapshot)
; [eval] compute_address(place, root_address)
; [eval] PaddingSize$Tuple$$$$()
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No source_permission_amount@639@01)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (OwnedNonAliased$Tuple$$$%trigger ($Snap.combine
  $Snap.unit
  ($Snap.second ($Snap.second ($Snap.second $t@640@01)))) source_place@636@01 source_root_address@637@01 source_snapshot@638@01))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (= target_place@634@01 source_place@636@01)
  (= target_root_address@635@01 source_root_address@637@01))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(assert (not (or
  (= source_permission_amount@639@01 $Perm.No)
  (< $Perm.No source_permission_amount@639@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No source_permission_amount@639@01)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; [eval] valid$Snap$Tuple$$$(source_snapshot)
(pop) ; 2
(pop) ; 1
; ---------- into_memory_block$Bool ----------
(declare-const place@643@01 Place)
(declare-const root_address@644@01 Address)
(declare-const snapshot@645@01 Snap$Bool)
(declare-const place@646@01 Place)
(declare-const root_address@647@01 Address)
(declare-const snapshot@648@01 Snap$Bool)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@649@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
; [eval] compute_address(place, root_address)
; [eval] Size$Bool$()
(declare-const $t@650@01 $Snap)
(pop) ; 2
(push) ; 2
; [exec]
; unfold acc(OwnedNonAliased$Bool(place, root_address, snapshot), write)
(assert (= $t@649@01 ($Snap.combine ($Snap.first $t@649@01) ($Snap.second $t@649@01))))
(assert (= ($Snap.first $t@649@01) $Snap.unit))
; [eval] valid$Snap$Bool(snapshot)
(assert (valid$Snap$Bool<Bool> snapshot@648@01))
(assert (=
  ($Snap.second $t@649@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@649@01))
    ($Snap.second ($Snap.second $t@649@01)))))
; [eval] compute_address(place, root_address)
; [eval] Size$Bool$()
(assert (= ($Snap.second ($Snap.second $t@649@01)) $Snap.unit))
; [eval] MemoryBlock$bytes(compute_address(place, root_address), Size$Bool$()) == to_bytes$Bool(snapshot)
; [eval] MemoryBlock$bytes(compute_address(place, root_address), Size$Bool$())
; [eval] compute_address(place, root_address)
; [eval] Size$Bool$()
(push) ; 3
(declare-const $k@651@01 $Perm)
(assert ($Perm.isReadVar $k@651@01))
(assert (< $k@651@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@651@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@651@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@649@01)) (compute_address<Address> place@646@01 root_address@647@01) (as Size$Bool$<Snap$Usize>  Snap$Usize)))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@651@01))
(assert (and
  (< $k@651@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@651@01))
  (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@649@01)) (compute_address<Address> place@646@01 root_address@647@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$Bool(snapshot)
(assert (=
  (MemoryBlock$bytes ($Snap.first ($Snap.second $t@649@01)) (compute_address<Address> place@646@01 root_address@647@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
  (to_bytes$Bool<Bytes> snapshot@648@01)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (OwnedNonAliased$Bool%trigger $t@649@01 place@646@01 root_address@647@01 snapshot@648@01))
; [eval] compute_address(place, root_address)
; [eval] Size$Bool$()
(pop) ; 2
(pop) ; 1
; ---------- into_memory_block$I64 ----------
(declare-const place@652@01 Place)
(declare-const root_address@653@01 Address)
(declare-const snapshot@654@01 Snap$I64)
(declare-const place@655@01 Place)
(declare-const root_address@656@01 Address)
(declare-const snapshot@657@01 Snap$I64)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@658@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
; [eval] compute_address(place, root_address)
; [eval] Size$I64$()
(declare-const $t@659@01 $Snap)
(pop) ; 2
(push) ; 2
; [exec]
; unfold acc(OwnedNonAliased$I64(place, root_address, snapshot), write)
(assert (= $t@658@01 ($Snap.combine ($Snap.first $t@658@01) ($Snap.second $t@658@01))))
(assert (= ($Snap.first $t@658@01) $Snap.unit))
; [eval] valid$Snap$I64(snapshot)
(assert (valid$Snap$I64<Bool> snapshot@657@01))
(assert (=
  ($Snap.second $t@658@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@658@01))
    ($Snap.second ($Snap.second $t@658@01)))))
; [eval] compute_address(place, root_address)
; [eval] Size$I64$()
(assert (= ($Snap.second ($Snap.second $t@658@01)) $Snap.unit))
; [eval] MemoryBlock$bytes(compute_address(place, root_address), Size$I64$()) == to_bytes$I64(snapshot)
; [eval] MemoryBlock$bytes(compute_address(place, root_address), Size$I64$())
; [eval] compute_address(place, root_address)
; [eval] Size$I64$()
(push) ; 3
(declare-const $k@660@01 $Perm)
(assert ($Perm.isReadVar $k@660@01))
(assert (< $k@660@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@660@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@660@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@658@01)) (compute_address<Address> place@655@01 root_address@656@01) (as Size$I64$<Snap$Usize>  Snap$Usize)))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@660@01))
(assert (and
  (< $k@660@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@660@01))
  (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@658@01)) (compute_address<Address> place@655@01 root_address@656@01) (as Size$I64$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$I64(snapshot)
(assert (=
  (MemoryBlock$bytes ($Snap.first ($Snap.second $t@658@01)) (compute_address<Address> place@655@01 root_address@656@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
  (to_bytes$I64<Bytes> snapshot@657@01)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (OwnedNonAliased$I64%trigger $t@658@01 place@655@01 root_address@656@01 snapshot@657@01))
; [eval] compute_address(place, root_address)
; [eval] Size$I64$()
(pop) ; 2
(pop) ; 1
; ---------- into_memory_block$Tuple$$$ ----------
(declare-const place@661@01 Place)
(declare-const root_address@662@01 Address)
(declare-const snapshot@663@01 Snap$Tuple$$$)
(declare-const place@664@01 Place)
(declare-const root_address@665@01 Address)
(declare-const snapshot@666@01 Snap$Tuple$$$)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@667@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
; [eval] compute_address(place, root_address)
; [eval] Size$Tuple$$$$()
(declare-const $t@668@01 $Snap)
(pop) ; 2
(push) ; 2
; [exec]
; unfold acc(OwnedNonAliased$Tuple$$$(place, root_address, snapshot), write)
(assert (= $t@667@01 ($Snap.combine ($Snap.first $t@667@01) ($Snap.second $t@667@01))))
(assert (= ($Snap.first $t@667@01) $Snap.unit))
; [eval] valid$Snap$Tuple$$$(snapshot)
(assert (valid$Snap$Tuple$$$<Bool> snapshot@666@01))
; [eval] compute_address(place, root_address)
; [eval] PaddingSize$Tuple$$$$()
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (OwnedNonAliased$Tuple$$$%trigger $t@667@01 place@664@01 root_address@665@01 snapshot@666@01))
; [exec]
; memory_block_join$Tuple$$$(compute_address(place, root_address), write)
; [eval] compute_address(place, root_address)
; [eval] none < permission_amount
; [eval] PaddingSize$Tuple$$$$()
(declare-const $t@669@01 $Snap)
(assert (= $t@669@01 ($Snap.combine ($Snap.first $t@669@01) ($Snap.second $t@669@01))))
; [eval] Size$Tuple$$$$()
(assert (= ($Snap.second $t@669@01) $Snap.unit))
; [eval] (forall snapshot: Snap$Tuple$$$ :: { to_bytes$Tuple$$$(snapshot) } MemoryBlock$bytes(address, Size$Tuple$$$$()) == to_bytes$Tuple$$$(snapshot))
(declare-const snapshot@670@01 Snap$Tuple$$$)
(set-option :timeout 0)
(push) ; 3
; [eval] MemoryBlock$bytes(address, Size$Tuple$$$$()) == to_bytes$Tuple$$$(snapshot)
; [eval] MemoryBlock$bytes(address, Size$Tuple$$$$())
; [eval] Size$Tuple$$$$()
(push) ; 4
(declare-const $k@671@01 $Perm)
(assert ($Perm.isReadVar $k@671@01))
(assert (< $k@671@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@671@01)))
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@671@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first $t@669@01) (compute_address<Address> place@664@01 root_address@665@01) (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))
(pop) ; 4
; Joined path conditions
(assert ($Perm.isReadVar $k@671@01))
(assert (and
  (< $k@671@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@671@01))
  (MemoryBlock$bytes%precondition ($Snap.first $t@669@01) (compute_address<Address> place@664@01 root_address@665@01) (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$Tuple$$$(snapshot)
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert ($Perm.isReadVar $k@671@01))
(assert (< $k@671@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@671@01)))
(assert (MemoryBlock$bytes%precondition ($Snap.first $t@669@01) (compute_address<Address> place@664@01 root_address@665@01) (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((snapshot@670@01 Snap$Tuple$$$)) (!
  (=
    (MemoryBlock$bytes ($Snap.first $t@669@01) (compute_address<Address> place@664@01 root_address@665@01) (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize))
    (to_bytes$Tuple$$$<Bytes> snapshot@670@01))
  :pattern ((to_bytes$Tuple$$$<Bytes> snapshot@670@01))
  :qid |prog.l1823|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] compute_address(place, root_address)
; [eval] Size$Tuple$$$$()
(pop) ; 2
(pop) ; 1
; ---------- lft_tok_sep_return$2 ----------
(declare-const lft@672@01 Lifetime)
(declare-const lft_1@673@01 Lifetime)
(declare-const lft_2@674@01 Lifetime)
(declare-const rd_perm@675@01 $Perm)
(declare-const lft@676@01 Lifetime)
(declare-const lft_1@677@01 Lifetime)
(declare-const lft_2@678@01 Lifetime)
(declare-const rd_perm@679@01 $Perm)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@680@01 $Snap)
(assert (= $t@680@01 ($Snap.combine ($Snap.first $t@680@01) ($Snap.second $t@680@01))))
(assert (= ($Snap.first $t@680@01) $Snap.unit))
; [eval] none < rd_perm
(assert (< $Perm.No rd_perm@679@01))
(assert (=
  ($Snap.second $t@680@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@680@01))
    ($Snap.second ($Snap.second $t@680@01)))))
(push) ; 2
(assert (not (or (= rd_perm@679@01 $Perm.No) (< $Perm.No rd_perm@679@01))))
(check-sat)
; unsat
(pop) ; 2
; 0.00s
; (get-info :all-statistics)
(assert (<= $Perm.No rd_perm@679@01))
(assert (= ($Snap.second ($Snap.second $t@680@01)) $Snap.unit))
; [eval] lft == intersect(Set(lft_1, lft_2))
; [eval] intersect(Set(lft_1, lft_2))
; [eval] Set(lft_1, lft_2)
(assert (=
  lft@676@01
  (intersect<Lifetime> (Set_unionone (Set_singleton lft_1@677@01) lft_2@678@01))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@681@01 $Snap)
(assert (= $t@681@01 ($Snap.combine ($Snap.first $t@681@01) ($Snap.second $t@681@01))))
(push) ; 3
(assert (not (or (= rd_perm@679@01 $Perm.No) (< $Perm.No rd_perm@679@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (or (= rd_perm@679@01 $Perm.No) (< $Perm.No rd_perm@679@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(push) ; 3
(set-option :timeout 10)
(assert (not (= lft_1@677@01 lft_2@678@01)))
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
(declare-const lft_1@682@01 Lifetime)
(declare-const lft_2@683@01 Lifetime)
(declare-const rd_perm@684@01 $Perm)
(declare-const lft@685@01 Lifetime)
(declare-const lft_1@686@01 Lifetime)
(declare-const lft_2@687@01 Lifetime)
(declare-const rd_perm@688@01 $Perm)
(declare-const lft@689@01 Lifetime)
(push) ; 1
(declare-const $t@690@01 $Snap)
(assert (= $t@690@01 ($Snap.combine ($Snap.first $t@690@01) ($Snap.second $t@690@01))))
(assert (= ($Snap.first $t@690@01) $Snap.unit))
; [eval] none < rd_perm
(assert (< $Perm.No rd_perm@688@01))
(assert (=
  ($Snap.second $t@690@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@690@01))
    ($Snap.second ($Snap.second $t@690@01)))))
(push) ; 2
(assert (not (or (= rd_perm@688@01 $Perm.No) (< $Perm.No rd_perm@688@01))))
(check-sat)
; unsat
(pop) ; 2
; 0.00s
; (get-info :all-statistics)
(assert (<= $Perm.No rd_perm@688@01))
(push) ; 2
(assert (not (or (= rd_perm@688@01 $Perm.No) (< $Perm.No rd_perm@688@01))))
(check-sat)
; unsat
(pop) ; 2
; 0.00s
; (get-info :all-statistics)
(push) ; 2
(set-option :timeout 10)
(assert (not (= lft_1@686@01 lft_2@687@01)))
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
(declare-const $t@691@01 $Snap)
(assert (= $t@691@01 ($Snap.combine ($Snap.first $t@691@01) ($Snap.second $t@691@01))))
(push) ; 3
(assert (not (or (= rd_perm@688@01 $Perm.No) (< $Perm.No rd_perm@688@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (= ($Snap.second $t@691@01) $Snap.unit))
; [eval] lft == intersect(Set(lft_1, lft_2))
; [eval] intersect(Set(lft_1, lft_2))
; [eval] Set(lft_1, lft_2)
(assert (=
  lft@689@01
  (intersect<Lifetime> (Set_unionone (Set_singleton lft_1@686@01) lft_2@687@01))))
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- memory_block_join$Tuple$$$ ----------
(declare-const address@692@01 Address)
(declare-const permission_amount@693@01 $Perm)
(declare-const address@694@01 Address)
(declare-const permission_amount@695@01 $Perm)
(push) ; 1
(declare-const $t@696@01 $Snap)
(assert (= $t@696@01 ($Snap.combine ($Snap.first $t@696@01) ($Snap.second $t@696@01))))
(assert (= ($Snap.first $t@696@01) $Snap.unit))
; [eval] none < permission_amount
(assert (< $Perm.No permission_amount@695@01))
; [eval] PaddingSize$Tuple$$$$()
(push) ; 2
(assert (not (or (= permission_amount@695@01 $Perm.No) (< $Perm.No permission_amount@695@01))))
(check-sat)
; unsat
(pop) ; 2
; 0.00s
; (get-info :all-statistics)
(assert (<= $Perm.No permission_amount@695@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@697@01 $Snap)
(assert (= $t@697@01 ($Snap.combine ($Snap.first $t@697@01) ($Snap.second $t@697@01))))
; [eval] Size$Tuple$$$$()
(assert (= ($Snap.second $t@697@01) $Snap.unit))
; [eval] (forall snapshot: Snap$Tuple$$$ :: { to_bytes$Tuple$$$(snapshot) } MemoryBlock$bytes(address, Size$Tuple$$$$()) == to_bytes$Tuple$$$(snapshot))
(declare-const snapshot@698@01 Snap$Tuple$$$)
(push) ; 3
; [eval] MemoryBlock$bytes(address, Size$Tuple$$$$()) == to_bytes$Tuple$$$(snapshot)
; [eval] MemoryBlock$bytes(address, Size$Tuple$$$$())
; [eval] Size$Tuple$$$$()
(push) ; 4
(declare-const $k@699@01 $Perm)
(assert ($Perm.isReadVar $k@699@01))
(assert (< $k@699@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@699@01)))
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@699@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first $t@697@01) address@694@01 (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))
(pop) ; 4
; Joined path conditions
(assert ($Perm.isReadVar $k@699@01))
(assert (and
  (< $k@699@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@699@01))
  (MemoryBlock$bytes%precondition ($Snap.first $t@697@01) address@694@01 (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$Tuple$$$(snapshot)
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert ($Perm.isReadVar $k@699@01))
(assert (< $k@699@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@699@01)))
(assert (MemoryBlock$bytes%precondition ($Snap.first $t@697@01) address@694@01 (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((snapshot@698@01 Snap$Tuple$$$)) (!
  (=
    (MemoryBlock$bytes ($Snap.first $t@697@01) address@694@01 (as Size$Tuple$$$$<Snap$Usize>  Snap$Usize))
    (to_bytes$Tuple$$$<Bytes> snapshot@698@01))
  :pattern ((to_bytes$Tuple$$$<Bytes> snapshot@698@01))
  :qid |prog.l1823|)))
(pop) ; 2
(set-option :timeout 0)
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- memory_block_join$Tuple$$I64$Bool$$I64$Bool$ ----------
(declare-const address@700@01 Address)
(declare-const permission_amount@701@01 $Perm)
(declare-const address@702@01 Address)
(declare-const permission_amount@703@01 $Perm)
(push) ; 1
(declare-const $t@704@01 $Snap)
(assert (= $t@704@01 ($Snap.combine ($Snap.first $t@704@01) ($Snap.second $t@704@01))))
(assert (= ($Snap.first $t@704@01) $Snap.unit))
; [eval] none < permission_amount
(assert (< $Perm.No permission_amount@703@01))
(assert (=
  ($Snap.second $t@704@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@704@01))
    ($Snap.second ($Snap.second $t@704@01)))))
; [eval] PaddingSize$Tuple$$I64$Bool$$I64$Bool$$()
(push) ; 2
(assert (not (or (= permission_amount@703@01 $Perm.No) (< $Perm.No permission_amount@703@01))))
(check-sat)
; unsat
(pop) ; 2
; 0.00s
; (get-info :all-statistics)
(assert (<= $Perm.No permission_amount@703@01))
(assert (=
  ($Snap.second ($Snap.second $t@704@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@704@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@704@01))))))
; [eval] field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address)
; [eval] Size$I64$()
(push) ; 2
(assert (not (or (= permission_amount@703@01 $Perm.No) (< $Perm.No permission_amount@703@01))))
(check-sat)
; unsat
(pop) ; 2
; 0.00s
; (get-info :all-statistics)
(push) ; 2
(set-option :timeout 10)
(assert (not (and
  (=
    address@702@01
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@702@01))
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
(assert (not (or (= permission_amount@703@01 $Perm.No) (< $Perm.No permission_amount@703@01))))
(check-sat)
; unsat
(pop) ; 2
; 0.00s
; (get-info :all-statistics)
(push) ; 2
(set-option :timeout 10)
(assert (not (and
  (=
    address@702@01
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> address@702@01))
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
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@702@01)
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> address@702@01))
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
(declare-const $t@705@01 $Snap)
(assert (= $t@705@01 ($Snap.combine ($Snap.first $t@705@01) ($Snap.second $t@705@01))))
; [eval] Size$Tuple$$I64$Bool$$I64$Bool$$()
(assert (= ($Snap.second $t@705@01) $Snap.unit))
; [eval] (forall snapshot: Snap$Tuple$$I64$Bool$$I64$Bool$ :: { to_bytes$Tuple$$I64$Bool$$I64$Bool$(snapshot) } old(MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address), Size$I64$()) == to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot))) && old(MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address), Size$Bool$()) == to_bytes$Bool(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot))) ==> MemoryBlock$bytes(address, Size$Tuple$$I64$Bool$$I64$Bool$$()) == to_bytes$Tuple$$I64$Bool$$I64$Bool$(snapshot))
(declare-const snapshot@706@01 Snap$Tuple$$I64$Bool$$I64$Bool$)
(push) ; 3
; [eval] old(MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address), Size$I64$()) == to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot))) && old(MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address), Size$Bool$()) == to_bytes$Bool(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot))) ==> MemoryBlock$bytes(address, Size$Tuple$$I64$Bool$$I64$Bool$$()) == to_bytes$Tuple$$I64$Bool$$I64$Bool$(snapshot)
; [eval] old(MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address), Size$I64$()) == to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot))) && old(MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address), Size$Bool$()) == to_bytes$Bool(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot)))
; [eval] old(MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address), Size$I64$()) == to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot)))
; [eval] MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address), Size$I64$()) == to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot))
; [eval] MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address), Size$I64$())
; [eval] field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address)
; [eval] Size$I64$()
(push) ; 4
(declare-const $k@707@01 $Perm)
(assert ($Perm.isReadVar $k@707@01))
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= permission_amount@703@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (< $k@707@01 permission_amount@703@01))
(assert (<= $Perm.No (- permission_amount@703@01 $k@707@01)))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@707@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second ($Snap.second $t@704@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@702@01) (as Size$I64$<Snap$Usize>  Snap$Usize)))
(pop) ; 4
; Joined path conditions
(assert ($Perm.isReadVar $k@707@01))
(assert (and
  (< $k@707@01 permission_amount@703@01)
  (<= $Perm.No (- permission_amount@703@01 $k@707@01))
  (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second ($Snap.second $t@704@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@702@01) (as Size$I64$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot)
(set-option :timeout 0)
(push) ; 4
; [then-branch: 22 | MemoryBlock$bytes(First:(Second:(Second:($t@704@01))), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](address@702@01), Size$I64$[Snap$Usize]) == to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@706@01)) | live]
; [else-branch: 22 | MemoryBlock$bytes(First:(Second:(Second:($t@704@01))), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](address@702@01), Size$I64$[Snap$Usize]) != to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@706@01)) | live]
(push) ; 5
; [then-branch: 22 | MemoryBlock$bytes(First:(Second:(Second:($t@704@01))), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](address@702@01), Size$I64$[Snap$Usize]) == to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@706@01))]
(assert (=
  (MemoryBlock$bytes ($Snap.first ($Snap.second ($Snap.second $t@704@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@702@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
  (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@706@01))))
; [eval] old(MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address), Size$Bool$()) == to_bytes$Bool(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot)))
; [eval] MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address), Size$Bool$()) == to_bytes$Bool(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot))
; [eval] MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address), Size$Bool$())
; [eval] field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address)
; [eval] Size$Bool$()
(push) ; 6
(declare-const $k@708@01 $Perm)
(assert ($Perm.isReadVar $k@708@01))
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= permission_amount@703@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (< $k@708@01 permission_amount@703@01))
(assert (<= $Perm.No (- permission_amount@703@01 $k@708@01)))
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.No $k@708@01)))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.second ($Snap.second ($Snap.second $t@704@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> address@702@01) (as Size$Bool$<Snap$Usize>  Snap$Usize)))
(pop) ; 6
; Joined path conditions
(assert ($Perm.isReadVar $k@708@01))
(assert (and
  (< $k@708@01 permission_amount@703@01)
  (<= $Perm.No (- permission_amount@703@01 $k@708@01))
  (MemoryBlock$bytes%precondition ($Snap.second ($Snap.second ($Snap.second $t@704@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> address@702@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$Bool(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot)
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 22 | MemoryBlock$bytes(First:(Second:(Second:($t@704@01))), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](address@702@01), Size$I64$[Snap$Usize]) != to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@706@01))]
(assert (not
  (=
    (MemoryBlock$bytes ($Snap.first ($Snap.second ($Snap.second $t@704@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@702@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
    (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@706@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert ($Perm.isReadVar $k@708@01))
(assert (=>
  (=
    (MemoryBlock$bytes ($Snap.first ($Snap.second ($Snap.second $t@704@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@702@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
    (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@706@01)))
  (and
    (=
      (MemoryBlock$bytes ($Snap.first ($Snap.second ($Snap.second $t@704@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@702@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
      (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@706@01)))
    (< $k@708@01 permission_amount@703@01)
    (<= $Perm.No (- permission_amount@703@01 $k@708@01))
    (MemoryBlock$bytes%precondition ($Snap.second ($Snap.second ($Snap.second $t@704@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> address@702@01) (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
; Joined path conditions
(assert (or
  (not
    (=
      (MemoryBlock$bytes ($Snap.first ($Snap.second ($Snap.second $t@704@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@702@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
      (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@706@01))))
  (=
    (MemoryBlock$bytes ($Snap.first ($Snap.second ($Snap.second $t@704@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@702@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
    (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@706@01)))))
(push) ; 4
; [then-branch: 23 | MemoryBlock$bytes(Second:(Second:(Second:($t@704@01))), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Address](address@702@01), Size$Bool$[Snap$Usize]) == to_bytes$Bool[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](snapshot@706@01)) && MemoryBlock$bytes(First:(Second:(Second:($t@704@01))), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](address@702@01), Size$I64$[Snap$Usize]) == to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@706@01)) | live]
; [else-branch: 23 | !(MemoryBlock$bytes(Second:(Second:(Second:($t@704@01))), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Address](address@702@01), Size$Bool$[Snap$Usize]) == to_bytes$Bool[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](snapshot@706@01)) && MemoryBlock$bytes(First:(Second:(Second:($t@704@01))), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](address@702@01), Size$I64$[Snap$Usize]) == to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@706@01))) | live]
(push) ; 5
; [then-branch: 23 | MemoryBlock$bytes(Second:(Second:(Second:($t@704@01))), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Address](address@702@01), Size$Bool$[Snap$Usize]) == to_bytes$Bool[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](snapshot@706@01)) && MemoryBlock$bytes(First:(Second:(Second:($t@704@01))), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](address@702@01), Size$I64$[Snap$Usize]) == to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@706@01))]
(assert (and
  (=
    (MemoryBlock$bytes ($Snap.second ($Snap.second ($Snap.second $t@704@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> address@702@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
    (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@706@01)))
  (=
    (MemoryBlock$bytes ($Snap.first ($Snap.second ($Snap.second $t@704@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@702@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
    (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@706@01)))))
; [eval] MemoryBlock$bytes(address, Size$Tuple$$I64$Bool$$I64$Bool$$()) == to_bytes$Tuple$$I64$Bool$$I64$Bool$(snapshot)
; [eval] MemoryBlock$bytes(address, Size$Tuple$$I64$Bool$$I64$Bool$$())
; [eval] Size$Tuple$$I64$Bool$$I64$Bool$$()
(push) ; 6
(declare-const $k@709@01 $Perm)
(assert ($Perm.isReadVar $k@709@01))
(assert (< $k@709@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@709@01)))
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.No $k@709@01)))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first $t@705@01) address@702@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))
(pop) ; 6
; Joined path conditions
(assert ($Perm.isReadVar $k@709@01))
(assert (and
  (< $k@709@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@709@01))
  (MemoryBlock$bytes%precondition ($Snap.first $t@705@01) address@702@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$Tuple$$I64$Bool$$I64$Bool$(snapshot)
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 23 | !(MemoryBlock$bytes(Second:(Second:(Second:($t@704@01))), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Address](address@702@01), Size$Bool$[Snap$Usize]) == to_bytes$Bool[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1[Snap$Bool](snapshot@706@01)) && MemoryBlock$bytes(First:(Second:(Second:($t@704@01))), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](address@702@01), Size$I64$[Snap$Usize]) == to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@706@01)))]
(assert (not
  (and
    (=
      (MemoryBlock$bytes ($Snap.second ($Snap.second ($Snap.second $t@704@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> address@702@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
      (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@706@01)))
    (=
      (MemoryBlock$bytes ($Snap.first ($Snap.second ($Snap.second $t@704@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@702@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
      (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@706@01))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert ($Perm.isReadVar $k@709@01))
(assert (=>
  (and
    (=
      (MemoryBlock$bytes ($Snap.second ($Snap.second ($Snap.second $t@704@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> address@702@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
      (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@706@01)))
    (=
      (MemoryBlock$bytes ($Snap.first ($Snap.second ($Snap.second $t@704@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@702@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
      (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@706@01))))
  (and
    (=
      (MemoryBlock$bytes ($Snap.second ($Snap.second ($Snap.second $t@704@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> address@702@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
      (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@706@01)))
    (=
      (MemoryBlock$bytes ($Snap.first ($Snap.second ($Snap.second $t@704@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@702@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
      (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@706@01)))
    (< $k@709@01 $Perm.Write)
    (<= $Perm.No (- $Perm.Write $k@709@01))
    (MemoryBlock$bytes%precondition ($Snap.first $t@705@01) address@702@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))))
; Joined path conditions
(assert (or
  (not
    (and
      (=
        (MemoryBlock$bytes ($Snap.second ($Snap.second ($Snap.second $t@704@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> address@702@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
        (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@706@01)))
      (=
        (MemoryBlock$bytes ($Snap.first ($Snap.second ($Snap.second $t@704@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@702@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
        (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@706@01)))))
  (and
    (=
      (MemoryBlock$bytes ($Snap.second ($Snap.second ($Snap.second $t@704@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> address@702@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
      (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@706@01)))
    (=
      (MemoryBlock$bytes ($Snap.first ($Snap.second ($Snap.second $t@704@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@702@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
      (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@706@01))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert ($Perm.isReadVar $k@707@01))
(assert ($Perm.isReadVar $k@708@01))
(assert ($Perm.isReadVar $k@709@01))
(assert (< $k@707@01 permission_amount@703@01))
(assert (<= $Perm.No (- permission_amount@703@01 $k@707@01)))
(assert (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second ($Snap.second $t@704@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@702@01) (as Size$I64$<Snap$Usize>  Snap$Usize)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((snapshot@706@01 Snap$Tuple$$I64$Bool$$I64$Bool$)) (!
  (and
    (=>
      (=
        (MemoryBlock$bytes ($Snap.first ($Snap.second ($Snap.second $t@704@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@702@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
        (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@706@01)))
      (and
        (=
          (MemoryBlock$bytes ($Snap.first ($Snap.second ($Snap.second $t@704@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@702@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
          (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@706@01)))
        (< $k@708@01 permission_amount@703@01)
        (<= $Perm.No (- permission_amount@703@01 $k@708@01))
        (MemoryBlock$bytes%precondition ($Snap.second ($Snap.second ($Snap.second $t@704@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> address@702@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))))
    (or
      (not
        (=
          (MemoryBlock$bytes ($Snap.first ($Snap.second ($Snap.second $t@704@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@702@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
          (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@706@01))))
      (=
        (MemoryBlock$bytes ($Snap.first ($Snap.second ($Snap.second $t@704@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@702@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
        (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@706@01))))
    (=>
      (and
        (=
          (MemoryBlock$bytes ($Snap.second ($Snap.second ($Snap.second $t@704@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> address@702@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
          (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@706@01)))
        (=
          (MemoryBlock$bytes ($Snap.first ($Snap.second ($Snap.second $t@704@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@702@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
          (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@706@01))))
      (and
        (=
          (MemoryBlock$bytes ($Snap.second ($Snap.second ($Snap.second $t@704@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> address@702@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
          (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@706@01)))
        (=
          (MemoryBlock$bytes ($Snap.first ($Snap.second ($Snap.second $t@704@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@702@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
          (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@706@01)))
        (< $k@709@01 $Perm.Write)
        (<= $Perm.No (- $Perm.Write $k@709@01))
        (MemoryBlock$bytes%precondition ($Snap.first $t@705@01) address@702@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize))))
    (or
      (not
        (and
          (=
            (MemoryBlock$bytes ($Snap.second ($Snap.second ($Snap.second $t@704@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> address@702@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
            (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@706@01)))
          (=
            (MemoryBlock$bytes ($Snap.first ($Snap.second ($Snap.second $t@704@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@702@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
            (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@706@01)))))
      (and
        (=
          (MemoryBlock$bytes ($Snap.second ($Snap.second ($Snap.second $t@704@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> address@702@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
          (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@706@01)))
        (=
          (MemoryBlock$bytes ($Snap.first ($Snap.second ($Snap.second $t@704@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@702@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
          (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@706@01))))))
  :pattern ((to_bytes$Tuple$$I64$Bool$$I64$Bool$<Bytes> snapshot@706@01))
  :qid |prog.l1837-aux|)))
(assert (forall ((snapshot@706@01 Snap$Tuple$$I64$Bool$$I64$Bool$)) (!
  (=>
    (and
      (=
        (MemoryBlock$bytes ($Snap.second ($Snap.second ($Snap.second $t@704@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> address@702@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
        (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@706@01)))
      (=
        (MemoryBlock$bytes ($Snap.first ($Snap.second ($Snap.second $t@704@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@702@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
        (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@706@01))))
    (=
      (MemoryBlock$bytes ($Snap.first $t@705@01) address@702@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize))
      (to_bytes$Tuple$$I64$Bool$$I64$Bool$<Bytes> snapshot@706@01)))
  :pattern ((to_bytes$Tuple$$I64$Bool$$I64$Bool$<Bytes> snapshot@706@01))
  :qid |prog.l1837|)))
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- memory_block_split$Tuple$$$ ----------
(declare-const address@710@01 Address)
(declare-const permission_amount@711@01 $Perm)
(declare-const address@712@01 Address)
(declare-const permission_amount@713@01 $Perm)
(push) ; 1
(declare-const $t@714@01 $Snap)
(assert (= $t@714@01 ($Snap.combine ($Snap.first $t@714@01) ($Snap.second $t@714@01))))
(assert (= ($Snap.first $t@714@01) $Snap.unit))
; [eval] none < permission_amount
(assert (< $Perm.No permission_amount@713@01))
; [eval] Size$Tuple$$$$()
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@715@01 $Snap)
(assert (= $t@715@01 ($Snap.combine ($Snap.first $t@715@01) ($Snap.second $t@715@01))))
; [eval] PaddingSize$Tuple$$$$()
(push) ; 3
(assert (not (or (= permission_amount@713@01 $Perm.No) (< $Perm.No permission_amount@713@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (<= $Perm.No permission_amount@713@01))
(assert (= ($Snap.second $t@715@01) $Snap.unit))
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- memory_block_split$Tuple$$I64$Bool$$I64$Bool$ ----------
(declare-const address@716@01 Address)
(declare-const permission_amount@717@01 $Perm)
(declare-const address@718@01 Address)
(declare-const permission_amount@719@01 $Perm)
(push) ; 1
(declare-const $t@720@01 $Snap)
(assert (= $t@720@01 ($Snap.combine ($Snap.first $t@720@01) ($Snap.second $t@720@01))))
(assert (= ($Snap.first $t@720@01) $Snap.unit))
; [eval] none < permission_amount
(assert (< $Perm.No permission_amount@719@01))
; [eval] Size$Tuple$$I64$Bool$$I64$Bool$$()
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@721@01 $Snap)
(assert (= $t@721@01 ($Snap.combine ($Snap.first $t@721@01) ($Snap.second $t@721@01))))
; [eval] PaddingSize$Tuple$$I64$Bool$$I64$Bool$$()
(push) ; 3
(assert (not (or (= permission_amount@719@01 $Perm.No) (< $Perm.No permission_amount@719@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (<= $Perm.No permission_amount@719@01))
(assert (=
  ($Snap.second $t@721@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@721@01))
    ($Snap.second ($Snap.second $t@721@01)))))
; [eval] field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address)
; [eval] Size$I64$()
(push) ; 3
(assert (not (or (= permission_amount@719@01 $Perm.No) (< $Perm.No permission_amount@719@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (=
    address@718@01
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@718@01))
  (=
    (as PaddingSize$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)
    (as Size$I64$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second $t@721@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@721@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@721@01))))))
; [eval] field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address)
; [eval] Size$Bool$()
(set-option :timeout 0)
(push) ; 3
(assert (not (or (= permission_amount@719@01 $Perm.No) (< $Perm.No permission_amount@719@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (=
    address@718@01
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> address@718@01))
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
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@718@01)
    (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> address@718@01))
  (=
    (as Size$I64$<Snap$Usize>  Snap$Usize)
    (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@721@01))) $Snap.unit))
; [eval] (forall snapshot: Snap$Tuple$$I64$Bool$$I64$Bool$ :: { to_bytes$Tuple$$I64$Bool$$I64$Bool$(snapshot) } old(MemoryBlock$bytes(address, Size$Tuple$$I64$Bool$$I64$Bool$$())) == to_bytes$Tuple$$I64$Bool$$I64$Bool$(snapshot) ==> MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address), Size$I64$()) == to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot)) && MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address), Size$Bool$()) == to_bytes$Bool(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot)))
(declare-const snapshot@722@01 Snap$Tuple$$I64$Bool$$I64$Bool$)
(set-option :timeout 0)
(push) ; 3
; [eval] old(MemoryBlock$bytes(address, Size$Tuple$$I64$Bool$$I64$Bool$$())) == to_bytes$Tuple$$I64$Bool$$I64$Bool$(snapshot) ==> MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address), Size$I64$()) == to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot)) && MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address), Size$Bool$()) == to_bytes$Bool(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot))
; [eval] old(MemoryBlock$bytes(address, Size$Tuple$$I64$Bool$$I64$Bool$$())) == to_bytes$Tuple$$I64$Bool$$I64$Bool$(snapshot)
; [eval] old(MemoryBlock$bytes(address, Size$Tuple$$I64$Bool$$I64$Bool$$()))
; [eval] MemoryBlock$bytes(address, Size$Tuple$$I64$Bool$$I64$Bool$$())
; [eval] Size$Tuple$$I64$Bool$$I64$Bool$$()
(push) ; 4
(declare-const $k@723@01 $Perm)
(assert ($Perm.isReadVar $k@723@01))
(assert (< $k@723@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@723@01)))
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@723@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.second $t@720@01) address@718@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))
(pop) ; 4
; Joined path conditions
(assert ($Perm.isReadVar $k@723@01))
(assert (and
  (< $k@723@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@723@01))
  (MemoryBlock$bytes%precondition ($Snap.second $t@720@01) address@718@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$Tuple$$I64$Bool$$I64$Bool$(snapshot)
(set-option :timeout 0)
(push) ; 4
; [then-branch: 24 | MemoryBlock$bytes(Second:($t@720@01), address@718@01, Size$Tuple$$I64$Bool$$I64$Bool$$[Snap$Usize]) == to_bytes$Tuple$$I64$Bool$$I64$Bool$[Bytes](snapshot@722@01) | live]
; [else-branch: 24 | MemoryBlock$bytes(Second:($t@720@01), address@718@01, Size$Tuple$$I64$Bool$$I64$Bool$$[Snap$Usize]) != to_bytes$Tuple$$I64$Bool$$I64$Bool$[Bytes](snapshot@722@01) | live]
(push) ; 5
; [then-branch: 24 | MemoryBlock$bytes(Second:($t@720@01), address@718@01, Size$Tuple$$I64$Bool$$I64$Bool$$[Snap$Usize]) == to_bytes$Tuple$$I64$Bool$$I64$Bool$[Bytes](snapshot@722@01)]
(assert (=
  (MemoryBlock$bytes ($Snap.second $t@720@01) address@718@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize))
  (to_bytes$Tuple$$I64$Bool$$I64$Bool$<Bytes> snapshot@722@01)))
; [eval] MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address), Size$I64$()) == to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot)) && MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address), Size$Bool$()) == to_bytes$Bool(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot))
; [eval] MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address), Size$I64$()) == to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot))
; [eval] MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address), Size$I64$())
; [eval] field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(address)
; [eval] Size$I64$()
(push) ; 6
(declare-const $k@724@01 $Perm)
(assert ($Perm.isReadVar $k@724@01))
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= permission_amount@719@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (< $k@724@01 permission_amount@719@01))
(assert (<= $Perm.No (- permission_amount@719@01 $k@724@01)))
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.No $k@724@01)))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@721@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@718@01) (as Size$I64$<Snap$Usize>  Snap$Usize)))
(pop) ; 6
; Joined path conditions
(assert ($Perm.isReadVar $k@724@01))
(assert (and
  (< $k@724@01 permission_amount@719@01)
  (<= $Perm.No (- permission_amount@719@01 $k@724@01))
  (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@721@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@718@01) (as Size$I64$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$I64(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0(snapshot)
(set-option :timeout 0)
(push) ; 6
; [then-branch: 25 | MemoryBlock$bytes(First:(Second:($t@721@01)), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](address@718@01), Size$I64$[Snap$Usize]) == to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@722@01)) | live]
; [else-branch: 25 | MemoryBlock$bytes(First:(Second:($t@721@01)), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](address@718@01), Size$I64$[Snap$Usize]) != to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@722@01)) | live]
(push) ; 7
; [then-branch: 25 | MemoryBlock$bytes(First:(Second:($t@721@01)), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](address@718@01), Size$I64$[Snap$Usize]) == to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@722@01))]
(assert (=
  (MemoryBlock$bytes ($Snap.first ($Snap.second $t@721@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@718@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
  (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@722@01))))
; [eval] MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address), Size$Bool$()) == to_bytes$Bool(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot))
; [eval] MemoryBlock$bytes(field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address), Size$Bool$())
; [eval] field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(address)
; [eval] Size$Bool$()
(push) ; 8
(declare-const $k@725@01 $Perm)
(assert ($Perm.isReadVar $k@725@01))
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= permission_amount@719@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (< $k@725@01 permission_amount@719@01))
(assert (<= $Perm.No (- permission_amount@719@01 $k@725@01)))
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (< $Perm.No $k@725@01)))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second ($Snap.second $t@721@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> address@718@01) (as Size$Bool$<Snap$Usize>  Snap$Usize)))
(pop) ; 8
; Joined path conditions
(assert ($Perm.isReadVar $k@725@01))
(assert (and
  (< $k@725@01 permission_amount@719@01)
  (<= $Perm.No (- permission_amount@719@01 $k@725@01))
  (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second ($Snap.second $t@721@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> address@718@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$Bool(destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot))
; [eval] destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1(snapshot)
(pop) ; 7
(set-option :timeout 0)
(push) ; 7
; [else-branch: 25 | MemoryBlock$bytes(First:(Second:($t@721@01)), field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Address](address@718@01), Size$I64$[Snap$Usize]) != to_bytes$I64[Bytes](destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0[Snap$I64](snapshot@722@01))]
(assert (not
  (=
    (MemoryBlock$bytes ($Snap.first ($Snap.second $t@721@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@718@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
    (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@722@01)))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert ($Perm.isReadVar $k@725@01))
(assert (=>
  (=
    (MemoryBlock$bytes ($Snap.first ($Snap.second $t@721@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@718@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
    (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@722@01)))
  (and
    (=
      (MemoryBlock$bytes ($Snap.first ($Snap.second $t@721@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@718@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
      (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@722@01)))
    (< $k@725@01 permission_amount@719@01)
    (<= $Perm.No (- permission_amount@719@01 $k@725@01))
    (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second ($Snap.second $t@721@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> address@718@01) (as Size$Bool$<Snap$Usize>  Snap$Usize)))))
; Joined path conditions
(assert (or
  (not
    (=
      (MemoryBlock$bytes ($Snap.first ($Snap.second $t@721@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@718@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
      (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@722@01))))
  (=
    (MemoryBlock$bytes ($Snap.first ($Snap.second $t@721@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@718@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
    (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@722@01)))))
(pop) ; 5
(push) ; 5
; [else-branch: 24 | MemoryBlock$bytes(Second:($t@720@01), address@718@01, Size$Tuple$$I64$Bool$$I64$Bool$$[Snap$Usize]) != to_bytes$Tuple$$I64$Bool$$I64$Bool$[Bytes](snapshot@722@01)]
(assert (not
  (=
    (MemoryBlock$bytes ($Snap.second $t@720@01) address@718@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize))
    (to_bytes$Tuple$$I64$Bool$$I64$Bool$<Bytes> snapshot@722@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert ($Perm.isReadVar $k@724@01))
(assert ($Perm.isReadVar $k@725@01))
(assert (=>
  (=
    (MemoryBlock$bytes ($Snap.second $t@720@01) address@718@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize))
    (to_bytes$Tuple$$I64$Bool$$I64$Bool$<Bytes> snapshot@722@01))
  (and
    (=
      (MemoryBlock$bytes ($Snap.second $t@720@01) address@718@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize))
      (to_bytes$Tuple$$I64$Bool$$I64$Bool$<Bytes> snapshot@722@01))
    (< $k@724@01 permission_amount@719@01)
    (<= $Perm.No (- permission_amount@719@01 $k@724@01))
    (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@721@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@718@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
    (=>
      (=
        (MemoryBlock$bytes ($Snap.first ($Snap.second $t@721@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@718@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
        (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@722@01)))
      (and
        (=
          (MemoryBlock$bytes ($Snap.first ($Snap.second $t@721@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@718@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
          (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@722@01)))
        (< $k@725@01 permission_amount@719@01)
        (<= $Perm.No (- permission_amount@719@01 $k@725@01))
        (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second ($Snap.second $t@721@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> address@718@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))))
    (or
      (not
        (=
          (MemoryBlock$bytes ($Snap.first ($Snap.second $t@721@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@718@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
          (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@722@01))))
      (=
        (MemoryBlock$bytes ($Snap.first ($Snap.second $t@721@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@718@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
        (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@722@01)))))))
; Joined path conditions
(assert (or
  (not
    (=
      (MemoryBlock$bytes ($Snap.second $t@720@01) address@718@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize))
      (to_bytes$Tuple$$I64$Bool$$I64$Bool$<Bytes> snapshot@722@01)))
  (=
    (MemoryBlock$bytes ($Snap.second $t@720@01) address@718@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize))
    (to_bytes$Tuple$$I64$Bool$$I64$Bool$<Bytes> snapshot@722@01))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert ($Perm.isReadVar $k@723@01))
(assert ($Perm.isReadVar $k@724@01))
(assert ($Perm.isReadVar $k@725@01))
(assert (< $k@723@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@723@01)))
(assert (MemoryBlock$bytes%precondition ($Snap.second $t@720@01) address@718@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((snapshot@722@01 Snap$Tuple$$I64$Bool$$I64$Bool$)) (!
  (and
    (=>
      (=
        (MemoryBlock$bytes ($Snap.second $t@720@01) address@718@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize))
        (to_bytes$Tuple$$I64$Bool$$I64$Bool$<Bytes> snapshot@722@01))
      (and
        (=
          (MemoryBlock$bytes ($Snap.second $t@720@01) address@718@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize))
          (to_bytes$Tuple$$I64$Bool$$I64$Bool$<Bytes> snapshot@722@01))
        (< $k@724@01 permission_amount@719@01)
        (<= $Perm.No (- permission_amount@719@01 $k@724@01))
        (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@721@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@718@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
        (=>
          (=
            (MemoryBlock$bytes ($Snap.first ($Snap.second $t@721@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@718@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
            (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@722@01)))
          (and
            (=
              (MemoryBlock$bytes ($Snap.first ($Snap.second $t@721@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@718@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
              (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@722@01)))
            (< $k@725@01 permission_amount@719@01)
            (<= $Perm.No (- permission_amount@719@01 $k@725@01))
            (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second ($Snap.second $t@721@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> address@718@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))))
        (or
          (not
            (=
              (MemoryBlock$bytes ($Snap.first ($Snap.second $t@721@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@718@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
              (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@722@01))))
          (=
            (MemoryBlock$bytes ($Snap.first ($Snap.second $t@721@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@718@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
            (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@722@01))))))
    (or
      (not
        (=
          (MemoryBlock$bytes ($Snap.second $t@720@01) address@718@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize))
          (to_bytes$Tuple$$I64$Bool$$I64$Bool$<Bytes> snapshot@722@01)))
      (=
        (MemoryBlock$bytes ($Snap.second $t@720@01) address@718@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize))
        (to_bytes$Tuple$$I64$Bool$$I64$Bool$<Bytes> snapshot@722@01))))
  :pattern ((to_bytes$Tuple$$I64$Bool$$I64$Bool$<Bytes> snapshot@722@01))
  :qid |prog.l1864-aux|)))
(assert (forall ((snapshot@722@01 Snap$Tuple$$I64$Bool$$I64$Bool$)) (!
  (=>
    (=
      (MemoryBlock$bytes ($Snap.second $t@720@01) address@718@01 (as Size$Tuple$$I64$Bool$$I64$Bool$$<Snap$Usize>  Snap$Usize))
      (to_bytes$Tuple$$I64$Bool$$I64$Bool$<Bytes> snapshot@722@01))
    (and
      (=
        (MemoryBlock$bytes ($Snap.first ($Snap.second ($Snap.second $t@721@01))) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Address> address@718@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
        (to_bytes$Bool<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_1<Snap$Bool> snapshot@722@01)))
      (=
        (MemoryBlock$bytes ($Snap.first ($Snap.second $t@721@01)) (field_address$$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Address> address@718@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
        (to_bytes$I64<Bytes> (destructor$Snap$Tuple$$I64$Bool$$I64$Bool$$$tuple_0<Snap$I64> snapshot@722@01)))))
  :pattern ((to_bytes$Tuple$$I64$Bool$$I64$Bool$<Bytes> snapshot@722@01))
  :qid |prog.l1864|)))
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- memory_copy$I64 ----------
(declare-const source_address@726@01 Address)
(declare-const target_address@727@01 Address)
(declare-const permission_amount@728@01 $Perm)
(declare-const source_address@729@01 Address)
(declare-const target_address@730@01 Address)
(declare-const permission_amount@731@01 $Perm)
(push) ; 1
(declare-const $t@732@01 $Snap)
(assert (= $t@732@01 ($Snap.combine ($Snap.first $t@732@01) ($Snap.second $t@732@01))))
(assert (= ($Snap.first $t@732@01) $Snap.unit))
; [eval] none < permission_amount
(assert (< $Perm.No permission_amount@731@01))
(assert (=
  ($Snap.second $t@732@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@732@01))
    ($Snap.second ($Snap.second $t@732@01)))))
; [eval] Size$I64$()
; [eval] Size$I64$()
(push) ; 2
(assert (not (or (= permission_amount@731@01 $Perm.No) (< $Perm.No permission_amount@731@01))))
(check-sat)
; unsat
(pop) ; 2
; 0.00s
; (get-info :all-statistics)
(push) ; 2
(set-option :timeout 10)
(assert (not (= target_address@730@01 source_address@729@01)))
(check-sat)
; unknown
(pop) ; 2
; 0.00s
; (get-info :all-statistics)
(assert (<= $Perm.No permission_amount@731@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@733@01 $Snap)
(assert (= $t@733@01 ($Snap.combine ($Snap.first $t@733@01) ($Snap.second $t@733@01))))
; [eval] Size$I64$()
(assert (=
  ($Snap.second $t@733@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@733@01))
    ($Snap.second ($Snap.second $t@733@01)))))
; [eval] Size$I64$()
(push) ; 3
(assert (not (or (= permission_amount@731@01 $Perm.No) (< $Perm.No permission_amount@731@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(push) ; 3
(set-option :timeout 10)
(assert (not (= target_address@730@01 source_address@729@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second $t@733@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@733@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@733@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@733@01))) $Snap.unit))
; [eval] MemoryBlock$bytes(source_address, Size$I64$()) == old(MemoryBlock$bytes(source_address, Size$I64$()))
; [eval] MemoryBlock$bytes(source_address, Size$I64$())
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 3
(declare-const $k@734@01 $Perm)
(assert ($Perm.isReadVar $k@734@01))
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= permission_amount@731@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (< $k@734@01 permission_amount@731@01))
(assert (<= $Perm.No (- permission_amount@731@01 $k@734@01)))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@734@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@733@01)) source_address@729@01 (as Size$I64$<Snap$Usize>  Snap$Usize)))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@734@01))
(assert (and
  (< $k@734@01 permission_amount@731@01)
  (<= $Perm.No (- permission_amount@731@01 $k@734@01))
  (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@733@01)) source_address@729@01 (as Size$I64$<Snap$Usize>  Snap$Usize))))
; [eval] old(MemoryBlock$bytes(source_address, Size$I64$()))
; [eval] MemoryBlock$bytes(source_address, Size$I64$())
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 3
(declare-const $k@735@01 $Perm)
(assert ($Perm.isReadVar $k@735@01))
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= permission_amount@731@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (< $k@735@01 permission_amount@731@01))
(assert (<= $Perm.No (- permission_amount@731@01 $k@735@01)))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@735@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.second ($Snap.second $t@732@01)) source_address@729@01 (as Size$I64$<Snap$Usize>  Snap$Usize)))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@735@01))
(assert (and
  (< $k@735@01 permission_amount@731@01)
  (<= $Perm.No (- permission_amount@731@01 $k@735@01))
  (MemoryBlock$bytes%precondition ($Snap.second ($Snap.second $t@732@01)) source_address@729@01 (as Size$I64$<Snap$Usize>  Snap$Usize))))
(assert (=
  (MemoryBlock$bytes ($Snap.first ($Snap.second $t@733@01)) source_address@729@01 (as Size$I64$<Snap$Usize>  Snap$Usize))
  (MemoryBlock$bytes ($Snap.second ($Snap.second $t@732@01)) source_address@729@01 (as Size$I64$<Snap$Usize>  Snap$Usize))))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@733@01))) $Snap.unit))
; [eval] MemoryBlock$bytes(target_address, Size$I64$()) == MemoryBlock$bytes(source_address, Size$I64$())
; [eval] MemoryBlock$bytes(target_address, Size$I64$())
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 3
(declare-const $k@736@01 $Perm)
(assert ($Perm.isReadVar $k@736@01))
(assert (< $k@736@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@736@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@736@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first $t@733@01) target_address@730@01 (as Size$I64$<Snap$Usize>  Snap$Usize)))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@736@01))
(assert (and
  (< $k@736@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@736@01))
  (MemoryBlock$bytes%precondition ($Snap.first $t@733@01) target_address@730@01 (as Size$I64$<Snap$Usize>  Snap$Usize))))
; [eval] MemoryBlock$bytes(source_address, Size$I64$())
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 3
(declare-const $k@737@01 $Perm)
(assert ($Perm.isReadVar $k@737@01))
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= permission_amount@731@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (< $k@737@01 permission_amount@731@01))
(assert (<= $Perm.No (- permission_amount@731@01 $k@737@01)))
(set-option :timeout 0)
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
(assert (and
  (< $k@737@01 permission_amount@731@01)
  (<= $Perm.No (- permission_amount@731@01 $k@737@01))))
(assert (=
  (MemoryBlock$bytes ($Snap.first $t@733@01) target_address@730@01 (as Size$I64$<Snap$Usize>  Snap$Usize))
  (MemoryBlock$bytes ($Snap.first ($Snap.second $t@733@01)) source_address@729@01 (as Size$I64$<Snap$Usize>  Snap$Usize))))
(pop) ; 2
(set-option :timeout 0)
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- move_place$I64 ----------
(declare-const target_place@738@01 Place)
(declare-const target_root_address@739@01 Address)
(declare-const source_place@740@01 Place)
(declare-const source_root_address@741@01 Address)
(declare-const source_snapshot@742@01 Snap$I64)
(declare-const target_place@743@01 Place)
(declare-const target_root_address@744@01 Address)
(declare-const source_place@745@01 Place)
(declare-const source_root_address@746@01 Address)
(declare-const source_snapshot@747@01 Snap$I64)
(push) ; 1
(declare-const $t@748@01 $Snap)
(assert (= $t@748@01 ($Snap.combine ($Snap.first $t@748@01) ($Snap.second $t@748@01))))
; [eval] compute_address(target_place, target_root_address)
; [eval] Size$I64$()
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@749@01 $Snap)
(assert (= $t@749@01 ($Snap.combine ($Snap.first $t@749@01) ($Snap.second $t@749@01))))
(assert (=
  ($Snap.second $t@749@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@749@01))
    ($Snap.second ($Snap.second $t@749@01)))))
; [eval] compute_address(source_place, source_root_address)
; [eval] Size$I64$()
(assert (= ($Snap.second ($Snap.second $t@749@01)) $Snap.unit))
; [eval] valid$Snap$I64(source_snapshot)
(assert (valid$Snap$I64<Bool> source_snapshot@747@01))
(pop) ; 2
(push) ; 2
; [exec]
; unfold acc(OwnedNonAliased$I64(source_place, source_root_address, source_snapshot), write)
(assert (=
  ($Snap.second $t@748@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@748@01))
    ($Snap.second ($Snap.second $t@748@01)))))
(assert (= ($Snap.first ($Snap.second $t@748@01)) $Snap.unit))
; [eval] valid$Snap$I64(snapshot)
(assert (valid$Snap$I64<Bool> source_snapshot@747@01))
(assert (=
  ($Snap.second ($Snap.second $t@748@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@748@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@748@01))))))
; [eval] compute_address(place, root_address)
; [eval] Size$I64$()
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> target_place@743@01 target_root_address@744@01)
  (compute_address<Address> source_place@745@01 source_root_address@746@01))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@748@01))) $Snap.unit))
; [eval] MemoryBlock$bytes(compute_address(place, root_address), Size$I64$()) == to_bytes$I64(snapshot)
; [eval] MemoryBlock$bytes(compute_address(place, root_address), Size$I64$())
; [eval] compute_address(place, root_address)
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 3
(declare-const $k@750@01 $Perm)
(assert ($Perm.isReadVar $k@750@01))
(assert (< $k@750@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@750@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@750@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second ($Snap.second $t@748@01))) (compute_address<Address> source_place@745@01 source_root_address@746@01) (as Size$I64$<Snap$Usize>  Snap$Usize)))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@750@01))
(assert (and
  (< $k@750@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@750@01))
  (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second ($Snap.second $t@748@01))) (compute_address<Address> source_place@745@01 source_root_address@746@01) (as Size$I64$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$I64(snapshot)
(assert (=
  (MemoryBlock$bytes ($Snap.first ($Snap.second ($Snap.second $t@748@01))) (compute_address<Address> source_place@745@01 source_root_address@746@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
  (to_bytes$I64<Bytes> source_snapshot@747@01)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (OwnedNonAliased$I64%trigger ($Snap.second $t@748@01) source_place@745@01 source_root_address@746@01 source_snapshot@747@01))
; [exec]
; memory_copy$I64(compute_address(source_place, source_root_address), compute_address(target_place,
;   target_root_address), write)
; [eval] compute_address(source_place, source_root_address)
; [eval] compute_address(target_place, target_root_address)
; [eval] none < permission_amount
; [eval] Size$I64$()
; [eval] Size$I64$()
(declare-const $t@751@01 $Snap)
(assert (= $t@751@01 ($Snap.combine ($Snap.first $t@751@01) ($Snap.second $t@751@01))))
; [eval] Size$I64$()
(assert (=
  ($Snap.second $t@751@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@751@01))
    ($Snap.second ($Snap.second $t@751@01)))))
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  (compute_address<Address> target_place@743@01 target_root_address@744@01)
  (compute_address<Address> source_place@745@01 source_root_address@746@01))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second $t@751@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@751@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@751@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@751@01))) $Snap.unit))
; [eval] MemoryBlock$bytes(source_address, Size$I64$()) == old(MemoryBlock$bytes(source_address, Size$I64$()))
; [eval] MemoryBlock$bytes(source_address, Size$I64$())
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 3
(declare-const $k@752@01 $Perm)
(assert ($Perm.isReadVar $k@752@01))
(assert (< $k@752@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@752@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@752@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@751@01)) (compute_address<Address> source_place@745@01 source_root_address@746@01) (as Size$I64$<Snap$Usize>  Snap$Usize)))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@752@01))
(assert (and
  (< $k@752@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@752@01))
  (MemoryBlock$bytes%precondition ($Snap.first ($Snap.second $t@751@01)) (compute_address<Address> source_place@745@01 source_root_address@746@01) (as Size$I64$<Snap$Usize>  Snap$Usize))))
; [eval] old(MemoryBlock$bytes(source_address, Size$I64$()))
; [eval] MemoryBlock$bytes(source_address, Size$I64$())
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 3
(declare-const $k@753@01 $Perm)
(assert ($Perm.isReadVar $k@753@01))
(assert (< $k@753@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@753@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@753@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@753@01))
(assert (and (< $k@753@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@753@01))))
(assert (=
  (MemoryBlock$bytes ($Snap.first ($Snap.second $t@751@01)) (compute_address<Address> source_place@745@01 source_root_address@746@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
  (MemoryBlock$bytes ($Snap.first ($Snap.second ($Snap.second $t@748@01))) (compute_address<Address> source_place@745@01 source_root_address@746@01) (as Size$I64$<Snap$Usize>  Snap$Usize))))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@751@01))) $Snap.unit))
; [eval] MemoryBlock$bytes(target_address, Size$I64$()) == MemoryBlock$bytes(source_address, Size$I64$())
; [eval] MemoryBlock$bytes(target_address, Size$I64$())
; [eval] Size$I64$()
(set-option :timeout 0)
(push) ; 3
(declare-const $k@754@01 $Perm)
(assert ($Perm.isReadVar $k@754@01))
(assert (< $k@754@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@754@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@754@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first $t@751@01) (compute_address<Address> target_place@743@01 target_root_address@744@01) (as Size$I64$<Snap$Usize>  Snap$Usize)))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@754@01))
(assert (and
  (< $k@754@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@754@01))
  (MemoryBlock$bytes%precondition ($Snap.first $t@751@01) (compute_address<Address> target_place@743@01 target_root_address@744@01) (as Size$I64$<Snap$Usize>  Snap$Usize))))
; [eval] MemoryBlock$bytes(source_address, Size$I64$())
; [eval] Size$I64$()
(set-option :timeout 0)
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
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@755@01))
(assert (and (< $k@755@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@755@01))))
(assert (=
  (MemoryBlock$bytes ($Snap.first $t@751@01) (compute_address<Address> target_place@743@01 target_root_address@744@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
  (MemoryBlock$bytes ($Snap.first ($Snap.second $t@751@01)) (compute_address<Address> source_place@745@01 source_root_address@746@01) (as Size$I64$<Snap$Usize>  Snap$Usize))))
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
(declare-const $k@756@01 $Perm)
(assert ($Perm.isReadVar $k@756@01))
(assert (< $k@756@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@756@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@756@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@756@01))
(assert (and (< $k@756@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@756@01))))
; [eval] to_bytes$I64(snapshot)
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  (MemoryBlock$bytes ($Snap.first $t@751@01) (compute_address<Address> target_place@743@01 target_root_address@744@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
  (to_bytes$I64<Bytes> source_snapshot@747@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (=
  (MemoryBlock$bytes ($Snap.first $t@751@01) (compute_address<Address> target_place@743@01 target_root_address@744@01) (as Size$I64$<Snap$Usize>  Snap$Usize))
  (to_bytes$I64<Bytes> source_snapshot@747@01)))
(assert (OwnedNonAliased$I64%trigger ($Snap.combine
  $Snap.unit
  ($Snap.combine ($Snap.first $t@751@01) $Snap.unit)) target_place@743@01 target_root_address@744@01 source_snapshot@747@01))
; [eval] compute_address(source_place, source_root_address)
; [eval] Size$I64$()
; [eval] valid$Snap$I64(source_snapshot)
(pop) ; 2
(pop) ; 1
; ---------- write_address_constant$Bool ----------
(declare-const target_address@757@01 Address)
(declare-const source_snapshot@758@01 Snap$Bool)
(declare-const target_address@759@01 Address)
(declare-const source_snapshot@760@01 Snap$Bool)
(push) ; 1
; [eval] Size$Bool$()
(declare-const $t@761@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@762@01 $Snap)
(assert (= $t@762@01 ($Snap.combine ($Snap.first $t@762@01) ($Snap.second $t@762@01))))
; [eval] Size$Bool$()
(assert (= ($Snap.second $t@762@01) $Snap.unit))
; [eval] MemoryBlock$bytes(target_address, Size$Bool$()) == to_bytes$Bool(source_snapshot)
; [eval] MemoryBlock$bytes(target_address, Size$Bool$())
; [eval] Size$Bool$()
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
(assert (MemoryBlock$bytes%precondition ($Snap.first $t@762@01) target_address@759@01 (as Size$Bool$<Snap$Usize>  Snap$Usize)))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@763@01))
(assert (and
  (< $k@763@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@763@01))
  (MemoryBlock$bytes%precondition ($Snap.first $t@762@01) target_address@759@01 (as Size$Bool$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$Bool(source_snapshot)
(assert (=
  (MemoryBlock$bytes ($Snap.first $t@762@01) target_address@759@01 (as Size$Bool$<Snap$Usize>  Snap$Usize))
  (to_bytes$Bool<Bytes> source_snapshot@760@01)))
(pop) ; 2
(set-option :timeout 0)
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- write_address_constant$I64 ----------
(declare-const target_address@764@01 Address)
(declare-const source_snapshot@765@01 Snap$I64)
(declare-const target_address@766@01 Address)
(declare-const source_snapshot@767@01 Snap$I64)
(push) ; 1
; [eval] Size$I64$()
(declare-const $t@768@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@769@01 $Snap)
(assert (= $t@769@01 ($Snap.combine ($Snap.first $t@769@01) ($Snap.second $t@769@01))))
; [eval] Size$I64$()
(assert (= ($Snap.second $t@769@01) $Snap.unit))
; [eval] MemoryBlock$bytes(target_address, Size$I64$()) == to_bytes$I64(source_snapshot)
; [eval] MemoryBlock$bytes(target_address, Size$I64$())
; [eval] Size$I64$()
(push) ; 3
(declare-const $k@770@01 $Perm)
(assert ($Perm.isReadVar $k@770@01))
(assert (< $k@770@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@770@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@770@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first $t@769@01) target_address@766@01 (as Size$I64$<Snap$Usize>  Snap$Usize)))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@770@01))
(assert (and
  (< $k@770@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@770@01))
  (MemoryBlock$bytes%precondition ($Snap.first $t@769@01) target_address@766@01 (as Size$I64$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$I64(source_snapshot)
(assert (=
  (MemoryBlock$bytes ($Snap.first $t@769@01) target_address@766@01 (as Size$I64$<Snap$Usize>  Snap$Usize))
  (to_bytes$I64<Bytes> source_snapshot@767@01)))
(pop) ; 2
(set-option :timeout 0)
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- write_place_constant$Bool ----------
(declare-const target_place@771@01 Place)
(declare-const target_root_address@772@01 Address)
(declare-const source_snapshot@773@01 Snap$Bool)
(declare-const target_place@774@01 Place)
(declare-const target_root_address@775@01 Address)
(declare-const source_snapshot@776@01 Snap$Bool)
(push) ; 1
(declare-const $t@777@01 $Snap)
(assert (= $t@777@01 ($Snap.combine ($Snap.first $t@777@01) ($Snap.second $t@777@01))))
; [eval] compute_address(target_place, target_root_address)
; [eval] Size$Bool$()
(assert (= ($Snap.second $t@777@01) $Snap.unit))
; [eval] valid$Snap$Bool(source_snapshot)
(assert (valid$Snap$Bool<Bool> source_snapshot@776@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@778@01 $Snap)
(pop) ; 2
(push) ; 2
; [exec]
; write_address_constant$Bool(compute_address(target_place, target_root_address),
;   source_snapshot)
; [eval] compute_address(target_place, target_root_address)
; [eval] Size$Bool$()
(declare-const $t@779@01 $Snap)
(assert (= $t@779@01 ($Snap.combine ($Snap.first $t@779@01) ($Snap.second $t@779@01))))
; [eval] Size$Bool$()
(assert (= ($Snap.second $t@779@01) $Snap.unit))
; [eval] MemoryBlock$bytes(target_address, Size$Bool$()) == to_bytes$Bool(source_snapshot)
; [eval] MemoryBlock$bytes(target_address, Size$Bool$())
; [eval] Size$Bool$()
(push) ; 3
(declare-const $k@780@01 $Perm)
(assert ($Perm.isReadVar $k@780@01))
(assert (< $k@780@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@780@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@780@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (MemoryBlock$bytes%precondition ($Snap.first $t@779@01) (compute_address<Address> target_place@774@01 target_root_address@775@01) (as Size$Bool$<Snap$Usize>  Snap$Usize)))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@780@01))
(assert (and
  (< $k@780@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@780@01))
  (MemoryBlock$bytes%precondition ($Snap.first $t@779@01) (compute_address<Address> target_place@774@01 target_root_address@775@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))))
; [eval] to_bytes$Bool(source_snapshot)
(assert (=
  (MemoryBlock$bytes ($Snap.first $t@779@01) (compute_address<Address> target_place@774@01 target_root_address@775@01) (as Size$Bool$<Snap$Usize>  Snap$Usize))
  (to_bytes$Bool<Bytes> source_snapshot@776@01)))
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
(declare-const $k@781@01 $Perm)
(assert ($Perm.isReadVar $k@781@01))
(assert (< $k@781@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@781@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@781@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@781@01))
(assert (and (< $k@781@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@781@01))))
; [eval] to_bytes$Bool(snapshot)
(assert (OwnedNonAliased$Bool%trigger ($Snap.combine
  $Snap.unit
  ($Snap.combine ($Snap.first $t@779@01) $Snap.unit)) target_place@774@01 target_root_address@775@01 source_snapshot@776@01))
(pop) ; 2
(pop) ; 1
; ---------- write_place_constant$Tuple$$$ ----------
(declare-const target_place@782@01 Place)
(declare-const target_root_address@783@01 Address)
(declare-const source_snapshot@784@01 Snap$Tuple$$$)
(declare-const target_place@785@01 Place)
(declare-const target_root_address@786@01 Address)
(declare-const source_snapshot@787@01 Snap$Tuple$$$)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@788@01 $Snap)
(assert (= $t@788@01 ($Snap.combine ($Snap.first $t@788@01) ($Snap.second $t@788@01))))
; [eval] compute_address(target_place, target_root_address)
; [eval] Size$Tuple$$$$()
(assert (= ($Snap.second $t@788@01) $Snap.unit))
; [eval] valid$Snap$Tuple$$$(source_snapshot)
(assert (valid$Snap$Tuple$$$<Bool> source_snapshot@787@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@789@01 $Snap)
(pop) ; 2
(push) ; 2
; [exec]
; memory_block_split$Tuple$$$(compute_address(target_place, target_root_address),
;   write)
; [eval] compute_address(target_place, target_root_address)
; [eval] none < permission_amount
; [eval] Size$Tuple$$$$()
(declare-const $t@790@01 $Snap)
(assert (= $t@790@01 ($Snap.combine ($Snap.first $t@790@01) ($Snap.second $t@790@01))))
; [eval] PaddingSize$Tuple$$$$()
(assert (= ($Snap.second $t@790@01) $Snap.unit))
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
  ($Snap.first $t@790@01)) target_place@785@01 target_root_address@786@01 source_snapshot@787@01))
(pop) ; 2
(pop) ; 1
