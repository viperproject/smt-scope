(get-info :version)
; (:version "4.12.1")
; Started: 2023-10-31 14:04:10
; Silicon.version: 1.1-SNAPSHOT (46944a65@dspil_symbenchmarking)
; Input file: /home/pcorrect/repos/benchmarking_general/silicon_tests/prusti_tests_._pass_._issues_._issue-721-1_._issue-721-1.rs_issue_721_1--Path--reset-Both.vpr
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
(declare-sort MirrorDomain 0)
(declare-sort Snap$Slice$usize 0)
(declare-sort Snap$struct$m_Path 0)
(declare-sort Snap$Array$64$usize 0)
(declare-sort $FVF<f$entries> 0)
(declare-sort $FVF<val_ref> 0)
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
(declare-fun $SortWrappers.MirrorDomainTo$Snap (MirrorDomain) $Snap)
(declare-fun $SortWrappers.$SnapToMirrorDomain ($Snap) MirrorDomain)
(assert (forall ((x MirrorDomain)) (!
    (= x ($SortWrappers.$SnapToMirrorDomain($SortWrappers.MirrorDomainTo$Snap x)))
    :pattern (($SortWrappers.MirrorDomainTo$Snap x))
    :qid |$Snap.$SnapToMirrorDomainTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.MirrorDomainTo$Snap($SortWrappers.$SnapToMirrorDomain x)))
    :pattern (($SortWrappers.$SnapToMirrorDomain x))
    :qid |$Snap.MirrorDomainTo$SnapToMirrorDomain|
    )))
(declare-fun $SortWrappers.Snap$Slice$usizeTo$Snap (Snap$Slice$usize) $Snap)
(declare-fun $SortWrappers.$SnapToSnap$Slice$usize ($Snap) Snap$Slice$usize)
(assert (forall ((x Snap$Slice$usize)) (!
    (= x ($SortWrappers.$SnapToSnap$Slice$usize($SortWrappers.Snap$Slice$usizeTo$Snap x)))
    :pattern (($SortWrappers.Snap$Slice$usizeTo$Snap x))
    :qid |$Snap.$SnapToSnap$Slice$usizeTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Snap$Slice$usizeTo$Snap($SortWrappers.$SnapToSnap$Slice$usize x)))
    :pattern (($SortWrappers.$SnapToSnap$Slice$usize x))
    :qid |$Snap.Snap$Slice$usizeTo$SnapToSnap$Slice$usize|
    )))
(declare-fun $SortWrappers.Snap$struct$m_PathTo$Snap (Snap$struct$m_Path) $Snap)
(declare-fun $SortWrappers.$SnapToSnap$struct$m_Path ($Snap) Snap$struct$m_Path)
(assert (forall ((x Snap$struct$m_Path)) (!
    (= x ($SortWrappers.$SnapToSnap$struct$m_Path($SortWrappers.Snap$struct$m_PathTo$Snap x)))
    :pattern (($SortWrappers.Snap$struct$m_PathTo$Snap x))
    :qid |$Snap.$SnapToSnap$struct$m_PathTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Snap$struct$m_PathTo$Snap($SortWrappers.$SnapToSnap$struct$m_Path x)))
    :pattern (($SortWrappers.$SnapToSnap$struct$m_Path x))
    :qid |$Snap.Snap$struct$m_PathTo$SnapToSnap$struct$m_Path|
    )))
(declare-fun $SortWrappers.Snap$Array$64$usizeTo$Snap (Snap$Array$64$usize) $Snap)
(declare-fun $SortWrappers.$SnapToSnap$Array$64$usize ($Snap) Snap$Array$64$usize)
(assert (forall ((x Snap$Array$64$usize)) (!
    (= x ($SortWrappers.$SnapToSnap$Array$64$usize($SortWrappers.Snap$Array$64$usizeTo$Snap x)))
    :pattern (($SortWrappers.Snap$Array$64$usizeTo$Snap x))
    :qid |$Snap.$SnapToSnap$Array$64$usizeTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Snap$Array$64$usizeTo$Snap($SortWrappers.$SnapToSnap$Array$64$usize x)))
    :pattern (($SortWrappers.$SnapToSnap$Array$64$usize x))
    :qid |$Snap.Snap$Array$64$usizeTo$SnapToSnap$Array$64$usize|
    )))
; Declaring additional sort wrappers
(declare-fun $SortWrappers.$FVF<f$entries>To$Snap ($FVF<f$entries>) $Snap)
(declare-fun $SortWrappers.$SnapTo$FVF<f$entries> ($Snap) $FVF<f$entries>)
(assert (forall ((x $FVF<f$entries>)) (!
    (= x ($SortWrappers.$SnapTo$FVF<f$entries>($SortWrappers.$FVF<f$entries>To$Snap x)))
    :pattern (($SortWrappers.$FVF<f$entries>To$Snap x))
    :qid |$Snap.$SnapTo$FVF<f$entries>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$FVF<f$entries>To$Snap($SortWrappers.$SnapTo$FVF<f$entries> x)))
    :pattern (($SortWrappers.$SnapTo$FVF<f$entries> x))
    :qid |$Snap.$FVF<f$entries>To$SnapTo$FVF<f$entries>|
    )))
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
(declare-fun mirror_simple$m_Path$$invariant__$TY$__Snap$struct$m_Path$$bool$<Bool> (Snap$struct$m_Path) Bool)
(declare-fun cons$Snap$Slice$usize$__$TY$__Seq$$int$$Snap$Slice$usize<Snap$Slice$usize> (Seq<Int>) Snap$Slice$usize)
(declare-fun uncons$Snap$Slice$usize$__$TY$__Snap$Slice$usize$Seq$$int$<Seq<Int>> (Snap$Slice$usize) Seq<Int>)
(declare-fun read$Snap$Slice$usize$__$TY$__Snap$Slice$usize$$int$$$int$<Int> (Snap$Slice$usize Int) Int)
(declare-fun len$Snap$Slice$usize$__$TY$__Snap$Slice$usize$$int$<Int> (Snap$Slice$usize) Int)
(declare-fun cons$Snap$Array$64$usize$__$TY$__Seq$$int$$Snap$Array$64$usize<Snap$Array$64$usize> (Seq<Int>) Snap$Array$64$usize)
(declare-fun uncons$Snap$Array$64$usize$__$TY$__Snap$Array$64$usize$Seq$$int$<Seq<Int>> (Snap$Array$64$usize) Seq<Int>)
(declare-fun read$Snap$Array$64$usize$__$TY$__Snap$Array$64$usize$$int$$$int$<Int> (Snap$Array$64$usize Int) Int)
(declare-fun cons$0$__$TY$__Snap$struct$m_Path$$int$$$int$$Snap$Array$64$usize$Snap$Array$64$usize$Snap$struct$m_Path<Snap$struct$m_Path> (Int Int Snap$Array$64$usize Snap$Array$64$usize) Snap$struct$m_Path)
(declare-fun Snap$struct$m_Path$0$field$f$current__$TY$__Snap$struct$m_Path$$int$<Int> (Snap$struct$m_Path) Int)
(declare-fun Snap$struct$m_Path$0$field$f$depth__$TY$__Snap$struct$m_Path$$int$<Int> (Snap$struct$m_Path) Int)
(declare-fun Snap$struct$m_Path$0$field$f$entries__$TY$__Snap$struct$m_Path$Snap$Array$64$usize<Snap$Array$64$usize> (Snap$struct$m_Path) Snap$Array$64$usize)
(declare-fun Snap$struct$m_Path$0$field$f$max_counts__$TY$__Snap$struct$m_Path$Snap$Array$64$usize<Snap$Array$64$usize> (Snap$struct$m_Path) Snap$Array$64$usize)
; /field_value_functions_declarations.smt2 [f$entries: Ref]
(declare-fun $FVF.domain_f$entries ($FVF<f$entries>) Set<$Ref>)
(declare-fun $FVF.lookup_f$entries ($FVF<f$entries> $Ref) $Ref)
(declare-fun $FVF.after_f$entries ($FVF<f$entries> $FVF<f$entries>) Bool)
(declare-fun $FVF.loc_f$entries ($Ref $Ref) Bool)
(declare-fun $FVF.perm_f$entries ($FPM $Ref) $Perm)
(declare-const $fvfTOP_f$entries $FVF<f$entries>)
; /field_value_functions_declarations.smt2 [val_ref: Ref]
(declare-fun $FVF.domain_val_ref ($FVF<val_ref>) Set<$Ref>)
(declare-fun $FVF.lookup_val_ref ($FVF<val_ref> $Ref) $Ref)
(declare-fun $FVF.after_val_ref ($FVF<val_ref> $FVF<val_ref>) Bool)
(declare-fun $FVF.loc_val_ref ($Ref $Ref) Bool)
(declare-fun $FVF.perm_val_ref ($FPM $Ref) $Perm)
(declare-const $fvfTOP_val_ref $FVF<val_ref>)
; Declaring symbols related to program functions (from program analysis)
(declare-fun read$ ($Snap) $Perm)
(declare-fun read$%limited ($Snap) $Perm)
(declare-const read$%stateless Bool)
(declare-fun read$%precondition ($Snap) Bool)
(declare-fun lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$ ($Snap $Ref Int) Int)
(declare-fun lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$%limited ($Snap $Ref Int) Int)
(declare-fun lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$%stateless ($Ref Int) Bool)
(declare-fun lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$%precondition ($Snap $Ref Int) Bool)
(declare-fun seq_collect$Array$64$usize$__$TY$__Array$64$usize$$int$$Seq$$int$ ($Snap $Ref Int) Seq<Int>)
(declare-fun seq_collect$Array$64$usize$__$TY$__Array$64$usize$$int$$Seq$$int$%limited ($Snap $Ref Int) Seq<Int>)
(declare-fun seq_collect$Array$64$usize$__$TY$__Array$64$usize$$int$$Seq$$int$%stateless ($Ref Int) Bool)
(declare-fun seq_collect$Array$64$usize$__$TY$__Array$64$usize$$int$$Seq$$int$%precondition ($Snap $Ref Int) Bool)
(declare-fun Slice$len__$TY$__usize$Slice$usize$$int$ ($Snap $Ref) Int)
(declare-fun Slice$len__$TY$__usize$Slice$usize$$int$%limited ($Snap $Ref) Int)
(declare-fun Slice$len__$TY$__usize$Slice$usize$$int$%stateless ($Ref) Bool)
(declare-fun Slice$len__$TY$__usize$Slice$usize$$int$%precondition ($Snap $Ref) Bool)
(declare-fun snap$__$TY$__Snap$Array$64$usize$Array$64$usize$Snap$Array$64$usize ($Snap $Ref) Snap$Array$64$usize)
(declare-fun snap$__$TY$__Snap$Array$64$usize$Array$64$usize$Snap$Array$64$usize%limited ($Snap $Ref) Snap$Array$64$usize)
(declare-fun snap$__$TY$__Snap$Array$64$usize$Array$64$usize$Snap$Array$64$usize%stateless ($Ref) Bool)
(declare-fun snap$__$TY$__Snap$Array$64$usize$Array$64$usize$Snap$Array$64$usize%precondition ($Snap $Ref) Bool)
(declare-fun builtin$unsize$Array$64$usize$Slice$usize__$TY$__Snap$Array$64$usize$Snap$Slice$usize ($Snap Snap$Array$64$usize) Snap$Slice$usize)
(declare-fun builtin$unsize$Array$64$usize$Slice$usize__$TY$__Snap$Array$64$usize$Snap$Slice$usize%limited ($Snap Snap$Array$64$usize) Snap$Slice$usize)
(declare-fun builtin$unsize$Array$64$usize$Slice$usize__$TY$__Snap$Array$64$usize$Snap$Slice$usize%stateless (Snap$Array$64$usize) Bool)
(declare-fun builtin$unsize$Array$64$usize$Slice$usize__$TY$__Snap$Array$64$usize$Snap$Slice$usize%precondition ($Snap Snap$Array$64$usize) Bool)
(declare-fun lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$ ($Snap $Ref Int) Int)
(declare-fun lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$%limited ($Snap $Ref Int) Int)
(declare-fun lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$%stateless ($Ref Int) Bool)
(declare-fun lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$%precondition ($Snap $Ref Int) Bool)
(declare-fun snap$__$TY$__Snap$struct$m_Path$struct$m_Path$Snap$struct$m_Path ($Snap $Ref) Snap$struct$m_Path)
(declare-fun snap$__$TY$__Snap$struct$m_Path$struct$m_Path$Snap$struct$m_Path%limited ($Snap $Ref) Snap$struct$m_Path)
(declare-fun snap$__$TY$__Snap$struct$m_Path$struct$m_Path$Snap$struct$m_Path%stateless ($Ref) Bool)
(declare-fun snap$__$TY$__Snap$struct$m_Path$struct$m_Path$Snap$struct$m_Path%precondition ($Snap $Ref) Bool)
(declare-fun m_Path$$invariant__$TY$__Snap$struct$m_Path$$bool$ ($Snap Snap$struct$m_Path) Bool)
(declare-fun m_Path$$invariant__$TY$__Snap$struct$m_Path$$bool$%limited ($Snap Snap$struct$m_Path) Bool)
(declare-fun m_Path$$invariant__$TY$__Snap$struct$m_Path$$bool$%stateless (Snap$struct$m_Path) Bool)
(declare-fun m_Path$$invariant__$TY$__Snap$struct$m_Path$$bool$%precondition ($Snap Snap$struct$m_Path) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun Array$64$usize%trigger ($Snap $Ref) Bool)
(declare-fun DeadBorrowToken$%trigger ($Snap Int) Bool)
(declare-fun Slice$usize%trigger ($Snap $Ref) Bool)
(declare-fun struct$m_Path%trigger ($Snap $Ref) Bool)
(declare-fun tuple0$%trigger ($Snap $Ref) Bool)
(declare-fun usize%trigger ($Snap $Ref) Bool)
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
    (uncons$Snap$Slice$usize$__$TY$__Snap$Slice$usize$Seq$$int$<Seq<Int>> (cons$Snap$Slice$usize$__$TY$__Seq$$int$$Snap$Slice$usize<Snap$Slice$usize> data))
    data)
  :pattern ((cons$Snap$Slice$usize$__$TY$__Seq$$int$$Snap$Slice$usize<Snap$Slice$usize> data))
  :qid |prog.Snap$Slice$usize$injectivity|)))
(assert (forall ((data Snap$Slice$usize)) (!
  (=
    (cons$Snap$Slice$usize$__$TY$__Seq$$int$$Snap$Slice$usize<Snap$Slice$usize> (uncons$Snap$Slice$usize$__$TY$__Snap$Slice$usize$Seq$$int$<Seq<Int>> data))
    data)
  :pattern ((uncons$Snap$Slice$usize$__$TY$__Snap$Slice$usize$Seq$$int$<Seq<Int>> data))
  :qid |prog.Snap$Slice$usize$surjectivity|)))
(assert (forall ((_l_data Seq<Int>) (_r_data Seq<Int>)) (!
  (=>
    (Seq_equal _l_data _r_data)
    (=
      (cons$Snap$Slice$usize$__$TY$__Seq$$int$$Snap$Slice$usize<Snap$Slice$usize> _l_data)
      (cons$Snap$Slice$usize$__$TY$__Seq$$int$$Snap$Slice$usize<Snap$Slice$usize> _r_data)))
  :pattern ((cons$Snap$Slice$usize$__$TY$__Seq$$int$$Snap$Slice$usize<Snap$Slice$usize> _l_data) (cons$Snap$Slice$usize$__$TY$__Seq$$int$$Snap$Slice$usize<Snap$Slice$usize> _r_data))
  :qid |prog.Snap$Slice$usize$extensionality|)))
(assert (forall ((data Seq<Int>) (idx Int)) (!
  (=
    (read$Snap$Slice$usize$__$TY$__Snap$Slice$usize$$int$$$int$<Int> (cons$Snap$Slice$usize$__$TY$__Seq$$int$$Snap$Slice$usize<Snap$Slice$usize> data) idx)
    (Seq_index data idx))
  :pattern ((read$Snap$Slice$usize$__$TY$__Snap$Slice$usize$$int$$$int$<Int> (cons$Snap$Slice$usize$__$TY$__Seq$$int$$Snap$Slice$usize<Snap$Slice$usize> data) idx))
  :pattern ((Seq_index data idx))
  :qid |prog.Slice$usize$read_indices|)))
(assert (forall ((data Seq<Int>)) (!
  (=
    (len$Snap$Slice$usize$__$TY$__Snap$Slice$usize$$int$<Int> (cons$Snap$Slice$usize$__$TY$__Seq$$int$$Snap$Slice$usize<Snap$Slice$usize> data))
    (Seq_length data))
  :pattern ((len$Snap$Slice$usize$__$TY$__Snap$Slice$usize$$int$<Int> (cons$Snap$Slice$usize$__$TY$__Seq$$int$$Snap$Slice$usize<Snap$Slice$usize> data)))
  :pattern ((Seq_length data))
  :qid |prog.Slice$usize$len_of_seq|)))
(assert (forall ((slice Snap$Slice$usize)) (!
  (>= (len$Snap$Slice$usize$__$TY$__Snap$Slice$usize$$int$<Int> slice) 0)
  :pattern ((len$Snap$Slice$usize$__$TY$__Snap$Slice$usize$$int$<Int> slice))
  :qid |prog.Slice$usize$len_positive|)))
(assert (forall ((slice Snap$Slice$usize)) (!
  (<=
    (* (len$Snap$Slice$usize$__$TY$__Snap$Slice$usize$$int$<Int> slice) 8)
    9223372036854775807)
  :pattern ((len$Snap$Slice$usize$__$TY$__Snap$Slice$usize$$int$<Int> slice))
  :qid |prog.Slice$usize$len_upper_bound|)))
(assert (forall ((self Snap$Slice$usize) (idx Int)) (!
  (and
    (<=
      0
      (read$Snap$Slice$usize$__$TY$__Snap$Slice$usize$$int$$$int$<Int> self idx))
    (<=
      (read$Snap$Slice$usize$__$TY$__Snap$Slice$usize$$int$$$int$<Int> self idx)
      18446744073709551615))
  :pattern ((read$Snap$Slice$usize$__$TY$__Snap$Slice$usize$$int$$$int$<Int> self idx))
  :qid |prog.Snap$Slice$usize$valid|)))
(assert (forall ((data Seq<Int>)) (!
  (Seq_equal
    (uncons$Snap$Array$64$usize$__$TY$__Snap$Array$64$usize$Seq$$int$<Seq<Int>> (cons$Snap$Array$64$usize$__$TY$__Seq$$int$$Snap$Array$64$usize<Snap$Array$64$usize> data))
    data)
  :pattern ((cons$Snap$Array$64$usize$__$TY$__Seq$$int$$Snap$Array$64$usize<Snap$Array$64$usize> data))
  :qid |prog.Snap$Array$64$usize$injectivity|)))
(assert (forall ((data Snap$Array$64$usize)) (!
  (=
    (cons$Snap$Array$64$usize$__$TY$__Seq$$int$$Snap$Array$64$usize<Snap$Array$64$usize> (uncons$Snap$Array$64$usize$__$TY$__Snap$Array$64$usize$Seq$$int$<Seq<Int>> data))
    data)
  :pattern ((uncons$Snap$Array$64$usize$__$TY$__Snap$Array$64$usize$Seq$$int$<Seq<Int>> data))
  :qid |prog.Snap$Array$64$usize$surjectivity|)))
