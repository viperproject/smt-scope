(get-info :version)
; (:version "4.12.1")
; Started: 2023-10-31 14:21:04
; Silicon.version: 1.1-SNAPSHOT (46944a65@dspil_symbenchmarking)
; Input file: /home/pcorrect/repos/benchmarking_general/silicon_tests/prusti_tests_._pass_._slices_._slice-split_._slice-split.rs_slice_split--main-Both.vpr
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
(declare-sort Seq<Int> 0)
(declare-sort Set<$Ref> 0)
(declare-sort Set<Bool> 0)
(declare-sort Set<Int> 0)
(declare-sort Set<$Snap> 0)
(declare-sort Snap$Slice$i32 0)
(declare-sort $FVF<val_ref> 0)
(declare-sort $FVF<tuple_0> 0)
(declare-sort $FVF<tuple_1> 0)
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
(declare-fun $SortWrappers.Seq<Int>To$Snap (Seq<Int>) $Snap)
(declare-fun $SortWrappers.$SnapToSeq<Int> ($Snap) Seq<Int>)
(assert (forall ((x Seq<Int>)) (!
    (= x ($SortWrappers.$SnapToSeq<Int>($SortWrappers.Seq<Int>To$Snap x)))
    :pattern (($SortWrappers.Seq<Int>To$Snap x))
    :qid |$Snap.$SnapToSeq<Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Seq<Int>To$Snap($SortWrappers.$SnapToSeq<Int> x)))
    :pattern (($SortWrappers.$SnapToSeq<Int> x))
    :qid |$Snap.Seq<Int>To$SnapToSeq<Int>|
    )))
; Declaring additional sort wrappers
(declare-fun $SortWrappers.Set<$Ref>To$Snap (Set<$Ref>) $Snap)
(declare-fun $SortWrappers.$SnapToSet<$Ref> ($Snap) Set<$Ref>)
(assert (forall ((x Set<$Ref>)) (!
    (= x ($SortWrappers.$SnapToSet<$Ref>($SortWrappers.Set<$Ref>To$Snap x)))
    :pattern (($SortWrappers.Set<$Ref>To$Snap x))
    :qid |$Snap.$SnapToSet<$Ref>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Set<$Ref>To$Snap($SortWrappers.$SnapToSet<$Ref> x)))
    :pattern (($SortWrappers.$SnapToSet<$Ref> x))
    :qid |$Snap.Set<$Ref>To$SnapToSet<$Ref>|
    )))
(declare-fun $SortWrappers.Set<Bool>To$Snap (Set<Bool>) $Snap)
(declare-fun $SortWrappers.$SnapToSet<Bool> ($Snap) Set<Bool>)
(assert (forall ((x Set<Bool>)) (!
    (= x ($SortWrappers.$SnapToSet<Bool>($SortWrappers.Set<Bool>To$Snap x)))
    :pattern (($SortWrappers.Set<Bool>To$Snap x))
    :qid |$Snap.$SnapToSet<Bool>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Set<Bool>To$Snap($SortWrappers.$SnapToSet<Bool> x)))
    :pattern (($SortWrappers.$SnapToSet<Bool> x))
    :qid |$Snap.Set<Bool>To$SnapToSet<Bool>|
    )))
(declare-fun $SortWrappers.Set<Int>To$Snap (Set<Int>) $Snap)
(declare-fun $SortWrappers.$SnapToSet<Int> ($Snap) Set<Int>)
(assert (forall ((x Set<Int>)) (!
    (= x ($SortWrappers.$SnapToSet<Int>($SortWrappers.Set<Int>To$Snap x)))
    :pattern (($SortWrappers.Set<Int>To$Snap x))
    :qid |$Snap.$SnapToSet<Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Set<Int>To$Snap($SortWrappers.$SnapToSet<Int> x)))
    :pattern (($SortWrappers.$SnapToSet<Int> x))
    :qid |$Snap.Set<Int>To$SnapToSet<Int>|
    )))
(declare-fun $SortWrappers.Set<$Snap>To$Snap (Set<$Snap>) $Snap)
(declare-fun $SortWrappers.$SnapToSet<$Snap> ($Snap) Set<$Snap>)
(assert (forall ((x Set<$Snap>)) (!
    (= x ($SortWrappers.$SnapToSet<$Snap>($SortWrappers.Set<$Snap>To$Snap x)))
    :pattern (($SortWrappers.Set<$Snap>To$Snap x))
    :qid |$Snap.$SnapToSet<$Snap>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Set<$Snap>To$Snap($SortWrappers.$SnapToSet<$Snap> x)))
    :pattern (($SortWrappers.$SnapToSet<$Snap> x))
    :qid |$Snap.Set<$Snap>To$SnapToSet<$Snap>|
    )))
; Declaring additional sort wrappers
(declare-fun $SortWrappers.Snap$Slice$i32To$Snap (Snap$Slice$i32) $Snap)
(declare-fun $SortWrappers.$SnapToSnap$Slice$i32 ($Snap) Snap$Slice$i32)
(assert (forall ((x Snap$Slice$i32)) (!
    (= x ($SortWrappers.$SnapToSnap$Slice$i32($SortWrappers.Snap$Slice$i32To$Snap x)))
    :pattern (($SortWrappers.Snap$Slice$i32To$Snap x))
    :qid |$Snap.$SnapToSnap$Slice$i32To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Snap$Slice$i32To$Snap($SortWrappers.$SnapToSnap$Slice$i32 x)))
    :pattern (($SortWrappers.$SnapToSnap$Slice$i32 x))
    :qid |$Snap.Snap$Slice$i32To$SnapToSnap$Slice$i32|
    )))
; Declaring additional sort wrappers
(declare-fun $SortWrappers.$FVF<val_ref>To$Snap ($FVF<val_ref>) $Snap)
(declare-fun $SortWrappers.$SnapTo$FVF<val_ref> ($Snap) $FVF<val_ref>)
(assert (forall ((x $FVF<val_ref>)) (!
    (= x ($SortWrappers.$SnapTo$FVF<val_ref>($SortWrappers.$FVF<val_ref>To$Snap x)))
    :pattern (($SortWrappers.$FVF<val_ref>To$Snap x))
    :qid |$Snap.$SnapTo$FVF<val_ref>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$FVF<val_ref>To$Snap($SortWrappers.$SnapTo$FVF<val_ref> x)))
    :pattern (($SortWrappers.$SnapTo$FVF<val_ref> x))
    :qid |$Snap.$FVF<val_ref>To$SnapTo$FVF<val_ref>|
    )))
(declare-fun $SortWrappers.$FVF<tuple_0>To$Snap ($FVF<tuple_0>) $Snap)
(declare-fun $SortWrappers.$SnapTo$FVF<tuple_0> ($Snap) $FVF<tuple_0>)
(assert (forall ((x $FVF<tuple_0>)) (!
    (= x ($SortWrappers.$SnapTo$FVF<tuple_0>($SortWrappers.$FVF<tuple_0>To$Snap x)))
    :pattern (($SortWrappers.$FVF<tuple_0>To$Snap x))
    :qid |$Snap.$SnapTo$FVF<tuple_0>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$FVF<tuple_0>To$Snap($SortWrappers.$SnapTo$FVF<tuple_0> x)))
    :pattern (($SortWrappers.$SnapTo$FVF<tuple_0> x))
    :qid |$Snap.$FVF<tuple_0>To$SnapTo$FVF<tuple_0>|
    )))
(declare-fun $SortWrappers.$FVF<tuple_1>To$Snap ($FVF<tuple_1>) $Snap)
(declare-fun $SortWrappers.$SnapTo$FVF<tuple_1> ($Snap) $FVF<tuple_1>)
(assert (forall ((x $FVF<tuple_1>)) (!
    (= x ($SortWrappers.$SnapTo$FVF<tuple_1>($SortWrappers.$FVF<tuple_1>To$Snap x)))
    :pattern (($SortWrappers.$FVF<tuple_1>To$Snap x))
    :qid |$Snap.$SnapTo$FVF<tuple_1>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$FVF<tuple_1>To$Snap($SortWrappers.$SnapTo$FVF<tuple_1> x)))
    :pattern (($SortWrappers.$SnapTo$FVF<tuple_1> x))
    :qid |$Snap.$FVF<tuple_1>To$SnapTo$FVF<tuple_1>|
    )))
; Declaring additional sort wrappers
(declare-fun $SortWrappers.___BitVec_32_To$Snap ((_ BitVec 32)) $Snap)
(declare-fun $SortWrappers.$SnapTo___BitVec_32_ ($Snap) (_ BitVec 32))
(assert (forall ((x (_ BitVec 32))) (!
    (= x ($SortWrappers.$SnapTo___BitVec_32_($SortWrappers.___BitVec_32_To$Snap x)))
    :pattern (($SortWrappers.___BitVec_32_To$Snap x))
    :qid |$Snap.$SnapTo___BitVec_32_To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.___BitVec_32_To$Snap($SortWrappers.$SnapTo___BitVec_32_ x)))
    :pattern (($SortWrappers.$SnapTo___BitVec_32_ x))
    :qid |$Snap.___BitVec_32_To$SnapTo___BitVec_32_|
    )))
(declare-fun $SortWrappers.___FloatingPoint_8_24_To$Snap ((_ FloatingPoint 8 24)) $Snap)
(declare-fun $SortWrappers.$SnapTo___FloatingPoint_8_24_ ($Snap) (_ FloatingPoint 8 24))
(assert (forall ((x (_ FloatingPoint 8 24))) (!
    (= x ($SortWrappers.$SnapTo___FloatingPoint_8_24_($SortWrappers.___FloatingPoint_8_24_To$Snap x)))
    :pattern (($SortWrappers.___FloatingPoint_8_24_To$Snap x))
    :qid |$Snap.$SnapTo___FloatingPoint_8_24_To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.___FloatingPoint_8_24_To$Snap($SortWrappers.$SnapTo___FloatingPoint_8_24_ x)))
    :pattern (($SortWrappers.$SnapTo___FloatingPoint_8_24_ x))
    :qid |$Snap.___FloatingPoint_8_24_To$SnapTo___FloatingPoint_8_24_|
    )))
(declare-fun $SortWrappers.___BitVec_64_To$Snap ((_ BitVec 64)) $Snap)
(declare-fun $SortWrappers.$SnapTo___BitVec_64_ ($Snap) (_ BitVec 64))
(assert (forall ((x (_ BitVec 64))) (!
    (= x ($SortWrappers.$SnapTo___BitVec_64_($SortWrappers.___BitVec_64_To$Snap x)))
    :pattern (($SortWrappers.___BitVec_64_To$Snap x))
    :qid |$Snap.$SnapTo___BitVec_64_To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.___BitVec_64_To$Snap($SortWrappers.$SnapTo___BitVec_64_ x)))
    :pattern (($SortWrappers.$SnapTo___BitVec_64_ x))
    :qid |$Snap.___BitVec_64_To$SnapTo___BitVec_64_|
    )))
(declare-fun $SortWrappers.___FloatingPoint_12_52_To$Snap ((_ FloatingPoint 12 52)) $Snap)
(declare-fun $SortWrappers.$SnapTo___FloatingPoint_12_52_ ($Snap) (_ FloatingPoint 12 52))
(assert (forall ((x (_ FloatingPoint 12 52))) (!
    (= x ($SortWrappers.$SnapTo___FloatingPoint_12_52_($SortWrappers.___FloatingPoint_12_52_To$Snap x)))
    :pattern (($SortWrappers.___FloatingPoint_12_52_To$Snap x))
    :qid |$Snap.$SnapTo___FloatingPoint_12_52_To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.___FloatingPoint_12_52_To$Snap($SortWrappers.$SnapTo___FloatingPoint_12_52_ x)))
    :pattern (($SortWrappers.$SnapTo___FloatingPoint_12_52_ x))
    :qid |$Snap.___FloatingPoint_12_52_To$SnapTo___FloatingPoint_12_52_|
    )))
(declare-fun $SortWrappers.___BitVec_8_To$Snap ((_ BitVec 8)) $Snap)
(declare-fun $SortWrappers.$SnapTo___BitVec_8_ ($Snap) (_ BitVec 8))
(assert (forall ((x (_ BitVec 8))) (!
    (= x ($SortWrappers.$SnapTo___BitVec_8_($SortWrappers.___BitVec_8_To$Snap x)))
    :pattern (($SortWrappers.___BitVec_8_To$Snap x))
    :qid |$Snap.$SnapTo___BitVec_8_To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.___BitVec_8_To$Snap($SortWrappers.$SnapTo___BitVec_8_ x)))
    :pattern (($SortWrappers.$SnapTo___BitVec_8_ x))
    :qid |$Snap.___BitVec_8_To$SnapTo___BitVec_8_|
    )))
(declare-fun $SortWrappers.___BitVec_16_To$Snap ((_ BitVec 16)) $Snap)
(declare-fun $SortWrappers.$SnapTo___BitVec_16_ ($Snap) (_ BitVec 16))
(assert (forall ((x (_ BitVec 16))) (!
    (= x ($SortWrappers.$SnapTo___BitVec_16_($SortWrappers.___BitVec_16_To$Snap x)))
    :pattern (($SortWrappers.___BitVec_16_To$Snap x))
    :qid |$Snap.$SnapTo___BitVec_16_To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.___BitVec_16_To$Snap($SortWrappers.$SnapTo___BitVec_16_ x)))
    :pattern (($SortWrappers.$SnapTo___BitVec_16_ x))
    :qid |$Snap.___BitVec_16_To$SnapTo___BitVec_16_|
    )))
(declare-fun $SortWrappers.___BitVec_128_To$Snap ((_ BitVec 128)) $Snap)
(declare-fun $SortWrappers.$SnapTo___BitVec_128_ ($Snap) (_ BitVec 128))
(assert (forall ((x (_ BitVec 128))) (!
    (= x ($SortWrappers.$SnapTo___BitVec_128_($SortWrappers.___BitVec_128_To$Snap x)))
    :pattern (($SortWrappers.___BitVec_128_To$Snap x))
    :qid |$Snap.$SnapTo___BitVec_128_To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.___BitVec_128_To$Snap($SortWrappers.$SnapTo___BitVec_128_ x)))
    :pattern (($SortWrappers.$SnapTo___BitVec_128_ x))
    :qid |$Snap.___BitVec_128_To$SnapTo___BitVec_128_|
    )))
; ////////// Symbols
(declare-fun Set_in ($Ref Set<$Ref>) Bool)
(declare-fun Set_card (Set<$Ref>) Int)
(declare-const Set_empty Set<$Ref>)
(declare-fun Set_singleton ($Ref) Set<$Ref>)
(declare-fun Set_unionone (Set<$Ref> $Ref) Set<$Ref>)
(declare-fun Set_union (Set<$Ref> Set<$Ref>) Set<$Ref>)
(declare-fun Set_disjoint (Set<$Ref> Set<$Ref>) Bool)
(declare-fun Set_difference (Set<$Ref> Set<$Ref>) Set<$Ref>)
(declare-fun Set_intersection (Set<$Ref> Set<$Ref>) Set<$Ref>)
(declare-fun Set_subset (Set<$Ref> Set<$Ref>) Bool)
(declare-fun Set_equal (Set<$Ref> Set<$Ref>) Bool)
(declare-fun Set_in (Bool Set<Bool>) Bool)
(declare-fun Set_card (Set<Bool>) Int)
(declare-const Set_empty Set<Bool>)
(declare-fun Set_singleton (Bool) Set<Bool>)
(declare-fun Set_unionone (Set<Bool> Bool) Set<Bool>)
(declare-fun Set_union (Set<Bool> Set<Bool>) Set<Bool>)
(declare-fun Set_disjoint (Set<Bool> Set<Bool>) Bool)
(declare-fun Set_difference (Set<Bool> Set<Bool>) Set<Bool>)
(declare-fun Set_intersection (Set<Bool> Set<Bool>) Set<Bool>)
(declare-fun Set_subset (Set<Bool> Set<Bool>) Bool)
(declare-fun Set_equal (Set<Bool> Set<Bool>) Bool)
(declare-fun Set_in (Int Set<Int>) Bool)
(declare-fun Set_card (Set<Int>) Int)
(declare-const Set_empty Set<Int>)
(declare-fun Set_singleton (Int) Set<Int>)
(declare-fun Set_unionone (Set<Int> Int) Set<Int>)
(declare-fun Set_union (Set<Int> Set<Int>) Set<Int>)
(declare-fun Set_disjoint (Set<Int> Set<Int>) Bool)
(declare-fun Set_difference (Set<Int> Set<Int>) Set<Int>)
(declare-fun Set_intersection (Set<Int> Set<Int>) Set<Int>)
(declare-fun Set_subset (Set<Int> Set<Int>) Bool)
(declare-fun Set_equal (Set<Int> Set<Int>) Bool)
(declare-fun Set_in ($Snap Set<$Snap>) Bool)
(declare-fun Set_card (Set<$Snap>) Int)
(declare-const Set_empty Set<$Snap>)
(declare-fun Set_singleton ($Snap) Set<$Snap>)
(declare-fun Set_unionone (Set<$Snap> $Snap) Set<$Snap>)
(declare-fun Set_union (Set<$Snap> Set<$Snap>) Set<$Snap>)
(declare-fun Set_disjoint (Set<$Snap> Set<$Snap>) Bool)
(declare-fun Set_difference (Set<$Snap> Set<$Snap>) Set<$Snap>)
(declare-fun Set_intersection (Set<$Snap> Set<$Snap>) Set<$Snap>)
(declare-fun Set_subset (Set<$Snap> Set<$Snap>) Bool)
(declare-fun Set_equal (Set<$Snap> Set<$Snap>) Bool)
(declare-fun Seq_length (Seq<Int>) Int)
(declare-const Seq_empty Seq<Int>)
(declare-fun Seq_singleton (Int) Seq<Int>)
(declare-fun Seq_build (Seq<Int> Int) Seq<Int>)
(declare-fun Seq_index (Seq<Int> Int) Int)
(declare-fun Seq_append (Seq<Int> Seq<Int>) Seq<Int>)
(declare-fun Seq_update (Seq<Int> Int Int) Seq<Int>)
(declare-fun Seq_contains (Seq<Int> Int) Bool)
(declare-fun Seq_take (Seq<Int> Int) Seq<Int>)
(declare-fun Seq_drop (Seq<Int> Int) Seq<Int>)
(declare-fun Seq_equal (Seq<Int> Seq<Int>) Bool)
(declare-fun Seq_sameuntil (Seq<Int> Seq<Int> Int) Bool)
(declare-fun Seq_range (Int Int) Seq<Int>)
(declare-fun cons$Snap$Slice$i32$__$TY$__Seq$$int$$Snap$Slice$i32<Snap$Slice$i32> (Seq<Int>) Snap$Slice$i32)
(declare-fun uncons$Snap$Slice$i32$__$TY$__Snap$Slice$i32$Seq$$int$<Seq<Int>> (Snap$Slice$i32) Seq<Int>)
(declare-fun read$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$$$int$<Int> (Snap$Slice$i32 Int) Int)
(declare-fun len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (Snap$Slice$i32) Int)
; /field_value_functions_declarations.smt2 [val_ref: Ref]
(declare-fun $FVF.domain_val_ref ($FVF<val_ref>) Set<$Ref>)
(declare-fun $FVF.lookup_val_ref ($FVF<val_ref> $Ref) $Ref)
(declare-fun $FVF.after_val_ref ($FVF<val_ref> $FVF<val_ref>) Bool)
(declare-fun $FVF.loc_val_ref ($Ref $Ref) Bool)
(declare-fun $FVF.perm_val_ref ($FPM $Ref) $Perm)
(declare-const $fvfTOP_val_ref $FVF<val_ref>)
; /field_value_functions_declarations.smt2 [tuple_0: Ref]
(declare-fun $FVF.domain_tuple_0 ($FVF<tuple_0>) Set<$Ref>)
(declare-fun $FVF.lookup_tuple_0 ($FVF<tuple_0> $Ref) $Ref)
(declare-fun $FVF.after_tuple_0 ($FVF<tuple_0> $FVF<tuple_0>) Bool)
(declare-fun $FVF.loc_tuple_0 ($Ref $Ref) Bool)
(declare-fun $FVF.perm_tuple_0 ($FPM $Ref) $Perm)
(declare-const $fvfTOP_tuple_0 $FVF<tuple_0>)
; /field_value_functions_declarations.smt2 [tuple_1: Ref]
(declare-fun $FVF.domain_tuple_1 ($FVF<tuple_1>) Set<$Ref>)
(declare-fun $FVF.lookup_tuple_1 ($FVF<tuple_1> $Ref) $Ref)
(declare-fun $FVF.after_tuple_1 ($FVF<tuple_1> $FVF<tuple_1>) Bool)
(declare-fun $FVF.loc_tuple_1 ($Ref $Ref) Bool)
(declare-fun $FVF.perm_tuple_1 ($FPM $Ref) $Perm)
(declare-const $fvfTOP_tuple_1 $FVF<tuple_1>)
; Declaring symbols related to program functions (from program analysis)
(declare-fun read$ ($Snap) $Perm)
(declare-fun read$%limited ($Snap) $Perm)
(declare-const read$%stateless Bool)
(declare-fun read$%precondition ($Snap) Bool)
(declare-fun Slice$len__$TY$__i32$Slice$i32$$int$ ($Snap $Ref) Int)
(declare-fun Slice$len__$TY$__i32$Slice$i32$$int$%limited ($Snap $Ref) Int)
(declare-fun Slice$len__$TY$__i32$Slice$i32$$int$%stateless ($Ref) Bool)
(declare-fun Slice$len__$TY$__i32$Slice$i32$$int$%precondition ($Snap $Ref) Bool)
(declare-fun lookup_pure__$TY$__Slice$i32$i32$Slice$i32$$int$$$int$ ($Snap $Ref Int) Int)
(declare-fun lookup_pure__$TY$__Slice$i32$i32$Slice$i32$$int$$$int$%limited ($Snap $Ref Int) Int)
(declare-fun lookup_pure__$TY$__Slice$i32$i32$Slice$i32$$int$$$int$%stateless ($Ref Int) Bool)
(declare-fun lookup_pure__$TY$__Slice$i32$i32$Slice$i32$$int$$$int$%precondition ($Snap $Ref Int) Bool)
(declare-fun seq_collect$Slice$i32$__$TY$__Slice$i32$$int$$Seq$$int$ ($Snap $Ref Int) Seq<Int>)
(declare-fun seq_collect$Slice$i32$__$TY$__Slice$i32$$int$$Seq$$int$%limited ($Snap $Ref Int) Seq<Int>)
(declare-fun seq_collect$Slice$i32$__$TY$__Slice$i32$$int$$Seq$$int$%stateless ($Ref Int) Bool)
(declare-fun seq_collect$Slice$i32$__$TY$__Slice$i32$$int$$Seq$$int$%precondition ($Snap $Ref Int) Bool)
(declare-fun lookup_pure__$TY$__Array$13$i32$i32$Array$13$i32$$int$$$int$ ($Snap $Ref Int) Int)
(declare-fun lookup_pure__$TY$__Array$13$i32$i32$Array$13$i32$$int$$$int$%limited ($Snap $Ref Int) Int)
(declare-fun lookup_pure__$TY$__Array$13$i32$i32$Array$13$i32$$int$$$int$%stateless ($Ref Int) Bool)
(declare-fun lookup_pure__$TY$__Array$13$i32$i32$Array$13$i32$$int$$$int$%precondition ($Snap $Ref Int) Bool)
(declare-fun snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 ($Snap $Ref) Snap$Slice$i32)
(declare-fun snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32%limited ($Snap $Ref) Snap$Slice$i32)
(declare-fun snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32%stateless ($Ref) Bool)
(declare-fun snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32%precondition ($Snap $Ref) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun Array$13$i32%trigger ($Snap $Ref) Bool)
(declare-fun DeadBorrowToken$%trigger ($Snap Int) Bool)
(declare-fun Slice$i32%trigger ($Snap $Ref) Bool)
(declare-fun i32%trigger ($Snap $Ref) Bool)
(declare-fun ref$Slice$i32%trigger ($Snap $Ref) Bool)
(declare-fun tuple0$%trigger ($Snap $Ref) Bool)
(declare-fun tuple2$ref$Slice$i32$ref$Slice$i32%trigger ($Snap $Ref) Bool)
; ////////// Uniqueness assumptions from domains
; ////////// Axioms
(assert (forall ((s Seq<Int>)) (!
  (<= 0 (Seq_length s))
  :pattern ((Seq_length s))
  :qid |$Seq[Int]_prog.seq_length_non_negative|)))
(assert (= (Seq_length (as Seq_empty  Seq<Int>)) 0))
(assert (forall ((s Seq<Int>)) (!
  (=> (= (Seq_length s) 0) (= s (as Seq_empty  Seq<Int>)))
  :pattern ((Seq_length s))
  :qid |$Seq[Int]_prog.only_empty_seq_length_zero|)))
(assert (forall ((e Int)) (!
  (= (Seq_length (Seq_singleton e)) 1)
  :pattern ((Seq_length (Seq_singleton e)))
  :qid |$Seq[Int]_prog.length_singleton_seq|)))
(assert (forall ((s Seq<Int>) (e Int)) (!
  (= (Seq_length (Seq_build s e)) (+ 1 (Seq_length s)))
  :pattern ((Seq_length (Seq_build s e)))
  :qid |$Seq[Int]_prog.length_seq_build_inc_by_one|)))
(assert (forall ((s Seq<Int>) (i Int) (e Int)) (!
  (ite
    (= i (Seq_length s))
    (= (Seq_index (Seq_build s e) i) e)
    (= (Seq_index (Seq_build s e) i) (Seq_index s i)))
  :pattern ((Seq_index (Seq_build s e) i))
  :qid |$Seq[Int]_prog.seq_index_over_build|)))
(assert (forall ((s1 Seq<Int>) (s2 Seq<Int>)) (!
  (=>
    (and
      (not (= s1 (as Seq_empty  Seq<Int>)))
      (not (= s2 (as Seq_empty  Seq<Int>))))
    (= (Seq_length (Seq_append s1 s2)) (+ (Seq_length s1) (Seq_length s2))))
  :pattern ((Seq_length (Seq_append s1 s2)))
  :qid |$Seq[Int]_prog.seq_length_over_append|)))
(assert (forall ((e Int)) (!
  (= (Seq_index (Seq_singleton e) 0) e)
  :pattern ((Seq_singleton e))
  :qid |$Seq[Int]_prog.seq_index_over_singleton|)))
(assert (forall ((e1 Int) (e2 Int)) (!
  (= (Seq_contains (Seq_singleton e1) e2) (= e1 e2))
  :pattern ((Seq_contains (Seq_singleton e1) e2))
  :qid |$Seq[Int]_prog.seq_contains_over_singleton|)))
(assert (forall ((s Seq<Int>)) (!
  (= (Seq_append (as Seq_empty  Seq<Int>) s) s)
  :pattern ((Seq_append (as Seq_empty  Seq<Int>) s))
  :qid |$Seq[Int]_prog.seq_append_empty_left|)))
(assert (forall ((s Seq<Int>)) (!
  (= (Seq_append s (as Seq_empty  Seq<Int>)) s)
  :pattern ((Seq_append s (as Seq_empty  Seq<Int>)))
  :qid |$Seq[Int]_prog.seq_append_empty_right|)))
(assert (forall ((s1 Seq<Int>) (s2 Seq<Int>) (i Int)) (!
  (=>
    (and
      (not (= s1 (as Seq_empty  Seq<Int>)))
      (not (= s2 (as Seq_empty  Seq<Int>))))
    (ite
      (< i (Seq_length s1))
      (= (Seq_index (Seq_append s1 s2) i) (Seq_index s1 i))
      (= (Seq_index (Seq_append s1 s2) i) (Seq_index s2 (- i (Seq_length s1))))))
  :pattern ((Seq_index (Seq_append s1 s2) i))
  :pattern ((Seq_index s1 i) (Seq_append s1 s2))
  :qid |$Seq[Int]_prog.seq_index_over_append|)))
(assert (forall ((s Seq<Int>) (i Int) (e Int)) (!
  (=>
    (and (<= 0 i) (< i (Seq_length s)))
    (= (Seq_length (Seq_update s i e)) (Seq_length s)))
  :pattern ((Seq_length (Seq_update s i e)))
  :qid |$Seq[Int]_prog.seq_length_invariant_over_update|)))
(assert (forall ((s Seq<Int>) (i Int) (e Int) (j Int)) (!
  (ite
    (=> (and (<= 0 i) (< i (Seq_length s))) (= i j))
    (= (Seq_index (Seq_update s i e) j) e)
    (= (Seq_index (Seq_update s i e) j) (Seq_index s j)))
  :pattern ((Seq_index (Seq_update s i e) j))
  :qid |$Seq[Int]_prog.seq_index_over_update|)))
(assert (forall ((s Seq<Int>) (e Int)) (!
  (=
    (Seq_contains s e)
    (exists ((i Int)) (!
      (and (<= 0 i) (and (< i (Seq_length s)) (= (Seq_index s i) e)))
      :pattern ((Seq_index s i))
      )))
  :pattern ((Seq_contains s e))
  :qid |$Seq[Int]_prog.seq_element_contains_index_exists|)))
(assert (forall ((e Int)) (!
  (not (Seq_contains (as Seq_empty  Seq<Int>) e))
  :pattern ((Seq_contains (as Seq_empty  Seq<Int>) e))
  :qid |$Seq[Int]_prog.empty_seq_contains_nothing|)))
(assert (forall ((s1 Seq<Int>) (s2 Seq<Int>) (e Int)) (!
  (=
    (Seq_contains (Seq_append s1 s2) e)
    (or (Seq_contains s1 e) (Seq_contains s2 e)))
  :pattern ((Seq_contains (Seq_append s1 s2) e))
  :qid |$Seq[Int]_prog.seq_contains_over_append|)))
(assert (forall ((s Seq<Int>) (e1 Int) (e2 Int)) (!
  (= (Seq_contains (Seq_build s e1) e2) (or (= e1 e2) (Seq_contains s e2)))
  :pattern ((Seq_contains (Seq_build s e1) e2))
  :qid |$Seq[Int]_prog.seq_contains_over_build|)))
(assert (forall ((s Seq<Int>) (n Int)) (!
  (=> (<= n 0) (= (Seq_take s n) (as Seq_empty  Seq<Int>)))
  :pattern ((Seq_take s n))
  :qid |$Seq[Int]_prog.seq_take_negative_length|)))
(assert (forall ((s Seq<Int>) (n Int) (e Int)) (!
  (=
    (Seq_contains (Seq_take s n) e)
    (exists ((i Int)) (!
      (and
        (<= 0 i)
        (and (< i n) (and (< i (Seq_length s)) (= (Seq_index s i) e))))
      :pattern ((Seq_index s i))
      )))
  :pattern ((Seq_contains (Seq_take s n) e))
  :qid |$Seq[Int]_prog.seq_contains_over_take_index_exists|)))
(assert (forall ((s Seq<Int>) (n Int)) (!
  (=> (<= n 0) (= (Seq_drop s n) s))
  :pattern ((Seq_drop s n))
  :qid |$Seq[Int]_prog.seq_drop_negative_length|)))
(assert (forall ((s Seq<Int>) (n Int) (e Int)) (!
  (=
    (Seq_contains (Seq_drop s n) e)
    (exists ((i Int)) (!
      (and
        (<= 0 i)
        (and (<= n i) (and (< i (Seq_length s)) (= (Seq_index s i) e))))
      :pattern ((Seq_index s i))
      )))
  :pattern ((Seq_contains (Seq_drop s n) e))
  :qid |$Seq[Int]_prog.seq_contains_over_drop_index_exists|)))
