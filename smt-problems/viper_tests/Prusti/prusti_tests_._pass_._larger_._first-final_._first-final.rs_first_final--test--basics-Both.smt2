(get-info :version)
; (:version "4.12.1")
; Started: 2023-10-31 14:16:42
; Silicon.version: 1.1-SNAPSHOT (46944a65@dspil_symbenchmarking)
; Input file: /home/pcorrect/repos/benchmarking_general/silicon_tests/prusti_tests_._pass_._larger_._first-final_._first-final.rs_first_final--test--basics-Both.vpr
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
(declare-sort Set<Int> 0)
(declare-sort Set<$Ref> 0)
(declare-sort Set<Bool> 0)
(declare-sort Set<$Snap> 0)
(declare-sort MirrorDomain 0)
(declare-sort Snap$m_Link$_beg_$_end_ 0)
(declare-sort Snap$m_TrustedOption$_beg_$_end_ 0)
(declare-sort Snap$struct$m_List 0)
(declare-sort Snap$struct$m_Node 0)
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
(declare-fun $SortWrappers.Snap$m_Link$_beg_$_end_To$Snap (Snap$m_Link$_beg_$_end_) $Snap)
(declare-fun $SortWrappers.$SnapToSnap$m_Link$_beg_$_end_ ($Snap) Snap$m_Link$_beg_$_end_)
(assert (forall ((x Snap$m_Link$_beg_$_end_)) (!
    (= x ($SortWrappers.$SnapToSnap$m_Link$_beg_$_end_($SortWrappers.Snap$m_Link$_beg_$_end_To$Snap x)))
    :pattern (($SortWrappers.Snap$m_Link$_beg_$_end_To$Snap x))
    :qid |$Snap.$SnapToSnap$m_Link$_beg_$_end_To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Snap$m_Link$_beg_$_end_To$Snap($SortWrappers.$SnapToSnap$m_Link$_beg_$_end_ x)))
    :pattern (($SortWrappers.$SnapToSnap$m_Link$_beg_$_end_ x))
    :qid |$Snap.Snap$m_Link$_beg_$_end_To$SnapToSnap$m_Link$_beg_$_end_|
    )))
(declare-fun $SortWrappers.Snap$m_TrustedOption$_beg_$_end_To$Snap (Snap$m_TrustedOption$_beg_$_end_) $Snap)
(declare-fun $SortWrappers.$SnapToSnap$m_TrustedOption$_beg_$_end_ ($Snap) Snap$m_TrustedOption$_beg_$_end_)
(assert (forall ((x Snap$m_TrustedOption$_beg_$_end_)) (!
    (= x ($SortWrappers.$SnapToSnap$m_TrustedOption$_beg_$_end_($SortWrappers.Snap$m_TrustedOption$_beg_$_end_To$Snap x)))
    :pattern (($SortWrappers.Snap$m_TrustedOption$_beg_$_end_To$Snap x))
    :qid |$Snap.$SnapToSnap$m_TrustedOption$_beg_$_end_To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Snap$m_TrustedOption$_beg_$_end_To$Snap($SortWrappers.$SnapToSnap$m_TrustedOption$_beg_$_end_ x)))
    :pattern (($SortWrappers.$SnapToSnap$m_TrustedOption$_beg_$_end_ x))
    :qid |$Snap.Snap$m_TrustedOption$_beg_$_end_To$SnapToSnap$m_TrustedOption$_beg_$_end_|
    )))
(declare-fun $SortWrappers.Snap$struct$m_ListTo$Snap (Snap$struct$m_List) $Snap)
(declare-fun $SortWrappers.$SnapToSnap$struct$m_List ($Snap) Snap$struct$m_List)
(assert (forall ((x Snap$struct$m_List)) (!
    (= x ($SortWrappers.$SnapToSnap$struct$m_List($SortWrappers.Snap$struct$m_ListTo$Snap x)))
    :pattern (($SortWrappers.Snap$struct$m_ListTo$Snap x))
    :qid |$Snap.$SnapToSnap$struct$m_ListTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Snap$struct$m_ListTo$Snap($SortWrappers.$SnapToSnap$struct$m_List x)))
    :pattern (($SortWrappers.$SnapToSnap$struct$m_List x))
    :qid |$Snap.Snap$struct$m_ListTo$SnapToSnap$struct$m_List|
    )))
(declare-fun $SortWrappers.Snap$struct$m_NodeTo$Snap (Snap$struct$m_Node) $Snap)
(declare-fun $SortWrappers.$SnapToSnap$struct$m_Node ($Snap) Snap$struct$m_Node)
(assert (forall ((x Snap$struct$m_Node)) (!
    (= x ($SortWrappers.$SnapToSnap$struct$m_Node($SortWrappers.Snap$struct$m_NodeTo$Snap x)))
    :pattern (($SortWrappers.Snap$struct$m_NodeTo$Snap x))
    :qid |$Snap.$SnapToSnap$struct$m_NodeTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Snap$struct$m_NodeTo$Snap($SortWrappers.$SnapToSnap$struct$m_Node x)))
    :pattern (($SortWrappers.$SnapToSnap$struct$m_Node x))
    :qid |$Snap.Snap$struct$m_NodeTo$SnapToSnap$struct$m_Node|
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
(declare-fun discriminant$__$TY$__Snap$m_Link$_beg_$_end_$Snap$m_Link$_beg_$_end_$$int$<Int> (Snap$m_Link$_beg_$_end_) Int)
(declare-fun Snap$m_Link$_beg_$_end_$1$field$f$0__$TY$__Snap$m_Link$_beg_$_end_$Snap$struct$m_Node<Snap$struct$m_Node> (Snap$m_Link$_beg_$_end_) Snap$struct$m_Node)
(declare-fun discriminant$__$TY$__Snap$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_$$int$<Int> (Snap$m_TrustedOption$_beg_$_end_) Int)
(declare-fun cons$0$__$TY$__Snap$m_TrustedOption$_beg_$_end_$$int$$Snap$m_TrustedOption$_beg_$_end_<Snap$m_TrustedOption$_beg_$_end_> (Int) Snap$m_TrustedOption$_beg_$_end_)
(declare-fun Snap$m_TrustedOption$_beg_$_end_$0$field$f$0__$TY$__Snap$m_TrustedOption$_beg_$_end_$$int$<Int> (Snap$m_TrustedOption$_beg_$_end_) Int)
(declare-const cons$1$__$TY$__Snap$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_<Snap$m_TrustedOption$_beg_$_end_> Snap$m_TrustedOption$_beg_$_end_)
(declare-fun mirror_simple$m_Link$$is_empty__$TY$__Snap$m_Link$_beg_$_end_$$bool$<Bool> (Snap$m_Link$_beg_$_end_) Bool)
(declare-fun mirror_simple$m_Link$$len__$TY$__Snap$m_Link$_beg_$_end_$$int$<Int> (Snap$m_Link$_beg_$_end_) Int)
(declare-fun mirror_simple$m_Link$$lookup__$TY$__Snap$m_Link$_beg_$_end_$$int$$$int$<Int> (Snap$m_Link$_beg_$_end_ Int) Int)
(declare-fun mirror_simple$m_List$$len__$TY$__Snap$struct$m_List$$int$<Int> (Snap$struct$m_List) Int)
(declare-fun mirror_simple$m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$<Int> (Snap$struct$m_List Int) Int)
(declare-fun mirror_simple$m_TrustedOption$$is_none__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$<Bool> (Snap$m_TrustedOption$_beg_$_end_) Bool)
(declare-fun mirror_simple$m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$<Bool> (Snap$m_TrustedOption$_beg_$_end_) Bool)
(declare-fun mirror_simple$m_TrustedOption$$peek__$TY$__Snap$m_TrustedOption$_beg_$_end_$$int$<Int> (Snap$m_TrustedOption$_beg_$_end_) Int)
(declare-fun cons$0$__$TY$__Snap$struct$m_List$Snap$m_Link$_beg_$_end_$Snap$struct$m_List<Snap$struct$m_List> (Snap$m_Link$_beg_$_end_) Snap$struct$m_List)
(declare-fun Snap$struct$m_List$0$field$f$head__$TY$__Snap$struct$m_List$Snap$m_Link$_beg_$_end_<Snap$m_Link$_beg_$_end_> (Snap$struct$m_List) Snap$m_Link$_beg_$_end_)
(declare-fun Snap$struct$m_Node$0$field$f$elem__$TY$__Snap$struct$m_Node$$int$<Int> (Snap$struct$m_Node) Int)
(declare-fun Snap$struct$m_Node$0$field$f$next__$TY$__Snap$struct$m_Node$Snap$m_Link$_beg_$_end_<Snap$m_Link$_beg_$_end_> (Snap$struct$m_Node) Snap$m_Link$_beg_$_end_)
; /field_value_functions_declarations.smt2 [val_ref: Ref]
(declare-fun $FVF.domain_val_ref ($FVF<val_ref>) Set<$Ref>)
(declare-fun $FVF.lookup_val_ref ($FVF<val_ref> $Ref) $Ref)
(declare-fun $FVF.after_val_ref ($FVF<val_ref> $FVF<val_ref>) Bool)
(declare-fun $FVF.loc_val_ref ($Ref $Ref) Bool)
(declare-fun $FVF.perm_val_ref ($FPM $Ref) $Perm)
(declare-const $fvfTOP_val_ref $FVF<val_ref>)
; Declaring symbols related to program functions (from program analysis)
(declare-fun m_Link$$is_empty__$TY$__Snap$m_Link$_beg_$_end_$$bool$ ($Snap Snap$m_Link$_beg_$_end_) Bool)
(declare-fun m_Link$$is_empty__$TY$__Snap$m_Link$_beg_$_end_$$bool$%limited ($Snap Snap$m_Link$_beg_$_end_) Bool)
(declare-fun m_Link$$is_empty__$TY$__Snap$m_Link$_beg_$_end_$$bool$%stateless (Snap$m_Link$_beg_$_end_) Bool)
(declare-fun m_Link$$is_empty__$TY$__Snap$m_Link$_beg_$_end_$$bool$%precondition ($Snap Snap$m_Link$_beg_$_end_) Bool)
(declare-fun builtin$unreach__$TY$__$int$$$int$ ($Snap) Int)
(declare-fun builtin$unreach__$TY$__$int$$$int$%limited ($Snap) Int)
(declare-const builtin$unreach__$TY$__$int$$$int$%stateless Bool)
(declare-fun builtin$unreach__$TY$__$int$$$int$%precondition ($Snap) Bool)
(declare-fun m_Link$$len__$TY$__Snap$m_Link$_beg_$_end_$$int$ ($Snap Snap$m_Link$_beg_$_end_) Int)
(declare-fun m_Link$$len__$TY$__Snap$m_Link$_beg_$_end_$$int$%limited ($Snap Snap$m_Link$_beg_$_end_) Int)
(declare-fun m_Link$$len__$TY$__Snap$m_Link$_beg_$_end_$$int$%stateless (Snap$m_Link$_beg_$_end_) Bool)
(declare-fun m_Link$$len__$TY$__Snap$m_Link$_beg_$_end_$$int$%precondition ($Snap Snap$m_Link$_beg_$_end_) Bool)
(declare-fun read$ ($Snap) $Perm)
(declare-fun read$%limited ($Snap) $Perm)
(declare-const read$%stateless Bool)
(declare-fun read$%precondition ($Snap) Bool)
(declare-fun m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$ ($Snap Snap$m_TrustedOption$_beg_$_end_) Bool)
(declare-fun m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$%limited ($Snap Snap$m_TrustedOption$_beg_$_end_) Bool)
(declare-fun m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$%stateless (Snap$m_TrustedOption$_beg_$_end_) Bool)
(declare-fun m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$%precondition ($Snap Snap$m_TrustedOption$_beg_$_end_) Bool)
(declare-fun m_Link$$lookup__$TY$__Snap$m_Link$_beg_$_end_$$int$$$int$ ($Snap Snap$m_Link$_beg_$_end_ Int) Int)
(declare-fun m_Link$$lookup__$TY$__Snap$m_Link$_beg_$_end_$$int$$$int$%limited ($Snap Snap$m_Link$_beg_$_end_ Int) Int)
(declare-fun m_Link$$lookup__$TY$__Snap$m_Link$_beg_$_end_$$int$$$int$%stateless (Snap$m_Link$_beg_$_end_ Int) Bool)
(declare-fun m_Link$$lookup__$TY$__Snap$m_Link$_beg_$_end_$$int$$$int$%precondition ($Snap Snap$m_Link$_beg_$_end_ Int) Bool)
(declare-fun m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap Snap$struct$m_List) Int)
(declare-fun m_List$$len__$TY$__Snap$struct$m_List$$int$%limited ($Snap Snap$struct$m_List) Int)
(declare-fun m_List$$len__$TY$__Snap$struct$m_List$$int$%stateless (Snap$struct$m_List) Bool)
(declare-fun m_List$$len__$TY$__Snap$struct$m_List$$int$%precondition ($Snap Snap$struct$m_List) Bool)
(declare-fun snap$__$TY$__Snap$m_Link$_beg_$_end_$m_Link$_beg_$_end_$Snap$m_Link$_beg_$_end_ ($Snap $Ref) Snap$m_Link$_beg_$_end_)
(declare-fun snap$__$TY$__Snap$m_Link$_beg_$_end_$m_Link$_beg_$_end_$Snap$m_Link$_beg_$_end_%limited ($Snap $Ref) Snap$m_Link$_beg_$_end_)
(declare-fun snap$__$TY$__Snap$m_Link$_beg_$_end_$m_Link$_beg_$_end_$Snap$m_Link$_beg_$_end_%stateless ($Ref) Bool)
(declare-fun snap$__$TY$__Snap$m_Link$_beg_$_end_$m_Link$_beg_$_end_$Snap$m_Link$_beg_$_end_%precondition ($Snap $Ref) Bool)
(declare-fun snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ ($Snap $Ref) Snap$m_TrustedOption$_beg_$_end_)
(declare-fun snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_%limited ($Snap $Ref) Snap$m_TrustedOption$_beg_$_end_)
(declare-fun snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_%stateless ($Ref) Bool)
(declare-fun snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_%precondition ($Snap $Ref) Bool)
(declare-fun m_TrustedOption$$peek__$TY$__Snap$m_TrustedOption$_beg_$_end_$$int$ ($Snap Snap$m_TrustedOption$_beg_$_end_) Int)
(declare-fun m_TrustedOption$$peek__$TY$__Snap$m_TrustedOption$_beg_$_end_$$int$%limited ($Snap Snap$m_TrustedOption$_beg_$_end_) Int)
(declare-fun m_TrustedOption$$peek__$TY$__Snap$m_TrustedOption$_beg_$_end_$$int$%stateless (Snap$m_TrustedOption$_beg_$_end_) Bool)
(declare-fun m_TrustedOption$$peek__$TY$__Snap$m_TrustedOption$_beg_$_end_$$int$%precondition ($Snap Snap$m_TrustedOption$_beg_$_end_) Bool)
(declare-fun m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$ ($Snap Snap$struct$m_List Int) Int)
(declare-fun m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%limited ($Snap Snap$struct$m_List Int) Int)
(declare-fun m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%stateless (Snap$struct$m_List Int) Bool)
(declare-fun m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap Snap$struct$m_List Int) Bool)
(declare-fun m_TrustedOption$$is_none__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$ ($Snap Snap$m_TrustedOption$_beg_$_end_) Bool)
(declare-fun m_TrustedOption$$is_none__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$%limited ($Snap Snap$m_TrustedOption$_beg_$_end_) Bool)
(declare-fun m_TrustedOption$$is_none__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$%stateless (Snap$m_TrustedOption$_beg_$_end_) Bool)
(declare-fun m_TrustedOption$$is_none__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$%precondition ($Snap Snap$m_TrustedOption$_beg_$_end_) Bool)
(declare-fun snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List ($Snap $Ref) Snap$struct$m_List)
(declare-fun snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%limited ($Snap $Ref) Snap$struct$m_List)
(declare-fun snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%stateless ($Ref) Bool)
(declare-fun snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%precondition ($Snap $Ref) Bool)
(declare-fun m_TrustedOption$_beg_$_end_$$discriminant$$__$TY$__m_TrustedOption$_beg_$_end_$$int$ ($Snap $Ref) Int)
(declare-fun m_TrustedOption$_beg_$_end_$$discriminant$$__$TY$__m_TrustedOption$_beg_$_end_$$int$%limited ($Snap $Ref) Int)
(declare-fun m_TrustedOption$_beg_$_end_$$discriminant$$__$TY$__m_TrustedOption$_beg_$_end_$$int$%stateless ($Ref) Bool)
(declare-fun m_TrustedOption$_beg_$_end_$$discriminant$$__$TY$__m_TrustedOption$_beg_$_end_$$int$%precondition ($Snap $Ref) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun DeadBorrowToken$%trigger ($Snap Int) Bool)
(declare-fun bool%trigger ($Snap $Ref) Bool)
(declare-fun i32%trigger ($Snap $Ref) Bool)
(declare-fun m_Link$_beg_$_end_%trigger ($Snap $Ref) Bool)
(declare-fun m_TrustedOption$_beg_$_end_%trigger ($Snap $Ref) Bool)
(declare-fun m_TrustedOption$_beg_$_end_Some%trigger ($Snap $Ref) Bool)
(declare-fun struct$m_List%trigger ($Snap $Ref) Bool)
(declare-fun tuple0$%trigger ($Snap $Ref) Bool)
; ////////// Uniqueness assumptions from domains
; ////////// Axioms
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
(assert (forall ((self Snap$m_TrustedOption$_beg_$_end_)) (!
  (and
    (<=
      0
      (discriminant$__$TY$__Snap$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_$$int$<Int> self))
    (<=
      (discriminant$__$TY$__Snap$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_$$int$<Int> self)
      1))
  :pattern ((discriminant$__$TY$__Snap$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_$$int$<Int> self))
  :qid |prog.Snap$m_TrustedOption$_beg_$_end_$discriminant_range|)))
(assert (forall ((_l_0 Int) (_r_0 Int)) (!
  (=>
    (=
      (cons$0$__$TY$__Snap$m_TrustedOption$_beg_$_end_$$int$$Snap$m_TrustedOption$_beg_$_end_<Snap$m_TrustedOption$_beg_$_end_> _l_0)
      (cons$0$__$TY$__Snap$m_TrustedOption$_beg_$_end_$$int$$Snap$m_TrustedOption$_beg_$_end_<Snap$m_TrustedOption$_beg_$_end_> _r_0))
    (= _l_0 _r_0))
  :pattern ((cons$0$__$TY$__Snap$m_TrustedOption$_beg_$_end_$$int$$Snap$m_TrustedOption$_beg_$_end_<Snap$m_TrustedOption$_beg_$_end_> _l_0) (cons$0$__$TY$__Snap$m_TrustedOption$_beg_$_end_$$int$$Snap$m_TrustedOption$_beg_$_end_<Snap$m_TrustedOption$_beg_$_end_> _r_0))
  :qid |prog.Snap$m_TrustedOption$_beg_$_end_$0$injectivity|)))
(assert (forall ((_0 Int)) (!
  (=
    (discriminant$__$TY$__Snap$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_$$int$<Int> (cons$0$__$TY$__Snap$m_TrustedOption$_beg_$_end_$$int$$Snap$m_TrustedOption$_beg_$_end_<Snap$m_TrustedOption$_beg_$_end_> _0))
    0)
  :pattern ((cons$0$__$TY$__Snap$m_TrustedOption$_beg_$_end_$$int$$Snap$m_TrustedOption$_beg_$_end_<Snap$m_TrustedOption$_beg_$_end_> _0))
  :qid |prog.Snap$m_TrustedOption$_beg_$_end_$0$discriminant_axiom|)))
(assert (forall ((_0 Int)) (!
  (=
    (Snap$m_TrustedOption$_beg_$_end_$0$field$f$0__$TY$__Snap$m_TrustedOption$_beg_$_end_$$int$<Int> (cons$0$__$TY$__Snap$m_TrustedOption$_beg_$_end_$$int$$Snap$m_TrustedOption$_beg_$_end_<Snap$m_TrustedOption$_beg_$_end_> _0))
    _0)
  :pattern ((Snap$m_TrustedOption$_beg_$_end_$0$field$f$0__$TY$__Snap$m_TrustedOption$_beg_$_end_$$int$<Int> (cons$0$__$TY$__Snap$m_TrustedOption$_beg_$_end_$$int$$Snap$m_TrustedOption$_beg_$_end_<Snap$m_TrustedOption$_beg_$_end_> _0)))
  :qid |prog.Snap$m_TrustedOption$_beg_$_end_$0$field$f$0$axiom|)))
(assert (forall ((self Snap$m_TrustedOption$_beg_$_end_)) (!
  (and
    (<=
      (- 0 2147483648)
      (Snap$m_TrustedOption$_beg_$_end_$0$field$f$0__$TY$__Snap$m_TrustedOption$_beg_$_end_$$int$<Int> self))
    (<=
      (Snap$m_TrustedOption$_beg_$_end_$0$field$f$0__$TY$__Snap$m_TrustedOption$_beg_$_end_$$int$<Int> self)
      2147483647))
  :pattern ((Snap$m_TrustedOption$_beg_$_end_$0$field$f$0__$TY$__Snap$m_TrustedOption$_beg_$_end_$$int$<Int> self))
  :qid |prog.Snap$m_TrustedOption$_beg_$_end_$0$field$f$0$valid|)))
(assert (=
  (discriminant$__$TY$__Snap$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_$$int$<Int> (as cons$1$__$TY$__Snap$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_<Snap$m_TrustedOption$_beg_$_end_>  Snap$m_TrustedOption$_beg_$_end_))
  1))
(assert (forall ((_l_0 Snap$m_Link$_beg_$_end_) (_r_0 Snap$m_Link$_beg_$_end_)) (!
  (=>
    (=
      (cons$0$__$TY$__Snap$struct$m_List$Snap$m_Link$_beg_$_end_$Snap$struct$m_List<Snap$struct$m_List> _l_0)
      (cons$0$__$TY$__Snap$struct$m_List$Snap$m_Link$_beg_$_end_$Snap$struct$m_List<Snap$struct$m_List> _r_0))
    (= _l_0 _r_0))
  :pattern ((cons$0$__$TY$__Snap$struct$m_List$Snap$m_Link$_beg_$_end_$Snap$struct$m_List<Snap$struct$m_List> _l_0) (cons$0$__$TY$__Snap$struct$m_List$Snap$m_Link$_beg_$_end_$Snap$struct$m_List<Snap$struct$m_List> _r_0))
  :qid |prog.Snap$struct$m_List$0$injectivity|)))
(assert (forall ((_0 Snap$m_Link$_beg_$_end_)) (!
  (=
    (Snap$struct$m_List$0$field$f$head__$TY$__Snap$struct$m_List$Snap$m_Link$_beg_$_end_<Snap$m_Link$_beg_$_end_> (cons$0$__$TY$__Snap$struct$m_List$Snap$m_Link$_beg_$_end_$Snap$struct$m_List<Snap$struct$m_List> _0))
    _0)
  :pattern ((Snap$struct$m_List$0$field$f$head__$TY$__Snap$struct$m_List$Snap$m_Link$_beg_$_end_<Snap$m_Link$_beg_$_end_> (cons$0$__$TY$__Snap$struct$m_List$Snap$m_Link$_beg_$_end_$Snap$struct$m_List<Snap$struct$m_List> _0)))
  :qid |prog.Snap$struct$m_List$0$field$f$head$axiom|)))
(assert (forall ((self Snap$struct$m_Node)) (!
  (and
    (<=
      (- 0 2147483648)
      (Snap$struct$m_Node$0$field$f$elem__$TY$__Snap$struct$m_Node$$int$<Int> self))
    (<=
      (Snap$struct$m_Node$0$field$f$elem__$TY$__Snap$struct$m_Node$$int$<Int> self)
      2147483647))
  :pattern ((Snap$struct$m_Node$0$field$f$elem__$TY$__Snap$struct$m_Node$$int$<Int> self))
  :qid |prog.Snap$struct$m_Node$0$field$f$elem$valid|)))
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
(declare-fun $unresolved@33@00 () $Snap)
(declare-fun $unresolved@36@00 () $Snap)
(assert (forall ((s@$ $Snap) (_1@0@00 Snap$m_Link$_beg_$_end_)) (!
  (=
    (m_Link$$is_empty__$TY$__Snap$m_Link$_beg_$_end_$$bool$%limited s@$ _1@0@00)
    (m_Link$$is_empty__$TY$__Snap$m_Link$_beg_$_end_$$bool$ s@$ _1@0@00))
  :pattern ((m_Link$$is_empty__$TY$__Snap$m_Link$_beg_$_end_$$bool$ s@$ _1@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (_1@0@00 Snap$m_Link$_beg_$_end_)) (!
  (m_Link$$is_empty__$TY$__Snap$m_Link$_beg_$_end_$$bool$%stateless _1@0@00)
  :pattern ((m_Link$$is_empty__$TY$__Snap$m_Link$_beg_$_end_$$bool$%limited s@$ _1@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (_1@0@00 Snap$m_Link$_beg_$_end_)) (!
  (let ((result@1@00 (m_Link$$is_empty__$TY$__Snap$m_Link$_beg_$_end_$$bool$%limited s@$ _1@0@00))) (=>
    (m_Link$$is_empty__$TY$__Snap$m_Link$_beg_$_end_$$bool$%precondition s@$ _1@0@00)
    (=
      result@1@00
      (mirror_simple$m_Link$$is_empty__$TY$__Snap$m_Link$_beg_$_end_$$bool$<Bool> _1@0@00))))
  :pattern ((m_Link$$is_empty__$TY$__Snap$m_Link$_beg_$_end_$$bool$%limited s@$ _1@0@00))
  :qid |quant-u-28|)))
(assert (forall ((s@$ $Snap) (_1@0@00 Snap$m_Link$_beg_$_end_)) (!
  (let ((result@1@00 (m_Link$$is_empty__$TY$__Snap$m_Link$_beg_$_end_$$bool$%limited s@$ _1@0@00))) true)
  :pattern ((m_Link$$is_empty__$TY$__Snap$m_Link$_beg_$_end_$$bool$%limited s@$ _1@0@00))
  :qid |quant-u-29|)))
(assert (forall ((s@$ $Snap) (_1@0@00 Snap$m_Link$_beg_$_end_)) (!
  (let ((result@1@00 (m_Link$$is_empty__$TY$__Snap$m_Link$_beg_$_end_$$bool$%limited s@$ _1@0@00))) true)
  :pattern ((m_Link$$is_empty__$TY$__Snap$m_Link$_beg_$_end_$$bool$%limited s@$ _1@0@00))
  :qid |quant-u-30|)))
(assert (forall ((s@$ $Snap) (_1@0@00 Snap$m_Link$_beg_$_end_)) (!
  (=>
    (m_Link$$is_empty__$TY$__Snap$m_Link$_beg_$_end_$$bool$%precondition s@$ _1@0@00)
    (=
      (m_Link$$is_empty__$TY$__Snap$m_Link$_beg_$_end_$$bool$ s@$ _1@0@00)
      (=
        (discriminant$__$TY$__Snap$m_Link$_beg_$_end_$Snap$m_Link$_beg_$_end_$$int$<Int> _1@0@00)
        0)))
  :pattern ((m_Link$$is_empty__$TY$__Snap$m_Link$_beg_$_end_$$bool$ s@$ _1@0@00))
  :qid |quant-u-31|)))
(assert (forall ((s@$ $Snap) (_1@0@00 Snap$m_Link$_beg_$_end_)) (!
  true
  :pattern ((m_Link$$is_empty__$TY$__Snap$m_Link$_beg_$_end_$$bool$ s@$ _1@0@00))
  :qid |quant-u-32|)))
(assert (forall ((s@$ $Snap)) (!
  (=
    (builtin$unreach__$TY$__$int$$$int$%limited s@$)
    (builtin$unreach__$TY$__$int$$$int$ s@$))
  :pattern ((builtin$unreach__$TY$__$int$$$int$ s@$))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap)) (!
  (as builtin$unreach__$TY$__$int$$$int$%stateless  Bool)
  :pattern ((builtin$unreach__$TY$__$int$$$int$%limited s@$))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (_1@3@00 Snap$m_Link$_beg_$_end_)) (!
  (=
    (m_Link$$len__$TY$__Snap$m_Link$_beg_$_end_$$int$%limited s@$ _1@3@00)
    (m_Link$$len__$TY$__Snap$m_Link$_beg_$_end_$$int$ s@$ _1@3@00))
  :pattern ((m_Link$$len__$TY$__Snap$m_Link$_beg_$_end_$$int$ s@$ _1@3@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (_1@3@00 Snap$m_Link$_beg_$_end_)) (!
  (m_Link$$len__$TY$__Snap$m_Link$_beg_$_end_$$int$%stateless _1@3@00)
  :pattern ((m_Link$$len__$TY$__Snap$m_Link$_beg_$_end_$$int$%limited s@$ _1@3@00))
  :qid |quant-u-5|)))
(assert (forall ((s@$ $Snap) (_1@3@00 Snap$m_Link$_beg_$_end_)) (!
  (let ((result@4@00 (m_Link$$len__$TY$__Snap$m_Link$_beg_$_end_$$int$%limited s@$ _1@3@00))) (=>
    (m_Link$$len__$TY$__Snap$m_Link$_beg_$_end_$$int$%precondition s@$ _1@3@00)
    (and
      (and
        (or
          (m_Link$$is_empty__$TY$__Snap$m_Link$_beg_$_end_$$bool$ ($Snap.combine
            $Snap.unit
            $Snap.unit) _1@3@00)
          (> result@4@00 0))
        (>= result@4@00 0))
      (<= 0 result@4@00)
      (=
        result@4@00
        (mirror_simple$m_Link$$len__$TY$__Snap$m_Link$_beg_$_end_$$int$<Int> _1@3@00)))))
  :pattern ((m_Link$$len__$TY$__Snap$m_Link$_beg_$_end_$$int$%limited s@$ _1@3@00))
  :qid |quant-u-33|)))
(assert (forall ((s@$ $Snap) (_1@3@00 Snap$m_Link$_beg_$_end_)) (!
  (let ((result@4@00 (m_Link$$len__$TY$__Snap$m_Link$_beg_$_end_$$int$%limited s@$ _1@3@00))) (=>
    (m_Link$$len__$TY$__Snap$m_Link$_beg_$_end_$$int$%precondition s@$ _1@3@00)
    (m_Link$$is_empty__$TY$__Snap$m_Link$_beg_$_end_$$bool$%precondition ($Snap.combine
      $Snap.unit
      $Snap.unit) _1@3@00)))
  :pattern ((m_Link$$len__$TY$__Snap$m_Link$_beg_$_end_$$int$%limited s@$ _1@3@00))
  :qid |quant-u-34|)))
(assert (forall ((s@$ $Snap) (_1@3@00 Snap$m_Link$_beg_$_end_)) (!
  (let ((result@4@00 (m_Link$$len__$TY$__Snap$m_Link$_beg_$_end_$$int$%limited s@$ _1@3@00))) true)
  :pattern ((m_Link$$len__$TY$__Snap$m_Link$_beg_$_end_$$int$%limited s@$ _1@3@00))
  :qid |quant-u-35|)))
(assert (forall ((s@$ $Snap) (_1@3@00 Snap$m_Link$_beg_$_end_)) (!
  (let ((result@4@00 (m_Link$$len__$TY$__Snap$m_Link$_beg_$_end_$$int$%limited s@$ _1@3@00))) true)
  :pattern ((m_Link$$len__$TY$__Snap$m_Link$_beg_$_end_$$int$%limited s@$ _1@3@00))
  :qid |quant-u-36|)))
(assert (forall ((s@$ $Snap) (_1@3@00 Snap$m_Link$_beg_$_end_)) (!
  (=>
    (m_Link$$len__$TY$__Snap$m_Link$_beg_$_end_$$int$%precondition s@$ _1@3@00)
    (=
      (m_Link$$len__$TY$__Snap$m_Link$_beg_$_end_$$int$ s@$ _1@3@00)
      (ite
        (=
          (discriminant$__$TY$__Snap$m_Link$_beg_$_end_$Snap$m_Link$_beg_$_end_$$int$<Int> _1@3@00)
          0)
        0
        (+
          1
          (m_Link$$len__$TY$__Snap$m_Link$_beg_$_end_$$int$%limited ($Snap.combine
            $Snap.unit
            $Snap.unit) (Snap$struct$m_Node$0$field$f$next__$TY$__Snap$struct$m_Node$Snap$m_Link$_beg_$_end_<Snap$m_Link$_beg_$_end_> (Snap$m_Link$_beg_$_end_$1$field$f$0__$TY$__Snap$m_Link$_beg_$_end_$Snap$struct$m_Node<Snap$struct$m_Node> _1@3@00)))))))
  :pattern ((m_Link$$len__$TY$__Snap$m_Link$_beg_$_end_$$int$ s@$ _1@3@00))
  :qid |quant-u-37|)))
(assert (forall ((s@$ $Snap) (_1@3@00 Snap$m_Link$_beg_$_end_)) (!
  (=>
    (m_Link$$len__$TY$__Snap$m_Link$_beg_$_end_$$int$%precondition s@$ _1@3@00)
    (ite
      (=
        (discriminant$__$TY$__Snap$m_Link$_beg_$_end_$Snap$m_Link$_beg_$_end_$$int$<Int> _1@3@00)
        0)
      true
      (m_Link$$len__$TY$__Snap$m_Link$_beg_$_end_$$int$%precondition ($Snap.combine
        $Snap.unit
        $Snap.unit) (Snap$struct$m_Node$0$field$f$next__$TY$__Snap$struct$m_Node$Snap$m_Link$_beg_$_end_<Snap$m_Link$_beg_$_end_> (Snap$m_Link$_beg_$_end_$1$field$f$0__$TY$__Snap$m_Link$_beg_$_end_$Snap$struct$m_Node<Snap$struct$m_Node> _1@3@00)))))
  :pattern ((m_Link$$len__$TY$__Snap$m_Link$_beg_$_end_$$int$ s@$ _1@3@00))
  :qid |quant-u-38|)))
(assert (forall ((s@$ $Snap)) (!
  (= (read$%limited s@$) (read$ s@$))
  :pattern ((read$ s@$))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap)) (!
  (as read$%stateless  Bool)
  :pattern ((read$%limited s@$))
  :qid |quant-u-7|)))
(assert (forall ((s@$ $Snap)) (!
  (let ((result@5@00 (read$%limited s@$))) (=>
    (read$%precondition s@$)
    (and (< $Perm.No result@5@00) (< result@5@00 $Perm.Write))))
  :pattern ((read$%limited s@$))
  :qid |quant-u-39|)))
(assert (forall ((s@$ $Snap)) (!
  (let ((result@5@00 (read$%limited s@$))) true)
  :pattern ((read$%limited s@$))
  :qid |quant-u-40|)))
(assert (forall ((s@$ $Snap)) (!
  (let ((result@5@00 (read$%limited s@$))) true)
  :pattern ((read$%limited s@$))
  :qid |quant-u-41|)))
(assert (forall ((s@$ $Snap) (_1@6@00 Snap$m_TrustedOption$_beg_$_end_)) (!
  (=
    (m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$%limited s@$ _1@6@00)
    (m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$ s@$ _1@6@00))
  :pattern ((m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$ s@$ _1@6@00))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap) (_1@6@00 Snap$m_TrustedOption$_beg_$_end_)) (!
  (m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$%stateless _1@6@00)
  :pattern ((m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$%limited s@$ _1@6@00))
  :qid |quant-u-9|)))
(assert (forall ((s@$ $Snap) (_1@6@00 Snap$m_TrustedOption$_beg_$_end_)) (!
  (let ((result@7@00 (m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$%limited s@$ _1@6@00))) (=>
    (m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$%precondition s@$ _1@6@00)
    (=
      result@7@00
      (mirror_simple$m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$<Bool> _1@6@00))))
  :pattern ((m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$%limited s@$ _1@6@00))
  :qid |quant-u-42|)))
(assert (forall ((s@$ $Snap) (_1@6@00 Snap$m_TrustedOption$_beg_$_end_)) (!
  (let ((result@7@00 (m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$%limited s@$ _1@6@00))) true)
  :pattern ((m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$%limited s@$ _1@6@00))
  :qid |quant-u-43|)))
(assert (forall ((s@$ $Snap) (_1@6@00 Snap$m_TrustedOption$_beg_$_end_)) (!
  (let ((result@7@00 (m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$%limited s@$ _1@6@00))) true)
  :pattern ((m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$%limited s@$ _1@6@00))
  :qid |quant-u-44|)))
(assert (forall ((s@$ $Snap) (_1@6@00 Snap$m_TrustedOption$_beg_$_end_)) (!
  (=>
    (m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$%precondition s@$ _1@6@00)
    (=
      (m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$ s@$ _1@6@00)
      (=
        (discriminant$__$TY$__Snap$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_$$int$<Int> _1@6@00)
        0)))
  :pattern ((m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$ s@$ _1@6@00))
  :qid |quant-u-45|)))
(assert (forall ((s@$ $Snap) (_1@6@00 Snap$m_TrustedOption$_beg_$_end_)) (!
  true
  :pattern ((m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$ s@$ _1@6@00))
  :qid |quant-u-46|)))
(assert (forall ((s@$ $Snap) (_1@8@00 Snap$m_Link$_beg_$_end_) (_2@9@00 Int)) (!
  (=
    (m_Link$$lookup__$TY$__Snap$m_Link$_beg_$_end_$$int$$$int$%limited s@$ _1@8@00 _2@9@00)
    (m_Link$$lookup__$TY$__Snap$m_Link$_beg_$_end_$$int$$$int$ s@$ _1@8@00 _2@9@00))
  :pattern ((m_Link$$lookup__$TY$__Snap$m_Link$_beg_$_end_$$int$$$int$ s@$ _1@8@00 _2@9@00))
  :qid |quant-u-10|)))
(assert (forall ((s@$ $Snap) (_1@8@00 Snap$m_Link$_beg_$_end_) (_2@9@00 Int)) (!
  (m_Link$$lookup__$TY$__Snap$m_Link$_beg_$_end_$$int$$$int$%stateless _1@8@00 _2@9@00)
  :pattern ((m_Link$$lookup__$TY$__Snap$m_Link$_beg_$_end_$$int$$$int$%limited s@$ _1@8@00 _2@9@00))
  :qid |quant-u-11|)))
(assert (forall ((s@$ $Snap) (_1@8@00 Snap$m_Link$_beg_$_end_) (_2@9@00 Int)) (!
  (let ((result@10@00 (m_Link$$lookup__$TY$__Snap$m_Link$_beg_$_end_$$int$$$int$%limited s@$ _1@8@00 _2@9@00))) (=>
    (m_Link$$lookup__$TY$__Snap$m_Link$_beg_$_end_$$int$$$int$%precondition s@$ _1@8@00 _2@9@00)
    (=
      result@10@00
      (mirror_simple$m_Link$$lookup__$TY$__Snap$m_Link$_beg_$_end_$$int$$$int$<Int> _1@8@00 _2@9@00))))
  :pattern ((m_Link$$lookup__$TY$__Snap$m_Link$_beg_$_end_$$int$$$int$%limited s@$ _1@8@00 _2@9@00))
  :qid |quant-u-47|)))
(assert (forall ((s@$ $Snap) (_1@8@00 Snap$m_Link$_beg_$_end_) (_2@9@00 Int)) (!
  (let ((result@10@00 (m_Link$$lookup__$TY$__Snap$m_Link$_beg_$_end_$$int$$$int$%limited s@$ _1@8@00 _2@9@00))) true)
  :pattern ((m_Link$$lookup__$TY$__Snap$m_Link$_beg_$_end_$$int$$$int$%limited s@$ _1@8@00 _2@9@00))
  :qid |quant-u-48|)))
(assert (forall ((s@$ $Snap) (_1@8@00 Snap$m_Link$_beg_$_end_) (_2@9@00 Int)) (!
  (let ((result@10@00 (m_Link$$lookup__$TY$__Snap$m_Link$_beg_$_end_$$int$$$int$%limited s@$ _1@8@00 _2@9@00))) true)
  :pattern ((m_Link$$lookup__$TY$__Snap$m_Link$_beg_$_end_$$int$$$int$%limited s@$ _1@8@00 _2@9@00))
  :qid |quant-u-49|)))
(assert (forall ((s@$ $Snap) (_1@8@00 Snap$m_Link$_beg_$_end_) (_2@9@00 Int)) (!
  (=>
    (m_Link$$lookup__$TY$__Snap$m_Link$_beg_$_end_$$int$$$int$%precondition s@$ _1@8@00 _2@9@00)
    (=
      (m_Link$$lookup__$TY$__Snap$m_Link$_beg_$_end_$$int$$$int$ s@$ _1@8@00 _2@9@00)
      (ite
        (=
          (discriminant$__$TY$__Snap$m_Link$_beg_$_end_$Snap$m_Link$_beg_$_end_$$int$<Int> _1@8@00)
          0)
        (builtin$unreach__$TY$__$int$$$int$ $unresolved@33@00)
        (ite
          (not (= _2@9@00 0))
          (m_Link$$lookup__$TY$__Snap$m_Link$_beg_$_end_$$int$$$int$%limited ($Snap.combine
            $Snap.unit
            ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (Snap$struct$m_Node$0$field$f$next__$TY$__Snap$struct$m_Node$Snap$m_Link$_beg_$_end_<Snap$m_Link$_beg_$_end_> (Snap$m_Link$_beg_$_end_$1$field$f$0__$TY$__Snap$m_Link$_beg_$_end_$Snap$struct$m_Node<Snap$struct$m_Node> _1@8@00)) (-
            _2@9@00
            1))
          (Snap$struct$m_Node$0$field$f$elem__$TY$__Snap$struct$m_Node$$int$<Int> (Snap$m_Link$_beg_$_end_$1$field$f$0__$TY$__Snap$m_Link$_beg_$_end_$Snap$struct$m_Node<Snap$struct$m_Node> _1@8@00))))))
  :pattern ((m_Link$$lookup__$TY$__Snap$m_Link$_beg_$_end_$$int$$$int$ s@$ _1@8@00 _2@9@00))
  :qid |quant-u-50|)))
(assert (forall ((s@$ $Snap) (_1@8@00 Snap$m_Link$_beg_$_end_) (_2@9@00 Int)) (!
  (=>
    (m_Link$$lookup__$TY$__Snap$m_Link$_beg_$_end_$$int$$$int$%precondition s@$ _1@8@00 _2@9@00)
    (ite
      (=
        (discriminant$__$TY$__Snap$m_Link$_beg_$_end_$Snap$m_Link$_beg_$_end_$$int$<Int> _1@8@00)
        0)
      (builtin$unreach__$TY$__$int$$$int$%precondition $unresolved@33@00)
      (ite
        (not (= _2@9@00 0))
        (m_Link$$lookup__$TY$__Snap$m_Link$_beg_$_end_$$int$$$int$%precondition ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (Snap$struct$m_Node$0$field$f$next__$TY$__Snap$struct$m_Node$Snap$m_Link$_beg_$_end_<Snap$m_Link$_beg_$_end_> (Snap$m_Link$_beg_$_end_$1$field$f$0__$TY$__Snap$m_Link$_beg_$_end_$Snap$struct$m_Node<Snap$struct$m_Node> _1@8@00)) (-
          _2@9@00
          1))
        true)))
  :pattern ((m_Link$$lookup__$TY$__Snap$m_Link$_beg_$_end_$$int$$$int$ s@$ _1@8@00 _2@9@00))
  :qid |quant-u-51|)))
(assert (forall ((s@$ $Snap) (_1@11@00 Snap$struct$m_List)) (!
  (=
    (m_List$$len__$TY$__Snap$struct$m_List$$int$%limited s@$ _1@11@00)
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ s@$ _1@11@00))
  :pattern ((m_List$$len__$TY$__Snap$struct$m_List$$int$ s@$ _1@11@00))
  :qid |quant-u-12|)))
(assert (forall ((s@$ $Snap) (_1@11@00 Snap$struct$m_List)) (!
  (m_List$$len__$TY$__Snap$struct$m_List$$int$%stateless _1@11@00)
  :pattern ((m_List$$len__$TY$__Snap$struct$m_List$$int$%limited s@$ _1@11@00))
  :qid |quant-u-13|)))
(assert (forall ((s@$ $Snap) (_1@11@00 Snap$struct$m_List)) (!
  (let ((result@12@00 (m_List$$len__$TY$__Snap$struct$m_List$$int$%limited s@$ _1@11@00))) (=>
    (m_List$$len__$TY$__Snap$struct$m_List$$int$%precondition s@$ _1@11@00)
    (and
      (<= 0 result@12@00)
      (=
        result@12@00
        (mirror_simple$m_List$$len__$TY$__Snap$struct$m_List$$int$<Int> _1@11@00)))))
  :pattern ((m_List$$len__$TY$__Snap$struct$m_List$$int$%limited s@$ _1@11@00))
  :qid |quant-u-52|)))
(assert (forall ((s@$ $Snap) (_1@11@00 Snap$struct$m_List)) (!
  (let ((result@12@00 (m_List$$len__$TY$__Snap$struct$m_List$$int$%limited s@$ _1@11@00))) true)
  :pattern ((m_List$$len__$TY$__Snap$struct$m_List$$int$%limited s@$ _1@11@00))
  :qid |quant-u-53|)))
(assert (forall ((s@$ $Snap) (_1@11@00 Snap$struct$m_List)) (!
  (let ((result@12@00 (m_List$$len__$TY$__Snap$struct$m_List$$int$%limited s@$ _1@11@00))) true)
  :pattern ((m_List$$len__$TY$__Snap$struct$m_List$$int$%limited s@$ _1@11@00))
  :qid |quant-u-54|)))
(assert (forall ((s@$ $Snap) (_1@11@00 Snap$struct$m_List)) (!
  (let ((result@12@00 (m_List$$len__$TY$__Snap$struct$m_List$$int$%limited s@$ _1@11@00))) true)
  :pattern ((m_List$$len__$TY$__Snap$struct$m_List$$int$%limited s@$ _1@11@00))
  :qid |quant-u-55|)))
(assert (forall ((s@$ $Snap) (_1@11@00 Snap$struct$m_List)) (!
  (=>
    (m_List$$len__$TY$__Snap$struct$m_List$$int$%precondition s@$ _1@11@00)
    (=
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ s@$ _1@11@00)
      (m_Link$$len__$TY$__Snap$m_Link$_beg_$_end_$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (Snap$struct$m_List$0$field$f$head__$TY$__Snap$struct$m_List$Snap$m_Link$_beg_$_end_<Snap$m_Link$_beg_$_end_> _1@11@00))))
  :pattern ((m_List$$len__$TY$__Snap$struct$m_List$$int$ s@$ _1@11@00))
  :qid |quant-u-56|)))
(assert (forall ((s@$ $Snap) (_1@11@00 Snap$struct$m_List)) (!
  (=>
    (m_List$$len__$TY$__Snap$struct$m_List$$int$%precondition s@$ _1@11@00)
    (m_Link$$len__$TY$__Snap$m_Link$_beg_$_end_$$int$%precondition ($Snap.combine
      $Snap.unit
      $Snap.unit) (Snap$struct$m_List$0$field$f$head__$TY$__Snap$struct$m_List$Snap$m_Link$_beg_$_end_<Snap$m_Link$_beg_$_end_> _1@11@00)))
  :pattern ((m_List$$len__$TY$__Snap$struct$m_List$$int$ s@$ _1@11@00))
  :qid |quant-u-57|)))
(assert (forall ((s@$ $Snap) (self@13@00 $Ref)) (!
  (=
    (snap$__$TY$__Snap$m_Link$_beg_$_end_$m_Link$_beg_$_end_$Snap$m_Link$_beg_$_end_%limited s@$ self@13@00)
    (snap$__$TY$__Snap$m_Link$_beg_$_end_$m_Link$_beg_$_end_$Snap$m_Link$_beg_$_end_ s@$ self@13@00))
  :pattern ((snap$__$TY$__Snap$m_Link$_beg_$_end_$m_Link$_beg_$_end_$Snap$m_Link$_beg_$_end_ s@$ self@13@00))
  :qid |quant-u-14|)))
(assert (forall ((s@$ $Snap) (self@13@00 $Ref)) (!
  (snap$__$TY$__Snap$m_Link$_beg_$_end_$m_Link$_beg_$_end_$Snap$m_Link$_beg_$_end_%stateless self@13@00)
  :pattern ((snap$__$TY$__Snap$m_Link$_beg_$_end_$m_Link$_beg_$_end_$Snap$m_Link$_beg_$_end_%limited s@$ self@13@00))
  :qid |quant-u-15|)))
(assert (forall ((s@$ $Snap) (self@15@00 $Ref)) (!
  (=
    (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_%limited s@$ self@15@00)
    (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ s@$ self@15@00))
  :pattern ((snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ s@$ self@15@00))
  :qid |quant-u-16|)))
(assert (forall ((s@$ $Snap) (self@15@00 $Ref)) (!
  (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_%stateless self@15@00)
  :pattern ((snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_%limited s@$ self@15@00))
  :qid |quant-u-17|)))
(assert (forall ((s@$ $Snap) (self@15@00 $Ref)) (!
  (=>
    (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_%precondition s@$ self@15@00)
    (=
      (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ s@$ self@15@00)
      (ite
        (= ($SortWrappers.$SnapToInt ($Snap.first s@$)) 1)
        (as cons$1$__$TY$__Snap$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_<Snap$m_TrustedOption$_beg_$_end_>  Snap$m_TrustedOption$_beg_$_end_)
        (cons$0$__$TY$__Snap$m_TrustedOption$_beg_$_end_$$int$$Snap$m_TrustedOption$_beg_$_end_<Snap$m_TrustedOption$_beg_$_end_> ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))
  :pattern ((snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ s@$ self@15@00))
  :qid |quant-u-58|)))
(assert (forall ((s@$ $Snap) (self@15@00 $Ref)) (!
  true
  :pattern ((snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ s@$ self@15@00))
  :qid |quant-u-59|)))
(assert (forall ((s@$ $Snap) (_1@17@00 Snap$m_TrustedOption$_beg_$_end_)) (!
  (=
    (m_TrustedOption$$peek__$TY$__Snap$m_TrustedOption$_beg_$_end_$$int$%limited s@$ _1@17@00)
    (m_TrustedOption$$peek__$TY$__Snap$m_TrustedOption$_beg_$_end_$$int$ s@$ _1@17@00))
  :pattern ((m_TrustedOption$$peek__$TY$__Snap$m_TrustedOption$_beg_$_end_$$int$ s@$ _1@17@00))
  :qid |quant-u-18|)))
(assert (forall ((s@$ $Snap) (_1@17@00 Snap$m_TrustedOption$_beg_$_end_)) (!
  (m_TrustedOption$$peek__$TY$__Snap$m_TrustedOption$_beg_$_end_$$int$%stateless _1@17@00)
  :pattern ((m_TrustedOption$$peek__$TY$__Snap$m_TrustedOption$_beg_$_end_$$int$%limited s@$ _1@17@00))
  :qid |quant-u-19|)))
(assert (forall ((s@$ $Snap) (_1@17@00 Snap$m_TrustedOption$_beg_$_end_)) (!
  (let ((result@18@00 (m_TrustedOption$$peek__$TY$__Snap$m_TrustedOption$_beg_$_end_$$int$%limited s@$ _1@17@00))) (=>
    (m_TrustedOption$$peek__$TY$__Snap$m_TrustedOption$_beg_$_end_$$int$%precondition s@$ _1@17@00)
    (=
      result@18@00
      (mirror_simple$m_TrustedOption$$peek__$TY$__Snap$m_TrustedOption$_beg_$_end_$$int$<Int> _1@17@00))))
  :pattern ((m_TrustedOption$$peek__$TY$__Snap$m_TrustedOption$_beg_$_end_$$int$%limited s@$ _1@17@00))
  :qid |quant-u-60|)))
(assert (forall ((s@$ $Snap) (_1@17@00 Snap$m_TrustedOption$_beg_$_end_)) (!
  (let ((result@18@00 (m_TrustedOption$$peek__$TY$__Snap$m_TrustedOption$_beg_$_end_$$int$%limited s@$ _1@17@00))) true)
  :pattern ((m_TrustedOption$$peek__$TY$__Snap$m_TrustedOption$_beg_$_end_$$int$%limited s@$ _1@17@00))
  :qid |quant-u-61|)))
(assert (forall ((s@$ $Snap) (_1@17@00 Snap$m_TrustedOption$_beg_$_end_)) (!
  (let ((result@18@00 (m_TrustedOption$$peek__$TY$__Snap$m_TrustedOption$_beg_$_end_$$int$%limited s@$ _1@17@00))) true)
  :pattern ((m_TrustedOption$$peek__$TY$__Snap$m_TrustedOption$_beg_$_end_$$int$%limited s@$ _1@17@00))
  :qid |quant-u-62|)))
(assert (forall ((s@$ $Snap) (_1@17@00 Snap$m_TrustedOption$_beg_$_end_)) (!
  (=>
    (m_TrustedOption$$peek__$TY$__Snap$m_TrustedOption$_beg_$_end_$$int$%precondition s@$ _1@17@00)
    (=
      (m_TrustedOption$$peek__$TY$__Snap$m_TrustedOption$_beg_$_end_$$int$ s@$ _1@17@00)
      (ite
        (=
          (discriminant$__$TY$__Snap$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_$$int$<Int> _1@17@00)
          0)
        (Snap$m_TrustedOption$_beg_$_end_$0$field$f$0__$TY$__Snap$m_TrustedOption$_beg_$_end_$$int$<Int> _1@17@00)
        (builtin$unreach__$TY$__$int$$$int$ $unresolved@36@00))))
  :pattern ((m_TrustedOption$$peek__$TY$__Snap$m_TrustedOption$_beg_$_end_$$int$ s@$ _1@17@00))
  :qid |quant-u-63|)))
(assert (forall ((s@$ $Snap) (_1@17@00 Snap$m_TrustedOption$_beg_$_end_)) (!
  (=>
    (m_TrustedOption$$peek__$TY$__Snap$m_TrustedOption$_beg_$_end_$$int$%precondition s@$ _1@17@00)
    (ite
      (=
        (discriminant$__$TY$__Snap$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_$$int$<Int> _1@17@00)
        0)
      true
      (builtin$unreach__$TY$__$int$$$int$%precondition $unresolved@36@00)))
  :pattern ((m_TrustedOption$$peek__$TY$__Snap$m_TrustedOption$_beg_$_end_$$int$ s@$ _1@17@00))
  :qid |quant-u-64|)))
(assert (forall ((s@$ $Snap) (_1@19@00 Snap$struct$m_List) (_2@20@00 Int)) (!
  (=
    (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%limited s@$ _1@19@00 _2@20@00)
    (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$ s@$ _1@19@00 _2@20@00))
  :pattern ((m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$ s@$ _1@19@00 _2@20@00))
  :qid |quant-u-20|)))
(assert (forall ((s@$ $Snap) (_1@19@00 Snap$struct$m_List) (_2@20@00 Int)) (!
  (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%stateless _1@19@00 _2@20@00)
  :pattern ((m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%limited s@$ _1@19@00 _2@20@00))
  :qid |quant-u-21|)))
(assert (forall ((s@$ $Snap) (_1@19@00 Snap$struct$m_List) (_2@20@00 Int)) (!
  (let ((result@21@00 (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%limited s@$ _1@19@00 _2@20@00))) (=>
    (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition s@$ _1@19@00 _2@20@00)
    (=
      result@21@00
      (mirror_simple$m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$<Int> _1@19@00 _2@20@00))))
  :pattern ((m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%limited s@$ _1@19@00 _2@20@00))
  :qid |quant-u-65|)))
(assert (forall ((s@$ $Snap) (_1@19@00 Snap$struct$m_List) (_2@20@00 Int)) (!
  (let ((result@21@00 (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%limited s@$ _1@19@00 _2@20@00))) true)
  :pattern ((m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%limited s@$ _1@19@00 _2@20@00))
  :qid |quant-u-66|)))
(assert (forall ((s@$ $Snap) (_1@19@00 Snap$struct$m_List) (_2@20@00 Int)) (!
  (let ((result@21@00 (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%limited s@$ _1@19@00 _2@20@00))) true)
  :pattern ((m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%limited s@$ _1@19@00 _2@20@00))
  :qid |quant-u-67|)))
(assert (forall ((s@$ $Snap) (_1@19@00 Snap$struct$m_List) (_2@20@00 Int)) (!
  (=>
    (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition s@$ _1@19@00 _2@20@00)
    (=
      (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$ s@$ _1@19@00 _2@20@00)
      (m_Link$$lookup__$TY$__Snap$m_Link$_beg_$_end_$$int$$$int$ ($Snap.combine
        $Snap.unit
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (Snap$struct$m_List$0$field$f$head__$TY$__Snap$struct$m_List$Snap$m_Link$_beg_$_end_<Snap$m_Link$_beg_$_end_> _1@19@00) _2@20@00)))
  :pattern ((m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$ s@$ _1@19@00 _2@20@00))
  :qid |quant-u-68|)))
(assert (forall ((s@$ $Snap) (_1@19@00 Snap$struct$m_List) (_2@20@00 Int)) (!
  (=>
    (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition s@$ _1@19@00 _2@20@00)
    (m_Link$$lookup__$TY$__Snap$m_Link$_beg_$_end_$$int$$$int$%precondition ($Snap.combine
      $Snap.unit
      ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (Snap$struct$m_List$0$field$f$head__$TY$__Snap$struct$m_List$Snap$m_Link$_beg_$_end_<Snap$m_Link$_beg_$_end_> _1@19@00) _2@20@00))
  :pattern ((m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$ s@$ _1@19@00 _2@20@00))
  :qid |quant-u-69|)))
(assert (forall ((s@$ $Snap) (_1@22@00 Snap$m_TrustedOption$_beg_$_end_)) (!
  (=
    (m_TrustedOption$$is_none__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$%limited s@$ _1@22@00)
    (m_TrustedOption$$is_none__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$ s@$ _1@22@00))
  :pattern ((m_TrustedOption$$is_none__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$ s@$ _1@22@00))
  :qid |quant-u-22|)))
(assert (forall ((s@$ $Snap) (_1@22@00 Snap$m_TrustedOption$_beg_$_end_)) (!
  (m_TrustedOption$$is_none__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$%stateless _1@22@00)
  :pattern ((m_TrustedOption$$is_none__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$%limited s@$ _1@22@00))
  :qid |quant-u-23|)))
(assert (forall ((s@$ $Snap) (_1@22@00 Snap$m_TrustedOption$_beg_$_end_)) (!
  (let ((result@23@00 (m_TrustedOption$$is_none__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$%limited s@$ _1@22@00))) (=>
    (m_TrustedOption$$is_none__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$%precondition s@$ _1@22@00)
    (=
      result@23@00
      (mirror_simple$m_TrustedOption$$is_none__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$<Bool> _1@22@00))))
  :pattern ((m_TrustedOption$$is_none__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$%limited s@$ _1@22@00))
  :qid |quant-u-70|)))
(assert (forall ((s@$ $Snap) (_1@22@00 Snap$m_TrustedOption$_beg_$_end_)) (!
  (let ((result@23@00 (m_TrustedOption$$is_none__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$%limited s@$ _1@22@00))) true)
  :pattern ((m_TrustedOption$$is_none__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$%limited s@$ _1@22@00))
  :qid |quant-u-71|)))
(assert (forall ((s@$ $Snap) (_1@22@00 Snap$m_TrustedOption$_beg_$_end_)) (!
  (let ((result@23@00 (m_TrustedOption$$is_none__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$%limited s@$ _1@22@00))) true)
  :pattern ((m_TrustedOption$$is_none__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$%limited s@$ _1@22@00))
  :qid |quant-u-72|)))
(assert (forall ((s@$ $Snap) (_1@22@00 Snap$m_TrustedOption$_beg_$_end_)) (!
  (=>
    (m_TrustedOption$$is_none__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$%precondition s@$ _1@22@00)
    (=
      (m_TrustedOption$$is_none__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$ s@$ _1@22@00)
      (not
        (=
          (discriminant$__$TY$__Snap$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_$$int$<Int> _1@22@00)
          0))))
  :pattern ((m_TrustedOption$$is_none__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$ s@$ _1@22@00))
  :qid |quant-u-73|)))
(assert (forall ((s@$ $Snap) (_1@22@00 Snap$m_TrustedOption$_beg_$_end_)) (!
  true
  :pattern ((m_TrustedOption$$is_none__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$ s@$ _1@22@00))
  :qid |quant-u-74|)))
(assert (forall ((s@$ $Snap) (self@24@00 $Ref)) (!
  (=
    (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%limited s@$ self@24@00)
    (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List s@$ self@24@00))
  :pattern ((snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List s@$ self@24@00))
  :qid |quant-u-24|)))
(assert (forall ((s@$ $Snap) (self@24@00 $Ref)) (!
  (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%stateless self@24@00)
  :pattern ((snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%limited s@$ self@24@00))
  :qid |quant-u-25|)))
(assert (forall ((s@$ $Snap) (self@24@00 $Ref)) (!
  (=>
    (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%precondition s@$ self@24@00)
    (=
      (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List s@$ self@24@00)
      (cons$0$__$TY$__Snap$struct$m_List$Snap$m_Link$_beg_$_end_$Snap$struct$m_List<Snap$struct$m_List> (snap$__$TY$__Snap$m_Link$_beg_$_end_$m_Link$_beg_$_end_$Snap$m_Link$_beg_$_end_ ($Snap.second s@$) ($SortWrappers.$SnapTo$Ref ($Snap.first s@$))))))
  :pattern ((snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List s@$ self@24@00))
  :pattern ((snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%stateless self@24@00) (struct$m_List%trigger s@$ self@24@00))
  :qid |quant-u-75|)))
(assert (forall ((s@$ $Snap) (self@24@00 $Ref)) (!
  (=>
    (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%precondition s@$ self@24@00)
    (snap$__$TY$__Snap$m_Link$_beg_$_end_$m_Link$_beg_$_end_$Snap$m_Link$_beg_$_end_%precondition ($Snap.second s@$) ($SortWrappers.$SnapTo$Ref ($Snap.first s@$))))
  :pattern ((snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List s@$ self@24@00))
  :qid |quant-u-76|)))
(assert (forall ((s@$ $Snap) (self@26@00 $Ref)) (!
  (=
    (m_TrustedOption$_beg_$_end_$$discriminant$$__$TY$__m_TrustedOption$_beg_$_end_$$int$%limited s@$ self@26@00)
    (m_TrustedOption$_beg_$_end_$$discriminant$$__$TY$__m_TrustedOption$_beg_$_end_$$int$ s@$ self@26@00))
  :pattern ((m_TrustedOption$_beg_$_end_$$discriminant$$__$TY$__m_TrustedOption$_beg_$_end_$$int$ s@$ self@26@00))
  :qid |quant-u-26|)))
(assert (forall ((s@$ $Snap) (self@26@00 $Ref)) (!
  (m_TrustedOption$_beg_$_end_$$discriminant$$__$TY$__m_TrustedOption$_beg_$_end_$$int$%stateless self@26@00)
  :pattern ((m_TrustedOption$_beg_$_end_$$discriminant$$__$TY$__m_TrustedOption$_beg_$_end_$$int$%limited s@$ self@26@00))
  :qid |quant-u-27|)))
(assert (forall ((s@$ $Snap) (self@26@00 $Ref)) (!
  (let ((result@27@00 (m_TrustedOption$_beg_$_end_$$discriminant$$__$TY$__m_TrustedOption$_beg_$_end_$$int$%limited s@$ self@26@00))) (=>
    (m_TrustedOption$_beg_$_end_$$discriminant$$__$TY$__m_TrustedOption$_beg_$_end_$$int$%precondition s@$ self@26@00)
    (and
      (and (<= 0 result@27@00) (<= result@27@00 1))
      (=
        (discriminant$__$TY$__Snap$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_$$int$<Int> (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ s@$ self@26@00))
        result@27@00))))
  :pattern ((m_TrustedOption$_beg_$_end_$$discriminant$$__$TY$__m_TrustedOption$_beg_$_end_$$int$%limited s@$ self@26@00))
  :qid |quant-u-77|)))
(assert (forall ((s@$ $Snap) (self@26@00 $Ref)) (!
  (let ((result@27@00 (m_TrustedOption$_beg_$_end_$$discriminant$$__$TY$__m_TrustedOption$_beg_$_end_$$int$%limited s@$ self@26@00))) true)
  :pattern ((m_TrustedOption$_beg_$_end_$$discriminant$$__$TY$__m_TrustedOption$_beg_$_end_$$int$%limited s@$ self@26@00))
  :qid |quant-u-78|)))
(assert (forall ((s@$ $Snap) (self@26@00 $Ref)) (!
  (let ((result@27@00 (m_TrustedOption$_beg_$_end_$$discriminant$$__$TY$__m_TrustedOption$_beg_$_end_$$int$%limited s@$ self@26@00))) (=>
    (m_TrustedOption$_beg_$_end_$$discriminant$$__$TY$__m_TrustedOption$_beg_$_end_$$int$%precondition s@$ self@26@00)
    (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_%precondition s@$ self@26@00)))
  :pattern ((m_TrustedOption$_beg_$_end_$$discriminant$$__$TY$__m_TrustedOption$_beg_$_end_$$int$%limited s@$ self@26@00))
  :qid |quant-u-79|)))
(assert (forall ((s@$ $Snap) (self@26@00 $Ref)) (!
  (=>
    (m_TrustedOption$_beg_$_end_$$discriminant$$__$TY$__m_TrustedOption$_beg_$_end_$$int$%precondition s@$ self@26@00)
    (=
      (m_TrustedOption$_beg_$_end_$$discriminant$$__$TY$__m_TrustedOption$_beg_$_end_$$int$ s@$ self@26@00)
      ($SortWrappers.$SnapToInt ($Snap.first s@$))))
  :pattern ((m_TrustedOption$_beg_$_end_$$discriminant$$__$TY$__m_TrustedOption$_beg_$_end_$$int$ s@$ self@26@00))
  :qid |quant-u-80|)))
(assert (forall ((s@$ $Snap) (self@26@00 $Ref)) (!
  true
  :pattern ((m_TrustedOption$_beg_$_end_$$discriminant$$__$TY$__m_TrustedOption$_beg_$_end_$$int$ s@$ self@26@00))
  :qid |quant-u-81|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- m_test$$basics ----------
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
; var __t25: Bool
(declare-const __t25@27@01 Bool)
; [exec]
; var __t26: Bool
(declare-const __t26@28@01 Bool)
; [exec]
; var __t27: Bool
(declare-const __t27@29@01 Bool)
; [exec]
; var __t28: Bool
(declare-const __t28@30@01 Bool)
; [exec]
; var __t29: Bool
(declare-const __t29@31@01 Bool)
; [exec]
; var __t30: Bool
(declare-const __t30@32@01 Bool)
; [exec]
; var __t31: Bool
(declare-const __t31@33@01 Bool)
; [exec]
; var __t32: Bool
(declare-const __t32@34@01 Bool)
; [exec]
; var __t33: Bool
(declare-const __t33@35@01 Bool)
; [exec]
; var __t34: Bool
(declare-const __t34@36@01 Bool)
; [exec]
; var __t35: Bool
(declare-const __t35@37@01 Bool)
; [exec]
; var __t36: Bool
(declare-const __t36@38@01 Bool)
; [exec]
; var __t37: Bool
(declare-const __t37@39@01 Bool)
; [exec]
; var __t38: Bool
(declare-const __t38@40@01 Bool)
; [exec]
; var __t39: Bool
(declare-const __t39@41@01 Bool)
; [exec]
; var __t40: Bool
(declare-const __t40@42@01 Bool)
; [exec]
; var __t41: Bool
(declare-const __t41@43@01 Bool)
; [exec]
; var __t42: Bool
(declare-const __t42@44@01 Bool)
; [exec]
; var __t43: Bool
(declare-const __t43@45@01 Bool)
; [exec]
; var __t44: Bool
(declare-const __t44@46@01 Bool)
; [exec]
; var __t45: Bool
(declare-const __t45@47@01 Bool)
; [exec]
; var __t46: Bool
(declare-const __t46@48@01 Bool)
; [exec]
; var __t47: Int
(declare-const __t47@49@01 Int)
; [exec]
; var __t48: Bool
(declare-const __t48@50@01 Bool)
; [exec]
; var __t49: Int
(declare-const __t49@51@01 Int)
; [exec]
; var __t50: Bool
(declare-const __t50@52@01 Bool)
; [exec]
; var __t51: Int
(declare-const __t51@53@01 Int)
; [exec]
; var __t52: Bool
(declare-const __t52@54@01 Bool)
; [exec]
; var __t53: Int
(declare-const __t53@55@01 Int)
; [exec]
; var __t54: Bool
(declare-const __t54@56@01 Bool)
; [exec]
; var __t55: Int
(declare-const __t55@57@01 Int)
; [exec]
; var __t56: Bool
(declare-const __t56@58@01 Bool)
; [exec]
; var __t57: Bool
(declare-const __t57@59@01 Bool)
; [exec]
; var _1: Ref
(declare-const _1@60@01 $Ref)
; [exec]
; var _3: Ref
(declare-const _3@61@01 $Ref)
; [exec]
; var _4: Ref
(declare-const _4@62@01 $Ref)
; [exec]
; var _5: Ref
(declare-const _5@63@01 $Ref)
; [exec]
; var _6: Ref
(declare-const _6@64@01 $Ref)
; [exec]
; var _7: Ref
(declare-const _7@65@01 $Ref)
; [exec]
; var _9: Ref
(declare-const _9@66@01 $Ref)
; [exec]
; var _10: Ref
(declare-const _10@67@01 $Ref)
; [exec]
; var _11: Ref
(declare-const _11@68@01 $Ref)
; [exec]
; var _12: Ref
(declare-const _12@69@01 $Ref)
; [exec]
; var _13: Ref
(declare-const _13@70@01 $Ref)
; [exec]
; var _14: Ref
(declare-const _14@71@01 $Ref)
; [exec]
; var _16: Ref
(declare-const _16@72@01 $Ref)
; [exec]
; var _17: Ref
(declare-const _17@73@01 $Ref)
; [exec]
; var _18: Int
(declare-const _18@74@01 Int)
; [exec]
; var _19: Int
(declare-const _19@75@01 Int)
; [exec]
; var _20: Ref
(declare-const _20@76@01 $Ref)
; [exec]
; var _21: Ref
(declare-const _21@77@01 $Ref)
; [exec]
; var _22: Int
(declare-const _22@78@01 Int)
; [exec]
; var _26: Ref
(declare-const _26@79@01 $Ref)
; [exec]
; var _27: Ref
(declare-const _27@80@01 $Ref)
; [exec]
; var _28: Int
(declare-const _28@81@01 Int)
; [exec]
; var _29: Int
(declare-const _29@82@01 Int)
; [exec]
; var _30: Ref
(declare-const _30@83@01 $Ref)
; [exec]
; var _31: Ref
(declare-const _31@84@01 $Ref)
; [exec]
; var _32: Int
(declare-const _32@85@01 Int)
; [exec]
; var _35: Ref
(declare-const _35@86@01 $Ref)
; [exec]
; var _36: Ref
(declare-const _36@87@01 $Ref)
; [exec]
; var _37: Ref
(declare-const _37@88@01 $Ref)
; [exec]
; var _38: Ref
(declare-const _38@89@01 $Ref)
; [exec]
; var _40: Ref
(declare-const _40@90@01 $Ref)
; [exec]
; var _41: Ref
(declare-const _41@91@01 $Ref)
; [exec]
; var _42: Int
(declare-const _42@92@01 Int)
; [exec]
; var _43: Int
(declare-const _43@93@01 Int)
; [exec]
; var _44: Ref
(declare-const _44@94@01 $Ref)
; [exec]
; var _45: Ref
(declare-const _45@95@01 $Ref)
; [exec]
; var _46: Int
(declare-const _46@96@01 Int)
; [exec]
; var _50: Ref
(declare-const _50@97@01 $Ref)
; [exec]
; var _51: Ref
(declare-const _51@98@01 $Ref)
; [exec]
; var _52: Int
(declare-const _52@99@01 Int)
; [exec]
; var _53: Int
(declare-const _53@100@01 Int)
; [exec]
; var _54: Ref
(declare-const _54@101@01 $Ref)
; [exec]
; var _55: Ref
(declare-const _55@102@01 $Ref)
; [exec]
; var _56: Int
(declare-const _56@103@01 Int)
; [exec]
; var _60: Ref
(declare-const _60@104@01 $Ref)
; [exec]
; var _61: Ref
(declare-const _61@105@01 $Ref)
; [exec]
; var _62: Int
(declare-const _62@106@01 Int)
; [exec]
; var _63: Int
(declare-const _63@107@01 Int)
; [exec]
; var _64: Ref
(declare-const _64@108@01 $Ref)
; [exec]
; var _65: Ref
(declare-const _65@109@01 $Ref)
; [exec]
; var _66: Int
(declare-const _66@110@01 Int)
; [exec]
; var _70: Ref
(declare-const _70@111@01 $Ref)
; [exec]
; var _71: Ref
(declare-const _71@112@01 $Ref)
; [exec]
; var _72: Ref
(declare-const _72@113@01 $Ref)
; [exec]
; var _73: Ref
(declare-const _73@114@01 $Ref)
; [exec]
; var _74: Ref
(declare-const _74@115@01 $Ref)
; [exec]
; var _t76: Ref
(declare-const _t76@116@01 $Ref)
; [exec]
; var _t77: Ref
(declare-const _t77@117@01 $Ref)
; [exec]
; var _t78: Ref
(declare-const _t78@118@01 $Ref)
; [exec]
; var _t79: Ref
(declare-const _t79@119@01 $Ref)
; [exec]
; var _t80: Ref
(declare-const _t80@120@01 $Ref)
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
; __t22 := false
; [exec]
; __t23 := false
; [exec]
; __t24 := false
; [exec]
; __t25 := false
; [exec]
; __t26 := false
; [exec]
; __t27 := false
; [exec]
; __t28 := false
; [exec]
; __t29 := false
; [exec]
; __t30 := false
; [exec]
; __t31 := false
; [exec]
; __t32 := false
; [exec]
; __t33 := false
; [exec]
; __t34 := false
; [exec]
; __t35 := false
; [exec]
; __t36 := false
; [exec]
; __t37 := false
; [exec]
; __t38 := false
; [exec]
; __t39 := false
; [exec]
; __t40 := false
; [exec]
; __t41 := false
; [exec]
; __t42 := false
; [exec]
; __t43 := false
; [exec]
; __t44 := false
; [exec]
; __t45 := false
; [exec]
; label pre
; [exec]
; __t0 := true
; [exec]
; label l0
; [exec]
; _1 := builtin$havoc_ref()
(declare-const ret@121@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(struct$m_List(_1), write)
(declare-const $t@122@01 $Snap)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale true
(declare-const $t@123@01 $Snap)
(assert (= $t@123@01 $Snap.unit))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_1)) ==
;   0
(declare-const $t@124@01 $Snap)
(assert (= $t@124@01 $Snap.unit))
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_1)) == 0
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_1))
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_1)
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
(assert (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%precondition $t@122@01 ret@121@01))
(pop) ; 3
; Joined path conditions
(assert (and
  (read$%precondition $Snap.unit)
  (<= $Perm.No (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))))
  (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%precondition $t@122@01 ret@121@01)))
(set-option :timeout 0)
(push) ; 3
(assert (m_List$$len__$TY$__Snap$struct$m_List$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@122@01 ret@121@01)))
(pop) ; 3
; Joined path conditions
(assert (m_List$$len__$TY$__Snap$struct$m_List$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@122@01 ret@121@01)))
(assert (=
  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@122@01 ret@121@01))
  0))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; label l1
; [exec]
; __t1 := true
; [exec]
; _7 := builtin$havoc_ref()
(declare-const ret@125@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_7.val_ref, write)
(declare-const $t@126@01 $Ref)
(assert (not (= ret@125@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _7.val_ref := _1
; [exec]
; label l2
; [exec]
; label l3
; [exec]
; assert true
; [exec]
; exhale acc(_7.val_ref, write) && acc(struct$m_List(_7.val_ref), write)
; [exec]
; _6 := builtin$havoc_ref()
(declare-const ret@127@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(struct$m_List(old[l3](_7.val_ref)), write)
; [eval] old[l3](_7.val_ref)
(declare-const $t@128@01 $Snap)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(m_TrustedOption$_beg_$_end_(_6), write)
(declare-const $t@129@01 $Snap)
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale true
(declare-const $t@130@01 $Snap)
(assert (= $t@130@01 $Snap.unit))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale (!(old[l3](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_7.val_ref))) ==
;   0) ||
;   m_TrustedOption$$is_none__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$(snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_(_6))) &&
;   ((!(old[l3](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_7.val_ref))) ==
;   0) ||
;   m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l3](_7.val_ref))) ==
;   0) &&
;   ((!(old[l3](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_7.val_ref))) >
;   0) ||
;   m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$(snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_(_6))) &&
;   ((!(old[l3](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_7.val_ref))) >
;   0) ||
;   m_TrustedOption$$peek__$TY$__Snap$m_TrustedOption$_beg_$_end_$$int$(snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_(_6)) ==
;   old[l3](m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_7.val_ref),
;   0))) &&
;   ((!(old[l3](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_7.val_ref))) >
;   0) ||
;   m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l3](_7.val_ref))) ==
;   old[l3](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_7.val_ref)) -
;   1)) &&
;   (!(old[l3](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_7.val_ref))) >
;   0) ||
;   (forall _0_quant_0: Int ::
;     { m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l3](_7.val_ref)),
;     _0_quant_0) }
;     0 <= _0_quant_0 ==>
;     !(0 <= _0_quant_0) ||
;     (!(_0_quant_0 <
;     m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l3](_7.val_ref)))) ||
;     old[l3](m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_7.val_ref),
;     _0_quant_0 + 1)) ==
;     m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l3](_7.val_ref)),
;     _0_quant_0))))))))
(declare-const $t@131@01 $Snap)
(assert (= $t@131@01 ($Snap.combine ($Snap.first $t@131@01) ($Snap.second $t@131@01))))
(assert (= ($Snap.first $t@131@01) $Snap.unit))
; [eval] !(old[l3](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_7.val_ref))) == 0) || m_TrustedOption$$is_none__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$(snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_(_6))
; [eval] !(old[l3](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_7.val_ref))) == 0)
; [eval] old[l3](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_7.val_ref))) == 0
; [eval] old[l3](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_7.val_ref)))
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_7.val_ref))
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_7.val_ref)
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
(pop) ; 3
; Joined path conditions
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
; [then-branch: 0 | m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@122@01, ret@121@01)) != 0 | live]
; [else-branch: 0 | m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@122@01, ret@121@01)) == 0 | live]
(push) ; 4
; [then-branch: 0 | m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@122@01, ret@121@01)) != 0]
(assert (not
  (=
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@122@01 ret@121@01))
    0)))
(pop) ; 4
(push) ; 4
; [else-branch: 0 | m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@122@01, ret@121@01)) == 0]
; [eval] m_TrustedOption$$is_none__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$(snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_(_6))
; [eval] snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_(_6)
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
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
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
(assert (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_%precondition $t@129@01 ret@127@01))
(pop) ; 5
; Joined path conditions
(assert (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_%precondition $t@129@01 ret@127@01))
(set-option :timeout 0)
(push) ; 5
(assert (m_TrustedOption$$is_none__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@129@01 ret@127@01)))
(pop) ; 5
; Joined path conditions
(assert (m_TrustedOption$$is_none__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@129@01 ret@127@01)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (=
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@122@01 ret@121@01))
    0)
  (and
    (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_%precondition $t@129@01 ret@127@01)
    (m_TrustedOption$$is_none__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$%precondition ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@129@01 ret@127@01)))))
(assert (or
  (=
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@122@01 ret@121@01))
    0)
  (not
    (=
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@122@01 ret@121@01))
      0))))
(assert (or
  (not
    (=
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@122@01 ret@121@01))
      0))
  (m_TrustedOption$$is_none__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@129@01 ret@127@01))))
(assert (=
  ($Snap.second $t@131@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@131@01))
    ($Snap.second ($Snap.second $t@131@01)))))
(assert (= ($Snap.first ($Snap.second $t@131@01)) $Snap.unit))
; [eval] !(old[l3](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_7.val_ref))) == 0) || m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l3](_7.val_ref))) == 0
; [eval] !(old[l3](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_7.val_ref))) == 0)
; [eval] old[l3](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_7.val_ref))) == 0
; [eval] old[l3](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_7.val_ref)))
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_7.val_ref))
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_7.val_ref)
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
(pop) ; 3
; Joined path conditions
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
; [then-branch: 1 | m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@122@01, ret@121@01)) != 0 | live]
; [else-branch: 1 | m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@122@01, ret@121@01)) == 0 | live]
(push) ; 4
; [then-branch: 1 | m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@122@01, ret@121@01)) != 0]
(assert (not
  (=
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@122@01 ret@121@01))
    0)))
(pop) ; 4
(push) ; 4
; [else-branch: 1 | m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@122@01, ret@121@01)) == 0]
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l3](_7.val_ref))) == 0
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l3](_7.val_ref)))
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l3](_7.val_ref))
; [eval] old[l3](_7.val_ref)
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
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
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
(assert (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%precondition $t@128@01 ret@121@01))
(pop) ; 5
; Joined path conditions
(assert (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%precondition $t@128@01 ret@121@01))
(set-option :timeout 0)
(push) ; 5
(assert (m_List$$len__$TY$__Snap$struct$m_List$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@128@01 ret@121@01)))
(pop) ; 5
; Joined path conditions
(assert (m_List$$len__$TY$__Snap$struct$m_List$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@128@01 ret@121@01)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (=
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@122@01 ret@121@01))
    0)
  (and
    (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%precondition $t@128@01 ret@121@01)
    (m_List$$len__$TY$__Snap$struct$m_List$$int$%precondition ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@128@01 ret@121@01)))))
(assert (or
  (not
    (=
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@122@01 ret@121@01))
      0))
  (=
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@128@01 ret@121@01))
    0)))
(assert (=
  ($Snap.second ($Snap.second $t@131@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@131@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@131@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@131@01))) $Snap.unit))
; [eval] !(old[l3](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_7.val_ref))) > 0) || m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$(snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_(_6))
; [eval] !(old[l3](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_7.val_ref))) > 0)
; [eval] old[l3](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_7.val_ref))) > 0
; [eval] old[l3](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_7.val_ref)))
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_7.val_ref))
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_7.val_ref)
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
(pop) ; 3
; Joined path conditions
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
; [then-branch: 2 | !(m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@122@01, ret@121@01)) > 0) | live]
; [else-branch: 2 | m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@122@01, ret@121@01)) > 0 | live]
(push) ; 4
; [then-branch: 2 | !(m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@122@01, ret@121@01)) > 0)]
(assert (not
  (>
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@122@01 ret@121@01))
    0)))
(pop) ; 4
(push) ; 4
; [else-branch: 2 | m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@122@01, ret@121@01)) > 0]
(assert (>
  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@122@01 ret@121@01))
  0))
; [eval] m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$(snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_(_6))
; [eval] snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_(_6)
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
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
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
(assert (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_%precondition $t@129@01 ret@127@01))
(pop) ; 5
; Joined path conditions
(assert (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_%precondition $t@129@01 ret@127@01))
(set-option :timeout 0)
(push) ; 5
(assert (m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@129@01 ret@127@01)))
(pop) ; 5
; Joined path conditions
(assert (m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@129@01 ret@127@01)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (>
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@122@01 ret@121@01))
    0)
  (and
    (>
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@122@01 ret@121@01))
      0)
    (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_%precondition $t@129@01 ret@127@01)
    (m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$%precondition ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@129@01 ret@127@01)))))
(assert (or
  (>
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@122@01 ret@121@01))
    0)
  (not
    (>
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@122@01 ret@121@01))
      0))))
(assert (or
  (not
    (>
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@122@01 ret@121@01))
      0))
  (m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@129@01 ret@127@01))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@131@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@131@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@131@01))))
  $Snap.unit))
; [eval] !(old[l3](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_7.val_ref))) > 0) || m_TrustedOption$$peek__$TY$__Snap$m_TrustedOption$_beg_$_end_$$int$(snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_(_6)) == old[l3](m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_7.val_ref), 0))
; [eval] !(old[l3](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_7.val_ref))) > 0)
; [eval] old[l3](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_7.val_ref))) > 0
; [eval] old[l3](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_7.val_ref)))
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_7.val_ref))
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_7.val_ref)
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
(pop) ; 3
; Joined path conditions
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
; [then-branch: 3 | !(m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@122@01, ret@121@01)) > 0) | live]
; [else-branch: 3 | m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@122@01, ret@121@01)) > 0 | live]
(push) ; 4
; [then-branch: 3 | !(m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@122@01, ret@121@01)) > 0)]
(assert (not
  (>
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@122@01 ret@121@01))
    0)))
(pop) ; 4
(push) ; 4
; [else-branch: 3 | m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@122@01, ret@121@01)) > 0]
(assert (>
  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@122@01 ret@121@01))
  0))
; [eval] m_TrustedOption$$peek__$TY$__Snap$m_TrustedOption$_beg_$_end_$$int$(snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_(_6)) == old[l3](m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_7.val_ref), 0))
; [eval] m_TrustedOption$$peek__$TY$__Snap$m_TrustedOption$_beg_$_end_$$int$(snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_(_6))
; [eval] snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_(_6)
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
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
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
(assert (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_%precondition $t@129@01 ret@127@01))
(pop) ; 5
; Joined path conditions
(assert (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_%precondition $t@129@01 ret@127@01))
(set-option :timeout 0)
(push) ; 5
; [eval] m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$(_1)
(push) ; 6
(assert (m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@129@01 ret@127@01)))
(pop) ; 6
; Joined path conditions
(assert (m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@129@01 ret@127@01)))
(push) ; 6
(assert (not (m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$ ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@129@01 ret@127@01))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$ ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@129@01 ret@127@01)))
(assert (m_TrustedOption$$peek__$TY$__Snap$m_TrustedOption$_beg_$_end_$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@129@01 ret@127@01)))
(pop) ; 5
; Joined path conditions
(assert (and
  (m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$%precondition ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@129@01 ret@127@01))
  (m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@129@01 ret@127@01))
  (m_TrustedOption$$peek__$TY$__Snap$m_TrustedOption$_beg_$_end_$$int$%precondition ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@129@01 ret@127@01))))
; [eval] old[l3](m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_7.val_ref), 0))
; [eval] m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_7.val_ref), 0)
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_7.val_ref)
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
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
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
(pop) ; 5
; Joined path conditions
(set-option :timeout 0)
(push) ; 5
; [eval] 0 <= _2
; [eval] _2 < m_List$$len__$TY$__Snap$struct$m_List$$int$(_1)
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(_1)
(push) ; 6
(pop) ; 6
; Joined path conditions
(push) ; 6
(assert (not (<
  0
  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@122@01 ret@121@01)))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (<
  0
  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@122@01 ret@121@01))))
; [eval] 0 <= _2
(assert (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@122@01 ret@121@01) 0))
(pop) ; 5
; Joined path conditions
(assert (and
  (<
    0
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@122@01 ret@121@01)))
  (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@122@01 ret@121@01) 0)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (>
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@122@01 ret@121@01))
    0)
  (and
    (>
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@122@01 ret@121@01))
      0)
    (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_%precondition $t@129@01 ret@127@01)
    (m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$%precondition ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@129@01 ret@127@01))
    (m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@129@01 ret@127@01))
    (m_TrustedOption$$peek__$TY$__Snap$m_TrustedOption$_beg_$_end_$$int$%precondition ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@129@01 ret@127@01))
    (<
      0
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@122@01 ret@121@01)))
    (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
      $Snap.unit
      ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@122@01 ret@121@01) 0))))
(assert (or
  (not
    (>
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@122@01 ret@121@01))
      0))
  (=
    (m_TrustedOption$$peek__$TY$__Snap$m_TrustedOption$_beg_$_end_$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@129@01 ret@127@01))
    (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$ ($Snap.combine
      $Snap.unit
      ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@122@01 ret@121@01) 0))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))
  $Snap.unit))
; [eval] !(old[l3](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_7.val_ref))) > 0) || m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l3](_7.val_ref))) == old[l3](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_7.val_ref)) - 1)
; [eval] !(old[l3](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_7.val_ref))) > 0)
; [eval] old[l3](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_7.val_ref))) > 0
; [eval] old[l3](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_7.val_ref)))
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_7.val_ref))
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_7.val_ref)
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
(pop) ; 3
; Joined path conditions
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
; [then-branch: 4 | !(m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@122@01, ret@121@01)) > 0) | live]
; [else-branch: 4 | m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@122@01, ret@121@01)) > 0 | live]
(push) ; 4
; [then-branch: 4 | !(m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@122@01, ret@121@01)) > 0)]
(assert (not
  (>
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@122@01 ret@121@01))
    0)))
(pop) ; 4
(push) ; 4
; [else-branch: 4 | m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@122@01, ret@121@01)) > 0]
(assert (>
  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@122@01 ret@121@01))
  0))
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l3](_7.val_ref))) == old[l3](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_7.val_ref)) - 1)
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l3](_7.val_ref)))
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l3](_7.val_ref))
; [eval] old[l3](_7.val_ref)
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
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
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
(assert (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%precondition $t@128@01 ret@121@01))
(pop) ; 5
; Joined path conditions
(assert (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%precondition $t@128@01 ret@121@01))
(set-option :timeout 0)
(push) ; 5
(assert (m_List$$len__$TY$__Snap$struct$m_List$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@128@01 ret@121@01)))
(pop) ; 5
; Joined path conditions
(assert (m_List$$len__$TY$__Snap$struct$m_List$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@128@01 ret@121@01)))
; [eval] old[l3](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_7.val_ref)) - 1)
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_7.val_ref)) - 1
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_7.val_ref))
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_7.val_ref)
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
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
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
(pop) ; 5
; Joined path conditions
(set-option :timeout 0)
(push) ; 5
(pop) ; 5
; Joined path conditions
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (>
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@122@01 ret@121@01))
    0)
  (and
    (>
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@122@01 ret@121@01))
      0)
    (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%precondition $t@128@01 ret@121@01)
    (m_List$$len__$TY$__Snap$struct$m_List$$int$%precondition ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@128@01 ret@121@01)))))
(assert (or
  (not
    (>
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@122@01 ret@121@01))
      0))
  (=
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@128@01 ret@121@01))
    (-
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@122@01 ret@121@01))
      1))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))
  $Snap.unit))
; [eval] !(old[l3](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_7.val_ref))) > 0) || (forall _0_quant_0: Int :: { m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l3](_7.val_ref)), _0_quant_0) } 0 <= _0_quant_0 ==> !(0 <= _0_quant_0) || (!(_0_quant_0 < m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l3](_7.val_ref)))) || old[l3](m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_7.val_ref), _0_quant_0 + 1)) == m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l3](_7.val_ref)), _0_quant_0)))
; [eval] !(old[l3](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_7.val_ref))) > 0)
; [eval] old[l3](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_7.val_ref))) > 0
; [eval] old[l3](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_7.val_ref)))
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_7.val_ref))
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_7.val_ref)
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
(pop) ; 3
; Joined path conditions
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
; [then-branch: 5 | !(m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@122@01, ret@121@01)) > 0) | live]
; [else-branch: 5 | m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@122@01, ret@121@01)) > 0 | live]
(push) ; 4
; [then-branch: 5 | !(m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@122@01, ret@121@01)) > 0)]
(assert (not
  (>
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@122@01 ret@121@01))
    0)))
(pop) ; 4
(push) ; 4
; [else-branch: 5 | m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@122@01, ret@121@01)) > 0]
(assert (>
  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@122@01 ret@121@01))
  0))
; [eval] (forall _0_quant_0: Int :: { m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l3](_7.val_ref)), _0_quant_0) } 0 <= _0_quant_0 ==> !(0 <= _0_quant_0) || (!(_0_quant_0 < m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l3](_7.val_ref)))) || old[l3](m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_7.val_ref), _0_quant_0 + 1)) == m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l3](_7.val_ref)), _0_quant_0)))
(declare-const _0_quant_0@132@01 Int)
(push) ; 5
; [eval] 0 <= _0_quant_0 ==> !(0 <= _0_quant_0) || (!(_0_quant_0 < m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l3](_7.val_ref)))) || old[l3](m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_7.val_ref), _0_quant_0 + 1)) == m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l3](_7.val_ref)), _0_quant_0))
; [eval] 0 <= _0_quant_0
(push) ; 6
; [then-branch: 6 | 0 <= _0_quant_0@132@01 | live]
; [else-branch: 6 | !(0 <= _0_quant_0@132@01) | live]
(push) ; 7
; [then-branch: 6 | 0 <= _0_quant_0@132@01]
(assert (<= 0 _0_quant_0@132@01))
; [eval] !(0 <= _0_quant_0) || (!(_0_quant_0 < m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l3](_7.val_ref)))) || old[l3](m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_7.val_ref), _0_quant_0 + 1)) == m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l3](_7.val_ref)), _0_quant_0))
; [eval] !(0 <= _0_quant_0)
; [eval] 0 <= _0_quant_0
(push) ; 8
; [then-branch: 7 | !(0 <= _0_quant_0@132@01) | live]
; [else-branch: 7 | 0 <= _0_quant_0@132@01 | live]
(push) ; 9
; [then-branch: 7 | !(0 <= _0_quant_0@132@01)]
(assert (not (<= 0 _0_quant_0@132@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 7 | 0 <= _0_quant_0@132@01]
; [eval] !(_0_quant_0 < m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l3](_7.val_ref))))
; [eval] _0_quant_0 < m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l3](_7.val_ref)))
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l3](_7.val_ref)))
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l3](_7.val_ref))
; [eval] old[l3](_7.val_ref)
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
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
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
(assert (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%precondition $t@128@01 ret@121@01))
(pop) ; 10
; Joined path conditions
(assert (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%precondition $t@128@01 ret@121@01))
(set-option :timeout 0)
(push) ; 10
(assert (m_List$$len__$TY$__Snap$struct$m_List$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@128@01 ret@121@01)))
(pop) ; 10
; Joined path conditions
(assert (m_List$$len__$TY$__Snap$struct$m_List$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@128@01 ret@121@01)))
(push) ; 10
; [then-branch: 8 | !(_0_quant_0@132@01 < m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@128@01, ret@121@01))) | live]
; [else-branch: 8 | _0_quant_0@132@01 < m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@128@01, ret@121@01)) | live]
(push) ; 11
; [then-branch: 8 | !(_0_quant_0@132@01 < m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@128@01, ret@121@01)))]
(assert (not
  (<
    _0_quant_0@132@01
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@128@01 ret@121@01)))))
(pop) ; 11
(push) ; 11
; [else-branch: 8 | _0_quant_0@132@01 < m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@128@01, ret@121@01))]
(assert (<
  _0_quant_0@132@01
  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@128@01 ret@121@01))))
; [eval] old[l3](m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_7.val_ref), _0_quant_0 + 1)) == m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l3](_7.val_ref)), _0_quant_0)
; [eval] old[l3](m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_7.val_ref), _0_quant_0 + 1))
; [eval] m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_7.val_ref), _0_quant_0 + 1)
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_7.val_ref)
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
; unsat
(pop) ; 13
; 0.00s
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
; [eval] _0_quant_0 + 1
(set-option :timeout 0)
(push) ; 12
; [eval] 0 <= _2
(push) ; 13
(assert (not (<= 0 (+ _0_quant_0@132@01 1))))
(check-sat)
; unsat
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(assert (<= 0 (+ _0_quant_0@132@01 1)))
; [eval] _2 < m_List$$len__$TY$__Snap$struct$m_List$$int$(_1)
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(_1)
(push) ; 13
(pop) ; 13
; Joined path conditions
(push) ; 13
(assert (not (<
  (+ _0_quant_0@132@01 1)
  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@122@01 ret@121@01)))))
(check-sat)
; unsat
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(assert (<
  (+ _0_quant_0@132@01 1)
  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@122@01 ret@121@01))))
; [eval] 0 <= _2
(assert (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@122@01 ret@121@01) (+
  _0_quant_0@132@01
  1)))
(pop) ; 12
; Joined path conditions
(assert (and
  (<= 0 (+ _0_quant_0@132@01 1))
  (<
    (+ _0_quant_0@132@01 1)
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@122@01 ret@121@01)))
  (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@122@01 ret@121@01) (+
    _0_quant_0@132@01
    1))))
; [eval] m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l3](_7.val_ref)), _0_quant_0)
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l3](_7.val_ref))
; [eval] old[l3](_7.val_ref)
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
; unsat
(pop) ; 13
; 0.00s
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
; [eval] 0 <= _2
; [eval] _2 < m_List$$len__$TY$__Snap$struct$m_List$$int$(_1)
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(_1)
(push) ; 13
(pop) ; 13
; Joined path conditions
; [eval] 0 <= _2
(assert (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@128@01 ret@121@01) _0_quant_0@132@01))
(pop) ; 12
; Joined path conditions
(assert (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@128@01 ret@121@01) _0_quant_0@132@01))
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (=>
  (<
    _0_quant_0@132@01
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@128@01 ret@121@01)))
  (and
    (<
      _0_quant_0@132@01
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@128@01 ret@121@01)))
    (<= 0 (+ _0_quant_0@132@01 1))
    (<
      (+ _0_quant_0@132@01 1)
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@122@01 ret@121@01)))
    (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
      $Snap.unit
      ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@122@01 ret@121@01) (+
      _0_quant_0@132@01
      1))
    (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
      $Snap.unit
      ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@128@01 ret@121@01) _0_quant_0@132@01))))
(assert (or
  (<
    _0_quant_0@132@01
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@128@01 ret@121@01)))
  (not
    (<
      _0_quant_0@132@01
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@128@01 ret@121@01))))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 _0_quant_0@132@01)
  (and
    (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%precondition $t@128@01 ret@121@01)
    (m_List$$len__$TY$__Snap$struct$m_List$$int$%precondition ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@128@01 ret@121@01))
    (=>
      (<
        _0_quant_0@132@01
        (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
          $Snap.unit
          $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@128@01 ret@121@01)))
      (and
        (<
          _0_quant_0@132@01
          (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
            $Snap.unit
            $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@128@01 ret@121@01)))
        (<= 0 (+ _0_quant_0@132@01 1))
        (<
          (+ _0_quant_0@132@01 1)
          (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
            $Snap.unit
            $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@122@01 ret@121@01)))
        (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@122@01 ret@121@01) (+
          _0_quant_0@132@01
          1))
        (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@128@01 ret@121@01) _0_quant_0@132@01)))
    (or
      (<
        _0_quant_0@132@01
        (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
          $Snap.unit
          $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@128@01 ret@121@01)))
      (not
        (<
          _0_quant_0@132@01
          (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
            $Snap.unit
            $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@128@01 ret@121@01))))))))
(assert (or (<= 0 _0_quant_0@132@01) (not (<= 0 _0_quant_0@132@01))))
(pop) ; 7
(push) ; 7
; [else-branch: 6 | !(0 <= _0_quant_0@132@01)]
(assert (not (<= 0 _0_quant_0@132@01)))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (=>
  (<= 0 _0_quant_0@132@01)
  (and
    (<= 0 _0_quant_0@132@01)
    (=>
      (<= 0 _0_quant_0@132@01)
      (and
        (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%precondition $t@128@01 ret@121@01)
        (m_List$$len__$TY$__Snap$struct$m_List$$int$%precondition ($Snap.combine
          $Snap.unit
          $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@128@01 ret@121@01))
        (=>
          (<
            _0_quant_0@132@01
            (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
              $Snap.unit
              $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@128@01 ret@121@01)))
          (and
            (<
              _0_quant_0@132@01
              (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                $Snap.unit
                $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@128@01 ret@121@01)))
            (<= 0 (+ _0_quant_0@132@01 1))
            (<
              (+ _0_quant_0@132@01 1)
              (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                $Snap.unit
                $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@122@01 ret@121@01)))
            (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@122@01 ret@121@01) (+
              _0_quant_0@132@01
              1))
            (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@128@01 ret@121@01) _0_quant_0@132@01)))
        (or
          (<
            _0_quant_0@132@01
            (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
              $Snap.unit
              $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@128@01 ret@121@01)))
          (not
            (<
              _0_quant_0@132@01
              (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                $Snap.unit
                $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@128@01 ret@121@01)))))))
    (or (<= 0 _0_quant_0@132@01) (not (<= 0 _0_quant_0@132@01))))))
; Joined path conditions
(assert (or (not (<= 0 _0_quant_0@132@01)) (<= 0 _0_quant_0@132@01)))
(pop) ; 5
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((_0_quant_0@132@01 Int)) (!
  (and
    (=>
      (<= 0 _0_quant_0@132@01)
      (and
        (<= 0 _0_quant_0@132@01)
        (=>
          (<= 0 _0_quant_0@132@01)
          (and
            (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%precondition $t@128@01 ret@121@01)
            (m_List$$len__$TY$__Snap$struct$m_List$$int$%precondition ($Snap.combine
              $Snap.unit
              $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@128@01 ret@121@01))
            (=>
              (<
                _0_quant_0@132@01
                (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                  $Snap.unit
                  $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@128@01 ret@121@01)))
              (and
                (<
                  _0_quant_0@132@01
                  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                    $Snap.unit
                    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@128@01 ret@121@01)))
                (<= 0 (+ _0_quant_0@132@01 1))
                (<
                  (+ _0_quant_0@132@01 1)
                  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                    $Snap.unit
                    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@122@01 ret@121@01)))
                (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@122@01 ret@121@01) (+
                  _0_quant_0@132@01
                  1))
                (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@128@01 ret@121@01) _0_quant_0@132@01)))
            (or
              (<
                _0_quant_0@132@01
                (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                  $Snap.unit
                  $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@128@01 ret@121@01)))
              (not
                (<
                  _0_quant_0@132@01
                  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                    $Snap.unit
                    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@128@01 ret@121@01)))))))
        (or (<= 0 _0_quant_0@132@01) (not (<= 0 _0_quant_0@132@01)))))
    (or (not (<= 0 _0_quant_0@132@01)) (<= 0 _0_quant_0@132@01)))
  :pattern ((m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%limited ($Snap.combine
    $Snap.unit
    ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@128@01 ret@121@01) _0_quant_0@132@01))
  :qid |prog.l796-aux|)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (>
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@122@01 ret@121@01))
    0)
  (and
    (>
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@122@01 ret@121@01))
      0)
    (forall ((_0_quant_0@132@01 Int)) (!
      (and
        (=>
          (<= 0 _0_quant_0@132@01)
          (and
            (<= 0 _0_quant_0@132@01)
            (=>
              (<= 0 _0_quant_0@132@01)
              (and
                (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%precondition $t@128@01 ret@121@01)
                (m_List$$len__$TY$__Snap$struct$m_List$$int$%precondition ($Snap.combine
                  $Snap.unit
                  $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@128@01 ret@121@01))
                (=>
                  (<
                    _0_quant_0@132@01
                    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                      $Snap.unit
                      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@128@01 ret@121@01)))
                  (and
                    (<
                      _0_quant_0@132@01
                      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                        $Snap.unit
                        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@128@01 ret@121@01)))
                    (<= 0 (+ _0_quant_0@132@01 1))
                    (<
                      (+ _0_quant_0@132@01 1)
                      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                        $Snap.unit
                        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@122@01 ret@121@01)))
                    (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
                      $Snap.unit
                      ($Snap.combine
                        $Snap.unit
                        ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@122@01 ret@121@01) (+
                      _0_quant_0@132@01
                      1))
                    (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
                      $Snap.unit
                      ($Snap.combine
                        $Snap.unit
                        ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@128@01 ret@121@01) _0_quant_0@132@01)))
                (or
                  (<
                    _0_quant_0@132@01
                    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                      $Snap.unit
                      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@128@01 ret@121@01)))
                  (not
                    (<
                      _0_quant_0@132@01
                      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                        $Snap.unit
                        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@128@01 ret@121@01)))))))
            (or (<= 0 _0_quant_0@132@01) (not (<= 0 _0_quant_0@132@01)))))
        (or (not (<= 0 _0_quant_0@132@01)) (<= 0 _0_quant_0@132@01)))
      :pattern ((m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%limited ($Snap.combine
        $Snap.unit
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@128@01 ret@121@01) _0_quant_0@132@01))
      :qid |prog.l796-aux|)))))
(assert (or
  (not
    (>
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@122@01 ret@121@01))
      0))
  (forall ((_0_quant_0@132@01 Int)) (!
    (=>
      (<= 0 _0_quant_0@132@01)
      (or
        (not (<= 0 _0_quant_0@132@01))
        (or
          (not
            (<
              _0_quant_0@132@01
              (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                $Snap.unit
                $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@128@01 ret@121@01))))
          (=
            (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$ ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@122@01 ret@121@01) (+
              _0_quant_0@132@01
              1))
            (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$ ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@128@01 ret@121@01) _0_quant_0@132@01)))))
    :pattern ((m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%limited ($Snap.combine
      $Snap.unit
      ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@128@01 ret@121@01) _0_quant_0@132@01))
    :qid |prog.l796|))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; label l4
; [exec]
; __t2 := true
; [exec]
; _5 := builtin$havoc_ref()
(declare-const ret@133@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_5.val_ref, write)
(declare-const $t@134@01 $Ref)
(assert (not (= ret@133@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _5.val_ref := _6
; [exec]
; exhale acc(m_TrustedOption$_beg_$_end_(_6), write - read$())
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
; inhale acc(m_TrustedOption$_beg_$_end_(_5.val_ref), read$())
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
(declare-const $t@135@01 $Snap)
(declare-const $t@136@01 $Snap)
(assert (and
  (=>
    (<
      $Perm.No
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit)))))
    (= $t@136@01 $t@129@01))
  (=> (< $Perm.No (read$ $Snap.unit)) (= $t@136@01 $t@135@01))))
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
; label l6
; [exec]
; label l7
; [exec]
; _4 := builtin$havoc_ref()
(declare-const ret@137@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(bool(_4), write)
(declare-const $t@138@01 Bool)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (unfolding acc(bool(_4), write) in _4.val_bool) ==
;   m_TrustedOption$$is_none__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$(snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_(_5.val_ref))
(declare-const $t@139@01 $Snap)
(assert (= $t@139@01 $Snap.unit))
; [eval] (unfolding acc(bool(_4), write) in _4.val_bool) == m_TrustedOption$$is_none__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$(snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_(_5.val_ref))
; [eval] (unfolding acc(bool(_4), write) in _4.val_bool)
(set-option :timeout 0)
(push) ; 3
(assert (bool%trigger ($SortWrappers.BoolTo$Snap $t@138@01) ret@137@01))
(assert (not (= ret@137@01 $Ref.null)))
(pop) ; 3
; Joined path conditions
(assert (and
  (bool%trigger ($SortWrappers.BoolTo$Snap $t@138@01) ret@137@01)
  (not (= ret@137@01 $Ref.null))))
; [eval] m_TrustedOption$$is_none__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$(snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_(_5.val_ref))
; [eval] snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_(_5.val_ref)
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
; 0.00s
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
(assert (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_%precondition $t@136@01 ret@127@01))
(pop) ; 3
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
  (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_%precondition $t@136@01 ret@127@01)))
(set-option :timeout 0)
(push) ; 3
(assert (m_TrustedOption$$is_none__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@136@01 ret@127@01)))
(pop) ; 3
; Joined path conditions
(assert (m_TrustedOption$$is_none__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@136@01 ret@127@01)))
(assert (=
  $t@138@01
  (m_TrustedOption$$is_none__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@136@01 ret@127@01))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [eval] __t2 && __t2
(set-option :timeout 0)
(push) ; 3
; [then-branch: 9 | True | live]
; [else-branch: 9 | False | live]
(push) ; 4
; [then-branch: 9 | True]
(pop) ; 4
(push) ; 4
; [else-branch: 9 | False]
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
; 0.00s
; (get-info :all-statistics)
; [then-branch: 10 | True | live]
; [else-branch: 10 | False | dead]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 10 | True]
; [exec]
; exhale acc(m_TrustedOption$_beg_$_end_(old[l6](_5.val_ref)), read$())
; [eval] read$()
(push) ; 4
(pop) ; 4
; Joined path conditions
; [eval] old[l6](_5.val_ref)
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
; inhale acc(m_TrustedOption$_beg_$_end_(_6), write - read$())
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
(declare-const $t@140@01 $Snap)
(declare-const $t@141@01 $Snap)
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
    (= $t@141@01 $t@136@01))
  (=> (< $Perm.No (- $Perm.Write (read$ $Snap.unit))) (= $t@141@01 $t@140@01))))
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
; __t3 := true
; [exec]
; _3 := builtin$havoc_ref()
(declare-const ret@142@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_3.val_bool, write)
(declare-const $t@143@01 Bool)
(assert (not (= ret@142@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; unfold acc(bool(_4), write)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@142@01 ret@137@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
; [exec]
; _3.val_bool := !_4.val_bool
; [eval] !_4.val_bool
(declare-const val_bool@144@01 Bool)
(assert (= val_bool@144@01 (not $t@138@01)))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@137@01 ret@142@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t46 := _3.val_bool
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not val_bool@144@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [then-branch: 11 | val_bool@144@01 | dead]
; [else-branch: 11 | !(val_bool@144@01) | live]
(set-option :timeout 0)
(push) ; 4
; [else-branch: 11 | !(val_bool@144@01)]
(assert (not val_bool@144@01))
(pop) ; 4
; [eval] !__t46
(push) ; 4
(set-option :timeout 10)
(assert (not val_bool@144@01))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not val_bool@144@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [then-branch: 12 | !(val_bool@144@01) | live]
; [else-branch: 12 | val_bool@144@01 | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 12 | !(val_bool@144@01)]
(assert (not val_bool@144@01))
; [exec]
; label return
; [exec]
; __t5 := true
; [exec]
; _10 := builtin$havoc_ref()
(declare-const ret@145@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_10.val_ref, write)
(declare-const $t@146@01 $Ref)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@133@01 ret@145@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@145@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _10.val_ref := _1
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@133@01 ret@145@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [exec]
; label l11
; [exec]
; label l12
; [exec]
; _t76 := builtin$havoc_ref()
(declare-const ret@147@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(i32(_t76), write)
(declare-const $t@148@01 Int)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert true
; [exec]
; exhale acc(_10.val_ref, write) &&
;   (acc(struct$m_List(_10.val_ref), write) && acc(i32(_t76), write))
; [exec]
; _9 := builtin$havoc_ref()
(declare-const ret@149@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(struct$m_List(old[l12](_10.val_ref)), write)
; [eval] old[l12](_10.val_ref)
(declare-const $t@150@01 $Snap)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(tuple0$(_9), write)
(declare-const $t@151@01 $Snap)
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale true
(declare-const $t@152@01 $Snap)
(assert (= $t@152@01 $Snap.unit))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l12](_10.val_ref))) ==
;   old[l12](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_10.val_ref))) +
;   1 &&
;   (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l12](_10.val_ref)),
;   0) ==
;   old[l12](1) &&
;   (forall _0_quant_0: Int ::
;     { m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l12](_10.val_ref)),
;     _0_quant_0) }
;     0 <= _0_quant_0 ==>
;     !(1 <= _0_quant_0) ||
;     (!(_0_quant_0 <
;     m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l12](_10.val_ref)))) ||
;     old[l12](m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_10.val_ref),
;     _0_quant_0 - 1)) ==
;     m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l12](_10.val_ref)),
;     _0_quant_0))))
(declare-const $t@153@01 $Snap)
(assert (= $t@153@01 ($Snap.combine ($Snap.first $t@153@01) ($Snap.second $t@153@01))))
(assert (= ($Snap.first $t@153@01) $Snap.unit))
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l12](_10.val_ref))) == old[l12](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_10.val_ref))) + 1
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l12](_10.val_ref)))
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l12](_10.val_ref))
; [eval] old[l12](_10.val_ref)
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
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
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
(assert (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%precondition $t@150@01 ret@121@01))
(pop) ; 5
; Joined path conditions
(assert (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%precondition $t@150@01 ret@121@01))
(set-option :timeout 0)
(push) ; 5
(assert (m_List$$len__$TY$__Snap$struct$m_List$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@150@01 ret@121@01)))
(pop) ; 5
; Joined path conditions
(assert (m_List$$len__$TY$__Snap$struct$m_List$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@150@01 ret@121@01)))
; [eval] old[l12](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_10.val_ref))) + 1
; [eval] old[l12](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_10.val_ref)))
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_10.val_ref))
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_10.val_ref)
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
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
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
(assert (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%precondition $t@128@01 ret@121@01))
(pop) ; 5
; Joined path conditions
(assert (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%precondition $t@128@01 ret@121@01))
(set-option :timeout 0)
(push) ; 5
(assert (m_List$$len__$TY$__Snap$struct$m_List$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@128@01 ret@121@01)))
(pop) ; 5
; Joined path conditions
(assert (m_List$$len__$TY$__Snap$struct$m_List$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@128@01 ret@121@01)))
(assert (=
  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@150@01 ret@121@01))
  (+
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@128@01 ret@121@01))
    1)))
(assert (=
  ($Snap.second $t@153@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@153@01))
    ($Snap.second ($Snap.second $t@153@01)))))
(assert (= ($Snap.first ($Snap.second $t@153@01)) $Snap.unit))
; [eval] m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l12](_10.val_ref)), 0) == old[l12](1)
; [eval] m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l12](_10.val_ref)), 0)
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l12](_10.val_ref))
; [eval] old[l12](_10.val_ref)
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
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
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
(pop) ; 5
; Joined path conditions
(set-option :timeout 0)
(push) ; 5
; [eval] 0 <= _2
; [eval] _2 < m_List$$len__$TY$__Snap$struct$m_List$$int$(_1)
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(_1)
(push) ; 6
(pop) ; 6
; Joined path conditions
(push) ; 6
(assert (not (<
  0
  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@150@01 ret@121@01)))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (<
  0
  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@150@01 ret@121@01))))
; [eval] 0 <= _2
(assert (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@150@01 ret@121@01) 0))
(pop) ; 5
; Joined path conditions
(assert (and
  (<
    0
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@150@01 ret@121@01)))
  (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@150@01 ret@121@01) 0)))
; [eval] old[l12](1)
(assert (=
  (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$ ($Snap.combine
    $Snap.unit
    ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@150@01 ret@121@01) 0)
  1))
(assert (= ($Snap.second ($Snap.second $t@153@01)) $Snap.unit))
; [eval] (forall _0_quant_0: Int :: { m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l12](_10.val_ref)), _0_quant_0) } 0 <= _0_quant_0 ==> !(1 <= _0_quant_0) || (!(_0_quant_0 < m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l12](_10.val_ref)))) || old[l12](m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_10.val_ref), _0_quant_0 - 1)) == m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l12](_10.val_ref)), _0_quant_0)))
(declare-const _0_quant_0@154@01 Int)
(push) ; 5
; [eval] 0 <= _0_quant_0 ==> !(1 <= _0_quant_0) || (!(_0_quant_0 < m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l12](_10.val_ref)))) || old[l12](m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_10.val_ref), _0_quant_0 - 1)) == m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l12](_10.val_ref)), _0_quant_0))
; [eval] 0 <= _0_quant_0
(push) ; 6
; [then-branch: 13 | 0 <= _0_quant_0@154@01 | live]
; [else-branch: 13 | !(0 <= _0_quant_0@154@01) | live]
(push) ; 7
; [then-branch: 13 | 0 <= _0_quant_0@154@01]
(assert (<= 0 _0_quant_0@154@01))
; [eval] !(1 <= _0_quant_0) || (!(_0_quant_0 < m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l12](_10.val_ref)))) || old[l12](m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_10.val_ref), _0_quant_0 - 1)) == m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l12](_10.val_ref)), _0_quant_0))
; [eval] !(1 <= _0_quant_0)
; [eval] 1 <= _0_quant_0
(push) ; 8
; [then-branch: 14 | !(1 <= _0_quant_0@154@01) | live]
; [else-branch: 14 | 1 <= _0_quant_0@154@01 | live]
(push) ; 9
; [then-branch: 14 | !(1 <= _0_quant_0@154@01)]
(assert (not (<= 1 _0_quant_0@154@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 14 | 1 <= _0_quant_0@154@01]
(assert (<= 1 _0_quant_0@154@01))
; [eval] !(_0_quant_0 < m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l12](_10.val_ref))))
; [eval] _0_quant_0 < m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l12](_10.val_ref)))
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l12](_10.val_ref)))
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l12](_10.val_ref))
; [eval] old[l12](_10.val_ref)
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
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
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
(pop) ; 10
; Joined path conditions
(set-option :timeout 0)
(push) ; 10
(pop) ; 10
; Joined path conditions
(push) ; 10
; [then-branch: 15 | !(_0_quant_0@154@01 < m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@150@01, ret@121@01))) | live]
; [else-branch: 15 | _0_quant_0@154@01 < m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@150@01, ret@121@01)) | live]
(push) ; 11
; [then-branch: 15 | !(_0_quant_0@154@01 < m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@150@01, ret@121@01)))]
(assert (not
  (<
    _0_quant_0@154@01
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@150@01 ret@121@01)))))
(pop) ; 11
(push) ; 11
; [else-branch: 15 | _0_quant_0@154@01 < m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@150@01, ret@121@01))]
(assert (<
  _0_quant_0@154@01
  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@150@01 ret@121@01))))
; [eval] old[l12](m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_10.val_ref), _0_quant_0 - 1)) == m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l12](_10.val_ref)), _0_quant_0)
; [eval] old[l12](m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_10.val_ref), _0_quant_0 - 1))
; [eval] m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_10.val_ref), _0_quant_0 - 1)
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_10.val_ref)
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
; unsat
(pop) ; 13
; 0.00s
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
; [eval] _0_quant_0 - 1
(set-option :timeout 0)
(push) ; 12
; [eval] 0 <= _2
(push) ; 13
(assert (not (<= 0 (- _0_quant_0@154@01 1))))
(check-sat)
; unsat
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(assert (<= 0 (- _0_quant_0@154@01 1)))
; [eval] _2 < m_List$$len__$TY$__Snap$struct$m_List$$int$(_1)
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(_1)
(push) ; 13
(pop) ; 13
; Joined path conditions
(push) ; 13
(assert (not (<
  (- _0_quant_0@154@01 1)
  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@128@01 ret@121@01)))))
(check-sat)
; unsat
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(assert (<
  (- _0_quant_0@154@01 1)
  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@128@01 ret@121@01))))
; [eval] 0 <= _2
(assert (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@128@01 ret@121@01) (-
  _0_quant_0@154@01
  1)))
(pop) ; 12
; Joined path conditions
(assert (and
  (<= 0 (- _0_quant_0@154@01 1))
  (<
    (- _0_quant_0@154@01 1)
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@128@01 ret@121@01)))
  (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@128@01 ret@121@01) (-
    _0_quant_0@154@01
    1))))
; [eval] m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l12](_10.val_ref)), _0_quant_0)
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l12](_10.val_ref))
; [eval] old[l12](_10.val_ref)
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
; unsat
(pop) ; 13
; 0.00s
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
; [eval] 0 <= _2
; [eval] _2 < m_List$$len__$TY$__Snap$struct$m_List$$int$(_1)
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(_1)
(push) ; 13
(pop) ; 13
; Joined path conditions
; [eval] 0 <= _2
(assert (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@150@01 ret@121@01) _0_quant_0@154@01))
(pop) ; 12
; Joined path conditions
(assert (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@150@01 ret@121@01) _0_quant_0@154@01))
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (=>
  (<
    _0_quant_0@154@01
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@150@01 ret@121@01)))
  (and
    (<
      _0_quant_0@154@01
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@150@01 ret@121@01)))
    (<= 0 (- _0_quant_0@154@01 1))
    (<
      (- _0_quant_0@154@01 1)
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@128@01 ret@121@01)))
    (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
      $Snap.unit
      ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@128@01 ret@121@01) (-
      _0_quant_0@154@01
      1))
    (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
      $Snap.unit
      ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@150@01 ret@121@01) _0_quant_0@154@01))))
(assert (or
  (<
    _0_quant_0@154@01
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@150@01 ret@121@01)))
  (not
    (<
      _0_quant_0@154@01
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@150@01 ret@121@01))))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 1 _0_quant_0@154@01)
  (and
    (<= 1 _0_quant_0@154@01)
    (=>
      (<
        _0_quant_0@154@01
        (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
          $Snap.unit
          $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@150@01 ret@121@01)))
      (and
        (<
          _0_quant_0@154@01
          (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
            $Snap.unit
            $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@150@01 ret@121@01)))
        (<= 0 (- _0_quant_0@154@01 1))
        (<
          (- _0_quant_0@154@01 1)
          (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
            $Snap.unit
            $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@128@01 ret@121@01)))
        (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@128@01 ret@121@01) (-
          _0_quant_0@154@01
          1))
        (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@150@01 ret@121@01) _0_quant_0@154@01)))
    (or
      (<
        _0_quant_0@154@01
        (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
          $Snap.unit
          $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@150@01 ret@121@01)))
      (not
        (<
          _0_quant_0@154@01
          (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
            $Snap.unit
            $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@150@01 ret@121@01))))))))
(assert (or (<= 1 _0_quant_0@154@01) (not (<= 1 _0_quant_0@154@01))))
(pop) ; 7
(push) ; 7
; [else-branch: 13 | !(0 <= _0_quant_0@154@01)]
(assert (not (<= 0 _0_quant_0@154@01)))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (=>
  (<= 0 _0_quant_0@154@01)
  (and
    (<= 0 _0_quant_0@154@01)
    (=>
      (<= 1 _0_quant_0@154@01)
      (and
        (<= 1 _0_quant_0@154@01)
        (=>
          (<
            _0_quant_0@154@01
            (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
              $Snap.unit
              $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@150@01 ret@121@01)))
          (and
            (<
              _0_quant_0@154@01
              (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                $Snap.unit
                $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@150@01 ret@121@01)))
            (<= 0 (- _0_quant_0@154@01 1))
            (<
              (- _0_quant_0@154@01 1)
              (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                $Snap.unit
                $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@128@01 ret@121@01)))
            (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@128@01 ret@121@01) (-
              _0_quant_0@154@01
              1))
            (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@150@01 ret@121@01) _0_quant_0@154@01)))
        (or
          (<
            _0_quant_0@154@01
            (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
              $Snap.unit
              $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@150@01 ret@121@01)))
          (not
            (<
              _0_quant_0@154@01
              (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                $Snap.unit
                $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@150@01 ret@121@01)))))))
    (or (<= 1 _0_quant_0@154@01) (not (<= 1 _0_quant_0@154@01))))))
; Joined path conditions
(assert (or (not (<= 0 _0_quant_0@154@01)) (<= 0 _0_quant_0@154@01)))
(pop) ; 5
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((_0_quant_0@154@01 Int)) (!
  (and
    (=>
      (<= 0 _0_quant_0@154@01)
      (and
        (<= 0 _0_quant_0@154@01)
        (=>
          (<= 1 _0_quant_0@154@01)
          (and
            (<= 1 _0_quant_0@154@01)
            (=>
              (<
                _0_quant_0@154@01
                (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                  $Snap.unit
                  $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@150@01 ret@121@01)))
              (and
                (<
                  _0_quant_0@154@01
                  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                    $Snap.unit
                    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@150@01 ret@121@01)))
                (<= 0 (- _0_quant_0@154@01 1))
                (<
                  (- _0_quant_0@154@01 1)
                  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                    $Snap.unit
                    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@128@01 ret@121@01)))
                (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@128@01 ret@121@01) (-
                  _0_quant_0@154@01
                  1))
                (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@150@01 ret@121@01) _0_quant_0@154@01)))
            (or
              (<
                _0_quant_0@154@01
                (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                  $Snap.unit
                  $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@150@01 ret@121@01)))
              (not
                (<
                  _0_quant_0@154@01
                  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                    $Snap.unit
                    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@150@01 ret@121@01)))))))
        (or (<= 1 _0_quant_0@154@01) (not (<= 1 _0_quant_0@154@01)))))
    (or (not (<= 0 _0_quant_0@154@01)) (<= 0 _0_quant_0@154@01)))
  :pattern ((m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%limited ($Snap.combine
    $Snap.unit
    ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@150@01 ret@121@01) _0_quant_0@154@01))
  :qid |prog.l1749-aux|)))
(assert (forall ((_0_quant_0@154@01 Int)) (!
  (=>
    (<= 0 _0_quant_0@154@01)
    (or
      (not (<= 1 _0_quant_0@154@01))
      (or
        (not
          (<
            _0_quant_0@154@01
            (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
              $Snap.unit
              $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@150@01 ret@121@01))))
        (=
          (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$ ($Snap.combine
            $Snap.unit
            ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@128@01 ret@121@01) (-
            _0_quant_0@154@01
            1))
          (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$ ($Snap.combine
            $Snap.unit
            ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@150@01 ret@121@01) _0_quant_0@154@01)))))
  :pattern ((m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%limited ($Snap.combine
    $Snap.unit
    ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@150@01 ret@121@01) _0_quant_0@154@01))
  :qid |prog.l1749|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; label l13
; [exec]
; __t6 := true
; [exec]
; _12 := builtin$havoc_ref()
(declare-const ret@155@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_12.val_ref, write)
(declare-const $t@156@01 $Ref)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@133@01 ret@155@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@155@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _12.val_ref := _1
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@133@01 ret@155@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [exec]
; label l15
; [exec]
; label l16
; [exec]
; _t77 := builtin$havoc_ref()
(declare-const ret@157@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(i32(_t77), write)
(declare-const $t@158@01 Int)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert true
; [exec]
; exhale acc(_12.val_ref, write) &&
;   (acc(struct$m_List(_12.val_ref), write) && acc(i32(_t77), write))
; [exec]
; _11 := builtin$havoc_ref()
(declare-const ret@159@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(struct$m_List(old[l16](_12.val_ref)), write)
; [eval] old[l16](_12.val_ref)
(declare-const $t@160@01 $Snap)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(tuple0$(_11), write)
(declare-const $t@161@01 $Snap)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@149@01 ret@159@01)))
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
; inhale true
(declare-const $t@162@01 $Snap)
(assert (= $t@162@01 $Snap.unit))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l16](_12.val_ref))) ==
;   old[l16](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_12.val_ref))) +
;   1 &&
;   (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l16](_12.val_ref)),
;   0) ==
;   old[l16](2) &&
;   (forall _0_quant_0: Int ::
;     { m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l16](_12.val_ref)),
;     _0_quant_0) }
;     0 <= _0_quant_0 ==>
;     !(1 <= _0_quant_0) ||
;     (!(_0_quant_0 <
;     m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l16](_12.val_ref)))) ||
;     old[l16](m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_12.val_ref),
;     _0_quant_0 - 1)) ==
;     m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l16](_12.val_ref)),
;     _0_quant_0))))
(declare-const $t@163@01 $Snap)
(assert (= $t@163@01 ($Snap.combine ($Snap.first $t@163@01) ($Snap.second $t@163@01))))
(assert (= ($Snap.first $t@163@01) $Snap.unit))
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l16](_12.val_ref))) == old[l16](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_12.val_ref))) + 1
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l16](_12.val_ref)))
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l16](_12.val_ref))
; [eval] old[l16](_12.val_ref)
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
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
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
(assert (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%precondition $t@160@01 ret@121@01))
(pop) ; 5
; Joined path conditions
(assert (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%precondition $t@160@01 ret@121@01))
(set-option :timeout 0)
(push) ; 5
(assert (m_List$$len__$TY$__Snap$struct$m_List$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@160@01 ret@121@01)))
(pop) ; 5
; Joined path conditions
(assert (m_List$$len__$TY$__Snap$struct$m_List$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@160@01 ret@121@01)))
; [eval] old[l16](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_12.val_ref))) + 1
; [eval] old[l16](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_12.val_ref)))
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_12.val_ref))
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_12.val_ref)
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
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
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
(pop) ; 5
; Joined path conditions
(set-option :timeout 0)
(push) ; 5
(pop) ; 5
; Joined path conditions
(assert (=
  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@160@01 ret@121@01))
  (+
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@150@01 ret@121@01))
    1)))
(assert (=
  ($Snap.second $t@163@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@163@01))
    ($Snap.second ($Snap.second $t@163@01)))))
(assert (= ($Snap.first ($Snap.second $t@163@01)) $Snap.unit))
; [eval] m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l16](_12.val_ref)), 0) == old[l16](2)
; [eval] m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l16](_12.val_ref)), 0)
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l16](_12.val_ref))
; [eval] old[l16](_12.val_ref)
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
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
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
(pop) ; 5
; Joined path conditions
(set-option :timeout 0)
(push) ; 5
; [eval] 0 <= _2
; [eval] _2 < m_List$$len__$TY$__Snap$struct$m_List$$int$(_1)
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(_1)
(push) ; 6
(pop) ; 6
; Joined path conditions
(push) ; 6
(assert (not (<
  0
  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@160@01 ret@121@01)))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (<
  0
  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@160@01 ret@121@01))))
; [eval] 0 <= _2
(assert (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@160@01 ret@121@01) 0))
(pop) ; 5
; Joined path conditions
(assert (and
  (<
    0
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@160@01 ret@121@01)))
  (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@160@01 ret@121@01) 0)))
; [eval] old[l16](2)
(assert (=
  (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$ ($Snap.combine
    $Snap.unit
    ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@160@01 ret@121@01) 0)
  2))
(assert (= ($Snap.second ($Snap.second $t@163@01)) $Snap.unit))
; [eval] (forall _0_quant_0: Int :: { m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l16](_12.val_ref)), _0_quant_0) } 0 <= _0_quant_0 ==> !(1 <= _0_quant_0) || (!(_0_quant_0 < m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l16](_12.val_ref)))) || old[l16](m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_12.val_ref), _0_quant_0 - 1)) == m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l16](_12.val_ref)), _0_quant_0)))
(declare-const _0_quant_0@164@01 Int)
(push) ; 5
; [eval] 0 <= _0_quant_0 ==> !(1 <= _0_quant_0) || (!(_0_quant_0 < m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l16](_12.val_ref)))) || old[l16](m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_12.val_ref), _0_quant_0 - 1)) == m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l16](_12.val_ref)), _0_quant_0))
; [eval] 0 <= _0_quant_0
(push) ; 6
; [then-branch: 16 | 0 <= _0_quant_0@164@01 | live]
; [else-branch: 16 | !(0 <= _0_quant_0@164@01) | live]
(push) ; 7
; [then-branch: 16 | 0 <= _0_quant_0@164@01]
(assert (<= 0 _0_quant_0@164@01))
; [eval] !(1 <= _0_quant_0) || (!(_0_quant_0 < m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l16](_12.val_ref)))) || old[l16](m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_12.val_ref), _0_quant_0 - 1)) == m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l16](_12.val_ref)), _0_quant_0))
; [eval] !(1 <= _0_quant_0)
; [eval] 1 <= _0_quant_0
(push) ; 8
; [then-branch: 17 | !(1 <= _0_quant_0@164@01) | live]
; [else-branch: 17 | 1 <= _0_quant_0@164@01 | live]
(push) ; 9
; [then-branch: 17 | !(1 <= _0_quant_0@164@01)]
(assert (not (<= 1 _0_quant_0@164@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 17 | 1 <= _0_quant_0@164@01]
(assert (<= 1 _0_quant_0@164@01))
; [eval] !(_0_quant_0 < m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l16](_12.val_ref))))
; [eval] _0_quant_0 < m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l16](_12.val_ref)))
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l16](_12.val_ref)))
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l16](_12.val_ref))
; [eval] old[l16](_12.val_ref)
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
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
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
(pop) ; 10
; Joined path conditions
(set-option :timeout 0)
(push) ; 10
(pop) ; 10
; Joined path conditions
(push) ; 10
; [then-branch: 18 | !(_0_quant_0@164@01 < m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@160@01, ret@121@01))) | live]
; [else-branch: 18 | _0_quant_0@164@01 < m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@160@01, ret@121@01)) | live]
(push) ; 11
; [then-branch: 18 | !(_0_quant_0@164@01 < m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@160@01, ret@121@01)))]
(assert (not
  (<
    _0_quant_0@164@01
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@160@01 ret@121@01)))))
(pop) ; 11
(push) ; 11
; [else-branch: 18 | _0_quant_0@164@01 < m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@160@01, ret@121@01))]
(assert (<
  _0_quant_0@164@01
  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@160@01 ret@121@01))))
; [eval] old[l16](m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_12.val_ref), _0_quant_0 - 1)) == m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l16](_12.val_ref)), _0_quant_0)
; [eval] old[l16](m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_12.val_ref), _0_quant_0 - 1))
; [eval] m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_12.val_ref), _0_quant_0 - 1)
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_12.val_ref)
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
; 0.00s
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
; [eval] _0_quant_0 - 1
(set-option :timeout 0)
(push) ; 12
; [eval] 0 <= _2
(push) ; 13
(assert (not (<= 0 (- _0_quant_0@164@01 1))))
(check-sat)
; unsat
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(assert (<= 0 (- _0_quant_0@164@01 1)))
; [eval] _2 < m_List$$len__$TY$__Snap$struct$m_List$$int$(_1)
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(_1)
(push) ; 13
(pop) ; 13
; Joined path conditions
(push) ; 13
(assert (not (<
  (- _0_quant_0@164@01 1)
  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@150@01 ret@121@01)))))
(check-sat)
; unsat
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(assert (<
  (- _0_quant_0@164@01 1)
  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@150@01 ret@121@01))))
; [eval] 0 <= _2
(assert (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@150@01 ret@121@01) (-
  _0_quant_0@164@01
  1)))
(pop) ; 12
; Joined path conditions
(assert (and
  (<= 0 (- _0_quant_0@164@01 1))
  (<
    (- _0_quant_0@164@01 1)
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@150@01 ret@121@01)))
  (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@150@01 ret@121@01) (-
    _0_quant_0@164@01
    1))))
; [eval] m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l16](_12.val_ref)), _0_quant_0)
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l16](_12.val_ref))
; [eval] old[l16](_12.val_ref)
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
; 0.00s
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
; [eval] 0 <= _2
; [eval] _2 < m_List$$len__$TY$__Snap$struct$m_List$$int$(_1)
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(_1)
(push) ; 13
(pop) ; 13
; Joined path conditions
; [eval] 0 <= _2
(assert (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@160@01 ret@121@01) _0_quant_0@164@01))
(pop) ; 12
; Joined path conditions
(assert (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@160@01 ret@121@01) _0_quant_0@164@01))
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (=>
  (<
    _0_quant_0@164@01
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@160@01 ret@121@01)))
  (and
    (<
      _0_quant_0@164@01
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@160@01 ret@121@01)))
    (<= 0 (- _0_quant_0@164@01 1))
    (<
      (- _0_quant_0@164@01 1)
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@150@01 ret@121@01)))
    (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
      $Snap.unit
      ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@150@01 ret@121@01) (-
      _0_quant_0@164@01
      1))
    (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
      $Snap.unit
      ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@160@01 ret@121@01) _0_quant_0@164@01))))
(assert (or
  (<
    _0_quant_0@164@01
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@160@01 ret@121@01)))
  (not
    (<
      _0_quant_0@164@01
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@160@01 ret@121@01))))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 1 _0_quant_0@164@01)
  (and
    (<= 1 _0_quant_0@164@01)
    (=>
      (<
        _0_quant_0@164@01
        (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
          $Snap.unit
          $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@160@01 ret@121@01)))
      (and
        (<
          _0_quant_0@164@01
          (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
            $Snap.unit
            $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@160@01 ret@121@01)))
        (<= 0 (- _0_quant_0@164@01 1))
        (<
          (- _0_quant_0@164@01 1)
          (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
            $Snap.unit
            $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@150@01 ret@121@01)))
        (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@150@01 ret@121@01) (-
          _0_quant_0@164@01
          1))
        (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@160@01 ret@121@01) _0_quant_0@164@01)))
    (or
      (<
        _0_quant_0@164@01
        (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
          $Snap.unit
          $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@160@01 ret@121@01)))
      (not
        (<
          _0_quant_0@164@01
          (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
            $Snap.unit
            $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@160@01 ret@121@01))))))))
(assert (or (<= 1 _0_quant_0@164@01) (not (<= 1 _0_quant_0@164@01))))
(pop) ; 7
(push) ; 7
; [else-branch: 16 | !(0 <= _0_quant_0@164@01)]
(assert (not (<= 0 _0_quant_0@164@01)))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (=>
  (<= 0 _0_quant_0@164@01)
  (and
    (<= 0 _0_quant_0@164@01)
    (=>
      (<= 1 _0_quant_0@164@01)
      (and
        (<= 1 _0_quant_0@164@01)
        (=>
          (<
            _0_quant_0@164@01
            (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
              $Snap.unit
              $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@160@01 ret@121@01)))
          (and
            (<
              _0_quant_0@164@01
              (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                $Snap.unit
                $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@160@01 ret@121@01)))
            (<= 0 (- _0_quant_0@164@01 1))
            (<
              (- _0_quant_0@164@01 1)
              (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                $Snap.unit
                $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@150@01 ret@121@01)))
            (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@150@01 ret@121@01) (-
              _0_quant_0@164@01
              1))
            (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@160@01 ret@121@01) _0_quant_0@164@01)))
        (or
          (<
            _0_quant_0@164@01
            (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
              $Snap.unit
              $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@160@01 ret@121@01)))
          (not
            (<
              _0_quant_0@164@01
              (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                $Snap.unit
                $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@160@01 ret@121@01)))))))
    (or (<= 1 _0_quant_0@164@01) (not (<= 1 _0_quant_0@164@01))))))
; Joined path conditions
(assert (or (not (<= 0 _0_quant_0@164@01)) (<= 0 _0_quant_0@164@01)))
(pop) ; 5
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((_0_quant_0@164@01 Int)) (!
  (and
    (=>
      (<= 0 _0_quant_0@164@01)
      (and
        (<= 0 _0_quant_0@164@01)
        (=>
          (<= 1 _0_quant_0@164@01)
          (and
            (<= 1 _0_quant_0@164@01)
            (=>
              (<
                _0_quant_0@164@01
                (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                  $Snap.unit
                  $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@160@01 ret@121@01)))
              (and
                (<
                  _0_quant_0@164@01
                  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                    $Snap.unit
                    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@160@01 ret@121@01)))
                (<= 0 (- _0_quant_0@164@01 1))
                (<
                  (- _0_quant_0@164@01 1)
                  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                    $Snap.unit
                    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@150@01 ret@121@01)))
                (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@150@01 ret@121@01) (-
                  _0_quant_0@164@01
                  1))
                (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@160@01 ret@121@01) _0_quant_0@164@01)))
            (or
              (<
                _0_quant_0@164@01
                (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                  $Snap.unit
                  $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@160@01 ret@121@01)))
              (not
                (<
                  _0_quant_0@164@01
                  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                    $Snap.unit
                    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@160@01 ret@121@01)))))))
        (or (<= 1 _0_quant_0@164@01) (not (<= 1 _0_quant_0@164@01)))))
    (or (not (<= 0 _0_quant_0@164@01)) (<= 0 _0_quant_0@164@01)))
  :pattern ((m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%limited ($Snap.combine
    $Snap.unit
    ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@160@01 ret@121@01) _0_quant_0@164@01))
  :qid |prog.l1791-aux|)))
(assert (forall ((_0_quant_0@164@01 Int)) (!
  (=>
    (<= 0 _0_quant_0@164@01)
    (or
      (not (<= 1 _0_quant_0@164@01))
      (or
        (not
          (<
            _0_quant_0@164@01
            (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
              $Snap.unit
              $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@160@01 ret@121@01))))
        (=
          (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$ ($Snap.combine
            $Snap.unit
            ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@150@01 ret@121@01) (-
            _0_quant_0@164@01
            1))
          (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$ ($Snap.combine
            $Snap.unit
            ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@160@01 ret@121@01) _0_quant_0@164@01)))))
  :pattern ((m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%limited ($Snap.combine
    $Snap.unit
    ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@160@01 ret@121@01) _0_quant_0@164@01))
  :qid |prog.l1791|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; label l17
; [exec]
; __t7 := true
; [exec]
; _14 := builtin$havoc_ref()
(declare-const ret@165@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_14.val_ref, write)
(declare-const $t@166@01 $Ref)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@133@01 ret@165@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@165@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _14.val_ref := _1
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@133@01 ret@165@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [exec]
; label l19
; [exec]
; label l20
; [exec]
; _t78 := builtin$havoc_ref()
(declare-const ret@167@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(i32(_t78), write)
(declare-const $t@168@01 Int)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert true
; [exec]
; exhale acc(_14.val_ref, write) &&
;   (acc(struct$m_List(_14.val_ref), write) && acc(i32(_t78), write))
; [exec]
; _13 := builtin$havoc_ref()
(declare-const ret@169@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(struct$m_List(old[l20](_14.val_ref)), write)
; [eval] old[l20](_14.val_ref)
(declare-const $t@170@01 $Snap)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(tuple0$(_13), write)
(declare-const $t@171@01 $Snap)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@149@01 ret@169@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@159@01 ret@169@01)))
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
; inhale true
(declare-const $t@172@01 $Snap)
(assert (= $t@172@01 $Snap.unit))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l20](_14.val_ref))) ==
;   old[l20](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_14.val_ref))) +
;   1 &&
;   (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l20](_14.val_ref)),
;   0) ==
;   old[l20](3) &&
;   (forall _0_quant_0: Int ::
;     { m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l20](_14.val_ref)),
;     _0_quant_0) }
;     0 <= _0_quant_0 ==>
;     !(1 <= _0_quant_0) ||
;     (!(_0_quant_0 <
;     m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l20](_14.val_ref)))) ||
;     old[l20](m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_14.val_ref),
;     _0_quant_0 - 1)) ==
;     m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l20](_14.val_ref)),
;     _0_quant_0))))
(declare-const $t@173@01 $Snap)
(assert (= $t@173@01 ($Snap.combine ($Snap.first $t@173@01) ($Snap.second $t@173@01))))
(assert (= ($Snap.first $t@173@01) $Snap.unit))
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l20](_14.val_ref))) == old[l20](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_14.val_ref))) + 1
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l20](_14.val_ref)))
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l20](_14.val_ref))
; [eval] old[l20](_14.val_ref)
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
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
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
(assert (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%precondition $t@170@01 ret@121@01))
(pop) ; 5
; Joined path conditions
(assert (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%precondition $t@170@01 ret@121@01))
(set-option :timeout 0)
(push) ; 5
(assert (m_List$$len__$TY$__Snap$struct$m_List$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@170@01 ret@121@01)))
(pop) ; 5
; Joined path conditions
(assert (m_List$$len__$TY$__Snap$struct$m_List$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@170@01 ret@121@01)))
; [eval] old[l20](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_14.val_ref))) + 1
; [eval] old[l20](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_14.val_ref)))
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_14.val_ref))
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_14.val_ref)
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
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
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
(pop) ; 5
; Joined path conditions
(set-option :timeout 0)
(push) ; 5
(pop) ; 5
; Joined path conditions
(assert (=
  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@170@01 ret@121@01))
  (+
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@160@01 ret@121@01))
    1)))
(assert (=
  ($Snap.second $t@173@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@173@01))
    ($Snap.second ($Snap.second $t@173@01)))))
(assert (= ($Snap.first ($Snap.second $t@173@01)) $Snap.unit))
; [eval] m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l20](_14.val_ref)), 0) == old[l20](3)
; [eval] m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l20](_14.val_ref)), 0)
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l20](_14.val_ref))
; [eval] old[l20](_14.val_ref)
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
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
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
(pop) ; 5
; Joined path conditions
(set-option :timeout 0)
(push) ; 5
; [eval] 0 <= _2
; [eval] _2 < m_List$$len__$TY$__Snap$struct$m_List$$int$(_1)
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(_1)
(push) ; 6
(pop) ; 6
; Joined path conditions
(push) ; 6
(assert (not (<
  0
  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@170@01 ret@121@01)))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (<
  0
  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@170@01 ret@121@01))))
; [eval] 0 <= _2
(assert (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@170@01 ret@121@01) 0))
(pop) ; 5
; Joined path conditions
(assert (and
  (<
    0
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@170@01 ret@121@01)))
  (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@170@01 ret@121@01) 0)))
; [eval] old[l20](3)
(assert (=
  (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$ ($Snap.combine
    $Snap.unit
    ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@170@01 ret@121@01) 0)
  3))
(assert (= ($Snap.second ($Snap.second $t@173@01)) $Snap.unit))
; [eval] (forall _0_quant_0: Int :: { m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l20](_14.val_ref)), _0_quant_0) } 0 <= _0_quant_0 ==> !(1 <= _0_quant_0) || (!(_0_quant_0 < m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l20](_14.val_ref)))) || old[l20](m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_14.val_ref), _0_quant_0 - 1)) == m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l20](_14.val_ref)), _0_quant_0)))
(declare-const _0_quant_0@174@01 Int)
(push) ; 5
; [eval] 0 <= _0_quant_0 ==> !(1 <= _0_quant_0) || (!(_0_quant_0 < m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l20](_14.val_ref)))) || old[l20](m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_14.val_ref), _0_quant_0 - 1)) == m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l20](_14.val_ref)), _0_quant_0))
; [eval] 0 <= _0_quant_0
(push) ; 6
; [then-branch: 19 | 0 <= _0_quant_0@174@01 | live]
; [else-branch: 19 | !(0 <= _0_quant_0@174@01) | live]
(push) ; 7
; [then-branch: 19 | 0 <= _0_quant_0@174@01]
(assert (<= 0 _0_quant_0@174@01))
; [eval] !(1 <= _0_quant_0) || (!(_0_quant_0 < m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l20](_14.val_ref)))) || old[l20](m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_14.val_ref), _0_quant_0 - 1)) == m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l20](_14.val_ref)), _0_quant_0))
; [eval] !(1 <= _0_quant_0)
; [eval] 1 <= _0_quant_0
(push) ; 8
; [then-branch: 20 | !(1 <= _0_quant_0@174@01) | live]
; [else-branch: 20 | 1 <= _0_quant_0@174@01 | live]
(push) ; 9
; [then-branch: 20 | !(1 <= _0_quant_0@174@01)]
(assert (not (<= 1 _0_quant_0@174@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 20 | 1 <= _0_quant_0@174@01]
(assert (<= 1 _0_quant_0@174@01))
; [eval] !(_0_quant_0 < m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l20](_14.val_ref))))
; [eval] _0_quant_0 < m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l20](_14.val_ref)))
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l20](_14.val_ref)))
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l20](_14.val_ref))
; [eval] old[l20](_14.val_ref)
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
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
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
(pop) ; 10
; Joined path conditions
(set-option :timeout 0)
(push) ; 10
(pop) ; 10
; Joined path conditions
(push) ; 10
; [then-branch: 21 | !(_0_quant_0@174@01 < m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@170@01, ret@121@01))) | live]
; [else-branch: 21 | _0_quant_0@174@01 < m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@170@01, ret@121@01)) | live]
(push) ; 11
; [then-branch: 21 | !(_0_quant_0@174@01 < m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@170@01, ret@121@01)))]
(assert (not
  (<
    _0_quant_0@174@01
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@170@01 ret@121@01)))))
(pop) ; 11
(push) ; 11
; [else-branch: 21 | _0_quant_0@174@01 < m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@170@01, ret@121@01))]
(assert (<
  _0_quant_0@174@01
  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@170@01 ret@121@01))))
; [eval] old[l20](m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_14.val_ref), _0_quant_0 - 1)) == m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l20](_14.val_ref)), _0_quant_0)
; [eval] old[l20](m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_14.val_ref), _0_quant_0 - 1))
; [eval] m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_14.val_ref), _0_quant_0 - 1)
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_14.val_ref)
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
; 0.00s
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
; [eval] _0_quant_0 - 1
(set-option :timeout 0)
(push) ; 12
; [eval] 0 <= _2
(push) ; 13
(assert (not (<= 0 (- _0_quant_0@174@01 1))))
(check-sat)
; unsat
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(assert (<= 0 (- _0_quant_0@174@01 1)))
; [eval] _2 < m_List$$len__$TY$__Snap$struct$m_List$$int$(_1)
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(_1)
(push) ; 13
(pop) ; 13
; Joined path conditions
(push) ; 13
(assert (not (<
  (- _0_quant_0@174@01 1)
  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@160@01 ret@121@01)))))
(check-sat)
; unsat
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(assert (<
  (- _0_quant_0@174@01 1)
  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@160@01 ret@121@01))))
; [eval] 0 <= _2
(assert (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@160@01 ret@121@01) (-
  _0_quant_0@174@01
  1)))
(pop) ; 12
; Joined path conditions
(assert (and
  (<= 0 (- _0_quant_0@174@01 1))
  (<
    (- _0_quant_0@174@01 1)
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@160@01 ret@121@01)))
  (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@160@01 ret@121@01) (-
    _0_quant_0@174@01
    1))))
; [eval] m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l20](_14.val_ref)), _0_quant_0)
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l20](_14.val_ref))
; [eval] old[l20](_14.val_ref)
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
; 0.00s
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
; [eval] 0 <= _2
; [eval] _2 < m_List$$len__$TY$__Snap$struct$m_List$$int$(_1)
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(_1)
(push) ; 13
(pop) ; 13
; Joined path conditions
; [eval] 0 <= _2
(assert (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@170@01 ret@121@01) _0_quant_0@174@01))
(pop) ; 12
; Joined path conditions
(assert (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@170@01 ret@121@01) _0_quant_0@174@01))
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (=>
  (<
    _0_quant_0@174@01
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@170@01 ret@121@01)))
  (and
    (<
      _0_quant_0@174@01
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@170@01 ret@121@01)))
    (<= 0 (- _0_quant_0@174@01 1))
    (<
      (- _0_quant_0@174@01 1)
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@160@01 ret@121@01)))
    (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
      $Snap.unit
      ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@160@01 ret@121@01) (-
      _0_quant_0@174@01
      1))
    (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
      $Snap.unit
      ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@170@01 ret@121@01) _0_quant_0@174@01))))
(assert (or
  (<
    _0_quant_0@174@01
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@170@01 ret@121@01)))
  (not
    (<
      _0_quant_0@174@01
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@170@01 ret@121@01))))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 1 _0_quant_0@174@01)
  (and
    (<= 1 _0_quant_0@174@01)
    (=>
      (<
        _0_quant_0@174@01
        (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
          $Snap.unit
          $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@170@01 ret@121@01)))
      (and
        (<
          _0_quant_0@174@01
          (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
            $Snap.unit
            $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@170@01 ret@121@01)))
        (<= 0 (- _0_quant_0@174@01 1))
        (<
          (- _0_quant_0@174@01 1)
          (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
            $Snap.unit
            $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@160@01 ret@121@01)))
        (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@160@01 ret@121@01) (-
          _0_quant_0@174@01
          1))
        (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@170@01 ret@121@01) _0_quant_0@174@01)))
    (or
      (<
        _0_quant_0@174@01
        (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
          $Snap.unit
          $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@170@01 ret@121@01)))
      (not
        (<
          _0_quant_0@174@01
          (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
            $Snap.unit
            $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@170@01 ret@121@01))))))))
(assert (or (<= 1 _0_quant_0@174@01) (not (<= 1 _0_quant_0@174@01))))
(pop) ; 7
(push) ; 7
; [else-branch: 19 | !(0 <= _0_quant_0@174@01)]
(assert (not (<= 0 _0_quant_0@174@01)))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (=>
  (<= 0 _0_quant_0@174@01)
  (and
    (<= 0 _0_quant_0@174@01)
    (=>
      (<= 1 _0_quant_0@174@01)
      (and
        (<= 1 _0_quant_0@174@01)
        (=>
          (<
            _0_quant_0@174@01
            (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
              $Snap.unit
              $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@170@01 ret@121@01)))
          (and
            (<
              _0_quant_0@174@01
              (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                $Snap.unit
                $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@170@01 ret@121@01)))
            (<= 0 (- _0_quant_0@174@01 1))
            (<
              (- _0_quant_0@174@01 1)
              (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                $Snap.unit
                $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@160@01 ret@121@01)))
            (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@160@01 ret@121@01) (-
              _0_quant_0@174@01
              1))
            (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@170@01 ret@121@01) _0_quant_0@174@01)))
        (or
          (<
            _0_quant_0@174@01
            (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
              $Snap.unit
              $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@170@01 ret@121@01)))
          (not
            (<
              _0_quant_0@174@01
              (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                $Snap.unit
                $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@170@01 ret@121@01)))))))
    (or (<= 1 _0_quant_0@174@01) (not (<= 1 _0_quant_0@174@01))))))
; Joined path conditions
(assert (or (not (<= 0 _0_quant_0@174@01)) (<= 0 _0_quant_0@174@01)))
(pop) ; 5
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((_0_quant_0@174@01 Int)) (!
  (and
    (=>
      (<= 0 _0_quant_0@174@01)
      (and
        (<= 0 _0_quant_0@174@01)
        (=>
          (<= 1 _0_quant_0@174@01)
          (and
            (<= 1 _0_quant_0@174@01)
            (=>
              (<
                _0_quant_0@174@01
                (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                  $Snap.unit
                  $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@170@01 ret@121@01)))
              (and
                (<
                  _0_quant_0@174@01
                  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                    $Snap.unit
                    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@170@01 ret@121@01)))
                (<= 0 (- _0_quant_0@174@01 1))
                (<
                  (- _0_quant_0@174@01 1)
                  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                    $Snap.unit
                    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@160@01 ret@121@01)))
                (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@160@01 ret@121@01) (-
                  _0_quant_0@174@01
                  1))
                (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@170@01 ret@121@01) _0_quant_0@174@01)))
            (or
              (<
                _0_quant_0@174@01
                (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                  $Snap.unit
                  $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@170@01 ret@121@01)))
              (not
                (<
                  _0_quant_0@174@01
                  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                    $Snap.unit
                    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@170@01 ret@121@01)))))))
        (or (<= 1 _0_quant_0@174@01) (not (<= 1 _0_quant_0@174@01)))))
    (or (not (<= 0 _0_quant_0@174@01)) (<= 0 _0_quant_0@174@01)))
  :pattern ((m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%limited ($Snap.combine
    $Snap.unit
    ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@170@01 ret@121@01) _0_quant_0@174@01))
  :qid |prog.l1833-aux|)))
(assert (forall ((_0_quant_0@174@01 Int)) (!
  (=>
    (<= 0 _0_quant_0@174@01)
    (or
      (not (<= 1 _0_quant_0@174@01))
      (or
        (not
          (<
            _0_quant_0@174@01
            (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
              $Snap.unit
              $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@170@01 ret@121@01))))
        (=
          (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$ ($Snap.combine
            $Snap.unit
            ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@160@01 ret@121@01) (-
            _0_quant_0@174@01
            1))
          (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$ ($Snap.combine
            $Snap.unit
            ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@170@01 ret@121@01) _0_quant_0@174@01)))))
  :pattern ((m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%limited ($Snap.combine
    $Snap.unit
    ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@170@01 ret@121@01) _0_quant_0@174@01))
  :qid |prog.l1833|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; label l21
; [exec]
; __t8 := true
; [exec]
; _17 := builtin$havoc_ref()
(declare-const ret@175@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_17.val_ref, write)
(declare-const $t@176@01 $Ref)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@133@01 ret@175@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@175@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _17.val_ref := _1
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@133@01 ret@175@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [exec]
; label l23
; [exec]
; label l24
; [exec]
; assert true
; [exec]
; exhale acc(_17.val_ref, write) && acc(struct$m_List(_17.val_ref), write)
; [exec]
; _16 := builtin$havoc_ref()
(declare-const ret@177@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(struct$m_List(old[l24](_17.val_ref)), write)
; [eval] old[l24](_17.val_ref)
(declare-const $t@178@01 $Snap)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(m_TrustedOption$_beg_$_end_(_16), write)
(declare-const $t@179@01 $Snap)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@127@01 ret@177@01)))
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
; inhale true
(declare-const $t@180@01 $Snap)
(assert (= $t@180@01 $Snap.unit))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale (!(old[l24](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_17.val_ref))) ==
;   0) ||
;   m_TrustedOption$$is_none__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$(snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_(_16))) &&
;   ((!(old[l24](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_17.val_ref))) ==
;   0) ||
;   m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l24](_17.val_ref))) ==
;   0) &&
;   ((!(old[l24](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_17.val_ref))) >
;   0) ||
;   m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$(snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_(_16))) &&
;   ((!(old[l24](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_17.val_ref))) >
;   0) ||
;   m_TrustedOption$$peek__$TY$__Snap$m_TrustedOption$_beg_$_end_$$int$(snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_(_16)) ==
;   old[l24](m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_17.val_ref),
;   0))) &&
;   ((!(old[l24](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_17.val_ref))) >
;   0) ||
;   m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l24](_17.val_ref))) ==
;   old[l24](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_17.val_ref)) -
;   1)) &&
;   (!(old[l24](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_17.val_ref))) >
;   0) ||
;   (forall _0_quant_0: Int ::
;     { m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l24](_17.val_ref)),
;     _0_quant_0) }
;     0 <= _0_quant_0 ==>
;     !(0 <= _0_quant_0) ||
;     (!(_0_quant_0 <
;     m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l24](_17.val_ref)))) ||
;     old[l24](m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_17.val_ref),
;     _0_quant_0 + 1)) ==
;     m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l24](_17.val_ref)),
;     _0_quant_0))))))))
(declare-const $t@181@01 $Snap)
(assert (= $t@181@01 ($Snap.combine ($Snap.first $t@181@01) ($Snap.second $t@181@01))))
(assert (= ($Snap.first $t@181@01) $Snap.unit))
; [eval] !(old[l24](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_17.val_ref))) == 0) || m_TrustedOption$$is_none__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$(snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_(_16))
; [eval] !(old[l24](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_17.val_ref))) == 0)
; [eval] old[l24](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_17.val_ref))) == 0
; [eval] old[l24](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_17.val_ref)))
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_17.val_ref))
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_17.val_ref)
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
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
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
(pop) ; 5
; Joined path conditions
(set-option :timeout 0)
(push) ; 5
(pop) ; 5
; Joined path conditions
(push) ; 5
; [then-branch: 22 | m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@170@01, ret@121@01)) != 0 | live]
; [else-branch: 22 | m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@170@01, ret@121@01)) == 0 | live]
(push) ; 6
; [then-branch: 22 | m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@170@01, ret@121@01)) != 0]
(assert (not
  (=
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@170@01 ret@121@01))
    0)))
(pop) ; 6
(push) ; 6
; [else-branch: 22 | m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@170@01, ret@121@01)) == 0]
(assert (=
  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@170@01 ret@121@01))
  0))
; [eval] m_TrustedOption$$is_none__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$(snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_(_16))
; [eval] snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_(_16)
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
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
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
(assert (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_%precondition $t@179@01 ret@177@01))
(pop) ; 7
; Joined path conditions
(assert (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_%precondition $t@179@01 ret@177@01))
(set-option :timeout 0)
(push) ; 7
(assert (m_TrustedOption$$is_none__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@179@01 ret@177@01)))
(pop) ; 7
; Joined path conditions
(assert (m_TrustedOption$$is_none__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@179@01 ret@177@01)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (=
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@170@01 ret@121@01))
    0)
  (and
    (=
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@170@01 ret@121@01))
      0)
    (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_%precondition $t@179@01 ret@177@01)
    (m_TrustedOption$$is_none__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$%precondition ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@179@01 ret@177@01)))))
(assert (or
  (=
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@170@01 ret@121@01))
    0)
  (not
    (=
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@170@01 ret@121@01))
      0))))
(assert (or
  (not
    (=
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@170@01 ret@121@01))
      0))
  (m_TrustedOption$$is_none__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@179@01 ret@177@01))))
(assert (=
  ($Snap.second $t@181@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@181@01))
    ($Snap.second ($Snap.second $t@181@01)))))
(assert (= ($Snap.first ($Snap.second $t@181@01)) $Snap.unit))
; [eval] !(old[l24](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_17.val_ref))) == 0) || m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l24](_17.val_ref))) == 0
; [eval] !(old[l24](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_17.val_ref))) == 0)
; [eval] old[l24](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_17.val_ref))) == 0
; [eval] old[l24](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_17.val_ref)))
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_17.val_ref))
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_17.val_ref)
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
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
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
(pop) ; 5
; Joined path conditions
(set-option :timeout 0)
(push) ; 5
(pop) ; 5
; Joined path conditions
(push) ; 5
; [then-branch: 23 | m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@170@01, ret@121@01)) != 0 | live]
; [else-branch: 23 | m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@170@01, ret@121@01)) == 0 | live]
(push) ; 6
; [then-branch: 23 | m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@170@01, ret@121@01)) != 0]
(assert (not
  (=
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@170@01 ret@121@01))
    0)))
(pop) ; 6
(push) ; 6
; [else-branch: 23 | m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@170@01, ret@121@01)) == 0]
(assert (=
  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@170@01 ret@121@01))
  0))
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l24](_17.val_ref))) == 0
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l24](_17.val_ref)))
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l24](_17.val_ref))
; [eval] old[l24](_17.val_ref)
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
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
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
(assert (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%precondition $t@178@01 ret@121@01))
(pop) ; 7
; Joined path conditions
(assert (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%precondition $t@178@01 ret@121@01))
(set-option :timeout 0)
(push) ; 7
(assert (m_List$$len__$TY$__Snap$struct$m_List$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@178@01 ret@121@01)))
(pop) ; 7
; Joined path conditions
(assert (m_List$$len__$TY$__Snap$struct$m_List$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@178@01 ret@121@01)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (=
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@170@01 ret@121@01))
    0)
  (and
    (=
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@170@01 ret@121@01))
      0)
    (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%precondition $t@178@01 ret@121@01)
    (m_List$$len__$TY$__Snap$struct$m_List$$int$%precondition ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@178@01 ret@121@01)))))
(assert (or
  (not
    (=
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@170@01 ret@121@01))
      0))
  (=
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@178@01 ret@121@01))
    0)))
(assert (=
  ($Snap.second ($Snap.second $t@181@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@181@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@181@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@181@01))) $Snap.unit))
; [eval] !(old[l24](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_17.val_ref))) > 0) || m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$(snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_(_16))
; [eval] !(old[l24](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_17.val_ref))) > 0)
; [eval] old[l24](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_17.val_ref))) > 0
; [eval] old[l24](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_17.val_ref)))
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_17.val_ref))
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_17.val_ref)
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
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
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
(pop) ; 5
; Joined path conditions
(set-option :timeout 0)
(push) ; 5
(pop) ; 5
; Joined path conditions
(push) ; 5
; [then-branch: 24 | !(m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@170@01, ret@121@01)) > 0) | live]
; [else-branch: 24 | m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@170@01, ret@121@01)) > 0 | live]
(push) ; 6
; [then-branch: 24 | !(m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@170@01, ret@121@01)) > 0)]
(assert (not
  (>
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@170@01 ret@121@01))
    0)))
(pop) ; 6
(push) ; 6
; [else-branch: 24 | m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@170@01, ret@121@01)) > 0]
(assert (>
  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@170@01 ret@121@01))
  0))
; [eval] m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$(snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_(_16))
; [eval] snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_(_16)
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
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
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
(assert (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_%precondition $t@179@01 ret@177@01))
(pop) ; 7
; Joined path conditions
(assert (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_%precondition $t@179@01 ret@177@01))
(set-option :timeout 0)
(push) ; 7
(assert (m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@179@01 ret@177@01)))
(pop) ; 7
; Joined path conditions
(assert (m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@179@01 ret@177@01)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (>
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@170@01 ret@121@01))
    0)
  (and
    (>
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@170@01 ret@121@01))
      0)
    (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_%precondition $t@179@01 ret@177@01)
    (m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$%precondition ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@179@01 ret@177@01)))))
(assert (or
  (>
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@170@01 ret@121@01))
    0)
  (not
    (>
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@170@01 ret@121@01))
      0))))
(assert (or
  (not
    (>
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@170@01 ret@121@01))
      0))
  (m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@179@01 ret@177@01))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@181@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@181@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@181@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@181@01))))
  $Snap.unit))
; [eval] !(old[l24](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_17.val_ref))) > 0) || m_TrustedOption$$peek__$TY$__Snap$m_TrustedOption$_beg_$_end_$$int$(snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_(_16)) == old[l24](m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_17.val_ref), 0))
; [eval] !(old[l24](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_17.val_ref))) > 0)
; [eval] old[l24](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_17.val_ref))) > 0
; [eval] old[l24](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_17.val_ref)))
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_17.val_ref))
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_17.val_ref)
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
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
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
(pop) ; 5
; Joined path conditions
(set-option :timeout 0)
(push) ; 5
(pop) ; 5
; Joined path conditions
(push) ; 5
; [then-branch: 25 | !(m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@170@01, ret@121@01)) > 0) | live]
; [else-branch: 25 | m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@170@01, ret@121@01)) > 0 | live]
(push) ; 6
; [then-branch: 25 | !(m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@170@01, ret@121@01)) > 0)]
(assert (not
  (>
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@170@01 ret@121@01))
    0)))
(pop) ; 6
(push) ; 6
; [else-branch: 25 | m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@170@01, ret@121@01)) > 0]
(assert (>
  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@170@01 ret@121@01))
  0))
; [eval] m_TrustedOption$$peek__$TY$__Snap$m_TrustedOption$_beg_$_end_$$int$(snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_(_16)) == old[l24](m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_17.val_ref), 0))
; [eval] m_TrustedOption$$peek__$TY$__Snap$m_TrustedOption$_beg_$_end_$$int$(snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_(_16))
; [eval] snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_(_16)
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
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
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
(assert (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_%precondition $t@179@01 ret@177@01))
(pop) ; 7
; Joined path conditions
(assert (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_%precondition $t@179@01 ret@177@01))
(set-option :timeout 0)
(push) ; 7
; [eval] m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$(_1)
(push) ; 8
(assert (m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@179@01 ret@177@01)))
(pop) ; 8
; Joined path conditions
(assert (m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@179@01 ret@177@01)))
(push) ; 8
(assert (not (m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$ ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@179@01 ret@177@01))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$ ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@179@01 ret@177@01)))
(assert (m_TrustedOption$$peek__$TY$__Snap$m_TrustedOption$_beg_$_end_$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@179@01 ret@177@01)))
(pop) ; 7
; Joined path conditions
(assert (and
  (m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$%precondition ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@179@01 ret@177@01))
  (m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@179@01 ret@177@01))
  (m_TrustedOption$$peek__$TY$__Snap$m_TrustedOption$_beg_$_end_$$int$%precondition ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@179@01 ret@177@01))))
; [eval] old[l24](m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_17.val_ref), 0))
; [eval] m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_17.val_ref), 0)
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_17.val_ref)
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
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
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
; [eval] 0 <= _2
; [eval] _2 < m_List$$len__$TY$__Snap$struct$m_List$$int$(_1)
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(_1)
(push) ; 8
(pop) ; 8
; Joined path conditions
; [eval] 0 <= _2
(pop) ; 7
; Joined path conditions
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (>
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@170@01 ret@121@01))
    0)
  (and
    (>
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@170@01 ret@121@01))
      0)
    (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_%precondition $t@179@01 ret@177@01)
    (m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$%precondition ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@179@01 ret@177@01))
    (m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@179@01 ret@177@01))
    (m_TrustedOption$$peek__$TY$__Snap$m_TrustedOption$_beg_$_end_$$int$%precondition ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@179@01 ret@177@01)))))
(assert (or
  (not
    (>
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@170@01 ret@121@01))
      0))
  (=
    (m_TrustedOption$$peek__$TY$__Snap$m_TrustedOption$_beg_$_end_$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@179@01 ret@177@01))
    (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$ ($Snap.combine
      $Snap.unit
      ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@170@01 ret@121@01) 0))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@181@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@181@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@181@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@181@01)))))
  $Snap.unit))
; [eval] !(old[l24](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_17.val_ref))) > 0) || m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l24](_17.val_ref))) == old[l24](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_17.val_ref)) - 1)
; [eval] !(old[l24](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_17.val_ref))) > 0)
; [eval] old[l24](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_17.val_ref))) > 0
; [eval] old[l24](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_17.val_ref)))
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_17.val_ref))
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_17.val_ref)
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
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
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
(pop) ; 5
; Joined path conditions
(set-option :timeout 0)
(push) ; 5
(pop) ; 5
; Joined path conditions
(push) ; 5
; [then-branch: 26 | !(m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@170@01, ret@121@01)) > 0) | live]
; [else-branch: 26 | m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@170@01, ret@121@01)) > 0 | live]
(push) ; 6
; [then-branch: 26 | !(m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@170@01, ret@121@01)) > 0)]
(assert (not
  (>
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@170@01 ret@121@01))
    0)))
(pop) ; 6
(push) ; 6
; [else-branch: 26 | m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@170@01, ret@121@01)) > 0]
(assert (>
  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@170@01 ret@121@01))
  0))
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l24](_17.val_ref))) == old[l24](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_17.val_ref)) - 1)
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l24](_17.val_ref)))
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l24](_17.val_ref))
; [eval] old[l24](_17.val_ref)
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
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
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
(assert (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%precondition $t@178@01 ret@121@01))
(pop) ; 7
; Joined path conditions
(assert (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%precondition $t@178@01 ret@121@01))
(set-option :timeout 0)
(push) ; 7
(assert (m_List$$len__$TY$__Snap$struct$m_List$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@178@01 ret@121@01)))
(pop) ; 7
; Joined path conditions
(assert (m_List$$len__$TY$__Snap$struct$m_List$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@178@01 ret@121@01)))
; [eval] old[l24](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_17.val_ref)) - 1)
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_17.val_ref)) - 1
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_17.val_ref))
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_17.val_ref)
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
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
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
(pop) ; 7
; Joined path conditions
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (>
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@170@01 ret@121@01))
    0)
  (and
    (>
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@170@01 ret@121@01))
      0)
    (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%precondition $t@178@01 ret@121@01)
    (m_List$$len__$TY$__Snap$struct$m_List$$int$%precondition ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@178@01 ret@121@01)))))
(assert (or
  (not
    (>
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@170@01 ret@121@01))
      0))
  (=
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@178@01 ret@121@01))
    (-
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@170@01 ret@121@01))
      1))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@181@01)))))
  $Snap.unit))
; [eval] !(old[l24](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_17.val_ref))) > 0) || (forall _0_quant_0: Int :: { m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l24](_17.val_ref)), _0_quant_0) } 0 <= _0_quant_0 ==> !(0 <= _0_quant_0) || (!(_0_quant_0 < m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l24](_17.val_ref)))) || old[l24](m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_17.val_ref), _0_quant_0 + 1)) == m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l24](_17.val_ref)), _0_quant_0)))
; [eval] !(old[l24](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_17.val_ref))) > 0)
; [eval] old[l24](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_17.val_ref))) > 0
; [eval] old[l24](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_17.val_ref)))
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_17.val_ref))
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_17.val_ref)
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
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
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
(pop) ; 5
; Joined path conditions
(set-option :timeout 0)
(push) ; 5
(pop) ; 5
; Joined path conditions
(push) ; 5
; [then-branch: 27 | !(m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@170@01, ret@121@01)) > 0) | live]
; [else-branch: 27 | m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@170@01, ret@121@01)) > 0 | live]
(push) ; 6
; [then-branch: 27 | !(m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@170@01, ret@121@01)) > 0)]
(assert (not
  (>
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@170@01 ret@121@01))
    0)))
(pop) ; 6
(push) ; 6
; [else-branch: 27 | m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@170@01, ret@121@01)) > 0]
(assert (>
  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@170@01 ret@121@01))
  0))
; [eval] (forall _0_quant_0: Int :: { m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l24](_17.val_ref)), _0_quant_0) } 0 <= _0_quant_0 ==> !(0 <= _0_quant_0) || (!(_0_quant_0 < m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l24](_17.val_ref)))) || old[l24](m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_17.val_ref), _0_quant_0 + 1)) == m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l24](_17.val_ref)), _0_quant_0)))
(declare-const _0_quant_0@182@01 Int)
(push) ; 7
; [eval] 0 <= _0_quant_0 ==> !(0 <= _0_quant_0) || (!(_0_quant_0 < m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l24](_17.val_ref)))) || old[l24](m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_17.val_ref), _0_quant_0 + 1)) == m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l24](_17.val_ref)), _0_quant_0))
; [eval] 0 <= _0_quant_0
(push) ; 8
; [then-branch: 28 | 0 <= _0_quant_0@182@01 | live]
; [else-branch: 28 | !(0 <= _0_quant_0@182@01) | live]
(push) ; 9
; [then-branch: 28 | 0 <= _0_quant_0@182@01]
(assert (<= 0 _0_quant_0@182@01))
; [eval] !(0 <= _0_quant_0) || (!(_0_quant_0 < m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l24](_17.val_ref)))) || old[l24](m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_17.val_ref), _0_quant_0 + 1)) == m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l24](_17.val_ref)), _0_quant_0))
; [eval] !(0 <= _0_quant_0)
; [eval] 0 <= _0_quant_0
(push) ; 10
; [then-branch: 29 | !(0 <= _0_quant_0@182@01) | live]
; [else-branch: 29 | 0 <= _0_quant_0@182@01 | live]
(push) ; 11
; [then-branch: 29 | !(0 <= _0_quant_0@182@01)]
(assert (not (<= 0 _0_quant_0@182@01)))
(pop) ; 11
(push) ; 11
; [else-branch: 29 | 0 <= _0_quant_0@182@01]
; [eval] !(_0_quant_0 < m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l24](_17.val_ref))))
; [eval] _0_quant_0 < m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l24](_17.val_ref)))
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l24](_17.val_ref)))
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l24](_17.val_ref))
; [eval] old[l24](_17.val_ref)
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
; 0.00s
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
(assert (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%precondition $t@178@01 ret@121@01))
(pop) ; 12
; Joined path conditions
(assert (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%precondition $t@178@01 ret@121@01))
(set-option :timeout 0)
(push) ; 12
(assert (m_List$$len__$TY$__Snap$struct$m_List$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@178@01 ret@121@01)))
(pop) ; 12
; Joined path conditions
(assert (m_List$$len__$TY$__Snap$struct$m_List$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@178@01 ret@121@01)))
(push) ; 12
; [then-branch: 30 | !(_0_quant_0@182@01 < m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@178@01, ret@121@01))) | live]
; [else-branch: 30 | _0_quant_0@182@01 < m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@178@01, ret@121@01)) | live]
(push) ; 13
; [then-branch: 30 | !(_0_quant_0@182@01 < m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@178@01, ret@121@01)))]
(assert (not
  (<
    _0_quant_0@182@01
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@178@01 ret@121@01)))))
(pop) ; 13
(push) ; 13
; [else-branch: 30 | _0_quant_0@182@01 < m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@178@01, ret@121@01))]
(assert (<
  _0_quant_0@182@01
  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@178@01 ret@121@01))))
; [eval] old[l24](m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_17.val_ref), _0_quant_0 + 1)) == m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l24](_17.val_ref)), _0_quant_0)
; [eval] old[l24](m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_17.val_ref), _0_quant_0 + 1))
; [eval] m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_17.val_ref), _0_quant_0 + 1)
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_17.val_ref)
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
; 0.00s
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
; [eval] _0_quant_0 + 1
(set-option :timeout 0)
(push) ; 14
; [eval] 0 <= _2
(push) ; 15
(assert (not (<= 0 (+ _0_quant_0@182@01 1))))
(check-sat)
; unsat
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(assert (<= 0 (+ _0_quant_0@182@01 1)))
; [eval] _2 < m_List$$len__$TY$__Snap$struct$m_List$$int$(_1)
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(_1)
(push) ; 15
(pop) ; 15
; Joined path conditions
(push) ; 15
(assert (not (<
  (+ _0_quant_0@182@01 1)
  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@170@01 ret@121@01)))))
(check-sat)
; unsat
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(assert (<
  (+ _0_quant_0@182@01 1)
  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@170@01 ret@121@01))))
; [eval] 0 <= _2
(assert (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@170@01 ret@121@01) (+
  _0_quant_0@182@01
  1)))
(pop) ; 14
; Joined path conditions
(assert (and
  (<= 0 (+ _0_quant_0@182@01 1))
  (<
    (+ _0_quant_0@182@01 1)
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@170@01 ret@121@01)))
  (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@170@01 ret@121@01) (+
    _0_quant_0@182@01
    1))))
; [eval] m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l24](_17.val_ref)), _0_quant_0)
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l24](_17.val_ref))
; [eval] old[l24](_17.val_ref)
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
; 0.00s
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
(set-option :timeout 0)
(push) ; 14
; [eval] 0 <= _2
; [eval] _2 < m_List$$len__$TY$__Snap$struct$m_List$$int$(_1)
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(_1)
(push) ; 15
(pop) ; 15
; Joined path conditions
; [eval] 0 <= _2
(assert (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@178@01 ret@121@01) _0_quant_0@182@01))
(pop) ; 14
; Joined path conditions
(assert (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@178@01 ret@121@01) _0_quant_0@182@01))
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(assert (=>
  (<
    _0_quant_0@182@01
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@178@01 ret@121@01)))
  (and
    (<
      _0_quant_0@182@01
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@178@01 ret@121@01)))
    (<= 0 (+ _0_quant_0@182@01 1))
    (<
      (+ _0_quant_0@182@01 1)
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@170@01 ret@121@01)))
    (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
      $Snap.unit
      ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@170@01 ret@121@01) (+
      _0_quant_0@182@01
      1))
    (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
      $Snap.unit
      ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@178@01 ret@121@01) _0_quant_0@182@01))))
(assert (or
  (<
    _0_quant_0@182@01
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@178@01 ret@121@01)))
  (not
    (<
      _0_quant_0@182@01
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@178@01 ret@121@01))))))
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 _0_quant_0@182@01)
  (and
    (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%precondition $t@178@01 ret@121@01)
    (m_List$$len__$TY$__Snap$struct$m_List$$int$%precondition ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@178@01 ret@121@01))
    (=>
      (<
        _0_quant_0@182@01
        (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
          $Snap.unit
          $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@178@01 ret@121@01)))
      (and
        (<
          _0_quant_0@182@01
          (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
            $Snap.unit
            $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@178@01 ret@121@01)))
        (<= 0 (+ _0_quant_0@182@01 1))
        (<
          (+ _0_quant_0@182@01 1)
          (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
            $Snap.unit
            $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@170@01 ret@121@01)))
        (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@170@01 ret@121@01) (+
          _0_quant_0@182@01
          1))
        (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@178@01 ret@121@01) _0_quant_0@182@01)))
    (or
      (<
        _0_quant_0@182@01
        (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
          $Snap.unit
          $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@178@01 ret@121@01)))
      (not
        (<
          _0_quant_0@182@01
          (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
            $Snap.unit
            $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@178@01 ret@121@01))))))))
(assert (or (<= 0 _0_quant_0@182@01) (not (<= 0 _0_quant_0@182@01))))
(pop) ; 9
(push) ; 9
; [else-branch: 28 | !(0 <= _0_quant_0@182@01)]
(assert (not (<= 0 _0_quant_0@182@01)))
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (=>
  (<= 0 _0_quant_0@182@01)
  (and
    (<= 0 _0_quant_0@182@01)
    (=>
      (<= 0 _0_quant_0@182@01)
      (and
        (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%precondition $t@178@01 ret@121@01)
        (m_List$$len__$TY$__Snap$struct$m_List$$int$%precondition ($Snap.combine
          $Snap.unit
          $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@178@01 ret@121@01))
        (=>
          (<
            _0_quant_0@182@01
            (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
              $Snap.unit
              $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@178@01 ret@121@01)))
          (and
            (<
              _0_quant_0@182@01
              (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                $Snap.unit
                $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@178@01 ret@121@01)))
            (<= 0 (+ _0_quant_0@182@01 1))
            (<
              (+ _0_quant_0@182@01 1)
              (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                $Snap.unit
                $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@170@01 ret@121@01)))
            (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@170@01 ret@121@01) (+
              _0_quant_0@182@01
              1))
            (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@178@01 ret@121@01) _0_quant_0@182@01)))
        (or
          (<
            _0_quant_0@182@01
            (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
              $Snap.unit
              $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@178@01 ret@121@01)))
          (not
            (<
              _0_quant_0@182@01
              (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                $Snap.unit
                $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@178@01 ret@121@01)))))))
    (or (<= 0 _0_quant_0@182@01) (not (<= 0 _0_quant_0@182@01))))))
; Joined path conditions
(assert (or (not (<= 0 _0_quant_0@182@01)) (<= 0 _0_quant_0@182@01)))
(pop) ; 7
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((_0_quant_0@182@01 Int)) (!
  (and
    (=>
      (<= 0 _0_quant_0@182@01)
      (and
        (<= 0 _0_quant_0@182@01)
        (=>
          (<= 0 _0_quant_0@182@01)
          (and
            (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%precondition $t@178@01 ret@121@01)
            (m_List$$len__$TY$__Snap$struct$m_List$$int$%precondition ($Snap.combine
              $Snap.unit
              $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@178@01 ret@121@01))
            (=>
              (<
                _0_quant_0@182@01
                (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                  $Snap.unit
                  $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@178@01 ret@121@01)))
              (and
                (<
                  _0_quant_0@182@01
                  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                    $Snap.unit
                    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@178@01 ret@121@01)))
                (<= 0 (+ _0_quant_0@182@01 1))
                (<
                  (+ _0_quant_0@182@01 1)
                  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                    $Snap.unit
                    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@170@01 ret@121@01)))
                (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@170@01 ret@121@01) (+
                  _0_quant_0@182@01
                  1))
                (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@178@01 ret@121@01) _0_quant_0@182@01)))
            (or
              (<
                _0_quant_0@182@01
                (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                  $Snap.unit
                  $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@178@01 ret@121@01)))
              (not
                (<
                  _0_quant_0@182@01
                  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                    $Snap.unit
                    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@178@01 ret@121@01)))))))
        (or (<= 0 _0_quant_0@182@01) (not (<= 0 _0_quant_0@182@01)))))
    (or (not (<= 0 _0_quant_0@182@01)) (<= 0 _0_quant_0@182@01)))
  :pattern ((m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%limited ($Snap.combine
    $Snap.unit
    ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@178@01 ret@121@01) _0_quant_0@182@01))
  :qid |prog.l1889-aux|)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (>
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@170@01 ret@121@01))
    0)
  (and
    (>
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@170@01 ret@121@01))
      0)
    (forall ((_0_quant_0@182@01 Int)) (!
      (and
        (=>
          (<= 0 _0_quant_0@182@01)
          (and
            (<= 0 _0_quant_0@182@01)
            (=>
              (<= 0 _0_quant_0@182@01)
              (and
                (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%precondition $t@178@01 ret@121@01)
                (m_List$$len__$TY$__Snap$struct$m_List$$int$%precondition ($Snap.combine
                  $Snap.unit
                  $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@178@01 ret@121@01))
                (=>
                  (<
                    _0_quant_0@182@01
                    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                      $Snap.unit
                      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@178@01 ret@121@01)))
                  (and
                    (<
                      _0_quant_0@182@01
                      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                        $Snap.unit
                        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@178@01 ret@121@01)))
                    (<= 0 (+ _0_quant_0@182@01 1))
                    (<
                      (+ _0_quant_0@182@01 1)
                      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                        $Snap.unit
                        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@170@01 ret@121@01)))
                    (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
                      $Snap.unit
                      ($Snap.combine
                        $Snap.unit
                        ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@170@01 ret@121@01) (+
                      _0_quant_0@182@01
                      1))
                    (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
                      $Snap.unit
                      ($Snap.combine
                        $Snap.unit
                        ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@178@01 ret@121@01) _0_quant_0@182@01)))
                (or
                  (<
                    _0_quant_0@182@01
                    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                      $Snap.unit
                      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@178@01 ret@121@01)))
                  (not
                    (<
                      _0_quant_0@182@01
                      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                        $Snap.unit
                        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@178@01 ret@121@01)))))))
            (or (<= 0 _0_quant_0@182@01) (not (<= 0 _0_quant_0@182@01)))))
        (or (not (<= 0 _0_quant_0@182@01)) (<= 0 _0_quant_0@182@01)))
      :pattern ((m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%limited ($Snap.combine
        $Snap.unit
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@178@01 ret@121@01) _0_quant_0@182@01))
      :qid |prog.l1889-aux|)))))
(assert (or
  (not
    (>
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@170@01 ret@121@01))
      0))
  (forall ((_0_quant_0@182@01 Int)) (!
    (=>
      (<= 0 _0_quant_0@182@01)
      (or
        (not (<= 0 _0_quant_0@182@01))
        (or
          (not
            (<
              _0_quant_0@182@01
              (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                $Snap.unit
                $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@178@01 ret@121@01))))
          (=
            (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$ ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@170@01 ret@121@01) (+
              _0_quant_0@182@01
              1))
            (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$ ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@178@01 ret@121@01) _0_quant_0@182@01)))))
    :pattern ((m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%limited ($Snap.combine
      $Snap.unit
      ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@178@01 ret@121@01) _0_quant_0@182@01))
    :qid |prog.l1889|))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; label l25
; [exec]
; __t9 := true
; [exec]
; _18 := builtin$havoc_int()
(declare-const ret@183@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _18 := m_TrustedOption$_beg_$_end_$$discriminant$$__$TY$__m_TrustedOption$_beg_$_end_$$int$(_16)
; [eval] m_TrustedOption$_beg_$_end_$$discriminant$$__$TY$__m_TrustedOption$_beg_$_end_$$int$(_16)
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
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
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
(assert (m_TrustedOption$_beg_$_end_$$discriminant$$__$TY$__m_TrustedOption$_beg_$_end_$$int$%precondition $t@179@01 ret@177@01))
(pop) ; 5
; Joined path conditions
(assert (m_TrustedOption$_beg_$_end_$$discriminant$$__$TY$__m_TrustedOption$_beg_$_end_$$int$%precondition $t@179@01 ret@177@01))
(declare-const _18@184@01 Int)
(assert (=
  _18@184@01
  (m_TrustedOption$_beg_$_end_$$discriminant$$__$TY$__m_TrustedOption$_beg_$_end_$$int$ $t@179@01 ret@177@01)))
; [exec]
; __t47 := _18
; [eval] __t47 == 0
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= _18@184@01 0))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= _18@184@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [then-branch: 31 | _18@184@01 == 0 | live]
; [else-branch: 31 | _18@184@01 != 0 | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 31 | _18@184@01 == 0]
(assert (= _18@184@01 0))
; [exec]
; label bb1
; [exec]
; __t11 := true
; [exec]
; __t12 := true
; [exec]
; _19 := builtin$havoc_int()
(declare-const ret@185@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; unfold acc(m_TrustedOption$_beg_$_end_(_16), write)
(assert (= $t@179@01 ($Snap.combine ($Snap.first $t@179@01) ($Snap.second $t@179@01))))
(assert (not (= ret@177@01 $Ref.null)))
(assert (=
  ($Snap.second $t@179@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@179@01))
    ($Snap.second ($Snap.second $t@179@01)))))
(assert (= ($Snap.first ($Snap.second $t@179@01)) $Snap.unit))
; [eval] 0 <= self.discriminant
(assert (<= 0 ($SortWrappers.$SnapToInt ($Snap.first $t@179@01))))
(assert (=
  ($Snap.second ($Snap.second $t@179@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@179@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@179@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@179@01))) $Snap.unit))
; [eval] self.discriminant <= 1
(assert (<= ($SortWrappers.$SnapToInt ($Snap.first $t@179@01)) 1))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@179@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@179@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@179@01)))))))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (m_TrustedOption$_beg_$_end_%trigger $t@179@01 ret@177@01))
; [exec]
; unfold acc(m_TrustedOption$_beg_$_end_Some(_16.enum_Some), write)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@179@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@179@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@179@01))))))))
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@179@01)))))
    $Ref.null)))
; State saturation: after unfold
(check-sat)
; unknown
(assert (m_TrustedOption$_beg_$_end_Some%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@179@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@179@01)))))))
; [exec]
; unfold acc(i32(_16.enum_Some.f$0), write)
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@179@01))))))
    $Ref.null)))
; State saturation: after unfold
(check-sat)
; unknown
(assert (i32%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@179@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@179@01))))))))
; [exec]
; _19 := _16.enum_Some.f$0.val_int
(declare-const _19@186@01 Int)
(assert (=
  _19@186@01
  ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@179@01))))))))
; [exec]
; label l29
; [exec]
; _22 := builtin$havoc_int()
(declare-const ret@187@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _22 := _19
; [exec]
; label l30
; [exec]
; _21 := builtin$havoc_ref()
(declare-const ret@188@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; inhale acc(_21.val_bool, write)
(declare-const $t@189@01 Bool)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@142@01 ret@188@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@137@01 ret@188@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@188@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _21.val_bool := _22 == 3
; [eval] _22 == 3
(declare-const val_bool@190@01 Bool)
(assert (= val_bool@190@01 (= _19@186@01 3)))
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@137@01 ret@188@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@142@01 ret@188@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [exec]
; _20 := builtin$havoc_ref()
(declare-const ret@191@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_20.val_bool, write)
(declare-const $t@192@01 Bool)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@142@01 ret@191@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@137@01 ret@191@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@188@01 ret@191@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@191@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _20.val_bool := !_21.val_bool
; [eval] !_21.val_bool
(declare-const val_bool@193@01 Bool)
(assert (= val_bool@193@01 (not val_bool@190@01)))
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@188@01 ret@191@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@137@01 ret@191@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@142@01 ret@191@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t48 := _20.val_bool
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not val_bool@193@01)))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [then-branch: 32 | val_bool@193@01 | dead]
; [else-branch: 32 | !(val_bool@193@01) | live]
(set-option :timeout 0)
(push) ; 6
; [else-branch: 32 | !(val_bool@193@01)]
(assert (not val_bool@193@01))
(pop) ; 6
; [eval] !__t48
(push) ; 6
(set-option :timeout 10)
(assert (not val_bool@193@01))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not val_bool@193@01)))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [then-branch: 33 | !(val_bool@193@01) | live]
; [else-branch: 33 | val_bool@193@01 | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 33 | !(val_bool@193@01)]
(assert (not val_bool@193@01))
; [exec]
; label l5
; [exec]
; __t14 := true
; [exec]
; _27 := builtin$havoc_ref()
(declare-const ret@194@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_27.val_ref, write)
(declare-const $t@195@01 $Ref)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@133@01 ret@194@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@194@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _27.val_ref := _1
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@133@01 ret@194@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [exec]
; label l33
; [exec]
; label l34
; [exec]
; assert true
; [exec]
; exhale acc(_27.val_ref, write) && acc(struct$m_List(_27.val_ref), write)
; [exec]
; _26 := builtin$havoc_ref()
(declare-const ret@196@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(struct$m_List(old[l34](_27.val_ref)), write)
; [eval] old[l34](_27.val_ref)
(declare-const $t@197@01 $Snap)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(m_TrustedOption$_beg_$_end_(_26), write)
(declare-const $t@198@01 $Snap)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@127@01 ret@196@01)))
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
; inhale true
(declare-const $t@199@01 $Snap)
(assert (= $t@199@01 $Snap.unit))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale (!(old[l34](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_27.val_ref))) ==
;   0) ||
;   m_TrustedOption$$is_none__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$(snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_(_26))) &&
;   ((!(old[l34](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_27.val_ref))) ==
;   0) ||
;   m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l34](_27.val_ref))) ==
;   0) &&
;   ((!(old[l34](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_27.val_ref))) >
;   0) ||
;   m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$(snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_(_26))) &&
;   ((!(old[l34](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_27.val_ref))) >
;   0) ||
;   m_TrustedOption$$peek__$TY$__Snap$m_TrustedOption$_beg_$_end_$$int$(snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_(_26)) ==
;   old[l34](m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_27.val_ref),
;   0))) &&
;   ((!(old[l34](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_27.val_ref))) >
;   0) ||
;   m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l34](_27.val_ref))) ==
;   old[l34](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_27.val_ref)) -
;   1)) &&
;   (!(old[l34](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_27.val_ref))) >
;   0) ||
;   (forall _0_quant_0: Int ::
;     { m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l34](_27.val_ref)),
;     _0_quant_0) }
;     0 <= _0_quant_0 ==>
;     !(0 <= _0_quant_0) ||
;     (!(_0_quant_0 <
;     m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l34](_27.val_ref)))) ||
;     old[l34](m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_27.val_ref),
;     _0_quant_0 + 1)) ==
;     m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l34](_27.val_ref)),
;     _0_quant_0))))))))
(declare-const $t@200@01 $Snap)
(assert (= $t@200@01 ($Snap.combine ($Snap.first $t@200@01) ($Snap.second $t@200@01))))
(assert (= ($Snap.first $t@200@01) $Snap.unit))
; [eval] !(old[l34](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_27.val_ref))) == 0) || m_TrustedOption$$is_none__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$(snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_(_26))
; [eval] !(old[l34](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_27.val_ref))) == 0)
; [eval] old[l34](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_27.val_ref))) == 0
; [eval] old[l34](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_27.val_ref)))
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_27.val_ref))
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_27.val_ref)
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
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
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
(assert (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%precondition $t@178@01 ret@121@01))
(pop) ; 7
; Joined path conditions
(assert (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%precondition $t@178@01 ret@121@01))
(set-option :timeout 0)
(push) ; 7
(assert (m_List$$len__$TY$__Snap$struct$m_List$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@178@01 ret@121@01)))
(pop) ; 7
; Joined path conditions
(assert (m_List$$len__$TY$__Snap$struct$m_List$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@178@01 ret@121@01)))
(push) ; 7
; [then-branch: 34 | m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@178@01, ret@121@01)) != 0 | live]
; [else-branch: 34 | m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@178@01, ret@121@01)) == 0 | live]
(push) ; 8
; [then-branch: 34 | m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@178@01, ret@121@01)) != 0]
(assert (not
  (=
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@178@01 ret@121@01))
    0)))
(pop) ; 8
(push) ; 8
; [else-branch: 34 | m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@178@01, ret@121@01)) == 0]
(assert (=
  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@178@01 ret@121@01))
  0))
; [eval] m_TrustedOption$$is_none__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$(snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_(_26))
; [eval] snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_(_26)
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
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
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
(assert (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_%precondition $t@198@01 ret@196@01))
(pop) ; 9
; Joined path conditions
(assert (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_%precondition $t@198@01 ret@196@01))
(set-option :timeout 0)
(push) ; 9
(assert (m_TrustedOption$$is_none__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@198@01 ret@196@01)))
(pop) ; 9
; Joined path conditions
(assert (m_TrustedOption$$is_none__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@198@01 ret@196@01)))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (=
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@178@01 ret@121@01))
    0)
  (and
    (=
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@178@01 ret@121@01))
      0)
    (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_%precondition $t@198@01 ret@196@01)
    (m_TrustedOption$$is_none__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$%precondition ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@198@01 ret@196@01)))))
(assert (or
  (=
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@178@01 ret@121@01))
    0)
  (not
    (=
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@178@01 ret@121@01))
      0))))
(assert (or
  (not
    (=
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@178@01 ret@121@01))
      0))
  (m_TrustedOption$$is_none__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@198@01 ret@196@01))))
(assert (=
  ($Snap.second $t@200@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@200@01))
    ($Snap.second ($Snap.second $t@200@01)))))
(assert (= ($Snap.first ($Snap.second $t@200@01)) $Snap.unit))
; [eval] !(old[l34](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_27.val_ref))) == 0) || m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l34](_27.val_ref))) == 0
; [eval] !(old[l34](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_27.val_ref))) == 0)
; [eval] old[l34](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_27.val_ref))) == 0
; [eval] old[l34](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_27.val_ref)))
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_27.val_ref))
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_27.val_ref)
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
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
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
(pop) ; 7
; Joined path conditions
(push) ; 7
; [then-branch: 35 | m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@178@01, ret@121@01)) != 0 | live]
; [else-branch: 35 | m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@178@01, ret@121@01)) == 0 | live]
(push) ; 8
; [then-branch: 35 | m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@178@01, ret@121@01)) != 0]
(assert (not
  (=
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@178@01 ret@121@01))
    0)))
(pop) ; 8
(push) ; 8
; [else-branch: 35 | m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@178@01, ret@121@01)) == 0]
(assert (=
  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@178@01 ret@121@01))
  0))
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l34](_27.val_ref))) == 0
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l34](_27.val_ref)))
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l34](_27.val_ref))
; [eval] old[l34](_27.val_ref)
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
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
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
(assert (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%precondition $t@197@01 ret@121@01))
(pop) ; 9
; Joined path conditions
(assert (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%precondition $t@197@01 ret@121@01))
(set-option :timeout 0)
(push) ; 9
(assert (m_List$$len__$TY$__Snap$struct$m_List$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@197@01 ret@121@01)))
(pop) ; 9
; Joined path conditions
(assert (m_List$$len__$TY$__Snap$struct$m_List$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@197@01 ret@121@01)))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (=
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@178@01 ret@121@01))
    0)
  (and
    (=
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@178@01 ret@121@01))
      0)
    (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%precondition $t@197@01 ret@121@01)
    (m_List$$len__$TY$__Snap$struct$m_List$$int$%precondition ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@197@01 ret@121@01)))))
(assert (or
  (not
    (=
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@178@01 ret@121@01))
      0))
  (=
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@197@01 ret@121@01))
    0)))
(assert (=
  ($Snap.second ($Snap.second $t@200@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@200@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@200@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@200@01))) $Snap.unit))
; [eval] !(old[l34](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_27.val_ref))) > 0) || m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$(snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_(_26))
; [eval] !(old[l34](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_27.val_ref))) > 0)
; [eval] old[l34](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_27.val_ref))) > 0
; [eval] old[l34](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_27.val_ref)))
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_27.val_ref))
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_27.val_ref)
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
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
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
(pop) ; 7
; Joined path conditions
(push) ; 7
; [then-branch: 36 | !(m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@178@01, ret@121@01)) > 0) | live]
; [else-branch: 36 | m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@178@01, ret@121@01)) > 0 | live]
(push) ; 8
; [then-branch: 36 | !(m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@178@01, ret@121@01)) > 0)]
(assert (not
  (>
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@178@01 ret@121@01))
    0)))
(pop) ; 8
(push) ; 8
; [else-branch: 36 | m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@178@01, ret@121@01)) > 0]
(assert (>
  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@178@01 ret@121@01))
  0))
; [eval] m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$(snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_(_26))
; [eval] snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_(_26)
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
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
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
(assert (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_%precondition $t@198@01 ret@196@01))
(pop) ; 9
; Joined path conditions
(assert (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_%precondition $t@198@01 ret@196@01))
(set-option :timeout 0)
(push) ; 9
(assert (m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@198@01 ret@196@01)))
(pop) ; 9
; Joined path conditions
(assert (m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@198@01 ret@196@01)))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (>
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@178@01 ret@121@01))
    0)
  (and
    (>
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@178@01 ret@121@01))
      0)
    (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_%precondition $t@198@01 ret@196@01)
    (m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$%precondition ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@198@01 ret@196@01)))))
(assert (or
  (>
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@178@01 ret@121@01))
    0)
  (not
    (>
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@178@01 ret@121@01))
      0))))
(assert (or
  (not
    (>
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@178@01 ret@121@01))
      0))
  (m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@198@01 ret@196@01))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@200@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@200@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@200@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@200@01))))
  $Snap.unit))
; [eval] !(old[l34](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_27.val_ref))) > 0) || m_TrustedOption$$peek__$TY$__Snap$m_TrustedOption$_beg_$_end_$$int$(snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_(_26)) == old[l34](m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_27.val_ref), 0))
; [eval] !(old[l34](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_27.val_ref))) > 0)
; [eval] old[l34](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_27.val_ref))) > 0
; [eval] old[l34](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_27.val_ref)))
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_27.val_ref))
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_27.val_ref)
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
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
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
(pop) ; 7
; Joined path conditions
(push) ; 7
; [then-branch: 37 | !(m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@178@01, ret@121@01)) > 0) | live]
; [else-branch: 37 | m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@178@01, ret@121@01)) > 0 | live]
(push) ; 8
; [then-branch: 37 | !(m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@178@01, ret@121@01)) > 0)]
(assert (not
  (>
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@178@01 ret@121@01))
    0)))
(pop) ; 8
(push) ; 8
; [else-branch: 37 | m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@178@01, ret@121@01)) > 0]
(assert (>
  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@178@01 ret@121@01))
  0))
; [eval] m_TrustedOption$$peek__$TY$__Snap$m_TrustedOption$_beg_$_end_$$int$(snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_(_26)) == old[l34](m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_27.val_ref), 0))
; [eval] m_TrustedOption$$peek__$TY$__Snap$m_TrustedOption$_beg_$_end_$$int$(snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_(_26))
; [eval] snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_(_26)
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
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
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
(assert (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_%precondition $t@198@01 ret@196@01))
(pop) ; 9
; Joined path conditions
(assert (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_%precondition $t@198@01 ret@196@01))
(set-option :timeout 0)
(push) ; 9
; [eval] m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$(_1)
(push) ; 10
(assert (m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@198@01 ret@196@01)))
(pop) ; 10
; Joined path conditions
(assert (m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@198@01 ret@196@01)))
(push) ; 10
(assert (not (m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$ ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@198@01 ret@196@01))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(assert (m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$ ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@198@01 ret@196@01)))
(assert (m_TrustedOption$$peek__$TY$__Snap$m_TrustedOption$_beg_$_end_$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@198@01 ret@196@01)))
(pop) ; 9
; Joined path conditions
(assert (and
  (m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$%precondition ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@198@01 ret@196@01))
  (m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@198@01 ret@196@01))
  (m_TrustedOption$$peek__$TY$__Snap$m_TrustedOption$_beg_$_end_$$int$%precondition ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@198@01 ret@196@01))))
; [eval] old[l34](m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_27.val_ref), 0))
; [eval] m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_27.val_ref), 0)
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_27.val_ref)
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
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
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
; [eval] 0 <= _2
; [eval] _2 < m_List$$len__$TY$__Snap$struct$m_List$$int$(_1)
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(_1)
(push) ; 10
(pop) ; 10
; Joined path conditions
(push) ; 10
(assert (not (<
  0
  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@178@01 ret@121@01)))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(assert (<
  0
  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@178@01 ret@121@01))))
; [eval] 0 <= _2
(assert (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@178@01 ret@121@01) 0))
(pop) ; 9
; Joined path conditions
(assert (and
  (<
    0
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@178@01 ret@121@01)))
  (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@178@01 ret@121@01) 0)))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (>
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@178@01 ret@121@01))
    0)
  (and
    (>
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@178@01 ret@121@01))
      0)
    (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_%precondition $t@198@01 ret@196@01)
    (m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$%precondition ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@198@01 ret@196@01))
    (m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@198@01 ret@196@01))
    (m_TrustedOption$$peek__$TY$__Snap$m_TrustedOption$_beg_$_end_$$int$%precondition ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@198@01 ret@196@01))
    (<
      0
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@178@01 ret@121@01)))
    (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
      $Snap.unit
      ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@178@01 ret@121@01) 0))))
(assert (or
  (not
    (>
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@178@01 ret@121@01))
      0))
  (=
    (m_TrustedOption$$peek__$TY$__Snap$m_TrustedOption$_beg_$_end_$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@198@01 ret@196@01))
    (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$ ($Snap.combine
      $Snap.unit
      ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@178@01 ret@121@01) 0))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@200@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@200@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@200@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@200@01)))))
  $Snap.unit))
; [eval] !(old[l34](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_27.val_ref))) > 0) || m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l34](_27.val_ref))) == old[l34](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_27.val_ref)) - 1)
; [eval] !(old[l34](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_27.val_ref))) > 0)
; [eval] old[l34](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_27.val_ref))) > 0
; [eval] old[l34](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_27.val_ref)))
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_27.val_ref))
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_27.val_ref)
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
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
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
(pop) ; 7
; Joined path conditions
(push) ; 7
; [then-branch: 38 | !(m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@178@01, ret@121@01)) > 0) | live]
; [else-branch: 38 | m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@178@01, ret@121@01)) > 0 | live]
(push) ; 8
; [then-branch: 38 | !(m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@178@01, ret@121@01)) > 0)]
(assert (not
  (>
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@178@01 ret@121@01))
    0)))
(pop) ; 8
(push) ; 8
; [else-branch: 38 | m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@178@01, ret@121@01)) > 0]
(assert (>
  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@178@01 ret@121@01))
  0))
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l34](_27.val_ref))) == old[l34](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_27.val_ref)) - 1)
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l34](_27.val_ref)))
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l34](_27.val_ref))
; [eval] old[l34](_27.val_ref)
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
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
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
(assert (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%precondition $t@197@01 ret@121@01))
(pop) ; 9
; Joined path conditions
(assert (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%precondition $t@197@01 ret@121@01))
(set-option :timeout 0)
(push) ; 9
(assert (m_List$$len__$TY$__Snap$struct$m_List$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@197@01 ret@121@01)))
(pop) ; 9
; Joined path conditions
(assert (m_List$$len__$TY$__Snap$struct$m_List$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@197@01 ret@121@01)))
; [eval] old[l34](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_27.val_ref)) - 1)
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_27.val_ref)) - 1
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_27.val_ref))
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_27.val_ref)
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
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
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
(pop) ; 9
; Joined path conditions
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (>
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@178@01 ret@121@01))
    0)
  (and
    (>
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@178@01 ret@121@01))
      0)
    (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%precondition $t@197@01 ret@121@01)
    (m_List$$len__$TY$__Snap$struct$m_List$$int$%precondition ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@197@01 ret@121@01)))))
(assert (or
  (not
    (>
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@178@01 ret@121@01))
      0))
  (=
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@197@01 ret@121@01))
    (-
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@178@01 ret@121@01))
      1))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@200@01)))))
  $Snap.unit))
; [eval] !(old[l34](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_27.val_ref))) > 0) || (forall _0_quant_0: Int :: { m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l34](_27.val_ref)), _0_quant_0) } 0 <= _0_quant_0 ==> !(0 <= _0_quant_0) || (!(_0_quant_0 < m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l34](_27.val_ref)))) || old[l34](m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_27.val_ref), _0_quant_0 + 1)) == m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l34](_27.val_ref)), _0_quant_0)))
; [eval] !(old[l34](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_27.val_ref))) > 0)
; [eval] old[l34](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_27.val_ref))) > 0
; [eval] old[l34](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_27.val_ref)))
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_27.val_ref))
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_27.val_ref)
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
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
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
(pop) ; 7
; Joined path conditions
(push) ; 7
; [then-branch: 39 | !(m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@178@01, ret@121@01)) > 0) | live]
; [else-branch: 39 | m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@178@01, ret@121@01)) > 0 | live]
(push) ; 8
; [then-branch: 39 | !(m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@178@01, ret@121@01)) > 0)]
(assert (not
  (>
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@178@01 ret@121@01))
    0)))
(pop) ; 8
(push) ; 8
; [else-branch: 39 | m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@178@01, ret@121@01)) > 0]
(assert (>
  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@178@01 ret@121@01))
  0))
; [eval] (forall _0_quant_0: Int :: { m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l34](_27.val_ref)), _0_quant_0) } 0 <= _0_quant_0 ==> !(0 <= _0_quant_0) || (!(_0_quant_0 < m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l34](_27.val_ref)))) || old[l34](m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_27.val_ref), _0_quant_0 + 1)) == m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l34](_27.val_ref)), _0_quant_0)))
(declare-const _0_quant_0@201@01 Int)
(push) ; 9
; [eval] 0 <= _0_quant_0 ==> !(0 <= _0_quant_0) || (!(_0_quant_0 < m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l34](_27.val_ref)))) || old[l34](m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_27.val_ref), _0_quant_0 + 1)) == m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l34](_27.val_ref)), _0_quant_0))
; [eval] 0 <= _0_quant_0
(push) ; 10
; [then-branch: 40 | 0 <= _0_quant_0@201@01 | live]
; [else-branch: 40 | !(0 <= _0_quant_0@201@01) | live]
(push) ; 11
; [then-branch: 40 | 0 <= _0_quant_0@201@01]
(assert (<= 0 _0_quant_0@201@01))
; [eval] !(0 <= _0_quant_0) || (!(_0_quant_0 < m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l34](_27.val_ref)))) || old[l34](m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_27.val_ref), _0_quant_0 + 1)) == m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l34](_27.val_ref)), _0_quant_0))
; [eval] !(0 <= _0_quant_0)
; [eval] 0 <= _0_quant_0
(push) ; 12
; [then-branch: 41 | !(0 <= _0_quant_0@201@01) | live]
; [else-branch: 41 | 0 <= _0_quant_0@201@01 | live]
(push) ; 13
; [then-branch: 41 | !(0 <= _0_quant_0@201@01)]
(assert (not (<= 0 _0_quant_0@201@01)))
(pop) ; 13
(push) ; 13
; [else-branch: 41 | 0 <= _0_quant_0@201@01]
; [eval] !(_0_quant_0 < m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l34](_27.val_ref))))
; [eval] _0_quant_0 < m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l34](_27.val_ref)))
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l34](_27.val_ref)))
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l34](_27.val_ref))
; [eval] old[l34](_27.val_ref)
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
; 0.00s
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
(assert (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%precondition $t@197@01 ret@121@01))
(pop) ; 14
; Joined path conditions
(assert (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%precondition $t@197@01 ret@121@01))
(set-option :timeout 0)
(push) ; 14
(assert (m_List$$len__$TY$__Snap$struct$m_List$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@197@01 ret@121@01)))
(pop) ; 14
; Joined path conditions
(assert (m_List$$len__$TY$__Snap$struct$m_List$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@197@01 ret@121@01)))
(push) ; 14
; [then-branch: 42 | !(_0_quant_0@201@01 < m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@197@01, ret@121@01))) | live]
; [else-branch: 42 | _0_quant_0@201@01 < m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@197@01, ret@121@01)) | live]
(push) ; 15
; [then-branch: 42 | !(_0_quant_0@201@01 < m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@197@01, ret@121@01)))]
(assert (not
  (<
    _0_quant_0@201@01
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@197@01 ret@121@01)))))
(pop) ; 15
(push) ; 15
; [else-branch: 42 | _0_quant_0@201@01 < m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@197@01, ret@121@01))]
(assert (<
  _0_quant_0@201@01
  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@197@01 ret@121@01))))
; [eval] old[l34](m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_27.val_ref), _0_quant_0 + 1)) == m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l34](_27.val_ref)), _0_quant_0)
; [eval] old[l34](m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_27.val_ref), _0_quant_0 + 1))
; [eval] m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_27.val_ref), _0_quant_0 + 1)
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_27.val_ref)
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
; 0.00s
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
; [eval] _0_quant_0 + 1
(set-option :timeout 0)
(push) ; 16
; [eval] 0 <= _2
(push) ; 17
(assert (not (<= 0 (+ _0_quant_0@201@01 1))))
(check-sat)
; unsat
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(assert (<= 0 (+ _0_quant_0@201@01 1)))
; [eval] _2 < m_List$$len__$TY$__Snap$struct$m_List$$int$(_1)
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(_1)
(push) ; 17
(pop) ; 17
; Joined path conditions
(push) ; 17
(assert (not (<
  (+ _0_quant_0@201@01 1)
  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@178@01 ret@121@01)))))
(check-sat)
; unsat
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(assert (<
  (+ _0_quant_0@201@01 1)
  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@178@01 ret@121@01))))
; [eval] 0 <= _2
(assert (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@178@01 ret@121@01) (+
  _0_quant_0@201@01
  1)))
(pop) ; 16
; Joined path conditions
(assert (and
  (<= 0 (+ _0_quant_0@201@01 1))
  (<
    (+ _0_quant_0@201@01 1)
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@178@01 ret@121@01)))
  (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@178@01 ret@121@01) (+
    _0_quant_0@201@01
    1))))
; [eval] m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l34](_27.val_ref)), _0_quant_0)
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l34](_27.val_ref))
; [eval] old[l34](_27.val_ref)
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
; 0.00s
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
; [eval] 0 <= _2
; [eval] _2 < m_List$$len__$TY$__Snap$struct$m_List$$int$(_1)
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(_1)
(push) ; 17
(pop) ; 17
; Joined path conditions
; [eval] 0 <= _2
(assert (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@197@01 ret@121@01) _0_quant_0@201@01))
(pop) ; 16
; Joined path conditions
(assert (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@197@01 ret@121@01) _0_quant_0@201@01))
(pop) ; 15
(pop) ; 14
; Joined path conditions
; Joined path conditions
(assert (=>
  (<
    _0_quant_0@201@01
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@197@01 ret@121@01)))
  (and
    (<
      _0_quant_0@201@01
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@197@01 ret@121@01)))
    (<= 0 (+ _0_quant_0@201@01 1))
    (<
      (+ _0_quant_0@201@01 1)
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@178@01 ret@121@01)))
    (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
      $Snap.unit
      ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@178@01 ret@121@01) (+
      _0_quant_0@201@01
      1))
    (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
      $Snap.unit
      ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@197@01 ret@121@01) _0_quant_0@201@01))))
(assert (or
  (<
    _0_quant_0@201@01
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@197@01 ret@121@01)))
  (not
    (<
      _0_quant_0@201@01
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@197@01 ret@121@01))))))
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 _0_quant_0@201@01)
  (and
    (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%precondition $t@197@01 ret@121@01)
    (m_List$$len__$TY$__Snap$struct$m_List$$int$%precondition ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@197@01 ret@121@01))
    (=>
      (<
        _0_quant_0@201@01
        (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
          $Snap.unit
          $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@197@01 ret@121@01)))
      (and
        (<
          _0_quant_0@201@01
          (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
            $Snap.unit
            $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@197@01 ret@121@01)))
        (<= 0 (+ _0_quant_0@201@01 1))
        (<
          (+ _0_quant_0@201@01 1)
          (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
            $Snap.unit
            $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@178@01 ret@121@01)))
        (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@178@01 ret@121@01) (+
          _0_quant_0@201@01
          1))
        (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@197@01 ret@121@01) _0_quant_0@201@01)))
    (or
      (<
        _0_quant_0@201@01
        (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
          $Snap.unit
          $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@197@01 ret@121@01)))
      (not
        (<
          _0_quant_0@201@01
          (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
            $Snap.unit
            $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@197@01 ret@121@01))))))))
(assert (or (<= 0 _0_quant_0@201@01) (not (<= 0 _0_quant_0@201@01))))
(pop) ; 11
(push) ; 11
; [else-branch: 40 | !(0 <= _0_quant_0@201@01)]
(assert (not (<= 0 _0_quant_0@201@01)))
(pop) ; 11
(pop) ; 10
; Joined path conditions
(assert (=>
  (<= 0 _0_quant_0@201@01)
  (and
    (<= 0 _0_quant_0@201@01)
    (=>
      (<= 0 _0_quant_0@201@01)
      (and
        (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%precondition $t@197@01 ret@121@01)
        (m_List$$len__$TY$__Snap$struct$m_List$$int$%precondition ($Snap.combine
          $Snap.unit
          $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@197@01 ret@121@01))
        (=>
          (<
            _0_quant_0@201@01
            (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
              $Snap.unit
              $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@197@01 ret@121@01)))
          (and
            (<
              _0_quant_0@201@01
              (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                $Snap.unit
                $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@197@01 ret@121@01)))
            (<= 0 (+ _0_quant_0@201@01 1))
            (<
              (+ _0_quant_0@201@01 1)
              (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                $Snap.unit
                $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@178@01 ret@121@01)))
            (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@178@01 ret@121@01) (+
              _0_quant_0@201@01
              1))
            (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@197@01 ret@121@01) _0_quant_0@201@01)))
        (or
          (<
            _0_quant_0@201@01
            (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
              $Snap.unit
              $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@197@01 ret@121@01)))
          (not
            (<
              _0_quant_0@201@01
              (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                $Snap.unit
                $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@197@01 ret@121@01)))))))
    (or (<= 0 _0_quant_0@201@01) (not (<= 0 _0_quant_0@201@01))))))
; Joined path conditions
(assert (or (not (<= 0 _0_quant_0@201@01)) (<= 0 _0_quant_0@201@01)))
(pop) ; 9
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((_0_quant_0@201@01 Int)) (!
  (and
    (=>
      (<= 0 _0_quant_0@201@01)
      (and
        (<= 0 _0_quant_0@201@01)
        (=>
          (<= 0 _0_quant_0@201@01)
          (and
            (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%precondition $t@197@01 ret@121@01)
            (m_List$$len__$TY$__Snap$struct$m_List$$int$%precondition ($Snap.combine
              $Snap.unit
              $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@197@01 ret@121@01))
            (=>
              (<
                _0_quant_0@201@01
                (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                  $Snap.unit
                  $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@197@01 ret@121@01)))
              (and
                (<
                  _0_quant_0@201@01
                  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                    $Snap.unit
                    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@197@01 ret@121@01)))
                (<= 0 (+ _0_quant_0@201@01 1))
                (<
                  (+ _0_quant_0@201@01 1)
                  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                    $Snap.unit
                    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@178@01 ret@121@01)))
                (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@178@01 ret@121@01) (+
                  _0_quant_0@201@01
                  1))
                (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@197@01 ret@121@01) _0_quant_0@201@01)))
            (or
              (<
                _0_quant_0@201@01
                (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                  $Snap.unit
                  $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@197@01 ret@121@01)))
              (not
                (<
                  _0_quant_0@201@01
                  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                    $Snap.unit
                    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@197@01 ret@121@01)))))))
        (or (<= 0 _0_quant_0@201@01) (not (<= 0 _0_quant_0@201@01)))))
    (or (not (<= 0 _0_quant_0@201@01)) (<= 0 _0_quant_0@201@01)))
  :pattern ((m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%limited ($Snap.combine
    $Snap.unit
    ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@197@01 ret@121@01) _0_quant_0@201@01))
  :qid |prog.l1638-aux|)))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (>
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@178@01 ret@121@01))
    0)
  (and
    (>
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@178@01 ret@121@01))
      0)
    (forall ((_0_quant_0@201@01 Int)) (!
      (and
        (=>
          (<= 0 _0_quant_0@201@01)
          (and
            (<= 0 _0_quant_0@201@01)
            (=>
              (<= 0 _0_quant_0@201@01)
              (and
                (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%precondition $t@197@01 ret@121@01)
                (m_List$$len__$TY$__Snap$struct$m_List$$int$%precondition ($Snap.combine
                  $Snap.unit
                  $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@197@01 ret@121@01))
                (=>
                  (<
                    _0_quant_0@201@01
                    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                      $Snap.unit
                      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@197@01 ret@121@01)))
                  (and
                    (<
                      _0_quant_0@201@01
                      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                        $Snap.unit
                        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@197@01 ret@121@01)))
                    (<= 0 (+ _0_quant_0@201@01 1))
                    (<
                      (+ _0_quant_0@201@01 1)
                      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                        $Snap.unit
                        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@178@01 ret@121@01)))
                    (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
                      $Snap.unit
                      ($Snap.combine
                        $Snap.unit
                        ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@178@01 ret@121@01) (+
                      _0_quant_0@201@01
                      1))
                    (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
                      $Snap.unit
                      ($Snap.combine
                        $Snap.unit
                        ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@197@01 ret@121@01) _0_quant_0@201@01)))
                (or
                  (<
                    _0_quant_0@201@01
                    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                      $Snap.unit
                      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@197@01 ret@121@01)))
                  (not
                    (<
                      _0_quant_0@201@01
                      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                        $Snap.unit
                        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@197@01 ret@121@01)))))))
            (or (<= 0 _0_quant_0@201@01) (not (<= 0 _0_quant_0@201@01)))))
        (or (not (<= 0 _0_quant_0@201@01)) (<= 0 _0_quant_0@201@01)))
      :pattern ((m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%limited ($Snap.combine
        $Snap.unit
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@197@01 ret@121@01) _0_quant_0@201@01))
      :qid |prog.l1638-aux|)))))
(assert (or
  (not
    (>
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@178@01 ret@121@01))
      0))
  (forall ((_0_quant_0@201@01 Int)) (!
    (=>
      (<= 0 _0_quant_0@201@01)
      (or
        (not (<= 0 _0_quant_0@201@01))
        (or
          (not
            (<
              _0_quant_0@201@01
              (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                $Snap.unit
                $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@197@01 ret@121@01))))
          (=
            (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$ ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@178@01 ret@121@01) (+
              _0_quant_0@201@01
              1))
            (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$ ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@197@01 ret@121@01) _0_quant_0@201@01)))))
    :pattern ((m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%limited ($Snap.combine
      $Snap.unit
      ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@197@01 ret@121@01) _0_quant_0@201@01))
    :qid |prog.l1638|))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; label l35
; [exec]
; __t15 := true
; [exec]
; _28 := builtin$havoc_int()
(declare-const ret@202@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _28 := m_TrustedOption$_beg_$_end_$$discriminant$$__$TY$__m_TrustedOption$_beg_$_end_$$int$(_26)
; [eval] m_TrustedOption$_beg_$_end_$$discriminant$$__$TY$__m_TrustedOption$_beg_$_end_$$int$(_26)
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
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
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
(assert (m_TrustedOption$_beg_$_end_$$discriminant$$__$TY$__m_TrustedOption$_beg_$_end_$$int$%precondition $t@198@01 ret@196@01))
(pop) ; 7
; Joined path conditions
(assert (m_TrustedOption$_beg_$_end_$$discriminant$$__$TY$__m_TrustedOption$_beg_$_end_$$int$%precondition $t@198@01 ret@196@01))
(declare-const _28@203@01 Int)
(assert (=
  _28@203@01
  (m_TrustedOption$_beg_$_end_$$discriminant$$__$TY$__m_TrustedOption$_beg_$_end_$$int$ $t@198@01 ret@196@01)))
; [exec]
; __t49 := _28
; [eval] __t49 == 0
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= _28@203@01 0))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= _28@203@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [then-branch: 43 | _28@203@01 == 0 | live]
; [else-branch: 43 | _28@203@01 != 0 | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 43 | _28@203@01 == 0]
(assert (= _28@203@01 0))
; [exec]
; label l8
; [exec]
; __t17 := true
; [exec]
; __t18 := true
; [exec]
; _29 := builtin$havoc_int()
(declare-const ret@204@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; unfold acc(m_TrustedOption$_beg_$_end_(_26), write)
(assert (= $t@198@01 ($Snap.combine ($Snap.first $t@198@01) ($Snap.second $t@198@01))))
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@177@01 ret@196@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@196@01 $Ref.null)))
(assert (=
  ($Snap.second $t@198@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@198@01))
    ($Snap.second ($Snap.second $t@198@01)))))
(assert (= ($Snap.first ($Snap.second $t@198@01)) $Snap.unit))
; [eval] 0 <= self.discriminant
(assert (<= 0 ($SortWrappers.$SnapToInt ($Snap.first $t@198@01))))
(assert (=
  ($Snap.second ($Snap.second $t@198@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@198@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@198@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@198@01))) $Snap.unit))
; [eval] self.discriminant <= 1
(assert (<= ($SortWrappers.$SnapToInt ($Snap.first $t@198@01)) 1))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@198@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@198@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@198@01)))))))
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@177@01 ret@196@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (m_TrustedOption$_beg_$_end_%trigger $t@198@01 ret@196@01))
; [exec]
; unfold acc(m_TrustedOption$_beg_$_end_Some(_26.enum_Some), write)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@198@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@198@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@198@01))))))))
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@179@01)))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@198@01))))))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@198@01)))))
    $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (m_TrustedOption$_beg_$_end_Some%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@198@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@198@01)))))))
; [exec]
; unfold acc(i32(_26.enum_Some.f$0), write)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@179@01))))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@198@01)))))))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@198@01))))))
    $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (i32%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@198@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@198@01))))))))
; [exec]
; _29 := _26.enum_Some.f$0.val_int
(declare-const _29@205@01 Int)
(assert (=
  _29@205@01
  ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@198@01))))))))
; [exec]
; label l39
; [exec]
; _32 := builtin$havoc_int()
(declare-const ret@206@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _32 := _29
; [exec]
; label l40
; [exec]
; _31 := builtin$havoc_ref()
(declare-const ret@207@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; inhale acc(_31.val_bool, write)
(declare-const $t@208@01 Bool)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@142@01 ret@207@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@137@01 ret@207@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@188@01 ret@207@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@191@01 ret@207@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@207@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _31.val_bool := _32 == 2
; [eval] _32 == 2
(declare-const val_bool@209@01 Bool)
(assert (= val_bool@209@01 (= _29@205@01 2)))
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@191@01 ret@207@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@188@01 ret@207@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@137@01 ret@207@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@142@01 ret@207@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [exec]
; _30 := builtin$havoc_ref()
(declare-const ret@210@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_30.val_bool, write)
(declare-const $t@211@01 Bool)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@142@01 ret@210@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@137@01 ret@210@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@188@01 ret@210@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@191@01 ret@210@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@207@01 ret@210@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@210@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _30.val_bool := !_31.val_bool
; [eval] !_31.val_bool
(declare-const val_bool@212@01 Bool)
(assert (= val_bool@212@01 (not val_bool@209@01)))
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@207@01 ret@210@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@191@01 ret@210@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@188@01 ret@210@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@137@01 ret@210@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@142@01 ret@210@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t50 := _30.val_bool
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (not val_bool@212@01)))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [then-branch: 44 | val_bool@212@01 | dead]
; [else-branch: 44 | !(val_bool@212@01) | live]
(set-option :timeout 0)
(push) ; 8
; [else-branch: 44 | !(val_bool@212@01)]
(assert (not val_bool@212@01))
(pop) ; 8
; [eval] !__t50
(push) ; 8
(set-option :timeout 10)
(assert (not val_bool@212@01))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (not val_bool@212@01)))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [then-branch: 45 | !(val_bool@212@01) | live]
; [else-branch: 45 | val_bool@212@01 | dead]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 45 | !(val_bool@212@01)]
(assert (not val_bool@212@01))
; [exec]
; label bb3
; [exec]
; __t20 := true
; [exec]
; _36 := builtin$havoc_ref()
(declare-const ret@213@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_36.val_ref, write)
(declare-const $t@214@01 $Ref)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@133@01 ret@213@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@213@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _36.val_ref := _1
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@133@01 ret@213@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [exec]
; label l43
; [exec]
; label l44
; [exec]
; _t79 := builtin$havoc_ref()
(declare-const ret@215@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(i32(_t79), write)
(declare-const $t@216@01 Int)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert true
; [exec]
; exhale acc(_36.val_ref, write) &&
;   (acc(struct$m_List(_36.val_ref), write) && acc(i32(_t79), write))
; [exec]
; _35 := builtin$havoc_ref()
(declare-const ret@217@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(struct$m_List(old[l44](_36.val_ref)), write)
; [eval] old[l44](_36.val_ref)
(declare-const $t@218@01 $Snap)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(tuple0$(_35), write)
(declare-const $t@219@01 $Snap)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@159@01 ret@217@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@149@01 ret@217@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@169@01 ret@217@01)))
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
; inhale true
(declare-const $t@220@01 $Snap)
(assert (= $t@220@01 $Snap.unit))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l44](_36.val_ref))) ==
;   old[l44](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_36.val_ref))) +
;   1 &&
;   (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l44](_36.val_ref)),
;   0) ==
;   old[l44](4) &&
;   (forall _0_quant_0: Int ::
;     { m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l44](_36.val_ref)),
;     _0_quant_0) }
;     0 <= _0_quant_0 ==>
;     !(1 <= _0_quant_0) ||
;     (!(_0_quant_0 <
;     m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l44](_36.val_ref)))) ||
;     old[l44](m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_36.val_ref),
;     _0_quant_0 - 1)) ==
;     m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l44](_36.val_ref)),
;     _0_quant_0))))
(declare-const $t@221@01 $Snap)
(assert (= $t@221@01 ($Snap.combine ($Snap.first $t@221@01) ($Snap.second $t@221@01))))
(assert (= ($Snap.first $t@221@01) $Snap.unit))
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l44](_36.val_ref))) == old[l44](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_36.val_ref))) + 1
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l44](_36.val_ref)))
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l44](_36.val_ref))
; [eval] old[l44](_36.val_ref)
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
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
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
(assert (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%precondition $t@218@01 ret@121@01))
(pop) ; 9
; Joined path conditions
(assert (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%precondition $t@218@01 ret@121@01))
(set-option :timeout 0)
(push) ; 9
(assert (m_List$$len__$TY$__Snap$struct$m_List$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@218@01 ret@121@01)))
(pop) ; 9
; Joined path conditions
(assert (m_List$$len__$TY$__Snap$struct$m_List$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@218@01 ret@121@01)))
; [eval] old[l44](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_36.val_ref))) + 1
; [eval] old[l44](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_36.val_ref)))
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_36.val_ref))
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_36.val_ref)
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
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
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
(assert (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%precondition $t@197@01 ret@121@01))
(pop) ; 9
; Joined path conditions
(assert (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%precondition $t@197@01 ret@121@01))
(set-option :timeout 0)
(push) ; 9
(assert (m_List$$len__$TY$__Snap$struct$m_List$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@197@01 ret@121@01)))
(pop) ; 9
; Joined path conditions
(assert (m_List$$len__$TY$__Snap$struct$m_List$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@197@01 ret@121@01)))
(assert (=
  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@218@01 ret@121@01))
  (+
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@197@01 ret@121@01))
    1)))
(assert (=
  ($Snap.second $t@221@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@221@01))
    ($Snap.second ($Snap.second $t@221@01)))))
(assert (= ($Snap.first ($Snap.second $t@221@01)) $Snap.unit))
; [eval] m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l44](_36.val_ref)), 0) == old[l44](4)
; [eval] m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l44](_36.val_ref)), 0)
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l44](_36.val_ref))
; [eval] old[l44](_36.val_ref)
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
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
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
; [eval] 0 <= _2
; [eval] _2 < m_List$$len__$TY$__Snap$struct$m_List$$int$(_1)
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(_1)
(push) ; 10
(pop) ; 10
; Joined path conditions
(push) ; 10
(assert (not (<
  0
  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@218@01 ret@121@01)))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(assert (<
  0
  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@218@01 ret@121@01))))
; [eval] 0 <= _2
(assert (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@218@01 ret@121@01) 0))
(pop) ; 9
; Joined path conditions
(assert (and
  (<
    0
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@218@01 ret@121@01)))
  (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@218@01 ret@121@01) 0)))
; [eval] old[l44](4)
(assert (=
  (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$ ($Snap.combine
    $Snap.unit
    ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@218@01 ret@121@01) 0)
  4))
(assert (= ($Snap.second ($Snap.second $t@221@01)) $Snap.unit))
; [eval] (forall _0_quant_0: Int :: { m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l44](_36.val_ref)), _0_quant_0) } 0 <= _0_quant_0 ==> !(1 <= _0_quant_0) || (!(_0_quant_0 < m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l44](_36.val_ref)))) || old[l44](m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_36.val_ref), _0_quant_0 - 1)) == m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l44](_36.val_ref)), _0_quant_0)))
(declare-const _0_quant_0@222@01 Int)
(push) ; 9
; [eval] 0 <= _0_quant_0 ==> !(1 <= _0_quant_0) || (!(_0_quant_0 < m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l44](_36.val_ref)))) || old[l44](m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_36.val_ref), _0_quant_0 - 1)) == m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l44](_36.val_ref)), _0_quant_0))
; [eval] 0 <= _0_quant_0
(push) ; 10
; [then-branch: 46 | 0 <= _0_quant_0@222@01 | live]
; [else-branch: 46 | !(0 <= _0_quant_0@222@01) | live]
(push) ; 11
; [then-branch: 46 | 0 <= _0_quant_0@222@01]
(assert (<= 0 _0_quant_0@222@01))
; [eval] !(1 <= _0_quant_0) || (!(_0_quant_0 < m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l44](_36.val_ref)))) || old[l44](m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_36.val_ref), _0_quant_0 - 1)) == m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l44](_36.val_ref)), _0_quant_0))
; [eval] !(1 <= _0_quant_0)
; [eval] 1 <= _0_quant_0
(push) ; 12
; [then-branch: 47 | !(1 <= _0_quant_0@222@01) | live]
; [else-branch: 47 | 1 <= _0_quant_0@222@01 | live]
(push) ; 13
; [then-branch: 47 | !(1 <= _0_quant_0@222@01)]
(assert (not (<= 1 _0_quant_0@222@01)))
(pop) ; 13
(push) ; 13
; [else-branch: 47 | 1 <= _0_quant_0@222@01]
(assert (<= 1 _0_quant_0@222@01))
; [eval] !(_0_quant_0 < m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l44](_36.val_ref))))
; [eval] _0_quant_0 < m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l44](_36.val_ref)))
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l44](_36.val_ref)))
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l44](_36.val_ref))
; [eval] old[l44](_36.val_ref)
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
; 0.00s
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
(set-option :timeout 0)
(push) ; 14
(pop) ; 14
; Joined path conditions
(push) ; 14
; [then-branch: 48 | !(_0_quant_0@222@01 < m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@218@01, ret@121@01))) | live]
; [else-branch: 48 | _0_quant_0@222@01 < m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@218@01, ret@121@01)) | live]
(push) ; 15
; [then-branch: 48 | !(_0_quant_0@222@01 < m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@218@01, ret@121@01)))]
(assert (not
  (<
    _0_quant_0@222@01
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@218@01 ret@121@01)))))
(pop) ; 15
(push) ; 15
; [else-branch: 48 | _0_quant_0@222@01 < m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@218@01, ret@121@01))]
(assert (<
  _0_quant_0@222@01
  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@218@01 ret@121@01))))
; [eval] old[l44](m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_36.val_ref), _0_quant_0 - 1)) == m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l44](_36.val_ref)), _0_quant_0)
; [eval] old[l44](m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_36.val_ref), _0_quant_0 - 1))
; [eval] m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_36.val_ref), _0_quant_0 - 1)
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_36.val_ref)
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
; 0.00s
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
; [eval] _0_quant_0 - 1
(set-option :timeout 0)
(push) ; 16
; [eval] 0 <= _2
(push) ; 17
(assert (not (<= 0 (- _0_quant_0@222@01 1))))
(check-sat)
; unsat
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(assert (<= 0 (- _0_quant_0@222@01 1)))
; [eval] _2 < m_List$$len__$TY$__Snap$struct$m_List$$int$(_1)
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(_1)
(push) ; 17
(pop) ; 17
; Joined path conditions
(push) ; 17
(assert (not (<
  (- _0_quant_0@222@01 1)
  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@197@01 ret@121@01)))))
(check-sat)
; unsat
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(assert (<
  (- _0_quant_0@222@01 1)
  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@197@01 ret@121@01))))
; [eval] 0 <= _2
(assert (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@197@01 ret@121@01) (-
  _0_quant_0@222@01
  1)))
(pop) ; 16
; Joined path conditions
(assert (and
  (<= 0 (- _0_quant_0@222@01 1))
  (<
    (- _0_quant_0@222@01 1)
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@197@01 ret@121@01)))
  (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@197@01 ret@121@01) (-
    _0_quant_0@222@01
    1))))
; [eval] m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l44](_36.val_ref)), _0_quant_0)
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l44](_36.val_ref))
; [eval] old[l44](_36.val_ref)
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
; 0.00s
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
; [eval] 0 <= _2
; [eval] _2 < m_List$$len__$TY$__Snap$struct$m_List$$int$(_1)
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(_1)
(push) ; 17
(pop) ; 17
; Joined path conditions
; [eval] 0 <= _2
(assert (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@218@01 ret@121@01) _0_quant_0@222@01))
(pop) ; 16
; Joined path conditions
(assert (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@218@01 ret@121@01) _0_quant_0@222@01))
(pop) ; 15
(pop) ; 14
; Joined path conditions
; Joined path conditions
(assert (=>
  (<
    _0_quant_0@222@01
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@218@01 ret@121@01)))
  (and
    (<
      _0_quant_0@222@01
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@218@01 ret@121@01)))
    (<= 0 (- _0_quant_0@222@01 1))
    (<
      (- _0_quant_0@222@01 1)
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@197@01 ret@121@01)))
    (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
      $Snap.unit
      ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@197@01 ret@121@01) (-
      _0_quant_0@222@01
      1))
    (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
      $Snap.unit
      ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@218@01 ret@121@01) _0_quant_0@222@01))))
(assert (or
  (<
    _0_quant_0@222@01
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@218@01 ret@121@01)))
  (not
    (<
      _0_quant_0@222@01
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@218@01 ret@121@01))))))
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 1 _0_quant_0@222@01)
  (and
    (<= 1 _0_quant_0@222@01)
    (=>
      (<
        _0_quant_0@222@01
        (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
          $Snap.unit
          $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@218@01 ret@121@01)))
      (and
        (<
          _0_quant_0@222@01
          (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
            $Snap.unit
            $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@218@01 ret@121@01)))
        (<= 0 (- _0_quant_0@222@01 1))
        (<
          (- _0_quant_0@222@01 1)
          (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
            $Snap.unit
            $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@197@01 ret@121@01)))
        (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@197@01 ret@121@01) (-
          _0_quant_0@222@01
          1))
        (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@218@01 ret@121@01) _0_quant_0@222@01)))
    (or
      (<
        _0_quant_0@222@01
        (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
          $Snap.unit
          $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@218@01 ret@121@01)))
      (not
        (<
          _0_quant_0@222@01
          (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
            $Snap.unit
            $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@218@01 ret@121@01))))))))
(assert (or (<= 1 _0_quant_0@222@01) (not (<= 1 _0_quant_0@222@01))))
(pop) ; 11
(push) ; 11
; [else-branch: 46 | !(0 <= _0_quant_0@222@01)]
(assert (not (<= 0 _0_quant_0@222@01)))
(pop) ; 11
(pop) ; 10
; Joined path conditions
(assert (=>
  (<= 0 _0_quant_0@222@01)
  (and
    (<= 0 _0_quant_0@222@01)
    (=>
      (<= 1 _0_quant_0@222@01)
      (and
        (<= 1 _0_quant_0@222@01)
        (=>
          (<
            _0_quant_0@222@01
            (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
              $Snap.unit
              $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@218@01 ret@121@01)))
          (and
            (<
              _0_quant_0@222@01
              (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                $Snap.unit
                $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@218@01 ret@121@01)))
            (<= 0 (- _0_quant_0@222@01 1))
            (<
              (- _0_quant_0@222@01 1)
              (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                $Snap.unit
                $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@197@01 ret@121@01)))
            (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@197@01 ret@121@01) (-
              _0_quant_0@222@01
              1))
            (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@218@01 ret@121@01) _0_quant_0@222@01)))
        (or
          (<
            _0_quant_0@222@01
            (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
              $Snap.unit
              $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@218@01 ret@121@01)))
          (not
            (<
              _0_quant_0@222@01
              (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                $Snap.unit
                $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@218@01 ret@121@01)))))))
    (or (<= 1 _0_quant_0@222@01) (not (<= 1 _0_quant_0@222@01))))))
; Joined path conditions
(assert (or (not (<= 0 _0_quant_0@222@01)) (<= 0 _0_quant_0@222@01)))
(pop) ; 9
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((_0_quant_0@222@01 Int)) (!
  (and
    (=>
      (<= 0 _0_quant_0@222@01)
      (and
        (<= 0 _0_quant_0@222@01)
        (=>
          (<= 1 _0_quant_0@222@01)
          (and
            (<= 1 _0_quant_0@222@01)
            (=>
              (<
                _0_quant_0@222@01
                (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                  $Snap.unit
                  $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@218@01 ret@121@01)))
              (and
                (<
                  _0_quant_0@222@01
                  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                    $Snap.unit
                    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@218@01 ret@121@01)))
                (<= 0 (- _0_quant_0@222@01 1))
                (<
                  (- _0_quant_0@222@01 1)
                  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                    $Snap.unit
                    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@197@01 ret@121@01)))
                (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@197@01 ret@121@01) (-
                  _0_quant_0@222@01
                  1))
                (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@218@01 ret@121@01) _0_quant_0@222@01)))
            (or
              (<
                _0_quant_0@222@01
                (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                  $Snap.unit
                  $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@218@01 ret@121@01)))
              (not
                (<
                  _0_quant_0@222@01
                  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                    $Snap.unit
                    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@218@01 ret@121@01)))))))
        (or (<= 1 _0_quant_0@222@01) (not (<= 1 _0_quant_0@222@01)))))
    (or (not (<= 0 _0_quant_0@222@01)) (<= 0 _0_quant_0@222@01)))
  :pattern ((m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%limited ($Snap.combine
    $Snap.unit
    ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@218@01 ret@121@01) _0_quant_0@222@01))
  :qid |prog.l984-aux|)))
(assert (forall ((_0_quant_0@222@01 Int)) (!
  (=>
    (<= 0 _0_quant_0@222@01)
    (or
      (not (<= 1 _0_quant_0@222@01))
      (or
        (not
          (<
            _0_quant_0@222@01
            (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
              $Snap.unit
              $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@218@01 ret@121@01))))
        (=
          (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$ ($Snap.combine
            $Snap.unit
            ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@197@01 ret@121@01) (-
            _0_quant_0@222@01
            1))
          (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$ ($Snap.combine
            $Snap.unit
            ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@218@01 ret@121@01) _0_quant_0@222@01)))))
  :pattern ((m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%limited ($Snap.combine
    $Snap.unit
    ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@218@01 ret@121@01) _0_quant_0@222@01))
  :qid |prog.l984|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; label l45
; [exec]
; __t21 := true
; [exec]
; _38 := builtin$havoc_ref()
(declare-const ret@223@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_38.val_ref, write)
(declare-const $t@224@01 $Ref)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@133@01 ret@223@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@223@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _38.val_ref := _1
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@133@01 ret@223@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [exec]
; label l47
; [exec]
; label l48
; [exec]
; _t80 := builtin$havoc_ref()
(declare-const ret@225@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(i32(_t80), write)
(declare-const $t@226@01 Int)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert true
; [exec]
; exhale acc(_38.val_ref, write) &&
;   (acc(struct$m_List(_38.val_ref), write) && acc(i32(_t80), write))
; [exec]
; _37 := builtin$havoc_ref()
(declare-const ret@227@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(struct$m_List(old[l48](_38.val_ref)), write)
; [eval] old[l48](_38.val_ref)
(declare-const $t@228@01 $Snap)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(tuple0$(_37), write)
(declare-const $t@229@01 $Snap)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@169@01 ret@227@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@149@01 ret@227@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@159@01 ret@227@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@217@01 ret@227@01)))
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
; inhale true
(declare-const $t@230@01 $Snap)
(assert (= $t@230@01 $Snap.unit))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l48](_38.val_ref))) ==
;   old[l48](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_38.val_ref))) +
;   1 &&
;   (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l48](_38.val_ref)),
;   0) ==
;   old[l48](5) &&
;   (forall _0_quant_0: Int ::
;     { m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l48](_38.val_ref)),
;     _0_quant_0) }
;     0 <= _0_quant_0 ==>
;     !(1 <= _0_quant_0) ||
;     (!(_0_quant_0 <
;     m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l48](_38.val_ref)))) ||
;     old[l48](m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_38.val_ref),
;     _0_quant_0 - 1)) ==
;     m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l48](_38.val_ref)),
;     _0_quant_0))))
(declare-const $t@231@01 $Snap)
(assert (= $t@231@01 ($Snap.combine ($Snap.first $t@231@01) ($Snap.second $t@231@01))))
(assert (= ($Snap.first $t@231@01) $Snap.unit))
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l48](_38.val_ref))) == old[l48](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_38.val_ref))) + 1
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l48](_38.val_ref)))
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l48](_38.val_ref))
; [eval] old[l48](_38.val_ref)
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
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
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
(assert (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%precondition $t@228@01 ret@121@01))
(pop) ; 9
; Joined path conditions
(assert (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%precondition $t@228@01 ret@121@01))
(set-option :timeout 0)
(push) ; 9
(assert (m_List$$len__$TY$__Snap$struct$m_List$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@228@01 ret@121@01)))
(pop) ; 9
; Joined path conditions
(assert (m_List$$len__$TY$__Snap$struct$m_List$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@228@01 ret@121@01)))
; [eval] old[l48](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_38.val_ref))) + 1
; [eval] old[l48](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_38.val_ref)))
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_38.val_ref))
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_38.val_ref)
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
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
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
(pop) ; 9
; Joined path conditions
(assert (=
  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@228@01 ret@121@01))
  (+
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@218@01 ret@121@01))
    1)))
(assert (=
  ($Snap.second $t@231@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@231@01))
    ($Snap.second ($Snap.second $t@231@01)))))
(assert (= ($Snap.first ($Snap.second $t@231@01)) $Snap.unit))
; [eval] m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l48](_38.val_ref)), 0) == old[l48](5)
; [eval] m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l48](_38.val_ref)), 0)
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l48](_38.val_ref))
; [eval] old[l48](_38.val_ref)
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
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
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
; [eval] 0 <= _2
; [eval] _2 < m_List$$len__$TY$__Snap$struct$m_List$$int$(_1)
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(_1)
(push) ; 10
(pop) ; 10
; Joined path conditions
(push) ; 10
(assert (not (<
  0
  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@228@01 ret@121@01)))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(assert (<
  0
  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@228@01 ret@121@01))))
; [eval] 0 <= _2
(assert (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@228@01 ret@121@01) 0))
(pop) ; 9
; Joined path conditions
(assert (and
  (<
    0
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@228@01 ret@121@01)))
  (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@228@01 ret@121@01) 0)))
; [eval] old[l48](5)
(assert (=
  (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$ ($Snap.combine
    $Snap.unit
    ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@228@01 ret@121@01) 0)
  5))
(assert (= ($Snap.second ($Snap.second $t@231@01)) $Snap.unit))
; [eval] (forall _0_quant_0: Int :: { m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l48](_38.val_ref)), _0_quant_0) } 0 <= _0_quant_0 ==> !(1 <= _0_quant_0) || (!(_0_quant_0 < m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l48](_38.val_ref)))) || old[l48](m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_38.val_ref), _0_quant_0 - 1)) == m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l48](_38.val_ref)), _0_quant_0)))
(declare-const _0_quant_0@232@01 Int)
(push) ; 9
; [eval] 0 <= _0_quant_0 ==> !(1 <= _0_quant_0) || (!(_0_quant_0 < m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l48](_38.val_ref)))) || old[l48](m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_38.val_ref), _0_quant_0 - 1)) == m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l48](_38.val_ref)), _0_quant_0))
; [eval] 0 <= _0_quant_0
(push) ; 10
; [then-branch: 49 | 0 <= _0_quant_0@232@01 | live]
; [else-branch: 49 | !(0 <= _0_quant_0@232@01) | live]
(push) ; 11
; [then-branch: 49 | 0 <= _0_quant_0@232@01]
(assert (<= 0 _0_quant_0@232@01))
; [eval] !(1 <= _0_quant_0) || (!(_0_quant_0 < m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l48](_38.val_ref)))) || old[l48](m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_38.val_ref), _0_quant_0 - 1)) == m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l48](_38.val_ref)), _0_quant_0))
; [eval] !(1 <= _0_quant_0)
; [eval] 1 <= _0_quant_0
(push) ; 12
; [then-branch: 50 | !(1 <= _0_quant_0@232@01) | live]
; [else-branch: 50 | 1 <= _0_quant_0@232@01 | live]
(push) ; 13
; [then-branch: 50 | !(1 <= _0_quant_0@232@01)]
(assert (not (<= 1 _0_quant_0@232@01)))
(pop) ; 13
(push) ; 13
; [else-branch: 50 | 1 <= _0_quant_0@232@01]
(assert (<= 1 _0_quant_0@232@01))
; [eval] !(_0_quant_0 < m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l48](_38.val_ref))))
; [eval] _0_quant_0 < m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l48](_38.val_ref)))
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l48](_38.val_ref)))
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l48](_38.val_ref))
; [eval] old[l48](_38.val_ref)
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
; 0.00s
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
(set-option :timeout 0)
(push) ; 14
(pop) ; 14
; Joined path conditions
(push) ; 14
; [then-branch: 51 | !(_0_quant_0@232@01 < m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@228@01, ret@121@01))) | live]
; [else-branch: 51 | _0_quant_0@232@01 < m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@228@01, ret@121@01)) | live]
(push) ; 15
; [then-branch: 51 | !(_0_quant_0@232@01 < m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@228@01, ret@121@01)))]
(assert (not
  (<
    _0_quant_0@232@01
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@228@01 ret@121@01)))))
(pop) ; 15
(push) ; 15
; [else-branch: 51 | _0_quant_0@232@01 < m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@228@01, ret@121@01))]
(assert (<
  _0_quant_0@232@01
  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@228@01 ret@121@01))))
; [eval] old[l48](m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_38.val_ref), _0_quant_0 - 1)) == m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l48](_38.val_ref)), _0_quant_0)
; [eval] old[l48](m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_38.val_ref), _0_quant_0 - 1))
; [eval] m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_38.val_ref), _0_quant_0 - 1)
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_38.val_ref)
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
; 0.00s
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
; [eval] _0_quant_0 - 1
(set-option :timeout 0)
(push) ; 16
; [eval] 0 <= _2
(push) ; 17
(assert (not (<= 0 (- _0_quant_0@232@01 1))))
(check-sat)
; unsat
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(assert (<= 0 (- _0_quant_0@232@01 1)))
; [eval] _2 < m_List$$len__$TY$__Snap$struct$m_List$$int$(_1)
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(_1)
(push) ; 17
(pop) ; 17
; Joined path conditions
(push) ; 17
(assert (not (<
  (- _0_quant_0@232@01 1)
  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@218@01 ret@121@01)))))
(check-sat)
; unsat
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(assert (<
  (- _0_quant_0@232@01 1)
  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@218@01 ret@121@01))))
; [eval] 0 <= _2
(assert (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@218@01 ret@121@01) (-
  _0_quant_0@232@01
  1)))
(pop) ; 16
; Joined path conditions
(assert (and
  (<= 0 (- _0_quant_0@232@01 1))
  (<
    (- _0_quant_0@232@01 1)
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@218@01 ret@121@01)))
  (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@218@01 ret@121@01) (-
    _0_quant_0@232@01
    1))))
; [eval] m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l48](_38.val_ref)), _0_quant_0)
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l48](_38.val_ref))
; [eval] old[l48](_38.val_ref)
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
; 0.00s
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
; [eval] 0 <= _2
; [eval] _2 < m_List$$len__$TY$__Snap$struct$m_List$$int$(_1)
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(_1)
(push) ; 17
(pop) ; 17
; Joined path conditions
; [eval] 0 <= _2
(assert (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@228@01 ret@121@01) _0_quant_0@232@01))
(pop) ; 16
; Joined path conditions
(assert (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@228@01 ret@121@01) _0_quant_0@232@01))
(pop) ; 15
(pop) ; 14
; Joined path conditions
; Joined path conditions
(assert (=>
  (<
    _0_quant_0@232@01
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@228@01 ret@121@01)))
  (and
    (<
      _0_quant_0@232@01
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@228@01 ret@121@01)))
    (<= 0 (- _0_quant_0@232@01 1))
    (<
      (- _0_quant_0@232@01 1)
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@218@01 ret@121@01)))
    (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
      $Snap.unit
      ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@218@01 ret@121@01) (-
      _0_quant_0@232@01
      1))
    (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
      $Snap.unit
      ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@228@01 ret@121@01) _0_quant_0@232@01))))
(assert (or
  (<
    _0_quant_0@232@01
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@228@01 ret@121@01)))
  (not
    (<
      _0_quant_0@232@01
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@228@01 ret@121@01))))))
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 1 _0_quant_0@232@01)
  (and
    (<= 1 _0_quant_0@232@01)
    (=>
      (<
        _0_quant_0@232@01
        (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
          $Snap.unit
          $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@228@01 ret@121@01)))
      (and
        (<
          _0_quant_0@232@01
          (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
            $Snap.unit
            $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@228@01 ret@121@01)))
        (<= 0 (- _0_quant_0@232@01 1))
        (<
          (- _0_quant_0@232@01 1)
          (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
            $Snap.unit
            $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@218@01 ret@121@01)))
        (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@218@01 ret@121@01) (-
          _0_quant_0@232@01
          1))
        (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@228@01 ret@121@01) _0_quant_0@232@01)))
    (or
      (<
        _0_quant_0@232@01
        (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
          $Snap.unit
          $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@228@01 ret@121@01)))
      (not
        (<
          _0_quant_0@232@01
          (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
            $Snap.unit
            $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@228@01 ret@121@01))))))))
(assert (or (<= 1 _0_quant_0@232@01) (not (<= 1 _0_quant_0@232@01))))
(pop) ; 11
(push) ; 11
; [else-branch: 49 | !(0 <= _0_quant_0@232@01)]
(assert (not (<= 0 _0_quant_0@232@01)))
(pop) ; 11
(pop) ; 10
; Joined path conditions
(assert (=>
  (<= 0 _0_quant_0@232@01)
  (and
    (<= 0 _0_quant_0@232@01)
    (=>
      (<= 1 _0_quant_0@232@01)
      (and
        (<= 1 _0_quant_0@232@01)
        (=>
          (<
            _0_quant_0@232@01
            (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
              $Snap.unit
              $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@228@01 ret@121@01)))
          (and
            (<
              _0_quant_0@232@01
              (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                $Snap.unit
                $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@228@01 ret@121@01)))
            (<= 0 (- _0_quant_0@232@01 1))
            (<
              (- _0_quant_0@232@01 1)
              (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                $Snap.unit
                $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@218@01 ret@121@01)))
            (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@218@01 ret@121@01) (-
              _0_quant_0@232@01
              1))
            (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@228@01 ret@121@01) _0_quant_0@232@01)))
        (or
          (<
            _0_quant_0@232@01
            (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
              $Snap.unit
              $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@228@01 ret@121@01)))
          (not
            (<
              _0_quant_0@232@01
              (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                $Snap.unit
                $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@228@01 ret@121@01)))))))
    (or (<= 1 _0_quant_0@232@01) (not (<= 1 _0_quant_0@232@01))))))
; Joined path conditions
(assert (or (not (<= 0 _0_quant_0@232@01)) (<= 0 _0_quant_0@232@01)))
(pop) ; 9
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((_0_quant_0@232@01 Int)) (!
  (and
    (=>
      (<= 0 _0_quant_0@232@01)
      (and
        (<= 0 _0_quant_0@232@01)
        (=>
          (<= 1 _0_quant_0@232@01)
          (and
            (<= 1 _0_quant_0@232@01)
            (=>
              (<
                _0_quant_0@232@01
                (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                  $Snap.unit
                  $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@228@01 ret@121@01)))
              (and
                (<
                  _0_quant_0@232@01
                  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                    $Snap.unit
                    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@228@01 ret@121@01)))
                (<= 0 (- _0_quant_0@232@01 1))
                (<
                  (- _0_quant_0@232@01 1)
                  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                    $Snap.unit
                    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@218@01 ret@121@01)))
                (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@218@01 ret@121@01) (-
                  _0_quant_0@232@01
                  1))
                (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@228@01 ret@121@01) _0_quant_0@232@01)))
            (or
              (<
                _0_quant_0@232@01
                (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                  $Snap.unit
                  $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@228@01 ret@121@01)))
              (not
                (<
                  _0_quant_0@232@01
                  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                    $Snap.unit
                    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@228@01 ret@121@01)))))))
        (or (<= 1 _0_quant_0@232@01) (not (<= 1 _0_quant_0@232@01)))))
    (or (not (<= 0 _0_quant_0@232@01)) (<= 0 _0_quant_0@232@01)))
  :pattern ((m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%limited ($Snap.combine
    $Snap.unit
    ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@228@01 ret@121@01) _0_quant_0@232@01))
  :qid |prog.l1026-aux|)))
(assert (forall ((_0_quant_0@232@01 Int)) (!
  (=>
    (<= 0 _0_quant_0@232@01)
    (or
      (not (<= 1 _0_quant_0@232@01))
      (or
        (not
          (<
            _0_quant_0@232@01
            (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
              $Snap.unit
              $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@228@01 ret@121@01))))
        (=
          (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$ ($Snap.combine
            $Snap.unit
            ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@218@01 ret@121@01) (-
            _0_quant_0@232@01
            1))
          (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$ ($Snap.combine
            $Snap.unit
            ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@228@01 ret@121@01) _0_quant_0@232@01)))))
  :pattern ((m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%limited ($Snap.combine
    $Snap.unit
    ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@228@01 ret@121@01) _0_quant_0@232@01))
  :qid |prog.l1026|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; label l49
; [exec]
; __t22 := true
; [exec]
; _41 := builtin$havoc_ref()
(declare-const ret@233@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_41.val_ref, write)
(declare-const $t@234@01 $Ref)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@133@01 ret@233@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@233@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _41.val_ref := _1
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@133@01 ret@233@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [exec]
; label l51
; [exec]
; label l52
; [exec]
; assert true
; [exec]
; exhale acc(_41.val_ref, write) && acc(struct$m_List(_41.val_ref), write)
; [exec]
; _40 := builtin$havoc_ref()
(declare-const ret@235@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(struct$m_List(old[l52](_41.val_ref)), write)
; [eval] old[l52](_41.val_ref)
(declare-const $t@236@01 $Snap)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(m_TrustedOption$_beg_$_end_(_40), write)
(declare-const $t@237@01 $Snap)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@127@01 ret@235@01)))
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
; inhale true
(declare-const $t@238@01 $Snap)
(assert (= $t@238@01 $Snap.unit))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale (!(old[l52](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_41.val_ref))) ==
;   0) ||
;   m_TrustedOption$$is_none__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$(snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_(_40))) &&
;   ((!(old[l52](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_41.val_ref))) ==
;   0) ||
;   m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l52](_41.val_ref))) ==
;   0) &&
;   ((!(old[l52](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_41.val_ref))) >
;   0) ||
;   m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$(snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_(_40))) &&
;   ((!(old[l52](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_41.val_ref))) >
;   0) ||
;   m_TrustedOption$$peek__$TY$__Snap$m_TrustedOption$_beg_$_end_$$int$(snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_(_40)) ==
;   old[l52](m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_41.val_ref),
;   0))) &&
;   ((!(old[l52](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_41.val_ref))) >
;   0) ||
;   m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l52](_41.val_ref))) ==
;   old[l52](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_41.val_ref)) -
;   1)) &&
;   (!(old[l52](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_41.val_ref))) >
;   0) ||
;   (forall _0_quant_0: Int ::
;     { m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l52](_41.val_ref)),
;     _0_quant_0) }
;     0 <= _0_quant_0 ==>
;     !(0 <= _0_quant_0) ||
;     (!(_0_quant_0 <
;     m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l52](_41.val_ref)))) ||
;     old[l52](m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_41.val_ref),
;     _0_quant_0 + 1)) ==
;     m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l52](_41.val_ref)),
;     _0_quant_0))))))))
(declare-const $t@239@01 $Snap)
(assert (= $t@239@01 ($Snap.combine ($Snap.first $t@239@01) ($Snap.second $t@239@01))))
(assert (= ($Snap.first $t@239@01) $Snap.unit))
; [eval] !(old[l52](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_41.val_ref))) == 0) || m_TrustedOption$$is_none__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$(snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_(_40))
; [eval] !(old[l52](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_41.val_ref))) == 0)
; [eval] old[l52](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_41.val_ref))) == 0
; [eval] old[l52](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_41.val_ref)))
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_41.val_ref))
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_41.val_ref)
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
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
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
(pop) ; 9
; Joined path conditions
(push) ; 9
; [then-branch: 52 | m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@228@01, ret@121@01)) != 0 | live]
; [else-branch: 52 | m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@228@01, ret@121@01)) == 0 | live]
(push) ; 10
; [then-branch: 52 | m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@228@01, ret@121@01)) != 0]
(assert (not
  (=
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@228@01 ret@121@01))
    0)))
(pop) ; 10
(push) ; 10
; [else-branch: 52 | m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@228@01, ret@121@01)) == 0]
(assert (=
  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@228@01 ret@121@01))
  0))
; [eval] m_TrustedOption$$is_none__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$(snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_(_40))
; [eval] snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_(_40)
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
; unsat
(pop) ; 12
; 0.00s
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
(assert (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_%precondition $t@237@01 ret@235@01))
(pop) ; 11
; Joined path conditions
(assert (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_%precondition $t@237@01 ret@235@01))
(set-option :timeout 0)
(push) ; 11
(assert (m_TrustedOption$$is_none__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@237@01 ret@235@01)))
(pop) ; 11
; Joined path conditions
(assert (m_TrustedOption$$is_none__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@237@01 ret@235@01)))
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (=>
  (=
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@228@01 ret@121@01))
    0)
  (and
    (=
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@228@01 ret@121@01))
      0)
    (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_%precondition $t@237@01 ret@235@01)
    (m_TrustedOption$$is_none__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$%precondition ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@237@01 ret@235@01)))))
(assert (or
  (=
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@228@01 ret@121@01))
    0)
  (not
    (=
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@228@01 ret@121@01))
      0))))
(assert (or
  (not
    (=
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@228@01 ret@121@01))
      0))
  (m_TrustedOption$$is_none__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@237@01 ret@235@01))))
(assert (=
  ($Snap.second $t@239@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@239@01))
    ($Snap.second ($Snap.second $t@239@01)))))
(assert (= ($Snap.first ($Snap.second $t@239@01)) $Snap.unit))
; [eval] !(old[l52](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_41.val_ref))) == 0) || m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l52](_41.val_ref))) == 0
; [eval] !(old[l52](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_41.val_ref))) == 0)
; [eval] old[l52](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_41.val_ref))) == 0
; [eval] old[l52](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_41.val_ref)))
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_41.val_ref))
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_41.val_ref)
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
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
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
(pop) ; 9
; Joined path conditions
(push) ; 9
; [then-branch: 53 | m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@228@01, ret@121@01)) != 0 | live]
; [else-branch: 53 | m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@228@01, ret@121@01)) == 0 | live]
(push) ; 10
; [then-branch: 53 | m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@228@01, ret@121@01)) != 0]
(assert (not
  (=
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@228@01 ret@121@01))
    0)))
(pop) ; 10
(push) ; 10
; [else-branch: 53 | m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@228@01, ret@121@01)) == 0]
(assert (=
  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@228@01 ret@121@01))
  0))
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l52](_41.val_ref))) == 0
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l52](_41.val_ref)))
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l52](_41.val_ref))
; [eval] old[l52](_41.val_ref)
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
; unsat
(pop) ; 12
; 0.00s
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
(assert (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%precondition $t@236@01 ret@121@01))
(pop) ; 11
; Joined path conditions
(assert (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%precondition $t@236@01 ret@121@01))
(set-option :timeout 0)
(push) ; 11
(assert (m_List$$len__$TY$__Snap$struct$m_List$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@236@01 ret@121@01)))
(pop) ; 11
; Joined path conditions
(assert (m_List$$len__$TY$__Snap$struct$m_List$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@236@01 ret@121@01)))
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (=>
  (=
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@228@01 ret@121@01))
    0)
  (and
    (=
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@228@01 ret@121@01))
      0)
    (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%precondition $t@236@01 ret@121@01)
    (m_List$$len__$TY$__Snap$struct$m_List$$int$%precondition ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@236@01 ret@121@01)))))
(assert (or
  (not
    (=
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@228@01 ret@121@01))
      0))
  (=
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@236@01 ret@121@01))
    0)))
(assert (=
  ($Snap.second ($Snap.second $t@239@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@239@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@239@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@239@01))) $Snap.unit))
; [eval] !(old[l52](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_41.val_ref))) > 0) || m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$(snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_(_40))
; [eval] !(old[l52](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_41.val_ref))) > 0)
; [eval] old[l52](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_41.val_ref))) > 0
; [eval] old[l52](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_41.val_ref)))
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_41.val_ref))
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_41.val_ref)
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
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
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
(pop) ; 9
; Joined path conditions
(push) ; 9
; [then-branch: 54 | !(m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@228@01, ret@121@01)) > 0) | live]
; [else-branch: 54 | m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@228@01, ret@121@01)) > 0 | live]
(push) ; 10
; [then-branch: 54 | !(m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@228@01, ret@121@01)) > 0)]
(assert (not
  (>
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@228@01 ret@121@01))
    0)))
(pop) ; 10
(push) ; 10
; [else-branch: 54 | m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@228@01, ret@121@01)) > 0]
(assert (>
  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@228@01 ret@121@01))
  0))
; [eval] m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$(snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_(_40))
; [eval] snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_(_40)
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
; 0.00s
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
(assert (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_%precondition $t@237@01 ret@235@01))
(pop) ; 11
; Joined path conditions
(assert (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_%precondition $t@237@01 ret@235@01))
(set-option :timeout 0)
(push) ; 11
(assert (m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@237@01 ret@235@01)))
(pop) ; 11
; Joined path conditions
(assert (m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@237@01 ret@235@01)))
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (=>
  (>
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@228@01 ret@121@01))
    0)
  (and
    (>
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@228@01 ret@121@01))
      0)
    (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_%precondition $t@237@01 ret@235@01)
    (m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$%precondition ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@237@01 ret@235@01)))))
(assert (or
  (>
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@228@01 ret@121@01))
    0)
  (not
    (>
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@228@01 ret@121@01))
      0))))
(assert (or
  (not
    (>
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@228@01 ret@121@01))
      0))
  (m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@237@01 ret@235@01))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@239@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@239@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@239@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@239@01))))
  $Snap.unit))
; [eval] !(old[l52](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_41.val_ref))) > 0) || m_TrustedOption$$peek__$TY$__Snap$m_TrustedOption$_beg_$_end_$$int$(snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_(_40)) == old[l52](m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_41.val_ref), 0))
; [eval] !(old[l52](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_41.val_ref))) > 0)
; [eval] old[l52](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_41.val_ref))) > 0
; [eval] old[l52](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_41.val_ref)))
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_41.val_ref))
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_41.val_ref)
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
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
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
(pop) ; 9
; Joined path conditions
(push) ; 9
; [then-branch: 55 | !(m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@228@01, ret@121@01)) > 0) | live]
; [else-branch: 55 | m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@228@01, ret@121@01)) > 0 | live]
(push) ; 10
; [then-branch: 55 | !(m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@228@01, ret@121@01)) > 0)]
(assert (not
  (>
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@228@01 ret@121@01))
    0)))
(pop) ; 10
(push) ; 10
; [else-branch: 55 | m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@228@01, ret@121@01)) > 0]
(assert (>
  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@228@01 ret@121@01))
  0))
; [eval] m_TrustedOption$$peek__$TY$__Snap$m_TrustedOption$_beg_$_end_$$int$(snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_(_40)) == old[l52](m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_41.val_ref), 0))
; [eval] m_TrustedOption$$peek__$TY$__Snap$m_TrustedOption$_beg_$_end_$$int$(snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_(_40))
; [eval] snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_(_40)
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
; 0.00s
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
(assert (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_%precondition $t@237@01 ret@235@01))
(pop) ; 11
; Joined path conditions
(assert (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_%precondition $t@237@01 ret@235@01))
(set-option :timeout 0)
(push) ; 11
; [eval] m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$(_1)
(push) ; 12
(assert (m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@237@01 ret@235@01)))
(pop) ; 12
; Joined path conditions
(assert (m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@237@01 ret@235@01)))
(push) ; 12
(assert (not (m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$ ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@237@01 ret@235@01))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(assert (m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$ ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@237@01 ret@235@01)))
(assert (m_TrustedOption$$peek__$TY$__Snap$m_TrustedOption$_beg_$_end_$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@237@01 ret@235@01)))
(pop) ; 11
; Joined path conditions
(assert (and
  (m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$%precondition ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@237@01 ret@235@01))
  (m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@237@01 ret@235@01))
  (m_TrustedOption$$peek__$TY$__Snap$m_TrustedOption$_beg_$_end_$$int$%precondition ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@237@01 ret@235@01))))
; [eval] old[l52](m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_41.val_ref), 0))
; [eval] m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_41.val_ref), 0)
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_41.val_ref)
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
(pop) ; 11
; Joined path conditions
(set-option :timeout 0)
(push) ; 11
; [eval] 0 <= _2
; [eval] _2 < m_List$$len__$TY$__Snap$struct$m_List$$int$(_1)
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(_1)
(push) ; 12
(pop) ; 12
; Joined path conditions
; [eval] 0 <= _2
(pop) ; 11
; Joined path conditions
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (=>
  (>
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@228@01 ret@121@01))
    0)
  (and
    (>
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@228@01 ret@121@01))
      0)
    (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_%precondition $t@237@01 ret@235@01)
    (m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$%precondition ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@237@01 ret@235@01))
    (m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@237@01 ret@235@01))
    (m_TrustedOption$$peek__$TY$__Snap$m_TrustedOption$_beg_$_end_$$int$%precondition ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@237@01 ret@235@01)))))
(assert (or
  (not
    (>
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@228@01 ret@121@01))
      0))
  (=
    (m_TrustedOption$$peek__$TY$__Snap$m_TrustedOption$_beg_$_end_$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@237@01 ret@235@01))
    (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$ ($Snap.combine
      $Snap.unit
      ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@228@01 ret@121@01) 0))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@239@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@239@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@239@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@239@01)))))
  $Snap.unit))
; [eval] !(old[l52](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_41.val_ref))) > 0) || m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l52](_41.val_ref))) == old[l52](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_41.val_ref)) - 1)
; [eval] !(old[l52](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_41.val_ref))) > 0)
; [eval] old[l52](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_41.val_ref))) > 0
; [eval] old[l52](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_41.val_ref)))
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_41.val_ref))
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_41.val_ref)
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
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 10
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
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
(pop) ; 9
; Joined path conditions
(push) ; 9
; [then-branch: 56 | !(m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@228@01, ret@121@01)) > 0) | live]
; [else-branch: 56 | m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@228@01, ret@121@01)) > 0 | live]
(push) ; 10
; [then-branch: 56 | !(m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@228@01, ret@121@01)) > 0)]
(assert (not
  (>
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@228@01 ret@121@01))
    0)))
(pop) ; 10
(push) ; 10
; [else-branch: 56 | m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@228@01, ret@121@01)) > 0]
(assert (>
  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@228@01 ret@121@01))
  0))
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l52](_41.val_ref))) == old[l52](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_41.val_ref)) - 1)
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l52](_41.val_ref)))
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l52](_41.val_ref))
; [eval] old[l52](_41.val_ref)
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
(assert (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%precondition $t@236@01 ret@121@01))
(pop) ; 11
; Joined path conditions
(assert (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%precondition $t@236@01 ret@121@01))
(set-option :timeout 0)
(push) ; 11
(assert (m_List$$len__$TY$__Snap$struct$m_List$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@236@01 ret@121@01)))
(pop) ; 11
; Joined path conditions
(assert (m_List$$len__$TY$__Snap$struct$m_List$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@236@01 ret@121@01)))
; [eval] old[l52](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_41.val_ref)) - 1)
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_41.val_ref)) - 1
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_41.val_ref))
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_41.val_ref)
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
; 0.00s
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
(pop) ; 11
; Joined path conditions
(set-option :timeout 0)
(push) ; 11
(pop) ; 11
; Joined path conditions
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (=>
  (>
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@228@01 ret@121@01))
    0)
  (and
    (>
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@228@01 ret@121@01))
      0)
    (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%precondition $t@236@01 ret@121@01)
    (m_List$$len__$TY$__Snap$struct$m_List$$int$%precondition ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@236@01 ret@121@01)))))
(assert (or
  (not
    (>
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@228@01 ret@121@01))
      0))
  (=
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@236@01 ret@121@01))
    (-
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@228@01 ret@121@01))
      1))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@239@01)))))
  $Snap.unit))
; [eval] !(old[l52](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_41.val_ref))) > 0) || (forall _0_quant_0: Int :: { m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l52](_41.val_ref)), _0_quant_0) } 0 <= _0_quant_0 ==> !(0 <= _0_quant_0) || (!(_0_quant_0 < m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l52](_41.val_ref)))) || old[l52](m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_41.val_ref), _0_quant_0 + 1)) == m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l52](_41.val_ref)), _0_quant_0)))
; [eval] !(old[l52](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_41.val_ref))) > 0)
; [eval] old[l52](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_41.val_ref))) > 0
; [eval] old[l52](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_41.val_ref)))
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_41.val_ref))
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_41.val_ref)
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
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
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
(pop) ; 9
; Joined path conditions
(push) ; 9
; [then-branch: 57 | !(m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@228@01, ret@121@01)) > 0) | live]
; [else-branch: 57 | m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@228@01, ret@121@01)) > 0 | live]
(push) ; 10
; [then-branch: 57 | !(m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@228@01, ret@121@01)) > 0)]
(assert (not
  (>
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@228@01 ret@121@01))
    0)))
(pop) ; 10
(push) ; 10
; [else-branch: 57 | m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@228@01, ret@121@01)) > 0]
(assert (>
  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@228@01 ret@121@01))
  0))
; [eval] (forall _0_quant_0: Int :: { m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l52](_41.val_ref)), _0_quant_0) } 0 <= _0_quant_0 ==> !(0 <= _0_quant_0) || (!(_0_quant_0 < m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l52](_41.val_ref)))) || old[l52](m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_41.val_ref), _0_quant_0 + 1)) == m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l52](_41.val_ref)), _0_quant_0)))
(declare-const _0_quant_0@240@01 Int)
(push) ; 11
; [eval] 0 <= _0_quant_0 ==> !(0 <= _0_quant_0) || (!(_0_quant_0 < m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l52](_41.val_ref)))) || old[l52](m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_41.val_ref), _0_quant_0 + 1)) == m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l52](_41.val_ref)), _0_quant_0))
; [eval] 0 <= _0_quant_0
(push) ; 12
; [then-branch: 58 | 0 <= _0_quant_0@240@01 | live]
; [else-branch: 58 | !(0 <= _0_quant_0@240@01) | live]
(push) ; 13
; [then-branch: 58 | 0 <= _0_quant_0@240@01]
(assert (<= 0 _0_quant_0@240@01))
; [eval] !(0 <= _0_quant_0) || (!(_0_quant_0 < m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l52](_41.val_ref)))) || old[l52](m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_41.val_ref), _0_quant_0 + 1)) == m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l52](_41.val_ref)), _0_quant_0))
; [eval] !(0 <= _0_quant_0)
; [eval] 0 <= _0_quant_0
(push) ; 14
; [then-branch: 59 | !(0 <= _0_quant_0@240@01) | live]
; [else-branch: 59 | 0 <= _0_quant_0@240@01 | live]
(push) ; 15
; [then-branch: 59 | !(0 <= _0_quant_0@240@01)]
(assert (not (<= 0 _0_quant_0@240@01)))
(pop) ; 15
(push) ; 15
; [else-branch: 59 | 0 <= _0_quant_0@240@01]
; [eval] !(_0_quant_0 < m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l52](_41.val_ref))))
; [eval] _0_quant_0 < m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l52](_41.val_ref)))
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l52](_41.val_ref)))
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l52](_41.val_ref))
; [eval] old[l52](_41.val_ref)
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
(assert (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%precondition $t@236@01 ret@121@01))
(pop) ; 16
; Joined path conditions
(assert (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%precondition $t@236@01 ret@121@01))
(set-option :timeout 0)
(push) ; 16
(assert (m_List$$len__$TY$__Snap$struct$m_List$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@236@01 ret@121@01)))
(pop) ; 16
; Joined path conditions
(assert (m_List$$len__$TY$__Snap$struct$m_List$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@236@01 ret@121@01)))
(push) ; 16
; [then-branch: 60 | !(_0_quant_0@240@01 < m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@236@01, ret@121@01))) | live]
; [else-branch: 60 | _0_quant_0@240@01 < m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@236@01, ret@121@01)) | live]
(push) ; 17
; [then-branch: 60 | !(_0_quant_0@240@01 < m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@236@01, ret@121@01)))]
(assert (not
  (<
    _0_quant_0@240@01
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@236@01 ret@121@01)))))
(pop) ; 17
(push) ; 17
; [else-branch: 60 | _0_quant_0@240@01 < m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@236@01, ret@121@01))]
(assert (<
  _0_quant_0@240@01
  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@236@01 ret@121@01))))
; [eval] old[l52](m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_41.val_ref), _0_quant_0 + 1)) == m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l52](_41.val_ref)), _0_quant_0)
; [eval] old[l52](m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_41.val_ref), _0_quant_0 + 1))
; [eval] m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_41.val_ref), _0_quant_0 + 1)
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_41.val_ref)
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
; [eval] _0_quant_0 + 1
(set-option :timeout 0)
(push) ; 18
; [eval] 0 <= _2
(push) ; 19
(assert (not (<= 0 (+ _0_quant_0@240@01 1))))
(check-sat)
; unsat
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(assert (<= 0 (+ _0_quant_0@240@01 1)))
; [eval] _2 < m_List$$len__$TY$__Snap$struct$m_List$$int$(_1)
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(_1)
(push) ; 19
(pop) ; 19
; Joined path conditions
(push) ; 19
(assert (not (<
  (+ _0_quant_0@240@01 1)
  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@228@01 ret@121@01)))))
(check-sat)
; unsat
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(assert (<
  (+ _0_quant_0@240@01 1)
  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@228@01 ret@121@01))))
; [eval] 0 <= _2
(assert (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@228@01 ret@121@01) (+
  _0_quant_0@240@01
  1)))
(pop) ; 18
; Joined path conditions
(assert (and
  (<= 0 (+ _0_quant_0@240@01 1))
  (<
    (+ _0_quant_0@240@01 1)
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@228@01 ret@121@01)))
  (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@228@01 ret@121@01) (+
    _0_quant_0@240@01
    1))))
; [eval] m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l52](_41.val_ref)), _0_quant_0)
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l52](_41.val_ref))
; [eval] old[l52](_41.val_ref)
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
(set-option :timeout 0)
(push) ; 18
; [eval] 0 <= _2
; [eval] _2 < m_List$$len__$TY$__Snap$struct$m_List$$int$(_1)
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(_1)
(push) ; 19
(pop) ; 19
; Joined path conditions
; [eval] 0 <= _2
(assert (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@236@01 ret@121@01) _0_quant_0@240@01))
(pop) ; 18
; Joined path conditions
(assert (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@236@01 ret@121@01) _0_quant_0@240@01))
(pop) ; 17
(pop) ; 16
; Joined path conditions
; Joined path conditions
(assert (=>
  (<
    _0_quant_0@240@01
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@236@01 ret@121@01)))
  (and
    (<
      _0_quant_0@240@01
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@236@01 ret@121@01)))
    (<= 0 (+ _0_quant_0@240@01 1))
    (<
      (+ _0_quant_0@240@01 1)
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@228@01 ret@121@01)))
    (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
      $Snap.unit
      ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@228@01 ret@121@01) (+
      _0_quant_0@240@01
      1))
    (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
      $Snap.unit
      ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@236@01 ret@121@01) _0_quant_0@240@01))))
(assert (or
  (<
    _0_quant_0@240@01
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@236@01 ret@121@01)))
  (not
    (<
      _0_quant_0@240@01
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@236@01 ret@121@01))))))
(pop) ; 15
(pop) ; 14
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 _0_quant_0@240@01)
  (and
    (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%precondition $t@236@01 ret@121@01)
    (m_List$$len__$TY$__Snap$struct$m_List$$int$%precondition ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@236@01 ret@121@01))
    (=>
      (<
        _0_quant_0@240@01
        (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
          $Snap.unit
          $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@236@01 ret@121@01)))
      (and
        (<
          _0_quant_0@240@01
          (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
            $Snap.unit
            $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@236@01 ret@121@01)))
        (<= 0 (+ _0_quant_0@240@01 1))
        (<
          (+ _0_quant_0@240@01 1)
          (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
            $Snap.unit
            $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@228@01 ret@121@01)))
        (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@228@01 ret@121@01) (+
          _0_quant_0@240@01
          1))
        (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@236@01 ret@121@01) _0_quant_0@240@01)))
    (or
      (<
        _0_quant_0@240@01
        (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
          $Snap.unit
          $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@236@01 ret@121@01)))
      (not
        (<
          _0_quant_0@240@01
          (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
            $Snap.unit
            $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@236@01 ret@121@01))))))))
(assert (or (<= 0 _0_quant_0@240@01) (not (<= 0 _0_quant_0@240@01))))
(pop) ; 13
(push) ; 13
; [else-branch: 58 | !(0 <= _0_quant_0@240@01)]
(assert (not (<= 0 _0_quant_0@240@01)))
(pop) ; 13
(pop) ; 12
; Joined path conditions
(assert (=>
  (<= 0 _0_quant_0@240@01)
  (and
    (<= 0 _0_quant_0@240@01)
    (=>
      (<= 0 _0_quant_0@240@01)
      (and
        (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%precondition $t@236@01 ret@121@01)
        (m_List$$len__$TY$__Snap$struct$m_List$$int$%precondition ($Snap.combine
          $Snap.unit
          $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@236@01 ret@121@01))
        (=>
          (<
            _0_quant_0@240@01
            (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
              $Snap.unit
              $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@236@01 ret@121@01)))
          (and
            (<
              _0_quant_0@240@01
              (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                $Snap.unit
                $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@236@01 ret@121@01)))
            (<= 0 (+ _0_quant_0@240@01 1))
            (<
              (+ _0_quant_0@240@01 1)
              (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                $Snap.unit
                $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@228@01 ret@121@01)))
            (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@228@01 ret@121@01) (+
              _0_quant_0@240@01
              1))
            (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@236@01 ret@121@01) _0_quant_0@240@01)))
        (or
          (<
            _0_quant_0@240@01
            (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
              $Snap.unit
              $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@236@01 ret@121@01)))
          (not
            (<
              _0_quant_0@240@01
              (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                $Snap.unit
                $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@236@01 ret@121@01)))))))
    (or (<= 0 _0_quant_0@240@01) (not (<= 0 _0_quant_0@240@01))))))
; Joined path conditions
(assert (or (not (<= 0 _0_quant_0@240@01)) (<= 0 _0_quant_0@240@01)))
(pop) ; 11
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((_0_quant_0@240@01 Int)) (!
  (and
    (=>
      (<= 0 _0_quant_0@240@01)
      (and
        (<= 0 _0_quant_0@240@01)
        (=>
          (<= 0 _0_quant_0@240@01)
          (and
            (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%precondition $t@236@01 ret@121@01)
            (m_List$$len__$TY$__Snap$struct$m_List$$int$%precondition ($Snap.combine
              $Snap.unit
              $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@236@01 ret@121@01))
            (=>
              (<
                _0_quant_0@240@01
                (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                  $Snap.unit
                  $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@236@01 ret@121@01)))
              (and
                (<
                  _0_quant_0@240@01
                  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                    $Snap.unit
                    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@236@01 ret@121@01)))
                (<= 0 (+ _0_quant_0@240@01 1))
                (<
                  (+ _0_quant_0@240@01 1)
                  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                    $Snap.unit
                    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@228@01 ret@121@01)))
                (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@228@01 ret@121@01) (+
                  _0_quant_0@240@01
                  1))
                (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@236@01 ret@121@01) _0_quant_0@240@01)))
            (or
              (<
                _0_quant_0@240@01
                (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                  $Snap.unit
                  $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@236@01 ret@121@01)))
              (not
                (<
                  _0_quant_0@240@01
                  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                    $Snap.unit
                    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@236@01 ret@121@01)))))))
        (or (<= 0 _0_quant_0@240@01) (not (<= 0 _0_quant_0@240@01)))))
    (or (not (<= 0 _0_quant_0@240@01)) (<= 0 _0_quant_0@240@01)))
  :pattern ((m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%limited ($Snap.combine
    $Snap.unit
    ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@236@01 ret@121@01) _0_quant_0@240@01))
  :qid |prog.l1082-aux|)))
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (=>
  (>
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@228@01 ret@121@01))
    0)
  (and
    (>
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@228@01 ret@121@01))
      0)
    (forall ((_0_quant_0@240@01 Int)) (!
      (and
        (=>
          (<= 0 _0_quant_0@240@01)
          (and
            (<= 0 _0_quant_0@240@01)
            (=>
              (<= 0 _0_quant_0@240@01)
              (and
                (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%precondition $t@236@01 ret@121@01)
                (m_List$$len__$TY$__Snap$struct$m_List$$int$%precondition ($Snap.combine
                  $Snap.unit
                  $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@236@01 ret@121@01))
                (=>
                  (<
                    _0_quant_0@240@01
                    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                      $Snap.unit
                      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@236@01 ret@121@01)))
                  (and
                    (<
                      _0_quant_0@240@01
                      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                        $Snap.unit
                        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@236@01 ret@121@01)))
                    (<= 0 (+ _0_quant_0@240@01 1))
                    (<
                      (+ _0_quant_0@240@01 1)
                      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                        $Snap.unit
                        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@228@01 ret@121@01)))
                    (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
                      $Snap.unit
                      ($Snap.combine
                        $Snap.unit
                        ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@228@01 ret@121@01) (+
                      _0_quant_0@240@01
                      1))
                    (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
                      $Snap.unit
                      ($Snap.combine
                        $Snap.unit
                        ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@236@01 ret@121@01) _0_quant_0@240@01)))
                (or
                  (<
                    _0_quant_0@240@01
                    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                      $Snap.unit
                      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@236@01 ret@121@01)))
                  (not
                    (<
                      _0_quant_0@240@01
                      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                        $Snap.unit
                        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@236@01 ret@121@01)))))))
            (or (<= 0 _0_quant_0@240@01) (not (<= 0 _0_quant_0@240@01)))))
        (or (not (<= 0 _0_quant_0@240@01)) (<= 0 _0_quant_0@240@01)))
      :pattern ((m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%limited ($Snap.combine
        $Snap.unit
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@236@01 ret@121@01) _0_quant_0@240@01))
      :qid |prog.l1082-aux|)))))
(assert (or
  (not
    (>
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@228@01 ret@121@01))
      0))
  (forall ((_0_quant_0@240@01 Int)) (!
    (=>
      (<= 0 _0_quant_0@240@01)
      (or
        (not (<= 0 _0_quant_0@240@01))
        (or
          (not
            (<
              _0_quant_0@240@01
              (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                $Snap.unit
                $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@236@01 ret@121@01))))
          (=
            (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$ ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@228@01 ret@121@01) (+
              _0_quant_0@240@01
              1))
            (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$ ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@236@01 ret@121@01) _0_quant_0@240@01)))))
    :pattern ((m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%limited ($Snap.combine
      $Snap.unit
      ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@236@01 ret@121@01) _0_quant_0@240@01))
    :qid |prog.l1082|))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; label l53
; [exec]
; __t23 := true
; [exec]
; _42 := builtin$havoc_int()
(declare-const ret@241@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _42 := m_TrustedOption$_beg_$_end_$$discriminant$$__$TY$__m_TrustedOption$_beg_$_end_$$int$(_40)
; [eval] m_TrustedOption$_beg_$_end_$$discriminant$$__$TY$__m_TrustedOption$_beg_$_end_$$int$(_40)
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
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
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
(assert (m_TrustedOption$_beg_$_end_$$discriminant$$__$TY$__m_TrustedOption$_beg_$_end_$$int$%precondition $t@237@01 ret@235@01))
(pop) ; 9
; Joined path conditions
(assert (m_TrustedOption$_beg_$_end_$$discriminant$$__$TY$__m_TrustedOption$_beg_$_end_$$int$%precondition $t@237@01 ret@235@01))
(declare-const _42@242@01 Int)
(assert (=
  _42@242@01
  (m_TrustedOption$_beg_$_end_$$discriminant$$__$TY$__m_TrustedOption$_beg_$_end_$$int$ $t@237@01 ret@235@01)))
; [exec]
; __t51 := _42
; [eval] __t51 == 0
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= _42@242@01 0))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= _42@242@01 0)))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [then-branch: 61 | _42@242@01 == 0 | live]
; [else-branch: 61 | _42@242@01 != 0 | dead]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 61 | _42@242@01 == 0]
(assert (= _42@242@01 0))
; [exec]
; label l10
; [exec]
; __t25 := true
; [exec]
; __t26 := true
; [exec]
; _43 := builtin$havoc_int()
(declare-const ret@243@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; unfold acc(m_TrustedOption$_beg_$_end_(_40), write)
(assert (= $t@237@01 ($Snap.combine ($Snap.first $t@237@01) ($Snap.second $t@237@01))))
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@196@01 ret@235@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@177@01 ret@235@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@235@01 $Ref.null)))
(assert (=
  ($Snap.second $t@237@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@237@01))
    ($Snap.second ($Snap.second $t@237@01)))))
(assert (= ($Snap.first ($Snap.second $t@237@01)) $Snap.unit))
; [eval] 0 <= self.discriminant
(assert (<= 0 ($SortWrappers.$SnapToInt ($Snap.first $t@237@01))))
(assert (=
  ($Snap.second ($Snap.second $t@237@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@237@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@237@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@237@01))) $Snap.unit))
; [eval] self.discriminant <= 1
(assert (<= ($SortWrappers.$SnapToInt ($Snap.first $t@237@01)) 1))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@237@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@237@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@237@01)))))))
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@196@01 ret@235@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@177@01 ret@235@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (m_TrustedOption$_beg_$_end_%trigger $t@237@01 ret@235@01))
; [exec]
; unfold acc(m_TrustedOption$_beg_$_end_Some(_40.enum_Some), write)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@237@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@237@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@237@01))))))))
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@198@01)))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@237@01))))))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@179@01)))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@237@01))))))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@237@01)))))
    $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (m_TrustedOption$_beg_$_end_Some%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@237@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@237@01)))))))
; [exec]
; unfold acc(i32(_40.enum_Some.f$0), write)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@198@01))))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@237@01)))))))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@179@01))))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@237@01)))))))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@237@01))))))
    $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (i32%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@237@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@237@01))))))))
; [exec]
; _43 := _40.enum_Some.f$0.val_int
(declare-const _43@244@01 Int)
(assert (=
  _43@244@01
  ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@237@01))))))))
; [exec]
; label l57
; [exec]
; _46 := builtin$havoc_int()
(declare-const ret@245@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _46 := _43
; [exec]
; label l58
; [exec]
; _45 := builtin$havoc_ref()
(declare-const ret@246@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; inhale acc(_45.val_bool, write)
(declare-const $t@247@01 Bool)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@142@01 ret@246@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@137@01 ret@246@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@188@01 ret@246@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@191@01 ret@246@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@207@01 ret@246@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@210@01 ret@246@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@246@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _45.val_bool := _46 == 5
; [eval] _46 == 5
(declare-const val_bool@248@01 Bool)
(assert (= val_bool@248@01 (= _43@244@01 5)))
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@210@01 ret@246@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@207@01 ret@246@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@191@01 ret@246@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@188@01 ret@246@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@137@01 ret@246@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@142@01 ret@246@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [exec]
; _44 := builtin$havoc_ref()
(declare-const ret@249@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_44.val_bool, write)
(declare-const $t@250@01 Bool)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@142@01 ret@249@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@137@01 ret@249@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@188@01 ret@249@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@191@01 ret@249@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@207@01 ret@249@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@210@01 ret@249@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@246@01 ret@249@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@249@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _44.val_bool := !_45.val_bool
; [eval] !_45.val_bool
(declare-const val_bool@251@01 Bool)
(assert (= val_bool@251@01 (not val_bool@248@01)))
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@246@01 ret@249@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@210@01 ret@249@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@207@01 ret@249@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@191@01 ret@249@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@188@01 ret@249@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@137@01 ret@249@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@142@01 ret@249@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t52 := _44.val_bool
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not val_bool@251@01)))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [then-branch: 62 | val_bool@251@01 | dead]
; [else-branch: 62 | !(val_bool@251@01) | live]
(set-option :timeout 0)
(push) ; 10
; [else-branch: 62 | !(val_bool@251@01)]
(assert (not val_bool@251@01))
(pop) ; 10
; [eval] !__t52
(push) ; 10
(set-option :timeout 10)
(assert (not val_bool@251@01))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not val_bool@251@01)))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [then-branch: 63 | !(val_bool@251@01) | live]
; [else-branch: 63 | val_bool@251@01 | dead]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 63 | !(val_bool@251@01)]
(assert (not val_bool@251@01))
; [exec]
; label bb4
; [exec]
; __t28 := true
; [exec]
; _51 := builtin$havoc_ref()
(declare-const ret@252@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_51.val_ref, write)
(declare-const $t@253@01 $Ref)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@133@01 ret@252@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@252@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _51.val_ref := _1
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@133@01 ret@252@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [exec]
; label l61
; [exec]
; label l62
; [exec]
; assert true
; [exec]
; exhale acc(_51.val_ref, write) && acc(struct$m_List(_51.val_ref), write)
; [exec]
; _50 := builtin$havoc_ref()
(declare-const ret@254@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(struct$m_List(old[l62](_51.val_ref)), write)
; [eval] old[l62](_51.val_ref)
(declare-const $t@255@01 $Snap)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(m_TrustedOption$_beg_$_end_(_50), write)
(declare-const $t@256@01 $Snap)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@127@01 ret@254@01)))
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
; inhale true
(declare-const $t@257@01 $Snap)
(assert (= $t@257@01 $Snap.unit))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale (!(old[l62](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_51.val_ref))) ==
;   0) ||
;   m_TrustedOption$$is_none__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$(snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_(_50))) &&
;   ((!(old[l62](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_51.val_ref))) ==
;   0) ||
;   m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l62](_51.val_ref))) ==
;   0) &&
;   ((!(old[l62](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_51.val_ref))) >
;   0) ||
;   m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$(snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_(_50))) &&
;   ((!(old[l62](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_51.val_ref))) >
;   0) ||
;   m_TrustedOption$$peek__$TY$__Snap$m_TrustedOption$_beg_$_end_$$int$(snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_(_50)) ==
;   old[l62](m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_51.val_ref),
;   0))) &&
;   ((!(old[l62](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_51.val_ref))) >
;   0) ||
;   m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l62](_51.val_ref))) ==
;   old[l62](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_51.val_ref)) -
;   1)) &&
;   (!(old[l62](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_51.val_ref))) >
;   0) ||
;   (forall _0_quant_0: Int ::
;     { m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l62](_51.val_ref)),
;     _0_quant_0) }
;     0 <= _0_quant_0 ==>
;     !(0 <= _0_quant_0) ||
;     (!(_0_quant_0 <
;     m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l62](_51.val_ref)))) ||
;     old[l62](m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_51.val_ref),
;     _0_quant_0 + 1)) ==
;     m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l62](_51.val_ref)),
;     _0_quant_0))))))))
(declare-const $t@258@01 $Snap)
(assert (= $t@258@01 ($Snap.combine ($Snap.first $t@258@01) ($Snap.second $t@258@01))))
(assert (= ($Snap.first $t@258@01) $Snap.unit))
; [eval] !(old[l62](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_51.val_ref))) == 0) || m_TrustedOption$$is_none__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$(snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_(_50))
; [eval] !(old[l62](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_51.val_ref))) == 0)
; [eval] old[l62](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_51.val_ref))) == 0
; [eval] old[l62](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_51.val_ref)))
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_51.val_ref))
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_51.val_ref)
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
; 0.00s
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
(assert (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%precondition $t@236@01 ret@121@01))
(pop) ; 11
; Joined path conditions
(assert (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%precondition $t@236@01 ret@121@01))
(set-option :timeout 0)
(push) ; 11
(assert (m_List$$len__$TY$__Snap$struct$m_List$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@236@01 ret@121@01)))
(pop) ; 11
; Joined path conditions
(assert (m_List$$len__$TY$__Snap$struct$m_List$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@236@01 ret@121@01)))
(push) ; 11
; [then-branch: 64 | m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@236@01, ret@121@01)) != 0 | live]
; [else-branch: 64 | m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@236@01, ret@121@01)) == 0 | live]
(push) ; 12
; [then-branch: 64 | m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@236@01, ret@121@01)) != 0]
(assert (not
  (=
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@236@01 ret@121@01))
    0)))
(pop) ; 12
(push) ; 12
; [else-branch: 64 | m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@236@01, ret@121@01)) == 0]
(assert (=
  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@236@01 ret@121@01))
  0))
; [eval] m_TrustedOption$$is_none__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$(snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_(_50))
; [eval] snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_(_50)
(push) ; 13
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
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unsat
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
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
(assert (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_%precondition $t@256@01 ret@254@01))
(pop) ; 13
; Joined path conditions
(assert (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_%precondition $t@256@01 ret@254@01))
(set-option :timeout 0)
(push) ; 13
(assert (m_TrustedOption$$is_none__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@256@01 ret@254@01)))
(pop) ; 13
; Joined path conditions
(assert (m_TrustedOption$$is_none__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@256@01 ret@254@01)))
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (=>
  (=
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@236@01 ret@121@01))
    0)
  (and
    (=
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@236@01 ret@121@01))
      0)
    (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_%precondition $t@256@01 ret@254@01)
    (m_TrustedOption$$is_none__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$%precondition ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@256@01 ret@254@01)))))
(assert (or
  (=
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@236@01 ret@121@01))
    0)
  (not
    (=
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@236@01 ret@121@01))
      0))))
(assert (or
  (not
    (=
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@236@01 ret@121@01))
      0))
  (m_TrustedOption$$is_none__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@256@01 ret@254@01))))
(assert (=
  ($Snap.second $t@258@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@258@01))
    ($Snap.second ($Snap.second $t@258@01)))))
(assert (= ($Snap.first ($Snap.second $t@258@01)) $Snap.unit))
; [eval] !(old[l62](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_51.val_ref))) == 0) || m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l62](_51.val_ref))) == 0
; [eval] !(old[l62](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_51.val_ref))) == 0)
; [eval] old[l62](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_51.val_ref))) == 0
; [eval] old[l62](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_51.val_ref)))
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_51.val_ref))
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_51.val_ref)
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
; 0.00s
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
(pop) ; 11
; Joined path conditions
(set-option :timeout 0)
(push) ; 11
(pop) ; 11
; Joined path conditions
(push) ; 11
; [then-branch: 65 | m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@236@01, ret@121@01)) != 0 | live]
; [else-branch: 65 | m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@236@01, ret@121@01)) == 0 | live]
(push) ; 12
; [then-branch: 65 | m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@236@01, ret@121@01)) != 0]
(assert (not
  (=
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@236@01 ret@121@01))
    0)))
(pop) ; 12
(push) ; 12
; [else-branch: 65 | m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@236@01, ret@121@01)) == 0]
(assert (=
  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@236@01 ret@121@01))
  0))
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l62](_51.val_ref))) == 0
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l62](_51.val_ref)))
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l62](_51.val_ref))
; [eval] old[l62](_51.val_ref)
(push) ; 13
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
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unsat
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
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
(assert (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%precondition $t@255@01 ret@121@01))
(pop) ; 13
; Joined path conditions
(assert (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%precondition $t@255@01 ret@121@01))
(set-option :timeout 0)
(push) ; 13
(assert (m_List$$len__$TY$__Snap$struct$m_List$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@255@01 ret@121@01)))
(pop) ; 13
; Joined path conditions
(assert (m_List$$len__$TY$__Snap$struct$m_List$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@255@01 ret@121@01)))
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (=>
  (=
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@236@01 ret@121@01))
    0)
  (and
    (=
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@236@01 ret@121@01))
      0)
    (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%precondition $t@255@01 ret@121@01)
    (m_List$$len__$TY$__Snap$struct$m_List$$int$%precondition ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@255@01 ret@121@01)))))
(assert (or
  (not
    (=
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@236@01 ret@121@01))
      0))
  (=
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@255@01 ret@121@01))
    0)))
(assert (=
  ($Snap.second ($Snap.second $t@258@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@258@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@258@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@258@01))) $Snap.unit))
; [eval] !(old[l62](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_51.val_ref))) > 0) || m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$(snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_(_50))
; [eval] !(old[l62](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_51.val_ref))) > 0)
; [eval] old[l62](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_51.val_ref))) > 0
; [eval] old[l62](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_51.val_ref)))
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_51.val_ref))
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_51.val_ref)
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
; 0.00s
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
(pop) ; 11
; Joined path conditions
(set-option :timeout 0)
(push) ; 11
(pop) ; 11
; Joined path conditions
(push) ; 11
; [then-branch: 66 | !(m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@236@01, ret@121@01)) > 0) | live]
; [else-branch: 66 | m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@236@01, ret@121@01)) > 0 | live]
(push) ; 12
; [then-branch: 66 | !(m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@236@01, ret@121@01)) > 0)]
(assert (not
  (>
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@236@01 ret@121@01))
    0)))
(pop) ; 12
(push) ; 12
; [else-branch: 66 | m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@236@01, ret@121@01)) > 0]
(assert (>
  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@236@01 ret@121@01))
  0))
; [eval] m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$(snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_(_50))
; [eval] snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_(_50)
(push) ; 13
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
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
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
(assert (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_%precondition $t@256@01 ret@254@01))
(pop) ; 13
; Joined path conditions
(assert (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_%precondition $t@256@01 ret@254@01))
(set-option :timeout 0)
(push) ; 13
(assert (m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@256@01 ret@254@01)))
(pop) ; 13
; Joined path conditions
(assert (m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@256@01 ret@254@01)))
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (=>
  (>
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@236@01 ret@121@01))
    0)
  (and
    (>
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@236@01 ret@121@01))
      0)
    (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_%precondition $t@256@01 ret@254@01)
    (m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$%precondition ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@256@01 ret@254@01)))))
(assert (or
  (>
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@236@01 ret@121@01))
    0)
  (not
    (>
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@236@01 ret@121@01))
      0))))
(assert (or
  (not
    (>
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@236@01 ret@121@01))
      0))
  (m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@256@01 ret@254@01))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@258@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@258@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@258@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@258@01))))
  $Snap.unit))
; [eval] !(old[l62](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_51.val_ref))) > 0) || m_TrustedOption$$peek__$TY$__Snap$m_TrustedOption$_beg_$_end_$$int$(snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_(_50)) == old[l62](m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_51.val_ref), 0))
; [eval] !(old[l62](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_51.val_ref))) > 0)
; [eval] old[l62](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_51.val_ref))) > 0
; [eval] old[l62](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_51.val_ref)))
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_51.val_ref))
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_51.val_ref)
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
; 0.00s
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
(pop) ; 11
; Joined path conditions
(set-option :timeout 0)
(push) ; 11
(pop) ; 11
; Joined path conditions
(push) ; 11
; [then-branch: 67 | !(m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@236@01, ret@121@01)) > 0) | live]
; [else-branch: 67 | m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@236@01, ret@121@01)) > 0 | live]
(push) ; 12
; [then-branch: 67 | !(m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@236@01, ret@121@01)) > 0)]
(assert (not
  (>
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@236@01 ret@121@01))
    0)))
(pop) ; 12
(push) ; 12
; [else-branch: 67 | m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@236@01, ret@121@01)) > 0]
(assert (>
  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@236@01 ret@121@01))
  0))
; [eval] m_TrustedOption$$peek__$TY$__Snap$m_TrustedOption$_beg_$_end_$$int$(snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_(_50)) == old[l62](m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_51.val_ref), 0))
; [eval] m_TrustedOption$$peek__$TY$__Snap$m_TrustedOption$_beg_$_end_$$int$(snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_(_50))
; [eval] snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_(_50)
(push) ; 13
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
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
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
(assert (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_%precondition $t@256@01 ret@254@01))
(pop) ; 13
; Joined path conditions
(assert (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_%precondition $t@256@01 ret@254@01))
(set-option :timeout 0)
(push) ; 13
; [eval] m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$(_1)
(push) ; 14
(assert (m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@256@01 ret@254@01)))
(pop) ; 14
; Joined path conditions
(assert (m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@256@01 ret@254@01)))
(push) ; 14
(assert (not (m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$ ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@256@01 ret@254@01))))
(check-sat)
; unsat
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(assert (m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$ ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@256@01 ret@254@01)))
(assert (m_TrustedOption$$peek__$TY$__Snap$m_TrustedOption$_beg_$_end_$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@256@01 ret@254@01)))
(pop) ; 13
; Joined path conditions
(assert (and
  (m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$%precondition ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@256@01 ret@254@01))
  (m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@256@01 ret@254@01))
  (m_TrustedOption$$peek__$TY$__Snap$m_TrustedOption$_beg_$_end_$$int$%precondition ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@256@01 ret@254@01))))
; [eval] old[l62](m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_51.val_ref), 0))
; [eval] m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_51.val_ref), 0)
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_51.val_ref)
(push) ; 13
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
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
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
(pop) ; 13
; Joined path conditions
(set-option :timeout 0)
(push) ; 13
; [eval] 0 <= _2
; [eval] _2 < m_List$$len__$TY$__Snap$struct$m_List$$int$(_1)
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(_1)
(push) ; 14
(pop) ; 14
; Joined path conditions
(push) ; 14
(assert (not (<
  0
  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@236@01 ret@121@01)))))
(check-sat)
; unsat
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(assert (<
  0
  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@236@01 ret@121@01))))
; [eval] 0 <= _2
(assert (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@236@01 ret@121@01) 0))
(pop) ; 13
; Joined path conditions
(assert (and
  (<
    0
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@236@01 ret@121@01)))
  (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@236@01 ret@121@01) 0)))
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (=>
  (>
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@236@01 ret@121@01))
    0)
  (and
    (>
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@236@01 ret@121@01))
      0)
    (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_%precondition $t@256@01 ret@254@01)
    (m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$%precondition ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@256@01 ret@254@01))
    (m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@256@01 ret@254@01))
    (m_TrustedOption$$peek__$TY$__Snap$m_TrustedOption$_beg_$_end_$$int$%precondition ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@256@01 ret@254@01))
    (<
      0
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@236@01 ret@121@01)))
    (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
      $Snap.unit
      ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@236@01 ret@121@01) 0))))
(assert (or
  (not
    (>
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@236@01 ret@121@01))
      0))
  (=
    (m_TrustedOption$$peek__$TY$__Snap$m_TrustedOption$_beg_$_end_$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@256@01 ret@254@01))
    (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$ ($Snap.combine
      $Snap.unit
      ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@236@01 ret@121@01) 0))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@258@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@258@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@258@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@258@01)))))
  $Snap.unit))
; [eval] !(old[l62](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_51.val_ref))) > 0) || m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l62](_51.val_ref))) == old[l62](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_51.val_ref)) - 1)
; [eval] !(old[l62](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_51.val_ref))) > 0)
; [eval] old[l62](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_51.val_ref))) > 0
; [eval] old[l62](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_51.val_ref)))
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_51.val_ref))
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_51.val_ref)
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
(pop) ; 11
; Joined path conditions
(set-option :timeout 0)
(push) ; 11
(pop) ; 11
; Joined path conditions
(push) ; 11
; [then-branch: 68 | !(m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@236@01, ret@121@01)) > 0) | live]
; [else-branch: 68 | m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@236@01, ret@121@01)) > 0 | live]
(push) ; 12
; [then-branch: 68 | !(m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@236@01, ret@121@01)) > 0)]
(assert (not
  (>
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@236@01 ret@121@01))
    0)))
(pop) ; 12
(push) ; 12
; [else-branch: 68 | m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@236@01, ret@121@01)) > 0]
(assert (>
  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@236@01 ret@121@01))
  0))
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l62](_51.val_ref))) == old[l62](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_51.val_ref)) - 1)
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l62](_51.val_ref)))
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l62](_51.val_ref))
; [eval] old[l62](_51.val_ref)
(push) ; 13
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
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 14
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
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
(assert (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%precondition $t@255@01 ret@121@01))
(pop) ; 13
; Joined path conditions
(assert (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%precondition $t@255@01 ret@121@01))
(set-option :timeout 0)
(push) ; 13
(assert (m_List$$len__$TY$__Snap$struct$m_List$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@255@01 ret@121@01)))
(pop) ; 13
; Joined path conditions
(assert (m_List$$len__$TY$__Snap$struct$m_List$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@255@01 ret@121@01)))
; [eval] old[l62](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_51.val_ref)) - 1)
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_51.val_ref)) - 1
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_51.val_ref))
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_51.val_ref)
(push) ; 13
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
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 14
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
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
(pop) ; 13
; Joined path conditions
(set-option :timeout 0)
(push) ; 13
(pop) ; 13
; Joined path conditions
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (=>
  (>
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@236@01 ret@121@01))
    0)
  (and
    (>
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@236@01 ret@121@01))
      0)
    (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%precondition $t@255@01 ret@121@01)
    (m_List$$len__$TY$__Snap$struct$m_List$$int$%precondition ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@255@01 ret@121@01)))))
(assert (or
  (not
    (>
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@236@01 ret@121@01))
      0))
  (=
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@255@01 ret@121@01))
    (-
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@236@01 ret@121@01))
      1))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@258@01)))))
  $Snap.unit))
; [eval] !(old[l62](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_51.val_ref))) > 0) || (forall _0_quant_0: Int :: { m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l62](_51.val_ref)), _0_quant_0) } 0 <= _0_quant_0 ==> !(0 <= _0_quant_0) || (!(_0_quant_0 < m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l62](_51.val_ref)))) || old[l62](m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_51.val_ref), _0_quant_0 + 1)) == m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l62](_51.val_ref)), _0_quant_0)))
; [eval] !(old[l62](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_51.val_ref))) > 0)
; [eval] old[l62](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_51.val_ref))) > 0
; [eval] old[l62](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_51.val_ref)))
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_51.val_ref))
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_51.val_ref)
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
(pop) ; 11
; Joined path conditions
(set-option :timeout 0)
(push) ; 11
(pop) ; 11
; Joined path conditions
(push) ; 11
; [then-branch: 69 | !(m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@236@01, ret@121@01)) > 0) | live]
; [else-branch: 69 | m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@236@01, ret@121@01)) > 0 | live]
(push) ; 12
; [then-branch: 69 | !(m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@236@01, ret@121@01)) > 0)]
(assert (not
  (>
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@236@01 ret@121@01))
    0)))
(pop) ; 12
(push) ; 12
; [else-branch: 69 | m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@236@01, ret@121@01)) > 0]
(assert (>
  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@236@01 ret@121@01))
  0))
; [eval] (forall _0_quant_0: Int :: { m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l62](_51.val_ref)), _0_quant_0) } 0 <= _0_quant_0 ==> !(0 <= _0_quant_0) || (!(_0_quant_0 < m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l62](_51.val_ref)))) || old[l62](m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_51.val_ref), _0_quant_0 + 1)) == m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l62](_51.val_ref)), _0_quant_0)))
(declare-const _0_quant_0@259@01 Int)
(push) ; 13
; [eval] 0 <= _0_quant_0 ==> !(0 <= _0_quant_0) || (!(_0_quant_0 < m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l62](_51.val_ref)))) || old[l62](m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_51.val_ref), _0_quant_0 + 1)) == m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l62](_51.val_ref)), _0_quant_0))
; [eval] 0 <= _0_quant_0
(push) ; 14
; [then-branch: 70 | 0 <= _0_quant_0@259@01 | live]
; [else-branch: 70 | !(0 <= _0_quant_0@259@01) | live]
(push) ; 15
; [then-branch: 70 | 0 <= _0_quant_0@259@01]
(assert (<= 0 _0_quant_0@259@01))
; [eval] !(0 <= _0_quant_0) || (!(_0_quant_0 < m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l62](_51.val_ref)))) || old[l62](m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_51.val_ref), _0_quant_0 + 1)) == m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l62](_51.val_ref)), _0_quant_0))
; [eval] !(0 <= _0_quant_0)
; [eval] 0 <= _0_quant_0
(push) ; 16
; [then-branch: 71 | !(0 <= _0_quant_0@259@01) | live]
; [else-branch: 71 | 0 <= _0_quant_0@259@01 | live]
(push) ; 17
; [then-branch: 71 | !(0 <= _0_quant_0@259@01)]
(assert (not (<= 0 _0_quant_0@259@01)))
(pop) ; 17
(push) ; 17
; [else-branch: 71 | 0 <= _0_quant_0@259@01]
; [eval] !(_0_quant_0 < m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l62](_51.val_ref))))
; [eval] _0_quant_0 < m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l62](_51.val_ref)))
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l62](_51.val_ref)))
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l62](_51.val_ref))
; [eval] old[l62](_51.val_ref)
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
(assert (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%precondition $t@255@01 ret@121@01))
(pop) ; 18
; Joined path conditions
(assert (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%precondition $t@255@01 ret@121@01))
(set-option :timeout 0)
(push) ; 18
(assert (m_List$$len__$TY$__Snap$struct$m_List$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@255@01 ret@121@01)))
(pop) ; 18
; Joined path conditions
(assert (m_List$$len__$TY$__Snap$struct$m_List$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@255@01 ret@121@01)))
(push) ; 18
; [then-branch: 72 | !(_0_quant_0@259@01 < m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@255@01, ret@121@01))) | live]
; [else-branch: 72 | _0_quant_0@259@01 < m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@255@01, ret@121@01)) | live]
(push) ; 19
; [then-branch: 72 | !(_0_quant_0@259@01 < m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@255@01, ret@121@01)))]
(assert (not
  (<
    _0_quant_0@259@01
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@255@01 ret@121@01)))))
(pop) ; 19
(push) ; 19
; [else-branch: 72 | _0_quant_0@259@01 < m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@255@01, ret@121@01))]
(assert (<
  _0_quant_0@259@01
  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@255@01 ret@121@01))))
; [eval] old[l62](m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_51.val_ref), _0_quant_0 + 1)) == m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l62](_51.val_ref)), _0_quant_0)
; [eval] old[l62](m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_51.val_ref), _0_quant_0 + 1))
; [eval] m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_51.val_ref), _0_quant_0 + 1)
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_51.val_ref)
(push) ; 20
; [eval] read$()
(push) ; 21
(pop) ; 21
; Joined path conditions
(push) ; 21
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(push) ; 21
(set-option :timeout 10)
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 21
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
(check-sat)
; unsat
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(push) ; 21
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(pop) ; 20
; Joined path conditions
; [eval] _0_quant_0 + 1
(set-option :timeout 0)
(push) ; 20
; [eval] 0 <= _2
(push) ; 21
(assert (not (<= 0 (+ _0_quant_0@259@01 1))))
(check-sat)
; unsat
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(assert (<= 0 (+ _0_quant_0@259@01 1)))
; [eval] _2 < m_List$$len__$TY$__Snap$struct$m_List$$int$(_1)
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(_1)
(push) ; 21
(pop) ; 21
; Joined path conditions
(push) ; 21
(assert (not (<
  (+ _0_quant_0@259@01 1)
  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@236@01 ret@121@01)))))
(check-sat)
; unsat
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(assert (<
  (+ _0_quant_0@259@01 1)
  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@236@01 ret@121@01))))
; [eval] 0 <= _2
(assert (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@236@01 ret@121@01) (+
  _0_quant_0@259@01
  1)))
(pop) ; 20
; Joined path conditions
(assert (and
  (<= 0 (+ _0_quant_0@259@01 1))
  (<
    (+ _0_quant_0@259@01 1)
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@236@01 ret@121@01)))
  (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@236@01 ret@121@01) (+
    _0_quant_0@259@01
    1))))
; [eval] m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l62](_51.val_ref)), _0_quant_0)
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l62](_51.val_ref))
; [eval] old[l62](_51.val_ref)
(push) ; 20
; [eval] read$()
(push) ; 21
(pop) ; 21
; Joined path conditions
(push) ; 21
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(push) ; 21
(set-option :timeout 10)
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 21
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
(check-sat)
; unsat
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(push) ; 21
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(pop) ; 20
; Joined path conditions
(set-option :timeout 0)
(push) ; 20
; [eval] 0 <= _2
; [eval] _2 < m_List$$len__$TY$__Snap$struct$m_List$$int$(_1)
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(_1)
(push) ; 21
(pop) ; 21
; Joined path conditions
; [eval] 0 <= _2
(assert (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@255@01 ret@121@01) _0_quant_0@259@01))
(pop) ; 20
; Joined path conditions
(assert (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@255@01 ret@121@01) _0_quant_0@259@01))
(pop) ; 19
(pop) ; 18
; Joined path conditions
; Joined path conditions
(assert (=>
  (<
    _0_quant_0@259@01
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@255@01 ret@121@01)))
  (and
    (<
      _0_quant_0@259@01
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@255@01 ret@121@01)))
    (<= 0 (+ _0_quant_0@259@01 1))
    (<
      (+ _0_quant_0@259@01 1)
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@236@01 ret@121@01)))
    (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
      $Snap.unit
      ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@236@01 ret@121@01) (+
      _0_quant_0@259@01
      1))
    (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
      $Snap.unit
      ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@255@01 ret@121@01) _0_quant_0@259@01))))
(assert (or
  (<
    _0_quant_0@259@01
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@255@01 ret@121@01)))
  (not
    (<
      _0_quant_0@259@01
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@255@01 ret@121@01))))))
(pop) ; 17
(pop) ; 16
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 _0_quant_0@259@01)
  (and
    (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%precondition $t@255@01 ret@121@01)
    (m_List$$len__$TY$__Snap$struct$m_List$$int$%precondition ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@255@01 ret@121@01))
    (=>
      (<
        _0_quant_0@259@01
        (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
          $Snap.unit
          $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@255@01 ret@121@01)))
      (and
        (<
          _0_quant_0@259@01
          (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
            $Snap.unit
            $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@255@01 ret@121@01)))
        (<= 0 (+ _0_quant_0@259@01 1))
        (<
          (+ _0_quant_0@259@01 1)
          (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
            $Snap.unit
            $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@236@01 ret@121@01)))
        (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@236@01 ret@121@01) (+
          _0_quant_0@259@01
          1))
        (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@255@01 ret@121@01) _0_quant_0@259@01)))
    (or
      (<
        _0_quant_0@259@01
        (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
          $Snap.unit
          $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@255@01 ret@121@01)))
      (not
        (<
          _0_quant_0@259@01
          (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
            $Snap.unit
            $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@255@01 ret@121@01))))))))
(assert (or (<= 0 _0_quant_0@259@01) (not (<= 0 _0_quant_0@259@01))))
(pop) ; 15
(push) ; 15
; [else-branch: 70 | !(0 <= _0_quant_0@259@01)]
(assert (not (<= 0 _0_quant_0@259@01)))
(pop) ; 15
(pop) ; 14
; Joined path conditions
(assert (=>
  (<= 0 _0_quant_0@259@01)
  (and
    (<= 0 _0_quant_0@259@01)
    (=>
      (<= 0 _0_quant_0@259@01)
      (and
        (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%precondition $t@255@01 ret@121@01)
        (m_List$$len__$TY$__Snap$struct$m_List$$int$%precondition ($Snap.combine
          $Snap.unit
          $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@255@01 ret@121@01))
        (=>
          (<
            _0_quant_0@259@01
            (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
              $Snap.unit
              $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@255@01 ret@121@01)))
          (and
            (<
              _0_quant_0@259@01
              (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                $Snap.unit
                $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@255@01 ret@121@01)))
            (<= 0 (+ _0_quant_0@259@01 1))
            (<
              (+ _0_quant_0@259@01 1)
              (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                $Snap.unit
                $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@236@01 ret@121@01)))
            (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@236@01 ret@121@01) (+
              _0_quant_0@259@01
              1))
            (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@255@01 ret@121@01) _0_quant_0@259@01)))
        (or
          (<
            _0_quant_0@259@01
            (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
              $Snap.unit
              $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@255@01 ret@121@01)))
          (not
            (<
              _0_quant_0@259@01
              (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                $Snap.unit
                $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@255@01 ret@121@01)))))))
    (or (<= 0 _0_quant_0@259@01) (not (<= 0 _0_quant_0@259@01))))))
; Joined path conditions
(assert (or (not (<= 0 _0_quant_0@259@01)) (<= 0 _0_quant_0@259@01)))
(pop) ; 13
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((_0_quant_0@259@01 Int)) (!
  (and
    (=>
      (<= 0 _0_quant_0@259@01)
      (and
        (<= 0 _0_quant_0@259@01)
        (=>
          (<= 0 _0_quant_0@259@01)
          (and
            (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%precondition $t@255@01 ret@121@01)
            (m_List$$len__$TY$__Snap$struct$m_List$$int$%precondition ($Snap.combine
              $Snap.unit
              $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@255@01 ret@121@01))
            (=>
              (<
                _0_quant_0@259@01
                (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                  $Snap.unit
                  $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@255@01 ret@121@01)))
              (and
                (<
                  _0_quant_0@259@01
                  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                    $Snap.unit
                    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@255@01 ret@121@01)))
                (<= 0 (+ _0_quant_0@259@01 1))
                (<
                  (+ _0_quant_0@259@01 1)
                  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                    $Snap.unit
                    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@236@01 ret@121@01)))
                (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@236@01 ret@121@01) (+
                  _0_quant_0@259@01
                  1))
                (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@255@01 ret@121@01) _0_quant_0@259@01)))
            (or
              (<
                _0_quant_0@259@01
                (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                  $Snap.unit
                  $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@255@01 ret@121@01)))
              (not
                (<
                  _0_quant_0@259@01
                  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                    $Snap.unit
                    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@255@01 ret@121@01)))))))
        (or (<= 0 _0_quant_0@259@01) (not (<= 0 _0_quant_0@259@01)))))
    (or (not (<= 0 _0_quant_0@259@01)) (<= 0 _0_quant_0@259@01)))
  :pattern ((m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%limited ($Snap.combine
    $Snap.unit
    ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@255@01 ret@121@01) _0_quant_0@259@01))
  :qid |prog.l1158-aux|)))
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (=>
  (>
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@236@01 ret@121@01))
    0)
  (and
    (>
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@236@01 ret@121@01))
      0)
    (forall ((_0_quant_0@259@01 Int)) (!
      (and
        (=>
          (<= 0 _0_quant_0@259@01)
          (and
            (<= 0 _0_quant_0@259@01)
            (=>
              (<= 0 _0_quant_0@259@01)
              (and
                (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%precondition $t@255@01 ret@121@01)
                (m_List$$len__$TY$__Snap$struct$m_List$$int$%precondition ($Snap.combine
                  $Snap.unit
                  $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@255@01 ret@121@01))
                (=>
                  (<
                    _0_quant_0@259@01
                    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                      $Snap.unit
                      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@255@01 ret@121@01)))
                  (and
                    (<
                      _0_quant_0@259@01
                      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                        $Snap.unit
                        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@255@01 ret@121@01)))
                    (<= 0 (+ _0_quant_0@259@01 1))
                    (<
                      (+ _0_quant_0@259@01 1)
                      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                        $Snap.unit
                        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@236@01 ret@121@01)))
                    (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
                      $Snap.unit
                      ($Snap.combine
                        $Snap.unit
                        ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@236@01 ret@121@01) (+
                      _0_quant_0@259@01
                      1))
                    (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
                      $Snap.unit
                      ($Snap.combine
                        $Snap.unit
                        ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@255@01 ret@121@01) _0_quant_0@259@01)))
                (or
                  (<
                    _0_quant_0@259@01
                    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                      $Snap.unit
                      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@255@01 ret@121@01)))
                  (not
                    (<
                      _0_quant_0@259@01
                      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                        $Snap.unit
                        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@255@01 ret@121@01)))))))
            (or (<= 0 _0_quant_0@259@01) (not (<= 0 _0_quant_0@259@01)))))
        (or (not (<= 0 _0_quant_0@259@01)) (<= 0 _0_quant_0@259@01)))
      :pattern ((m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%limited ($Snap.combine
        $Snap.unit
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@255@01 ret@121@01) _0_quant_0@259@01))
      :qid |prog.l1158-aux|)))))
(assert (or
  (not
    (>
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@236@01 ret@121@01))
      0))
  (forall ((_0_quant_0@259@01 Int)) (!
    (=>
      (<= 0 _0_quant_0@259@01)
      (or
        (not (<= 0 _0_quant_0@259@01))
        (or
          (not
            (<
              _0_quant_0@259@01
              (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                $Snap.unit
                $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@255@01 ret@121@01))))
          (=
            (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$ ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@236@01 ret@121@01) (+
              _0_quant_0@259@01
              1))
            (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$ ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@255@01 ret@121@01) _0_quant_0@259@01)))))
    :pattern ((m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%limited ($Snap.combine
      $Snap.unit
      ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@255@01 ret@121@01) _0_quant_0@259@01))
    :qid |prog.l1158|))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; label l63
; [exec]
; __t29 := true
; [exec]
; _52 := builtin$havoc_int()
(declare-const ret@260@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _52 := m_TrustedOption$_beg_$_end_$$discriminant$$__$TY$__m_TrustedOption$_beg_$_end_$$int$(_50)
; [eval] m_TrustedOption$_beg_$_end_$$discriminant$$__$TY$__m_TrustedOption$_beg_$_end_$$int$(_50)
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
; 0.00s
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
(assert (m_TrustedOption$_beg_$_end_$$discriminant$$__$TY$__m_TrustedOption$_beg_$_end_$$int$%precondition $t@256@01 ret@254@01))
(pop) ; 11
; Joined path conditions
(assert (m_TrustedOption$_beg_$_end_$$discriminant$$__$TY$__m_TrustedOption$_beg_$_end_$$int$%precondition $t@256@01 ret@254@01))
(declare-const _52@261@01 Int)
(assert (=
  _52@261@01
  (m_TrustedOption$_beg_$_end_$$discriminant$$__$TY$__m_TrustedOption$_beg_$_end_$$int$ $t@256@01 ret@254@01)))
; [exec]
; __t53 := _52
; [eval] __t53 == 0
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (not (= _52@261@01 0))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= _52@261@01 0)))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [then-branch: 73 | _52@261@01 == 0 | live]
; [else-branch: 73 | _52@261@01 != 0 | dead]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 73 | _52@261@01 == 0]
(assert (= _52@261@01 0))
; [exec]
; label l14
; [exec]
; __t31 := true
; [exec]
; __t32 := true
; [exec]
; _53 := builtin$havoc_int()
(declare-const ret@262@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; unfold acc(m_TrustedOption$_beg_$_end_(_50), write)
(assert (= $t@256@01 ($Snap.combine ($Snap.first $t@256@01) ($Snap.second $t@256@01))))
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@235@01 ret@254@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@196@01 ret@254@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@177@01 ret@254@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@254@01 $Ref.null)))
(assert (=
  ($Snap.second $t@256@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@256@01))
    ($Snap.second ($Snap.second $t@256@01)))))
(assert (= ($Snap.first ($Snap.second $t@256@01)) $Snap.unit))
; [eval] 0 <= self.discriminant
(assert (<= 0 ($SortWrappers.$SnapToInt ($Snap.first $t@256@01))))
(assert (=
  ($Snap.second ($Snap.second $t@256@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@256@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@256@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@256@01))) $Snap.unit))
; [eval] self.discriminant <= 1
(assert (<= ($SortWrappers.$SnapToInt ($Snap.first $t@256@01)) 1))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@256@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@256@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@256@01)))))))
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@235@01 ret@254@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@196@01 ret@254@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@177@01 ret@254@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (m_TrustedOption$_beg_$_end_%trigger $t@256@01 ret@254@01))
; [exec]
; unfold acc(m_TrustedOption$_beg_$_end_Some(_50.enum_Some), write)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@256@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@256@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@256@01))))))))
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@237@01)))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@256@01))))))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@198@01)))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@256@01))))))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@179@01)))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@256@01))))))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@256@01)))))
    $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (m_TrustedOption$_beg_$_end_Some%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@256@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@256@01)))))))
; [exec]
; unfold acc(i32(_50.enum_Some.f$0), write)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@237@01))))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@256@01)))))))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@198@01))))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@256@01)))))))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@179@01))))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@256@01)))))))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@256@01))))))
    $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (i32%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@256@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@256@01))))))))
; [exec]
; _53 := _50.enum_Some.f$0.val_int
(declare-const _53@263@01 Int)
(assert (=
  _53@263@01
  ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@256@01))))))))
; [exec]
; label l67
; [exec]
; _56 := builtin$havoc_int()
(declare-const ret@264@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _56 := _53
; [exec]
; label l68
; [exec]
; _55 := builtin$havoc_ref()
(declare-const ret@265@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; inhale acc(_55.val_bool, write)
(declare-const $t@266@01 Bool)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@142@01 ret@265@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@137@01 ret@265@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@188@01 ret@265@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@191@01 ret@265@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@207@01 ret@265@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@210@01 ret@265@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@246@01 ret@265@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@249@01 ret@265@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@265@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _55.val_bool := _56 == 4
; [eval] _56 == 4
(declare-const val_bool@267@01 Bool)
(assert (= val_bool@267@01 (= _53@263@01 4)))
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@249@01 ret@265@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@246@01 ret@265@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@210@01 ret@265@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@207@01 ret@265@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@191@01 ret@265@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@188@01 ret@265@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@137@01 ret@265@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@142@01 ret@265@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [exec]
; _54 := builtin$havoc_ref()
(declare-const ret@268@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_54.val_bool, write)
(declare-const $t@269@01 Bool)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@142@01 ret@268@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@137@01 ret@268@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@188@01 ret@268@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@191@01 ret@268@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@207@01 ret@268@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@210@01 ret@268@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@246@01 ret@268@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@249@01 ret@268@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@265@01 ret@268@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@268@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _54.val_bool := !_55.val_bool
; [eval] !_55.val_bool
(declare-const val_bool@270@01 Bool)
(assert (= val_bool@270@01 (not val_bool@267@01)))
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@265@01 ret@268@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@249@01 ret@268@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@246@01 ret@268@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@210@01 ret@268@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@207@01 ret@268@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@191@01 ret@268@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@188@01 ret@268@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@137@01 ret@268@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@142@01 ret@268@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t54 := _54.val_bool
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (not val_bool@270@01)))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [then-branch: 74 | val_bool@270@01 | dead]
; [else-branch: 74 | !(val_bool@270@01) | live]
(set-option :timeout 0)
(push) ; 12
; [else-branch: 74 | !(val_bool@270@01)]
(assert (not val_bool@270@01))
(pop) ; 12
; [eval] !__t54
(push) ; 12
(set-option :timeout 10)
(assert (not val_bool@270@01))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (not val_bool@270@01)))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [then-branch: 75 | !(val_bool@270@01) | live]
; [else-branch: 75 | val_bool@270@01 | dead]
(set-option :timeout 0)
(push) ; 12
; [then-branch: 75 | !(val_bool@270@01)]
(assert (not val_bool@270@01))
; [exec]
; label bb6
; [exec]
; __t34 := true
; [exec]
; _61 := builtin$havoc_ref()
(declare-const ret@271@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_61.val_ref, write)
(declare-const $t@272@01 $Ref)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@133@01 ret@271@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@271@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _61.val_ref := _1
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@133@01 ret@271@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
; [exec]
; label l71
; [exec]
; label l72
; [exec]
; assert true
; [exec]
; exhale acc(_61.val_ref, write) && acc(struct$m_List(_61.val_ref), write)
; [exec]
; _60 := builtin$havoc_ref()
(declare-const ret@273@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(struct$m_List(old[l72](_61.val_ref)), write)
; [eval] old[l72](_61.val_ref)
(declare-const $t@274@01 $Snap)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(m_TrustedOption$_beg_$_end_(_60), write)
(declare-const $t@275@01 $Snap)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@127@01 ret@273@01)))
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
; inhale true
(declare-const $t@276@01 $Snap)
(assert (= $t@276@01 $Snap.unit))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale (!(old[l72](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_61.val_ref))) ==
;   0) ||
;   m_TrustedOption$$is_none__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$(snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_(_60))) &&
;   ((!(old[l72](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_61.val_ref))) ==
;   0) ||
;   m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l72](_61.val_ref))) ==
;   0) &&
;   ((!(old[l72](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_61.val_ref))) >
;   0) ||
;   m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$(snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_(_60))) &&
;   ((!(old[l72](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_61.val_ref))) >
;   0) ||
;   m_TrustedOption$$peek__$TY$__Snap$m_TrustedOption$_beg_$_end_$$int$(snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_(_60)) ==
;   old[l72](m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_61.val_ref),
;   0))) &&
;   ((!(old[l72](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_61.val_ref))) >
;   0) ||
;   m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l72](_61.val_ref))) ==
;   old[l72](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_61.val_ref)) -
;   1)) &&
;   (!(old[l72](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_61.val_ref))) >
;   0) ||
;   (forall _0_quant_0: Int ::
;     { m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l72](_61.val_ref)),
;     _0_quant_0) }
;     0 <= _0_quant_0 ==>
;     !(0 <= _0_quant_0) ||
;     (!(_0_quant_0 <
;     m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l72](_61.val_ref)))) ||
;     old[l72](m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_61.val_ref),
;     _0_quant_0 + 1)) ==
;     m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l72](_61.val_ref)),
;     _0_quant_0))))))))
(declare-const $t@277@01 $Snap)
(assert (= $t@277@01 ($Snap.combine ($Snap.first $t@277@01) ($Snap.second $t@277@01))))
(assert (= ($Snap.first $t@277@01) $Snap.unit))
; [eval] !(old[l72](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_61.val_ref))) == 0) || m_TrustedOption$$is_none__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$(snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_(_60))
; [eval] !(old[l72](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_61.val_ref))) == 0)
; [eval] old[l72](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_61.val_ref))) == 0
; [eval] old[l72](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_61.val_ref)))
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_61.val_ref))
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_61.val_ref)
(set-option :timeout 0)
(push) ; 13
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
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
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
(assert (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%precondition $t@255@01 ret@121@01))
(pop) ; 13
; Joined path conditions
(assert (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%precondition $t@255@01 ret@121@01))
(set-option :timeout 0)
(push) ; 13
(assert (m_List$$len__$TY$__Snap$struct$m_List$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@255@01 ret@121@01)))
(pop) ; 13
; Joined path conditions
(assert (m_List$$len__$TY$__Snap$struct$m_List$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@255@01 ret@121@01)))
(push) ; 13
; [then-branch: 76 | m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@255@01, ret@121@01)) != 0 | live]
; [else-branch: 76 | m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@255@01, ret@121@01)) == 0 | live]
(push) ; 14
; [then-branch: 76 | m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@255@01, ret@121@01)) != 0]
(assert (not
  (=
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@255@01 ret@121@01))
    0)))
(pop) ; 14
(push) ; 14
; [else-branch: 76 | m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@255@01, ret@121@01)) == 0]
(assert (=
  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@255@01 ret@121@01))
  0))
; [eval] m_TrustedOption$$is_none__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$(snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_(_60))
; [eval] snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_(_60)
(push) ; 15
; [eval] read$()
(push) ; 16
(pop) ; 16
; Joined path conditions
(push) ; 16
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(push) ; 16
(set-option :timeout 10)
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unsat
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
(check-sat)
; unsat
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(push) ; 16
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(assert (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_%precondition $t@275@01 ret@273@01))
(pop) ; 15
; Joined path conditions
(assert (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_%precondition $t@275@01 ret@273@01))
(set-option :timeout 0)
(push) ; 15
(assert (m_TrustedOption$$is_none__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@275@01 ret@273@01)))
(pop) ; 15
; Joined path conditions
(assert (m_TrustedOption$$is_none__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@275@01 ret@273@01)))
(pop) ; 14
(pop) ; 13
; Joined path conditions
; Joined path conditions
(assert (=>
  (=
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@255@01 ret@121@01))
    0)
  (and
    (=
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@255@01 ret@121@01))
      0)
    (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_%precondition $t@275@01 ret@273@01)
    (m_TrustedOption$$is_none__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$%precondition ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@275@01 ret@273@01)))))
(assert (or
  (=
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@255@01 ret@121@01))
    0)
  (not
    (=
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@255@01 ret@121@01))
      0))))
(assert (or
  (not
    (=
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@255@01 ret@121@01))
      0))
  (m_TrustedOption$$is_none__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@275@01 ret@273@01))))
(assert (=
  ($Snap.second $t@277@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@277@01))
    ($Snap.second ($Snap.second $t@277@01)))))
(assert (= ($Snap.first ($Snap.second $t@277@01)) $Snap.unit))
; [eval] !(old[l72](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_61.val_ref))) == 0) || m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l72](_61.val_ref))) == 0
; [eval] !(old[l72](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_61.val_ref))) == 0)
; [eval] old[l72](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_61.val_ref))) == 0
; [eval] old[l72](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_61.val_ref)))
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_61.val_ref))
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_61.val_ref)
(push) ; 13
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
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
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
(pop) ; 13
; Joined path conditions
(set-option :timeout 0)
(push) ; 13
(pop) ; 13
; Joined path conditions
(push) ; 13
; [then-branch: 77 | m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@255@01, ret@121@01)) != 0 | live]
; [else-branch: 77 | m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@255@01, ret@121@01)) == 0 | live]
(push) ; 14
; [then-branch: 77 | m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@255@01, ret@121@01)) != 0]
(assert (not
  (=
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@255@01 ret@121@01))
    0)))
(pop) ; 14
(push) ; 14
; [else-branch: 77 | m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@255@01, ret@121@01)) == 0]
(assert (=
  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@255@01 ret@121@01))
  0))
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l72](_61.val_ref))) == 0
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l72](_61.val_ref)))
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l72](_61.val_ref))
; [eval] old[l72](_61.val_ref)
(push) ; 15
; [eval] read$()
(push) ; 16
(pop) ; 16
; Joined path conditions
(push) ; 16
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(push) ; 16
(set-option :timeout 10)
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unsat
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
(check-sat)
; unsat
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(push) ; 16
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(assert (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%precondition $t@274@01 ret@121@01))
(pop) ; 15
; Joined path conditions
(assert (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%precondition $t@274@01 ret@121@01))
(set-option :timeout 0)
(push) ; 15
(assert (m_List$$len__$TY$__Snap$struct$m_List$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@274@01 ret@121@01)))
(pop) ; 15
; Joined path conditions
(assert (m_List$$len__$TY$__Snap$struct$m_List$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@274@01 ret@121@01)))
(pop) ; 14
(pop) ; 13
; Joined path conditions
; Joined path conditions
(assert (=>
  (=
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@255@01 ret@121@01))
    0)
  (and
    (=
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@255@01 ret@121@01))
      0)
    (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%precondition $t@274@01 ret@121@01)
    (m_List$$len__$TY$__Snap$struct$m_List$$int$%precondition ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@274@01 ret@121@01)))))
(assert (or
  (not
    (=
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@255@01 ret@121@01))
      0))
  (=
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@274@01 ret@121@01))
    0)))
(assert (=
  ($Snap.second ($Snap.second $t@277@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@277@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@277@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@277@01))) $Snap.unit))
; [eval] !(old[l72](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_61.val_ref))) > 0) || m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$(snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_(_60))
; [eval] !(old[l72](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_61.val_ref))) > 0)
; [eval] old[l72](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_61.val_ref))) > 0
; [eval] old[l72](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_61.val_ref)))
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_61.val_ref))
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_61.val_ref)
(push) ; 13
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
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
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
(pop) ; 13
; Joined path conditions
(set-option :timeout 0)
(push) ; 13
(pop) ; 13
; Joined path conditions
(push) ; 13
; [then-branch: 78 | !(m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@255@01, ret@121@01)) > 0) | live]
; [else-branch: 78 | m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@255@01, ret@121@01)) > 0 | live]
(push) ; 14
; [then-branch: 78 | !(m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@255@01, ret@121@01)) > 0)]
(assert (not
  (>
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@255@01 ret@121@01))
    0)))
(pop) ; 14
(push) ; 14
; [else-branch: 78 | m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@255@01, ret@121@01)) > 0]
(assert (>
  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@255@01 ret@121@01))
  0))
; [eval] m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$(snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_(_60))
; [eval] snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_(_60)
(push) ; 15
; [eval] read$()
(push) ; 16
(pop) ; 16
; Joined path conditions
(push) ; 16
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(push) ; 16
(set-option :timeout 10)
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
(check-sat)
; unsat
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(push) ; 16
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(assert (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_%precondition $t@275@01 ret@273@01))
(pop) ; 15
; Joined path conditions
(assert (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_%precondition $t@275@01 ret@273@01))
(set-option :timeout 0)
(push) ; 15
(assert (m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@275@01 ret@273@01)))
(pop) ; 15
; Joined path conditions
(assert (m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@275@01 ret@273@01)))
(pop) ; 14
(pop) ; 13
; Joined path conditions
; Joined path conditions
(assert (=>
  (>
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@255@01 ret@121@01))
    0)
  (and
    (>
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@255@01 ret@121@01))
      0)
    (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_%precondition $t@275@01 ret@273@01)
    (m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$%precondition ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@275@01 ret@273@01)))))
(assert (or
  (>
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@255@01 ret@121@01))
    0)
  (not
    (>
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@255@01 ret@121@01))
      0))))
(assert (or
  (not
    (>
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@255@01 ret@121@01))
      0))
  (m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@275@01 ret@273@01))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@277@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@277@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@277@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@277@01))))
  $Snap.unit))
; [eval] !(old[l72](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_61.val_ref))) > 0) || m_TrustedOption$$peek__$TY$__Snap$m_TrustedOption$_beg_$_end_$$int$(snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_(_60)) == old[l72](m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_61.val_ref), 0))
; [eval] !(old[l72](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_61.val_ref))) > 0)
; [eval] old[l72](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_61.val_ref))) > 0
; [eval] old[l72](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_61.val_ref)))
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_61.val_ref))
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_61.val_ref)
(push) ; 13
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
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 14
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
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
(pop) ; 13
; Joined path conditions
(set-option :timeout 0)
(push) ; 13
(pop) ; 13
; Joined path conditions
(push) ; 13
; [then-branch: 79 | !(m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@255@01, ret@121@01)) > 0) | live]
; [else-branch: 79 | m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@255@01, ret@121@01)) > 0 | live]
(push) ; 14
; [then-branch: 79 | !(m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@255@01, ret@121@01)) > 0)]
(assert (not
  (>
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@255@01 ret@121@01))
    0)))
(pop) ; 14
(push) ; 14
; [else-branch: 79 | m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@255@01, ret@121@01)) > 0]
(assert (>
  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@255@01 ret@121@01))
  0))
; [eval] m_TrustedOption$$peek__$TY$__Snap$m_TrustedOption$_beg_$_end_$$int$(snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_(_60)) == old[l72](m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_61.val_ref), 0))
; [eval] m_TrustedOption$$peek__$TY$__Snap$m_TrustedOption$_beg_$_end_$$int$(snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_(_60))
; [eval] snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_(_60)
(push) ; 15
; [eval] read$()
(push) ; 16
(pop) ; 16
; Joined path conditions
(push) ; 16
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(push) ; 16
(set-option :timeout 10)
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
(check-sat)
; unsat
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(push) ; 16
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(assert (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_%precondition $t@275@01 ret@273@01))
(pop) ; 15
; Joined path conditions
(assert (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_%precondition $t@275@01 ret@273@01))
(set-option :timeout 0)
(push) ; 15
; [eval] m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$(_1)
(push) ; 16
(assert (m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@275@01 ret@273@01)))
(pop) ; 16
; Joined path conditions
(assert (m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@275@01 ret@273@01)))
(push) ; 16
(assert (not (m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$ ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@275@01 ret@273@01))))
(check-sat)
; unsat
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(assert (m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$ ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@275@01 ret@273@01)))
(assert (m_TrustedOption$$peek__$TY$__Snap$m_TrustedOption$_beg_$_end_$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@275@01 ret@273@01)))
(pop) ; 15
; Joined path conditions
(assert (and
  (m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$%precondition ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@275@01 ret@273@01))
  (m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@275@01 ret@273@01))
  (m_TrustedOption$$peek__$TY$__Snap$m_TrustedOption$_beg_$_end_$$int$%precondition ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@275@01 ret@273@01))))
; [eval] old[l72](m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_61.val_ref), 0))
; [eval] m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_61.val_ref), 0)
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_61.val_ref)
(push) ; 15
; [eval] read$()
(push) ; 16
(pop) ; 16
; Joined path conditions
(push) ; 16
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(push) ; 16
(set-option :timeout 10)
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 16
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
(check-sat)
; unsat
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(push) ; 16
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(pop) ; 15
; Joined path conditions
(set-option :timeout 0)
(push) ; 15
; [eval] 0 <= _2
; [eval] _2 < m_List$$len__$TY$__Snap$struct$m_List$$int$(_1)
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(_1)
(push) ; 16
(pop) ; 16
; Joined path conditions
(push) ; 16
(assert (not (<
  0
  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@255@01 ret@121@01)))))
(check-sat)
; unsat
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(assert (<
  0
  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@255@01 ret@121@01))))
; [eval] 0 <= _2
(assert (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@255@01 ret@121@01) 0))
(pop) ; 15
; Joined path conditions
(assert (and
  (<
    0
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@255@01 ret@121@01)))
  (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@255@01 ret@121@01) 0)))
(pop) ; 14
(pop) ; 13
; Joined path conditions
; Joined path conditions
(assert (=>
  (>
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@255@01 ret@121@01))
    0)
  (and
    (>
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@255@01 ret@121@01))
      0)
    (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_%precondition $t@275@01 ret@273@01)
    (m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$%precondition ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@275@01 ret@273@01))
    (m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@275@01 ret@273@01))
    (m_TrustedOption$$peek__$TY$__Snap$m_TrustedOption$_beg_$_end_$$int$%precondition ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@275@01 ret@273@01))
    (<
      0
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@255@01 ret@121@01)))
    (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
      $Snap.unit
      ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@255@01 ret@121@01) 0))))
(assert (or
  (not
    (>
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@255@01 ret@121@01))
      0))
  (=
    (m_TrustedOption$$peek__$TY$__Snap$m_TrustedOption$_beg_$_end_$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@275@01 ret@273@01))
    (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$ ($Snap.combine
      $Snap.unit
      ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@255@01 ret@121@01) 0))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@277@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@277@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@277@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@277@01)))))
  $Snap.unit))
; [eval] !(old[l72](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_61.val_ref))) > 0) || m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l72](_61.val_ref))) == old[l72](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_61.val_ref)) - 1)
; [eval] !(old[l72](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_61.val_ref))) > 0)
; [eval] old[l72](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_61.val_ref))) > 0
; [eval] old[l72](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_61.val_ref)))
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_61.val_ref))
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_61.val_ref)
(push) ; 13
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
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 14
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
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
(pop) ; 13
; Joined path conditions
(set-option :timeout 0)
(push) ; 13
(pop) ; 13
; Joined path conditions
(push) ; 13
; [then-branch: 80 | !(m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@255@01, ret@121@01)) > 0) | live]
; [else-branch: 80 | m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@255@01, ret@121@01)) > 0 | live]
(push) ; 14
; [then-branch: 80 | !(m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@255@01, ret@121@01)) > 0)]
(assert (not
  (>
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@255@01 ret@121@01))
    0)))
(pop) ; 14
(push) ; 14
; [else-branch: 80 | m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@255@01, ret@121@01)) > 0]
(assert (>
  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@255@01 ret@121@01))
  0))
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l72](_61.val_ref))) == old[l72](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_61.val_ref)) - 1)
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l72](_61.val_ref)))
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l72](_61.val_ref))
; [eval] old[l72](_61.val_ref)
(push) ; 15
; [eval] read$()
(push) ; 16
(pop) ; 16
; Joined path conditions
(push) ; 16
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(push) ; 16
(set-option :timeout 10)
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 16
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
(check-sat)
; unsat
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(push) ; 16
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(assert (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%precondition $t@274@01 ret@121@01))
(pop) ; 15
; Joined path conditions
(assert (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%precondition $t@274@01 ret@121@01))
(set-option :timeout 0)
(push) ; 15
(assert (m_List$$len__$TY$__Snap$struct$m_List$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@274@01 ret@121@01)))
(pop) ; 15
; Joined path conditions
(assert (m_List$$len__$TY$__Snap$struct$m_List$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@274@01 ret@121@01)))
; [eval] old[l72](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_61.val_ref)) - 1)
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_61.val_ref)) - 1
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_61.val_ref))
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_61.val_ref)
(push) ; 15
; [eval] read$()
(push) ; 16
(pop) ; 16
; Joined path conditions
(push) ; 16
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(push) ; 16
(set-option :timeout 10)
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 16
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
(check-sat)
; unsat
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(push) ; 16
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(pop) ; 15
; Joined path conditions
(set-option :timeout 0)
(push) ; 15
(pop) ; 15
; Joined path conditions
(pop) ; 14
(pop) ; 13
; Joined path conditions
; Joined path conditions
(assert (=>
  (>
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@255@01 ret@121@01))
    0)
  (and
    (>
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@255@01 ret@121@01))
      0)
    (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%precondition $t@274@01 ret@121@01)
    (m_List$$len__$TY$__Snap$struct$m_List$$int$%precondition ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@274@01 ret@121@01)))))
(assert (or
  (not
    (>
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@255@01 ret@121@01))
      0))
  (=
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@274@01 ret@121@01))
    (-
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@255@01 ret@121@01))
      1))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@277@01)))))
  $Snap.unit))
; [eval] !(old[l72](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_61.val_ref))) > 0) || (forall _0_quant_0: Int :: { m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l72](_61.val_ref)), _0_quant_0) } 0 <= _0_quant_0 ==> !(0 <= _0_quant_0) || (!(_0_quant_0 < m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l72](_61.val_ref)))) || old[l72](m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_61.val_ref), _0_quant_0 + 1)) == m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l72](_61.val_ref)), _0_quant_0)))
; [eval] !(old[l72](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_61.val_ref))) > 0)
; [eval] old[l72](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_61.val_ref))) > 0
; [eval] old[l72](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_61.val_ref)))
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_61.val_ref))
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_61.val_ref)
(push) ; 13
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
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 14
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
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
(pop) ; 13
; Joined path conditions
(set-option :timeout 0)
(push) ; 13
(pop) ; 13
; Joined path conditions
(push) ; 13
; [then-branch: 81 | !(m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@255@01, ret@121@01)) > 0) | live]
; [else-branch: 81 | m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@255@01, ret@121@01)) > 0 | live]
(push) ; 14
; [then-branch: 81 | !(m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@255@01, ret@121@01)) > 0)]
(assert (not
  (>
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@255@01 ret@121@01))
    0)))
(pop) ; 14
(push) ; 14
; [else-branch: 81 | m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@255@01, ret@121@01)) > 0]
(assert (>
  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@255@01 ret@121@01))
  0))
; [eval] (forall _0_quant_0: Int :: { m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l72](_61.val_ref)), _0_quant_0) } 0 <= _0_quant_0 ==> !(0 <= _0_quant_0) || (!(_0_quant_0 < m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l72](_61.val_ref)))) || old[l72](m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_61.val_ref), _0_quant_0 + 1)) == m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l72](_61.val_ref)), _0_quant_0)))
(declare-const _0_quant_0@278@01 Int)
(push) ; 15
; [eval] 0 <= _0_quant_0 ==> !(0 <= _0_quant_0) || (!(_0_quant_0 < m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l72](_61.val_ref)))) || old[l72](m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_61.val_ref), _0_quant_0 + 1)) == m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l72](_61.val_ref)), _0_quant_0))
; [eval] 0 <= _0_quant_0
(push) ; 16
; [then-branch: 82 | 0 <= _0_quant_0@278@01 | live]
; [else-branch: 82 | !(0 <= _0_quant_0@278@01) | live]
(push) ; 17
; [then-branch: 82 | 0 <= _0_quant_0@278@01]
(assert (<= 0 _0_quant_0@278@01))
; [eval] !(0 <= _0_quant_0) || (!(_0_quant_0 < m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l72](_61.val_ref)))) || old[l72](m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_61.val_ref), _0_quant_0 + 1)) == m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l72](_61.val_ref)), _0_quant_0))
; [eval] !(0 <= _0_quant_0)
; [eval] 0 <= _0_quant_0
(push) ; 18
; [then-branch: 83 | !(0 <= _0_quant_0@278@01) | live]
; [else-branch: 83 | 0 <= _0_quant_0@278@01 | live]
(push) ; 19
; [then-branch: 83 | !(0 <= _0_quant_0@278@01)]
(assert (not (<= 0 _0_quant_0@278@01)))
(pop) ; 19
(push) ; 19
; [else-branch: 83 | 0 <= _0_quant_0@278@01]
; [eval] !(_0_quant_0 < m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l72](_61.val_ref))))
; [eval] _0_quant_0 < m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l72](_61.val_ref)))
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l72](_61.val_ref)))
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l72](_61.val_ref))
; [eval] old[l72](_61.val_ref)
(push) ; 20
; [eval] read$()
(push) ; 21
(pop) ; 21
; Joined path conditions
(push) ; 21
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(push) ; 21
(set-option :timeout 10)
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 21
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
(check-sat)
; unsat
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(push) ; 21
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(assert (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%precondition $t@274@01 ret@121@01))
(pop) ; 20
; Joined path conditions
(assert (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%precondition $t@274@01 ret@121@01))
(set-option :timeout 0)
(push) ; 20
(assert (m_List$$len__$TY$__Snap$struct$m_List$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@274@01 ret@121@01)))
(pop) ; 20
; Joined path conditions
(assert (m_List$$len__$TY$__Snap$struct$m_List$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@274@01 ret@121@01)))
(push) ; 20
; [then-branch: 84 | !(_0_quant_0@278@01 < m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@274@01, ret@121@01))) | live]
; [else-branch: 84 | _0_quant_0@278@01 < m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@274@01, ret@121@01)) | live]
(push) ; 21
; [then-branch: 84 | !(_0_quant_0@278@01 < m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@274@01, ret@121@01)))]
(assert (not
  (<
    _0_quant_0@278@01
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@274@01 ret@121@01)))))
(pop) ; 21
(push) ; 21
; [else-branch: 84 | _0_quant_0@278@01 < m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@274@01, ret@121@01))]
(assert (<
  _0_quant_0@278@01
  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@274@01 ret@121@01))))
; [eval] old[l72](m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_61.val_ref), _0_quant_0 + 1)) == m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l72](_61.val_ref)), _0_quant_0)
; [eval] old[l72](m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_61.val_ref), _0_quant_0 + 1))
; [eval] m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_61.val_ref), _0_quant_0 + 1)
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_61.val_ref)
(push) ; 22
; [eval] read$()
(push) ; 23
(pop) ; 23
; Joined path conditions
(push) ; 23
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(push) ; 23
(set-option :timeout 10)
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unsat
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
(check-sat)
; unsat
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(push) ; 23
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(pop) ; 22
; Joined path conditions
; [eval] _0_quant_0 + 1
(set-option :timeout 0)
(push) ; 22
; [eval] 0 <= _2
(push) ; 23
(assert (not (<= 0 (+ _0_quant_0@278@01 1))))
(check-sat)
; unsat
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(assert (<= 0 (+ _0_quant_0@278@01 1)))
; [eval] _2 < m_List$$len__$TY$__Snap$struct$m_List$$int$(_1)
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(_1)
(push) ; 23
(pop) ; 23
; Joined path conditions
(push) ; 23
(assert (not (<
  (+ _0_quant_0@278@01 1)
  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@255@01 ret@121@01)))))
(check-sat)
; unsat
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(assert (<
  (+ _0_quant_0@278@01 1)
  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@255@01 ret@121@01))))
; [eval] 0 <= _2
(assert (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@255@01 ret@121@01) (+
  _0_quant_0@278@01
  1)))
(pop) ; 22
; Joined path conditions
(assert (and
  (<= 0 (+ _0_quant_0@278@01 1))
  (<
    (+ _0_quant_0@278@01 1)
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@255@01 ret@121@01)))
  (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@255@01 ret@121@01) (+
    _0_quant_0@278@01
    1))))
; [eval] m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l72](_61.val_ref)), _0_quant_0)
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l72](_61.val_ref))
; [eval] old[l72](_61.val_ref)
(push) ; 22
; [eval] read$()
(push) ; 23
(pop) ; 23
; Joined path conditions
(push) ; 23
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(push) ; 23
(set-option :timeout 10)
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unsat
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
(check-sat)
; unsat
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(push) ; 23
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(pop) ; 22
; Joined path conditions
(set-option :timeout 0)
(push) ; 22
; [eval] 0 <= _2
; [eval] _2 < m_List$$len__$TY$__Snap$struct$m_List$$int$(_1)
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(_1)
(push) ; 23
(pop) ; 23
; Joined path conditions
; [eval] 0 <= _2
(assert (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@274@01 ret@121@01) _0_quant_0@278@01))
(pop) ; 22
; Joined path conditions
(assert (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@274@01 ret@121@01) _0_quant_0@278@01))
(pop) ; 21
(pop) ; 20
; Joined path conditions
; Joined path conditions
(assert (=>
  (<
    _0_quant_0@278@01
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@274@01 ret@121@01)))
  (and
    (<
      _0_quant_0@278@01
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@274@01 ret@121@01)))
    (<= 0 (+ _0_quant_0@278@01 1))
    (<
      (+ _0_quant_0@278@01 1)
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@255@01 ret@121@01)))
    (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
      $Snap.unit
      ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@255@01 ret@121@01) (+
      _0_quant_0@278@01
      1))
    (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
      $Snap.unit
      ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@274@01 ret@121@01) _0_quant_0@278@01))))
(assert (or
  (<
    _0_quant_0@278@01
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@274@01 ret@121@01)))
  (not
    (<
      _0_quant_0@278@01
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@274@01 ret@121@01))))))
(pop) ; 19
(pop) ; 18
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 _0_quant_0@278@01)
  (and
    (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%precondition $t@274@01 ret@121@01)
    (m_List$$len__$TY$__Snap$struct$m_List$$int$%precondition ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@274@01 ret@121@01))
    (=>
      (<
        _0_quant_0@278@01
        (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
          $Snap.unit
          $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@274@01 ret@121@01)))
      (and
        (<
          _0_quant_0@278@01
          (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
            $Snap.unit
            $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@274@01 ret@121@01)))
        (<= 0 (+ _0_quant_0@278@01 1))
        (<
          (+ _0_quant_0@278@01 1)
          (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
            $Snap.unit
            $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@255@01 ret@121@01)))
        (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@255@01 ret@121@01) (+
          _0_quant_0@278@01
          1))
        (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@274@01 ret@121@01) _0_quant_0@278@01)))
    (or
      (<
        _0_quant_0@278@01
        (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
          $Snap.unit
          $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@274@01 ret@121@01)))
      (not
        (<
          _0_quant_0@278@01
          (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
            $Snap.unit
            $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@274@01 ret@121@01))))))))
(assert (or (<= 0 _0_quant_0@278@01) (not (<= 0 _0_quant_0@278@01))))
(pop) ; 17
(push) ; 17
; [else-branch: 82 | !(0 <= _0_quant_0@278@01)]
(assert (not (<= 0 _0_quant_0@278@01)))
(pop) ; 17
(pop) ; 16
; Joined path conditions
(assert (=>
  (<= 0 _0_quant_0@278@01)
  (and
    (<= 0 _0_quant_0@278@01)
    (=>
      (<= 0 _0_quant_0@278@01)
      (and
        (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%precondition $t@274@01 ret@121@01)
        (m_List$$len__$TY$__Snap$struct$m_List$$int$%precondition ($Snap.combine
          $Snap.unit
          $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@274@01 ret@121@01))
        (=>
          (<
            _0_quant_0@278@01
            (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
              $Snap.unit
              $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@274@01 ret@121@01)))
          (and
            (<
              _0_quant_0@278@01
              (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                $Snap.unit
                $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@274@01 ret@121@01)))
            (<= 0 (+ _0_quant_0@278@01 1))
            (<
              (+ _0_quant_0@278@01 1)
              (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                $Snap.unit
                $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@255@01 ret@121@01)))
            (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@255@01 ret@121@01) (+
              _0_quant_0@278@01
              1))
            (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@274@01 ret@121@01) _0_quant_0@278@01)))
        (or
          (<
            _0_quant_0@278@01
            (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
              $Snap.unit
              $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@274@01 ret@121@01)))
          (not
            (<
              _0_quant_0@278@01
              (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                $Snap.unit
                $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@274@01 ret@121@01)))))))
    (or (<= 0 _0_quant_0@278@01) (not (<= 0 _0_quant_0@278@01))))))
; Joined path conditions
(assert (or (not (<= 0 _0_quant_0@278@01)) (<= 0 _0_quant_0@278@01)))
(pop) ; 15
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((_0_quant_0@278@01 Int)) (!
  (and
    (=>
      (<= 0 _0_quant_0@278@01)
      (and
        (<= 0 _0_quant_0@278@01)
        (=>
          (<= 0 _0_quant_0@278@01)
          (and
            (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%precondition $t@274@01 ret@121@01)
            (m_List$$len__$TY$__Snap$struct$m_List$$int$%precondition ($Snap.combine
              $Snap.unit
              $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@274@01 ret@121@01))
            (=>
              (<
                _0_quant_0@278@01
                (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                  $Snap.unit
                  $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@274@01 ret@121@01)))
              (and
                (<
                  _0_quant_0@278@01
                  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                    $Snap.unit
                    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@274@01 ret@121@01)))
                (<= 0 (+ _0_quant_0@278@01 1))
                (<
                  (+ _0_quant_0@278@01 1)
                  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                    $Snap.unit
                    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@255@01 ret@121@01)))
                (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@255@01 ret@121@01) (+
                  _0_quant_0@278@01
                  1))
                (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@274@01 ret@121@01) _0_quant_0@278@01)))
            (or
              (<
                _0_quant_0@278@01
                (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                  $Snap.unit
                  $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@274@01 ret@121@01)))
              (not
                (<
                  _0_quant_0@278@01
                  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                    $Snap.unit
                    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@274@01 ret@121@01)))))))
        (or (<= 0 _0_quant_0@278@01) (not (<= 0 _0_quant_0@278@01)))))
    (or (not (<= 0 _0_quant_0@278@01)) (<= 0 _0_quant_0@278@01)))
  :pattern ((m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%limited ($Snap.combine
    $Snap.unit
    ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@274@01 ret@121@01) _0_quant_0@278@01))
  :qid |prog.l1245-aux|)))
(pop) ; 14
(pop) ; 13
; Joined path conditions
; Joined path conditions
(assert (=>
  (>
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@255@01 ret@121@01))
    0)
  (and
    (>
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@255@01 ret@121@01))
      0)
    (forall ((_0_quant_0@278@01 Int)) (!
      (and
        (=>
          (<= 0 _0_quant_0@278@01)
          (and
            (<= 0 _0_quant_0@278@01)
            (=>
              (<= 0 _0_quant_0@278@01)
              (and
                (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%precondition $t@274@01 ret@121@01)
                (m_List$$len__$TY$__Snap$struct$m_List$$int$%precondition ($Snap.combine
                  $Snap.unit
                  $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@274@01 ret@121@01))
                (=>
                  (<
                    _0_quant_0@278@01
                    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                      $Snap.unit
                      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@274@01 ret@121@01)))
                  (and
                    (<
                      _0_quant_0@278@01
                      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                        $Snap.unit
                        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@274@01 ret@121@01)))
                    (<= 0 (+ _0_quant_0@278@01 1))
                    (<
                      (+ _0_quant_0@278@01 1)
                      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                        $Snap.unit
                        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@255@01 ret@121@01)))
                    (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
                      $Snap.unit
                      ($Snap.combine
                        $Snap.unit
                        ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@255@01 ret@121@01) (+
                      _0_quant_0@278@01
                      1))
                    (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
                      $Snap.unit
                      ($Snap.combine
                        $Snap.unit
                        ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@274@01 ret@121@01) _0_quant_0@278@01)))
                (or
                  (<
                    _0_quant_0@278@01
                    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                      $Snap.unit
                      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@274@01 ret@121@01)))
                  (not
                    (<
                      _0_quant_0@278@01
                      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                        $Snap.unit
                        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@274@01 ret@121@01)))))))
            (or (<= 0 _0_quant_0@278@01) (not (<= 0 _0_quant_0@278@01)))))
        (or (not (<= 0 _0_quant_0@278@01)) (<= 0 _0_quant_0@278@01)))
      :pattern ((m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%limited ($Snap.combine
        $Snap.unit
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@274@01 ret@121@01) _0_quant_0@278@01))
      :qid |prog.l1245-aux|)))))
(assert (or
  (not
    (>
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@255@01 ret@121@01))
      0))
  (forall ((_0_quant_0@278@01 Int)) (!
    (=>
      (<= 0 _0_quant_0@278@01)
      (or
        (not (<= 0 _0_quant_0@278@01))
        (or
          (not
            (<
              _0_quant_0@278@01
              (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                $Snap.unit
                $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@274@01 ret@121@01))))
          (=
            (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$ ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@255@01 ret@121@01) (+
              _0_quant_0@278@01
              1))
            (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$ ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@274@01 ret@121@01) _0_quant_0@278@01)))))
    :pattern ((m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%limited ($Snap.combine
      $Snap.unit
      ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@274@01 ret@121@01) _0_quant_0@278@01))
    :qid |prog.l1245|))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; label l73
; [exec]
; __t35 := true
; [exec]
; _62 := builtin$havoc_int()
(declare-const ret@279@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _62 := m_TrustedOption$_beg_$_end_$$discriminant$$__$TY$__m_TrustedOption$_beg_$_end_$$int$(_60)
; [eval] m_TrustedOption$_beg_$_end_$$discriminant$$__$TY$__m_TrustedOption$_beg_$_end_$$int$(_60)
(set-option :timeout 0)
(push) ; 13
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
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
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
(assert (m_TrustedOption$_beg_$_end_$$discriminant$$__$TY$__m_TrustedOption$_beg_$_end_$$int$%precondition $t@275@01 ret@273@01))
(pop) ; 13
; Joined path conditions
(assert (m_TrustedOption$_beg_$_end_$$discriminant$$__$TY$__m_TrustedOption$_beg_$_end_$$int$%precondition $t@275@01 ret@273@01))
(declare-const _62@280@01 Int)
(assert (=
  _62@280@01
  (m_TrustedOption$_beg_$_end_$$discriminant$$__$TY$__m_TrustedOption$_beg_$_end_$$int$ $t@275@01 ret@273@01)))
; [exec]
; __t55 := _62
; [eval] __t55 == 0
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (not (= _62@280@01 0))))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= _62@280@01 0)))
(check-sat)
; unsat
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
; [then-branch: 85 | _62@280@01 == 0 | live]
; [else-branch: 85 | _62@280@01 != 0 | dead]
(set-option :timeout 0)
(push) ; 13
; [then-branch: 85 | _62@280@01 == 0]
(assert (= _62@280@01 0))
; [exec]
; label bb7
; [exec]
; __t37 := true
; [exec]
; __t38 := true
; [exec]
; _63 := builtin$havoc_int()
(declare-const ret@281@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; unfold acc(m_TrustedOption$_beg_$_end_(_60), write)
(assert (= $t@275@01 ($Snap.combine ($Snap.first $t@275@01) ($Snap.second $t@275@01))))
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@254@01 ret@273@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@235@01 ret@273@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@196@01 ret@273@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@177@01 ret@273@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@273@01 $Ref.null)))
(assert (=
  ($Snap.second $t@275@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@275@01))
    ($Snap.second ($Snap.second $t@275@01)))))
(assert (= ($Snap.first ($Snap.second $t@275@01)) $Snap.unit))
; [eval] 0 <= self.discriminant
(assert (<= 0 ($SortWrappers.$SnapToInt ($Snap.first $t@275@01))))
(assert (=
  ($Snap.second ($Snap.second $t@275@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@275@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@275@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@275@01))) $Snap.unit))
; [eval] self.discriminant <= 1
(assert (<= ($SortWrappers.$SnapToInt ($Snap.first $t@275@01)) 1))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@275@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@275@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@275@01)))))))
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@254@01 ret@273@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@235@01 ret@273@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@196@01 ret@273@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@177@01 ret@273@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (m_TrustedOption$_beg_$_end_%trigger $t@275@01 ret@273@01))
; [exec]
; unfold acc(m_TrustedOption$_beg_$_end_Some(_60.enum_Some), write)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@275@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@275@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@275@01))))))))
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@256@01)))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@275@01))))))))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@237@01)))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@275@01))))))))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@198@01)))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@275@01))))))))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@179@01)))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@275@01))))))))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@275@01)))))
    $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (m_TrustedOption$_beg_$_end_Some%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@275@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@275@01)))))))
; [exec]
; unfold acc(i32(_60.enum_Some.f$0), write)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@256@01))))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@275@01)))))))))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@237@01))))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@275@01)))))))))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@198@01))))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@275@01)))))))))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@179@01))))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@275@01)))))))))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@275@01))))))
    $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (i32%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@275@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@275@01))))))))
; [exec]
; _63 := _60.enum_Some.f$0.val_int
(declare-const _63@282@01 Int)
(assert (=
  _63@282@01
  ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@275@01))))))))
; [exec]
; label l77
; [exec]
; _66 := builtin$havoc_int()
(declare-const ret@283@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _66 := _63
; [exec]
; label l78
; [exec]
; _65 := builtin$havoc_ref()
(declare-const ret@284@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; inhale acc(_65.val_bool, write)
(declare-const $t@285@01 Bool)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@142@01 ret@284@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@137@01 ret@284@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@188@01 ret@284@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@191@01 ret@284@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@207@01 ret@284@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@210@01 ret@284@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@246@01 ret@284@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@249@01 ret@284@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@265@01 ret@284@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@268@01 ret@284@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@284@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _65.val_bool := _66 == 1
; [eval] _66 == 1
(declare-const val_bool@286@01 Bool)
(assert (= val_bool@286@01 (= _63@282@01 1)))
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@268@01 ret@284@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@265@01 ret@284@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@249@01 ret@284@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@246@01 ret@284@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@210@01 ret@284@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@207@01 ret@284@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@191@01 ret@284@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@188@01 ret@284@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@137@01 ret@284@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@142@01 ret@284@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
; [exec]
; _64 := builtin$havoc_ref()
(declare-const ret@287@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_64.val_bool, write)
(declare-const $t@288@01 Bool)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@142@01 ret@287@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@137@01 ret@287@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@188@01 ret@287@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@191@01 ret@287@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@207@01 ret@287@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@210@01 ret@287@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@246@01 ret@287@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@249@01 ret@287@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@265@01 ret@287@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@268@01 ret@287@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@284@01 ret@287@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@287@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _64.val_bool := !_65.val_bool
; [eval] !_65.val_bool
(declare-const val_bool@289@01 Bool)
(assert (= val_bool@289@01 (not val_bool@286@01)))
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@284@01 ret@287@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@268@01 ret@287@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@265@01 ret@287@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@249@01 ret@287@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@246@01 ret@287@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@210@01 ret@287@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@207@01 ret@287@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@191@01 ret@287@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@188@01 ret@287@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@137@01 ret@287@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@142@01 ret@287@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t56 := _64.val_bool
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (not val_bool@289@01)))
(check-sat)
; unsat
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
; [then-branch: 86 | val_bool@289@01 | dead]
; [else-branch: 86 | !(val_bool@289@01) | live]
(set-option :timeout 0)
(push) ; 14
; [else-branch: 86 | !(val_bool@289@01)]
(assert (not val_bool@289@01))
(pop) ; 14
; [eval] !__t56
(push) ; 14
(set-option :timeout 10)
(assert (not val_bool@289@01))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (not val_bool@289@01)))
(check-sat)
; unsat
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
; [then-branch: 87 | !(val_bool@289@01) | live]
; [else-branch: 87 | val_bool@289@01 | dead]
(set-option :timeout 0)
(push) ; 14
; [then-branch: 87 | !(val_bool@289@01)]
(assert (not val_bool@289@01))
; [exec]
; label l22
; [exec]
; __t40 := true
; [exec]
; _74 := builtin$havoc_ref()
(declare-const ret@290@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_74.val_ref, write)
(declare-const $t@291@01 $Ref)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@133@01 ret@290@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@290@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _74.val_ref := _1
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@133@01 ret@290@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
; [exec]
; label l81
; [exec]
; label l82
; [exec]
; assert true
; [exec]
; exhale acc(_74.val_ref, write) && acc(struct$m_List(_74.val_ref), write)
; [exec]
; _73 := builtin$havoc_ref()
(declare-const ret@292@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(struct$m_List(old[l82](_74.val_ref)), write)
; [eval] old[l82](_74.val_ref)
(declare-const $t@293@01 $Snap)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(m_TrustedOption$_beg_$_end_(_73), write)
(declare-const $t@294@01 $Snap)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@127@01 ret@292@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale true
(declare-const $t@295@01 $Snap)
(assert (= $t@295@01 $Snap.unit))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale (!(old[l82](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_74.val_ref))) ==
;   0) ||
;   m_TrustedOption$$is_none__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$(snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_(_73))) &&
;   ((!(old[l82](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_74.val_ref))) ==
;   0) ||
;   m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l82](_74.val_ref))) ==
;   0) &&
;   ((!(old[l82](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_74.val_ref))) >
;   0) ||
;   m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$(snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_(_73))) &&
;   ((!(old[l82](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_74.val_ref))) >
;   0) ||
;   m_TrustedOption$$peek__$TY$__Snap$m_TrustedOption$_beg_$_end_$$int$(snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_(_73)) ==
;   old[l82](m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_74.val_ref),
;   0))) &&
;   ((!(old[l82](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_74.val_ref))) >
;   0) ||
;   m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l82](_74.val_ref))) ==
;   old[l82](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_74.val_ref)) -
;   1)) &&
;   (!(old[l82](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_74.val_ref))) >
;   0) ||
;   (forall _0_quant_0: Int ::
;     { m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l82](_74.val_ref)),
;     _0_quant_0) }
;     0 <= _0_quant_0 ==>
;     !(0 <= _0_quant_0) ||
;     (!(_0_quant_0 <
;     m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l82](_74.val_ref)))) ||
;     old[l82](m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_74.val_ref),
;     _0_quant_0 + 1)) ==
;     m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l82](_74.val_ref)),
;     _0_quant_0))))))))
(declare-const $t@296@01 $Snap)
(assert (= $t@296@01 ($Snap.combine ($Snap.first $t@296@01) ($Snap.second $t@296@01))))
(assert (= ($Snap.first $t@296@01) $Snap.unit))
; [eval] !(old[l82](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_74.val_ref))) == 0) || m_TrustedOption$$is_none__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$(snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_(_73))
; [eval] !(old[l82](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_74.val_ref))) == 0)
; [eval] old[l82](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_74.val_ref))) == 0
; [eval] old[l82](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_74.val_ref)))
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_74.val_ref))
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_74.val_ref)
(set-option :timeout 0)
(push) ; 15
; [eval] read$()
(push) ; 16
(pop) ; 16
; Joined path conditions
(push) ; 16
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(push) ; 16
(set-option :timeout 10)
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
(check-sat)
; unsat
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(push) ; 16
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(assert (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%precondition $t@274@01 ret@121@01))
(pop) ; 15
; Joined path conditions
(assert (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%precondition $t@274@01 ret@121@01))
(set-option :timeout 0)
(push) ; 15
(assert (m_List$$len__$TY$__Snap$struct$m_List$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@274@01 ret@121@01)))
(pop) ; 15
; Joined path conditions
(assert (m_List$$len__$TY$__Snap$struct$m_List$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@274@01 ret@121@01)))
(push) ; 15
; [then-branch: 88 | m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@274@01, ret@121@01)) != 0 | live]
; [else-branch: 88 | m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@274@01, ret@121@01)) == 0 | live]
(push) ; 16
; [then-branch: 88 | m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@274@01, ret@121@01)) != 0]
(assert (not
  (=
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@274@01 ret@121@01))
    0)))
(pop) ; 16
(push) ; 16
; [else-branch: 88 | m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@274@01, ret@121@01)) == 0]
(assert (=
  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@274@01 ret@121@01))
  0))
; [eval] m_TrustedOption$$is_none__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$(snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_(_73))
; [eval] snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_(_73)
(push) ; 17
; [eval] read$()
(push) ; 18
(pop) ; 18
; Joined path conditions
(push) ; 18
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(push) ; 18
(set-option :timeout 10)
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
(check-sat)
; unsat
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(push) ; 18
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(assert (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_%precondition $t@294@01 ret@292@01))
(pop) ; 17
; Joined path conditions
(assert (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_%precondition $t@294@01 ret@292@01))
(set-option :timeout 0)
(push) ; 17
(assert (m_TrustedOption$$is_none__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@294@01 ret@292@01)))
(pop) ; 17
; Joined path conditions
(assert (m_TrustedOption$$is_none__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@294@01 ret@292@01)))
(pop) ; 16
(pop) ; 15
; Joined path conditions
; Joined path conditions
(assert (=>
  (=
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@274@01 ret@121@01))
    0)
  (and
    (=
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@274@01 ret@121@01))
      0)
    (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_%precondition $t@294@01 ret@292@01)
    (m_TrustedOption$$is_none__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$%precondition ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@294@01 ret@292@01)))))
(assert (or
  (=
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@274@01 ret@121@01))
    0)
  (not
    (=
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@274@01 ret@121@01))
      0))))
(assert (or
  (not
    (=
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@274@01 ret@121@01))
      0))
  (m_TrustedOption$$is_none__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@294@01 ret@292@01))))
(assert (=
  ($Snap.second $t@296@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@296@01))
    ($Snap.second ($Snap.second $t@296@01)))))
(assert (= ($Snap.first ($Snap.second $t@296@01)) $Snap.unit))
; [eval] !(old[l82](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_74.val_ref))) == 0) || m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l82](_74.val_ref))) == 0
; [eval] !(old[l82](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_74.val_ref))) == 0)
; [eval] old[l82](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_74.val_ref))) == 0
; [eval] old[l82](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_74.val_ref)))
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_74.val_ref))
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_74.val_ref)
(push) ; 15
; [eval] read$()
(push) ; 16
(pop) ; 16
; Joined path conditions
(push) ; 16
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(push) ; 16
(set-option :timeout 10)
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
(check-sat)
; unsat
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(push) ; 16
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(pop) ; 15
; Joined path conditions
(set-option :timeout 0)
(push) ; 15
(pop) ; 15
; Joined path conditions
(push) ; 15
; [then-branch: 89 | m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@274@01, ret@121@01)) != 0 | live]
; [else-branch: 89 | m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@274@01, ret@121@01)) == 0 | live]
(push) ; 16
; [then-branch: 89 | m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@274@01, ret@121@01)) != 0]
(assert (not
  (=
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@274@01 ret@121@01))
    0)))
(pop) ; 16
(push) ; 16
; [else-branch: 89 | m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@274@01, ret@121@01)) == 0]
(assert (=
  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@274@01 ret@121@01))
  0))
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l82](_74.val_ref))) == 0
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l82](_74.val_ref)))
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l82](_74.val_ref))
; [eval] old[l82](_74.val_ref)
(push) ; 17
; [eval] read$()
(push) ; 18
(pop) ; 18
; Joined path conditions
(push) ; 18
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(push) ; 18
(set-option :timeout 10)
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
(check-sat)
; unsat
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(push) ; 18
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(assert (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%precondition $t@293@01 ret@121@01))
(pop) ; 17
; Joined path conditions
(assert (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%precondition $t@293@01 ret@121@01))
(set-option :timeout 0)
(push) ; 17
(assert (m_List$$len__$TY$__Snap$struct$m_List$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@293@01 ret@121@01)))
(pop) ; 17
; Joined path conditions
(assert (m_List$$len__$TY$__Snap$struct$m_List$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@293@01 ret@121@01)))
(pop) ; 16
(pop) ; 15
; Joined path conditions
; Joined path conditions
(assert (=>
  (=
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@274@01 ret@121@01))
    0)
  (and
    (=
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@274@01 ret@121@01))
      0)
    (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%precondition $t@293@01 ret@121@01)
    (m_List$$len__$TY$__Snap$struct$m_List$$int$%precondition ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@293@01 ret@121@01)))))
(assert (or
  (not
    (=
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@274@01 ret@121@01))
      0))
  (=
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@293@01 ret@121@01))
    0)))
(assert (=
  ($Snap.second ($Snap.second $t@296@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@296@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@296@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@296@01))) $Snap.unit))
; [eval] !(old[l82](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_74.val_ref))) > 0) || m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$(snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_(_73))
; [eval] !(old[l82](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_74.val_ref))) > 0)
; [eval] old[l82](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_74.val_ref))) > 0
; [eval] old[l82](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_74.val_ref)))
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_74.val_ref))
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_74.val_ref)
(push) ; 15
; [eval] read$()
(push) ; 16
(pop) ; 16
; Joined path conditions
(push) ; 16
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(push) ; 16
(set-option :timeout 10)
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
(check-sat)
; unsat
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(push) ; 16
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(pop) ; 15
; Joined path conditions
(set-option :timeout 0)
(push) ; 15
(pop) ; 15
; Joined path conditions
(push) ; 15
; [then-branch: 90 | !(m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@274@01, ret@121@01)) > 0) | live]
; [else-branch: 90 | m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@274@01, ret@121@01)) > 0 | live]
(push) ; 16
; [then-branch: 90 | !(m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@274@01, ret@121@01)) > 0)]
(assert (not
  (>
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@274@01 ret@121@01))
    0)))
(pop) ; 16
(push) ; 16
; [else-branch: 90 | m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@274@01, ret@121@01)) > 0]
(assert (>
  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@274@01 ret@121@01))
  0))
; [eval] m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$(snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_(_73))
; [eval] snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_(_73)
(push) ; 17
; [eval] read$()
(push) ; 18
(pop) ; 18
; Joined path conditions
(push) ; 18
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(push) ; 18
(set-option :timeout 10)
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unsat
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
(check-sat)
; unsat
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(push) ; 18
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(assert (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_%precondition $t@294@01 ret@292@01))
(pop) ; 17
; Joined path conditions
(assert (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_%precondition $t@294@01 ret@292@01))
(set-option :timeout 0)
(push) ; 17
(assert (m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@294@01 ret@292@01)))
(pop) ; 17
; Joined path conditions
(assert (m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@294@01 ret@292@01)))
(pop) ; 16
(pop) ; 15
; Joined path conditions
; Joined path conditions
(assert (=>
  (>
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@274@01 ret@121@01))
    0)
  (and
    (>
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@274@01 ret@121@01))
      0)
    (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_%precondition $t@294@01 ret@292@01)
    (m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$%precondition ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@294@01 ret@292@01)))))
(assert (or
  (>
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@274@01 ret@121@01))
    0)
  (not
    (>
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@274@01 ret@121@01))
      0))))
(assert (or
  (not
    (>
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@274@01 ret@121@01))
      0))
  (m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@294@01 ret@292@01))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@296@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@296@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@296@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@296@01))))
  $Snap.unit))
; [eval] !(old[l82](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_74.val_ref))) > 0) || m_TrustedOption$$peek__$TY$__Snap$m_TrustedOption$_beg_$_end_$$int$(snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_(_73)) == old[l82](m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_74.val_ref), 0))
; [eval] !(old[l82](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_74.val_ref))) > 0)
; [eval] old[l82](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_74.val_ref))) > 0
; [eval] old[l82](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_74.val_ref)))
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_74.val_ref))
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_74.val_ref)
(push) ; 15
; [eval] read$()
(push) ; 16
(pop) ; 16
; Joined path conditions
(push) ; 16
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(push) ; 16
(set-option :timeout 10)
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
(check-sat)
; unsat
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(push) ; 16
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(pop) ; 15
; Joined path conditions
(set-option :timeout 0)
(push) ; 15
(pop) ; 15
; Joined path conditions
(push) ; 15
; [then-branch: 91 | !(m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@274@01, ret@121@01)) > 0) | live]
; [else-branch: 91 | m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@274@01, ret@121@01)) > 0 | live]
(push) ; 16
; [then-branch: 91 | !(m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@274@01, ret@121@01)) > 0)]
(assert (not
  (>
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@274@01 ret@121@01))
    0)))
(pop) ; 16
(push) ; 16
; [else-branch: 91 | m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@274@01, ret@121@01)) > 0]
(assert (>
  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@274@01 ret@121@01))
  0))
; [eval] m_TrustedOption$$peek__$TY$__Snap$m_TrustedOption$_beg_$_end_$$int$(snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_(_73)) == old[l82](m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_74.val_ref), 0))
; [eval] m_TrustedOption$$peek__$TY$__Snap$m_TrustedOption$_beg_$_end_$$int$(snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_(_73))
; [eval] snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_(_73)
(push) ; 17
; [eval] read$()
(push) ; 18
(pop) ; 18
; Joined path conditions
(push) ; 18
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(push) ; 18
(set-option :timeout 10)
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unsat
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
(check-sat)
; unsat
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(push) ; 18
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(assert (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_%precondition $t@294@01 ret@292@01))
(pop) ; 17
; Joined path conditions
(assert (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_%precondition $t@294@01 ret@292@01))
(set-option :timeout 0)
(push) ; 17
; [eval] m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$(_1)
(push) ; 18
(assert (m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@294@01 ret@292@01)))
(pop) ; 18
; Joined path conditions
(assert (m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@294@01 ret@292@01)))
(push) ; 18
(assert (not (m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$ ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@294@01 ret@292@01))))
(check-sat)
; unsat
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(assert (m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$ ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@294@01 ret@292@01)))
(assert (m_TrustedOption$$peek__$TY$__Snap$m_TrustedOption$_beg_$_end_$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@294@01 ret@292@01)))
(pop) ; 17
; Joined path conditions
(assert (and
  (m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$%precondition ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@294@01 ret@292@01))
  (m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@294@01 ret@292@01))
  (m_TrustedOption$$peek__$TY$__Snap$m_TrustedOption$_beg_$_end_$$int$%precondition ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@294@01 ret@292@01))))
; [eval] old[l82](m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_74.val_ref), 0))
; [eval] m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_74.val_ref), 0)
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_74.val_ref)
(push) ; 17
; [eval] read$()
(push) ; 18
(pop) ; 18
; Joined path conditions
(push) ; 18
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(push) ; 18
(set-option :timeout 10)
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unsat
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
(check-sat)
; unsat
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(push) ; 18
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(pop) ; 17
; Joined path conditions
(set-option :timeout 0)
(push) ; 17
; [eval] 0 <= _2
; [eval] _2 < m_List$$len__$TY$__Snap$struct$m_List$$int$(_1)
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(_1)
(push) ; 18
(pop) ; 18
; Joined path conditions
(push) ; 18
(assert (not (<
  0
  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@274@01 ret@121@01)))))
(check-sat)
; unsat
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(assert (<
  0
  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@274@01 ret@121@01))))
; [eval] 0 <= _2
(assert (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@274@01 ret@121@01) 0))
(pop) ; 17
; Joined path conditions
(assert (and
  (<
    0
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@274@01 ret@121@01)))
  (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@274@01 ret@121@01) 0)))
(pop) ; 16
(pop) ; 15
; Joined path conditions
; Joined path conditions
(assert (=>
  (>
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@274@01 ret@121@01))
    0)
  (and
    (>
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@274@01 ret@121@01))
      0)
    (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_%precondition $t@294@01 ret@292@01)
    (m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$%precondition ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@294@01 ret@292@01))
    (m_TrustedOption$$is_some__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@294@01 ret@292@01))
    (m_TrustedOption$$peek__$TY$__Snap$m_TrustedOption$_beg_$_end_$$int$%precondition ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@294@01 ret@292@01))
    (<
      0
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@274@01 ret@121@01)))
    (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
      $Snap.unit
      ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@274@01 ret@121@01) 0))))
(assert (or
  (not
    (>
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@274@01 ret@121@01))
      0))
  (=
    (m_TrustedOption$$peek__$TY$__Snap$m_TrustedOption$_beg_$_end_$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@294@01 ret@292@01))
    (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$ ($Snap.combine
      $Snap.unit
      ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@274@01 ret@121@01) 0))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@296@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@296@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@296@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@296@01)))))
  $Snap.unit))
; [eval] !(old[l82](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_74.val_ref))) > 0) || m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l82](_74.val_ref))) == old[l82](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_74.val_ref)) - 1)
; [eval] !(old[l82](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_74.val_ref))) > 0)
; [eval] old[l82](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_74.val_ref))) > 0
; [eval] old[l82](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_74.val_ref)))
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_74.val_ref))
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_74.val_ref)
(push) ; 15
; [eval] read$()
(push) ; 16
(pop) ; 16
; Joined path conditions
(push) ; 16
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(push) ; 16
(set-option :timeout 10)
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
(check-sat)
; unsat
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(push) ; 16
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(pop) ; 15
; Joined path conditions
(set-option :timeout 0)
(push) ; 15
(pop) ; 15
; Joined path conditions
(push) ; 15
; [then-branch: 92 | !(m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@274@01, ret@121@01)) > 0) | live]
; [else-branch: 92 | m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@274@01, ret@121@01)) > 0 | live]
(push) ; 16
; [then-branch: 92 | !(m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@274@01, ret@121@01)) > 0)]
(assert (not
  (>
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@274@01 ret@121@01))
    0)))
(pop) ; 16
(push) ; 16
; [else-branch: 92 | m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@274@01, ret@121@01)) > 0]
(assert (>
  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@274@01 ret@121@01))
  0))
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l82](_74.val_ref))) == old[l82](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_74.val_ref)) - 1)
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l82](_74.val_ref)))
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l82](_74.val_ref))
; [eval] old[l82](_74.val_ref)
(push) ; 17
; [eval] read$()
(push) ; 18
(pop) ; 18
; Joined path conditions
(push) ; 18
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(push) ; 18
(set-option :timeout 10)
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unsat
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
(check-sat)
; unsat
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(push) ; 18
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(assert (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%precondition $t@293@01 ret@121@01))
(pop) ; 17
; Joined path conditions
(assert (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%precondition $t@293@01 ret@121@01))
(set-option :timeout 0)
(push) ; 17
(assert (m_List$$len__$TY$__Snap$struct$m_List$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@293@01 ret@121@01)))
(pop) ; 17
; Joined path conditions
(assert (m_List$$len__$TY$__Snap$struct$m_List$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@293@01 ret@121@01)))
; [eval] old[l82](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_74.val_ref)) - 1)
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_74.val_ref)) - 1
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_74.val_ref))
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_74.val_ref)
(push) ; 17
; [eval] read$()
(push) ; 18
(pop) ; 18
; Joined path conditions
(push) ; 18
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(push) ; 18
(set-option :timeout 10)
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unsat
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
(check-sat)
; unsat
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(push) ; 18
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(pop) ; 17
; Joined path conditions
(set-option :timeout 0)
(push) ; 17
(pop) ; 17
; Joined path conditions
(pop) ; 16
(pop) ; 15
; Joined path conditions
; Joined path conditions
(assert (=>
  (>
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@274@01 ret@121@01))
    0)
  (and
    (>
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@274@01 ret@121@01))
      0)
    (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%precondition $t@293@01 ret@121@01)
    (m_List$$len__$TY$__Snap$struct$m_List$$int$%precondition ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@293@01 ret@121@01)))))
(assert (or
  (not
    (>
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@274@01 ret@121@01))
      0))
  (=
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@293@01 ret@121@01))
    (-
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@274@01 ret@121@01))
      1))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@296@01)))))
  $Snap.unit))
; [eval] !(old[l82](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_74.val_ref))) > 0) || (forall _0_quant_0: Int :: { m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l82](_74.val_ref)), _0_quant_0) } 0 <= _0_quant_0 ==> !(0 <= _0_quant_0) || (!(_0_quant_0 < m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l82](_74.val_ref)))) || old[l82](m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_74.val_ref), _0_quant_0 + 1)) == m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l82](_74.val_ref)), _0_quant_0)))
; [eval] !(old[l82](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_74.val_ref))) > 0)
; [eval] old[l82](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_74.val_ref))) > 0
; [eval] old[l82](m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_74.val_ref)))
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_74.val_ref))
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_74.val_ref)
(push) ; 15
; [eval] read$()
(push) ; 16
(pop) ; 16
; Joined path conditions
(push) ; 16
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(push) ; 16
(set-option :timeout 10)
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
(check-sat)
; unsat
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(push) ; 16
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(pop) ; 15
; Joined path conditions
(set-option :timeout 0)
(push) ; 15
(pop) ; 15
; Joined path conditions
(push) ; 15
; [then-branch: 93 | !(m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@274@01, ret@121@01)) > 0) | live]
; [else-branch: 93 | m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@274@01, ret@121@01)) > 0 | live]
(push) ; 16
; [then-branch: 93 | !(m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@274@01, ret@121@01)) > 0)]
(assert (not
  (>
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@274@01 ret@121@01))
    0)))
(pop) ; 16
(push) ; 16
; [else-branch: 93 | m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@274@01, ret@121@01)) > 0]
(assert (>
  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@274@01 ret@121@01))
  0))
; [eval] (forall _0_quant_0: Int :: { m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l82](_74.val_ref)), _0_quant_0) } 0 <= _0_quant_0 ==> !(0 <= _0_quant_0) || (!(_0_quant_0 < m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l82](_74.val_ref)))) || old[l82](m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_74.val_ref), _0_quant_0 + 1)) == m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l82](_74.val_ref)), _0_quant_0)))
(declare-const _0_quant_0@297@01 Int)
(push) ; 17
; [eval] 0 <= _0_quant_0 ==> !(0 <= _0_quant_0) || (!(_0_quant_0 < m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l82](_74.val_ref)))) || old[l82](m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_74.val_ref), _0_quant_0 + 1)) == m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l82](_74.val_ref)), _0_quant_0))
; [eval] 0 <= _0_quant_0
(push) ; 18
; [then-branch: 94 | 0 <= _0_quant_0@297@01 | live]
; [else-branch: 94 | !(0 <= _0_quant_0@297@01) | live]
(push) ; 19
; [then-branch: 94 | 0 <= _0_quant_0@297@01]
(assert (<= 0 _0_quant_0@297@01))
; [eval] !(0 <= _0_quant_0) || (!(_0_quant_0 < m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l82](_74.val_ref)))) || old[l82](m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_74.val_ref), _0_quant_0 + 1)) == m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l82](_74.val_ref)), _0_quant_0))
; [eval] !(0 <= _0_quant_0)
; [eval] 0 <= _0_quant_0
(push) ; 20
; [then-branch: 95 | !(0 <= _0_quant_0@297@01) | live]
; [else-branch: 95 | 0 <= _0_quant_0@297@01 | live]
(push) ; 21
; [then-branch: 95 | !(0 <= _0_quant_0@297@01)]
(assert (not (<= 0 _0_quant_0@297@01)))
(pop) ; 21
(push) ; 21
; [else-branch: 95 | 0 <= _0_quant_0@297@01]
; [eval] !(_0_quant_0 < m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l82](_74.val_ref))))
; [eval] _0_quant_0 < m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l82](_74.val_ref)))
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l82](_74.val_ref)))
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l82](_74.val_ref))
; [eval] old[l82](_74.val_ref)
(push) ; 22
; [eval] read$()
(push) ; 23
(pop) ; 23
; Joined path conditions
(push) ; 23
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(push) ; 23
(set-option :timeout 10)
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unsat
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
(check-sat)
; unsat
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(push) ; 23
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(assert (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%precondition $t@293@01 ret@121@01))
(pop) ; 22
; Joined path conditions
(assert (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%precondition $t@293@01 ret@121@01))
(set-option :timeout 0)
(push) ; 22
(assert (m_List$$len__$TY$__Snap$struct$m_List$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@293@01 ret@121@01)))
(pop) ; 22
; Joined path conditions
(assert (m_List$$len__$TY$__Snap$struct$m_List$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@293@01 ret@121@01)))
(push) ; 22
; [then-branch: 96 | !(_0_quant_0@297@01 < m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@293@01, ret@121@01))) | live]
; [else-branch: 96 | _0_quant_0@297@01 < m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@293@01, ret@121@01)) | live]
(push) ; 23
; [then-branch: 96 | !(_0_quant_0@297@01 < m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@293@01, ret@121@01)))]
(assert (not
  (<
    _0_quant_0@297@01
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@293@01 ret@121@01)))))
(pop) ; 23
(push) ; 23
; [else-branch: 96 | _0_quant_0@297@01 < m_List$$len__$TY$__Snap$struct$m_List$$int$((_, _), snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List($t@293@01, ret@121@01))]
(assert (<
  _0_quant_0@297@01
  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@293@01 ret@121@01))))
; [eval] old[l82](m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_74.val_ref), _0_quant_0 + 1)) == m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l82](_74.val_ref)), _0_quant_0)
; [eval] old[l82](m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_74.val_ref), _0_quant_0 + 1))
; [eval] m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_74.val_ref), _0_quant_0 + 1)
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(_74.val_ref)
(push) ; 24
; [eval] read$()
(push) ; 25
(pop) ; 25
; Joined path conditions
(push) ; 25
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 25
; 0.00s
; (get-info :all-statistics)
(push) ; 25
(set-option :timeout 10)
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unsat
(pop) ; 25
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 25
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
(check-sat)
; unsat
(pop) ; 25
; 0.00s
; (get-info :all-statistics)
(push) ; 25
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 25
; 0.00s
; (get-info :all-statistics)
(pop) ; 24
; Joined path conditions
; [eval] _0_quant_0 + 1
(set-option :timeout 0)
(push) ; 24
; [eval] 0 <= _2
(push) ; 25
(assert (not (<= 0 (+ _0_quant_0@297@01 1))))
(check-sat)
; unsat
(pop) ; 25
; 0.00s
; (get-info :all-statistics)
(assert (<= 0 (+ _0_quant_0@297@01 1)))
; [eval] _2 < m_List$$len__$TY$__Snap$struct$m_List$$int$(_1)
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(_1)
(push) ; 25
(pop) ; 25
; Joined path conditions
(push) ; 25
(assert (not (<
  (+ _0_quant_0@297@01 1)
  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@274@01 ret@121@01)))))
(check-sat)
; unsat
(pop) ; 25
; 0.00s
; (get-info :all-statistics)
(assert (<
  (+ _0_quant_0@297@01 1)
  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@274@01 ret@121@01))))
; [eval] 0 <= _2
(assert (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@274@01 ret@121@01) (+
  _0_quant_0@297@01
  1)))
(pop) ; 24
; Joined path conditions
(assert (and
  (<= 0 (+ _0_quant_0@297@01 1))
  (<
    (+ _0_quant_0@297@01 1)
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@274@01 ret@121@01)))
  (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@274@01 ret@121@01) (+
    _0_quant_0@297@01
    1))))
; [eval] m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$(snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l82](_74.val_ref)), _0_quant_0)
; [eval] snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List(old[l82](_74.val_ref))
; [eval] old[l82](_74.val_ref)
(push) ; 24
; [eval] read$()
(push) ; 25
(pop) ; 25
; Joined path conditions
(push) ; 25
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 25
; 0.00s
; (get-info :all-statistics)
(push) ; 25
(set-option :timeout 10)
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unsat
(pop) ; 25
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 25
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
(check-sat)
; unsat
(pop) ; 25
; 0.00s
; (get-info :all-statistics)
(push) ; 25
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 25
; 0.00s
; (get-info :all-statistics)
(pop) ; 24
; Joined path conditions
(set-option :timeout 0)
(push) ; 24
; [eval] 0 <= _2
; [eval] _2 < m_List$$len__$TY$__Snap$struct$m_List$$int$(_1)
; [eval] m_List$$len__$TY$__Snap$struct$m_List$$int$(_1)
(push) ; 25
(pop) ; 25
; Joined path conditions
; [eval] 0 <= _2
(assert (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@293@01 ret@121@01) _0_quant_0@297@01))
(pop) ; 24
; Joined path conditions
(assert (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@293@01 ret@121@01) _0_quant_0@297@01))
(pop) ; 23
(pop) ; 22
; Joined path conditions
; Joined path conditions
(assert (=>
  (<
    _0_quant_0@297@01
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@293@01 ret@121@01)))
  (and
    (<
      _0_quant_0@297@01
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@293@01 ret@121@01)))
    (<= 0 (+ _0_quant_0@297@01 1))
    (<
      (+ _0_quant_0@297@01 1)
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@274@01 ret@121@01)))
    (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
      $Snap.unit
      ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@274@01 ret@121@01) (+
      _0_quant_0@297@01
      1))
    (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
      $Snap.unit
      ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@293@01 ret@121@01) _0_quant_0@297@01))))
(assert (or
  (<
    _0_quant_0@297@01
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@293@01 ret@121@01)))
  (not
    (<
      _0_quant_0@297@01
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@293@01 ret@121@01))))))
(pop) ; 21
(pop) ; 20
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 _0_quant_0@297@01)
  (and
    (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%precondition $t@293@01 ret@121@01)
    (m_List$$len__$TY$__Snap$struct$m_List$$int$%precondition ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@293@01 ret@121@01))
    (=>
      (<
        _0_quant_0@297@01
        (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
          $Snap.unit
          $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@293@01 ret@121@01)))
      (and
        (<
          _0_quant_0@297@01
          (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
            $Snap.unit
            $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@293@01 ret@121@01)))
        (<= 0 (+ _0_quant_0@297@01 1))
        (<
          (+ _0_quant_0@297@01 1)
          (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
            $Snap.unit
            $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@274@01 ret@121@01)))
        (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@274@01 ret@121@01) (+
          _0_quant_0@297@01
          1))
        (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@293@01 ret@121@01) _0_quant_0@297@01)))
    (or
      (<
        _0_quant_0@297@01
        (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
          $Snap.unit
          $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@293@01 ret@121@01)))
      (not
        (<
          _0_quant_0@297@01
          (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
            $Snap.unit
            $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@293@01 ret@121@01))))))))
(assert (or (<= 0 _0_quant_0@297@01) (not (<= 0 _0_quant_0@297@01))))
(pop) ; 19
(push) ; 19
; [else-branch: 94 | !(0 <= _0_quant_0@297@01)]
(assert (not (<= 0 _0_quant_0@297@01)))
(pop) ; 19
(pop) ; 18
; Joined path conditions
(assert (=>
  (<= 0 _0_quant_0@297@01)
  (and
    (<= 0 _0_quant_0@297@01)
    (=>
      (<= 0 _0_quant_0@297@01)
      (and
        (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%precondition $t@293@01 ret@121@01)
        (m_List$$len__$TY$__Snap$struct$m_List$$int$%precondition ($Snap.combine
          $Snap.unit
          $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@293@01 ret@121@01))
        (=>
          (<
            _0_quant_0@297@01
            (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
              $Snap.unit
              $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@293@01 ret@121@01)))
          (and
            (<
              _0_quant_0@297@01
              (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                $Snap.unit
                $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@293@01 ret@121@01)))
            (<= 0 (+ _0_quant_0@297@01 1))
            (<
              (+ _0_quant_0@297@01 1)
              (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                $Snap.unit
                $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@274@01 ret@121@01)))
            (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@274@01 ret@121@01) (+
              _0_quant_0@297@01
              1))
            (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@293@01 ret@121@01) _0_quant_0@297@01)))
        (or
          (<
            _0_quant_0@297@01
            (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
              $Snap.unit
              $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@293@01 ret@121@01)))
          (not
            (<
              _0_quant_0@297@01
              (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                $Snap.unit
                $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@293@01 ret@121@01)))))))
    (or (<= 0 _0_quant_0@297@01) (not (<= 0 _0_quant_0@297@01))))))
; Joined path conditions
(assert (or (not (<= 0 _0_quant_0@297@01)) (<= 0 _0_quant_0@297@01)))
(pop) ; 17
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((_0_quant_0@297@01 Int)) (!
  (and
    (=>
      (<= 0 _0_quant_0@297@01)
      (and
        (<= 0 _0_quant_0@297@01)
        (=>
          (<= 0 _0_quant_0@297@01)
          (and
            (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%precondition $t@293@01 ret@121@01)
            (m_List$$len__$TY$__Snap$struct$m_List$$int$%precondition ($Snap.combine
              $Snap.unit
              $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@293@01 ret@121@01))
            (=>
              (<
                _0_quant_0@297@01
                (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                  $Snap.unit
                  $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@293@01 ret@121@01)))
              (and
                (<
                  _0_quant_0@297@01
                  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                    $Snap.unit
                    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@293@01 ret@121@01)))
                (<= 0 (+ _0_quant_0@297@01 1))
                (<
                  (+ _0_quant_0@297@01 1)
                  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                    $Snap.unit
                    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@274@01 ret@121@01)))
                (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@274@01 ret@121@01) (+
                  _0_quant_0@297@01
                  1))
                (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@293@01 ret@121@01) _0_quant_0@297@01)))
            (or
              (<
                _0_quant_0@297@01
                (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                  $Snap.unit
                  $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@293@01 ret@121@01)))
              (not
                (<
                  _0_quant_0@297@01
                  (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                    $Snap.unit
                    $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@293@01 ret@121@01)))))))
        (or (<= 0 _0_quant_0@297@01) (not (<= 0 _0_quant_0@297@01)))))
    (or (not (<= 0 _0_quant_0@297@01)) (<= 0 _0_quant_0@297@01)))
  :pattern ((m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%limited ($Snap.combine
    $Snap.unit
    ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@293@01 ret@121@01) _0_quant_0@297@01))
  :qid |prog.l1498-aux|)))
(pop) ; 16
(pop) ; 15
; Joined path conditions
; Joined path conditions
(assert (=>
  (>
    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@274@01 ret@121@01))
    0)
  (and
    (>
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@274@01 ret@121@01))
      0)
    (forall ((_0_quant_0@297@01 Int)) (!
      (and
        (=>
          (<= 0 _0_quant_0@297@01)
          (and
            (<= 0 _0_quant_0@297@01)
            (=>
              (<= 0 _0_quant_0@297@01)
              (and
                (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List%precondition $t@293@01 ret@121@01)
                (m_List$$len__$TY$__Snap$struct$m_List$$int$%precondition ($Snap.combine
                  $Snap.unit
                  $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@293@01 ret@121@01))
                (=>
                  (<
                    _0_quant_0@297@01
                    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                      $Snap.unit
                      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@293@01 ret@121@01)))
                  (and
                    (<
                      _0_quant_0@297@01
                      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                        $Snap.unit
                        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@293@01 ret@121@01)))
                    (<= 0 (+ _0_quant_0@297@01 1))
                    (<
                      (+ _0_quant_0@297@01 1)
                      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                        $Snap.unit
                        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@274@01 ret@121@01)))
                    (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
                      $Snap.unit
                      ($Snap.combine
                        $Snap.unit
                        ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@274@01 ret@121@01) (+
                      _0_quant_0@297@01
                      1))
                    (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%precondition ($Snap.combine
                      $Snap.unit
                      ($Snap.combine
                        $Snap.unit
                        ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@293@01 ret@121@01) _0_quant_0@297@01)))
                (or
                  (<
                    _0_quant_0@297@01
                    (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                      $Snap.unit
                      $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@293@01 ret@121@01)))
                  (not
                    (<
                      _0_quant_0@297@01
                      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                        $Snap.unit
                        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@293@01 ret@121@01)))))))
            (or (<= 0 _0_quant_0@297@01) (not (<= 0 _0_quant_0@297@01)))))
        (or (not (<= 0 _0_quant_0@297@01)) (<= 0 _0_quant_0@297@01)))
      :pattern ((m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%limited ($Snap.combine
        $Snap.unit
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@293@01 ret@121@01) _0_quant_0@297@01))
      :qid |prog.l1498-aux|)))))
(assert (or
  (not
    (>
      (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@274@01 ret@121@01))
      0))
  (forall ((_0_quant_0@297@01 Int)) (!
    (=>
      (<= 0 _0_quant_0@297@01)
      (or
        (not (<= 0 _0_quant_0@297@01))
        (or
          (not
            (<
              _0_quant_0@297@01
              (m_List$$len__$TY$__Snap$struct$m_List$$int$ ($Snap.combine
                $Snap.unit
                $Snap.unit) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@293@01 ret@121@01))))
          (=
            (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$ ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@274@01 ret@121@01) (+
              _0_quant_0@297@01
              1))
            (m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$ ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@293@01 ret@121@01) _0_quant_0@297@01)))))
    :pattern ((m_List$$lookup__$TY$__Snap$struct$m_List$$int$$$int$%limited ($Snap.combine
      $Snap.unit
      ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_List$struct$m_List$Snap$struct$m_List $t@293@01 ret@121@01) _0_quant_0@297@01))
    :qid |prog.l1498|))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; label l83
; [exec]
; __t41 := true
; [exec]
; _72 := builtin$havoc_ref()
(declare-const ret@298@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_72.val_ref, write)
(declare-const $t@299@01 $Ref)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@133@01 ret@298@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@298@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _72.val_ref := _73
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@133@01 ret@298@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.01s
; (get-info :all-statistics)
; [exec]
; exhale acc(m_TrustedOption$_beg_$_end_(_73), write - read$())
; [eval] write - read$()
; [eval] read$()
(set-option :timeout 0)
(push) ; 15
(pop) ; 15
; Joined path conditions
(push) ; 15
(assert (not (or
  (= (- $Perm.Write (read$ $Snap.unit)) $Perm.No)
  (< $Perm.No (- $Perm.Write (read$ $Snap.unit))))))
(check-sat)
; unsat
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(push) ; 15
(set-option :timeout 10)
(assert (not (=
  (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 15
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
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
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(push) ; 15
(set-option :timeout 10)
(assert (not (< $Perm.No (- $Perm.Write (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
; [exec]
; inhale acc(m_TrustedOption$_beg_$_end_(_72.val_ref), read$())
; [eval] read$()
(set-option :timeout 0)
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
(declare-const $t@300@01 $Snap)
(declare-const $t@301@01 $Snap)
(assert (and
  (=>
    (<
      $Perm.No
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit)))))
    (= $t@301@01 $t@294@01))
  (=> (< $Perm.No (read$ $Snap.unit)) (= $t@301@01 $t@300@01))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; label l85
; [exec]
; label l86
; [exec]
; _71 := builtin$havoc_ref()
(declare-const ret@302@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(bool(_71), write)
(declare-const $t@303@01 Bool)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (unfolding acc(bool(_71), write) in _71.val_bool) ==
;   m_TrustedOption$$is_none__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$(snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_(_72.val_ref))
(declare-const $t@304@01 $Snap)
(assert (= $t@304@01 $Snap.unit))
; [eval] (unfolding acc(bool(_71), write) in _71.val_bool) == m_TrustedOption$$is_none__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$(snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_(_72.val_ref))
; [eval] (unfolding acc(bool(_71), write) in _71.val_bool)
(set-option :timeout 0)
(push) ; 15
(assert (bool%trigger ($SortWrappers.BoolTo$Snap $t@303@01) ret@302@01))
(push) ; 16
(set-option :timeout 10)
(assert (not (= ret@142@01 ret@302@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= ret@137@01 ret@302@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= ret@188@01 ret@302@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= ret@191@01 ret@302@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= ret@207@01 ret@302@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= ret@210@01 ret@302@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= ret@246@01 ret@302@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= ret@249@01 ret@302@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= ret@265@01 ret@302@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= ret@268@01 ret@302@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= ret@284@01 ret@302@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= ret@287@01 ret@302@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.01s
; (get-info :all-statistics)
(assert (not (= ret@302@01 $Ref.null)))
(pop) ; 15
; Joined path conditions
(assert (and
  (bool%trigger ($SortWrappers.BoolTo$Snap $t@303@01) ret@302@01)
  (not (= ret@302@01 $Ref.null))))
; [eval] m_TrustedOption$$is_none__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$(snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_(_72.val_ref))
; [eval] snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_(_72.val_ref)
(set-option :timeout 0)
(push) ; 15
; [eval] read$()
(push) ; 16
(pop) ; 16
; Joined path conditions
(push) ; 16
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(push) ; 16
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
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
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
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(push) ; 16
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(assert (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_%precondition $t@301@01 ret@292@01))
(pop) ; 15
; Joined path conditions
(assert (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_%precondition $t@301@01 ret@292@01))
(set-option :timeout 0)
(push) ; 15
(assert (m_TrustedOption$$is_none__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@301@01 ret@292@01)))
(pop) ; 15
; Joined path conditions
(assert (m_TrustedOption$$is_none__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@301@01 ret@292@01)))
(assert (=
  $t@303@01
  (m_TrustedOption$$is_none__$TY$__Snap$m_TrustedOption$_beg_$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_TrustedOption$_beg_$_end_$m_TrustedOption$_beg_$_end_$Snap$m_TrustedOption$_beg_$_end_ $t@301@01 ret@292@01))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [eval] __t41 && __t41
(set-option :timeout 0)
(push) ; 15
; [then-branch: 97 | True | live]
; [else-branch: 97 | False | live]
(push) ; 16
; [then-branch: 97 | True]
(pop) ; 16
(push) ; 16
; [else-branch: 97 | False]
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
; 0.01s
; (get-info :all-statistics)
; [then-branch: 98 | True | live]
; [else-branch: 98 | False | dead]
(set-option :timeout 0)
(push) ; 15
; [then-branch: 98 | True]
; [exec]
; exhale acc(m_TrustedOption$_beg_$_end_(old[l85](_72.val_ref)), read$())
; [eval] read$()
(push) ; 16
(pop) ; 16
; Joined path conditions
; [eval] old[l85](_72.val_ref)
(push) ; 16
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(push) ; 16
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
(pop) ; 16
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
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
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(push) ; 16
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
; [exec]
; inhale acc(m_TrustedOption$_beg_$_end_(_73), write - read$())
; [eval] write - read$()
; [eval] read$()
(set-option :timeout 0)
(push) ; 16
(pop) ; 16
; Joined path conditions
(push) ; 16
(assert (not (or
  (= (- $Perm.Write (read$ $Snap.unit)) $Perm.No)
  (< $Perm.No (- $Perm.Write (read$ $Snap.unit))))))
(check-sat)
; unsat
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(declare-const $t@305@01 $Snap)
(declare-const $t@306@01 $Snap)
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
    (= $t@306@01 $t@301@01))
  (=> (< $Perm.No (- $Perm.Write (read$ $Snap.unit))) (= $t@306@01 $t@305@01))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; __t42 := true
; [exec]
; _70 := builtin$havoc_ref()
(declare-const ret@307@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_70.val_bool, write)
(declare-const $t@308@01 Bool)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= ret@287@01 ret@307@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= ret@284@01 ret@307@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= ret@268@01 ret@307@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= ret@265@01 ret@307@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= ret@249@01 ret@307@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= ret@246@01 ret@307@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= ret@210@01 ret@307@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= ret@207@01 ret@307@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= ret@191@01 ret@307@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= ret@188@01 ret@307@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= ret@137@01 ret@307@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= ret@142@01 ret@307@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@307@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; unfold acc(bool(_71), write)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= ret@142@01 ret@302@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= ret@137@01 ret@302@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= ret@188@01 ret@302@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= ret@191@01 ret@302@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= ret@207@01 ret@302@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= ret@210@01 ret@302@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= ret@246@01 ret@302@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= ret@249@01 ret@302@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= ret@265@01 ret@302@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= ret@268@01 ret@302@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= ret@284@01 ret@302@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= ret@287@01 ret@302@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= ret@307@01 ret@302@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
; [exec]
; _70.val_bool := !_71.val_bool
; [eval] !_71.val_bool
(declare-const val_bool@309@01 Bool)
(assert (= val_bool@309@01 (not $t@303@01)))
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= ret@287@01 ret@307@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= ret@284@01 ret@307@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= ret@268@01 ret@307@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= ret@265@01 ret@307@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= ret@249@01 ret@307@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= ret@246@01 ret@307@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= ret@210@01 ret@307@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= ret@207@01 ret@307@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= ret@191@01 ret@307@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= ret@188@01 ret@307@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= ret@137@01 ret@307@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= ret@142@01 ret@307@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= ret@302@01 ret@307@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t57 := _70.val_bool
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (not val_bool@309@01)))
(check-sat)
; unsat
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
; [then-branch: 99 | val_bool@309@01 | dead]
; [else-branch: 99 | !(val_bool@309@01) | live]
(set-option :timeout 0)
(push) ; 16
; [else-branch: 99 | !(val_bool@309@01)]
(assert (not val_bool@309@01))
(pop) ; 16
; [eval] !__t57
(push) ; 16
(set-option :timeout 10)
(assert (not val_bool@309@01))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (not val_bool@309@01)))
(check-sat)
; unsat
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
; [then-branch: 100 | !(val_bool@309@01) | live]
; [else-branch: 100 | val_bool@309@01 | dead]
(set-option :timeout 0)
(push) ; 16
; [then-branch: 100 | !(val_bool@309@01)]
(assert (not val_bool@309@01))
; [exec]
; label bb8
; [exec]
; __t44 := true
; [exec]
; __t45 := true
; [exec]
; label l91
; [exec]
; fold acc(tuple0$(_0), write)
(assert (tuple0$%trigger $Snap.unit _0@1@01))
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@217@01 _0@1@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@159@01 _0@1@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@149@01 _0@1@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@169@01 _0@1@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@227@01 _0@1@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
; [exec]
; assert true
; [exec]
; exhale acc(tuple0$(_0), write)
; [exec]
; label end_of_method
(pop) ; 16
(pop) ; 15
; [eval] !(__t41 && __t41)
; [eval] __t41 && __t41
(set-option :timeout 0)
(push) ; 15
; [then-branch: 101 | True | live]
; [else-branch: 101 | False | live]
(push) ; 16
; [then-branch: 101 | True]
(pop) ; 16
(push) ; 16
; [else-branch: 101 | False]
(assert false)
(pop) ; 16
(pop) ; 15
; Joined path conditions
; Joined path conditions
; [then-branch: 102 | False | dead]
; [else-branch: 102 | True | live]
(push) ; 15
; [else-branch: 102 | True]
(pop) ; 15
(pop) ; 14
(pop) ; 13
; [eval] !(__t55 == 0)
; [eval] __t55 == 0
(push) ; 13
(set-option :timeout 10)
(assert (not (= _62@280@01 0)))
(check-sat)
; unsat
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
; [then-branch: 103 | _62@280@01 != 0 | dead]
; [else-branch: 103 | _62@280@01 == 0 | live]
(set-option :timeout 0)
(push) ; 13
; [else-branch: 103 | _62@280@01 == 0]
(assert (= _62@280@01 0))
(pop) ; 13
(pop) ; 12
(pop) ; 11
; [eval] !(__t53 == 0)
; [eval] __t53 == 0
(push) ; 11
(set-option :timeout 10)
(assert (not (= _52@261@01 0)))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [then-branch: 104 | _52@261@01 != 0 | dead]
; [else-branch: 104 | _52@261@01 == 0 | live]
(set-option :timeout 0)
(push) ; 11
; [else-branch: 104 | _52@261@01 == 0]
(assert (= _52@261@01 0))
(pop) ; 11
(pop) ; 10
(pop) ; 9
; [eval] !(__t51 == 0)
; [eval] __t51 == 0
(push) ; 9
(set-option :timeout 10)
(assert (not (= _42@242@01 0)))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [then-branch: 105 | _42@242@01 != 0 | dead]
; [else-branch: 105 | _42@242@01 == 0 | live]
(set-option :timeout 0)
(push) ; 9
; [else-branch: 105 | _42@242@01 == 0]
(assert (= _42@242@01 0))
(pop) ; 9
(pop) ; 8
(pop) ; 7
; [eval] !(__t49 == 0)
; [eval] __t49 == 0
(push) ; 7
(set-option :timeout 10)
(assert (not (= _28@203@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [then-branch: 106 | _28@203@01 != 0 | dead]
; [else-branch: 106 | _28@203@01 == 0 | live]
(set-option :timeout 0)
(push) ; 7
; [else-branch: 106 | _28@203@01 == 0]
(assert (= _28@203@01 0))
(pop) ; 7
(pop) ; 6
(pop) ; 5
; [eval] !(__t47 == 0)
; [eval] __t47 == 0
(push) ; 5
(set-option :timeout 10)
(assert (not (= _18@184@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [then-branch: 107 | _18@184@01 != 0 | dead]
; [else-branch: 107 | _18@184@01 == 0 | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 107 | _18@184@01 == 0]
(assert (= _18@184@01 0))
(pop) ; 5
(pop) ; 4
(pop) ; 3
; [eval] !(__t2 && __t2)
; [eval] __t2 && __t2
(push) ; 3
; [then-branch: 108 | True | live]
; [else-branch: 108 | False | live]
(push) ; 4
; [then-branch: 108 | True]
(pop) ; 4
(push) ; 4
; [else-branch: 108 | False]
(assert false)
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
; [then-branch: 109 | False | dead]
; [else-branch: 109 | True | live]
(push) ; 3
; [else-branch: 109 | True]
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- builtin$havoc_bool ----------
(declare-const ret@310@01 Bool)
(declare-const ret@311@01 Bool)
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
(declare-const ret@312@01 Int)
(declare-const ret@313@01 Int)
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
(declare-const ret@314@01 $Ref)
(declare-const ret@315@01 $Ref)
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