(assert (forall ((_l_data Seq<Int>) (_r_data Seq<Int>)) (!
  (=>
    (Seq_equal _l_data _r_data)
    (=
      (cons$Snap$Array$64$usize$__$TY$__Seq$$int$$Snap$Array$64$usize<Snap$Array$64$usize> _l_data)
      (cons$Snap$Array$64$usize$__$TY$__Seq$$int$$Snap$Array$64$usize<Snap$Array$64$usize> _r_data)))
  :pattern ((cons$Snap$Array$64$usize$__$TY$__Seq$$int$$Snap$Array$64$usize<Snap$Array$64$usize> _l_data) (cons$Snap$Array$64$usize$__$TY$__Seq$$int$$Snap$Array$64$usize<Snap$Array$64$usize> _r_data))
  :qid |prog.Snap$Array$64$usize$extensionality|)))
(assert (forall ((data Seq<Int>) (idx Int)) (!
  (=
    (read$Snap$Array$64$usize$__$TY$__Snap$Array$64$usize$$int$$$int$<Int> (cons$Snap$Array$64$usize$__$TY$__Seq$$int$$Snap$Array$64$usize<Snap$Array$64$usize> data) idx)
    (Seq_index data idx))
  :pattern ((read$Snap$Array$64$usize$__$TY$__Snap$Array$64$usize$$int$$$int$<Int> (cons$Snap$Array$64$usize$__$TY$__Seq$$int$$Snap$Array$64$usize<Snap$Array$64$usize> data) idx))
  :pattern ((Seq_index data idx))
  :qid |prog.Array$64$usize$read_indices|)))
(assert (forall ((self Snap$Array$64$usize) (idx Int)) (!
  (and
    (<=
      0
      (read$Snap$Array$64$usize$__$TY$__Snap$Array$64$usize$$int$$$int$<Int> self idx))
    (<=
      (read$Snap$Array$64$usize$__$TY$__Snap$Array$64$usize$$int$$$int$<Int> self idx)
      18446744073709551615))
  :pattern ((read$Snap$Array$64$usize$__$TY$__Snap$Array$64$usize$$int$$$int$<Int> self idx))
  :qid |prog.Snap$Array$64$usize$valid|)))
(assert (forall ((_l_0 Int) (_l_1 Int) (_l_2 Snap$Array$64$usize) (_l_3 Snap$Array$64$usize) (_r_0 Int) (_r_1 Int) (_r_2 Snap$Array$64$usize) (_r_3 Snap$Array$64$usize)) (!
  (=>
    (=
      (cons$0$__$TY$__Snap$struct$m_Path$$int$$$int$$Snap$Array$64$usize$Snap$Array$64$usize$Snap$struct$m_Path<Snap$struct$m_Path> _l_0 _l_1 _l_2 _l_3)
      (cons$0$__$TY$__Snap$struct$m_Path$$int$$$int$$Snap$Array$64$usize$Snap$Array$64$usize$Snap$struct$m_Path<Snap$struct$m_Path> _r_0 _r_1 _r_2 _r_3))
    (and (= _l_0 _r_0) (and (= _l_1 _r_1) (and (= _l_2 _r_2) (= _l_3 _r_3)))))
  :pattern ((cons$0$__$TY$__Snap$struct$m_Path$$int$$$int$$Snap$Array$64$usize$Snap$Array$64$usize$Snap$struct$m_Path<Snap$struct$m_Path> _l_0 _l_1 _l_2 _l_3) (cons$0$__$TY$__Snap$struct$m_Path$$int$$$int$$Snap$Array$64$usize$Snap$Array$64$usize$Snap$struct$m_Path<Snap$struct$m_Path> _r_0 _r_1 _r_2 _r_3))
  :qid |prog.Snap$struct$m_Path$0$injectivity|)))
(assert (forall ((_0 Int) (_1 Int) (_2 Snap$Array$64$usize) (_3 Snap$Array$64$usize)) (!
  (=
    (Snap$struct$m_Path$0$field$f$current__$TY$__Snap$struct$m_Path$$int$<Int> (cons$0$__$TY$__Snap$struct$m_Path$$int$$$int$$Snap$Array$64$usize$Snap$Array$64$usize$Snap$struct$m_Path<Snap$struct$m_Path> _0 _1 _2 _3))
    _0)
  :pattern ((Snap$struct$m_Path$0$field$f$current__$TY$__Snap$struct$m_Path$$int$<Int> (cons$0$__$TY$__Snap$struct$m_Path$$int$$$int$$Snap$Array$64$usize$Snap$Array$64$usize$Snap$struct$m_Path<Snap$struct$m_Path> _0 _1 _2 _3)))
  :qid |prog.Snap$struct$m_Path$0$field$f$current$axiom|)))
(assert (forall ((self Snap$struct$m_Path)) (!
  (and
    (<=
      0
      (Snap$struct$m_Path$0$field$f$current__$TY$__Snap$struct$m_Path$$int$<Int> self))
    (<=
      (Snap$struct$m_Path$0$field$f$current__$TY$__Snap$struct$m_Path$$int$<Int> self)
      18446744073709551615))
  :pattern ((Snap$struct$m_Path$0$field$f$current__$TY$__Snap$struct$m_Path$$int$<Int> self))
  :qid |prog.Snap$struct$m_Path$0$field$f$current$valid|)))
(assert (forall ((_0 Int) (_1 Int) (_2 Snap$Array$64$usize) (_3 Snap$Array$64$usize)) (!
  (=
    (Snap$struct$m_Path$0$field$f$depth__$TY$__Snap$struct$m_Path$$int$<Int> (cons$0$__$TY$__Snap$struct$m_Path$$int$$$int$$Snap$Array$64$usize$Snap$Array$64$usize$Snap$struct$m_Path<Snap$struct$m_Path> _0 _1 _2 _3))
    _1)
  :pattern ((Snap$struct$m_Path$0$field$f$depth__$TY$__Snap$struct$m_Path$$int$<Int> (cons$0$__$TY$__Snap$struct$m_Path$$int$$$int$$Snap$Array$64$usize$Snap$Array$64$usize$Snap$struct$m_Path<Snap$struct$m_Path> _0 _1 _2 _3)))
  :qid |prog.Snap$struct$m_Path$0$field$f$depth$axiom|)))
(assert (forall ((self Snap$struct$m_Path)) (!
  (and
    (<=
      0
      (Snap$struct$m_Path$0$field$f$depth__$TY$__Snap$struct$m_Path$$int$<Int> self))
    (<=
      (Snap$struct$m_Path$0$field$f$depth__$TY$__Snap$struct$m_Path$$int$<Int> self)
      18446744073709551615))
  :pattern ((Snap$struct$m_Path$0$field$f$depth__$TY$__Snap$struct$m_Path$$int$<Int> self))
  :qid |prog.Snap$struct$m_Path$0$field$f$depth$valid|)))
(assert (forall ((_0 Int) (_1 Int) (_2 Snap$Array$64$usize) (_3 Snap$Array$64$usize)) (!
  (=
    (Snap$struct$m_Path$0$field$f$entries__$TY$__Snap$struct$m_Path$Snap$Array$64$usize<Snap$Array$64$usize> (cons$0$__$TY$__Snap$struct$m_Path$$int$$$int$$Snap$Array$64$usize$Snap$Array$64$usize$Snap$struct$m_Path<Snap$struct$m_Path> _0 _1 _2 _3))
    _2)
  :pattern ((Snap$struct$m_Path$0$field$f$entries__$TY$__Snap$struct$m_Path$Snap$Array$64$usize<Snap$Array$64$usize> (cons$0$__$TY$__Snap$struct$m_Path$$int$$$int$$Snap$Array$64$usize$Snap$Array$64$usize$Snap$struct$m_Path<Snap$struct$m_Path> _0 _1 _2 _3)))
  :qid |prog.Snap$struct$m_Path$0$field$f$entries$axiom|)))
(assert (forall ((_0 Int) (_1 Int) (_2 Snap$Array$64$usize) (_3 Snap$Array$64$usize)) (!
  (=
    (Snap$struct$m_Path$0$field$f$max_counts__$TY$__Snap$struct$m_Path$Snap$Array$64$usize<Snap$Array$64$usize> (cons$0$__$TY$__Snap$struct$m_Path$$int$$$int$$Snap$Array$64$usize$Snap$Array$64$usize$Snap$struct$m_Path<Snap$struct$m_Path> _0 _1 _2 _3))
    _3)
  :pattern ((Snap$struct$m_Path$0$field$f$max_counts__$TY$__Snap$struct$m_Path$Snap$Array$64$usize<Snap$Array$64$usize> (cons$0$__$TY$__Snap$struct$m_Path$$int$$$int$$Snap$Array$64$usize$Snap$Array$64$usize$Snap$struct$m_Path<Snap$struct$m_Path> _0 _1 _2 _3)))
  :qid |prog.Snap$struct$m_Path$0$field$f$max_counts$axiom|)))
; /field_value_functions_axioms.smt2 [f$entries: Ref]
(assert (forall ((vs $FVF<f$entries>) (ws $FVF<f$entries>)) (!
    (=>
      (and
        (Set_equal ($FVF.domain_f$entries vs) ($FVF.domain_f$entries ws))
        (forall ((x $Ref)) (!
          (=>
            (Set_in x ($FVF.domain_f$entries vs))
            (= ($FVF.lookup_f$entries vs x) ($FVF.lookup_f$entries ws x)))
          :pattern (($FVF.lookup_f$entries vs x) ($FVF.lookup_f$entries ws x))
          :qid |qp.$FVF<f$entries>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$FVF<f$entries>To$Snap vs)
              ($SortWrappers.$FVF<f$entries>To$Snap ws)
              )
    :qid |qp.$FVF<f$entries>-eq-outer|
    )))
(assert (forall ((r $Ref) (pm $FPM)) (!
    ($Perm.isValidVar ($FVF.perm_f$entries pm r))
    :pattern (($FVF.perm_f$entries pm r)))))
(assert (forall ((r $Ref) (f $Ref)) (!
    (= ($FVF.loc_f$entries f r) true)
    :pattern (($FVF.loc_f$entries f r)))))
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
  :qid |quant-u-18|)))
(assert (forall ((s@$ $Snap)) (!
  (let ((result@0@00 (read$%limited s@$))) true)
  :pattern ((read$%limited s@$))
  :qid |quant-u-19|)))
(assert (forall ((s@$ $Snap)) (!
  (let ((result@0@00 (read$%limited s@$))) true)
  :pattern ((read$%limited s@$))
  :qid |quant-u-20|)))