(assert (forall ((s1 Seq<Int>) (s2 Seq<Int>)) (!
  (=
    (Seq_equal s1 s2)
    (and
      (= (Seq_length s1) (Seq_length s2))
      (forall ((i Int)) (!
        (=>
          (and (<= 0 i) (< i (Seq_length s1)))
          (= (Seq_index s1 i) (Seq_index s2 i)))
        :pattern ((Seq_index s1 i))
        :pattern ((Seq_index s2 i))
        ))))
  :pattern ((Seq_equal s1 s2))
  :qid |$Seq[Int]_prog.extensional_seq_equality|)))
(assert (forall ((s1 Seq<Int>) (s2 Seq<Int>)) (!
  (=> (Seq_equal s1 s2) (= s1 s2))
  :pattern ((Seq_equal s1 s2))
  :qid |$Seq[Int]_prog.seq_equality_identity|)))
(assert (forall ((s1 Seq<Int>) (s2 Seq<Int>) (n Int)) (!
  (=
    (Seq_sameuntil s1 s2 n)
    (forall ((i Int)) (!
      (=> (and (<= 0 i) (< i n)) (= (Seq_index s1 i) (Seq_index s2 i)))
      :pattern ((Seq_index s1 i))
      :pattern ((Seq_index s2 i))
      )))
  :pattern ((Seq_sameuntil s1 s2 n))
  :qid |$Seq[Int]_prog.extensional_seq_equality_prefix|)))
(assert (forall ((s Seq<Int>) (n Int)) (!
  (=>
    (<= 0 n)
    (ite
      (<= n (Seq_length s))
      (= (Seq_length (Seq_take s n)) n)
      (= (Seq_length (Seq_take s n)) (Seq_length s))))
  :pattern ((Seq_length (Seq_take s n)))
  :qid |$Seq[Int]_prog.seq_length_over_take|)))
(assert (forall ((s Seq<Int>) (n Int) (i Int)) (!
  (=>
    (and (<= 0 i) (and (< i n) (< i (Seq_length s))))
    (= (Seq_index (Seq_take s n) i) (Seq_index s i)))
  :pattern ((Seq_index (Seq_take s n) i))
  :pattern ((Seq_index s i) (Seq_take s n))
  :qid |$Seq[Int]_prog.seq_index_over_take|)))
(assert (forall ((s Seq<Int>) (n Int)) (!
  (=>
    (<= 0 n)
    (ite
      (<= n (Seq_length s))
      (= (Seq_length (Seq_drop s n)) (- (Seq_length s) n))
      (= (Seq_length (Seq_drop s n)) 0)))
  :pattern ((Seq_length (Seq_drop s n)))
  :qid |$Seq[Int]_prog.seq_length_over_drop|)))
(assert (forall ((s Seq<Int>) (n Int) (i Int)) (!
  (=>
    (and (<= 0 n) (and (<= 0 i) (< i (- (Seq_length s) n))))
    (= (Seq_index (Seq_drop s n) i) (Seq_index s (+ i n))))
  :pattern ((Seq_index (Seq_drop s n) i))
  :qid |$Seq[Int]_prog.seq_index_over_drop_1|)))
(assert (forall ((s Seq<Int>) (n Int) (i Int)) (!
  (=>
    (and (<= 0 n) (and (<= n i) (< i (Seq_length s))))
    (= (Seq_index (Seq_drop s n) (- i n)) (Seq_index s i)))
  :pattern ((Seq_index s i) (Seq_drop s n))
  :qid |$Seq[Int]_prog.seq_index_over_drop_2|)))
(assert (forall ((s Seq<Int>) (i Int) (e Int) (n Int)) (!
  (=>
    (and (<= 0 i) (and (< i n) (< n (Seq_length s))))
    (= (Seq_take (Seq_update s i e) n) (Seq_update (Seq_take s n) i e)))
  :pattern ((Seq_take (Seq_update s i e) n))
  :qid |$Seq[Int]_prog.seq_take_over_update_1|)))
(assert (forall ((s Seq<Int>) (i Int) (e Int) (n Int)) (!
  (=>
    (and (<= n i) (< i (Seq_length s)))
    (= (Seq_take (Seq_update s i e) n) (Seq_take s n)))
  :pattern ((Seq_take (Seq_update s i e) n))
  :qid |$Seq[Int]_prog.seq_take_over_update_2|)))
(assert (forall ((s Seq<Int>) (i Int) (e Int) (n Int)) (!
  (=>
    (and (<= 0 n) (and (<= n i) (< i (Seq_length s))))
    (= (Seq_drop (Seq_update s i e) n) (Seq_update (Seq_drop s n) (- i n) e)))
  :pattern ((Seq_drop (Seq_update s i e) n))
  :qid |$Seq[Int]_prog.seq_drop_over_update_1|)))
(assert (forall ((s Seq<Int>) (i Int) (e Int) (n Int)) (!
  (=>
    (and (<= 0 i) (and (< i n) (< n (Seq_length s))))
    (= (Seq_drop (Seq_update s i e) n) (Seq_drop s n)))
  :pattern ((Seq_drop (Seq_update s i e) n))
  :qid |$Seq[Int]_prog.seq_drop_over_update_2|)))
(assert (forall ((s Seq<Int>) (e Int) (n Int)) (!
  (=>
    (and (<= 0 n) (<= n (Seq_length s)))
    (= (Seq_drop (Seq_build s e) n) (Seq_build (Seq_drop s n) e)))
  :pattern ((Seq_drop (Seq_build s e) n))
  :qid |$Seq[Int]_prog.seq_drop_over_build|)))
(assert (forall ((min_ Int) (max Int)) (!
  (ite
    (< min_ max)
    (= (Seq_length (Seq_range min_ max)) (- max min_))
    (= (Seq_length (Seq_range min_ max)) 0))
  :pattern ((Seq_length (Seq_range min_ max)))
  :qid |$Seq[Int]_prog.ranged_seq_length|)))
(assert (forall ((min_ Int) (max Int) (i Int)) (!
  (=>
    (and (<= 0 i) (< i (- max min_)))
    (= (Seq_index (Seq_range min_ max) i) (+ min_ i)))
  :pattern ((Seq_index (Seq_range min_ max) i))
  :qid |$Seq[Int]_prog.ranged_seq_index|)))
(assert (forall ((min_ Int) (max Int) (e Int)) (!
  (= (Seq_contains (Seq_range min_ max) e) (and (<= min_ e) (< e max)))
  :pattern ((Seq_contains (Seq_range min_ max) e))
  :qid |$Seq[Int]_prog.ranged_seq_contains|)))
(assert (forall ((s Set<$Ref>)) (!
  (<= 0 (Set_card s))
  :pattern ((Set_card s))
  :qid |$Set[Ref]_prog.card_non_negative|)))
(assert (forall ((e $Ref)) (!
  (not (Set_in e (as Set_empty  Set<$Ref>)))
  :pattern ((Set_in e (as Set_empty  Set<$Ref>)))
  :qid |$Set[Ref]_prog.in_empty_set|)))
(assert (forall ((s Set<$Ref>)) (!
  (and
    (= (= (Set_card s) 0) (= s (as Set_empty  Set<$Ref>)))
    (=>
      (not (= (Set_card s) 0))
      (exists ((e $Ref)) (!
        (Set_in e s)
        :pattern ((Set_in e s))
        ))))
  :pattern ((Set_card s))
  :qid |$Set[Ref]_prog.empty_set_cardinality|)))
(assert (forall ((e $Ref)) (!
  (Set_in e (Set_singleton e))
  :pattern ((Set_singleton e))
  :qid |$Set[Ref]_prog.in_singleton_set|)))
(assert (forall ((e1 $Ref) (e2 $Ref)) (!
  (= (Set_in e1 (Set_singleton e2)) (= e1 e2))
  :pattern ((Set_in e1 (Set_singleton e2)))
  :qid |$Set[Ref]_prog.in_singleton_set_equality|)))
(assert (forall ((e $Ref)) (!
  (= (Set_card (Set_singleton e)) 1)
  :pattern ((Set_card (Set_singleton e)))
  :qid |$Set[Ref]_prog.singleton_set_cardinality|)))
(assert (forall ((s Set<$Ref>) (e $Ref)) (!
  (Set_in e (Set_unionone s e))
  :pattern ((Set_unionone s e))
  :qid |$Set[Ref]_prog.in_unionone_same|)))
(assert (forall ((s Set<$Ref>) (e1 $Ref) (e2 $Ref)) (!
  (= (Set_in e1 (Set_unionone s e2)) (or (= e1 e2) (Set_in e1 s)))
  :pattern ((Set_in e1 (Set_unionone s e2)))
  :qid |$Set[Ref]_prog.in_unionone_other|)))
(assert (forall ((s Set<$Ref>) (e1 $Ref) (e2 $Ref)) (!
  (=> (Set_in e1 s) (Set_in e1 (Set_unionone s e2)))
  :pattern ((Set_in e1 s) (Set_unionone s e2))
  :qid |$Set[Ref]_prog.invariance_in_unionone|)))
(assert (forall ((s Set<$Ref>) (e $Ref)) (!
  (=> (Set_in e s) (= (Set_card (Set_unionone s e)) (Set_card s)))
  :pattern ((Set_card (Set_unionone s e)))
  :qid |$Set[Ref]_prog.unionone_cardinality_invariant|)))
(assert (forall ((s Set<$Ref>) (e $Ref)) (!
  (=> (not (Set_in e s)) (= (Set_card (Set_unionone s e)) (+ (Set_card s) 1)))
  :pattern ((Set_card (Set_unionone s e)))
  :qid |$Set[Ref]_prog.unionone_cardinality_changed|)))
(assert (forall ((s1 Set<$Ref>) (s2 Set<$Ref>) (e $Ref)) (!
  (= (Set_in e (Set_union s1 s2)) (or (Set_in e s1) (Set_in e s2)))
  :pattern ((Set_in e (Set_union s1 s2)))
  :qid |$Set[Ref]_prog.in_union_in_one|)))
(assert (forall ((s1 Set<$Ref>) (s2 Set<$Ref>) (e $Ref)) (!
  (=> (Set_in e s1) (Set_in e (Set_union s1 s2)))
  :pattern ((Set_in e s1) (Set_union s1 s2))
  :qid |$Set[Ref]_prog.in_left_in_union|)))
(assert (forall ((s1 Set<$Ref>) (s2 Set<$Ref>) (e $Ref)) (!
  (=> (Set_in e s2) (Set_in e (Set_union s1 s2)))
  :pattern ((Set_in e s2) (Set_union s1 s2))
  :qid |$Set[Ref]_prog.in_right_in_union|)))
(assert (forall ((s1 Set<$Ref>) (s2 Set<$Ref>) (e $Ref)) (!
  (= (Set_in e (Set_intersection s1 s2)) (and (Set_in e s1) (Set_in e s2)))
  :pattern ((Set_in e (Set_intersection s1 s2)))
  :pattern ((Set_intersection s1 s2) (Set_in e s1))
  :pattern ((Set_intersection s1 s2) (Set_in e s2))
  :qid |$Set[Ref]_prog.in_intersection_in_both|)))
(assert (forall ((s1 Set<$Ref>) (s2 Set<$Ref>)) (!
  (= (Set_union s1 (Set_union s1 s2)) (Set_union s1 s2))
  :pattern ((Set_union s1 (Set_union s1 s2)))
  :qid |$Set[Ref]_prog.union_left_idempotency|)))
(assert (forall ((s1 Set<$Ref>) (s2 Set<$Ref>)) (!
  (= (Set_union (Set_union s1 s2) s2) (Set_union s1 s2))
  :pattern ((Set_union (Set_union s1 s2) s2))
  :qid |$Set[Ref]_prog.union_right_idempotency|)))
(assert (forall ((s1 Set<$Ref>) (s2 Set<$Ref>)) (!
  (= (Set_intersection s1 (Set_intersection s1 s2)) (Set_intersection s1 s2))
  :pattern ((Set_intersection s1 (Set_intersection s1 s2)))
  :qid |$Set[Ref]_prog.intersection_left_idempotency|)))
(assert (forall ((s1 Set<$Ref>) (s2 Set<$Ref>)) (!
  (= (Set_intersection (Set_intersection s1 s2) s2) (Set_intersection s1 s2))
  :pattern ((Set_intersection (Set_intersection s1 s2) s2))
  :qid |$Set[Ref]_prog.intersection_right_idempotency|)))
(assert (forall ((s1 Set<$Ref>) (s2 Set<$Ref>)) (!
  (=
    (+ (Set_card (Set_union s1 s2)) (Set_card (Set_intersection s1 s2)))
    (+ (Set_card s1) (Set_card s2)))
  :pattern ((Set_card (Set_union s1 s2)))
  :pattern ((Set_card (Set_intersection s1 s2)))
  :qid |$Set[Ref]_prog.cardinality_sums|)))
(assert (forall ((s1 Set<$Ref>) (s2 Set<$Ref>) (e $Ref)) (!
  (= (Set_in e (Set_difference s1 s2)) (and (Set_in e s1) (not (Set_in e s2))))
  :pattern ((Set_in e (Set_difference s1 s2)))
  :qid |$Set[Ref]_prog.in_difference|)))
(assert (forall ((s1 Set<$Ref>) (s2 Set<$Ref>) (e $Ref)) (!
  (=> (Set_in e s2) (not (Set_in e (Set_difference s1 s2))))
  :pattern ((Set_difference s1 s2) (Set_in e s2))
  :qid |$Set[Ref]_prog.not_in_difference|)))
(assert (forall ((s1 Set<$Ref>) (s2 Set<$Ref>)) (!
  (=
    (Set_subset s1 s2)
    (forall ((e $Ref)) (!
      (=> (Set_in e s1) (Set_in e s2))
      :pattern ((Set_in e s1))
      :pattern ((Set_in e s2))
      )))
  :pattern ((Set_subset s1 s2))
  :qid |$Set[Ref]_prog.subset_definition|)))
(assert (forall ((s1 Set<$Ref>) (s2 Set<$Ref>)) (!
  (=
    (Set_equal s1 s2)
    (forall ((e $Ref)) (!
      (= (Set_in e s1) (Set_in e s2))
      :pattern ((Set_in e s1))
      :pattern ((Set_in e s2))
      )))
  :pattern ((Set_equal s1 s2))
  :qid |$Set[Ref]_prog.equality_definition|)))
(assert (forall ((s1 Set<$Ref>) (s2 Set<$Ref>)) (!
  (=> (Set_equal s1 s2) (= s1 s2))
  :pattern ((Set_equal s1 s2))
  :qid |$Set[Ref]_prog.native_equality|)))
(assert (forall ((s1 Set<$Ref>) (s2 Set<$Ref>)) (!
  (=
    (Set_disjoint s1 s2)
    (forall ((e $Ref)) (!
      (or (not (Set_in e s1)) (not (Set_in e s2)))
      :pattern ((Set_in e s1))
      :pattern ((Set_in e s2))
      )))
  :pattern ((Set_disjoint s1 s2))
  :qid |$Set[Ref]_prog.disjointness_definition|)))
(assert (forall ((s1 Set<$Ref>) (s2 Set<$Ref>)) (!
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
  :qid |$Set[Ref]_prog.cardinality_difference|)))
(assert (forall ((s Set<Bool>)) (!
  (<= 0 (Set_card s))
  :pattern ((Set_card s))
  :qid |$Set[Bool]_prog.card_non_negative|)))
(assert (forall ((e Bool)) (!
  (not (Set_in e (as Set_empty  Set<Bool>)))
  :pattern ((Set_in e (as Set_empty  Set<Bool>)))
  :qid |$Set[Bool]_prog.in_empty_set|)))
(assert (forall ((s Set<Bool>)) (!
  (and
    (= (= (Set_card s) 0) (= s (as Set_empty  Set<Bool>)))
    (=>
      (not (= (Set_card s) 0))
      (exists ((e Bool)) (!
        (Set_in e s)
        :pattern ((Set_in e s))
        ))))
  :pattern ((Set_card s))
  :qid |$Set[Bool]_prog.empty_set_cardinality|)))
(assert (forall ((e Bool)) (!
  (Set_in e (Set_singleton e))
  :pattern ((Set_singleton e))
  :qid |$Set[Bool]_prog.in_singleton_set|)))
(assert (forall ((e1 Bool) (e2 Bool)) (!
  (= (Set_in e1 (Set_singleton e2)) (= e1 e2))
  :pattern ((Set_in e1 (Set_singleton e2)))
  :qid |$Set[Bool]_prog.in_singleton_set_equality|)))
(assert (forall ((e Bool)) (!
  (= (Set_card (Set_singleton e)) 1)
  :pattern ((Set_card (Set_singleton e)))
  :qid |$Set[Bool]_prog.singleton_set_cardinality|)))
(assert (forall ((s Set<Bool>) (e Bool)) (!
  (Set_in e (Set_unionone s e))
  :pattern ((Set_unionone s e))
  :qid |$Set[Bool]_prog.in_unionone_same|)))
(assert (forall ((s Set<Bool>) (e1 Bool) (e2 Bool)) (!
  (= (Set_in e1 (Set_unionone s e2)) (or (= e1 e2) (Set_in e1 s)))
  :pattern ((Set_in e1 (Set_unionone s e2)))
  :qid |$Set[Bool]_prog.in_unionone_other|)))
(assert (forall ((s Set<Bool>) (e1 Bool) (e2 Bool)) (!
  (=> (Set_in e1 s) (Set_in e1 (Set_unionone s e2)))
  :pattern ((Set_in e1 s) (Set_unionone s e2))
  :qid |$Set[Bool]_prog.invariance_in_unionone|)))
(assert (forall ((s Set<Bool>) (e Bool)) (!
  (=> (Set_in e s) (= (Set_card (Set_unionone s e)) (Set_card s)))
  :pattern ((Set_card (Set_unionone s e)))
  :qid |$Set[Bool]_prog.unionone_cardinality_invariant|)))
(assert (forall ((s Set<Bool>) (e Bool)) (!
  (=> (not (Set_in e s)) (= (Set_card (Set_unionone s e)) (+ (Set_card s) 1)))
  :pattern ((Set_card (Set_unionone s e)))
  :qid |$Set[Bool]_prog.unionone_cardinality_changed|)))
(assert (forall ((s1 Set<Bool>) (s2 Set<Bool>) (e Bool)) (!
  (= (Set_in e (Set_union s1 s2)) (or (Set_in e s1) (Set_in e s2)))
  :pattern ((Set_in e (Set_union s1 s2)))
  :qid |$Set[Bool]_prog.in_union_in_one|)))
(assert (forall ((s1 Set<Bool>) (s2 Set<Bool>) (e Bool)) (!
  (=> (Set_in e s1) (Set_in e (Set_union s1 s2)))
  :pattern ((Set_in e s1) (Set_union s1 s2))
  :qid |$Set[Bool]_prog.in_left_in_union|)))
(assert (forall ((s1 Set<Bool>) (s2 Set<Bool>) (e Bool)) (!
  (=> (Set_in e s2) (Set_in e (Set_union s1 s2)))
  :pattern ((Set_in e s2) (Set_union s1 s2))
  :qid |$Set[Bool]_prog.in_right_in_union|)))
(assert (forall ((s1 Set<Bool>) (s2 Set<Bool>) (e Bool)) (!
  (= (Set_in e (Set_intersection s1 s2)) (and (Set_in e s1) (Set_in e s2)))
  :pattern ((Set_in e (Set_intersection s1 s2)))
  :pattern ((Set_intersection s1 s2) (Set_in e s1))
  :pattern ((Set_intersection s1 s2) (Set_in e s2))
  :qid |$Set[Bool]_prog.in_intersection_in_both|)))
(assert (forall ((s1 Set<Bool>) (s2 Set<Bool>)) (!
  (= (Set_union s1 (Set_union s1 s2)) (Set_union s1 s2))
  :pattern ((Set_union s1 (Set_union s1 s2)))
  :qid |$Set[Bool]_prog.union_left_idempotency|)))
(assert (forall ((s1 Set<Bool>) (s2 Set<Bool>)) (!
  (= (Set_union (Set_union s1 s2) s2) (Set_union s1 s2))
  :pattern ((Set_union (Set_union s1 s2) s2))
  :qid |$Set[Bool]_prog.union_right_idempotency|)))
(assert (forall ((s1 Set<Bool>) (s2 Set<Bool>)) (!
  (= (Set_intersection s1 (Set_intersection s1 s2)) (Set_intersection s1 s2))
  :pattern ((Set_intersection s1 (Set_intersection s1 s2)))
  :qid |$Set[Bool]_prog.intersection_left_idempotency|)))
(assert (forall ((s1 Set<Bool>) (s2 Set<Bool>)) (!
  (= (Set_intersection (Set_intersection s1 s2) s2) (Set_intersection s1 s2))
  :pattern ((Set_intersection (Set_intersection s1 s2) s2))
  :qid |$Set[Bool]_prog.intersection_right_idempotency|)))
(assert (forall ((s1 Set<Bool>) (s2 Set<Bool>)) (!
  (=
    (+ (Set_card (Set_union s1 s2)) (Set_card (Set_intersection s1 s2)))
    (+ (Set_card s1) (Set_card s2)))
  :pattern ((Set_card (Set_union s1 s2)))
  :pattern ((Set_card (Set_intersection s1 s2)))
  :qid |$Set[Bool]_prog.cardinality_sums|)))
(assert (forall ((s1 Set<Bool>) (s2 Set<Bool>) (e Bool)) (!
  (= (Set_in e (Set_difference s1 s2)) (and (Set_in e s1) (not (Set_in e s2))))
  :pattern ((Set_in e (Set_difference s1 s2)))
  :qid |$Set[Bool]_prog.in_difference|)))
(assert (forall ((s1 Set<Bool>) (s2 Set<Bool>) (e Bool)) (!
  (=> (Set_in e s2) (not (Set_in e (Set_difference s1 s2))))
  :pattern ((Set_difference s1 s2) (Set_in e s2))
  :qid |$Set[Bool]_prog.not_in_difference|)))
(assert (forall ((s1 Set<Bool>) (s2 Set<Bool>)) (!
  (=
    (Set_subset s1 s2)
    (forall ((e Bool)) (!
      (=> (Set_in e s1) (Set_in e s2))
      :pattern ((Set_in e s1))
      :pattern ((Set_in e s2))
      )))
  :pattern ((Set_subset s1 s2))
  :qid |$Set[Bool]_prog.subset_definition|)))
(assert (forall ((s1 Set<Bool>) (s2 Set<Bool>)) (!
  (=
    (Set_equal s1 s2)
    (forall ((e Bool)) (!
      (= (Set_in e s1) (Set_in e s2))
      :pattern ((Set_in e s1))
      :pattern ((Set_in e s2))
      )))
  :pattern ((Set_equal s1 s2))
  :qid |$Set[Bool]_prog.equality_definition|)))
(assert (forall ((s1 Set<Bool>) (s2 Set<Bool>)) (!
  (=> (Set_equal s1 s2) (= s1 s2))
  :pattern ((Set_equal s1 s2))
  :qid |$Set[Bool]_prog.native_equality|)))
(assert (forall ((s1 Set<Bool>) (s2 Set<Bool>)) (!
  (=
    (Set_disjoint s1 s2)
    (forall ((e Bool)) (!
      (or (not (Set_in e s1)) (not (Set_in e s2)))
      :pattern ((Set_in e s1))
      :pattern ((Set_in e s2))
      )))
  :pattern ((Set_disjoint s1 s2))
  :qid |$Set[Bool]_prog.disjointness_definition|)))
(assert (forall ((s1 Set<Bool>) (s2 Set<Bool>)) (!
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
  :qid |$Set[Bool]_prog.cardinality_difference|)))
(assert (forall ((s Set<Int>)) (!
  (<= 0 (Set_card s))
  :pattern ((Set_card s))
  :qid |$Set[Int]_prog.card_non_negative|)))
(assert (forall ((e Int)) (!
  (not (Set_in e (as Set_empty  Set<Int>)))
  :pattern ((Set_in e (as Set_empty  Set<Int>)))
  :qid |$Set[Int]_prog.in_empty_set|)))
(assert (forall ((s Set<Int>)) (!
  (and
    (= (= (Set_card s) 0) (= s (as Set_empty  Set<Int>)))
    (=>
      (not (= (Set_card s) 0))
      (exists ((e Int)) (!
        (Set_in e s)
        :pattern ((Set_in e s))
        ))))
  :pattern ((Set_card s))
  :qid |$Set[Int]_prog.empty_set_cardinality|)))
(assert (forall ((e Int)) (!
  (Set_in e (Set_singleton e))
  :pattern ((Set_singleton e))
  :qid |$Set[Int]_prog.in_singleton_set|)))
(assert (forall ((e1 Int) (e2 Int)) (!
  (= (Set_in e1 (Set_singleton e2)) (= e1 e2))
  :pattern ((Set_in e1 (Set_singleton e2)))
  :qid |$Set[Int]_prog.in_singleton_set_equality|)))
(assert (forall ((e Int)) (!
  (= (Set_card (Set_singleton e)) 1)
  :pattern ((Set_card (Set_singleton e)))
  :qid |$Set[Int]_prog.singleton_set_cardinality|)))
(assert (forall ((s Set<Int>) (e Int)) (!
  (Set_in e (Set_unionone s e))
  :pattern ((Set_unionone s e))
  :qid |$Set[Int]_prog.in_unionone_same|)))
(assert (forall ((s Set<Int>) (e1 Int) (e2 Int)) (!
  (= (Set_in e1 (Set_unionone s e2)) (or (= e1 e2) (Set_in e1 s)))
  :pattern ((Set_in e1 (Set_unionone s e2)))
  :qid |$Set[Int]_prog.in_unionone_other|)))
(assert (forall ((s Set<Int>) (e1 Int) (e2 Int)) (!
  (=> (Set_in e1 s) (Set_in e1 (Set_unionone s e2)))
  :pattern ((Set_in e1 s) (Set_unionone s e2))
  :qid |$Set[Int]_prog.invariance_in_unionone|)))
(assert (forall ((s Set<Int>) (e Int)) (!
  (=> (Set_in e s) (= (Set_card (Set_unionone s e)) (Set_card s)))
  :pattern ((Set_card (Set_unionone s e)))
  :qid |$Set[Int]_prog.unionone_cardinality_invariant|)))
(assert (forall ((s Set<Int>) (e Int)) (!
  (=> (not (Set_in e s)) (= (Set_card (Set_unionone s e)) (+ (Set_card s) 1)))
  :pattern ((Set_card (Set_unionone s e)))
  :qid |$Set[Int]_prog.unionone_cardinality_changed|)))
(assert (forall ((s1 Set<Int>) (s2 Set<Int>) (e Int)) (!
  (= (Set_in e (Set_union s1 s2)) (or (Set_in e s1) (Set_in e s2)))
  :pattern ((Set_in e (Set_union s1 s2)))
  :qid |$Set[Int]_prog.in_union_in_one|)))
(assert (forall ((s1 Set<Int>) (s2 Set<Int>) (e Int)) (!
  (=> (Set_in e s1) (Set_in e (Set_union s1 s2)))
  :pattern ((Set_in e s1) (Set_union s1 s2))
  :qid |$Set[Int]_prog.in_left_in_union|)))
(assert (forall ((s1 Set<Int>) (s2 Set<Int>) (e Int)) (!
  (=> (Set_in e s2) (Set_in e (Set_union s1 s2)))
  :pattern ((Set_in e s2) (Set_union s1 s2))
  :qid |$Set[Int]_prog.in_right_in_union|)))
(assert (forall ((s1 Set<Int>) (s2 Set<Int>) (e Int)) (!
  (= (Set_in e (Set_intersection s1 s2)) (and (Set_in e s1) (Set_in e s2)))
  :pattern ((Set_in e (Set_intersection s1 s2)))
  :pattern ((Set_intersection s1 s2) (Set_in e s1))
  :pattern ((Set_intersection s1 s2) (Set_in e s2))
  :qid |$Set[Int]_prog.in_intersection_in_both|)))
(assert (forall ((s1 Set<Int>) (s2 Set<Int>)) (!
  (= (Set_union s1 (Set_union s1 s2)) (Set_union s1 s2))
  :pattern ((Set_union s1 (Set_union s1 s2)))
  :qid |$Set[Int]_prog.union_left_idempotency|)))
(assert (forall ((s1 Set<Int>) (s2 Set<Int>)) (!
  (= (Set_union (Set_union s1 s2) s2) (Set_union s1 s2))
  :pattern ((Set_union (Set_union s1 s2) s2))
  :qid |$Set[Int]_prog.union_right_idempotency|)))
(assert (forall ((s1 Set<Int>) (s2 Set<Int>)) (!
  (= (Set_intersection s1 (Set_intersection s1 s2)) (Set_intersection s1 s2))
  :pattern ((Set_intersection s1 (Set_intersection s1 s2)))
  :qid |$Set[Int]_prog.intersection_left_idempotency|)))
(assert (forall ((s1 Set<Int>) (s2 Set<Int>)) (!
  (= (Set_intersection (Set_intersection s1 s2) s2) (Set_intersection s1 s2))
  :pattern ((Set_intersection (Set_intersection s1 s2) s2))
  :qid |$Set[Int]_prog.intersection_right_idempotency|)))
(assert (forall ((s1 Set<Int>) (s2 Set<Int>)) (!
  (=
    (+ (Set_card (Set_union s1 s2)) (Set_card (Set_intersection s1 s2)))
    (+ (Set_card s1) (Set_card s2)))
  :pattern ((Set_card (Set_union s1 s2)))
  :pattern ((Set_card (Set_intersection s1 s2)))
  :qid |$Set[Int]_prog.cardinality_sums|)))
(assert (forall ((s1 Set<Int>) (s2 Set<Int>) (e Int)) (!
  (= (Set_in e (Set_difference s1 s2)) (and (Set_in e s1) (not (Set_in e s2))))
  :pattern ((Set_in e (Set_difference s1 s2)))
  :qid |$Set[Int]_prog.in_difference|)))
(assert (forall ((s1 Set<Int>) (s2 Set<Int>) (e Int)) (!
  (=> (Set_in e s2) (not (Set_in e (Set_difference s1 s2))))
  :pattern ((Set_difference s1 s2) (Set_in e s2))
  :qid |$Set[Int]_prog.not_in_difference|)))
(assert (forall ((s1 Set<Int>) (s2 Set<Int>)) (!
  (=
    (Set_subset s1 s2)
    (forall ((e Int)) (!
      (=> (Set_in e s1) (Set_in e s2))
      :pattern ((Set_in e s1))
      :pattern ((Set_in e s2))
      )))
  :pattern ((Set_subset s1 s2))
  :qid |$Set[Int]_prog.subset_definition|)))
(assert (forall ((s1 Set<Int>) (s2 Set<Int>)) (!
  (=
    (Set_equal s1 s2)
    (forall ((e Int)) (!
      (= (Set_in e s1) (Set_in e s2))
      :pattern ((Set_in e s1))
      :pattern ((Set_in e s2))
      )))
  :pattern ((Set_equal s1 s2))
  :qid |$Set[Int]_prog.equality_definition|)))
(assert (forall ((s1 Set<Int>) (s2 Set<Int>)) (!
  (=> (Set_equal s1 s2) (= s1 s2))
  :pattern ((Set_equal s1 s2))
  :qid |$Set[Int]_prog.native_equality|)))
(assert (forall ((s1 Set<Int>) (s2 Set<Int>)) (!
  (=
    (Set_disjoint s1 s2)
    (forall ((e Int)) (!
      (or (not (Set_in e s1)) (not (Set_in e s2)))
      :pattern ((Set_in e s1))
      :pattern ((Set_in e s2))
      )))
  :pattern ((Set_disjoint s1 s2))
  :qid |$Set[Int]_prog.disjointness_definition|)))
(assert (forall ((s1 Set<Int>) (s2 Set<Int>)) (!
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
  :qid |$Set[Int]_prog.cardinality_difference|)))
(assert (forall ((s Set<$Snap>)) (!
  (<= 0 (Set_card s))
  :pattern ((Set_card s))
  :qid |$Set[Snap]_prog.card_non_negative|)))