(assert (forall ((s@$ $Snap) (self@1@00 $Ref) (idx@2@00 Int)) (!
  (=
    (lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$%limited s@$ self@1@00 idx@2@00)
    (lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$ s@$ self@1@00 idx@2@00))
  :pattern ((lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$ s@$ self@1@00 idx@2@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (self@1@00 $Ref) (idx@2@00 Int)) (!
  (lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$%stateless self@1@00 idx@2@00)
  :pattern ((lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$%limited s@$ self@1@00 idx@2@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (self@4@00 $Ref) (start@5@00 Int)) (!
  (Seq_equal
    (seq_collect$Array$64$usize$__$TY$__Array$64$usize$$int$$Seq$$int$%limited s@$ self@4@00 start@5@00)
    (seq_collect$Array$64$usize$__$TY$__Array$64$usize$$int$$Seq$$int$ s@$ self@4@00 start@5@00))
  :pattern ((seq_collect$Array$64$usize$__$TY$__Array$64$usize$$int$$Seq$$int$ s@$ self@4@00 start@5@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (self@4@00 $Ref) (start@5@00 Int)) (!
  (seq_collect$Array$64$usize$__$TY$__Array$64$usize$$int$$Seq$$int$%stateless self@4@00 start@5@00)
  :pattern ((seq_collect$Array$64$usize$__$TY$__Array$64$usize$$int$$Seq$$int$%limited s@$ self@4@00 start@5@00))
  :qid |quant-u-5|)))
(assert (forall ((s@$ $Snap) (self@4@00 $Ref) (start@5@00 Int)) (!
  (let ((result@6@00 (seq_collect$Array$64$usize$__$TY$__Array$64$usize$$int$$Seq$$int$%limited s@$ self@4@00 start@5@00))) (=>
    (seq_collect$Array$64$usize$__$TY$__Array$64$usize$$int$$Seq$$int$%precondition s@$ self@4@00 start@5@00)
    (and
      (=> (>= start@5@00 64) (Seq_equal result@6@00 (as Seq_empty  Seq<Int>)))
      (=> (< start@5@00 64) (= (Seq_length result@6@00) (- 64 start@5@00)))
      (=>
        (< start@5@00 64)
        (=
          (Seq_index result@6@00 0)
          (lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$ ($Snap.combine
            ($Snap.first s@$)
            ($Snap.combine $Snap.unit $Snap.unit)) self@4@00 start@5@00)))
      (=>
        (< start@5@00 64)
        (forall ((i Int) (j Int)) (!
          (=>
            (and
              (<= start@5@00 i)
              (and
                (< i 64)
                (and
                  (<= 0 j)
                  (and (< j (- 64 start@5@00)) (= i (+ j start@5@00))))))
            (=
              (lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$ ($Snap.combine
                ($Snap.first s@$)
                ($Snap.combine $Snap.unit $Snap.unit)) self@4@00 i)
              (Seq_index result@6@00 j)))
          :pattern ((lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$%limited ($Snap.combine
            ($Snap.first s@$)
            ($Snap.combine $Snap.unit $Snap.unit)) self@4@00 i) (Seq_index
            result@6@00
            j))
          ))))))
  :pattern ((seq_collect$Array$64$usize$__$TY$__Array$64$usize$$int$$Seq$$int$%limited s@$ self@4@00 start@5@00))
  :qid |quant-u-21|)))
(assert (forall ((s@$ $Snap) (self@4@00 $Ref) (start@5@00 Int)) (!
  (let ((result@6@00 (seq_collect$Array$64$usize$__$TY$__Array$64$usize$$int$$Seq$$int$%limited s@$ self@4@00 start@5@00))) true)
  :pattern ((seq_collect$Array$64$usize$__$TY$__Array$64$usize$$int$$Seq$$int$%limited s@$ self@4@00 start@5@00))
  :qid |quant-u-22|)))
(assert (forall ((s@$ $Snap) (self@4@00 $Ref) (start@5@00 Int)) (!
  (let ((result@6@00 (seq_collect$Array$64$usize$__$TY$__Array$64$usize$$int$$Seq$$int$%limited s@$ self@4@00 start@5@00))) true)
  :pattern ((seq_collect$Array$64$usize$__$TY$__Array$64$usize$$int$$Seq$$int$%limited s@$ self@4@00 start@5@00))
  :qid |quant-u-23|)))
(assert (forall ((s@$ $Snap) (self@4@00 $Ref) (start@5@00 Int)) (!
  (let ((result@6@00 (seq_collect$Array$64$usize$__$TY$__Array$64$usize$$int$$Seq$$int$%limited s@$ self@4@00 start@5@00))) (=>
    (and
      (seq_collect$Array$64$usize$__$TY$__Array$64$usize$$int$$Seq$$int$%precondition s@$ self@4@00 start@5@00)
      (< start@5@00 64))
    (lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$%precondition ($Snap.combine
      ($Snap.first s@$)
      ($Snap.combine $Snap.unit $Snap.unit)) self@4@00 start@5@00)))
  :pattern ((seq_collect$Array$64$usize$__$TY$__Array$64$usize$$int$$Seq$$int$%limited s@$ self@4@00 start@5@00))
  :qid |quant-u-24|)))
(assert (forall ((s@$ $Snap) (self@4@00 $Ref) (start@5@00 Int)) (!
  (let ((result@6@00 (seq_collect$Array$64$usize$__$TY$__Array$64$usize$$int$$Seq$$int$%limited s@$ self@4@00 start@5@00))) (=>
    (and
      (seq_collect$Array$64$usize$__$TY$__Array$64$usize$$int$$Seq$$int$%precondition s@$ self@4@00 start@5@00)
      (< start@5@00 64))
    (forall ((i Int) (j Int)) (!
      (=>
        (and
          (<= start@5@00 i)
          (and
            (< i 64)
            (and (<= 0 j) (and (< j (- 64 start@5@00)) (= i (+ j start@5@00))))))
        (lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$%precondition ($Snap.combine
          ($Snap.first s@$)
          ($Snap.combine $Snap.unit $Snap.unit)) self@4@00 i))
      :pattern ((lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$%limited ($Snap.combine
        ($Snap.first s@$)
        ($Snap.combine $Snap.unit $Snap.unit)) self@4@00 i) (Seq_index
        result@6@00
        j))
      ))))
  :pattern ((seq_collect$Array$64$usize$__$TY$__Array$64$usize$$int$$Seq$$int$%limited s@$ self@4@00 start@5@00))
  :qid |quant-u-25|)))
(assert (forall ((s@$ $Snap) (self@4@00 $Ref) (start@5@00 Int)) (!
  (=>
    (seq_collect$Array$64$usize$__$TY$__Array$64$usize$$int$$Seq$$int$%precondition s@$ self@4@00 start@5@00)
    (Seq_equal
      (seq_collect$Array$64$usize$__$TY$__Array$64$usize$$int$$Seq$$int$ s@$ self@4@00 start@5@00)
      (ite
        (>= start@5@00 64)
        (as Seq_empty  Seq<Int>)
        (Seq_append
          (Seq_singleton (lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$ ($Snap.combine
            ($Snap.first s@$)
            ($Snap.combine $Snap.unit $Snap.unit)) self@4@00 start@5@00))
          (seq_collect$Array$64$usize$__$TY$__Array$64$usize$$int$$Seq$$int$%limited ($Snap.combine
            ($Snap.first s@$)
            $Snap.unit) self@4@00 (+ start@5@00 1))))))
  :pattern ((seq_collect$Array$64$usize$__$TY$__Array$64$usize$$int$$Seq$$int$ s@$ self@4@00 start@5@00))
  :qid |quant-u-26|)))
(assert (forall ((s@$ $Snap) (self@4@00 $Ref) (start@5@00 Int)) (!
  (=>
    (seq_collect$Array$64$usize$__$TY$__Array$64$usize$$int$$Seq$$int$%precondition s@$ self@4@00 start@5@00)
    (ite
      (>= start@5@00 64)
      true
      (and
        (lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$%precondition ($Snap.combine
          ($Snap.first s@$)
          ($Snap.combine $Snap.unit $Snap.unit)) self@4@00 start@5@00)
        (seq_collect$Array$64$usize$__$TY$__Array$64$usize$$int$$Seq$$int$%precondition ($Snap.combine
          ($Snap.first s@$)
          $Snap.unit) self@4@00 (+ start@5@00 1)))))
  :pattern ((seq_collect$Array$64$usize$__$TY$__Array$64$usize$$int$$Seq$$int$ s@$ self@4@00 start@5@00))
  :qid |quant-u-27|)))
(assert (forall ((s@$ $Snap) (self@7@00 $Ref)) (!
  (=
    (Slice$len__$TY$__usize$Slice$usize$$int$%limited s@$ self@7@00)
    (Slice$len__$TY$__usize$Slice$usize$$int$ s@$ self@7@00))
  :pattern ((Slice$len__$TY$__usize$Slice$usize$$int$ s@$ self@7@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (self@7@00 $Ref)) (!
  (Slice$len__$TY$__usize$Slice$usize$$int$%stateless self@7@00)
  :pattern ((Slice$len__$TY$__usize$Slice$usize$$int$%limited s@$ self@7@00))
  :qid |quant-u-7|)))
(assert (forall ((s@$ $Snap) (self@7@00 $Ref)) (!
  (let ((result@8@00 (Slice$len__$TY$__usize$Slice$usize$$int$%limited s@$ self@7@00))) (=>
    (Slice$len__$TY$__usize$Slice$usize$$int$%precondition s@$ self@7@00)
    (and (>= result@8@00 0) (<= result@8@00 18446744073709551615))))
  :pattern ((Slice$len__$TY$__usize$Slice$usize$$int$%limited s@$ self@7@00))
  :qid |quant-u-28|)))
(assert (forall ((s@$ $Snap) (self@7@00 $Ref)) (!
  (let ((result@8@00 (Slice$len__$TY$__usize$Slice$usize$$int$%limited s@$ self@7@00))) true)
  :pattern ((Slice$len__$TY$__usize$Slice$usize$$int$%limited s@$ self@7@00))
  :qid |quant-u-29|)))
(assert (forall ((s@$ $Snap) (self@7@00 $Ref)) (!
  (let ((result@8@00 (Slice$len__$TY$__usize$Slice$usize$$int$%limited s@$ self@7@00))) true)
  :pattern ((Slice$len__$TY$__usize$Slice$usize$$int$%limited s@$ self@7@00))
  :qid |quant-u-30|)))
(assert (forall ((s@$ $Snap) (self@9@00 $Ref)) (!
  (=
    (snap$__$TY$__Snap$Array$64$usize$Array$64$usize$Snap$Array$64$usize%limited s@$ self@9@00)
    (snap$__$TY$__Snap$Array$64$usize$Array$64$usize$Snap$Array$64$usize s@$ self@9@00))
  :pattern ((snap$__$TY$__Snap$Array$64$usize$Array$64$usize$Snap$Array$64$usize s@$ self@9@00))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap) (self@9@00 $Ref)) (!
  (snap$__$TY$__Snap$Array$64$usize$Array$64$usize$Snap$Array$64$usize%stateless self@9@00)
  :pattern ((snap$__$TY$__Snap$Array$64$usize$Array$64$usize$Snap$Array$64$usize%limited s@$ self@9@00))
  :qid |quant-u-9|)))
(assert (forall ((s@$ $Snap) (self@9@00 $Ref)) (!
  (let ((result@10@00 (snap$__$TY$__Snap$Array$64$usize$Array$64$usize$Snap$Array$64$usize%limited s@$ self@9@00))) (=>
    (snap$__$TY$__Snap$Array$64$usize$Array$64$usize$Snap$Array$64$usize%precondition s@$ self@9@00)
    (forall ((i Int)) (!
      (=>
        (and (<= 0 i) (< i 64))
        (=
          (read$Snap$Array$64$usize$__$TY$__Snap$Array$64$usize$$int$$$int$<Int> result@10@00 i)
          (lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$ ($Snap.combine
            s@$
            ($Snap.combine $Snap.unit $Snap.unit)) self@9@00 i)))
      :pattern ((read$Snap$Array$64$usize$__$TY$__Snap$Array$64$usize$$int$$$int$<Int> result@10@00 i))
      :pattern ((lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$%limited ($Snap.combine
        s@$
        ($Snap.combine $Snap.unit $Snap.unit)) self@9@00 i))
      ))))
  :pattern ((snap$__$TY$__Snap$Array$64$usize$Array$64$usize$Snap$Array$64$usize%limited s@$ self@9@00))
  :qid |quant-u-31|)))
(assert (forall ((s@$ $Snap) (self@9@00 $Ref)) (!
  (let ((result@10@00 (snap$__$TY$__Snap$Array$64$usize$Array$64$usize$Snap$Array$64$usize%limited s@$ self@9@00))) (=>
    (snap$__$TY$__Snap$Array$64$usize$Array$64$usize$Snap$Array$64$usize%precondition s@$ self@9@00)
    (forall ((i Int)) (!
      (=>
        (and (<= 0 i) (< i 64))
        (lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$%precondition ($Snap.combine
          s@$
          ($Snap.combine $Snap.unit $Snap.unit)) self@9@00 i))
      :pattern ((read$Snap$Array$64$usize$__$TY$__Snap$Array$64$usize$$int$$$int$<Int> result@10@00 i))
      :pattern ((lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$%limited ($Snap.combine
        s@$
        ($Snap.combine $Snap.unit $Snap.unit)) self@9@00 i))
      ))))
  :pattern ((snap$__$TY$__Snap$Array$64$usize$Array$64$usize$Snap$Array$64$usize%limited s@$ self@9@00))
  :qid |quant-u-32|)))
(assert (forall ((s@$ $Snap) (self@9@00 $Ref)) (!
  (=>
    (snap$__$TY$__Snap$Array$64$usize$Array$64$usize$Snap$Array$64$usize%precondition s@$ self@9@00)
    (=
      (snap$__$TY$__Snap$Array$64$usize$Array$64$usize$Snap$Array$64$usize s@$ self@9@00)
      (cons$Snap$Array$64$usize$__$TY$__Seq$$int$$Snap$Array$64$usize<Snap$Array$64$usize> (seq_collect$Array$64$usize$__$TY$__Array$64$usize$$int$$Seq$$int$ ($Snap.combine
        s@$
        $Snap.unit) self@9@00 0))))
  :pattern ((snap$__$TY$__Snap$Array$64$usize$Array$64$usize$Snap$Array$64$usize s@$ self@9@00))
  :qid |quant-u-33|)))
(assert (forall ((s@$ $Snap) (self@9@00 $Ref)) (!
  (=>
    (snap$__$TY$__Snap$Array$64$usize$Array$64$usize$Snap$Array$64$usize%precondition s@$ self@9@00)
    (seq_collect$Array$64$usize$__$TY$__Array$64$usize$$int$$Seq$$int$%precondition ($Snap.combine
      s@$
      $Snap.unit) self@9@00 0))
  :pattern ((snap$__$TY$__Snap$Array$64$usize$Array$64$usize$Snap$Array$64$usize s@$ self@9@00))
  :qid |quant-u-34|)))
(assert (forall ((s@$ $Snap) (array@11@00 Snap$Array$64$usize)) (!
  (=
    (builtin$unsize$Array$64$usize$Slice$usize__$TY$__Snap$Array$64$usize$Snap$Slice$usize%limited s@$ array@11@00)
    (builtin$unsize$Array$64$usize$Slice$usize__$TY$__Snap$Array$64$usize$Snap$Slice$usize s@$ array@11@00))
  :pattern ((builtin$unsize$Array$64$usize$Slice$usize__$TY$__Snap$Array$64$usize$Snap$Slice$usize s@$ array@11@00))
  :qid |quant-u-10|)))
(assert (forall ((s@$ $Snap) (array@11@00 Snap$Array$64$usize)) (!
  (builtin$unsize$Array$64$usize$Slice$usize__$TY$__Snap$Array$64$usize$Snap$Slice$usize%stateless array@11@00)
  :pattern ((builtin$unsize$Array$64$usize$Slice$usize__$TY$__Snap$Array$64$usize$Snap$Slice$usize%limited s@$ array@11@00))
  :qid |quant-u-11|)))
(assert (forall ((s@$ $Snap) (array@11@00 Snap$Array$64$usize)) (!
  (let ((result@12@00 (builtin$unsize$Array$64$usize$Slice$usize__$TY$__Snap$Array$64$usize$Snap$Slice$usize%limited s@$ array@11@00))) (=>
    (builtin$unsize$Array$64$usize$Slice$usize__$TY$__Snap$Array$64$usize$Snap$Slice$usize%precondition s@$ array@11@00)
    (and
      (=
        (Seq_length
          (uncons$Snap$Array$64$usize$__$TY$__Snap$Array$64$usize$Seq$$int$<Seq<Int>> array@11@00))
        64)
      (=
        result@12@00
        (cons$Snap$Slice$usize$__$TY$__Seq$$int$$Snap$Slice$usize<Snap$Slice$usize> (uncons$Snap$Array$64$usize$__$TY$__Snap$Array$64$usize$Seq$$int$<Seq<Int>> array@11@00))))))
  :pattern ((builtin$unsize$Array$64$usize$Slice$usize__$TY$__Snap$Array$64$usize$Snap$Slice$usize%limited s@$ array@11@00))
  :qid |quant-u-35|)))
(assert (forall ((s@$ $Snap) (array@11@00 Snap$Array$64$usize)) (!
  (let ((result@12@00 (builtin$unsize$Array$64$usize$Slice$usize__$TY$__Snap$Array$64$usize$Snap$Slice$usize%limited s@$ array@11@00))) true)
  :pattern ((builtin$unsize$Array$64$usize$Slice$usize__$TY$__Snap$Array$64$usize$Snap$Slice$usize%limited s@$ array@11@00))
  :qid |quant-u-36|)))
(assert (forall ((s@$ $Snap) (array@11@00 Snap$Array$64$usize)) (!
  (let ((result@12@00 (builtin$unsize$Array$64$usize$Slice$usize__$TY$__Snap$Array$64$usize$Snap$Slice$usize%limited s@$ array@11@00))) true)
  :pattern ((builtin$unsize$Array$64$usize$Slice$usize__$TY$__Snap$Array$64$usize$Snap$Slice$usize%limited s@$ array@11@00))
  :qid |quant-u-37|)))
(assert (forall ((s@$ $Snap) (self@13@00 $Ref) (idx@14@00 Int)) (!
  (=
    (lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$%limited s@$ self@13@00 idx@14@00)
    (lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$ s@$ self@13@00 idx@14@00))
  :pattern ((lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$ s@$ self@13@00 idx@14@00))
  :qid |quant-u-12|)))
(assert (forall ((s@$ $Snap) (self@13@00 $Ref) (idx@14@00 Int)) (!
  (lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$%stateless self@13@00 idx@14@00)
  :pattern ((lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$%limited s@$ self@13@00 idx@14@00))
  :qid |quant-u-13|)))
(assert (forall ((s@$ $Snap) (self@16@00 $Ref)) (!
  (=
    (snap$__$TY$__Snap$struct$m_Path$struct$m_Path$Snap$struct$m_Path%limited s@$ self@16@00)
    (snap$__$TY$__Snap$struct$m_Path$struct$m_Path$Snap$struct$m_Path s@$ self@16@00))
  :pattern ((snap$__$TY$__Snap$struct$m_Path$struct$m_Path$Snap$struct$m_Path s@$ self@16@00))
  :qid |quant-u-14|)))
(assert (forall ((s@$ $Snap) (self@16@00 $Ref)) (!
  (snap$__$TY$__Snap$struct$m_Path$struct$m_Path$Snap$struct$m_Path%stateless self@16@00)
  :pattern ((snap$__$TY$__Snap$struct$m_Path$struct$m_Path$Snap$struct$m_Path%limited s@$ self@16@00))
  :qid |quant-u-15|)))
(assert (forall ((s@$ $Snap) (self@16@00 $Ref)) (!
  (=>
    (snap$__$TY$__Snap$struct$m_Path$struct$m_Path$Snap$struct$m_Path%precondition s@$ self@16@00)
    (=
      (snap$__$TY$__Snap$struct$m_Path$struct$m_Path$Snap$struct$m_Path s@$ self@16@00)
      (cons$0$__$TY$__Snap$struct$m_Path$$int$$$int$$Snap$Array$64$usize$Snap$Array$64$usize$Snap$struct$m_Path<Snap$struct$m_Path> ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.second s@$)))) ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$)))))) (snap$__$TY$__Snap$Array$64$usize$Array$64$usize$Snap$Array$64$usize ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))) (snap$__$TY$__Snap$Array$64$usize$Array$64$usize$Snap$Array$64$usize ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))))
  :pattern ((snap$__$TY$__Snap$struct$m_Path$struct$m_Path$Snap$struct$m_Path s@$ self@16@00))
  :pattern ((snap$__$TY$__Snap$struct$m_Path$struct$m_Path$Snap$struct$m_Path%stateless self@16@00) (struct$m_Path%trigger s@$ self@16@00))
  :qid |quant-u-38|)))
(assert (forall ((s@$ $Snap) (self@16@00 $Ref)) (!
  (=>
    (snap$__$TY$__Snap$struct$m_Path$struct$m_Path$Snap$struct$m_Path%precondition s@$ self@16@00)
    (and
      (snap$__$TY$__Snap$Array$64$usize$Array$64$usize$Snap$Array$64$usize%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
      (snap$__$TY$__Snap$Array$64$usize$Array$64$usize$Snap$Array$64$usize%precondition ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))))
  :pattern ((snap$__$TY$__Snap$struct$m_Path$struct$m_Path$Snap$struct$m_Path s@$ self@16@00))
  :qid |quant-u-39|)))
(assert (forall ((s@$ $Snap) (_1@18@00 Snap$struct$m_Path)) (!
  (=
    (m_Path$$invariant__$TY$__Snap$struct$m_Path$$bool$%limited s@$ _1@18@00)
    (m_Path$$invariant__$TY$__Snap$struct$m_Path$$bool$ s@$ _1@18@00))
  :pattern ((m_Path$$invariant__$TY$__Snap$struct$m_Path$$bool$ s@$ _1@18@00))
  :qid |quant-u-16|)))
(assert (forall ((s@$ $Snap) (_1@18@00 Snap$struct$m_Path)) (!
  (m_Path$$invariant__$TY$__Snap$struct$m_Path$$bool$%stateless _1@18@00)
  :pattern ((m_Path$$invariant__$TY$__Snap$struct$m_Path$$bool$%limited s@$ _1@18@00))
  :qid |quant-u-17|)))
(assert (forall ((s@$ $Snap) (_1@18@00 Snap$struct$m_Path)) (!
  (let ((result@19@00 (m_Path$$invariant__$TY$__Snap$struct$m_Path$$bool$%limited s@$ _1@18@00))) (=>
    (m_Path$$invariant__$TY$__Snap$struct$m_Path$$bool$%precondition s@$ _1@18@00)
    (=
      result@19@00
      (mirror_simple$m_Path$$invariant__$TY$__Snap$struct$m_Path$$bool$<Bool> _1@18@00))))
  :pattern ((m_Path$$invariant__$TY$__Snap$struct$m_Path$$bool$%limited s@$ _1@18@00))
  :qid |quant-u-40|)))
(assert (forall ((s@$ $Snap) (_1@18@00 Snap$struct$m_Path)) (!
  (let ((result@19@00 (m_Path$$invariant__$TY$__Snap$struct$m_Path$$bool$%limited s@$ _1@18@00))) true)
  :pattern ((m_Path$$invariant__$TY$__Snap$struct$m_Path$$bool$%limited s@$ _1@18@00))
  :qid |quant-u-41|)))
(assert (forall ((s@$ $Snap) (_1@18@00 Snap$struct$m_Path)) (!
  (let ((result@19@00 (m_Path$$invariant__$TY$__Snap$struct$m_Path$$bool$%limited s@$ _1@18@00))) true)
  :pattern ((m_Path$$invariant__$TY$__Snap$struct$m_Path$$bool$%limited s@$ _1@18@00))
  :qid |quant-u-42|)))
(assert (forall ((s@$ $Snap) (_1@18@00 Snap$struct$m_Path)) (!
  (=>
    (m_Path$$invariant__$TY$__Snap$struct$m_Path$$bool$%precondition s@$ _1@18@00)
    (=
      (m_Path$$invariant__$TY$__Snap$struct$m_Path$$bool$ s@$ _1@18@00)
      (and
        (=>
          (not
            (=
              (len$Snap$Slice$usize$__$TY$__Snap$Slice$usize$$int$<Int> (builtin$unsize$Array$64$usize$Slice$usize__$TY$__Snap$Array$64$usize$Snap$Slice$usize $Snap.unit (Snap$struct$m_Path$0$field$f$entries__$TY$__Snap$struct$m_Path$Snap$Array$64$usize<Snap$Array$64$usize> _1@18@00)))
              64))
          false)
        (=>
          (=
            (len$Snap$Slice$usize$__$TY$__Snap$Slice$usize$$int$<Int> (builtin$unsize$Array$64$usize$Slice$usize__$TY$__Snap$Array$64$usize$Snap$Slice$usize $Snap.unit (Snap$struct$m_Path$0$field$f$entries__$TY$__Snap$struct$m_Path$Snap$Array$64$usize<Snap$Array$64$usize> _1@18@00)))
            64)
          (and
            (=>
              (not
                (=
                  (len$Snap$Slice$usize$__$TY$__Snap$Slice$usize$$int$<Int> (builtin$unsize$Array$64$usize$Slice$usize__$TY$__Snap$Array$64$usize$Snap$Slice$usize $Snap.unit (Snap$struct$m_Path$0$field$f$max_counts__$TY$__Snap$struct$m_Path$Snap$Array$64$usize<Snap$Array$64$usize> _1@18@00)))
                  64))
              false)
            (=>
              (=
                (len$Snap$Slice$usize$__$TY$__Snap$Slice$usize$$int$<Int> (builtin$unsize$Array$64$usize$Slice$usize__$TY$__Snap$Array$64$usize$Snap$Slice$usize $Snap.unit (Snap$struct$m_Path$0$field$f$max_counts__$TY$__Snap$struct$m_Path$Snap$Array$64$usize<Snap$Array$64$usize> _1@18@00)))
                64)
              (and
                (=>
                  (not
                    (=
                      (len$Snap$Slice$usize$__$TY$__Snap$Slice$usize$$int$<Int> (builtin$unsize$Array$64$usize$Slice$usize__$TY$__Snap$Array$64$usize$Snap$Slice$usize $Snap.unit (Snap$struct$m_Path$0$field$f$entries__$TY$__Snap$struct$m_Path$Snap$Array$64$usize<Snap$Array$64$usize> _1@18@00)))
                      (len$Snap$Slice$usize$__$TY$__Snap$Slice$usize$$int$<Int> (builtin$unsize$Array$64$usize$Slice$usize__$TY$__Snap$Array$64$usize$Snap$Slice$usize $Snap.unit (Snap$struct$m_Path$0$field$f$max_counts__$TY$__Snap$struct$m_Path$Snap$Array$64$usize<Snap$Array$64$usize> _1@18@00)))))
                  false)
                (=>
                  (=
                    (len$Snap$Slice$usize$__$TY$__Snap$Slice$usize$$int$<Int> (builtin$unsize$Array$64$usize$Slice$usize__$TY$__Snap$Array$64$usize$Snap$Slice$usize $Snap.unit (Snap$struct$m_Path$0$field$f$entries__$TY$__Snap$struct$m_Path$Snap$Array$64$usize<Snap$Array$64$usize> _1@18@00)))
                    (len$Snap$Slice$usize$__$TY$__Snap$Slice$usize$$int$<Int> (builtin$unsize$Array$64$usize$Slice$usize__$TY$__Snap$Array$64$usize$Snap$Slice$usize $Snap.unit (Snap$struct$m_Path$0$field$f$max_counts__$TY$__Snap$struct$m_Path$Snap$Array$64$usize<Snap$Array$64$usize> _1@18@00))))
                  (and
                    (=>
                      (not
                        (<
                          (Snap$struct$m_Path$0$field$f$current__$TY$__Snap$struct$m_Path$$int$<Int> _1@18@00)
                          64))
                      false)
                    (=>
                      (<
                        (Snap$struct$m_Path$0$field$f$current__$TY$__Snap$struct$m_Path$$int$<Int> _1@18@00)
                        64)
                      (and
                        (<
                          (Snap$struct$m_Path$0$field$f$depth__$TY$__Snap$struct$m_Path$$int$<Int> _1@18@00)
                          64)
                        (=>
                          (<
                            (Snap$struct$m_Path$0$field$f$depth__$TY$__Snap$struct$m_Path$$int$<Int> _1@18@00)
                            64)
                          (<=
                            (Snap$struct$m_Path$0$field$f$current__$TY$__Snap$struct$m_Path$$int$<Int> _1@18@00)
                            (Snap$struct$m_Path$0$field$f$depth__$TY$__Snap$struct$m_Path$$int$<Int> _1@18@00))))))))))))))
  :pattern ((m_Path$$invariant__$TY$__Snap$struct$m_Path$$bool$ s@$ _1@18@00))
  :qid |quant-u-43|)))
(assert (forall ((s@$ $Snap) (_1@18@00 Snap$struct$m_Path)) (!
  (=>
    (m_Path$$invariant__$TY$__Snap$struct$m_Path$$bool$%precondition s@$ _1@18@00)
    (and
      (builtin$unsize$Array$64$usize$Slice$usize__$TY$__Snap$Array$64$usize$Snap$Slice$usize%precondition $Snap.unit (Snap$struct$m_Path$0$field$f$entries__$TY$__Snap$struct$m_Path$Snap$Array$64$usize<Snap$Array$64$usize> _1@18@00))
      (=>
        (=>
          (not
            (=
              (len$Snap$Slice$usize$__$TY$__Snap$Slice$usize$$int$<Int> (builtin$unsize$Array$64$usize$Slice$usize__$TY$__Snap$Array$64$usize$Snap$Slice$usize $Snap.unit (Snap$struct$m_Path$0$field$f$entries__$TY$__Snap$struct$m_Path$Snap$Array$64$usize<Snap$Array$64$usize> _1@18@00)))
              64))
          false)
        (and
          (builtin$unsize$Array$64$usize$Slice$usize__$TY$__Snap$Array$64$usize$Snap$Slice$usize%precondition $Snap.unit (Snap$struct$m_Path$0$field$f$entries__$TY$__Snap$struct$m_Path$Snap$Array$64$usize<Snap$Array$64$usize> _1@18@00))
          (=>
            (=
              (len$Snap$Slice$usize$__$TY$__Snap$Slice$usize$$int$<Int> (builtin$unsize$Array$64$usize$Slice$usize__$TY$__Snap$Array$64$usize$Snap$Slice$usize $Snap.unit (Snap$struct$m_Path$0$field$f$entries__$TY$__Snap$struct$m_Path$Snap$Array$64$usize<Snap$Array$64$usize> _1@18@00)))
              64)
            (and
              (builtin$unsize$Array$64$usize$Slice$usize__$TY$__Snap$Array$64$usize$Snap$Slice$usize%precondition $Snap.unit (Snap$struct$m_Path$0$field$f$max_counts__$TY$__Snap$struct$m_Path$Snap$Array$64$usize<Snap$Array$64$usize> _1@18@00))
              (=>
                (=>
                  (not
                    (=
                      (len$Snap$Slice$usize$__$TY$__Snap$Slice$usize$$int$<Int> (builtin$unsize$Array$64$usize$Slice$usize__$TY$__Snap$Array$64$usize$Snap$Slice$usize $Snap.unit (Snap$struct$m_Path$0$field$f$max_counts__$TY$__Snap$struct$m_Path$Snap$Array$64$usize<Snap$Array$64$usize> _1@18@00)))
                      64))
                  false)
                (and
                  (builtin$unsize$Array$64$usize$Slice$usize__$TY$__Snap$Array$64$usize$Snap$Slice$usize%precondition $Snap.unit (Snap$struct$m_Path$0$field$f$max_counts__$TY$__Snap$struct$m_Path$Snap$Array$64$usize<Snap$Array$64$usize> _1@18@00))
                  (=>
                    (=
                      (len$Snap$Slice$usize$__$TY$__Snap$Slice$usize$$int$<Int> (builtin$unsize$Array$64$usize$Slice$usize__$TY$__Snap$Array$64$usize$Snap$Slice$usize $Snap.unit (Snap$struct$m_Path$0$field$f$max_counts__$TY$__Snap$struct$m_Path$Snap$Array$64$usize<Snap$Array$64$usize> _1@18@00)))
                      64)
                    (and
                      (and
                        (builtin$unsize$Array$64$usize$Slice$usize__$TY$__Snap$Array$64$usize$Snap$Slice$usize%precondition $Snap.unit (Snap$struct$m_Path$0$field$f$entries__$TY$__Snap$struct$m_Path$Snap$Array$64$usize<Snap$Array$64$usize> _1@18@00))
                        (builtin$unsize$Array$64$usize$Slice$usize__$TY$__Snap$Array$64$usize$Snap$Slice$usize%precondition $Snap.unit (Snap$struct$m_Path$0$field$f$max_counts__$TY$__Snap$struct$m_Path$Snap$Array$64$usize<Snap$Array$64$usize> _1@18@00)))
                      (=>
                        (=>
                          (not
                            (=
                              (len$Snap$Slice$usize$__$TY$__Snap$Slice$usize$$int$<Int> (builtin$unsize$Array$64$usize$Slice$usize__$TY$__Snap$Array$64$usize$Snap$Slice$usize $Snap.unit (Snap$struct$m_Path$0$field$f$entries__$TY$__Snap$struct$m_Path$Snap$Array$64$usize<Snap$Array$64$usize> _1@18@00)))
                              (len$Snap$Slice$usize$__$TY$__Snap$Slice$usize$$int$<Int> (builtin$unsize$Array$64$usize$Slice$usize__$TY$__Snap$Array$64$usize$Snap$Slice$usize $Snap.unit (Snap$struct$m_Path$0$field$f$max_counts__$TY$__Snap$struct$m_Path$Snap$Array$64$usize<Snap$Array$64$usize> _1@18@00)))))
                          false)
                        (and
                          (builtin$unsize$Array$64$usize$Slice$usize__$TY$__Snap$Array$64$usize$Snap$Slice$usize%precondition $Snap.unit (Snap$struct$m_Path$0$field$f$entries__$TY$__Snap$struct$m_Path$Snap$Array$64$usize<Snap$Array$64$usize> _1@18@00))
                          (builtin$unsize$Array$64$usize$Slice$usize__$TY$__Snap$Array$64$usize$Snap$Slice$usize%precondition $Snap.unit (Snap$struct$m_Path$0$field$f$max_counts__$TY$__Snap$struct$m_Path$Snap$Array$64$usize<Snap$Array$64$usize> _1@18@00))))))))))))))
  :pattern ((m_Path$$invariant__$TY$__Snap$struct$m_Path$$bool$ s@$ _1@18@00))
  :qid |quant-u-44|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- m_Path$$reset ----------
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
; var __t16: Int
(declare-const __t16@18@01 Int)
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
; var __t22: Int
(declare-const __t22@24@01 Int)
; [exec]
; var __t23: Bool
(declare-const __t23@25@01 Bool)
; [exec]
; var _old$pre$0: Ref
(declare-const _old$pre$0@26@01 $Ref)
; [exec]
; var _1: Ref
(declare-const _1@27@01 $Ref)
; [exec]
; var _2: Int
(declare-const _2@28@01 Int)
; [exec]
; var _3: Int
(declare-const _3@29@01 Int)
; [exec]
; var _4: Ref
(declare-const _4@30@01 $Ref)
; [exec]
; var _6: Ref
(declare-const _6@31@01 $Ref)
; [exec]
; var _7: Ref
(declare-const _7@32@01 $Ref)
; [exec]
; var _8: Int
(declare-const _8@33@01 Int)
; [exec]
; var _9: Ref
(declare-const _9@34@01 $Ref)
; [exec]
; var _10: Ref
(declare-const _10@35@01 $Ref)
; [exec]
; var _11: Int
(declare-const _11@36@01 Int)
; [exec]
; var _12: Ref
(declare-const _12@37@01 $Ref)
; [exec]
; var _13: Ref
(declare-const _13@38@01 $Ref)
; [exec]
; var _16: Ref
(declare-const _16@39@01 $Ref)
; [exec]
; var _17: Ref
(declare-const _17@40@01 $Ref)
; [exec]
; var _18: Int
(declare-const _18@41@01 Int)
; [exec]
; var _21: Ref
(declare-const _21@42@01 $Ref)
; [exec]
; var _22: Ref
(declare-const _22@43@01 $Ref)
; [exec]
; var _23: Int
(declare-const _23@44@01 Int)
; [exec]
; var _26: Ref
(declare-const _26@45@01 $Ref)
; [exec]
; var _27: Ref
(declare-const _27@46@01 $Ref)
; [exec]
; var _28: Int
(declare-const _28@47@01 Int)
; [exec]
; var _29: Int
(declare-const _29@48@01 Int)
; [exec]
; var _32: Ref
(declare-const _32@49@01 $Ref)
; [exec]
; var _33: Ref
(declare-const _33@50@01 $Ref)
; [exec]
; var _34: Int
(declare-const _34@51@01 Int)
; [exec]
; var _35: Int
(declare-const _35@52@01 Int)
; [exec]
; var _36: Int
(declare-const _36@53@01 Int)
; [exec]
; var _37: Ref
(declare-const _37@54@01 $Ref)
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
; inhale acc(_1.val_ref, write) && acc(struct$m_Path(_1.val_ref), write)
(declare-const $t@55@01 $Snap)
(assert (= $t@55@01 ($Snap.combine ($Snap.first $t@55@01) ($Snap.second $t@55@01))))
(assert (not (= _1@27@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale true
(declare-const $t@56@01 $Snap)
(assert (= $t@56@01 $Snap.unit))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale m_Path$$invariant__$TY$__Snap$struct$m_Path$$bool$(snap$__$TY$__Snap$struct$m_Path$struct$m_Path$Snap$struct$m_Path(_1.val_ref))
(declare-const $t@57@01 $Snap)
(assert (= $t@57@01 $Snap.unit))
; [eval] m_Path$$invariant__$TY$__Snap$struct$m_Path$$bool$(snap$__$TY$__Snap$struct$m_Path$struct$m_Path$Snap$struct$m_Path(_1.val_ref))
; [eval] snap$__$TY$__Snap$struct$m_Path$struct$m_Path$Snap$struct$m_Path(_1.val_ref)
(set-option :timeout 0)
(push) ; 3
; [eval] read$()
(push) ; 4
(assert (read$%precondition $Snap.unit))
(pop) ; 4
; Joined path conditions
(assert (read$%precondition $Snap.unit))
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
(assert (snap$__$TY$__Snap$struct$m_Path$struct$m_Path$Snap$struct$m_Path%precondition ($Snap.second $t@55@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))
(pop) ; 3
; Joined path conditions
(assert (and
  (read$%precondition $Snap.unit)
  (<= $Perm.No (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))))
  (snap$__$TY$__Snap$struct$m_Path$struct$m_Path$Snap$struct$m_Path%precondition ($Snap.second $t@55@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)))))
(set-option :timeout 0)
(push) ; 3
(assert (m_Path$$invariant__$TY$__Snap$struct$m_Path$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$struct$m_Path$struct$m_Path$Snap$struct$m_Path ($Snap.second $t@55@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)))))
(pop) ; 3
; Joined path conditions
(assert (m_Path$$invariant__$TY$__Snap$struct$m_Path$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$struct$m_Path$struct$m_Path$Snap$struct$m_Path ($Snap.second $t@55@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)))))
(assert (m_Path$$invariant__$TY$__Snap$struct$m_Path$$bool$ ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$struct$m_Path$struct$m_Path$Snap$struct$m_Path ($Snap.second $t@55@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; label pre
; [exec]
; __t0 := true
; [exec]
; unfold acc(struct$m_Path(_1.val_ref), write)
(assert (=
  ($Snap.second $t@55@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@55@01))
    ($Snap.second ($Snap.second $t@55@01)))))
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second $t@55@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@55@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@55@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@55@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@55@01)))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))
(check-sat)
; unknown
(pop) ; 3
; 0.01s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))))))
(check-sat)
; unknown
(pop) ; 3
; 0.01s
; (get-info :all-statistics)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (struct$m_Path%trigger ($Snap.second $t@55@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))
; [exec]
; unfold acc(usize(_1.val_ref.f$current), write)
(assert (=
  ($Snap.first ($Snap.second ($Snap.second $t@55@01)))
  ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@55@01))))
    ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@55@01)))))))
(assert (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@55@01))) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@55@01))))
  $Snap.unit))
; [eval] 0 <= self.val_int
(assert (<=
  0
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@55@01)))))))
; State saturation: after unfold
(check-sat)
; unknown
(assert (usize%trigger ($Snap.first ($Snap.second ($Snap.second $t@55@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@55@01)))))
; [exec]
; _1.val_ref.f$current.val_int := 0
; [exec]
; unfold acc(usize(_1.val_ref.f$depth), write)
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))
    ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@55@01)))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))
    $Ref.null)))
(assert (=
  ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))
  $Snap.unit))
; [eval] 0 <= self.val_int
(assert (<=
  0
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (usize%trigger ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))
; [exec]
; _1.val_ref.f$depth.val_int := 0
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@55@01)))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; [exec]
; _2 := builtin$havoc_int()
(declare-const ret@58@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _2 := 0
; [exec]
; assert acc(Array$64$usize(_1.val_ref.f$entries), read$())
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
(push) ; 3
(set-option :timeout 10)
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 3
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; [exec]
; _3 := builtin$havoc_int()
(declare-const ret@59@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _3 := 64
; [exec]
; _4 := builtin$havoc_ref()
(declare-const ret@60@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; inhale acc(_4.val_bool, write)
(declare-const $t@61@01 Bool)
(assert (not (= ret@60@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _4.val_bool := _2 < _3
; [eval] _2 < _3
; [exec]
; __t15 := _4.val_bool
; [exec]
; assert __t15
; [exec]
; __t1 := true
; [exec]
; label l0
; [exec]
; exhale acc(Array$64$usize(_1.val_ref.f$entries), write)
; [exec]
; inhale acc(Array$64$usize(_1.val_ref.f$entries), write)
(declare-const $t@62@01 $Snap)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))))
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
; inhale (let _LET_0 ==
;     (old[l0](_2)) in
;     (forall i: Int ::
;       { lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$(old[l0](_1.val_ref.f$entries),
;       i) }
;       0 <= i && (i < 64 && !(i == _LET_0)) ==>
;       lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$(_1.val_ref.f$entries,
;       i) ==
;       old[l0](lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$(_1.val_ref.f$entries,
;       i))))
(declare-const $t@63@01 $Snap)
(assert (= $t@63@01 $Snap.unit))
; [eval] (let _LET_0 == (old[l0](_2)) in (forall i: Int :: { lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$(old[l0](_1.val_ref.f$entries), i) } 0 <= i && (i < 64 && !(i == _LET_0)) ==> lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$(_1.val_ref.f$entries, i) == old[l0](lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$(_1.val_ref.f$entries, i))))
; [eval] old[l0](_2)
(declare-const letvar@64@01 Int)
(assert (= (as letvar@64@01  Int) 0))
; [eval] (forall i: Int :: { lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$(old[l0](_1.val_ref.f$entries), i) } 0 <= i && (i < 64 && !(i == _LET_0)) ==> lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$(_1.val_ref.f$entries, i) == old[l0](lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$(_1.val_ref.f$entries, i)))
(declare-const i@65@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= i && (i < 64 && !(i == _LET_0)) ==> lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$(_1.val_ref.f$entries, i) == old[l0](lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$(_1.val_ref.f$entries, i))
; [eval] 0 <= i && (i < 64 && !(i == _LET_0))
; [eval] 0 <= i
(push) ; 4
; [then-branch: 0 | 0 <= i@65@01 | live]
; [else-branch: 0 | !(0 <= i@65@01) | live]
(push) ; 5
; [then-branch: 0 | 0 <= i@65@01]
(assert (<= 0 i@65@01))
; [eval] i < 64
(push) ; 6
; [then-branch: 1 | i@65@01 < 64 | live]
; [else-branch: 1 | !(i@65@01 < 64) | live]
(push) ; 7
; [then-branch: 1 | i@65@01 < 64]
(assert (< i@65@01 64))
; [eval] !(i == _LET_0)
; [eval] i == _LET_0
(pop) ; 7
(push) ; 7
; [else-branch: 1 | !(i@65@01 < 64)]
(assert (not (< i@65@01 64)))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not (< i@65@01 64)) (< i@65@01 64)))
(pop) ; 5
(push) ; 5
; [else-branch: 0 | !(0 <= i@65@01)]
(assert (not (<= 0 i@65@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=> (<= 0 i@65@01) (and (<= 0 i@65@01) (or (not (< i@65@01 64)) (< i@65@01 64)))))
; Joined path conditions
(assert (or (not (<= 0 i@65@01)) (<= 0 i@65@01)))
(push) ; 4
; [then-branch: 2 | i@65@01 != 0 && i@65@01 < 64 && 0 <= i@65@01 | live]
; [else-branch: 2 | !(i@65@01 != 0 && i@65@01 < 64 && 0 <= i@65@01) | live]
(push) ; 5
; [then-branch: 2 | i@65@01 != 0 && i@65@01 < 64 && 0 <= i@65@01]
(assert (and (and (not (= i@65@01 0)) (< i@65@01 64)) (<= 0 i@65@01)))
; [eval] lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$(_1.val_ref.f$entries, i) == old[l0](lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$(_1.val_ref.f$entries, i))
; [eval] lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$(_1.val_ref.f$entries, i)
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
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
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
; [eval] idx < 64
(assert (lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$%precondition ($Snap.combine
  $t@62@01
  ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))) i@65@01))
(pop) ; 6
; Joined path conditions
(assert (lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$%precondition ($Snap.combine
  $t@62@01
  ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))) i@65@01))
; [eval] old[l0](lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$(_1.val_ref.f$entries, i))
; [eval] lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$(_1.val_ref.f$entries, i)
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
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
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
; [eval] idx < 64
(assert (lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))
  ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))) i@65@01))
(pop) ; 6
; Joined path conditions
(assert (lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))
  ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))) i@65@01))
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 2 | !(i@65@01 != 0 && i@65@01 < 64 && 0 <= i@65@01)]
(assert (not (and (and (not (= i@65@01 0)) (< i@65@01 64)) (<= 0 i@65@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and (and (not (= i@65@01 0)) (< i@65@01 64)) (<= 0 i@65@01))
  (and
    (not (= i@65@01 0))
    (< i@65@01 64)
    (<= 0 i@65@01)
    (lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$%precondition ($Snap.combine
      $t@62@01
      ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))) i@65@01)
    (lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$%precondition ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))
      ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))) i@65@01))))
; Joined path conditions
(assert (or
  (not (and (and (not (= i@65@01 0)) (< i@65@01 64)) (<= 0 i@65@01)))
  (and (and (not (= i@65@01 0)) (< i@65@01 64)) (<= 0 i@65@01))))
; [eval] lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$(old[l0](_1.val_ref.f$entries), i)
; [eval] old[l0](_1.val_ref.f$entries)
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
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
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
(assert (not (<= 0 i@65@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@55@01))))))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  (=
    $t@62@01
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))))))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))
    $t@62@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(assert (and
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@55@01)))
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@55@01)))))))
; [eval] 0 <= idx
(set-option :timeout 0)
(push) ; 5
(assert (not (<= 0 i@65@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@55@01))))))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))))))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (< $Perm.No (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))))
  (not
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))
      $t@62@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (< $Perm.No (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))))
  (not
    (=
      $t@62@01
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))))))))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(assert (and
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@55@01)))
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@55@01)))))))
; [eval] 0 <= idx
(set-option :timeout 0)
(push) ; 5
(assert (not (<= 0 i@65@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@55@01))))))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  (=
    $t@62@01
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))))))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))
    $t@62@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(assert (and
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@55@01)))
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@55@01)))))))
; [eval] 0 <= idx
(set-option :timeout 0)
(push) ; 5
(assert (not (<= 0 i@65@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(pop) ; 4
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@65@01 Int)) (!
  (and
    (=>
      (<= 0 i@65@01)
      (and (<= 0 i@65@01) (or (not (< i@65@01 64)) (< i@65@01 64))))
    (or (not (<= 0 i@65@01)) (<= 0 i@65@01))
    (=>
      (and (and (not (= i@65@01 0)) (< i@65@01 64)) (<= 0 i@65@01))
      (and
        (not (= i@65@01 0))
        (< i@65@01 64)
        (<= 0 i@65@01)
        (lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$%precondition ($Snap.combine
          $t@62@01
          ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))) i@65@01)
        (lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$%precondition ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))
          ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))) i@65@01)))
    (or
      (not (and (and (not (= i@65@01 0)) (< i@65@01 64)) (<= 0 i@65@01)))
      (and (and (not (= i@65@01 0)) (< i@65@01 64)) (<= 0 i@65@01))))
  
  :qid |prog.l732-aux|)))