(assert (forall ((e $Snap)) (!
  (not (Set_in e (as Set_empty  Set<$Snap>)))
  :pattern ((Set_in e (as Set_empty  Set<$Snap>)))
  :qid |$Set[Snap]_prog.in_empty_set|)))
(assert (forall ((s Set<$Snap>)) (!
  (and
    (= (= (Set_card s) 0) (= s (as Set_empty  Set<$Snap>)))
    (=>
      (not (= (Set_card s) 0))
      (exists ((e $Snap)) (!
        (Set_in e s)
        :pattern ((Set_in e s))
        ))))
  :pattern ((Set_card s))
  :qid |$Set[Snap]_prog.empty_set_cardinality|)))
(assert (forall ((e $Snap)) (!
  (Set_in e (Set_singleton e))
  :pattern ((Set_singleton e))
  :qid |$Set[Snap]_prog.in_singleton_set|)))
(assert (forall ((e1 $Snap) (e2 $Snap)) (!
  (= (Set_in e1 (Set_singleton e2)) (= e1 e2))
  :pattern ((Set_in e1 (Set_singleton e2)))
  :qid |$Set[Snap]_prog.in_singleton_set_equality|)))
(assert (forall ((e $Snap)) (!
  (= (Set_card (Set_singleton e)) 1)
  :pattern ((Set_card (Set_singleton e)))
  :qid |$Set[Snap]_prog.singleton_set_cardinality|)))
(assert (forall ((s Set<$Snap>) (e $Snap)) (!
  (Set_in e (Set_unionone s e))
  :pattern ((Set_unionone s e))
  :qid |$Set[Snap]_prog.in_unionone_same|)))
(assert (forall ((s Set<$Snap>) (e1 $Snap) (e2 $Snap)) (!
  (= (Set_in e1 (Set_unionone s e2)) (or (= e1 e2) (Set_in e1 s)))
  :pattern ((Set_in e1 (Set_unionone s e2)))
  :qid |$Set[Snap]_prog.in_unionone_other|)))
(assert (forall ((s Set<$Snap>) (e1 $Snap) (e2 $Snap)) (!
  (=> (Set_in e1 s) (Set_in e1 (Set_unionone s e2)))
  :pattern ((Set_in e1 s) (Set_unionone s e2))
  :qid |$Set[Snap]_prog.invariance_in_unionone|)))
(assert (forall ((s Set<$Snap>) (e $Snap)) (!
  (=> (Set_in e s) (= (Set_card (Set_unionone s e)) (Set_card s)))
  :pattern ((Set_card (Set_unionone s e)))
  :qid |$Set[Snap]_prog.unionone_cardinality_invariant|)))
(assert (forall ((s Set<$Snap>) (e $Snap)) (!
  (=> (not (Set_in e s)) (= (Set_card (Set_unionone s e)) (+ (Set_card s) 1)))
  :pattern ((Set_card (Set_unionone s e)))
  :qid |$Set[Snap]_prog.unionone_cardinality_changed|)))
(assert (forall ((s1 Set<$Snap>) (s2 Set<$Snap>) (e $Snap)) (!
  (= (Set_in e (Set_union s1 s2)) (or (Set_in e s1) (Set_in e s2)))
  :pattern ((Set_in e (Set_union s1 s2)))
  :qid |$Set[Snap]_prog.in_union_in_one|)))
(assert (forall ((s1 Set<$Snap>) (s2 Set<$Snap>) (e $Snap)) (!
  (=> (Set_in e s1) (Set_in e (Set_union s1 s2)))
  :pattern ((Set_in e s1) (Set_union s1 s2))
  :qid |$Set[Snap]_prog.in_left_in_union|)))
(assert (forall ((s1 Set<$Snap>) (s2 Set<$Snap>) (e $Snap)) (!
  (=> (Set_in e s2) (Set_in e (Set_union s1 s2)))
  :pattern ((Set_in e s2) (Set_union s1 s2))
  :qid |$Set[Snap]_prog.in_right_in_union|)))
(assert (forall ((s1 Set<$Snap>) (s2 Set<$Snap>) (e $Snap)) (!
  (= (Set_in e (Set_intersection s1 s2)) (and (Set_in e s1) (Set_in e s2)))
  :pattern ((Set_in e (Set_intersection s1 s2)))
  :pattern ((Set_intersection s1 s2) (Set_in e s1))
  :pattern ((Set_intersection s1 s2) (Set_in e s2))
  :qid |$Set[Snap]_prog.in_intersection_in_both|)))
(assert (forall ((s1 Set<$Snap>) (s2 Set<$Snap>)) (!
  (= (Set_union s1 (Set_union s1 s2)) (Set_union s1 s2))
  :pattern ((Set_union s1 (Set_union s1 s2)))
  :qid |$Set[Snap]_prog.union_left_idempotency|)))
(assert (forall ((s1 Set<$Snap>) (s2 Set<$Snap>)) (!
  (= (Set_union (Set_union s1 s2) s2) (Set_union s1 s2))
  :pattern ((Set_union (Set_union s1 s2) s2))
  :qid |$Set[Snap]_prog.union_right_idempotency|)))
(assert (forall ((s1 Set<$Snap>) (s2 Set<$Snap>)) (!
  (= (Set_intersection s1 (Set_intersection s1 s2)) (Set_intersection s1 s2))
  :pattern ((Set_intersection s1 (Set_intersection s1 s2)))
  :qid |$Set[Snap]_prog.intersection_left_idempotency|)))
(assert (forall ((s1 Set<$Snap>) (s2 Set<$Snap>)) (!
  (= (Set_intersection (Set_intersection s1 s2) s2) (Set_intersection s1 s2))
  :pattern ((Set_intersection (Set_intersection s1 s2) s2))
  :qid |$Set[Snap]_prog.intersection_right_idempotency|)))
(assert (forall ((s1 Set<$Snap>) (s2 Set<$Snap>)) (!
  (=
    (+ (Set_card (Set_union s1 s2)) (Set_card (Set_intersection s1 s2)))
    (+ (Set_card s1) (Set_card s2)))
  :pattern ((Set_card (Set_union s1 s2)))
  :pattern ((Set_card (Set_intersection s1 s2)))
  :qid |$Set[Snap]_prog.cardinality_sums|)))
(assert (forall ((s1 Set<$Snap>) (s2 Set<$Snap>) (e $Snap)) (!
  (= (Set_in e (Set_difference s1 s2)) (and (Set_in e s1) (not (Set_in e s2))))
  :pattern ((Set_in e (Set_difference s1 s2)))
  :qid |$Set[Snap]_prog.in_difference|)))
(assert (forall ((s1 Set<$Snap>) (s2 Set<$Snap>) (e $Snap)) (!
  (=> (Set_in e s2) (not (Set_in e (Set_difference s1 s2))))
  :pattern ((Set_difference s1 s2) (Set_in e s2))
  :qid |$Set[Snap]_prog.not_in_difference|)))
(assert (forall ((s1 Set<$Snap>) (s2 Set<$Snap>)) (!
  (=
    (Set_subset s1 s2)
    (forall ((e $Snap)) (!
      (=> (Set_in e s1) (Set_in e s2))
      :pattern ((Set_in e s1))
      :pattern ((Set_in e s2))
      )))
  :pattern ((Set_subset s1 s2))
  :qid |$Set[Snap]_prog.subset_definition|)))
(assert (forall ((s1 Set<$Snap>) (s2 Set<$Snap>)) (!
  (=
    (Set_equal s1 s2)
    (forall ((e $Snap)) (!
      (= (Set_in e s1) (Set_in e s2))
      :pattern ((Set_in e s1))
      :pattern ((Set_in e s2))
      )))
  :pattern ((Set_equal s1 s2))
  :qid |$Set[Snap]_prog.equality_definition|)))
(assert (forall ((s1 Set<$Snap>) (s2 Set<$Snap>)) (!
  (=> (Set_equal s1 s2) (= s1 s2))
  :pattern ((Set_equal s1 s2))
  :qid |$Set[Snap]_prog.native_equality|)))
(assert (forall ((s1 Set<$Snap>) (s2 Set<$Snap>)) (!
  (=
    (Set_disjoint s1 s2)
    (forall ((e $Snap)) (!
      (or (not (Set_in e s1)) (not (Set_in e s2)))
      :pattern ((Set_in e s1))
      :pattern ((Set_in e s2))
      )))
  :pattern ((Set_disjoint s1 s2))
  :qid |$Set[Snap]_prog.disjointness_definition|)))
(assert (forall ((s1 Set<$Snap>) (s2 Set<$Snap>)) (!
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
  :qid |$Set[Snap]_prog.cardinality_difference|)))
(assert (forall ((data Seq<Int>)) (!
  (Seq_equal
    (uncons$Snap$Slice$i32$__$TY$__Snap$Slice$i32$Seq$$int$<Seq<Int>> (cons$Snap$Slice$i32$__$TY$__Seq$$int$$Snap$Slice$i32<Snap$Slice$i32> data))
    data)
  :pattern ((cons$Snap$Slice$i32$__$TY$__Seq$$int$$Snap$Slice$i32<Snap$Slice$i32> data))
  :qid |prog.Snap$Slice$i32$injectivity|)))
(assert (forall ((data Snap$Slice$i32)) (!
  (=
    (cons$Snap$Slice$i32$__$TY$__Seq$$int$$Snap$Slice$i32<Snap$Slice$i32> (uncons$Snap$Slice$i32$__$TY$__Snap$Slice$i32$Seq$$int$<Seq<Int>> data))
    data)
  :pattern ((uncons$Snap$Slice$i32$__$TY$__Snap$Slice$i32$Seq$$int$<Seq<Int>> data))
  :qid |prog.Snap$Slice$i32$surjectivity|)))
(assert (forall ((_l_data Seq<Int>) (_r_data Seq<Int>)) (!
  (=>
    (Seq_equal _l_data _r_data)
    (=
      (cons$Snap$Slice$i32$__$TY$__Seq$$int$$Snap$Slice$i32<Snap$Slice$i32> _l_data)
      (cons$Snap$Slice$i32$__$TY$__Seq$$int$$Snap$Slice$i32<Snap$Slice$i32> _r_data)))
  :pattern ((cons$Snap$Slice$i32$__$TY$__Seq$$int$$Snap$Slice$i32<Snap$Slice$i32> _l_data) (cons$Snap$Slice$i32$__$TY$__Seq$$int$$Snap$Slice$i32<Snap$Slice$i32> _r_data))
  :qid |prog.Snap$Slice$i32$extensionality|)))
(assert (forall ((data Seq<Int>) (idx Int)) (!
  (=
    (read$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$$$int$<Int> (cons$Snap$Slice$i32$__$TY$__Seq$$int$$Snap$Slice$i32<Snap$Slice$i32> data) idx)
    (Seq_index data idx))
  :pattern ((read$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$$$int$<Int> (cons$Snap$Slice$i32$__$TY$__Seq$$int$$Snap$Slice$i32<Snap$Slice$i32> data) idx))
  :pattern ((Seq_index data idx))
  :qid |prog.Slice$i32$read_indices|)))
(assert (forall ((data Seq<Int>)) (!
  (=
    (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (cons$Snap$Slice$i32$__$TY$__Seq$$int$$Snap$Slice$i32<Snap$Slice$i32> data))
    (Seq_length data))
  :pattern ((len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (cons$Snap$Slice$i32$__$TY$__Seq$$int$$Snap$Slice$i32<Snap$Slice$i32> data)))
  :pattern ((Seq_length data))
  :qid |prog.Slice$i32$len_of_seq|)))
(assert (forall ((slice Snap$Slice$i32)) (!
  (>= (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> slice) 0)
  :pattern ((len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> slice))
  :qid |prog.Slice$i32$len_positive|)))
(assert (forall ((slice Snap$Slice$i32)) (!
  (<=
    (* (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> slice) 4)
    9223372036854775807)
  :pattern ((len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> slice))
  :qid |prog.Slice$i32$len_upper_bound|)))
(assert (forall ((self Snap$Slice$i32) (idx Int)) (!
  (and
    (<=
      (- 0 2147483648)
      (read$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$$$int$<Int> self idx))
    (<=
      (read$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$$$int$<Int> self idx)
      2147483647))
  :pattern ((read$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$$$int$<Int> self idx))
  :qid |prog.Snap$Slice$i32$valid|)))