(assert (forall ((i@65@01 Int)) (!
  (=>
    (and (and (not (= i@65@01 0)) (< i@65@01 64)) (<= 0 i@65@01))
    (=
      (lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$ ($Snap.combine
        $t@62@01
        ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))) i@65@01)
      (lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$ ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))
        ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))) i@65@01)))
  
  :qid |prog.l732|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; __t16 := builtin$havoc_int()
(declare-const ret@66@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; __t16 := 0
; [exec]
; inhale lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$(_1.val_ref.f$entries,
;   old[l0](_2)) ==
;   __t16
(declare-const $t@67@01 $Snap)
(assert (= $t@67@01 $Snap.unit))
; [eval] lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$(_1.val_ref.f$entries, old[l0](_2)) == __t16
; [eval] lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$(_1.val_ref.f$entries, old[l0](_2))
; [eval] old[l0](_2)
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
; [eval] 0 <= idx
; [eval] idx < 64
(assert (lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$%precondition ($Snap.combine
  $t@62@01
  ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))) 0))
(pop) ; 3
; Joined path conditions
(assert (lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$%precondition ($Snap.combine
  $t@62@01
  ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))) 0))
(assert (=
  (lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$ ($Snap.combine
    $t@62@01
    ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))) 0)
  0))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _10 := builtin$havoc_ref()
(declare-const ret@68@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_10.val_ref, write)
(declare-const $t@69@01 $Ref)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= _1@27@01 ret@68@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.01s
; (get-info :all-statistics)
(assert (not (= ret@68@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _10.val_ref := _1.val_ref.f$entries
(declare-const val_ref@70@01 $Ref)
(assert (=
  val_ref@70@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= _1@27@01 ret@68@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.01s
; (get-info :all-statistics)
; [exec]
; exhale acc(Array$64$usize(_1.val_ref.f$entries), write - read$())
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
; inhale acc(Array$64$usize(_10.val_ref), read$())
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
(declare-const $t@71@01 $Snap)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))
  val_ref@70@01)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(declare-const $t@72@01 $Snap)
(assert (and
  (=>
    (<
      $Perm.No
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit)))))
    (= $t@72@01 $t@62@01))
  (=> (< $Perm.No (read$ $Snap.unit)) (= $t@72@01 $t@71@01))))
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
; label l1
; [exec]
; label l2
; [exec]
; _9 := builtin$havoc_ref()
(declare-const ret@73@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_9.val_ref, write)
(declare-const $t@74@01 $Ref)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= ret@68@01 ret@73@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= _1@27@01 ret@73@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.01s
; (get-info :all-statistics)
(assert (not (= ret@73@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(Slice$usize(_9.val_ref), read$())
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
(declare-const $t@75@01 $Snap)
(assert (<= $Perm.No (read$ $Snap.unit)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale Slice$len__$TY$__usize$Slice$usize$$int$(_9.val_ref) == 64
(declare-const $t@76@01 $Snap)
(assert (= $t@76@01 $Snap.unit))
; [eval] Slice$len__$TY$__usize$Slice$usize$$int$(_9.val_ref) == 64
; [eval] Slice$len__$TY$__usize$Slice$usize$$int$(_9.val_ref)
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
(assert (Slice$len__$TY$__usize$Slice$usize$$int$%precondition $t@75@01 $t@74@01))
(pop) ; 3
; Joined path conditions
(assert (Slice$len__$TY$__usize$Slice$usize$$int$%precondition $t@75@01 $t@74@01))
(assert (= (Slice$len__$TY$__usize$Slice$usize$$int$ $t@75@01 $t@74@01) 64))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (let _LET_2 ==
;     (_9.val_ref) in
;     (let _LET_1 ==
;       (_10.val_ref) in
;       (forall i: Int ::
;         { lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$(_10.val_ref,
;         i) }
;         { lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$(_9.val_ref,
;         i) }
;         0 <= i && i < 64 ==>
;         lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$(_LET_1,
;         i) ==
;         lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$(_LET_2,
;         i))))
(declare-const $t@77@01 $Snap)
(assert (= $t@77@01 $Snap.unit))
; [eval] (let _LET_2 == (_9.val_ref) in (let _LET_1 == (_10.val_ref) in (forall i: Int :: { lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$(_10.val_ref, i) } { lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$(_9.val_ref, i) } 0 <= i && i < 64 ==> lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$(_LET_1, i) == lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$(_LET_2, i))))
(declare-const letvar@78@01 $Ref)
(assert (= (as letvar@78@01  $Ref) $t@74@01))
; [eval] (let _LET_1 == (_10.val_ref) in (forall i: Int :: { lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$(_10.val_ref, i) } { lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$(_9.val_ref, i) } 0 <= i && i < 64 ==> lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$(_LET_1, i) == lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$(_LET_2, i)))
(declare-const letvar@79@01 $Ref)
(assert (= (as letvar@79@01  $Ref) val_ref@70@01))
; [eval] (forall i: Int :: { lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$(_10.val_ref, i) } { lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$(_9.val_ref, i) } 0 <= i && i < 64 ==> lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$(_LET_1, i) == lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$(_LET_2, i))
(declare-const i@80@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= i && i < 64 ==> lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$(_LET_1, i) == lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$(_LET_2, i)
; [eval] 0 <= i && i < 64
; [eval] 0 <= i
(push) ; 4
; [then-branch: 3 | 0 <= i@80@01 | live]
; [else-branch: 3 | !(0 <= i@80@01) | live]
(push) ; 5
; [then-branch: 3 | 0 <= i@80@01]
(assert (<= 0 i@80@01))
; [eval] i < 64
(pop) ; 5
(push) ; 5
; [else-branch: 3 | !(0 <= i@80@01)]
(assert (not (<= 0 i@80@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (<= 0 i@80@01)) (<= 0 i@80@01)))
(push) ; 4
; [then-branch: 4 | i@80@01 < 64 && 0 <= i@80@01 | live]
; [else-branch: 4 | !(i@80@01 < 64 && 0 <= i@80@01) | live]
(push) ; 5
; [then-branch: 4 | i@80@01 < 64 && 0 <= i@80@01]
(assert (and (< i@80@01 64) (<= 0 i@80@01)))
; [eval] lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$(_LET_1, i) == lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$(_LET_2, i)
; [eval] lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$(_LET_1, i)
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
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))
  val_ref@70@01)))
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
    (+
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
      (read$ $Snap.unit))
    ($Perm.min
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit))
      (read$ $Snap.unit)))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(assert (<=
  $Perm.No
  (-
    (+
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
      (read$ $Snap.unit))
    ($Perm.min
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
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
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    $Perm.No)
  (<
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
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
; [eval] idx < 64
(assert (lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$%precondition ($Snap.combine
  $t@72@01
  ($Snap.combine $Snap.unit $Snap.unit)) val_ref@70@01 i@80@01))
(pop) ; 6
; Joined path conditions
(assert (and
  (<=
    $Perm.No
    (-
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit))))
  (lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$%precondition ($Snap.combine
    $t@72@01
    ($Snap.combine $Snap.unit $Snap.unit)) val_ref@70@01 i@80@01)))
; [eval] lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$(_LET_2, i)
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
; [eval] idx < Slice$len__$TY$__usize$Slice$usize$$int$(self)
; [eval] Slice$len__$TY$__usize$Slice$usize$$int$(self)
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
(assert (not (< i@80@01 (Slice$len__$TY$__usize$Slice$usize$$int$ $t@75@01 $t@74@01))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (< i@80@01 (Slice$len__$TY$__usize$Slice$usize$$int$ $t@75@01 $t@74@01)))
(assert (lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$%precondition ($Snap.combine
  $t@75@01
  ($Snap.combine $Snap.unit $Snap.unit)) $t@74@01 i@80@01))
(pop) ; 6
; Joined path conditions
(assert (and
  (< i@80@01 (Slice$len__$TY$__usize$Slice$usize$$int$ $t@75@01 $t@74@01))
  (lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$%precondition ($Snap.combine
    $t@75@01
    ($Snap.combine $Snap.unit $Snap.unit)) $t@74@01 i@80@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 4 | !(i@80@01 < 64 && 0 <= i@80@01)]
(assert (not (and (< i@80@01 64) (<= 0 i@80@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and (< i@80@01 64) (<= 0 i@80@01))
  (and
    (< i@80@01 64)
    (<= 0 i@80@01)
    (<=
      $Perm.No
      (-
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))))
    (lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$%precondition ($Snap.combine
      $t@72@01
      ($Snap.combine $Snap.unit $Snap.unit)) val_ref@70@01 i@80@01)
    (< i@80@01 (Slice$len__$TY$__usize$Slice$usize$$int$ $t@75@01 $t@74@01))
    (lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$%precondition ($Snap.combine
      $t@75@01
      ($Snap.combine $Snap.unit $Snap.unit)) $t@74@01 i@80@01))))
; Joined path conditions
(assert (or
  (not (and (< i@80@01 64) (<= 0 i@80@01)))
  (and (< i@80@01 64) (<= 0 i@80@01))))
; [eval] lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$(_10.val_ref, i)
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
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))
  val_ref@70@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  (-
    (+
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
      (read$ $Snap.unit))
    ($Perm.min
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit))
      (read$ $Snap.unit)))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(assert (<=
  $Perm.No
  (-
    (+
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
      (read$ $Snap.unit))
    ($Perm.min
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
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
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    $Perm.No)
  (<
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
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
(assert (not (<= 0 i@80@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@73@01 ret@68@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@68@01 _1@27@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@73@01 _1@27@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@55@01)))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (<
    $Perm.No
    (+
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
      (read$ $Snap.unit)))
  (not
    (=
      $t@72@01
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))))))))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (<
    $Perm.No
    (+
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
      (read$ $Snap.unit)))
  (not
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))
      $t@72@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) val_ref@70@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) $t@74@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= val_ref@70@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= val_ref@70@01 $t@74@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= $t@74@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= $t@74@01 val_ref@70@01))))
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
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(assert (and
  (and
    (and (not (= _1@27@01 ret@68@01)) (not (= _1@27@01 ret@73@01)))
    (and (not (= ret@68@01 _1@27@01)) (not (= ret@68@01 ret@73@01)))
    (and (not (= ret@73@01 _1@27@01)) (not (= ret@73@01 ret@68@01))))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@55@01)))))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@55@01)))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))))
; [eval] 0 <= idx
(set-option :timeout 0)
(push) ; 5
(assert (not (<= 0 i@80@01)))
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
(assert (not (= ret@73@01 ret@68@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@68@01 _1@27@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@73@01 _1@27@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@55@01)))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (<
    $Perm.No
    (-
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit))))
  (not
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))
      $t@72@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (<
    $Perm.No
    (-
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit))))
  (not
    (=
      $t@72@01
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))))))))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) val_ref@70@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) $t@74@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= val_ref@70@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= val_ref@70@01 $t@74@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= $t@74@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= $t@74@01 val_ref@70@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(assert (and
  (and
    (and (not (= _1@27@01 ret@68@01)) (not (= _1@27@01 ret@73@01)))
    (and (not (= ret@68@01 _1@27@01)) (not (= ret@68@01 ret@73@01)))
    (and (not (= ret@73@01 _1@27@01)) (not (= ret@73@01 ret@68@01))))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@55@01)))))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@55@01)))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))))
; [eval] 0 <= idx
(set-option :timeout 0)
(push) ; 5
(assert (not (<= 0 i@80@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@73@01 ret@68@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@68@01 _1@27@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@73@01 _1@27@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@55@01)))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (<
    $Perm.No
    (+
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
      (read$ $Snap.unit)))
  (not
    (=
      $t@72@01
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))))))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (<
    $Perm.No
    (+
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
      (read$ $Snap.unit)))
  (not
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))
      $t@72@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) val_ref@70@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) $t@74@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= val_ref@70@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= val_ref@70@01 $t@74@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= $t@74@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= $t@74@01 val_ref@70@01))))
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
; 0.01s
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
(assert (and
  (and
    (and (not (= _1@27@01 ret@68@01)) (not (= _1@27@01 ret@73@01)))
    (and (not (= ret@68@01 _1@27@01)) (not (= ret@68@01 ret@73@01)))
    (and (not (= ret@73@01 _1@27@01)) (not (= ret@73@01 ret@68@01))))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@55@01)))))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@55@01)))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))))
; [eval] 0 <= idx
(set-option :timeout 0)
(push) ; 5
(assert (not (<= 0 i@80@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(pop) ; 4
; [eval] lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$(_9.val_ref, i)
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
(assert (not (<= 0 i@80@01)))
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
(assert (not (= ret@73@01 ret@68@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@68@01 _1@27@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@73@01 _1@27@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@55@01)))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (<
    $Perm.No
    (+
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
      (read$ $Snap.unit)))
  (not
    (=
      $t@72@01
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))))))))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (<
    $Perm.No
    (+
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
      (read$ $Snap.unit)))
  (not
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))
      $t@72@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) val_ref@70@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) $t@74@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= val_ref@70@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= val_ref@70@01 $t@74@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= $t@74@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= $t@74@01 val_ref@70@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(assert (and
  (and
    (and (not (= _1@27@01 ret@68@01)) (not (= _1@27@01 ret@73@01)))
    (and (not (= ret@68@01 _1@27@01)) (not (= ret@68@01 ret@73@01)))
    (and (not (= ret@73@01 _1@27@01)) (not (= ret@73@01 ret@68@01))))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@55@01)))))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@55@01)))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))))
; [eval] 0 <= idx
(set-option :timeout 0)
(push) ; 5
(assert (not (<= 0 i@80@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@73@01 ret@68@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@68@01 _1@27@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@73@01 _1@27@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@55@01)))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (<
    $Perm.No
    (+
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
      (read$ $Snap.unit)))
  (not
    (=
      $t@72@01
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))))))))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (<
    $Perm.No
    (+
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
      (read$ $Snap.unit)))
  (not
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))
      $t@72@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) val_ref@70@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) $t@74@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= val_ref@70@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= val_ref@70@01 $t@74@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= $t@74@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= $t@74@01 val_ref@70@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(assert (and
  (and
    (and (not (= _1@27@01 ret@68@01)) (not (= _1@27@01 ret@73@01)))
    (and (not (= ret@68@01 _1@27@01)) (not (= ret@68@01 ret@73@01)))
    (and (not (= ret@73@01 _1@27@01)) (not (= ret@73@01 ret@68@01))))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@55@01)))))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@55@01)))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))))
; [eval] 0 <= idx
(set-option :timeout 0)
(push) ; 5
(assert (not (<= 0 i@80@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@73@01 ret@68@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@68@01 _1@27@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@73@01 _1@27@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@55@01)))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (<
    $Perm.No
    (+
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
      (read$ $Snap.unit)))
  (not
    (=
      $t@72@01
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))))))))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (<
    $Perm.No
    (+
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
      (read$ $Snap.unit)))
  (not
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))
      $t@72@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) val_ref@70@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) $t@74@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= val_ref@70@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= val_ref@70@01 $t@74@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= $t@74@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= $t@74@01 val_ref@70@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(assert (and
  (and
    (and (not (= _1@27@01 ret@68@01)) (not (= _1@27@01 ret@73@01)))
    (and (not (= ret@68@01 _1@27@01)) (not (= ret@68@01 ret@73@01)))
    (and (not (= ret@73@01 _1@27@01)) (not (= ret@73@01 ret@68@01))))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@55@01)))))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@55@01)))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))))
; [eval] 0 <= idx
(set-option :timeout 0)
(push) ; 5
(assert (not (<= 0 i@80@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(pop) ; 4
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@80@01 Int)) (!
  (and
    (or (not (<= 0 i@80@01)) (<= 0 i@80@01))
    (=>
      (and (< i@80@01 64) (<= 0 i@80@01))
      (and
        (< i@80@01 64)
        (<= 0 i@80@01)
        (<=
          $Perm.No
          (-
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            ($Perm.min
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))))
        (lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$%precondition ($Snap.combine
          $t@72@01
          ($Snap.combine $Snap.unit $Snap.unit)) val_ref@70@01 i@80@01)
        (< i@80@01 (Slice$len__$TY$__usize$Slice$usize$$int$ $t@75@01 $t@74@01))
        (lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$%precondition ($Snap.combine
          $t@75@01
          ($Snap.combine $Snap.unit $Snap.unit)) $t@74@01 i@80@01)))
    (or
      (not (and (< i@80@01 64) (<= 0 i@80@01)))
      (and (< i@80@01 64) (<= 0 i@80@01))))
  
  :qid |prog.l769-aux|)))
(assert (forall ((i@80@01 Int)) (!
  (=>
    (and (< i@80@01 64) (<= 0 i@80@01))
    (=
      (lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$ ($Snap.combine
        $t@72@01
        ($Snap.combine $Snap.unit $Snap.unit)) val_ref@70@01 i@80@01)
      (lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$ ($Snap.combine
        $t@75@01
        ($Snap.combine $Snap.unit $Snap.unit)) $t@74@01 i@80@01)))
  
  :qid |prog.l769|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; label l3
; [exec]
; _8 := builtin$havoc_int()
(declare-const ret@81@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _8 := Slice$len__$TY$__usize$Slice$usize$$int$(_9.val_ref)
; [eval] Slice$len__$TY$__usize$Slice$usize$$int$(_9.val_ref)
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
(declare-const _8@82@01 Int)
(assert (= _8@82@01 (Slice$len__$TY$__usize$Slice$usize$$int$ $t@75@01 $t@74@01)))
; [eval] __t1 && (__t1 && __t1)
(set-option :timeout 0)
(push) ; 3
; [then-branch: 5 | True | live]
; [else-branch: 5 | False | live]
(push) ; 4
; [then-branch: 5 | True]
(push) ; 5
; [then-branch: 6 | True | live]
; [else-branch: 6 | False | live]
(push) ; 6
; [then-branch: 6 | True]
(pop) ; 6
(push) ; 6
; [else-branch: 6 | False]
(assert false)
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(pop) ; 4
(push) ; 4
; [else-branch: 5 | False]
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
; [then-branch: 7 | True | live]
; [else-branch: 7 | False | dead]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 7 | True]
; [exec]
; exhale acc(Array$64$usize(_10.val_ref), read$())
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
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))
  val_ref@70@01)))
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
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
      (read$ $Snap.unit))
    ($Perm.min
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit))
      (read$ $Snap.unit)))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 4