; /field_value_functions_axioms.smt2 [val_ref: Ref]
(assert (forall ((vs $FVF<val_ref>) (ws $FVF<val_ref>)) (!
    (=>
      (and
        (Set_equal ($FVF.domain_val_ref vs) ($FVF.domain_val_ref ws))
        (forall ((x $Ref)) (!
          (=>
            (Set_in x ($FVF.domain_val_ref vs))
            (= ($FVF.lookup_val_ref vs x) ($FVF.lookup_val_ref ws x)))
          :pattern (($FVF.lookup_val_ref vs x) ($FVF.lookup_val_ref ws x))
          :qid |qp.$FVF<val_ref>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$FVF<val_ref>To$Snap vs)
              ($SortWrappers.$FVF<val_ref>To$Snap ws)
              )
    :qid |qp.$FVF<val_ref>-eq-outer|
    )))
(assert (forall ((r $Ref) (pm $FPM)) (!
    ($Perm.isValidVar ($FVF.perm_val_ref pm r))
    :pattern (($FVF.perm_val_ref pm r)))))
(assert (forall ((r $Ref) (f $Ref)) (!
    (= ($FVF.loc_val_ref f r) true)
    :pattern (($FVF.loc_val_ref f r)))))
; /field_value_functions_axioms.smt2 [tuple_0: Ref]
(assert (forall ((vs $FVF<tuple_0>) (ws $FVF<tuple_0>)) (!
    (=>
      (and
        (Set_equal ($FVF.domain_tuple_0 vs) ($FVF.domain_tuple_0 ws))
        (forall ((x $Ref)) (!
          (=>
            (Set_in x ($FVF.domain_tuple_0 vs))
            (= ($FVF.lookup_tuple_0 vs x) ($FVF.lookup_tuple_0 ws x)))
          :pattern (($FVF.lookup_tuple_0 vs x) ($FVF.lookup_tuple_0 ws x))
          :qid |qp.$FVF<tuple_0>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$FVF<tuple_0>To$Snap vs)
              ($SortWrappers.$FVF<tuple_0>To$Snap ws)
              )
    :qid |qp.$FVF<tuple_0>-eq-outer|
    )))
(assert (forall ((r $Ref) (pm $FPM)) (!
    ($Perm.isValidVar ($FVF.perm_tuple_0 pm r))
    :pattern (($FVF.perm_tuple_0 pm r)))))
(assert (forall ((r $Ref) (f $Ref)) (!
    (= ($FVF.loc_tuple_0 f r) true)
    :pattern (($FVF.loc_tuple_0 f r)))))
; /field_value_functions_axioms.smt2 [tuple_1: Ref]
(assert (forall ((vs $FVF<tuple_1>) (ws $FVF<tuple_1>)) (!
    (=>
      (and
        (Set_equal ($FVF.domain_tuple_1 vs) ($FVF.domain_tuple_1 ws))
        (forall ((x $Ref)) (!
          (=>
            (Set_in x ($FVF.domain_tuple_1 vs))
            (= ($FVF.lookup_tuple_1 vs x) ($FVF.lookup_tuple_1 ws x)))
          :pattern (($FVF.lookup_tuple_1 vs x) ($FVF.lookup_tuple_1 ws x))
          :qid |qp.$FVF<tuple_1>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$FVF<tuple_1>To$Snap vs)
              ($SortWrappers.$FVF<tuple_1>To$Snap ws)
              )
    :qid |qp.$FVF<tuple_1>-eq-outer|
    )))
(assert (forall ((r $Ref) (pm $FPM)) (!
    ($Perm.isValidVar ($FVF.perm_tuple_1 pm r))
    :pattern (($FVF.perm_tuple_1 pm r)))))
(assert (forall ((r $Ref) (f $Ref)) (!
    (= ($FVF.loc_tuple_1 f r) true)
    :pattern (($FVF.loc_tuple_1 f r)))))
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ------------------------------------------------------------
; Begin function- and predicate-related preamble
; Declaring symbols related to program functions (from verification)
(assert (forall ((s@$ $Snap)) (!
  (= (read$%limited s@$) (read$ s@$))
  :pattern ((read$ s@$))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap)) (!
  (as read$%stateless  Bool)
  :pattern ((read$%limited s@$))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap)) (!
  (let ((result@0@00 (read$%limited s@$))) (=>
    (read$%precondition s@$)
    (and (< $Perm.No result@0@00) (< result@0@00 $Perm.Write))))
  :pattern ((read$%limited s@$))
  :qid |quant-u-12|)))
(assert (forall ((s@$ $Snap)) (!
  (let ((result@0@00 (read$%limited s@$))) true)
  :pattern ((read$%limited s@$))
  :qid |quant-u-13|)))
(assert (forall ((s@$ $Snap)) (!
  (let ((result@0@00 (read$%limited s@$))) true)
  :pattern ((read$%limited s@$))
  :qid |quant-u-14|)))
(assert (forall ((s@$ $Snap) (self@1@00 $Ref)) (!
  (=
    (Slice$len__$TY$__i32$Slice$i32$$int$%limited s@$ self@1@00)
    (Slice$len__$TY$__i32$Slice$i32$$int$ s@$ self@1@00))
  :pattern ((Slice$len__$TY$__i32$Slice$i32$$int$ s@$ self@1@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (self@1@00 $Ref)) (!
  (Slice$len__$TY$__i32$Slice$i32$$int$%stateless self@1@00)
  :pattern ((Slice$len__$TY$__i32$Slice$i32$$int$%limited s@$ self@1@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (self@1@00 $Ref)) (!
  (let ((result@2@00 (Slice$len__$TY$__i32$Slice$i32$$int$%limited s@$ self@1@00))) (=>
    (Slice$len__$TY$__i32$Slice$i32$$int$%precondition s@$ self@1@00)
    (and (>= result@2@00 0) (<= result@2@00 18446744073709551615))))
  :pattern ((Slice$len__$TY$__i32$Slice$i32$$int$%limited s@$ self@1@00))
  :qid |quant-u-15|)))
(assert (forall ((s@$ $Snap) (self@1@00 $Ref)) (!
  (let ((result@2@00 (Slice$len__$TY$__i32$Slice$i32$$int$%limited s@$ self@1@00))) true)
  :pattern ((Slice$len__$TY$__i32$Slice$i32$$int$%limited s@$ self@1@00))
  :qid |quant-u-16|)))
(assert (forall ((s@$ $Snap) (self@1@00 $Ref)) (!
  (let ((result@2@00 (Slice$len__$TY$__i32$Slice$i32$$int$%limited s@$ self@1@00))) true)
  :pattern ((Slice$len__$TY$__i32$Slice$i32$$int$%limited s@$ self@1@00))
  :qid |quant-u-17|)))
(assert (forall ((s@$ $Snap) (self@3@00 $Ref) (idx@4@00 Int)) (!
  (=
    (lookup_pure__$TY$__Slice$i32$i32$Slice$i32$$int$$$int$%limited s@$ self@3@00 idx@4@00)
    (lookup_pure__$TY$__Slice$i32$i32$Slice$i32$$int$$$int$ s@$ self@3@00 idx@4@00))
  :pattern ((lookup_pure__$TY$__Slice$i32$i32$Slice$i32$$int$$$int$ s@$ self@3@00 idx@4@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (self@3@00 $Ref) (idx@4@00 Int)) (!
  (lookup_pure__$TY$__Slice$i32$i32$Slice$i32$$int$$$int$%stateless self@3@00 idx@4@00)
  :pattern ((lookup_pure__$TY$__Slice$i32$i32$Slice$i32$$int$$$int$%limited s@$ self@3@00 idx@4@00))
  :qid |quant-u-5|)))
(assert (forall ((s@$ $Snap) (self@6@00 $Ref) (start@7@00 Int)) (!
  (Seq_equal
    (seq_collect$Slice$i32$__$TY$__Slice$i32$$int$$Seq$$int$%limited s@$ self@6@00 start@7@00)
    (seq_collect$Slice$i32$__$TY$__Slice$i32$$int$$Seq$$int$ s@$ self@6@00 start@7@00))
  :pattern ((seq_collect$Slice$i32$__$TY$__Slice$i32$$int$$Seq$$int$ s@$ self@6@00 start@7@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (self@6@00 $Ref) (start@7@00 Int)) (!
  (seq_collect$Slice$i32$__$TY$__Slice$i32$$int$$Seq$$int$%stateless self@6@00 start@7@00)
  :pattern ((seq_collect$Slice$i32$__$TY$__Slice$i32$$int$$Seq$$int$%limited s@$ self@6@00 start@7@00))
  :qid |quant-u-7|)))
(assert (forall ((s@$ $Snap) (self@6@00 $Ref) (start@7@00 Int)) (!
  (let ((result@8@00 (seq_collect$Slice$i32$__$TY$__Slice$i32$$int$$Seq$$int$%limited s@$ self@6@00 start@7@00))) (=>
    (seq_collect$Slice$i32$__$TY$__Slice$i32$$int$$Seq$$int$%precondition s@$ self@6@00 start@7@00)
    (and
      (=>
        (>=
          start@7@00
          (Slice$len__$TY$__i32$Slice$i32$$int$ ($Snap.first s@$) self@6@00))
        (Seq_equal result@8@00 (as Seq_empty  Seq<Int>)))
      (=>
        (<
          start@7@00
          (Slice$len__$TY$__i32$Slice$i32$$int$ ($Snap.first s@$) self@6@00))
        (=
          (Seq_length result@8@00)
          (-
            (Slice$len__$TY$__i32$Slice$i32$$int$ ($Snap.first s@$) self@6@00)
            start@7@00)))
      (=>
        (<
          start@7@00
          (Slice$len__$TY$__i32$Slice$i32$$int$ ($Snap.first s@$) self@6@00))
        (=
          (Seq_index result@8@00 0)
          (lookup_pure__$TY$__Slice$i32$i32$Slice$i32$$int$$$int$ ($Snap.combine
            ($Snap.first s@$)
            ($Snap.combine $Snap.unit $Snap.unit)) self@6@00 start@7@00)))
      (=>
        (<
          start@7@00
          (Slice$len__$TY$__i32$Slice$i32$$int$ ($Snap.first s@$) self@6@00))
        (forall ((i Int) (j Int)) (!
          (=>
            (and
              (<= start@7@00 i)
              (and
                (<
                  i
                  (Slice$len__$TY$__i32$Slice$i32$$int$ ($Snap.first s@$) self@6@00))
                (and
                  (<= 0 j)
                  (and
                    (<
                      j
                      (-
                        (Slice$len__$TY$__i32$Slice$i32$$int$ ($Snap.first s@$) self@6@00)
                        start@7@00))
                    (= i (+ j start@7@00))))))
            (=
              (lookup_pure__$TY$__Slice$i32$i32$Slice$i32$$int$$$int$ ($Snap.combine
                ($Snap.first s@$)
                ($Snap.combine $Snap.unit $Snap.unit)) self@6@00 i)
              (Seq_index result@8@00 j)))
          :pattern ((lookup_pure__$TY$__Slice$i32$i32$Slice$i32$$int$$$int$%limited ($Snap.combine
            ($Snap.first s@$)
            ($Snap.combine $Snap.unit $Snap.unit)) self@6@00 i) (Seq_index
            result@8@00
            j))
          ))))))
  :pattern ((seq_collect$Slice$i32$__$TY$__Slice$i32$$int$$Seq$$int$%limited s@$ self@6@00 start@7@00))
  :qid |quant-u-18|)))
(assert (forall ((s@$ $Snap) (self@6@00 $Ref) (start@7@00 Int)) (!
  (let ((result@8@00 (seq_collect$Slice$i32$__$TY$__Slice$i32$$int$$Seq$$int$%limited s@$ self@6@00 start@7@00))) (=>
    (seq_collect$Slice$i32$__$TY$__Slice$i32$$int$$Seq$$int$%precondition s@$ self@6@00 start@7@00)
    (Slice$len__$TY$__i32$Slice$i32$$int$%precondition ($Snap.first s@$) self@6@00)))
  :pattern ((seq_collect$Slice$i32$__$TY$__Slice$i32$$int$$Seq$$int$%limited s@$ self@6@00 start@7@00))
  :qid |quant-u-19|)))
(assert (forall ((s@$ $Snap) (self@6@00 $Ref) (start@7@00 Int)) (!
  (let ((result@8@00 (seq_collect$Slice$i32$__$TY$__Slice$i32$$int$$Seq$$int$%limited s@$ self@6@00 start@7@00))) (=>
    (seq_collect$Slice$i32$__$TY$__Slice$i32$$int$$Seq$$int$%precondition s@$ self@6@00 start@7@00)
    (and
      (Slice$len__$TY$__i32$Slice$i32$$int$%precondition ($Snap.first s@$) self@6@00)
      (=>
        (<
          start@7@00
          (Slice$len__$TY$__i32$Slice$i32$$int$ ($Snap.first s@$) self@6@00))
        (Slice$len__$TY$__i32$Slice$i32$$int$%precondition ($Snap.first s@$) self@6@00)))))
  :pattern ((seq_collect$Slice$i32$__$TY$__Slice$i32$$int$$Seq$$int$%limited s@$ self@6@00 start@7@00))
  :qid |quant-u-20|)))
(assert (forall ((s@$ $Snap) (self@6@00 $Ref) (start@7@00 Int)) (!
  (let ((result@8@00 (seq_collect$Slice$i32$__$TY$__Slice$i32$$int$$Seq$$int$%limited s@$ self@6@00 start@7@00))) (=>
    (seq_collect$Slice$i32$__$TY$__Slice$i32$$int$$Seq$$int$%precondition s@$ self@6@00 start@7@00)
    (and
      (Slice$len__$TY$__i32$Slice$i32$$int$%precondition ($Snap.first s@$) self@6@00)
      (=>
        (<
          start@7@00
          (Slice$len__$TY$__i32$Slice$i32$$int$ ($Snap.first s@$) self@6@00))
        (lookup_pure__$TY$__Slice$i32$i32$Slice$i32$$int$$$int$%precondition ($Snap.combine
          ($Snap.first s@$)
          ($Snap.combine $Snap.unit $Snap.unit)) self@6@00 start@7@00)))))
  :pattern ((seq_collect$Slice$i32$__$TY$__Slice$i32$$int$$Seq$$int$%limited s@$ self@6@00 start@7@00))
  :qid |quant-u-21|)))
(assert (forall ((s@$ $Snap) (self@6@00 $Ref) (start@7@00 Int)) (!
  (let ((result@8@00 (seq_collect$Slice$i32$__$TY$__Slice$i32$$int$$Seq$$int$%limited s@$ self@6@00 start@7@00))) (=>
    (seq_collect$Slice$i32$__$TY$__Slice$i32$$int$$Seq$$int$%precondition s@$ self@6@00 start@7@00)
    (and
      (Slice$len__$TY$__i32$Slice$i32$$int$%precondition ($Snap.first s@$) self@6@00)
      (=>
        (<
          start@7@00
          (Slice$len__$TY$__i32$Slice$i32$$int$ ($Snap.first s@$) self@6@00))
        (forall ((i Int) (j Int)) (!
          (and
            (=>
              (<= start@7@00 i)
              (and
                (Slice$len__$TY$__i32$Slice$i32$$int$%precondition ($Snap.first s@$) self@6@00)
                (=>
                  (and
                    (<
                      i
                      (Slice$len__$TY$__i32$Slice$i32$$int$ ($Snap.first s@$) self@6@00))
                    (<= 0 j))
                  (Slice$len__$TY$__i32$Slice$i32$$int$%precondition ($Snap.first s@$) self@6@00))))
            (=>
              (and
                (<= start@7@00 i)
                (and
                  (<
                    i
                    (Slice$len__$TY$__i32$Slice$i32$$int$ ($Snap.first s@$) self@6@00))
                  (and
                    (<= 0 j)
                    (and
                      (<
                        j
                        (-
                          (Slice$len__$TY$__i32$Slice$i32$$int$ ($Snap.first s@$) self@6@00)
                          start@7@00))
                      (= i (+ j start@7@00))))))
              (lookup_pure__$TY$__Slice$i32$i32$Slice$i32$$int$$$int$%precondition ($Snap.combine
                ($Snap.first s@$)
                ($Snap.combine $Snap.unit $Snap.unit)) self@6@00 i)))
          :pattern ((lookup_pure__$TY$__Slice$i32$i32$Slice$i32$$int$$$int$%limited ($Snap.combine
            ($Snap.first s@$)
            ($Snap.combine $Snap.unit $Snap.unit)) self@6@00 i) (Seq_index
            result@8@00
            j))
          ))))))
  :pattern ((seq_collect$Slice$i32$__$TY$__Slice$i32$$int$$Seq$$int$%limited s@$ self@6@00 start@7@00))
  :qid |quant-u-22|)))
(assert (forall ((s@$ $Snap) (self@6@00 $Ref) (start@7@00 Int)) (!
  (=>
    (seq_collect$Slice$i32$__$TY$__Slice$i32$$int$$Seq$$int$%precondition s@$ self@6@00 start@7@00)
    (Seq_equal
      (seq_collect$Slice$i32$__$TY$__Slice$i32$$int$$Seq$$int$ s@$ self@6@00 start@7@00)
      (ite
        (>=
          start@7@00
          (Slice$len__$TY$__i32$Slice$i32$$int$ ($Snap.first s@$) self@6@00))
        (as Seq_empty  Seq<Int>)
        (Seq_append
          (Seq_singleton (lookup_pure__$TY$__Slice$i32$i32$Slice$i32$$int$$$int$ ($Snap.combine
            ($Snap.first s@$)
            ($Snap.combine $Snap.unit $Snap.unit)) self@6@00 start@7@00))
          (seq_collect$Slice$i32$__$TY$__Slice$i32$$int$$Seq$$int$%limited ($Snap.combine
            ($Snap.first s@$)
            $Snap.unit) self@6@00 (+ start@7@00 1))))))
  :pattern ((seq_collect$Slice$i32$__$TY$__Slice$i32$$int$$Seq$$int$ s@$ self@6@00 start@7@00))
  :qid |quant-u-23|)))
(assert (forall ((s@$ $Snap) (self@6@00 $Ref) (start@7@00 Int)) (!
  (=>
    (seq_collect$Slice$i32$__$TY$__Slice$i32$$int$$Seq$$int$%precondition s@$ self@6@00 start@7@00)
    (and
      (Slice$len__$TY$__i32$Slice$i32$$int$%precondition ($Snap.first s@$) self@6@00)
      (ite
        (>=
          start@7@00
          (Slice$len__$TY$__i32$Slice$i32$$int$ ($Snap.first s@$) self@6@00))
        true
        (and
          (lookup_pure__$TY$__Slice$i32$i32$Slice$i32$$int$$$int$%precondition ($Snap.combine
            ($Snap.first s@$)
            ($Snap.combine $Snap.unit $Snap.unit)) self@6@00 start@7@00)
          (seq_collect$Slice$i32$__$TY$__Slice$i32$$int$$Seq$$int$%precondition ($Snap.combine
            ($Snap.first s@$)
            $Snap.unit) self@6@00 (+ start@7@00 1))))))
  :pattern ((seq_collect$Slice$i32$__$TY$__Slice$i32$$int$$Seq$$int$ s@$ self@6@00 start@7@00))
  :qid |quant-u-24|)))
(assert (forall ((s@$ $Snap) (self@9@00 $Ref) (idx@10@00 Int)) (!
  (=
    (lookup_pure__$TY$__Array$13$i32$i32$Array$13$i32$$int$$$int$%limited s@$ self@9@00 idx@10@00)
    (lookup_pure__$TY$__Array$13$i32$i32$Array$13$i32$$int$$$int$ s@$ self@9@00 idx@10@00))
  :pattern ((lookup_pure__$TY$__Array$13$i32$i32$Array$13$i32$$int$$$int$ s@$ self@9@00 idx@10@00))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap) (self@9@00 $Ref) (idx@10@00 Int)) (!
  (lookup_pure__$TY$__Array$13$i32$i32$Array$13$i32$$int$$$int$%stateless self@9@00 idx@10@00)
  :pattern ((lookup_pure__$TY$__Array$13$i32$i32$Array$13$i32$$int$$$int$%limited s@$ self@9@00 idx@10@00))
  :qid |quant-u-9|)))
(assert (forall ((s@$ $Snap) (self@12@00 $Ref)) (!
  (=
    (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32%limited s@$ self@12@00)
    (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 s@$ self@12@00))
  :pattern ((snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 s@$ self@12@00))
  :qid |quant-u-10|)))
(assert (forall ((s@$ $Snap) (self@12@00 $Ref)) (!
  (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32%stateless self@12@00)
  :pattern ((snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32%limited s@$ self@12@00))
  :qid |quant-u-11|)))
(assert (forall ((s@$ $Snap) (self@12@00 $Ref)) (!
  (let ((result@13@00 (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32%limited s@$ self@12@00))) (=>
    (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32%precondition s@$ self@12@00)
    (and
      (forall ((i Int)) (!
        (=>
          (and
            (<= 0 i)
            (< i (Slice$len__$TY$__i32$Slice$i32$$int$ s@$ self@12@00)))
          (=
            (read$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$$$int$<Int> result@13@00 i)
            (lookup_pure__$TY$__Slice$i32$i32$Slice$i32$$int$$$int$ ($Snap.combine
              s@$
              ($Snap.combine $Snap.unit $Snap.unit)) self@12@00 i)))
        :pattern ((read$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$$$int$<Int> result@13@00 i))
        :pattern ((lookup_pure__$TY$__Slice$i32$i32$Slice$i32$$int$$$int$%limited ($Snap.combine
          s@$
          ($Snap.combine $Snap.unit $Snap.unit)) self@12@00 i))
        ))
      (=
        (Slice$len__$TY$__i32$Slice$i32$$int$ s@$ self@12@00)
        (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> result@13@00)))))
  :pattern ((snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32%limited s@$ self@12@00))
  :qid |quant-u-25|)))
(assert (forall ((s@$ $Snap) (self@12@00 $Ref)) (!
  (let ((result@13@00 (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32%limited s@$ self@12@00))) (=>
    (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32%precondition s@$ self@12@00)
    (forall ((i Int)) (!
      (and
        (=>
          (<= 0 i)
          (Slice$len__$TY$__i32$Slice$i32$$int$%precondition s@$ self@12@00))
        (=>
          (and
            (<= 0 i)
            (< i (Slice$len__$TY$__i32$Slice$i32$$int$ s@$ self@12@00)))
          (lookup_pure__$TY$__Slice$i32$i32$Slice$i32$$int$$$int$%precondition ($Snap.combine
            s@$
            ($Snap.combine $Snap.unit $Snap.unit)) self@12@00 i)))
      :pattern ((read$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$$$int$<Int> result@13@00 i))
      :pattern ((lookup_pure__$TY$__Slice$i32$i32$Slice$i32$$int$$$int$%limited ($Snap.combine
        s@$
        ($Snap.combine $Snap.unit $Snap.unit)) self@12@00 i))
      ))))
  :pattern ((snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32%limited s@$ self@12@00))
  :qid |quant-u-26|)))
(assert (forall ((s@$ $Snap) (self@12@00 $Ref)) (!
  (let ((result@13@00 (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32%limited s@$ self@12@00))) (=>
    (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32%precondition s@$ self@12@00)
    (Slice$len__$TY$__i32$Slice$i32$$int$%precondition s@$ self@12@00)))
  :pattern ((snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32%limited s@$ self@12@00))
  :qid |quant-u-27|)))
(assert (forall ((s@$ $Snap) (self@12@00 $Ref)) (!
  (=>
    (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32%precondition s@$ self@12@00)
    (=
      (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 s@$ self@12@00)
      (cons$Snap$Slice$i32$__$TY$__Seq$$int$$Snap$Slice$i32<Snap$Slice$i32> (seq_collect$Slice$i32$__$TY$__Slice$i32$$int$$Seq$$int$ ($Snap.combine
        s@$
        $Snap.unit) self@12@00 0))))
  :pattern ((snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 s@$ self@12@00))
  :qid |quant-u-28|)))
(assert (forall ((s@$ $Snap) (self@12@00 $Ref)) (!
  (=>
    (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32%precondition s@$ self@12@00)
    (seq_collect$Slice$i32$__$TY$__Slice$i32$$int$$Seq$$int$%precondition ($Snap.combine
      s@$
      $Snap.unit) self@12@00 0))
  :pattern ((snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 s@$ self@12@00))
  :qid |quant-u-29|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- m_main ----------
(declare-const _0@0@01 $Ref)
(declare-const _0@1@01 $Ref)
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
; var __t0: Bool
(declare-const __t0@2@01 Bool)
; [exec]
; var __t1: Bool
(declare-const __t1@3@01 Bool)
; [exec]
; var __t2: Bool
(declare-const __t2@4@01 Bool)
; [exec]
; var __t3: Bool
(declare-const __t3@5@01 Bool)
; [exec]
; var __t4: Bool
(declare-const __t4@6@01 Bool)
; [exec]
; var __t5: Bool
(declare-const __t5@7@01 Bool)
; [exec]
; var __t6: Bool
(declare-const __t6@8@01 Bool)
; [exec]
; var __t7: Bool
(declare-const __t7@9@01 Bool)
; [exec]
; var __t8: Bool
(declare-const __t8@10@01 Bool)
; [exec]
; var __t9: Bool
(declare-const __t9@11@01 Bool)
; [exec]
; var __t10: Bool
(declare-const __t10@12@01 Bool)
; [exec]
; var __t11: Bool
(declare-const __t11@13@01 Bool)
; [exec]
; var __t12: Bool
(declare-const __t12@14@01 Bool)
; [exec]
; var __t13: Bool
(declare-const __t13@15@01 Bool)
; [exec]
; var __t14: Bool
(declare-const __t14@16@01 Bool)
; [exec]
; var __t15: Bool
(declare-const __t15@17@01 Bool)
; [exec]
; var __t16: Bool
(declare-const __t16@18@01 Bool)
; [exec]
; var __t17: Bool
(declare-const __t17@19@01 Bool)
; [exec]
; var __t18: Bool
(declare-const __t18@20@01 Bool)
; [exec]
; var __t19: Bool
(declare-const __t19@21@01 Bool)
; [exec]
; var __t20: Bool
(declare-const __t20@22@01 Bool)
; [exec]
; var __t21: Bool
(declare-const __t21@23@01 Bool)
; [exec]
; var __t22: Bool
(declare-const __t22@24@01 Bool)
; [exec]
; var __t23: Bool
(declare-const __t23@25@01 Bool)
; [exec]
; var __t24: Bool
(declare-const __t24@26@01 Bool)
; [exec]
; var __t25: Ref
(declare-const __t25@27@01 $Ref)
; [exec]
; var __t26: Bool
(declare-const __t26@28@01 Bool)
; [exec]
; var __t27: Ref
(declare-const __t27@29@01 $Ref)
; [exec]
; var __t28: Bool
(declare-const __t28@30@01 Bool)
; [exec]
; var __t29: Bool
(declare-const __t29@31@01 Bool)
; [exec]
; var __t30: Ref
(declare-const __t30@32@01 $Ref)
; [exec]
; var __t31: Bool
(declare-const __t31@33@01 Bool)
; [exec]
; var __t32: Ref
(declare-const __t32@34@01 $Ref)
; [exec]
; var __t33: Bool
(declare-const __t33@35@01 Bool)
; [exec]
; var __t34: Bool
(declare-const __t34@36@01 Bool)
; [exec]
; var __t35: Ref
(declare-const __t35@37@01 $Ref)
; [exec]
; var __t36: Bool
(declare-const __t36@38@01 Bool)
; [exec]
; var __t37: Bool
(declare-const __t37@39@01 Bool)
; [exec]
; var __t38: Ref
(declare-const __t38@40@01 $Ref)
; [exec]
; var __t39: Bool
(declare-const __t39@41@01 Bool)
; [exec]
; var _1: Ref
(declare-const _1@42@01 $Ref)
; [exec]
; var _2: Ref
(declare-const _2@43@01 $Ref)
; [exec]
; var _3: Ref
(declare-const _3@44@01 $Ref)
; [exec]
; var _4: Ref
(declare-const _4@45@01 $Ref)
; [exec]
; var _5: Ref
(declare-const _5@46@01 $Ref)
; [exec]
; var _6: Ref
(declare-const _6@47@01 $Ref)
; [exec]
; var _7: Ref
(declare-const _7@48@01 $Ref)
; [exec]
; var _9: Ref
(declare-const _9@49@01 $Ref)
; [exec]
; var _10: Ref
(declare-const _10@50@01 $Ref)
; [exec]
; var _11: Int
(declare-const _11@51@01 Int)
; [exec]
; var _12: Ref
(declare-const _12@52@01 $Ref)
; [exec]
; var _15: Ref
(declare-const _15@53@01 $Ref)
; [exec]
; var _16: Ref
(declare-const _16@54@01 $Ref)
; [exec]
; var _17: Int
(declare-const _17@55@01 Int)
; [exec]
; var _18: Ref
(declare-const _18@56@01 $Ref)
; [exec]
; var _21: Ref
(declare-const _21@57@01 $Ref)
; [exec]
; var _22: Ref
(declare-const _22@58@01 $Ref)
; [exec]
; var _23: Int
(declare-const _23@59@01 Int)
; [exec]
; var _24: Int
(declare-const _24@60@01 Int)
; [exec]
; var _25: Int
(declare-const _25@61@01 Int)
; [exec]
; var _26: Ref
(declare-const _26@62@01 $Ref)
; [exec]
; var _27: Int
(declare-const _27@63@01 Int)
; [exec]
; var _28: Int
(declare-const _28@64@01 Int)
; [exec]
; var _29: Int
(declare-const _29@65@01 Int)
; [exec]
; var _30: Ref
(declare-const _30@66@01 $Ref)
; [exec]
; var _33: Ref
(declare-const _33@67@01 $Ref)
; [exec]
; var _34: Ref
(declare-const _34@68@01 $Ref)
; [exec]
; var _35: Int
(declare-const _35@69@01 Int)
; [exec]
; var _36: Int
(declare-const _36@70@01 Int)
; [exec]
; var _37: Int
(declare-const _37@71@01 Int)
; [exec]
; var _38: Ref
(declare-const _38@72@01 $Ref)
; [exec]
; var _39: Int
(declare-const _39@73@01 Int)
; [exec]
; var _40: Int
(declare-const _40@74@01 Int)
; [exec]
; var _41: Int
(declare-const _41@75@01 Int)
; [exec]
; var _42: Ref
(declare-const _42@76@01 $Ref)
; [exec]
; var _45: Ref
(declare-const _45@77@01 $Ref)
; [exec]
; var _46: Ref
(declare-const _46@78@01 $Ref)
; [exec]
; var _47: Int
(declare-const _47@79@01 Int)
; [exec]
; var _48: Int
(declare-const _48@80@01 Int)
; [exec]
; var _49: Int
(declare-const _49@81@01 Int)
; [exec]
; var _50: Ref
(declare-const _50@82@01 $Ref)
; [exec]
; var _53: Ref
(declare-const _53@83@01 $Ref)
; [exec]
; var _54: Ref
(declare-const _54@84@01 $Ref)
; [exec]
; var _55: Int
(declare-const _55@85@01 Int)
; [exec]
; var _56: Int
(declare-const _56@86@01 Int)
; [exec]
; var _57: Int
(declare-const _57@87@01 Int)
; [exec]
; var _58: Ref
(declare-const _58@88@01 $Ref)
; [exec]
; var _t60: Int
(declare-const _t60@89@01 Int)
; [exec]
; label start
; [exec]
; __t0 := false
; [exec]
; __t1 := false
; [exec]
; __t2 := false
; [exec]
; __t3 := false
; [exec]
; __t4 := false
; [exec]
; __t5 := false
; [exec]
; __t6 := false
; [exec]
; __t7 := false
; [exec]
; __t8 := false
; [exec]
; __t9 := false
; [exec]
; __t10 := false
; [exec]
; __t11 := false
; [exec]
; __t12 := false
; [exec]
; __t13 := false
; [exec]
; __t14 := false
; [exec]
; __t15 := false
; [exec]
; __t16 := false
; [exec]
; __t17 := false
; [exec]
; __t18 := false
; [exec]
; __t19 := false
; [exec]
; __t20 := false
; [exec]
; __t21 := false
; [exec]
; label pre
; [exec]
; __t0 := true
; [exec]
; _1 := builtin$havoc_ref()
(declare-const ret@90@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(Array$13$i32(_1), write)
(declare-const $t@91@01 $Snap)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall i: Int ::
;     { lookup_pure__$TY$__Array$13$i32$i32$Array$13$i32$$int$$$int$(_1, i) }
;     0 <= i && i < 13 ==>
;     lookup_pure__$TY$__Array$13$i32$i32$Array$13$i32$$int$$$int$(_1, i) ==
;     0)
(declare-const $t@92@01 $Snap)
(assert (= $t@92@01 $Snap.unit))
; [eval] (forall i: Int :: { lookup_pure__$TY$__Array$13$i32$i32$Array$13$i32$$int$$$int$(_1, i) } 0 <= i && i < 13 ==> lookup_pure__$TY$__Array$13$i32$i32$Array$13$i32$$int$$$int$(_1, i) == 0)
(declare-const i@93@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= i && i < 13 ==> lookup_pure__$TY$__Array$13$i32$i32$Array$13$i32$$int$$$int$(_1, i) == 0
; [eval] 0 <= i && i < 13
; [eval] 0 <= i
(push) ; 4
; [then-branch: 0 | 0 <= i@93@01 | live]
; [else-branch: 0 | !(0 <= i@93@01) | live]
(push) ; 5
; [then-branch: 0 | 0 <= i@93@01]
(assert (<= 0 i@93@01))
; [eval] i < 13
(pop) ; 5
(push) ; 5
; [else-branch: 0 | !(0 <= i@93@01)]
(assert (not (<= 0 i@93@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (<= 0 i@93@01)) (<= 0 i@93@01)))
(push) ; 4
; [then-branch: 1 | i@93@01 < 13 && 0 <= i@93@01 | live]
; [else-branch: 1 | !(i@93@01 < 13 && 0 <= i@93@01) | live]
(push) ; 5
; [then-branch: 1 | i@93@01 < 13 && 0 <= i@93@01]
(assert (and (< i@93@01 13) (<= 0 i@93@01)))
; [eval] lookup_pure__$TY$__Array$13$i32$i32$Array$13$i32$$int$$$int$(_1, i) == 0
; [eval] lookup_pure__$TY$__Array$13$i32$i32$Array$13$i32$$int$$$int$(_1, i)
(push) ; 6
; [eval] read$()
(push) ; 7
(assert (read$%precondition $Snap.unit))
(pop) ; 7
; Joined path conditions
(assert (read$%precondition $Snap.unit))
(push) ; 7
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(push) ; 7
(set-option :timeout 10)
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (<= $Perm.No (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))))
(set-option :timeout 0)
(push) ; 7
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [eval] 0 <= idx
; [eval] idx < 13
(assert (lookup_pure__$TY$__Array$13$i32$i32$Array$13$i32$$int$$$int$%precondition ($Snap.combine
  $t@91@01
  ($Snap.combine $Snap.unit $Snap.unit)) ret@90@01 i@93@01))
(pop) ; 6
; Joined path conditions
(assert (and
  (read$%precondition $Snap.unit)
  (<= $Perm.No (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))))
  (lookup_pure__$TY$__Array$13$i32$i32$Array$13$i32$$int$$$int$%precondition ($Snap.combine
    $t@91@01
    ($Snap.combine $Snap.unit $Snap.unit)) ret@90@01 i@93@01)))
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 1 | !(i@93@01 < 13 && 0 <= i@93@01)]
(assert (not (and (< i@93@01 13) (<= 0 i@93@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and (< i@93@01 13) (<= 0 i@93@01))
  (and
    (< i@93@01 13)
    (<= 0 i@93@01)
    (read$%precondition $Snap.unit)
    (<= $Perm.No (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))))
    (lookup_pure__$TY$__Array$13$i32$i32$Array$13$i32$$int$$$int$%precondition ($Snap.combine
      $t@91@01
      ($Snap.combine $Snap.unit $Snap.unit)) ret@90@01 i@93@01))))
; Joined path conditions
(assert (or
  (not (and (< i@93@01 13) (<= 0 i@93@01)))
  (and (< i@93@01 13) (<= 0 i@93@01))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@93@01 Int)) (!
  (and
    (or (not (<= 0 i@93@01)) (<= 0 i@93@01))
    (=>
      (and (< i@93@01 13) (<= 0 i@93@01))
      (and
        (< i@93@01 13)
        (<= 0 i@93@01)
        (read$%precondition $Snap.unit)
        (<= $Perm.No (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))))
        (lookup_pure__$TY$__Array$13$i32$i32$Array$13$i32$$int$$$int$%precondition ($Snap.combine
          $t@91@01
          ($Snap.combine $Snap.unit $Snap.unit)) ret@90@01 i@93@01)))
    (or
      (not (and (< i@93@01 13) (<= 0 i@93@01)))
      (and (< i@93@01 13) (<= 0 i@93@01))))
  :pattern ((lookup_pure__$TY$__Array$13$i32$i32$Array$13$i32$$int$$$int$%limited ($Snap.combine
    $t@91@01
    ($Snap.combine $Snap.unit $Snap.unit)) ret@90@01 i@93@01))
  :qid |prog.l540-aux|)))
(assert (forall ((i@93@01 Int)) (!
  (=>
    (and (< i@93@01 13) (<= 0 i@93@01))
    (=
      (lookup_pure__$TY$__Array$13$i32$i32$Array$13$i32$$int$$$int$ ($Snap.combine
        $t@91@01
        ($Snap.combine $Snap.unit $Snap.unit)) ret@90@01 i@93@01)
      0))
  :pattern ((lookup_pure__$TY$__Array$13$i32$i32$Array$13$i32$$int$$$int$%limited ($Snap.combine
    $t@91@01
    ($Snap.combine $Snap.unit $Snap.unit)) ret@90@01 i@93@01))
  :qid |prog.l540|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _7 := builtin$havoc_ref()
(declare-const ret@94@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_7.val_ref, write)
(declare-const $t@95@01 $Ref)
(assert (not (= ret@94@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _7.val_ref := _1
; [exec]
; exhale acc(Array$13$i32(_1), write - read$())
; [eval] write - read$()
; [eval] read$()
(set-option :timeout 0)
(push) ; 3
(assert (read$%precondition $Snap.unit))
(pop) ; 3
; Joined path conditions
(assert (read$%precondition $Snap.unit))
(push) ; 3
(assert (not (or
  (= (- $Perm.Write (read$ $Snap.unit)) $Perm.No)
  (< $Perm.No (- $Perm.Write (read$ $Snap.unit))))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (<=
  $Perm.No
  (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))))
(set-option :timeout 0)
(push) ; 3
(assert (not (or
  (=
    (-
      (- $Perm.Write (read$ $Snap.unit))
      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    $Perm.No)
  (<
    (-
      (- $Perm.Write (read$ $Snap.unit))
      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No (- $Perm.Write (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; [exec]
; inhale acc(Array$13$i32(_7.val_ref), read$())
; [eval] read$()
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(declare-const $t@96@01 $Snap)
(declare-const $t@97@01 $Snap)
(assert (and
  (=>
    (<
      $Perm.No
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit)))))
    (= $t@97@01 $t@91@01))
  (=> (< $Perm.No (read$ $Snap.unit)) (= $t@97@01 $t@96@01))))
(assert (<=
  $Perm.No
  (+
    (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    (read$ $Snap.unit))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; label l0
; [exec]
; _6 := builtin$havoc_ref()
(declare-const ret@98@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_6.val_ref, write)
(declare-const $t@99@01 $Ref)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= ret@94@01 ret@98@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@98@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _6.val_ref := _7.val_ref
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= ret@94@01 ret@98@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; [exec]
; inhale acc(Array$13$i32(_6.val_ref), read$())
; [eval] read$()
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(declare-const $t@100@01 $Snap)
(declare-const $t@101@01 $Snap)
(assert (and
  (=>
    (<
      $Perm.No
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit)))
    (= $t@101@01 $t@97@01))
  (=> (< $Perm.No (read$ $Snap.unit)) (= $t@101@01 $t@100@01))))
(assert (<=
  $Perm.No
  (+
    (+
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
      (read$ $Snap.unit))
    (read$ $Snap.unit))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; label l1
; [exec]
; label l2
; [exec]
; _5 := builtin$havoc_ref()
(declare-const ret@102@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_5.val_ref, write)
(declare-const $t@103@01 $Ref)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= ret@98@01 ret@102@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= ret@94@01 ret@102@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@102@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(Slice$i32(_5.val_ref), read$())
; [eval] read$()
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(declare-const $t@104@01 $Snap)
(assert (<= $Perm.No (read$ $Snap.unit)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale Slice$len__$TY$__i32$Slice$i32$$int$(_5.val_ref) == 13
(declare-const $t@105@01 $Snap)
(assert (= $t@105@01 $Snap.unit))
; [eval] Slice$len__$TY$__i32$Slice$i32$$int$(_5.val_ref) == 13
; [eval] Slice$len__$TY$__i32$Slice$i32$$int$(_5.val_ref)
(set-option :timeout 0)
(push) ; 3
; [eval] read$()
(push) ; 4
(pop) ; 4
; Joined path conditions
(push) ; 4
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (Slice$len__$TY$__i32$Slice$i32$$int$%precondition $t@104@01 $t@103@01))
(pop) ; 3
; Joined path conditions
(assert (Slice$len__$TY$__i32$Slice$i32$$int$%precondition $t@104@01 $t@103@01))
(assert (= (Slice$len__$TY$__i32$Slice$i32$$int$ $t@104@01 $t@103@01) 13))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (let _LET_0 ==
;     (_6.val_ref) in
;     (let _LET_1 ==
;       (_5.val_ref) in
;       (forall i: Int ::
;         { lookup_pure__$TY$__Array$13$i32$i32$Array$13$i32$$int$$$int$(_6.val_ref,
;         i) }
;         { lookup_pure__$TY$__Slice$i32$i32$Slice$i32$$int$$$int$(_5.val_ref,
;         i) }
;         0 <= i && i < 13 ==>
;         lookup_pure__$TY$__Array$13$i32$i32$Array$13$i32$$int$$$int$(_LET_0,
;         i) ==
;         lookup_pure__$TY$__Slice$i32$i32$Slice$i32$$int$$$int$(_LET_1, i))))
(declare-const $t@106@01 $Snap)
(assert (= $t@106@01 $Snap.unit))
; [eval] (let _LET_0 == (_6.val_ref) in (let _LET_1 == (_5.val_ref) in (forall i: Int :: { lookup_pure__$TY$__Array$13$i32$i32$Array$13$i32$$int$$$int$(_6.val_ref, i) } { lookup_pure__$TY$__Slice$i32$i32$Slice$i32$$int$$$int$(_5.val_ref, i) } 0 <= i && i < 13 ==> lookup_pure__$TY$__Array$13$i32$i32$Array$13$i32$$int$$$int$(_LET_0, i) == lookup_pure__$TY$__Slice$i32$i32$Slice$i32$$int$$$int$(_LET_1, i))))
(declare-const letvar@107@01 $Ref)
(assert (= (as letvar@107@01  $Ref) ret@90@01))
; [eval] (let _LET_1 == (_5.val_ref) in (forall i: Int :: { lookup_pure__$TY$__Array$13$i32$i32$Array$13$i32$$int$$$int$(_6.val_ref, i) } { lookup_pure__$TY$__Slice$i32$i32$Slice$i32$$int$$$int$(_5.val_ref, i) } 0 <= i && i < 13 ==> lookup_pure__$TY$__Array$13$i32$i32$Array$13$i32$$int$$$int$(_LET_0, i) == lookup_pure__$TY$__Slice$i32$i32$Slice$i32$$int$$$int$(_LET_1, i)))
(declare-const letvar@108@01 $Ref)
(assert (= (as letvar@108@01  $Ref) $t@103@01))
; [eval] (forall i: Int :: { lookup_pure__$TY$__Array$13$i32$i32$Array$13$i32$$int$$$int$(_6.val_ref, i) } { lookup_pure__$TY$__Slice$i32$i32$Slice$i32$$int$$$int$(_5.val_ref, i) } 0 <= i && i < 13 ==> lookup_pure__$TY$__Array$13$i32$i32$Array$13$i32$$int$$$int$(_LET_0, i) == lookup_pure__$TY$__Slice$i32$i32$Slice$i32$$int$$$int$(_LET_1, i))
(declare-const i@109@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= i && i < 13 ==> lookup_pure__$TY$__Array$13$i32$i32$Array$13$i32$$int$$$int$(_LET_0, i) == lookup_pure__$TY$__Slice$i32$i32$Slice$i32$$int$$$int$(_LET_1, i)
; [eval] 0 <= i && i < 13
; [eval] 0 <= i
(push) ; 4
; [then-branch: 2 | 0 <= i@109@01 | live]
; [else-branch: 2 | !(0 <= i@109@01) | live]
(push) ; 5
; [then-branch: 2 | 0 <= i@109@01]
(assert (<= 0 i@109@01))
; [eval] i < 13
(pop) ; 5
(push) ; 5
; [else-branch: 2 | !(0 <= i@109@01)]
(assert (not (<= 0 i@109@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (<= 0 i@109@01)) (<= 0 i@109@01)))
(push) ; 4
; [then-branch: 3 | i@109@01 < 13 && 0 <= i@109@01 | live]
; [else-branch: 3 | !(i@109@01 < 13 && 0 <= i@109@01) | live]
(push) ; 5
; [then-branch: 3 | i@109@01 < 13 && 0 <= i@109@01]
(assert (and (< i@109@01 13) (<= 0 i@109@01)))
; [eval] lookup_pure__$TY$__Array$13$i32$i32$Array$13$i32$$int$$$int$(_LET_0, i) == lookup_pure__$TY$__Slice$i32$i32$Slice$i32$$int$$$int$(_LET_1, i)
; [eval] lookup_pure__$TY$__Array$13$i32$i32$Array$13$i32$$int$$$int$(_LET_0, i)
(push) ; 6
; [eval] read$()
(push) ; 7
(pop) ; 7
; Joined path conditions
(push) ; 7
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  (-
    (+
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit))
      (read$ $Snap.unit))
    ($Perm.min
      (+
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit))
      (read$ $Snap.unit)))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (<=
  $Perm.No
  (-
    (+
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit))
      (read$ $Snap.unit))
    ($Perm.min
      (+
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit))
      (read$ $Snap.unit)))))
(set-option :timeout 0)
(push) ; 7
(assert (not (or
  (=
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    $Perm.No)
  (<
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [eval] 0 <= idx
; [eval] idx < 13
(assert (lookup_pure__$TY$__Array$13$i32$i32$Array$13$i32$$int$$$int$%precondition ($Snap.combine
  $t@101@01
  ($Snap.combine $Snap.unit $Snap.unit)) ret@90@01 i@109@01))
(pop) ; 6
; Joined path conditions
(assert (and
  (<=
    $Perm.No
    (-
      (+
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        (read$ $Snap.unit))))
  (lookup_pure__$TY$__Array$13$i32$i32$Array$13$i32$$int$$$int$%precondition ($Snap.combine
    $t@101@01
    ($Snap.combine $Snap.unit $Snap.unit)) ret@90@01 i@109@01)))
; [eval] lookup_pure__$TY$__Slice$i32$i32$Slice$i32$$int$$$int$(_LET_1, i)
(set-option :timeout 0)
(push) ; 6
; [eval] read$()
(push) ; 7
(pop) ; 7
; Joined path conditions
(push) ; 7
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [eval] 0 <= idx
; [eval] idx < Slice$len__$TY$__i32$Slice$i32$$int$(self)
; [eval] Slice$len__$TY$__i32$Slice$i32$$int$(self)
(set-option :timeout 0)
(push) ; 7
; [eval] read$()
(push) ; 8
(pop) ; 8
; Joined path conditions
(push) ; 8
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(push) ; 8
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(pop) ; 7
; Joined path conditions
(set-option :timeout 0)
(push) ; 7
(assert (not (< i@109@01 (Slice$len__$TY$__i32$Slice$i32$$int$ $t@104@01 $t@103@01))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (< i@109@01 (Slice$len__$TY$__i32$Slice$i32$$int$ $t@104@01 $t@103@01)))
(assert (lookup_pure__$TY$__Slice$i32$i32$Slice$i32$$int$$$int$%precondition ($Snap.combine
  $t@104@01
  ($Snap.combine $Snap.unit $Snap.unit)) $t@103@01 i@109@01))
(pop) ; 6
; Joined path conditions
(assert (and
  (< i@109@01 (Slice$len__$TY$__i32$Slice$i32$$int$ $t@104@01 $t@103@01))
  (lookup_pure__$TY$__Slice$i32$i32$Slice$i32$$int$$$int$%precondition ($Snap.combine
    $t@104@01
    ($Snap.combine $Snap.unit $Snap.unit)) $t@103@01 i@109@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 3 | !(i@109@01 < 13 && 0 <= i@109@01)]
(assert (not (and (< i@109@01 13) (<= 0 i@109@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and (< i@109@01 13) (<= 0 i@109@01))
  (and
    (< i@109@01 13)
    (<= 0 i@109@01)
    (<=
      $Perm.No
      (-
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          (read$ $Snap.unit))))
    (lookup_pure__$TY$__Array$13$i32$i32$Array$13$i32$$int$$$int$%precondition ($Snap.combine
      $t@101@01
      ($Snap.combine $Snap.unit $Snap.unit)) ret@90@01 i@109@01)
    (< i@109@01 (Slice$len__$TY$__i32$Slice$i32$$int$ $t@104@01 $t@103@01))
    (lookup_pure__$TY$__Slice$i32$i32$Slice$i32$$int$$$int$%precondition ($Snap.combine
      $t@104@01
      ($Snap.combine $Snap.unit $Snap.unit)) $t@103@01 i@109@01))))
; Joined path conditions
(assert (or
  (not (and (< i@109@01 13) (<= 0 i@109@01)))
  (and (< i@109@01 13) (<= 0 i@109@01))))
; [eval] lookup_pure__$TY$__Array$13$i32$i32$Array$13$i32$$int$$$int$(_6.val_ref, i)
(push) ; 4
; [eval] read$()
(push) ; 5
(pop) ; 5
; Joined path conditions
(push) ; 5
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
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
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit))
      (read$ $Snap.unit))
    ($Perm.min
      (+
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit))
      (read$ $Snap.unit)))
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
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit))
      (read$ $Snap.unit))
    ($Perm.min
      (+
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit))
      (read$ $Snap.unit)))))
(set-option :timeout 0)
(push) ; 5
(assert (not (or
  (=
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    $Perm.No)
  (<
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [eval] 0 <= idx
(set-option :timeout 0)
(push) ; 5
(assert (not (<= 0 i@109@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@102@01 ret@98@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@98@01 ret@94@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@102@01 ret@94@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= ret@90@01 $t@103@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= ret@90@01 $t@103@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= $t@103@01 ret@90@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= $t@103@01 ret@90@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (and
  (and (not (= ret@94@01 ret@98@01)) (not (= ret@94@01 ret@102@01)))
  (and (not (= ret@98@01 ret@94@01)) (not (= ret@98@01 ret@102@01)))
  (and (not (= ret@102@01 ret@94@01)) (not (= ret@102@01 ret@98@01)))))
; [eval] 0 <= idx
(set-option :timeout 0)
(push) ; 5
(assert (not (<= 0 i@109@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@102@01 ret@98@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@98@01 ret@94@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@102@01 ret@94@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= ret@90@01 $t@103@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= ret@90@01 $t@103@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= $t@103@01 ret@90@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= $t@103@01 ret@90@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (and
  (and (not (= ret@94@01 ret@98@01)) (not (= ret@94@01 ret@102@01)))
  (and (not (= ret@98@01 ret@94@01)) (not (= ret@98@01 ret@102@01)))
  (and (not (= ret@102@01 ret@94@01)) (not (= ret@102@01 ret@98@01)))))
; [eval] 0 <= idx
(set-option :timeout 0)
(push) ; 5
(assert (not (<= 0 i@109@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@102@01 ret@98@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@98@01 ret@94@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@102@01 ret@94@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= ret@90@01 $t@103@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= ret@90@01 $t@103@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= $t@103@01 ret@90@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= $t@103@01 ret@90@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (and
  (and (not (= ret@94@01 ret@98@01)) (not (= ret@94@01 ret@102@01)))
  (and (not (= ret@98@01 ret@94@01)) (not (= ret@98@01 ret@102@01)))
  (and (not (= ret@102@01 ret@94@01)) (not (= ret@102@01 ret@98@01)))))
; [eval] 0 <= idx
(set-option :timeout 0)
(push) ; 5
(assert (not (<= 0 i@109@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(pop) ; 4
; [eval] lookup_pure__$TY$__Slice$i32$i32$Slice$i32$$int$$$int$(_5.val_ref, i)
(push) ; 4
; [eval] read$()
(push) ; 5
(pop) ; 5
; Joined path conditions
(push) ; 5
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [eval] 0 <= idx
(set-option :timeout 0)
(push) ; 5
(assert (not (<= 0 i@109@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@102@01 ret@98@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@98@01 ret@94@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@102@01 ret@94@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= ret@90@01 $t@103@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= ret@90@01 $t@103@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= $t@103@01 ret@90@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= $t@103@01 ret@90@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (and
  (and (not (= ret@94@01 ret@98@01)) (not (= ret@94@01 ret@102@01)))
  (and (not (= ret@98@01 ret@94@01)) (not (= ret@98@01 ret@102@01)))
  (and (not (= ret@102@01 ret@94@01)) (not (= ret@102@01 ret@98@01)))))
; [eval] 0 <= idx
(set-option :timeout 0)
(push) ; 5
(assert (not (<= 0 i@109@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@102@01 ret@98@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@98@01 ret@94@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@102@01 ret@94@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= ret@90@01 $t@103@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= ret@90@01 $t@103@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= $t@103@01 ret@90@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= $t@103@01 ret@90@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (and
  (and (not (= ret@94@01 ret@98@01)) (not (= ret@94@01 ret@102@01)))
  (and (not (= ret@98@01 ret@94@01)) (not (= ret@98@01 ret@102@01)))
  (and (not (= ret@102@01 ret@94@01)) (not (= ret@102@01 ret@98@01)))))
; [eval] 0 <= idx
(set-option :timeout 0)
(push) ; 5
(assert (not (<= 0 i@109@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@102@01 ret@98@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@98@01 ret@94@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@102@01 ret@94@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= ret@90@01 $t@103@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= ret@90@01 $t@103@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= $t@103@01 ret@90@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= $t@103@01 ret@90@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (and
  (and (not (= ret@94@01 ret@98@01)) (not (= ret@94@01 ret@102@01)))
  (and (not (= ret@98@01 ret@94@01)) (not (= ret@98@01 ret@102@01)))
  (and (not (= ret@102@01 ret@94@01)) (not (= ret@102@01 ret@98@01)))))
; [eval] 0 <= idx
(set-option :timeout 0)
(push) ; 5
(assert (not (<= 0 i@109@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(pop) ; 4
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@109@01 Int)) (!
  (and
    (or (not (<= 0 i@109@01)) (<= 0 i@109@01))
    (=>
      (and (< i@109@01 13) (<= 0 i@109@01))
      (and
        (< i@109@01 13)
        (<= 0 i@109@01)
        (<=
          $Perm.No
          (-
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            ($Perm.min
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              (read$ $Snap.unit))))
        (lookup_pure__$TY$__Array$13$i32$i32$Array$13$i32$$int$$$int$%precondition ($Snap.combine
          $t@101@01
          ($Snap.combine $Snap.unit $Snap.unit)) ret@90@01 i@109@01)
        (< i@109@01 (Slice$len__$TY$__i32$Slice$i32$$int$ $t@104@01 $t@103@01))
        (lookup_pure__$TY$__Slice$i32$i32$Slice$i32$$int$$$int$%precondition ($Snap.combine
          $t@104@01
          ($Snap.combine $Snap.unit $Snap.unit)) $t@103@01 i@109@01)))
    (or
      (not (and (< i@109@01 13) (<= 0 i@109@01)))
      (and (< i@109@01 13) (<= 0 i@109@01))))
  
  :qid |prog.l573-aux|)))
(assert (forall ((i@109@01 Int)) (!
  (=>
    (and (< i@109@01 13) (<= 0 i@109@01))
    (=
      (lookup_pure__$TY$__Array$13$i32$i32$Array$13$i32$$int$$$int$ ($Snap.combine
        $t@101@01
        ($Snap.combine $Snap.unit $Snap.unit)) ret@90@01 i@109@01)
      (lookup_pure__$TY$__Slice$i32$i32$Slice$i32$$int$$$int$ ($Snap.combine
        $t@104@01
        ($Snap.combine $Snap.unit $Snap.unit)) $t@103@01 i@109@01)))
  
  :qid |prog.l573|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; label l3
; [exec]
; _t60 := builtin$havoc_int()
(declare-const ret@110@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _t60 >= 0
(declare-const $t@111@01 $Snap)
(assert (= $t@111@01 $Snap.unit))
; [eval] _t60 >= 0
(assert (>= ret@110@01 0))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert 7 <
;   len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$(snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(_5.val_ref))
; [eval] 7 < len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$(snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(_5.val_ref))
; [eval] len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$(snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(_5.val_ref))
; [eval] snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(_5.val_ref)
(set-option :timeout 0)
(push) ; 3
; [eval] read$()
(push) ; 4
(pop) ; 4
; Joined path conditions
(push) ; 4
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32%precondition $t@104@01 $t@103@01))
(pop) ; 3
; Joined path conditions
(assert (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32%precondition $t@104@01 $t@103@01))
(set-option :timeout 0)
(push) ; 3
(assert (not (<
  7
  (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 $t@104@01 $t@103@01)))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (<
  7
  (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 $t@104@01 $t@103@01))))
; [exec]
; assert true
; [exec]
; exhale acc(_5.val_ref, write) && _t60 >= 0
; [eval] _t60 >= 0
; [exec]
; _4 := builtin$havoc_ref()
(declare-const ret@112@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(tuple2$ref$Slice$i32$ref$Slice$i32(_4), write)
(declare-const $t@113@01 $Snap)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale true
(declare-const $t@114@01 $Snap)
(assert (= $t@114@01 $Snap.unit))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; unfold acc(tuple2$ref$Slice$i32$ref$Slice$i32(_4), write)
(assert (= $t@113@01 ($Snap.combine ($Snap.first $t@113@01) ($Snap.second $t@113@01))))
(assert (not (= ret@112@01 $Ref.null)))
(assert (=
  ($Snap.second $t@113@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@113@01))
    ($Snap.second ($Snap.second $t@113@01)))))
(assert (=
  ($Snap.second ($Snap.second $t@113@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@113@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@113@01))))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first $t@113@01))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@113@01)))))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (tuple2$ref$Slice$i32$ref$Slice$i32%trigger $t@113@01 ret@112@01))
; [exec]
; unfold acc(ref$Slice$i32(_4.tuple_0), write)
(assert (=
  ($Snap.first ($Snap.second $t@113@01))
  ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second $t@113@01)))
    ($Snap.second ($Snap.first ($Snap.second $t@113@01))))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= ret@94@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@113@01)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= ret@98@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@113@01)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@113@01)) $Ref.null)))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  $t@103@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second $t@113@01)))))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (ref$Slice$i32%trigger ($Snap.first ($Snap.second $t@113@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@113@01))))
; [exec]
; unfold acc(ref$Slice$i32(_4.tuple_1), write)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@113@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@113@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@113@01)))))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first $t@113@01))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@113@01)))))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  ret@94@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@113@01)))))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  ret@98@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@113@01)))))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@113@01))))
    $Ref.null)))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second $t@113@01))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@113@01))))))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  $t@103@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@113@01))))))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (ref$Slice$i32%trigger ($Snap.second ($Snap.second ($Snap.second $t@113@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@113@01))))))
; [exec]
; inhale len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$(snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(_4.tuple_0.val_ref)) ==
;   old[l3](7) &&
;   (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$(snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(_4.tuple_1.val_ref)) ==
;   len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$(snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(old[l3](_5.val_ref))) -
;   old[l3](7) &&
;   ((forall _0_quant_0: Int ::
;     { read$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$$$int$(snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(old[l3](_5.val_ref)),
;     _0_quant_0) }
;     { read$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$$$int$(snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(_4.tuple_0.val_ref),
;     _0_quant_0) }
;     0 <= _0_quant_0 ==>
;     !(0 <= _0_quant_0) ||
;     (!(_0_quant_0 < old[l3](7)) ||
;     _0_quant_0 <
;     len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$(snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(old[l3](_5.val_ref))) &&
;     (_0_quant_0 <
;     len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$(snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(_4.tuple_0.val_ref)) &&
;     read$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$$$int$(snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(old[l3](_5.val_ref)),
;     _0_quant_0) ==
;     read$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$$$int$(snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(_4.tuple_0.val_ref),
;     _0_quant_0)))) &&
;   (forall _0_quant_0: Int, _1_quant_0: Int ::
;     { read$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$$$int$(snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(old[l3](_5.val_ref)),
;     _0_quant_0), read$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$$$int$(snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(_4.tuple_1.val_ref),
;     _1_quant_0) }
;     0 <= _0_quant_0 && 0 <= _1_quant_0 ==>
;     !(old[l3](7) <= _0_quant_0) ||
;     (!(_0_quant_0 <
;     len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$(snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(old[l3](_5.val_ref)))) ||
;     (!(0 <= _1_quant_0) ||
;     (!(_1_quant_0 <
;     len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$(snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(_4.tuple_1.val_ref))) ||
;     _0_quant_0 <
;     len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$(snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(old[l3](_5.val_ref))) &&
;     (_1_quant_0 <
;     len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$(snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(_4.tuple_1.val_ref)) &&
;     read$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$$$int$(snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(old[l3](_5.val_ref)),
;     _0_quant_0) ==
;     read$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$$$int$(snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(_4.tuple_1.val_ref),
;     _1_quant_0))))))))
(declare-const $t@115@01 $Snap)
(assert (= $t@115@01 ($Snap.combine ($Snap.first $t@115@01) ($Snap.second $t@115@01))))
(assert (= ($Snap.first $t@115@01) $Snap.unit))
; [eval] len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$(snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(_4.tuple_0.val_ref)) == old[l3](7)
; [eval] len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$(snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(_4.tuple_0.val_ref))
; [eval] snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(_4.tuple_0.val_ref)
(set-option :timeout 0)
(push) ; 3
; [eval] read$()
(push) ; 4
(pop) ; 4
; Joined path conditions
(push) ; 4
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(push) ; 4
(set-option :timeout 10)
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (<= $Perm.No (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))))
(set-option :timeout 0)
(push) ; 4
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32%precondition ($Snap.second ($Snap.first ($Snap.second $t@113@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second $t@113@01))))))
(pop) ; 3
; Joined path conditions
(assert (and
  (<= $Perm.No (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))))
  (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32%precondition ($Snap.second ($Snap.first ($Snap.second $t@113@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second $t@113@01)))))))
; [eval] old[l3](7)
(assert (=
  (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 ($Snap.second ($Snap.first ($Snap.second $t@113@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second $t@113@01))))))
  7))
(assert (=
  ($Snap.second $t@115@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@115@01))
    ($Snap.second ($Snap.second $t@115@01)))))
(assert (= ($Snap.first ($Snap.second $t@115@01)) $Snap.unit))
; [eval] len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$(snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(_4.tuple_1.val_ref)) == len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$(snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(old[l3](_5.val_ref))) - old[l3](7)
; [eval] len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$(snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(_4.tuple_1.val_ref))
; [eval] snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(_4.tuple_1.val_ref)
(set-option :timeout 0)
(push) ; 3
; [eval] read$()
(push) ; 4
(pop) ; 4
; Joined path conditions
(push) ; 4
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(push) ; 4
(set-option :timeout 10)
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 4
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32%precondition ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@113@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@113@01)))))))
(pop) ; 3
; Joined path conditions
(assert (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32%precondition ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@113@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@113@01)))))))
; [eval] len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$(snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(old[l3](_5.val_ref))) - old[l3](7)
; [eval] len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$(snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(old[l3](_5.val_ref)))
; [eval] snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(old[l3](_5.val_ref))
; [eval] old[l3](_5.val_ref)
(set-option :timeout 0)
(push) ; 3
; [eval] read$()
(push) ; 4
(pop) ; 4
; Joined path conditions
(push) ; 4
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(pop) ; 3
; Joined path conditions
; [eval] old[l3](7)
(assert (=
  (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@113@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@113@01)))))))
  (-
    (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 $t@104@01 $t@103@01))
    7)))
(assert (=
  ($Snap.second ($Snap.second $t@115@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@115@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@115@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@115@01))) $Snap.unit))
; [eval] (forall _0_quant_0: Int :: { read$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$$$int$(snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(old[l3](_5.val_ref)), _0_quant_0) } { read$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$$$int$(snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(_4.tuple_0.val_ref), _0_quant_0) } 0 <= _0_quant_0 ==> !(0 <= _0_quant_0) || (!(_0_quant_0 < old[l3](7)) || _0_quant_0 < len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$(snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(old[l3](_5.val_ref))) && (_0_quant_0 < len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$(snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(_4.tuple_0.val_ref)) && read$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$$$int$(snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(old[l3](_5.val_ref)), _0_quant_0) == read$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$$$int$(snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(_4.tuple_0.val_ref), _0_quant_0))))
(declare-const _0_quant_0@116@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= _0_quant_0 ==> !(0 <= _0_quant_0) || (!(_0_quant_0 < old[l3](7)) || _0_quant_0 < len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$(snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(old[l3](_5.val_ref))) && (_0_quant_0 < len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$(snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(_4.tuple_0.val_ref)) && read$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$$$int$(snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(old[l3](_5.val_ref)), _0_quant_0) == read$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$$$int$(snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(_4.tuple_0.val_ref), _0_quant_0)))
; [eval] 0 <= _0_quant_0
(push) ; 4
; [then-branch: 4 | 0 <= _0_quant_0@116@01 | live]
; [else-branch: 4 | !(0 <= _0_quant_0@116@01) | live]
(push) ; 5
; [then-branch: 4 | 0 <= _0_quant_0@116@01]
(assert (<= 0 _0_quant_0@116@01))
; [eval] !(0 <= _0_quant_0) || (!(_0_quant_0 < old[l3](7)) || _0_quant_0 < len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$(snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(old[l3](_5.val_ref))) && (_0_quant_0 < len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$(snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(_4.tuple_0.val_ref)) && read$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$$$int$(snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(old[l3](_5.val_ref)), _0_quant_0) == read$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$$$int$(snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(_4.tuple_0.val_ref), _0_quant_0)))
; [eval] !(0 <= _0_quant_0)
; [eval] 0 <= _0_quant_0
(push) ; 6
; [then-branch: 5 | !(0 <= _0_quant_0@116@01) | live]
; [else-branch: 5 | 0 <= _0_quant_0@116@01 | live]
(push) ; 7
; [then-branch: 5 | !(0 <= _0_quant_0@116@01)]
(assert (not (<= 0 _0_quant_0@116@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 5 | 0 <= _0_quant_0@116@01]
; [eval] !(_0_quant_0 < old[l3](7))
; [eval] _0_quant_0 < old[l3](7)
; [eval] old[l3](7)
(push) ; 8
; [then-branch: 6 | !(_0_quant_0@116@01 < 7) | live]
; [else-branch: 6 | _0_quant_0@116@01 < 7 | live]
(push) ; 9
; [then-branch: 6 | !(_0_quant_0@116@01 < 7)]
(assert (not (< _0_quant_0@116@01 7)))
(pop) ; 9
(push) ; 9
; [else-branch: 6 | _0_quant_0@116@01 < 7]
(assert (< _0_quant_0@116@01 7))
; [eval] _0_quant_0 < len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$(snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(old[l3](_5.val_ref))) && (_0_quant_0 < len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$(snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(_4.tuple_0.val_ref)) && read$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$$$int$(snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(old[l3](_5.val_ref)), _0_quant_0) == read$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$$$int$(snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(_4.tuple_0.val_ref), _0_quant_0))
; [eval] _0_quant_0 < len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$(snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(old[l3](_5.val_ref)))
; [eval] len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$(snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(old[l3](_5.val_ref)))
; [eval] snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(old[l3](_5.val_ref))
; [eval] old[l3](_5.val_ref)
(push) ; 10
; [eval] read$()
(push) ; 11
(pop) ; 11
; Joined path conditions
(push) ; 11
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(push) ; 11
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(pop) ; 10
; Joined path conditions
(set-option :timeout 0)
(push) ; 10
; [then-branch: 7 | _0_quant_0@116@01 < len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$[Int](snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32($t@104@01, $t@103@01)) | live]
; [else-branch: 7 | !(_0_quant_0@116@01 < len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$[Int](snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32($t@104@01, $t@103@01))) | live]
(push) ; 11
; [then-branch: 7 | _0_quant_0@116@01 < len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$[Int](snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32($t@104@01, $t@103@01))]
(assert (<
  _0_quant_0@116@01
  (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 $t@104@01 $t@103@01))))
; [eval] _0_quant_0 < len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$(snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(_4.tuple_0.val_ref))
; [eval] len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$(snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(_4.tuple_0.val_ref))
; [eval] snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(_4.tuple_0.val_ref)
(push) ; 12
; [eval] read$()
(push) ; 13
(pop) ; 13
; Joined path conditions
(push) ; 13
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(push) ; 13
(set-option :timeout 10)
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 13
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
(check-sat)
; unsat
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(push) ; 13
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(pop) ; 12
; Joined path conditions
(set-option :timeout 0)
(push) ; 12
; [then-branch: 8 | _0_quant_0@116@01 < len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$[Int](snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(Second:(First:(Second:($t@113@01))), First:(First:(Second:($t@113@01))))) | live]
; [else-branch: 8 | !(_0_quant_0@116@01 < len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$[Int](snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(Second:(First:(Second:($t@113@01))), First:(First:(Second:($t@113@01)))))) | live]
(push) ; 13
; [then-branch: 8 | _0_quant_0@116@01 < len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$[Int](snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(Second:(First:(Second:($t@113@01))), First:(First:(Second:($t@113@01)))))]
(assert (<
  _0_quant_0@116@01
  (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 ($Snap.second ($Snap.first ($Snap.second $t@113@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second $t@113@01))))))))
; [eval] read$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$$$int$(snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(old[l3](_5.val_ref)), _0_quant_0) == read$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$$$int$(snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(_4.tuple_0.val_ref), _0_quant_0)
; [eval] read$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$$$int$(snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(old[l3](_5.val_ref)), _0_quant_0)
; [eval] snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(old[l3](_5.val_ref))
; [eval] old[l3](_5.val_ref)
(push) ; 14
; [eval] read$()
(push) ; 15
(pop) ; 15
; Joined path conditions
(push) ; 15
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(push) ; 15
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(pop) ; 14
; Joined path conditions
; [eval] read$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$$$int$(snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(_4.tuple_0.val_ref), _0_quant_0)
; [eval] snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(_4.tuple_0.val_ref)
(set-option :timeout 0)
(push) ; 14
; [eval] read$()
(push) ; 15
(pop) ; 15
; Joined path conditions
(push) ; 15
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(push) ; 15
(set-option :timeout 10)
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 15
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
(check-sat)
; unsat
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(push) ; 15
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(pop) ; 14
; Joined path conditions
(pop) ; 13
(set-option :timeout 0)
(push) ; 13
; [else-branch: 8 | !(_0_quant_0@116@01 < len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$[Int](snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(Second:(First:(Second:($t@113@01))), First:(First:(Second:($t@113@01))))))]
(assert (not
  (<
    _0_quant_0@116@01
    (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 ($Snap.second ($Snap.first ($Snap.second $t@113@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second $t@113@01)))))))))
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(assert (or
  (not
    (<
      _0_quant_0@116@01
      (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 ($Snap.second ($Snap.first ($Snap.second $t@113@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second $t@113@01))))))))
  (<
    _0_quant_0@116@01
    (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 ($Snap.second ($Snap.first ($Snap.second $t@113@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second $t@113@01)))))))))
(pop) ; 11
(push) ; 11
; [else-branch: 7 | !(_0_quant_0@116@01 < len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$[Int](snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32($t@104@01, $t@103@01)))]
(assert (not
  (<
    _0_quant_0@116@01
    (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 $t@104@01 $t@103@01)))))
(pop) ; 11
(pop) ; 10
; Joined path conditions
(assert (=>
  (<
    _0_quant_0@116@01
    (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 $t@104@01 $t@103@01)))
  (and
    (<
      _0_quant_0@116@01
      (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 $t@104@01 $t@103@01)))
    (or
      (not
        (<
          _0_quant_0@116@01
          (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 ($Snap.second ($Snap.first ($Snap.second $t@113@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second $t@113@01))))))))
      (<
        _0_quant_0@116@01
        (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 ($Snap.second ($Snap.first ($Snap.second $t@113@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second $t@113@01)))))))))))
; Joined path conditions
(assert (or
  (not
    (<
      _0_quant_0@116@01
      (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 $t@104@01 $t@103@01))))
  (<
    _0_quant_0@116@01
    (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 $t@104@01 $t@103@01)))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (< _0_quant_0@116@01 7)
  (and
    (< _0_quant_0@116@01 7)
    (=>
      (<
        _0_quant_0@116@01
        (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 $t@104@01 $t@103@01)))
      (and
        (<
          _0_quant_0@116@01
          (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 $t@104@01 $t@103@01)))
        (or
          (not
            (<
              _0_quant_0@116@01
              (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 ($Snap.second ($Snap.first ($Snap.second $t@113@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second $t@113@01))))))))
          (<
            _0_quant_0@116@01
            (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 ($Snap.second ($Snap.first ($Snap.second $t@113@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second $t@113@01))))))))))
    (or
      (not
        (<
          _0_quant_0@116@01
          (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 $t@104@01 $t@103@01))))
      (<
        _0_quant_0@116@01
        (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 $t@104@01 $t@103@01)))))))
(assert (or (< _0_quant_0@116@01 7) (not (< _0_quant_0@116@01 7))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 _0_quant_0@116@01)
  (and
    (=>
      (< _0_quant_0@116@01 7)
      (and
        (< _0_quant_0@116@01 7)
        (=>
          (<
            _0_quant_0@116@01
            (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 $t@104@01 $t@103@01)))
          (and
            (<
              _0_quant_0@116@01
              (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 $t@104@01 $t@103@01)))
            (or
              (not
                (<
                  _0_quant_0@116@01
                  (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 ($Snap.second ($Snap.first ($Snap.second $t@113@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second $t@113@01))))))))
              (<
                _0_quant_0@116@01
                (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 ($Snap.second ($Snap.first ($Snap.second $t@113@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second $t@113@01))))))))))
        (or
          (not
            (<
              _0_quant_0@116@01
              (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 $t@104@01 $t@103@01))))
          (<
            _0_quant_0@116@01
            (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 $t@104@01 $t@103@01))))))
    (or (< _0_quant_0@116@01 7) (not (< _0_quant_0@116@01 7))))))
(assert (or (<= 0 _0_quant_0@116@01) (not (<= 0 _0_quant_0@116@01))))
(pop) ; 5
(push) ; 5
; [else-branch: 4 | !(0 <= _0_quant_0@116@01)]
(assert (not (<= 0 _0_quant_0@116@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (<= 0 _0_quant_0@116@01)
  (and
    (<= 0 _0_quant_0@116@01)
    (=>
      (<= 0 _0_quant_0@116@01)
      (and
        (=>
          (< _0_quant_0@116@01 7)
          (and
            (< _0_quant_0@116@01 7)
            (=>
              (<
                _0_quant_0@116@01
                (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 $t@104@01 $t@103@01)))
              (and
                (<
                  _0_quant_0@116@01
                  (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 $t@104@01 $t@103@01)))
                (or
                  (not
                    (<
                      _0_quant_0@116@01
                      (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 ($Snap.second ($Snap.first ($Snap.second $t@113@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second $t@113@01))))))))
                  (<
                    _0_quant_0@116@01
                    (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 ($Snap.second ($Snap.first ($Snap.second $t@113@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second $t@113@01))))))))))
            (or
              (not
                (<
                  _0_quant_0@116@01
                  (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 $t@104@01 $t@103@01))))
              (<
                _0_quant_0@116@01
                (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 $t@104@01 $t@103@01))))))
        (or (< _0_quant_0@116@01 7) (not (< _0_quant_0@116@01 7)))))
    (or (<= 0 _0_quant_0@116@01) (not (<= 0 _0_quant_0@116@01))))))
; Joined path conditions
(assert (or (not (<= 0 _0_quant_0@116@01)) (<= 0 _0_quant_0@116@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((_0_quant_0@116@01 Int)) (!
  (and
    (=>
      (<= 0 _0_quant_0@116@01)
      (and
        (<= 0 _0_quant_0@116@01)
        (=>
          (<= 0 _0_quant_0@116@01)
          (and
            (=>
              (< _0_quant_0@116@01 7)
              (and
                (< _0_quant_0@116@01 7)
                (=>
                  (<
                    _0_quant_0@116@01
                    (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 $t@104@01 $t@103@01)))
                  (and
                    (<
                      _0_quant_0@116@01
                      (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 $t@104@01 $t@103@01)))
                    (or
                      (not
                        (<
                          _0_quant_0@116@01
                          (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 ($Snap.second ($Snap.first ($Snap.second $t@113@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second $t@113@01))))))))
                      (<
                        _0_quant_0@116@01
                        (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 ($Snap.second ($Snap.first ($Snap.second $t@113@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second $t@113@01))))))))))
                (or
                  (not
                    (<
                      _0_quant_0@116@01
                      (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 $t@104@01 $t@103@01))))
                  (<
                    _0_quant_0@116@01
                    (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 $t@104@01 $t@103@01))))))
            (or (< _0_quant_0@116@01 7) (not (< _0_quant_0@116@01 7)))))
        (or (<= 0 _0_quant_0@116@01) (not (<= 0 _0_quant_0@116@01)))))
    (or (not (<= 0 _0_quant_0@116@01)) (<= 0 _0_quant_0@116@01)))
  :pattern ((read$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 $t@104@01 $t@103@01) _0_quant_0@116@01))
  :qid |prog.l603-aux|)))
(assert (forall ((_0_quant_0@116@01 Int)) (!
  (and
    (=>
      (<= 0 _0_quant_0@116@01)
      (and
        (<= 0 _0_quant_0@116@01)
        (=>
          (<= 0 _0_quant_0@116@01)
          (and
            (=>
              (< _0_quant_0@116@01 7)
              (and
                (< _0_quant_0@116@01 7)
                (=>
                  (<
                    _0_quant_0@116@01
                    (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 $t@104@01 $t@103@01)))
                  (and
                    (<
                      _0_quant_0@116@01
                      (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 $t@104@01 $t@103@01)))
                    (or
                      (not
                        (<
                          _0_quant_0@116@01
                          (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 ($Snap.second ($Snap.first ($Snap.second $t@113@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second $t@113@01))))))))
                      (<
                        _0_quant_0@116@01
                        (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 ($Snap.second ($Snap.first ($Snap.second $t@113@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second $t@113@01))))))))))
                (or
                  (not
                    (<
                      _0_quant_0@116@01
                      (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 $t@104@01 $t@103@01))))
                  (<
                    _0_quant_0@116@01
                    (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 $t@104@01 $t@103@01))))))
            (or (< _0_quant_0@116@01 7) (not (< _0_quant_0@116@01 7)))))
        (or (<= 0 _0_quant_0@116@01) (not (<= 0 _0_quant_0@116@01)))))
    (or (not (<= 0 _0_quant_0@116@01)) (<= 0 _0_quant_0@116@01)))
  :pattern ((read$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 ($Snap.second ($Snap.first ($Snap.second $t@113@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second $t@113@01))))) _0_quant_0@116@01))
  :qid |prog.l603-aux|)))
(assert (forall ((_0_quant_0@116@01 Int)) (!
  (=>
    (<= 0 _0_quant_0@116@01)
    (or
      (not (<= 0 _0_quant_0@116@01))
      (or
        (not (< _0_quant_0@116@01 7))
        (and
          (and
            (=
              (read$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 $t@104@01 $t@103@01) _0_quant_0@116@01)
              (read$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 ($Snap.second ($Snap.first ($Snap.second $t@113@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second $t@113@01))))) _0_quant_0@116@01))
            (<
              _0_quant_0@116@01
              (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 ($Snap.second ($Snap.first ($Snap.second $t@113@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second $t@113@01))))))))
          (<
            _0_quant_0@116@01
            (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 $t@104@01 $t@103@01)))))))
  :pattern ((read$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 $t@104@01 $t@103@01) _0_quant_0@116@01))
  :pattern ((read$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 ($Snap.second ($Snap.first ($Snap.second $t@113@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second $t@113@01))))) _0_quant_0@116@01))
  :qid |prog.l603|)))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@115@01))) $Snap.unit))