; 0.01s
; (get-info :all-statistics)
(assert (<=
  $Perm.No
  (-
    (+
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
      (read$ $Snap.unit))
    ($Perm.min
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
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
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    $Perm.No)
  (<
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
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
; inhale acc(Array$64$usize(_1.val_ref.f$entries), write - read$())
; [eval] write - read$()
; [eval] read$()
(set-option :timeout 0)
(push) ; 4
(pop) ; 4
; Joined path conditions
(push) ; 4
(assert (not (or
  (= (- $Perm.Write (read$ $Snap.unit)) $Perm.No)
  (< $Perm.No (- $Perm.Write (read$ $Snap.unit))))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(declare-const $t@83@01 $Snap)
(declare-const $t@84@01 $Snap)
(assert (and
  (=>
    (<
      $Perm.No
      (-
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))))
    (= $t@84@01 $t@72@01))
  (=> (< $Perm.No (- $Perm.Write (read$ $Snap.unit))) (= $t@84@01 $t@83@01))))
(assert (<=
  $Perm.No
  (+
    (-
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    (- $Perm.Write (read$ $Snap.unit)))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; __t2 := true
; [exec]
; _13 := builtin$havoc_ref()
(declare-const ret@85@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_13.val_ref, write)
(declare-const $t@86@01 $Ref)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= _1@27@01 ret@85@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@68@01 ret@85@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@73@01 ret@85@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.01s
; (get-info :all-statistics)
(assert (not (= ret@85@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _13.val_ref := _1.val_ref.f$max_counts
(declare-const val_ref@87@01 $Ref)
(assert (=
  val_ref@87@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))))))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@73@01 ret@85@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@68@01 ret@85@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= _1@27@01 ret@85@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.01s
; (get-info :all-statistics)
; [exec]
; exhale acc(Array$64$usize(_1.val_ref.f$max_counts), write - read$())
; [eval] write - read$()
; [eval] read$()
(set-option :timeout 0)
(push) ; 4
(pop) ; 4
; Joined path conditions
(push) ; 4
(assert (not (or
  (= (- $Perm.Write (read$ $Snap.unit)) $Perm.No)
  (< $Perm.No (- $Perm.Write (read$ $Snap.unit))))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 4
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
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
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (- $Perm.Write (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [exec]
; inhale acc(Array$64$usize(_13.val_ref), read$())
; [eval] read$()
(set-option :timeout 0)
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
(declare-const $t@88@01 $Snap)
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))))
  val_ref@87@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(declare-const $t@89@01 $Snap)
(assert (and
  (=>
    (<
      $Perm.No
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit)))))
    (=
      $t@89@01
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))))
  (=> (< $Perm.No (read$ $Snap.unit)) (= $t@89@01 $t@88@01))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; label l5
; [exec]
; label l6
; [exec]
; _12 := builtin$havoc_ref()
(declare-const ret@90@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_12.val_ref, write)
(declare-const $t@91@01 $Ref)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@85@01 ret@90@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@73@01 ret@90@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@68@01 ret@90@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= _1@27@01 ret@90@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.01s
; (get-info :all-statistics)
(assert (not (= ret@90@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(Slice$usize(_12.val_ref), read$())
; [eval] read$()
(set-option :timeout 0)
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
(declare-const $t@92@01 $Snap)
(push) ; 4
(set-option :timeout 10)
(assert (not (= $t@74@01 $t@91@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.01s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale Slice$len__$TY$__usize$Slice$usize$$int$(_12.val_ref) == 64
(declare-const $t@93@01 $Snap)
(assert (= $t@93@01 $Snap.unit))
; [eval] Slice$len__$TY$__usize$Slice$usize$$int$(_12.val_ref) == 64
; [eval] Slice$len__$TY$__usize$Slice$usize$$int$(_12.val_ref)
(set-option :timeout 0)
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
(assert (Slice$len__$TY$__usize$Slice$usize$$int$%precondition $t@92@01 $t@91@01))
(pop) ; 4
; Joined path conditions
(assert (Slice$len__$TY$__usize$Slice$usize$$int$%precondition $t@92@01 $t@91@01))
(assert (= (Slice$len__$TY$__usize$Slice$usize$$int$ $t@92@01 $t@91@01) 64))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (let _LET_3 ==
;     (_13.val_ref) in
;     (let _LET_4 ==
;       (_12.val_ref) in
;       (forall i: Int ::
;         { lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$(_13.val_ref,
;         i) }
;         { lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$(_12.val_ref,
;         i) }
;         0 <= i && i < 64 ==>
;         lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$(_LET_3,
;         i) ==
;         lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$(_LET_4,
;         i))))
(declare-const $t@94@01 $Snap)
(assert (= $t@94@01 $Snap.unit))
; [eval] (let _LET_3 == (_13.val_ref) in (let _LET_4 == (_12.val_ref) in (forall i: Int :: { lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$(_13.val_ref, i) } { lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$(_12.val_ref, i) } 0 <= i && i < 64 ==> lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$(_LET_3, i) == lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$(_LET_4, i))))
(declare-const letvar@95@01 $Ref)
(assert (= (as letvar@95@01  $Ref) val_ref@87@01))
; [eval] (let _LET_4 == (_12.val_ref) in (forall i: Int :: { lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$(_13.val_ref, i) } { lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$(_12.val_ref, i) } 0 <= i && i < 64 ==> lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$(_LET_3, i) == lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$(_LET_4, i)))
(declare-const letvar@96@01 $Ref)
(assert (= (as letvar@96@01  $Ref) $t@91@01))
; [eval] (forall i: Int :: { lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$(_13.val_ref, i) } { lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$(_12.val_ref, i) } 0 <= i && i < 64 ==> lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$(_LET_3, i) == lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$(_LET_4, i))
(declare-const i@97@01 Int)
(set-option :timeout 0)
(push) ; 4
; [eval] 0 <= i && i < 64 ==> lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$(_LET_3, i) == lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$(_LET_4, i)
; [eval] 0 <= i && i < 64
; [eval] 0 <= i
(push) ; 5
; [then-branch: 8 | 0 <= i@97@01 | live]
; [else-branch: 8 | !(0 <= i@97@01) | live]
(push) ; 6
; [then-branch: 8 | 0 <= i@97@01]
(assert (<= 0 i@97@01))
; [eval] i < 64
(pop) ; 6
(push) ; 6
; [else-branch: 8 | !(0 <= i@97@01)]
(assert (not (<= 0 i@97@01)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (not (<= 0 i@97@01)) (<= 0 i@97@01)))
(push) ; 5
; [then-branch: 9 | i@97@01 < 64 && 0 <= i@97@01 | live]
; [else-branch: 9 | !(i@97@01 < 64 && 0 <= i@97@01) | live]
(push) ; 6
; [then-branch: 9 | i@97@01 < 64 && 0 <= i@97@01]
(assert (and (< i@97@01 64) (<= 0 i@97@01)))
; [eval] lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$(_LET_3, i) == lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$(_LET_4, i)
; [eval] lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$(_LET_3, i)
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
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))))
  val_ref@87@01)))
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
    (+
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
      (read$ $Snap.unit))
    ($Perm.min
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit))
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
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    $Perm.No)
  (<
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
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
; [eval] idx < 64
(assert (lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$%precondition ($Snap.combine
  $t@89@01
  ($Snap.combine $Snap.unit $Snap.unit)) val_ref@87@01 i@97@01))
(pop) ; 7
; Joined path conditions
(assert (lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$%precondition ($Snap.combine
  $t@89@01
  ($Snap.combine $Snap.unit $Snap.unit)) val_ref@87@01 i@97@01))
; [eval] lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$(_LET_4, i)
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
; [eval] 0 <= idx
; [eval] idx < Slice$len__$TY$__usize$Slice$usize$$int$(self)
; [eval] Slice$len__$TY$__usize$Slice$usize$$int$(self)
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
(assert (not (< i@97@01 (Slice$len__$TY$__usize$Slice$usize$$int$ $t@92@01 $t@91@01))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (< i@97@01 (Slice$len__$TY$__usize$Slice$usize$$int$ $t@92@01 $t@91@01)))
(assert (lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$%precondition ($Snap.combine
  $t@92@01
  ($Snap.combine $Snap.unit $Snap.unit)) $t@91@01 i@97@01))
(pop) ; 7
; Joined path conditions
(assert (and
  (< i@97@01 (Slice$len__$TY$__usize$Slice$usize$$int$ $t@92@01 $t@91@01))
  (lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$%precondition ($Snap.combine
    $t@92@01
    ($Snap.combine $Snap.unit $Snap.unit)) $t@91@01 i@97@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 9 | !(i@97@01 < 64 && 0 <= i@97@01)]
(assert (not (and (< i@97@01 64) (<= 0 i@97@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and (< i@97@01 64) (<= 0 i@97@01))
  (and
    (< i@97@01 64)
    (<= 0 i@97@01)
    (lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$%precondition ($Snap.combine
      $t@89@01
      ($Snap.combine $Snap.unit $Snap.unit)) val_ref@87@01 i@97@01)
    (< i@97@01 (Slice$len__$TY$__usize$Slice$usize$$int$ $t@92@01 $t@91@01))
    (lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$%precondition ($Snap.combine
      $t@92@01
      ($Snap.combine $Snap.unit $Snap.unit)) $t@91@01 i@97@01))))
; Joined path conditions
(assert (or
  (not (and (< i@97@01 64) (<= 0 i@97@01)))
  (and (< i@97@01 64) (<= 0 i@97@01))))
; [eval] lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$(_13.val_ref, i)
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
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))))
  val_ref@87@01)))
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
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
      (read$ $Snap.unit))
    ($Perm.min
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit))
      (read$ $Snap.unit)))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(assert (not (or
  (=
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    $Perm.No)
  (<
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
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
; [eval] 0 <= idx
(set-option :timeout 0)
(push) ; 6
(assert (not (<= 0 i@97@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@90@01 ret@85@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@85@01 ret@73@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@90@01 ret@73@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@73@01 ret@68@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@85@01 ret@68@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@90@01 ret@68@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@68@01 _1@27@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@73@01 _1@27@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@85@01 _1@27@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@90@01 _1@27@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@55@01)))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= $t@74@01 $t@91@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@92@01 $t@75@01)))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@75@01 $t@92@01)))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (and
    (<
      $Perm.No
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit)))
    (<
      $Perm.No
      (+
        (-
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (- $Perm.Write (read$ $Snap.unit)))))
  (not (= $t@89@01 $t@84@01)))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (and
    (<
      $Perm.No
      (+
        (-
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (- $Perm.Write (read$ $Snap.unit))))
    (<
      $Perm.No
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit))))
  (not (= $t@84@01 $t@89@01)))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) val_ref@70@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) $t@74@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) val_ref@87@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) $t@91@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= val_ref@70@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= val_ref@70@01 $t@74@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= val_ref@70@01 val_ref@87@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= val_ref@70@01 $t@91@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= $t@74@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= $t@74@01 val_ref@70@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= $t@74@01 val_ref@87@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= $t@74@01 $t@91@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= val_ref@87@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= val_ref@87@01 val_ref@70@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= val_ref@87@01 $t@74@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= val_ref@87@01 $t@91@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= $t@91@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= $t@91@01 val_ref@70@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= $t@91@01 $t@74@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= $t@91@01 val_ref@87@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(assert (and
  (and
    (and
      (not (= _1@27@01 ret@68@01))
      (not (= _1@27@01 ret@73@01))
      (not (= _1@27@01 ret@85@01))
      (not (= _1@27@01 ret@90@01)))
    (and
      (not (= ret@68@01 _1@27@01))
      (not (= ret@68@01 ret@73@01))
      (not (= ret@68@01 ret@85@01))
      (not (= ret@68@01 ret@90@01)))
    (and
      (not (= ret@73@01 _1@27@01))
      (not (= ret@73@01 ret@68@01))
      (not (= ret@73@01 ret@85@01))
      (not (= ret@73@01 ret@90@01)))
    (and
      (not (= ret@85@01 _1@27@01))
      (not (= ret@85@01 ret@68@01))
      (not (= ret@85@01 ret@73@01))
      (not (= ret@85@01 ret@90@01)))
    (and
      (not (= ret@90@01 _1@27@01))
      (not (= ret@90@01 ret@68@01))
      (not (= ret@90@01 ret@73@01))
      (not (= ret@90@01 ret@85@01))))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@55@01)))))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@55@01)))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))))
; [eval] 0 <= idx
(set-option :timeout 0)
(push) ; 6
(assert (not (<= 0 i@97@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@90@01 ret@85@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@85@01 ret@73@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@90@01 ret@73@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@73@01 ret@68@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@85@01 ret@68@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@90@01 ret@68@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@68@01 _1@27@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@73@01 _1@27@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@85@01 _1@27@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@90@01 _1@27@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@55@01)))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= $t@74@01 $t@91@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@92@01 $t@75@01)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@75@01 $t@92@01)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (and
    (<
      $Perm.No
      (+
        (-
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (- $Perm.Write (read$ $Snap.unit))))
    (<
      $Perm.No
      (-
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))))
  (not (= $t@84@01 $t@89@01)))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (and
    (<
      $Perm.No
      (-
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))))
    (<
      $Perm.No
      (+
        (-
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (- $Perm.Write (read$ $Snap.unit)))))
  (not (= $t@89@01 $t@84@01)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) val_ref@70@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) $t@74@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) val_ref@87@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) $t@91@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= val_ref@70@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= val_ref@70@01 $t@74@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= val_ref@70@01 val_ref@87@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= val_ref@70@01 $t@91@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= $t@74@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= $t@74@01 val_ref@70@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= $t@74@01 val_ref@87@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= $t@74@01 $t@91@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= val_ref@87@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= val_ref@87@01 val_ref@70@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= val_ref@87@01 $t@74@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= val_ref@87@01 $t@91@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= $t@91@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= $t@91@01 val_ref@70@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= $t@91@01 $t@74@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= $t@91@01 val_ref@87@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(assert (and
  (and
    (and
      (not (= _1@27@01 ret@68@01))
      (not (= _1@27@01 ret@73@01))
      (not (= _1@27@01 ret@85@01))
      (not (= _1@27@01 ret@90@01)))
    (and
      (not (= ret@68@01 _1@27@01))
      (not (= ret@68@01 ret@73@01))
      (not (= ret@68@01 ret@85@01))
      (not (= ret@68@01 ret@90@01)))
    (and
      (not (= ret@73@01 _1@27@01))
      (not (= ret@73@01 ret@68@01))
      (not (= ret@73@01 ret@85@01))
      (not (= ret@73@01 ret@90@01)))
    (and
      (not (= ret@85@01 _1@27@01))
      (not (= ret@85@01 ret@68@01))
      (not (= ret@85@01 ret@73@01))
      (not (= ret@85@01 ret@90@01)))
    (and
      (not (= ret@90@01 _1@27@01))
      (not (= ret@90@01 ret@68@01))
      (not (= ret@90@01 ret@73@01))
      (not (= ret@90@01 ret@85@01))))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@55@01)))))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@55@01)))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))))
; [eval] 0 <= idx
(set-option :timeout 0)
(push) ; 6
(assert (not (<= 0 i@97@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@90@01 ret@85@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@85@01 ret@73@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@90@01 ret@73@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@73@01 ret@68@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@85@01 ret@68@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@90@01 ret@68@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@68@01 _1@27@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@73@01 _1@27@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@85@01 _1@27@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@90@01 _1@27@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@55@01)))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= $t@74@01 $t@91@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@92@01 $t@75@01)))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@75@01 $t@92@01)))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (and
    (<
      $Perm.No
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit)))
    (<
      $Perm.No
      (+
        (-
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (- $Perm.Write (read$ $Snap.unit)))))
  (not (= $t@89@01 $t@84@01)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (and
    (<
      $Perm.No
      (+
        (-
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (- $Perm.Write (read$ $Snap.unit))))
    (<
      $Perm.No
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit))))
  (not (= $t@84@01 $t@89@01)))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) val_ref@70@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) $t@74@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) val_ref@87@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) $t@91@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= val_ref@70@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= val_ref@70@01 $t@74@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= val_ref@70@01 val_ref@87@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= val_ref@70@01 $t@91@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= $t@74@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= $t@74@01 val_ref@70@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= $t@74@01 val_ref@87@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= $t@74@01 $t@91@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= val_ref@87@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= val_ref@87@01 val_ref@70@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= val_ref@87@01 $t@74@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= val_ref@87@01 $t@91@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= $t@91@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= $t@91@01 val_ref@70@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= $t@91@01 $t@74@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= $t@91@01 val_ref@87@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (and
  (and
    (and
      (not (= _1@27@01 ret@68@01))
      (not (= _1@27@01 ret@73@01))
      (not (= _1@27@01 ret@85@01))
      (not (= _1@27@01 ret@90@01)))
    (and
      (not (= ret@68@01 _1@27@01))
      (not (= ret@68@01 ret@73@01))
      (not (= ret@68@01 ret@85@01))
      (not (= ret@68@01 ret@90@01)))
    (and
      (not (= ret@73@01 _1@27@01))
      (not (= ret@73@01 ret@68@01))
      (not (= ret@73@01 ret@85@01))
      (not (= ret@73@01 ret@90@01)))
    (and
      (not (= ret@85@01 _1@27@01))
      (not (= ret@85@01 ret@68@01))
      (not (= ret@85@01 ret@73@01))
      (not (= ret@85@01 ret@90@01)))
    (and
      (not (= ret@90@01 _1@27@01))
      (not (= ret@90@01 ret@68@01))
      (not (= ret@90@01 ret@73@01))
      (not (= ret@90@01 ret@85@01))))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@55@01)))))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@55@01)))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))))
; [eval] 0 <= idx
(set-option :timeout 0)
(push) ; 6
(assert (not (<= 0 i@97@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(pop) ; 5
; [eval] lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$(_12.val_ref, i)
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
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [eval] 0 <= idx
(set-option :timeout 0)
(push) ; 6
(assert (not (<= 0 i@97@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@90@01 ret@85@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@85@01 ret@73@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@90@01 ret@73@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@73@01 ret@68@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@85@01 ret@68@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@90@01 ret@68@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@68@01 _1@27@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@73@01 _1@27@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@85@01 _1@27@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@90@01 _1@27@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@55@01)))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= $t@74@01 $t@91@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@92@01 $t@75@01)))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@75@01 $t@92@01)))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (and
    (<
      $Perm.No
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit)))
    (<
      $Perm.No
      (+
        (-
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (- $Perm.Write (read$ $Snap.unit)))))
  (not (= $t@89@01 $t@84@01)))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (and
    (<
      $Perm.No
      (+
        (-
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (- $Perm.Write (read$ $Snap.unit))))
    (<
      $Perm.No
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit))))
  (not (= $t@84@01 $t@89@01)))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) val_ref@70@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) $t@74@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) val_ref@87@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) $t@91@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= val_ref@70@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= val_ref@70@01 $t@74@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= val_ref@70@01 val_ref@87@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= val_ref@70@01 $t@91@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= $t@74@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= $t@74@01 val_ref@70@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= $t@74@01 val_ref@87@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= $t@74@01 $t@91@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= val_ref@87@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= val_ref@87@01 val_ref@70@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= val_ref@87@01 $t@74@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= val_ref@87@01 $t@91@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= $t@91@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= $t@91@01 val_ref@70@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= $t@91@01 $t@74@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= $t@91@01 val_ref@87@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(assert (and
  (and
    (and
      (not (= _1@27@01 ret@68@01))
      (not (= _1@27@01 ret@73@01))
      (not (= _1@27@01 ret@85@01))
      (not (= _1@27@01 ret@90@01)))
    (and
      (not (= ret@68@01 _1@27@01))
      (not (= ret@68@01 ret@73@01))
      (not (= ret@68@01 ret@85@01))
      (not (= ret@68@01 ret@90@01)))
    (and
      (not (= ret@73@01 _1@27@01))
      (not (= ret@73@01 ret@68@01))
      (not (= ret@73@01 ret@85@01))
      (not (= ret@73@01 ret@90@01)))
    (and
      (not (= ret@85@01 _1@27@01))
      (not (= ret@85@01 ret@68@01))
      (not (= ret@85@01 ret@73@01))
      (not (= ret@85@01 ret@90@01)))
    (and
      (not (= ret@90@01 _1@27@01))
      (not (= ret@90@01 ret@68@01))
      (not (= ret@90@01 ret@73@01))
      (not (= ret@90@01 ret@85@01))))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@55@01)))))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@55@01)))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))))