; [eval] (forall _0_quant_0: Int, _1_quant_0: Int :: { read$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$$$int$(snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(old[l3](_5.val_ref)), _0_quant_0), read$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$$$int$(snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(_4.tuple_1.val_ref), _1_quant_0) } 0 <= _0_quant_0 && 0 <= _1_quant_0 ==> !(old[l3](7) <= _0_quant_0) || (!(_0_quant_0 < len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$(snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(old[l3](_5.val_ref)))) || (!(0 <= _1_quant_0) || (!(_1_quant_0 < len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$(snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(_4.tuple_1.val_ref))) || _0_quant_0 < len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$(snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(old[l3](_5.val_ref))) && (_1_quant_0 < len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$(snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(_4.tuple_1.val_ref)) && read$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$$$int$(snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(old[l3](_5.val_ref)), _0_quant_0) == read$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$$$int$(snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(_4.tuple_1.val_ref), _1_quant_0))))))
(declare-const _0_quant_0@117@01 Int)
(declare-const _1_quant_0@118@01 Int)
(push) ; 3
; [eval] 0 <= _0_quant_0 && 0 <= _1_quant_0 ==> !(old[l3](7) <= _0_quant_0) || (!(_0_quant_0 < len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$(snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(old[l3](_5.val_ref)))) || (!(0 <= _1_quant_0) || (!(_1_quant_0 < len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$(snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(_4.tuple_1.val_ref))) || _0_quant_0 < len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$(snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(old[l3](_5.val_ref))) && (_1_quant_0 < len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$(snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(_4.tuple_1.val_ref)) && read$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$$$int$(snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(old[l3](_5.val_ref)), _0_quant_0) == read$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$$$int$(snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(_4.tuple_1.val_ref), _1_quant_0)))))
; [eval] 0 <= _0_quant_0 && 0 <= _1_quant_0
; [eval] 0 <= _0_quant_0
(push) ; 4
; [then-branch: 9 | 0 <= _0_quant_0@117@01 | live]
; [else-branch: 9 | !(0 <= _0_quant_0@117@01) | live]
(push) ; 5
; [then-branch: 9 | 0 <= _0_quant_0@117@01]
(assert (<= 0 _0_quant_0@117@01))
; [eval] 0 <= _1_quant_0
(pop) ; 5
(push) ; 5
; [else-branch: 9 | !(0 <= _0_quant_0@117@01)]
(assert (not (<= 0 _0_quant_0@117@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (<= 0 _0_quant_0@117@01)) (<= 0 _0_quant_0@117@01)))
(push) ; 4
; [then-branch: 10 | 0 <= _1_quant_0@118@01 && 0 <= _0_quant_0@117@01 | live]
; [else-branch: 10 | !(0 <= _1_quant_0@118@01 && 0 <= _0_quant_0@117@01) | live]
(push) ; 5
; [then-branch: 10 | 0 <= _1_quant_0@118@01 && 0 <= _0_quant_0@117@01]
(assert (and (<= 0 _1_quant_0@118@01) (<= 0 _0_quant_0@117@01)))
; [eval] !(old[l3](7) <= _0_quant_0) || (!(_0_quant_0 < len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$(snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(old[l3](_5.val_ref)))) || (!(0 <= _1_quant_0) || (!(_1_quant_0 < len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$(snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(_4.tuple_1.val_ref))) || _0_quant_0 < len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$(snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(old[l3](_5.val_ref))) && (_1_quant_0 < len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$(snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(_4.tuple_1.val_ref)) && read$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$$$int$(snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(old[l3](_5.val_ref)), _0_quant_0) == read$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$$$int$(snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(_4.tuple_1.val_ref), _1_quant_0)))))
; [eval] !(old[l3](7) <= _0_quant_0)
; [eval] old[l3](7) <= _0_quant_0
; [eval] old[l3](7)
(push) ; 6
; [then-branch: 11 | !(7 <= _0_quant_0@117@01) | live]
; [else-branch: 11 | 7 <= _0_quant_0@117@01 | live]
(push) ; 7
; [then-branch: 11 | !(7 <= _0_quant_0@117@01)]
(assert (not (<= 7 _0_quant_0@117@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 11 | 7 <= _0_quant_0@117@01]
(assert (<= 7 _0_quant_0@117@01))
; [eval] !(_0_quant_0 < len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$(snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(old[l3](_5.val_ref))))
; [eval] _0_quant_0 < len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$(snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(old[l3](_5.val_ref)))
; [eval] len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$(snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(old[l3](_5.val_ref)))
; [eval] snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(old[l3](_5.val_ref))
; [eval] old[l3](_5.val_ref)
(push) ; 8
; [eval] read$()
(push) ; 9
(pop) ; 9
; Joined path conditions
(push) ; 9
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(push) ; 9
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(pop) ; 8
; Joined path conditions
(set-option :timeout 0)
(push) ; 8
; [then-branch: 12 | !(_0_quant_0@117@01 < len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$[Int](snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32($t@104@01, $t@103@01))) | live]
; [else-branch: 12 | _0_quant_0@117@01 < len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$[Int](snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32($t@104@01, $t@103@01)) | live]
(push) ; 9
; [then-branch: 12 | !(_0_quant_0@117@01 < len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$[Int](snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32($t@104@01, $t@103@01)))]
(assert (not
  (<
    _0_quant_0@117@01
    (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 $t@104@01 $t@103@01)))))
(pop) ; 9
(push) ; 9
; [else-branch: 12 | _0_quant_0@117@01 < len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$[Int](snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32($t@104@01, $t@103@01))]
(assert (<
  _0_quant_0@117@01
  (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 $t@104@01 $t@103@01))))
; [eval] !(0 <= _1_quant_0)
; [eval] 0 <= _1_quant_0
(push) ; 10
; [then-branch: 13 | !(0 <= _1_quant_0@118@01) | live]
; [else-branch: 13 | 0 <= _1_quant_0@118@01 | live]
(push) ; 11
; [then-branch: 13 | !(0 <= _1_quant_0@118@01)]
(assert (not (<= 0 _1_quant_0@118@01)))
(pop) ; 11
(push) ; 11
; [else-branch: 13 | 0 <= _1_quant_0@118@01]
; [eval] !(_1_quant_0 < len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$(snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(_4.tuple_1.val_ref)))
; [eval] _1_quant_0 < len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$(snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(_4.tuple_1.val_ref))
; [eval] len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$(snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(_4.tuple_1.val_ref))
; [eval] snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(_4.tuple_1.val_ref)
(push) ; 12
; [eval] read$()
(push) ; 13
(pop) ; 13
; Joined path conditions
(push) ; 13
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(push) ; 13
(set-option :timeout 10)
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 13
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
(check-sat)
; unsat
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(push) ; 13
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(pop) ; 12
; Joined path conditions
(set-option :timeout 0)
(push) ; 12
; [then-branch: 14 | !(_1_quant_0@118@01 < len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$[Int](snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(Second:(Second:(Second:(Second:($t@113@01)))), First:(Second:(Second:(Second:($t@113@01))))))) | live]
; [else-branch: 14 | _1_quant_0@118@01 < len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$[Int](snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(Second:(Second:(Second:(Second:($t@113@01)))), First:(Second:(Second:(Second:($t@113@01)))))) | live]
(push) ; 13
; [then-branch: 14 | !(_1_quant_0@118@01 < len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$[Int](snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(Second:(Second:(Second:(Second:($t@113@01)))), First:(Second:(Second:(Second:($t@113@01)))))))]
(assert (not
  (<
    _1_quant_0@118@01
    (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@113@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@113@01))))))))))
(pop) ; 13
(push) ; 13
; [else-branch: 14 | _1_quant_0@118@01 < len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$[Int](snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(Second:(Second:(Second:(Second:($t@113@01)))), First:(Second:(Second:(Second:($t@113@01))))))]
(assert (<
  _1_quant_0@118@01
  (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@113@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@113@01)))))))))
; [eval] _0_quant_0 < len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$(snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(old[l3](_5.val_ref))) && (_1_quant_0 < len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$(snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(_4.tuple_1.val_ref)) && read$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$$$int$(snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(old[l3](_5.val_ref)), _0_quant_0) == read$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$$$int$(snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(_4.tuple_1.val_ref), _1_quant_0))
; [eval] _0_quant_0 < len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$(snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(old[l3](_5.val_ref)))
; [eval] len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$(snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(old[l3](_5.val_ref)))
; [eval] snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(old[l3](_5.val_ref))
; [eval] old[l3](_5.val_ref)
(push) ; 14
; [eval] read$()
(push) ; 15
(pop) ; 15
; Joined path conditions
(push) ; 15
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(push) ; 15
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(pop) ; 14
; Joined path conditions
(set-option :timeout 0)
(push) ; 14
; [then-branch: 15 | _0_quant_0@117@01 < len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$[Int](snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32($t@104@01, $t@103@01)) | live]
; [else-branch: 15 | !(_0_quant_0@117@01 < len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$[Int](snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32($t@104@01, $t@103@01))) | live]
(push) ; 15
; [then-branch: 15 | _0_quant_0@117@01 < len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$[Int](snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32($t@104@01, $t@103@01))]
; [eval] _1_quant_0 < len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$(snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(_4.tuple_1.val_ref))
; [eval] len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$(snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(_4.tuple_1.val_ref))
; [eval] snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(_4.tuple_1.val_ref)
(push) ; 16
; [eval] read$()
(push) ; 17
(pop) ; 17
; Joined path conditions
(push) ; 17
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(push) ; 17
(set-option :timeout 10)
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 17
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
(check-sat)
; unsat
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(push) ; 17
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(pop) ; 16
; Joined path conditions
(set-option :timeout 0)
(push) ; 16
; [then-branch: 16 | _1_quant_0@118@01 < len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$[Int](snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(Second:(Second:(Second:(Second:($t@113@01)))), First:(Second:(Second:(Second:($t@113@01)))))) | live]
; [else-branch: 16 | !(_1_quant_0@118@01 < len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$[Int](snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(Second:(Second:(Second:(Second:($t@113@01)))), First:(Second:(Second:(Second:($t@113@01))))))) | live]
(push) ; 17
; [then-branch: 16 | _1_quant_0@118@01 < len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$[Int](snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(Second:(Second:(Second:(Second:($t@113@01)))), First:(Second:(Second:(Second:($t@113@01))))))]
; [eval] read$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$$$int$(snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(old[l3](_5.val_ref)), _0_quant_0) == read$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$$$int$(snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(_4.tuple_1.val_ref), _1_quant_0)
; [eval] read$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$$$int$(snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(old[l3](_5.val_ref)), _0_quant_0)
; [eval] snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(old[l3](_5.val_ref))
; [eval] old[l3](_5.val_ref)
(push) ; 18
; [eval] read$()
(push) ; 19
(pop) ; 19
; Joined path conditions
(push) ; 19
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(push) ; 19
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(pop) ; 18
; Joined path conditions
; [eval] read$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$$$int$(snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(_4.tuple_1.val_ref), _1_quant_0)
; [eval] snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(_4.tuple_1.val_ref)
(set-option :timeout 0)
(push) ; 18
; [eval] read$()
(push) ; 19
(pop) ; 19
; Joined path conditions
(push) ; 19
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(push) ; 19
(set-option :timeout 10)
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 19
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
(check-sat)
; unsat
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(push) ; 19
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(pop) ; 18
; Joined path conditions
(pop) ; 17
(set-option :timeout 0)
(push) ; 17
; [else-branch: 16 | !(_1_quant_0@118@01 < len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$[Int](snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32(Second:(Second:(Second:(Second:($t@113@01)))), First:(Second:(Second:(Second:($t@113@01)))))))]
(assert (not
  (<
    _1_quant_0@118@01
    (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@113@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@113@01))))))))))
(pop) ; 17
(pop) ; 16
; Joined path conditions
; Joined path conditions
(assert (or
  (not
    (<
      _1_quant_0@118@01
      (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@113@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@113@01)))))))))
  (<
    _1_quant_0@118@01
    (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@113@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@113@01))))))))))
(pop) ; 15
(push) ; 15
; [else-branch: 15 | !(_0_quant_0@117@01 < len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$[Int](snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32($t@104@01, $t@103@01)))]
(assert (not
  (<
    _0_quant_0@117@01
    (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 $t@104@01 $t@103@01)))))
(pop) ; 15
(pop) ; 14
; Joined path conditions
(assert (=>
  (<
    _0_quant_0@117@01
    (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 $t@104@01 $t@103@01)))
  (or
    (not
      (<
        _1_quant_0@118@01
        (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@113@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@113@01)))))))))
    (<
      _1_quant_0@118@01
      (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@113@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@113@01)))))))))))
; Joined path conditions
(assert (or
  (not
    (<
      _0_quant_0@117@01
      (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 $t@104@01 $t@103@01))))
  (<
    _0_quant_0@117@01
    (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 $t@104@01 $t@103@01)))))
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(assert (=>
  (<
    _1_quant_0@118@01
    (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@113@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@113@01))))))))
  (and
    (<
      _1_quant_0@118@01
      (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@113@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@113@01))))))))
    (=>
      (<
        _0_quant_0@117@01
        (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 $t@104@01 $t@103@01)))
      (or
        (not
          (<
            _1_quant_0@118@01
            (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@113@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@113@01)))))))))
        (<
          _1_quant_0@118@01
          (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@113@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@113@01))))))))))
    (or
      (not
        (<
          _0_quant_0@117@01
          (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 $t@104@01 $t@103@01))))
      (<
        _0_quant_0@117@01
        (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 $t@104@01 $t@103@01)))))))
(assert (or
  (<
    _1_quant_0@118@01
    (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@113@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@113@01))))))))
  (not
    (<
      _1_quant_0@118@01
      (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@113@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@113@01)))))))))))
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 _1_quant_0@118@01)
  (and
    (=>
      (<
        _1_quant_0@118@01
        (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@113@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@113@01))))))))
      (and
        (<
          _1_quant_0@118@01
          (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@113@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@113@01))))))))
        (=>
          (<
            _0_quant_0@117@01
            (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 $t@104@01 $t@103@01)))
          (or
            (not
              (<
                _1_quant_0@118@01
                (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@113@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@113@01)))))))))
            (<
              _1_quant_0@118@01
              (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@113@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@113@01))))))))))
        (or
          (not
            (<
              _0_quant_0@117@01
              (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 $t@104@01 $t@103@01))))
          (<
            _0_quant_0@117@01
            (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 $t@104@01 $t@103@01))))))
    (or
      (<
        _1_quant_0@118@01
        (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@113@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@113@01))))))))
      (not
        (<
          _1_quant_0@118@01
          (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@113@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@113@01)))))))))))))
(assert (or (<= 0 _1_quant_0@118@01) (not (<= 0 _1_quant_0@118@01))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (<
    _0_quant_0@117@01
    (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 $t@104@01 $t@103@01)))
  (and
    (<
      _0_quant_0@117@01
      (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 $t@104@01 $t@103@01)))
    (=>
      (<= 0 _1_quant_0@118@01)
      (and
        (=>
          (<
            _1_quant_0@118@01
            (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@113@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@113@01))))))))
          (and
            (<
              _1_quant_0@118@01
              (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@113@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@113@01))))))))
            (=>
              (<
                _0_quant_0@117@01
                (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 $t@104@01 $t@103@01)))
              (or
                (not
                  (<
                    _1_quant_0@118@01
                    (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@113@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@113@01)))))))))
                (<
                  _1_quant_0@118@01
                  (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@113@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@113@01))))))))))
            (or
              (not
                (<
                  _0_quant_0@117@01
                  (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 $t@104@01 $t@103@01))))
              (<
                _0_quant_0@117@01
                (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 $t@104@01 $t@103@01))))))
        (or
          (<
            _1_quant_0@118@01
            (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@113@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@113@01))))))))
          (not
            (<
              _1_quant_0@118@01
              (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@113@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@113@01))))))))))))
    (or (<= 0 _1_quant_0@118@01) (not (<= 0 _1_quant_0@118@01))))))
(assert (or
  (<
    _0_quant_0@117@01
    (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 $t@104@01 $t@103@01)))
  (not
    (<
      _0_quant_0@117@01
      (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 $t@104@01 $t@103@01))))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 7 _0_quant_0@117@01)
  (and
    (<= 7 _0_quant_0@117@01)
    (=>
      (<
        _0_quant_0@117@01
        (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 $t@104@01 $t@103@01)))
      (and
        (<
          _0_quant_0@117@01
          (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 $t@104@01 $t@103@01)))
        (=>
          (<= 0 _1_quant_0@118@01)
          (and
            (=>
              (<
                _1_quant_0@118@01
                (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@113@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@113@01))))))))
              (and
                (<
                  _1_quant_0@118@01
                  (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@113@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@113@01))))))))
                (=>
                  (<
                    _0_quant_0@117@01
                    (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 $t@104@01 $t@103@01)))
                  (or
                    (not
                      (<
                        _1_quant_0@118@01
                        (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@113@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@113@01)))))))))
                    (<
                      _1_quant_0@118@01
                      (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@113@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@113@01))))))))))
                (or
                  (not
                    (<
                      _0_quant_0@117@01
                      (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 $t@104@01 $t@103@01))))
                  (<
                    _0_quant_0@117@01
                    (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 $t@104@01 $t@103@01))))))
            (or
              (<
                _1_quant_0@118@01
                (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@113@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@113@01))))))))
              (not
                (<
                  _1_quant_0@118@01
                  (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@113@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@113@01))))))))))))
        (or (<= 0 _1_quant_0@118@01) (not (<= 0 _1_quant_0@118@01)))))
    (or
      (<
        _0_quant_0@117@01
        (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 $t@104@01 $t@103@01)))
      (not
        (<
          _0_quant_0@117@01
          (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 $t@104@01 $t@103@01))))))))
(assert (or (<= 7 _0_quant_0@117@01) (not (<= 7 _0_quant_0@117@01))))
(pop) ; 5
(push) ; 5
; [else-branch: 10 | !(0 <= _1_quant_0@118@01 && 0 <= _0_quant_0@117@01)]
(assert (not (and (<= 0 _1_quant_0@118@01) (<= 0 _0_quant_0@117@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and (<= 0 _1_quant_0@118@01) (<= 0 _0_quant_0@117@01))
  (and
    (<= 0 _1_quant_0@118@01)
    (<= 0 _0_quant_0@117@01)
    (=>
      (<= 7 _0_quant_0@117@01)
      (and
        (<= 7 _0_quant_0@117@01)
        (=>
          (<
            _0_quant_0@117@01
            (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 $t@104@01 $t@103@01)))
          (and
            (<
              _0_quant_0@117@01
              (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 $t@104@01 $t@103@01)))
            (=>
              (<= 0 _1_quant_0@118@01)
              (and
                (=>
                  (<
                    _1_quant_0@118@01
                    (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@113@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@113@01))))))))
                  (and
                    (<
                      _1_quant_0@118@01
                      (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@113@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@113@01))))))))
                    (=>
                      (<
                        _0_quant_0@117@01
                        (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 $t@104@01 $t@103@01)))
                      (or
                        (not
                          (<
                            _1_quant_0@118@01
                            (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@113@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@113@01)))))))))
                        (<
                          _1_quant_0@118@01
                          (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@113@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@113@01))))))))))
                    (or
                      (not
                        (<
                          _0_quant_0@117@01
                          (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 $t@104@01 $t@103@01))))
                      (<
                        _0_quant_0@117@01
                        (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 $t@104@01 $t@103@01))))))
                (or
                  (<
                    _1_quant_0@118@01
                    (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@113@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@113@01))))))))
                  (not
                    (<
                      _1_quant_0@118@01
                      (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@113@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@113@01))))))))))))
            (or (<= 0 _1_quant_0@118@01) (not (<= 0 _1_quant_0@118@01)))))
        (or
          (<
            _0_quant_0@117@01
            (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 $t@104@01 $t@103@01)))
          (not
            (<
              _0_quant_0@117@01
              (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 $t@104@01 $t@103@01)))))))
    (or (<= 7 _0_quant_0@117@01) (not (<= 7 _0_quant_0@117@01))))))
; Joined path conditions
(assert (or
  (not (and (<= 0 _1_quant_0@118@01) (<= 0 _0_quant_0@117@01)))
  (and (<= 0 _1_quant_0@118@01) (<= 0 _0_quant_0@117@01))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((_0_quant_0@117@01 Int) (_1_quant_0@118@01 Int)) (!
  (and
    (or (not (<= 0 _0_quant_0@117@01)) (<= 0 _0_quant_0@117@01))
    (=>
      (and (<= 0 _1_quant_0@118@01) (<= 0 _0_quant_0@117@01))
      (and
        (<= 0 _1_quant_0@118@01)
        (<= 0 _0_quant_0@117@01)
        (=>
          (<= 7 _0_quant_0@117@01)
          (and
            (<= 7 _0_quant_0@117@01)
            (=>
              (<
                _0_quant_0@117@01
                (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 $t@104@01 $t@103@01)))
              (and
                (<
                  _0_quant_0@117@01
                  (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 $t@104@01 $t@103@01)))
                (=>
                  (<= 0 _1_quant_0@118@01)
                  (and
                    (=>
                      (<
                        _1_quant_0@118@01
                        (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@113@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@113@01))))))))
                      (and
                        (<
                          _1_quant_0@118@01
                          (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@113@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@113@01))))))))
                        (=>
                          (<
                            _0_quant_0@117@01
                            (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 $t@104@01 $t@103@01)))
                          (or
                            (not
                              (<
                                _1_quant_0@118@01
                                (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@113@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@113@01)))))))))
                            (<
                              _1_quant_0@118@01
                              (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@113@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@113@01))))))))))
                        (or
                          (not
                            (<
                              _0_quant_0@117@01
                              (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 $t@104@01 $t@103@01))))
                          (<
                            _0_quant_0@117@01
                            (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 $t@104@01 $t@103@01))))))
                    (or
                      (<
                        _1_quant_0@118@01
                        (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@113@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@113@01))))))))
                      (not
                        (<
                          _1_quant_0@118@01
                          (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@113@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@113@01))))))))))))
                (or (<= 0 _1_quant_0@118@01) (not (<= 0 _1_quant_0@118@01)))))
            (or
              (<
                _0_quant_0@117@01
                (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 $t@104@01 $t@103@01)))
              (not
                (<
                  _0_quant_0@117@01
                  (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 $t@104@01 $t@103@01)))))))
        (or (<= 7 _0_quant_0@117@01) (not (<= 7 _0_quant_0@117@01)))))
    (or
      (not (and (<= 0 _1_quant_0@118@01) (<= 0 _0_quant_0@117@01)))
      (and (<= 0 _1_quant_0@118@01) (<= 0 _0_quant_0@117@01))))
  :pattern ((read$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 $t@104@01 $t@103@01) _0_quant_0@117@01) (read$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@113@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@113@01)))))) _1_quant_0@118@01))
  :qid |prog.l614-aux|)))
(assert (forall ((_0_quant_0@117@01 Int) (_1_quant_0@118@01 Int)) (!
  (=>
    (and (<= 0 _1_quant_0@118@01) (<= 0 _0_quant_0@117@01))
    (or
      (not (<= 7 _0_quant_0@117@01))
      (or
        (not
          (<
            _0_quant_0@117@01
            (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 $t@104@01 $t@103@01))))
        (or
          (not (<= 0 _1_quant_0@118@01))
          (or
            (not
              (<
                _1_quant_0@118@01
                (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@113@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@113@01)))))))))
            (and
              (and
                (=
                  (read$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 $t@104@01 $t@103@01) _0_quant_0@117@01)
                  (read$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@113@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@113@01)))))) _1_quant_0@118@01))
                (<
                  _1_quant_0@118@01
                  (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@113@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@113@01)))))))))
              (<
                _0_quant_0@117@01
                (len$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 $t@104@01 $t@103@01)))))))))
  :pattern ((read$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 $t@104@01 $t@103@01) _0_quant_0@117@01) (read$Snap$Slice$i32$__$TY$__Snap$Slice$i32$$int$$$int$<Int> (snap$__$TY$__Snap$Slice$i32$Slice$i32$Snap$Slice$i32 ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@113@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@113@01)))))) _1_quant_0@118@01))
  :qid |prog.l614|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; label l4
; [exec]
; __t1 := true
; [exec]
; _2 := builtin$havoc_ref()
(declare-const ret@119@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_2.val_ref, write)
(declare-const $t@120@01 $Ref)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@113@01))))
  ret@119@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@113@01)) ret@119@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= ret@94@01 ret@119@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= ret@98@01 ret@119@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@119@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _2.val_ref := _4.tuple_0.val_ref
(declare-const val_ref@121@01 $Ref)
(assert (=
  val_ref@121@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second $t@113@01))))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= ret@98@01 ret@119@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= ret@94@01 ret@119@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@113@01)) ret@119@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@113@01))))
  ret@119@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(Slice$i32(_4.tuple_0.val_ref), write - read$())
; [eval] write - read$()
; [eval] read$()
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (or
  (= (- $Perm.Write (read$ $Snap.unit)) $Perm.No)
  (< $Perm.No (- $Perm.Write (read$ $Snap.unit))))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 3
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(assert (not (or
  (=
    (-
      (- $Perm.Write (read$ $Snap.unit))
      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    $Perm.No)
  (<
    (-
      (- $Perm.Write (read$ $Snap.unit))
      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No (- $Perm.Write (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; [exec]
; inhale acc(Slice$i32(_2.val_ref), read$())
; [eval] read$()
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(declare-const $t@122@01 $Snap)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second $t@113@01))))
  val_ref@121@01)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(declare-const $t@123@01 $Snap)
(assert (and
  (=>
    (<
      $Perm.No
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit)))))
    (= $t@123@01 ($Snap.second ($Snap.first ($Snap.second $t@113@01)))))
  (=> (< $Perm.No (read$ $Snap.unit)) (= $t@123@01 $t@122@01))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; label l5
; [exec]
; _3 := builtin$havoc_ref()
(declare-const ret@124@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_3.val_ref, write)
(declare-const $t@125@01 $Ref)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= ret@119@01 ret@124@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= ret@98@01 ret@124@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= ret@94@01 ret@124@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@113@01)) ret@124@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@113@01))))
  ret@124@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@124@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _3.val_ref := _4.tuple_1.val_ref
(declare-const val_ref@126@01 $Ref)
(assert (=
  val_ref@126@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@113@01)))))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@113@01))))
  ret@124@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@113@01)) ret@124@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= ret@94@01 ret@124@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= ret@98@01 ret@124@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= ret@119@01 ret@124@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.01s
; (get-info :all-statistics)
; [exec]
; exhale acc(Slice$i32(_4.tuple_1.val_ref), write - read$())
; [eval] write - read$()
; [eval] read$()
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (or
  (= (- $Perm.Write (read$ $Snap.unit)) $Perm.No)
  (< $Perm.No (- $Perm.Write (read$ $Snap.unit))))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 3
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(assert (not (or
  (=
    (-
      (- $Perm.Write (read$ $Snap.unit))
      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    $Perm.No)
  (<
    (-
      (- $Perm.Write (read$ $Snap.unit))
      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No (- $Perm.Write (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; [exec]
; inhale acc(Slice$i32(_3.val_ref), read$())
; [eval] read$()
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(declare-const $t@127@01 $Snap)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@113@01)))))
  val_ref@126@01)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(declare-const $t@128@01 $Snap)
(assert (and
  (=>
    (<
      $Perm.No
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit)))))
    (=
      $t@128@01
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@113@01))))))
  (=> (< $Perm.No (read$ $Snap.unit)) (= $t@128@01 $t@127@01))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; label l6
; [exec]
; _12 := builtin$havoc_ref()
(declare-const ret@129@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_12.val_ref, write)
(declare-const $t@130@01 $Ref)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= ret@124@01 ret@129@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@113@01))))
  ret@129@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@113@01)) ret@129@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= ret@94@01 ret@129@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= ret@98@01 ret@129@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= ret@119@01 ret@129@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.01s
; (get-info :all-statistics)
(assert (not (= ret@129@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _12.val_ref := _2.val_ref
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= ret@119@01 ret@129@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= ret@98@01 ret@129@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= ret@94@01 ret@129@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@113@01)) ret@129@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@113@01))))
  ret@129@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= ret@124@01 ret@129@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; [exec]
; inhale acc(Slice$i32(_12.val_ref), read$())
; [eval] read$()
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(declare-const $t@131@01 $Snap)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second $t@113@01))))
  val_ref@121@01)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(declare-const $t@132@01 $Snap)
(assert (and
  (=>
    (<
      $Perm.No
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit)))
    (= $t@132@01 $t@123@01))
  (=> (< $Perm.No (read$ $Snap.unit)) (= $t@132@01 $t@131@01))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; label l7
; [exec]
; label l8
; [exec]
; _11 := builtin$havoc_int()
(declare-const ret@133@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _11 := Slice$len__$TY$__i32$Slice$i32$$int$(_12.val_ref)
; [eval] Slice$len__$TY$__i32$Slice$i32$$int$(_12.val_ref)
(set-option :timeout 0)
(push) ; 3
; [eval] read$()
(push) ; 4
(pop) ; 4
; Joined path conditions
(push) ; 4
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second $t@113@01))))
  val_ref@121@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  (-
    (+
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit))
      (read$ $Snap.unit))
    ($Perm.min
      (+
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit))
      (read$ $Snap.unit)))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (<=
  $Perm.No
  (-
    (+
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit))
      (read$ $Snap.unit))
    ($Perm.min
      (+
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit))
      (read$ $Snap.unit)))))
(set-option :timeout 0)
(push) ; 4
(assert (not (or
  (=
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    $Perm.No)
  (<
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (Slice$len__$TY$__i32$Slice$i32$$int$%precondition $t@132@01 val_ref@121@01))
(pop) ; 3
; Joined path conditions
(assert (and
  (<=
    $Perm.No
    (-
      (+
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        (read$ $Snap.unit))))
  (Slice$len__$TY$__i32$Slice$i32$$int$%precondition $t@132@01 val_ref@121@01)))
(declare-const _11@134@01 Int)
(assert (= _11@134@01 (Slice$len__$TY$__i32$Slice$i32$$int$ $t@132@01 val_ref@121@01)))
; [eval] __t1 && __t1
(set-option :timeout 0)
(push) ; 3
; [then-branch: 17 | True | live]
; [else-branch: 17 | False | live]
(push) ; 4
; [then-branch: 17 | True]
(pop) ; 4
(push) ; 4
; [else-branch: 17 | False]
(assert false)
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(push) ; 3
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
; 0.01s
; (get-info :all-statistics)
; [then-branch: 18 | True | live]
; [else-branch: 18 | False | dead]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 18 | True]
; [exec]
; exhale acc(Slice$i32(old[l7](_12.val_ref)), read$())
; [eval] read$()
(push) ; 4
(pop) ; 4
; Joined path conditions
; [eval] old[l7](_12.val_ref)
(push) ; 4
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second $t@113@01))))
  val_ref@121@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  (-
    (+
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit))
      (read$ $Snap.unit))
    ($Perm.min
      (+
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit))
      (read$ $Snap.unit)))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(assert (not (or
  (=
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    $Perm.No)
  (<
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t2 := true
; [exec]
; _10 := builtin$havoc_ref()
(declare-const ret@135@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_10.val_bool, write)
(declare-const $t@136@01 Bool)
(assert (not (= ret@135@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _10.val_bool := _11 == 7
; [eval] _11 == 7
(declare-const val_bool@137@01 Bool)
(assert (= val_bool@137@01 (= _11@134@01 7)))
; [exec]
; _9 := builtin$havoc_ref()
(declare-const ret@138@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_9.val_bool, write)
(declare-const $t@139@01 Bool)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@135@01 ret@138@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.01s
; (get-info :all-statistics)
(assert (not (= ret@138@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _9.val_bool := !_10.val_bool
; [eval] !_10.val_bool
(declare-const val_bool@140@01 Bool)
(assert (= val_bool@140@01 (not val_bool@137@01)))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@135@01 ret@138@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t22 := _9.val_bool
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not val_bool@140@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [then-branch: 19 | val_bool@140@01 | dead]
; [else-branch: 19 | !(val_bool@140@01) | live]
(set-option :timeout 0)
(push) ; 4
; [else-branch: 19 | !(val_bool@140@01)]
(assert (not val_bool@140@01))
(pop) ; 4
; [eval] !__t22
(push) ; 4
(set-option :timeout 10)
(assert (not val_bool@140@01))
(check-sat)
; unknown
(pop) ; 4
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not val_bool@140@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [then-branch: 20 | !(val_bool@140@01) | live]
; [else-branch: 20 | val_bool@140@01 | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 20 | !(val_bool@140@01)]
(assert (not val_bool@140@01))
; [exec]
; label return
; [exec]
; __t4 := true
; [exec]
; _18 := builtin$havoc_ref()
(declare-const ret@141@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_18.val_ref, write)
(declare-const $t@142@01 $Ref)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@129@01 ret@141@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@119@01 ret@141@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@98@01 ret@141@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@94@01 ret@141@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@113@01)) ret@141@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@113@01))))
  ret@141@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@124@01 ret@141@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@141@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _18.val_ref := _3.val_ref
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@124@01 ret@141@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@113@01))))
  ret@141@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@113@01)) ret@141@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@94@01 ret@141@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@98@01 ret@141@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@119@01 ret@141@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@129@01 ret@141@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [exec]
; inhale acc(Slice$i32(_18.val_ref), read$())
; [eval] read$()
(set-option :timeout 0)
(push) ; 5
(pop) ; 5
; Joined path conditions
(push) ; 5
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(declare-const $t@143@01 $Snap)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second $t@113@01))))
  val_ref@126@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@113@01)))))
  val_ref@126@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(declare-const $t@144@01 $Snap)
(assert (and
  (=>
    (<
      $Perm.No
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit)))
    (= $t@144@01 $t@128@01))
  (=> (< $Perm.No (read$ $Snap.unit)) (= $t@144@01 $t@143@01))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; label l12
; [exec]
; label l13
; [exec]
; _17 := builtin$havoc_int()
(declare-const ret@145@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _17 := Slice$len__$TY$__i32$Slice$i32$$int$(_18.val_ref)
; [eval] Slice$len__$TY$__i32$Slice$i32$$int$(_18.val_ref)
(set-option :timeout 0)
(push) ; 5
; [eval] read$()
(push) ; 6
(pop) ; 6
; Joined path conditions
(push) ; 6
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@113@01)))))
  val_ref@126@01)))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  (-
    (+
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit))
      (read$ $Snap.unit))
    ($Perm.min
      (+
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit))
      (read$ $Snap.unit)))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(assert (not (or
  (=
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    $Perm.No)
  (<
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(push) ; 6
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (Slice$len__$TY$__i32$Slice$i32$$int$%precondition $t@144@01 val_ref@126@01))
(pop) ; 5
; Joined path conditions
(assert (Slice$len__$TY$__i32$Slice$i32$$int$%precondition $t@144@01 val_ref@126@01))
(declare-const _17@146@01 Int)
(assert (= _17@146@01 (Slice$len__$TY$__i32$Slice$i32$$int$ $t@144@01 val_ref@126@01)))
; [eval] __t4 && __t4
(set-option :timeout 0)
(push) ; 5
; [then-branch: 21 | True | live]
; [else-branch: 21 | False | live]
(push) ; 6
; [then-branch: 21 | True]
(pop) ; 6
(push) ; 6
; [else-branch: 21 | False]
(assert false)
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [then-branch: 22 | True | live]
; [else-branch: 22 | False | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 22 | True]
; [exec]
; exhale acc(Slice$i32(old[l12](_18.val_ref)), read$())
; [eval] read$()
(push) ; 6
(pop) ; 6
; Joined path conditions
; [eval] old[l12](_18.val_ref)
(push) ; 6
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@113@01)))))
  val_ref@126@01)))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  (-
    (+
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit))
      (read$ $Snap.unit))
    ($Perm.min
      (+
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit))
      (read$ $Snap.unit)))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(assert (not (or
  (=
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    $Perm.No)
  (<
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(push) ; 6
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t5 := true
; [exec]
; _16 := builtin$havoc_ref()
(declare-const ret@147@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_16.val_bool, write)
(declare-const $t@148@01 Bool)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@138@01 ret@147@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@135@01 ret@147@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@147@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _16.val_bool := _17 == 6
; [eval] _17 == 6
(declare-const val_bool@149@01 Bool)
(assert (= val_bool@149@01 (= _17@146@01 6)))
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@135@01 ret@147@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@138@01 ret@147@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [exec]
; _15 := builtin$havoc_ref()
(declare-const ret@150@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_15.val_bool, write)
(declare-const $t@151@01 Bool)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@138@01 ret@150@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@135@01 ret@150@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@147@01 ret@150@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@150@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _15.val_bool := !_16.val_bool
; [eval] !_16.val_bool
(declare-const val_bool@152@01 Bool)
(assert (= val_bool@152@01 (not val_bool@149@01)))
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@147@01 ret@150@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@135@01 ret@150@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@138@01 ret@150@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t23 := _15.val_bool
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not val_bool@152@01)))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [then-branch: 23 | val_bool@152@01 | dead]
; [else-branch: 23 | !(val_bool@152@01) | live]
(set-option :timeout 0)
(push) ; 6
; [else-branch: 23 | !(val_bool@152@01)]
(assert (not val_bool@152@01))
(pop) ; 6
; [eval] !__t23
(push) ; 6
(set-option :timeout 10)
(assert (not val_bool@152@01))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not val_bool@152@01)))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [then-branch: 24 | !(val_bool@152@01) | live]
; [else-branch: 24 | val_bool@152@01 | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 24 | !(val_bool@152@01)]
(assert (not val_bool@152@01))
; [exec]
; label bb0
; [exec]
; __t7 := true
; [exec]
; _24 := builtin$havoc_int()
(declare-const ret@153@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _24 := 2
; [exec]
; assert acc(Array$13$i32(_1), read$())
; [eval] read$()
(set-option :timeout 0)
(push) ; 7
(pop) ; 7
; Joined path conditions
(push) ; 7
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  (-
    (+
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit))
      (read$ $Snap.unit))
    ($Perm.min
      (+
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit))
      (read$ $Snap.unit)))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(assert (not (or
  (=
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    $Perm.No)
  (<
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [exec]
; _25 := builtin$havoc_int()
(declare-const ret@154@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _25 := 13
; [exec]
; _26 := builtin$havoc_ref()
(declare-const ret@155@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; inhale acc(_26.val_bool, write)
(declare-const $t@156@01 Bool)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@138@01 ret@155@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@135@01 ret@155@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@147@01 ret@155@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@150@01 ret@155@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(assert (not (= ret@155@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _26.val_bool := _24 < _25
; [eval] _24 < _25
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@150@01 ret@155@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@147@01 ret@155@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@135@01 ret@155@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@138@01 ret@155@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t24 := _26.val_bool
; [exec]
; assert __t24
; [exec]
; __t8 := true
; [exec]
; __t25 := builtin$havoc_ref()
(declare-const ret@157@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(i32(__t25), write)
(declare-const $t@158@01 Int)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert acc(Array$13$i32(_1), read$())
; [eval] read$()
(set-option :timeout 0)
(push) ; 7
(pop) ; 7
; Joined path conditions
(push) ; 7
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  (-
    (+
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit))
      (read$ $Snap.unit))
    ($Perm.min
      (+
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit))
      (read$ $Snap.unit)))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(assert (not (or
  (=
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    $Perm.No)
  (<
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [exec]
; inhale lookup_pure__$TY$__Array$13$i32$i32$Array$13$i32$$int$$$int$(_1, _24) ==
;   (unfolding acc(i32(__t25), write) in __t25.val_int)
(declare-const $t@159@01 $Snap)
(assert (= $t@159@01 $Snap.unit))
; [eval] lookup_pure__$TY$__Array$13$i32$i32$Array$13$i32$$int$$$int$(_1, _24) == (unfolding acc(i32(__t25), write) in __t25.val_int)
; [eval] lookup_pure__$TY$__Array$13$i32$i32$Array$13$i32$$int$$$int$(_1, _24)
(set-option :timeout 0)
(push) ; 7
; [eval] read$()
(push) ; 8
(pop) ; 8
; Joined path conditions
(push) ; 8
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
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
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit))
      (read$ $Snap.unit))
    ($Perm.min
      (+
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit))
      (read$ $Snap.unit)))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(assert (not (or
  (=
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    $Perm.No)
  (<
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(push) ; 8
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [eval] 0 <= idx
; [eval] idx < 13
(assert (lookup_pure__$TY$__Array$13$i32$i32$Array$13$i32$$int$$$int$%precondition ($Snap.combine
  $t@101@01
  ($Snap.combine $Snap.unit $Snap.unit)) ret@90@01 2))
(pop) ; 7
; Joined path conditions
(assert (lookup_pure__$TY$__Array$13$i32$i32$Array$13$i32$$int$$$int$%precondition ($Snap.combine
  $t@101@01
  ($Snap.combine $Snap.unit $Snap.unit)) ret@90@01 2))
; [eval] (unfolding acc(i32(__t25), write) in __t25.val_int)
(set-option :timeout 0)
(push) ; 7
(assert (i32%trigger ($SortWrappers.IntTo$Snap $t@158@01) ret@157@01))
(assert (not (= ret@157@01 $Ref.null)))
(pop) ; 7
; Joined path conditions
(assert (and
  (i32%trigger ($SortWrappers.IntTo$Snap $t@158@01) ret@157@01)
  (not (= ret@157@01 $Ref.null))))
(assert (=
  (lookup_pure__$TY$__Array$13$i32$i32$Array$13$i32$$int$$$int$ ($Snap.combine
    $t@101@01
    ($Snap.combine $Snap.unit $Snap.unit)) ret@90@01 2)
  $t@158@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _23 := builtin$havoc_int()
(declare-const ret@160@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; unfold acc(i32(__t25), write)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
; [exec]
; _23 := __t25.val_int
; [exec]
; label l17
; [exec]
; _28 := builtin$havoc_int()
(declare-const ret@161@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _28 := 2
; [exec]
; assert acc(Slice$i32(_2.val_ref), read$())
; [eval] read$()
(set-option :timeout 0)
(push) ; 7
(pop) ; 7
; Joined path conditions
(push) ; 7
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second $t@113@01))))
  val_ref@121@01)))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  (-
    (-
      (+
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    ($Perm.min
      (-
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))
      (read$ $Snap.unit)))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (<=
  $Perm.No
  (-
    (-
      (+
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    ($Perm.min
      (-
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))
      (read$ $Snap.unit)))))
(set-option :timeout 0)
(push) ; 7
(assert (not (or
  (=
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (-
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit)))
    $Perm.No)
  (<
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (-
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit)))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [exec]
; _29 := builtin$havoc_int()
(declare-const ret@162@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _29 := Slice$len__$TY$__i32$Slice$i32$$int$(_2.val_ref)
; [eval] Slice$len__$TY$__i32$Slice$i32$$int$(_2.val_ref)
(set-option :timeout 0)
(push) ; 7
; [eval] read$()
(push) ; 8
(pop) ; 8
; Joined path conditions
(push) ; 8
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second $t@113@01))))
  val_ref@121@01)))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  (-
    (-
      (+
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    ($Perm.min
      (-
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))
      (read$ $Snap.unit)))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(assert (not (or
  (=
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (-
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit)))
    $Perm.No)
  (<
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (-
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit)))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(push) ; 8
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(pop) ; 7
; Joined path conditions
(declare-const _29@163@01 Int)
(assert (= _29@163@01 (Slice$len__$TY$__i32$Slice$i32$$int$ $t@132@01 val_ref@121@01)))
; [exec]
; _30 := builtin$havoc_ref()
(declare-const ret@164@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_30.val_bool, write)
(declare-const $t@165@01 Bool)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@138@01 ret@164@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@135@01 ret@164@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@147@01 ret@164@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@150@01 ret@164@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@155@01 ret@164@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@164@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _30.val_bool := _28 < _29
; [eval] _28 < _29
(declare-const val_bool@166@01 Bool)
(assert (= val_bool@166@01 (< 2 _29@163@01)))
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@155@01 ret@164@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@150@01 ret@164@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@147@01 ret@164@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@135@01 ret@164@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@138@01 ret@164@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
; [exec]
; __t26 := _30.val_bool
; [exec]
; assert __t26
(set-option :timeout 0)
(push) ; 7
(assert (not val_bool@166@01))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert val_bool@166@01)
; [exec]
; __t9 := true
; [exec]
; __t27 := builtin$havoc_ref()
(declare-const ret@167@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(i32(__t27), write)
(declare-const $t@168@01 Int)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert acc(Slice$i32(_2.val_ref), read$())
; [eval] read$()
(set-option :timeout 0)
(push) ; 7
(pop) ; 7
; Joined path conditions
(push) ; 7
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@113@01)))))
  val_ref@121@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@103@01 val_ref@121@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second $t@113@01))))
  val_ref@121@01)))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  (-
    (-
      (+
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    ($Perm.min
      (-
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))
      (read$ $Snap.unit)))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(assert (not (or
  (=
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (-
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit)))
    $Perm.No)
  (<
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (-
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit)))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [exec]
; inhale lookup_pure__$TY$__Slice$i32$i32$Slice$i32$$int$$$int$(_2.val_ref, _28) ==
;   (unfolding acc(i32(__t27), write) in __t27.val_int)
(declare-const $t@169@01 $Snap)
(assert (= $t@169@01 $Snap.unit))
; [eval] lookup_pure__$TY$__Slice$i32$i32$Slice$i32$$int$$$int$(_2.val_ref, _28) == (unfolding acc(i32(__t27), write) in __t27.val_int)
; [eval] lookup_pure__$TY$__Slice$i32$i32$Slice$i32$$int$$$int$(_2.val_ref, _28)
(set-option :timeout 0)
(push) ; 7
; [eval] read$()
(push) ; 8
(pop) ; 8
; Joined path conditions
(push) ; 8
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@113@01)))))
  val_ref@121@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= $t@103@01 val_ref@121@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second $t@113@01))))
  val_ref@121@01)))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  (-
    (-
      (+
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    ($Perm.min
      (-
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))
      (read$ $Snap.unit)))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 8
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(assert (not (or
  (=
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (-
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit)))
    $Perm.No)
  (<
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (-
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit)))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(push) ; 8
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [eval] 0 <= idx
; [eval] idx < Slice$len__$TY$__i32$Slice$i32$$int$(self)
; [eval] Slice$len__$TY$__i32$Slice$i32$$int$(self)
(set-option :timeout 0)
(push) ; 8
; [eval] read$()
(push) ; 9
(pop) ; 9
; Joined path conditions
(push) ; 9
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@113@01)))))
  val_ref@121@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@103@01 val_ref@121@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second $t@113@01))))
  val_ref@121@01)))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  (-
    (-
      (+
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    ($Perm.min
      (-
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))
      (read$ $Snap.unit)))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(assert (not (or
  (=
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (-
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit)))
    $Perm.No)
  (<
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (-
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit)))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(push) ; 9
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(pop) ; 8
; Joined path conditions
(set-option :timeout 0)
(push) ; 8
(assert (not (< 2 (Slice$len__$TY$__i32$Slice$i32$$int$ $t@132@01 val_ref@121@01))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (< 2 (Slice$len__$TY$__i32$Slice$i32$$int$ $t@132@01 val_ref@121@01)))
(assert (lookup_pure__$TY$__Slice$i32$i32$Slice$i32$$int$$$int$%precondition ($Snap.combine
  $t@132@01
  ($Snap.combine $Snap.unit $Snap.unit)) val_ref@121@01 2))
(pop) ; 7
; Joined path conditions
(assert (and
  (< 2 (Slice$len__$TY$__i32$Slice$i32$$int$ $t@132@01 val_ref@121@01))
  (lookup_pure__$TY$__Slice$i32$i32$Slice$i32$$int$$$int$%precondition ($Snap.combine
    $t@132@01
    ($Snap.combine $Snap.unit $Snap.unit)) val_ref@121@01 2)))
; [eval] (unfolding acc(i32(__t27), write) in __t27.val_int)
(push) ; 7
(assert (i32%trigger ($SortWrappers.IntTo$Snap $t@168@01) ret@167@01))
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@157@01 ret@167@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@167@01 $Ref.null)))
(pop) ; 7
; Joined path conditions
(assert (and
  (i32%trigger ($SortWrappers.IntTo$Snap $t@168@01) ret@167@01)
  (not (= ret@167@01 $Ref.null))))
(assert (=
  (lookup_pure__$TY$__Slice$i32$i32$Slice$i32$$int$$$int$ ($Snap.combine
    $t@132@01
    ($Snap.combine $Snap.unit $Snap.unit)) val_ref@121@01 2)
  $t@168@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _27 := builtin$havoc_int()
(declare-const ret@170@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; unfold acc(i32(__t27), write)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@157@01 ret@167@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
; [exec]
; _27 := __t27.val_int
; [exec]
; label l18
; [exec]
; _22 := builtin$havoc_ref()
(declare-const ret@171@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_22.val_bool, write)
(declare-const $t@172@01 Bool)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@138@01 ret@171@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@135@01 ret@171@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@147@01 ret@171@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@150@01 ret@171@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@155@01 ret@171@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@164@01 ret@171@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@171@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _22.val_bool := _23 == _27
; [eval] _23 == _27
(declare-const val_bool@173@01 Bool)
(assert (= val_bool@173@01 (= $t@158@01 $t@168@01)))
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@164@01 ret@171@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@155@01 ret@171@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@150@01 ret@171@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@147@01 ret@171@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@135@01 ret@171@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@138@01 ret@171@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [exec]
; _21 := builtin$havoc_ref()
(declare-const ret@174@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_21.val_bool, write)
(declare-const $t@175@01 Bool)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@138@01 ret@174@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@135@01 ret@174@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@147@01 ret@174@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@150@01 ret@174@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@155@01 ret@174@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@164@01 ret@174@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@171@01 ret@174@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@174@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _21.val_bool := !_22.val_bool
; [eval] !_22.val_bool
(declare-const val_bool@176@01 Bool)
(assert (= val_bool@176@01 (not val_bool@173@01)))
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@171@01 ret@174@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@164@01 ret@174@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@155@01 ret@174@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@150@01 ret@174@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@147@01 ret@174@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@135@01 ret@174@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@138@01 ret@174@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t28 := _21.val_bool
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not val_bool@176@01)))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [then-branch: 25 | val_bool@176@01 | dead]
; [else-branch: 25 | !(val_bool@176@01) | live]
(set-option :timeout 0)
(push) ; 7
; [else-branch: 25 | !(val_bool@176@01)]
(assert (not val_bool@176@01))
(pop) ; 7
; [eval] !__t28
(push) ; 7
(set-option :timeout 10)
(assert (not val_bool@176@01))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not val_bool@176@01)))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [then-branch: 26 | !(val_bool@176@01) | live]
; [else-branch: 26 | val_bool@176@01 | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 26 | !(val_bool@176@01)]
(assert (not val_bool@176@01))
; [exec]
; label bb1
; [exec]
; __t11 := true
; [exec]
; _36 := builtin$havoc_int()
(declare-const ret@177@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _36 := 9
; [exec]
; assert acc(Array$13$i32(_1), read$())
; [eval] read$()
(set-option :timeout 0)
(push) ; 8
(pop) ; 8
; Joined path conditions
(push) ; 8
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
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
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit))
      (read$ $Snap.unit))
    ($Perm.min
      (+
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit))
      (read$ $Snap.unit)))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(assert (not (or
  (=
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    $Perm.No)
  (<
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(push) ; 8
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [exec]
; _37 := builtin$havoc_int()
(declare-const ret@178@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _37 := 13
; [exec]
; _38 := builtin$havoc_ref()
(declare-const ret@179@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; inhale acc(_38.val_bool, write)
(declare-const $t@180@01 Bool)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@138@01 ret@179@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@135@01 ret@179@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@147@01 ret@179@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@150@01 ret@179@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@155@01 ret@179@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@164@01 ret@179@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@171@01 ret@179@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@174@01 ret@179@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.01s
; (get-info :all-statistics)
(assert (not (= ret@179@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _38.val_bool := _36 < _37
; [eval] _36 < _37
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@174@01 ret@179@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@171@01 ret@179@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@164@01 ret@179@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@155@01 ret@179@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@150@01 ret@179@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@147@01 ret@179@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@135@01 ret@179@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@138@01 ret@179@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t29 := _38.val_bool
; [exec]
; assert __t29
; [exec]
; __t12 := true
; [exec]
; __t30 := builtin$havoc_ref()
(declare-const ret@181@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(i32(__t30), write)
(declare-const $t@182@01 Int)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert acc(Array$13$i32(_1), read$())
; [eval] read$()
(set-option :timeout 0)
(push) ; 8
(pop) ; 8
; Joined path conditions
(push) ; 8
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
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
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit))
      (read$ $Snap.unit))
    ($Perm.min
      (+
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit))
      (read$ $Snap.unit)))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(assert (not (or
  (=
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    $Perm.No)
  (<
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(push) ; 8
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [exec]
; inhale lookup_pure__$TY$__Array$13$i32$i32$Array$13$i32$$int$$$int$(_1, _36) ==
;   (unfolding acc(i32(__t30), write) in __t30.val_int)
(declare-const $t@183@01 $Snap)
(assert (= $t@183@01 $Snap.unit))
; [eval] lookup_pure__$TY$__Array$13$i32$i32$Array$13$i32$$int$$$int$(_1, _36) == (unfolding acc(i32(__t30), write) in __t30.val_int)
; [eval] lookup_pure__$TY$__Array$13$i32$i32$Array$13$i32$$int$$$int$(_1, _36)
(set-option :timeout 0)
(push) ; 8
; [eval] read$()
(push) ; 9
(pop) ; 9
; Joined path conditions
(push) ; 9
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
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
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit))
      (read$ $Snap.unit))
    ($Perm.min
      (+
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit))
      (read$ $Snap.unit)))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(assert (not (or
  (=
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    $Perm.No)
  (<
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(push) ; 9
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [eval] 0 <= idx
; [eval] idx < 13
(assert (lookup_pure__$TY$__Array$13$i32$i32$Array$13$i32$$int$$$int$%precondition ($Snap.combine
  $t@101@01
  ($Snap.combine $Snap.unit $Snap.unit)) ret@90@01 9))
(pop) ; 8
; Joined path conditions
(assert (lookup_pure__$TY$__Array$13$i32$i32$Array$13$i32$$int$$$int$%precondition ($Snap.combine
  $t@101@01
  ($Snap.combine $Snap.unit $Snap.unit)) ret@90@01 9))
; [eval] (unfolding acc(i32(__t30), write) in __t30.val_int)
(set-option :timeout 0)
(push) ; 8
(assert (i32%trigger ($SortWrappers.IntTo$Snap $t@182@01) ret@181@01))
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@167@01 ret@181@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@157@01 ret@181@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@181@01 $Ref.null)))
(pop) ; 8
; Joined path conditions
(assert (and
  (i32%trigger ($SortWrappers.IntTo$Snap $t@182@01) ret@181@01)
  (not (= ret@181@01 $Ref.null))))
(assert (=
  (lookup_pure__$TY$__Array$13$i32$i32$Array$13$i32$$int$$$int$ ($Snap.combine
    $t@101@01
    ($Snap.combine $Snap.unit $Snap.unit)) ret@90@01 9)
  $t@182@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _35 := builtin$havoc_int()
(declare-const ret@184@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; unfold acc(i32(__t30), write)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@167@01 ret@181@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@157@01 ret@181@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.01s
; (get-info :all-statistics)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
; [exec]
; _35 := __t30.val_int
; [exec]
; label l21
; [exec]
; _40 := builtin$havoc_int()
(declare-const ret@185@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _40 := 2
; [exec]
; assert acc(Slice$i32(_3.val_ref), read$())
; [eval] read$()
(set-option :timeout 0)
(push) ; 8
(pop) ; 8
; Joined path conditions
(push) ; 8
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second $t@113@01))))
  val_ref@126@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= $t@103@01 val_ref@126@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@113@01)))))
  val_ref@126@01)))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  (-
    (-
      (+
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    ($Perm.min
      (-
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))
      (read$ $Snap.unit)))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(assert (not (or
  (=
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (-
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit)))
    $Perm.No)
  (<
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (-
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit)))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(push) ; 8
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [exec]
; _41 := builtin$havoc_int()
(declare-const ret@186@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _41 := Slice$len__$TY$__i32$Slice$i32$$int$(_3.val_ref)
; [eval] Slice$len__$TY$__i32$Slice$i32$$int$(_3.val_ref)
(set-option :timeout 0)
(push) ; 8
; [eval] read$()
(push) ; 9
(pop) ; 9
; Joined path conditions
(push) ; 9
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second $t@113@01))))
  val_ref@126@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@103@01 val_ref@126@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@113@01)))))
  val_ref@126@01)))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  (-
    (-
      (+
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    ($Perm.min
      (-
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))
      (read$ $Snap.unit)))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(assert (not (or
  (=
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (-
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit)))
    $Perm.No)
  (<
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (-
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit)))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(push) ; 9
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(pop) ; 8
; Joined path conditions
(declare-const _41@187@01 Int)
(assert (= _41@187@01 (Slice$len__$TY$__i32$Slice$i32$$int$ $t@144@01 val_ref@126@01)))
; [exec]
; _42 := builtin$havoc_ref()
(declare-const ret@188@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_42.val_bool, write)
(declare-const $t@189@01 Bool)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@138@01 ret@188@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@135@01 ret@188@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@147@01 ret@188@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@150@01 ret@188@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@155@01 ret@188@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@164@01 ret@188@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@171@01 ret@188@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@174@01 ret@188@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@179@01 ret@188@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.01s
; (get-info :all-statistics)
(assert (not (= ret@188@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _42.val_bool := _40 < _41
; [eval] _40 < _41
(declare-const val_bool@190@01 Bool)
(assert (= val_bool@190@01 (< 2 _41@187@01)))
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@179@01 ret@188@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@174@01 ret@188@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@171@01 ret@188@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@164@01 ret@188@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@155@01 ret@188@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@150@01 ret@188@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@147@01 ret@188@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@135@01 ret@188@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@138@01 ret@188@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t31 := _42.val_bool
; [exec]
; assert __t31
(set-option :timeout 0)
(push) ; 8
(assert (not val_bool@190@01))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert val_bool@190@01)
; [exec]
; __t13 := true
; [exec]
; __t32 := builtin$havoc_ref()
(declare-const ret@191@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(i32(__t32), write)
(declare-const $t@192@01 Int)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert acc(Slice$i32(_3.val_ref), read$())
; [eval] read$()
(set-option :timeout 0)
(push) ; 8
(pop) ; 8
; Joined path conditions
(push) ; 8
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@113@01)))))
  val_ref@126@01)))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  (-
    (-
      (+
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    ($Perm.min
      (-
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))
      (read$ $Snap.unit)))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(assert (not (or
  (=
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (-
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit)))
    $Perm.No)
  (<
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (-
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit)))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(push) ; 8
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [exec]
; inhale lookup_pure__$TY$__Slice$i32$i32$Slice$i32$$int$$$int$(_3.val_ref, _40) ==
;   (unfolding acc(i32(__t32), write) in __t32.val_int)
(declare-const $t@193@01 $Snap)
(assert (= $t@193@01 $Snap.unit))
; [eval] lookup_pure__$TY$__Slice$i32$i32$Slice$i32$$int$$$int$(_3.val_ref, _40) == (unfolding acc(i32(__t32), write) in __t32.val_int)
; [eval] lookup_pure__$TY$__Slice$i32$i32$Slice$i32$$int$$$int$(_3.val_ref, _40)
(set-option :timeout 0)
(push) ; 8
; [eval] read$()
(push) ; 9
(pop) ; 9
; Joined path conditions
(push) ; 9
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@113@01)))))
  val_ref@126@01)))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  (-
    (-
      (+
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    ($Perm.min
      (-
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))
      (read$ $Snap.unit)))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 9
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(assert (not (or
  (=
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (-
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit)))
    $Perm.No)
  (<
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (-
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit)))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(push) ; 9
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [eval] 0 <= idx
; [eval] idx < Slice$len__$TY$__i32$Slice$i32$$int$(self)
; [eval] Slice$len__$TY$__i32$Slice$i32$$int$(self)
(set-option :timeout 0)
(push) ; 9
; [eval] read$()
(push) ; 10
(pop) ; 10
; Joined path conditions
(push) ; 10
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@113@01)))))
  val_ref@126@01)))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  (-
    (-
      (+
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    ($Perm.min
      (-
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))
      (read$ $Snap.unit)))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 10
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(assert (not (or
  (=
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (-
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit)))
    $Perm.No)
  (<
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (-
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit)))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(push) ; 10
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(pop) ; 9
; Joined path conditions
(set-option :timeout 0)
(push) ; 9
(assert (not (< 2 (Slice$len__$TY$__i32$Slice$i32$$int$ $t@144@01 val_ref@126@01))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (< 2 (Slice$len__$TY$__i32$Slice$i32$$int$ $t@144@01 val_ref@126@01)))
(assert (lookup_pure__$TY$__Slice$i32$i32$Slice$i32$$int$$$int$%precondition ($Snap.combine
  $t@144@01
  ($Snap.combine $Snap.unit $Snap.unit)) val_ref@126@01 2))
(pop) ; 8
; Joined path conditions
(assert (and
  (< 2 (Slice$len__$TY$__i32$Slice$i32$$int$ $t@144@01 val_ref@126@01))
  (lookup_pure__$TY$__Slice$i32$i32$Slice$i32$$int$$$int$%precondition ($Snap.combine
    $t@144@01
    ($Snap.combine $Snap.unit $Snap.unit)) val_ref@126@01 2)))
; [eval] (unfolding acc(i32(__t32), write) in __t32.val_int)
(push) ; 8
(assert (i32%trigger ($SortWrappers.IntTo$Snap $t@192@01) ret@191@01))
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@181@01 ret@191@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@167@01 ret@191@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@157@01 ret@191@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@191@01 $Ref.null)))
(pop) ; 8
; Joined path conditions
(assert (and
  (i32%trigger ($SortWrappers.IntTo$Snap $t@192@01) ret@191@01)
  (not (= ret@191@01 $Ref.null))))