; [eval] 0 <= idx
(set-option :timeout 0)
(push) ; 6
(assert (not (<= 0 i@97@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@90@01 ret@85@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@85@01 ret@73@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@90@01 ret@73@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@73@01 ret@68@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@85@01 ret@68@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@90@01 ret@68@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@68@01 _1@27@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@73@01 _1@27@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@85@01 _1@27@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@90@01 _1@27@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@55@01)))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (and
    (<
      $Perm.No
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit)))
    (<
      $Perm.No
      (+
        (-
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (- $Perm.Write (read$ $Snap.unit)))))
  (not (= $t@89@01 $t@84@01)))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (and
    (<
      $Perm.No
      (+
        (-
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (- $Perm.Write (read$ $Snap.unit))))
    (<
      $Perm.No
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit))))
  (not (= $t@84@01 $t@89@01)))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) val_ref@70@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) $t@74@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) val_ref@87@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) $t@91@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= val_ref@70@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= val_ref@70@01 $t@74@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= val_ref@70@01 val_ref@87@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= val_ref@70@01 $t@91@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= $t@74@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= $t@74@01 val_ref@70@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= $t@74@01 val_ref@87@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= $t@74@01 $t@91@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= val_ref@87@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= val_ref@87@01 val_ref@70@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= val_ref@87@01 $t@74@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= val_ref@87@01 $t@91@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= $t@91@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= $t@91@01 val_ref@70@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= $t@91@01 $t@74@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= $t@91@01 val_ref@87@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(assert (and
  (and
    (and
      (not (= _1@27@01 ret@68@01))
      (not (= _1@27@01 ret@73@01))
      (not (= _1@27@01 ret@85@01))
      (not (= _1@27@01 ret@90@01)))
    (and
      (not (= ret@68@01 _1@27@01))
      (not (= ret@68@01 ret@73@01))
      (not (= ret@68@01 ret@85@01))
      (not (= ret@68@01 ret@90@01)))
    (and
      (not (= ret@73@01 _1@27@01))
      (not (= ret@73@01 ret@68@01))
      (not (= ret@73@01 ret@85@01))
      (not (= ret@73@01 ret@90@01)))
    (and
      (not (= ret@85@01 _1@27@01))
      (not (= ret@85@01 ret@68@01))
      (not (= ret@85@01 ret@73@01))
      (not (= ret@85@01 ret@90@01)))
    (and
      (not (= ret@90@01 _1@27@01))
      (not (= ret@90@01 ret@68@01))
      (not (= ret@90@01 ret@73@01))
      (not (= ret@90@01 ret@85@01))))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@55@01)))))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@55@01)))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))))
; [eval] 0 <= idx
(set-option :timeout 0)
(push) ; 6
(assert (not (<= 0 i@97@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@90@01 ret@85@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@85@01 ret@73@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@90@01 ret@73@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@73@01 ret@68@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@85@01 ret@68@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@90@01 ret@68@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@68@01 _1@27@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@73@01 _1@27@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@85@01 _1@27@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@90@01 _1@27@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@55@01)))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= $t@74@01 $t@91@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@92@01 $t@75@01)))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@75@01 $t@92@01)))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (and
    (<
      $Perm.No
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit)))
    (<
      $Perm.No
      (+
        (-
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (- $Perm.Write (read$ $Snap.unit)))))
  (not (= $t@89@01 $t@84@01)))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (and
    (<
      $Perm.No
      (+
        (-
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (- $Perm.Write (read$ $Snap.unit))))
    (<
      $Perm.No
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit))))
  (not (= $t@84@01 $t@89@01)))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) val_ref@70@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) $t@74@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) val_ref@87@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) $t@91@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= val_ref@70@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= val_ref@70@01 $t@74@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= val_ref@70@01 val_ref@87@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= val_ref@70@01 $t@91@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= $t@74@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= $t@74@01 val_ref@70@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= $t@74@01 val_ref@87@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= $t@74@01 $t@91@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= val_ref@87@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= val_ref@87@01 val_ref@70@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= val_ref@87@01 $t@74@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= val_ref@87@01 $t@91@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= $t@91@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= $t@91@01 val_ref@70@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= $t@91@01 $t@74@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= $t@91@01 val_ref@87@01))))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (and
  (and
    (and
      (not (= _1@27@01 ret@68@01))
      (not (= _1@27@01 ret@73@01))
      (not (= _1@27@01 ret@85@01))
      (not (= _1@27@01 ret@90@01)))
    (and
      (not (= ret@68@01 _1@27@01))
      (not (= ret@68@01 ret@73@01))
      (not (= ret@68@01 ret@85@01))
      (not (= ret@68@01 ret@90@01)))
    (and
      (not (= ret@73@01 _1@27@01))
      (not (= ret@73@01 ret@68@01))
      (not (= ret@73@01 ret@85@01))
      (not (= ret@73@01 ret@90@01)))
    (and
      (not (= ret@85@01 _1@27@01))
      (not (= ret@85@01 ret@68@01))
      (not (= ret@85@01 ret@73@01))
      (not (= ret@85@01 ret@90@01)))
    (and
      (not (= ret@90@01 _1@27@01))
      (not (= ret@90@01 ret@68@01))
      (not (= ret@90@01 ret@73@01))
      (not (= ret@90@01 ret@85@01))))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@55@01)))))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@55@01)))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))))
; [eval] 0 <= idx
(set-option :timeout 0)
(push) ; 6
(assert (not (<= 0 i@97@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(pop) ; 5
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@97@01 Int)) (!
  (and
    (or (not (<= 0 i@97@01)) (<= 0 i@97@01))
    (=>
      (and (< i@97@01 64) (<= 0 i@97@01))
      (and
        (< i@97@01 64)
        (<= 0 i@97@01)
        (lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$%precondition ($Snap.combine
          $t@89@01
          ($Snap.combine $Snap.unit $Snap.unit)) val_ref@87@01 i@97@01)
        (< i@97@01 (Slice$len__$TY$__usize$Slice$usize$$int$ $t@92@01 $t@91@01))
        (lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$%precondition ($Snap.combine
          $t@92@01
          ($Snap.combine $Snap.unit $Snap.unit)) $t@91@01 i@97@01)))
    (or
      (not (and (< i@97@01 64) (<= 0 i@97@01)))
      (and (< i@97@01 64) (<= 0 i@97@01))))
  
  :qid |prog.l818-aux|)))
(assert (forall ((i@97@01 Int)) (!
  (=>
    (and (< i@97@01 64) (<= 0 i@97@01))
    (=
      (lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$ ($Snap.combine
        $t@89@01
        ($Snap.combine $Snap.unit $Snap.unit)) val_ref@87@01 i@97@01)
      (lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$ ($Snap.combine
        $t@92@01
        ($Snap.combine $Snap.unit $Snap.unit)) $t@91@01 i@97@01)))
  
  :qid |prog.l818|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; label l7
; [exec]
; _11 := builtin$havoc_int()
(declare-const ret@98@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _11 := Slice$len__$TY$__usize$Slice$usize$$int$(_12.val_ref)
; [eval] Slice$len__$TY$__usize$Slice$usize$$int$(_12.val_ref)
(set-option :timeout 0)
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
(pop) ; 4
; Joined path conditions
(declare-const _11@99@01 Int)
(assert (= _11@99@01 (Slice$len__$TY$__usize$Slice$usize$$int$ $t@92@01 $t@91@01)))
; [eval] __t2 && (__t2 && __t2)
(set-option :timeout 0)
(push) ; 4
; [then-branch: 10 | True | live]
; [else-branch: 10 | False | live]
(push) ; 5
; [then-branch: 10 | True]
(push) ; 6
; [then-branch: 11 | True | live]
; [else-branch: 11 | False | live]
(push) ; 7
; [then-branch: 11 | True]
(pop) ; 7
(push) ; 7
; [else-branch: 11 | False]
(assert false)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(pop) ; 5
(push) ; 5
; [else-branch: 10 | False]
(assert false)
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0.01s
; (get-info :all-statistics)
; [then-branch: 12 | True | live]
; [else-branch: 12 | False | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 12 | True]
; [exec]
; exhale acc(Array$64$usize(_13.val_ref), read$())
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
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))))
  val_ref@87@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  (-
    (+
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
      (read$ $Snap.unit))
    ($Perm.min
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit))
      (read$ $Snap.unit)))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(assert (not (or
  (=
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    $Perm.No)
  (<
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
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
; [exec]
; inhale acc(Array$64$usize(_1.val_ref.f$max_counts), write - read$())
; [eval] write - read$()
; [eval] read$()
(set-option :timeout 0)
(push) ; 5
(pop) ; 5
; Joined path conditions
(push) ; 5
(assert (not (or
  (= (- $Perm.Write (read$ $Snap.unit)) $Perm.No)
  (< $Perm.No (- $Perm.Write (read$ $Snap.unit))))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(declare-const $t@100@01 $Snap)
(declare-const $t@101@01 $Snap)
(assert (and
  (=>
    (<
      $Perm.No
      (-
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))))
    (= $t@101@01 $t@89@01))
  (=> (< $Perm.No (- $Perm.Write (read$ $Snap.unit))) (= $t@101@01 $t@100@01))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; __t3 := true
; [exec]
; _7 := builtin$havoc_ref()
(declare-const ret@102@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_7.val_bool, write)
(declare-const $t@103@01 Bool)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@60@01 ret@102@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(assert (not (= ret@102@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _7.val_bool := _8 == _11
; [eval] _8 == _11
(declare-const val_bool@104@01 Bool)
(assert (= val_bool@104@01 (= _8@82@01 _11@99@01)))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@60@01 ret@102@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
; [exec]
; _6 := builtin$havoc_ref()
(declare-const ret@105@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_6.val_bool, write)
(declare-const $t@106@01 Bool)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@60@01 ret@105@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@102@01 ret@105@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(assert (not (= ret@105@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _6.val_bool := !_7.val_bool
; [eval] !_7.val_bool
(declare-const val_bool@107@01 Bool)
(assert (= val_bool@107@01 (not val_bool@104@01)))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@102@01 ret@105@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@60@01 ret@105@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t17 := _6.val_bool
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not val_bool@107@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [then-branch: 13 | val_bool@107@01 | dead]
; [else-branch: 13 | !(val_bool@107@01) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 13 | !(val_bool@107@01)]
(assert (not val_bool@107@01))
(pop) ; 5
; [eval] !__t17
(push) ; 5
(set-option :timeout 10)
(assert (not val_bool@107@01))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not val_bool@107@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [then-branch: 14 | !(val_bool@107@01) | live]
; [else-branch: 14 | val_bool@107@01 | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 14 | !(val_bool@107@01)]
(assert (not val_bool@107@01))
; [exec]
; label return
; [exec]
; __t5 := true
; [exec]
; _18 := builtin$havoc_int()
(declare-const ret@108@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _18 := _1.val_ref.f$current.val_int
; [exec]
; label l11
; [exec]
; _17 := builtin$havoc_ref()
(declare-const ret@109@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; inhale acc(_17.val_bool, write)
(declare-const $t@110@01 Bool)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@60@01 ret@109@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@102@01 ret@109@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@105@01 ret@109@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@109@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _17.val_bool := _18 < 64
; [eval] _18 < 64
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@105@01 ret@109@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@102@01 ret@109@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@60@01 ret@109@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
; [exec]
; _16 := builtin$havoc_ref()
(declare-const ret@111@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_16.val_bool, write)
(declare-const $t@112@01 Bool)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@60@01 ret@111@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@102@01 ret@111@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@105@01 ret@111@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@109@01 ret@111@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(assert (not (= ret@111@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _16.val_bool := !_17.val_bool
; [eval] !_17.val_bool
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@109@01 ret@111@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@105@01 ret@111@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@102@01 ret@111@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@60@01 ret@111@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
; [exec]
; __t18 := _16.val_bool
; [then-branch: 15 | False | dead]
; [else-branch: 15 | True | live]
(set-option :timeout 0)
(push) ; 6
; [else-branch: 15 | True]
(pop) ; 6
; [eval] !__t18
(push) ; 6
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
; [then-branch: 16 | True | live]
; [else-branch: 16 | False | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 16 | True]
; [exec]
; label bb0
; [exec]
; __t7 := true
; [exec]
; _23 := builtin$havoc_int()
(declare-const ret@113@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _23 := _1.val_ref.f$depth.val_int
; [exec]
; label l14
; [exec]
; _22 := builtin$havoc_ref()
(declare-const ret@114@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; inhale acc(_22.val_bool, write)
(declare-const $t@115@01 Bool)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@60@01 ret@114@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@102@01 ret@114@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@105@01 ret@114@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@109@01 ret@114@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@111@01 ret@114@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(assert (not (= ret@114@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _22.val_bool := _23 < 64
; [eval] _23 < 64
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@111@01 ret@114@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@109@01 ret@114@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@105@01 ret@114@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@102@01 ret@114@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@60@01 ret@114@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [exec]
; _21 := builtin$havoc_ref()
(declare-const ret@116@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_21.val_bool, write)
(declare-const $t@117@01 Bool)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@60@01 ret@116@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@102@01 ret@116@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@105@01 ret@116@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@109@01 ret@116@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@111@01 ret@116@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@114@01 ret@116@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(assert (not (= ret@116@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _21.val_bool := !_22.val_bool
; [eval] !_22.val_bool
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@114@01 ret@116@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@111@01 ret@116@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@109@01 ret@116@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@105@01 ret@116@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@102@01 ret@116@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@60@01 ret@116@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t19 := _21.val_bool
; [then-branch: 17 | False | dead]
; [else-branch: 17 | True | live]
(set-option :timeout 0)
(push) ; 7
; [else-branch: 17 | True]
(pop) ; 7
; [eval] !__t19
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [then-branch: 18 | True | live]
; [else-branch: 18 | False | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 18 | True]
; [exec]
; label bb1
; [exec]
; __t9 := true
; [exec]
; _28 := builtin$havoc_int()
(declare-const ret@118@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _28 := _1.val_ref.f$current.val_int
; [exec]
; label l17
; [exec]
; _29 := builtin$havoc_int()
(declare-const ret@119@01 Int)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _29 := _1.val_ref.f$depth.val_int
; [exec]
; label l18
; [exec]
; _27 := builtin$havoc_ref()
(declare-const ret@120@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; inhale acc(_27.val_bool, write)
(declare-const $t@121@01 Bool)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@60@01 ret@120@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@102@01 ret@120@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@105@01 ret@120@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@109@01 ret@120@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@111@01 ret@120@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@114@01 ret@120@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@116@01 ret@120@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.01s
; (get-info :all-statistics)
(assert (not (= ret@120@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _27.val_bool := _28 <= _29
; [eval] _28 <= _29
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@116@01 ret@120@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@114@01 ret@120@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@111@01 ret@120@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@109@01 ret@120@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@105@01 ret@120@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@102@01 ret@120@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@60@01 ret@120@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.01s
; (get-info :all-statistics)
; [exec]
; _26 := builtin$havoc_ref()
(declare-const ret@122@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_26.val_bool, write)
(declare-const $t@123@01 Bool)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@60@01 ret@122@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@102@01 ret@122@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@105@01 ret@122@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@109@01 ret@122@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@111@01 ret@122@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@114@01 ret@122@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@116@01 ret@122@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@120@01 ret@122@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.01s
; (get-info :all-statistics)
(assert (not (= ret@122@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _26.val_bool := !_27.val_bool
; [eval] !_27.val_bool
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@120@01 ret@122@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@116@01 ret@122@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@114@01 ret@122@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@111@01 ret@122@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@109@01 ret@122@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@105@01 ret@122@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@102@01 ret@122@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@60@01 ret@122@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.01s
; (get-info :all-statistics)
; [exec]
; __t20 := _26.val_bool
; [then-branch: 19 | False | dead]
; [else-branch: 19 | True | live]
(set-option :timeout 0)
(push) ; 8
; [else-branch: 19 | True]
(pop) ; 8
; [eval] !__t20
(push) ; 8
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 8
; 0.01s
; (get-info :all-statistics)
; [then-branch: 20 | True | live]
; [else-branch: 20 | False | dead]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 20 | True]
; [exec]
; label l4
; [exec]
; __t11 := true
; [exec]
; _35 := builtin$havoc_int()
(declare-const ret@124@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _35 := 0
; [exec]
; assert acc(Array$64$usize(_1.val_ref.f$entries), read$())
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
  (-
    (+
      (-
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))
      (- $Perm.Write (read$ $Snap.unit)))
    ($Perm.min
      (+
        (-
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (- $Perm.Write (read$ $Snap.unit)))
      (read$ $Snap.unit)))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 9
; 0.01s
; (get-info :all-statistics)
(assert (<=
  $Perm.No
  (-
    (+
      (-
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))
      (- $Perm.Write (read$ $Snap.unit)))
    ($Perm.min
      (+
        (-
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (- $Perm.Write (read$ $Snap.unit)))
      (read$ $Snap.unit)))))
(set-option :timeout 0)
(push) ; 9
(assert (not (or
  (=
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (+
          (-
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            ($Perm.min
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit)))
          (- $Perm.Write (read$ $Snap.unit)))
        (read$ $Snap.unit)))
    $Perm.No)
  (<
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (+
          (-
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            ($Perm.min
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit)))
          (- $Perm.Write (read$ $Snap.unit)))
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
; _36 := builtin$havoc_int()
(declare-const ret@125@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _36 := 64
; [exec]
; _37 := builtin$havoc_ref()
(declare-const ret@126@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; inhale acc(_37.val_bool, write)
(declare-const $t@127@01 Bool)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@60@01 ret@126@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@102@01 ret@126@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@105@01 ret@126@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@109@01 ret@126@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@111@01 ret@126@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@114@01 ret@126@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@116@01 ret@126@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@120@01 ret@126@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@122@01 ret@126@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.01s
; (get-info :all-statistics)
(assert (not (= ret@126@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _37.val_bool := _35 < _36
; [eval] _35 < _36
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@122@01 ret@126@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@120@01 ret@126@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@116@01 ret@126@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@114@01 ret@126@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@111@01 ret@126@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@109@01 ret@126@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@105@01 ret@126@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@102@01 ret@126@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@60@01 ret@126@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.01s
; (get-info :all-statistics)
; [exec]
; __t21 := _37.val_bool
; [exec]
; assert __t21
; [exec]
; __t12 := true
; [exec]
; __t22 := builtin$havoc_int()
(declare-const ret@128@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale __t22 >= 0
(declare-const $t@129@01 $Snap)
(assert (= $t@129@01 $Snap.unit))
; [eval] __t22 >= 0
(assert (>= ret@128@01 0))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert acc(Array$64$usize(_1.val_ref.f$entries), read$())
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
  (-
    (+
      (-
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))
      (- $Perm.Write (read$ $Snap.unit)))
    ($Perm.min
      (+
        (-
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (- $Perm.Write (read$ $Snap.unit)))
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
        (+
          (-
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            ($Perm.min
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit)))
          (- $Perm.Write (read$ $Snap.unit)))
        (read$ $Snap.unit)))
    $Perm.No)
  (<
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (+
          (-
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            ($Perm.min
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit)))
          (- $Perm.Write (read$ $Snap.unit)))
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
; inhale lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$(_1.val_ref.f$entries,
;   _35) ==
;   __t22
(declare-const $t@130@01 $Snap)
(assert (= $t@130@01 $Snap.unit))
; [eval] lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$(_1.val_ref.f$entries, _35) == __t22
; [eval] lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$(_1.val_ref.f$entries, _35)
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
  (-
    (+
      (-
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))
      (- $Perm.Write (read$ $Snap.unit)))
    ($Perm.min
      (+
        (-
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (- $Perm.Write (read$ $Snap.unit)))
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
        (+
          (-
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            ($Perm.min
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit)))
          (- $Perm.Write (read$ $Snap.unit)))
        (read$ $Snap.unit)))
    $Perm.No)
  (<
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (+
          (-
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            ($Perm.min
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit)))
          (- $Perm.Write (read$ $Snap.unit)))
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
; [eval] idx < 64
(assert (lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$%precondition ($Snap.combine
  $t@84@01
  ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))) 0))
(pop) ; 9
; Joined path conditions
(assert (lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$%precondition ($Snap.combine
  $t@84@01
  ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))) 0))
(assert (=
  (lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$ ($Snap.combine
    $t@84@01
    ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))) 0)
  ret@128@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _34 := builtin$havoc_int()
(declare-const ret@131@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale __t22 >= 0
(declare-const $t@132@01 $Snap)
(assert (= $t@132@01 $Snap.unit))
; [eval] __t22 >= 0
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _34 := __t22
; [exec]
; label l21
; [exec]
; _33 := builtin$havoc_ref()
(declare-const ret@133@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_33.val_bool, write)
(declare-const $t@134@01 Bool)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@60@01 ret@133@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@102@01 ret@133@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@105@01 ret@133@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@109@01 ret@133@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@111@01 ret@133@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@114@01 ret@133@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@116@01 ret@133@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@120@01 ret@133@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@122@01 ret@133@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@126@01 ret@133@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.01s
; (get-info :all-statistics)
(assert (not (= ret@133@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _33.val_bool := _34 == 0
; [eval] _34 == 0
(declare-const val_bool@135@01 Bool)
(assert (= val_bool@135@01 (= ret@128@01 0)))
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@126@01 ret@133@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@122@01 ret@133@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@120@01 ret@133@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@116@01 ret@133@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@114@01 ret@133@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@111@01 ret@133@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@109@01 ret@133@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@105@01 ret@133@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@102@01 ret@133@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@60@01 ret@133@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.01s
; (get-info :all-statistics)
; [exec]
; _32 := builtin$havoc_ref()
(declare-const ret@136@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_32.val_bool, write)
(declare-const $t@137@01 Bool)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@60@01 ret@136@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@102@01 ret@136@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@105@01 ret@136@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@109@01 ret@136@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@111@01 ret@136@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@114@01 ret@136@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@116@01 ret@136@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@120@01 ret@136@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@122@01 ret@136@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@126@01 ret@136@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@133@01 ret@136@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.01s
; (get-info :all-statistics)
(assert (not (= ret@136@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _32.val_bool := !_33.val_bool
; [eval] !_33.val_bool
(declare-const val_bool@138@01 Bool)
(assert (= val_bool@138@01 (not val_bool@135@01)))
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@133@01 ret@136@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@126@01 ret@136@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@122@01 ret@136@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@120@01 ret@136@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@116@01 ret@136@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@114@01 ret@136@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@111@01 ret@136@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@109@01 ret@136@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@105@01 ret@136@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@102@01 ret@136@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@60@01 ret@136@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t23 := _32.val_bool
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not val_bool@138@01)))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [then-branch: 21 | val_bool@138@01 | dead]
; [else-branch: 21 | !(val_bool@138@01) | live]
(set-option :timeout 0)
(push) ; 9
; [else-branch: 21 | !(val_bool@138@01)]
(assert (not val_bool@138@01))
(pop) ; 9
; [eval] !__t23
(push) ; 9
(set-option :timeout 10)
(assert (not val_bool@138@01))
(check-sat)
; unknown
(pop) ; 9
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not val_bool@138@01)))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [then-branch: 22 | !(val_bool@138@01) | live]
; [else-branch: 22 | val_bool@138@01 | dead]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 22 | !(val_bool@138@01)]
(assert (not val_bool@138@01))
; [exec]
; label bb2
; [exec]
; __t14 := true
; [exec]
; label l25
; [exec]
; fold acc(usize(_1.val_ref.f$current), write)
; [eval] 0 <= self.val_int
(assert (usize%trigger ($Snap.combine ($SortWrappers.IntTo$Snap 0) $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@55@01)))))
; [exec]
; fold acc(usize(_1.val_ref.f$depth), write)
; [eval] 0 <= self.val_int
(assert (usize%trigger ($Snap.combine ($SortWrappers.IntTo$Snap 0) $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@55@01)))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))
(check-sat)
; unknown
(pop) ; 10
; 0.01s
; (get-info :all-statistics)
; [exec]
; fold acc(struct$m_Path(_1.val_ref), write)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  (-
    (+
      (-
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))
      (- $Perm.Write (read$ $Snap.unit)))
    ($Perm.min
      (+
        (-
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (- $Perm.Write (read$ $Snap.unit)))
      $Perm.Write))
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
      $Perm.Write
      ($Perm.min
        (+
          (-
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            ($Perm.min
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit)))
          (- $Perm.Write (read$ $Snap.unit)))
        $Perm.Write))
    $Perm.No)
  (<
    (-
      $Perm.Write
      ($Perm.min
        (+
          (-
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            ($Perm.min
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit)))
          (- $Perm.Write (read$ $Snap.unit)))
        $Perm.Write))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  (-
    (+
      (-
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))
      (- $Perm.Write (read$ $Snap.unit)))
    ($Perm.min
      (+
        (-
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (- $Perm.Write (read$ $Snap.unit)))
      $Perm.Write))
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
      $Perm.Write
      ($Perm.min
        (+
          (-
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            ($Perm.min
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit)))
          (- $Perm.Write (read$ $Snap.unit)))
        $Perm.Write))
    $Perm.No)
  (<
    (-
      $Perm.Write
      ($Perm.min
        (+
          (-
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            ($Perm.min
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit)))
          (- $Perm.Write (read$ $Snap.unit)))
        $Perm.Write))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(assert (struct$m_Path%trigger ($Snap.combine
  ($Snap.first ($Snap.second $t@55@01))
  ($Snap.combine
    ($Snap.combine ($SortWrappers.IntTo$Snap 0) $Snap.unit)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@55@01))))
      ($Snap.combine
        ($Snap.combine ($SortWrappers.IntTo$Snap 0) $Snap.unit)
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))
          ($Snap.combine
            $t@84@01
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))
              $t@101@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))
; [exec]
; _old$pre$0 := _1.val_ref
(declare-const _old$pre$0@139@01 $Ref)
(assert (= _old$pre$0@139@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))
; [exec]
; fold acc(tuple0$(_0), write)
(assert (tuple0$%trigger $Snap.unit _0@1@01))
; [exec]
; assert (unfolding acc(struct$m_Path(_old$pre$0), write) in
;     (unfolding acc(usize(_old$pre$0.f$current), write) in
;       _old$pre$0.f$current.val_int)) ==
;   0 &&
;   ((unfolding acc(struct$m_Path(_old$pre$0), write) in
;     (unfolding acc(usize(_old$pre$0.f$depth), write) in
;       _old$pre$0.f$depth.val_int)) ==
;   0 &&
;   (read$Snap$Array$64$usize$__$TY$__Snap$Array$64$usize$$int$$$int$((unfolding acc(struct$m_Path(_old$pre$0), write) in
;     snap$__$TY$__Snap$Array$64$usize$Array$64$usize$Snap$Array$64$usize(_old$pre$0.f$entries)),
;   0) ==
;   0 &&
;   m_Path$$invariant__$TY$__Snap$struct$m_Path$$bool$(snap$__$TY$__Snap$struct$m_Path$struct$m_Path$Snap$struct$m_Path(_old$pre$0))))
; [eval] (unfolding acc(struct$m_Path(_old$pre$0), write) in (unfolding acc(usize(_old$pre$0.f$current), write) in _old$pre$0.f$current.val_int)) == 0
; [eval] (unfolding acc(struct$m_Path(_old$pre$0), write) in (unfolding acc(usize(_old$pre$0.f$current), write) in _old$pre$0.f$current.val_int))
(push) ; 10
(push) ; 11
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) _old$pre$0@139@01)))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(assert (struct$m_Path%trigger ($Snap.combine
  ($Snap.first ($Snap.second $t@55@01))
  ($Snap.combine
    ($Snap.combine ($SortWrappers.IntTo$Snap 0) $Snap.unit)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@55@01))))
      ($Snap.combine
        ($Snap.combine ($SortWrappers.IntTo$Snap 0) $Snap.unit)
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))
          ($Snap.combine
            $t@84@01
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))
              $t@101@01))))))) _old$pre$0@139@01))
(assert (not (= _old$pre$0@139@01 $Ref.null)))
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@55@01)))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))
(check-sat)
; unknown
(pop) ; 11
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))))))
(check-sat)
; unknown
(pop) ; 11
; 0.01s
; (get-info :all-statistics)
; [eval] (unfolding acc(usize(_old$pre$0.f$current), write) in _old$pre$0.f$current.val_int)
(set-option :timeout 0)
(push) ; 11
; [eval] 0 <= self.val_int
(pop) ; 11
; Joined path conditions
(pop) ; 10
; Joined path conditions
(assert (and
  (struct$m_Path%trigger ($Snap.combine
    ($Snap.first ($Snap.second $t@55@01))
    ($Snap.combine
      ($Snap.combine ($SortWrappers.IntTo$Snap 0) $Snap.unit)
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@55@01))))
        ($Snap.combine
          ($Snap.combine ($SortWrappers.IntTo$Snap 0) $Snap.unit)
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))
            ($Snap.combine
              $t@84@01
              ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))
                $t@101@01))))))) _old$pre$0@139@01)
  (not (= _old$pre$0@139@01 $Ref.null))))
; [eval] (unfolding acc(struct$m_Path(_old$pre$0), write) in (unfolding acc(usize(_old$pre$0.f$depth), write) in _old$pre$0.f$depth.val_int)) == 0
; [eval] (unfolding acc(struct$m_Path(_old$pre$0), write) in (unfolding acc(usize(_old$pre$0.f$depth), write) in _old$pre$0.f$depth.val_int))
(push) ; 10
(push) ; 11
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) _old$pre$0@139@01)))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@55@01)))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))
(check-sat)
; unknown
(pop) ; 11
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))))))
(check-sat)
; unknown
(pop) ; 11
; 0.01s
; (get-info :all-statistics)
; [eval] (unfolding acc(usize(_old$pre$0.f$depth), write) in _old$pre$0.f$depth.val_int)
(set-option :timeout 0)
(push) ; 11
; [eval] 0 <= self.val_int
(pop) ; 11
; Joined path conditions
(pop) ; 10
; Joined path conditions
; [eval] read$Snap$Array$64$usize$__$TY$__Snap$Array$64$usize$$int$$$int$((unfolding acc(struct$m_Path(_old$pre$0), write) in snap$__$TY$__Snap$Array$64$usize$Array$64$usize$Snap$Array$64$usize(_old$pre$0.f$entries)), 0) == 0
; [eval] read$Snap$Array$64$usize$__$TY$__Snap$Array$64$usize$$int$$$int$((unfolding acc(struct$m_Path(_old$pre$0), write) in snap$__$TY$__Snap$Array$64$usize$Array$64$usize$Snap$Array$64$usize(_old$pre$0.f$entries)), 0)
; [eval] (unfolding acc(struct$m_Path(_old$pre$0), write) in snap$__$TY$__Snap$Array$64$usize$Array$64$usize$Snap$Array$64$usize(_old$pre$0.f$entries))
(push) ; 10
(push) ; 11
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) _old$pre$0@139@01)))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@55@01)))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))
(check-sat)
; unknown
(pop) ; 11
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))))))
(check-sat)
; unknown
(pop) ; 11
; 0.01s
; (get-info :all-statistics)
; [eval] snap$__$TY$__Snap$Array$64$usize$Array$64$usize$Snap$Array$64$usize(_old$pre$0.f$entries)
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
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 12
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
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
(assert (snap$__$TY$__Snap$Array$64$usize$Array$64$usize$Snap$Array$64$usize%precondition $t@84@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))))
(pop) ; 11
; Joined path conditions
(assert (snap$__$TY$__Snap$Array$64$usize$Array$64$usize$Snap$Array$64$usize%precondition $t@84@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))))
(pop) ; 10
; Joined path conditions
(assert (snap$__$TY$__Snap$Array$64$usize$Array$64$usize$Snap$Array$64$usize%precondition $t@84@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))))
(set-option :timeout 0)
(push) ; 10
(assert (not (=
  (read$Snap$Array$64$usize$__$TY$__Snap$Array$64$usize$$int$$$int$<Int> (snap$__$TY$__Snap$Array$64$usize$Array$64$usize$Snap$Array$64$usize $t@84@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))) 0)
  0)))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(assert (=
  (read$Snap$Array$64$usize$__$TY$__Snap$Array$64$usize$$int$$$int$<Int> (snap$__$TY$__Snap$Array$64$usize$Array$64$usize$Snap$Array$64$usize $t@84@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))) 0)
  0))
; [eval] m_Path$$invariant__$TY$__Snap$struct$m_Path$$bool$(snap$__$TY$__Snap$struct$m_Path$struct$m_Path$Snap$struct$m_Path(_old$pre$0))
; [eval] snap$__$TY$__Snap$struct$m_Path$struct$m_Path$Snap$struct$m_Path(_old$pre$0)
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
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) _old$pre$0@139@01)))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 11
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
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
(assert (snap$__$TY$__Snap$struct$m_Path$struct$m_Path$Snap$struct$m_Path%precondition ($Snap.combine
  ($Snap.first ($Snap.second $t@55@01))
  ($Snap.combine
    ($Snap.combine ($SortWrappers.IntTo$Snap 0) $Snap.unit)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@55@01))))
      ($Snap.combine
        ($Snap.combine ($SortWrappers.IntTo$Snap 0) $Snap.unit)
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))
          ($Snap.combine
            $t@84@01
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))
              $t@101@01))))))) _old$pre$0@139@01))
(pop) ; 10
; Joined path conditions
(assert (snap$__$TY$__Snap$struct$m_Path$struct$m_Path$Snap$struct$m_Path%precondition ($Snap.combine
  ($Snap.first ($Snap.second $t@55@01))
  ($Snap.combine
    ($Snap.combine ($SortWrappers.IntTo$Snap 0) $Snap.unit)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@55@01))))
      ($Snap.combine
        ($Snap.combine ($SortWrappers.IntTo$Snap 0) $Snap.unit)
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))
          ($Snap.combine
            $t@84@01
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))
              $t@101@01))))))) _old$pre$0@139@01))
(set-option :timeout 0)
(push) ; 10
(assert (m_Path$$invariant__$TY$__Snap$struct$m_Path$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$struct$m_Path$struct$m_Path$Snap$struct$m_Path ($Snap.combine
  ($Snap.first ($Snap.second $t@55@01))
  ($Snap.combine
    ($Snap.combine ($SortWrappers.IntTo$Snap 0) $Snap.unit)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@55@01))))
      ($Snap.combine
        ($Snap.combine ($SortWrappers.IntTo$Snap 0) $Snap.unit)
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))
          ($Snap.combine
            $t@84@01
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))
              $t@101@01))))))) _old$pre$0@139@01)))
(pop) ; 10
; Joined path conditions
(assert (m_Path$$invariant__$TY$__Snap$struct$m_Path$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$struct$m_Path$struct$m_Path$Snap$struct$m_Path ($Snap.combine
  ($Snap.first ($Snap.second $t@55@01))
  ($Snap.combine
    ($Snap.combine ($SortWrappers.IntTo$Snap 0) $Snap.unit)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@55@01))))
      ($Snap.combine
        ($Snap.combine ($SortWrappers.IntTo$Snap 0) $Snap.unit)
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))
          ($Snap.combine
            $t@84@01
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))
              $t@101@01))))))) _old$pre$0@139@01)))
(push) ; 10
(assert (not (m_Path$$invariant__$TY$__Snap$struct$m_Path$$bool$ ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$struct$m_Path$struct$m_Path$Snap$struct$m_Path ($Snap.combine
  ($Snap.first ($Snap.second $t@55@01))
  ($Snap.combine
    ($Snap.combine ($SortWrappers.IntTo$Snap 0) $Snap.unit)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@55@01))))
      ($Snap.combine
        ($Snap.combine ($SortWrappers.IntTo$Snap 0) $Snap.unit)
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))
          ($Snap.combine
            $t@84@01
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))
              $t@101@01))))))) _old$pre$0@139@01))))
(check-sat)
; unsat
(pop) ; 10
; 0.05s
; (get-info :all-statistics)
(assert (m_Path$$invariant__$TY$__Snap$struct$m_Path$$bool$ ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$struct$m_Path$struct$m_Path$Snap$struct$m_Path ($Snap.combine
  ($Snap.first ($Snap.second $t@55@01))
  ($Snap.combine
    ($Snap.combine ($SortWrappers.IntTo$Snap 0) $Snap.unit)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@55@01))))
      ($Snap.combine
        ($Snap.combine ($SortWrappers.IntTo$Snap 0) $Snap.unit)
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))
          ($Snap.combine
            $t@84@01
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))
              $t@101@01))))))) _old$pre$0@139@01)))
; [exec]
; assert true
; [exec]
; exhale acc(struct$m_Path(_old$pre$0), write)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) _old$pre$0@139@01)))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(tuple0$(_0), write)
; [exec]
; label end_of_method
(pop) ; 9
(pop) ; 8
(pop) ; 7
(pop) ; 6
(pop) ; 5
(pop) ; 4
; [eval] !(__t2 && (__t2 && __t2))
; [eval] __t2 && (__t2 && __t2)
(set-option :timeout 0)
(push) ; 4
; [then-branch: 23 | True | live]
; [else-branch: 23 | False | live]
(push) ; 5
; [then-branch: 23 | True]
(push) ; 6
; [then-branch: 24 | True | live]
; [else-branch: 24 | False | live]
(push) ; 7
; [then-branch: 24 | True]
(pop) ; 7
(push) ; 7
; [else-branch: 24 | False]
(assert false)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(pop) ; 5
(push) ; 5
; [else-branch: 23 | False]
(assert false)
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
; [then-branch: 25 | False | dead]
; [else-branch: 25 | True | live]
(push) ; 4
; [else-branch: 25 | True]
(pop) ; 4
(pop) ; 3
; [eval] !(__t1 && (__t1 && __t1))
; [eval] __t1 && (__t1 && __t1)
(push) ; 3
; [then-branch: 26 | True | live]
; [else-branch: 26 | False | live]
(push) ; 4
; [then-branch: 26 | True]
(push) ; 5
; [then-branch: 27 | True | live]
; [else-branch: 27 | False | live]
(push) ; 6
; [then-branch: 27 | True]
(pop) ; 6
(push) ; 6
; [else-branch: 27 | False]
(assert false)
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(pop) ; 4
(push) ; 4
; [else-branch: 26 | False]
(assert false)
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
; [then-branch: 28 | False | dead]
; [else-branch: 28 | True | live]
(push) ; 3
; [else-branch: 28 | True]
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- builtin$havoc_bool ----------
(declare-const ret@140@01 Bool)
(declare-const ret@141@01 Bool)
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
(declare-const ret@142@01 Int)
(declare-const ret@143@01 Int)
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
(declare-const ret@144@01 $Ref)
(declare-const ret@145@01 $Ref)
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