(assert (=
  (lookup_pure__$TY$__Slice$i32$i32$Slice$i32$$int$$$int$ ($Snap.combine
    $t@144@01
    ($Snap.combine $Snap.unit $Snap.unit)) val_ref@126@01 2)
  $t@192@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _39 := builtin$havoc_int()
(declare-const ret@194@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; unfold acc(i32(__t32), write)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@181@01 ret@191@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@167@01 ret@191@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@157@01 ret@191@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.01s
; (get-info :all-statistics)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
; [exec]
; _39 := __t32.val_int
; [exec]
; label l22
; [exec]
; _34 := builtin$havoc_ref()
(declare-const ret@195@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_34.val_bool, write)
(declare-const $t@196@01 Bool)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@138@01 ret@195@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@135@01 ret@195@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@147@01 ret@195@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@150@01 ret@195@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@155@01 ret@195@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@164@01 ret@195@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@171@01 ret@195@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@174@01 ret@195@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@179@01 ret@195@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@188@01 ret@195@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@195@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _34.val_bool := _35 == _39
; [eval] _35 == _39
(declare-const val_bool@197@01 Bool)
(assert (= val_bool@197@01 (= $t@182@01 $t@192@01)))
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@188@01 ret@195@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@179@01 ret@195@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@174@01 ret@195@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@171@01 ret@195@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@164@01 ret@195@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@155@01 ret@195@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@150@01 ret@195@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@147@01 ret@195@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@135@01 ret@195@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@138@01 ret@195@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [exec]
; _33 := builtin$havoc_ref()
(declare-const ret@198@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_33.val_bool, write)
(declare-const $t@199@01 Bool)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@138@01 ret@198@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@135@01 ret@198@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@147@01 ret@198@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@150@01 ret@198@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@155@01 ret@198@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@164@01 ret@198@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@171@01 ret@198@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@174@01 ret@198@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@179@01 ret@198@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@188@01 ret@198@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@195@01 ret@198@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@198@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _33.val_bool := !_34.val_bool
; [eval] !_34.val_bool
(declare-const val_bool@200@01 Bool)
(assert (= val_bool@200@01 (not val_bool@197@01)))
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@195@01 ret@198@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@188@01 ret@198@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@179@01 ret@198@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@174@01 ret@198@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@171@01 ret@198@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@164@01 ret@198@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@155@01 ret@198@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@150@01 ret@198@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@147@01 ret@198@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@135@01 ret@198@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@138@01 ret@198@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t33 := _33.val_bool
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (not val_bool@200@01)))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [then-branch: 27 | val_bool@200@01 | dead]
; [else-branch: 27 | !(val_bool@200@01) | live]
(set-option :timeout 0)
(push) ; 8
; [else-branch: 27 | !(val_bool@200@01)]
(assert (not val_bool@200@01))
(pop) ; 8
; [eval] !__t33
(push) ; 8
(set-option :timeout 10)
(assert (not val_bool@200@01))
(check-sat)
; unknown
(pop) ; 8
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (not val_bool@200@01)))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [then-branch: 28 | !(val_bool@200@01) | live]
; [else-branch: 28 | val_bool@200@01 | dead]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 28 | !(val_bool@200@01)]
(assert (not val_bool@200@01))
; [exec]
; label l9
; [exec]
; __t15 := true
; [exec]
; _48 := builtin$havoc_int()
(declare-const ret@201@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _48 := 2
; [exec]
; assert acc(Slice$i32(_2.val_ref), read$())
; [eval] read$()
(set-option :timeout 0)
(push) ; 9
(pop) ; 9
; Joined path conditions
(push) ; 9
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second $t@113@01))))
  val_ref@121@01)))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  (-
    (-
      (+
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    ($Perm.min
      (-
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))
      (read$ $Snap.unit)))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 9
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(assert (not (or
  (=
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (-
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit)))
    $Perm.No)
  (<
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (-
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit)))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(push) ; 9
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [exec]
; _49 := builtin$havoc_int()
(declare-const ret@202@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _49 := Slice$len__$TY$__i32$Slice$i32$$int$(_2.val_ref)
; [eval] Slice$len__$TY$__i32$Slice$i32$$int$(_2.val_ref)
(set-option :timeout 0)
(push) ; 9
; [eval] read$()
(push) ; 10
(pop) ; 10
; Joined path conditions
(push) ; 10
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second $t@113@01))))
  val_ref@121@01)))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  (-
    (-
      (+
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    ($Perm.min
      (-
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))
      (read$ $Snap.unit)))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(assert (not (or
  (=
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (-
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit)))
    $Perm.No)
  (<
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (-
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit)))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(push) ; 10
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(pop) ; 9
; Joined path conditions
(declare-const _49@203@01 Int)
(assert (= _49@203@01 (Slice$len__$TY$__i32$Slice$i32$$int$ $t@132@01 val_ref@121@01)))
; [exec]
; _50 := builtin$havoc_ref()
(declare-const ret@204@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_50.val_bool, write)
(declare-const $t@205@01 Bool)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@138@01 ret@204@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@135@01 ret@204@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@147@01 ret@204@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@150@01 ret@204@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@155@01 ret@204@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@164@01 ret@204@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@171@01 ret@204@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@174@01 ret@204@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@179@01 ret@204@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@188@01 ret@204@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@195@01 ret@204@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@198@01 ret@204@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@204@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _50.val_bool := _48 < _49
; [eval] _48 < _49
(declare-const val_bool@206@01 Bool)
(assert (= val_bool@206@01 (< 2 _49@203@01)))
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@198@01 ret@204@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@195@01 ret@204@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@188@01 ret@204@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@179@01 ret@204@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@174@01 ret@204@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@171@01 ret@204@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@164@01 ret@204@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@155@01 ret@204@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@150@01 ret@204@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@147@01 ret@204@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@135@01 ret@204@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@138@01 ret@204@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t34 := _50.val_bool
; [exec]
; assert __t34
(set-option :timeout 0)
(push) ; 9
(assert (not val_bool@206@01))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert val_bool@206@01)
; [exec]
; __t16 := true
; [exec]
; __t35 := builtin$havoc_ref()
(declare-const ret@207@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(i32(__t35), write)
(declare-const $t@208@01 Int)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert acc(Slice$i32(_2.val_ref), read$())
; [eval] read$()
(set-option :timeout 0)
(push) ; 9
(pop) ; 9
; Joined path conditions
(push) ; 9
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@113@01)))))
  val_ref@121@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@103@01 val_ref@121@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second $t@113@01))))
  val_ref@121@01)))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  (-
    (-
      (+
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    ($Perm.min
      (-
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))
      (read$ $Snap.unit)))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 9
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(assert (not (or
  (=
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (-
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit)))
    $Perm.No)
  (<
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (-
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit)))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(push) ; 9
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [exec]
; inhale lookup_pure__$TY$__Slice$i32$i32$Slice$i32$$int$$$int$(_2.val_ref, _48) ==
;   (unfolding acc(i32(__t35), write) in __t35.val_int)
(declare-const $t@209@01 $Snap)
(assert (= $t@209@01 $Snap.unit))
; [eval] lookup_pure__$TY$__Slice$i32$i32$Slice$i32$$int$$$int$(_2.val_ref, _48) == (unfolding acc(i32(__t35), write) in __t35.val_int)
; [eval] lookup_pure__$TY$__Slice$i32$i32$Slice$i32$$int$$$int$(_2.val_ref, _48)
(set-option :timeout 0)
(push) ; 9
; [eval] read$()
(push) ; 10
(pop) ; 10
; Joined path conditions
(push) ; 10
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@113@01)))))
  val_ref@121@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@103@01 val_ref@121@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second $t@113@01))))
  val_ref@121@01)))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  (-
    (-
      (+
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    ($Perm.min
      (-
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))
      (read$ $Snap.unit)))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(assert (not (or
  (=
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (-
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit)))
    $Perm.No)
  (<
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (-
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit)))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(push) ; 10
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [eval] 0 <= idx
; [eval] idx < Slice$len__$TY$__i32$Slice$i32$$int$(self)
; [eval] Slice$len__$TY$__i32$Slice$i32$$int$(self)
(set-option :timeout 0)
(push) ; 10
; [eval] read$()
(push) ; 11
(pop) ; 11
; Joined path conditions
(push) ; 11
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@113@01)))))
  val_ref@121@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= $t@103@01 val_ref@121@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second $t@113@01))))
  val_ref@121@01)))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  (-
    (-
      (+
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    ($Perm.min
      (-
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))
      (read$ $Snap.unit)))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(assert (not (or
  (=
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (-
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit)))
    $Perm.No)
  (<
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (-
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit)))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(push) ; 11
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(pop) ; 10
; Joined path conditions
(pop) ; 9
; Joined path conditions
; [eval] (unfolding acc(i32(__t35), write) in __t35.val_int)
(set-option :timeout 0)
(push) ; 9
(assert (i32%trigger ($SortWrappers.IntTo$Snap $t@208@01) ret@207@01))
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@191@01 ret@207@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@181@01 ret@207@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@167@01 ret@207@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@157@01 ret@207@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@207@01 $Ref.null)))
(pop) ; 9
; Joined path conditions
(assert (and
  (i32%trigger ($SortWrappers.IntTo$Snap $t@208@01) ret@207@01)
  (not (= ret@207@01 $Ref.null))))
(assert (=
  (lookup_pure__$TY$__Slice$i32$i32$Slice$i32$$int$$$int$ ($Snap.combine
    $t@132@01
    ($Snap.combine $Snap.unit $Snap.unit)) val_ref@121@01 2)
  $t@208@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _47 := builtin$havoc_int()
(declare-const ret@210@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; unfold acc(i32(__t35), write)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@191@01 ret@207@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@181@01 ret@207@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@167@01 ret@207@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@157@01 ret@207@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
; [exec]
; _47 := __t35.val_int
; [exec]
; label l25
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [then-branch: 29 | True | live]
; [else-branch: 29 | False | dead]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 29 | True]
; [exec]
; exhale acc(Slice$i32(_2.val_ref), read$())
; [eval] read$()
(push) ; 10
(pop) ; 10
; Joined path conditions
(push) ; 10
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second $t@113@01))))
  val_ref@121@01)))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  (-
    (-
      (+
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    ($Perm.min
      (-
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))
      (read$ $Snap.unit)))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(assert (not (or
  (=
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (-
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit)))
    $Perm.No)
  (<
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (-
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit)))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(push) ; 10
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [exec]
; inhale acc(Slice$i32(_4.tuple_0.val_ref), write - read$())
; [eval] write - read$()
; [eval] read$()
(set-option :timeout 0)
(push) ; 10
(pop) ; 10
; Joined path conditions
(push) ; 10
(assert (not (or
  (= (- $Perm.Write (read$ $Snap.unit)) $Perm.No)
  (< $Perm.No (- $Perm.Write (read$ $Snap.unit))))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(declare-const $t@211@01 $Snap)
(declare-const $t@212@01 $Snap)
(assert (and
  (=>
    (<
      $Perm.No
      (-
        (-
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        ($Perm.min
          (-
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            ($Perm.min
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              (read$ $Snap.unit)))
          (read$ $Snap.unit))))
    (= $t@212@01 $t@132@01))
  (=> (< $Perm.No (- $Perm.Write (read$ $Snap.unit))) (= $t@212@01 $t@211@01))))
(assert (<=
  $Perm.No
  (+
    (-
      (-
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))
      ($Perm.min
        (-
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit)))
    (- $Perm.Write (read$ $Snap.unit)))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _46 := builtin$havoc_ref()
(declare-const ret@213@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_46.val_bool, write)
(declare-const $t@214@01 Bool)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@204@01 ret@213@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@198@01 ret@213@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@195@01 ret@213@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@188@01 ret@213@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@179@01 ret@213@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@174@01 ret@213@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@171@01 ret@213@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@164@01 ret@213@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@155@01 ret@213@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@150@01 ret@213@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@147@01 ret@213@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@135@01 ret@213@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@138@01 ret@213@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@213@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _46.val_bool := _47 == 0
; [eval] _47 == 0
(declare-const val_bool@215@01 Bool)
(assert (= val_bool@215@01 (= $t@208@01 0)))
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@138@01 ret@213@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@135@01 ret@213@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@147@01 ret@213@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@150@01 ret@213@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@155@01 ret@213@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@164@01 ret@213@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@171@01 ret@213@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@174@01 ret@213@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@179@01 ret@213@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@188@01 ret@213@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@195@01 ret@213@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@198@01 ret@213@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@204@01 ret@213@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [exec]
; _45 := builtin$havoc_ref()
(declare-const ret@216@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_45.val_bool, write)
(declare-const $t@217@01 Bool)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@204@01 ret@216@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@198@01 ret@216@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@195@01 ret@216@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@188@01 ret@216@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@179@01 ret@216@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@174@01 ret@216@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@171@01 ret@216@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@164@01 ret@216@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@155@01 ret@216@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@150@01 ret@216@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@147@01 ret@216@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@135@01 ret@216@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@138@01 ret@216@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@213@01 ret@216@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@216@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _45.val_bool := !_46.val_bool
; [eval] !_46.val_bool
(declare-const val_bool@218@01 Bool)
(assert (= val_bool@218@01 (not val_bool@215@01)))
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@213@01 ret@216@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@138@01 ret@216@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@135@01 ret@216@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@147@01 ret@216@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@150@01 ret@216@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@155@01 ret@216@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@164@01 ret@216@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@171@01 ret@216@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@174@01 ret@216@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@179@01 ret@216@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@188@01 ret@216@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@195@01 ret@216@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@198@01 ret@216@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@204@01 ret@216@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t36 := _45.val_bool
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not val_bool@218@01)))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [then-branch: 30 | val_bool@218@01 | dead]
; [else-branch: 30 | !(val_bool@218@01) | live]
(set-option :timeout 0)
(push) ; 10
; [else-branch: 30 | !(val_bool@218@01)]
(assert (not val_bool@218@01))
(pop) ; 10
; [eval] !__t36
(push) ; 10
(set-option :timeout 10)
(assert (not val_bool@218@01))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not val_bool@218@01)))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [then-branch: 31 | !(val_bool@218@01) | live]
; [else-branch: 31 | val_bool@218@01 | dead]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 31 | !(val_bool@218@01)]
(assert (not val_bool@218@01))
; [exec]
; label bb2
; [exec]
; __t18 := true
; [exec]
; _56 := builtin$havoc_int()
(declare-const ret@219@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _56 := 2
; [exec]
; assert acc(Slice$i32(_3.val_ref), read$())
; [eval] read$()
(set-option :timeout 0)
(push) ; 11
(pop) ; 11
; Joined path conditions
(push) ; 11
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second $t@113@01))))
  val_ref@126@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@113@01)))))
  val_ref@126@01)))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  (-
    (-
      (+
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    ($Perm.min
      (-
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))
      (read$ $Snap.unit)))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(assert (not (or
  (=
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (-
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit)))
    $Perm.No)
  (<
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (-
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit)))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(push) ; 11
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [exec]
; _57 := builtin$havoc_int()
(declare-const ret@220@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _57 := Slice$len__$TY$__i32$Slice$i32$$int$(_3.val_ref)
; [eval] Slice$len__$TY$__i32$Slice$i32$$int$(_3.val_ref)
(set-option :timeout 0)
(push) ; 11
; [eval] read$()
(push) ; 12
(pop) ; 12
; Joined path conditions
(push) ; 12
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second $t@113@01))))
  val_ref@126@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@113@01)))))
  val_ref@126@01)))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  (-
    (-
      (+
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    ($Perm.min
      (-
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))
      (read$ $Snap.unit)))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 12
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(assert (not (or
  (=
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (-
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit)))
    $Perm.No)
  (<
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (-
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit)))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(push) ; 12
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(pop) ; 11
; Joined path conditions
(declare-const _57@221@01 Int)
(assert (= _57@221@01 (Slice$len__$TY$__i32$Slice$i32$$int$ $t@144@01 val_ref@126@01)))
; [exec]
; _58 := builtin$havoc_ref()
(declare-const ret@222@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_58.val_bool, write)
(declare-const $t@223@01 Bool)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@204@01 ret@222@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@198@01 ret@222@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@195@01 ret@222@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@188@01 ret@222@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@179@01 ret@222@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@174@01 ret@222@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@171@01 ret@222@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@164@01 ret@222@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@155@01 ret@222@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@150@01 ret@222@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@147@01 ret@222@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@135@01 ret@222@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@138@01 ret@222@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@213@01 ret@222@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@216@01 ret@222@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@222@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _58.val_bool := _56 < _57
; [eval] _56 < _57
(declare-const val_bool@224@01 Bool)
(assert (= val_bool@224@01 (< 2 _57@221@01)))
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@216@01 ret@222@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@213@01 ret@222@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@138@01 ret@222@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@135@01 ret@222@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@147@01 ret@222@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@150@01 ret@222@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@155@01 ret@222@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@164@01 ret@222@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@171@01 ret@222@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@174@01 ret@222@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@179@01 ret@222@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@188@01 ret@222@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@195@01 ret@222@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@198@01 ret@222@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@204@01 ret@222@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t37 := _58.val_bool
; [exec]
; assert __t37
(set-option :timeout 0)
(push) ; 11
(assert (not val_bool@224@01))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(assert val_bool@224@01)
; [exec]
; __t19 := true
; [exec]
; __t38 := builtin$havoc_ref()
(declare-const ret@225@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(i32(__t38), write)
(declare-const $t@226@01 Int)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert acc(Slice$i32(_3.val_ref), read$())
; [eval] read$()
(set-option :timeout 0)
(push) ; 11
(pop) ; 11
; Joined path conditions
(push) ; 11
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(push) ; 11
(set-option :timeout 10)
(assert (not (= $t@103@01 val_ref@126@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@113@01)))))
  val_ref@126@01)))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  (-
    (-
      (+
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    ($Perm.min
      (-
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))
      (read$ $Snap.unit)))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 11
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(assert (not (or
  (=
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (-
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit)))
    $Perm.No)
  (<
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (-
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit)))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(push) ; 11
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [exec]
; inhale lookup_pure__$TY$__Slice$i32$i32$Slice$i32$$int$$$int$(_3.val_ref, _56) ==
;   (unfolding acc(i32(__t38), write) in __t38.val_int)
(declare-const $t@227@01 $Snap)
(assert (= $t@227@01 $Snap.unit))
; [eval] lookup_pure__$TY$__Slice$i32$i32$Slice$i32$$int$$$int$(_3.val_ref, _56) == (unfolding acc(i32(__t38), write) in __t38.val_int)
; [eval] lookup_pure__$TY$__Slice$i32$i32$Slice$i32$$int$$$int$(_3.val_ref, _56)
(set-option :timeout 0)
(push) ; 11
; [eval] read$()
(push) ; 12
(pop) ; 12
; Joined path conditions
(push) ; 12
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(push) ; 12
(set-option :timeout 10)
(assert (not (= $t@103@01 val_ref@126@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@113@01)))))
  val_ref@126@01)))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  (-
    (-
      (+
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    ($Perm.min
      (-
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))
      (read$ $Snap.unit)))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(assert (not (or
  (=
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (-
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit)))
    $Perm.No)
  (<
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (-
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit)))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(push) ; 12
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [eval] 0 <= idx
; [eval] idx < Slice$len__$TY$__i32$Slice$i32$$int$(self)
; [eval] Slice$len__$TY$__i32$Slice$i32$$int$(self)
(set-option :timeout 0)
(push) ; 12
; [eval] read$()
(push) ; 13
(pop) ; 13
; Joined path conditions
(push) ; 13
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(push) ; 13
(set-option :timeout 10)
(assert (not (= $t@103@01 val_ref@126@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@113@01)))))
  val_ref@126@01)))
(check-sat)
; unsat
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (=
  (-
    (-
      (+
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    ($Perm.min
      (-
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))
      (read$ $Snap.unit)))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(assert (not (or
  (=
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (-
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit)))
    $Perm.No)
  (<
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (-
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit)))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(push) ; 13
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(pop) ; 12
; Joined path conditions
(pop) ; 11
; Joined path conditions
; [eval] (unfolding acc(i32(__t38), write) in __t38.val_int)
(set-option :timeout 0)
(push) ; 11
(assert (i32%trigger ($SortWrappers.IntTo$Snap $t@226@01) ret@225@01))
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@157@01 ret@225@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@167@01 ret@225@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@181@01 ret@225@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@191@01 ret@225@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@207@01 ret@225@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.01s
; (get-info :all-statistics)
(assert (not (= ret@225@01 $Ref.null)))
(pop) ; 11
; Joined path conditions
(assert (and
  (i32%trigger ($SortWrappers.IntTo$Snap $t@226@01) ret@225@01)
  (not (= ret@225@01 $Ref.null))))
(assert (=
  (lookup_pure__$TY$__Slice$i32$i32$Slice$i32$$int$$$int$ ($Snap.combine
    $t@144@01
    ($Snap.combine $Snap.unit $Snap.unit)) val_ref@126@01 2)
  $t@226@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _55 := builtin$havoc_int()
(declare-const ret@228@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; unfold acc(i32(__t38), write)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@157@01 ret@225@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@167@01 ret@225@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@181@01 ret@225@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@191@01 ret@225@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@207@01 ret@225@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
; [exec]
; _55 := __t38.val_int
; [exec]
; label l28
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [then-branch: 32 | True | live]
; [else-branch: 32 | False | dead]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 32 | True]
; [exec]
; exhale acc(Slice$i32(_3.val_ref), read$())
; [eval] read$()
(push) ; 12
(pop) ; 12
; Joined path conditions
(push) ; 12
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second $t@113@01))))
  val_ref@126@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@113@01)))))
  val_ref@126@01)))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  (-
    (-
      (+
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    ($Perm.min
      (-
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))
      (read$ $Snap.unit)))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(assert (not (or
  (=
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (-
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit)))
    $Perm.No)
  (<
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (-
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit)))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(push) ; 12
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [exec]
; inhale acc(Slice$i32(_4.tuple_1.val_ref), write - read$())
; [eval] write - read$()
; [eval] read$()
(set-option :timeout 0)
(push) ; 12
(pop) ; 12
; Joined path conditions
(push) ; 12
(assert (not (or
  (= (- $Perm.Write (read$ $Snap.unit)) $Perm.No)
  (< $Perm.No (- $Perm.Write (read$ $Snap.unit))))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(declare-const $t@229@01 $Snap)
(declare-const $t@230@01 $Snap)
(assert (and
  (=>
    (<
      $Perm.No
      (-
        (-
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        ($Perm.min
          (-
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            ($Perm.min
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              (read$ $Snap.unit)))
          (read$ $Snap.unit))))
    (= $t@230@01 $t@144@01))
  (=> (< $Perm.No (- $Perm.Write (read$ $Snap.unit))) (= $t@230@01 $t@229@01))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [eval] __t0 && (__t0 && (__t0 && __t1))
(set-option :timeout 0)
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
(push) ; 12
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [then-branch: 36 | True | live]
; [else-branch: 36 | False | dead]
(set-option :timeout 0)
(push) ; 12
; [then-branch: 36 | True]
; [exec]
; exhale acc(Array$13$i32(_6.val_ref), read$())
; [eval] read$()
(push) ; 13
(pop) ; 13
; Joined path conditions
(push) ; 13
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(push) ; 13
(set-option :timeout 10)
(assert (not (=
  (-
    (+
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit))
      (read$ $Snap.unit))
    ($Perm.min
      (+
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit))
      (read$ $Snap.unit)))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 13
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(assert (not (or
  (=
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    $Perm.No)
  (<
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(push) ; 13
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
; [eval] __t0 && (__t0 && (__t0 && (__t0 && __t1)))
(set-option :timeout 0)
(push) ; 13
; [then-branch: 37 | True | live]
; [else-branch: 37 | False | live]
(push) ; 14
; [then-branch: 37 | True]
(push) ; 15
; [then-branch: 38 | True | live]
; [else-branch: 38 | False | live]
(push) ; 16
; [then-branch: 38 | True]
(push) ; 17
; [then-branch: 39 | True | live]
; [else-branch: 39 | False | live]
(push) ; 18
; [then-branch: 39 | True]
(push) ; 19
; [then-branch: 40 | True | live]
; [else-branch: 40 | False | live]
(push) ; 20
; [then-branch: 40 | True]
(pop) ; 20
(push) ; 20
; [else-branch: 40 | False]
(assert false)
(pop) ; 20
(pop) ; 19
; Joined path conditions
; Joined path conditions
(pop) ; 18
(push) ; 18
; [else-branch: 39 | False]
(assert false)
(pop) ; 18
(pop) ; 17
; Joined path conditions
; Joined path conditions
(pop) ; 16
(push) ; 16
; [else-branch: 38 | False]
(assert false)
(pop) ; 16
(pop) ; 15
; Joined path conditions
; Joined path conditions
(pop) ; 14
(push) ; 14
; [else-branch: 37 | False]
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
; 0.01s
; (get-info :all-statistics)
; [then-branch: 41 | True | live]
; [else-branch: 41 | False | dead]
(set-option :timeout 0)
(push) ; 13
; [then-branch: 41 | True]
; [exec]
; exhale acc(Array$13$i32(_7.val_ref), read$())
; [eval] read$()
(push) ; 14
(pop) ; 14
; Joined path conditions
(push) ; 14
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(push) ; 14
(set-option :timeout 10)
(assert (not (=
  (-
    (-
      (+
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    ($Perm.min
      (-
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))
      (read$ $Snap.unit)))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(assert (not (or
  (=
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (-
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit)))
    $Perm.No)
  (<
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (-
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit)))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(push) ; 14
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
; [exec]
; inhale acc(Array$13$i32(_1), write - read$())
; [eval] write - read$()
; [eval] read$()
(set-option :timeout 0)
(push) ; 14
(pop) ; 14
; Joined path conditions
(push) ; 14
(assert (not (or
  (= (- $Perm.Write (read$ $Snap.unit)) $Perm.No)
  (< $Perm.No (- $Perm.Write (read$ $Snap.unit))))))
(check-sat)
; unsat
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(declare-const $t@231@01 $Snap)
(declare-const $t@232@01 $Snap)
(assert (and
  (=>
    (<
      $Perm.No
      (-
        (-
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        ($Perm.min
          (-
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            ($Perm.min
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              (read$ $Snap.unit)))
          (read$ $Snap.unit))))
    (= $t@232@01 $t@101@01))
  (=> (< $Perm.No (- $Perm.Write (read$ $Snap.unit))) (= $t@232@01 $t@231@01))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _54 := builtin$havoc_ref()
(declare-const ret@233@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_54.val_bool, write)
(declare-const $t@234@01 Bool)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@204@01 ret@233@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@198@01 ret@233@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@195@01 ret@233@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@188@01 ret@233@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@179@01 ret@233@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@174@01 ret@233@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@171@01 ret@233@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@164@01 ret@233@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@155@01 ret@233@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@150@01 ret@233@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@147@01 ret@233@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@135@01 ret@233@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@138@01 ret@233@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@213@01 ret@233@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@216@01 ret@233@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@222@01 ret@233@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@233@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _54.val_bool := _55 == 0
; [eval] _55 == 0
(declare-const val_bool@235@01 Bool)
(assert (= val_bool@235@01 (= $t@226@01 0)))
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@222@01 ret@233@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@216@01 ret@233@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@213@01 ret@233@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@138@01 ret@233@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@135@01 ret@233@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@147@01 ret@233@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@150@01 ret@233@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@155@01 ret@233@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@164@01 ret@233@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@171@01 ret@233@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@174@01 ret@233@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@179@01 ret@233@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@188@01 ret@233@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@195@01 ret@233@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@198@01 ret@233@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@204@01 ret@233@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
; [exec]
; _53 := builtin$havoc_ref()
(declare-const ret@236@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_53.val_bool, write)
(declare-const $t@237@01 Bool)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@204@01 ret@236@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@198@01 ret@236@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@195@01 ret@236@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@188@01 ret@236@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@179@01 ret@236@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@174@01 ret@236@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@171@01 ret@236@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@164@01 ret@236@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@155@01 ret@236@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@150@01 ret@236@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@147@01 ret@236@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@135@01 ret@236@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@138@01 ret@236@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@213@01 ret@236@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@216@01 ret@236@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@222@01 ret@236@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@233@01 ret@236@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@236@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _53.val_bool := !_54.val_bool
; [eval] !_54.val_bool
(declare-const val_bool@238@01 Bool)
(assert (= val_bool@238@01 (not val_bool@235@01)))
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@233@01 ret@236@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@222@01 ret@236@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@216@01 ret@236@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@213@01 ret@236@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@138@01 ret@236@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@135@01 ret@236@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@147@01 ret@236@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@150@01 ret@236@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@155@01 ret@236@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@164@01 ret@236@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@171@01 ret@236@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@174@01 ret@236@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@179@01 ret@236@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@188@01 ret@236@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@195@01 ret@236@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@198@01 ret@236@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@204@01 ret@236@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t39 := _53.val_bool
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (not val_bool@238@01)))
(check-sat)
; unsat
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
; [then-branch: 42 | val_bool@238@01 | dead]
; [else-branch: 42 | !(val_bool@238@01) | live]
(set-option :timeout 0)
(push) ; 14
; [else-branch: 42 | !(val_bool@238@01)]
(assert (not val_bool@238@01))
(pop) ; 14
; [eval] !__t39
(push) ; 14
(set-option :timeout 10)
(assert (not val_bool@238@01))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (not val_bool@238@01)))
(check-sat)
; unsat
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
; [then-branch: 43 | !(val_bool@238@01) | live]
; [else-branch: 43 | val_bool@238@01 | dead]
(set-option :timeout 0)
(push) ; 14
; [then-branch: 43 | !(val_bool@238@01)]
(assert (not val_bool@238@01))
; [exec]
; label l10
; [exec]
; __t21 := true
; [exec]
; label l32
; [exec]
; fold acc(tuple0$(_0), write)
(assert (tuple0$%trigger $Snap.unit _0@1@01))
; [exec]
; assert true
; [exec]
; exhale acc(tuple0$(_0), write)
; [exec]
; label end_of_method
(pop) ; 14
(pop) ; 13
; [eval] !(__t0 && (__t0 && (__t0 && (__t0 && __t1))))
; [eval] __t0 && (__t0 && (__t0 && (__t0 && __t1)))
(push) ; 13
; [then-branch: 44 | True | live]
; [else-branch: 44 | False | live]
(push) ; 14
; [then-branch: 44 | True]
(push) ; 15
; [then-branch: 45 | True | live]
; [else-branch: 45 | False | live]
(push) ; 16
; [then-branch: 45 | True]
(push) ; 17
; [then-branch: 46 | True | live]
; [else-branch: 46 | False | live]
(push) ; 18
; [then-branch: 46 | True]
(push) ; 19
; [then-branch: 47 | True | live]
; [else-branch: 47 | False | live]
(push) ; 20
; [then-branch: 47 | True]
(pop) ; 20
(push) ; 20
; [else-branch: 47 | False]
(assert false)
(pop) ; 20
(pop) ; 19
; Joined path conditions
; Joined path conditions
(pop) ; 18
(push) ; 18
; [else-branch: 46 | False]
(assert false)
(pop) ; 18
(pop) ; 17
; Joined path conditions
; Joined path conditions
(pop) ; 16
(push) ; 16
; [else-branch: 45 | False]
(assert false)
(pop) ; 16
(pop) ; 15
; Joined path conditions
; Joined path conditions
(pop) ; 14
(push) ; 14
; [else-branch: 44 | False]
(assert false)
(pop) ; 14
(pop) ; 13
; Joined path conditions
; Joined path conditions
; [then-branch: 48 | False | dead]
; [else-branch: 48 | True | live]
(push) ; 13
; [else-branch: 48 | True]
(pop) ; 13
(pop) ; 12
; [eval] !(__t0 && (__t0 && (__t0 && __t1)))
; [eval] __t0 && (__t0 && (__t0 && __t1))
(push) ; 12
; [then-branch: 49 | True | live]
; [else-branch: 49 | False | live]
(push) ; 13
; [then-branch: 49 | True]
(push) ; 14
; [then-branch: 50 | True | live]
; [else-branch: 50 | False | live]
(push) ; 15
; [then-branch: 50 | True]
(push) ; 16
; [then-branch: 51 | True | live]
; [else-branch: 51 | False | live]
(push) ; 17
; [then-branch: 51 | True]
(pop) ; 17
(push) ; 17
; [else-branch: 51 | False]
(assert false)
(pop) ; 17
(pop) ; 16
; Joined path conditions
; Joined path conditions
(pop) ; 15
(push) ; 15
; [else-branch: 50 | False]
(assert false)
(pop) ; 15
(pop) ; 14
; Joined path conditions
; Joined path conditions
(pop) ; 13
(push) ; 13
; [else-branch: 49 | False]
(assert false)
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
; [then-branch: 52 | False | dead]
; [else-branch: 52 | True | live]
(push) ; 12
; [else-branch: 52 | True]
(pop) ; 12
(pop) ; 11
; [eval] !__t1
; [then-branch: 53 | False | dead]
; [else-branch: 53 | True | live]
(push) ; 11
; [else-branch: 53 | True]
(pop) ; 11
(pop) ; 10
(pop) ; 9
; [eval] !__t1
; [then-branch: 54 | False | dead]
; [else-branch: 54 | True | live]
(push) ; 9
; [else-branch: 54 | True]
(pop) ; 9
(pop) ; 8
(pop) ; 7
(pop) ; 6
(pop) ; 5
; [eval] !(__t4 && __t4)
; [eval] __t4 && __t4
(push) ; 5
; [then-branch: 55 | True | live]
; [else-branch: 55 | False | live]
(push) ; 6
; [then-branch: 55 | True]
(pop) ; 6
(push) ; 6
; [else-branch: 55 | False]
(assert false)
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
; [then-branch: 56 | False | dead]
; [else-branch: 56 | True | live]
(push) ; 5
; [else-branch: 56 | True]
(pop) ; 5
(pop) ; 4
(pop) ; 3
; [eval] !(__t1 && __t1)
; [eval] __t1 && __t1
(push) ; 3
; [then-branch: 57 | True | live]
; [else-branch: 57 | False | live]
(push) ; 4
; [then-branch: 57 | True]
(pop) ; 4
(push) ; 4
; [else-branch: 57 | False]
(assert false)
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
; [then-branch: 58 | False | dead]
; [else-branch: 58 | True | live]
(push) ; 3
; [else-branch: 58 | True]
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- builtin$havoc_bool ----------
(declare-const ret@239@01 Bool)
(declare-const ret@240@01 Bool)
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
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- builtin$havoc_int ----------
(declare-const ret@241@01 Int)
(declare-const ret@242@01 Int)
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
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- builtin$havoc_ref ----------
(declare-const ret@243@01 $Ref)
(declare-const ret@244@01 $Ref)
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
; inhale false
(pop) ; 2
(pop) ; 1
